; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16312 () Bool)

(assert start!16312)

(declare-fun b!162599 () Bool)

(declare-fun b_free!3769 () Bool)

(declare-fun b_next!3769 () Bool)

(assert (=> b!162599 (= b_free!3769 (not b_next!3769))))

(declare-fun tp!13877 () Bool)

(declare-fun b_and!10157 () Bool)

(assert (=> b!162599 (= tp!13877 b_and!10157)))

(declare-fun res!76975 () Bool)

(declare-fun e!106640 () Bool)

(assert (=> start!16312 (=> (not res!76975) (not e!106640))))

(declare-datatypes ((V!4409 0))(
  ( (V!4410 (val!1830 Int)) )
))
(declare-datatypes ((ValueCell!1442 0))(
  ( (ValueCellFull!1442 (v!3689 V!4409)) (EmptyCell!1442) )
))
(declare-datatypes ((array!6201 0))(
  ( (array!6202 (arr!2944 (Array (_ BitVec 32) (_ BitVec 64))) (size!3229 (_ BitVec 32))) )
))
(declare-datatypes ((array!6203 0))(
  ( (array!6204 (arr!2945 (Array (_ BitVec 32) ValueCell!1442)) (size!3230 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1792 0))(
  ( (LongMapFixedSize!1793 (defaultEntry!3338 Int) (mask!7969 (_ BitVec 32)) (extraKeys!3079 (_ BitVec 32)) (zeroValue!3181 V!4409) (minValue!3181 V!4409) (_size!945 (_ BitVec 32)) (_keys!5138 array!6201) (_values!3321 array!6203) (_vacant!945 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1792)

(declare-fun valid!812 (LongMapFixedSize!1792) Bool)

(assert (=> start!16312 (= res!76975 (valid!812 thiss!1248))))

(assert (=> start!16312 e!106640))

(declare-fun e!106643 () Bool)

(assert (=> start!16312 e!106643))

(assert (=> start!16312 true))

(declare-fun mapNonEmpty!6044 () Bool)

(declare-fun mapRes!6044 () Bool)

(declare-fun tp!13876 () Bool)

(declare-fun e!106645 () Bool)

(assert (=> mapNonEmpty!6044 (= mapRes!6044 (and tp!13876 e!106645))))

(declare-fun mapRest!6044 () (Array (_ BitVec 32) ValueCell!1442))

(declare-fun mapKey!6044 () (_ BitVec 32))

(declare-fun mapValue!6044 () ValueCell!1442)

(assert (=> mapNonEmpty!6044 (= (arr!2945 (_values!3321 thiss!1248)) (store mapRest!6044 mapKey!6044 mapValue!6044))))

(declare-fun b!162595 () Bool)

(declare-fun e!106639 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!162595 (= e!106639 (not (validMask!0 (mask!7969 thiss!1248))))))

(declare-fun b!162596 () Bool)

(declare-fun e!106642 () Bool)

(declare-fun e!106644 () Bool)

(assert (=> b!162596 (= e!106642 (and e!106644 mapRes!6044))))

(declare-fun condMapEmpty!6044 () Bool)

(declare-fun mapDefault!6044 () ValueCell!1442)

(assert (=> b!162596 (= condMapEmpty!6044 (= (arr!2945 (_values!3321 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1442)) mapDefault!6044)))))

(declare-fun b!162597 () Bool)

(declare-fun tp_is_empty!3571 () Bool)

(assert (=> b!162597 (= e!106644 tp_is_empty!3571)))

(declare-fun b!162598 () Bool)

(declare-fun res!76976 () Bool)

(assert (=> b!162598 (=> (not res!76976) (not e!106640))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162598 (= res!76976 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!1895 (array!6201) Bool)

(declare-fun array_inv!1896 (array!6203) Bool)

(assert (=> b!162599 (= e!106643 (and tp!13877 tp_is_empty!3571 (array_inv!1895 (_keys!5138 thiss!1248)) (array_inv!1896 (_values!3321 thiss!1248)) e!106642))))

(declare-fun mapIsEmpty!6044 () Bool)

(assert (=> mapIsEmpty!6044 mapRes!6044))

(declare-fun b!162600 () Bool)

(assert (=> b!162600 (= e!106640 e!106639)))

(declare-fun res!76977 () Bool)

(assert (=> b!162600 (=> (not res!76977) (not e!106639))))

(declare-datatypes ((SeekEntryResult!402 0))(
  ( (MissingZero!402 (index!3776 (_ BitVec 32))) (Found!402 (index!3777 (_ BitVec 32))) (Intermediate!402 (undefined!1214 Bool) (index!3778 (_ BitVec 32)) (x!18025 (_ BitVec 32))) (Undefined!402) (MissingVacant!402 (index!3779 (_ BitVec 32))) )
))
(declare-fun lt!82356 () SeekEntryResult!402)

(get-info :version)

(assert (=> b!162600 (= res!76977 (and (not ((_ is Undefined!402) lt!82356)) (not ((_ is MissingVacant!402) lt!82356)) (not ((_ is MissingZero!402) lt!82356)) ((_ is Found!402) lt!82356)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6201 (_ BitVec 32)) SeekEntryResult!402)

(assert (=> b!162600 (= lt!82356 (seekEntryOrOpen!0 key!828 (_keys!5138 thiss!1248) (mask!7969 thiss!1248)))))

(declare-fun b!162601 () Bool)

(assert (=> b!162601 (= e!106645 tp_is_empty!3571)))

(assert (= (and start!16312 res!76975) b!162598))

(assert (= (and b!162598 res!76976) b!162600))

(assert (= (and b!162600 res!76977) b!162595))

(assert (= (and b!162596 condMapEmpty!6044) mapIsEmpty!6044))

(assert (= (and b!162596 (not condMapEmpty!6044)) mapNonEmpty!6044))

(assert (= (and mapNonEmpty!6044 ((_ is ValueCellFull!1442) mapValue!6044)) b!162601))

(assert (= (and b!162596 ((_ is ValueCellFull!1442) mapDefault!6044)) b!162597))

(assert (= b!162599 b!162596))

(assert (= start!16312 b!162599))

(declare-fun m!193135 () Bool)

(assert (=> b!162595 m!193135))

(declare-fun m!193137 () Bool)

(assert (=> b!162599 m!193137))

(declare-fun m!193139 () Bool)

(assert (=> b!162599 m!193139))

(declare-fun m!193141 () Bool)

(assert (=> b!162600 m!193141))

(declare-fun m!193143 () Bool)

(assert (=> start!16312 m!193143))

(declare-fun m!193145 () Bool)

(assert (=> mapNonEmpty!6044 m!193145))

(check-sat (not b!162600) (not start!16312) tp_is_empty!3571 (not mapNonEmpty!6044) b_and!10157 (not b!162595) (not b!162599) (not b_next!3769))
(check-sat b_and!10157 (not b_next!3769))
(get-model)

(declare-fun d!51209 () Bool)

(declare-fun res!77002 () Bool)

(declare-fun e!106690 () Bool)

(assert (=> d!51209 (=> (not res!77002) (not e!106690))))

(declare-fun simpleValid!118 (LongMapFixedSize!1792) Bool)

(assert (=> d!51209 (= res!77002 (simpleValid!118 thiss!1248))))

(assert (=> d!51209 (= (valid!812 thiss!1248) e!106690)))

(declare-fun b!162650 () Bool)

(declare-fun res!77003 () Bool)

(assert (=> b!162650 (=> (not res!77003) (not e!106690))))

(declare-fun arrayCountValidKeys!0 (array!6201 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!162650 (= res!77003 (= (arrayCountValidKeys!0 (_keys!5138 thiss!1248) #b00000000000000000000000000000000 (size!3229 (_keys!5138 thiss!1248))) (_size!945 thiss!1248)))))

(declare-fun b!162651 () Bool)

(declare-fun res!77004 () Bool)

(assert (=> b!162651 (=> (not res!77004) (not e!106690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6201 (_ BitVec 32)) Bool)

(assert (=> b!162651 (= res!77004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5138 thiss!1248) (mask!7969 thiss!1248)))))

(declare-fun b!162652 () Bool)

(declare-datatypes ((List!1993 0))(
  ( (Nil!1990) (Cons!1989 (h!2602 (_ BitVec 64)) (t!6786 List!1993)) )
))
(declare-fun arrayNoDuplicates!0 (array!6201 (_ BitVec 32) List!1993) Bool)

(assert (=> b!162652 (= e!106690 (arrayNoDuplicates!0 (_keys!5138 thiss!1248) #b00000000000000000000000000000000 Nil!1990))))

(assert (= (and d!51209 res!77002) b!162650))

(assert (= (and b!162650 res!77003) b!162651))

(assert (= (and b!162651 res!77004) b!162652))

(declare-fun m!193171 () Bool)

(assert (=> d!51209 m!193171))

(declare-fun m!193173 () Bool)

(assert (=> b!162650 m!193173))

(declare-fun m!193175 () Bool)

(assert (=> b!162651 m!193175))

(declare-fun m!193177 () Bool)

(assert (=> b!162652 m!193177))

(assert (=> start!16312 d!51209))

(declare-fun lt!82370 () SeekEntryResult!402)

(declare-fun b!162665 () Bool)

(declare-fun e!106697 () SeekEntryResult!402)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6201 (_ BitVec 32)) SeekEntryResult!402)

(assert (=> b!162665 (= e!106697 (seekKeyOrZeroReturnVacant!0 (x!18025 lt!82370) (index!3778 lt!82370) (index!3778 lt!82370) key!828 (_keys!5138 thiss!1248) (mask!7969 thiss!1248)))))

(declare-fun d!51211 () Bool)

(declare-fun lt!82369 () SeekEntryResult!402)

(assert (=> d!51211 (and (or ((_ is Undefined!402) lt!82369) (not ((_ is Found!402) lt!82369)) (and (bvsge (index!3777 lt!82369) #b00000000000000000000000000000000) (bvslt (index!3777 lt!82369) (size!3229 (_keys!5138 thiss!1248))))) (or ((_ is Undefined!402) lt!82369) ((_ is Found!402) lt!82369) (not ((_ is MissingZero!402) lt!82369)) (and (bvsge (index!3776 lt!82369) #b00000000000000000000000000000000) (bvslt (index!3776 lt!82369) (size!3229 (_keys!5138 thiss!1248))))) (or ((_ is Undefined!402) lt!82369) ((_ is Found!402) lt!82369) ((_ is MissingZero!402) lt!82369) (not ((_ is MissingVacant!402) lt!82369)) (and (bvsge (index!3779 lt!82369) #b00000000000000000000000000000000) (bvslt (index!3779 lt!82369) (size!3229 (_keys!5138 thiss!1248))))) (or ((_ is Undefined!402) lt!82369) (ite ((_ is Found!402) lt!82369) (= (select (arr!2944 (_keys!5138 thiss!1248)) (index!3777 lt!82369)) key!828) (ite ((_ is MissingZero!402) lt!82369) (= (select (arr!2944 (_keys!5138 thiss!1248)) (index!3776 lt!82369)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!402) lt!82369) (= (select (arr!2944 (_keys!5138 thiss!1248)) (index!3779 lt!82369)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!106698 () SeekEntryResult!402)

(assert (=> d!51211 (= lt!82369 e!106698)))

(declare-fun c!29960 () Bool)

(assert (=> d!51211 (= c!29960 (and ((_ is Intermediate!402) lt!82370) (undefined!1214 lt!82370)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6201 (_ BitVec 32)) SeekEntryResult!402)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51211 (= lt!82370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7969 thiss!1248)) key!828 (_keys!5138 thiss!1248) (mask!7969 thiss!1248)))))

(assert (=> d!51211 (validMask!0 (mask!7969 thiss!1248))))

(assert (=> d!51211 (= (seekEntryOrOpen!0 key!828 (_keys!5138 thiss!1248) (mask!7969 thiss!1248)) lt!82369)))

(declare-fun b!162666 () Bool)

(declare-fun e!106699 () SeekEntryResult!402)

(assert (=> b!162666 (= e!106698 e!106699)))

(declare-fun lt!82371 () (_ BitVec 64))

(assert (=> b!162666 (= lt!82371 (select (arr!2944 (_keys!5138 thiss!1248)) (index!3778 lt!82370)))))

(declare-fun c!29958 () Bool)

(assert (=> b!162666 (= c!29958 (= lt!82371 key!828))))

(declare-fun b!162667 () Bool)

(assert (=> b!162667 (= e!106698 Undefined!402)))

(declare-fun b!162668 () Bool)

(assert (=> b!162668 (= e!106699 (Found!402 (index!3778 lt!82370)))))

(declare-fun b!162669 () Bool)

(assert (=> b!162669 (= e!106697 (MissingZero!402 (index!3778 lt!82370)))))

(declare-fun b!162670 () Bool)

(declare-fun c!29959 () Bool)

(assert (=> b!162670 (= c!29959 (= lt!82371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!162670 (= e!106699 e!106697)))

(assert (= (and d!51211 c!29960) b!162667))

(assert (= (and d!51211 (not c!29960)) b!162666))

(assert (= (and b!162666 c!29958) b!162668))

(assert (= (and b!162666 (not c!29958)) b!162670))

(assert (= (and b!162670 c!29959) b!162669))

(assert (= (and b!162670 (not c!29959)) b!162665))

(declare-fun m!193179 () Bool)

(assert (=> b!162665 m!193179))

(declare-fun m!193181 () Bool)

(assert (=> d!51211 m!193181))

(declare-fun m!193183 () Bool)

(assert (=> d!51211 m!193183))

(declare-fun m!193185 () Bool)

(assert (=> d!51211 m!193185))

(declare-fun m!193187 () Bool)

(assert (=> d!51211 m!193187))

(assert (=> d!51211 m!193181))

(declare-fun m!193189 () Bool)

(assert (=> d!51211 m!193189))

(assert (=> d!51211 m!193135))

(declare-fun m!193191 () Bool)

(assert (=> b!162666 m!193191))

(assert (=> b!162600 d!51211))

(declare-fun d!51213 () Bool)

(assert (=> d!51213 (= (validMask!0 (mask!7969 thiss!1248)) (and (or (= (mask!7969 thiss!1248) #b00000000000000000000000000000111) (= (mask!7969 thiss!1248) #b00000000000000000000000000001111) (= (mask!7969 thiss!1248) #b00000000000000000000000000011111) (= (mask!7969 thiss!1248) #b00000000000000000000000000111111) (= (mask!7969 thiss!1248) #b00000000000000000000000001111111) (= (mask!7969 thiss!1248) #b00000000000000000000000011111111) (= (mask!7969 thiss!1248) #b00000000000000000000000111111111) (= (mask!7969 thiss!1248) #b00000000000000000000001111111111) (= (mask!7969 thiss!1248) #b00000000000000000000011111111111) (= (mask!7969 thiss!1248) #b00000000000000000000111111111111) (= (mask!7969 thiss!1248) #b00000000000000000001111111111111) (= (mask!7969 thiss!1248) #b00000000000000000011111111111111) (= (mask!7969 thiss!1248) #b00000000000000000111111111111111) (= (mask!7969 thiss!1248) #b00000000000000001111111111111111) (= (mask!7969 thiss!1248) #b00000000000000011111111111111111) (= (mask!7969 thiss!1248) #b00000000000000111111111111111111) (= (mask!7969 thiss!1248) #b00000000000001111111111111111111) (= (mask!7969 thiss!1248) #b00000000000011111111111111111111) (= (mask!7969 thiss!1248) #b00000000000111111111111111111111) (= (mask!7969 thiss!1248) #b00000000001111111111111111111111) (= (mask!7969 thiss!1248) #b00000000011111111111111111111111) (= (mask!7969 thiss!1248) #b00000000111111111111111111111111) (= (mask!7969 thiss!1248) #b00000001111111111111111111111111) (= (mask!7969 thiss!1248) #b00000011111111111111111111111111) (= (mask!7969 thiss!1248) #b00000111111111111111111111111111) (= (mask!7969 thiss!1248) #b00001111111111111111111111111111) (= (mask!7969 thiss!1248) #b00011111111111111111111111111111) (= (mask!7969 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7969 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!162595 d!51213))

(declare-fun d!51215 () Bool)

(assert (=> d!51215 (= (array_inv!1895 (_keys!5138 thiss!1248)) (bvsge (size!3229 (_keys!5138 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162599 d!51215))

(declare-fun d!51217 () Bool)

(assert (=> d!51217 (= (array_inv!1896 (_values!3321 thiss!1248)) (bvsge (size!3230 (_values!3321 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162599 d!51217))

(declare-fun b!162678 () Bool)

(declare-fun e!106705 () Bool)

(assert (=> b!162678 (= e!106705 tp_is_empty!3571)))

(declare-fun b!162677 () Bool)

(declare-fun e!106704 () Bool)

(assert (=> b!162677 (= e!106704 tp_is_empty!3571)))

(declare-fun mapNonEmpty!6053 () Bool)

(declare-fun mapRes!6053 () Bool)

(declare-fun tp!13892 () Bool)

(assert (=> mapNonEmpty!6053 (= mapRes!6053 (and tp!13892 e!106704))))

(declare-fun mapKey!6053 () (_ BitVec 32))

(declare-fun mapRest!6053 () (Array (_ BitVec 32) ValueCell!1442))

(declare-fun mapValue!6053 () ValueCell!1442)

(assert (=> mapNonEmpty!6053 (= mapRest!6044 (store mapRest!6053 mapKey!6053 mapValue!6053))))

(declare-fun mapIsEmpty!6053 () Bool)

(assert (=> mapIsEmpty!6053 mapRes!6053))

(declare-fun condMapEmpty!6053 () Bool)

(declare-fun mapDefault!6053 () ValueCell!1442)

(assert (=> mapNonEmpty!6044 (= condMapEmpty!6053 (= mapRest!6044 ((as const (Array (_ BitVec 32) ValueCell!1442)) mapDefault!6053)))))

(assert (=> mapNonEmpty!6044 (= tp!13876 (and e!106705 mapRes!6053))))

(assert (= (and mapNonEmpty!6044 condMapEmpty!6053) mapIsEmpty!6053))

(assert (= (and mapNonEmpty!6044 (not condMapEmpty!6053)) mapNonEmpty!6053))

(assert (= (and mapNonEmpty!6053 ((_ is ValueCellFull!1442) mapValue!6053)) b!162677))

(assert (= (and mapNonEmpty!6044 ((_ is ValueCellFull!1442) mapDefault!6053)) b!162678))

(declare-fun m!193193 () Bool)

(assert (=> mapNonEmpty!6053 m!193193))

(check-sat (not mapNonEmpty!6053) (not b!162651) (not b!162650) (not d!51211) (not b_next!3769) (not d!51209) tp_is_empty!3571 (not b!162652) b_and!10157 (not b!162665))
(check-sat b_and!10157 (not b_next!3769))
