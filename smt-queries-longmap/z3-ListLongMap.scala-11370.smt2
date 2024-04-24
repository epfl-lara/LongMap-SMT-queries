; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132536 () Bool)

(assert start!132536)

(declare-fun b_free!31837 () Bool)

(declare-fun b_next!31837 () Bool)

(assert (=> start!132536 (= b_free!31837 (not b_next!31837))))

(declare-fun tp!111762 () Bool)

(declare-fun b_and!51249 () Bool)

(assert (=> start!132536 (= tp!111762 b_and!51249)))

(declare-fun b!1551969 () Bool)

(declare-fun res!1062457 () Bool)

(declare-fun e!864036 () Bool)

(assert (=> b!1551969 (=> (not res!1062457) (not e!864036))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103550 0))(
  ( (array!103551 (arr!49970 (Array (_ BitVec 32) (_ BitVec 64))) (size!50521 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103550)

(assert (=> b!1551969 (= res!1062457 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50521 _keys!618))))))

(declare-fun b!1551970 () Bool)

(declare-datatypes ((Unit!51547 0))(
  ( (Unit!51548) )
))
(declare-fun e!864040 () Unit!51547)

(declare-fun Unit!51549 () Unit!51547)

(assert (=> b!1551970 (= e!864040 Unit!51549)))

(declare-fun b!1551971 () Bool)

(declare-datatypes ((V!59261 0))(
  ( (V!59262 (val!19134 Int)) )
))
(declare-datatypes ((tuple2!24706 0))(
  ( (tuple2!24707 (_1!12364 (_ BitVec 64)) (_2!12364 V!59261)) )
))
(declare-datatypes ((List!36169 0))(
  ( (Nil!36166) (Cons!36165 (h!37628 tuple2!24706) (t!50855 List!36169)) )
))
(declare-datatypes ((ListLongMap!22323 0))(
  ( (ListLongMap!22324 (toList!11177 List!36169)) )
))
(declare-fun e!864037 () ListLongMap!22323)

(declare-fun call!70658 () ListLongMap!22323)

(declare-fun minValue!436 () V!59261)

(declare-fun +!5013 (ListLongMap!22323 tuple2!24706) ListLongMap!22323)

