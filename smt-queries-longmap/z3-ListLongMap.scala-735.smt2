; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17148 () Bool)

(assert start!17148)

(declare-fun b!172332 () Bool)

(declare-fun b_free!4251 () Bool)

(declare-fun b_next!4251 () Bool)

(assert (=> b!172332 (= b_free!4251 (not b_next!4251))))

(declare-fun tp!15395 () Bool)

(declare-fun b_and!10691 () Bool)

(assert (=> b!172332 (= tp!15395 b_and!10691)))

(declare-fun b!172327 () Bool)

(declare-fun e!113749 () Bool)

(declare-fun tp_is_empty!4023 () Bool)

(assert (=> b!172327 (= e!113749 tp_is_empty!4023)))

(declare-fun b!172328 () Bool)

(declare-fun e!113748 () Bool)

(declare-datatypes ((V!5011 0))(
  ( (V!5012 (val!2056 Int)) )
))
(declare-datatypes ((ValueCell!1668 0))(
  ( (ValueCellFull!1668 (v!3924 V!5011)) (EmptyCell!1668) )
))
(declare-datatypes ((array!7165 0))(
  ( (array!7166 (arr!3407 (Array (_ BitVec 32) (_ BitVec 64))) (size!3703 (_ BitVec 32))) )
))
(declare-datatypes ((array!7167 0))(
  ( (array!7168 (arr!3408 (Array (_ BitVec 32) ValueCell!1668)) (size!3704 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2244 0))(
  ( (LongMapFixedSize!2245 (defaultEntry!3568 Int) (mask!8409 (_ BitVec 32)) (extraKeys!3307 (_ BitVec 32)) (zeroValue!3409 V!5011) (minValue!3411 V!5011) (_size!1171 (_ BitVec 32)) (_keys!5404 array!7165) (_values!3551 array!7167) (_vacant!1171 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2244)

(assert (=> b!172328 (= e!113748 (and (= (size!3704 (_values!3551 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8409 thiss!1248))) (not (= (size!3703 (_keys!5404 thiss!1248)) (size!3704 (_values!3551 thiss!1248))))))))

(declare-fun mapNonEmpty!6840 () Bool)

(declare-fun mapRes!6840 () Bool)

(declare-fun tp!15396 () Bool)

(assert (=> mapNonEmpty!6840 (= mapRes!6840 (and tp!15396 e!113749))))

(declare-fun mapValue!6840 () ValueCell!1668)

(declare-fun mapRest!6840 () (Array (_ BitVec 32) ValueCell!1668))

(declare-fun mapKey!6840 () (_ BitVec 32))

(assert (=> mapNonEmpty!6840 (= (arr!3408 (_values!3551 thiss!1248)) (store mapRest!6840 mapKey!6840 mapValue!6840))))

(declare-fun res!81827 () Bool)

(assert (=> start!17148 (=> (not res!81827) (not e!113748))))

(declare-fun valid!953 (LongMapFixedSize!2244) Bool)

(assert (=> start!17148 (= res!81827 (valid!953 thiss!1248))))

(assert (=> start!17148 e!113748))

(declare-fun e!113750 () Bool)

(assert (=> start!17148 e!113750))

(assert (=> start!17148 true))

(declare-fun b!172329 () Bool)

(declare-fun res!81826 () Bool)

(assert (=> b!172329 (=> (not res!81826) (not e!113748))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172329 (= res!81826 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172330 () Bool)

(declare-fun res!81828 () Bool)

(assert (=> b!172330 (=> (not res!81828) (not e!113748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172330 (= res!81828 (validMask!0 (mask!8409 thiss!1248)))))

(declare-fun b!172331 () Bool)

(declare-fun e!113745 () Bool)

(declare-fun e!113747 () Bool)

(assert (=> b!172331 (= e!113745 (and e!113747 mapRes!6840))))

(declare-fun condMapEmpty!6840 () Bool)

(declare-fun mapDefault!6840 () ValueCell!1668)

(assert (=> b!172331 (= condMapEmpty!6840 (= (arr!3408 (_values!3551 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1668)) mapDefault!6840)))))

(declare-fun array_inv!2183 (array!7165) Bool)

(declare-fun array_inv!2184 (array!7167) Bool)

(assert (=> b!172332 (= e!113750 (and tp!15395 tp_is_empty!4023 (array_inv!2183 (_keys!5404 thiss!1248)) (array_inv!2184 (_values!3551 thiss!1248)) e!113745))))

(declare-fun mapIsEmpty!6840 () Bool)

(assert (=> mapIsEmpty!6840 mapRes!6840))

(declare-fun b!172333 () Bool)

(assert (=> b!172333 (= e!113747 tp_is_empty!4023)))

(assert (= (and start!17148 res!81827) b!172329))

(assert (= (and b!172329 res!81826) b!172330))

(assert (= (and b!172330 res!81828) b!172328))

(assert (= (and b!172331 condMapEmpty!6840) mapIsEmpty!6840))

(assert (= (and b!172331 (not condMapEmpty!6840)) mapNonEmpty!6840))

(get-info :version)

(assert (= (and mapNonEmpty!6840 ((_ is ValueCellFull!1668) mapValue!6840)) b!172327))

(assert (= (and b!172331 ((_ is ValueCellFull!1668) mapDefault!6840)) b!172333))

(assert (= b!172332 b!172331))

(assert (= start!17148 b!172332))

(declare-fun m!201177 () Bool)

(assert (=> mapNonEmpty!6840 m!201177))

(declare-fun m!201179 () Bool)

(assert (=> start!17148 m!201179))

(declare-fun m!201181 () Bool)

(assert (=> b!172330 m!201181))

(declare-fun m!201183 () Bool)

(assert (=> b!172332 m!201183))

(declare-fun m!201185 () Bool)

(assert (=> b!172332 m!201185))

(check-sat b_and!10691 tp_is_empty!4023 (not b!172332) (not b_next!4251) (not mapNonEmpty!6840) (not start!17148) (not b!172330))
(check-sat b_and!10691 (not b_next!4251))
(get-model)

(declare-fun d!52491 () Bool)

(assert (=> d!52491 (= (validMask!0 (mask!8409 thiss!1248)) (and (or (= (mask!8409 thiss!1248) #b00000000000000000000000000000111) (= (mask!8409 thiss!1248) #b00000000000000000000000000001111) (= (mask!8409 thiss!1248) #b00000000000000000000000000011111) (= (mask!8409 thiss!1248) #b00000000000000000000000000111111) (= (mask!8409 thiss!1248) #b00000000000000000000000001111111) (= (mask!8409 thiss!1248) #b00000000000000000000000011111111) (= (mask!8409 thiss!1248) #b00000000000000000000000111111111) (= (mask!8409 thiss!1248) #b00000000000000000000001111111111) (= (mask!8409 thiss!1248) #b00000000000000000000011111111111) (= (mask!8409 thiss!1248) #b00000000000000000000111111111111) (= (mask!8409 thiss!1248) #b00000000000000000001111111111111) (= (mask!8409 thiss!1248) #b00000000000000000011111111111111) (= (mask!8409 thiss!1248) #b00000000000000000111111111111111) (= (mask!8409 thiss!1248) #b00000000000000001111111111111111) (= (mask!8409 thiss!1248) #b00000000000000011111111111111111) (= (mask!8409 thiss!1248) #b00000000000000111111111111111111) (= (mask!8409 thiss!1248) #b00000000000001111111111111111111) (= (mask!8409 thiss!1248) #b00000000000011111111111111111111) (= (mask!8409 thiss!1248) #b00000000000111111111111111111111) (= (mask!8409 thiss!1248) #b00000000001111111111111111111111) (= (mask!8409 thiss!1248) #b00000000011111111111111111111111) (= (mask!8409 thiss!1248) #b00000000111111111111111111111111) (= (mask!8409 thiss!1248) #b00000001111111111111111111111111) (= (mask!8409 thiss!1248) #b00000011111111111111111111111111) (= (mask!8409 thiss!1248) #b00000111111111111111111111111111) (= (mask!8409 thiss!1248) #b00001111111111111111111111111111) (= (mask!8409 thiss!1248) #b00011111111111111111111111111111) (= (mask!8409 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8409 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172330 d!52491))

(declare-fun d!52493 () Bool)

(declare-fun res!81844 () Bool)

(declare-fun e!113771 () Bool)

(assert (=> d!52493 (=> (not res!81844) (not e!113771))))

(declare-fun simpleValid!138 (LongMapFixedSize!2244) Bool)

(assert (=> d!52493 (= res!81844 (simpleValid!138 thiss!1248))))

(assert (=> d!52493 (= (valid!953 thiss!1248) e!113771)))

(declare-fun b!172361 () Bool)

(declare-fun res!81845 () Bool)

(assert (=> b!172361 (=> (not res!81845) (not e!113771))))

(declare-fun arrayCountValidKeys!0 (array!7165 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172361 (= res!81845 (= (arrayCountValidKeys!0 (_keys!5404 thiss!1248) #b00000000000000000000000000000000 (size!3703 (_keys!5404 thiss!1248))) (_size!1171 thiss!1248)))))

(declare-fun b!172362 () Bool)

(declare-fun res!81846 () Bool)

(assert (=> b!172362 (=> (not res!81846) (not e!113771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7165 (_ BitVec 32)) Bool)

(assert (=> b!172362 (= res!81846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5404 thiss!1248) (mask!8409 thiss!1248)))))

(declare-fun b!172363 () Bool)

(declare-datatypes ((List!2198 0))(
  ( (Nil!2195) (Cons!2194 (h!2811 (_ BitVec 64)) (t!7005 List!2198)) )
))
(declare-fun arrayNoDuplicates!0 (array!7165 (_ BitVec 32) List!2198) Bool)

(assert (=> b!172363 (= e!113771 (arrayNoDuplicates!0 (_keys!5404 thiss!1248) #b00000000000000000000000000000000 Nil!2195))))

(assert (= (and d!52493 res!81844) b!172361))

(assert (= (and b!172361 res!81845) b!172362))

(assert (= (and b!172362 res!81846) b!172363))

(declare-fun m!201197 () Bool)

(assert (=> d!52493 m!201197))

(declare-fun m!201199 () Bool)

(assert (=> b!172361 m!201199))

(declare-fun m!201201 () Bool)

(assert (=> b!172362 m!201201))

(declare-fun m!201203 () Bool)

(assert (=> b!172363 m!201203))

(assert (=> start!17148 d!52493))

(declare-fun d!52495 () Bool)

(assert (=> d!52495 (= (array_inv!2183 (_keys!5404 thiss!1248)) (bvsge (size!3703 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172332 d!52495))

(declare-fun d!52497 () Bool)

(assert (=> d!52497 (= (array_inv!2184 (_values!3551 thiss!1248)) (bvsge (size!3704 (_values!3551 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172332 d!52497))

(declare-fun b!172371 () Bool)

(declare-fun e!113776 () Bool)

(assert (=> b!172371 (= e!113776 tp_is_empty!4023)))

(declare-fun b!172370 () Bool)

(declare-fun e!113777 () Bool)

(assert (=> b!172370 (= e!113777 tp_is_empty!4023)))

(declare-fun condMapEmpty!6846 () Bool)

(declare-fun mapDefault!6846 () ValueCell!1668)

(assert (=> mapNonEmpty!6840 (= condMapEmpty!6846 (= mapRest!6840 ((as const (Array (_ BitVec 32) ValueCell!1668)) mapDefault!6846)))))

(declare-fun mapRes!6846 () Bool)

(assert (=> mapNonEmpty!6840 (= tp!15396 (and e!113776 mapRes!6846))))

(declare-fun mapNonEmpty!6846 () Bool)

(declare-fun tp!15405 () Bool)

(assert (=> mapNonEmpty!6846 (= mapRes!6846 (and tp!15405 e!113777))))

(declare-fun mapRest!6846 () (Array (_ BitVec 32) ValueCell!1668))

(declare-fun mapValue!6846 () ValueCell!1668)

(declare-fun mapKey!6846 () (_ BitVec 32))

(assert (=> mapNonEmpty!6846 (= mapRest!6840 (store mapRest!6846 mapKey!6846 mapValue!6846))))

(declare-fun mapIsEmpty!6846 () Bool)

(assert (=> mapIsEmpty!6846 mapRes!6846))

(assert (= (and mapNonEmpty!6840 condMapEmpty!6846) mapIsEmpty!6846))

(assert (= (and mapNonEmpty!6840 (not condMapEmpty!6846)) mapNonEmpty!6846))

(assert (= (and mapNonEmpty!6846 ((_ is ValueCellFull!1668) mapValue!6846)) b!172370))

(assert (= (and mapNonEmpty!6840 ((_ is ValueCellFull!1668) mapDefault!6846)) b!172371))

(declare-fun m!201205 () Bool)

(assert (=> mapNonEmpty!6846 m!201205))

(check-sat (not b!172363) (not b!172361) b_and!10691 tp_is_empty!4023 (not b!172362) (not mapNonEmpty!6846) (not d!52493) (not b_next!4251))
(check-sat b_and!10691 (not b_next!4251))
(get-model)

(declare-fun b!172382 () Bool)

(declare-fun e!113788 () Bool)

(declare-fun e!113786 () Bool)

(assert (=> b!172382 (= e!113788 e!113786)))

(declare-fun res!81853 () Bool)

(assert (=> b!172382 (=> (not res!81853) (not e!113786))))

(declare-fun e!113789 () Bool)

(assert (=> b!172382 (= res!81853 (not e!113789))))

(declare-fun res!81854 () Bool)

(assert (=> b!172382 (=> (not res!81854) (not e!113789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172382 (= res!81854 (validKeyInArray!0 (select (arr!3407 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17521 () Bool)

(declare-fun call!17524 () Bool)

(declare-fun c!30854 () Bool)

(assert (=> bm!17521 (= call!17524 (arrayNoDuplicates!0 (_keys!5404 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30854 (Cons!2194 (select (arr!3407 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000) Nil!2195) Nil!2195)))))

(declare-fun b!172383 () Bool)

(declare-fun e!113787 () Bool)

(assert (=> b!172383 (= e!113787 call!17524)))

(declare-fun b!172384 () Bool)

(assert (=> b!172384 (= e!113787 call!17524)))

(declare-fun b!172385 () Bool)

(declare-fun contains!1150 (List!2198 (_ BitVec 64)) Bool)

(assert (=> b!172385 (= e!113789 (contains!1150 Nil!2195 (select (arr!3407 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172386 () Bool)

(assert (=> b!172386 (= e!113786 e!113787)))

(assert (=> b!172386 (= c!30854 (validKeyInArray!0 (select (arr!3407 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52499 () Bool)

(declare-fun res!81855 () Bool)

(assert (=> d!52499 (=> res!81855 e!113788)))

(assert (=> d!52499 (= res!81855 (bvsge #b00000000000000000000000000000000 (size!3703 (_keys!5404 thiss!1248))))))

(assert (=> d!52499 (= (arrayNoDuplicates!0 (_keys!5404 thiss!1248) #b00000000000000000000000000000000 Nil!2195) e!113788)))

(assert (= (and d!52499 (not res!81855)) b!172382))

(assert (= (and b!172382 res!81854) b!172385))

(assert (= (and b!172382 res!81853) b!172386))

(assert (= (and b!172386 c!30854) b!172384))

(assert (= (and b!172386 (not c!30854)) b!172383))

(assert (= (or b!172384 b!172383) bm!17521))

(declare-fun m!201207 () Bool)

(assert (=> b!172382 m!201207))

(assert (=> b!172382 m!201207))

(declare-fun m!201209 () Bool)

(assert (=> b!172382 m!201209))

(assert (=> bm!17521 m!201207))

(declare-fun m!201211 () Bool)

(assert (=> bm!17521 m!201211))

(assert (=> b!172385 m!201207))

(assert (=> b!172385 m!201207))

(declare-fun m!201213 () Bool)

(assert (=> b!172385 m!201213))

(assert (=> b!172386 m!201207))

(assert (=> b!172386 m!201207))

(assert (=> b!172386 m!201209))

(assert (=> b!172363 d!52499))

(declare-fun b!172395 () Bool)

(declare-fun e!113797 () Bool)

(declare-fun e!113796 () Bool)

(assert (=> b!172395 (= e!113797 e!113796)))

(declare-fun lt!85666 () (_ BitVec 64))

(assert (=> b!172395 (= lt!85666 (select (arr!3407 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5304 0))(
  ( (Unit!5305) )
))
(declare-fun lt!85664 () Unit!5304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7165 (_ BitVec 64) (_ BitVec 32)) Unit!5304)

(assert (=> b!172395 (= lt!85664 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5404 thiss!1248) lt!85666 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172395 (arrayContainsKey!0 (_keys!5404 thiss!1248) lt!85666 #b00000000000000000000000000000000)))

(declare-fun lt!85665 () Unit!5304)

(assert (=> b!172395 (= lt!85665 lt!85664)))

(declare-fun res!81861 () Bool)

(declare-datatypes ((SeekEntryResult!537 0))(
  ( (MissingZero!537 (index!4316 (_ BitVec 32))) (Found!537 (index!4317 (_ BitVec 32))) (Intermediate!537 (undefined!1349 Bool) (index!4318 (_ BitVec 32)) (x!19036 (_ BitVec 32))) (Undefined!537) (MissingVacant!537 (index!4319 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7165 (_ BitVec 32)) SeekEntryResult!537)

(assert (=> b!172395 (= res!81861 (= (seekEntryOrOpen!0 (select (arr!3407 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000) (_keys!5404 thiss!1248) (mask!8409 thiss!1248)) (Found!537 #b00000000000000000000000000000000)))))

(assert (=> b!172395 (=> (not res!81861) (not e!113796))))

(declare-fun b!172396 () Bool)

(declare-fun e!113798 () Bool)

(assert (=> b!172396 (= e!113798 e!113797)))

(declare-fun c!30857 () Bool)

(assert (=> b!172396 (= c!30857 (validKeyInArray!0 (select (arr!3407 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17524 () Bool)

(declare-fun call!17527 () Bool)

(assert (=> bm!17524 (= call!17527 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5404 thiss!1248) (mask!8409 thiss!1248)))))

(declare-fun b!172397 () Bool)

(assert (=> b!172397 (= e!113796 call!17527)))

(declare-fun b!172398 () Bool)

(assert (=> b!172398 (= e!113797 call!17527)))

(declare-fun d!52501 () Bool)

(declare-fun res!81860 () Bool)

(assert (=> d!52501 (=> res!81860 e!113798)))

(assert (=> d!52501 (= res!81860 (bvsge #b00000000000000000000000000000000 (size!3703 (_keys!5404 thiss!1248))))))

(assert (=> d!52501 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5404 thiss!1248) (mask!8409 thiss!1248)) e!113798)))

(assert (= (and d!52501 (not res!81860)) b!172396))

(assert (= (and b!172396 c!30857) b!172395))

(assert (= (and b!172396 (not c!30857)) b!172398))

(assert (= (and b!172395 res!81861) b!172397))

(assert (= (or b!172397 b!172398) bm!17524))

(assert (=> b!172395 m!201207))

(declare-fun m!201215 () Bool)

(assert (=> b!172395 m!201215))

(declare-fun m!201217 () Bool)

(assert (=> b!172395 m!201217))

(assert (=> b!172395 m!201207))

(declare-fun m!201219 () Bool)

(assert (=> b!172395 m!201219))

(assert (=> b!172396 m!201207))

(assert (=> b!172396 m!201207))

(assert (=> b!172396 m!201209))

(declare-fun m!201221 () Bool)

(assert (=> bm!17524 m!201221))

(assert (=> b!172362 d!52501))

(declare-fun b!172407 () Bool)

(declare-fun e!113803 () (_ BitVec 32))

(declare-fun call!17530 () (_ BitVec 32))

(assert (=> b!172407 (= e!113803 call!17530)))

(declare-fun b!172408 () Bool)

(declare-fun e!113804 () (_ BitVec 32))

(assert (=> b!172408 (= e!113804 e!113803)))

(declare-fun c!30862 () Bool)

(assert (=> b!172408 (= c!30862 (validKeyInArray!0 (select (arr!3407 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172409 () Bool)

(assert (=> b!172409 (= e!113803 (bvadd #b00000000000000000000000000000001 call!17530))))

(declare-fun bm!17527 () Bool)

(assert (=> bm!17527 (= call!17530 (arrayCountValidKeys!0 (_keys!5404 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3703 (_keys!5404 thiss!1248))))))

(declare-fun b!172410 () Bool)

(assert (=> b!172410 (= e!113804 #b00000000000000000000000000000000)))

(declare-fun d!52503 () Bool)

(declare-fun lt!85669 () (_ BitVec 32))

(assert (=> d!52503 (and (bvsge lt!85669 #b00000000000000000000000000000000) (bvsle lt!85669 (bvsub (size!3703 (_keys!5404 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52503 (= lt!85669 e!113804)))

(declare-fun c!30863 () Bool)

(assert (=> d!52503 (= c!30863 (bvsge #b00000000000000000000000000000000 (size!3703 (_keys!5404 thiss!1248))))))

(assert (=> d!52503 (and (bvsle #b00000000000000000000000000000000 (size!3703 (_keys!5404 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3703 (_keys!5404 thiss!1248)) (size!3703 (_keys!5404 thiss!1248))))))

(assert (=> d!52503 (= (arrayCountValidKeys!0 (_keys!5404 thiss!1248) #b00000000000000000000000000000000 (size!3703 (_keys!5404 thiss!1248))) lt!85669)))

(assert (= (and d!52503 c!30863) b!172410))

(assert (= (and d!52503 (not c!30863)) b!172408))

(assert (= (and b!172408 c!30862) b!172409))

(assert (= (and b!172408 (not c!30862)) b!172407))

(assert (= (or b!172409 b!172407) bm!17527))

(assert (=> b!172408 m!201207))

(assert (=> b!172408 m!201207))

(assert (=> b!172408 m!201209))

(declare-fun m!201223 () Bool)

(assert (=> bm!17527 m!201223))

(assert (=> b!172361 d!52503))

(declare-fun b!172420 () Bool)

(declare-fun res!81870 () Bool)

(declare-fun e!113807 () Bool)

(assert (=> b!172420 (=> (not res!81870) (not e!113807))))

(declare-fun size!3707 (LongMapFixedSize!2244) (_ BitVec 32))

(assert (=> b!172420 (= res!81870 (bvsge (size!3707 thiss!1248) (_size!1171 thiss!1248)))))

(declare-fun b!172422 () Bool)

(assert (=> b!172422 (= e!113807 (and (bvsge (extraKeys!3307 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3307 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1171 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172421 () Bool)

(declare-fun res!81872 () Bool)

(assert (=> b!172421 (=> (not res!81872) (not e!113807))))

(assert (=> b!172421 (= res!81872 (= (size!3707 thiss!1248) (bvadd (_size!1171 thiss!1248) (bvsdiv (bvadd (extraKeys!3307 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!52505 () Bool)

(declare-fun res!81873 () Bool)

(assert (=> d!52505 (=> (not res!81873) (not e!113807))))

(assert (=> d!52505 (= res!81873 (validMask!0 (mask!8409 thiss!1248)))))

(assert (=> d!52505 (= (simpleValid!138 thiss!1248) e!113807)))

(declare-fun b!172419 () Bool)

(declare-fun res!81871 () Bool)

(assert (=> b!172419 (=> (not res!81871) (not e!113807))))

(assert (=> b!172419 (= res!81871 (and (= (size!3704 (_values!3551 thiss!1248)) (bvadd (mask!8409 thiss!1248) #b00000000000000000000000000000001)) (= (size!3703 (_keys!5404 thiss!1248)) (size!3704 (_values!3551 thiss!1248))) (bvsge (_size!1171 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1171 thiss!1248) (bvadd (mask!8409 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!52505 res!81873) b!172419))

(assert (= (and b!172419 res!81871) b!172420))

(assert (= (and b!172420 res!81870) b!172421))

(assert (= (and b!172421 res!81872) b!172422))

(declare-fun m!201225 () Bool)

(assert (=> b!172420 m!201225))

(assert (=> b!172421 m!201225))

(assert (=> d!52505 m!201181))

(assert (=> d!52493 d!52505))

(declare-fun b!172424 () Bool)

(declare-fun e!113808 () Bool)

(assert (=> b!172424 (= e!113808 tp_is_empty!4023)))

(declare-fun b!172423 () Bool)

(declare-fun e!113809 () Bool)

(assert (=> b!172423 (= e!113809 tp_is_empty!4023)))

(declare-fun condMapEmpty!6847 () Bool)

(declare-fun mapDefault!6847 () ValueCell!1668)

(assert (=> mapNonEmpty!6846 (= condMapEmpty!6847 (= mapRest!6846 ((as const (Array (_ BitVec 32) ValueCell!1668)) mapDefault!6847)))))

(declare-fun mapRes!6847 () Bool)

(assert (=> mapNonEmpty!6846 (= tp!15405 (and e!113808 mapRes!6847))))

(declare-fun mapNonEmpty!6847 () Bool)

(declare-fun tp!15406 () Bool)

(assert (=> mapNonEmpty!6847 (= mapRes!6847 (and tp!15406 e!113809))))

(declare-fun mapValue!6847 () ValueCell!1668)

(declare-fun mapKey!6847 () (_ BitVec 32))

(declare-fun mapRest!6847 () (Array (_ BitVec 32) ValueCell!1668))

(assert (=> mapNonEmpty!6847 (= mapRest!6846 (store mapRest!6847 mapKey!6847 mapValue!6847))))

(declare-fun mapIsEmpty!6847 () Bool)

(assert (=> mapIsEmpty!6847 mapRes!6847))

(assert (= (and mapNonEmpty!6846 condMapEmpty!6847) mapIsEmpty!6847))

(assert (= (and mapNonEmpty!6846 (not condMapEmpty!6847)) mapNonEmpty!6847))

(assert (= (and mapNonEmpty!6847 ((_ is ValueCellFull!1668) mapValue!6847)) b!172423))

(assert (= (and mapNonEmpty!6846 ((_ is ValueCellFull!1668) mapDefault!6847)) b!172424))

(declare-fun m!201227 () Bool)

(assert (=> mapNonEmpty!6847 m!201227))

(check-sat (not b!172396) (not b!172385) (not b!172395) (not b!172408) b_and!10691 tp_is_empty!4023 (not mapNonEmpty!6847) (not b_next!4251) (not bm!17521) (not b!172420) (not b!172382) (not bm!17527) (not d!52505) (not bm!17524) (not b!172386) (not b!172421))
(check-sat b_and!10691 (not b_next!4251))
