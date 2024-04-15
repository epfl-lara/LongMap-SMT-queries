; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132250 () Bool)

(assert start!132250)

(declare-fun b_free!31927 () Bool)

(declare-fun b_next!31927 () Bool)

(assert (=> start!132250 (= b_free!31927 (not b_next!31927))))

(declare-fun tp!112045 () Bool)

(declare-fun b_and!51347 () Bool)

(assert (=> start!132250 (= tp!112045 b_and!51347)))

(declare-fun b!1551974 () Bool)

(declare-fun c!142866 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!668917 () Bool)

(assert (=> b!1551974 (= c!142866 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668917))))

(declare-datatypes ((V!59381 0))(
  ( (V!59382 (val!19179 Int)) )
))
(declare-datatypes ((tuple2!24808 0))(
  ( (tuple2!24809 (_1!12415 (_ BitVec 64)) (_2!12415 V!59381)) )
))
(declare-datatypes ((List!36255 0))(
  ( (Nil!36252) (Cons!36251 (h!37697 tuple2!24808) (t!50961 List!36255)) )
))
(declare-datatypes ((ListLongMap!22417 0))(
  ( (ListLongMap!22418 (toList!11224 List!36255)) )
))
(declare-fun e!863965 () ListLongMap!22417)

(declare-fun e!863960 () ListLongMap!22417)

(assert (=> b!1551974 (= e!863965 e!863960)))

(declare-fun b!1551975 () Bool)

(declare-datatypes ((Unit!51516 0))(
  ( (Unit!51517) )
))
(declare-fun e!863962 () Unit!51516)

(declare-fun lt!668918 () Unit!51516)

(assert (=> b!1551975 (= e!863962 lt!668918)))

