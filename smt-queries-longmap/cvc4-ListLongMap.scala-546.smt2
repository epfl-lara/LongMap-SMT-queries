; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14432 () Bool)

(assert start!14432)

(declare-fun b!136046 () Bool)

(declare-fun b_free!2949 () Bool)

(declare-fun b_next!2949 () Bool)

(assert (=> b!136046 (= b_free!2949 (not b_next!2949))))

(declare-fun tp!11302 () Bool)

(declare-fun b_and!8427 () Bool)

(assert (=> b!136046 (= tp!11302 b_and!8427)))

(declare-fun b!136052 () Bool)

(declare-fun b_free!2951 () Bool)

(declare-fun b_next!2951 () Bool)

(assert (=> b!136052 (= b_free!2951 (not b_next!2951))))

(declare-fun tp!11301 () Bool)

(declare-fun b_and!8429 () Bool)

(assert (=> b!136052 (= tp!11301 b_and!8429)))

(declare-fun mapNonEmpty!4695 () Bool)

(declare-fun mapRes!4695 () Bool)

(declare-fun tp!11299 () Bool)

(declare-fun e!88638 () Bool)

(assert (=> mapNonEmpty!4695 (= mapRes!4695 (and tp!11299 e!88638))))

(declare-datatypes ((V!3501 0))(
  ( (V!3502 (val!1490 Int)) )
))
(declare-datatypes ((array!4811 0))(
  ( (array!4812 (arr!2275 (Array (_ BitVec 32) (_ BitVec 64))) (size!2545 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1102 0))(
  ( (ValueCellFull!1102 (v!3222 V!3501)) (EmptyCell!1102) )
))
(declare-datatypes ((array!4813 0))(
  ( (array!4814 (arr!2276 (Array (_ BitVec 32) ValueCell!1102)) (size!2546 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1112 0))(
  ( (LongMapFixedSize!1113 (defaultEntry!2890 Int) (mask!7204 (_ BitVec 32)) (extraKeys!2651 (_ BitVec 32)) (zeroValue!2743 V!3501) (minValue!2743 V!3501) (_size!605 (_ BitVec 32)) (_keys!4643 array!4811) (_values!2873 array!4813) (_vacant!605 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!900 0))(
  ( (Cell!901 (v!3223 LongMapFixedSize!1112)) )
))
(declare-datatypes ((LongMap!900 0))(
  ( (LongMap!901 (underlying!461 Cell!900)) )
))
(declare-fun thiss!992 () LongMap!900)

(declare-fun mapKey!4695 () (_ BitVec 32))

(declare-fun mapRest!4696 () (Array (_ BitVec 32) ValueCell!1102))

(declare-fun mapValue!4696 () ValueCell!1102)

(assert (=> mapNonEmpty!4695 (= (arr!2276 (_values!2873 (v!3223 (underlying!461 thiss!992)))) (store mapRest!4696 mapKey!4695 mapValue!4696))))

(declare-fun b!136044 () Bool)

(declare-fun e!88642 () Bool)

(declare-fun e!88636 () Bool)

(assert (=> b!136044 (= e!88642 e!88636)))

(declare-fun res!65291 () Bool)

(assert (=> b!136044 (=> (not res!65291) (not e!88636))))

(declare-datatypes ((tuple2!2646 0))(
  ( (tuple2!2647 (_1!1334 (_ BitVec 64)) (_2!1334 V!3501)) )
))
(declare-datatypes ((List!1724 0))(
  ( (Nil!1721) (Cons!1720 (h!2326 tuple2!2646) (t!6216 List!1724)) )
))
(declare-datatypes ((ListLongMap!1717 0))(
  ( (ListLongMap!1718 (toList!874 List!1724)) )
))
(declare-fun lt!70961 () ListLongMap!1717)

(declare-fun lt!70963 () ListLongMap!1717)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!136044 (= res!65291 (and (= lt!70963 lt!70961) (not (= (select (arr!2275 (_keys!4643 (v!3223 (underlying!461 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2275 (_keys!4643 (v!3223 (underlying!461 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1112)

(declare-fun map!1417 (LongMapFixedSize!1112) ListLongMap!1717)

(assert (=> b!136044 (= lt!70961 (map!1417 newMap!16))))

(declare-fun getCurrentListMap!550 (array!4811 array!4813 (_ BitVec 32) (_ BitVec 32) V!3501 V!3501 (_ BitVec 32) Int) ListLongMap!1717)

(assert (=> b!136044 (= lt!70963 (getCurrentListMap!550 (_keys!4643 (v!3223 (underlying!461 thiss!992))) (_values!2873 (v!3223 (underlying!461 thiss!992))) (mask!7204 (v!3223 (underlying!461 thiss!992))) (extraKeys!2651 (v!3223 (underlying!461 thiss!992))) (zeroValue!2743 (v!3223 (underlying!461 thiss!992))) (minValue!2743 (v!3223 (underlying!461 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2890 (v!3223 (underlying!461 thiss!992)))))))

(declare-fun b!136045 () Bool)

(declare-fun e!88645 () Bool)

(declare-fun e!88648 () Bool)

(assert (=> b!136045 (= e!88645 e!88648)))

(declare-fun tp_is_empty!2891 () Bool)

(declare-fun e!88637 () Bool)

(declare-fun array_inv!1431 (array!4811) Bool)

(declare-fun array_inv!1432 (array!4813) Bool)

(assert (=> b!136046 (= e!88648 (and tp!11302 tp_is_empty!2891 (array_inv!1431 (_keys!4643 (v!3223 (underlying!461 thiss!992)))) (array_inv!1432 (_values!2873 (v!3223 (underlying!461 thiss!992)))) e!88637))))

(declare-fun b!136047 () Bool)

(declare-fun e!88643 () Bool)

(assert (=> b!136047 (= e!88643 tp_is_empty!2891)))

(declare-fun b!136048 () Bool)

(declare-fun e!88640 () Bool)

(assert (=> b!136048 (= e!88640 (not (bvslt (size!2545 (_keys!4643 (v!3223 (underlying!461 thiss!992)))) #b01111111111111111111111111111111)))))

(declare-fun arrayContainsKey!0 (array!4811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!136048 (arrayContainsKey!0 (_keys!4643 (v!3223 (underlying!461 thiss!992))) (select (arr!2275 (_keys!4643 (v!3223 (underlying!461 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4277 0))(
  ( (Unit!4278) )
))
(declare-fun lt!70962 () Unit!4277)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!129 (array!4811 array!4813 (_ BitVec 32) (_ BitVec 32) V!3501 V!3501 (_ BitVec 64) (_ BitVec 32) Int) Unit!4277)

(assert (=> b!136048 (= lt!70962 (lemmaListMapContainsThenArrayContainsFrom!129 (_keys!4643 (v!3223 (underlying!461 thiss!992))) (_values!2873 (v!3223 (underlying!461 thiss!992))) (mask!7204 (v!3223 (underlying!461 thiss!992))) (extraKeys!2651 (v!3223 (underlying!461 thiss!992))) (zeroValue!2743 (v!3223 (underlying!461 thiss!992))) (minValue!2743 (v!3223 (underlying!461 thiss!992))) (select (arr!2275 (_keys!4643 (v!3223 (underlying!461 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2890 (v!3223 (underlying!461 thiss!992)))))))

(declare-fun mapNonEmpty!4696 () Bool)

(declare-fun mapRes!4696 () Bool)

(declare-fun tp!11300 () Bool)

(declare-fun e!88646 () Bool)

(assert (=> mapNonEmpty!4696 (= mapRes!4696 (and tp!11300 e!88646))))

(declare-fun mapValue!4695 () ValueCell!1102)

(declare-fun mapRest!4695 () (Array (_ BitVec 32) ValueCell!1102))

(declare-fun mapKey!4696 () (_ BitVec 32))

(assert (=> mapNonEmpty!4696 (= (arr!2276 (_values!2873 newMap!16)) (store mapRest!4695 mapKey!4696 mapValue!4695))))

(declare-fun b!136050 () Bool)

(assert (=> b!136050 (= e!88646 tp_is_empty!2891)))

(declare-fun b!136051 () Bool)

(declare-fun res!65296 () Bool)

(assert (=> b!136051 (=> (not res!65296) (not e!88642))))

(declare-fun valid!534 (LongMapFixedSize!1112) Bool)

(assert (=> b!136051 (= res!65296 (valid!534 newMap!16))))

(declare-fun mapIsEmpty!4695 () Bool)

(assert (=> mapIsEmpty!4695 mapRes!4695))

(declare-fun e!88634 () Bool)

(declare-fun e!88639 () Bool)

(assert (=> b!136052 (= e!88634 (and tp!11301 tp_is_empty!2891 (array_inv!1431 (_keys!4643 newMap!16)) (array_inv!1432 (_values!2873 newMap!16)) e!88639))))

(declare-fun b!136053 () Bool)

(assert (=> b!136053 (= e!88636 e!88640)))

(declare-fun res!65294 () Bool)

(assert (=> b!136053 (=> (not res!65294) (not e!88640))))

(declare-fun contains!906 (ListLongMap!1717 (_ BitVec 64)) Bool)

(assert (=> b!136053 (= res!65294 (contains!906 lt!70961 (select (arr!2275 (_keys!4643 (v!3223 (underlying!461 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2648 0))(
  ( (tuple2!2649 (_1!1335 Bool) (_2!1335 LongMapFixedSize!1112)) )
))
(declare-fun lt!70960 () tuple2!2648)

(declare-fun update!199 (LongMapFixedSize!1112 (_ BitVec 64) V!3501) tuple2!2648)

(declare-fun get!1494 (ValueCell!1102 V!3501) V!3501)

(declare-fun dynLambda!430 (Int (_ BitVec 64)) V!3501)

(assert (=> b!136053 (= lt!70960 (update!199 newMap!16 (select (arr!2275 (_keys!4643 (v!3223 (underlying!461 thiss!992)))) from!355) (get!1494 (select (arr!2276 (_values!2873 (v!3223 (underlying!461 thiss!992)))) from!355) (dynLambda!430 (defaultEntry!2890 (v!3223 (underlying!461 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!136054 () Bool)

(declare-fun e!88635 () Bool)

(assert (=> b!136054 (= e!88635 tp_is_empty!2891)))

(declare-fun b!136055 () Bool)

(assert (=> b!136055 (= e!88638 tp_is_empty!2891)))

(declare-fun b!136056 () Bool)

(assert (=> b!136056 (= e!88637 (and e!88643 mapRes!4695))))

(declare-fun condMapEmpty!4696 () Bool)

(declare-fun mapDefault!4695 () ValueCell!1102)

