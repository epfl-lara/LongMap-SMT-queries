; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132700 () Bool)

(assert start!132700)

(declare-fun b_free!31915 () Bool)

(declare-fun b_next!31915 () Bool)

(assert (=> start!132700 (= b_free!31915 (not b_next!31915))))

(declare-fun tp!112009 () Bool)

(declare-fun b_and!51355 () Bool)

(assert (=> start!132700 (= tp!112009 b_and!51355)))

(declare-fun b!1554404 () Bool)

(declare-datatypes ((Unit!51599 0))(
  ( (Unit!51600) )
))
(declare-fun e!865480 () Unit!51599)

(declare-fun lt!669905 () Unit!51599)

(assert (=> b!1554404 (= e!865480 lt!669905)))

(declare-datatypes ((array!103710 0))(
  ( (array!103711 (arr!50046 (Array (_ BitVec 32) (_ BitVec 64))) (size!50597 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103710)

(declare-datatypes ((V!59365 0))(
  ( (V!59366 (val!19173 Int)) )
))
(declare-fun zeroValue!436 () V!59365)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18185 0))(
  ( (ValueCellFull!18185 (v!21970 V!59365)) (EmptyCell!18185) )
))
(declare-datatypes ((array!103712 0))(
  ( (array!103713 (arr!50047 (Array (_ BitVec 32) ValueCell!18185)) (size!50598 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103712)

(declare-fun minValue!436 () V!59365)

(declare-datatypes ((tuple2!24776 0))(
  ( (tuple2!24777 (_1!12399 (_ BitVec 64)) (_2!12399 V!59365)) )
))
(declare-datatypes ((List!36227 0))(
  ( (Nil!36224) (Cons!36223 (h!37686 tuple2!24776) (t!50933 List!36227)) )
))
(declare-datatypes ((ListLongMap!22393 0))(
  ( (ListLongMap!22394 (toList!11212 List!36227)) )
))
(declare-fun lt!669913 () ListLongMap!22393)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6674 (array!103710 array!103712 (_ BitVec 32) (_ BitVec 32) V!59365 V!59365 (_ BitVec 32) Int) ListLongMap!22393)

(assert (=> b!1554404 (= lt!669913 (getCurrentListMapNoExtraKeys!6674 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669910 () Unit!51599)

(declare-fun addStillContains!1299 (ListLongMap!22393 (_ BitVec 64) V!59365 (_ BitVec 64)) Unit!51599)

(assert (=> b!1554404 (= lt!669910 (addStillContains!1299 lt!669913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50046 _keys!618) from!762)))))

(declare-fun lt!669914 () ListLongMap!22393)

(declare-fun +!5042 (ListLongMap!22393 tuple2!24776) ListLongMap!22393)

(assert (=> b!1554404 (= lt!669914 (+!5042 lt!669913 (tuple2!24777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10168 (ListLongMap!22393 (_ BitVec 64)) Bool)

(assert (=> b!1554404 (contains!10168 lt!669914 (select (arr!50046 _keys!618) from!762))))

(declare-fun addApplyDifferent!634 (ListLongMap!22393 (_ BitVec 64) V!59365 (_ BitVec 64)) Unit!51599)

(assert (=> b!1554404 (= lt!669905 (addApplyDifferent!634 lt!669913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50046 _keys!618) from!762)))))

(declare-fun lt!669909 () V!59365)

(declare-fun apply!1107 (ListLongMap!22393 (_ BitVec 64)) V!59365)

(assert (=> b!1554404 (= lt!669909 (apply!1107 (+!5042 lt!669913 (tuple2!24777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50046 _keys!618) from!762)))))

(declare-fun lt!669908 () V!59365)

(assert (=> b!1554404 (= lt!669908 (apply!1107 lt!669913 (select (arr!50046 _keys!618) from!762)))))

(assert (=> b!1554404 (= lt!669909 lt!669908)))

(declare-fun lt!669912 () Unit!51599)

(assert (=> b!1554404 (= lt!669912 (addApplyDifferent!634 lt!669913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50046 _keys!618) from!762)))))

(assert (=> b!1554404 (= (apply!1107 lt!669914 (select (arr!50046 _keys!618) from!762)) lt!669908)))

(declare-fun b!1554405 () Bool)

(declare-fun e!865475 () ListLongMap!22393)

(declare-fun e!865472 () ListLongMap!22393)

(assert (=> b!1554405 (= e!865475 e!865472)))

(declare-fun c!143681 () Bool)

(declare-fun lt!669911 () Bool)

(assert (=> b!1554405 (= c!143681 (and (not lt!669911) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!59002 () Bool)

(declare-fun mapRes!59002 () Bool)

(assert (=> mapIsEmpty!59002 mapRes!59002))

(declare-fun b!1554407 () Bool)

(declare-fun e!865473 () ListLongMap!22393)

(declare-fun call!71289 () ListLongMap!22393)

(assert (=> b!1554407 (= e!865473 call!71289)))

(declare-fun b!1554408 () Bool)

(declare-fun e!865474 () Bool)

(declare-fun e!865478 () Bool)

(assert (=> b!1554408 (= e!865474 (and e!865478 mapRes!59002))))

(declare-fun condMapEmpty!59002 () Bool)

(declare-fun mapDefault!59002 () ValueCell!18185)

(assert (=> b!1554408 (= condMapEmpty!59002 (= (arr!50047 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18185)) mapDefault!59002)))))

(declare-fun b!1554409 () Bool)

(declare-fun res!1063519 () Bool)

(declare-fun e!865471 () Bool)

(assert (=> b!1554409 (=> (not res!1063519) (not e!865471))))

(assert (=> b!1554409 (= res!1063519 (and (= (size!50598 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50597 _keys!618) (size!50598 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1554410 () Bool)

(declare-fun res!1063517 () Bool)

(assert (=> b!1554410 (=> (not res!1063517) (not e!865471))))

(assert (=> b!1554410 (= res!1063517 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50597 _keys!618))))))

(declare-fun b!1554411 () Bool)

(assert (=> b!1554411 (= e!865471 false)))

(declare-fun lt!669906 () Unit!51599)

(assert (=> b!1554411 (= lt!669906 e!865480)))

(declare-fun c!143683 () Bool)

(declare-fun e!865476 () Bool)

(assert (=> b!1554411 (= c!143683 e!865476)))

(declare-fun res!1063516 () Bool)

(assert (=> b!1554411 (=> (not res!1063516) (not e!865476))))

(assert (=> b!1554411 (= res!1063516 (bvslt from!762 (size!50597 _keys!618)))))

(declare-fun lt!669907 () ListLongMap!22393)

(assert (=> b!1554411 (= lt!669907 e!865475)))

(declare-fun c!143682 () Bool)

(assert (=> b!1554411 (= c!143682 (and (not lt!669911) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1554411 (= lt!669911 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1554412 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1554412 (= e!865476 (validKeyInArray!0 (select (arr!50046 _keys!618) from!762)))))

(declare-fun bm!71282 () Bool)

(declare-fun call!71288 () ListLongMap!22393)

(declare-fun call!71287 () ListLongMap!22393)

(assert (=> bm!71282 (= call!71288 call!71287)))

(declare-fun b!1554413 () Bool)

(declare-fun tp_is_empty!38191 () Bool)

(assert (=> b!1554413 (= e!865478 tp_is_empty!38191)))

(declare-fun bm!71283 () Bool)

(declare-fun call!71286 () ListLongMap!22393)

(assert (=> bm!71283 (= call!71287 call!71286)))

(declare-fun mapNonEmpty!59002 () Bool)

(declare-fun tp!112008 () Bool)

(declare-fun e!865477 () Bool)

(assert (=> mapNonEmpty!59002 (= mapRes!59002 (and tp!112008 e!865477))))

(declare-fun mapValue!59002 () ValueCell!18185)

(declare-fun mapKey!59002 () (_ BitVec 32))

(declare-fun mapRest!59002 () (Array (_ BitVec 32) ValueCell!18185))

(assert (=> mapNonEmpty!59002 (= (arr!50047 _values!470) (store mapRest!59002 mapKey!59002 mapValue!59002))))

(declare-fun bm!71284 () Bool)

(declare-fun call!71285 () ListLongMap!22393)

(assert (=> bm!71284 (= call!71289 call!71285)))

(declare-fun b!1554414 () Bool)

(assert (=> b!1554414 (= e!865477 tp_is_empty!38191)))

(declare-fun b!1554415 () Bool)

(declare-fun res!1063518 () Bool)

(assert (=> b!1554415 (=> (not res!1063518) (not e!865471))))

(declare-datatypes ((List!36228 0))(
  ( (Nil!36225) (Cons!36224 (h!37687 (_ BitVec 64)) (t!50934 List!36228)) )
))
(declare-fun arrayNoDuplicates!0 (array!103710 (_ BitVec 32) List!36228) Bool)

(assert (=> b!1554415 (= res!1063518 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36225))))

(declare-fun b!1554416 () Bool)

(assert (=> b!1554416 (= e!865475 (+!5042 call!71285 (tuple2!24777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1554417 () Bool)

(declare-fun c!143680 () Bool)

(assert (=> b!1554417 (= c!143680 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669911))))

(assert (=> b!1554417 (= e!865472 e!865473)))

(declare-fun b!1554418 () Bool)

(assert (=> b!1554418 (= e!865472 call!71289)))

(declare-fun bm!71285 () Bool)

(assert (=> bm!71285 (= call!71286 (getCurrentListMapNoExtraKeys!6674 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1554406 () Bool)

(declare-fun res!1063521 () Bool)

(assert (=> b!1554406 (=> (not res!1063521) (not e!865471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103710 (_ BitVec 32)) Bool)

(assert (=> b!1554406 (= res!1063521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1063520 () Bool)

(assert (=> start!132700 (=> (not res!1063520) (not e!865471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132700 (= res!1063520 (validMask!0 mask!926))))

(assert (=> start!132700 e!865471))

(declare-fun array_inv!39167 (array!103710) Bool)

(assert (=> start!132700 (array_inv!39167 _keys!618)))

(assert (=> start!132700 tp_is_empty!38191))

(assert (=> start!132700 true))

(assert (=> start!132700 tp!112009))

(declare-fun array_inv!39168 (array!103712) Bool)

(assert (=> start!132700 (and (array_inv!39168 _values!470) e!865474)))

(declare-fun b!1554419 () Bool)

(declare-fun Unit!51601 () Unit!51599)

(assert (=> b!1554419 (= e!865480 Unit!51601)))

(declare-fun b!1554420 () Bool)

(assert (=> b!1554420 (= e!865473 call!71288)))

(declare-fun bm!71286 () Bool)

(assert (=> bm!71286 (= call!71285 (+!5042 (ite c!143682 call!71286 (ite c!143681 call!71287 call!71288)) (ite (or c!143682 c!143681) (tuple2!24777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and start!132700 res!1063520) b!1554409))

(assert (= (and b!1554409 res!1063519) b!1554406))

(assert (= (and b!1554406 res!1063521) b!1554415))

(assert (= (and b!1554415 res!1063518) b!1554410))

(assert (= (and b!1554410 res!1063517) b!1554411))

(assert (= (and b!1554411 c!143682) b!1554416))

(assert (= (and b!1554411 (not c!143682)) b!1554405))

(assert (= (and b!1554405 c!143681) b!1554418))

(assert (= (and b!1554405 (not c!143681)) b!1554417))

(assert (= (and b!1554417 c!143680) b!1554407))

(assert (= (and b!1554417 (not c!143680)) b!1554420))

(assert (= (or b!1554407 b!1554420) bm!71282))

(assert (= (or b!1554418 bm!71282) bm!71283))

(assert (= (or b!1554418 b!1554407) bm!71284))

(assert (= (or b!1554416 bm!71283) bm!71285))

(assert (= (or b!1554416 bm!71284) bm!71286))

(assert (= (and b!1554411 res!1063516) b!1554412))

(assert (= (and b!1554411 c!143683) b!1554404))

(assert (= (and b!1554411 (not c!143683)) b!1554419))

(assert (= (and b!1554408 condMapEmpty!59002) mapIsEmpty!59002))

(assert (= (and b!1554408 (not condMapEmpty!59002)) mapNonEmpty!59002))

(get-info :version)

(assert (= (and mapNonEmpty!59002 ((_ is ValueCellFull!18185) mapValue!59002)) b!1554414))

(assert (= (and b!1554408 ((_ is ValueCellFull!18185) mapDefault!59002)) b!1554413))

(assert (= start!132700 b!1554408))

(declare-fun m!1432837 () Bool)

(assert (=> bm!71285 m!1432837))

(declare-fun m!1432839 () Bool)

(assert (=> b!1554415 m!1432839))

(declare-fun m!1432841 () Bool)

(assert (=> b!1554404 m!1432841))

(declare-fun m!1432843 () Bool)

(assert (=> b!1554404 m!1432843))

(assert (=> b!1554404 m!1432843))

(declare-fun m!1432845 () Bool)

(assert (=> b!1554404 m!1432845))

(declare-fun m!1432847 () Bool)

(assert (=> b!1554404 m!1432847))

(assert (=> b!1554404 m!1432843))

(declare-fun m!1432849 () Bool)

(assert (=> b!1554404 m!1432849))

(assert (=> b!1554404 m!1432847))

(assert (=> b!1554404 m!1432837))

(assert (=> b!1554404 m!1432843))

(declare-fun m!1432851 () Bool)

(assert (=> b!1554404 m!1432851))

(assert (=> b!1554404 m!1432843))

(declare-fun m!1432853 () Bool)

(assert (=> b!1554404 m!1432853))

(assert (=> b!1554404 m!1432843))

(declare-fun m!1432855 () Bool)

(assert (=> b!1554404 m!1432855))

(assert (=> b!1554404 m!1432843))

(declare-fun m!1432857 () Bool)

(assert (=> b!1554404 m!1432857))

(assert (=> b!1554404 m!1432843))

(declare-fun m!1432859 () Bool)

(assert (=> b!1554404 m!1432859))

(declare-fun m!1432861 () Bool)

(assert (=> b!1554406 m!1432861))

(declare-fun m!1432863 () Bool)

(assert (=> b!1554416 m!1432863))

(declare-fun m!1432865 () Bool)

(assert (=> bm!71286 m!1432865))

(declare-fun m!1432867 () Bool)

(assert (=> mapNonEmpty!59002 m!1432867))

(assert (=> b!1554412 m!1432843))

(assert (=> b!1554412 m!1432843))

(declare-fun m!1432869 () Bool)

(assert (=> b!1554412 m!1432869))

(declare-fun m!1432871 () Bool)

(assert (=> start!132700 m!1432871))

(declare-fun m!1432873 () Bool)

(assert (=> start!132700 m!1432873))

(declare-fun m!1432875 () Bool)

(assert (=> start!132700 m!1432875))

(check-sat (not b!1554412) (not bm!71286) (not b_next!31915) (not mapNonEmpty!59002) (not start!132700) tp_is_empty!38191 (not b!1554415) (not b!1554416) (not b!1554406) (not bm!71285) (not b!1554404) b_and!51355)
(check-sat b_and!51355 (not b_next!31915))
