; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15888 () Bool)

(assert start!15888)

(declare-fun b!158092 () Bool)

(declare-fun b_free!3471 () Bool)

(declare-fun b_next!3471 () Bool)

(assert (=> b!158092 (= b_free!3471 (not b_next!3471))))

(declare-fun tp!12959 () Bool)

(declare-fun b_and!9885 () Bool)

(assert (=> b!158092 (= tp!12959 b_and!9885)))

(declare-fun b!158086 () Bool)

(declare-fun e!103540 () Bool)

(declare-fun tp_is_empty!3273 () Bool)

(assert (=> b!158086 (= e!103540 tp_is_empty!3273)))

(declare-fun b!158087 () Bool)

(declare-fun e!103544 () Bool)

(declare-datatypes ((V!4011 0))(
  ( (V!4012 (val!1681 Int)) )
))
(declare-datatypes ((ValueCell!1293 0))(
  ( (ValueCellFull!1293 (v!3546 V!4011)) (EmptyCell!1293) )
))
(declare-datatypes ((array!5611 0))(
  ( (array!5612 (arr!2657 (Array (_ BitVec 32) (_ BitVec 64))) (size!2938 (_ BitVec 32))) )
))
(declare-datatypes ((array!5613 0))(
  ( (array!5614 (arr!2658 (Array (_ BitVec 32) ValueCell!1293)) (size!2939 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1494 0))(
  ( (LongMapFixedSize!1495 (defaultEntry!3189 Int) (mask!7692 (_ BitVec 32)) (extraKeys!2930 (_ BitVec 32)) (zeroValue!3032 V!4011) (minValue!3032 V!4011) (_size!796 (_ BitVec 32)) (_keys!4971 array!5611) (_values!3172 array!5613) (_vacant!796 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1494)

(assert (=> b!158087 (= e!103544 (and (= (size!2939 (_values!3172 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7692 thiss!1248))) (not (= (size!2938 (_keys!4971 thiss!1248)) (size!2939 (_values!3172 thiss!1248))))))))

(declare-fun b!158088 () Bool)

(declare-fun e!103545 () Bool)

(declare-fun mapRes!5573 () Bool)

(assert (=> b!158088 (= e!103545 (and e!103540 mapRes!5573))))

(declare-fun condMapEmpty!5573 () Bool)

(declare-fun mapDefault!5573 () ValueCell!1293)

(assert (=> b!158088 (= condMapEmpty!5573 (= (arr!2658 (_values!3172 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1293)) mapDefault!5573)))))

(declare-fun b!158089 () Bool)

(declare-fun res!74688 () Bool)

(assert (=> b!158089 (=> (not res!74688) (not e!103544))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!292 0))(
  ( (MissingZero!292 (index!3336 (_ BitVec 32))) (Found!292 (index!3337 (_ BitVec 32))) (Intermediate!292 (undefined!1104 Bool) (index!3338 (_ BitVec 32)) (x!17433 (_ BitVec 32))) (Undefined!292) (MissingVacant!292 (index!3339 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5611 (_ BitVec 32)) SeekEntryResult!292)

(assert (=> b!158089 (= res!74688 ((_ is Undefined!292) (seekEntryOrOpen!0 key!828 (_keys!4971 thiss!1248) (mask!7692 thiss!1248))))))

(declare-fun mapNonEmpty!5573 () Bool)

(declare-fun tp!12958 () Bool)

(declare-fun e!103543 () Bool)

(assert (=> mapNonEmpty!5573 (= mapRes!5573 (and tp!12958 e!103543))))

(declare-fun mapRest!5573 () (Array (_ BitVec 32) ValueCell!1293))

(declare-fun mapKey!5573 () (_ BitVec 32))

(declare-fun mapValue!5573 () ValueCell!1293)

(assert (=> mapNonEmpty!5573 (= (arr!2658 (_values!3172 thiss!1248)) (store mapRest!5573 mapKey!5573 mapValue!5573))))

(declare-fun b!158090 () Bool)

(declare-fun res!74687 () Bool)

(assert (=> b!158090 (=> (not res!74687) (not e!103544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158090 (= res!74687 (validMask!0 (mask!7692 thiss!1248)))))

(declare-fun b!158091 () Bool)

(assert (=> b!158091 (= e!103543 tp_is_empty!3273)))

(declare-fun e!103542 () Bool)

(declare-fun array_inv!1691 (array!5611) Bool)

(declare-fun array_inv!1692 (array!5613) Bool)

(assert (=> b!158092 (= e!103542 (and tp!12959 tp_is_empty!3273 (array_inv!1691 (_keys!4971 thiss!1248)) (array_inv!1692 (_values!3172 thiss!1248)) e!103545))))

(declare-fun b!158093 () Bool)

(declare-fun res!74689 () Bool)

(assert (=> b!158093 (=> (not res!74689) (not e!103544))))

(assert (=> b!158093 (= res!74689 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5573 () Bool)

(assert (=> mapIsEmpty!5573 mapRes!5573))

(declare-fun res!74690 () Bool)

(assert (=> start!15888 (=> (not res!74690) (not e!103544))))

(declare-fun valid!704 (LongMapFixedSize!1494) Bool)

(assert (=> start!15888 (= res!74690 (valid!704 thiss!1248))))

(assert (=> start!15888 e!103544))

(assert (=> start!15888 e!103542))

(assert (=> start!15888 true))

(assert (= (and start!15888 res!74690) b!158093))

(assert (= (and b!158093 res!74689) b!158089))

(assert (= (and b!158089 res!74688) b!158090))

(assert (= (and b!158090 res!74687) b!158087))

(assert (= (and b!158088 condMapEmpty!5573) mapIsEmpty!5573))

(assert (= (and b!158088 (not condMapEmpty!5573)) mapNonEmpty!5573))

(assert (= (and mapNonEmpty!5573 ((_ is ValueCellFull!1293) mapValue!5573)) b!158091))

(assert (= (and b!158088 ((_ is ValueCellFull!1293) mapDefault!5573)) b!158086))

(assert (= b!158092 b!158088))

(assert (= start!15888 b!158092))

(declare-fun m!190991 () Bool)

(assert (=> mapNonEmpty!5573 m!190991))

(declare-fun m!190993 () Bool)

(assert (=> b!158092 m!190993))

(declare-fun m!190995 () Bool)

(assert (=> b!158092 m!190995))

(declare-fun m!190997 () Bool)

(assert (=> b!158090 m!190997))

(declare-fun m!190999 () Bool)

(assert (=> start!15888 m!190999))

(declare-fun m!191001 () Bool)

(assert (=> b!158089 m!191001))

(check-sat tp_is_empty!3273 (not b!158090) (not b_next!3471) (not b!158092) (not mapNonEmpty!5573) (not start!15888) (not b!158089) b_and!9885)
(check-sat b_and!9885 (not b_next!3471))
(get-model)

(declare-fun d!51135 () Bool)

(assert (=> d!51135 (= (validMask!0 (mask!7692 thiss!1248)) (and (or (= (mask!7692 thiss!1248) #b00000000000000000000000000000111) (= (mask!7692 thiss!1248) #b00000000000000000000000000001111) (= (mask!7692 thiss!1248) #b00000000000000000000000000011111) (= (mask!7692 thiss!1248) #b00000000000000000000000000111111) (= (mask!7692 thiss!1248) #b00000000000000000000000001111111) (= (mask!7692 thiss!1248) #b00000000000000000000000011111111) (= (mask!7692 thiss!1248) #b00000000000000000000000111111111) (= (mask!7692 thiss!1248) #b00000000000000000000001111111111) (= (mask!7692 thiss!1248) #b00000000000000000000011111111111) (= (mask!7692 thiss!1248) #b00000000000000000000111111111111) (= (mask!7692 thiss!1248) #b00000000000000000001111111111111) (= (mask!7692 thiss!1248) #b00000000000000000011111111111111) (= (mask!7692 thiss!1248) #b00000000000000000111111111111111) (= (mask!7692 thiss!1248) #b00000000000000001111111111111111) (= (mask!7692 thiss!1248) #b00000000000000011111111111111111) (= (mask!7692 thiss!1248) #b00000000000000111111111111111111) (= (mask!7692 thiss!1248) #b00000000000001111111111111111111) (= (mask!7692 thiss!1248) #b00000000000011111111111111111111) (= (mask!7692 thiss!1248) #b00000000000111111111111111111111) (= (mask!7692 thiss!1248) #b00000000001111111111111111111111) (= (mask!7692 thiss!1248) #b00000000011111111111111111111111) (= (mask!7692 thiss!1248) #b00000000111111111111111111111111) (= (mask!7692 thiss!1248) #b00000001111111111111111111111111) (= (mask!7692 thiss!1248) #b00000011111111111111111111111111) (= (mask!7692 thiss!1248) #b00000111111111111111111111111111) (= (mask!7692 thiss!1248) #b00001111111111111111111111111111) (= (mask!7692 thiss!1248) #b00011111111111111111111111111111) (= (mask!7692 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7692 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158090 d!51135))

(declare-fun b!158130 () Bool)

(declare-fun e!103570 () SeekEntryResult!292)

(declare-fun e!103571 () SeekEntryResult!292)

(assert (=> b!158130 (= e!103570 e!103571)))

(declare-fun lt!81803 () (_ BitVec 64))

(declare-fun lt!81804 () SeekEntryResult!292)

(assert (=> b!158130 (= lt!81803 (select (arr!2657 (_keys!4971 thiss!1248)) (index!3338 lt!81804)))))

(declare-fun c!29773 () Bool)

(assert (=> b!158130 (= c!29773 (= lt!81803 key!828))))

(declare-fun b!158131 () Bool)

(assert (=> b!158131 (= e!103571 (Found!292 (index!3338 lt!81804)))))

(declare-fun e!103572 () SeekEntryResult!292)

(declare-fun b!158132 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5611 (_ BitVec 32)) SeekEntryResult!292)

(assert (=> b!158132 (= e!103572 (seekKeyOrZeroReturnVacant!0 (x!17433 lt!81804) (index!3338 lt!81804) (index!3338 lt!81804) key!828 (_keys!4971 thiss!1248) (mask!7692 thiss!1248)))))

(declare-fun b!158134 () Bool)

(declare-fun c!29771 () Bool)

(assert (=> b!158134 (= c!29771 (= lt!81803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158134 (= e!103571 e!103572)))

(declare-fun b!158135 () Bool)

(assert (=> b!158135 (= e!103572 (MissingZero!292 (index!3338 lt!81804)))))

(declare-fun d!51137 () Bool)

(declare-fun lt!81805 () SeekEntryResult!292)

(assert (=> d!51137 (and (or ((_ is Undefined!292) lt!81805) (not ((_ is Found!292) lt!81805)) (and (bvsge (index!3337 lt!81805) #b00000000000000000000000000000000) (bvslt (index!3337 lt!81805) (size!2938 (_keys!4971 thiss!1248))))) (or ((_ is Undefined!292) lt!81805) ((_ is Found!292) lt!81805) (not ((_ is MissingZero!292) lt!81805)) (and (bvsge (index!3336 lt!81805) #b00000000000000000000000000000000) (bvslt (index!3336 lt!81805) (size!2938 (_keys!4971 thiss!1248))))) (or ((_ is Undefined!292) lt!81805) ((_ is Found!292) lt!81805) ((_ is MissingZero!292) lt!81805) (not ((_ is MissingVacant!292) lt!81805)) (and (bvsge (index!3339 lt!81805) #b00000000000000000000000000000000) (bvslt (index!3339 lt!81805) (size!2938 (_keys!4971 thiss!1248))))) (or ((_ is Undefined!292) lt!81805) (ite ((_ is Found!292) lt!81805) (= (select (arr!2657 (_keys!4971 thiss!1248)) (index!3337 lt!81805)) key!828) (ite ((_ is MissingZero!292) lt!81805) (= (select (arr!2657 (_keys!4971 thiss!1248)) (index!3336 lt!81805)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!292) lt!81805) (= (select (arr!2657 (_keys!4971 thiss!1248)) (index!3339 lt!81805)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51137 (= lt!81805 e!103570)))

(declare-fun c!29772 () Bool)

(assert (=> d!51137 (= c!29772 (and ((_ is Intermediate!292) lt!81804) (undefined!1104 lt!81804)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5611 (_ BitVec 32)) SeekEntryResult!292)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51137 (= lt!81804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7692 thiss!1248)) key!828 (_keys!4971 thiss!1248) (mask!7692 thiss!1248)))))

(assert (=> d!51137 (validMask!0 (mask!7692 thiss!1248))))

(assert (=> d!51137 (= (seekEntryOrOpen!0 key!828 (_keys!4971 thiss!1248) (mask!7692 thiss!1248)) lt!81805)))

(declare-fun b!158133 () Bool)

(assert (=> b!158133 (= e!103570 Undefined!292)))

(assert (= (and d!51137 c!29772) b!158133))

(assert (= (and d!51137 (not c!29772)) b!158130))

(assert (= (and b!158130 c!29773) b!158131))

(assert (= (and b!158130 (not c!29773)) b!158134))

(assert (= (and b!158134 c!29771) b!158135))

(assert (= (and b!158134 (not c!29771)) b!158132))

(declare-fun m!191015 () Bool)

(assert (=> b!158130 m!191015))

(declare-fun m!191017 () Bool)

(assert (=> b!158132 m!191017))

(declare-fun m!191019 () Bool)

(assert (=> d!51137 m!191019))

(declare-fun m!191021 () Bool)

(assert (=> d!51137 m!191021))

(declare-fun m!191023 () Bool)

(assert (=> d!51137 m!191023))

(assert (=> d!51137 m!190997))

(declare-fun m!191025 () Bool)

(assert (=> d!51137 m!191025))

(assert (=> d!51137 m!191019))

(declare-fun m!191027 () Bool)

(assert (=> d!51137 m!191027))

(assert (=> b!158089 d!51137))

(declare-fun d!51139 () Bool)

(assert (=> d!51139 (= (array_inv!1691 (_keys!4971 thiss!1248)) (bvsge (size!2938 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158092 d!51139))

(declare-fun d!51141 () Bool)

(assert (=> d!51141 (= (array_inv!1692 (_values!3172 thiss!1248)) (bvsge (size!2939 (_values!3172 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158092 d!51141))

(declare-fun d!51143 () Bool)

(declare-fun res!74709 () Bool)

(declare-fun e!103575 () Bool)

(assert (=> d!51143 (=> (not res!74709) (not e!103575))))

(declare-fun simpleValid!111 (LongMapFixedSize!1494) Bool)

(assert (=> d!51143 (= res!74709 (simpleValid!111 thiss!1248))))

(assert (=> d!51143 (= (valid!704 thiss!1248) e!103575)))

(declare-fun b!158142 () Bool)

(declare-fun res!74710 () Bool)

(assert (=> b!158142 (=> (not res!74710) (not e!103575))))

(declare-fun arrayCountValidKeys!0 (array!5611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158142 (= res!74710 (= (arrayCountValidKeys!0 (_keys!4971 thiss!1248) #b00000000000000000000000000000000 (size!2938 (_keys!4971 thiss!1248))) (_size!796 thiss!1248)))))

(declare-fun b!158143 () Bool)

(declare-fun res!74711 () Bool)

(assert (=> b!158143 (=> (not res!74711) (not e!103575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5611 (_ BitVec 32)) Bool)

(assert (=> b!158143 (= res!74711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4971 thiss!1248) (mask!7692 thiss!1248)))))

(declare-fun b!158144 () Bool)

(declare-datatypes ((List!1888 0))(
  ( (Nil!1885) (Cons!1884 (h!2494 (_ BitVec 64)) (t!6690 List!1888)) )
))
(declare-fun arrayNoDuplicates!0 (array!5611 (_ BitVec 32) List!1888) Bool)

(assert (=> b!158144 (= e!103575 (arrayNoDuplicates!0 (_keys!4971 thiss!1248) #b00000000000000000000000000000000 Nil!1885))))

(assert (= (and d!51143 res!74709) b!158142))

(assert (= (and b!158142 res!74710) b!158143))

(assert (= (and b!158143 res!74711) b!158144))

(declare-fun m!191029 () Bool)

(assert (=> d!51143 m!191029))

(declare-fun m!191031 () Bool)

(assert (=> b!158142 m!191031))

(declare-fun m!191033 () Bool)

(assert (=> b!158143 m!191033))

(declare-fun m!191035 () Bool)

(assert (=> b!158144 m!191035))

(assert (=> start!15888 d!51143))

(declare-fun condMapEmpty!5579 () Bool)

(declare-fun mapDefault!5579 () ValueCell!1293)

(assert (=> mapNonEmpty!5573 (= condMapEmpty!5579 (= mapRest!5573 ((as const (Array (_ BitVec 32) ValueCell!1293)) mapDefault!5579)))))

(declare-fun e!103580 () Bool)

(declare-fun mapRes!5579 () Bool)

(assert (=> mapNonEmpty!5573 (= tp!12958 (and e!103580 mapRes!5579))))

(declare-fun mapNonEmpty!5579 () Bool)

(declare-fun tp!12968 () Bool)

(declare-fun e!103581 () Bool)

(assert (=> mapNonEmpty!5579 (= mapRes!5579 (and tp!12968 e!103581))))

(declare-fun mapRest!5579 () (Array (_ BitVec 32) ValueCell!1293))

(declare-fun mapValue!5579 () ValueCell!1293)

(declare-fun mapKey!5579 () (_ BitVec 32))

(assert (=> mapNonEmpty!5579 (= mapRest!5573 (store mapRest!5579 mapKey!5579 mapValue!5579))))

(declare-fun b!158151 () Bool)

(assert (=> b!158151 (= e!103581 tp_is_empty!3273)))

(declare-fun b!158152 () Bool)

(assert (=> b!158152 (= e!103580 tp_is_empty!3273)))

(declare-fun mapIsEmpty!5579 () Bool)

(assert (=> mapIsEmpty!5579 mapRes!5579))

(assert (= (and mapNonEmpty!5573 condMapEmpty!5579) mapIsEmpty!5579))

(assert (= (and mapNonEmpty!5573 (not condMapEmpty!5579)) mapNonEmpty!5579))

(assert (= (and mapNonEmpty!5579 ((_ is ValueCellFull!1293) mapValue!5579)) b!158151))

(assert (= (and mapNonEmpty!5573 ((_ is ValueCellFull!1293) mapDefault!5579)) b!158152))

(declare-fun m!191037 () Bool)

(assert (=> mapNonEmpty!5579 m!191037))

(check-sat (not d!51137) tp_is_empty!3273 (not b!158144) (not b_next!3471) (not d!51143) b_and!9885 (not b!158143) (not b!158142) (not mapNonEmpty!5579) (not b!158132))
(check-sat b_and!9885 (not b_next!3471))
(get-model)

(declare-fun d!51145 () Bool)

(declare-fun res!74723 () Bool)

(declare-fun e!103584 () Bool)

(assert (=> d!51145 (=> (not res!74723) (not e!103584))))

(assert (=> d!51145 (= res!74723 (validMask!0 (mask!7692 thiss!1248)))))

(assert (=> d!51145 (= (simpleValid!111 thiss!1248) e!103584)))

(declare-fun b!158161 () Bool)

(declare-fun res!74720 () Bool)

(assert (=> b!158161 (=> (not res!74720) (not e!103584))))

(assert (=> b!158161 (= res!74720 (and (= (size!2939 (_values!3172 thiss!1248)) (bvadd (mask!7692 thiss!1248) #b00000000000000000000000000000001)) (= (size!2938 (_keys!4971 thiss!1248)) (size!2939 (_values!3172 thiss!1248))) (bvsge (_size!796 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!796 thiss!1248) (bvadd (mask!7692 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!158162 () Bool)

(declare-fun res!74721 () Bool)

(assert (=> b!158162 (=> (not res!74721) (not e!103584))))

(declare-fun size!2942 (LongMapFixedSize!1494) (_ BitVec 32))

(assert (=> b!158162 (= res!74721 (bvsge (size!2942 thiss!1248) (_size!796 thiss!1248)))))

(declare-fun b!158164 () Bool)

(assert (=> b!158164 (= e!103584 (and (bvsge (extraKeys!2930 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2930 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!796 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158163 () Bool)

(declare-fun res!74722 () Bool)

(assert (=> b!158163 (=> (not res!74722) (not e!103584))))

(assert (=> b!158163 (= res!74722 (= (size!2942 thiss!1248) (bvadd (_size!796 thiss!1248) (bvsdiv (bvadd (extraKeys!2930 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!51145 res!74723) b!158161))

(assert (= (and b!158161 res!74720) b!158162))

(assert (= (and b!158162 res!74721) b!158163))

(assert (= (and b!158163 res!74722) b!158164))

(assert (=> d!51145 m!190997))

(declare-fun m!191039 () Bool)

(assert (=> b!158162 m!191039))

(assert (=> b!158163 m!191039))

(assert (=> d!51143 d!51145))

(declare-fun d!51147 () Bool)

(declare-fun lt!81808 () (_ BitVec 32))

(assert (=> d!51147 (and (bvsge lt!81808 #b00000000000000000000000000000000) (bvsle lt!81808 (bvsub (size!2938 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103590 () (_ BitVec 32))

(assert (=> d!51147 (= lt!81808 e!103590)))

(declare-fun c!29778 () Bool)

(assert (=> d!51147 (= c!29778 (bvsge #b00000000000000000000000000000000 (size!2938 (_keys!4971 thiss!1248))))))

(assert (=> d!51147 (and (bvsle #b00000000000000000000000000000000 (size!2938 (_keys!4971 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2938 (_keys!4971 thiss!1248)) (size!2938 (_keys!4971 thiss!1248))))))

(assert (=> d!51147 (= (arrayCountValidKeys!0 (_keys!4971 thiss!1248) #b00000000000000000000000000000000 (size!2938 (_keys!4971 thiss!1248))) lt!81808)))

(declare-fun bm!17242 () Bool)

(declare-fun call!17245 () (_ BitVec 32))

(assert (=> bm!17242 (= call!17245 (arrayCountValidKeys!0 (_keys!4971 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2938 (_keys!4971 thiss!1248))))))

(declare-fun b!158173 () Bool)

(declare-fun e!103589 () (_ BitVec 32))

(assert (=> b!158173 (= e!103590 e!103589)))

(declare-fun c!29779 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158173 (= c!29779 (validKeyInArray!0 (select (arr!2657 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158174 () Bool)

(assert (=> b!158174 (= e!103589 call!17245)))

(declare-fun b!158175 () Bool)

(assert (=> b!158175 (= e!103590 #b00000000000000000000000000000000)))

(declare-fun b!158176 () Bool)

(assert (=> b!158176 (= e!103589 (bvadd #b00000000000000000000000000000001 call!17245))))

(assert (= (and d!51147 c!29778) b!158175))

(assert (= (and d!51147 (not c!29778)) b!158173))

(assert (= (and b!158173 c!29779) b!158176))

(assert (= (and b!158173 (not c!29779)) b!158174))

(assert (= (or b!158176 b!158174) bm!17242))

(declare-fun m!191041 () Bool)

(assert (=> bm!17242 m!191041))

(declare-fun m!191043 () Bool)

(assert (=> b!158173 m!191043))

(assert (=> b!158173 m!191043))

(declare-fun m!191045 () Bool)

(assert (=> b!158173 m!191045))

(assert (=> b!158142 d!51147))

(declare-fun b!158188 () Bool)

(declare-fun e!103600 () Bool)

(declare-fun contains!980 (List!1888 (_ BitVec 64)) Bool)

(assert (=> b!158188 (= e!103600 (contains!980 Nil!1885 (select (arr!2657 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158189 () Bool)

(declare-fun e!103599 () Bool)

(declare-fun call!17248 () Bool)

(assert (=> b!158189 (= e!103599 call!17248)))

(declare-fun b!158190 () Bool)

(declare-fun e!103602 () Bool)

(assert (=> b!158190 (= e!103602 e!103599)))

(declare-fun c!29782 () Bool)

(assert (=> b!158190 (= c!29782 (validKeyInArray!0 (select (arr!2657 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158191 () Bool)

(declare-fun e!103601 () Bool)

(assert (=> b!158191 (= e!103601 e!103602)))

(declare-fun res!74730 () Bool)

(assert (=> b!158191 (=> (not res!74730) (not e!103602))))

(assert (=> b!158191 (= res!74730 (not e!103600))))

(declare-fun res!74732 () Bool)

(assert (=> b!158191 (=> (not res!74732) (not e!103600))))

(assert (=> b!158191 (= res!74732 (validKeyInArray!0 (select (arr!2657 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17245 () Bool)

(assert (=> bm!17245 (= call!17248 (arrayNoDuplicates!0 (_keys!4971 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29782 (Cons!1884 (select (arr!2657 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000) Nil!1885) Nil!1885)))))

(declare-fun b!158187 () Bool)

(assert (=> b!158187 (= e!103599 call!17248)))

(declare-fun d!51149 () Bool)

(declare-fun res!74731 () Bool)

(assert (=> d!51149 (=> res!74731 e!103601)))

(assert (=> d!51149 (= res!74731 (bvsge #b00000000000000000000000000000000 (size!2938 (_keys!4971 thiss!1248))))))

(assert (=> d!51149 (= (arrayNoDuplicates!0 (_keys!4971 thiss!1248) #b00000000000000000000000000000000 Nil!1885) e!103601)))

(assert (= (and d!51149 (not res!74731)) b!158191))

(assert (= (and b!158191 res!74732) b!158188))

(assert (= (and b!158191 res!74730) b!158190))

(assert (= (and b!158190 c!29782) b!158189))

(assert (= (and b!158190 (not c!29782)) b!158187))

(assert (= (or b!158189 b!158187) bm!17245))

(assert (=> b!158188 m!191043))

(assert (=> b!158188 m!191043))

(declare-fun m!191047 () Bool)

(assert (=> b!158188 m!191047))

(assert (=> b!158190 m!191043))

(assert (=> b!158190 m!191043))

(assert (=> b!158190 m!191045))

(assert (=> b!158191 m!191043))

(assert (=> b!158191 m!191043))

(assert (=> b!158191 m!191045))

(assert (=> bm!17245 m!191043))

(declare-fun m!191049 () Bool)

(assert (=> bm!17245 m!191049))

(assert (=> b!158144 d!51149))

(declare-fun b!158204 () Bool)

(declare-fun c!29791 () Bool)

(declare-fun lt!81814 () (_ BitVec 64))

(assert (=> b!158204 (= c!29791 (= lt!81814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103609 () SeekEntryResult!292)

(declare-fun e!103610 () SeekEntryResult!292)

(assert (=> b!158204 (= e!103609 e!103610)))

(declare-fun b!158205 () Bool)

(assert (=> b!158205 (= e!103610 (MissingVacant!292 (index!3338 lt!81804)))))

(declare-fun b!158207 () Bool)

(declare-fun e!103611 () SeekEntryResult!292)

(assert (=> b!158207 (= e!103611 Undefined!292)))

(declare-fun b!158208 () Bool)

(assert (=> b!158208 (= e!103609 (Found!292 (index!3338 lt!81804)))))

(declare-fun b!158209 () Bool)

(assert (=> b!158209 (= e!103611 e!103609)))

(declare-fun c!29789 () Bool)

(assert (=> b!158209 (= c!29789 (= lt!81814 key!828))))

(declare-fun b!158206 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158206 (= e!103610 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17433 lt!81804) #b00000000000000000000000000000001) (nextIndex!0 (index!3338 lt!81804) (x!17433 lt!81804) (mask!7692 thiss!1248)) (index!3338 lt!81804) key!828 (_keys!4971 thiss!1248) (mask!7692 thiss!1248)))))

(declare-fun lt!81813 () SeekEntryResult!292)

(declare-fun d!51151 () Bool)

(assert (=> d!51151 (and (or ((_ is Undefined!292) lt!81813) (not ((_ is Found!292) lt!81813)) (and (bvsge (index!3337 lt!81813) #b00000000000000000000000000000000) (bvslt (index!3337 lt!81813) (size!2938 (_keys!4971 thiss!1248))))) (or ((_ is Undefined!292) lt!81813) ((_ is Found!292) lt!81813) (not ((_ is MissingVacant!292) lt!81813)) (not (= (index!3339 lt!81813) (index!3338 lt!81804))) (and (bvsge (index!3339 lt!81813) #b00000000000000000000000000000000) (bvslt (index!3339 lt!81813) (size!2938 (_keys!4971 thiss!1248))))) (or ((_ is Undefined!292) lt!81813) (ite ((_ is Found!292) lt!81813) (= (select (arr!2657 (_keys!4971 thiss!1248)) (index!3337 lt!81813)) key!828) (and ((_ is MissingVacant!292) lt!81813) (= (index!3339 lt!81813) (index!3338 lt!81804)) (= (select (arr!2657 (_keys!4971 thiss!1248)) (index!3339 lt!81813)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51151 (= lt!81813 e!103611)))

(declare-fun c!29790 () Bool)

(assert (=> d!51151 (= c!29790 (bvsge (x!17433 lt!81804) #b01111111111111111111111111111110))))

(assert (=> d!51151 (= lt!81814 (select (arr!2657 (_keys!4971 thiss!1248)) (index!3338 lt!81804)))))

(assert (=> d!51151 (validMask!0 (mask!7692 thiss!1248))))

(assert (=> d!51151 (= (seekKeyOrZeroReturnVacant!0 (x!17433 lt!81804) (index!3338 lt!81804) (index!3338 lt!81804) key!828 (_keys!4971 thiss!1248) (mask!7692 thiss!1248)) lt!81813)))

(assert (= (and d!51151 c!29790) b!158207))

(assert (= (and d!51151 (not c!29790)) b!158209))

(assert (= (and b!158209 c!29789) b!158208))

(assert (= (and b!158209 (not c!29789)) b!158204))

(assert (= (and b!158204 c!29791) b!158205))

(assert (= (and b!158204 (not c!29791)) b!158206))

(declare-fun m!191051 () Bool)

(assert (=> b!158206 m!191051))

(assert (=> b!158206 m!191051))

(declare-fun m!191053 () Bool)

(assert (=> b!158206 m!191053))

(declare-fun m!191055 () Bool)

(assert (=> d!51151 m!191055))

(declare-fun m!191057 () Bool)

(assert (=> d!51151 m!191057))

(assert (=> d!51151 m!191015))

(assert (=> d!51151 m!190997))

(assert (=> b!158132 d!51151))

(declare-fun b!158228 () Bool)

(declare-fun e!103626 () SeekEntryResult!292)

(declare-fun e!103624 () SeekEntryResult!292)

(assert (=> b!158228 (= e!103626 e!103624)))

(declare-fun c!29798 () Bool)

(declare-fun lt!81820 () (_ BitVec 64))

(assert (=> b!158228 (= c!29798 (or (= lt!81820 key!828) (= (bvadd lt!81820 lt!81820) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158229 () Bool)

(declare-fun lt!81819 () SeekEntryResult!292)

(assert (=> b!158229 (and (bvsge (index!3338 lt!81819) #b00000000000000000000000000000000) (bvslt (index!3338 lt!81819) (size!2938 (_keys!4971 thiss!1248))))))

(declare-fun e!103623 () Bool)

(assert (=> b!158229 (= e!103623 (= (select (arr!2657 (_keys!4971 thiss!1248)) (index!3338 lt!81819)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158230 () Bool)

(assert (=> b!158230 (and (bvsge (index!3338 lt!81819) #b00000000000000000000000000000000) (bvslt (index!3338 lt!81819) (size!2938 (_keys!4971 thiss!1248))))))

(declare-fun res!74739 () Bool)

(assert (=> b!158230 (= res!74739 (= (select (arr!2657 (_keys!4971 thiss!1248)) (index!3338 lt!81819)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158230 (=> res!74739 e!103623)))

(declare-fun b!158231 () Bool)

(assert (=> b!158231 (= e!103624 (Intermediate!292 false (toIndex!0 key!828 (mask!7692 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158232 () Bool)

(assert (=> b!158232 (= e!103624 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7692 thiss!1248)) #b00000000000000000000000000000000 (mask!7692 thiss!1248)) key!828 (_keys!4971 thiss!1248) (mask!7692 thiss!1248)))))

(declare-fun b!158233 () Bool)

(declare-fun e!103625 () Bool)

(declare-fun e!103622 () Bool)

(assert (=> b!158233 (= e!103625 e!103622)))

(declare-fun res!74740 () Bool)

(assert (=> b!158233 (= res!74740 (and ((_ is Intermediate!292) lt!81819) (not (undefined!1104 lt!81819)) (bvslt (x!17433 lt!81819) #b01111111111111111111111111111110) (bvsge (x!17433 lt!81819) #b00000000000000000000000000000000) (bvsge (x!17433 lt!81819) #b00000000000000000000000000000000)))))

(assert (=> b!158233 (=> (not res!74740) (not e!103622))))

(declare-fun b!158234 () Bool)

(assert (=> b!158234 (= e!103626 (Intermediate!292 true (toIndex!0 key!828 (mask!7692 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158235 () Bool)

(assert (=> b!158235 (and (bvsge (index!3338 lt!81819) #b00000000000000000000000000000000) (bvslt (index!3338 lt!81819) (size!2938 (_keys!4971 thiss!1248))))))

(declare-fun res!74741 () Bool)

(assert (=> b!158235 (= res!74741 (= (select (arr!2657 (_keys!4971 thiss!1248)) (index!3338 lt!81819)) key!828))))

(assert (=> b!158235 (=> res!74741 e!103623)))

(assert (=> b!158235 (= e!103622 e!103623)))

(declare-fun b!158236 () Bool)

(assert (=> b!158236 (= e!103625 (bvsge (x!17433 lt!81819) #b01111111111111111111111111111110))))

(declare-fun d!51153 () Bool)

(assert (=> d!51153 e!103625))

(declare-fun c!29799 () Bool)

(assert (=> d!51153 (= c!29799 (and ((_ is Intermediate!292) lt!81819) (undefined!1104 lt!81819)))))

(assert (=> d!51153 (= lt!81819 e!103626)))

(declare-fun c!29800 () Bool)

(assert (=> d!51153 (= c!29800 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51153 (= lt!81820 (select (arr!2657 (_keys!4971 thiss!1248)) (toIndex!0 key!828 (mask!7692 thiss!1248))))))

(assert (=> d!51153 (validMask!0 (mask!7692 thiss!1248))))

(assert (=> d!51153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7692 thiss!1248)) key!828 (_keys!4971 thiss!1248) (mask!7692 thiss!1248)) lt!81819)))

(assert (= (and d!51153 c!29800) b!158234))

(assert (= (and d!51153 (not c!29800)) b!158228))

(assert (= (and b!158228 c!29798) b!158231))

(assert (= (and b!158228 (not c!29798)) b!158232))

(assert (= (and d!51153 c!29799) b!158236))

(assert (= (and d!51153 (not c!29799)) b!158233))

(assert (= (and b!158233 res!74740) b!158235))

(assert (= (and b!158235 (not res!74741)) b!158230))

(assert (= (and b!158230 (not res!74739)) b!158229))

(declare-fun m!191059 () Bool)

(assert (=> b!158229 m!191059))

(assert (=> b!158232 m!191019))

(declare-fun m!191061 () Bool)

(assert (=> b!158232 m!191061))

(assert (=> b!158232 m!191061))

(declare-fun m!191063 () Bool)

(assert (=> b!158232 m!191063))

(assert (=> b!158235 m!191059))

(assert (=> b!158230 m!191059))

(assert (=> d!51153 m!191019))

(declare-fun m!191065 () Bool)

(assert (=> d!51153 m!191065))

(assert (=> d!51153 m!190997))

(assert (=> d!51137 d!51153))

(declare-fun d!51155 () Bool)

(declare-fun lt!81826 () (_ BitVec 32))

(declare-fun lt!81825 () (_ BitVec 32))

(assert (=> d!51155 (= lt!81826 (bvmul (bvxor lt!81825 (bvlshr lt!81825 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51155 (= lt!81825 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51155 (and (bvsge (mask!7692 thiss!1248) #b00000000000000000000000000000000) (let ((res!74742 (let ((h!2495 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17450 (bvmul (bvxor h!2495 (bvlshr h!2495 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17450 (bvlshr x!17450 #b00000000000000000000000000001101)) (mask!7692 thiss!1248)))))) (and (bvslt res!74742 (bvadd (mask!7692 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74742 #b00000000000000000000000000000000))))))

(assert (=> d!51155 (= (toIndex!0 key!828 (mask!7692 thiss!1248)) (bvand (bvxor lt!81826 (bvlshr lt!81826 #b00000000000000000000000000001101)) (mask!7692 thiss!1248)))))

(assert (=> d!51137 d!51155))

(assert (=> d!51137 d!51135))

(declare-fun d!51157 () Bool)

(declare-fun res!74748 () Bool)

(declare-fun e!103633 () Bool)

(assert (=> d!51157 (=> res!74748 e!103633)))

(assert (=> d!51157 (= res!74748 (bvsge #b00000000000000000000000000000000 (size!2938 (_keys!4971 thiss!1248))))))

(assert (=> d!51157 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4971 thiss!1248) (mask!7692 thiss!1248)) e!103633)))

(declare-fun b!158245 () Bool)

(declare-fun e!103635 () Bool)

(declare-fun call!17251 () Bool)

(assert (=> b!158245 (= e!103635 call!17251)))

(declare-fun b!158246 () Bool)

(declare-fun e!103634 () Bool)

(assert (=> b!158246 (= e!103635 e!103634)))

(declare-fun lt!81835 () (_ BitVec 64))

(assert (=> b!158246 (= lt!81835 (select (arr!2657 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4984 0))(
  ( (Unit!4985) )
))
(declare-fun lt!81833 () Unit!4984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5611 (_ BitVec 64) (_ BitVec 32)) Unit!4984)

(assert (=> b!158246 (= lt!81833 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4971 thiss!1248) lt!81835 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158246 (arrayContainsKey!0 (_keys!4971 thiss!1248) lt!81835 #b00000000000000000000000000000000)))

(declare-fun lt!81834 () Unit!4984)

(assert (=> b!158246 (= lt!81834 lt!81833)))

(declare-fun res!74747 () Bool)

(assert (=> b!158246 (= res!74747 (= (seekEntryOrOpen!0 (select (arr!2657 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000) (_keys!4971 thiss!1248) (mask!7692 thiss!1248)) (Found!292 #b00000000000000000000000000000000)))))

(assert (=> b!158246 (=> (not res!74747) (not e!103634))))

(declare-fun b!158247 () Bool)

(assert (=> b!158247 (= e!103633 e!103635)))

(declare-fun c!29803 () Bool)

(assert (=> b!158247 (= c!29803 (validKeyInArray!0 (select (arr!2657 (_keys!4971 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158248 () Bool)

(assert (=> b!158248 (= e!103634 call!17251)))

(declare-fun bm!17248 () Bool)

(assert (=> bm!17248 (= call!17251 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4971 thiss!1248) (mask!7692 thiss!1248)))))

(assert (= (and d!51157 (not res!74748)) b!158247))

(assert (= (and b!158247 c!29803) b!158246))

(assert (= (and b!158247 (not c!29803)) b!158245))

(assert (= (and b!158246 res!74747) b!158248))

(assert (= (or b!158248 b!158245) bm!17248))

(assert (=> b!158246 m!191043))

(declare-fun m!191067 () Bool)

(assert (=> b!158246 m!191067))

(declare-fun m!191069 () Bool)

(assert (=> b!158246 m!191069))

(assert (=> b!158246 m!191043))

(declare-fun m!191071 () Bool)

(assert (=> b!158246 m!191071))

(assert (=> b!158247 m!191043))

(assert (=> b!158247 m!191043))

(assert (=> b!158247 m!191045))

(declare-fun m!191073 () Bool)

(assert (=> bm!17248 m!191073))

(assert (=> b!158143 d!51157))

(declare-fun condMapEmpty!5580 () Bool)

(declare-fun mapDefault!5580 () ValueCell!1293)

(assert (=> mapNonEmpty!5579 (= condMapEmpty!5580 (= mapRest!5579 ((as const (Array (_ BitVec 32) ValueCell!1293)) mapDefault!5580)))))

(declare-fun e!103636 () Bool)

(declare-fun mapRes!5580 () Bool)

(assert (=> mapNonEmpty!5579 (= tp!12968 (and e!103636 mapRes!5580))))

(declare-fun mapNonEmpty!5580 () Bool)

(declare-fun tp!12969 () Bool)

(declare-fun e!103637 () Bool)

(assert (=> mapNonEmpty!5580 (= mapRes!5580 (and tp!12969 e!103637))))

(declare-fun mapValue!5580 () ValueCell!1293)

(declare-fun mapKey!5580 () (_ BitVec 32))

(declare-fun mapRest!5580 () (Array (_ BitVec 32) ValueCell!1293))

(assert (=> mapNonEmpty!5580 (= mapRest!5579 (store mapRest!5580 mapKey!5580 mapValue!5580))))

(declare-fun b!158249 () Bool)

(assert (=> b!158249 (= e!103637 tp_is_empty!3273)))

(declare-fun b!158250 () Bool)

(assert (=> b!158250 (= e!103636 tp_is_empty!3273)))

(declare-fun mapIsEmpty!5580 () Bool)

(assert (=> mapIsEmpty!5580 mapRes!5580))

(assert (= (and mapNonEmpty!5579 condMapEmpty!5580) mapIsEmpty!5580))

(assert (= (and mapNonEmpty!5579 (not condMapEmpty!5580)) mapNonEmpty!5580))

(assert (= (and mapNonEmpty!5580 ((_ is ValueCellFull!1293) mapValue!5580)) b!158249))

(assert (= (and mapNonEmpty!5579 ((_ is ValueCellFull!1293) mapDefault!5580)) b!158250))

(declare-fun m!191075 () Bool)

(assert (=> mapNonEmpty!5580 m!191075))

(check-sat (not bm!17248) tp_is_empty!3273 (not bm!17245) (not b_next!3471) (not b!158188) (not d!51145) (not b!158190) (not b!158173) b_and!9885 (not mapNonEmpty!5580) (not d!51151) (not b!158191) (not b!158232) (not d!51153) (not bm!17242) (not b!158247) (not b!158163) (not b!158162) (not b!158246) (not b!158206))
(check-sat b_and!9885 (not b_next!3471))
