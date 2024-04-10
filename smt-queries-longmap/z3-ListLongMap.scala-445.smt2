; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8284 () Bool)

(assert start!8284)

(declare-fun b!53620 () Bool)

(declare-fun b_free!1733 () Bool)

(declare-fun b_next!1733 () Bool)

(assert (=> b!53620 (= b_free!1733 (not b_next!1733))))

(declare-fun tp!7301 () Bool)

(declare-fun b_and!3007 () Bool)

(assert (=> b!53620 (= tp!7301 b_and!3007)))

(declare-fun b!53613 () Bool)

(declare-fun b_free!1735 () Bool)

(declare-fun b_next!1735 () Bool)

(assert (=> b!53613 (= b_free!1735 (not b_next!1735))))

(declare-fun tp!7299 () Bool)

(declare-fun b_and!3009 () Bool)

(assert (=> b!53613 (= tp!7299 b_and!3009)))

(declare-fun b!53600 () Bool)

(declare-fun res!30383 () Bool)

(declare-fun e!34976 () Bool)

(assert (=> b!53600 (=> (not res!30383) (not e!34976))))

(declare-datatypes ((V!2691 0))(
  ( (V!2692 (val!1186 Int)) )
))
(declare-datatypes ((array!3489 0))(
  ( (array!3490 (arr!1667 (Array (_ BitVec 32) (_ BitVec 64))) (size!1896 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!798 0))(
  ( (ValueCellFull!798 (v!2259 V!2691)) (EmptyCell!798) )
))
(declare-datatypes ((array!3491 0))(
  ( (array!3492 (arr!1668 (Array (_ BitVec 32) ValueCell!798)) (size!1897 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!504 0))(
  ( (LongMapFixedSize!505 (defaultEntry!1966 Int) (mask!5803 (_ BitVec 32)) (extraKeys!1857 (_ BitVec 32)) (zeroValue!1884 V!2691) (minValue!1884 V!2691) (_size!301 (_ BitVec 32)) (_keys!3586 array!3489) (_values!1949 array!3491) (_vacant!301 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!504)

(declare-datatypes ((Cell!322 0))(
  ( (Cell!323 (v!2260 LongMapFixedSize!504)) )
))
(declare-datatypes ((LongMap!322 0))(
  ( (LongMap!323 (underlying!172 Cell!322)) )
))
(declare-fun thiss!992 () LongMap!322)

(assert (=> b!53600 (= res!30383 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5803 newMap!16)) (_size!301 (v!2260 (underlying!172 thiss!992)))))))

(declare-fun b!53601 () Bool)

(declare-fun res!30379 () Bool)

(declare-fun e!34969 () Bool)

(assert (=> b!53601 (=> (not res!30379) (not e!34969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3489 (_ BitVec 32)) Bool)

(assert (=> b!53601 (= res!30379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3586 (v!2260 (underlying!172 thiss!992))) (mask!5803 (v!2260 (underlying!172 thiss!992)))))))

(declare-fun mapIsEmpty!2519 () Bool)

(declare-fun mapRes!2520 () Bool)

(assert (=> mapIsEmpty!2519 mapRes!2520))

(declare-fun b!53602 () Bool)

(declare-fun res!30382 () Bool)

(assert (=> b!53602 (=> (not res!30382) (not e!34969))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!53602 (= res!30382 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1896 (_keys!3586 (v!2260 (underlying!172 thiss!992)))))))))

(declare-fun b!53603 () Bool)

(declare-fun res!30380 () Bool)

(assert (=> b!53603 (=> (not res!30380) (not e!34976))))

(declare-fun valid!191 (LongMapFixedSize!504) Bool)

(assert (=> b!53603 (= res!30380 (valid!191 newMap!16))))

(declare-fun b!53604 () Bool)

(declare-fun res!30381 () Bool)

(assert (=> b!53604 (=> (not res!30381) (not e!34976))))

(assert (=> b!53604 (= res!30381 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1896 (_keys!3586 (v!2260 (underlying!172 thiss!992)))))))))

