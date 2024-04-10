; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19290 () Bool)

(assert start!19290)

(declare-fun b!189825 () Bool)

(declare-fun b_free!4659 () Bool)

(declare-fun b_next!4659 () Bool)

(assert (=> b!189825 (= b_free!4659 (not b_next!4659))))

(declare-fun tp!16813 () Bool)

(declare-fun b_and!11301 () Bool)

(assert (=> b!189825 (= tp!16813 b_and!11301)))

(declare-fun b!189822 () Bool)

(declare-datatypes ((Unit!5734 0))(
  ( (Unit!5735) )
))
(declare-fun e!124925 () Unit!5734)

(declare-fun Unit!5736 () Unit!5734)

(assert (=> b!189822 (= e!124925 Unit!5736)))

(declare-fun lt!93996 () Unit!5734)

(declare-datatypes ((V!5555 0))(
  ( (V!5556 (val!2260 Int)) )
))
(declare-datatypes ((ValueCell!1872 0))(
  ( (ValueCellFull!1872 (v!4184 V!5555)) (EmptyCell!1872) )
))
(declare-datatypes ((array!8093 0))(
  ( (array!8094 (arr!3815 (Array (_ BitVec 32) (_ BitVec 64))) (size!4135 (_ BitVec 32))) )
))
(declare-datatypes ((array!8095 0))(
  ( (array!8096 (arr!3816 (Array (_ BitVec 32) ValueCell!1872)) (size!4136 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2652 0))(
  ( (LongMapFixedSize!2653 (defaultEntry!3874 Int) (mask!9067 (_ BitVec 32)) (extraKeys!3611 (_ BitVec 32)) (zeroValue!3715 V!5555) (minValue!3715 V!5555) (_size!1375 (_ BitVec 32)) (_keys!5842 array!8093) (_values!3857 array!8095) (_vacant!1375 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2652)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!172 (array!8093 array!8095 (_ BitVec 32) (_ BitVec 32) V!5555 V!5555 (_ BitVec 64) Int) Unit!5734)

(assert (=> b!189822 (= lt!93996 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!172 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) key!828 (defaultEntry!3874 thiss!1248)))))

(assert (=> b!189822 false))

(declare-fun b!189823 () Bool)

(declare-fun e!124931 () Bool)

(declare-fun e!124932 () Bool)

(declare-fun mapRes!7645 () Bool)

(assert (=> b!189823 (= e!124931 (and e!124932 mapRes!7645))))

(declare-fun condMapEmpty!7645 () Bool)

(declare-fun mapDefault!7645 () ValueCell!1872)

(assert (=> b!189823 (= condMapEmpty!7645 (= (arr!3816 (_values!3857 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1872)) mapDefault!7645)))))

(declare-fun b!189824 () Bool)

(declare-fun e!124927 () Bool)

(declare-fun tp_is_empty!4431 () Bool)

(assert (=> b!189824 (= e!124927 tp_is_empty!4431)))

(declare-fun e!124930 () Bool)

(declare-fun array_inv!2471 (array!8093) Bool)

(declare-fun array_inv!2472 (array!8095) Bool)

(assert (=> b!189825 (= e!124930 (and tp!16813 tp_is_empty!4431 (array_inv!2471 (_keys!5842 thiss!1248)) (array_inv!2472 (_values!3857 thiss!1248)) e!124931))))

(declare-fun b!189826 () Bool)

(declare-fun res!89754 () Bool)

(declare-fun e!124933 () Bool)

(assert (=> b!189826 (=> (not res!89754) (not e!124933))))

(assert (=> b!189826 (= res!89754 (not (= key!828 (bvneg key!828))))))

(declare-fun res!89755 () Bool)

(assert (=> start!19290 (=> (not res!89755) (not e!124933))))

(declare-fun valid!1089 (LongMapFixedSize!2652) Bool)

(assert (=> start!19290 (= res!89755 (valid!1089 thiss!1248))))

(assert (=> start!19290 e!124933))

(assert (=> start!19290 e!124930))

(assert (=> start!19290 true))

(assert (=> start!19290 tp_is_empty!4431))

(declare-fun mapNonEmpty!7645 () Bool)

(declare-fun tp!16812 () Bool)

(assert (=> mapNonEmpty!7645 (= mapRes!7645 (and tp!16812 e!124927))))

(declare-fun mapKey!7645 () (_ BitVec 32))

(declare-fun mapRest!7645 () (Array (_ BitVec 32) ValueCell!1872))

(declare-fun mapValue!7645 () ValueCell!1872)

(assert (=> mapNonEmpty!7645 (= (arr!3816 (_values!3857 thiss!1248)) (store mapRest!7645 mapKey!7645 mapValue!7645))))

(declare-fun b!189827 () Bool)

(declare-fun e!124926 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189827 (= e!124926 (not (validMask!0 (mask!9067 thiss!1248))))))

(declare-datatypes ((tuple2!3516 0))(
  ( (tuple2!3517 (_1!1769 (_ BitVec 64)) (_2!1769 V!5555)) )
))
(declare-datatypes ((List!2413 0))(
  ( (Nil!2410) (Cons!2409 (h!3046 tuple2!3516) (t!7319 List!2413)) )
))
(declare-datatypes ((ListLongMap!2433 0))(
  ( (ListLongMap!2434 (toList!1232 List!2413)) )
))
(declare-fun lt!93998 () ListLongMap!2433)

(declare-datatypes ((SeekEntryResult!669 0))(
  ( (MissingZero!669 (index!4846 (_ BitVec 32))) (Found!669 (index!4847 (_ BitVec 32))) (Intermediate!669 (undefined!1481 Bool) (index!4848 (_ BitVec 32)) (x!20453 (_ BitVec 32))) (Undefined!669) (MissingVacant!669 (index!4849 (_ BitVec 32))) )
))
(declare-fun lt!93997 () SeekEntryResult!669)

(declare-fun v!309 () V!5555)

(declare-fun +!300 (ListLongMap!2433 tuple2!3516) ListLongMap!2433)

(declare-fun getCurrentListMap!880 (array!8093 array!8095 (_ BitVec 32) (_ BitVec 32) V!5555 V!5555 (_ BitVec 32) Int) ListLongMap!2433)

(assert (=> b!189827 (= (+!300 lt!93998 (tuple2!3517 key!828 v!309)) (getCurrentListMap!880 (_keys!5842 thiss!1248) (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248))) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!93994 () Unit!5734)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!101 (array!8093 array!8095 (_ BitVec 32) (_ BitVec 32) V!5555 V!5555 (_ BitVec 32) (_ BitVec 64) V!5555 Int) Unit!5734)

(assert (=> b!189827 (= lt!93994 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!101 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) (index!4847 lt!93997) key!828 v!309 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!93999 () Unit!5734)

(assert (=> b!189827 (= lt!93999 e!124925)))

(declare-fun c!34103 () Bool)

(declare-fun contains!1340 (ListLongMap!2433 (_ BitVec 64)) Bool)

(assert (=> b!189827 (= c!34103 (contains!1340 lt!93998 key!828))))

(assert (=> b!189827 (= lt!93998 (getCurrentListMap!880 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun b!189828 () Bool)

(declare-fun lt!93995 () Unit!5734)

(assert (=> b!189828 (= e!124925 lt!93995)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!168 (array!8093 array!8095 (_ BitVec 32) (_ BitVec 32) V!5555 V!5555 (_ BitVec 64) Int) Unit!5734)

(assert (=> b!189828 (= lt!93995 (lemmaInListMapThenSeekEntryOrOpenFindsIt!168 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) key!828 (defaultEntry!3874 thiss!1248)))))

(declare-fun res!89752 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189828 (= res!89752 (inRange!0 (index!4847 lt!93997) (mask!9067 thiss!1248)))))

(declare-fun e!124928 () Bool)

(assert (=> b!189828 (=> (not res!89752) (not e!124928))))

(assert (=> b!189828 e!124928))

(declare-fun b!189829 () Bool)

(assert (=> b!189829 (= e!124933 e!124926)))

(declare-fun res!89753 () Bool)

(assert (=> b!189829 (=> (not res!89753) (not e!124926))))

(get-info :version)

(assert (=> b!189829 (= res!89753 (and (not ((_ is Undefined!669) lt!93997)) (not ((_ is MissingVacant!669) lt!93997)) (not ((_ is MissingZero!669) lt!93997)) ((_ is Found!669) lt!93997)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8093 (_ BitVec 32)) SeekEntryResult!669)

(assert (=> b!189829 (= lt!93997 (seekEntryOrOpen!0 key!828 (_keys!5842 thiss!1248) (mask!9067 thiss!1248)))))

(declare-fun mapIsEmpty!7645 () Bool)

(assert (=> mapIsEmpty!7645 mapRes!7645))

(declare-fun b!189830 () Bool)

(assert (=> b!189830 (= e!124928 (= (select (arr!3815 (_keys!5842 thiss!1248)) (index!4847 lt!93997)) key!828))))

(declare-fun b!189831 () Bool)

(assert (=> b!189831 (= e!124932 tp_is_empty!4431)))

(assert (= (and start!19290 res!89755) b!189826))

(assert (= (and b!189826 res!89754) b!189829))

(assert (= (and b!189829 res!89753) b!189827))

(assert (= (and b!189827 c!34103) b!189828))

(assert (= (and b!189827 (not c!34103)) b!189822))

(assert (= (and b!189828 res!89752) b!189830))

(assert (= (and b!189823 condMapEmpty!7645) mapIsEmpty!7645))

(assert (= (and b!189823 (not condMapEmpty!7645)) mapNonEmpty!7645))

(assert (= (and mapNonEmpty!7645 ((_ is ValueCellFull!1872) mapValue!7645)) b!189824))

(assert (= (and b!189823 ((_ is ValueCellFull!1872) mapDefault!7645)) b!189831))

(assert (= b!189825 b!189823))

(assert (= start!19290 b!189825))

(declare-fun m!216139 () Bool)

(assert (=> b!189828 m!216139))

(declare-fun m!216141 () Bool)

(assert (=> b!189828 m!216141))

(declare-fun m!216143 () Bool)

(assert (=> mapNonEmpty!7645 m!216143))

(declare-fun m!216145 () Bool)

(assert (=> start!19290 m!216145))

(declare-fun m!216147 () Bool)

(assert (=> b!189827 m!216147))

(declare-fun m!216149 () Bool)

(assert (=> b!189827 m!216149))

(declare-fun m!216151 () Bool)

(assert (=> b!189827 m!216151))

(declare-fun m!216153 () Bool)

(assert (=> b!189827 m!216153))

(declare-fun m!216155 () Bool)

(assert (=> b!189827 m!216155))

(declare-fun m!216157 () Bool)

(assert (=> b!189827 m!216157))

(declare-fun m!216159 () Bool)

(assert (=> b!189827 m!216159))

(declare-fun m!216161 () Bool)

(assert (=> b!189825 m!216161))

(declare-fun m!216163 () Bool)

(assert (=> b!189825 m!216163))

(declare-fun m!216165 () Bool)

(assert (=> b!189830 m!216165))

(declare-fun m!216167 () Bool)

(assert (=> b!189822 m!216167))

(declare-fun m!216169 () Bool)

(assert (=> b!189829 m!216169))

(check-sat (not b_next!4659) (not start!19290) (not b!189827) tp_is_empty!4431 (not b!189829) (not mapNonEmpty!7645) (not b!189825) (not b!189822) (not b!189828) b_and!11301)
(check-sat b_and!11301 (not b_next!4659))
(get-model)

(declare-fun b!189878 () Bool)

(declare-fun res!89779 () Bool)

(declare-fun e!124971 () Bool)

(assert (=> b!189878 (=> (not res!89779) (not e!124971))))

(declare-fun lt!94023 () SeekEntryResult!669)

(assert (=> b!189878 (= res!89779 (= (select (arr!3815 (_keys!5842 thiss!1248)) (index!4849 lt!94023)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189878 (and (bvsge (index!4849 lt!94023) #b00000000000000000000000000000000) (bvslt (index!4849 lt!94023) (size!4135 (_keys!5842 thiss!1248))))))

(declare-fun b!189879 () Bool)

(declare-fun e!124972 () Bool)

(declare-fun call!19142 () Bool)

(assert (=> b!189879 (= e!124972 (not call!19142))))

(declare-fun bm!19138 () Bool)

(declare-fun arrayContainsKey!0 (array!8093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19138 (= call!19142 (arrayContainsKey!0 (_keys!5842 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!189880 () Bool)

(declare-fun e!124970 () Bool)

(declare-fun e!124969 () Bool)

(assert (=> b!189880 (= e!124970 e!124969)))

(declare-fun c!34111 () Bool)

(assert (=> b!189880 (= c!34111 ((_ is MissingVacant!669) lt!94023))))

(declare-fun d!55743 () Bool)

(assert (=> d!55743 e!124970))

(declare-fun c!34112 () Bool)

(assert (=> d!55743 (= c!34112 ((_ is MissingZero!669) lt!94023))))

(assert (=> d!55743 (= lt!94023 (seekEntryOrOpen!0 key!828 (_keys!5842 thiss!1248) (mask!9067 thiss!1248)))))

(declare-fun lt!94022 () Unit!5734)

(declare-fun choose!1017 (array!8093 array!8095 (_ BitVec 32) (_ BitVec 32) V!5555 V!5555 (_ BitVec 64) Int) Unit!5734)

(assert (=> d!55743 (= lt!94022 (choose!1017 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) key!828 (defaultEntry!3874 thiss!1248)))))

(assert (=> d!55743 (validMask!0 (mask!9067 thiss!1248))))

(assert (=> d!55743 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!172 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) key!828 (defaultEntry!3874 thiss!1248)) lt!94022)))

(declare-fun bm!19139 () Bool)

(declare-fun call!19141 () Bool)

(assert (=> bm!19139 (= call!19141 (inRange!0 (ite c!34112 (index!4846 lt!94023) (index!4849 lt!94023)) (mask!9067 thiss!1248)))))

(declare-fun b!189881 () Bool)

(assert (=> b!189881 (= e!124970 e!124972)))

(declare-fun res!89777 () Bool)

(assert (=> b!189881 (= res!89777 call!19141)))

(assert (=> b!189881 (=> (not res!89777) (not e!124972))))

(declare-fun b!189882 () Bool)

(declare-fun res!89776 () Bool)

(assert (=> b!189882 (=> (not res!89776) (not e!124971))))

(assert (=> b!189882 (= res!89776 call!19141)))

(assert (=> b!189882 (= e!124969 e!124971)))

(declare-fun b!189883 () Bool)

(assert (=> b!189883 (and (bvsge (index!4846 lt!94023) #b00000000000000000000000000000000) (bvslt (index!4846 lt!94023) (size!4135 (_keys!5842 thiss!1248))))))

(declare-fun res!89778 () Bool)

(assert (=> b!189883 (= res!89778 (= (select (arr!3815 (_keys!5842 thiss!1248)) (index!4846 lt!94023)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189883 (=> (not res!89778) (not e!124972))))

(declare-fun b!189884 () Bool)

(assert (=> b!189884 (= e!124971 (not call!19142))))

(declare-fun b!189885 () Bool)

(assert (=> b!189885 (= e!124969 ((_ is Undefined!669) lt!94023))))

(assert (= (and d!55743 c!34112) b!189881))

(assert (= (and d!55743 (not c!34112)) b!189880))

(assert (= (and b!189881 res!89777) b!189883))

(assert (= (and b!189883 res!89778) b!189879))

(assert (= (and b!189880 c!34111) b!189882))

(assert (= (and b!189880 (not c!34111)) b!189885))

(assert (= (and b!189882 res!89776) b!189878))

(assert (= (and b!189878 res!89779) b!189884))

(assert (= (or b!189881 b!189882) bm!19139))

(assert (= (or b!189879 b!189884) bm!19138))

(declare-fun m!216203 () Bool)

(assert (=> bm!19138 m!216203))

(assert (=> d!55743 m!216169))

(declare-fun m!216205 () Bool)

(assert (=> d!55743 m!216205))

(assert (=> d!55743 m!216159))

(declare-fun m!216207 () Bool)

(assert (=> b!189878 m!216207))

(declare-fun m!216209 () Bool)

(assert (=> bm!19139 m!216209))

(declare-fun m!216211 () Bool)

(assert (=> b!189883 m!216211))

(assert (=> b!189822 d!55743))

(declare-fun d!55745 () Bool)

(assert (=> d!55745 (= (validMask!0 (mask!9067 thiss!1248)) (and (or (= (mask!9067 thiss!1248) #b00000000000000000000000000000111) (= (mask!9067 thiss!1248) #b00000000000000000000000000001111) (= (mask!9067 thiss!1248) #b00000000000000000000000000011111) (= (mask!9067 thiss!1248) #b00000000000000000000000000111111) (= (mask!9067 thiss!1248) #b00000000000000000000000001111111) (= (mask!9067 thiss!1248) #b00000000000000000000000011111111) (= (mask!9067 thiss!1248) #b00000000000000000000000111111111) (= (mask!9067 thiss!1248) #b00000000000000000000001111111111) (= (mask!9067 thiss!1248) #b00000000000000000000011111111111) (= (mask!9067 thiss!1248) #b00000000000000000000111111111111) (= (mask!9067 thiss!1248) #b00000000000000000001111111111111) (= (mask!9067 thiss!1248) #b00000000000000000011111111111111) (= (mask!9067 thiss!1248) #b00000000000000000111111111111111) (= (mask!9067 thiss!1248) #b00000000000000001111111111111111) (= (mask!9067 thiss!1248) #b00000000000000011111111111111111) (= (mask!9067 thiss!1248) #b00000000000000111111111111111111) (= (mask!9067 thiss!1248) #b00000000000001111111111111111111) (= (mask!9067 thiss!1248) #b00000000000011111111111111111111) (= (mask!9067 thiss!1248) #b00000000000111111111111111111111) (= (mask!9067 thiss!1248) #b00000000001111111111111111111111) (= (mask!9067 thiss!1248) #b00000000011111111111111111111111) (= (mask!9067 thiss!1248) #b00000000111111111111111111111111) (= (mask!9067 thiss!1248) #b00000001111111111111111111111111) (= (mask!9067 thiss!1248) #b00000011111111111111111111111111) (= (mask!9067 thiss!1248) #b00000111111111111111111111111111) (= (mask!9067 thiss!1248) #b00001111111111111111111111111111) (= (mask!9067 thiss!1248) #b00011111111111111111111111111111) (= (mask!9067 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9067 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!189827 d!55745))

(declare-fun b!189928 () Bool)

(declare-fun e!125006 () Bool)

(declare-fun lt!94076 () ListLongMap!2433)

(declare-fun apply!178 (ListLongMap!2433 (_ BitVec 64)) V!5555)

(assert (=> b!189928 (= e!125006 (= (apply!178 lt!94076 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3715 thiss!1248)))))

(declare-fun b!189929 () Bool)

(declare-fun e!125004 () ListLongMap!2433)

(declare-fun call!19159 () ListLongMap!2433)

(assert (=> b!189929 (= e!125004 (+!300 call!19159 (tuple2!3517 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3715 thiss!1248))))))

(declare-fun bm!19154 () Bool)

(declare-fun call!19163 () ListLongMap!2433)

(declare-fun call!19157 () ListLongMap!2433)

(assert (=> bm!19154 (= call!19163 call!19157)))

(declare-fun b!189930 () Bool)

(declare-fun e!125005 () Bool)

(declare-fun call!19160 () Bool)

(assert (=> b!189930 (= e!125005 (not call!19160))))

(declare-fun b!189931 () Bool)

(declare-fun e!125002 () Bool)

(declare-fun get!2195 (ValueCell!1872 V!5555) V!5555)

(declare-fun dynLambda!521 (Int (_ BitVec 64)) V!5555)

(assert (=> b!189931 (= e!125002 (= (apply!178 lt!94076 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000)) (get!2195 (select (arr!3816 (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!521 (defaultEntry!3874 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248))))))))

(assert (=> b!189931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))

(declare-fun b!189932 () Bool)

(declare-fun e!125011 () ListLongMap!2433)

(declare-fun call!19162 () ListLongMap!2433)

(assert (=> b!189932 (= e!125011 call!19162)))

(declare-fun d!55747 () Bool)

(declare-fun e!125003 () Bool)

(assert (=> d!55747 e!125003))

(declare-fun res!89804 () Bool)

(assert (=> d!55747 (=> (not res!89804) (not e!125003))))

(assert (=> d!55747 (= res!89804 (or (bvsge #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))))

(declare-fun lt!94088 () ListLongMap!2433)

(assert (=> d!55747 (= lt!94076 lt!94088)))

(declare-fun lt!94079 () Unit!5734)

(declare-fun e!125008 () Unit!5734)

(assert (=> d!55747 (= lt!94079 e!125008)))

(declare-fun c!34129 () Bool)

(declare-fun e!125000 () Bool)

(assert (=> d!55747 (= c!34129 e!125000)))

(declare-fun res!89799 () Bool)

(assert (=> d!55747 (=> (not res!89799) (not e!125000))))

(assert (=> d!55747 (= res!89799 (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))

(assert (=> d!55747 (= lt!94088 e!125004)))

(declare-fun c!34130 () Bool)

(assert (=> d!55747 (= c!34130 (and (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55747 (validMask!0 (mask!9067 thiss!1248))))

(assert (=> d!55747 (= (getCurrentListMap!880 (_keys!5842 thiss!1248) (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248))) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)) lt!94076)))

(declare-fun bm!19155 () Bool)

(declare-fun call!19158 () ListLongMap!2433)

(assert (=> bm!19155 (= call!19158 call!19163)))

(declare-fun bm!19156 () Bool)

(assert (=> bm!19156 (= call!19162 call!19159)))

(declare-fun b!189933 () Bool)

(declare-fun e!125010 () Bool)

(assert (=> b!189933 (= e!125010 (= (apply!178 lt!94076 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3715 thiss!1248)))))

(declare-fun b!189934 () Bool)

(declare-fun res!89803 () Bool)

(assert (=> b!189934 (=> (not res!89803) (not e!125003))))

(assert (=> b!189934 (= res!89803 e!125005)))

(declare-fun c!34125 () Bool)

(assert (=> b!189934 (= c!34125 (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19157 () Bool)

(declare-fun call!19161 () Bool)

(assert (=> bm!19157 (= call!19161 (contains!1340 lt!94076 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!34127 () Bool)

(declare-fun bm!19158 () Bool)

(assert (=> bm!19158 (= call!19159 (+!300 (ite c!34130 call!19157 (ite c!34127 call!19163 call!19158)) (ite (or c!34130 c!34127) (tuple2!3517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3715 thiss!1248)) (tuple2!3517 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3715 thiss!1248)))))))

(declare-fun b!189935 () Bool)

(declare-fun Unit!5737 () Unit!5734)

(assert (=> b!189935 (= e!125008 Unit!5737)))

(declare-fun b!189936 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189936 (= e!125000 (validKeyInArray!0 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189937 () Bool)

(declare-fun res!89802 () Bool)

(assert (=> b!189937 (=> (not res!89802) (not e!125003))))

(declare-fun e!125009 () Bool)

(assert (=> b!189937 (= res!89802 e!125009)))

(declare-fun res!89800 () Bool)

(assert (=> b!189937 (=> res!89800 e!125009)))

(declare-fun e!125007 () Bool)

(assert (=> b!189937 (= res!89800 (not e!125007))))

(declare-fun res!89801 () Bool)

(assert (=> b!189937 (=> (not res!89801) (not e!125007))))

(assert (=> b!189937 (= res!89801 (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))

(declare-fun b!189938 () Bool)

(declare-fun e!124999 () ListLongMap!2433)

(assert (=> b!189938 (= e!124999 call!19158)))

(declare-fun b!189939 () Bool)

(assert (=> b!189939 (= e!125005 e!125006)))

(declare-fun res!89806 () Bool)

(assert (=> b!189939 (= res!89806 call!19160)))

(assert (=> b!189939 (=> (not res!89806) (not e!125006))))

(declare-fun b!189940 () Bool)

(declare-fun e!125001 () Bool)

(assert (=> b!189940 (= e!125003 e!125001)))

(declare-fun c!34128 () Bool)

(assert (=> b!189940 (= c!34128 (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189941 () Bool)

(assert (=> b!189941 (= e!125004 e!125011)))

(assert (=> b!189941 (= c!34127 (and (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189942 () Bool)

(assert (=> b!189942 (= e!125009 e!125002)))

(declare-fun res!89805 () Bool)

(assert (=> b!189942 (=> (not res!89805) (not e!125002))))

(assert (=> b!189942 (= res!89805 (contains!1340 lt!94076 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189942 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))

(declare-fun b!189943 () Bool)

(assert (=> b!189943 (= e!125001 (not call!19161))))

(declare-fun b!189944 () Bool)

(declare-fun c!34126 () Bool)

(assert (=> b!189944 (= c!34126 (and (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189944 (= e!125011 e!124999)))

(declare-fun b!189945 () Bool)

(assert (=> b!189945 (= e!125007 (validKeyInArray!0 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189946 () Bool)

(declare-fun lt!94073 () Unit!5734)

(assert (=> b!189946 (= e!125008 lt!94073)))

(declare-fun lt!94080 () ListLongMap!2433)

(declare-fun getCurrentListMapNoExtraKeys!211 (array!8093 array!8095 (_ BitVec 32) (_ BitVec 32) V!5555 V!5555 (_ BitVec 32) Int) ListLongMap!2433)

(assert (=> b!189946 (= lt!94080 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248))) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!94070 () (_ BitVec 64))

(assert (=> b!189946 (= lt!94070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94069 () (_ BitVec 64))

(assert (=> b!189946 (= lt!94069 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94075 () Unit!5734)

(declare-fun addStillContains!154 (ListLongMap!2433 (_ BitVec 64) V!5555 (_ BitVec 64)) Unit!5734)

(assert (=> b!189946 (= lt!94075 (addStillContains!154 lt!94080 lt!94070 (zeroValue!3715 thiss!1248) lt!94069))))

(assert (=> b!189946 (contains!1340 (+!300 lt!94080 (tuple2!3517 lt!94070 (zeroValue!3715 thiss!1248))) lt!94069)))

(declare-fun lt!94082 () Unit!5734)

(assert (=> b!189946 (= lt!94082 lt!94075)))

(declare-fun lt!94071 () ListLongMap!2433)

(assert (=> b!189946 (= lt!94071 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248))) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!94087 () (_ BitVec 64))

(assert (=> b!189946 (= lt!94087 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94072 () (_ BitVec 64))

(assert (=> b!189946 (= lt!94072 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94078 () Unit!5734)

(declare-fun addApplyDifferent!154 (ListLongMap!2433 (_ BitVec 64) V!5555 (_ BitVec 64)) Unit!5734)

(assert (=> b!189946 (= lt!94078 (addApplyDifferent!154 lt!94071 lt!94087 (minValue!3715 thiss!1248) lt!94072))))

(assert (=> b!189946 (= (apply!178 (+!300 lt!94071 (tuple2!3517 lt!94087 (minValue!3715 thiss!1248))) lt!94072) (apply!178 lt!94071 lt!94072))))

(declare-fun lt!94077 () Unit!5734)

(assert (=> b!189946 (= lt!94077 lt!94078)))

(declare-fun lt!94083 () ListLongMap!2433)

(assert (=> b!189946 (= lt!94083 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248))) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!94086 () (_ BitVec 64))

(assert (=> b!189946 (= lt!94086 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94089 () (_ BitVec 64))

(assert (=> b!189946 (= lt!94089 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94085 () Unit!5734)

(assert (=> b!189946 (= lt!94085 (addApplyDifferent!154 lt!94083 lt!94086 (zeroValue!3715 thiss!1248) lt!94089))))

(assert (=> b!189946 (= (apply!178 (+!300 lt!94083 (tuple2!3517 lt!94086 (zeroValue!3715 thiss!1248))) lt!94089) (apply!178 lt!94083 lt!94089))))

(declare-fun lt!94074 () Unit!5734)

(assert (=> b!189946 (= lt!94074 lt!94085)))

(declare-fun lt!94084 () ListLongMap!2433)

(assert (=> b!189946 (= lt!94084 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248))) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!94068 () (_ BitVec 64))

(assert (=> b!189946 (= lt!94068 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94081 () (_ BitVec 64))

(assert (=> b!189946 (= lt!94081 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189946 (= lt!94073 (addApplyDifferent!154 lt!94084 lt!94068 (minValue!3715 thiss!1248) lt!94081))))

(assert (=> b!189946 (= (apply!178 (+!300 lt!94084 (tuple2!3517 lt!94068 (minValue!3715 thiss!1248))) lt!94081) (apply!178 lt!94084 lt!94081))))

(declare-fun b!189947 () Bool)

(assert (=> b!189947 (= e!125001 e!125010)))

(declare-fun res!89798 () Bool)

(assert (=> b!189947 (= res!89798 call!19161)))

(assert (=> b!189947 (=> (not res!89798) (not e!125010))))

(declare-fun b!189948 () Bool)

(assert (=> b!189948 (= e!124999 call!19162)))

(declare-fun bm!19159 () Bool)

(assert (=> bm!19159 (= call!19160 (contains!1340 lt!94076 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19160 () Bool)

(assert (=> bm!19160 (= call!19157 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248))) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(assert (= (and d!55747 c!34130) b!189929))

(assert (= (and d!55747 (not c!34130)) b!189941))

(assert (= (and b!189941 c!34127) b!189932))

(assert (= (and b!189941 (not c!34127)) b!189944))

(assert (= (and b!189944 c!34126) b!189948))

(assert (= (and b!189944 (not c!34126)) b!189938))

(assert (= (or b!189948 b!189938) bm!19155))

(assert (= (or b!189932 bm!19155) bm!19154))

(assert (= (or b!189932 b!189948) bm!19156))

(assert (= (or b!189929 bm!19154) bm!19160))

(assert (= (or b!189929 bm!19156) bm!19158))

(assert (= (and d!55747 res!89799) b!189936))

(assert (= (and d!55747 c!34129) b!189946))

(assert (= (and d!55747 (not c!34129)) b!189935))

(assert (= (and d!55747 res!89804) b!189937))

(assert (= (and b!189937 res!89801) b!189945))

(assert (= (and b!189937 (not res!89800)) b!189942))

(assert (= (and b!189942 res!89805) b!189931))

(assert (= (and b!189937 res!89802) b!189934))

(assert (= (and b!189934 c!34125) b!189939))

(assert (= (and b!189934 (not c!34125)) b!189930))

(assert (= (and b!189939 res!89806) b!189928))

(assert (= (or b!189939 b!189930) bm!19159))

(assert (= (and b!189934 res!89803) b!189940))

(assert (= (and b!189940 c!34128) b!189947))

(assert (= (and b!189940 (not c!34128)) b!189943))

(assert (= (and b!189947 res!89798) b!189933))

(assert (= (or b!189947 b!189943) bm!19157))

(declare-fun b_lambda!7335 () Bool)

(assert (=> (not b_lambda!7335) (not b!189931)))

(declare-fun t!7321 () Bool)

(declare-fun tb!2867 () Bool)

(assert (=> (and b!189825 (= (defaultEntry!3874 thiss!1248) (defaultEntry!3874 thiss!1248)) t!7321) tb!2867))

(declare-fun result!4879 () Bool)

(assert (=> tb!2867 (= result!4879 tp_is_empty!4431)))

(assert (=> b!189931 t!7321))

(declare-fun b_and!11305 () Bool)

(assert (= b_and!11301 (and (=> t!7321 result!4879) b_and!11305)))

(assert (=> d!55747 m!216159))

(declare-fun m!216213 () Bool)

(assert (=> b!189928 m!216213))

(declare-fun m!216215 () Bool)

(assert (=> bm!19159 m!216215))

(declare-fun m!216217 () Bool)

(assert (=> bm!19158 m!216217))

(declare-fun m!216219 () Bool)

(assert (=> bm!19157 m!216219))

(declare-fun m!216221 () Bool)

(assert (=> b!189931 m!216221))

(declare-fun m!216223 () Bool)

(assert (=> b!189931 m!216223))

(declare-fun m!216225 () Bool)

(assert (=> b!189931 m!216225))

(assert (=> b!189931 m!216225))

(declare-fun m!216227 () Bool)

(assert (=> b!189931 m!216227))

(assert (=> b!189931 m!216221))

(assert (=> b!189931 m!216223))

(declare-fun m!216229 () Bool)

(assert (=> b!189931 m!216229))

(declare-fun m!216231 () Bool)

(assert (=> bm!19160 m!216231))

(assert (=> b!189942 m!216225))

(assert (=> b!189942 m!216225))

(declare-fun m!216233 () Bool)

(assert (=> b!189942 m!216233))

(assert (=> b!189945 m!216225))

(assert (=> b!189945 m!216225))

(declare-fun m!216235 () Bool)

(assert (=> b!189945 m!216235))

(declare-fun m!216237 () Bool)

(assert (=> b!189946 m!216237))

(declare-fun m!216239 () Bool)

(assert (=> b!189946 m!216239))

(declare-fun m!216241 () Bool)

(assert (=> b!189946 m!216241))

(assert (=> b!189946 m!216231))

(declare-fun m!216243 () Bool)

(assert (=> b!189946 m!216243))

(declare-fun m!216245 () Bool)

(assert (=> b!189946 m!216245))

(declare-fun m!216247 () Bool)

(assert (=> b!189946 m!216247))

(declare-fun m!216249 () Bool)

(assert (=> b!189946 m!216249))

(declare-fun m!216251 () Bool)

(assert (=> b!189946 m!216251))

(declare-fun m!216253 () Bool)

(assert (=> b!189946 m!216253))

(declare-fun m!216255 () Bool)

(assert (=> b!189946 m!216255))

(assert (=> b!189946 m!216237))

(declare-fun m!216257 () Bool)

(assert (=> b!189946 m!216257))

(declare-fun m!216259 () Bool)

(assert (=> b!189946 m!216259))

(assert (=> b!189946 m!216225))

(assert (=> b!189946 m!216243))

(declare-fun m!216261 () Bool)

(assert (=> b!189946 m!216261))

(declare-fun m!216263 () Bool)

(assert (=> b!189946 m!216263))

(assert (=> b!189946 m!216255))

(declare-fun m!216265 () Bool)

(assert (=> b!189946 m!216265))

(assert (=> b!189946 m!216251))

(declare-fun m!216267 () Bool)

(assert (=> b!189933 m!216267))

(assert (=> b!189936 m!216225))

(assert (=> b!189936 m!216225))

(assert (=> b!189936 m!216235))

(declare-fun m!216269 () Bool)

(assert (=> b!189929 m!216269))

(assert (=> b!189827 d!55747))

(declare-fun d!55749 () Bool)

(declare-fun e!125017 () Bool)

(assert (=> d!55749 e!125017))

(declare-fun res!89809 () Bool)

(assert (=> d!55749 (=> res!89809 e!125017)))

(declare-fun lt!94099 () Bool)

(assert (=> d!55749 (= res!89809 (not lt!94099))))

(declare-fun lt!94101 () Bool)

(assert (=> d!55749 (= lt!94099 lt!94101)))

(declare-fun lt!94098 () Unit!5734)

(declare-fun e!125016 () Unit!5734)

(assert (=> d!55749 (= lt!94098 e!125016)))

(declare-fun c!34133 () Bool)

(assert (=> d!55749 (= c!34133 lt!94101)))

(declare-fun containsKey!239 (List!2413 (_ BitVec 64)) Bool)

(assert (=> d!55749 (= lt!94101 (containsKey!239 (toList!1232 lt!93998) key!828))))

(assert (=> d!55749 (= (contains!1340 lt!93998 key!828) lt!94099)))

(declare-fun b!189957 () Bool)

(declare-fun lt!94100 () Unit!5734)

(assert (=> b!189957 (= e!125016 lt!94100)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!187 (List!2413 (_ BitVec 64)) Unit!5734)

(assert (=> b!189957 (= lt!94100 (lemmaContainsKeyImpliesGetValueByKeyDefined!187 (toList!1232 lt!93998) key!828))))

(declare-datatypes ((Option!241 0))(
  ( (Some!240 (v!4188 V!5555)) (None!239) )
))
(declare-fun isDefined!188 (Option!241) Bool)

(declare-fun getValueByKey!235 (List!2413 (_ BitVec 64)) Option!241)

(assert (=> b!189957 (isDefined!188 (getValueByKey!235 (toList!1232 lt!93998) key!828))))

(declare-fun b!189958 () Bool)

(declare-fun Unit!5738 () Unit!5734)

(assert (=> b!189958 (= e!125016 Unit!5738)))

(declare-fun b!189959 () Bool)

(assert (=> b!189959 (= e!125017 (isDefined!188 (getValueByKey!235 (toList!1232 lt!93998) key!828)))))

(assert (= (and d!55749 c!34133) b!189957))

(assert (= (and d!55749 (not c!34133)) b!189958))

(assert (= (and d!55749 (not res!89809)) b!189959))

(declare-fun m!216271 () Bool)

(assert (=> d!55749 m!216271))

(declare-fun m!216273 () Bool)

(assert (=> b!189957 m!216273))

(declare-fun m!216275 () Bool)

(assert (=> b!189957 m!216275))

(assert (=> b!189957 m!216275))

(declare-fun m!216277 () Bool)

(assert (=> b!189957 m!216277))

(assert (=> b!189959 m!216275))

(assert (=> b!189959 m!216275))

(assert (=> b!189959 m!216277))

(assert (=> b!189827 d!55749))

(declare-fun b!189960 () Bool)

(declare-fun e!125025 () Bool)

(declare-fun lt!94110 () ListLongMap!2433)

(assert (=> b!189960 (= e!125025 (= (apply!178 lt!94110 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3715 thiss!1248)))))

(declare-fun b!189961 () Bool)

(declare-fun e!125023 () ListLongMap!2433)

(declare-fun call!19166 () ListLongMap!2433)

(assert (=> b!189961 (= e!125023 (+!300 call!19166 (tuple2!3517 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3715 thiss!1248))))))

(declare-fun bm!19161 () Bool)

(declare-fun call!19170 () ListLongMap!2433)

(declare-fun call!19164 () ListLongMap!2433)

(assert (=> bm!19161 (= call!19170 call!19164)))

(declare-fun b!189962 () Bool)

(declare-fun e!125024 () Bool)

(declare-fun call!19167 () Bool)

(assert (=> b!189962 (= e!125024 (not call!19167))))

(declare-fun b!189963 () Bool)

(declare-fun e!125021 () Bool)

(assert (=> b!189963 (= e!125021 (= (apply!178 lt!94110 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000)) (get!2195 (select (arr!3816 (_values!3857 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!521 (defaultEntry!3874 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4136 (_values!3857 thiss!1248))))))

(assert (=> b!189963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))

(declare-fun b!189964 () Bool)

(declare-fun e!125030 () ListLongMap!2433)

(declare-fun call!19169 () ListLongMap!2433)

(assert (=> b!189964 (= e!125030 call!19169)))

(declare-fun d!55751 () Bool)

(declare-fun e!125022 () Bool)

(assert (=> d!55751 e!125022))

(declare-fun res!89816 () Bool)

(assert (=> d!55751 (=> (not res!89816) (not e!125022))))

(assert (=> d!55751 (= res!89816 (or (bvsge #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))))

(declare-fun lt!94122 () ListLongMap!2433)

(assert (=> d!55751 (= lt!94110 lt!94122)))

(declare-fun lt!94113 () Unit!5734)

(declare-fun e!125027 () Unit!5734)

(assert (=> d!55751 (= lt!94113 e!125027)))

(declare-fun c!34138 () Bool)

(declare-fun e!125019 () Bool)

(assert (=> d!55751 (= c!34138 e!125019)))

(declare-fun res!89811 () Bool)

(assert (=> d!55751 (=> (not res!89811) (not e!125019))))

(assert (=> d!55751 (= res!89811 (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))

(assert (=> d!55751 (= lt!94122 e!125023)))

(declare-fun c!34139 () Bool)

(assert (=> d!55751 (= c!34139 (and (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55751 (validMask!0 (mask!9067 thiss!1248))))

(assert (=> d!55751 (= (getCurrentListMap!880 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)) lt!94110)))

(declare-fun bm!19162 () Bool)

(declare-fun call!19165 () ListLongMap!2433)

(assert (=> bm!19162 (= call!19165 call!19170)))

(declare-fun bm!19163 () Bool)

(assert (=> bm!19163 (= call!19169 call!19166)))

(declare-fun b!189965 () Bool)

(declare-fun e!125029 () Bool)

(assert (=> b!189965 (= e!125029 (= (apply!178 lt!94110 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3715 thiss!1248)))))

(declare-fun b!189966 () Bool)

(declare-fun res!89815 () Bool)

(assert (=> b!189966 (=> (not res!89815) (not e!125022))))

(assert (=> b!189966 (= res!89815 e!125024)))

(declare-fun c!34134 () Bool)

(assert (=> b!189966 (= c!34134 (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19164 () Bool)

(declare-fun call!19168 () Bool)

(assert (=> bm!19164 (= call!19168 (contains!1340 lt!94110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!34136 () Bool)

(declare-fun bm!19165 () Bool)

(assert (=> bm!19165 (= call!19166 (+!300 (ite c!34139 call!19164 (ite c!34136 call!19170 call!19165)) (ite (or c!34139 c!34136) (tuple2!3517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3715 thiss!1248)) (tuple2!3517 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3715 thiss!1248)))))))

(declare-fun b!189967 () Bool)

(declare-fun Unit!5739 () Unit!5734)

(assert (=> b!189967 (= e!125027 Unit!5739)))

(declare-fun b!189968 () Bool)

(assert (=> b!189968 (= e!125019 (validKeyInArray!0 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189969 () Bool)

(declare-fun res!89814 () Bool)

(assert (=> b!189969 (=> (not res!89814) (not e!125022))))

(declare-fun e!125028 () Bool)

(assert (=> b!189969 (= res!89814 e!125028)))

(declare-fun res!89812 () Bool)

(assert (=> b!189969 (=> res!89812 e!125028)))

(declare-fun e!125026 () Bool)

(assert (=> b!189969 (= res!89812 (not e!125026))))

(declare-fun res!89813 () Bool)

(assert (=> b!189969 (=> (not res!89813) (not e!125026))))

(assert (=> b!189969 (= res!89813 (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))

(declare-fun b!189970 () Bool)

(declare-fun e!125018 () ListLongMap!2433)

(assert (=> b!189970 (= e!125018 call!19165)))

(declare-fun b!189971 () Bool)

(assert (=> b!189971 (= e!125024 e!125025)))

(declare-fun res!89818 () Bool)

(assert (=> b!189971 (= res!89818 call!19167)))

(assert (=> b!189971 (=> (not res!89818) (not e!125025))))

(declare-fun b!189972 () Bool)

(declare-fun e!125020 () Bool)

(assert (=> b!189972 (= e!125022 e!125020)))

(declare-fun c!34137 () Bool)

(assert (=> b!189972 (= c!34137 (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189973 () Bool)

(assert (=> b!189973 (= e!125023 e!125030)))

(assert (=> b!189973 (= c!34136 (and (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189974 () Bool)

(assert (=> b!189974 (= e!125028 e!125021)))

(declare-fun res!89817 () Bool)

(assert (=> b!189974 (=> (not res!89817) (not e!125021))))

(assert (=> b!189974 (= res!89817 (contains!1340 lt!94110 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189974 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))))))

(declare-fun b!189975 () Bool)

(assert (=> b!189975 (= e!125020 (not call!19168))))

(declare-fun b!189976 () Bool)

(declare-fun c!34135 () Bool)

(assert (=> b!189976 (= c!34135 (and (not (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3611 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189976 (= e!125030 e!125018)))

(declare-fun b!189977 () Bool)

(assert (=> b!189977 (= e!125026 (validKeyInArray!0 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189978 () Bool)

(declare-fun lt!94107 () Unit!5734)

(assert (=> b!189978 (= e!125027 lt!94107)))

(declare-fun lt!94114 () ListLongMap!2433)

(assert (=> b!189978 (= lt!94114 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!94104 () (_ BitVec 64))

(assert (=> b!189978 (= lt!94104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94103 () (_ BitVec 64))

(assert (=> b!189978 (= lt!94103 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94109 () Unit!5734)

(assert (=> b!189978 (= lt!94109 (addStillContains!154 lt!94114 lt!94104 (zeroValue!3715 thiss!1248) lt!94103))))

(assert (=> b!189978 (contains!1340 (+!300 lt!94114 (tuple2!3517 lt!94104 (zeroValue!3715 thiss!1248))) lt!94103)))

(declare-fun lt!94116 () Unit!5734)

(assert (=> b!189978 (= lt!94116 lt!94109)))

(declare-fun lt!94105 () ListLongMap!2433)

(assert (=> b!189978 (= lt!94105 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!94121 () (_ BitVec 64))

(assert (=> b!189978 (= lt!94121 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94106 () (_ BitVec 64))

(assert (=> b!189978 (= lt!94106 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94112 () Unit!5734)

(assert (=> b!189978 (= lt!94112 (addApplyDifferent!154 lt!94105 lt!94121 (minValue!3715 thiss!1248) lt!94106))))

(assert (=> b!189978 (= (apply!178 (+!300 lt!94105 (tuple2!3517 lt!94121 (minValue!3715 thiss!1248))) lt!94106) (apply!178 lt!94105 lt!94106))))

(declare-fun lt!94111 () Unit!5734)

(assert (=> b!189978 (= lt!94111 lt!94112)))

(declare-fun lt!94117 () ListLongMap!2433)

(assert (=> b!189978 (= lt!94117 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!94120 () (_ BitVec 64))

(assert (=> b!189978 (= lt!94120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94123 () (_ BitVec 64))

(assert (=> b!189978 (= lt!94123 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94119 () Unit!5734)

(assert (=> b!189978 (= lt!94119 (addApplyDifferent!154 lt!94117 lt!94120 (zeroValue!3715 thiss!1248) lt!94123))))

(assert (=> b!189978 (= (apply!178 (+!300 lt!94117 (tuple2!3517 lt!94120 (zeroValue!3715 thiss!1248))) lt!94123) (apply!178 lt!94117 lt!94123))))

(declare-fun lt!94108 () Unit!5734)

(assert (=> b!189978 (= lt!94108 lt!94119)))

(declare-fun lt!94118 () ListLongMap!2433)

(assert (=> b!189978 (= lt!94118 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(declare-fun lt!94102 () (_ BitVec 64))

(assert (=> b!189978 (= lt!94102 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94115 () (_ BitVec 64))

(assert (=> b!189978 (= lt!94115 (select (arr!3815 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189978 (= lt!94107 (addApplyDifferent!154 lt!94118 lt!94102 (minValue!3715 thiss!1248) lt!94115))))

(assert (=> b!189978 (= (apply!178 (+!300 lt!94118 (tuple2!3517 lt!94102 (minValue!3715 thiss!1248))) lt!94115) (apply!178 lt!94118 lt!94115))))

(declare-fun b!189979 () Bool)

(assert (=> b!189979 (= e!125020 e!125029)))

(declare-fun res!89810 () Bool)

(assert (=> b!189979 (= res!89810 call!19168)))

(assert (=> b!189979 (=> (not res!89810) (not e!125029))))

(declare-fun b!189980 () Bool)

(assert (=> b!189980 (= e!125018 call!19169)))

(declare-fun bm!19166 () Bool)

(assert (=> bm!19166 (= call!19167 (contains!1340 lt!94110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19167 () Bool)

(assert (=> bm!19167 (= call!19164 (getCurrentListMapNoExtraKeys!211 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)))))

(assert (= (and d!55751 c!34139) b!189961))

(assert (= (and d!55751 (not c!34139)) b!189973))

(assert (= (and b!189973 c!34136) b!189964))

(assert (= (and b!189973 (not c!34136)) b!189976))

(assert (= (and b!189976 c!34135) b!189980))

(assert (= (and b!189976 (not c!34135)) b!189970))

(assert (= (or b!189980 b!189970) bm!19162))

(assert (= (or b!189964 bm!19162) bm!19161))

(assert (= (or b!189964 b!189980) bm!19163))

(assert (= (or b!189961 bm!19161) bm!19167))

(assert (= (or b!189961 bm!19163) bm!19165))

(assert (= (and d!55751 res!89811) b!189968))

(assert (= (and d!55751 c!34138) b!189978))

(assert (= (and d!55751 (not c!34138)) b!189967))

(assert (= (and d!55751 res!89816) b!189969))

(assert (= (and b!189969 res!89813) b!189977))

(assert (= (and b!189969 (not res!89812)) b!189974))

(assert (= (and b!189974 res!89817) b!189963))

(assert (= (and b!189969 res!89814) b!189966))

(assert (= (and b!189966 c!34134) b!189971))

(assert (= (and b!189966 (not c!34134)) b!189962))

(assert (= (and b!189971 res!89818) b!189960))

(assert (= (or b!189971 b!189962) bm!19166))

(assert (= (and b!189966 res!89815) b!189972))

(assert (= (and b!189972 c!34137) b!189979))

(assert (= (and b!189972 (not c!34137)) b!189975))

(assert (= (and b!189979 res!89810) b!189965))

(assert (= (or b!189979 b!189975) bm!19164))

(declare-fun b_lambda!7337 () Bool)

(assert (=> (not b_lambda!7337) (not b!189963)))

(assert (=> b!189963 t!7321))

(declare-fun b_and!11307 () Bool)

(assert (= b_and!11305 (and (=> t!7321 result!4879) b_and!11307)))

(assert (=> d!55751 m!216159))

(declare-fun m!216279 () Bool)

(assert (=> b!189960 m!216279))

(declare-fun m!216281 () Bool)

(assert (=> bm!19166 m!216281))

(declare-fun m!216283 () Bool)

(assert (=> bm!19165 m!216283))

(declare-fun m!216285 () Bool)

(assert (=> bm!19164 m!216285))

(declare-fun m!216287 () Bool)

(assert (=> b!189963 m!216287))

(assert (=> b!189963 m!216223))

(assert (=> b!189963 m!216225))

(assert (=> b!189963 m!216225))

(declare-fun m!216289 () Bool)

(assert (=> b!189963 m!216289))

(assert (=> b!189963 m!216287))

(assert (=> b!189963 m!216223))

(declare-fun m!216291 () Bool)

(assert (=> b!189963 m!216291))

(declare-fun m!216293 () Bool)

(assert (=> bm!19167 m!216293))

(assert (=> b!189974 m!216225))

(assert (=> b!189974 m!216225))

(declare-fun m!216295 () Bool)

(assert (=> b!189974 m!216295))

(assert (=> b!189977 m!216225))

(assert (=> b!189977 m!216225))

(assert (=> b!189977 m!216235))

(declare-fun m!216297 () Bool)

(assert (=> b!189978 m!216297))

(declare-fun m!216299 () Bool)

(assert (=> b!189978 m!216299))

(declare-fun m!216301 () Bool)

(assert (=> b!189978 m!216301))

(assert (=> b!189978 m!216293))

(declare-fun m!216303 () Bool)

(assert (=> b!189978 m!216303))

(declare-fun m!216305 () Bool)

(assert (=> b!189978 m!216305))

(declare-fun m!216307 () Bool)

(assert (=> b!189978 m!216307))

(declare-fun m!216309 () Bool)

(assert (=> b!189978 m!216309))

(declare-fun m!216311 () Bool)

(assert (=> b!189978 m!216311))

(declare-fun m!216313 () Bool)

(assert (=> b!189978 m!216313))

(declare-fun m!216315 () Bool)

(assert (=> b!189978 m!216315))

(assert (=> b!189978 m!216297))

(declare-fun m!216317 () Bool)

(assert (=> b!189978 m!216317))

(declare-fun m!216319 () Bool)

(assert (=> b!189978 m!216319))

(assert (=> b!189978 m!216225))

(assert (=> b!189978 m!216303))

(declare-fun m!216321 () Bool)

(assert (=> b!189978 m!216321))

(declare-fun m!216323 () Bool)

(assert (=> b!189978 m!216323))

(assert (=> b!189978 m!216315))

(declare-fun m!216325 () Bool)

(assert (=> b!189978 m!216325))

(assert (=> b!189978 m!216311))

(declare-fun m!216327 () Bool)

(assert (=> b!189965 m!216327))

(assert (=> b!189968 m!216225))

(assert (=> b!189968 m!216225))

(assert (=> b!189968 m!216235))

(declare-fun m!216329 () Bool)

(assert (=> b!189961 m!216329))

(assert (=> b!189827 d!55751))

(declare-fun d!55753 () Bool)

(declare-fun e!125033 () Bool)

(assert (=> d!55753 e!125033))

(declare-fun res!89821 () Bool)

(assert (=> d!55753 (=> (not res!89821) (not e!125033))))

(assert (=> d!55753 (= res!89821 (and (bvsge (index!4847 lt!93997) #b00000000000000000000000000000000) (bvslt (index!4847 lt!93997) (size!4136 (_values!3857 thiss!1248)))))))

(declare-fun lt!94126 () Unit!5734)

(declare-fun choose!1018 (array!8093 array!8095 (_ BitVec 32) (_ BitVec 32) V!5555 V!5555 (_ BitVec 32) (_ BitVec 64) V!5555 Int) Unit!5734)

(assert (=> d!55753 (= lt!94126 (choose!1018 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) (index!4847 lt!93997) key!828 v!309 (defaultEntry!3874 thiss!1248)))))

(assert (=> d!55753 (validMask!0 (mask!9067 thiss!1248))))

(assert (=> d!55753 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!101 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) (index!4847 lt!93997) key!828 v!309 (defaultEntry!3874 thiss!1248)) lt!94126)))

(declare-fun b!189983 () Bool)

(assert (=> b!189983 (= e!125033 (= (+!300 (getCurrentListMap!880 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248)) (tuple2!3517 key!828 v!309)) (getCurrentListMap!880 (_keys!5842 thiss!1248) (array!8096 (store (arr!3816 (_values!3857 thiss!1248)) (index!4847 lt!93997) (ValueCellFull!1872 v!309)) (size!4136 (_values!3857 thiss!1248))) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3874 thiss!1248))))))

(assert (= (and d!55753 res!89821) b!189983))

(declare-fun m!216331 () Bool)

(assert (=> d!55753 m!216331))

(assert (=> d!55753 m!216159))

(assert (=> b!189983 m!216149))

(assert (=> b!189983 m!216149))

(declare-fun m!216333 () Bool)

(assert (=> b!189983 m!216333))

(assert (=> b!189983 m!216155))

(assert (=> b!189983 m!216157))

(assert (=> b!189827 d!55753))

(declare-fun d!55755 () Bool)

(declare-fun e!125036 () Bool)

(assert (=> d!55755 e!125036))

(declare-fun res!89827 () Bool)

(assert (=> d!55755 (=> (not res!89827) (not e!125036))))

(declare-fun lt!94138 () ListLongMap!2433)

(assert (=> d!55755 (= res!89827 (contains!1340 lt!94138 (_1!1769 (tuple2!3517 key!828 v!309))))))

(declare-fun lt!94135 () List!2413)

(assert (=> d!55755 (= lt!94138 (ListLongMap!2434 lt!94135))))

(declare-fun lt!94136 () Unit!5734)

(declare-fun lt!94137 () Unit!5734)

(assert (=> d!55755 (= lt!94136 lt!94137)))

(assert (=> d!55755 (= (getValueByKey!235 lt!94135 (_1!1769 (tuple2!3517 key!828 v!309))) (Some!240 (_2!1769 (tuple2!3517 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!122 (List!2413 (_ BitVec 64) V!5555) Unit!5734)

(assert (=> d!55755 (= lt!94137 (lemmaContainsTupThenGetReturnValue!122 lt!94135 (_1!1769 (tuple2!3517 key!828 v!309)) (_2!1769 (tuple2!3517 key!828 v!309))))))

(declare-fun insertStrictlySorted!125 (List!2413 (_ BitVec 64) V!5555) List!2413)

(assert (=> d!55755 (= lt!94135 (insertStrictlySorted!125 (toList!1232 lt!93998) (_1!1769 (tuple2!3517 key!828 v!309)) (_2!1769 (tuple2!3517 key!828 v!309))))))

(assert (=> d!55755 (= (+!300 lt!93998 (tuple2!3517 key!828 v!309)) lt!94138)))

(declare-fun b!189988 () Bool)

(declare-fun res!89826 () Bool)

(assert (=> b!189988 (=> (not res!89826) (not e!125036))))

(assert (=> b!189988 (= res!89826 (= (getValueByKey!235 (toList!1232 lt!94138) (_1!1769 (tuple2!3517 key!828 v!309))) (Some!240 (_2!1769 (tuple2!3517 key!828 v!309)))))))

(declare-fun b!189989 () Bool)

(declare-fun contains!1341 (List!2413 tuple2!3516) Bool)

(assert (=> b!189989 (= e!125036 (contains!1341 (toList!1232 lt!94138) (tuple2!3517 key!828 v!309)))))

(assert (= (and d!55755 res!89827) b!189988))

(assert (= (and b!189988 res!89826) b!189989))

(declare-fun m!216335 () Bool)

(assert (=> d!55755 m!216335))

(declare-fun m!216337 () Bool)

(assert (=> d!55755 m!216337))

(declare-fun m!216339 () Bool)

(assert (=> d!55755 m!216339))

(declare-fun m!216341 () Bool)

(assert (=> d!55755 m!216341))

(declare-fun m!216343 () Bool)

(assert (=> b!189988 m!216343))

(declare-fun m!216345 () Bool)

(assert (=> b!189989 m!216345))

(assert (=> b!189827 d!55755))

(declare-fun b!190003 () Bool)

(declare-fun c!34147 () Bool)

(declare-fun lt!94145 () (_ BitVec 64))

(assert (=> b!190003 (= c!34147 (= lt!94145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125045 () SeekEntryResult!669)

(declare-fun e!125043 () SeekEntryResult!669)

(assert (=> b!190003 (= e!125045 e!125043)))

(declare-fun b!190004 () Bool)

(declare-fun lt!94146 () SeekEntryResult!669)

(assert (=> b!190004 (= e!125045 (Found!669 (index!4848 lt!94146)))))

(declare-fun b!190005 () Bool)

(assert (=> b!190005 (= e!125043 (MissingZero!669 (index!4848 lt!94146)))))

(declare-fun d!55757 () Bool)

(declare-fun lt!94147 () SeekEntryResult!669)

(assert (=> d!55757 (and (or ((_ is Undefined!669) lt!94147) (not ((_ is Found!669) lt!94147)) (and (bvsge (index!4847 lt!94147) #b00000000000000000000000000000000) (bvslt (index!4847 lt!94147) (size!4135 (_keys!5842 thiss!1248))))) (or ((_ is Undefined!669) lt!94147) ((_ is Found!669) lt!94147) (not ((_ is MissingZero!669) lt!94147)) (and (bvsge (index!4846 lt!94147) #b00000000000000000000000000000000) (bvslt (index!4846 lt!94147) (size!4135 (_keys!5842 thiss!1248))))) (or ((_ is Undefined!669) lt!94147) ((_ is Found!669) lt!94147) ((_ is MissingZero!669) lt!94147) (not ((_ is MissingVacant!669) lt!94147)) (and (bvsge (index!4849 lt!94147) #b00000000000000000000000000000000) (bvslt (index!4849 lt!94147) (size!4135 (_keys!5842 thiss!1248))))) (or ((_ is Undefined!669) lt!94147) (ite ((_ is Found!669) lt!94147) (= (select (arr!3815 (_keys!5842 thiss!1248)) (index!4847 lt!94147)) key!828) (ite ((_ is MissingZero!669) lt!94147) (= (select (arr!3815 (_keys!5842 thiss!1248)) (index!4846 lt!94147)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!669) lt!94147) (= (select (arr!3815 (_keys!5842 thiss!1248)) (index!4849 lt!94147)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!125044 () SeekEntryResult!669)

(assert (=> d!55757 (= lt!94147 e!125044)))

(declare-fun c!34148 () Bool)

(assert (=> d!55757 (= c!34148 (and ((_ is Intermediate!669) lt!94146) (undefined!1481 lt!94146)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8093 (_ BitVec 32)) SeekEntryResult!669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55757 (= lt!94146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9067 thiss!1248)) key!828 (_keys!5842 thiss!1248) (mask!9067 thiss!1248)))))

(assert (=> d!55757 (validMask!0 (mask!9067 thiss!1248))))

(assert (=> d!55757 (= (seekEntryOrOpen!0 key!828 (_keys!5842 thiss!1248) (mask!9067 thiss!1248)) lt!94147)))

(declare-fun b!190002 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8093 (_ BitVec 32)) SeekEntryResult!669)

(assert (=> b!190002 (= e!125043 (seekKeyOrZeroReturnVacant!0 (x!20453 lt!94146) (index!4848 lt!94146) (index!4848 lt!94146) key!828 (_keys!5842 thiss!1248) (mask!9067 thiss!1248)))))

(declare-fun b!190006 () Bool)

(assert (=> b!190006 (= e!125044 e!125045)))

(assert (=> b!190006 (= lt!94145 (select (arr!3815 (_keys!5842 thiss!1248)) (index!4848 lt!94146)))))

(declare-fun c!34146 () Bool)

(assert (=> b!190006 (= c!34146 (= lt!94145 key!828))))

(declare-fun b!190007 () Bool)

(assert (=> b!190007 (= e!125044 Undefined!669)))

(assert (= (and d!55757 c!34148) b!190007))

(assert (= (and d!55757 (not c!34148)) b!190006))

(assert (= (and b!190006 c!34146) b!190004))

(assert (= (and b!190006 (not c!34146)) b!190003))

(assert (= (and b!190003 c!34147) b!190005))

(assert (= (and b!190003 (not c!34147)) b!190002))

(declare-fun m!216347 () Bool)

(assert (=> d!55757 m!216347))

(declare-fun m!216349 () Bool)

(assert (=> d!55757 m!216349))

(assert (=> d!55757 m!216347))

(declare-fun m!216351 () Bool)

(assert (=> d!55757 m!216351))

(assert (=> d!55757 m!216159))

(declare-fun m!216353 () Bool)

(assert (=> d!55757 m!216353))

(declare-fun m!216355 () Bool)

(assert (=> d!55757 m!216355))

(declare-fun m!216357 () Bool)

(assert (=> b!190002 m!216357))

(declare-fun m!216359 () Bool)

(assert (=> b!190006 m!216359))

(assert (=> b!189829 d!55757))

(declare-fun d!55759 () Bool)

(assert (=> d!55759 (= (array_inv!2471 (_keys!5842 thiss!1248)) (bvsge (size!4135 (_keys!5842 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189825 d!55759))

(declare-fun d!55761 () Bool)

(assert (=> d!55761 (= (array_inv!2472 (_values!3857 thiss!1248)) (bvsge (size!4136 (_values!3857 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189825 d!55761))

(declare-fun d!55763 () Bool)

(declare-fun res!89834 () Bool)

(declare-fun e!125048 () Bool)

(assert (=> d!55763 (=> (not res!89834) (not e!125048))))

(declare-fun simpleValid!194 (LongMapFixedSize!2652) Bool)

(assert (=> d!55763 (= res!89834 (simpleValid!194 thiss!1248))))

(assert (=> d!55763 (= (valid!1089 thiss!1248) e!125048)))

(declare-fun b!190014 () Bool)

(declare-fun res!89835 () Bool)

(assert (=> b!190014 (=> (not res!89835) (not e!125048))))

(declare-fun arrayCountValidKeys!0 (array!8093 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190014 (= res!89835 (= (arrayCountValidKeys!0 (_keys!5842 thiss!1248) #b00000000000000000000000000000000 (size!4135 (_keys!5842 thiss!1248))) (_size!1375 thiss!1248)))))

(declare-fun b!190015 () Bool)

(declare-fun res!89836 () Bool)

(assert (=> b!190015 (=> (not res!89836) (not e!125048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8093 (_ BitVec 32)) Bool)

(assert (=> b!190015 (= res!89836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5842 thiss!1248) (mask!9067 thiss!1248)))))

(declare-fun b!190016 () Bool)

(declare-datatypes ((List!2414 0))(
  ( (Nil!2411) (Cons!2410 (h!3047 (_ BitVec 64)) (t!7322 List!2414)) )
))
(declare-fun arrayNoDuplicates!0 (array!8093 (_ BitVec 32) List!2414) Bool)

(assert (=> b!190016 (= e!125048 (arrayNoDuplicates!0 (_keys!5842 thiss!1248) #b00000000000000000000000000000000 Nil!2411))))

(assert (= (and d!55763 res!89834) b!190014))

(assert (= (and b!190014 res!89835) b!190015))

(assert (= (and b!190015 res!89836) b!190016))

(declare-fun m!216361 () Bool)

(assert (=> d!55763 m!216361))

(declare-fun m!216363 () Bool)

(assert (=> b!190014 m!216363))

(declare-fun m!216365 () Bool)

(assert (=> b!190015 m!216365))

(declare-fun m!216367 () Bool)

(assert (=> b!190016 m!216367))

(assert (=> start!19290 d!55763))

(declare-fun d!55765 () Bool)

(declare-fun e!125051 () Bool)

(assert (=> d!55765 e!125051))

(declare-fun res!89841 () Bool)

(assert (=> d!55765 (=> (not res!89841) (not e!125051))))

(declare-fun lt!94153 () SeekEntryResult!669)

(assert (=> d!55765 (= res!89841 ((_ is Found!669) lt!94153))))

(assert (=> d!55765 (= lt!94153 (seekEntryOrOpen!0 key!828 (_keys!5842 thiss!1248) (mask!9067 thiss!1248)))))

(declare-fun lt!94152 () Unit!5734)

(declare-fun choose!1019 (array!8093 array!8095 (_ BitVec 32) (_ BitVec 32) V!5555 V!5555 (_ BitVec 64) Int) Unit!5734)

(assert (=> d!55765 (= lt!94152 (choose!1019 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) key!828 (defaultEntry!3874 thiss!1248)))))

(assert (=> d!55765 (validMask!0 (mask!9067 thiss!1248))))

(assert (=> d!55765 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!168 (_keys!5842 thiss!1248) (_values!3857 thiss!1248) (mask!9067 thiss!1248) (extraKeys!3611 thiss!1248) (zeroValue!3715 thiss!1248) (minValue!3715 thiss!1248) key!828 (defaultEntry!3874 thiss!1248)) lt!94152)))

(declare-fun b!190021 () Bool)

(declare-fun res!89842 () Bool)

(assert (=> b!190021 (=> (not res!89842) (not e!125051))))

(assert (=> b!190021 (= res!89842 (inRange!0 (index!4847 lt!94153) (mask!9067 thiss!1248)))))

(declare-fun b!190022 () Bool)

(assert (=> b!190022 (= e!125051 (= (select (arr!3815 (_keys!5842 thiss!1248)) (index!4847 lt!94153)) key!828))))

(assert (=> b!190022 (and (bvsge (index!4847 lt!94153) #b00000000000000000000000000000000) (bvslt (index!4847 lt!94153) (size!4135 (_keys!5842 thiss!1248))))))

(assert (= (and d!55765 res!89841) b!190021))

(assert (= (and b!190021 res!89842) b!190022))

(assert (=> d!55765 m!216169))

(declare-fun m!216369 () Bool)

(assert (=> d!55765 m!216369))

(assert (=> d!55765 m!216159))

(declare-fun m!216371 () Bool)

(assert (=> b!190021 m!216371))

(declare-fun m!216373 () Bool)

(assert (=> b!190022 m!216373))

(assert (=> b!189828 d!55765))

(declare-fun d!55767 () Bool)

(assert (=> d!55767 (= (inRange!0 (index!4847 lt!93997) (mask!9067 thiss!1248)) (and (bvsge (index!4847 lt!93997) #b00000000000000000000000000000000) (bvslt (index!4847 lt!93997) (bvadd (mask!9067 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189828 d!55767))

(declare-fun b!190029 () Bool)

(declare-fun e!125057 () Bool)

(assert (=> b!190029 (= e!125057 tp_is_empty!4431)))

(declare-fun mapIsEmpty!7651 () Bool)

(declare-fun mapRes!7651 () Bool)

(assert (=> mapIsEmpty!7651 mapRes!7651))

(declare-fun condMapEmpty!7651 () Bool)

(declare-fun mapDefault!7651 () ValueCell!1872)

(assert (=> mapNonEmpty!7645 (= condMapEmpty!7651 (= mapRest!7645 ((as const (Array (_ BitVec 32) ValueCell!1872)) mapDefault!7651)))))

(declare-fun e!125056 () Bool)

(assert (=> mapNonEmpty!7645 (= tp!16812 (and e!125056 mapRes!7651))))

(declare-fun b!190030 () Bool)

(assert (=> b!190030 (= e!125056 tp_is_empty!4431)))

(declare-fun mapNonEmpty!7651 () Bool)

(declare-fun tp!16822 () Bool)

(assert (=> mapNonEmpty!7651 (= mapRes!7651 (and tp!16822 e!125057))))

(declare-fun mapKey!7651 () (_ BitVec 32))

(declare-fun mapValue!7651 () ValueCell!1872)

(declare-fun mapRest!7651 () (Array (_ BitVec 32) ValueCell!1872))

(assert (=> mapNonEmpty!7651 (= mapRest!7645 (store mapRest!7651 mapKey!7651 mapValue!7651))))

(assert (= (and mapNonEmpty!7645 condMapEmpty!7651) mapIsEmpty!7651))

(assert (= (and mapNonEmpty!7645 (not condMapEmpty!7651)) mapNonEmpty!7651))

(assert (= (and mapNonEmpty!7651 ((_ is ValueCellFull!1872) mapValue!7651)) b!190029))

(assert (= (and mapNonEmpty!7645 ((_ is ValueCellFull!1872) mapDefault!7651)) b!190030))

(declare-fun m!216375 () Bool)

(assert (=> mapNonEmpty!7651 m!216375))

(declare-fun b_lambda!7339 () Bool)

(assert (= b_lambda!7337 (or (and b!189825 b_free!4659) b_lambda!7339)))

(declare-fun b_lambda!7341 () Bool)

(assert (= b_lambda!7335 (or (and b!189825 b_free!4659) b_lambda!7341)))

(check-sat (not bm!19139) (not b!189983) tp_is_empty!4431 (not b!190015) (not b!189968) (not bm!19159) (not b!189957) (not b!190014) (not d!55753) (not b!189961) (not bm!19138) (not b!189946) (not d!55763) (not d!55765) (not d!55757) (not bm!19164) (not b_next!4659) (not b!189936) (not bm!19160) (not b!189989) (not b!190021) (not b!189929) (not b!189942) (not b!189965) (not b!189977) (not bm!19166) (not b!189931) (not bm!19158) (not b!190016) b_and!11307 (not d!55755) (not d!55743) (not b!189978) (not mapNonEmpty!7651) (not b!189933) (not b_lambda!7339) (not b_lambda!7341) (not b!189928) (not d!55747) (not b!189963) (not bm!19157) (not b!189945) (not b!190002) (not d!55751) (not bm!19167) (not d!55749) (not b!189960) (not b!189988) (not b!189974) (not b!189959) (not bm!19165))
(check-sat b_and!11307 (not b_next!4659))
