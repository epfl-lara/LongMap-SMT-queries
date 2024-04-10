; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75584 () Bool)

(assert start!75584)

(declare-fun b!888949 () Bool)

(declare-fun b_free!15597 () Bool)

(declare-fun b_next!15597 () Bool)

(assert (=> b!888949 (= b_free!15597 (not b_next!15597))))

(declare-fun tp!54748 () Bool)

(declare-fun b_and!25837 () Bool)

(assert (=> b!888949 (= tp!54748 b_and!25837)))

(declare-fun mapNonEmpty!28431 () Bool)

(declare-fun mapRes!28431 () Bool)

(declare-fun tp!54749 () Bool)

(declare-fun e!495431 () Bool)

(assert (=> mapNonEmpty!28431 (= mapRes!28431 (and tp!54749 e!495431))))

(declare-datatypes ((array!51824 0))(
  ( (array!51825 (arr!24921 (Array (_ BitVec 32) (_ BitVec 64))) (size!25363 (_ BitVec 32))) )
))
(declare-datatypes ((V!28865 0))(
  ( (V!28866 (val!9013 Int)) )
))
(declare-datatypes ((ValueCell!8481 0))(
  ( (ValueCellFull!8481 (v!11491 V!28865)) (EmptyCell!8481) )
))
(declare-datatypes ((array!51826 0))(
  ( (array!51827 (arr!24922 (Array (_ BitVec 32) ValueCell!8481)) (size!25364 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3978 0))(
  ( (LongMapFixedSize!3979 (defaultEntry!5186 Int) (mask!25620 (_ BitVec 32)) (extraKeys!4880 (_ BitVec 32)) (zeroValue!4984 V!28865) (minValue!4984 V!28865) (_size!2044 (_ BitVec 32)) (_keys!9867 array!51824) (_values!5171 array!51826) (_vacant!2044 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3978)

(declare-fun mapRest!28431 () (Array (_ BitVec 32) ValueCell!8481))

(declare-fun mapValue!28431 () ValueCell!8481)

(declare-fun mapKey!28431 () (_ BitVec 32))

(assert (=> mapNonEmpty!28431 (= (arr!24922 (_values!5171 thiss!1181)) (store mapRest!28431 mapKey!28431 mapValue!28431))))

(declare-fun b!888948 () Bool)

(declare-fun e!495427 () Bool)

(declare-fun e!495429 () Bool)

(assert (=> b!888948 (= e!495427 (and e!495429 mapRes!28431))))

(declare-fun condMapEmpty!28431 () Bool)

(declare-fun mapDefault!28431 () ValueCell!8481)

(assert (=> b!888948 (= condMapEmpty!28431 (= (arr!24922 (_values!5171 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8481)) mapDefault!28431)))))

(declare-fun e!495430 () Bool)

(declare-fun tp_is_empty!17925 () Bool)

(declare-fun array_inv!19612 (array!51824) Bool)

(declare-fun array_inv!19613 (array!51826) Bool)

(assert (=> b!888949 (= e!495430 (and tp!54748 tp_is_empty!17925 (array_inv!19612 (_keys!9867 thiss!1181)) (array_inv!19613 (_values!5171 thiss!1181)) e!495427))))

(declare-fun b!888950 () Bool)

(declare-fun res!602533 () Bool)

(declare-fun e!495426 () Bool)

(assert (=> b!888950 (=> (not res!602533) (not e!495426))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!888950 (= res!602533 (not (= key!785 (bvneg key!785))))))

(declare-fun b!888951 () Bool)

(assert (=> b!888951 (= e!495431 tp_is_empty!17925)))

(declare-fun mapIsEmpty!28431 () Bool)

(assert (=> mapIsEmpty!28431 mapRes!28431))

(declare-fun b!888952 () Bool)

(assert (=> b!888952 (= e!495429 tp_is_empty!17925)))

(declare-fun res!602534 () Bool)

(assert (=> start!75584 (=> (not res!602534) (not e!495426))))

(declare-fun valid!1552 (LongMapFixedSize!3978) Bool)

(assert (=> start!75584 (= res!602534 (valid!1552 thiss!1181))))

(assert (=> start!75584 e!495426))

(assert (=> start!75584 e!495430))

(assert (=> start!75584 true))

(declare-fun b!888953 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!888953 (= e!495426 (not (validMask!0 (mask!25620 thiss!1181))))))

(assert (= (and start!75584 res!602534) b!888950))

(assert (= (and b!888950 res!602533) b!888953))

(assert (= (and b!888948 condMapEmpty!28431) mapIsEmpty!28431))

(assert (= (and b!888948 (not condMapEmpty!28431)) mapNonEmpty!28431))

(get-info :version)

(assert (= (and mapNonEmpty!28431 ((_ is ValueCellFull!8481) mapValue!28431)) b!888951))

(assert (= (and b!888948 ((_ is ValueCellFull!8481) mapDefault!28431)) b!888952))

(assert (= b!888949 b!888948))

(assert (= start!75584 b!888949))

(declare-fun m!828101 () Bool)

(assert (=> mapNonEmpty!28431 m!828101))

(declare-fun m!828103 () Bool)

(assert (=> b!888949 m!828103))

(declare-fun m!828105 () Bool)

(assert (=> b!888949 m!828105))

(declare-fun m!828107 () Bool)

(assert (=> start!75584 m!828107))

(declare-fun m!828109 () Bool)

(assert (=> b!888953 m!828109))

(check-sat (not b_next!15597) (not start!75584) (not mapNonEmpty!28431) b_and!25837 (not b!888953) tp_is_empty!17925 (not b!888949))
(check-sat b_and!25837 (not b_next!15597))
(get-model)

(declare-fun d!110119 () Bool)

(declare-fun res!602547 () Bool)

(declare-fun e!495452 () Bool)

(assert (=> d!110119 (=> (not res!602547) (not e!495452))))

(declare-fun simpleValid!292 (LongMapFixedSize!3978) Bool)

(assert (=> d!110119 (= res!602547 (simpleValid!292 thiss!1181))))

(assert (=> d!110119 (= (valid!1552 thiss!1181) e!495452)))

(declare-fun b!888978 () Bool)

(declare-fun res!602548 () Bool)

(assert (=> b!888978 (=> (not res!602548) (not e!495452))))

(declare-fun arrayCountValidKeys!0 (array!51824 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888978 (= res!602548 (= (arrayCountValidKeys!0 (_keys!9867 thiss!1181) #b00000000000000000000000000000000 (size!25363 (_keys!9867 thiss!1181))) (_size!2044 thiss!1181)))))

(declare-fun b!888979 () Bool)

(declare-fun res!602549 () Bool)

(assert (=> b!888979 (=> (not res!602549) (not e!495452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51824 (_ BitVec 32)) Bool)

(assert (=> b!888979 (= res!602549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9867 thiss!1181) (mask!25620 thiss!1181)))))

(declare-fun b!888980 () Bool)

(declare-datatypes ((List!17696 0))(
  ( (Nil!17693) (Cons!17692 (h!18823 (_ BitVec 64)) (t!24995 List!17696)) )
))
(declare-fun arrayNoDuplicates!0 (array!51824 (_ BitVec 32) List!17696) Bool)

(assert (=> b!888980 (= e!495452 (arrayNoDuplicates!0 (_keys!9867 thiss!1181) #b00000000000000000000000000000000 Nil!17693))))

(assert (= (and d!110119 res!602547) b!888978))

(assert (= (and b!888978 res!602548) b!888979))

(assert (= (and b!888979 res!602549) b!888980))

(declare-fun m!828121 () Bool)

(assert (=> d!110119 m!828121))

(declare-fun m!828123 () Bool)

(assert (=> b!888978 m!828123))

(declare-fun m!828125 () Bool)

(assert (=> b!888979 m!828125))

(declare-fun m!828127 () Bool)

(assert (=> b!888980 m!828127))

(assert (=> start!75584 d!110119))

(declare-fun d!110121 () Bool)

(assert (=> d!110121 (= (array_inv!19612 (_keys!9867 thiss!1181)) (bvsge (size!25363 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888949 d!110121))

(declare-fun d!110123 () Bool)

(assert (=> d!110123 (= (array_inv!19613 (_values!5171 thiss!1181)) (bvsge (size!25364 (_values!5171 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888949 d!110123))

(declare-fun d!110125 () Bool)

(assert (=> d!110125 (= (validMask!0 (mask!25620 thiss!1181)) (and (or (= (mask!25620 thiss!1181) #b00000000000000000000000000000111) (= (mask!25620 thiss!1181) #b00000000000000000000000000001111) (= (mask!25620 thiss!1181) #b00000000000000000000000000011111) (= (mask!25620 thiss!1181) #b00000000000000000000000000111111) (= (mask!25620 thiss!1181) #b00000000000000000000000001111111) (= (mask!25620 thiss!1181) #b00000000000000000000000011111111) (= (mask!25620 thiss!1181) #b00000000000000000000000111111111) (= (mask!25620 thiss!1181) #b00000000000000000000001111111111) (= (mask!25620 thiss!1181) #b00000000000000000000011111111111) (= (mask!25620 thiss!1181) #b00000000000000000000111111111111) (= (mask!25620 thiss!1181) #b00000000000000000001111111111111) (= (mask!25620 thiss!1181) #b00000000000000000011111111111111) (= (mask!25620 thiss!1181) #b00000000000000000111111111111111) (= (mask!25620 thiss!1181) #b00000000000000001111111111111111) (= (mask!25620 thiss!1181) #b00000000000000011111111111111111) (= (mask!25620 thiss!1181) #b00000000000000111111111111111111) (= (mask!25620 thiss!1181) #b00000000000001111111111111111111) (= (mask!25620 thiss!1181) #b00000000000011111111111111111111) (= (mask!25620 thiss!1181) #b00000000000111111111111111111111) (= (mask!25620 thiss!1181) #b00000000001111111111111111111111) (= (mask!25620 thiss!1181) #b00000000011111111111111111111111) (= (mask!25620 thiss!1181) #b00000000111111111111111111111111) (= (mask!25620 thiss!1181) #b00000001111111111111111111111111) (= (mask!25620 thiss!1181) #b00000011111111111111111111111111) (= (mask!25620 thiss!1181) #b00000111111111111111111111111111) (= (mask!25620 thiss!1181) #b00001111111111111111111111111111) (= (mask!25620 thiss!1181) #b00011111111111111111111111111111) (= (mask!25620 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25620 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!888953 d!110125))

(declare-fun b!888988 () Bool)

(declare-fun e!495458 () Bool)

(assert (=> b!888988 (= e!495458 tp_is_empty!17925)))

(declare-fun condMapEmpty!28437 () Bool)

(declare-fun mapDefault!28437 () ValueCell!8481)

(assert (=> mapNonEmpty!28431 (= condMapEmpty!28437 (= mapRest!28431 ((as const (Array (_ BitVec 32) ValueCell!8481)) mapDefault!28437)))))

(declare-fun mapRes!28437 () Bool)

(assert (=> mapNonEmpty!28431 (= tp!54749 (and e!495458 mapRes!28437))))

(declare-fun b!888987 () Bool)

(declare-fun e!495457 () Bool)

(assert (=> b!888987 (= e!495457 tp_is_empty!17925)))

(declare-fun mapIsEmpty!28437 () Bool)

(assert (=> mapIsEmpty!28437 mapRes!28437))

(declare-fun mapNonEmpty!28437 () Bool)

(declare-fun tp!54758 () Bool)

(assert (=> mapNonEmpty!28437 (= mapRes!28437 (and tp!54758 e!495457))))

(declare-fun mapKey!28437 () (_ BitVec 32))

(declare-fun mapValue!28437 () ValueCell!8481)

(declare-fun mapRest!28437 () (Array (_ BitVec 32) ValueCell!8481))

(assert (=> mapNonEmpty!28437 (= mapRest!28431 (store mapRest!28437 mapKey!28437 mapValue!28437))))

(assert (= (and mapNonEmpty!28431 condMapEmpty!28437) mapIsEmpty!28437))

(assert (= (and mapNonEmpty!28431 (not condMapEmpty!28437)) mapNonEmpty!28437))

(assert (= (and mapNonEmpty!28437 ((_ is ValueCellFull!8481) mapValue!28437)) b!888987))

(assert (= (and mapNonEmpty!28431 ((_ is ValueCellFull!8481) mapDefault!28437)) b!888988))

(declare-fun m!828129 () Bool)

(assert (=> mapNonEmpty!28437 m!828129))

(check-sat (not b_next!15597) (not d!110119) (not b!888978) (not mapNonEmpty!28437) b_and!25837 tp_is_empty!17925 (not b!888979) (not b!888980))
(check-sat b_and!25837 (not b_next!15597))
(get-model)

(declare-fun b!888997 () Bool)

(declare-fun e!495465 () Bool)

(declare-fun call!39495 () Bool)

(assert (=> b!888997 (= e!495465 call!39495)))

(declare-fun b!888998 () Bool)

(declare-fun e!495467 () Bool)

(assert (=> b!888998 (= e!495467 call!39495)))

(declare-fun b!888999 () Bool)

(declare-fun e!495466 () Bool)

(assert (=> b!888999 (= e!495466 e!495465)))

(declare-fun c!93924 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!888999 (= c!93924 (validKeyInArray!0 (select (arr!24921 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889000 () Bool)

(assert (=> b!889000 (= e!495465 e!495467)))

(declare-fun lt!401975 () (_ BitVec 64))

(assert (=> b!889000 (= lt!401975 (select (arr!24921 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30278 0))(
  ( (Unit!30279) )
))
(declare-fun lt!401977 () Unit!30278)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51824 (_ BitVec 64) (_ BitVec 32)) Unit!30278)

(assert (=> b!889000 (= lt!401977 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9867 thiss!1181) lt!401975 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!889000 (arrayContainsKey!0 (_keys!9867 thiss!1181) lt!401975 #b00000000000000000000000000000000)))

(declare-fun lt!401976 () Unit!30278)

(assert (=> b!889000 (= lt!401976 lt!401977)))

(declare-fun res!602554 () Bool)

(declare-datatypes ((SeekEntryResult!8769 0))(
  ( (MissingZero!8769 (index!37447 (_ BitVec 32))) (Found!8769 (index!37448 (_ BitVec 32))) (Intermediate!8769 (undefined!9581 Bool) (index!37449 (_ BitVec 32)) (x!75451 (_ BitVec 32))) (Undefined!8769) (MissingVacant!8769 (index!37450 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51824 (_ BitVec 32)) SeekEntryResult!8769)

(assert (=> b!889000 (= res!602554 (= (seekEntryOrOpen!0 (select (arr!24921 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000) (_keys!9867 thiss!1181) (mask!25620 thiss!1181)) (Found!8769 #b00000000000000000000000000000000)))))

(assert (=> b!889000 (=> (not res!602554) (not e!495467))))

(declare-fun d!110127 () Bool)

(declare-fun res!602555 () Bool)

(assert (=> d!110127 (=> res!602555 e!495466)))

(assert (=> d!110127 (= res!602555 (bvsge #b00000000000000000000000000000000 (size!25363 (_keys!9867 thiss!1181))))))

(assert (=> d!110127 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9867 thiss!1181) (mask!25620 thiss!1181)) e!495466)))

(declare-fun bm!39492 () Bool)

(assert (=> bm!39492 (= call!39495 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9867 thiss!1181) (mask!25620 thiss!1181)))))

(assert (= (and d!110127 (not res!602555)) b!888999))

(assert (= (and b!888999 c!93924) b!889000))

(assert (= (and b!888999 (not c!93924)) b!888997))

(assert (= (and b!889000 res!602554) b!888998))

(assert (= (or b!888998 b!888997) bm!39492))

(declare-fun m!828131 () Bool)

(assert (=> b!888999 m!828131))

(assert (=> b!888999 m!828131))

(declare-fun m!828133 () Bool)

(assert (=> b!888999 m!828133))

(assert (=> b!889000 m!828131))

(declare-fun m!828135 () Bool)

(assert (=> b!889000 m!828135))

(declare-fun m!828137 () Bool)

(assert (=> b!889000 m!828137))

(assert (=> b!889000 m!828131))

(declare-fun m!828139 () Bool)

(assert (=> b!889000 m!828139))

(declare-fun m!828141 () Bool)

(assert (=> bm!39492 m!828141))

(assert (=> b!888979 d!110127))

(declare-fun b!889009 () Bool)

(declare-fun e!495472 () (_ BitVec 32))

(declare-fun e!495473 () (_ BitVec 32))

(assert (=> b!889009 (= e!495472 e!495473)))

(declare-fun c!93929 () Bool)

(assert (=> b!889009 (= c!93929 (validKeyInArray!0 (select (arr!24921 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889010 () Bool)

(declare-fun call!39498 () (_ BitVec 32))

(assert (=> b!889010 (= e!495473 (bvadd #b00000000000000000000000000000001 call!39498))))

(declare-fun d!110129 () Bool)

(declare-fun lt!401980 () (_ BitVec 32))

(assert (=> d!110129 (and (bvsge lt!401980 #b00000000000000000000000000000000) (bvsle lt!401980 (bvsub (size!25363 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110129 (= lt!401980 e!495472)))

(declare-fun c!93930 () Bool)

(assert (=> d!110129 (= c!93930 (bvsge #b00000000000000000000000000000000 (size!25363 (_keys!9867 thiss!1181))))))

(assert (=> d!110129 (and (bvsle #b00000000000000000000000000000000 (size!25363 (_keys!9867 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25363 (_keys!9867 thiss!1181)) (size!25363 (_keys!9867 thiss!1181))))))

(assert (=> d!110129 (= (arrayCountValidKeys!0 (_keys!9867 thiss!1181) #b00000000000000000000000000000000 (size!25363 (_keys!9867 thiss!1181))) lt!401980)))

(declare-fun b!889011 () Bool)

(assert (=> b!889011 (= e!495472 #b00000000000000000000000000000000)))

(declare-fun bm!39495 () Bool)

(assert (=> bm!39495 (= call!39498 (arrayCountValidKeys!0 (_keys!9867 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25363 (_keys!9867 thiss!1181))))))

(declare-fun b!889012 () Bool)

(assert (=> b!889012 (= e!495473 call!39498)))

(assert (= (and d!110129 c!93930) b!889011))

(assert (= (and d!110129 (not c!93930)) b!889009))

(assert (= (and b!889009 c!93929) b!889010))

(assert (= (and b!889009 (not c!93929)) b!889012))

(assert (= (or b!889010 b!889012) bm!39495))

(assert (=> b!889009 m!828131))

(assert (=> b!889009 m!828131))

(assert (=> b!889009 m!828133))

(declare-fun m!828143 () Bool)

(assert (=> bm!39495 m!828143))

(assert (=> b!888978 d!110129))

(declare-fun b!889022 () Bool)

(declare-fun res!602566 () Bool)

(declare-fun e!495476 () Bool)

(assert (=> b!889022 (=> (not res!602566) (not e!495476))))

(declare-fun size!25367 (LongMapFixedSize!3978) (_ BitVec 32))

(assert (=> b!889022 (= res!602566 (bvsge (size!25367 thiss!1181) (_size!2044 thiss!1181)))))

(declare-fun b!889023 () Bool)

(declare-fun res!602567 () Bool)

(assert (=> b!889023 (=> (not res!602567) (not e!495476))))

(assert (=> b!889023 (= res!602567 (= (size!25367 thiss!1181) (bvadd (_size!2044 thiss!1181) (bvsdiv (bvadd (extraKeys!4880 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!889024 () Bool)

(assert (=> b!889024 (= e!495476 (and (bvsge (extraKeys!4880 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4880 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2044 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!110131 () Bool)

(declare-fun res!602564 () Bool)

(assert (=> d!110131 (=> (not res!602564) (not e!495476))))

(assert (=> d!110131 (= res!602564 (validMask!0 (mask!25620 thiss!1181)))))

(assert (=> d!110131 (= (simpleValid!292 thiss!1181) e!495476)))

(declare-fun b!889021 () Bool)

(declare-fun res!602565 () Bool)

(assert (=> b!889021 (=> (not res!602565) (not e!495476))))

(assert (=> b!889021 (= res!602565 (and (= (size!25364 (_values!5171 thiss!1181)) (bvadd (mask!25620 thiss!1181) #b00000000000000000000000000000001)) (= (size!25363 (_keys!9867 thiss!1181)) (size!25364 (_values!5171 thiss!1181))) (bvsge (_size!2044 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2044 thiss!1181) (bvadd (mask!25620 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!110131 res!602564) b!889021))

(assert (= (and b!889021 res!602565) b!889022))

(assert (= (and b!889022 res!602566) b!889023))

(assert (= (and b!889023 res!602567) b!889024))

(declare-fun m!828145 () Bool)

(assert (=> b!889022 m!828145))

(assert (=> b!889023 m!828145))

(assert (=> d!110131 m!828109))

(assert (=> d!110119 d!110131))

(declare-fun b!889035 () Bool)

(declare-fun e!495486 () Bool)

(declare-fun call!39501 () Bool)

(assert (=> b!889035 (= e!495486 call!39501)))

(declare-fun b!889036 () Bool)

(declare-fun e!495488 () Bool)

(declare-fun e!495487 () Bool)

(assert (=> b!889036 (= e!495488 e!495487)))

(declare-fun res!602576 () Bool)

(assert (=> b!889036 (=> (not res!602576) (not e!495487))))

(declare-fun e!495485 () Bool)

(assert (=> b!889036 (= res!602576 (not e!495485))))

(declare-fun res!602574 () Bool)

(assert (=> b!889036 (=> (not res!602574) (not e!495485))))

(assert (=> b!889036 (= res!602574 (validKeyInArray!0 (select (arr!24921 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889037 () Bool)

(assert (=> b!889037 (= e!495486 call!39501)))

(declare-fun bm!39498 () Bool)

(declare-fun c!93933 () Bool)

(assert (=> bm!39498 (= call!39501 (arrayNoDuplicates!0 (_keys!9867 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93933 (Cons!17692 (select (arr!24921 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000) Nil!17693) Nil!17693)))))

(declare-fun b!889038 () Bool)

(assert (=> b!889038 (= e!495487 e!495486)))

(assert (=> b!889038 (= c!93933 (validKeyInArray!0 (select (arr!24921 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110133 () Bool)

(declare-fun res!602575 () Bool)

(assert (=> d!110133 (=> res!602575 e!495488)))

(assert (=> d!110133 (= res!602575 (bvsge #b00000000000000000000000000000000 (size!25363 (_keys!9867 thiss!1181))))))

(assert (=> d!110133 (= (arrayNoDuplicates!0 (_keys!9867 thiss!1181) #b00000000000000000000000000000000 Nil!17693) e!495488)))

(declare-fun b!889039 () Bool)

(declare-fun contains!4335 (List!17696 (_ BitVec 64)) Bool)

(assert (=> b!889039 (= e!495485 (contains!4335 Nil!17693 (select (arr!24921 (_keys!9867 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110133 (not res!602575)) b!889036))

(assert (= (and b!889036 res!602574) b!889039))

(assert (= (and b!889036 res!602576) b!889038))

(assert (= (and b!889038 c!93933) b!889035))

(assert (= (and b!889038 (not c!93933)) b!889037))

(assert (= (or b!889035 b!889037) bm!39498))

(assert (=> b!889036 m!828131))

(assert (=> b!889036 m!828131))

(assert (=> b!889036 m!828133))

(assert (=> bm!39498 m!828131))

(declare-fun m!828147 () Bool)

(assert (=> bm!39498 m!828147))

(assert (=> b!889038 m!828131))

(assert (=> b!889038 m!828131))

(assert (=> b!889038 m!828133))

(assert (=> b!889039 m!828131))

(assert (=> b!889039 m!828131))

(declare-fun m!828149 () Bool)

(assert (=> b!889039 m!828149))

(assert (=> b!888980 d!110133))

(declare-fun b!889041 () Bool)

(declare-fun e!495490 () Bool)

(assert (=> b!889041 (= e!495490 tp_is_empty!17925)))

(declare-fun condMapEmpty!28438 () Bool)

(declare-fun mapDefault!28438 () ValueCell!8481)

(assert (=> mapNonEmpty!28437 (= condMapEmpty!28438 (= mapRest!28437 ((as const (Array (_ BitVec 32) ValueCell!8481)) mapDefault!28438)))))

(declare-fun mapRes!28438 () Bool)

(assert (=> mapNonEmpty!28437 (= tp!54758 (and e!495490 mapRes!28438))))

(declare-fun b!889040 () Bool)

(declare-fun e!495489 () Bool)

(assert (=> b!889040 (= e!495489 tp_is_empty!17925)))

(declare-fun mapIsEmpty!28438 () Bool)

(assert (=> mapIsEmpty!28438 mapRes!28438))

(declare-fun mapNonEmpty!28438 () Bool)

(declare-fun tp!54759 () Bool)

(assert (=> mapNonEmpty!28438 (= mapRes!28438 (and tp!54759 e!495489))))

(declare-fun mapValue!28438 () ValueCell!8481)

(declare-fun mapKey!28438 () (_ BitVec 32))

(declare-fun mapRest!28438 () (Array (_ BitVec 32) ValueCell!8481))

(assert (=> mapNonEmpty!28438 (= mapRest!28437 (store mapRest!28438 mapKey!28438 mapValue!28438))))

(assert (= (and mapNonEmpty!28437 condMapEmpty!28438) mapIsEmpty!28438))

(assert (= (and mapNonEmpty!28437 (not condMapEmpty!28438)) mapNonEmpty!28438))

(assert (= (and mapNonEmpty!28438 ((_ is ValueCellFull!8481) mapValue!28438)) b!889040))

(assert (= (and mapNonEmpty!28437 ((_ is ValueCellFull!8481) mapDefault!28438)) b!889041))

(declare-fun m!828151 () Bool)

(assert (=> mapNonEmpty!28438 m!828151))

(check-sat (not bm!39492) (not b!889000) (not b!889039) (not b!889022) (not b!889009) (not b!888999) (not b!889036) b_and!25837 (not d!110131) tp_is_empty!17925 (not b!889038) (not mapNonEmpty!28438) (not b!889023) (not bm!39495) (not bm!39498) (not b_next!15597))
(check-sat b_and!25837 (not b_next!15597))
