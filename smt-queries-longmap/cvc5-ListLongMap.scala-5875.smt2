; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75780 () Bool)

(assert start!75780)

(declare-fun b!891263 () Bool)

(declare-fun b_free!15751 () Bool)

(declare-fun b_next!15751 () Bool)

(assert (=> b!891263 (= b_free!15751 (not b_next!15751))))

(declare-fun tp!55221 () Bool)

(declare-fun b_and!25991 () Bool)

(assert (=> b!891263 (= tp!55221 b_and!25991)))

(declare-fun mapIsEmpty!28673 () Bool)

(declare-fun mapRes!28673 () Bool)

(assert (=> mapIsEmpty!28673 mapRes!28673))

(declare-fun b!891259 () Bool)

(declare-fun e!497303 () Bool)

(declare-fun e!497297 () Bool)

(assert (=> b!891259 (= e!497303 (not e!497297))))

(declare-fun res!603844 () Bool)

(assert (=> b!891259 (=> res!603844 e!497297)))

(declare-datatypes ((SeekEntryResult!8820 0))(
  ( (MissingZero!8820 (index!37651 (_ BitVec 32))) (Found!8820 (index!37652 (_ BitVec 32))) (Intermediate!8820 (undefined!9632 Bool) (index!37653 (_ BitVec 32)) (x!75732 (_ BitVec 32))) (Undefined!8820) (MissingVacant!8820 (index!37654 (_ BitVec 32))) )
))
(declare-fun lt!402603 () SeekEntryResult!8820)

(assert (=> b!891259 (= res!603844 (not (is-Found!8820 lt!402603)))))

(declare-fun e!497301 () Bool)

(assert (=> b!891259 e!497301))

(declare-fun res!603849 () Bool)

(assert (=> b!891259 (=> res!603849 e!497301)))

(assert (=> b!891259 (= res!603849 (not (is-Found!8820 lt!402603)))))

(declare-datatypes ((Unit!30336 0))(
  ( (Unit!30337) )
))
(declare-fun lt!402602 () Unit!30336)

(declare-datatypes ((array!52138 0))(
  ( (array!52139 (arr!25075 (Array (_ BitVec 32) (_ BitVec 64))) (size!25519 (_ BitVec 32))) )
))
(declare-datatypes ((V!29071 0))(
  ( (V!29072 (val!9090 Int)) )
))
(declare-datatypes ((ValueCell!8558 0))(
  ( (ValueCellFull!8558 (v!11568 V!29071)) (EmptyCell!8558) )
))
(declare-datatypes ((array!52140 0))(
  ( (array!52141 (arr!25076 (Array (_ BitVec 32) ValueCell!8558)) (size!25520 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4132 0))(
  ( (LongMapFixedSize!4133 (defaultEntry!5263 Int) (mask!25754 (_ BitVec 32)) (extraKeys!4957 (_ BitVec 32)) (zeroValue!5061 V!29071) (minValue!5061 V!29071) (_size!2121 (_ BitVec 32)) (_keys!9946 array!52138) (_values!5248 array!52140) (_vacant!2121 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4132)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!25 (array!52138 array!52140 (_ BitVec 32) (_ BitVec 32) V!29071 V!29071 (_ BitVec 64)) Unit!30336)

(assert (=> b!891259 (= lt!402602 (lemmaSeekEntryGivesInRangeIndex!25 (_keys!9946 thiss!1181) (_values!5248 thiss!1181) (mask!25754 thiss!1181) (extraKeys!4957 thiss!1181) (zeroValue!5061 thiss!1181) (minValue!5061 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52138 (_ BitVec 32)) SeekEntryResult!8820)

(assert (=> b!891259 (= lt!402603 (seekEntry!0 key!785 (_keys!9946 thiss!1181) (mask!25754 thiss!1181)))))

(declare-fun mapNonEmpty!28673 () Bool)

(declare-fun tp!55222 () Bool)

(declare-fun e!497304 () Bool)

(assert (=> mapNonEmpty!28673 (= mapRes!28673 (and tp!55222 e!497304))))

(declare-fun mapKey!28673 () (_ BitVec 32))

(declare-fun mapRest!28673 () (Array (_ BitVec 32) ValueCell!8558))

(declare-fun mapValue!28673 () ValueCell!8558)

(assert (=> mapNonEmpty!28673 (= (arr!25076 (_values!5248 thiss!1181)) (store mapRest!28673 mapKey!28673 mapValue!28673))))

(declare-fun b!891260 () Bool)

(declare-fun e!497300 () Bool)

(assert (=> b!891260 (= e!497300 true)))

(declare-fun lt!402599 () Bool)

(declare-datatypes ((tuple2!11942 0))(
  ( (tuple2!11943 (_1!5982 (_ BitVec 64)) (_2!5982 V!29071)) )
))
(declare-datatypes ((List!17737 0))(
  ( (Nil!17734) (Cons!17733 (h!18864 tuple2!11942) (t!25036 List!17737)) )
))
(declare-datatypes ((ListLongMap!10639 0))(
  ( (ListLongMap!10640 (toList!5335 List!17737)) )
))
(declare-fun lt!402601 () ListLongMap!10639)

(declare-fun contains!4337 (ListLongMap!10639 (_ BitVec 64)) Bool)

(assert (=> b!891260 (= lt!402599 (contains!4337 lt!402601 key!785))))

(declare-fun b!891261 () Bool)

(assert (=> b!891261 (= e!497297 e!497300)))

(declare-fun res!603846 () Bool)

(assert (=> b!891261 (=> res!603846 e!497300)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891261 (= res!603846 (not (validMask!0 (mask!25754 thiss!1181))))))

(assert (=> b!891261 (contains!4337 lt!402601 (select (arr!25075 (_keys!9946 thiss!1181)) (index!37652 lt!402603)))))

(declare-fun getCurrentListMap!2618 (array!52138 array!52140 (_ BitVec 32) (_ BitVec 32) V!29071 V!29071 (_ BitVec 32) Int) ListLongMap!10639)

(assert (=> b!891261 (= lt!402601 (getCurrentListMap!2618 (_keys!9946 thiss!1181) (_values!5248 thiss!1181) (mask!25754 thiss!1181) (extraKeys!4957 thiss!1181) (zeroValue!5061 thiss!1181) (minValue!5061 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5263 thiss!1181)))))

(declare-fun lt!402600 () Unit!30336)

(declare-fun lemmaValidKeyInArrayIsInListMap!207 (array!52138 array!52140 (_ BitVec 32) (_ BitVec 32) V!29071 V!29071 (_ BitVec 32) Int) Unit!30336)

(assert (=> b!891261 (= lt!402600 (lemmaValidKeyInArrayIsInListMap!207 (_keys!9946 thiss!1181) (_values!5248 thiss!1181) (mask!25754 thiss!1181) (extraKeys!4957 thiss!1181) (zeroValue!5061 thiss!1181) (minValue!5061 thiss!1181) (index!37652 lt!402603) (defaultEntry!5263 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891261 (arrayContainsKey!0 (_keys!9946 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402604 () Unit!30336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52138 (_ BitVec 64) (_ BitVec 32)) Unit!30336)

(assert (=> b!891261 (= lt!402604 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9946 thiss!1181) key!785 (index!37652 lt!402603)))))

(declare-fun b!891262 () Bool)

(declare-fun e!497296 () Bool)

(declare-fun e!497302 () Bool)

(assert (=> b!891262 (= e!497296 (and e!497302 mapRes!28673))))

(declare-fun condMapEmpty!28673 () Bool)

(declare-fun mapDefault!28673 () ValueCell!8558)

