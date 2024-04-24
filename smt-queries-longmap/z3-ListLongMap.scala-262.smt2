; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4290 () Bool)

(assert start!4290)

(declare-fun b_free!1159 () Bool)

(declare-fun b_next!1159 () Bool)

(assert (=> start!4290 (= b_free!1159 (not b_next!1159))))

(declare-fun tp!4903 () Bool)

(declare-fun b_and!1963 () Bool)

(assert (=> start!4290 (= tp!4903 b_and!1963)))

(declare-fun mapIsEmpty!1804 () Bool)

(declare-fun mapRes!1804 () Bool)

(assert (=> mapIsEmpty!1804 mapRes!1804))

(declare-fun b!32938 () Bool)

(declare-fun res!20032 () Bool)

(declare-fun e!20915 () Bool)

(assert (=> b!32938 (=> (not res!20032) (not e!20915))))

(declare-datatypes ((V!1843 0))(
  ( (V!1844 (val!783 Int)) )
))
(declare-datatypes ((ValueCell!557 0))(
  ( (ValueCellFull!557 (v!1874 V!1843)) (EmptyCell!557) )
))
(declare-datatypes ((array!2223 0))(
  ( (array!2224 (arr!1063 (Array (_ BitVec 32) ValueCell!557)) (size!1164 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2223)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2225 0))(
  ( (array!2226 (arr!1064 (Array (_ BitVec 32) (_ BitVec 64))) (size!1165 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2225)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!32938 (= res!20032 (and (= (size!1164 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1165 _keys!1833) (size!1164 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32939 () Bool)

(declare-fun e!20919 () Bool)

(declare-fun tp_is_empty!1513 () Bool)

(assert (=> b!32939 (= e!20919 tp_is_empty!1513)))

(declare-fun b!32940 () Bool)

(declare-fun res!20039 () Bool)

(assert (=> b!32940 (=> (not res!20039) (not e!20915))))

(declare-datatypes ((List!854 0))(
  ( (Nil!851) (Cons!850 (h!1417 (_ BitVec 64)) (t!3545 List!854)) )
))
(declare-fun arrayNoDuplicates!0 (array!2225 (_ BitVec 32) List!854) Bool)

(assert (=> b!32940 (= res!20039 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!851))))

(declare-fun b!32941 () Bool)

(declare-fun e!20917 () Bool)

(assert (=> b!32941 (= e!20915 e!20917)))

(declare-fun res!20035 () Bool)

(assert (=> b!32941 (=> (not res!20035) (not e!20917))))

(declare-datatypes ((tuple2!1260 0))(
  ( (tuple2!1261 (_1!641 (_ BitVec 64)) (_2!641 V!1843)) )
))
(declare-datatypes ((List!855 0))(
  ( (Nil!852) (Cons!851 (h!1418 tuple2!1260) (t!3546 List!855)) )
))
(declare-datatypes ((ListLongMap!831 0))(
  ( (ListLongMap!832 (toList!431 List!855)) )
))
(declare-fun lt!11911 () ListLongMap!831)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!375 (ListLongMap!831 (_ BitVec 64)) Bool)

(assert (=> b!32941 (= res!20035 (not (contains!375 lt!11911 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1843)

(declare-fun minValue!1443 () V!1843)

(declare-fun getCurrentListMap!254 (array!2225 array!2223 (_ BitVec 32) (_ BitVec 32) V!1843 V!1843 (_ BitVec 32) Int) ListLongMap!831)

(assert (=> b!32941 (= lt!11911 (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!20036 () Bool)

(assert (=> start!4290 (=> (not res!20036) (not e!20915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4290 (= res!20036 (validMask!0 mask!2294))))

(assert (=> start!4290 e!20915))

(assert (=> start!4290 true))

(assert (=> start!4290 tp!4903))

(declare-fun e!20916 () Bool)

(declare-fun array_inv!729 (array!2223) Bool)

(assert (=> start!4290 (and (array_inv!729 _values!1501) e!20916)))

(declare-fun array_inv!730 (array!2225) Bool)

(assert (=> start!4290 (array_inv!730 _keys!1833)))

(assert (=> start!4290 tp_is_empty!1513))

(declare-fun b!32942 () Bool)

(declare-fun e!20914 () Bool)

(assert (=> b!32942 (= e!20916 (and e!20914 mapRes!1804))))

(declare-fun condMapEmpty!1804 () Bool)

(declare-fun mapDefault!1804 () ValueCell!557)

(assert (=> b!32942 (= condMapEmpty!1804 (= (arr!1063 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!557)) mapDefault!1804)))))

(declare-fun mapNonEmpty!1804 () Bool)

(declare-fun tp!4902 () Bool)

(assert (=> mapNonEmpty!1804 (= mapRes!1804 (and tp!4902 e!20919))))

(declare-fun mapValue!1804 () ValueCell!557)

(declare-fun mapKey!1804 () (_ BitVec 32))

(declare-fun mapRest!1804 () (Array (_ BitVec 32) ValueCell!557))

(assert (=> mapNonEmpty!1804 (= (arr!1063 _values!1501) (store mapRest!1804 mapKey!1804 mapValue!1804))))

(declare-fun b!32943 () Bool)

(assert (=> b!32943 (= e!20914 tp_is_empty!1513)))

(declare-fun b!32944 () Bool)

(declare-fun res!20034 () Bool)

(assert (=> b!32944 (=> (not res!20034) (not e!20917))))

(declare-fun arrayContainsKey!0 (array!2225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32944 (= res!20034 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32945 () Bool)

(declare-fun res!20037 () Bool)

(assert (=> b!32945 (=> (not res!20037) (not e!20915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32945 (= res!20037 (validKeyInArray!0 k0!1304))))

(declare-fun b!32946 () Bool)

(declare-fun res!20038 () Bool)

(assert (=> b!32946 (=> (not res!20038) (not e!20915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2225 (_ BitVec 32)) Bool)

(assert (=> b!32946 (= res!20038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun lt!11912 () (_ BitVec 32))

(declare-fun e!20918 () Bool)

(declare-fun b!32947 () Bool)

(declare-datatypes ((SeekEntryResult!122 0))(
  ( (MissingZero!122 (index!2610 (_ BitVec 32))) (Found!122 (index!2611 (_ BitVec 32))) (Intermediate!122 (undefined!934 Bool) (index!2612 (_ BitVec 32)) (x!6780 (_ BitVec 32))) (Undefined!122) (MissingVacant!122 (index!2613 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2225 (_ BitVec 32)) SeekEntryResult!122)

(assert (=> b!32947 (= e!20918 (= (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294) (Found!122 lt!11912)))))

(declare-fun b!32948 () Bool)

(assert (=> b!32948 (= e!20917 (not e!20918))))

(declare-fun res!20033 () Bool)

(assert (=> b!32948 (=> res!20033 e!20918)))

(assert (=> b!32948 (= res!20033 (not (= (size!1165 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(assert (=> b!32948 (contains!375 lt!11911 (select (arr!1064 _keys!1833) lt!11912))))

(declare-datatypes ((Unit!739 0))(
  ( (Unit!740) )
))
(declare-fun lt!11913 () Unit!739)

(declare-fun lemmaValidKeyInArrayIsInListMap!55 (array!2225 array!2223 (_ BitVec 32) (_ BitVec 32) V!1843 V!1843 (_ BitVec 32) Int) Unit!739)

(assert (=> b!32948 (= lt!11913 (lemmaValidKeyInArrayIsInListMap!55 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11912 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2225 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32948 (= lt!11912 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!4290 res!20036) b!32938))

(assert (= (and b!32938 res!20032) b!32946))

(assert (= (and b!32946 res!20038) b!32940))

(assert (= (and b!32940 res!20039) b!32945))

(assert (= (and b!32945 res!20037) b!32941))

(assert (= (and b!32941 res!20035) b!32944))

(assert (= (and b!32944 res!20034) b!32948))

(assert (= (and b!32948 (not res!20033)) b!32947))

(assert (= (and b!32942 condMapEmpty!1804) mapIsEmpty!1804))

(assert (= (and b!32942 (not condMapEmpty!1804)) mapNonEmpty!1804))

(get-info :version)

(assert (= (and mapNonEmpty!1804 ((_ is ValueCellFull!557) mapValue!1804)) b!32939))

(assert (= (and b!32942 ((_ is ValueCellFull!557) mapDefault!1804)) b!32943))

(assert (= start!4290 b!32942))

(declare-fun m!26289 () Bool)

(assert (=> b!32948 m!26289))

(assert (=> b!32948 m!26289))

(declare-fun m!26291 () Bool)

(assert (=> b!32948 m!26291))

(declare-fun m!26293 () Bool)

(assert (=> b!32948 m!26293))

(declare-fun m!26295 () Bool)

(assert (=> b!32948 m!26295))

(declare-fun m!26297 () Bool)

(assert (=> b!32946 m!26297))

(declare-fun m!26299 () Bool)

(assert (=> b!32941 m!26299))

(declare-fun m!26301 () Bool)

(assert (=> b!32941 m!26301))

(declare-fun m!26303 () Bool)

(assert (=> b!32940 m!26303))

(declare-fun m!26305 () Bool)

(assert (=> b!32947 m!26305))

(declare-fun m!26307 () Bool)

(assert (=> b!32944 m!26307))

(declare-fun m!26309 () Bool)

(assert (=> start!4290 m!26309))

(declare-fun m!26311 () Bool)

(assert (=> start!4290 m!26311))

(declare-fun m!26313 () Bool)

(assert (=> start!4290 m!26313))

(declare-fun m!26315 () Bool)

(assert (=> mapNonEmpty!1804 m!26315))

(declare-fun m!26317 () Bool)

(assert (=> b!32945 m!26317))

(check-sat (not b!32941) (not b!32945) b_and!1963 (not b!32940) tp_is_empty!1513 (not b!32944) (not b!32946) (not b_next!1159) (not mapNonEmpty!1804) (not b!32948) (not start!4290) (not b!32947))
(check-sat b_and!1963 (not b_next!1159))
(get-model)

(declare-fun d!5093 () Bool)

(declare-fun e!20968 () Bool)

(assert (=> d!5093 e!20968))

(declare-fun res!20090 () Bool)

(assert (=> d!5093 (=> res!20090 e!20968)))

(declare-fun lt!11942 () Bool)

(assert (=> d!5093 (= res!20090 (not lt!11942))))

(declare-fun lt!11943 () Bool)

(assert (=> d!5093 (= lt!11942 lt!11943)))

(declare-fun lt!11940 () Unit!739)

(declare-fun e!20967 () Unit!739)

(assert (=> d!5093 (= lt!11940 e!20967)))

(declare-fun c!3784 () Bool)

(assert (=> d!5093 (= c!3784 lt!11943)))

(declare-fun containsKey!31 (List!855 (_ BitVec 64)) Bool)

(assert (=> d!5093 (= lt!11943 (containsKey!31 (toList!431 lt!11911) (select (arr!1064 _keys!1833) lt!11912)))))

(assert (=> d!5093 (= (contains!375 lt!11911 (select (arr!1064 _keys!1833) lt!11912)) lt!11942)))

(declare-fun b!33021 () Bool)

(declare-fun lt!11941 () Unit!739)

(assert (=> b!33021 (= e!20967 lt!11941)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!28 (List!855 (_ BitVec 64)) Unit!739)

(assert (=> b!33021 (= lt!11941 (lemmaContainsKeyImpliesGetValueByKeyDefined!28 (toList!431 lt!11911) (select (arr!1064 _keys!1833) lt!11912)))))

(declare-datatypes ((Option!73 0))(
  ( (Some!72 (v!1877 V!1843)) (None!71) )
))
(declare-fun isDefined!29 (Option!73) Bool)

(declare-fun getValueByKey!67 (List!855 (_ BitVec 64)) Option!73)

(assert (=> b!33021 (isDefined!29 (getValueByKey!67 (toList!431 lt!11911) (select (arr!1064 _keys!1833) lt!11912)))))

(declare-fun b!33022 () Bool)

(declare-fun Unit!743 () Unit!739)

(assert (=> b!33022 (= e!20967 Unit!743)))

(declare-fun b!33023 () Bool)

(assert (=> b!33023 (= e!20968 (isDefined!29 (getValueByKey!67 (toList!431 lt!11911) (select (arr!1064 _keys!1833) lt!11912))))))

(assert (= (and d!5093 c!3784) b!33021))

(assert (= (and d!5093 (not c!3784)) b!33022))

(assert (= (and d!5093 (not res!20090)) b!33023))

(assert (=> d!5093 m!26289))

(declare-fun m!26379 () Bool)

(assert (=> d!5093 m!26379))

(assert (=> b!33021 m!26289))

(declare-fun m!26381 () Bool)

(assert (=> b!33021 m!26381))

(assert (=> b!33021 m!26289))

(declare-fun m!26383 () Bool)

(assert (=> b!33021 m!26383))

(assert (=> b!33021 m!26383))

(declare-fun m!26385 () Bool)

(assert (=> b!33021 m!26385))

(assert (=> b!33023 m!26289))

(assert (=> b!33023 m!26383))

(assert (=> b!33023 m!26383))

(assert (=> b!33023 m!26385))

(assert (=> b!32948 d!5093))

(declare-fun d!5095 () Bool)

(declare-fun e!20971 () Bool)

(assert (=> d!5095 e!20971))

(declare-fun res!20093 () Bool)

(assert (=> d!5095 (=> (not res!20093) (not e!20971))))

(assert (=> d!5095 (= res!20093 (and (bvsge lt!11912 #b00000000000000000000000000000000) (bvslt lt!11912 (size!1165 _keys!1833))))))

(declare-fun lt!11946 () Unit!739)

(declare-fun choose!217 (array!2225 array!2223 (_ BitVec 32) (_ BitVec 32) V!1843 V!1843 (_ BitVec 32) Int) Unit!739)

(assert (=> d!5095 (= lt!11946 (choose!217 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11912 defaultEntry!1504))))

(assert (=> d!5095 (validMask!0 mask!2294)))

(assert (=> d!5095 (= (lemmaValidKeyInArrayIsInListMap!55 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11912 defaultEntry!1504) lt!11946)))

(declare-fun b!33026 () Bool)

(assert (=> b!33026 (= e!20971 (contains!375 (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1064 _keys!1833) lt!11912)))))

(assert (= (and d!5095 res!20093) b!33026))

(declare-fun m!26387 () Bool)

(assert (=> d!5095 m!26387))

(assert (=> d!5095 m!26309))

(assert (=> b!33026 m!26301))

(assert (=> b!33026 m!26289))

(assert (=> b!33026 m!26301))

(assert (=> b!33026 m!26289))

(declare-fun m!26389 () Bool)

(assert (=> b!33026 m!26389))

(assert (=> b!32948 d!5095))

(declare-fun d!5097 () Bool)

(declare-fun lt!11949 () (_ BitVec 32))

(assert (=> d!5097 (and (or (bvslt lt!11949 #b00000000000000000000000000000000) (bvsge lt!11949 (size!1165 _keys!1833)) (and (bvsge lt!11949 #b00000000000000000000000000000000) (bvslt lt!11949 (size!1165 _keys!1833)))) (bvsge lt!11949 #b00000000000000000000000000000000) (bvslt lt!11949 (size!1165 _keys!1833)) (= (select (arr!1064 _keys!1833) lt!11949) k0!1304))))

(declare-fun e!20974 () (_ BitVec 32))

(assert (=> d!5097 (= lt!11949 e!20974)))

(declare-fun c!3787 () Bool)

(assert (=> d!5097 (= c!3787 (= (select (arr!1064 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1165 _keys!1833)) (bvslt (size!1165 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5097 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!11949)))

(declare-fun b!33031 () Bool)

(assert (=> b!33031 (= e!20974 #b00000000000000000000000000000000)))

(declare-fun b!33032 () Bool)

(assert (=> b!33032 (= e!20974 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5097 c!3787) b!33031))

(assert (= (and d!5097 (not c!3787)) b!33032))

(declare-fun m!26391 () Bool)

(assert (=> d!5097 m!26391))

(declare-fun m!26393 () Bool)

(assert (=> d!5097 m!26393))

(declare-fun m!26395 () Bool)

(assert (=> b!33032 m!26395))

(assert (=> b!32948 d!5097))

(declare-fun d!5099 () Bool)

(declare-fun res!20100 () Bool)

(declare-fun e!20983 () Bool)

(assert (=> d!5099 (=> res!20100 e!20983)))

(assert (=> d!5099 (= res!20100 (bvsge #b00000000000000000000000000000000 (size!1165 _keys!1833)))))

(assert (=> d!5099 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!851) e!20983)))

(declare-fun bm!2628 () Bool)

(declare-fun call!2631 () Bool)

(declare-fun c!3790 () Bool)

(assert (=> bm!2628 (= call!2631 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3790 (Cons!850 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000) Nil!851) Nil!851)))))

(declare-fun b!33043 () Bool)

(declare-fun e!20984 () Bool)

(assert (=> b!33043 (= e!20984 call!2631)))

(declare-fun b!33044 () Bool)

(declare-fun e!20986 () Bool)

(assert (=> b!33044 (= e!20986 e!20984)))

(assert (=> b!33044 (= c!3790 (validKeyInArray!0 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33045 () Bool)

(assert (=> b!33045 (= e!20983 e!20986)))

(declare-fun res!20101 () Bool)

(assert (=> b!33045 (=> (not res!20101) (not e!20986))))

(declare-fun e!20985 () Bool)

(assert (=> b!33045 (= res!20101 (not e!20985))))

(declare-fun res!20102 () Bool)

(assert (=> b!33045 (=> (not res!20102) (not e!20985))))

(assert (=> b!33045 (= res!20102 (validKeyInArray!0 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33046 () Bool)

(assert (=> b!33046 (= e!20984 call!2631)))

(declare-fun b!33047 () Bool)

(declare-fun contains!377 (List!854 (_ BitVec 64)) Bool)

(assert (=> b!33047 (= e!20985 (contains!377 Nil!851 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5099 (not res!20100)) b!33045))

(assert (= (and b!33045 res!20102) b!33047))

(assert (= (and b!33045 res!20101) b!33044))

(assert (= (and b!33044 c!3790) b!33046))

(assert (= (and b!33044 (not c!3790)) b!33043))

(assert (= (or b!33046 b!33043) bm!2628))

(assert (=> bm!2628 m!26393))

(declare-fun m!26397 () Bool)

(assert (=> bm!2628 m!26397))

(assert (=> b!33044 m!26393))

(assert (=> b!33044 m!26393))

(declare-fun m!26399 () Bool)

(assert (=> b!33044 m!26399))

(assert (=> b!33045 m!26393))

(assert (=> b!33045 m!26393))

(assert (=> b!33045 m!26399))

(assert (=> b!33047 m!26393))

(assert (=> b!33047 m!26393))

(declare-fun m!26401 () Bool)

(assert (=> b!33047 m!26401))

(assert (=> b!32940 d!5099))

(declare-fun d!5101 () Bool)

(declare-fun res!20107 () Bool)

(declare-fun e!20991 () Bool)

(assert (=> d!5101 (=> res!20107 e!20991)))

(assert (=> d!5101 (= res!20107 (= (select (arr!1064 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5101 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!20991)))

(declare-fun b!33052 () Bool)

(declare-fun e!20992 () Bool)

(assert (=> b!33052 (= e!20991 e!20992)))

(declare-fun res!20108 () Bool)

(assert (=> b!33052 (=> (not res!20108) (not e!20992))))

(assert (=> b!33052 (= res!20108 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1165 _keys!1833)))))

(declare-fun b!33053 () Bool)

(assert (=> b!33053 (= e!20992 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5101 (not res!20107)) b!33052))

(assert (= (and b!33052 res!20108) b!33053))

(assert (=> d!5101 m!26393))

(declare-fun m!26403 () Bool)

(assert (=> b!33053 m!26403))

(assert (=> b!32944 d!5101))

(declare-fun bm!2631 () Bool)

(declare-fun call!2634 () Bool)

(assert (=> bm!2631 (= call!2634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!33062 () Bool)

(declare-fun e!20999 () Bool)

(assert (=> b!33062 (= e!20999 call!2634)))

(declare-fun b!33063 () Bool)

(declare-fun e!21001 () Bool)

(assert (=> b!33063 (= e!21001 e!20999)))

(declare-fun lt!11956 () (_ BitVec 64))

(assert (=> b!33063 (= lt!11956 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11958 () Unit!739)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2225 (_ BitVec 64) (_ BitVec 32)) Unit!739)

(assert (=> b!33063 (= lt!11958 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!11956 #b00000000000000000000000000000000))))

(assert (=> b!33063 (arrayContainsKey!0 _keys!1833 lt!11956 #b00000000000000000000000000000000)))

(declare-fun lt!11957 () Unit!739)

(assert (=> b!33063 (= lt!11957 lt!11958)))

(declare-fun res!20113 () Bool)

(assert (=> b!33063 (= res!20113 (= (seekEntryOrOpen!0 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!122 #b00000000000000000000000000000000)))))

(assert (=> b!33063 (=> (not res!20113) (not e!20999))))

(declare-fun b!33064 () Bool)

(assert (=> b!33064 (= e!21001 call!2634)))

(declare-fun d!5103 () Bool)

(declare-fun res!20114 () Bool)

(declare-fun e!21000 () Bool)

(assert (=> d!5103 (=> res!20114 e!21000)))

(assert (=> d!5103 (= res!20114 (bvsge #b00000000000000000000000000000000 (size!1165 _keys!1833)))))

(assert (=> d!5103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21000)))

(declare-fun b!33065 () Bool)

(assert (=> b!33065 (= e!21000 e!21001)))

(declare-fun c!3793 () Bool)

(assert (=> b!33065 (= c!3793 (validKeyInArray!0 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5103 (not res!20114)) b!33065))

(assert (= (and b!33065 c!3793) b!33063))

(assert (= (and b!33065 (not c!3793)) b!33064))

(assert (= (and b!33063 res!20113) b!33062))

(assert (= (or b!33062 b!33064) bm!2631))

(declare-fun m!26405 () Bool)

(assert (=> bm!2631 m!26405))

(assert (=> b!33063 m!26393))

(declare-fun m!26407 () Bool)

(assert (=> b!33063 m!26407))

(declare-fun m!26409 () Bool)

(assert (=> b!33063 m!26409))

(assert (=> b!33063 m!26393))

(declare-fun m!26411 () Bool)

(assert (=> b!33063 m!26411))

(assert (=> b!33065 m!26393))

(assert (=> b!33065 m!26393))

(assert (=> b!33065 m!26399))

(assert (=> b!32946 d!5103))

(declare-fun d!5105 () Bool)

(assert (=> d!5105 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32945 d!5105))

(declare-fun d!5107 () Bool)

(declare-fun e!21003 () Bool)

(assert (=> d!5107 e!21003))

(declare-fun res!20115 () Bool)

(assert (=> d!5107 (=> res!20115 e!21003)))

(declare-fun lt!11961 () Bool)

(assert (=> d!5107 (= res!20115 (not lt!11961))))

(declare-fun lt!11962 () Bool)

(assert (=> d!5107 (= lt!11961 lt!11962)))

(declare-fun lt!11959 () Unit!739)

(declare-fun e!21002 () Unit!739)

(assert (=> d!5107 (= lt!11959 e!21002)))

(declare-fun c!3794 () Bool)

(assert (=> d!5107 (= c!3794 lt!11962)))

(assert (=> d!5107 (= lt!11962 (containsKey!31 (toList!431 lt!11911) k0!1304))))

(assert (=> d!5107 (= (contains!375 lt!11911 k0!1304) lt!11961)))

(declare-fun b!33066 () Bool)

(declare-fun lt!11960 () Unit!739)

(assert (=> b!33066 (= e!21002 lt!11960)))

(assert (=> b!33066 (= lt!11960 (lemmaContainsKeyImpliesGetValueByKeyDefined!28 (toList!431 lt!11911) k0!1304))))

(assert (=> b!33066 (isDefined!29 (getValueByKey!67 (toList!431 lt!11911) k0!1304))))

(declare-fun b!33067 () Bool)

(declare-fun Unit!744 () Unit!739)

(assert (=> b!33067 (= e!21002 Unit!744)))

(declare-fun b!33068 () Bool)

(assert (=> b!33068 (= e!21003 (isDefined!29 (getValueByKey!67 (toList!431 lt!11911) k0!1304)))))

(assert (= (and d!5107 c!3794) b!33066))

(assert (= (and d!5107 (not c!3794)) b!33067))

(assert (= (and d!5107 (not res!20115)) b!33068))

(declare-fun m!26413 () Bool)

(assert (=> d!5107 m!26413))

(declare-fun m!26415 () Bool)

(assert (=> b!33066 m!26415))

(declare-fun m!26417 () Bool)

(assert (=> b!33066 m!26417))

(assert (=> b!33066 m!26417))

(declare-fun m!26419 () Bool)

(assert (=> b!33066 m!26419))

(assert (=> b!33068 m!26417))

(assert (=> b!33068 m!26417))

(assert (=> b!33068 m!26419))

(assert (=> b!32941 d!5107))

(declare-fun b!33111 () Bool)

(declare-fun e!21037 () Unit!739)

(declare-fun lt!12028 () Unit!739)

(assert (=> b!33111 (= e!21037 lt!12028)))

(declare-fun lt!12010 () ListLongMap!831)

(declare-fun getCurrentListMapNoExtraKeys!22 (array!2225 array!2223 (_ BitVec 32) (_ BitVec 32) V!1843 V!1843 (_ BitVec 32) Int) ListLongMap!831)

(assert (=> b!33111 (= lt!12010 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12024 () (_ BitVec 64))

(assert (=> b!33111 (= lt!12024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12014 () (_ BitVec 64))

(assert (=> b!33111 (= lt!12014 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12027 () Unit!739)

(declare-fun addStillContains!20 (ListLongMap!831 (_ BitVec 64) V!1843 (_ BitVec 64)) Unit!739)

(assert (=> b!33111 (= lt!12027 (addStillContains!20 lt!12010 lt!12024 zeroValue!1443 lt!12014))))

(declare-fun +!52 (ListLongMap!831 tuple2!1260) ListLongMap!831)

(assert (=> b!33111 (contains!375 (+!52 lt!12010 (tuple2!1261 lt!12024 zeroValue!1443)) lt!12014)))

(declare-fun lt!12026 () Unit!739)

(assert (=> b!33111 (= lt!12026 lt!12027)))

(declare-fun lt!12020 () ListLongMap!831)

(assert (=> b!33111 (= lt!12020 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12025 () (_ BitVec 64))

(assert (=> b!33111 (= lt!12025 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12022 () (_ BitVec 64))

(assert (=> b!33111 (= lt!12022 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12023 () Unit!739)

(declare-fun addApplyDifferent!20 (ListLongMap!831 (_ BitVec 64) V!1843 (_ BitVec 64)) Unit!739)

(assert (=> b!33111 (= lt!12023 (addApplyDifferent!20 lt!12020 lt!12025 minValue!1443 lt!12022))))

(declare-fun apply!35 (ListLongMap!831 (_ BitVec 64)) V!1843)

(assert (=> b!33111 (= (apply!35 (+!52 lt!12020 (tuple2!1261 lt!12025 minValue!1443)) lt!12022) (apply!35 lt!12020 lt!12022))))

(declare-fun lt!12012 () Unit!739)

(assert (=> b!33111 (= lt!12012 lt!12023)))

(declare-fun lt!12019 () ListLongMap!831)

(assert (=> b!33111 (= lt!12019 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12017 () (_ BitVec 64))

(assert (=> b!33111 (= lt!12017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12021 () (_ BitVec 64))

(assert (=> b!33111 (= lt!12021 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12013 () Unit!739)

(assert (=> b!33111 (= lt!12013 (addApplyDifferent!20 lt!12019 lt!12017 zeroValue!1443 lt!12021))))

(assert (=> b!33111 (= (apply!35 (+!52 lt!12019 (tuple2!1261 lt!12017 zeroValue!1443)) lt!12021) (apply!35 lt!12019 lt!12021))))

(declare-fun lt!12009 () Unit!739)

(assert (=> b!33111 (= lt!12009 lt!12013)))

(declare-fun lt!12007 () ListLongMap!831)

(assert (=> b!33111 (= lt!12007 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12018 () (_ BitVec 64))

(assert (=> b!33111 (= lt!12018 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12011 () (_ BitVec 64))

(assert (=> b!33111 (= lt!12011 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!33111 (= lt!12028 (addApplyDifferent!20 lt!12007 lt!12018 minValue!1443 lt!12011))))

(assert (=> b!33111 (= (apply!35 (+!52 lt!12007 (tuple2!1261 lt!12018 minValue!1443)) lt!12011) (apply!35 lt!12007 lt!12011))))

(declare-fun b!33112 () Bool)

(declare-fun e!21031 () ListLongMap!831)

(declare-fun e!21032 () ListLongMap!831)

(assert (=> b!33112 (= e!21031 e!21032)))

(declare-fun c!3811 () Bool)

(assert (=> b!33112 (= c!3811 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33113 () Bool)

(declare-fun call!2652 () ListLongMap!831)

(assert (=> b!33113 (= e!21031 (+!52 call!2652 (tuple2!1261 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun call!2650 () ListLongMap!831)

(declare-fun call!2649 () ListLongMap!831)

(declare-fun bm!2646 () Bool)

(declare-fun c!3810 () Bool)

(declare-fun call!2654 () ListLongMap!831)

(assert (=> bm!2646 (= call!2652 (+!52 (ite c!3810 call!2649 (ite c!3811 call!2650 call!2654)) (ite (or c!3810 c!3811) (tuple2!1261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1261 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!33114 () Bool)

(declare-fun c!3808 () Bool)

(assert (=> b!33114 (= c!3808 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!21041 () ListLongMap!831)

(assert (=> b!33114 (= e!21032 e!21041)))

(declare-fun d!5109 () Bool)

(declare-fun e!21040 () Bool)

(assert (=> d!5109 e!21040))

(declare-fun res!20139 () Bool)

(assert (=> d!5109 (=> (not res!20139) (not e!21040))))

(assert (=> d!5109 (= res!20139 (or (bvsge #b00000000000000000000000000000000 (size!1165 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1165 _keys!1833)))))))

(declare-fun lt!12016 () ListLongMap!831)

(declare-fun lt!12015 () ListLongMap!831)

(assert (=> d!5109 (= lt!12016 lt!12015)))

(declare-fun lt!12008 () Unit!739)

(assert (=> d!5109 (= lt!12008 e!21037)))

(declare-fun c!3807 () Bool)

(declare-fun e!21035 () Bool)

(assert (=> d!5109 (= c!3807 e!21035)))

(declare-fun res!20136 () Bool)

(assert (=> d!5109 (=> (not res!20136) (not e!21035))))

(assert (=> d!5109 (= res!20136 (bvslt #b00000000000000000000000000000000 (size!1165 _keys!1833)))))

(assert (=> d!5109 (= lt!12015 e!21031)))

(assert (=> d!5109 (= c!3810 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5109 (validMask!0 mask!2294)))

(assert (=> d!5109 (= (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12016)))

(declare-fun b!33115 () Bool)

(declare-fun e!21034 () Bool)

(declare-fun call!2655 () Bool)

(assert (=> b!33115 (= e!21034 (not call!2655))))

(declare-fun b!33116 () Bool)

(declare-fun e!21030 () Bool)

(declare-fun get!564 (ValueCell!557 V!1843) V!1843)

(declare-fun dynLambda!148 (Int (_ BitVec 64)) V!1843)

(assert (=> b!33116 (= e!21030 (= (apply!35 lt!12016 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000)) (get!564 (select (arr!1063 _values!1501) #b00000000000000000000000000000000) (dynLambda!148 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33116 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1164 _values!1501)))))

(assert (=> b!33116 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1165 _keys!1833)))))

(declare-fun bm!2647 () Bool)

(assert (=> bm!2647 (= call!2654 call!2650)))

(declare-fun b!33117 () Bool)

(declare-fun Unit!745 () Unit!739)

(assert (=> b!33117 (= e!21037 Unit!745)))

(declare-fun b!33118 () Bool)

(declare-fun e!21039 () Bool)

(assert (=> b!33118 (= e!21034 e!21039)))

(declare-fun res!20134 () Bool)

(assert (=> b!33118 (= res!20134 call!2655)))

(assert (=> b!33118 (=> (not res!20134) (not e!21039))))

(declare-fun b!33119 () Bool)

(assert (=> b!33119 (= e!21035 (validKeyInArray!0 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2648 () Bool)

(assert (=> bm!2648 (= call!2655 (contains!375 lt!12016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2649 () Bool)

(assert (=> bm!2649 (= call!2649 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33120 () Bool)

(declare-fun e!21038 () Bool)

(assert (=> b!33120 (= e!21038 (validKeyInArray!0 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33121 () Bool)

(declare-fun call!2653 () ListLongMap!831)

(assert (=> b!33121 (= e!21041 call!2653)))

(declare-fun b!33122 () Bool)

(declare-fun e!21033 () Bool)

(assert (=> b!33122 (= e!21040 e!21033)))

(declare-fun c!3812 () Bool)

(assert (=> b!33122 (= c!3812 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33123 () Bool)

(declare-fun res!20137 () Bool)

(assert (=> b!33123 (=> (not res!20137) (not e!21040))))

(declare-fun e!21036 () Bool)

(assert (=> b!33123 (= res!20137 e!21036)))

(declare-fun res!20142 () Bool)

(assert (=> b!33123 (=> res!20142 e!21036)))

(assert (=> b!33123 (= res!20142 (not e!21038))))

(declare-fun res!20141 () Bool)

(assert (=> b!33123 (=> (not res!20141) (not e!21038))))

(assert (=> b!33123 (= res!20141 (bvslt #b00000000000000000000000000000000 (size!1165 _keys!1833)))))

(declare-fun b!33124 () Bool)

(assert (=> b!33124 (= e!21032 call!2653)))

(declare-fun b!33125 () Bool)

(declare-fun res!20135 () Bool)

(assert (=> b!33125 (=> (not res!20135) (not e!21040))))

(assert (=> b!33125 (= res!20135 e!21034)))

(declare-fun c!3809 () Bool)

(assert (=> b!33125 (= c!3809 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!33126 () Bool)

(assert (=> b!33126 (= e!21041 call!2654)))

(declare-fun b!33127 () Bool)

(declare-fun call!2651 () Bool)

(assert (=> b!33127 (= e!21033 (not call!2651))))

(declare-fun b!33128 () Bool)

(declare-fun e!21042 () Bool)

(assert (=> b!33128 (= e!21042 (= (apply!35 lt!12016 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun bm!2650 () Bool)

(assert (=> bm!2650 (= call!2651 (contains!375 lt!12016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2651 () Bool)

(assert (=> bm!2651 (= call!2650 call!2649)))

(declare-fun b!33129 () Bool)

(assert (=> b!33129 (= e!21036 e!21030)))

(declare-fun res!20140 () Bool)

(assert (=> b!33129 (=> (not res!20140) (not e!21030))))

(assert (=> b!33129 (= res!20140 (contains!375 lt!12016 (select (arr!1064 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!33129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1165 _keys!1833)))))

(declare-fun bm!2652 () Bool)

(assert (=> bm!2652 (= call!2653 call!2652)))

(declare-fun b!33130 () Bool)

(assert (=> b!33130 (= e!21039 (= (apply!35 lt!12016 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!33131 () Bool)

(assert (=> b!33131 (= e!21033 e!21042)))

(declare-fun res!20138 () Bool)

(assert (=> b!33131 (= res!20138 call!2651)))

(assert (=> b!33131 (=> (not res!20138) (not e!21042))))

(assert (= (and d!5109 c!3810) b!33113))

(assert (= (and d!5109 (not c!3810)) b!33112))

(assert (= (and b!33112 c!3811) b!33124))

(assert (= (and b!33112 (not c!3811)) b!33114))

(assert (= (and b!33114 c!3808) b!33121))

(assert (= (and b!33114 (not c!3808)) b!33126))

(assert (= (or b!33121 b!33126) bm!2647))

(assert (= (or b!33124 bm!2647) bm!2651))

(assert (= (or b!33124 b!33121) bm!2652))

(assert (= (or b!33113 bm!2651) bm!2649))

(assert (= (or b!33113 bm!2652) bm!2646))

(assert (= (and d!5109 res!20136) b!33119))

(assert (= (and d!5109 c!3807) b!33111))

(assert (= (and d!5109 (not c!3807)) b!33117))

(assert (= (and d!5109 res!20139) b!33123))

(assert (= (and b!33123 res!20141) b!33120))

(assert (= (and b!33123 (not res!20142)) b!33129))

(assert (= (and b!33129 res!20140) b!33116))

(assert (= (and b!33123 res!20137) b!33125))

(assert (= (and b!33125 c!3809) b!33118))

(assert (= (and b!33125 (not c!3809)) b!33115))

(assert (= (and b!33118 res!20134) b!33130))

(assert (= (or b!33118 b!33115) bm!2648))

(assert (= (and b!33125 res!20135) b!33122))

(assert (= (and b!33122 c!3812) b!33131))

(assert (= (and b!33122 (not c!3812)) b!33127))

(assert (= (and b!33131 res!20138) b!33128))

(assert (= (or b!33131 b!33127) bm!2650))

(declare-fun b_lambda!1687 () Bool)

(assert (=> (not b_lambda!1687) (not b!33116)))

(declare-fun t!3551 () Bool)

(declare-fun tb!679 () Bool)

(assert (=> (and start!4290 (= defaultEntry!1504 defaultEntry!1504) t!3551) tb!679))

(declare-fun result!1159 () Bool)

(assert (=> tb!679 (= result!1159 tp_is_empty!1513)))

(assert (=> b!33116 t!3551))

(declare-fun b_and!1969 () Bool)

(assert (= b_and!1963 (and (=> t!3551 result!1159) b_and!1969)))

(assert (=> b!33129 m!26393))

(assert (=> b!33129 m!26393))

(declare-fun m!26421 () Bool)

(assert (=> b!33129 m!26421))

(assert (=> b!33119 m!26393))

(assert (=> b!33119 m!26393))

(assert (=> b!33119 m!26399))

(declare-fun m!26423 () Bool)

(assert (=> bm!2648 m!26423))

(declare-fun m!26425 () Bool)

(assert (=> b!33113 m!26425))

(declare-fun m!26427 () Bool)

(assert (=> bm!2650 m!26427))

(assert (=> b!33116 m!26393))

(declare-fun m!26429 () Bool)

(assert (=> b!33116 m!26429))

(assert (=> b!33116 m!26393))

(declare-fun m!26431 () Bool)

(assert (=> b!33116 m!26431))

(declare-fun m!26433 () Bool)

(assert (=> b!33116 m!26433))

(assert (=> b!33116 m!26433))

(assert (=> b!33116 m!26431))

(declare-fun m!26435 () Bool)

(assert (=> b!33116 m!26435))

(declare-fun m!26437 () Bool)

(assert (=> b!33130 m!26437))

(assert (=> b!33120 m!26393))

(assert (=> b!33120 m!26393))

(assert (=> b!33120 m!26399))

(assert (=> d!5109 m!26309))

(declare-fun m!26439 () Bool)

(assert (=> bm!2646 m!26439))

(declare-fun m!26441 () Bool)

(assert (=> b!33111 m!26441))

(declare-fun m!26443 () Bool)

(assert (=> b!33111 m!26443))

(declare-fun m!26445 () Bool)

(assert (=> b!33111 m!26445))

(declare-fun m!26447 () Bool)

(assert (=> b!33111 m!26447))

(declare-fun m!26449 () Bool)

(assert (=> b!33111 m!26449))

(assert (=> b!33111 m!26441))

(declare-fun m!26451 () Bool)

(assert (=> b!33111 m!26451))

(declare-fun m!26453 () Bool)

(assert (=> b!33111 m!26453))

(declare-fun m!26455 () Bool)

(assert (=> b!33111 m!26455))

(declare-fun m!26457 () Bool)

(assert (=> b!33111 m!26457))

(assert (=> b!33111 m!26453))

(declare-fun m!26459 () Bool)

(assert (=> b!33111 m!26459))

(assert (=> b!33111 m!26445))

(declare-fun m!26461 () Bool)

(assert (=> b!33111 m!26461))

(declare-fun m!26463 () Bool)

(assert (=> b!33111 m!26463))

(declare-fun m!26465 () Bool)

(assert (=> b!33111 m!26465))

(assert (=> b!33111 m!26393))

(assert (=> b!33111 m!26463))

(declare-fun m!26467 () Bool)

(assert (=> b!33111 m!26467))

(declare-fun m!26469 () Bool)

(assert (=> b!33111 m!26469))

(declare-fun m!26471 () Bool)

(assert (=> b!33111 m!26471))

(declare-fun m!26473 () Bool)

(assert (=> b!33128 m!26473))

(assert (=> bm!2649 m!26449))

(assert (=> b!32941 d!5109))

(declare-fun b!33146 () Bool)

(declare-fun c!3820 () Bool)

(declare-fun lt!12036 () (_ BitVec 64))

(assert (=> b!33146 (= c!3820 (= lt!12036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21051 () SeekEntryResult!122)

(declare-fun e!21049 () SeekEntryResult!122)

(assert (=> b!33146 (= e!21051 e!21049)))

(declare-fun b!33147 () Bool)

(declare-fun lt!12037 () SeekEntryResult!122)

(assert (=> b!33147 (= e!21051 (Found!122 (index!2612 lt!12037)))))

(declare-fun b!33148 () Bool)

(declare-fun e!21050 () SeekEntryResult!122)

(assert (=> b!33148 (= e!21050 e!21051)))

(assert (=> b!33148 (= lt!12036 (select (arr!1064 _keys!1833) (index!2612 lt!12037)))))

(declare-fun c!3819 () Bool)

(assert (=> b!33148 (= c!3819 (= lt!12036 k0!1304))))

(declare-fun b!33149 () Bool)

(assert (=> b!33149 (= e!21050 Undefined!122)))

(declare-fun b!33150 () Bool)

(assert (=> b!33150 (= e!21049 (MissingZero!122 (index!2612 lt!12037)))))

(declare-fun d!5111 () Bool)

(declare-fun lt!12035 () SeekEntryResult!122)

(assert (=> d!5111 (and (or ((_ is Undefined!122) lt!12035) (not ((_ is Found!122) lt!12035)) (and (bvsge (index!2611 lt!12035) #b00000000000000000000000000000000) (bvslt (index!2611 lt!12035) (size!1165 _keys!1833)))) (or ((_ is Undefined!122) lt!12035) ((_ is Found!122) lt!12035) (not ((_ is MissingZero!122) lt!12035)) (and (bvsge (index!2610 lt!12035) #b00000000000000000000000000000000) (bvslt (index!2610 lt!12035) (size!1165 _keys!1833)))) (or ((_ is Undefined!122) lt!12035) ((_ is Found!122) lt!12035) ((_ is MissingZero!122) lt!12035) (not ((_ is MissingVacant!122) lt!12035)) (and (bvsge (index!2613 lt!12035) #b00000000000000000000000000000000) (bvslt (index!2613 lt!12035) (size!1165 _keys!1833)))) (or ((_ is Undefined!122) lt!12035) (ite ((_ is Found!122) lt!12035) (= (select (arr!1064 _keys!1833) (index!2611 lt!12035)) k0!1304) (ite ((_ is MissingZero!122) lt!12035) (= (select (arr!1064 _keys!1833) (index!2610 lt!12035)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!122) lt!12035) (= (select (arr!1064 _keys!1833) (index!2613 lt!12035)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!5111 (= lt!12035 e!21050)))

(declare-fun c!3821 () Bool)

(assert (=> d!5111 (= c!3821 (and ((_ is Intermediate!122) lt!12037) (undefined!934 lt!12037)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2225 (_ BitVec 32)) SeekEntryResult!122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5111 (= lt!12037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5111 (validMask!0 mask!2294)))

(assert (=> d!5111 (= (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294) lt!12035)))

(declare-fun b!33151 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2225 (_ BitVec 32)) SeekEntryResult!122)

(assert (=> b!33151 (= e!21049 (seekKeyOrZeroReturnVacant!0 (x!6780 lt!12037) (index!2612 lt!12037) (index!2612 lt!12037) k0!1304 _keys!1833 mask!2294))))

(assert (= (and d!5111 c!3821) b!33149))

(assert (= (and d!5111 (not c!3821)) b!33148))

(assert (= (and b!33148 c!3819) b!33147))

(assert (= (and b!33148 (not c!3819)) b!33146))

(assert (= (and b!33146 c!3820) b!33150))

(assert (= (and b!33146 (not c!3820)) b!33151))

(declare-fun m!26475 () Bool)

(assert (=> b!33148 m!26475))

(declare-fun m!26477 () Bool)

(assert (=> d!5111 m!26477))

(declare-fun m!26479 () Bool)

(assert (=> d!5111 m!26479))

(declare-fun m!26481 () Bool)

(assert (=> d!5111 m!26481))

(declare-fun m!26483 () Bool)

(assert (=> d!5111 m!26483))

(declare-fun m!26485 () Bool)

(assert (=> d!5111 m!26485))

(assert (=> d!5111 m!26477))

(assert (=> d!5111 m!26309))

(declare-fun m!26487 () Bool)

(assert (=> b!33151 m!26487))

(assert (=> b!32947 d!5111))

(declare-fun d!5113 () Bool)

(assert (=> d!5113 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4290 d!5113))

(declare-fun d!5115 () Bool)

(assert (=> d!5115 (= (array_inv!729 _values!1501) (bvsge (size!1164 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4290 d!5115))

(declare-fun d!5117 () Bool)

(assert (=> d!5117 (= (array_inv!730 _keys!1833) (bvsge (size!1165 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4290 d!5117))

(declare-fun mapNonEmpty!1813 () Bool)

(declare-fun mapRes!1813 () Bool)

(declare-fun tp!4918 () Bool)

(declare-fun e!21056 () Bool)

(assert (=> mapNonEmpty!1813 (= mapRes!1813 (and tp!4918 e!21056))))

(declare-fun mapRest!1813 () (Array (_ BitVec 32) ValueCell!557))

(declare-fun mapKey!1813 () (_ BitVec 32))

(declare-fun mapValue!1813 () ValueCell!557)

(assert (=> mapNonEmpty!1813 (= mapRest!1804 (store mapRest!1813 mapKey!1813 mapValue!1813))))

(declare-fun b!33159 () Bool)

(declare-fun e!21057 () Bool)

(assert (=> b!33159 (= e!21057 tp_is_empty!1513)))

(declare-fun condMapEmpty!1813 () Bool)

(declare-fun mapDefault!1813 () ValueCell!557)

(assert (=> mapNonEmpty!1804 (= condMapEmpty!1813 (= mapRest!1804 ((as const (Array (_ BitVec 32) ValueCell!557)) mapDefault!1813)))))

(assert (=> mapNonEmpty!1804 (= tp!4902 (and e!21057 mapRes!1813))))

(declare-fun mapIsEmpty!1813 () Bool)

(assert (=> mapIsEmpty!1813 mapRes!1813))

(declare-fun b!33158 () Bool)

(assert (=> b!33158 (= e!21056 tp_is_empty!1513)))

(assert (= (and mapNonEmpty!1804 condMapEmpty!1813) mapIsEmpty!1813))

(assert (= (and mapNonEmpty!1804 (not condMapEmpty!1813)) mapNonEmpty!1813))

(assert (= (and mapNonEmpty!1813 ((_ is ValueCellFull!557) mapValue!1813)) b!33158))

(assert (= (and mapNonEmpty!1804 ((_ is ValueCellFull!557) mapDefault!1813)) b!33159))

(declare-fun m!26489 () Bool)

(assert (=> mapNonEmpty!1813 m!26489))

(declare-fun b_lambda!1689 () Bool)

(assert (= b_lambda!1687 (or (and start!4290 b_free!1159) b_lambda!1689)))

(check-sat (not b!33023) (not b!33119) (not b_lambda!1689) (not b!33128) (not b_next!1159) (not b!33116) (not b!33111) (not b!33066) (not d!5111) (not d!5107) (not bm!2648) (not bm!2631) (not b!33120) (not bm!2646) (not b!33113) (not b!33044) (not b!33026) b_and!1969 (not b!33053) (not b!33151) (not b!33021) (not b!33068) (not bm!2649) (not b!33045) (not d!5109) (not b!33065) (not b!33130) (not b!33129) (not d!5093) (not b!33063) tp_is_empty!1513 (not mapNonEmpty!1813) (not d!5095) (not b!33047) (not bm!2628) (not bm!2650) (not b!33032))
(check-sat b_and!1969 (not b_next!1159))
