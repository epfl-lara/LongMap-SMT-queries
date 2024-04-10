; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89296 () Bool)

(assert start!89296)

(declare-fun b!1023905 () Bool)

(declare-fun b_free!20337 () Bool)

(declare-fun b_next!20337 () Bool)

(assert (=> b!1023905 (= b_free!20337 (not b_next!20337))))

(declare-fun tp!72045 () Bool)

(declare-fun b_and!32583 () Bool)

(assert (=> b!1023905 (= tp!72045 b_and!32583)))

(declare-fun mapIsEmpty!37503 () Bool)

(declare-fun mapRes!37503 () Bool)

(assert (=> mapIsEmpty!37503 mapRes!37503))

(declare-fun e!577068 () Bool)

(declare-fun tp_is_empty!24057 () Bool)

(declare-fun e!577071 () Bool)

(declare-datatypes ((V!36949 0))(
  ( (V!36950 (val!12079 Int)) )
))
(declare-datatypes ((ValueCell!11325 0))(
  ( (ValueCellFull!11325 (v!14648 V!36949)) (EmptyCell!11325) )
))
(declare-datatypes ((array!64158 0))(
  ( (array!64159 (arr!30891 (Array (_ BitVec 32) (_ BitVec 64))) (size!31402 (_ BitVec 32))) )
))
(declare-datatypes ((array!64160 0))(
  ( (array!64161 (arr!30892 (Array (_ BitVec 32) ValueCell!11325)) (size!31403 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5244 0))(
  ( (LongMapFixedSize!5245 (defaultEntry!5974 Int) (mask!29609 (_ BitVec 32)) (extraKeys!5706 (_ BitVec 32)) (zeroValue!5810 V!36949) (minValue!5810 V!36949) (_size!2677 (_ BitVec 32)) (_keys!11119 array!64158) (_values!5997 array!64160) (_vacant!2677 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5244)

(declare-fun array_inv!23933 (array!64158) Bool)

(declare-fun array_inv!23934 (array!64160) Bool)

(assert (=> b!1023905 (= e!577071 (and tp!72045 tp_is_empty!24057 (array_inv!23933 (_keys!11119 thiss!1427)) (array_inv!23934 (_values!5997 thiss!1427)) e!577068))))

(declare-fun b!1023906 () Bool)

(declare-fun res!685621 () Bool)

(declare-fun e!577070 () Bool)

(assert (=> b!1023906 (=> (not res!685621) (not e!577070))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023906 (= res!685621 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1023907 () Bool)

(declare-fun e!577069 () Bool)

(assert (=> b!1023907 (= e!577069 tp_is_empty!24057)))

(declare-fun b!1023908 () Bool)

(declare-fun e!577066 () Bool)

(assert (=> b!1023908 (= e!577066 tp_is_empty!24057)))

(declare-fun b!1023909 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023909 (= e!577070 (not (validMask!0 (mask!29609 thiss!1427))))))

(declare-fun mapNonEmpty!37503 () Bool)

(declare-fun tp!72046 () Bool)

(assert (=> mapNonEmpty!37503 (= mapRes!37503 (and tp!72046 e!577066))))

(declare-fun mapValue!37503 () ValueCell!11325)

(declare-fun mapKey!37503 () (_ BitVec 32))

(declare-fun mapRest!37503 () (Array (_ BitVec 32) ValueCell!11325))

(assert (=> mapNonEmpty!37503 (= (arr!30892 (_values!5997 thiss!1427)) (store mapRest!37503 mapKey!37503 mapValue!37503))))

(declare-fun res!685622 () Bool)

(assert (=> start!89296 (=> (not res!685622) (not e!577070))))

(declare-fun valid!1998 (LongMapFixedSize!5244) Bool)

(assert (=> start!89296 (= res!685622 (valid!1998 thiss!1427))))

(assert (=> start!89296 e!577070))

(assert (=> start!89296 e!577071))

(assert (=> start!89296 true))

(declare-fun b!1023910 () Bool)

(assert (=> b!1023910 (= e!577068 (and e!577069 mapRes!37503))))

(declare-fun condMapEmpty!37503 () Bool)

(declare-fun mapDefault!37503 () ValueCell!11325)

(assert (=> b!1023910 (= condMapEmpty!37503 (= (arr!30892 (_values!5997 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11325)) mapDefault!37503)))))

(assert (= (and start!89296 res!685622) b!1023906))

(assert (= (and b!1023906 res!685621) b!1023909))

(assert (= (and b!1023910 condMapEmpty!37503) mapIsEmpty!37503))

(assert (= (and b!1023910 (not condMapEmpty!37503)) mapNonEmpty!37503))

(get-info :version)

(assert (= (and mapNonEmpty!37503 ((_ is ValueCellFull!11325) mapValue!37503)) b!1023908))

(assert (= (and b!1023910 ((_ is ValueCellFull!11325) mapDefault!37503)) b!1023907))

(assert (= b!1023905 b!1023910))

(assert (= start!89296 b!1023905))

(declare-fun m!942483 () Bool)

(assert (=> b!1023905 m!942483))

(declare-fun m!942485 () Bool)

(assert (=> b!1023905 m!942485))

(declare-fun m!942487 () Bool)

(assert (=> b!1023909 m!942487))

(declare-fun m!942489 () Bool)

(assert (=> mapNonEmpty!37503 m!942489))

(declare-fun m!942491 () Bool)

(assert (=> start!89296 m!942491))

(check-sat (not b!1023905) b_and!32583 (not mapNonEmpty!37503) tp_is_empty!24057 (not b_next!20337) (not b!1023909) (not start!89296))
(check-sat b_and!32583 (not b_next!20337))
(get-model)

(declare-fun d!122587 () Bool)

(assert (=> d!122587 (= (array_inv!23933 (_keys!11119 thiss!1427)) (bvsge (size!31402 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1023905 d!122587))

(declare-fun d!122589 () Bool)

(assert (=> d!122589 (= (array_inv!23934 (_values!5997 thiss!1427)) (bvsge (size!31403 (_values!5997 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1023905 d!122589))

(declare-fun d!122591 () Bool)

(declare-fun res!685635 () Bool)

(declare-fun e!577092 () Bool)

(assert (=> d!122591 (=> (not res!685635) (not e!577092))))

(declare-fun simpleValid!387 (LongMapFixedSize!5244) Bool)

(assert (=> d!122591 (= res!685635 (simpleValid!387 thiss!1427))))

(assert (=> d!122591 (= (valid!1998 thiss!1427) e!577092)))

(declare-fun b!1023935 () Bool)

(declare-fun res!685636 () Bool)

(assert (=> b!1023935 (=> (not res!685636) (not e!577092))))

(declare-fun arrayCountValidKeys!0 (array!64158 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1023935 (= res!685636 (= (arrayCountValidKeys!0 (_keys!11119 thiss!1427) #b00000000000000000000000000000000 (size!31402 (_keys!11119 thiss!1427))) (_size!2677 thiss!1427)))))

(declare-fun b!1023936 () Bool)

(declare-fun res!685637 () Bool)

(assert (=> b!1023936 (=> (not res!685637) (not e!577092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64158 (_ BitVec 32)) Bool)

(assert (=> b!1023936 (= res!685637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11119 thiss!1427) (mask!29609 thiss!1427)))))

(declare-fun b!1023937 () Bool)

(declare-datatypes ((List!21724 0))(
  ( (Nil!21721) (Cons!21720 (h!22918 (_ BitVec 64)) (t!30786 List!21724)) )
))
(declare-fun arrayNoDuplicates!0 (array!64158 (_ BitVec 32) List!21724) Bool)

(assert (=> b!1023937 (= e!577092 (arrayNoDuplicates!0 (_keys!11119 thiss!1427) #b00000000000000000000000000000000 Nil!21721))))

(assert (= (and d!122591 res!685635) b!1023935))

(assert (= (and b!1023935 res!685636) b!1023936))

(assert (= (and b!1023936 res!685637) b!1023937))

(declare-fun m!942503 () Bool)

(assert (=> d!122591 m!942503))

(declare-fun m!942505 () Bool)

(assert (=> b!1023935 m!942505))

(declare-fun m!942507 () Bool)

(assert (=> b!1023936 m!942507))

(declare-fun m!942509 () Bool)

(assert (=> b!1023937 m!942509))

(assert (=> start!89296 d!122591))

(declare-fun d!122593 () Bool)

(assert (=> d!122593 (= (validMask!0 (mask!29609 thiss!1427)) (and (or (= (mask!29609 thiss!1427) #b00000000000000000000000000000111) (= (mask!29609 thiss!1427) #b00000000000000000000000000001111) (= (mask!29609 thiss!1427) #b00000000000000000000000000011111) (= (mask!29609 thiss!1427) #b00000000000000000000000000111111) (= (mask!29609 thiss!1427) #b00000000000000000000000001111111) (= (mask!29609 thiss!1427) #b00000000000000000000000011111111) (= (mask!29609 thiss!1427) #b00000000000000000000000111111111) (= (mask!29609 thiss!1427) #b00000000000000000000001111111111) (= (mask!29609 thiss!1427) #b00000000000000000000011111111111) (= (mask!29609 thiss!1427) #b00000000000000000000111111111111) (= (mask!29609 thiss!1427) #b00000000000000000001111111111111) (= (mask!29609 thiss!1427) #b00000000000000000011111111111111) (= (mask!29609 thiss!1427) #b00000000000000000111111111111111) (= (mask!29609 thiss!1427) #b00000000000000001111111111111111) (= (mask!29609 thiss!1427) #b00000000000000011111111111111111) (= (mask!29609 thiss!1427) #b00000000000000111111111111111111) (= (mask!29609 thiss!1427) #b00000000000001111111111111111111) (= (mask!29609 thiss!1427) #b00000000000011111111111111111111) (= (mask!29609 thiss!1427) #b00000000000111111111111111111111) (= (mask!29609 thiss!1427) #b00000000001111111111111111111111) (= (mask!29609 thiss!1427) #b00000000011111111111111111111111) (= (mask!29609 thiss!1427) #b00000000111111111111111111111111) (= (mask!29609 thiss!1427) #b00000001111111111111111111111111) (= (mask!29609 thiss!1427) #b00000011111111111111111111111111) (= (mask!29609 thiss!1427) #b00000111111111111111111111111111) (= (mask!29609 thiss!1427) #b00001111111111111111111111111111) (= (mask!29609 thiss!1427) #b00011111111111111111111111111111) (= (mask!29609 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29609 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1023909 d!122593))

(declare-fun b!1023944 () Bool)

(declare-fun e!577097 () Bool)

(assert (=> b!1023944 (= e!577097 tp_is_empty!24057)))

(declare-fun mapIsEmpty!37509 () Bool)

(declare-fun mapRes!37509 () Bool)

(assert (=> mapIsEmpty!37509 mapRes!37509))

(declare-fun condMapEmpty!37509 () Bool)

(declare-fun mapDefault!37509 () ValueCell!11325)

(assert (=> mapNonEmpty!37503 (= condMapEmpty!37509 (= mapRest!37503 ((as const (Array (_ BitVec 32) ValueCell!11325)) mapDefault!37509)))))

(declare-fun e!577098 () Bool)

(assert (=> mapNonEmpty!37503 (= tp!72046 (and e!577098 mapRes!37509))))

(declare-fun b!1023945 () Bool)

(assert (=> b!1023945 (= e!577098 tp_is_empty!24057)))

(declare-fun mapNonEmpty!37509 () Bool)

(declare-fun tp!72055 () Bool)

(assert (=> mapNonEmpty!37509 (= mapRes!37509 (and tp!72055 e!577097))))

(declare-fun mapKey!37509 () (_ BitVec 32))

(declare-fun mapValue!37509 () ValueCell!11325)

(declare-fun mapRest!37509 () (Array (_ BitVec 32) ValueCell!11325))

(assert (=> mapNonEmpty!37509 (= mapRest!37503 (store mapRest!37509 mapKey!37509 mapValue!37509))))

(assert (= (and mapNonEmpty!37503 condMapEmpty!37509) mapIsEmpty!37509))

(assert (= (and mapNonEmpty!37503 (not condMapEmpty!37509)) mapNonEmpty!37509))

(assert (= (and mapNonEmpty!37509 ((_ is ValueCellFull!11325) mapValue!37509)) b!1023944))

(assert (= (and mapNonEmpty!37503 ((_ is ValueCellFull!11325) mapDefault!37509)) b!1023945))

(declare-fun m!942511 () Bool)

(assert (=> mapNonEmpty!37509 m!942511))

(check-sat (not mapNonEmpty!37509) (not b!1023937) tp_is_empty!24057 (not b_next!20337) (not b!1023935) b_and!32583 (not b!1023936) (not d!122591))
(check-sat b_and!32583 (not b_next!20337))
(get-model)

(declare-fun b!1023957 () Bool)

(declare-fun e!577101 () Bool)

(assert (=> b!1023957 (= e!577101 (and (bvsge (extraKeys!5706 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5706 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2677 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1023955 () Bool)

(declare-fun res!685649 () Bool)

(assert (=> b!1023955 (=> (not res!685649) (not e!577101))))

(declare-fun size!31406 (LongMapFixedSize!5244) (_ BitVec 32))

(assert (=> b!1023955 (= res!685649 (bvsge (size!31406 thiss!1427) (_size!2677 thiss!1427)))))

(declare-fun b!1023954 () Bool)

(declare-fun res!685646 () Bool)

(assert (=> b!1023954 (=> (not res!685646) (not e!577101))))

(assert (=> b!1023954 (= res!685646 (and (= (size!31403 (_values!5997 thiss!1427)) (bvadd (mask!29609 thiss!1427) #b00000000000000000000000000000001)) (= (size!31402 (_keys!11119 thiss!1427)) (size!31403 (_values!5997 thiss!1427))) (bvsge (_size!2677 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2677 thiss!1427) (bvadd (mask!29609 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!122595 () Bool)

(declare-fun res!685647 () Bool)

(assert (=> d!122595 (=> (not res!685647) (not e!577101))))

(assert (=> d!122595 (= res!685647 (validMask!0 (mask!29609 thiss!1427)))))

(assert (=> d!122595 (= (simpleValid!387 thiss!1427) e!577101)))

(declare-fun b!1023956 () Bool)

(declare-fun res!685648 () Bool)

(assert (=> b!1023956 (=> (not res!685648) (not e!577101))))

(assert (=> b!1023956 (= res!685648 (= (size!31406 thiss!1427) (bvadd (_size!2677 thiss!1427) (bvsdiv (bvadd (extraKeys!5706 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!122595 res!685647) b!1023954))

(assert (= (and b!1023954 res!685646) b!1023955))

(assert (= (and b!1023955 res!685649) b!1023956))

(assert (= (and b!1023956 res!685648) b!1023957))

(declare-fun m!942513 () Bool)

(assert (=> b!1023955 m!942513))

(assert (=> d!122595 m!942487))

(assert (=> b!1023956 m!942513))

(assert (=> d!122591 d!122595))

(declare-fun b!1023966 () Bool)

(declare-fun e!577106 () (_ BitVec 32))

(declare-fun call!43227 () (_ BitVec 32))

(assert (=> b!1023966 (= e!577106 call!43227)))

(declare-fun b!1023967 () Bool)

(declare-fun e!577107 () (_ BitVec 32))

(assert (=> b!1023967 (= e!577107 #b00000000000000000000000000000000)))

(declare-fun bm!43224 () Bool)

(assert (=> bm!43224 (= call!43227 (arrayCountValidKeys!0 (_keys!11119 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31402 (_keys!11119 thiss!1427))))))

(declare-fun d!122597 () Bool)

(declare-fun lt!450540 () (_ BitVec 32))

(assert (=> d!122597 (and (bvsge lt!450540 #b00000000000000000000000000000000) (bvsle lt!450540 (bvsub (size!31402 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!122597 (= lt!450540 e!577107)))

(declare-fun c!103551 () Bool)

(assert (=> d!122597 (= c!103551 (bvsge #b00000000000000000000000000000000 (size!31402 (_keys!11119 thiss!1427))))))

(assert (=> d!122597 (and (bvsle #b00000000000000000000000000000000 (size!31402 (_keys!11119 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31402 (_keys!11119 thiss!1427)) (size!31402 (_keys!11119 thiss!1427))))))

(assert (=> d!122597 (= (arrayCountValidKeys!0 (_keys!11119 thiss!1427) #b00000000000000000000000000000000 (size!31402 (_keys!11119 thiss!1427))) lt!450540)))

(declare-fun b!1023968 () Bool)

(assert (=> b!1023968 (= e!577107 e!577106)))

(declare-fun c!103552 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1023968 (= c!103552 (validKeyInArray!0 (select (arr!30891 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1023969 () Bool)

(assert (=> b!1023969 (= e!577106 (bvadd #b00000000000000000000000000000001 call!43227))))

(assert (= (and d!122597 c!103551) b!1023967))

(assert (= (and d!122597 (not c!103551)) b!1023968))

(assert (= (and b!1023968 c!103552) b!1023969))

(assert (= (and b!1023968 (not c!103552)) b!1023966))

(assert (= (or b!1023969 b!1023966) bm!43224))

(declare-fun m!942515 () Bool)

(assert (=> bm!43224 m!942515))

(declare-fun m!942517 () Bool)

(assert (=> b!1023968 m!942517))

(assert (=> b!1023968 m!942517))

(declare-fun m!942519 () Bool)

(assert (=> b!1023968 m!942519))

(assert (=> b!1023935 d!122597))

(declare-fun b!1023980 () Bool)

(declare-fun e!577116 () Bool)

(declare-fun call!43230 () Bool)

(assert (=> b!1023980 (= e!577116 call!43230)))

(declare-fun b!1023982 () Bool)

(declare-fun e!577117 () Bool)

(assert (=> b!1023982 (= e!577117 e!577116)))

(declare-fun c!103555 () Bool)

(assert (=> b!1023982 (= c!103555 (validKeyInArray!0 (select (arr!30891 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1023983 () Bool)

(declare-fun e!577119 () Bool)

(assert (=> b!1023983 (= e!577119 e!577117)))

(declare-fun res!685656 () Bool)

(assert (=> b!1023983 (=> (not res!685656) (not e!577117))))

(declare-fun e!577118 () Bool)

(assert (=> b!1023983 (= res!685656 (not e!577118))))

(declare-fun res!685657 () Bool)

(assert (=> b!1023983 (=> (not res!685657) (not e!577118))))

(assert (=> b!1023983 (= res!685657 (validKeyInArray!0 (select (arr!30891 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43227 () Bool)

(assert (=> bm!43227 (= call!43230 (arrayNoDuplicates!0 (_keys!11119 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103555 (Cons!21720 (select (arr!30891 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000) Nil!21721) Nil!21721)))))

(declare-fun b!1023984 () Bool)

(assert (=> b!1023984 (= e!577116 call!43230)))

(declare-fun b!1023981 () Bool)

(declare-fun contains!5941 (List!21724 (_ BitVec 64)) Bool)

(assert (=> b!1023981 (= e!577118 (contains!5941 Nil!21721 (select (arr!30891 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!122599 () Bool)

(declare-fun res!685658 () Bool)

(assert (=> d!122599 (=> res!685658 e!577119)))

(assert (=> d!122599 (= res!685658 (bvsge #b00000000000000000000000000000000 (size!31402 (_keys!11119 thiss!1427))))))

(assert (=> d!122599 (= (arrayNoDuplicates!0 (_keys!11119 thiss!1427) #b00000000000000000000000000000000 Nil!21721) e!577119)))

(assert (= (and d!122599 (not res!685658)) b!1023983))

(assert (= (and b!1023983 res!685657) b!1023981))

(assert (= (and b!1023983 res!685656) b!1023982))

(assert (= (and b!1023982 c!103555) b!1023984))

(assert (= (and b!1023982 (not c!103555)) b!1023980))

(assert (= (or b!1023984 b!1023980) bm!43227))

(assert (=> b!1023982 m!942517))

(assert (=> b!1023982 m!942517))

(assert (=> b!1023982 m!942519))

(assert (=> b!1023983 m!942517))

(assert (=> b!1023983 m!942517))

(assert (=> b!1023983 m!942519))

(assert (=> bm!43227 m!942517))

(declare-fun m!942521 () Bool)

(assert (=> bm!43227 m!942521))

(assert (=> b!1023981 m!942517))

(assert (=> b!1023981 m!942517))

(declare-fun m!942523 () Bool)

(assert (=> b!1023981 m!942523))

(assert (=> b!1023937 d!122599))

(declare-fun d!122601 () Bool)

(declare-fun res!685664 () Bool)

(declare-fun e!577127 () Bool)

(assert (=> d!122601 (=> res!685664 e!577127)))

(assert (=> d!122601 (= res!685664 (bvsge #b00000000000000000000000000000000 (size!31402 (_keys!11119 thiss!1427))))))

(assert (=> d!122601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11119 thiss!1427) (mask!29609 thiss!1427)) e!577127)))

(declare-fun b!1023993 () Bool)

(declare-fun e!577128 () Bool)

(assert (=> b!1023993 (= e!577127 e!577128)))

(declare-fun c!103558 () Bool)

(assert (=> b!1023993 (= c!103558 (validKeyInArray!0 (select (arr!30891 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43230 () Bool)

(declare-fun call!43233 () Bool)

(assert (=> bm!43230 (= call!43233 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11119 thiss!1427) (mask!29609 thiss!1427)))))

(declare-fun b!1023994 () Bool)

(declare-fun e!577126 () Bool)

(assert (=> b!1023994 (= e!577128 e!577126)))

(declare-fun lt!450548 () (_ BitVec 64))

(assert (=> b!1023994 (= lt!450548 (select (arr!30891 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33341 0))(
  ( (Unit!33342) )
))
(declare-fun lt!450547 () Unit!33341)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64158 (_ BitVec 64) (_ BitVec 32)) Unit!33341)

(assert (=> b!1023994 (= lt!450547 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11119 thiss!1427) lt!450548 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1023994 (arrayContainsKey!0 (_keys!11119 thiss!1427) lt!450548 #b00000000000000000000000000000000)))

(declare-fun lt!450549 () Unit!33341)

(assert (=> b!1023994 (= lt!450549 lt!450547)))

(declare-fun res!685663 () Bool)

(declare-datatypes ((SeekEntryResult!9588 0))(
  ( (MissingZero!9588 (index!40723 (_ BitVec 32))) (Found!9588 (index!40724 (_ BitVec 32))) (Intermediate!9588 (undefined!10400 Bool) (index!40725 (_ BitVec 32)) (x!91012 (_ BitVec 32))) (Undefined!9588) (MissingVacant!9588 (index!40726 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64158 (_ BitVec 32)) SeekEntryResult!9588)

(assert (=> b!1023994 (= res!685663 (= (seekEntryOrOpen!0 (select (arr!30891 (_keys!11119 thiss!1427)) #b00000000000000000000000000000000) (_keys!11119 thiss!1427) (mask!29609 thiss!1427)) (Found!9588 #b00000000000000000000000000000000)))))

(assert (=> b!1023994 (=> (not res!685663) (not e!577126))))

(declare-fun b!1023995 () Bool)

(assert (=> b!1023995 (= e!577126 call!43233)))

(declare-fun b!1023996 () Bool)

(assert (=> b!1023996 (= e!577128 call!43233)))

(assert (= (and d!122601 (not res!685664)) b!1023993))

(assert (= (and b!1023993 c!103558) b!1023994))

(assert (= (and b!1023993 (not c!103558)) b!1023996))

(assert (= (and b!1023994 res!685663) b!1023995))

(assert (= (or b!1023995 b!1023996) bm!43230))

(assert (=> b!1023993 m!942517))

(assert (=> b!1023993 m!942517))

(assert (=> b!1023993 m!942519))

(declare-fun m!942525 () Bool)

(assert (=> bm!43230 m!942525))

(assert (=> b!1023994 m!942517))

(declare-fun m!942527 () Bool)

(assert (=> b!1023994 m!942527))

(declare-fun m!942529 () Bool)

(assert (=> b!1023994 m!942529))

(assert (=> b!1023994 m!942517))

(declare-fun m!942531 () Bool)

(assert (=> b!1023994 m!942531))

(assert (=> b!1023936 d!122601))

(declare-fun b!1023997 () Bool)

(declare-fun e!577129 () Bool)

(assert (=> b!1023997 (= e!577129 tp_is_empty!24057)))

(declare-fun mapIsEmpty!37510 () Bool)

(declare-fun mapRes!37510 () Bool)

(assert (=> mapIsEmpty!37510 mapRes!37510))

(declare-fun condMapEmpty!37510 () Bool)

(declare-fun mapDefault!37510 () ValueCell!11325)

(assert (=> mapNonEmpty!37509 (= condMapEmpty!37510 (= mapRest!37509 ((as const (Array (_ BitVec 32) ValueCell!11325)) mapDefault!37510)))))

(declare-fun e!577130 () Bool)

(assert (=> mapNonEmpty!37509 (= tp!72055 (and e!577130 mapRes!37510))))

(declare-fun b!1023998 () Bool)

(assert (=> b!1023998 (= e!577130 tp_is_empty!24057)))

(declare-fun mapNonEmpty!37510 () Bool)

(declare-fun tp!72056 () Bool)

(assert (=> mapNonEmpty!37510 (= mapRes!37510 (and tp!72056 e!577129))))

(declare-fun mapKey!37510 () (_ BitVec 32))

(declare-fun mapRest!37510 () (Array (_ BitVec 32) ValueCell!11325))

(declare-fun mapValue!37510 () ValueCell!11325)

(assert (=> mapNonEmpty!37510 (= mapRest!37509 (store mapRest!37510 mapKey!37510 mapValue!37510))))

(assert (= (and mapNonEmpty!37509 condMapEmpty!37510) mapIsEmpty!37510))

(assert (= (and mapNonEmpty!37509 (not condMapEmpty!37510)) mapNonEmpty!37510))

(assert (= (and mapNonEmpty!37510 ((_ is ValueCellFull!11325) mapValue!37510)) b!1023997))

(assert (= (and mapNonEmpty!37509 ((_ is ValueCellFull!11325) mapDefault!37510)) b!1023998))

(declare-fun m!942533 () Bool)

(assert (=> mapNonEmpty!37510 m!942533))

(check-sat (not d!122595) (not b!1023982) b_and!32583 (not b!1023956) tp_is_empty!24057 (not b_next!20337) (not b!1023993) (not b!1023981) (not bm!43230) (not bm!43224) (not b!1023955) (not b!1023983) (not mapNonEmpty!37510) (not bm!43227) (not b!1023968) (not b!1023994))
(check-sat b_and!32583 (not b_next!20337))
