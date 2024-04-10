; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16974 () Bool)

(assert start!16974)

(declare-fun b!170661 () Bool)

(declare-fun b_free!4221 () Bool)

(declare-fun b_next!4221 () Bool)

(assert (=> b!170661 (= b_free!4221 (not b_next!4221))))

(declare-fun tp!15287 () Bool)

(declare-fun b_and!10635 () Bool)

(assert (=> b!170661 (= tp!15287 b_and!10635)))

(declare-fun b!170658 () Bool)

(declare-fun e!112647 () Bool)

(declare-fun tp_is_empty!3993 () Bool)

(assert (=> b!170658 (= e!112647 tp_is_empty!3993)))

(declare-fun b!170659 () Bool)

(declare-fun e!112648 () Bool)

(assert (=> b!170659 (= e!112648 tp_is_empty!3993)))

(declare-fun res!81123 () Bool)

(declare-fun e!112650 () Bool)

(assert (=> start!16974 (=> (not res!81123) (not e!112650))))

(declare-datatypes ((V!4971 0))(
  ( (V!4972 (val!2041 Int)) )
))
(declare-datatypes ((ValueCell!1653 0))(
  ( (ValueCellFull!1653 (v!3906 V!4971)) (EmptyCell!1653) )
))
(declare-datatypes ((array!7095 0))(
  ( (array!7096 (arr!3377 (Array (_ BitVec 32) (_ BitVec 64))) (size!3670 (_ BitVec 32))) )
))
(declare-datatypes ((array!7097 0))(
  ( (array!7098 (arr!3378 (Array (_ BitVec 32) ValueCell!1653)) (size!3671 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2214 0))(
  ( (LongMapFixedSize!2215 (defaultEntry!3549 Int) (mask!8369 (_ BitVec 32)) (extraKeys!3290 (_ BitVec 32)) (zeroValue!3392 V!4971) (minValue!3392 V!4971) (_size!1156 (_ BitVec 32)) (_keys!5379 array!7095) (_values!3532 array!7097) (_vacant!1156 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2214)

(declare-fun valid!943 (LongMapFixedSize!2214) Bool)

(assert (=> start!16974 (= res!81123 (valid!943 thiss!1248))))

(assert (=> start!16974 e!112650))

(declare-fun e!112649 () Bool)

(assert (=> start!16974 e!112649))

(assert (=> start!16974 true))

(declare-fun mapNonEmpty!6776 () Bool)

(declare-fun mapRes!6776 () Bool)

(declare-fun tp!15286 () Bool)

(assert (=> mapNonEmpty!6776 (= mapRes!6776 (and tp!15286 e!112648))))

(declare-fun mapRest!6776 () (Array (_ BitVec 32) ValueCell!1653))

(declare-fun mapKey!6776 () (_ BitVec 32))

(declare-fun mapValue!6776 () ValueCell!1653)

(assert (=> mapNonEmpty!6776 (= (arr!3378 (_values!3532 thiss!1248)) (store mapRest!6776 mapKey!6776 mapValue!6776))))

(declare-fun b!170660 () Bool)

(declare-fun e!112646 () Bool)

(assert (=> b!170660 (= e!112646 (and e!112647 mapRes!6776))))

(declare-fun condMapEmpty!6776 () Bool)

(declare-fun mapDefault!6776 () ValueCell!1653)

(assert (=> b!170660 (= condMapEmpty!6776 (= (arr!3378 (_values!3532 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1653)) mapDefault!6776)))))

(declare-fun mapIsEmpty!6776 () Bool)

(assert (=> mapIsEmpty!6776 mapRes!6776))

(declare-fun array_inv!2159 (array!7095) Bool)

(declare-fun array_inv!2160 (array!7097) Bool)

(assert (=> b!170661 (= e!112649 (and tp!15287 tp_is_empty!3993 (array_inv!2159 (_keys!5379 thiss!1248)) (array_inv!2160 (_values!3532 thiss!1248)) e!112646))))

(declare-fun b!170662 () Bool)

(declare-fun res!81122 () Bool)

(assert (=> b!170662 (=> (not res!81122) (not e!112650))))

(assert (=> b!170662 (= res!81122 (and (= (size!3671 (_values!3532 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8369 thiss!1248))) (= (size!3670 (_keys!5379 thiss!1248)) (size!3671 (_values!3532 thiss!1248))) (bvsge (mask!8369 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3290 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3290 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3290 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3290 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3290 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3290 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!3290 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!170663 () Bool)

(declare-fun res!81120 () Bool)

(assert (=> b!170663 (=> (not res!81120) (not e!112650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170663 (= res!81120 (validMask!0 (mask!8369 thiss!1248)))))

(declare-fun b!170664 () Bool)

(declare-fun res!81121 () Bool)

(assert (=> b!170664 (=> (not res!81121) (not e!112650))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170664 (= res!81121 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170665 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7095 (_ BitVec 32)) Bool)

(assert (=> b!170665 (= e!112650 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5379 thiss!1248) (mask!8369 thiss!1248))))))

(assert (= (and start!16974 res!81123) b!170664))

(assert (= (and b!170664 res!81121) b!170663))

(assert (= (and b!170663 res!81120) b!170662))

(assert (= (and b!170662 res!81122) b!170665))

(assert (= (and b!170660 condMapEmpty!6776) mapIsEmpty!6776))

(assert (= (and b!170660 (not condMapEmpty!6776)) mapNonEmpty!6776))

(get-info :version)

(assert (= (and mapNonEmpty!6776 ((_ is ValueCellFull!1653) mapValue!6776)) b!170659))

(assert (= (and b!170660 ((_ is ValueCellFull!1653) mapDefault!6776)) b!170658))

(assert (= b!170661 b!170660))

(assert (= start!16974 b!170661))

(declare-fun m!199055 () Bool)

(assert (=> mapNonEmpty!6776 m!199055))

(declare-fun m!199057 () Bool)

(assert (=> b!170661 m!199057))

(declare-fun m!199059 () Bool)

(assert (=> b!170661 m!199059))

(declare-fun m!199061 () Bool)

(assert (=> b!170665 m!199061))

(declare-fun m!199063 () Bool)

(assert (=> start!16974 m!199063))

(declare-fun m!199065 () Bool)

(assert (=> b!170663 m!199065))

(check-sat (not mapNonEmpty!6776) tp_is_empty!3993 (not b!170663) (not start!16974) (not b_next!4221) (not b!170665) (not b!170661) b_and!10635)
(check-sat b_and!10635 (not b_next!4221))
(get-model)

(declare-fun d!51741 () Bool)

(assert (=> d!51741 (= (array_inv!2159 (_keys!5379 thiss!1248)) (bvsge (size!3670 (_keys!5379 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170661 d!51741))

(declare-fun d!51743 () Bool)

(assert (=> d!51743 (= (array_inv!2160 (_values!3532 thiss!1248)) (bvsge (size!3671 (_values!3532 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170661 d!51743))

(declare-fun d!51745 () Bool)

(assert (=> d!51745 (= (validMask!0 (mask!8369 thiss!1248)) (and (or (= (mask!8369 thiss!1248) #b00000000000000000000000000000111) (= (mask!8369 thiss!1248) #b00000000000000000000000000001111) (= (mask!8369 thiss!1248) #b00000000000000000000000000011111) (= (mask!8369 thiss!1248) #b00000000000000000000000000111111) (= (mask!8369 thiss!1248) #b00000000000000000000000001111111) (= (mask!8369 thiss!1248) #b00000000000000000000000011111111) (= (mask!8369 thiss!1248) #b00000000000000000000000111111111) (= (mask!8369 thiss!1248) #b00000000000000000000001111111111) (= (mask!8369 thiss!1248) #b00000000000000000000011111111111) (= (mask!8369 thiss!1248) #b00000000000000000000111111111111) (= (mask!8369 thiss!1248) #b00000000000000000001111111111111) (= (mask!8369 thiss!1248) #b00000000000000000011111111111111) (= (mask!8369 thiss!1248) #b00000000000000000111111111111111) (= (mask!8369 thiss!1248) #b00000000000000001111111111111111) (= (mask!8369 thiss!1248) #b00000000000000011111111111111111) (= (mask!8369 thiss!1248) #b00000000000000111111111111111111) (= (mask!8369 thiss!1248) #b00000000000001111111111111111111) (= (mask!8369 thiss!1248) #b00000000000011111111111111111111) (= (mask!8369 thiss!1248) #b00000000000111111111111111111111) (= (mask!8369 thiss!1248) #b00000000001111111111111111111111) (= (mask!8369 thiss!1248) #b00000000011111111111111111111111) (= (mask!8369 thiss!1248) #b00000000111111111111111111111111) (= (mask!8369 thiss!1248) #b00000001111111111111111111111111) (= (mask!8369 thiss!1248) #b00000011111111111111111111111111) (= (mask!8369 thiss!1248) #b00000111111111111111111111111111) (= (mask!8369 thiss!1248) #b00001111111111111111111111111111) (= (mask!8369 thiss!1248) #b00011111111111111111111111111111) (= (mask!8369 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8369 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170663 d!51745))

(declare-fun d!51747 () Bool)

(declare-fun res!81142 () Bool)

(declare-fun e!112671 () Bool)

(assert (=> d!51747 (=> (not res!81142) (not e!112671))))

(declare-fun simpleValid!133 (LongMapFixedSize!2214) Bool)

(assert (=> d!51747 (= res!81142 (simpleValid!133 thiss!1248))))

(assert (=> d!51747 (= (valid!943 thiss!1248) e!112671)))

(declare-fun b!170696 () Bool)

(declare-fun res!81143 () Bool)

(assert (=> b!170696 (=> (not res!81143) (not e!112671))))

(declare-fun arrayCountValidKeys!0 (array!7095 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170696 (= res!81143 (= (arrayCountValidKeys!0 (_keys!5379 thiss!1248) #b00000000000000000000000000000000 (size!3670 (_keys!5379 thiss!1248))) (_size!1156 thiss!1248)))))

(declare-fun b!170697 () Bool)

(declare-fun res!81144 () Bool)

(assert (=> b!170697 (=> (not res!81144) (not e!112671))))

(assert (=> b!170697 (= res!81144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5379 thiss!1248) (mask!8369 thiss!1248)))))

(declare-fun b!170698 () Bool)

(declare-datatypes ((List!2189 0))(
  ( (Nil!2186) (Cons!2185 (h!2802 (_ BitVec 64)) (t!6991 List!2189)) )
))
(declare-fun arrayNoDuplicates!0 (array!7095 (_ BitVec 32) List!2189) Bool)

(assert (=> b!170698 (= e!112671 (arrayNoDuplicates!0 (_keys!5379 thiss!1248) #b00000000000000000000000000000000 Nil!2186))))

(assert (= (and d!51747 res!81142) b!170696))

(assert (= (and b!170696 res!81143) b!170697))

(assert (= (and b!170697 res!81144) b!170698))

(declare-fun m!199079 () Bool)

(assert (=> d!51747 m!199079))

(declare-fun m!199081 () Bool)

(assert (=> b!170696 m!199081))

(assert (=> b!170697 m!199061))

(declare-fun m!199083 () Bool)

(assert (=> b!170698 m!199083))

(assert (=> start!16974 d!51747))

(declare-fun b!170707 () Bool)

(declare-fun e!112678 () Bool)

(declare-fun e!112680 () Bool)

(assert (=> b!170707 (= e!112678 e!112680)))

(declare-fun lt!85016 () (_ BitVec 64))

(assert (=> b!170707 (= lt!85016 (select (arr!3377 (_keys!5379 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5246 0))(
  ( (Unit!5247) )
))
(declare-fun lt!85017 () Unit!5246)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7095 (_ BitVec 64) (_ BitVec 32)) Unit!5246)

(assert (=> b!170707 (= lt!85017 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5379 thiss!1248) lt!85016 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170707 (arrayContainsKey!0 (_keys!5379 thiss!1248) lt!85016 #b00000000000000000000000000000000)))

(declare-fun lt!85018 () Unit!5246)

(assert (=> b!170707 (= lt!85018 lt!85017)))

(declare-fun res!81150 () Bool)

(declare-datatypes ((SeekEntryResult!532 0))(
  ( (MissingZero!532 (index!4296 (_ BitVec 32))) (Found!532 (index!4297 (_ BitVec 32))) (Intermediate!532 (undefined!1344 Bool) (index!4298 (_ BitVec 32)) (x!18910 (_ BitVec 32))) (Undefined!532) (MissingVacant!532 (index!4299 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7095 (_ BitVec 32)) SeekEntryResult!532)

(assert (=> b!170707 (= res!81150 (= (seekEntryOrOpen!0 (select (arr!3377 (_keys!5379 thiss!1248)) #b00000000000000000000000000000000) (_keys!5379 thiss!1248) (mask!8369 thiss!1248)) (Found!532 #b00000000000000000000000000000000)))))

(assert (=> b!170707 (=> (not res!81150) (not e!112680))))

(declare-fun b!170708 () Bool)

(declare-fun e!112679 () Bool)

(assert (=> b!170708 (= e!112679 e!112678)))

(declare-fun c!30490 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170708 (= c!30490 (validKeyInArray!0 (select (arr!3377 (_keys!5379 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170709 () Bool)

(declare-fun call!17383 () Bool)

(assert (=> b!170709 (= e!112678 call!17383)))

(declare-fun d!51749 () Bool)

(declare-fun res!81149 () Bool)

(assert (=> d!51749 (=> res!81149 e!112679)))

(assert (=> d!51749 (= res!81149 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5379 thiss!1248))))))

(assert (=> d!51749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5379 thiss!1248) (mask!8369 thiss!1248)) e!112679)))

(declare-fun bm!17380 () Bool)

(assert (=> bm!17380 (= call!17383 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5379 thiss!1248) (mask!8369 thiss!1248)))))

(declare-fun b!170710 () Bool)

(assert (=> b!170710 (= e!112680 call!17383)))

(assert (= (and d!51749 (not res!81149)) b!170708))

(assert (= (and b!170708 c!30490) b!170707))

(assert (= (and b!170708 (not c!30490)) b!170709))

(assert (= (and b!170707 res!81150) b!170710))

(assert (= (or b!170710 b!170709) bm!17380))

(declare-fun m!199085 () Bool)

(assert (=> b!170707 m!199085))

(declare-fun m!199087 () Bool)

(assert (=> b!170707 m!199087))

(declare-fun m!199089 () Bool)

(assert (=> b!170707 m!199089))

(assert (=> b!170707 m!199085))

(declare-fun m!199091 () Bool)

(assert (=> b!170707 m!199091))

(assert (=> b!170708 m!199085))

(assert (=> b!170708 m!199085))

(declare-fun m!199093 () Bool)

(assert (=> b!170708 m!199093))

(declare-fun m!199095 () Bool)

(assert (=> bm!17380 m!199095))

(assert (=> b!170665 d!51749))

(declare-fun b!170717 () Bool)

(declare-fun e!112686 () Bool)

(assert (=> b!170717 (= e!112686 tp_is_empty!3993)))

(declare-fun mapNonEmpty!6782 () Bool)

(declare-fun mapRes!6782 () Bool)

(declare-fun tp!15296 () Bool)

(assert (=> mapNonEmpty!6782 (= mapRes!6782 (and tp!15296 e!112686))))

(declare-fun mapValue!6782 () ValueCell!1653)

(declare-fun mapRest!6782 () (Array (_ BitVec 32) ValueCell!1653))

(declare-fun mapKey!6782 () (_ BitVec 32))

(assert (=> mapNonEmpty!6782 (= mapRest!6776 (store mapRest!6782 mapKey!6782 mapValue!6782))))

(declare-fun condMapEmpty!6782 () Bool)

(declare-fun mapDefault!6782 () ValueCell!1653)

(assert (=> mapNonEmpty!6776 (= condMapEmpty!6782 (= mapRest!6776 ((as const (Array (_ BitVec 32) ValueCell!1653)) mapDefault!6782)))))

(declare-fun e!112685 () Bool)

(assert (=> mapNonEmpty!6776 (= tp!15286 (and e!112685 mapRes!6782))))

(declare-fun b!170718 () Bool)

(assert (=> b!170718 (= e!112685 tp_is_empty!3993)))

(declare-fun mapIsEmpty!6782 () Bool)

(assert (=> mapIsEmpty!6782 mapRes!6782))

(assert (= (and mapNonEmpty!6776 condMapEmpty!6782) mapIsEmpty!6782))

(assert (= (and mapNonEmpty!6776 (not condMapEmpty!6782)) mapNonEmpty!6782))

(assert (= (and mapNonEmpty!6782 ((_ is ValueCellFull!1653) mapValue!6782)) b!170717))

(assert (= (and mapNonEmpty!6776 ((_ is ValueCellFull!1653) mapDefault!6782)) b!170718))

(declare-fun m!199097 () Bool)

(assert (=> mapNonEmpty!6782 m!199097))

(check-sat tp_is_empty!3993 (not b!170696) b_and!10635 (not bm!17380) (not b!170697) (not mapNonEmpty!6782) (not b_next!4221) (not b!170707) (not b!170698) (not b!170708) (not d!51747))
(check-sat b_and!10635 (not b_next!4221))
