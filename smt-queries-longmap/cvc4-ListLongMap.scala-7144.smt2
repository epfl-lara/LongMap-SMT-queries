; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90786 () Bool)

(assert start!90786)

(declare-fun b!1037892 () Bool)

(declare-fun b_free!20921 () Bool)

(declare-fun b_next!20921 () Bool)

(assert (=> b!1037892 (= b_free!20921 (not b_next!20921))))

(declare-fun tp!73918 () Bool)

(declare-fun b_and!33453 () Bool)

(assert (=> b!1037892 (= tp!73918 b_and!33453)))

(declare-fun b!1037883 () Bool)

(declare-fun res!692410 () Bool)

(declare-fun e!587192 () Bool)

(assert (=> b!1037883 (=> (not res!692410) (not e!587192))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037883 (= res!692410 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037884 () Bool)

(declare-fun res!692411 () Bool)

(declare-fun e!587189 () Bool)

(assert (=> b!1037884 (=> res!692411 e!587189)))

(declare-datatypes ((List!21929 0))(
  ( (Nil!21926) (Cons!21925 (h!23128 (_ BitVec 64)) (t!31143 List!21929)) )
))
(declare-fun noDuplicate!1479 (List!21929) Bool)

(assert (=> b!1037884 (= res!692411 (not (noDuplicate!1479 Nil!21926)))))

(declare-fun mapIsEmpty!38499 () Bool)

(declare-fun mapRes!38499 () Bool)

(assert (=> mapIsEmpty!38499 mapRes!38499))

(declare-fun b!1037886 () Bool)

(declare-fun e!587188 () Bool)

(declare-fun tp_is_empty!24641 () Bool)

(assert (=> b!1037886 (= e!587188 tp_is_empty!24641)))

(declare-fun b!1037887 () Bool)

(declare-fun res!692414 () Bool)

(assert (=> b!1037887 (=> res!692414 e!587189)))

(declare-fun contains!6030 (List!21929 (_ BitVec 64)) Bool)

(assert (=> b!1037887 (= res!692414 (contains!6030 Nil!21926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037888 () Bool)

(declare-fun e!587190 () Bool)

(assert (=> b!1037888 (= e!587190 (not e!587189))))

(declare-fun res!692409 () Bool)

(assert (=> b!1037888 (=> res!692409 e!587189)))

(declare-datatypes ((V!37727 0))(
  ( (V!37728 (val!12371 Int)) )
))
(declare-datatypes ((ValueCell!11617 0))(
  ( (ValueCellFull!11617 (v!14955 V!37727)) (EmptyCell!11617) )
))
(declare-datatypes ((array!65392 0))(
  ( (array!65393 (arr!31475 (Array (_ BitVec 32) (_ BitVec 64))) (size!32005 (_ BitVec 32))) )
))
(declare-datatypes ((array!65394 0))(
  ( (array!65395 (arr!31476 (Array (_ BitVec 32) ValueCell!11617)) (size!32006 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5828 0))(
  ( (LongMapFixedSize!5829 (defaultEntry!6296 Int) (mask!30224 (_ BitVec 32)) (extraKeys!6024 (_ BitVec 32)) (zeroValue!6130 V!37727) (minValue!6130 V!37727) (_size!2969 (_ BitVec 32)) (_keys!11495 array!65392) (_values!6319 array!65394) (_vacant!2969 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5828)

(assert (=> b!1037888 (= res!692409 (or (bvsge (size!32005 (_keys!11495 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32005 (_keys!11495 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9763 0))(
  ( (MissingZero!9763 (index!41423 (_ BitVec 32))) (Found!9763 (index!41424 (_ BitVec 32))) (Intermediate!9763 (undefined!10575 Bool) (index!41425 (_ BitVec 32)) (x!92602 (_ BitVec 32))) (Undefined!9763) (MissingVacant!9763 (index!41426 (_ BitVec 32))) )
))
(declare-fun lt!457601 () SeekEntryResult!9763)

(declare-fun arrayCountValidKeys!0 (array!65392 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037888 (= (arrayCountValidKeys!0 (array!65393 (store (arr!31475 (_keys!11495 thiss!1427)) (index!41424 lt!457601) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32005 (_keys!11495 thiss!1427))) #b00000000000000000000000000000000 (size!32005 (_keys!11495 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11495 thiss!1427) #b00000000000000000000000000000000 (size!32005 (_keys!11495 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33965 0))(
  ( (Unit!33966) )
))
(declare-fun lt!457602 () Unit!33965)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65392 (_ BitVec 32) (_ BitVec 64)) Unit!33965)

(assert (=> b!1037888 (= lt!457602 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11495 thiss!1427) (index!41424 lt!457601) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037889 () Bool)

(declare-fun e!587191 () Bool)

(assert (=> b!1037889 (= e!587191 tp_is_empty!24641)))

(declare-fun b!1037890 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65392 (_ BitVec 32) List!21929) Bool)

(assert (=> b!1037890 (= e!587189 (arrayNoDuplicates!0 (_keys!11495 thiss!1427) #b00000000000000000000000000000000 Nil!21926))))

(declare-fun b!1037891 () Bool)

(declare-fun e!587193 () Bool)

(assert (=> b!1037891 (= e!587193 (and e!587188 mapRes!38499))))

(declare-fun condMapEmpty!38499 () Bool)

(declare-fun mapDefault!38499 () ValueCell!11617)

