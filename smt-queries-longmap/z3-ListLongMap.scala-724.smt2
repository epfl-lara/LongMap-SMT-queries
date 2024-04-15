; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16908 () Bool)

(assert start!16908)

(declare-fun b!169967 () Bool)

(declare-fun b_free!4183 () Bool)

(declare-fun b_next!4183 () Bool)

(assert (=> b!169967 (= b_free!4183 (not b_next!4183))))

(declare-fun tp!15164 () Bool)

(declare-fun b_and!10571 () Bool)

(assert (=> b!169967 (= tp!15164 b_and!10571)))

(declare-fun mapNonEmpty!6711 () Bool)

(declare-fun mapRes!6711 () Bool)

(declare-fun tp!15165 () Bool)

(declare-fun e!112120 () Bool)

(assert (=> mapNonEmpty!6711 (= mapRes!6711 (and tp!15165 e!112120))))

(declare-fun mapKey!6711 () (_ BitVec 32))

(declare-datatypes ((V!4921 0))(
  ( (V!4922 (val!2022 Int)) )
))
(declare-datatypes ((ValueCell!1634 0))(
  ( (ValueCellFull!1634 (v!3881 V!4921)) (EmptyCell!1634) )
))
(declare-fun mapRest!6711 () (Array (_ BitVec 32) ValueCell!1634))

(declare-fun mapValue!6711 () ValueCell!1634)

