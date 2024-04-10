; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132102 () Bool)

(assert start!132102)

(declare-fun b_free!31815 () Bool)

(declare-fun b_next!31815 () Bool)

(assert (=> start!132102 (= b_free!31815 (not b_next!31815))))

(declare-fun tp!111696 () Bool)

(declare-fun b_and!51225 () Bool)

(assert (=> start!132102 (= tp!111696 b_and!51225)))

(declare-fun b!1549001 () Bool)

(declare-datatypes ((V!59231 0))(
  ( (V!59232 (val!19123 Int)) )
))
(declare-datatypes ((tuple2!24624 0))(
  ( (tuple2!24625 (_1!12323 (_ BitVec 64)) (_2!12323 V!59231)) )
))
(declare-datatypes ((List!36113 0))(
  ( (Nil!36110) (Cons!36109 (h!37554 tuple2!24624) (t!50807 List!36113)) )
))
(declare-datatypes ((ListLongMap!22233 0))(
  ( (ListLongMap!22234 (toList!11132 List!36113)) )
))
(declare-fun e!862233 () ListLongMap!22233)

(declare-fun call!70344 () ListLongMap!22233)

(assert (=> b!1549001 (= e!862233 call!70344)))

(declare-fun bm!70337 () Bool)

(declare-fun call!70341 () ListLongMap!22233)

(declare-fun call!70343 () ListLongMap!22233)

(assert (=> bm!70337 (= call!70341 call!70343)))

(declare-fun b!1549002 () Bool)

(declare-fun res!1061364 () Bool)

(declare-fun e!862230 () Bool)

(assert (=> b!1549002 (=> (not res!1061364) (not e!862230))))