(declare-fun b!53605 () Bool)

(declare-fun res!30387 () Bool)

(assert (=> b!53605 (=> (not res!30387) (not e!34969))))

(declare-datatypes ((List!1360 0))(
  ( (Nil!1357) (Cons!1356 (h!1936 (_ BitVec 64)) (t!4462 List!1360)) )
))
(declare-fun arrayNoDuplicates!0 (array!3489 (_ BitVec 32) List!1360) Bool)

(assert (=> b!53605 (= res!30387 (arrayNoDuplicates!0 (_keys!3586 (v!2260 (underlying!172 thiss!992))) #b00000000000000000000000000000000 Nil!1357))))

(declare-fun b!53606 () Bool)

(declare-fun e!34970 () Bool)

(declare-fun e!34980 () Bool)

(assert (=> b!53606 (= e!34970 e!34980)))

(declare-fun b!53607 () Bool)

(declare-fun e!34975 () Bool)

(declare-fun tp_is_empty!2283 () Bool)

(assert (=> b!53607 (= e!34975 tp_is_empty!2283)))

(declare-fun b!53608 () Bool)

(declare-fun e!34968 () Bool)

(assert (=> b!53608 (= e!34968 tp_is_empty!2283)))

(declare-fun b!53609 () Bool)

(assert (=> b!53609 (= e!34969 false)))

(declare-fun lt!21495 () Bool)

(declare-datatypes ((tuple2!1890 0))(
  ( (tuple2!1891 (_1!956 (_ BitVec 64)) (_2!956 V!2691)) )
))
(declare-datatypes ((List!1361 0))(
  ( (Nil!1358) (Cons!1357 (h!1937 tuple2!1890) (t!4463 List!1361)) )
))
(declare-datatypes ((ListLongMap!1291 0))(
  ( (ListLongMap!1292 (toList!661 List!1361)) )
))
(declare-fun lt!21496 () ListLongMap!1291)

(declare-fun contains!636 (ListLongMap!1291 (_ BitVec 64)) Bool)

(assert (=> b!53609 (= lt!21495 (contains!636 lt!21496 (select (arr!1667 (_keys!3586 (v!2260 (underlying!172 thiss!992)))) from!355)))))

(declare-fun b!53610 () Bool)

(declare-fun e!34979 () Bool)

(declare-fun e!34982 () Bool)

(assert (=> b!53610 (= e!34979 (and e!34982 mapRes!2520))))

(declare-fun condMapEmpty!2520 () Bool)

(declare-fun mapDefault!2520 () ValueCell!798)

(assert (=> b!53610 (= condMapEmpty!2520 (= (arr!1668 (_values!1949 (v!2260 (underlying!172 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!798)) mapDefault!2520)))))

(declare-fun b!53611 () Bool)

(declare-fun e!34978 () Bool)

(assert (=> b!53611 (= e!34978 e!34969)))

(declare-fun res!30388 () Bool)

(assert (=> b!53611 (=> (not res!30388) (not e!34969))))

(declare-fun lt!21497 () ListLongMap!1291)

(assert (=> b!53611 (= res!30388 (contains!636 lt!21497 (select (arr!1667 (_keys!3586 (v!2260 (underlying!172 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1892 0))(
  ( (tuple2!1893 (_1!957 Bool) (_2!957 LongMapFixedSize!504)) )
))
(declare-fun lt!21498 () tuple2!1892)

(declare-fun update!44 (LongMapFixedSize!504 (_ BitVec 64) V!2691) tuple2!1892)

(declare-fun get!994 (ValueCell!798 V!2691) V!2691)

(declare-fun dynLambda!275 (Int (_ BitVec 64)) V!2691)

(assert (=> b!53611 (= lt!21498 (update!44 newMap!16 (select (arr!1667 (_keys!3586 (v!2260 (underlying!172 thiss!992)))) from!355) (get!994 (select (arr!1668 (_values!1949 (v!2260 (underlying!172 thiss!992)))) from!355) (dynLambda!275 (defaultEntry!1966 (v!2260 (underlying!172 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53612 () Bool)

(declare-fun res!30389 () Bool)

(assert (=> b!53612 (=> (not res!30389) (not e!34969))))

(assert (=> b!53612 (= res!30389 (and (= (size!1897 (_values!1949 (v!2260 (underlying!172 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5803 (v!2260 (underlying!172 thiss!992))))) (= (size!1896 (_keys!3586 (v!2260 (underlying!172 thiss!992)))) (size!1897 (_values!1949 (v!2260 (underlying!172 thiss!992))))) (bvsge (mask!5803 (v!2260 (underlying!172 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1857 (v!2260 (underlying!172 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1857 (v!2260 (underlying!172 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun e!34977 () Bool)

(declare-fun e!34973 () Bool)

(declare-fun array_inv!1031 (array!3489) Bool)

(declare-fun array_inv!1032 (array!3491) Bool)

(assert (=> b!53613 (= e!34977 (and tp!7299 tp_is_empty!2283 (array_inv!1031 (_keys!3586 newMap!16)) (array_inv!1032 (_values!1949 newMap!16)) e!34973))))

(declare-fun b!53614 () Bool)

(declare-fun e!34971 () Bool)

(assert (=> b!53614 (= e!34971 tp_is_empty!2283)))

(declare-fun b!53615 () Bool)

(declare-fun res!30386 () Bool)

(assert (=> b!53615 (=> (not res!30386) (not e!34969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53615 (= res!30386 (validMask!0 (mask!5803 (v!2260 (underlying!172 thiss!992)))))))

(declare-fun b!53616 () Bool)

(declare-fun e!34974 () Bool)

(assert (=> b!53616 (= e!34980 e!34974)))

(declare-fun mapIsEmpty!2520 () Bool)

(declare-fun mapRes!2519 () Bool)

(assert (=> mapIsEmpty!2520 mapRes!2519))

(declare-fun mapNonEmpty!2520 () Bool)

(declare-fun tp!7300 () Bool)

(assert (=> mapNonEmpty!2520 (= mapRes!2519 (and tp!7300 e!34975))))

(declare-fun mapValue!2519 () ValueCell!798)

(declare-fun mapRest!2520 () (Array (_ BitVec 32) ValueCell!798))

(declare-fun mapKey!2519 () (_ BitVec 32))

(assert (=> mapNonEmpty!2520 (= (arr!1668 (_values!1949 newMap!16)) (store mapRest!2520 mapKey!2519 mapValue!2519))))

(declare-fun mapNonEmpty!2519 () Bool)

(declare-fun tp!7302 () Bool)

(assert (=> mapNonEmpty!2519 (= mapRes!2520 (and tp!7302 e!34968))))

(declare-fun mapValue!2520 () ValueCell!798)

(declare-fun mapRest!2519 () (Array (_ BitVec 32) ValueCell!798))

(declare-fun mapKey!2520 () (_ BitVec 32))

(assert (=> mapNonEmpty!2519 (= (arr!1668 (_values!1949 (v!2260 (underlying!172 thiss!992)))) (store mapRest!2519 mapKey!2520 mapValue!2520))))

(declare-fun res!30385 () Bool)

(assert (=> start!8284 (=> (not res!30385) (not e!34976))))

(declare-fun valid!192 (LongMap!322) Bool)

(assert (=> start!8284 (= res!30385 (valid!192 thiss!992))))

(assert (=> start!8284 e!34976))

(assert (=> start!8284 e!34970))

(assert (=> start!8284 true))

(assert (=> start!8284 e!34977))

(declare-fun b!53617 () Bool)

(assert (=> b!53617 (= e!34973 (and e!34971 mapRes!2519))))

(declare-fun condMapEmpty!2519 () Bool)

(declare-fun mapDefault!2519 () ValueCell!798)

(assert (=> b!53617 (= condMapEmpty!2519 (= (arr!1668 (_values!1949 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!798)) mapDefault!2519)))))

(declare-fun b!53618 () Bool)

(assert (=> b!53618 (= e!34982 tp_is_empty!2283)))

(declare-fun b!53619 () Bool)

(assert (=> b!53619 (= e!34976 e!34978)))

(declare-fun res!30384 () Bool)

(assert (=> b!53619 (=> (not res!30384) (not e!34978))))

(assert (=> b!53619 (= res!30384 (and (= lt!21496 lt!21497) (not (= (select (arr!1667 (_keys!3586 (v!2260 (underlying!172 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1667 (_keys!3586 (v!2260 (underlying!172 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1037 (LongMapFixedSize!504) ListLongMap!1291)

(assert (=> b!53619 (= lt!21497 (map!1037 newMap!16))))

(declare-fun getCurrentListMap!372 (array!3489 array!3491 (_ BitVec 32) (_ BitVec 32) V!2691 V!2691 (_ BitVec 32) Int) ListLongMap!1291)

(assert (=> b!53619 (= lt!21496 (getCurrentListMap!372 (_keys!3586 (v!2260 (underlying!172 thiss!992))) (_values!1949 (v!2260 (underlying!172 thiss!992))) (mask!5803 (v!2260 (underlying!172 thiss!992))) (extraKeys!1857 (v!2260 (underlying!172 thiss!992))) (zeroValue!1884 (v!2260 (underlying!172 thiss!992))) (minValue!1884 (v!2260 (underlying!172 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1966 (v!2260 (underlying!172 thiss!992)))))))

(assert (=> b!53620 (= e!34974 (and tp!7301 tp_is_empty!2283 (array_inv!1031 (_keys!3586 (v!2260 (underlying!172 thiss!992)))) (array_inv!1032 (_values!1949 (v!2260 (underlying!172 thiss!992)))) e!34979))))

(assert (= (and start!8284 res!30385) b!53604))

(assert (= (and b!53604 res!30381) b!53603))

(assert (= (and b!53603 res!30380) b!53600))

(assert (= (and b!53600 res!30383) b!53619))

(assert (= (and b!53619 res!30384) b!53611))

(assert (= (and b!53611 res!30388) b!53615))

(assert (= (and b!53615 res!30386) b!53612))

(assert (= (and b!53612 res!30389) b!53601))

(assert (= (and b!53601 res!30379) b!53605))

(assert (= (and b!53605 res!30387) b!53602))

(assert (= (and b!53602 res!30382) b!53609))

(assert (= (and b!53610 condMapEmpty!2520) mapIsEmpty!2519))

(assert (= (and b!53610 (not condMapEmpty!2520)) mapNonEmpty!2519))

(get-info :version)

(assert (= (and mapNonEmpty!2519 ((_ is ValueCellFull!798) mapValue!2520)) b!53608))

(assert (= (and b!53610 ((_ is ValueCellFull!798) mapDefault!2520)) b!53618))

(assert (= b!53620 b!53610))

(assert (= b!53616 b!53620))

(assert (= b!53606 b!53616))

(assert (= start!8284 b!53606))

(assert (= (and b!53617 condMapEmpty!2519) mapIsEmpty!2520))

(assert (= (and b!53617 (not condMapEmpty!2519)) mapNonEmpty!2520))

(assert (= (and mapNonEmpty!2520 ((_ is ValueCellFull!798) mapValue!2519)) b!53607))

(assert (= (and b!53617 ((_ is ValueCellFull!798) mapDefault!2519)) b!53614))

(assert (= b!53613 b!53617))

(assert (= start!8284 b!53613))

(declare-fun b_lambda!2377 () Bool)

(assert (=> (not b_lambda!2377) (not b!53611)))

(declare-fun t!4459 () Bool)

(declare-fun tb!1077 () Bool)

(assert (=> (and b!53620 (= (defaultEntry!1966 (v!2260 (underlying!172 thiss!992))) (defaultEntry!1966 (v!2260 (underlying!172 thiss!992)))) t!4459) tb!1077))

(declare-fun result!2013 () Bool)

(assert (=> tb!1077 (= result!2013 tp_is_empty!2283)))

(assert (=> b!53611 t!4459))

(declare-fun b_and!3011 () Bool)

(assert (= b_and!3007 (and (=> t!4459 result!2013) b_and!3011)))

(declare-fun t!4461 () Bool)

(declare-fun tb!1079 () Bool)

(assert (=> (and b!53613 (= (defaultEntry!1966 newMap!16) (defaultEntry!1966 (v!2260 (underlying!172 thiss!992)))) t!4461) tb!1079))

(declare-fun result!2017 () Bool)

(assert (= result!2017 result!2013))

(assert (=> b!53611 t!4461))

(declare-fun b_and!3013 () Bool)

(assert (= b_and!3009 (and (=> t!4461 result!2017) b_and!3013)))

(declare-fun m!45525 () Bool)

(assert (=> mapNonEmpty!2519 m!45525))

(declare-fun m!45527 () Bool)

(assert (=> b!53620 m!45527))

(declare-fun m!45529 () Bool)

(assert (=> b!53620 m!45529))

(declare-fun m!45531 () Bool)

(assert (=> b!53619 m!45531))

(declare-fun m!45533 () Bool)

(assert (=> b!53619 m!45533))

(declare-fun m!45535 () Bool)

(assert (=> b!53619 m!45535))

(declare-fun m!45537 () Bool)

(assert (=> b!53613 m!45537))

(declare-fun m!45539 () Bool)

(assert (=> b!53613 m!45539))

(declare-fun m!45541 () Bool)

(assert (=> b!53601 m!45541))

(assert (=> b!53609 m!45531))

(assert (=> b!53609 m!45531))

(declare-fun m!45543 () Bool)

(assert (=> b!53609 m!45543))

(declare-fun m!45545 () Bool)

(assert (=> b!53611 m!45545))

(declare-fun m!45547 () Bool)

(assert (=> b!53611 m!45547))

(declare-fun m!45549 () Bool)

(assert (=> b!53611 m!45549))

(assert (=> b!53611 m!45531))

(assert (=> b!53611 m!45531))

(declare-fun m!45551 () Bool)

(assert (=> b!53611 m!45551))

(assert (=> b!53611 m!45547))

(assert (=> b!53611 m!45531))

(assert (=> b!53611 m!45549))

(declare-fun m!45553 () Bool)

(assert (=> b!53611 m!45553))

(assert (=> b!53611 m!45545))

(declare-fun m!45555 () Bool)

(assert (=> b!53605 m!45555))

(declare-fun m!45557 () Bool)

(assert (=> start!8284 m!45557))

(declare-fun m!45559 () Bool)

(assert (=> mapNonEmpty!2520 m!45559))

(declare-fun m!45561 () Bool)

(assert (=> b!53615 m!45561))

(declare-fun m!45563 () Bool)

(assert (=> b!53603 m!45563))

(check-sat (not b!53603) (not b!53620) (not b!53613) (not b_next!1735) (not b_next!1733) b_and!3011 b_and!3013 (not b!53615) (not mapNonEmpty!2520) (not b!53611) (not b_lambda!2377) (not b!53619) (not start!8284) (not mapNonEmpty!2519) (not b!53609) (not b!53601) (not b!53605) tp_is_empty!2283)
(check-sat b_and!3011 b_and!3013 (not b_next!1733) (not b_next!1735))
