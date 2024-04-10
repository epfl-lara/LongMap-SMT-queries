; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90932 () Bool)

(assert start!90932)

(declare-fun b!1038969 () Bool)

(declare-fun b_free!20959 () Bool)

(declare-fun b_next!20959 () Bool)

(assert (=> b!1038969 (= b_free!20959 (not b_next!20959))))

(declare-fun tp!74047 () Bool)

(declare-fun b_and!33491 () Bool)

(assert (=> b!1038969 (= tp!74047 b_and!33491)))

(declare-fun b!1038963 () Bool)

(declare-fun e!587953 () Bool)

(declare-fun e!587955 () Bool)

(assert (=> b!1038963 (= e!587953 (not e!587955))))

(declare-fun res!692962 () Bool)

(assert (=> b!1038963 (=> res!692962 e!587955)))

(declare-datatypes ((V!37779 0))(
  ( (V!37780 (val!12390 Int)) )
))
(declare-datatypes ((ValueCell!11636 0))(
  ( (ValueCellFull!11636 (v!14977 V!37779)) (EmptyCell!11636) )
))
(declare-datatypes ((array!65478 0))(
  ( (array!65479 (arr!31513 (Array (_ BitVec 32) (_ BitVec 64))) (size!32044 (_ BitVec 32))) )
))
(declare-datatypes ((array!65480 0))(
  ( (array!65481 (arr!31514 (Array (_ BitVec 32) ValueCell!11636)) (size!32045 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5866 0))(
  ( (LongMapFixedSize!5867 (defaultEntry!6315 Int) (mask!30269 (_ BitVec 32)) (extraKeys!6043 (_ BitVec 32)) (zeroValue!6149 V!37779) (minValue!6149 V!37779) (_size!2988 (_ BitVec 32)) (_keys!11522 array!65478) (_values!6338 array!65480) (_vacant!2988 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5866)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038963 (= res!692962 (not (validMask!0 (mask!30269 thiss!1427))))))

(declare-fun lt!457930 () array!65478)

(declare-datatypes ((List!21941 0))(
  ( (Nil!21938) (Cons!21937 (h!23141 (_ BitVec 64)) (t!31155 List!21941)) )
))
(declare-fun arrayNoDuplicates!0 (array!65478 (_ BitVec 32) List!21941) Bool)

(assert (=> b!1038963 (arrayNoDuplicates!0 lt!457930 #b00000000000000000000000000000000 Nil!21938)))

(declare-datatypes ((Unit!33985 0))(
  ( (Unit!33986) )
))
(declare-fun lt!457927 () Unit!33985)

(declare-datatypes ((SeekEntryResult!9777 0))(
  ( (MissingZero!9777 (index!41479 (_ BitVec 32))) (Found!9777 (index!41480 (_ BitVec 32))) (Intermediate!9777 (undefined!10589 Bool) (index!41481 (_ BitVec 32)) (x!92721 (_ BitVec 32))) (Undefined!9777) (MissingVacant!9777 (index!41482 (_ BitVec 32))) )
))
(declare-fun lt!457928 () SeekEntryResult!9777)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65478 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21941) Unit!33985)

(assert (=> b!1038963 (= lt!457927 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11522 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41480 lt!457928) #b00000000000000000000000000000000 Nil!21938))))

(declare-fun arrayCountValidKeys!0 (array!65478 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038963 (= (arrayCountValidKeys!0 lt!457930 #b00000000000000000000000000000000 (size!32044 (_keys!11522 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11522 thiss!1427) #b00000000000000000000000000000000 (size!32044 (_keys!11522 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038963 (= lt!457930 (array!65479 (store (arr!31513 (_keys!11522 thiss!1427)) (index!41480 lt!457928) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32044 (_keys!11522 thiss!1427))))))

(declare-fun lt!457929 () Unit!33985)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65478 (_ BitVec 32) (_ BitVec 64)) Unit!33985)

(assert (=> b!1038963 (= lt!457929 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11522 thiss!1427) (index!41480 lt!457928) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038964 () Bool)

(declare-fun e!587959 () Bool)

(declare-fun e!587957 () Bool)

(declare-fun mapRes!38572 () Bool)

(assert (=> b!1038964 (= e!587959 (and e!587957 mapRes!38572))))

(declare-fun condMapEmpty!38572 () Bool)

(declare-fun mapDefault!38572 () ValueCell!11636)

