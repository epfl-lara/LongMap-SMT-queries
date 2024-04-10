; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15964 () Bool)

(assert start!15964)

(declare-fun b!158607 () Bool)

(declare-fun b_free!3489 () Bool)

(declare-fun b_next!3489 () Bool)

(assert (=> b!158607 (= b_free!3489 (not b_next!3489))))

(declare-fun tp!13024 () Bool)

(declare-fun b_and!9903 () Bool)

(assert (=> b!158607 (= tp!13024 b_and!9903)))

(declare-fun b!158603 () Bool)

(declare-fun e!103872 () Bool)

(declare-fun tp_is_empty!3291 () Bool)

(assert (=> b!158603 (= e!103872 tp_is_empty!3291)))

(declare-fun b!158604 () Bool)

(declare-fun e!103873 () Bool)

(declare-fun mapRes!5611 () Bool)

(assert (=> b!158604 (= e!103873 (and e!103872 mapRes!5611))))

(declare-fun condMapEmpty!5611 () Bool)

(declare-datatypes ((V!4035 0))(
  ( (V!4036 (val!1690 Int)) )
))
(declare-datatypes ((ValueCell!1302 0))(
  ( (ValueCellFull!1302 (v!3555 V!4035)) (EmptyCell!1302) )
))
(declare-datatypes ((array!5653 0))(
  ( (array!5654 (arr!2675 (Array (_ BitVec 32) (_ BitVec 64))) (size!2958 (_ BitVec 32))) )
))
(declare-datatypes ((array!5655 0))(
  ( (array!5656 (arr!2676 (Array (_ BitVec 32) ValueCell!1302)) (size!2959 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1512 0))(
  ( (LongMapFixedSize!1513 (defaultEntry!3198 Int) (mask!7721 (_ BitVec 32)) (extraKeys!2939 (_ BitVec 32)) (zeroValue!3041 V!4035) (minValue!3041 V!4035) (_size!805 (_ BitVec 32)) (_keys!4989 array!5653) (_values!3181 array!5655) (_vacant!805 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1512)

(declare-fun mapDefault!5611 () ValueCell!1302)

(assert (=> b!158604 (= condMapEmpty!5611 (= (arr!2676 (_values!3181 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1302)) mapDefault!5611)))))

(declare-fun res!74896 () Bool)

(declare-fun e!103871 () Bool)

(assert (=> start!15964 (=> (not res!74896) (not e!103871))))

(declare-fun valid!712 (LongMapFixedSize!1512) Bool)

(assert (=> start!15964 (= res!74896 (valid!712 thiss!1248))))

(assert (=> start!15964 e!103871))

(declare-fun e!103869 () Bool)

(assert (=> start!15964 e!103869))

(assert (=> start!15964 true))

(declare-fun b!158605 () Bool)

(declare-fun res!74898 () Bool)

(assert (=> b!158605 (=> (not res!74898) (not e!103871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158605 (= res!74898 (validMask!0 (mask!7721 thiss!1248)))))

(declare-fun mapIsEmpty!5611 () Bool)

(assert (=> mapIsEmpty!5611 mapRes!5611))

(declare-fun b!158606 () Bool)

(declare-fun res!74899 () Bool)

(assert (=> b!158606 (=> (not res!74899) (not e!103871))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!298 0))(
  ( (MissingZero!298 (index!3360 (_ BitVec 32))) (Found!298 (index!3361 (_ BitVec 32))) (Intermediate!298 (undefined!1110 Bool) (index!3362 (_ BitVec 32)) (x!17505 (_ BitVec 32))) (Undefined!298) (MissingVacant!298 (index!3363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5653 (_ BitVec 32)) SeekEntryResult!298)

(assert (=> b!158606 (= res!74899 ((_ is Undefined!298) (seekEntryOrOpen!0 key!828 (_keys!4989 thiss!1248) (mask!7721 thiss!1248))))))

(declare-fun array_inv!1701 (array!5653) Bool)

(declare-fun array_inv!1702 (array!5655) Bool)

(assert (=> b!158607 (= e!103869 (and tp!13024 tp_is_empty!3291 (array_inv!1701 (_keys!4989 thiss!1248)) (array_inv!1702 (_values!3181 thiss!1248)) e!103873))))

(declare-fun b!158608 () Bool)

(assert (=> b!158608 (= e!103871 (and (= (size!2959 (_values!3181 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7721 thiss!1248))) (= (size!2958 (_keys!4989 thiss!1248)) (size!2959 (_values!3181 thiss!1248))) (bvsge (mask!7721 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2939 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!2939 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158609 () Bool)

(declare-fun e!103868 () Bool)

(assert (=> b!158609 (= e!103868 tp_is_empty!3291)))

(declare-fun b!158610 () Bool)

(declare-fun res!74897 () Bool)

(assert (=> b!158610 (=> (not res!74897) (not e!103871))))

(assert (=> b!158610 (= res!74897 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5611 () Bool)

(declare-fun tp!13023 () Bool)

(assert (=> mapNonEmpty!5611 (= mapRes!5611 (and tp!13023 e!103868))))

(declare-fun mapRest!5611 () (Array (_ BitVec 32) ValueCell!1302))

(declare-fun mapKey!5611 () (_ BitVec 32))

(declare-fun mapValue!5611 () ValueCell!1302)

(assert (=> mapNonEmpty!5611 (= (arr!2676 (_values!3181 thiss!1248)) (store mapRest!5611 mapKey!5611 mapValue!5611))))

(assert (= (and start!15964 res!74896) b!158610))

(assert (= (and b!158610 res!74897) b!158606))

(assert (= (and b!158606 res!74899) b!158605))

(assert (= (and b!158605 res!74898) b!158608))

(assert (= (and b!158604 condMapEmpty!5611) mapIsEmpty!5611))

(assert (= (and b!158604 (not condMapEmpty!5611)) mapNonEmpty!5611))

(assert (= (and mapNonEmpty!5611 ((_ is ValueCellFull!1302) mapValue!5611)) b!158609))

(assert (= (and b!158604 ((_ is ValueCellFull!1302) mapDefault!5611)) b!158603))

(assert (= b!158607 b!158604))

(assert (= start!15964 b!158607))

(declare-fun m!191247 () Bool)

(assert (=> start!15964 m!191247))

(declare-fun m!191249 () Bool)

(assert (=> b!158607 m!191249))

(declare-fun m!191251 () Bool)

(assert (=> b!158607 m!191251))

(declare-fun m!191253 () Bool)

(assert (=> b!158606 m!191253))

(declare-fun m!191255 () Bool)

(assert (=> b!158605 m!191255))

(declare-fun m!191257 () Bool)

(assert (=> mapNonEmpty!5611 m!191257))

(check-sat tp_is_empty!3291 (not b!158605) (not b!158607) (not b_next!3489) (not start!15964) (not b!158606) (not mapNonEmpty!5611) b_and!9903)
(check-sat b_and!9903 (not b_next!3489))
(get-model)

(declare-fun d!51199 () Bool)

(declare-fun res!74918 () Bool)

(declare-fun e!103894 () Bool)

(assert (=> d!51199 (=> (not res!74918) (not e!103894))))

(declare-fun simpleValid!114 (LongMapFixedSize!1512) Bool)

(assert (=> d!51199 (= res!74918 (simpleValid!114 thiss!1248))))

(assert (=> d!51199 (= (valid!712 thiss!1248) e!103894)))

(declare-fun b!158641 () Bool)

(declare-fun res!74919 () Bool)

(assert (=> b!158641 (=> (not res!74919) (not e!103894))))

(declare-fun arrayCountValidKeys!0 (array!5653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158641 (= res!74919 (= (arrayCountValidKeys!0 (_keys!4989 thiss!1248) #b00000000000000000000000000000000 (size!2958 (_keys!4989 thiss!1248))) (_size!805 thiss!1248)))))

(declare-fun b!158642 () Bool)

(declare-fun res!74920 () Bool)

(assert (=> b!158642 (=> (not res!74920) (not e!103894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5653 (_ BitVec 32)) Bool)

(assert (=> b!158642 (= res!74920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4989 thiss!1248) (mask!7721 thiss!1248)))))

(declare-fun b!158643 () Bool)

(declare-datatypes ((List!1891 0))(
  ( (Nil!1888) (Cons!1887 (h!2499 (_ BitVec 64)) (t!6693 List!1891)) )
))
(declare-fun arrayNoDuplicates!0 (array!5653 (_ BitVec 32) List!1891) Bool)

(assert (=> b!158643 (= e!103894 (arrayNoDuplicates!0 (_keys!4989 thiss!1248) #b00000000000000000000000000000000 Nil!1888))))

(assert (= (and d!51199 res!74918) b!158641))

(assert (= (and b!158641 res!74919) b!158642))

(assert (= (and b!158642 res!74920) b!158643))

(declare-fun m!191271 () Bool)

(assert (=> d!51199 m!191271))

(declare-fun m!191273 () Bool)

(assert (=> b!158641 m!191273))

(declare-fun m!191275 () Bool)

(assert (=> b!158642 m!191275))

(declare-fun m!191277 () Bool)

(assert (=> b!158643 m!191277))

(assert (=> start!15964 d!51199))

(declare-fun b!158656 () Bool)

(declare-fun e!103903 () SeekEntryResult!298)

(declare-fun e!103902 () SeekEntryResult!298)

(assert (=> b!158656 (= e!103903 e!103902)))

(declare-fun lt!81891 () (_ BitVec 64))

(declare-fun lt!81892 () SeekEntryResult!298)

(assert (=> b!158656 (= lt!81891 (select (arr!2675 (_keys!4989 thiss!1248)) (index!3362 lt!81892)))))

(declare-fun c!29860 () Bool)

(assert (=> b!158656 (= c!29860 (= lt!81891 key!828))))

(declare-fun d!51201 () Bool)

(declare-fun lt!81890 () SeekEntryResult!298)

(assert (=> d!51201 (and (or ((_ is Undefined!298) lt!81890) (not ((_ is Found!298) lt!81890)) (and (bvsge (index!3361 lt!81890) #b00000000000000000000000000000000) (bvslt (index!3361 lt!81890) (size!2958 (_keys!4989 thiss!1248))))) (or ((_ is Undefined!298) lt!81890) ((_ is Found!298) lt!81890) (not ((_ is MissingZero!298) lt!81890)) (and (bvsge (index!3360 lt!81890) #b00000000000000000000000000000000) (bvslt (index!3360 lt!81890) (size!2958 (_keys!4989 thiss!1248))))) (or ((_ is Undefined!298) lt!81890) ((_ is Found!298) lt!81890) ((_ is MissingZero!298) lt!81890) (not ((_ is MissingVacant!298) lt!81890)) (and (bvsge (index!3363 lt!81890) #b00000000000000000000000000000000) (bvslt (index!3363 lt!81890) (size!2958 (_keys!4989 thiss!1248))))) (or ((_ is Undefined!298) lt!81890) (ite ((_ is Found!298) lt!81890) (= (select (arr!2675 (_keys!4989 thiss!1248)) (index!3361 lt!81890)) key!828) (ite ((_ is MissingZero!298) lt!81890) (= (select (arr!2675 (_keys!4989 thiss!1248)) (index!3360 lt!81890)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!298) lt!81890) (= (select (arr!2675 (_keys!4989 thiss!1248)) (index!3363 lt!81890)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51201 (= lt!81890 e!103903)))

(declare-fun c!29859 () Bool)

(assert (=> d!51201 (= c!29859 (and ((_ is Intermediate!298) lt!81892) (undefined!1110 lt!81892)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5653 (_ BitVec 32)) SeekEntryResult!298)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51201 (= lt!81892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7721 thiss!1248)) key!828 (_keys!4989 thiss!1248) (mask!7721 thiss!1248)))))

(assert (=> d!51201 (validMask!0 (mask!7721 thiss!1248))))

(assert (=> d!51201 (= (seekEntryOrOpen!0 key!828 (_keys!4989 thiss!1248) (mask!7721 thiss!1248)) lt!81890)))

(declare-fun e!103901 () SeekEntryResult!298)

(declare-fun b!158657 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5653 (_ BitVec 32)) SeekEntryResult!298)

(assert (=> b!158657 (= e!103901 (seekKeyOrZeroReturnVacant!0 (x!17505 lt!81892) (index!3362 lt!81892) (index!3362 lt!81892) key!828 (_keys!4989 thiss!1248) (mask!7721 thiss!1248)))))

(declare-fun b!158658 () Bool)

(assert (=> b!158658 (= e!103902 (Found!298 (index!3362 lt!81892)))))

(declare-fun b!158659 () Bool)

(assert (=> b!158659 (= e!103901 (MissingZero!298 (index!3362 lt!81892)))))

(declare-fun b!158660 () Bool)

(declare-fun c!29858 () Bool)

(assert (=> b!158660 (= c!29858 (= lt!81891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158660 (= e!103902 e!103901)))

(declare-fun b!158661 () Bool)

(assert (=> b!158661 (= e!103903 Undefined!298)))

(assert (= (and d!51201 c!29859) b!158661))

(assert (= (and d!51201 (not c!29859)) b!158656))

(assert (= (and b!158656 c!29860) b!158658))

(assert (= (and b!158656 (not c!29860)) b!158660))

(assert (= (and b!158660 c!29858) b!158659))

(assert (= (and b!158660 (not c!29858)) b!158657))

(declare-fun m!191279 () Bool)

(assert (=> b!158656 m!191279))

(declare-fun m!191281 () Bool)

(assert (=> d!51201 m!191281))

(declare-fun m!191283 () Bool)

(assert (=> d!51201 m!191283))

(declare-fun m!191285 () Bool)

(assert (=> d!51201 m!191285))

(declare-fun m!191287 () Bool)

(assert (=> d!51201 m!191287))

(assert (=> d!51201 m!191255))

(assert (=> d!51201 m!191281))

(declare-fun m!191289 () Bool)

(assert (=> d!51201 m!191289))

(declare-fun m!191291 () Bool)

(assert (=> b!158657 m!191291))

(assert (=> b!158606 d!51201))

(declare-fun d!51203 () Bool)

(assert (=> d!51203 (= (array_inv!1701 (_keys!4989 thiss!1248)) (bvsge (size!2958 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158607 d!51203))

(declare-fun d!51205 () Bool)

(assert (=> d!51205 (= (array_inv!1702 (_values!3181 thiss!1248)) (bvsge (size!2959 (_values!3181 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158607 d!51205))

(declare-fun d!51207 () Bool)

(assert (=> d!51207 (= (validMask!0 (mask!7721 thiss!1248)) (and (or (= (mask!7721 thiss!1248) #b00000000000000000000000000000111) (= (mask!7721 thiss!1248) #b00000000000000000000000000001111) (= (mask!7721 thiss!1248) #b00000000000000000000000000011111) (= (mask!7721 thiss!1248) #b00000000000000000000000000111111) (= (mask!7721 thiss!1248) #b00000000000000000000000001111111) (= (mask!7721 thiss!1248) #b00000000000000000000000011111111) (= (mask!7721 thiss!1248) #b00000000000000000000000111111111) (= (mask!7721 thiss!1248) #b00000000000000000000001111111111) (= (mask!7721 thiss!1248) #b00000000000000000000011111111111) (= (mask!7721 thiss!1248) #b00000000000000000000111111111111) (= (mask!7721 thiss!1248) #b00000000000000000001111111111111) (= (mask!7721 thiss!1248) #b00000000000000000011111111111111) (= (mask!7721 thiss!1248) #b00000000000000000111111111111111) (= (mask!7721 thiss!1248) #b00000000000000001111111111111111) (= (mask!7721 thiss!1248) #b00000000000000011111111111111111) (= (mask!7721 thiss!1248) #b00000000000000111111111111111111) (= (mask!7721 thiss!1248) #b00000000000001111111111111111111) (= (mask!7721 thiss!1248) #b00000000000011111111111111111111) (= (mask!7721 thiss!1248) #b00000000000111111111111111111111) (= (mask!7721 thiss!1248) #b00000000001111111111111111111111) (= (mask!7721 thiss!1248) #b00000000011111111111111111111111) (= (mask!7721 thiss!1248) #b00000000111111111111111111111111) (= (mask!7721 thiss!1248) #b00000001111111111111111111111111) (= (mask!7721 thiss!1248) #b00000011111111111111111111111111) (= (mask!7721 thiss!1248) #b00000111111111111111111111111111) (= (mask!7721 thiss!1248) #b00001111111111111111111111111111) (= (mask!7721 thiss!1248) #b00011111111111111111111111111111) (= (mask!7721 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7721 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158605 d!51207))

(declare-fun b!158668 () Bool)

(declare-fun e!103909 () Bool)

(assert (=> b!158668 (= e!103909 tp_is_empty!3291)))

(declare-fun b!158669 () Bool)

(declare-fun e!103908 () Bool)

(assert (=> b!158669 (= e!103908 tp_is_empty!3291)))

(declare-fun mapIsEmpty!5617 () Bool)

(declare-fun mapRes!5617 () Bool)

(assert (=> mapIsEmpty!5617 mapRes!5617))

(declare-fun mapNonEmpty!5617 () Bool)

(declare-fun tp!13033 () Bool)

(assert (=> mapNonEmpty!5617 (= mapRes!5617 (and tp!13033 e!103909))))

(declare-fun mapValue!5617 () ValueCell!1302)

(declare-fun mapRest!5617 () (Array (_ BitVec 32) ValueCell!1302))

(declare-fun mapKey!5617 () (_ BitVec 32))

(assert (=> mapNonEmpty!5617 (= mapRest!5611 (store mapRest!5617 mapKey!5617 mapValue!5617))))

(declare-fun condMapEmpty!5617 () Bool)

(declare-fun mapDefault!5617 () ValueCell!1302)

(assert (=> mapNonEmpty!5611 (= condMapEmpty!5617 (= mapRest!5611 ((as const (Array (_ BitVec 32) ValueCell!1302)) mapDefault!5617)))))

(assert (=> mapNonEmpty!5611 (= tp!13023 (and e!103908 mapRes!5617))))

(assert (= (and mapNonEmpty!5611 condMapEmpty!5617) mapIsEmpty!5617))

(assert (= (and mapNonEmpty!5611 (not condMapEmpty!5617)) mapNonEmpty!5617))

(assert (= (and mapNonEmpty!5617 ((_ is ValueCellFull!1302) mapValue!5617)) b!158668))

(assert (= (and mapNonEmpty!5611 ((_ is ValueCellFull!1302) mapDefault!5617)) b!158669))

(declare-fun m!191293 () Bool)

(assert (=> mapNonEmpty!5617 m!191293))

(check-sat (not b!158641) tp_is_empty!3291 (not b_next!3489) (not b!158657) (not d!51199) (not d!51201) (not mapNonEmpty!5617) b_and!9903 (not b!158642) (not b!158643))
(check-sat b_and!9903 (not b_next!3489))
(get-model)

(declare-fun b!158679 () Bool)

(declare-fun res!74932 () Bool)

(declare-fun e!103912 () Bool)

(assert (=> b!158679 (=> (not res!74932) (not e!103912))))

(declare-fun size!2962 (LongMapFixedSize!1512) (_ BitVec 32))

(assert (=> b!158679 (= res!74932 (bvsge (size!2962 thiss!1248) (_size!805 thiss!1248)))))

(declare-fun b!158680 () Bool)

(declare-fun res!74930 () Bool)

(assert (=> b!158680 (=> (not res!74930) (not e!103912))))

(assert (=> b!158680 (= res!74930 (= (size!2962 thiss!1248) (bvadd (_size!805 thiss!1248) (bvsdiv (bvadd (extraKeys!2939 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!158678 () Bool)

(declare-fun res!74929 () Bool)

(assert (=> b!158678 (=> (not res!74929) (not e!103912))))

(assert (=> b!158678 (= res!74929 (and (= (size!2959 (_values!3181 thiss!1248)) (bvadd (mask!7721 thiss!1248) #b00000000000000000000000000000001)) (= (size!2958 (_keys!4989 thiss!1248)) (size!2959 (_values!3181 thiss!1248))) (bvsge (_size!805 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!805 thiss!1248) (bvadd (mask!7721 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!158681 () Bool)

(assert (=> b!158681 (= e!103912 (and (bvsge (extraKeys!2939 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2939 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!805 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51209 () Bool)

(declare-fun res!74931 () Bool)

(assert (=> d!51209 (=> (not res!74931) (not e!103912))))

(assert (=> d!51209 (= res!74931 (validMask!0 (mask!7721 thiss!1248)))))

(assert (=> d!51209 (= (simpleValid!114 thiss!1248) e!103912)))

(assert (= (and d!51209 res!74931) b!158678))

(assert (= (and b!158678 res!74929) b!158679))

(assert (= (and b!158679 res!74932) b!158680))

(assert (= (and b!158680 res!74930) b!158681))

(declare-fun m!191295 () Bool)

(assert (=> b!158679 m!191295))

(assert (=> b!158680 m!191295))

(assert (=> d!51209 m!191255))

(assert (=> d!51199 d!51209))

(declare-fun bm!17260 () Bool)

(declare-fun call!17263 () Bool)

(assert (=> bm!17260 (= call!17263 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4989 thiss!1248) (mask!7721 thiss!1248)))))

(declare-fun b!158690 () Bool)

(declare-fun e!103920 () Bool)

(declare-fun e!103919 () Bool)

(assert (=> b!158690 (= e!103920 e!103919)))

(declare-fun c!29863 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158690 (= c!29863 (validKeyInArray!0 (select (arr!2675 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158691 () Bool)

(declare-fun e!103921 () Bool)

(assert (=> b!158691 (= e!103919 e!103921)))

(declare-fun lt!81899 () (_ BitVec 64))

(assert (=> b!158691 (= lt!81899 (select (arr!2675 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4988 0))(
  ( (Unit!4989) )
))
(declare-fun lt!81901 () Unit!4988)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5653 (_ BitVec 64) (_ BitVec 32)) Unit!4988)

(assert (=> b!158691 (= lt!81901 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4989 thiss!1248) lt!81899 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158691 (arrayContainsKey!0 (_keys!4989 thiss!1248) lt!81899 #b00000000000000000000000000000000)))

(declare-fun lt!81900 () Unit!4988)

(assert (=> b!158691 (= lt!81900 lt!81901)))

(declare-fun res!74938 () Bool)

(assert (=> b!158691 (= res!74938 (= (seekEntryOrOpen!0 (select (arr!2675 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000) (_keys!4989 thiss!1248) (mask!7721 thiss!1248)) (Found!298 #b00000000000000000000000000000000)))))

(assert (=> b!158691 (=> (not res!74938) (not e!103921))))

(declare-fun d!51211 () Bool)

(declare-fun res!74937 () Bool)

(assert (=> d!51211 (=> res!74937 e!103920)))

(assert (=> d!51211 (= res!74937 (bvsge #b00000000000000000000000000000000 (size!2958 (_keys!4989 thiss!1248))))))

(assert (=> d!51211 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4989 thiss!1248) (mask!7721 thiss!1248)) e!103920)))

(declare-fun b!158692 () Bool)

(assert (=> b!158692 (= e!103921 call!17263)))

(declare-fun b!158693 () Bool)

(assert (=> b!158693 (= e!103919 call!17263)))

(assert (= (and d!51211 (not res!74937)) b!158690))

(assert (= (and b!158690 c!29863) b!158691))

(assert (= (and b!158690 (not c!29863)) b!158693))

(assert (= (and b!158691 res!74938) b!158692))

(assert (= (or b!158692 b!158693) bm!17260))

(declare-fun m!191297 () Bool)

(assert (=> bm!17260 m!191297))

(declare-fun m!191299 () Bool)

(assert (=> b!158690 m!191299))

(assert (=> b!158690 m!191299))

(declare-fun m!191301 () Bool)

(assert (=> b!158690 m!191301))

(assert (=> b!158691 m!191299))

(declare-fun m!191303 () Bool)

(assert (=> b!158691 m!191303))

(declare-fun m!191305 () Bool)

(assert (=> b!158691 m!191305))

(assert (=> b!158691 m!191299))

(declare-fun m!191307 () Bool)

(assert (=> b!158691 m!191307))

(assert (=> b!158642 d!51211))

(declare-fun bm!17263 () Bool)

(declare-fun call!17266 () (_ BitVec 32))

(assert (=> bm!17263 (= call!17266 (arrayCountValidKeys!0 (_keys!4989 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2958 (_keys!4989 thiss!1248))))))

(declare-fun d!51213 () Bool)

(declare-fun lt!81904 () (_ BitVec 32))

(assert (=> d!51213 (and (bvsge lt!81904 #b00000000000000000000000000000000) (bvsle lt!81904 (bvsub (size!2958 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103926 () (_ BitVec 32))

(assert (=> d!51213 (= lt!81904 e!103926)))

(declare-fun c!29869 () Bool)

(assert (=> d!51213 (= c!29869 (bvsge #b00000000000000000000000000000000 (size!2958 (_keys!4989 thiss!1248))))))

(assert (=> d!51213 (and (bvsle #b00000000000000000000000000000000 (size!2958 (_keys!4989 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2958 (_keys!4989 thiss!1248)) (size!2958 (_keys!4989 thiss!1248))))))

(assert (=> d!51213 (= (arrayCountValidKeys!0 (_keys!4989 thiss!1248) #b00000000000000000000000000000000 (size!2958 (_keys!4989 thiss!1248))) lt!81904)))

(declare-fun b!158702 () Bool)

(declare-fun e!103927 () (_ BitVec 32))

(assert (=> b!158702 (= e!103926 e!103927)))

(declare-fun c!29868 () Bool)

(assert (=> b!158702 (= c!29868 (validKeyInArray!0 (select (arr!2675 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158703 () Bool)

(assert (=> b!158703 (= e!103927 (bvadd #b00000000000000000000000000000001 call!17266))))

(declare-fun b!158704 () Bool)

(assert (=> b!158704 (= e!103926 #b00000000000000000000000000000000)))

(declare-fun b!158705 () Bool)

(assert (=> b!158705 (= e!103927 call!17266)))

(assert (= (and d!51213 c!29869) b!158704))

(assert (= (and d!51213 (not c!29869)) b!158702))

(assert (= (and b!158702 c!29868) b!158703))

(assert (= (and b!158702 (not c!29868)) b!158705))

(assert (= (or b!158703 b!158705) bm!17263))

(declare-fun m!191309 () Bool)

(assert (=> bm!17263 m!191309))

(assert (=> b!158702 m!191299))

(assert (=> b!158702 m!191299))

(assert (=> b!158702 m!191301))

(assert (=> b!158641 d!51213))

(declare-fun b!158716 () Bool)

(declare-fun e!103939 () Bool)

(declare-fun call!17269 () Bool)

(assert (=> b!158716 (= e!103939 call!17269)))

(declare-fun d!51215 () Bool)

(declare-fun res!74945 () Bool)

(declare-fun e!103936 () Bool)

(assert (=> d!51215 (=> res!74945 e!103936)))

(assert (=> d!51215 (= res!74945 (bvsge #b00000000000000000000000000000000 (size!2958 (_keys!4989 thiss!1248))))))

(assert (=> d!51215 (= (arrayNoDuplicates!0 (_keys!4989 thiss!1248) #b00000000000000000000000000000000 Nil!1888) e!103936)))

(declare-fun bm!17266 () Bool)

(declare-fun c!29872 () Bool)

(assert (=> bm!17266 (= call!17269 (arrayNoDuplicates!0 (_keys!4989 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29872 (Cons!1887 (select (arr!2675 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000) Nil!1888) Nil!1888)))))

(declare-fun b!158717 () Bool)

(declare-fun e!103937 () Bool)

(assert (=> b!158717 (= e!103937 e!103939)))

(assert (=> b!158717 (= c!29872 (validKeyInArray!0 (select (arr!2675 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158718 () Bool)

(assert (=> b!158718 (= e!103936 e!103937)))

(declare-fun res!74947 () Bool)

(assert (=> b!158718 (=> (not res!74947) (not e!103937))))

(declare-fun e!103938 () Bool)

(assert (=> b!158718 (= res!74947 (not e!103938))))

(declare-fun res!74946 () Bool)

(assert (=> b!158718 (=> (not res!74946) (not e!103938))))

(assert (=> b!158718 (= res!74946 (validKeyInArray!0 (select (arr!2675 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158719 () Bool)

(assert (=> b!158719 (= e!103939 call!17269)))

(declare-fun b!158720 () Bool)

(declare-fun contains!982 (List!1891 (_ BitVec 64)) Bool)

(assert (=> b!158720 (= e!103938 (contains!982 Nil!1888 (select (arr!2675 (_keys!4989 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51215 (not res!74945)) b!158718))

(assert (= (and b!158718 res!74946) b!158720))

(assert (= (and b!158718 res!74947) b!158717))

(assert (= (and b!158717 c!29872) b!158719))

(assert (= (and b!158717 (not c!29872)) b!158716))

(assert (= (or b!158719 b!158716) bm!17266))

(assert (=> bm!17266 m!191299))

(declare-fun m!191311 () Bool)

(assert (=> bm!17266 m!191311))

(assert (=> b!158717 m!191299))

(assert (=> b!158717 m!191299))

(assert (=> b!158717 m!191301))

(assert (=> b!158718 m!191299))

(assert (=> b!158718 m!191299))

(assert (=> b!158718 m!191301))

(assert (=> b!158720 m!191299))

(assert (=> b!158720 m!191299))

(declare-fun m!191313 () Bool)

(assert (=> b!158720 m!191313))

(assert (=> b!158643 d!51215))

(declare-fun b!158733 () Bool)

(declare-fun e!103948 () SeekEntryResult!298)

(assert (=> b!158733 (= e!103948 (Found!298 (index!3362 lt!81892)))))

(declare-fun lt!81910 () SeekEntryResult!298)

(declare-fun d!51217 () Bool)

(assert (=> d!51217 (and (or ((_ is Undefined!298) lt!81910) (not ((_ is Found!298) lt!81910)) (and (bvsge (index!3361 lt!81910) #b00000000000000000000000000000000) (bvslt (index!3361 lt!81910) (size!2958 (_keys!4989 thiss!1248))))) (or ((_ is Undefined!298) lt!81910) ((_ is Found!298) lt!81910) (not ((_ is MissingVacant!298) lt!81910)) (not (= (index!3363 lt!81910) (index!3362 lt!81892))) (and (bvsge (index!3363 lt!81910) #b00000000000000000000000000000000) (bvslt (index!3363 lt!81910) (size!2958 (_keys!4989 thiss!1248))))) (or ((_ is Undefined!298) lt!81910) (ite ((_ is Found!298) lt!81910) (= (select (arr!2675 (_keys!4989 thiss!1248)) (index!3361 lt!81910)) key!828) (and ((_ is MissingVacant!298) lt!81910) (= (index!3363 lt!81910) (index!3362 lt!81892)) (= (select (arr!2675 (_keys!4989 thiss!1248)) (index!3363 lt!81910)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!103947 () SeekEntryResult!298)

(assert (=> d!51217 (= lt!81910 e!103947)))

(declare-fun c!29881 () Bool)

(assert (=> d!51217 (= c!29881 (bvsge (x!17505 lt!81892) #b01111111111111111111111111111110))))

(declare-fun lt!81909 () (_ BitVec 64))

(assert (=> d!51217 (= lt!81909 (select (arr!2675 (_keys!4989 thiss!1248)) (index!3362 lt!81892)))))

(assert (=> d!51217 (validMask!0 (mask!7721 thiss!1248))))

(assert (=> d!51217 (= (seekKeyOrZeroReturnVacant!0 (x!17505 lt!81892) (index!3362 lt!81892) (index!3362 lt!81892) key!828 (_keys!4989 thiss!1248) (mask!7721 thiss!1248)) lt!81910)))

(declare-fun b!158734 () Bool)

(declare-fun c!29880 () Bool)

(assert (=> b!158734 (= c!29880 (= lt!81909 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103946 () SeekEntryResult!298)

(assert (=> b!158734 (= e!103948 e!103946)))

(declare-fun b!158735 () Bool)

(assert (=> b!158735 (= e!103947 e!103948)))

(declare-fun c!29879 () Bool)

(assert (=> b!158735 (= c!29879 (= lt!81909 key!828))))

(declare-fun b!158736 () Bool)

(assert (=> b!158736 (= e!103947 Undefined!298)))

(declare-fun b!158737 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158737 (= e!103946 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17505 lt!81892) #b00000000000000000000000000000001) (nextIndex!0 (index!3362 lt!81892) (x!17505 lt!81892) (mask!7721 thiss!1248)) (index!3362 lt!81892) key!828 (_keys!4989 thiss!1248) (mask!7721 thiss!1248)))))

(declare-fun b!158738 () Bool)

(assert (=> b!158738 (= e!103946 (MissingVacant!298 (index!3362 lt!81892)))))

(assert (= (and d!51217 c!29881) b!158736))

(assert (= (and d!51217 (not c!29881)) b!158735))

(assert (= (and b!158735 c!29879) b!158733))

(assert (= (and b!158735 (not c!29879)) b!158734))

(assert (= (and b!158734 c!29880) b!158738))

(assert (= (and b!158734 (not c!29880)) b!158737))

(declare-fun m!191315 () Bool)

(assert (=> d!51217 m!191315))

(declare-fun m!191317 () Bool)

(assert (=> d!51217 m!191317))

(assert (=> d!51217 m!191279))

(assert (=> d!51217 m!191255))

(declare-fun m!191319 () Bool)

(assert (=> b!158737 m!191319))

(assert (=> b!158737 m!191319))

(declare-fun m!191321 () Bool)

(assert (=> b!158737 m!191321))

(assert (=> b!158657 d!51217))

(declare-fun b!158757 () Bool)

(declare-fun e!103962 () SeekEntryResult!298)

(declare-fun e!103961 () SeekEntryResult!298)

(assert (=> b!158757 (= e!103962 e!103961)))

(declare-fun c!29888 () Bool)

(declare-fun lt!81915 () (_ BitVec 64))

(assert (=> b!158757 (= c!29888 (or (= lt!81915 key!828) (= (bvadd lt!81915 lt!81915) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158758 () Bool)

(declare-fun lt!81916 () SeekEntryResult!298)

(assert (=> b!158758 (and (bvsge (index!3362 lt!81916) #b00000000000000000000000000000000) (bvslt (index!3362 lt!81916) (size!2958 (_keys!4989 thiss!1248))))))

(declare-fun res!74955 () Bool)

(assert (=> b!158758 (= res!74955 (= (select (arr!2675 (_keys!4989 thiss!1248)) (index!3362 lt!81916)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103959 () Bool)

(assert (=> b!158758 (=> res!74955 e!103959)))

(declare-fun b!158759 () Bool)

(assert (=> b!158759 (and (bvsge (index!3362 lt!81916) #b00000000000000000000000000000000) (bvslt (index!3362 lt!81916) (size!2958 (_keys!4989 thiss!1248))))))

(assert (=> b!158759 (= e!103959 (= (select (arr!2675 (_keys!4989 thiss!1248)) (index!3362 lt!81916)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!51219 () Bool)

(declare-fun e!103963 () Bool)

(assert (=> d!51219 e!103963))

(declare-fun c!29890 () Bool)

(assert (=> d!51219 (= c!29890 (and ((_ is Intermediate!298) lt!81916) (undefined!1110 lt!81916)))))

(assert (=> d!51219 (= lt!81916 e!103962)))

(declare-fun c!29889 () Bool)

(assert (=> d!51219 (= c!29889 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51219 (= lt!81915 (select (arr!2675 (_keys!4989 thiss!1248)) (toIndex!0 key!828 (mask!7721 thiss!1248))))))

(assert (=> d!51219 (validMask!0 (mask!7721 thiss!1248))))

(assert (=> d!51219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7721 thiss!1248)) key!828 (_keys!4989 thiss!1248) (mask!7721 thiss!1248)) lt!81916)))

(declare-fun b!158760 () Bool)

(assert (=> b!158760 (= e!103961 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7721 thiss!1248)) #b00000000000000000000000000000000 (mask!7721 thiss!1248)) key!828 (_keys!4989 thiss!1248) (mask!7721 thiss!1248)))))

(declare-fun b!158761 () Bool)

(assert (=> b!158761 (= e!103961 (Intermediate!298 false (toIndex!0 key!828 (mask!7721 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158762 () Bool)

(declare-fun e!103960 () Bool)

(assert (=> b!158762 (= e!103963 e!103960)))

(declare-fun res!74956 () Bool)

(assert (=> b!158762 (= res!74956 (and ((_ is Intermediate!298) lt!81916) (not (undefined!1110 lt!81916)) (bvslt (x!17505 lt!81916) #b01111111111111111111111111111110) (bvsge (x!17505 lt!81916) #b00000000000000000000000000000000) (bvsge (x!17505 lt!81916) #b00000000000000000000000000000000)))))

(assert (=> b!158762 (=> (not res!74956) (not e!103960))))

(declare-fun b!158763 () Bool)

(assert (=> b!158763 (= e!103962 (Intermediate!298 true (toIndex!0 key!828 (mask!7721 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158764 () Bool)

(assert (=> b!158764 (= e!103963 (bvsge (x!17505 lt!81916) #b01111111111111111111111111111110))))

(declare-fun b!158765 () Bool)

(assert (=> b!158765 (and (bvsge (index!3362 lt!81916) #b00000000000000000000000000000000) (bvslt (index!3362 lt!81916) (size!2958 (_keys!4989 thiss!1248))))))

(declare-fun res!74954 () Bool)

(assert (=> b!158765 (= res!74954 (= (select (arr!2675 (_keys!4989 thiss!1248)) (index!3362 lt!81916)) key!828))))

(assert (=> b!158765 (=> res!74954 e!103959)))

(assert (=> b!158765 (= e!103960 e!103959)))

(assert (= (and d!51219 c!29889) b!158763))

(assert (= (and d!51219 (not c!29889)) b!158757))

(assert (= (and b!158757 c!29888) b!158761))

(assert (= (and b!158757 (not c!29888)) b!158760))

(assert (= (and d!51219 c!29890) b!158764))

(assert (= (and d!51219 (not c!29890)) b!158762))

(assert (= (and b!158762 res!74956) b!158765))

(assert (= (and b!158765 (not res!74954)) b!158758))

(assert (= (and b!158758 (not res!74955)) b!158759))

(declare-fun m!191323 () Bool)

(assert (=> b!158765 m!191323))

(assert (=> b!158759 m!191323))

(assert (=> b!158760 m!191281))

(declare-fun m!191325 () Bool)

(assert (=> b!158760 m!191325))

(assert (=> b!158760 m!191325))

(declare-fun m!191327 () Bool)

(assert (=> b!158760 m!191327))

(assert (=> d!51219 m!191281))

(declare-fun m!191329 () Bool)

(assert (=> d!51219 m!191329))

(assert (=> d!51219 m!191255))

(assert (=> b!158758 m!191323))

(assert (=> d!51201 d!51219))

(declare-fun d!51221 () Bool)

(declare-fun lt!81922 () (_ BitVec 32))

(declare-fun lt!81921 () (_ BitVec 32))

(assert (=> d!51221 (= lt!81922 (bvmul (bvxor lt!81921 (bvlshr lt!81921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51221 (= lt!81921 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51221 (and (bvsge (mask!7721 thiss!1248) #b00000000000000000000000000000000) (let ((res!74957 (let ((h!2500 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17523 (bvmul (bvxor h!2500 (bvlshr h!2500 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17523 (bvlshr x!17523 #b00000000000000000000000000001101)) (mask!7721 thiss!1248)))))) (and (bvslt res!74957 (bvadd (mask!7721 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74957 #b00000000000000000000000000000000))))))

(assert (=> d!51221 (= (toIndex!0 key!828 (mask!7721 thiss!1248)) (bvand (bvxor lt!81922 (bvlshr lt!81922 #b00000000000000000000000000001101)) (mask!7721 thiss!1248)))))

(assert (=> d!51201 d!51221))

(assert (=> d!51201 d!51207))

(declare-fun b!158766 () Bool)

(declare-fun e!103965 () Bool)

(assert (=> b!158766 (= e!103965 tp_is_empty!3291)))

(declare-fun b!158767 () Bool)

(declare-fun e!103964 () Bool)

(assert (=> b!158767 (= e!103964 tp_is_empty!3291)))

(declare-fun mapIsEmpty!5618 () Bool)

(declare-fun mapRes!5618 () Bool)

(assert (=> mapIsEmpty!5618 mapRes!5618))

(declare-fun mapNonEmpty!5618 () Bool)

(declare-fun tp!13034 () Bool)

(assert (=> mapNonEmpty!5618 (= mapRes!5618 (and tp!13034 e!103965))))

(declare-fun mapRest!5618 () (Array (_ BitVec 32) ValueCell!1302))

(declare-fun mapKey!5618 () (_ BitVec 32))

(declare-fun mapValue!5618 () ValueCell!1302)

(assert (=> mapNonEmpty!5618 (= mapRest!5617 (store mapRest!5618 mapKey!5618 mapValue!5618))))

(declare-fun condMapEmpty!5618 () Bool)

(declare-fun mapDefault!5618 () ValueCell!1302)

(assert (=> mapNonEmpty!5617 (= condMapEmpty!5618 (= mapRest!5617 ((as const (Array (_ BitVec 32) ValueCell!1302)) mapDefault!5618)))))

(assert (=> mapNonEmpty!5617 (= tp!13033 (and e!103964 mapRes!5618))))

(assert (= (and mapNonEmpty!5617 condMapEmpty!5618) mapIsEmpty!5618))

(assert (= (and mapNonEmpty!5617 (not condMapEmpty!5618)) mapNonEmpty!5618))

(assert (= (and mapNonEmpty!5618 ((_ is ValueCellFull!1302) mapValue!5618)) b!158766))

(assert (= (and mapNonEmpty!5617 ((_ is ValueCellFull!1302) mapDefault!5618)) b!158767))

(declare-fun m!191331 () Bool)

(assert (=> mapNonEmpty!5618 m!191331))

(check-sat tp_is_empty!3291 (not d!51217) (not b!158702) (not b!158737) (not bm!17266) (not b!158690) (not b!158680) b_and!9903 (not b!158679) (not b!158718) (not mapNonEmpty!5618) (not b!158717) (not b!158691) (not d!51219) (not bm!17263) (not d!51209) (not b!158720) (not b!158760) (not b_next!3489) (not bm!17260))
(check-sat b_and!9903 (not b_next!3489))
