; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91614 () Bool)

(assert start!91614)

(declare-fun b!1043090 () Bool)

(declare-fun b_free!21079 () Bool)

(declare-fun b_next!21079 () Bool)

(assert (=> b!1043090 (= b_free!21079 (not b_next!21079))))

(declare-fun tp!74472 () Bool)

(declare-fun b_and!33611 () Bool)

(assert (=> b!1043090 (= tp!74472 b_and!33611)))

(declare-fun res!694958 () Bool)

(declare-fun e!590939 () Bool)

(assert (=> start!91614 (=> (not res!694958) (not e!590939))))

(declare-datatypes ((V!37939 0))(
  ( (V!37940 (val!12450 Int)) )
))
(declare-datatypes ((ValueCell!11696 0))(
  ( (ValueCellFull!11696 (v!15041 V!37939)) (EmptyCell!11696) )
))
(declare-datatypes ((array!65758 0))(
  ( (array!65759 (arr!31633 (Array (_ BitVec 32) (_ BitVec 64))) (size!32168 (_ BitVec 32))) )
))
(declare-datatypes ((array!65760 0))(
  ( (array!65761 (arr!31634 (Array (_ BitVec 32) ValueCell!11696)) (size!32169 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5986 0))(
  ( (LongMapFixedSize!5987 (defaultEntry!6375 Int) (mask!30456 (_ BitVec 32)) (extraKeys!6103 (_ BitVec 32)) (zeroValue!6209 V!37939) (minValue!6209 V!37939) (_size!3048 (_ BitVec 32)) (_keys!11631 array!65758) (_values!6398 array!65760) (_vacant!3048 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5986)

(declare-fun valid!2247 (LongMapFixedSize!5986) Bool)

(assert (=> start!91614 (= res!694958 (valid!2247 thiss!1427))))

(assert (=> start!91614 e!590939))

(declare-fun e!590944 () Bool)

(assert (=> start!91614 e!590944))

(assert (=> start!91614 true))

(declare-fun b!1043078 () Bool)

(declare-fun res!694960 () Bool)

(declare-fun e!590942 () Bool)

(assert (=> b!1043078 (=> res!694960 e!590942)))

(assert (=> b!1043078 (= res!694960 (or (not (= (size!32169 (_values!6398 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30456 thiss!1427)))) (not (= (size!32168 (_keys!11631 thiss!1427)) (size!32169 (_values!6398 thiss!1427)))) (bvslt (mask!30456 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6103 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6103 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1043079 () Bool)

(declare-fun res!694954 () Bool)

(assert (=> b!1043079 (=> res!694954 e!590942)))

(declare-datatypes ((List!21981 0))(
  ( (Nil!21978) (Cons!21977 (h!23185 (_ BitVec 64)) (t!31195 List!21981)) )
))
(declare-fun arrayNoDuplicates!0 (array!65758 (_ BitVec 32) List!21981) Bool)

(assert (=> b!1043079 (= res!694954 (not (arrayNoDuplicates!0 (_keys!11631 thiss!1427) #b00000000000000000000000000000000 Nil!21978)))))

(declare-fun b!1043080 () Bool)

(declare-fun res!694955 () Bool)

(assert (=> b!1043080 (=> (not res!694955) (not e!590939))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1043080 (= res!694955 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043081 () Bool)

(declare-fun res!694959 () Bool)

(assert (=> b!1043081 (=> res!694959 e!590942)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043081 (= res!694959 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1043082 () Bool)

(declare-fun e!590943 () Bool)

(assert (=> b!1043082 (= e!590939 e!590943)))

(declare-fun res!694953 () Bool)

(assert (=> b!1043082 (=> (not res!694953) (not e!590943))))

(declare-datatypes ((SeekEntryResult!9823 0))(
  ( (MissingZero!9823 (index!41663 (_ BitVec 32))) (Found!9823 (index!41664 (_ BitVec 32))) (Intermediate!9823 (undefined!10635 Bool) (index!41665 (_ BitVec 32)) (x!93123 (_ BitVec 32))) (Undefined!9823) (MissingVacant!9823 (index!41666 (_ BitVec 32))) )
))
(declare-fun lt!459752 () SeekEntryResult!9823)

(assert (=> b!1043082 (= res!694953 (is-Found!9823 lt!459752))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65758 (_ BitVec 32)) SeekEntryResult!9823)

(assert (=> b!1043082 (= lt!459752 (seekEntry!0 key!909 (_keys!11631 thiss!1427) (mask!30456 thiss!1427)))))

(declare-fun b!1043083 () Bool)

(declare-fun e!590945 () Bool)

(declare-fun tp_is_empty!24799 () Bool)

(assert (=> b!1043083 (= e!590945 tp_is_empty!24799)))

(declare-fun b!1043084 () Bool)

(declare-fun e!590940 () Bool)

(declare-fun e!590946 () Bool)

(declare-fun mapRes!38816 () Bool)

(assert (=> b!1043084 (= e!590940 (and e!590946 mapRes!38816))))

(declare-fun condMapEmpty!38816 () Bool)

(declare-fun mapDefault!38816 () ValueCell!11696)