(declare-datatypes ((array!103532 0))(
  ( (array!103533 (arr!49965 (Array (_ BitVec 32) (_ BitVec 64))) (size!50517 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103532)

(declare-fun zeroValue!436 () V!59381)

(declare-fun lt!668911 () ListLongMap!22417)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18191 0))(
  ( (ValueCellFull!18191 (v!21980 V!59381)) (EmptyCell!18191) )
))
(declare-datatypes ((array!103534 0))(
  ( (array!103535 (arr!49966 (Array (_ BitVec 32) ValueCell!18191)) (size!50518 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103534)

(declare-fun minValue!436 () V!59381)

(declare-fun getCurrentListMapNoExtraKeys!6659 (array!103532 array!103534 (_ BitVec 32) (_ BitVec 32) V!59381 V!59381 (_ BitVec 32) Int) ListLongMap!22417)

(assert (=> b!1551975 (= lt!668911 (getCurrentListMapNoExtraKeys!6659 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668921 () Unit!51516)

(declare-fun addStillContains!1297 (ListLongMap!22417 (_ BitVec 64) V!59381 (_ BitVec 64)) Unit!51516)

(assert (=> b!1551975 (= lt!668921 (addStillContains!1297 lt!668911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49965 _keys!618) from!762)))))

(declare-fun lt!668913 () ListLongMap!22417)

(declare-fun +!5038 (ListLongMap!22417 tuple2!24808) ListLongMap!22417)

(assert (=> b!1551975 (= lt!668913 (+!5038 lt!668911 (tuple2!24809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10086 (ListLongMap!22417 (_ BitVec 64)) Bool)

(assert (=> b!1551975 (contains!10086 lt!668913 (select (arr!49965 _keys!618) from!762))))

(declare-fun addApplyDifferent!632 (ListLongMap!22417 (_ BitVec 64) V!59381 (_ BitVec 64)) Unit!51516)

(assert (=> b!1551975 (= lt!668918 (addApplyDifferent!632 lt!668911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49965 _keys!618) from!762)))))

(declare-fun lt!668915 () V!59381)

(declare-fun apply!1096 (ListLongMap!22417 (_ BitVec 64)) V!59381)

(assert (=> b!1551975 (= lt!668915 (apply!1096 (+!5038 lt!668911 (tuple2!24809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49965 _keys!618) from!762)))))

(declare-fun lt!668916 () V!59381)

(assert (=> b!1551975 (= lt!668916 (apply!1096 lt!668911 (select (arr!49965 _keys!618) from!762)))))

(assert (=> b!1551975 (= lt!668915 lt!668916)))

(declare-fun lt!668919 () Unit!51516)

(assert (=> b!1551975 (= lt!668919 (addApplyDifferent!632 lt!668911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49965 _keys!618) from!762)))))

(assert (=> b!1551975 (= (apply!1096 lt!668913 (select (arr!49965 _keys!618) from!762)) lt!668916)))

(declare-fun b!1551976 () Bool)

(declare-fun e!863961 () Bool)

(declare-fun e!863956 () Bool)

(declare-fun mapRes!59020 () Bool)

(assert (=> b!1551976 (= e!863961 (and e!863956 mapRes!59020))))

(declare-fun condMapEmpty!59020 () Bool)

(declare-fun mapDefault!59020 () ValueCell!18191)

(assert (=> b!1551976 (= condMapEmpty!59020 (= (arr!49966 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18191)) mapDefault!59020)))))

(declare-fun b!1551977 () Bool)

(declare-fun e!863958 () Bool)

(assert (=> b!1551977 (= e!863958 (bvsge from!762 (size!50518 _values!470)))))

(declare-fun b!1551978 () Bool)

(declare-fun e!863964 () Bool)

(declare-fun tp_is_empty!38203 () Bool)

(assert (=> b!1551978 (= e!863964 tp_is_empty!38203)))

(declare-fun bm!71187 () Bool)

(declare-fun call!71193 () ListLongMap!22417)

(declare-fun call!71190 () ListLongMap!22417)

(assert (=> bm!71187 (= call!71193 call!71190)))

(declare-fun b!1551979 () Bool)

(declare-fun call!71192 () ListLongMap!22417)

(assert (=> b!1551979 (= e!863960 call!71192)))

(declare-fun b!1551980 () Bool)

(declare-fun call!71194 () ListLongMap!22417)

(assert (=> b!1551980 (= e!863960 call!71194)))

(declare-fun mapIsEmpty!59020 () Bool)

(assert (=> mapIsEmpty!59020 mapRes!59020))

(declare-fun res!1062653 () Bool)

(declare-fun e!863963 () Bool)

(assert (=> start!132250 (=> (not res!1062653) (not e!863963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132250 (= res!1062653 (validMask!0 mask!926))))

(assert (=> start!132250 e!863963))

(declare-fun array_inv!39045 (array!103532) Bool)

(assert (=> start!132250 (array_inv!39045 _keys!618)))

(assert (=> start!132250 tp_is_empty!38203))

(assert (=> start!132250 true))

(assert (=> start!132250 tp!112045))

(declare-fun array_inv!39046 (array!103534) Bool)

(assert (=> start!132250 (and (array_inv!39046 _values!470) e!863961)))

(declare-fun b!1551981 () Bool)

(assert (=> b!1551981 (= e!863963 e!863958)))

(declare-fun res!1062649 () Bool)

(assert (=> b!1551981 (=> (not res!1062649) (not e!863958))))

(declare-fun lt!668912 () Bool)

(assert (=> b!1551981 (= res!1062649 (not lt!668912))))

(declare-fun lt!668914 () Unit!51516)

(assert (=> b!1551981 (= lt!668914 e!863962)))

(declare-fun c!142863 () Bool)

(assert (=> b!1551981 (= c!142863 (not lt!668912))))

(declare-fun e!863955 () Bool)

(assert (=> b!1551981 (= lt!668912 e!863955)))

(declare-fun res!1062654 () Bool)

(assert (=> b!1551981 (=> res!1062654 e!863955)))

(assert (=> b!1551981 (= res!1062654 (bvsge from!762 (size!50517 _keys!618)))))

(declare-fun lt!668920 () ListLongMap!22417)

(declare-fun e!863959 () ListLongMap!22417)

(assert (=> b!1551981 (= lt!668920 e!863959)))

(declare-fun c!142865 () Bool)

(assert (=> b!1551981 (= c!142865 (and (not lt!668917) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551981 (= lt!668917 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551982 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551982 (= e!863955 (not (validKeyInArray!0 (select (arr!49965 _keys!618) from!762))))))

(declare-fun b!1551983 () Bool)

(declare-fun res!1062648 () Bool)

(assert (=> b!1551983 (=> (not res!1062648) (not e!863963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103532 (_ BitVec 32)) Bool)

(assert (=> b!1551983 (= res!1062648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551984 () Bool)

(declare-fun res!1062655 () Bool)

(assert (=> b!1551984 (=> (not res!1062655) (not e!863963))))

(assert (=> b!1551984 (= res!1062655 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50517 _keys!618))))))

(declare-fun mapNonEmpty!59020 () Bool)

(declare-fun tp!112046 () Bool)

(assert (=> mapNonEmpty!59020 (= mapRes!59020 (and tp!112046 e!863964))))

(declare-fun mapValue!59020 () ValueCell!18191)

(declare-fun mapRest!59020 () (Array (_ BitVec 32) ValueCell!18191))

(declare-fun mapKey!59020 () (_ BitVec 32))

(assert (=> mapNonEmpty!59020 (= (arr!49966 _values!470) (store mapRest!59020 mapKey!59020 mapValue!59020))))

(declare-fun c!142864 () Bool)

(declare-fun bm!71188 () Bool)

(declare-fun call!71191 () ListLongMap!22417)

(assert (=> bm!71188 (= call!71191 (+!5038 (ite c!142865 call!71190 (ite c!142864 call!71193 call!71194)) (ite (or c!142865 c!142864) (tuple2!24809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551985 () Bool)

(assert (=> b!1551985 (= e!863965 call!71192)))

(declare-fun b!1551986 () Bool)

(assert (=> b!1551986 (= e!863959 (+!5038 call!71191 (tuple2!24809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!71189 () Bool)

(assert (=> bm!71189 (= call!71194 call!71193)))

(declare-fun bm!71190 () Bool)

(assert (=> bm!71190 (= call!71192 call!71191)))

(declare-fun b!1551987 () Bool)

(declare-fun res!1062652 () Bool)

(assert (=> b!1551987 (=> (not res!1062652) (not e!863963))))

(assert (=> b!1551987 (= res!1062652 (and (= (size!50518 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50517 _keys!618) (size!50518 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551988 () Bool)

(declare-fun res!1062651 () Bool)

(assert (=> b!1551988 (=> (not res!1062651) (not e!863963))))

(declare-datatypes ((List!36256 0))(
  ( (Nil!36253) (Cons!36252 (h!37698 (_ BitVec 64)) (t!50962 List!36256)) )
))
(declare-fun arrayNoDuplicates!0 (array!103532 (_ BitVec 32) List!36256) Bool)

(assert (=> b!1551988 (= res!1062651 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36253))))

(declare-fun b!1551989 () Bool)

(assert (=> b!1551989 (= e!863959 e!863965)))

(assert (=> b!1551989 (= c!142864 (and (not lt!668917) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551990 () Bool)

(declare-fun Unit!51518 () Unit!51516)

(assert (=> b!1551990 (= e!863962 Unit!51518)))

(declare-fun b!1551991 () Bool)

(assert (=> b!1551991 (= e!863956 tp_is_empty!38203)))

(declare-fun b!1551992 () Bool)

(declare-fun res!1062650 () Bool)

(assert (=> b!1551992 (=> (not res!1062650) (not e!863958))))

(assert (=> b!1551992 (= res!1062650 (contains!10086 lt!668920 (select (arr!49965 _keys!618) from!762)))))

(declare-fun bm!71191 () Bool)

(assert (=> bm!71191 (= call!71190 (getCurrentListMapNoExtraKeys!6659 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!132250 res!1062653) b!1551987))

(assert (= (and b!1551987 res!1062652) b!1551983))

(assert (= (and b!1551983 res!1062648) b!1551988))

(assert (= (and b!1551988 res!1062651) b!1551984))

(assert (= (and b!1551984 res!1062655) b!1551981))

(assert (= (and b!1551981 c!142865) b!1551986))

(assert (= (and b!1551981 (not c!142865)) b!1551989))

(assert (= (and b!1551989 c!142864) b!1551985))

(assert (= (and b!1551989 (not c!142864)) b!1551974))

(assert (= (and b!1551974 c!142866) b!1551979))

(assert (= (and b!1551974 (not c!142866)) b!1551980))

(assert (= (or b!1551979 b!1551980) bm!71189))

(assert (= (or b!1551985 bm!71189) bm!71187))

(assert (= (or b!1551985 b!1551979) bm!71190))

(assert (= (or b!1551986 bm!71187) bm!71191))

(assert (= (or b!1551986 bm!71190) bm!71188))

(assert (= (and b!1551981 (not res!1062654)) b!1551982))

(assert (= (and b!1551981 c!142863) b!1551975))

(assert (= (and b!1551981 (not c!142863)) b!1551990))

(assert (= (and b!1551981 res!1062649) b!1551992))

(assert (= (and b!1551992 res!1062650) b!1551977))

(assert (= (and b!1551976 condMapEmpty!59020) mapIsEmpty!59020))

(assert (= (and b!1551976 (not condMapEmpty!59020)) mapNonEmpty!59020))

(get-info :version)

(assert (= (and mapNonEmpty!59020 ((_ is ValueCellFull!18191) mapValue!59020)) b!1551978))

(assert (= (and b!1551976 ((_ is ValueCellFull!18191) mapDefault!59020)) b!1551991))

(assert (= start!132250 b!1551976))

(declare-fun m!1429933 () Bool)

(assert (=> bm!71188 m!1429933))

(declare-fun m!1429935 () Bool)

(assert (=> mapNonEmpty!59020 m!1429935))

(declare-fun m!1429937 () Bool)

(assert (=> b!1551975 m!1429937))

(declare-fun m!1429939 () Bool)

(assert (=> b!1551975 m!1429939))

(declare-fun m!1429941 () Bool)

(assert (=> b!1551975 m!1429941))

(assert (=> b!1551975 m!1429937))

(assert (=> b!1551975 m!1429937))

(declare-fun m!1429943 () Bool)

(assert (=> b!1551975 m!1429943))

(declare-fun m!1429945 () Bool)

(assert (=> b!1551975 m!1429945))

(assert (=> b!1551975 m!1429937))

(declare-fun m!1429947 () Bool)

(assert (=> b!1551975 m!1429947))

(assert (=> b!1551975 m!1429937))

(declare-fun m!1429949 () Bool)

(assert (=> b!1551975 m!1429949))

(assert (=> b!1551975 m!1429937))

(declare-fun m!1429951 () Bool)

(assert (=> b!1551975 m!1429951))

(assert (=> b!1551975 m!1429937))

(declare-fun m!1429953 () Bool)

(assert (=> b!1551975 m!1429953))

(assert (=> b!1551975 m!1429937))

(declare-fun m!1429955 () Bool)

(assert (=> b!1551975 m!1429955))

(assert (=> b!1551975 m!1429945))

(declare-fun m!1429957 () Bool)

(assert (=> b!1551975 m!1429957))

(declare-fun m!1429959 () Bool)

(assert (=> b!1551983 m!1429959))

(declare-fun m!1429961 () Bool)

(assert (=> b!1551986 m!1429961))

(declare-fun m!1429963 () Bool)

(assert (=> b!1551988 m!1429963))

(assert (=> bm!71191 m!1429941))

(declare-fun m!1429965 () Bool)

(assert (=> start!132250 m!1429965))

(declare-fun m!1429967 () Bool)

(assert (=> start!132250 m!1429967))

(declare-fun m!1429969 () Bool)

(assert (=> start!132250 m!1429969))

(assert (=> b!1551982 m!1429937))

(assert (=> b!1551982 m!1429937))

(declare-fun m!1429971 () Bool)

(assert (=> b!1551982 m!1429971))

(assert (=> b!1551992 m!1429937))

(assert (=> b!1551992 m!1429937))

(declare-fun m!1429973 () Bool)

(assert (=> b!1551992 m!1429973))

(check-sat b_and!51347 (not b_next!31927) (not bm!71188) (not b!1551983) (not b!1551986) (not b!1551988) (not bm!71191) (not b!1551975) (not b!1551982) (not b!1551992) (not start!132250) tp_is_empty!38203 (not mapNonEmpty!59020))
(check-sat b_and!51347 (not b_next!31927))
