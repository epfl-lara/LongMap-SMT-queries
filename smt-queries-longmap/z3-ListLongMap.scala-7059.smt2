; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89642 () Bool)

(assert start!89642)

(declare-fun b!1026404 () Bool)

(declare-fun b_free!20407 () Bool)

(declare-fun b_next!20407 () Bool)

(assert (=> b!1026404 (= b_free!20407 (not b_next!20407))))

(declare-fun tp!72267 () Bool)

(declare-fun b_and!32663 () Bool)

(assert (=> b!1026404 (= tp!72267 b_and!32663)))

(declare-fun e!578778 () Bool)

(declare-fun e!578784 () Bool)

(declare-fun tp_is_empty!24127 () Bool)

(declare-datatypes ((V!37043 0))(
  ( (V!37044 (val!12114 Int)) )
))
(declare-datatypes ((ValueCell!11360 0))(
  ( (ValueCellFull!11360 (v!14679 V!37043)) (EmptyCell!11360) )
))
(declare-datatypes ((array!64353 0))(
  ( (array!64354 (arr!30979 (Array (_ BitVec 32) (_ BitVec 64))) (size!31493 (_ BitVec 32))) )
))
(declare-datatypes ((array!64355 0))(
  ( (array!64356 (arr!30980 (Array (_ BitVec 32) ValueCell!11360)) (size!31494 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5314 0))(
  ( (LongMapFixedSize!5315 (defaultEntry!6009 Int) (mask!29733 (_ BitVec 32)) (extraKeys!5741 (_ BitVec 32)) (zeroValue!5845 V!37043) (minValue!5845 V!37043) (_size!2712 (_ BitVec 32)) (_keys!11194 array!64353) (_values!6032 array!64355) (_vacant!2712 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5314)

(declare-fun array_inv!24015 (array!64353) Bool)

(declare-fun array_inv!24016 (array!64355) Bool)

(assert (=> b!1026404 (= e!578784 (and tp!72267 tp_is_empty!24127 (array_inv!24015 (_keys!11194 thiss!1427)) (array_inv!24016 (_values!6032 thiss!1427)) e!578778))))

(declare-fun b!1026405 () Bool)

(declare-fun e!578785 () Bool)

(declare-fun e!578783 () Bool)

(assert (=> b!1026405 (= e!578785 (not e!578783))))

(declare-fun res!686822 () Bool)

(assert (=> b!1026405 (=> res!686822 e!578783)))

(assert (=> b!1026405 (= res!686822 (or (bvsge (size!31493 (_keys!11194 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31493 (_keys!11194 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9567 0))(
  ( (MissingZero!9567 (index!40639 (_ BitVec 32))) (Found!9567 (index!40640 (_ BitVec 32))) (Intermediate!9567 (undefined!10379 Bool) (index!40641 (_ BitVec 32)) (x!91131 (_ BitVec 32))) (Undefined!9567) (MissingVacant!9567 (index!40642 (_ BitVec 32))) )
))
(declare-fun lt!451309 () SeekEntryResult!9567)

(declare-fun arrayCountValidKeys!0 (array!64353 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026405 (= (arrayCountValidKeys!0 (array!64354 (store (arr!30979 (_keys!11194 thiss!1427)) (index!40640 lt!451309) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31493 (_keys!11194 thiss!1427))) #b00000000000000000000000000000000 (size!31493 (_keys!11194 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11194 thiss!1427) #b00000000000000000000000000000000 (size!31493 (_keys!11194 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33388 0))(
  ( (Unit!33389) )
))
(declare-fun lt!451310 () Unit!33388)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64353 (_ BitVec 32) (_ BitVec 64)) Unit!33388)

(assert (=> b!1026405 (= lt!451310 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11194 thiss!1427) (index!40640 lt!451309) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026406 () Bool)

(declare-fun res!686820 () Bool)

(assert (=> b!1026406 (=> res!686820 e!578783)))

(declare-datatypes ((List!21733 0))(
  ( (Nil!21730) (Cons!21729 (h!22936 (_ BitVec 64)) (t!30787 List!21733)) )
))
(declare-fun contains!5986 (List!21733 (_ BitVec 64)) Bool)

(assert (=> b!1026406 (= res!686820 (contains!5986 Nil!21730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026407 () Bool)

(declare-fun e!578779 () Bool)

(assert (=> b!1026407 (= e!578779 tp_is_empty!24127)))

(declare-fun b!1026408 () Bool)

(assert (=> b!1026408 (= e!578783 true)))

(declare-fun lt!451308 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64353 (_ BitVec 32) List!21733) Bool)

(assert (=> b!1026408 (= lt!451308 (arrayNoDuplicates!0 (_keys!11194 thiss!1427) #b00000000000000000000000000000000 Nil!21730))))

(declare-fun b!1026409 () Bool)

(declare-fun res!686823 () Bool)

(declare-fun e!578782 () Bool)

(assert (=> b!1026409 (=> (not res!686823) (not e!578782))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026409 (= res!686823 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026410 () Bool)

(declare-fun mapRes!37619 () Bool)

(assert (=> b!1026410 (= e!578778 (and e!578779 mapRes!37619))))

(declare-fun condMapEmpty!37619 () Bool)

(declare-fun mapDefault!37619 () ValueCell!11360)

(assert (=> b!1026410 (= condMapEmpty!37619 (= (arr!30980 (_values!6032 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11360)) mapDefault!37619)))))

(declare-fun b!1026411 () Bool)

(assert (=> b!1026411 (= e!578782 e!578785)))

(declare-fun res!686825 () Bool)

(assert (=> b!1026411 (=> (not res!686825) (not e!578785))))

(get-info :version)

(assert (=> b!1026411 (= res!686825 ((_ is Found!9567) lt!451309))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64353 (_ BitVec 32)) SeekEntryResult!9567)

(assert (=> b!1026411 (= lt!451309 (seekEntry!0 key!909 (_keys!11194 thiss!1427) (mask!29733 thiss!1427)))))

(declare-fun b!1026412 () Bool)

(declare-fun res!686821 () Bool)

(assert (=> b!1026412 (=> res!686821 e!578783)))

(declare-fun noDuplicate!1485 (List!21733) Bool)

(assert (=> b!1026412 (= res!686821 (not (noDuplicate!1485 Nil!21730)))))

(declare-fun b!1026413 () Bool)

(declare-fun e!578781 () Bool)

(assert (=> b!1026413 (= e!578781 tp_is_empty!24127)))

(declare-fun mapIsEmpty!37619 () Bool)

(assert (=> mapIsEmpty!37619 mapRes!37619))

(declare-fun res!686819 () Bool)

(assert (=> start!89642 (=> (not res!686819) (not e!578782))))

(declare-fun valid!2028 (LongMapFixedSize!5314) Bool)

(assert (=> start!89642 (= res!686819 (valid!2028 thiss!1427))))

(assert (=> start!89642 e!578782))

(assert (=> start!89642 e!578784))

(assert (=> start!89642 true))

(declare-fun mapNonEmpty!37619 () Bool)

(declare-fun tp!72266 () Bool)

(assert (=> mapNonEmpty!37619 (= mapRes!37619 (and tp!72266 e!578781))))

(declare-fun mapKey!37619 () (_ BitVec 32))

(declare-fun mapValue!37619 () ValueCell!11360)

(declare-fun mapRest!37619 () (Array (_ BitVec 32) ValueCell!11360))

(assert (=> mapNonEmpty!37619 (= (arr!30980 (_values!6032 thiss!1427)) (store mapRest!37619 mapKey!37619 mapValue!37619))))

(declare-fun b!1026414 () Bool)

(declare-fun res!686824 () Bool)

(assert (=> b!1026414 (=> res!686824 e!578783)))

(assert (=> b!1026414 (= res!686824 (contains!5986 Nil!21730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89642 res!686819) b!1026409))

(assert (= (and b!1026409 res!686823) b!1026411))

(assert (= (and b!1026411 res!686825) b!1026405))

(assert (= (and b!1026405 (not res!686822)) b!1026412))

(assert (= (and b!1026412 (not res!686821)) b!1026414))

(assert (= (and b!1026414 (not res!686824)) b!1026406))

(assert (= (and b!1026406 (not res!686820)) b!1026408))

(assert (= (and b!1026410 condMapEmpty!37619) mapIsEmpty!37619))

(assert (= (and b!1026410 (not condMapEmpty!37619)) mapNonEmpty!37619))

(assert (= (and mapNonEmpty!37619 ((_ is ValueCellFull!11360) mapValue!37619)) b!1026413))

(assert (= (and b!1026410 ((_ is ValueCellFull!11360) mapDefault!37619)) b!1026407))

(assert (= b!1026404 b!1026410))

(assert (= start!89642 b!1026404))

(declare-fun m!944961 () Bool)

(assert (=> mapNonEmpty!37619 m!944961))

(declare-fun m!944963 () Bool)

(assert (=> b!1026408 m!944963))

(declare-fun m!944965 () Bool)

(assert (=> b!1026406 m!944965))

(declare-fun m!944967 () Bool)

(assert (=> b!1026412 m!944967))

(declare-fun m!944969 () Bool)

(assert (=> b!1026414 m!944969))

(declare-fun m!944971 () Bool)

(assert (=> b!1026405 m!944971))

(declare-fun m!944973 () Bool)

(assert (=> b!1026405 m!944973))

(declare-fun m!944975 () Bool)

(assert (=> b!1026405 m!944975))

(declare-fun m!944977 () Bool)

(assert (=> b!1026405 m!944977))

(declare-fun m!944979 () Bool)

(assert (=> b!1026404 m!944979))

(declare-fun m!944981 () Bool)

(assert (=> b!1026404 m!944981))

(declare-fun m!944983 () Bool)

(assert (=> b!1026411 m!944983))

(declare-fun m!944985 () Bool)

(assert (=> start!89642 m!944985))

(check-sat (not start!89642) (not b!1026406) tp_is_empty!24127 (not b!1026408) (not b!1026404) (not b!1026411) b_and!32663 (not mapNonEmpty!37619) (not b!1026405) (not b!1026412) (not b!1026414) (not b_next!20407))
(check-sat b_and!32663 (not b_next!20407))
