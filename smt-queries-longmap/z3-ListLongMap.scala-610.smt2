; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15890 () Bool)

(assert start!15890)

(declare-fun b!158113 () Bool)

(declare-fun b_free!3469 () Bool)

(declare-fun b_next!3469 () Bool)

(assert (=> b!158113 (= b_free!3469 (not b_next!3469))))

(declare-fun tp!12953 () Bool)

(declare-fun b_and!9897 () Bool)

(assert (=> b!158113 (= tp!12953 b_and!9897)))

(declare-fun res!74696 () Bool)

(declare-fun e!103546 () Bool)

(assert (=> start!15890 (=> (not res!74696) (not e!103546))))

(declare-datatypes ((V!4009 0))(
  ( (V!4010 (val!1680 Int)) )
))
(declare-datatypes ((ValueCell!1292 0))(
  ( (ValueCellFull!1292 (v!3546 V!4009)) (EmptyCell!1292) )
))
(declare-datatypes ((array!5593 0))(
  ( (array!5594 (arr!2648 (Array (_ BitVec 32) (_ BitVec 64))) (size!2929 (_ BitVec 32))) )
))
(declare-datatypes ((array!5595 0))(
  ( (array!5596 (arr!2649 (Array (_ BitVec 32) ValueCell!1292)) (size!2930 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1492 0))(
  ( (LongMapFixedSize!1493 (defaultEntry!3188 Int) (mask!7691 (_ BitVec 32)) (extraKeys!2929 (_ BitVec 32)) (zeroValue!3031 V!4009) (minValue!3031 V!4009) (_size!795 (_ BitVec 32)) (_keys!4970 array!5593) (_values!3171 array!5595) (_vacant!795 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1492)

(declare-fun valid!722 (LongMapFixedSize!1492) Bool)

(assert (=> start!15890 (= res!74696 (valid!722 thiss!1248))))

(assert (=> start!15890 e!103546))

(declare-fun e!103551 () Bool)

(assert (=> start!15890 e!103551))

(assert (=> start!15890 true))

(declare-fun b!158109 () Bool)

(declare-fun e!103550 () Bool)

(declare-fun tp_is_empty!3271 () Bool)

(assert (=> b!158109 (= e!103550 tp_is_empty!3271)))

(declare-fun b!158110 () Bool)

(declare-fun res!74698 () Bool)

(assert (=> b!158110 (=> (not res!74698) (not e!103546))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158110 (= res!74698 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5570 () Bool)

(declare-fun mapRes!5570 () Bool)

(assert (=> mapIsEmpty!5570 mapRes!5570))

(declare-fun b!158111 () Bool)

(declare-fun res!74697 () Bool)

(assert (=> b!158111 (=> (not res!74697) (not e!103546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158111 (= res!74697 (validMask!0 (mask!7691 thiss!1248)))))

(declare-fun b!158112 () Bool)

(assert (=> b!158112 (= e!103546 (and (= (size!2930 (_values!3171 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7691 thiss!1248))) (not (= (size!2929 (_keys!4970 thiss!1248)) (size!2930 (_values!3171 thiss!1248))))))))

(declare-fun e!103548 () Bool)

(declare-fun array_inv!1687 (array!5593) Bool)

(declare-fun array_inv!1688 (array!5595) Bool)

(assert (=> b!158113 (= e!103551 (and tp!12953 tp_is_empty!3271 (array_inv!1687 (_keys!4970 thiss!1248)) (array_inv!1688 (_values!3171 thiss!1248)) e!103548))))

(declare-fun mapNonEmpty!5570 () Bool)

(declare-fun tp!12952 () Bool)

(declare-fun e!103547 () Bool)

(assert (=> mapNonEmpty!5570 (= mapRes!5570 (and tp!12952 e!103547))))

(declare-fun mapRest!5570 () (Array (_ BitVec 32) ValueCell!1292))

(declare-fun mapKey!5570 () (_ BitVec 32))

(declare-fun mapValue!5570 () ValueCell!1292)

(assert (=> mapNonEmpty!5570 (= (arr!2649 (_values!3171 thiss!1248)) (store mapRest!5570 mapKey!5570 mapValue!5570))))

(declare-fun b!158114 () Bool)

(assert (=> b!158114 (= e!103548 (and e!103550 mapRes!5570))))

(declare-fun condMapEmpty!5570 () Bool)

(declare-fun mapDefault!5570 () ValueCell!1292)

(assert (=> b!158114 (= condMapEmpty!5570 (= (arr!2649 (_values!3171 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1292)) mapDefault!5570)))))

(declare-fun b!158115 () Bool)

(declare-fun res!74699 () Bool)

(assert (=> b!158115 (=> (not res!74699) (not e!103546))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!286 0))(
  ( (MissingZero!286 (index!3312 (_ BitVec 32))) (Found!286 (index!3313 (_ BitVec 32))) (Intermediate!286 (undefined!1098 Bool) (index!3314 (_ BitVec 32)) (x!17427 (_ BitVec 32))) (Undefined!286) (MissingVacant!286 (index!3315 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5593 (_ BitVec 32)) SeekEntryResult!286)

(assert (=> b!158115 (= res!74699 ((_ is Undefined!286) (seekEntryOrOpen!0 key!828 (_keys!4970 thiss!1248) (mask!7691 thiss!1248))))))

(declare-fun b!158116 () Bool)

(assert (=> b!158116 (= e!103547 tp_is_empty!3271)))

(assert (= (and start!15890 res!74696) b!158110))

(assert (= (and b!158110 res!74698) b!158115))

(assert (= (and b!158115 res!74699) b!158111))

(assert (= (and b!158111 res!74697) b!158112))

(assert (= (and b!158114 condMapEmpty!5570) mapIsEmpty!5570))

(assert (= (and b!158114 (not condMapEmpty!5570)) mapNonEmpty!5570))

(assert (= (and mapNonEmpty!5570 ((_ is ValueCellFull!1292) mapValue!5570)) b!158116))

(assert (= (and b!158114 ((_ is ValueCellFull!1292) mapDefault!5570)) b!158109))

(assert (= b!158113 b!158114))

(assert (= start!15890 b!158113))

(declare-fun m!191161 () Bool)

(assert (=> b!158115 m!191161))

(declare-fun m!191163 () Bool)

(assert (=> mapNonEmpty!5570 m!191163))

(declare-fun m!191165 () Bool)

(assert (=> b!158113 m!191165))

(declare-fun m!191167 () Bool)

(assert (=> b!158113 m!191167))

(declare-fun m!191169 () Bool)

(assert (=> b!158111 m!191169))

(declare-fun m!191171 () Bool)

(assert (=> start!15890 m!191171))

(check-sat (not b!158113) (not start!15890) b_and!9897 (not mapNonEmpty!5570) tp_is_empty!3271 (not b!158111) (not b_next!3469) (not b!158115))
(check-sat b_and!9897 (not b_next!3469))
(get-model)

(declare-fun d!51209 () Bool)

(declare-fun lt!81864 () SeekEntryResult!286)

(assert (=> d!51209 (and (or ((_ is Undefined!286) lt!81864) (not ((_ is Found!286) lt!81864)) (and (bvsge (index!3313 lt!81864) #b00000000000000000000000000000000) (bvslt (index!3313 lt!81864) (size!2929 (_keys!4970 thiss!1248))))) (or ((_ is Undefined!286) lt!81864) ((_ is Found!286) lt!81864) (not ((_ is MissingZero!286) lt!81864)) (and (bvsge (index!3312 lt!81864) #b00000000000000000000000000000000) (bvslt (index!3312 lt!81864) (size!2929 (_keys!4970 thiss!1248))))) (or ((_ is Undefined!286) lt!81864) ((_ is Found!286) lt!81864) ((_ is MissingZero!286) lt!81864) (not ((_ is MissingVacant!286) lt!81864)) (and (bvsge (index!3315 lt!81864) #b00000000000000000000000000000000) (bvslt (index!3315 lt!81864) (size!2929 (_keys!4970 thiss!1248))))) (or ((_ is Undefined!286) lt!81864) (ite ((_ is Found!286) lt!81864) (= (select (arr!2648 (_keys!4970 thiss!1248)) (index!3313 lt!81864)) key!828) (ite ((_ is MissingZero!286) lt!81864) (= (select (arr!2648 (_keys!4970 thiss!1248)) (index!3312 lt!81864)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!286) lt!81864) (= (select (arr!2648 (_keys!4970 thiss!1248)) (index!3315 lt!81864)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103594 () SeekEntryResult!286)

(assert (=> d!51209 (= lt!81864 e!103594)))

(declare-fun c!29785 () Bool)

(declare-fun lt!81863 () SeekEntryResult!286)

(assert (=> d!51209 (= c!29785 (and ((_ is Intermediate!286) lt!81863) (undefined!1098 lt!81863)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5593 (_ BitVec 32)) SeekEntryResult!286)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51209 (= lt!81863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7691 thiss!1248)) key!828 (_keys!4970 thiss!1248) (mask!7691 thiss!1248)))))

(assert (=> d!51209 (validMask!0 (mask!7691 thiss!1248))))

(assert (=> d!51209 (= (seekEntryOrOpen!0 key!828 (_keys!4970 thiss!1248) (mask!7691 thiss!1248)) lt!81864)))

(declare-fun b!158177 () Bool)

(declare-fun e!103595 () SeekEntryResult!286)

(assert (=> b!158177 (= e!103595 (Found!286 (index!3314 lt!81863)))))

(declare-fun b!158178 () Bool)

(declare-fun e!103596 () SeekEntryResult!286)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5593 (_ BitVec 32)) SeekEntryResult!286)

(assert (=> b!158178 (= e!103596 (seekKeyOrZeroReturnVacant!0 (x!17427 lt!81863) (index!3314 lt!81863) (index!3314 lt!81863) key!828 (_keys!4970 thiss!1248) (mask!7691 thiss!1248)))))

(declare-fun b!158179 () Bool)

(assert (=> b!158179 (= e!103594 Undefined!286)))

(declare-fun b!158180 () Bool)

(assert (=> b!158180 (= e!103594 e!103595)))

(declare-fun lt!81862 () (_ BitVec 64))

(assert (=> b!158180 (= lt!81862 (select (arr!2648 (_keys!4970 thiss!1248)) (index!3314 lt!81863)))))

(declare-fun c!29784 () Bool)

(assert (=> b!158180 (= c!29784 (= lt!81862 key!828))))

(declare-fun b!158181 () Bool)

(declare-fun c!29786 () Bool)

(assert (=> b!158181 (= c!29786 (= lt!81862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158181 (= e!103595 e!103596)))

(declare-fun b!158182 () Bool)

(assert (=> b!158182 (= e!103596 (MissingZero!286 (index!3314 lt!81863)))))

(assert (= (and d!51209 c!29785) b!158179))

(assert (= (and d!51209 (not c!29785)) b!158180))

(assert (= (and b!158180 c!29784) b!158177))

(assert (= (and b!158180 (not c!29784)) b!158181))

(assert (= (and b!158181 c!29786) b!158182))

(assert (= (and b!158181 (not c!29786)) b!158178))

(assert (=> d!51209 m!191169))

(declare-fun m!191197 () Bool)

(assert (=> d!51209 m!191197))

(declare-fun m!191199 () Bool)

(assert (=> d!51209 m!191199))

(declare-fun m!191201 () Bool)

(assert (=> d!51209 m!191201))

(assert (=> d!51209 m!191197))

(declare-fun m!191203 () Bool)

(assert (=> d!51209 m!191203))

(declare-fun m!191205 () Bool)

(assert (=> d!51209 m!191205))

(declare-fun m!191207 () Bool)

(assert (=> b!158178 m!191207))

(declare-fun m!191209 () Bool)

(assert (=> b!158180 m!191209))

(assert (=> b!158115 d!51209))

(declare-fun d!51211 () Bool)

(assert (=> d!51211 (= (array_inv!1687 (_keys!4970 thiss!1248)) (bvsge (size!2929 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158113 d!51211))

(declare-fun d!51213 () Bool)

(assert (=> d!51213 (= (array_inv!1688 (_values!3171 thiss!1248)) (bvsge (size!2930 (_values!3171 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158113 d!51213))

(declare-fun d!51215 () Bool)

(assert (=> d!51215 (= (validMask!0 (mask!7691 thiss!1248)) (and (or (= (mask!7691 thiss!1248) #b00000000000000000000000000000111) (= (mask!7691 thiss!1248) #b00000000000000000000000000001111) (= (mask!7691 thiss!1248) #b00000000000000000000000000011111) (= (mask!7691 thiss!1248) #b00000000000000000000000000111111) (= (mask!7691 thiss!1248) #b00000000000000000000000001111111) (= (mask!7691 thiss!1248) #b00000000000000000000000011111111) (= (mask!7691 thiss!1248) #b00000000000000000000000111111111) (= (mask!7691 thiss!1248) #b00000000000000000000001111111111) (= (mask!7691 thiss!1248) #b00000000000000000000011111111111) (= (mask!7691 thiss!1248) #b00000000000000000000111111111111) (= (mask!7691 thiss!1248) #b00000000000000000001111111111111) (= (mask!7691 thiss!1248) #b00000000000000000011111111111111) (= (mask!7691 thiss!1248) #b00000000000000000111111111111111) (= (mask!7691 thiss!1248) #b00000000000000001111111111111111) (= (mask!7691 thiss!1248) #b00000000000000011111111111111111) (= (mask!7691 thiss!1248) #b00000000000000111111111111111111) (= (mask!7691 thiss!1248) #b00000000000001111111111111111111) (= (mask!7691 thiss!1248) #b00000000000011111111111111111111) (= (mask!7691 thiss!1248) #b00000000000111111111111111111111) (= (mask!7691 thiss!1248) #b00000000001111111111111111111111) (= (mask!7691 thiss!1248) #b00000000011111111111111111111111) (= (mask!7691 thiss!1248) #b00000000111111111111111111111111) (= (mask!7691 thiss!1248) #b00000001111111111111111111111111) (= (mask!7691 thiss!1248) #b00000011111111111111111111111111) (= (mask!7691 thiss!1248) #b00000111111111111111111111111111) (= (mask!7691 thiss!1248) #b00001111111111111111111111111111) (= (mask!7691 thiss!1248) #b00011111111111111111111111111111) (= (mask!7691 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7691 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158111 d!51215))

(declare-fun d!51217 () Bool)

(declare-fun res!74730 () Bool)

(declare-fun e!103599 () Bool)

(assert (=> d!51217 (=> (not res!74730) (not e!103599))))

(declare-fun simpleValid!111 (LongMapFixedSize!1492) Bool)

(assert (=> d!51217 (= res!74730 (simpleValid!111 thiss!1248))))

(assert (=> d!51217 (= (valid!722 thiss!1248) e!103599)))

(declare-fun b!158189 () Bool)

(declare-fun res!74731 () Bool)

(assert (=> b!158189 (=> (not res!74731) (not e!103599))))

(declare-fun arrayCountValidKeys!0 (array!5593 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158189 (= res!74731 (= (arrayCountValidKeys!0 (_keys!4970 thiss!1248) #b00000000000000000000000000000000 (size!2929 (_keys!4970 thiss!1248))) (_size!795 thiss!1248)))))

(declare-fun b!158190 () Bool)

(declare-fun res!74732 () Bool)

(assert (=> b!158190 (=> (not res!74732) (not e!103599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5593 (_ BitVec 32)) Bool)

(assert (=> b!158190 (= res!74732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4970 thiss!1248) (mask!7691 thiss!1248)))))

(declare-fun b!158191 () Bool)

(declare-datatypes ((List!1872 0))(
  ( (Nil!1869) (Cons!1868 (h!2478 (_ BitVec 64)) (t!6666 List!1872)) )
))
(declare-fun arrayNoDuplicates!0 (array!5593 (_ BitVec 32) List!1872) Bool)

(assert (=> b!158191 (= e!103599 (arrayNoDuplicates!0 (_keys!4970 thiss!1248) #b00000000000000000000000000000000 Nil!1869))))

(assert (= (and d!51217 res!74730) b!158189))

(assert (= (and b!158189 res!74731) b!158190))

(assert (= (and b!158190 res!74732) b!158191))

(declare-fun m!191211 () Bool)

(assert (=> d!51217 m!191211))

(declare-fun m!191213 () Bool)

(assert (=> b!158189 m!191213))

(declare-fun m!191215 () Bool)

(assert (=> b!158190 m!191215))

(declare-fun m!191217 () Bool)

(assert (=> b!158191 m!191217))

(assert (=> start!15890 d!51217))

(declare-fun mapIsEmpty!5579 () Bool)

(declare-fun mapRes!5579 () Bool)

(assert (=> mapIsEmpty!5579 mapRes!5579))

(declare-fun mapNonEmpty!5579 () Bool)

(declare-fun tp!12968 () Bool)

(declare-fun e!103605 () Bool)

(assert (=> mapNonEmpty!5579 (= mapRes!5579 (and tp!12968 e!103605))))

(declare-fun mapValue!5579 () ValueCell!1292)

(declare-fun mapKey!5579 () (_ BitVec 32))

(declare-fun mapRest!5579 () (Array (_ BitVec 32) ValueCell!1292))

(assert (=> mapNonEmpty!5579 (= mapRest!5570 (store mapRest!5579 mapKey!5579 mapValue!5579))))

(declare-fun condMapEmpty!5579 () Bool)

(declare-fun mapDefault!5579 () ValueCell!1292)

(assert (=> mapNonEmpty!5570 (= condMapEmpty!5579 (= mapRest!5570 ((as const (Array (_ BitVec 32) ValueCell!1292)) mapDefault!5579)))))

(declare-fun e!103604 () Bool)

(assert (=> mapNonEmpty!5570 (= tp!12952 (and e!103604 mapRes!5579))))

(declare-fun b!158199 () Bool)

(assert (=> b!158199 (= e!103604 tp_is_empty!3271)))

(declare-fun b!158198 () Bool)

(assert (=> b!158198 (= e!103605 tp_is_empty!3271)))

(assert (= (and mapNonEmpty!5570 condMapEmpty!5579) mapIsEmpty!5579))

(assert (= (and mapNonEmpty!5570 (not condMapEmpty!5579)) mapNonEmpty!5579))

(assert (= (and mapNonEmpty!5579 ((_ is ValueCellFull!1292) mapValue!5579)) b!158198))

(assert (= (and mapNonEmpty!5570 ((_ is ValueCellFull!1292) mapDefault!5579)) b!158199))

(declare-fun m!191219 () Bool)

(assert (=> mapNonEmpty!5579 m!191219))

(check-sat b_and!9897 (not d!51217) (not b!158190) (not b!158191) (not b_next!3469) (not mapNonEmpty!5579) (not d!51209) (not b!158189) (not b!158178) tp_is_empty!3271)
(check-sat b_and!9897 (not b_next!3469))
(get-model)

(declare-fun b!158208 () Bool)

(declare-fun res!74744 () Bool)

(declare-fun e!103608 () Bool)

(assert (=> b!158208 (=> (not res!74744) (not e!103608))))

(assert (=> b!158208 (= res!74744 (and (= (size!2930 (_values!3171 thiss!1248)) (bvadd (mask!7691 thiss!1248) #b00000000000000000000000000000001)) (= (size!2929 (_keys!4970 thiss!1248)) (size!2930 (_values!3171 thiss!1248))) (bvsge (_size!795 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!795 thiss!1248) (bvadd (mask!7691 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!51219 () Bool)

(declare-fun res!74743 () Bool)

(assert (=> d!51219 (=> (not res!74743) (not e!103608))))

(assert (=> d!51219 (= res!74743 (validMask!0 (mask!7691 thiss!1248)))))

(assert (=> d!51219 (= (simpleValid!111 thiss!1248) e!103608)))

(declare-fun b!158211 () Bool)

(assert (=> b!158211 (= e!103608 (and (bvsge (extraKeys!2929 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2929 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!795 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158210 () Bool)

(declare-fun res!74741 () Bool)

(assert (=> b!158210 (=> (not res!74741) (not e!103608))))

(declare-fun size!2935 (LongMapFixedSize!1492) (_ BitVec 32))

(assert (=> b!158210 (= res!74741 (= (size!2935 thiss!1248) (bvadd (_size!795 thiss!1248) (bvsdiv (bvadd (extraKeys!2929 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!158209 () Bool)

(declare-fun res!74742 () Bool)

(assert (=> b!158209 (=> (not res!74742) (not e!103608))))

(assert (=> b!158209 (= res!74742 (bvsge (size!2935 thiss!1248) (_size!795 thiss!1248)))))

(assert (= (and d!51219 res!74743) b!158208))

(assert (= (and b!158208 res!74744) b!158209))

(assert (= (and b!158209 res!74742) b!158210))

(assert (= (and b!158210 res!74741) b!158211))

(assert (=> d!51219 m!191169))

(declare-fun m!191221 () Bool)

(assert (=> b!158210 m!191221))

(assert (=> b!158209 m!191221))

(assert (=> d!51217 d!51219))

(declare-fun b!158220 () Bool)

(declare-fun e!103616 () Bool)

(declare-fun call!17233 () Bool)

(assert (=> b!158220 (= e!103616 call!17233)))

(declare-fun b!158221 () Bool)

(declare-fun e!103615 () Bool)

(assert (=> b!158221 (= e!103616 e!103615)))

(declare-fun lt!81872 () (_ BitVec 64))

(assert (=> b!158221 (= lt!81872 (select (arr!2648 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4989 0))(
  ( (Unit!4990) )
))
(declare-fun lt!81871 () Unit!4989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5593 (_ BitVec 64) (_ BitVec 32)) Unit!4989)

(assert (=> b!158221 (= lt!81871 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4970 thiss!1248) lt!81872 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158221 (arrayContainsKey!0 (_keys!4970 thiss!1248) lt!81872 #b00000000000000000000000000000000)))

(declare-fun lt!81873 () Unit!4989)

(assert (=> b!158221 (= lt!81873 lt!81871)))

(declare-fun res!74750 () Bool)

(assert (=> b!158221 (= res!74750 (= (seekEntryOrOpen!0 (select (arr!2648 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000) (_keys!4970 thiss!1248) (mask!7691 thiss!1248)) (Found!286 #b00000000000000000000000000000000)))))

(assert (=> b!158221 (=> (not res!74750) (not e!103615))))

(declare-fun d!51221 () Bool)

(declare-fun res!74749 () Bool)

(declare-fun e!103617 () Bool)

(assert (=> d!51221 (=> res!74749 e!103617)))

(assert (=> d!51221 (= res!74749 (bvsge #b00000000000000000000000000000000 (size!2929 (_keys!4970 thiss!1248))))))

(assert (=> d!51221 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4970 thiss!1248) (mask!7691 thiss!1248)) e!103617)))

(declare-fun b!158222 () Bool)

(assert (=> b!158222 (= e!103617 e!103616)))

(declare-fun c!29789 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158222 (= c!29789 (validKeyInArray!0 (select (arr!2648 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17230 () Bool)

(assert (=> bm!17230 (= call!17233 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4970 thiss!1248) (mask!7691 thiss!1248)))))

(declare-fun b!158223 () Bool)

(assert (=> b!158223 (= e!103615 call!17233)))

(assert (= (and d!51221 (not res!74749)) b!158222))

(assert (= (and b!158222 c!29789) b!158221))

(assert (= (and b!158222 (not c!29789)) b!158220))

(assert (= (and b!158221 res!74750) b!158223))

(assert (= (or b!158223 b!158220) bm!17230))

(declare-fun m!191223 () Bool)

(assert (=> b!158221 m!191223))

(declare-fun m!191225 () Bool)

(assert (=> b!158221 m!191225))

(declare-fun m!191227 () Bool)

(assert (=> b!158221 m!191227))

(assert (=> b!158221 m!191223))

(declare-fun m!191229 () Bool)

(assert (=> b!158221 m!191229))

(assert (=> b!158222 m!191223))

(assert (=> b!158222 m!191223))

(declare-fun m!191231 () Bool)

(assert (=> b!158222 m!191231))

(declare-fun m!191233 () Bool)

(assert (=> bm!17230 m!191233))

(assert (=> b!158190 d!51221))

(declare-fun b!158234 () Bool)

(declare-fun e!103626 () Bool)

(declare-fun e!103628 () Bool)

(assert (=> b!158234 (= e!103626 e!103628)))

(declare-fun res!74759 () Bool)

(assert (=> b!158234 (=> (not res!74759) (not e!103628))))

(declare-fun e!103629 () Bool)

(assert (=> b!158234 (= res!74759 (not e!103629))))

(declare-fun res!74757 () Bool)

(assert (=> b!158234 (=> (not res!74757) (not e!103629))))

(assert (=> b!158234 (= res!74757 (validKeyInArray!0 (select (arr!2648 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158235 () Bool)

(declare-fun contains!963 (List!1872 (_ BitVec 64)) Bool)

(assert (=> b!158235 (= e!103629 (contains!963 Nil!1869 (select (arr!2648 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158236 () Bool)

(declare-fun e!103627 () Bool)

(declare-fun call!17236 () Bool)

(assert (=> b!158236 (= e!103627 call!17236)))

(declare-fun b!158237 () Bool)

(assert (=> b!158237 (= e!103628 e!103627)))

(declare-fun c!29792 () Bool)

(assert (=> b!158237 (= c!29792 (validKeyInArray!0 (select (arr!2648 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51223 () Bool)

(declare-fun res!74758 () Bool)

(assert (=> d!51223 (=> res!74758 e!103626)))

(assert (=> d!51223 (= res!74758 (bvsge #b00000000000000000000000000000000 (size!2929 (_keys!4970 thiss!1248))))))

(assert (=> d!51223 (= (arrayNoDuplicates!0 (_keys!4970 thiss!1248) #b00000000000000000000000000000000 Nil!1869) e!103626)))

(declare-fun b!158238 () Bool)

(assert (=> b!158238 (= e!103627 call!17236)))

(declare-fun bm!17233 () Bool)

(assert (=> bm!17233 (= call!17236 (arrayNoDuplicates!0 (_keys!4970 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29792 (Cons!1868 (select (arr!2648 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000) Nil!1869) Nil!1869)))))

(assert (= (and d!51223 (not res!74758)) b!158234))

(assert (= (and b!158234 res!74757) b!158235))

(assert (= (and b!158234 res!74759) b!158237))

(assert (= (and b!158237 c!29792) b!158236))

(assert (= (and b!158237 (not c!29792)) b!158238))

(assert (= (or b!158236 b!158238) bm!17233))

(assert (=> b!158234 m!191223))

(assert (=> b!158234 m!191223))

(assert (=> b!158234 m!191231))

(assert (=> b!158235 m!191223))

(assert (=> b!158235 m!191223))

(declare-fun m!191235 () Bool)

(assert (=> b!158235 m!191235))

(assert (=> b!158237 m!191223))

(assert (=> b!158237 m!191223))

(assert (=> b!158237 m!191231))

(assert (=> bm!17233 m!191223))

(declare-fun m!191237 () Bool)

(assert (=> bm!17233 m!191237))

(assert (=> b!158191 d!51223))

(declare-fun b!158251 () Bool)

(declare-fun e!103636 () SeekEntryResult!286)

(assert (=> b!158251 (= e!103636 Undefined!286)))

(declare-fun b!158252 () Bool)

(declare-fun e!103638 () SeekEntryResult!286)

(assert (=> b!158252 (= e!103636 e!103638)))

(declare-fun c!29799 () Bool)

(declare-fun lt!81878 () (_ BitVec 64))

(assert (=> b!158252 (= c!29799 (= lt!81878 key!828))))

(declare-fun b!158253 () Bool)

(declare-fun e!103637 () SeekEntryResult!286)

(assert (=> b!158253 (= e!103637 (MissingVacant!286 (index!3314 lt!81863)))))

(declare-fun lt!81879 () SeekEntryResult!286)

(declare-fun d!51225 () Bool)

(assert (=> d!51225 (and (or ((_ is Undefined!286) lt!81879) (not ((_ is Found!286) lt!81879)) (and (bvsge (index!3313 lt!81879) #b00000000000000000000000000000000) (bvslt (index!3313 lt!81879) (size!2929 (_keys!4970 thiss!1248))))) (or ((_ is Undefined!286) lt!81879) ((_ is Found!286) lt!81879) (not ((_ is MissingVacant!286) lt!81879)) (not (= (index!3315 lt!81879) (index!3314 lt!81863))) (and (bvsge (index!3315 lt!81879) #b00000000000000000000000000000000) (bvslt (index!3315 lt!81879) (size!2929 (_keys!4970 thiss!1248))))) (or ((_ is Undefined!286) lt!81879) (ite ((_ is Found!286) lt!81879) (= (select (arr!2648 (_keys!4970 thiss!1248)) (index!3313 lt!81879)) key!828) (and ((_ is MissingVacant!286) lt!81879) (= (index!3315 lt!81879) (index!3314 lt!81863)) (= (select (arr!2648 (_keys!4970 thiss!1248)) (index!3315 lt!81879)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51225 (= lt!81879 e!103636)))

(declare-fun c!29800 () Bool)

(assert (=> d!51225 (= c!29800 (bvsge (x!17427 lt!81863) #b01111111111111111111111111111110))))

(assert (=> d!51225 (= lt!81878 (select (arr!2648 (_keys!4970 thiss!1248)) (index!3314 lt!81863)))))

(assert (=> d!51225 (validMask!0 (mask!7691 thiss!1248))))

(assert (=> d!51225 (= (seekKeyOrZeroReturnVacant!0 (x!17427 lt!81863) (index!3314 lt!81863) (index!3314 lt!81863) key!828 (_keys!4970 thiss!1248) (mask!7691 thiss!1248)) lt!81879)))

(declare-fun b!158254 () Bool)

(declare-fun c!29801 () Bool)

(assert (=> b!158254 (= c!29801 (= lt!81878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158254 (= e!103638 e!103637)))

(declare-fun b!158255 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158255 (= e!103637 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17427 lt!81863) #b00000000000000000000000000000001) (nextIndex!0 (index!3314 lt!81863) (bvadd (x!17427 lt!81863) #b00000000000000000000000000000001) (mask!7691 thiss!1248)) (index!3314 lt!81863) key!828 (_keys!4970 thiss!1248) (mask!7691 thiss!1248)))))

(declare-fun b!158256 () Bool)

(assert (=> b!158256 (= e!103638 (Found!286 (index!3314 lt!81863)))))

(assert (= (and d!51225 c!29800) b!158251))

(assert (= (and d!51225 (not c!29800)) b!158252))

(assert (= (and b!158252 c!29799) b!158256))

(assert (= (and b!158252 (not c!29799)) b!158254))

(assert (= (and b!158254 c!29801) b!158253))

(assert (= (and b!158254 (not c!29801)) b!158255))

(declare-fun m!191239 () Bool)

(assert (=> d!51225 m!191239))

(declare-fun m!191241 () Bool)

(assert (=> d!51225 m!191241))

(assert (=> d!51225 m!191209))

(assert (=> d!51225 m!191169))

(declare-fun m!191243 () Bool)

(assert (=> b!158255 m!191243))

(assert (=> b!158255 m!191243))

(declare-fun m!191245 () Bool)

(assert (=> b!158255 m!191245))

(assert (=> b!158178 d!51225))

(declare-fun b!158265 () Bool)

(declare-fun e!103644 () (_ BitVec 32))

(declare-fun call!17239 () (_ BitVec 32))

(assert (=> b!158265 (= e!103644 call!17239)))

(declare-fun bm!17236 () Bool)

(assert (=> bm!17236 (= call!17239 (arrayCountValidKeys!0 (_keys!4970 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2929 (_keys!4970 thiss!1248))))))

(declare-fun b!158266 () Bool)

(assert (=> b!158266 (= e!103644 (bvadd #b00000000000000000000000000000001 call!17239))))

(declare-fun d!51227 () Bool)

(declare-fun lt!81882 () (_ BitVec 32))

(assert (=> d!51227 (and (bvsge lt!81882 #b00000000000000000000000000000000) (bvsle lt!81882 (bvsub (size!2929 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103643 () (_ BitVec 32))

(assert (=> d!51227 (= lt!81882 e!103643)))

(declare-fun c!29806 () Bool)

(assert (=> d!51227 (= c!29806 (bvsge #b00000000000000000000000000000000 (size!2929 (_keys!4970 thiss!1248))))))

(assert (=> d!51227 (and (bvsle #b00000000000000000000000000000000 (size!2929 (_keys!4970 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2929 (_keys!4970 thiss!1248)) (size!2929 (_keys!4970 thiss!1248))))))

(assert (=> d!51227 (= (arrayCountValidKeys!0 (_keys!4970 thiss!1248) #b00000000000000000000000000000000 (size!2929 (_keys!4970 thiss!1248))) lt!81882)))

(declare-fun b!158267 () Bool)

(assert (=> b!158267 (= e!103643 #b00000000000000000000000000000000)))

(declare-fun b!158268 () Bool)

(assert (=> b!158268 (= e!103643 e!103644)))

(declare-fun c!29807 () Bool)

(assert (=> b!158268 (= c!29807 (validKeyInArray!0 (select (arr!2648 (_keys!4970 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51227 c!29806) b!158267))

(assert (= (and d!51227 (not c!29806)) b!158268))

(assert (= (and b!158268 c!29807) b!158266))

(assert (= (and b!158268 (not c!29807)) b!158265))

(assert (= (or b!158266 b!158265) bm!17236))

(declare-fun m!191247 () Bool)

(assert (=> bm!17236 m!191247))

(assert (=> b!158268 m!191223))

(assert (=> b!158268 m!191223))

(assert (=> b!158268 m!191231))

(assert (=> b!158189 d!51227))

(declare-fun b!158287 () Bool)

(declare-fun e!103656 () SeekEntryResult!286)

(assert (=> b!158287 (= e!103656 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7691 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!7691 thiss!1248)) key!828 (_keys!4970 thiss!1248) (mask!7691 thiss!1248)))))

(declare-fun b!158288 () Bool)

(declare-fun e!103655 () Bool)

(declare-fun e!103658 () Bool)

(assert (=> b!158288 (= e!103655 e!103658)))

(declare-fun res!74766 () Bool)

(declare-fun lt!81887 () SeekEntryResult!286)

(assert (=> b!158288 (= res!74766 (and ((_ is Intermediate!286) lt!81887) (not (undefined!1098 lt!81887)) (bvslt (x!17427 lt!81887) #b01111111111111111111111111111110) (bvsge (x!17427 lt!81887) #b00000000000000000000000000000000) (bvsge (x!17427 lt!81887) #b00000000000000000000000000000000)))))

(assert (=> b!158288 (=> (not res!74766) (not e!103658))))

(declare-fun b!158289 () Bool)

(assert (=> b!158289 (and (bvsge (index!3314 lt!81887) #b00000000000000000000000000000000) (bvslt (index!3314 lt!81887) (size!2929 (_keys!4970 thiss!1248))))))

(declare-fun res!74768 () Bool)

(assert (=> b!158289 (= res!74768 (= (select (arr!2648 (_keys!4970 thiss!1248)) (index!3314 lt!81887)) key!828))))

(declare-fun e!103659 () Bool)

(assert (=> b!158289 (=> res!74768 e!103659)))

(assert (=> b!158289 (= e!103658 e!103659)))

(declare-fun b!158290 () Bool)

(assert (=> b!158290 (= e!103656 (Intermediate!286 false (toIndex!0 key!828 (mask!7691 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!51229 () Bool)

(assert (=> d!51229 e!103655))

(declare-fun c!29814 () Bool)

(assert (=> d!51229 (= c!29814 (and ((_ is Intermediate!286) lt!81887) (undefined!1098 lt!81887)))))

(declare-fun e!103657 () SeekEntryResult!286)

(assert (=> d!51229 (= lt!81887 e!103657)))

(declare-fun c!29815 () Bool)

(assert (=> d!51229 (= c!29815 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!81888 () (_ BitVec 64))

(assert (=> d!51229 (= lt!81888 (select (arr!2648 (_keys!4970 thiss!1248)) (toIndex!0 key!828 (mask!7691 thiss!1248))))))

(assert (=> d!51229 (validMask!0 (mask!7691 thiss!1248))))

(assert (=> d!51229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7691 thiss!1248)) key!828 (_keys!4970 thiss!1248) (mask!7691 thiss!1248)) lt!81887)))

(declare-fun b!158291 () Bool)

(assert (=> b!158291 (= e!103657 (Intermediate!286 true (toIndex!0 key!828 (mask!7691 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158292 () Bool)

(assert (=> b!158292 (and (bvsge (index!3314 lt!81887) #b00000000000000000000000000000000) (bvslt (index!3314 lt!81887) (size!2929 (_keys!4970 thiss!1248))))))

(declare-fun res!74767 () Bool)

(assert (=> b!158292 (= res!74767 (= (select (arr!2648 (_keys!4970 thiss!1248)) (index!3314 lt!81887)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158292 (=> res!74767 e!103659)))

(declare-fun b!158293 () Bool)

(assert (=> b!158293 (and (bvsge (index!3314 lt!81887) #b00000000000000000000000000000000) (bvslt (index!3314 lt!81887) (size!2929 (_keys!4970 thiss!1248))))))

(assert (=> b!158293 (= e!103659 (= (select (arr!2648 (_keys!4970 thiss!1248)) (index!3314 lt!81887)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158294 () Bool)

(assert (=> b!158294 (= e!103655 (bvsge (x!17427 lt!81887) #b01111111111111111111111111111110))))

(declare-fun b!158295 () Bool)

(assert (=> b!158295 (= e!103657 e!103656)))

(declare-fun c!29816 () Bool)

(assert (=> b!158295 (= c!29816 (or (= lt!81888 key!828) (= (bvadd lt!81888 lt!81888) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51229 c!29815) b!158291))

(assert (= (and d!51229 (not c!29815)) b!158295))

(assert (= (and b!158295 c!29816) b!158290))

(assert (= (and b!158295 (not c!29816)) b!158287))

(assert (= (and d!51229 c!29814) b!158294))

(assert (= (and d!51229 (not c!29814)) b!158288))

(assert (= (and b!158288 res!74766) b!158289))

(assert (= (and b!158289 (not res!74768)) b!158292))

(assert (= (and b!158292 (not res!74767)) b!158293))

(declare-fun m!191249 () Bool)

(assert (=> b!158292 m!191249))

(assert (=> b!158293 m!191249))

(assert (=> b!158289 m!191249))

(assert (=> d!51229 m!191197))

(declare-fun m!191251 () Bool)

(assert (=> d!51229 m!191251))

(assert (=> d!51229 m!191169))

(assert (=> b!158287 m!191197))

(declare-fun m!191253 () Bool)

(assert (=> b!158287 m!191253))

(assert (=> b!158287 m!191253))

(declare-fun m!191255 () Bool)

(assert (=> b!158287 m!191255))

(assert (=> d!51209 d!51229))

(declare-fun d!51231 () Bool)

(declare-fun lt!81894 () (_ BitVec 32))

(declare-fun lt!81893 () (_ BitVec 32))

(assert (=> d!51231 (= lt!81894 (bvmul (bvxor lt!81893 (bvlshr lt!81893 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51231 (= lt!81893 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51231 (and (bvsge (mask!7691 thiss!1248) #b00000000000000000000000000000000) (let ((res!74769 (let ((h!2479 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17446 (bvmul (bvxor h!2479 (bvlshr h!2479 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17446 (bvlshr x!17446 #b00000000000000000000000000001101)) (mask!7691 thiss!1248)))))) (and (bvslt res!74769 (bvadd (mask!7691 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74769 #b00000000000000000000000000000000))))))

(assert (=> d!51231 (= (toIndex!0 key!828 (mask!7691 thiss!1248)) (bvand (bvxor lt!81894 (bvlshr lt!81894 #b00000000000000000000000000001101)) (mask!7691 thiss!1248)))))

(assert (=> d!51209 d!51231))

(assert (=> d!51209 d!51215))

(declare-fun mapIsEmpty!5580 () Bool)

(declare-fun mapRes!5580 () Bool)

(assert (=> mapIsEmpty!5580 mapRes!5580))

(declare-fun mapNonEmpty!5580 () Bool)

(declare-fun tp!12969 () Bool)

(declare-fun e!103661 () Bool)

(assert (=> mapNonEmpty!5580 (= mapRes!5580 (and tp!12969 e!103661))))

(declare-fun mapKey!5580 () (_ BitVec 32))

(declare-fun mapRest!5580 () (Array (_ BitVec 32) ValueCell!1292))

(declare-fun mapValue!5580 () ValueCell!1292)

(assert (=> mapNonEmpty!5580 (= mapRest!5579 (store mapRest!5580 mapKey!5580 mapValue!5580))))

(declare-fun condMapEmpty!5580 () Bool)

(declare-fun mapDefault!5580 () ValueCell!1292)

(assert (=> mapNonEmpty!5579 (= condMapEmpty!5580 (= mapRest!5579 ((as const (Array (_ BitVec 32) ValueCell!1292)) mapDefault!5580)))))

(declare-fun e!103660 () Bool)

(assert (=> mapNonEmpty!5579 (= tp!12968 (and e!103660 mapRes!5580))))

(declare-fun b!158297 () Bool)

(assert (=> b!158297 (= e!103660 tp_is_empty!3271)))

(declare-fun b!158296 () Bool)

(assert (=> b!158296 (= e!103661 tp_is_empty!3271)))

(assert (= (and mapNonEmpty!5579 condMapEmpty!5580) mapIsEmpty!5580))

(assert (= (and mapNonEmpty!5579 (not condMapEmpty!5580)) mapNonEmpty!5580))

(assert (= (and mapNonEmpty!5580 ((_ is ValueCellFull!1292) mapValue!5580)) b!158296))

(assert (= (and mapNonEmpty!5579 ((_ is ValueCellFull!1292) mapDefault!5580)) b!158297))

(declare-fun m!191257 () Bool)

(assert (=> mapNonEmpty!5580 m!191257))

(check-sat (not d!51229) (not b!158210) b_and!9897 (not d!51225) (not d!51219) (not bm!17230) (not b!158235) (not b!158268) (not b!158255) (not b!158237) (not b!158209) (not bm!17236) (not b!158234) (not b!158222) (not mapNonEmpty!5580) (not b_next!3469) (not b!158287) (not b!158221) tp_is_empty!3271 (not bm!17233))
(check-sat b_and!9897 (not b_next!3469))
