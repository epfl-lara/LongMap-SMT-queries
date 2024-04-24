; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14426 () Bool)

(assert start!14426)

(declare-fun b!136036 () Bool)

(declare-fun b_free!2929 () Bool)

(declare-fun b_next!2929 () Bool)

(assert (=> b!136036 (= b_free!2929 (not b_next!2929))))

(declare-fun tp!11239 () Bool)

(declare-fun b_and!8409 () Bool)

(assert (=> b!136036 (= tp!11239 b_and!8409)))

(declare-fun b!136017 () Bool)

(declare-fun b_free!2931 () Bool)

(declare-fun b_next!2931 () Bool)

(assert (=> b!136017 (= b_free!2931 (not b_next!2931))))

(declare-fun tp!11241 () Bool)

(declare-fun b_and!8411 () Bool)

(assert (=> b!136017 (= tp!11241 b_and!8411)))

(declare-fun res!65267 () Bool)

(declare-fun e!88563 () Bool)

(assert (=> start!14426 (=> (not res!65267) (not e!88563))))

(declare-datatypes ((V!3489 0))(
  ( (V!3490 (val!1485 Int)) )
))
(declare-datatypes ((array!4777 0))(
  ( (array!4778 (arr!2258 (Array (_ BitVec 32) (_ BitVec 64))) (size!2528 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1097 0))(
  ( (ValueCellFull!1097 (v!3213 V!3489)) (EmptyCell!1097) )
))
(declare-datatypes ((array!4779 0))(
  ( (array!4780 (arr!2259 (Array (_ BitVec 32) ValueCell!1097)) (size!2529 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1102 0))(
  ( (LongMapFixedSize!1103 (defaultEntry!2885 Int) (mask!7197 (_ BitVec 32)) (extraKeys!2646 (_ BitVec 32)) (zeroValue!2738 V!3489) (minValue!2738 V!3489) (_size!600 (_ BitVec 32)) (_keys!4638 array!4777) (_values!2868 array!4779) (_vacant!600 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!890 0))(
  ( (Cell!891 (v!3214 LongMapFixedSize!1102)) )
))
(declare-datatypes ((LongMap!890 0))(
  ( (LongMap!891 (underlying!456 Cell!890)) )
))
(declare-fun thiss!992 () LongMap!890)

(declare-fun valid!543 (LongMap!890) Bool)

(assert (=> start!14426 (= res!65267 (valid!543 thiss!992))))

(assert (=> start!14426 e!88563))

(declare-fun e!88572 () Bool)

(assert (=> start!14426 e!88572))

(assert (=> start!14426 true))

(declare-fun e!88567 () Bool)

(assert (=> start!14426 e!88567))

(declare-fun e!88565 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1102)

(declare-fun tp_is_empty!2881 () Bool)

(declare-fun array_inv!1411 (array!4777) Bool)

(declare-fun array_inv!1412 (array!4779) Bool)

(assert (=> b!136017 (= e!88567 (and tp!11241 tp_is_empty!2881 (array_inv!1411 (_keys!4638 newMap!16)) (array_inv!1412 (_values!2868 newMap!16)) e!88565))))

(declare-fun b!136018 () Bool)

(declare-fun res!65260 () Bool)

(declare-fun e!88562 () Bool)

(assert (=> b!136018 (=> (not res!65260) (not e!88562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4777 (_ BitVec 32)) Bool)

(assert (=> b!136018 (= res!65260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4638 (v!3214 (underlying!456 thiss!992))) (mask!7197 (v!3214 (underlying!456 thiss!992)))))))

(declare-fun b!136019 () Bool)

(declare-fun e!88564 () Bool)

(declare-fun mapRes!4665 () Bool)

(assert (=> b!136019 (= e!88565 (and e!88564 mapRes!4665))))

(declare-fun condMapEmpty!4666 () Bool)

(declare-fun mapDefault!4665 () ValueCell!1097)

(assert (=> b!136019 (= condMapEmpty!4666 (= (arr!2259 (_values!2868 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1097)) mapDefault!4665)))))

(declare-fun b!136020 () Bool)

(declare-fun e!88570 () Bool)

(assert (=> b!136020 (= e!88572 e!88570)))

(declare-fun b!136021 () Bool)

(declare-fun e!88559 () Bool)

(assert (=> b!136021 (= e!88559 tp_is_empty!2881)))

(declare-fun b!136022 () Bool)

(declare-fun e!88560 () Bool)

(assert (=> b!136022 (= e!88560 tp_is_empty!2881)))

(declare-fun b!136023 () Bool)

(declare-fun e!88561 () Bool)

(assert (=> b!136023 (= e!88570 e!88561)))

(declare-fun b!136024 () Bool)

(declare-fun e!88573 () Bool)

(declare-fun e!88568 () Bool)

(declare-fun mapRes!4666 () Bool)

(assert (=> b!136024 (= e!88573 (and e!88568 mapRes!4666))))

(declare-fun condMapEmpty!4665 () Bool)

(declare-fun mapDefault!4666 () ValueCell!1097)

(assert (=> b!136024 (= condMapEmpty!4665 (= (arr!2259 (_values!2868 (v!3214 (underlying!456 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1097)) mapDefault!4666)))))

(declare-fun b!136025 () Bool)

(declare-fun e!88569 () Bool)

(assert (=> b!136025 (= e!88569 e!88562)))

(declare-fun res!65265 () Bool)

(assert (=> b!136025 (=> (not res!65265) (not e!88562))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2568 0))(
  ( (tuple2!2569 (_1!1295 (_ BitVec 64)) (_2!1295 V!3489)) )
))
(declare-datatypes ((List!1695 0))(
  ( (Nil!1692) (Cons!1691 (h!2297 tuple2!2568) (t!6163 List!1695)) )
))
(declare-datatypes ((ListLongMap!1655 0))(
  ( (ListLongMap!1656 (toList!843 List!1695)) )
))
(declare-fun lt!71060 () ListLongMap!1655)

(declare-fun contains!887 (ListLongMap!1655 (_ BitVec 64)) Bool)

(assert (=> b!136025 (= res!65265 (contains!887 lt!71060 (select (arr!2258 (_keys!4638 (v!3214 (underlying!456 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2570 0))(
  ( (tuple2!2571 (_1!1296 Bool) (_2!1296 LongMapFixedSize!1102)) )
))
(declare-fun lt!71061 () tuple2!2570)

(declare-fun update!197 (LongMapFixedSize!1102 (_ BitVec 64) V!3489) tuple2!2570)

(declare-fun get!1495 (ValueCell!1097 V!3489) V!3489)

(declare-fun dynLambda!427 (Int (_ BitVec 64)) V!3489)

(assert (=> b!136025 (= lt!71061 (update!197 newMap!16 (select (arr!2258 (_keys!4638 (v!3214 (underlying!456 thiss!992)))) from!355) (get!1495 (select (arr!2259 (_values!2868 (v!3214 (underlying!456 thiss!992)))) from!355) (dynLambda!427 (defaultEntry!2885 (v!3214 (underlying!456 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!136026 () Bool)

(declare-fun res!65264 () Bool)

(assert (=> b!136026 (=> (not res!65264) (not e!88562))))

(assert (=> b!136026 (= res!65264 (and (= (size!2529 (_values!2868 (v!3214 (underlying!456 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7197 (v!3214 (underlying!456 thiss!992))))) (= (size!2528 (_keys!4638 (v!3214 (underlying!456 thiss!992)))) (size!2529 (_values!2868 (v!3214 (underlying!456 thiss!992))))) (bvsge (mask!7197 (v!3214 (underlying!456 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2646 (v!3214 (underlying!456 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2646 (v!3214 (underlying!456 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!136027 () Bool)

(assert (=> b!136027 (= e!88563 e!88569)))

(declare-fun res!65258 () Bool)

(assert (=> b!136027 (=> (not res!65258) (not e!88569))))

(declare-fun lt!71062 () ListLongMap!1655)

(assert (=> b!136027 (= res!65258 (and (= lt!71062 lt!71060) (not (= (select (arr!2258 (_keys!4638 (v!3214 (underlying!456 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2258 (_keys!4638 (v!3214 (underlying!456 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1401 (LongMapFixedSize!1102) ListLongMap!1655)

(assert (=> b!136027 (= lt!71060 (map!1401 newMap!16))))

(declare-fun getCurrentListMap!519 (array!4777 array!4779 (_ BitVec 32) (_ BitVec 32) V!3489 V!3489 (_ BitVec 32) Int) ListLongMap!1655)

(assert (=> b!136027 (= lt!71062 (getCurrentListMap!519 (_keys!4638 (v!3214 (underlying!456 thiss!992))) (_values!2868 (v!3214 (underlying!456 thiss!992))) (mask!7197 (v!3214 (underlying!456 thiss!992))) (extraKeys!2646 (v!3214 (underlying!456 thiss!992))) (zeroValue!2738 (v!3214 (underlying!456 thiss!992))) (minValue!2738 (v!3214 (underlying!456 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2885 (v!3214 (underlying!456 thiss!992)))))))

(declare-fun b!136028 () Bool)

(declare-fun res!65268 () Bool)

(assert (=> b!136028 (=> (not res!65268) (not e!88563))))

(assert (=> b!136028 (= res!65268 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7197 newMap!16)) (_size!600 (v!3214 (underlying!456 thiss!992)))))))

(declare-fun mapNonEmpty!4665 () Bool)

(declare-fun tp!11240 () Bool)

(assert (=> mapNonEmpty!4665 (= mapRes!4665 (and tp!11240 e!88559))))

(declare-fun mapRest!4665 () (Array (_ BitVec 32) ValueCell!1097))

(declare-fun mapValue!4665 () ValueCell!1097)

(declare-fun mapKey!4666 () (_ BitVec 32))

(assert (=> mapNonEmpty!4665 (= (arr!2259 (_values!2868 newMap!16)) (store mapRest!4665 mapKey!4666 mapValue!4665))))

(declare-fun b!136029 () Bool)

(assert (=> b!136029 (= e!88564 tp_is_empty!2881)))

(declare-fun b!136030 () Bool)

(declare-fun res!65261 () Bool)

(assert (=> b!136030 (=> (not res!65261) (not e!88563))))

(assert (=> b!136030 (= res!65261 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2528 (_keys!4638 (v!3214 (underlying!456 thiss!992)))))))))

(declare-fun b!136031 () Bool)

(declare-fun res!65263 () Bool)

(assert (=> b!136031 (=> (not res!65263) (not e!88562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!136031 (= res!65263 (validMask!0 (mask!7197 (v!3214 (underlying!456 thiss!992)))))))

(declare-fun mapIsEmpty!4665 () Bool)

(assert (=> mapIsEmpty!4665 mapRes!4666))

(declare-fun b!136032 () Bool)

(declare-fun res!65266 () Bool)

(assert (=> b!136032 (=> (not res!65266) (not e!88563))))

(declare-fun valid!544 (LongMapFixedSize!1102) Bool)

(assert (=> b!136032 (= res!65266 (valid!544 newMap!16))))

(declare-fun b!136033 () Bool)

(declare-fun res!65262 () Bool)

(assert (=> b!136033 (=> (not res!65262) (not e!88562))))

(declare-datatypes ((List!1696 0))(
  ( (Nil!1693) (Cons!1692 (h!2298 (_ BitVec 64)) (t!6164 List!1696)) )
))
(declare-fun arrayNoDuplicates!0 (array!4777 (_ BitVec 32) List!1696) Bool)

(assert (=> b!136033 (= res!65262 (arrayNoDuplicates!0 (_keys!4638 (v!3214 (underlying!456 thiss!992))) #b00000000000000000000000000000000 Nil!1693))))

(declare-fun b!136034 () Bool)

(assert (=> b!136034 (= e!88562 (not (contains!887 lt!71062 (select (arr!2258 (_keys!4638 (v!3214 (underlying!456 thiss!992)))) from!355))))))

(declare-fun b!136035 () Bool)

(assert (=> b!136035 (= e!88568 tp_is_empty!2881)))

(assert (=> b!136036 (= e!88561 (and tp!11239 tp_is_empty!2881 (array_inv!1411 (_keys!4638 (v!3214 (underlying!456 thiss!992)))) (array_inv!1412 (_values!2868 (v!3214 (underlying!456 thiss!992)))) e!88573))))

(declare-fun mapIsEmpty!4666 () Bool)

(assert (=> mapIsEmpty!4666 mapRes!4665))

(declare-fun b!136037 () Bool)

(declare-fun res!65259 () Bool)

(assert (=> b!136037 (=> (not res!65259) (not e!88562))))

(assert (=> b!136037 (= res!65259 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2528 (_keys!4638 (v!3214 (underlying!456 thiss!992)))))))))

(declare-fun mapNonEmpty!4666 () Bool)

(declare-fun tp!11242 () Bool)

(assert (=> mapNonEmpty!4666 (= mapRes!4666 (and tp!11242 e!88560))))

(declare-fun mapValue!4666 () ValueCell!1097)

(declare-fun mapRest!4666 () (Array (_ BitVec 32) ValueCell!1097))

(declare-fun mapKey!4665 () (_ BitVec 32))

(assert (=> mapNonEmpty!4666 (= (arr!2259 (_values!2868 (v!3214 (underlying!456 thiss!992)))) (store mapRest!4666 mapKey!4665 mapValue!4666))))

(assert (= (and start!14426 res!65267) b!136030))

(assert (= (and b!136030 res!65261) b!136032))

(assert (= (and b!136032 res!65266) b!136028))

(assert (= (and b!136028 res!65268) b!136027))

(assert (= (and b!136027 res!65258) b!136025))

(assert (= (and b!136025 res!65265) b!136031))

(assert (= (and b!136031 res!65263) b!136026))

(assert (= (and b!136026 res!65264) b!136018))

(assert (= (and b!136018 res!65260) b!136033))

(assert (= (and b!136033 res!65262) b!136037))

(assert (= (and b!136037 res!65259) b!136034))

(assert (= (and b!136024 condMapEmpty!4665) mapIsEmpty!4665))

(assert (= (and b!136024 (not condMapEmpty!4665)) mapNonEmpty!4666))

(get-info :version)

(assert (= (and mapNonEmpty!4666 ((_ is ValueCellFull!1097) mapValue!4666)) b!136022))

(assert (= (and b!136024 ((_ is ValueCellFull!1097) mapDefault!4666)) b!136035))

(assert (= b!136036 b!136024))

(assert (= b!136023 b!136036))

(assert (= b!136020 b!136023))

(assert (= start!14426 b!136020))

(assert (= (and b!136019 condMapEmpty!4666) mapIsEmpty!4666))

(assert (= (and b!136019 (not condMapEmpty!4666)) mapNonEmpty!4665))

(assert (= (and mapNonEmpty!4665 ((_ is ValueCellFull!1097) mapValue!4665)) b!136021))

(assert (= (and b!136019 ((_ is ValueCellFull!1097) mapDefault!4665)) b!136029))

(assert (= b!136017 b!136019))

(assert (= start!14426 b!136017))

(declare-fun b_lambda!6091 () Bool)

(assert (=> (not b_lambda!6091) (not b!136025)))

(declare-fun t!6160 () Bool)

(declare-fun tb!2429 () Bool)

(assert (=> (and b!136036 (= (defaultEntry!2885 (v!3214 (underlying!456 thiss!992))) (defaultEntry!2885 (v!3214 (underlying!456 thiss!992)))) t!6160) tb!2429))

(declare-fun result!4005 () Bool)

(assert (=> tb!2429 (= result!4005 tp_is_empty!2881)))

(assert (=> b!136025 t!6160))

(declare-fun b_and!8413 () Bool)

(assert (= b_and!8409 (and (=> t!6160 result!4005) b_and!8413)))

(declare-fun t!6162 () Bool)

(declare-fun tb!2431 () Bool)

(assert (=> (and b!136017 (= (defaultEntry!2885 newMap!16) (defaultEntry!2885 (v!3214 (underlying!456 thiss!992)))) t!6162) tb!2431))

(declare-fun result!4009 () Bool)

(assert (= result!4009 result!4005))

(assert (=> b!136025 t!6162))

(declare-fun b_and!8415 () Bool)

(assert (= b_and!8411 (and (=> t!6162 result!4009) b_and!8415)))

(declare-fun m!162479 () Bool)

(assert (=> b!136033 m!162479))

(declare-fun m!162481 () Bool)

(assert (=> b!136018 m!162481))

(declare-fun m!162483 () Bool)

(assert (=> start!14426 m!162483))

(declare-fun m!162485 () Bool)

(assert (=> b!136027 m!162485))

(declare-fun m!162487 () Bool)

(assert (=> b!136027 m!162487))

(declare-fun m!162489 () Bool)

(assert (=> b!136027 m!162489))

(assert (=> b!136034 m!162485))

(assert (=> b!136034 m!162485))

(declare-fun m!162491 () Bool)

(assert (=> b!136034 m!162491))

(declare-fun m!162493 () Bool)

(assert (=> mapNonEmpty!4666 m!162493))

(declare-fun m!162495 () Bool)

(assert (=> b!136031 m!162495))

(declare-fun m!162497 () Bool)

(assert (=> b!136036 m!162497))

(declare-fun m!162499 () Bool)

(assert (=> b!136036 m!162499))

(declare-fun m!162501 () Bool)

(assert (=> b!136032 m!162501))

(declare-fun m!162503 () Bool)

(assert (=> b!136017 m!162503))

(declare-fun m!162505 () Bool)

(assert (=> b!136017 m!162505))

(declare-fun m!162507 () Bool)

(assert (=> mapNonEmpty!4665 m!162507))

(declare-fun m!162509 () Bool)

(assert (=> b!136025 m!162509))

(declare-fun m!162511 () Bool)

(assert (=> b!136025 m!162511))

(declare-fun m!162513 () Bool)

(assert (=> b!136025 m!162513))

(assert (=> b!136025 m!162485))

(assert (=> b!136025 m!162511))

(assert (=> b!136025 m!162509))

(assert (=> b!136025 m!162485))

(declare-fun m!162515 () Bool)

(assert (=> b!136025 m!162515))

(assert (=> b!136025 m!162485))

(assert (=> b!136025 m!162513))

(declare-fun m!162517 () Bool)

(assert (=> b!136025 m!162517))

(check-sat (not b!136032) (not start!14426) (not b!136027) (not b!136031) (not b_next!2931) b_and!8413 (not mapNonEmpty!4665) (not b!136036) (not b_lambda!6091) (not b!136034) (not b!136017) (not b!136025) b_and!8415 (not b!136018) (not b!136033) (not b_next!2929) (not mapNonEmpty!4666) tp_is_empty!2881)
(check-sat b_and!8413 b_and!8415 (not b_next!2929) (not b_next!2931))
