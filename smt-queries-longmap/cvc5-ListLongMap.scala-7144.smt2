; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90782 () Bool)

(assert start!90782)

(declare-fun b!1037821 () Bool)

(declare-fun b_free!20917 () Bool)

(declare-fun b_next!20917 () Bool)

(assert (=> b!1037821 (= b_free!20917 (not b_next!20917))))

(declare-fun tp!73905 () Bool)

(declare-fun b_and!33449 () Bool)

(assert (=> b!1037821 (= tp!73905 b_and!33449)))

(declare-fun b!1037817 () Bool)

(declare-fun res!692368 () Bool)

(declare-fun e!587144 () Bool)

(assert (=> b!1037817 (=> (not res!692368) (not e!587144))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037817 (= res!692368 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037818 () Bool)

(declare-fun e!587143 () Bool)

(declare-datatypes ((V!37723 0))(
  ( (V!37724 (val!12369 Int)) )
))
(declare-datatypes ((ValueCell!11615 0))(
  ( (ValueCellFull!11615 (v!14953 V!37723)) (EmptyCell!11615) )
))
(declare-datatypes ((array!65384 0))(
  ( (array!65385 (arr!31471 (Array (_ BitVec 32) (_ BitVec 64))) (size!32001 (_ BitVec 32))) )
))
(declare-datatypes ((array!65386 0))(
  ( (array!65387 (arr!31472 (Array (_ BitVec 32) ValueCell!11615)) (size!32002 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5824 0))(
  ( (LongMapFixedSize!5825 (defaultEntry!6294 Int) (mask!30222 (_ BitVec 32)) (extraKeys!6022 (_ BitVec 32)) (zeroValue!6128 V!37723) (minValue!6128 V!37723) (_size!2967 (_ BitVec 32)) (_keys!11493 array!65384) (_values!6317 array!65386) (_vacant!2967 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5824)

(declare-datatypes ((List!21927 0))(
  ( (Nil!21924) (Cons!21923 (h!23126 (_ BitVec 64)) (t!31141 List!21927)) )
))
(declare-fun arrayNoDuplicates!0 (array!65384 (_ BitVec 32) List!21927) Bool)

(assert (=> b!1037818 (= e!587143 (arrayNoDuplicates!0 (_keys!11493 thiss!1427) #b00000000000000000000000000000000 Nil!21924))))

(declare-fun res!692372 () Bool)

(assert (=> start!90782 (=> (not res!692372) (not e!587144))))

(declare-fun valid!2195 (LongMapFixedSize!5824) Bool)

(assert (=> start!90782 (= res!692372 (valid!2195 thiss!1427))))

(assert (=> start!90782 e!587144))

(declare-fun e!587140 () Bool)

(assert (=> start!90782 e!587140))

(assert (=> start!90782 true))

(declare-fun b!1037819 () Bool)

(declare-fun e!587141 () Bool)

(declare-fun tp_is_empty!24637 () Bool)

(assert (=> b!1037819 (= e!587141 tp_is_empty!24637)))

(declare-fun b!1037820 () Bool)

(declare-fun e!587145 () Bool)

(assert (=> b!1037820 (= e!587145 tp_is_empty!24637)))

(declare-fun e!587139 () Bool)

(declare-fun array_inv!24339 (array!65384) Bool)

(declare-fun array_inv!24340 (array!65386) Bool)

(assert (=> b!1037821 (= e!587140 (and tp!73905 tp_is_empty!24637 (array_inv!24339 (_keys!11493 thiss!1427)) (array_inv!24340 (_values!6317 thiss!1427)) e!587139))))

(declare-fun mapNonEmpty!38493 () Bool)

(declare-fun mapRes!38493 () Bool)

(declare-fun tp!73906 () Bool)

(assert (=> mapNonEmpty!38493 (= mapRes!38493 (and tp!73906 e!587145))))

(declare-fun mapKey!38493 () (_ BitVec 32))

(declare-fun mapRest!38493 () (Array (_ BitVec 32) ValueCell!11615))

(declare-fun mapValue!38493 () ValueCell!11615)

(assert (=> mapNonEmpty!38493 (= (arr!31472 (_values!6317 thiss!1427)) (store mapRest!38493 mapKey!38493 mapValue!38493))))

(declare-fun b!1037822 () Bool)

(declare-fun res!692369 () Bool)

(assert (=> b!1037822 (=> res!692369 e!587143)))

(declare-fun contains!6028 (List!21927 (_ BitVec 64)) Bool)

(assert (=> b!1037822 (= res!692369 (contains!6028 Nil!21924 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037823 () Bool)

(declare-fun e!587142 () Bool)

(assert (=> b!1037823 (= e!587144 e!587142)))

(declare-fun res!692370 () Bool)

(assert (=> b!1037823 (=> (not res!692370) (not e!587142))))

(declare-datatypes ((SeekEntryResult!9761 0))(
  ( (MissingZero!9761 (index!41415 (_ BitVec 32))) (Found!9761 (index!41416 (_ BitVec 32))) (Intermediate!9761 (undefined!10573 Bool) (index!41417 (_ BitVec 32)) (x!92600 (_ BitVec 32))) (Undefined!9761) (MissingVacant!9761 (index!41418 (_ BitVec 32))) )
))
(declare-fun lt!457590 () SeekEntryResult!9761)

(assert (=> b!1037823 (= res!692370 (is-Found!9761 lt!457590))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65384 (_ BitVec 32)) SeekEntryResult!9761)

(assert (=> b!1037823 (= lt!457590 (seekEntry!0 key!909 (_keys!11493 thiss!1427) (mask!30222 thiss!1427)))))

(declare-fun b!1037824 () Bool)

(declare-fun res!692371 () Bool)

(assert (=> b!1037824 (=> res!692371 e!587143)))

(assert (=> b!1037824 (= res!692371 (contains!6028 Nil!21924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037825 () Bool)

(declare-fun res!692366 () Bool)

(assert (=> b!1037825 (=> res!692366 e!587143)))

(declare-fun noDuplicate!1477 (List!21927) Bool)

(assert (=> b!1037825 (= res!692366 (not (noDuplicate!1477 Nil!21924)))))

(declare-fun b!1037826 () Bool)

(assert (=> b!1037826 (= e!587142 (not e!587143))))

(declare-fun res!692367 () Bool)

(assert (=> b!1037826 (=> res!692367 e!587143)))

(assert (=> b!1037826 (= res!692367 (or (bvsge (size!32001 (_keys!11493 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32001 (_keys!11493 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65384 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037826 (= (arrayCountValidKeys!0 (array!65385 (store (arr!31471 (_keys!11493 thiss!1427)) (index!41416 lt!457590) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32001 (_keys!11493 thiss!1427))) #b00000000000000000000000000000000 (size!32001 (_keys!11493 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11493 thiss!1427) #b00000000000000000000000000000000 (size!32001 (_keys!11493 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33961 0))(
  ( (Unit!33962) )
))
(declare-fun lt!457589 () Unit!33961)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65384 (_ BitVec 32) (_ BitVec 64)) Unit!33961)

(assert (=> b!1037826 (= lt!457589 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11493 thiss!1427) (index!41416 lt!457590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037827 () Bool)

(assert (=> b!1037827 (= e!587139 (and e!587141 mapRes!38493))))

(declare-fun condMapEmpty!38493 () Bool)

(declare-fun mapDefault!38493 () ValueCell!11615)

