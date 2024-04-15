; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131900 () Bool)

(assert start!131900)

(declare-fun b_free!31663 () Bool)

(declare-fun b_next!31663 () Bool)

(assert (=> start!131900 (= b_free!31663 (not b_next!31663))))

(declare-fun tp!111241 () Bool)

(declare-fun b_and!51055 () Bool)

(assert (=> start!131900 (= tp!111241 b_and!51055)))

(declare-datatypes ((V!59029 0))(
  ( (V!59030 (val!19047 Int)) )
))
(declare-datatypes ((tuple2!24554 0))(
  ( (tuple2!24555 (_1!12288 (_ BitVec 64)) (_2!12288 V!59029)) )
))
(declare-datatypes ((List!36035 0))(
  ( (Nil!36032) (Cons!36031 (h!37477 tuple2!24554) (t!50721 List!36035)) )
))
(declare-datatypes ((ListLongMap!22163 0))(
  ( (ListLongMap!22164 (toList!11097 List!36035)) )
))
(declare-fun call!69169 () ListLongMap!22163)

(declare-datatypes ((array!103016 0))(
  ( (array!103017 (arr!49711 (Array (_ BitVec 32) (_ BitVec 64))) (size!50263 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103016)

(declare-fun zeroValue!436 () V!59029)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69162 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18059 0))(
  ( (ValueCellFull!18059 (v!21844 V!59029)) (EmptyCell!18059) )
))
(declare-datatypes ((array!103018 0))(
  ( (array!103019 (arr!49712 (Array (_ BitVec 32) ValueCell!18059)) (size!50264 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103018)

(declare-fun minValue!436 () V!59029)

(declare-fun getCurrentListMapNoExtraKeys!6556 (array!103016 array!103018 (_ BitVec 32) (_ BitVec 32) V!59029 V!59029 (_ BitVec 32) Int) ListLongMap!22163)

(assert (=> bm!69162 (= call!69169 (getCurrentListMapNoExtraKeys!6556 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69163 () Bool)

(declare-fun call!69168 () ListLongMap!22163)

(declare-fun call!69165 () ListLongMap!22163)

(assert (=> bm!69163 (= call!69168 call!69165)))

(declare-fun mapNonEmpty!58612 () Bool)

(declare-fun mapRes!58612 () Bool)

(declare-fun tp!111242 () Bool)

(declare-fun e!859975 () Bool)

(assert (=> mapNonEmpty!58612 (= mapRes!58612 (and tp!111242 e!859975))))

(declare-fun mapValue!58612 () ValueCell!18059)

(declare-fun mapKey!58612 () (_ BitVec 32))

(declare-fun mapRest!58612 () (Array (_ BitVec 32) ValueCell!18059))

(assert (=> mapNonEmpty!58612 (= (arr!49712 _values!470) (store mapRest!58612 mapKey!58612 mapValue!58612))))

(declare-fun b!1545040 () Bool)

(declare-fun res!1059640 () Bool)

(declare-fun e!859978 () Bool)

(assert (=> b!1545040 (=> (not res!1059640) (not e!859978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545040 (= res!1059640 (validKeyInArray!0 (select (arr!49711 _keys!618) from!762)))))

(declare-fun b!1545041 () Bool)

(declare-fun e!859980 () ListLongMap!22163)

(declare-fun +!4928 (ListLongMap!22163 tuple2!24554) ListLongMap!22163)

(assert (=> b!1545041 (= e!859980 (+!4928 call!69165 (tuple2!24555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545042 () Bool)

(declare-fun e!859981 () ListLongMap!22163)

(assert (=> b!1545042 (= e!859980 e!859981)))

(declare-fun c!141525 () Bool)

(declare-fun lt!666008 () Bool)

(assert (=> b!1545042 (= c!141525 (and (not lt!666008) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545043 () Bool)

(declare-fun res!1059642 () Bool)

(declare-fun e!859977 () Bool)

(assert (=> b!1545043 (=> (not res!1059642) (not e!859977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103016 (_ BitVec 32)) Bool)

(assert (=> b!1545043 (= res!1059642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545044 () Bool)

(declare-fun res!1059644 () Bool)

(assert (=> b!1545044 (=> (not res!1059644) (not e!859977))))

(assert (=> b!1545044 (= res!1059644 (and (= (size!50264 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50263 _keys!618) (size!50264 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58612 () Bool)

(assert (=> mapIsEmpty!58612 mapRes!58612))

(declare-fun res!1059639 () Bool)

(assert (=> start!131900 (=> (not res!1059639) (not e!859977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131900 (= res!1059639 (validMask!0 mask!926))))

(assert (=> start!131900 e!859977))

(declare-fun array_inv!38863 (array!103016) Bool)

(assert (=> start!131900 (array_inv!38863 _keys!618)))

(declare-fun tp_is_empty!37939 () Bool)

(assert (=> start!131900 tp_is_empty!37939))

(assert (=> start!131900 true))

(assert (=> start!131900 tp!111241))

(declare-fun e!859979 () Bool)

(declare-fun array_inv!38864 (array!103018) Bool)

(assert (=> start!131900 (and (array_inv!38864 _values!470) e!859979)))

(declare-fun b!1545045 () Bool)

(declare-fun e!859976 () ListLongMap!22163)

(declare-fun call!69166 () ListLongMap!22163)

(assert (=> b!1545045 (= e!859976 call!69166)))

(declare-fun bm!69164 () Bool)

(declare-fun call!69167 () ListLongMap!22163)

(assert (=> bm!69164 (= call!69166 call!69167)))

(declare-fun bm!69165 () Bool)

(assert (=> bm!69165 (= call!69167 call!69169)))

(declare-fun bm!69166 () Bool)

(declare-fun c!141524 () Bool)

(assert (=> bm!69166 (= call!69165 (+!4928 (ite c!141524 call!69169 (ite c!141525 call!69167 call!69166)) (ite (or c!141524 c!141525) (tuple2!24555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545046 () Bool)

(declare-fun e!859983 () Bool)

(assert (=> b!1545046 (= e!859979 (and e!859983 mapRes!58612))))

(declare-fun condMapEmpty!58612 () Bool)

(declare-fun mapDefault!58612 () ValueCell!18059)

(assert (=> b!1545046 (= condMapEmpty!58612 (= (arr!49712 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18059)) mapDefault!58612)))))

(declare-fun b!1545047 () Bool)

(declare-fun c!141523 () Bool)

(assert (=> b!1545047 (= c!141523 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666008))))

(assert (=> b!1545047 (= e!859981 e!859976)))

(declare-fun b!1545048 () Bool)

(assert (=> b!1545048 (= e!859978 (not true))))

(declare-fun lt!666007 () ListLongMap!22163)

(declare-fun contains!9990 (ListLongMap!22163 (_ BitVec 64)) Bool)

(assert (=> b!1545048 (contains!9990 (+!4928 lt!666007 (tuple2!24555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49711 _keys!618) from!762))))

(declare-datatypes ((Unit!51327 0))(
  ( (Unit!51328) )
))
(declare-fun lt!666010 () Unit!51327)

(declare-fun addStillContains!1213 (ListLongMap!22163 (_ BitVec 64) V!59029 (_ BitVec 64)) Unit!51327)

(assert (=> b!1545048 (= lt!666010 (addStillContains!1213 lt!666007 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49711 _keys!618) from!762)))))

(assert (=> b!1545048 (= lt!666007 (getCurrentListMapNoExtraKeys!6556 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545049 () Bool)

(assert (=> b!1545049 (= e!859977 e!859978)))

(declare-fun res!1059645 () Bool)

(assert (=> b!1545049 (=> (not res!1059645) (not e!859978))))

(assert (=> b!1545049 (= res!1059645 (bvslt from!762 (size!50263 _keys!618)))))

(declare-fun lt!666009 () ListLongMap!22163)

(assert (=> b!1545049 (= lt!666009 e!859980)))

(assert (=> b!1545049 (= c!141524 (and (not lt!666008) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545049 (= lt!666008 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545050 () Bool)

(assert (=> b!1545050 (= e!859975 tp_is_empty!37939)))

(declare-fun b!1545051 () Bool)

(declare-fun res!1059641 () Bool)

(assert (=> b!1545051 (=> (not res!1059641) (not e!859977))))

(declare-datatypes ((List!36036 0))(
  ( (Nil!36033) (Cons!36032 (h!37478 (_ BitVec 64)) (t!50722 List!36036)) )
))
(declare-fun arrayNoDuplicates!0 (array!103016 (_ BitVec 32) List!36036) Bool)

(assert (=> b!1545051 (= res!1059641 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36033))))

(declare-fun b!1545052 () Bool)

(declare-fun res!1059643 () Bool)

(assert (=> b!1545052 (=> (not res!1059643) (not e!859977))))

(assert (=> b!1545052 (= res!1059643 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50263 _keys!618))))))

(declare-fun b!1545053 () Bool)

(assert (=> b!1545053 (= e!859981 call!69168)))

(declare-fun b!1545054 () Bool)

(assert (=> b!1545054 (= e!859976 call!69168)))

(declare-fun b!1545055 () Bool)

(assert (=> b!1545055 (= e!859983 tp_is_empty!37939)))

(assert (= (and start!131900 res!1059639) b!1545044))

(assert (= (and b!1545044 res!1059644) b!1545043))

(assert (= (and b!1545043 res!1059642) b!1545051))

(assert (= (and b!1545051 res!1059641) b!1545052))

(assert (= (and b!1545052 res!1059643) b!1545049))

(assert (= (and b!1545049 c!141524) b!1545041))

(assert (= (and b!1545049 (not c!141524)) b!1545042))

(assert (= (and b!1545042 c!141525) b!1545053))

(assert (= (and b!1545042 (not c!141525)) b!1545047))

(assert (= (and b!1545047 c!141523) b!1545054))

(assert (= (and b!1545047 (not c!141523)) b!1545045))

(assert (= (or b!1545054 b!1545045) bm!69164))

(assert (= (or b!1545053 bm!69164) bm!69165))

(assert (= (or b!1545053 b!1545054) bm!69163))

(assert (= (or b!1545041 bm!69165) bm!69162))

(assert (= (or b!1545041 bm!69163) bm!69166))

(assert (= (and b!1545049 res!1059645) b!1545040))

(assert (= (and b!1545040 res!1059640) b!1545048))

(assert (= (and b!1545046 condMapEmpty!58612) mapIsEmpty!58612))

(assert (= (and b!1545046 (not condMapEmpty!58612)) mapNonEmpty!58612))

(get-info :version)

(assert (= (and mapNonEmpty!58612 ((_ is ValueCellFull!18059) mapValue!58612)) b!1545050))

(assert (= (and b!1545046 ((_ is ValueCellFull!18059) mapDefault!58612)) b!1545055))

(assert (= start!131900 b!1545046))

(declare-fun m!1424811 () Bool)

(assert (=> b!1545048 m!1424811))

(declare-fun m!1424813 () Bool)

(assert (=> b!1545048 m!1424813))

(declare-fun m!1424815 () Bool)

(assert (=> b!1545048 m!1424815))

(assert (=> b!1545048 m!1424815))

(assert (=> b!1545048 m!1424813))

(declare-fun m!1424817 () Bool)

(assert (=> b!1545048 m!1424817))

(assert (=> b!1545048 m!1424813))

(declare-fun m!1424819 () Bool)

(assert (=> b!1545048 m!1424819))

(assert (=> b!1545040 m!1424813))

(assert (=> b!1545040 m!1424813))

(declare-fun m!1424821 () Bool)

(assert (=> b!1545040 m!1424821))

(declare-fun m!1424823 () Bool)

(assert (=> start!131900 m!1424823))

(declare-fun m!1424825 () Bool)

(assert (=> start!131900 m!1424825))

(declare-fun m!1424827 () Bool)

(assert (=> start!131900 m!1424827))

(assert (=> bm!69162 m!1424811))

(declare-fun m!1424829 () Bool)

(assert (=> b!1545043 m!1424829))

(declare-fun m!1424831 () Bool)

(assert (=> b!1545051 m!1424831))

(declare-fun m!1424833 () Bool)

(assert (=> b!1545041 m!1424833))

(declare-fun m!1424835 () Bool)

(assert (=> mapNonEmpty!58612 m!1424835))

(declare-fun m!1424837 () Bool)

(assert (=> bm!69166 m!1424837))

(check-sat (not b_next!31663) tp_is_empty!37939 (not b!1545051) (not bm!69162) b_and!51055 (not b!1545043) (not b!1545041) (not b!1545048) (not b!1545040) (not bm!69166) (not mapNonEmpty!58612) (not start!131900))
(check-sat b_and!51055 (not b_next!31663))
