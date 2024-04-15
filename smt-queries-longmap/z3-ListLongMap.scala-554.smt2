; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14884 () Bool)

(assert start!14884)

(declare-fun b!143106 () Bool)

(declare-fun b_free!3037 () Bool)

(declare-fun b_next!3037 () Bool)

(assert (=> b!143106 (= b_free!3037 (not b_next!3037))))

(declare-fun tp!11592 () Bool)

(declare-fun b_and!8893 () Bool)

(assert (=> b!143106 (= tp!11592 b_and!8893)))

(declare-fun b!143111 () Bool)

(declare-fun b_free!3039 () Bool)

(declare-fun b_next!3039 () Bool)

(assert (=> b!143111 (= b_free!3039 (not b_next!3039))))

(declare-fun tp!11591 () Bool)

(declare-fun b_and!8895 () Bool)

(assert (=> b!143111 (= tp!11591 b_and!8895)))

(declare-fun b!143097 () Bool)

(declare-fun e!93225 () Bool)

(declare-fun tp_is_empty!2935 () Bool)

(assert (=> b!143097 (= e!93225 tp_is_empty!2935)))

(declare-fun b!143098 () Bool)

(declare-fun res!68132 () Bool)

(declare-fun e!93238 () Bool)

(assert (=> b!143098 (=> (not res!68132) (not e!93238))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3561 0))(
  ( (V!3562 (val!1512 Int)) )
))
(declare-datatypes ((array!4887 0))(
  ( (array!4888 (arr!2308 (Array (_ BitVec 32) (_ BitVec 64))) (size!2582 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1124 0))(
  ( (ValueCellFull!1124 (v!3289 V!3561)) (EmptyCell!1124) )
))
(declare-datatypes ((array!4889 0))(
  ( (array!4890 (arr!2309 (Array (_ BitVec 32) ValueCell!1124)) (size!2583 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1156 0))(
  ( (LongMapFixedSize!1157 (defaultEntry!2962 Int) (mask!7313 (_ BitVec 32)) (extraKeys!2713 (_ BitVec 32)) (zeroValue!2810 V!3561) (minValue!2810 V!3561) (_size!627 (_ BitVec 32)) (_keys!4724 array!4887) (_values!2945 array!4889) (_vacant!627 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!936 0))(
  ( (Cell!937 (v!3290 LongMapFixedSize!1156)) )
))
(declare-datatypes ((LongMap!936 0))(
  ( (LongMap!937 (underlying!479 Cell!936)) )
))
(declare-fun thiss!992 () LongMap!936)

(assert (=> b!143098 (= res!68132 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992)))))))))

(declare-fun mapNonEmpty!4855 () Bool)

(declare-fun mapRes!4856 () Bool)

(declare-fun tp!11594 () Bool)

(declare-fun e!93231 () Bool)

(assert (=> mapNonEmpty!4855 (= mapRes!4856 (and tp!11594 e!93231))))

(declare-fun newMap!16 () LongMapFixedSize!1156)

(declare-fun mapKey!4856 () (_ BitVec 32))

(declare-fun mapValue!4855 () ValueCell!1124)

(declare-fun mapRest!4856 () (Array (_ BitVec 32) ValueCell!1124))

(assert (=> mapNonEmpty!4855 (= (arr!2309 (_values!2945 newMap!16)) (store mapRest!4856 mapKey!4856 mapValue!4855))))

(declare-fun b!143099 () Bool)

(declare-fun e!93227 () Bool)

(declare-fun e!93233 () Bool)

(assert (=> b!143099 (= e!93227 e!93233)))

(declare-fun res!68133 () Bool)

(assert (=> b!143099 (=> (not res!68133) (not e!93233))))

(declare-datatypes ((tuple2!2668 0))(
  ( (tuple2!2669 (_1!1345 (_ BitVec 64)) (_2!1345 V!3561)) )
))
(declare-datatypes ((List!1744 0))(
  ( (Nil!1741) (Cons!1740 (h!2348 tuple2!2668) (t!6344 List!1744)) )
))
(declare-datatypes ((ListLongMap!1717 0))(
  ( (ListLongMap!1718 (toList!874 List!1744)) )
))
(declare-fun lt!74809 () ListLongMap!1717)

(declare-fun contains!915 (ListLongMap!1717 (_ BitVec 64)) Bool)

(assert (=> b!143099 (= res!68133 (contains!915 lt!74809 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2670 0))(
  ( (tuple2!2671 (_1!1346 Bool) (_2!1346 LongMapFixedSize!1156)) )
))
(declare-fun lt!74808 () tuple2!2670)

(declare-fun update!211 (LongMapFixedSize!1156 (_ BitVec 64) V!3561) tuple2!2670)

(declare-fun get!1531 (ValueCell!1124 V!3561) V!3561)

(declare-fun dynLambda!437 (Int (_ BitVec 64)) V!3561)

(assert (=> b!143099 (= lt!74808 (update!211 newMap!16 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!68130 () Bool)

(assert (=> start!14884 (=> (not res!68130) (not e!93238))))

(declare-fun valid!563 (LongMap!936) Bool)

(assert (=> start!14884 (= res!68130 (valid!563 thiss!992))))

(assert (=> start!14884 e!93238))

(declare-fun e!93234 () Bool)

(assert (=> start!14884 e!93234))

(assert (=> start!14884 true))

(declare-fun e!93224 () Bool)

(assert (=> start!14884 e!93224))

(declare-fun b!143100 () Bool)

(declare-fun e!93229 () Bool)

(declare-fun e!93228 () Bool)

(assert (=> b!143100 (= e!93229 e!93228)))

(declare-fun b!143101 () Bool)

(assert (=> b!143101 (= e!93234 e!93229)))

(declare-fun b!143102 () Bool)

(assert (=> b!143102 (= e!93231 tp_is_empty!2935)))

(declare-fun mapIsEmpty!4855 () Bool)

(declare-fun mapRes!4855 () Bool)

(assert (=> mapIsEmpty!4855 mapRes!4855))

(declare-fun mapNonEmpty!4856 () Bool)

(declare-fun tp!11593 () Bool)

(declare-fun e!93235 () Bool)

(assert (=> mapNonEmpty!4856 (= mapRes!4855 (and tp!11593 e!93235))))

(declare-fun mapKey!4855 () (_ BitVec 32))

(declare-fun mapRest!4855 () (Array (_ BitVec 32) ValueCell!1124))

(declare-fun mapValue!4856 () ValueCell!1124)

(assert (=> mapNonEmpty!4856 (= (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (store mapRest!4855 mapKey!4855 mapValue!4856))))

(declare-fun b!143103 () Bool)

(declare-fun e!93226 () Bool)

(declare-fun e!93232 () Bool)

(assert (=> b!143103 (= e!93226 (and e!93232 mapRes!4856))))

(declare-fun condMapEmpty!4856 () Bool)

(declare-fun mapDefault!4855 () ValueCell!1124)

(assert (=> b!143103 (= condMapEmpty!4856 (= (arr!2309 (_values!2945 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4855)))))

(declare-fun b!143104 () Bool)

(assert (=> b!143104 (= e!93238 e!93227)))

(declare-fun res!68128 () Bool)

(assert (=> b!143104 (=> (not res!68128) (not e!93227))))

(declare-fun lt!74811 () ListLongMap!1717)

(assert (=> b!143104 (= res!68128 (and (= lt!74811 lt!74809) (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1427 (LongMapFixedSize!1156) ListLongMap!1717)

(assert (=> b!143104 (= lt!74809 (map!1427 newMap!16))))

(declare-fun getCurrentListMap!535 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) Int) ListLongMap!1717)

(assert (=> b!143104 (= lt!74811 (getCurrentListMap!535 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun b!143105 () Bool)

(declare-fun e!93236 () Bool)

(assert (=> b!143105 (= e!93233 (not e!93236))))

(declare-fun res!68129 () Bool)

(assert (=> b!143105 (=> res!68129 e!93236)))

(assert (=> b!143105 (= res!68129 (or (bvsge (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992)))))))))

(declare-datatypes ((List!1745 0))(
  ( (Nil!1742) (Cons!1741 (h!2349 (_ BitVec 64)) (t!6345 List!1745)) )
))
(declare-fun arrayNoDuplicates!0 (array!4887 (_ BitVec 32) List!1745) Bool)

(assert (=> b!143105 (arrayNoDuplicates!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) from!355 Nil!1742)))

(declare-datatypes ((Unit!4536 0))(
  ( (Unit!4537) )
))
(declare-fun lt!74812 () Unit!4536)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4887 (_ BitVec 32) (_ BitVec 32)) Unit!4536)

(assert (=> b!143105 (= lt!74812 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143105 (arrayContainsKey!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!74810 () Unit!4536)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!146 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) (_ BitVec 32) Int) Unit!4536)

(assert (=> b!143105 (= lt!74810 (lemmaListMapContainsThenArrayContainsFrom!146 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun e!93239 () Bool)

(declare-fun array_inv!1475 (array!4887) Bool)

(declare-fun array_inv!1476 (array!4889) Bool)

(assert (=> b!143106 (= e!93228 (and tp!11592 tp_is_empty!2935 (array_inv!1475 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (array_inv!1476 (_values!2945 (v!3290 (underlying!479 thiss!992)))) e!93239))))

(declare-fun b!143107 () Bool)

(assert (=> b!143107 (= e!93235 tp_is_empty!2935)))

(declare-fun b!143108 () Bool)

(assert (=> b!143108 (= e!93232 tp_is_empty!2935)))

(declare-fun b!143109 () Bool)

(assert (=> b!143109 (= e!93239 (and e!93225 mapRes!4855))))

(declare-fun condMapEmpty!4855 () Bool)

(declare-fun mapDefault!4856 () ValueCell!1124)

(assert (=> b!143109 (= condMapEmpty!4855 (= (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4856)))))

(declare-fun b!143110 () Bool)

(declare-fun res!68127 () Bool)

(assert (=> b!143110 (=> (not res!68127) (not e!93238))))

(assert (=> b!143110 (= res!68127 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7313 newMap!16)) (_size!627 (v!3290 (underlying!479 thiss!992)))))))

(assert (=> b!143111 (= e!93224 (and tp!11591 tp_is_empty!2935 (array_inv!1475 (_keys!4724 newMap!16)) (array_inv!1476 (_values!2945 newMap!16)) e!93226))))

(declare-fun mapIsEmpty!4856 () Bool)

(assert (=> mapIsEmpty!4856 mapRes!4856))

(declare-fun b!143112 () Bool)

(declare-fun noDuplicate!51 (List!1745) Bool)

(assert (=> b!143112 (= e!93236 (noDuplicate!51 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742)))))

(declare-fun b!143113 () Bool)

(declare-fun res!68131 () Bool)

(assert (=> b!143113 (=> (not res!68131) (not e!93238))))

(declare-fun valid!564 (LongMapFixedSize!1156) Bool)

(assert (=> b!143113 (= res!68131 (valid!564 newMap!16))))

(assert (= (and start!14884 res!68130) b!143098))

(assert (= (and b!143098 res!68132) b!143113))

(assert (= (and b!143113 res!68131) b!143110))

(assert (= (and b!143110 res!68127) b!143104))

(assert (= (and b!143104 res!68128) b!143099))

(assert (= (and b!143099 res!68133) b!143105))

(assert (= (and b!143105 (not res!68129)) b!143112))

(assert (= (and b!143109 condMapEmpty!4855) mapIsEmpty!4855))

(assert (= (and b!143109 (not condMapEmpty!4855)) mapNonEmpty!4856))

(get-info :version)

(assert (= (and mapNonEmpty!4856 ((_ is ValueCellFull!1124) mapValue!4856)) b!143107))

(assert (= (and b!143109 ((_ is ValueCellFull!1124) mapDefault!4856)) b!143097))

(assert (= b!143106 b!143109))

(assert (= b!143100 b!143106))

(assert (= b!143101 b!143100))

(assert (= start!14884 b!143101))

(assert (= (and b!143103 condMapEmpty!4856) mapIsEmpty!4856))

(assert (= (and b!143103 (not condMapEmpty!4856)) mapNonEmpty!4855))

(assert (= (and mapNonEmpty!4855 ((_ is ValueCellFull!1124) mapValue!4855)) b!143102))

(assert (= (and b!143103 ((_ is ValueCellFull!1124) mapDefault!4855)) b!143108))

(assert (= b!143111 b!143103))

(assert (= start!14884 b!143111))

(declare-fun b_lambda!6413 () Bool)

(assert (=> (not b_lambda!6413) (not b!143099)))

(declare-fun t!6341 () Bool)

(declare-fun tb!2561 () Bool)

(assert (=> (and b!143106 (= (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))) t!6341) tb!2561))

(declare-fun result!4199 () Bool)

(assert (=> tb!2561 (= result!4199 tp_is_empty!2935)))

(assert (=> b!143099 t!6341))

(declare-fun b_and!8897 () Bool)

(assert (= b_and!8893 (and (=> t!6341 result!4199) b_and!8897)))

(declare-fun tb!2563 () Bool)

(declare-fun t!6343 () Bool)

(assert (=> (and b!143111 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))) t!6343) tb!2563))

(declare-fun result!4203 () Bool)

(assert (= result!4203 result!4199))

(assert (=> b!143099 t!6343))

(declare-fun b_and!8899 () Bool)

(assert (= b_and!8895 (and (=> t!6343 result!4203) b_and!8899)))

(declare-fun m!172451 () Bool)

(assert (=> b!143111 m!172451))

(declare-fun m!172453 () Bool)

(assert (=> b!143111 m!172453))

(declare-fun m!172455 () Bool)

(assert (=> b!143106 m!172455))

(declare-fun m!172457 () Bool)

(assert (=> b!143106 m!172457))

(declare-fun m!172459 () Bool)

(assert (=> b!143105 m!172459))

(declare-fun m!172461 () Bool)

(assert (=> b!143105 m!172461))

(declare-fun m!172463 () Bool)

(assert (=> b!143105 m!172463))

(declare-fun m!172465 () Bool)

(assert (=> b!143105 m!172465))

(assert (=> b!143105 m!172463))

(assert (=> b!143105 m!172463))

(declare-fun m!172467 () Bool)

(assert (=> b!143105 m!172467))

(assert (=> b!143112 m!172463))

(declare-fun m!172469 () Bool)

(assert (=> b!143112 m!172469))

(declare-fun m!172471 () Bool)

(assert (=> b!143099 m!172471))

(declare-fun m!172473 () Bool)

(assert (=> b!143099 m!172473))

(declare-fun m!172475 () Bool)

(assert (=> b!143099 m!172475))

(assert (=> b!143099 m!172463))

(assert (=> b!143099 m!172473))

(assert (=> b!143099 m!172463))

(declare-fun m!172477 () Bool)

(assert (=> b!143099 m!172477))

(assert (=> b!143099 m!172463))

(assert (=> b!143099 m!172475))

(declare-fun m!172479 () Bool)

(assert (=> b!143099 m!172479))

(assert (=> b!143099 m!172471))

(declare-fun m!172481 () Bool)

(assert (=> mapNonEmpty!4856 m!172481))

(declare-fun m!172483 () Bool)

(assert (=> mapNonEmpty!4855 m!172483))

(declare-fun m!172485 () Bool)

(assert (=> b!143113 m!172485))

(declare-fun m!172487 () Bool)

(assert (=> start!14884 m!172487))

(assert (=> b!143104 m!172463))

(declare-fun m!172489 () Bool)

(assert (=> b!143104 m!172489))

(declare-fun m!172491 () Bool)

(assert (=> b!143104 m!172491))

(check-sat (not b!143111) (not b!143112) (not mapNonEmpty!4856) (not b_lambda!6413) (not mapNonEmpty!4855) (not b!143113) (not b!143105) b_and!8897 (not b!143099) (not b!143104) tp_is_empty!2935 (not b!143106) b_and!8899 (not b_next!3039) (not start!14884) (not b_next!3037))
(check-sat b_and!8897 b_and!8899 (not b_next!3037) (not b_next!3039))
(get-model)

(declare-fun b_lambda!6419 () Bool)

(assert (= b_lambda!6413 (or (and b!143106 b_free!3037) (and b!143111 b_free!3039 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))))) b_lambda!6419)))

(check-sat (not b!143111) (not b!143112) (not mapNonEmpty!4856) (not mapNonEmpty!4855) (not b!143113) (not b!143105) b_and!8897 (not b_lambda!6419) (not b!143099) (not b!143104) tp_is_empty!2935 (not b!143106) b_and!8899 (not b_next!3039) (not start!14884) (not b_next!3037))
(check-sat b_and!8897 b_and!8899 (not b_next!3037) (not b_next!3039))
(get-model)

(declare-fun d!45781 () Bool)

