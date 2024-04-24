; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132446 () Bool)

(assert start!132446)

(declare-fun b_free!31747 () Bool)

(declare-fun b_next!31747 () Bool)

(assert (=> start!132446 (= b_free!31747 (not b_next!31747))))

(declare-fun tp!111493 () Bool)

(declare-fun b_and!51159 () Bool)

(assert (=> start!132446 (= tp!111493 b_and!51159)))

(declare-fun b!1549805 () Bool)

(declare-fun c!142792 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667765 () Bool)

(assert (=> b!1549805 (= c!142792 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667765))))

(declare-datatypes ((V!59141 0))(
  ( (V!59142 (val!19089 Int)) )
))
(declare-datatypes ((tuple2!24618 0))(
  ( (tuple2!24619 (_1!12320 (_ BitVec 64)) (_2!12320 V!59141)) )
))
(declare-datatypes ((List!36097 0))(
  ( (Nil!36094) (Cons!36093 (h!37556 tuple2!24618) (t!50783 List!36097)) )
))
(declare-datatypes ((ListLongMap!22235 0))(
  ( (ListLongMap!22236 (toList!11133 List!36097)) )
))
(declare-fun e!862816 () ListLongMap!22235)

(declare-fun e!862820 () ListLongMap!22235)

(assert (=> b!1549805 (= e!862816 e!862820)))

(declare-fun b!1549806 () Bool)

(declare-fun res!1061512 () Bool)

(declare-fun e!862824 () Bool)

(assert (=> b!1549806 (=> (not res!1061512) (not e!862824))))

