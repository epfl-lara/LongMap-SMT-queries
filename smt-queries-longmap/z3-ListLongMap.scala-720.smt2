; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16826 () Bool)

(assert start!16826)

(declare-fun b!169663 () Bool)

(declare-fun b_free!4161 () Bool)

(declare-fun b_next!4161 () Bool)

(assert (=> b!169663 (= b_free!4161 (not b_next!4161))))

(declare-fun tp!15084 () Bool)

(declare-fun b_and!10575 () Bool)

(assert (=> b!169663 (= tp!15084 b_and!10575)))

(declare-fun mapNonEmpty!6663 () Bool)

(declare-fun mapRes!6663 () Bool)

(declare-fun tp!15083 () Bool)

(declare-fun e!111892 () Bool)

(assert (=> mapNonEmpty!6663 (= mapRes!6663 (and tp!15083 e!111892))))

(declare-datatypes ((V!4891 0))(
  ( (V!4892 (val!2011 Int)) )
))
(declare-datatypes ((ValueCell!1623 0))(
  ( (ValueCellFull!1623 (v!3876 V!4891)) (EmptyCell!1623) )
))
(declare-fun mapValue!6663 () ValueCell!1623)

(declare-datatypes ((array!6963 0))(
  ( (array!6964 (arr!3317 (Array (_ BitVec 32) (_ BitVec 64))) (size!3605 (_ BitVec 32))) )
))
(declare-datatypes ((array!6965 0))(
  ( (array!6966 (arr!3318 (Array (_ BitVec 32) ValueCell!1623)) (size!3606 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2154 0))(
  ( (LongMapFixedSize!2155 (defaultEntry!3519 Int) (mask!8308 (_ BitVec 32)) (extraKeys!3260 (_ BitVec 32)) (zeroValue!3362 V!4891) (minValue!3362 V!4891) (_size!1126 (_ BitVec 32)) (_keys!5344 array!6963) (_values!3502 array!6965) (_vacant!1126 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2154)

(declare-fun mapKey!6663 () (_ BitVec 32))

(declare-fun mapRest!6663 () (Array (_ BitVec 32) ValueCell!1623))

(assert (=> mapNonEmpty!6663 (= (arr!3318 (_values!3502 thiss!1248)) (store mapRest!6663 mapKey!6663 mapValue!6663))))

(declare-fun b!169660 () Bool)

(declare-fun e!111891 () Bool)

(declare-fun e!111893 () Bool)

(assert (=> b!169660 (= e!111891 (and e!111893 mapRes!6663))))

(declare-fun condMapEmpty!6663 () Bool)

(declare-fun mapDefault!6663 () ValueCell!1623)

(assert (=> b!169660 (= condMapEmpty!6663 (= (arr!3318 (_values!3502 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1623)) mapDefault!6663)))))

(declare-fun b!169661 () Bool)

(declare-fun e!111896 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169661 (= e!111896 (not (validMask!0 (mask!8308 thiss!1248))))))

(declare-fun b!169662 () Bool)

(declare-fun tp_is_empty!3933 () Bool)

(assert (=> b!169662 (= e!111892 tp_is_empty!3933)))

(declare-fun e!111894 () Bool)

(declare-fun array_inv!2129 (array!6963) Bool)

(declare-fun array_inv!2130 (array!6965) Bool)

(assert (=> b!169663 (= e!111894 (and tp!15084 tp_is_empty!3933 (array_inv!2129 (_keys!5344 thiss!1248)) (array_inv!2130 (_values!3502 thiss!1248)) e!111891))))

(declare-fun b!169664 () Bool)

(assert (=> b!169664 (= e!111893 tp_is_empty!3933)))

(declare-fun b!169665 () Bool)

(declare-fun res!80661 () Bool)

(assert (=> b!169665 (=> (not res!80661) (not e!111896))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169665 (= res!80661 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6663 () Bool)

(assert (=> mapIsEmpty!6663 mapRes!6663))

(declare-fun res!80660 () Bool)

(assert (=> start!16826 (=> (not res!80660) (not e!111896))))

(declare-fun valid!927 (LongMapFixedSize!2154) Bool)

(assert (=> start!16826 (= res!80660 (valid!927 thiss!1248))))

(assert (=> start!16826 e!111896))

(assert (=> start!16826 e!111894))

(assert (=> start!16826 true))

(assert (= (and start!16826 res!80660) b!169665))

(assert (= (and b!169665 res!80661) b!169661))

(assert (= (and b!169660 condMapEmpty!6663) mapIsEmpty!6663))

(assert (= (and b!169660 (not condMapEmpty!6663)) mapNonEmpty!6663))

(get-info :version)

(assert (= (and mapNonEmpty!6663 ((_ is ValueCellFull!1623) mapValue!6663)) b!169662))

(assert (= (and b!169660 ((_ is ValueCellFull!1623) mapDefault!6663)) b!169664))

(assert (= b!169663 b!169660))

(assert (= start!16826 b!169663))

(declare-fun m!198583 () Bool)

(assert (=> mapNonEmpty!6663 m!198583))

(declare-fun m!198585 () Bool)

(assert (=> b!169661 m!198585))

(declare-fun m!198587 () Bool)

(assert (=> b!169663 m!198587))

(declare-fun m!198589 () Bool)

(assert (=> b!169663 m!198589))

(declare-fun m!198591 () Bool)

(assert (=> start!16826 m!198591))

(check-sat (not b!169663) (not mapNonEmpty!6663) tp_is_empty!3933 (not start!16826) (not b_next!4161) b_and!10575 (not b!169661))
(check-sat b_and!10575 (not b_next!4161))
(get-model)

(declare-fun d!51633 () Bool)

(assert (=> d!51633 (= (array_inv!2129 (_keys!5344 thiss!1248)) (bvsge (size!3605 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169663 d!51633))

(declare-fun d!51635 () Bool)

(assert (=> d!51635 (= (array_inv!2130 (_values!3502 thiss!1248)) (bvsge (size!3606 (_values!3502 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169663 d!51635))

(declare-fun d!51637 () Bool)

(declare-fun res!80674 () Bool)

(declare-fun e!111917 () Bool)

(assert (=> d!51637 (=> (not res!80674) (not e!111917))))

(declare-fun simpleValid!127 (LongMapFixedSize!2154) Bool)

(assert (=> d!51637 (= res!80674 (simpleValid!127 thiss!1248))))

(assert (=> d!51637 (= (valid!927 thiss!1248) e!111917)))

(declare-fun b!169690 () Bool)

(declare-fun res!80675 () Bool)

(assert (=> b!169690 (=> (not res!80675) (not e!111917))))

(declare-fun arrayCountValidKeys!0 (array!6963 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!169690 (= res!80675 (= (arrayCountValidKeys!0 (_keys!5344 thiss!1248) #b00000000000000000000000000000000 (size!3605 (_keys!5344 thiss!1248))) (_size!1126 thiss!1248)))))

(declare-fun b!169691 () Bool)

(declare-fun res!80676 () Bool)

(assert (=> b!169691 (=> (not res!80676) (not e!111917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6963 (_ BitVec 32)) Bool)

(assert (=> b!169691 (= res!80676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5344 thiss!1248) (mask!8308 thiss!1248)))))

(declare-fun b!169692 () Bool)

(declare-datatypes ((List!2183 0))(
  ( (Nil!2180) (Cons!2179 (h!2796 (_ BitVec 64)) (t!6985 List!2183)) )
))
(declare-fun arrayNoDuplicates!0 (array!6963 (_ BitVec 32) List!2183) Bool)

(assert (=> b!169692 (= e!111917 (arrayNoDuplicates!0 (_keys!5344 thiss!1248) #b00000000000000000000000000000000 Nil!2180))))

(assert (= (and d!51637 res!80674) b!169690))

(assert (= (and b!169690 res!80675) b!169691))

(assert (= (and b!169691 res!80676) b!169692))

(declare-fun m!198603 () Bool)

(assert (=> d!51637 m!198603))

(declare-fun m!198605 () Bool)

(assert (=> b!169690 m!198605))

(declare-fun m!198607 () Bool)

(assert (=> b!169691 m!198607))

(declare-fun m!198609 () Bool)

(assert (=> b!169692 m!198609))

(assert (=> start!16826 d!51637))

(declare-fun d!51639 () Bool)

(assert (=> d!51639 (= (validMask!0 (mask!8308 thiss!1248)) (and (or (= (mask!8308 thiss!1248) #b00000000000000000000000000000111) (= (mask!8308 thiss!1248) #b00000000000000000000000000001111) (= (mask!8308 thiss!1248) #b00000000000000000000000000011111) (= (mask!8308 thiss!1248) #b00000000000000000000000000111111) (= (mask!8308 thiss!1248) #b00000000000000000000000001111111) (= (mask!8308 thiss!1248) #b00000000000000000000000011111111) (= (mask!8308 thiss!1248) #b00000000000000000000000111111111) (= (mask!8308 thiss!1248) #b00000000000000000000001111111111) (= (mask!8308 thiss!1248) #b00000000000000000000011111111111) (= (mask!8308 thiss!1248) #b00000000000000000000111111111111) (= (mask!8308 thiss!1248) #b00000000000000000001111111111111) (= (mask!8308 thiss!1248) #b00000000000000000011111111111111) (= (mask!8308 thiss!1248) #b00000000000000000111111111111111) (= (mask!8308 thiss!1248) #b00000000000000001111111111111111) (= (mask!8308 thiss!1248) #b00000000000000011111111111111111) (= (mask!8308 thiss!1248) #b00000000000000111111111111111111) (= (mask!8308 thiss!1248) #b00000000000001111111111111111111) (= (mask!8308 thiss!1248) #b00000000000011111111111111111111) (= (mask!8308 thiss!1248) #b00000000000111111111111111111111) (= (mask!8308 thiss!1248) #b00000000001111111111111111111111) (= (mask!8308 thiss!1248) #b00000000011111111111111111111111) (= (mask!8308 thiss!1248) #b00000000111111111111111111111111) (= (mask!8308 thiss!1248) #b00000001111111111111111111111111) (= (mask!8308 thiss!1248) #b00000011111111111111111111111111) (= (mask!8308 thiss!1248) #b00000111111111111111111111111111) (= (mask!8308 thiss!1248) #b00001111111111111111111111111111) (= (mask!8308 thiss!1248) #b00011111111111111111111111111111) (= (mask!8308 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8308 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169661 d!51639))

(declare-fun b!169700 () Bool)

(declare-fun e!111922 () Bool)

(assert (=> b!169700 (= e!111922 tp_is_empty!3933)))

(declare-fun condMapEmpty!6669 () Bool)

(declare-fun mapDefault!6669 () ValueCell!1623)

(assert (=> mapNonEmpty!6663 (= condMapEmpty!6669 (= mapRest!6663 ((as const (Array (_ BitVec 32) ValueCell!1623)) mapDefault!6669)))))

(declare-fun mapRes!6669 () Bool)

(assert (=> mapNonEmpty!6663 (= tp!15083 (and e!111922 mapRes!6669))))

(declare-fun mapNonEmpty!6669 () Bool)

(declare-fun tp!15093 () Bool)

(declare-fun e!111923 () Bool)

(assert (=> mapNonEmpty!6669 (= mapRes!6669 (and tp!15093 e!111923))))

(declare-fun mapKey!6669 () (_ BitVec 32))

(declare-fun mapRest!6669 () (Array (_ BitVec 32) ValueCell!1623))

(declare-fun mapValue!6669 () ValueCell!1623)

(assert (=> mapNonEmpty!6669 (= mapRest!6663 (store mapRest!6669 mapKey!6669 mapValue!6669))))

(declare-fun b!169699 () Bool)

(assert (=> b!169699 (= e!111923 tp_is_empty!3933)))

(declare-fun mapIsEmpty!6669 () Bool)

(assert (=> mapIsEmpty!6669 mapRes!6669))

(assert (= (and mapNonEmpty!6663 condMapEmpty!6669) mapIsEmpty!6669))

(assert (= (and mapNonEmpty!6663 (not condMapEmpty!6669)) mapNonEmpty!6669))

(assert (= (and mapNonEmpty!6669 ((_ is ValueCellFull!1623) mapValue!6669)) b!169699))

(assert (= (and mapNonEmpty!6663 ((_ is ValueCellFull!1623) mapDefault!6669)) b!169700))

(declare-fun m!198611 () Bool)

(assert (=> mapNonEmpty!6669 m!198611))

(check-sat tp_is_empty!3933 (not b_next!4161) (not mapNonEmpty!6669) (not b!169692) (not b!169691) b_and!10575 (not b!169690) (not d!51637))
(check-sat b_and!10575 (not b_next!4161))
(get-model)

(declare-fun d!51641 () Bool)

(declare-fun res!80685 () Bool)

(declare-fun e!111934 () Bool)

(assert (=> d!51641 (=> res!80685 e!111934)))

(assert (=> d!51641 (= res!80685 (bvsge #b00000000000000000000000000000000 (size!3605 (_keys!5344 thiss!1248))))))

(assert (=> d!51641 (= (arrayNoDuplicates!0 (_keys!5344 thiss!1248) #b00000000000000000000000000000000 Nil!2180) e!111934)))

(declare-fun b!169711 () Bool)

(declare-fun e!111933 () Bool)

(assert (=> b!169711 (= e!111934 e!111933)))

(declare-fun res!80683 () Bool)

(assert (=> b!169711 (=> (not res!80683) (not e!111933))))

(declare-fun e!111932 () Bool)

(assert (=> b!169711 (= res!80683 (not e!111932))))

(declare-fun res!80684 () Bool)

(assert (=> b!169711 (=> (not res!80684) (not e!111932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!169711 (= res!80684 (validKeyInArray!0 (select (arr!3317 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169712 () Bool)

(declare-fun e!111935 () Bool)

(declare-fun call!17338 () Bool)

(assert (=> b!169712 (= e!111935 call!17338)))

(declare-fun bm!17335 () Bool)

(declare-fun c!30430 () Bool)

(assert (=> bm!17335 (= call!17338 (arrayNoDuplicates!0 (_keys!5344 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30430 (Cons!2179 (select (arr!3317 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000) Nil!2180) Nil!2180)))))

(declare-fun b!169713 () Bool)

(assert (=> b!169713 (= e!111935 call!17338)))

(declare-fun b!169714 () Bool)

(declare-fun contains!1137 (List!2183 (_ BitVec 64)) Bool)

(assert (=> b!169714 (= e!111932 (contains!1137 Nil!2180 (select (arr!3317 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169715 () Bool)

(assert (=> b!169715 (= e!111933 e!111935)))

(assert (=> b!169715 (= c!30430 (validKeyInArray!0 (select (arr!3317 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51641 (not res!80685)) b!169711))

(assert (= (and b!169711 res!80684) b!169714))

(assert (= (and b!169711 res!80683) b!169715))

(assert (= (and b!169715 c!30430) b!169712))

(assert (= (and b!169715 (not c!30430)) b!169713))

(assert (= (or b!169712 b!169713) bm!17335))

(declare-fun m!198613 () Bool)

(assert (=> b!169711 m!198613))

(assert (=> b!169711 m!198613))

(declare-fun m!198615 () Bool)

(assert (=> b!169711 m!198615))

(assert (=> bm!17335 m!198613))

(declare-fun m!198617 () Bool)

(assert (=> bm!17335 m!198617))

(assert (=> b!169714 m!198613))

(assert (=> b!169714 m!198613))

(declare-fun m!198619 () Bool)

(assert (=> b!169714 m!198619))

(assert (=> b!169715 m!198613))

(assert (=> b!169715 m!198613))

(assert (=> b!169715 m!198615))

(assert (=> b!169692 d!51641))

(declare-fun d!51643 () Bool)

(declare-fun res!80691 () Bool)

(declare-fun e!111942 () Bool)

(assert (=> d!51643 (=> res!80691 e!111942)))

(assert (=> d!51643 (= res!80691 (bvsge #b00000000000000000000000000000000 (size!3605 (_keys!5344 thiss!1248))))))

(assert (=> d!51643 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5344 thiss!1248) (mask!8308 thiss!1248)) e!111942)))

(declare-fun b!169724 () Bool)

(declare-fun e!111943 () Bool)

(assert (=> b!169724 (= e!111942 e!111943)))

(declare-fun c!30433 () Bool)

(assert (=> b!169724 (= c!30433 (validKeyInArray!0 (select (arr!3317 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17338 () Bool)

(declare-fun call!17341 () Bool)

(assert (=> bm!17338 (= call!17341 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5344 thiss!1248) (mask!8308 thiss!1248)))))

(declare-fun b!169725 () Bool)

(declare-fun e!111944 () Bool)

(assert (=> b!169725 (= e!111944 call!17341)))

(declare-fun b!169726 () Bool)

(assert (=> b!169726 (= e!111943 call!17341)))

(declare-fun b!169727 () Bool)

(assert (=> b!169727 (= e!111943 e!111944)))

(declare-fun lt!84957 () (_ BitVec 64))

(assert (=> b!169727 (= lt!84957 (select (arr!3317 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5236 0))(
  ( (Unit!5237) )
))
(declare-fun lt!84958 () Unit!5236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6963 (_ BitVec 64) (_ BitVec 32)) Unit!5236)

(assert (=> b!169727 (= lt!84958 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5344 thiss!1248) lt!84957 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!169727 (arrayContainsKey!0 (_keys!5344 thiss!1248) lt!84957 #b00000000000000000000000000000000)))

(declare-fun lt!84956 () Unit!5236)

(assert (=> b!169727 (= lt!84956 lt!84958)))

(declare-fun res!80690 () Bool)

(declare-datatypes ((SeekEntryResult!527 0))(
  ( (MissingZero!527 (index!4276 (_ BitVec 32))) (Found!527 (index!4277 (_ BitVec 32))) (Intermediate!527 (undefined!1339 Bool) (index!4278 (_ BitVec 32)) (x!18753 (_ BitVec 32))) (Undefined!527) (MissingVacant!527 (index!4279 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6963 (_ BitVec 32)) SeekEntryResult!527)

(assert (=> b!169727 (= res!80690 (= (seekEntryOrOpen!0 (select (arr!3317 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000) (_keys!5344 thiss!1248) (mask!8308 thiss!1248)) (Found!527 #b00000000000000000000000000000000)))))

(assert (=> b!169727 (=> (not res!80690) (not e!111944))))

(assert (= (and d!51643 (not res!80691)) b!169724))

(assert (= (and b!169724 c!30433) b!169727))

(assert (= (and b!169724 (not c!30433)) b!169726))

(assert (= (and b!169727 res!80690) b!169725))

(assert (= (or b!169725 b!169726) bm!17338))

(assert (=> b!169724 m!198613))

(assert (=> b!169724 m!198613))

(assert (=> b!169724 m!198615))

(declare-fun m!198621 () Bool)

(assert (=> bm!17338 m!198621))

(assert (=> b!169727 m!198613))

(declare-fun m!198623 () Bool)

(assert (=> b!169727 m!198623))

(declare-fun m!198625 () Bool)

(assert (=> b!169727 m!198625))

(assert (=> b!169727 m!198613))

(declare-fun m!198627 () Bool)

(assert (=> b!169727 m!198627))

(assert (=> b!169691 d!51643))

(declare-fun b!169736 () Bool)

(declare-fun e!111950 () (_ BitVec 32))

(declare-fun call!17344 () (_ BitVec 32))

(assert (=> b!169736 (= e!111950 (bvadd #b00000000000000000000000000000001 call!17344))))

(declare-fun b!169737 () Bool)

(declare-fun e!111949 () (_ BitVec 32))

(assert (=> b!169737 (= e!111949 #b00000000000000000000000000000000)))

(declare-fun b!169738 () Bool)

(assert (=> b!169738 (= e!111949 e!111950)))

(declare-fun c!30439 () Bool)

(assert (=> b!169738 (= c!30439 (validKeyInArray!0 (select (arr!3317 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51645 () Bool)

(declare-fun lt!84961 () (_ BitVec 32))

(assert (=> d!51645 (and (bvsge lt!84961 #b00000000000000000000000000000000) (bvsle lt!84961 (bvsub (size!3605 (_keys!5344 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51645 (= lt!84961 e!111949)))

(declare-fun c!30438 () Bool)

(assert (=> d!51645 (= c!30438 (bvsge #b00000000000000000000000000000000 (size!3605 (_keys!5344 thiss!1248))))))

(assert (=> d!51645 (and (bvsle #b00000000000000000000000000000000 (size!3605 (_keys!5344 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3605 (_keys!5344 thiss!1248)) (size!3605 (_keys!5344 thiss!1248))))))

(assert (=> d!51645 (= (arrayCountValidKeys!0 (_keys!5344 thiss!1248) #b00000000000000000000000000000000 (size!3605 (_keys!5344 thiss!1248))) lt!84961)))

(declare-fun bm!17341 () Bool)

(assert (=> bm!17341 (= call!17344 (arrayCountValidKeys!0 (_keys!5344 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3605 (_keys!5344 thiss!1248))))))

(declare-fun b!169739 () Bool)

(assert (=> b!169739 (= e!111950 call!17344)))

(assert (= (and d!51645 c!30438) b!169737))

(assert (= (and d!51645 (not c!30438)) b!169738))

(assert (= (and b!169738 c!30439) b!169736))

(assert (= (and b!169738 (not c!30439)) b!169739))

(assert (= (or b!169736 b!169739) bm!17341))

(assert (=> b!169738 m!198613))

(assert (=> b!169738 m!198613))

(assert (=> b!169738 m!198615))

(declare-fun m!198629 () Bool)

(assert (=> bm!17341 m!198629))

(assert (=> b!169690 d!51645))

(declare-fun b!169748 () Bool)

(declare-fun res!80700 () Bool)

(declare-fun e!111953 () Bool)

(assert (=> b!169748 (=> (not res!80700) (not e!111953))))

(assert (=> b!169748 (= res!80700 (and (= (size!3606 (_values!3502 thiss!1248)) (bvadd (mask!8308 thiss!1248) #b00000000000000000000000000000001)) (= (size!3605 (_keys!5344 thiss!1248)) (size!3606 (_values!3502 thiss!1248))) (bvsge (_size!1126 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1126 thiss!1248) (bvadd (mask!8308 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!169750 () Bool)

(declare-fun res!80701 () Bool)

(assert (=> b!169750 (=> (not res!80701) (not e!111953))))

(declare-fun size!3609 (LongMapFixedSize!2154) (_ BitVec 32))

(assert (=> b!169750 (= res!80701 (= (size!3609 thiss!1248) (bvadd (_size!1126 thiss!1248) (bvsdiv (bvadd (extraKeys!3260 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!169749 () Bool)

(declare-fun res!80703 () Bool)

(assert (=> b!169749 (=> (not res!80703) (not e!111953))))

(assert (=> b!169749 (= res!80703 (bvsge (size!3609 thiss!1248) (_size!1126 thiss!1248)))))

(declare-fun b!169751 () Bool)

(assert (=> b!169751 (= e!111953 (and (bvsge (extraKeys!3260 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3260 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1126 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51647 () Bool)

(declare-fun res!80702 () Bool)

(assert (=> d!51647 (=> (not res!80702) (not e!111953))))

(assert (=> d!51647 (= res!80702 (validMask!0 (mask!8308 thiss!1248)))))

(assert (=> d!51647 (= (simpleValid!127 thiss!1248) e!111953)))

(assert (= (and d!51647 res!80702) b!169748))

(assert (= (and b!169748 res!80700) b!169749))

(assert (= (and b!169749 res!80703) b!169750))

(assert (= (and b!169750 res!80701) b!169751))

(declare-fun m!198631 () Bool)

(assert (=> b!169750 m!198631))

(assert (=> b!169749 m!198631))

(assert (=> d!51647 m!198585))

(assert (=> d!51637 d!51647))

(declare-fun b!169753 () Bool)

(declare-fun e!111954 () Bool)

(assert (=> b!169753 (= e!111954 tp_is_empty!3933)))

(declare-fun condMapEmpty!6670 () Bool)

(declare-fun mapDefault!6670 () ValueCell!1623)

(assert (=> mapNonEmpty!6669 (= condMapEmpty!6670 (= mapRest!6669 ((as const (Array (_ BitVec 32) ValueCell!1623)) mapDefault!6670)))))

(declare-fun mapRes!6670 () Bool)

(assert (=> mapNonEmpty!6669 (= tp!15093 (and e!111954 mapRes!6670))))

(declare-fun mapNonEmpty!6670 () Bool)

(declare-fun tp!15094 () Bool)

(declare-fun e!111955 () Bool)

(assert (=> mapNonEmpty!6670 (= mapRes!6670 (and tp!15094 e!111955))))

(declare-fun mapValue!6670 () ValueCell!1623)

(declare-fun mapRest!6670 () (Array (_ BitVec 32) ValueCell!1623))

(declare-fun mapKey!6670 () (_ BitVec 32))

(assert (=> mapNonEmpty!6670 (= mapRest!6669 (store mapRest!6670 mapKey!6670 mapValue!6670))))

(declare-fun b!169752 () Bool)

(assert (=> b!169752 (= e!111955 tp_is_empty!3933)))

(declare-fun mapIsEmpty!6670 () Bool)

(assert (=> mapIsEmpty!6670 mapRes!6670))

(assert (= (and mapNonEmpty!6669 condMapEmpty!6670) mapIsEmpty!6670))

(assert (= (and mapNonEmpty!6669 (not condMapEmpty!6670)) mapNonEmpty!6670))

(assert (= (and mapNonEmpty!6670 ((_ is ValueCellFull!1623) mapValue!6670)) b!169752))

(assert (= (and mapNonEmpty!6669 ((_ is ValueCellFull!1623) mapDefault!6670)) b!169753))

(declare-fun m!198633 () Bool)

(assert (=> mapNonEmpty!6670 m!198633))

(check-sat (not mapNonEmpty!6670) (not b!169727) tp_is_empty!3933 (not b_next!4161) (not b!169715) (not b!169714) (not bm!17341) (not b!169711) (not bm!17335) (not d!51647) (not bm!17338) (not b!169750) (not b!169738) (not b!169724) b_and!10575 (not b!169749))
(check-sat b_and!10575 (not b_next!4161))
