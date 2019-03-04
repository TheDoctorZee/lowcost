package com.epam.lowcost.repositories;

import com.epam.lowcost.model.Airport;
import com.epam.lowcost.model.Flight;
import com.itextpdf.styledxmlparser.css.page.PageMarginBoxContextNode;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Long> {
    Flight getById(Long id);
    Page<Flight> getAllByIsDeletedFalse(Pageable pageable);
    List<Flight> getAllByIsDeletedFalse();
    List<Flight> getAllByDepartureAirportAndArrivalAirportAndDepartureDateBetween(Airport departureAirport,
                                                                                  Airport arrivalAirport,
                                                                                  LocalDateTime departureDateFrom,
                                                                                  LocalDateTime departureDateTo);
    Page<Flight> getAllByDepartureAirportAndArrivalAirportAndDepartureDateBetween(Airport departureAirport,
                                                                                  Airport arrivalAirport,
                                                                                  LocalDateTime departureDateFrom,
                                                                                  LocalDateTime departureDateTo,
                                                                                  Pageable pageable);





}
