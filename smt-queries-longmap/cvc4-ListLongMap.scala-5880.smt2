; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75814 () Bool)

(assert start!75814)

(declare-fun b!891876 () Bool)

(declare-fun b_free!15785 () Bool)

(declare-fun b_next!15785 () Bool)

(assert (=> b!891876 (= b_free!15785 (not b_next!15785))))

(declare-fun tp!55323 () Bool)

(declare-fun b_and!26025 () Bool)

(assert (=> b!891876 (= tp!55323 b_and!26025)))

(declare-fun b!891871 () Bool)

(declare-fun e!497761 () Bool)

(declare-fun e!497759 () Bool)

(assert (=> b!891871 (= e!497761 e!497759)))

(declare-fun res!604253 () Bool)

(assert (=> b!891871 (=> res!604253 e!497759)))

(declare-datatypes ((array!52206 0))(
  ( (array!52207 (arr!25109 (Array (_ BitVec 32) (_ BitVec 64))) (size!25553 (_ BitVec 32))) )
))
(declare-datatypes ((V!29115 0))(
  ( (V!29116 (val!9107 Int)) )
))
(declare-datatypes ((ValueCell!8575 0))(
  ( (ValueCellFull!8575 (v!11585 V!29115)) (EmptyCell!8575) )
))
(declare-datatypes ((array!52208 0))(
  ( (array!52209 (arr!25110 (Array (_ BitVec 32) ValueCell!8575)) (size!25554 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4166 0))(
  ( (LongMapFixedSize!4167 (defaultEntry!5280 Int) (mask!25781 (_ BitVec 32)) (extraKeys!4974 (_ BitVec 32)) (zeroValue!5078 V!29115) (minValue!5078 V!29115) (_size!2138 (_ BitVec 32)) (_keys!9963 array!52206) (_values!5265 array!52208) (_vacant!2138 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4166)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891871 (= res!604253 (not (validMask!0 (mask!25781 thiss!1181))))))

(declare-datatypes ((tuple2!11972 0))(
  ( (tuple2!11973 (_1!5997 (_ BitVec 64)) (_2!5997 V!29115)) )
))
(declare-datatypes ((List!17764 0))(
  ( (Nil!17761) (Cons!17760 (h!18891 tuple2!11972) (t!25063 List!17764)) )
))
(declare-datatypes ((ListLongMap!10669 0))(
  ( (ListLongMap!10670 (toList!5350 List!17764)) )
))
(declare-fun lt!402907 () ListLongMap!10669)

(declare-datatypes ((SeekEntryResult!8835 0))(
  ( (MissingZero!8835 (index!37711 (_ BitVec 32))) (Found!8835 (index!37712 (_ BitVec 32))) (Intermediate!8835 (undefined!9647 Bool) (index!37713 (_ BitVec 32)) (x!75787 (_ BitVec 32))) (Undefined!8835) (MissingVacant!8835 (index!37714 (_ BitVec 32))) )
))
(declare-fun lt!402906 () SeekEntryResult!8835)

(declare-fun contains!4352 (ListLongMap!10669 (_ BitVec 64)) Bool)

(assert (=> b!891871 (contains!4352 lt!402907 (select (arr!25109 (_keys!9963 thiss!1181)) (index!37712 lt!402906)))))

(declare-fun getCurrentListMap!2633 (array!52206 array!52208 (_ BitVec 32) (_ BitVec 32) V!29115 V!29115 (_ BitVec 32) Int) ListLongMap!10669)

(assert (=> b!891871 (= lt!402907 (getCurrentListMap!2633 (_keys!9963 thiss!1181) (_values!5265 thiss!1181) (mask!25781 thiss!1181) (extraKeys!4974 thiss!1181) (zeroValue!5078 thiss!1181) (minValue!5078 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5280 thiss!1181)))))

(declare-datatypes ((Unit!30366 0))(
  ( (Unit!30367) )
))
(declare-fun lt!402909 () Unit!30366)

(declare-fun lemmaValidKeyInArrayIsInListMap!222 (array!52206 array!52208 (_ BitVec 32) (_ BitVec 32) V!29115 V!29115 (_ BitVec 32) Int) Unit!30366)

(assert (=> b!891871 (= lt!402909 (lemmaValidKeyInArrayIsInListMap!222 (_keys!9963 thiss!1181) (_values!5265 thiss!1181) (mask!25781 thiss!1181) (extraKeys!4974 thiss!1181) (zeroValue!5078 thiss!1181) (minValue!5078 thiss!1181) (index!37712 lt!402906) (defaultEntry!5280 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891871 (arrayContainsKey!0 (_keys!9963 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402908 () Unit!30366)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52206 (_ BitVec 64) (_ BitVec 32)) Unit!30366)

(assert (=> b!891871 (= lt!402908 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9963 thiss!1181) key!785 (index!37712 lt!402906)))))

(declare-fun res!604255 () Bool)

(declare-fun e!497760 () Bool)

(assert (=> start!75814 (=> (not res!604255) (not e!497760))))

(declare-fun valid!1614 (LongMapFixedSize!4166) Bool)

(assert (=> start!75814 (= res!604255 (valid!1614 thiss!1181))))

(assert (=> start!75814 e!497760))

(declare-fun e!497755 () Bool)

(assert (=> start!75814 e!497755))

(assert (=> start!75814 true))

(declare-fun b!891872 () Bool)

(declare-fun res!604256 () Bool)

(assert (=> b!891872 (=> res!604256 e!497759)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52206 (_ BitVec 32)) Bool)

(assert (=> b!891872 (= res!604256 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9963 thiss!1181) (mask!25781 thiss!1181))))))

(declare-fun b!891873 () Bool)

(declare-fun res!604252 () Bool)

(assert (=> b!891873 (=> (not res!604252) (not e!497760))))

(assert (=> b!891873 (= res!604252 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891874 () Bool)

(declare-fun res!604258 () Bool)

(assert (=> b!891874 (=> res!604258 e!497759)))

(assert (=> b!891874 (= res!604258 (or (not (= (size!25554 (_values!5265 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25781 thiss!1181)))) (not (= (size!25553 (_keys!9963 thiss!1181)) (size!25554 (_values!5265 thiss!1181)))) (bvslt (mask!25781 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4974 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4974 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891875 () Bool)

(declare-fun e!497758 () Bool)

(declare-fun tp_is_empty!18113 () Bool)

(assert (=> b!891875 (= e!497758 tp_is_empty!18113)))

(declare-fun e!497756 () Bool)

(declare-fun array_inv!19728 (array!52206) Bool)

(declare-fun array_inv!19729 (array!52208) Bool)

(assert (=> b!891876 (= e!497755 (and tp!55323 tp_is_empty!18113 (array_inv!19728 (_keys!9963 thiss!1181)) (array_inv!19729 (_values!5265 thiss!1181)) e!497756))))

(declare-fun mapNonEmpty!28724 () Bool)

(declare-fun mapRes!28724 () Bool)

(declare-fun tp!55324 () Bool)

(declare-fun e!497757 () Bool)

(assert (=> mapNonEmpty!28724 (= mapRes!28724 (and tp!55324 e!497757))))

(declare-fun mapRest!28724 () (Array (_ BitVec 32) ValueCell!8575))

(declare-fun mapKey!28724 () (_ BitVec 32))

(declare-fun mapValue!28724 () ValueCell!8575)

(assert (=> mapNonEmpty!28724 (= (arr!25110 (_values!5265 thiss!1181)) (store mapRest!28724 mapKey!28724 mapValue!28724))))

(declare-fun mapIsEmpty!28724 () Bool)

(assert (=> mapIsEmpty!28724 mapRes!28724))

(declare-fun b!891877 () Bool)

(assert (=> b!891877 (= e!497757 tp_is_empty!18113)))

(declare-fun b!891878 () Bool)

(assert (=> b!891878 (= e!497759 true)))

(declare-fun lt!402905 () Bool)

(assert (=> b!891878 (= lt!402905 (contains!4352 lt!402907 key!785))))

(declare-fun b!891879 () Bool)

(assert (=> b!891879 (= e!497756 (and e!497758 mapRes!28724))))

(declare-fun condMapEmpty!28724 () Bool)

(declare-fun mapDefault!28724 () ValueCell!8575)

