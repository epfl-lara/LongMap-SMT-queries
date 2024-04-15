; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4284 () Bool)

(assert start!4284)

(declare-fun b_free!1159 () Bool)

(declare-fun b_next!1159 () Bool)

(assert (=> start!4284 (= b_free!1159 (not b_next!1159))))

(declare-fun tp!4903 () Bool)

(declare-fun b_and!1967 () Bool)

(assert (=> start!4284 (= tp!4903 b_and!1967)))

(declare-fun b!32956 () Bool)

(declare-fun e!20927 () Bool)

(declare-fun e!20924 () Bool)

(assert (=> b!32956 (= e!20927 (not e!20924))))

(declare-fun res!20040 () Bool)

(assert (=> b!32956 (=> res!20040 e!20924)))

(declare-datatypes ((array!2211 0))(
  ( (array!2212 (arr!1057 (Array (_ BitVec 32) (_ BitVec 64))) (size!1158 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2211)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!32956 (= res!20040 (not (= (size!1158 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((V!1843 0))(
  ( (V!1844 (val!783 Int)) )
))
(declare-datatypes ((tuple2!1272 0))(
  ( (tuple2!1273 (_1!647 (_ BitVec 64)) (_2!647 V!1843)) )
))
(declare-datatypes ((List!855 0))(
  ( (Nil!852) (Cons!851 (h!1418 tuple2!1272) (t!3545 List!855)) )
))
(declare-datatypes ((ListLongMap!837 0))(
  ( (ListLongMap!838 (toList!434 List!855)) )
))
(declare-fun lt!11953 () ListLongMap!837)

(declare-fun lt!11951 () (_ BitVec 32))

(declare-fun contains!377 (ListLongMap!837 (_ BitVec 64)) Bool)

(assert (=> b!32956 (contains!377 lt!11953 (select (arr!1057 _keys!1833) lt!11951))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!557 0))(
  ( (ValueCellFull!557 (v!1873 V!1843)) (EmptyCell!557) )
))
(declare-datatypes ((array!2213 0))(
  ( (array!2214 (arr!1058 (Array (_ BitVec 32) ValueCell!557)) (size!1159 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2213)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!730 0))(
  ( (Unit!731) )
))
(declare-fun lt!11952 () Unit!730)

(declare-fun zeroValue!1443 () V!1843)

(declare-fun minValue!1443 () V!1843)

(declare-fun lemmaValidKeyInArrayIsInListMap!51 (array!2211 array!2213 (_ BitVec 32) (_ BitVec 32) V!1843 V!1843 (_ BitVec 32) Int) Unit!730)

(assert (=> b!32956 (= lt!11952 (lemmaValidKeyInArrayIsInListMap!51 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11951 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2211 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32956 (= lt!11951 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32957 () Bool)

(declare-fun e!20929 () Bool)

(declare-fun e!20923 () Bool)

(declare-fun mapRes!1804 () Bool)

(assert (=> b!32957 (= e!20929 (and e!20923 mapRes!1804))))

(declare-fun condMapEmpty!1804 () Bool)

(declare-fun mapDefault!1804 () ValueCell!557)

(assert (=> b!32957 (= condMapEmpty!1804 (= (arr!1058 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!557)) mapDefault!1804)))))

(declare-fun b!32958 () Bool)

(declare-fun res!20042 () Bool)

(declare-fun e!20928 () Bool)

(assert (=> b!32958 (=> (not res!20042) (not e!20928))))

(declare-datatypes ((List!856 0))(
  ( (Nil!853) (Cons!852 (h!1419 (_ BitVec 64)) (t!3546 List!856)) )
))
(declare-fun arrayNoDuplicates!0 (array!2211 (_ BitVec 32) List!856) Bool)

(assert (=> b!32958 (= res!20042 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!853))))

(declare-fun b!32959 () Bool)

(declare-datatypes ((SeekEntryResult!129 0))(
  ( (MissingZero!129 (index!2638 (_ BitVec 32))) (Found!129 (index!2639 (_ BitVec 32))) (Intermediate!129 (undefined!941 Bool) (index!2640 (_ BitVec 32)) (x!6787 (_ BitVec 32))) (Undefined!129) (MissingVacant!129 (index!2641 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2211 (_ BitVec 32)) SeekEntryResult!129)

(assert (=> b!32959 (= e!20924 (= (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294) (Found!129 lt!11951)))))

(declare-fun mapIsEmpty!1804 () Bool)

(assert (=> mapIsEmpty!1804 mapRes!1804))

(declare-fun b!32960 () Bool)

(declare-fun res!20044 () Bool)

(assert (=> b!32960 (=> (not res!20044) (not e!20928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32960 (= res!20044 (validKeyInArray!0 k0!1304))))

(declare-fun b!32961 () Bool)

(declare-fun res!20043 () Bool)

(assert (=> b!32961 (=> (not res!20043) (not e!20928))))

(assert (=> b!32961 (= res!20043 (and (= (size!1159 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1158 _keys!1833) (size!1159 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32963 () Bool)

(declare-fun tp_is_empty!1513 () Bool)

(assert (=> b!32963 (= e!20923 tp_is_empty!1513)))

(declare-fun b!32964 () Bool)

(declare-fun res!20041 () Bool)

(assert (=> b!32964 (=> (not res!20041) (not e!20928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2211 (_ BitVec 32)) Bool)

(assert (=> b!32964 (= res!20041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32965 () Bool)

(declare-fun e!20926 () Bool)

(assert (=> b!32965 (= e!20926 tp_is_empty!1513)))

(declare-fun mapNonEmpty!1804 () Bool)

(declare-fun tp!4902 () Bool)

(assert (=> mapNonEmpty!1804 (= mapRes!1804 (and tp!4902 e!20926))))

(declare-fun mapRest!1804 () (Array (_ BitVec 32) ValueCell!557))

(declare-fun mapKey!1804 () (_ BitVec 32))

(declare-fun mapValue!1804 () ValueCell!557)

(assert (=> mapNonEmpty!1804 (= (arr!1058 _values!1501) (store mapRest!1804 mapKey!1804 mapValue!1804))))

(declare-fun b!32966 () Bool)

(declare-fun res!20045 () Bool)

(assert (=> b!32966 (=> (not res!20045) (not e!20927))))

(declare-fun arrayContainsKey!0 (array!2211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32966 (= res!20045 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!20046 () Bool)

(assert (=> start!4284 (=> (not res!20046) (not e!20928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4284 (= res!20046 (validMask!0 mask!2294))))

(assert (=> start!4284 e!20928))

(assert (=> start!4284 true))

(assert (=> start!4284 tp!4903))

(declare-fun array_inv!749 (array!2213) Bool)

(assert (=> start!4284 (and (array_inv!749 _values!1501) e!20929)))

(declare-fun array_inv!750 (array!2211) Bool)

(assert (=> start!4284 (array_inv!750 _keys!1833)))

(assert (=> start!4284 tp_is_empty!1513))

(declare-fun b!32962 () Bool)

(assert (=> b!32962 (= e!20928 e!20927)))

(declare-fun res!20047 () Bool)

(assert (=> b!32962 (=> (not res!20047) (not e!20927))))

(assert (=> b!32962 (= res!20047 (not (contains!377 lt!11953 k0!1304)))))

(declare-fun getCurrentListMap!256 (array!2211 array!2213 (_ BitVec 32) (_ BitVec 32) V!1843 V!1843 (_ BitVec 32) Int) ListLongMap!837)

(assert (=> b!32962 (= lt!11953 (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(assert (= (and start!4284 res!20046) b!32961))

(assert (= (and b!32961 res!20043) b!32964))

(assert (= (and b!32964 res!20041) b!32958))

(assert (= (and b!32958 res!20042) b!32960))

(assert (= (and b!32960 res!20044) b!32962))

(assert (= (and b!32962 res!20047) b!32966))

(assert (= (and b!32966 res!20045) b!32956))

(assert (= (and b!32956 (not res!20040)) b!32959))

(assert (= (and b!32957 condMapEmpty!1804) mapIsEmpty!1804))

(assert (= (and b!32957 (not condMapEmpty!1804)) mapNonEmpty!1804))

(get-info :version)

(assert (= (and mapNonEmpty!1804 ((_ is ValueCellFull!557) mapValue!1804)) b!32965))

(assert (= (and b!32957 ((_ is ValueCellFull!557) mapDefault!1804)) b!32963))

(assert (= start!4284 b!32957))

(declare-fun m!26371 () Bool)

(assert (=> mapNonEmpty!1804 m!26371))

(declare-fun m!26373 () Bool)

(assert (=> b!32959 m!26373))

(declare-fun m!26375 () Bool)

(assert (=> b!32966 m!26375))

(declare-fun m!26377 () Bool)

(assert (=> b!32960 m!26377))

(declare-fun m!26379 () Bool)

(assert (=> b!32958 m!26379))

(declare-fun m!26381 () Bool)

(assert (=> b!32956 m!26381))

(assert (=> b!32956 m!26381))

(declare-fun m!26383 () Bool)

(assert (=> b!32956 m!26383))

(declare-fun m!26385 () Bool)

(assert (=> b!32956 m!26385))

(declare-fun m!26387 () Bool)

(assert (=> b!32956 m!26387))

(declare-fun m!26389 () Bool)

(assert (=> b!32964 m!26389))

(declare-fun m!26391 () Bool)

(assert (=> b!32962 m!26391))

(declare-fun m!26393 () Bool)

(assert (=> b!32962 m!26393))

(declare-fun m!26395 () Bool)

(assert (=> start!4284 m!26395))

(declare-fun m!26397 () Bool)

(assert (=> start!4284 m!26397))

(declare-fun m!26399 () Bool)

(assert (=> start!4284 m!26399))

(check-sat (not mapNonEmpty!1804) (not b!32960) (not b!32958) (not b!32956) (not b_next!1159) (not b!32962) (not b!32959) (not b!32966) (not start!4284) tp_is_empty!1513 (not b!32964) b_and!1967)
(check-sat b_and!1967 (not b_next!1159))
(get-model)

(declare-fun d!5091 () Bool)

(assert (=> d!5091 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32960 d!5091))

(declare-fun d!5093 () Bool)

(assert (=> d!5093 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4284 d!5093))

(declare-fun d!5095 () Bool)

(assert (=> d!5095 (= (array_inv!749 _values!1501) (bvsge (size!1159 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4284 d!5095))

(declare-fun d!5097 () Bool)

(assert (=> d!5097 (= (array_inv!750 _keys!1833) (bvsge (size!1158 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4284 d!5097))

(declare-fun d!5099 () Bool)

(declare-fun e!20977 () Bool)

(assert (=> d!5099 e!20977))

(declare-fun res!20098 () Bool)

(assert (=> d!5099 (=> res!20098 e!20977)))

(declare-fun lt!11983 () Bool)

(assert (=> d!5099 (= res!20098 (not lt!11983))))

(declare-fun lt!11981 () Bool)

(assert (=> d!5099 (= lt!11983 lt!11981)))

(declare-fun lt!11982 () Unit!730)

(declare-fun e!20976 () Unit!730)

(assert (=> d!5099 (= lt!11982 e!20976)))

(declare-fun c!3789 () Bool)

(assert (=> d!5099 (= c!3789 lt!11981)))

(declare-fun containsKey!30 (List!855 (_ BitVec 64)) Bool)

(assert (=> d!5099 (= lt!11981 (containsKey!30 (toList!434 lt!11953) (select (arr!1057 _keys!1833) lt!11951)))))

(assert (=> d!5099 (= (contains!377 lt!11953 (select (arr!1057 _keys!1833) lt!11951)) lt!11983)))

(declare-fun b!33039 () Bool)

(declare-fun lt!11980 () Unit!730)

(assert (=> b!33039 (= e!20976 lt!11980)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!27 (List!855 (_ BitVec 64)) Unit!730)

(assert (=> b!33039 (= lt!11980 (lemmaContainsKeyImpliesGetValueByKeyDefined!27 (toList!434 lt!11953) (select (arr!1057 _keys!1833) lt!11951)))))

(declare-datatypes ((Option!72 0))(
  ( (Some!71 (v!1876 V!1843)) (None!70) )
))
(declare-fun isDefined!28 (Option!72) Bool)

(declare-fun getValueByKey!66 (List!855 (_ BitVec 64)) Option!72)

(assert (=> b!33039 (isDefined!28 (getValueByKey!66 (toList!434 lt!11953) (select (arr!1057 _keys!1833) lt!11951)))))

(declare-fun b!33040 () Bool)

(declare-fun Unit!734 () Unit!730)

(assert (=> b!33040 (= e!20976 Unit!734)))

(declare-fun b!33041 () Bool)

(assert (=> b!33041 (= e!20977 (isDefined!28 (getValueByKey!66 (toList!434 lt!11953) (select (arr!1057 _keys!1833) lt!11951))))))

(assert (= (and d!5099 c!3789) b!33039))

(assert (= (and d!5099 (not c!3789)) b!33040))

(assert (= (and d!5099 (not res!20098)) b!33041))

(assert (=> d!5099 m!26381))

(declare-fun m!26461 () Bool)

(assert (=> d!5099 m!26461))

(assert (=> b!33039 m!26381))

(declare-fun m!26463 () Bool)

(assert (=> b!33039 m!26463))

(assert (=> b!33039 m!26381))

(declare-fun m!26465 () Bool)

(assert (=> b!33039 m!26465))

(assert (=> b!33039 m!26465))

(declare-fun m!26467 () Bool)

(assert (=> b!33039 m!26467))

(assert (=> b!33041 m!26381))

(assert (=> b!33041 m!26465))

(assert (=> b!33041 m!26465))

(assert (=> b!33041 m!26467))

(assert (=> b!32956 d!5099))

(declare-fun d!5101 () Bool)

(declare-fun e!20980 () Bool)

(assert (=> d!5101 e!20980))

(declare-fun res!20101 () Bool)

(assert (=> d!5101 (=> (not res!20101) (not e!20980))))

(assert (=> d!5101 (= res!20101 (and (bvsge lt!11951 #b00000000000000000000000000000000) (bvslt lt!11951 (size!1158 _keys!1833))))))

(declare-fun lt!11986 () Unit!730)

(declare-fun choose!216 (array!2211 array!2213 (_ BitVec 32) (_ BitVec 32) V!1843 V!1843 (_ BitVec 32) Int) Unit!730)

(assert (=> d!5101 (= lt!11986 (choose!216 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11951 defaultEntry!1504))))

(assert (=> d!5101 (validMask!0 mask!2294)))

(assert (=> d!5101 (= (lemmaValidKeyInArrayIsInListMap!51 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11951 defaultEntry!1504) lt!11986)))

(declare-fun b!33044 () Bool)

(assert (=> b!33044 (= e!20980 (contains!377 (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1057 _keys!1833) lt!11951)))))

(assert (= (and d!5101 res!20101) b!33044))

(declare-fun m!26469 () Bool)

(assert (=> d!5101 m!26469))

(assert (=> d!5101 m!26395))

(assert (=> b!33044 m!26393))

(assert (=> b!33044 m!26381))

(assert (=> b!33044 m!26393))

(assert (=> b!33044 m!26381))

(declare-fun m!26471 () Bool)

(assert (=> b!33044 m!26471))

(assert (=> b!32956 d!5101))

(declare-fun d!5103 () Bool)

(declare-fun lt!11989 () (_ BitVec 32))

(assert (=> d!5103 (and (or (bvslt lt!11989 #b00000000000000000000000000000000) (bvsge lt!11989 (size!1158 _keys!1833)) (and (bvsge lt!11989 #b00000000000000000000000000000000) (bvslt lt!11989 (size!1158 _keys!1833)))) (bvsge lt!11989 #b00000000000000000000000000000000) (bvslt lt!11989 (size!1158 _keys!1833)) (= (select (arr!1057 _keys!1833) lt!11989) k0!1304))))

(declare-fun e!20983 () (_ BitVec 32))

(assert (=> d!5103 (= lt!11989 e!20983)))

(declare-fun c!3792 () Bool)

(assert (=> d!5103 (= c!3792 (= (select (arr!1057 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5103 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1158 _keys!1833)) (bvslt (size!1158 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5103 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!11989)))

(declare-fun b!33049 () Bool)

(assert (=> b!33049 (= e!20983 #b00000000000000000000000000000000)))

(declare-fun b!33050 () Bool)

(assert (=> b!33050 (= e!20983 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5103 c!3792) b!33049))

(assert (= (and d!5103 (not c!3792)) b!33050))

(declare-fun m!26473 () Bool)

(assert (=> d!5103 m!26473))

(declare-fun m!26475 () Bool)

(assert (=> d!5103 m!26475))

(declare-fun m!26477 () Bool)

(assert (=> b!33050 m!26477))

(assert (=> b!32956 d!5103))

(declare-fun d!5105 () Bool)

(declare-fun e!20985 () Bool)

(assert (=> d!5105 e!20985))

(declare-fun res!20102 () Bool)

(assert (=> d!5105 (=> res!20102 e!20985)))

(declare-fun lt!11993 () Bool)

(assert (=> d!5105 (= res!20102 (not lt!11993))))

(declare-fun lt!11991 () Bool)

(assert (=> d!5105 (= lt!11993 lt!11991)))

(declare-fun lt!11992 () Unit!730)

(declare-fun e!20984 () Unit!730)

(assert (=> d!5105 (= lt!11992 e!20984)))

(declare-fun c!3793 () Bool)

(assert (=> d!5105 (= c!3793 lt!11991)))

(assert (=> d!5105 (= lt!11991 (containsKey!30 (toList!434 lt!11953) k0!1304))))

(assert (=> d!5105 (= (contains!377 lt!11953 k0!1304) lt!11993)))

(declare-fun b!33051 () Bool)

(declare-fun lt!11990 () Unit!730)

(assert (=> b!33051 (= e!20984 lt!11990)))

(assert (=> b!33051 (= lt!11990 (lemmaContainsKeyImpliesGetValueByKeyDefined!27 (toList!434 lt!11953) k0!1304))))

(assert (=> b!33051 (isDefined!28 (getValueByKey!66 (toList!434 lt!11953) k0!1304))))

(declare-fun b!33052 () Bool)

(declare-fun Unit!735 () Unit!730)

(assert (=> b!33052 (= e!20984 Unit!735)))

(declare-fun b!33053 () Bool)

(assert (=> b!33053 (= e!20985 (isDefined!28 (getValueByKey!66 (toList!434 lt!11953) k0!1304)))))

(assert (= (and d!5105 c!3793) b!33051))

(assert (= (and d!5105 (not c!3793)) b!33052))

(assert (= (and d!5105 (not res!20102)) b!33053))

(declare-fun m!26479 () Bool)

(assert (=> d!5105 m!26479))

(declare-fun m!26481 () Bool)

(assert (=> b!33051 m!26481))

(declare-fun m!26483 () Bool)

(assert (=> b!33051 m!26483))

(assert (=> b!33051 m!26483))

(declare-fun m!26485 () Bool)

(assert (=> b!33051 m!26485))

(assert (=> b!33053 m!26483))

(assert (=> b!33053 m!26483))

(assert (=> b!33053 m!26485))

(assert (=> b!32962 d!5105))

(declare-fun b!33096 () Bool)

(declare-fun c!3810 () Bool)

(assert (=> b!33096 (= c!3810 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!21022 () ListLongMap!837)

(declare-fun e!21020 () ListLongMap!837)

(assert (=> b!33096 (= e!21022 e!21020)))

(declare-fun b!33097 () Bool)

(declare-fun e!21012 () Bool)

(assert (=> b!33097 (= e!21012 (validKeyInArray!0 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33098 () Bool)

(declare-fun e!21018 () Bool)

(declare-fun lt!12059 () ListLongMap!837)

(declare-fun apply!35 (ListLongMap!837 (_ BitVec 64)) V!1843)

(assert (=> b!33098 (= e!21018 (= (apply!35 lt!12059 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!33099 () Bool)

(declare-fun e!21015 () ListLongMap!837)

(assert (=> b!33099 (= e!21015 e!21022)))

(declare-fun c!3811 () Bool)

(assert (=> b!33099 (= c!3811 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33100 () Bool)

(declare-fun call!2659 () ListLongMap!837)

(declare-fun +!53 (ListLongMap!837 tuple2!1272) ListLongMap!837)

(assert (=> b!33100 (= e!21015 (+!53 call!2659 (tuple2!1273 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!33101 () Bool)

(declare-fun e!21024 () Bool)

(declare-fun call!2657 () Bool)

(assert (=> b!33101 (= e!21024 (not call!2657))))

(declare-fun b!33102 () Bool)

(declare-fun e!21013 () Bool)

(assert (=> b!33102 (= e!21013 (validKeyInArray!0 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33103 () Bool)

(declare-fun e!21023 () Bool)

(assert (=> b!33103 (= e!21023 (= (apply!35 lt!12059 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!33104 () Bool)

(declare-fun call!2660 () ListLongMap!837)

(assert (=> b!33104 (= e!21020 call!2660)))

(declare-fun bm!2655 () Bool)

(declare-fun call!2662 () ListLongMap!837)

(declare-fun call!2663 () ListLongMap!837)

(assert (=> bm!2655 (= call!2662 call!2663)))

(declare-fun b!33105 () Bool)

(declare-fun e!21016 () Bool)

(assert (=> b!33105 (= e!21016 e!21024)))

(declare-fun c!3807 () Bool)

(assert (=> b!33105 (= c!3807 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2656 () Bool)

(declare-fun call!2661 () ListLongMap!837)

(assert (=> bm!2656 (= call!2663 call!2661)))

(declare-fun b!33106 () Bool)

(declare-fun e!21017 () Bool)

(declare-fun e!21019 () Bool)

(assert (=> b!33106 (= e!21017 e!21019)))

(declare-fun res!20129 () Bool)

(assert (=> b!33106 (=> (not res!20129) (not e!21019))))

(assert (=> b!33106 (= res!20129 (contains!377 lt!12059 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!33106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1158 _keys!1833)))))

(declare-fun b!33107 () Bool)

(assert (=> b!33107 (= e!21024 e!21018)))

(declare-fun res!20124 () Bool)

(assert (=> b!33107 (= res!20124 call!2657)))

(assert (=> b!33107 (=> (not res!20124) (not e!21018))))

(declare-fun b!33108 () Bool)

(declare-fun e!21021 () Unit!730)

(declare-fun Unit!736 () Unit!730)

(assert (=> b!33108 (= e!21021 Unit!736)))

(declare-fun b!33109 () Bool)

(declare-fun get!564 (ValueCell!557 V!1843) V!1843)

(declare-fun dynLambda!151 (Int (_ BitVec 64)) V!1843)

(assert (=> b!33109 (= e!21019 (= (apply!35 lt!12059 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000)) (get!564 (select (arr!1058 _values!1501) #b00000000000000000000000000000000) (dynLambda!151 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33109 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1159 _values!1501)))))

(assert (=> b!33109 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1158 _keys!1833)))))

(declare-fun b!33110 () Bool)

(assert (=> b!33110 (= e!21022 call!2660)))

(declare-fun b!33111 () Bool)

(declare-fun e!21014 () Bool)

(declare-fun call!2658 () Bool)

(assert (=> b!33111 (= e!21014 (not call!2658))))

(declare-fun bm!2657 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!22 (array!2211 array!2213 (_ BitVec 32) (_ BitVec 32) V!1843 V!1843 (_ BitVec 32) Int) ListLongMap!837)

(assert (=> bm!2657 (= call!2661 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33112 () Bool)

(declare-fun lt!12058 () Unit!730)

(assert (=> b!33112 (= e!21021 lt!12058)))

(declare-fun lt!12039 () ListLongMap!837)

(assert (=> b!33112 (= lt!12039 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12052 () (_ BitVec 64))

(assert (=> b!33112 (= lt!12052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12043 () (_ BitVec 64))

(assert (=> b!33112 (= lt!12043 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12056 () Unit!730)

(declare-fun addStillContains!20 (ListLongMap!837 (_ BitVec 64) V!1843 (_ BitVec 64)) Unit!730)

(assert (=> b!33112 (= lt!12056 (addStillContains!20 lt!12039 lt!12052 zeroValue!1443 lt!12043))))

(assert (=> b!33112 (contains!377 (+!53 lt!12039 (tuple2!1273 lt!12052 zeroValue!1443)) lt!12043)))

(declare-fun lt!12046 () Unit!730)

(assert (=> b!33112 (= lt!12046 lt!12056)))

(declare-fun lt!12041 () ListLongMap!837)

(assert (=> b!33112 (= lt!12041 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12040 () (_ BitVec 64))

(assert (=> b!33112 (= lt!12040 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12042 () (_ BitVec 64))

(assert (=> b!33112 (= lt!12042 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12055 () Unit!730)

(declare-fun addApplyDifferent!20 (ListLongMap!837 (_ BitVec 64) V!1843 (_ BitVec 64)) Unit!730)

(assert (=> b!33112 (= lt!12055 (addApplyDifferent!20 lt!12041 lt!12040 minValue!1443 lt!12042))))

(assert (=> b!33112 (= (apply!35 (+!53 lt!12041 (tuple2!1273 lt!12040 minValue!1443)) lt!12042) (apply!35 lt!12041 lt!12042))))

(declare-fun lt!12050 () Unit!730)

(assert (=> b!33112 (= lt!12050 lt!12055)))

(declare-fun lt!12049 () ListLongMap!837)

(assert (=> b!33112 (= lt!12049 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12045 () (_ BitVec 64))

(assert (=> b!33112 (= lt!12045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12053 () (_ BitVec 64))

(assert (=> b!33112 (= lt!12053 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12047 () Unit!730)

(assert (=> b!33112 (= lt!12047 (addApplyDifferent!20 lt!12049 lt!12045 zeroValue!1443 lt!12053))))

(assert (=> b!33112 (= (apply!35 (+!53 lt!12049 (tuple2!1273 lt!12045 zeroValue!1443)) lt!12053) (apply!35 lt!12049 lt!12053))))

(declare-fun lt!12054 () Unit!730)

(assert (=> b!33112 (= lt!12054 lt!12047)))

(declare-fun lt!12038 () ListLongMap!837)

(assert (=> b!33112 (= lt!12038 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12044 () (_ BitVec 64))

(assert (=> b!33112 (= lt!12044 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12057 () (_ BitVec 64))

(assert (=> b!33112 (= lt!12057 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!33112 (= lt!12058 (addApplyDifferent!20 lt!12038 lt!12044 minValue!1443 lt!12057))))

(assert (=> b!33112 (= (apply!35 (+!53 lt!12038 (tuple2!1273 lt!12044 minValue!1443)) lt!12057) (apply!35 lt!12038 lt!12057))))

(declare-fun b!33113 () Bool)

(declare-fun res!20126 () Bool)

(assert (=> b!33113 (=> (not res!20126) (not e!21016))))

(assert (=> b!33113 (= res!20126 e!21017)))

(declare-fun res!20121 () Bool)

(assert (=> b!33113 (=> res!20121 e!21017)))

(assert (=> b!33113 (= res!20121 (not e!21013))))

(declare-fun res!20127 () Bool)

(assert (=> b!33113 (=> (not res!20127) (not e!21013))))

(assert (=> b!33113 (= res!20127 (bvslt #b00000000000000000000000000000000 (size!1158 _keys!1833)))))

(declare-fun bm!2658 () Bool)

(assert (=> bm!2658 (= call!2658 (contains!377 lt!12059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2654 () Bool)

(assert (=> bm!2654 (= call!2660 call!2659)))

(declare-fun d!5107 () Bool)

(assert (=> d!5107 e!21016))

(declare-fun res!20128 () Bool)

(assert (=> d!5107 (=> (not res!20128) (not e!21016))))

(assert (=> d!5107 (= res!20128 (or (bvsge #b00000000000000000000000000000000 (size!1158 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1158 _keys!1833)))))))

(declare-fun lt!12048 () ListLongMap!837)

(assert (=> d!5107 (= lt!12059 lt!12048)))

(declare-fun lt!12051 () Unit!730)

(assert (=> d!5107 (= lt!12051 e!21021)))

(declare-fun c!3806 () Bool)

(assert (=> d!5107 (= c!3806 e!21012)))

(declare-fun res!20125 () Bool)

(assert (=> d!5107 (=> (not res!20125) (not e!21012))))

(assert (=> d!5107 (= res!20125 (bvslt #b00000000000000000000000000000000 (size!1158 _keys!1833)))))

(assert (=> d!5107 (= lt!12048 e!21015)))

(declare-fun c!3808 () Bool)

(assert (=> d!5107 (= c!3808 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5107 (validMask!0 mask!2294)))

(assert (=> d!5107 (= (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12059)))

(declare-fun b!33114 () Bool)

(declare-fun res!20123 () Bool)

(assert (=> b!33114 (=> (not res!20123) (not e!21016))))

(assert (=> b!33114 (= res!20123 e!21014)))

(declare-fun c!3809 () Bool)

(assert (=> b!33114 (= c!3809 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!2659 () Bool)

(assert (=> bm!2659 (= call!2657 (contains!377 lt!12059 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!33115 () Bool)

(assert (=> b!33115 (= e!21014 e!21023)))

(declare-fun res!20122 () Bool)

(assert (=> b!33115 (= res!20122 call!2658)))

(assert (=> b!33115 (=> (not res!20122) (not e!21023))))

(declare-fun b!33116 () Bool)

(assert (=> b!33116 (= e!21020 call!2662)))

(declare-fun bm!2660 () Bool)

(assert (=> bm!2660 (= call!2659 (+!53 (ite c!3808 call!2661 (ite c!3811 call!2663 call!2662)) (ite (or c!3808 c!3811) (tuple2!1273 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1273 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (= (and d!5107 c!3808) b!33100))

(assert (= (and d!5107 (not c!3808)) b!33099))

(assert (= (and b!33099 c!3811) b!33110))

(assert (= (and b!33099 (not c!3811)) b!33096))

(assert (= (and b!33096 c!3810) b!33104))

(assert (= (and b!33096 (not c!3810)) b!33116))

(assert (= (or b!33104 b!33116) bm!2655))

(assert (= (or b!33110 bm!2655) bm!2656))

(assert (= (or b!33110 b!33104) bm!2654))

(assert (= (or b!33100 bm!2656) bm!2657))

(assert (= (or b!33100 bm!2654) bm!2660))

(assert (= (and d!5107 res!20125) b!33097))

(assert (= (and d!5107 c!3806) b!33112))

(assert (= (and d!5107 (not c!3806)) b!33108))

(assert (= (and d!5107 res!20128) b!33113))

(assert (= (and b!33113 res!20127) b!33102))

(assert (= (and b!33113 (not res!20121)) b!33106))

(assert (= (and b!33106 res!20129) b!33109))

(assert (= (and b!33113 res!20126) b!33114))

(assert (= (and b!33114 c!3809) b!33115))

(assert (= (and b!33114 (not c!3809)) b!33111))

(assert (= (and b!33115 res!20122) b!33103))

(assert (= (or b!33115 b!33111) bm!2658))

(assert (= (and b!33114 res!20123) b!33105))

(assert (= (and b!33105 c!3807) b!33107))

(assert (= (and b!33105 (not c!3807)) b!33101))

(assert (= (and b!33107 res!20124) b!33098))

(assert (= (or b!33107 b!33101) bm!2659))

(declare-fun b_lambda!1691 () Bool)

(assert (=> (not b_lambda!1691) (not b!33109)))

(declare-fun t!3552 () Bool)

(declare-fun tb!679 () Bool)

(assert (=> (and start!4284 (= defaultEntry!1504 defaultEntry!1504) t!3552) tb!679))

(declare-fun result!1159 () Bool)

(assert (=> tb!679 (= result!1159 tp_is_empty!1513)))

(assert (=> b!33109 t!3552))

(declare-fun b_and!1973 () Bool)

(assert (= b_and!1967 (and (=> t!3552 result!1159) b_and!1973)))

(declare-fun m!26487 () Bool)

(assert (=> bm!2660 m!26487))

(assert (=> b!33102 m!26475))

(assert (=> b!33102 m!26475))

(declare-fun m!26489 () Bool)

(assert (=> b!33102 m!26489))

(declare-fun m!26491 () Bool)

(assert (=> b!33103 m!26491))

(declare-fun m!26493 () Bool)

(assert (=> bm!2658 m!26493))

(assert (=> b!33097 m!26475))

(assert (=> b!33097 m!26475))

(assert (=> b!33097 m!26489))

(declare-fun m!26495 () Bool)

(assert (=> bm!2659 m!26495))

(declare-fun m!26497 () Bool)

(assert (=> b!33112 m!26497))

(declare-fun m!26499 () Bool)

(assert (=> b!33112 m!26499))

(declare-fun m!26501 () Bool)

(assert (=> b!33112 m!26501))

(declare-fun m!26503 () Bool)

(assert (=> b!33112 m!26503))

(declare-fun m!26505 () Bool)

(assert (=> b!33112 m!26505))

(declare-fun m!26507 () Bool)

(assert (=> b!33112 m!26507))

(declare-fun m!26509 () Bool)

(assert (=> b!33112 m!26509))

(declare-fun m!26511 () Bool)

(assert (=> b!33112 m!26511))

(assert (=> b!33112 m!26511))

(declare-fun m!26513 () Bool)

(assert (=> b!33112 m!26513))

(assert (=> b!33112 m!26475))

(declare-fun m!26515 () Bool)

(assert (=> b!33112 m!26515))

(declare-fun m!26517 () Bool)

(assert (=> b!33112 m!26517))

(declare-fun m!26519 () Bool)

(assert (=> b!33112 m!26519))

(declare-fun m!26521 () Bool)

(assert (=> b!33112 m!26521))

(assert (=> b!33112 m!26507))

(declare-fun m!26523 () Bool)

(assert (=> b!33112 m!26523))

(assert (=> b!33112 m!26501))

(assert (=> b!33112 m!26497))

(declare-fun m!26525 () Bool)

(assert (=> b!33112 m!26525))

(declare-fun m!26527 () Bool)

(assert (=> b!33112 m!26527))

(declare-fun m!26529 () Bool)

(assert (=> b!33100 m!26529))

(assert (=> b!33106 m!26475))

(assert (=> b!33106 m!26475))

(declare-fun m!26531 () Bool)

(assert (=> b!33106 m!26531))

(declare-fun m!26533 () Bool)

(assert (=> b!33109 m!26533))

(declare-fun m!26535 () Bool)

(assert (=> b!33109 m!26535))

(declare-fun m!26537 () Bool)

(assert (=> b!33109 m!26537))

(assert (=> b!33109 m!26475))

(assert (=> b!33109 m!26535))

(assert (=> b!33109 m!26533))

(assert (=> b!33109 m!26475))

(declare-fun m!26539 () Bool)

(assert (=> b!33109 m!26539))

(assert (=> bm!2657 m!26517))

(assert (=> d!5107 m!26395))

(declare-fun m!26541 () Bool)

(assert (=> b!33098 m!26541))

(assert (=> b!32962 d!5107))

(declare-fun b!33129 () Bool)

(declare-fun e!21034 () Bool)

(declare-fun contains!380 (List!856 (_ BitVec 64)) Bool)

(assert (=> b!33129 (= e!21034 (contains!380 Nil!853 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33130 () Bool)

(declare-fun e!21033 () Bool)

(declare-fun call!2666 () Bool)

(assert (=> b!33130 (= e!21033 call!2666)))

(declare-fun b!33131 () Bool)

(declare-fun e!21035 () Bool)

(declare-fun e!21036 () Bool)

(assert (=> b!33131 (= e!21035 e!21036)))

(declare-fun res!20136 () Bool)

(assert (=> b!33131 (=> (not res!20136) (not e!21036))))

(assert (=> b!33131 (= res!20136 (not e!21034))))

(declare-fun res!20137 () Bool)

(assert (=> b!33131 (=> (not res!20137) (not e!21034))))

(assert (=> b!33131 (= res!20137 (validKeyInArray!0 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33132 () Bool)

(assert (=> b!33132 (= e!21033 call!2666)))

(declare-fun bm!2663 () Bool)

(declare-fun c!3814 () Bool)

(assert (=> bm!2663 (= call!2666 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3814 (Cons!852 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000) Nil!853) Nil!853)))))

(declare-fun b!33133 () Bool)

(assert (=> b!33133 (= e!21036 e!21033)))

(assert (=> b!33133 (= c!3814 (validKeyInArray!0 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5109 () Bool)

(declare-fun res!20138 () Bool)

(assert (=> d!5109 (=> res!20138 e!21035)))

(assert (=> d!5109 (= res!20138 (bvsge #b00000000000000000000000000000000 (size!1158 _keys!1833)))))

(assert (=> d!5109 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!853) e!21035)))

(assert (= (and d!5109 (not res!20138)) b!33131))

(assert (= (and b!33131 res!20137) b!33129))

(assert (= (and b!33131 res!20136) b!33133))

(assert (= (and b!33133 c!3814) b!33130))

(assert (= (and b!33133 (not c!3814)) b!33132))

(assert (= (or b!33130 b!33132) bm!2663))

(assert (=> b!33129 m!26475))

(assert (=> b!33129 m!26475))

(declare-fun m!26543 () Bool)

(assert (=> b!33129 m!26543))

(assert (=> b!33131 m!26475))

(assert (=> b!33131 m!26475))

(assert (=> b!33131 m!26489))

(assert (=> bm!2663 m!26475))

(declare-fun m!26545 () Bool)

(assert (=> bm!2663 m!26545))

(assert (=> b!33133 m!26475))

(assert (=> b!33133 m!26475))

(assert (=> b!33133 m!26489))

(assert (=> b!32958 d!5109))

(declare-fun d!5111 () Bool)

(declare-fun res!20143 () Bool)

(declare-fun e!21041 () Bool)

(assert (=> d!5111 (=> res!20143 e!21041)))

(assert (=> d!5111 (= res!20143 (= (select (arr!1057 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5111 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21041)))

(declare-fun b!33138 () Bool)

(declare-fun e!21042 () Bool)

(assert (=> b!33138 (= e!21041 e!21042)))

(declare-fun res!20144 () Bool)

(assert (=> b!33138 (=> (not res!20144) (not e!21042))))

(assert (=> b!33138 (= res!20144 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1158 _keys!1833)))))

(declare-fun b!33139 () Bool)

(assert (=> b!33139 (= e!21042 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5111 (not res!20143)) b!33138))

(assert (= (and b!33138 res!20144) b!33139))

(assert (=> d!5111 m!26475))

(declare-fun m!26547 () Bool)

(assert (=> b!33139 m!26547))

(assert (=> b!32966 d!5111))

(declare-fun b!33152 () Bool)

(declare-fun e!21051 () SeekEntryResult!129)

(declare-fun lt!12067 () SeekEntryResult!129)

(assert (=> b!33152 (= e!21051 (MissingZero!129 (index!2640 lt!12067)))))

(declare-fun b!33153 () Bool)

(declare-fun c!3823 () Bool)

(declare-fun lt!12066 () (_ BitVec 64))

(assert (=> b!33153 (= c!3823 (= lt!12066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21049 () SeekEntryResult!129)

(assert (=> b!33153 (= e!21049 e!21051)))

(declare-fun b!33154 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2211 (_ BitVec 32)) SeekEntryResult!129)

(assert (=> b!33154 (= e!21051 (seekKeyOrZeroReturnVacant!0 (x!6787 lt!12067) (index!2640 lt!12067) (index!2640 lt!12067) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!33155 () Bool)

(declare-fun e!21050 () SeekEntryResult!129)

(assert (=> b!33155 (= e!21050 e!21049)))

(assert (=> b!33155 (= lt!12066 (select (arr!1057 _keys!1833) (index!2640 lt!12067)))))

(declare-fun c!3821 () Bool)

(assert (=> b!33155 (= c!3821 (= lt!12066 k0!1304))))

(declare-fun d!5113 () Bool)

(declare-fun lt!12068 () SeekEntryResult!129)

(assert (=> d!5113 (and (or ((_ is Undefined!129) lt!12068) (not ((_ is Found!129) lt!12068)) (and (bvsge (index!2639 lt!12068) #b00000000000000000000000000000000) (bvslt (index!2639 lt!12068) (size!1158 _keys!1833)))) (or ((_ is Undefined!129) lt!12068) ((_ is Found!129) lt!12068) (not ((_ is MissingZero!129) lt!12068)) (and (bvsge (index!2638 lt!12068) #b00000000000000000000000000000000) (bvslt (index!2638 lt!12068) (size!1158 _keys!1833)))) (or ((_ is Undefined!129) lt!12068) ((_ is Found!129) lt!12068) ((_ is MissingZero!129) lt!12068) (not ((_ is MissingVacant!129) lt!12068)) (and (bvsge (index!2641 lt!12068) #b00000000000000000000000000000000) (bvslt (index!2641 lt!12068) (size!1158 _keys!1833)))) (or ((_ is Undefined!129) lt!12068) (ite ((_ is Found!129) lt!12068) (= (select (arr!1057 _keys!1833) (index!2639 lt!12068)) k0!1304) (ite ((_ is MissingZero!129) lt!12068) (= (select (arr!1057 _keys!1833) (index!2638 lt!12068)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!129) lt!12068) (= (select (arr!1057 _keys!1833) (index!2641 lt!12068)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!5113 (= lt!12068 e!21050)))

(declare-fun c!3822 () Bool)

(assert (=> d!5113 (= c!3822 (and ((_ is Intermediate!129) lt!12067) (undefined!941 lt!12067)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2211 (_ BitVec 32)) SeekEntryResult!129)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5113 (= lt!12067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5113 (validMask!0 mask!2294)))

(assert (=> d!5113 (= (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294) lt!12068)))

(declare-fun b!33156 () Bool)

(assert (=> b!33156 (= e!21049 (Found!129 (index!2640 lt!12067)))))

(declare-fun b!33157 () Bool)

(assert (=> b!33157 (= e!21050 Undefined!129)))

(assert (= (and d!5113 c!3822) b!33157))

(assert (= (and d!5113 (not c!3822)) b!33155))

(assert (= (and b!33155 c!3821) b!33156))

(assert (= (and b!33155 (not c!3821)) b!33153))

(assert (= (and b!33153 c!3823) b!33152))

(assert (= (and b!33153 (not c!3823)) b!33154))

(declare-fun m!26549 () Bool)

(assert (=> b!33154 m!26549))

(declare-fun m!26551 () Bool)

(assert (=> b!33155 m!26551))

(declare-fun m!26553 () Bool)

(assert (=> d!5113 m!26553))

(declare-fun m!26555 () Bool)

(assert (=> d!5113 m!26555))

(declare-fun m!26557 () Bool)

(assert (=> d!5113 m!26557))

(assert (=> d!5113 m!26395))

(assert (=> d!5113 m!26553))

(declare-fun m!26559 () Bool)

(assert (=> d!5113 m!26559))

(declare-fun m!26561 () Bool)

(assert (=> d!5113 m!26561))

(assert (=> b!32959 d!5113))

(declare-fun b!33166 () Bool)

(declare-fun e!21059 () Bool)

(declare-fun call!2669 () Bool)

(assert (=> b!33166 (= e!21059 call!2669)))

(declare-fun b!33167 () Bool)

(declare-fun e!21060 () Bool)

(declare-fun e!21058 () Bool)

(assert (=> b!33167 (= e!21060 e!21058)))

(declare-fun c!3826 () Bool)

(assert (=> b!33167 (= c!3826 (validKeyInArray!0 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33168 () Bool)

(assert (=> b!33168 (= e!21058 call!2669)))

(declare-fun bm!2666 () Bool)

(assert (=> bm!2666 (= call!2669 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!5115 () Bool)

(declare-fun res!20150 () Bool)

(assert (=> d!5115 (=> res!20150 e!21060)))

(assert (=> d!5115 (= res!20150 (bvsge #b00000000000000000000000000000000 (size!1158 _keys!1833)))))

(assert (=> d!5115 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21060)))

(declare-fun b!33169 () Bool)

(assert (=> b!33169 (= e!21058 e!21059)))

(declare-fun lt!12076 () (_ BitVec 64))

(assert (=> b!33169 (= lt!12076 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12077 () Unit!730)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2211 (_ BitVec 64) (_ BitVec 32)) Unit!730)

(assert (=> b!33169 (= lt!12077 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12076 #b00000000000000000000000000000000))))

(assert (=> b!33169 (arrayContainsKey!0 _keys!1833 lt!12076 #b00000000000000000000000000000000)))

(declare-fun lt!12075 () Unit!730)

(assert (=> b!33169 (= lt!12075 lt!12077)))

(declare-fun res!20149 () Bool)

(assert (=> b!33169 (= res!20149 (= (seekEntryOrOpen!0 (select (arr!1057 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!129 #b00000000000000000000000000000000)))))

(assert (=> b!33169 (=> (not res!20149) (not e!21059))))

(assert (= (and d!5115 (not res!20150)) b!33167))

(assert (= (and b!33167 c!3826) b!33169))

(assert (= (and b!33167 (not c!3826)) b!33168))

(assert (= (and b!33169 res!20149) b!33166))

(assert (= (or b!33166 b!33168) bm!2666))

(assert (=> b!33167 m!26475))

(assert (=> b!33167 m!26475))

(assert (=> b!33167 m!26489))

(declare-fun m!26563 () Bool)

(assert (=> bm!2666 m!26563))

(assert (=> b!33169 m!26475))

(declare-fun m!26565 () Bool)

(assert (=> b!33169 m!26565))

(declare-fun m!26567 () Bool)

(assert (=> b!33169 m!26567))

(assert (=> b!33169 m!26475))

(declare-fun m!26569 () Bool)

(assert (=> b!33169 m!26569))

(assert (=> b!32964 d!5115))

(declare-fun b!33176 () Bool)

(declare-fun e!21065 () Bool)

(assert (=> b!33176 (= e!21065 tp_is_empty!1513)))

(declare-fun mapIsEmpty!1813 () Bool)

(declare-fun mapRes!1813 () Bool)

(assert (=> mapIsEmpty!1813 mapRes!1813))

(declare-fun condMapEmpty!1813 () Bool)

(declare-fun mapDefault!1813 () ValueCell!557)

(assert (=> mapNonEmpty!1804 (= condMapEmpty!1813 (= mapRest!1804 ((as const (Array (_ BitVec 32) ValueCell!557)) mapDefault!1813)))))

(declare-fun e!21066 () Bool)

(assert (=> mapNonEmpty!1804 (= tp!4902 (and e!21066 mapRes!1813))))

(declare-fun mapNonEmpty!1813 () Bool)

(declare-fun tp!4918 () Bool)

(assert (=> mapNonEmpty!1813 (= mapRes!1813 (and tp!4918 e!21065))))

(declare-fun mapKey!1813 () (_ BitVec 32))

(declare-fun mapRest!1813 () (Array (_ BitVec 32) ValueCell!557))

(declare-fun mapValue!1813 () ValueCell!557)

(assert (=> mapNonEmpty!1813 (= mapRest!1804 (store mapRest!1813 mapKey!1813 mapValue!1813))))

(declare-fun b!33177 () Bool)

(assert (=> b!33177 (= e!21066 tp_is_empty!1513)))

(assert (= (and mapNonEmpty!1804 condMapEmpty!1813) mapIsEmpty!1813))

(assert (= (and mapNonEmpty!1804 (not condMapEmpty!1813)) mapNonEmpty!1813))

(assert (= (and mapNonEmpty!1813 ((_ is ValueCellFull!557) mapValue!1813)) b!33176))

(assert (= (and mapNonEmpty!1804 ((_ is ValueCellFull!557) mapDefault!1813)) b!33177))

(declare-fun m!26571 () Bool)

(assert (=> mapNonEmpty!1813 m!26571))

(declare-fun b_lambda!1693 () Bool)

(assert (= b_lambda!1691 (or (and start!4284 b_free!1159) b_lambda!1693)))

(check-sat (not b!33167) (not d!5099) (not b!33041) (not b!33133) (not b!33098) (not d!5105) (not b!33051) (not b!33139) (not b!33154) (not b!33102) (not b!33039) (not b!33112) (not b!33100) (not b!33131) (not b_lambda!1693) (not d!5107) (not b!33106) (not d!5101) (not bm!2663) (not b!33109) (not bm!2657) (not b!33103) (not b_next!1159) (not b!33050) tp_is_empty!1513 (not b!33129) (not mapNonEmpty!1813) (not b!33044) (not b!33169) (not bm!2658) b_and!1973 (not d!5113) (not bm!2659) (not b!33053) (not bm!2660) (not bm!2666) (not b!33097))
(check-sat b_and!1973 (not b_next!1159))
