; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17254 () Bool)

(assert start!17254)

(declare-fun b!173086 () Bool)

(declare-fun b_free!4297 () Bool)

(declare-fun b_next!4297 () Bool)

(assert (=> b!173086 (= b_free!4297 (not b_next!4297))))

(declare-fun tp!15548 () Bool)

(declare-fun b_and!10751 () Bool)

(assert (=> b!173086 (= tp!15548 b_and!10751)))

(declare-fun res!82173 () Bool)

(declare-fun e!114316 () Bool)

(assert (=> start!17254 (=> (not res!82173) (not e!114316))))

(declare-datatypes ((V!5073 0))(
  ( (V!5074 (val!2079 Int)) )
))
(declare-datatypes ((ValueCell!1691 0))(
  ( (ValueCellFull!1691 (v!3948 V!5073)) (EmptyCell!1691) )
))
(declare-datatypes ((array!7251 0))(
  ( (array!7252 (arr!3446 (Array (_ BitVec 32) (_ BitVec 64))) (size!3745 (_ BitVec 32))) )
))
(declare-datatypes ((array!7253 0))(
  ( (array!7254 (arr!3447 (Array (_ BitVec 32) ValueCell!1691)) (size!3746 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2290 0))(
  ( (LongMapFixedSize!2291 (defaultEntry!3591 Int) (mask!8455 (_ BitVec 32)) (extraKeys!3330 (_ BitVec 32)) (zeroValue!3432 V!5073) (minValue!3434 V!5073) (_size!1194 (_ BitVec 32)) (_keys!5430 array!7251) (_values!3574 array!7253) (_vacant!1194 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2290)

(declare-fun valid!982 (LongMapFixedSize!2290) Bool)

(assert (=> start!17254 (= res!82173 (valid!982 thiss!1248))))

(assert (=> start!17254 e!114316))

(declare-fun e!114315 () Bool)

(assert (=> start!17254 e!114315))

(assert (=> start!17254 true))

(declare-fun e!114318 () Bool)

(declare-fun tp_is_empty!4069 () Bool)

(declare-fun array_inv!2219 (array!7251) Bool)

(declare-fun array_inv!2220 (array!7253) Bool)

(assert (=> b!173086 (= e!114315 (and tp!15548 tp_is_empty!4069 (array_inv!2219 (_keys!5430 thiss!1248)) (array_inv!2220 (_values!3574 thiss!1248)) e!114318))))

(declare-fun b!173087 () Bool)

(declare-fun e!114317 () Bool)

(assert (=> b!173087 (= e!114317 tp_is_empty!4069)))

(declare-fun b!173088 () Bool)

(declare-fun res!82174 () Bool)

(assert (=> b!173088 (=> (not res!82174) (not e!114316))))

(assert (=> b!173088 (= res!82174 (and (= (size!3746 (_values!3574 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8455 thiss!1248))) (= (size!3745 (_keys!5430 thiss!1248)) (size!3746 (_values!3574 thiss!1248))) (bvsge (mask!8455 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3330 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3330 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3330 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!173089 () Bool)

(declare-fun mapRes!6924 () Bool)

(assert (=> b!173089 (= e!114318 (and e!114317 mapRes!6924))))

(declare-fun condMapEmpty!6924 () Bool)

(declare-fun mapDefault!6924 () ValueCell!1691)

(assert (=> b!173089 (= condMapEmpty!6924 (= (arr!3447 (_values!3574 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1691)) mapDefault!6924)))))

(declare-fun b!173090 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7251 (_ BitVec 32)) Bool)

(assert (=> b!173090 (= e!114316 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5430 thiss!1248) (mask!8455 thiss!1248))))))

(declare-fun mapNonEmpty!6924 () Bool)

(declare-fun tp!15549 () Bool)

(declare-fun e!114319 () Bool)

(assert (=> mapNonEmpty!6924 (= mapRes!6924 (and tp!15549 e!114319))))

(declare-fun mapValue!6924 () ValueCell!1691)

(declare-fun mapRest!6924 () (Array (_ BitVec 32) ValueCell!1691))

(declare-fun mapKey!6924 () (_ BitVec 32))

(assert (=> mapNonEmpty!6924 (= (arr!3447 (_values!3574 thiss!1248)) (store mapRest!6924 mapKey!6924 mapValue!6924))))

(declare-fun b!173091 () Bool)

(declare-fun res!82176 () Bool)

(assert (=> b!173091 (=> (not res!82176) (not e!114316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!173091 (= res!82176 (validMask!0 (mask!8455 thiss!1248)))))

(declare-fun mapIsEmpty!6924 () Bool)

(assert (=> mapIsEmpty!6924 mapRes!6924))

(declare-fun b!173092 () Bool)

(declare-fun res!82175 () Bool)

(assert (=> b!173092 (=> (not res!82175) (not e!114316))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!173092 (= res!82175 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173093 () Bool)

(assert (=> b!173093 (= e!114319 tp_is_empty!4069)))

(assert (= (and start!17254 res!82173) b!173092))

(assert (= (and b!173092 res!82175) b!173091))

(assert (= (and b!173091 res!82176) b!173088))

(assert (= (and b!173088 res!82174) b!173090))

(assert (= (and b!173089 condMapEmpty!6924) mapIsEmpty!6924))

(assert (= (and b!173089 (not condMapEmpty!6924)) mapNonEmpty!6924))

(get-info :version)

(assert (= (and mapNonEmpty!6924 ((_ is ValueCellFull!1691) mapValue!6924)) b!173093))

(assert (= (and b!173089 ((_ is ValueCellFull!1691) mapDefault!6924)) b!173087))

(assert (= b!173086 b!173089))

(assert (= start!17254 b!173086))

(declare-fun m!201695 () Bool)

(assert (=> mapNonEmpty!6924 m!201695))

(declare-fun m!201697 () Bool)

(assert (=> b!173090 m!201697))

(declare-fun m!201699 () Bool)

(assert (=> b!173086 m!201699))

(declare-fun m!201701 () Bool)

(assert (=> b!173086 m!201701))

(declare-fun m!201703 () Bool)

(assert (=> b!173091 m!201703))

(declare-fun m!201705 () Bool)

(assert (=> start!17254 m!201705))

(check-sat (not b!173090) (not b!173091) b_and!10751 tp_is_empty!4069 (not b_next!4297) (not b!173086) (not mapNonEmpty!6924) (not start!17254))
(check-sat b_and!10751 (not b_next!4297))
(get-model)

(declare-fun b!173150 () Bool)

(declare-fun e!114363 () Bool)

(declare-fun e!114365 () Bool)

(assert (=> b!173150 (= e!114363 e!114365)))

(declare-fun lt!85761 () (_ BitVec 64))

(assert (=> b!173150 (= lt!85761 (select (arr!3446 (_keys!5430 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5311 0))(
  ( (Unit!5312) )
))
(declare-fun lt!85760 () Unit!5311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7251 (_ BitVec 64) (_ BitVec 32)) Unit!5311)

(assert (=> b!173150 (= lt!85760 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5430 thiss!1248) lt!85761 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!173150 (arrayContainsKey!0 (_keys!5430 thiss!1248) lt!85761 #b00000000000000000000000000000000)))

(declare-fun lt!85759 () Unit!5311)

(assert (=> b!173150 (= lt!85759 lt!85760)))

(declare-fun res!82205 () Bool)

(declare-datatypes ((SeekEntryResult!534 0))(
  ( (MissingZero!534 (index!4304 (_ BitVec 32))) (Found!534 (index!4305 (_ BitVec 32))) (Intermediate!534 (undefined!1346 Bool) (index!4306 (_ BitVec 32)) (x!19141 (_ BitVec 32))) (Undefined!534) (MissingVacant!534 (index!4307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7251 (_ BitVec 32)) SeekEntryResult!534)

(assert (=> b!173150 (= res!82205 (= (seekEntryOrOpen!0 (select (arr!3446 (_keys!5430 thiss!1248)) #b00000000000000000000000000000000) (_keys!5430 thiss!1248) (mask!8455 thiss!1248)) (Found!534 #b00000000000000000000000000000000)))))

(assert (=> b!173150 (=> (not res!82205) (not e!114365))))

(declare-fun d!52637 () Bool)

(declare-fun res!82206 () Bool)

(declare-fun e!114364 () Bool)

(assert (=> d!52637 (=> res!82206 e!114364)))

(assert (=> d!52637 (= res!82206 (bvsge #b00000000000000000000000000000000 (size!3745 (_keys!5430 thiss!1248))))))

(assert (=> d!52637 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5430 thiss!1248) (mask!8455 thiss!1248)) e!114364)))

(declare-fun b!173151 () Bool)

(assert (=> b!173151 (= e!114364 e!114363)))

(declare-fun c!30903 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!173151 (= c!30903 (validKeyInArray!0 (select (arr!3446 (_keys!5430 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17536 () Bool)

(declare-fun call!17539 () Bool)

(assert (=> bm!17536 (= call!17539 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5430 thiss!1248) (mask!8455 thiss!1248)))))

(declare-fun b!173152 () Bool)

(assert (=> b!173152 (= e!114365 call!17539)))

(declare-fun b!173153 () Bool)

(assert (=> b!173153 (= e!114363 call!17539)))

(assert (= (and d!52637 (not res!82206)) b!173151))

(assert (= (and b!173151 c!30903) b!173150))

(assert (= (and b!173151 (not c!30903)) b!173153))

(assert (= (and b!173150 res!82205) b!173152))

(assert (= (or b!173152 b!173153) bm!17536))

(declare-fun m!201731 () Bool)

(assert (=> b!173150 m!201731))

(declare-fun m!201733 () Bool)

(assert (=> b!173150 m!201733))

(declare-fun m!201735 () Bool)

(assert (=> b!173150 m!201735))

(assert (=> b!173150 m!201731))

(declare-fun m!201737 () Bool)

(assert (=> b!173150 m!201737))

(assert (=> b!173151 m!201731))

(assert (=> b!173151 m!201731))

(declare-fun m!201739 () Bool)

(assert (=> b!173151 m!201739))

(declare-fun m!201741 () Bool)

(assert (=> bm!17536 m!201741))

(assert (=> b!173090 d!52637))

(declare-fun d!52639 () Bool)

(assert (=> d!52639 (= (validMask!0 (mask!8455 thiss!1248)) (and (or (= (mask!8455 thiss!1248) #b00000000000000000000000000000111) (= (mask!8455 thiss!1248) #b00000000000000000000000000001111) (= (mask!8455 thiss!1248) #b00000000000000000000000000011111) (= (mask!8455 thiss!1248) #b00000000000000000000000000111111) (= (mask!8455 thiss!1248) #b00000000000000000000000001111111) (= (mask!8455 thiss!1248) #b00000000000000000000000011111111) (= (mask!8455 thiss!1248) #b00000000000000000000000111111111) (= (mask!8455 thiss!1248) #b00000000000000000000001111111111) (= (mask!8455 thiss!1248) #b00000000000000000000011111111111) (= (mask!8455 thiss!1248) #b00000000000000000000111111111111) (= (mask!8455 thiss!1248) #b00000000000000000001111111111111) (= (mask!8455 thiss!1248) #b00000000000000000011111111111111) (= (mask!8455 thiss!1248) #b00000000000000000111111111111111) (= (mask!8455 thiss!1248) #b00000000000000001111111111111111) (= (mask!8455 thiss!1248) #b00000000000000011111111111111111) (= (mask!8455 thiss!1248) #b00000000000000111111111111111111) (= (mask!8455 thiss!1248) #b00000000000001111111111111111111) (= (mask!8455 thiss!1248) #b00000000000011111111111111111111) (= (mask!8455 thiss!1248) #b00000000000111111111111111111111) (= (mask!8455 thiss!1248) #b00000000001111111111111111111111) (= (mask!8455 thiss!1248) #b00000000011111111111111111111111) (= (mask!8455 thiss!1248) #b00000000111111111111111111111111) (= (mask!8455 thiss!1248) #b00000001111111111111111111111111) (= (mask!8455 thiss!1248) #b00000011111111111111111111111111) (= (mask!8455 thiss!1248) #b00000111111111111111111111111111) (= (mask!8455 thiss!1248) #b00001111111111111111111111111111) (= (mask!8455 thiss!1248) #b00011111111111111111111111111111) (= (mask!8455 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8455 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!173091 d!52639))

(declare-fun d!52641 () Bool)

(assert (=> d!52641 (= (array_inv!2219 (_keys!5430 thiss!1248)) (bvsge (size!3745 (_keys!5430 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173086 d!52641))

(declare-fun d!52643 () Bool)

(assert (=> d!52643 (= (array_inv!2220 (_values!3574 thiss!1248)) (bvsge (size!3746 (_values!3574 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173086 d!52643))

(declare-fun d!52645 () Bool)

(declare-fun res!82213 () Bool)

(declare-fun e!114368 () Bool)

(assert (=> d!52645 (=> (not res!82213) (not e!114368))))

(declare-fun simpleValid!142 (LongMapFixedSize!2290) Bool)

(assert (=> d!52645 (= res!82213 (simpleValid!142 thiss!1248))))

(assert (=> d!52645 (= (valid!982 thiss!1248) e!114368)))

(declare-fun b!173160 () Bool)

(declare-fun res!82214 () Bool)

(assert (=> b!173160 (=> (not res!82214) (not e!114368))))

(declare-fun arrayCountValidKeys!0 (array!7251 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!173160 (= res!82214 (= (arrayCountValidKeys!0 (_keys!5430 thiss!1248) #b00000000000000000000000000000000 (size!3745 (_keys!5430 thiss!1248))) (_size!1194 thiss!1248)))))

(declare-fun b!173161 () Bool)

(declare-fun res!82215 () Bool)

(assert (=> b!173161 (=> (not res!82215) (not e!114368))))

(assert (=> b!173161 (= res!82215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5430 thiss!1248) (mask!8455 thiss!1248)))))

(declare-fun b!173162 () Bool)

(declare-datatypes ((List!2185 0))(
  ( (Nil!2182) (Cons!2181 (h!2798 (_ BitVec 64)) (t!6984 List!2185)) )
))
(declare-fun arrayNoDuplicates!0 (array!7251 (_ BitVec 32) List!2185) Bool)

(assert (=> b!173162 (= e!114368 (arrayNoDuplicates!0 (_keys!5430 thiss!1248) #b00000000000000000000000000000000 Nil!2182))))

(assert (= (and d!52645 res!82213) b!173160))

(assert (= (and b!173160 res!82214) b!173161))

(assert (= (and b!173161 res!82215) b!173162))

(declare-fun m!201743 () Bool)

(assert (=> d!52645 m!201743))

(declare-fun m!201745 () Bool)

(assert (=> b!173160 m!201745))

(assert (=> b!173161 m!201697))

(declare-fun m!201747 () Bool)

(assert (=> b!173162 m!201747))

(assert (=> start!17254 d!52645))

(declare-fun condMapEmpty!6933 () Bool)

(declare-fun mapDefault!6933 () ValueCell!1691)

(assert (=> mapNonEmpty!6924 (= condMapEmpty!6933 (= mapRest!6924 ((as const (Array (_ BitVec 32) ValueCell!1691)) mapDefault!6933)))))

(declare-fun e!114374 () Bool)

(declare-fun mapRes!6933 () Bool)

(assert (=> mapNonEmpty!6924 (= tp!15549 (and e!114374 mapRes!6933))))

(declare-fun mapNonEmpty!6933 () Bool)

(declare-fun tp!15564 () Bool)

(declare-fun e!114373 () Bool)

(assert (=> mapNonEmpty!6933 (= mapRes!6933 (and tp!15564 e!114373))))

(declare-fun mapRest!6933 () (Array (_ BitVec 32) ValueCell!1691))

(declare-fun mapKey!6933 () (_ BitVec 32))

(declare-fun mapValue!6933 () ValueCell!1691)

(assert (=> mapNonEmpty!6933 (= mapRest!6924 (store mapRest!6933 mapKey!6933 mapValue!6933))))

(declare-fun b!173169 () Bool)

(assert (=> b!173169 (= e!114373 tp_is_empty!4069)))

(declare-fun mapIsEmpty!6933 () Bool)

(assert (=> mapIsEmpty!6933 mapRes!6933))

(declare-fun b!173170 () Bool)

(assert (=> b!173170 (= e!114374 tp_is_empty!4069)))

(assert (= (and mapNonEmpty!6924 condMapEmpty!6933) mapIsEmpty!6933))

(assert (= (and mapNonEmpty!6924 (not condMapEmpty!6933)) mapNonEmpty!6933))

(assert (= (and mapNonEmpty!6933 ((_ is ValueCellFull!1691) mapValue!6933)) b!173169))

(assert (= (and mapNonEmpty!6924 ((_ is ValueCellFull!1691) mapDefault!6933)) b!173170))

(declare-fun m!201749 () Bool)

(assert (=> mapNonEmpty!6933 m!201749))

(check-sat (not b!173151) (not b!173162) (not b_next!4297) (not d!52645) b_and!10751 (not b!173150) (not b!173161) (not bm!17536) tp_is_empty!4069 (not b!173160) (not mapNonEmpty!6933))
(check-sat b_and!10751 (not b_next!4297))
