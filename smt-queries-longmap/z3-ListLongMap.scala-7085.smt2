; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89798 () Bool)

(assert start!89798)

(declare-fun b!1028713 () Bool)

(declare-fun b_free!20563 () Bool)

(declare-fun b_next!20563 () Bool)

(assert (=> b!1028713 (= b_free!20563 (not b_next!20563))))

(declare-fun tp!72735 () Bool)

(declare-fun b_and!32819 () Bool)

(assert (=> b!1028713 (= tp!72735 b_and!32819)))

(declare-fun mapNonEmpty!37853 () Bool)

(declare-fun mapRes!37853 () Bool)

(declare-fun tp!72734 () Bool)

(declare-fun e!580657 () Bool)

(assert (=> mapNonEmpty!37853 (= mapRes!37853 (and tp!72734 e!580657))))

(declare-datatypes ((V!37251 0))(
  ( (V!37252 (val!12192 Int)) )
))
(declare-datatypes ((ValueCell!11438 0))(
  ( (ValueCellFull!11438 (v!14757 V!37251)) (EmptyCell!11438) )
))
(declare-fun mapRest!37853 () (Array (_ BitVec 32) ValueCell!11438))

(declare-fun mapValue!37853 () ValueCell!11438)

(declare-fun mapKey!37853 () (_ BitVec 32))