(declare-datatypes ((array!103380 0))(
  ( (array!103381 (arr!49892 (Array (_ BitVec 32) (_ BitVec 64))) (size!50442 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103380)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103380 (_ BitVec 32)) Bool)

(assert (=> b!1549002 (= res!1061364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549003 () Bool)

(declare-fun e!862227 () Bool)

(assert (=> b!1549003 (= e!862227 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667615 () ListLongMap!22233)

(declare-fun lt!667608 () V!59231)

(declare-fun apply!1077 (ListLongMap!22233 (_ BitVec 64)) V!59231)

(assert (=> b!1549003 (= (apply!1077 lt!667615 (select (arr!49892 _keys!618) from!762)) lt!667608)))

(declare-fun zeroValue!436 () V!59231)

(declare-fun lt!667609 () ListLongMap!22233)

(declare-datatypes ((Unit!51604 0))(
  ( (Unit!51605) )
))
(declare-fun lt!667613 () Unit!51604)

(declare-fun addApplyDifferent!619 (ListLongMap!22233 (_ BitVec 64) V!59231 (_ BitVec 64)) Unit!51604)

(assert (=> b!1549003 (= lt!667613 (addApplyDifferent!619 lt!667609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49892 _keys!618) from!762)))))

(declare-fun lt!667614 () V!59231)

(assert (=> b!1549003 (= lt!667614 lt!667608)))

(assert (=> b!1549003 (= lt!667608 (apply!1077 lt!667609 (select (arr!49892 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59231)

(declare-fun +!4961 (ListLongMap!22233 tuple2!24624) ListLongMap!22233)

(assert (=> b!1549003 (= lt!667614 (apply!1077 (+!4961 lt!667609 (tuple2!24625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49892 _keys!618) from!762)))))

(declare-fun lt!667612 () Unit!51604)

(assert (=> b!1549003 (= lt!667612 (addApplyDifferent!619 lt!667609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49892 _keys!618) from!762)))))

(declare-fun contains!10084 (ListLongMap!22233 (_ BitVec 64)) Bool)

(assert (=> b!1549003 (contains!10084 lt!667615 (select (arr!49892 _keys!618) from!762))))

(assert (=> b!1549003 (= lt!667615 (+!4961 lt!667609 (tuple2!24625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667611 () Unit!51604)

(declare-fun addStillContains!1272 (ListLongMap!22233 (_ BitVec 64) V!59231 (_ BitVec 64)) Unit!51604)

(assert (=> b!1549003 (= lt!667611 (addStillContains!1272 lt!667609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49892 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-datatypes ((ValueCell!18135 0))(
  ( (ValueCellFull!18135 (v!21924 V!59231)) (EmptyCell!18135) )
))
(declare-datatypes ((array!103382 0))(
  ( (array!103383 (arr!49893 (Array (_ BitVec 32) ValueCell!18135)) (size!50443 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103382)

(declare-fun getCurrentListMapNoExtraKeys!6586 (array!103380 array!103382 (_ BitVec 32) (_ BitVec 32) V!59231 V!59231 (_ BitVec 32) Int) ListLongMap!22233)

(assert (=> b!1549003 (= lt!667609 (getCurrentListMapNoExtraKeys!6586 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58840 () Bool)

(declare-fun mapRes!58840 () Bool)

(declare-fun tp!111697 () Bool)

(declare-fun e!862232 () Bool)

(assert (=> mapNonEmpty!58840 (= mapRes!58840 (and tp!111697 e!862232))))

(declare-fun mapKey!58840 () (_ BitVec 32))

(declare-fun mapRest!58840 () (Array (_ BitVec 32) ValueCell!18135))

(declare-fun mapValue!58840 () ValueCell!18135)

(assert (=> mapNonEmpty!58840 (= (arr!49893 _values!470) (store mapRest!58840 mapKey!58840 mapValue!58840))))

(declare-fun mapIsEmpty!58840 () Bool)

(assert (=> mapIsEmpty!58840 mapRes!58840))

(declare-fun bm!70338 () Bool)

(assert (=> bm!70338 (= call!70343 (getCurrentListMapNoExtraKeys!6586 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun call!70342 () ListLongMap!22233)

(declare-fun c!142297 () Bool)

(declare-fun bm!70339 () Bool)

(declare-fun c!142298 () Bool)

(declare-fun call!70340 () ListLongMap!22233)

(assert (=> bm!70339 (= call!70342 (+!4961 (ite c!142298 call!70343 (ite c!142297 call!70341 call!70340)) (ite (or c!142298 c!142297) (tuple2!24625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549004 () Bool)

(declare-fun res!1061370 () Bool)

(assert (=> b!1549004 (=> (not res!1061370) (not e!862230))))

(assert (=> b!1549004 (= res!1061370 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50442 _keys!618))))))

(declare-fun bm!70340 () Bool)

(assert (=> bm!70340 (= call!70340 call!70341)))

(declare-fun b!1549005 () Bool)

(declare-fun e!862225 () ListLongMap!22233)

(assert (=> b!1549005 (= e!862225 (+!4961 call!70342 (tuple2!24625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549006 () Bool)

(declare-fun res!1061367 () Bool)

(assert (=> b!1549006 (=> (not res!1061367) (not e!862230))))

(assert (=> b!1549006 (= res!1061367 (and (= (size!50443 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50442 _keys!618) (size!50443 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549007 () Bool)

(declare-fun e!862226 () Bool)

(declare-fun tp_is_empty!38091 () Bool)

(assert (=> b!1549007 (= e!862226 tp_is_empty!38091)))

(declare-fun b!1549008 () Bool)

(assert (=> b!1549008 (= e!862230 e!862227)))

(declare-fun res!1061365 () Bool)

(assert (=> b!1549008 (=> (not res!1061365) (not e!862227))))

(assert (=> b!1549008 (= res!1061365 (bvslt from!762 (size!50442 _keys!618)))))

(declare-fun lt!667616 () ListLongMap!22233)

(assert (=> b!1549008 (= lt!667616 e!862225)))

(declare-fun lt!667610 () Bool)

(assert (=> b!1549008 (= c!142298 (and (not lt!667610) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549008 (= lt!667610 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549009 () Bool)

(declare-fun c!142296 () Bool)

(assert (=> b!1549009 (= c!142296 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667610))))

(declare-fun e!862229 () ListLongMap!22233)

(assert (=> b!1549009 (= e!862229 e!862233)))

(declare-fun b!1549010 () Bool)

(assert (=> b!1549010 (= e!862225 e!862229)))

(assert (=> b!1549010 (= c!142297 (and (not lt!667610) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70341 () Bool)

(assert (=> bm!70341 (= call!70344 call!70342)))

(declare-fun b!1549011 () Bool)

(declare-fun res!1061368 () Bool)

(assert (=> b!1549011 (=> (not res!1061368) (not e!862230))))

(declare-datatypes ((List!36114 0))(
  ( (Nil!36111) (Cons!36110 (h!37555 (_ BitVec 64)) (t!50808 List!36114)) )
))
(declare-fun arrayNoDuplicates!0 (array!103380 (_ BitVec 32) List!36114) Bool)

(assert (=> b!1549011 (= res!1061368 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36111))))

(declare-fun b!1549012 () Bool)

(assert (=> b!1549012 (= e!862232 tp_is_empty!38091)))

(declare-fun res!1061366 () Bool)

(assert (=> start!132102 (=> (not res!1061366) (not e!862230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132102 (= res!1061366 (validMask!0 mask!926))))

(assert (=> start!132102 e!862230))

(declare-fun array_inv!38791 (array!103380) Bool)

(assert (=> start!132102 (array_inv!38791 _keys!618)))

(assert (=> start!132102 tp_is_empty!38091))

(assert (=> start!132102 true))

(assert (=> start!132102 tp!111696))

(declare-fun e!862228 () Bool)

(declare-fun array_inv!38792 (array!103382) Bool)

(assert (=> start!132102 (and (array_inv!38792 _values!470) e!862228)))

(declare-fun b!1549013 () Bool)

(assert (=> b!1549013 (= e!862229 call!70344)))

(declare-fun b!1549014 () Bool)

(assert (=> b!1549014 (= e!862228 (and e!862226 mapRes!58840))))

(declare-fun condMapEmpty!58840 () Bool)

(declare-fun mapDefault!58840 () ValueCell!18135)

(assert (=> b!1549014 (= condMapEmpty!58840 (= (arr!49893 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18135)) mapDefault!58840)))))

(declare-fun b!1549015 () Bool)

(assert (=> b!1549015 (= e!862233 call!70340)))

(declare-fun b!1549016 () Bool)

(declare-fun res!1061369 () Bool)

(assert (=> b!1549016 (=> (not res!1061369) (not e!862227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549016 (= res!1061369 (validKeyInArray!0 (select (arr!49892 _keys!618) from!762)))))

(assert (= (and start!132102 res!1061366) b!1549006))

(assert (= (and b!1549006 res!1061367) b!1549002))

(assert (= (and b!1549002 res!1061364) b!1549011))

(assert (= (and b!1549011 res!1061368) b!1549004))

(assert (= (and b!1549004 res!1061370) b!1549008))

(assert (= (and b!1549008 c!142298) b!1549005))

(assert (= (and b!1549008 (not c!142298)) b!1549010))

(assert (= (and b!1549010 c!142297) b!1549013))

(assert (= (and b!1549010 (not c!142297)) b!1549009))

(assert (= (and b!1549009 c!142296) b!1549001))

(assert (= (and b!1549009 (not c!142296)) b!1549015))

(assert (= (or b!1549001 b!1549015) bm!70340))

(assert (= (or b!1549013 bm!70340) bm!70337))

(assert (= (or b!1549013 b!1549001) bm!70341))

(assert (= (or b!1549005 bm!70337) bm!70338))

(assert (= (or b!1549005 bm!70341) bm!70339))

(assert (= (and b!1549008 res!1061365) b!1549016))

(assert (= (and b!1549016 res!1061369) b!1549003))

(assert (= (and b!1549014 condMapEmpty!58840) mapIsEmpty!58840))

(assert (= (and b!1549014 (not condMapEmpty!58840)) mapNonEmpty!58840))

(get-info :version)

(assert (= (and mapNonEmpty!58840 ((_ is ValueCellFull!18135) mapValue!58840)) b!1549012))

(assert (= (and b!1549014 ((_ is ValueCellFull!18135) mapDefault!58840)) b!1549007))

(assert (= start!132102 b!1549014))

(declare-fun m!1428311 () Bool)

(assert (=> b!1549011 m!1428311))

(declare-fun m!1428313 () Bool)

(assert (=> bm!70338 m!1428313))

(declare-fun m!1428315 () Bool)

(assert (=> b!1549002 m!1428315))

(declare-fun m!1428317 () Bool)

(assert (=> mapNonEmpty!58840 m!1428317))

(declare-fun m!1428319 () Bool)

(assert (=> b!1549005 m!1428319))

(declare-fun m!1428321 () Bool)

(assert (=> bm!70339 m!1428321))

(declare-fun m!1428323 () Bool)

(assert (=> b!1549003 m!1428323))

(declare-fun m!1428325 () Bool)

(assert (=> b!1549003 m!1428325))

(assert (=> b!1549003 m!1428323))

(assert (=> b!1549003 m!1428323))

(declare-fun m!1428327 () Bool)

(assert (=> b!1549003 m!1428327))

(declare-fun m!1428329 () Bool)

(assert (=> b!1549003 m!1428329))

(assert (=> b!1549003 m!1428323))

(declare-fun m!1428331 () Bool)

(assert (=> b!1549003 m!1428331))

(assert (=> b!1549003 m!1428323))

(declare-fun m!1428333 () Bool)

(assert (=> b!1549003 m!1428333))

(assert (=> b!1549003 m!1428329))

(assert (=> b!1549003 m!1428323))

(declare-fun m!1428335 () Bool)

(assert (=> b!1549003 m!1428335))

(assert (=> b!1549003 m!1428323))

(declare-fun m!1428337 () Bool)

(assert (=> b!1549003 m!1428337))

(assert (=> b!1549003 m!1428323))

(declare-fun m!1428339 () Bool)

(assert (=> b!1549003 m!1428339))

(assert (=> b!1549003 m!1428313))

(declare-fun m!1428341 () Bool)

(assert (=> b!1549003 m!1428341))

(declare-fun m!1428343 () Bool)

(assert (=> start!132102 m!1428343))

(declare-fun m!1428345 () Bool)

(assert (=> start!132102 m!1428345))

(declare-fun m!1428347 () Bool)

(assert (=> start!132102 m!1428347))

(assert (=> b!1549016 m!1428323))

(assert (=> b!1549016 m!1428323))

(declare-fun m!1428349 () Bool)

(assert (=> b!1549016 m!1428349))

(check-sat (not b!1549011) (not b!1549003) (not b_next!31815) (not b!1549016) b_and!51225 (not bm!70338) (not start!132102) (not bm!70339) (not mapNonEmpty!58840) (not b!1549002) tp_is_empty!38091 (not b!1549005))
(check-sat b_and!51225 (not b_next!31815))
