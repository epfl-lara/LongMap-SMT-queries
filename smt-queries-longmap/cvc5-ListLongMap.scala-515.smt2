; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12842 () Bool)

(assert start!12842)

(declare-fun b!111769 () Bool)

(declare-fun b_free!2569 () Bool)

(declare-fun b_next!2569 () Bool)

(assert (=> b!111769 (= b_free!2569 (not b_next!2569))))

(declare-fun tp!10055 () Bool)

(declare-fun b_and!6867 () Bool)

(assert (=> b!111769 (= tp!10055 b_and!6867)))

(declare-fun b!111767 () Bool)

(declare-fun b_free!2571 () Bool)

(declare-fun b_next!2571 () Bool)

(assert (=> b!111767 (= b_free!2571 (not b_next!2571))))

(declare-fun tp!10056 () Bool)

(declare-fun b_and!6869 () Bool)

(assert (=> b!111767 (= tp!10056 b_and!6869)))

(declare-fun b!111749 () Bool)

(declare-datatypes ((Unit!3481 0))(
  ( (Unit!3482) )
))
(declare-fun e!72649 () Unit!3481)

(declare-fun Unit!3483 () Unit!3481)

(assert (=> b!111749 (= e!72649 Unit!3483)))

(declare-fun lt!57689 () Unit!3481)

