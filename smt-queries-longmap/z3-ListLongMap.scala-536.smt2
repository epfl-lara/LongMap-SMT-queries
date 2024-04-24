; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13524 () Bool)

(assert start!13524)

(declare-fun b!124177 () Bool)

(declare-fun b_free!2821 () Bool)

(declare-fun b_next!2821 () Bool)

(assert (=> b!124177 (= b_free!2821 (not b_next!2821))))

(declare-fun tp!10858 () Bool)

(declare-fun b_and!7621 () Bool)

(assert (=> b!124177 (= tp!10858 b_and!7621)))

(declare-fun b!124175 () Bool)

(declare-fun b_free!2823 () Bool)

(declare-fun b_next!2823 () Bool)

(assert (=> b!124175 (= b_free!2823 (not b_next!2823))))

(declare-fun tp!10857 () Bool)

(declare-fun b_and!7623 () Bool)

(assert (=> b!124175 (= tp!10857 b_and!7623)))

(declare-fun b!124164 () Bool)

(declare-fun e!81144 () Bool)

(declare-fun e!81131 () Bool)

(declare-fun mapRes!4446 () Bool)

(assert (=> b!124164 (= e!81144 (and e!81131 mapRes!4446))))

(declare-fun condMapEmpty!4445 () Bool)