(assert (=> b!1551971 (= e!864037 (+!5013 call!70658 (tuple2!24707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551972 () Bool)

(declare-fun c!143198 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!668838 () Bool)

(assert (=> b!1551972 (= c!143198 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668838))))

(declare-fun e!864035 () ListLongMap!22323)

(declare-fun e!864044 () ListLongMap!22323)

(assert (=> b!1551972 (= e!864035 e!864044)))

(declare-fun b!1551973 () Bool)

(declare-fun e!864039 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551973 (= e!864039 (not (validKeyInArray!0 (select (arr!49970 _keys!618) from!762))))))

(declare-fun mapIsEmpty!58873 () Bool)

(declare-fun mapRes!58873 () Bool)

(assert (=> mapIsEmpty!58873 mapRes!58873))

(declare-fun bm!70652 () Bool)

(declare-fun call!70656 () ListLongMap!22323)

(declare-fun call!70657 () ListLongMap!22323)

(assert (=> bm!70652 (= call!70656 call!70657)))

(declare-fun zeroValue!436 () V!59261)

(declare-fun c!143199 () Bool)

(declare-fun bm!70653 () Bool)

(declare-fun call!70659 () ListLongMap!22323)

(declare-fun c!143200 () Bool)

(assert (=> bm!70653 (= call!70658 (+!5013 (ite c!143200 call!70659 (ite c!143199 call!70657 call!70656)) (ite (or c!143200 c!143199) (tuple2!24707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551974 () Bool)

(declare-fun e!864043 () Bool)

(declare-fun tp_is_empty!38113 () Bool)

(assert (=> b!1551974 (= e!864043 tp_is_empty!38113)))

(declare-fun b!1551975 () Bool)

(assert (=> b!1551975 (= e!864037 e!864035)))

(assert (=> b!1551975 (= c!143199 (and (not lt!668838) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58873 () Bool)

(declare-fun tp!111763 () Bool)

(assert (=> mapNonEmpty!58873 (= mapRes!58873 (and tp!111763 e!864043))))

(declare-datatypes ((ValueCell!18146 0))(
  ( (ValueCellFull!18146 (v!21927 V!59261)) (EmptyCell!18146) )
))
(declare-fun mapValue!58873 () ValueCell!18146)

(declare-datatypes ((array!103552 0))(
  ( (array!103553 (arr!49971 (Array (_ BitVec 32) ValueCell!18146)) (size!50522 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103552)

(declare-fun mapKey!58873 () (_ BitVec 32))

(declare-fun mapRest!58873 () (Array (_ BitVec 32) ValueCell!18146))

(assert (=> mapNonEmpty!58873 (= (arr!49971 _values!470) (store mapRest!58873 mapKey!58873 mapValue!58873))))

(declare-fun b!1551977 () Bool)

(declare-fun e!864041 () Bool)

(assert (=> b!1551977 (= e!864036 e!864041)))

(declare-fun res!1062460 () Bool)

(assert (=> b!1551977 (=> (not res!1062460) (not e!864041))))

(declare-fun lt!668830 () Bool)

(assert (=> b!1551977 (= res!1062460 (not lt!668830))))

(declare-fun lt!668839 () Unit!51547)

(assert (=> b!1551977 (= lt!668839 e!864040)))

(declare-fun c!143197 () Bool)

(assert (=> b!1551977 (= c!143197 (not lt!668830))))

(assert (=> b!1551977 (= lt!668830 e!864039)))

(declare-fun res!1062456 () Bool)

(assert (=> b!1551977 (=> res!1062456 e!864039)))

(assert (=> b!1551977 (= res!1062456 (bvsge from!762 (size!50521 _keys!618)))))

(declare-fun lt!668834 () ListLongMap!22323)

(assert (=> b!1551977 (= lt!668834 e!864037)))

(assert (=> b!1551977 (= c!143200 (and (not lt!668838) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551977 (= lt!668838 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551978 () Bool)

(declare-fun e!864038 () Bool)

(declare-fun e!864042 () Bool)

(assert (=> b!1551978 (= e!864038 (and e!864042 mapRes!58873))))

(declare-fun condMapEmpty!58873 () Bool)

(declare-fun mapDefault!58873 () ValueCell!18146)

(assert (=> b!1551978 (= condMapEmpty!58873 (= (arr!49971 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18146)) mapDefault!58873)))))

(declare-fun b!1551979 () Bool)

(declare-fun call!70655 () ListLongMap!22323)

(assert (=> b!1551979 (= e!864044 call!70655)))

(declare-fun b!1551980 () Bool)

(assert (=> b!1551980 (= e!864041 false)))

(declare-fun lt!668837 () Bool)

(declare-fun contains!10139 (ListLongMap!22323 (_ BitVec 64)) Bool)

(assert (=> b!1551980 (= lt!668837 (contains!10139 lt!668834 (select (arr!49970 _keys!618) from!762)))))

(declare-fun b!1551981 () Bool)

(assert (=> b!1551981 (= e!864042 tp_is_empty!38113)))

(declare-fun bm!70654 () Bool)

(assert (=> bm!70654 (= call!70655 call!70658)))

(declare-fun b!1551982 () Bool)

(declare-fun res!1062461 () Bool)

(assert (=> b!1551982 (=> (not res!1062461) (not e!864036))))

(declare-datatypes ((List!36170 0))(
  ( (Nil!36167) (Cons!36166 (h!37629 (_ BitVec 64)) (t!50856 List!36170)) )
))
(declare-fun arrayNoDuplicates!0 (array!103550 (_ BitVec 32) List!36170) Bool)

(assert (=> b!1551982 (= res!1062461 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36167))))

(declare-fun bm!70655 () Bool)

(assert (=> bm!70655 (= call!70657 call!70659)))

(declare-fun b!1551983 () Bool)

(declare-fun lt!668829 () Unit!51547)

(assert (=> b!1551983 (= e!864040 lt!668829)))

(declare-fun lt!668833 () ListLongMap!22323)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6645 (array!103550 array!103552 (_ BitVec 32) (_ BitVec 32) V!59261 V!59261 (_ BitVec 32) Int) ListLongMap!22323)

(assert (=> b!1551983 (= lt!668833 (getCurrentListMapNoExtraKeys!6645 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668832 () Unit!51547)

(declare-fun addStillContains!1281 (ListLongMap!22323 (_ BitVec 64) V!59261 (_ BitVec 64)) Unit!51547)

(assert (=> b!1551983 (= lt!668832 (addStillContains!1281 lt!668833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!668828 () ListLongMap!22323)

(assert (=> b!1551983 (= lt!668828 (+!5013 lt!668833 (tuple2!24707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1551983 (contains!10139 lt!668828 (select (arr!49970 _keys!618) from!762))))

(declare-fun addApplyDifferent!620 (ListLongMap!22323 (_ BitVec 64) V!59261 (_ BitVec 64)) Unit!51547)

(assert (=> b!1551983 (= lt!668829 (addApplyDifferent!620 lt!668833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!668836 () V!59261)

(declare-fun apply!1091 (ListLongMap!22323 (_ BitVec 64)) V!59261)

(assert (=> b!1551983 (= lt!668836 (apply!1091 (+!5013 lt!668833 (tuple2!24707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49970 _keys!618) from!762)))))

(declare-fun lt!668831 () V!59261)

(assert (=> b!1551983 (= lt!668831 (apply!1091 lt!668833 (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1551983 (= lt!668836 lt!668831)))

(declare-fun lt!668835 () Unit!51547)

(assert (=> b!1551983 (= lt!668835 (addApplyDifferent!620 lt!668833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49970 _keys!618) from!762)))))

(assert (=> b!1551983 (= (apply!1091 lt!668828 (select (arr!49970 _keys!618) from!762)) lt!668831)))

(declare-fun b!1551984 () Bool)

(assert (=> b!1551984 (= e!864044 call!70656)))

(declare-fun bm!70656 () Bool)

(assert (=> bm!70656 (= call!70659 (getCurrentListMapNoExtraKeys!6645 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551985 () Bool)

(declare-fun res!1062458 () Bool)

(assert (=> b!1551985 (=> (not res!1062458) (not e!864036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103550 (_ BitVec 32)) Bool)

(assert (=> b!1551985 (= res!1062458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551986 () Bool)

(assert (=> b!1551986 (= e!864035 call!70655)))

(declare-fun b!1551976 () Bool)

(declare-fun res!1062455 () Bool)

(assert (=> b!1551976 (=> (not res!1062455) (not e!864036))))

(assert (=> b!1551976 (= res!1062455 (and (= (size!50522 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50521 _keys!618) (size!50522 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1062459 () Bool)

(assert (=> start!132536 (=> (not res!1062459) (not e!864036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132536 (= res!1062459 (validMask!0 mask!926))))

(assert (=> start!132536 e!864036))

(declare-fun array_inv!39115 (array!103550) Bool)

(assert (=> start!132536 (array_inv!39115 _keys!618)))

(assert (=> start!132536 tp_is_empty!38113))

(assert (=> start!132536 true))

(assert (=> start!132536 tp!111762))

(declare-fun array_inv!39116 (array!103552) Bool)

(assert (=> start!132536 (and (array_inv!39116 _values!470) e!864038)))

(assert (= (and start!132536 res!1062459) b!1551976))

(assert (= (and b!1551976 res!1062455) b!1551985))

(assert (= (and b!1551985 res!1062458) b!1551982))

(assert (= (and b!1551982 res!1062461) b!1551969))

(assert (= (and b!1551969 res!1062457) b!1551977))

(assert (= (and b!1551977 c!143200) b!1551971))

(assert (= (and b!1551977 (not c!143200)) b!1551975))

(assert (= (and b!1551975 c!143199) b!1551986))

(assert (= (and b!1551975 (not c!143199)) b!1551972))

(assert (= (and b!1551972 c!143198) b!1551979))

(assert (= (and b!1551972 (not c!143198)) b!1551984))

(assert (= (or b!1551979 b!1551984) bm!70652))

(assert (= (or b!1551986 bm!70652) bm!70655))

(assert (= (or b!1551986 b!1551979) bm!70654))

(assert (= (or b!1551971 bm!70655) bm!70656))

(assert (= (or b!1551971 bm!70654) bm!70653))

(assert (= (and b!1551977 (not res!1062456)) b!1551973))

(assert (= (and b!1551977 c!143197) b!1551983))

(assert (= (and b!1551977 (not c!143197)) b!1551970))

(assert (= (and b!1551977 res!1062460) b!1551980))

(assert (= (and b!1551978 condMapEmpty!58873) mapIsEmpty!58873))

(assert (= (and b!1551978 (not condMapEmpty!58873)) mapNonEmpty!58873))

(get-info :version)

(assert (= (and mapNonEmpty!58873 ((_ is ValueCellFull!18146) mapValue!58873)) b!1551974))

(assert (= (and b!1551978 ((_ is ValueCellFull!18146) mapDefault!58873)) b!1551981))

(assert (= start!132536 b!1551978))

(declare-fun m!1431015 () Bool)

(assert (=> b!1551971 m!1431015))

(declare-fun m!1431017 () Bool)

(assert (=> bm!70653 m!1431017))

(declare-fun m!1431019 () Bool)

(assert (=> start!132536 m!1431019))

(declare-fun m!1431021 () Bool)

(assert (=> start!132536 m!1431021))

(declare-fun m!1431023 () Bool)

(assert (=> start!132536 m!1431023))

(declare-fun m!1431025 () Bool)

(assert (=> mapNonEmpty!58873 m!1431025))

(declare-fun m!1431027 () Bool)

(assert (=> b!1551973 m!1431027))

(assert (=> b!1551973 m!1431027))

(declare-fun m!1431029 () Bool)

(assert (=> b!1551973 m!1431029))

(declare-fun m!1431031 () Bool)

(assert (=> b!1551985 m!1431031))

(declare-fun m!1431033 () Bool)

(assert (=> b!1551982 m!1431033))

(declare-fun m!1431035 () Bool)

(assert (=> bm!70656 m!1431035))

(assert (=> b!1551980 m!1431027))

(assert (=> b!1551980 m!1431027))

(declare-fun m!1431037 () Bool)

(assert (=> b!1551980 m!1431037))

(assert (=> b!1551983 m!1431027))

(declare-fun m!1431039 () Bool)

(assert (=> b!1551983 m!1431039))

(assert (=> b!1551983 m!1431027))

(declare-fun m!1431041 () Bool)

(assert (=> b!1551983 m!1431041))

(assert (=> b!1551983 m!1431035))

(assert (=> b!1551983 m!1431027))

(assert (=> b!1551983 m!1431027))

(declare-fun m!1431043 () Bool)

(assert (=> b!1551983 m!1431043))

(declare-fun m!1431045 () Bool)

(assert (=> b!1551983 m!1431045))

(declare-fun m!1431047 () Bool)

(assert (=> b!1551983 m!1431047))

(assert (=> b!1551983 m!1431027))

(declare-fun m!1431049 () Bool)

(assert (=> b!1551983 m!1431049))

(assert (=> b!1551983 m!1431027))

(declare-fun m!1431051 () Bool)

(assert (=> b!1551983 m!1431051))

(assert (=> b!1551983 m!1431027))

(declare-fun m!1431053 () Bool)

(assert (=> b!1551983 m!1431053))

(assert (=> b!1551983 m!1431027))

(declare-fun m!1431055 () Bool)

(assert (=> b!1551983 m!1431055))

(assert (=> b!1551983 m!1431047))

(check-sat (not b!1551980) b_and!51249 (not start!132536) (not b!1551973) (not bm!70656) (not b!1551983) (not b_next!31837) (not b!1551971) (not bm!70653) (not b!1551982) tp_is_empty!38113 (not mapNonEmpty!58873) (not b!1551985))
(check-sat b_and!51249 (not b_next!31837))