(assert (=> d!45781 (= (array_inv!1475 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvsge (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143106 d!45781))

(declare-fun d!45783 () Bool)

(assert (=> d!45783 (= (array_inv!1476 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (bvsge (size!2583 (_values!2945 (v!3290 (underlying!479 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143106 d!45783))

(declare-fun d!45785 () Bool)

(declare-fun res!68180 () Bool)

(declare-fun e!93340 () Bool)

(assert (=> d!45785 (=> res!68180 e!93340)))

(assert (=> d!45785 (= res!68180 ((_ is Nil!1742) (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742)))))

(assert (=> d!45785 (= (noDuplicate!51 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742)) e!93340)))

(declare-fun b!143226 () Bool)

(declare-fun e!93341 () Bool)

(assert (=> b!143226 (= e!93340 e!93341)))

(declare-fun res!68181 () Bool)

(assert (=> b!143226 (=> (not res!68181) (not e!93341))))

(declare-fun contains!917 (List!1745 (_ BitVec 64)) Bool)

(assert (=> b!143226 (= res!68181 (not (contains!917 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742)) (h!2349 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742)))))))

(declare-fun b!143227 () Bool)

(assert (=> b!143227 (= e!93341 (noDuplicate!51 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))))))

(assert (= (and d!45785 (not res!68180)) b!143226))

(assert (= (and b!143226 res!68181) b!143227))

(declare-fun m!172577 () Bool)

(assert (=> b!143226 m!172577))

(declare-fun m!172579 () Bool)

(assert (=> b!143227 m!172579))

(assert (=> b!143112 d!45785))

(declare-fun d!45787 () Bool)

(declare-fun e!93346 () Bool)

(assert (=> d!45787 e!93346))

(declare-fun res!68184 () Bool)

(assert (=> d!45787 (=> res!68184 e!93346)))

(declare-fun lt!74853 () Bool)

(assert (=> d!45787 (= res!68184 (not lt!74853))))

(declare-fun lt!74852 () Bool)

(assert (=> d!45787 (= lt!74853 lt!74852)))

(declare-fun lt!74854 () Unit!4536)

(declare-fun e!93347 () Unit!4536)

(assert (=> d!45787 (= lt!74854 e!93347)))

(declare-fun c!27124 () Bool)

(assert (=> d!45787 (= c!27124 lt!74852)))

(declare-fun containsKey!179 (List!1744 (_ BitVec 64)) Bool)

(assert (=> d!45787 (= lt!74852 (containsKey!179 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> d!45787 (= (contains!915 lt!74809 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) lt!74853)))

(declare-fun b!143234 () Bool)

(declare-fun lt!74851 () Unit!4536)

(assert (=> b!143234 (= e!93347 lt!74851)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!128 (List!1744 (_ BitVec 64)) Unit!4536)

(assert (=> b!143234 (= lt!74851 (lemmaContainsKeyImpliesGetValueByKeyDefined!128 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-datatypes ((Option!181 0))(
  ( (Some!180 (v!3296 V!3561)) (None!179) )
))
(declare-fun isDefined!129 (Option!181) Bool)

(declare-fun getValueByKey!175 (List!1744 (_ BitVec 64)) Option!181)

(assert (=> b!143234 (isDefined!129 (getValueByKey!175 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143235 () Bool)

(declare-fun Unit!4542 () Unit!4536)

(assert (=> b!143235 (= e!93347 Unit!4542)))

(declare-fun b!143236 () Bool)

(assert (=> b!143236 (= e!93346 (isDefined!129 (getValueByKey!175 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))))))

(assert (= (and d!45787 c!27124) b!143234))

(assert (= (and d!45787 (not c!27124)) b!143235))

(assert (= (and d!45787 (not res!68184)) b!143236))

(assert (=> d!45787 m!172463))

(declare-fun m!172581 () Bool)

(assert (=> d!45787 m!172581))

(assert (=> b!143234 m!172463))

(declare-fun m!172583 () Bool)

(assert (=> b!143234 m!172583))

(assert (=> b!143234 m!172463))

(declare-fun m!172585 () Bool)

(assert (=> b!143234 m!172585))

(assert (=> b!143234 m!172585))

(declare-fun m!172587 () Bool)

(assert (=> b!143234 m!172587))

(assert (=> b!143236 m!172463))

(assert (=> b!143236 m!172585))

(assert (=> b!143236 m!172585))

(assert (=> b!143236 m!172587))

(assert (=> b!143099 d!45787))

(declare-fun b!143317 () Bool)

(declare-fun lt!74932 () Unit!4536)

(declare-fun lt!74930 () Unit!4536)

(assert (=> b!143317 (= lt!74932 lt!74930)))

(declare-fun call!15864 () Bool)

(assert (=> b!143317 call!15864))

(declare-datatypes ((SeekEntryResult!283 0))(
  ( (MissingZero!283 (index!3296 (_ BitVec 32))) (Found!283 (index!3297 (_ BitVec 32))) (Intermediate!283 (undefined!1095 Bool) (index!3298 (_ BitVec 32)) (x!16336 (_ BitVec 32))) (Undefined!283) (MissingVacant!283 (index!3299 (_ BitVec 32))) )
))
(declare-fun lt!74911 () SeekEntryResult!283)

(declare-fun lt!74910 () array!4889)

(declare-fun lemmaValidKeyInArrayIsInListMap!125 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) Int) Unit!4536)

(assert (=> b!143317 (= lt!74930 (lemmaValidKeyInArrayIsInListMap!125 (_keys!4724 newMap!16) lt!74910 (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3297 lt!74911) (defaultEntry!2962 newMap!16)))))

(assert (=> b!143317 (= lt!74910 (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16))))))

(declare-fun lt!74922 () Unit!4536)

(declare-fun lt!74921 () Unit!4536)

(assert (=> b!143317 (= lt!74922 lt!74921)))

(declare-fun call!15854 () ListLongMap!1717)

(declare-fun call!15847 () ListLongMap!1717)

(assert (=> b!143317 (= call!15854 call!15847)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!66 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) (_ BitVec 64) V!3561 Int) Unit!4536)

(assert (=> b!143317 (= lt!74921 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3297 lt!74911) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(declare-fun lt!74916 () Unit!4536)

(declare-fun e!93391 () Unit!4536)

(assert (=> b!143317 (= lt!74916 e!93391)))

(declare-fun c!27159 () Bool)

(assert (=> b!143317 (= c!27159 (contains!915 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun e!93400 () tuple2!2670)

(assert (=> b!143317 (= e!93400 (tuple2!2671 true (LongMapFixedSize!1157 (defaultEntry!2962 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (_size!627 newMap!16) (_keys!4724 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16))) (_vacant!627 newMap!16))))))

(declare-fun b!143318 () Bool)

(declare-fun e!93402 () Bool)

(declare-fun call!15848 () Bool)

(assert (=> b!143318 (= e!93402 (not call!15848))))

(declare-fun e!93405 () ListLongMap!1717)

(declare-fun bm!15841 () Bool)

(declare-fun c!27156 () Bool)

(declare-fun c!27154 () Bool)

(declare-fun +!168 (ListLongMap!1717 tuple2!2668) ListLongMap!1717)

(assert (=> bm!15841 (= call!15854 (+!168 e!93405 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!27155 () Bool)

(assert (=> bm!15841 (= c!27155 c!27154)))

(declare-fun b!143319 () Bool)

(declare-fun e!93396 () Bool)

(declare-fun lt!74920 () SeekEntryResult!283)

(assert (=> b!143319 (= e!93396 ((_ is Undefined!283) lt!74920))))

(declare-fun b!143320 () Bool)

(declare-fun res!68213 () Bool)

(declare-fun e!93392 () Bool)

(assert (=> b!143320 (=> (not res!68213) (not e!93392))))

(declare-fun call!15846 () Bool)

(assert (=> b!143320 (= res!68213 call!15846)))

(declare-fun e!93408 () Bool)

(assert (=> b!143320 (= e!93408 e!93392)))

(declare-fun b!143321 () Bool)

(declare-fun lt!74929 () Unit!4536)

(declare-fun lt!74915 () Unit!4536)

(assert (=> b!143321 (= lt!74929 lt!74915)))

(declare-fun call!15851 () ListLongMap!1717)

(declare-fun call!15857 () ListLongMap!1717)

(assert (=> b!143321 (= call!15851 call!15857)))

(declare-fun lt!74927 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!66 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 V!3561 Int) Unit!4536)

(assert (=> b!143321 (= lt!74915 (lemmaChangeZeroKeyThenAddPairToListMap!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) lt!74927 (zeroValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) (defaultEntry!2962 newMap!16)))))

(assert (=> b!143321 (= lt!74927 (bvor (extraKeys!2713 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!93390 () tuple2!2670)

(assert (=> b!143321 (= e!93390 (tuple2!2671 true (LongMapFixedSize!1157 (defaultEntry!2962 newMap!16) (mask!7313 newMap!16) (bvor (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) (_size!627 newMap!16) (_keys!4724 newMap!16) (_values!2945 newMap!16) (_vacant!627 newMap!16))))))

(declare-fun b!143322 () Bool)

(declare-fun call!15861 () ListLongMap!1717)

(assert (=> b!143322 (= e!93405 call!15861)))

(declare-fun bm!15842 () Bool)

(declare-fun call!15863 () ListLongMap!1717)

(assert (=> bm!15842 (= call!15863 (map!1427 newMap!16))))

(declare-fun d!45789 () Bool)

(declare-fun e!93395 () Bool)

(assert (=> d!45789 e!93395))

(declare-fun res!68225 () Bool)

(assert (=> d!45789 (=> (not res!68225) (not e!93395))))

(declare-fun lt!74917 () tuple2!2670)

(assert (=> d!45789 (= res!68225 (valid!564 (_2!1346 lt!74917)))))

(declare-fun e!93404 () tuple2!2670)

(assert (=> d!45789 (= lt!74917 e!93404)))

(assert (=> d!45789 (= c!27154 (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvneg (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))))))

(assert (=> d!45789 (valid!564 newMap!16)))

(assert (=> d!45789 (= (update!211 newMap!16 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!74917)))

(declare-fun b!143323 () Bool)

(declare-fun e!93399 () tuple2!2670)

(declare-fun lt!74913 () tuple2!2670)

(assert (=> b!143323 (= e!93399 (tuple2!2671 (_1!1346 lt!74913) (_2!1346 lt!74913)))))

(declare-fun call!15853 () tuple2!2670)

(assert (=> b!143323 (= lt!74913 call!15853)))

(declare-fun b!143324 () Bool)

(assert (=> b!143324 (= e!93399 e!93400)))

(declare-fun c!27158 () Bool)

(assert (=> b!143324 (= c!27158 ((_ is MissingZero!283) lt!74911))))

(declare-fun b!143325 () Bool)

(declare-fun c!27162 () Bool)

(assert (=> b!143325 (= c!27162 ((_ is MissingVacant!283) lt!74920))))

(declare-fun e!93397 () Bool)

(assert (=> b!143325 (= e!93397 e!93396)))

(declare-fun b!143326 () Bool)

(declare-fun lt!74925 () tuple2!2670)

(assert (=> b!143326 (= lt!74925 call!15853)))

(assert (=> b!143326 (= e!93400 (tuple2!2671 (_1!1346 lt!74925) (_2!1346 lt!74925)))))

(declare-fun bm!15843 () Bool)

(declare-fun call!15844 () ListLongMap!1717)

(assert (=> bm!15843 (= call!15844 (map!1427 (_2!1346 lt!74917)))))

(declare-fun bm!15844 () Bool)

(declare-fun call!15859 () Bool)

(assert (=> bm!15844 (= call!15859 (arrayContainsKey!0 (_keys!4724 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!15845 () Bool)

(declare-fun call!15845 () Bool)

(assert (=> bm!15845 (= call!15845 call!15859)))

(declare-fun b!143327 () Bool)

(declare-fun e!93393 () Bool)

(assert (=> b!143327 (= e!93393 e!93402)))

(declare-fun res!68221 () Bool)

(assert (=> b!143327 (= res!68221 call!15846)))

(assert (=> b!143327 (=> (not res!68221) (not e!93402))))

(declare-fun b!143328 () Bool)

(declare-fun e!93410 () Bool)

(assert (=> b!143328 (= e!93410 (not call!15845))))

(declare-fun b!143329 () Bool)

(declare-fun res!68226 () Bool)

(declare-fun call!15856 () Bool)

(assert (=> b!143329 (= res!68226 call!15856)))

(declare-fun e!93394 () Bool)

(assert (=> b!143329 (=> (not res!68226) (not e!93394))))

(declare-fun bm!15846 () Bool)

(declare-fun call!15862 () Unit!4536)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) Int) Unit!4536)

(assert (=> bm!15846 (= call!15862 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(declare-fun b!143330 () Bool)

(declare-fun lt!74933 () Unit!4536)

(declare-fun lt!74931 () Unit!4536)

(assert (=> b!143330 (= lt!74933 lt!74931)))

(assert (=> b!143330 (= call!15851 call!15857)))

(declare-fun lt!74918 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!66 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 V!3561 Int) Unit!4536)

(assert (=> b!143330 (= lt!74931 (lemmaChangeLongMinValueKeyThenAddPairToListMap!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) lt!74918 (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(assert (=> b!143330 (= lt!74918 (bvor (extraKeys!2713 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!143330 (= e!93390 (tuple2!2671 true (LongMapFixedSize!1157 (defaultEntry!2962 newMap!16) (mask!7313 newMap!16) (bvor (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) (zeroValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!627 newMap!16) (_keys!4724 newMap!16) (_values!2945 newMap!16) (_vacant!627 newMap!16))))))

(declare-fun b!143331 () Bool)

(declare-fun c!27163 () Bool)

(assert (=> b!143331 (= c!27163 ((_ is MissingVacant!283) lt!74911))))

(declare-fun e!93409 () tuple2!2670)

(assert (=> b!143331 (= e!93409 e!93399)))

(declare-fun b!143332 () Bool)

(declare-fun e!93407 () Bool)

(assert (=> b!143332 (= e!93407 (= call!15844 call!15863))))

(declare-fun b!143333 () Bool)

(declare-fun e!93401 () Bool)

(assert (=> b!143333 (= e!93401 (not call!15845))))

(declare-fun lt!74935 () SeekEntryResult!283)

(declare-fun c!27152 () Bool)

(declare-fun c!27157 () Bool)

(declare-fun lt!74923 () SeekEntryResult!283)

(declare-fun bm!15847 () Bool)

(declare-fun c!27153 () Bool)

(declare-fun lt!74912 () SeekEntryResult!283)

(declare-fun c!27160 () Bool)

(declare-fun call!15867 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!15847 (= call!15867 (inRange!0 (ite c!27160 (ite c!27153 (index!3297 lt!74935) (ite c!27152 (index!3296 lt!74923) (index!3299 lt!74923))) (ite c!27159 (index!3297 lt!74912) (ite c!27157 (index!3296 lt!74920) (index!3299 lt!74920)))) (mask!7313 newMap!16)))))

(declare-fun bm!15848 () Bool)

(declare-fun call!15852 () SeekEntryResult!283)

(declare-fun call!15858 () SeekEntryResult!283)

(assert (=> bm!15848 (= call!15852 call!15858)))

(declare-fun bm!15849 () Bool)

(declare-fun call!15865 () ListLongMap!1717)

(assert (=> bm!15849 (= call!15857 call!15865)))

(declare-fun b!143334 () Bool)

(declare-fun e!93406 () Bool)

(assert (=> b!143334 (= e!93407 e!93406)))

(declare-fun res!68214 () Bool)

(assert (=> b!143334 (= res!68214 (contains!915 call!15844 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> b!143334 (=> (not res!68214) (not e!93406))))

(declare-fun bm!15850 () Bool)

(assert (=> bm!15850 (= call!15861 call!15847)))

(declare-fun b!143335 () Bool)

(assert (=> b!143335 (= e!93393 ((_ is Undefined!283) lt!74923))))

(declare-fun b!143336 () Bool)

(declare-fun c!27151 () Bool)

(assert (=> b!143336 (= c!27151 ((_ is MissingVacant!283) lt!74923))))

(assert (=> b!143336 (= e!93408 e!93393)))

(declare-fun bm!15851 () Bool)

(assert (=> bm!15851 (= call!15846 call!15856)))

(declare-fun bm!15852 () Bool)

(declare-fun call!15849 () Bool)

(assert (=> bm!15852 (= call!15849 call!15867)))

(declare-fun call!15850 () ListLongMap!1717)

(declare-fun bm!15853 () Bool)

(assert (=> bm!15853 (= call!15864 (contains!915 call!15850 (ite c!27160 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!74911)))))))

(declare-fun b!143337 () Bool)

(assert (=> b!143337 (= e!93404 e!93409)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4887 (_ BitVec 32)) SeekEntryResult!283)

(assert (=> b!143337 (= lt!74911 (seekEntryOrOpen!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (_keys!4724 newMap!16) (mask!7313 newMap!16)))))

(assert (=> b!143337 (= c!27160 ((_ is Undefined!283) lt!74911))))

(declare-fun b!143338 () Bool)

(declare-fun lt!74934 () Unit!4536)

(declare-fun e!93403 () Unit!4536)

(assert (=> b!143338 (= lt!74934 e!93403)))

(assert (=> b!143338 (= c!27153 call!15864)))

(assert (=> b!143338 (= e!93409 (tuple2!2671 false newMap!16))))

(declare-fun b!143339 () Bool)

(assert (=> b!143339 (= e!93394 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!74935)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143340 () Bool)

(declare-fun res!68224 () Bool)

(assert (=> b!143340 (=> (not res!68224) (not e!93392))))

(assert (=> b!143340 (= res!68224 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3296 lt!74923)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15854 () Bool)

(assert (=> bm!15854 (= call!15848 call!15859)))

(declare-fun b!143341 () Bool)

(assert (=> b!143341 (= e!93396 e!93401)))

(declare-fun res!68220 () Bool)

(declare-fun call!15866 () Bool)

(assert (=> b!143341 (= res!68220 call!15866)))

(assert (=> b!143341 (=> (not res!68220) (not e!93401))))

(declare-fun b!143342 () Bool)

(assert (=> b!143342 (= e!93406 (= call!15844 (+!168 call!15863 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!143343 () Bool)

(declare-fun lt!74924 () Unit!4536)

(assert (=> b!143343 (= e!93391 lt!74924)))

(declare-fun call!15860 () Unit!4536)

(assert (=> b!143343 (= lt!74924 call!15860)))

(assert (=> b!143343 (= lt!74912 call!15852)))

(declare-fun res!68216 () Bool)

(assert (=> b!143343 (= res!68216 ((_ is Found!283) lt!74912))))

(declare-fun e!93398 () Bool)

(assert (=> b!143343 (=> (not res!68216) (not e!93398))))

(assert (=> b!143343 e!93398))

(declare-fun b!143344 () Bool)

(declare-fun lt!74928 () Unit!4536)

(assert (=> b!143344 (= e!93403 lt!74928)))

(assert (=> b!143344 (= lt!74928 call!15862)))

(declare-fun call!15855 () SeekEntryResult!283)

(assert (=> b!143344 (= lt!74923 call!15855)))

(assert (=> b!143344 (= c!27152 ((_ is MissingZero!283) lt!74923))))

(assert (=> b!143344 e!93408))

(declare-fun bm!15855 () Bool)

(assert (=> bm!15855 (= call!15850 call!15865)))

(declare-fun b!143345 () Bool)

(declare-fun Unit!4543 () Unit!4536)

(assert (=> b!143345 (= e!93403 Unit!4543)))

(declare-fun lt!74909 () Unit!4536)

(assert (=> b!143345 (= lt!74909 call!15860)))

(assert (=> b!143345 (= lt!74935 call!15855)))

(declare-fun res!68223 () Bool)

(assert (=> b!143345 (= res!68223 ((_ is Found!283) lt!74935))))

(assert (=> b!143345 (=> (not res!68223) (not e!93394))))

(assert (=> b!143345 e!93394))

(declare-fun lt!74926 () Unit!4536)

(assert (=> b!143345 (= lt!74926 lt!74909)))

(assert (=> b!143345 false))

(declare-fun bm!15856 () Bool)

(assert (=> bm!15856 (= call!15851 call!15854)))

(declare-fun b!143346 () Bool)

(declare-fun res!68217 () Bool)

(assert (=> b!143346 (= res!68217 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3299 lt!74923)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143346 (=> (not res!68217) (not e!93402))))

(declare-fun b!143347 () Bool)

(assert (=> b!143347 (= e!93398 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!74912)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143348 () Bool)

(assert (=> b!143348 (= e!93405 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun b!143349 () Bool)

(declare-fun res!68222 () Bool)

(assert (=> b!143349 (= res!68222 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3299 lt!74920)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143349 (=> (not res!68222) (not e!93401))))

(declare-fun bm!15857 () Bool)

(assert (=> bm!15857 (= call!15858 (seekEntryOrOpen!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (_keys!4724 newMap!16) (mask!7313 newMap!16)))))

(declare-fun bm!15858 () Bool)

(assert (=> bm!15858 (= call!15865 (getCurrentListMap!535 (_keys!4724 newMap!16) (ite (or c!27154 c!27160) (_values!2945 newMap!16) lt!74910) (mask!7313 newMap!16) (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun b!143350 () Bool)

(declare-fun res!68218 () Bool)

(assert (=> b!143350 (=> (not res!68218) (not e!93410))))

(assert (=> b!143350 (= res!68218 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3296 lt!74920)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15859 () Bool)

(assert (=> bm!15859 (= call!15866 call!15849)))

(declare-fun b!143351 () Bool)

(assert (=> b!143351 (= e!93392 (not call!15848))))

(declare-fun b!143352 () Bool)

(declare-fun Unit!4544 () Unit!4536)

(assert (=> b!143352 (= e!93391 Unit!4544)))

(declare-fun lt!74919 () Unit!4536)

(assert (=> b!143352 (= lt!74919 call!15862)))

(assert (=> b!143352 (= lt!74920 call!15852)))

(assert (=> b!143352 (= c!27157 ((_ is MissingZero!283) lt!74920))))

(assert (=> b!143352 e!93397))

(declare-fun lt!74914 () Unit!4536)

(assert (=> b!143352 (= lt!74914 lt!74919)))

(assert (=> b!143352 false))

(declare-fun bm!15860 () Bool)

(assert (=> bm!15860 (= call!15856 call!15867)))

(declare-fun b!143353 () Bool)

(declare-fun res!68215 () Bool)

(assert (=> b!143353 (=> (not res!68215) (not e!93410))))

(assert (=> b!143353 (= res!68215 call!15866)))

(assert (=> b!143353 (= e!93397 e!93410)))

(declare-fun b!143354 () Bool)

(assert (=> b!143354 (= e!93404 e!93390)))

(assert (=> b!143354 (= c!27156 (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15861 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) Int) Unit!4536)

(assert (=> bm!15861 (= call!15860 (lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(declare-fun b!143355 () Bool)

(assert (=> b!143355 (= e!93395 e!93407)))

(declare-fun c!27161 () Bool)

(assert (=> b!143355 (= c!27161 (_1!1346 lt!74917))))

(declare-fun b!143356 () Bool)

(declare-fun res!68219 () Bool)

(assert (=> b!143356 (= res!68219 call!15849)))

(assert (=> b!143356 (=> (not res!68219) (not e!93398))))

(declare-fun bm!15862 () Bool)

(assert (=> bm!15862 (= call!15855 call!15858)))

(declare-fun bm!15863 () Bool)

(assert (=> bm!15863 (= call!15847 (getCurrentListMap!535 (_keys!4724 newMap!16) (ite c!27154 (_values!2945 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16)))) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun bm!15864 () Bool)

(declare-fun updateHelperNewKey!66 (LongMapFixedSize!1156 (_ BitVec 64) V!3561 (_ BitVec 32)) tuple2!2670)

(assert (=> bm!15864 (= call!15853 (updateHelperNewKey!66 newMap!16 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911))))))

(assert (= (and d!45789 c!27154) b!143354))

(assert (= (and d!45789 (not c!27154)) b!143337))

(assert (= (and b!143354 c!27156) b!143321))

(assert (= (and b!143354 (not c!27156)) b!143330))

(assert (= (or b!143321 b!143330) bm!15850))

(assert (= (or b!143321 b!143330) bm!15849))

(assert (= (or b!143321 b!143330) bm!15856))

(assert (= (and b!143337 c!27160) b!143338))

(assert (= (and b!143337 (not c!27160)) b!143331))

(assert (= (and b!143338 c!27153) b!143345))

(assert (= (and b!143338 (not c!27153)) b!143344))

(assert (= (and b!143345 res!68223) b!143329))

(assert (= (and b!143329 res!68226) b!143339))

(assert (= (and b!143344 c!27152) b!143320))

(assert (= (and b!143344 (not c!27152)) b!143336))

(assert (= (and b!143320 res!68213) b!143340))

(assert (= (and b!143340 res!68224) b!143351))

(assert (= (and b!143336 c!27151) b!143327))

(assert (= (and b!143336 (not c!27151)) b!143335))

(assert (= (and b!143327 res!68221) b!143346))

(assert (= (and b!143346 res!68217) b!143318))

(assert (= (or b!143320 b!143327) bm!15851))

(assert (= (or b!143351 b!143318) bm!15854))

(assert (= (or b!143329 bm!15851) bm!15860))

(assert (= (or b!143345 b!143344) bm!15862))

(assert (= (and b!143331 c!27163) b!143323))

(assert (= (and b!143331 (not c!27163)) b!143324))

(assert (= (and b!143324 c!27158) b!143326))

(assert (= (and b!143324 (not c!27158)) b!143317))

(assert (= (and b!143317 c!27159) b!143343))

(assert (= (and b!143317 (not c!27159)) b!143352))

(assert (= (and b!143343 res!68216) b!143356))

(assert (= (and b!143356 res!68219) b!143347))

(assert (= (and b!143352 c!27157) b!143353))

(assert (= (and b!143352 (not c!27157)) b!143325))

(assert (= (and b!143353 res!68215) b!143350))

(assert (= (and b!143350 res!68218) b!143328))

(assert (= (and b!143325 c!27162) b!143341))

(assert (= (and b!143325 (not c!27162)) b!143319))

(assert (= (and b!143341 res!68220) b!143349))

(assert (= (and b!143349 res!68222) b!143333))

(assert (= (or b!143353 b!143341) bm!15859))

(assert (= (or b!143328 b!143333) bm!15845))

(assert (= (or b!143356 bm!15859) bm!15852))

(assert (= (or b!143343 b!143352) bm!15848))

(assert (= (or b!143323 b!143326) bm!15864))

(assert (= (or bm!15862 bm!15848) bm!15857))

(assert (= (or b!143345 b!143343) bm!15861))

(assert (= (or bm!15854 bm!15845) bm!15844))

(assert (= (or b!143344 b!143352) bm!15846))

(assert (= (or b!143338 b!143317) bm!15855))

(assert (= (or bm!15860 bm!15852) bm!15847))

(assert (= (or b!143338 b!143317) bm!15853))

(assert (= (or bm!15850 b!143317) bm!15863))

(assert (= (or bm!15849 bm!15855) bm!15858))

(assert (= (or bm!15856 b!143317) bm!15841))

(assert (= (and bm!15841 c!27155) b!143322))

(assert (= (and bm!15841 (not c!27155)) b!143348))

(assert (= (and d!45789 res!68225) b!143355))

(assert (= (and b!143355 c!27161) b!143334))

(assert (= (and b!143355 (not c!27161)) b!143332))

(assert (= (and b!143334 res!68214) b!143342))

(assert (= (or b!143334 b!143342 b!143332) bm!15843))

(assert (= (or b!143342 b!143332) bm!15842))

(declare-fun m!172589 () Bool)

(assert (=> bm!15853 m!172589))

(declare-fun m!172591 () Bool)

(assert (=> bm!15853 m!172591))

(declare-fun m!172593 () Bool)

(assert (=> b!143350 m!172593))

(assert (=> bm!15861 m!172463))

(declare-fun m!172595 () Bool)

(assert (=> bm!15861 m!172595))

(assert (=> bm!15844 m!172463))

(declare-fun m!172597 () Bool)

(assert (=> bm!15844 m!172597))

(assert (=> bm!15842 m!172489))

(declare-fun m!172599 () Bool)

(assert (=> b!143339 m!172599))

(declare-fun m!172601 () Bool)

(assert (=> bm!15847 m!172601))

(declare-fun m!172603 () Bool)

(assert (=> bm!15863 m!172603))

(declare-fun m!172605 () Bool)

(assert (=> bm!15863 m!172605))

(assert (=> b!143330 m!172475))

(declare-fun m!172607 () Bool)

(assert (=> b!143330 m!172607))

(assert (=> b!143334 m!172463))

(declare-fun m!172609 () Bool)

(assert (=> b!143334 m!172609))

(assert (=> bm!15846 m!172463))

(declare-fun m!172611 () Bool)

(assert (=> bm!15846 m!172611))

(declare-fun m!172613 () Bool)

(assert (=> b!143346 m!172613))

(assert (=> b!143321 m!172475))

(declare-fun m!172615 () Bool)

(assert (=> b!143321 m!172615))

(declare-fun m!172617 () Bool)

(assert (=> b!143342 m!172617))

(assert (=> bm!15864 m!172463))

(assert (=> bm!15864 m!172475))

(declare-fun m!172619 () Bool)

(assert (=> bm!15864 m!172619))

(assert (=> b!143317 m!172603))

(declare-fun m!172621 () Bool)

(assert (=> b!143317 m!172621))

(assert (=> b!143317 m!172463))

(declare-fun m!172623 () Bool)

(assert (=> b!143317 m!172623))

(declare-fun m!172625 () Bool)

(assert (=> b!143317 m!172625))

(assert (=> b!143317 m!172621))

(assert (=> b!143317 m!172463))

(assert (=> b!143317 m!172475))

(declare-fun m!172627 () Bool)

(assert (=> b!143317 m!172627))

(assert (=> b!143337 m!172463))

(declare-fun m!172629 () Bool)

(assert (=> b!143337 m!172629))

(declare-fun m!172631 () Bool)

(assert (=> bm!15843 m!172631))

(declare-fun m!172633 () Bool)

(assert (=> d!45789 m!172633))

(assert (=> d!45789 m!172485))

(assert (=> b!143348 m!172621))

(declare-fun m!172635 () Bool)

(assert (=> bm!15858 m!172635))

(declare-fun m!172637 () Bool)

(assert (=> b!143340 m!172637))

(declare-fun m!172639 () Bool)

(assert (=> b!143349 m!172639))

(declare-fun m!172641 () Bool)

(assert (=> bm!15841 m!172641))

(assert (=> bm!15857 m!172463))

(assert (=> bm!15857 m!172629))

(declare-fun m!172643 () Bool)

(assert (=> b!143347 m!172643))

(assert (=> b!143099 d!45789))

(declare-fun d!45791 () Bool)

(declare-fun c!27166 () Bool)

(assert (=> d!45791 (= c!27166 ((_ is ValueCellFull!1124) (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun e!93413 () V!3561)

(assert (=> d!45791 (= (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!93413)))

(declare-fun b!143361 () Bool)

(declare-fun get!1533 (ValueCell!1124 V!3561) V!3561)

(assert (=> b!143361 (= e!93413 (get!1533 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143362 () Bool)

(declare-fun get!1534 (ValueCell!1124 V!3561) V!3561)

(assert (=> b!143362 (= e!93413 (get!1534 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45791 c!27166) b!143361))

(assert (= (and d!45791 (not c!27166)) b!143362))

(assert (=> b!143361 m!172471))

(assert (=> b!143361 m!172473))

(declare-fun m!172645 () Bool)

(assert (=> b!143361 m!172645))

(assert (=> b!143362 m!172471))

(assert (=> b!143362 m!172473))

(declare-fun m!172647 () Bool)

(assert (=> b!143362 m!172647))

(assert (=> b!143099 d!45791))

(declare-fun d!45793 () Bool)

(assert (=> d!45793 (= (valid!563 thiss!992) (valid!564 (v!3290 (underlying!479 thiss!992))))))

(declare-fun bs!6048 () Bool)

(assert (= bs!6048 d!45793))

(declare-fun m!172649 () Bool)

(assert (=> bs!6048 m!172649))

(assert (=> start!14884 d!45793))

(declare-fun d!45795 () Bool)

(declare-fun res!68233 () Bool)

(declare-fun e!93416 () Bool)

(assert (=> d!45795 (=> (not res!68233) (not e!93416))))

(declare-fun simpleValid!97 (LongMapFixedSize!1156) Bool)

(assert (=> d!45795 (= res!68233 (simpleValid!97 newMap!16))))

(assert (=> d!45795 (= (valid!564 newMap!16) e!93416)))

(declare-fun b!143369 () Bool)

(declare-fun res!68234 () Bool)

(assert (=> b!143369 (=> (not res!68234) (not e!93416))))

(declare-fun arrayCountValidKeys!0 (array!4887 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!143369 (= res!68234 (= (arrayCountValidKeys!0 (_keys!4724 newMap!16) #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))) (_size!627 newMap!16)))))

(declare-fun b!143370 () Bool)

(declare-fun res!68235 () Bool)

(assert (=> b!143370 (=> (not res!68235) (not e!93416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4887 (_ BitVec 32)) Bool)

(assert (=> b!143370 (= res!68235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4724 newMap!16) (mask!7313 newMap!16)))))

(declare-fun b!143371 () Bool)

(assert (=> b!143371 (= e!93416 (arrayNoDuplicates!0 (_keys!4724 newMap!16) #b00000000000000000000000000000000 Nil!1742))))

(assert (= (and d!45795 res!68233) b!143369))

(assert (= (and b!143369 res!68234) b!143370))

(assert (= (and b!143370 res!68235) b!143371))

(declare-fun m!172651 () Bool)

(assert (=> d!45795 m!172651))

(declare-fun m!172653 () Bool)

(assert (=> b!143369 m!172653))

(declare-fun m!172655 () Bool)

(assert (=> b!143370 m!172655))

(declare-fun m!172657 () Bool)

(assert (=> b!143371 m!172657))

(assert (=> b!143113 d!45795))

(declare-fun d!45797 () Bool)

(assert (=> d!45797 (= (map!1427 newMap!16) (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun bs!6049 () Bool)

(assert (= bs!6049 d!45797))

(assert (=> bs!6049 m!172621))

(assert (=> b!143104 d!45797))

(declare-fun bm!15879 () Bool)

(declare-fun call!15883 () Bool)

(declare-fun lt!74997 () ListLongMap!1717)

(assert (=> bm!15879 (= call!15883 (contains!915 lt!74997 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143414 () Bool)

(declare-fun e!93454 () ListLongMap!1717)

(declare-fun call!15885 () ListLongMap!1717)

(assert (=> b!143414 (= e!93454 call!15885)))

(declare-fun b!143415 () Bool)

(declare-fun e!93450 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!143415 (= e!93450 (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143416 () Bool)

(declare-fun e!93452 () Bool)

(declare-fun e!93448 () Bool)

(assert (=> b!143416 (= e!93452 e!93448)))

(declare-fun c!27180 () Bool)

(assert (=> b!143416 (= c!27180 (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143418 () Bool)

(declare-fun e!93444 () Bool)

(assert (=> b!143418 (= e!93444 (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143419 () Bool)

(declare-fun e!93449 () Bool)

(declare-fun apply!121 (ListLongMap!1717 (_ BitVec 64)) V!3561)

(assert (=> b!143419 (= e!93449 (= (apply!121 lt!74997 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143419 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2583 (_values!2945 (v!3290 (underlying!479 thiss!992))))))))

(assert (=> b!143419 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun b!143420 () Bool)

(assert (=> b!143420 (= e!93448 (not call!15883))))

(declare-fun bm!15880 () Bool)

(declare-fun call!15886 () ListLongMap!1717)

(declare-fun call!15888 () ListLongMap!1717)

(assert (=> bm!15880 (= call!15886 call!15888)))

(declare-fun b!143421 () Bool)

(declare-fun e!93447 () Bool)

(assert (=> b!143421 (= e!93447 (= (apply!121 lt!74997 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun b!143422 () Bool)

(declare-fun e!93453 () ListLongMap!1717)

(declare-fun e!93443 () ListLongMap!1717)

(assert (=> b!143422 (= e!93453 e!93443)))

(declare-fun c!27182 () Bool)

(assert (=> b!143422 (= c!27182 (and (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143423 () Bool)

(assert (=> b!143423 (= e!93448 e!93447)))

(declare-fun res!68256 () Bool)

(assert (=> b!143423 (= res!68256 call!15883)))

(assert (=> b!143423 (=> (not res!68256) (not e!93447))))

(declare-fun bm!15881 () Bool)

(declare-fun call!15887 () Bool)

(assert (=> bm!15881 (= call!15887 (contains!915 lt!74997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15882 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!133 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) Int) ListLongMap!1717)

(assert (=> bm!15882 (= call!15888 (getCurrentListMapNoExtraKeys!133 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun call!15884 () ListLongMap!1717)

(declare-fun call!15882 () ListLongMap!1717)

(declare-fun bm!15883 () Bool)

(declare-fun c!27184 () Bool)

(assert (=> bm!15883 (= call!15882 (+!168 (ite c!27184 call!15888 (ite c!27182 call!15886 call!15884)) (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(declare-fun b!143424 () Bool)

(declare-fun e!93445 () Unit!4536)

(declare-fun Unit!4545 () Unit!4536)

(assert (=> b!143424 (= e!93445 Unit!4545)))

(declare-fun bm!15884 () Bool)

(assert (=> bm!15884 (= call!15885 call!15882)))

(declare-fun b!143425 () Bool)

(declare-fun c!27179 () Bool)

(assert (=> b!143425 (= c!27179 (and (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143425 (= e!93443 e!93454)))

(declare-fun b!143417 () Bool)

(declare-fun e!93451 () Bool)

(declare-fun e!93446 () Bool)

(assert (=> b!143417 (= e!93451 e!93446)))

(declare-fun res!68255 () Bool)

(assert (=> b!143417 (= res!68255 call!15887)))

(assert (=> b!143417 (=> (not res!68255) (not e!93446))))

(declare-fun d!45799 () Bool)

(assert (=> d!45799 e!93452))

(declare-fun res!68261 () Bool)

(assert (=> d!45799 (=> (not res!68261) (not e!93452))))

(assert (=> d!45799 (= res!68261 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))))

(declare-fun lt!74983 () ListLongMap!1717)

(assert (=> d!45799 (= lt!74997 lt!74983)))

(declare-fun lt!75001 () Unit!4536)

(assert (=> d!45799 (= lt!75001 e!93445)))

(declare-fun c!27181 () Bool)

(assert (=> d!45799 (= c!27181 e!93450)))

(declare-fun res!68257 () Bool)

(assert (=> d!45799 (=> (not res!68257) (not e!93450))))

(assert (=> d!45799 (= res!68257 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(assert (=> d!45799 (= lt!74983 e!93453)))

(assert (=> d!45799 (= c!27184 (and (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!45799 (validMask!0 (mask!7313 (v!3290 (underlying!479 thiss!992))))))

(assert (=> d!45799 (= (getCurrentListMap!535 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))) lt!74997)))

(declare-fun b!143426 () Bool)

(assert (=> b!143426 (= e!93454 call!15884)))

(declare-fun b!143427 () Bool)

(declare-fun res!68258 () Bool)

(assert (=> b!143427 (=> (not res!68258) (not e!93452))))

(declare-fun e!93455 () Bool)

(assert (=> b!143427 (= res!68258 e!93455)))

(declare-fun res!68260 () Bool)

(assert (=> b!143427 (=> res!68260 e!93455)))

(assert (=> b!143427 (= res!68260 (not e!93444))))

(declare-fun res!68254 () Bool)

(assert (=> b!143427 (=> (not res!68254) (not e!93444))))

(assert (=> b!143427 (= res!68254 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun b!143428 () Bool)

(assert (=> b!143428 (= e!93453 (+!168 call!15882 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun b!143429 () Bool)

(declare-fun lt!74984 () Unit!4536)

(assert (=> b!143429 (= e!93445 lt!74984)))

(declare-fun lt!74996 () ListLongMap!1717)

(assert (=> b!143429 (= lt!74996 (getCurrentListMapNoExtraKeys!133 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun lt!74989 () (_ BitVec 64))

(assert (=> b!143429 (= lt!74989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74986 () (_ BitVec 64))

(assert (=> b!143429 (= lt!74986 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!74988 () Unit!4536)

(declare-fun addStillContains!97 (ListLongMap!1717 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4536)

(assert (=> b!143429 (= lt!74988 (addStillContains!97 lt!74996 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) lt!74986))))

(assert (=> b!143429 (contains!915 (+!168 lt!74996 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!74986)))

(declare-fun lt!74993 () Unit!4536)

(assert (=> b!143429 (= lt!74993 lt!74988)))

(declare-fun lt!74985 () ListLongMap!1717)

(assert (=> b!143429 (= lt!74985 (getCurrentListMapNoExtraKeys!133 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun lt!74981 () (_ BitVec 64))

(assert (=> b!143429 (= lt!74981 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74982 () (_ BitVec 64))

(assert (=> b!143429 (= lt!74982 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!74994 () Unit!4536)

(declare-fun addApplyDifferent!97 (ListLongMap!1717 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4536)

(assert (=> b!143429 (= lt!74994 (addApplyDifferent!97 lt!74985 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))) lt!74982))))

(assert (=> b!143429 (= (apply!121 (+!168 lt!74985 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!74982) (apply!121 lt!74985 lt!74982))))

(declare-fun lt!74987 () Unit!4536)

(assert (=> b!143429 (= lt!74987 lt!74994)))

(declare-fun lt!74999 () ListLongMap!1717)

(assert (=> b!143429 (= lt!74999 (getCurrentListMapNoExtraKeys!133 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun lt!74992 () (_ BitVec 64))

(assert (=> b!143429 (= lt!74992 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74998 () (_ BitVec 64))

(assert (=> b!143429 (= lt!74998 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!74991 () Unit!4536)

(assert (=> b!143429 (= lt!74991 (addApplyDifferent!97 lt!74999 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) lt!74998))))

(assert (=> b!143429 (= (apply!121 (+!168 lt!74999 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!74998) (apply!121 lt!74999 lt!74998))))

(declare-fun lt!74990 () Unit!4536)

(assert (=> b!143429 (= lt!74990 lt!74991)))

(declare-fun lt!74995 () ListLongMap!1717)

(assert (=> b!143429 (= lt!74995 (getCurrentListMapNoExtraKeys!133 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun lt!74980 () (_ BitVec 64))

(assert (=> b!143429 (= lt!74980 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75000 () (_ BitVec 64))

(assert (=> b!143429 (= lt!75000 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!143429 (= lt!74984 (addApplyDifferent!97 lt!74995 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))) lt!75000))))

(assert (=> b!143429 (= (apply!121 (+!168 lt!74995 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!75000) (apply!121 lt!74995 lt!75000))))

(declare-fun b!143430 () Bool)

(assert (=> b!143430 (= e!93443 call!15885)))

(declare-fun b!143431 () Bool)

(declare-fun res!68262 () Bool)

(assert (=> b!143431 (=> (not res!68262) (not e!93452))))

(assert (=> b!143431 (= res!68262 e!93451)))

(declare-fun c!27183 () Bool)

(assert (=> b!143431 (= c!27183 (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!143432 () Bool)

(assert (=> b!143432 (= e!93451 (not call!15887))))

(declare-fun b!143433 () Bool)

(assert (=> b!143433 (= e!93455 e!93449)))

(declare-fun res!68259 () Bool)

(assert (=> b!143433 (=> (not res!68259) (not e!93449))))

(assert (=> b!143433 (= res!68259 (contains!915 lt!74997 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143433 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun b!143434 () Bool)

(assert (=> b!143434 (= e!93446 (= (apply!121 lt!74997 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun bm!15885 () Bool)

(assert (=> bm!15885 (= call!15884 call!15886)))

(assert (= (and d!45799 c!27184) b!143428))

(assert (= (and d!45799 (not c!27184)) b!143422))

(assert (= (and b!143422 c!27182) b!143430))

(assert (= (and b!143422 (not c!27182)) b!143425))

(assert (= (and b!143425 c!27179) b!143414))

(assert (= (and b!143425 (not c!27179)) b!143426))

(assert (= (or b!143414 b!143426) bm!15885))

(assert (= (or b!143430 bm!15885) bm!15880))

(assert (= (or b!143430 b!143414) bm!15884))

(assert (= (or b!143428 bm!15880) bm!15882))

(assert (= (or b!143428 bm!15884) bm!15883))

(assert (= (and d!45799 res!68257) b!143415))

(assert (= (and d!45799 c!27181) b!143429))

(assert (= (and d!45799 (not c!27181)) b!143424))

(assert (= (and d!45799 res!68261) b!143427))

(assert (= (and b!143427 res!68254) b!143418))

(assert (= (and b!143427 (not res!68260)) b!143433))

(assert (= (and b!143433 res!68259) b!143419))

(assert (= (and b!143427 res!68258) b!143431))

(assert (= (and b!143431 c!27183) b!143417))

(assert (= (and b!143431 (not c!27183)) b!143432))

(assert (= (and b!143417 res!68255) b!143434))

(assert (= (or b!143417 b!143432) bm!15881))

(assert (= (and b!143431 res!68262) b!143416))

(assert (= (and b!143416 c!27180) b!143423))

(assert (= (and b!143416 (not c!27180)) b!143420))

(assert (= (and b!143423 res!68256) b!143421))

(assert (= (or b!143423 b!143420) bm!15879))

(declare-fun b_lambda!6421 () Bool)

(assert (=> (not b_lambda!6421) (not b!143419)))

(assert (=> b!143419 t!6341))

(declare-fun b_and!8917 () Bool)

(assert (= b_and!8897 (and (=> t!6341 result!4199) b_and!8917)))

(assert (=> b!143419 t!6343))

(declare-fun b_and!8919 () Bool)

(assert (= b_and!8899 (and (=> t!6343 result!4203) b_and!8919)))

(declare-fun m!172659 () Bool)

(assert (=> b!143428 m!172659))

(declare-fun m!172661 () Bool)

(assert (=> b!143415 m!172661))

(assert (=> b!143415 m!172661))

(declare-fun m!172663 () Bool)

(assert (=> b!143415 m!172663))

(assert (=> b!143433 m!172661))

(assert (=> b!143433 m!172661))

(declare-fun m!172665 () Bool)

(assert (=> b!143433 m!172665))

(declare-fun m!172667 () Bool)

(assert (=> b!143419 m!172667))

(assert (=> b!143419 m!172473))

(declare-fun m!172669 () Bool)

(assert (=> b!143419 m!172669))

(assert (=> b!143419 m!172661))

(assert (=> b!143419 m!172667))

(assert (=> b!143419 m!172473))

(assert (=> b!143419 m!172661))

(declare-fun m!172671 () Bool)

(assert (=> b!143419 m!172671))

(declare-fun m!172673 () Bool)

(assert (=> bm!15883 m!172673))

(declare-fun m!172675 () Bool)

(assert (=> bm!15879 m!172675))

(assert (=> b!143418 m!172661))

(assert (=> b!143418 m!172661))

(assert (=> b!143418 m!172663))

(declare-fun m!172677 () Bool)

(assert (=> b!143429 m!172677))

(declare-fun m!172679 () Bool)

(assert (=> b!143429 m!172679))

(assert (=> b!143429 m!172677))

(declare-fun m!172681 () Bool)

(assert (=> b!143429 m!172681))

(declare-fun m!172683 () Bool)

(assert (=> b!143429 m!172683))

(declare-fun m!172685 () Bool)

(assert (=> b!143429 m!172685))

(declare-fun m!172687 () Bool)

(assert (=> b!143429 m!172687))

(declare-fun m!172689 () Bool)

(assert (=> b!143429 m!172689))

(declare-fun m!172691 () Bool)

(assert (=> b!143429 m!172691))

(declare-fun m!172693 () Bool)

(assert (=> b!143429 m!172693))

(assert (=> b!143429 m!172691))

(declare-fun m!172695 () Bool)

(assert (=> b!143429 m!172695))

(assert (=> b!143429 m!172661))

(assert (=> b!143429 m!172695))

(declare-fun m!172697 () Bool)

(assert (=> b!143429 m!172697))

(declare-fun m!172699 () Bool)

(assert (=> b!143429 m!172699))

(declare-fun m!172701 () Bool)

(assert (=> b!143429 m!172701))

(declare-fun m!172703 () Bool)

(assert (=> b!143429 m!172703))

(declare-fun m!172705 () Bool)

(assert (=> b!143429 m!172705))

(assert (=> b!143429 m!172703))

(declare-fun m!172707 () Bool)

(assert (=> b!143429 m!172707))

(declare-fun m!172709 () Bool)

(assert (=> b!143434 m!172709))

(declare-fun m!172711 () Bool)

(assert (=> b!143421 m!172711))

(assert (=> bm!15882 m!172687))

(declare-fun m!172713 () Bool)

(assert (=> d!45799 m!172713))

(declare-fun m!172715 () Bool)

(assert (=> bm!15881 m!172715))

(assert (=> b!143104 d!45799))

(declare-fun call!15891 () Bool)

(declare-fun bm!15888 () Bool)

(declare-fun c!27187 () Bool)

(assert (=> bm!15888 (= call!15891 (arrayNoDuplicates!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27187 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742) Nil!1742)))))

(declare-fun b!143445 () Bool)

(declare-fun e!93464 () Bool)

(declare-fun e!93465 () Bool)

(assert (=> b!143445 (= e!93464 e!93465)))

(assert (=> b!143445 (= c!27187 (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143446 () Bool)

(assert (=> b!143446 (= e!93465 call!15891)))

(declare-fun b!143448 () Bool)

(declare-fun e!93466 () Bool)

(assert (=> b!143448 (= e!93466 e!93464)))

(declare-fun res!68270 () Bool)

(assert (=> b!143448 (=> (not res!68270) (not e!93464))))

(declare-fun e!93467 () Bool)

(assert (=> b!143448 (= res!68270 (not e!93467))))

(declare-fun res!68271 () Bool)

(assert (=> b!143448 (=> (not res!68271) (not e!93467))))

(assert (=> b!143448 (= res!68271 (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143449 () Bool)

(assert (=> b!143449 (= e!93465 call!15891)))

(declare-fun d!45801 () Bool)

(declare-fun res!68269 () Bool)

(assert (=> d!45801 (=> res!68269 e!93466)))

(assert (=> d!45801 (= res!68269 (bvsge from!355 (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(assert (=> d!45801 (= (arrayNoDuplicates!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) from!355 Nil!1742) e!93466)))

(declare-fun b!143447 () Bool)

(assert (=> b!143447 (= e!93467 (contains!917 Nil!1742 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (= (and d!45801 (not res!68269)) b!143448))

(assert (= (and b!143448 res!68271) b!143447))

(assert (= (and b!143448 res!68270) b!143445))

(assert (= (and b!143445 c!27187) b!143449))

(assert (= (and b!143445 (not c!27187)) b!143446))

(assert (= (or b!143449 b!143446) bm!15888))

(assert (=> bm!15888 m!172463))

(declare-fun m!172717 () Bool)

(assert (=> bm!15888 m!172717))

(assert (=> b!143445 m!172463))

(assert (=> b!143445 m!172463))

(declare-fun m!172719 () Bool)

(assert (=> b!143445 m!172719))

(assert (=> b!143448 m!172463))

(assert (=> b!143448 m!172463))

(assert (=> b!143448 m!172719))

(assert (=> b!143447 m!172463))

(assert (=> b!143447 m!172463))

(declare-fun m!172721 () Bool)

(assert (=> b!143447 m!172721))

(assert (=> b!143105 d!45801))

(declare-fun d!45803 () Bool)

(assert (=> d!45803 (arrayNoDuplicates!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) from!355 Nil!1742)))

(declare-fun lt!75004 () Unit!4536)

(declare-fun choose!39 (array!4887 (_ BitVec 32) (_ BitVec 32)) Unit!4536)

(assert (=> d!45803 (= lt!75004 (choose!39 (_keys!4724 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!45803 (bvslt (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!45803 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000000 from!355) lt!75004)))

(declare-fun bs!6050 () Bool)

(assert (= bs!6050 d!45803))

(assert (=> bs!6050 m!172461))

(declare-fun m!172723 () Bool)

(assert (=> bs!6050 m!172723))

(assert (=> b!143105 d!45803))

(declare-fun d!45805 () Bool)

(declare-fun res!68276 () Bool)

(declare-fun e!93472 () Bool)

(assert (=> d!45805 (=> res!68276 e!93472)))

(assert (=> d!45805 (= res!68276 (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> d!45805 (= (arrayContainsKey!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!93472)))

(declare-fun b!143454 () Bool)

(declare-fun e!93473 () Bool)

(assert (=> b!143454 (= e!93472 e!93473)))

(declare-fun res!68277 () Bool)

(assert (=> b!143454 (=> (not res!68277) (not e!93473))))

(assert (=> b!143454 (= res!68277 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun b!143455 () Bool)

(assert (=> b!143455 (= e!93473 (arrayContainsKey!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!45805 (not res!68276)) b!143454))

(assert (= (and b!143454 res!68277) b!143455))

(assert (=> d!45805 m!172661))

(assert (=> b!143455 m!172463))

(declare-fun m!172725 () Bool)

(assert (=> b!143455 m!172725))

(assert (=> b!143105 d!45805))

(declare-fun d!45807 () Bool)

(declare-fun e!93476 () Bool)

(assert (=> d!45807 e!93476))

(declare-fun c!27190 () Bool)

(assert (=> d!45807 (= c!27190 (and (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!75007 () Unit!4536)

(declare-fun choose!876 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) (_ BitVec 32) Int) Unit!4536)

(assert (=> d!45807 (= lt!75007 (choose!876 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))))))

(assert (=> d!45807 (validMask!0 (mask!7313 (v!3290 (underlying!479 thiss!992))))))

(assert (=> d!45807 (= (lemmaListMapContainsThenArrayContainsFrom!146 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))) lt!75007)))

(declare-fun b!143460 () Bool)

(assert (=> b!143460 (= e!93476 (arrayContainsKey!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!143461 () Bool)

(assert (=> b!143461 (= e!93476 (ite (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45807 c!27190) b!143460))

(assert (= (and d!45807 (not c!27190)) b!143461))

(assert (=> d!45807 m!172463))

(declare-fun m!172727 () Bool)

(assert (=> d!45807 m!172727))

(assert (=> d!45807 m!172713))

(assert (=> b!143460 m!172463))

(assert (=> b!143460 m!172467))

(assert (=> b!143105 d!45807))

(declare-fun d!45809 () Bool)

(assert (=> d!45809 (= (array_inv!1475 (_keys!4724 newMap!16)) (bvsge (size!2582 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143111 d!45809))

(declare-fun d!45811 () Bool)

(assert (=> d!45811 (= (array_inv!1476 (_values!2945 newMap!16)) (bvsge (size!2583 (_values!2945 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143111 d!45811))

(declare-fun condMapEmpty!4871 () Bool)

(declare-fun mapDefault!4871 () ValueCell!1124)

(assert (=> mapNonEmpty!4855 (= condMapEmpty!4871 (= mapRest!4856 ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4871)))))

(declare-fun e!93481 () Bool)

(declare-fun mapRes!4871 () Bool)

(assert (=> mapNonEmpty!4855 (= tp!11594 (and e!93481 mapRes!4871))))

(declare-fun mapNonEmpty!4871 () Bool)

(declare-fun tp!11621 () Bool)

(declare-fun e!93482 () Bool)

(assert (=> mapNonEmpty!4871 (= mapRes!4871 (and tp!11621 e!93482))))

(declare-fun mapValue!4871 () ValueCell!1124)

(declare-fun mapKey!4871 () (_ BitVec 32))

(declare-fun mapRest!4871 () (Array (_ BitVec 32) ValueCell!1124))

(assert (=> mapNonEmpty!4871 (= mapRest!4856 (store mapRest!4871 mapKey!4871 mapValue!4871))))

(declare-fun mapIsEmpty!4871 () Bool)

(assert (=> mapIsEmpty!4871 mapRes!4871))

(declare-fun b!143469 () Bool)

(assert (=> b!143469 (= e!93481 tp_is_empty!2935)))

(declare-fun b!143468 () Bool)

(assert (=> b!143468 (= e!93482 tp_is_empty!2935)))

(assert (= (and mapNonEmpty!4855 condMapEmpty!4871) mapIsEmpty!4871))

(assert (= (and mapNonEmpty!4855 (not condMapEmpty!4871)) mapNonEmpty!4871))

(assert (= (and mapNonEmpty!4871 ((_ is ValueCellFull!1124) mapValue!4871)) b!143468))

(assert (= (and mapNonEmpty!4855 ((_ is ValueCellFull!1124) mapDefault!4871)) b!143469))

(declare-fun m!172729 () Bool)

(assert (=> mapNonEmpty!4871 m!172729))

(declare-fun condMapEmpty!4872 () Bool)

(declare-fun mapDefault!4872 () ValueCell!1124)

(assert (=> mapNonEmpty!4856 (= condMapEmpty!4872 (= mapRest!4855 ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4872)))))

(declare-fun e!93483 () Bool)

(declare-fun mapRes!4872 () Bool)

(assert (=> mapNonEmpty!4856 (= tp!11593 (and e!93483 mapRes!4872))))

(declare-fun mapNonEmpty!4872 () Bool)

(declare-fun tp!11622 () Bool)

(declare-fun e!93484 () Bool)

(assert (=> mapNonEmpty!4872 (= mapRes!4872 (and tp!11622 e!93484))))

(declare-fun mapKey!4872 () (_ BitVec 32))

(declare-fun mapRest!4872 () (Array (_ BitVec 32) ValueCell!1124))

(declare-fun mapValue!4872 () ValueCell!1124)

(assert (=> mapNonEmpty!4872 (= mapRest!4855 (store mapRest!4872 mapKey!4872 mapValue!4872))))

(declare-fun mapIsEmpty!4872 () Bool)

(assert (=> mapIsEmpty!4872 mapRes!4872))

(declare-fun b!143471 () Bool)

(assert (=> b!143471 (= e!93483 tp_is_empty!2935)))

(declare-fun b!143470 () Bool)

(assert (=> b!143470 (= e!93484 tp_is_empty!2935)))

(assert (= (and mapNonEmpty!4856 condMapEmpty!4872) mapIsEmpty!4872))

(assert (= (and mapNonEmpty!4856 (not condMapEmpty!4872)) mapNonEmpty!4872))

(assert (= (and mapNonEmpty!4872 ((_ is ValueCellFull!1124) mapValue!4872)) b!143470))

(assert (= (and mapNonEmpty!4856 ((_ is ValueCellFull!1124) mapDefault!4872)) b!143471))

(declare-fun m!172731 () Bool)

(assert (=> mapNonEmpty!4872 m!172731))

(declare-fun b_lambda!6423 () Bool)

(assert (= b_lambda!6421 (or (and b!143106 b_free!3037) (and b!143111 b_free!3039 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))))) b_lambda!6423)))

(check-sat (not b!143428) (not b!143429) (not d!45803) (not bm!15883) (not b!143334) (not bm!15843) (not b!143317) (not bm!15863) (not b!143455) (not bm!15882) (not b!143370) (not b!143433) (not bm!15853) (not bm!15881) b_and!8917 (not b!143371) (not d!45799) (not d!45797) (not b!143227) (not bm!15861) (not bm!15858) (not mapNonEmpty!4871) (not bm!15864) (not b!143445) (not bm!15842) (not bm!15857) (not b!143460) (not b!143362) tp_is_empty!2935 (not b!143234) (not b!143348) (not bm!15847) (not b!143421) (not b!143415) (not b!143418) (not mapNonEmpty!4872) (not b!143447) (not b_next!3039) (not b_next!3037) (not b!143434) (not d!45789) (not d!45807) (not b!143330) (not bm!15846) (not b_lambda!6423) (not d!45787) (not b!143448) (not b!143419) (not b_lambda!6419) (not b!143236) b_and!8919 (not b!143321) (not bm!15879) (not bm!15844) (not d!45793) (not b!143361) (not b!143337) (not b!143342) (not bm!15841) (not b!143226) (not b!143369) (not d!45795) (not bm!15888))
(check-sat b_and!8917 b_and!8919 (not b_next!3037) (not b_next!3039))
(get-model)

(declare-fun d!45813 () Bool)

(assert (=> d!45813 (= (map!1427 (_2!1346 lt!74917)) (getCurrentListMap!535 (_keys!4724 (_2!1346 lt!74917)) (_values!2945 (_2!1346 lt!74917)) (mask!7313 (_2!1346 lt!74917)) (extraKeys!2713 (_2!1346 lt!74917)) (zeroValue!2810 (_2!1346 lt!74917)) (minValue!2810 (_2!1346 lt!74917)) #b00000000000000000000000000000000 (defaultEntry!2962 (_2!1346 lt!74917))))))

(declare-fun bs!6051 () Bool)

(assert (= bs!6051 d!45813))

(declare-fun m!172733 () Bool)

(assert (=> bs!6051 m!172733))

(assert (=> bm!15843 d!45813))

(declare-fun b!143484 () Bool)

(declare-fun e!93491 () SeekEntryResult!283)

(declare-fun lt!75016 () SeekEntryResult!283)

(assert (=> b!143484 (= e!93491 (Found!283 (index!3298 lt!75016)))))

(declare-fun b!143485 () Bool)

(declare-fun e!93493 () SeekEntryResult!283)

(assert (=> b!143485 (= e!93493 e!93491)))

(declare-fun lt!75014 () (_ BitVec 64))

(assert (=> b!143485 (= lt!75014 (select (arr!2308 (_keys!4724 newMap!16)) (index!3298 lt!75016)))))

(declare-fun c!27199 () Bool)

(assert (=> b!143485 (= c!27199 (= lt!75014 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun e!93492 () SeekEntryResult!283)

(declare-fun b!143486 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4887 (_ BitVec 32)) SeekEntryResult!283)

(assert (=> b!143486 (= e!93492 (seekKeyOrZeroReturnVacant!0 (x!16336 lt!75016) (index!3298 lt!75016) (index!3298 lt!75016) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (_keys!4724 newMap!16) (mask!7313 newMap!16)))))

(declare-fun d!45815 () Bool)

(declare-fun lt!75015 () SeekEntryResult!283)

(assert (=> d!45815 (and (or ((_ is Undefined!283) lt!75015) (not ((_ is Found!283) lt!75015)) (and (bvsge (index!3297 lt!75015) #b00000000000000000000000000000000) (bvslt (index!3297 lt!75015) (size!2582 (_keys!4724 newMap!16))))) (or ((_ is Undefined!283) lt!75015) ((_ is Found!283) lt!75015) (not ((_ is MissingZero!283) lt!75015)) (and (bvsge (index!3296 lt!75015) #b00000000000000000000000000000000) (bvslt (index!3296 lt!75015) (size!2582 (_keys!4724 newMap!16))))) (or ((_ is Undefined!283) lt!75015) ((_ is Found!283) lt!75015) ((_ is MissingZero!283) lt!75015) (not ((_ is MissingVacant!283) lt!75015)) (and (bvsge (index!3299 lt!75015) #b00000000000000000000000000000000) (bvslt (index!3299 lt!75015) (size!2582 (_keys!4724 newMap!16))))) (or ((_ is Undefined!283) lt!75015) (ite ((_ is Found!283) lt!75015) (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!75015)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (ite ((_ is MissingZero!283) lt!75015) (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3296 lt!75015)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!283) lt!75015) (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3299 lt!75015)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45815 (= lt!75015 e!93493)))

(declare-fun c!27197 () Bool)

(assert (=> d!45815 (= c!27197 (and ((_ is Intermediate!283) lt!75016) (undefined!1095 lt!75016)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4887 (_ BitVec 32)) SeekEntryResult!283)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!45815 (= lt!75016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (mask!7313 newMap!16)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (_keys!4724 newMap!16) (mask!7313 newMap!16)))))

(assert (=> d!45815 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45815 (= (seekEntryOrOpen!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (_keys!4724 newMap!16) (mask!7313 newMap!16)) lt!75015)))

(declare-fun b!143487 () Bool)

(assert (=> b!143487 (= e!93492 (MissingZero!283 (index!3298 lt!75016)))))

(declare-fun b!143488 () Bool)

(assert (=> b!143488 (= e!93493 Undefined!283)))

(declare-fun b!143489 () Bool)

(declare-fun c!27198 () Bool)

(assert (=> b!143489 (= c!27198 (= lt!75014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143489 (= e!93491 e!93492)))

(assert (= (and d!45815 c!27197) b!143488))

(assert (= (and d!45815 (not c!27197)) b!143485))

(assert (= (and b!143485 c!27199) b!143484))

(assert (= (and b!143485 (not c!27199)) b!143489))

(assert (= (and b!143489 c!27198) b!143487))

(assert (= (and b!143489 (not c!27198)) b!143486))

(declare-fun m!172735 () Bool)

(assert (=> b!143485 m!172735))

(assert (=> b!143486 m!172463))

(declare-fun m!172737 () Bool)

(assert (=> b!143486 m!172737))

(declare-fun m!172739 () Bool)

(assert (=> d!45815 m!172739))

(declare-fun m!172741 () Bool)

(assert (=> d!45815 m!172741))

(assert (=> d!45815 m!172463))

(declare-fun m!172743 () Bool)

(assert (=> d!45815 m!172743))

(assert (=> d!45815 m!172743))

(assert (=> d!45815 m!172463))

(declare-fun m!172745 () Bool)

(assert (=> d!45815 m!172745))

(declare-fun m!172747 () Bool)

(assert (=> d!45815 m!172747))

(declare-fun m!172749 () Bool)

(assert (=> d!45815 m!172749))

(assert (=> b!143337 d!45815))

(declare-fun d!45817 () Bool)

(declare-fun get!1535 (Option!181) V!3561)

(assert (=> d!45817 (= (apply!121 lt!74997 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1535 (getValueByKey!175 (toList!874 lt!74997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6052 () Bool)

(assert (= bs!6052 d!45817))

(declare-fun m!172751 () Bool)

(assert (=> bs!6052 m!172751))

(assert (=> bs!6052 m!172751))

(declare-fun m!172753 () Bool)

(assert (=> bs!6052 m!172753))

(assert (=> b!143421 d!45817))

(declare-fun d!45819 () Bool)

(declare-fun lt!75019 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!139 (List!1745) (InoxSet (_ BitVec 64)))

(assert (=> d!45819 (= lt!75019 (select (content!139 Nil!1742) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun e!93498 () Bool)

(assert (=> d!45819 (= lt!75019 e!93498)))

(declare-fun res!68282 () Bool)

(assert (=> d!45819 (=> (not res!68282) (not e!93498))))

(assert (=> d!45819 (= res!68282 ((_ is Cons!1741) Nil!1742))))

(assert (=> d!45819 (= (contains!917 Nil!1742 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) lt!75019)))

(declare-fun b!143494 () Bool)

(declare-fun e!93499 () Bool)

(assert (=> b!143494 (= e!93498 e!93499)))

(declare-fun res!68283 () Bool)

(assert (=> b!143494 (=> res!68283 e!93499)))

(assert (=> b!143494 (= res!68283 (= (h!2349 Nil!1742) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143495 () Bool)

(assert (=> b!143495 (= e!93499 (contains!917 (t!6345 Nil!1742) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (= (and d!45819 res!68282) b!143494))

(assert (= (and b!143494 (not res!68283)) b!143495))

(declare-fun m!172755 () Bool)

(assert (=> d!45819 m!172755))

(assert (=> d!45819 m!172463))

(declare-fun m!172757 () Bool)

(assert (=> d!45819 m!172757))

(assert (=> b!143495 m!172463))

(declare-fun m!172759 () Bool)

(assert (=> b!143495 m!172759))

(assert (=> b!143447 d!45819))

(declare-fun b!143520 () Bool)

(declare-fun e!93520 () Bool)

(declare-fun lt!75037 () ListLongMap!1717)

(declare-fun isEmpty!424 (ListLongMap!1717) Bool)

(assert (=> b!143520 (= e!93520 (isEmpty!424 lt!75037))))

(declare-fun b!143521 () Bool)

(declare-fun e!93515 () Bool)

(assert (=> b!143521 (= e!93515 e!93520)))

(declare-fun c!27209 () Bool)

(assert (=> b!143521 (= c!27209 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun d!45821 () Bool)

(declare-fun e!93517 () Bool)

(assert (=> d!45821 e!93517))

(declare-fun res!68292 () Bool)

(assert (=> d!45821 (=> (not res!68292) (not e!93517))))

(assert (=> d!45821 (= res!68292 (not (contains!915 lt!75037 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!93519 () ListLongMap!1717)

(assert (=> d!45821 (= lt!75037 e!93519)))

(declare-fun c!27211 () Bool)

(assert (=> d!45821 (= c!27211 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(assert (=> d!45821 (validMask!0 (mask!7313 (v!3290 (underlying!479 thiss!992))))))

(assert (=> d!45821 (= (getCurrentListMapNoExtraKeys!133 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))) lt!75037)))

(declare-fun b!143522 () Bool)

(declare-fun e!93514 () Bool)

(assert (=> b!143522 (= e!93514 (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143522 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!143523 () Bool)

(assert (=> b!143523 (= e!93517 e!93515)))

(declare-fun c!27210 () Bool)

(assert (=> b!143523 (= c!27210 e!93514)))

(declare-fun res!68294 () Bool)

(assert (=> b!143523 (=> (not res!68294) (not e!93514))))

(assert (=> b!143523 (= res!68294 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun b!143524 () Bool)

(declare-fun lt!75038 () Unit!4536)

(declare-fun lt!75035 () Unit!4536)

(assert (=> b!143524 (= lt!75038 lt!75035)))

(declare-fun lt!75040 () (_ BitVec 64))

(declare-fun lt!75034 () (_ BitVec 64))

(declare-fun lt!75036 () V!3561)

(declare-fun lt!75039 () ListLongMap!1717)

(assert (=> b!143524 (not (contains!915 (+!168 lt!75039 (tuple2!2669 lt!75034 lt!75036)) lt!75040))))

(declare-fun addStillNotContains!66 (ListLongMap!1717 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4536)

(assert (=> b!143524 (= lt!75035 (addStillNotContains!66 lt!75039 lt!75034 lt!75036 lt!75040))))

(assert (=> b!143524 (= lt!75040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!143524 (= lt!75036 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143524 (= lt!75034 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!15894 () ListLongMap!1717)

(assert (=> b!143524 (= lt!75039 call!15894)))

(declare-fun e!93518 () ListLongMap!1717)

(assert (=> b!143524 (= e!93518 (+!168 call!15894 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!143525 () Bool)

(assert (=> b!143525 (= e!93519 (ListLongMap!1718 Nil!1741))))

(declare-fun b!143526 () Bool)

(declare-fun res!68293 () Bool)

(assert (=> b!143526 (=> (not res!68293) (not e!93517))))

(assert (=> b!143526 (= res!68293 (not (contains!915 lt!75037 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!15891 () Bool)

(assert (=> bm!15891 (= call!15894 (getCurrentListMapNoExtraKeys!133 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun b!143527 () Bool)

(assert (=> b!143527 (= e!93520 (= lt!75037 (getCurrentListMapNoExtraKeys!133 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun b!143528 () Bool)

(declare-fun e!93516 () Bool)

(assert (=> b!143528 (= e!93515 e!93516)))

(assert (=> b!143528 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun res!68295 () Bool)

(assert (=> b!143528 (= res!68295 (contains!915 lt!75037 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143528 (=> (not res!68295) (not e!93516))))

(declare-fun b!143529 () Bool)

(assert (=> b!143529 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(assert (=> b!143529 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2583 (_values!2945 (v!3290 (underlying!479 thiss!992))))))))

(assert (=> b!143529 (= e!93516 (= (apply!121 lt!75037 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!143530 () Bool)

(assert (=> b!143530 (= e!93518 call!15894)))

(declare-fun b!143531 () Bool)

(assert (=> b!143531 (= e!93519 e!93518)))

(declare-fun c!27208 () Bool)

(assert (=> b!143531 (= c!27208 (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!45821 c!27211) b!143525))

(assert (= (and d!45821 (not c!27211)) b!143531))

(assert (= (and b!143531 c!27208) b!143524))

(assert (= (and b!143531 (not c!27208)) b!143530))

(assert (= (or b!143524 b!143530) bm!15891))

(assert (= (and d!45821 res!68292) b!143526))

(assert (= (and b!143526 res!68293) b!143523))

(assert (= (and b!143523 res!68294) b!143522))

(assert (= (and b!143523 c!27210) b!143528))

(assert (= (and b!143523 (not c!27210)) b!143521))

(assert (= (and b!143528 res!68295) b!143529))

(assert (= (and b!143521 c!27209) b!143527))

(assert (= (and b!143521 (not c!27209)) b!143520))

(declare-fun b_lambda!6425 () Bool)

(assert (=> (not b_lambda!6425) (not b!143524)))

(assert (=> b!143524 t!6341))

(declare-fun b_and!8921 () Bool)

(assert (= b_and!8917 (and (=> t!6341 result!4199) b_and!8921)))

(assert (=> b!143524 t!6343))

(declare-fun b_and!8923 () Bool)

(assert (= b_and!8919 (and (=> t!6343 result!4203) b_and!8923)))

(declare-fun b_lambda!6427 () Bool)

(assert (=> (not b_lambda!6427) (not b!143529)))

(assert (=> b!143529 t!6341))

(declare-fun b_and!8925 () Bool)

(assert (= b_and!8921 (and (=> t!6341 result!4199) b_and!8925)))

(assert (=> b!143529 t!6343))

(declare-fun b_and!8927 () Bool)

(assert (= b_and!8923 (and (=> t!6343 result!4203) b_and!8927)))

(declare-fun m!172761 () Bool)

(assert (=> b!143527 m!172761))

(declare-fun m!172763 () Bool)

(assert (=> b!143520 m!172763))

(assert (=> b!143529 m!172667))

(assert (=> b!143529 m!172473))

(assert (=> b!143529 m!172669))

(assert (=> b!143529 m!172661))

(assert (=> b!143529 m!172667))

(assert (=> b!143529 m!172473))

(assert (=> b!143529 m!172661))

(declare-fun m!172765 () Bool)

(assert (=> b!143529 m!172765))

(assert (=> b!143528 m!172661))

(assert (=> b!143528 m!172661))

(declare-fun m!172767 () Bool)

(assert (=> b!143528 m!172767))

(assert (=> b!143531 m!172661))

(assert (=> b!143531 m!172661))

(assert (=> b!143531 m!172663))

(declare-fun m!172769 () Bool)

(assert (=> b!143526 m!172769))

(assert (=> bm!15891 m!172761))

(assert (=> b!143522 m!172661))

(assert (=> b!143522 m!172661))

(assert (=> b!143522 m!172663))

(assert (=> b!143524 m!172667))

(assert (=> b!143524 m!172473))

(assert (=> b!143524 m!172669))

(declare-fun m!172771 () Bool)

(assert (=> b!143524 m!172771))

(declare-fun m!172773 () Bool)

(assert (=> b!143524 m!172773))

(assert (=> b!143524 m!172661))

(assert (=> b!143524 m!172667))

(assert (=> b!143524 m!172771))

(assert (=> b!143524 m!172473))

(declare-fun m!172775 () Bool)

(assert (=> b!143524 m!172775))

(declare-fun m!172777 () Bool)

(assert (=> b!143524 m!172777))

(declare-fun m!172779 () Bool)

(assert (=> d!45821 m!172779))

(assert (=> d!45821 m!172713))

(assert (=> bm!15882 d!45821))

(declare-fun d!45823 () Bool)

(declare-fun e!93523 () Bool)

(assert (=> d!45823 e!93523))

(declare-fun res!68301 () Bool)

(assert (=> d!45823 (=> (not res!68301) (not e!93523))))

(declare-fun lt!75046 () SeekEntryResult!283)

(assert (=> d!45823 (= res!68301 ((_ is Found!283) lt!75046))))

(assert (=> d!45823 (= lt!75046 (seekEntryOrOpen!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (_keys!4724 newMap!16) (mask!7313 newMap!16)))))

(declare-fun lt!75045 () Unit!4536)

(declare-fun choose!877 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) Int) Unit!4536)

(assert (=> d!45823 (= lt!75045 (choose!877 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45823 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45823 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)) lt!75045)))

(declare-fun b!143536 () Bool)

(declare-fun res!68300 () Bool)

(assert (=> b!143536 (=> (not res!68300) (not e!93523))))

(assert (=> b!143536 (= res!68300 (inRange!0 (index!3297 lt!75046) (mask!7313 newMap!16)))))

(declare-fun b!143537 () Bool)

(assert (=> b!143537 (= e!93523 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!75046)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> b!143537 (and (bvsge (index!3297 lt!75046) #b00000000000000000000000000000000) (bvslt (index!3297 lt!75046) (size!2582 (_keys!4724 newMap!16))))))

(assert (= (and d!45823 res!68301) b!143536))

(assert (= (and b!143536 res!68300) b!143537))

(assert (=> d!45823 m!172463))

(assert (=> d!45823 m!172629))

(assert (=> d!45823 m!172463))

(declare-fun m!172781 () Bool)

(assert (=> d!45823 m!172781))

(assert (=> d!45823 m!172741))

(declare-fun m!172783 () Bool)

(assert (=> b!143536 m!172783))

(declare-fun m!172785 () Bool)

(assert (=> b!143537 m!172785))

(assert (=> bm!15861 d!45823))

(declare-fun d!45825 () Bool)

(assert (=> d!45825 (= (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (and (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143445 d!45825))

(declare-fun d!45827 () Bool)

(assert (=> d!45827 (= (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143418 d!45827))

(declare-fun bm!15892 () Bool)

(declare-fun call!15896 () Bool)

(declare-fun lt!75064 () ListLongMap!1717)

(assert (=> bm!15892 (= call!15896 (contains!915 lt!75064 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143538 () Bool)

(declare-fun e!93535 () ListLongMap!1717)

(declare-fun call!15898 () ListLongMap!1717)

(assert (=> b!143538 (= e!93535 call!15898)))

(declare-fun b!143539 () Bool)

(declare-fun e!93531 () Bool)

(assert (=> b!143539 (= e!93531 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143540 () Bool)

(declare-fun e!93533 () Bool)

(declare-fun e!93529 () Bool)

(assert (=> b!143540 (= e!93533 e!93529)))

(declare-fun c!27213 () Bool)

(assert (=> b!143540 (= c!27213 (not (= (bvand (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143542 () Bool)

(declare-fun e!93525 () Bool)

(assert (=> b!143542 (= e!93525 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!93530 () Bool)

(declare-fun b!143543 () Bool)

(assert (=> b!143543 (= e!93530 (= (apply!121 lt!75064 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)) (get!1531 (select (arr!2309 (ite (or c!27154 c!27160) (_values!2945 newMap!16) lt!74910)) #b00000000000000000000000000000000) (dynLambda!437 (defaultEntry!2962 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2583 (ite (or c!27154 c!27160) (_values!2945 newMap!16) lt!74910))))))

(assert (=> b!143543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143544 () Bool)

(assert (=> b!143544 (= e!93529 (not call!15896))))

(declare-fun bm!15893 () Bool)

(declare-fun call!15899 () ListLongMap!1717)

(declare-fun call!15901 () ListLongMap!1717)

(assert (=> bm!15893 (= call!15899 call!15901)))

(declare-fun b!143545 () Bool)

(declare-fun e!93528 () Bool)

(assert (=> b!143545 (= e!93528 (= (apply!121 lt!75064 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16))))))

(declare-fun b!143546 () Bool)

(declare-fun e!93534 () ListLongMap!1717)

(declare-fun e!93524 () ListLongMap!1717)

(assert (=> b!143546 (= e!93534 e!93524)))

(declare-fun c!27215 () Bool)

(assert (=> b!143546 (= c!27215 (and (not (= (bvand (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143547 () Bool)

(assert (=> b!143547 (= e!93529 e!93528)))

(declare-fun res!68304 () Bool)

(assert (=> b!143547 (= res!68304 call!15896)))

(assert (=> b!143547 (=> (not res!68304) (not e!93528))))

(declare-fun bm!15894 () Bool)

(declare-fun call!15900 () Bool)

(assert (=> bm!15894 (= call!15900 (contains!915 lt!75064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15895 () Bool)

(assert (=> bm!15895 (= call!15901 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite (or c!27154 c!27160) (_values!2945 newMap!16) lt!74910) (mask!7313 newMap!16) (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun c!27217 () Bool)

(declare-fun call!15895 () ListLongMap!1717)

(declare-fun bm!15896 () Bool)

(declare-fun call!15897 () ListLongMap!1717)

(assert (=> bm!15896 (= call!15895 (+!168 (ite c!27217 call!15901 (ite c!27215 call!15899 call!15897)) (ite (or c!27217 c!27215) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16))))))))

(declare-fun b!143548 () Bool)

(declare-fun e!93526 () Unit!4536)

(declare-fun Unit!4546 () Unit!4536)

(assert (=> b!143548 (= e!93526 Unit!4546)))

(declare-fun bm!15897 () Bool)

(assert (=> bm!15897 (= call!15898 call!15895)))

(declare-fun c!27212 () Bool)

(declare-fun b!143549 () Bool)

(assert (=> b!143549 (= c!27212 (and (not (= (bvand (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143549 (= e!93524 e!93535)))

(declare-fun b!143541 () Bool)

(declare-fun e!93532 () Bool)

(declare-fun e!93527 () Bool)

(assert (=> b!143541 (= e!93532 e!93527)))

(declare-fun res!68303 () Bool)

(assert (=> b!143541 (= res!68303 call!15900)))

(assert (=> b!143541 (=> (not res!68303) (not e!93527))))

(declare-fun d!45829 () Bool)

(assert (=> d!45829 e!93533))

(declare-fun res!68309 () Bool)

(assert (=> d!45829 (=> (not res!68309) (not e!93533))))

(assert (=> d!45829 (= res!68309 (or (bvsge #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))))

(declare-fun lt!75050 () ListLongMap!1717)

(assert (=> d!45829 (= lt!75064 lt!75050)))

(declare-fun lt!75068 () Unit!4536)

(assert (=> d!45829 (= lt!75068 e!93526)))

(declare-fun c!27214 () Bool)

(assert (=> d!45829 (= c!27214 e!93531)))

(declare-fun res!68305 () Bool)

(assert (=> d!45829 (=> (not res!68305) (not e!93531))))

(assert (=> d!45829 (= res!68305 (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(assert (=> d!45829 (= lt!75050 e!93534)))

(assert (=> d!45829 (= c!27217 (and (not (= (bvand (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45829 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45829 (= (getCurrentListMap!535 (_keys!4724 newMap!16) (ite (or c!27154 c!27160) (_values!2945 newMap!16) lt!74910) (mask!7313 newMap!16) (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) lt!75064)))

(declare-fun b!143550 () Bool)

(assert (=> b!143550 (= e!93535 call!15897)))

(declare-fun b!143551 () Bool)

(declare-fun res!68306 () Bool)

(assert (=> b!143551 (=> (not res!68306) (not e!93533))))

(declare-fun e!93536 () Bool)

(assert (=> b!143551 (= res!68306 e!93536)))

(declare-fun res!68308 () Bool)

(assert (=> b!143551 (=> res!68308 e!93536)))

(assert (=> b!143551 (= res!68308 (not e!93525))))

(declare-fun res!68302 () Bool)

(assert (=> b!143551 (=> (not res!68302) (not e!93525))))

(assert (=> b!143551 (= res!68302 (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143552 () Bool)

(assert (=> b!143552 (= e!93534 (+!168 call!15895 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)))))))

(declare-fun b!143553 () Bool)

(declare-fun lt!75051 () Unit!4536)

(assert (=> b!143553 (= e!93526 lt!75051)))

(declare-fun lt!75063 () ListLongMap!1717)

(assert (=> b!143553 (= lt!75063 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite (or c!27154 c!27160) (_values!2945 newMap!16) lt!74910) (mask!7313 newMap!16) (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75056 () (_ BitVec 64))

(assert (=> b!143553 (= lt!75056 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75053 () (_ BitVec 64))

(assert (=> b!143553 (= lt!75053 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75055 () Unit!4536)

(assert (=> b!143553 (= lt!75055 (addStillContains!97 lt!75063 lt!75056 (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) lt!75053))))

(assert (=> b!143553 (contains!915 (+!168 lt!75063 (tuple2!2669 lt!75056 (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)))) lt!75053)))

(declare-fun lt!75060 () Unit!4536)

(assert (=> b!143553 (= lt!75060 lt!75055)))

(declare-fun lt!75052 () ListLongMap!1717)

(assert (=> b!143553 (= lt!75052 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite (or c!27154 c!27160) (_values!2945 newMap!16) lt!74910) (mask!7313 newMap!16) (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75048 () (_ BitVec 64))

(assert (=> b!143553 (= lt!75048 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75049 () (_ BitVec 64))

(assert (=> b!143553 (= lt!75049 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75061 () Unit!4536)

(assert (=> b!143553 (= lt!75061 (addApplyDifferent!97 lt!75052 lt!75048 (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) lt!75049))))

(assert (=> b!143553 (= (apply!121 (+!168 lt!75052 (tuple2!2669 lt!75048 (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)))) lt!75049) (apply!121 lt!75052 lt!75049))))

(declare-fun lt!75054 () Unit!4536)

(assert (=> b!143553 (= lt!75054 lt!75061)))

(declare-fun lt!75066 () ListLongMap!1717)

(assert (=> b!143553 (= lt!75066 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite (or c!27154 c!27160) (_values!2945 newMap!16) lt!74910) (mask!7313 newMap!16) (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75059 () (_ BitVec 64))

(assert (=> b!143553 (= lt!75059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75065 () (_ BitVec 64))

(assert (=> b!143553 (= lt!75065 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75058 () Unit!4536)

(assert (=> b!143553 (= lt!75058 (addApplyDifferent!97 lt!75066 lt!75059 (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) lt!75065))))

(assert (=> b!143553 (= (apply!121 (+!168 lt!75066 (tuple2!2669 lt!75059 (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)))) lt!75065) (apply!121 lt!75066 lt!75065))))

(declare-fun lt!75057 () Unit!4536)

(assert (=> b!143553 (= lt!75057 lt!75058)))

(declare-fun lt!75062 () ListLongMap!1717)

(assert (=> b!143553 (= lt!75062 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite (or c!27154 c!27160) (_values!2945 newMap!16) lt!74910) (mask!7313 newMap!16) (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75047 () (_ BitVec 64))

(assert (=> b!143553 (= lt!75047 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75067 () (_ BitVec 64))

(assert (=> b!143553 (= lt!75067 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143553 (= lt!75051 (addApplyDifferent!97 lt!75062 lt!75047 (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) lt!75067))))

(assert (=> b!143553 (= (apply!121 (+!168 lt!75062 (tuple2!2669 lt!75047 (ite c!27154 (ite c!27156 (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)))) lt!75067) (apply!121 lt!75062 lt!75067))))

(declare-fun b!143554 () Bool)

(assert (=> b!143554 (= e!93524 call!15898)))

(declare-fun b!143555 () Bool)

(declare-fun res!68310 () Bool)

(assert (=> b!143555 (=> (not res!68310) (not e!93533))))

(assert (=> b!143555 (= res!68310 e!93532)))

(declare-fun c!27216 () Bool)

(assert (=> b!143555 (= c!27216 (not (= (bvand (ite c!27154 (ite c!27156 lt!74927 lt!74918) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!143556 () Bool)

(assert (=> b!143556 (= e!93532 (not call!15900))))

(declare-fun b!143557 () Bool)

(assert (=> b!143557 (= e!93536 e!93530)))

(declare-fun res!68307 () Bool)

(assert (=> b!143557 (=> (not res!68307) (not e!93530))))

(assert (=> b!143557 (= res!68307 (contains!915 lt!75064 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143557 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143558 () Bool)

(assert (=> b!143558 (= e!93527 (= (apply!121 lt!75064 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!27154 c!27156) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16))))))

(declare-fun bm!15898 () Bool)

(assert (=> bm!15898 (= call!15897 call!15899)))

(assert (= (and d!45829 c!27217) b!143552))

(assert (= (and d!45829 (not c!27217)) b!143546))

(assert (= (and b!143546 c!27215) b!143554))

(assert (= (and b!143546 (not c!27215)) b!143549))

(assert (= (and b!143549 c!27212) b!143538))

(assert (= (and b!143549 (not c!27212)) b!143550))

(assert (= (or b!143538 b!143550) bm!15898))

(assert (= (or b!143554 bm!15898) bm!15893))

(assert (= (or b!143554 b!143538) bm!15897))

(assert (= (or b!143552 bm!15893) bm!15895))

(assert (= (or b!143552 bm!15897) bm!15896))

(assert (= (and d!45829 res!68305) b!143539))

(assert (= (and d!45829 c!27214) b!143553))

(assert (= (and d!45829 (not c!27214)) b!143548))

(assert (= (and d!45829 res!68309) b!143551))

(assert (= (and b!143551 res!68302) b!143542))

(assert (= (and b!143551 (not res!68308)) b!143557))

(assert (= (and b!143557 res!68307) b!143543))

(assert (= (and b!143551 res!68306) b!143555))

(assert (= (and b!143555 c!27216) b!143541))

(assert (= (and b!143555 (not c!27216)) b!143556))

(assert (= (and b!143541 res!68303) b!143558))

(assert (= (or b!143541 b!143556) bm!15894))

(assert (= (and b!143555 res!68310) b!143540))

(assert (= (and b!143540 c!27213) b!143547))

(assert (= (and b!143540 (not c!27213)) b!143544))

(assert (= (and b!143547 res!68304) b!143545))

(assert (= (or b!143547 b!143544) bm!15892))

(declare-fun b_lambda!6429 () Bool)

(assert (=> (not b_lambda!6429) (not b!143543)))

(declare-fun tb!2573 () Bool)

(declare-fun t!6358 () Bool)

(assert (=> (and b!143106 (= (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) (defaultEntry!2962 newMap!16)) t!6358) tb!2573))

(declare-fun result!4219 () Bool)

(assert (=> tb!2573 (= result!4219 tp_is_empty!2935)))

(assert (=> b!143543 t!6358))

(declare-fun b_and!8929 () Bool)

(assert (= b_and!8925 (and (=> t!6358 result!4219) b_and!8929)))

(declare-fun t!6360 () Bool)

(declare-fun tb!2575 () Bool)

(assert (=> (and b!143111 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 newMap!16)) t!6360) tb!2575))

(declare-fun result!4221 () Bool)

(assert (= result!4221 result!4219))

(assert (=> b!143543 t!6360))

(declare-fun b_and!8931 () Bool)

(assert (= b_and!8927 (and (=> t!6360 result!4221) b_and!8931)))

(declare-fun m!172787 () Bool)

(assert (=> b!143552 m!172787))

(declare-fun m!172789 () Bool)

(assert (=> b!143539 m!172789))

(assert (=> b!143539 m!172789))

(declare-fun m!172791 () Bool)

(assert (=> b!143539 m!172791))

(assert (=> b!143557 m!172789))

(assert (=> b!143557 m!172789))

(declare-fun m!172793 () Bool)

(assert (=> b!143557 m!172793))

(declare-fun m!172795 () Bool)

(assert (=> b!143543 m!172795))

(declare-fun m!172797 () Bool)

(assert (=> b!143543 m!172797))

(declare-fun m!172799 () Bool)

(assert (=> b!143543 m!172799))

(assert (=> b!143543 m!172789))

(assert (=> b!143543 m!172795))

(assert (=> b!143543 m!172797))

(assert (=> b!143543 m!172789))

(declare-fun m!172801 () Bool)

(assert (=> b!143543 m!172801))

(declare-fun m!172803 () Bool)

(assert (=> bm!15896 m!172803))

(declare-fun m!172805 () Bool)

(assert (=> bm!15892 m!172805))

(assert (=> b!143542 m!172789))

(assert (=> b!143542 m!172789))

(assert (=> b!143542 m!172791))

(declare-fun m!172807 () Bool)

(assert (=> b!143553 m!172807))

(declare-fun m!172809 () Bool)

(assert (=> b!143553 m!172809))

(assert (=> b!143553 m!172807))

(declare-fun m!172811 () Bool)

(assert (=> b!143553 m!172811))

(declare-fun m!172813 () Bool)

(assert (=> b!143553 m!172813))

(declare-fun m!172815 () Bool)

(assert (=> b!143553 m!172815))

(declare-fun m!172817 () Bool)

(assert (=> b!143553 m!172817))

(declare-fun m!172819 () Bool)

(assert (=> b!143553 m!172819))

(declare-fun m!172821 () Bool)

(assert (=> b!143553 m!172821))

(declare-fun m!172823 () Bool)

(assert (=> b!143553 m!172823))

(assert (=> b!143553 m!172821))

(declare-fun m!172825 () Bool)

(assert (=> b!143553 m!172825))

(assert (=> b!143553 m!172789))

(assert (=> b!143553 m!172825))

(declare-fun m!172827 () Bool)

(assert (=> b!143553 m!172827))

(declare-fun m!172829 () Bool)

(assert (=> b!143553 m!172829))

(declare-fun m!172831 () Bool)

(assert (=> b!143553 m!172831))

(declare-fun m!172833 () Bool)

(assert (=> b!143553 m!172833))

(declare-fun m!172835 () Bool)

(assert (=> b!143553 m!172835))

(assert (=> b!143553 m!172833))

(declare-fun m!172837 () Bool)

(assert (=> b!143553 m!172837))

(declare-fun m!172839 () Bool)

(assert (=> b!143558 m!172839))

(declare-fun m!172841 () Bool)

(assert (=> b!143545 m!172841))

(assert (=> bm!15895 m!172817))

(assert (=> d!45829 m!172741))

(declare-fun m!172843 () Bool)

(assert (=> bm!15894 m!172843))

(assert (=> bm!15858 d!45829))

(declare-fun d!45831 () Bool)

(assert (=> d!45831 (= (apply!121 lt!74997 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1535 (getValueByKey!175 (toList!874 lt!74997) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6053 () Bool)

(assert (= bs!6053 d!45831))

(declare-fun m!172845 () Bool)

(assert (=> bs!6053 m!172845))

(assert (=> bs!6053 m!172845))

(declare-fun m!172847 () Bool)

(assert (=> bs!6053 m!172847))

(assert (=> b!143434 d!45831))

(declare-fun d!45833 () Bool)

(declare-fun lt!75069 () Bool)

(assert (=> d!45833 (= lt!75069 (select (content!139 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))) (h!2349 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))))))

(declare-fun e!93537 () Bool)

(assert (=> d!45833 (= lt!75069 e!93537)))

(declare-fun res!68311 () Bool)

(assert (=> d!45833 (=> (not res!68311) (not e!93537))))

(assert (=> d!45833 (= res!68311 ((_ is Cons!1741) (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))))))

(assert (=> d!45833 (= (contains!917 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742)) (h!2349 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))) lt!75069)))

(declare-fun b!143559 () Bool)

(declare-fun e!93538 () Bool)

(assert (=> b!143559 (= e!93537 e!93538)))

(declare-fun res!68312 () Bool)

(assert (=> b!143559 (=> res!68312 e!93538)))

(assert (=> b!143559 (= res!68312 (= (h!2349 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))) (h!2349 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))))))

(declare-fun b!143560 () Bool)

(assert (=> b!143560 (= e!93538 (contains!917 (t!6345 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))) (h!2349 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))))))

(assert (= (and d!45833 res!68311) b!143559))

(assert (= (and b!143559 (not res!68312)) b!143560))

(declare-fun m!172849 () Bool)

(assert (=> d!45833 m!172849))

(declare-fun m!172851 () Bool)

(assert (=> d!45833 m!172851))

(declare-fun m!172853 () Bool)

(assert (=> b!143560 m!172853))

(assert (=> b!143226 d!45833))

(declare-fun d!45835 () Bool)

(declare-fun isEmpty!425 (Option!181) Bool)

(assert (=> d!45835 (= (isDefined!129 (getValueByKey!175 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))) (not (isEmpty!425 (getValueByKey!175 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))))

(declare-fun bs!6054 () Bool)

(assert (= bs!6054 d!45835))

(assert (=> bs!6054 m!172585))

(declare-fun m!172855 () Bool)

(assert (=> bs!6054 m!172855))

(assert (=> b!143236 d!45835))

(declare-fun b!143570 () Bool)

(declare-fun e!93543 () Option!181)

(declare-fun e!93544 () Option!181)

(assert (=> b!143570 (= e!93543 e!93544)))

(declare-fun c!27223 () Bool)

(assert (=> b!143570 (= c!27223 (and ((_ is Cons!1740) (toList!874 lt!74809)) (not (= (_1!1345 (h!2348 (toList!874 lt!74809))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))))

(declare-fun b!143569 () Bool)

(assert (=> b!143569 (= e!93543 (Some!180 (_2!1345 (h!2348 (toList!874 lt!74809)))))))

(declare-fun d!45837 () Bool)

(declare-fun c!27222 () Bool)

(assert (=> d!45837 (= c!27222 (and ((_ is Cons!1740) (toList!874 lt!74809)) (= (_1!1345 (h!2348 (toList!874 lt!74809))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))))))

(assert (=> d!45837 (= (getValueByKey!175 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) e!93543)))

(declare-fun b!143571 () Bool)

(assert (=> b!143571 (= e!93544 (getValueByKey!175 (t!6344 (toList!874 lt!74809)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143572 () Bool)

(assert (=> b!143572 (= e!93544 None!179)))

(assert (= (and d!45837 c!27222) b!143569))

(assert (= (and d!45837 (not c!27222)) b!143570))

(assert (= (and b!143570 c!27223) b!143571))

(assert (= (and b!143570 (not c!27223)) b!143572))

(assert (=> b!143571 m!172463))

(declare-fun m!172857 () Bool)

(assert (=> b!143571 m!172857))

(assert (=> b!143236 d!45837))

(declare-fun d!45839 () Bool)

(assert (=> d!45839 (= (get!1533 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3289 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> b!143361 d!45839))

(declare-fun d!45841 () Bool)

(declare-fun e!93545 () Bool)

(assert (=> d!45841 e!93545))

(declare-fun res!68313 () Bool)

(assert (=> d!45841 (=> res!68313 e!93545)))

(declare-fun lt!75072 () Bool)

(assert (=> d!45841 (= res!68313 (not lt!75072))))

(declare-fun lt!75071 () Bool)

(assert (=> d!45841 (= lt!75072 lt!75071)))

(declare-fun lt!75073 () Unit!4536)

(declare-fun e!93546 () Unit!4536)

(assert (=> d!45841 (= lt!75073 e!93546)))

(declare-fun c!27224 () Bool)

(assert (=> d!45841 (= c!27224 lt!75071)))

(assert (=> d!45841 (= lt!75071 (containsKey!179 (toList!874 lt!74997) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!45841 (= (contains!915 lt!74997 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75072)))

(declare-fun b!143573 () Bool)

(declare-fun lt!75070 () Unit!4536)

(assert (=> b!143573 (= e!93546 lt!75070)))

(assert (=> b!143573 (= lt!75070 (lemmaContainsKeyImpliesGetValueByKeyDefined!128 (toList!874 lt!74997) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143573 (isDefined!129 (getValueByKey!175 (toList!874 lt!74997) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143574 () Bool)

(declare-fun Unit!4547 () Unit!4536)

(assert (=> b!143574 (= e!93546 Unit!4547)))

(declare-fun b!143575 () Bool)

(assert (=> b!143575 (= e!93545 (isDefined!129 (getValueByKey!175 (toList!874 lt!74997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45841 c!27224) b!143573))

(assert (= (and d!45841 (not c!27224)) b!143574))

(assert (= (and d!45841 (not res!68313)) b!143575))

(declare-fun m!172859 () Bool)

(assert (=> d!45841 m!172859))

(declare-fun m!172861 () Bool)

(assert (=> b!143573 m!172861))

(assert (=> b!143573 m!172751))

(assert (=> b!143573 m!172751))

(declare-fun m!172863 () Bool)

(assert (=> b!143573 m!172863))

(assert (=> b!143575 m!172751))

(assert (=> b!143575 m!172751))

(assert (=> b!143575 m!172863))

(assert (=> bm!15879 d!45841))

(declare-fun d!45843 () Bool)

(declare-fun lt!75076 () (_ BitVec 32))

(assert (=> d!45843 (and (bvsge lt!75076 #b00000000000000000000000000000000) (bvsle lt!75076 (bvsub (size!2582 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!93552 () (_ BitVec 32))

(assert (=> d!45843 (= lt!75076 e!93552)))

(declare-fun c!27230 () Bool)

(assert (=> d!45843 (= c!27230 (bvsge #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(assert (=> d!45843 (and (bvsle #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2582 (_keys!4724 newMap!16)) (size!2582 (_keys!4724 newMap!16))))))

(assert (=> d!45843 (= (arrayCountValidKeys!0 (_keys!4724 newMap!16) #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))) lt!75076)))

(declare-fun b!143584 () Bool)

(assert (=> b!143584 (= e!93552 #b00000000000000000000000000000000)))

(declare-fun b!143585 () Bool)

(declare-fun e!93551 () (_ BitVec 32))

(assert (=> b!143585 (= e!93552 e!93551)))

(declare-fun c!27229 () Bool)

(assert (=> b!143585 (= c!27229 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143586 () Bool)

(declare-fun call!15904 () (_ BitVec 32))

(assert (=> b!143586 (= e!93551 call!15904)))

(declare-fun b!143587 () Bool)

(assert (=> b!143587 (= e!93551 (bvadd #b00000000000000000000000000000001 call!15904))))

(declare-fun bm!15901 () Bool)

(assert (=> bm!15901 (= call!15904 (arrayCountValidKeys!0 (_keys!4724 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2582 (_keys!4724 newMap!16))))))

(assert (= (and d!45843 c!27230) b!143584))

(assert (= (and d!45843 (not c!27230)) b!143585))

(assert (= (and b!143585 c!27229) b!143587))

(assert (= (and b!143585 (not c!27229)) b!143586))

(assert (= (or b!143587 b!143586) bm!15901))

(assert (=> b!143585 m!172789))

(assert (=> b!143585 m!172789))

(assert (=> b!143585 m!172791))

(declare-fun m!172865 () Bool)

(assert (=> bm!15901 m!172865))

(assert (=> b!143369 d!45843))

(declare-fun d!45845 () Bool)

(assert (=> d!45845 (= (apply!121 (+!168 lt!74999 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!74998) (apply!121 lt!74999 lt!74998))))

(declare-fun lt!75079 () Unit!4536)

(declare-fun choose!878 (ListLongMap!1717 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4536)

(assert (=> d!45845 (= lt!75079 (choose!878 lt!74999 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) lt!74998))))

(declare-fun e!93555 () Bool)

(assert (=> d!45845 e!93555))

(declare-fun res!68316 () Bool)

(assert (=> d!45845 (=> (not res!68316) (not e!93555))))

(assert (=> d!45845 (= res!68316 (contains!915 lt!74999 lt!74998))))

(assert (=> d!45845 (= (addApplyDifferent!97 lt!74999 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) lt!74998) lt!75079)))

(declare-fun b!143591 () Bool)

(assert (=> b!143591 (= e!93555 (not (= lt!74998 lt!74992)))))

(assert (= (and d!45845 res!68316) b!143591))

(assert (=> d!45845 m!172705))

(declare-fun m!172867 () Bool)

(assert (=> d!45845 m!172867))

(assert (=> d!45845 m!172695))

(assert (=> d!45845 m!172695))

(assert (=> d!45845 m!172697))

(declare-fun m!172869 () Bool)

(assert (=> d!45845 m!172869))

(assert (=> b!143429 d!45845))

(declare-fun d!45847 () Bool)

(assert (=> d!45847 (= (apply!121 (+!168 lt!74995 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!75000) (apply!121 lt!74995 lt!75000))))

(declare-fun lt!75080 () Unit!4536)

(assert (=> d!45847 (= lt!75080 (choose!878 lt!74995 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))) lt!75000))))

(declare-fun e!93556 () Bool)

(assert (=> d!45847 e!93556))

(declare-fun res!68317 () Bool)

(assert (=> d!45847 (=> (not res!68317) (not e!93556))))

(assert (=> d!45847 (= res!68317 (contains!915 lt!74995 lt!75000))))

(assert (=> d!45847 (= (addApplyDifferent!97 lt!74995 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))) lt!75000) lt!75080)))

(declare-fun b!143592 () Bool)

(assert (=> b!143592 (= e!93556 (not (= lt!75000 lt!74980)))))

(assert (= (and d!45847 res!68317) b!143592))

(assert (=> d!45847 m!172683))

(declare-fun m!172871 () Bool)

(assert (=> d!45847 m!172871))

(assert (=> d!45847 m!172703))

(assert (=> d!45847 m!172703))

(assert (=> d!45847 m!172707))

(declare-fun m!172873 () Bool)

(assert (=> d!45847 m!172873))

(assert (=> b!143429 d!45847))

(declare-fun d!45849 () Bool)

(declare-fun e!93557 () Bool)

(assert (=> d!45849 e!93557))

(declare-fun res!68318 () Bool)

(assert (=> d!45849 (=> res!68318 e!93557)))

(declare-fun lt!75083 () Bool)

(assert (=> d!45849 (= res!68318 (not lt!75083))))

(declare-fun lt!75082 () Bool)

(assert (=> d!45849 (= lt!75083 lt!75082)))

(declare-fun lt!75084 () Unit!4536)

(declare-fun e!93558 () Unit!4536)

(assert (=> d!45849 (= lt!75084 e!93558)))

(declare-fun c!27231 () Bool)

(assert (=> d!45849 (= c!27231 lt!75082)))

(assert (=> d!45849 (= lt!75082 (containsKey!179 (toList!874 (+!168 lt!74996 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))) lt!74986))))

(assert (=> d!45849 (= (contains!915 (+!168 lt!74996 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!74986) lt!75083)))

(declare-fun b!143593 () Bool)

(declare-fun lt!75081 () Unit!4536)

(assert (=> b!143593 (= e!93558 lt!75081)))

(assert (=> b!143593 (= lt!75081 (lemmaContainsKeyImpliesGetValueByKeyDefined!128 (toList!874 (+!168 lt!74996 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))) lt!74986))))

(assert (=> b!143593 (isDefined!129 (getValueByKey!175 (toList!874 (+!168 lt!74996 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))) lt!74986))))

(declare-fun b!143594 () Bool)

(declare-fun Unit!4548 () Unit!4536)

(assert (=> b!143594 (= e!93558 Unit!4548)))

(declare-fun b!143595 () Bool)

(assert (=> b!143595 (= e!93557 (isDefined!129 (getValueByKey!175 (toList!874 (+!168 lt!74996 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))) lt!74986)))))

(assert (= (and d!45849 c!27231) b!143593))

(assert (= (and d!45849 (not c!27231)) b!143594))

(assert (= (and d!45849 (not res!68318)) b!143595))

(declare-fun m!172875 () Bool)

(assert (=> d!45849 m!172875))

(declare-fun m!172877 () Bool)

(assert (=> b!143593 m!172877))

(declare-fun m!172879 () Bool)

(assert (=> b!143593 m!172879))

(assert (=> b!143593 m!172879))

(declare-fun m!172881 () Bool)

(assert (=> b!143593 m!172881))

(assert (=> b!143595 m!172879))

(assert (=> b!143595 m!172879))

(assert (=> b!143595 m!172881))

(assert (=> b!143429 d!45849))

(declare-fun d!45851 () Bool)

(declare-fun e!93561 () Bool)

(assert (=> d!45851 e!93561))

(declare-fun res!68324 () Bool)

(assert (=> d!45851 (=> (not res!68324) (not e!93561))))

(declare-fun lt!75095 () ListLongMap!1717)

(assert (=> d!45851 (= res!68324 (contains!915 lt!75095 (_1!1345 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(declare-fun lt!75096 () List!1744)

(assert (=> d!45851 (= lt!75095 (ListLongMap!1718 lt!75096))))

(declare-fun lt!75093 () Unit!4536)

(declare-fun lt!75094 () Unit!4536)

(assert (=> d!45851 (= lt!75093 lt!75094)))

(assert (=> d!45851 (= (getValueByKey!175 lt!75096 (_1!1345 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!92 (List!1744 (_ BitVec 64) V!3561) Unit!4536)

(assert (=> d!45851 (= lt!75094 (lemmaContainsTupThenGetReturnValue!92 lt!75096 (_1!1345 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(declare-fun insertStrictlySorted!95 (List!1744 (_ BitVec 64) V!3561) List!1744)

(assert (=> d!45851 (= lt!75096 (insertStrictlySorted!95 (toList!874 lt!74996) (_1!1345 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45851 (= (+!168 lt!74996 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!75095)))

(declare-fun b!143600 () Bool)

(declare-fun res!68323 () Bool)

(assert (=> b!143600 (=> (not res!68323) (not e!93561))))

(assert (=> b!143600 (= res!68323 (= (getValueByKey!175 (toList!874 lt!75095) (_1!1345 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))))))))

(declare-fun b!143601 () Bool)

(declare-fun contains!918 (List!1744 tuple2!2668) Bool)

(assert (=> b!143601 (= e!93561 (contains!918 (toList!874 lt!75095) (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))))))

(assert (= (and d!45851 res!68324) b!143600))

(assert (= (and b!143600 res!68323) b!143601))

(declare-fun m!172883 () Bool)

(assert (=> d!45851 m!172883))

(declare-fun m!172885 () Bool)

(assert (=> d!45851 m!172885))

(declare-fun m!172887 () Bool)

(assert (=> d!45851 m!172887))

(declare-fun m!172889 () Bool)

(assert (=> d!45851 m!172889))

(declare-fun m!172891 () Bool)

(assert (=> b!143600 m!172891))

(declare-fun m!172893 () Bool)

(assert (=> b!143601 m!172893))

(assert (=> b!143429 d!45851))

(assert (=> b!143429 d!45821))

(declare-fun d!45853 () Bool)

(assert (=> d!45853 (= (apply!121 (+!168 lt!74985 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!74982) (get!1535 (getValueByKey!175 (toList!874 (+!168 lt!74985 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) lt!74982)))))

(declare-fun bs!6055 () Bool)

(assert (= bs!6055 d!45853))

(declare-fun m!172895 () Bool)

(assert (=> bs!6055 m!172895))

(assert (=> bs!6055 m!172895))

(declare-fun m!172897 () Bool)

(assert (=> bs!6055 m!172897))

(assert (=> b!143429 d!45853))

(declare-fun d!45855 () Bool)

(assert (=> d!45855 (= (apply!121 (+!168 lt!74985 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!74982) (apply!121 lt!74985 lt!74982))))

(declare-fun lt!75097 () Unit!4536)

(assert (=> d!45855 (= lt!75097 (choose!878 lt!74985 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))) lt!74982))))

(declare-fun e!93562 () Bool)

(assert (=> d!45855 e!93562))

(declare-fun res!68325 () Bool)

(assert (=> d!45855 (=> (not res!68325) (not e!93562))))

(assert (=> d!45855 (= res!68325 (contains!915 lt!74985 lt!74982))))

(assert (=> d!45855 (= (addApplyDifferent!97 lt!74985 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))) lt!74982) lt!75097)))

(declare-fun b!143602 () Bool)

(assert (=> b!143602 (= e!93562 (not (= lt!74982 lt!74981)))))

(assert (= (and d!45855 res!68325) b!143602))

(assert (=> d!45855 m!172685))

(declare-fun m!172899 () Bool)

(assert (=> d!45855 m!172899))

(assert (=> d!45855 m!172677))

(assert (=> d!45855 m!172677))

(assert (=> d!45855 m!172679))

(declare-fun m!172901 () Bool)

(assert (=> d!45855 m!172901))

(assert (=> b!143429 d!45855))

(declare-fun d!45857 () Bool)

(declare-fun e!93563 () Bool)

(assert (=> d!45857 e!93563))

(declare-fun res!68327 () Bool)

(assert (=> d!45857 (=> (not res!68327) (not e!93563))))

(declare-fun lt!75100 () ListLongMap!1717)

(assert (=> d!45857 (= res!68327 (contains!915 lt!75100 (_1!1345 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(declare-fun lt!75101 () List!1744)

(assert (=> d!45857 (= lt!75100 (ListLongMap!1718 lt!75101))))

(declare-fun lt!75098 () Unit!4536)

(declare-fun lt!75099 () Unit!4536)

(assert (=> d!45857 (= lt!75098 lt!75099)))

(assert (=> d!45857 (= (getValueByKey!175 lt!75101 (_1!1345 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45857 (= lt!75099 (lemmaContainsTupThenGetReturnValue!92 lt!75101 (_1!1345 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45857 (= lt!75101 (insertStrictlySorted!95 (toList!874 lt!74999) (_1!1345 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45857 (= (+!168 lt!74999 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!75100)))

(declare-fun b!143603 () Bool)

(declare-fun res!68326 () Bool)

(assert (=> b!143603 (=> (not res!68326) (not e!93563))))

(assert (=> b!143603 (= res!68326 (= (getValueByKey!175 (toList!874 lt!75100) (_1!1345 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))))))))

(declare-fun b!143604 () Bool)

(assert (=> b!143604 (= e!93563 (contains!918 (toList!874 lt!75100) (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))))))

(assert (= (and d!45857 res!68327) b!143603))

(assert (= (and b!143603 res!68326) b!143604))

(declare-fun m!172903 () Bool)

(assert (=> d!45857 m!172903))

(declare-fun m!172905 () Bool)

(assert (=> d!45857 m!172905))

(declare-fun m!172907 () Bool)

(assert (=> d!45857 m!172907))

(declare-fun m!172909 () Bool)

(assert (=> d!45857 m!172909))

(declare-fun m!172911 () Bool)

(assert (=> b!143603 m!172911))

(declare-fun m!172913 () Bool)

(assert (=> b!143604 m!172913))

(assert (=> b!143429 d!45857))

(declare-fun d!45859 () Bool)

(declare-fun e!93564 () Bool)

(assert (=> d!45859 e!93564))

(declare-fun res!68329 () Bool)

(assert (=> d!45859 (=> (not res!68329) (not e!93564))))

(declare-fun lt!75104 () ListLongMap!1717)

(assert (=> d!45859 (= res!68329 (contains!915 lt!75104 (_1!1345 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(declare-fun lt!75105 () List!1744)

(assert (=> d!45859 (= lt!75104 (ListLongMap!1718 lt!75105))))

(declare-fun lt!75102 () Unit!4536)

(declare-fun lt!75103 () Unit!4536)

(assert (=> d!45859 (= lt!75102 lt!75103)))

(assert (=> d!45859 (= (getValueByKey!175 lt!75105 (_1!1345 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45859 (= lt!75103 (lemmaContainsTupThenGetReturnValue!92 lt!75105 (_1!1345 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45859 (= lt!75105 (insertStrictlySorted!95 (toList!874 lt!74985) (_1!1345 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45859 (= (+!168 lt!74985 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!75104)))

(declare-fun b!143605 () Bool)

(declare-fun res!68328 () Bool)

(assert (=> b!143605 (=> (not res!68328) (not e!93564))))

(assert (=> b!143605 (= res!68328 (= (getValueByKey!175 (toList!874 lt!75104) (_1!1345 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))))

(declare-fun b!143606 () Bool)

(assert (=> b!143606 (= e!93564 (contains!918 (toList!874 lt!75104) (tuple2!2669 lt!74981 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))

(assert (= (and d!45859 res!68329) b!143605))

(assert (= (and b!143605 res!68328) b!143606))

(declare-fun m!172915 () Bool)

(assert (=> d!45859 m!172915))

(declare-fun m!172917 () Bool)

(assert (=> d!45859 m!172917))

(declare-fun m!172919 () Bool)

(assert (=> d!45859 m!172919))

(declare-fun m!172921 () Bool)

(assert (=> d!45859 m!172921))

(declare-fun m!172923 () Bool)

(assert (=> b!143605 m!172923))

(declare-fun m!172925 () Bool)

(assert (=> b!143606 m!172925))

(assert (=> b!143429 d!45859))

(declare-fun d!45861 () Bool)

(assert (=> d!45861 (= (apply!121 lt!74999 lt!74998) (get!1535 (getValueByKey!175 (toList!874 lt!74999) lt!74998)))))

(declare-fun bs!6056 () Bool)

(assert (= bs!6056 d!45861))

(declare-fun m!172927 () Bool)

(assert (=> bs!6056 m!172927))

(assert (=> bs!6056 m!172927))

(declare-fun m!172929 () Bool)

(assert (=> bs!6056 m!172929))

(assert (=> b!143429 d!45861))

(declare-fun d!45863 () Bool)

(assert (=> d!45863 (contains!915 (+!168 lt!74996 (tuple2!2669 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!74986)))

(declare-fun lt!75108 () Unit!4536)

(declare-fun choose!879 (ListLongMap!1717 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4536)

(assert (=> d!45863 (= lt!75108 (choose!879 lt!74996 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) lt!74986))))

(assert (=> d!45863 (contains!915 lt!74996 lt!74986)))

(assert (=> d!45863 (= (addStillContains!97 lt!74996 lt!74989 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) lt!74986) lt!75108)))

(declare-fun bs!6057 () Bool)

(assert (= bs!6057 d!45863))

(assert (=> bs!6057 m!172691))

(assert (=> bs!6057 m!172691))

(assert (=> bs!6057 m!172693))

(declare-fun m!172931 () Bool)

(assert (=> bs!6057 m!172931))

(declare-fun m!172933 () Bool)

(assert (=> bs!6057 m!172933))

(assert (=> b!143429 d!45863))

(declare-fun d!45865 () Bool)

(declare-fun e!93565 () Bool)

(assert (=> d!45865 e!93565))

(declare-fun res!68331 () Bool)

(assert (=> d!45865 (=> (not res!68331) (not e!93565))))

(declare-fun lt!75111 () ListLongMap!1717)

(assert (=> d!45865 (= res!68331 (contains!915 lt!75111 (_1!1345 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(declare-fun lt!75112 () List!1744)

(assert (=> d!45865 (= lt!75111 (ListLongMap!1718 lt!75112))))

(declare-fun lt!75109 () Unit!4536)

(declare-fun lt!75110 () Unit!4536)

(assert (=> d!45865 (= lt!75109 lt!75110)))

(assert (=> d!45865 (= (getValueByKey!175 lt!75112 (_1!1345 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45865 (= lt!75110 (lemmaContainsTupThenGetReturnValue!92 lt!75112 (_1!1345 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45865 (= lt!75112 (insertStrictlySorted!95 (toList!874 lt!74995) (_1!1345 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45865 (= (+!168 lt!74995 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!75111)))

(declare-fun b!143608 () Bool)

(declare-fun res!68330 () Bool)

(assert (=> b!143608 (=> (not res!68330) (not e!93565))))

(assert (=> b!143608 (= res!68330 (= (getValueByKey!175 (toList!874 lt!75111) (_1!1345 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))))

(declare-fun b!143609 () Bool)

(assert (=> b!143609 (= e!93565 (contains!918 (toList!874 lt!75111) (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))

(assert (= (and d!45865 res!68331) b!143608))

(assert (= (and b!143608 res!68330) b!143609))

(declare-fun m!172935 () Bool)

(assert (=> d!45865 m!172935))

(declare-fun m!172937 () Bool)

(assert (=> d!45865 m!172937))

(declare-fun m!172939 () Bool)

(assert (=> d!45865 m!172939))

(declare-fun m!172941 () Bool)

(assert (=> d!45865 m!172941))

(declare-fun m!172943 () Bool)

(assert (=> b!143608 m!172943))

(declare-fun m!172945 () Bool)

(assert (=> b!143609 m!172945))

(assert (=> b!143429 d!45865))

(declare-fun d!45867 () Bool)

(assert (=> d!45867 (= (apply!121 lt!74995 lt!75000) (get!1535 (getValueByKey!175 (toList!874 lt!74995) lt!75000)))))

(declare-fun bs!6058 () Bool)

(assert (= bs!6058 d!45867))

(declare-fun m!172947 () Bool)

(assert (=> bs!6058 m!172947))

(assert (=> bs!6058 m!172947))

(declare-fun m!172949 () Bool)

(assert (=> bs!6058 m!172949))

(assert (=> b!143429 d!45867))

(declare-fun d!45869 () Bool)

(assert (=> d!45869 (= (apply!121 (+!168 lt!74999 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!74998) (get!1535 (getValueByKey!175 (toList!874 (+!168 lt!74999 (tuple2!2669 lt!74992 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))))) lt!74998)))))

(declare-fun bs!6059 () Bool)

(assert (= bs!6059 d!45869))

(declare-fun m!172951 () Bool)

(assert (=> bs!6059 m!172951))

(assert (=> bs!6059 m!172951))

(declare-fun m!172953 () Bool)

(assert (=> bs!6059 m!172953))

(assert (=> b!143429 d!45869))

(declare-fun d!45871 () Bool)

(assert (=> d!45871 (= (apply!121 lt!74985 lt!74982) (get!1535 (getValueByKey!175 (toList!874 lt!74985) lt!74982)))))

(declare-fun bs!6060 () Bool)

(assert (= bs!6060 d!45871))

(declare-fun m!172955 () Bool)

(assert (=> bs!6060 m!172955))

(assert (=> bs!6060 m!172955))

(declare-fun m!172957 () Bool)

(assert (=> bs!6060 m!172957))

(assert (=> b!143429 d!45871))

(declare-fun d!45873 () Bool)

(assert (=> d!45873 (= (apply!121 (+!168 lt!74995 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!75000) (get!1535 (getValueByKey!175 (toList!874 (+!168 lt!74995 (tuple2!2669 lt!74980 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) lt!75000)))))

(declare-fun bs!6061 () Bool)

(assert (= bs!6061 d!45873))

(declare-fun m!172959 () Bool)

(assert (=> bs!6061 m!172959))

(assert (=> bs!6061 m!172959))

(declare-fun m!172961 () Bool)

(assert (=> bs!6061 m!172961))

(assert (=> b!143429 d!45873))

(declare-fun d!45875 () Bool)

(declare-fun e!93568 () Bool)

(assert (=> d!45875 e!93568))

(declare-fun c!27234 () Bool)

(assert (=> d!45875 (= c!27234 (and (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!45875 true))

(declare-fun _$29!168 () Unit!4536)

(assert (=> d!45875 (= (choose!876 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (_values!2945 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992))) (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) (zeroValue!2810 (v!3290 (underlying!479 thiss!992))) (minValue!2810 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992)))) _$29!168)))

(declare-fun b!143614 () Bool)

(assert (=> b!143614 (= e!93568 (arrayContainsKey!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!143615 () Bool)

(assert (=> b!143615 (= e!93568 (ite (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45875 c!27234) b!143614))

(assert (= (and d!45875 (not c!27234)) b!143615))

(assert (=> b!143614 m!172463))

(assert (=> b!143614 m!172467))

(assert (=> d!45807 d!45875))

(declare-fun d!45877 () Bool)

(assert (=> d!45877 (= (validMask!0 (mask!7313 (v!3290 (underlying!479 thiss!992)))) (and (or (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000001111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000011111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000001111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000011111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000001111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000011111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000001111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000011111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000000111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000001111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000011111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000000111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000001111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000011111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000000111111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000001111111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000011111111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000000111111111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000001111111111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000011111111111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00000111111111111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00001111111111111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00011111111111111111111111111111) (= (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7313 (v!3290 (underlying!479 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!45807 d!45877))

(assert (=> b!143460 d!45805))

(declare-fun d!45879 () Bool)

(assert (=> d!45879 (= (+!168 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) lt!74927 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75115 () Unit!4536)

(declare-fun choose!880 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 V!3561 Int) Unit!4536)

(assert (=> d!45879 (= lt!75115 (choose!880 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) lt!74927 (zeroValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45879 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45879 (= (lemmaChangeZeroKeyThenAddPairToListMap!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) lt!74927 (zeroValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) (defaultEntry!2962 newMap!16)) lt!75115)))

(declare-fun bs!6062 () Bool)

(assert (= bs!6062 d!45879))

(assert (=> bs!6062 m!172621))

(declare-fun m!172963 () Bool)

(assert (=> bs!6062 m!172963))

(assert (=> bs!6062 m!172621))

(assert (=> bs!6062 m!172475))

(declare-fun m!172965 () Bool)

(assert (=> bs!6062 m!172965))

(assert (=> bs!6062 m!172741))

(assert (=> bs!6062 m!172475))

(declare-fun m!172967 () Bool)

(assert (=> bs!6062 m!172967))

(assert (=> b!143321 d!45879))

(declare-fun d!45881 () Bool)

(declare-fun e!93569 () Bool)

(assert (=> d!45881 e!93569))

(declare-fun res!68332 () Bool)

(assert (=> d!45881 (=> res!68332 e!93569)))

(declare-fun lt!75118 () Bool)

(assert (=> d!45881 (= res!68332 (not lt!75118))))

(declare-fun lt!75117 () Bool)

(assert (=> d!45881 (= lt!75118 lt!75117)))

(declare-fun lt!75119 () Unit!4536)

(declare-fun e!93570 () Unit!4536)

(assert (=> d!45881 (= lt!75119 e!93570)))

(declare-fun c!27235 () Bool)

(assert (=> d!45881 (= c!27235 lt!75117)))

(assert (=> d!45881 (= lt!75117 (containsKey!179 (toList!874 call!15844) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> d!45881 (= (contains!915 call!15844 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) lt!75118)))

(declare-fun b!143616 () Bool)

(declare-fun lt!75116 () Unit!4536)

(assert (=> b!143616 (= e!93570 lt!75116)))

(assert (=> b!143616 (= lt!75116 (lemmaContainsKeyImpliesGetValueByKeyDefined!128 (toList!874 call!15844) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> b!143616 (isDefined!129 (getValueByKey!175 (toList!874 call!15844) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143617 () Bool)

(declare-fun Unit!4549 () Unit!4536)

(assert (=> b!143617 (= e!93570 Unit!4549)))

(declare-fun b!143618 () Bool)

(assert (=> b!143618 (= e!93569 (isDefined!129 (getValueByKey!175 (toList!874 call!15844) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))))))

(assert (= (and d!45881 c!27235) b!143616))

(assert (= (and d!45881 (not c!27235)) b!143617))

(assert (= (and d!45881 (not res!68332)) b!143618))

(assert (=> d!45881 m!172463))

(declare-fun m!172969 () Bool)

(assert (=> d!45881 m!172969))

(assert (=> b!143616 m!172463))

(declare-fun m!172971 () Bool)

(assert (=> b!143616 m!172971))

(assert (=> b!143616 m!172463))

(declare-fun m!172973 () Bool)

(assert (=> b!143616 m!172973))

(assert (=> b!143616 m!172973))

(declare-fun m!172975 () Bool)

(assert (=> b!143616 m!172975))

(assert (=> b!143618 m!172463))

(assert (=> b!143618 m!172973))

(assert (=> b!143618 m!172973))

(assert (=> b!143618 m!172975))

(assert (=> b!143334 d!45881))

(assert (=> b!143415 d!45827))

(declare-fun bm!15902 () Bool)

(declare-fun call!15905 () Bool)

(declare-fun c!27236 () Bool)

(assert (=> bm!15902 (= call!15905 (arrayNoDuplicates!0 (_keys!4724 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!27236 (Cons!1741 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000) Nil!1742) Nil!1742)))))

(declare-fun b!143619 () Bool)

(declare-fun e!93571 () Bool)

(declare-fun e!93572 () Bool)

(assert (=> b!143619 (= e!93571 e!93572)))

(assert (=> b!143619 (= c!27236 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143620 () Bool)

(assert (=> b!143620 (= e!93572 call!15905)))

(declare-fun b!143622 () Bool)

(declare-fun e!93573 () Bool)

(assert (=> b!143622 (= e!93573 e!93571)))

(declare-fun res!68334 () Bool)

(assert (=> b!143622 (=> (not res!68334) (not e!93571))))

(declare-fun e!93574 () Bool)

(assert (=> b!143622 (= res!68334 (not e!93574))))

(declare-fun res!68335 () Bool)

(assert (=> b!143622 (=> (not res!68335) (not e!93574))))

(assert (=> b!143622 (= res!68335 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143623 () Bool)

(assert (=> b!143623 (= e!93572 call!15905)))

(declare-fun d!45883 () Bool)

(declare-fun res!68333 () Bool)

(assert (=> d!45883 (=> res!68333 e!93573)))

(assert (=> d!45883 (= res!68333 (bvsge #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(assert (=> d!45883 (= (arrayNoDuplicates!0 (_keys!4724 newMap!16) #b00000000000000000000000000000000 Nil!1742) e!93573)))

(declare-fun b!143621 () Bool)

(assert (=> b!143621 (= e!93574 (contains!917 Nil!1742 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!45883 (not res!68333)) b!143622))

(assert (= (and b!143622 res!68335) b!143621))

(assert (= (and b!143622 res!68334) b!143619))

(assert (= (and b!143619 c!27236) b!143623))

(assert (= (and b!143619 (not c!27236)) b!143620))

(assert (= (or b!143623 b!143620) bm!15902))

(assert (=> bm!15902 m!172789))

(declare-fun m!172977 () Bool)

(assert (=> bm!15902 m!172977))

(assert (=> b!143619 m!172789))

(assert (=> b!143619 m!172789))

(assert (=> b!143619 m!172791))

(assert (=> b!143622 m!172789))

(assert (=> b!143622 m!172789))

(assert (=> b!143622 m!172791))

(assert (=> b!143621 m!172789))

(assert (=> b!143621 m!172789))

(declare-fun m!172979 () Bool)

(assert (=> b!143621 m!172979))

(assert (=> b!143371 d!45883))

(declare-fun bm!15903 () Bool)

(declare-fun call!15907 () Bool)

(declare-fun lt!75137 () ListLongMap!1717)

(assert (=> bm!15903 (= call!15907 (contains!915 lt!75137 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143624 () Bool)

(declare-fun e!93586 () ListLongMap!1717)

(declare-fun call!15909 () ListLongMap!1717)

(assert (=> b!143624 (= e!93586 call!15909)))

(declare-fun b!143625 () Bool)

(declare-fun e!93582 () Bool)

(assert (=> b!143625 (= e!93582 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143626 () Bool)

(declare-fun e!93584 () Bool)

(declare-fun e!93580 () Bool)

(assert (=> b!143626 (= e!93584 e!93580)))

(declare-fun c!27238 () Bool)

(assert (=> b!143626 (= c!27238 (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143628 () Bool)

(declare-fun e!93576 () Bool)

(assert (=> b!143628 (= e!93576 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143629 () Bool)

(declare-fun e!93581 () Bool)

(assert (=> b!143629 (= e!93581 (= (apply!121 lt!75137 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)) (get!1531 (select (arr!2309 (_values!2945 newMap!16)) #b00000000000000000000000000000000) (dynLambda!437 (defaultEntry!2962 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2583 (_values!2945 newMap!16))))))

(assert (=> b!143629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143630 () Bool)

(assert (=> b!143630 (= e!93580 (not call!15907))))

(declare-fun bm!15904 () Bool)

(declare-fun call!15910 () ListLongMap!1717)

(declare-fun call!15912 () ListLongMap!1717)

(assert (=> bm!15904 (= call!15910 call!15912)))

(declare-fun b!143631 () Bool)

(declare-fun e!93579 () Bool)

(assert (=> b!143631 (= e!93579 (= (apply!121 lt!75137 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2810 newMap!16)))))

(declare-fun b!143632 () Bool)

(declare-fun e!93585 () ListLongMap!1717)

(declare-fun e!93575 () ListLongMap!1717)

(assert (=> b!143632 (= e!93585 e!93575)))

(declare-fun c!27240 () Bool)

(assert (=> b!143632 (= c!27240 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143633 () Bool)

(assert (=> b!143633 (= e!93580 e!93579)))

(declare-fun res!68338 () Bool)

(assert (=> b!143633 (= res!68338 call!15907)))

(assert (=> b!143633 (=> (not res!68338) (not e!93579))))

(declare-fun bm!15905 () Bool)

(declare-fun call!15911 () Bool)

(assert (=> bm!15905 (= call!15911 (contains!915 lt!75137 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15906 () Bool)

(assert (=> bm!15906 (= call!15912 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun bm!15907 () Bool)

(declare-fun call!15908 () ListLongMap!1717)

(declare-fun c!27242 () Bool)

(declare-fun call!15906 () ListLongMap!1717)

(assert (=> bm!15907 (= call!15906 (+!168 (ite c!27242 call!15912 (ite c!27240 call!15910 call!15908)) (ite (or c!27242 c!27240) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 newMap!16)) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 newMap!16)))))))

(declare-fun b!143634 () Bool)

(declare-fun e!93577 () Unit!4536)

(declare-fun Unit!4550 () Unit!4536)

(assert (=> b!143634 (= e!93577 Unit!4550)))

(declare-fun bm!15908 () Bool)

(assert (=> bm!15908 (= call!15909 call!15906)))

(declare-fun b!143635 () Bool)

(declare-fun c!27237 () Bool)

(assert (=> b!143635 (= c!27237 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143635 (= e!93575 e!93586)))

(declare-fun b!143627 () Bool)

(declare-fun e!93583 () Bool)

(declare-fun e!93578 () Bool)

(assert (=> b!143627 (= e!93583 e!93578)))

(declare-fun res!68337 () Bool)

(assert (=> b!143627 (= res!68337 call!15911)))

(assert (=> b!143627 (=> (not res!68337) (not e!93578))))

(declare-fun d!45885 () Bool)

(assert (=> d!45885 e!93584))

(declare-fun res!68343 () Bool)

(assert (=> d!45885 (=> (not res!68343) (not e!93584))))

(assert (=> d!45885 (= res!68343 (or (bvsge #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))))

(declare-fun lt!75123 () ListLongMap!1717)

(assert (=> d!45885 (= lt!75137 lt!75123)))

(declare-fun lt!75141 () Unit!4536)

(assert (=> d!45885 (= lt!75141 e!93577)))

(declare-fun c!27239 () Bool)

(assert (=> d!45885 (= c!27239 e!93582)))

(declare-fun res!68339 () Bool)

(assert (=> d!45885 (=> (not res!68339) (not e!93582))))

(assert (=> d!45885 (= res!68339 (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(assert (=> d!45885 (= lt!75123 e!93585)))

(assert (=> d!45885 (= c!27242 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45885 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45885 (= (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) lt!75137)))

(declare-fun b!143636 () Bool)

(assert (=> b!143636 (= e!93586 call!15908)))

(declare-fun b!143637 () Bool)

(declare-fun res!68340 () Bool)

(assert (=> b!143637 (=> (not res!68340) (not e!93584))))

(declare-fun e!93587 () Bool)

(assert (=> b!143637 (= res!68340 e!93587)))

(declare-fun res!68342 () Bool)

(assert (=> b!143637 (=> res!68342 e!93587)))

(assert (=> b!143637 (= res!68342 (not e!93576))))

(declare-fun res!68336 () Bool)

(assert (=> b!143637 (=> (not res!68336) (not e!93576))))

(assert (=> b!143637 (= res!68336 (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143638 () Bool)

(assert (=> b!143638 (= e!93585 (+!168 call!15906 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 newMap!16))))))

(declare-fun b!143639 () Bool)

(declare-fun lt!75124 () Unit!4536)

(assert (=> b!143639 (= e!93577 lt!75124)))

(declare-fun lt!75136 () ListLongMap!1717)

(assert (=> b!143639 (= lt!75136 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75129 () (_ BitVec 64))

(assert (=> b!143639 (= lt!75129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75126 () (_ BitVec 64))

(assert (=> b!143639 (= lt!75126 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75128 () Unit!4536)

(assert (=> b!143639 (= lt!75128 (addStillContains!97 lt!75136 lt!75129 (zeroValue!2810 newMap!16) lt!75126))))

(assert (=> b!143639 (contains!915 (+!168 lt!75136 (tuple2!2669 lt!75129 (zeroValue!2810 newMap!16))) lt!75126)))

(declare-fun lt!75133 () Unit!4536)

(assert (=> b!143639 (= lt!75133 lt!75128)))

(declare-fun lt!75125 () ListLongMap!1717)

(assert (=> b!143639 (= lt!75125 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75121 () (_ BitVec 64))

(assert (=> b!143639 (= lt!75121 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75122 () (_ BitVec 64))

(assert (=> b!143639 (= lt!75122 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75134 () Unit!4536)

(assert (=> b!143639 (= lt!75134 (addApplyDifferent!97 lt!75125 lt!75121 (minValue!2810 newMap!16) lt!75122))))

(assert (=> b!143639 (= (apply!121 (+!168 lt!75125 (tuple2!2669 lt!75121 (minValue!2810 newMap!16))) lt!75122) (apply!121 lt!75125 lt!75122))))

(declare-fun lt!75127 () Unit!4536)

(assert (=> b!143639 (= lt!75127 lt!75134)))

(declare-fun lt!75139 () ListLongMap!1717)

(assert (=> b!143639 (= lt!75139 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75132 () (_ BitVec 64))

(assert (=> b!143639 (= lt!75132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75138 () (_ BitVec 64))

(assert (=> b!143639 (= lt!75138 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75131 () Unit!4536)

(assert (=> b!143639 (= lt!75131 (addApplyDifferent!97 lt!75139 lt!75132 (zeroValue!2810 newMap!16) lt!75138))))

(assert (=> b!143639 (= (apply!121 (+!168 lt!75139 (tuple2!2669 lt!75132 (zeroValue!2810 newMap!16))) lt!75138) (apply!121 lt!75139 lt!75138))))

(declare-fun lt!75130 () Unit!4536)

(assert (=> b!143639 (= lt!75130 lt!75131)))

(declare-fun lt!75135 () ListLongMap!1717)

(assert (=> b!143639 (= lt!75135 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75120 () (_ BitVec 64))

(assert (=> b!143639 (= lt!75120 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75140 () (_ BitVec 64))

(assert (=> b!143639 (= lt!75140 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143639 (= lt!75124 (addApplyDifferent!97 lt!75135 lt!75120 (minValue!2810 newMap!16) lt!75140))))

(assert (=> b!143639 (= (apply!121 (+!168 lt!75135 (tuple2!2669 lt!75120 (minValue!2810 newMap!16))) lt!75140) (apply!121 lt!75135 lt!75140))))

(declare-fun b!143640 () Bool)

(assert (=> b!143640 (= e!93575 call!15909)))

(declare-fun b!143641 () Bool)

(declare-fun res!68344 () Bool)

(assert (=> b!143641 (=> (not res!68344) (not e!93584))))

(assert (=> b!143641 (= res!68344 e!93583)))

(declare-fun c!27241 () Bool)

(assert (=> b!143641 (= c!27241 (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!143642 () Bool)

(assert (=> b!143642 (= e!93583 (not call!15911))))

(declare-fun b!143643 () Bool)

(assert (=> b!143643 (= e!93587 e!93581)))

(declare-fun res!68341 () Bool)

(assert (=> b!143643 (=> (not res!68341) (not e!93581))))

(assert (=> b!143643 (= res!68341 (contains!915 lt!75137 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143643 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143644 () Bool)

(assert (=> b!143644 (= e!93578 (= (apply!121 lt!75137 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2810 newMap!16)))))

(declare-fun bm!15909 () Bool)

(assert (=> bm!15909 (= call!15908 call!15910)))

(assert (= (and d!45885 c!27242) b!143638))

(assert (= (and d!45885 (not c!27242)) b!143632))

(assert (= (and b!143632 c!27240) b!143640))

(assert (= (and b!143632 (not c!27240)) b!143635))

(assert (= (and b!143635 c!27237) b!143624))

(assert (= (and b!143635 (not c!27237)) b!143636))

(assert (= (or b!143624 b!143636) bm!15909))

(assert (= (or b!143640 bm!15909) bm!15904))

(assert (= (or b!143640 b!143624) bm!15908))

(assert (= (or b!143638 bm!15904) bm!15906))

(assert (= (or b!143638 bm!15908) bm!15907))

(assert (= (and d!45885 res!68339) b!143625))

(assert (= (and d!45885 c!27239) b!143639))

(assert (= (and d!45885 (not c!27239)) b!143634))

(assert (= (and d!45885 res!68343) b!143637))

(assert (= (and b!143637 res!68336) b!143628))

(assert (= (and b!143637 (not res!68342)) b!143643))

(assert (= (and b!143643 res!68341) b!143629))

(assert (= (and b!143637 res!68340) b!143641))

(assert (= (and b!143641 c!27241) b!143627))

(assert (= (and b!143641 (not c!27241)) b!143642))

(assert (= (and b!143627 res!68337) b!143644))

(assert (= (or b!143627 b!143642) bm!15905))

(assert (= (and b!143641 res!68344) b!143626))

(assert (= (and b!143626 c!27238) b!143633))

(assert (= (and b!143626 (not c!27238)) b!143630))

(assert (= (and b!143633 res!68338) b!143631))

(assert (= (or b!143633 b!143630) bm!15903))

(declare-fun b_lambda!6431 () Bool)

(assert (=> (not b_lambda!6431) (not b!143629)))

(assert (=> b!143629 t!6358))

(declare-fun b_and!8933 () Bool)

(assert (= b_and!8929 (and (=> t!6358 result!4219) b_and!8933)))

(assert (=> b!143629 t!6360))

(declare-fun b_and!8935 () Bool)

(assert (= b_and!8931 (and (=> t!6360 result!4221) b_and!8935)))

(declare-fun m!172981 () Bool)

(assert (=> b!143638 m!172981))

(assert (=> b!143625 m!172789))

(assert (=> b!143625 m!172789))

(assert (=> b!143625 m!172791))

(assert (=> b!143643 m!172789))

(assert (=> b!143643 m!172789))

(declare-fun m!172983 () Bool)

(assert (=> b!143643 m!172983))

(declare-fun m!172985 () Bool)

(assert (=> b!143629 m!172985))

(assert (=> b!143629 m!172797))

(declare-fun m!172987 () Bool)

(assert (=> b!143629 m!172987))

(assert (=> b!143629 m!172789))

(assert (=> b!143629 m!172985))

(assert (=> b!143629 m!172797))

(assert (=> b!143629 m!172789))

(declare-fun m!172989 () Bool)

(assert (=> b!143629 m!172989))

(declare-fun m!172991 () Bool)

(assert (=> bm!15907 m!172991))

(declare-fun m!172993 () Bool)

(assert (=> bm!15903 m!172993))

(assert (=> b!143628 m!172789))

(assert (=> b!143628 m!172789))

(assert (=> b!143628 m!172791))

(declare-fun m!172995 () Bool)

(assert (=> b!143639 m!172995))

(declare-fun m!172997 () Bool)

(assert (=> b!143639 m!172997))

(assert (=> b!143639 m!172995))

(declare-fun m!172999 () Bool)

(assert (=> b!143639 m!172999))

(declare-fun m!173001 () Bool)

(assert (=> b!143639 m!173001))

(declare-fun m!173003 () Bool)

(assert (=> b!143639 m!173003))

(declare-fun m!173005 () Bool)

(assert (=> b!143639 m!173005))

(declare-fun m!173007 () Bool)

(assert (=> b!143639 m!173007))

(declare-fun m!173009 () Bool)

(assert (=> b!143639 m!173009))

(declare-fun m!173011 () Bool)

(assert (=> b!143639 m!173011))

(assert (=> b!143639 m!173009))

(declare-fun m!173013 () Bool)

(assert (=> b!143639 m!173013))

(assert (=> b!143639 m!172789))

(assert (=> b!143639 m!173013))

(declare-fun m!173015 () Bool)

(assert (=> b!143639 m!173015))

(declare-fun m!173017 () Bool)

(assert (=> b!143639 m!173017))

(declare-fun m!173019 () Bool)

(assert (=> b!143639 m!173019))

(declare-fun m!173021 () Bool)

(assert (=> b!143639 m!173021))

(declare-fun m!173023 () Bool)

(assert (=> b!143639 m!173023))

(assert (=> b!143639 m!173021))

(declare-fun m!173025 () Bool)

(assert (=> b!143639 m!173025))

(declare-fun m!173027 () Bool)

(assert (=> b!143644 m!173027))

(declare-fun m!173029 () Bool)

(assert (=> b!143631 m!173029))

(assert (=> bm!15906 m!173005))

(assert (=> d!45885 m!172741))

(declare-fun m!173031 () Bool)

(assert (=> bm!15905 m!173031))

(assert (=> b!143348 d!45885))

(assert (=> d!45803 d!45801))

(declare-fun d!45887 () Bool)

(assert (=> d!45887 (arrayNoDuplicates!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) from!355 Nil!1742)))

(assert (=> d!45887 true))

(declare-fun _$71!168 () Unit!4536)

(assert (=> d!45887 (= (choose!39 (_keys!4724 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!168)))

(declare-fun bs!6063 () Bool)

(assert (= bs!6063 d!45887))

(assert (=> bs!6063 m!172461))

(assert (=> d!45803 d!45887))

(declare-fun b!143661 () Bool)

(declare-fun e!93597 () Bool)

(declare-fun e!93596 () Bool)

(assert (=> b!143661 (= e!93597 e!93596)))

(declare-fun c!27248 () Bool)

(declare-fun lt!75146 () SeekEntryResult!283)

(assert (=> b!143661 (= c!27248 ((_ is MissingVacant!283) lt!75146))))

(declare-fun d!45889 () Bool)

(assert (=> d!45889 e!93597))

(declare-fun c!27247 () Bool)

(assert (=> d!45889 (= c!27247 ((_ is MissingZero!283) lt!75146))))

(assert (=> d!45889 (= lt!75146 (seekEntryOrOpen!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (_keys!4724 newMap!16) (mask!7313 newMap!16)))))

(declare-fun lt!75147 () Unit!4536)

(declare-fun choose!881 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) Int) Unit!4536)

(assert (=> d!45889 (= lt!75147 (choose!881 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45889 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45889 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)) lt!75147)))

(declare-fun b!143662 () Bool)

(declare-fun e!93599 () Bool)

(declare-fun call!15917 () Bool)

(assert (=> b!143662 (= e!93599 (not call!15917))))

(declare-fun b!143663 () Bool)

(assert (=> b!143663 (and (bvsge (index!3296 lt!75146) #b00000000000000000000000000000000) (bvslt (index!3296 lt!75146) (size!2582 (_keys!4724 newMap!16))))))

(declare-fun res!68356 () Bool)

(assert (=> b!143663 (= res!68356 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3296 lt!75146)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93598 () Bool)

(assert (=> b!143663 (=> (not res!68356) (not e!93598))))

(declare-fun b!143664 () Bool)

(declare-fun res!68355 () Bool)

(assert (=> b!143664 (=> (not res!68355) (not e!93599))))

(declare-fun call!15918 () Bool)

(assert (=> b!143664 (= res!68355 call!15918)))

(assert (=> b!143664 (= e!93596 e!93599)))

(declare-fun b!143665 () Bool)

(declare-fun res!68353 () Bool)

(assert (=> b!143665 (=> (not res!68353) (not e!93599))))

(assert (=> b!143665 (= res!68353 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3299 lt!75146)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143665 (and (bvsge (index!3299 lt!75146) #b00000000000000000000000000000000) (bvslt (index!3299 lt!75146) (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143666 () Bool)

(assert (=> b!143666 (= e!93598 (not call!15917))))

(declare-fun b!143667 () Bool)

(assert (=> b!143667 (= e!93596 ((_ is Undefined!283) lt!75146))))

(declare-fun b!143668 () Bool)

(assert (=> b!143668 (= e!93597 e!93598)))

(declare-fun res!68354 () Bool)

(assert (=> b!143668 (= res!68354 call!15918)))

(assert (=> b!143668 (=> (not res!68354) (not e!93598))))

(declare-fun bm!15914 () Bool)

(assert (=> bm!15914 (= call!15917 (arrayContainsKey!0 (_keys!4724 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!15915 () Bool)

(assert (=> bm!15915 (= call!15918 (inRange!0 (ite c!27247 (index!3296 lt!75146) (index!3299 lt!75146)) (mask!7313 newMap!16)))))

(assert (= (and d!45889 c!27247) b!143668))

(assert (= (and d!45889 (not c!27247)) b!143661))

(assert (= (and b!143668 res!68354) b!143663))

(assert (= (and b!143663 res!68356) b!143666))

(assert (= (and b!143661 c!27248) b!143664))

(assert (= (and b!143661 (not c!27248)) b!143667))

(assert (= (and b!143664 res!68355) b!143665))

(assert (= (and b!143665 res!68353) b!143662))

(assert (= (or b!143668 b!143664) bm!15915))

(assert (= (or b!143666 b!143662) bm!15914))

(assert (=> d!45889 m!172463))

(assert (=> d!45889 m!172629))

(assert (=> d!45889 m!172463))

(declare-fun m!173033 () Bool)

(assert (=> d!45889 m!173033))

(assert (=> d!45889 m!172741))

(declare-fun m!173035 () Bool)

(assert (=> b!143665 m!173035))

(declare-fun m!173037 () Bool)

(assert (=> b!143663 m!173037))

(declare-fun m!173039 () Bool)

(assert (=> bm!15915 m!173039))

(assert (=> bm!15914 m!172463))

(assert (=> bm!15914 m!172597))

(assert (=> bm!15846 d!45889))

(declare-fun d!45891 () Bool)

(declare-fun e!93600 () Bool)

(assert (=> d!45891 e!93600))

(declare-fun res!68358 () Bool)

(assert (=> d!45891 (=> (not res!68358) (not e!93600))))

(declare-fun lt!75150 () ListLongMap!1717)

(assert (=> d!45891 (= res!68358 (contains!915 lt!75150 (_1!1345 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!75151 () List!1744)

(assert (=> d!45891 (= lt!75150 (ListLongMap!1718 lt!75151))))

(declare-fun lt!75148 () Unit!4536)

(declare-fun lt!75149 () Unit!4536)

(assert (=> d!45891 (= lt!75148 lt!75149)))

(assert (=> d!45891 (= (getValueByKey!175 lt!75151 (_1!1345 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!180 (_2!1345 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45891 (= lt!75149 (lemmaContainsTupThenGetReturnValue!92 lt!75151 (_1!1345 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1345 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45891 (= lt!75151 (insertStrictlySorted!95 (toList!874 call!15863) (_1!1345 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1345 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45891 (= (+!168 call!15863 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!75150)))

(declare-fun b!143669 () Bool)

(declare-fun res!68357 () Bool)

(assert (=> b!143669 (=> (not res!68357) (not e!93600))))

(assert (=> b!143669 (= res!68357 (= (getValueByKey!175 (toList!874 lt!75150) (_1!1345 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!180 (_2!1345 (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!143670 () Bool)

(assert (=> b!143670 (= e!93600 (contains!918 (toList!874 lt!75150) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!45891 res!68358) b!143669))

(assert (= (and b!143669 res!68357) b!143670))

(declare-fun m!173041 () Bool)

(assert (=> d!45891 m!173041))

(declare-fun m!173043 () Bool)

(assert (=> d!45891 m!173043))

(declare-fun m!173045 () Bool)

(assert (=> d!45891 m!173045))

(declare-fun m!173047 () Bool)

(assert (=> d!45891 m!173047))

(declare-fun m!173049 () Bool)

(assert (=> b!143669 m!173049))

(declare-fun m!173051 () Bool)

(assert (=> b!143670 m!173051))

(assert (=> b!143342 d!45891))

(declare-fun d!45893 () Bool)

(declare-fun res!68359 () Bool)

(declare-fun e!93601 () Bool)

(assert (=> d!45893 (=> (not res!68359) (not e!93601))))

(assert (=> d!45893 (= res!68359 (simpleValid!97 (_2!1346 lt!74917)))))

(assert (=> d!45893 (= (valid!564 (_2!1346 lt!74917)) e!93601)))

(declare-fun b!143671 () Bool)

(declare-fun res!68360 () Bool)

(assert (=> b!143671 (=> (not res!68360) (not e!93601))))

(assert (=> b!143671 (= res!68360 (= (arrayCountValidKeys!0 (_keys!4724 (_2!1346 lt!74917)) #b00000000000000000000000000000000 (size!2582 (_keys!4724 (_2!1346 lt!74917)))) (_size!627 (_2!1346 lt!74917))))))

(declare-fun b!143672 () Bool)

(declare-fun res!68361 () Bool)

(assert (=> b!143672 (=> (not res!68361) (not e!93601))))

(assert (=> b!143672 (= res!68361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4724 (_2!1346 lt!74917)) (mask!7313 (_2!1346 lt!74917))))))

(declare-fun b!143673 () Bool)

(assert (=> b!143673 (= e!93601 (arrayNoDuplicates!0 (_keys!4724 (_2!1346 lt!74917)) #b00000000000000000000000000000000 Nil!1742))))

(assert (= (and d!45893 res!68359) b!143671))

(assert (= (and b!143671 res!68360) b!143672))

(assert (= (and b!143672 res!68361) b!143673))

(declare-fun m!173053 () Bool)

(assert (=> d!45893 m!173053))

(declare-fun m!173055 () Bool)

(assert (=> b!143671 m!173055))

(declare-fun m!173057 () Bool)

(assert (=> b!143672 m!173057))

(declare-fun m!173059 () Bool)

(assert (=> b!143673 m!173059))

(assert (=> d!45789 d!45893))

(assert (=> d!45789 d!45795))

(declare-fun bm!15916 () Bool)

(declare-fun call!15920 () Bool)

(declare-fun lt!75169 () ListLongMap!1717)

(assert (=> bm!15916 (= call!15920 (contains!915 lt!75169 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143674 () Bool)

(declare-fun e!93613 () ListLongMap!1717)

(declare-fun call!15922 () ListLongMap!1717)

(assert (=> b!143674 (= e!93613 call!15922)))

(declare-fun b!143675 () Bool)

(declare-fun e!93609 () Bool)

(assert (=> b!143675 (= e!93609 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143676 () Bool)

(declare-fun e!93611 () Bool)

(declare-fun e!93607 () Bool)

(assert (=> b!143676 (= e!93611 e!93607)))

(declare-fun c!27250 () Bool)

(assert (=> b!143676 (= c!27250 (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143678 () Bool)

(declare-fun e!93603 () Bool)

(assert (=> b!143678 (= e!93603 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143679 () Bool)

(declare-fun e!93608 () Bool)

(assert (=> b!143679 (= e!93608 (= (apply!121 lt!75169 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)) (get!1531 (select (arr!2309 (ite c!27154 (_values!2945 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!437 (defaultEntry!2962 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143679 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2583 (ite c!27154 (_values!2945 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16)))))))))

(assert (=> b!143679 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143680 () Bool)

(assert (=> b!143680 (= e!93607 (not call!15920))))

(declare-fun bm!15917 () Bool)

(declare-fun call!15923 () ListLongMap!1717)

(declare-fun call!15925 () ListLongMap!1717)

(assert (=> bm!15917 (= call!15923 call!15925)))

(declare-fun b!143681 () Bool)

(declare-fun e!93606 () Bool)

(assert (=> b!143681 (= e!93606 (= (apply!121 lt!75169 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2810 newMap!16)))))

(declare-fun b!143682 () Bool)

(declare-fun e!93612 () ListLongMap!1717)

(declare-fun e!93602 () ListLongMap!1717)

(assert (=> b!143682 (= e!93612 e!93602)))

(declare-fun c!27252 () Bool)

(assert (=> b!143682 (= c!27252 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143683 () Bool)

(assert (=> b!143683 (= e!93607 e!93606)))

(declare-fun res!68364 () Bool)

(assert (=> b!143683 (= res!68364 call!15920)))

(assert (=> b!143683 (=> (not res!68364) (not e!93606))))

(declare-fun bm!15918 () Bool)

(declare-fun call!15924 () Bool)

(assert (=> bm!15918 (= call!15924 (contains!915 lt!75169 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15919 () Bool)

(assert (=> bm!15919 (= call!15925 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite c!27154 (_values!2945 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16)))) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun bm!15920 () Bool)

(declare-fun call!15921 () ListLongMap!1717)

(declare-fun c!27254 () Bool)

(declare-fun call!15919 () ListLongMap!1717)

(assert (=> bm!15920 (= call!15919 (+!168 (ite c!27254 call!15925 (ite c!27252 call!15923 call!15921)) (ite (or c!27254 c!27252) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 newMap!16)) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 newMap!16)))))))

(declare-fun b!143684 () Bool)

(declare-fun e!93604 () Unit!4536)

(declare-fun Unit!4551 () Unit!4536)

(assert (=> b!143684 (= e!93604 Unit!4551)))

(declare-fun bm!15921 () Bool)

(assert (=> bm!15921 (= call!15922 call!15919)))

(declare-fun b!143685 () Bool)

(declare-fun c!27249 () Bool)

(assert (=> b!143685 (= c!27249 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143685 (= e!93602 e!93613)))

(declare-fun b!143677 () Bool)

(declare-fun e!93610 () Bool)

(declare-fun e!93605 () Bool)

(assert (=> b!143677 (= e!93610 e!93605)))

(declare-fun res!68363 () Bool)

(assert (=> b!143677 (= res!68363 call!15924)))

(assert (=> b!143677 (=> (not res!68363) (not e!93605))))

(declare-fun d!45895 () Bool)

(assert (=> d!45895 e!93611))

(declare-fun res!68369 () Bool)

(assert (=> d!45895 (=> (not res!68369) (not e!93611))))

(assert (=> d!45895 (= res!68369 (or (bvsge #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))))

(declare-fun lt!75155 () ListLongMap!1717)

(assert (=> d!45895 (= lt!75169 lt!75155)))

(declare-fun lt!75173 () Unit!4536)

(assert (=> d!45895 (= lt!75173 e!93604)))

(declare-fun c!27251 () Bool)

(assert (=> d!45895 (= c!27251 e!93609)))

(declare-fun res!68365 () Bool)

(assert (=> d!45895 (=> (not res!68365) (not e!93609))))

(assert (=> d!45895 (= res!68365 (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(assert (=> d!45895 (= lt!75155 e!93612)))

(assert (=> d!45895 (= c!27254 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45895 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45895 (= (getCurrentListMap!535 (_keys!4724 newMap!16) (ite c!27154 (_values!2945 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16)))) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) lt!75169)))

(declare-fun b!143686 () Bool)

(assert (=> b!143686 (= e!93613 call!15921)))

(declare-fun b!143687 () Bool)

(declare-fun res!68366 () Bool)

(assert (=> b!143687 (=> (not res!68366) (not e!93611))))

(declare-fun e!93614 () Bool)

(assert (=> b!143687 (= res!68366 e!93614)))

(declare-fun res!68368 () Bool)

(assert (=> b!143687 (=> res!68368 e!93614)))

(assert (=> b!143687 (= res!68368 (not e!93603))))

(declare-fun res!68362 () Bool)

(assert (=> b!143687 (=> (not res!68362) (not e!93603))))

(assert (=> b!143687 (= res!68362 (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143688 () Bool)

(assert (=> b!143688 (= e!93612 (+!168 call!15919 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 newMap!16))))))

(declare-fun b!143689 () Bool)

(declare-fun lt!75156 () Unit!4536)

(assert (=> b!143689 (= e!93604 lt!75156)))

(declare-fun lt!75168 () ListLongMap!1717)

(assert (=> b!143689 (= lt!75168 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite c!27154 (_values!2945 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16)))) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75161 () (_ BitVec 64))

(assert (=> b!143689 (= lt!75161 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75158 () (_ BitVec 64))

(assert (=> b!143689 (= lt!75158 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75160 () Unit!4536)

(assert (=> b!143689 (= lt!75160 (addStillContains!97 lt!75168 lt!75161 (zeroValue!2810 newMap!16) lt!75158))))

(assert (=> b!143689 (contains!915 (+!168 lt!75168 (tuple2!2669 lt!75161 (zeroValue!2810 newMap!16))) lt!75158)))

(declare-fun lt!75165 () Unit!4536)

(assert (=> b!143689 (= lt!75165 lt!75160)))

(declare-fun lt!75157 () ListLongMap!1717)

(assert (=> b!143689 (= lt!75157 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite c!27154 (_values!2945 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16)))) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75153 () (_ BitVec 64))

(assert (=> b!143689 (= lt!75153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75154 () (_ BitVec 64))

(assert (=> b!143689 (= lt!75154 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75166 () Unit!4536)

(assert (=> b!143689 (= lt!75166 (addApplyDifferent!97 lt!75157 lt!75153 (minValue!2810 newMap!16) lt!75154))))

(assert (=> b!143689 (= (apply!121 (+!168 lt!75157 (tuple2!2669 lt!75153 (minValue!2810 newMap!16))) lt!75154) (apply!121 lt!75157 lt!75154))))

(declare-fun lt!75159 () Unit!4536)

(assert (=> b!143689 (= lt!75159 lt!75166)))

(declare-fun lt!75171 () ListLongMap!1717)

(assert (=> b!143689 (= lt!75171 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite c!27154 (_values!2945 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16)))) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75164 () (_ BitVec 64))

(assert (=> b!143689 (= lt!75164 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75170 () (_ BitVec 64))

(assert (=> b!143689 (= lt!75170 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75163 () Unit!4536)

(assert (=> b!143689 (= lt!75163 (addApplyDifferent!97 lt!75171 lt!75164 (zeroValue!2810 newMap!16) lt!75170))))

(assert (=> b!143689 (= (apply!121 (+!168 lt!75171 (tuple2!2669 lt!75164 (zeroValue!2810 newMap!16))) lt!75170) (apply!121 lt!75171 lt!75170))))

(declare-fun lt!75162 () Unit!4536)

(assert (=> b!143689 (= lt!75162 lt!75163)))

(declare-fun lt!75167 () ListLongMap!1717)

(assert (=> b!143689 (= lt!75167 (getCurrentListMapNoExtraKeys!133 (_keys!4724 newMap!16) (ite c!27154 (_values!2945 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16)))) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75152 () (_ BitVec 64))

(assert (=> b!143689 (= lt!75152 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75172 () (_ BitVec 64))

(assert (=> b!143689 (= lt!75172 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143689 (= lt!75156 (addApplyDifferent!97 lt!75167 lt!75152 (minValue!2810 newMap!16) lt!75172))))

(assert (=> b!143689 (= (apply!121 (+!168 lt!75167 (tuple2!2669 lt!75152 (minValue!2810 newMap!16))) lt!75172) (apply!121 lt!75167 lt!75172))))

(declare-fun b!143690 () Bool)

(assert (=> b!143690 (= e!93602 call!15922)))

(declare-fun b!143691 () Bool)

(declare-fun res!68370 () Bool)

(assert (=> b!143691 (=> (not res!68370) (not e!93611))))

(assert (=> b!143691 (= res!68370 e!93610)))

(declare-fun c!27253 () Bool)

(assert (=> b!143691 (= c!27253 (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!143692 () Bool)

(assert (=> b!143692 (= e!93610 (not call!15924))))

(declare-fun b!143693 () Bool)

(assert (=> b!143693 (= e!93614 e!93608)))

(declare-fun res!68367 () Bool)

(assert (=> b!143693 (=> (not res!68367) (not e!93608))))

(assert (=> b!143693 (= res!68367 (contains!915 lt!75169 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143694 () Bool)

(assert (=> b!143694 (= e!93605 (= (apply!121 lt!75169 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2810 newMap!16)))))

(declare-fun bm!15922 () Bool)

(assert (=> bm!15922 (= call!15921 call!15923)))

(assert (= (and d!45895 c!27254) b!143688))

(assert (= (and d!45895 (not c!27254)) b!143682))

(assert (= (and b!143682 c!27252) b!143690))

(assert (= (and b!143682 (not c!27252)) b!143685))

(assert (= (and b!143685 c!27249) b!143674))

(assert (= (and b!143685 (not c!27249)) b!143686))

(assert (= (or b!143674 b!143686) bm!15922))

(assert (= (or b!143690 bm!15922) bm!15917))

(assert (= (or b!143690 b!143674) bm!15921))

(assert (= (or b!143688 bm!15917) bm!15919))

(assert (= (or b!143688 bm!15921) bm!15920))

(assert (= (and d!45895 res!68365) b!143675))

(assert (= (and d!45895 c!27251) b!143689))

(assert (= (and d!45895 (not c!27251)) b!143684))

(assert (= (and d!45895 res!68369) b!143687))

(assert (= (and b!143687 res!68362) b!143678))

(assert (= (and b!143687 (not res!68368)) b!143693))

(assert (= (and b!143693 res!68367) b!143679))

(assert (= (and b!143687 res!68366) b!143691))

(assert (= (and b!143691 c!27253) b!143677))

(assert (= (and b!143691 (not c!27253)) b!143692))

(assert (= (and b!143677 res!68363) b!143694))

(assert (= (or b!143677 b!143692) bm!15918))

(assert (= (and b!143691 res!68370) b!143676))

(assert (= (and b!143676 c!27250) b!143683))

(assert (= (and b!143676 (not c!27250)) b!143680))

(assert (= (and b!143683 res!68364) b!143681))

(assert (= (or b!143683 b!143680) bm!15916))

(declare-fun b_lambda!6433 () Bool)

(assert (=> (not b_lambda!6433) (not b!143679)))

(assert (=> b!143679 t!6358))

(declare-fun b_and!8937 () Bool)

(assert (= b_and!8933 (and (=> t!6358 result!4219) b_and!8937)))

(assert (=> b!143679 t!6360))

(declare-fun b_and!8939 () Bool)

(assert (= b_and!8935 (and (=> t!6360 result!4221) b_and!8939)))

(declare-fun m!173061 () Bool)

(assert (=> b!143688 m!173061))

(assert (=> b!143675 m!172789))

(assert (=> b!143675 m!172789))

(assert (=> b!143675 m!172791))

(assert (=> b!143693 m!172789))

(assert (=> b!143693 m!172789))

(declare-fun m!173063 () Bool)

(assert (=> b!143693 m!173063))

(declare-fun m!173065 () Bool)

(assert (=> b!143679 m!173065))

(assert (=> b!143679 m!172797))

(declare-fun m!173067 () Bool)

(assert (=> b!143679 m!173067))

(assert (=> b!143679 m!172789))

(assert (=> b!143679 m!173065))

(assert (=> b!143679 m!172797))

(assert (=> b!143679 m!172789))

(declare-fun m!173069 () Bool)

(assert (=> b!143679 m!173069))

(declare-fun m!173071 () Bool)

(assert (=> bm!15920 m!173071))

(declare-fun m!173073 () Bool)

(assert (=> bm!15916 m!173073))

(assert (=> b!143678 m!172789))

(assert (=> b!143678 m!172789))

(assert (=> b!143678 m!172791))

(declare-fun m!173075 () Bool)

(assert (=> b!143689 m!173075))

(declare-fun m!173077 () Bool)

(assert (=> b!143689 m!173077))

(assert (=> b!143689 m!173075))

(declare-fun m!173079 () Bool)

(assert (=> b!143689 m!173079))

(declare-fun m!173081 () Bool)

(assert (=> b!143689 m!173081))

(declare-fun m!173083 () Bool)

(assert (=> b!143689 m!173083))

(declare-fun m!173085 () Bool)

(assert (=> b!143689 m!173085))

(declare-fun m!173087 () Bool)

(assert (=> b!143689 m!173087))

(declare-fun m!173089 () Bool)

(assert (=> b!143689 m!173089))

(declare-fun m!173091 () Bool)

(assert (=> b!143689 m!173091))

(assert (=> b!143689 m!173089))

(declare-fun m!173093 () Bool)

(assert (=> b!143689 m!173093))

(assert (=> b!143689 m!172789))

(assert (=> b!143689 m!173093))

(declare-fun m!173095 () Bool)

(assert (=> b!143689 m!173095))

(declare-fun m!173097 () Bool)

(assert (=> b!143689 m!173097))

(declare-fun m!173099 () Bool)

(assert (=> b!143689 m!173099))

(declare-fun m!173101 () Bool)

(assert (=> b!143689 m!173101))

(declare-fun m!173103 () Bool)

(assert (=> b!143689 m!173103))

(assert (=> b!143689 m!173101))

(declare-fun m!173105 () Bool)

(assert (=> b!143689 m!173105))

(declare-fun m!173107 () Bool)

(assert (=> b!143694 m!173107))

(declare-fun m!173109 () Bool)

(assert (=> b!143681 m!173109))

(assert (=> bm!15919 m!173085))

(assert (=> d!45895 m!172741))

(declare-fun m!173111 () Bool)

(assert (=> bm!15918 m!173111))

(assert (=> bm!15863 d!45895))

(declare-fun d!45897 () Bool)

(declare-fun res!68371 () Bool)

(declare-fun e!93615 () Bool)

(assert (=> d!45897 (=> res!68371 e!93615)))

(assert (=> d!45897 (= res!68371 (= (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> d!45897 (= (arrayContainsKey!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!93615)))

(declare-fun b!143695 () Bool)

(declare-fun e!93616 () Bool)

(assert (=> b!143695 (= e!93615 e!93616)))

(declare-fun res!68372 () Bool)

(assert (=> b!143695 (=> (not res!68372) (not e!93616))))

(assert (=> b!143695 (= res!68372 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(declare-fun b!143696 () Bool)

(assert (=> b!143696 (= e!93616 (arrayContainsKey!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!45897 (not res!68371)) b!143695))

(assert (= (and b!143695 res!68372) b!143696))

(declare-fun m!173113 () Bool)

(assert (=> d!45897 m!173113))

(assert (=> b!143696 m!172463))

(declare-fun m!173115 () Bool)

(assert (=> b!143696 m!173115))

(assert (=> b!143455 d!45897))

(declare-fun d!45899 () Bool)

(declare-fun res!68373 () Bool)

(declare-fun e!93617 () Bool)

(assert (=> d!45899 (=> res!68373 e!93617)))

(assert (=> d!45899 (= res!68373 (= (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> d!45899 (= (arrayContainsKey!0 (_keys!4724 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b00000000000000000000000000000000) e!93617)))

(declare-fun b!143697 () Bool)

(declare-fun e!93618 () Bool)

(assert (=> b!143697 (= e!93617 e!93618)))

(declare-fun res!68374 () Bool)

(assert (=> b!143697 (=> (not res!68374) (not e!93618))))

(assert (=> b!143697 (= res!68374 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2582 (_keys!4724 newMap!16))))))

(declare-fun b!143698 () Bool)

(assert (=> b!143698 (= e!93618 (arrayContainsKey!0 (_keys!4724 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!45899 (not res!68373)) b!143697))

(assert (= (and b!143697 res!68374) b!143698))

(assert (=> d!45899 m!172789))

(assert (=> b!143698 m!172463))

(declare-fun m!173117 () Bool)

(assert (=> b!143698 m!173117))

(assert (=> bm!15844 d!45899))

(declare-fun call!15926 () Bool)

(declare-fun c!27255 () Bool)

(declare-fun bm!15923 () Bool)

(assert (=> bm!15923 (= call!15926 (arrayNoDuplicates!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27255 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!27187 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742) Nil!1742)) (ite c!27187 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742) Nil!1742))))))

(declare-fun b!143699 () Bool)

(declare-fun e!93619 () Bool)

(declare-fun e!93620 () Bool)

(assert (=> b!143699 (= e!93619 e!93620)))

(assert (=> b!143699 (= c!27255 (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!143700 () Bool)

(assert (=> b!143700 (= e!93620 call!15926)))

(declare-fun b!143702 () Bool)

(declare-fun e!93621 () Bool)

(assert (=> b!143702 (= e!93621 e!93619)))

(declare-fun res!68376 () Bool)

(assert (=> b!143702 (=> (not res!68376) (not e!93619))))

(declare-fun e!93622 () Bool)

(assert (=> b!143702 (= res!68376 (not e!93622))))

(declare-fun res!68377 () Bool)

(assert (=> b!143702 (=> (not res!68377) (not e!93622))))

(assert (=> b!143702 (= res!68377 (validKeyInArray!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!143703 () Bool)

(assert (=> b!143703 (= e!93620 call!15926)))

(declare-fun d!45901 () Bool)

(declare-fun res!68375 () Bool)

(assert (=> d!45901 (=> res!68375 e!93621)))

(assert (=> d!45901 (= res!68375 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))))))

(assert (=> d!45901 (= (arrayNoDuplicates!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27187 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742) Nil!1742)) e!93621)))

(declare-fun b!143701 () Bool)

(assert (=> b!143701 (= e!93622 (contains!917 (ite c!27187 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742) Nil!1742) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!45901 (not res!68375)) b!143702))

(assert (= (and b!143702 res!68377) b!143701))

(assert (= (and b!143702 res!68376) b!143699))

(assert (= (and b!143699 c!27255) b!143703))

(assert (= (and b!143699 (not c!27255)) b!143700))

(assert (= (or b!143703 b!143700) bm!15923))

(declare-fun m!173119 () Bool)

(assert (=> bm!15923 m!173119))

(declare-fun m!173121 () Bool)

(assert (=> bm!15923 m!173121))

(assert (=> b!143699 m!173119))

(assert (=> b!143699 m!173119))

(declare-fun m!173123 () Bool)

(assert (=> b!143699 m!173123))

(assert (=> b!143702 m!173119))

(assert (=> b!143702 m!173119))

(assert (=> b!143702 m!173123))

(assert (=> b!143701 m!173119))

(assert (=> b!143701 m!173119))

(declare-fun m!173125 () Bool)

(assert (=> b!143701 m!173125))

(assert (=> bm!15888 d!45901))

(declare-fun d!45903 () Bool)

(declare-fun e!93623 () Bool)

(assert (=> d!45903 e!93623))

(declare-fun res!68378 () Bool)

(assert (=> d!45903 (=> res!68378 e!93623)))

(declare-fun lt!75176 () Bool)

(assert (=> d!45903 (= res!68378 (not lt!75176))))

(declare-fun lt!75175 () Bool)

(assert (=> d!45903 (= lt!75176 lt!75175)))

(declare-fun lt!75177 () Unit!4536)

(declare-fun e!93624 () Unit!4536)

(assert (=> d!45903 (= lt!75177 e!93624)))

(declare-fun c!27256 () Bool)

(assert (=> d!45903 (= c!27256 lt!75175)))

(assert (=> d!45903 (= lt!75175 (containsKey!179 (toList!874 call!15850) (ite c!27160 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!74911)))))))

(assert (=> d!45903 (= (contains!915 call!15850 (ite c!27160 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!74911)))) lt!75176)))

(declare-fun b!143704 () Bool)

(declare-fun lt!75174 () Unit!4536)

(assert (=> b!143704 (= e!93624 lt!75174)))

(assert (=> b!143704 (= lt!75174 (lemmaContainsKeyImpliesGetValueByKeyDefined!128 (toList!874 call!15850) (ite c!27160 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!74911)))))))

(assert (=> b!143704 (isDefined!129 (getValueByKey!175 (toList!874 call!15850) (ite c!27160 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!74911)))))))

(declare-fun b!143705 () Bool)

(declare-fun Unit!4552 () Unit!4536)

(assert (=> b!143705 (= e!93624 Unit!4552)))

(declare-fun b!143706 () Bool)

(assert (=> b!143706 (= e!93623 (isDefined!129 (getValueByKey!175 (toList!874 call!15850) (ite c!27160 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!74911))))))))

(assert (= (and d!45903 c!27256) b!143704))

(assert (= (and d!45903 (not c!27256)) b!143705))

(assert (= (and d!45903 (not res!68378)) b!143706))

(declare-fun m!173127 () Bool)

(assert (=> d!45903 m!173127))

(declare-fun m!173129 () Bool)

(assert (=> b!143704 m!173129))

(declare-fun m!173131 () Bool)

(assert (=> b!143704 m!173131))

(assert (=> b!143704 m!173131))

(declare-fun m!173133 () Bool)

(assert (=> b!143704 m!173133))

(assert (=> b!143706 m!173131))

(assert (=> b!143706 m!173131))

(assert (=> b!143706 m!173133))

(assert (=> bm!15853 d!45903))

(declare-fun d!45905 () Bool)

(declare-fun res!68379 () Bool)

(declare-fun e!93625 () Bool)

(assert (=> d!45905 (=> (not res!68379) (not e!93625))))

(assert (=> d!45905 (= res!68379 (simpleValid!97 (v!3290 (underlying!479 thiss!992))))))

(assert (=> d!45905 (= (valid!564 (v!3290 (underlying!479 thiss!992))) e!93625)))

(declare-fun b!143707 () Bool)

(declare-fun res!68380 () Bool)

(assert (=> b!143707 (=> (not res!68380) (not e!93625))))

(assert (=> b!143707 (= res!68380 (= (arrayCountValidKeys!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000000 (size!2582 (_keys!4724 (v!3290 (underlying!479 thiss!992))))) (_size!627 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun b!143708 () Bool)

(declare-fun res!68381 () Bool)

(assert (=> b!143708 (=> (not res!68381) (not e!93625))))

(assert (=> b!143708 (= res!68381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4724 (v!3290 (underlying!479 thiss!992))) (mask!7313 (v!3290 (underlying!479 thiss!992)))))))

(declare-fun b!143709 () Bool)

(assert (=> b!143709 (= e!93625 (arrayNoDuplicates!0 (_keys!4724 (v!3290 (underlying!479 thiss!992))) #b00000000000000000000000000000000 Nil!1742))))

(assert (= (and d!45905 res!68379) b!143707))

(assert (= (and b!143707 res!68380) b!143708))

(assert (= (and b!143708 res!68381) b!143709))

(declare-fun m!173135 () Bool)

(assert (=> d!45905 m!173135))

(declare-fun m!173137 () Bool)

(assert (=> b!143707 m!173137))

(declare-fun m!173139 () Bool)

(assert (=> b!143708 m!173139))

(declare-fun m!173141 () Bool)

(assert (=> b!143709 m!173141))

(assert (=> d!45793 d!45905))

(declare-fun d!45907 () Bool)

(declare-fun e!93626 () Bool)

(assert (=> d!45907 e!93626))

(declare-fun res!68382 () Bool)

(assert (=> d!45907 (=> res!68382 e!93626)))

(declare-fun lt!75180 () Bool)

(assert (=> d!45907 (= res!68382 (not lt!75180))))

(declare-fun lt!75179 () Bool)

(assert (=> d!45907 (= lt!75180 lt!75179)))

(declare-fun lt!75181 () Unit!4536)

(declare-fun e!93627 () Unit!4536)

(assert (=> d!45907 (= lt!75181 e!93627)))

(declare-fun c!27257 () Bool)

(assert (=> d!45907 (= c!27257 lt!75179)))

(assert (=> d!45907 (= lt!75179 (containsKey!179 (toList!874 lt!74997) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!45907 (= (contains!915 lt!74997 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75180)))

(declare-fun b!143710 () Bool)

(declare-fun lt!75178 () Unit!4536)

(assert (=> b!143710 (= e!93627 lt!75178)))

(assert (=> b!143710 (= lt!75178 (lemmaContainsKeyImpliesGetValueByKeyDefined!128 (toList!874 lt!74997) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143710 (isDefined!129 (getValueByKey!175 (toList!874 lt!74997) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143711 () Bool)

(declare-fun Unit!4553 () Unit!4536)

(assert (=> b!143711 (= e!93627 Unit!4553)))

(declare-fun b!143712 () Bool)

(assert (=> b!143712 (= e!93626 (isDefined!129 (getValueByKey!175 (toList!874 lt!74997) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45907 c!27257) b!143710))

(assert (= (and d!45907 (not c!27257)) b!143711))

(assert (= (and d!45907 (not res!68382)) b!143712))

(declare-fun m!173143 () Bool)

(assert (=> d!45907 m!173143))

(declare-fun m!173145 () Bool)

(assert (=> b!143710 m!173145))

(assert (=> b!143710 m!172845))

(assert (=> b!143710 m!172845))

(declare-fun m!173147 () Bool)

(assert (=> b!143710 m!173147))

(assert (=> b!143712 m!172845))

(assert (=> b!143712 m!172845))

(assert (=> b!143712 m!173147))

(assert (=> bm!15881 d!45907))

(assert (=> d!45797 d!45885))

(declare-fun d!45909 () Bool)

(declare-fun res!68387 () Bool)

(declare-fun e!93632 () Bool)

(assert (=> d!45909 (=> res!68387 e!93632)))

(assert (=> d!45909 (= res!68387 (and ((_ is Cons!1740) (toList!874 lt!74809)) (= (_1!1345 (h!2348 (toList!874 lt!74809))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))))))

(assert (=> d!45909 (= (containsKey!179 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) e!93632)))

(declare-fun b!143717 () Bool)

(declare-fun e!93633 () Bool)

(assert (=> b!143717 (= e!93632 e!93633)))

(declare-fun res!68388 () Bool)

(assert (=> b!143717 (=> (not res!68388) (not e!93633))))

(assert (=> b!143717 (= res!68388 (and (or (not ((_ is Cons!1740) (toList!874 lt!74809))) (bvsle (_1!1345 (h!2348 (toList!874 lt!74809))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))) ((_ is Cons!1740) (toList!874 lt!74809)) (bvslt (_1!1345 (h!2348 (toList!874 lt!74809))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))))))

(declare-fun b!143718 () Bool)

(assert (=> b!143718 (= e!93633 (containsKey!179 (t!6344 (toList!874 lt!74809)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (= (and d!45909 (not res!68387)) b!143717))

(assert (= (and b!143717 res!68388) b!143718))

(assert (=> b!143718 m!172463))

(declare-fun m!173149 () Bool)

(assert (=> b!143718 m!173149))

(assert (=> d!45787 d!45909))

(assert (=> bm!15842 d!45797))

(assert (=> bm!15857 d!45815))

(declare-fun d!45911 () Bool)

(declare-fun e!93634 () Bool)

(assert (=> d!45911 e!93634))

(declare-fun res!68389 () Bool)

(assert (=> d!45911 (=> res!68389 e!93634)))

(declare-fun lt!75184 () Bool)

(assert (=> d!45911 (= res!68389 (not lt!75184))))

(declare-fun lt!75183 () Bool)

(assert (=> d!45911 (= lt!75184 lt!75183)))

(declare-fun lt!75185 () Unit!4536)

(declare-fun e!93635 () Unit!4536)

(assert (=> d!45911 (= lt!75185 e!93635)))

(declare-fun c!27258 () Bool)

(assert (=> d!45911 (= c!27258 lt!75183)))

(assert (=> d!45911 (= lt!75183 (containsKey!179 (toList!874 lt!74997) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!45911 (= (contains!915 lt!74997 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!75184)))

(declare-fun b!143719 () Bool)

(declare-fun lt!75182 () Unit!4536)

(assert (=> b!143719 (= e!93635 lt!75182)))

(assert (=> b!143719 (= lt!75182 (lemmaContainsKeyImpliesGetValueByKeyDefined!128 (toList!874 lt!74997) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143719 (isDefined!129 (getValueByKey!175 (toList!874 lt!74997) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143720 () Bool)

(declare-fun Unit!4554 () Unit!4536)

(assert (=> b!143720 (= e!93635 Unit!4554)))

(declare-fun b!143721 () Bool)

(assert (=> b!143721 (= e!93634 (isDefined!129 (getValueByKey!175 (toList!874 lt!74997) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!45911 c!27258) b!143719))

(assert (= (and d!45911 (not c!27258)) b!143720))

(assert (= (and d!45911 (not res!68389)) b!143721))

(assert (=> d!45911 m!172661))

(declare-fun m!173151 () Bool)

(assert (=> d!45911 m!173151))

(assert (=> b!143719 m!172661))

(declare-fun m!173153 () Bool)

(assert (=> b!143719 m!173153))

(assert (=> b!143719 m!172661))

(declare-fun m!173155 () Bool)

(assert (=> b!143719 m!173155))

(assert (=> b!143719 m!173155))

(declare-fun m!173157 () Bool)

(assert (=> b!143719 m!173157))

(assert (=> b!143721 m!172661))

(assert (=> b!143721 m!173155))

(assert (=> b!143721 m!173155))

(assert (=> b!143721 m!173157))

(assert (=> b!143433 d!45911))

(declare-fun d!45913 () Bool)

(declare-fun res!68390 () Bool)

(declare-fun e!93636 () Bool)

(assert (=> d!45913 (=> res!68390 e!93636)))

(assert (=> d!45913 (= res!68390 ((_ is Nil!1742) (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))))))

(assert (=> d!45913 (= (noDuplicate!51 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))) e!93636)))

(declare-fun b!143722 () Bool)

(declare-fun e!93637 () Bool)

(assert (=> b!143722 (= e!93636 e!93637)))

(declare-fun res!68391 () Bool)

(assert (=> b!143722 (=> (not res!68391) (not e!93637))))

(assert (=> b!143722 (= res!68391 (not (contains!917 (t!6345 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))) (h!2349 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742))))))))

(declare-fun b!143723 () Bool)

(assert (=> b!143723 (= e!93637 (noDuplicate!51 (t!6345 (t!6345 (Cons!1741 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) Nil!1742)))))))

(assert (= (and d!45913 (not res!68390)) b!143722))

(assert (= (and b!143722 res!68391) b!143723))

(declare-fun m!173159 () Bool)

(assert (=> b!143722 m!173159))

(declare-fun m!173161 () Bool)

(assert (=> b!143723 m!173161))

(assert (=> b!143227 d!45913))

(declare-fun d!45915 () Bool)

(assert (=> d!45915 (= (get!1534 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143362 d!45915))

(declare-fun d!45917 () Bool)

(assert (=> d!45917 (= (apply!121 lt!74997 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1535 (getValueByKey!175 (toList!874 lt!74997) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6064 () Bool)

(assert (= bs!6064 d!45917))

(assert (=> bs!6064 m!172661))

(assert (=> bs!6064 m!173155))

(assert (=> bs!6064 m!173155))

(declare-fun m!173163 () Bool)

(assert (=> bs!6064 m!173163))

(assert (=> b!143419 d!45917))

(declare-fun d!45919 () Bool)

(declare-fun c!27259 () Bool)

(assert (=> d!45919 (= c!27259 ((_ is ValueCellFull!1124) (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!93638 () V!3561)

(assert (=> d!45919 (= (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!93638)))

(declare-fun b!143724 () Bool)

(assert (=> b!143724 (= e!93638 (get!1533 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143725 () Bool)

(assert (=> b!143725 (= e!93638 (get!1534 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45919 c!27259) b!143724))

(assert (= (and d!45919 (not c!27259)) b!143725))

(assert (=> b!143724 m!172667))

(assert (=> b!143724 m!172473))

(declare-fun m!173165 () Bool)

(assert (=> b!143724 m!173165))

(assert (=> b!143725 m!172667))

(assert (=> b!143725 m!172473))

(declare-fun m!173167 () Bool)

(assert (=> b!143725 m!173167))

(assert (=> b!143419 d!45919))

(declare-fun d!45921 () Bool)

(declare-fun e!93639 () Bool)

(assert (=> d!45921 e!93639))

(declare-fun res!68393 () Bool)

(assert (=> d!45921 (=> (not res!68393) (not e!93639))))

(declare-fun lt!75188 () ListLongMap!1717)

(assert (=> d!45921 (= res!68393 (contains!915 lt!75188 (_1!1345 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!75189 () List!1744)

(assert (=> d!45921 (= lt!75188 (ListLongMap!1718 lt!75189))))

(declare-fun lt!75186 () Unit!4536)

(declare-fun lt!75187 () Unit!4536)

(assert (=> d!45921 (= lt!75186 lt!75187)))

(assert (=> d!45921 (= (getValueByKey!175 lt!75189 (_1!1345 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!180 (_2!1345 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45921 (= lt!75187 (lemmaContainsTupThenGetReturnValue!92 lt!75189 (_1!1345 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1345 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45921 (= lt!75189 (insertStrictlySorted!95 (toList!874 e!93405) (_1!1345 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1345 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45921 (= (+!168 e!93405 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!75188)))

(declare-fun b!143726 () Bool)

(declare-fun res!68392 () Bool)

(assert (=> b!143726 (=> (not res!68392) (not e!93639))))

(assert (=> b!143726 (= res!68392 (= (getValueByKey!175 (toList!874 lt!75188) (_1!1345 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!180 (_2!1345 (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!143727 () Bool)

(assert (=> b!143727 (= e!93639 (contains!918 (toList!874 lt!75188) (ite c!27154 (ite c!27156 (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!45921 res!68393) b!143726))

(assert (= (and b!143726 res!68392) b!143727))

(declare-fun m!173169 () Bool)

(assert (=> d!45921 m!173169))

(declare-fun m!173171 () Bool)

(assert (=> d!45921 m!173171))

(declare-fun m!173173 () Bool)

(assert (=> d!45921 m!173173))

(declare-fun m!173175 () Bool)

(assert (=> d!45921 m!173175))

(declare-fun m!173177 () Bool)

(assert (=> b!143726 m!173177))

(declare-fun m!173179 () Bool)

(assert (=> b!143727 m!173179))

(assert (=> bm!15841 d!45921))

(declare-fun b!143736 () Bool)

(declare-fun res!68402 () Bool)

(declare-fun e!93642 () Bool)

(assert (=> b!143736 (=> (not res!68402) (not e!93642))))

(assert (=> b!143736 (= res!68402 (and (= (size!2583 (_values!2945 newMap!16)) (bvadd (mask!7313 newMap!16) #b00000000000000000000000000000001)) (= (size!2582 (_keys!4724 newMap!16)) (size!2583 (_values!2945 newMap!16))) (bvsge (_size!627 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!627 newMap!16) (bvadd (mask!7313 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!45923 () Bool)

(declare-fun res!68404 () Bool)

(assert (=> d!45923 (=> (not res!68404) (not e!93642))))

(assert (=> d!45923 (= res!68404 (validMask!0 (mask!7313 newMap!16)))))

(assert (=> d!45923 (= (simpleValid!97 newMap!16) e!93642)))

(declare-fun b!143738 () Bool)

(declare-fun res!68405 () Bool)

(assert (=> b!143738 (=> (not res!68405) (not e!93642))))

(declare-fun size!2588 (LongMapFixedSize!1156) (_ BitVec 32))

(assert (=> b!143738 (= res!68405 (= (size!2588 newMap!16) (bvadd (_size!627 newMap!16) (bvsdiv (bvadd (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!143739 () Bool)

(assert (=> b!143739 (= e!93642 (and (bvsge (extraKeys!2713 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2713 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!627 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!143737 () Bool)

(declare-fun res!68403 () Bool)

(assert (=> b!143737 (=> (not res!68403) (not e!93642))))

(assert (=> b!143737 (= res!68403 (bvsge (size!2588 newMap!16) (_size!627 newMap!16)))))

(assert (= (and d!45923 res!68404) b!143736))

(assert (= (and b!143736 res!68402) b!143737))

(assert (= (and b!143737 res!68403) b!143738))

(assert (= (and b!143738 res!68405) b!143739))

(assert (=> d!45923 m!172741))

(declare-fun m!173181 () Bool)

(assert (=> b!143738 m!173181))

(assert (=> b!143737 m!173181))

(assert (=> d!45795 d!45923))

(declare-fun d!45925 () Bool)

(assert (=> d!45925 (= (inRange!0 (ite c!27160 (ite c!27153 (index!3297 lt!74935) (ite c!27152 (index!3296 lt!74923) (index!3299 lt!74923))) (ite c!27159 (index!3297 lt!74912) (ite c!27157 (index!3296 lt!74920) (index!3299 lt!74920)))) (mask!7313 newMap!16)) (and (bvsge (ite c!27160 (ite c!27153 (index!3297 lt!74935) (ite c!27152 (index!3296 lt!74923) (index!3299 lt!74923))) (ite c!27159 (index!3297 lt!74912) (ite c!27157 (index!3296 lt!74920) (index!3299 lt!74920)))) #b00000000000000000000000000000000) (bvslt (ite c!27160 (ite c!27153 (index!3297 lt!74935) (ite c!27152 (index!3296 lt!74923) (index!3299 lt!74923))) (ite c!27159 (index!3297 lt!74912) (ite c!27157 (index!3296 lt!74920) (index!3299 lt!74920)))) (bvadd (mask!7313 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!15847 d!45925))

(declare-fun d!45927 () Bool)

(declare-fun e!93643 () Bool)

(assert (=> d!45927 e!93643))

(declare-fun res!68407 () Bool)

(assert (=> d!45927 (=> (not res!68407) (not e!93643))))

(declare-fun lt!75192 () ListLongMap!1717)

(assert (=> d!45927 (= res!68407 (contains!915 lt!75192 (_1!1345 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(declare-fun lt!75193 () List!1744)

(assert (=> d!45927 (= lt!75192 (ListLongMap!1718 lt!75193))))

(declare-fun lt!75190 () Unit!4536)

(declare-fun lt!75191 () Unit!4536)

(assert (=> d!45927 (= lt!75190 lt!75191)))

(assert (=> d!45927 (= (getValueByKey!175 lt!75193 (_1!1345 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45927 (= lt!75191 (lemmaContainsTupThenGetReturnValue!92 lt!75193 (_1!1345 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45927 (= lt!75193 (insertStrictlySorted!95 (toList!874 call!15882) (_1!1345 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) (_2!1345 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (=> d!45927 (= (+!168 call!15882 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))) lt!75192)))

(declare-fun b!143740 () Bool)

(declare-fun res!68406 () Bool)

(assert (=> b!143740 (=> (not res!68406) (not e!93643))))

(assert (=> b!143740 (= res!68406 (= (getValueByKey!175 (toList!874 lt!75192) (_1!1345 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) (Some!180 (_2!1345 (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))))

(declare-fun b!143741 () Bool)

(assert (=> b!143741 (= e!93643 (contains!918 (toList!874 lt!75192) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))

(assert (= (and d!45927 res!68407) b!143740))

(assert (= (and b!143740 res!68406) b!143741))

(declare-fun m!173183 () Bool)

(assert (=> d!45927 m!173183))

(declare-fun m!173185 () Bool)

(assert (=> d!45927 m!173185))

(declare-fun m!173187 () Bool)

(assert (=> d!45927 m!173187))

(declare-fun m!173189 () Bool)

(assert (=> d!45927 m!173189))

(declare-fun m!173191 () Bool)

(assert (=> b!143740 m!173191))

(declare-fun m!173193 () Bool)

(assert (=> b!143741 m!173193))

(assert (=> b!143428 d!45927))

(declare-fun d!45929 () Bool)

(assert (=> d!45929 (isDefined!129 (getValueByKey!175 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun lt!75196 () Unit!4536)

(declare-fun choose!882 (List!1744 (_ BitVec 64)) Unit!4536)

(assert (=> d!45929 (= lt!75196 (choose!882 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun e!93646 () Bool)

(assert (=> d!45929 e!93646))

(declare-fun res!68410 () Bool)

(assert (=> d!45929 (=> (not res!68410) (not e!93646))))

(declare-fun isStrictlySorted!321 (List!1744) Bool)

(assert (=> d!45929 (= res!68410 (isStrictlySorted!321 (toList!874 lt!74809)))))

(assert (=> d!45929 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!128 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) lt!75196)))

(declare-fun b!143744 () Bool)

(assert (=> b!143744 (= e!93646 (containsKey!179 (toList!874 lt!74809) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (= (and d!45929 res!68410) b!143744))

(assert (=> d!45929 m!172463))

(assert (=> d!45929 m!172585))

(assert (=> d!45929 m!172585))

(assert (=> d!45929 m!172587))

(assert (=> d!45929 m!172463))

(declare-fun m!173195 () Bool)

(assert (=> d!45929 m!173195))

(declare-fun m!173197 () Bool)

(assert (=> d!45929 m!173197))

(assert (=> b!143744 m!172463))

(assert (=> b!143744 m!172581))

(assert (=> b!143234 d!45929))

(assert (=> b!143234 d!45835))

(assert (=> b!143234 d!45837))

(declare-fun d!45931 () Bool)

(declare-fun e!93649 () Bool)

(assert (=> d!45931 e!93649))

(declare-fun res!68413 () Bool)

(assert (=> d!45931 (=> (not res!68413) (not e!93649))))

(assert (=> d!45931 (= res!68413 (and (bvsge (index!3297 lt!74911) #b00000000000000000000000000000000) (bvslt (index!3297 lt!74911) (size!2582 (_keys!4724 newMap!16)))))))

(declare-fun lt!75199 () Unit!4536)

(declare-fun choose!883 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) Int) Unit!4536)

(assert (=> d!45931 (= lt!75199 (choose!883 (_keys!4724 newMap!16) lt!74910 (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3297 lt!74911) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45931 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45931 (= (lemmaValidKeyInArrayIsInListMap!125 (_keys!4724 newMap!16) lt!74910 (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3297 lt!74911) (defaultEntry!2962 newMap!16)) lt!75199)))

(declare-fun b!143747 () Bool)

(assert (=> b!143747 (= e!93649 (contains!915 (getCurrentListMap!535 (_keys!4724 newMap!16) lt!74910 (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!74911))))))

(assert (= (and d!45931 res!68413) b!143747))

(declare-fun m!173199 () Bool)

(assert (=> d!45931 m!173199))

(assert (=> d!45931 m!172741))

(declare-fun m!173201 () Bool)

(assert (=> b!143747 m!173201))

(assert (=> b!143747 m!172589))

(assert (=> b!143747 m!173201))

(assert (=> b!143747 m!172589))

(declare-fun m!173203 () Bool)

(assert (=> b!143747 m!173203))

(assert (=> b!143317 d!45931))

(declare-fun d!45933 () Bool)

(declare-fun e!93652 () Bool)

(assert (=> d!45933 e!93652))

(declare-fun res!68416 () Bool)

(assert (=> d!45933 (=> (not res!68416) (not e!93652))))

(assert (=> d!45933 (= res!68416 (and (bvsge (index!3297 lt!74911) #b00000000000000000000000000000000) (bvslt (index!3297 lt!74911) (size!2583 (_values!2945 newMap!16)))))))

(declare-fun lt!75202 () Unit!4536)

(declare-fun choose!884 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) (_ BitVec 64) V!3561 Int) Unit!4536)

(assert (=> d!45933 (= lt!75202 (choose!884 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3297 lt!74911) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45933 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45933 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3297 lt!74911) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)) lt!75202)))

(declare-fun b!143750 () Bool)

(assert (=> b!143750 (= e!93652 (= (+!168 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4724 newMap!16) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (index!3297 lt!74911) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16))) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16))))))

(assert (= (and d!45933 res!68416) b!143750))

(assert (=> d!45933 m!172463))

(assert (=> d!45933 m!172475))

(declare-fun m!173205 () Bool)

(assert (=> d!45933 m!173205))

(assert (=> d!45933 m!172741))

(assert (=> b!143750 m!172621))

(assert (=> b!143750 m!172621))

(declare-fun m!173207 () Bool)

(assert (=> b!143750 m!173207))

(assert (=> b!143750 m!172603))

(declare-fun m!173209 () Bool)

(assert (=> b!143750 m!173209))

(assert (=> b!143317 d!45933))

(declare-fun d!45935 () Bool)

(declare-fun e!93653 () Bool)

(assert (=> d!45935 e!93653))

(declare-fun res!68417 () Bool)

(assert (=> d!45935 (=> res!68417 e!93653)))

(declare-fun lt!75205 () Bool)

(assert (=> d!45935 (= res!68417 (not lt!75205))))

(declare-fun lt!75204 () Bool)

(assert (=> d!45935 (= lt!75205 lt!75204)))

(declare-fun lt!75206 () Unit!4536)

(declare-fun e!93654 () Unit!4536)

(assert (=> d!45935 (= lt!75206 e!93654)))

(declare-fun c!27260 () Bool)

(assert (=> d!45935 (= c!27260 lt!75204)))

(assert (=> d!45935 (= lt!75204 (containsKey!179 (toList!874 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> d!45935 (= (contains!915 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) lt!75205)))

(declare-fun b!143751 () Bool)

(declare-fun lt!75203 () Unit!4536)

(assert (=> b!143751 (= e!93654 lt!75203)))

(assert (=> b!143751 (= lt!75203 (lemmaContainsKeyImpliesGetValueByKeyDefined!128 (toList!874 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> b!143751 (isDefined!129 (getValueByKey!175 (toList!874 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143752 () Bool)

(declare-fun Unit!4555 () Unit!4536)

(assert (=> b!143752 (= e!93654 Unit!4555)))

(declare-fun b!143753 () Bool)

(assert (=> b!143753 (= e!93653 (isDefined!129 (getValueByKey!175 (toList!874 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16))) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))))))

(assert (= (and d!45935 c!27260) b!143751))

(assert (= (and d!45935 (not c!27260)) b!143752))

(assert (= (and d!45935 (not res!68417)) b!143753))

(assert (=> d!45935 m!172463))

(declare-fun m!173211 () Bool)

(assert (=> d!45935 m!173211))

(assert (=> b!143751 m!172463))

(declare-fun m!173213 () Bool)

(assert (=> b!143751 m!173213))

(assert (=> b!143751 m!172463))

(declare-fun m!173215 () Bool)

(assert (=> b!143751 m!173215))

(assert (=> b!143751 m!173215))

(declare-fun m!173217 () Bool)

(assert (=> b!143751 m!173217))

(assert (=> b!143753 m!172463))

(assert (=> b!143753 m!173215))

(assert (=> b!143753 m!173215))

(assert (=> b!143753 m!173217))

(assert (=> b!143317 d!45935))

(assert (=> b!143317 d!45885))

(declare-fun b!143762 () Bool)

(declare-fun e!93661 () Bool)

(declare-fun e!93662 () Bool)

(assert (=> b!143762 (= e!93661 e!93662)))

(declare-fun lt!75213 () (_ BitVec 64))

(assert (=> b!143762 (= lt!75213 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75214 () Unit!4536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4887 (_ BitVec 64) (_ BitVec 32)) Unit!4536)

(assert (=> b!143762 (= lt!75214 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4724 newMap!16) lt!75213 #b00000000000000000000000000000000))))

(assert (=> b!143762 (arrayContainsKey!0 (_keys!4724 newMap!16) lt!75213 #b00000000000000000000000000000000)))

(declare-fun lt!75215 () Unit!4536)

(assert (=> b!143762 (= lt!75215 lt!75214)))

(declare-fun res!68422 () Bool)

(assert (=> b!143762 (= res!68422 (= (seekEntryOrOpen!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000) (_keys!4724 newMap!16) (mask!7313 newMap!16)) (Found!283 #b00000000000000000000000000000000)))))

(assert (=> b!143762 (=> (not res!68422) (not e!93662))))

(declare-fun bm!15926 () Bool)

(declare-fun call!15929 () Bool)

(assert (=> bm!15926 (= call!15929 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4724 newMap!16) (mask!7313 newMap!16)))))

(declare-fun b!143763 () Bool)

(declare-fun e!93663 () Bool)

(assert (=> b!143763 (= e!93663 e!93661)))

(declare-fun c!27263 () Bool)

(assert (=> b!143763 (= c!27263 (validKeyInArray!0 (select (arr!2308 (_keys!4724 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!45937 () Bool)

(declare-fun res!68423 () Bool)

(assert (=> d!45937 (=> res!68423 e!93663)))

(assert (=> d!45937 (= res!68423 (bvsge #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))))))

(assert (=> d!45937 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4724 newMap!16) (mask!7313 newMap!16)) e!93663)))

(declare-fun b!143764 () Bool)

(assert (=> b!143764 (= e!93661 call!15929)))

(declare-fun b!143765 () Bool)

(assert (=> b!143765 (= e!93662 call!15929)))

(assert (= (and d!45937 (not res!68423)) b!143763))

(assert (= (and b!143763 c!27263) b!143762))

(assert (= (and b!143763 (not c!27263)) b!143764))

(assert (= (and b!143762 res!68422) b!143765))

(assert (= (or b!143765 b!143764) bm!15926))

(assert (=> b!143762 m!172789))

(declare-fun m!173219 () Bool)

(assert (=> b!143762 m!173219))

(declare-fun m!173221 () Bool)

(assert (=> b!143762 m!173221))

(assert (=> b!143762 m!172789))

(declare-fun m!173223 () Bool)

(assert (=> b!143762 m!173223))

(declare-fun m!173225 () Bool)

(assert (=> bm!15926 m!173225))

(assert (=> b!143763 m!172789))

(assert (=> b!143763 m!172789))

(assert (=> b!143763 m!172791))

(assert (=> b!143370 d!45937))

(assert (=> b!143448 d!45825))

(declare-fun d!45939 () Bool)

(declare-fun e!93664 () Bool)

(assert (=> d!45939 e!93664))

(declare-fun res!68425 () Bool)

(assert (=> d!45939 (=> (not res!68425) (not e!93664))))

(declare-fun lt!75218 () ListLongMap!1717)

(assert (=> d!45939 (= res!68425 (contains!915 lt!75218 (_1!1345 (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))))

(declare-fun lt!75219 () List!1744)

(assert (=> d!45939 (= lt!75218 (ListLongMap!1718 lt!75219))))

(declare-fun lt!75216 () Unit!4536)

(declare-fun lt!75217 () Unit!4536)

(assert (=> d!45939 (= lt!75216 lt!75217)))

(assert (=> d!45939 (= (getValueByKey!175 lt!75219 (_1!1345 (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))) (Some!180 (_2!1345 (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))))

(assert (=> d!45939 (= lt!75217 (lemmaContainsTupThenGetReturnValue!92 lt!75219 (_1!1345 (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) (_2!1345 (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))))

(assert (=> d!45939 (= lt!75219 (insertStrictlySorted!95 (toList!874 (ite c!27184 call!15888 (ite c!27182 call!15886 call!15884))) (_1!1345 (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) (_2!1345 (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))))))

(assert (=> d!45939 (= (+!168 (ite c!27184 call!15888 (ite c!27182 call!15886 call!15884)) (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))) lt!75218)))

(declare-fun b!143766 () Bool)

(declare-fun res!68424 () Bool)

(assert (=> b!143766 (=> (not res!68424) (not e!93664))))

(assert (=> b!143766 (= res!68424 (= (getValueByKey!175 (toList!874 lt!75218) (_1!1345 (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992))))))) (Some!180 (_2!1345 (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))))

(declare-fun b!143767 () Bool)

(assert (=> b!143767 (= e!93664 (contains!918 (toList!874 lt!75218) (ite (or c!27184 c!27182) (tuple2!2669 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3290 (underlying!479 thiss!992)))) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3290 (underlying!479 thiss!992)))))))))

(assert (= (and d!45939 res!68425) b!143766))

(assert (= (and b!143766 res!68424) b!143767))

(declare-fun m!173227 () Bool)

(assert (=> d!45939 m!173227))

(declare-fun m!173229 () Bool)

(assert (=> d!45939 m!173229))

(declare-fun m!173231 () Bool)

(assert (=> d!45939 m!173231))

(declare-fun m!173233 () Bool)

(assert (=> d!45939 m!173233))

(declare-fun m!173235 () Bool)

(assert (=> b!143766 m!173235))

(declare-fun m!173237 () Bool)

(assert (=> b!143767 m!173237))

(assert (=> bm!15883 d!45939))

(assert (=> d!45799 d!45877))

(declare-fun lt!75290 () SeekEntryResult!283)

(declare-fun e!93688 () Bool)

(declare-fun b!143802 () Bool)

(assert (=> b!143802 (= e!93688 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3297 lt!75290)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun b!143803 () Bool)

(declare-fun res!68445 () Bool)

(declare-fun e!93683 () Bool)

(assert (=> b!143803 (=> (not res!68445) (not e!93683))))

(declare-fun lt!75308 () tuple2!2670)

(assert (=> b!143803 (= res!68445 (valid!564 (_2!1346 lt!75308)))))

(declare-fun b!143804 () Bool)

(declare-fun c!27274 () Bool)

(declare-fun lt!75280 () SeekEntryResult!283)

(assert (=> b!143804 (= c!27274 ((_ is MissingVacant!283) lt!75280))))

(declare-fun e!93682 () Bool)

(declare-fun e!93681 () Bool)

(assert (=> b!143804 (= e!93682 e!93681)))

(declare-fun bm!15935 () Bool)

(declare-fun call!15940 () Bool)

(declare-fun call!15938 () Bool)

(assert (=> bm!15935 (= call!15940 call!15938)))

(declare-fun b!143805 () Bool)

(declare-fun e!93687 () Unit!4536)

(declare-fun Unit!4556 () Unit!4536)

(assert (=> b!143805 (= e!93687 Unit!4556)))

(declare-fun lt!75295 () Unit!4536)

(declare-fun lemmaArrayContainsKeyThenInListMap!46 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) (_ BitVec 32) Int) Unit!4536)

(assert (=> b!143805 (= lt!75295 (lemmaArrayContainsKeyThenInListMap!46 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(assert (=> b!143805 (contains!915 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355))))

(declare-fun lt!75296 () Unit!4536)

(assert (=> b!143805 (= lt!75296 lt!75295)))

(assert (=> b!143805 false))

(declare-fun b!143806 () Bool)

(declare-fun e!93686 () Bool)

(assert (=> b!143806 (= e!93681 e!93686)))

(declare-fun res!68452 () Bool)

(assert (=> b!143806 (= res!68452 call!15940)))

(assert (=> b!143806 (=> (not res!68452) (not e!93686))))

(declare-fun b!143807 () Bool)

(declare-fun Unit!4557 () Unit!4536)

(assert (=> b!143807 (= e!93687 Unit!4557)))

(declare-fun b!143808 () Bool)

(declare-fun e!93684 () Unit!4536)

(declare-fun lt!75302 () Unit!4536)

(assert (=> b!143808 (= e!93684 lt!75302)))

(assert (=> b!143808 (= lt!75302 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(declare-fun call!15941 () SeekEntryResult!283)

(assert (=> b!143808 (= lt!75280 call!15941)))

(declare-fun c!27273 () Bool)

(assert (=> b!143808 (= c!27273 ((_ is MissingZero!283) lt!75280))))

(assert (=> b!143808 e!93682))

(declare-fun b!143809 () Bool)

(declare-fun call!15939 () Bool)

(assert (=> b!143809 (= e!93686 (not call!15939))))

(declare-fun b!143810 () Bool)

(declare-fun res!68449 () Bool)

(assert (=> b!143810 (=> (not res!68449) (not e!93683))))

(assert (=> b!143810 (= res!68449 (contains!915 (map!1427 (_2!1346 lt!75308)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun d!45941 () Bool)

(assert (=> d!45941 e!93683))

(declare-fun res!68450 () Bool)

(assert (=> d!45941 (=> (not res!68450) (not e!93683))))

(assert (=> d!45941 (= res!68450 (_1!1346 lt!75308))))

(assert (=> d!45941 (= lt!75308 (tuple2!2671 true (LongMapFixedSize!1157 (defaultEntry!2962 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (bvadd (_size!627 newMap!16) #b00000000000000000000000000000001) (array!4888 (store (arr!2308 (_keys!4724 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (size!2582 (_keys!4724 newMap!16))) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16))) (_vacant!627 newMap!16))))))

(declare-fun lt!75286 () Unit!4536)

(declare-fun lt!75307 () Unit!4536)

(assert (=> d!45941 (= lt!75286 lt!75307)))

(declare-fun lt!75293 () array!4889)

(declare-fun lt!75305 () array!4887)

(assert (=> d!45941 (contains!915 (getCurrentListMap!535 lt!75305 lt!75293 (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (store (arr!2308 (_keys!4724 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911))))))

(assert (=> d!45941 (= lt!75307 (lemmaValidKeyInArrayIsInListMap!125 lt!75305 lt!75293 (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45941 (= lt!75293 (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16))))))

(assert (=> d!45941 (= lt!75305 (array!4888 (store (arr!2308 (_keys!4724 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (size!2582 (_keys!4724 newMap!16))))))

(declare-fun lt!75292 () Unit!4536)

(declare-fun lt!75309 () Unit!4536)

(assert (=> d!45941 (= lt!75292 lt!75309)))

(declare-fun lt!75285 () array!4887)

(assert (=> d!45941 (= (arrayCountValidKeys!0 lt!75285 (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (bvadd (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4887 (_ BitVec 32)) Unit!4536)

(assert (=> d!45941 (= lt!75309 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!75285 (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911))))))

(assert (=> d!45941 (= lt!75285 (array!4888 (store (arr!2308 (_keys!4724 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (size!2582 (_keys!4724 newMap!16))))))

(declare-fun lt!75301 () Unit!4536)

(declare-fun lt!75291 () Unit!4536)

(assert (=> d!45941 (= lt!75301 lt!75291)))

(declare-fun lt!75306 () array!4887)

(assert (=> d!45941 (arrayContainsKey!0 lt!75306 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!45941 (= lt!75291 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!75306 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911))))))

(assert (=> d!45941 (= lt!75306 (array!4888 (store (arr!2308 (_keys!4724 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (size!2582 (_keys!4724 newMap!16))))))

(declare-fun lt!75304 () Unit!4536)

(declare-fun lt!75297 () Unit!4536)

(assert (=> d!45941 (= lt!75304 lt!75297)))

(assert (=> d!45941 (= (+!168 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (array!4888 (store (arr!2308 (_keys!4724 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (size!2582 (_keys!4724 newMap!16))) (array!4890 (store (arr!2309 (_values!2945 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (ValueCellFull!1124 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2583 (_values!2945 newMap!16))) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!46 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) (_ BitVec 64) V!3561 Int) Unit!4536)

(assert (=> d!45941 (= lt!75297 (lemmaAddValidKeyToArrayThenAddPairToListMap!46 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75299 () Unit!4536)

(declare-fun lt!75303 () Unit!4536)

(assert (=> d!45941 (= lt!75299 lt!75303)))

(assert (=> d!45941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4888 (store (arr!2308 (_keys!4724 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (size!2582 (_keys!4724 newMap!16))) (mask!7313 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4887 (_ BitVec 32) (_ BitVec 32)) Unit!4536)

(assert (=> d!45941 (= lt!75303 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (_keys!4724 newMap!16) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (mask!7313 newMap!16)))))

(declare-fun lt!75283 () Unit!4536)

(declare-fun lt!75287 () Unit!4536)

(assert (=> d!45941 (= lt!75283 lt!75287)))

(assert (=> d!45941 (= (arrayCountValidKeys!0 (array!4888 (store (arr!2308 (_keys!4724 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (size!2582 (_keys!4724 newMap!16))) #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4724 newMap!16) #b00000000000000000000000000000000 (size!2582 (_keys!4724 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4887 (_ BitVec 32) (_ BitVec 64)) Unit!4536)

(assert (=> d!45941 (= lt!75287 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4724 newMap!16) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(declare-fun lt!75294 () Unit!4536)

(declare-fun lt!75281 () Unit!4536)

(assert (=> d!45941 (= lt!75294 lt!75281)))

(declare-fun lt!75284 () (_ BitVec 32))

(declare-fun lt!75282 () List!1745)

(assert (=> d!45941 (arrayNoDuplicates!0 (array!4888 (store (arr!2308 (_keys!4724 newMap!16)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)) (size!2582 (_keys!4724 newMap!16))) lt!75284 lt!75282)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4887 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1745) Unit!4536)

(assert (=> d!45941 (= lt!75281 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4724 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911)) lt!75284 lt!75282))))

(assert (=> d!45941 (= lt!75282 Nil!1742)))

(assert (=> d!45941 (= lt!75284 #b00000000000000000000000000000000)))

(declare-fun lt!75288 () Unit!4536)

(assert (=> d!45941 (= lt!75288 e!93687)))

(declare-fun c!27272 () Bool)

(assert (=> d!45941 (= c!27272 (arrayContainsKey!0 (_keys!4724 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!75298 () Unit!4536)

(assert (=> d!45941 (= lt!75298 e!93684)))

(declare-fun c!27275 () Bool)

(assert (=> d!45941 (= c!27275 (contains!915 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355)))))

(assert (=> d!45941 (valid!564 newMap!16)))

(assert (=> d!45941 (= (updateHelperNewKey!66 newMap!16 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27163 (index!3299 lt!74911) (index!3296 lt!74911))) lt!75308)))

(declare-fun bm!15936 () Bool)

(assert (=> bm!15936 (= call!15939 (arrayContainsKey!0 (_keys!4724 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!143811 () Bool)

(declare-fun res!68447 () Bool)

(declare-fun e!93685 () Bool)

(assert (=> b!143811 (=> (not res!68447) (not e!93685))))

(assert (=> b!143811 (= res!68447 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3296 lt!75280)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143812 () Bool)

(assert (=> b!143812 (= e!93685 (not call!15939))))

(declare-fun b!143813 () Bool)

(declare-fun res!68448 () Bool)

(assert (=> b!143813 (= res!68448 call!15938)))

(assert (=> b!143813 (=> (not res!68448) (not e!93688))))

(declare-fun bm!15937 () Bool)

(assert (=> bm!15937 (= call!15938 (inRange!0 (ite c!27275 (index!3297 lt!75290) (ite c!27273 (index!3296 lt!75280) (index!3299 lt!75280))) (mask!7313 newMap!16)))))

(declare-fun b!143814 () Bool)

(declare-fun res!68446 () Bool)

(assert (=> b!143814 (= res!68446 (= (select (arr!2308 (_keys!4724 newMap!16)) (index!3299 lt!75280)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143814 (=> (not res!68446) (not e!93686))))

(declare-fun b!143815 () Bool)

(declare-fun Unit!4558 () Unit!4536)

(assert (=> b!143815 (= e!93684 Unit!4558)))

(declare-fun lt!75289 () Unit!4536)

(assert (=> b!143815 (= lt!75289 (lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(assert (=> b!143815 (= lt!75290 call!15941)))

(declare-fun res!68444 () Bool)

(assert (=> b!143815 (= res!68444 ((_ is Found!283) lt!75290))))

(assert (=> b!143815 (=> (not res!68444) (not e!93688))))

(assert (=> b!143815 e!93688))

(declare-fun lt!75300 () Unit!4536)

(assert (=> b!143815 (= lt!75300 lt!75289)))

(assert (=> b!143815 false))

(declare-fun bm!15938 () Bool)

(assert (=> bm!15938 (= call!15941 (seekEntryOrOpen!0 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (_keys!4724 newMap!16) (mask!7313 newMap!16)))))

(declare-fun b!143816 () Bool)

(assert (=> b!143816 (= e!93683 (= (map!1427 (_2!1346 lt!75308)) (+!168 (map!1427 newMap!16) (tuple2!2669 (select (arr!2308 (_keys!4724 (v!3290 (underlying!479 thiss!992)))) from!355) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!143817 () Bool)

(declare-fun res!68451 () Bool)

(assert (=> b!143817 (=> (not res!68451) (not e!93685))))

(assert (=> b!143817 (= res!68451 call!15940)))

(assert (=> b!143817 (= e!93682 e!93685)))

(declare-fun b!143818 () Bool)

(assert (=> b!143818 (= e!93681 ((_ is Undefined!283) lt!75280))))

(assert (= (and d!45941 c!27275) b!143815))

(assert (= (and d!45941 (not c!27275)) b!143808))

(assert (= (and b!143815 res!68444) b!143813))

(assert (= (and b!143813 res!68448) b!143802))

(assert (= (and b!143808 c!27273) b!143817))

(assert (= (and b!143808 (not c!27273)) b!143804))

(assert (= (and b!143817 res!68451) b!143811))

(assert (= (and b!143811 res!68447) b!143812))

(assert (= (and b!143804 c!27274) b!143806))

(assert (= (and b!143804 (not c!27274)) b!143818))

(assert (= (and b!143806 res!68452) b!143814))

(assert (= (and b!143814 res!68446) b!143809))

(assert (= (or b!143817 b!143806) bm!15935))

(assert (= (or b!143812 b!143809) bm!15936))

(assert (= (or b!143813 bm!15935) bm!15937))

(assert (= (or b!143815 b!143808) bm!15938))

(assert (= (and d!45941 c!27272) b!143805))

(assert (= (and d!45941 (not c!27272)) b!143807))

(assert (= (and d!45941 res!68450) b!143803))

(assert (= (and b!143803 res!68445) b!143810))

(assert (= (and b!143810 res!68449) b!143816))

(declare-fun m!173239 () Bool)

(assert (=> b!143810 m!173239))

(assert (=> b!143810 m!173239))

(assert (=> b!143810 m!172463))

(declare-fun m!173241 () Bool)

(assert (=> b!143810 m!173241))

(assert (=> b!143816 m!173239))

(assert (=> b!143816 m!172489))

(assert (=> b!143816 m!172489))

(declare-fun m!173243 () Bool)

(assert (=> b!143816 m!173243))

(assert (=> bm!15938 m!172463))

(assert (=> bm!15938 m!172629))

(declare-fun m!173245 () Bool)

(assert (=> d!45941 m!173245))

(declare-fun m!173247 () Bool)

(assert (=> d!45941 m!173247))

(declare-fun m!173249 () Bool)

(assert (=> d!45941 m!173249))

(declare-fun m!173251 () Bool)

(assert (=> d!45941 m!173251))

(assert (=> d!45941 m!172463))

(declare-fun m!173253 () Bool)

(assert (=> d!45941 m!173253))

(assert (=> d!45941 m!172621))

(assert (=> d!45941 m!172463))

(declare-fun m!173255 () Bool)

(assert (=> d!45941 m!173255))

(assert (=> d!45941 m!172463))

(assert (=> d!45941 m!172597))

(declare-fun m!173257 () Bool)

(assert (=> d!45941 m!173257))

(declare-fun m!173259 () Bool)

(assert (=> d!45941 m!173259))

(assert (=> d!45941 m!172463))

(assert (=> d!45941 m!172475))

(declare-fun m!173261 () Bool)

(assert (=> d!45941 m!173261))

(declare-fun m!173263 () Bool)

(assert (=> d!45941 m!173263))

(declare-fun m!173265 () Bool)

(assert (=> d!45941 m!173265))

(declare-fun m!173267 () Bool)

(assert (=> d!45941 m!173267))

(assert (=> d!45941 m!173265))

(assert (=> d!45941 m!173247))

(declare-fun m!173269 () Bool)

(assert (=> d!45941 m!173269))

(assert (=> d!45941 m!172463))

(declare-fun m!173271 () Bool)

(assert (=> d!45941 m!173271))

(assert (=> d!45941 m!172463))

(declare-fun m!173273 () Bool)

(assert (=> d!45941 m!173273))

(assert (=> d!45941 m!172653))

(assert (=> d!45941 m!172621))

(assert (=> d!45941 m!172463))

(assert (=> d!45941 m!172623))

(declare-fun m!173275 () Bool)

(assert (=> d!45941 m!173275))

(declare-fun m!173277 () Bool)

(assert (=> d!45941 m!173277))

(assert (=> d!45941 m!172621))

(assert (=> d!45941 m!173207))

(assert (=> d!45941 m!172463))

(declare-fun m!173279 () Bool)

(assert (=> d!45941 m!173279))

(assert (=> d!45941 m!172485))

(declare-fun m!173281 () Bool)

(assert (=> b!143802 m!173281))

(assert (=> b!143815 m!172463))

(assert (=> b!143815 m!172595))

(assert (=> bm!15936 m!172463))

(assert (=> bm!15936 m!172597))

(declare-fun m!173283 () Bool)

(assert (=> bm!15937 m!173283))

(declare-fun m!173285 () Bool)

(assert (=> b!143811 m!173285))

(declare-fun m!173287 () Bool)

(assert (=> b!143803 m!173287))

(declare-fun m!173289 () Bool)

(assert (=> b!143814 m!173289))

(assert (=> b!143805 m!172463))

(declare-fun m!173291 () Bool)

(assert (=> b!143805 m!173291))

(assert (=> b!143805 m!172621))

(assert (=> b!143805 m!172621))

(assert (=> b!143805 m!172463))

(assert (=> b!143805 m!172623))

(assert (=> b!143808 m!172463))

(assert (=> b!143808 m!172611))

(assert (=> bm!15864 d!45941))

(declare-fun d!45943 () Bool)

(assert (=> d!45943 (= (+!168 (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (tuple2!2669 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) lt!74918 (zeroValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75312 () Unit!4536)

(declare-fun choose!885 (array!4887 array!4889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 V!3561 Int) Unit!4536)

(assert (=> d!45943 (= lt!75312 (choose!885 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) lt!74918 (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45943 (validMask!0 (mask!7313 newMap!16))))

(assert (=> d!45943 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!66 (_keys!4724 newMap!16) (_values!2945 newMap!16) (mask!7313 newMap!16) (extraKeys!2713 newMap!16) lt!74918 (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (get!1531 (select (arr!2309 (_values!2945 (v!3290 (underlying!479 thiss!992)))) from!355) (dynLambda!437 (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)) lt!75312)))

(declare-fun bs!6065 () Bool)

(assert (= bs!6065 d!45943))

(assert (=> bs!6065 m!172621))

(declare-fun m!173293 () Bool)

(assert (=> bs!6065 m!173293))

(assert (=> bs!6065 m!172475))

(declare-fun m!173295 () Bool)

(assert (=> bs!6065 m!173295))

(assert (=> bs!6065 m!172741))

(assert (=> bs!6065 m!172475))

(declare-fun m!173297 () Bool)

(assert (=> bs!6065 m!173297))

(assert (=> bs!6065 m!172621))

(assert (=> b!143330 d!45943))

(declare-fun condMapEmpty!4873 () Bool)

(declare-fun mapDefault!4873 () ValueCell!1124)

(assert (=> mapNonEmpty!4871 (= condMapEmpty!4873 (= mapRest!4871 ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4873)))))

(declare-fun e!93689 () Bool)

(declare-fun mapRes!4873 () Bool)

(assert (=> mapNonEmpty!4871 (= tp!11621 (and e!93689 mapRes!4873))))

(declare-fun mapNonEmpty!4873 () Bool)

(declare-fun tp!11623 () Bool)

(declare-fun e!93690 () Bool)

(assert (=> mapNonEmpty!4873 (= mapRes!4873 (and tp!11623 e!93690))))

(declare-fun mapValue!4873 () ValueCell!1124)

(declare-fun mapKey!4873 () (_ BitVec 32))

(declare-fun mapRest!4873 () (Array (_ BitVec 32) ValueCell!1124))

(assert (=> mapNonEmpty!4873 (= mapRest!4871 (store mapRest!4873 mapKey!4873 mapValue!4873))))

(declare-fun mapIsEmpty!4873 () Bool)

(assert (=> mapIsEmpty!4873 mapRes!4873))

(declare-fun b!143820 () Bool)

(assert (=> b!143820 (= e!93689 tp_is_empty!2935)))

(declare-fun b!143819 () Bool)

(assert (=> b!143819 (= e!93690 tp_is_empty!2935)))

(assert (= (and mapNonEmpty!4871 condMapEmpty!4873) mapIsEmpty!4873))

(assert (= (and mapNonEmpty!4871 (not condMapEmpty!4873)) mapNonEmpty!4873))

(assert (= (and mapNonEmpty!4873 ((_ is ValueCellFull!1124) mapValue!4873)) b!143819))

(assert (= (and mapNonEmpty!4871 ((_ is ValueCellFull!1124) mapDefault!4873)) b!143820))

(declare-fun m!173299 () Bool)

(assert (=> mapNonEmpty!4873 m!173299))

(declare-fun condMapEmpty!4874 () Bool)

(declare-fun mapDefault!4874 () ValueCell!1124)

(assert (=> mapNonEmpty!4872 (= condMapEmpty!4874 (= mapRest!4872 ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4874)))))

(declare-fun e!93691 () Bool)

(declare-fun mapRes!4874 () Bool)

(assert (=> mapNonEmpty!4872 (= tp!11622 (and e!93691 mapRes!4874))))

(declare-fun mapNonEmpty!4874 () Bool)

(declare-fun tp!11624 () Bool)

(declare-fun e!93692 () Bool)

(assert (=> mapNonEmpty!4874 (= mapRes!4874 (and tp!11624 e!93692))))

(declare-fun mapKey!4874 () (_ BitVec 32))

(declare-fun mapValue!4874 () ValueCell!1124)

(declare-fun mapRest!4874 () (Array (_ BitVec 32) ValueCell!1124))

(assert (=> mapNonEmpty!4874 (= mapRest!4872 (store mapRest!4874 mapKey!4874 mapValue!4874))))

(declare-fun mapIsEmpty!4874 () Bool)

(assert (=> mapIsEmpty!4874 mapRes!4874))

(declare-fun b!143822 () Bool)

(assert (=> b!143822 (= e!93691 tp_is_empty!2935)))

(declare-fun b!143821 () Bool)

(assert (=> b!143821 (= e!93692 tp_is_empty!2935)))

(assert (= (and mapNonEmpty!4872 condMapEmpty!4874) mapIsEmpty!4874))

(assert (= (and mapNonEmpty!4872 (not condMapEmpty!4874)) mapNonEmpty!4874))

(assert (= (and mapNonEmpty!4874 ((_ is ValueCellFull!1124) mapValue!4874)) b!143821))

(assert (= (and mapNonEmpty!4872 ((_ is ValueCellFull!1124) mapDefault!4874)) b!143822))

(declare-fun m!173301 () Bool)

(assert (=> mapNonEmpty!4874 m!173301))

(declare-fun b_lambda!6435 () Bool)

(assert (= b_lambda!6429 (or (and b!143106 b_free!3037 (= (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) (defaultEntry!2962 newMap!16))) (and b!143111 b_free!3039) b_lambda!6435)))

(declare-fun b_lambda!6437 () Bool)

(assert (= b_lambda!6425 (or (and b!143106 b_free!3037) (and b!143111 b_free!3039 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))))) b_lambda!6437)))

(declare-fun b_lambda!6439 () Bool)

(assert (= b_lambda!6433 (or (and b!143106 b_free!3037 (= (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) (defaultEntry!2962 newMap!16))) (and b!143111 b_free!3039) b_lambda!6439)))

(declare-fun b_lambda!6441 () Bool)

(assert (= b_lambda!6427 (or (and b!143106 b_free!3037) (and b!143111 b_free!3039 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))))) b_lambda!6441)))

(declare-fun b_lambda!6443 () Bool)

(assert (= b_lambda!6431 (or (and b!143106 b_free!3037 (= (defaultEntry!2962 (v!3290 (underlying!479 thiss!992))) (defaultEntry!2962 newMap!16))) (and b!143111 b_free!3039) b_lambda!6443)))

(check-sat (not d!45939) (not b!143622) (not d!45817) (not d!45893) (not b!143751) (not b!143688) (not b!143679) (not b!143600) (not b!143741) (not bm!15918) (not d!45867) (not b!143631) (not bm!15903) (not bm!15894) (not d!45935) (not b!143553) (not b!143545) (not d!45833) (not b!143681) (not b!143495) (not b!143722) (not b!143724) (not b!143585) (not b!143671) (not b!143593) (not b!143486) (not bm!15906) (not b!143670) (not b!143639) (not b!143672) (not d!45933) (not bm!15937) (not bm!15938) (not d!45923) (not b_lambda!6437) (not d!45869) (not b!143707) (not b!143675) (not b!143704) (not b!143604) (not b!143605) (not d!45851) (not d!45885) (not d!45871) (not b!143726) (not b!143696) (not b!143738) (not b!143805) (not b!143725) (not b!143609) (not b!143539) (not d!45857) (not d!45895) (not b!143694) (not b!143693) (not b!143644) (not b!143723) (not bm!15914) (not bm!15915) b_and!8937 (not b_lambda!6439) (not b!143763) (not b!143744) (not b!143619) (not b!143601) (not d!45835) (not b!143750) (not b!143701) (not b!143737) (not d!45815) (not b!143719) (not b!143767) (not b!143575) (not d!45821) tp_is_empty!2935 (not b!143531) (not b!143606) (not b!143718) (not b!143614) (not bm!15926) (not b!143629) (not b!143573) (not b!143608) (not b!143621) (not b!143721) (not d!45847) (not b!143706) (not d!45873) (not bm!15936) (not b!143712) (not b!143766) (not b!143698) (not b!143571) (not b!143522) (not d!45849) (not b!143810) (not b_next!3039) (not d!45891) (not b!143762) (not bm!15895) (not b!143803) (not d!45911) (not d!45927) (not d!45887) (not d!45845) (not mapNonEmpty!4874) (not b!143557) (not b!143628) (not b!143708) (not b!143528) (not d!45829) (not b!143699) (not b!143709) (not bm!15896) (not b_next!3037) (not b!143543) (not bm!15916) (not b!143638) (not d!45931) (not b!143542) (not b!143740) (not d!45889) (not d!45865) (not b_lambda!6423) (not b!143710) (not d!45941) (not b!143669) (not b!143702) (not d!45819) (not d!45917) (not d!45879) (not bm!15907) (not bm!15905) (not b!143603) (not d!45859) (not d!45921) (not d!45853) (not b!143816) (not d!45841) (not d!45905) (not d!45903) (not b!143595) (not bm!15923) (not bm!15919) (not b!143560) (not b!143527) (not b!143689) (not b_lambda!6419) b_and!8939 (not d!45823) (not bm!15901) (not d!45813) (not bm!15902) (not d!45907) (not bm!15891) (not b_lambda!6435) (not d!45861) (not b!143625) (not bm!15892) (not b!143618) (not b!143529) (not b!143753) (not b!143727) (not d!45881) (not b_lambda!6443) (not b_lambda!6441) (not d!45863) (not d!45929) (not b!143815) (not b!143747) (not b!143536) (not bm!15920) (not b!143678) (not d!45855) (not d!45943) (not b!143558) (not d!45831) (not b!143524) (not b!143808) (not b!143616) (not b!143643) (not b!143520) (not mapNonEmpty!4873) (not b!143526) (not b!143673) (not b!143552))
(check-sat b_and!8937 b_and!8939 (not b_next!3037) (not b_next!3039))