(declare-datatypes ((array!64665 0))(
  ( (array!64666 (arr!31135 (Array (_ BitVec 32) (_ BitVec 64))) (size!31649 (_ BitVec 32))) )
))
(declare-datatypes ((array!64667 0))(
  ( (array!64668 (arr!31136 (Array (_ BitVec 32) ValueCell!11438)) (size!31650 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5470 0))(
  ( (LongMapFixedSize!5471 (defaultEntry!6087 Int) (mask!29863 (_ BitVec 32)) (extraKeys!5819 (_ BitVec 32)) (zeroValue!5923 V!37251) (minValue!5923 V!37251) (_size!2790 (_ BitVec 32)) (_keys!11272 array!64665) (_values!6110 array!64667) (_vacant!2790 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5470)

(assert (=> mapNonEmpty!37853 (= (arr!31136 (_values!6110 thiss!1427)) (store mapRest!37853 mapKey!37853 mapValue!37853))))

(declare-fun res!688189 () Bool)

(declare-fun e!580654 () Bool)

(assert (=> start!89798 (=> (not res!688189) (not e!580654))))

(declare-fun valid!2080 (LongMapFixedSize!5470) Bool)

(assert (=> start!89798 (= res!688189 (valid!2080 thiss!1427))))

(assert (=> start!89798 e!580654))

(declare-fun e!580651 () Bool)

(assert (=> start!89798 e!580651))

(assert (=> start!89798 true))

(declare-fun b!1028706 () Bool)

(declare-fun tp_is_empty!24283 () Bool)

(assert (=> b!1028706 (= e!580657 tp_is_empty!24283)))

(declare-fun b!1028707 () Bool)

(declare-fun res!688185 () Bool)

(declare-fun e!580652 () Bool)

(assert (=> b!1028707 (=> res!688185 e!580652)))

(assert (=> b!1028707 (= res!688185 (or (not (= (size!31650 (_values!6110 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29863 thiss!1427)))) (not (= (size!31649 (_keys!11272 thiss!1427)) (size!31650 (_values!6110 thiss!1427)))) (bvslt (mask!29863 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5819 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5819 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37853 () Bool)

(assert (=> mapIsEmpty!37853 mapRes!37853))

(declare-fun b!1028708 () Bool)

(declare-fun e!580656 () Bool)

(assert (=> b!1028708 (= e!580654 e!580656)))

(declare-fun res!688186 () Bool)

(assert (=> b!1028708 (=> (not res!688186) (not e!580656))))

(declare-datatypes ((SeekEntryResult!9625 0))(
  ( (MissingZero!9625 (index!40871 (_ BitVec 32))) (Found!9625 (index!40872 (_ BitVec 32))) (Intermediate!9625 (undefined!10437 Bool) (index!40873 (_ BitVec 32)) (x!91397 (_ BitVec 32))) (Undefined!9625) (MissingVacant!9625 (index!40874 (_ BitVec 32))) )
))
(declare-fun lt!452739 () SeekEntryResult!9625)

(get-info :version)

(assert (=> b!1028708 (= res!688186 ((_ is Found!9625) lt!452739))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64665 (_ BitVec 32)) SeekEntryResult!9625)

(assert (=> b!1028708 (= lt!452739 (seekEntry!0 key!909 (_keys!11272 thiss!1427) (mask!29863 thiss!1427)))))

(declare-fun b!1028709 () Bool)

(assert (=> b!1028709 (= e!580656 (not e!580652))))

(declare-fun res!688190 () Bool)

(assert (=> b!1028709 (=> res!688190 e!580652)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028709 (= res!688190 (not (validMask!0 (mask!29863 thiss!1427))))))

(declare-fun lt!452741 () array!64665)

(declare-fun arrayContainsKey!0 (array!64665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028709 (not (arrayContainsKey!0 lt!452741 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33488 0))(
  ( (Unit!33489) )
))
(declare-fun lt!452742 () Unit!33488)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64665 (_ BitVec 32) (_ BitVec 64)) Unit!33488)

(assert (=> b!1028709 (= lt!452742 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11272 thiss!1427) (index!40872 lt!452739) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64665 (_ BitVec 32)) Bool)

(assert (=> b!1028709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452741 (mask!29863 thiss!1427))))

(declare-fun lt!452744 () Unit!33488)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64665 (_ BitVec 32) (_ BitVec 32)) Unit!33488)

(assert (=> b!1028709 (= lt!452744 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11272 thiss!1427) (index!40872 lt!452739) (mask!29863 thiss!1427)))))

(declare-datatypes ((List!21790 0))(
  ( (Nil!21787) (Cons!21786 (h!22993 (_ BitVec 64)) (t!30844 List!21790)) )
))
(declare-fun arrayNoDuplicates!0 (array!64665 (_ BitVec 32) List!21790) Bool)

(assert (=> b!1028709 (arrayNoDuplicates!0 lt!452741 #b00000000000000000000000000000000 Nil!21787)))

(declare-fun lt!452743 () Unit!33488)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64665 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21790) Unit!33488)

(assert (=> b!1028709 (= lt!452743 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11272 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40872 lt!452739) #b00000000000000000000000000000000 Nil!21787))))

(declare-fun arrayCountValidKeys!0 (array!64665 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028709 (= (arrayCountValidKeys!0 lt!452741 #b00000000000000000000000000000000 (size!31649 (_keys!11272 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11272 thiss!1427) #b00000000000000000000000000000000 (size!31649 (_keys!11272 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028709 (= lt!452741 (array!64666 (store (arr!31135 (_keys!11272 thiss!1427)) (index!40872 lt!452739) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31649 (_keys!11272 thiss!1427))))))

(declare-fun lt!452738 () Unit!33488)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64665 (_ BitVec 32) (_ BitVec 64)) Unit!33488)

(assert (=> b!1028709 (= lt!452738 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11272 thiss!1427) (index!40872 lt!452739) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028710 () Bool)

(assert (=> b!1028710 (= e!580652 true)))

(declare-fun lt!452740 () Bool)

(assert (=> b!1028710 (= lt!452740 (arrayNoDuplicates!0 (_keys!11272 thiss!1427) #b00000000000000000000000000000000 Nil!21787))))

(declare-fun b!1028711 () Bool)

(declare-fun res!688187 () Bool)

(assert (=> b!1028711 (=> (not res!688187) (not e!580654))))

(assert (=> b!1028711 (= res!688187 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1028712 () Bool)

(declare-fun e!580655 () Bool)

(declare-fun e!580650 () Bool)

(assert (=> b!1028712 (= e!580655 (and e!580650 mapRes!37853))))

(declare-fun condMapEmpty!37853 () Bool)

(declare-fun mapDefault!37853 () ValueCell!11438)

(assert (=> b!1028712 (= condMapEmpty!37853 (= (arr!31136 (_values!6110 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11438)) mapDefault!37853)))))

(declare-fun array_inv!24117 (array!64665) Bool)

(declare-fun array_inv!24118 (array!64667) Bool)

(assert (=> b!1028713 (= e!580651 (and tp!72735 tp_is_empty!24283 (array_inv!24117 (_keys!11272 thiss!1427)) (array_inv!24118 (_values!6110 thiss!1427)) e!580655))))

(declare-fun b!1028714 () Bool)

(assert (=> b!1028714 (= e!580650 tp_is_empty!24283)))

(declare-fun b!1028715 () Bool)

(declare-fun res!688188 () Bool)

(assert (=> b!1028715 (=> res!688188 e!580652)))

(assert (=> b!1028715 (= res!688188 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11272 thiss!1427) (mask!29863 thiss!1427))))))

(assert (= (and start!89798 res!688189) b!1028711))

(assert (= (and b!1028711 res!688187) b!1028708))

(assert (= (and b!1028708 res!688186) b!1028709))

(assert (= (and b!1028709 (not res!688190)) b!1028707))

(assert (= (and b!1028707 (not res!688185)) b!1028715))

(assert (= (and b!1028715 (not res!688188)) b!1028710))

(assert (= (and b!1028712 condMapEmpty!37853) mapIsEmpty!37853))

(assert (= (and b!1028712 (not condMapEmpty!37853)) mapNonEmpty!37853))

(assert (= (and mapNonEmpty!37853 ((_ is ValueCellFull!11438) mapValue!37853)) b!1028706))

(assert (= (and b!1028712 ((_ is ValueCellFull!11438) mapDefault!37853)) b!1028714))

(assert (= b!1028713 b!1028712))

(assert (= start!89798 b!1028713))

(declare-fun m!947511 () Bool)

(assert (=> start!89798 m!947511))

(declare-fun m!947513 () Bool)

(assert (=> b!1028710 m!947513))

(declare-fun m!947515 () Bool)

(assert (=> b!1028713 m!947515))

(declare-fun m!947517 () Bool)

(assert (=> b!1028713 m!947517))

(declare-fun m!947519 () Bool)

(assert (=> b!1028708 m!947519))

(declare-fun m!947521 () Bool)

(assert (=> b!1028709 m!947521))

(declare-fun m!947523 () Bool)

(assert (=> b!1028709 m!947523))

(declare-fun m!947525 () Bool)

(assert (=> b!1028709 m!947525))

(declare-fun m!947527 () Bool)

(assert (=> b!1028709 m!947527))

(declare-fun m!947529 () Bool)

(assert (=> b!1028709 m!947529))

(declare-fun m!947531 () Bool)

(assert (=> b!1028709 m!947531))

(declare-fun m!947533 () Bool)

(assert (=> b!1028709 m!947533))

(declare-fun m!947535 () Bool)

(assert (=> b!1028709 m!947535))

(declare-fun m!947537 () Bool)

(assert (=> b!1028709 m!947537))

(declare-fun m!947539 () Bool)

(assert (=> b!1028709 m!947539))

(declare-fun m!947541 () Bool)

(assert (=> b!1028709 m!947541))

(declare-fun m!947543 () Bool)

(assert (=> b!1028715 m!947543))

(declare-fun m!947545 () Bool)

(assert (=> mapNonEmpty!37853 m!947545))

(check-sat (not b!1028708) tp_is_empty!24283 (not b_next!20563) (not b!1028715) b_and!32819 (not mapNonEmpty!37853) (not b!1028713) (not b!1028709) (not b!1028710) (not start!89798))
(check-sat b_and!32819 (not b_next!20563))
