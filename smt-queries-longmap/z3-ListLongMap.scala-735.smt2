; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17150 () Bool)

(assert start!17150)

(declare-fun b!172165 () Bool)

(declare-fun b_free!4249 () Bool)

(declare-fun b_next!4249 () Bool)

(assert (=> b!172165 (= b_free!4249 (not b_next!4249))))

(declare-fun tp!15389 () Bool)

(declare-fun b_and!10663 () Bool)

(assert (=> b!172165 (= tp!15389 b_and!10663)))

(declare-fun mapIsEmpty!6837 () Bool)

(declare-fun mapRes!6837 () Bool)

(assert (=> mapIsEmpty!6837 mapRes!6837))

(declare-fun b!172159 () Bool)

(declare-fun e!113628 () Bool)

(declare-fun e!113631 () Bool)

(assert (=> b!172159 (= e!113628 (and e!113631 mapRes!6837))))

(declare-fun condMapEmpty!6837 () Bool)

(declare-datatypes ((V!5009 0))(
  ( (V!5010 (val!2055 Int)) )
))
(declare-datatypes ((ValueCell!1667 0))(
  ( (ValueCellFull!1667 (v!3917 V!5009)) (EmptyCell!1667) )
))
(declare-datatypes ((array!7141 0))(
  ( (array!7142 (arr!3394 (Array (_ BitVec 32) (_ BitVec 64))) (size!3691 (_ BitVec 32))) )
))
(declare-datatypes ((array!7143 0))(
  ( (array!7144 (arr!3395 (Array (_ BitVec 32) ValueCell!1667)) (size!3692 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2242 0))(
  ( (LongMapFixedSize!2243 (defaultEntry!3567 Int) (mask!8407 (_ BitVec 32)) (extraKeys!3306 (_ BitVec 32)) (zeroValue!3408 V!5009) (minValue!3410 V!5009) (_size!1170 (_ BitVec 32)) (_keys!5402 array!7141) (_values!3550 array!7143) (_vacant!1170 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2242)

(declare-fun mapDefault!6837 () ValueCell!1667)

(assert (=> b!172159 (= condMapEmpty!6837 (= (arr!3395 (_values!3550 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1667)) mapDefault!6837)))))

(declare-fun mapNonEmpty!6837 () Bool)

(declare-fun tp!15390 () Bool)

(declare-fun e!113630 () Bool)

(assert (=> mapNonEmpty!6837 (= mapRes!6837 (and tp!15390 e!113630))))

(declare-fun mapValue!6837 () ValueCell!1667)

(declare-fun mapKey!6837 () (_ BitVec 32))

(declare-fun mapRest!6837 () (Array (_ BitVec 32) ValueCell!1667))

(assert (=> mapNonEmpty!6837 (= (arr!3395 (_values!3550 thiss!1248)) (store mapRest!6837 mapKey!6837 mapValue!6837))))

(declare-fun res!81724 () Bool)

(declare-fun e!113627 () Bool)

(assert (=> start!17150 (=> (not res!81724) (not e!113627))))

(declare-fun valid!973 (LongMapFixedSize!2242) Bool)

(assert (=> start!17150 (= res!81724 (valid!973 thiss!1248))))

(assert (=> start!17150 e!113627))

(declare-fun e!113626 () Bool)

(assert (=> start!17150 e!113626))

(assert (=> start!17150 true))

(declare-fun b!172160 () Bool)

(declare-fun res!81722 () Bool)

(assert (=> b!172160 (=> (not res!81722) (not e!113627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172160 (= res!81722 (validMask!0 (mask!8407 thiss!1248)))))

(declare-fun b!172161 () Bool)

(declare-fun res!81723 () Bool)

(assert (=> b!172161 (=> (not res!81723) (not e!113627))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172161 (= res!81723 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172162 () Bool)

(declare-fun tp_is_empty!4021 () Bool)

(assert (=> b!172162 (= e!113631 tp_is_empty!4021)))

(declare-fun b!172163 () Bool)

(assert (=> b!172163 (= e!113627 (and (= (size!3692 (_values!3550 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8407 thiss!1248))) (not (= (size!3691 (_keys!5402 thiss!1248)) (size!3692 (_values!3550 thiss!1248))))))))

(declare-fun b!172164 () Bool)

(assert (=> b!172164 (= e!113630 tp_is_empty!4021)))

(declare-fun array_inv!2189 (array!7141) Bool)

(declare-fun array_inv!2190 (array!7143) Bool)

(assert (=> b!172165 (= e!113626 (and tp!15389 tp_is_empty!4021 (array_inv!2189 (_keys!5402 thiss!1248)) (array_inv!2190 (_values!3550 thiss!1248)) e!113628))))

(assert (= (and start!17150 res!81724) b!172161))

(assert (= (and b!172161 res!81723) b!172160))

(assert (= (and b!172160 res!81722) b!172163))

(assert (= (and b!172159 condMapEmpty!6837) mapIsEmpty!6837))

(assert (= (and b!172159 (not condMapEmpty!6837)) mapNonEmpty!6837))

(get-info :version)

(assert (= (and mapNonEmpty!6837 ((_ is ValueCellFull!1667) mapValue!6837)) b!172164))

(assert (= (and b!172159 ((_ is ValueCellFull!1667) mapDefault!6837)) b!172162))

(assert (= b!172165 b!172159))

(assert (= start!17150 b!172165))

(declare-fun m!200547 () Bool)

(assert (=> mapNonEmpty!6837 m!200547))

(declare-fun m!200549 () Bool)

(assert (=> start!17150 m!200549))

(declare-fun m!200551 () Bool)

(assert (=> b!172160 m!200551))

(declare-fun m!200553 () Bool)

(assert (=> b!172165 m!200553))

(declare-fun m!200555 () Bool)

(assert (=> b!172165 m!200555))

(check-sat (not b!172160) (not b!172165) (not mapNonEmpty!6837) tp_is_empty!4021 (not start!17150) (not b_next!4249) b_and!10663)
(check-sat b_and!10663 (not b_next!4249))
(get-model)

(declare-fun d!52343 () Bool)

(assert (=> d!52343 (= (validMask!0 (mask!8407 thiss!1248)) (and (or (= (mask!8407 thiss!1248) #b00000000000000000000000000000111) (= (mask!8407 thiss!1248) #b00000000000000000000000000001111) (= (mask!8407 thiss!1248) #b00000000000000000000000000011111) (= (mask!8407 thiss!1248) #b00000000000000000000000000111111) (= (mask!8407 thiss!1248) #b00000000000000000000000001111111) (= (mask!8407 thiss!1248) #b00000000000000000000000011111111) (= (mask!8407 thiss!1248) #b00000000000000000000000111111111) (= (mask!8407 thiss!1248) #b00000000000000000000001111111111) (= (mask!8407 thiss!1248) #b00000000000000000000011111111111) (= (mask!8407 thiss!1248) #b00000000000000000000111111111111) (= (mask!8407 thiss!1248) #b00000000000000000001111111111111) (= (mask!8407 thiss!1248) #b00000000000000000011111111111111) (= (mask!8407 thiss!1248) #b00000000000000000111111111111111) (= (mask!8407 thiss!1248) #b00000000000000001111111111111111) (= (mask!8407 thiss!1248) #b00000000000000011111111111111111) (= (mask!8407 thiss!1248) #b00000000000000111111111111111111) (= (mask!8407 thiss!1248) #b00000000000001111111111111111111) (= (mask!8407 thiss!1248) #b00000000000011111111111111111111) (= (mask!8407 thiss!1248) #b00000000000111111111111111111111) (= (mask!8407 thiss!1248) #b00000000001111111111111111111111) (= (mask!8407 thiss!1248) #b00000000011111111111111111111111) (= (mask!8407 thiss!1248) #b00000000111111111111111111111111) (= (mask!8407 thiss!1248) #b00000001111111111111111111111111) (= (mask!8407 thiss!1248) #b00000011111111111111111111111111) (= (mask!8407 thiss!1248) #b00000111111111111111111111111111) (= (mask!8407 thiss!1248) #b00001111111111111111111111111111) (= (mask!8407 thiss!1248) #b00011111111111111111111111111111) (= (mask!8407 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8407 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172160 d!52343))

(declare-fun d!52345 () Bool)

(declare-fun res!81749 () Bool)

(declare-fun e!113670 () Bool)

(assert (=> d!52345 (=> (not res!81749) (not e!113670))))

(declare-fun simpleValid!138 (LongMapFixedSize!2242) Bool)

(assert (=> d!52345 (= res!81749 (simpleValid!138 thiss!1248))))

(assert (=> d!52345 (= (valid!973 thiss!1248) e!113670)))

(declare-fun b!172214 () Bool)

(declare-fun res!81750 () Bool)

(assert (=> b!172214 (=> (not res!81750) (not e!113670))))

(declare-fun arrayCountValidKeys!0 (array!7141 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172214 (= res!81750 (= (arrayCountValidKeys!0 (_keys!5402 thiss!1248) #b00000000000000000000000000000000 (size!3691 (_keys!5402 thiss!1248))) (_size!1170 thiss!1248)))))

(declare-fun b!172215 () Bool)

(declare-fun res!81751 () Bool)

(assert (=> b!172215 (=> (not res!81751) (not e!113670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7141 (_ BitVec 32)) Bool)

(assert (=> b!172215 (= res!81751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5402 thiss!1248) (mask!8407 thiss!1248)))))

(declare-fun b!172216 () Bool)

(declare-datatypes ((List!2208 0))(
  ( (Nil!2205) (Cons!2204 (h!2821 (_ BitVec 64)) (t!7006 List!2208)) )
))
(declare-fun arrayNoDuplicates!0 (array!7141 (_ BitVec 32) List!2208) Bool)

(assert (=> b!172216 (= e!113670 (arrayNoDuplicates!0 (_keys!5402 thiss!1248) #b00000000000000000000000000000000 Nil!2205))))

(assert (= (and d!52345 res!81749) b!172214))

(assert (= (and b!172214 res!81750) b!172215))

(assert (= (and b!172215 res!81751) b!172216))

(declare-fun m!200577 () Bool)

(assert (=> d!52345 m!200577))

(declare-fun m!200579 () Bool)

(assert (=> b!172214 m!200579))

(declare-fun m!200581 () Bool)

(assert (=> b!172215 m!200581))

(declare-fun m!200583 () Bool)

(assert (=> b!172216 m!200583))

(assert (=> start!17150 d!52345))

(declare-fun d!52347 () Bool)

(assert (=> d!52347 (= (array_inv!2189 (_keys!5402 thiss!1248)) (bvsge (size!3691 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172165 d!52347))

(declare-fun d!52349 () Bool)

(assert (=> d!52349 (= (array_inv!2190 (_values!3550 thiss!1248)) (bvsge (size!3692 (_values!3550 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172165 d!52349))

(declare-fun mapIsEmpty!6846 () Bool)

(declare-fun mapRes!6846 () Bool)

(assert (=> mapIsEmpty!6846 mapRes!6846))

(declare-fun mapNonEmpty!6846 () Bool)

(declare-fun tp!15405 () Bool)

(declare-fun e!113676 () Bool)

(assert (=> mapNonEmpty!6846 (= mapRes!6846 (and tp!15405 e!113676))))

(declare-fun mapValue!6846 () ValueCell!1667)

(declare-fun mapKey!6846 () (_ BitVec 32))

(declare-fun mapRest!6846 () (Array (_ BitVec 32) ValueCell!1667))

(assert (=> mapNonEmpty!6846 (= mapRest!6837 (store mapRest!6846 mapKey!6846 mapValue!6846))))

(declare-fun b!172224 () Bool)

(declare-fun e!113675 () Bool)

(assert (=> b!172224 (= e!113675 tp_is_empty!4021)))

(declare-fun b!172223 () Bool)

(assert (=> b!172223 (= e!113676 tp_is_empty!4021)))

(declare-fun condMapEmpty!6846 () Bool)

(declare-fun mapDefault!6846 () ValueCell!1667)

(assert (=> mapNonEmpty!6837 (= condMapEmpty!6846 (= mapRest!6837 ((as const (Array (_ BitVec 32) ValueCell!1667)) mapDefault!6846)))))

(assert (=> mapNonEmpty!6837 (= tp!15390 (and e!113675 mapRes!6846))))

(assert (= (and mapNonEmpty!6837 condMapEmpty!6846) mapIsEmpty!6846))

(assert (= (and mapNonEmpty!6837 (not condMapEmpty!6846)) mapNonEmpty!6846))

(assert (= (and mapNonEmpty!6846 ((_ is ValueCellFull!1667) mapValue!6846)) b!172223))

(assert (= (and mapNonEmpty!6837 ((_ is ValueCellFull!1667) mapDefault!6846)) b!172224))

(declare-fun m!200585 () Bool)

(assert (=> mapNonEmpty!6846 m!200585))

(check-sat (not mapNonEmpty!6846) (not b!172215) (not b!172214) (not d!52345) (not b!172216) tp_is_empty!4021 (not b_next!4249) b_and!10663)
(check-sat b_and!10663 (not b_next!4249))
(get-model)

(declare-fun b!172233 () Bool)

(declare-fun e!113682 () (_ BitVec 32))

(assert (=> b!172233 (= e!113682 #b00000000000000000000000000000000)))

(declare-fun b!172234 () Bool)

(declare-fun e!113681 () (_ BitVec 32))

(declare-fun call!17500 () (_ BitVec 32))

(assert (=> b!172234 (= e!113681 (bvadd #b00000000000000000000000000000001 call!17500))))

(declare-fun bm!17497 () Bool)

(assert (=> bm!17497 (= call!17500 (arrayCountValidKeys!0 (_keys!5402 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3691 (_keys!5402 thiss!1248))))))

(declare-fun b!172236 () Bool)

(assert (=> b!172236 (= e!113681 call!17500)))

(declare-fun b!172235 () Bool)

(assert (=> b!172235 (= e!113682 e!113681)))

(declare-fun c!30831 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172235 (= c!30831 (validKeyInArray!0 (select (arr!3394 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52351 () Bool)

(declare-fun lt!85479 () (_ BitVec 32))

(assert (=> d!52351 (and (bvsge lt!85479 #b00000000000000000000000000000000) (bvsle lt!85479 (bvsub (size!3691 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52351 (= lt!85479 e!113682)))

(declare-fun c!30830 () Bool)

(assert (=> d!52351 (= c!30830 (bvsge #b00000000000000000000000000000000 (size!3691 (_keys!5402 thiss!1248))))))

(assert (=> d!52351 (and (bvsle #b00000000000000000000000000000000 (size!3691 (_keys!5402 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3691 (_keys!5402 thiss!1248)) (size!3691 (_keys!5402 thiss!1248))))))

(assert (=> d!52351 (= (arrayCountValidKeys!0 (_keys!5402 thiss!1248) #b00000000000000000000000000000000 (size!3691 (_keys!5402 thiss!1248))) lt!85479)))

(assert (= (and d!52351 c!30830) b!172233))

(assert (= (and d!52351 (not c!30830)) b!172235))

(assert (= (and b!172235 c!30831) b!172234))

(assert (= (and b!172235 (not c!30831)) b!172236))

(assert (= (or b!172234 b!172236) bm!17497))

(declare-fun m!200587 () Bool)

(assert (=> bm!17497 m!200587))

(declare-fun m!200589 () Bool)

(assert (=> b!172235 m!200589))

(assert (=> b!172235 m!200589))

(declare-fun m!200591 () Bool)

(assert (=> b!172235 m!200591))

(assert (=> b!172214 d!52351))

(declare-fun b!172245 () Bool)

(declare-fun e!113691 () Bool)

(declare-fun call!17503 () Bool)

(assert (=> b!172245 (= e!113691 call!17503)))

(declare-fun b!172246 () Bool)

(declare-fun e!113690 () Bool)

(assert (=> b!172246 (= e!113690 call!17503)))

(declare-fun bm!17500 () Bool)

(assert (=> bm!17500 (= call!17503 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5402 thiss!1248) (mask!8407 thiss!1248)))))

(declare-fun d!52353 () Bool)

(declare-fun res!81757 () Bool)

(declare-fun e!113689 () Bool)

(assert (=> d!52353 (=> res!81757 e!113689)))

(assert (=> d!52353 (= res!81757 (bvsge #b00000000000000000000000000000000 (size!3691 (_keys!5402 thiss!1248))))))

(assert (=> d!52353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5402 thiss!1248) (mask!8407 thiss!1248)) e!113689)))

(declare-fun b!172247 () Bool)

(assert (=> b!172247 (= e!113689 e!113691)))

(declare-fun c!30834 () Bool)

(assert (=> b!172247 (= c!30834 (validKeyInArray!0 (select (arr!3394 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172248 () Bool)

(assert (=> b!172248 (= e!113691 e!113690)))

(declare-fun lt!85488 () (_ BitVec 64))

(assert (=> b!172248 (= lt!85488 (select (arr!3394 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5281 0))(
  ( (Unit!5282) )
))
(declare-fun lt!85487 () Unit!5281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7141 (_ BitVec 64) (_ BitVec 32)) Unit!5281)

(assert (=> b!172248 (= lt!85487 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5402 thiss!1248) lt!85488 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172248 (arrayContainsKey!0 (_keys!5402 thiss!1248) lt!85488 #b00000000000000000000000000000000)))

(declare-fun lt!85486 () Unit!5281)

(assert (=> b!172248 (= lt!85486 lt!85487)))

(declare-fun res!81756 () Bool)

(declare-datatypes ((SeekEntryResult!548 0))(
  ( (MissingZero!548 (index!4360 (_ BitVec 32))) (Found!548 (index!4361 (_ BitVec 32))) (Intermediate!548 (undefined!1360 Bool) (index!4362 (_ BitVec 32)) (x!19046 (_ BitVec 32))) (Undefined!548) (MissingVacant!548 (index!4363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7141 (_ BitVec 32)) SeekEntryResult!548)

(assert (=> b!172248 (= res!81756 (= (seekEntryOrOpen!0 (select (arr!3394 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000) (_keys!5402 thiss!1248) (mask!8407 thiss!1248)) (Found!548 #b00000000000000000000000000000000)))))

(assert (=> b!172248 (=> (not res!81756) (not e!113690))))

(assert (= (and d!52353 (not res!81757)) b!172247))

(assert (= (and b!172247 c!30834) b!172248))

(assert (= (and b!172247 (not c!30834)) b!172245))

(assert (= (and b!172248 res!81756) b!172246))

(assert (= (or b!172246 b!172245) bm!17500))

(declare-fun m!200593 () Bool)

(assert (=> bm!17500 m!200593))

(assert (=> b!172247 m!200589))

(assert (=> b!172247 m!200589))

(assert (=> b!172247 m!200591))

(assert (=> b!172248 m!200589))

(declare-fun m!200595 () Bool)

(assert (=> b!172248 m!200595))

(declare-fun m!200597 () Bool)

(assert (=> b!172248 m!200597))

(assert (=> b!172248 m!200589))

(declare-fun m!200599 () Bool)

(assert (=> b!172248 m!200599))

(assert (=> b!172215 d!52353))

(declare-fun bm!17503 () Bool)

(declare-fun call!17506 () Bool)

(declare-fun c!30837 () Bool)

(assert (=> bm!17503 (= call!17506 (arrayNoDuplicates!0 (_keys!5402 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30837 (Cons!2204 (select (arr!3394 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000) Nil!2205) Nil!2205)))))

(declare-fun b!172259 () Bool)

(declare-fun e!113702 () Bool)

(assert (=> b!172259 (= e!113702 call!17506)))

(declare-fun b!172260 () Bool)

(declare-fun e!113700 () Bool)

(declare-fun contains!1148 (List!2208 (_ BitVec 64)) Bool)

(assert (=> b!172260 (= e!113700 (contains!1148 Nil!2205 (select (arr!3394 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172261 () Bool)

(declare-fun e!113703 () Bool)

(assert (=> b!172261 (= e!113703 e!113702)))

(assert (=> b!172261 (= c!30837 (validKeyInArray!0 (select (arr!3394 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172262 () Bool)

(declare-fun e!113701 () Bool)

(assert (=> b!172262 (= e!113701 e!113703)))

(declare-fun res!81766 () Bool)

(assert (=> b!172262 (=> (not res!81766) (not e!113703))))

(assert (=> b!172262 (= res!81766 (not e!113700))))

(declare-fun res!81764 () Bool)

(assert (=> b!172262 (=> (not res!81764) (not e!113700))))

(assert (=> b!172262 (= res!81764 (validKeyInArray!0 (select (arr!3394 (_keys!5402 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52355 () Bool)

(declare-fun res!81765 () Bool)

(assert (=> d!52355 (=> res!81765 e!113701)))

(assert (=> d!52355 (= res!81765 (bvsge #b00000000000000000000000000000000 (size!3691 (_keys!5402 thiss!1248))))))

(assert (=> d!52355 (= (arrayNoDuplicates!0 (_keys!5402 thiss!1248) #b00000000000000000000000000000000 Nil!2205) e!113701)))

(declare-fun b!172263 () Bool)

(assert (=> b!172263 (= e!113702 call!17506)))

(assert (= (and d!52355 (not res!81765)) b!172262))

(assert (= (and b!172262 res!81764) b!172260))

(assert (= (and b!172262 res!81766) b!172261))

(assert (= (and b!172261 c!30837) b!172263))

(assert (= (and b!172261 (not c!30837)) b!172259))

(assert (= (or b!172263 b!172259) bm!17503))

(assert (=> bm!17503 m!200589))

(declare-fun m!200601 () Bool)

(assert (=> bm!17503 m!200601))

(assert (=> b!172260 m!200589))

(assert (=> b!172260 m!200589))

(declare-fun m!200603 () Bool)

(assert (=> b!172260 m!200603))

(assert (=> b!172261 m!200589))

(assert (=> b!172261 m!200589))

(assert (=> b!172261 m!200591))

(assert (=> b!172262 m!200589))

(assert (=> b!172262 m!200589))

(assert (=> b!172262 m!200591))

(assert (=> b!172216 d!52355))

(declare-fun d!52357 () Bool)

(declare-fun res!81776 () Bool)

(declare-fun e!113706 () Bool)

(assert (=> d!52357 (=> (not res!81776) (not e!113706))))

(assert (=> d!52357 (= res!81776 (validMask!0 (mask!8407 thiss!1248)))))

(assert (=> d!52357 (= (simpleValid!138 thiss!1248) e!113706)))

(declare-fun b!172273 () Bool)

(declare-fun res!81778 () Bool)

(assert (=> b!172273 (=> (not res!81778) (not e!113706))))

(declare-fun size!3697 (LongMapFixedSize!2242) (_ BitVec 32))

(assert (=> b!172273 (= res!81778 (bvsge (size!3697 thiss!1248) (_size!1170 thiss!1248)))))

(declare-fun b!172272 () Bool)

(declare-fun res!81777 () Bool)

(assert (=> b!172272 (=> (not res!81777) (not e!113706))))

(assert (=> b!172272 (= res!81777 (and (= (size!3692 (_values!3550 thiss!1248)) (bvadd (mask!8407 thiss!1248) #b00000000000000000000000000000001)) (= (size!3691 (_keys!5402 thiss!1248)) (size!3692 (_values!3550 thiss!1248))) (bvsge (_size!1170 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1170 thiss!1248) (bvadd (mask!8407 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172275 () Bool)

(assert (=> b!172275 (= e!113706 (and (bvsge (extraKeys!3306 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3306 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1170 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172274 () Bool)

(declare-fun res!81775 () Bool)

(assert (=> b!172274 (=> (not res!81775) (not e!113706))))

(assert (=> b!172274 (= res!81775 (= (size!3697 thiss!1248) (bvadd (_size!1170 thiss!1248) (bvsdiv (bvadd (extraKeys!3306 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!52357 res!81776) b!172272))

(assert (= (and b!172272 res!81777) b!172273))

(assert (= (and b!172273 res!81778) b!172274))

(assert (= (and b!172274 res!81775) b!172275))

(assert (=> d!52357 m!200551))

(declare-fun m!200605 () Bool)

(assert (=> b!172273 m!200605))

(assert (=> b!172274 m!200605))

(assert (=> d!52345 d!52357))

(declare-fun mapIsEmpty!6847 () Bool)

(declare-fun mapRes!6847 () Bool)

(assert (=> mapIsEmpty!6847 mapRes!6847))

(declare-fun mapNonEmpty!6847 () Bool)

(declare-fun tp!15406 () Bool)

(declare-fun e!113708 () Bool)

(assert (=> mapNonEmpty!6847 (= mapRes!6847 (and tp!15406 e!113708))))

(declare-fun mapRest!6847 () (Array (_ BitVec 32) ValueCell!1667))

(declare-fun mapKey!6847 () (_ BitVec 32))

(declare-fun mapValue!6847 () ValueCell!1667)

(assert (=> mapNonEmpty!6847 (= mapRest!6846 (store mapRest!6847 mapKey!6847 mapValue!6847))))

(declare-fun b!172277 () Bool)

(declare-fun e!113707 () Bool)

(assert (=> b!172277 (= e!113707 tp_is_empty!4021)))

(declare-fun b!172276 () Bool)

(assert (=> b!172276 (= e!113708 tp_is_empty!4021)))

(declare-fun condMapEmpty!6847 () Bool)

(declare-fun mapDefault!6847 () ValueCell!1667)

(assert (=> mapNonEmpty!6846 (= condMapEmpty!6847 (= mapRest!6846 ((as const (Array (_ BitVec 32) ValueCell!1667)) mapDefault!6847)))))

(assert (=> mapNonEmpty!6846 (= tp!15405 (and e!113707 mapRes!6847))))

(assert (= (and mapNonEmpty!6846 condMapEmpty!6847) mapIsEmpty!6847))

(assert (= (and mapNonEmpty!6846 (not condMapEmpty!6847)) mapNonEmpty!6847))

(assert (= (and mapNonEmpty!6847 ((_ is ValueCellFull!1667) mapValue!6847)) b!172276))

(assert (= (and mapNonEmpty!6846 ((_ is ValueCellFull!1667) mapDefault!6847)) b!172277))

(declare-fun m!200607 () Bool)

(assert (=> mapNonEmpty!6847 m!200607))

(check-sat (not b!172260) (not b!172273) (not b!172262) (not b!172261) (not bm!17503) (not b!172235) (not b!172274) (not bm!17497) (not d!52357) (not b!172247) tp_is_empty!4021 (not b!172248) (not b_next!4249) b_and!10663 (not bm!17500) (not mapNonEmpty!6847))
(check-sat b_and!10663 (not b_next!4249))
