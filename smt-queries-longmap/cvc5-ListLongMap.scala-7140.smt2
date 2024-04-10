; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90716 () Bool)

(assert start!90716)

(declare-fun b!1037316 () Bool)

(declare-fun b_free!20893 () Bool)

(declare-fun b_next!20893 () Bool)

(assert (=> b!1037316 (= b_free!20893 (not b_next!20893))))

(declare-fun tp!73825 () Bool)

(declare-fun b_and!33425 () Bool)

(assert (=> b!1037316 (= tp!73825 b_and!33425)))

(declare-fun b!1037312 () Bool)

(declare-fun e!586743 () Bool)

(declare-fun tp_is_empty!24613 () Bool)

(assert (=> b!1037312 (= e!586743 tp_is_empty!24613)))

(declare-fun b!1037313 () Bool)

(declare-fun e!586744 () Bool)

(assert (=> b!1037313 (= e!586744 (not true))))

(declare-datatypes ((V!37691 0))(
  ( (V!37692 (val!12357 Int)) )
))
(declare-datatypes ((ValueCell!11603 0))(
  ( (ValueCellFull!11603 (v!14940 V!37691)) (EmptyCell!11603) )
))
(declare-datatypes ((array!65330 0))(
  ( (array!65331 (arr!31447 (Array (_ BitVec 32) (_ BitVec 64))) (size!31977 (_ BitVec 32))) )
))
(declare-datatypes ((array!65332 0))(
  ( (array!65333 (arr!31448 (Array (_ BitVec 32) ValueCell!11603)) (size!31978 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5800 0))(
  ( (LongMapFixedSize!5801 (defaultEntry!6282 Int) (mask!30199 (_ BitVec 32)) (extraKeys!6010 (_ BitVec 32)) (zeroValue!6116 V!37691) (minValue!6116 V!37691) (_size!2955 (_ BitVec 32)) (_keys!11478 array!65330) (_values!6305 array!65332) (_vacant!2955 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5800)

(declare-datatypes ((SeekEntryResult!9751 0))(
  ( (MissingZero!9751 (index!41375 (_ BitVec 32))) (Found!9751 (index!41376 (_ BitVec 32))) (Intermediate!9751 (undefined!10563 Bool) (index!41377 (_ BitVec 32)) (x!92534 (_ BitVec 32))) (Undefined!9751) (MissingVacant!9751 (index!41378 (_ BitVec 32))) )
))
(declare-fun lt!457457 () SeekEntryResult!9751)

(declare-fun arrayCountValidKeys!0 (array!65330 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037313 (= (arrayCountValidKeys!0 (array!65331 (store (arr!31447 (_keys!11478 thiss!1427)) (index!41376 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31977 (_keys!11478 thiss!1427))) #b00000000000000000000000000000000 (size!31977 (_keys!11478 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11478 thiss!1427) #b00000000000000000000000000000000 (size!31977 (_keys!11478 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33947 0))(
  ( (Unit!33948) )
))
(declare-fun lt!457456 () Unit!33947)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65330 (_ BitVec 32) (_ BitVec 64)) Unit!33947)

(assert (=> b!1037313 (= lt!457456 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11478 thiss!1427) (index!41376 lt!457457) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037314 () Bool)

(declare-fun e!586746 () Bool)

(assert (=> b!1037314 (= e!586746 tp_is_empty!24613)))

(declare-fun b!1037315 () Bool)

(declare-fun e!586745 () Bool)

(assert (=> b!1037315 (= e!586745 e!586744)))

(declare-fun res!692132 () Bool)

(assert (=> b!1037315 (=> (not res!692132) (not e!586744))))

(assert (=> b!1037315 (= res!692132 (is-Found!9751 lt!457457))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65330 (_ BitVec 32)) SeekEntryResult!9751)

(assert (=> b!1037315 (= lt!457457 (seekEntry!0 key!909 (_keys!11478 thiss!1427) (mask!30199 thiss!1427)))))

(declare-fun mapIsEmpty!38448 () Bool)

(declare-fun mapRes!38448 () Bool)

(assert (=> mapIsEmpty!38448 mapRes!38448))

(declare-fun mapNonEmpty!38448 () Bool)

(declare-fun tp!73824 () Bool)

(assert (=> mapNonEmpty!38448 (= mapRes!38448 (and tp!73824 e!586743))))

(declare-fun mapKey!38448 () (_ BitVec 32))

(declare-fun mapRest!38448 () (Array (_ BitVec 32) ValueCell!11603))

(declare-fun mapValue!38448 () ValueCell!11603)

(assert (=> mapNonEmpty!38448 (= (arr!31448 (_values!6305 thiss!1427)) (store mapRest!38448 mapKey!38448 mapValue!38448))))

(declare-fun e!586741 () Bool)

(declare-fun e!586747 () Bool)

(declare-fun array_inv!24323 (array!65330) Bool)

(declare-fun array_inv!24324 (array!65332) Bool)

(assert (=> b!1037316 (= e!586747 (and tp!73825 tp_is_empty!24613 (array_inv!24323 (_keys!11478 thiss!1427)) (array_inv!24324 (_values!6305 thiss!1427)) e!586741))))

(declare-fun b!1037317 () Bool)

(declare-fun res!692133 () Bool)

(assert (=> b!1037317 (=> (not res!692133) (not e!586745))))

(assert (=> b!1037317 (= res!692133 (not (= key!909 (bvneg key!909))))))

(declare-fun res!692131 () Bool)

(assert (=> start!90716 (=> (not res!692131) (not e!586745))))

(declare-fun valid!2187 (LongMapFixedSize!5800) Bool)

(assert (=> start!90716 (= res!692131 (valid!2187 thiss!1427))))

(assert (=> start!90716 e!586745))

(assert (=> start!90716 e!586747))

(assert (=> start!90716 true))

(declare-fun b!1037318 () Bool)

(assert (=> b!1037318 (= e!586741 (and e!586746 mapRes!38448))))

(declare-fun condMapEmpty!38448 () Bool)

(declare-fun mapDefault!38448 () ValueCell!11603)

