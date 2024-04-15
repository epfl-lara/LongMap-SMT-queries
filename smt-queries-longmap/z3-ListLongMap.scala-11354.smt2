; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131978 () Bool)

(assert start!131978)

(declare-fun b_free!31741 () Bool)

(declare-fun b_next!31741 () Bool)

(assert (=> start!131978 (= b_free!31741 (not b_next!31741))))

(declare-fun tp!111475 () Bool)

(declare-fun b_and!51133 () Bool)

(assert (=> start!131978 (= tp!111475 b_and!51133)))

(declare-fun b!1546912 () Bool)

(declare-fun e!861029 () Bool)

(declare-fun e!861032 () Bool)

(assert (=> b!1546912 (= e!861029 e!861032)))

(declare-fun res!1060459 () Bool)

(assert (=> b!1546912 (=> (not res!1060459) (not e!861032))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103164 0))(
  ( (array!103165 (arr!49785 (Array (_ BitVec 32) (_ BitVec 64))) (size!50337 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103164)

(assert (=> b!1546912 (= res!1060459 (bvslt from!762 (size!50337 _keys!618)))))

(declare-datatypes ((V!59133 0))(
  ( (V!59134 (val!19086 Int)) )
))
(declare-datatypes ((tuple2!24628 0))(
  ( (tuple2!24629 (_1!12325 (_ BitVec 64)) (_2!12325 V!59133)) )
))
(declare-datatypes ((List!36098 0))(
  ( (Nil!36095) (Cons!36094 (h!37540 tuple2!24628) (t!50784 List!36098)) )
))
(declare-datatypes ((ListLongMap!22237 0))(
  ( (ListLongMap!22238 (toList!11134 List!36098)) )
))
(declare-fun lt!666526 () ListLongMap!22237)

(declare-fun e!861036 () ListLongMap!22237)

(assert (=> b!1546912 (= lt!666526 e!861036)))

(declare-fun c!141876 () Bool)

(declare-fun lt!666522 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546912 (= c!141876 (and (not lt!666522) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546912 (= lt!666522 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!436 () V!59133)

(declare-fun call!69754 () ListLongMap!22237)

(declare-fun call!69750 () ListLongMap!22237)

(declare-fun minValue!436 () V!59133)

(declare-fun call!69751 () ListLongMap!22237)

(declare-fun bm!69747 () Bool)

(declare-fun call!69752 () ListLongMap!22237)

(declare-fun c!141875 () Bool)

(declare-fun +!4960 (ListLongMap!22237 tuple2!24628) ListLongMap!22237)

(assert (=> bm!69747 (= call!69750 (+!4960 (ite c!141876 call!69754 (ite c!141875 call!69751 call!69752)) (ite (or c!141876 c!141875) (tuple2!24629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69748 () Bool)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18098 0))(
  ( (ValueCellFull!18098 (v!21883 V!59133)) (EmptyCell!18098) )
))
(declare-datatypes ((array!103166 0))(
  ( (array!103167 (arr!49786 (Array (_ BitVec 32) ValueCell!18098)) (size!50338 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103166)

(declare-fun getCurrentListMapNoExtraKeys!6588 (array!103164 array!103166 (_ BitVec 32) (_ BitVec 32) V!59133 V!59133 (_ BitVec 32) Int) ListLongMap!22237)

(assert (=> bm!69748 (= call!69754 (getCurrentListMapNoExtraKeys!6588 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69749 () Bool)

(assert (=> bm!69749 (= call!69752 call!69751)))

(declare-fun b!1546913 () Bool)

(declare-fun e!861028 () Bool)

(declare-fun tp_is_empty!38017 () Bool)

(assert (=> b!1546913 (= e!861028 tp_is_empty!38017)))

(declare-fun b!1546914 () Bool)

(declare-fun e!861033 () ListLongMap!22237)

(declare-fun call!69753 () ListLongMap!22237)

(assert (=> b!1546914 (= e!861033 call!69753)))

(declare-fun b!1546916 () Bool)

(assert (=> b!1546916 (= e!861036 e!861033)))

(assert (=> b!1546916 (= c!141875 (and (not lt!666522) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546917 () Bool)

(declare-fun res!1060461 () Bool)

(assert (=> b!1546917 (=> (not res!1060461) (not e!861029))))

(assert (=> b!1546917 (= res!1060461 (and (= (size!50338 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50337 _keys!618) (size!50338 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546918 () Bool)

(declare-fun c!141874 () Bool)

(assert (=> b!1546918 (= c!141874 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666522))))

(declare-fun e!861030 () ListLongMap!22237)

(assert (=> b!1546918 (= e!861033 e!861030)))

(declare-fun b!1546919 () Bool)

(declare-fun e!861035 () Bool)

(assert (=> b!1546919 (= e!861035 tp_is_empty!38017)))

(declare-fun b!1546920 () Bool)

(assert (=> b!1546920 (= e!861036 (+!4960 call!69750 (tuple2!24629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69750 () Bool)

(assert (=> bm!69750 (= call!69751 call!69754)))

(declare-fun b!1546921 () Bool)

(assert (=> b!1546921 (= e!861030 call!69753)))

(declare-fun b!1546922 () Bool)

(declare-fun res!1060460 () Bool)

(assert (=> b!1546922 (=> (not res!1060460) (not e!861029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103164 (_ BitVec 32)) Bool)

(assert (=> b!1546922 (= res!1060460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546923 () Bool)

(declare-fun res!1060463 () Bool)

(assert (=> b!1546923 (=> (not res!1060463) (not e!861029))))

(assert (=> b!1546923 (= res!1060463 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50337 _keys!618))))))

(declare-fun res!1060458 () Bool)

(assert (=> start!131978 (=> (not res!1060458) (not e!861029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131978 (= res!1060458 (validMask!0 mask!926))))

(assert (=> start!131978 e!861029))

(declare-fun array_inv!38919 (array!103164) Bool)

(assert (=> start!131978 (array_inv!38919 _keys!618)))

(assert (=> start!131978 tp_is_empty!38017))

(assert (=> start!131978 true))

(assert (=> start!131978 tp!111475))

(declare-fun e!861034 () Bool)

(declare-fun array_inv!38920 (array!103166) Bool)

(assert (=> start!131978 (and (array_inv!38920 _values!470) e!861034)))

(declare-fun b!1546915 () Bool)

(assert (=> b!1546915 (= e!861030 call!69752)))

(declare-fun mapNonEmpty!58729 () Bool)

(declare-fun mapRes!58729 () Bool)

(declare-fun tp!111476 () Bool)

(assert (=> mapNonEmpty!58729 (= mapRes!58729 (and tp!111476 e!861035))))

(declare-fun mapValue!58729 () ValueCell!18098)

(declare-fun mapKey!58729 () (_ BitVec 32))

(declare-fun mapRest!58729 () (Array (_ BitVec 32) ValueCell!18098))

(assert (=> mapNonEmpty!58729 (= (arr!49786 _values!470) (store mapRest!58729 mapKey!58729 mapValue!58729))))

(declare-fun b!1546924 () Bool)

(declare-fun res!1060462 () Bool)

(assert (=> b!1546924 (=> (not res!1060462) (not e!861032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546924 (= res!1060462 (validKeyInArray!0 (select (arr!49785 _keys!618) from!762)))))

(declare-fun bm!69751 () Bool)

(assert (=> bm!69751 (= call!69753 call!69750)))

(declare-fun b!1546925 () Bool)

(declare-fun res!1060464 () Bool)

(assert (=> b!1546925 (=> (not res!1060464) (not e!861029))))

(declare-datatypes ((List!36099 0))(
  ( (Nil!36096) (Cons!36095 (h!37541 (_ BitVec 64)) (t!50785 List!36099)) )
))
(declare-fun arrayNoDuplicates!0 (array!103164 (_ BitVec 32) List!36099) Bool)

(assert (=> b!1546925 (= res!1060464 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36096))))

(declare-fun b!1546926 () Bool)

(assert (=> b!1546926 (= e!861032 (not true))))

(declare-fun lt!666525 () ListLongMap!22237)

(declare-fun apply!1045 (ListLongMap!22237 (_ BitVec 64)) V!59133)

(assert (=> b!1546926 (= (apply!1045 (+!4960 lt!666525 (tuple2!24629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49785 _keys!618) from!762)) (apply!1045 lt!666525 (select (arr!49785 _keys!618) from!762)))))

(declare-datatypes ((Unit!51387 0))(
  ( (Unit!51388) )
))
(declare-fun lt!666523 () Unit!51387)

(declare-fun addApplyDifferent!583 (ListLongMap!22237 (_ BitVec 64) V!59133 (_ BitVec 64)) Unit!51387)

(assert (=> b!1546926 (= lt!666523 (addApplyDifferent!583 lt!666525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49785 _keys!618) from!762)))))

(declare-fun contains!10020 (ListLongMap!22237 (_ BitVec 64)) Bool)

(assert (=> b!1546926 (contains!10020 (+!4960 lt!666525 (tuple2!24629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49785 _keys!618) from!762))))

(declare-fun lt!666524 () Unit!51387)

(declare-fun addStillContains!1243 (ListLongMap!22237 (_ BitVec 64) V!59133 (_ BitVec 64)) Unit!51387)

(assert (=> b!1546926 (= lt!666524 (addStillContains!1243 lt!666525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49785 _keys!618) from!762)))))

(assert (=> b!1546926 (= lt!666525 (getCurrentListMapNoExtraKeys!6588 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58729 () Bool)

(assert (=> mapIsEmpty!58729 mapRes!58729))

(declare-fun b!1546927 () Bool)

(assert (=> b!1546927 (= e!861034 (and e!861028 mapRes!58729))))

(declare-fun condMapEmpty!58729 () Bool)

(declare-fun mapDefault!58729 () ValueCell!18098)

(assert (=> b!1546927 (= condMapEmpty!58729 (= (arr!49786 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18098)) mapDefault!58729)))))

(assert (= (and start!131978 res!1060458) b!1546917))

(assert (= (and b!1546917 res!1060461) b!1546922))

(assert (= (and b!1546922 res!1060460) b!1546925))

(assert (= (and b!1546925 res!1060464) b!1546923))

(assert (= (and b!1546923 res!1060463) b!1546912))

(assert (= (and b!1546912 c!141876) b!1546920))

(assert (= (and b!1546912 (not c!141876)) b!1546916))

(assert (= (and b!1546916 c!141875) b!1546914))

(assert (= (and b!1546916 (not c!141875)) b!1546918))

(assert (= (and b!1546918 c!141874) b!1546921))

(assert (= (and b!1546918 (not c!141874)) b!1546915))

(assert (= (or b!1546921 b!1546915) bm!69749))

(assert (= (or b!1546914 bm!69749) bm!69750))

(assert (= (or b!1546914 b!1546921) bm!69751))

(assert (= (or b!1546920 bm!69750) bm!69748))

(assert (= (or b!1546920 bm!69751) bm!69747))

(assert (= (and b!1546912 res!1060459) b!1546924))

(assert (= (and b!1546924 res!1060462) b!1546926))

(assert (= (and b!1546927 condMapEmpty!58729) mapIsEmpty!58729))

(assert (= (and b!1546927 (not condMapEmpty!58729)) mapNonEmpty!58729))

(get-info :version)

(assert (= (and mapNonEmpty!58729 ((_ is ValueCellFull!18098) mapValue!58729)) b!1546919))

(assert (= (and b!1546927 ((_ is ValueCellFull!18098) mapDefault!58729)) b!1546913))

(assert (= start!131978 b!1546927))

(declare-fun m!1426005 () Bool)

(assert (=> bm!69748 m!1426005))

(declare-fun m!1426007 () Bool)

(assert (=> bm!69747 m!1426007))

(declare-fun m!1426009 () Bool)

(assert (=> b!1546925 m!1426009))

(declare-fun m!1426011 () Bool)

(assert (=> b!1546920 m!1426011))

(declare-fun m!1426013 () Bool)

(assert (=> mapNonEmpty!58729 m!1426013))

(declare-fun m!1426015 () Bool)

(assert (=> b!1546924 m!1426015))

(assert (=> b!1546924 m!1426015))

(declare-fun m!1426017 () Bool)

(assert (=> b!1546924 m!1426017))

(assert (=> b!1546926 m!1426015))

(declare-fun m!1426019 () Bool)

(assert (=> b!1546926 m!1426019))

(assert (=> b!1546926 m!1426005))

(assert (=> b!1546926 m!1426015))

(assert (=> b!1546926 m!1426015))

(declare-fun m!1426021 () Bool)

(assert (=> b!1546926 m!1426021))

(declare-fun m!1426023 () Bool)

(assert (=> b!1546926 m!1426023))

(assert (=> b!1546926 m!1426015))

(declare-fun m!1426025 () Bool)

(assert (=> b!1546926 m!1426025))

(declare-fun m!1426027 () Bool)

(assert (=> b!1546926 m!1426027))

(assert (=> b!1546926 m!1426015))

(declare-fun m!1426029 () Bool)

(assert (=> b!1546926 m!1426029))

(assert (=> b!1546926 m!1426015))

(declare-fun m!1426031 () Bool)

(assert (=> b!1546926 m!1426031))

(assert (=> b!1546926 m!1426027))

(assert (=> b!1546926 m!1426023))

(declare-fun m!1426033 () Bool)

(assert (=> start!131978 m!1426033))

(declare-fun m!1426035 () Bool)

(assert (=> start!131978 m!1426035))

(declare-fun m!1426037 () Bool)

(assert (=> start!131978 m!1426037))

(declare-fun m!1426039 () Bool)

(assert (=> b!1546922 m!1426039))

(check-sat (not b!1546920) (not b_next!31741) (not b!1546925) (not b!1546922) (not b!1546926) b_and!51133 (not bm!69747) (not start!131978) (not b!1546924) (not mapNonEmpty!58729) (not bm!69748) tp_is_empty!38017)
(check-sat b_and!51133 (not b_next!31741))
