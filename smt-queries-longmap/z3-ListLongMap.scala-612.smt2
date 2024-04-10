; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15934 () Bool)

(assert start!15934)

(declare-fun b!158398 () Bool)

(declare-fun b_free!3483 () Bool)

(declare-fun b_next!3483 () Bool)

(assert (=> b!158398 (= b_free!3483 (not b_next!3483))))

(declare-fun tp!13002 () Bool)

(declare-fun b_and!9897 () Bool)

(assert (=> b!158398 (= tp!13002 b_and!9897)))

(declare-fun res!74815 () Bool)

(declare-fun e!103744 () Bool)

(assert (=> start!15934 (=> (not res!74815) (not e!103744))))

(declare-datatypes ((V!4027 0))(
  ( (V!4028 (val!1687 Int)) )
))
(declare-datatypes ((ValueCell!1299 0))(
  ( (ValueCellFull!1299 (v!3552 V!4027)) (EmptyCell!1299) )
))
(declare-datatypes ((array!5639 0))(
  ( (array!5640 (arr!2669 (Array (_ BitVec 32) (_ BitVec 64))) (size!2951 (_ BitVec 32))) )
))
(declare-datatypes ((array!5641 0))(
  ( (array!5642 (arr!2670 (Array (_ BitVec 32) ValueCell!1299)) (size!2952 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1506 0))(
  ( (LongMapFixedSize!1507 (defaultEntry!3195 Int) (mask!7710 (_ BitVec 32)) (extraKeys!2936 (_ BitVec 32)) (zeroValue!3038 V!4027) (minValue!3038 V!4027) (_size!802 (_ BitVec 32)) (_keys!4982 array!5639) (_values!3178 array!5641) (_vacant!802 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1506)

(declare-fun valid!709 (LongMapFixedSize!1506) Bool)

(assert (=> start!15934 (= res!74815 (valid!709 thiss!1248))))

(assert (=> start!15934 e!103744))

(declare-fun e!103745 () Bool)

(assert (=> start!15934 e!103745))

(assert (=> start!15934 true))

(declare-fun tp_is_empty!3285 () Bool)

(declare-fun e!103740 () Bool)

(declare-fun array_inv!1699 (array!5639) Bool)

(declare-fun array_inv!1700 (array!5641) Bool)

(assert (=> b!158398 (= e!103745 (and tp!13002 tp_is_empty!3285 (array_inv!1699 (_keys!4982 thiss!1248)) (array_inv!1700 (_values!3178 thiss!1248)) e!103740))))

(declare-fun b!158399 () Bool)

(declare-fun e!103742 () Bool)

(assert (=> b!158399 (= e!103742 tp_is_empty!3285)))

(declare-fun b!158400 () Bool)

(declare-fun res!74817 () Bool)

(assert (=> b!158400 (=> (not res!74817) (not e!103744))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158400 (= res!74817 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158401 () Bool)

(declare-fun e!103741 () Bool)

(assert (=> b!158401 (= e!103741 tp_is_empty!3285)))

(declare-fun b!158402 () Bool)

(declare-fun res!74816 () Bool)

(assert (=> b!158402 (=> (not res!74816) (not e!103744))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!296 0))(
  ( (MissingZero!296 (index!3352 (_ BitVec 32))) (Found!296 (index!3353 (_ BitVec 32))) (Intermediate!296 (undefined!1108 Bool) (index!3354 (_ BitVec 32)) (x!17478 (_ BitVec 32))) (Undefined!296) (MissingVacant!296 (index!3355 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5639 (_ BitVec 32)) SeekEntryResult!296)

(assert (=> b!158402 (= res!74816 ((_ is Undefined!296) (seekEntryOrOpen!0 key!828 (_keys!4982 thiss!1248) (mask!7710 thiss!1248))))))

(declare-fun mapNonEmpty!5598 () Bool)

(declare-fun mapRes!5598 () Bool)

(declare-fun tp!13001 () Bool)

(assert (=> mapNonEmpty!5598 (= mapRes!5598 (and tp!13001 e!103741))))

(declare-fun mapValue!5598 () ValueCell!1299)

(declare-fun mapKey!5598 () (_ BitVec 32))

(declare-fun mapRest!5598 () (Array (_ BitVec 32) ValueCell!1299))

(assert (=> mapNonEmpty!5598 (= (arr!2670 (_values!3178 thiss!1248)) (store mapRest!5598 mapKey!5598 mapValue!5598))))

(declare-fun mapIsEmpty!5598 () Bool)

(assert (=> mapIsEmpty!5598 mapRes!5598))

(declare-fun b!158403 () Bool)

(declare-fun res!74814 () Bool)

(assert (=> b!158403 (=> (not res!74814) (not e!103744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158403 (= res!74814 (validMask!0 (mask!7710 thiss!1248)))))

(declare-fun b!158404 () Bool)

(assert (=> b!158404 (= e!103740 (and e!103742 mapRes!5598))))

(declare-fun condMapEmpty!5598 () Bool)

(declare-fun mapDefault!5598 () ValueCell!1299)

(assert (=> b!158404 (= condMapEmpty!5598 (= (arr!2670 (_values!3178 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1299)) mapDefault!5598)))))

(declare-fun b!158405 () Bool)

(assert (=> b!158405 (= e!103744 (and (= (size!2952 (_values!3178 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7710 thiss!1248))) (= (size!2951 (_keys!4982 thiss!1248)) (size!2952 (_values!3178 thiss!1248))) (bvsge (mask!7710 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!2936 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and start!15934 res!74815) b!158400))

(assert (= (and b!158400 res!74817) b!158402))

(assert (= (and b!158402 res!74816) b!158403))

(assert (= (and b!158403 res!74814) b!158405))

(assert (= (and b!158404 condMapEmpty!5598) mapIsEmpty!5598))

(assert (= (and b!158404 (not condMapEmpty!5598)) mapNonEmpty!5598))

(assert (= (and mapNonEmpty!5598 ((_ is ValueCellFull!1299) mapValue!5598)) b!158401))

(assert (= (and b!158404 ((_ is ValueCellFull!1299) mapDefault!5598)) b!158399))

(assert (= b!158398 b!158404))

(assert (= start!15934 b!158398))

(declare-fun m!191149 () Bool)

(assert (=> b!158402 m!191149))

(declare-fun m!191151 () Bool)

(assert (=> mapNonEmpty!5598 m!191151))

(declare-fun m!191153 () Bool)

(assert (=> start!15934 m!191153))

(declare-fun m!191155 () Bool)

(assert (=> b!158403 m!191155))

(declare-fun m!191157 () Bool)

(assert (=> b!158398 m!191157))

(declare-fun m!191159 () Bool)

(assert (=> b!158398 m!191159))

(check-sat tp_is_empty!3285 (not start!15934) (not b_next!3483) (not b!158398) (not b!158402) b_and!9897 (not b!158403) (not mapNonEmpty!5598))
(check-sat b_and!9897 (not b_next!3483))
(get-model)

(declare-fun b!158442 () Bool)

(declare-fun lt!81851 () SeekEntryResult!296)

(declare-fun e!103771 () SeekEntryResult!296)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5639 (_ BitVec 32)) SeekEntryResult!296)

(assert (=> b!158442 (= e!103771 (seekKeyOrZeroReturnVacant!0 (x!17478 lt!81851) (index!3354 lt!81851) (index!3354 lt!81851) key!828 (_keys!4982 thiss!1248) (mask!7710 thiss!1248)))))

(declare-fun b!158443 () Bool)

(assert (=> b!158443 (= e!103771 (MissingZero!296 (index!3354 lt!81851)))))

(declare-fun b!158444 () Bool)

(declare-fun c!29821 () Bool)

(declare-fun lt!81852 () (_ BitVec 64))

(assert (=> b!158444 (= c!29821 (= lt!81852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103770 () SeekEntryResult!296)

(assert (=> b!158444 (= e!103770 e!103771)))

(declare-fun d!51173 () Bool)

(declare-fun lt!81853 () SeekEntryResult!296)

(assert (=> d!51173 (and (or ((_ is Undefined!296) lt!81853) (not ((_ is Found!296) lt!81853)) (and (bvsge (index!3353 lt!81853) #b00000000000000000000000000000000) (bvslt (index!3353 lt!81853) (size!2951 (_keys!4982 thiss!1248))))) (or ((_ is Undefined!296) lt!81853) ((_ is Found!296) lt!81853) (not ((_ is MissingZero!296) lt!81853)) (and (bvsge (index!3352 lt!81853) #b00000000000000000000000000000000) (bvslt (index!3352 lt!81853) (size!2951 (_keys!4982 thiss!1248))))) (or ((_ is Undefined!296) lt!81853) ((_ is Found!296) lt!81853) ((_ is MissingZero!296) lt!81853) (not ((_ is MissingVacant!296) lt!81853)) (and (bvsge (index!3355 lt!81853) #b00000000000000000000000000000000) (bvslt (index!3355 lt!81853) (size!2951 (_keys!4982 thiss!1248))))) (or ((_ is Undefined!296) lt!81853) (ite ((_ is Found!296) lt!81853) (= (select (arr!2669 (_keys!4982 thiss!1248)) (index!3353 lt!81853)) key!828) (ite ((_ is MissingZero!296) lt!81853) (= (select (arr!2669 (_keys!4982 thiss!1248)) (index!3352 lt!81853)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!296) lt!81853) (= (select (arr!2669 (_keys!4982 thiss!1248)) (index!3355 lt!81853)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103772 () SeekEntryResult!296)

(assert (=> d!51173 (= lt!81853 e!103772)))

(declare-fun c!29819 () Bool)

(assert (=> d!51173 (= c!29819 (and ((_ is Intermediate!296) lt!81851) (undefined!1108 lt!81851)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5639 (_ BitVec 32)) SeekEntryResult!296)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51173 (= lt!81851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7710 thiss!1248)) key!828 (_keys!4982 thiss!1248) (mask!7710 thiss!1248)))))

(assert (=> d!51173 (validMask!0 (mask!7710 thiss!1248))))

(assert (=> d!51173 (= (seekEntryOrOpen!0 key!828 (_keys!4982 thiss!1248) (mask!7710 thiss!1248)) lt!81853)))

(declare-fun b!158445 () Bool)

(assert (=> b!158445 (= e!103772 Undefined!296)))

(declare-fun b!158446 () Bool)

(assert (=> b!158446 (= e!103772 e!103770)))

(assert (=> b!158446 (= lt!81852 (select (arr!2669 (_keys!4982 thiss!1248)) (index!3354 lt!81851)))))

(declare-fun c!29820 () Bool)

(assert (=> b!158446 (= c!29820 (= lt!81852 key!828))))

(declare-fun b!158447 () Bool)

(assert (=> b!158447 (= e!103770 (Found!296 (index!3354 lt!81851)))))

(assert (= (and d!51173 c!29819) b!158445))

(assert (= (and d!51173 (not c!29819)) b!158446))

(assert (= (and b!158446 c!29820) b!158447))

(assert (= (and b!158446 (not c!29820)) b!158444))

(assert (= (and b!158444 c!29821) b!158443))

(assert (= (and b!158444 (not c!29821)) b!158442))

(declare-fun m!191173 () Bool)

(assert (=> b!158442 m!191173))

(assert (=> d!51173 m!191155))

(declare-fun m!191175 () Bool)

(assert (=> d!51173 m!191175))

(assert (=> d!51173 m!191175))

(declare-fun m!191177 () Bool)

(assert (=> d!51173 m!191177))

(declare-fun m!191179 () Bool)

(assert (=> d!51173 m!191179))

(declare-fun m!191181 () Bool)

(assert (=> d!51173 m!191181))

(declare-fun m!191183 () Bool)

(assert (=> d!51173 m!191183))

(declare-fun m!191185 () Bool)

(assert (=> b!158446 m!191185))

(assert (=> b!158402 d!51173))

(declare-fun d!51175 () Bool)

(declare-fun res!74836 () Bool)

(declare-fun e!103775 () Bool)

(assert (=> d!51175 (=> (not res!74836) (not e!103775))))

(declare-fun simpleValid!113 (LongMapFixedSize!1506) Bool)

(assert (=> d!51175 (= res!74836 (simpleValid!113 thiss!1248))))

(assert (=> d!51175 (= (valid!709 thiss!1248) e!103775)))

(declare-fun b!158454 () Bool)

(declare-fun res!74837 () Bool)

(assert (=> b!158454 (=> (not res!74837) (not e!103775))))

(declare-fun arrayCountValidKeys!0 (array!5639 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158454 (= res!74837 (= (arrayCountValidKeys!0 (_keys!4982 thiss!1248) #b00000000000000000000000000000000 (size!2951 (_keys!4982 thiss!1248))) (_size!802 thiss!1248)))))

(declare-fun b!158455 () Bool)

(declare-fun res!74838 () Bool)

(assert (=> b!158455 (=> (not res!74838) (not e!103775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5639 (_ BitVec 32)) Bool)

(assert (=> b!158455 (= res!74838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4982 thiss!1248) (mask!7710 thiss!1248)))))

(declare-fun b!158456 () Bool)

(declare-datatypes ((List!1890 0))(
  ( (Nil!1887) (Cons!1886 (h!2497 (_ BitVec 64)) (t!6692 List!1890)) )
))
(declare-fun arrayNoDuplicates!0 (array!5639 (_ BitVec 32) List!1890) Bool)

(assert (=> b!158456 (= e!103775 (arrayNoDuplicates!0 (_keys!4982 thiss!1248) #b00000000000000000000000000000000 Nil!1887))))

(assert (= (and d!51175 res!74836) b!158454))

(assert (= (and b!158454 res!74837) b!158455))

(assert (= (and b!158455 res!74838) b!158456))

(declare-fun m!191187 () Bool)

(assert (=> d!51175 m!191187))

(declare-fun m!191189 () Bool)

(assert (=> b!158454 m!191189))

(declare-fun m!191191 () Bool)

(assert (=> b!158455 m!191191))

(declare-fun m!191193 () Bool)

(assert (=> b!158456 m!191193))

(assert (=> start!15934 d!51175))

(declare-fun d!51177 () Bool)

(assert (=> d!51177 (= (validMask!0 (mask!7710 thiss!1248)) (and (or (= (mask!7710 thiss!1248) #b00000000000000000000000000000111) (= (mask!7710 thiss!1248) #b00000000000000000000000000001111) (= (mask!7710 thiss!1248) #b00000000000000000000000000011111) (= (mask!7710 thiss!1248) #b00000000000000000000000000111111) (= (mask!7710 thiss!1248) #b00000000000000000000000001111111) (= (mask!7710 thiss!1248) #b00000000000000000000000011111111) (= (mask!7710 thiss!1248) #b00000000000000000000000111111111) (= (mask!7710 thiss!1248) #b00000000000000000000001111111111) (= (mask!7710 thiss!1248) #b00000000000000000000011111111111) (= (mask!7710 thiss!1248) #b00000000000000000000111111111111) (= (mask!7710 thiss!1248) #b00000000000000000001111111111111) (= (mask!7710 thiss!1248) #b00000000000000000011111111111111) (= (mask!7710 thiss!1248) #b00000000000000000111111111111111) (= (mask!7710 thiss!1248) #b00000000000000001111111111111111) (= (mask!7710 thiss!1248) #b00000000000000011111111111111111) (= (mask!7710 thiss!1248) #b00000000000000111111111111111111) (= (mask!7710 thiss!1248) #b00000000000001111111111111111111) (= (mask!7710 thiss!1248) #b00000000000011111111111111111111) (= (mask!7710 thiss!1248) #b00000000000111111111111111111111) (= (mask!7710 thiss!1248) #b00000000001111111111111111111111) (= (mask!7710 thiss!1248) #b00000000011111111111111111111111) (= (mask!7710 thiss!1248) #b00000000111111111111111111111111) (= (mask!7710 thiss!1248) #b00000001111111111111111111111111) (= (mask!7710 thiss!1248) #b00000011111111111111111111111111) (= (mask!7710 thiss!1248) #b00000111111111111111111111111111) (= (mask!7710 thiss!1248) #b00001111111111111111111111111111) (= (mask!7710 thiss!1248) #b00011111111111111111111111111111) (= (mask!7710 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7710 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158403 d!51177))

(declare-fun d!51179 () Bool)

(assert (=> d!51179 (= (array_inv!1699 (_keys!4982 thiss!1248)) (bvsge (size!2951 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158398 d!51179))

(declare-fun d!51181 () Bool)

(assert (=> d!51181 (= (array_inv!1700 (_values!3178 thiss!1248)) (bvsge (size!2952 (_values!3178 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158398 d!51181))

(declare-fun mapIsEmpty!5604 () Bool)

(declare-fun mapRes!5604 () Bool)

(assert (=> mapIsEmpty!5604 mapRes!5604))

(declare-fun condMapEmpty!5604 () Bool)

(declare-fun mapDefault!5604 () ValueCell!1299)

(assert (=> mapNonEmpty!5598 (= condMapEmpty!5604 (= mapRest!5598 ((as const (Array (_ BitVec 32) ValueCell!1299)) mapDefault!5604)))))

(declare-fun e!103781 () Bool)

(assert (=> mapNonEmpty!5598 (= tp!13001 (and e!103781 mapRes!5604))))

(declare-fun b!158463 () Bool)

(declare-fun e!103780 () Bool)

(assert (=> b!158463 (= e!103780 tp_is_empty!3285)))

(declare-fun mapNonEmpty!5604 () Bool)

(declare-fun tp!13011 () Bool)

(assert (=> mapNonEmpty!5604 (= mapRes!5604 (and tp!13011 e!103780))))

(declare-fun mapRest!5604 () (Array (_ BitVec 32) ValueCell!1299))

(declare-fun mapValue!5604 () ValueCell!1299)

(declare-fun mapKey!5604 () (_ BitVec 32))

(assert (=> mapNonEmpty!5604 (= mapRest!5598 (store mapRest!5604 mapKey!5604 mapValue!5604))))

(declare-fun b!158464 () Bool)

(assert (=> b!158464 (= e!103781 tp_is_empty!3285)))

(assert (= (and mapNonEmpty!5598 condMapEmpty!5604) mapIsEmpty!5604))

(assert (= (and mapNonEmpty!5598 (not condMapEmpty!5604)) mapNonEmpty!5604))

(assert (= (and mapNonEmpty!5604 ((_ is ValueCellFull!1299) mapValue!5604)) b!158463))

(assert (= (and mapNonEmpty!5598 ((_ is ValueCellFull!1299) mapDefault!5604)) b!158464))

(declare-fun m!191195 () Bool)

(assert (=> mapNonEmpty!5604 m!191195))

(check-sat tp_is_empty!3285 (not d!51173) (not b_next!3483) (not b!158454) (not b!158456) (not d!51175) (not mapNonEmpty!5604) (not b!158442) b_and!9897 (not b!158455))
(check-sat b_and!9897 (not b_next!3483))
(get-model)

(declare-fun b!158477 () Bool)

(declare-fun e!103789 () SeekEntryResult!296)

(assert (=> b!158477 (= e!103789 (Found!296 (index!3354 lt!81851)))))

(declare-fun b!158478 () Bool)

(declare-fun e!103790 () SeekEntryResult!296)

(assert (=> b!158478 (= e!103790 (MissingVacant!296 (index!3354 lt!81851)))))

(declare-fun b!158480 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158480 (= e!103790 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17478 lt!81851) #b00000000000000000000000000000001) (nextIndex!0 (index!3354 lt!81851) (x!17478 lt!81851) (mask!7710 thiss!1248)) (index!3354 lt!81851) key!828 (_keys!4982 thiss!1248) (mask!7710 thiss!1248)))))

(declare-fun b!158481 () Bool)

(declare-fun e!103788 () SeekEntryResult!296)

(assert (=> b!158481 (= e!103788 e!103789)))

(declare-fun c!29829 () Bool)

(declare-fun lt!81859 () (_ BitVec 64))

(assert (=> b!158481 (= c!29829 (= lt!81859 key!828))))

(declare-fun b!158482 () Bool)

(assert (=> b!158482 (= e!103788 Undefined!296)))

(declare-fun b!158479 () Bool)

(declare-fun c!29830 () Bool)

(assert (=> b!158479 (= c!29830 (= lt!81859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158479 (= e!103789 e!103790)))

(declare-fun lt!81858 () SeekEntryResult!296)

(declare-fun d!51183 () Bool)

(assert (=> d!51183 (and (or ((_ is Undefined!296) lt!81858) (not ((_ is Found!296) lt!81858)) (and (bvsge (index!3353 lt!81858) #b00000000000000000000000000000000) (bvslt (index!3353 lt!81858) (size!2951 (_keys!4982 thiss!1248))))) (or ((_ is Undefined!296) lt!81858) ((_ is Found!296) lt!81858) (not ((_ is MissingVacant!296) lt!81858)) (not (= (index!3355 lt!81858) (index!3354 lt!81851))) (and (bvsge (index!3355 lt!81858) #b00000000000000000000000000000000) (bvslt (index!3355 lt!81858) (size!2951 (_keys!4982 thiss!1248))))) (or ((_ is Undefined!296) lt!81858) (ite ((_ is Found!296) lt!81858) (= (select (arr!2669 (_keys!4982 thiss!1248)) (index!3353 lt!81858)) key!828) (and ((_ is MissingVacant!296) lt!81858) (= (index!3355 lt!81858) (index!3354 lt!81851)) (= (select (arr!2669 (_keys!4982 thiss!1248)) (index!3355 lt!81858)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51183 (= lt!81858 e!103788)))

(declare-fun c!29828 () Bool)

(assert (=> d!51183 (= c!29828 (bvsge (x!17478 lt!81851) #b01111111111111111111111111111110))))

(assert (=> d!51183 (= lt!81859 (select (arr!2669 (_keys!4982 thiss!1248)) (index!3354 lt!81851)))))

(assert (=> d!51183 (validMask!0 (mask!7710 thiss!1248))))

(assert (=> d!51183 (= (seekKeyOrZeroReturnVacant!0 (x!17478 lt!81851) (index!3354 lt!81851) (index!3354 lt!81851) key!828 (_keys!4982 thiss!1248) (mask!7710 thiss!1248)) lt!81858)))

(assert (= (and d!51183 c!29828) b!158482))

(assert (= (and d!51183 (not c!29828)) b!158481))

(assert (= (and b!158481 c!29829) b!158477))

(assert (= (and b!158481 (not c!29829)) b!158479))

(assert (= (and b!158479 c!29830) b!158478))

(assert (= (and b!158479 (not c!29830)) b!158480))

(declare-fun m!191197 () Bool)

(assert (=> b!158480 m!191197))

(assert (=> b!158480 m!191197))

(declare-fun m!191199 () Bool)

(assert (=> b!158480 m!191199))

(declare-fun m!191201 () Bool)

(assert (=> d!51183 m!191201))

(declare-fun m!191203 () Bool)

(assert (=> d!51183 m!191203))

(assert (=> d!51183 m!191185))

(assert (=> d!51183 m!191155))

(assert (=> b!158442 d!51183))

(declare-fun b!158501 () Bool)

(declare-fun e!103804 () SeekEntryResult!296)

(assert (=> b!158501 (= e!103804 (Intermediate!296 true (toIndex!0 key!828 (mask!7710 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158502 () Bool)

(declare-fun e!103801 () SeekEntryResult!296)

(assert (=> b!158502 (= e!103801 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7710 thiss!1248)) #b00000000000000000000000000000000 (mask!7710 thiss!1248)) key!828 (_keys!4982 thiss!1248) (mask!7710 thiss!1248)))))

(declare-fun b!158503 () Bool)

(declare-fun e!103802 () Bool)

(declare-fun e!103805 () Bool)

(assert (=> b!158503 (= e!103802 e!103805)))

(declare-fun res!74846 () Bool)

(declare-fun lt!81864 () SeekEntryResult!296)

(assert (=> b!158503 (= res!74846 (and ((_ is Intermediate!296) lt!81864) (not (undefined!1108 lt!81864)) (bvslt (x!17478 lt!81864) #b01111111111111111111111111111110) (bvsge (x!17478 lt!81864) #b00000000000000000000000000000000) (bvsge (x!17478 lt!81864) #b00000000000000000000000000000000)))))

(assert (=> b!158503 (=> (not res!74846) (not e!103805))))

(declare-fun b!158504 () Bool)

(assert (=> b!158504 (= e!103801 (Intermediate!296 false (toIndex!0 key!828 (mask!7710 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158505 () Bool)

(assert (=> b!158505 (= e!103802 (bvsge (x!17478 lt!81864) #b01111111111111111111111111111110))))

(declare-fun b!158506 () Bool)

(assert (=> b!158506 (and (bvsge (index!3354 lt!81864) #b00000000000000000000000000000000) (bvslt (index!3354 lt!81864) (size!2951 (_keys!4982 thiss!1248))))))

(declare-fun res!74847 () Bool)

(assert (=> b!158506 (= res!74847 (= (select (arr!2669 (_keys!4982 thiss!1248)) (index!3354 lt!81864)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103803 () Bool)

(assert (=> b!158506 (=> res!74847 e!103803)))

(declare-fun b!158507 () Bool)

(assert (=> b!158507 (and (bvsge (index!3354 lt!81864) #b00000000000000000000000000000000) (bvslt (index!3354 lt!81864) (size!2951 (_keys!4982 thiss!1248))))))

(assert (=> b!158507 (= e!103803 (= (select (arr!2669 (_keys!4982 thiss!1248)) (index!3354 lt!81864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158508 () Bool)

(assert (=> b!158508 (= e!103804 e!103801)))

(declare-fun c!29837 () Bool)

(declare-fun lt!81865 () (_ BitVec 64))

(assert (=> b!158508 (= c!29837 (or (= lt!81865 key!828) (= (bvadd lt!81865 lt!81865) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158509 () Bool)

(assert (=> b!158509 (and (bvsge (index!3354 lt!81864) #b00000000000000000000000000000000) (bvslt (index!3354 lt!81864) (size!2951 (_keys!4982 thiss!1248))))))

(declare-fun res!74845 () Bool)

(assert (=> b!158509 (= res!74845 (= (select (arr!2669 (_keys!4982 thiss!1248)) (index!3354 lt!81864)) key!828))))

(assert (=> b!158509 (=> res!74845 e!103803)))

(assert (=> b!158509 (= e!103805 e!103803)))

(declare-fun d!51185 () Bool)

(assert (=> d!51185 e!103802))

(declare-fun c!29838 () Bool)

(assert (=> d!51185 (= c!29838 (and ((_ is Intermediate!296) lt!81864) (undefined!1108 lt!81864)))))

(assert (=> d!51185 (= lt!81864 e!103804)))

(declare-fun c!29839 () Bool)

(assert (=> d!51185 (= c!29839 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51185 (= lt!81865 (select (arr!2669 (_keys!4982 thiss!1248)) (toIndex!0 key!828 (mask!7710 thiss!1248))))))

(assert (=> d!51185 (validMask!0 (mask!7710 thiss!1248))))

(assert (=> d!51185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7710 thiss!1248)) key!828 (_keys!4982 thiss!1248) (mask!7710 thiss!1248)) lt!81864)))

(assert (= (and d!51185 c!29839) b!158501))

(assert (= (and d!51185 (not c!29839)) b!158508))

(assert (= (and b!158508 c!29837) b!158504))

(assert (= (and b!158508 (not c!29837)) b!158502))

(assert (= (and d!51185 c!29838) b!158505))

(assert (= (and d!51185 (not c!29838)) b!158503))

(assert (= (and b!158503 res!74846) b!158509))

(assert (= (and b!158509 (not res!74845)) b!158506))

(assert (= (and b!158506 (not res!74847)) b!158507))

(assert (=> b!158502 m!191175))

(declare-fun m!191205 () Bool)

(assert (=> b!158502 m!191205))

(assert (=> b!158502 m!191205))

(declare-fun m!191207 () Bool)

(assert (=> b!158502 m!191207))

(declare-fun m!191209 () Bool)

(assert (=> b!158507 m!191209))

(assert (=> b!158506 m!191209))

(assert (=> d!51185 m!191175))

(declare-fun m!191211 () Bool)

(assert (=> d!51185 m!191211))

(assert (=> d!51185 m!191155))

(assert (=> b!158509 m!191209))

(assert (=> d!51173 d!51185))

(declare-fun d!51187 () Bool)

(declare-fun lt!81871 () (_ BitVec 32))

(declare-fun lt!81870 () (_ BitVec 32))

(assert (=> d!51187 (= lt!81871 (bvmul (bvxor lt!81870 (bvlshr lt!81870 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51187 (= lt!81870 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51187 (and (bvsge (mask!7710 thiss!1248) #b00000000000000000000000000000000) (let ((res!74848 (let ((h!2498 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17495 (bvmul (bvxor h!2498 (bvlshr h!2498 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17495 (bvlshr x!17495 #b00000000000000000000000000001101)) (mask!7710 thiss!1248)))))) (and (bvslt res!74848 (bvadd (mask!7710 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74848 #b00000000000000000000000000000000))))))

(assert (=> d!51187 (= (toIndex!0 key!828 (mask!7710 thiss!1248)) (bvand (bvxor lt!81871 (bvlshr lt!81871 #b00000000000000000000000000001101)) (mask!7710 thiss!1248)))))

(assert (=> d!51173 d!51187))

(assert (=> d!51173 d!51177))

(declare-fun b!158519 () Bool)

(declare-fun res!74858 () Bool)

(declare-fun e!103808 () Bool)

(assert (=> b!158519 (=> (not res!74858) (not e!103808))))

(declare-fun size!2955 (LongMapFixedSize!1506) (_ BitVec 32))

(assert (=> b!158519 (= res!74858 (bvsge (size!2955 thiss!1248) (_size!802 thiss!1248)))))

(declare-fun b!158518 () Bool)

(declare-fun res!74859 () Bool)

(assert (=> b!158518 (=> (not res!74859) (not e!103808))))

(assert (=> b!158518 (= res!74859 (and (= (size!2952 (_values!3178 thiss!1248)) (bvadd (mask!7710 thiss!1248) #b00000000000000000000000000000001)) (= (size!2951 (_keys!4982 thiss!1248)) (size!2952 (_values!3178 thiss!1248))) (bvsge (_size!802 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!802 thiss!1248) (bvadd (mask!7710 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!158520 () Bool)

(declare-fun res!74860 () Bool)

(assert (=> b!158520 (=> (not res!74860) (not e!103808))))

(assert (=> b!158520 (= res!74860 (= (size!2955 thiss!1248) (bvadd (_size!802 thiss!1248) (bvsdiv (bvadd (extraKeys!2936 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!158521 () Bool)

(assert (=> b!158521 (= e!103808 (and (bvsge (extraKeys!2936 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2936 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!802 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51189 () Bool)

(declare-fun res!74857 () Bool)

(assert (=> d!51189 (=> (not res!74857) (not e!103808))))

(assert (=> d!51189 (= res!74857 (validMask!0 (mask!7710 thiss!1248)))))

(assert (=> d!51189 (= (simpleValid!113 thiss!1248) e!103808)))

(assert (= (and d!51189 res!74857) b!158518))

(assert (= (and b!158518 res!74859) b!158519))

(assert (= (and b!158519 res!74858) b!158520))

(assert (= (and b!158520 res!74860) b!158521))

(declare-fun m!191213 () Bool)

(assert (=> b!158519 m!191213))

(assert (=> b!158520 m!191213))

(assert (=> d!51189 m!191155))

(assert (=> d!51175 d!51189))

(declare-fun b!158530 () Bool)

(declare-fun e!103816 () Bool)

(declare-fun call!17254 () Bool)

(assert (=> b!158530 (= e!103816 call!17254)))

(declare-fun b!158531 () Bool)

(declare-fun e!103817 () Bool)

(assert (=> b!158531 (= e!103817 e!103816)))

(declare-fun c!29842 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158531 (= c!29842 (validKeyInArray!0 (select (arr!2669 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51191 () Bool)

(declare-fun res!74865 () Bool)

(assert (=> d!51191 (=> res!74865 e!103817)))

(assert (=> d!51191 (= res!74865 (bvsge #b00000000000000000000000000000000 (size!2951 (_keys!4982 thiss!1248))))))

(assert (=> d!51191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4982 thiss!1248) (mask!7710 thiss!1248)) e!103817)))

(declare-fun bm!17251 () Bool)

(assert (=> bm!17251 (= call!17254 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4982 thiss!1248) (mask!7710 thiss!1248)))))

(declare-fun b!158532 () Bool)

(declare-fun e!103815 () Bool)

(assert (=> b!158532 (= e!103816 e!103815)))

(declare-fun lt!81880 () (_ BitVec 64))

(assert (=> b!158532 (= lt!81880 (select (arr!2669 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4986 0))(
  ( (Unit!4987) )
))
(declare-fun lt!81879 () Unit!4986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5639 (_ BitVec 64) (_ BitVec 32)) Unit!4986)

(assert (=> b!158532 (= lt!81879 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4982 thiss!1248) lt!81880 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158532 (arrayContainsKey!0 (_keys!4982 thiss!1248) lt!81880 #b00000000000000000000000000000000)))

(declare-fun lt!81878 () Unit!4986)

(assert (=> b!158532 (= lt!81878 lt!81879)))

(declare-fun res!74866 () Bool)

(assert (=> b!158532 (= res!74866 (= (seekEntryOrOpen!0 (select (arr!2669 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000) (_keys!4982 thiss!1248) (mask!7710 thiss!1248)) (Found!296 #b00000000000000000000000000000000)))))

(assert (=> b!158532 (=> (not res!74866) (not e!103815))))

(declare-fun b!158533 () Bool)

(assert (=> b!158533 (= e!103815 call!17254)))

(assert (= (and d!51191 (not res!74865)) b!158531))

(assert (= (and b!158531 c!29842) b!158532))

(assert (= (and b!158531 (not c!29842)) b!158530))

(assert (= (and b!158532 res!74866) b!158533))

(assert (= (or b!158533 b!158530) bm!17251))

(declare-fun m!191215 () Bool)

(assert (=> b!158531 m!191215))

(assert (=> b!158531 m!191215))

(declare-fun m!191217 () Bool)

(assert (=> b!158531 m!191217))

(declare-fun m!191219 () Bool)

(assert (=> bm!17251 m!191219))

(assert (=> b!158532 m!191215))

(declare-fun m!191221 () Bool)

(assert (=> b!158532 m!191221))

(declare-fun m!191223 () Bool)

(assert (=> b!158532 m!191223))

(assert (=> b!158532 m!191215))

(declare-fun m!191225 () Bool)

(assert (=> b!158532 m!191225))

(assert (=> b!158455 d!51191))

(declare-fun b!158543 () Bool)

(declare-fun e!103823 () (_ BitVec 32))

(declare-fun e!103822 () (_ BitVec 32))

(assert (=> b!158543 (= e!103823 e!103822)))

(declare-fun c!29848 () Bool)

(assert (=> b!158543 (= c!29848 (validKeyInArray!0 (select (arr!2669 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158544 () Bool)

(declare-fun call!17257 () (_ BitVec 32))

(assert (=> b!158544 (= e!103822 (bvadd #b00000000000000000000000000000001 call!17257))))

(declare-fun b!158545 () Bool)

(assert (=> b!158545 (= e!103823 #b00000000000000000000000000000000)))

(declare-fun bm!17254 () Bool)

(assert (=> bm!17254 (= call!17257 (arrayCountValidKeys!0 (_keys!4982 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2951 (_keys!4982 thiss!1248))))))

(declare-fun d!51193 () Bool)

(declare-fun lt!81883 () (_ BitVec 32))

(assert (=> d!51193 (and (bvsge lt!81883 #b00000000000000000000000000000000) (bvsle lt!81883 (bvsub (size!2951 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51193 (= lt!81883 e!103823)))

(declare-fun c!29847 () Bool)

(assert (=> d!51193 (= c!29847 (bvsge #b00000000000000000000000000000000 (size!2951 (_keys!4982 thiss!1248))))))

(assert (=> d!51193 (and (bvsle #b00000000000000000000000000000000 (size!2951 (_keys!4982 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2951 (_keys!4982 thiss!1248)) (size!2951 (_keys!4982 thiss!1248))))))

(assert (=> d!51193 (= (arrayCountValidKeys!0 (_keys!4982 thiss!1248) #b00000000000000000000000000000000 (size!2951 (_keys!4982 thiss!1248))) lt!81883)))

(declare-fun b!158542 () Bool)

(assert (=> b!158542 (= e!103822 call!17257)))

(assert (= (and d!51193 c!29847) b!158545))

(assert (= (and d!51193 (not c!29847)) b!158543))

(assert (= (and b!158543 c!29848) b!158544))

(assert (= (and b!158543 (not c!29848)) b!158542))

(assert (= (or b!158544 b!158542) bm!17254))

(assert (=> b!158543 m!191215))

(assert (=> b!158543 m!191215))

(assert (=> b!158543 m!191217))

(declare-fun m!191227 () Bool)

(assert (=> bm!17254 m!191227))

(assert (=> b!158454 d!51193))

(declare-fun b!158556 () Bool)

(declare-fun e!103834 () Bool)

(declare-fun call!17260 () Bool)

(assert (=> b!158556 (= e!103834 call!17260)))

(declare-fun d!51195 () Bool)

(declare-fun res!74874 () Bool)

(declare-fun e!103835 () Bool)

(assert (=> d!51195 (=> res!74874 e!103835)))

(assert (=> d!51195 (= res!74874 (bvsge #b00000000000000000000000000000000 (size!2951 (_keys!4982 thiss!1248))))))

(assert (=> d!51195 (= (arrayNoDuplicates!0 (_keys!4982 thiss!1248) #b00000000000000000000000000000000 Nil!1887) e!103835)))

(declare-fun b!158557 () Bool)

(declare-fun e!103832 () Bool)

(assert (=> b!158557 (= e!103832 e!103834)))

(declare-fun c!29851 () Bool)

(assert (=> b!158557 (= c!29851 (validKeyInArray!0 (select (arr!2669 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158558 () Bool)

(assert (=> b!158558 (= e!103834 call!17260)))

(declare-fun b!158559 () Bool)

(assert (=> b!158559 (= e!103835 e!103832)))

(declare-fun res!74875 () Bool)

(assert (=> b!158559 (=> (not res!74875) (not e!103832))))

(declare-fun e!103833 () Bool)

(assert (=> b!158559 (= res!74875 (not e!103833))))

(declare-fun res!74873 () Bool)

(assert (=> b!158559 (=> (not res!74873) (not e!103833))))

(assert (=> b!158559 (= res!74873 (validKeyInArray!0 (select (arr!2669 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17257 () Bool)

(assert (=> bm!17257 (= call!17260 (arrayNoDuplicates!0 (_keys!4982 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29851 (Cons!1886 (select (arr!2669 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000) Nil!1887) Nil!1887)))))

(declare-fun b!158560 () Bool)

(declare-fun contains!981 (List!1890 (_ BitVec 64)) Bool)

(assert (=> b!158560 (= e!103833 (contains!981 Nil!1887 (select (arr!2669 (_keys!4982 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51195 (not res!74874)) b!158559))

(assert (= (and b!158559 res!74873) b!158560))

(assert (= (and b!158559 res!74875) b!158557))

(assert (= (and b!158557 c!29851) b!158556))

(assert (= (and b!158557 (not c!29851)) b!158558))

(assert (= (or b!158556 b!158558) bm!17257))

(assert (=> b!158557 m!191215))

(assert (=> b!158557 m!191215))

(assert (=> b!158557 m!191217))

(assert (=> b!158559 m!191215))

(assert (=> b!158559 m!191215))

(assert (=> b!158559 m!191217))

(assert (=> bm!17257 m!191215))

(declare-fun m!191229 () Bool)

(assert (=> bm!17257 m!191229))

(assert (=> b!158560 m!191215))

(assert (=> b!158560 m!191215))

(declare-fun m!191231 () Bool)

(assert (=> b!158560 m!191231))

(assert (=> b!158456 d!51195))

(declare-fun mapIsEmpty!5605 () Bool)

(declare-fun mapRes!5605 () Bool)

(assert (=> mapIsEmpty!5605 mapRes!5605))

(declare-fun condMapEmpty!5605 () Bool)

(declare-fun mapDefault!5605 () ValueCell!1299)

(assert (=> mapNonEmpty!5604 (= condMapEmpty!5605 (= mapRest!5604 ((as const (Array (_ BitVec 32) ValueCell!1299)) mapDefault!5605)))))

(declare-fun e!103837 () Bool)

(assert (=> mapNonEmpty!5604 (= tp!13011 (and e!103837 mapRes!5605))))

(declare-fun b!158561 () Bool)

(declare-fun e!103836 () Bool)

(assert (=> b!158561 (= e!103836 tp_is_empty!3285)))

(declare-fun mapNonEmpty!5605 () Bool)

(declare-fun tp!13012 () Bool)

(assert (=> mapNonEmpty!5605 (= mapRes!5605 (and tp!13012 e!103836))))

(declare-fun mapRest!5605 () (Array (_ BitVec 32) ValueCell!1299))

(declare-fun mapValue!5605 () ValueCell!1299)

(declare-fun mapKey!5605 () (_ BitVec 32))

(assert (=> mapNonEmpty!5605 (= mapRest!5604 (store mapRest!5605 mapKey!5605 mapValue!5605))))

(declare-fun b!158562 () Bool)

(assert (=> b!158562 (= e!103837 tp_is_empty!3285)))

(assert (= (and mapNonEmpty!5604 condMapEmpty!5605) mapIsEmpty!5605))

(assert (= (and mapNonEmpty!5604 (not condMapEmpty!5605)) mapNonEmpty!5605))

(assert (= (and mapNonEmpty!5605 ((_ is ValueCellFull!1299) mapValue!5605)) b!158561))

(assert (= (and mapNonEmpty!5604 ((_ is ValueCellFull!1299) mapDefault!5605)) b!158562))

(declare-fun m!191233 () Bool)

(assert (=> mapNonEmpty!5605 m!191233))

(check-sat (not b!158557) (not b!158560) (not bm!17254) (not b!158520) (not b!158480) b_and!9897 (not bm!17251) (not mapNonEmpty!5605) (not d!51185) tp_is_empty!3285 (not b!158519) (not b!158532) (not b_next!3483) (not bm!17257) (not d!51183) (not b!158543) (not b!158502) (not b!158559) (not b!158531) (not d!51189))
(check-sat b_and!9897 (not b_next!3483))
