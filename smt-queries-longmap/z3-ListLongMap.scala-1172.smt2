; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25136 () Bool)

(assert start!25136)

(declare-fun b!262035 () Bool)

(declare-fun b_free!6783 () Bool)

(declare-fun b_next!6783 () Bool)

(assert (=> b!262035 (= b_free!6783 (not b_next!6783))))

(declare-fun tp!23680 () Bool)

(declare-fun b_and!13917 () Bool)

(assert (=> b!262035 (= tp!23680 b_and!13917)))

(declare-fun b!262029 () Bool)

(declare-datatypes ((Unit!8160 0))(
  ( (Unit!8161) )
))
(declare-fun e!169819 () Unit!8160)

(declare-fun Unit!8162 () Unit!8160)

(assert (=> b!262029 (= e!169819 Unit!8162)))

(declare-fun lt!132383 () Unit!8160)

(declare-datatypes ((V!8507 0))(
  ( (V!8508 (val!3367 Int)) )
))
(declare-datatypes ((ValueCell!2979 0))(
  ( (ValueCellFull!2979 (v!5492 V!8507)) (EmptyCell!2979) )
))
(declare-datatypes ((array!12647 0))(
  ( (array!12648 (arr!5986 (Array (_ BitVec 32) ValueCell!2979)) (size!6337 (_ BitVec 32))) )
))
(declare-datatypes ((array!12649 0))(
  ( (array!12650 (arr!5987 (Array (_ BitVec 32) (_ BitVec 64))) (size!6338 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3858 0))(
  ( (LongMapFixedSize!3859 (defaultEntry!4827 Int) (mask!11179 (_ BitVec 32)) (extraKeys!4564 (_ BitVec 32)) (zeroValue!4668 V!8507) (minValue!4668 V!8507) (_size!1978 (_ BitVec 32)) (_keys!7015 array!12649) (_values!4810 array!12647) (_vacant!1978 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3858)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!451 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 64) Int) Unit!8160)

(assert (=> b!262029 (= lt!132383 (lemmaInListMapThenSeekEntryOrOpenFindsIt!451 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) key!932 (defaultEntry!4827 thiss!1504)))))

(assert (=> b!262029 false))

(declare-fun b!262030 () Bool)

(declare-fun res!127994 () Bool)

(declare-datatypes ((SeekEntryResult!1194 0))(
  ( (MissingZero!1194 (index!6946 (_ BitVec 32))) (Found!1194 (index!6947 (_ BitVec 32))) (Intermediate!1194 (undefined!2006 Bool) (index!6948 (_ BitVec 32)) (x!25200 (_ BitVec 32))) (Undefined!1194) (MissingVacant!1194 (index!6949 (_ BitVec 32))) )
))
(declare-fun lt!132385 () SeekEntryResult!1194)

(assert (=> b!262030 (= res!127994 (= (select (arr!5987 (_keys!7015 thiss!1504)) (index!6949 lt!132385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169811 () Bool)

(assert (=> b!262030 (=> (not res!127994) (not e!169811))))

(declare-fun b!262031 () Bool)

(declare-fun e!169810 () Bool)

(get-info :version)

(assert (=> b!262031 (= e!169810 ((_ is Undefined!1194) lt!132385))))

(declare-fun bm!25018 () Bool)

(declare-fun call!25022 () Bool)

(declare-fun arrayContainsKey!0 (array!12649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!25018 (= call!25022 (arrayContainsKey!0 (_keys!7015 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262032 () Bool)

(declare-fun e!169808 () Bool)

(declare-fun e!169813 () Bool)

(assert (=> b!262032 (= e!169808 e!169813)))

(declare-fun res!127998 () Bool)

(assert (=> b!262032 (=> (not res!127998) (not e!169813))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!262032 (= res!127998 (or (= lt!132385 (MissingZero!1194 index!297)) (= lt!132385 (MissingVacant!1194 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12649 (_ BitVec 32)) SeekEntryResult!1194)

(assert (=> b!262032 (= lt!132385 (seekEntryOrOpen!0 key!932 (_keys!7015 thiss!1504) (mask!11179 thiss!1504)))))

(declare-fun b!262033 () Bool)

(declare-fun e!169820 () Bool)

(assert (=> b!262033 (= e!169820 (not call!25022))))

(declare-fun mapNonEmpty!11326 () Bool)

(declare-fun mapRes!11326 () Bool)

(declare-fun tp!23679 () Bool)

(declare-fun e!169817 () Bool)

(assert (=> mapNonEmpty!11326 (= mapRes!11326 (and tp!23679 e!169817))))

(declare-fun mapKey!11326 () (_ BitVec 32))

(declare-fun mapRest!11326 () (Array (_ BitVec 32) ValueCell!2979))

(declare-fun mapValue!11326 () ValueCell!2979)

(assert (=> mapNonEmpty!11326 (= (arr!5986 (_values!4810 thiss!1504)) (store mapRest!11326 mapKey!11326 mapValue!11326))))

(declare-fun tp_is_empty!6645 () Bool)

(declare-fun e!169816 () Bool)

(declare-fun e!169818 () Bool)

(declare-fun array_inv!3957 (array!12649) Bool)

(declare-fun array_inv!3958 (array!12647) Bool)

(assert (=> b!262035 (= e!169816 (and tp!23680 tp_is_empty!6645 (array_inv!3957 (_keys!7015 thiss!1504)) (array_inv!3958 (_values!4810 thiss!1504)) e!169818))))

(declare-fun call!25021 () Bool)

(declare-fun bm!25019 () Bool)

(declare-fun c!44635 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!25019 (= call!25021 (inRange!0 (ite c!44635 (index!6946 lt!132385) (index!6949 lt!132385)) (mask!11179 thiss!1504)))))

(declare-fun b!262036 () Bool)

(declare-fun e!169821 () Unit!8160)

(declare-fun Unit!8163 () Unit!8160)

(assert (=> b!262036 (= e!169821 Unit!8163)))

(declare-fun mapIsEmpty!11326 () Bool)

(assert (=> mapIsEmpty!11326 mapRes!11326))

(declare-fun b!262037 () Bool)

(assert (=> b!262037 (= e!169811 (not call!25022))))

(declare-fun b!262038 () Bool)

(declare-fun e!169814 () Bool)

(assert (=> b!262038 (= e!169814 (or (not (= (size!6337 (_values!4810 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11179 thiss!1504)))) (not (= (size!6338 (_keys!7015 thiss!1504)) (size!6337 (_values!4810 thiss!1504)))) (bvslt (mask!11179 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4564 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4564 thiss!1504) #b00000000000000000000000000000011) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7015 thiss!1504))))))))

(declare-fun b!262039 () Bool)

(declare-fun e!169815 () Bool)

(assert (=> b!262039 (= e!169813 e!169815)))

(declare-fun res!127997 () Bool)

(assert (=> b!262039 (=> (not res!127997) (not e!169815))))

(assert (=> b!262039 (= res!127997 (inRange!0 index!297 (mask!11179 thiss!1504)))))

(declare-fun lt!132391 () Unit!8160)

(assert (=> b!262039 (= lt!132391 e!169819)))

(declare-fun c!44636 () Bool)

(declare-datatypes ((tuple2!4966 0))(
  ( (tuple2!4967 (_1!2494 (_ BitVec 64)) (_2!2494 V!8507)) )
))
(declare-datatypes ((List!3842 0))(
  ( (Nil!3839) (Cons!3838 (h!4504 tuple2!4966) (t!8915 List!3842)) )
))
(declare-datatypes ((ListLongMap!3879 0))(
  ( (ListLongMap!3880 (toList!1955 List!3842)) )
))
(declare-fun lt!132384 () ListLongMap!3879)

(declare-fun contains!1902 (ListLongMap!3879 (_ BitVec 64)) Bool)

(assert (=> b!262039 (= c!44636 (contains!1902 lt!132384 key!932))))

(declare-fun getCurrentListMap!1483 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 32) Int) ListLongMap!3879)

(assert (=> b!262039 (= lt!132384 (getCurrentListMap!1483 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun b!262040 () Bool)

(declare-fun res!127992 () Bool)

(assert (=> b!262040 (=> (not res!127992) (not e!169808))))

(assert (=> b!262040 (= res!127992 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!262041 () Bool)

(declare-fun e!169809 () Bool)

(assert (=> b!262041 (= e!169809 tp_is_empty!6645)))

(declare-fun b!262034 () Bool)

(declare-fun c!44634 () Bool)

(assert (=> b!262034 (= c!44634 ((_ is MissingVacant!1194) lt!132385))))

(declare-fun e!169812 () Bool)

(assert (=> b!262034 (= e!169812 e!169810)))

(declare-fun res!127996 () Bool)

(assert (=> start!25136 (=> (not res!127996) (not e!169808))))

(declare-fun valid!1504 (LongMapFixedSize!3858) Bool)

(assert (=> start!25136 (= res!127996 (valid!1504 thiss!1504))))

(assert (=> start!25136 e!169808))

(assert (=> start!25136 e!169816))

(assert (=> start!25136 true))

(assert (=> start!25136 tp_is_empty!6645))

(declare-fun b!262042 () Bool)

(assert (=> b!262042 (= e!169815 (not e!169814))))

(declare-fun res!127991 () Bool)

(assert (=> b!262042 (=> res!127991 e!169814)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!262042 (= res!127991 (not (validMask!0 (mask!11179 thiss!1504))))))

(declare-fun lt!132386 () array!12649)

(declare-fun arrayCountValidKeys!0 (array!12649 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262042 (= (arrayCountValidKeys!0 lt!132386 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132394 () Unit!8160)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12649 (_ BitVec 32)) Unit!8160)

(assert (=> b!262042 (= lt!132394 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132386 index!297))))

(assert (=> b!262042 (arrayContainsKey!0 lt!132386 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132395 () Unit!8160)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12649 (_ BitVec 64) (_ BitVec 32)) Unit!8160)

(assert (=> b!262042 (= lt!132395 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132386 key!932 index!297))))

(declare-fun v!346 () V!8507)

(declare-fun +!706 (ListLongMap!3879 tuple2!4966) ListLongMap!3879)

(assert (=> b!262042 (= (+!706 lt!132384 (tuple2!4967 key!932 v!346)) (getCurrentListMap!1483 lt!132386 (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504))) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun lt!132392 () Unit!8160)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!116 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 32) (_ BitVec 64) V!8507 Int) Unit!8160)

(assert (=> b!262042 (= lt!132392 (lemmaAddValidKeyToArrayThenAddPairToListMap!116 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) index!297 key!932 v!346 (defaultEntry!4827 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12649 (_ BitVec 32)) Bool)

(assert (=> b!262042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132386 (mask!11179 thiss!1504))))

(declare-fun lt!132396 () Unit!8160)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12649 (_ BitVec 32) (_ BitVec 32)) Unit!8160)

(assert (=> b!262042 (= lt!132396 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7015 thiss!1504) index!297 (mask!11179 thiss!1504)))))

(assert (=> b!262042 (= (arrayCountValidKeys!0 lt!132386 #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7015 thiss!1504) #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504)))))))

(declare-fun lt!132389 () Unit!8160)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12649 (_ BitVec 32) (_ BitVec 64)) Unit!8160)

(assert (=> b!262042 (= lt!132389 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7015 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3843 0))(
  ( (Nil!3840) (Cons!3839 (h!4505 (_ BitVec 64)) (t!8916 List!3843)) )
))
(declare-fun arrayNoDuplicates!0 (array!12649 (_ BitVec 32) List!3843) Bool)

(assert (=> b!262042 (arrayNoDuplicates!0 lt!132386 #b00000000000000000000000000000000 Nil!3840)))

(assert (=> b!262042 (= lt!132386 (array!12650 (store (arr!5987 (_keys!7015 thiss!1504)) index!297 key!932) (size!6338 (_keys!7015 thiss!1504))))))

(declare-fun lt!132390 () Unit!8160)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12649 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3843) Unit!8160)

(assert (=> b!262042 (= lt!132390 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7015 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3840))))

(declare-fun lt!132388 () Unit!8160)

(assert (=> b!262042 (= lt!132388 e!169821)))

(declare-fun c!44633 () Bool)

(assert (=> b!262042 (= c!44633 (arrayContainsKey!0 (_keys!7015 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262043 () Bool)

(assert (=> b!262043 (= e!169817 tp_is_empty!6645)))

(declare-fun b!262044 () Bool)

(declare-fun res!127993 () Bool)

(assert (=> b!262044 (=> (not res!127993) (not e!169820))))

(assert (=> b!262044 (= res!127993 call!25021)))

(assert (=> b!262044 (= e!169812 e!169820)))

(declare-fun b!262045 () Bool)

(declare-fun lt!132393 () Unit!8160)

(assert (=> b!262045 (= e!169819 lt!132393)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!451 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 64) Int) Unit!8160)

(assert (=> b!262045 (= lt!132393 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!451 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) key!932 (defaultEntry!4827 thiss!1504)))))

(assert (=> b!262045 (= c!44635 ((_ is MissingZero!1194) lt!132385))))

(assert (=> b!262045 e!169812))

(declare-fun b!262046 () Bool)

(declare-fun Unit!8164 () Unit!8160)

(assert (=> b!262046 (= e!169821 Unit!8164)))

(declare-fun lt!132387 () Unit!8160)

(declare-fun lemmaArrayContainsKeyThenInListMap!258 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 64) (_ BitVec 32) Int) Unit!8160)

(assert (=> b!262046 (= lt!132387 (lemmaArrayContainsKeyThenInListMap!258 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(assert (=> b!262046 false))

(declare-fun b!262047 () Bool)

(assert (=> b!262047 (= e!169818 (and e!169809 mapRes!11326))))

(declare-fun condMapEmpty!11326 () Bool)

(declare-fun mapDefault!11326 () ValueCell!2979)

(assert (=> b!262047 (= condMapEmpty!11326 (= (arr!5986 (_values!4810 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2979)) mapDefault!11326)))))

(declare-fun b!262048 () Bool)

(declare-fun res!127995 () Bool)

(assert (=> b!262048 (=> (not res!127995) (not e!169820))))

(assert (=> b!262048 (= res!127995 (= (select (arr!5987 (_keys!7015 thiss!1504)) (index!6946 lt!132385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262049 () Bool)

(assert (=> b!262049 (= e!169810 e!169811)))

(declare-fun res!127999 () Bool)

(assert (=> b!262049 (= res!127999 call!25021)))

(assert (=> b!262049 (=> (not res!127999) (not e!169811))))

(assert (= (and start!25136 res!127996) b!262040))

(assert (= (and b!262040 res!127992) b!262032))

(assert (= (and b!262032 res!127998) b!262039))

(assert (= (and b!262039 c!44636) b!262029))

(assert (= (and b!262039 (not c!44636)) b!262045))

(assert (= (and b!262045 c!44635) b!262044))

(assert (= (and b!262045 (not c!44635)) b!262034))

(assert (= (and b!262044 res!127993) b!262048))

(assert (= (and b!262048 res!127995) b!262033))

(assert (= (and b!262034 c!44634) b!262049))

(assert (= (and b!262034 (not c!44634)) b!262031))

(assert (= (and b!262049 res!127999) b!262030))

(assert (= (and b!262030 res!127994) b!262037))

(assert (= (or b!262044 b!262049) bm!25019))

(assert (= (or b!262033 b!262037) bm!25018))

(assert (= (and b!262039 res!127997) b!262042))

(assert (= (and b!262042 c!44633) b!262046))

(assert (= (and b!262042 (not c!44633)) b!262036))

(assert (= (and b!262042 (not res!127991)) b!262038))

(assert (= (and b!262047 condMapEmpty!11326) mapIsEmpty!11326))

(assert (= (and b!262047 (not condMapEmpty!11326)) mapNonEmpty!11326))

(assert (= (and mapNonEmpty!11326 ((_ is ValueCellFull!2979) mapValue!11326)) b!262043))

(assert (= (and b!262047 ((_ is ValueCellFull!2979) mapDefault!11326)) b!262041))

(assert (= b!262035 b!262047))

(assert (= start!25136 b!262035))

(declare-fun m!278121 () Bool)

(assert (=> bm!25019 m!278121))

(declare-fun m!278123 () Bool)

(assert (=> b!262030 m!278123))

(declare-fun m!278125 () Bool)

(assert (=> b!262029 m!278125))

(declare-fun m!278127 () Bool)

(assert (=> b!262032 m!278127))

(declare-fun m!278129 () Bool)

(assert (=> b!262045 m!278129))

(declare-fun m!278131 () Bool)

(assert (=> b!262048 m!278131))

(declare-fun m!278133 () Bool)

(assert (=> b!262039 m!278133))

(declare-fun m!278135 () Bool)

(assert (=> b!262039 m!278135))

(declare-fun m!278137 () Bool)

(assert (=> b!262039 m!278137))

(declare-fun m!278139 () Bool)

(assert (=> start!25136 m!278139))

(declare-fun m!278141 () Bool)

(assert (=> b!262035 m!278141))

(declare-fun m!278143 () Bool)

(assert (=> b!262035 m!278143))

(declare-fun m!278145 () Bool)

(assert (=> b!262042 m!278145))

(declare-fun m!278147 () Bool)

(assert (=> b!262042 m!278147))

(declare-fun m!278149 () Bool)

(assert (=> b!262042 m!278149))

(declare-fun m!278151 () Bool)

(assert (=> b!262042 m!278151))

(declare-fun m!278153 () Bool)

(assert (=> b!262042 m!278153))

(declare-fun m!278155 () Bool)

(assert (=> b!262042 m!278155))

(declare-fun m!278157 () Bool)

(assert (=> b!262042 m!278157))

(declare-fun m!278159 () Bool)

(assert (=> b!262042 m!278159))

(declare-fun m!278161 () Bool)

(assert (=> b!262042 m!278161))

(declare-fun m!278163 () Bool)

(assert (=> b!262042 m!278163))

(declare-fun m!278165 () Bool)

(assert (=> b!262042 m!278165))

(declare-fun m!278167 () Bool)

(assert (=> b!262042 m!278167))

(declare-fun m!278169 () Bool)

(assert (=> b!262042 m!278169))

(declare-fun m!278171 () Bool)

(assert (=> b!262042 m!278171))

(declare-fun m!278173 () Bool)

(assert (=> b!262042 m!278173))

(declare-fun m!278175 () Bool)

(assert (=> b!262042 m!278175))

(declare-fun m!278177 () Bool)

(assert (=> b!262042 m!278177))

(declare-fun m!278179 () Bool)

(assert (=> b!262042 m!278179))

(declare-fun m!278181 () Bool)

(assert (=> mapNonEmpty!11326 m!278181))

(declare-fun m!278183 () Bool)

(assert (=> b!262046 m!278183))

(assert (=> bm!25018 m!278147))

(check-sat tp_is_empty!6645 (not b!262042) (not b!262045) b_and!13917 (not start!25136) (not mapNonEmpty!11326) (not bm!25018) (not b!262029) (not b!262039) (not b_next!6783) (not b!262035) (not bm!25019) (not b!262046) (not b!262032))
(check-sat b_and!13917 (not b_next!6783))
(get-model)

(declare-fun d!62963 () Bool)

(declare-fun res!128033 () Bool)

(declare-fun e!169869 () Bool)

(assert (=> d!62963 (=> (not res!128033) (not e!169869))))

(declare-fun simpleValid!283 (LongMapFixedSize!3858) Bool)

(assert (=> d!62963 (= res!128033 (simpleValid!283 thiss!1504))))

(assert (=> d!62963 (= (valid!1504 thiss!1504) e!169869)))

(declare-fun b!262119 () Bool)

(declare-fun res!128034 () Bool)

(assert (=> b!262119 (=> (not res!128034) (not e!169869))))

(assert (=> b!262119 (= res!128034 (= (arrayCountValidKeys!0 (_keys!7015 thiss!1504) #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))) (_size!1978 thiss!1504)))))

(declare-fun b!262120 () Bool)

(declare-fun res!128035 () Bool)

(assert (=> b!262120 (=> (not res!128035) (not e!169869))))

(assert (=> b!262120 (= res!128035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7015 thiss!1504) (mask!11179 thiss!1504)))))

(declare-fun b!262121 () Bool)

(assert (=> b!262121 (= e!169869 (arrayNoDuplicates!0 (_keys!7015 thiss!1504) #b00000000000000000000000000000000 Nil!3840))))

(assert (= (and d!62963 res!128033) b!262119))

(assert (= (and b!262119 res!128034) b!262120))

(assert (= (and b!262120 res!128035) b!262121))

(declare-fun m!278249 () Bool)

(assert (=> d!62963 m!278249))

(assert (=> b!262119 m!278157))

(declare-fun m!278251 () Bool)

(assert (=> b!262120 m!278251))

(declare-fun m!278253 () Bool)

(assert (=> b!262121 m!278253))

(assert (=> start!25136 d!62963))

(declare-fun bm!25030 () Bool)

(declare-fun call!25033 () Bool)

(assert (=> bm!25030 (= call!25033 (arrayContainsKey!0 (_keys!7015 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262138 () Bool)

(declare-fun res!128047 () Bool)

(declare-fun e!169880 () Bool)

(assert (=> b!262138 (=> (not res!128047) (not e!169880))))

(declare-fun lt!132444 () SeekEntryResult!1194)

(assert (=> b!262138 (= res!128047 (= (select (arr!5987 (_keys!7015 thiss!1504)) (index!6949 lt!132444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262138 (and (bvsge (index!6949 lt!132444) #b00000000000000000000000000000000) (bvslt (index!6949 lt!132444) (size!6338 (_keys!7015 thiss!1504))))))

(declare-fun b!262139 () Bool)

(assert (=> b!262139 (= e!169880 (not call!25033))))

(declare-fun b!262140 () Bool)

(declare-fun e!169878 () Bool)

(assert (=> b!262140 (= e!169878 (not call!25033))))

(declare-fun b!262141 () Bool)

(declare-fun e!169879 () Bool)

(assert (=> b!262141 (= e!169879 e!169878)))

(declare-fun res!128044 () Bool)

(declare-fun call!25034 () Bool)

(assert (=> b!262141 (= res!128044 call!25034)))

(assert (=> b!262141 (=> (not res!128044) (not e!169878))))

(declare-fun b!262142 () Bool)

(declare-fun e!169881 () Bool)

(assert (=> b!262142 (= e!169879 e!169881)))

(declare-fun c!44653 () Bool)

(assert (=> b!262142 (= c!44653 ((_ is MissingVacant!1194) lt!132444))))

(declare-fun b!262143 () Bool)

(declare-fun res!128045 () Bool)

(assert (=> b!262143 (=> (not res!128045) (not e!169880))))

(assert (=> b!262143 (= res!128045 call!25034)))

(assert (=> b!262143 (= e!169881 e!169880)))

(declare-fun d!62965 () Bool)

(assert (=> d!62965 e!169879))

(declare-fun c!44654 () Bool)

(assert (=> d!62965 (= c!44654 ((_ is MissingZero!1194) lt!132444))))

(assert (=> d!62965 (= lt!132444 (seekEntryOrOpen!0 key!932 (_keys!7015 thiss!1504) (mask!11179 thiss!1504)))))

(declare-fun lt!132443 () Unit!8160)

(declare-fun choose!1280 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 64) Int) Unit!8160)

(assert (=> d!62965 (= lt!132443 (choose!1280 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) key!932 (defaultEntry!4827 thiss!1504)))))

(assert (=> d!62965 (validMask!0 (mask!11179 thiss!1504))))

(assert (=> d!62965 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!451 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) key!932 (defaultEntry!4827 thiss!1504)) lt!132443)))

(declare-fun b!262144 () Bool)

(assert (=> b!262144 (= e!169881 ((_ is Undefined!1194) lt!132444))))

(declare-fun bm!25031 () Bool)

(assert (=> bm!25031 (= call!25034 (inRange!0 (ite c!44654 (index!6946 lt!132444) (index!6949 lt!132444)) (mask!11179 thiss!1504)))))

(declare-fun b!262145 () Bool)

(assert (=> b!262145 (and (bvsge (index!6946 lt!132444) #b00000000000000000000000000000000) (bvslt (index!6946 lt!132444) (size!6338 (_keys!7015 thiss!1504))))))

(declare-fun res!128046 () Bool)

(assert (=> b!262145 (= res!128046 (= (select (arr!5987 (_keys!7015 thiss!1504)) (index!6946 lt!132444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262145 (=> (not res!128046) (not e!169878))))

(assert (= (and d!62965 c!44654) b!262141))

(assert (= (and d!62965 (not c!44654)) b!262142))

(assert (= (and b!262141 res!128044) b!262145))

(assert (= (and b!262145 res!128046) b!262140))

(assert (= (and b!262142 c!44653) b!262143))

(assert (= (and b!262142 (not c!44653)) b!262144))

(assert (= (and b!262143 res!128045) b!262138))

(assert (= (and b!262138 res!128047) b!262139))

(assert (= (or b!262141 b!262143) bm!25031))

(assert (= (or b!262140 b!262139) bm!25030))

(declare-fun m!278255 () Bool)

(assert (=> b!262145 m!278255))

(declare-fun m!278257 () Bool)

(assert (=> b!262138 m!278257))

(assert (=> bm!25030 m!278147))

(declare-fun m!278259 () Bool)

(assert (=> bm!25031 m!278259))

(assert (=> d!62965 m!278127))

(declare-fun m!278261 () Bool)

(assert (=> d!62965 m!278261))

(assert (=> d!62965 m!278145))

(assert (=> b!262045 d!62965))

(declare-fun b!262158 () Bool)

(declare-fun e!169890 () SeekEntryResult!1194)

(declare-fun e!169889 () SeekEntryResult!1194)

(assert (=> b!262158 (= e!169890 e!169889)))

(declare-fun lt!132451 () (_ BitVec 64))

(declare-fun lt!132453 () SeekEntryResult!1194)

(assert (=> b!262158 (= lt!132451 (select (arr!5987 (_keys!7015 thiss!1504)) (index!6948 lt!132453)))))

(declare-fun c!44663 () Bool)

(assert (=> b!262158 (= c!44663 (= lt!132451 key!932))))

(declare-fun b!262159 () Bool)

(assert (=> b!262159 (= e!169889 (Found!1194 (index!6948 lt!132453)))))

(declare-fun d!62967 () Bool)

(declare-fun lt!132452 () SeekEntryResult!1194)

(assert (=> d!62967 (and (or ((_ is Undefined!1194) lt!132452) (not ((_ is Found!1194) lt!132452)) (and (bvsge (index!6947 lt!132452) #b00000000000000000000000000000000) (bvslt (index!6947 lt!132452) (size!6338 (_keys!7015 thiss!1504))))) (or ((_ is Undefined!1194) lt!132452) ((_ is Found!1194) lt!132452) (not ((_ is MissingZero!1194) lt!132452)) (and (bvsge (index!6946 lt!132452) #b00000000000000000000000000000000) (bvslt (index!6946 lt!132452) (size!6338 (_keys!7015 thiss!1504))))) (or ((_ is Undefined!1194) lt!132452) ((_ is Found!1194) lt!132452) ((_ is MissingZero!1194) lt!132452) (not ((_ is MissingVacant!1194) lt!132452)) (and (bvsge (index!6949 lt!132452) #b00000000000000000000000000000000) (bvslt (index!6949 lt!132452) (size!6338 (_keys!7015 thiss!1504))))) (or ((_ is Undefined!1194) lt!132452) (ite ((_ is Found!1194) lt!132452) (= (select (arr!5987 (_keys!7015 thiss!1504)) (index!6947 lt!132452)) key!932) (ite ((_ is MissingZero!1194) lt!132452) (= (select (arr!5987 (_keys!7015 thiss!1504)) (index!6946 lt!132452)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1194) lt!132452) (= (select (arr!5987 (_keys!7015 thiss!1504)) (index!6949 lt!132452)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62967 (= lt!132452 e!169890)))

(declare-fun c!44661 () Bool)

(assert (=> d!62967 (= c!44661 (and ((_ is Intermediate!1194) lt!132453) (undefined!2006 lt!132453)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12649 (_ BitVec 32)) SeekEntryResult!1194)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62967 (= lt!132453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11179 thiss!1504)) key!932 (_keys!7015 thiss!1504) (mask!11179 thiss!1504)))))

(assert (=> d!62967 (validMask!0 (mask!11179 thiss!1504))))

(assert (=> d!62967 (= (seekEntryOrOpen!0 key!932 (_keys!7015 thiss!1504) (mask!11179 thiss!1504)) lt!132452)))

(declare-fun b!262160 () Bool)

(declare-fun c!44662 () Bool)

(assert (=> b!262160 (= c!44662 (= lt!132451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169888 () SeekEntryResult!1194)

(assert (=> b!262160 (= e!169889 e!169888)))

(declare-fun b!262161 () Bool)

(assert (=> b!262161 (= e!169888 (MissingZero!1194 (index!6948 lt!132453)))))

(declare-fun b!262162 () Bool)

(assert (=> b!262162 (= e!169890 Undefined!1194)))

(declare-fun b!262163 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12649 (_ BitVec 32)) SeekEntryResult!1194)

(assert (=> b!262163 (= e!169888 (seekKeyOrZeroReturnVacant!0 (x!25200 lt!132453) (index!6948 lt!132453) (index!6948 lt!132453) key!932 (_keys!7015 thiss!1504) (mask!11179 thiss!1504)))))

(assert (= (and d!62967 c!44661) b!262162))

(assert (= (and d!62967 (not c!44661)) b!262158))

(assert (= (and b!262158 c!44663) b!262159))

(assert (= (and b!262158 (not c!44663)) b!262160))

(assert (= (and b!262160 c!44662) b!262161))

(assert (= (and b!262160 (not c!44662)) b!262163))

(declare-fun m!278263 () Bool)

(assert (=> b!262158 m!278263))

(declare-fun m!278265 () Bool)

(assert (=> d!62967 m!278265))

(declare-fun m!278267 () Bool)

(assert (=> d!62967 m!278267))

(assert (=> d!62967 m!278145))

(declare-fun m!278269 () Bool)

(assert (=> d!62967 m!278269))

(declare-fun m!278271 () Bool)

(assert (=> d!62967 m!278271))

(declare-fun m!278273 () Bool)

(assert (=> d!62967 m!278273))

(assert (=> d!62967 m!278269))

(declare-fun m!278275 () Bool)

(assert (=> b!262163 m!278275))

(assert (=> b!262032 d!62967))

(declare-fun d!62969 () Bool)

(assert (=> d!62969 (= (inRange!0 (ite c!44635 (index!6946 lt!132385) (index!6949 lt!132385)) (mask!11179 thiss!1504)) (and (bvsge (ite c!44635 (index!6946 lt!132385) (index!6949 lt!132385)) #b00000000000000000000000000000000) (bvslt (ite c!44635 (index!6946 lt!132385) (index!6949 lt!132385)) (bvadd (mask!11179 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25019 d!62969))

(declare-fun d!62971 () Bool)

(assert (=> d!62971 (= (inRange!0 index!297 (mask!11179 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11179 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!262039 d!62971))

(declare-fun d!62973 () Bool)

(declare-fun e!169895 () Bool)

(assert (=> d!62973 e!169895))

(declare-fun res!128050 () Bool)

(assert (=> d!62973 (=> res!128050 e!169895)))

(declare-fun lt!132464 () Bool)

(assert (=> d!62973 (= res!128050 (not lt!132464))))

(declare-fun lt!132462 () Bool)

(assert (=> d!62973 (= lt!132464 lt!132462)))

(declare-fun lt!132465 () Unit!8160)

(declare-fun e!169896 () Unit!8160)

(assert (=> d!62973 (= lt!132465 e!169896)))

(declare-fun c!44666 () Bool)

(assert (=> d!62973 (= c!44666 lt!132462)))

(declare-fun containsKey!310 (List!3842 (_ BitVec 64)) Bool)

(assert (=> d!62973 (= lt!132462 (containsKey!310 (toList!1955 lt!132384) key!932))))

(assert (=> d!62973 (= (contains!1902 lt!132384 key!932) lt!132464)))

(declare-fun b!262170 () Bool)

(declare-fun lt!132463 () Unit!8160)

(assert (=> b!262170 (= e!169896 lt!132463)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!258 (List!3842 (_ BitVec 64)) Unit!8160)

(assert (=> b!262170 (= lt!132463 (lemmaContainsKeyImpliesGetValueByKeyDefined!258 (toList!1955 lt!132384) key!932))))

(declare-datatypes ((Option!324 0))(
  ( (Some!323 (v!5496 V!8507)) (None!322) )
))
(declare-fun isDefined!259 (Option!324) Bool)

(declare-fun getValueByKey!318 (List!3842 (_ BitVec 64)) Option!324)

(assert (=> b!262170 (isDefined!259 (getValueByKey!318 (toList!1955 lt!132384) key!932))))

(declare-fun b!262171 () Bool)

(declare-fun Unit!8170 () Unit!8160)

(assert (=> b!262171 (= e!169896 Unit!8170)))

(declare-fun b!262172 () Bool)

(assert (=> b!262172 (= e!169895 (isDefined!259 (getValueByKey!318 (toList!1955 lt!132384) key!932)))))

(assert (= (and d!62973 c!44666) b!262170))

(assert (= (and d!62973 (not c!44666)) b!262171))

(assert (= (and d!62973 (not res!128050)) b!262172))

(declare-fun m!278277 () Bool)

(assert (=> d!62973 m!278277))

(declare-fun m!278279 () Bool)

(assert (=> b!262170 m!278279))

(declare-fun m!278281 () Bool)

(assert (=> b!262170 m!278281))

(assert (=> b!262170 m!278281))

(declare-fun m!278283 () Bool)

(assert (=> b!262170 m!278283))

(assert (=> b!262172 m!278281))

(assert (=> b!262172 m!278281))

(assert (=> b!262172 m!278283))

(assert (=> b!262039 d!62973))

(declare-fun bm!25046 () Bool)

(declare-fun call!25052 () ListLongMap!3879)

(declare-fun call!25051 () ListLongMap!3879)

(assert (=> bm!25046 (= call!25052 call!25051)))

(declare-fun b!262215 () Bool)

(declare-fun e!169935 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!262215 (= e!169935 (validKeyInArray!0 (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262216 () Bool)

(declare-fun e!169930 () Unit!8160)

(declare-fun Unit!8171 () Unit!8160)

(assert (=> b!262216 (= e!169930 Unit!8171)))

(declare-fun b!262217 () Bool)

(declare-fun lt!132531 () Unit!8160)

(assert (=> b!262217 (= e!169930 lt!132531)))

(declare-fun lt!132512 () ListLongMap!3879)

(declare-fun getCurrentListMapNoExtraKeys!582 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 32) Int) ListLongMap!3879)

(assert (=> b!262217 (= lt!132512 (getCurrentListMapNoExtraKeys!582 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun lt!132523 () (_ BitVec 64))

(assert (=> b!262217 (= lt!132523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132510 () (_ BitVec 64))

(assert (=> b!262217 (= lt!132510 (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132514 () Unit!8160)

(declare-fun addStillContains!236 (ListLongMap!3879 (_ BitVec 64) V!8507 (_ BitVec 64)) Unit!8160)

(assert (=> b!262217 (= lt!132514 (addStillContains!236 lt!132512 lt!132523 (zeroValue!4668 thiss!1504) lt!132510))))

(assert (=> b!262217 (contains!1902 (+!706 lt!132512 (tuple2!4967 lt!132523 (zeroValue!4668 thiss!1504))) lt!132510)))

(declare-fun lt!132528 () Unit!8160)

(assert (=> b!262217 (= lt!132528 lt!132514)))

(declare-fun lt!132526 () ListLongMap!3879)

(assert (=> b!262217 (= lt!132526 (getCurrentListMapNoExtraKeys!582 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun lt!132513 () (_ BitVec 64))

(assert (=> b!262217 (= lt!132513 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132511 () (_ BitVec 64))

(assert (=> b!262217 (= lt!132511 (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132525 () Unit!8160)

(declare-fun addApplyDifferent!236 (ListLongMap!3879 (_ BitVec 64) V!8507 (_ BitVec 64)) Unit!8160)

(assert (=> b!262217 (= lt!132525 (addApplyDifferent!236 lt!132526 lt!132513 (minValue!4668 thiss!1504) lt!132511))))

(declare-fun apply!260 (ListLongMap!3879 (_ BitVec 64)) V!8507)

(assert (=> b!262217 (= (apply!260 (+!706 lt!132526 (tuple2!4967 lt!132513 (minValue!4668 thiss!1504))) lt!132511) (apply!260 lt!132526 lt!132511))))

(declare-fun lt!132522 () Unit!8160)

(assert (=> b!262217 (= lt!132522 lt!132525)))

(declare-fun lt!132518 () ListLongMap!3879)

(assert (=> b!262217 (= lt!132518 (getCurrentListMapNoExtraKeys!582 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun lt!132515 () (_ BitVec 64))

(assert (=> b!262217 (= lt!132515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132530 () (_ BitVec 64))

(assert (=> b!262217 (= lt!132530 (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132517 () Unit!8160)

(assert (=> b!262217 (= lt!132517 (addApplyDifferent!236 lt!132518 lt!132515 (zeroValue!4668 thiss!1504) lt!132530))))

(assert (=> b!262217 (= (apply!260 (+!706 lt!132518 (tuple2!4967 lt!132515 (zeroValue!4668 thiss!1504))) lt!132530) (apply!260 lt!132518 lt!132530))))

(declare-fun lt!132524 () Unit!8160)

(assert (=> b!262217 (= lt!132524 lt!132517)))

(declare-fun lt!132527 () ListLongMap!3879)

(assert (=> b!262217 (= lt!132527 (getCurrentListMapNoExtraKeys!582 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun lt!132519 () (_ BitVec 64))

(assert (=> b!262217 (= lt!132519 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132529 () (_ BitVec 64))

(assert (=> b!262217 (= lt!132529 (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262217 (= lt!132531 (addApplyDifferent!236 lt!132527 lt!132519 (minValue!4668 thiss!1504) lt!132529))))

(assert (=> b!262217 (= (apply!260 (+!706 lt!132527 (tuple2!4967 lt!132519 (minValue!4668 thiss!1504))) lt!132529) (apply!260 lt!132527 lt!132529))))

(declare-fun bm!25047 () Bool)

(declare-fun call!25050 () ListLongMap!3879)

(assert (=> bm!25047 (= call!25051 call!25050)))

(declare-fun bm!25048 () Bool)

(declare-fun call!25049 () Bool)

(declare-fun lt!132516 () ListLongMap!3879)

(assert (=> bm!25048 (= call!25049 (contains!1902 lt!132516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262218 () Bool)

(declare-fun e!169926 () Bool)

(assert (=> b!262218 (= e!169926 (validKeyInArray!0 (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262220 () Bool)

(declare-fun e!169925 () Bool)

(assert (=> b!262220 (= e!169925 (= (apply!260 lt!132516 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4668 thiss!1504)))))

(declare-fun b!262221 () Bool)

(declare-fun e!169923 () ListLongMap!3879)

(assert (=> b!262221 (= e!169923 call!25052)))

(declare-fun b!262222 () Bool)

(declare-fun e!169929 () ListLongMap!3879)

(declare-fun call!25055 () ListLongMap!3879)

(assert (=> b!262222 (= e!169929 (+!706 call!25055 (tuple2!4967 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4668 thiss!1504))))))

(declare-fun c!44681 () Bool)

(declare-fun bm!25049 () Bool)

(declare-fun c!44679 () Bool)

(assert (=> bm!25049 (= call!25055 (+!706 (ite c!44681 call!25050 (ite c!44679 call!25051 call!25052)) (ite (or c!44681 c!44679) (tuple2!4967 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4668 thiss!1504)) (tuple2!4967 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4668 thiss!1504)))))))

(declare-fun b!262223 () Bool)

(declare-fun e!169931 () Bool)

(assert (=> b!262223 (= e!169931 (not call!25049))))

(declare-fun b!262224 () Bool)

(declare-fun e!169924 () Bool)

(assert (=> b!262224 (= e!169924 e!169925)))

(declare-fun res!128076 () Bool)

(declare-fun call!25053 () Bool)

(assert (=> b!262224 (= res!128076 call!25053)))

(assert (=> b!262224 (=> (not res!128076) (not e!169925))))

(declare-fun b!262225 () Bool)

(declare-fun e!169933 () ListLongMap!3879)

(assert (=> b!262225 (= e!169929 e!169933)))

(assert (=> b!262225 (= c!44679 (and (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25050 () Bool)

(assert (=> bm!25050 (= call!25050 (getCurrentListMapNoExtraKeys!582 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun bm!25051 () Bool)

(declare-fun call!25054 () ListLongMap!3879)

(assert (=> bm!25051 (= call!25054 call!25055)))

(declare-fun d!62975 () Bool)

(declare-fun e!169932 () Bool)

(assert (=> d!62975 e!169932))

(declare-fun res!128074 () Bool)

(assert (=> d!62975 (=> (not res!128074) (not e!169932))))

(assert (=> d!62975 (= res!128074 (or (bvsge #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))))))))

(declare-fun lt!132520 () ListLongMap!3879)

(assert (=> d!62975 (= lt!132516 lt!132520)))

(declare-fun lt!132521 () Unit!8160)

(assert (=> d!62975 (= lt!132521 e!169930)))

(declare-fun c!44682 () Bool)

(assert (=> d!62975 (= c!44682 e!169935)))

(declare-fun res!128070 () Bool)

(assert (=> d!62975 (=> (not res!128070) (not e!169935))))

(assert (=> d!62975 (= res!128070 (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))))))

(assert (=> d!62975 (= lt!132520 e!169929)))

(assert (=> d!62975 (= c!44681 (and (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62975 (validMask!0 (mask!11179 thiss!1504))))

(assert (=> d!62975 (= (getCurrentListMap!1483 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)) lt!132516)))

(declare-fun b!262219 () Bool)

(assert (=> b!262219 (= e!169932 e!169924)))

(declare-fun c!44680 () Bool)

(assert (=> b!262219 (= c!44680 (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262226 () Bool)

(assert (=> b!262226 (= e!169923 call!25054)))

(declare-fun b!262227 () Bool)

(declare-fun e!169934 () Bool)

(assert (=> b!262227 (= e!169931 e!169934)))

(declare-fun res!128072 () Bool)

(assert (=> b!262227 (= res!128072 call!25049)))

(assert (=> b!262227 (=> (not res!128072) (not e!169934))))

(declare-fun b!262228 () Bool)

(assert (=> b!262228 (= e!169933 call!25054)))

(declare-fun b!262229 () Bool)

(declare-fun c!44683 () Bool)

(assert (=> b!262229 (= c!44683 (and (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262229 (= e!169933 e!169923)))

(declare-fun b!262230 () Bool)

(declare-fun e!169927 () Bool)

(declare-fun e!169928 () Bool)

(assert (=> b!262230 (= e!169927 e!169928)))

(declare-fun res!128069 () Bool)

(assert (=> b!262230 (=> (not res!128069) (not e!169928))))

(assert (=> b!262230 (= res!128069 (contains!1902 lt!132516 (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!262230 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))))))

(declare-fun b!262231 () Bool)

(declare-fun res!128075 () Bool)

(assert (=> b!262231 (=> (not res!128075) (not e!169932))))

(assert (=> b!262231 (= res!128075 e!169931)))

(declare-fun c!44684 () Bool)

(assert (=> b!262231 (= c!44684 (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262232 () Bool)

(declare-fun res!128077 () Bool)

(assert (=> b!262232 (=> (not res!128077) (not e!169932))))

(assert (=> b!262232 (= res!128077 e!169927)))

(declare-fun res!128071 () Bool)

(assert (=> b!262232 (=> res!128071 e!169927)))

(assert (=> b!262232 (= res!128071 (not e!169926))))

(declare-fun res!128073 () Bool)

(assert (=> b!262232 (=> (not res!128073) (not e!169926))))

(assert (=> b!262232 (= res!128073 (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))))))

(declare-fun b!262233 () Bool)

(assert (=> b!262233 (= e!169934 (= (apply!260 lt!132516 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4668 thiss!1504)))))

(declare-fun b!262234 () Bool)

(assert (=> b!262234 (= e!169924 (not call!25053))))

(declare-fun bm!25052 () Bool)

(assert (=> bm!25052 (= call!25053 (contains!1902 lt!132516 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262235 () Bool)

(declare-fun get!3087 (ValueCell!2979 V!8507) V!8507)

(declare-fun dynLambda!603 (Int (_ BitVec 64)) V!8507)

(assert (=> b!262235 (= e!169928 (= (apply!260 lt!132516 (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000)) (get!3087 (select (arr!5986 (_values!4810 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!603 (defaultEntry!4827 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262235 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6337 (_values!4810 thiss!1504))))))

(assert (=> b!262235 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))))))

(assert (= (and d!62975 c!44681) b!262222))

(assert (= (and d!62975 (not c!44681)) b!262225))

(assert (= (and b!262225 c!44679) b!262228))

(assert (= (and b!262225 (not c!44679)) b!262229))

(assert (= (and b!262229 c!44683) b!262226))

(assert (= (and b!262229 (not c!44683)) b!262221))

(assert (= (or b!262226 b!262221) bm!25046))

(assert (= (or b!262228 bm!25046) bm!25047))

(assert (= (or b!262228 b!262226) bm!25051))

(assert (= (or b!262222 bm!25047) bm!25050))

(assert (= (or b!262222 bm!25051) bm!25049))

(assert (= (and d!62975 res!128070) b!262215))

(assert (= (and d!62975 c!44682) b!262217))

(assert (= (and d!62975 (not c!44682)) b!262216))

(assert (= (and d!62975 res!128074) b!262232))

(assert (= (and b!262232 res!128073) b!262218))

(assert (= (and b!262232 (not res!128071)) b!262230))

(assert (= (and b!262230 res!128069) b!262235))

(assert (= (and b!262232 res!128077) b!262231))

(assert (= (and b!262231 c!44684) b!262227))

(assert (= (and b!262231 (not c!44684)) b!262223))

(assert (= (and b!262227 res!128072) b!262233))

(assert (= (or b!262227 b!262223) bm!25048))

(assert (= (and b!262231 res!128075) b!262219))

(assert (= (and b!262219 c!44680) b!262224))

(assert (= (and b!262219 (not c!44680)) b!262234))

(assert (= (and b!262224 res!128076) b!262220))

(assert (= (or b!262224 b!262234) bm!25052))

(declare-fun b_lambda!8315 () Bool)

(assert (=> (not b_lambda!8315) (not b!262235)))

(declare-fun t!8920 () Bool)

(declare-fun tb!3033 () Bool)

(assert (=> (and b!262035 (= (defaultEntry!4827 thiss!1504) (defaultEntry!4827 thiss!1504)) t!8920) tb!3033))

(declare-fun result!5421 () Bool)

(assert (=> tb!3033 (= result!5421 tp_is_empty!6645)))

(assert (=> b!262235 t!8920))

(declare-fun b_and!13921 () Bool)

(assert (= b_and!13917 (and (=> t!8920 result!5421) b_and!13921)))

(declare-fun m!278285 () Bool)

(assert (=> b!262235 m!278285))

(declare-fun m!278287 () Bool)

(assert (=> b!262235 m!278287))

(declare-fun m!278289 () Bool)

(assert (=> b!262235 m!278289))

(assert (=> b!262235 m!278289))

(assert (=> b!262235 m!278285))

(declare-fun m!278291 () Bool)

(assert (=> b!262235 m!278291))

(assert (=> b!262235 m!278287))

(declare-fun m!278293 () Bool)

(assert (=> b!262235 m!278293))

(declare-fun m!278295 () Bool)

(assert (=> b!262217 m!278295))

(declare-fun m!278297 () Bool)

(assert (=> b!262217 m!278297))

(declare-fun m!278299 () Bool)

(assert (=> b!262217 m!278299))

(declare-fun m!278301 () Bool)

(assert (=> b!262217 m!278301))

(declare-fun m!278303 () Bool)

(assert (=> b!262217 m!278303))

(declare-fun m!278305 () Bool)

(assert (=> b!262217 m!278305))

(declare-fun m!278307 () Bool)

(assert (=> b!262217 m!278307))

(declare-fun m!278309 () Bool)

(assert (=> b!262217 m!278309))

(declare-fun m!278311 () Bool)

(assert (=> b!262217 m!278311))

(declare-fun m!278313 () Bool)

(assert (=> b!262217 m!278313))

(assert (=> b!262217 m!278299))

(declare-fun m!278315 () Bool)

(assert (=> b!262217 m!278315))

(declare-fun m!278317 () Bool)

(assert (=> b!262217 m!278317))

(declare-fun m!278319 () Bool)

(assert (=> b!262217 m!278319))

(assert (=> b!262217 m!278287))

(assert (=> b!262217 m!278313))

(declare-fun m!278321 () Bool)

(assert (=> b!262217 m!278321))

(declare-fun m!278323 () Bool)

(assert (=> b!262217 m!278323))

(assert (=> b!262217 m!278315))

(declare-fun m!278325 () Bool)

(assert (=> b!262217 m!278325))

(assert (=> b!262217 m!278309))

(declare-fun m!278327 () Bool)

(assert (=> bm!25052 m!278327))

(assert (=> b!262215 m!278287))

(assert (=> b!262215 m!278287))

(declare-fun m!278329 () Bool)

(assert (=> b!262215 m!278329))

(declare-fun m!278331 () Bool)

(assert (=> b!262222 m!278331))

(declare-fun m!278333 () Bool)

(assert (=> bm!25048 m!278333))

(declare-fun m!278335 () Bool)

(assert (=> b!262220 m!278335))

(assert (=> bm!25050 m!278323))

(assert (=> d!62975 m!278145))

(assert (=> b!262218 m!278287))

(assert (=> b!262218 m!278287))

(assert (=> b!262218 m!278329))

(declare-fun m!278337 () Bool)

(assert (=> b!262233 m!278337))

(declare-fun m!278339 () Bool)

(assert (=> bm!25049 m!278339))

(assert (=> b!262230 m!278287))

(assert (=> b!262230 m!278287))

(declare-fun m!278341 () Bool)

(assert (=> b!262230 m!278341))

(assert (=> b!262039 d!62975))

(declare-fun d!62977 () Bool)

(declare-fun res!128082 () Bool)

(declare-fun e!169940 () Bool)

(assert (=> d!62977 (=> res!128082 e!169940)))

(assert (=> d!62977 (= res!128082 (= (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62977 (= (arrayContainsKey!0 (_keys!7015 thiss!1504) key!932 #b00000000000000000000000000000000) e!169940)))

(declare-fun b!262242 () Bool)

(declare-fun e!169941 () Bool)

(assert (=> b!262242 (= e!169940 e!169941)))

(declare-fun res!128083 () Bool)

(assert (=> b!262242 (=> (not res!128083) (not e!169941))))

(assert (=> b!262242 (= res!128083 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6338 (_keys!7015 thiss!1504))))))

(declare-fun b!262243 () Bool)

(assert (=> b!262243 (= e!169941 (arrayContainsKey!0 (_keys!7015 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62977 (not res!128082)) b!262242))

(assert (= (and b!262242 res!128083) b!262243))

(assert (=> d!62977 m!278287))

(declare-fun m!278343 () Bool)

(assert (=> b!262243 m!278343))

(assert (=> bm!25018 d!62977))

(declare-fun d!62979 () Bool)

(assert (=> d!62979 (= (array_inv!3957 (_keys!7015 thiss!1504)) (bvsge (size!6338 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262035 d!62979))

(declare-fun d!62981 () Bool)

(assert (=> d!62981 (= (array_inv!3958 (_values!4810 thiss!1504)) (bvsge (size!6337 (_values!4810 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262035 d!62981))

(declare-fun b!262252 () Bool)

(declare-fun e!169949 () Bool)

(declare-fun e!169948 () Bool)

(assert (=> b!262252 (= e!169949 e!169948)))

(declare-fun lt!132540 () (_ BitVec 64))

(assert (=> b!262252 (= lt!132540 (select (arr!5987 lt!132386) #b00000000000000000000000000000000))))

(declare-fun lt!132539 () Unit!8160)

(assert (=> b!262252 (= lt!132539 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132386 lt!132540 #b00000000000000000000000000000000))))

(assert (=> b!262252 (arrayContainsKey!0 lt!132386 lt!132540 #b00000000000000000000000000000000)))

(declare-fun lt!132538 () Unit!8160)

(assert (=> b!262252 (= lt!132538 lt!132539)))

(declare-fun res!128088 () Bool)

(assert (=> b!262252 (= res!128088 (= (seekEntryOrOpen!0 (select (arr!5987 lt!132386) #b00000000000000000000000000000000) lt!132386 (mask!11179 thiss!1504)) (Found!1194 #b00000000000000000000000000000000)))))

(assert (=> b!262252 (=> (not res!128088) (not e!169948))))

(declare-fun d!62983 () Bool)

(declare-fun res!128089 () Bool)

(declare-fun e!169950 () Bool)

(assert (=> d!62983 (=> res!128089 e!169950)))

(assert (=> d!62983 (= res!128089 (bvsge #b00000000000000000000000000000000 (size!6338 lt!132386)))))

(assert (=> d!62983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132386 (mask!11179 thiss!1504)) e!169950)))

(declare-fun b!262253 () Bool)

(assert (=> b!262253 (= e!169950 e!169949)))

(declare-fun c!44687 () Bool)

(assert (=> b!262253 (= c!44687 (validKeyInArray!0 (select (arr!5987 lt!132386) #b00000000000000000000000000000000)))))

(declare-fun b!262254 () Bool)

(declare-fun call!25058 () Bool)

(assert (=> b!262254 (= e!169949 call!25058)))

(declare-fun b!262255 () Bool)

(assert (=> b!262255 (= e!169948 call!25058)))

(declare-fun bm!25055 () Bool)

(assert (=> bm!25055 (= call!25058 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!132386 (mask!11179 thiss!1504)))))

(assert (= (and d!62983 (not res!128089)) b!262253))

(assert (= (and b!262253 c!44687) b!262252))

(assert (= (and b!262253 (not c!44687)) b!262254))

(assert (= (and b!262252 res!128088) b!262255))

(assert (= (or b!262255 b!262254) bm!25055))

(declare-fun m!278345 () Bool)

(assert (=> b!262252 m!278345))

(declare-fun m!278347 () Bool)

(assert (=> b!262252 m!278347))

(declare-fun m!278349 () Bool)

(assert (=> b!262252 m!278349))

(assert (=> b!262252 m!278345))

(declare-fun m!278351 () Bool)

(assert (=> b!262252 m!278351))

(assert (=> b!262253 m!278345))

(assert (=> b!262253 m!278345))

(declare-fun m!278353 () Bool)

(assert (=> b!262253 m!278353))

(declare-fun m!278355 () Bool)

(assert (=> bm!25055 m!278355))

(assert (=> b!262042 d!62983))

(declare-fun b!262266 () Bool)

(declare-fun e!169956 () Bool)

(assert (=> b!262266 (= e!169956 (bvslt (size!6338 (_keys!7015 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!62985 () Bool)

(declare-fun e!169955 () Bool)

(assert (=> d!62985 e!169955))

(declare-fun res!128099 () Bool)

(assert (=> d!62985 (=> (not res!128099) (not e!169955))))

(assert (=> d!62985 (= res!128099 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7015 thiss!1504)))))))

(declare-fun lt!132543 () Unit!8160)

(declare-fun choose!1 (array!12649 (_ BitVec 32) (_ BitVec 64)) Unit!8160)

(assert (=> d!62985 (= lt!132543 (choose!1 (_keys!7015 thiss!1504) index!297 key!932))))

(assert (=> d!62985 e!169956))

(declare-fun res!128100 () Bool)

(assert (=> d!62985 (=> (not res!128100) (not e!169956))))

(assert (=> d!62985 (= res!128100 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7015 thiss!1504)))))))

(assert (=> d!62985 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7015 thiss!1504) index!297 key!932) lt!132543)))

(declare-fun b!262264 () Bool)

(declare-fun res!128098 () Bool)

(assert (=> b!262264 (=> (not res!128098) (not e!169956))))

(assert (=> b!262264 (= res!128098 (not (validKeyInArray!0 (select (arr!5987 (_keys!7015 thiss!1504)) index!297))))))

(declare-fun b!262267 () Bool)

(assert (=> b!262267 (= e!169955 (= (arrayCountValidKeys!0 (array!12650 (store (arr!5987 (_keys!7015 thiss!1504)) index!297 key!932) (size!6338 (_keys!7015 thiss!1504))) #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7015 thiss!1504) #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!262265 () Bool)

(declare-fun res!128101 () Bool)

(assert (=> b!262265 (=> (not res!128101) (not e!169956))))

(assert (=> b!262265 (= res!128101 (validKeyInArray!0 key!932))))

(assert (= (and d!62985 res!128100) b!262264))

(assert (= (and b!262264 res!128098) b!262265))

(assert (= (and b!262265 res!128101) b!262266))

(assert (= (and d!62985 res!128099) b!262267))

(declare-fun m!278357 () Bool)

(assert (=> d!62985 m!278357))

(declare-fun m!278359 () Bool)

(assert (=> b!262264 m!278359))

(assert (=> b!262264 m!278359))

(declare-fun m!278361 () Bool)

(assert (=> b!262264 m!278361))

(assert (=> b!262267 m!278175))

(declare-fun m!278363 () Bool)

(assert (=> b!262267 m!278363))

(assert (=> b!262267 m!278157))

(declare-fun m!278365 () Bool)

(assert (=> b!262265 m!278365))

(assert (=> b!262042 d!62985))

(declare-fun d!62987 () Bool)

(declare-fun e!169959 () Bool)

(assert (=> d!62987 e!169959))

(declare-fun res!128104 () Bool)

(assert (=> d!62987 (=> (not res!128104) (not e!169959))))

(assert (=> d!62987 (= res!128104 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7015 thiss!1504))) (bvslt index!297 (size!6337 (_values!4810 thiss!1504)))))))

(declare-fun lt!132546 () Unit!8160)

(declare-fun choose!1281 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 32) (_ BitVec 64) V!8507 Int) Unit!8160)

(assert (=> d!62987 (= lt!132546 (choose!1281 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) index!297 key!932 v!346 (defaultEntry!4827 thiss!1504)))))

(assert (=> d!62987 (validMask!0 (mask!11179 thiss!1504))))

(assert (=> d!62987 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!116 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) index!297 key!932 v!346 (defaultEntry!4827 thiss!1504)) lt!132546)))

(declare-fun b!262270 () Bool)

(assert (=> b!262270 (= e!169959 (= (+!706 (getCurrentListMap!1483 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)) (tuple2!4967 key!932 v!346)) (getCurrentListMap!1483 (array!12650 (store (arr!5987 (_keys!7015 thiss!1504)) index!297 key!932) (size!6338 (_keys!7015 thiss!1504))) (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504))) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504))))))

(assert (= (and d!62987 res!128104) b!262270))

(declare-fun m!278367 () Bool)

(assert (=> d!62987 m!278367))

(assert (=> d!62987 m!278145))

(assert (=> b!262270 m!278175))

(assert (=> b!262270 m!278163))

(assert (=> b!262270 m!278137))

(declare-fun m!278369 () Bool)

(assert (=> b!262270 m!278369))

(assert (=> b!262270 m!278137))

(declare-fun m!278371 () Bool)

(assert (=> b!262270 m!278371))

(assert (=> b!262042 d!62987))

(declare-fun d!62989 () Bool)

(assert (=> d!62989 (= (validMask!0 (mask!11179 thiss!1504)) (and (or (= (mask!11179 thiss!1504) #b00000000000000000000000000000111) (= (mask!11179 thiss!1504) #b00000000000000000000000000001111) (= (mask!11179 thiss!1504) #b00000000000000000000000000011111) (= (mask!11179 thiss!1504) #b00000000000000000000000000111111) (= (mask!11179 thiss!1504) #b00000000000000000000000001111111) (= (mask!11179 thiss!1504) #b00000000000000000000000011111111) (= (mask!11179 thiss!1504) #b00000000000000000000000111111111) (= (mask!11179 thiss!1504) #b00000000000000000000001111111111) (= (mask!11179 thiss!1504) #b00000000000000000000011111111111) (= (mask!11179 thiss!1504) #b00000000000000000000111111111111) (= (mask!11179 thiss!1504) #b00000000000000000001111111111111) (= (mask!11179 thiss!1504) #b00000000000000000011111111111111) (= (mask!11179 thiss!1504) #b00000000000000000111111111111111) (= (mask!11179 thiss!1504) #b00000000000000001111111111111111) (= (mask!11179 thiss!1504) #b00000000000000011111111111111111) (= (mask!11179 thiss!1504) #b00000000000000111111111111111111) (= (mask!11179 thiss!1504) #b00000000000001111111111111111111) (= (mask!11179 thiss!1504) #b00000000000011111111111111111111) (= (mask!11179 thiss!1504) #b00000000000111111111111111111111) (= (mask!11179 thiss!1504) #b00000000001111111111111111111111) (= (mask!11179 thiss!1504) #b00000000011111111111111111111111) (= (mask!11179 thiss!1504) #b00000000111111111111111111111111) (= (mask!11179 thiss!1504) #b00000001111111111111111111111111) (= (mask!11179 thiss!1504) #b00000011111111111111111111111111) (= (mask!11179 thiss!1504) #b00000111111111111111111111111111) (= (mask!11179 thiss!1504) #b00001111111111111111111111111111) (= (mask!11179 thiss!1504) #b00011111111111111111111111111111) (= (mask!11179 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11179 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!262042 d!62989))

(declare-fun bm!25056 () Bool)

(declare-fun call!25062 () ListLongMap!3879)

(declare-fun call!25061 () ListLongMap!3879)

(assert (=> bm!25056 (= call!25062 call!25061)))

(declare-fun b!262271 () Bool)

(declare-fun e!169972 () Bool)

(assert (=> b!262271 (= e!169972 (validKeyInArray!0 (select (arr!5987 lt!132386) #b00000000000000000000000000000000)))))

(declare-fun b!262272 () Bool)

(declare-fun e!169967 () Unit!8160)

(declare-fun Unit!8172 () Unit!8160)

(assert (=> b!262272 (= e!169967 Unit!8172)))

(declare-fun b!262273 () Bool)

(declare-fun lt!132568 () Unit!8160)

(assert (=> b!262273 (= e!169967 lt!132568)))

(declare-fun lt!132549 () ListLongMap!3879)

(assert (=> b!262273 (= lt!132549 (getCurrentListMapNoExtraKeys!582 lt!132386 (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504))) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun lt!132560 () (_ BitVec 64))

(assert (=> b!262273 (= lt!132560 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132547 () (_ BitVec 64))

(assert (=> b!262273 (= lt!132547 (select (arr!5987 lt!132386) #b00000000000000000000000000000000))))

(declare-fun lt!132551 () Unit!8160)

(assert (=> b!262273 (= lt!132551 (addStillContains!236 lt!132549 lt!132560 (zeroValue!4668 thiss!1504) lt!132547))))

(assert (=> b!262273 (contains!1902 (+!706 lt!132549 (tuple2!4967 lt!132560 (zeroValue!4668 thiss!1504))) lt!132547)))

(declare-fun lt!132565 () Unit!8160)

(assert (=> b!262273 (= lt!132565 lt!132551)))

(declare-fun lt!132563 () ListLongMap!3879)

(assert (=> b!262273 (= lt!132563 (getCurrentListMapNoExtraKeys!582 lt!132386 (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504))) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun lt!132550 () (_ BitVec 64))

(assert (=> b!262273 (= lt!132550 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132548 () (_ BitVec 64))

(assert (=> b!262273 (= lt!132548 (select (arr!5987 lt!132386) #b00000000000000000000000000000000))))

(declare-fun lt!132562 () Unit!8160)

(assert (=> b!262273 (= lt!132562 (addApplyDifferent!236 lt!132563 lt!132550 (minValue!4668 thiss!1504) lt!132548))))

(assert (=> b!262273 (= (apply!260 (+!706 lt!132563 (tuple2!4967 lt!132550 (minValue!4668 thiss!1504))) lt!132548) (apply!260 lt!132563 lt!132548))))

(declare-fun lt!132559 () Unit!8160)

(assert (=> b!262273 (= lt!132559 lt!132562)))

(declare-fun lt!132555 () ListLongMap!3879)

(assert (=> b!262273 (= lt!132555 (getCurrentListMapNoExtraKeys!582 lt!132386 (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504))) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun lt!132552 () (_ BitVec 64))

(assert (=> b!262273 (= lt!132552 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132567 () (_ BitVec 64))

(assert (=> b!262273 (= lt!132567 (select (arr!5987 lt!132386) #b00000000000000000000000000000000))))

(declare-fun lt!132554 () Unit!8160)

(assert (=> b!262273 (= lt!132554 (addApplyDifferent!236 lt!132555 lt!132552 (zeroValue!4668 thiss!1504) lt!132567))))

(assert (=> b!262273 (= (apply!260 (+!706 lt!132555 (tuple2!4967 lt!132552 (zeroValue!4668 thiss!1504))) lt!132567) (apply!260 lt!132555 lt!132567))))

(declare-fun lt!132561 () Unit!8160)

(assert (=> b!262273 (= lt!132561 lt!132554)))

(declare-fun lt!132564 () ListLongMap!3879)

(assert (=> b!262273 (= lt!132564 (getCurrentListMapNoExtraKeys!582 lt!132386 (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504))) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun lt!132556 () (_ BitVec 64))

(assert (=> b!262273 (= lt!132556 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132566 () (_ BitVec 64))

(assert (=> b!262273 (= lt!132566 (select (arr!5987 lt!132386) #b00000000000000000000000000000000))))

(assert (=> b!262273 (= lt!132568 (addApplyDifferent!236 lt!132564 lt!132556 (minValue!4668 thiss!1504) lt!132566))))

(assert (=> b!262273 (= (apply!260 (+!706 lt!132564 (tuple2!4967 lt!132556 (minValue!4668 thiss!1504))) lt!132566) (apply!260 lt!132564 lt!132566))))

(declare-fun bm!25057 () Bool)

(declare-fun call!25060 () ListLongMap!3879)

(assert (=> bm!25057 (= call!25061 call!25060)))

(declare-fun bm!25058 () Bool)

(declare-fun call!25059 () Bool)

(declare-fun lt!132553 () ListLongMap!3879)

(assert (=> bm!25058 (= call!25059 (contains!1902 lt!132553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262274 () Bool)

(declare-fun e!169963 () Bool)

(assert (=> b!262274 (= e!169963 (validKeyInArray!0 (select (arr!5987 lt!132386) #b00000000000000000000000000000000)))))

(declare-fun b!262276 () Bool)

(declare-fun e!169962 () Bool)

(assert (=> b!262276 (= e!169962 (= (apply!260 lt!132553 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4668 thiss!1504)))))

(declare-fun b!262277 () Bool)

(declare-fun e!169960 () ListLongMap!3879)

(assert (=> b!262277 (= e!169960 call!25062)))

(declare-fun b!262278 () Bool)

(declare-fun e!169966 () ListLongMap!3879)

(declare-fun call!25065 () ListLongMap!3879)

(assert (=> b!262278 (= e!169966 (+!706 call!25065 (tuple2!4967 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4668 thiss!1504))))))

(declare-fun c!44690 () Bool)

(declare-fun c!44688 () Bool)

(declare-fun bm!25059 () Bool)

(assert (=> bm!25059 (= call!25065 (+!706 (ite c!44690 call!25060 (ite c!44688 call!25061 call!25062)) (ite (or c!44690 c!44688) (tuple2!4967 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4668 thiss!1504)) (tuple2!4967 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4668 thiss!1504)))))))

(declare-fun b!262279 () Bool)

(declare-fun e!169968 () Bool)

(assert (=> b!262279 (= e!169968 (not call!25059))))

(declare-fun b!262280 () Bool)

(declare-fun e!169961 () Bool)

(assert (=> b!262280 (= e!169961 e!169962)))

(declare-fun res!128112 () Bool)

(declare-fun call!25063 () Bool)

(assert (=> b!262280 (= res!128112 call!25063)))

(assert (=> b!262280 (=> (not res!128112) (not e!169962))))

(declare-fun b!262281 () Bool)

(declare-fun e!169970 () ListLongMap!3879)

(assert (=> b!262281 (= e!169966 e!169970)))

(assert (=> b!262281 (= c!44688 (and (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25060 () Bool)

(assert (=> bm!25060 (= call!25060 (getCurrentListMapNoExtraKeys!582 lt!132386 (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504))) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(declare-fun bm!25061 () Bool)

(declare-fun call!25064 () ListLongMap!3879)

(assert (=> bm!25061 (= call!25064 call!25065)))

(declare-fun d!62991 () Bool)

(declare-fun e!169969 () Bool)

(assert (=> d!62991 e!169969))

(declare-fun res!128110 () Bool)

(assert (=> d!62991 (=> (not res!128110) (not e!169969))))

(assert (=> d!62991 (= res!128110 (or (bvsge #b00000000000000000000000000000000 (size!6338 lt!132386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 lt!132386)))))))

(declare-fun lt!132557 () ListLongMap!3879)

(assert (=> d!62991 (= lt!132553 lt!132557)))

(declare-fun lt!132558 () Unit!8160)

(assert (=> d!62991 (= lt!132558 e!169967)))

(declare-fun c!44691 () Bool)

(assert (=> d!62991 (= c!44691 e!169972)))

(declare-fun res!128106 () Bool)

(assert (=> d!62991 (=> (not res!128106) (not e!169972))))

(assert (=> d!62991 (= res!128106 (bvslt #b00000000000000000000000000000000 (size!6338 lt!132386)))))

(assert (=> d!62991 (= lt!132557 e!169966)))

(assert (=> d!62991 (= c!44690 (and (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62991 (validMask!0 (mask!11179 thiss!1504))))

(assert (=> d!62991 (= (getCurrentListMap!1483 lt!132386 (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504))) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)) lt!132553)))

(declare-fun b!262275 () Bool)

(assert (=> b!262275 (= e!169969 e!169961)))

(declare-fun c!44689 () Bool)

(assert (=> b!262275 (= c!44689 (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262282 () Bool)

(assert (=> b!262282 (= e!169960 call!25064)))

(declare-fun b!262283 () Bool)

(declare-fun e!169971 () Bool)

(assert (=> b!262283 (= e!169968 e!169971)))

(declare-fun res!128108 () Bool)

(assert (=> b!262283 (= res!128108 call!25059)))

(assert (=> b!262283 (=> (not res!128108) (not e!169971))))

(declare-fun b!262284 () Bool)

(assert (=> b!262284 (= e!169970 call!25064)))

(declare-fun b!262285 () Bool)

(declare-fun c!44692 () Bool)

(assert (=> b!262285 (= c!44692 (and (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262285 (= e!169970 e!169960)))

(declare-fun b!262286 () Bool)

(declare-fun e!169964 () Bool)

(declare-fun e!169965 () Bool)

(assert (=> b!262286 (= e!169964 e!169965)))

(declare-fun res!128105 () Bool)

(assert (=> b!262286 (=> (not res!128105) (not e!169965))))

(assert (=> b!262286 (= res!128105 (contains!1902 lt!132553 (select (arr!5987 lt!132386) #b00000000000000000000000000000000)))))

(assert (=> b!262286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 lt!132386)))))

(declare-fun b!262287 () Bool)

(declare-fun res!128111 () Bool)

(assert (=> b!262287 (=> (not res!128111) (not e!169969))))

(assert (=> b!262287 (= res!128111 e!169968)))

(declare-fun c!44693 () Bool)

(assert (=> b!262287 (= c!44693 (not (= (bvand (extraKeys!4564 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262288 () Bool)

(declare-fun res!128113 () Bool)

(assert (=> b!262288 (=> (not res!128113) (not e!169969))))

(assert (=> b!262288 (= res!128113 e!169964)))

(declare-fun res!128107 () Bool)

(assert (=> b!262288 (=> res!128107 e!169964)))

(assert (=> b!262288 (= res!128107 (not e!169963))))

(declare-fun res!128109 () Bool)

(assert (=> b!262288 (=> (not res!128109) (not e!169963))))

(assert (=> b!262288 (= res!128109 (bvslt #b00000000000000000000000000000000 (size!6338 lt!132386)))))

(declare-fun b!262289 () Bool)

(assert (=> b!262289 (= e!169971 (= (apply!260 lt!132553 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4668 thiss!1504)))))

(declare-fun b!262290 () Bool)

(assert (=> b!262290 (= e!169961 (not call!25063))))

(declare-fun bm!25062 () Bool)

(assert (=> bm!25062 (= call!25063 (contains!1902 lt!132553 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262291 () Bool)

(assert (=> b!262291 (= e!169965 (= (apply!260 lt!132553 (select (arr!5987 lt!132386) #b00000000000000000000000000000000)) (get!3087 (select (arr!5986 (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!603 (defaultEntry!4827 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262291 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6337 (array!12648 (store (arr!5986 (_values!4810 thiss!1504)) index!297 (ValueCellFull!2979 v!346)) (size!6337 (_values!4810 thiss!1504))))))))

(assert (=> b!262291 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 lt!132386)))))

(assert (= (and d!62991 c!44690) b!262278))

(assert (= (and d!62991 (not c!44690)) b!262281))

(assert (= (and b!262281 c!44688) b!262284))

(assert (= (and b!262281 (not c!44688)) b!262285))

(assert (= (and b!262285 c!44692) b!262282))

(assert (= (and b!262285 (not c!44692)) b!262277))

(assert (= (or b!262282 b!262277) bm!25056))

(assert (= (or b!262284 bm!25056) bm!25057))

(assert (= (or b!262284 b!262282) bm!25061))

(assert (= (or b!262278 bm!25057) bm!25060))

(assert (= (or b!262278 bm!25061) bm!25059))

(assert (= (and d!62991 res!128106) b!262271))

(assert (= (and d!62991 c!44691) b!262273))

(assert (= (and d!62991 (not c!44691)) b!262272))

(assert (= (and d!62991 res!128110) b!262288))

(assert (= (and b!262288 res!128109) b!262274))

(assert (= (and b!262288 (not res!128107)) b!262286))

(assert (= (and b!262286 res!128105) b!262291))

(assert (= (and b!262288 res!128113) b!262287))

(assert (= (and b!262287 c!44693) b!262283))

(assert (= (and b!262287 (not c!44693)) b!262279))

(assert (= (and b!262283 res!128108) b!262289))

(assert (= (or b!262283 b!262279) bm!25058))

(assert (= (and b!262287 res!128111) b!262275))

(assert (= (and b!262275 c!44689) b!262280))

(assert (= (and b!262275 (not c!44689)) b!262290))

(assert (= (and b!262280 res!128112) b!262276))

(assert (= (or b!262280 b!262290) bm!25062))

(declare-fun b_lambda!8317 () Bool)

(assert (=> (not b_lambda!8317) (not b!262291)))

(assert (=> b!262291 t!8920))

(declare-fun b_and!13923 () Bool)

(assert (= b_and!13921 (and (=> t!8920 result!5421) b_and!13923)))

(assert (=> b!262291 m!278285))

(assert (=> b!262291 m!278345))

(declare-fun m!278373 () Bool)

(assert (=> b!262291 m!278373))

(assert (=> b!262291 m!278373))

(assert (=> b!262291 m!278285))

(declare-fun m!278375 () Bool)

(assert (=> b!262291 m!278375))

(assert (=> b!262291 m!278345))

(declare-fun m!278377 () Bool)

(assert (=> b!262291 m!278377))

(declare-fun m!278379 () Bool)

(assert (=> b!262273 m!278379))

(declare-fun m!278381 () Bool)

(assert (=> b!262273 m!278381))

(declare-fun m!278383 () Bool)

(assert (=> b!262273 m!278383))

(declare-fun m!278385 () Bool)

(assert (=> b!262273 m!278385))

(declare-fun m!278387 () Bool)

(assert (=> b!262273 m!278387))

(declare-fun m!278389 () Bool)

(assert (=> b!262273 m!278389))

(declare-fun m!278391 () Bool)

(assert (=> b!262273 m!278391))

(declare-fun m!278393 () Bool)

(assert (=> b!262273 m!278393))

(declare-fun m!278395 () Bool)

(assert (=> b!262273 m!278395))

(declare-fun m!278397 () Bool)

(assert (=> b!262273 m!278397))

(assert (=> b!262273 m!278383))

(declare-fun m!278399 () Bool)

(assert (=> b!262273 m!278399))

(declare-fun m!278401 () Bool)

(assert (=> b!262273 m!278401))

(declare-fun m!278403 () Bool)

(assert (=> b!262273 m!278403))

(assert (=> b!262273 m!278345))

(assert (=> b!262273 m!278397))

(declare-fun m!278405 () Bool)

(assert (=> b!262273 m!278405))

(declare-fun m!278407 () Bool)

(assert (=> b!262273 m!278407))

(assert (=> b!262273 m!278399))

(declare-fun m!278409 () Bool)

(assert (=> b!262273 m!278409))

(assert (=> b!262273 m!278393))

(declare-fun m!278411 () Bool)

(assert (=> bm!25062 m!278411))

(assert (=> b!262271 m!278345))

(assert (=> b!262271 m!278345))

(assert (=> b!262271 m!278353))

(declare-fun m!278413 () Bool)

(assert (=> b!262278 m!278413))

(declare-fun m!278415 () Bool)

(assert (=> bm!25058 m!278415))

(declare-fun m!278417 () Bool)

(assert (=> b!262276 m!278417))

(assert (=> bm!25060 m!278407))

(assert (=> d!62991 m!278145))

(assert (=> b!262274 m!278345))

(assert (=> b!262274 m!278345))

(assert (=> b!262274 m!278353))

(declare-fun m!278419 () Bool)

(assert (=> b!262289 m!278419))

(declare-fun m!278421 () Bool)

(assert (=> bm!25059 m!278421))

(assert (=> b!262286 m!278345))

(assert (=> b!262286 m!278345))

(declare-fun m!278423 () Bool)

(assert (=> b!262286 m!278423))

(assert (=> b!262042 d!62991))

(declare-fun b!262301 () Bool)

(declare-fun e!169977 () (_ BitVec 32))

(declare-fun call!25068 () (_ BitVec 32))

(assert (=> b!262301 (= e!169977 (bvadd #b00000000000000000000000000000001 call!25068))))

(declare-fun b!262302 () Bool)

(declare-fun e!169978 () (_ BitVec 32))

(assert (=> b!262302 (= e!169978 #b00000000000000000000000000000000)))

(declare-fun d!62993 () Bool)

(declare-fun lt!132571 () (_ BitVec 32))

(assert (=> d!62993 (and (bvsge lt!132571 #b00000000000000000000000000000000) (bvsle lt!132571 (bvsub (size!6338 lt!132386) index!297)))))

(assert (=> d!62993 (= lt!132571 e!169978)))

(declare-fun c!44699 () Bool)

(assert (=> d!62993 (= c!44699 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62993 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6338 lt!132386)))))

(assert (=> d!62993 (= (arrayCountValidKeys!0 lt!132386 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!132571)))

(declare-fun b!262300 () Bool)

(assert (=> b!262300 (= e!169978 e!169977)))

(declare-fun c!44698 () Bool)

(assert (=> b!262300 (= c!44698 (validKeyInArray!0 (select (arr!5987 lt!132386) index!297)))))

(declare-fun bm!25065 () Bool)

(assert (=> bm!25065 (= call!25068 (arrayCountValidKeys!0 lt!132386 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!262303 () Bool)

(assert (=> b!262303 (= e!169977 call!25068)))

(assert (= (and d!62993 c!44699) b!262302))

(assert (= (and d!62993 (not c!44699)) b!262300))

(assert (= (and b!262300 c!44698) b!262301))

(assert (= (and b!262300 (not c!44698)) b!262303))

(assert (= (or b!262301 b!262303) bm!25065))

(declare-fun m!278425 () Bool)

(assert (=> b!262300 m!278425))

(assert (=> b!262300 m!278425))

(declare-fun m!278427 () Bool)

(assert (=> b!262300 m!278427))

(declare-fun m!278429 () Bool)

(assert (=> bm!25065 m!278429))

(assert (=> b!262042 d!62993))

(declare-fun d!62995 () Bool)

(assert (=> d!62995 (= (arrayCountValidKeys!0 lt!132386 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!132574 () Unit!8160)

(declare-fun choose!2 (array!12649 (_ BitVec 32)) Unit!8160)

(assert (=> d!62995 (= lt!132574 (choose!2 lt!132386 index!297))))

(declare-fun e!169981 () Bool)

(assert (=> d!62995 e!169981))

(declare-fun res!128118 () Bool)

(assert (=> d!62995 (=> (not res!128118) (not e!169981))))

(assert (=> d!62995 (= res!128118 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 lt!132386))))))

(assert (=> d!62995 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132386 index!297) lt!132574)))

(declare-fun b!262308 () Bool)

(declare-fun res!128119 () Bool)

(assert (=> b!262308 (=> (not res!128119) (not e!169981))))

(assert (=> b!262308 (= res!128119 (validKeyInArray!0 (select (arr!5987 lt!132386) index!297)))))

(declare-fun b!262309 () Bool)

(assert (=> b!262309 (= e!169981 (bvslt (size!6338 lt!132386) #b01111111111111111111111111111111))))

(assert (= (and d!62995 res!128118) b!262308))

(assert (= (and b!262308 res!128119) b!262309))

(declare-fun m!278431 () Bool)

(assert (=> d!62995 m!278431))

(declare-fun m!278433 () Bool)

(assert (=> d!62995 m!278433))

(assert (=> b!262308 m!278425))

(assert (=> b!262308 m!278425))

(assert (=> b!262308 m!278427))

(assert (=> b!262042 d!62995))

(declare-fun d!62997 () Bool)

(assert (=> d!62997 (arrayContainsKey!0 lt!132386 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132577 () Unit!8160)

(declare-fun choose!13 (array!12649 (_ BitVec 64) (_ BitVec 32)) Unit!8160)

(assert (=> d!62997 (= lt!132577 (choose!13 lt!132386 key!932 index!297))))

(assert (=> d!62997 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62997 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132386 key!932 index!297) lt!132577)))

(declare-fun bs!9237 () Bool)

(assert (= bs!9237 d!62997))

(assert (=> bs!9237 m!278159))

(declare-fun m!278435 () Bool)

(assert (=> bs!9237 m!278435))

(assert (=> b!262042 d!62997))

(declare-fun d!62999 () Bool)

(declare-fun e!169984 () Bool)

(assert (=> d!62999 e!169984))

(declare-fun res!128122 () Bool)

(assert (=> d!62999 (=> (not res!128122) (not e!169984))))

(assert (=> d!62999 (= res!128122 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7015 thiss!1504)))))))

(declare-fun lt!132580 () Unit!8160)

(declare-fun choose!41 (array!12649 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3843) Unit!8160)

(assert (=> d!62999 (= lt!132580 (choose!41 (_keys!7015 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3840))))

(assert (=> d!62999 (bvslt (size!6338 (_keys!7015 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62999 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7015 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3840) lt!132580)))

(declare-fun b!262312 () Bool)

(assert (=> b!262312 (= e!169984 (arrayNoDuplicates!0 (array!12650 (store (arr!5987 (_keys!7015 thiss!1504)) index!297 key!932) (size!6338 (_keys!7015 thiss!1504))) #b00000000000000000000000000000000 Nil!3840))))

(assert (= (and d!62999 res!128122) b!262312))

(declare-fun m!278437 () Bool)

(assert (=> d!62999 m!278437))

(assert (=> b!262312 m!278175))

(declare-fun m!278439 () Bool)

(assert (=> b!262312 m!278439))

(assert (=> b!262042 d!62999))

(assert (=> b!262042 d!62977))

(declare-fun b!262314 () Bool)

(declare-fun e!169985 () (_ BitVec 32))

(declare-fun call!25069 () (_ BitVec 32))

(assert (=> b!262314 (= e!169985 (bvadd #b00000000000000000000000000000001 call!25069))))

(declare-fun b!262315 () Bool)

(declare-fun e!169986 () (_ BitVec 32))

(assert (=> b!262315 (= e!169986 #b00000000000000000000000000000000)))

(declare-fun d!63001 () Bool)

(declare-fun lt!132581 () (_ BitVec 32))

(assert (=> d!63001 (and (bvsge lt!132581 #b00000000000000000000000000000000) (bvsle lt!132581 (bvsub (size!6338 lt!132386) #b00000000000000000000000000000000)))))

(assert (=> d!63001 (= lt!132581 e!169986)))

(declare-fun c!44701 () Bool)

(assert (=> d!63001 (= c!44701 (bvsge #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))))))

(assert (=> d!63001 (and (bvsle #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6338 (_keys!7015 thiss!1504)) (size!6338 lt!132386)))))

(assert (=> d!63001 (= (arrayCountValidKeys!0 lt!132386 #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))) lt!132581)))

(declare-fun b!262313 () Bool)

(assert (=> b!262313 (= e!169986 e!169985)))

(declare-fun c!44700 () Bool)

(assert (=> b!262313 (= c!44700 (validKeyInArray!0 (select (arr!5987 lt!132386) #b00000000000000000000000000000000)))))

(declare-fun bm!25066 () Bool)

(assert (=> bm!25066 (= call!25069 (arrayCountValidKeys!0 lt!132386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6338 (_keys!7015 thiss!1504))))))

(declare-fun b!262316 () Bool)

(assert (=> b!262316 (= e!169985 call!25069)))

(assert (= (and d!63001 c!44701) b!262315))

(assert (= (and d!63001 (not c!44701)) b!262313))

(assert (= (and b!262313 c!44700) b!262314))

(assert (= (and b!262313 (not c!44700)) b!262316))

(assert (= (or b!262314 b!262316) bm!25066))

(assert (=> b!262313 m!278345))

(assert (=> b!262313 m!278345))

(assert (=> b!262313 m!278353))

(declare-fun m!278441 () Bool)

(assert (=> bm!25066 m!278441))

(assert (=> b!262042 d!63001))

(declare-fun d!63003 () Bool)

(declare-fun e!169989 () Bool)

(assert (=> d!63003 e!169989))

(declare-fun res!128125 () Bool)

(assert (=> d!63003 (=> (not res!128125) (not e!169989))))

(assert (=> d!63003 (= res!128125 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7015 thiss!1504)))))))

(declare-fun lt!132584 () Unit!8160)

(declare-fun choose!102 ((_ BitVec 64) array!12649 (_ BitVec 32) (_ BitVec 32)) Unit!8160)

(assert (=> d!63003 (= lt!132584 (choose!102 key!932 (_keys!7015 thiss!1504) index!297 (mask!11179 thiss!1504)))))

(assert (=> d!63003 (validMask!0 (mask!11179 thiss!1504))))

(assert (=> d!63003 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7015 thiss!1504) index!297 (mask!11179 thiss!1504)) lt!132584)))

(declare-fun b!262319 () Bool)

(assert (=> b!262319 (= e!169989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12650 (store (arr!5987 (_keys!7015 thiss!1504)) index!297 key!932) (size!6338 (_keys!7015 thiss!1504))) (mask!11179 thiss!1504)))))

(assert (= (and d!63003 res!128125) b!262319))

(declare-fun m!278443 () Bool)

(assert (=> d!63003 m!278443))

(assert (=> d!63003 m!278145))

(assert (=> b!262319 m!278175))

(declare-fun m!278445 () Bool)

(assert (=> b!262319 m!278445))

(assert (=> b!262042 d!63003))

(declare-fun b!262321 () Bool)

(declare-fun e!169990 () (_ BitVec 32))

(declare-fun call!25070 () (_ BitVec 32))

(assert (=> b!262321 (= e!169990 (bvadd #b00000000000000000000000000000001 call!25070))))

(declare-fun b!262322 () Bool)

(declare-fun e!169991 () (_ BitVec 32))

(assert (=> b!262322 (= e!169991 #b00000000000000000000000000000000)))

(declare-fun d!63005 () Bool)

(declare-fun lt!132585 () (_ BitVec 32))

(assert (=> d!63005 (and (bvsge lt!132585 #b00000000000000000000000000000000) (bvsle lt!132585 (bvsub (size!6338 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63005 (= lt!132585 e!169991)))

(declare-fun c!44703 () Bool)

(assert (=> d!63005 (= c!44703 (bvsge #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))))))

(assert (=> d!63005 (and (bvsle #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6338 (_keys!7015 thiss!1504)) (size!6338 (_keys!7015 thiss!1504))))))

(assert (=> d!63005 (= (arrayCountValidKeys!0 (_keys!7015 thiss!1504) #b00000000000000000000000000000000 (size!6338 (_keys!7015 thiss!1504))) lt!132585)))

(declare-fun b!262320 () Bool)

(assert (=> b!262320 (= e!169991 e!169990)))

(declare-fun c!44702 () Bool)

(assert (=> b!262320 (= c!44702 (validKeyInArray!0 (select (arr!5987 (_keys!7015 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!25067 () Bool)

(assert (=> bm!25067 (= call!25070 (arrayCountValidKeys!0 (_keys!7015 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6338 (_keys!7015 thiss!1504))))))

(declare-fun b!262323 () Bool)

(assert (=> b!262323 (= e!169990 call!25070)))

(assert (= (and d!63005 c!44703) b!262322))

(assert (= (and d!63005 (not c!44703)) b!262320))

(assert (= (and b!262320 c!44702) b!262321))

(assert (= (and b!262320 (not c!44702)) b!262323))

(assert (= (or b!262321 b!262323) bm!25067))

(assert (=> b!262320 m!278287))

(assert (=> b!262320 m!278287))

(assert (=> b!262320 m!278329))

(declare-fun m!278447 () Bool)

(assert (=> bm!25067 m!278447))

(assert (=> b!262042 d!63005))

(declare-fun d!63007 () Bool)

(declare-fun res!128126 () Bool)

(declare-fun e!169992 () Bool)

(assert (=> d!63007 (=> res!128126 e!169992)))

(assert (=> d!63007 (= res!128126 (= (select (arr!5987 lt!132386) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63007 (= (arrayContainsKey!0 lt!132386 key!932 #b00000000000000000000000000000000) e!169992)))

(declare-fun b!262324 () Bool)

(declare-fun e!169993 () Bool)

(assert (=> b!262324 (= e!169992 e!169993)))

(declare-fun res!128127 () Bool)

(assert (=> b!262324 (=> (not res!128127) (not e!169993))))

(assert (=> b!262324 (= res!128127 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6338 lt!132386)))))

(declare-fun b!262325 () Bool)

(assert (=> b!262325 (= e!169993 (arrayContainsKey!0 lt!132386 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63007 (not res!128126)) b!262324))

(assert (= (and b!262324 res!128127) b!262325))

(assert (=> d!63007 m!278345))

(declare-fun m!278449 () Bool)

(assert (=> b!262325 m!278449))

(assert (=> b!262042 d!63007))

(declare-fun d!63009 () Bool)

(declare-fun res!128134 () Bool)

(declare-fun e!170005 () Bool)

(assert (=> d!63009 (=> res!128134 e!170005)))

(assert (=> d!63009 (= res!128134 (bvsge #b00000000000000000000000000000000 (size!6338 lt!132386)))))

(assert (=> d!63009 (= (arrayNoDuplicates!0 lt!132386 #b00000000000000000000000000000000 Nil!3840) e!170005)))

(declare-fun b!262336 () Bool)

(declare-fun e!170003 () Bool)

(declare-fun contains!1904 (List!3843 (_ BitVec 64)) Bool)

(assert (=> b!262336 (= e!170003 (contains!1904 Nil!3840 (select (arr!5987 lt!132386) #b00000000000000000000000000000000)))))

(declare-fun b!262337 () Bool)

(declare-fun e!170002 () Bool)

(assert (=> b!262337 (= e!170005 e!170002)))

(declare-fun res!128136 () Bool)

(assert (=> b!262337 (=> (not res!128136) (not e!170002))))

(assert (=> b!262337 (= res!128136 (not e!170003))))

(declare-fun res!128135 () Bool)

(assert (=> b!262337 (=> (not res!128135) (not e!170003))))

(assert (=> b!262337 (= res!128135 (validKeyInArray!0 (select (arr!5987 lt!132386) #b00000000000000000000000000000000)))))

(declare-fun b!262338 () Bool)

(declare-fun e!170004 () Bool)

(assert (=> b!262338 (= e!170002 e!170004)))

(declare-fun c!44706 () Bool)

(assert (=> b!262338 (= c!44706 (validKeyInArray!0 (select (arr!5987 lt!132386) #b00000000000000000000000000000000)))))

(declare-fun b!262339 () Bool)

(declare-fun call!25073 () Bool)

(assert (=> b!262339 (= e!170004 call!25073)))

(declare-fun bm!25070 () Bool)

(assert (=> bm!25070 (= call!25073 (arrayNoDuplicates!0 lt!132386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44706 (Cons!3839 (select (arr!5987 lt!132386) #b00000000000000000000000000000000) Nil!3840) Nil!3840)))))

(declare-fun b!262340 () Bool)

(assert (=> b!262340 (= e!170004 call!25073)))

(assert (= (and d!63009 (not res!128134)) b!262337))

(assert (= (and b!262337 res!128135) b!262336))

(assert (= (and b!262337 res!128136) b!262338))

(assert (= (and b!262338 c!44706) b!262340))

(assert (= (and b!262338 (not c!44706)) b!262339))

(assert (= (or b!262340 b!262339) bm!25070))

(assert (=> b!262336 m!278345))

(assert (=> b!262336 m!278345))

(declare-fun m!278451 () Bool)

(assert (=> b!262336 m!278451))

(assert (=> b!262337 m!278345))

(assert (=> b!262337 m!278345))

(assert (=> b!262337 m!278353))

(assert (=> b!262338 m!278345))

(assert (=> b!262338 m!278345))

(assert (=> b!262338 m!278353))

(assert (=> bm!25070 m!278345))

(declare-fun m!278453 () Bool)

(assert (=> bm!25070 m!278453))

(assert (=> b!262042 d!63009))

(declare-fun d!63011 () Bool)

(declare-fun e!170008 () Bool)

(assert (=> d!63011 e!170008))

(declare-fun res!128142 () Bool)

(assert (=> d!63011 (=> (not res!128142) (not e!170008))))

(declare-fun lt!132596 () ListLongMap!3879)

(assert (=> d!63011 (= res!128142 (contains!1902 lt!132596 (_1!2494 (tuple2!4967 key!932 v!346))))))

(declare-fun lt!132597 () List!3842)

(assert (=> d!63011 (= lt!132596 (ListLongMap!3880 lt!132597))))

(declare-fun lt!132595 () Unit!8160)

(declare-fun lt!132594 () Unit!8160)

(assert (=> d!63011 (= lt!132595 lt!132594)))

(assert (=> d!63011 (= (getValueByKey!318 lt!132597 (_1!2494 (tuple2!4967 key!932 v!346))) (Some!323 (_2!2494 (tuple2!4967 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!174 (List!3842 (_ BitVec 64) V!8507) Unit!8160)

(assert (=> d!63011 (= lt!132594 (lemmaContainsTupThenGetReturnValue!174 lt!132597 (_1!2494 (tuple2!4967 key!932 v!346)) (_2!2494 (tuple2!4967 key!932 v!346))))))

(declare-fun insertStrictlySorted!177 (List!3842 (_ BitVec 64) V!8507) List!3842)

(assert (=> d!63011 (= lt!132597 (insertStrictlySorted!177 (toList!1955 lt!132384) (_1!2494 (tuple2!4967 key!932 v!346)) (_2!2494 (tuple2!4967 key!932 v!346))))))

(assert (=> d!63011 (= (+!706 lt!132384 (tuple2!4967 key!932 v!346)) lt!132596)))

(declare-fun b!262345 () Bool)

(declare-fun res!128141 () Bool)

(assert (=> b!262345 (=> (not res!128141) (not e!170008))))

(assert (=> b!262345 (= res!128141 (= (getValueByKey!318 (toList!1955 lt!132596) (_1!2494 (tuple2!4967 key!932 v!346))) (Some!323 (_2!2494 (tuple2!4967 key!932 v!346)))))))

(declare-fun b!262346 () Bool)

(declare-fun contains!1905 (List!3842 tuple2!4966) Bool)

(assert (=> b!262346 (= e!170008 (contains!1905 (toList!1955 lt!132596) (tuple2!4967 key!932 v!346)))))

(assert (= (and d!63011 res!128142) b!262345))

(assert (= (and b!262345 res!128141) b!262346))

(declare-fun m!278455 () Bool)

(assert (=> d!63011 m!278455))

(declare-fun m!278457 () Bool)

(assert (=> d!63011 m!278457))

(declare-fun m!278459 () Bool)

(assert (=> d!63011 m!278459))

(declare-fun m!278461 () Bool)

(assert (=> d!63011 m!278461))

(declare-fun m!278463 () Bool)

(assert (=> b!262345 m!278463))

(declare-fun m!278465 () Bool)

(assert (=> b!262346 m!278465))

(assert (=> b!262042 d!63011))

(declare-fun d!63013 () Bool)

(declare-fun e!170011 () Bool)

(assert (=> d!63013 e!170011))

(declare-fun res!128148 () Bool)

(assert (=> d!63013 (=> (not res!128148) (not e!170011))))

(declare-fun lt!132602 () SeekEntryResult!1194)

(assert (=> d!63013 (= res!128148 ((_ is Found!1194) lt!132602))))

(assert (=> d!63013 (= lt!132602 (seekEntryOrOpen!0 key!932 (_keys!7015 thiss!1504) (mask!11179 thiss!1504)))))

(declare-fun lt!132603 () Unit!8160)

(declare-fun choose!1282 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 64) Int) Unit!8160)

(assert (=> d!63013 (= lt!132603 (choose!1282 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) key!932 (defaultEntry!4827 thiss!1504)))))

(assert (=> d!63013 (validMask!0 (mask!11179 thiss!1504))))

(assert (=> d!63013 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!451 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) key!932 (defaultEntry!4827 thiss!1504)) lt!132603)))

(declare-fun b!262351 () Bool)

(declare-fun res!128147 () Bool)

(assert (=> b!262351 (=> (not res!128147) (not e!170011))))

(assert (=> b!262351 (= res!128147 (inRange!0 (index!6947 lt!132602) (mask!11179 thiss!1504)))))

(declare-fun b!262352 () Bool)

(assert (=> b!262352 (= e!170011 (= (select (arr!5987 (_keys!7015 thiss!1504)) (index!6947 lt!132602)) key!932))))

(assert (=> b!262352 (and (bvsge (index!6947 lt!132602) #b00000000000000000000000000000000) (bvslt (index!6947 lt!132602) (size!6338 (_keys!7015 thiss!1504))))))

(assert (= (and d!63013 res!128148) b!262351))

(assert (= (and b!262351 res!128147) b!262352))

(assert (=> d!63013 m!278127))

(declare-fun m!278467 () Bool)

(assert (=> d!63013 m!278467))

(assert (=> d!63013 m!278145))

(declare-fun m!278469 () Bool)

(assert (=> b!262351 m!278469))

(declare-fun m!278471 () Bool)

(assert (=> b!262352 m!278471))

(assert (=> b!262029 d!63013))

(declare-fun d!63015 () Bool)

(assert (=> d!63015 (contains!1902 (getCurrentListMap!1483 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)) key!932)))

(declare-fun lt!132606 () Unit!8160)

(declare-fun choose!1283 (array!12649 array!12647 (_ BitVec 32) (_ BitVec 32) V!8507 V!8507 (_ BitVec 64) (_ BitVec 32) Int) Unit!8160)

(assert (=> d!63015 (= lt!132606 (choose!1283 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)))))

(assert (=> d!63015 (validMask!0 (mask!11179 thiss!1504))))

(assert (=> d!63015 (= (lemmaArrayContainsKeyThenInListMap!258 (_keys!7015 thiss!1504) (_values!4810 thiss!1504) (mask!11179 thiss!1504) (extraKeys!4564 thiss!1504) (zeroValue!4668 thiss!1504) (minValue!4668 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4827 thiss!1504)) lt!132606)))

(declare-fun bs!9238 () Bool)

(assert (= bs!9238 d!63015))

(assert (=> bs!9238 m!278137))

(assert (=> bs!9238 m!278137))

(declare-fun m!278473 () Bool)

(assert (=> bs!9238 m!278473))

(declare-fun m!278475 () Bool)

(assert (=> bs!9238 m!278475))

(assert (=> bs!9238 m!278145))

(assert (=> b!262046 d!63015))

(declare-fun condMapEmpty!11332 () Bool)

(declare-fun mapDefault!11332 () ValueCell!2979)

(assert (=> mapNonEmpty!11326 (= condMapEmpty!11332 (= mapRest!11326 ((as const (Array (_ BitVec 32) ValueCell!2979)) mapDefault!11332)))))

(declare-fun e!170016 () Bool)

(declare-fun mapRes!11332 () Bool)

(assert (=> mapNonEmpty!11326 (= tp!23679 (and e!170016 mapRes!11332))))

(declare-fun b!262359 () Bool)

(declare-fun e!170017 () Bool)

(assert (=> b!262359 (= e!170017 tp_is_empty!6645)))

(declare-fun mapIsEmpty!11332 () Bool)

(assert (=> mapIsEmpty!11332 mapRes!11332))

(declare-fun b!262360 () Bool)

(assert (=> b!262360 (= e!170016 tp_is_empty!6645)))

(declare-fun mapNonEmpty!11332 () Bool)

(declare-fun tp!23689 () Bool)

(assert (=> mapNonEmpty!11332 (= mapRes!11332 (and tp!23689 e!170017))))

(declare-fun mapRest!11332 () (Array (_ BitVec 32) ValueCell!2979))

(declare-fun mapValue!11332 () ValueCell!2979)

(declare-fun mapKey!11332 () (_ BitVec 32))

(assert (=> mapNonEmpty!11332 (= mapRest!11326 (store mapRest!11332 mapKey!11332 mapValue!11332))))

(assert (= (and mapNonEmpty!11326 condMapEmpty!11332) mapIsEmpty!11332))

(assert (= (and mapNonEmpty!11326 (not condMapEmpty!11332)) mapNonEmpty!11332))

(assert (= (and mapNonEmpty!11332 ((_ is ValueCellFull!2979) mapValue!11332)) b!262359))

(assert (= (and mapNonEmpty!11326 ((_ is ValueCellFull!2979) mapDefault!11332)) b!262360))

(declare-fun m!278477 () Bool)

(assert (=> mapNonEmpty!11332 m!278477))

(declare-fun b_lambda!8319 () Bool)

(assert (= b_lambda!8317 (or (and b!262035 b_free!6783) b_lambda!8319)))

(declare-fun b_lambda!8321 () Bool)

(assert (= b_lambda!8315 (or (and b!262035 b_free!6783) b_lambda!8321)))

(check-sat (not bm!25050) (not b!262235) (not b!262265) (not bm!25058) (not b!262217) (not b!262300) (not b!262170) (not b!262320) (not bm!25049) (not b_next!6783) (not b!262264) (not b!262278) (not d!63003) (not b!262336) (not d!62999) (not bm!25030) (not b!262220) tp_is_empty!6645 (not d!62973) (not bm!25052) (not b_lambda!8319) (not d!62967) (not d!62995) (not d!62975) (not bm!25055) (not bm!25048) (not b!262286) (not d!62963) (not b!262271) (not d!63011) (not d!62991) (not d!62997) (not d!63015) (not bm!25059) (not b!262163) (not b!262337) (not b!262319) (not bm!25067) (not b!262346) (not b!262233) (not b!262172) (not b!262252) (not d!62987) (not b!262218) (not b!262312) (not bm!25066) (not d!63013) (not bm!25065) (not b!262325) (not b!262308) (not b!262273) (not bm!25060) (not b!262230) (not b!262253) (not d!62965) (not b!262276) (not b!262215) (not b!262119) (not b!262267) (not bm!25070) (not b!262120) (not bm!25062) (not b!262243) (not b!262345) (not b!262291) (not b!262222) (not bm!25031) (not b!262313) (not b!262270) (not b!262274) (not b!262351) (not mapNonEmpty!11332) (not b!262338) (not b!262121) (not b_lambda!8321) b_and!13923 (not d!62985) (not b!262289))
(check-sat b_and!13923 (not b_next!6783))
