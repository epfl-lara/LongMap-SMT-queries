; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4484 () Bool)

(assert start!4484)

(declare-fun b_free!1255 () Bool)

(declare-fun b_next!1255 () Bool)

(assert (=> start!4484 (= b_free!1255 (not b_next!1255))))

(declare-fun tp!5202 () Bool)

(declare-fun b_and!2071 () Bool)

(assert (=> start!4484 (= tp!5202 b_and!2071)))

(declare-fun b!34987 () Bool)

(declare-fun res!21281 () Bool)

(declare-fun e!22105 () Bool)

(assert (=> b!34987 (=> (not res!21281) (not e!22105))))

(declare-datatypes ((array!2403 0))(
  ( (array!2404 (arr!1149 (Array (_ BitVec 32) (_ BitVec 64))) (size!1250 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2403)

(declare-datatypes ((List!920 0))(
  ( (Nil!917) (Cons!916 (h!1483 (_ BitVec 64)) (t!3618 List!920)) )
))
(declare-fun arrayNoDuplicates!0 (array!2403 (_ BitVec 32) List!920) Bool)

(assert (=> b!34987 (= res!21281 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!917))))

(declare-fun b!34988 () Bool)

(declare-fun e!22107 () Bool)

(declare-fun e!22103 () Bool)

(declare-fun mapRes!1960 () Bool)

(assert (=> b!34988 (= e!22107 (and e!22103 mapRes!1960))))

(declare-fun condMapEmpty!1960 () Bool)

(declare-datatypes ((V!1971 0))(
  ( (V!1972 (val!831 Int)) )
))
(declare-datatypes ((ValueCell!605 0))(
  ( (ValueCellFull!605 (v!1925 V!1971)) (EmptyCell!605) )
))
(declare-datatypes ((array!2405 0))(
  ( (array!2406 (arr!1150 (Array (_ BitVec 32) ValueCell!605)) (size!1251 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2405)

(declare-fun mapDefault!1960 () ValueCell!605)

(assert (=> b!34988 (= condMapEmpty!1960 (= (arr!1150 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!605)) mapDefault!1960)))))

(declare-fun b!34989 () Bool)

(declare-fun res!21278 () Bool)

(assert (=> b!34989 (=> (not res!21278) (not e!22105))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34989 (= res!21278 (validKeyInArray!0 k0!1304))))

(declare-fun b!34990 () Bool)

(declare-fun res!21283 () Bool)

(assert (=> b!34990 (=> (not res!21283) (not e!22105))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2403 (_ BitVec 32)) Bool)

(assert (=> b!34990 (= res!21283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1960 () Bool)

(declare-fun tp!5203 () Bool)

(declare-fun e!22106 () Bool)

(assert (=> mapNonEmpty!1960 (= mapRes!1960 (and tp!5203 e!22106))))

(declare-fun mapValue!1960 () ValueCell!605)

(declare-fun mapRest!1960 () (Array (_ BitVec 32) ValueCell!605))

(declare-fun mapKey!1960 () (_ BitVec 32))

(assert (=> mapNonEmpty!1960 (= (arr!1150 _values!1501) (store mapRest!1960 mapKey!1960 mapValue!1960))))

(declare-fun b!34991 () Bool)

(declare-fun res!21280 () Bool)

(assert (=> b!34991 (=> (not res!21280) (not e!22105))))

(declare-fun arrayContainsKey!0 (array!2403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34991 (= res!21280 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34992 () Bool)

(declare-fun tp_is_empty!1609 () Bool)

(assert (=> b!34992 (= e!22106 tp_is_empty!1609)))

(declare-fun res!21279 () Bool)

(assert (=> start!4484 (=> (not res!21279) (not e!22105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4484 (= res!21279 (validMask!0 mask!2294))))

(assert (=> start!4484 e!22105))

(assert (=> start!4484 true))

(assert (=> start!4484 tp!5202))

(declare-fun array_inv!811 (array!2405) Bool)

(assert (=> start!4484 (and (array_inv!811 _values!1501) e!22107)))

(declare-fun array_inv!812 (array!2403) Bool)

(assert (=> start!4484 (array_inv!812 _keys!1833)))

(assert (=> start!4484 tp_is_empty!1609))

(declare-fun mapIsEmpty!1960 () Bool)

(assert (=> mapIsEmpty!1960 mapRes!1960))

(declare-fun b!34993 () Bool)

(declare-datatypes ((SeekEntryResult!161 0))(
  ( (MissingZero!161 (index!2766 (_ BitVec 32))) (Found!161 (index!2767 (_ BitVec 32))) (Intermediate!161 (undefined!973 Bool) (index!2768 (_ BitVec 32)) (x!6987 (_ BitVec 32))) (Undefined!161) (MissingVacant!161 (index!2769 (_ BitVec 32))) )
))
(declare-fun lt!12836 () SeekEntryResult!161)

(get-info :version)

(assert (=> b!34993 (= e!22105 (and ((_ is Found!161) lt!12836) (or (bvslt (index!2767 lt!12836) #b00000000000000000000000000000000) (bvsge (index!2767 lt!12836) (size!1250 _keys!1833)))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2403 (_ BitVec 32)) SeekEntryResult!161)

(assert (=> b!34993 (= lt!12836 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34994 () Bool)

(declare-fun res!21277 () Bool)

(assert (=> b!34994 (=> (not res!21277) (not e!22105))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1971)

(declare-fun minValue!1443 () V!1971)

(declare-datatypes ((tuple2!1336 0))(
  ( (tuple2!1337 (_1!679 (_ BitVec 64)) (_2!679 V!1971)) )
))
(declare-datatypes ((List!921 0))(
  ( (Nil!918) (Cons!917 (h!1484 tuple2!1336) (t!3619 List!921)) )
))
(declare-datatypes ((ListLongMap!901 0))(
  ( (ListLongMap!902 (toList!466 List!921)) )
))
(declare-fun contains!413 (ListLongMap!901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!285 (array!2403 array!2405 (_ BitVec 32) (_ BitVec 32) V!1971 V!1971 (_ BitVec 32) Int) ListLongMap!901)

(assert (=> b!34994 (= res!21277 (not (contains!413 (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34995 () Bool)

(declare-fun res!21282 () Bool)

(assert (=> b!34995 (=> (not res!21282) (not e!22105))))

(assert (=> b!34995 (= res!21282 (and (= (size!1251 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1250 _keys!1833) (size!1251 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34996 () Bool)

(assert (=> b!34996 (= e!22103 tp_is_empty!1609)))

(assert (= (and start!4484 res!21279) b!34995))

(assert (= (and b!34995 res!21282) b!34990))

(assert (= (and b!34990 res!21283) b!34987))

(assert (= (and b!34987 res!21281) b!34989))

(assert (= (and b!34989 res!21278) b!34994))

(assert (= (and b!34994 res!21277) b!34991))

(assert (= (and b!34991 res!21280) b!34993))

(assert (= (and b!34988 condMapEmpty!1960) mapIsEmpty!1960))

(assert (= (and b!34988 (not condMapEmpty!1960)) mapNonEmpty!1960))

(assert (= (and mapNonEmpty!1960 ((_ is ValueCellFull!605) mapValue!1960)) b!34992))

(assert (= (and b!34988 ((_ is ValueCellFull!605) mapDefault!1960)) b!34996))

(assert (= start!4484 b!34988))

(declare-fun m!28139 () Bool)

(assert (=> b!34990 m!28139))

(declare-fun m!28141 () Bool)

(assert (=> b!34993 m!28141))

(declare-fun m!28143 () Bool)

(assert (=> b!34994 m!28143))

(assert (=> b!34994 m!28143))

(declare-fun m!28145 () Bool)

(assert (=> b!34994 m!28145))

(declare-fun m!28147 () Bool)

(assert (=> b!34989 m!28147))

(declare-fun m!28149 () Bool)

(assert (=> b!34987 m!28149))

(declare-fun m!28151 () Bool)

(assert (=> mapNonEmpty!1960 m!28151))

(declare-fun m!28153 () Bool)

(assert (=> b!34991 m!28153))

(declare-fun m!28155 () Bool)

(assert (=> start!4484 m!28155))

(declare-fun m!28157 () Bool)

(assert (=> start!4484 m!28157))

(declare-fun m!28159 () Bool)

(assert (=> start!4484 m!28159))

(check-sat (not b_next!1255) b_and!2071 (not b!34991) (not b!34993) (not b!34994) (not b!34987) (not b!34989) tp_is_empty!1609 (not start!4484) (not b!34990) (not mapNonEmpty!1960))
(check-sat b_and!2071 (not b_next!1255))
(get-model)

(declare-fun d!5237 () Bool)

(declare-fun res!21330 () Bool)

(declare-fun e!22142 () Bool)

(assert (=> d!5237 (=> res!21330 e!22142)))

(assert (=> d!5237 (= res!21330 (= (select (arr!1149 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5237 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22142)))

(declare-fun b!35061 () Bool)

(declare-fun e!22143 () Bool)

(assert (=> b!35061 (= e!22142 e!22143)))

(declare-fun res!21331 () Bool)

(assert (=> b!35061 (=> (not res!21331) (not e!22143))))

(assert (=> b!35061 (= res!21331 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1250 _keys!1833)))))

(declare-fun b!35062 () Bool)

(assert (=> b!35062 (= e!22143 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5237 (not res!21330)) b!35061))

(assert (= (and b!35061 res!21331) b!35062))

(declare-fun m!28205 () Bool)

(assert (=> d!5237 m!28205))

(declare-fun m!28207 () Bool)

(assert (=> b!35062 m!28207))

(assert (=> b!34991 d!5237))

(declare-fun bm!2751 () Bool)

(declare-fun call!2754 () Bool)

(assert (=> bm!2751 (= call!2754 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!35071 () Bool)

(declare-fun e!22152 () Bool)

(declare-fun e!22151 () Bool)

(assert (=> b!35071 (= e!22152 e!22151)))

(declare-fun c!3950 () Bool)

(assert (=> b!35071 (= c!3950 (validKeyInArray!0 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35072 () Bool)

(assert (=> b!35072 (= e!22151 call!2754)))

(declare-fun b!35073 () Bool)

(declare-fun e!22150 () Bool)

(assert (=> b!35073 (= e!22150 call!2754)))

(declare-fun b!35074 () Bool)

(assert (=> b!35074 (= e!22151 e!22150)))

(declare-fun lt!12850 () (_ BitVec 64))

(assert (=> b!35074 (= lt!12850 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!776 0))(
  ( (Unit!777) )
))
(declare-fun lt!12851 () Unit!776)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2403 (_ BitVec 64) (_ BitVec 32)) Unit!776)

(assert (=> b!35074 (= lt!12851 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12850 #b00000000000000000000000000000000))))

(assert (=> b!35074 (arrayContainsKey!0 _keys!1833 lt!12850 #b00000000000000000000000000000000)))

(declare-fun lt!12849 () Unit!776)

(assert (=> b!35074 (= lt!12849 lt!12851)))

(declare-fun res!21337 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2403 (_ BitVec 32)) SeekEntryResult!161)

(assert (=> b!35074 (= res!21337 (= (seekEntryOrOpen!0 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!161 #b00000000000000000000000000000000)))))

(assert (=> b!35074 (=> (not res!21337) (not e!22150))))

(declare-fun d!5239 () Bool)

(declare-fun res!21336 () Bool)

(assert (=> d!5239 (=> res!21336 e!22152)))

(assert (=> d!5239 (= res!21336 (bvsge #b00000000000000000000000000000000 (size!1250 _keys!1833)))))

(assert (=> d!5239 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22152)))

(assert (= (and d!5239 (not res!21336)) b!35071))

(assert (= (and b!35071 c!3950) b!35074))

(assert (= (and b!35071 (not c!3950)) b!35072))

(assert (= (and b!35074 res!21337) b!35073))

(assert (= (or b!35073 b!35072) bm!2751))

(declare-fun m!28209 () Bool)

(assert (=> bm!2751 m!28209))

(assert (=> b!35071 m!28205))

(assert (=> b!35071 m!28205))

(declare-fun m!28211 () Bool)

(assert (=> b!35071 m!28211))

(assert (=> b!35074 m!28205))

(declare-fun m!28213 () Bool)

(assert (=> b!35074 m!28213))

(declare-fun m!28215 () Bool)

(assert (=> b!35074 m!28215))

(assert (=> b!35074 m!28205))

(declare-fun m!28217 () Bool)

(assert (=> b!35074 m!28217))

(assert (=> b!34990 d!5239))

(declare-fun b!35087 () Bool)

(declare-fun e!22159 () SeekEntryResult!161)

(declare-fun lt!12860 () SeekEntryResult!161)

(assert (=> b!35087 (= e!22159 (ite ((_ is MissingVacant!161) lt!12860) (MissingZero!161 (index!2769 lt!12860)) lt!12860))))

(declare-fun lt!12861 () SeekEntryResult!161)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2403 (_ BitVec 32)) SeekEntryResult!161)

(assert (=> b!35087 (= lt!12860 (seekKeyOrZeroReturnVacant!0 (x!6987 lt!12861) (index!2768 lt!12861) (index!2768 lt!12861) k0!1304 _keys!1833 mask!2294))))

(declare-fun d!5241 () Bool)

(declare-fun lt!12863 () SeekEntryResult!161)

(assert (=> d!5241 (and (or ((_ is MissingVacant!161) lt!12863) (not ((_ is Found!161) lt!12863)) (and (bvsge (index!2767 lt!12863) #b00000000000000000000000000000000) (bvslt (index!2767 lt!12863) (size!1250 _keys!1833)))) (not ((_ is MissingVacant!161) lt!12863)) (or (not ((_ is Found!161) lt!12863)) (= (select (arr!1149 _keys!1833) (index!2767 lt!12863)) k0!1304)))))

(declare-fun e!22160 () SeekEntryResult!161)

(assert (=> d!5241 (= lt!12863 e!22160)))

(declare-fun c!3958 () Bool)

(assert (=> d!5241 (= c!3958 (and ((_ is Intermediate!161) lt!12861) (undefined!973 lt!12861)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2403 (_ BitVec 32)) SeekEntryResult!161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5241 (= lt!12861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5241 (validMask!0 mask!2294)))

(assert (=> d!5241 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12863)))

(declare-fun b!35088 () Bool)

(declare-fun c!3957 () Bool)

(declare-fun lt!12862 () (_ BitVec 64))

(assert (=> b!35088 (= c!3957 (= lt!12862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22161 () SeekEntryResult!161)

(assert (=> b!35088 (= e!22161 e!22159)))

(declare-fun b!35089 () Bool)

(assert (=> b!35089 (= e!22160 e!22161)))

(assert (=> b!35089 (= lt!12862 (select (arr!1149 _keys!1833) (index!2768 lt!12861)))))

(declare-fun c!3959 () Bool)

(assert (=> b!35089 (= c!3959 (= lt!12862 k0!1304))))

(declare-fun b!35090 () Bool)

(assert (=> b!35090 (= e!22160 Undefined!161)))

(declare-fun b!35091 () Bool)

(assert (=> b!35091 (= e!22161 (Found!161 (index!2768 lt!12861)))))

(declare-fun b!35092 () Bool)

(assert (=> b!35092 (= e!22159 (MissingZero!161 (index!2768 lt!12861)))))

(assert (= (and d!5241 c!3958) b!35090))

(assert (= (and d!5241 (not c!3958)) b!35089))

(assert (= (and b!35089 c!3959) b!35091))

(assert (= (and b!35089 (not c!3959)) b!35088))

(assert (= (and b!35088 c!3957) b!35092))

(assert (= (and b!35088 (not c!3957)) b!35087))

(declare-fun m!28219 () Bool)

(assert (=> b!35087 m!28219))

(declare-fun m!28221 () Bool)

(assert (=> d!5241 m!28221))

(declare-fun m!28223 () Bool)

(assert (=> d!5241 m!28223))

(assert (=> d!5241 m!28223))

(declare-fun m!28225 () Bool)

(assert (=> d!5241 m!28225))

(assert (=> d!5241 m!28155))

(declare-fun m!28227 () Bool)

(assert (=> b!35089 m!28227))

(assert (=> b!34993 d!5241))

(declare-fun d!5243 () Bool)

(declare-fun e!22166 () Bool)

(assert (=> d!5243 e!22166))

(declare-fun res!21340 () Bool)

(assert (=> d!5243 (=> res!21340 e!22166)))

(declare-fun lt!12872 () Bool)

(assert (=> d!5243 (= res!21340 (not lt!12872))))

(declare-fun lt!12874 () Bool)

(assert (=> d!5243 (= lt!12872 lt!12874)))

(declare-fun lt!12873 () Unit!776)

(declare-fun e!22167 () Unit!776)

(assert (=> d!5243 (= lt!12873 e!22167)))

(declare-fun c!3962 () Bool)

(assert (=> d!5243 (= c!3962 lt!12874)))

(declare-fun containsKey!34 (List!921 (_ BitVec 64)) Bool)

(assert (=> d!5243 (= lt!12874 (containsKey!34 (toList!466 (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5243 (= (contains!413 (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!12872)))

(declare-fun b!35099 () Bool)

(declare-fun lt!12875 () Unit!776)

(assert (=> b!35099 (= e!22167 lt!12875)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!31 (List!921 (_ BitVec 64)) Unit!776)

(assert (=> b!35099 (= lt!12875 (lemmaContainsKeyImpliesGetValueByKeyDefined!31 (toList!466 (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!76 0))(
  ( (Some!75 (v!1928 V!1971)) (None!74) )
))
(declare-fun isDefined!32 (Option!76) Bool)

(declare-fun getValueByKey!70 (List!921 (_ BitVec 64)) Option!76)

(assert (=> b!35099 (isDefined!32 (getValueByKey!70 (toList!466 (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!35100 () Bool)

(declare-fun Unit!778 () Unit!776)

(assert (=> b!35100 (= e!22167 Unit!778)))

(declare-fun b!35101 () Bool)

(assert (=> b!35101 (= e!22166 (isDefined!32 (getValueByKey!70 (toList!466 (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5243 c!3962) b!35099))

(assert (= (and d!5243 (not c!3962)) b!35100))

(assert (= (and d!5243 (not res!21340)) b!35101))

(declare-fun m!28229 () Bool)

(assert (=> d!5243 m!28229))

(declare-fun m!28231 () Bool)

(assert (=> b!35099 m!28231))

(declare-fun m!28233 () Bool)

(assert (=> b!35099 m!28233))

(assert (=> b!35099 m!28233))

(declare-fun m!28235 () Bool)

(assert (=> b!35099 m!28235))

(assert (=> b!35101 m!28233))

(assert (=> b!35101 m!28233))

(assert (=> b!35101 m!28235))

(assert (=> b!34994 d!5243))

(declare-fun call!2771 () ListLongMap!901)

(declare-fun bm!2766 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!26 (array!2403 array!2405 (_ BitVec 32) (_ BitVec 32) V!1971 V!1971 (_ BitVec 32) Int) ListLongMap!901)

(assert (=> bm!2766 (= call!2771 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35144 () Bool)

(declare-fun c!3975 () Bool)

(assert (=> b!35144 (= c!3975 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!22194 () ListLongMap!901)

(declare-fun e!22204 () ListLongMap!901)

(assert (=> b!35144 (= e!22194 e!22204)))

(declare-fun b!35145 () Bool)

(declare-fun e!22196 () Bool)

(declare-fun lt!12929 () ListLongMap!901)

(declare-fun apply!39 (ListLongMap!901 (_ BitVec 64)) V!1971)

(assert (=> b!35145 (= e!22196 (= (apply!39 lt!12929 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!35146 () Bool)

(declare-fun e!22198 () Bool)

(declare-fun call!2772 () Bool)

(assert (=> b!35146 (= e!22198 (not call!2772))))

(declare-fun bm!2767 () Bool)

(declare-fun call!2774 () Bool)

(assert (=> bm!2767 (= call!2774 (contains!413 lt!12929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35147 () Bool)

(declare-fun e!22200 () Bool)

(assert (=> b!35147 (= e!22198 e!22200)))

(declare-fun res!21363 () Bool)

(assert (=> b!35147 (= res!21363 call!2772)))

(assert (=> b!35147 (=> (not res!21363) (not e!22200))))

(declare-fun b!35148 () Bool)

(declare-fun e!22206 () ListLongMap!901)

(assert (=> b!35148 (= e!22206 e!22194)))

(declare-fun c!3978 () Bool)

(assert (=> b!35148 (= c!3978 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35149 () Bool)

(declare-fun e!22199 () Bool)

(declare-fun e!22195 () Bool)

(assert (=> b!35149 (= e!22199 e!22195)))

(declare-fun res!21360 () Bool)

(assert (=> b!35149 (=> (not res!21360) (not e!22195))))

(assert (=> b!35149 (= res!21360 (contains!413 lt!12929 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35149 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1250 _keys!1833)))))

(declare-fun b!35150 () Bool)

(assert (=> b!35150 (= e!22200 (= (apply!39 lt!12929 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!35151 () Bool)

(declare-fun get!600 (ValueCell!605 V!1971) V!1971)

(declare-fun dynLambda!155 (Int (_ BitVec 64)) V!1971)

(assert (=> b!35151 (= e!22195 (= (apply!39 lt!12929 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000)) (get!600 (select (arr!1150 _values!1501) #b00000000000000000000000000000000) (dynLambda!155 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35151 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1251 _values!1501)))))

(assert (=> b!35151 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1250 _keys!1833)))))

(declare-fun bm!2768 () Bool)

(declare-fun call!2769 () ListLongMap!901)

(declare-fun call!2773 () ListLongMap!901)

(assert (=> bm!2768 (= call!2769 call!2773)))

(declare-fun b!35152 () Bool)

(declare-fun e!22201 () Bool)

(assert (=> b!35152 (= e!22201 e!22196)))

(declare-fun res!21359 () Bool)

(assert (=> b!35152 (= res!21359 call!2774)))

(assert (=> b!35152 (=> (not res!21359) (not e!22196))))

(declare-fun b!35153 () Bool)

(declare-fun e!22203 () Unit!776)

(declare-fun Unit!779 () Unit!776)

(assert (=> b!35153 (= e!22203 Unit!779)))

(declare-fun b!35154 () Bool)

(declare-fun e!22205 () Bool)

(assert (=> b!35154 (= e!22205 e!22198)))

(declare-fun c!3976 () Bool)

(assert (=> b!35154 (= c!3976 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35155 () Bool)

(declare-fun res!21361 () Bool)

(assert (=> b!35155 (=> (not res!21361) (not e!22205))))

(assert (=> b!35155 (= res!21361 e!22201)))

(declare-fun c!3977 () Bool)

(assert (=> b!35155 (= c!3977 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!35156 () Bool)

(assert (=> b!35156 (= e!22204 call!2769)))

(declare-fun b!35157 () Bool)

(declare-fun lt!12935 () Unit!776)

(assert (=> b!35157 (= e!22203 lt!12935)))

(declare-fun lt!12923 () ListLongMap!901)

(assert (=> b!35157 (= lt!12923 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12934 () (_ BitVec 64))

(assert (=> b!35157 (= lt!12934 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12931 () (_ BitVec 64))

(assert (=> b!35157 (= lt!12931 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12926 () Unit!776)

(declare-fun addStillContains!24 (ListLongMap!901 (_ BitVec 64) V!1971 (_ BitVec 64)) Unit!776)

(assert (=> b!35157 (= lt!12926 (addStillContains!24 lt!12923 lt!12934 zeroValue!1443 lt!12931))))

(declare-fun +!57 (ListLongMap!901 tuple2!1336) ListLongMap!901)

(assert (=> b!35157 (contains!413 (+!57 lt!12923 (tuple2!1337 lt!12934 zeroValue!1443)) lt!12931)))

(declare-fun lt!12925 () Unit!776)

(assert (=> b!35157 (= lt!12925 lt!12926)))

(declare-fun lt!12939 () ListLongMap!901)

(assert (=> b!35157 (= lt!12939 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12928 () (_ BitVec 64))

(assert (=> b!35157 (= lt!12928 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12930 () (_ BitVec 64))

(assert (=> b!35157 (= lt!12930 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12940 () Unit!776)

(declare-fun addApplyDifferent!24 (ListLongMap!901 (_ BitVec 64) V!1971 (_ BitVec 64)) Unit!776)

(assert (=> b!35157 (= lt!12940 (addApplyDifferent!24 lt!12939 lt!12928 minValue!1443 lt!12930))))

(assert (=> b!35157 (= (apply!39 (+!57 lt!12939 (tuple2!1337 lt!12928 minValue!1443)) lt!12930) (apply!39 lt!12939 lt!12930))))

(declare-fun lt!12921 () Unit!776)

(assert (=> b!35157 (= lt!12921 lt!12940)))

(declare-fun lt!12937 () ListLongMap!901)

(assert (=> b!35157 (= lt!12937 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12927 () (_ BitVec 64))

(assert (=> b!35157 (= lt!12927 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12936 () (_ BitVec 64))

(assert (=> b!35157 (= lt!12936 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12932 () Unit!776)

(assert (=> b!35157 (= lt!12932 (addApplyDifferent!24 lt!12937 lt!12927 zeroValue!1443 lt!12936))))

(assert (=> b!35157 (= (apply!39 (+!57 lt!12937 (tuple2!1337 lt!12927 zeroValue!1443)) lt!12936) (apply!39 lt!12937 lt!12936))))

(declare-fun lt!12933 () Unit!776)

(assert (=> b!35157 (= lt!12933 lt!12932)))

(declare-fun lt!12920 () ListLongMap!901)

(assert (=> b!35157 (= lt!12920 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12938 () (_ BitVec 64))

(assert (=> b!35157 (= lt!12938 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12941 () (_ BitVec 64))

(assert (=> b!35157 (= lt!12941 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35157 (= lt!12935 (addApplyDifferent!24 lt!12920 lt!12938 minValue!1443 lt!12941))))

(assert (=> b!35157 (= (apply!39 (+!57 lt!12920 (tuple2!1337 lt!12938 minValue!1443)) lt!12941) (apply!39 lt!12920 lt!12941))))

(declare-fun b!35158 () Bool)

(declare-fun call!2775 () ListLongMap!901)

(assert (=> b!35158 (= e!22204 call!2775)))

(declare-fun b!35159 () Bool)

(declare-fun res!21367 () Bool)

(assert (=> b!35159 (=> (not res!21367) (not e!22205))))

(assert (=> b!35159 (= res!21367 e!22199)))

(declare-fun res!21362 () Bool)

(assert (=> b!35159 (=> res!21362 e!22199)))

(declare-fun e!22197 () Bool)

(assert (=> b!35159 (= res!21362 (not e!22197))))

(declare-fun res!21365 () Bool)

(assert (=> b!35159 (=> (not res!21365) (not e!22197))))

(assert (=> b!35159 (= res!21365 (bvslt #b00000000000000000000000000000000 (size!1250 _keys!1833)))))

(declare-fun d!5245 () Bool)

(assert (=> d!5245 e!22205))

(declare-fun res!21364 () Bool)

(assert (=> d!5245 (=> (not res!21364) (not e!22205))))

(assert (=> d!5245 (= res!21364 (or (bvsge #b00000000000000000000000000000000 (size!1250 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1250 _keys!1833)))))))

(declare-fun lt!12924 () ListLongMap!901)

(assert (=> d!5245 (= lt!12929 lt!12924)))

(declare-fun lt!12922 () Unit!776)

(assert (=> d!5245 (= lt!12922 e!22203)))

(declare-fun c!3980 () Bool)

(declare-fun e!22202 () Bool)

(assert (=> d!5245 (= c!3980 e!22202)))

(declare-fun res!21366 () Bool)

(assert (=> d!5245 (=> (not res!21366) (not e!22202))))

(assert (=> d!5245 (= res!21366 (bvslt #b00000000000000000000000000000000 (size!1250 _keys!1833)))))

(assert (=> d!5245 (= lt!12924 e!22206)))

(declare-fun c!3979 () Bool)

(assert (=> d!5245 (= c!3979 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5245 (validMask!0 mask!2294)))

(assert (=> d!5245 (= (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12929)))

(declare-fun b!35160 () Bool)

(assert (=> b!35160 (= e!22206 (+!57 call!2773 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!35161 () Bool)

(assert (=> b!35161 (= e!22197 (validKeyInArray!0 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2769 () Bool)

(assert (=> bm!2769 (= call!2772 (contains!413 lt!12929 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2770 () Bool)

(declare-fun call!2770 () ListLongMap!901)

(assert (=> bm!2770 (= call!2775 call!2770)))

(declare-fun b!35162 () Bool)

(assert (=> b!35162 (= e!22194 call!2769)))

(declare-fun b!35163 () Bool)

(assert (=> b!35163 (= e!22201 (not call!2774))))

(declare-fun bm!2771 () Bool)

(assert (=> bm!2771 (= call!2770 call!2771)))

(declare-fun bm!2772 () Bool)

(assert (=> bm!2772 (= call!2773 (+!57 (ite c!3979 call!2771 (ite c!3978 call!2770 call!2775)) (ite (or c!3979 c!3978) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!35164 () Bool)

(assert (=> b!35164 (= e!22202 (validKeyInArray!0 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5245 c!3979) b!35160))

(assert (= (and d!5245 (not c!3979)) b!35148))

(assert (= (and b!35148 c!3978) b!35162))

(assert (= (and b!35148 (not c!3978)) b!35144))

(assert (= (and b!35144 c!3975) b!35156))

(assert (= (and b!35144 (not c!3975)) b!35158))

(assert (= (or b!35156 b!35158) bm!2770))

(assert (= (or b!35162 bm!2770) bm!2771))

(assert (= (or b!35162 b!35156) bm!2768))

(assert (= (or b!35160 bm!2771) bm!2766))

(assert (= (or b!35160 bm!2768) bm!2772))

(assert (= (and d!5245 res!21366) b!35164))

(assert (= (and d!5245 c!3980) b!35157))

(assert (= (and d!5245 (not c!3980)) b!35153))

(assert (= (and d!5245 res!21364) b!35159))

(assert (= (and b!35159 res!21365) b!35161))

(assert (= (and b!35159 (not res!21362)) b!35149))

(assert (= (and b!35149 res!21360) b!35151))

(assert (= (and b!35159 res!21367) b!35155))

(assert (= (and b!35155 c!3977) b!35152))

(assert (= (and b!35155 (not c!3977)) b!35163))

(assert (= (and b!35152 res!21359) b!35145))

(assert (= (or b!35152 b!35163) bm!2767))

(assert (= (and b!35155 res!21361) b!35154))

(assert (= (and b!35154 c!3976) b!35147))

(assert (= (and b!35154 (not c!3976)) b!35146))

(assert (= (and b!35147 res!21363) b!35150))

(assert (= (or b!35147 b!35146) bm!2769))

(declare-fun b_lambda!1707 () Bool)

(assert (=> (not b_lambda!1707) (not b!35151)))

(declare-fun t!3621 () Bool)

(declare-fun tb!687 () Bool)

(assert (=> (and start!4484 (= defaultEntry!1504 defaultEntry!1504) t!3621) tb!687))

(declare-fun result!1183 () Bool)

(assert (=> tb!687 (= result!1183 tp_is_empty!1609)))

(assert (=> b!35151 t!3621))

(declare-fun b_and!2077 () Bool)

(assert (= b_and!2071 (and (=> t!3621 result!1183) b_and!2077)))

(assert (=> b!35164 m!28205))

(assert (=> b!35164 m!28205))

(assert (=> b!35164 m!28211))

(declare-fun m!28237 () Bool)

(assert (=> b!35151 m!28237))

(declare-fun m!28239 () Bool)

(assert (=> b!35151 m!28239))

(assert (=> b!35151 m!28205))

(declare-fun m!28241 () Bool)

(assert (=> b!35151 m!28241))

(assert (=> b!35151 m!28237))

(assert (=> b!35151 m!28239))

(declare-fun m!28243 () Bool)

(assert (=> b!35151 m!28243))

(assert (=> b!35151 m!28205))

(declare-fun m!28245 () Bool)

(assert (=> b!35160 m!28245))

(declare-fun m!28247 () Bool)

(assert (=> b!35150 m!28247))

(declare-fun m!28249 () Bool)

(assert (=> bm!2766 m!28249))

(assert (=> d!5245 m!28155))

(assert (=> b!35161 m!28205))

(assert (=> b!35161 m!28205))

(assert (=> b!35161 m!28211))

(declare-fun m!28251 () Bool)

(assert (=> bm!2767 m!28251))

(assert (=> b!35157 m!28249))

(declare-fun m!28253 () Bool)

(assert (=> b!35157 m!28253))

(declare-fun m!28255 () Bool)

(assert (=> b!35157 m!28255))

(declare-fun m!28257 () Bool)

(assert (=> b!35157 m!28257))

(declare-fun m!28259 () Bool)

(assert (=> b!35157 m!28259))

(declare-fun m!28261 () Bool)

(assert (=> b!35157 m!28261))

(declare-fun m!28263 () Bool)

(assert (=> b!35157 m!28263))

(declare-fun m!28265 () Bool)

(assert (=> b!35157 m!28265))

(declare-fun m!28267 () Bool)

(assert (=> b!35157 m!28267))

(declare-fun m!28269 () Bool)

(assert (=> b!35157 m!28269))

(declare-fun m!28271 () Bool)

(assert (=> b!35157 m!28271))

(assert (=> b!35157 m!28257))

(assert (=> b!35157 m!28205))

(declare-fun m!28273 () Bool)

(assert (=> b!35157 m!28273))

(declare-fun m!28275 () Bool)

(assert (=> b!35157 m!28275))

(declare-fun m!28277 () Bool)

(assert (=> b!35157 m!28277))

(declare-fun m!28279 () Bool)

(assert (=> b!35157 m!28279))

(declare-fun m!28281 () Bool)

(assert (=> b!35157 m!28281))

(assert (=> b!35157 m!28269))

(assert (=> b!35157 m!28273))

(assert (=> b!35157 m!28253))

(declare-fun m!28283 () Bool)

(assert (=> bm!2772 m!28283))

(assert (=> b!35149 m!28205))

(assert (=> b!35149 m!28205))

(declare-fun m!28285 () Bool)

(assert (=> b!35149 m!28285))

(declare-fun m!28287 () Bool)

(assert (=> bm!2769 m!28287))

(declare-fun m!28289 () Bool)

(assert (=> b!35145 m!28289))

(assert (=> b!34994 d!5245))

(declare-fun d!5247 () Bool)

(assert (=> d!5247 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!34989 d!5247))

(declare-fun bm!2775 () Bool)

(declare-fun call!2778 () Bool)

(declare-fun c!3983 () Bool)

(assert (=> bm!2775 (= call!2778 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3983 (Cons!916 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000) Nil!917) Nil!917)))))

(declare-fun b!35177 () Bool)

(declare-fun e!22216 () Bool)

(declare-fun e!22217 () Bool)

(assert (=> b!35177 (= e!22216 e!22217)))

(assert (=> b!35177 (= c!3983 (validKeyInArray!0 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35178 () Bool)

(declare-fun e!22218 () Bool)

(assert (=> b!35178 (= e!22218 e!22216)))

(declare-fun res!21376 () Bool)

(assert (=> b!35178 (=> (not res!21376) (not e!22216))))

(declare-fun e!22215 () Bool)

(assert (=> b!35178 (= res!21376 (not e!22215))))

(declare-fun res!21374 () Bool)

(assert (=> b!35178 (=> (not res!21374) (not e!22215))))

(assert (=> b!35178 (= res!21374 (validKeyInArray!0 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35179 () Bool)

(assert (=> b!35179 (= e!22217 call!2778)))

(declare-fun d!5249 () Bool)

(declare-fun res!21375 () Bool)

(assert (=> d!5249 (=> res!21375 e!22218)))

(assert (=> d!5249 (= res!21375 (bvsge #b00000000000000000000000000000000 (size!1250 _keys!1833)))))

(assert (=> d!5249 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!917) e!22218)))

(declare-fun b!35180 () Bool)

(assert (=> b!35180 (= e!22217 call!2778)))

(declare-fun b!35181 () Bool)

(declare-fun contains!414 (List!920 (_ BitVec 64)) Bool)

(assert (=> b!35181 (= e!22215 (contains!414 Nil!917 (select (arr!1149 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5249 (not res!21375)) b!35178))

(assert (= (and b!35178 res!21374) b!35181))

(assert (= (and b!35178 res!21376) b!35177))

(assert (= (and b!35177 c!3983) b!35179))

(assert (= (and b!35177 (not c!3983)) b!35180))

(assert (= (or b!35179 b!35180) bm!2775))

(assert (=> bm!2775 m!28205))

(declare-fun m!28291 () Bool)

(assert (=> bm!2775 m!28291))

(assert (=> b!35177 m!28205))

(assert (=> b!35177 m!28205))

(assert (=> b!35177 m!28211))

(assert (=> b!35178 m!28205))

(assert (=> b!35178 m!28205))

(assert (=> b!35178 m!28211))

(assert (=> b!35181 m!28205))

(assert (=> b!35181 m!28205))

(declare-fun m!28293 () Bool)

(assert (=> b!35181 m!28293))

(assert (=> b!34987 d!5249))

(declare-fun d!5251 () Bool)

(assert (=> d!5251 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4484 d!5251))

(declare-fun d!5253 () Bool)

(assert (=> d!5253 (= (array_inv!811 _values!1501) (bvsge (size!1251 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4484 d!5253))

(declare-fun d!5255 () Bool)

(assert (=> d!5255 (= (array_inv!812 _keys!1833) (bvsge (size!1250 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4484 d!5255))

(declare-fun mapNonEmpty!1969 () Bool)

(declare-fun mapRes!1969 () Bool)

(declare-fun tp!5218 () Bool)

(declare-fun e!22224 () Bool)

(assert (=> mapNonEmpty!1969 (= mapRes!1969 (and tp!5218 e!22224))))

(declare-fun mapKey!1969 () (_ BitVec 32))

(declare-fun mapRest!1969 () (Array (_ BitVec 32) ValueCell!605))

(declare-fun mapValue!1969 () ValueCell!605)

(assert (=> mapNonEmpty!1969 (= mapRest!1960 (store mapRest!1969 mapKey!1969 mapValue!1969))))

(declare-fun b!35188 () Bool)

(assert (=> b!35188 (= e!22224 tp_is_empty!1609)))

(declare-fun mapIsEmpty!1969 () Bool)

(assert (=> mapIsEmpty!1969 mapRes!1969))

(declare-fun condMapEmpty!1969 () Bool)

(declare-fun mapDefault!1969 () ValueCell!605)

(assert (=> mapNonEmpty!1960 (= condMapEmpty!1969 (= mapRest!1960 ((as const (Array (_ BitVec 32) ValueCell!605)) mapDefault!1969)))))

(declare-fun e!22223 () Bool)

(assert (=> mapNonEmpty!1960 (= tp!5203 (and e!22223 mapRes!1969))))

(declare-fun b!35189 () Bool)

(assert (=> b!35189 (= e!22223 tp_is_empty!1609)))

(assert (= (and mapNonEmpty!1960 condMapEmpty!1969) mapIsEmpty!1969))

(assert (= (and mapNonEmpty!1960 (not condMapEmpty!1969)) mapNonEmpty!1969))

(assert (= (and mapNonEmpty!1969 ((_ is ValueCellFull!605) mapValue!1969)) b!35188))

(assert (= (and mapNonEmpty!1960 ((_ is ValueCellFull!605) mapDefault!1969)) b!35189))

(declare-fun m!28295 () Bool)

(assert (=> mapNonEmpty!1969 m!28295))

(declare-fun b_lambda!1709 () Bool)

(assert (= b_lambda!1707 (or (and start!4484 b_free!1255) b_lambda!1709)))

(check-sat (not b!35181) (not b!35151) (not b!35145) (not b!35164) (not d!5243) (not b!35150) (not b!35099) (not b_lambda!1709) (not bm!2751) b_and!2077 (not bm!2772) (not b!35101) tp_is_empty!1609 (not bm!2767) (not b_next!1255) (not bm!2769) (not b!35087) (not b!35177) (not mapNonEmpty!1969) (not b!35160) (not b!35157) (not d!5245) (not b!35161) (not b!35071) (not bm!2775) (not b!35178) (not b!35149) (not b!35062) (not bm!2766) (not d!5241) (not b!35074))
(check-sat b_and!2077 (not b_next!1255))
