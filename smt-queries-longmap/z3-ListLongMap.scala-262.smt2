; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4296 () Bool)

(assert start!4296)

(declare-fun b_free!1161 () Bool)

(declare-fun b_next!1161 () Bool)

(assert (=> start!4296 (= b_free!1161 (not b_next!1161))))

(declare-fun tp!4908 () Bool)

(declare-fun b_and!1975 () Bool)

(assert (=> start!4296 (= tp!4908 b_and!1975)))

(declare-fun b!33043 () Bool)

(declare-fun e!20993 () Bool)

(declare-fun e!20992 () Bool)

(assert (=> b!33043 (= e!20993 (not e!20992))))

(declare-fun res!20103 () Bool)

(assert (=> b!33043 (=> res!20103 e!20992)))

(declare-datatypes ((array!2243 0))(
  ( (array!2244 (arr!1073 (Array (_ BitVec 32) (_ BitVec 64))) (size!1174 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2243)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!33043 (= res!20103 (not (= (size!1174 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((V!1845 0))(
  ( (V!1846 (val!784 Int)) )
))
(declare-datatypes ((tuple2!1278 0))(
  ( (tuple2!1279 (_1!650 (_ BitVec 64)) (_2!650 V!1845)) )
))
(declare-datatypes ((List!869 0))(
  ( (Nil!866) (Cons!865 (h!1432 tuple2!1278) (t!3566 List!869)) )
))
(declare-datatypes ((ListLongMap!855 0))(
  ( (ListLongMap!856 (toList!443 List!869)) )
))
(declare-fun lt!11964 () ListLongMap!855)

(declare-fun lt!11965 () (_ BitVec 32))

(declare-fun contains!385 (ListLongMap!855 (_ BitVec 64)) Bool)

(assert (=> b!33043 (contains!385 lt!11964 (select (arr!1073 _keys!1833) lt!11965))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!558 0))(
  ( (ValueCellFull!558 (v!1875 V!1845)) (EmptyCell!558) )
))
(declare-datatypes ((array!2245 0))(
  ( (array!2246 (arr!1074 (Array (_ BitVec 32) ValueCell!558)) (size!1175 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2245)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1845)

(declare-fun minValue!1443 () V!1845)

(declare-datatypes ((Unit!733 0))(
  ( (Unit!734) )
))
(declare-fun lt!11966 () Unit!733)

(declare-fun lemmaValidKeyInArrayIsInListMap!56 (array!2243 array!2245 (_ BitVec 32) (_ BitVec 32) V!1845 V!1845 (_ BitVec 32) Int) Unit!733)

(assert (=> b!33043 (= lt!11966 (lemmaValidKeyInArrayIsInListMap!56 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11965 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2243 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33043 (= lt!11965 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33044 () Bool)

(declare-fun e!20990 () Bool)

(assert (=> b!33044 (= e!20990 e!20993)))

(declare-fun res!20101 () Bool)

(assert (=> b!33044 (=> (not res!20101) (not e!20993))))

(assert (=> b!33044 (= res!20101 (not (contains!385 lt!11964 k0!1304)))))

(declare-fun getCurrentListMap!270 (array!2243 array!2245 (_ BitVec 32) (_ BitVec 32) V!1845 V!1845 (_ BitVec 32) Int) ListLongMap!855)

(assert (=> b!33044 (= lt!11964 (getCurrentListMap!270 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33045 () Bool)

(declare-fun e!20987 () Bool)

(declare-fun tp_is_empty!1515 () Bool)

(assert (=> b!33045 (= e!20987 tp_is_empty!1515)))

(declare-fun res!20098 () Bool)

(assert (=> start!4296 (=> (not res!20098) (not e!20990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4296 (= res!20098 (validMask!0 mask!2294))))

(assert (=> start!4296 e!20990))

(assert (=> start!4296 true))

(assert (=> start!4296 tp!4908))

(declare-fun e!20988 () Bool)

(declare-fun array_inv!755 (array!2245) Bool)

(assert (=> start!4296 (and (array_inv!755 _values!1501) e!20988)))

(declare-fun array_inv!756 (array!2243) Bool)

(assert (=> start!4296 (array_inv!756 _keys!1833)))

(assert (=> start!4296 tp_is_empty!1515))

(declare-fun b!33046 () Bool)

(declare-fun res!20096 () Bool)

(assert (=> b!33046 (=> (not res!20096) (not e!20990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33046 (= res!20096 (validKeyInArray!0 k0!1304))))

(declare-fun b!33047 () Bool)

(declare-fun e!20989 () Bool)

(assert (=> b!33047 (= e!20989 tp_is_empty!1515)))

(declare-fun b!33048 () Bool)

(declare-fun res!20097 () Bool)

(assert (=> b!33048 (=> (not res!20097) (not e!20990))))

(declare-datatypes ((List!870 0))(
  ( (Nil!867) (Cons!866 (h!1433 (_ BitVec 64)) (t!3567 List!870)) )
))
(declare-fun arrayNoDuplicates!0 (array!2243 (_ BitVec 32) List!870) Bool)

(assert (=> b!33048 (= res!20097 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!867))))

(declare-fun b!33049 () Bool)

(declare-fun res!20099 () Bool)

(assert (=> b!33049 (=> (not res!20099) (not e!20990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2243 (_ BitVec 32)) Bool)

(assert (=> b!33049 (= res!20099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1807 () Bool)

(declare-fun mapRes!1807 () Bool)

(assert (=> mapIsEmpty!1807 mapRes!1807))

(declare-fun b!33050 () Bool)

(declare-datatypes ((SeekEntryResult!124 0))(
  ( (MissingZero!124 (index!2618 (_ BitVec 32))) (Found!124 (index!2619 (_ BitVec 32))) (Intermediate!124 (undefined!936 Bool) (index!2620 (_ BitVec 32)) (x!6782 (_ BitVec 32))) (Undefined!124) (MissingVacant!124 (index!2621 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2243 (_ BitVec 32)) SeekEntryResult!124)

(assert (=> b!33050 (= e!20992 (= (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294) (Found!124 lt!11965)))))

(declare-fun b!33051 () Bool)

(declare-fun res!20100 () Bool)

(assert (=> b!33051 (=> (not res!20100) (not e!20993))))

(declare-fun arrayContainsKey!0 (array!2243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33051 (= res!20100 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1807 () Bool)

(declare-fun tp!4909 () Bool)

(assert (=> mapNonEmpty!1807 (= mapRes!1807 (and tp!4909 e!20987))))

(declare-fun mapRest!1807 () (Array (_ BitVec 32) ValueCell!558))

(declare-fun mapKey!1807 () (_ BitVec 32))

(declare-fun mapValue!1807 () ValueCell!558)

(assert (=> mapNonEmpty!1807 (= (arr!1074 _values!1501) (store mapRest!1807 mapKey!1807 mapValue!1807))))

(declare-fun b!33052 () Bool)

(assert (=> b!33052 (= e!20988 (and e!20989 mapRes!1807))))

(declare-fun condMapEmpty!1807 () Bool)

(declare-fun mapDefault!1807 () ValueCell!558)

(assert (=> b!33052 (= condMapEmpty!1807 (= (arr!1074 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!558)) mapDefault!1807)))))

(declare-fun b!33053 () Bool)

(declare-fun res!20102 () Bool)

(assert (=> b!33053 (=> (not res!20102) (not e!20990))))

(assert (=> b!33053 (= res!20102 (and (= (size!1175 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1174 _keys!1833) (size!1175 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4296 res!20098) b!33053))

(assert (= (and b!33053 res!20102) b!33049))

(assert (= (and b!33049 res!20099) b!33048))

(assert (= (and b!33048 res!20097) b!33046))

(assert (= (and b!33046 res!20096) b!33044))

(assert (= (and b!33044 res!20101) b!33051))

(assert (= (and b!33051 res!20100) b!33043))

(assert (= (and b!33043 (not res!20103)) b!33050))

(assert (= (and b!33052 condMapEmpty!1807) mapIsEmpty!1807))

(assert (= (and b!33052 (not condMapEmpty!1807)) mapNonEmpty!1807))

(get-info :version)

(assert (= (and mapNonEmpty!1807 ((_ is ValueCellFull!558) mapValue!1807)) b!33045))

(assert (= (and b!33052 ((_ is ValueCellFull!558) mapDefault!1807)) b!33047))

(assert (= start!4296 b!33052))

(declare-fun m!26471 () Bool)

(assert (=> b!33046 m!26471))

(declare-fun m!26473 () Bool)

(assert (=> b!33049 m!26473))

(declare-fun m!26475 () Bool)

(assert (=> b!33048 m!26475))

(declare-fun m!26477 () Bool)

(assert (=> b!33044 m!26477))

(declare-fun m!26479 () Bool)

(assert (=> b!33044 m!26479))

(declare-fun m!26481 () Bool)

(assert (=> b!33050 m!26481))

(declare-fun m!26483 () Bool)

(assert (=> b!33043 m!26483))

(assert (=> b!33043 m!26483))

(declare-fun m!26485 () Bool)

(assert (=> b!33043 m!26485))

(declare-fun m!26487 () Bool)

(assert (=> b!33043 m!26487))

(declare-fun m!26489 () Bool)

(assert (=> b!33043 m!26489))

(declare-fun m!26491 () Bool)

(assert (=> b!33051 m!26491))

(declare-fun m!26493 () Bool)

(assert (=> start!4296 m!26493))

(declare-fun m!26495 () Bool)

(assert (=> start!4296 m!26495))

(declare-fun m!26497 () Bool)

(assert (=> start!4296 m!26497))

(declare-fun m!26499 () Bool)

(assert (=> mapNonEmpty!1807 m!26499))

(check-sat (not start!4296) (not b!33044) (not b!33048) tp_is_empty!1515 b_and!1975 (not b!33043) (not b!33050) (not b_next!1161) (not b!33051) (not b!33046) (not mapNonEmpty!1807) (not b!33049))
(check-sat b_and!1975 (not b_next!1161))
(get-model)

(declare-fun d!5129 () Bool)

(declare-fun e!21020 () Bool)

(assert (=> d!5129 e!21020))

(declare-fun res!20130 () Bool)

(assert (=> d!5129 (=> res!20130 e!21020)))

(declare-fun lt!11986 () Bool)

(assert (=> d!5129 (= res!20130 (not lt!11986))))

(declare-fun lt!11985 () Bool)

(assert (=> d!5129 (= lt!11986 lt!11985)))

(declare-fun lt!11984 () Unit!733)

(declare-fun e!21019 () Unit!733)

(assert (=> d!5129 (= lt!11984 e!21019)))

(declare-fun c!3800 () Bool)

(assert (=> d!5129 (= c!3800 lt!11985)))

(declare-fun containsKey!31 (List!869 (_ BitVec 64)) Bool)

(assert (=> d!5129 (= lt!11985 (containsKey!31 (toList!443 lt!11964) k0!1304))))

(assert (=> d!5129 (= (contains!385 lt!11964 k0!1304) lt!11986)))

(declare-fun b!33093 () Bool)

(declare-fun lt!11987 () Unit!733)

(assert (=> b!33093 (= e!21019 lt!11987)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!28 (List!869 (_ BitVec 64)) Unit!733)

(assert (=> b!33093 (= lt!11987 (lemmaContainsKeyImpliesGetValueByKeyDefined!28 (toList!443 lt!11964) k0!1304))))

(declare-datatypes ((Option!73 0))(
  ( (Some!72 (v!1877 V!1845)) (None!71) )
))
(declare-fun isDefined!29 (Option!73) Bool)

(declare-fun getValueByKey!67 (List!869 (_ BitVec 64)) Option!73)

(assert (=> b!33093 (isDefined!29 (getValueByKey!67 (toList!443 lt!11964) k0!1304))))

(declare-fun b!33094 () Bool)

(declare-fun Unit!737 () Unit!733)

(assert (=> b!33094 (= e!21019 Unit!737)))

(declare-fun b!33095 () Bool)

(assert (=> b!33095 (= e!21020 (isDefined!29 (getValueByKey!67 (toList!443 lt!11964) k0!1304)))))

(assert (= (and d!5129 c!3800) b!33093))

(assert (= (and d!5129 (not c!3800)) b!33094))

(assert (= (and d!5129 (not res!20130)) b!33095))

(declare-fun m!26531 () Bool)

(assert (=> d!5129 m!26531))

(declare-fun m!26533 () Bool)

(assert (=> b!33093 m!26533))

(declare-fun m!26535 () Bool)

(assert (=> b!33093 m!26535))

(assert (=> b!33093 m!26535))

(declare-fun m!26537 () Bool)

(assert (=> b!33093 m!26537))

(assert (=> b!33095 m!26535))

(assert (=> b!33095 m!26535))

(assert (=> b!33095 m!26537))

(assert (=> b!33044 d!5129))

(declare-fun b!33138 () Bool)

(declare-fun e!21053 () Bool)

(declare-fun call!2659 () Bool)

(assert (=> b!33138 (= e!21053 (not call!2659))))

(declare-fun call!2662 () ListLongMap!855)

(declare-fun c!3818 () Bool)

(declare-fun c!3813 () Bool)

(declare-fun call!2661 () ListLongMap!855)

(declare-fun call!2658 () ListLongMap!855)

(declare-fun call!2660 () ListLongMap!855)

(declare-fun bm!2654 () Bool)

(declare-fun +!53 (ListLongMap!855 tuple2!1278) ListLongMap!855)

(assert (=> bm!2654 (= call!2662 (+!53 (ite c!3818 call!2658 (ite c!3813 call!2660 call!2661)) (ite (or c!3818 c!3813) (tuple2!1279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!33139 () Bool)

(declare-fun e!21059 () Bool)

(assert (=> b!33139 (= e!21059 (validKeyInArray!0 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33140 () Bool)

(declare-fun e!21054 () Bool)

(declare-fun e!21052 () Bool)

(assert (=> b!33140 (= e!21054 e!21052)))

(declare-fun res!20150 () Bool)

(declare-fun call!2663 () Bool)

(assert (=> b!33140 (= res!20150 call!2663)))

(assert (=> b!33140 (=> (not res!20150) (not e!21052))))

(declare-fun b!33141 () Bool)

(declare-fun e!21048 () ListLongMap!855)

(assert (=> b!33141 (= e!21048 call!2661)))

(declare-fun b!33142 () Bool)

(declare-fun e!21055 () Unit!733)

(declare-fun lt!12047 () Unit!733)

(assert (=> b!33142 (= e!21055 lt!12047)))

(declare-fun lt!12044 () ListLongMap!855)

(declare-fun getCurrentListMapNoExtraKeys!22 (array!2243 array!2245 (_ BitVec 32) (_ BitVec 32) V!1845 V!1845 (_ BitVec 32) Int) ListLongMap!855)

(assert (=> b!33142 (= lt!12044 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12038 () (_ BitVec 64))

(assert (=> b!33142 (= lt!12038 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12049 () (_ BitVec 64))

(assert (=> b!33142 (= lt!12049 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12036 () Unit!733)

(declare-fun addStillContains!20 (ListLongMap!855 (_ BitVec 64) V!1845 (_ BitVec 64)) Unit!733)

(assert (=> b!33142 (= lt!12036 (addStillContains!20 lt!12044 lt!12038 zeroValue!1443 lt!12049))))

(assert (=> b!33142 (contains!385 (+!53 lt!12044 (tuple2!1279 lt!12038 zeroValue!1443)) lt!12049)))

(declare-fun lt!12035 () Unit!733)

(assert (=> b!33142 (= lt!12035 lt!12036)))

(declare-fun lt!12043 () ListLongMap!855)

(assert (=> b!33142 (= lt!12043 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12041 () (_ BitVec 64))

(assert (=> b!33142 (= lt!12041 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12042 () (_ BitVec 64))

(assert (=> b!33142 (= lt!12042 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12032 () Unit!733)

(declare-fun addApplyDifferent!20 (ListLongMap!855 (_ BitVec 64) V!1845 (_ BitVec 64)) Unit!733)

(assert (=> b!33142 (= lt!12032 (addApplyDifferent!20 lt!12043 lt!12041 minValue!1443 lt!12042))))

(declare-fun apply!35 (ListLongMap!855 (_ BitVec 64)) V!1845)

(assert (=> b!33142 (= (apply!35 (+!53 lt!12043 (tuple2!1279 lt!12041 minValue!1443)) lt!12042) (apply!35 lt!12043 lt!12042))))

(declare-fun lt!12052 () Unit!733)

(assert (=> b!33142 (= lt!12052 lt!12032)))

(declare-fun lt!12050 () ListLongMap!855)

(assert (=> b!33142 (= lt!12050 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12034 () (_ BitVec 64))

(assert (=> b!33142 (= lt!12034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12039 () (_ BitVec 64))

(assert (=> b!33142 (= lt!12039 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12046 () Unit!733)

(assert (=> b!33142 (= lt!12046 (addApplyDifferent!20 lt!12050 lt!12034 zeroValue!1443 lt!12039))))

(assert (=> b!33142 (= (apply!35 (+!53 lt!12050 (tuple2!1279 lt!12034 zeroValue!1443)) lt!12039) (apply!35 lt!12050 lt!12039))))

(declare-fun lt!12051 () Unit!733)

(assert (=> b!33142 (= lt!12051 lt!12046)))

(declare-fun lt!12037 () ListLongMap!855)

(assert (=> b!33142 (= lt!12037 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12033 () (_ BitVec 64))

(assert (=> b!33142 (= lt!12033 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12040 () (_ BitVec 64))

(assert (=> b!33142 (= lt!12040 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!33142 (= lt!12047 (addApplyDifferent!20 lt!12037 lt!12033 minValue!1443 lt!12040))))

(assert (=> b!33142 (= (apply!35 (+!53 lt!12037 (tuple2!1279 lt!12033 minValue!1443)) lt!12040) (apply!35 lt!12037 lt!12040))))

(declare-fun b!33143 () Bool)

(declare-fun e!21057 () ListLongMap!855)

(declare-fun e!21050 () ListLongMap!855)

(assert (=> b!33143 (= e!21057 e!21050)))

(assert (=> b!33143 (= c!3813 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33144 () Bool)

(assert (=> b!33144 (= e!21057 (+!53 call!2662 (tuple2!1279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!33145 () Bool)

(declare-fun lt!12053 () ListLongMap!855)

(assert (=> b!33145 (= e!21052 (= (apply!35 lt!12053 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!33146 () Bool)

(declare-fun Unit!738 () Unit!733)

(assert (=> b!33146 (= e!21055 Unit!738)))

(declare-fun b!33147 () Bool)

(declare-fun c!3815 () Bool)

(assert (=> b!33147 (= c!3815 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!33147 (= e!21050 e!21048)))

(declare-fun b!33148 () Bool)

(declare-fun e!21051 () Bool)

(assert (=> b!33148 (= e!21051 (validKeyInArray!0 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33149 () Bool)

(declare-fun e!21047 () Bool)

(assert (=> b!33149 (= e!21047 e!21053)))

(declare-fun c!3816 () Bool)

(assert (=> b!33149 (= c!3816 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!5131 () Bool)

(assert (=> d!5131 e!21047))

(declare-fun res!20149 () Bool)

(assert (=> d!5131 (=> (not res!20149) (not e!21047))))

(assert (=> d!5131 (= res!20149 (or (bvsge #b00000000000000000000000000000000 (size!1174 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1174 _keys!1833)))))))

(declare-fun lt!12048 () ListLongMap!855)

(assert (=> d!5131 (= lt!12053 lt!12048)))

(declare-fun lt!12045 () Unit!733)

(assert (=> d!5131 (= lt!12045 e!21055)))

(declare-fun c!3814 () Bool)

(assert (=> d!5131 (= c!3814 e!21059)))

(declare-fun res!20155 () Bool)

(assert (=> d!5131 (=> (not res!20155) (not e!21059))))

(assert (=> d!5131 (= res!20155 (bvslt #b00000000000000000000000000000000 (size!1174 _keys!1833)))))

(assert (=> d!5131 (= lt!12048 e!21057)))

(assert (=> d!5131 (= c!3818 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5131 (validMask!0 mask!2294)))

(assert (=> d!5131 (= (getCurrentListMap!270 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12053)))

(declare-fun b!33150 () Bool)

(assert (=> b!33150 (= e!21054 (not call!2663))))

(declare-fun bm!2655 () Bool)

(assert (=> bm!2655 (= call!2663 (contains!385 lt!12053 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2656 () Bool)

(assert (=> bm!2656 (= call!2660 call!2658)))

(declare-fun b!33151 () Bool)

(declare-fun call!2657 () ListLongMap!855)

(assert (=> b!33151 (= e!21050 call!2657)))

(declare-fun bm!2657 () Bool)

(assert (=> bm!2657 (= call!2661 call!2660)))

(declare-fun b!33152 () Bool)

(declare-fun res!20154 () Bool)

(assert (=> b!33152 (=> (not res!20154) (not e!21047))))

(assert (=> b!33152 (= res!20154 e!21054)))

(declare-fun c!3817 () Bool)

(assert (=> b!33152 (= c!3817 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!33153 () Bool)

(declare-fun e!21058 () Bool)

(declare-fun e!21049 () Bool)

(assert (=> b!33153 (= e!21058 e!21049)))

(declare-fun res!20151 () Bool)

(assert (=> b!33153 (=> (not res!20151) (not e!21049))))

(assert (=> b!33153 (= res!20151 (contains!385 lt!12053 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!33153 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1174 _keys!1833)))))

(declare-fun b!33154 () Bool)

(declare-fun e!21056 () Bool)

(assert (=> b!33154 (= e!21056 (= (apply!35 lt!12053 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun bm!2658 () Bool)

(assert (=> bm!2658 (= call!2659 (contains!385 lt!12053 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2659 () Bool)

(assert (=> bm!2659 (= call!2657 call!2662)))

(declare-fun b!33155 () Bool)

(assert (=> b!33155 (= e!21053 e!21056)))

(declare-fun res!20156 () Bool)

(assert (=> b!33155 (= res!20156 call!2659)))

(assert (=> b!33155 (=> (not res!20156) (not e!21056))))

(declare-fun bm!2660 () Bool)

(assert (=> bm!2660 (= call!2658 (getCurrentListMapNoExtraKeys!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33156 () Bool)

(declare-fun get!564 (ValueCell!558 V!1845) V!1845)

(declare-fun dynLambda!152 (Int (_ BitVec 64)) V!1845)

(assert (=> b!33156 (= e!21049 (= (apply!35 lt!12053 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000)) (get!564 (select (arr!1074 _values!1501) #b00000000000000000000000000000000) (dynLambda!152 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33156 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1175 _values!1501)))))

(assert (=> b!33156 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1174 _keys!1833)))))

(declare-fun b!33157 () Bool)

(assert (=> b!33157 (= e!21048 call!2657)))

(declare-fun b!33158 () Bool)

(declare-fun res!20152 () Bool)

(assert (=> b!33158 (=> (not res!20152) (not e!21047))))

(assert (=> b!33158 (= res!20152 e!21058)))

(declare-fun res!20157 () Bool)

(assert (=> b!33158 (=> res!20157 e!21058)))

(assert (=> b!33158 (= res!20157 (not e!21051))))

(declare-fun res!20153 () Bool)

(assert (=> b!33158 (=> (not res!20153) (not e!21051))))

(assert (=> b!33158 (= res!20153 (bvslt #b00000000000000000000000000000000 (size!1174 _keys!1833)))))

(assert (= (and d!5131 c!3818) b!33144))

(assert (= (and d!5131 (not c!3818)) b!33143))

(assert (= (and b!33143 c!3813) b!33151))

(assert (= (and b!33143 (not c!3813)) b!33147))

(assert (= (and b!33147 c!3815) b!33157))

(assert (= (and b!33147 (not c!3815)) b!33141))

(assert (= (or b!33157 b!33141) bm!2657))

(assert (= (or b!33151 bm!2657) bm!2656))

(assert (= (or b!33151 b!33157) bm!2659))

(assert (= (or b!33144 bm!2656) bm!2660))

(assert (= (or b!33144 bm!2659) bm!2654))

(assert (= (and d!5131 res!20155) b!33139))

(assert (= (and d!5131 c!3814) b!33142))

(assert (= (and d!5131 (not c!3814)) b!33146))

(assert (= (and d!5131 res!20149) b!33158))

(assert (= (and b!33158 res!20153) b!33148))

(assert (= (and b!33158 (not res!20157)) b!33153))

(assert (= (and b!33153 res!20151) b!33156))

(assert (= (and b!33158 res!20152) b!33152))

(assert (= (and b!33152 c!3817) b!33140))

(assert (= (and b!33152 (not c!3817)) b!33150))

(assert (= (and b!33140 res!20150) b!33145))

(assert (= (or b!33140 b!33150) bm!2655))

(assert (= (and b!33152 res!20154) b!33149))

(assert (= (and b!33149 c!3816) b!33155))

(assert (= (and b!33149 (not c!3816)) b!33138))

(assert (= (and b!33155 res!20156) b!33154))

(assert (= (or b!33155 b!33138) bm!2658))

(declare-fun b_lambda!1703 () Bool)

(assert (=> (not b_lambda!1703) (not b!33156)))

(declare-fun t!3571 () Bool)

(declare-fun tb!685 () Bool)

(assert (=> (and start!4296 (= defaultEntry!1504 defaultEntry!1504) t!3571) tb!685))

(declare-fun result!1165 () Bool)

(assert (=> tb!685 (= result!1165 tp_is_empty!1515)))

(assert (=> b!33156 t!3571))

(declare-fun b_and!1979 () Bool)

(assert (= b_and!1975 (and (=> t!3571 result!1165) b_and!1979)))

(declare-fun m!26539 () Bool)

(assert (=> b!33142 m!26539))

(declare-fun m!26541 () Bool)

(assert (=> b!33142 m!26541))

(declare-fun m!26543 () Bool)

(assert (=> b!33142 m!26543))

(declare-fun m!26545 () Bool)

(assert (=> b!33142 m!26545))

(declare-fun m!26547 () Bool)

(assert (=> b!33142 m!26547))

(declare-fun m!26549 () Bool)

(assert (=> b!33142 m!26549))

(declare-fun m!26551 () Bool)

(assert (=> b!33142 m!26551))

(declare-fun m!26553 () Bool)

(assert (=> b!33142 m!26553))

(declare-fun m!26555 () Bool)

(assert (=> b!33142 m!26555))

(assert (=> b!33142 m!26541))

(declare-fun m!26557 () Bool)

(assert (=> b!33142 m!26557))

(assert (=> b!33142 m!26539))

(declare-fun m!26559 () Bool)

(assert (=> b!33142 m!26559))

(declare-fun m!26561 () Bool)

(assert (=> b!33142 m!26561))

(declare-fun m!26563 () Bool)

(assert (=> b!33142 m!26563))

(declare-fun m!26565 () Bool)

(assert (=> b!33142 m!26565))

(assert (=> b!33142 m!26549))

(declare-fun m!26567 () Bool)

(assert (=> b!33142 m!26567))

(assert (=> b!33142 m!26561))

(declare-fun m!26569 () Bool)

(assert (=> b!33142 m!26569))

(declare-fun m!26571 () Bool)

(assert (=> b!33142 m!26571))

(declare-fun m!26573 () Bool)

(assert (=> b!33144 m!26573))

(declare-fun m!26575 () Bool)

(assert (=> bm!2655 m!26575))

(assert (=> b!33156 m!26563))

(declare-fun m!26577 () Bool)

(assert (=> b!33156 m!26577))

(declare-fun m!26579 () Bool)

(assert (=> b!33156 m!26579))

(declare-fun m!26581 () Bool)

(assert (=> b!33156 m!26581))

(assert (=> b!33156 m!26579))

(assert (=> b!33156 m!26581))

(declare-fun m!26583 () Bool)

(assert (=> b!33156 m!26583))

(assert (=> b!33156 m!26563))

(declare-fun m!26585 () Bool)

(assert (=> b!33145 m!26585))

(assert (=> b!33148 m!26563))

(assert (=> b!33148 m!26563))

(declare-fun m!26587 () Bool)

(assert (=> b!33148 m!26587))

(assert (=> b!33139 m!26563))

(assert (=> b!33139 m!26563))

(assert (=> b!33139 m!26587))

(declare-fun m!26589 () Bool)

(assert (=> bm!2658 m!26589))

(assert (=> d!5131 m!26493))

(declare-fun m!26591 () Bool)

(assert (=> b!33154 m!26591))

(assert (=> b!33153 m!26563))

(assert (=> b!33153 m!26563))

(declare-fun m!26593 () Bool)

(assert (=> b!33153 m!26593))

(declare-fun m!26595 () Bool)

(assert (=> bm!2654 m!26595))

(assert (=> bm!2660 m!26555))

(assert (=> b!33044 d!5131))

(declare-fun b!33173 () Bool)

(declare-fun e!21068 () SeekEntryResult!124)

(declare-fun lt!12060 () SeekEntryResult!124)

(assert (=> b!33173 (= e!21068 (Found!124 (index!2620 lt!12060)))))

(declare-fun b!33174 () Bool)

(declare-fun e!21067 () SeekEntryResult!124)

(assert (=> b!33174 (= e!21067 (MissingZero!124 (index!2620 lt!12060)))))

(declare-fun b!33175 () Bool)

(declare-fun e!21066 () SeekEntryResult!124)

(assert (=> b!33175 (= e!21066 Undefined!124)))

(declare-fun d!5133 () Bool)

(declare-fun lt!12062 () SeekEntryResult!124)

(assert (=> d!5133 (and (or ((_ is Undefined!124) lt!12062) (not ((_ is Found!124) lt!12062)) (and (bvsge (index!2619 lt!12062) #b00000000000000000000000000000000) (bvslt (index!2619 lt!12062) (size!1174 _keys!1833)))) (or ((_ is Undefined!124) lt!12062) ((_ is Found!124) lt!12062) (not ((_ is MissingZero!124) lt!12062)) (and (bvsge (index!2618 lt!12062) #b00000000000000000000000000000000) (bvslt (index!2618 lt!12062) (size!1174 _keys!1833)))) (or ((_ is Undefined!124) lt!12062) ((_ is Found!124) lt!12062) ((_ is MissingZero!124) lt!12062) (not ((_ is MissingVacant!124) lt!12062)) (and (bvsge (index!2621 lt!12062) #b00000000000000000000000000000000) (bvslt (index!2621 lt!12062) (size!1174 _keys!1833)))) (or ((_ is Undefined!124) lt!12062) (ite ((_ is Found!124) lt!12062) (= (select (arr!1073 _keys!1833) (index!2619 lt!12062)) k0!1304) (ite ((_ is MissingZero!124) lt!12062) (= (select (arr!1073 _keys!1833) (index!2618 lt!12062)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!124) lt!12062) (= (select (arr!1073 _keys!1833) (index!2621 lt!12062)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!5133 (= lt!12062 e!21066)))

(declare-fun c!3827 () Bool)

(assert (=> d!5133 (= c!3827 (and ((_ is Intermediate!124) lt!12060) (undefined!936 lt!12060)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2243 (_ BitVec 32)) SeekEntryResult!124)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5133 (= lt!12060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5133 (validMask!0 mask!2294)))

(assert (=> d!5133 (= (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294) lt!12062)))

(declare-fun b!33176 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2243 (_ BitVec 32)) SeekEntryResult!124)

(assert (=> b!33176 (= e!21067 (seekKeyOrZeroReturnVacant!0 (x!6782 lt!12060) (index!2620 lt!12060) (index!2620 lt!12060) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!33177 () Bool)

(declare-fun c!3826 () Bool)

(declare-fun lt!12061 () (_ BitVec 64))

(assert (=> b!33177 (= c!3826 (= lt!12061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!33177 (= e!21068 e!21067)))

(declare-fun b!33178 () Bool)

(assert (=> b!33178 (= e!21066 e!21068)))

(assert (=> b!33178 (= lt!12061 (select (arr!1073 _keys!1833) (index!2620 lt!12060)))))

(declare-fun c!3825 () Bool)

(assert (=> b!33178 (= c!3825 (= lt!12061 k0!1304))))

(assert (= (and d!5133 c!3827) b!33175))

(assert (= (and d!5133 (not c!3827)) b!33178))

(assert (= (and b!33178 c!3825) b!33173))

(assert (= (and b!33178 (not c!3825)) b!33177))

(assert (= (and b!33177 c!3826) b!33174))

(assert (= (and b!33177 (not c!3826)) b!33176))

(declare-fun m!26597 () Bool)

(assert (=> d!5133 m!26597))

(assert (=> d!5133 m!26493))

(declare-fun m!26599 () Bool)

(assert (=> d!5133 m!26599))

(declare-fun m!26601 () Bool)

(assert (=> d!5133 m!26601))

(declare-fun m!26603 () Bool)

(assert (=> d!5133 m!26603))

(assert (=> d!5133 m!26597))

(declare-fun m!26605 () Bool)

(assert (=> d!5133 m!26605))

(declare-fun m!26607 () Bool)

(assert (=> b!33176 m!26607))

(declare-fun m!26609 () Bool)

(assert (=> b!33178 m!26609))

(assert (=> b!33050 d!5133))

(declare-fun d!5135 () Bool)

(assert (=> d!5135 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33046 d!5135))

(declare-fun d!5137 () Bool)

(declare-fun res!20162 () Bool)

(declare-fun e!21073 () Bool)

(assert (=> d!5137 (=> res!20162 e!21073)))

(assert (=> d!5137 (= res!20162 (= (select (arr!1073 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5137 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21073)))

(declare-fun b!33183 () Bool)

(declare-fun e!21074 () Bool)

(assert (=> b!33183 (= e!21073 e!21074)))

(declare-fun res!20163 () Bool)

(assert (=> b!33183 (=> (not res!20163) (not e!21074))))

(assert (=> b!33183 (= res!20163 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1174 _keys!1833)))))

(declare-fun b!33184 () Bool)

(assert (=> b!33184 (= e!21074 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5137 (not res!20162)) b!33183))

(assert (= (and b!33183 res!20163) b!33184))

(assert (=> d!5137 m!26563))

(declare-fun m!26611 () Bool)

(assert (=> b!33184 m!26611))

(assert (=> b!33051 d!5137))

(declare-fun d!5139 () Bool)

(declare-fun e!21076 () Bool)

(assert (=> d!5139 e!21076))

(declare-fun res!20164 () Bool)

(assert (=> d!5139 (=> res!20164 e!21076)))

(declare-fun lt!12065 () Bool)

(assert (=> d!5139 (= res!20164 (not lt!12065))))

(declare-fun lt!12064 () Bool)

(assert (=> d!5139 (= lt!12065 lt!12064)))

(declare-fun lt!12063 () Unit!733)

(declare-fun e!21075 () Unit!733)

(assert (=> d!5139 (= lt!12063 e!21075)))

(declare-fun c!3828 () Bool)

(assert (=> d!5139 (= c!3828 lt!12064)))

(assert (=> d!5139 (= lt!12064 (containsKey!31 (toList!443 lt!11964) (select (arr!1073 _keys!1833) lt!11965)))))

(assert (=> d!5139 (= (contains!385 lt!11964 (select (arr!1073 _keys!1833) lt!11965)) lt!12065)))

(declare-fun b!33185 () Bool)

(declare-fun lt!12066 () Unit!733)

(assert (=> b!33185 (= e!21075 lt!12066)))

(assert (=> b!33185 (= lt!12066 (lemmaContainsKeyImpliesGetValueByKeyDefined!28 (toList!443 lt!11964) (select (arr!1073 _keys!1833) lt!11965)))))

(assert (=> b!33185 (isDefined!29 (getValueByKey!67 (toList!443 lt!11964) (select (arr!1073 _keys!1833) lt!11965)))))

(declare-fun b!33186 () Bool)

(declare-fun Unit!739 () Unit!733)

(assert (=> b!33186 (= e!21075 Unit!739)))

(declare-fun b!33187 () Bool)

(assert (=> b!33187 (= e!21076 (isDefined!29 (getValueByKey!67 (toList!443 lt!11964) (select (arr!1073 _keys!1833) lt!11965))))))

(assert (= (and d!5139 c!3828) b!33185))

(assert (= (and d!5139 (not c!3828)) b!33186))

(assert (= (and d!5139 (not res!20164)) b!33187))

(assert (=> d!5139 m!26483))

(declare-fun m!26613 () Bool)

(assert (=> d!5139 m!26613))

(assert (=> b!33185 m!26483))

(declare-fun m!26615 () Bool)

(assert (=> b!33185 m!26615))

(assert (=> b!33185 m!26483))

(declare-fun m!26617 () Bool)

(assert (=> b!33185 m!26617))

(assert (=> b!33185 m!26617))

(declare-fun m!26619 () Bool)

(assert (=> b!33185 m!26619))

(assert (=> b!33187 m!26483))

(assert (=> b!33187 m!26617))

(assert (=> b!33187 m!26617))

(assert (=> b!33187 m!26619))

(assert (=> b!33043 d!5139))

(declare-fun d!5141 () Bool)

(declare-fun e!21079 () Bool)

(assert (=> d!5141 e!21079))

(declare-fun res!20167 () Bool)

(assert (=> d!5141 (=> (not res!20167) (not e!21079))))

(assert (=> d!5141 (= res!20167 (and (bvsge lt!11965 #b00000000000000000000000000000000) (bvslt lt!11965 (size!1174 _keys!1833))))))

(declare-fun lt!12069 () Unit!733)

(declare-fun choose!216 (array!2243 array!2245 (_ BitVec 32) (_ BitVec 32) V!1845 V!1845 (_ BitVec 32) Int) Unit!733)

(assert (=> d!5141 (= lt!12069 (choose!216 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11965 defaultEntry!1504))))

(assert (=> d!5141 (validMask!0 mask!2294)))

(assert (=> d!5141 (= (lemmaValidKeyInArrayIsInListMap!56 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11965 defaultEntry!1504) lt!12069)))

(declare-fun b!33190 () Bool)

(assert (=> b!33190 (= e!21079 (contains!385 (getCurrentListMap!270 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1073 _keys!1833) lt!11965)))))

(assert (= (and d!5141 res!20167) b!33190))

(declare-fun m!26621 () Bool)

(assert (=> d!5141 m!26621))

(assert (=> d!5141 m!26493))

(assert (=> b!33190 m!26479))

(assert (=> b!33190 m!26483))

(assert (=> b!33190 m!26479))

(assert (=> b!33190 m!26483))

(declare-fun m!26623 () Bool)

(assert (=> b!33190 m!26623))

(assert (=> b!33043 d!5141))

(declare-fun d!5143 () Bool)

(declare-fun lt!12072 () (_ BitVec 32))

(assert (=> d!5143 (and (or (bvslt lt!12072 #b00000000000000000000000000000000) (bvsge lt!12072 (size!1174 _keys!1833)) (and (bvsge lt!12072 #b00000000000000000000000000000000) (bvslt lt!12072 (size!1174 _keys!1833)))) (bvsge lt!12072 #b00000000000000000000000000000000) (bvslt lt!12072 (size!1174 _keys!1833)) (= (select (arr!1073 _keys!1833) lt!12072) k0!1304))))

(declare-fun e!21082 () (_ BitVec 32))

(assert (=> d!5143 (= lt!12072 e!21082)))

(declare-fun c!3831 () Bool)

(assert (=> d!5143 (= c!3831 (= (select (arr!1073 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1174 _keys!1833)) (bvslt (size!1174 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5143 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12072)))

(declare-fun b!33195 () Bool)

(assert (=> b!33195 (= e!21082 #b00000000000000000000000000000000)))

(declare-fun b!33196 () Bool)

(assert (=> b!33196 (= e!21082 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5143 c!3831) b!33195))

(assert (= (and d!5143 (not c!3831)) b!33196))

(declare-fun m!26625 () Bool)

(assert (=> d!5143 m!26625))

(assert (=> d!5143 m!26563))

(declare-fun m!26627 () Bool)

(assert (=> b!33196 m!26627))

(assert (=> b!33043 d!5143))

(declare-fun bm!2663 () Bool)

(declare-fun call!2666 () Bool)

(declare-fun c!3834 () Bool)

(assert (=> bm!2663 (= call!2666 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3834 (Cons!866 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000) Nil!867) Nil!867)))))

(declare-fun b!33207 () Bool)

(declare-fun e!21092 () Bool)

(assert (=> b!33207 (= e!21092 call!2666)))

(declare-fun b!33208 () Bool)

(declare-fun e!21094 () Bool)

(declare-fun e!21093 () Bool)

(assert (=> b!33208 (= e!21094 e!21093)))

(declare-fun res!20175 () Bool)

(assert (=> b!33208 (=> (not res!20175) (not e!21093))))

(declare-fun e!21091 () Bool)

(assert (=> b!33208 (= res!20175 (not e!21091))))

(declare-fun res!20174 () Bool)

(assert (=> b!33208 (=> (not res!20174) (not e!21091))))

(assert (=> b!33208 (= res!20174 (validKeyInArray!0 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5145 () Bool)

(declare-fun res!20176 () Bool)

(assert (=> d!5145 (=> res!20176 e!21094)))

(assert (=> d!5145 (= res!20176 (bvsge #b00000000000000000000000000000000 (size!1174 _keys!1833)))))

(assert (=> d!5145 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!867) e!21094)))

(declare-fun b!33209 () Bool)

(declare-fun contains!387 (List!870 (_ BitVec 64)) Bool)

(assert (=> b!33209 (= e!21091 (contains!387 Nil!867 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33210 () Bool)

(assert (=> b!33210 (= e!21093 e!21092)))

(assert (=> b!33210 (= c!3834 (validKeyInArray!0 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33211 () Bool)

(assert (=> b!33211 (= e!21092 call!2666)))

(assert (= (and d!5145 (not res!20176)) b!33208))

(assert (= (and b!33208 res!20174) b!33209))

(assert (= (and b!33208 res!20175) b!33210))

(assert (= (and b!33210 c!3834) b!33207))

(assert (= (and b!33210 (not c!3834)) b!33211))

(assert (= (or b!33207 b!33211) bm!2663))

(assert (=> bm!2663 m!26563))

(declare-fun m!26629 () Bool)

(assert (=> bm!2663 m!26629))

(assert (=> b!33208 m!26563))

(assert (=> b!33208 m!26563))

(assert (=> b!33208 m!26587))

(assert (=> b!33209 m!26563))

(assert (=> b!33209 m!26563))

(declare-fun m!26631 () Bool)

(assert (=> b!33209 m!26631))

(assert (=> b!33210 m!26563))

(assert (=> b!33210 m!26563))

(assert (=> b!33210 m!26587))

(assert (=> b!33048 d!5145))

(declare-fun d!5147 () Bool)

(assert (=> d!5147 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4296 d!5147))

(declare-fun d!5149 () Bool)

(assert (=> d!5149 (= (array_inv!755 _values!1501) (bvsge (size!1175 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4296 d!5149))

(declare-fun d!5151 () Bool)

(assert (=> d!5151 (= (array_inv!756 _keys!1833) (bvsge (size!1174 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4296 d!5151))

(declare-fun b!33220 () Bool)

(declare-fun e!21102 () Bool)

(declare-fun call!2669 () Bool)

(assert (=> b!33220 (= e!21102 call!2669)))

(declare-fun b!33221 () Bool)

(declare-fun e!21103 () Bool)

(assert (=> b!33221 (= e!21103 e!21102)))

(declare-fun c!3837 () Bool)

(assert (=> b!33221 (= c!3837 (validKeyInArray!0 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2666 () Bool)

(assert (=> bm!2666 (= call!2669 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!33222 () Bool)

(declare-fun e!21101 () Bool)

(assert (=> b!33222 (= e!21102 e!21101)))

(declare-fun lt!12079 () (_ BitVec 64))

(assert (=> b!33222 (= lt!12079 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12081 () Unit!733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2243 (_ BitVec 64) (_ BitVec 32)) Unit!733)

(assert (=> b!33222 (= lt!12081 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12079 #b00000000000000000000000000000000))))

(assert (=> b!33222 (arrayContainsKey!0 _keys!1833 lt!12079 #b00000000000000000000000000000000)))

(declare-fun lt!12080 () Unit!733)

(assert (=> b!33222 (= lt!12080 lt!12081)))

(declare-fun res!20182 () Bool)

(assert (=> b!33222 (= res!20182 (= (seekEntryOrOpen!0 (select (arr!1073 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!124 #b00000000000000000000000000000000)))))

(assert (=> b!33222 (=> (not res!20182) (not e!21101))))

(declare-fun b!33223 () Bool)

(assert (=> b!33223 (= e!21101 call!2669)))

(declare-fun d!5153 () Bool)

(declare-fun res!20181 () Bool)

(assert (=> d!5153 (=> res!20181 e!21103)))

(assert (=> d!5153 (= res!20181 (bvsge #b00000000000000000000000000000000 (size!1174 _keys!1833)))))

(assert (=> d!5153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21103)))

(assert (= (and d!5153 (not res!20181)) b!33221))

(assert (= (and b!33221 c!3837) b!33222))

(assert (= (and b!33221 (not c!3837)) b!33220))

(assert (= (and b!33222 res!20182) b!33223))

(assert (= (or b!33223 b!33220) bm!2666))

(assert (=> b!33221 m!26563))

(assert (=> b!33221 m!26563))

(assert (=> b!33221 m!26587))

(declare-fun m!26633 () Bool)

(assert (=> bm!2666 m!26633))

(assert (=> b!33222 m!26563))

(declare-fun m!26635 () Bool)

(assert (=> b!33222 m!26635))

(declare-fun m!26637 () Bool)

(assert (=> b!33222 m!26637))

(assert (=> b!33222 m!26563))

(declare-fun m!26639 () Bool)

(assert (=> b!33222 m!26639))

(assert (=> b!33049 d!5153))

(declare-fun b!33231 () Bool)

(declare-fun e!21109 () Bool)

(assert (=> b!33231 (= e!21109 tp_is_empty!1515)))

(declare-fun mapIsEmpty!1813 () Bool)

(declare-fun mapRes!1813 () Bool)

(assert (=> mapIsEmpty!1813 mapRes!1813))

(declare-fun condMapEmpty!1813 () Bool)

(declare-fun mapDefault!1813 () ValueCell!558)

(assert (=> mapNonEmpty!1807 (= condMapEmpty!1813 (= mapRest!1807 ((as const (Array (_ BitVec 32) ValueCell!558)) mapDefault!1813)))))

(assert (=> mapNonEmpty!1807 (= tp!4909 (and e!21109 mapRes!1813))))

(declare-fun mapNonEmpty!1813 () Bool)

(declare-fun tp!4918 () Bool)

(declare-fun e!21108 () Bool)

(assert (=> mapNonEmpty!1813 (= mapRes!1813 (and tp!4918 e!21108))))

(declare-fun mapKey!1813 () (_ BitVec 32))

(declare-fun mapValue!1813 () ValueCell!558)

(declare-fun mapRest!1813 () (Array (_ BitVec 32) ValueCell!558))

(assert (=> mapNonEmpty!1813 (= mapRest!1807 (store mapRest!1813 mapKey!1813 mapValue!1813))))

(declare-fun b!33230 () Bool)

(assert (=> b!33230 (= e!21108 tp_is_empty!1515)))

(assert (= (and mapNonEmpty!1807 condMapEmpty!1813) mapIsEmpty!1813))

(assert (= (and mapNonEmpty!1807 (not condMapEmpty!1813)) mapNonEmpty!1813))

(assert (= (and mapNonEmpty!1813 ((_ is ValueCellFull!558) mapValue!1813)) b!33230))

(assert (= (and mapNonEmpty!1807 ((_ is ValueCellFull!558) mapDefault!1813)) b!33231))

(declare-fun m!26641 () Bool)

(assert (=> mapNonEmpty!1813 m!26641))

(declare-fun b_lambda!1705 () Bool)

(assert (= b_lambda!1703 (or (and start!4296 b_free!1161) b_lambda!1705)))

(check-sat (not b!33142) (not d!5131) (not d!5139) (not b_lambda!1705) (not bm!2666) (not b!33187) (not d!5129) (not bm!2660) (not b!33209) (not b!33145) (not b!33095) (not b!33208) (not b!33176) (not b!33156) (not b!33093) (not b!33190) (not d!5141) (not b!33139) (not mapNonEmpty!1813) b_and!1979 tp_is_empty!1515 (not bm!2654) (not bm!2663) (not b!33148) (not b!33154) (not d!5133) (not b!33185) (not b_next!1161) (not b!33221) (not bm!2658) (not b!33153) (not b!33144) (not bm!2655) (not b!33196) (not b!33222) (not b!33184) (not b!33210))
(check-sat b_and!1979 (not b_next!1161))
