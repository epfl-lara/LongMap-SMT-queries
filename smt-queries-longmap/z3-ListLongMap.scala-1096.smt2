; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22506 () Bool)

(assert start!22506)

(declare-fun b!235122 () Bool)

(declare-fun b_free!6325 () Bool)

(declare-fun b_next!6325 () Bool)

(assert (=> b!235122 (= b_free!6325 (not b_next!6325))))

(declare-fun tp!22142 () Bool)

(declare-fun b_and!13227 () Bool)

(assert (=> b!235122 (= tp!22142 b_and!13227)))

(declare-fun b!235112 () Bool)

(declare-fun res!115264 () Bool)

(declare-fun e!152690 () Bool)

(assert (=> b!235112 (=> (not res!115264) (not e!152690))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!235112 (= res!115264 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235113 () Bool)

(declare-fun res!115267 () Bool)

(declare-fun e!152689 () Bool)

(assert (=> b!235113 (=> (not res!115267) (not e!152689))))

(declare-datatypes ((V!7897 0))(
  ( (V!7898 (val!3138 Int)) )
))
(declare-datatypes ((ValueCell!2750 0))(
  ( (ValueCellFull!2750 (v!5159 V!7897)) (EmptyCell!2750) )
))
(declare-datatypes ((array!11623 0))(
  ( (array!11624 (arr!5523 (Array (_ BitVec 32) ValueCell!2750)) (size!5861 (_ BitVec 32))) )
))
(declare-datatypes ((array!11625 0))(
  ( (array!11626 (arr!5524 (Array (_ BitVec 32) (_ BitVec 64))) (size!5862 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3400 0))(
  ( (LongMapFixedSize!3401 (defaultEntry!4370 Int) (mask!10336 (_ BitVec 32)) (extraKeys!4107 (_ BitVec 32)) (zeroValue!4211 V!7897) (minValue!4211 V!7897) (_size!1749 (_ BitVec 32)) (_keys!6443 array!11625) (_values!4353 array!11623) (_vacant!1749 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3400)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11625 (_ BitVec 32)) Bool)

(assert (=> b!235113 (= res!115267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6443 thiss!1504) (mask!10336 thiss!1504)))))

(declare-fun b!235114 () Bool)

(declare-fun res!115270 () Bool)

(assert (=> b!235114 (=> (not res!115270) (not e!152689))))

(assert (=> b!235114 (= res!115270 (and (= (size!5861 (_values!4353 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10336 thiss!1504))) (= (size!5862 (_keys!6443 thiss!1504)) (size!5861 (_values!4353 thiss!1504))) (bvsge (mask!10336 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4107 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4107 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!10475 () Bool)

(declare-fun mapRes!10475 () Bool)

(declare-fun tp!22141 () Bool)

(declare-fun e!152693 () Bool)

(assert (=> mapNonEmpty!10475 (= mapRes!10475 (and tp!22141 e!152693))))

(declare-fun mapRest!10475 () (Array (_ BitVec 32) ValueCell!2750))

(declare-fun mapKey!10475 () (_ BitVec 32))

(declare-fun mapValue!10475 () ValueCell!2750)

(assert (=> mapNonEmpty!10475 (= (arr!5523 (_values!4353 thiss!1504)) (store mapRest!10475 mapKey!10475 mapValue!10475))))

(declare-fun b!235115 () Bool)

(declare-fun e!152691 () Bool)

(declare-fun tp_is_empty!6187 () Bool)

(assert (=> b!235115 (= e!152691 tp_is_empty!6187)))

(declare-fun b!235116 () Bool)

(assert (=> b!235116 (= e!152690 e!152689)))

(declare-fun res!115266 () Bool)

(assert (=> b!235116 (=> (not res!115266) (not e!152689))))

(declare-datatypes ((SeekEntryResult!989 0))(
  ( (MissingZero!989 (index!6126 (_ BitVec 32))) (Found!989 (index!6127 (_ BitVec 32))) (Intermediate!989 (undefined!1801 Bool) (index!6128 (_ BitVec 32)) (x!23774 (_ BitVec 32))) (Undefined!989) (MissingVacant!989 (index!6129 (_ BitVec 32))) )
))
(declare-fun lt!118848 () SeekEntryResult!989)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235116 (= res!115266 (or (= lt!118848 (MissingZero!989 index!297)) (= lt!118848 (MissingVacant!989 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11625 (_ BitVec 32)) SeekEntryResult!989)

(assert (=> b!235116 (= lt!118848 (seekEntryOrOpen!0 key!932 (_keys!6443 thiss!1504) (mask!10336 thiss!1504)))))

(declare-fun b!235118 () Bool)

(declare-datatypes ((List!3529 0))(
  ( (Nil!3526) (Cons!3525 (h!4177 (_ BitVec 64)) (t!8493 List!3529)) )
))
(declare-fun arrayNoDuplicates!0 (array!11625 (_ BitVec 32) List!3529) Bool)

(assert (=> b!235118 (= e!152689 (not (arrayNoDuplicates!0 (_keys!6443 thiss!1504) #b00000000000000000000000000000000 Nil!3526)))))

(declare-fun b!235119 () Bool)

(assert (=> b!235119 (= e!152693 tp_is_empty!6187)))

(declare-fun b!235120 () Bool)

(declare-fun res!115268 () Bool)

(assert (=> b!235120 (=> (not res!115268) (not e!152689))))

(declare-datatypes ((tuple2!4602 0))(
  ( (tuple2!4603 (_1!2312 (_ BitVec 64)) (_2!2312 V!7897)) )
))
(declare-datatypes ((List!3530 0))(
  ( (Nil!3527) (Cons!3526 (h!4178 tuple2!4602) (t!8494 List!3530)) )
))
(declare-datatypes ((ListLongMap!3505 0))(
  ( (ListLongMap!3506 (toList!1768 List!3530)) )
))
(declare-fun contains!1647 (ListLongMap!3505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1277 (array!11625 array!11623 (_ BitVec 32) (_ BitVec 32) V!7897 V!7897 (_ BitVec 32) Int) ListLongMap!3505)

(assert (=> b!235120 (= res!115268 (contains!1647 (getCurrentListMap!1277 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)) key!932))))

(declare-fun b!235121 () Bool)

(declare-fun e!152692 () Bool)

(assert (=> b!235121 (= e!152692 (and e!152691 mapRes!10475))))

(declare-fun condMapEmpty!10475 () Bool)

(declare-fun mapDefault!10475 () ValueCell!2750)

(assert (=> b!235121 (= condMapEmpty!10475 (= (arr!5523 (_values!4353 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2750)) mapDefault!10475)))))

(declare-fun mapIsEmpty!10475 () Bool)

(assert (=> mapIsEmpty!10475 mapRes!10475))

(declare-fun e!152688 () Bool)

(declare-fun array_inv!3649 (array!11625) Bool)

(declare-fun array_inv!3650 (array!11623) Bool)

(assert (=> b!235122 (= e!152688 (and tp!22142 tp_is_empty!6187 (array_inv!3649 (_keys!6443 thiss!1504)) (array_inv!3650 (_values!4353 thiss!1504)) e!152692))))

(declare-fun res!115269 () Bool)

(assert (=> start!22506 (=> (not res!115269) (not e!152690))))

(declare-fun valid!1356 (LongMapFixedSize!3400) Bool)

(assert (=> start!22506 (= res!115269 (valid!1356 thiss!1504))))

(assert (=> start!22506 e!152690))

(assert (=> start!22506 e!152688))

(assert (=> start!22506 true))

(declare-fun b!235117 () Bool)

(declare-fun res!115265 () Bool)

(assert (=> b!235117 (=> (not res!115265) (not e!152689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235117 (= res!115265 (validMask!0 (mask!10336 thiss!1504)))))

(assert (= (and start!22506 res!115269) b!235112))

(assert (= (and b!235112 res!115264) b!235116))

(assert (= (and b!235116 res!115266) b!235120))

(assert (= (and b!235120 res!115268) b!235117))

(assert (= (and b!235117 res!115265) b!235114))

(assert (= (and b!235114 res!115270) b!235113))

(assert (= (and b!235113 res!115267) b!235118))

(assert (= (and b!235121 condMapEmpty!10475) mapIsEmpty!10475))

(assert (= (and b!235121 (not condMapEmpty!10475)) mapNonEmpty!10475))

(get-info :version)

(assert (= (and mapNonEmpty!10475 ((_ is ValueCellFull!2750) mapValue!10475)) b!235119))

(assert (= (and b!235121 ((_ is ValueCellFull!2750) mapDefault!10475)) b!235115))

(assert (= b!235122 b!235121))

(assert (= start!22506 b!235122))

(declare-fun m!255819 () Bool)

(assert (=> b!235113 m!255819))

(declare-fun m!255821 () Bool)

(assert (=> b!235116 m!255821))

(declare-fun m!255823 () Bool)

(assert (=> b!235122 m!255823))

(declare-fun m!255825 () Bool)

(assert (=> b!235122 m!255825))

(declare-fun m!255827 () Bool)

(assert (=> b!235118 m!255827))

(declare-fun m!255829 () Bool)

(assert (=> mapNonEmpty!10475 m!255829))

(declare-fun m!255831 () Bool)

(assert (=> b!235117 m!255831))

(declare-fun m!255833 () Bool)

(assert (=> start!22506 m!255833))

(declare-fun m!255835 () Bool)

(assert (=> b!235120 m!255835))

(assert (=> b!235120 m!255835))

(declare-fun m!255837 () Bool)

(assert (=> b!235120 m!255837))

(check-sat b_and!13227 (not b_next!6325) (not b!235117) (not b!235122) (not b!235118) (not mapNonEmpty!10475) tp_is_empty!6187 (not b!235116) (not b!235113) (not start!22506) (not b!235120))
(check-sat b_and!13227 (not b_next!6325))
(get-model)

(declare-fun b!235201 () Bool)

(declare-fun e!152743 () SeekEntryResult!989)

(declare-fun lt!118861 () SeekEntryResult!989)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11625 (_ BitVec 32)) SeekEntryResult!989)

(assert (=> b!235201 (= e!152743 (seekKeyOrZeroReturnVacant!0 (x!23774 lt!118861) (index!6128 lt!118861) (index!6128 lt!118861) key!932 (_keys!6443 thiss!1504) (mask!10336 thiss!1504)))))

(declare-fun b!235202 () Bool)

(declare-fun e!152742 () SeekEntryResult!989)

(declare-fun e!152744 () SeekEntryResult!989)

(assert (=> b!235202 (= e!152742 e!152744)))

(declare-fun lt!118862 () (_ BitVec 64))

(assert (=> b!235202 (= lt!118862 (select (arr!5524 (_keys!6443 thiss!1504)) (index!6128 lt!118861)))))

(declare-fun c!39190 () Bool)

(assert (=> b!235202 (= c!39190 (= lt!118862 key!932))))

(declare-fun b!235203 () Bool)

(declare-fun c!39189 () Bool)

(assert (=> b!235203 (= c!39189 (= lt!118862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!235203 (= e!152744 e!152743)))

(declare-fun b!235204 () Bool)

(assert (=> b!235204 (= e!152743 (MissingZero!989 (index!6128 lt!118861)))))

(declare-fun d!59125 () Bool)

(declare-fun lt!118863 () SeekEntryResult!989)

(assert (=> d!59125 (and (or ((_ is Undefined!989) lt!118863) (not ((_ is Found!989) lt!118863)) (and (bvsge (index!6127 lt!118863) #b00000000000000000000000000000000) (bvslt (index!6127 lt!118863) (size!5862 (_keys!6443 thiss!1504))))) (or ((_ is Undefined!989) lt!118863) ((_ is Found!989) lt!118863) (not ((_ is MissingZero!989) lt!118863)) (and (bvsge (index!6126 lt!118863) #b00000000000000000000000000000000) (bvslt (index!6126 lt!118863) (size!5862 (_keys!6443 thiss!1504))))) (or ((_ is Undefined!989) lt!118863) ((_ is Found!989) lt!118863) ((_ is MissingZero!989) lt!118863) (not ((_ is MissingVacant!989) lt!118863)) (and (bvsge (index!6129 lt!118863) #b00000000000000000000000000000000) (bvslt (index!6129 lt!118863) (size!5862 (_keys!6443 thiss!1504))))) (or ((_ is Undefined!989) lt!118863) (ite ((_ is Found!989) lt!118863) (= (select (arr!5524 (_keys!6443 thiss!1504)) (index!6127 lt!118863)) key!932) (ite ((_ is MissingZero!989) lt!118863) (= (select (arr!5524 (_keys!6443 thiss!1504)) (index!6126 lt!118863)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!989) lt!118863) (= (select (arr!5524 (_keys!6443 thiss!1504)) (index!6129 lt!118863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59125 (= lt!118863 e!152742)))

(declare-fun c!39191 () Bool)

(assert (=> d!59125 (= c!39191 (and ((_ is Intermediate!989) lt!118861) (undefined!1801 lt!118861)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11625 (_ BitVec 32)) SeekEntryResult!989)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59125 (= lt!118861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10336 thiss!1504)) key!932 (_keys!6443 thiss!1504) (mask!10336 thiss!1504)))))

(assert (=> d!59125 (validMask!0 (mask!10336 thiss!1504))))

(assert (=> d!59125 (= (seekEntryOrOpen!0 key!932 (_keys!6443 thiss!1504) (mask!10336 thiss!1504)) lt!118863)))

(declare-fun b!235205 () Bool)

(assert (=> b!235205 (= e!152742 Undefined!989)))

(declare-fun b!235206 () Bool)

(assert (=> b!235206 (= e!152744 (Found!989 (index!6128 lt!118861)))))

(assert (= (and d!59125 c!39191) b!235205))

(assert (= (and d!59125 (not c!39191)) b!235202))

(assert (= (and b!235202 c!39190) b!235206))

(assert (= (and b!235202 (not c!39190)) b!235203))

(assert (= (and b!235203 c!39189) b!235204))

(assert (= (and b!235203 (not c!39189)) b!235201))

(declare-fun m!255879 () Bool)

(assert (=> b!235201 m!255879))

(declare-fun m!255881 () Bool)

(assert (=> b!235202 m!255881))

(assert (=> d!59125 m!255831))

(declare-fun m!255883 () Bool)

(assert (=> d!59125 m!255883))

(declare-fun m!255885 () Bool)

(assert (=> d!59125 m!255885))

(declare-fun m!255887 () Bool)

(assert (=> d!59125 m!255887))

(declare-fun m!255889 () Bool)

(assert (=> d!59125 m!255889))

(assert (=> d!59125 m!255889))

(declare-fun m!255891 () Bool)

(assert (=> d!59125 m!255891))

(assert (=> b!235116 d!59125))

(declare-fun d!59127 () Bool)

(declare-fun res!115319 () Bool)

(declare-fun e!152747 () Bool)

(assert (=> d!59127 (=> (not res!115319) (not e!152747))))

(declare-fun simpleValid!233 (LongMapFixedSize!3400) Bool)

(assert (=> d!59127 (= res!115319 (simpleValid!233 thiss!1504))))

(assert (=> d!59127 (= (valid!1356 thiss!1504) e!152747)))

(declare-fun b!235213 () Bool)

(declare-fun res!115320 () Bool)

(assert (=> b!235213 (=> (not res!115320) (not e!152747))))

(declare-fun arrayCountValidKeys!0 (array!11625 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235213 (= res!115320 (= (arrayCountValidKeys!0 (_keys!6443 thiss!1504) #b00000000000000000000000000000000 (size!5862 (_keys!6443 thiss!1504))) (_size!1749 thiss!1504)))))

(declare-fun b!235214 () Bool)

(declare-fun res!115321 () Bool)

(assert (=> b!235214 (=> (not res!115321) (not e!152747))))

(assert (=> b!235214 (= res!115321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6443 thiss!1504) (mask!10336 thiss!1504)))))

(declare-fun b!235215 () Bool)

(assert (=> b!235215 (= e!152747 (arrayNoDuplicates!0 (_keys!6443 thiss!1504) #b00000000000000000000000000000000 Nil!3526))))

(assert (= (and d!59127 res!115319) b!235213))

(assert (= (and b!235213 res!115320) b!235214))

(assert (= (and b!235214 res!115321) b!235215))

(declare-fun m!255893 () Bool)

(assert (=> d!59127 m!255893))

(declare-fun m!255895 () Bool)

(assert (=> b!235213 m!255895))

(assert (=> b!235214 m!255819))

(assert (=> b!235215 m!255827))

(assert (=> start!22506 d!59127))

(declare-fun d!59129 () Bool)

(declare-fun e!152752 () Bool)

(assert (=> d!59129 e!152752))

(declare-fun res!115324 () Bool)

(assert (=> d!59129 (=> res!115324 e!152752)))

(declare-fun lt!118874 () Bool)

(assert (=> d!59129 (= res!115324 (not lt!118874))))

(declare-fun lt!118873 () Bool)

(assert (=> d!59129 (= lt!118874 lt!118873)))

(declare-datatypes ((Unit!7250 0))(
  ( (Unit!7251) )
))
(declare-fun lt!118875 () Unit!7250)

(declare-fun e!152753 () Unit!7250)

(assert (=> d!59129 (= lt!118875 e!152753)))

(declare-fun c!39194 () Bool)

(assert (=> d!59129 (= c!39194 lt!118873)))

(declare-fun containsKey!258 (List!3530 (_ BitVec 64)) Bool)

(assert (=> d!59129 (= lt!118873 (containsKey!258 (toList!1768 (getCurrentListMap!1277 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504))) key!932))))

(assert (=> d!59129 (= (contains!1647 (getCurrentListMap!1277 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)) key!932) lt!118874)))

(declare-fun b!235222 () Bool)

(declare-fun lt!118872 () Unit!7250)

(assert (=> b!235222 (= e!152753 lt!118872)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!207 (List!3530 (_ BitVec 64)) Unit!7250)

(assert (=> b!235222 (= lt!118872 (lemmaContainsKeyImpliesGetValueByKeyDefined!207 (toList!1768 (getCurrentListMap!1277 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504))) key!932))))

(declare-datatypes ((Option!272 0))(
  ( (Some!271 (v!5162 V!7897)) (None!270) )
))
(declare-fun isDefined!208 (Option!272) Bool)

(declare-fun getValueByKey!266 (List!3530 (_ BitVec 64)) Option!272)

(assert (=> b!235222 (isDefined!208 (getValueByKey!266 (toList!1768 (getCurrentListMap!1277 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504))) key!932))))

(declare-fun b!235223 () Bool)

(declare-fun Unit!7252 () Unit!7250)

(assert (=> b!235223 (= e!152753 Unit!7252)))

(declare-fun b!235224 () Bool)

(assert (=> b!235224 (= e!152752 (isDefined!208 (getValueByKey!266 (toList!1768 (getCurrentListMap!1277 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504))) key!932)))))

(assert (= (and d!59129 c!39194) b!235222))

(assert (= (and d!59129 (not c!39194)) b!235223))

(assert (= (and d!59129 (not res!115324)) b!235224))

(declare-fun m!255897 () Bool)

(assert (=> d!59129 m!255897))

(declare-fun m!255899 () Bool)

(assert (=> b!235222 m!255899))

(declare-fun m!255901 () Bool)

(assert (=> b!235222 m!255901))

(assert (=> b!235222 m!255901))

(declare-fun m!255903 () Bool)

(assert (=> b!235222 m!255903))

(assert (=> b!235224 m!255901))

(assert (=> b!235224 m!255901))

(assert (=> b!235224 m!255903))

(assert (=> b!235120 d!59129))

(declare-fun b!235267 () Bool)

(declare-fun res!115346 () Bool)

(declare-fun e!152783 () Bool)

(assert (=> b!235267 (=> (not res!115346) (not e!152783))))

(declare-fun e!152786 () Bool)

(assert (=> b!235267 (= res!115346 e!152786)))

(declare-fun res!115344 () Bool)

(assert (=> b!235267 (=> res!115344 e!152786)))

(declare-fun e!152792 () Bool)

(assert (=> b!235267 (= res!115344 (not e!152792))))

(declare-fun res!115343 () Bool)

(assert (=> b!235267 (=> (not res!115343) (not e!152792))))

(assert (=> b!235267 (= res!115343 (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6443 thiss!1504))))))

(declare-fun b!235268 () Bool)

(declare-fun e!152781 () ListLongMap!3505)

(declare-fun call!21867 () ListLongMap!3505)

(assert (=> b!235268 (= e!152781 call!21867)))

(declare-fun call!21869 () ListLongMap!3505)

(declare-fun c!39211 () Bool)

(declare-fun call!21872 () ListLongMap!3505)

(declare-fun bm!21864 () Bool)

(declare-fun call!21871 () ListLongMap!3505)

(declare-fun c!39207 () Bool)

(declare-fun +!643 (ListLongMap!3505 tuple2!4602) ListLongMap!3505)

(assert (=> bm!21864 (= call!21869 (+!643 (ite c!39211 call!21871 (ite c!39207 call!21872 call!21867)) (ite (or c!39211 c!39207) (tuple2!4603 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4211 thiss!1504)) (tuple2!4603 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4211 thiss!1504)))))))

(declare-fun b!235269 () Bool)

(declare-fun e!152787 () Bool)

(declare-fun lt!118922 () ListLongMap!3505)

(declare-fun apply!210 (ListLongMap!3505 (_ BitVec 64)) V!7897)

(declare-fun get!2837 (ValueCell!2750 V!7897) V!7897)

(declare-fun dynLambda!544 (Int (_ BitVec 64)) V!7897)

(assert (=> b!235269 (= e!152787 (= (apply!210 lt!118922 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000)) (get!2837 (select (arr!5523 (_values!4353 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!544 (defaultEntry!4370 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5861 (_values!4353 thiss!1504))))))

(assert (=> b!235269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6443 thiss!1504))))))

(declare-fun bm!21865 () Bool)

(assert (=> bm!21865 (= call!21867 call!21872)))

(declare-fun b!235270 () Bool)

(declare-fun e!152784 () Bool)

(declare-fun call!21868 () Bool)

(assert (=> b!235270 (= e!152784 (not call!21868))))

(declare-fun b!235271 () Bool)

(declare-fun e!152789 () Bool)

(declare-fun e!152780 () Bool)

(assert (=> b!235271 (= e!152789 e!152780)))

(declare-fun res!115347 () Bool)

(declare-fun call!21873 () Bool)

(assert (=> b!235271 (= res!115347 call!21873)))

(assert (=> b!235271 (=> (not res!115347) (not e!152780))))

(declare-fun bm!21866 () Bool)

(assert (=> bm!21866 (= call!21872 call!21871)))

(declare-fun b!235272 () Bool)

(declare-fun e!152790 () ListLongMap!3505)

(declare-fun e!152791 () ListLongMap!3505)

(assert (=> b!235272 (= e!152790 e!152791)))

(assert (=> b!235272 (= c!39207 (and (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21867 () Bool)

(assert (=> bm!21867 (= call!21873 (contains!1647 lt!118922 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235273 () Bool)

(assert (=> b!235273 (= e!152789 (not call!21873))))

(declare-fun b!235274 () Bool)

(declare-fun c!39212 () Bool)

(assert (=> b!235274 (= c!39212 (and (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!235274 (= e!152791 e!152781)))

(declare-fun bm!21868 () Bool)

(declare-fun call!21870 () ListLongMap!3505)

(assert (=> bm!21868 (= call!21870 call!21869)))

(declare-fun b!235276 () Bool)

(declare-fun e!152788 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235276 (= e!152788 (validKeyInArray!0 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235277 () Bool)

(assert (=> b!235277 (= e!152781 call!21870)))

(declare-fun bm!21869 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!526 (array!11625 array!11623 (_ BitVec 32) (_ BitVec 32) V!7897 V!7897 (_ BitVec 32) Int) ListLongMap!3505)

(assert (=> bm!21869 (= call!21871 (getCurrentListMapNoExtraKeys!526 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun b!235278 () Bool)

(assert (=> b!235278 (= e!152791 call!21870)))

(declare-fun b!235279 () Bool)

(declare-fun e!152782 () Unit!7250)

(declare-fun Unit!7253 () Unit!7250)

(assert (=> b!235279 (= e!152782 Unit!7253)))

(declare-fun b!235280 () Bool)

(declare-fun res!115351 () Bool)

(assert (=> b!235280 (=> (not res!115351) (not e!152783))))

(assert (=> b!235280 (= res!115351 e!152784)))

(declare-fun c!39208 () Bool)

(assert (=> b!235280 (= c!39208 (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!235281 () Bool)

(assert (=> b!235281 (= e!152786 e!152787)))

(declare-fun res!115350 () Bool)

(assert (=> b!235281 (=> (not res!115350) (not e!152787))))

(assert (=> b!235281 (= res!115350 (contains!1647 lt!118922 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6443 thiss!1504))))))

(declare-fun b!235282 () Bool)

(assert (=> b!235282 (= e!152792 (validKeyInArray!0 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235283 () Bool)

(declare-fun lt!118938 () Unit!7250)

(assert (=> b!235283 (= e!152782 lt!118938)))

(declare-fun lt!118920 () ListLongMap!3505)

(assert (=> b!235283 (= lt!118920 (getCurrentListMapNoExtraKeys!526 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun lt!118926 () (_ BitVec 64))

(assert (=> b!235283 (= lt!118926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118937 () (_ BitVec 64))

(assert (=> b!235283 (= lt!118937 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118932 () Unit!7250)

(declare-fun addStillContains!186 (ListLongMap!3505 (_ BitVec 64) V!7897 (_ BitVec 64)) Unit!7250)

(assert (=> b!235283 (= lt!118932 (addStillContains!186 lt!118920 lt!118926 (zeroValue!4211 thiss!1504) lt!118937))))

(assert (=> b!235283 (contains!1647 (+!643 lt!118920 (tuple2!4603 lt!118926 (zeroValue!4211 thiss!1504))) lt!118937)))

(declare-fun lt!118923 () Unit!7250)

(assert (=> b!235283 (= lt!118923 lt!118932)))

(declare-fun lt!118934 () ListLongMap!3505)

(assert (=> b!235283 (= lt!118934 (getCurrentListMapNoExtraKeys!526 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun lt!118924 () (_ BitVec 64))

(assert (=> b!235283 (= lt!118924 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118940 () (_ BitVec 64))

(assert (=> b!235283 (= lt!118940 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118939 () Unit!7250)

(declare-fun addApplyDifferent!186 (ListLongMap!3505 (_ BitVec 64) V!7897 (_ BitVec 64)) Unit!7250)

(assert (=> b!235283 (= lt!118939 (addApplyDifferent!186 lt!118934 lt!118924 (minValue!4211 thiss!1504) lt!118940))))

(assert (=> b!235283 (= (apply!210 (+!643 lt!118934 (tuple2!4603 lt!118924 (minValue!4211 thiss!1504))) lt!118940) (apply!210 lt!118934 lt!118940))))

(declare-fun lt!118925 () Unit!7250)

(assert (=> b!235283 (= lt!118925 lt!118939)))

(declare-fun lt!118927 () ListLongMap!3505)

(assert (=> b!235283 (= lt!118927 (getCurrentListMapNoExtraKeys!526 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun lt!118921 () (_ BitVec 64))

(assert (=> b!235283 (= lt!118921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118941 () (_ BitVec 64))

(assert (=> b!235283 (= lt!118941 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118931 () Unit!7250)

(assert (=> b!235283 (= lt!118931 (addApplyDifferent!186 lt!118927 lt!118921 (zeroValue!4211 thiss!1504) lt!118941))))

(assert (=> b!235283 (= (apply!210 (+!643 lt!118927 (tuple2!4603 lt!118921 (zeroValue!4211 thiss!1504))) lt!118941) (apply!210 lt!118927 lt!118941))))

(declare-fun lt!118935 () Unit!7250)

(assert (=> b!235283 (= lt!118935 lt!118931)))

(declare-fun lt!118930 () ListLongMap!3505)

(assert (=> b!235283 (= lt!118930 (getCurrentListMapNoExtraKeys!526 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun lt!118929 () (_ BitVec 64))

(assert (=> b!235283 (= lt!118929 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118933 () (_ BitVec 64))

(assert (=> b!235283 (= lt!118933 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235283 (= lt!118938 (addApplyDifferent!186 lt!118930 lt!118929 (minValue!4211 thiss!1504) lt!118933))))

(assert (=> b!235283 (= (apply!210 (+!643 lt!118930 (tuple2!4603 lt!118929 (minValue!4211 thiss!1504))) lt!118933) (apply!210 lt!118930 lt!118933))))

(declare-fun bm!21870 () Bool)

(assert (=> bm!21870 (= call!21868 (contains!1647 lt!118922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59131 () Bool)

(assert (=> d!59131 e!152783))

(declare-fun res!115349 () Bool)

(assert (=> d!59131 (=> (not res!115349) (not e!152783))))

(assert (=> d!59131 (= res!115349 (or (bvsge #b00000000000000000000000000000000 (size!5862 (_keys!6443 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6443 thiss!1504))))))))

(declare-fun lt!118928 () ListLongMap!3505)

(assert (=> d!59131 (= lt!118922 lt!118928)))

(declare-fun lt!118936 () Unit!7250)

(assert (=> d!59131 (= lt!118936 e!152782)))

(declare-fun c!39210 () Bool)

(assert (=> d!59131 (= c!39210 e!152788)))

(declare-fun res!115348 () Bool)

(assert (=> d!59131 (=> (not res!115348) (not e!152788))))

(assert (=> d!59131 (= res!115348 (bvslt #b00000000000000000000000000000000 (size!5862 (_keys!6443 thiss!1504))))))

(assert (=> d!59131 (= lt!118928 e!152790)))

(assert (=> d!59131 (= c!39211 (and (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59131 (validMask!0 (mask!10336 thiss!1504))))

(assert (=> d!59131 (= (getCurrentListMap!1277 (_keys!6443 thiss!1504) (_values!4353 thiss!1504) (mask!10336 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)) lt!118922)))

(declare-fun b!235275 () Bool)

(declare-fun e!152785 () Bool)

(assert (=> b!235275 (= e!152784 e!152785)))

(declare-fun res!115345 () Bool)

(assert (=> b!235275 (= res!115345 call!21868)))

(assert (=> b!235275 (=> (not res!115345) (not e!152785))))

(declare-fun b!235284 () Bool)

(assert (=> b!235284 (= e!152785 (= (apply!210 lt!118922 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4211 thiss!1504)))))

(declare-fun b!235285 () Bool)

(assert (=> b!235285 (= e!152780 (= (apply!210 lt!118922 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4211 thiss!1504)))))

(declare-fun b!235286 () Bool)

(assert (=> b!235286 (= e!152790 (+!643 call!21869 (tuple2!4603 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4211 thiss!1504))))))

(declare-fun b!235287 () Bool)

(assert (=> b!235287 (= e!152783 e!152789)))

(declare-fun c!39209 () Bool)

(assert (=> b!235287 (= c!39209 (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!59131 c!39211) b!235286))

(assert (= (and d!59131 (not c!39211)) b!235272))

(assert (= (and b!235272 c!39207) b!235278))

(assert (= (and b!235272 (not c!39207)) b!235274))

(assert (= (and b!235274 c!39212) b!235277))

(assert (= (and b!235274 (not c!39212)) b!235268))

(assert (= (or b!235277 b!235268) bm!21865))

(assert (= (or b!235278 bm!21865) bm!21866))

(assert (= (or b!235278 b!235277) bm!21868))

(assert (= (or b!235286 bm!21866) bm!21869))

(assert (= (or b!235286 bm!21868) bm!21864))

(assert (= (and d!59131 res!115348) b!235276))

(assert (= (and d!59131 c!39210) b!235283))

(assert (= (and d!59131 (not c!39210)) b!235279))

(assert (= (and d!59131 res!115349) b!235267))

(assert (= (and b!235267 res!115343) b!235282))

(assert (= (and b!235267 (not res!115344)) b!235281))

(assert (= (and b!235281 res!115350) b!235269))

(assert (= (and b!235267 res!115346) b!235280))

(assert (= (and b!235280 c!39208) b!235275))

(assert (= (and b!235280 (not c!39208)) b!235270))

(assert (= (and b!235275 res!115345) b!235284))

(assert (= (or b!235275 b!235270) bm!21870))

(assert (= (and b!235280 res!115351) b!235287))

(assert (= (and b!235287 c!39209) b!235271))

(assert (= (and b!235287 (not c!39209)) b!235273))

(assert (= (and b!235271 res!115347) b!235285))

(assert (= (or b!235271 b!235273) bm!21867))

(declare-fun b_lambda!7885 () Bool)

(assert (=> (not b_lambda!7885) (not b!235269)))

(declare-fun t!8498 () Bool)

(declare-fun tb!2925 () Bool)

(assert (=> (and b!235122 (= (defaultEntry!4370 thiss!1504) (defaultEntry!4370 thiss!1504)) t!8498) tb!2925))

(declare-fun result!5113 () Bool)

(assert (=> tb!2925 (= result!5113 tp_is_empty!6187)))

(assert (=> b!235269 t!8498))

(declare-fun b_and!13233 () Bool)

(assert (= b_and!13227 (and (=> t!8498 result!5113) b_and!13233)))

(declare-fun m!255905 () Bool)

(assert (=> bm!21864 m!255905))

(assert (=> d!59131 m!255831))

(declare-fun m!255907 () Bool)

(assert (=> bm!21869 m!255907))

(declare-fun m!255909 () Bool)

(assert (=> b!235269 m!255909))

(declare-fun m!255911 () Bool)

(assert (=> b!235269 m!255911))

(declare-fun m!255913 () Bool)

(assert (=> b!235269 m!255913))

(assert (=> b!235269 m!255909))

(declare-fun m!255915 () Bool)

(assert (=> b!235269 m!255915))

(declare-fun m!255917 () Bool)

(assert (=> b!235269 m!255917))

(assert (=> b!235269 m!255915))

(assert (=> b!235269 m!255911))

(declare-fun m!255919 () Bool)

(assert (=> b!235284 m!255919))

(assert (=> b!235281 m!255915))

(assert (=> b!235281 m!255915))

(declare-fun m!255921 () Bool)

(assert (=> b!235281 m!255921))

(declare-fun m!255923 () Bool)

(assert (=> b!235285 m!255923))

(declare-fun m!255925 () Bool)

(assert (=> bm!21867 m!255925))

(assert (=> b!235282 m!255915))

(assert (=> b!235282 m!255915))

(declare-fun m!255927 () Bool)

(assert (=> b!235282 m!255927))

(declare-fun m!255929 () Bool)

(assert (=> b!235283 m!255929))

(declare-fun m!255931 () Bool)

(assert (=> b!235283 m!255931))

(declare-fun m!255933 () Bool)

(assert (=> b!235283 m!255933))

(declare-fun m!255935 () Bool)

(assert (=> b!235283 m!255935))

(assert (=> b!235283 m!255907))

(declare-fun m!255937 () Bool)

(assert (=> b!235283 m!255937))

(declare-fun m!255939 () Bool)

(assert (=> b!235283 m!255939))

(declare-fun m!255941 () Bool)

(assert (=> b!235283 m!255941))

(declare-fun m!255943 () Bool)

(assert (=> b!235283 m!255943))

(assert (=> b!235283 m!255929))

(declare-fun m!255945 () Bool)

(assert (=> b!235283 m!255945))

(declare-fun m!255947 () Bool)

(assert (=> b!235283 m!255947))

(assert (=> b!235283 m!255937))

(assert (=> b!235283 m!255931))

(declare-fun m!255949 () Bool)

(assert (=> b!235283 m!255949))

(declare-fun m!255951 () Bool)

(assert (=> b!235283 m!255951))

(assert (=> b!235283 m!255915))

(declare-fun m!255953 () Bool)

(assert (=> b!235283 m!255953))

(assert (=> b!235283 m!255953))

(declare-fun m!255955 () Bool)

(assert (=> b!235283 m!255955))

(declare-fun m!255957 () Bool)

(assert (=> b!235283 m!255957))

(declare-fun m!255959 () Bool)

(assert (=> b!235286 m!255959))

(declare-fun m!255961 () Bool)

(assert (=> bm!21870 m!255961))

(assert (=> b!235276 m!255915))

(assert (=> b!235276 m!255915))

(assert (=> b!235276 m!255927))

(assert (=> b!235120 d!59131))

(declare-fun d!59133 () Bool)

(assert (=> d!59133 (= (array_inv!3649 (_keys!6443 thiss!1504)) (bvsge (size!5862 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235122 d!59133))

(declare-fun d!59135 () Bool)

(assert (=> d!59135 (= (array_inv!3650 (_values!4353 thiss!1504)) (bvsge (size!5861 (_values!4353 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235122 d!59135))

(declare-fun b!235300 () Bool)

(declare-fun e!152803 () Bool)

(declare-fun e!152801 () Bool)

(assert (=> b!235300 (= e!152803 e!152801)))

(declare-fun res!115360 () Bool)

(assert (=> b!235300 (=> (not res!115360) (not e!152801))))

(declare-fun e!152802 () Bool)

(assert (=> b!235300 (= res!115360 (not e!152802))))

(declare-fun res!115358 () Bool)

(assert (=> b!235300 (=> (not res!115358) (not e!152802))))

(assert (=> b!235300 (= res!115358 (validKeyInArray!0 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235301 () Bool)

(declare-fun e!152804 () Bool)

(assert (=> b!235301 (= e!152801 e!152804)))

(declare-fun c!39215 () Bool)

(assert (=> b!235301 (= c!39215 (validKeyInArray!0 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21873 () Bool)

(declare-fun call!21876 () Bool)

(assert (=> bm!21873 (= call!21876 (arrayNoDuplicates!0 (_keys!6443 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39215 (Cons!3525 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000) Nil!3526) Nil!3526)))))

(declare-fun d!59137 () Bool)

(declare-fun res!115359 () Bool)

(assert (=> d!59137 (=> res!115359 e!152803)))

(assert (=> d!59137 (= res!115359 (bvsge #b00000000000000000000000000000000 (size!5862 (_keys!6443 thiss!1504))))))

(assert (=> d!59137 (= (arrayNoDuplicates!0 (_keys!6443 thiss!1504) #b00000000000000000000000000000000 Nil!3526) e!152803)))

(declare-fun b!235302 () Bool)

(declare-fun contains!1649 (List!3529 (_ BitVec 64)) Bool)

(assert (=> b!235302 (= e!152802 (contains!1649 Nil!3526 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235303 () Bool)

(assert (=> b!235303 (= e!152804 call!21876)))

(declare-fun b!235304 () Bool)

(assert (=> b!235304 (= e!152804 call!21876)))

(assert (= (and d!59137 (not res!115359)) b!235300))

(assert (= (and b!235300 res!115358) b!235302))

(assert (= (and b!235300 res!115360) b!235301))

(assert (= (and b!235301 c!39215) b!235304))

(assert (= (and b!235301 (not c!39215)) b!235303))

(assert (= (or b!235304 b!235303) bm!21873))

(assert (=> b!235300 m!255915))

(assert (=> b!235300 m!255915))

(assert (=> b!235300 m!255927))

(assert (=> b!235301 m!255915))

(assert (=> b!235301 m!255915))

(assert (=> b!235301 m!255927))

(assert (=> bm!21873 m!255915))

(declare-fun m!255963 () Bool)

(assert (=> bm!21873 m!255963))

(assert (=> b!235302 m!255915))

(assert (=> b!235302 m!255915))

(declare-fun m!255965 () Bool)

(assert (=> b!235302 m!255965))

(assert (=> b!235118 d!59137))

(declare-fun d!59139 () Bool)

(assert (=> d!59139 (= (validMask!0 (mask!10336 thiss!1504)) (and (or (= (mask!10336 thiss!1504) #b00000000000000000000000000000111) (= (mask!10336 thiss!1504) #b00000000000000000000000000001111) (= (mask!10336 thiss!1504) #b00000000000000000000000000011111) (= (mask!10336 thiss!1504) #b00000000000000000000000000111111) (= (mask!10336 thiss!1504) #b00000000000000000000000001111111) (= (mask!10336 thiss!1504) #b00000000000000000000000011111111) (= (mask!10336 thiss!1504) #b00000000000000000000000111111111) (= (mask!10336 thiss!1504) #b00000000000000000000001111111111) (= (mask!10336 thiss!1504) #b00000000000000000000011111111111) (= (mask!10336 thiss!1504) #b00000000000000000000111111111111) (= (mask!10336 thiss!1504) #b00000000000000000001111111111111) (= (mask!10336 thiss!1504) #b00000000000000000011111111111111) (= (mask!10336 thiss!1504) #b00000000000000000111111111111111) (= (mask!10336 thiss!1504) #b00000000000000001111111111111111) (= (mask!10336 thiss!1504) #b00000000000000011111111111111111) (= (mask!10336 thiss!1504) #b00000000000000111111111111111111) (= (mask!10336 thiss!1504) #b00000000000001111111111111111111) (= (mask!10336 thiss!1504) #b00000000000011111111111111111111) (= (mask!10336 thiss!1504) #b00000000000111111111111111111111) (= (mask!10336 thiss!1504) #b00000000001111111111111111111111) (= (mask!10336 thiss!1504) #b00000000011111111111111111111111) (= (mask!10336 thiss!1504) #b00000000111111111111111111111111) (= (mask!10336 thiss!1504) #b00000001111111111111111111111111) (= (mask!10336 thiss!1504) #b00000011111111111111111111111111) (= (mask!10336 thiss!1504) #b00000111111111111111111111111111) (= (mask!10336 thiss!1504) #b00001111111111111111111111111111) (= (mask!10336 thiss!1504) #b00011111111111111111111111111111) (= (mask!10336 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10336 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235117 d!59139))

(declare-fun b!235313 () Bool)

(declare-fun e!152812 () Bool)

(declare-fun call!21879 () Bool)

(assert (=> b!235313 (= e!152812 call!21879)))

(declare-fun b!235314 () Bool)

(declare-fun e!152813 () Bool)

(assert (=> b!235314 (= e!152813 call!21879)))

(declare-fun d!59141 () Bool)

(declare-fun res!115366 () Bool)

(declare-fun e!152811 () Bool)

(assert (=> d!59141 (=> res!115366 e!152811)))

(assert (=> d!59141 (= res!115366 (bvsge #b00000000000000000000000000000000 (size!5862 (_keys!6443 thiss!1504))))))

(assert (=> d!59141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6443 thiss!1504) (mask!10336 thiss!1504)) e!152811)))

(declare-fun bm!21876 () Bool)

(assert (=> bm!21876 (= call!21879 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6443 thiss!1504) (mask!10336 thiss!1504)))))

(declare-fun b!235315 () Bool)

(assert (=> b!235315 (= e!152813 e!152812)))

(declare-fun lt!118949 () (_ BitVec 64))

(assert (=> b!235315 (= lt!118949 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118950 () Unit!7250)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11625 (_ BitVec 64) (_ BitVec 32)) Unit!7250)

(assert (=> b!235315 (= lt!118950 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6443 thiss!1504) lt!118949 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235315 (arrayContainsKey!0 (_keys!6443 thiss!1504) lt!118949 #b00000000000000000000000000000000)))

(declare-fun lt!118948 () Unit!7250)

(assert (=> b!235315 (= lt!118948 lt!118950)))

(declare-fun res!115365 () Bool)

(assert (=> b!235315 (= res!115365 (= (seekEntryOrOpen!0 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000) (_keys!6443 thiss!1504) (mask!10336 thiss!1504)) (Found!989 #b00000000000000000000000000000000)))))

(assert (=> b!235315 (=> (not res!115365) (not e!152812))))

(declare-fun b!235316 () Bool)

(assert (=> b!235316 (= e!152811 e!152813)))

(declare-fun c!39218 () Bool)

(assert (=> b!235316 (= c!39218 (validKeyInArray!0 (select (arr!5524 (_keys!6443 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59141 (not res!115366)) b!235316))

(assert (= (and b!235316 c!39218) b!235315))

(assert (= (and b!235316 (not c!39218)) b!235314))

(assert (= (and b!235315 res!115365) b!235313))

(assert (= (or b!235313 b!235314) bm!21876))

(declare-fun m!255967 () Bool)

(assert (=> bm!21876 m!255967))

(assert (=> b!235315 m!255915))

(declare-fun m!255969 () Bool)

(assert (=> b!235315 m!255969))

(declare-fun m!255971 () Bool)

(assert (=> b!235315 m!255971))

(assert (=> b!235315 m!255915))

(declare-fun m!255973 () Bool)

(assert (=> b!235315 m!255973))

(assert (=> b!235316 m!255915))

(assert (=> b!235316 m!255915))

(assert (=> b!235316 m!255927))

(assert (=> b!235113 d!59141))

(declare-fun b!235323 () Bool)

(declare-fun e!152818 () Bool)

(assert (=> b!235323 (= e!152818 tp_is_empty!6187)))

(declare-fun mapIsEmpty!10484 () Bool)

(declare-fun mapRes!10484 () Bool)

(assert (=> mapIsEmpty!10484 mapRes!10484))

(declare-fun b!235324 () Bool)

(declare-fun e!152819 () Bool)

(assert (=> b!235324 (= e!152819 tp_is_empty!6187)))

(declare-fun condMapEmpty!10484 () Bool)

(declare-fun mapDefault!10484 () ValueCell!2750)

(assert (=> mapNonEmpty!10475 (= condMapEmpty!10484 (= mapRest!10475 ((as const (Array (_ BitVec 32) ValueCell!2750)) mapDefault!10484)))))

(assert (=> mapNonEmpty!10475 (= tp!22141 (and e!152819 mapRes!10484))))

(declare-fun mapNonEmpty!10484 () Bool)

(declare-fun tp!22157 () Bool)

(assert (=> mapNonEmpty!10484 (= mapRes!10484 (and tp!22157 e!152818))))

(declare-fun mapRest!10484 () (Array (_ BitVec 32) ValueCell!2750))

(declare-fun mapKey!10484 () (_ BitVec 32))

(declare-fun mapValue!10484 () ValueCell!2750)

(assert (=> mapNonEmpty!10484 (= mapRest!10475 (store mapRest!10484 mapKey!10484 mapValue!10484))))

(assert (= (and mapNonEmpty!10475 condMapEmpty!10484) mapIsEmpty!10484))

(assert (= (and mapNonEmpty!10475 (not condMapEmpty!10484)) mapNonEmpty!10484))

(assert (= (and mapNonEmpty!10484 ((_ is ValueCellFull!2750) mapValue!10484)) b!235323))

(assert (= (and mapNonEmpty!10475 ((_ is ValueCellFull!2750) mapDefault!10484)) b!235324))

(declare-fun m!255975 () Bool)

(assert (=> mapNonEmpty!10484 m!255975))

(declare-fun b_lambda!7887 () Bool)

(assert (= b_lambda!7885 (or (and b!235122 b_free!6325) b_lambda!7887)))

(check-sat (not b!235283) (not b!235276) (not b_next!6325) (not bm!21876) (not mapNonEmpty!10484) (not bm!21869) (not d!59129) b_and!13233 (not b!235315) (not b!235285) (not b_lambda!7887) (not b!235224) (not b!235213) tp_is_empty!6187 (not b!235300) (not d!59125) (not b!235201) (not bm!21870) (not bm!21867) (not b!235222) (not b!235316) (not b!235284) (not bm!21864) (not bm!21873) (not b!235281) (not b!235215) (not d!59131) (not b!235269) (not b!235214) (not b!235301) (not b!235302) (not b!235286) (not b!235282) (not d!59127))
(check-sat b_and!13233 (not b_next!6325))
