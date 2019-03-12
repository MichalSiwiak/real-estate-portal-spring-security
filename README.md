# Example of a real estate portal

<h5>This application presents portal implementation of selling flats using spring mvc, spring
                            security and spring data. The application saves each advertisement in the database with a
                            photo of the apartment
                            as blob format. When the user saves a photo, a thumbnail of the image is created for display
                            on the home page. The database is refreshed once a day at night with sample data.</h5>
                        <h5><b>To add a new advertisement the user must be logged in.</b></h5>
                        <h5>The application supports operations:</h5>
                        <h5>
                            <ul>
                                <li>creating new user using spring security database,</li>
                                <li>logging to portal using spring security database,</li>
                                <li>resetting the user password if it is forgotten and sending new password by e-mail,</li>
                                <li>adding a new house advertisement,</li>
                                <li>viewing advertisements for sale of apartments,</li>
                                <li>filtering advertisements by price range, city and title.</li>
                            </ul>
                        </h5>
                        <h5><b>Back End: </b>Java, Spring MVC, Spring Data, Hibernate, MySQL.</h5>
                        <h5><b>Front End: </b>HTML, CSS, JSP.</h5>
                        <h5>To run application create database from sql script and, git clone
                            https://github.com/MichalSiwiak/real-estate-portal-spring-security.git,
                            upload and run application using tomcat application server or similar.</h5>
                        <h5>Demo View: <a href="https://www.coffeecoding.net/flats/demo">https://www.coffeecoding.net/flats/demo</a>