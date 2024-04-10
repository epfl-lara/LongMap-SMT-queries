; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17938 () Bool)

(assert start!17938)

(declare-fun b!178795 () Bool)

(declare-fun b_free!4413 () Bool)

(declare-fun b_next!4413 () Bool)

(assert (=> b!178795 (= b_free!4413 (not b_next!4413))))

(declare-fun tp!15956 () Bool)

(declare-fun b_and!10935 () Bool)

(assert (=> b!178795 (= tp!15956 b_and!10935)))

(declare-fun b!178790 () Bool)

(declare-fun res!84694 () Bool)

(declare-fun e!117831 () Bool)

(assert (=> b!178790 (=> (not res!84694) (not e!117831))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5227 0))(
  ( (V!5228 (val!2137 Int)) )
))
(declare-datatypes ((ValueCell!1749 0))(
  ( (ValueCellFull!1749 (v!4022 V!5227)) (EmptyCell!1749) )
))
(declare-datatypes ((array!7531 0))(
  ( (array!7532 (arr!3569 (Array (_ BitVec 32) (_ BitVec 64))) (size!3876 (_ BitVec 32))) )
))
(declare-datatypes ((array!7533 0))(
  ( (array!7534 (arr!3570 (Array (_ BitVec 32) ValueCell!1749)) (size!3877 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2406 0))(
  ( (LongMapFixedSize!2407 (defaultEntry!3674 Int) (mask!8642 (_ BitVec 32)) (extraKeys!3411 (_ BitVec 32)) (zeroValue!3515 V!5227) (minValue!3515 V!5227) (_size!1252 (_ BitVec 32)) (_keys!5555 array!7531) (_values!3657 array!7533) (_vacant!1252 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2406)

(get-info :version)

(declare-datatypes ((SeekEntryResult!578 0))(
  ( (MissingZero!578 (index!4480 (_ BitVec 32))) (Found!578 (index!4481 (_ BitVec 32))) (Intermediate!578 (undefined!1390 Bool) (index!4482 (_ BitVec 32)) (x!19572 (_ BitVec 32))) (Undefined!578) (MissingVacant!578 (index!4483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7531 (_ BitVec 32)) SeekEntryResult!578)

(assert (=> b!178790 (= res!84694 ((_ is Undefined!578) (seekEntryOrOpen!0 key!828 (_keys!5555 thiss!1248) (mask!8642 thiss!1248))))))

(declare-fun b!178791 () Bool)

(declare-fun res!84693 () Bool)

(assert (=> b!178791 (=> (not res!84693) (not e!117831))))

(assert (=> b!178791 (= res!84693 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7158 () Bool)

(declare-fun mapRes!7158 () Bool)

(declare-fun tp!15957 () Bool)

(declare-fun e!117832 () Bool)

(assert (=> mapNonEmpty!7158 (= mapRes!7158 (and tp!15957 e!117832))))

(declare-fun mapKey!7158 () (_ BitVec 32))

(declare-fun mapValue!7158 () ValueCell!1749)

(declare-fun mapRest!7158 () (Array (_ BitVec 32) ValueCell!1749))

(assert (=> mapNonEmpty!7158 (= (arr!3570 (_values!3657 thiss!1248)) (store mapRest!7158 mapKey!7158 mapValue!7158))))

(declare-fun b!178792 () Bool)

(declare-fun res!84695 () Bool)

(assert (=> b!178792 (=> (not res!84695) (not e!117831))))

(declare-datatypes ((tuple2!3322 0))(
  ( (tuple2!3323 (_1!1672 (_ BitVec 64)) (_2!1672 V!5227)) )
))
(declare-datatypes ((List!2267 0))(
  ( (Nil!2264) (Cons!2263 (h!2887 tuple2!3322) (t!7107 List!2267)) )
))
(declare-datatypes ((ListLongMap!2249 0))(
  ( (ListLongMap!2250 (toList!1140 List!2267)) )
))
(declare-fun contains!1212 (ListLongMap!2249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!792 (array!7531 array!7533 (_ BitVec 32) (_ BitVec 32) V!5227 V!5227 (_ BitVec 32) Int) ListLongMap!2249)

(assert (=> b!178792 (= res!84695 (not (contains!1212 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)) key!828)))))

(declare-fun b!178793 () Bool)

(declare-fun tp_is_empty!4185 () Bool)

(assert (=> b!178793 (= e!117832 tp_is_empty!4185)))

(declare-fun b!178794 () Bool)

(declare-fun res!84691 () Bool)

(assert (=> b!178794 (=> (not res!84691) (not e!117831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178794 (= res!84691 (validMask!0 (mask!8642 thiss!1248)))))

(declare-fun e!117828 () Bool)

(declare-fun e!117833 () Bool)

(declare-fun array_inv!2295 (array!7531) Bool)

(declare-fun array_inv!2296 (array!7533) Bool)

(assert (=> b!178795 (= e!117833 (and tp!15956 tp_is_empty!4185 (array_inv!2295 (_keys!5555 thiss!1248)) (array_inv!2296 (_values!3657 thiss!1248)) e!117828))))

(declare-fun b!178796 () Bool)

(declare-fun e!117830 () Bool)

(assert (=> b!178796 (= e!117828 (and e!117830 mapRes!7158))))

(declare-fun condMapEmpty!7158 () Bool)

(declare-fun mapDefault!7158 () ValueCell!1749)

(assert (=> b!178796 (= condMapEmpty!7158 (= (arr!3570 (_values!3657 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1749)) mapDefault!7158)))))

(declare-fun b!178797 () Bool)

(assert (=> b!178797 (= e!117831 (and (= (size!3877 (_values!3657 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8642 thiss!1248))) (= (size!3876 (_keys!5555 thiss!1248)) (size!3877 (_values!3657 thiss!1248))) (bvsge (mask!8642 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3411 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3411 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!84692 () Bool)

(assert (=> start!17938 (=> (not res!84692) (not e!117831))))

(declare-fun valid!1007 (LongMapFixedSize!2406) Bool)

(assert (=> start!17938 (= res!84692 (valid!1007 thiss!1248))))

(assert (=> start!17938 e!117831))

(assert (=> start!17938 e!117833))

(assert (=> start!17938 true))

(declare-fun mapIsEmpty!7158 () Bool)

(assert (=> mapIsEmpty!7158 mapRes!7158))

(declare-fun b!178798 () Bool)

(assert (=> b!178798 (= e!117830 tp_is_empty!4185)))

(assert (= (and start!17938 res!84692) b!178791))

(assert (= (and b!178791 res!84693) b!178790))

(assert (= (and b!178790 res!84694) b!178792))

(assert (= (and b!178792 res!84695) b!178794))

(assert (= (and b!178794 res!84691) b!178797))

(assert (= (and b!178796 condMapEmpty!7158) mapIsEmpty!7158))

(assert (= (and b!178796 (not condMapEmpty!7158)) mapNonEmpty!7158))

(assert (= (and mapNonEmpty!7158 ((_ is ValueCellFull!1749) mapValue!7158)) b!178793))

(assert (= (and b!178796 ((_ is ValueCellFull!1749) mapDefault!7158)) b!178798))

(assert (= b!178795 b!178796))

(assert (= start!17938 b!178795))

(declare-fun m!207153 () Bool)

(assert (=> mapNonEmpty!7158 m!207153))

(declare-fun m!207155 () Bool)

(assert (=> b!178790 m!207155))

(declare-fun m!207157 () Bool)

(assert (=> start!17938 m!207157))

(declare-fun m!207159 () Bool)

(assert (=> b!178792 m!207159))

(assert (=> b!178792 m!207159))

(declare-fun m!207161 () Bool)

(assert (=> b!178792 m!207161))

(declare-fun m!207163 () Bool)

(assert (=> b!178795 m!207163))

(declare-fun m!207165 () Bool)

(assert (=> b!178795 m!207165))

(declare-fun m!207167 () Bool)

(assert (=> b!178794 m!207167))

(check-sat (not mapNonEmpty!7158) b_and!10935 (not b!178794) (not b!178795) (not b_next!4413) (not start!17938) tp_is_empty!4185 (not b!178790) (not b!178792))
(check-sat b_and!10935 (not b_next!4413))
(get-model)

(declare-fun d!54035 () Bool)

(assert (=> d!54035 (= (array_inv!2295 (_keys!5555 thiss!1248)) (bvsge (size!3876 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178795 d!54035))

(declare-fun d!54037 () Bool)

(assert (=> d!54037 (= (array_inv!2296 (_values!3657 thiss!1248)) (bvsge (size!3877 (_values!3657 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178795 d!54037))

(declare-fun d!54039 () Bool)

(assert (=> d!54039 (= (validMask!0 (mask!8642 thiss!1248)) (and (or (= (mask!8642 thiss!1248) #b00000000000000000000000000000111) (= (mask!8642 thiss!1248) #b00000000000000000000000000001111) (= (mask!8642 thiss!1248) #b00000000000000000000000000011111) (= (mask!8642 thiss!1248) #b00000000000000000000000000111111) (= (mask!8642 thiss!1248) #b00000000000000000000000001111111) (= (mask!8642 thiss!1248) #b00000000000000000000000011111111) (= (mask!8642 thiss!1248) #b00000000000000000000000111111111) (= (mask!8642 thiss!1248) #b00000000000000000000001111111111) (= (mask!8642 thiss!1248) #b00000000000000000000011111111111) (= (mask!8642 thiss!1248) #b00000000000000000000111111111111) (= (mask!8642 thiss!1248) #b00000000000000000001111111111111) (= (mask!8642 thiss!1248) #b00000000000000000011111111111111) (= (mask!8642 thiss!1248) #b00000000000000000111111111111111) (= (mask!8642 thiss!1248) #b00000000000000001111111111111111) (= (mask!8642 thiss!1248) #b00000000000000011111111111111111) (= (mask!8642 thiss!1248) #b00000000000000111111111111111111) (= (mask!8642 thiss!1248) #b00000000000001111111111111111111) (= (mask!8642 thiss!1248) #b00000000000011111111111111111111) (= (mask!8642 thiss!1248) #b00000000000111111111111111111111) (= (mask!8642 thiss!1248) #b00000000001111111111111111111111) (= (mask!8642 thiss!1248) #b00000000011111111111111111111111) (= (mask!8642 thiss!1248) #b00000000111111111111111111111111) (= (mask!8642 thiss!1248) #b00000001111111111111111111111111) (= (mask!8642 thiss!1248) #b00000011111111111111111111111111) (= (mask!8642 thiss!1248) #b00000111111111111111111111111111) (= (mask!8642 thiss!1248) #b00001111111111111111111111111111) (= (mask!8642 thiss!1248) #b00011111111111111111111111111111) (= (mask!8642 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8642 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!178794 d!54039))

(declare-fun b!178838 () Bool)

(declare-fun c!32056 () Bool)

(declare-fun lt!88357 () (_ BitVec 64))

(assert (=> b!178838 (= c!32056 (= lt!88357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117860 () SeekEntryResult!578)

(declare-fun e!117858 () SeekEntryResult!578)

(assert (=> b!178838 (= e!117860 e!117858)))

(declare-fun lt!88358 () SeekEntryResult!578)

(declare-fun b!178839 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7531 (_ BitVec 32)) SeekEntryResult!578)

(assert (=> b!178839 (= e!117858 (seekKeyOrZeroReturnVacant!0 (x!19572 lt!88358) (index!4482 lt!88358) (index!4482 lt!88358) key!828 (_keys!5555 thiss!1248) (mask!8642 thiss!1248)))))

(declare-fun b!178840 () Bool)

(assert (=> b!178840 (= e!117858 (MissingZero!578 (index!4482 lt!88358)))))

(declare-fun b!178842 () Bool)

(declare-fun e!117859 () SeekEntryResult!578)

(assert (=> b!178842 (= e!117859 Undefined!578)))

(declare-fun b!178843 () Bool)

(assert (=> b!178843 (= e!117859 e!117860)))

(assert (=> b!178843 (= lt!88357 (select (arr!3569 (_keys!5555 thiss!1248)) (index!4482 lt!88358)))))

(declare-fun c!32055 () Bool)

(assert (=> b!178843 (= c!32055 (= lt!88357 key!828))))

(declare-fun b!178841 () Bool)

(assert (=> b!178841 (= e!117860 (Found!578 (index!4482 lt!88358)))))

(declare-fun d!54041 () Bool)

(declare-fun lt!88359 () SeekEntryResult!578)

(assert (=> d!54041 (and (or ((_ is Undefined!578) lt!88359) (not ((_ is Found!578) lt!88359)) (and (bvsge (index!4481 lt!88359) #b00000000000000000000000000000000) (bvslt (index!4481 lt!88359) (size!3876 (_keys!5555 thiss!1248))))) (or ((_ is Undefined!578) lt!88359) ((_ is Found!578) lt!88359) (not ((_ is MissingZero!578) lt!88359)) (and (bvsge (index!4480 lt!88359) #b00000000000000000000000000000000) (bvslt (index!4480 lt!88359) (size!3876 (_keys!5555 thiss!1248))))) (or ((_ is Undefined!578) lt!88359) ((_ is Found!578) lt!88359) ((_ is MissingZero!578) lt!88359) (not ((_ is MissingVacant!578) lt!88359)) (and (bvsge (index!4483 lt!88359) #b00000000000000000000000000000000) (bvslt (index!4483 lt!88359) (size!3876 (_keys!5555 thiss!1248))))) (or ((_ is Undefined!578) lt!88359) (ite ((_ is Found!578) lt!88359) (= (select (arr!3569 (_keys!5555 thiss!1248)) (index!4481 lt!88359)) key!828) (ite ((_ is MissingZero!578) lt!88359) (= (select (arr!3569 (_keys!5555 thiss!1248)) (index!4480 lt!88359)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!578) lt!88359) (= (select (arr!3569 (_keys!5555 thiss!1248)) (index!4483 lt!88359)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54041 (= lt!88359 e!117859)))

(declare-fun c!32054 () Bool)

(assert (=> d!54041 (= c!32054 (and ((_ is Intermediate!578) lt!88358) (undefined!1390 lt!88358)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7531 (_ BitVec 32)) SeekEntryResult!578)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54041 (= lt!88358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8642 thiss!1248)) key!828 (_keys!5555 thiss!1248) (mask!8642 thiss!1248)))))

(assert (=> d!54041 (validMask!0 (mask!8642 thiss!1248))))

(assert (=> d!54041 (= (seekEntryOrOpen!0 key!828 (_keys!5555 thiss!1248) (mask!8642 thiss!1248)) lt!88359)))

(assert (= (and d!54041 c!32054) b!178842))

(assert (= (and d!54041 (not c!32054)) b!178843))

(assert (= (and b!178843 c!32055) b!178841))

(assert (= (and b!178843 (not c!32055)) b!178838))

(assert (= (and b!178838 c!32056) b!178840))

(assert (= (and b!178838 (not c!32056)) b!178839))

(declare-fun m!207185 () Bool)

(assert (=> b!178839 m!207185))

(declare-fun m!207187 () Bool)

(assert (=> b!178843 m!207187))

(declare-fun m!207189 () Bool)

(assert (=> d!54041 m!207189))

(declare-fun m!207191 () Bool)

(assert (=> d!54041 m!207191))

(assert (=> d!54041 m!207167))

(assert (=> d!54041 m!207189))

(declare-fun m!207193 () Bool)

(assert (=> d!54041 m!207193))

(declare-fun m!207195 () Bool)

(assert (=> d!54041 m!207195))

(declare-fun m!207197 () Bool)

(assert (=> d!54041 m!207197))

(assert (=> b!178790 d!54041))

(declare-fun d!54043 () Bool)

(declare-fun e!117866 () Bool)

(assert (=> d!54043 e!117866))

(declare-fun res!84713 () Bool)

(assert (=> d!54043 (=> res!84713 e!117866)))

(declare-fun lt!88368 () Bool)

(assert (=> d!54043 (= res!84713 (not lt!88368))))

(declare-fun lt!88371 () Bool)

(assert (=> d!54043 (= lt!88368 lt!88371)))

(declare-datatypes ((Unit!5452 0))(
  ( (Unit!5453) )
))
(declare-fun lt!88370 () Unit!5452)

(declare-fun e!117865 () Unit!5452)

(assert (=> d!54043 (= lt!88370 e!117865)))

(declare-fun c!32059 () Bool)

(assert (=> d!54043 (= c!32059 lt!88371)))

(declare-fun containsKey!204 (List!2267 (_ BitVec 64)) Bool)

(assert (=> d!54043 (= lt!88371 (containsKey!204 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828))))

(assert (=> d!54043 (= (contains!1212 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)) key!828) lt!88368)))

(declare-fun b!178850 () Bool)

(declare-fun lt!88369 () Unit!5452)

(assert (=> b!178850 (= e!117865 lt!88369)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!152 (List!2267 (_ BitVec 64)) Unit!5452)

(assert (=> b!178850 (= lt!88369 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828))))

(declare-datatypes ((Option!206 0))(
  ( (Some!205 (v!4024 V!5227)) (None!204) )
))
(declare-fun isDefined!153 (Option!206) Bool)

(declare-fun getValueByKey!200 (List!2267 (_ BitVec 64)) Option!206)

(assert (=> b!178850 (isDefined!153 (getValueByKey!200 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828))))

(declare-fun b!178851 () Bool)

(declare-fun Unit!5454 () Unit!5452)

(assert (=> b!178851 (= e!117865 Unit!5454)))

(declare-fun b!178852 () Bool)

(assert (=> b!178852 (= e!117866 (isDefined!153 (getValueByKey!200 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828)))))

(assert (= (and d!54043 c!32059) b!178850))

(assert (= (and d!54043 (not c!32059)) b!178851))

(assert (= (and d!54043 (not res!84713)) b!178852))

(declare-fun m!207199 () Bool)

(assert (=> d!54043 m!207199))

(declare-fun m!207201 () Bool)

(assert (=> b!178850 m!207201))

(declare-fun m!207203 () Bool)

(assert (=> b!178850 m!207203))

(assert (=> b!178850 m!207203))

(declare-fun m!207205 () Bool)

(assert (=> b!178850 m!207205))

(assert (=> b!178852 m!207203))

(assert (=> b!178852 m!207203))

(assert (=> b!178852 m!207205))

(assert (=> b!178792 d!54043))

(declare-fun b!178895 () Bool)

(declare-fun e!117895 () Bool)

(declare-fun lt!88420 () ListLongMap!2249)

(declare-fun apply!145 (ListLongMap!2249 (_ BitVec 64)) V!5227)

(assert (=> b!178895 (= e!117895 (= (apply!145 lt!88420 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3515 thiss!1248)))))

(declare-fun b!178896 () Bool)

(declare-fun e!117900 () ListLongMap!2249)

(declare-fun call!18084 () ListLongMap!2249)

(assert (=> b!178896 (= e!117900 call!18084)))

(declare-fun b!178897 () Bool)

(declare-fun e!117902 () Bool)

(declare-fun call!18085 () Bool)

(assert (=> b!178897 (= e!117902 (not call!18085))))

(declare-fun b!178898 () Bool)

(declare-fun e!117904 () Bool)

(assert (=> b!178898 (= e!117904 e!117902)))

(declare-fun c!32073 () Bool)

(assert (=> b!178898 (= c!32073 (not (= (bvand (extraKeys!3411 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178899 () Bool)

(declare-fun e!117903 () Bool)

(declare-fun call!18080 () Bool)

(assert (=> b!178899 (= e!117903 (not call!18080))))

(declare-fun b!178900 () Bool)

(declare-fun e!117901 () ListLongMap!2249)

(assert (=> b!178900 (= e!117901 call!18084)))

(declare-fun b!178901 () Bool)

(declare-fun e!117905 () Bool)

(assert (=> b!178901 (= e!117905 (= (apply!145 lt!88420 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3515 thiss!1248)))))

(declare-fun b!178902 () Bool)

(declare-fun c!32075 () Bool)

(assert (=> b!178902 (= c!32075 (and (not (= (bvand (extraKeys!3411 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3411 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!178902 (= e!117900 e!117901)))

(declare-fun bm!18076 () Bool)

(declare-fun call!18079 () ListLongMap!2249)

(declare-fun call!18083 () ListLongMap!2249)

(assert (=> bm!18076 (= call!18079 call!18083)))

(declare-fun bm!18077 () Bool)

(declare-fun call!18081 () ListLongMap!2249)

(assert (=> bm!18077 (= call!18081 call!18079)))

(declare-fun c!32072 () Bool)

(declare-fun c!32076 () Bool)

(declare-fun bm!18078 () Bool)

(declare-fun call!18082 () ListLongMap!2249)

(declare-fun +!262 (ListLongMap!2249 tuple2!3322) ListLongMap!2249)

(assert (=> bm!18078 (= call!18082 (+!262 (ite c!32072 call!18083 (ite c!32076 call!18079 call!18081)) (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))))))

(declare-fun b!178904 () Bool)

(declare-fun e!117893 () Bool)

(declare-fun e!117894 () Bool)

(assert (=> b!178904 (= e!117893 e!117894)))

(declare-fun res!84734 () Bool)

(assert (=> b!178904 (=> (not res!84734) (not e!117894))))

(assert (=> b!178904 (= res!84734 (contains!1212 lt!88420 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178904 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun b!178905 () Bool)

(declare-fun e!117898 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!178905 (= e!117898 (validKeyInArray!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178906 () Bool)

(assert (=> b!178906 (= e!117902 e!117905)))

(declare-fun res!84737 () Bool)

(assert (=> b!178906 (= res!84737 call!18085)))

(assert (=> b!178906 (=> (not res!84737) (not e!117905))))

(declare-fun b!178907 () Bool)

(declare-fun e!117896 () Bool)

(assert (=> b!178907 (= e!117896 (validKeyInArray!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178908 () Bool)

(declare-fun res!84732 () Bool)

(assert (=> b!178908 (=> (not res!84732) (not e!117904))))

(assert (=> b!178908 (= res!84732 e!117903)))

(declare-fun c!32074 () Bool)

(assert (=> b!178908 (= c!32074 (not (= (bvand (extraKeys!3411 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18079 () Bool)

(assert (=> bm!18079 (= call!18085 (contains!1212 lt!88420 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178909 () Bool)

(declare-fun e!117899 () Unit!5452)

(declare-fun lt!88430 () Unit!5452)

(assert (=> b!178909 (= e!117899 lt!88430)))

(declare-fun lt!88416 () ListLongMap!2249)

(declare-fun getCurrentListMapNoExtraKeys!178 (array!7531 array!7533 (_ BitVec 32) (_ BitVec 32) V!5227 V!5227 (_ BitVec 32) Int) ListLongMap!2249)

(assert (=> b!178909 (= lt!88416 (getCurrentListMapNoExtraKeys!178 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))))

(declare-fun lt!88433 () (_ BitVec 64))

(assert (=> b!178909 (= lt!88433 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88422 () (_ BitVec 64))

(assert (=> b!178909 (= lt!88422 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88425 () Unit!5452)

(declare-fun addStillContains!121 (ListLongMap!2249 (_ BitVec 64) V!5227 (_ BitVec 64)) Unit!5452)

(assert (=> b!178909 (= lt!88425 (addStillContains!121 lt!88416 lt!88433 (zeroValue!3515 thiss!1248) lt!88422))))

(assert (=> b!178909 (contains!1212 (+!262 lt!88416 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248))) lt!88422)))

(declare-fun lt!88419 () Unit!5452)

(assert (=> b!178909 (= lt!88419 lt!88425)))

(declare-fun lt!88437 () ListLongMap!2249)

(assert (=> b!178909 (= lt!88437 (getCurrentListMapNoExtraKeys!178 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))))

(declare-fun lt!88426 () (_ BitVec 64))

(assert (=> b!178909 (= lt!88426 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88435 () (_ BitVec 64))

(assert (=> b!178909 (= lt!88435 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88429 () Unit!5452)

(declare-fun addApplyDifferent!121 (ListLongMap!2249 (_ BitVec 64) V!5227 (_ BitVec 64)) Unit!5452)

(assert (=> b!178909 (= lt!88429 (addApplyDifferent!121 lt!88437 lt!88426 (minValue!3515 thiss!1248) lt!88435))))

(assert (=> b!178909 (= (apply!145 (+!262 lt!88437 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248))) lt!88435) (apply!145 lt!88437 lt!88435))))

(declare-fun lt!88434 () Unit!5452)

(assert (=> b!178909 (= lt!88434 lt!88429)))

(declare-fun lt!88432 () ListLongMap!2249)

(assert (=> b!178909 (= lt!88432 (getCurrentListMapNoExtraKeys!178 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))))

(declare-fun lt!88423 () (_ BitVec 64))

(assert (=> b!178909 (= lt!88423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88427 () (_ BitVec 64))

(assert (=> b!178909 (= lt!88427 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88424 () Unit!5452)

(assert (=> b!178909 (= lt!88424 (addApplyDifferent!121 lt!88432 lt!88423 (zeroValue!3515 thiss!1248) lt!88427))))

(assert (=> b!178909 (= (apply!145 (+!262 lt!88432 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248))) lt!88427) (apply!145 lt!88432 lt!88427))))

(declare-fun lt!88418 () Unit!5452)

(assert (=> b!178909 (= lt!88418 lt!88424)))

(declare-fun lt!88436 () ListLongMap!2249)

(assert (=> b!178909 (= lt!88436 (getCurrentListMapNoExtraKeys!178 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))))

(declare-fun lt!88431 () (_ BitVec 64))

(assert (=> b!178909 (= lt!88431 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88417 () (_ BitVec 64))

(assert (=> b!178909 (= lt!88417 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178909 (= lt!88430 (addApplyDifferent!121 lt!88436 lt!88431 (minValue!3515 thiss!1248) lt!88417))))

(assert (=> b!178909 (= (apply!145 (+!262 lt!88436 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248))) lt!88417) (apply!145 lt!88436 lt!88417))))

(declare-fun b!178910 () Bool)

(declare-fun Unit!5455 () Unit!5452)

(assert (=> b!178910 (= e!117899 Unit!5455)))

(declare-fun b!178903 () Bool)

(declare-fun get!2041 (ValueCell!1749 V!5227) V!5227)

(declare-fun dynLambda!488 (Int (_ BitVec 64)) V!5227)

(assert (=> b!178903 (= e!117894 (= (apply!145 lt!88420 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)) (get!2041 (select (arr!3570 (_values!3657 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3674 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178903 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3877 (_values!3657 thiss!1248))))))

(assert (=> b!178903 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun d!54045 () Bool)

(assert (=> d!54045 e!117904))

(declare-fun res!84735 () Bool)

(assert (=> d!54045 (=> (not res!84735) (not e!117904))))

(assert (=> d!54045 (= res!84735 (or (bvsge #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))))

(declare-fun lt!88428 () ListLongMap!2249)

(assert (=> d!54045 (= lt!88420 lt!88428)))

(declare-fun lt!88421 () Unit!5452)

(assert (=> d!54045 (= lt!88421 e!117899)))

(declare-fun c!32077 () Bool)

(assert (=> d!54045 (= c!32077 e!117898)))

(declare-fun res!84740 () Bool)

(assert (=> d!54045 (=> (not res!84740) (not e!117898))))

(assert (=> d!54045 (= res!84740 (bvslt #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun e!117897 () ListLongMap!2249)

(assert (=> d!54045 (= lt!88428 e!117897)))

(assert (=> d!54045 (= c!32072 (and (not (= (bvand (extraKeys!3411 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3411 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54045 (validMask!0 (mask!8642 thiss!1248))))

(assert (=> d!54045 (= (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)) lt!88420)))

(declare-fun b!178911 () Bool)

(assert (=> b!178911 (= e!117903 e!117895)))

(declare-fun res!84738 () Bool)

(assert (=> b!178911 (= res!84738 call!18080)))

(assert (=> b!178911 (=> (not res!84738) (not e!117895))))

(declare-fun b!178912 () Bool)

(assert (=> b!178912 (= e!117901 call!18081)))

(declare-fun bm!18080 () Bool)

(assert (=> bm!18080 (= call!18080 (contains!1212 lt!88420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178913 () Bool)

(assert (=> b!178913 (= e!117897 e!117900)))

(assert (=> b!178913 (= c!32076 (and (not (= (bvand (extraKeys!3411 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3411 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178914 () Bool)

(assert (=> b!178914 (= e!117897 (+!262 call!18082 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))))))

(declare-fun b!178915 () Bool)

(declare-fun res!84733 () Bool)

(assert (=> b!178915 (=> (not res!84733) (not e!117904))))

(assert (=> b!178915 (= res!84733 e!117893)))

(declare-fun res!84736 () Bool)

(assert (=> b!178915 (=> res!84736 e!117893)))

(assert (=> b!178915 (= res!84736 (not e!117896))))

(declare-fun res!84739 () Bool)

(assert (=> b!178915 (=> (not res!84739) (not e!117896))))

(assert (=> b!178915 (= res!84739 (bvslt #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun bm!18081 () Bool)

(assert (=> bm!18081 (= call!18083 (getCurrentListMapNoExtraKeys!178 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))))

(declare-fun bm!18082 () Bool)

(assert (=> bm!18082 (= call!18084 call!18082)))

(assert (= (and d!54045 c!32072) b!178914))

(assert (= (and d!54045 (not c!32072)) b!178913))

(assert (= (and b!178913 c!32076) b!178896))

(assert (= (and b!178913 (not c!32076)) b!178902))

(assert (= (and b!178902 c!32075) b!178900))

(assert (= (and b!178902 (not c!32075)) b!178912))

(assert (= (or b!178900 b!178912) bm!18077))

(assert (= (or b!178896 bm!18077) bm!18076))

(assert (= (or b!178896 b!178900) bm!18082))

(assert (= (or b!178914 bm!18076) bm!18081))

(assert (= (or b!178914 bm!18082) bm!18078))

(assert (= (and d!54045 res!84740) b!178905))

(assert (= (and d!54045 c!32077) b!178909))

(assert (= (and d!54045 (not c!32077)) b!178910))

(assert (= (and d!54045 res!84735) b!178915))

(assert (= (and b!178915 res!84739) b!178907))

(assert (= (and b!178915 (not res!84736)) b!178904))

(assert (= (and b!178904 res!84734) b!178903))

(assert (= (and b!178915 res!84733) b!178908))

(assert (= (and b!178908 c!32074) b!178911))

(assert (= (and b!178908 (not c!32074)) b!178899))

(assert (= (and b!178911 res!84738) b!178895))

(assert (= (or b!178911 b!178899) bm!18080))

(assert (= (and b!178908 res!84732) b!178898))

(assert (= (and b!178898 c!32073) b!178906))

(assert (= (and b!178898 (not c!32073)) b!178897))

(assert (= (and b!178906 res!84737) b!178901))

(assert (= (or b!178906 b!178897) bm!18079))

(declare-fun b_lambda!7095 () Bool)

(assert (=> (not b_lambda!7095) (not b!178903)))

(declare-fun t!7109 () Bool)

(declare-fun tb!2801 () Bool)

(assert (=> (and b!178795 (= (defaultEntry!3674 thiss!1248) (defaultEntry!3674 thiss!1248)) t!7109) tb!2801))

(declare-fun result!4677 () Bool)

(assert (=> tb!2801 (= result!4677 tp_is_empty!4185)))

(assert (=> b!178903 t!7109))

(declare-fun b_and!10939 () Bool)

(assert (= b_and!10935 (and (=> t!7109 result!4677) b_and!10939)))

(declare-fun m!207207 () Bool)

(assert (=> bm!18078 m!207207))

(declare-fun m!207209 () Bool)

(assert (=> b!178904 m!207209))

(assert (=> b!178904 m!207209))

(declare-fun m!207211 () Bool)

(assert (=> b!178904 m!207211))

(declare-fun m!207213 () Bool)

(assert (=> bm!18080 m!207213))

(assert (=> d!54045 m!207167))

(assert (=> b!178905 m!207209))

(assert (=> b!178905 m!207209))

(declare-fun m!207215 () Bool)

(assert (=> b!178905 m!207215))

(declare-fun m!207217 () Bool)

(assert (=> b!178909 m!207217))

(declare-fun m!207219 () Bool)

(assert (=> b!178909 m!207219))

(declare-fun m!207221 () Bool)

(assert (=> b!178909 m!207221))

(declare-fun m!207223 () Bool)

(assert (=> b!178909 m!207223))

(declare-fun m!207225 () Bool)

(assert (=> b!178909 m!207225))

(declare-fun m!207227 () Bool)

(assert (=> b!178909 m!207227))

(declare-fun m!207229 () Bool)

(assert (=> b!178909 m!207229))

(declare-fun m!207231 () Bool)

(assert (=> b!178909 m!207231))

(declare-fun m!207233 () Bool)

(assert (=> b!178909 m!207233))

(declare-fun m!207235 () Bool)

(assert (=> b!178909 m!207235))

(declare-fun m!207237 () Bool)

(assert (=> b!178909 m!207237))

(declare-fun m!207239 () Bool)

(assert (=> b!178909 m!207239))

(assert (=> b!178909 m!207209))

(declare-fun m!207241 () Bool)

(assert (=> b!178909 m!207241))

(assert (=> b!178909 m!207235))

(declare-fun m!207243 () Bool)

(assert (=> b!178909 m!207243))

(assert (=> b!178909 m!207227))

(declare-fun m!207245 () Bool)

(assert (=> b!178909 m!207245))

(assert (=> b!178909 m!207229))

(assert (=> b!178909 m!207233))

(declare-fun m!207247 () Bool)

(assert (=> b!178909 m!207247))

(declare-fun m!207249 () Bool)

(assert (=> b!178895 m!207249))

(assert (=> b!178907 m!207209))

(assert (=> b!178907 m!207209))

(assert (=> b!178907 m!207215))

(declare-fun m!207251 () Bool)

(assert (=> b!178914 m!207251))

(assert (=> b!178903 m!207209))

(declare-fun m!207253 () Bool)

(assert (=> b!178903 m!207253))

(declare-fun m!207255 () Bool)

(assert (=> b!178903 m!207255))

(declare-fun m!207257 () Bool)

(assert (=> b!178903 m!207257))

(declare-fun m!207259 () Bool)

(assert (=> b!178903 m!207259))

(assert (=> b!178903 m!207255))

(assert (=> b!178903 m!207257))

(assert (=> b!178903 m!207209))

(assert (=> bm!18081 m!207221))

(declare-fun m!207261 () Bool)

(assert (=> bm!18079 m!207261))

(declare-fun m!207263 () Bool)

(assert (=> b!178901 m!207263))

(assert (=> b!178792 d!54045))

(declare-fun d!54047 () Bool)

(declare-fun res!84747 () Bool)

(declare-fun e!117908 () Bool)

(assert (=> d!54047 (=> (not res!84747) (not e!117908))))

(declare-fun simpleValid!159 (LongMapFixedSize!2406) Bool)

(assert (=> d!54047 (= res!84747 (simpleValid!159 thiss!1248))))

(assert (=> d!54047 (= (valid!1007 thiss!1248) e!117908)))

(declare-fun b!178924 () Bool)

(declare-fun res!84748 () Bool)

(assert (=> b!178924 (=> (not res!84748) (not e!117908))))

(declare-fun arrayCountValidKeys!0 (array!7531 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178924 (= res!84748 (= (arrayCountValidKeys!0 (_keys!5555 thiss!1248) #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))) (_size!1252 thiss!1248)))))

(declare-fun b!178925 () Bool)

(declare-fun res!84749 () Bool)

(assert (=> b!178925 (=> (not res!84749) (not e!117908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7531 (_ BitVec 32)) Bool)

(assert (=> b!178925 (= res!84749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5555 thiss!1248) (mask!8642 thiss!1248)))))

(declare-fun b!178926 () Bool)

(declare-datatypes ((List!2268 0))(
  ( (Nil!2265) (Cons!2264 (h!2888 (_ BitVec 64)) (t!7110 List!2268)) )
))
(declare-fun arrayNoDuplicates!0 (array!7531 (_ BitVec 32) List!2268) Bool)

(assert (=> b!178926 (= e!117908 (arrayNoDuplicates!0 (_keys!5555 thiss!1248) #b00000000000000000000000000000000 Nil!2265))))

(assert (= (and d!54047 res!84747) b!178924))

(assert (= (and b!178924 res!84748) b!178925))

(assert (= (and b!178925 res!84749) b!178926))

(declare-fun m!207265 () Bool)

(assert (=> d!54047 m!207265))

(declare-fun m!207267 () Bool)

(assert (=> b!178924 m!207267))

(declare-fun m!207269 () Bool)

(assert (=> b!178925 m!207269))

(declare-fun m!207271 () Bool)

(assert (=> b!178926 m!207271))

(assert (=> start!17938 d!54047))

(declare-fun b!178934 () Bool)

(declare-fun e!117913 () Bool)

(assert (=> b!178934 (= e!117913 tp_is_empty!4185)))

(declare-fun condMapEmpty!7164 () Bool)

(declare-fun mapDefault!7164 () ValueCell!1749)

(assert (=> mapNonEmpty!7158 (= condMapEmpty!7164 (= mapRest!7158 ((as const (Array (_ BitVec 32) ValueCell!1749)) mapDefault!7164)))))

(declare-fun mapRes!7164 () Bool)

(assert (=> mapNonEmpty!7158 (= tp!15957 (and e!117913 mapRes!7164))))

(declare-fun b!178933 () Bool)

(declare-fun e!117914 () Bool)

(assert (=> b!178933 (= e!117914 tp_is_empty!4185)))

(declare-fun mapNonEmpty!7164 () Bool)

(declare-fun tp!15966 () Bool)

(assert (=> mapNonEmpty!7164 (= mapRes!7164 (and tp!15966 e!117914))))

(declare-fun mapValue!7164 () ValueCell!1749)

(declare-fun mapKey!7164 () (_ BitVec 32))

(declare-fun mapRest!7164 () (Array (_ BitVec 32) ValueCell!1749))

(assert (=> mapNonEmpty!7164 (= mapRest!7158 (store mapRest!7164 mapKey!7164 mapValue!7164))))

(declare-fun mapIsEmpty!7164 () Bool)

(assert (=> mapIsEmpty!7164 mapRes!7164))

(assert (= (and mapNonEmpty!7158 condMapEmpty!7164) mapIsEmpty!7164))

(assert (= (and mapNonEmpty!7158 (not condMapEmpty!7164)) mapNonEmpty!7164))

(assert (= (and mapNonEmpty!7164 ((_ is ValueCellFull!1749) mapValue!7164)) b!178933))

(assert (= (and mapNonEmpty!7158 ((_ is ValueCellFull!1749) mapDefault!7164)) b!178934))

(declare-fun m!207273 () Bool)

(assert (=> mapNonEmpty!7164 m!207273))

(declare-fun b_lambda!7097 () Bool)

(assert (= b_lambda!7095 (or (and b!178795 b_free!4413) b_lambda!7097)))

(check-sat (not b!178925) tp_is_empty!4185 (not bm!18080) b_and!10939 (not b!178914) (not bm!18078) (not b!178924) (not b!178904) (not d!54045) (not b!178850) (not d!54047) (not mapNonEmpty!7164) (not bm!18079) (not b!178926) (not b!178907) (not b!178903) (not b!178839) (not b!178909) (not d!54043) (not b!178895) (not b_lambda!7097) (not d!54041) (not b_next!4413) (not b!178901) (not b!178852) (not b!178905) (not bm!18081))
(check-sat b_and!10939 (not b_next!4413))
(get-model)

(declare-fun bm!18085 () Bool)

(declare-fun call!18088 () Bool)

(assert (=> bm!18085 (= call!18088 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5555 thiss!1248) (mask!8642 thiss!1248)))))

(declare-fun b!178943 () Bool)

(declare-fun e!117921 () Bool)

(assert (=> b!178943 (= e!117921 call!18088)))

(declare-fun b!178944 () Bool)

(declare-fun e!117922 () Bool)

(declare-fun e!117923 () Bool)

(assert (=> b!178944 (= e!117922 e!117923)))

(declare-fun c!32080 () Bool)

(assert (=> b!178944 (= c!32080 (validKeyInArray!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54049 () Bool)

(declare-fun res!84754 () Bool)

(assert (=> d!54049 (=> res!84754 e!117922)))

(assert (=> d!54049 (= res!84754 (bvsge #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(assert (=> d!54049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5555 thiss!1248) (mask!8642 thiss!1248)) e!117922)))

(declare-fun b!178945 () Bool)

(assert (=> b!178945 (= e!117923 e!117921)))

(declare-fun lt!88444 () (_ BitVec 64))

(assert (=> b!178945 (= lt!88444 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88446 () Unit!5452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7531 (_ BitVec 64) (_ BitVec 32)) Unit!5452)

(assert (=> b!178945 (= lt!88446 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5555 thiss!1248) lt!88444 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!178945 (arrayContainsKey!0 (_keys!5555 thiss!1248) lt!88444 #b00000000000000000000000000000000)))

(declare-fun lt!88445 () Unit!5452)

(assert (=> b!178945 (= lt!88445 lt!88446)))

(declare-fun res!84755 () Bool)

(assert (=> b!178945 (= res!84755 (= (seekEntryOrOpen!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000) (_keys!5555 thiss!1248) (mask!8642 thiss!1248)) (Found!578 #b00000000000000000000000000000000)))))

(assert (=> b!178945 (=> (not res!84755) (not e!117921))))

(declare-fun b!178946 () Bool)

(assert (=> b!178946 (= e!117923 call!18088)))

(assert (= (and d!54049 (not res!84754)) b!178944))

(assert (= (and b!178944 c!32080) b!178945))

(assert (= (and b!178944 (not c!32080)) b!178946))

(assert (= (and b!178945 res!84755) b!178943))

(assert (= (or b!178943 b!178946) bm!18085))

(declare-fun m!207275 () Bool)

(assert (=> bm!18085 m!207275))

(assert (=> b!178944 m!207209))

(assert (=> b!178944 m!207209))

(assert (=> b!178944 m!207215))

(assert (=> b!178945 m!207209))

(declare-fun m!207277 () Bool)

(assert (=> b!178945 m!207277))

(declare-fun m!207279 () Bool)

(assert (=> b!178945 m!207279))

(assert (=> b!178945 m!207209))

(declare-fun m!207281 () Bool)

(assert (=> b!178945 m!207281))

(assert (=> b!178925 d!54049))

(declare-fun b!178965 () Bool)

(declare-fun e!117938 () Bool)

(declare-fun lt!88451 () SeekEntryResult!578)

(assert (=> b!178965 (= e!117938 (bvsge (x!19572 lt!88451) #b01111111111111111111111111111110))))

(declare-fun d!54051 () Bool)

(assert (=> d!54051 e!117938))

(declare-fun c!32089 () Bool)

(assert (=> d!54051 (= c!32089 (and ((_ is Intermediate!578) lt!88451) (undefined!1390 lt!88451)))))

(declare-fun e!117934 () SeekEntryResult!578)

(assert (=> d!54051 (= lt!88451 e!117934)))

(declare-fun c!32087 () Bool)

(assert (=> d!54051 (= c!32087 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!88452 () (_ BitVec 64))

(assert (=> d!54051 (= lt!88452 (select (arr!3569 (_keys!5555 thiss!1248)) (toIndex!0 key!828 (mask!8642 thiss!1248))))))

(assert (=> d!54051 (validMask!0 (mask!8642 thiss!1248))))

(assert (=> d!54051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8642 thiss!1248)) key!828 (_keys!5555 thiss!1248) (mask!8642 thiss!1248)) lt!88451)))

(declare-fun b!178966 () Bool)

(declare-fun e!117937 () Bool)

(assert (=> b!178966 (= e!117938 e!117937)))

(declare-fun res!84762 () Bool)

(assert (=> b!178966 (= res!84762 (and ((_ is Intermediate!578) lt!88451) (not (undefined!1390 lt!88451)) (bvslt (x!19572 lt!88451) #b01111111111111111111111111111110) (bvsge (x!19572 lt!88451) #b00000000000000000000000000000000) (bvsge (x!19572 lt!88451) #b00000000000000000000000000000000)))))

(assert (=> b!178966 (=> (not res!84762) (not e!117937))))

(declare-fun b!178967 () Bool)

(assert (=> b!178967 (= e!117934 (Intermediate!578 true (toIndex!0 key!828 (mask!8642 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178968 () Bool)

(assert (=> b!178968 (and (bvsge (index!4482 lt!88451) #b00000000000000000000000000000000) (bvslt (index!4482 lt!88451) (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun res!84763 () Bool)

(assert (=> b!178968 (= res!84763 (= (select (arr!3569 (_keys!5555 thiss!1248)) (index!4482 lt!88451)) key!828))))

(declare-fun e!117935 () Bool)

(assert (=> b!178968 (=> res!84763 e!117935)))

(assert (=> b!178968 (= e!117937 e!117935)))

(declare-fun b!178969 () Bool)

(assert (=> b!178969 (and (bvsge (index!4482 lt!88451) #b00000000000000000000000000000000) (bvslt (index!4482 lt!88451) (size!3876 (_keys!5555 thiss!1248))))))

(assert (=> b!178969 (= e!117935 (= (select (arr!3569 (_keys!5555 thiss!1248)) (index!4482 lt!88451)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178970 () Bool)

(declare-fun e!117936 () SeekEntryResult!578)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178970 (= e!117936 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8642 thiss!1248)) #b00000000000000000000000000000000 (mask!8642 thiss!1248)) key!828 (_keys!5555 thiss!1248) (mask!8642 thiss!1248)))))

(declare-fun b!178971 () Bool)

(assert (=> b!178971 (= e!117934 e!117936)))

(declare-fun c!32088 () Bool)

(assert (=> b!178971 (= c!32088 (or (= lt!88452 key!828) (= (bvadd lt!88452 lt!88452) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178972 () Bool)

(assert (=> b!178972 (= e!117936 (Intermediate!578 false (toIndex!0 key!828 (mask!8642 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178973 () Bool)

(assert (=> b!178973 (and (bvsge (index!4482 lt!88451) #b00000000000000000000000000000000) (bvslt (index!4482 lt!88451) (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun res!84764 () Bool)

(assert (=> b!178973 (= res!84764 (= (select (arr!3569 (_keys!5555 thiss!1248)) (index!4482 lt!88451)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178973 (=> res!84764 e!117935)))

(assert (= (and d!54051 c!32087) b!178967))

(assert (= (and d!54051 (not c!32087)) b!178971))

(assert (= (and b!178971 c!32088) b!178972))

(assert (= (and b!178971 (not c!32088)) b!178970))

(assert (= (and d!54051 c!32089) b!178965))

(assert (= (and d!54051 (not c!32089)) b!178966))

(assert (= (and b!178966 res!84762) b!178968))

(assert (= (and b!178968 (not res!84763)) b!178973))

(assert (= (and b!178973 (not res!84764)) b!178969))

(assert (=> d!54051 m!207189))

(declare-fun m!207283 () Bool)

(assert (=> d!54051 m!207283))

(assert (=> d!54051 m!207167))

(assert (=> b!178970 m!207189))

(declare-fun m!207285 () Bool)

(assert (=> b!178970 m!207285))

(assert (=> b!178970 m!207285))

(declare-fun m!207287 () Bool)

(assert (=> b!178970 m!207287))

(declare-fun m!207289 () Bool)

(assert (=> b!178973 m!207289))

(assert (=> b!178969 m!207289))

(assert (=> b!178968 m!207289))

(assert (=> d!54041 d!54051))

(declare-fun d!54053 () Bool)

(declare-fun lt!88458 () (_ BitVec 32))

(declare-fun lt!88457 () (_ BitVec 32))

(assert (=> d!54053 (= lt!88458 (bvmul (bvxor lt!88457 (bvlshr lt!88457 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54053 (= lt!88457 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54053 (and (bvsge (mask!8642 thiss!1248) #b00000000000000000000000000000000) (let ((res!84765 (let ((h!2889 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19588 (bvmul (bvxor h!2889 (bvlshr h!2889 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19588 (bvlshr x!19588 #b00000000000000000000000000001101)) (mask!8642 thiss!1248)))))) (and (bvslt res!84765 (bvadd (mask!8642 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84765 #b00000000000000000000000000000000))))))

(assert (=> d!54053 (= (toIndex!0 key!828 (mask!8642 thiss!1248)) (bvand (bvxor lt!88458 (bvlshr lt!88458 #b00000000000000000000000000001101)) (mask!8642 thiss!1248)))))

(assert (=> d!54041 d!54053))

(assert (=> d!54041 d!54039))

(declare-fun d!54055 () Bool)

(declare-fun res!84774 () Bool)

(declare-fun e!117950 () Bool)

(assert (=> d!54055 (=> res!84774 e!117950)))

(assert (=> d!54055 (= res!84774 (bvsge #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(assert (=> d!54055 (= (arrayNoDuplicates!0 (_keys!5555 thiss!1248) #b00000000000000000000000000000000 Nil!2265) e!117950)))

(declare-fun b!178984 () Bool)

(declare-fun e!117947 () Bool)

(declare-fun e!117949 () Bool)

(assert (=> b!178984 (= e!117947 e!117949)))

(declare-fun c!32092 () Bool)

(assert (=> b!178984 (= c!32092 (validKeyInArray!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18088 () Bool)

(declare-fun call!18091 () Bool)

(assert (=> bm!18088 (= call!18091 (arrayNoDuplicates!0 (_keys!5555 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32092 (Cons!2264 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000) Nil!2265) Nil!2265)))))

(declare-fun b!178985 () Bool)

(assert (=> b!178985 (= e!117949 call!18091)))

(declare-fun b!178986 () Bool)

(assert (=> b!178986 (= e!117949 call!18091)))

(declare-fun b!178987 () Bool)

(assert (=> b!178987 (= e!117950 e!117947)))

(declare-fun res!84773 () Bool)

(assert (=> b!178987 (=> (not res!84773) (not e!117947))))

(declare-fun e!117948 () Bool)

(assert (=> b!178987 (= res!84773 (not e!117948))))

(declare-fun res!84772 () Bool)

(assert (=> b!178987 (=> (not res!84772) (not e!117948))))

(assert (=> b!178987 (= res!84772 (validKeyInArray!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178988 () Bool)

(declare-fun contains!1213 (List!2268 (_ BitVec 64)) Bool)

(assert (=> b!178988 (= e!117948 (contains!1213 Nil!2265 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54055 (not res!84774)) b!178987))

(assert (= (and b!178987 res!84772) b!178988))

(assert (= (and b!178987 res!84773) b!178984))

(assert (= (and b!178984 c!32092) b!178986))

(assert (= (and b!178984 (not c!32092)) b!178985))

(assert (= (or b!178986 b!178985) bm!18088))

(assert (=> b!178984 m!207209))

(assert (=> b!178984 m!207209))

(assert (=> b!178984 m!207215))

(assert (=> bm!18088 m!207209))

(declare-fun m!207291 () Bool)

(assert (=> bm!18088 m!207291))

(assert (=> b!178987 m!207209))

(assert (=> b!178987 m!207209))

(assert (=> b!178987 m!207215))

(assert (=> b!178988 m!207209))

(assert (=> b!178988 m!207209))

(declare-fun m!207293 () Bool)

(assert (=> b!178988 m!207293))

(assert (=> b!178926 d!54055))

(declare-fun d!54057 () Bool)

(declare-fun get!2042 (Option!206) V!5227)

(assert (=> d!54057 (= (apply!145 lt!88420 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2042 (getValueByKey!200 (toList!1140 lt!88420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7338 () Bool)

(assert (= bs!7338 d!54057))

(declare-fun m!207295 () Bool)

(assert (=> bs!7338 m!207295))

(assert (=> bs!7338 m!207295))

(declare-fun m!207297 () Bool)

(assert (=> bs!7338 m!207297))

(assert (=> b!178895 d!54057))

(declare-fun d!54059 () Bool)

(assert (=> d!54059 (= (apply!145 lt!88420 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2042 (getValueByKey!200 (toList!1140 lt!88420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7339 () Bool)

(assert (= bs!7339 d!54059))

(declare-fun m!207299 () Bool)

(assert (=> bs!7339 m!207299))

(assert (=> bs!7339 m!207299))

(declare-fun m!207301 () Bool)

(assert (=> bs!7339 m!207301))

(assert (=> b!178901 d!54059))

(declare-fun d!54061 () Bool)

(assert (=> d!54061 (isDefined!153 (getValueByKey!200 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828))))

(declare-fun lt!88461 () Unit!5452)

(declare-fun choose!955 (List!2267 (_ BitVec 64)) Unit!5452)

(assert (=> d!54061 (= lt!88461 (choose!955 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828))))

(declare-fun e!117953 () Bool)

(assert (=> d!54061 e!117953))

(declare-fun res!84777 () Bool)

(assert (=> d!54061 (=> (not res!84777) (not e!117953))))

(declare-fun isStrictlySorted!340 (List!2267) Bool)

(assert (=> d!54061 (= res!84777 (isStrictlySorted!340 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))))))

(assert (=> d!54061 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828) lt!88461)))

(declare-fun b!178991 () Bool)

(assert (=> b!178991 (= e!117953 (containsKey!204 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828))))

(assert (= (and d!54061 res!84777) b!178991))

(assert (=> d!54061 m!207203))

(assert (=> d!54061 m!207203))

(assert (=> d!54061 m!207205))

(declare-fun m!207303 () Bool)

(assert (=> d!54061 m!207303))

(declare-fun m!207305 () Bool)

(assert (=> d!54061 m!207305))

(assert (=> b!178991 m!207199))

(assert (=> b!178850 d!54061))

(declare-fun d!54063 () Bool)

(declare-fun isEmpty!453 (Option!206) Bool)

(assert (=> d!54063 (= (isDefined!153 (getValueByKey!200 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828)) (not (isEmpty!453 (getValueByKey!200 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828))))))

(declare-fun bs!7340 () Bool)

(assert (= bs!7340 d!54063))

(assert (=> bs!7340 m!207203))

(declare-fun m!207307 () Bool)

(assert (=> bs!7340 m!207307))

(assert (=> b!178850 d!54063))

(declare-fun b!179000 () Bool)

(declare-fun e!117958 () Option!206)

(assert (=> b!179000 (= e!117958 (Some!205 (_2!1672 (h!2887 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))))))))

(declare-fun b!179001 () Bool)

(declare-fun e!117959 () Option!206)

(assert (=> b!179001 (= e!117958 e!117959)))

(declare-fun c!32098 () Bool)

(assert (=> b!179001 (= c!32098 (and ((_ is Cons!2263) (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))) (not (= (_1!1672 (h!2887 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))))) key!828))))))

(declare-fun b!179002 () Bool)

(assert (=> b!179002 (= e!117959 (getValueByKey!200 (t!7107 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))) key!828))))

(declare-fun b!179003 () Bool)

(assert (=> b!179003 (= e!117959 None!204)))

(declare-fun d!54065 () Bool)

(declare-fun c!32097 () Bool)

(assert (=> d!54065 (= c!32097 (and ((_ is Cons!2263) (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))) (= (_1!1672 (h!2887 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))))) key!828)))))

(assert (=> d!54065 (= (getValueByKey!200 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828) e!117958)))

(assert (= (and d!54065 c!32097) b!179000))

(assert (= (and d!54065 (not c!32097)) b!179001))

(assert (= (and b!179001 c!32098) b!179002))

(assert (= (and b!179001 (not c!32098)) b!179003))

(declare-fun m!207309 () Bool)

(assert (=> b!179002 m!207309))

(assert (=> b!178850 d!54065))

(declare-fun d!54067 () Bool)

(declare-fun e!117961 () Bool)

(assert (=> d!54067 e!117961))

(declare-fun res!84778 () Bool)

(assert (=> d!54067 (=> res!84778 e!117961)))

(declare-fun lt!88462 () Bool)

(assert (=> d!54067 (= res!84778 (not lt!88462))))

(declare-fun lt!88465 () Bool)

(assert (=> d!54067 (= lt!88462 lt!88465)))

(declare-fun lt!88464 () Unit!5452)

(declare-fun e!117960 () Unit!5452)

(assert (=> d!54067 (= lt!88464 e!117960)))

(declare-fun c!32099 () Bool)

(assert (=> d!54067 (= c!32099 lt!88465)))

(assert (=> d!54067 (= lt!88465 (containsKey!204 (toList!1140 lt!88420) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54067 (= (contains!1212 lt!88420 #b1000000000000000000000000000000000000000000000000000000000000000) lt!88462)))

(declare-fun b!179004 () Bool)

(declare-fun lt!88463 () Unit!5452)

(assert (=> b!179004 (= e!117960 lt!88463)))

(assert (=> b!179004 (= lt!88463 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1140 lt!88420) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!179004 (isDefined!153 (getValueByKey!200 (toList!1140 lt!88420) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179005 () Bool)

(declare-fun Unit!5456 () Unit!5452)

(assert (=> b!179005 (= e!117960 Unit!5456)))

(declare-fun b!179006 () Bool)

(assert (=> b!179006 (= e!117961 (isDefined!153 (getValueByKey!200 (toList!1140 lt!88420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54067 c!32099) b!179004))

(assert (= (and d!54067 (not c!32099)) b!179005))

(assert (= (and d!54067 (not res!84778)) b!179006))

(declare-fun m!207311 () Bool)

(assert (=> d!54067 m!207311))

(declare-fun m!207313 () Bool)

(assert (=> b!179004 m!207313))

(assert (=> b!179004 m!207299))

(assert (=> b!179004 m!207299))

(declare-fun m!207315 () Bool)

(assert (=> b!179004 m!207315))

(assert (=> b!179006 m!207299))

(assert (=> b!179006 m!207299))

(assert (=> b!179006 m!207315))

(assert (=> bm!18079 d!54067))

(declare-fun d!54069 () Bool)

(declare-fun e!117964 () Bool)

(assert (=> d!54069 e!117964))

(declare-fun res!84783 () Bool)

(assert (=> d!54069 (=> (not res!84783) (not e!117964))))

(declare-fun lt!88474 () ListLongMap!2249)

(assert (=> d!54069 (= res!84783 (contains!1212 lt!88474 (_1!1672 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248)))))))

(declare-fun lt!88475 () List!2267)

(assert (=> d!54069 (= lt!88474 (ListLongMap!2250 lt!88475))))

(declare-fun lt!88476 () Unit!5452)

(declare-fun lt!88477 () Unit!5452)

(assert (=> d!54069 (= lt!88476 lt!88477)))

(assert (=> d!54069 (= (getValueByKey!200 lt!88475 (_1!1672 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!106 (List!2267 (_ BitVec 64) V!5227) Unit!5452)

(assert (=> d!54069 (= lt!88477 (lemmaContainsTupThenGetReturnValue!106 lt!88475 (_1!1672 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248)))))))

(declare-fun insertStrictlySorted!109 (List!2267 (_ BitVec 64) V!5227) List!2267)

(assert (=> d!54069 (= lt!88475 (insertStrictlySorted!109 (toList!1140 lt!88437) (_1!1672 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248)))))))

(assert (=> d!54069 (= (+!262 lt!88437 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248))) lt!88474)))

(declare-fun b!179011 () Bool)

(declare-fun res!84784 () Bool)

(assert (=> b!179011 (=> (not res!84784) (not e!117964))))

(assert (=> b!179011 (= res!84784 (= (getValueByKey!200 (toList!1140 lt!88474) (_1!1672 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248))))))))

(declare-fun b!179012 () Bool)

(declare-fun contains!1214 (List!2267 tuple2!3322) Bool)

(assert (=> b!179012 (= e!117964 (contains!1214 (toList!1140 lt!88474) (tuple2!3323 lt!88426 (minValue!3515 thiss!1248))))))

(assert (= (and d!54069 res!84783) b!179011))

(assert (= (and b!179011 res!84784) b!179012))

(declare-fun m!207317 () Bool)

(assert (=> d!54069 m!207317))

(declare-fun m!207319 () Bool)

(assert (=> d!54069 m!207319))

(declare-fun m!207321 () Bool)

(assert (=> d!54069 m!207321))

(declare-fun m!207323 () Bool)

(assert (=> d!54069 m!207323))

(declare-fun m!207325 () Bool)

(assert (=> b!179011 m!207325))

(declare-fun m!207327 () Bool)

(assert (=> b!179012 m!207327))

(assert (=> b!178909 d!54069))

(declare-fun d!54071 () Bool)

(declare-fun e!117982 () Bool)

(assert (=> d!54071 e!117982))

(declare-fun res!84795 () Bool)

(assert (=> d!54071 (=> (not res!84795) (not e!117982))))

(declare-fun lt!88493 () ListLongMap!2249)

(assert (=> d!54071 (= res!84795 (not (contains!1212 lt!88493 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!117981 () ListLongMap!2249)

(assert (=> d!54071 (= lt!88493 e!117981)))

(declare-fun c!32108 () Bool)

(assert (=> d!54071 (= c!32108 (bvsge #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(assert (=> d!54071 (validMask!0 (mask!8642 thiss!1248))))

(assert (=> d!54071 (= (getCurrentListMapNoExtraKeys!178 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)) lt!88493)))

(declare-fun b!179037 () Bool)

(declare-fun e!117980 () Bool)

(assert (=> b!179037 (= e!117980 (validKeyInArray!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179037 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!179038 () Bool)

(declare-fun res!84794 () Bool)

(assert (=> b!179038 (=> (not res!84794) (not e!117982))))

(assert (=> b!179038 (= res!84794 (not (contains!1212 lt!88493 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179039 () Bool)

(declare-fun e!117985 () ListLongMap!2249)

(assert (=> b!179039 (= e!117981 e!117985)))

(declare-fun c!32111 () Bool)

(assert (=> b!179039 (= c!32111 (validKeyInArray!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18091 () Bool)

(declare-fun call!18094 () ListLongMap!2249)

(assert (=> bm!18091 (= call!18094 (getCurrentListMapNoExtraKeys!178 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3674 thiss!1248)))))

(declare-fun b!179040 () Bool)

(declare-fun e!117979 () Bool)

(assert (=> b!179040 (= e!117982 e!117979)))

(declare-fun c!32110 () Bool)

(assert (=> b!179040 (= c!32110 e!117980)))

(declare-fun res!84793 () Bool)

(assert (=> b!179040 (=> (not res!84793) (not e!117980))))

(assert (=> b!179040 (= res!84793 (bvslt #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun b!179041 () Bool)

(declare-fun e!117983 () Bool)

(declare-fun isEmpty!454 (ListLongMap!2249) Bool)

(assert (=> b!179041 (= e!117983 (isEmpty!454 lt!88493))))

(declare-fun b!179042 () Bool)

(assert (=> b!179042 (= e!117983 (= lt!88493 (getCurrentListMapNoExtraKeys!178 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3674 thiss!1248))))))

(declare-fun b!179043 () Bool)

(assert (=> b!179043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(assert (=> b!179043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3877 (_values!3657 thiss!1248))))))

(declare-fun e!117984 () Bool)

(assert (=> b!179043 (= e!117984 (= (apply!145 lt!88493 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)) (get!2041 (select (arr!3570 (_values!3657 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3674 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!179044 () Bool)

(assert (=> b!179044 (= e!117979 e!117983)))

(declare-fun c!32109 () Bool)

(assert (=> b!179044 (= c!32109 (bvslt #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun b!179045 () Bool)

(assert (=> b!179045 (= e!117981 (ListLongMap!2250 Nil!2264))))

(declare-fun b!179046 () Bool)

(assert (=> b!179046 (= e!117985 call!18094)))

(declare-fun b!179047 () Bool)

(assert (=> b!179047 (= e!117979 e!117984)))

(assert (=> b!179047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun res!84796 () Bool)

(assert (=> b!179047 (= res!84796 (contains!1212 lt!88493 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179047 (=> (not res!84796) (not e!117984))))

(declare-fun b!179048 () Bool)

(declare-fun lt!88494 () Unit!5452)

(declare-fun lt!88497 () Unit!5452)

(assert (=> b!179048 (= lt!88494 lt!88497)))

(declare-fun lt!88496 () V!5227)

(declare-fun lt!88495 () (_ BitVec 64))

(declare-fun lt!88498 () (_ BitVec 64))

(declare-fun lt!88492 () ListLongMap!2249)

(assert (=> b!179048 (not (contains!1212 (+!262 lt!88492 (tuple2!3323 lt!88495 lt!88496)) lt!88498))))

(declare-fun addStillNotContains!80 (ListLongMap!2249 (_ BitVec 64) V!5227 (_ BitVec 64)) Unit!5452)

(assert (=> b!179048 (= lt!88497 (addStillNotContains!80 lt!88492 lt!88495 lt!88496 lt!88498))))

(assert (=> b!179048 (= lt!88498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!179048 (= lt!88496 (get!2041 (select (arr!3570 (_values!3657 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3674 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179048 (= lt!88495 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179048 (= lt!88492 call!18094)))

(assert (=> b!179048 (= e!117985 (+!262 call!18094 (tuple2!3323 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000) (get!2041 (select (arr!3570 (_values!3657 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3674 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!54071 c!32108) b!179045))

(assert (= (and d!54071 (not c!32108)) b!179039))

(assert (= (and b!179039 c!32111) b!179048))

(assert (= (and b!179039 (not c!32111)) b!179046))

(assert (= (or b!179048 b!179046) bm!18091))

(assert (= (and d!54071 res!84795) b!179038))

(assert (= (and b!179038 res!84794) b!179040))

(assert (= (and b!179040 res!84793) b!179037))

(assert (= (and b!179040 c!32110) b!179047))

(assert (= (and b!179040 (not c!32110)) b!179044))

(assert (= (and b!179047 res!84796) b!179043))

(assert (= (and b!179044 c!32109) b!179042))

(assert (= (and b!179044 (not c!32109)) b!179041))

(declare-fun b_lambda!7099 () Bool)

(assert (=> (not b_lambda!7099) (not b!179043)))

(assert (=> b!179043 t!7109))

(declare-fun b_and!10941 () Bool)

(assert (= b_and!10939 (and (=> t!7109 result!4677) b_and!10941)))

(declare-fun b_lambda!7101 () Bool)

(assert (=> (not b_lambda!7101) (not b!179048)))

(assert (=> b!179048 t!7109))

(declare-fun b_and!10943 () Bool)

(assert (= b_and!10941 (and (=> t!7109 result!4677) b_and!10943)))

(assert (=> b!179039 m!207209))

(assert (=> b!179039 m!207209))

(assert (=> b!179039 m!207215))

(declare-fun m!207329 () Bool)

(assert (=> b!179038 m!207329))

(assert (=> b!179047 m!207209))

(assert (=> b!179047 m!207209))

(declare-fun m!207331 () Bool)

(assert (=> b!179047 m!207331))

(declare-fun m!207333 () Bool)

(assert (=> b!179041 m!207333))

(declare-fun m!207335 () Bool)

(assert (=> d!54071 m!207335))

(assert (=> d!54071 m!207167))

(assert (=> b!179043 m!207255))

(assert (=> b!179043 m!207257))

(assert (=> b!179043 m!207209))

(assert (=> b!179043 m!207209))

(declare-fun m!207337 () Bool)

(assert (=> b!179043 m!207337))

(assert (=> b!179043 m!207255))

(assert (=> b!179043 m!207257))

(assert (=> b!179043 m!207259))

(declare-fun m!207339 () Bool)

(assert (=> b!179042 m!207339))

(assert (=> bm!18091 m!207339))

(assert (=> b!179037 m!207209))

(assert (=> b!179037 m!207209))

(assert (=> b!179037 m!207215))

(assert (=> b!179048 m!207255))

(assert (=> b!179048 m!207257))

(assert (=> b!179048 m!207259))

(assert (=> b!179048 m!207255))

(assert (=> b!179048 m!207257))

(declare-fun m!207341 () Bool)

(assert (=> b!179048 m!207341))

(declare-fun m!207343 () Bool)

(assert (=> b!179048 m!207343))

(assert (=> b!179048 m!207209))

(assert (=> b!179048 m!207343))

(declare-fun m!207345 () Bool)

(assert (=> b!179048 m!207345))

(declare-fun m!207347 () Bool)

(assert (=> b!179048 m!207347))

(assert (=> b!178909 d!54071))

(declare-fun d!54073 () Bool)

(assert (=> d!54073 (= (apply!145 lt!88432 lt!88427) (get!2042 (getValueByKey!200 (toList!1140 lt!88432) lt!88427)))))

(declare-fun bs!7341 () Bool)

(assert (= bs!7341 d!54073))

(declare-fun m!207349 () Bool)

(assert (=> bs!7341 m!207349))

(assert (=> bs!7341 m!207349))

(declare-fun m!207351 () Bool)

(assert (=> bs!7341 m!207351))

(assert (=> b!178909 d!54073))

(declare-fun d!54075 () Bool)

(declare-fun e!117986 () Bool)

(assert (=> d!54075 e!117986))

(declare-fun res!84797 () Bool)

(assert (=> d!54075 (=> (not res!84797) (not e!117986))))

(declare-fun lt!88499 () ListLongMap!2249)

(assert (=> d!54075 (= res!84797 (contains!1212 lt!88499 (_1!1672 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))))))

(declare-fun lt!88500 () List!2267)

(assert (=> d!54075 (= lt!88499 (ListLongMap!2250 lt!88500))))

(declare-fun lt!88501 () Unit!5452)

(declare-fun lt!88502 () Unit!5452)

(assert (=> d!54075 (= lt!88501 lt!88502)))

(assert (=> d!54075 (= (getValueByKey!200 lt!88500 (_1!1672 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))))))

(assert (=> d!54075 (= lt!88502 (lemmaContainsTupThenGetReturnValue!106 lt!88500 (_1!1672 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))))))

(assert (=> d!54075 (= lt!88500 (insertStrictlySorted!109 (toList!1140 lt!88416) (_1!1672 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))))))

(assert (=> d!54075 (= (+!262 lt!88416 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248))) lt!88499)))

(declare-fun b!179049 () Bool)

(declare-fun res!84798 () Bool)

(assert (=> b!179049 (=> (not res!84798) (not e!117986))))

(assert (=> b!179049 (= res!84798 (= (getValueByKey!200 (toList!1140 lt!88499) (_1!1672 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248))))))))

(declare-fun b!179050 () Bool)

(assert (=> b!179050 (= e!117986 (contains!1214 (toList!1140 lt!88499) (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248))))))

(assert (= (and d!54075 res!84797) b!179049))

(assert (= (and b!179049 res!84798) b!179050))

(declare-fun m!207353 () Bool)

(assert (=> d!54075 m!207353))

(declare-fun m!207355 () Bool)

(assert (=> d!54075 m!207355))

(declare-fun m!207357 () Bool)

(assert (=> d!54075 m!207357))

(declare-fun m!207359 () Bool)

(assert (=> d!54075 m!207359))

(declare-fun m!207361 () Bool)

(assert (=> b!179049 m!207361))

(declare-fun m!207363 () Bool)

(assert (=> b!179050 m!207363))

(assert (=> b!178909 d!54075))

(declare-fun d!54077 () Bool)

(assert (=> d!54077 (= (apply!145 (+!262 lt!88436 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248))) lt!88417) (apply!145 lt!88436 lt!88417))))

(declare-fun lt!88505 () Unit!5452)

(declare-fun choose!956 (ListLongMap!2249 (_ BitVec 64) V!5227 (_ BitVec 64)) Unit!5452)

(assert (=> d!54077 (= lt!88505 (choose!956 lt!88436 lt!88431 (minValue!3515 thiss!1248) lt!88417))))

(declare-fun e!117989 () Bool)

(assert (=> d!54077 e!117989))

(declare-fun res!84801 () Bool)

(assert (=> d!54077 (=> (not res!84801) (not e!117989))))

(assert (=> d!54077 (= res!84801 (contains!1212 lt!88436 lt!88417))))

(assert (=> d!54077 (= (addApplyDifferent!121 lt!88436 lt!88431 (minValue!3515 thiss!1248) lt!88417) lt!88505)))

(declare-fun b!179054 () Bool)

(assert (=> b!179054 (= e!117989 (not (= lt!88417 lt!88431)))))

(assert (= (and d!54077 res!84801) b!179054))

(assert (=> d!54077 m!207241))

(assert (=> d!54077 m!207233))

(declare-fun m!207365 () Bool)

(assert (=> d!54077 m!207365))

(assert (=> d!54077 m!207233))

(assert (=> d!54077 m!207247))

(declare-fun m!207367 () Bool)

(assert (=> d!54077 m!207367))

(assert (=> b!178909 d!54077))

(declare-fun d!54079 () Bool)

(declare-fun e!117990 () Bool)

(assert (=> d!54079 e!117990))

(declare-fun res!84802 () Bool)

(assert (=> d!54079 (=> (not res!84802) (not e!117990))))

(declare-fun lt!88506 () ListLongMap!2249)

(assert (=> d!54079 (= res!84802 (contains!1212 lt!88506 (_1!1672 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248)))))))

(declare-fun lt!88507 () List!2267)

(assert (=> d!54079 (= lt!88506 (ListLongMap!2250 lt!88507))))

(declare-fun lt!88508 () Unit!5452)

(declare-fun lt!88509 () Unit!5452)

(assert (=> d!54079 (= lt!88508 lt!88509)))

(assert (=> d!54079 (= (getValueByKey!200 lt!88507 (_1!1672 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248)))))))

(assert (=> d!54079 (= lt!88509 (lemmaContainsTupThenGetReturnValue!106 lt!88507 (_1!1672 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248)))))))

(assert (=> d!54079 (= lt!88507 (insertStrictlySorted!109 (toList!1140 lt!88436) (_1!1672 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248)))))))

(assert (=> d!54079 (= (+!262 lt!88436 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248))) lt!88506)))

(declare-fun b!179055 () Bool)

(declare-fun res!84803 () Bool)

(assert (=> b!179055 (=> (not res!84803) (not e!117990))))

(assert (=> b!179055 (= res!84803 (= (getValueByKey!200 (toList!1140 lt!88506) (_1!1672 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248))))))))

(declare-fun b!179056 () Bool)

(assert (=> b!179056 (= e!117990 (contains!1214 (toList!1140 lt!88506) (tuple2!3323 lt!88431 (minValue!3515 thiss!1248))))))

(assert (= (and d!54079 res!84802) b!179055))

(assert (= (and b!179055 res!84803) b!179056))

(declare-fun m!207369 () Bool)

(assert (=> d!54079 m!207369))

(declare-fun m!207371 () Bool)

(assert (=> d!54079 m!207371))

(declare-fun m!207373 () Bool)

(assert (=> d!54079 m!207373))

(declare-fun m!207375 () Bool)

(assert (=> d!54079 m!207375))

(declare-fun m!207377 () Bool)

(assert (=> b!179055 m!207377))

(declare-fun m!207379 () Bool)

(assert (=> b!179056 m!207379))

(assert (=> b!178909 d!54079))

(declare-fun d!54081 () Bool)

(declare-fun e!117992 () Bool)

(assert (=> d!54081 e!117992))

(declare-fun res!84804 () Bool)

(assert (=> d!54081 (=> res!84804 e!117992)))

(declare-fun lt!88510 () Bool)

(assert (=> d!54081 (= res!84804 (not lt!88510))))

(declare-fun lt!88513 () Bool)

(assert (=> d!54081 (= lt!88510 lt!88513)))

(declare-fun lt!88512 () Unit!5452)

(declare-fun e!117991 () Unit!5452)

(assert (=> d!54081 (= lt!88512 e!117991)))

(declare-fun c!32112 () Bool)

(assert (=> d!54081 (= c!32112 lt!88513)))

(assert (=> d!54081 (= lt!88513 (containsKey!204 (toList!1140 (+!262 lt!88416 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))) lt!88422))))

(assert (=> d!54081 (= (contains!1212 (+!262 lt!88416 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248))) lt!88422) lt!88510)))

(declare-fun b!179057 () Bool)

(declare-fun lt!88511 () Unit!5452)

(assert (=> b!179057 (= e!117991 lt!88511)))

(assert (=> b!179057 (= lt!88511 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1140 (+!262 lt!88416 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))) lt!88422))))

(assert (=> b!179057 (isDefined!153 (getValueByKey!200 (toList!1140 (+!262 lt!88416 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))) lt!88422))))

(declare-fun b!179058 () Bool)

(declare-fun Unit!5457 () Unit!5452)

(assert (=> b!179058 (= e!117991 Unit!5457)))

(declare-fun b!179059 () Bool)

(assert (=> b!179059 (= e!117992 (isDefined!153 (getValueByKey!200 (toList!1140 (+!262 lt!88416 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248)))) lt!88422)))))

(assert (= (and d!54081 c!32112) b!179057))

(assert (= (and d!54081 (not c!32112)) b!179058))

(assert (= (and d!54081 (not res!84804)) b!179059))

(declare-fun m!207381 () Bool)

(assert (=> d!54081 m!207381))

(declare-fun m!207383 () Bool)

(assert (=> b!179057 m!207383))

(declare-fun m!207385 () Bool)

(assert (=> b!179057 m!207385))

(assert (=> b!179057 m!207385))

(declare-fun m!207387 () Bool)

(assert (=> b!179057 m!207387))

(assert (=> b!179059 m!207385))

(assert (=> b!179059 m!207385))

(assert (=> b!179059 m!207387))

(assert (=> b!178909 d!54081))

(declare-fun d!54083 () Bool)

(assert (=> d!54083 (= (apply!145 lt!88437 lt!88435) (get!2042 (getValueByKey!200 (toList!1140 lt!88437) lt!88435)))))

(declare-fun bs!7342 () Bool)

(assert (= bs!7342 d!54083))

(declare-fun m!207389 () Bool)

(assert (=> bs!7342 m!207389))

(assert (=> bs!7342 m!207389))

(declare-fun m!207391 () Bool)

(assert (=> bs!7342 m!207391))

(assert (=> b!178909 d!54083))

(declare-fun d!54085 () Bool)

(assert (=> d!54085 (contains!1212 (+!262 lt!88416 (tuple2!3323 lt!88433 (zeroValue!3515 thiss!1248))) lt!88422)))

(declare-fun lt!88516 () Unit!5452)

(declare-fun choose!957 (ListLongMap!2249 (_ BitVec 64) V!5227 (_ BitVec 64)) Unit!5452)

(assert (=> d!54085 (= lt!88516 (choose!957 lt!88416 lt!88433 (zeroValue!3515 thiss!1248) lt!88422))))

(assert (=> d!54085 (contains!1212 lt!88416 lt!88422)))

(assert (=> d!54085 (= (addStillContains!121 lt!88416 lt!88433 (zeroValue!3515 thiss!1248) lt!88422) lt!88516)))

(declare-fun bs!7343 () Bool)

(assert (= bs!7343 d!54085))

(assert (=> bs!7343 m!207235))

(assert (=> bs!7343 m!207235))

(assert (=> bs!7343 m!207237))

(declare-fun m!207393 () Bool)

(assert (=> bs!7343 m!207393))

(declare-fun m!207395 () Bool)

(assert (=> bs!7343 m!207395))

(assert (=> b!178909 d!54085))

(declare-fun d!54087 () Bool)

(assert (=> d!54087 (= (apply!145 lt!88436 lt!88417) (get!2042 (getValueByKey!200 (toList!1140 lt!88436) lt!88417)))))

(declare-fun bs!7344 () Bool)

(assert (= bs!7344 d!54087))

(declare-fun m!207397 () Bool)

(assert (=> bs!7344 m!207397))

(assert (=> bs!7344 m!207397))

(declare-fun m!207399 () Bool)

(assert (=> bs!7344 m!207399))

(assert (=> b!178909 d!54087))

(declare-fun d!54089 () Bool)

(assert (=> d!54089 (= (apply!145 (+!262 lt!88432 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248))) lt!88427) (apply!145 lt!88432 lt!88427))))

(declare-fun lt!88517 () Unit!5452)

(assert (=> d!54089 (= lt!88517 (choose!956 lt!88432 lt!88423 (zeroValue!3515 thiss!1248) lt!88427))))

(declare-fun e!117993 () Bool)

(assert (=> d!54089 e!117993))

(declare-fun res!84805 () Bool)

(assert (=> d!54089 (=> (not res!84805) (not e!117993))))

(assert (=> d!54089 (= res!84805 (contains!1212 lt!88432 lt!88427))))

(assert (=> d!54089 (= (addApplyDifferent!121 lt!88432 lt!88423 (zeroValue!3515 thiss!1248) lt!88427) lt!88517)))

(declare-fun b!179061 () Bool)

(assert (=> b!179061 (= e!117993 (not (= lt!88427 lt!88423)))))

(assert (= (and d!54089 res!84805) b!179061))

(assert (=> d!54089 m!207217))

(assert (=> d!54089 m!207227))

(declare-fun m!207401 () Bool)

(assert (=> d!54089 m!207401))

(assert (=> d!54089 m!207227))

(assert (=> d!54089 m!207245))

(declare-fun m!207403 () Bool)

(assert (=> d!54089 m!207403))

(assert (=> b!178909 d!54089))

(declare-fun d!54091 () Bool)

(assert (=> d!54091 (= (apply!145 (+!262 lt!88432 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248))) lt!88427) (get!2042 (getValueByKey!200 (toList!1140 (+!262 lt!88432 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248)))) lt!88427)))))

(declare-fun bs!7345 () Bool)

(assert (= bs!7345 d!54091))

(declare-fun m!207405 () Bool)

(assert (=> bs!7345 m!207405))

(assert (=> bs!7345 m!207405))

(declare-fun m!207407 () Bool)

(assert (=> bs!7345 m!207407))

(assert (=> b!178909 d!54091))

(declare-fun d!54093 () Bool)

(declare-fun e!117994 () Bool)

(assert (=> d!54093 e!117994))

(declare-fun res!84806 () Bool)

(assert (=> d!54093 (=> (not res!84806) (not e!117994))))

(declare-fun lt!88518 () ListLongMap!2249)

(assert (=> d!54093 (= res!84806 (contains!1212 lt!88518 (_1!1672 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248)))))))

(declare-fun lt!88519 () List!2267)

(assert (=> d!54093 (= lt!88518 (ListLongMap!2250 lt!88519))))

(declare-fun lt!88520 () Unit!5452)

(declare-fun lt!88521 () Unit!5452)

(assert (=> d!54093 (= lt!88520 lt!88521)))

(assert (=> d!54093 (= (getValueByKey!200 lt!88519 (_1!1672 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248)))))))

(assert (=> d!54093 (= lt!88521 (lemmaContainsTupThenGetReturnValue!106 lt!88519 (_1!1672 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248)))))))

(assert (=> d!54093 (= lt!88519 (insertStrictlySorted!109 (toList!1140 lt!88432) (_1!1672 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248)))))))

(assert (=> d!54093 (= (+!262 lt!88432 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248))) lt!88518)))

(declare-fun b!179062 () Bool)

(declare-fun res!84807 () Bool)

(assert (=> b!179062 (=> (not res!84807) (not e!117994))))

(assert (=> b!179062 (= res!84807 (= (getValueByKey!200 (toList!1140 lt!88518) (_1!1672 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248))))))))

(declare-fun b!179063 () Bool)

(assert (=> b!179063 (= e!117994 (contains!1214 (toList!1140 lt!88518) (tuple2!3323 lt!88423 (zeroValue!3515 thiss!1248))))))

(assert (= (and d!54093 res!84806) b!179062))

(assert (= (and b!179062 res!84807) b!179063))

(declare-fun m!207409 () Bool)

(assert (=> d!54093 m!207409))

(declare-fun m!207411 () Bool)

(assert (=> d!54093 m!207411))

(declare-fun m!207413 () Bool)

(assert (=> d!54093 m!207413))

(declare-fun m!207415 () Bool)

(assert (=> d!54093 m!207415))

(declare-fun m!207417 () Bool)

(assert (=> b!179062 m!207417))

(declare-fun m!207419 () Bool)

(assert (=> b!179063 m!207419))

(assert (=> b!178909 d!54093))

(declare-fun d!54095 () Bool)

(assert (=> d!54095 (= (apply!145 (+!262 lt!88437 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248))) lt!88435) (get!2042 (getValueByKey!200 (toList!1140 (+!262 lt!88437 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248)))) lt!88435)))))

(declare-fun bs!7346 () Bool)

(assert (= bs!7346 d!54095))

(declare-fun m!207421 () Bool)

(assert (=> bs!7346 m!207421))

(assert (=> bs!7346 m!207421))

(declare-fun m!207423 () Bool)

(assert (=> bs!7346 m!207423))

(assert (=> b!178909 d!54095))

(declare-fun d!54097 () Bool)

(assert (=> d!54097 (= (apply!145 (+!262 lt!88437 (tuple2!3323 lt!88426 (minValue!3515 thiss!1248))) lt!88435) (apply!145 lt!88437 lt!88435))))

(declare-fun lt!88522 () Unit!5452)

(assert (=> d!54097 (= lt!88522 (choose!956 lt!88437 lt!88426 (minValue!3515 thiss!1248) lt!88435))))

(declare-fun e!117995 () Bool)

(assert (=> d!54097 e!117995))

(declare-fun res!84808 () Bool)

(assert (=> d!54097 (=> (not res!84808) (not e!117995))))

(assert (=> d!54097 (= res!84808 (contains!1212 lt!88437 lt!88435))))

(assert (=> d!54097 (= (addApplyDifferent!121 lt!88437 lt!88426 (minValue!3515 thiss!1248) lt!88435) lt!88522)))

(declare-fun b!179064 () Bool)

(assert (=> b!179064 (= e!117995 (not (= lt!88435 lt!88426)))))

(assert (= (and d!54097 res!84808) b!179064))

(assert (=> d!54097 m!207225))

(assert (=> d!54097 m!207229))

(declare-fun m!207425 () Bool)

(assert (=> d!54097 m!207425))

(assert (=> d!54097 m!207229))

(assert (=> d!54097 m!207231))

(declare-fun m!207427 () Bool)

(assert (=> d!54097 m!207427))

(assert (=> b!178909 d!54097))

(declare-fun d!54099 () Bool)

(assert (=> d!54099 (= (apply!145 (+!262 lt!88436 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248))) lt!88417) (get!2042 (getValueByKey!200 (toList!1140 (+!262 lt!88436 (tuple2!3323 lt!88431 (minValue!3515 thiss!1248)))) lt!88417)))))

(declare-fun bs!7347 () Bool)

(assert (= bs!7347 d!54099))

(declare-fun m!207429 () Bool)

(assert (=> bs!7347 m!207429))

(assert (=> bs!7347 m!207429))

(declare-fun m!207431 () Bool)

(assert (=> bs!7347 m!207431))

(assert (=> b!178909 d!54099))

(assert (=> b!178852 d!54063))

(assert (=> b!178852 d!54065))

(declare-fun b!179073 () Bool)

(declare-fun res!84817 () Bool)

(declare-fun e!117998 () Bool)

(assert (=> b!179073 (=> (not res!84817) (not e!117998))))

(assert (=> b!179073 (= res!84817 (and (= (size!3877 (_values!3657 thiss!1248)) (bvadd (mask!8642 thiss!1248) #b00000000000000000000000000000001)) (= (size!3876 (_keys!5555 thiss!1248)) (size!3877 (_values!3657 thiss!1248))) (bvsge (_size!1252 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1252 thiss!1248) (bvadd (mask!8642 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!179075 () Bool)

(declare-fun res!84819 () Bool)

(assert (=> b!179075 (=> (not res!84819) (not e!117998))))

(declare-fun size!3880 (LongMapFixedSize!2406) (_ BitVec 32))

(assert (=> b!179075 (= res!84819 (= (size!3880 thiss!1248) (bvadd (_size!1252 thiss!1248) (bvsdiv (bvadd (extraKeys!3411 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!179076 () Bool)

(assert (=> b!179076 (= e!117998 (and (bvsge (extraKeys!3411 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3411 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1252 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!179074 () Bool)

(declare-fun res!84818 () Bool)

(assert (=> b!179074 (=> (not res!84818) (not e!117998))))

(assert (=> b!179074 (= res!84818 (bvsge (size!3880 thiss!1248) (_size!1252 thiss!1248)))))

(declare-fun d!54101 () Bool)

(declare-fun res!84820 () Bool)

(assert (=> d!54101 (=> (not res!84820) (not e!117998))))

(assert (=> d!54101 (= res!84820 (validMask!0 (mask!8642 thiss!1248)))))

(assert (=> d!54101 (= (simpleValid!159 thiss!1248) e!117998)))

(assert (= (and d!54101 res!84820) b!179073))

(assert (= (and b!179073 res!84817) b!179074))

(assert (= (and b!179074 res!84818) b!179075))

(assert (= (and b!179075 res!84819) b!179076))

(declare-fun m!207433 () Bool)

(assert (=> b!179075 m!207433))

(assert (=> b!179074 m!207433))

(assert (=> d!54101 m!207167))

(assert (=> d!54047 d!54101))

(declare-fun d!54103 () Bool)

(assert (=> d!54103 (= (apply!145 lt!88420 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)) (get!2042 (getValueByKey!200 (toList!1140 lt!88420) (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7348 () Bool)

(assert (= bs!7348 d!54103))

(assert (=> bs!7348 m!207209))

(declare-fun m!207435 () Bool)

(assert (=> bs!7348 m!207435))

(assert (=> bs!7348 m!207435))

(declare-fun m!207437 () Bool)

(assert (=> bs!7348 m!207437))

(assert (=> b!178903 d!54103))

(declare-fun d!54105 () Bool)

(declare-fun c!32115 () Bool)

(assert (=> d!54105 (= c!32115 ((_ is ValueCellFull!1749) (select (arr!3570 (_values!3657 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!118001 () V!5227)

(assert (=> d!54105 (= (get!2041 (select (arr!3570 (_values!3657 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3674 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!118001)))

(declare-fun b!179081 () Bool)

(declare-fun get!2043 (ValueCell!1749 V!5227) V!5227)

(assert (=> b!179081 (= e!118001 (get!2043 (select (arr!3570 (_values!3657 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3674 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179082 () Bool)

(declare-fun get!2044 (ValueCell!1749 V!5227) V!5227)

(assert (=> b!179082 (= e!118001 (get!2044 (select (arr!3570 (_values!3657 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3674 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54105 c!32115) b!179081))

(assert (= (and d!54105 (not c!32115)) b!179082))

(assert (=> b!179081 m!207255))

(assert (=> b!179081 m!207257))

(declare-fun m!207439 () Bool)

(assert (=> b!179081 m!207439))

(assert (=> b!179082 m!207255))

(assert (=> b!179082 m!207257))

(declare-fun m!207441 () Bool)

(assert (=> b!179082 m!207441))

(assert (=> b!178903 d!54105))

(assert (=> d!54045 d!54039))

(declare-fun bm!18094 () Bool)

(declare-fun call!18097 () (_ BitVec 32))

(assert (=> bm!18094 (= call!18097 (arrayCountValidKeys!0 (_keys!5555 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3876 (_keys!5555 thiss!1248))))))

(declare-fun b!179091 () Bool)

(declare-fun e!118007 () (_ BitVec 32))

(assert (=> b!179091 (= e!118007 call!18097)))

(declare-fun b!179092 () Bool)

(declare-fun e!118006 () (_ BitVec 32))

(assert (=> b!179092 (= e!118006 #b00000000000000000000000000000000)))

(declare-fun b!179093 () Bool)

(assert (=> b!179093 (= e!118006 e!118007)))

(declare-fun c!32121 () Bool)

(assert (=> b!179093 (= c!32121 (validKeyInArray!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54107 () Bool)

(declare-fun lt!88525 () (_ BitVec 32))

(assert (=> d!54107 (and (bvsge lt!88525 #b00000000000000000000000000000000) (bvsle lt!88525 (bvsub (size!3876 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54107 (= lt!88525 e!118006)))

(declare-fun c!32120 () Bool)

(assert (=> d!54107 (= c!32120 (bvsge #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))))))

(assert (=> d!54107 (and (bvsle #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3876 (_keys!5555 thiss!1248)) (size!3876 (_keys!5555 thiss!1248))))))

(assert (=> d!54107 (= (arrayCountValidKeys!0 (_keys!5555 thiss!1248) #b00000000000000000000000000000000 (size!3876 (_keys!5555 thiss!1248))) lt!88525)))

(declare-fun b!179094 () Bool)

(assert (=> b!179094 (= e!118007 (bvadd #b00000000000000000000000000000001 call!18097))))

(assert (= (and d!54107 c!32120) b!179092))

(assert (= (and d!54107 (not c!32120)) b!179093))

(assert (= (and b!179093 c!32121) b!179094))

(assert (= (and b!179093 (not c!32121)) b!179091))

(assert (= (or b!179094 b!179091) bm!18094))

(declare-fun m!207443 () Bool)

(assert (=> bm!18094 m!207443))

(assert (=> b!179093 m!207209))

(assert (=> b!179093 m!207209))

(assert (=> b!179093 m!207215))

(assert (=> b!178924 d!54107))

(declare-fun d!54109 () Bool)

(declare-fun res!84825 () Bool)

(declare-fun e!118012 () Bool)

(assert (=> d!54109 (=> res!84825 e!118012)))

(assert (=> d!54109 (= res!84825 (and ((_ is Cons!2263) (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))) (= (_1!1672 (h!2887 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))))) key!828)))))

(assert (=> d!54109 (= (containsKey!204 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))) key!828) e!118012)))

(declare-fun b!179099 () Bool)

(declare-fun e!118013 () Bool)

(assert (=> b!179099 (= e!118012 e!118013)))

(declare-fun res!84826 () Bool)

(assert (=> b!179099 (=> (not res!84826) (not e!118013))))

(assert (=> b!179099 (= res!84826 (and (or (not ((_ is Cons!2263) (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))))) (bvsle (_1!1672 (h!2887 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))))) key!828)) ((_ is Cons!2263) (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))) (bvslt (_1!1672 (h!2887 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248))))) key!828)))))

(declare-fun b!179100 () Bool)

(assert (=> b!179100 (= e!118013 (containsKey!204 (t!7107 (toList!1140 (getCurrentListMap!792 (_keys!5555 thiss!1248) (_values!3657 thiss!1248) (mask!8642 thiss!1248) (extraKeys!3411 thiss!1248) (zeroValue!3515 thiss!1248) (minValue!3515 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3674 thiss!1248)))) key!828))))

(assert (= (and d!54109 (not res!84825)) b!179099))

(assert (= (and b!179099 res!84826) b!179100))

(declare-fun m!207445 () Bool)

(assert (=> b!179100 m!207445))

(assert (=> d!54043 d!54109))

(assert (=> bm!18081 d!54071))

(declare-fun d!54111 () Bool)

(assert (=> d!54111 (= (validKeyInArray!0 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178907 d!54111))

(declare-fun b!179113 () Bool)

(declare-fun e!118021 () SeekEntryResult!578)

(assert (=> b!179113 (= e!118021 (MissingVacant!578 (index!4482 lt!88358)))))

(declare-fun d!54113 () Bool)

(declare-fun lt!88531 () SeekEntryResult!578)

(assert (=> d!54113 (and (or ((_ is Undefined!578) lt!88531) (not ((_ is Found!578) lt!88531)) (and (bvsge (index!4481 lt!88531) #b00000000000000000000000000000000) (bvslt (index!4481 lt!88531) (size!3876 (_keys!5555 thiss!1248))))) (or ((_ is Undefined!578) lt!88531) ((_ is Found!578) lt!88531) (not ((_ is MissingVacant!578) lt!88531)) (not (= (index!4483 lt!88531) (index!4482 lt!88358))) (and (bvsge (index!4483 lt!88531) #b00000000000000000000000000000000) (bvslt (index!4483 lt!88531) (size!3876 (_keys!5555 thiss!1248))))) (or ((_ is Undefined!578) lt!88531) (ite ((_ is Found!578) lt!88531) (= (select (arr!3569 (_keys!5555 thiss!1248)) (index!4481 lt!88531)) key!828) (and ((_ is MissingVacant!578) lt!88531) (= (index!4483 lt!88531) (index!4482 lt!88358)) (= (select (arr!3569 (_keys!5555 thiss!1248)) (index!4483 lt!88531)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!118022 () SeekEntryResult!578)

(assert (=> d!54113 (= lt!88531 e!118022)))

(declare-fun c!32128 () Bool)

(assert (=> d!54113 (= c!32128 (bvsge (x!19572 lt!88358) #b01111111111111111111111111111110))))

(declare-fun lt!88530 () (_ BitVec 64))

(assert (=> d!54113 (= lt!88530 (select (arr!3569 (_keys!5555 thiss!1248)) (index!4482 lt!88358)))))

(assert (=> d!54113 (validMask!0 (mask!8642 thiss!1248))))

(assert (=> d!54113 (= (seekKeyOrZeroReturnVacant!0 (x!19572 lt!88358) (index!4482 lt!88358) (index!4482 lt!88358) key!828 (_keys!5555 thiss!1248) (mask!8642 thiss!1248)) lt!88531)))

(declare-fun b!179114 () Bool)

(assert (=> b!179114 (= e!118021 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19572 lt!88358) #b00000000000000000000000000000001) (nextIndex!0 (index!4482 lt!88358) (x!19572 lt!88358) (mask!8642 thiss!1248)) (index!4482 lt!88358) key!828 (_keys!5555 thiss!1248) (mask!8642 thiss!1248)))))

(declare-fun b!179115 () Bool)

(declare-fun e!118020 () SeekEntryResult!578)

(assert (=> b!179115 (= e!118020 (Found!578 (index!4482 lt!88358)))))

(declare-fun b!179116 () Bool)

(declare-fun c!32129 () Bool)

(assert (=> b!179116 (= c!32129 (= lt!88530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!179116 (= e!118020 e!118021)))

(declare-fun b!179117 () Bool)

(assert (=> b!179117 (= e!118022 e!118020)))

(declare-fun c!32130 () Bool)

(assert (=> b!179117 (= c!32130 (= lt!88530 key!828))))

(declare-fun b!179118 () Bool)

(assert (=> b!179118 (= e!118022 Undefined!578)))

(assert (= (and d!54113 c!32128) b!179118))

(assert (= (and d!54113 (not c!32128)) b!179117))

(assert (= (and b!179117 c!32130) b!179115))

(assert (= (and b!179117 (not c!32130)) b!179116))

(assert (= (and b!179116 c!32129) b!179113))

(assert (= (and b!179116 (not c!32129)) b!179114))

(declare-fun m!207447 () Bool)

(assert (=> d!54113 m!207447))

(declare-fun m!207449 () Bool)

(assert (=> d!54113 m!207449))

(assert (=> d!54113 m!207187))

(assert (=> d!54113 m!207167))

(declare-fun m!207451 () Bool)

(assert (=> b!179114 m!207451))

(assert (=> b!179114 m!207451))

(declare-fun m!207453 () Bool)

(assert (=> b!179114 m!207453))

(assert (=> b!178839 d!54113))

(declare-fun d!54115 () Bool)

(declare-fun e!118024 () Bool)

(assert (=> d!54115 e!118024))

(declare-fun res!84827 () Bool)

(assert (=> d!54115 (=> res!84827 e!118024)))

(declare-fun lt!88532 () Bool)

(assert (=> d!54115 (= res!84827 (not lt!88532))))

(declare-fun lt!88535 () Bool)

(assert (=> d!54115 (= lt!88532 lt!88535)))

(declare-fun lt!88534 () Unit!5452)

(declare-fun e!118023 () Unit!5452)

(assert (=> d!54115 (= lt!88534 e!118023)))

(declare-fun c!32131 () Bool)

(assert (=> d!54115 (= c!32131 lt!88535)))

(assert (=> d!54115 (= lt!88535 (containsKey!204 (toList!1140 lt!88420) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54115 (= (contains!1212 lt!88420 #b0000000000000000000000000000000000000000000000000000000000000000) lt!88532)))

(declare-fun b!179119 () Bool)

(declare-fun lt!88533 () Unit!5452)

(assert (=> b!179119 (= e!118023 lt!88533)))

(assert (=> b!179119 (= lt!88533 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1140 lt!88420) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!179119 (isDefined!153 (getValueByKey!200 (toList!1140 lt!88420) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179120 () Bool)

(declare-fun Unit!5458 () Unit!5452)

(assert (=> b!179120 (= e!118023 Unit!5458)))

(declare-fun b!179121 () Bool)

(assert (=> b!179121 (= e!118024 (isDefined!153 (getValueByKey!200 (toList!1140 lt!88420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54115 c!32131) b!179119))

(assert (= (and d!54115 (not c!32131)) b!179120))

(assert (= (and d!54115 (not res!84827)) b!179121))

(declare-fun m!207455 () Bool)

(assert (=> d!54115 m!207455))

(declare-fun m!207457 () Bool)

(assert (=> b!179119 m!207457))

(assert (=> b!179119 m!207295))

(assert (=> b!179119 m!207295))

(declare-fun m!207459 () Bool)

(assert (=> b!179119 m!207459))

(assert (=> b!179121 m!207295))

(assert (=> b!179121 m!207295))

(assert (=> b!179121 m!207459))

(assert (=> bm!18080 d!54115))

(declare-fun d!54117 () Bool)

(declare-fun e!118025 () Bool)

(assert (=> d!54117 e!118025))

(declare-fun res!84828 () Bool)

(assert (=> d!54117 (=> (not res!84828) (not e!118025))))

(declare-fun lt!88536 () ListLongMap!2249)

(assert (=> d!54117 (= res!84828 (contains!1212 lt!88536 (_1!1672 (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))))))))

(declare-fun lt!88537 () List!2267)

(assert (=> d!54117 (= lt!88536 (ListLongMap!2250 lt!88537))))

(declare-fun lt!88538 () Unit!5452)

(declare-fun lt!88539 () Unit!5452)

(assert (=> d!54117 (= lt!88538 lt!88539)))

(assert (=> d!54117 (= (getValueByKey!200 lt!88537 (_1!1672 (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))))) (Some!205 (_2!1672 (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))))))))

(assert (=> d!54117 (= lt!88539 (lemmaContainsTupThenGetReturnValue!106 lt!88537 (_1!1672 (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))) (_2!1672 (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))))))))

(assert (=> d!54117 (= lt!88537 (insertStrictlySorted!109 (toList!1140 (ite c!32072 call!18083 (ite c!32076 call!18079 call!18081))) (_1!1672 (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))) (_2!1672 (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))))))))

(assert (=> d!54117 (= (+!262 (ite c!32072 call!18083 (ite c!32076 call!18079 call!18081)) (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))) lt!88536)))

(declare-fun b!179122 () Bool)

(declare-fun res!84829 () Bool)

(assert (=> b!179122 (=> (not res!84829) (not e!118025))))

(assert (=> b!179122 (= res!84829 (= (getValueByKey!200 (toList!1140 lt!88536) (_1!1672 (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))))) (Some!205 (_2!1672 (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))))))))

(declare-fun b!179123 () Bool)

(assert (=> b!179123 (= e!118025 (contains!1214 (toList!1140 lt!88536) (ite (or c!32072 c!32076) (tuple2!3323 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3515 thiss!1248)) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))))))

(assert (= (and d!54117 res!84828) b!179122))

(assert (= (and b!179122 res!84829) b!179123))

(declare-fun m!207461 () Bool)

(assert (=> d!54117 m!207461))

(declare-fun m!207463 () Bool)

(assert (=> d!54117 m!207463))

(declare-fun m!207465 () Bool)

(assert (=> d!54117 m!207465))

(declare-fun m!207467 () Bool)

(assert (=> d!54117 m!207467))

(declare-fun m!207469 () Bool)

(assert (=> b!179122 m!207469))

(declare-fun m!207471 () Bool)

(assert (=> b!179123 m!207471))

(assert (=> bm!18078 d!54117))

(declare-fun d!54119 () Bool)

(declare-fun e!118027 () Bool)

(assert (=> d!54119 e!118027))

(declare-fun res!84830 () Bool)

(assert (=> d!54119 (=> res!84830 e!118027)))

(declare-fun lt!88540 () Bool)

(assert (=> d!54119 (= res!84830 (not lt!88540))))

(declare-fun lt!88543 () Bool)

(assert (=> d!54119 (= lt!88540 lt!88543)))

(declare-fun lt!88542 () Unit!5452)

(declare-fun e!118026 () Unit!5452)

(assert (=> d!54119 (= lt!88542 e!118026)))

(declare-fun c!32132 () Bool)

(assert (=> d!54119 (= c!32132 lt!88543)))

(assert (=> d!54119 (= lt!88543 (containsKey!204 (toList!1140 lt!88420) (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54119 (= (contains!1212 lt!88420 (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)) lt!88540)))

(declare-fun b!179124 () Bool)

(declare-fun lt!88541 () Unit!5452)

(assert (=> b!179124 (= e!118026 lt!88541)))

(assert (=> b!179124 (= lt!88541 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1140 lt!88420) (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179124 (isDefined!153 (getValueByKey!200 (toList!1140 lt!88420) (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179125 () Bool)

(declare-fun Unit!5459 () Unit!5452)

(assert (=> b!179125 (= e!118026 Unit!5459)))

(declare-fun b!179126 () Bool)

(assert (=> b!179126 (= e!118027 (isDefined!153 (getValueByKey!200 (toList!1140 lt!88420) (select (arr!3569 (_keys!5555 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54119 c!32132) b!179124))

(assert (= (and d!54119 (not c!32132)) b!179125))

(assert (= (and d!54119 (not res!84830)) b!179126))

(assert (=> d!54119 m!207209))

(declare-fun m!207473 () Bool)

(assert (=> d!54119 m!207473))

(assert (=> b!179124 m!207209))

(declare-fun m!207475 () Bool)

(assert (=> b!179124 m!207475))

(assert (=> b!179124 m!207209))

(assert (=> b!179124 m!207435))

(assert (=> b!179124 m!207435))

(declare-fun m!207477 () Bool)

(assert (=> b!179124 m!207477))

(assert (=> b!179126 m!207209))

(assert (=> b!179126 m!207435))

(assert (=> b!179126 m!207435))

(assert (=> b!179126 m!207477))

(assert (=> b!178904 d!54119))

(declare-fun d!54121 () Bool)

(declare-fun e!118028 () Bool)

(assert (=> d!54121 e!118028))

(declare-fun res!84831 () Bool)

(assert (=> d!54121 (=> (not res!84831) (not e!118028))))

(declare-fun lt!88544 () ListLongMap!2249)

(assert (=> d!54121 (= res!84831 (contains!1212 lt!88544 (_1!1672 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))))))

(declare-fun lt!88545 () List!2267)

(assert (=> d!54121 (= lt!88544 (ListLongMap!2250 lt!88545))))

(declare-fun lt!88546 () Unit!5452)

(declare-fun lt!88547 () Unit!5452)

(assert (=> d!54121 (= lt!88546 lt!88547)))

(assert (=> d!54121 (= (getValueByKey!200 lt!88545 (_1!1672 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))))))

(assert (=> d!54121 (= lt!88547 (lemmaContainsTupThenGetReturnValue!106 lt!88545 (_1!1672 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))))))

(assert (=> d!54121 (= lt!88545 (insertStrictlySorted!109 (toList!1140 call!18082) (_1!1672 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))) (_2!1672 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))))))

(assert (=> d!54121 (= (+!262 call!18082 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))) lt!88544)))

(declare-fun b!179127 () Bool)

(declare-fun res!84832 () Bool)

(assert (=> b!179127 (=> (not res!84832) (not e!118028))))

(assert (=> b!179127 (= res!84832 (= (getValueByKey!200 (toList!1140 lt!88544) (_1!1672 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248)))) (Some!205 (_2!1672 (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))))))))

(declare-fun b!179128 () Bool)

(assert (=> b!179128 (= e!118028 (contains!1214 (toList!1140 lt!88544) (tuple2!3323 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3515 thiss!1248))))))

(assert (= (and d!54121 res!84831) b!179127))

(assert (= (and b!179127 res!84832) b!179128))

(declare-fun m!207479 () Bool)

(assert (=> d!54121 m!207479))

(declare-fun m!207481 () Bool)

(assert (=> d!54121 m!207481))

(declare-fun m!207483 () Bool)

(assert (=> d!54121 m!207483))

(declare-fun m!207485 () Bool)

(assert (=> d!54121 m!207485))

(declare-fun m!207487 () Bool)

(assert (=> b!179127 m!207487))

(declare-fun m!207489 () Bool)

(assert (=> b!179128 m!207489))

(assert (=> b!178914 d!54121))

(assert (=> b!178905 d!54111))

(declare-fun b!179130 () Bool)

(declare-fun e!118029 () Bool)

(assert (=> b!179130 (= e!118029 tp_is_empty!4185)))

(declare-fun condMapEmpty!7165 () Bool)

(declare-fun mapDefault!7165 () ValueCell!1749)

(assert (=> mapNonEmpty!7164 (= condMapEmpty!7165 (= mapRest!7164 ((as const (Array (_ BitVec 32) ValueCell!1749)) mapDefault!7165)))))

(declare-fun mapRes!7165 () Bool)

(assert (=> mapNonEmpty!7164 (= tp!15966 (and e!118029 mapRes!7165))))

(declare-fun b!179129 () Bool)

(declare-fun e!118030 () Bool)

(assert (=> b!179129 (= e!118030 tp_is_empty!4185)))

(declare-fun mapNonEmpty!7165 () Bool)

(declare-fun tp!15967 () Bool)

(assert (=> mapNonEmpty!7165 (= mapRes!7165 (and tp!15967 e!118030))))

(declare-fun mapValue!7165 () ValueCell!1749)

(declare-fun mapKey!7165 () (_ BitVec 32))

(declare-fun mapRest!7165 () (Array (_ BitVec 32) ValueCell!1749))

(assert (=> mapNonEmpty!7165 (= mapRest!7164 (store mapRest!7165 mapKey!7165 mapValue!7165))))

(declare-fun mapIsEmpty!7165 () Bool)

(assert (=> mapIsEmpty!7165 mapRes!7165))

(assert (= (and mapNonEmpty!7164 condMapEmpty!7165) mapIsEmpty!7165))

(assert (= (and mapNonEmpty!7164 (not condMapEmpty!7165)) mapNonEmpty!7165))

(assert (= (and mapNonEmpty!7165 ((_ is ValueCellFull!1749) mapValue!7165)) b!179129))

(assert (= (and mapNonEmpty!7164 ((_ is ValueCellFull!1749) mapDefault!7165)) b!179130))

(declare-fun m!207491 () Bool)

(assert (=> mapNonEmpty!7165 m!207491))

(declare-fun b_lambda!7103 () Bool)

(assert (= b_lambda!7101 (or (and b!178795 b_free!4413) b_lambda!7103)))

(declare-fun b_lambda!7105 () Bool)

(assert (= b_lambda!7099 (or (and b!178795 b_free!4413) b_lambda!7105)))

(check-sat (not mapNonEmpty!7165) (not b!179057) (not d!54081) (not b!179006) (not b!179050) (not b!179039) (not d!54103) (not b!179127) (not b!178987) (not d!54087) (not d!54085) (not d!54099) (not d!54059) (not d!54051) (not b!179075) (not b_lambda!7103) (not b!179011) (not d!54095) (not d!54115) (not d!54089) (not d!54091) (not d!54113) (not d!54073) (not d!54075) (not d!54057) b_and!10943 tp_is_empty!4185 (not b!178984) (not d!54117) (not b!179122) (not b!179037) (not b!179126) (not d!54063) (not b!179042) (not d!54071) (not b!179128) (not b!179121) (not bm!18088) (not b!179047) (not b!178988) (not b!179043) (not b!178945) (not b!179002) (not b!179082) (not b!179119) (not b!179100) (not b!179123) (not d!54079) (not bm!18085) (not b!179081) (not b!179124) (not bm!18094) (not d!54069) (not d!54067) (not d!54101) (not d!54121) (not d!54083) (not b!179012) (not d!54093) (not d!54061) (not b!179062) (not b!179004) (not b!179056) (not d!54097) (not b_lambda!7097) (not b!179114) (not b_next!4413) (not b!179093) (not b!178970) (not d!54077) (not b!179049) (not b!179059) (not b!179074) (not d!54119) (not b!179041) (not b_lambda!7105) (not b!179048) (not b!178991) (not b!178944) (not bm!18091) (not b!179038) (not b!179055) (not b!179063))
(check-sat b_and!10943 (not b_next!4413))