(declare-datatypes ((array!103372 0))(
  ( (array!103373 (arr!49881 (Array (_ BitVec 32) (_ BitVec 64))) (size!50432 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103372)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18101 0))(
  ( (ValueCellFull!18101 (v!21882 V!59141)) (EmptyCell!18101) )
))
(declare-datatypes ((array!103374 0))(
  ( (array!103375 (arr!49882 (Array (_ BitVec 32) ValueCell!18101)) (size!50433 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103374)

(assert (=> b!1549806 (= res!1061512 (and (= (size!50433 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50432 _keys!618) (size!50433 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!436 () V!59141)

(declare-fun call!69980 () ListLongMap!22235)

(declare-fun minValue!436 () V!59141)

(declare-fun call!69983 () ListLongMap!22235)

(declare-fun call!69981 () ListLongMap!22235)

(declare-fun c!142791 () Bool)

(declare-fun call!69982 () ListLongMap!22235)

(declare-fun c!142790 () Bool)

(declare-fun bm!69977 () Bool)

(declare-fun +!4976 (ListLongMap!22235 tuple2!24618) ListLongMap!22235)

(assert (=> bm!69977 (= call!69981 (+!4976 (ite c!142791 call!69980 (ite c!142790 call!69983 call!69982)) (ite (or c!142791 c!142790) (tuple2!24619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549807 () Bool)

(declare-fun e!862818 () Bool)

(assert (=> b!1549807 (= e!862824 e!862818)))

(declare-fun res!1061510 () Bool)

(assert (=> b!1549807 (=> (not res!1061510) (not e!862818))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1549807 (= res!1061510 (bvslt from!762 (size!50432 _keys!618)))))

(declare-fun lt!667761 () ListLongMap!22235)

(declare-fun e!862821 () ListLongMap!22235)

(assert (=> b!1549807 (= lt!667761 e!862821)))

(assert (=> b!1549807 (= c!142791 (and (not lt!667765) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549807 (= lt!667765 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549808 () Bool)

(declare-fun e!862822 () Bool)

(declare-fun tp_is_empty!38023 () Bool)

(assert (=> b!1549808 (= e!862822 tp_is_empty!38023)))

(declare-fun b!1549809 () Bool)

(assert (=> b!1549809 (= e!862818 (not true))))

(declare-fun lt!667764 () ListLongMap!22235)

(declare-fun apply!1059 (ListLongMap!22235 (_ BitVec 64)) V!59141)

(assert (=> b!1549809 (= (apply!1059 (+!4976 lt!667764 (tuple2!24619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49881 _keys!618) from!762)) (apply!1059 lt!667764 (select (arr!49881 _keys!618) from!762)))))

(declare-datatypes ((Unit!51483 0))(
  ( (Unit!51484) )
))
(declare-fun lt!667763 () Unit!51483)

(declare-fun addApplyDifferent!588 (ListLongMap!22235 (_ BitVec 64) V!59141 (_ BitVec 64)) Unit!51483)

(assert (=> b!1549809 (= lt!667763 (addApplyDifferent!588 lt!667764 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49881 _keys!618) from!762)))))

(declare-fun contains!10107 (ListLongMap!22235 (_ BitVec 64)) Bool)

(assert (=> b!1549809 (contains!10107 (+!4976 lt!667764 (tuple2!24619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49881 _keys!618) from!762))))

(declare-fun lt!667762 () Unit!51483)

(declare-fun addStillContains!1249 (ListLongMap!22235 (_ BitVec 64) V!59141 (_ BitVec 64)) Unit!51483)

(assert (=> b!1549809 (= lt!667762 (addStillContains!1249 lt!667764 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49881 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6607 (array!103372 array!103374 (_ BitVec 32) (_ BitVec 32) V!59141 V!59141 (_ BitVec 32) Int) ListLongMap!22235)

(assert (=> b!1549809 (= lt!667764 (getCurrentListMapNoExtraKeys!6607 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549810 () Bool)

(assert (=> b!1549810 (= e!862821 e!862816)))

(assert (=> b!1549810 (= c!142790 (and (not lt!667765) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549811 () Bool)

(declare-fun e!862819 () Bool)

(assert (=> b!1549811 (= e!862819 tp_is_empty!38023)))

(declare-fun b!1549812 () Bool)

(declare-fun call!69984 () ListLongMap!22235)

(assert (=> b!1549812 (= e!862820 call!69984)))

(declare-fun b!1549813 () Bool)

(declare-fun e!862823 () Bool)

(declare-fun mapRes!58738 () Bool)

(assert (=> b!1549813 (= e!862823 (and e!862819 mapRes!58738))))

(declare-fun condMapEmpty!58738 () Bool)

(declare-fun mapDefault!58738 () ValueCell!18101)

(assert (=> b!1549813 (= condMapEmpty!58738 (= (arr!49882 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18101)) mapDefault!58738)))))

(declare-fun b!1549815 () Bool)

(declare-fun res!1061515 () Bool)

(assert (=> b!1549815 (=> (not res!1061515) (not e!862818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549815 (= res!1061515 (validKeyInArray!0 (select (arr!49881 _keys!618) from!762)))))

(declare-fun b!1549816 () Bool)

(declare-fun res!1061516 () Bool)

(assert (=> b!1549816 (=> (not res!1061516) (not e!862824))))

(declare-datatypes ((List!36098 0))(
  ( (Nil!36095) (Cons!36094 (h!37557 (_ BitVec 64)) (t!50784 List!36098)) )
))
(declare-fun arrayNoDuplicates!0 (array!103372 (_ BitVec 32) List!36098) Bool)

(assert (=> b!1549816 (= res!1061516 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36095))))

(declare-fun b!1549817 () Bool)

(declare-fun res!1061514 () Bool)

(assert (=> b!1549817 (=> (not res!1061514) (not e!862824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103372 (_ BitVec 32)) Bool)

(assert (=> b!1549817 (= res!1061514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549818 () Bool)

(declare-fun res!1061511 () Bool)

(assert (=> b!1549818 (=> (not res!1061511) (not e!862824))))

(assert (=> b!1549818 (= res!1061511 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50432 _keys!618))))))

(declare-fun bm!69978 () Bool)

(assert (=> bm!69978 (= call!69982 call!69983)))

(declare-fun bm!69979 () Bool)

(assert (=> bm!69979 (= call!69984 call!69981)))

(declare-fun b!1549819 () Bool)

(assert (=> b!1549819 (= e!862820 call!69982)))

(declare-fun bm!69980 () Bool)

(assert (=> bm!69980 (= call!69983 call!69980)))

(declare-fun b!1549820 () Bool)

(assert (=> b!1549820 (= e!862821 (+!4976 call!69981 (tuple2!24619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69981 () Bool)

(assert (=> bm!69981 (= call!69980 (getCurrentListMapNoExtraKeys!6607 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58738 () Bool)

(assert (=> mapIsEmpty!58738 mapRes!58738))

(declare-fun mapNonEmpty!58738 () Bool)

(declare-fun tp!111492 () Bool)

(assert (=> mapNonEmpty!58738 (= mapRes!58738 (and tp!111492 e!862822))))

(declare-fun mapRest!58738 () (Array (_ BitVec 32) ValueCell!18101))

(declare-fun mapKey!58738 () (_ BitVec 32))

(declare-fun mapValue!58738 () ValueCell!18101)

(assert (=> mapNonEmpty!58738 (= (arr!49882 _values!470) (store mapRest!58738 mapKey!58738 mapValue!58738))))

(declare-fun res!1061513 () Bool)

(assert (=> start!132446 (=> (not res!1061513) (not e!862824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132446 (= res!1061513 (validMask!0 mask!926))))

(assert (=> start!132446 e!862824))

(declare-fun array_inv!39053 (array!103372) Bool)

(assert (=> start!132446 (array_inv!39053 _keys!618)))

(assert (=> start!132446 tp_is_empty!38023))

(assert (=> start!132446 true))

(assert (=> start!132446 tp!111493))

(declare-fun array_inv!39054 (array!103374) Bool)

(assert (=> start!132446 (and (array_inv!39054 _values!470) e!862823)))

(declare-fun b!1549814 () Bool)

(assert (=> b!1549814 (= e!862816 call!69984)))

(assert (= (and start!132446 res!1061513) b!1549806))

(assert (= (and b!1549806 res!1061512) b!1549817))

(assert (= (and b!1549817 res!1061514) b!1549816))

(assert (= (and b!1549816 res!1061516) b!1549818))

(assert (= (and b!1549818 res!1061511) b!1549807))

(assert (= (and b!1549807 c!142791) b!1549820))

(assert (= (and b!1549807 (not c!142791)) b!1549810))

(assert (= (and b!1549810 c!142790) b!1549814))

(assert (= (and b!1549810 (not c!142790)) b!1549805))

(assert (= (and b!1549805 c!142792) b!1549812))

(assert (= (and b!1549805 (not c!142792)) b!1549819))

(assert (= (or b!1549812 b!1549819) bm!69978))

(assert (= (or b!1549814 bm!69978) bm!69980))

(assert (= (or b!1549814 b!1549812) bm!69979))

(assert (= (or b!1549820 bm!69980) bm!69981))

(assert (= (or b!1549820 bm!69979) bm!69977))

(assert (= (and b!1549807 res!1061510) b!1549815))

(assert (= (and b!1549815 res!1061515) b!1549809))

(assert (= (and b!1549813 condMapEmpty!58738) mapIsEmpty!58738))

(assert (= (and b!1549813 (not condMapEmpty!58738)) mapNonEmpty!58738))

(get-info :version)

(assert (= (and mapNonEmpty!58738 ((_ is ValueCellFull!18101) mapValue!58738)) b!1549808))

(assert (= (and b!1549813 ((_ is ValueCellFull!18101) mapDefault!58738)) b!1549811))

(assert (= start!132446 b!1549813))

(declare-fun m!1429263 () Bool)

(assert (=> b!1549817 m!1429263))

(declare-fun m!1429265 () Bool)

(assert (=> bm!69981 m!1429265))

(assert (=> b!1549809 m!1429265))

(declare-fun m!1429267 () Bool)

(assert (=> b!1549809 m!1429267))

(assert (=> b!1549809 m!1429267))

(declare-fun m!1429269 () Bool)

(assert (=> b!1549809 m!1429269))

(assert (=> b!1549809 m!1429267))

(declare-fun m!1429271 () Bool)

(assert (=> b!1549809 m!1429271))

(declare-fun m!1429273 () Bool)

(assert (=> b!1549809 m!1429273))

(assert (=> b!1549809 m!1429267))

(declare-fun m!1429275 () Bool)

(assert (=> b!1549809 m!1429275))

(assert (=> b!1549809 m!1429267))

(declare-fun m!1429277 () Bool)

(assert (=> b!1549809 m!1429277))

(declare-fun m!1429279 () Bool)

(assert (=> b!1549809 m!1429279))

(assert (=> b!1549809 m!1429279))

(assert (=> b!1549809 m!1429267))

(declare-fun m!1429281 () Bool)

(assert (=> b!1549809 m!1429281))

(assert (=> b!1549809 m!1429273))

(declare-fun m!1429283 () Bool)

(assert (=> mapNonEmpty!58738 m!1429283))

(declare-fun m!1429285 () Bool)

(assert (=> b!1549820 m!1429285))

(declare-fun m!1429287 () Bool)

(assert (=> start!132446 m!1429287))

(declare-fun m!1429289 () Bool)

(assert (=> start!132446 m!1429289))

(declare-fun m!1429291 () Bool)

(assert (=> start!132446 m!1429291))

(assert (=> b!1549815 m!1429267))

(assert (=> b!1549815 m!1429267))

(declare-fun m!1429293 () Bool)

(assert (=> b!1549815 m!1429293))

(declare-fun m!1429295 () Bool)

(assert (=> b!1549816 m!1429295))

(declare-fun m!1429297 () Bool)

(assert (=> bm!69977 m!1429297))

(check-sat b_and!51159 tp_is_empty!38023 (not start!132446) (not b!1549817) (not mapNonEmpty!58738) (not b!1549820) (not bm!69981) (not b!1549815) (not b!1549809) (not bm!69977) (not b!1549816) (not b_next!31747))
(check-sat b_and!51159 (not b_next!31747))
