; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132694 () Bool)

(assert start!132694)

(declare-fun b_free!31909 () Bool)

(declare-fun b_next!31909 () Bool)

(assert (=> start!132694 (= b_free!31909 (not b_next!31909))))

(declare-fun tp!111991 () Bool)

(declare-fun b_and!51349 () Bool)

(assert (=> start!132694 (= tp!111991 b_and!51349)))

(declare-fun bm!71237 () Bool)

(declare-datatypes ((V!59357 0))(
  ( (V!59358 (val!19170 Int)) )
))
(declare-datatypes ((tuple2!24770 0))(
  ( (tuple2!24771 (_1!12396 (_ BitVec 64)) (_2!12396 V!59357)) )
))
(declare-datatypes ((List!36221 0))(
  ( (Nil!36218) (Cons!36217 (h!37680 tuple2!24770) (t!50927 List!36221)) )
))
(declare-datatypes ((ListLongMap!22387 0))(
  ( (ListLongMap!22388 (toList!11209 List!36221)) )
))
(declare-fun call!71241 () ListLongMap!22387)

(declare-fun call!71244 () ListLongMap!22387)

(assert (=> bm!71237 (= call!71241 call!71244)))

(declare-fun b!1554251 () Bool)

(declare-fun e!865389 () ListLongMap!22387)

(declare-fun e!865385 () ListLongMap!22387)

(assert (=> b!1554251 (= e!865389 e!865385)))

(declare-fun c!143646 () Bool)

