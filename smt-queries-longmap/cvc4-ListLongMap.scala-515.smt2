; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12846 () Bool)

(assert start!12846)

(declare-fun b!111890 () Bool)

(declare-fun b_free!2577 () Bool)

(declare-fun b_next!2577 () Bool)

(assert (=> b!111890 (= b_free!2577 (not b_next!2577))))

(declare-fun tp!10080 () Bool)

(declare-fun b_and!6883 () Bool)

(assert (=> b!111890 (= tp!10080 b_and!6883)))

(declare-fun b!111879 () Bool)

(declare-fun b_free!2579 () Bool)

(declare-fun b_next!2579 () Bool)

(assert (=> b!111879 (= b_free!2579 (not b_next!2579))))

(declare-fun tp!10077 () Bool)

(declare-fun b_and!6885 () Bool)

(assert (=> b!111879 (= tp!10077 b_and!6885)))

(declare-fun e!72758 () Bool)

(declare-datatypes ((V!3253 0))(
  ( (V!3254 (val!1397 Int)) )
))
(declare-datatypes ((array!4407 0))(
  ( (array!4408 (arr!2089 (Array (_ BitVec 32) (_ BitVec 64))) (size!2347 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1009 0))(
  ( (ValueCellFull!1009 (v!2947 V!3253)) (EmptyCell!1009) )
))
(declare-datatypes ((array!4409 0))(
  ( (array!4410 (arr!2090 (Array (_ BitVec 32) ValueCell!1009)) (size!2348 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!926 0))(
  ( (LongMapFixedSize!927 (defaultEntry!2649 Int) (mask!6827 (_ BitVec 32)) (extraKeys!2442 (_ BitVec 32)) (zeroValue!2518 V!3253) (minValue!2518 V!3253) (_size!512 (_ BitVec 32)) (_keys!4367 array!4407) (_values!2632 array!4409) (_vacant!512 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!926)

(declare-fun tp_is_empty!2705 () Bool)

(declare-fun e!72768 () Bool)

(declare-fun array_inv!1315 (array!4407) Bool)

(declare-fun array_inv!1316 (array!4409) Bool)

(assert (=> b!111879 (= e!72758 (and tp!10077 tp_is_empty!2705 (array_inv!1315 (_keys!4367 newMap!16)) (array_inv!1316 (_values!2632 newMap!16)) e!72768))))

(declare-fun b!111880 () Bool)

(declare-fun e!72754 () Bool)

(declare-fun e!72765 () Bool)

(assert (=> b!111880 (= e!72754 (not e!72765))))

(declare-fun res!55231 () Bool)

(assert (=> b!111880 (=> res!55231 e!72765)))

(declare-datatypes ((Cell!726 0))(
  ( (Cell!727 (v!2948 LongMapFixedSize!926)) )
))
(declare-datatypes ((LongMap!726 0))(
  ( (LongMap!727 (underlying!374 Cell!726)) )
))
(declare-fun thiss!992 () LongMap!726)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!111880 (= res!55231 (not (validMask!0 (mask!6827 (v!2948 (underlying!374 thiss!992))))))))

(declare-datatypes ((tuple2!2450 0))(
  ( (tuple2!2451 (_1!1236 (_ BitVec 64)) (_2!1236 V!3253)) )
))
(declare-datatypes ((List!1636 0))(
  ( (Nil!1633) (Cons!1632 (h!2232 tuple2!2450) (t!5798 List!1636)) )
))
(declare-datatypes ((ListLongMap!1597 0))(
  ( (ListLongMap!1598 (toList!814 List!1636)) )
))
(declare-fun lt!57763 () ListLongMap!1597)

(declare-fun lt!57762 () tuple2!2450)

(declare-fun lt!57766 () tuple2!2450)

(declare-fun +!153 (ListLongMap!1597 tuple2!2450) ListLongMap!1597)

(assert (=> b!111880 (= (+!153 (+!153 lt!57763 lt!57762) lt!57766) (+!153 (+!153 lt!57763 lt!57766) lt!57762))))

(assert (=> b!111880 (= lt!57766 (tuple2!2451 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2518 (v!2948 (underlying!374 thiss!992)))))))

(declare-fun lt!57767 () V!3253)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!111880 (= lt!57762 (tuple2!2451 (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355) lt!57767))))

(declare-datatypes ((Unit!3489 0))(
  ( (Unit!3490) )
))
(declare-fun lt!57771 () Unit!3489)

(declare-fun addCommutativeForDiffKeys!65 (ListLongMap!1597 (_ BitVec 64) V!3253 (_ BitVec 64) V!3253) Unit!3489)

(assert (=> b!111880 (= lt!57771 (addCommutativeForDiffKeys!65 lt!57763 (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355) lt!57767 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2518 (v!2948 (underlying!374 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!119 (array!4407 array!4409 (_ BitVec 32) (_ BitVec 32) V!3253 V!3253 (_ BitVec 32) Int) ListLongMap!1597)

(assert (=> b!111880 (= lt!57763 (getCurrentListMapNoExtraKeys!119 (_keys!4367 (v!2948 (underlying!374 thiss!992))) (_values!2632 (v!2948 (underlying!374 thiss!992))) (mask!6827 (v!2948 (underlying!374 thiss!992))) (extraKeys!2442 (v!2948 (underlying!374 thiss!992))) (zeroValue!2518 (v!2948 (underlying!374 thiss!992))) (minValue!2518 (v!2948 (underlying!374 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2649 (v!2948 (underlying!374 thiss!992)))))))

(declare-fun b!111881 () Bool)

(declare-fun e!72770 () Bool)

(declare-fun e!72760 () Bool)

(assert (=> b!111881 (= e!72770 e!72760)))

(declare-fun res!55228 () Bool)

(assert (=> b!111881 (=> (not res!55228) (not e!72760))))

(declare-fun lt!57768 () ListLongMap!1597)

(declare-fun lt!57769 () ListLongMap!1597)

(assert (=> b!111881 (= res!55228 (= lt!57768 lt!57769))))

(declare-fun map!1303 (LongMapFixedSize!926) ListLongMap!1597)

(assert (=> b!111881 (= lt!57769 (map!1303 newMap!16))))

(declare-fun getCurrentListMap!498 (array!4407 array!4409 (_ BitVec 32) (_ BitVec 32) V!3253 V!3253 (_ BitVec 32) Int) ListLongMap!1597)

(assert (=> b!111881 (= lt!57768 (getCurrentListMap!498 (_keys!4367 (v!2948 (underlying!374 thiss!992))) (_values!2632 (v!2948 (underlying!374 thiss!992))) (mask!6827 (v!2948 (underlying!374 thiss!992))) (extraKeys!2442 (v!2948 (underlying!374 thiss!992))) (zeroValue!2518 (v!2948 (underlying!374 thiss!992))) (minValue!2518 (v!2948 (underlying!374 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2649 (v!2948 (underlying!374 thiss!992)))))))

(declare-fun b!111882 () Bool)

(declare-fun e!72757 () Bool)

(declare-fun e!72771 () Bool)

(assert (=> b!111882 (= e!72757 e!72771)))

(declare-fun b!111883 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4407 (_ BitVec 32)) Bool)

(assert (=> b!111883 (= e!72765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4367 (v!2948 (underlying!374 thiss!992))) (mask!6827 (v!2948 (underlying!374 thiss!992)))))))

(declare-fun b!111884 () Bool)

(declare-fun e!72759 () Bool)

(assert (=> b!111884 (= e!72759 e!72757)))

(declare-fun b!111885 () Bool)

(declare-fun e!72761 () Unit!3489)

(declare-fun Unit!3491 () Unit!3489)

(assert (=> b!111885 (= e!72761 Unit!3491)))

(declare-fun lt!57770 () Unit!3489)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!114 (array!4407 array!4409 (_ BitVec 32) (_ BitVec 32) V!3253 V!3253 (_ BitVec 64) (_ BitVec 32) Int) Unit!3489)

(assert (=> b!111885 (= lt!57770 (lemmaListMapContainsThenArrayContainsFrom!114 (_keys!4367 (v!2948 (underlying!374 thiss!992))) (_values!2632 (v!2948 (underlying!374 thiss!992))) (mask!6827 (v!2948 (underlying!374 thiss!992))) (extraKeys!2442 (v!2948 (underlying!374 thiss!992))) (zeroValue!2518 (v!2948 (underlying!374 thiss!992))) (minValue!2518 (v!2948 (underlying!374 thiss!992))) (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2649 (v!2948 (underlying!374 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!111885 (arrayContainsKey!0 (_keys!4367 (v!2948 (underlying!374 thiss!992))) (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!57765 () Unit!3489)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4407 (_ BitVec 32) (_ BitVec 32)) Unit!3489)

(assert (=> b!111885 (= lt!57765 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4367 (v!2948 (underlying!374 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1637 0))(
  ( (Nil!1634) (Cons!1633 (h!2233 (_ BitVec 64)) (t!5799 List!1637)) )
))
(declare-fun arrayNoDuplicates!0 (array!4407 (_ BitVec 32) List!1637) Bool)

(assert (=> b!111885 (arrayNoDuplicates!0 (_keys!4367 (v!2948 (underlying!374 thiss!992))) from!355 Nil!1634)))

(declare-fun lt!57764 () Unit!3489)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4407 (_ BitVec 32) (_ BitVec 64) List!1637) Unit!3489)

(assert (=> b!111885 (= lt!57764 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4367 (v!2948 (underlying!374 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355) (Cons!1633 (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355) Nil!1634)))))

(assert (=> b!111885 false))

(declare-fun b!111886 () Bool)

(declare-fun res!55223 () Bool)

(assert (=> b!111886 (=> res!55223 e!72765)))

(assert (=> b!111886 (= res!55223 (or (not (= (size!2348 (_values!2632 (v!2948 (underlying!374 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6827 (v!2948 (underlying!374 thiss!992)))))) (not (= (size!2347 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) (size!2348 (_values!2632 (v!2948 (underlying!374 thiss!992)))))) (bvslt (mask!6827 (v!2948 (underlying!374 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2442 (v!2948 (underlying!374 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2442 (v!2948 (underlying!374 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!111887 () Bool)

(declare-fun e!72769 () Bool)

(assert (=> b!111887 (= e!72769 e!72754)))

(declare-fun res!55227 () Bool)

(assert (=> b!111887 (=> (not res!55227) (not e!72754))))

(declare-datatypes ((tuple2!2452 0))(
  ( (tuple2!2453 (_1!1237 Bool) (_2!1237 LongMapFixedSize!926)) )
))
(declare-fun lt!57761 () tuple2!2452)

(assert (=> b!111887 (= res!55227 (and (_1!1237 lt!57761) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!57760 () Unit!3489)

(assert (=> b!111887 (= lt!57760 e!72761)))

(declare-fun c!19954 () Bool)

(declare-fun contains!843 (ListLongMap!1597 (_ BitVec 64)) Bool)

(assert (=> b!111887 (= c!19954 (contains!843 lt!57769 (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355)))))

(declare-fun update!165 (LongMapFixedSize!926 (_ BitVec 64) V!3253) tuple2!2452)

(assert (=> b!111887 (= lt!57761 (update!165 newMap!16 (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355) lt!57767))))

(declare-fun mapIsEmpty!4031 () Bool)

(declare-fun mapRes!4031 () Bool)

(assert (=> mapIsEmpty!4031 mapRes!4031))

(declare-fun b!111888 () Bool)

(declare-fun e!72767 () Bool)

(assert (=> b!111888 (= e!72767 tp_is_empty!2705)))

(declare-fun b!111889 () Bool)

(declare-fun Unit!3492 () Unit!3489)

(assert (=> b!111889 (= e!72761 Unit!3492)))

(declare-fun e!72764 () Bool)

(assert (=> b!111890 (= e!72771 (and tp!10080 tp_is_empty!2705 (array_inv!1315 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) (array_inv!1316 (_values!2632 (v!2948 (underlying!374 thiss!992)))) e!72764))))

(declare-fun b!111891 () Bool)

(declare-fun res!55226 () Bool)

(assert (=> b!111891 (=> (not res!55226) (not e!72770))))

(assert (=> b!111891 (= res!55226 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6827 newMap!16)) (_size!512 (v!2948 (underlying!374 thiss!992)))))))

(declare-fun b!111892 () Bool)

(assert (=> b!111892 (= e!72760 e!72769)))

(declare-fun res!55230 () Bool)

(assert (=> b!111892 (=> (not res!55230) (not e!72769))))

(assert (=> b!111892 (= res!55230 (and (not (= (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2089 (_keys!4367 (v!2948 (underlying!374 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1354 (ValueCell!1009 V!3253) V!3253)

(declare-fun dynLambda!392 (Int (_ BitVec 64)) V!3253)

(assert (=> b!111892 (= lt!57767 (get!1354 (select (arr!2090 (_values!2632 (v!2948 (underlying!374 thiss!992)))) from!355) (dynLambda!392 (defaultEntry!2649 (v!2948 (underlying!374 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!111893 () Bool)

(declare-fun res!55224 () Bool)

(assert (=> b!111893 (=> (not res!55224) (not e!72770))))

(assert (=> b!111893 (= res!55224 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2347 (_keys!4367 (v!2948 (underlying!374 thiss!992)))))))))

(declare-fun b!111894 () Bool)

(declare-fun e!72756 () Bool)

(assert (=> b!111894 (= e!72756 tp_is_empty!2705)))

(declare-fun res!55225 () Bool)

(assert (=> start!12846 (=> (not res!55225) (not e!72770))))

(declare-fun valid!434 (LongMap!726) Bool)

(assert (=> start!12846 (= res!55225 (valid!434 thiss!992))))

(assert (=> start!12846 e!72770))

(assert (=> start!12846 e!72759))

(assert (=> start!12846 true))

(assert (=> start!12846 e!72758))

(declare-fun b!111895 () Bool)

(assert (=> b!111895 (= e!72768 (and e!72767 mapRes!4031))))

(declare-fun condMapEmpty!4031 () Bool)

(declare-fun mapDefault!4032 () ValueCell!1009)

