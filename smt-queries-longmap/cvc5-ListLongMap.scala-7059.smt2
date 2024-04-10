; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89408 () Bool)

(assert start!89408)

(declare-fun b!1025092 () Bool)

(declare-fun b_free!20407 () Bool)

(declare-fun b_next!20407 () Bool)

(assert (=> b!1025092 (= b_free!20407 (not b_next!20407))))

(declare-fun tp!72267 () Bool)

(declare-fun b_and!32653 () Bool)

(assert (=> b!1025092 (= tp!72267 b_and!32653)))

(declare-fun b!1025089 () Bool)

(declare-fun e!577942 () Bool)

(declare-fun e!577940 () Bool)

(assert (=> b!1025089 (= e!577942 (not e!577940))))

(declare-fun res!686312 () Bool)

(assert (=> b!1025089 (=> res!686312 e!577940)))

(declare-datatypes ((V!37043 0))(
  ( (V!37044 (val!12114 Int)) )
))
(declare-datatypes ((ValueCell!11360 0))(
  ( (ValueCellFull!11360 (v!14683 V!37043)) (EmptyCell!11360) )
))
(declare-datatypes ((array!64304 0))(
  ( (array!64305 (arr!30961 (Array (_ BitVec 32) (_ BitVec 64))) (size!31474 (_ BitVec 32))) )
))
(declare-datatypes ((array!64306 0))(
  ( (array!64307 (arr!30962 (Array (_ BitVec 32) ValueCell!11360)) (size!31475 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5314 0))(
  ( (LongMapFixedSize!5315 (defaultEntry!6009 Int) (mask!29673 (_ BitVec 32)) (extraKeys!5741 (_ BitVec 32)) (zeroValue!5845 V!37043) (minValue!5845 V!37043) (_size!2712 (_ BitVec 32)) (_keys!11156 array!64304) (_values!6032 array!64306) (_vacant!2712 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5314)

(assert (=> b!1025089 (= res!686312 (or (bvsge (size!31474 (_keys!11156 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31474 (_keys!11156 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9608 0))(
  ( (MissingZero!9608 (index!40803 (_ BitVec 32))) (Found!9608 (index!40804 (_ BitVec 32))) (Intermediate!9608 (undefined!10420 Bool) (index!40805 (_ BitVec 32)) (x!91150 (_ BitVec 32))) (Undefined!9608) (MissingVacant!9608 (index!40806 (_ BitVec 32))) )
))
(declare-fun lt!450795 () SeekEntryResult!9608)

(declare-fun arrayCountValidKeys!0 (array!64304 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025089 (= (arrayCountValidKeys!0 (array!64305 (store (arr!30961 (_keys!11156 thiss!1427)) (index!40804 lt!450795) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31474 (_keys!11156 thiss!1427))) #b00000000000000000000000000000000 (size!31474 (_keys!11156 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11156 thiss!1427) #b00000000000000000000000000000000 (size!31474 (_keys!11156 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33373 0))(
  ( (Unit!33374) )
))
(declare-fun lt!450794 () Unit!33373)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64304 (_ BitVec 32) (_ BitVec 64)) Unit!33373)

(assert (=> b!1025089 (= lt!450794 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11156 thiss!1427) (index!40804 lt!450795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37619 () Bool)

(declare-fun mapRes!37619 () Bool)

(assert (=> mapIsEmpty!37619 mapRes!37619))

(declare-fun b!1025090 () Bool)

(declare-fun e!577938 () Bool)

(assert (=> b!1025090 (= e!577938 e!577942)))

(declare-fun res!686310 () Bool)

(assert (=> b!1025090 (=> (not res!686310) (not e!577942))))

(assert (=> b!1025090 (= res!686310 (is-Found!9608 lt!450795))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64304 (_ BitVec 32)) SeekEntryResult!9608)

(assert (=> b!1025090 (= lt!450795 (seekEntry!0 key!909 (_keys!11156 thiss!1427) (mask!29673 thiss!1427)))))

(declare-fun b!1025091 () Bool)

(declare-fun res!686315 () Bool)

(assert (=> b!1025091 (=> (not res!686315) (not e!577938))))

(assert (=> b!1025091 (= res!686315 (not (= key!909 (bvneg key!909))))))

(declare-fun e!577935 () Bool)

(declare-fun e!577937 () Bool)

(declare-fun tp_is_empty!24127 () Bool)

(declare-fun array_inv!23977 (array!64304) Bool)

(declare-fun array_inv!23978 (array!64306) Bool)

(assert (=> b!1025092 (= e!577937 (and tp!72267 tp_is_empty!24127 (array_inv!23977 (_keys!11156 thiss!1427)) (array_inv!23978 (_values!6032 thiss!1427)) e!577935))))

(declare-fun b!1025093 () Bool)

(declare-fun res!686314 () Bool)

(assert (=> b!1025093 (=> res!686314 e!577940)))

(declare-datatypes ((List!21743 0))(
  ( (Nil!21740) (Cons!21739 (h!22937 (_ BitVec 64)) (t!30805 List!21743)) )
))
(declare-fun contains!5959 (List!21743 (_ BitVec 64)) Bool)

(assert (=> b!1025093 (= res!686314 (contains!5959 Nil!21740 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!686309 () Bool)

(assert (=> start!89408 (=> (not res!686309) (not e!577938))))

(declare-fun valid!2020 (LongMapFixedSize!5314) Bool)

(assert (=> start!89408 (= res!686309 (valid!2020 thiss!1427))))

(assert (=> start!89408 e!577938))

(assert (=> start!89408 e!577937))

(assert (=> start!89408 true))

(declare-fun b!1025094 () Bool)

(declare-fun res!686311 () Bool)

(assert (=> b!1025094 (=> res!686311 e!577940)))

(assert (=> b!1025094 (= res!686311 (contains!5959 Nil!21740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025095 () Bool)

(declare-fun e!577936 () Bool)

(assert (=> b!1025095 (= e!577936 tp_is_empty!24127)))

(declare-fun b!1025096 () Bool)

(declare-fun e!577941 () Bool)

(assert (=> b!1025096 (= e!577935 (and e!577941 mapRes!37619))))

(declare-fun condMapEmpty!37619 () Bool)

(declare-fun mapDefault!37619 () ValueCell!11360)

