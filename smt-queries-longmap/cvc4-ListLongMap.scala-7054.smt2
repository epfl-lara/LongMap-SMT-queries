; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89382 () Bool)

(assert start!89382)

(declare-fun b!1024668 () Bool)

(declare-fun b_free!20381 () Bool)

(declare-fun b_next!20381 () Bool)

(assert (=> b!1024668 (= b_free!20381 (not b_next!20381))))

(declare-fun tp!72188 () Bool)

(declare-fun b_and!32627 () Bool)

(assert (=> b!1024668 (= tp!72188 b_and!32627)))

(declare-fun b!1024660 () Bool)

(declare-fun e!577630 () Bool)

(declare-fun tp_is_empty!24101 () Bool)

(assert (=> b!1024660 (= e!577630 tp_is_empty!24101)))

(declare-fun b!1024661 () Bool)

(declare-fun e!577626 () Bool)

(assert (=> b!1024661 (= e!577626 true)))

(declare-fun lt!450677 () Bool)

(declare-datatypes ((V!37007 0))(
  ( (V!37008 (val!12101 Int)) )
))
(declare-datatypes ((ValueCell!11347 0))(
  ( (ValueCellFull!11347 (v!14670 V!37007)) (EmptyCell!11347) )
))
(declare-datatypes ((array!64252 0))(
  ( (array!64253 (arr!30935 (Array (_ BitVec 32) (_ BitVec 64))) (size!31448 (_ BitVec 32))) )
))
(declare-datatypes ((array!64254 0))(
  ( (array!64255 (arr!30936 (Array (_ BitVec 32) ValueCell!11347)) (size!31449 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5288 0))(
  ( (LongMapFixedSize!5289 (defaultEntry!5996 Int) (mask!29650 (_ BitVec 32)) (extraKeys!5728 (_ BitVec 32)) (zeroValue!5832 V!37007) (minValue!5832 V!37007) (_size!2699 (_ BitVec 32)) (_keys!11143 array!64252) (_values!6019 array!64254) (_vacant!2699 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5288)

(declare-datatypes ((List!21734 0))(
  ( (Nil!21731) (Cons!21730 (h!22928 (_ BitVec 64)) (t!30796 List!21734)) )
))
(declare-fun arrayNoDuplicates!0 (array!64252 (_ BitVec 32) List!21734) Bool)

(assert (=> b!1024661 (= lt!450677 (arrayNoDuplicates!0 (_keys!11143 thiss!1427) #b00000000000000000000000000000000 Nil!21731))))

(declare-fun b!1024662 () Bool)

(declare-fun res!686041 () Bool)

(declare-fun e!577628 () Bool)

(assert (=> b!1024662 (=> (not res!686041) (not e!577628))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024662 (= res!686041 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024663 () Bool)

(declare-fun e!577629 () Bool)

(assert (=> b!1024663 (= e!577629 (not e!577626))))

(declare-fun res!686042 () Bool)

(assert (=> b!1024663 (=> res!686042 e!577626)))

(assert (=> b!1024663 (= res!686042 (or (bvsge (size!31448 (_keys!11143 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31448 (_keys!11143 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9600 0))(
  ( (MissingZero!9600 (index!40771 (_ BitVec 32))) (Found!9600 (index!40772 (_ BitVec 32))) (Intermediate!9600 (undefined!10412 Bool) (index!40773 (_ BitVec 32)) (x!91102 (_ BitVec 32))) (Undefined!9600) (MissingVacant!9600 (index!40774 (_ BitVec 32))) )
))
(declare-fun lt!450678 () SeekEntryResult!9600)

(declare-fun arrayCountValidKeys!0 (array!64252 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024663 (= (arrayCountValidKeys!0 (array!64253 (store (arr!30935 (_keys!11143 thiss!1427)) (index!40772 lt!450678) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31448 (_keys!11143 thiss!1427))) #b00000000000000000000000000000000 (size!31448 (_keys!11143 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11143 thiss!1427) #b00000000000000000000000000000000 (size!31448 (_keys!11143 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33359 0))(
  ( (Unit!33360) )
))
(declare-fun lt!450676 () Unit!33359)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64252 (_ BitVec 32) (_ BitVec 64)) Unit!33359)

(assert (=> b!1024663 (= lt!450676 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11143 thiss!1427) (index!40772 lt!450678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!686036 () Bool)

(assert (=> start!89382 (=> (not res!686036) (not e!577628))))

(declare-fun valid!2013 (LongMapFixedSize!5288) Bool)

(assert (=> start!89382 (= res!686036 (valid!2013 thiss!1427))))

(assert (=> start!89382 e!577628))

(declare-fun e!577623 () Bool)

(assert (=> start!89382 e!577623))

(assert (=> start!89382 true))

(declare-fun b!1024664 () Bool)

(declare-fun res!686038 () Bool)

(assert (=> b!1024664 (=> res!686038 e!577626)))

(declare-fun contains!5950 (List!21734 (_ BitVec 64)) Bool)

(assert (=> b!1024664 (= res!686038 (contains!5950 Nil!21731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024665 () Bool)

(declare-fun res!686037 () Bool)

(assert (=> b!1024665 (=> res!686037 e!577626)))

(assert (=> b!1024665 (= res!686037 (contains!5950 Nil!21731 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024666 () Bool)

(declare-fun e!577625 () Bool)

(assert (=> b!1024666 (= e!577625 tp_is_empty!24101)))

(declare-fun b!1024667 () Bool)

(declare-fun res!686039 () Bool)

(assert (=> b!1024667 (=> res!686039 e!577626)))

(declare-fun noDuplicate!1466 (List!21734) Bool)

(assert (=> b!1024667 (= res!686039 (not (noDuplicate!1466 Nil!21731)))))

(declare-fun mapNonEmpty!37580 () Bool)

(declare-fun mapRes!37580 () Bool)

(declare-fun tp!72189 () Bool)

(assert (=> mapNonEmpty!37580 (= mapRes!37580 (and tp!72189 e!577625))))

(declare-fun mapRest!37580 () (Array (_ BitVec 32) ValueCell!11347))

(declare-fun mapKey!37580 () (_ BitVec 32))

(declare-fun mapValue!37580 () ValueCell!11347)

(assert (=> mapNonEmpty!37580 (= (arr!30936 (_values!6019 thiss!1427)) (store mapRest!37580 mapKey!37580 mapValue!37580))))

(declare-fun e!577624 () Bool)

(declare-fun array_inv!23963 (array!64252) Bool)

(declare-fun array_inv!23964 (array!64254) Bool)

(assert (=> b!1024668 (= e!577623 (and tp!72188 tp_is_empty!24101 (array_inv!23963 (_keys!11143 thiss!1427)) (array_inv!23964 (_values!6019 thiss!1427)) e!577624))))

(declare-fun b!1024669 () Bool)

(assert (=> b!1024669 (= e!577624 (and e!577630 mapRes!37580))))

(declare-fun condMapEmpty!37580 () Bool)

(declare-fun mapDefault!37580 () ValueCell!11347)

