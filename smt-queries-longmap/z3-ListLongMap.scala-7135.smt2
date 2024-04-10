; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90542 () Bool)

(assert start!90542)

(declare-fun b!1035680 () Bool)

(declare-fun b_free!20865 () Bool)

(declare-fun b_next!20865 () Bool)

(assert (=> b!1035680 (= b_free!20865 (not b_next!20865))))

(declare-fun tp!73722 () Bool)

(declare-fun b_and!33365 () Bool)

(assert (=> b!1035680 (= tp!73722 b_and!33365)))

(declare-fun b!1035678 () Bool)

(declare-fun res!691463 () Bool)

(declare-fun e!585679 () Bool)

(assert (=> b!1035678 (=> (not res!691463) (not e!585679))))

(declare-datatypes ((V!37653 0))(
  ( (V!37654 (val!12343 Int)) )
))
(declare-datatypes ((ValueCell!11589 0))(
  ( (ValueCellFull!11589 (v!14923 V!37653)) (EmptyCell!11589) )
))
(declare-datatypes ((array!65264 0))(
  ( (array!65265 (arr!31419 (Array (_ BitVec 32) (_ BitVec 64))) (size!31947 (_ BitVec 32))) )
))
(declare-datatypes ((array!65266 0))(
  ( (array!65267 (arr!31420 (Array (_ BitVec 32) ValueCell!11589)) (size!31948 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5772 0))(
  ( (LongMapFixedSize!5773 (defaultEntry!6264 Int) (mask!30157 (_ BitVec 32)) (extraKeys!5994 (_ BitVec 32)) (zeroValue!6098 V!37653) (minValue!6100 V!37653) (_size!2941 (_ BitVec 32)) (_keys!11451 array!65264) (_values!6287 array!65266) (_vacant!2941 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5772)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035678 (= res!691463 (validMask!0 (mask!30157 thiss!1427)))))

(declare-fun b!1035679 () Bool)

(declare-fun res!691464 () Bool)

(assert (=> b!1035679 (=> (not res!691464) (not e!585679))))

(assert (=> b!1035679 (= res!691464 (and (= (size!31948 (_values!6287 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30157 thiss!1427))) (= (size!31947 (_keys!11451 thiss!1427)) (size!31948 (_values!6287 thiss!1427))) (bvsge (mask!30157 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5994 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5994 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5994 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5994 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5994 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5994 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5994 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38388 () Bool)

(declare-fun mapRes!38388 () Bool)

(assert (=> mapIsEmpty!38388 mapRes!38388))

(declare-fun e!585675 () Bool)

(declare-fun e!585678 () Bool)

(declare-fun tp_is_empty!24585 () Bool)

(declare-fun array_inv!24307 (array!65264) Bool)

(declare-fun array_inv!24308 (array!65266) Bool)

(assert (=> b!1035680 (= e!585678 (and tp!73722 tp_is_empty!24585 (array_inv!24307 (_keys!11451 thiss!1427)) (array_inv!24308 (_values!6287 thiss!1427)) e!585675))))

(declare-fun b!1035681 () Bool)

(declare-fun e!585677 () Bool)

(assert (=> b!1035681 (= e!585675 (and e!585677 mapRes!38388))))

(declare-fun condMapEmpty!38388 () Bool)

(declare-fun mapDefault!38388 () ValueCell!11589)

(assert (=> b!1035681 (= condMapEmpty!38388 (= (arr!31420 (_values!6287 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11589)) mapDefault!38388)))))

(declare-fun res!691466 () Bool)

(assert (=> start!90542 (=> (not res!691466) (not e!585679))))

(declare-fun valid!2178 (LongMapFixedSize!5772) Bool)

(assert (=> start!90542 (= res!691466 (valid!2178 thiss!1427))))

(assert (=> start!90542 e!585679))

(assert (=> start!90542 e!585678))

(assert (=> start!90542 true))

(declare-fun b!1035682 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65264 (_ BitVec 32)) Bool)

(assert (=> b!1035682 (= e!585679 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11451 thiss!1427) (mask!30157 thiss!1427))))))

(declare-fun b!1035683 () Bool)

(declare-fun e!585674 () Bool)

(assert (=> b!1035683 (= e!585674 tp_is_empty!24585)))

(declare-fun mapNonEmpty!38388 () Bool)

(declare-fun tp!73723 () Bool)

(assert (=> mapNonEmpty!38388 (= mapRes!38388 (and tp!73723 e!585674))))

(declare-fun mapKey!38388 () (_ BitVec 32))

(declare-fun mapRest!38388 () (Array (_ BitVec 32) ValueCell!11589))

(declare-fun mapValue!38388 () ValueCell!11589)

(assert (=> mapNonEmpty!38388 (= (arr!31420 (_values!6287 thiss!1427)) (store mapRest!38388 mapKey!38388 mapValue!38388))))

(declare-fun b!1035684 () Bool)

(declare-fun res!691465 () Bool)

(assert (=> b!1035684 (=> (not res!691465) (not e!585679))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035684 (= res!691465 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035685 () Bool)

(assert (=> b!1035685 (= e!585677 tp_is_empty!24585)))

(assert (= (and start!90542 res!691466) b!1035684))

(assert (= (and b!1035684 res!691465) b!1035678))

(assert (= (and b!1035678 res!691463) b!1035679))

(assert (= (and b!1035679 res!691464) b!1035682))

(assert (= (and b!1035681 condMapEmpty!38388) mapIsEmpty!38388))

(assert (= (and b!1035681 (not condMapEmpty!38388)) mapNonEmpty!38388))

(get-info :version)

(assert (= (and mapNonEmpty!38388 ((_ is ValueCellFull!11589) mapValue!38388)) b!1035683))

(assert (= (and b!1035681 ((_ is ValueCellFull!11589) mapDefault!38388)) b!1035685))

(assert (= b!1035680 b!1035681))

(assert (= start!90542 b!1035680))

(declare-fun m!955495 () Bool)

(assert (=> start!90542 m!955495))

(declare-fun m!955497 () Bool)

(assert (=> b!1035682 m!955497))

(declare-fun m!955499 () Bool)

(assert (=> b!1035680 m!955499))

(declare-fun m!955501 () Bool)

(assert (=> b!1035680 m!955501))

(declare-fun m!955503 () Bool)

(assert (=> mapNonEmpty!38388 m!955503))

(declare-fun m!955505 () Bool)

(assert (=> b!1035678 m!955505))

(check-sat (not mapNonEmpty!38388) (not start!90542) (not b!1035678) (not b!1035680) (not b!1035682) tp_is_empty!24585 b_and!33365 (not b_next!20865))
(check-sat b_and!33365 (not b_next!20865))
(get-model)

(declare-fun d!124533 () Bool)

(assert (=> d!124533 (= (validMask!0 (mask!30157 thiss!1427)) (and (or (= (mask!30157 thiss!1427) #b00000000000000000000000000000111) (= (mask!30157 thiss!1427) #b00000000000000000000000000001111) (= (mask!30157 thiss!1427) #b00000000000000000000000000011111) (= (mask!30157 thiss!1427) #b00000000000000000000000000111111) (= (mask!30157 thiss!1427) #b00000000000000000000000001111111) (= (mask!30157 thiss!1427) #b00000000000000000000000011111111) (= (mask!30157 thiss!1427) #b00000000000000000000000111111111) (= (mask!30157 thiss!1427) #b00000000000000000000001111111111) (= (mask!30157 thiss!1427) #b00000000000000000000011111111111) (= (mask!30157 thiss!1427) #b00000000000000000000111111111111) (= (mask!30157 thiss!1427) #b00000000000000000001111111111111) (= (mask!30157 thiss!1427) #b00000000000000000011111111111111) (= (mask!30157 thiss!1427) #b00000000000000000111111111111111) (= (mask!30157 thiss!1427) #b00000000000000001111111111111111) (= (mask!30157 thiss!1427) #b00000000000000011111111111111111) (= (mask!30157 thiss!1427) #b00000000000000111111111111111111) (= (mask!30157 thiss!1427) #b00000000000001111111111111111111) (= (mask!30157 thiss!1427) #b00000000000011111111111111111111) (= (mask!30157 thiss!1427) #b00000000000111111111111111111111) (= (mask!30157 thiss!1427) #b00000000001111111111111111111111) (= (mask!30157 thiss!1427) #b00000000011111111111111111111111) (= (mask!30157 thiss!1427) #b00000000111111111111111111111111) (= (mask!30157 thiss!1427) #b00000001111111111111111111111111) (= (mask!30157 thiss!1427) #b00000011111111111111111111111111) (= (mask!30157 thiss!1427) #b00000111111111111111111111111111) (= (mask!30157 thiss!1427) #b00001111111111111111111111111111) (= (mask!30157 thiss!1427) #b00011111111111111111111111111111) (= (mask!30157 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30157 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1035678 d!124533))

(declare-fun d!124535 () Bool)

(assert (=> d!124535 (= (array_inv!24307 (_keys!11451 thiss!1427)) (bvsge (size!31947 (_keys!11451 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035680 d!124535))

(declare-fun d!124537 () Bool)

(assert (=> d!124537 (= (array_inv!24308 (_values!6287 thiss!1427)) (bvsge (size!31948 (_values!6287 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035680 d!124537))

(declare-fun d!124539 () Bool)

(declare-fun res!691485 () Bool)

(declare-fun e!585700 () Bool)

(assert (=> d!124539 (=> (not res!691485) (not e!585700))))

(declare-fun simpleValid!412 (LongMapFixedSize!5772) Bool)

(assert (=> d!124539 (= res!691485 (simpleValid!412 thiss!1427))))

(assert (=> d!124539 (= (valid!2178 thiss!1427) e!585700)))

(declare-fun b!1035716 () Bool)

(declare-fun res!691486 () Bool)

(assert (=> b!1035716 (=> (not res!691486) (not e!585700))))

(declare-fun arrayCountValidKeys!0 (array!65264 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035716 (= res!691486 (= (arrayCountValidKeys!0 (_keys!11451 thiss!1427) #b00000000000000000000000000000000 (size!31947 (_keys!11451 thiss!1427))) (_size!2941 thiss!1427)))))

(declare-fun b!1035717 () Bool)

(declare-fun res!691487 () Bool)

(assert (=> b!1035717 (=> (not res!691487) (not e!585700))))

(assert (=> b!1035717 (= res!691487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11451 thiss!1427) (mask!30157 thiss!1427)))))

(declare-fun b!1035718 () Bool)

(declare-datatypes ((List!21914 0))(
  ( (Nil!21911) (Cons!21910 (h!23112 (_ BitVec 64)) (t!31117 List!21914)) )
))
(declare-fun arrayNoDuplicates!0 (array!65264 (_ BitVec 32) List!21914) Bool)

(assert (=> b!1035718 (= e!585700 (arrayNoDuplicates!0 (_keys!11451 thiss!1427) #b00000000000000000000000000000000 Nil!21911))))

(assert (= (and d!124539 res!691485) b!1035716))

(assert (= (and b!1035716 res!691486) b!1035717))

(assert (= (and b!1035717 res!691487) b!1035718))

(declare-fun m!955519 () Bool)

(assert (=> d!124539 m!955519))

(declare-fun m!955521 () Bool)

(assert (=> b!1035716 m!955521))

(assert (=> b!1035717 m!955497))

(declare-fun m!955523 () Bool)

(assert (=> b!1035718 m!955523))

(assert (=> start!90542 d!124539))

(declare-fun b!1035727 () Bool)

(declare-fun e!585708 () Bool)

(declare-fun e!585707 () Bool)

(assert (=> b!1035727 (= e!585708 e!585707)))

(declare-fun lt!456764 () (_ BitVec 64))

(assert (=> b!1035727 (= lt!456764 (select (arr!31419 (_keys!11451 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33890 0))(
  ( (Unit!33891) )
))
(declare-fun lt!456763 () Unit!33890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65264 (_ BitVec 64) (_ BitVec 32)) Unit!33890)

(assert (=> b!1035727 (= lt!456763 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11451 thiss!1427) lt!456764 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1035727 (arrayContainsKey!0 (_keys!11451 thiss!1427) lt!456764 #b00000000000000000000000000000000)))

(declare-fun lt!456765 () Unit!33890)

(assert (=> b!1035727 (= lt!456765 lt!456763)))

(declare-fun res!691493 () Bool)

(declare-datatypes ((SeekEntryResult!9744 0))(
  ( (MissingZero!9744 (index!41347 (_ BitVec 32))) (Found!9744 (index!41348 (_ BitVec 32))) (Intermediate!9744 (undefined!10556 Bool) (index!41349 (_ BitVec 32)) (x!92413 (_ BitVec 32))) (Undefined!9744) (MissingVacant!9744 (index!41350 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65264 (_ BitVec 32)) SeekEntryResult!9744)

(assert (=> b!1035727 (= res!691493 (= (seekEntryOrOpen!0 (select (arr!31419 (_keys!11451 thiss!1427)) #b00000000000000000000000000000000) (_keys!11451 thiss!1427) (mask!30157 thiss!1427)) (Found!9744 #b00000000000000000000000000000000)))))

(assert (=> b!1035727 (=> (not res!691493) (not e!585707))))

(declare-fun b!1035728 () Bool)

(declare-fun e!585709 () Bool)

(assert (=> b!1035728 (= e!585709 e!585708)))

(declare-fun c!104739 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035728 (= c!104739 (validKeyInArray!0 (select (arr!31419 (_keys!11451 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124541 () Bool)

(declare-fun res!691492 () Bool)

(assert (=> d!124541 (=> res!691492 e!585709)))

(assert (=> d!124541 (= res!691492 (bvsge #b00000000000000000000000000000000 (size!31947 (_keys!11451 thiss!1427))))))

(assert (=> d!124541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11451 thiss!1427) (mask!30157 thiss!1427)) e!585709)))

(declare-fun bm!43791 () Bool)

(declare-fun call!43794 () Bool)

(assert (=> bm!43791 (= call!43794 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11451 thiss!1427) (mask!30157 thiss!1427)))))

(declare-fun b!1035729 () Bool)

(assert (=> b!1035729 (= e!585708 call!43794)))

(declare-fun b!1035730 () Bool)

(assert (=> b!1035730 (= e!585707 call!43794)))

(assert (= (and d!124541 (not res!691492)) b!1035728))

(assert (= (and b!1035728 c!104739) b!1035727))

(assert (= (and b!1035728 (not c!104739)) b!1035729))

(assert (= (and b!1035727 res!691493) b!1035730))

(assert (= (or b!1035730 b!1035729) bm!43791))

(declare-fun m!955525 () Bool)

(assert (=> b!1035727 m!955525))

(declare-fun m!955527 () Bool)

(assert (=> b!1035727 m!955527))

(declare-fun m!955529 () Bool)

(assert (=> b!1035727 m!955529))

(assert (=> b!1035727 m!955525))

(declare-fun m!955531 () Bool)

(assert (=> b!1035727 m!955531))

(assert (=> b!1035728 m!955525))

(assert (=> b!1035728 m!955525))

(declare-fun m!955533 () Bool)

(assert (=> b!1035728 m!955533))

(declare-fun m!955535 () Bool)

(assert (=> bm!43791 m!955535))

(assert (=> b!1035682 d!124541))

(declare-fun b!1035738 () Bool)

(declare-fun e!585715 () Bool)

(assert (=> b!1035738 (= e!585715 tp_is_empty!24585)))

(declare-fun mapNonEmpty!38394 () Bool)

(declare-fun mapRes!38394 () Bool)

(declare-fun tp!73732 () Bool)

(declare-fun e!585714 () Bool)

(assert (=> mapNonEmpty!38394 (= mapRes!38394 (and tp!73732 e!585714))))

(declare-fun mapRest!38394 () (Array (_ BitVec 32) ValueCell!11589))

(declare-fun mapValue!38394 () ValueCell!11589)

(declare-fun mapKey!38394 () (_ BitVec 32))

(assert (=> mapNonEmpty!38394 (= mapRest!38388 (store mapRest!38394 mapKey!38394 mapValue!38394))))

(declare-fun condMapEmpty!38394 () Bool)

(declare-fun mapDefault!38394 () ValueCell!11589)

(assert (=> mapNonEmpty!38388 (= condMapEmpty!38394 (= mapRest!38388 ((as const (Array (_ BitVec 32) ValueCell!11589)) mapDefault!38394)))))

(assert (=> mapNonEmpty!38388 (= tp!73723 (and e!585715 mapRes!38394))))

(declare-fun b!1035737 () Bool)

(assert (=> b!1035737 (= e!585714 tp_is_empty!24585)))

(declare-fun mapIsEmpty!38394 () Bool)

(assert (=> mapIsEmpty!38394 mapRes!38394))

(assert (= (and mapNonEmpty!38388 condMapEmpty!38394) mapIsEmpty!38394))

(assert (= (and mapNonEmpty!38388 (not condMapEmpty!38394)) mapNonEmpty!38394))

(assert (= (and mapNonEmpty!38394 ((_ is ValueCellFull!11589) mapValue!38394)) b!1035737))

(assert (= (and mapNonEmpty!38388 ((_ is ValueCellFull!11589) mapDefault!38394)) b!1035738))

(declare-fun m!955537 () Bool)

(assert (=> mapNonEmpty!38394 m!955537))

(check-sat (not b!1035717) (not d!124539) (not b!1035718) (not bm!43791) (not mapNonEmpty!38394) (not b!1035728) tp_is_empty!24585 (not b!1035727) (not b!1035716) b_and!33365 (not b_next!20865))
(check-sat b_and!33365 (not b_next!20865))
