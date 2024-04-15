; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16992 () Bool)

(assert start!16992)

(declare-fun b!170593 () Bool)

(declare-fun b_free!4225 () Bool)

(declare-fun b_next!4225 () Bool)

(assert (=> b!170593 (= b_free!4225 (not b_next!4225))))

(declare-fun tp!15302 () Bool)

(declare-fun b_and!10613 () Bool)

(assert (=> b!170593 (= tp!15302 b_and!10613)))

(declare-fun b!170590 () Bool)

(declare-fun res!81066 () Bool)

(declare-fun e!112598 () Bool)

(assert (=> b!170590 (=> (not res!81066) (not e!112598))))

(declare-datatypes ((V!4977 0))(
  ( (V!4978 (val!2043 Int)) )
))
(declare-datatypes ((ValueCell!1655 0))(
  ( (ValueCellFull!1655 (v!3902 V!4977)) (EmptyCell!1655) )
))
(declare-datatypes ((array!7085 0))(
  ( (array!7086 (arr!3370 (Array (_ BitVec 32) (_ BitVec 64))) (size!3664 (_ BitVec 32))) )
))
(declare-datatypes ((array!7087 0))(
  ( (array!7088 (arr!3371 (Array (_ BitVec 32) ValueCell!1655)) (size!3665 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2218 0))(
  ( (LongMapFixedSize!2219 (defaultEntry!3551 Int) (mask!8374 (_ BitVec 32)) (extraKeys!3292 (_ BitVec 32)) (zeroValue!3394 V!4977) (minValue!3394 V!4977) (_size!1158 (_ BitVec 32)) (_keys!5381 array!7085) (_values!3534 array!7087) (_vacant!1158 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2218)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7085 (_ BitVec 32)) Bool)

(assert (=> b!170590 (= res!81066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5381 thiss!1248) (mask!8374 thiss!1248)))))

(declare-fun b!170591 () Bool)

(declare-fun res!81068 () Bool)

(assert (=> b!170591 (=> (not res!81068) (not e!112598))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170591 (= res!81068 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170592 () Bool)

(declare-datatypes ((List!2201 0))(
  ( (Nil!2198) (Cons!2197 (h!2814 (_ BitVec 64)) (t!6994 List!2201)) )
))
(declare-fun arrayNoDuplicates!0 (array!7085 (_ BitVec 32) List!2201) Bool)

(assert (=> b!170592 (= e!112598 (not (arrayNoDuplicates!0 (_keys!5381 thiss!1248) #b00000000000000000000000000000000 Nil!2198)))))

(declare-fun e!112601 () Bool)

(declare-fun e!112602 () Bool)

(declare-fun tp_is_empty!3997 () Bool)

(declare-fun array_inv!2175 (array!7085) Bool)

(declare-fun array_inv!2176 (array!7087) Bool)

(assert (=> b!170593 (= e!112601 (and tp!15302 tp_is_empty!3997 (array_inv!2175 (_keys!5381 thiss!1248)) (array_inv!2176 (_values!3534 thiss!1248)) e!112602))))

(declare-fun mapIsEmpty!6785 () Bool)

(declare-fun mapRes!6785 () Bool)

(assert (=> mapIsEmpty!6785 mapRes!6785))

(declare-fun b!170594 () Bool)

(declare-fun res!81069 () Bool)

(assert (=> b!170594 (=> (not res!81069) (not e!112598))))

(assert (=> b!170594 (= res!81069 (and (= (size!3665 (_values!3534 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8374 thiss!1248))) (= (size!3664 (_keys!5381 thiss!1248)) (size!3665 (_values!3534 thiss!1248))) (bvsge (mask!8374 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3292 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3292 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3292 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!170595 () Bool)

(declare-fun e!112599 () Bool)

(assert (=> b!170595 (= e!112602 (and e!112599 mapRes!6785))))

(declare-fun condMapEmpty!6785 () Bool)

(declare-fun mapDefault!6785 () ValueCell!1655)

(assert (=> b!170595 (= condMapEmpty!6785 (= (arr!3371 (_values!3534 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1655)) mapDefault!6785)))))

(declare-fun b!170596 () Bool)

(declare-fun e!112600 () Bool)

(assert (=> b!170596 (= e!112600 tp_is_empty!3997)))

(declare-fun b!170597 () Bool)

(assert (=> b!170597 (= e!112599 tp_is_empty!3997)))

(declare-fun res!81067 () Bool)

(assert (=> start!16992 (=> (not res!81067) (not e!112598))))

(declare-fun valid!965 (LongMapFixedSize!2218) Bool)

(assert (=> start!16992 (= res!81067 (valid!965 thiss!1248))))

(assert (=> start!16992 e!112598))

(assert (=> start!16992 e!112601))

(assert (=> start!16992 true))

(declare-fun mapNonEmpty!6785 () Bool)

(declare-fun tp!15301 () Bool)

(assert (=> mapNonEmpty!6785 (= mapRes!6785 (and tp!15301 e!112600))))

(declare-fun mapValue!6785 () ValueCell!1655)

(declare-fun mapRest!6785 () (Array (_ BitVec 32) ValueCell!1655))

(declare-fun mapKey!6785 () (_ BitVec 32))

(assert (=> mapNonEmpty!6785 (= (arr!3371 (_values!3534 thiss!1248)) (store mapRest!6785 mapKey!6785 mapValue!6785))))

(declare-fun b!170598 () Bool)

(declare-fun res!81070 () Bool)

(assert (=> b!170598 (=> (not res!81070) (not e!112598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170598 (= res!81070 (validMask!0 (mask!8374 thiss!1248)))))

(assert (= (and start!16992 res!81067) b!170591))

(assert (= (and b!170591 res!81068) b!170598))

(assert (= (and b!170598 res!81070) b!170594))

(assert (= (and b!170594 res!81069) b!170590))

(assert (= (and b!170590 res!81066) b!170592))

(assert (= (and b!170595 condMapEmpty!6785) mapIsEmpty!6785))

(assert (= (and b!170595 (not condMapEmpty!6785)) mapNonEmpty!6785))

(get-info :version)

(assert (= (and mapNonEmpty!6785 ((_ is ValueCellFull!1655) mapValue!6785)) b!170596))

(assert (= (and b!170595 ((_ is ValueCellFull!1655) mapDefault!6785)) b!170597))

(assert (= b!170593 b!170595))

(assert (= start!16992 b!170593))

(declare-fun m!198479 () Bool)

(assert (=> b!170590 m!198479))

(declare-fun m!198481 () Bool)

(assert (=> mapNonEmpty!6785 m!198481))

(declare-fun m!198483 () Bool)

(assert (=> b!170598 m!198483))

(declare-fun m!198485 () Bool)

(assert (=> b!170593 m!198485))

(declare-fun m!198487 () Bool)

(assert (=> b!170593 m!198487))

(declare-fun m!198489 () Bool)

(assert (=> start!16992 m!198489))

(declare-fun m!198491 () Bool)

(assert (=> b!170592 m!198491))

(check-sat b_and!10613 (not b_next!4225) (not mapNonEmpty!6785) (not b!170592) (not b!170598) tp_is_empty!3997 (not b!170590) (not start!16992) (not b!170593))
(check-sat b_and!10613 (not b_next!4225))
(get-model)

(declare-fun d!51605 () Bool)

(declare-fun res!81105 () Bool)

(declare-fun e!112647 () Bool)

(assert (=> d!51605 (=> res!81105 e!112647)))

(assert (=> d!51605 (= res!81105 (bvsge #b00000000000000000000000000000000 (size!3664 (_keys!5381 thiss!1248))))))

(assert (=> d!51605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5381 thiss!1248) (mask!8374 thiss!1248)) e!112647)))

(declare-fun bm!17359 () Bool)

(declare-fun call!17362 () Bool)

(assert (=> bm!17359 (= call!17362 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5381 thiss!1248) (mask!8374 thiss!1248)))))

(declare-fun b!170661 () Bool)

(declare-fun e!112646 () Bool)

(assert (=> b!170661 (= e!112647 e!112646)))

(declare-fun c!30467 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170661 (= c!30467 (validKeyInArray!0 (select (arr!3370 (_keys!5381 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170662 () Bool)

(assert (=> b!170662 (= e!112646 call!17362)))

(declare-fun b!170663 () Bool)

(declare-fun e!112648 () Bool)

(assert (=> b!170663 (= e!112648 call!17362)))

(declare-fun b!170664 () Bool)

(assert (=> b!170664 (= e!112646 e!112648)))

(declare-fun lt!84845 () (_ BitVec 64))

(assert (=> b!170664 (= lt!84845 (select (arr!3370 (_keys!5381 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5225 0))(
  ( (Unit!5226) )
))
(declare-fun lt!84844 () Unit!5225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7085 (_ BitVec 64) (_ BitVec 32)) Unit!5225)

(assert (=> b!170664 (= lt!84844 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5381 thiss!1248) lt!84845 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170664 (arrayContainsKey!0 (_keys!5381 thiss!1248) lt!84845 #b00000000000000000000000000000000)))

(declare-fun lt!84846 () Unit!5225)

(assert (=> b!170664 (= lt!84846 lt!84844)))

(declare-fun res!81106 () Bool)

(declare-datatypes ((SeekEntryResult!544 0))(
  ( (MissingZero!544 (index!4344 (_ BitVec 32))) (Found!544 (index!4345 (_ BitVec 32))) (Intermediate!544 (undefined!1356 Bool) (index!4346 (_ BitVec 32)) (x!18937 (_ BitVec 32))) (Undefined!544) (MissingVacant!544 (index!4347 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7085 (_ BitVec 32)) SeekEntryResult!544)

(assert (=> b!170664 (= res!81106 (= (seekEntryOrOpen!0 (select (arr!3370 (_keys!5381 thiss!1248)) #b00000000000000000000000000000000) (_keys!5381 thiss!1248) (mask!8374 thiss!1248)) (Found!544 #b00000000000000000000000000000000)))))

(assert (=> b!170664 (=> (not res!81106) (not e!112648))))

(assert (= (and d!51605 (not res!81105)) b!170661))

(assert (= (and b!170661 c!30467) b!170664))

(assert (= (and b!170661 (not c!30467)) b!170662))

(assert (= (and b!170664 res!81106) b!170663))

(assert (= (or b!170663 b!170662) bm!17359))

(declare-fun m!198521 () Bool)

(assert (=> bm!17359 m!198521))

(declare-fun m!198523 () Bool)

(assert (=> b!170661 m!198523))

(assert (=> b!170661 m!198523))

(declare-fun m!198525 () Bool)

(assert (=> b!170661 m!198525))

(assert (=> b!170664 m!198523))

(declare-fun m!198527 () Bool)

(assert (=> b!170664 m!198527))

(declare-fun m!198529 () Bool)

(assert (=> b!170664 m!198529))

(assert (=> b!170664 m!198523))

(declare-fun m!198531 () Bool)

(assert (=> b!170664 m!198531))

(assert (=> b!170590 d!51605))

(declare-fun b!170675 () Bool)

(declare-fun e!112660 () Bool)

(declare-fun contains!1141 (List!2201 (_ BitVec 64)) Bool)

(assert (=> b!170675 (= e!112660 (contains!1141 Nil!2198 (select (arr!3370 (_keys!5381 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170676 () Bool)

(declare-fun e!112657 () Bool)

(declare-fun e!112658 () Bool)

(assert (=> b!170676 (= e!112657 e!112658)))

(declare-fun res!81114 () Bool)

(assert (=> b!170676 (=> (not res!81114) (not e!112658))))

(assert (=> b!170676 (= res!81114 (not e!112660))))

(declare-fun res!81113 () Bool)

(assert (=> b!170676 (=> (not res!81113) (not e!112660))))

(assert (=> b!170676 (= res!81113 (validKeyInArray!0 (select (arr!3370 (_keys!5381 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17362 () Bool)

(declare-fun call!17365 () Bool)

(declare-fun c!30470 () Bool)

(assert (=> bm!17362 (= call!17365 (arrayNoDuplicates!0 (_keys!5381 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30470 (Cons!2197 (select (arr!3370 (_keys!5381 thiss!1248)) #b00000000000000000000000000000000) Nil!2198) Nil!2198)))))

(declare-fun b!170677 () Bool)

(declare-fun e!112659 () Bool)

(assert (=> b!170677 (= e!112659 call!17365)))

(declare-fun d!51607 () Bool)

(declare-fun res!81115 () Bool)

(assert (=> d!51607 (=> res!81115 e!112657)))

(assert (=> d!51607 (= res!81115 (bvsge #b00000000000000000000000000000000 (size!3664 (_keys!5381 thiss!1248))))))

(assert (=> d!51607 (= (arrayNoDuplicates!0 (_keys!5381 thiss!1248) #b00000000000000000000000000000000 Nil!2198) e!112657)))

(declare-fun b!170678 () Bool)

(assert (=> b!170678 (= e!112658 e!112659)))

(assert (=> b!170678 (= c!30470 (validKeyInArray!0 (select (arr!3370 (_keys!5381 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170679 () Bool)

(assert (=> b!170679 (= e!112659 call!17365)))

(assert (= (and d!51607 (not res!81115)) b!170676))

(assert (= (and b!170676 res!81113) b!170675))

(assert (= (and b!170676 res!81114) b!170678))

(assert (= (and b!170678 c!30470) b!170677))

(assert (= (and b!170678 (not c!30470)) b!170679))

(assert (= (or b!170677 b!170679) bm!17362))

(assert (=> b!170675 m!198523))

(assert (=> b!170675 m!198523))

(declare-fun m!198533 () Bool)

(assert (=> b!170675 m!198533))

(assert (=> b!170676 m!198523))

(assert (=> b!170676 m!198523))

(assert (=> b!170676 m!198525))

(assert (=> bm!17362 m!198523))

(declare-fun m!198535 () Bool)

(assert (=> bm!17362 m!198535))

(assert (=> b!170678 m!198523))

(assert (=> b!170678 m!198523))

(assert (=> b!170678 m!198525))

(assert (=> b!170592 d!51607))

(declare-fun d!51609 () Bool)

(declare-fun res!81122 () Bool)

(declare-fun e!112663 () Bool)

(assert (=> d!51609 (=> (not res!81122) (not e!112663))))

(declare-fun simpleValid!134 (LongMapFixedSize!2218) Bool)

(assert (=> d!51609 (= res!81122 (simpleValid!134 thiss!1248))))

(assert (=> d!51609 (= (valid!965 thiss!1248) e!112663)))

(declare-fun b!170686 () Bool)

(declare-fun res!81123 () Bool)

(assert (=> b!170686 (=> (not res!81123) (not e!112663))))

(declare-fun arrayCountValidKeys!0 (array!7085 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170686 (= res!81123 (= (arrayCountValidKeys!0 (_keys!5381 thiss!1248) #b00000000000000000000000000000000 (size!3664 (_keys!5381 thiss!1248))) (_size!1158 thiss!1248)))))

(declare-fun b!170687 () Bool)

(declare-fun res!81124 () Bool)

(assert (=> b!170687 (=> (not res!81124) (not e!112663))))

(assert (=> b!170687 (= res!81124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5381 thiss!1248) (mask!8374 thiss!1248)))))

(declare-fun b!170688 () Bool)

(assert (=> b!170688 (= e!112663 (arrayNoDuplicates!0 (_keys!5381 thiss!1248) #b00000000000000000000000000000000 Nil!2198))))

(assert (= (and d!51609 res!81122) b!170686))

(assert (= (and b!170686 res!81123) b!170687))

(assert (= (and b!170687 res!81124) b!170688))

(declare-fun m!198537 () Bool)

(assert (=> d!51609 m!198537))

(declare-fun m!198539 () Bool)

(assert (=> b!170686 m!198539))

(assert (=> b!170687 m!198479))

(assert (=> b!170688 m!198491))

(assert (=> start!16992 d!51609))

(declare-fun d!51611 () Bool)

(assert (=> d!51611 (= (array_inv!2175 (_keys!5381 thiss!1248)) (bvsge (size!3664 (_keys!5381 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170593 d!51611))

(declare-fun d!51613 () Bool)

(assert (=> d!51613 (= (array_inv!2176 (_values!3534 thiss!1248)) (bvsge (size!3665 (_values!3534 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170593 d!51613))

(declare-fun d!51615 () Bool)

(assert (=> d!51615 (= (validMask!0 (mask!8374 thiss!1248)) (and (or (= (mask!8374 thiss!1248) #b00000000000000000000000000000111) (= (mask!8374 thiss!1248) #b00000000000000000000000000001111) (= (mask!8374 thiss!1248) #b00000000000000000000000000011111) (= (mask!8374 thiss!1248) #b00000000000000000000000000111111) (= (mask!8374 thiss!1248) #b00000000000000000000000001111111) (= (mask!8374 thiss!1248) #b00000000000000000000000011111111) (= (mask!8374 thiss!1248) #b00000000000000000000000111111111) (= (mask!8374 thiss!1248) #b00000000000000000000001111111111) (= (mask!8374 thiss!1248) #b00000000000000000000011111111111) (= (mask!8374 thiss!1248) #b00000000000000000000111111111111) (= (mask!8374 thiss!1248) #b00000000000000000001111111111111) (= (mask!8374 thiss!1248) #b00000000000000000011111111111111) (= (mask!8374 thiss!1248) #b00000000000000000111111111111111) (= (mask!8374 thiss!1248) #b00000000000000001111111111111111) (= (mask!8374 thiss!1248) #b00000000000000011111111111111111) (= (mask!8374 thiss!1248) #b00000000000000111111111111111111) (= (mask!8374 thiss!1248) #b00000000000001111111111111111111) (= (mask!8374 thiss!1248) #b00000000000011111111111111111111) (= (mask!8374 thiss!1248) #b00000000000111111111111111111111) (= (mask!8374 thiss!1248) #b00000000001111111111111111111111) (= (mask!8374 thiss!1248) #b00000000011111111111111111111111) (= (mask!8374 thiss!1248) #b00000000111111111111111111111111) (= (mask!8374 thiss!1248) #b00000001111111111111111111111111) (= (mask!8374 thiss!1248) #b00000011111111111111111111111111) (= (mask!8374 thiss!1248) #b00000111111111111111111111111111) (= (mask!8374 thiss!1248) #b00001111111111111111111111111111) (= (mask!8374 thiss!1248) #b00011111111111111111111111111111) (= (mask!8374 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8374 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170598 d!51615))

(declare-fun mapNonEmpty!6794 () Bool)

(declare-fun mapRes!6794 () Bool)

(declare-fun tp!15317 () Bool)

(declare-fun e!112668 () Bool)

(assert (=> mapNonEmpty!6794 (= mapRes!6794 (and tp!15317 e!112668))))

(declare-fun mapKey!6794 () (_ BitVec 32))

(declare-fun mapValue!6794 () ValueCell!1655)

(declare-fun mapRest!6794 () (Array (_ BitVec 32) ValueCell!1655))

(assert (=> mapNonEmpty!6794 (= mapRest!6785 (store mapRest!6794 mapKey!6794 mapValue!6794))))

(declare-fun condMapEmpty!6794 () Bool)

(declare-fun mapDefault!6794 () ValueCell!1655)

(assert (=> mapNonEmpty!6785 (= condMapEmpty!6794 (= mapRest!6785 ((as const (Array (_ BitVec 32) ValueCell!1655)) mapDefault!6794)))))

(declare-fun e!112669 () Bool)

(assert (=> mapNonEmpty!6785 (= tp!15301 (and e!112669 mapRes!6794))))

(declare-fun mapIsEmpty!6794 () Bool)

(assert (=> mapIsEmpty!6794 mapRes!6794))

(declare-fun b!170695 () Bool)

(assert (=> b!170695 (= e!112668 tp_is_empty!3997)))

(declare-fun b!170696 () Bool)

(assert (=> b!170696 (= e!112669 tp_is_empty!3997)))

(assert (= (and mapNonEmpty!6785 condMapEmpty!6794) mapIsEmpty!6794))

(assert (= (and mapNonEmpty!6785 (not condMapEmpty!6794)) mapNonEmpty!6794))

(assert (= (and mapNonEmpty!6794 ((_ is ValueCellFull!1655) mapValue!6794)) b!170695))

(assert (= (and mapNonEmpty!6785 ((_ is ValueCellFull!1655) mapDefault!6794)) b!170696))

(declare-fun m!198541 () Bool)

(assert (=> mapNonEmpty!6794 m!198541))

(check-sat (not b!170688) (not b!170687) (not b!170664) b_and!10613 (not b!170675) (not b!170678) (not d!51609) tp_is_empty!3997 (not b!170661) (not mapNonEmpty!6794) (not b!170686) (not bm!17362) (not b!170676) (not bm!17359) (not b_next!4225))
(check-sat b_and!10613 (not b_next!4225))
