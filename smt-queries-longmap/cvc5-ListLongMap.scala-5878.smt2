; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75798 () Bool)

(assert start!75798)

(declare-fun b!891589 () Bool)

(declare-fun b_free!15769 () Bool)

(declare-fun b_next!15769 () Bool)

(assert (=> b!891589 (= b_free!15769 (not b_next!15769))))

(declare-fun tp!55275 () Bool)

(declare-fun b_and!26009 () Bool)

(assert (=> b!891589 (= tp!55275 b_and!26009)))

(declare-fun b!891583 () Bool)

(declare-fun e!497542 () Bool)

(declare-fun e!497543 () Bool)

(assert (=> b!891583 (= e!497542 e!497543)))

(declare-fun res!604062 () Bool)

(assert (=> b!891583 (=> res!604062 e!497543)))

(declare-datatypes ((array!52174 0))(
  ( (array!52175 (arr!25093 (Array (_ BitVec 32) (_ BitVec 64))) (size!25537 (_ BitVec 32))) )
))
(declare-datatypes ((V!29095 0))(
  ( (V!29096 (val!9099 Int)) )
))
(declare-datatypes ((ValueCell!8567 0))(
  ( (ValueCellFull!8567 (v!11577 V!29095)) (EmptyCell!8567) )
))
(declare-datatypes ((array!52176 0))(
  ( (array!52177 (arr!25094 (Array (_ BitVec 32) ValueCell!8567)) (size!25538 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4150 0))(
  ( (LongMapFixedSize!4151 (defaultEntry!5272 Int) (mask!25769 (_ BitVec 32)) (extraKeys!4966 (_ BitVec 32)) (zeroValue!5070 V!29095) (minValue!5070 V!29095) (_size!2130 (_ BitVec 32)) (_keys!9955 array!52174) (_values!5257 array!52176) (_vacant!2130 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4150)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891583 (= res!604062 (not (validMask!0 (mask!25769 thiss!1181))))))

(declare-datatypes ((tuple2!11956 0))(
  ( (tuple2!11957 (_1!5989 (_ BitVec 64)) (_2!5989 V!29095)) )
))
(declare-datatypes ((List!17749 0))(
  ( (Nil!17746) (Cons!17745 (h!18876 tuple2!11956) (t!25048 List!17749)) )
))
(declare-datatypes ((ListLongMap!10653 0))(
  ( (ListLongMap!10654 (toList!5342 List!17749)) )
))
(declare-fun lt!402765 () ListLongMap!10653)

(declare-datatypes ((SeekEntryResult!8827 0))(
  ( (MissingZero!8827 (index!37679 (_ BitVec 32))) (Found!8827 (index!37680 (_ BitVec 32))) (Intermediate!8827 (undefined!9639 Bool) (index!37681 (_ BitVec 32)) (x!75763 (_ BitVec 32))) (Undefined!8827) (MissingVacant!8827 (index!37682 (_ BitVec 32))) )
))
(declare-fun lt!402766 () SeekEntryResult!8827)

(declare-fun contains!4344 (ListLongMap!10653 (_ BitVec 64)) Bool)

(assert (=> b!891583 (contains!4344 lt!402765 (select (arr!25093 (_keys!9955 thiss!1181)) (index!37680 lt!402766)))))

(declare-fun getCurrentListMap!2625 (array!52174 array!52176 (_ BitVec 32) (_ BitVec 32) V!29095 V!29095 (_ BitVec 32) Int) ListLongMap!10653)

(assert (=> b!891583 (= lt!402765 (getCurrentListMap!2625 (_keys!9955 thiss!1181) (_values!5257 thiss!1181) (mask!25769 thiss!1181) (extraKeys!4966 thiss!1181) (zeroValue!5070 thiss!1181) (minValue!5070 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5272 thiss!1181)))))

(declare-datatypes ((Unit!30350 0))(
  ( (Unit!30351) )
))
(declare-fun lt!402762 () Unit!30350)

(declare-fun lemmaValidKeyInArrayIsInListMap!214 (array!52174 array!52176 (_ BitVec 32) (_ BitVec 32) V!29095 V!29095 (_ BitVec 32) Int) Unit!30350)

(assert (=> b!891583 (= lt!402762 (lemmaValidKeyInArrayIsInListMap!214 (_keys!9955 thiss!1181) (_values!5257 thiss!1181) (mask!25769 thiss!1181) (extraKeys!4966 thiss!1181) (zeroValue!5070 thiss!1181) (minValue!5070 thiss!1181) (index!37680 lt!402766) (defaultEntry!5272 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891583 (arrayContainsKey!0 (_keys!9955 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402764 () Unit!30350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52174 (_ BitVec 64) (_ BitVec 32)) Unit!30350)

(assert (=> b!891583 (= lt!402764 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9955 thiss!1181) key!785 (index!37680 lt!402766)))))

(declare-fun b!891584 () Bool)

(declare-fun res!604063 () Bool)

(assert (=> b!891584 (=> res!604063 e!497543)))

(assert (=> b!891584 (= res!604063 (or (not (= (size!25538 (_values!5257 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25769 thiss!1181)))) (not (= (size!25537 (_keys!9955 thiss!1181)) (size!25538 (_values!5257 thiss!1181)))) (bvslt (mask!25769 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4966 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4966 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891585 () Bool)

(declare-fun res!604067 () Bool)

(assert (=> b!891585 (=> res!604067 e!497543)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52174 (_ BitVec 32)) Bool)

(assert (=> b!891585 (= res!604067 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9955 thiss!1181) (mask!25769 thiss!1181))))))

(declare-fun b!891586 () Bool)

(declare-fun e!497540 () Bool)

(assert (=> b!891586 (= e!497540 (not e!497542))))

(declare-fun res!604060 () Bool)

(assert (=> b!891586 (=> res!604060 e!497542)))

(assert (=> b!891586 (= res!604060 (not (is-Found!8827 lt!402766)))))

(declare-fun e!497546 () Bool)

(assert (=> b!891586 e!497546))

(declare-fun res!604066 () Bool)

(assert (=> b!891586 (=> res!604066 e!497546)))

(assert (=> b!891586 (= res!604066 (not (is-Found!8827 lt!402766)))))

(declare-fun lt!402761 () Unit!30350)

(declare-fun lemmaSeekEntryGivesInRangeIndex!29 (array!52174 array!52176 (_ BitVec 32) (_ BitVec 32) V!29095 V!29095 (_ BitVec 64)) Unit!30350)

(assert (=> b!891586 (= lt!402761 (lemmaSeekEntryGivesInRangeIndex!29 (_keys!9955 thiss!1181) (_values!5257 thiss!1181) (mask!25769 thiss!1181) (extraKeys!4966 thiss!1181) (zeroValue!5070 thiss!1181) (minValue!5070 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52174 (_ BitVec 32)) SeekEntryResult!8827)

(assert (=> b!891586 (= lt!402766 (seekEntry!0 key!785 (_keys!9955 thiss!1181) (mask!25769 thiss!1181)))))

(declare-fun b!891587 () Bool)

(declare-fun res!604064 () Bool)

(assert (=> b!891587 (=> (not res!604064) (not e!497540))))

(assert (=> b!891587 (= res!604064 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891588 () Bool)

(declare-fun e!497544 () Bool)

(declare-fun e!497541 () Bool)

(declare-fun mapRes!28700 () Bool)

(assert (=> b!891588 (= e!497544 (and e!497541 mapRes!28700))))

(declare-fun condMapEmpty!28700 () Bool)

(declare-fun mapDefault!28700 () ValueCell!8567)