(declare-datatypes ((array!6995 0))(
  ( (array!6996 (arr!3328 (Array (_ BitVec 32) (_ BitVec 64))) (size!3620 (_ BitVec 32))) )
))
(declare-datatypes ((array!6997 0))(
  ( (array!6998 (arr!3329 (Array (_ BitVec 32) ValueCell!1634)) (size!3621 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2176 0))(
  ( (LongMapFixedSize!2177 (defaultEntry!3530 Int) (mask!8333 (_ BitVec 32)) (extraKeys!3271 (_ BitVec 32)) (zeroValue!3373 V!4921) (minValue!3373 V!4921) (_size!1137 (_ BitVec 32)) (_keys!5357 array!6995) (_values!3513 array!6997) (_vacant!1137 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2176)

(assert (=> mapNonEmpty!6711 (= (arr!3329 (_values!3513 thiss!1248)) (store mapRest!6711 mapKey!6711 mapValue!6711))))

(declare-fun tp_is_empty!3955 () Bool)

(declare-fun e!112121 () Bool)

(declare-fun e!112125 () Bool)

(declare-fun array_inv!2141 (array!6995) Bool)

(declare-fun array_inv!2142 (array!6997) Bool)

(assert (=> b!169967 (= e!112125 (and tp!15164 tp_is_empty!3955 (array_inv!2141 (_keys!5357 thiss!1248)) (array_inv!2142 (_values!3513 thiss!1248)) e!112121))))

(declare-fun mapIsEmpty!6711 () Bool)

(assert (=> mapIsEmpty!6711 mapRes!6711))

(declare-fun b!169968 () Bool)

(declare-fun e!112124 () Bool)

(assert (=> b!169968 (= e!112124 (and (= (size!3621 (_values!3513 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8333 thiss!1248))) (= (size!3620 (_keys!5357 thiss!1248)) (size!3621 (_values!3513 thiss!1248))) (bvsge (mask!8333 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3271 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!169969 () Bool)

(declare-fun res!80778 () Bool)

(assert (=> b!169969 (=> (not res!80778) (not e!112124))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169969 (= res!80778 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!80777 () Bool)

(assert (=> start!16908 (=> (not res!80777) (not e!112124))))

(declare-fun valid!951 (LongMapFixedSize!2176) Bool)

(assert (=> start!16908 (= res!80777 (valid!951 thiss!1248))))

(assert (=> start!16908 e!112124))

(assert (=> start!16908 e!112125))

(assert (=> start!16908 true))

(declare-fun b!169970 () Bool)

(declare-fun res!80779 () Bool)

(assert (=> b!169970 (=> (not res!80779) (not e!112124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169970 (= res!80779 (validMask!0 (mask!8333 thiss!1248)))))

(declare-fun b!169971 () Bool)

(assert (=> b!169971 (= e!112120 tp_is_empty!3955)))

(declare-fun b!169972 () Bool)

(declare-fun e!112122 () Bool)

(assert (=> b!169972 (= e!112121 (and e!112122 mapRes!6711))))

(declare-fun condMapEmpty!6711 () Bool)

(declare-fun mapDefault!6711 () ValueCell!1634)

(assert (=> b!169972 (= condMapEmpty!6711 (= (arr!3329 (_values!3513 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1634)) mapDefault!6711)))))

(declare-fun b!169973 () Bool)

(assert (=> b!169973 (= e!112122 tp_is_empty!3955)))

(assert (= (and start!16908 res!80777) b!169969))

(assert (= (and b!169969 res!80778) b!169970))

(assert (= (and b!169970 res!80779) b!169968))

(assert (= (and b!169972 condMapEmpty!6711) mapIsEmpty!6711))

(assert (= (and b!169972 (not condMapEmpty!6711)) mapNonEmpty!6711))

(get-info :version)

(assert (= (and mapNonEmpty!6711 ((_ is ValueCellFull!1634) mapValue!6711)) b!169971))

(assert (= (and b!169972 ((_ is ValueCellFull!1634) mapDefault!6711)) b!169973))

(assert (= b!169967 b!169972))

(assert (= start!16908 b!169967))

(declare-fun m!198179 () Bool)

(assert (=> mapNonEmpty!6711 m!198179))

(declare-fun m!198181 () Bool)

(assert (=> b!169967 m!198181))

(declare-fun m!198183 () Bool)

(assert (=> b!169967 m!198183))

(declare-fun m!198185 () Bool)

(assert (=> start!16908 m!198185))

(declare-fun m!198187 () Bool)

(assert (=> b!169970 m!198187))

(check-sat tp_is_empty!3955 b_and!10571 (not b!169967) (not b_next!4183) (not mapNonEmpty!6711) (not start!16908) (not b!169970))
(check-sat b_and!10571 (not b_next!4183))
(get-model)

(declare-fun d!51549 () Bool)

(assert (=> d!51549 (= (array_inv!2141 (_keys!5357 thiss!1248)) (bvsge (size!3620 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169967 d!51549))

(declare-fun d!51551 () Bool)

(assert (=> d!51551 (= (array_inv!2142 (_values!3513 thiss!1248)) (bvsge (size!3621 (_values!3513 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169967 d!51551))

(declare-fun d!51553 () Bool)

(assert (=> d!51553 (= (validMask!0 (mask!8333 thiss!1248)) (and (or (= (mask!8333 thiss!1248) #b00000000000000000000000000000111) (= (mask!8333 thiss!1248) #b00000000000000000000000000001111) (= (mask!8333 thiss!1248) #b00000000000000000000000000011111) (= (mask!8333 thiss!1248) #b00000000000000000000000000111111) (= (mask!8333 thiss!1248) #b00000000000000000000000001111111) (= (mask!8333 thiss!1248) #b00000000000000000000000011111111) (= (mask!8333 thiss!1248) #b00000000000000000000000111111111) (= (mask!8333 thiss!1248) #b00000000000000000000001111111111) (= (mask!8333 thiss!1248) #b00000000000000000000011111111111) (= (mask!8333 thiss!1248) #b00000000000000000000111111111111) (= (mask!8333 thiss!1248) #b00000000000000000001111111111111) (= (mask!8333 thiss!1248) #b00000000000000000011111111111111) (= (mask!8333 thiss!1248) #b00000000000000000111111111111111) (= (mask!8333 thiss!1248) #b00000000000000001111111111111111) (= (mask!8333 thiss!1248) #b00000000000000011111111111111111) (= (mask!8333 thiss!1248) #b00000000000000111111111111111111) (= (mask!8333 thiss!1248) #b00000000000001111111111111111111) (= (mask!8333 thiss!1248) #b00000000000011111111111111111111) (= (mask!8333 thiss!1248) #b00000000000111111111111111111111) (= (mask!8333 thiss!1248) #b00000000001111111111111111111111) (= (mask!8333 thiss!1248) #b00000000011111111111111111111111) (= (mask!8333 thiss!1248) #b00000000111111111111111111111111) (= (mask!8333 thiss!1248) #b00000001111111111111111111111111) (= (mask!8333 thiss!1248) #b00000011111111111111111111111111) (= (mask!8333 thiss!1248) #b00000111111111111111111111111111) (= (mask!8333 thiss!1248) #b00001111111111111111111111111111) (= (mask!8333 thiss!1248) #b00011111111111111111111111111111) (= (mask!8333 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8333 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169970 d!51553))

(declare-fun d!51555 () Bool)

(declare-fun res!80804 () Bool)

(declare-fun e!112164 () Bool)

(assert (=> d!51555 (=> (not res!80804) (not e!112164))))

(declare-fun simpleValid!131 (LongMapFixedSize!2176) Bool)

(assert (=> d!51555 (= res!80804 (simpleValid!131 thiss!1248))))

(assert (=> d!51555 (= (valid!951 thiss!1248) e!112164)))

(declare-fun b!170022 () Bool)

(declare-fun res!80805 () Bool)

(assert (=> b!170022 (=> (not res!80805) (not e!112164))))

(declare-fun arrayCountValidKeys!0 (array!6995 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170022 (= res!80805 (= (arrayCountValidKeys!0 (_keys!5357 thiss!1248) #b00000000000000000000000000000000 (size!3620 (_keys!5357 thiss!1248))) (_size!1137 thiss!1248)))))

(declare-fun b!170023 () Bool)

(declare-fun res!80806 () Bool)

(assert (=> b!170023 (=> (not res!80806) (not e!112164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6995 (_ BitVec 32)) Bool)

(assert (=> b!170023 (= res!80806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5357 thiss!1248) (mask!8333 thiss!1248)))))

(declare-fun b!170024 () Bool)

(declare-datatypes ((List!2198 0))(
  ( (Nil!2195) (Cons!2194 (h!2811 (_ BitVec 64)) (t!6991 List!2198)) )
))
(declare-fun arrayNoDuplicates!0 (array!6995 (_ BitVec 32) List!2198) Bool)

(assert (=> b!170024 (= e!112164 (arrayNoDuplicates!0 (_keys!5357 thiss!1248) #b00000000000000000000000000000000 Nil!2195))))

(assert (= (and d!51555 res!80804) b!170022))

(assert (= (and b!170022 res!80805) b!170023))

(assert (= (and b!170023 res!80806) b!170024))

(declare-fun m!198209 () Bool)

(assert (=> d!51555 m!198209))

(declare-fun m!198211 () Bool)

(assert (=> b!170022 m!198211))

(declare-fun m!198213 () Bool)

(assert (=> b!170023 m!198213))

(declare-fun m!198215 () Bool)

(assert (=> b!170024 m!198215))

(assert (=> start!16908 d!51555))

(declare-fun condMapEmpty!6720 () Bool)

(declare-fun mapDefault!6720 () ValueCell!1634)

(assert (=> mapNonEmpty!6711 (= condMapEmpty!6720 (= mapRest!6711 ((as const (Array (_ BitVec 32) ValueCell!1634)) mapDefault!6720)))))

(declare-fun e!112170 () Bool)

(declare-fun mapRes!6720 () Bool)

(assert (=> mapNonEmpty!6711 (= tp!15165 (and e!112170 mapRes!6720))))

(declare-fun b!170032 () Bool)

(assert (=> b!170032 (= e!112170 tp_is_empty!3955)))

(declare-fun mapNonEmpty!6720 () Bool)

(declare-fun tp!15180 () Bool)

(declare-fun e!112169 () Bool)

(assert (=> mapNonEmpty!6720 (= mapRes!6720 (and tp!15180 e!112169))))

(declare-fun mapRest!6720 () (Array (_ BitVec 32) ValueCell!1634))

(declare-fun mapKey!6720 () (_ BitVec 32))

(declare-fun mapValue!6720 () ValueCell!1634)

(assert (=> mapNonEmpty!6720 (= mapRest!6711 (store mapRest!6720 mapKey!6720 mapValue!6720))))

(declare-fun b!170031 () Bool)

(assert (=> b!170031 (= e!112169 tp_is_empty!3955)))

(declare-fun mapIsEmpty!6720 () Bool)

(assert (=> mapIsEmpty!6720 mapRes!6720))

(assert (= (and mapNonEmpty!6711 condMapEmpty!6720) mapIsEmpty!6720))

(assert (= (and mapNonEmpty!6711 (not condMapEmpty!6720)) mapNonEmpty!6720))

(assert (= (and mapNonEmpty!6720 ((_ is ValueCellFull!1634) mapValue!6720)) b!170031))

(assert (= (and mapNonEmpty!6711 ((_ is ValueCellFull!1634) mapDefault!6720)) b!170032))

(declare-fun m!198217 () Bool)

(assert (=> mapNonEmpty!6720 m!198217))

(check-sat b_and!10571 (not b_next!4183) (not b!170022) (not mapNonEmpty!6720) tp_is_empty!3955 (not b!170024) (not b!170023) (not d!51555))
(check-sat b_and!10571 (not b_next!4183))
(get-model)

(declare-fun b!170043 () Bool)

(declare-fun e!112179 () Bool)

(declare-fun contains!1139 (List!2198 (_ BitVec 64)) Bool)

(assert (=> b!170043 (= e!112179 (contains!1139 Nil!2195 (select (arr!3328 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170044 () Bool)

(declare-fun e!112182 () Bool)

(declare-fun e!112181 () Bool)

(assert (=> b!170044 (= e!112182 e!112181)))

(declare-fun c!30440 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170044 (= c!30440 (validKeyInArray!0 (select (arr!3328 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170045 () Bool)

(declare-fun e!112180 () Bool)

(assert (=> b!170045 (= e!112180 e!112182)))

(declare-fun res!80813 () Bool)

(assert (=> b!170045 (=> (not res!80813) (not e!112182))))

(assert (=> b!170045 (= res!80813 (not e!112179))))

(declare-fun res!80814 () Bool)

(assert (=> b!170045 (=> (not res!80814) (not e!112179))))

(assert (=> b!170045 (= res!80814 (validKeyInArray!0 (select (arr!3328 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51557 () Bool)

(declare-fun res!80815 () Bool)

(assert (=> d!51557 (=> res!80815 e!112180)))

(assert (=> d!51557 (= res!80815 (bvsge #b00000000000000000000000000000000 (size!3620 (_keys!5357 thiss!1248))))))

(assert (=> d!51557 (= (arrayNoDuplicates!0 (_keys!5357 thiss!1248) #b00000000000000000000000000000000 Nil!2195) e!112180)))

(declare-fun bm!17338 () Bool)

(declare-fun call!17341 () Bool)

(assert (=> bm!17338 (= call!17341 (arrayNoDuplicates!0 (_keys!5357 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30440 (Cons!2194 (select (arr!3328 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000) Nil!2195) Nil!2195)))))

(declare-fun b!170046 () Bool)

(assert (=> b!170046 (= e!112181 call!17341)))

(declare-fun b!170047 () Bool)

(assert (=> b!170047 (= e!112181 call!17341)))

(assert (= (and d!51557 (not res!80815)) b!170045))

(assert (= (and b!170045 res!80814) b!170043))

(assert (= (and b!170045 res!80813) b!170044))

(assert (= (and b!170044 c!30440) b!170047))

(assert (= (and b!170044 (not c!30440)) b!170046))

(assert (= (or b!170047 b!170046) bm!17338))

(declare-fun m!198219 () Bool)

(assert (=> b!170043 m!198219))

(assert (=> b!170043 m!198219))

(declare-fun m!198221 () Bool)

(assert (=> b!170043 m!198221))

(assert (=> b!170044 m!198219))

(assert (=> b!170044 m!198219))

(declare-fun m!198223 () Bool)

(assert (=> b!170044 m!198223))

(assert (=> b!170045 m!198219))

(assert (=> b!170045 m!198219))

(assert (=> b!170045 m!198223))

(assert (=> bm!17338 m!198219))

(declare-fun m!198225 () Bool)

(assert (=> bm!17338 m!198225))

(assert (=> b!170024 d!51557))

(declare-fun b!170056 () Bool)

(declare-fun e!112190 () Bool)

(declare-fun call!17344 () Bool)

(assert (=> b!170056 (= e!112190 call!17344)))

(declare-fun b!170057 () Bool)

(declare-fun e!112191 () Bool)

(declare-fun e!112189 () Bool)

(assert (=> b!170057 (= e!112191 e!112189)))

(declare-fun c!30443 () Bool)

(assert (=> b!170057 (= c!30443 (validKeyInArray!0 (select (arr!3328 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170058 () Bool)

(assert (=> b!170058 (= e!112189 call!17344)))

(declare-fun b!170059 () Bool)

(assert (=> b!170059 (= e!112189 e!112190)))

(declare-fun lt!84811 () (_ BitVec 64))

(assert (=> b!170059 (= lt!84811 (select (arr!3328 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5219 0))(
  ( (Unit!5220) )
))
(declare-fun lt!84813 () Unit!5219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6995 (_ BitVec 64) (_ BitVec 32)) Unit!5219)

(assert (=> b!170059 (= lt!84813 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5357 thiss!1248) lt!84811 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170059 (arrayContainsKey!0 (_keys!5357 thiss!1248) lt!84811 #b00000000000000000000000000000000)))

(declare-fun lt!84812 () Unit!5219)

(assert (=> b!170059 (= lt!84812 lt!84813)))

(declare-fun res!80821 () Bool)

(declare-datatypes ((SeekEntryResult!541 0))(
  ( (MissingZero!541 (index!4332 (_ BitVec 32))) (Found!541 (index!4333 (_ BitVec 32))) (Intermediate!541 (undefined!1353 Bool) (index!4334 (_ BitVec 32)) (x!18848 (_ BitVec 32))) (Undefined!541) (MissingVacant!541 (index!4335 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6995 (_ BitVec 32)) SeekEntryResult!541)

(assert (=> b!170059 (= res!80821 (= (seekEntryOrOpen!0 (select (arr!3328 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000) (_keys!5357 thiss!1248) (mask!8333 thiss!1248)) (Found!541 #b00000000000000000000000000000000)))))

(assert (=> b!170059 (=> (not res!80821) (not e!112190))))

(declare-fun bm!17341 () Bool)

(assert (=> bm!17341 (= call!17344 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5357 thiss!1248) (mask!8333 thiss!1248)))))

(declare-fun d!51559 () Bool)

(declare-fun res!80820 () Bool)

(assert (=> d!51559 (=> res!80820 e!112191)))

(assert (=> d!51559 (= res!80820 (bvsge #b00000000000000000000000000000000 (size!3620 (_keys!5357 thiss!1248))))))

(assert (=> d!51559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5357 thiss!1248) (mask!8333 thiss!1248)) e!112191)))

(assert (= (and d!51559 (not res!80820)) b!170057))

(assert (= (and b!170057 c!30443) b!170059))

(assert (= (and b!170057 (not c!30443)) b!170058))

(assert (= (and b!170059 res!80821) b!170056))

(assert (= (or b!170056 b!170058) bm!17341))

(assert (=> b!170057 m!198219))

(assert (=> b!170057 m!198219))

(assert (=> b!170057 m!198223))

(assert (=> b!170059 m!198219))

(declare-fun m!198227 () Bool)

(assert (=> b!170059 m!198227))

(declare-fun m!198229 () Bool)

(assert (=> b!170059 m!198229))

(assert (=> b!170059 m!198219))

(declare-fun m!198231 () Bool)

(assert (=> b!170059 m!198231))

(declare-fun m!198233 () Bool)

(assert (=> bm!17341 m!198233))

(assert (=> b!170023 d!51559))

(declare-fun d!51561 () Bool)

(declare-fun res!80833 () Bool)

(declare-fun e!112194 () Bool)

(assert (=> d!51561 (=> (not res!80833) (not e!112194))))

(assert (=> d!51561 (= res!80833 (validMask!0 (mask!8333 thiss!1248)))))

(assert (=> d!51561 (= (simpleValid!131 thiss!1248) e!112194)))

(declare-fun b!170071 () Bool)

(assert (=> b!170071 (= e!112194 (and (bvsge (extraKeys!3271 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3271 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1137 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170070 () Bool)

(declare-fun res!80830 () Bool)

(assert (=> b!170070 (=> (not res!80830) (not e!112194))))

(declare-fun size!3626 (LongMapFixedSize!2176) (_ BitVec 32))

(assert (=> b!170070 (= res!80830 (= (size!3626 thiss!1248) (bvadd (_size!1137 thiss!1248) (bvsdiv (bvadd (extraKeys!3271 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!170069 () Bool)

(declare-fun res!80832 () Bool)

(assert (=> b!170069 (=> (not res!80832) (not e!112194))))

(assert (=> b!170069 (= res!80832 (bvsge (size!3626 thiss!1248) (_size!1137 thiss!1248)))))

(declare-fun b!170068 () Bool)

(declare-fun res!80831 () Bool)

(assert (=> b!170068 (=> (not res!80831) (not e!112194))))

(assert (=> b!170068 (= res!80831 (and (= (size!3621 (_values!3513 thiss!1248)) (bvadd (mask!8333 thiss!1248) #b00000000000000000000000000000001)) (= (size!3620 (_keys!5357 thiss!1248)) (size!3621 (_values!3513 thiss!1248))) (bvsge (_size!1137 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1137 thiss!1248) (bvadd (mask!8333 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!51561 res!80833) b!170068))

(assert (= (and b!170068 res!80831) b!170069))

(assert (= (and b!170069 res!80832) b!170070))

(assert (= (and b!170070 res!80830) b!170071))

(assert (=> d!51561 m!198187))

(declare-fun m!198235 () Bool)

(assert (=> b!170070 m!198235))

(assert (=> b!170069 m!198235))

(assert (=> d!51555 d!51561))

(declare-fun b!170080 () Bool)

(declare-fun e!112199 () (_ BitVec 32))

(declare-fun call!17347 () (_ BitVec 32))

(assert (=> b!170080 (= e!112199 (bvadd #b00000000000000000000000000000001 call!17347))))

(declare-fun b!170081 () Bool)

(declare-fun e!112200 () (_ BitVec 32))

(assert (=> b!170081 (= e!112200 e!112199)))

(declare-fun c!30449 () Bool)

(assert (=> b!170081 (= c!30449 (validKeyInArray!0 (select (arr!3328 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170082 () Bool)

(assert (=> b!170082 (= e!112200 #b00000000000000000000000000000000)))

(declare-fun bm!17344 () Bool)

(assert (=> bm!17344 (= call!17347 (arrayCountValidKeys!0 (_keys!5357 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3620 (_keys!5357 thiss!1248))))))

(declare-fun b!170083 () Bool)

(assert (=> b!170083 (= e!112199 call!17347)))

(declare-fun d!51563 () Bool)

(declare-fun lt!84816 () (_ BitVec 32))

(assert (=> d!51563 (and (bvsge lt!84816 #b00000000000000000000000000000000) (bvsle lt!84816 (bvsub (size!3620 (_keys!5357 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51563 (= lt!84816 e!112200)))

(declare-fun c!30448 () Bool)

(assert (=> d!51563 (= c!30448 (bvsge #b00000000000000000000000000000000 (size!3620 (_keys!5357 thiss!1248))))))

(assert (=> d!51563 (and (bvsle #b00000000000000000000000000000000 (size!3620 (_keys!5357 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3620 (_keys!5357 thiss!1248)) (size!3620 (_keys!5357 thiss!1248))))))

(assert (=> d!51563 (= (arrayCountValidKeys!0 (_keys!5357 thiss!1248) #b00000000000000000000000000000000 (size!3620 (_keys!5357 thiss!1248))) lt!84816)))

(assert (= (and d!51563 c!30448) b!170082))

(assert (= (and d!51563 (not c!30448)) b!170081))

(assert (= (and b!170081 c!30449) b!170080))

(assert (= (and b!170081 (not c!30449)) b!170083))

(assert (= (or b!170080 b!170083) bm!17344))

(assert (=> b!170081 m!198219))

(assert (=> b!170081 m!198219))

(assert (=> b!170081 m!198223))

(declare-fun m!198237 () Bool)

(assert (=> bm!17344 m!198237))

(assert (=> b!170022 d!51563))

(declare-fun condMapEmpty!6721 () Bool)

(declare-fun mapDefault!6721 () ValueCell!1634)

(assert (=> mapNonEmpty!6720 (= condMapEmpty!6721 (= mapRest!6720 ((as const (Array (_ BitVec 32) ValueCell!1634)) mapDefault!6721)))))

(declare-fun e!112202 () Bool)

(declare-fun mapRes!6721 () Bool)

(assert (=> mapNonEmpty!6720 (= tp!15180 (and e!112202 mapRes!6721))))

(declare-fun b!170085 () Bool)

(assert (=> b!170085 (= e!112202 tp_is_empty!3955)))

(declare-fun mapNonEmpty!6721 () Bool)

(declare-fun tp!15181 () Bool)

(declare-fun e!112201 () Bool)

(assert (=> mapNonEmpty!6721 (= mapRes!6721 (and tp!15181 e!112201))))

(declare-fun mapKey!6721 () (_ BitVec 32))

(declare-fun mapValue!6721 () ValueCell!1634)

(declare-fun mapRest!6721 () (Array (_ BitVec 32) ValueCell!1634))

(assert (=> mapNonEmpty!6721 (= mapRest!6720 (store mapRest!6721 mapKey!6721 mapValue!6721))))

(declare-fun b!170084 () Bool)

(assert (=> b!170084 (= e!112201 tp_is_empty!3955)))

(declare-fun mapIsEmpty!6721 () Bool)

(assert (=> mapIsEmpty!6721 mapRes!6721))

(assert (= (and mapNonEmpty!6720 condMapEmpty!6721) mapIsEmpty!6721))

(assert (= (and mapNonEmpty!6720 (not condMapEmpty!6721)) mapNonEmpty!6721))

(assert (= (and mapNonEmpty!6721 ((_ is ValueCellFull!1634) mapValue!6721)) b!170084))

(assert (= (and mapNonEmpty!6720 ((_ is ValueCellFull!1634) mapDefault!6721)) b!170085))

(declare-fun m!198239 () Bool)

(assert (=> mapNonEmpty!6721 m!198239))

(check-sat (not bm!17338) (not b!170045) (not bm!17344) (not d!51561) (not b_next!4183) (not b!170070) (not b!170043) (not b!170057) (not bm!17341) (not b!170059) (not b!170069) (not b!170081) (not mapNonEmpty!6721) tp_is_empty!3955 (not b!170044) b_and!10571)
(check-sat b_and!10571 (not b_next!4183))
