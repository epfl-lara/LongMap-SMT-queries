; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131970 () Bool)

(assert start!131970)

(declare-fun b_free!31683 () Bool)

(declare-fun b_next!31683 () Bool)

(assert (=> start!131970 (= b_free!31683 (not b_next!31683))))

(declare-fun tp!111300 () Bool)

(declare-fun b_and!51093 () Bool)

(assert (=> start!131970 (= tp!111300 b_and!51093)))

(declare-fun b!1545833 () Bool)

(declare-fun e!860443 () Bool)

(declare-fun e!860446 () Bool)

(declare-fun mapRes!58642 () Bool)

(assert (=> b!1545833 (= e!860443 (and e!860446 mapRes!58642))))

(declare-fun condMapEmpty!58642 () Bool)

(declare-datatypes ((V!59055 0))(
  ( (V!59056 (val!19057 Int)) )
))
(declare-datatypes ((ValueCell!18069 0))(
  ( (ValueCellFull!18069 (v!21858 V!59055)) (EmptyCell!18069) )
))
(declare-datatypes ((array!103124 0))(
  ( (array!103125 (arr!49764 (Array (_ BitVec 32) ValueCell!18069)) (size!50314 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103124)

(declare-fun mapDefault!58642 () ValueCell!18069)

(assert (=> b!1545833 (= condMapEmpty!58642 (= (arr!49764 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18069)) mapDefault!58642)))))

(declare-fun bm!69347 () Bool)

(declare-datatypes ((tuple2!24496 0))(
  ( (tuple2!24497 (_1!12259 (_ BitVec 64)) (_2!12259 V!59055)) )
))
(declare-datatypes ((List!36005 0))(
  ( (Nil!36002) (Cons!36001 (h!37446 tuple2!24496) (t!50699 List!36005)) )
))
(declare-datatypes ((ListLongMap!22105 0))(
  ( (ListLongMap!22106 (toList!11068 List!36005)) )
))
(declare-fun call!69351 () ListLongMap!22105)

(declare-fun call!69350 () ListLongMap!22105)

(assert (=> bm!69347 (= call!69351 call!69350)))

(declare-fun b!1545834 () Bool)

(declare-fun e!860450 () Bool)

(declare-fun tp_is_empty!37959 () Bool)

(assert (=> b!1545834 (= e!860450 tp_is_empty!37959)))

(declare-fun b!1545835 () Bool)

(declare-fun e!860444 () ListLongMap!22105)

(declare-fun e!860445 () ListLongMap!22105)

(assert (=> b!1545835 (= e!860444 e!860445)))

(declare-fun c!141702 () Bool)

(declare-fun lt!666416 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545835 (= c!141702 (and (not lt!666416) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545836 () Bool)

(declare-fun e!860449 () ListLongMap!22105)

(declare-fun call!69353 () ListLongMap!22105)

(assert (=> b!1545836 (= e!860449 call!69353)))

(declare-fun b!1545837 () Bool)

(declare-fun c!141703 () Bool)

(assert (=> b!1545837 (= c!141703 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666416))))

(assert (=> b!1545837 (= e!860445 e!860449)))

(declare-fun call!69352 () ListLongMap!22105)

(declare-fun call!69354 () ListLongMap!22105)

(declare-fun zeroValue!436 () V!59055)

(declare-fun bm!69348 () Bool)

(declare-fun minValue!436 () V!59055)

(declare-fun c!141704 () Bool)

(declare-fun +!4903 (ListLongMap!22105 tuple2!24496) ListLongMap!22105)

(assert (=> bm!69348 (= call!69350 (+!4903 (ite c!141704 call!69354 (ite c!141702 call!69352 call!69353)) (ite (or c!141704 c!141702) (tuple2!24497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24497 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545838 () Bool)

(declare-fun res!1059979 () Bool)

(declare-fun e!860451 () Bool)

(assert (=> b!1545838 (=> (not res!1059979) (not e!860451))))

(declare-datatypes ((array!103126 0))(
  ( (array!103127 (arr!49765 (Array (_ BitVec 32) (_ BitVec 64))) (size!50315 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103126)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103126 (_ BitVec 32)) Bool)

(assert (=> b!1545838 (= res!1059979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545839 () Bool)

(declare-fun res!1059981 () Bool)

(assert (=> b!1545839 (=> (not res!1059981) (not e!860451))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1545839 (= res!1059981 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50315 _keys!618))))))

(declare-fun b!1545840 () Bool)

(declare-fun e!860448 () Bool)

(assert (=> b!1545840 (= e!860451 e!860448)))

(declare-fun res!1059982 () Bool)

(assert (=> b!1545840 (=> (not res!1059982) (not e!860448))))

(assert (=> b!1545840 (= res!1059982 (bvslt from!762 (size!50315 _keys!618)))))

(declare-fun lt!666415 () ListLongMap!22105)

(assert (=> b!1545840 (= lt!666415 e!860444)))

(assert (=> b!1545840 (= c!141704 (and (not lt!666416) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545840 (= lt!666416 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545841 () Bool)

(assert (=> b!1545841 (= e!860444 (+!4903 call!69350 (tuple2!24497 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapNonEmpty!58642 () Bool)

(declare-fun tp!111301 () Bool)

(assert (=> mapNonEmpty!58642 (= mapRes!58642 (and tp!111301 e!860450))))

(declare-fun mapKey!58642 () (_ BitVec 32))

(declare-fun mapRest!58642 () (Array (_ BitVec 32) ValueCell!18069))

(declare-fun mapValue!58642 () ValueCell!18069)

(assert (=> mapNonEmpty!58642 (= (arr!49764 _values!470) (store mapRest!58642 mapKey!58642 mapValue!58642))))

(declare-fun b!1545842 () Bool)

(assert (=> b!1545842 (= e!860448 (not true))))

(declare-fun lt!666413 () ListLongMap!22105)

(declare-fun contains!10037 (ListLongMap!22105 (_ BitVec 64)) Bool)

(assert (=> b!1545842 (contains!10037 (+!4903 lt!666413 (tuple2!24497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49765 _keys!618) from!762))))

(declare-datatypes ((Unit!51510 0))(
  ( (Unit!51511) )
))
(declare-fun lt!666414 () Unit!51510)

(declare-fun addStillContains!1225 (ListLongMap!22105 (_ BitVec 64) V!59055 (_ BitVec 64)) Unit!51510)

(assert (=> b!1545842 (= lt!666414 (addStillContains!1225 lt!666413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49765 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6535 (array!103126 array!103124 (_ BitVec 32) (_ BitVec 32) V!59055 V!59055 (_ BitVec 32) Int) ListLongMap!22105)

(assert (=> b!1545842 (= lt!666413 (getCurrentListMapNoExtraKeys!6535 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69349 () Bool)

(assert (=> bm!69349 (= call!69353 call!69352)))

(declare-fun b!1545843 () Bool)

(assert (=> b!1545843 (= e!860446 tp_is_empty!37959)))

(declare-fun b!1545844 () Bool)

(declare-fun res!1059978 () Bool)

(assert (=> b!1545844 (=> (not res!1059978) (not e!860451))))

(assert (=> b!1545844 (= res!1059978 (and (= (size!50314 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50315 _keys!618) (size!50314 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58642 () Bool)

(assert (=> mapIsEmpty!58642 mapRes!58642))

(declare-fun b!1545845 () Bool)

(declare-fun res!1059983 () Bool)

(assert (=> b!1545845 (=> (not res!1059983) (not e!860451))))

(declare-datatypes ((List!36006 0))(
  ( (Nil!36003) (Cons!36002 (h!37447 (_ BitVec 64)) (t!50700 List!36006)) )
))
(declare-fun arrayNoDuplicates!0 (array!103126 (_ BitVec 32) List!36006) Bool)

(assert (=> b!1545845 (= res!1059983 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36003))))

(declare-fun bm!69350 () Bool)

(assert (=> bm!69350 (= call!69354 (getCurrentListMapNoExtraKeys!6535 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545846 () Bool)

(declare-fun res!1059984 () Bool)

(assert (=> b!1545846 (=> (not res!1059984) (not e!860448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545846 (= res!1059984 (validKeyInArray!0 (select (arr!49765 _keys!618) from!762)))))

(declare-fun bm!69351 () Bool)

(assert (=> bm!69351 (= call!69352 call!69354)))

(declare-fun b!1545848 () Bool)

(assert (=> b!1545848 (= e!860449 call!69351)))

(declare-fun b!1545847 () Bool)

(assert (=> b!1545847 (= e!860445 call!69351)))

(declare-fun res!1059980 () Bool)

(assert (=> start!131970 (=> (not res!1059980) (not e!860451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131970 (= res!1059980 (validMask!0 mask!926))))

(assert (=> start!131970 e!860451))

(declare-fun array_inv!38707 (array!103126) Bool)

(assert (=> start!131970 (array_inv!38707 _keys!618)))

(assert (=> start!131970 tp_is_empty!37959))

(assert (=> start!131970 true))

(assert (=> start!131970 tp!111300))

(declare-fun array_inv!38708 (array!103124) Bool)

(assert (=> start!131970 (and (array_inv!38708 _values!470) e!860443)))

(assert (= (and start!131970 res!1059980) b!1545844))

(assert (= (and b!1545844 res!1059978) b!1545838))

(assert (= (and b!1545838 res!1059979) b!1545845))

(assert (= (and b!1545845 res!1059983) b!1545839))

(assert (= (and b!1545839 res!1059981) b!1545840))

(assert (= (and b!1545840 c!141704) b!1545841))

(assert (= (and b!1545840 (not c!141704)) b!1545835))

(assert (= (and b!1545835 c!141702) b!1545847))

(assert (= (and b!1545835 (not c!141702)) b!1545837))

(assert (= (and b!1545837 c!141703) b!1545848))

(assert (= (and b!1545837 (not c!141703)) b!1545836))

(assert (= (or b!1545848 b!1545836) bm!69349))

(assert (= (or b!1545847 bm!69349) bm!69351))

(assert (= (or b!1545847 b!1545848) bm!69347))

(assert (= (or b!1545841 bm!69351) bm!69350))

(assert (= (or b!1545841 bm!69347) bm!69348))

(assert (= (and b!1545840 res!1059982) b!1545846))

(assert (= (and b!1545846 res!1059984) b!1545842))

(assert (= (and b!1545833 condMapEmpty!58642) mapIsEmpty!58642))

(assert (= (and b!1545833 (not condMapEmpty!58642)) mapNonEmpty!58642))

(get-info :version)

(assert (= (and mapNonEmpty!58642 ((_ is ValueCellFull!18069) mapValue!58642)) b!1545834))

(assert (= (and b!1545833 ((_ is ValueCellFull!18069) mapDefault!58642)) b!1545843))

(assert (= start!131970 b!1545833))

(declare-fun m!1425983 () Bool)

(assert (=> b!1545842 m!1425983))

(declare-fun m!1425985 () Bool)

(assert (=> b!1545842 m!1425985))

(declare-fun m!1425987 () Bool)

(assert (=> b!1545842 m!1425987))

(declare-fun m!1425989 () Bool)

(assert (=> b!1545842 m!1425989))

(assert (=> b!1545842 m!1425985))

(assert (=> b!1545842 m!1425983))

(assert (=> b!1545842 m!1425985))

(declare-fun m!1425991 () Bool)

(assert (=> b!1545842 m!1425991))

(declare-fun m!1425993 () Bool)

(assert (=> start!131970 m!1425993))

(declare-fun m!1425995 () Bool)

(assert (=> start!131970 m!1425995))

(declare-fun m!1425997 () Bool)

(assert (=> start!131970 m!1425997))

(declare-fun m!1425999 () Bool)

(assert (=> bm!69348 m!1425999))

(assert (=> bm!69350 m!1425989))

(declare-fun m!1426001 () Bool)

(assert (=> mapNonEmpty!58642 m!1426001))

(declare-fun m!1426003 () Bool)

(assert (=> b!1545838 m!1426003))

(declare-fun m!1426005 () Bool)

(assert (=> b!1545845 m!1426005))

(assert (=> b!1545846 m!1425985))

(assert (=> b!1545846 m!1425985))

(declare-fun m!1426007 () Bool)

(assert (=> b!1545846 m!1426007))

(declare-fun m!1426009 () Bool)

(assert (=> b!1545841 m!1426009))

(check-sat (not b!1545845) (not b!1545841) (not bm!69350) tp_is_empty!37959 (not start!131970) (not bm!69348) b_and!51093 (not b_next!31683) (not b!1545846) (not mapNonEmpty!58642) (not b!1545842) (not b!1545838))
(check-sat b_and!51093 (not b_next!31683))