(declare-fun lt!669822 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1554251 (= c!143646 (and (not lt!669822) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1554252 () Bool)

(declare-fun e!865383 () Bool)

(declare-fun tp_is_empty!38185 () Bool)

(assert (=> b!1554252 (= e!865383 tp_is_empty!38185)))

(declare-fun b!1554253 () Bool)

(declare-fun e!865390 () Bool)

(assert (=> b!1554253 (= e!865390 false)))

(declare-datatypes ((Unit!51591 0))(
  ( (Unit!51592) )
))
(declare-fun lt!669818 () Unit!51591)

(declare-fun e!865387 () Unit!51591)

(assert (=> b!1554253 (= lt!669818 e!865387)))

(declare-fun c!143644 () Bool)

(declare-fun e!865381 () Bool)

(assert (=> b!1554253 (= c!143644 e!865381)))

(declare-fun res!1063467 () Bool)

(assert (=> b!1554253 (=> (not res!1063467) (not e!865381))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103698 0))(
  ( (array!103699 (arr!50040 (Array (_ BitVec 32) (_ BitVec 64))) (size!50591 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103698)

(assert (=> b!1554253 (= res!1063467 (bvslt from!762 (size!50591 _keys!618)))))

(declare-fun lt!669816 () ListLongMap!22387)

(assert (=> b!1554253 (= lt!669816 e!865389)))

(declare-fun c!143645 () Bool)

(assert (=> b!1554253 (= c!143645 (and (not lt!669822) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1554253 (= lt!669822 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1554254 () Bool)

(declare-fun e!865384 () ListLongMap!22387)

(declare-fun call!71240 () ListLongMap!22387)

(assert (=> b!1554254 (= e!865384 call!71240)))

(declare-fun mapNonEmpty!58993 () Bool)

(declare-fun mapRes!58993 () Bool)

(declare-fun tp!111990 () Bool)

(assert (=> mapNonEmpty!58993 (= mapRes!58993 (and tp!111990 e!865383))))

(declare-datatypes ((ValueCell!18182 0))(
  ( (ValueCellFull!18182 (v!21967 V!59357)) (EmptyCell!18182) )
))
(declare-fun mapValue!58993 () ValueCell!18182)

(declare-fun mapRest!58993 () (Array (_ BitVec 32) ValueCell!18182))

(declare-datatypes ((array!103700 0))(
  ( (array!103701 (arr!50041 (Array (_ BitVec 32) ValueCell!18182)) (size!50592 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103700)

(declare-fun mapKey!58993 () (_ BitVec 32))

(assert (=> mapNonEmpty!58993 (= (arr!50041 _values!470) (store mapRest!58993 mapKey!58993 mapValue!58993))))

(declare-fun b!1554255 () Bool)

(declare-fun res!1063464 () Bool)

(assert (=> b!1554255 (=> (not res!1063464) (not e!865390))))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1554255 (= res!1063464 (and (= (size!50592 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50591 _keys!618) (size!50592 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1554256 () Bool)

(declare-fun res!1063463 () Bool)

(assert (=> b!1554256 (=> (not res!1063463) (not e!865390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103698 (_ BitVec 32)) Bool)

(assert (=> b!1554256 (= res!1063463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!71238 () Bool)

(declare-fun call!71243 () ListLongMap!22387)

(assert (=> bm!71238 (= call!71240 call!71243)))

(declare-fun b!1554257 () Bool)

(declare-fun e!865388 () Bool)

(declare-fun e!865386 () Bool)

(assert (=> b!1554257 (= e!865388 (and e!865386 mapRes!58993))))

(declare-fun condMapEmpty!58993 () Bool)

(declare-fun mapDefault!58993 () ValueCell!18182)

(assert (=> b!1554257 (= condMapEmpty!58993 (= (arr!50041 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18182)) mapDefault!58993)))))

(declare-fun b!1554258 () Bool)

(assert (=> b!1554258 (= e!865386 tp_is_empty!38185)))

(declare-fun b!1554259 () Bool)

(declare-fun lt!669815 () Unit!51591)

(assert (=> b!1554259 (= e!865387 lt!669815)))

(declare-fun zeroValue!436 () V!59357)

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!59357)

(declare-fun lt!669817 () ListLongMap!22387)

(declare-fun getCurrentListMapNoExtraKeys!6671 (array!103698 array!103700 (_ BitVec 32) (_ BitVec 32) V!59357 V!59357 (_ BitVec 32) Int) ListLongMap!22387)

(assert (=> b!1554259 (= lt!669817 (getCurrentListMapNoExtraKeys!6671 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669819 () Unit!51591)

(declare-fun addStillContains!1296 (ListLongMap!22387 (_ BitVec 64) V!59357 (_ BitVec 64)) Unit!51591)

(assert (=> b!1554259 (= lt!669819 (addStillContains!1296 lt!669817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50040 _keys!618) from!762)))))

(declare-fun lt!669824 () ListLongMap!22387)

(declare-fun +!5039 (ListLongMap!22387 tuple2!24770) ListLongMap!22387)

(assert (=> b!1554259 (= lt!669824 (+!5039 lt!669817 (tuple2!24771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10165 (ListLongMap!22387 (_ BitVec 64)) Bool)

(assert (=> b!1554259 (contains!10165 lt!669824 (select (arr!50040 _keys!618) from!762))))

(declare-fun addApplyDifferent!631 (ListLongMap!22387 (_ BitVec 64) V!59357 (_ BitVec 64)) Unit!51591)

(assert (=> b!1554259 (= lt!669815 (addApplyDifferent!631 lt!669817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50040 _keys!618) from!762)))))

(declare-fun lt!669823 () V!59357)

(declare-fun apply!1104 (ListLongMap!22387 (_ BitVec 64)) V!59357)

(assert (=> b!1554259 (= lt!669823 (apply!1104 (+!5039 lt!669817 (tuple2!24771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50040 _keys!618) from!762)))))

(declare-fun lt!669820 () V!59357)

(assert (=> b!1554259 (= lt!669820 (apply!1104 lt!669817 (select (arr!50040 _keys!618) from!762)))))

(assert (=> b!1554259 (= lt!669823 lt!669820)))

(declare-fun lt!669821 () Unit!51591)

(assert (=> b!1554259 (= lt!669821 (addApplyDifferent!631 lt!669817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50040 _keys!618) from!762)))))

(assert (=> b!1554259 (= (apply!1104 lt!669824 (select (arr!50040 _keys!618) from!762)) lt!669820)))

(declare-fun b!1554260 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1554260 (= e!865381 (validKeyInArray!0 (select (arr!50040 _keys!618) from!762)))))

(declare-fun bm!71239 () Bool)

(declare-fun call!71242 () ListLongMap!22387)

(assert (=> bm!71239 (= call!71242 (getCurrentListMapNoExtraKeys!6671 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1554261 () Bool)

(declare-fun res!1063462 () Bool)

(assert (=> b!1554261 (=> (not res!1063462) (not e!865390))))

(assert (=> b!1554261 (= res!1063462 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50591 _keys!618))))))

(declare-fun b!1554262 () Bool)

(assert (=> b!1554262 (= e!865385 call!71240)))

(declare-fun bm!71240 () Bool)

(assert (=> bm!71240 (= call!71244 call!71242)))

(declare-fun b!1554263 () Bool)

(declare-fun c!143647 () Bool)

(assert (=> b!1554263 (= c!143647 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669822))))

(assert (=> b!1554263 (= e!865385 e!865384)))

(declare-fun res!1063465 () Bool)

(assert (=> start!132694 (=> (not res!1063465) (not e!865390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132694 (= res!1063465 (validMask!0 mask!926))))

(assert (=> start!132694 e!865390))

(declare-fun array_inv!39163 (array!103698) Bool)

(assert (=> start!132694 (array_inv!39163 _keys!618)))

(assert (=> start!132694 tp_is_empty!38185))

(assert (=> start!132694 true))

(assert (=> start!132694 tp!111991))

(declare-fun array_inv!39164 (array!103700) Bool)

(assert (=> start!132694 (and (array_inv!39164 _values!470) e!865388)))

(declare-fun b!1554264 () Bool)

(assert (=> b!1554264 (= e!865389 (+!5039 call!71243 (tuple2!24771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58993 () Bool)

(assert (=> mapIsEmpty!58993 mapRes!58993))

(declare-fun b!1554265 () Bool)

(declare-fun Unit!51593 () Unit!51591)

(assert (=> b!1554265 (= e!865387 Unit!51593)))

(declare-fun b!1554266 () Bool)

(declare-fun res!1063466 () Bool)

(assert (=> b!1554266 (=> (not res!1063466) (not e!865390))))

(declare-datatypes ((List!36222 0))(
  ( (Nil!36219) (Cons!36218 (h!37681 (_ BitVec 64)) (t!50928 List!36222)) )
))
(declare-fun arrayNoDuplicates!0 (array!103698 (_ BitVec 32) List!36222) Bool)

(assert (=> b!1554266 (= res!1063466 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36219))))

(declare-fun b!1554267 () Bool)

(assert (=> b!1554267 (= e!865384 call!71241)))

(declare-fun bm!71241 () Bool)

(assert (=> bm!71241 (= call!71243 (+!5039 (ite c!143645 call!71242 (ite c!143646 call!71244 call!71241)) (ite (or c!143645 c!143646) (tuple2!24771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and start!132694 res!1063465) b!1554255))

(assert (= (and b!1554255 res!1063464) b!1554256))

(assert (= (and b!1554256 res!1063463) b!1554266))

(assert (= (and b!1554266 res!1063466) b!1554261))

(assert (= (and b!1554261 res!1063462) b!1554253))

(assert (= (and b!1554253 c!143645) b!1554264))

(assert (= (and b!1554253 (not c!143645)) b!1554251))

(assert (= (and b!1554251 c!143646) b!1554262))

(assert (= (and b!1554251 (not c!143646)) b!1554263))

(assert (= (and b!1554263 c!143647) b!1554254))

(assert (= (and b!1554263 (not c!143647)) b!1554267))

(assert (= (or b!1554254 b!1554267) bm!71237))

(assert (= (or b!1554262 bm!71237) bm!71240))

(assert (= (or b!1554262 b!1554254) bm!71238))

(assert (= (or b!1554264 bm!71240) bm!71239))

(assert (= (or b!1554264 bm!71238) bm!71241))

(assert (= (and b!1554253 res!1063467) b!1554260))

(assert (= (and b!1554253 c!143644) b!1554259))

(assert (= (and b!1554253 (not c!143644)) b!1554265))

(assert (= (and b!1554257 condMapEmpty!58993) mapIsEmpty!58993))

(assert (= (and b!1554257 (not condMapEmpty!58993)) mapNonEmpty!58993))

(get-info :version)

(assert (= (and mapNonEmpty!58993 ((_ is ValueCellFull!18182) mapValue!58993)) b!1554252))

(assert (= (and b!1554257 ((_ is ValueCellFull!18182) mapDefault!58993)) b!1554258))

(assert (= start!132694 b!1554257))

(declare-fun m!1432717 () Bool)

(assert (=> bm!71241 m!1432717))

(declare-fun m!1432719 () Bool)

(assert (=> mapNonEmpty!58993 m!1432719))

(declare-fun m!1432721 () Bool)

(assert (=> b!1554264 m!1432721))

(declare-fun m!1432723 () Bool)

(assert (=> b!1554256 m!1432723))

(declare-fun m!1432725 () Bool)

(assert (=> start!132694 m!1432725))

(declare-fun m!1432727 () Bool)

(assert (=> start!132694 m!1432727))

(declare-fun m!1432729 () Bool)

(assert (=> start!132694 m!1432729))

(declare-fun m!1432731 () Bool)

(assert (=> b!1554260 m!1432731))

(assert (=> b!1554260 m!1432731))

(declare-fun m!1432733 () Bool)

(assert (=> b!1554260 m!1432733))

(declare-fun m!1432735 () Bool)

(assert (=> b!1554266 m!1432735))

(assert (=> b!1554259 m!1432731))

(declare-fun m!1432737 () Bool)

(assert (=> b!1554259 m!1432737))

(declare-fun m!1432739 () Bool)

(assert (=> b!1554259 m!1432739))

(assert (=> b!1554259 m!1432731))

(declare-fun m!1432741 () Bool)

(assert (=> b!1554259 m!1432741))

(declare-fun m!1432743 () Bool)

(assert (=> b!1554259 m!1432743))

(assert (=> b!1554259 m!1432731))

(declare-fun m!1432745 () Bool)

(assert (=> b!1554259 m!1432745))

(assert (=> b!1554259 m!1432731))

(declare-fun m!1432747 () Bool)

(assert (=> b!1554259 m!1432747))

(assert (=> b!1554259 m!1432731))

(declare-fun m!1432749 () Bool)

(assert (=> b!1554259 m!1432749))

(declare-fun m!1432751 () Bool)

(assert (=> b!1554259 m!1432751))

(assert (=> b!1554259 m!1432739))

(assert (=> b!1554259 m!1432731))

(declare-fun m!1432753 () Bool)

(assert (=> b!1554259 m!1432753))

(assert (=> b!1554259 m!1432731))

(declare-fun m!1432755 () Bool)

(assert (=> b!1554259 m!1432755))

(assert (=> b!1554259 m!1432731))

(assert (=> bm!71239 m!1432751))

(check-sat (not bm!71241) (not b_next!31909) (not mapNonEmpty!58993) tp_is_empty!38185 (not b!1554256) (not b!1554264) (not b!1554259) (not bm!71239) (not start!132694) (not b!1554266) b_and!51349 (not b!1554260))
(check-sat b_and!51349 (not b_next!31909))
