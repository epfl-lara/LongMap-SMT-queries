; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17206 () Bool)

(assert start!17206)

(declare-fun b!172677 () Bool)

(declare-fun b_free!4269 () Bool)

(declare-fun b_next!4269 () Bool)

(assert (=> b!172677 (= b_free!4269 (not b_next!4269))))

(declare-fun tp!15460 () Bool)

(declare-fun b_and!10709 () Bool)

(assert (=> b!172677 (= tp!15460 b_and!10709)))

(declare-fun b!172673 () Bool)

(declare-fun res!81989 () Bool)

(declare-fun e!114001 () Bool)

(assert (=> b!172673 (=> (not res!81989) (not e!114001))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172673 (= res!81989 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172674 () Bool)

(declare-fun e!114003 () Bool)

(declare-fun e!114002 () Bool)

(declare-fun mapRes!6878 () Bool)

(assert (=> b!172674 (= e!114003 (and e!114002 mapRes!6878))))

(declare-fun condMapEmpty!6878 () Bool)

(declare-datatypes ((V!5035 0))(
  ( (V!5036 (val!2065 Int)) )
))
(declare-datatypes ((ValueCell!1677 0))(
  ( (ValueCellFull!1677 (v!3933 V!5035)) (EmptyCell!1677) )
))
(declare-datatypes ((array!7207 0))(
  ( (array!7208 (arr!3425 (Array (_ BitVec 32) (_ BitVec 64))) (size!3723 (_ BitVec 32))) )
))
(declare-datatypes ((array!7209 0))(
  ( (array!7210 (arr!3426 (Array (_ BitVec 32) ValueCell!1677)) (size!3724 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2262 0))(
  ( (LongMapFixedSize!2263 (defaultEntry!3577 Int) (mask!8429 (_ BitVec 32)) (extraKeys!3316 (_ BitVec 32)) (zeroValue!3418 V!5035) (minValue!3420 V!5035) (_size!1180 (_ BitVec 32)) (_keys!5415 array!7207) (_values!3560 array!7209) (_vacant!1180 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2262)

(declare-fun mapDefault!6878 () ValueCell!1677)

(assert (=> b!172674 (= condMapEmpty!6878 (= (arr!3426 (_values!3560 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1677)) mapDefault!6878)))))

(declare-fun b!172675 () Bool)

(assert (=> b!172675 (= e!114001 (and (= (size!3724 (_values!3560 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8429 thiss!1248))) (= (size!3723 (_keys!5415 thiss!1248)) (size!3724 (_values!3560 thiss!1248))) (bvsge (mask!8429 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3316 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3316 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!172676 () Bool)

(declare-fun tp_is_empty!4041 () Bool)

(assert (=> b!172676 (= e!114002 tp_is_empty!4041)))

(declare-fun e!113999 () Bool)

(declare-fun array_inv!2193 (array!7207) Bool)

(declare-fun array_inv!2194 (array!7209) Bool)

(assert (=> b!172677 (= e!113999 (and tp!15460 tp_is_empty!4041 (array_inv!2193 (_keys!5415 thiss!1248)) (array_inv!2194 (_values!3560 thiss!1248)) e!114003))))

(declare-fun mapIsEmpty!6878 () Bool)

(assert (=> mapIsEmpty!6878 mapRes!6878))

(declare-fun res!81990 () Bool)

(assert (=> start!17206 (=> (not res!81990) (not e!114001))))

(declare-fun valid!958 (LongMapFixedSize!2262) Bool)

(assert (=> start!17206 (= res!81990 (valid!958 thiss!1248))))

(assert (=> start!17206 e!114001))

(assert (=> start!17206 e!113999))

(assert (=> start!17206 true))

(declare-fun mapNonEmpty!6878 () Bool)

(declare-fun tp!15461 () Bool)

(declare-fun e!114000 () Bool)

(assert (=> mapNonEmpty!6878 (= mapRes!6878 (and tp!15461 e!114000))))

(declare-fun mapKey!6878 () (_ BitVec 32))

(declare-fun mapRest!6878 () (Array (_ BitVec 32) ValueCell!1677))

(declare-fun mapValue!6878 () ValueCell!1677)

(assert (=> mapNonEmpty!6878 (= (arr!3426 (_values!3560 thiss!1248)) (store mapRest!6878 mapKey!6878 mapValue!6878))))

(declare-fun b!172678 () Bool)

(declare-fun res!81988 () Bool)

(assert (=> b!172678 (=> (not res!81988) (not e!114001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172678 (= res!81988 (validMask!0 (mask!8429 thiss!1248)))))

(declare-fun b!172679 () Bool)

(assert (=> b!172679 (= e!114000 tp_is_empty!4041)))

(assert (= (and start!17206 res!81990) b!172673))

(assert (= (and b!172673 res!81989) b!172678))

(assert (= (and b!172678 res!81988) b!172675))

(assert (= (and b!172674 condMapEmpty!6878) mapIsEmpty!6878))

(assert (= (and b!172674 (not condMapEmpty!6878)) mapNonEmpty!6878))

(get-info :version)

(assert (= (and mapNonEmpty!6878 ((_ is ValueCellFull!1677) mapValue!6878)) b!172679))

(assert (= (and b!172674 ((_ is ValueCellFull!1677) mapDefault!6878)) b!172676))

(assert (= b!172677 b!172674))

(assert (= start!17206 b!172677))

(declare-fun m!201341 () Bool)

(assert (=> b!172677 m!201341))

(declare-fun m!201343 () Bool)

(assert (=> b!172677 m!201343))

(declare-fun m!201345 () Bool)

(assert (=> start!17206 m!201345))

(declare-fun m!201347 () Bool)

(assert (=> mapNonEmpty!6878 m!201347))

(declare-fun m!201349 () Bool)

(assert (=> b!172678 m!201349))

(check-sat tp_is_empty!4041 (not b_next!4269) (not b!172677) (not start!17206) b_and!10709 (not mapNonEmpty!6878) (not b!172678))
(check-sat b_and!10709 (not b_next!4269))
(get-model)

(declare-fun d!52537 () Bool)

(assert (=> d!52537 (= (array_inv!2193 (_keys!5415 thiss!1248)) (bvsge (size!3723 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172677 d!52537))

(declare-fun d!52539 () Bool)

(assert (=> d!52539 (= (array_inv!2194 (_values!3560 thiss!1248)) (bvsge (size!3724 (_values!3560 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172677 d!52539))

(declare-fun d!52541 () Bool)

(declare-fun res!82006 () Bool)

(declare-fun e!114024 () Bool)

(assert (=> d!52541 (=> (not res!82006) (not e!114024))))

(declare-fun simpleValid!141 (LongMapFixedSize!2262) Bool)

(assert (=> d!52541 (= res!82006 (simpleValid!141 thiss!1248))))

(assert (=> d!52541 (= (valid!958 thiss!1248) e!114024)))

(declare-fun b!172707 () Bool)

(declare-fun res!82007 () Bool)

(assert (=> b!172707 (=> (not res!82007) (not e!114024))))

(declare-fun arrayCountValidKeys!0 (array!7207 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172707 (= res!82007 (= (arrayCountValidKeys!0 (_keys!5415 thiss!1248) #b00000000000000000000000000000000 (size!3723 (_keys!5415 thiss!1248))) (_size!1180 thiss!1248)))))

(declare-fun b!172708 () Bool)

(declare-fun res!82008 () Bool)

(assert (=> b!172708 (=> (not res!82008) (not e!114024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7207 (_ BitVec 32)) Bool)

(assert (=> b!172708 (= res!82008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5415 thiss!1248) (mask!8429 thiss!1248)))))

(declare-fun b!172709 () Bool)

(declare-datatypes ((List!2201 0))(
  ( (Nil!2198) (Cons!2197 (h!2814 (_ BitVec 64)) (t!7008 List!2201)) )
))
(declare-fun arrayNoDuplicates!0 (array!7207 (_ BitVec 32) List!2201) Bool)

(assert (=> b!172709 (= e!114024 (arrayNoDuplicates!0 (_keys!5415 thiss!1248) #b00000000000000000000000000000000 Nil!2198))))

(assert (= (and d!52541 res!82006) b!172707))

(assert (= (and b!172707 res!82007) b!172708))

(assert (= (and b!172708 res!82008) b!172709))

(declare-fun m!201361 () Bool)

(assert (=> d!52541 m!201361))

(declare-fun m!201363 () Bool)

(assert (=> b!172707 m!201363))

(declare-fun m!201365 () Bool)

(assert (=> b!172708 m!201365))

(declare-fun m!201367 () Bool)

(assert (=> b!172709 m!201367))

(assert (=> start!17206 d!52541))

(declare-fun d!52543 () Bool)

(assert (=> d!52543 (= (validMask!0 (mask!8429 thiss!1248)) (and (or (= (mask!8429 thiss!1248) #b00000000000000000000000000000111) (= (mask!8429 thiss!1248) #b00000000000000000000000000001111) (= (mask!8429 thiss!1248) #b00000000000000000000000000011111) (= (mask!8429 thiss!1248) #b00000000000000000000000000111111) (= (mask!8429 thiss!1248) #b00000000000000000000000001111111) (= (mask!8429 thiss!1248) #b00000000000000000000000011111111) (= (mask!8429 thiss!1248) #b00000000000000000000000111111111) (= (mask!8429 thiss!1248) #b00000000000000000000001111111111) (= (mask!8429 thiss!1248) #b00000000000000000000011111111111) (= (mask!8429 thiss!1248) #b00000000000000000000111111111111) (= (mask!8429 thiss!1248) #b00000000000000000001111111111111) (= (mask!8429 thiss!1248) #b00000000000000000011111111111111) (= (mask!8429 thiss!1248) #b00000000000000000111111111111111) (= (mask!8429 thiss!1248) #b00000000000000001111111111111111) (= (mask!8429 thiss!1248) #b00000000000000011111111111111111) (= (mask!8429 thiss!1248) #b00000000000000111111111111111111) (= (mask!8429 thiss!1248) #b00000000000001111111111111111111) (= (mask!8429 thiss!1248) #b00000000000011111111111111111111) (= (mask!8429 thiss!1248) #b00000000000111111111111111111111) (= (mask!8429 thiss!1248) #b00000000001111111111111111111111) (= (mask!8429 thiss!1248) #b00000000011111111111111111111111) (= (mask!8429 thiss!1248) #b00000000111111111111111111111111) (= (mask!8429 thiss!1248) #b00000001111111111111111111111111) (= (mask!8429 thiss!1248) #b00000011111111111111111111111111) (= (mask!8429 thiss!1248) #b00000111111111111111111111111111) (= (mask!8429 thiss!1248) #b00001111111111111111111111111111) (= (mask!8429 thiss!1248) #b00011111111111111111111111111111) (= (mask!8429 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8429 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172678 d!52543))

(declare-fun mapNonEmpty!6884 () Bool)

(declare-fun mapRes!6884 () Bool)

(declare-fun tp!15470 () Bool)

(declare-fun e!114029 () Bool)

(assert (=> mapNonEmpty!6884 (= mapRes!6884 (and tp!15470 e!114029))))

(declare-fun mapRest!6884 () (Array (_ BitVec 32) ValueCell!1677))

(declare-fun mapValue!6884 () ValueCell!1677)

(declare-fun mapKey!6884 () (_ BitVec 32))

(assert (=> mapNonEmpty!6884 (= mapRest!6878 (store mapRest!6884 mapKey!6884 mapValue!6884))))

(declare-fun mapIsEmpty!6884 () Bool)

(assert (=> mapIsEmpty!6884 mapRes!6884))

(declare-fun b!172717 () Bool)

(declare-fun e!114030 () Bool)

(assert (=> b!172717 (= e!114030 tp_is_empty!4041)))

(declare-fun condMapEmpty!6884 () Bool)

(declare-fun mapDefault!6884 () ValueCell!1677)

(assert (=> mapNonEmpty!6878 (= condMapEmpty!6884 (= mapRest!6878 ((as const (Array (_ BitVec 32) ValueCell!1677)) mapDefault!6884)))))

(assert (=> mapNonEmpty!6878 (= tp!15461 (and e!114030 mapRes!6884))))

(declare-fun b!172716 () Bool)

(assert (=> b!172716 (= e!114029 tp_is_empty!4041)))

(assert (= (and mapNonEmpty!6878 condMapEmpty!6884) mapIsEmpty!6884))

(assert (= (and mapNonEmpty!6878 (not condMapEmpty!6884)) mapNonEmpty!6884))

(assert (= (and mapNonEmpty!6884 ((_ is ValueCellFull!1677) mapValue!6884)) b!172716))

(assert (= (and mapNonEmpty!6878 ((_ is ValueCellFull!1677) mapDefault!6884)) b!172717))

(declare-fun m!201369 () Bool)

(assert (=> mapNonEmpty!6884 m!201369))

(check-sat tp_is_empty!4041 (not b_next!4269) (not mapNonEmpty!6884) (not b!172708) (not b!172707) (not d!52541) (not b!172709) b_and!10709)
(check-sat b_and!10709 (not b_next!4269))
(get-model)

(declare-fun b!172728 () Bool)

(declare-fun e!114040 () Bool)

(declare-fun call!17542 () Bool)

(assert (=> b!172728 (= e!114040 call!17542)))

(declare-fun d!52545 () Bool)

(declare-fun res!82017 () Bool)

(declare-fun e!114039 () Bool)

(assert (=> d!52545 (=> res!82017 e!114039)))

(assert (=> d!52545 (= res!82017 (bvsge #b00000000000000000000000000000000 (size!3723 (_keys!5415 thiss!1248))))))

(assert (=> d!52545 (= (arrayNoDuplicates!0 (_keys!5415 thiss!1248) #b00000000000000000000000000000000 Nil!2198) e!114039)))

(declare-fun bm!17539 () Bool)

(declare-fun c!30878 () Bool)

(assert (=> bm!17539 (= call!17542 (arrayNoDuplicates!0 (_keys!5415 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30878 (Cons!2197 (select (arr!3425 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000) Nil!2198) Nil!2198)))))

(declare-fun b!172729 () Bool)

(declare-fun e!114041 () Bool)

(assert (=> b!172729 (= e!114039 e!114041)))

(declare-fun res!82015 () Bool)

(assert (=> b!172729 (=> (not res!82015) (not e!114041))))

(declare-fun e!114042 () Bool)

(assert (=> b!172729 (= res!82015 (not e!114042))))

(declare-fun res!82016 () Bool)

(assert (=> b!172729 (=> (not res!82016) (not e!114042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172729 (= res!82016 (validKeyInArray!0 (select (arr!3425 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172730 () Bool)

(assert (=> b!172730 (= e!114041 e!114040)))

(assert (=> b!172730 (= c!30878 (validKeyInArray!0 (select (arr!3425 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172731 () Bool)

(assert (=> b!172731 (= e!114040 call!17542)))

(declare-fun b!172732 () Bool)

(declare-fun contains!1152 (List!2201 (_ BitVec 64)) Bool)

(assert (=> b!172732 (= e!114042 (contains!1152 Nil!2198 (select (arr!3425 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52545 (not res!82017)) b!172729))

(assert (= (and b!172729 res!82016) b!172732))

(assert (= (and b!172729 res!82015) b!172730))

(assert (= (and b!172730 c!30878) b!172731))

(assert (= (and b!172730 (not c!30878)) b!172728))

(assert (= (or b!172731 b!172728) bm!17539))

(declare-fun m!201371 () Bool)

(assert (=> bm!17539 m!201371))

(declare-fun m!201373 () Bool)

(assert (=> bm!17539 m!201373))

(assert (=> b!172729 m!201371))

(assert (=> b!172729 m!201371))

(declare-fun m!201375 () Bool)

(assert (=> b!172729 m!201375))

(assert (=> b!172730 m!201371))

(assert (=> b!172730 m!201371))

(assert (=> b!172730 m!201375))

(assert (=> b!172732 m!201371))

(assert (=> b!172732 m!201371))

(declare-fun m!201377 () Bool)

(assert (=> b!172732 m!201377))

(assert (=> b!172709 d!52545))

(declare-fun b!172741 () Bool)

(declare-fun e!114051 () Bool)

(declare-fun call!17545 () Bool)

(assert (=> b!172741 (= e!114051 call!17545)))

(declare-fun bm!17542 () Bool)

(assert (=> bm!17542 (= call!17545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5415 thiss!1248) (mask!8429 thiss!1248)))))

(declare-fun b!172742 () Bool)

(declare-fun e!114050 () Bool)

(assert (=> b!172742 (= e!114051 e!114050)))

(declare-fun lt!85688 () (_ BitVec 64))

(assert (=> b!172742 (= lt!85688 (select (arr!3425 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5308 0))(
  ( (Unit!5309) )
))
(declare-fun lt!85690 () Unit!5308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7207 (_ BitVec 64) (_ BitVec 32)) Unit!5308)

(assert (=> b!172742 (= lt!85690 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5415 thiss!1248) lt!85688 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172742 (arrayContainsKey!0 (_keys!5415 thiss!1248) lt!85688 #b00000000000000000000000000000000)))

(declare-fun lt!85689 () Unit!5308)

(assert (=> b!172742 (= lt!85689 lt!85690)))

(declare-fun res!82023 () Bool)

(declare-datatypes ((SeekEntryResult!539 0))(
  ( (MissingZero!539 (index!4324 (_ BitVec 32))) (Found!539 (index!4325 (_ BitVec 32))) (Intermediate!539 (undefined!1351 Bool) (index!4326 (_ BitVec 32)) (x!19098 (_ BitVec 32))) (Undefined!539) (MissingVacant!539 (index!4327 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7207 (_ BitVec 32)) SeekEntryResult!539)

(assert (=> b!172742 (= res!82023 (= (seekEntryOrOpen!0 (select (arr!3425 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000) (_keys!5415 thiss!1248) (mask!8429 thiss!1248)) (Found!539 #b00000000000000000000000000000000)))))

(assert (=> b!172742 (=> (not res!82023) (not e!114050))))

(declare-fun b!172743 () Bool)

(assert (=> b!172743 (= e!114050 call!17545)))

(declare-fun b!172744 () Bool)

(declare-fun e!114049 () Bool)

(assert (=> b!172744 (= e!114049 e!114051)))

(declare-fun c!30881 () Bool)

(assert (=> b!172744 (= c!30881 (validKeyInArray!0 (select (arr!3425 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52547 () Bool)

(declare-fun res!82022 () Bool)

(assert (=> d!52547 (=> res!82022 e!114049)))

(assert (=> d!52547 (= res!82022 (bvsge #b00000000000000000000000000000000 (size!3723 (_keys!5415 thiss!1248))))))

(assert (=> d!52547 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5415 thiss!1248) (mask!8429 thiss!1248)) e!114049)))

(assert (= (and d!52547 (not res!82022)) b!172744))

(assert (= (and b!172744 c!30881) b!172742))

(assert (= (and b!172744 (not c!30881)) b!172741))

(assert (= (and b!172742 res!82023) b!172743))

(assert (= (or b!172743 b!172741) bm!17542))

(declare-fun m!201379 () Bool)

(assert (=> bm!17542 m!201379))

(assert (=> b!172742 m!201371))

(declare-fun m!201381 () Bool)

(assert (=> b!172742 m!201381))

(declare-fun m!201383 () Bool)

(assert (=> b!172742 m!201383))

(assert (=> b!172742 m!201371))

(declare-fun m!201385 () Bool)

(assert (=> b!172742 m!201385))

(assert (=> b!172744 m!201371))

(assert (=> b!172744 m!201371))

(assert (=> b!172744 m!201375))

(assert (=> b!172708 d!52547))

(declare-fun b!172753 () Bool)

(declare-fun res!82035 () Bool)

(declare-fun e!114054 () Bool)

(assert (=> b!172753 (=> (not res!82035) (not e!114054))))

(assert (=> b!172753 (= res!82035 (and (= (size!3724 (_values!3560 thiss!1248)) (bvadd (mask!8429 thiss!1248) #b00000000000000000000000000000001)) (= (size!3723 (_keys!5415 thiss!1248)) (size!3724 (_values!3560 thiss!1248))) (bvsge (_size!1180 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1180 thiss!1248) (bvadd (mask!8429 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172756 () Bool)

(assert (=> b!172756 (= e!114054 (and (bvsge (extraKeys!3316 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3316 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1180 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172755 () Bool)

(declare-fun res!82034 () Bool)

(assert (=> b!172755 (=> (not res!82034) (not e!114054))))

(declare-fun size!3727 (LongMapFixedSize!2262) (_ BitVec 32))

(assert (=> b!172755 (= res!82034 (= (size!3727 thiss!1248) (bvadd (_size!1180 thiss!1248) (bvsdiv (bvadd (extraKeys!3316 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!172754 () Bool)

(declare-fun res!82032 () Bool)

(assert (=> b!172754 (=> (not res!82032) (not e!114054))))

(assert (=> b!172754 (= res!82032 (bvsge (size!3727 thiss!1248) (_size!1180 thiss!1248)))))

(declare-fun d!52549 () Bool)

(declare-fun res!82033 () Bool)

(assert (=> d!52549 (=> (not res!82033) (not e!114054))))

(assert (=> d!52549 (= res!82033 (validMask!0 (mask!8429 thiss!1248)))))

(assert (=> d!52549 (= (simpleValid!141 thiss!1248) e!114054)))

(assert (= (and d!52549 res!82033) b!172753))

(assert (= (and b!172753 res!82035) b!172754))

(assert (= (and b!172754 res!82032) b!172755))

(assert (= (and b!172755 res!82034) b!172756))

(declare-fun m!201387 () Bool)

(assert (=> b!172755 m!201387))

(assert (=> b!172754 m!201387))

(assert (=> d!52549 m!201349))

(assert (=> d!52541 d!52549))

(declare-fun b!172765 () Bool)

(declare-fun e!114060 () (_ BitVec 32))

(assert (=> b!172765 (= e!114060 #b00000000000000000000000000000000)))

(declare-fun b!172766 () Bool)

(declare-fun e!114059 () (_ BitVec 32))

(declare-fun call!17548 () (_ BitVec 32))

(assert (=> b!172766 (= e!114059 call!17548)))

(declare-fun d!52551 () Bool)

(declare-fun lt!85693 () (_ BitVec 32))

(assert (=> d!52551 (and (bvsge lt!85693 #b00000000000000000000000000000000) (bvsle lt!85693 (bvsub (size!3723 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52551 (= lt!85693 e!114060)))

(declare-fun c!30887 () Bool)

(assert (=> d!52551 (= c!30887 (bvsge #b00000000000000000000000000000000 (size!3723 (_keys!5415 thiss!1248))))))

(assert (=> d!52551 (and (bvsle #b00000000000000000000000000000000 (size!3723 (_keys!5415 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3723 (_keys!5415 thiss!1248)) (size!3723 (_keys!5415 thiss!1248))))))

(assert (=> d!52551 (= (arrayCountValidKeys!0 (_keys!5415 thiss!1248) #b00000000000000000000000000000000 (size!3723 (_keys!5415 thiss!1248))) lt!85693)))

(declare-fun bm!17545 () Bool)

(assert (=> bm!17545 (= call!17548 (arrayCountValidKeys!0 (_keys!5415 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3723 (_keys!5415 thiss!1248))))))

(declare-fun b!172767 () Bool)

(assert (=> b!172767 (= e!114059 (bvadd #b00000000000000000000000000000001 call!17548))))

(declare-fun b!172768 () Bool)

(assert (=> b!172768 (= e!114060 e!114059)))

(declare-fun c!30886 () Bool)

(assert (=> b!172768 (= c!30886 (validKeyInArray!0 (select (arr!3425 (_keys!5415 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52551 c!30887) b!172765))

(assert (= (and d!52551 (not c!30887)) b!172768))

(assert (= (and b!172768 c!30886) b!172767))

(assert (= (and b!172768 (not c!30886)) b!172766))

(assert (= (or b!172767 b!172766) bm!17545))

(declare-fun m!201389 () Bool)

(assert (=> bm!17545 m!201389))

(assert (=> b!172768 m!201371))

(assert (=> b!172768 m!201371))

(assert (=> b!172768 m!201375))

(assert (=> b!172707 d!52551))

(declare-fun mapNonEmpty!6885 () Bool)

(declare-fun mapRes!6885 () Bool)

(declare-fun tp!15471 () Bool)

(declare-fun e!114061 () Bool)

(assert (=> mapNonEmpty!6885 (= mapRes!6885 (and tp!15471 e!114061))))

(declare-fun mapValue!6885 () ValueCell!1677)

(declare-fun mapRest!6885 () (Array (_ BitVec 32) ValueCell!1677))

(declare-fun mapKey!6885 () (_ BitVec 32))

(assert (=> mapNonEmpty!6885 (= mapRest!6884 (store mapRest!6885 mapKey!6885 mapValue!6885))))

(declare-fun mapIsEmpty!6885 () Bool)

(assert (=> mapIsEmpty!6885 mapRes!6885))

(declare-fun b!172770 () Bool)

(declare-fun e!114062 () Bool)

(assert (=> b!172770 (= e!114062 tp_is_empty!4041)))

(declare-fun condMapEmpty!6885 () Bool)

(declare-fun mapDefault!6885 () ValueCell!1677)

(assert (=> mapNonEmpty!6884 (= condMapEmpty!6885 (= mapRest!6884 ((as const (Array (_ BitVec 32) ValueCell!1677)) mapDefault!6885)))))

(assert (=> mapNonEmpty!6884 (= tp!15470 (and e!114062 mapRes!6885))))

(declare-fun b!172769 () Bool)

(assert (=> b!172769 (= e!114061 tp_is_empty!4041)))

(assert (= (and mapNonEmpty!6884 condMapEmpty!6885) mapIsEmpty!6885))

(assert (= (and mapNonEmpty!6884 (not condMapEmpty!6885)) mapNonEmpty!6885))

(assert (= (and mapNonEmpty!6885 ((_ is ValueCellFull!1677) mapValue!6885)) b!172769))

(assert (= (and mapNonEmpty!6884 ((_ is ValueCellFull!1677) mapDefault!6885)) b!172770))

(declare-fun m!201391 () Bool)

(assert (=> mapNonEmpty!6885 m!201391))

(check-sat (not b!172744) tp_is_empty!4041 (not b_next!4269) (not mapNonEmpty!6885) (not b!172768) (not b!172732) (not b!172754) (not b!172755) (not b!172730) b_and!10709 (not bm!17545) (not bm!17539) (not bm!17542) (not d!52549) (not b!172729) (not b!172742))
(check-sat b_and!10709 (not b_next!4269))
