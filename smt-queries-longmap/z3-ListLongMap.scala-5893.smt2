; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76198 () Bool)

(assert start!76198)

(declare-fun b!894751 () Bool)

(declare-fun b_free!15859 () Bool)

(declare-fun b_next!15859 () Bool)

(assert (=> b!894751 (= b_free!15859 (not b_next!15859))))

(declare-fun tp!55558 () Bool)

(declare-fun b_and!26143 () Bool)

(assert (=> b!894751 (= tp!55558 b_and!26143)))

(declare-fun tp_is_empty!18187 () Bool)

(declare-fun e!499791 () Bool)

(declare-fun e!499797 () Bool)

(declare-datatypes ((array!52399 0))(
  ( (array!52400 (arr!25198 (Array (_ BitVec 32) (_ BitVec 64))) (size!25644 (_ BitVec 32))) )
))
(declare-datatypes ((V!29215 0))(
  ( (V!29216 (val!9144 Int)) )
))
(declare-datatypes ((ValueCell!8612 0))(
  ( (ValueCellFull!8612 (v!11624 V!29215)) (EmptyCell!8612) )
))
(declare-datatypes ((array!52401 0))(
  ( (array!52402 (arr!25199 (Array (_ BitVec 32) ValueCell!8612)) (size!25645 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4240 0))(
  ( (LongMapFixedSize!4241 (defaultEntry!5326 Int) (mask!25913 (_ BitVec 32)) (extraKeys!5022 (_ BitVec 32)) (zeroValue!5126 V!29215) (minValue!5126 V!29215) (_size!2175 (_ BitVec 32)) (_keys!10046 array!52399) (_values!5313 array!52401) (_vacant!2175 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4240)

(declare-fun array_inv!19836 (array!52399) Bool)

(declare-fun array_inv!19837 (array!52401) Bool)

(assert (=> b!894751 (= e!499797 (and tp!55558 tp_is_empty!18187 (array_inv!19836 (_keys!10046 thiss!1181)) (array_inv!19837 (_values!5313 thiss!1181)) e!499791))))

(declare-fun b!894752 () Bool)

(declare-fun e!499795 () Bool)

(declare-fun mapRes!28846 () Bool)

(assert (=> b!894752 (= e!499791 (and e!499795 mapRes!28846))))

(declare-fun condMapEmpty!28846 () Bool)

(declare-fun mapDefault!28846 () ValueCell!8612)

(assert (=> b!894752 (= condMapEmpty!28846 (= (arr!25199 (_values!5313 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8612)) mapDefault!28846)))))

(declare-fun res!605494 () Bool)

(declare-fun e!499796 () Bool)

(assert (=> start!76198 (=> (not res!605494) (not e!499796))))

(declare-fun valid!1651 (LongMapFixedSize!4240) Bool)

(assert (=> start!76198 (= res!605494 (valid!1651 thiss!1181))))

(assert (=> start!76198 e!499796))

(assert (=> start!76198 e!499797))

(assert (=> start!76198 true))

(declare-fun b!894753 () Bool)

(declare-fun e!499793 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!453 0))(
  ( (Some!452 (v!11625 V!29215)) (None!451) )
))
(declare-fun get!13281 (Option!453) V!29215)

(declare-datatypes ((tuple2!11934 0))(
  ( (tuple2!11935 (_1!5978 (_ BitVec 64)) (_2!5978 V!29215)) )
))
(declare-datatypes ((List!17751 0))(
  ( (Nil!17748) (Cons!17747 (h!18885 tuple2!11934) (t!25070 List!17751)) )
))
(declare-fun getValueByKey!447 (List!17751 (_ BitVec 64)) Option!453)

(declare-datatypes ((ListLongMap!10633 0))(
  ( (ListLongMap!10634 (toList!5332 List!17751)) )
))
(declare-fun map!12204 (LongMapFixedSize!4240) ListLongMap!10633)

(assert (=> b!894753 (= e!499793 (not (= (minValue!5126 thiss!1181) (get!13281 (getValueByKey!447 (toList!5332 (map!12204 thiss!1181)) key!785)))))))

(declare-fun b!894754 () Bool)

(assert (=> b!894754 (= e!499795 tp_is_empty!18187)))

(declare-fun b!894755 () Bool)

(declare-fun e!499792 () Bool)

(assert (=> b!894755 (= e!499792 tp_is_empty!18187)))

(declare-fun mapIsEmpty!28846 () Bool)

(assert (=> mapIsEmpty!28846 mapRes!28846))

(declare-fun mapNonEmpty!28846 () Bool)

(declare-fun tp!55557 () Bool)

(assert (=> mapNonEmpty!28846 (= mapRes!28846 (and tp!55557 e!499792))))

(declare-fun mapKey!28846 () (_ BitVec 32))

(declare-fun mapRest!28846 () (Array (_ BitVec 32) ValueCell!8612))

(declare-fun mapValue!28846 () ValueCell!8612)

(assert (=> mapNonEmpty!28846 (= (arr!25199 (_values!5313 thiss!1181)) (store mapRest!28846 mapKey!28846 mapValue!28846))))

(declare-fun b!894756 () Bool)

(assert (=> b!894756 (= e!499796 e!499793)))

(declare-fun c!94519 () Bool)

(declare-fun contains!4355 (LongMapFixedSize!4240 (_ BitVec 64)) Bool)

(assert (=> b!894756 (= c!94519 (contains!4355 thiss!1181 key!785))))

(declare-fun b!894757 () Bool)

(declare-fun dynLambda!1315 (Int (_ BitVec 64)) V!29215)

(assert (=> b!894757 (= e!499793 (not (= (minValue!5126 thiss!1181) (dynLambda!1315 (defaultEntry!5326 thiss!1181) key!785))))))

(declare-fun b!894758 () Bool)

(declare-fun res!605495 () Bool)

(assert (=> b!894758 (=> (not res!605495) (not e!499796))))

(assert (=> b!894758 (= res!605495 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!76198 res!605494) b!894758))

(assert (= (and b!894758 res!605495) b!894756))

(assert (= (and b!894756 c!94519) b!894753))

(assert (= (and b!894756 (not c!94519)) b!894757))

(assert (= (and b!894752 condMapEmpty!28846) mapIsEmpty!28846))

(assert (= (and b!894752 (not condMapEmpty!28846)) mapNonEmpty!28846))

(get-info :version)

(assert (= (and mapNonEmpty!28846 ((_ is ValueCellFull!8612) mapValue!28846)) b!894755))

(assert (= (and b!894752 ((_ is ValueCellFull!8612) mapDefault!28846)) b!894754))

(assert (= b!894751 b!894752))

(assert (= start!76198 b!894751))

(declare-fun b_lambda!12945 () Bool)

(assert (=> (not b_lambda!12945) (not b!894757)))

(declare-fun t!25069 () Bool)

(declare-fun tb!5169 () Bool)

(assert (=> (and b!894751 (= (defaultEntry!5326 thiss!1181) (defaultEntry!5326 thiss!1181)) t!25069) tb!5169))

(declare-fun result!10061 () Bool)

(assert (=> tb!5169 (= result!10061 tp_is_empty!18187)))

(assert (=> b!894757 t!25069))

(declare-fun b_and!26145 () Bool)

(assert (= b_and!26143 (and (=> t!25069 result!10061) b_and!26145)))

(declare-fun m!833219 () Bool)

(assert (=> start!76198 m!833219))

(declare-fun m!833221 () Bool)

(assert (=> b!894756 m!833221))

(declare-fun m!833223 () Bool)

(assert (=> b!894757 m!833223))

(declare-fun m!833225 () Bool)

(assert (=> mapNonEmpty!28846 m!833225))

(declare-fun m!833227 () Bool)

(assert (=> b!894751 m!833227))

(declare-fun m!833229 () Bool)

(assert (=> b!894751 m!833229))

(declare-fun m!833231 () Bool)

(assert (=> b!894753 m!833231))

(declare-fun m!833233 () Bool)

(assert (=> b!894753 m!833233))

(assert (=> b!894753 m!833233))

(declare-fun m!833235 () Bool)

(assert (=> b!894753 m!833235))

(check-sat (not b_next!15859) tp_is_empty!18187 (not b!894751) b_and!26145 (not b_lambda!12945) (not b!894753) (not b!894756) (not mapNonEmpty!28846) (not start!76198))
(check-sat b_and!26145 (not b_next!15859))
(get-model)

(declare-fun b_lambda!12951 () Bool)

(assert (= b_lambda!12945 (or (and b!894751 b_free!15859) b_lambda!12951)))

(check-sat (not b_next!15859) tp_is_empty!18187 (not b_lambda!12951) (not b!894751) b_and!26145 (not b!894753) (not b!894756) (not mapNonEmpty!28846) (not start!76198))
(check-sat b_and!26145 (not b_next!15859))
(get-model)

(declare-fun b!894833 () Bool)

(declare-fun e!499852 () Bool)

(declare-fun e!499854 () Bool)

(assert (=> b!894833 (= e!499852 e!499854)))

(declare-fun c!94540 () Bool)

(assert (=> b!894833 (= c!94540 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894834 () Bool)

(declare-datatypes ((Unit!30424 0))(
  ( (Unit!30425) )
))
(declare-fun e!499850 () Unit!30424)

(declare-fun Unit!30426 () Unit!30424)

(assert (=> b!894834 (= e!499850 Unit!30426)))

(declare-fun b!894835 () Bool)

(declare-fun c!94538 () Bool)

(declare-datatypes ((SeekEntryResult!8820 0))(
  ( (MissingZero!8820 (index!37651 (_ BitVec 32))) (Found!8820 (index!37652 (_ BitVec 32))) (Intermediate!8820 (undefined!9632 Bool) (index!37653 (_ BitVec 32)) (x!75970 (_ BitVec 32))) (Undefined!8820) (MissingVacant!8820 (index!37654 (_ BitVec 32))) )
))
(declare-fun lt!404328 () SeekEntryResult!8820)

(assert (=> b!894835 (= c!94538 ((_ is Found!8820) lt!404328))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52399 (_ BitVec 32)) SeekEntryResult!8820)

(assert (=> b!894835 (= lt!404328 (seekEntry!0 key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun e!499851 () Bool)

(assert (=> b!894835 (= e!499854 e!499851)))

(declare-fun bm!39711 () Bool)

(declare-fun call!39714 () ListLongMap!10633)

(declare-fun getCurrentListMap!2608 (array!52399 array!52401 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 32) Int) ListLongMap!10633)

(assert (=> bm!39711 (= call!39714 (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun b!894836 () Bool)

(assert (=> b!894836 false))

(declare-fun lt!404333 () Unit!30424)

(declare-fun lt!404331 () Unit!30424)

(assert (=> b!894836 (= lt!404333 lt!404331)))

(declare-fun lt!404326 () SeekEntryResult!8820)

(declare-fun lt!404325 () (_ BitVec 32))

(assert (=> b!894836 (and ((_ is Found!8820) lt!404326) (= (index!37652 lt!404326) lt!404325))))

(assert (=> b!894836 (= lt!404326 (seekEntry!0 key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52399 (_ BitVec 32)) Unit!30424)

(assert (=> b!894836 (= lt!404331 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!404325 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun lt!404338 () Unit!30424)

(declare-fun lt!404337 () Unit!30424)

(assert (=> b!894836 (= lt!404338 lt!404337)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52399 (_ BitVec 32)) Bool)

(assert (=> b!894836 (arrayForallSeekEntryOrOpenFound!0 lt!404325 (_keys!10046 thiss!1181) (mask!25913 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30424)

(assert (=> b!894836 (= lt!404337 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10046 thiss!1181) (mask!25913 thiss!1181) #b00000000000000000000000000000000 lt!404325))))

(declare-fun arrayScanForKey!0 (array!52399 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894836 (= lt!404325 (arrayScanForKey!0 (_keys!10046 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!404327 () Unit!30424)

(declare-fun lt!404336 () Unit!30424)

(assert (=> b!894836 (= lt!404327 lt!404336)))

(declare-fun e!499853 () Bool)

(assert (=> b!894836 e!499853))

(declare-fun c!94539 () Bool)

(assert (=> b!894836 (= c!94539 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!166 (array!52399 array!52401 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 64) Int) Unit!30424)

(assert (=> b!894836 (= lt!404336 (lemmaKeyInListMapIsInArray!166 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) key!785 (defaultEntry!5326 thiss!1181)))))

(declare-fun Unit!30427 () Unit!30424)

(assert (=> b!894836 (= e!499850 Unit!30427)))

(declare-fun d!110793 () Bool)

(declare-fun lt!404332 () Bool)

(declare-fun contains!4358 (ListLongMap!10633 (_ BitVec 64)) Bool)

(assert (=> d!110793 (= lt!404332 (contains!4358 (map!12204 thiss!1181) key!785))))

(assert (=> d!110793 (= lt!404332 e!499852)))

(declare-fun c!94537 () Bool)

(assert (=> d!110793 (= c!94537 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110793 (valid!1651 thiss!1181)))

(assert (=> d!110793 (= (contains!4355 thiss!1181 key!785) lt!404332)))

(declare-fun bm!39712 () Bool)

(declare-fun call!39715 () Bool)

(declare-fun arrayContainsKey!0 (array!52399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39712 (= call!39715 (arrayContainsKey!0 (_keys!10046 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!894837 () Bool)

(assert (=> b!894837 (= e!499853 call!39715)))

(declare-fun b!894838 () Bool)

(assert (=> b!894838 (= e!499852 (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!39716 () Bool)

(declare-fun bm!39713 () Bool)

(assert (=> bm!39713 (= call!39716 (contains!4358 call!39714 (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))

(declare-fun b!894839 () Bool)

(assert (=> b!894839 (= e!499851 true)))

(declare-fun lt!404329 () Unit!30424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52399 (_ BitVec 64) (_ BitVec 32)) Unit!30424)

(assert (=> b!894839 (= lt!404329 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10046 thiss!1181) key!785 (index!37652 lt!404328)))))

(assert (=> b!894839 call!39715))

(declare-fun lt!404339 () Unit!30424)

(assert (=> b!894839 (= lt!404339 lt!404329)))

(declare-fun lt!404335 () Unit!30424)

(declare-fun lemmaValidKeyInArrayIsInListMap!238 (array!52399 array!52401 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 32) Int) Unit!30424)

(assert (=> b!894839 (= lt!404335 (lemmaValidKeyInArrayIsInListMap!238 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (index!37652 lt!404328) (defaultEntry!5326 thiss!1181)))))

(assert (=> b!894839 call!39716))

(declare-fun lt!404334 () Unit!30424)

(assert (=> b!894839 (= lt!404334 lt!404335)))

(declare-fun b!894840 () Bool)

(assert (=> b!894840 (= e!499853 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!894841 () Bool)

(assert (=> b!894841 (= e!499851 false)))

(declare-fun c!94536 () Bool)

(assert (=> b!894841 (= c!94536 call!39716)))

(declare-fun lt!404330 () Unit!30424)

(assert (=> b!894841 (= lt!404330 e!499850)))

(declare-fun b!894842 () Bool)

(assert (=> b!894842 (= e!499854 (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!110793 c!94537) b!894838))

(assert (= (and d!110793 (not c!94537)) b!894833))

(assert (= (and b!894833 c!94540) b!894842))

(assert (= (and b!894833 (not c!94540)) b!894835))

(assert (= (and b!894835 c!94538) b!894839))

(assert (= (and b!894835 (not c!94538)) b!894841))

(assert (= (and b!894841 c!94536) b!894836))

(assert (= (and b!894841 (not c!94536)) b!894834))

(assert (= (and b!894836 c!94539) b!894837))

(assert (= (and b!894836 (not c!94539)) b!894840))

(assert (= (or b!894839 b!894837) bm!39712))

(assert (= (or b!894839 b!894841) bm!39711))

(assert (= (or b!894839 b!894841) bm!39713))

(declare-fun m!833273 () Bool)

(assert (=> b!894835 m!833273))

(assert (=> d!110793 m!833231))

(assert (=> d!110793 m!833231))

(declare-fun m!833275 () Bool)

(assert (=> d!110793 m!833275))

(assert (=> d!110793 m!833219))

(declare-fun m!833277 () Bool)

(assert (=> bm!39713 m!833277))

(declare-fun m!833279 () Bool)

(assert (=> bm!39713 m!833279))

(declare-fun m!833281 () Bool)

(assert (=> bm!39712 m!833281))

(declare-fun m!833283 () Bool)

(assert (=> b!894839 m!833283))

(declare-fun m!833285 () Bool)

(assert (=> b!894839 m!833285))

(assert (=> b!894836 m!833273))

(declare-fun m!833287 () Bool)

(assert (=> b!894836 m!833287))

(declare-fun m!833289 () Bool)

(assert (=> b!894836 m!833289))

(declare-fun m!833291 () Bool)

(assert (=> b!894836 m!833291))

(declare-fun m!833293 () Bool)

(assert (=> b!894836 m!833293))

(declare-fun m!833295 () Bool)

(assert (=> b!894836 m!833295))

(declare-fun m!833297 () Bool)

(assert (=> bm!39711 m!833297))

(assert (=> b!894756 d!110793))

(declare-fun d!110795 () Bool)

(assert (=> d!110795 (= (get!13281 (getValueByKey!447 (toList!5332 (map!12204 thiss!1181)) key!785)) (v!11625 (getValueByKey!447 (toList!5332 (map!12204 thiss!1181)) key!785)))))

(assert (=> b!894753 d!110795))

(declare-fun b!894851 () Bool)

(declare-fun e!499859 () Option!453)

(assert (=> b!894851 (= e!499859 (Some!452 (_2!5978 (h!18885 (toList!5332 (map!12204 thiss!1181))))))))

(declare-fun b!894854 () Bool)

(declare-fun e!499860 () Option!453)

(assert (=> b!894854 (= e!499860 None!451)))

(declare-fun b!894852 () Bool)

(assert (=> b!894852 (= e!499859 e!499860)))

(declare-fun c!94546 () Bool)

(assert (=> b!894852 (= c!94546 (and ((_ is Cons!17747) (toList!5332 (map!12204 thiss!1181))) (not (= (_1!5978 (h!18885 (toList!5332 (map!12204 thiss!1181)))) key!785))))))

(declare-fun d!110797 () Bool)

(declare-fun c!94545 () Bool)

(assert (=> d!110797 (= c!94545 (and ((_ is Cons!17747) (toList!5332 (map!12204 thiss!1181))) (= (_1!5978 (h!18885 (toList!5332 (map!12204 thiss!1181)))) key!785)))))

(assert (=> d!110797 (= (getValueByKey!447 (toList!5332 (map!12204 thiss!1181)) key!785) e!499859)))

(declare-fun b!894853 () Bool)

(assert (=> b!894853 (= e!499860 (getValueByKey!447 (t!25070 (toList!5332 (map!12204 thiss!1181))) key!785))))

(assert (= (and d!110797 c!94545) b!894851))

(assert (= (and d!110797 (not c!94545)) b!894852))

(assert (= (and b!894852 c!94546) b!894853))

(assert (= (and b!894852 (not c!94546)) b!894854))

(declare-fun m!833299 () Bool)

(assert (=> b!894853 m!833299))

(assert (=> b!894753 d!110797))

(declare-fun d!110799 () Bool)

(assert (=> d!110799 (= (map!12204 thiss!1181) (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun bs!25111 () Bool)

(assert (= bs!25111 d!110799))

(assert (=> bs!25111 m!833297))

(assert (=> b!894753 d!110799))

(declare-fun d!110801 () Bool)

(declare-fun res!605514 () Bool)

(declare-fun e!499863 () Bool)

(assert (=> d!110801 (=> (not res!605514) (not e!499863))))

(declare-fun simpleValid!298 (LongMapFixedSize!4240) Bool)

(assert (=> d!110801 (= res!605514 (simpleValid!298 thiss!1181))))

(assert (=> d!110801 (= (valid!1651 thiss!1181) e!499863)))

(declare-fun b!894861 () Bool)

(declare-fun res!605515 () Bool)

(assert (=> b!894861 (=> (not res!605515) (not e!499863))))

(declare-fun arrayCountValidKeys!0 (array!52399 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894861 (= res!605515 (= (arrayCountValidKeys!0 (_keys!10046 thiss!1181) #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))) (_size!2175 thiss!1181)))))

(declare-fun b!894862 () Bool)

(declare-fun res!605516 () Bool)

(assert (=> b!894862 (=> (not res!605516) (not e!499863))))

(assert (=> b!894862 (= res!605516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!894863 () Bool)

(declare-datatypes ((List!17754 0))(
  ( (Nil!17751) (Cons!17750 (h!18888 (_ BitVec 64)) (t!25077 List!17754)) )
))
(declare-fun arrayNoDuplicates!0 (array!52399 (_ BitVec 32) List!17754) Bool)

(assert (=> b!894863 (= e!499863 (arrayNoDuplicates!0 (_keys!10046 thiss!1181) #b00000000000000000000000000000000 Nil!17751))))

(assert (= (and d!110801 res!605514) b!894861))

(assert (= (and b!894861 res!605515) b!894862))

(assert (= (and b!894862 res!605516) b!894863))

(declare-fun m!833301 () Bool)

(assert (=> d!110801 m!833301))

(declare-fun m!833303 () Bool)

(assert (=> b!894861 m!833303))

(declare-fun m!833305 () Bool)

(assert (=> b!894862 m!833305))

(declare-fun m!833307 () Bool)

(assert (=> b!894863 m!833307))

(assert (=> start!76198 d!110801))

(declare-fun d!110803 () Bool)

(assert (=> d!110803 (= (array_inv!19836 (_keys!10046 thiss!1181)) (bvsge (size!25644 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894751 d!110803))

(declare-fun d!110805 () Bool)

(assert (=> d!110805 (= (array_inv!19837 (_values!5313 thiss!1181)) (bvsge (size!25645 (_values!5313 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894751 d!110805))

(declare-fun b!894870 () Bool)

(declare-fun e!499869 () Bool)

(assert (=> b!894870 (= e!499869 tp_is_empty!18187)))

(declare-fun mapIsEmpty!28855 () Bool)

(declare-fun mapRes!28855 () Bool)

(assert (=> mapIsEmpty!28855 mapRes!28855))

(declare-fun mapNonEmpty!28855 () Bool)

(declare-fun tp!55573 () Bool)

(assert (=> mapNonEmpty!28855 (= mapRes!28855 (and tp!55573 e!499869))))

(declare-fun mapRest!28855 () (Array (_ BitVec 32) ValueCell!8612))

(declare-fun mapKey!28855 () (_ BitVec 32))

(declare-fun mapValue!28855 () ValueCell!8612)

(assert (=> mapNonEmpty!28855 (= mapRest!28846 (store mapRest!28855 mapKey!28855 mapValue!28855))))

(declare-fun condMapEmpty!28855 () Bool)

(declare-fun mapDefault!28855 () ValueCell!8612)

(assert (=> mapNonEmpty!28846 (= condMapEmpty!28855 (= mapRest!28846 ((as const (Array (_ BitVec 32) ValueCell!8612)) mapDefault!28855)))))

(declare-fun e!499868 () Bool)

(assert (=> mapNonEmpty!28846 (= tp!55557 (and e!499868 mapRes!28855))))

(declare-fun b!894871 () Bool)

(assert (=> b!894871 (= e!499868 tp_is_empty!18187)))

(assert (= (and mapNonEmpty!28846 condMapEmpty!28855) mapIsEmpty!28855))

(assert (= (and mapNonEmpty!28846 (not condMapEmpty!28855)) mapNonEmpty!28855))

(assert (= (and mapNonEmpty!28855 ((_ is ValueCellFull!8612) mapValue!28855)) b!894870))

(assert (= (and mapNonEmpty!28846 ((_ is ValueCellFull!8612) mapDefault!28855)) b!894871))

(declare-fun m!833309 () Bool)

(assert (=> mapNonEmpty!28855 m!833309))

(check-sat (not bm!39711) (not d!110801) (not b_next!15859) (not b!894853) tp_is_empty!18187 (not b_lambda!12951) (not mapNonEmpty!28855) (not d!110793) (not b!894861) b_and!26145 (not b!894862) (not b!894839) (not bm!39712) (not b!894863) (not b!894835) (not d!110799) (not b!894836) (not bm!39713))
(check-sat b_and!26145 (not b_next!15859))
(get-model)

(declare-fun b!894882 () Bool)

(declare-fun e!499878 () Bool)

(declare-fun e!499879 () Bool)

(assert (=> b!894882 (= e!499878 e!499879)))

(declare-fun res!605524 () Bool)

(assert (=> b!894882 (=> (not res!605524) (not e!499879))))

(declare-fun e!499880 () Bool)

(assert (=> b!894882 (= res!605524 (not e!499880))))

(declare-fun res!605525 () Bool)

(assert (=> b!894882 (=> (not res!605525) (not e!499880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!894882 (= res!605525 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110807 () Bool)

(declare-fun res!605523 () Bool)

(assert (=> d!110807 (=> res!605523 e!499878)))

(assert (=> d!110807 (= res!605523 (bvsge #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110807 (= (arrayNoDuplicates!0 (_keys!10046 thiss!1181) #b00000000000000000000000000000000 Nil!17751) e!499878)))

(declare-fun b!894883 () Bool)

(declare-fun e!499881 () Bool)

(declare-fun call!39719 () Bool)

(assert (=> b!894883 (= e!499881 call!39719)))

(declare-fun b!894884 () Bool)

(assert (=> b!894884 (= e!499881 call!39719)))

(declare-fun b!894885 () Bool)

(declare-fun contains!4359 (List!17754 (_ BitVec 64)) Bool)

(assert (=> b!894885 (= e!499880 (contains!4359 Nil!17751 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39716 () Bool)

(declare-fun c!94549 () Bool)

(assert (=> bm!39716 (= call!39719 (arrayNoDuplicates!0 (_keys!10046 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94549 (Cons!17750 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) Nil!17751) Nil!17751)))))

(declare-fun b!894886 () Bool)

(assert (=> b!894886 (= e!499879 e!499881)))

(assert (=> b!894886 (= c!94549 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110807 (not res!605523)) b!894882))

(assert (= (and b!894882 res!605525) b!894885))

(assert (= (and b!894882 res!605524) b!894886))

(assert (= (and b!894886 c!94549) b!894883))

(assert (= (and b!894886 (not c!94549)) b!894884))

(assert (= (or b!894883 b!894884) bm!39716))

(declare-fun m!833311 () Bool)

(assert (=> b!894882 m!833311))

(assert (=> b!894882 m!833311))

(declare-fun m!833313 () Bool)

(assert (=> b!894882 m!833313))

(assert (=> b!894885 m!833311))

(assert (=> b!894885 m!833311))

(declare-fun m!833315 () Bool)

(assert (=> b!894885 m!833315))

(assert (=> bm!39716 m!833311))

(declare-fun m!833317 () Bool)

(assert (=> bm!39716 m!833317))

(assert (=> b!894886 m!833311))

(assert (=> b!894886 m!833311))

(assert (=> b!894886 m!833313))

(assert (=> b!894863 d!110807))

(declare-fun b!894899 () Bool)

(declare-fun e!499888 () SeekEntryResult!8820)

(assert (=> b!894899 (= e!499888 Undefined!8820)))

(declare-fun b!894900 () Bool)

(declare-fun e!499889 () SeekEntryResult!8820)

(declare-fun lt!404348 () SeekEntryResult!8820)

(assert (=> b!894900 (= e!499889 (ite ((_ is MissingVacant!8820) lt!404348) (MissingZero!8820 (index!37654 lt!404348)) lt!404348))))

(declare-fun lt!404350 () SeekEntryResult!8820)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52399 (_ BitVec 32)) SeekEntryResult!8820)

(assert (=> b!894900 (= lt!404348 (seekKeyOrZeroReturnVacant!0 (x!75970 lt!404350) (index!37653 lt!404350) (index!37653 lt!404350) key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!894901 () Bool)

(declare-fun e!499890 () SeekEntryResult!8820)

(assert (=> b!894901 (= e!499888 e!499890)))

(declare-fun lt!404351 () (_ BitVec 64))

(assert (=> b!894901 (= lt!404351 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37653 lt!404350)))))

(declare-fun c!94557 () Bool)

(assert (=> b!894901 (= c!94557 (= lt!404351 key!785))))

(declare-fun d!110809 () Bool)

(declare-fun lt!404349 () SeekEntryResult!8820)

(assert (=> d!110809 (and (or ((_ is MissingVacant!8820) lt!404349) (not ((_ is Found!8820) lt!404349)) (and (bvsge (index!37652 lt!404349) #b00000000000000000000000000000000) (bvslt (index!37652 lt!404349) (size!25644 (_keys!10046 thiss!1181))))) (not ((_ is MissingVacant!8820) lt!404349)) (or (not ((_ is Found!8820) lt!404349)) (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404349)) key!785)))))

(assert (=> d!110809 (= lt!404349 e!499888)))

(declare-fun c!94556 () Bool)

(assert (=> d!110809 (= c!94556 (and ((_ is Intermediate!8820) lt!404350) (undefined!9632 lt!404350)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52399 (_ BitVec 32)) SeekEntryResult!8820)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110809 (= lt!404350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25913 thiss!1181)) key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110809 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110809 (= (seekEntry!0 key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) lt!404349)))

(declare-fun b!894902 () Bool)

(assert (=> b!894902 (= e!499890 (Found!8820 (index!37653 lt!404350)))))

(declare-fun b!894903 () Bool)

(declare-fun c!94558 () Bool)

(assert (=> b!894903 (= c!94558 (= lt!404351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894903 (= e!499890 e!499889)))

(declare-fun b!894904 () Bool)

(assert (=> b!894904 (= e!499889 (MissingZero!8820 (index!37653 lt!404350)))))

(assert (= (and d!110809 c!94556) b!894899))

(assert (= (and d!110809 (not c!94556)) b!894901))

(assert (= (and b!894901 c!94557) b!894902))

(assert (= (and b!894901 (not c!94557)) b!894903))

(assert (= (and b!894903 c!94558) b!894904))

(assert (= (and b!894903 (not c!94558)) b!894900))

(declare-fun m!833319 () Bool)

(assert (=> b!894900 m!833319))

(declare-fun m!833321 () Bool)

(assert (=> b!894901 m!833321))

(declare-fun m!833323 () Bool)

(assert (=> d!110809 m!833323))

(declare-fun m!833325 () Bool)

(assert (=> d!110809 m!833325))

(assert (=> d!110809 m!833325))

(declare-fun m!833327 () Bool)

(assert (=> d!110809 m!833327))

(declare-fun m!833329 () Bool)

(assert (=> d!110809 m!833329))

(assert (=> b!894835 d!110809))

(declare-fun d!110811 () Bool)

(declare-fun e!499921 () Bool)

(assert (=> d!110811 e!499921))

(declare-fun res!605549 () Bool)

(assert (=> d!110811 (=> (not res!605549) (not e!499921))))

(assert (=> d!110811 (= res!605549 (or (bvsge #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))))

(declare-fun lt!404413 () ListLongMap!10633)

(declare-fun lt!404398 () ListLongMap!10633)

(assert (=> d!110811 (= lt!404413 lt!404398)))

(declare-fun lt!404402 () Unit!30424)

(declare-fun e!499923 () Unit!30424)

(assert (=> d!110811 (= lt!404402 e!499923)))

(declare-fun c!94573 () Bool)

(declare-fun e!499926 () Bool)

(assert (=> d!110811 (= c!94573 e!499926)))

(declare-fun res!605544 () Bool)

(assert (=> d!110811 (=> (not res!605544) (not e!499926))))

(assert (=> d!110811 (= res!605544 (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun e!499922 () ListLongMap!10633)

(assert (=> d!110811 (= lt!404398 e!499922)))

(declare-fun c!94574 () Bool)

(assert (=> d!110811 (= c!94574 (and (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!110811 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110811 (= (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) lt!404413)))

(declare-fun bm!39731 () Bool)

(declare-fun call!39740 () ListLongMap!10633)

(declare-fun call!39738 () ListLongMap!10633)

(assert (=> bm!39731 (= call!39740 call!39738)))

(declare-fun b!894947 () Bool)

(declare-fun e!499925 () Bool)

(declare-fun call!39734 () Bool)

(assert (=> b!894947 (= e!499925 (not call!39734))))

(declare-fun b!894948 () Bool)

(declare-fun e!499918 () Bool)

(declare-fun call!39736 () Bool)

(assert (=> b!894948 (= e!499918 (not call!39736))))

(declare-fun bm!39732 () Bool)

(declare-fun call!39739 () ListLongMap!10633)

(declare-fun getCurrentListMapNoExtraKeys!3320 (array!52399 array!52401 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 32) Int) ListLongMap!10633)

(assert (=> bm!39732 (= call!39739 (getCurrentListMapNoExtraKeys!3320 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun b!894949 () Bool)

(declare-fun e!499928 () Bool)

(assert (=> b!894949 (= e!499918 e!499928)))

(declare-fun res!605545 () Bool)

(assert (=> b!894949 (= res!605545 call!39736)))

(assert (=> b!894949 (=> (not res!605545) (not e!499928))))

(declare-fun b!894950 () Bool)

(declare-fun apply!404 (ListLongMap!10633 (_ BitVec 64)) V!29215)

(assert (=> b!894950 (= e!499928 (= (apply!404 lt!404413 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5126 thiss!1181)))))

(declare-fun b!894951 () Bool)

(declare-fun res!605552 () Bool)

(assert (=> b!894951 (=> (not res!605552) (not e!499921))))

(declare-fun e!499919 () Bool)

(assert (=> b!894951 (= res!605552 e!499919)))

(declare-fun res!605550 () Bool)

(assert (=> b!894951 (=> res!605550 e!499919)))

(declare-fun e!499920 () Bool)

(assert (=> b!894951 (= res!605550 (not e!499920))))

(declare-fun res!605546 () Bool)

(assert (=> b!894951 (=> (not res!605546) (not e!499920))))

(assert (=> b!894951 (= res!605546 (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun bm!39733 () Bool)

(assert (=> bm!39733 (= call!39736 (contains!4358 lt!404413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894952 () Bool)

(declare-fun e!499924 () ListLongMap!10633)

(assert (=> b!894952 (= e!499924 call!39740)))

(declare-fun b!894953 () Bool)

(declare-fun e!499929 () Bool)

(assert (=> b!894953 (= e!499919 e!499929)))

(declare-fun res!605548 () Bool)

(assert (=> b!894953 (=> (not res!605548) (not e!499929))))

(assert (=> b!894953 (= res!605548 (contains!4358 lt!404413 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!894953 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!894954 () Bool)

(declare-fun c!94572 () Bool)

(assert (=> b!894954 (= c!94572 (and (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!499917 () ListLongMap!10633)

(assert (=> b!894954 (= e!499917 e!499924)))

(declare-fun b!894955 () Bool)

(assert (=> b!894955 (= e!499921 e!499925)))

(declare-fun c!94575 () Bool)

(assert (=> b!894955 (= c!94575 (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39734 () Bool)

(assert (=> bm!39734 (= call!39734 (contains!4358 lt!404413 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894956 () Bool)

(assert (=> b!894956 (= e!499917 call!39740)))

(declare-fun b!894957 () Bool)

(declare-fun res!605551 () Bool)

(assert (=> b!894957 (=> (not res!605551) (not e!499921))))

(assert (=> b!894957 (= res!605551 e!499918)))

(declare-fun c!94571 () Bool)

(assert (=> b!894957 (= c!94571 (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39735 () Bool)

(declare-fun call!39735 () ListLongMap!10633)

(assert (=> bm!39735 (= call!39735 call!39739)))

(declare-fun b!894958 () Bool)

(declare-fun Unit!30428 () Unit!30424)

(assert (=> b!894958 (= e!499923 Unit!30428)))

(declare-fun b!894959 () Bool)

(assert (=> b!894959 (= e!499920 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39736 () Bool)

(declare-fun call!39737 () ListLongMap!10633)

(assert (=> bm!39736 (= call!39737 call!39735)))

(declare-fun b!894960 () Bool)

(assert (=> b!894960 (= e!499924 call!39737)))

(declare-fun b!894961 () Bool)

(declare-fun e!499927 () Bool)

(assert (=> b!894961 (= e!499925 e!499927)))

(declare-fun res!605547 () Bool)

(assert (=> b!894961 (= res!605547 call!39734)))

(assert (=> b!894961 (=> (not res!605547) (not e!499927))))

(declare-fun b!894962 () Bool)

(assert (=> b!894962 (= e!499927 (= (apply!404 lt!404413 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5126 thiss!1181)))))

(declare-fun b!894963 () Bool)

(assert (=> b!894963 (= e!499926 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894964 () Bool)

(declare-fun +!2599 (ListLongMap!10633 tuple2!11934) ListLongMap!10633)

(assert (=> b!894964 (= e!499922 (+!2599 call!39738 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))

(declare-fun b!894965 () Bool)

(assert (=> b!894965 (= e!499922 e!499917)))

(declare-fun c!94576 () Bool)

(assert (=> b!894965 (= c!94576 (and (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39737 () Bool)

(assert (=> bm!39737 (= call!39738 (+!2599 (ite c!94574 call!39739 (ite c!94576 call!39735 call!39737)) (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(declare-fun b!894966 () Bool)

(declare-fun get!13284 (ValueCell!8612 V!29215) V!29215)

(assert (=> b!894966 (= e!499929 (= (apply!404 lt!404413 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)) (get!13284 (select (arr!25199 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1315 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!894966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25645 (_values!5313 thiss!1181))))))

(assert (=> b!894966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!894967 () Bool)

(declare-fun lt!404406 () Unit!30424)

(assert (=> b!894967 (= e!499923 lt!404406)))

(declare-fun lt!404404 () ListLongMap!10633)

(assert (=> b!894967 (= lt!404404 (getCurrentListMapNoExtraKeys!3320 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun lt!404399 () (_ BitVec 64))

(assert (=> b!894967 (= lt!404399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404409 () (_ BitVec 64))

(assert (=> b!894967 (= lt!404409 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404401 () Unit!30424)

(declare-fun addStillContains!330 (ListLongMap!10633 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30424)

(assert (=> b!894967 (= lt!404401 (addStillContains!330 lt!404404 lt!404399 (zeroValue!5126 thiss!1181) lt!404409))))

(assert (=> b!894967 (contains!4358 (+!2599 lt!404404 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181))) lt!404409)))

(declare-fun lt!404415 () Unit!30424)

(assert (=> b!894967 (= lt!404415 lt!404401)))

(declare-fun lt!404405 () ListLongMap!10633)

(assert (=> b!894967 (= lt!404405 (getCurrentListMapNoExtraKeys!3320 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun lt!404414 () (_ BitVec 64))

(assert (=> b!894967 (= lt!404414 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404407 () (_ BitVec 64))

(assert (=> b!894967 (= lt!404407 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404396 () Unit!30424)

(declare-fun addApplyDifferent!330 (ListLongMap!10633 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30424)

(assert (=> b!894967 (= lt!404396 (addApplyDifferent!330 lt!404405 lt!404414 (minValue!5126 thiss!1181) lt!404407))))

(assert (=> b!894967 (= (apply!404 (+!2599 lt!404405 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181))) lt!404407) (apply!404 lt!404405 lt!404407))))

(declare-fun lt!404410 () Unit!30424)

(assert (=> b!894967 (= lt!404410 lt!404396)))

(declare-fun lt!404397 () ListLongMap!10633)

(assert (=> b!894967 (= lt!404397 (getCurrentListMapNoExtraKeys!3320 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun lt!404403 () (_ BitVec 64))

(assert (=> b!894967 (= lt!404403 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404416 () (_ BitVec 64))

(assert (=> b!894967 (= lt!404416 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404412 () Unit!30424)

(assert (=> b!894967 (= lt!404412 (addApplyDifferent!330 lt!404397 lt!404403 (zeroValue!5126 thiss!1181) lt!404416))))

(assert (=> b!894967 (= (apply!404 (+!2599 lt!404397 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181))) lt!404416) (apply!404 lt!404397 lt!404416))))

(declare-fun lt!404400 () Unit!30424)

(assert (=> b!894967 (= lt!404400 lt!404412)))

(declare-fun lt!404411 () ListLongMap!10633)

(assert (=> b!894967 (= lt!404411 (getCurrentListMapNoExtraKeys!3320 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun lt!404408 () (_ BitVec 64))

(assert (=> b!894967 (= lt!404408 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404417 () (_ BitVec 64))

(assert (=> b!894967 (= lt!404417 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894967 (= lt!404406 (addApplyDifferent!330 lt!404411 lt!404408 (minValue!5126 thiss!1181) lt!404417))))

(assert (=> b!894967 (= (apply!404 (+!2599 lt!404411 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181))) lt!404417) (apply!404 lt!404411 lt!404417))))

(assert (= (and d!110811 c!94574) b!894964))

(assert (= (and d!110811 (not c!94574)) b!894965))

(assert (= (and b!894965 c!94576) b!894956))

(assert (= (and b!894965 (not c!94576)) b!894954))

(assert (= (and b!894954 c!94572) b!894952))

(assert (= (and b!894954 (not c!94572)) b!894960))

(assert (= (or b!894952 b!894960) bm!39736))

(assert (= (or b!894956 bm!39736) bm!39735))

(assert (= (or b!894956 b!894952) bm!39731))

(assert (= (or b!894964 bm!39735) bm!39732))

(assert (= (or b!894964 bm!39731) bm!39737))

(assert (= (and d!110811 res!605544) b!894963))

(assert (= (and d!110811 c!94573) b!894967))

(assert (= (and d!110811 (not c!94573)) b!894958))

(assert (= (and d!110811 res!605549) b!894951))

(assert (= (and b!894951 res!605546) b!894959))

(assert (= (and b!894951 (not res!605550)) b!894953))

(assert (= (and b!894953 res!605548) b!894966))

(assert (= (and b!894951 res!605552) b!894957))

(assert (= (and b!894957 c!94571) b!894949))

(assert (= (and b!894957 (not c!94571)) b!894948))

(assert (= (and b!894949 res!605545) b!894950))

(assert (= (or b!894949 b!894948) bm!39733))

(assert (= (and b!894957 res!605551) b!894955))

(assert (= (and b!894955 c!94575) b!894961))

(assert (= (and b!894955 (not c!94575)) b!894947))

(assert (= (and b!894961 res!605547) b!894962))

(assert (= (or b!894961 b!894947) bm!39734))

(declare-fun b_lambda!12953 () Bool)

(assert (=> (not b_lambda!12953) (not b!894966)))

(declare-fun t!25079 () Bool)

(declare-fun tb!5175 () Bool)

(assert (=> (and b!894751 (= (defaultEntry!5326 thiss!1181) (defaultEntry!5326 thiss!1181)) t!25079) tb!5175))

(declare-fun result!10075 () Bool)

(assert (=> tb!5175 (= result!10075 tp_is_empty!18187)))

(assert (=> b!894966 t!25079))

(declare-fun b_and!26155 () Bool)

(assert (= b_and!26145 (and (=> t!25079 result!10075) b_and!26155)))

(declare-fun m!833331 () Bool)

(assert (=> bm!39732 m!833331))

(declare-fun m!833333 () Bool)

(assert (=> bm!39737 m!833333))

(assert (=> b!894959 m!833311))

(assert (=> b!894959 m!833311))

(assert (=> b!894959 m!833313))

(declare-fun m!833335 () Bool)

(assert (=> b!894962 m!833335))

(declare-fun m!833337 () Bool)

(assert (=> b!894950 m!833337))

(declare-fun m!833339 () Bool)

(assert (=> bm!39734 m!833339))

(assert (=> d!110811 m!833329))

(declare-fun m!833341 () Bool)

(assert (=> b!894964 m!833341))

(declare-fun m!833343 () Bool)

(assert (=> bm!39733 m!833343))

(assert (=> b!894963 m!833311))

(assert (=> b!894963 m!833311))

(assert (=> b!894963 m!833313))

(assert (=> b!894953 m!833311))

(assert (=> b!894953 m!833311))

(declare-fun m!833345 () Bool)

(assert (=> b!894953 m!833345))

(declare-fun m!833347 () Bool)

(assert (=> b!894966 m!833347))

(assert (=> b!894966 m!833311))

(declare-fun m!833349 () Bool)

(assert (=> b!894966 m!833349))

(assert (=> b!894966 m!833311))

(declare-fun m!833351 () Bool)

(assert (=> b!894966 m!833351))

(assert (=> b!894966 m!833351))

(assert (=> b!894966 m!833347))

(declare-fun m!833353 () Bool)

(assert (=> b!894966 m!833353))

(declare-fun m!833355 () Bool)

(assert (=> b!894967 m!833355))

(declare-fun m!833357 () Bool)

(assert (=> b!894967 m!833357))

(declare-fun m!833359 () Bool)

(assert (=> b!894967 m!833359))

(assert (=> b!894967 m!833357))

(declare-fun m!833361 () Bool)

(assert (=> b!894967 m!833361))

(assert (=> b!894967 m!833311))

(assert (=> b!894967 m!833331))

(declare-fun m!833363 () Bool)

(assert (=> b!894967 m!833363))

(declare-fun m!833365 () Bool)

(assert (=> b!894967 m!833365))

(declare-fun m!833367 () Bool)

(assert (=> b!894967 m!833367))

(declare-fun m!833369 () Bool)

(assert (=> b!894967 m!833369))

(declare-fun m!833371 () Bool)

(assert (=> b!894967 m!833371))

(declare-fun m!833373 () Bool)

(assert (=> b!894967 m!833373))

(declare-fun m!833375 () Bool)

(assert (=> b!894967 m!833375))

(assert (=> b!894967 m!833365))

(declare-fun m!833377 () Bool)

(assert (=> b!894967 m!833377))

(assert (=> b!894967 m!833355))

(declare-fun m!833379 () Bool)

(assert (=> b!894967 m!833379))

(assert (=> b!894967 m!833369))

(declare-fun m!833381 () Bool)

(assert (=> b!894967 m!833381))

(declare-fun m!833383 () Bool)

(assert (=> b!894967 m!833383))

(assert (=> d!110799 d!110811))

(declare-fun d!110813 () Bool)

(declare-fun e!499934 () Bool)

(assert (=> d!110813 e!499934))

(declare-fun res!605555 () Bool)

(assert (=> d!110813 (=> res!605555 e!499934)))

(declare-fun lt!404428 () Bool)

(assert (=> d!110813 (= res!605555 (not lt!404428))))

(declare-fun lt!404429 () Bool)

(assert (=> d!110813 (= lt!404428 lt!404429)))

(declare-fun lt!404426 () Unit!30424)

(declare-fun e!499935 () Unit!30424)

(assert (=> d!110813 (= lt!404426 e!499935)))

(declare-fun c!94579 () Bool)

(assert (=> d!110813 (= c!94579 lt!404429)))

(declare-fun containsKey!425 (List!17751 (_ BitVec 64)) Bool)

(assert (=> d!110813 (= lt!404429 (containsKey!425 (toList!5332 (map!12204 thiss!1181)) key!785))))

(assert (=> d!110813 (= (contains!4358 (map!12204 thiss!1181) key!785) lt!404428)))

(declare-fun b!894974 () Bool)

(declare-fun lt!404427 () Unit!30424)

(assert (=> b!894974 (= e!499935 lt!404427)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!319 (List!17751 (_ BitVec 64)) Unit!30424)

(assert (=> b!894974 (= lt!404427 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5332 (map!12204 thiss!1181)) key!785))))

(declare-fun isDefined!327 (Option!453) Bool)

(assert (=> b!894974 (isDefined!327 (getValueByKey!447 (toList!5332 (map!12204 thiss!1181)) key!785))))

(declare-fun b!894975 () Bool)

(declare-fun Unit!30429 () Unit!30424)

(assert (=> b!894975 (= e!499935 Unit!30429)))

(declare-fun b!894976 () Bool)

(assert (=> b!894976 (= e!499934 (isDefined!327 (getValueByKey!447 (toList!5332 (map!12204 thiss!1181)) key!785)))))

(assert (= (and d!110813 c!94579) b!894974))

(assert (= (and d!110813 (not c!94579)) b!894975))

(assert (= (and d!110813 (not res!605555)) b!894976))

(declare-fun m!833385 () Bool)

(assert (=> d!110813 m!833385))

(declare-fun m!833387 () Bool)

(assert (=> b!894974 m!833387))

(assert (=> b!894974 m!833233))

(assert (=> b!894974 m!833233))

(declare-fun m!833389 () Bool)

(assert (=> b!894974 m!833389))

(assert (=> b!894976 m!833233))

(assert (=> b!894976 m!833233))

(assert (=> b!894976 m!833389))

(assert (=> d!110793 d!110813))

(assert (=> d!110793 d!110799))

(assert (=> d!110793 d!110801))

(declare-fun d!110815 () Bool)

(declare-fun res!605565 () Bool)

(declare-fun e!499938 () Bool)

(assert (=> d!110815 (=> (not res!605565) (not e!499938))))

(assert (=> d!110815 (= res!605565 (validMask!0 (mask!25913 thiss!1181)))))

(assert (=> d!110815 (= (simpleValid!298 thiss!1181) e!499938)))

(declare-fun b!894986 () Bool)

(declare-fun res!605567 () Bool)

(assert (=> b!894986 (=> (not res!605567) (not e!499938))))

(declare-fun size!25650 (LongMapFixedSize!4240) (_ BitVec 32))

(assert (=> b!894986 (= res!605567 (bvsge (size!25650 thiss!1181) (_size!2175 thiss!1181)))))

(declare-fun b!894985 () Bool)

(declare-fun res!605566 () Bool)

(assert (=> b!894985 (=> (not res!605566) (not e!499938))))

(assert (=> b!894985 (= res!605566 (and (= (size!25645 (_values!5313 thiss!1181)) (bvadd (mask!25913 thiss!1181) #b00000000000000000000000000000001)) (= (size!25644 (_keys!10046 thiss!1181)) (size!25645 (_values!5313 thiss!1181))) (bvsge (_size!2175 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2175 thiss!1181) (bvadd (mask!25913 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!894987 () Bool)

(declare-fun res!605564 () Bool)

(assert (=> b!894987 (=> (not res!605564) (not e!499938))))

(assert (=> b!894987 (= res!605564 (= (size!25650 thiss!1181) (bvadd (_size!2175 thiss!1181) (bvsdiv (bvadd (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!894988 () Bool)

(assert (=> b!894988 (= e!499938 (and (bvsge (extraKeys!5022 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5022 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2175 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!110815 res!605565) b!894985))

(assert (= (and b!894985 res!605566) b!894986))

(assert (= (and b!894986 res!605567) b!894987))

(assert (= (and b!894987 res!605564) b!894988))

(assert (=> d!110815 m!833329))

(declare-fun m!833391 () Bool)

(assert (=> b!894986 m!833391))

(assert (=> b!894987 m!833391))

(assert (=> d!110801 d!110815))

(declare-fun b!894997 () Bool)

(declare-fun e!499944 () (_ BitVec 32))

(assert (=> b!894997 (= e!499944 #b00000000000000000000000000000000)))

(declare-fun b!894998 () Bool)

(declare-fun e!499943 () (_ BitVec 32))

(assert (=> b!894998 (= e!499944 e!499943)))

(declare-fun c!94585 () Bool)

(assert (=> b!894998 (= c!94585 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894999 () Bool)

(declare-fun call!39743 () (_ BitVec 32))

(assert (=> b!894999 (= e!499943 call!39743)))

(declare-fun d!110817 () Bool)

(declare-fun lt!404432 () (_ BitVec 32))

(assert (=> d!110817 (and (bvsge lt!404432 #b00000000000000000000000000000000) (bvsle lt!404432 (bvsub (size!25644 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110817 (= lt!404432 e!499944)))

(declare-fun c!94584 () Bool)

(assert (=> d!110817 (= c!94584 (bvsge #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110817 (and (bvsle #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25644 (_keys!10046 thiss!1181)) (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110817 (= (arrayCountValidKeys!0 (_keys!10046 thiss!1181) #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))) lt!404432)))

(declare-fun bm!39740 () Bool)

(assert (=> bm!39740 (= call!39743 (arrayCountValidKeys!0 (_keys!10046 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!895000 () Bool)

(assert (=> b!895000 (= e!499943 (bvadd #b00000000000000000000000000000001 call!39743))))

(assert (= (and d!110817 c!94584) b!894997))

(assert (= (and d!110817 (not c!94584)) b!894998))

(assert (= (and b!894998 c!94585) b!895000))

(assert (= (and b!894998 (not c!94585)) b!894999))

(assert (= (or b!895000 b!894999) bm!39740))

(assert (=> b!894998 m!833311))

(assert (=> b!894998 m!833311))

(assert (=> b!894998 m!833313))

(declare-fun m!833393 () Bool)

(assert (=> bm!39740 m!833393))

(assert (=> b!894861 d!110817))

(declare-fun d!110819 () Bool)

(assert (=> d!110819 (arrayContainsKey!0 (_keys!10046 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404435 () Unit!30424)

(declare-fun choose!13 (array!52399 (_ BitVec 64) (_ BitVec 32)) Unit!30424)

(assert (=> d!110819 (= lt!404435 (choose!13 (_keys!10046 thiss!1181) key!785 (index!37652 lt!404328)))))

(assert (=> d!110819 (bvsge (index!37652 lt!404328) #b00000000000000000000000000000000)))

(assert (=> d!110819 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10046 thiss!1181) key!785 (index!37652 lt!404328)) lt!404435)))

(declare-fun bs!25112 () Bool)

(assert (= bs!25112 d!110819))

(assert (=> bs!25112 m!833281))

(declare-fun m!833395 () Bool)

(assert (=> bs!25112 m!833395))

(assert (=> b!894839 d!110819))

(declare-fun d!110821 () Bool)

(declare-fun e!499947 () Bool)

(assert (=> d!110821 e!499947))

(declare-fun res!605570 () Bool)

(assert (=> d!110821 (=> (not res!605570) (not e!499947))))

(assert (=> d!110821 (= res!605570 (and (bvsge (index!37652 lt!404328) #b00000000000000000000000000000000) (bvslt (index!37652 lt!404328) (size!25644 (_keys!10046 thiss!1181)))))))

(declare-fun lt!404438 () Unit!30424)

(declare-fun choose!1475 (array!52399 array!52401 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 32) Int) Unit!30424)

(assert (=> d!110821 (= lt!404438 (choose!1475 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (index!37652 lt!404328) (defaultEntry!5326 thiss!1181)))))

(assert (=> d!110821 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110821 (= (lemmaValidKeyInArrayIsInListMap!238 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (index!37652 lt!404328) (defaultEntry!5326 thiss!1181)) lt!404438)))

(declare-fun b!895003 () Bool)

(assert (=> b!895003 (= e!499947 (contains!4358 (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328))))))

(assert (= (and d!110821 res!605570) b!895003))

(declare-fun m!833397 () Bool)

(assert (=> d!110821 m!833397))

(assert (=> d!110821 m!833329))

(assert (=> b!895003 m!833297))

(assert (=> b!895003 m!833277))

(assert (=> b!895003 m!833297))

(assert (=> b!895003 m!833277))

(declare-fun m!833399 () Bool)

(assert (=> b!895003 m!833399))

(assert (=> b!894839 d!110821))

(declare-fun bm!39743 () Bool)

(declare-fun call!39746 () Bool)

(assert (=> bm!39743 (= call!39746 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!895012 () Bool)

(declare-fun e!499955 () Bool)

(assert (=> b!895012 (= e!499955 call!39746)))

(declare-fun b!895013 () Bool)

(declare-fun e!499954 () Bool)

(assert (=> b!895013 (= e!499954 e!499955)))

(declare-fun lt!404447 () (_ BitVec 64))

(assert (=> b!895013 (= lt!404447 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404446 () Unit!30424)

(assert (=> b!895013 (= lt!404446 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10046 thiss!1181) lt!404447 #b00000000000000000000000000000000))))

(assert (=> b!895013 (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404447 #b00000000000000000000000000000000)))

(declare-fun lt!404445 () Unit!30424)

(assert (=> b!895013 (= lt!404445 lt!404446)))

(declare-fun res!605575 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52399 (_ BitVec 32)) SeekEntryResult!8820)

(assert (=> b!895013 (= res!605575 (= (seekEntryOrOpen!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) (Found!8820 #b00000000000000000000000000000000)))))

(assert (=> b!895013 (=> (not res!605575) (not e!499955))))

(declare-fun b!895014 () Bool)

(declare-fun e!499956 () Bool)

(assert (=> b!895014 (= e!499956 e!499954)))

(declare-fun c!94588 () Bool)

(assert (=> b!895014 (= c!94588 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110823 () Bool)

(declare-fun res!605576 () Bool)

(assert (=> d!110823 (=> res!605576 e!499956)))

(assert (=> d!110823 (= res!605576 (bvsge #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110823 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) e!499956)))

(declare-fun b!895015 () Bool)

(assert (=> b!895015 (= e!499954 call!39746)))

(assert (= (and d!110823 (not res!605576)) b!895014))

(assert (= (and b!895014 c!94588) b!895013))

(assert (= (and b!895014 (not c!94588)) b!895015))

(assert (= (and b!895013 res!605575) b!895012))

(assert (= (or b!895012 b!895015) bm!39743))

(declare-fun m!833401 () Bool)

(assert (=> bm!39743 m!833401))

(assert (=> b!895013 m!833311))

(declare-fun m!833403 () Bool)

(assert (=> b!895013 m!833403))

(declare-fun m!833405 () Bool)

(assert (=> b!895013 m!833405))

(assert (=> b!895013 m!833311))

(declare-fun m!833407 () Bool)

(assert (=> b!895013 m!833407))

(assert (=> b!895014 m!833311))

(assert (=> b!895014 m!833311))

(assert (=> b!895014 m!833313))

(assert (=> b!894862 d!110823))

(declare-fun b!895016 () Bool)

(declare-fun e!499957 () Option!453)

(assert (=> b!895016 (= e!499957 (Some!452 (_2!5978 (h!18885 (t!25070 (toList!5332 (map!12204 thiss!1181)))))))))

(declare-fun b!895019 () Bool)

(declare-fun e!499958 () Option!453)

(assert (=> b!895019 (= e!499958 None!451)))

(declare-fun b!895017 () Bool)

(assert (=> b!895017 (= e!499957 e!499958)))

(declare-fun c!94590 () Bool)

(assert (=> b!895017 (= c!94590 (and ((_ is Cons!17747) (t!25070 (toList!5332 (map!12204 thiss!1181)))) (not (= (_1!5978 (h!18885 (t!25070 (toList!5332 (map!12204 thiss!1181))))) key!785))))))

(declare-fun d!110825 () Bool)

(declare-fun c!94589 () Bool)

(assert (=> d!110825 (= c!94589 (and ((_ is Cons!17747) (t!25070 (toList!5332 (map!12204 thiss!1181)))) (= (_1!5978 (h!18885 (t!25070 (toList!5332 (map!12204 thiss!1181))))) key!785)))))

(assert (=> d!110825 (= (getValueByKey!447 (t!25070 (toList!5332 (map!12204 thiss!1181))) key!785) e!499957)))

(declare-fun b!895018 () Bool)

(assert (=> b!895018 (= e!499958 (getValueByKey!447 (t!25070 (t!25070 (toList!5332 (map!12204 thiss!1181)))) key!785))))

(assert (= (and d!110825 c!94589) b!895016))

(assert (= (and d!110825 (not c!94589)) b!895017))

(assert (= (and b!895017 c!94590) b!895018))

(assert (= (and b!895017 (not c!94590)) b!895019))

(declare-fun m!833409 () Bool)

(assert (=> b!895018 m!833409))

(assert (=> b!894853 d!110825))

(declare-fun d!110827 () Bool)

(declare-fun e!499959 () Bool)

(assert (=> d!110827 e!499959))

(declare-fun res!605577 () Bool)

(assert (=> d!110827 (=> res!605577 e!499959)))

(declare-fun lt!404450 () Bool)

(assert (=> d!110827 (= res!605577 (not lt!404450))))

(declare-fun lt!404451 () Bool)

(assert (=> d!110827 (= lt!404450 lt!404451)))

(declare-fun lt!404448 () Unit!30424)

(declare-fun e!499960 () Unit!30424)

(assert (=> d!110827 (= lt!404448 e!499960)))

(declare-fun c!94591 () Bool)

(assert (=> d!110827 (= c!94591 lt!404451)))

(assert (=> d!110827 (= lt!404451 (containsKey!425 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))

(assert (=> d!110827 (= (contains!4358 call!39714 (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)) lt!404450)))

(declare-fun b!895020 () Bool)

(declare-fun lt!404449 () Unit!30424)

(assert (=> b!895020 (= e!499960 lt!404449)))

(assert (=> b!895020 (= lt!404449 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))

(assert (=> b!895020 (isDefined!327 (getValueByKey!447 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))

(declare-fun b!895021 () Bool)

(declare-fun Unit!30430 () Unit!30424)

(assert (=> b!895021 (= e!499960 Unit!30430)))

(declare-fun b!895022 () Bool)

(assert (=> b!895022 (= e!499959 (isDefined!327 (getValueByKey!447 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785))))))

(assert (= (and d!110827 c!94591) b!895020))

(assert (= (and d!110827 (not c!94591)) b!895021))

(assert (= (and d!110827 (not res!605577)) b!895022))

(declare-fun m!833411 () Bool)

(assert (=> d!110827 m!833411))

(declare-fun m!833413 () Bool)

(assert (=> b!895020 m!833413))

(declare-fun m!833415 () Bool)

(assert (=> b!895020 m!833415))

(assert (=> b!895020 m!833415))

(declare-fun m!833417 () Bool)

(assert (=> b!895020 m!833417))

(assert (=> b!895022 m!833415))

(assert (=> b!895022 m!833415))

(assert (=> b!895022 m!833417))

(assert (=> bm!39713 d!110827))

(assert (=> bm!39711 d!110811))

(declare-fun d!110829 () Bool)

(declare-fun e!499963 () Bool)

(assert (=> d!110829 e!499963))

(declare-fun c!94594 () Bool)

(assert (=> d!110829 (= c!94594 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!404454 () Unit!30424)

(declare-fun choose!1476 (array!52399 array!52401 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 64) Int) Unit!30424)

(assert (=> d!110829 (= lt!404454 (choose!1476 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) key!785 (defaultEntry!5326 thiss!1181)))))

(assert (=> d!110829 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110829 (= (lemmaKeyInListMapIsInArray!166 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) key!785 (defaultEntry!5326 thiss!1181)) lt!404454)))

(declare-fun b!895027 () Bool)

(assert (=> b!895027 (= e!499963 (arrayContainsKey!0 (_keys!10046 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!895028 () Bool)

(assert (=> b!895028 (= e!499963 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110829 c!94594) b!895027))

(assert (= (and d!110829 (not c!94594)) b!895028))

(declare-fun m!833419 () Bool)

(assert (=> d!110829 m!833419))

(assert (=> d!110829 m!833329))

(assert (=> b!895027 m!833281))

(assert (=> b!894836 d!110829))

(assert (=> b!894836 d!110809))

(declare-fun bm!39744 () Bool)

(declare-fun call!39747 () Bool)

(assert (=> bm!39744 (= call!39747 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!404325 #b00000000000000000000000000000001) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!895029 () Bool)

(declare-fun e!499965 () Bool)

(assert (=> b!895029 (= e!499965 call!39747)))

(declare-fun b!895030 () Bool)

(declare-fun e!499964 () Bool)

(assert (=> b!895030 (= e!499964 e!499965)))

(declare-fun lt!404457 () (_ BitVec 64))

(assert (=> b!895030 (= lt!404457 (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325))))

(declare-fun lt!404456 () Unit!30424)

(assert (=> b!895030 (= lt!404456 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10046 thiss!1181) lt!404457 lt!404325))))

(assert (=> b!895030 (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404457 #b00000000000000000000000000000000)))

(declare-fun lt!404455 () Unit!30424)

(assert (=> b!895030 (= lt!404455 lt!404456)))

(declare-fun res!605578 () Bool)

(assert (=> b!895030 (= res!605578 (= (seekEntryOrOpen!0 (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) (Found!8820 lt!404325)))))

(assert (=> b!895030 (=> (not res!605578) (not e!499965))))

(declare-fun b!895031 () Bool)

(declare-fun e!499966 () Bool)

(assert (=> b!895031 (= e!499966 e!499964)))

(declare-fun c!94595 () Bool)

(assert (=> b!895031 (= c!94595 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325)))))

(declare-fun d!110831 () Bool)

(declare-fun res!605579 () Bool)

(assert (=> d!110831 (=> res!605579 e!499966)))

(assert (=> d!110831 (= res!605579 (bvsge lt!404325 (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110831 (= (arrayForallSeekEntryOrOpenFound!0 lt!404325 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) e!499966)))

(declare-fun b!895032 () Bool)

(assert (=> b!895032 (= e!499964 call!39747)))

(assert (= (and d!110831 (not res!605579)) b!895031))

(assert (= (and b!895031 c!94595) b!895030))

(assert (= (and b!895031 (not c!94595)) b!895032))

(assert (= (and b!895030 res!605578) b!895029))

(assert (= (or b!895029 b!895032) bm!39744))

(declare-fun m!833421 () Bool)

(assert (=> bm!39744 m!833421))

(declare-fun m!833423 () Bool)

(assert (=> b!895030 m!833423))

(declare-fun m!833425 () Bool)

(assert (=> b!895030 m!833425))

(declare-fun m!833427 () Bool)

(assert (=> b!895030 m!833427))

(assert (=> b!895030 m!833423))

(declare-fun m!833429 () Bool)

(assert (=> b!895030 m!833429))

(assert (=> b!895031 m!833423))

(assert (=> b!895031 m!833423))

(declare-fun m!833431 () Bool)

(assert (=> b!895031 m!833431))

(assert (=> b!894836 d!110831))

(declare-fun d!110833 () Bool)

(declare-fun lt!404463 () SeekEntryResult!8820)

(assert (=> d!110833 (and ((_ is Found!8820) lt!404463) (= (index!37652 lt!404463) lt!404325))))

(assert (=> d!110833 (= lt!404463 (seekEntry!0 key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun lt!404462 () Unit!30424)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!52399 (_ BitVec 32)) Unit!30424)

(assert (=> d!110833 (= lt!404462 (choose!0 key!785 lt!404325 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(assert (=> d!110833 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110833 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!404325 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) lt!404462)))

(declare-fun bs!25113 () Bool)

(assert (= bs!25113 d!110833))

(assert (=> bs!25113 m!833273))

(declare-fun m!833433 () Bool)

(assert (=> bs!25113 m!833433))

(assert (=> bs!25113 m!833329))

(assert (=> b!894836 d!110833))

(declare-fun d!110835 () Bool)

(declare-fun lt!404466 () (_ BitVec 32))

(assert (=> d!110835 (and (or (bvslt lt!404466 #b00000000000000000000000000000000) (bvsge lt!404466 (size!25644 (_keys!10046 thiss!1181))) (and (bvsge lt!404466 #b00000000000000000000000000000000) (bvslt lt!404466 (size!25644 (_keys!10046 thiss!1181))))) (bvsge lt!404466 #b00000000000000000000000000000000) (bvslt lt!404466 (size!25644 (_keys!10046 thiss!1181))) (= (select (arr!25198 (_keys!10046 thiss!1181)) lt!404466) key!785))))

(declare-fun e!499969 () (_ BitVec 32))

(assert (=> d!110835 (= lt!404466 e!499969)))

(declare-fun c!94598 () Bool)

(assert (=> d!110835 (= c!94598 (= (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))) (bvslt (size!25644 (_keys!10046 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110835 (= (arrayScanForKey!0 (_keys!10046 thiss!1181) key!785 #b00000000000000000000000000000000) lt!404466)))

(declare-fun b!895037 () Bool)

(assert (=> b!895037 (= e!499969 #b00000000000000000000000000000000)))

(declare-fun b!895038 () Bool)

(assert (=> b!895038 (= e!499969 (arrayScanForKey!0 (_keys!10046 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110835 c!94598) b!895037))

(assert (= (and d!110835 (not c!94598)) b!895038))

(declare-fun m!833435 () Bool)

(assert (=> d!110835 m!833435))

(assert (=> d!110835 m!833311))

(declare-fun m!833437 () Bool)

(assert (=> b!895038 m!833437))

(assert (=> b!894836 d!110835))

(declare-fun d!110837 () Bool)

(assert (=> d!110837 (arrayForallSeekEntryOrOpenFound!0 lt!404325 (_keys!10046 thiss!1181) (mask!25913 thiss!1181))))

(declare-fun lt!404469 () Unit!30424)

(declare-fun choose!38 (array!52399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30424)

(assert (=> d!110837 (= lt!404469 (choose!38 (_keys!10046 thiss!1181) (mask!25913 thiss!1181) #b00000000000000000000000000000000 lt!404325))))

(assert (=> d!110837 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110837 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10046 thiss!1181) (mask!25913 thiss!1181) #b00000000000000000000000000000000 lt!404325) lt!404469)))

(declare-fun bs!25114 () Bool)

(assert (= bs!25114 d!110837))

(assert (=> bs!25114 m!833293))

(declare-fun m!833439 () Bool)

(assert (=> bs!25114 m!833439))

(assert (=> bs!25114 m!833329))

(assert (=> b!894836 d!110837))

(declare-fun d!110839 () Bool)

(declare-fun res!605584 () Bool)

(declare-fun e!499974 () Bool)

(assert (=> d!110839 (=> res!605584 e!499974)))

(assert (=> d!110839 (= res!605584 (= (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110839 (= (arrayContainsKey!0 (_keys!10046 thiss!1181) key!785 #b00000000000000000000000000000000) e!499974)))

(declare-fun b!895043 () Bool)

(declare-fun e!499975 () Bool)

(assert (=> b!895043 (= e!499974 e!499975)))

(declare-fun res!605585 () Bool)

(assert (=> b!895043 (=> (not res!605585) (not e!499975))))

(assert (=> b!895043 (= res!605585 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!895044 () Bool)

(assert (=> b!895044 (= e!499975 (arrayContainsKey!0 (_keys!10046 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110839 (not res!605584)) b!895043))

(assert (= (and b!895043 res!605585) b!895044))

(assert (=> d!110839 m!833311))

(declare-fun m!833441 () Bool)

(assert (=> b!895044 m!833441))

(assert (=> bm!39712 d!110839))

(declare-fun b!895045 () Bool)

(declare-fun e!499977 () Bool)

(assert (=> b!895045 (= e!499977 tp_is_empty!18187)))

(declare-fun mapIsEmpty!28856 () Bool)

(declare-fun mapRes!28856 () Bool)

(assert (=> mapIsEmpty!28856 mapRes!28856))

(declare-fun mapNonEmpty!28856 () Bool)

(declare-fun tp!55574 () Bool)

(assert (=> mapNonEmpty!28856 (= mapRes!28856 (and tp!55574 e!499977))))

(declare-fun mapValue!28856 () ValueCell!8612)

(declare-fun mapRest!28856 () (Array (_ BitVec 32) ValueCell!8612))

(declare-fun mapKey!28856 () (_ BitVec 32))

(assert (=> mapNonEmpty!28856 (= mapRest!28855 (store mapRest!28856 mapKey!28856 mapValue!28856))))

(declare-fun condMapEmpty!28856 () Bool)

(declare-fun mapDefault!28856 () ValueCell!8612)

(assert (=> mapNonEmpty!28855 (= condMapEmpty!28856 (= mapRest!28855 ((as const (Array (_ BitVec 32) ValueCell!8612)) mapDefault!28856)))))

(declare-fun e!499976 () Bool)

(assert (=> mapNonEmpty!28855 (= tp!55573 (and e!499976 mapRes!28856))))

(declare-fun b!895046 () Bool)

(assert (=> b!895046 (= e!499976 tp_is_empty!18187)))

(assert (= (and mapNonEmpty!28855 condMapEmpty!28856) mapIsEmpty!28856))

(assert (= (and mapNonEmpty!28855 (not condMapEmpty!28856)) mapNonEmpty!28856))

(assert (= (and mapNonEmpty!28856 ((_ is ValueCellFull!8612) mapValue!28856)) b!895045))

(assert (= (and mapNonEmpty!28855 ((_ is ValueCellFull!8612) mapDefault!28856)) b!895046))

(declare-fun m!833443 () Bool)

(assert (=> mapNonEmpty!28856 m!833443))

(declare-fun b_lambda!12955 () Bool)

(assert (= b_lambda!12953 (or (and b!894751 b_free!15859) b_lambda!12955)))

(check-sat (not d!110809) (not b!895044) (not b!894987) tp_is_empty!18187 b_and!26155 (not b!894974) (not bm!39732) (not d!110829) (not d!110819) (not b!895038) (not bm!39743) (not b!894882) (not b_lambda!12955) (not bm!39740) (not bm!39716) (not d!110837) (not d!110833) (not bm!39737) (not b_next!15859) (not d!110813) (not b!894976) (not b!895013) (not b_lambda!12951) (not b!895027) (not b!894986) (not bm!39744) (not b!894967) (not b!894900) (not b!895014) (not b!894964) (not b!894950) (not b!895030) (not b!895003) (not b!895022) (not b!894998) (not b!894886) (not b!895018) (not b!894963) (not bm!39733) (not b!895020) (not d!110821) (not b!894966) (not d!110815) (not mapNonEmpty!28856) (not d!110811) (not b!895031) (not b!894959) (not d!110827) (not b!894962) (not b!894885) (not b!894953) (not bm!39734))
(check-sat b_and!26155 (not b_next!15859))
(get-model)

(declare-fun d!110841 () Bool)

(declare-fun e!499980 () Bool)

(assert (=> d!110841 e!499980))

(declare-fun res!605591 () Bool)

(assert (=> d!110841 (=> (not res!605591) (not e!499980))))

(declare-fun lt!404479 () ListLongMap!10633)

(assert (=> d!110841 (= res!605591 (contains!4358 lt!404479 (_1!5978 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(declare-fun lt!404478 () List!17751)

(assert (=> d!110841 (= lt!404479 (ListLongMap!10634 lt!404478))))

(declare-fun lt!404480 () Unit!30424)

(declare-fun lt!404481 () Unit!30424)

(assert (=> d!110841 (= lt!404480 lt!404481)))

(assert (=> d!110841 (= (getValueByKey!447 lt!404478 (_1!5978 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!248 (List!17751 (_ BitVec 64) V!29215) Unit!30424)

(assert (=> d!110841 (= lt!404481 (lemmaContainsTupThenGetReturnValue!248 lt!404478 (_1!5978 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(declare-fun insertStrictlySorted!305 (List!17751 (_ BitVec 64) V!29215) List!17751)

(assert (=> d!110841 (= lt!404478 (insertStrictlySorted!305 (toList!5332 call!39738) (_1!5978 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(assert (=> d!110841 (= (+!2599 call!39738 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))) lt!404479)))

(declare-fun b!895051 () Bool)

(declare-fun res!605590 () Bool)

(assert (=> b!895051 (=> (not res!605590) (not e!499980))))

(assert (=> b!895051 (= res!605590 (= (getValueByKey!447 (toList!5332 lt!404479) (_1!5978 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(declare-fun b!895052 () Bool)

(declare-fun contains!4360 (List!17751 tuple2!11934) Bool)

(assert (=> b!895052 (= e!499980 (contains!4360 (toList!5332 lt!404479) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))

(assert (= (and d!110841 res!605591) b!895051))

(assert (= (and b!895051 res!605590) b!895052))

(declare-fun m!833445 () Bool)

(assert (=> d!110841 m!833445))

(declare-fun m!833447 () Bool)

(assert (=> d!110841 m!833447))

(declare-fun m!833449 () Bool)

(assert (=> d!110841 m!833449))

(declare-fun m!833451 () Bool)

(assert (=> d!110841 m!833451))

(declare-fun m!833453 () Bool)

(assert (=> b!895051 m!833453))

(declare-fun m!833455 () Bool)

(assert (=> b!895052 m!833455))

(assert (=> b!894964 d!110841))

(declare-fun b!895053 () Bool)

(declare-fun e!499981 () Option!453)

(assert (=> b!895053 (= e!499981 (Some!452 (_2!5978 (h!18885 (t!25070 (t!25070 (toList!5332 (map!12204 thiss!1181))))))))))

(declare-fun b!895056 () Bool)

(declare-fun e!499982 () Option!453)

(assert (=> b!895056 (= e!499982 None!451)))

(declare-fun b!895054 () Bool)

(assert (=> b!895054 (= e!499981 e!499982)))

(declare-fun c!94600 () Bool)

(assert (=> b!895054 (= c!94600 (and ((_ is Cons!17747) (t!25070 (t!25070 (toList!5332 (map!12204 thiss!1181))))) (not (= (_1!5978 (h!18885 (t!25070 (t!25070 (toList!5332 (map!12204 thiss!1181)))))) key!785))))))

(declare-fun d!110843 () Bool)

(declare-fun c!94599 () Bool)

(assert (=> d!110843 (= c!94599 (and ((_ is Cons!17747) (t!25070 (t!25070 (toList!5332 (map!12204 thiss!1181))))) (= (_1!5978 (h!18885 (t!25070 (t!25070 (toList!5332 (map!12204 thiss!1181)))))) key!785)))))

(assert (=> d!110843 (= (getValueByKey!447 (t!25070 (t!25070 (toList!5332 (map!12204 thiss!1181)))) key!785) e!499981)))

(declare-fun b!895055 () Bool)

(assert (=> b!895055 (= e!499982 (getValueByKey!447 (t!25070 (t!25070 (t!25070 (toList!5332 (map!12204 thiss!1181))))) key!785))))

(assert (= (and d!110843 c!94599) b!895053))

(assert (= (and d!110843 (not c!94599)) b!895054))

(assert (= (and b!895054 c!94600) b!895055))

(assert (= (and b!895054 (not c!94600)) b!895056))

(declare-fun m!833457 () Bool)

(assert (=> b!895055 m!833457))

(assert (=> b!895018 d!110843))

(declare-fun d!110845 () Bool)

(declare-fun isEmpty!688 (Option!453) Bool)

(assert (=> d!110845 (= (isDefined!327 (getValueByKey!447 (toList!5332 (map!12204 thiss!1181)) key!785)) (not (isEmpty!688 (getValueByKey!447 (toList!5332 (map!12204 thiss!1181)) key!785))))))

(declare-fun bs!25115 () Bool)

(assert (= bs!25115 d!110845))

(assert (=> bs!25115 m!833233))

(declare-fun m!833459 () Bool)

(assert (=> bs!25115 m!833459))

(assert (=> b!894976 d!110845))

(assert (=> b!894976 d!110797))

(declare-fun d!110847 () Bool)

(declare-fun lt!404484 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!401 (List!17754) (InoxSet (_ BitVec 64)))

(assert (=> d!110847 (= lt!404484 (select (content!401 Nil!17751) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499987 () Bool)

(assert (=> d!110847 (= lt!404484 e!499987)))

(declare-fun res!605596 () Bool)

(assert (=> d!110847 (=> (not res!605596) (not e!499987))))

(assert (=> d!110847 (= res!605596 ((_ is Cons!17750) Nil!17751))))

(assert (=> d!110847 (= (contains!4359 Nil!17751 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)) lt!404484)))

(declare-fun b!895061 () Bool)

(declare-fun e!499988 () Bool)

(assert (=> b!895061 (= e!499987 e!499988)))

(declare-fun res!605597 () Bool)

(assert (=> b!895061 (=> res!605597 e!499988)))

(assert (=> b!895061 (= res!605597 (= (h!18888 Nil!17751) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895062 () Bool)

(assert (=> b!895062 (= e!499988 (contains!4359 (t!25077 Nil!17751) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110847 res!605596) b!895061))

(assert (= (and b!895061 (not res!605597)) b!895062))

(declare-fun m!833461 () Bool)

(assert (=> d!110847 m!833461))

(assert (=> d!110847 m!833311))

(declare-fun m!833463 () Bool)

(assert (=> d!110847 m!833463))

(assert (=> b!895062 m!833311))

(declare-fun m!833465 () Bool)

(assert (=> b!895062 m!833465))

(assert (=> b!894885 d!110847))

(declare-fun bm!39745 () Bool)

(declare-fun call!39748 () Bool)

(assert (=> bm!39745 (= call!39748 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!895063 () Bool)

(declare-fun e!499990 () Bool)

(assert (=> b!895063 (= e!499990 call!39748)))

(declare-fun b!895064 () Bool)

(declare-fun e!499989 () Bool)

(assert (=> b!895064 (= e!499989 e!499990)))

(declare-fun lt!404487 () (_ BitVec 64))

(assert (=> b!895064 (= lt!404487 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!404486 () Unit!30424)

(assert (=> b!895064 (= lt!404486 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10046 thiss!1181) lt!404487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!895064 (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404487 #b00000000000000000000000000000000)))

(declare-fun lt!404485 () Unit!30424)

(assert (=> b!895064 (= lt!404485 lt!404486)))

(declare-fun res!605598 () Bool)

(assert (=> b!895064 (= res!605598 (= (seekEntryOrOpen!0 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) (Found!8820 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!895064 (=> (not res!605598) (not e!499990))))

(declare-fun b!895065 () Bool)

(declare-fun e!499991 () Bool)

(assert (=> b!895065 (= e!499991 e!499989)))

(declare-fun c!94601 () Bool)

(assert (=> b!895065 (= c!94601 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!110849 () Bool)

(declare-fun res!605599 () Bool)

(assert (=> d!110849 (=> res!605599 e!499991)))

(assert (=> d!110849 (= res!605599 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110849 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) e!499991)))

(declare-fun b!895066 () Bool)

(assert (=> b!895066 (= e!499989 call!39748)))

(assert (= (and d!110849 (not res!605599)) b!895065))

(assert (= (and b!895065 c!94601) b!895064))

(assert (= (and b!895065 (not c!94601)) b!895066))

(assert (= (and b!895064 res!605598) b!895063))

(assert (= (or b!895063 b!895066) bm!39745))

(declare-fun m!833467 () Bool)

(assert (=> bm!39745 m!833467))

(declare-fun m!833469 () Bool)

(assert (=> b!895064 m!833469))

(declare-fun m!833471 () Bool)

(assert (=> b!895064 m!833471))

(declare-fun m!833473 () Bool)

(assert (=> b!895064 m!833473))

(assert (=> b!895064 m!833469))

(declare-fun m!833475 () Bool)

(assert (=> b!895064 m!833475))

(assert (=> b!895065 m!833469))

(assert (=> b!895065 m!833469))

(declare-fun m!833477 () Bool)

(assert (=> b!895065 m!833477))

(assert (=> bm!39743 d!110849))

(declare-fun b!895091 () Bool)

(declare-fun e!500011 () ListLongMap!10633)

(declare-fun call!39751 () ListLongMap!10633)

(assert (=> b!895091 (= e!500011 call!39751)))

(declare-fun b!895092 () Bool)

(declare-fun e!500012 () Bool)

(declare-fun e!500007 () Bool)

(assert (=> b!895092 (= e!500012 e!500007)))

(declare-fun c!94613 () Bool)

(assert (=> b!895092 (= c!94613 (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!895093 () Bool)

(declare-fun lt!404503 () Unit!30424)

(declare-fun lt!404507 () Unit!30424)

(assert (=> b!895093 (= lt!404503 lt!404507)))

(declare-fun lt!404504 () V!29215)

(declare-fun lt!404505 () ListLongMap!10633)

(declare-fun lt!404506 () (_ BitVec 64))

(declare-fun lt!404508 () (_ BitVec 64))

(assert (=> b!895093 (not (contains!4358 (+!2599 lt!404505 (tuple2!11935 lt!404508 lt!404504)) lt!404506))))

(declare-fun addStillNotContains!215 (ListLongMap!10633 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30424)

(assert (=> b!895093 (= lt!404507 (addStillNotContains!215 lt!404505 lt!404508 lt!404504 lt!404506))))

(assert (=> b!895093 (= lt!404506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!895093 (= lt!404504 (get!13284 (select (arr!25199 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1315 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!895093 (= lt!404508 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895093 (= lt!404505 call!39751)))

(assert (=> b!895093 (= e!500011 (+!2599 call!39751 (tuple2!11935 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) (get!13284 (select (arr!25199 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1315 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!895094 () Bool)

(declare-fun e!500010 () Bool)

(assert (=> b!895094 (= e!500010 e!500012)))

(declare-fun c!94612 () Bool)

(declare-fun e!500006 () Bool)

(assert (=> b!895094 (= c!94612 e!500006)))

(declare-fun res!605608 () Bool)

(assert (=> b!895094 (=> (not res!605608) (not e!500006))))

(assert (=> b!895094 (= res!605608 (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!895095 () Bool)

(declare-fun lt!404502 () ListLongMap!10633)

(declare-fun isEmpty!689 (ListLongMap!10633) Bool)

(assert (=> b!895095 (= e!500007 (isEmpty!689 lt!404502))))

(declare-fun b!895096 () Bool)

(declare-fun e!500008 () ListLongMap!10633)

(assert (=> b!895096 (= e!500008 e!500011)))

(declare-fun c!94611 () Bool)

(assert (=> b!895096 (= c!94611 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895097 () Bool)

(assert (=> b!895097 (= e!500006 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!895097 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!39748 () Bool)

(assert (=> bm!39748 (= call!39751 (getCurrentListMapNoExtraKeys!3320 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5326 thiss!1181)))))

(declare-fun b!895099 () Bool)

(assert (=> b!895099 (= e!500007 (= lt!404502 (getCurrentListMapNoExtraKeys!3320 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5326 thiss!1181))))))

(declare-fun b!895100 () Bool)

(declare-fun e!500009 () Bool)

(assert (=> b!895100 (= e!500012 e!500009)))

(assert (=> b!895100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun res!605611 () Bool)

(assert (=> b!895100 (= res!605611 (contains!4358 lt!404502 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!895100 (=> (not res!605611) (not e!500009))))

(declare-fun b!895101 () Bool)

(assert (=> b!895101 (= e!500008 (ListLongMap!10634 Nil!17748))))

(declare-fun b!895102 () Bool)

(declare-fun res!605610 () Bool)

(assert (=> b!895102 (=> (not res!605610) (not e!500010))))

(assert (=> b!895102 (= res!605610 (not (contains!4358 lt!404502 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!895098 () Bool)

(assert (=> b!895098 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> b!895098 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25645 (_values!5313 thiss!1181))))))

(assert (=> b!895098 (= e!500009 (= (apply!404 lt!404502 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)) (get!13284 (select (arr!25199 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1315 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!110851 () Bool)

(assert (=> d!110851 e!500010))

(declare-fun res!605609 () Bool)

(assert (=> d!110851 (=> (not res!605609) (not e!500010))))

(assert (=> d!110851 (= res!605609 (not (contains!4358 lt!404502 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!110851 (= lt!404502 e!500008)))

(declare-fun c!94610 () Bool)

(assert (=> d!110851 (= c!94610 (bvsge #b00000000000000000000000000000000 (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110851 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110851 (= (getCurrentListMapNoExtraKeys!3320 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) lt!404502)))

(assert (= (and d!110851 c!94610) b!895101))

(assert (= (and d!110851 (not c!94610)) b!895096))

(assert (= (and b!895096 c!94611) b!895093))

(assert (= (and b!895096 (not c!94611)) b!895091))

(assert (= (or b!895093 b!895091) bm!39748))

(assert (= (and d!110851 res!605609) b!895102))

(assert (= (and b!895102 res!605610) b!895094))

(assert (= (and b!895094 res!605608) b!895097))

(assert (= (and b!895094 c!94612) b!895100))

(assert (= (and b!895094 (not c!94612)) b!895092))

(assert (= (and b!895100 res!605611) b!895098))

(assert (= (and b!895092 c!94613) b!895099))

(assert (= (and b!895092 (not c!94613)) b!895095))

(declare-fun b_lambda!12957 () Bool)

(assert (=> (not b_lambda!12957) (not b!895093)))

(assert (=> b!895093 t!25079))

(declare-fun b_and!26157 () Bool)

(assert (= b_and!26155 (and (=> t!25079 result!10075) b_and!26157)))

(declare-fun b_lambda!12959 () Bool)

(assert (=> (not b_lambda!12959) (not b!895098)))

(assert (=> b!895098 t!25079))

(declare-fun b_and!26159 () Bool)

(assert (= b_and!26157 (and (=> t!25079 result!10075) b_and!26159)))

(assert (=> b!895093 m!833351))

(assert (=> b!895093 m!833347))

(assert (=> b!895093 m!833353))

(declare-fun m!833479 () Bool)

(assert (=> b!895093 m!833479))

(declare-fun m!833481 () Bool)

(assert (=> b!895093 m!833481))

(assert (=> b!895093 m!833311))

(assert (=> b!895093 m!833479))

(declare-fun m!833483 () Bool)

(assert (=> b!895093 m!833483))

(assert (=> b!895093 m!833347))

(assert (=> b!895093 m!833351))

(declare-fun m!833485 () Bool)

(assert (=> b!895093 m!833485))

(assert (=> b!895100 m!833311))

(assert (=> b!895100 m!833311))

(declare-fun m!833487 () Bool)

(assert (=> b!895100 m!833487))

(assert (=> b!895098 m!833351))

(assert (=> b!895098 m!833347))

(assert (=> b!895098 m!833353))

(assert (=> b!895098 m!833311))

(declare-fun m!833489 () Bool)

(assert (=> b!895098 m!833489))

(assert (=> b!895098 m!833311))

(assert (=> b!895098 m!833347))

(assert (=> b!895098 m!833351))

(declare-fun m!833491 () Bool)

(assert (=> b!895102 m!833491))

(declare-fun m!833493 () Bool)

(assert (=> b!895099 m!833493))

(assert (=> b!895096 m!833311))

(assert (=> b!895096 m!833311))

(assert (=> b!895096 m!833313))

(declare-fun m!833495 () Bool)

(assert (=> b!895095 m!833495))

(assert (=> bm!39748 m!833493))

(declare-fun m!833497 () Bool)

(assert (=> d!110851 m!833497))

(assert (=> d!110851 m!833329))

(assert (=> b!895097 m!833311))

(assert (=> b!895097 m!833311))

(assert (=> b!895097 m!833313))

(assert (=> bm!39732 d!110851))

(declare-fun b!895103 () Bool)

(declare-fun e!500013 () Bool)

(declare-fun e!500014 () Bool)

(assert (=> b!895103 (= e!500013 e!500014)))

(declare-fun res!605613 () Bool)

(assert (=> b!895103 (=> (not res!605613) (not e!500014))))

(declare-fun e!500015 () Bool)

(assert (=> b!895103 (= res!605613 (not e!500015))))

(declare-fun res!605614 () Bool)

(assert (=> b!895103 (=> (not res!605614) (not e!500015))))

(assert (=> b!895103 (= res!605614 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!110853 () Bool)

(declare-fun res!605612 () Bool)

(assert (=> d!110853 (=> res!605612 e!500013)))

(assert (=> d!110853 (= res!605612 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110853 (= (arrayNoDuplicates!0 (_keys!10046 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94549 (Cons!17750 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) Nil!17751) Nil!17751)) e!500013)))

(declare-fun b!895104 () Bool)

(declare-fun e!500016 () Bool)

(declare-fun call!39752 () Bool)

(assert (=> b!895104 (= e!500016 call!39752)))

(declare-fun b!895105 () Bool)

(assert (=> b!895105 (= e!500016 call!39752)))

(declare-fun b!895106 () Bool)

(assert (=> b!895106 (= e!500015 (contains!4359 (ite c!94549 (Cons!17750 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) Nil!17751) Nil!17751) (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!39749 () Bool)

(declare-fun c!94614 () Bool)

(assert (=> bm!39749 (= call!39752 (arrayNoDuplicates!0 (_keys!10046 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!94614 (Cons!17750 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!94549 (Cons!17750 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) Nil!17751) Nil!17751)) (ite c!94549 (Cons!17750 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) Nil!17751) Nil!17751))))))

(declare-fun b!895107 () Bool)

(assert (=> b!895107 (= e!500014 e!500016)))

(assert (=> b!895107 (= c!94614 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!110853 (not res!605612)) b!895103))

(assert (= (and b!895103 res!605614) b!895106))

(assert (= (and b!895103 res!605613) b!895107))

(assert (= (and b!895107 c!94614) b!895104))

(assert (= (and b!895107 (not c!94614)) b!895105))

(assert (= (or b!895104 b!895105) bm!39749))

(assert (=> b!895103 m!833469))

(assert (=> b!895103 m!833469))

(assert (=> b!895103 m!833477))

(assert (=> b!895106 m!833469))

(assert (=> b!895106 m!833469))

(declare-fun m!833499 () Bool)

(assert (=> b!895106 m!833499))

(assert (=> bm!39749 m!833469))

(declare-fun m!833501 () Bool)

(assert (=> bm!39749 m!833501))

(assert (=> b!895107 m!833469))

(assert (=> b!895107 m!833469))

(assert (=> b!895107 m!833477))

(assert (=> bm!39716 d!110853))

(declare-fun d!110855 () Bool)

(declare-fun e!500017 () Bool)

(assert (=> d!110855 e!500017))

(declare-fun res!605616 () Bool)

(assert (=> d!110855 (=> (not res!605616) (not e!500017))))

(declare-fun lt!404510 () ListLongMap!10633)

(assert (=> d!110855 (= res!605616 (contains!4358 lt!404510 (_1!5978 (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(declare-fun lt!404509 () List!17751)

(assert (=> d!110855 (= lt!404510 (ListLongMap!10634 lt!404509))))

(declare-fun lt!404511 () Unit!30424)

(declare-fun lt!404512 () Unit!30424)

(assert (=> d!110855 (= lt!404511 lt!404512)))

(assert (=> d!110855 (= (getValueByKey!447 lt!404509 (_1!5978 (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))) (Some!452 (_2!5978 (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(assert (=> d!110855 (= lt!404512 (lemmaContainsTupThenGetReturnValue!248 lt!404509 (_1!5978 (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) (_2!5978 (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(assert (=> d!110855 (= lt!404509 (insertStrictlySorted!305 (toList!5332 (ite c!94574 call!39739 (ite c!94576 call!39735 call!39737))) (_1!5978 (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) (_2!5978 (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(assert (=> d!110855 (= (+!2599 (ite c!94574 call!39739 (ite c!94576 call!39735 call!39737)) (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) lt!404510)))

(declare-fun b!895108 () Bool)

(declare-fun res!605615 () Bool)

(assert (=> b!895108 (=> (not res!605615) (not e!500017))))

(assert (=> b!895108 (= res!605615 (= (getValueByKey!447 (toList!5332 lt!404510) (_1!5978 (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))) (Some!452 (_2!5978 (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))))

(declare-fun b!895109 () Bool)

(assert (=> b!895109 (= e!500017 (contains!4360 (toList!5332 lt!404510) (ite (or c!94574 c!94576) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(assert (= (and d!110855 res!605616) b!895108))

(assert (= (and b!895108 res!605615) b!895109))

(declare-fun m!833503 () Bool)

(assert (=> d!110855 m!833503))

(declare-fun m!833505 () Bool)

(assert (=> d!110855 m!833505))

(declare-fun m!833507 () Bool)

(assert (=> d!110855 m!833507))

(declare-fun m!833509 () Bool)

(assert (=> d!110855 m!833509))

(declare-fun m!833511 () Bool)

(assert (=> b!895108 m!833511))

(declare-fun m!833513 () Bool)

(assert (=> b!895109 m!833513))

(assert (=> bm!39737 d!110855))

(declare-fun d!110857 () Bool)

(assert (=> d!110857 (= (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!894882 d!110857))

(declare-fun d!110859 () Bool)

(assert (=> d!110859 (= (apply!404 lt!404413 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13281 (getValueByKey!447 (toList!5332 lt!404413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25116 () Bool)

(assert (= bs!25116 d!110859))

(declare-fun m!833515 () Bool)

(assert (=> bs!25116 m!833515))

(assert (=> bs!25116 m!833515))

(declare-fun m!833517 () Bool)

(assert (=> bs!25116 m!833517))

(assert (=> b!894962 d!110859))

(declare-fun d!110861 () Bool)

(assert (=> d!110861 (isDefined!327 (getValueByKey!447 (toList!5332 (map!12204 thiss!1181)) key!785))))

(declare-fun lt!404515 () Unit!30424)

(declare-fun choose!1477 (List!17751 (_ BitVec 64)) Unit!30424)

(assert (=> d!110861 (= lt!404515 (choose!1477 (toList!5332 (map!12204 thiss!1181)) key!785))))

(declare-fun e!500020 () Bool)

(assert (=> d!110861 e!500020))

(declare-fun res!605619 () Bool)

(assert (=> d!110861 (=> (not res!605619) (not e!500020))))

(declare-fun isStrictlySorted!484 (List!17751) Bool)

(assert (=> d!110861 (= res!605619 (isStrictlySorted!484 (toList!5332 (map!12204 thiss!1181))))))

(assert (=> d!110861 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5332 (map!12204 thiss!1181)) key!785) lt!404515)))

(declare-fun b!895112 () Bool)

(assert (=> b!895112 (= e!500020 (containsKey!425 (toList!5332 (map!12204 thiss!1181)) key!785))))

(assert (= (and d!110861 res!605619) b!895112))

(assert (=> d!110861 m!833233))

(assert (=> d!110861 m!833233))

(assert (=> d!110861 m!833389))

(declare-fun m!833519 () Bool)

(assert (=> d!110861 m!833519))

(declare-fun m!833521 () Bool)

(assert (=> d!110861 m!833521))

(assert (=> b!895112 m!833385))

(assert (=> b!894974 d!110861))

(assert (=> b!894974 d!110845))

(assert (=> b!894974 d!110797))

(declare-fun b!895125 () Bool)

(declare-fun e!500027 () SeekEntryResult!8820)

(assert (=> b!895125 (= e!500027 (MissingVacant!8820 (index!37653 lt!404350)))))

(declare-fun b!895126 () Bool)

(declare-fun e!500028 () SeekEntryResult!8820)

(assert (=> b!895126 (= e!500028 Undefined!8820)))

(declare-fun b!895128 () Bool)

(declare-fun e!500029 () SeekEntryResult!8820)

(assert (=> b!895128 (= e!500028 e!500029)))

(declare-fun c!94622 () Bool)

(declare-fun lt!404521 () (_ BitVec 64))

(assert (=> b!895128 (= c!94622 (= lt!404521 key!785))))

(declare-fun b!895129 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895129 (= e!500027 (seekKeyOrZeroReturnVacant!0 (bvadd (x!75970 lt!404350) #b00000000000000000000000000000001) (nextIndex!0 (index!37653 lt!404350) (bvadd (x!75970 lt!404350) #b00000000000000000000000000000001) (mask!25913 thiss!1181)) (index!37653 lt!404350) key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!895130 () Bool)

(assert (=> b!895130 (= e!500029 (Found!8820 (index!37653 lt!404350)))))

(declare-fun lt!404520 () SeekEntryResult!8820)

(declare-fun d!110863 () Bool)

(assert (=> d!110863 (and (or ((_ is Undefined!8820) lt!404520) (not ((_ is Found!8820) lt!404520)) (and (bvsge (index!37652 lt!404520) #b00000000000000000000000000000000) (bvslt (index!37652 lt!404520) (size!25644 (_keys!10046 thiss!1181))))) (or ((_ is Undefined!8820) lt!404520) ((_ is Found!8820) lt!404520) (not ((_ is MissingVacant!8820) lt!404520)) (not (= (index!37654 lt!404520) (index!37653 lt!404350))) (and (bvsge (index!37654 lt!404520) #b00000000000000000000000000000000) (bvslt (index!37654 lt!404520) (size!25644 (_keys!10046 thiss!1181))))) (or ((_ is Undefined!8820) lt!404520) (ite ((_ is Found!8820) lt!404520) (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404520)) key!785) (and ((_ is MissingVacant!8820) lt!404520) (= (index!37654 lt!404520) (index!37653 lt!404350)) (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37654 lt!404520)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110863 (= lt!404520 e!500028)))

(declare-fun c!94621 () Bool)

(assert (=> d!110863 (= c!94621 (bvsge (x!75970 lt!404350) #b01111111111111111111111111111110))))

(assert (=> d!110863 (= lt!404521 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37653 lt!404350)))))

(assert (=> d!110863 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110863 (= (seekKeyOrZeroReturnVacant!0 (x!75970 lt!404350) (index!37653 lt!404350) (index!37653 lt!404350) key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) lt!404520)))

(declare-fun b!895127 () Bool)

(declare-fun c!94623 () Bool)

(assert (=> b!895127 (= c!94623 (= lt!404521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895127 (= e!500029 e!500027)))

(assert (= (and d!110863 c!94621) b!895126))

(assert (= (and d!110863 (not c!94621)) b!895128))

(assert (= (and b!895128 c!94622) b!895130))

(assert (= (and b!895128 (not c!94622)) b!895127))

(assert (= (and b!895127 c!94623) b!895125))

(assert (= (and b!895127 (not c!94623)) b!895129))

(declare-fun m!833523 () Bool)

(assert (=> b!895129 m!833523))

(assert (=> b!895129 m!833523))

(declare-fun m!833525 () Bool)

(assert (=> b!895129 m!833525))

(declare-fun m!833527 () Bool)

(assert (=> d!110863 m!833527))

(declare-fun m!833529 () Bool)

(assert (=> d!110863 m!833529))

(assert (=> d!110863 m!833321))

(assert (=> d!110863 m!833329))

(assert (=> b!894900 d!110863))

(assert (=> d!110833 d!110809))

(declare-fun d!110865 () Bool)

(declare-fun lt!404524 () SeekEntryResult!8820)

(assert (=> d!110865 (and ((_ is Found!8820) lt!404524) (= (index!37652 lt!404524) lt!404325))))

(assert (=> d!110865 (= lt!404524 (seekEntry!0 key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(assert (=> d!110865 true))

(declare-fun _$57!22 () Unit!30424)

(assert (=> d!110865 (= (choose!0 key!785 lt!404325 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) _$57!22)))

(declare-fun bs!25117 () Bool)

(assert (= bs!25117 d!110865))

(assert (=> bs!25117 m!833273))

(assert (=> d!110833 d!110865))

(declare-fun d!110867 () Bool)

(assert (=> d!110867 (= (validMask!0 (mask!25913 thiss!1181)) (and (or (= (mask!25913 thiss!1181) #b00000000000000000000000000000111) (= (mask!25913 thiss!1181) #b00000000000000000000000000001111) (= (mask!25913 thiss!1181) #b00000000000000000000000000011111) (= (mask!25913 thiss!1181) #b00000000000000000000000000111111) (= (mask!25913 thiss!1181) #b00000000000000000000000001111111) (= (mask!25913 thiss!1181) #b00000000000000000000000011111111) (= (mask!25913 thiss!1181) #b00000000000000000000000111111111) (= (mask!25913 thiss!1181) #b00000000000000000000001111111111) (= (mask!25913 thiss!1181) #b00000000000000000000011111111111) (= (mask!25913 thiss!1181) #b00000000000000000000111111111111) (= (mask!25913 thiss!1181) #b00000000000000000001111111111111) (= (mask!25913 thiss!1181) #b00000000000000000011111111111111) (= (mask!25913 thiss!1181) #b00000000000000000111111111111111) (= (mask!25913 thiss!1181) #b00000000000000001111111111111111) (= (mask!25913 thiss!1181) #b00000000000000011111111111111111) (= (mask!25913 thiss!1181) #b00000000000000111111111111111111) (= (mask!25913 thiss!1181) #b00000000000001111111111111111111) (= (mask!25913 thiss!1181) #b00000000000011111111111111111111) (= (mask!25913 thiss!1181) #b00000000000111111111111111111111) (= (mask!25913 thiss!1181) #b00000000001111111111111111111111) (= (mask!25913 thiss!1181) #b00000000011111111111111111111111) (= (mask!25913 thiss!1181) #b00000000111111111111111111111111) (= (mask!25913 thiss!1181) #b00000001111111111111111111111111) (= (mask!25913 thiss!1181) #b00000011111111111111111111111111) (= (mask!25913 thiss!1181) #b00000111111111111111111111111111) (= (mask!25913 thiss!1181) #b00001111111111111111111111111111) (= (mask!25913 thiss!1181) #b00011111111111111111111111111111) (= (mask!25913 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25913 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> d!110833 d!110867))

(assert (=> d!110819 d!110839))

(declare-fun d!110869 () Bool)

(assert (=> d!110869 (arrayContainsKey!0 (_keys!10046 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110869 true))

(declare-fun _$60!403 () Unit!30424)

(assert (=> d!110869 (= (choose!13 (_keys!10046 thiss!1181) key!785 (index!37652 lt!404328)) _$60!403)))

(declare-fun bs!25118 () Bool)

(assert (= bs!25118 d!110869))

(assert (=> bs!25118 m!833281))

(assert (=> d!110819 d!110869))

(assert (=> b!894963 d!110857))

(assert (=> d!110837 d!110831))

(declare-fun d!110871 () Bool)

(assert (=> d!110871 (arrayForallSeekEntryOrOpenFound!0 lt!404325 (_keys!10046 thiss!1181) (mask!25913 thiss!1181))))

(assert (=> d!110871 true))

(declare-fun _$72!116 () Unit!30424)

(assert (=> d!110871 (= (choose!38 (_keys!10046 thiss!1181) (mask!25913 thiss!1181) #b00000000000000000000000000000000 lt!404325) _$72!116)))

(declare-fun bs!25119 () Bool)

(assert (= bs!25119 d!110871))

(assert (=> bs!25119 m!833293))

(assert (=> d!110837 d!110871))

(assert (=> d!110837 d!110867))

(declare-fun d!110873 () Bool)

(assert (=> d!110873 (= (size!25650 thiss!1181) (bvadd (_size!2175 thiss!1181) (bvsdiv (bvadd (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!894987 d!110873))

(declare-fun d!110875 () Bool)

(assert (=> d!110875 (= (isDefined!327 (getValueByKey!447 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785))) (not (isEmpty!688 (getValueByKey!447 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))))

(declare-fun bs!25120 () Bool)

(assert (= bs!25120 d!110875))

(assert (=> bs!25120 m!833415))

(declare-fun m!833531 () Bool)

(assert (=> bs!25120 m!833531))

(assert (=> b!895022 d!110875))

(declare-fun b!895131 () Bool)

(declare-fun e!500030 () Option!453)

(assert (=> b!895131 (= e!500030 (Some!452 (_2!5978 (h!18885 (toList!5332 call!39714)))))))

(declare-fun b!895134 () Bool)

(declare-fun e!500031 () Option!453)

(assert (=> b!895134 (= e!500031 None!451)))

(declare-fun b!895132 () Bool)

(assert (=> b!895132 (= e!500030 e!500031)))

(declare-fun c!94625 () Bool)

(assert (=> b!895132 (= c!94625 (and ((_ is Cons!17747) (toList!5332 call!39714)) (not (= (_1!5978 (h!18885 (toList!5332 call!39714))) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))))

(declare-fun d!110877 () Bool)

(declare-fun c!94624 () Bool)

(assert (=> d!110877 (= c!94624 (and ((_ is Cons!17747) (toList!5332 call!39714)) (= (_1!5978 (h!18885 (toList!5332 call!39714))) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785))))))

(assert (=> d!110877 (= (getValueByKey!447 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)) e!500030)))

(declare-fun b!895133 () Bool)

(assert (=> b!895133 (= e!500031 (getValueByKey!447 (t!25070 (toList!5332 call!39714)) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))

(assert (= (and d!110877 c!94624) b!895131))

(assert (= (and d!110877 (not c!94624)) b!895132))

(assert (= (and b!895132 c!94625) b!895133))

(assert (= (and b!895132 (not c!94625)) b!895134))

(declare-fun m!833533 () Bool)

(assert (=> b!895133 m!833533))

(assert (=> b!895022 d!110877))

(assert (=> d!110811 d!110867))

(assert (=> b!894998 d!110857))

(declare-fun d!110879 () Bool)

(assert (=> d!110879 (isDefined!327 (getValueByKey!447 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))

(declare-fun lt!404525 () Unit!30424)

(assert (=> d!110879 (= lt!404525 (choose!1477 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))

(declare-fun e!500032 () Bool)

(assert (=> d!110879 e!500032))

(declare-fun res!605620 () Bool)

(assert (=> d!110879 (=> (not res!605620) (not e!500032))))

(assert (=> d!110879 (= res!605620 (isStrictlySorted!484 (toList!5332 call!39714)))))

(assert (=> d!110879 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)) lt!404525)))

(declare-fun b!895135 () Bool)

(assert (=> b!895135 (= e!500032 (containsKey!425 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))

(assert (= (and d!110879 res!605620) b!895135))

(assert (=> d!110879 m!833415))

(assert (=> d!110879 m!833415))

(assert (=> d!110879 m!833417))

(declare-fun m!833535 () Bool)

(assert (=> d!110879 m!833535))

(declare-fun m!833537 () Bool)

(assert (=> d!110879 m!833537))

(assert (=> b!895135 m!833411))

(assert (=> b!895020 d!110879))

(assert (=> b!895020 d!110875))

(assert (=> b!895020 d!110877))

(declare-fun d!110881 () Bool)

(declare-fun lt!404526 () (_ BitVec 32))

(assert (=> d!110881 (and (or (bvslt lt!404526 #b00000000000000000000000000000000) (bvsge lt!404526 (size!25644 (_keys!10046 thiss!1181))) (and (bvsge lt!404526 #b00000000000000000000000000000000) (bvslt lt!404526 (size!25644 (_keys!10046 thiss!1181))))) (bvsge lt!404526 #b00000000000000000000000000000000) (bvslt lt!404526 (size!25644 (_keys!10046 thiss!1181))) (= (select (arr!25198 (_keys!10046 thiss!1181)) lt!404526) key!785))))

(declare-fun e!500033 () (_ BitVec 32))

(assert (=> d!110881 (= lt!404526 e!500033)))

(declare-fun c!94626 () Bool)

(assert (=> d!110881 (= c!94626 (= (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110881 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))) (bvslt (size!25644 (_keys!10046 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110881 (= (arrayScanForKey!0 (_keys!10046 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!404526)))

(declare-fun b!895136 () Bool)

(assert (=> b!895136 (= e!500033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!895137 () Bool)

(assert (=> b!895137 (= e!500033 (arrayScanForKey!0 (_keys!10046 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110881 c!94626) b!895136))

(assert (= (and d!110881 (not c!94626)) b!895137))

(declare-fun m!833539 () Bool)

(assert (=> d!110881 m!833539))

(assert (=> d!110881 m!833469))

(declare-fun m!833541 () Bool)

(assert (=> b!895137 m!833541))

(assert (=> b!895038 d!110881))

(declare-fun b!895138 () Bool)

(declare-fun e!500035 () (_ BitVec 32))

(assert (=> b!895138 (= e!500035 #b00000000000000000000000000000000)))

(declare-fun b!895139 () Bool)

(declare-fun e!500034 () (_ BitVec 32))

(assert (=> b!895139 (= e!500035 e!500034)))

(declare-fun c!94628 () Bool)

(assert (=> b!895139 (= c!94628 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!895140 () Bool)

(declare-fun call!39753 () (_ BitVec 32))

(assert (=> b!895140 (= e!500034 call!39753)))

(declare-fun d!110883 () Bool)

(declare-fun lt!404527 () (_ BitVec 32))

(assert (=> d!110883 (and (bvsge lt!404527 #b00000000000000000000000000000000) (bvsle lt!404527 (bvsub (size!25644 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!110883 (= lt!404527 e!500035)))

(declare-fun c!94627 () Bool)

(assert (=> d!110883 (= c!94627 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110883 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!25644 (_keys!10046 thiss!1181)) (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110883 (= (arrayCountValidKeys!0 (_keys!10046 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))) lt!404527)))

(declare-fun bm!39750 () Bool)

(assert (=> bm!39750 (= call!39753 (arrayCountValidKeys!0 (_keys!10046 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!895141 () Bool)

(assert (=> b!895141 (= e!500034 (bvadd #b00000000000000000000000000000001 call!39753))))

(assert (= (and d!110883 c!94627) b!895138))

(assert (= (and d!110883 (not c!94627)) b!895139))

(assert (= (and b!895139 c!94628) b!895141))

(assert (= (and b!895139 (not c!94628)) b!895140))

(assert (= (or b!895141 b!895140) bm!39750))

(assert (=> b!895139 m!833469))

(assert (=> b!895139 m!833469))

(assert (=> b!895139 m!833477))

(declare-fun m!833543 () Bool)

(assert (=> bm!39750 m!833543))

(assert (=> bm!39740 d!110883))

(assert (=> b!894959 d!110857))

(declare-fun d!110885 () Bool)

(declare-fun res!605621 () Bool)

(declare-fun e!500036 () Bool)

(assert (=> d!110885 (=> res!605621 e!500036)))

(assert (=> d!110885 (= res!605621 (= (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110885 (= (arrayContainsKey!0 (_keys!10046 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!500036)))

(declare-fun b!895142 () Bool)

(declare-fun e!500037 () Bool)

(assert (=> b!895142 (= e!500036 e!500037)))

(declare-fun res!605622 () Bool)

(assert (=> b!895142 (=> (not res!605622) (not e!500037))))

(assert (=> b!895142 (= res!605622 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!895143 () Bool)

(assert (=> b!895143 (= e!500037 (arrayContainsKey!0 (_keys!10046 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110885 (not res!605621)) b!895142))

(assert (= (and b!895142 res!605622) b!895143))

(assert (=> d!110885 m!833469))

(declare-fun m!833545 () Bool)

(assert (=> b!895143 m!833545))

(assert (=> b!895044 d!110885))

(assert (=> b!894986 d!110873))

(declare-fun d!110887 () Bool)

(declare-fun e!500038 () Bool)

(assert (=> d!110887 e!500038))

(declare-fun res!605623 () Bool)

(assert (=> d!110887 (=> res!605623 e!500038)))

(declare-fun lt!404530 () Bool)

(assert (=> d!110887 (= res!605623 (not lt!404530))))

(declare-fun lt!404531 () Bool)

(assert (=> d!110887 (= lt!404530 lt!404531)))

(declare-fun lt!404528 () Unit!30424)

(declare-fun e!500039 () Unit!30424)

(assert (=> d!110887 (= lt!404528 e!500039)))

(declare-fun c!94629 () Bool)

(assert (=> d!110887 (= c!94629 lt!404531)))

(assert (=> d!110887 (= lt!404531 (containsKey!425 (toList!5332 lt!404413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110887 (= (contains!4358 lt!404413 #b1000000000000000000000000000000000000000000000000000000000000000) lt!404530)))

(declare-fun b!895144 () Bool)

(declare-fun lt!404529 () Unit!30424)

(assert (=> b!895144 (= e!500039 lt!404529)))

(assert (=> b!895144 (= lt!404529 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5332 lt!404413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895144 (isDefined!327 (getValueByKey!447 (toList!5332 lt!404413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!895145 () Bool)

(declare-fun Unit!30431 () Unit!30424)

(assert (=> b!895145 (= e!500039 Unit!30431)))

(declare-fun b!895146 () Bool)

(assert (=> b!895146 (= e!500038 (isDefined!327 (getValueByKey!447 (toList!5332 lt!404413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110887 c!94629) b!895144))

(assert (= (and d!110887 (not c!94629)) b!895145))

(assert (= (and d!110887 (not res!605623)) b!895146))

(declare-fun m!833547 () Bool)

(assert (=> d!110887 m!833547))

(declare-fun m!833549 () Bool)

(assert (=> b!895144 m!833549))

(assert (=> b!895144 m!833515))

(assert (=> b!895144 m!833515))

(declare-fun m!833551 () Bool)

(assert (=> b!895144 m!833551))

(assert (=> b!895146 m!833515))

(assert (=> b!895146 m!833515))

(assert (=> b!895146 m!833551))

(assert (=> bm!39734 d!110887))

(declare-fun d!110889 () Bool)

(assert (=> d!110889 (contains!4358 (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)))))

(assert (=> d!110889 true))

(declare-fun _$16!175 () Unit!30424)

(assert (=> d!110889 (= (choose!1475 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (index!37652 lt!404328) (defaultEntry!5326 thiss!1181)) _$16!175)))

(declare-fun bs!25121 () Bool)

(assert (= bs!25121 d!110889))

(assert (=> bs!25121 m!833297))

(assert (=> bs!25121 m!833277))

(assert (=> bs!25121 m!833297))

(assert (=> bs!25121 m!833277))

(assert (=> bs!25121 m!833399))

(assert (=> d!110821 d!110889))

(assert (=> d!110821 d!110867))

(declare-fun b!895166 () Bool)

(declare-fun e!500052 () Bool)

(declare-fun e!500053 () Bool)

(assert (=> b!895166 (= e!500052 e!500053)))

(declare-fun res!605632 () Bool)

(declare-fun lt!404537 () SeekEntryResult!8820)

(assert (=> b!895166 (= res!605632 (and ((_ is Intermediate!8820) lt!404537) (not (undefined!9632 lt!404537)) (bvslt (x!75970 lt!404537) #b01111111111111111111111111111110) (bvsge (x!75970 lt!404537) #b00000000000000000000000000000000) (bvsge (x!75970 lt!404537) #b00000000000000000000000000000000)))))

(assert (=> b!895166 (=> (not res!605632) (not e!500053))))

(declare-fun b!895167 () Bool)

(declare-fun e!500051 () SeekEntryResult!8820)

(assert (=> b!895167 (= e!500051 (Intermediate!8820 false (toIndex!0 key!785 (mask!25913 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895168 () Bool)

(assert (=> b!895168 (= e!500051 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25913 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!25913 thiss!1181)) key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!895169 () Bool)

(assert (=> b!895169 (= e!500052 (bvsge (x!75970 lt!404537) #b01111111111111111111111111111110))))

(declare-fun b!895170 () Bool)

(assert (=> b!895170 (and (bvsge (index!37653 lt!404537) #b00000000000000000000000000000000) (bvslt (index!37653 lt!404537) (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun e!500050 () Bool)

(assert (=> b!895170 (= e!500050 (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37653 lt!404537)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!895171 () Bool)

(declare-fun e!500054 () SeekEntryResult!8820)

(assert (=> b!895171 (= e!500054 (Intermediate!8820 true (toIndex!0 key!785 (mask!25913 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895172 () Bool)

(assert (=> b!895172 (and (bvsge (index!37653 lt!404537) #b00000000000000000000000000000000) (bvslt (index!37653 lt!404537) (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun res!605631 () Bool)

(assert (=> b!895172 (= res!605631 (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37653 lt!404537)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895172 (=> res!605631 e!500050)))

(declare-fun b!895173 () Bool)

(assert (=> b!895173 (and (bvsge (index!37653 lt!404537) #b00000000000000000000000000000000) (bvslt (index!37653 lt!404537) (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun res!605630 () Bool)

(assert (=> b!895173 (= res!605630 (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37653 lt!404537)) key!785))))

(assert (=> b!895173 (=> res!605630 e!500050)))

(assert (=> b!895173 (= e!500053 e!500050)))

(declare-fun b!895165 () Bool)

(assert (=> b!895165 (= e!500054 e!500051)))

(declare-fun c!94636 () Bool)

(declare-fun lt!404536 () (_ BitVec 64))

(assert (=> b!895165 (= c!94636 (or (= lt!404536 key!785) (= (bvadd lt!404536 lt!404536) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!110891 () Bool)

(assert (=> d!110891 e!500052))

(declare-fun c!94638 () Bool)

(assert (=> d!110891 (= c!94638 (and ((_ is Intermediate!8820) lt!404537) (undefined!9632 lt!404537)))))

(assert (=> d!110891 (= lt!404537 e!500054)))

(declare-fun c!94637 () Bool)

(assert (=> d!110891 (= c!94637 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110891 (= lt!404536 (select (arr!25198 (_keys!10046 thiss!1181)) (toIndex!0 key!785 (mask!25913 thiss!1181))))))

(assert (=> d!110891 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25913 thiss!1181)) key!785 (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) lt!404537)))

(assert (= (and d!110891 c!94637) b!895171))

(assert (= (and d!110891 (not c!94637)) b!895165))

(assert (= (and b!895165 c!94636) b!895167))

(assert (= (and b!895165 (not c!94636)) b!895168))

(assert (= (and d!110891 c!94638) b!895169))

(assert (= (and d!110891 (not c!94638)) b!895166))

(assert (= (and b!895166 res!605632) b!895173))

(assert (= (and b!895173 (not res!605630)) b!895172))

(assert (= (and b!895172 (not res!605631)) b!895170))

(assert (=> d!110891 m!833325))

(declare-fun m!833553 () Bool)

(assert (=> d!110891 m!833553))

(assert (=> d!110891 m!833329))

(declare-fun m!833555 () Bool)

(assert (=> b!895170 m!833555))

(assert (=> b!895173 m!833555))

(assert (=> b!895172 m!833555))

(assert (=> b!895168 m!833325))

(declare-fun m!833557 () Bool)

(assert (=> b!895168 m!833557))

(assert (=> b!895168 m!833557))

(declare-fun m!833559 () Bool)

(assert (=> b!895168 m!833559))

(assert (=> d!110809 d!110891))

(declare-fun d!110893 () Bool)

(declare-fun lt!404543 () (_ BitVec 32))

(declare-fun lt!404542 () (_ BitVec 32))

(assert (=> d!110893 (= lt!404543 (bvmul (bvxor lt!404542 (bvlshr lt!404542 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110893 (= lt!404542 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110893 (and (bvsge (mask!25913 thiss!1181) #b00000000000000000000000000000000) (let ((res!605633 (let ((h!18889 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!75982 (bvmul (bvxor h!18889 (bvlshr h!18889 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!75982 (bvlshr x!75982 #b00000000000000000000000000001101)) (mask!25913 thiss!1181)))))) (and (bvslt res!605633 (bvadd (mask!25913 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605633 #b00000000000000000000000000000000))))))

(assert (=> d!110893 (= (toIndex!0 key!785 (mask!25913 thiss!1181)) (bvand (bvxor lt!404543 (bvlshr lt!404543 #b00000000000000000000000000001101)) (mask!25913 thiss!1181)))))

(assert (=> d!110809 d!110893))

(assert (=> d!110809 d!110867))

(declare-fun d!110895 () Bool)

(declare-fun e!500055 () Bool)

(assert (=> d!110895 e!500055))

(declare-fun res!605634 () Bool)

(assert (=> d!110895 (=> res!605634 e!500055)))

(declare-fun lt!404546 () Bool)

(assert (=> d!110895 (= res!605634 (not lt!404546))))

(declare-fun lt!404547 () Bool)

(assert (=> d!110895 (= lt!404546 lt!404547)))

(declare-fun lt!404544 () Unit!30424)

(declare-fun e!500056 () Unit!30424)

(assert (=> d!110895 (= lt!404544 e!500056)))

(declare-fun c!94639 () Bool)

(assert (=> d!110895 (= c!94639 lt!404547)))

(assert (=> d!110895 (= lt!404547 (containsKey!425 (toList!5332 (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181))) (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328))))))

(assert (=> d!110895 (= (contains!4358 (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328))) lt!404546)))

(declare-fun b!895174 () Bool)

(declare-fun lt!404545 () Unit!30424)

(assert (=> b!895174 (= e!500056 lt!404545)))

(assert (=> b!895174 (= lt!404545 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5332 (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181))) (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328))))))

(assert (=> b!895174 (isDefined!327 (getValueByKey!447 (toList!5332 (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181))) (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328))))))

(declare-fun b!895175 () Bool)

(declare-fun Unit!30432 () Unit!30424)

(assert (=> b!895175 (= e!500056 Unit!30432)))

(declare-fun b!895176 () Bool)

(assert (=> b!895176 (= e!500055 (isDefined!327 (getValueByKey!447 (toList!5332 (getCurrentListMap!2608 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181))) (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)))))))

(assert (= (and d!110895 c!94639) b!895174))

(assert (= (and d!110895 (not c!94639)) b!895175))

(assert (= (and d!110895 (not res!605634)) b!895176))

(assert (=> d!110895 m!833277))

(declare-fun m!833561 () Bool)

(assert (=> d!110895 m!833561))

(assert (=> b!895174 m!833277))

(declare-fun m!833563 () Bool)

(assert (=> b!895174 m!833563))

(assert (=> b!895174 m!833277))

(declare-fun m!833565 () Bool)

(assert (=> b!895174 m!833565))

(assert (=> b!895174 m!833565))

(declare-fun m!833567 () Bool)

(assert (=> b!895174 m!833567))

(assert (=> b!895176 m!833277))

(assert (=> b!895176 m!833565))

(assert (=> b!895176 m!833565))

(assert (=> b!895176 m!833567))

(assert (=> b!895003 d!110895))

(assert (=> b!895003 d!110811))

(assert (=> b!895027 d!110839))

(assert (=> d!110815 d!110867))

(declare-fun d!110897 () Bool)

(declare-fun e!500057 () Bool)

(assert (=> d!110897 e!500057))

(declare-fun res!605635 () Bool)

(assert (=> d!110897 (=> res!605635 e!500057)))

(declare-fun lt!404550 () Bool)

(assert (=> d!110897 (= res!605635 (not lt!404550))))

(declare-fun lt!404551 () Bool)

(assert (=> d!110897 (= lt!404550 lt!404551)))

(declare-fun lt!404548 () Unit!30424)

(declare-fun e!500058 () Unit!30424)

(assert (=> d!110897 (= lt!404548 e!500058)))

(declare-fun c!94640 () Bool)

(assert (=> d!110897 (= c!94640 lt!404551)))

(assert (=> d!110897 (= lt!404551 (containsKey!425 (toList!5332 lt!404413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110897 (= (contains!4358 lt!404413 #b0000000000000000000000000000000000000000000000000000000000000000) lt!404550)))

(declare-fun b!895177 () Bool)

(declare-fun lt!404549 () Unit!30424)

(assert (=> b!895177 (= e!500058 lt!404549)))

(assert (=> b!895177 (= lt!404549 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5332 lt!404413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895177 (isDefined!327 (getValueByKey!447 (toList!5332 lt!404413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!895178 () Bool)

(declare-fun Unit!30433 () Unit!30424)

(assert (=> b!895178 (= e!500058 Unit!30433)))

(declare-fun b!895179 () Bool)

(assert (=> b!895179 (= e!500057 (isDefined!327 (getValueByKey!447 (toList!5332 lt!404413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110897 c!94640) b!895177))

(assert (= (and d!110897 (not c!94640)) b!895178))

(assert (= (and d!110897 (not res!605635)) b!895179))

(declare-fun m!833569 () Bool)

(assert (=> d!110897 m!833569))

(declare-fun m!833571 () Bool)

(assert (=> b!895177 m!833571))

(declare-fun m!833573 () Bool)

(assert (=> b!895177 m!833573))

(assert (=> b!895177 m!833573))

(declare-fun m!833575 () Bool)

(assert (=> b!895177 m!833575))

(assert (=> b!895179 m!833573))

(assert (=> b!895179 m!833573))

(assert (=> b!895179 m!833575))

(assert (=> bm!39733 d!110897))

(declare-fun d!110899 () Bool)

(declare-fun e!500061 () Bool)

(assert (=> d!110899 e!500061))

(declare-fun c!94643 () Bool)

(assert (=> d!110899 (= c!94643 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!110899 true))

(declare-fun _$15!92 () Unit!30424)

(assert (=> d!110899 (= (choose!1476 (_keys!10046 thiss!1181) (_values!5313 thiss!1181) (mask!25913 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) key!785 (defaultEntry!5326 thiss!1181)) _$15!92)))

(declare-fun b!895184 () Bool)

(assert (=> b!895184 (= e!500061 (arrayContainsKey!0 (_keys!10046 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!895185 () Bool)

(assert (=> b!895185 (= e!500061 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110899 c!94643) b!895184))

(assert (= (and d!110899 (not c!94643)) b!895185))

(assert (=> b!895184 m!833281))

(assert (=> d!110829 d!110899))

(assert (=> d!110829 d!110867))

(declare-fun d!110901 () Bool)

(assert (=> d!110901 (= (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325)) (and (not (= (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!895031 d!110901))

(declare-fun d!110903 () Bool)

(declare-fun res!605640 () Bool)

(declare-fun e!500066 () Bool)

(assert (=> d!110903 (=> res!605640 e!500066)))

(assert (=> d!110903 (= res!605640 (and ((_ is Cons!17747) (toList!5332 call!39714)) (= (_1!5978 (h!18885 (toList!5332 call!39714))) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785))))))

(assert (=> d!110903 (= (containsKey!425 (toList!5332 call!39714) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)) e!500066)))

(declare-fun b!895190 () Bool)

(declare-fun e!500067 () Bool)

(assert (=> b!895190 (= e!500066 e!500067)))

(declare-fun res!605641 () Bool)

(assert (=> b!895190 (=> (not res!605641) (not e!500067))))

(assert (=> b!895190 (= res!605641 (and (or (not ((_ is Cons!17747) (toList!5332 call!39714))) (bvsle (_1!5978 (h!18885 (toList!5332 call!39714))) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785))) ((_ is Cons!17747) (toList!5332 call!39714)) (bvslt (_1!5978 (h!18885 (toList!5332 call!39714))) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785))))))

(declare-fun b!895191 () Bool)

(assert (=> b!895191 (= e!500067 (containsKey!425 (t!25070 (toList!5332 call!39714)) (ite c!94538 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404328)) key!785)))))

(assert (= (and d!110903 (not res!605640)) b!895190))

(assert (= (and b!895190 res!605641) b!895191))

(declare-fun m!833577 () Bool)

(assert (=> b!895191 m!833577))

(assert (=> d!110827 d!110903))

(declare-fun d!110905 () Bool)

(declare-fun res!605642 () Bool)

(declare-fun e!500068 () Bool)

(assert (=> d!110905 (=> res!605642 e!500068)))

(assert (=> d!110905 (= res!605642 (and ((_ is Cons!17747) (toList!5332 (map!12204 thiss!1181))) (= (_1!5978 (h!18885 (toList!5332 (map!12204 thiss!1181)))) key!785)))))

(assert (=> d!110905 (= (containsKey!425 (toList!5332 (map!12204 thiss!1181)) key!785) e!500068)))

(declare-fun b!895192 () Bool)

(declare-fun e!500069 () Bool)

(assert (=> b!895192 (= e!500068 e!500069)))

(declare-fun res!605643 () Bool)

(assert (=> b!895192 (=> (not res!605643) (not e!500069))))

(assert (=> b!895192 (= res!605643 (and (or (not ((_ is Cons!17747) (toList!5332 (map!12204 thiss!1181)))) (bvsle (_1!5978 (h!18885 (toList!5332 (map!12204 thiss!1181)))) key!785)) ((_ is Cons!17747) (toList!5332 (map!12204 thiss!1181))) (bvslt (_1!5978 (h!18885 (toList!5332 (map!12204 thiss!1181)))) key!785)))))

(declare-fun b!895193 () Bool)

(assert (=> b!895193 (= e!500069 (containsKey!425 (t!25070 (toList!5332 (map!12204 thiss!1181))) key!785))))

(assert (= (and d!110905 (not res!605642)) b!895192))

(assert (= (and b!895192 res!605643) b!895193))

(declare-fun m!833579 () Bool)

(assert (=> b!895193 m!833579))

(assert (=> d!110813 d!110905))

(declare-fun d!110907 () Bool)

(declare-fun e!500070 () Bool)

(assert (=> d!110907 e!500070))

(declare-fun res!605644 () Bool)

(assert (=> d!110907 (=> res!605644 e!500070)))

(declare-fun lt!404554 () Bool)

(assert (=> d!110907 (= res!605644 (not lt!404554))))

(declare-fun lt!404555 () Bool)

(assert (=> d!110907 (= lt!404554 lt!404555)))

(declare-fun lt!404552 () Unit!30424)

(declare-fun e!500071 () Unit!30424)

(assert (=> d!110907 (= lt!404552 e!500071)))

(declare-fun c!94644 () Bool)

(assert (=> d!110907 (= c!94644 lt!404555)))

(assert (=> d!110907 (= lt!404555 (containsKey!425 (toList!5332 lt!404413) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110907 (= (contains!4358 lt!404413 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)) lt!404554)))

(declare-fun b!895194 () Bool)

(declare-fun lt!404553 () Unit!30424)

(assert (=> b!895194 (= e!500071 lt!404553)))

(assert (=> b!895194 (= lt!404553 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5332 lt!404413) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!895194 (isDefined!327 (getValueByKey!447 (toList!5332 lt!404413) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895195 () Bool)

(declare-fun Unit!30434 () Unit!30424)

(assert (=> b!895195 (= e!500071 Unit!30434)))

(declare-fun b!895196 () Bool)

(assert (=> b!895196 (= e!500070 (isDefined!327 (getValueByKey!447 (toList!5332 lt!404413) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!110907 c!94644) b!895194))

(assert (= (and d!110907 (not c!94644)) b!895195))

(assert (= (and d!110907 (not res!605644)) b!895196))

(assert (=> d!110907 m!833311))

(declare-fun m!833581 () Bool)

(assert (=> d!110907 m!833581))

(assert (=> b!895194 m!833311))

(declare-fun m!833583 () Bool)

(assert (=> b!895194 m!833583))

(assert (=> b!895194 m!833311))

(declare-fun m!833585 () Bool)

(assert (=> b!895194 m!833585))

(assert (=> b!895194 m!833585))

(declare-fun m!833587 () Bool)

(assert (=> b!895194 m!833587))

(assert (=> b!895196 m!833311))

(assert (=> b!895196 m!833585))

(assert (=> b!895196 m!833585))

(assert (=> b!895196 m!833587))

(assert (=> b!894953 d!110907))

(declare-fun bm!39751 () Bool)

(declare-fun call!39754 () Bool)

(assert (=> bm!39751 (= call!39754 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!404325 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!895197 () Bool)

(declare-fun e!500073 () Bool)

(assert (=> b!895197 (= e!500073 call!39754)))

(declare-fun b!895198 () Bool)

(declare-fun e!500072 () Bool)

(assert (=> b!895198 (= e!500072 e!500073)))

(declare-fun lt!404558 () (_ BitVec 64))

(assert (=> b!895198 (= lt!404558 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd lt!404325 #b00000000000000000000000000000001)))))

(declare-fun lt!404557 () Unit!30424)

(assert (=> b!895198 (= lt!404557 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10046 thiss!1181) lt!404558 (bvadd lt!404325 #b00000000000000000000000000000001)))))

(assert (=> b!895198 (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404558 #b00000000000000000000000000000000)))

(declare-fun lt!404556 () Unit!30424)

(assert (=> b!895198 (= lt!404556 lt!404557)))

(declare-fun res!605645 () Bool)

(assert (=> b!895198 (= res!605645 (= (seekEntryOrOpen!0 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd lt!404325 #b00000000000000000000000000000001)) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) (Found!8820 (bvadd lt!404325 #b00000000000000000000000000000001))))))

(assert (=> b!895198 (=> (not res!605645) (not e!500073))))

(declare-fun b!895199 () Bool)

(declare-fun e!500074 () Bool)

(assert (=> b!895199 (= e!500074 e!500072)))

(declare-fun c!94645 () Bool)

(assert (=> b!895199 (= c!94645 (validKeyInArray!0 (select (arr!25198 (_keys!10046 thiss!1181)) (bvadd lt!404325 #b00000000000000000000000000000001))))))

(declare-fun d!110909 () Bool)

(declare-fun res!605646 () Bool)

(assert (=> d!110909 (=> res!605646 e!500074)))

(assert (=> d!110909 (= res!605646 (bvsge (bvadd lt!404325 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(assert (=> d!110909 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!404325 #b00000000000000000000000000000001) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) e!500074)))

(declare-fun b!895200 () Bool)

(assert (=> b!895200 (= e!500072 call!39754)))

(assert (= (and d!110909 (not res!605646)) b!895199))

(assert (= (and b!895199 c!94645) b!895198))

(assert (= (and b!895199 (not c!94645)) b!895200))

(assert (= (and b!895198 res!605645) b!895197))

(assert (= (or b!895197 b!895200) bm!39751))

(declare-fun m!833589 () Bool)

(assert (=> bm!39751 m!833589))

(declare-fun m!833591 () Bool)

(assert (=> b!895198 m!833591))

(declare-fun m!833593 () Bool)

(assert (=> b!895198 m!833593))

(declare-fun m!833595 () Bool)

(assert (=> b!895198 m!833595))

(assert (=> b!895198 m!833591))

(declare-fun m!833597 () Bool)

(assert (=> b!895198 m!833597))

(assert (=> b!895199 m!833591))

(assert (=> b!895199 m!833591))

(declare-fun m!833599 () Bool)

(assert (=> b!895199 m!833599))

(assert (=> bm!39744 d!110909))

(assert (=> b!894886 d!110857))

(declare-fun d!110911 () Bool)

(assert (=> d!110911 (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404447 #b00000000000000000000000000000000)))

(declare-fun lt!404559 () Unit!30424)

(assert (=> d!110911 (= lt!404559 (choose!13 (_keys!10046 thiss!1181) lt!404447 #b00000000000000000000000000000000))))

(assert (=> d!110911 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!110911 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10046 thiss!1181) lt!404447 #b00000000000000000000000000000000) lt!404559)))

(declare-fun bs!25122 () Bool)

(assert (= bs!25122 d!110911))

(assert (=> bs!25122 m!833405))

(declare-fun m!833601 () Bool)

(assert (=> bs!25122 m!833601))

(assert (=> b!895013 d!110911))

(declare-fun d!110913 () Bool)

(declare-fun res!605647 () Bool)

(declare-fun e!500075 () Bool)

(assert (=> d!110913 (=> res!605647 e!500075)))

(assert (=> d!110913 (= res!605647 (= (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) lt!404447))))

(assert (=> d!110913 (= (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404447 #b00000000000000000000000000000000) e!500075)))

(declare-fun b!895201 () Bool)

(declare-fun e!500076 () Bool)

(assert (=> b!895201 (= e!500075 e!500076)))

(declare-fun res!605648 () Bool)

(assert (=> b!895201 (=> (not res!605648) (not e!500076))))

(assert (=> b!895201 (= res!605648 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!895202 () Bool)

(assert (=> b!895202 (= e!500076 (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404447 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110913 (not res!605647)) b!895201))

(assert (= (and b!895201 res!605648) b!895202))

(assert (=> d!110913 m!833311))

(declare-fun m!833603 () Bool)

(assert (=> b!895202 m!833603))

(assert (=> b!895013 d!110913))

(declare-fun b!895215 () Bool)

(declare-fun e!500085 () SeekEntryResult!8820)

(declare-fun lt!404568 () SeekEntryResult!8820)

(assert (=> b!895215 (= e!500085 (Found!8820 (index!37653 lt!404568)))))

(declare-fun b!895216 () Bool)

(declare-fun e!500083 () SeekEntryResult!8820)

(assert (=> b!895216 (= e!500083 (seekKeyOrZeroReturnVacant!0 (x!75970 lt!404568) (index!37653 lt!404568) (index!37653 lt!404568) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!895217 () Bool)

(declare-fun e!500084 () SeekEntryResult!8820)

(assert (=> b!895217 (= e!500084 Undefined!8820)))

(declare-fun d!110915 () Bool)

(declare-fun lt!404566 () SeekEntryResult!8820)

(assert (=> d!110915 (and (or ((_ is Undefined!8820) lt!404566) (not ((_ is Found!8820) lt!404566)) (and (bvsge (index!37652 lt!404566) #b00000000000000000000000000000000) (bvslt (index!37652 lt!404566) (size!25644 (_keys!10046 thiss!1181))))) (or ((_ is Undefined!8820) lt!404566) ((_ is Found!8820) lt!404566) (not ((_ is MissingZero!8820) lt!404566)) (and (bvsge (index!37651 lt!404566) #b00000000000000000000000000000000) (bvslt (index!37651 lt!404566) (size!25644 (_keys!10046 thiss!1181))))) (or ((_ is Undefined!8820) lt!404566) ((_ is Found!8820) lt!404566) ((_ is MissingZero!8820) lt!404566) (not ((_ is MissingVacant!8820) lt!404566)) (and (bvsge (index!37654 lt!404566) #b00000000000000000000000000000000) (bvslt (index!37654 lt!404566) (size!25644 (_keys!10046 thiss!1181))))) (or ((_ is Undefined!8820) lt!404566) (ite ((_ is Found!8820) lt!404566) (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404566)) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8820) lt!404566) (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37651 lt!404566)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8820) lt!404566) (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37654 lt!404566)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110915 (= lt!404566 e!500084)))

(declare-fun c!94653 () Bool)

(assert (=> d!110915 (= c!94653 (and ((_ is Intermediate!8820) lt!404568) (undefined!9632 lt!404568)))))

(assert (=> d!110915 (= lt!404568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) (mask!25913 thiss!1181)) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(assert (=> d!110915 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110915 (= (seekEntryOrOpen!0 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) lt!404566)))

(declare-fun b!895218 () Bool)

(declare-fun c!94652 () Bool)

(declare-fun lt!404567 () (_ BitVec 64))

(assert (=> b!895218 (= c!94652 (= lt!404567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895218 (= e!500085 e!500083)))

(declare-fun b!895219 () Bool)

(assert (=> b!895219 (= e!500084 e!500085)))

(assert (=> b!895219 (= lt!404567 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37653 lt!404568)))))

(declare-fun c!94654 () Bool)

(assert (=> b!895219 (= c!94654 (= lt!404567 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895220 () Bool)

(assert (=> b!895220 (= e!500083 (MissingZero!8820 (index!37653 lt!404568)))))

(assert (= (and d!110915 c!94653) b!895217))

(assert (= (and d!110915 (not c!94653)) b!895219))

(assert (= (and b!895219 c!94654) b!895215))

(assert (= (and b!895219 (not c!94654)) b!895218))

(assert (= (and b!895218 c!94652) b!895220))

(assert (= (and b!895218 (not c!94652)) b!895216))

(assert (=> b!895216 m!833311))

(declare-fun m!833605 () Bool)

(assert (=> b!895216 m!833605))

(assert (=> d!110915 m!833311))

(declare-fun m!833607 () Bool)

(assert (=> d!110915 m!833607))

(declare-fun m!833609 () Bool)

(assert (=> d!110915 m!833609))

(assert (=> d!110915 m!833329))

(declare-fun m!833611 () Bool)

(assert (=> d!110915 m!833611))

(assert (=> d!110915 m!833607))

(assert (=> d!110915 m!833311))

(declare-fun m!833613 () Bool)

(assert (=> d!110915 m!833613))

(declare-fun m!833615 () Bool)

(assert (=> d!110915 m!833615))

(declare-fun m!833617 () Bool)

(assert (=> b!895219 m!833617))

(assert (=> b!895013 d!110915))

(declare-fun d!110917 () Bool)

(assert (=> d!110917 (= (apply!404 lt!404413 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13281 (getValueByKey!447 (toList!5332 lt!404413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25123 () Bool)

(assert (= bs!25123 d!110917))

(assert (=> bs!25123 m!833573))

(assert (=> bs!25123 m!833573))

(declare-fun m!833619 () Bool)

(assert (=> bs!25123 m!833619))

(assert (=> b!894950 d!110917))

(declare-fun d!110919 () Bool)

(assert (=> d!110919 (= (apply!404 lt!404413 (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000)) (get!13281 (getValueByKey!447 (toList!5332 lt!404413) (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25124 () Bool)

(assert (= bs!25124 d!110919))

(assert (=> bs!25124 m!833311))

(assert (=> bs!25124 m!833585))

(assert (=> bs!25124 m!833585))

(declare-fun m!833621 () Bool)

(assert (=> bs!25124 m!833621))

(assert (=> b!894966 d!110919))

(declare-fun d!110921 () Bool)

(declare-fun c!94657 () Bool)

(assert (=> d!110921 (= c!94657 ((_ is ValueCellFull!8612) (select (arr!25199 (_values!5313 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!500088 () V!29215)

(assert (=> d!110921 (= (get!13284 (select (arr!25199 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1315 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!500088)))

(declare-fun b!895225 () Bool)

(declare-fun get!13285 (ValueCell!8612 V!29215) V!29215)

(assert (=> b!895225 (= e!500088 (get!13285 (select (arr!25199 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1315 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!895226 () Bool)

(declare-fun get!13286 (ValueCell!8612 V!29215) V!29215)

(assert (=> b!895226 (= e!500088 (get!13286 (select (arr!25199 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1315 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110921 c!94657) b!895225))

(assert (= (and d!110921 (not c!94657)) b!895226))

(assert (=> b!895225 m!833351))

(assert (=> b!895225 m!833347))

(declare-fun m!833623 () Bool)

(assert (=> b!895225 m!833623))

(assert (=> b!895226 m!833351))

(assert (=> b!895226 m!833347))

(declare-fun m!833625 () Bool)

(assert (=> b!895226 m!833625))

(assert (=> b!894966 d!110921))

(declare-fun d!110923 () Bool)

(assert (=> d!110923 (= (apply!404 (+!2599 lt!404397 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181))) lt!404416) (get!13281 (getValueByKey!447 (toList!5332 (+!2599 lt!404397 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181)))) lt!404416)))))

(declare-fun bs!25125 () Bool)

(assert (= bs!25125 d!110923))

(declare-fun m!833627 () Bool)

(assert (=> bs!25125 m!833627))

(assert (=> bs!25125 m!833627))

(declare-fun m!833629 () Bool)

(assert (=> bs!25125 m!833629))

(assert (=> b!894967 d!110923))

(declare-fun d!110925 () Bool)

(declare-fun e!500089 () Bool)

(assert (=> d!110925 e!500089))

(declare-fun res!605650 () Bool)

(assert (=> d!110925 (=> (not res!605650) (not e!500089))))

(declare-fun lt!404570 () ListLongMap!10633)

(assert (=> d!110925 (= res!605650 (contains!4358 lt!404570 (_1!5978 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181)))))))

(declare-fun lt!404569 () List!17751)

(assert (=> d!110925 (= lt!404570 (ListLongMap!10634 lt!404569))))

(declare-fun lt!404571 () Unit!30424)

(declare-fun lt!404572 () Unit!30424)

(assert (=> d!110925 (= lt!404571 lt!404572)))

(assert (=> d!110925 (= (getValueByKey!447 lt!404569 (_1!5978 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110925 (= lt!404572 (lemmaContainsTupThenGetReturnValue!248 lt!404569 (_1!5978 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110925 (= lt!404569 (insertStrictlySorted!305 (toList!5332 lt!404397) (_1!5978 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110925 (= (+!2599 lt!404397 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181))) lt!404570)))

(declare-fun b!895227 () Bool)

(declare-fun res!605649 () Bool)

(assert (=> b!895227 (=> (not res!605649) (not e!500089))))

(assert (=> b!895227 (= res!605649 (= (getValueByKey!447 (toList!5332 lt!404570) (_1!5978 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181))))))))

(declare-fun b!895228 () Bool)

(assert (=> b!895228 (= e!500089 (contains!4360 (toList!5332 lt!404570) (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181))))))

(assert (= (and d!110925 res!605650) b!895227))

(assert (= (and b!895227 res!605649) b!895228))

(declare-fun m!833631 () Bool)

(assert (=> d!110925 m!833631))

(declare-fun m!833633 () Bool)

(assert (=> d!110925 m!833633))

(declare-fun m!833635 () Bool)

(assert (=> d!110925 m!833635))

(declare-fun m!833637 () Bool)

(assert (=> d!110925 m!833637))

(declare-fun m!833639 () Bool)

(assert (=> b!895227 m!833639))

(declare-fun m!833641 () Bool)

(assert (=> b!895228 m!833641))

(assert (=> b!894967 d!110925))

(declare-fun d!110927 () Bool)

(assert (=> d!110927 (= (apply!404 lt!404405 lt!404407) (get!13281 (getValueByKey!447 (toList!5332 lt!404405) lt!404407)))))

(declare-fun bs!25126 () Bool)

(assert (= bs!25126 d!110927))

(declare-fun m!833643 () Bool)

(assert (=> bs!25126 m!833643))

(assert (=> bs!25126 m!833643))

(declare-fun m!833645 () Bool)

(assert (=> bs!25126 m!833645))

(assert (=> b!894967 d!110927))

(declare-fun d!110929 () Bool)

(declare-fun e!500090 () Bool)

(assert (=> d!110929 e!500090))

(declare-fun res!605652 () Bool)

(assert (=> d!110929 (=> (not res!605652) (not e!500090))))

(declare-fun lt!404574 () ListLongMap!10633)

(assert (=> d!110929 (= res!605652 (contains!4358 lt!404574 (_1!5978 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))))))

(declare-fun lt!404573 () List!17751)

(assert (=> d!110929 (= lt!404574 (ListLongMap!10634 lt!404573))))

(declare-fun lt!404575 () Unit!30424)

(declare-fun lt!404576 () Unit!30424)

(assert (=> d!110929 (= lt!404575 lt!404576)))

(assert (=> d!110929 (= (getValueByKey!447 lt!404573 (_1!5978 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110929 (= lt!404576 (lemmaContainsTupThenGetReturnValue!248 lt!404573 (_1!5978 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110929 (= lt!404573 (insertStrictlySorted!305 (toList!5332 lt!404404) (_1!5978 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110929 (= (+!2599 lt!404404 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181))) lt!404574)))

(declare-fun b!895229 () Bool)

(declare-fun res!605651 () Bool)

(assert (=> b!895229 (=> (not res!605651) (not e!500090))))

(assert (=> b!895229 (= res!605651 (= (getValueByKey!447 (toList!5332 lt!404574) (_1!5978 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181))))))))

(declare-fun b!895230 () Bool)

(assert (=> b!895230 (= e!500090 (contains!4360 (toList!5332 lt!404574) (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181))))))

(assert (= (and d!110929 res!605652) b!895229))

(assert (= (and b!895229 res!605651) b!895230))

(declare-fun m!833647 () Bool)

(assert (=> d!110929 m!833647))

(declare-fun m!833649 () Bool)

(assert (=> d!110929 m!833649))

(declare-fun m!833651 () Bool)

(assert (=> d!110929 m!833651))

(declare-fun m!833653 () Bool)

(assert (=> d!110929 m!833653))

(declare-fun m!833655 () Bool)

(assert (=> b!895229 m!833655))

(declare-fun m!833657 () Bool)

(assert (=> b!895230 m!833657))

(assert (=> b!894967 d!110929))

(declare-fun d!110931 () Bool)

(assert (=> d!110931 (= (apply!404 lt!404397 lt!404416) (get!13281 (getValueByKey!447 (toList!5332 lt!404397) lt!404416)))))

(declare-fun bs!25127 () Bool)

(assert (= bs!25127 d!110931))

(declare-fun m!833659 () Bool)

(assert (=> bs!25127 m!833659))

(assert (=> bs!25127 m!833659))

(declare-fun m!833661 () Bool)

(assert (=> bs!25127 m!833661))

(assert (=> b!894967 d!110931))

(declare-fun d!110933 () Bool)

(assert (=> d!110933 (= (apply!404 (+!2599 lt!404411 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181))) lt!404417) (get!13281 (getValueByKey!447 (toList!5332 (+!2599 lt!404411 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181)))) lt!404417)))))

(declare-fun bs!25128 () Bool)

(assert (= bs!25128 d!110933))

(declare-fun m!833663 () Bool)

(assert (=> bs!25128 m!833663))

(assert (=> bs!25128 m!833663))

(declare-fun m!833665 () Bool)

(assert (=> bs!25128 m!833665))

(assert (=> b!894967 d!110933))

(declare-fun d!110935 () Bool)

(assert (=> d!110935 (= (apply!404 lt!404411 lt!404417) (get!13281 (getValueByKey!447 (toList!5332 lt!404411) lt!404417)))))

(declare-fun bs!25129 () Bool)

(assert (= bs!25129 d!110935))

(declare-fun m!833667 () Bool)

(assert (=> bs!25129 m!833667))

(assert (=> bs!25129 m!833667))

(declare-fun m!833669 () Bool)

(assert (=> bs!25129 m!833669))

(assert (=> b!894967 d!110935))

(declare-fun d!110937 () Bool)

(assert (=> d!110937 (= (apply!404 (+!2599 lt!404397 (tuple2!11935 lt!404403 (zeroValue!5126 thiss!1181))) lt!404416) (apply!404 lt!404397 lt!404416))))

(declare-fun lt!404579 () Unit!30424)

(declare-fun choose!1478 (ListLongMap!10633 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30424)

(assert (=> d!110937 (= lt!404579 (choose!1478 lt!404397 lt!404403 (zeroValue!5126 thiss!1181) lt!404416))))

(declare-fun e!500093 () Bool)

(assert (=> d!110937 e!500093))

(declare-fun res!605655 () Bool)

(assert (=> d!110937 (=> (not res!605655) (not e!500093))))

(assert (=> d!110937 (= res!605655 (contains!4358 lt!404397 lt!404416))))

(assert (=> d!110937 (= (addApplyDifferent!330 lt!404397 lt!404403 (zeroValue!5126 thiss!1181) lt!404416) lt!404579)))

(declare-fun b!895234 () Bool)

(assert (=> b!895234 (= e!500093 (not (= lt!404416 lt!404403)))))

(assert (= (and d!110937 res!605655) b!895234))

(assert (=> d!110937 m!833355))

(assert (=> d!110937 m!833379))

(declare-fun m!833671 () Bool)

(assert (=> d!110937 m!833671))

(assert (=> d!110937 m!833361))

(assert (=> d!110937 m!833355))

(declare-fun m!833673 () Bool)

(assert (=> d!110937 m!833673))

(assert (=> b!894967 d!110937))

(declare-fun d!110939 () Bool)

(declare-fun e!500094 () Bool)

(assert (=> d!110939 e!500094))

(declare-fun res!605656 () Bool)

(assert (=> d!110939 (=> res!605656 e!500094)))

(declare-fun lt!404582 () Bool)

(assert (=> d!110939 (= res!605656 (not lt!404582))))

(declare-fun lt!404583 () Bool)

(assert (=> d!110939 (= lt!404582 lt!404583)))

(declare-fun lt!404580 () Unit!30424)

(declare-fun e!500095 () Unit!30424)

(assert (=> d!110939 (= lt!404580 e!500095)))

(declare-fun c!94658 () Bool)

(assert (=> d!110939 (= c!94658 lt!404583)))

(assert (=> d!110939 (= lt!404583 (containsKey!425 (toList!5332 (+!2599 lt!404404 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))) lt!404409))))

(assert (=> d!110939 (= (contains!4358 (+!2599 lt!404404 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181))) lt!404409) lt!404582)))

(declare-fun b!895235 () Bool)

(declare-fun lt!404581 () Unit!30424)

(assert (=> b!895235 (= e!500095 lt!404581)))

(assert (=> b!895235 (= lt!404581 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5332 (+!2599 lt!404404 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))) lt!404409))))

(assert (=> b!895235 (isDefined!327 (getValueByKey!447 (toList!5332 (+!2599 lt!404404 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))) lt!404409))))

(declare-fun b!895236 () Bool)

(declare-fun Unit!30435 () Unit!30424)

(assert (=> b!895236 (= e!500095 Unit!30435)))

(declare-fun b!895237 () Bool)

(assert (=> b!895237 (= e!500094 (isDefined!327 (getValueByKey!447 (toList!5332 (+!2599 lt!404404 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181)))) lt!404409)))))

(assert (= (and d!110939 c!94658) b!895235))

(assert (= (and d!110939 (not c!94658)) b!895236))

(assert (= (and d!110939 (not res!605656)) b!895237))

(declare-fun m!833675 () Bool)

(assert (=> d!110939 m!833675))

(declare-fun m!833677 () Bool)

(assert (=> b!895235 m!833677))

(declare-fun m!833679 () Bool)

(assert (=> b!895235 m!833679))

(assert (=> b!895235 m!833679))

(declare-fun m!833681 () Bool)

(assert (=> b!895235 m!833681))

(assert (=> b!895237 m!833679))

(assert (=> b!895237 m!833679))

(assert (=> b!895237 m!833681))

(assert (=> b!894967 d!110939))

(declare-fun d!110941 () Bool)

(assert (=> d!110941 (contains!4358 (+!2599 lt!404404 (tuple2!11935 lt!404399 (zeroValue!5126 thiss!1181))) lt!404409)))

(declare-fun lt!404586 () Unit!30424)

(declare-fun choose!1479 (ListLongMap!10633 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30424)

(assert (=> d!110941 (= lt!404586 (choose!1479 lt!404404 lt!404399 (zeroValue!5126 thiss!1181) lt!404409))))

(assert (=> d!110941 (contains!4358 lt!404404 lt!404409)))

(assert (=> d!110941 (= (addStillContains!330 lt!404404 lt!404399 (zeroValue!5126 thiss!1181) lt!404409) lt!404586)))

(declare-fun bs!25130 () Bool)

(assert (= bs!25130 d!110941))

(assert (=> bs!25130 m!833369))

(assert (=> bs!25130 m!833369))

(assert (=> bs!25130 m!833371))

(declare-fun m!833683 () Bool)

(assert (=> bs!25130 m!833683))

(declare-fun m!833685 () Bool)

(assert (=> bs!25130 m!833685))

(assert (=> b!894967 d!110941))

(declare-fun d!110943 () Bool)

(assert (=> d!110943 (= (apply!404 (+!2599 lt!404411 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181))) lt!404417) (apply!404 lt!404411 lt!404417))))

(declare-fun lt!404587 () Unit!30424)

(assert (=> d!110943 (= lt!404587 (choose!1478 lt!404411 lt!404408 (minValue!5126 thiss!1181) lt!404417))))

(declare-fun e!500096 () Bool)

(assert (=> d!110943 e!500096))

(declare-fun res!605657 () Bool)

(assert (=> d!110943 (=> (not res!605657) (not e!500096))))

(assert (=> d!110943 (= res!605657 (contains!4358 lt!404411 lt!404417))))

(assert (=> d!110943 (= (addApplyDifferent!330 lt!404411 lt!404408 (minValue!5126 thiss!1181) lt!404417) lt!404587)))

(declare-fun b!895239 () Bool)

(assert (=> b!895239 (= e!500096 (not (= lt!404417 lt!404408)))))

(assert (= (and d!110943 res!605657) b!895239))

(assert (=> d!110943 m!833357))

(assert (=> d!110943 m!833359))

(declare-fun m!833687 () Bool)

(assert (=> d!110943 m!833687))

(assert (=> d!110943 m!833363))

(assert (=> d!110943 m!833357))

(declare-fun m!833689 () Bool)

(assert (=> d!110943 m!833689))

(assert (=> b!894967 d!110943))

(declare-fun d!110945 () Bool)

(declare-fun e!500097 () Bool)

(assert (=> d!110945 e!500097))

(declare-fun res!605659 () Bool)

(assert (=> d!110945 (=> (not res!605659) (not e!500097))))

(declare-fun lt!404589 () ListLongMap!10633)

(assert (=> d!110945 (= res!605659 (contains!4358 lt!404589 (_1!5978 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181)))))))

(declare-fun lt!404588 () List!17751)

(assert (=> d!110945 (= lt!404589 (ListLongMap!10634 lt!404588))))

(declare-fun lt!404590 () Unit!30424)

(declare-fun lt!404591 () Unit!30424)

(assert (=> d!110945 (= lt!404590 lt!404591)))

(assert (=> d!110945 (= (getValueByKey!447 lt!404588 (_1!5978 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181)))))))

(assert (=> d!110945 (= lt!404591 (lemmaContainsTupThenGetReturnValue!248 lt!404588 (_1!5978 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181)))))))

(assert (=> d!110945 (= lt!404588 (insertStrictlySorted!305 (toList!5332 lt!404411) (_1!5978 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181)))))))

(assert (=> d!110945 (= (+!2599 lt!404411 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181))) lt!404589)))

(declare-fun b!895240 () Bool)

(declare-fun res!605658 () Bool)

(assert (=> b!895240 (=> (not res!605658) (not e!500097))))

(assert (=> b!895240 (= res!605658 (= (getValueByKey!447 (toList!5332 lt!404589) (_1!5978 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 lt!404408 (minValue!5126 thiss!1181))))))))

(declare-fun b!895241 () Bool)

(assert (=> b!895241 (= e!500097 (contains!4360 (toList!5332 lt!404589) (tuple2!11935 lt!404408 (minValue!5126 thiss!1181))))))

(assert (= (and d!110945 res!605659) b!895240))

(assert (= (and b!895240 res!605658) b!895241))

(declare-fun m!833691 () Bool)

(assert (=> d!110945 m!833691))

(declare-fun m!833693 () Bool)

(assert (=> d!110945 m!833693))

(declare-fun m!833695 () Bool)

(assert (=> d!110945 m!833695))

(declare-fun m!833697 () Bool)

(assert (=> d!110945 m!833697))

(declare-fun m!833699 () Bool)

(assert (=> b!895240 m!833699))

(declare-fun m!833701 () Bool)

(assert (=> b!895241 m!833701))

(assert (=> b!894967 d!110945))

(assert (=> b!894967 d!110851))

(declare-fun d!110947 () Bool)

(assert (=> d!110947 (= (apply!404 (+!2599 lt!404405 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181))) lt!404407) (apply!404 lt!404405 lt!404407))))

(declare-fun lt!404592 () Unit!30424)

(assert (=> d!110947 (= lt!404592 (choose!1478 lt!404405 lt!404414 (minValue!5126 thiss!1181) lt!404407))))

(declare-fun e!500098 () Bool)

(assert (=> d!110947 e!500098))

(declare-fun res!605660 () Bool)

(assert (=> d!110947 (=> (not res!605660) (not e!500098))))

(assert (=> d!110947 (= res!605660 (contains!4358 lt!404405 lt!404407))))

(assert (=> d!110947 (= (addApplyDifferent!330 lt!404405 lt!404414 (minValue!5126 thiss!1181) lt!404407) lt!404592)))

(declare-fun b!895242 () Bool)

(assert (=> b!895242 (= e!500098 (not (= lt!404407 lt!404414)))))

(assert (= (and d!110947 res!605660) b!895242))

(assert (=> d!110947 m!833365))

(assert (=> d!110947 m!833367))

(declare-fun m!833703 () Bool)

(assert (=> d!110947 m!833703))

(assert (=> d!110947 m!833381))

(assert (=> d!110947 m!833365))

(declare-fun m!833705 () Bool)

(assert (=> d!110947 m!833705))

(assert (=> b!894967 d!110947))

(declare-fun d!110949 () Bool)

(declare-fun e!500099 () Bool)

(assert (=> d!110949 e!500099))

(declare-fun res!605662 () Bool)

(assert (=> d!110949 (=> (not res!605662) (not e!500099))))

(declare-fun lt!404594 () ListLongMap!10633)

(assert (=> d!110949 (= res!605662 (contains!4358 lt!404594 (_1!5978 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181)))))))

(declare-fun lt!404593 () List!17751)

(assert (=> d!110949 (= lt!404594 (ListLongMap!10634 lt!404593))))

(declare-fun lt!404595 () Unit!30424)

(declare-fun lt!404596 () Unit!30424)

(assert (=> d!110949 (= lt!404595 lt!404596)))

(assert (=> d!110949 (= (getValueByKey!447 lt!404593 (_1!5978 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181)))))))

(assert (=> d!110949 (= lt!404596 (lemmaContainsTupThenGetReturnValue!248 lt!404593 (_1!5978 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181)))))))

(assert (=> d!110949 (= lt!404593 (insertStrictlySorted!305 (toList!5332 lt!404405) (_1!5978 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181))) (_2!5978 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181)))))))

(assert (=> d!110949 (= (+!2599 lt!404405 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181))) lt!404594)))

(declare-fun b!895243 () Bool)

(declare-fun res!605661 () Bool)

(assert (=> b!895243 (=> (not res!605661) (not e!500099))))

(assert (=> b!895243 (= res!605661 (= (getValueByKey!447 (toList!5332 lt!404594) (_1!5978 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181)))) (Some!452 (_2!5978 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181))))))))

(declare-fun b!895244 () Bool)

(assert (=> b!895244 (= e!500099 (contains!4360 (toList!5332 lt!404594) (tuple2!11935 lt!404414 (minValue!5126 thiss!1181))))))

(assert (= (and d!110949 res!605662) b!895243))

(assert (= (and b!895243 res!605661) b!895244))

(declare-fun m!833707 () Bool)

(assert (=> d!110949 m!833707))

(declare-fun m!833709 () Bool)

(assert (=> d!110949 m!833709))

(declare-fun m!833711 () Bool)

(assert (=> d!110949 m!833711))

(declare-fun m!833713 () Bool)

(assert (=> d!110949 m!833713))

(declare-fun m!833715 () Bool)

(assert (=> b!895243 m!833715))

(declare-fun m!833717 () Bool)

(assert (=> b!895244 m!833717))

(assert (=> b!894967 d!110949))

(declare-fun d!110951 () Bool)

(assert (=> d!110951 (= (apply!404 (+!2599 lt!404405 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181))) lt!404407) (get!13281 (getValueByKey!447 (toList!5332 (+!2599 lt!404405 (tuple2!11935 lt!404414 (minValue!5126 thiss!1181)))) lt!404407)))))

(declare-fun bs!25131 () Bool)

(assert (= bs!25131 d!110951))

(declare-fun m!833719 () Bool)

(assert (=> bs!25131 m!833719))

(assert (=> bs!25131 m!833719))

(declare-fun m!833721 () Bool)

(assert (=> bs!25131 m!833721))

(assert (=> b!894967 d!110951))

(assert (=> b!895014 d!110857))

(declare-fun d!110953 () Bool)

(assert (=> d!110953 (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404457 #b00000000000000000000000000000000)))

(declare-fun lt!404597 () Unit!30424)

(assert (=> d!110953 (= lt!404597 (choose!13 (_keys!10046 thiss!1181) lt!404457 lt!404325))))

(assert (=> d!110953 (bvsge lt!404325 #b00000000000000000000000000000000)))

(assert (=> d!110953 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10046 thiss!1181) lt!404457 lt!404325) lt!404597)))

(declare-fun bs!25132 () Bool)

(assert (= bs!25132 d!110953))

(assert (=> bs!25132 m!833427))

(declare-fun m!833723 () Bool)

(assert (=> bs!25132 m!833723))

(assert (=> b!895030 d!110953))

(declare-fun d!110955 () Bool)

(declare-fun res!605663 () Bool)

(declare-fun e!500100 () Bool)

(assert (=> d!110955 (=> res!605663 e!500100)))

(assert (=> d!110955 (= res!605663 (= (select (arr!25198 (_keys!10046 thiss!1181)) #b00000000000000000000000000000000) lt!404457))))

(assert (=> d!110955 (= (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404457 #b00000000000000000000000000000000) e!500100)))

(declare-fun b!895245 () Bool)

(declare-fun e!500101 () Bool)

(assert (=> b!895245 (= e!500100 e!500101)))

(declare-fun res!605664 () Bool)

(assert (=> b!895245 (=> (not res!605664) (not e!500101))))

(assert (=> b!895245 (= res!605664 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25644 (_keys!10046 thiss!1181))))))

(declare-fun b!895246 () Bool)

(assert (=> b!895246 (= e!500101 (arrayContainsKey!0 (_keys!10046 thiss!1181) lt!404457 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110955 (not res!605663)) b!895245))

(assert (= (and b!895245 res!605664) b!895246))

(assert (=> d!110955 m!833311))

(declare-fun m!833725 () Bool)

(assert (=> b!895246 m!833725))

(assert (=> b!895030 d!110955))

(declare-fun b!895247 () Bool)

(declare-fun e!500104 () SeekEntryResult!8820)

(declare-fun lt!404600 () SeekEntryResult!8820)

(assert (=> b!895247 (= e!500104 (Found!8820 (index!37653 lt!404600)))))

(declare-fun b!895248 () Bool)

(declare-fun e!500102 () SeekEntryResult!8820)

(assert (=> b!895248 (= e!500102 (seekKeyOrZeroReturnVacant!0 (x!75970 lt!404600) (index!37653 lt!404600) (index!37653 lt!404600) (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(declare-fun b!895249 () Bool)

(declare-fun e!500103 () SeekEntryResult!8820)

(assert (=> b!895249 (= e!500103 Undefined!8820)))

(declare-fun d!110957 () Bool)

(declare-fun lt!404598 () SeekEntryResult!8820)

(assert (=> d!110957 (and (or ((_ is Undefined!8820) lt!404598) (not ((_ is Found!8820) lt!404598)) (and (bvsge (index!37652 lt!404598) #b00000000000000000000000000000000) (bvslt (index!37652 lt!404598) (size!25644 (_keys!10046 thiss!1181))))) (or ((_ is Undefined!8820) lt!404598) ((_ is Found!8820) lt!404598) (not ((_ is MissingZero!8820) lt!404598)) (and (bvsge (index!37651 lt!404598) #b00000000000000000000000000000000) (bvslt (index!37651 lt!404598) (size!25644 (_keys!10046 thiss!1181))))) (or ((_ is Undefined!8820) lt!404598) ((_ is Found!8820) lt!404598) ((_ is MissingZero!8820) lt!404598) (not ((_ is MissingVacant!8820) lt!404598)) (and (bvsge (index!37654 lt!404598) #b00000000000000000000000000000000) (bvslt (index!37654 lt!404598) (size!25644 (_keys!10046 thiss!1181))))) (or ((_ is Undefined!8820) lt!404598) (ite ((_ is Found!8820) lt!404598) (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37652 lt!404598)) (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325)) (ite ((_ is MissingZero!8820) lt!404598) (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37651 lt!404598)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8820) lt!404598) (= (select (arr!25198 (_keys!10046 thiss!1181)) (index!37654 lt!404598)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110957 (= lt!404598 e!500103)))

(declare-fun c!94660 () Bool)

(assert (=> d!110957 (= c!94660 (and ((_ is Intermediate!8820) lt!404600) (undefined!9632 lt!404600)))))

(assert (=> d!110957 (= lt!404600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325) (mask!25913 thiss!1181)) (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)))))

(assert (=> d!110957 (validMask!0 (mask!25913 thiss!1181))))

(assert (=> d!110957 (= (seekEntryOrOpen!0 (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325) (_keys!10046 thiss!1181) (mask!25913 thiss!1181)) lt!404598)))

(declare-fun b!895250 () Bool)

(declare-fun c!94659 () Bool)

(declare-fun lt!404599 () (_ BitVec 64))

(assert (=> b!895250 (= c!94659 (= lt!404599 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895250 (= e!500104 e!500102)))

(declare-fun b!895251 () Bool)

(assert (=> b!895251 (= e!500103 e!500104)))

(assert (=> b!895251 (= lt!404599 (select (arr!25198 (_keys!10046 thiss!1181)) (index!37653 lt!404600)))))

(declare-fun c!94661 () Bool)

(assert (=> b!895251 (= c!94661 (= lt!404599 (select (arr!25198 (_keys!10046 thiss!1181)) lt!404325)))))

(declare-fun b!895252 () Bool)

(assert (=> b!895252 (= e!500102 (MissingZero!8820 (index!37653 lt!404600)))))

(assert (= (and d!110957 c!94660) b!895249))

(assert (= (and d!110957 (not c!94660)) b!895251))

(assert (= (and b!895251 c!94661) b!895247))

(assert (= (and b!895251 (not c!94661)) b!895250))

(assert (= (and b!895250 c!94659) b!895252))

(assert (= (and b!895250 (not c!94659)) b!895248))

(assert (=> b!895248 m!833423))

(declare-fun m!833727 () Bool)

(assert (=> b!895248 m!833727))

(assert (=> d!110957 m!833423))

(declare-fun m!833729 () Bool)

(assert (=> d!110957 m!833729))

(declare-fun m!833731 () Bool)

(assert (=> d!110957 m!833731))

(assert (=> d!110957 m!833329))

(declare-fun m!833733 () Bool)

(assert (=> d!110957 m!833733))

(assert (=> d!110957 m!833729))

(assert (=> d!110957 m!833423))

(declare-fun m!833735 () Bool)

(assert (=> d!110957 m!833735))

(declare-fun m!833737 () Bool)

(assert (=> d!110957 m!833737))

(declare-fun m!833739 () Bool)

(assert (=> b!895251 m!833739))

(assert (=> b!895030 d!110957))

(declare-fun b!895253 () Bool)

(declare-fun e!500106 () Bool)

(assert (=> b!895253 (= e!500106 tp_is_empty!18187)))

(declare-fun mapIsEmpty!28857 () Bool)

(declare-fun mapRes!28857 () Bool)

(assert (=> mapIsEmpty!28857 mapRes!28857))

(declare-fun mapNonEmpty!28857 () Bool)

(declare-fun tp!55575 () Bool)

(assert (=> mapNonEmpty!28857 (= mapRes!28857 (and tp!55575 e!500106))))

(declare-fun mapKey!28857 () (_ BitVec 32))

(declare-fun mapValue!28857 () ValueCell!8612)

(declare-fun mapRest!28857 () (Array (_ BitVec 32) ValueCell!8612))

(assert (=> mapNonEmpty!28857 (= mapRest!28856 (store mapRest!28857 mapKey!28857 mapValue!28857))))

(declare-fun condMapEmpty!28857 () Bool)

(declare-fun mapDefault!28857 () ValueCell!8612)

(assert (=> mapNonEmpty!28856 (= condMapEmpty!28857 (= mapRest!28856 ((as const (Array (_ BitVec 32) ValueCell!8612)) mapDefault!28857)))))

(declare-fun e!500105 () Bool)

(assert (=> mapNonEmpty!28856 (= tp!55574 (and e!500105 mapRes!28857))))

(declare-fun b!895254 () Bool)

(assert (=> b!895254 (= e!500105 tp_is_empty!18187)))

(assert (= (and mapNonEmpty!28856 condMapEmpty!28857) mapIsEmpty!28857))

(assert (= (and mapNonEmpty!28856 (not condMapEmpty!28857)) mapNonEmpty!28857))

(assert (= (and mapNonEmpty!28857 ((_ is ValueCellFull!8612) mapValue!28857)) b!895253))

(assert (= (and mapNonEmpty!28856 ((_ is ValueCellFull!8612) mapDefault!28857)) b!895254))

(declare-fun m!833741 () Bool)

(assert (=> mapNonEmpty!28857 m!833741))

(declare-fun b_lambda!12961 () Bool)

(assert (= b_lambda!12957 (or (and b!894751 b_free!15859) b_lambda!12961)))

(declare-fun b_lambda!12963 () Bool)

(assert (= b_lambda!12959 (or (and b!894751 b_free!15859) b_lambda!12963)))

(check-sat tp_is_empty!18187 (not b!895227) (not b!895198) (not b!895216) (not b!895107) (not b!895229) (not bm!39750) (not b!895246) (not b!895095) (not b!895235) (not b!895109) (not d!110859) (not b_lambda!12955) (not d!110939) (not b!895065) (not b!895097) (not b!895144) (not d!110927) (not b!895168) (not d!110935) (not b_lambda!12963) (not b!895225) (not b!895230) (not b_next!15859) (not d!110865) (not b!895243) (not d!110863) (not b!895191) (not d!110851) (not b!895241) (not d!110841) (not b!895098) (not d!110943) (not b!895226) (not b!895133) (not b!895055) (not b_lambda!12951) (not d!110915) (not d!110941) (not d!110947) (not d!110917) (not d!110891) (not b!895174) (not d!110889) (not d!110929) (not bm!39751) (not d!110855) (not b!895106) (not d!110925) (not d!110953) (not b!895062) (not d!110923) (not d!110919) (not b!895176) (not b!895102) (not b!895129) (not d!110951) (not d!110937) (not bm!39745) (not b!895228) (not b!895237) (not d!110949) (not d!110875) (not d!110897) (not b!895194) (not b!895240) (not b!895244) (not b!895199) (not b!895177) (not d!110879) (not b!895139) (not d!110861) (not d!110931) (not d!110907) (not d!110871) (not b!895135) (not b_lambda!12961) (not b!895052) (not b!895248) (not b!895051) (not d!110887) (not d!110957) (not d!110845) (not d!110847) (not b!895096) (not b!895112) (not b!895146) (not b!895099) (not b!895202) (not d!110945) (not b!895100) (not d!110911) (not b!895137) (not d!110869) (not b!895193) (not b!895179) (not b!895184) (not b!895103) (not mapNonEmpty!28857) (not b!895093) (not bm!39749) (not d!110933) (not b!895108) (not b!895143) (not b!895064) (not bm!39748) (not b!895196) (not d!110895) b_and!26159)
(check-sat b_and!26159 (not b_next!15859))
