; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90764 () Bool)

(assert start!90764)

(declare-fun b!1037710 () Bool)

(declare-fun b_free!20915 () Bool)

(declare-fun b_next!20915 () Bool)

(assert (=> b!1037710 (= b_free!20915 (not b_next!20915))))

(declare-fun tp!73896 () Bool)

(declare-fun b_and!33447 () Bool)

(assert (=> b!1037710 (= tp!73896 b_and!33447)))

(declare-fun b!1037708 () Bool)

(declare-fun e!587075 () Bool)

(declare-fun tp_is_empty!24635 () Bool)

(assert (=> b!1037708 (= e!587075 tp_is_empty!24635)))

(declare-fun mapNonEmpty!38487 () Bool)

(declare-fun mapRes!38487 () Bool)

(declare-fun tp!73897 () Bool)

(declare-fun e!587072 () Bool)

(assert (=> mapNonEmpty!38487 (= mapRes!38487 (and tp!73897 e!587072))))

(declare-fun mapKey!38487 () (_ BitVec 32))

(declare-datatypes ((V!37719 0))(
  ( (V!37720 (val!12368 Int)) )
))
(declare-datatypes ((ValueCell!11614 0))(
  ( (ValueCellFull!11614 (v!14951 V!37719)) (EmptyCell!11614) )
))
(declare-fun mapRest!38487 () (Array (_ BitVec 32) ValueCell!11614))

(declare-datatypes ((array!65378 0))(
  ( (array!65379 (arr!31469 (Array (_ BitVec 32) (_ BitVec 64))) (size!31999 (_ BitVec 32))) )
))
(declare-datatypes ((array!65380 0))(
  ( (array!65381 (arr!31470 (Array (_ BitVec 32) ValueCell!11614)) (size!32000 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5822 0))(
  ( (LongMapFixedSize!5823 (defaultEntry!6293 Int) (mask!30218 (_ BitVec 32)) (extraKeys!6021 (_ BitVec 32)) (zeroValue!6127 V!37719) (minValue!6127 V!37719) (_size!2966 (_ BitVec 32)) (_keys!11491 array!65378) (_values!6316 array!65380) (_vacant!2966 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5822)

(declare-fun mapValue!38487 () ValueCell!11614)

(assert (=> mapNonEmpty!38487 (= (arr!31470 (_values!6316 thiss!1427)) (store mapRest!38487 mapKey!38487 mapValue!38487))))

(declare-fun b!1037709 () Bool)

(assert (=> b!1037709 (= e!587072 tp_is_empty!24635)))

(declare-fun res!692312 () Bool)

(declare-fun e!587067 () Bool)

(assert (=> start!90764 (=> (not res!692312) (not e!587067))))

(declare-fun valid!2194 (LongMapFixedSize!5822) Bool)

(assert (=> start!90764 (= res!692312 (valid!2194 thiss!1427))))

(assert (=> start!90764 e!587067))

(declare-fun e!587074 () Bool)

(assert (=> start!90764 e!587074))

(assert (=> start!90764 true))

(declare-fun e!587068 () Bool)

(declare-fun array_inv!24337 (array!65378) Bool)

(declare-fun array_inv!24338 (array!65380) Bool)

(assert (=> b!1037710 (= e!587074 (and tp!73896 tp_is_empty!24635 (array_inv!24337 (_keys!11491 thiss!1427)) (array_inv!24338 (_values!6316 thiss!1427)) e!587068))))

(declare-fun b!1037711 () Bool)

(declare-fun res!692311 () Bool)

(assert (=> b!1037711 (=> (not res!692311) (not e!587067))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037711 (= res!692311 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037712 () Bool)

(declare-fun e!587069 () Bool)

(declare-fun e!587071 () Bool)

(assert (=> b!1037712 (= e!587069 (not e!587071))))

(declare-fun res!692316 () Bool)

(assert (=> b!1037712 (=> res!692316 e!587071)))

(assert (=> b!1037712 (= res!692316 (or (bvsge (size!31999 (_keys!11491 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31999 (_keys!11491 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9760 0))(
  ( (MissingZero!9760 (index!41411 (_ BitVec 32))) (Found!9760 (index!41412 (_ BitVec 32))) (Intermediate!9760 (undefined!10572 Bool) (index!41413 (_ BitVec 32)) (x!92583 (_ BitVec 32))) (Undefined!9760) (MissingVacant!9760 (index!41414 (_ BitVec 32))) )
))
(declare-fun lt!457561 () SeekEntryResult!9760)

(declare-fun arrayCountValidKeys!0 (array!65378 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037712 (= (arrayCountValidKeys!0 (array!65379 (store (arr!31469 (_keys!11491 thiss!1427)) (index!41412 lt!457561) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31999 (_keys!11491 thiss!1427))) #b00000000000000000000000000000000 (size!31999 (_keys!11491 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11491 thiss!1427) #b00000000000000000000000000000000 (size!31999 (_keys!11491 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33959 0))(
  ( (Unit!33960) )
))
(declare-fun lt!457560 () Unit!33959)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65378 (_ BitVec 32) (_ BitVec 64)) Unit!33959)

(assert (=> b!1037712 (= lt!457560 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11491 thiss!1427) (index!41412 lt!457561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037713 () Bool)

(declare-fun e!587073 () Bool)

(assert (=> b!1037713 (= e!587071 e!587073)))

(declare-fun res!692313 () Bool)

(assert (=> b!1037713 (=> (not res!692313) (not e!587073))))

(declare-datatypes ((List!21926 0))(
  ( (Nil!21923) (Cons!21922 (h!23125 (_ BitVec 64)) (t!31140 List!21926)) )
))
(declare-fun contains!6027 (List!21926 (_ BitVec 64)) Bool)

(assert (=> b!1037713 (= res!692313 (not (contains!6027 Nil!21923 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037714 () Bool)

(assert (=> b!1037714 (= e!587067 e!587069)))

(declare-fun res!692315 () Bool)

(assert (=> b!1037714 (=> (not res!692315) (not e!587069))))

(assert (=> b!1037714 (= res!692315 (is-Found!9760 lt!457561))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65378 (_ BitVec 32)) SeekEntryResult!9760)

(assert (=> b!1037714 (= lt!457561 (seekEntry!0 key!909 (_keys!11491 thiss!1427) (mask!30218 thiss!1427)))))

(declare-fun b!1037715 () Bool)

(assert (=> b!1037715 (= e!587073 (not (contains!6027 Nil!21923 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38487 () Bool)

(assert (=> mapIsEmpty!38487 mapRes!38487))

(declare-fun b!1037716 () Bool)

(declare-fun res!692314 () Bool)

(assert (=> b!1037716 (=> res!692314 e!587071)))

(declare-fun noDuplicate!1476 (List!21926) Bool)

(assert (=> b!1037716 (= res!692314 (not (noDuplicate!1476 Nil!21923)))))

(declare-fun b!1037717 () Bool)

(assert (=> b!1037717 (= e!587068 (and e!587075 mapRes!38487))))

(declare-fun condMapEmpty!38487 () Bool)

(declare-fun mapDefault!38487 () ValueCell!11614)

