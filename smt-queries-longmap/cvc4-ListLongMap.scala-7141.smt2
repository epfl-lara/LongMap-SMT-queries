; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90726 () Bool)

(assert start!90726)

(declare-fun b!1037422 () Bool)

(declare-fun b_free!20903 () Bool)

(declare-fun b_next!20903 () Bool)

(assert (=> b!1037422 (= b_free!20903 (not b_next!20903))))

(declare-fun tp!73855 () Bool)

(declare-fun b_and!33435 () Bool)

(assert (=> b!1037422 (= tp!73855 b_and!33435)))

(declare-fun b!1037417 () Bool)

(declare-fun e!586849 () Bool)

(declare-datatypes ((V!37703 0))(
  ( (V!37704 (val!12362 Int)) )
))
(declare-datatypes ((ValueCell!11608 0))(
  ( (ValueCellFull!11608 (v!14945 V!37703)) (EmptyCell!11608) )
))
(declare-datatypes ((array!65350 0))(
  ( (array!65351 (arr!31457 (Array (_ BitVec 32) (_ BitVec 64))) (size!31987 (_ BitVec 32))) )
))
(declare-datatypes ((array!65352 0))(
  ( (array!65353 (arr!31458 (Array (_ BitVec 32) ValueCell!11608)) (size!31988 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5810 0))(
  ( (LongMapFixedSize!5811 (defaultEntry!6287 Int) (mask!30206 (_ BitVec 32)) (extraKeys!6015 (_ BitVec 32)) (zeroValue!6121 V!37703) (minValue!6121 V!37703) (_size!2960 (_ BitVec 32)) (_keys!11483 array!65350) (_values!6310 array!65352) (_vacant!2960 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5810)

(assert (=> b!1037417 (= e!586849 (not (or (bvsge (size!31987 (_keys!11483 thiss!1427)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!31987 (_keys!11483 thiss!1427))))))))

(declare-datatypes ((SeekEntryResult!9755 0))(
  ( (MissingZero!9755 (index!41391 (_ BitVec 32))) (Found!9755 (index!41392 (_ BitVec 32))) (Intermediate!9755 (undefined!10567 Bool) (index!41393 (_ BitVec 32)) (x!92546 (_ BitVec 32))) (Undefined!9755) (MissingVacant!9755 (index!41394 (_ BitVec 32))) )
))
(declare-fun lt!457487 () SeekEntryResult!9755)

(declare-fun arrayCountValidKeys!0 (array!65350 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037417 (= (arrayCountValidKeys!0 (array!65351 (store (arr!31457 (_keys!11483 thiss!1427)) (index!41392 lt!457487) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31987 (_keys!11483 thiss!1427))) #b00000000000000000000000000000000 (size!31987 (_keys!11483 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11483 thiss!1427) #b00000000000000000000000000000000 (size!31987 (_keys!11483 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33953 0))(
  ( (Unit!33954) )
))
(declare-fun lt!457486 () Unit!33953)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65350 (_ BitVec 32) (_ BitVec 64)) Unit!33953)

(assert (=> b!1037417 (= lt!457486 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11483 thiss!1427) (index!41392 lt!457487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38463 () Bool)

(declare-fun mapRes!38463 () Bool)

(assert (=> mapIsEmpty!38463 mapRes!38463))

(declare-fun b!1037418 () Bool)

(declare-fun e!586852 () Bool)

(declare-fun tp_is_empty!24623 () Bool)

(assert (=> b!1037418 (= e!586852 tp_is_empty!24623)))

(declare-fun b!1037419 () Bool)

(declare-fun e!586847 () Bool)

(assert (=> b!1037419 (= e!586847 e!586849)))

(declare-fun res!692176 () Bool)

(assert (=> b!1037419 (=> (not res!692176) (not e!586849))))

(assert (=> b!1037419 (= res!692176 (is-Found!9755 lt!457487))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65350 (_ BitVec 32)) SeekEntryResult!9755)

(assert (=> b!1037419 (= lt!457487 (seekEntry!0 key!909 (_keys!11483 thiss!1427) (mask!30206 thiss!1427)))))

(declare-fun mapNonEmpty!38463 () Bool)

(declare-fun tp!73854 () Bool)

(assert (=> mapNonEmpty!38463 (= mapRes!38463 (and tp!73854 e!586852))))

(declare-fun mapKey!38463 () (_ BitVec 32))

(declare-fun mapRest!38463 () (Array (_ BitVec 32) ValueCell!11608))

(declare-fun mapValue!38463 () ValueCell!11608)

(assert (=> mapNonEmpty!38463 (= (arr!31458 (_values!6310 thiss!1427)) (store mapRest!38463 mapKey!38463 mapValue!38463))))

(declare-fun res!692178 () Bool)

(assert (=> start!90726 (=> (not res!692178) (not e!586847))))

(declare-fun valid!2190 (LongMapFixedSize!5810) Bool)

(assert (=> start!90726 (= res!692178 (valid!2190 thiss!1427))))

(assert (=> start!90726 e!586847))

(declare-fun e!586848 () Bool)

(assert (=> start!90726 e!586848))

(assert (=> start!90726 true))

(declare-fun b!1037420 () Bool)

(declare-fun e!586851 () Bool)

(assert (=> b!1037420 (= e!586851 tp_is_empty!24623)))

(declare-fun b!1037421 () Bool)

(declare-fun res!692177 () Bool)

(assert (=> b!1037421 (=> (not res!692177) (not e!586847))))

(assert (=> b!1037421 (= res!692177 (not (= key!909 (bvneg key!909))))))

(declare-fun e!586850 () Bool)

(declare-fun array_inv!24331 (array!65350) Bool)

(declare-fun array_inv!24332 (array!65352) Bool)

(assert (=> b!1037422 (= e!586848 (and tp!73855 tp_is_empty!24623 (array_inv!24331 (_keys!11483 thiss!1427)) (array_inv!24332 (_values!6310 thiss!1427)) e!586850))))

(declare-fun b!1037423 () Bool)

(assert (=> b!1037423 (= e!586850 (and e!586851 mapRes!38463))))

(declare-fun condMapEmpty!38463 () Bool)

(declare-fun mapDefault!38463 () ValueCell!11608)

