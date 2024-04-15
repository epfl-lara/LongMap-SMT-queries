; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19664 () Bool)

(assert start!19664)

(declare-fun b!192549 () Bool)

(declare-fun b_free!4693 () Bool)

(declare-fun b_next!4693 () Bool)

(assert (=> b!192549 (= b_free!4693 (not b_next!4693))))

(declare-fun tp!16936 () Bool)

(declare-fun b_and!11365 () Bool)

(assert (=> b!192549 (= tp!16936 b_and!11365)))

(declare-datatypes ((SeekEntryResult!685 0))(
  ( (MissingZero!685 (index!4910 (_ BitVec 32))) (Found!685 (index!4911 (_ BitVec 32))) (Intermediate!685 (undefined!1497 Bool) (index!4912 (_ BitVec 32)) (x!20608 (_ BitVec 32))) (Undefined!685) (MissingVacant!685 (index!4913 (_ BitVec 32))) )
))
(declare-fun lt!95639 () SeekEntryResult!685)

(declare-fun b!192544 () Bool)

(declare-fun e!126685 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5601 0))(
  ( (V!5602 (val!2277 Int)) )
))
(declare-datatypes ((ValueCell!1889 0))(
  ( (ValueCellFull!1889 (v!4221 V!5601)) (EmptyCell!1889) )
))
(declare-datatypes ((array!8153 0))(
  ( (array!8154 (arr!3838 (Array (_ BitVec 32) (_ BitVec 64))) (size!4163 (_ BitVec 32))) )
))
(declare-datatypes ((array!8155 0))(
  ( (array!8156 (arr!3839 (Array (_ BitVec 32) ValueCell!1889)) (size!4164 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2686 0))(
  ( (LongMapFixedSize!2687 (defaultEntry!3931 Int) (mask!9169 (_ BitVec 32)) (extraKeys!3668 (_ BitVec 32)) (zeroValue!3772 V!5601) (minValue!3772 V!5601) (_size!1392 (_ BitVec 32)) (_keys!5916 array!8153) (_values!3914 array!8155) (_vacant!1392 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2686)

(assert (=> b!192544 (= e!126685 (= (select (arr!3838 (_keys!5916 thiss!1248)) (index!4911 lt!95639)) key!828))))

(declare-fun b!192545 () Bool)

(declare-fun e!126677 () Bool)

(declare-fun e!126682 () Bool)

(assert (=> b!192545 (= e!126677 e!126682)))

(declare-fun res!90949 () Bool)

(assert (=> b!192545 (=> (not res!90949) (not e!126682))))

(get-info :version)

(assert (=> b!192545 (= res!90949 (and (not ((_ is Undefined!685) lt!95639)) (not ((_ is MissingVacant!685) lt!95639)) (not ((_ is MissingZero!685) lt!95639)) ((_ is Found!685) lt!95639)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8153 (_ BitVec 32)) SeekEntryResult!685)

(assert (=> b!192545 (= lt!95639 (seekEntryOrOpen!0 key!828 (_keys!5916 thiss!1248) (mask!9169 thiss!1248)))))

(declare-fun mapIsEmpty!7718 () Bool)

(declare-fun mapRes!7718 () Bool)

(assert (=> mapIsEmpty!7718 mapRes!7718))

(declare-fun b!192546 () Bool)

(declare-fun e!126684 () Bool)

(declare-fun tp_is_empty!4465 () Bool)

(assert (=> b!192546 (= e!126684 tp_is_empty!4465)))

(declare-fun b!192547 () Bool)

(declare-fun res!90950 () Bool)

(declare-fun e!126679 () Bool)

(assert (=> b!192547 (=> res!90950 e!126679)))

(assert (=> b!192547 (= res!90950 (or (not (= (size!4164 (_values!3914 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9169 thiss!1248)))) (not (= (size!4163 (_keys!5916 thiss!1248)) (size!4164 (_values!3914 thiss!1248)))) (bvslt (mask!9169 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3668 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3668 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!90948 () Bool)

(assert (=> start!19664 (=> (not res!90948) (not e!126677))))

(declare-fun valid!1120 (LongMapFixedSize!2686) Bool)

(assert (=> start!19664 (= res!90948 (valid!1120 thiss!1248))))

(assert (=> start!19664 e!126677))

(declare-fun e!126676 () Bool)

(assert (=> start!19664 e!126676))

(assert (=> start!19664 true))

(assert (=> start!19664 tp_is_empty!4465))

(declare-fun b!192548 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8153 (_ BitVec 32)) Bool)

(assert (=> b!192548 (= e!126679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5916 thiss!1248) (mask!9169 thiss!1248)))))

(declare-fun e!126678 () Bool)

(declare-fun array_inv!2491 (array!8153) Bool)

(declare-fun array_inv!2492 (array!8155) Bool)

(assert (=> b!192549 (= e!126676 (and tp!16936 tp_is_empty!4465 (array_inv!2491 (_keys!5916 thiss!1248)) (array_inv!2492 (_values!3914 thiss!1248)) e!126678))))

(declare-fun b!192550 () Bool)

(declare-datatypes ((Unit!5778 0))(
  ( (Unit!5779) )
))
(declare-fun e!126683 () Unit!5778)

(declare-fun lt!95642 () Unit!5778)

(assert (=> b!192550 (= e!126683 lt!95642)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!174 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 64) Int) Unit!5778)

(assert (=> b!192550 (= lt!95642 (lemmaInListMapThenSeekEntryOrOpenFindsIt!174 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)))))

(declare-fun res!90951 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192550 (= res!90951 (inRange!0 (index!4911 lt!95639) (mask!9169 thiss!1248)))))

(assert (=> b!192550 (=> (not res!90951) (not e!126685))))

(assert (=> b!192550 e!126685))

(declare-fun b!192551 () Bool)

(assert (=> b!192551 (= e!126682 (not e!126679))))

(declare-fun res!90953 () Bool)

(assert (=> b!192551 (=> res!90953 e!126679)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!192551 (= res!90953 (not (validMask!0 (mask!9169 thiss!1248))))))

(declare-datatypes ((tuple2!3492 0))(
  ( (tuple2!3493 (_1!1757 (_ BitVec 64)) (_2!1757 V!5601)) )
))
(declare-datatypes ((List!2411 0))(
  ( (Nil!2408) (Cons!2407 (h!3048 tuple2!3492) (t!7320 List!2411)) )
))
(declare-datatypes ((ListLongMap!2401 0))(
  ( (ListLongMap!2402 (toList!1216 List!2411)) )
))
(declare-fun lt!95641 () ListLongMap!2401)

(declare-fun v!309 () V!5601)

(declare-fun +!308 (ListLongMap!2401 tuple2!3492) ListLongMap!2401)

(declare-fun getCurrentListMap!849 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 32) Int) ListLongMap!2401)

(assert (=> b!192551 (= (+!308 lt!95641 (tuple2!3493 key!828 v!309)) (getCurrentListMap!849 (_keys!5916 thiss!1248) (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248))) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95640 () Unit!5778)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!124 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 32) (_ BitVec 64) V!5601 Int) Unit!5778)

(assert (=> b!192551 (= lt!95640 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!124 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) (index!4911 lt!95639) key!828 v!309 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95644 () Unit!5778)

(assert (=> b!192551 (= lt!95644 e!126683)))

(declare-fun c!34728 () Bool)

(declare-fun contains!1340 (ListLongMap!2401 (_ BitVec 64)) Bool)

(assert (=> b!192551 (= c!34728 (contains!1340 lt!95641 key!828))))

(assert (=> b!192551 (= lt!95641 (getCurrentListMap!849 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun b!192552 () Bool)

(declare-fun Unit!5780 () Unit!5778)

(assert (=> b!192552 (= e!126683 Unit!5780)))

(declare-fun lt!95643 () Unit!5778)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!173 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 64) Int) Unit!5778)

(assert (=> b!192552 (= lt!95643 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!173 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)))))

(assert (=> b!192552 false))

(declare-fun b!192553 () Bool)

(assert (=> b!192553 (= e!126678 (and e!126684 mapRes!7718))))

(declare-fun condMapEmpty!7718 () Bool)

(declare-fun mapDefault!7718 () ValueCell!1889)

(assert (=> b!192553 (= condMapEmpty!7718 (= (arr!3839 (_values!3914 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1889)) mapDefault!7718)))))

(declare-fun b!192554 () Bool)

(declare-fun res!90952 () Bool)

(assert (=> b!192554 (=> (not res!90952) (not e!126677))))

(assert (=> b!192554 (= res!90952 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7718 () Bool)

(declare-fun tp!16937 () Bool)

(declare-fun e!126681 () Bool)

(assert (=> mapNonEmpty!7718 (= mapRes!7718 (and tp!16937 e!126681))))

(declare-fun mapRest!7718 () (Array (_ BitVec 32) ValueCell!1889))

(declare-fun mapKey!7718 () (_ BitVec 32))

(declare-fun mapValue!7718 () ValueCell!1889)

(assert (=> mapNonEmpty!7718 (= (arr!3839 (_values!3914 thiss!1248)) (store mapRest!7718 mapKey!7718 mapValue!7718))))

(declare-fun b!192555 () Bool)

(assert (=> b!192555 (= e!126681 tp_is_empty!4465)))

(assert (= (and start!19664 res!90948) b!192554))

(assert (= (and b!192554 res!90952) b!192545))

(assert (= (and b!192545 res!90949) b!192551))

(assert (= (and b!192551 c!34728) b!192550))

(assert (= (and b!192551 (not c!34728)) b!192552))

(assert (= (and b!192550 res!90951) b!192544))

(assert (= (and b!192551 (not res!90953)) b!192547))

(assert (= (and b!192547 (not res!90950)) b!192548))

(assert (= (and b!192553 condMapEmpty!7718) mapIsEmpty!7718))

(assert (= (and b!192553 (not condMapEmpty!7718)) mapNonEmpty!7718))

(assert (= (and mapNonEmpty!7718 ((_ is ValueCellFull!1889) mapValue!7718)) b!192555))

(assert (= (and b!192553 ((_ is ValueCellFull!1889) mapDefault!7718)) b!192546))

(assert (= b!192549 b!192553))

(assert (= start!19664 b!192549))

(declare-fun m!218911 () Bool)

(assert (=> b!192548 m!218911))

(declare-fun m!218913 () Bool)

(assert (=> b!192545 m!218913))

(declare-fun m!218915 () Bool)

(assert (=> start!19664 m!218915))

(declare-fun m!218917 () Bool)

(assert (=> b!192549 m!218917))

(declare-fun m!218919 () Bool)

(assert (=> b!192549 m!218919))

(declare-fun m!218921 () Bool)

(assert (=> mapNonEmpty!7718 m!218921))

(declare-fun m!218923 () Bool)

(assert (=> b!192551 m!218923))

(declare-fun m!218925 () Bool)

(assert (=> b!192551 m!218925))

(declare-fun m!218927 () Bool)

(assert (=> b!192551 m!218927))

(declare-fun m!218929 () Bool)

(assert (=> b!192551 m!218929))

(declare-fun m!218931 () Bool)

(assert (=> b!192551 m!218931))

(declare-fun m!218933 () Bool)

(assert (=> b!192551 m!218933))

(declare-fun m!218935 () Bool)

(assert (=> b!192551 m!218935))

(declare-fun m!218937 () Bool)

(assert (=> b!192552 m!218937))

(declare-fun m!218939 () Bool)

(assert (=> b!192544 m!218939))

(declare-fun m!218941 () Bool)

(assert (=> b!192550 m!218941))

(declare-fun m!218943 () Bool)

(assert (=> b!192550 m!218943))

(check-sat (not mapNonEmpty!7718) (not b!192550) (not b!192548) b_and!11365 (not b!192551) (not b!192552) tp_is_empty!4465 (not start!19664) (not b!192549) (not b!192545) (not b_next!4693))
(check-sat b_and!11365 (not b_next!4693))
(get-model)

(declare-fun lt!95687 () SeekEntryResult!685)

(declare-fun b!192640 () Bool)

(declare-fun e!126752 () SeekEntryResult!685)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8153 (_ BitVec 32)) SeekEntryResult!685)

(assert (=> b!192640 (= e!126752 (seekKeyOrZeroReturnVacant!0 (x!20608 lt!95687) (index!4912 lt!95687) (index!4912 lt!95687) key!828 (_keys!5916 thiss!1248) (mask!9169 thiss!1248)))))

(declare-fun b!192641 () Bool)

(declare-fun e!126754 () SeekEntryResult!685)

(assert (=> b!192641 (= e!126754 Undefined!685)))

(declare-fun b!192642 () Bool)

(assert (=> b!192642 (= e!126752 (MissingZero!685 (index!4912 lt!95687)))))

(declare-fun b!192643 () Bool)

(declare-fun e!126753 () SeekEntryResult!685)

(assert (=> b!192643 (= e!126754 e!126753)))

(declare-fun lt!95689 () (_ BitVec 64))

(assert (=> b!192643 (= lt!95689 (select (arr!3838 (_keys!5916 thiss!1248)) (index!4912 lt!95687)))))

(declare-fun c!34743 () Bool)

(assert (=> b!192643 (= c!34743 (= lt!95689 key!828))))

(declare-fun b!192644 () Bool)

(assert (=> b!192644 (= e!126753 (Found!685 (index!4912 lt!95687)))))

(declare-fun d!56363 () Bool)

(declare-fun lt!95688 () SeekEntryResult!685)

(assert (=> d!56363 (and (or ((_ is Undefined!685) lt!95688) (not ((_ is Found!685) lt!95688)) (and (bvsge (index!4911 lt!95688) #b00000000000000000000000000000000) (bvslt (index!4911 lt!95688) (size!4163 (_keys!5916 thiss!1248))))) (or ((_ is Undefined!685) lt!95688) ((_ is Found!685) lt!95688) (not ((_ is MissingZero!685) lt!95688)) (and (bvsge (index!4910 lt!95688) #b00000000000000000000000000000000) (bvslt (index!4910 lt!95688) (size!4163 (_keys!5916 thiss!1248))))) (or ((_ is Undefined!685) lt!95688) ((_ is Found!685) lt!95688) ((_ is MissingZero!685) lt!95688) (not ((_ is MissingVacant!685) lt!95688)) (and (bvsge (index!4913 lt!95688) #b00000000000000000000000000000000) (bvslt (index!4913 lt!95688) (size!4163 (_keys!5916 thiss!1248))))) (or ((_ is Undefined!685) lt!95688) (ite ((_ is Found!685) lt!95688) (= (select (arr!3838 (_keys!5916 thiss!1248)) (index!4911 lt!95688)) key!828) (ite ((_ is MissingZero!685) lt!95688) (= (select (arr!3838 (_keys!5916 thiss!1248)) (index!4910 lt!95688)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!685) lt!95688) (= (select (arr!3838 (_keys!5916 thiss!1248)) (index!4913 lt!95688)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56363 (= lt!95688 e!126754)))

(declare-fun c!34742 () Bool)

(assert (=> d!56363 (= c!34742 (and ((_ is Intermediate!685) lt!95687) (undefined!1497 lt!95687)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8153 (_ BitVec 32)) SeekEntryResult!685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56363 (= lt!95687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9169 thiss!1248)) key!828 (_keys!5916 thiss!1248) (mask!9169 thiss!1248)))))

(assert (=> d!56363 (validMask!0 (mask!9169 thiss!1248))))

(assert (=> d!56363 (= (seekEntryOrOpen!0 key!828 (_keys!5916 thiss!1248) (mask!9169 thiss!1248)) lt!95688)))

(declare-fun b!192645 () Bool)

(declare-fun c!34741 () Bool)

(assert (=> b!192645 (= c!34741 (= lt!95689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192645 (= e!126753 e!126752)))

(assert (= (and d!56363 c!34742) b!192641))

(assert (= (and d!56363 (not c!34742)) b!192643))

(assert (= (and b!192643 c!34743) b!192644))

(assert (= (and b!192643 (not c!34743)) b!192645))

(assert (= (and b!192645 c!34741) b!192642))

(assert (= (and b!192645 (not c!34741)) b!192640))

(declare-fun m!219013 () Bool)

(assert (=> b!192640 m!219013))

(declare-fun m!219015 () Bool)

(assert (=> b!192643 m!219015))

(assert (=> d!56363 m!218931))

(declare-fun m!219017 () Bool)

(assert (=> d!56363 m!219017))

(declare-fun m!219019 () Bool)

(assert (=> d!56363 m!219019))

(declare-fun m!219021 () Bool)

(assert (=> d!56363 m!219021))

(declare-fun m!219023 () Bool)

(assert (=> d!56363 m!219023))

(assert (=> d!56363 m!219019))

(declare-fun m!219025 () Bool)

(assert (=> d!56363 m!219025))

(assert (=> b!192545 d!56363))

(declare-fun d!56365 () Bool)

(assert (=> d!56365 (= (array_inv!2491 (_keys!5916 thiss!1248)) (bvsge (size!4163 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192549 d!56365))

(declare-fun d!56367 () Bool)

(assert (=> d!56367 (= (array_inv!2492 (_values!3914 thiss!1248)) (bvsge (size!4164 (_values!3914 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192549 d!56367))

(declare-fun d!56369 () Bool)

(declare-fun res!90996 () Bool)

(declare-fun e!126757 () Bool)

(assert (=> d!56369 (=> (not res!90996) (not e!126757))))

(declare-fun simpleValid!200 (LongMapFixedSize!2686) Bool)

(assert (=> d!56369 (= res!90996 (simpleValid!200 thiss!1248))))

(assert (=> d!56369 (= (valid!1120 thiss!1248) e!126757)))

(declare-fun b!192652 () Bool)

(declare-fun res!90997 () Bool)

(assert (=> b!192652 (=> (not res!90997) (not e!126757))))

(declare-fun arrayCountValidKeys!0 (array!8153 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!192652 (= res!90997 (= (arrayCountValidKeys!0 (_keys!5916 thiss!1248) #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))) (_size!1392 thiss!1248)))))

(declare-fun b!192653 () Bool)

(declare-fun res!90998 () Bool)

(assert (=> b!192653 (=> (not res!90998) (not e!126757))))

(assert (=> b!192653 (= res!90998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5916 thiss!1248) (mask!9169 thiss!1248)))))

(declare-fun b!192654 () Bool)

(declare-datatypes ((List!2414 0))(
  ( (Nil!2411) (Cons!2410 (h!3051 (_ BitVec 64)) (t!7325 List!2414)) )
))
(declare-fun arrayNoDuplicates!0 (array!8153 (_ BitVec 32) List!2414) Bool)

(assert (=> b!192654 (= e!126757 (arrayNoDuplicates!0 (_keys!5916 thiss!1248) #b00000000000000000000000000000000 Nil!2411))))

(assert (= (and d!56369 res!90996) b!192652))

(assert (= (and b!192652 res!90997) b!192653))

(assert (= (and b!192653 res!90998) b!192654))

(declare-fun m!219027 () Bool)

(assert (=> d!56369 m!219027))

(declare-fun m!219029 () Bool)

(assert (=> b!192652 m!219029))

(assert (=> b!192653 m!218911))

(declare-fun m!219031 () Bool)

(assert (=> b!192654 m!219031))

(assert (=> start!19664 d!56369))

(declare-fun b!192663 () Bool)

(declare-fun e!126764 () Bool)

(declare-fun e!126766 () Bool)

(assert (=> b!192663 (= e!126764 e!126766)))

(declare-fun lt!95697 () (_ BitVec 64))

(assert (=> b!192663 (= lt!95697 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95698 () Unit!5778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8153 (_ BitVec 64) (_ BitVec 32)) Unit!5778)

(assert (=> b!192663 (= lt!95698 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5916 thiss!1248) lt!95697 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!192663 (arrayContainsKey!0 (_keys!5916 thiss!1248) lt!95697 #b00000000000000000000000000000000)))

(declare-fun lt!95696 () Unit!5778)

(assert (=> b!192663 (= lt!95696 lt!95698)))

(declare-fun res!91004 () Bool)

(assert (=> b!192663 (= res!91004 (= (seekEntryOrOpen!0 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000) (_keys!5916 thiss!1248) (mask!9169 thiss!1248)) (Found!685 #b00000000000000000000000000000000)))))

(assert (=> b!192663 (=> (not res!91004) (not e!126766))))

(declare-fun b!192664 () Bool)

(declare-fun call!19431 () Bool)

(assert (=> b!192664 (= e!126764 call!19431)))

(declare-fun b!192665 () Bool)

(declare-fun e!126765 () Bool)

(assert (=> b!192665 (= e!126765 e!126764)))

(declare-fun c!34746 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!192665 (= c!34746 (validKeyInArray!0 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56371 () Bool)

(declare-fun res!91003 () Bool)

(assert (=> d!56371 (=> res!91003 e!126765)))

(assert (=> d!56371 (= res!91003 (bvsge #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))

(assert (=> d!56371 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5916 thiss!1248) (mask!9169 thiss!1248)) e!126765)))

(declare-fun bm!19428 () Bool)

(assert (=> bm!19428 (= call!19431 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5916 thiss!1248) (mask!9169 thiss!1248)))))

(declare-fun b!192666 () Bool)

(assert (=> b!192666 (= e!126766 call!19431)))

(assert (= (and d!56371 (not res!91003)) b!192665))

(assert (= (and b!192665 c!34746) b!192663))

(assert (= (and b!192665 (not c!34746)) b!192664))

(assert (= (and b!192663 res!91004) b!192666))

(assert (= (or b!192666 b!192664) bm!19428))

(declare-fun m!219033 () Bool)

(assert (=> b!192663 m!219033))

(declare-fun m!219035 () Bool)

(assert (=> b!192663 m!219035))

(declare-fun m!219037 () Bool)

(assert (=> b!192663 m!219037))

(assert (=> b!192663 m!219033))

(declare-fun m!219039 () Bool)

(assert (=> b!192663 m!219039))

(assert (=> b!192665 m!219033))

(assert (=> b!192665 m!219033))

(declare-fun m!219041 () Bool)

(assert (=> b!192665 m!219041))

(declare-fun m!219043 () Bool)

(assert (=> bm!19428 m!219043))

(assert (=> b!192548 d!56371))

(declare-fun d!56373 () Bool)

(declare-fun e!126769 () Bool)

(assert (=> d!56373 e!126769))

(declare-fun res!91010 () Bool)

(assert (=> d!56373 (=> (not res!91010) (not e!126769))))

(declare-fun lt!95710 () ListLongMap!2401)

(assert (=> d!56373 (= res!91010 (contains!1340 lt!95710 (_1!1757 (tuple2!3493 key!828 v!309))))))

(declare-fun lt!95708 () List!2411)

(assert (=> d!56373 (= lt!95710 (ListLongMap!2402 lt!95708))))

(declare-fun lt!95707 () Unit!5778)

(declare-fun lt!95709 () Unit!5778)

(assert (=> d!56373 (= lt!95707 lt!95709)))

(declare-datatypes ((Option!245 0))(
  ( (Some!244 (v!4226 V!5601)) (None!243) )
))
(declare-fun getValueByKey!239 (List!2411 (_ BitVec 64)) Option!245)

(assert (=> d!56373 (= (getValueByKey!239 lt!95708 (_1!1757 (tuple2!3493 key!828 v!309))) (Some!244 (_2!1757 (tuple2!3493 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!129 (List!2411 (_ BitVec 64) V!5601) Unit!5778)

(assert (=> d!56373 (= lt!95709 (lemmaContainsTupThenGetReturnValue!129 lt!95708 (_1!1757 (tuple2!3493 key!828 v!309)) (_2!1757 (tuple2!3493 key!828 v!309))))))

(declare-fun insertStrictlySorted!132 (List!2411 (_ BitVec 64) V!5601) List!2411)

(assert (=> d!56373 (= lt!95708 (insertStrictlySorted!132 (toList!1216 lt!95641) (_1!1757 (tuple2!3493 key!828 v!309)) (_2!1757 (tuple2!3493 key!828 v!309))))))

(assert (=> d!56373 (= (+!308 lt!95641 (tuple2!3493 key!828 v!309)) lt!95710)))

(declare-fun b!192671 () Bool)

(declare-fun res!91009 () Bool)

(assert (=> b!192671 (=> (not res!91009) (not e!126769))))

(assert (=> b!192671 (= res!91009 (= (getValueByKey!239 (toList!1216 lt!95710) (_1!1757 (tuple2!3493 key!828 v!309))) (Some!244 (_2!1757 (tuple2!3493 key!828 v!309)))))))

(declare-fun b!192672 () Bool)

(declare-fun contains!1343 (List!2411 tuple2!3492) Bool)

(assert (=> b!192672 (= e!126769 (contains!1343 (toList!1216 lt!95710) (tuple2!3493 key!828 v!309)))))

(assert (= (and d!56373 res!91010) b!192671))

(assert (= (and b!192671 res!91009) b!192672))

(declare-fun m!219045 () Bool)

(assert (=> d!56373 m!219045))

(declare-fun m!219047 () Bool)

(assert (=> d!56373 m!219047))

(declare-fun m!219049 () Bool)

(assert (=> d!56373 m!219049))

(declare-fun m!219051 () Bool)

(assert (=> d!56373 m!219051))

(declare-fun m!219053 () Bool)

(assert (=> b!192671 m!219053))

(declare-fun m!219055 () Bool)

(assert (=> b!192672 m!219055))

(assert (=> b!192551 d!56373))

(declare-fun d!56375 () Bool)

(declare-fun e!126775 () Bool)

(assert (=> d!56375 e!126775))

(declare-fun res!91013 () Bool)

(assert (=> d!56375 (=> res!91013 e!126775)))

(declare-fun lt!95720 () Bool)

(assert (=> d!56375 (= res!91013 (not lt!95720))))

(declare-fun lt!95721 () Bool)

(assert (=> d!56375 (= lt!95720 lt!95721)))

(declare-fun lt!95719 () Unit!5778)

(declare-fun e!126774 () Unit!5778)

(assert (=> d!56375 (= lt!95719 e!126774)))

(declare-fun c!34749 () Bool)

(assert (=> d!56375 (= c!34749 lt!95721)))

(declare-fun containsKey!243 (List!2411 (_ BitVec 64)) Bool)

(assert (=> d!56375 (= lt!95721 (containsKey!243 (toList!1216 lt!95641) key!828))))

(assert (=> d!56375 (= (contains!1340 lt!95641 key!828) lt!95720)))

(declare-fun b!192679 () Bool)

(declare-fun lt!95722 () Unit!5778)

(assert (=> b!192679 (= e!126774 lt!95722)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!192 (List!2411 (_ BitVec 64)) Unit!5778)

(assert (=> b!192679 (= lt!95722 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1216 lt!95641) key!828))))

(declare-fun isDefined!193 (Option!245) Bool)

(assert (=> b!192679 (isDefined!193 (getValueByKey!239 (toList!1216 lt!95641) key!828))))

(declare-fun b!192680 () Bool)

(declare-fun Unit!5787 () Unit!5778)

(assert (=> b!192680 (= e!126774 Unit!5787)))

(declare-fun b!192681 () Bool)

(assert (=> b!192681 (= e!126775 (isDefined!193 (getValueByKey!239 (toList!1216 lt!95641) key!828)))))

(assert (= (and d!56375 c!34749) b!192679))

(assert (= (and d!56375 (not c!34749)) b!192680))

(assert (= (and d!56375 (not res!91013)) b!192681))

(declare-fun m!219057 () Bool)

(assert (=> d!56375 m!219057))

(declare-fun m!219059 () Bool)

(assert (=> b!192679 m!219059))

(declare-fun m!219061 () Bool)

(assert (=> b!192679 m!219061))

(assert (=> b!192679 m!219061))

(declare-fun m!219063 () Bool)

(assert (=> b!192679 m!219063))

(assert (=> b!192681 m!219061))

(assert (=> b!192681 m!219061))

(assert (=> b!192681 m!219063))

(assert (=> b!192551 d!56375))

(declare-fun bm!19443 () Bool)

(declare-fun call!19450 () ListLongMap!2401)

(declare-fun call!19447 () ListLongMap!2401)

(assert (=> bm!19443 (= call!19450 call!19447)))

(declare-fun b!192724 () Bool)

(declare-fun e!126808 () Bool)

(declare-fun call!19452 () Bool)

(assert (=> b!192724 (= e!126808 (not call!19452))))

(declare-fun b!192725 () Bool)

(declare-fun e!126804 () Bool)

(declare-fun e!126814 () Bool)

(assert (=> b!192725 (= e!126804 e!126814)))

(declare-fun c!34762 () Bool)

(assert (=> b!192725 (= c!34762 (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!56377 () Bool)

(assert (=> d!56377 e!126804))

(declare-fun res!91040 () Bool)

(assert (=> d!56377 (=> (not res!91040) (not e!126804))))

(assert (=> d!56377 (= res!91040 (or (bvsge #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))))

(declare-fun lt!95770 () ListLongMap!2401)

(declare-fun lt!95788 () ListLongMap!2401)

(assert (=> d!56377 (= lt!95770 lt!95788)))

(declare-fun lt!95769 () Unit!5778)

(declare-fun e!126812 () Unit!5778)

(assert (=> d!56377 (= lt!95769 e!126812)))

(declare-fun c!34767 () Bool)

(declare-fun e!126803 () Bool)

(assert (=> d!56377 (= c!34767 e!126803)))

(declare-fun res!91034 () Bool)

(assert (=> d!56377 (=> (not res!91034) (not e!126803))))

(assert (=> d!56377 (= res!91034 (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun e!126802 () ListLongMap!2401)

(assert (=> d!56377 (= lt!95788 e!126802)))

(declare-fun c!34765 () Bool)

(assert (=> d!56377 (= c!34765 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56377 (validMask!0 (mask!9169 thiss!1248))))

(assert (=> d!56377 (= (getCurrentListMap!849 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)) lt!95770)))

(declare-fun b!192726 () Bool)

(declare-fun e!126813 () Bool)

(declare-fun apply!184 (ListLongMap!2401 (_ BitVec 64)) V!5601)

(declare-fun get!2219 (ValueCell!1889 V!5601) V!5601)

(declare-fun dynLambda!518 (Int (_ BitVec 64)) V!5601)

(assert (=> b!192726 (= e!126813 (= (apply!184 lt!95770 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3839 (_values!3914 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!518 (defaultEntry!3931 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192726 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4164 (_values!3914 thiss!1248))))))

(assert (=> b!192726 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun b!192727 () Bool)

(assert (=> b!192727 (= e!126802 (+!308 call!19447 (tuple2!3493 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3772 thiss!1248))))))

(declare-fun b!192728 () Bool)

(declare-fun c!34764 () Bool)

(assert (=> b!192728 (= c!34764 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126807 () ListLongMap!2401)

(declare-fun e!126805 () ListLongMap!2401)

(assert (=> b!192728 (= e!126807 e!126805)))

(declare-fun b!192729 () Bool)

(declare-fun call!19449 () Bool)

(assert (=> b!192729 (= e!126814 (not call!19449))))

(declare-fun bm!19444 () Bool)

(assert (=> bm!19444 (= call!19452 (contains!1340 lt!95770 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192730 () Bool)

(declare-fun res!91037 () Bool)

(assert (=> b!192730 (=> (not res!91037) (not e!126804))))

(assert (=> b!192730 (= res!91037 e!126808)))

(declare-fun c!34766 () Bool)

(assert (=> b!192730 (= c!34766 (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!192731 () Bool)

(declare-fun call!19448 () ListLongMap!2401)

(assert (=> b!192731 (= e!126805 call!19448)))

(declare-fun b!192732 () Bool)

(declare-fun lt!95778 () Unit!5778)

(assert (=> b!192732 (= e!126812 lt!95778)))

(declare-fun lt!95776 () ListLongMap!2401)

(declare-fun getCurrentListMapNoExtraKeys!205 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 32) Int) ListLongMap!2401)

(assert (=> b!192732 (= lt!95776 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95774 () (_ BitVec 64))

(assert (=> b!192732 (= lt!95774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95781 () (_ BitVec 64))

(assert (=> b!192732 (= lt!95781 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95775 () Unit!5778)

(declare-fun addStillContains!160 (ListLongMap!2401 (_ BitVec 64) V!5601 (_ BitVec 64)) Unit!5778)

(assert (=> b!192732 (= lt!95775 (addStillContains!160 lt!95776 lt!95774 (zeroValue!3772 thiss!1248) lt!95781))))

(assert (=> b!192732 (contains!1340 (+!308 lt!95776 (tuple2!3493 lt!95774 (zeroValue!3772 thiss!1248))) lt!95781)))

(declare-fun lt!95777 () Unit!5778)

(assert (=> b!192732 (= lt!95777 lt!95775)))

(declare-fun lt!95773 () ListLongMap!2401)

(assert (=> b!192732 (= lt!95773 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95780 () (_ BitVec 64))

(assert (=> b!192732 (= lt!95780 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95786 () (_ BitVec 64))

(assert (=> b!192732 (= lt!95786 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95767 () Unit!5778)

(declare-fun addApplyDifferent!160 (ListLongMap!2401 (_ BitVec 64) V!5601 (_ BitVec 64)) Unit!5778)

(assert (=> b!192732 (= lt!95767 (addApplyDifferent!160 lt!95773 lt!95780 (minValue!3772 thiss!1248) lt!95786))))

(assert (=> b!192732 (= (apply!184 (+!308 lt!95773 (tuple2!3493 lt!95780 (minValue!3772 thiss!1248))) lt!95786) (apply!184 lt!95773 lt!95786))))

(declare-fun lt!95771 () Unit!5778)

(assert (=> b!192732 (= lt!95771 lt!95767)))

(declare-fun lt!95787 () ListLongMap!2401)

(assert (=> b!192732 (= lt!95787 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95784 () (_ BitVec 64))

(assert (=> b!192732 (= lt!95784 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95768 () (_ BitVec 64))

(assert (=> b!192732 (= lt!95768 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95783 () Unit!5778)

(assert (=> b!192732 (= lt!95783 (addApplyDifferent!160 lt!95787 lt!95784 (zeroValue!3772 thiss!1248) lt!95768))))

(assert (=> b!192732 (= (apply!184 (+!308 lt!95787 (tuple2!3493 lt!95784 (zeroValue!3772 thiss!1248))) lt!95768) (apply!184 lt!95787 lt!95768))))

(declare-fun lt!95782 () Unit!5778)

(assert (=> b!192732 (= lt!95782 lt!95783)))

(declare-fun lt!95785 () ListLongMap!2401)

(assert (=> b!192732 (= lt!95785 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95779 () (_ BitVec 64))

(assert (=> b!192732 (= lt!95779 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95772 () (_ BitVec 64))

(assert (=> b!192732 (= lt!95772 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192732 (= lt!95778 (addApplyDifferent!160 lt!95785 lt!95779 (minValue!3772 thiss!1248) lt!95772))))

(assert (=> b!192732 (= (apply!184 (+!308 lt!95785 (tuple2!3493 lt!95779 (minValue!3772 thiss!1248))) lt!95772) (apply!184 lt!95785 lt!95772))))

(declare-fun b!192733 () Bool)

(declare-fun e!126809 () Bool)

(assert (=> b!192733 (= e!126809 (= (apply!184 lt!95770 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3772 thiss!1248)))))

(declare-fun bm!19445 () Bool)

(declare-fun call!19451 () ListLongMap!2401)

(declare-fun call!19446 () ListLongMap!2401)

(assert (=> bm!19445 (= call!19451 call!19446)))

(declare-fun b!192734 () Bool)

(declare-fun e!126810 () Bool)

(assert (=> b!192734 (= e!126810 (validKeyInArray!0 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19446 () Bool)

(assert (=> bm!19446 (= call!19449 (contains!1340 lt!95770 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192735 () Bool)

(assert (=> b!192735 (= e!126805 call!19450)))

(declare-fun b!192736 () Bool)

(declare-fun res!91039 () Bool)

(assert (=> b!192736 (=> (not res!91039) (not e!126804))))

(declare-fun e!126806 () Bool)

(assert (=> b!192736 (= res!91039 e!126806)))

(declare-fun res!91033 () Bool)

(assert (=> b!192736 (=> res!91033 e!126806)))

(assert (=> b!192736 (= res!91033 (not e!126810))))

(declare-fun res!91038 () Bool)

(assert (=> b!192736 (=> (not res!91038) (not e!126810))))

(assert (=> b!192736 (= res!91038 (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun bm!19447 () Bool)

(declare-fun c!34763 () Bool)

(assert (=> bm!19447 (= call!19447 (+!308 (ite c!34765 call!19446 (ite c!34763 call!19451 call!19448)) (ite (or c!34765 c!34763) (tuple2!3493 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3772 thiss!1248)) (tuple2!3493 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3772 thiss!1248)))))))

(declare-fun bm!19448 () Bool)

(assert (=> bm!19448 (= call!19446 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun b!192737 () Bool)

(declare-fun Unit!5788 () Unit!5778)

(assert (=> b!192737 (= e!126812 Unit!5788)))

(declare-fun bm!19449 () Bool)

(assert (=> bm!19449 (= call!19448 call!19451)))

(declare-fun b!192738 () Bool)

(assert (=> b!192738 (= e!126807 call!19450)))

(declare-fun b!192739 () Bool)

(assert (=> b!192739 (= e!126806 e!126813)))

(declare-fun res!91036 () Bool)

(assert (=> b!192739 (=> (not res!91036) (not e!126813))))

(assert (=> b!192739 (= res!91036 (contains!1340 lt!95770 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun b!192740 () Bool)

(assert (=> b!192740 (= e!126802 e!126807)))

(assert (=> b!192740 (= c!34763 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192741 () Bool)

(assert (=> b!192741 (= e!126803 (validKeyInArray!0 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192742 () Bool)

(declare-fun e!126811 () Bool)

(assert (=> b!192742 (= e!126808 e!126811)))

(declare-fun res!91032 () Bool)

(assert (=> b!192742 (= res!91032 call!19452)))

(assert (=> b!192742 (=> (not res!91032) (not e!126811))))

(declare-fun b!192743 () Bool)

(assert (=> b!192743 (= e!126814 e!126809)))

(declare-fun res!91035 () Bool)

(assert (=> b!192743 (= res!91035 call!19449)))

(assert (=> b!192743 (=> (not res!91035) (not e!126809))))

(declare-fun b!192744 () Bool)

(assert (=> b!192744 (= e!126811 (= (apply!184 lt!95770 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3772 thiss!1248)))))

(assert (= (and d!56377 c!34765) b!192727))

(assert (= (and d!56377 (not c!34765)) b!192740))

(assert (= (and b!192740 c!34763) b!192738))

(assert (= (and b!192740 (not c!34763)) b!192728))

(assert (= (and b!192728 c!34764) b!192735))

(assert (= (and b!192728 (not c!34764)) b!192731))

(assert (= (or b!192735 b!192731) bm!19449))

(assert (= (or b!192738 bm!19449) bm!19445))

(assert (= (or b!192738 b!192735) bm!19443))

(assert (= (or b!192727 bm!19445) bm!19448))

(assert (= (or b!192727 bm!19443) bm!19447))

(assert (= (and d!56377 res!91034) b!192741))

(assert (= (and d!56377 c!34767) b!192732))

(assert (= (and d!56377 (not c!34767)) b!192737))

(assert (= (and d!56377 res!91040) b!192736))

(assert (= (and b!192736 res!91038) b!192734))

(assert (= (and b!192736 (not res!91033)) b!192739))

(assert (= (and b!192739 res!91036) b!192726))

(assert (= (and b!192736 res!91039) b!192730))

(assert (= (and b!192730 c!34766) b!192742))

(assert (= (and b!192730 (not c!34766)) b!192724))

(assert (= (and b!192742 res!91032) b!192744))

(assert (= (or b!192742 b!192724) bm!19444))

(assert (= (and b!192730 res!91037) b!192725))

(assert (= (and b!192725 c!34762) b!192743))

(assert (= (and b!192725 (not c!34762)) b!192729))

(assert (= (and b!192743 res!91035) b!192733))

(assert (= (or b!192743 b!192729) bm!19446))

(declare-fun b_lambda!7429 () Bool)

(assert (=> (not b_lambda!7429) (not b!192726)))

(declare-fun t!7324 () Bool)

(declare-fun tb!2871 () Bool)

(assert (=> (and b!192549 (= (defaultEntry!3931 thiss!1248) (defaultEntry!3931 thiss!1248)) t!7324) tb!2871))

(declare-fun result!4907 () Bool)

(assert (=> tb!2871 (= result!4907 tp_is_empty!4465)))

(assert (=> b!192726 t!7324))

(declare-fun b_and!11371 () Bool)

(assert (= b_and!11365 (and (=> t!7324 result!4907) b_and!11371)))

(assert (=> d!56377 m!218931))

(declare-fun m!219065 () Bool)

(assert (=> b!192732 m!219065))

(declare-fun m!219067 () Bool)

(assert (=> b!192732 m!219067))

(declare-fun m!219069 () Bool)

(assert (=> b!192732 m!219069))

(declare-fun m!219071 () Bool)

(assert (=> b!192732 m!219071))

(declare-fun m!219073 () Bool)

(assert (=> b!192732 m!219073))

(declare-fun m!219075 () Bool)

(assert (=> b!192732 m!219075))

(declare-fun m!219077 () Bool)

(assert (=> b!192732 m!219077))

(declare-fun m!219079 () Bool)

(assert (=> b!192732 m!219079))

(declare-fun m!219081 () Bool)

(assert (=> b!192732 m!219081))

(assert (=> b!192732 m!219033))

(assert (=> b!192732 m!219071))

(assert (=> b!192732 m!219065))

(assert (=> b!192732 m!219079))

(declare-fun m!219083 () Bool)

(assert (=> b!192732 m!219083))

(assert (=> b!192732 m!219077))

(declare-fun m!219085 () Bool)

(assert (=> b!192732 m!219085))

(declare-fun m!219087 () Bool)

(assert (=> b!192732 m!219087))

(declare-fun m!219089 () Bool)

(assert (=> b!192732 m!219089))

(declare-fun m!219091 () Bool)

(assert (=> b!192732 m!219091))

(declare-fun m!219093 () Bool)

(assert (=> b!192732 m!219093))

(declare-fun m!219095 () Bool)

(assert (=> b!192732 m!219095))

(declare-fun m!219097 () Bool)

(assert (=> b!192726 m!219097))

(declare-fun m!219099 () Bool)

(assert (=> b!192726 m!219099))

(declare-fun m!219101 () Bool)

(assert (=> b!192726 m!219101))

(assert (=> b!192726 m!219099))

(assert (=> b!192726 m!219033))

(assert (=> b!192726 m!219097))

(assert (=> b!192726 m!219033))

(declare-fun m!219103 () Bool)

(assert (=> b!192726 m!219103))

(declare-fun m!219105 () Bool)

(assert (=> bm!19447 m!219105))

(assert (=> b!192739 m!219033))

(assert (=> b!192739 m!219033))

(declare-fun m!219107 () Bool)

(assert (=> b!192739 m!219107))

(declare-fun m!219109 () Bool)

(assert (=> b!192727 m!219109))

(declare-fun m!219111 () Bool)

(assert (=> bm!19446 m!219111))

(assert (=> b!192741 m!219033))

(assert (=> b!192741 m!219033))

(assert (=> b!192741 m!219041))

(declare-fun m!219113 () Bool)

(assert (=> b!192744 m!219113))

(declare-fun m!219115 () Bool)

(assert (=> bm!19444 m!219115))

(assert (=> bm!19448 m!219091))

(assert (=> b!192734 m!219033))

(assert (=> b!192734 m!219033))

(assert (=> b!192734 m!219041))

(declare-fun m!219117 () Bool)

(assert (=> b!192733 m!219117))

(assert (=> b!192551 d!56377))

(declare-fun d!56379 () Bool)

(declare-fun e!126817 () Bool)

(assert (=> d!56379 e!126817))

(declare-fun res!91043 () Bool)

(assert (=> d!56379 (=> (not res!91043) (not e!126817))))

(assert (=> d!56379 (= res!91043 (and (bvsge (index!4911 lt!95639) #b00000000000000000000000000000000) (bvslt (index!4911 lt!95639) (size!4164 (_values!3914 thiss!1248)))))))

(declare-fun lt!95791 () Unit!5778)

(declare-fun choose!1058 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 32) (_ BitVec 64) V!5601 Int) Unit!5778)

(assert (=> d!56379 (= lt!95791 (choose!1058 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) (index!4911 lt!95639) key!828 v!309 (defaultEntry!3931 thiss!1248)))))

(assert (=> d!56379 (validMask!0 (mask!9169 thiss!1248))))

(assert (=> d!56379 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!124 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) (index!4911 lt!95639) key!828 v!309 (defaultEntry!3931 thiss!1248)) lt!95791)))

(declare-fun b!192749 () Bool)

(assert (=> b!192749 (= e!126817 (= (+!308 (getCurrentListMap!849 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)) (tuple2!3493 key!828 v!309)) (getCurrentListMap!849 (_keys!5916 thiss!1248) (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248))) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248))))))

(assert (= (and d!56379 res!91043) b!192749))

(declare-fun m!219119 () Bool)

(assert (=> d!56379 m!219119))

(assert (=> d!56379 m!218931))

(assert (=> b!192749 m!218925))

(assert (=> b!192749 m!218925))

(declare-fun m!219121 () Bool)

(assert (=> b!192749 m!219121))

(assert (=> b!192749 m!218929))

(assert (=> b!192749 m!218935))

(assert (=> b!192551 d!56379))

(declare-fun d!56381 () Bool)

(assert (=> d!56381 (= (validMask!0 (mask!9169 thiss!1248)) (and (or (= (mask!9169 thiss!1248) #b00000000000000000000000000000111) (= (mask!9169 thiss!1248) #b00000000000000000000000000001111) (= (mask!9169 thiss!1248) #b00000000000000000000000000011111) (= (mask!9169 thiss!1248) #b00000000000000000000000000111111) (= (mask!9169 thiss!1248) #b00000000000000000000000001111111) (= (mask!9169 thiss!1248) #b00000000000000000000000011111111) (= (mask!9169 thiss!1248) #b00000000000000000000000111111111) (= (mask!9169 thiss!1248) #b00000000000000000000001111111111) (= (mask!9169 thiss!1248) #b00000000000000000000011111111111) (= (mask!9169 thiss!1248) #b00000000000000000000111111111111) (= (mask!9169 thiss!1248) #b00000000000000000001111111111111) (= (mask!9169 thiss!1248) #b00000000000000000011111111111111) (= (mask!9169 thiss!1248) #b00000000000000000111111111111111) (= (mask!9169 thiss!1248) #b00000000000000001111111111111111) (= (mask!9169 thiss!1248) #b00000000000000011111111111111111) (= (mask!9169 thiss!1248) #b00000000000000111111111111111111) (= (mask!9169 thiss!1248) #b00000000000001111111111111111111) (= (mask!9169 thiss!1248) #b00000000000011111111111111111111) (= (mask!9169 thiss!1248) #b00000000000111111111111111111111) (= (mask!9169 thiss!1248) #b00000000001111111111111111111111) (= (mask!9169 thiss!1248) #b00000000011111111111111111111111) (= (mask!9169 thiss!1248) #b00000000111111111111111111111111) (= (mask!9169 thiss!1248) #b00000001111111111111111111111111) (= (mask!9169 thiss!1248) #b00000011111111111111111111111111) (= (mask!9169 thiss!1248) #b00000111111111111111111111111111) (= (mask!9169 thiss!1248) #b00001111111111111111111111111111) (= (mask!9169 thiss!1248) #b00011111111111111111111111111111) (= (mask!9169 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9169 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!192551 d!56381))

(declare-fun bm!19450 () Bool)

(declare-fun call!19457 () ListLongMap!2401)

(declare-fun call!19454 () ListLongMap!2401)

(assert (=> bm!19450 (= call!19457 call!19454)))

(declare-fun b!192750 () Bool)

(declare-fun e!126824 () Bool)

(declare-fun call!19459 () Bool)

(assert (=> b!192750 (= e!126824 (not call!19459))))

(declare-fun b!192751 () Bool)

(declare-fun e!126820 () Bool)

(declare-fun e!126830 () Bool)

(assert (=> b!192751 (= e!126820 e!126830)))

(declare-fun c!34768 () Bool)

(assert (=> b!192751 (= c!34768 (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!56383 () Bool)

(assert (=> d!56383 e!126820))

(declare-fun res!91052 () Bool)

(assert (=> d!56383 (=> (not res!91052) (not e!126820))))

(assert (=> d!56383 (= res!91052 (or (bvsge #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))))

(declare-fun lt!95795 () ListLongMap!2401)

(declare-fun lt!95813 () ListLongMap!2401)

(assert (=> d!56383 (= lt!95795 lt!95813)))

(declare-fun lt!95794 () Unit!5778)

(declare-fun e!126828 () Unit!5778)

(assert (=> d!56383 (= lt!95794 e!126828)))

(declare-fun c!34773 () Bool)

(declare-fun e!126819 () Bool)

(assert (=> d!56383 (= c!34773 e!126819)))

(declare-fun res!91046 () Bool)

(assert (=> d!56383 (=> (not res!91046) (not e!126819))))

(assert (=> d!56383 (= res!91046 (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun e!126818 () ListLongMap!2401)

(assert (=> d!56383 (= lt!95813 e!126818)))

(declare-fun c!34771 () Bool)

(assert (=> d!56383 (= c!34771 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56383 (validMask!0 (mask!9169 thiss!1248))))

(assert (=> d!56383 (= (getCurrentListMap!849 (_keys!5916 thiss!1248) (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248))) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)) lt!95795)))

(declare-fun e!126829 () Bool)

(declare-fun b!192752 () Bool)

(assert (=> b!192752 (= e!126829 (= (apply!184 lt!95795 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3839 (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!518 (defaultEntry!3931 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4164 (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248))))))))

(assert (=> b!192752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun b!192753 () Bool)

(assert (=> b!192753 (= e!126818 (+!308 call!19454 (tuple2!3493 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3772 thiss!1248))))))

(declare-fun b!192754 () Bool)

(declare-fun c!34770 () Bool)

(assert (=> b!192754 (= c!34770 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126823 () ListLongMap!2401)

(declare-fun e!126821 () ListLongMap!2401)

(assert (=> b!192754 (= e!126823 e!126821)))

(declare-fun b!192755 () Bool)

(declare-fun call!19456 () Bool)

(assert (=> b!192755 (= e!126830 (not call!19456))))

(declare-fun bm!19451 () Bool)

(assert (=> bm!19451 (= call!19459 (contains!1340 lt!95795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192756 () Bool)

(declare-fun res!91049 () Bool)

(assert (=> b!192756 (=> (not res!91049) (not e!126820))))

(assert (=> b!192756 (= res!91049 e!126824)))

(declare-fun c!34772 () Bool)

(assert (=> b!192756 (= c!34772 (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!192757 () Bool)

(declare-fun call!19455 () ListLongMap!2401)

(assert (=> b!192757 (= e!126821 call!19455)))

(declare-fun b!192758 () Bool)

(declare-fun lt!95803 () Unit!5778)

(assert (=> b!192758 (= e!126828 lt!95803)))

(declare-fun lt!95801 () ListLongMap!2401)

(assert (=> b!192758 (= lt!95801 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248))) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95799 () (_ BitVec 64))

(assert (=> b!192758 (= lt!95799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95806 () (_ BitVec 64))

(assert (=> b!192758 (= lt!95806 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95800 () Unit!5778)

(assert (=> b!192758 (= lt!95800 (addStillContains!160 lt!95801 lt!95799 (zeroValue!3772 thiss!1248) lt!95806))))

(assert (=> b!192758 (contains!1340 (+!308 lt!95801 (tuple2!3493 lt!95799 (zeroValue!3772 thiss!1248))) lt!95806)))

(declare-fun lt!95802 () Unit!5778)

(assert (=> b!192758 (= lt!95802 lt!95800)))

(declare-fun lt!95798 () ListLongMap!2401)

(assert (=> b!192758 (= lt!95798 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248))) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95805 () (_ BitVec 64))

(assert (=> b!192758 (= lt!95805 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95811 () (_ BitVec 64))

(assert (=> b!192758 (= lt!95811 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95792 () Unit!5778)

(assert (=> b!192758 (= lt!95792 (addApplyDifferent!160 lt!95798 lt!95805 (minValue!3772 thiss!1248) lt!95811))))

(assert (=> b!192758 (= (apply!184 (+!308 lt!95798 (tuple2!3493 lt!95805 (minValue!3772 thiss!1248))) lt!95811) (apply!184 lt!95798 lt!95811))))

(declare-fun lt!95796 () Unit!5778)

(assert (=> b!192758 (= lt!95796 lt!95792)))

(declare-fun lt!95812 () ListLongMap!2401)

(assert (=> b!192758 (= lt!95812 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248))) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95809 () (_ BitVec 64))

(assert (=> b!192758 (= lt!95809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95793 () (_ BitVec 64))

(assert (=> b!192758 (= lt!95793 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95808 () Unit!5778)

(assert (=> b!192758 (= lt!95808 (addApplyDifferent!160 lt!95812 lt!95809 (zeroValue!3772 thiss!1248) lt!95793))))

(assert (=> b!192758 (= (apply!184 (+!308 lt!95812 (tuple2!3493 lt!95809 (zeroValue!3772 thiss!1248))) lt!95793) (apply!184 lt!95812 lt!95793))))

(declare-fun lt!95807 () Unit!5778)

(assert (=> b!192758 (= lt!95807 lt!95808)))

(declare-fun lt!95810 () ListLongMap!2401)

(assert (=> b!192758 (= lt!95810 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248))) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95804 () (_ BitVec 64))

(assert (=> b!192758 (= lt!95804 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95797 () (_ BitVec 64))

(assert (=> b!192758 (= lt!95797 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192758 (= lt!95803 (addApplyDifferent!160 lt!95810 lt!95804 (minValue!3772 thiss!1248) lt!95797))))

(assert (=> b!192758 (= (apply!184 (+!308 lt!95810 (tuple2!3493 lt!95804 (minValue!3772 thiss!1248))) lt!95797) (apply!184 lt!95810 lt!95797))))

(declare-fun b!192759 () Bool)

(declare-fun e!126825 () Bool)

(assert (=> b!192759 (= e!126825 (= (apply!184 lt!95795 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3772 thiss!1248)))))

(declare-fun bm!19452 () Bool)

(declare-fun call!19458 () ListLongMap!2401)

(declare-fun call!19453 () ListLongMap!2401)

(assert (=> bm!19452 (= call!19458 call!19453)))

(declare-fun b!192760 () Bool)

(declare-fun e!126826 () Bool)

(assert (=> b!192760 (= e!126826 (validKeyInArray!0 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19453 () Bool)

(assert (=> bm!19453 (= call!19456 (contains!1340 lt!95795 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192761 () Bool)

(assert (=> b!192761 (= e!126821 call!19457)))

(declare-fun b!192762 () Bool)

(declare-fun res!91051 () Bool)

(assert (=> b!192762 (=> (not res!91051) (not e!126820))))

(declare-fun e!126822 () Bool)

(assert (=> b!192762 (= res!91051 e!126822)))

(declare-fun res!91045 () Bool)

(assert (=> b!192762 (=> res!91045 e!126822)))

(assert (=> b!192762 (= res!91045 (not e!126826))))

(declare-fun res!91050 () Bool)

(assert (=> b!192762 (=> (not res!91050) (not e!126826))))

(assert (=> b!192762 (= res!91050 (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun c!34769 () Bool)

(declare-fun bm!19454 () Bool)

(assert (=> bm!19454 (= call!19454 (+!308 (ite c!34771 call!19453 (ite c!34769 call!19458 call!19455)) (ite (or c!34771 c!34769) (tuple2!3493 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3772 thiss!1248)) (tuple2!3493 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3772 thiss!1248)))))))

(declare-fun bm!19455 () Bool)

(assert (=> bm!19455 (= call!19453 (getCurrentListMapNoExtraKeys!205 (_keys!5916 thiss!1248) (array!8156 (store (arr!3839 (_values!3914 thiss!1248)) (index!4911 lt!95639) (ValueCellFull!1889 v!309)) (size!4164 (_values!3914 thiss!1248))) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun b!192763 () Bool)

(declare-fun Unit!5789 () Unit!5778)

(assert (=> b!192763 (= e!126828 Unit!5789)))

(declare-fun bm!19456 () Bool)

(assert (=> bm!19456 (= call!19455 call!19458)))

(declare-fun b!192764 () Bool)

(assert (=> b!192764 (= e!126823 call!19457)))

(declare-fun b!192765 () Bool)

(assert (=> b!192765 (= e!126822 e!126829)))

(declare-fun res!91048 () Bool)

(assert (=> b!192765 (=> (not res!91048) (not e!126829))))

(assert (=> b!192765 (= res!91048 (contains!1340 lt!95795 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun b!192766 () Bool)

(assert (=> b!192766 (= e!126818 e!126823)))

(assert (=> b!192766 (= c!34769 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192767 () Bool)

(assert (=> b!192767 (= e!126819 (validKeyInArray!0 (select (arr!3838 (_keys!5916 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192768 () Bool)

(declare-fun e!126827 () Bool)

(assert (=> b!192768 (= e!126824 e!126827)))

(declare-fun res!91044 () Bool)

(assert (=> b!192768 (= res!91044 call!19459)))

(assert (=> b!192768 (=> (not res!91044) (not e!126827))))

(declare-fun b!192769 () Bool)

(assert (=> b!192769 (= e!126830 e!126825)))

(declare-fun res!91047 () Bool)

(assert (=> b!192769 (= res!91047 call!19456)))

(assert (=> b!192769 (=> (not res!91047) (not e!126825))))

(declare-fun b!192770 () Bool)

(assert (=> b!192770 (= e!126827 (= (apply!184 lt!95795 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3772 thiss!1248)))))

(assert (= (and d!56383 c!34771) b!192753))

(assert (= (and d!56383 (not c!34771)) b!192766))

(assert (= (and b!192766 c!34769) b!192764))

(assert (= (and b!192766 (not c!34769)) b!192754))

(assert (= (and b!192754 c!34770) b!192761))

(assert (= (and b!192754 (not c!34770)) b!192757))

(assert (= (or b!192761 b!192757) bm!19456))

(assert (= (or b!192764 bm!19456) bm!19452))

(assert (= (or b!192764 b!192761) bm!19450))

(assert (= (or b!192753 bm!19452) bm!19455))

(assert (= (or b!192753 bm!19450) bm!19454))

(assert (= (and d!56383 res!91046) b!192767))

(assert (= (and d!56383 c!34773) b!192758))

(assert (= (and d!56383 (not c!34773)) b!192763))

(assert (= (and d!56383 res!91052) b!192762))

(assert (= (and b!192762 res!91050) b!192760))

(assert (= (and b!192762 (not res!91045)) b!192765))

(assert (= (and b!192765 res!91048) b!192752))

(assert (= (and b!192762 res!91051) b!192756))

(assert (= (and b!192756 c!34772) b!192768))

(assert (= (and b!192756 (not c!34772)) b!192750))

(assert (= (and b!192768 res!91044) b!192770))

(assert (= (or b!192768 b!192750) bm!19451))

(assert (= (and b!192756 res!91049) b!192751))

(assert (= (and b!192751 c!34768) b!192769))

(assert (= (and b!192751 (not c!34768)) b!192755))

(assert (= (and b!192769 res!91047) b!192759))

(assert (= (or b!192769 b!192755) bm!19453))

(declare-fun b_lambda!7431 () Bool)

(assert (=> (not b_lambda!7431) (not b!192752)))

(assert (=> b!192752 t!7324))

(declare-fun b_and!11373 () Bool)

(assert (= b_and!11371 (and (=> t!7324 result!4907) b_and!11373)))

(assert (=> d!56383 m!218931))

(declare-fun m!219123 () Bool)

(assert (=> b!192758 m!219123))

(declare-fun m!219125 () Bool)

(assert (=> b!192758 m!219125))

(declare-fun m!219127 () Bool)

(assert (=> b!192758 m!219127))

(declare-fun m!219129 () Bool)

(assert (=> b!192758 m!219129))

(declare-fun m!219131 () Bool)

(assert (=> b!192758 m!219131))

(declare-fun m!219133 () Bool)

(assert (=> b!192758 m!219133))

(declare-fun m!219135 () Bool)

(assert (=> b!192758 m!219135))

(declare-fun m!219137 () Bool)

(assert (=> b!192758 m!219137))

(declare-fun m!219139 () Bool)

(assert (=> b!192758 m!219139))

(assert (=> b!192758 m!219033))

(assert (=> b!192758 m!219129))

(assert (=> b!192758 m!219123))

(assert (=> b!192758 m!219137))

(declare-fun m!219141 () Bool)

(assert (=> b!192758 m!219141))

(assert (=> b!192758 m!219135))

(declare-fun m!219143 () Bool)

(assert (=> b!192758 m!219143))

(declare-fun m!219145 () Bool)

(assert (=> b!192758 m!219145))

(declare-fun m!219147 () Bool)

(assert (=> b!192758 m!219147))

(declare-fun m!219149 () Bool)

(assert (=> b!192758 m!219149))

(declare-fun m!219151 () Bool)

(assert (=> b!192758 m!219151))

(declare-fun m!219153 () Bool)

(assert (=> b!192758 m!219153))

(declare-fun m!219155 () Bool)

(assert (=> b!192752 m!219155))

(assert (=> b!192752 m!219099))

(declare-fun m!219157 () Bool)

(assert (=> b!192752 m!219157))

(assert (=> b!192752 m!219099))

(assert (=> b!192752 m!219033))

(assert (=> b!192752 m!219155))

(assert (=> b!192752 m!219033))

(declare-fun m!219159 () Bool)

(assert (=> b!192752 m!219159))

(declare-fun m!219161 () Bool)

(assert (=> bm!19454 m!219161))

(assert (=> b!192765 m!219033))

(assert (=> b!192765 m!219033))

(declare-fun m!219163 () Bool)

(assert (=> b!192765 m!219163))

(declare-fun m!219165 () Bool)

(assert (=> b!192753 m!219165))

(declare-fun m!219167 () Bool)

(assert (=> bm!19453 m!219167))

(assert (=> b!192767 m!219033))

(assert (=> b!192767 m!219033))

(assert (=> b!192767 m!219041))

(declare-fun m!219169 () Bool)

(assert (=> b!192770 m!219169))

(declare-fun m!219171 () Bool)

(assert (=> bm!19451 m!219171))

(assert (=> bm!19455 m!219149))

(assert (=> b!192760 m!219033))

(assert (=> b!192760 m!219033))

(assert (=> b!192760 m!219041))

(declare-fun m!219173 () Bool)

(assert (=> b!192759 m!219173))

(assert (=> b!192551 d!56383))

(declare-fun b!192787 () Bool)

(declare-fun lt!95819 () SeekEntryResult!685)

(assert (=> b!192787 (and (bvsge (index!4910 lt!95819) #b00000000000000000000000000000000) (bvslt (index!4910 lt!95819) (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun res!91063 () Bool)

(assert (=> b!192787 (= res!91063 (= (select (arr!3838 (_keys!5916 thiss!1248)) (index!4910 lt!95819)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126842 () Bool)

(assert (=> b!192787 (=> (not res!91063) (not e!126842))))

(declare-fun bm!19461 () Bool)

(declare-fun call!19465 () Bool)

(assert (=> bm!19461 (= call!19465 (arrayContainsKey!0 (_keys!5916 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!192788 () Bool)

(declare-fun res!91062 () Bool)

(declare-fun e!126841 () Bool)

(assert (=> b!192788 (=> (not res!91062) (not e!126841))))

(assert (=> b!192788 (= res!91062 (= (select (arr!3838 (_keys!5916 thiss!1248)) (index!4913 lt!95819)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192788 (and (bvsge (index!4913 lt!95819) #b00000000000000000000000000000000) (bvslt (index!4913 lt!95819) (size!4163 (_keys!5916 thiss!1248))))))

(declare-fun b!192789 () Bool)

(assert (=> b!192789 (= e!126842 (not call!19465))))

(declare-fun d!56385 () Bool)

(declare-fun e!126840 () Bool)

(assert (=> d!56385 e!126840))

(declare-fun c!34778 () Bool)

(assert (=> d!56385 (= c!34778 ((_ is MissingZero!685) lt!95819))))

(assert (=> d!56385 (= lt!95819 (seekEntryOrOpen!0 key!828 (_keys!5916 thiss!1248) (mask!9169 thiss!1248)))))

(declare-fun lt!95818 () Unit!5778)

(declare-fun choose!1059 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 64) Int) Unit!5778)

(assert (=> d!56385 (= lt!95818 (choose!1059 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)))))

(assert (=> d!56385 (validMask!0 (mask!9169 thiss!1248))))

(assert (=> d!56385 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!173 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)) lt!95818)))

(declare-fun b!192790 () Bool)

(assert (=> b!192790 (= e!126841 (not call!19465))))

(declare-fun b!192791 () Bool)

(declare-fun e!126839 () Bool)

(assert (=> b!192791 (= e!126840 e!126839)))

(declare-fun c!34779 () Bool)

(assert (=> b!192791 (= c!34779 ((_ is MissingVacant!685) lt!95819))))

(declare-fun call!19464 () Bool)

(declare-fun bm!19462 () Bool)

(assert (=> bm!19462 (= call!19464 (inRange!0 (ite c!34778 (index!4910 lt!95819) (index!4913 lt!95819)) (mask!9169 thiss!1248)))))

(declare-fun b!192792 () Bool)

(declare-fun res!91061 () Bool)

(assert (=> b!192792 (=> (not res!91061) (not e!126841))))

(assert (=> b!192792 (= res!91061 call!19464)))

(assert (=> b!192792 (= e!126839 e!126841)))

(declare-fun b!192793 () Bool)

(assert (=> b!192793 (= e!126840 e!126842)))

(declare-fun res!91064 () Bool)

(assert (=> b!192793 (= res!91064 call!19464)))

(assert (=> b!192793 (=> (not res!91064) (not e!126842))))

(declare-fun b!192794 () Bool)

(assert (=> b!192794 (= e!126839 ((_ is Undefined!685) lt!95819))))

(assert (= (and d!56385 c!34778) b!192793))

(assert (= (and d!56385 (not c!34778)) b!192791))

(assert (= (and b!192793 res!91064) b!192787))

(assert (= (and b!192787 res!91063) b!192789))

(assert (= (and b!192791 c!34779) b!192792))

(assert (= (and b!192791 (not c!34779)) b!192794))

(assert (= (and b!192792 res!91061) b!192788))

(assert (= (and b!192788 res!91062) b!192790))

(assert (= (or b!192793 b!192792) bm!19462))

(assert (= (or b!192789 b!192790) bm!19461))

(declare-fun m!219175 () Bool)

(assert (=> b!192788 m!219175))

(declare-fun m!219177 () Bool)

(assert (=> bm!19461 m!219177))

(assert (=> d!56385 m!218913))

(declare-fun m!219179 () Bool)

(assert (=> d!56385 m!219179))

(assert (=> d!56385 m!218931))

(declare-fun m!219181 () Bool)

(assert (=> b!192787 m!219181))

(declare-fun m!219183 () Bool)

(assert (=> bm!19462 m!219183))

(assert (=> b!192552 d!56385))

(declare-fun d!56387 () Bool)

(declare-fun e!126845 () Bool)

(assert (=> d!56387 e!126845))

(declare-fun res!91070 () Bool)

(assert (=> d!56387 (=> (not res!91070) (not e!126845))))

(declare-fun lt!95824 () SeekEntryResult!685)

(assert (=> d!56387 (= res!91070 ((_ is Found!685) lt!95824))))

(assert (=> d!56387 (= lt!95824 (seekEntryOrOpen!0 key!828 (_keys!5916 thiss!1248) (mask!9169 thiss!1248)))))

(declare-fun lt!95825 () Unit!5778)

(declare-fun choose!1060 (array!8153 array!8155 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 64) Int) Unit!5778)

(assert (=> d!56387 (= lt!95825 (choose!1060 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)))))

(assert (=> d!56387 (validMask!0 (mask!9169 thiss!1248))))

(assert (=> d!56387 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!174 (_keys!5916 thiss!1248) (_values!3914 thiss!1248) (mask!9169 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)) lt!95825)))

(declare-fun b!192799 () Bool)

(declare-fun res!91069 () Bool)

(assert (=> b!192799 (=> (not res!91069) (not e!126845))))

(assert (=> b!192799 (= res!91069 (inRange!0 (index!4911 lt!95824) (mask!9169 thiss!1248)))))

(declare-fun b!192800 () Bool)

(assert (=> b!192800 (= e!126845 (= (select (arr!3838 (_keys!5916 thiss!1248)) (index!4911 lt!95824)) key!828))))

(assert (=> b!192800 (and (bvsge (index!4911 lt!95824) #b00000000000000000000000000000000) (bvslt (index!4911 lt!95824) (size!4163 (_keys!5916 thiss!1248))))))

(assert (= (and d!56387 res!91070) b!192799))

(assert (= (and b!192799 res!91069) b!192800))

(assert (=> d!56387 m!218913))

(declare-fun m!219185 () Bool)

(assert (=> d!56387 m!219185))

(assert (=> d!56387 m!218931))

(declare-fun m!219187 () Bool)

(assert (=> b!192799 m!219187))

(declare-fun m!219189 () Bool)

(assert (=> b!192800 m!219189))

(assert (=> b!192550 d!56387))

(declare-fun d!56389 () Bool)

(assert (=> d!56389 (= (inRange!0 (index!4911 lt!95639) (mask!9169 thiss!1248)) (and (bvsge (index!4911 lt!95639) #b00000000000000000000000000000000) (bvslt (index!4911 lt!95639) (bvadd (mask!9169 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!192550 d!56389))

(declare-fun condMapEmpty!7727 () Bool)

(declare-fun mapDefault!7727 () ValueCell!1889)

(assert (=> mapNonEmpty!7718 (= condMapEmpty!7727 (= mapRest!7718 ((as const (Array (_ BitVec 32) ValueCell!1889)) mapDefault!7727)))))

(declare-fun e!126850 () Bool)

(declare-fun mapRes!7727 () Bool)

(assert (=> mapNonEmpty!7718 (= tp!16937 (and e!126850 mapRes!7727))))

(declare-fun b!192808 () Bool)

(assert (=> b!192808 (= e!126850 tp_is_empty!4465)))

(declare-fun mapNonEmpty!7727 () Bool)

(declare-fun tp!16952 () Bool)

(declare-fun e!126851 () Bool)

(assert (=> mapNonEmpty!7727 (= mapRes!7727 (and tp!16952 e!126851))))

(declare-fun mapKey!7727 () (_ BitVec 32))

(declare-fun mapRest!7727 () (Array (_ BitVec 32) ValueCell!1889))

(declare-fun mapValue!7727 () ValueCell!1889)

(assert (=> mapNonEmpty!7727 (= mapRest!7718 (store mapRest!7727 mapKey!7727 mapValue!7727))))

(declare-fun mapIsEmpty!7727 () Bool)

(assert (=> mapIsEmpty!7727 mapRes!7727))

(declare-fun b!192807 () Bool)

(assert (=> b!192807 (= e!126851 tp_is_empty!4465)))

(assert (= (and mapNonEmpty!7718 condMapEmpty!7727) mapIsEmpty!7727))

(assert (= (and mapNonEmpty!7718 (not condMapEmpty!7727)) mapNonEmpty!7727))

(assert (= (and mapNonEmpty!7727 ((_ is ValueCellFull!1889) mapValue!7727)) b!192807))

(assert (= (and mapNonEmpty!7718 ((_ is ValueCellFull!1889) mapDefault!7727)) b!192808))

(declare-fun m!219191 () Bool)

(assert (=> mapNonEmpty!7727 m!219191))

(declare-fun b_lambda!7433 () Bool)

(assert (= b_lambda!7429 (or (and b!192549 b_free!4693) b_lambda!7433)))

(declare-fun b_lambda!7435 () Bool)

(assert (= b_lambda!7431 (or (and b!192549 b_free!4693) b_lambda!7435)))

(check-sat (not d!56363) (not bm!19444) (not d!56383) (not d!56373) (not d!56369) (not b!192679) (not bm!19461) (not b!192663) (not mapNonEmpty!7727) (not b!192734) (not b!192749) (not bm!19455) (not b!192744) (not bm!19454) (not b!192741) (not b!192652) (not b!192767) (not bm!19448) (not bm!19451) (not b_lambda!7435) (not b!192671) (not bm!19453) (not bm!19447) (not d!56385) (not b!192654) (not b!192799) (not b!192760) (not b!192665) (not b_next!4693) (not b!192770) (not b!192640) (not b!192653) (not d!56375) (not bm!19446) (not b!192765) (not b!192727) (not b!192758) (not b!192672) (not d!56379) (not b!192726) (not b!192759) (not b!192752) (not b!192681) (not bm!19462) (not d!56387) (not b!192739) (not b_lambda!7433) (not b!192732) tp_is_empty!4465 (not b!192753) (not b!192733) (not bm!19428) (not d!56377) b_and!11373)
(check-sat b_and!11373 (not b_next!4693))
