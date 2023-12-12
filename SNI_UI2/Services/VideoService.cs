using System.Collections.Generic;
using System.Data.SqlClient;
using SNI_UI2.CAPA_NEGOCIO;

namespace SNI_UI2.Services
{
    public class VideoService
    {
        private readonly string _connectionString;

        public VideoService(string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<Video> GetVideos()
        {
            List<Video> videos = new List<Video>();
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                string query = "SELECT Id, URL, Titulo, Descripcion, Tipo, ImagenURL FROM Videos";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Video video = new Video
                            {
                                Id = reader.GetInt32(0),
                                URL = reader.GetString(1),
                                Titulo = reader.GetString(2),
                                Descripcion = reader.GetString(3),
                                Tipo = reader.GetString(4),
                                ImagenURL = reader.GetString(5)
                            };
                            videos.Add(video);
                        }
                    }
                }
            }
            return videos;
        }

        public Video GetVideoById(int videoId)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                string query = "SELECT Id, URL, Titulo, Descripcion, Tipo, ImagenURL FROM Videos WHERE Id = @VideoId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@VideoId", videoId);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Video video = new Video
                            {
                                Id = reader.GetInt32(0),
                                URL = reader.GetString(1),
                                Titulo = reader.GetString(2),
                                Descripcion = reader.GetString(3),
                                Tipo = reader.GetString(4),
                                ImagenURL = reader.GetString(5)
                            };
                            return video;
                        }
                    }
                }
            }
            return null;
        }
    }
}