(declare-datatypes ((V!3249 0))(
  ( (V!3250 (val!1395 Int)) )
))
(declare-datatypes ((array!4399 0))(
  ( (array!4400 (arr!2085 (Array (_ BitVec 32) (_ BitVec 64))) (size!2343 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1007 0))(
  ( (ValueCellFull!1007 (v!2943 V!3249)) (EmptyCell!1007) )
))
(declare-datatypes ((array!4401 0))(
  ( (array!4402 (arr!2086 (Array (_ BitVec 32) ValueCell!1007)) (size!2344 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!922 0))(
  ( (LongMapFixedSize!923 (defaultEntry!2647 Int) (mask!6825 (_ BitVec 32)) (extraKeys!2440 (_ BitVec 32)) (zeroValue!2516 V!3249) (minValue!2516 V!3249) (_size!510 (_ BitVec 32)) (_keys!4365 array!4399) (_values!2630 array!4401) (_vacant!510 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!722 0))(
  ( (Cell!723 (v!2944 LongMapFixedSize!922)) )
))
(declare-datatypes ((LongMap!722 0))(
  ( (LongMap!723 (underlying!372 Cell!722)) )
))
(declare-fun thiss!992 () LongMap!722)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!112 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 64) (_ BitVec 32) Int) Unit!3481)

(assert (=> b!111749 (= lt!57689 (lemmaListMapContainsThenArrayContainsFrom!112 (_keys!4365 (v!2944 (underlying!372 thiss!992))) (_values!2630 (v!2944 (underlying!372 thiss!992))) (mask!6825 (v!2944 (underlying!372 thiss!992))) (extraKeys!2440 (v!2944 (underlying!372 thiss!992))) (zeroValue!2516 (v!2944 (underlying!372 thiss!992))) (minValue!2516 (v!2944 (underlying!372 thiss!992))) (select (arr!2085 (_keys!4365 (v!2944 (underlying!372 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2944 (underlying!372 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!111749 (arrayContainsKey!0 (_keys!4365 (v!2944 (underlying!372 thiss!992))) (select (arr!2085 (_keys!4365 (v!2944 (underlying!372 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!57699 () Unit!3481)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4399 (_ BitVec 32) (_ BitVec 32)) Unit!3481)

(assert (=> b!111749 (= lt!57699 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4365 (v!2944 (underlying!372 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1632 0))(
  ( (Nil!1629) (Cons!1628 (h!2228 (_ BitVec 64)) (t!5786 List!1632)) )
))
(declare-fun arrayNoDuplicates!0 (array!4399 (_ BitVec 32) List!1632) Bool)

(assert (=> b!111749 (arrayNoDuplicates!0 (_keys!4365 (v!2944 (underlying!372 thiss!992))) from!355 Nil!1629)))

(declare-fun lt!57696 () Unit!3481)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4399 (_ BitVec 32) (_ BitVec 64) List!1632) Unit!3481)

(assert (=> b!111749 (= lt!57696 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4365 (v!2944 (underlying!372 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2085 (_keys!4365 (v!2944 (underlying!372 thiss!992)))) from!355) (Cons!1628 (select (arr!2085 (_keys!4365 (v!2944 (underlying!372 thiss!992)))) from!355) Nil!1629)))))

(assert (=> b!111749 false))

(declare-fun b!111750 () Bool)

(declare-fun e!72663 () Bool)

(declare-fun e!72657 () Bool)

(assert (=> b!111750 (= e!72663 (not e!72657))))

(declare-fun res!55176 () Bool)

(assert (=> b!111750 (=> res!55176 e!72657)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!111750 (= res!55176 (not (validMask!0 (mask!6825 (v!2944 (underlying!372 thiss!992))))))))

(declare-datatypes ((tuple2!2442 0))(
  ( (tuple2!2443 (_1!1232 (_ BitVec 64)) (_2!1232 V!3249)) )
))
(declare-datatypes ((List!1633 0))(
  ( (Nil!1630) (Cons!1629 (h!2229 tuple2!2442) (t!5787 List!1633)) )
))
(declare-datatypes ((ListLongMap!1593 0))(
  ( (ListLongMap!1594 (toList!812 List!1633)) )
))
(declare-fun lt!57695 () ListLongMap!1593)

(declare-fun lt!57694 () tuple2!2442)

(declare-fun lt!57698 () tuple2!2442)

(declare-fun +!151 (ListLongMap!1593 tuple2!2442) ListLongMap!1593)

(assert (=> b!111750 (= (+!151 (+!151 lt!57695 lt!57694) lt!57698) (+!151 (+!151 lt!57695 lt!57698) lt!57694))))

(assert (=> b!111750 (= lt!57698 (tuple2!2443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2944 (underlying!372 thiss!992)))))))

(declare-fun lt!57691 () V!3249)

(assert (=> b!111750 (= lt!57694 (tuple2!2443 (select (arr!2085 (_keys!4365 (v!2944 (underlying!372 thiss!992)))) from!355) lt!57691))))

(declare-fun lt!57693 () Unit!3481)

(declare-fun addCommutativeForDiffKeys!63 (ListLongMap!1593 (_ BitVec 64) V!3249 (_ BitVec 64) V!3249) Unit!3481)

(assert (=> b!111750 (= lt!57693 (addCommutativeForDiffKeys!63 lt!57695 (select (arr!2085 (_keys!4365 (v!2944 (underlying!372 thiss!992)))) from!355) lt!57691 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2516 (v!2944 (underlying!372 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!117 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3249 V!3249 (_ BitVec 32) Int) ListLongMap!1593)

(assert (=> b!111750 (= lt!57695 (getCurrentListMapNoExtraKeys!117 (_keys!4365 (v!2944 (underlying!372 thiss!992))) (_values!2630 (v!2944 (underlying!372 thiss!992))) (mask!6825 (v!2944 (underlying!372 thiss!992))) (extraKeys!2440 (v!2944 (underlying!372 thiss!992))) (zeroValue!2516 (v!2944 (underlying!372 thiss!992))) (minValue!2516 (v!2944 (underlying!372 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2647 (v!2944 (underlying!372 thiss!992)))))))

(declare-fun b!111751 () Bool)

(declare-fun res!55174 () Bool)

(declare-fun e!72651 () Bool)

(assert (=> b!111751 (=> (not res!55174) (not e!72651))))

(declare-fun newMap!16 () LongMapFixedSize!922)

(assert (=> b!111751 (= res!55174 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6825 newMap!16)) (_size!510 (v!2944 (underlying!372 thiss!992)))))))

(declare-fun b!111752 () Bool)

(declare-fun Unit!3484 () Unit!3481)

(assert (=> b!111752 (= e!72649 Unit!3484)))

(declare-fun mapNonEmpty!4019 () Bool)

(declare-fun mapRes!4019 () Bool)

(declare-fun tp!10054 () Bool)

(declare-fun e!72656 () Bool)

(assert (=> mapNonEmpty!4019 (= mapRes!4019 (and tp!10054 e!72656))))

(declare-fun mapValue!4020 () ValueCell!1007)

(declare-fun mapKey!4019 () (_ BitVec 32))

(declare-fun mapRest!4020 () (Array (_ BitVec 32) ValueCell!1007))

(assert (=> mapNonEmpty!4019 (= (arr!2086 (_values!2630 (v!2944 (underlying!372 thiss!992)))) (store mapRest!4020 mapKey!4019 mapValue!4020))))

(declare-fun b!111753 () Bool)

(declare-fun e!72659 () Bool)

(assert (=> b!111753 (= e!72659 e!72663)))

(declare-fun res!55171 () Bool)

(assert (=> b!111753 (=> (not res!55171) (not e!72663))))

(declare-datatypes ((tuple2!2444 0))(
  ( (tuple2!2445 (_1!1233 Bool) (_2!1233 LongMapFixedSize!922)) )
))
(declare-fun lt!57697 () tuple2!2444)

(assert (=> b!111753 (= res!55171 (and (_1!1233 lt!57697) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!57688 () Unit!3481)

(assert (=> b!111753 (= lt!57688 e!72649)))

(declare-fun lt!57690 () ListLongMap!1593)

(declare-fun c!19948 () Bool)

(declare-fun contains!841 (ListLongMap!1593 (_ BitVec 64)) Bool)

(assert (=> b!111753 (= c!19948 (contains!841 lt!57690 (select (arr!2085 (_keys!4365 (v!2944 (underlying!372 thiss!992)))) from!355)))))

(declare-fun update!163 (LongMapFixedSize!922 (_ BitVec 64) V!3249) tuple2!2444)

(assert (=> b!111753 (= lt!57697 (update!163 newMap!16 (select (arr!2085 (_keys!4365 (v!2944 (underlying!372 thiss!992)))) from!355) lt!57691))))

(declare-fun b!111754 () Bool)

(declare-fun res!55172 () Bool)

(assert (=> b!111754 (=> (not res!55172) (not e!72651))))

(assert (=> b!111754 (= res!55172 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2343 (_keys!4365 (v!2944 (underlying!372 thiss!992)))))))))

(declare-fun b!111755 () Bool)

(declare-fun e!72660 () Bool)

(declare-fun e!72650 () Bool)

(assert (=> b!111755 (= e!72660 e!72650)))

(declare-fun b!111756 () Bool)

(declare-fun res!55175 () Bool)

(assert (=> b!111756 (=> (not res!55175) (not e!72651))))

(declare-fun valid!431 (LongMapFixedSize!922) Bool)

(assert (=> b!111756 (= res!55175 (valid!431 newMap!16))))

(declare-fun mapNonEmpty!4020 () Bool)

(declare-fun mapRes!4020 () Bool)

(declare-fun tp!10053 () Bool)

(declare-fun e!72648 () Bool)

(assert (=> mapNonEmpty!4020 (= mapRes!4020 (and tp!10053 e!72648))))

(declare-fun mapRest!4019 () (Array (_ BitVec 32) ValueCell!1007))

(declare-fun mapValue!4019 () ValueCell!1007)

(declare-fun mapKey!4020 () (_ BitVec 32))

(assert (=> mapNonEmpty!4020 (= (arr!2086 (_values!2630 newMap!16)) (store mapRest!4019 mapKey!4020 mapValue!4019))))

(declare-fun b!111757 () Bool)

(declare-fun e!72652 () Bool)

(declare-fun e!72654 () Bool)

(assert (=> b!111757 (= e!72652 (and e!72654 mapRes!4019))))

(declare-fun condMapEmpty!4020 () Bool)

(declare-fun mapDefault!4019 () ValueCell!1007)