(declare-datatypes ((V!3417 0))(
  ( (V!3418 (val!1458 Int)) )
))
(declare-datatypes ((array!4653 0))(
  ( (array!4654 (arr!2204 (Array (_ BitVec 32) (_ BitVec 64))) (size!2467 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1070 0))(
  ( (ValueCellFull!1070 (v!3099 V!3417)) (EmptyCell!1070) )
))
(declare-datatypes ((array!4655 0))(
  ( (array!4656 (arr!2205 (Array (_ BitVec 32) ValueCell!1070)) (size!2468 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1048 0))(
  ( (LongMapFixedSize!1049 (defaultEntry!2759 Int) (mask!7002 (_ BitVec 32)) (extraKeys!2544 (_ BitVec 32)) (zeroValue!2624 V!3417) (minValue!2624 V!3417) (_size!573 (_ BitVec 32)) (_keys!4488 array!4653) (_values!2742 array!4655) (_vacant!573 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!844 0))(
  ( (Cell!845 (v!3100 LongMapFixedSize!1048)) )
))
(declare-datatypes ((LongMap!844 0))(
  ( (LongMap!845 (underlying!433 Cell!844)) )
))
(declare-fun thiss!992 () LongMap!844)

(declare-fun mapDefault!4446 () ValueCell!1070)

(assert (=> b!124164 (= condMapEmpty!4445 (= (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1070)) mapDefault!4446)))))

(declare-fun b!124165 () Bool)

(declare-fun res!60202 () Bool)

(declare-fun e!81141 () Bool)

(assert (=> b!124165 (=> (not res!60202) (not e!81141))))

(declare-fun newMap!16 () LongMapFixedSize!1048)

(declare-fun valid!510 (LongMapFixedSize!1048) Bool)

(assert (=> b!124165 (= res!60202 (valid!510 newMap!16))))

(declare-fun b!124166 () Bool)

(declare-fun e!81138 () Bool)

(declare-fun tp_is_empty!2827 () Bool)

(assert (=> b!124166 (= e!81138 tp_is_empty!2827)))

(declare-fun mapIsEmpty!4445 () Bool)

(declare-fun mapRes!4445 () Bool)

(assert (=> mapIsEmpty!4445 mapRes!4445))

(declare-fun b!124167 () Bool)

(declare-fun e!81134 () Bool)

(assert (=> b!124167 (= e!81134 tp_is_empty!2827)))

(declare-fun b!124168 () Bool)

(assert (=> b!124168 (= e!81131 tp_is_empty!2827)))

(declare-fun b!124169 () Bool)

(declare-fun e!81137 () Bool)

(assert (=> b!124169 (= e!81137 tp_is_empty!2827)))

(declare-fun mapIsEmpty!4446 () Bool)

(assert (=> mapIsEmpty!4446 mapRes!4446))

(declare-fun b!124170 () Bool)

(declare-fun e!81140 () Bool)

(declare-fun e!81135 () Bool)

(assert (=> b!124170 (= e!81140 e!81135)))

(declare-fun res!60201 () Bool)

(assert (=> b!124170 (=> (not res!60201) (not e!81135))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2510 0))(
  ( (tuple2!2511 (_1!1266 (_ BitVec 64)) (_2!1266 V!3417)) )
))
(declare-datatypes ((List!1672 0))(
  ( (Nil!1669) (Cons!1668 (h!2269 tuple2!2510) (t!5979 List!1672)) )
))
(declare-datatypes ((ListLongMap!1625 0))(
  ( (ListLongMap!1626 (toList!828 List!1672)) )
))
(declare-fun lt!63856 () ListLongMap!1625)

(declare-fun contains!859 (ListLongMap!1625 (_ BitVec 64)) Bool)

(assert (=> b!124170 (= res!60201 (contains!859 lt!63856 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2512 0))(
  ( (tuple2!2513 (_1!1267 Bool) (_2!1267 LongMapFixedSize!1048)) )
))
(declare-fun lt!63858 () tuple2!2512)

(declare-fun update!183 (LongMapFixedSize!1048 (_ BitVec 64) V!3417) tuple2!2512)

(declare-fun get!1440 (ValueCell!1070 V!3417) V!3417)

(declare-fun dynLambda!413 (Int (_ BitVec 64)) V!3417)

(assert (=> b!124170 (= lt!63858 (update!183 newMap!16 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!124171 () Bool)

(assert (=> b!124171 (= e!81141 e!81140)))

(declare-fun res!60200 () Bool)

(assert (=> b!124171 (=> (not res!60200) (not e!81140))))

(declare-fun lt!63857 () ListLongMap!1625)

(assert (=> b!124171 (= res!60200 (and (= lt!63857 lt!63856) (not (= (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1373 (LongMapFixedSize!1048) ListLongMap!1625)

(assert (=> b!124171 (= lt!63856 (map!1373 newMap!16))))

(declare-fun getCurrentListMap!509 (array!4653 array!4655 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 32) Int) ListLongMap!1625)

(assert (=> b!124171 (= lt!63857 (getCurrentListMap!509 (_keys!4488 (v!3100 (underlying!433 thiss!992))) (_values!2742 (v!3100 (underlying!433 thiss!992))) (mask!7002 (v!3100 (underlying!433 thiss!992))) (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) (zeroValue!2624 (v!3100 (underlying!433 thiss!992))) (minValue!2624 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun mapNonEmpty!4445 () Bool)

(declare-fun tp!10859 () Bool)

(assert (=> mapNonEmpty!4445 (= mapRes!4446 (and tp!10859 e!81138))))

(declare-fun mapKey!4446 () (_ BitVec 32))

(declare-fun mapRest!4445 () (Array (_ BitVec 32) ValueCell!1070))

(declare-fun mapValue!4446 () ValueCell!1070)

(assert (=> mapNonEmpty!4445 (= (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) (store mapRest!4445 mapKey!4446 mapValue!4446))))

(declare-fun res!60205 () Bool)

(assert (=> start!13524 (=> (not res!60205) (not e!81141))))

(declare-fun valid!511 (LongMap!844) Bool)

(assert (=> start!13524 (= res!60205 (valid!511 thiss!992))))

(assert (=> start!13524 e!81141))

(declare-fun e!81143 () Bool)

(assert (=> start!13524 e!81143))

(assert (=> start!13524 true))

(declare-fun e!81136 () Bool)

(assert (=> start!13524 e!81136))

(declare-fun b!124172 () Bool)

(declare-fun e!81133 () Bool)

(assert (=> b!124172 (= e!81133 (and e!81134 mapRes!4445))))

(declare-fun condMapEmpty!4446 () Bool)

(declare-fun mapDefault!4445 () ValueCell!1070)

(assert (=> b!124172 (= condMapEmpty!4446 (= (arr!2205 (_values!2742 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1070)) mapDefault!4445)))))

(declare-fun b!124173 () Bool)

(declare-fun e!81139 () Bool)

(assert (=> b!124173 (= e!81143 e!81139)))

(declare-fun b!124174 () Bool)

(declare-fun res!60204 () Bool)

(assert (=> b!124174 (=> (not res!60204) (not e!81141))))

(assert (=> b!124174 (= res!60204 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2467 (_keys!4488 (v!3100 (underlying!433 thiss!992)))))))))

(declare-fun mapNonEmpty!4446 () Bool)

(declare-fun tp!10860 () Bool)

(assert (=> mapNonEmpty!4446 (= mapRes!4445 (and tp!10860 e!81137))))

(declare-fun mapRest!4446 () (Array (_ BitVec 32) ValueCell!1070))

(declare-fun mapValue!4445 () ValueCell!1070)

(declare-fun mapKey!4445 () (_ BitVec 32))

(assert (=> mapNonEmpty!4446 (= (arr!2205 (_values!2742 newMap!16)) (store mapRest!4446 mapKey!4445 mapValue!4445))))

(declare-fun array_inv!1379 (array!4653) Bool)

(declare-fun array_inv!1380 (array!4655) Bool)

(assert (=> b!124175 (= e!81136 (and tp!10857 tp_is_empty!2827 (array_inv!1379 (_keys!4488 newMap!16)) (array_inv!1380 (_values!2742 newMap!16)) e!81133))))

(declare-fun b!124176 () Bool)

(declare-fun res!60203 () Bool)

(assert (=> b!124176 (=> (not res!60203) (not e!81141))))

(assert (=> b!124176 (= res!60203 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7002 newMap!16)) (_size!573 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun e!81132 () Bool)

(assert (=> b!124177 (= e!81132 (and tp!10858 tp_is_empty!2827 (array_inv!1379 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (array_inv!1380 (_values!2742 (v!3100 (underlying!433 thiss!992)))) e!81144))))

(declare-fun b!124178 () Bool)

(assert (=> b!124178 (= e!81139 e!81132)))

(declare-fun b!124179 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!124179 (= e!81135 (not (validMask!0 (mask!7002 (v!3100 (underlying!433 thiss!992))))))))

(assert (= (and start!13524 res!60205) b!124174))

(assert (= (and b!124174 res!60204) b!124165))

(assert (= (and b!124165 res!60202) b!124176))

(assert (= (and b!124176 res!60203) b!124171))

(assert (= (and b!124171 res!60200) b!124170))

(assert (= (and b!124170 res!60201) b!124179))

(assert (= (and b!124164 condMapEmpty!4445) mapIsEmpty!4446))

(assert (= (and b!124164 (not condMapEmpty!4445)) mapNonEmpty!4445))

(get-info :version)

(assert (= (and mapNonEmpty!4445 ((_ is ValueCellFull!1070) mapValue!4446)) b!124166))

(assert (= (and b!124164 ((_ is ValueCellFull!1070) mapDefault!4446)) b!124168))

(assert (= b!124177 b!124164))

(assert (= b!124178 b!124177))

(assert (= b!124173 b!124178))

(assert (= start!13524 b!124173))

(assert (= (and b!124172 condMapEmpty!4446) mapIsEmpty!4445))

(assert (= (and b!124172 (not condMapEmpty!4446)) mapNonEmpty!4446))

(assert (= (and mapNonEmpty!4446 ((_ is ValueCellFull!1070) mapValue!4445)) b!124169))

(assert (= (and b!124172 ((_ is ValueCellFull!1070) mapDefault!4445)) b!124167))

(assert (= b!124175 b!124172))

(assert (= start!13524 b!124175))

(declare-fun b_lambda!5463 () Bool)

(assert (=> (not b_lambda!5463) (not b!124170)))

(declare-fun t!5976 () Bool)

(declare-fun tb!2269 () Bool)

(assert (=> (and b!124177 (= (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992)))) t!5976) tb!2269))

(declare-fun result!3775 () Bool)

(assert (=> tb!2269 (= result!3775 tp_is_empty!2827)))

(assert (=> b!124170 t!5976))

(declare-fun b_and!7625 () Bool)

(assert (= b_and!7621 (and (=> t!5976 result!3775) b_and!7625)))

(declare-fun tb!2271 () Bool)

(declare-fun t!5978 () Bool)

(assert (=> (and b!124175 (= (defaultEntry!2759 newMap!16) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992)))) t!5978) tb!2271))

(declare-fun result!3779 () Bool)

(assert (= result!3779 result!3775))

(assert (=> b!124170 t!5978))

(declare-fun b_and!7627 () Bool)

(assert (= b_and!7623 (and (=> t!5978 result!3779) b_and!7627)))

(declare-fun m!144549 () Bool)

(assert (=> mapNonEmpty!4446 m!144549))

(declare-fun m!144551 () Bool)

(assert (=> b!124179 m!144551))

(declare-fun m!144553 () Bool)

(assert (=> b!124171 m!144553))

(declare-fun m!144555 () Bool)

(assert (=> b!124171 m!144555))

(declare-fun m!144557 () Bool)

(assert (=> b!124171 m!144557))

(declare-fun m!144559 () Bool)

(assert (=> mapNonEmpty!4445 m!144559))

(declare-fun m!144561 () Bool)

(assert (=> b!124177 m!144561))

(declare-fun m!144563 () Bool)

(assert (=> b!124177 m!144563))

(declare-fun m!144565 () Bool)

(assert (=> b!124175 m!144565))

(declare-fun m!144567 () Bool)

(assert (=> b!124175 m!144567))

(assert (=> b!124170 m!144553))

(declare-fun m!144569 () Bool)

(assert (=> b!124170 m!144569))

(declare-fun m!144571 () Bool)

(assert (=> b!124170 m!144571))

(declare-fun m!144573 () Bool)

(assert (=> b!124170 m!144573))

(declare-fun m!144575 () Bool)

(assert (=> b!124170 m!144575))

(assert (=> b!124170 m!144553))

(assert (=> b!124170 m!144573))

(assert (=> b!124170 m!144553))

(assert (=> b!124170 m!144575))

(declare-fun m!144577 () Bool)

(assert (=> b!124170 m!144577))

(assert (=> b!124170 m!144571))

(declare-fun m!144579 () Bool)

(assert (=> b!124165 m!144579))

(declare-fun m!144581 () Bool)

(assert (=> start!13524 m!144581))

(check-sat (not mapNonEmpty!4445) (not b!124177) (not b!124165) (not mapNonEmpty!4446) (not b_lambda!5463) (not b_next!2821) (not b!124170) b_and!7627 tp_is_empty!2827 b_and!7625 (not b!124175) (not b_next!2823) (not start!13524) (not b!124179) (not b!124171))
(check-sat b_and!7625 b_and!7627 (not b_next!2821) (not b_next!2823))
(get-model)

(declare-fun b_lambda!5469 () Bool)

(assert (= b_lambda!5463 (or (and b!124177 b_free!2821) (and b!124175 b_free!2823 (= (defaultEntry!2759 newMap!16) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))))) b_lambda!5469)))

(check-sat (not mapNonEmpty!4445) (not b!124177) (not b!124165) (not mapNonEmpty!4446) (not b_next!2821) (not b!124170) (not b_lambda!5469) b_and!7627 tp_is_empty!2827 b_and!7625 (not b!124175) (not b_next!2823) (not start!13524) (not b!124179) (not b!124171))
(check-sat b_and!7625 b_and!7627 (not b_next!2821) (not b_next!2823))
(get-model)

(declare-fun d!37467 () Bool)

(assert (=> d!37467 (= (validMask!0 (mask!7002 (v!3100 (underlying!433 thiss!992)))) (and (or (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000001111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000011111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000001111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000011111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000001111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000011111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000001111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000011111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000000111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000001111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000011111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000000111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000001111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000011111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000000111111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000001111111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000011111111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000000111111111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000001111111111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000011111111111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00000111111111111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00001111111111111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00011111111111111111111111111111) (= (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7002 (v!3100 (underlying!433 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!124179 d!37467))

(declare-fun d!37469 () Bool)

(declare-fun res!60248 () Bool)

(declare-fun e!81238 () Bool)

(assert (=> d!37469 (=> (not res!60248) (not e!81238))))

(declare-fun simpleValid!85 (LongMapFixedSize!1048) Bool)

(assert (=> d!37469 (= res!60248 (simpleValid!85 newMap!16))))

(assert (=> d!37469 (= (valid!510 newMap!16) e!81238)))

(declare-fun b!124288 () Bool)

(declare-fun res!60249 () Bool)

(assert (=> b!124288 (=> (not res!60249) (not e!81238))))

(declare-fun arrayCountValidKeys!0 (array!4653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!124288 (= res!60249 (= (arrayCountValidKeys!0 (_keys!4488 newMap!16) #b00000000000000000000000000000000 (size!2467 (_keys!4488 newMap!16))) (_size!573 newMap!16)))))

(declare-fun b!124289 () Bool)

(declare-fun res!60250 () Bool)

(assert (=> b!124289 (=> (not res!60250) (not e!81238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4653 (_ BitVec 32)) Bool)

(assert (=> b!124289 (= res!60250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4488 newMap!16) (mask!7002 newMap!16)))))

(declare-fun b!124290 () Bool)

(declare-datatypes ((List!1675 0))(
  ( (Nil!1672) (Cons!1671 (h!2272 (_ BitVec 64)) (t!5990 List!1675)) )
))
(declare-fun arrayNoDuplicates!0 (array!4653 (_ BitVec 32) List!1675) Bool)

(assert (=> b!124290 (= e!81238 (arrayNoDuplicates!0 (_keys!4488 newMap!16) #b00000000000000000000000000000000 Nil!1672))))

(assert (= (and d!37469 res!60248) b!124288))

(assert (= (and b!124288 res!60249) b!124289))

(assert (= (and b!124289 res!60250) b!124290))

(declare-fun m!144651 () Bool)

(assert (=> d!37469 m!144651))

(declare-fun m!144653 () Bool)

(assert (=> b!124288 m!144653))

(declare-fun m!144655 () Bool)

(assert (=> b!124289 m!144655))

(declare-fun m!144657 () Bool)

(assert (=> b!124290 m!144657))

(assert (=> b!124165 d!37469))

(declare-fun d!37471 () Bool)

(assert (=> d!37471 (= (valid!511 thiss!992) (valid!510 (v!3100 (underlying!433 thiss!992))))))

(declare-fun bs!5162 () Bool)

(assert (= bs!5162 d!37471))

(declare-fun m!144659 () Bool)

(assert (=> bs!5162 m!144659))

(assert (=> start!13524 d!37471))

(declare-fun d!37473 () Bool)

(assert (=> d!37473 (= (array_inv!1379 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (bvsge (size!2467 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124177 d!37473))

(declare-fun d!37475 () Bool)

(assert (=> d!37475 (= (array_inv!1380 (_values!2742 (v!3100 (underlying!433 thiss!992)))) (bvsge (size!2468 (_values!2742 (v!3100 (underlying!433 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124177 d!37475))

(declare-fun d!37477 () Bool)

(assert (=> d!37477 (= (map!1373 newMap!16) (getCurrentListMap!509 (_keys!4488 newMap!16) (_values!2742 newMap!16) (mask!7002 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)))))

(declare-fun bs!5163 () Bool)

(assert (= bs!5163 d!37477))

(declare-fun m!144661 () Bool)

(assert (=> bs!5163 m!144661))

(assert (=> b!124171 d!37477))

(declare-fun b!124333 () Bool)

(declare-fun e!81265 () ListLongMap!1625)

(declare-fun call!13175 () ListLongMap!1625)

(assert (=> b!124333 (= e!81265 call!13175)))

(declare-fun b!124334 () Bool)

(declare-fun e!81271 () Bool)

(declare-fun call!13181 () Bool)

(assert (=> b!124334 (= e!81271 (not call!13181))))

(declare-fun b!124335 () Bool)

(declare-fun res!60273 () Bool)

(declare-fun e!81267 () Bool)

(assert (=> b!124335 (=> (not res!60273) (not e!81267))))

(assert (=> b!124335 (= res!60273 e!81271)))

(declare-fun c!22611 () Bool)

(assert (=> b!124335 (= c!22611 (not (= (bvand (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124336 () Bool)

(declare-fun res!60275 () Bool)

(assert (=> b!124336 (=> (not res!60275) (not e!81267))))

(declare-fun e!81276 () Bool)

(assert (=> b!124336 (= res!60275 e!81276)))

(declare-fun res!60272 () Bool)

(assert (=> b!124336 (=> res!60272 e!81276)))

(declare-fun e!81277 () Bool)

(assert (=> b!124336 (= res!60272 (not e!81277))))

(declare-fun res!60270 () Bool)

(assert (=> b!124336 (=> (not res!60270) (not e!81277))))

(assert (=> b!124336 (= res!60270 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2467 (_keys!4488 (v!3100 (underlying!433 thiss!992))))))))

(declare-fun b!124337 () Bool)

(declare-datatypes ((Unit!3865 0))(
  ( (Unit!3866) )
))
(declare-fun e!81269 () Unit!3865)

(declare-fun lt!63935 () Unit!3865)

(assert (=> b!124337 (= e!81269 lt!63935)))

(declare-fun lt!63924 () ListLongMap!1625)

(declare-fun getCurrentListMapNoExtraKeys!129 (array!4653 array!4655 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 32) Int) ListLongMap!1625)

(assert (=> b!124337 (= lt!63924 (getCurrentListMapNoExtraKeys!129 (_keys!4488 (v!3100 (underlying!433 thiss!992))) (_values!2742 (v!3100 (underlying!433 thiss!992))) (mask!7002 (v!3100 (underlying!433 thiss!992))) (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) (zeroValue!2624 (v!3100 (underlying!433 thiss!992))) (minValue!2624 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun lt!63933 () (_ BitVec 64))

(assert (=> b!124337 (= lt!63933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63928 () (_ BitVec 64))

(assert (=> b!124337 (= lt!63928 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63939 () Unit!3865)

(declare-fun addStillContains!85 (ListLongMap!1625 (_ BitVec 64) V!3417 (_ BitVec 64)) Unit!3865)

(assert (=> b!124337 (= lt!63939 (addStillContains!85 lt!63924 lt!63933 (zeroValue!2624 (v!3100 (underlying!433 thiss!992))) lt!63928))))

(declare-fun +!162 (ListLongMap!1625 tuple2!2510) ListLongMap!1625)

(assert (=> b!124337 (contains!859 (+!162 lt!63924 (tuple2!2511 lt!63933 (zeroValue!2624 (v!3100 (underlying!433 thiss!992))))) lt!63928)))

(declare-fun lt!63921 () Unit!3865)

(assert (=> b!124337 (= lt!63921 lt!63939)))

(declare-fun lt!63929 () ListLongMap!1625)

(assert (=> b!124337 (= lt!63929 (getCurrentListMapNoExtraKeys!129 (_keys!4488 (v!3100 (underlying!433 thiss!992))) (_values!2742 (v!3100 (underlying!433 thiss!992))) (mask!7002 (v!3100 (underlying!433 thiss!992))) (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) (zeroValue!2624 (v!3100 (underlying!433 thiss!992))) (minValue!2624 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun lt!63923 () (_ BitVec 64))

(assert (=> b!124337 (= lt!63923 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63934 () (_ BitVec 64))

(assert (=> b!124337 (= lt!63934 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63922 () Unit!3865)

(declare-fun addApplyDifferent!85 (ListLongMap!1625 (_ BitVec 64) V!3417 (_ BitVec 64)) Unit!3865)

(assert (=> b!124337 (= lt!63922 (addApplyDifferent!85 lt!63929 lt!63923 (minValue!2624 (v!3100 (underlying!433 thiss!992))) lt!63934))))

(declare-fun apply!109 (ListLongMap!1625 (_ BitVec 64)) V!3417)

(assert (=> b!124337 (= (apply!109 (+!162 lt!63929 (tuple2!2511 lt!63923 (minValue!2624 (v!3100 (underlying!433 thiss!992))))) lt!63934) (apply!109 lt!63929 lt!63934))))

(declare-fun lt!63941 () Unit!3865)

(assert (=> b!124337 (= lt!63941 lt!63922)))

(declare-fun lt!63942 () ListLongMap!1625)

(assert (=> b!124337 (= lt!63942 (getCurrentListMapNoExtraKeys!129 (_keys!4488 (v!3100 (underlying!433 thiss!992))) (_values!2742 (v!3100 (underlying!433 thiss!992))) (mask!7002 (v!3100 (underlying!433 thiss!992))) (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) (zeroValue!2624 (v!3100 (underlying!433 thiss!992))) (minValue!2624 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun lt!63926 () (_ BitVec 64))

(assert (=> b!124337 (= lt!63926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63937 () (_ BitVec 64))

(assert (=> b!124337 (= lt!63937 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63927 () Unit!3865)

(assert (=> b!124337 (= lt!63927 (addApplyDifferent!85 lt!63942 lt!63926 (zeroValue!2624 (v!3100 (underlying!433 thiss!992))) lt!63937))))

(assert (=> b!124337 (= (apply!109 (+!162 lt!63942 (tuple2!2511 lt!63926 (zeroValue!2624 (v!3100 (underlying!433 thiss!992))))) lt!63937) (apply!109 lt!63942 lt!63937))))

(declare-fun lt!63940 () Unit!3865)

(assert (=> b!124337 (= lt!63940 lt!63927)))

(declare-fun lt!63930 () ListLongMap!1625)

(assert (=> b!124337 (= lt!63930 (getCurrentListMapNoExtraKeys!129 (_keys!4488 (v!3100 (underlying!433 thiss!992))) (_values!2742 (v!3100 (underlying!433 thiss!992))) (mask!7002 (v!3100 (underlying!433 thiss!992))) (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) (zeroValue!2624 (v!3100 (underlying!433 thiss!992))) (minValue!2624 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun lt!63936 () (_ BitVec 64))

(assert (=> b!124337 (= lt!63936 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63931 () (_ BitVec 64))

(assert (=> b!124337 (= lt!63931 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!124337 (= lt!63935 (addApplyDifferent!85 lt!63930 lt!63936 (minValue!2624 (v!3100 (underlying!433 thiss!992))) lt!63931))))

(assert (=> b!124337 (= (apply!109 (+!162 lt!63930 (tuple2!2511 lt!63936 (minValue!2624 (v!3100 (underlying!433 thiss!992))))) lt!63931) (apply!109 lt!63930 lt!63931))))

(declare-fun b!124338 () Bool)

(declare-fun e!81272 () Bool)

(declare-fun lt!63925 () ListLongMap!1625)

(assert (=> b!124338 (= e!81272 (= (apply!109 lt!63925 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2624 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun b!124339 () Bool)

(declare-fun e!81275 () Bool)

(declare-fun e!81268 () Bool)

(assert (=> b!124339 (= e!81275 e!81268)))

(declare-fun res!60276 () Bool)

(declare-fun call!13177 () Bool)

(assert (=> b!124339 (= res!60276 call!13177)))

(assert (=> b!124339 (=> (not res!60276) (not e!81268))))

(declare-fun b!124340 () Bool)

(declare-fun call!13179 () ListLongMap!1625)

(assert (=> b!124340 (= e!81265 call!13179)))

(declare-fun b!124341 () Bool)

(declare-fun c!22614 () Bool)

(assert (=> b!124341 (= c!22614 (and (not (= (bvand (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!81273 () ListLongMap!1625)

(assert (=> b!124341 (= e!81273 e!81265)))

(declare-fun b!124342 () Bool)

(declare-fun e!81274 () Bool)

(assert (=> b!124342 (= e!81276 e!81274)))

(declare-fun res!60269 () Bool)

(assert (=> b!124342 (=> (not res!60269) (not e!81274))))

(assert (=> b!124342 (= res!60269 (contains!859 lt!63925 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124342 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2467 (_keys!4488 (v!3100 (underlying!433 thiss!992))))))))

(declare-fun bm!13172 () Bool)

(declare-fun call!13178 () ListLongMap!1625)

(assert (=> bm!13172 (= call!13178 (getCurrentListMapNoExtraKeys!129 (_keys!4488 (v!3100 (underlying!433 thiss!992))) (_values!2742 (v!3100 (underlying!433 thiss!992))) (mask!7002 (v!3100 (underlying!433 thiss!992))) (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) (zeroValue!2624 (v!3100 (underlying!433 thiss!992))) (minValue!2624 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun bm!13173 () Bool)

(declare-fun call!13176 () ListLongMap!1625)

(assert (=> bm!13173 (= call!13179 call!13176)))

(declare-fun bm!13174 () Bool)

(assert (=> bm!13174 (= call!13176 call!13178)))

(declare-fun b!124343 () Bool)

(declare-fun e!81270 () ListLongMap!1625)

(assert (=> b!124343 (= e!81270 e!81273)))

(declare-fun c!22613 () Bool)

(assert (=> b!124343 (= c!22613 (and (not (= (bvand (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13175 () Bool)

(declare-fun call!13180 () ListLongMap!1625)

(assert (=> bm!13175 (= call!13175 call!13180)))

(declare-fun b!124344 () Bool)

(assert (=> b!124344 (= e!81268 (= (apply!109 lt!63925 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2624 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun b!124345 () Bool)

(assert (=> b!124345 (= e!81275 (not call!13177))))

(declare-fun b!124346 () Bool)

(assert (=> b!124346 (= e!81273 call!13175)))

(declare-fun b!124347 () Bool)

(assert (=> b!124347 (= e!81267 e!81275)))

(declare-fun c!22616 () Bool)

(assert (=> b!124347 (= c!22616 (not (= (bvand (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13176 () Bool)

(assert (=> bm!13176 (= call!13177 (contains!859 lt!63925 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!22612 () Bool)

(declare-fun bm!13177 () Bool)

(assert (=> bm!13177 (= call!13180 (+!162 (ite c!22612 call!13178 (ite c!22613 call!13176 call!13179)) (ite (or c!22612 c!22613) (tuple2!2511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2624 (v!3100 (underlying!433 thiss!992)))) (tuple2!2511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2624 (v!3100 (underlying!433 thiss!992)))))))))

(declare-fun b!124348 () Bool)

(assert (=> b!124348 (= e!81270 (+!162 call!13180 (tuple2!2511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2624 (v!3100 (underlying!433 thiss!992))))))))

(declare-fun b!124349 () Bool)

(assert (=> b!124349 (= e!81271 e!81272)))

(declare-fun res!60274 () Bool)

(assert (=> b!124349 (= res!60274 call!13181)))

(assert (=> b!124349 (=> (not res!60274) (not e!81272))))

(declare-fun b!124350 () Bool)

(declare-fun e!81266 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!124350 (= e!81266 (validKeyInArray!0 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124351 () Bool)

(assert (=> b!124351 (= e!81277 (validKeyInArray!0 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124352 () Bool)

(assert (=> b!124352 (= e!81274 (= (apply!109 lt!63925 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124352 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2468 (_values!2742 (v!3100 (underlying!433 thiss!992))))))))

(assert (=> b!124352 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2467 (_keys!4488 (v!3100 (underlying!433 thiss!992))))))))

(declare-fun d!37479 () Bool)

(assert (=> d!37479 e!81267))

(declare-fun res!60277 () Bool)

(assert (=> d!37479 (=> (not res!60277) (not e!81267))))

(assert (=> d!37479 (= res!60277 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2467 (_keys!4488 (v!3100 (underlying!433 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2467 (_keys!4488 (v!3100 (underlying!433 thiss!992))))))))))

(declare-fun lt!63938 () ListLongMap!1625)

(assert (=> d!37479 (= lt!63925 lt!63938)))

(declare-fun lt!63932 () Unit!3865)

(assert (=> d!37479 (= lt!63932 e!81269)))

(declare-fun c!22615 () Bool)

(assert (=> d!37479 (= c!22615 e!81266)))

(declare-fun res!60271 () Bool)

(assert (=> d!37479 (=> (not res!60271) (not e!81266))))

(assert (=> d!37479 (= res!60271 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2467 (_keys!4488 (v!3100 (underlying!433 thiss!992))))))))

(assert (=> d!37479 (= lt!63938 e!81270)))

(assert (=> d!37479 (= c!22612 (and (not (= (bvand (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37479 (validMask!0 (mask!7002 (v!3100 (underlying!433 thiss!992))))))

(assert (=> d!37479 (= (getCurrentListMap!509 (_keys!4488 (v!3100 (underlying!433 thiss!992))) (_values!2742 (v!3100 (underlying!433 thiss!992))) (mask!7002 (v!3100 (underlying!433 thiss!992))) (extraKeys!2544 (v!3100 (underlying!433 thiss!992))) (zeroValue!2624 (v!3100 (underlying!433 thiss!992))) (minValue!2624 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992)))) lt!63925)))

(declare-fun bm!13178 () Bool)

(assert (=> bm!13178 (= call!13181 (contains!859 lt!63925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124353 () Bool)

(declare-fun Unit!3867 () Unit!3865)

(assert (=> b!124353 (= e!81269 Unit!3867)))

(assert (= (and d!37479 c!22612) b!124348))

(assert (= (and d!37479 (not c!22612)) b!124343))

(assert (= (and b!124343 c!22613) b!124346))

(assert (= (and b!124343 (not c!22613)) b!124341))

(assert (= (and b!124341 c!22614) b!124333))

(assert (= (and b!124341 (not c!22614)) b!124340))

(assert (= (or b!124333 b!124340) bm!13173))

(assert (= (or b!124346 bm!13173) bm!13174))

(assert (= (or b!124346 b!124333) bm!13175))

(assert (= (or b!124348 bm!13174) bm!13172))

(assert (= (or b!124348 bm!13175) bm!13177))

(assert (= (and d!37479 res!60271) b!124350))

(assert (= (and d!37479 c!22615) b!124337))

(assert (= (and d!37479 (not c!22615)) b!124353))

(assert (= (and d!37479 res!60277) b!124336))

(assert (= (and b!124336 res!60270) b!124351))

(assert (= (and b!124336 (not res!60272)) b!124342))

(assert (= (and b!124342 res!60269) b!124352))

(assert (= (and b!124336 res!60275) b!124335))

(assert (= (and b!124335 c!22611) b!124349))

(assert (= (and b!124335 (not c!22611)) b!124334))

(assert (= (and b!124349 res!60274) b!124338))

(assert (= (or b!124349 b!124334) bm!13178))

(assert (= (and b!124335 res!60273) b!124347))

(assert (= (and b!124347 c!22616) b!124339))

(assert (= (and b!124347 (not c!22616)) b!124345))

(assert (= (and b!124339 res!60276) b!124344))

(assert (= (or b!124339 b!124345) bm!13176))

(declare-fun b_lambda!5471 () Bool)

(assert (=> (not b_lambda!5471) (not b!124352)))

(assert (=> b!124352 t!5976))

(declare-fun b_and!7645 () Bool)

(assert (= b_and!7625 (and (=> t!5976 result!3775) b_and!7645)))

(assert (=> b!124352 t!5978))

(declare-fun b_and!7647 () Bool)

(assert (= b_and!7627 (and (=> t!5978 result!3779) b_and!7647)))

(declare-fun m!144663 () Bool)

(assert (=> b!124342 m!144663))

(assert (=> b!124342 m!144663))

(declare-fun m!144665 () Bool)

(assert (=> b!124342 m!144665))

(declare-fun m!144667 () Bool)

(assert (=> bm!13178 m!144667))

(assert (=> d!37479 m!144551))

(declare-fun m!144669 () Bool)

(assert (=> b!124352 m!144669))

(assert (=> b!124352 m!144573))

(declare-fun m!144671 () Bool)

(assert (=> b!124352 m!144671))

(assert (=> b!124352 m!144573))

(assert (=> b!124352 m!144663))

(assert (=> b!124352 m!144663))

(declare-fun m!144673 () Bool)

(assert (=> b!124352 m!144673))

(assert (=> b!124352 m!144669))

(declare-fun m!144675 () Bool)

(assert (=> b!124338 m!144675))

(declare-fun m!144677 () Bool)

(assert (=> bm!13172 m!144677))

(declare-fun m!144679 () Bool)

(assert (=> bm!13176 m!144679))

(declare-fun m!144681 () Bool)

(assert (=> bm!13177 m!144681))

(assert (=> b!124350 m!144663))

(assert (=> b!124350 m!144663))

(declare-fun m!144683 () Bool)

(assert (=> b!124350 m!144683))

(declare-fun m!144685 () Bool)

(assert (=> b!124348 m!144685))

(declare-fun m!144687 () Bool)

(assert (=> b!124337 m!144687))

(declare-fun m!144689 () Bool)

(assert (=> b!124337 m!144689))

(declare-fun m!144691 () Bool)

(assert (=> b!124337 m!144691))

(declare-fun m!144693 () Bool)

(assert (=> b!124337 m!144693))

(declare-fun m!144695 () Bool)

(assert (=> b!124337 m!144695))

(declare-fun m!144697 () Bool)

(assert (=> b!124337 m!144697))

(declare-fun m!144699 () Bool)

(assert (=> b!124337 m!144699))

(declare-fun m!144701 () Bool)

(assert (=> b!124337 m!144701))

(declare-fun m!144703 () Bool)

(assert (=> b!124337 m!144703))

(declare-fun m!144705 () Bool)

(assert (=> b!124337 m!144705))

(declare-fun m!144707 () Bool)

(assert (=> b!124337 m!144707))

(declare-fun m!144709 () Bool)

(assert (=> b!124337 m!144709))

(assert (=> b!124337 m!144663))

(assert (=> b!124337 m!144705))

(assert (=> b!124337 m!144677))

(assert (=> b!124337 m!144699))

(declare-fun m!144711 () Bool)

(assert (=> b!124337 m!144711))

(assert (=> b!124337 m!144693))

(assert (=> b!124337 m!144703))

(declare-fun m!144713 () Bool)

(assert (=> b!124337 m!144713))

(declare-fun m!144715 () Bool)

(assert (=> b!124337 m!144715))

(declare-fun m!144717 () Bool)

(assert (=> b!124344 m!144717))

(assert (=> b!124351 m!144663))

(assert (=> b!124351 m!144663))

(assert (=> b!124351 m!144683))

(assert (=> b!124171 d!37479))

(declare-fun d!37481 () Bool)

(assert (=> d!37481 (= (array_inv!1379 (_keys!4488 newMap!16)) (bvsge (size!2467 (_keys!4488 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124175 d!37481))

(declare-fun d!37483 () Bool)

(assert (=> d!37483 (= (array_inv!1380 (_values!2742 newMap!16)) (bvsge (size!2468 (_values!2742 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124175 d!37483))

(declare-fun d!37485 () Bool)

(declare-fun e!81283 () Bool)

(assert (=> d!37485 e!81283))

(declare-fun res!60280 () Bool)

(assert (=> d!37485 (=> res!60280 e!81283)))

(declare-fun lt!63951 () Bool)

(assert (=> d!37485 (= res!60280 (not lt!63951))))

(declare-fun lt!63952 () Bool)

(assert (=> d!37485 (= lt!63951 lt!63952)))

(declare-fun lt!63954 () Unit!3865)

(declare-fun e!81282 () Unit!3865)

(assert (=> d!37485 (= lt!63954 e!81282)))

(declare-fun c!22619 () Bool)

(assert (=> d!37485 (= c!22619 lt!63952)))

(declare-fun containsKey!169 (List!1672 (_ BitVec 64)) Bool)

(assert (=> d!37485 (= lt!63952 (containsKey!169 (toList!828 lt!63856) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(assert (=> d!37485 (= (contains!859 lt!63856 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355)) lt!63951)))

(declare-fun b!124360 () Bool)

(declare-fun lt!63953 () Unit!3865)

(assert (=> b!124360 (= e!81282 lt!63953)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!117 (List!1672 (_ BitVec 64)) Unit!3865)

(assert (=> b!124360 (= lt!63953 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!828 lt!63856) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-datatypes ((Option!172 0))(
  ( (Some!171 (v!3106 V!3417)) (None!170) )
))
(declare-fun isDefined!118 (Option!172) Bool)

(declare-fun getValueByKey!166 (List!1672 (_ BitVec 64)) Option!172)

(assert (=> b!124360 (isDefined!118 (getValueByKey!166 (toList!828 lt!63856) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun b!124361 () Bool)

(declare-fun Unit!3868 () Unit!3865)

(assert (=> b!124361 (= e!81282 Unit!3868)))

(declare-fun b!124362 () Bool)

(assert (=> b!124362 (= e!81283 (isDefined!118 (getValueByKey!166 (toList!828 lt!63856) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355))))))

(assert (= (and d!37485 c!22619) b!124360))

(assert (= (and d!37485 (not c!22619)) b!124361))

(assert (= (and d!37485 (not res!60280)) b!124362))

(assert (=> d!37485 m!144553))

(declare-fun m!144719 () Bool)

(assert (=> d!37485 m!144719))

(assert (=> b!124360 m!144553))

(declare-fun m!144721 () Bool)

(assert (=> b!124360 m!144721))

(assert (=> b!124360 m!144553))

(declare-fun m!144723 () Bool)

(assert (=> b!124360 m!144723))

(assert (=> b!124360 m!144723))

(declare-fun m!144725 () Bool)

(assert (=> b!124360 m!144725))

(assert (=> b!124362 m!144553))

(assert (=> b!124362 m!144723))

(assert (=> b!124362 m!144723))

(assert (=> b!124362 m!144725))

(assert (=> b!124170 d!37485))

(declare-fun b!124443 () Bool)

(declare-fun lt!64028 () Unit!3865)

(declare-fun lt!64014 () Unit!3865)

(assert (=> b!124443 (= lt!64028 lt!64014)))

(declare-fun call!13235 () Bool)

(assert (=> b!124443 call!13235))

(declare-fun lt!64016 () array!4655)

(declare-datatypes ((SeekEntryResult!262 0))(
  ( (MissingZero!262 (index!3202 (_ BitVec 32))) (Found!262 (index!3203 (_ BitVec 32))) (Intermediate!262 (undefined!1074 Bool) (index!3204 (_ BitVec 32)) (x!14771 (_ BitVec 32))) (Undefined!262) (MissingVacant!262 (index!3205 (_ BitVec 32))) )
))
(declare-fun lt!64011 () SeekEntryResult!262)

(declare-fun lemmaValidKeyInArrayIsInListMap!114 (array!4653 array!4655 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 32) Int) Unit!3865)

(assert (=> b!124443 (= lt!64014 (lemmaValidKeyInArrayIsInListMap!114 (_keys!4488 newMap!16) lt!64016 (mask!7002 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (index!3203 lt!64011) (defaultEntry!2759 newMap!16)))))

(assert (=> b!124443 (= lt!64016 (array!4656 (store (arr!2205 (_values!2742 newMap!16)) (index!3203 lt!64011) (ValueCellFull!1070 (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2468 (_values!2742 newMap!16))))))

(declare-fun lt!64018 () Unit!3865)

(declare-fun lt!64013 () Unit!3865)

(assert (=> b!124443 (= lt!64018 lt!64013)))

(declare-fun call!13246 () ListLongMap!1625)

(declare-fun call!13234 () ListLongMap!1625)

(assert (=> b!124443 (= call!13246 call!13234)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!54 (array!4653 array!4655 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 32) (_ BitVec 64) V!3417 Int) Unit!3865)

(assert (=> b!124443 (= lt!64013 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!54 (_keys!4488 newMap!16) (_values!2742 newMap!16) (mask!7002 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (index!3203 lt!64011) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2759 newMap!16)))))

(declare-fun lt!64009 () Unit!3865)

(declare-fun e!81332 () Unit!3865)

(assert (=> b!124443 (= lt!64009 e!81332)))

(declare-fun c!22648 () Bool)

(assert (=> b!124443 (= c!22648 (contains!859 (getCurrentListMap!509 (_keys!4488 newMap!16) (_values!2742 newMap!16) (mask!7002 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun e!81328 () tuple2!2512)

(assert (=> b!124443 (= e!81328 (tuple2!2513 true (LongMapFixedSize!1049 (defaultEntry!2759 newMap!16) (mask!7002 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (_size!573 newMap!16) (_keys!4488 newMap!16) (array!4656 (store (arr!2205 (_values!2742 newMap!16)) (index!3203 lt!64011) (ValueCellFull!1070 (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2468 (_values!2742 newMap!16))) (_vacant!573 newMap!16))))))

(declare-fun bm!13227 () Bool)

(declare-fun call!13245 () Bool)

(declare-fun call!13252 () Bool)

(assert (=> bm!13227 (= call!13245 call!13252)))

(declare-fun bm!13228 () Bool)

(declare-fun call!13231 () SeekEntryResult!262)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4653 (_ BitVec 32)) SeekEntryResult!262)

(assert (=> bm!13228 (= call!13231 (seekEntryOrOpen!0 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (_keys!4488 newMap!16) (mask!7002 newMap!16)))))

(declare-fun b!124444 () Bool)

(declare-fun e!81341 () tuple2!2512)

(declare-fun lt!64017 () tuple2!2512)

(assert (=> b!124444 (= e!81341 (tuple2!2513 (_1!1267 lt!64017) (_2!1267 lt!64017)))))

(declare-fun call!13253 () tuple2!2512)

(assert (=> b!124444 (= lt!64017 call!13253)))

(declare-fun b!124445 () Bool)

(declare-fun e!81330 () Bool)

(declare-fun call!13247 () Bool)

(assert (=> b!124445 (= e!81330 (not call!13247))))

(declare-fun bm!13229 () Bool)

(declare-fun call!13230 () Bool)

(declare-fun call!13249 () Bool)

(assert (=> bm!13229 (= call!13230 call!13249)))

(declare-fun b!124446 () Bool)

(declare-fun lt!64022 () SeekEntryResult!262)

(declare-fun e!81327 () Bool)

(assert (=> b!124446 (= e!81327 (= (select (arr!2204 (_keys!4488 newMap!16)) (index!3203 lt!64022)) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun bm!13230 () Bool)

(declare-fun c!22653 () Bool)

(declare-fun updateHelperNewKey!54 (LongMapFixedSize!1048 (_ BitVec 64) V!3417 (_ BitVec 32)) tuple2!2512)

(assert (=> bm!13230 (= call!13253 (updateHelperNewKey!54 newMap!16 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!22653 (index!3205 lt!64011) (index!3202 lt!64011))))))

(declare-fun b!124447 () Bool)

(assert (=> b!124447 (= c!22653 ((_ is MissingVacant!262) lt!64011))))

(declare-fun e!81333 () tuple2!2512)

(assert (=> b!124447 (= e!81333 e!81341)))

(declare-fun b!124448 () Bool)

(declare-fun res!60321 () Bool)

(declare-fun e!81336 () Bool)

(assert (=> b!124448 (=> (not res!60321) (not e!81336))))

(assert (=> b!124448 (= res!60321 call!13245)))

(declare-fun e!81345 () Bool)

(assert (=> b!124448 (= e!81345 e!81336)))

(declare-fun b!124449 () Bool)

(declare-fun e!81337 () Bool)

(assert (=> b!124449 (= e!81337 e!81330)))

(declare-fun res!60313 () Bool)

(assert (=> b!124449 (= res!60313 call!13245)))

(assert (=> b!124449 (=> (not res!60313) (not e!81330))))

(declare-fun b!124450 () Bool)

(declare-fun res!60322 () Bool)

(declare-fun e!81338 () Bool)

(assert (=> b!124450 (=> (not res!60322) (not e!81338))))

(declare-fun call!13250 () Bool)

(assert (=> b!124450 (= res!60322 call!13250)))

(declare-fun e!81344 () Bool)

(assert (=> b!124450 (= e!81344 e!81338)))

(declare-fun bm!13231 () Bool)

(declare-fun call!13232 () ListLongMap!1625)

(assert (=> bm!13231 (= call!13232 call!13246)))

(declare-fun b!124451 () Bool)

(declare-fun e!81326 () tuple2!2512)

(assert (=> b!124451 (= e!81326 e!81333)))

(assert (=> b!124451 (= lt!64011 (seekEntryOrOpen!0 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (_keys!4488 newMap!16) (mask!7002 newMap!16)))))

(declare-fun c!22656 () Bool)

(assert (=> b!124451 (= c!22656 ((_ is Undefined!262) lt!64011))))

(declare-fun b!124452 () Bool)

(declare-fun res!60319 () Bool)

(assert (=> b!124452 (=> (not res!60319) (not e!81336))))

(declare-fun lt!64030 () SeekEntryResult!262)

(assert (=> b!124452 (= res!60319 (= (select (arr!2204 (_keys!4488 newMap!16)) (index!3202 lt!64030)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13232 () Bool)

(declare-fun arrayContainsKey!0 (array!4653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13232 (= call!13249 (arrayContainsKey!0 (_keys!4488 newMap!16) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!124453 () Bool)

(declare-fun lt!64033 () Unit!3865)

(declare-fun lt!64010 () Unit!3865)

(assert (=> b!124453 (= lt!64033 lt!64010)))

(declare-fun call!13244 () ListLongMap!1625)

(assert (=> b!124453 (= call!13232 call!13244)))

(declare-fun lt!64031 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!54 (array!4653 array!4655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 V!3417 Int) Unit!3865)

(assert (=> b!124453 (= lt!64010 (lemmaChangeLongMinValueKeyThenAddPairToListMap!54 (_keys!4488 newMap!16) (_values!2742 newMap!16) (mask!7002 newMap!16) (extraKeys!2544 newMap!16) lt!64031 (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2759 newMap!16)))))

(assert (=> b!124453 (= lt!64031 (bvor (extraKeys!2544 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!81346 () tuple2!2512)

(assert (=> b!124453 (= e!81346 (tuple2!2513 true (LongMapFixedSize!1049 (defaultEntry!2759 newMap!16) (mask!7002 newMap!16) (bvor (extraKeys!2544 newMap!16) #b00000000000000000000000000000010) (zeroValue!2624 newMap!16) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!573 newMap!16) (_keys!4488 newMap!16) (_values!2742 newMap!16) (_vacant!573 newMap!16))))))

(declare-fun b!124454 () Bool)

(declare-fun e!81343 () ListLongMap!1625)

(declare-fun c!22652 () Bool)

(declare-fun call!13239 () ListLongMap!1625)

(assert (=> b!124454 (= e!81343 (ite c!22652 call!13244 call!13239))))

(declare-fun bm!13233 () Bool)

(declare-fun call!13236 () ListLongMap!1625)

(declare-fun call!13238 () ListLongMap!1625)

(assert (=> bm!13233 (= call!13236 call!13238)))

(declare-fun bm!13234 () Bool)

(assert (=> bm!13234 (= call!13239 call!13234)))

(declare-fun b!124455 () Bool)

(declare-fun e!81340 () Unit!3865)

(declare-fun lt!64021 () Unit!3865)

(assert (=> b!124455 (= e!81340 lt!64021)))

(declare-fun call!13248 () Unit!3865)

(assert (=> b!124455 (= lt!64021 call!13248)))

(declare-fun call!13237 () SeekEntryResult!262)

(assert (=> b!124455 (= lt!64030 call!13237)))

(declare-fun c!22651 () Bool)

(assert (=> b!124455 (= c!22651 ((_ is MissingZero!262) lt!64030))))

(assert (=> b!124455 e!81345))

(declare-fun b!124456 () Bool)

(declare-fun res!60309 () Bool)

(assert (=> b!124456 (= res!60309 (= (select (arr!2204 (_keys!4488 newMap!16)) (index!3205 lt!64030)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124456 (=> (not res!60309) (not e!81330))))

(declare-fun b!124457 () Bool)

(declare-fun e!81334 () Bool)

(declare-fun lt!64026 () SeekEntryResult!262)

(assert (=> b!124457 (= e!81334 ((_ is Undefined!262) lt!64026))))

(declare-fun b!124458 () Bool)

(declare-fun Unit!3869 () Unit!3865)

(assert (=> b!124458 (= e!81340 Unit!3869)))

(declare-fun lt!64029 () Unit!3865)

(declare-fun call!13251 () Unit!3865)

(assert (=> b!124458 (= lt!64029 call!13251)))

(assert (=> b!124458 (= lt!64022 call!13237)))

(declare-fun res!60314 () Bool)

(assert (=> b!124458 (= res!60314 ((_ is Found!262) lt!64022))))

(assert (=> b!124458 (=> (not res!60314) (not e!81327))))

(assert (=> b!124458 e!81327))

(declare-fun lt!64015 () Unit!3865)

(assert (=> b!124458 (= lt!64015 lt!64029)))

(assert (=> b!124458 false))

(declare-fun b!124459 () Bool)

(assert (=> b!124459 (= e!81337 ((_ is Undefined!262) lt!64030))))

(declare-fun b!124460 () Bool)

(assert (=> b!124460 (= e!81326 e!81346)))

(assert (=> b!124460 (= c!22652 (= (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124461 () Bool)

(assert (=> b!124461 (= e!81338 (not call!13230))))

(declare-fun bm!13235 () Bool)

(declare-fun call!13233 () Bool)

(assert (=> bm!13235 (= call!13250 call!13233)))

(declare-fun bm!13236 () Bool)

(assert (=> bm!13236 (= call!13235 (contains!859 call!13236 (ite c!22656 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (select (arr!2204 (_keys!4488 newMap!16)) (index!3203 lt!64011)))))))

(declare-fun b!124462 () Bool)

(assert (=> b!124462 (= e!81343 (getCurrentListMap!509 (_keys!4488 newMap!16) (_values!2742 newMap!16) (mask!7002 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)))))

(declare-fun c!22649 () Bool)

(declare-fun bm!13237 () Bool)

(assert (=> bm!13237 (= call!13246 (+!162 e!81343 (ite c!22649 (ite c!22652 (tuple2!2511 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2511 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2511 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!22655 () Bool)

(assert (=> bm!13237 (= c!22655 c!22649)))

(declare-fun bm!13238 () Bool)

(declare-fun call!13241 () Bool)

(assert (=> bm!13238 (= call!13252 call!13241)))

(declare-fun bm!13239 () Bool)

(assert (=> bm!13239 (= call!13244 call!13238)))

(declare-fun bm!13240 () Bool)

(assert (=> bm!13240 (= call!13238 (getCurrentListMap!509 (_keys!4488 newMap!16) (ite (or c!22649 c!22656) (_values!2742 newMap!16) lt!64016) (mask!7002 newMap!16) (ite c!22649 (ite c!22652 (extraKeys!2544 newMap!16) lt!64031) (extraKeys!2544 newMap!16)) (zeroValue!2624 newMap!16) (ite c!22649 (ite c!22652 (minValue!2624 newMap!16) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2624 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)))))

(declare-fun b!124463 () Bool)

(assert (=> b!124463 (= e!81341 e!81328)))

(declare-fun c!22654 () Bool)

(assert (=> b!124463 (= c!22654 ((_ is MissingZero!262) lt!64011))))

(declare-fun d!37487 () Bool)

(declare-fun e!81339 () Bool)

(assert (=> d!37487 e!81339))

(declare-fun res!60317 () Bool)

(assert (=> d!37487 (=> (not res!60317) (not e!81339))))

(declare-fun lt!64034 () tuple2!2512)

(assert (=> d!37487 (= res!60317 (valid!510 (_2!1267 lt!64034)))))

(assert (=> d!37487 (= lt!64034 e!81326)))

(assert (=> d!37487 (= c!22649 (= (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (bvneg (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355))))))

(assert (=> d!37487 (valid!510 newMap!16)))

(assert (=> d!37487 (= (update!183 newMap!16 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!64034)))

(declare-fun b!124464 () Bool)

(declare-fun lt!64012 () Unit!3865)

(assert (=> b!124464 (= e!81332 lt!64012)))

(assert (=> b!124464 (= lt!64012 call!13251)))

(declare-fun lt!64027 () SeekEntryResult!262)

(declare-fun call!13243 () SeekEntryResult!262)

(assert (=> b!124464 (= lt!64027 call!13243)))

(declare-fun res!60310 () Bool)

(assert (=> b!124464 (= res!60310 ((_ is Found!262) lt!64027))))

(declare-fun e!81335 () Bool)

(assert (=> b!124464 (=> (not res!60310) (not e!81335))))

(assert (=> b!124464 e!81335))

(declare-fun b!124465 () Bool)

(assert (=> b!124465 (= e!81336 (not call!13247))))

(declare-fun bm!13241 () Bool)

(assert (=> bm!13241 (= call!13233 call!13241)))

(declare-fun b!124466 () Bool)

(declare-fun lt!64020 () Unit!3865)

(declare-fun lt!64024 () Unit!3865)

(assert (=> b!124466 (= lt!64020 lt!64024)))

(assert (=> b!124466 (= call!13232 call!13239)))

(declare-fun lt!64032 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!54 (array!4653 array!4655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 V!3417 Int) Unit!3865)

(assert (=> b!124466 (= lt!64024 (lemmaChangeZeroKeyThenAddPairToListMap!54 (_keys!4488 newMap!16) (_values!2742 newMap!16) (mask!7002 newMap!16) (extraKeys!2544 newMap!16) lt!64032 (zeroValue!2624 newMap!16) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2624 newMap!16) (defaultEntry!2759 newMap!16)))))

(assert (=> b!124466 (= lt!64032 (bvor (extraKeys!2544 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!124466 (= e!81346 (tuple2!2513 true (LongMapFixedSize!1049 (defaultEntry!2759 newMap!16) (mask!7002 newMap!16) (bvor (extraKeys!2544 newMap!16) #b00000000000000000000000000000001) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2624 newMap!16) (_size!573 newMap!16) (_keys!4488 newMap!16) (_values!2742 newMap!16) (_vacant!573 newMap!16))))))

(declare-fun b!124467 () Bool)

(declare-fun res!60315 () Bool)

(assert (=> b!124467 (= res!60315 call!13233)))

(assert (=> b!124467 (=> (not res!60315) (not e!81335))))

(declare-fun b!124468 () Bool)

(declare-fun e!81331 () Bool)

(declare-fun call!13240 () ListLongMap!1625)

(declare-fun call!13242 () ListLongMap!1625)

(assert (=> b!124468 (= e!81331 (= call!13240 call!13242))))

(declare-fun bm!13242 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!54 (array!4653 array!4655 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 64) Int) Unit!3865)

(assert (=> bm!13242 (= call!13248 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!54 (_keys!4488 newMap!16) (_values!2742 newMap!16) (mask!7002 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (defaultEntry!2759 newMap!16)))))

(declare-fun bm!13243 () Bool)

(assert (=> bm!13243 (= call!13237 call!13231)))

(declare-fun bm!13244 () Bool)

(assert (=> bm!13244 (= call!13234 (getCurrentListMap!509 (_keys!4488 newMap!16) (ite c!22649 (_values!2742 newMap!16) (array!4656 (store (arr!2205 (_values!2742 newMap!16)) (index!3203 lt!64011) (ValueCellFull!1070 (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2468 (_values!2742 newMap!16)))) (mask!7002 newMap!16) (ite (and c!22649 c!22652) lt!64032 (extraKeys!2544 newMap!16)) (ite (and c!22649 c!22652) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2624 newMap!16)) (minValue!2624 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2759 newMap!16)))))

(declare-fun bm!13245 () Bool)

(assert (=> bm!13245 (= call!13247 call!13249)))

(declare-fun bm!13246 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!54 (array!4653 array!4655 (_ BitVec 32) (_ BitVec 32) V!3417 V!3417 (_ BitVec 64) Int) Unit!3865)

(assert (=> bm!13246 (= call!13251 (lemmaInListMapThenSeekEntryOrOpenFindsIt!54 (_keys!4488 newMap!16) (_values!2742 newMap!16) (mask!7002 newMap!16) (extraKeys!2544 newMap!16) (zeroValue!2624 newMap!16) (minValue!2624 newMap!16) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (defaultEntry!2759 newMap!16)))))

(declare-fun b!124469 () Bool)

(assert (=> b!124469 (= e!81335 (= (select (arr!2204 (_keys!4488 newMap!16)) (index!3203 lt!64027)) (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun bm!13247 () Bool)

(assert (=> bm!13247 (= call!13240 (map!1373 (_2!1267 lt!64034)))))

(declare-fun b!124470 () Bool)

(declare-fun e!81342 () Bool)

(assert (=> b!124470 (= e!81331 e!81342)))

(declare-fun res!60318 () Bool)

(assert (=> b!124470 (= res!60318 (contains!859 call!13240 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(assert (=> b!124470 (=> (not res!60318) (not e!81342))))

(declare-fun b!124471 () Bool)

(declare-fun Unit!3870 () Unit!3865)

(assert (=> b!124471 (= e!81332 Unit!3870)))

(declare-fun lt!64019 () Unit!3865)

(assert (=> b!124471 (= lt!64019 call!13248)))

(assert (=> b!124471 (= lt!64026 call!13243)))

(declare-fun c!22650 () Bool)

(assert (=> b!124471 (= c!22650 ((_ is MissingZero!262) lt!64026))))

(assert (=> b!124471 e!81344))

(declare-fun lt!64025 () Unit!3865)

(assert (=> b!124471 (= lt!64025 lt!64019)))

(assert (=> b!124471 false))

(declare-fun bm!13248 () Bool)

(assert (=> bm!13248 (= call!13242 (map!1373 newMap!16))))

(declare-fun b!124472 () Bool)

(declare-fun c!22658 () Bool)

(assert (=> b!124472 (= c!22658 ((_ is MissingVacant!262) lt!64026))))

(assert (=> b!124472 (= e!81344 e!81334)))

(declare-fun b!124473 () Bool)

(declare-fun res!60320 () Bool)

(assert (=> b!124473 (= res!60320 call!13252)))

(assert (=> b!124473 (=> (not res!60320) (not e!81327))))

(declare-fun b!124474 () Bool)

(declare-fun res!60316 () Bool)

(assert (=> b!124474 (=> (not res!60316) (not e!81338))))

(assert (=> b!124474 (= res!60316 (= (select (arr!2204 (_keys!4488 newMap!16)) (index!3202 lt!64026)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124475 () Bool)

(assert (=> b!124475 (= e!81342 (= call!13240 (+!162 call!13242 (tuple2!2511 (select (arr!2204 (_keys!4488 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!124476 () Bool)

(declare-fun lt!64035 () tuple2!2512)

(assert (=> b!124476 (= lt!64035 call!13253)))

(assert (=> b!124476 (= e!81328 (tuple2!2513 (_1!1267 lt!64035) (_2!1267 lt!64035)))))

(declare-fun c!22646 () Bool)

(declare-fun bm!13249 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13249 (= call!13241 (inRange!0 (ite c!22656 (ite c!22646 (index!3203 lt!64022) (ite c!22651 (index!3202 lt!64030) (index!3205 lt!64030))) (ite c!22648 (index!3203 lt!64027) (ite c!22650 (index!3202 lt!64026) (index!3205 lt!64026)))) (mask!7002 newMap!16)))))

(declare-fun b!124477 () Bool)

(declare-fun res!60311 () Bool)

(assert (=> b!124477 (= res!60311 (= (select (arr!2204 (_keys!4488 newMap!16)) (index!3205 lt!64026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81329 () Bool)

(assert (=> b!124477 (=> (not res!60311) (not e!81329))))

(declare-fun b!124478 () Bool)

(declare-fun lt!64023 () Unit!3865)

(assert (=> b!124478 (= lt!64023 e!81340)))

(assert (=> b!124478 (= c!22646 call!13235)))

(assert (=> b!124478 (= e!81333 (tuple2!2513 false newMap!16))))

(declare-fun b!124479 () Bool)

(declare-fun c!22657 () Bool)

(assert (=> b!124479 (= c!22657 ((_ is MissingVacant!262) lt!64030))))

(assert (=> b!124479 (= e!81345 e!81337)))

(declare-fun b!124480 () Bool)

(assert (=> b!124480 (= e!81339 e!81331)))

(declare-fun c!22647 () Bool)

(assert (=> b!124480 (= c!22647 (_1!1267 lt!64034))))

(declare-fun b!124481 () Bool)

(assert (=> b!124481 (= e!81334 e!81329)))

(declare-fun res!60312 () Bool)

(assert (=> b!124481 (= res!60312 call!13250)))

(assert (=> b!124481 (=> (not res!60312) (not e!81329))))

(declare-fun b!124482 () Bool)

(assert (=> b!124482 (= e!81329 (not call!13230))))

(declare-fun bm!13250 () Bool)

(assert (=> bm!13250 (= call!13243 call!13231)))

(assert (= (and d!37487 c!22649) b!124460))

(assert (= (and d!37487 (not c!22649)) b!124451))

(assert (= (and b!124460 c!22652) b!124466))

(assert (= (and b!124460 (not c!22652)) b!124453))

(assert (= (or b!124466 b!124453) bm!13234))

(assert (= (or b!124466 b!124453) bm!13239))

(assert (= (or b!124466 b!124453) bm!13231))

(assert (= (and b!124451 c!22656) b!124478))

(assert (= (and b!124451 (not c!22656)) b!124447))

(assert (= (and b!124478 c!22646) b!124458))

(assert (= (and b!124478 (not c!22646)) b!124455))

(assert (= (and b!124458 res!60314) b!124473))

(assert (= (and b!124473 res!60320) b!124446))

(assert (= (and b!124455 c!22651) b!124448))

(assert (= (and b!124455 (not c!22651)) b!124479))

(assert (= (and b!124448 res!60321) b!124452))

(assert (= (and b!124452 res!60319) b!124465))

(assert (= (and b!124479 c!22657) b!124449))

(assert (= (and b!124479 (not c!22657)) b!124459))

(assert (= (and b!124449 res!60313) b!124456))

(assert (= (and b!124456 res!60309) b!124445))

(assert (= (or b!124448 b!124449) bm!13227))

(assert (= (or b!124465 b!124445) bm!13245))

(assert (= (or b!124473 bm!13227) bm!13238))

(assert (= (or b!124458 b!124455) bm!13243))

(assert (= (and b!124447 c!22653) b!124444))

(assert (= (and b!124447 (not c!22653)) b!124463))

(assert (= (and b!124463 c!22654) b!124476))

(assert (= (and b!124463 (not c!22654)) b!124443))

(assert (= (and b!124443 c!22648) b!124464))

(assert (= (and b!124443 (not c!22648)) b!124471))

(assert (= (and b!124464 res!60310) b!124467))

(assert (= (and b!124467 res!60315) b!124469))

(assert (= (and b!124471 c!22650) b!124450))

(assert (= (and b!124471 (not c!22650)) b!124472))

(assert (= (and b!124450 res!60322) b!124474))

(assert (= (and b!124474 res!60316) b!124461))

(assert (= (and b!124472 c!22658) b!124481))

(assert (= (and b!124472 (not c!22658)) b!124457))

(assert (= (and b!124481 res!60312) b!124477))

(assert (= (and b!124477 res!60311) b!124482))

(assert (= (or b!124450 b!124481) bm!13235))

(assert (= (or b!124461 b!124482) bm!13229))

(assert (= (or b!124467 bm!13235) bm!13241))

(assert (= (or b!124464 b!124471) bm!13250))

(assert (= (or b!124444 b!124476) bm!13230))

(assert (= (or bm!13243 bm!13250) bm!13228))

(assert (= (or b!124478 b!124443) bm!13233))

(assert (= (or bm!13245 bm!13229) bm!13232))

(assert (= (or b!124458 b!124464) bm!13246))

(assert (= (or bm!13238 bm!13241) bm!13249))

(assert (= (or b!124455 b!124471) bm!13242))

(assert (= (or b!124478 b!124443) bm!13236))

(assert (= (or bm!13239 bm!13233) bm!13240))

(assert (= (or bm!13234 b!124443) bm!13244))

(assert (= (or bm!13231 b!124443) bm!13237))

(assert (= (and bm!13237 c!22655) b!124454))

(assert (= (and bm!13237 (not c!22655)) b!124462))

(assert (= (and d!37487 res!60317) b!124480))

(assert (= (and b!124480 c!22647) b!124470))

(assert (= (and b!124480 (not c!22647)) b!124468))

(assert (= (and b!124470 res!60318) b!124475))

(assert (= (or b!124475 b!124468) bm!13248))

(assert (= (or b!124470 b!124475 b!124468) bm!13247))

(declare-fun m!144727 () Bool)

(assert (=> b!124456 m!144727))

(assert (=> bm!13248 m!144555))

(assert (=> bm!13228 m!144553))

(declare-fun m!144729 () Bool)

(assert (=> bm!13228 m!144729))

(assert (=> b!124462 m!144661))

(assert (=> bm!13230 m!144553))

(assert (=> bm!13230 m!144575))

(declare-fun m!144731 () Bool)

(assert (=> bm!13230 m!144731))

(declare-fun m!144733 () Bool)

(assert (=> bm!13249 m!144733))

(declare-fun m!144735 () Bool)

(assert (=> bm!13236 m!144735))

(declare-fun m!144737 () Bool)

(assert (=> bm!13236 m!144737))

(declare-fun m!144739 () Bool)

(assert (=> b!124452 m!144739))

(declare-fun m!144741 () Bool)

(assert (=> bm!13247 m!144741))

(assert (=> bm!13232 m!144553))

(declare-fun m!144743 () Bool)

(assert (=> bm!13232 m!144743))

(declare-fun m!144745 () Bool)

(assert (=> b!124446 m!144745))

(assert (=> b!124466 m!144575))

(declare-fun m!144747 () Bool)

(assert (=> b!124466 m!144747))

(declare-fun m!144749 () Bool)

(assert (=> b!124475 m!144749))

(assert (=> b!124470 m!144553))

(declare-fun m!144751 () Bool)

(assert (=> b!124470 m!144751))

(declare-fun m!144753 () Bool)

(assert (=> bm!13240 m!144753))

(declare-fun m!144755 () Bool)

(assert (=> d!37487 m!144755))

(assert (=> d!37487 m!144579))

(declare-fun m!144757 () Bool)

(assert (=> b!124469 m!144757))

(declare-fun m!144759 () Bool)

(assert (=> bm!13244 m!144759))

(declare-fun m!144761 () Bool)

(assert (=> bm!13244 m!144761))

(declare-fun m!144763 () Bool)

(assert (=> bm!13237 m!144763))

(declare-fun m!144765 () Bool)

(assert (=> b!124474 m!144765))

(assert (=> b!124451 m!144553))

(assert (=> b!124451 m!144729))

(declare-fun m!144767 () Bool)

(assert (=> b!124477 m!144767))

(assert (=> bm!13246 m!144553))

(declare-fun m!144769 () Bool)

(assert (=> bm!13246 m!144769))

(assert (=> b!124443 m!144661))

(assert (=> b!124443 m!144553))

(declare-fun m!144771 () Bool)

(assert (=> b!124443 m!144771))

(assert (=> b!124443 m!144759))

(assert (=> b!124443 m!144661))

(declare-fun m!144773 () Bool)

(assert (=> b!124443 m!144773))

(assert (=> b!124443 m!144553))

(assert (=> b!124443 m!144575))

(declare-fun m!144775 () Bool)

(assert (=> b!124443 m!144775))

(assert (=> b!124453 m!144575))

(declare-fun m!144777 () Bool)

(assert (=> b!124453 m!144777))

(assert (=> bm!13242 m!144553))

(declare-fun m!144779 () Bool)

(assert (=> bm!13242 m!144779))

(assert (=> b!124170 d!37487))

(declare-fun d!37489 () Bool)

(declare-fun c!22661 () Bool)

(assert (=> d!37489 (= c!22661 ((_ is ValueCellFull!1070) (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun e!81349 () V!3417)

(assert (=> d!37489 (= (get!1440 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81349)))

(declare-fun b!124487 () Bool)

(declare-fun get!1442 (ValueCell!1070 V!3417) V!3417)

(assert (=> b!124487 (= e!81349 (get!1442 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124488 () Bool)

(declare-fun get!1443 (ValueCell!1070 V!3417) V!3417)

(assert (=> b!124488 (= e!81349 (get!1443 (select (arr!2205 (_values!2742 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37489 c!22661) b!124487))

(assert (= (and d!37489 (not c!22661)) b!124488))

(assert (=> b!124487 m!144571))

(assert (=> b!124487 m!144573))

(declare-fun m!144781 () Bool)

(assert (=> b!124487 m!144781))

(assert (=> b!124488 m!144571))

(assert (=> b!124488 m!144573))

(declare-fun m!144783 () Bool)

(assert (=> b!124488 m!144783))

(assert (=> b!124170 d!37489))

(declare-fun b!124495 () Bool)

(declare-fun e!81355 () Bool)

(assert (=> b!124495 (= e!81355 tp_is_empty!2827)))

(declare-fun mapIsEmpty!4461 () Bool)

(declare-fun mapRes!4461 () Bool)

(assert (=> mapIsEmpty!4461 mapRes!4461))

(declare-fun b!124496 () Bool)

(declare-fun e!81354 () Bool)

(assert (=> b!124496 (= e!81354 tp_is_empty!2827)))

(declare-fun mapNonEmpty!4461 () Bool)

(declare-fun tp!10887 () Bool)

(assert (=> mapNonEmpty!4461 (= mapRes!4461 (and tp!10887 e!81355))))

(declare-fun mapValue!4461 () ValueCell!1070)

(declare-fun mapRest!4461 () (Array (_ BitVec 32) ValueCell!1070))

(declare-fun mapKey!4461 () (_ BitVec 32))

(assert (=> mapNonEmpty!4461 (= mapRest!4445 (store mapRest!4461 mapKey!4461 mapValue!4461))))

(declare-fun condMapEmpty!4461 () Bool)

(declare-fun mapDefault!4461 () ValueCell!1070)

(assert (=> mapNonEmpty!4445 (= condMapEmpty!4461 (= mapRest!4445 ((as const (Array (_ BitVec 32) ValueCell!1070)) mapDefault!4461)))))

(assert (=> mapNonEmpty!4445 (= tp!10859 (and e!81354 mapRes!4461))))

(assert (= (and mapNonEmpty!4445 condMapEmpty!4461) mapIsEmpty!4461))

(assert (= (and mapNonEmpty!4445 (not condMapEmpty!4461)) mapNonEmpty!4461))

(assert (= (and mapNonEmpty!4461 ((_ is ValueCellFull!1070) mapValue!4461)) b!124495))

(assert (= (and mapNonEmpty!4445 ((_ is ValueCellFull!1070) mapDefault!4461)) b!124496))

(declare-fun m!144785 () Bool)

(assert (=> mapNonEmpty!4461 m!144785))

(declare-fun b!124497 () Bool)

(declare-fun e!81357 () Bool)

(assert (=> b!124497 (= e!81357 tp_is_empty!2827)))

(declare-fun mapIsEmpty!4462 () Bool)

(declare-fun mapRes!4462 () Bool)

(assert (=> mapIsEmpty!4462 mapRes!4462))

(declare-fun b!124498 () Bool)

(declare-fun e!81356 () Bool)

(assert (=> b!124498 (= e!81356 tp_is_empty!2827)))

(declare-fun mapNonEmpty!4462 () Bool)

(declare-fun tp!10888 () Bool)

(assert (=> mapNonEmpty!4462 (= mapRes!4462 (and tp!10888 e!81357))))

(declare-fun mapKey!4462 () (_ BitVec 32))

(declare-fun mapRest!4462 () (Array (_ BitVec 32) ValueCell!1070))

(declare-fun mapValue!4462 () ValueCell!1070)

(assert (=> mapNonEmpty!4462 (= mapRest!4446 (store mapRest!4462 mapKey!4462 mapValue!4462))))

(declare-fun condMapEmpty!4462 () Bool)

(declare-fun mapDefault!4462 () ValueCell!1070)

(assert (=> mapNonEmpty!4446 (= condMapEmpty!4462 (= mapRest!4446 ((as const (Array (_ BitVec 32) ValueCell!1070)) mapDefault!4462)))))

(assert (=> mapNonEmpty!4446 (= tp!10860 (and e!81356 mapRes!4462))))

(assert (= (and mapNonEmpty!4446 condMapEmpty!4462) mapIsEmpty!4462))

(assert (= (and mapNonEmpty!4446 (not condMapEmpty!4462)) mapNonEmpty!4462))

(assert (= (and mapNonEmpty!4462 ((_ is ValueCellFull!1070) mapValue!4462)) b!124497))

(assert (= (and mapNonEmpty!4446 ((_ is ValueCellFull!1070) mapDefault!4462)) b!124498))

(declare-fun m!144787 () Bool)

(assert (=> mapNonEmpty!4462 m!144787))

(declare-fun b_lambda!5473 () Bool)

(assert (= b_lambda!5471 (or (and b!124177 b_free!2821) (and b!124175 b_free!2823 (= (defaultEntry!2759 newMap!16) (defaultEntry!2759 (v!3100 (underlying!433 thiss!992))))) b_lambda!5473)))

(check-sat (not bm!13248) b_and!7647 (not bm!13236) (not bm!13178) (not b!124351) (not b_next!2821) (not d!37479) (not b_lambda!5469) (not bm!13247) (not b!124453) (not bm!13249) (not b!124360) (not bm!13230) (not d!37477) (not b!124290) (not b!124462) (not bm!13176) (not b!124337) (not mapNonEmpty!4462) (not b!124451) (not b!124443) (not bm!13240) (not b!124487) (not b!124470) (not b!124338) b_and!7645 (not b!124466) (not mapNonEmpty!4461) (not d!37471) (not bm!13246) (not b!124488) (not b!124362) (not bm!13228) (not bm!13237) (not b!124475) (not d!37485) (not b!124350) (not b!124348) (not bm!13232) tp_is_empty!2827 (not b!124289) (not bm!13242) (not b_lambda!5473) (not b_next!2823) (not b!124344) (not b!124342) (not b!124352) (not d!37469) (not b!124288) (not d!37487) (not bm!13172) (not bm!13244) (not bm!13177))
(check-sat b_and!7645 b_and!7647 (not b_next!2821) (not b_next!2823))
