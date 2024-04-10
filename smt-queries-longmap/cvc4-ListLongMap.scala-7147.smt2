; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90840 () Bool)

(assert start!90840)

(declare-fun b!1038386 () Bool)

(declare-fun b_free!20939 () Bool)

(declare-fun b_next!20939 () Bool)

(assert (=> b!1038386 (= b_free!20939 (not b_next!20939))))

(declare-fun tp!73977 () Bool)

(declare-fun b_and!33471 () Bool)

(assert (=> b!1038386 (= tp!73977 b_and!33471)))

(declare-fun b!1038381 () Bool)

(declare-fun res!692704 () Bool)

(declare-fun e!587519 () Bool)

(assert (=> b!1038381 (=> (not res!692704) (not e!587519))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038381 (= res!692704 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038382 () Bool)

(declare-fun e!587525 () Bool)

(declare-datatypes ((SeekEntryResult!9770 0))(
  ( (MissingZero!9770 (index!41451 (_ BitVec 32))) (Found!9770 (index!41452 (_ BitVec 32))) (Intermediate!9770 (undefined!10582 Bool) (index!41453 (_ BitVec 32)) (x!92649 (_ BitVec 32))) (Undefined!9770) (MissingVacant!9770 (index!41454 (_ BitVec 32))) )
))
(declare-fun lt!457711 () SeekEntryResult!9770)

(declare-datatypes ((V!37751 0))(
  ( (V!37752 (val!12380 Int)) )
))
(declare-datatypes ((ValueCell!11626 0))(
  ( (ValueCellFull!11626 (v!14966 V!37751)) (EmptyCell!11626) )
))
(declare-datatypes ((array!65432 0))(
  ( (array!65433 (arr!31493 (Array (_ BitVec 32) (_ BitVec 64))) (size!32023 (_ BitVec 32))) )
))
(declare-datatypes ((array!65434 0))(
  ( (array!65435 (arr!31494 (Array (_ BitVec 32) ValueCell!11626)) (size!32024 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5846 0))(
  ( (LongMapFixedSize!5847 (defaultEntry!6305 Int) (mask!30241 (_ BitVec 32)) (extraKeys!6033 (_ BitVec 32)) (zeroValue!6139 V!37751) (minValue!6139 V!37751) (_size!2978 (_ BitVec 32)) (_keys!11506 array!65432) (_values!6328 array!65434) (_vacant!2978 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5846)

(assert (=> b!1038382 (= e!587525 true)))

(declare-fun b!1038383 () Bool)

(declare-fun res!692707 () Bool)

(assert (=> b!1038383 (=> res!692707 e!587525)))

(declare-datatypes ((List!21936 0))(
  ( (Nil!21933) (Cons!21932 (h!23135 (_ BitVec 64)) (t!31150 List!21936)) )
))
(declare-fun contains!6037 (List!21936 (_ BitVec 64)) Bool)

(assert (=> b!1038383 (= res!692707 (contains!6037 Nil!21933 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038384 () Bool)

(declare-fun e!587521 () Bool)

(declare-fun tp_is_empty!24659 () Bool)

(assert (=> b!1038384 (= e!587521 tp_is_empty!24659)))

(declare-fun mapIsEmpty!38532 () Bool)

(declare-fun mapRes!38532 () Bool)

(assert (=> mapIsEmpty!38532 mapRes!38532))

(declare-fun b!1038385 () Bool)

(declare-fun e!587520 () Bool)

(assert (=> b!1038385 (= e!587520 (not e!587525))))

(declare-fun res!692706 () Bool)

(assert (=> b!1038385 (=> res!692706 e!587525)))

(assert (=> b!1038385 (= res!692706 (or (bvsge (size!32023 (_keys!11506 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32023 (_keys!11506 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65432 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038385 (= (arrayCountValidKeys!0 (array!65433 (store (arr!31493 (_keys!11506 thiss!1427)) (index!41452 lt!457711) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32023 (_keys!11506 thiss!1427))) #b00000000000000000000000000000000 (size!32023 (_keys!11506 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11506 thiss!1427) #b00000000000000000000000000000000 (size!32023 (_keys!11506 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33975 0))(
  ( (Unit!33976) )
))
(declare-fun lt!457710 () Unit!33975)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65432 (_ BitVec 32) (_ BitVec 64)) Unit!33975)

(assert (=> b!1038385 (= lt!457710 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11506 thiss!1427) (index!41452 lt!457711) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587524 () Bool)

(declare-fun e!587522 () Bool)

(declare-fun array_inv!24351 (array!65432) Bool)

(declare-fun array_inv!24352 (array!65434) Bool)

(assert (=> b!1038386 (= e!587524 (and tp!73977 tp_is_empty!24659 (array_inv!24351 (_keys!11506 thiss!1427)) (array_inv!24352 (_values!6328 thiss!1427)) e!587522))))

(declare-fun b!1038387 () Bool)

(declare-fun res!692709 () Bool)

(assert (=> b!1038387 (=> res!692709 e!587525)))

(declare-fun noDuplicate!1484 (List!21936) Bool)

(assert (=> b!1038387 (= res!692709 (not (noDuplicate!1484 Nil!21933)))))

(declare-fun b!1038388 () Bool)

(declare-fun e!587518 () Bool)

(assert (=> b!1038388 (= e!587522 (and e!587518 mapRes!38532))))

(declare-fun condMapEmpty!38532 () Bool)

(declare-fun mapDefault!38532 () ValueCell!11626)

