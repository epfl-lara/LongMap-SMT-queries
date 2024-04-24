; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132428 () Bool)

(assert start!132428)

(declare-fun b_free!31729 () Bool)

(declare-fun b_next!31729 () Bool)

(assert (=> start!132428 (= b_free!31729 (not b_next!31729))))

(declare-fun tp!111438 () Bool)

(declare-fun b_and!51141 () Bool)

(assert (=> start!132428 (= tp!111438 b_and!51141)))

(declare-fun b!1549373 () Bool)

(declare-fun e!862574 () Bool)

(assert (=> b!1549373 (= e!862574 (not true))))

(declare-datatypes ((array!103338 0))(
  ( (array!103339 (arr!49864 (Array (_ BitVec 32) (_ BitVec 64))) (size!50415 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103338)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((V!59117 0))(
  ( (V!59118 (val!19080 Int)) )
))
(declare-datatypes ((tuple2!24600 0))(
  ( (tuple2!24601 (_1!12311 (_ BitVec 64)) (_2!12311 V!59117)) )
))
(declare-datatypes ((List!36083 0))(
  ( (Nil!36080) (Cons!36079 (h!37542 tuple2!24600) (t!50769 List!36083)) )
))
(declare-datatypes ((ListLongMap!22217 0))(
  ( (ListLongMap!22218 (toList!11124 List!36083)) )
))
(declare-fun lt!667627 () ListLongMap!22217)

(declare-fun minValue!436 () V!59117)

(declare-fun apply!1055 (ListLongMap!22217 (_ BitVec 64)) V!59117)

(declare-fun +!4969 (ListLongMap!22217 tuple2!24600) ListLongMap!22217)

(assert (=> b!1549373 (= (apply!1055 (+!4969 lt!667627 (tuple2!24601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49864 _keys!618) from!762)) (apply!1055 lt!667627 (select (arr!49864 _keys!618) from!762)))))

(declare-datatypes ((Unit!51475 0))(
  ( (Unit!51476) )
))
(declare-fun lt!667626 () Unit!51475)

(declare-fun addApplyDifferent!584 (ListLongMap!22217 (_ BitVec 64) V!59117 (_ BitVec 64)) Unit!51475)

(assert (=> b!1549373 (= lt!667626 (addApplyDifferent!584 lt!667627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49864 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59117)

(declare-fun contains!10103 (ListLongMap!22217 (_ BitVec 64)) Bool)

(assert (=> b!1549373 (contains!10103 (+!4969 lt!667627 (tuple2!24601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49864 _keys!618) from!762))))

(declare-fun lt!667629 () Unit!51475)

(declare-fun addStillContains!1245 (ListLongMap!22217 (_ BitVec 64) V!59117 (_ BitVec 64)) Unit!51475)

(assert (=> b!1549373 (= lt!667629 (addStillContains!1245 lt!667627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49864 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18092 0))(
  ( (ValueCellFull!18092 (v!21873 V!59117)) (EmptyCell!18092) )
))
(declare-datatypes ((array!103340 0))(
  ( (array!103341 (arr!49865 (Array (_ BitVec 32) ValueCell!18092)) (size!50416 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103340)

(declare-fun getCurrentListMapNoExtraKeys!6602 (array!103338 array!103340 (_ BitVec 32) (_ BitVec 32) V!59117 V!59117 (_ BitVec 32) Int) ListLongMap!22217)

(assert (=> b!1549373 (= lt!667627 (getCurrentListMapNoExtraKeys!6602 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun c!142711 () Bool)

(declare-fun c!142710 () Bool)

(declare-fun call!69846 () ListLongMap!22217)

(declare-fun call!69849 () ListLongMap!22217)

(declare-fun bm!69842 () Bool)

(declare-fun call!69845 () ListLongMap!22217)

(declare-fun call!69847 () ListLongMap!22217)

(assert (=> bm!69842 (= call!69847 (+!4969 (ite c!142710 call!69849 (ite c!142711 call!69846 call!69845)) (ite (or c!142710 c!142711) (tuple2!24601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549374 () Bool)

(declare-fun e!862576 () ListLongMap!22217)

(declare-fun call!69848 () ListLongMap!22217)

(assert (=> b!1549374 (= e!862576 call!69848)))

(declare-fun b!1549375 () Bool)

(declare-fun res!1061322 () Bool)

(assert (=> b!1549375 (=> (not res!1061322) (not e!862574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549375 (= res!1061322 (validKeyInArray!0 (select (arr!49864 _keys!618) from!762)))))

(declare-fun b!1549376 () Bool)

(declare-fun e!862581 () Bool)

(assert (=> b!1549376 (= e!862581 e!862574)))

(declare-fun res!1061327 () Bool)

(assert (=> b!1549376 (=> (not res!1061327) (not e!862574))))

(assert (=> b!1549376 (= res!1061327 (bvslt from!762 (size!50415 _keys!618)))))

(declare-fun lt!667630 () ListLongMap!22217)

(declare-fun e!862580 () ListLongMap!22217)

(assert (=> b!1549376 (= lt!667630 e!862580)))

(declare-fun lt!667628 () Bool)

(assert (=> b!1549376 (= c!142710 (and (not lt!667628) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549376 (= lt!667628 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549377 () Bool)

(declare-fun c!142709 () Bool)

(assert (=> b!1549377 (= c!142709 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667628))))

(declare-fun e!862577 () ListLongMap!22217)

(assert (=> b!1549377 (= e!862577 e!862576)))

(declare-fun bm!69843 () Bool)

(assert (=> bm!69843 (= call!69845 call!69846)))

(declare-fun b!1549379 () Bool)

(declare-fun e!862579 () Bool)

(declare-fun tp_is_empty!38005 () Bool)

(assert (=> b!1549379 (= e!862579 tp_is_empty!38005)))

(declare-fun b!1549380 () Bool)

(declare-fun res!1061325 () Bool)

(assert (=> b!1549380 (=> (not res!1061325) (not e!862581))))

(assert (=> b!1549380 (= res!1061325 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50415 _keys!618))))))

(declare-fun b!1549381 () Bool)

(assert (=> b!1549381 (= e!862577 call!69848)))

(declare-fun b!1549382 () Bool)

(declare-fun res!1061321 () Bool)

(assert (=> b!1549382 (=> (not res!1061321) (not e!862581))))

(assert (=> b!1549382 (= res!1061321 (and (= (size!50416 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50415 _keys!618) (size!50416 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549383 () Bool)

(declare-fun e!862575 () Bool)

(declare-fun e!862578 () Bool)

(declare-fun mapRes!58711 () Bool)

(assert (=> b!1549383 (= e!862575 (and e!862578 mapRes!58711))))

(declare-fun condMapEmpty!58711 () Bool)

(declare-fun mapDefault!58711 () ValueCell!18092)

(assert (=> b!1549383 (= condMapEmpty!58711 (= (arr!49865 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18092)) mapDefault!58711)))))

(declare-fun b!1549384 () Bool)

(declare-fun res!1061326 () Bool)

(assert (=> b!1549384 (=> (not res!1061326) (not e!862581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103338 (_ BitVec 32)) Bool)

(assert (=> b!1549384 (= res!1061326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58711 () Bool)

(declare-fun tp!111439 () Bool)

(assert (=> mapNonEmpty!58711 (= mapRes!58711 (and tp!111439 e!862579))))

(declare-fun mapRest!58711 () (Array (_ BitVec 32) ValueCell!18092))

(declare-fun mapValue!58711 () ValueCell!18092)

(declare-fun mapKey!58711 () (_ BitVec 32))

(assert (=> mapNonEmpty!58711 (= (arr!49865 _values!470) (store mapRest!58711 mapKey!58711 mapValue!58711))))

(declare-fun bm!69844 () Bool)

(assert (=> bm!69844 (= call!69849 (getCurrentListMapNoExtraKeys!6602 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549385 () Bool)

(assert (=> b!1549385 (= e!862580 (+!4969 call!69847 (tuple2!24601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549386 () Bool)

(assert (=> b!1549386 (= e!862578 tp_is_empty!38005)))

(declare-fun bm!69845 () Bool)

(assert (=> bm!69845 (= call!69848 call!69847)))

(declare-fun res!1061323 () Bool)

(assert (=> start!132428 (=> (not res!1061323) (not e!862581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132428 (= res!1061323 (validMask!0 mask!926))))

(assert (=> start!132428 e!862581))

(declare-fun array_inv!39047 (array!103338) Bool)

(assert (=> start!132428 (array_inv!39047 _keys!618)))

(assert (=> start!132428 tp_is_empty!38005))

(assert (=> start!132428 true))

(assert (=> start!132428 tp!111438))

(declare-fun array_inv!39048 (array!103340) Bool)

(assert (=> start!132428 (and (array_inv!39048 _values!470) e!862575)))

(declare-fun b!1549378 () Bool)

(assert (=> b!1549378 (= e!862576 call!69845)))

(declare-fun b!1549387 () Bool)

(assert (=> b!1549387 (= e!862580 e!862577)))

(assert (=> b!1549387 (= c!142711 (and (not lt!667628) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549388 () Bool)

(declare-fun res!1061324 () Bool)

(assert (=> b!1549388 (=> (not res!1061324) (not e!862581))))

(declare-datatypes ((List!36084 0))(
  ( (Nil!36081) (Cons!36080 (h!37543 (_ BitVec 64)) (t!50770 List!36084)) )
))
(declare-fun arrayNoDuplicates!0 (array!103338 (_ BitVec 32) List!36084) Bool)

(assert (=> b!1549388 (= res!1061324 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36081))))

(declare-fun mapIsEmpty!58711 () Bool)

(assert (=> mapIsEmpty!58711 mapRes!58711))

(declare-fun bm!69846 () Bool)

(assert (=> bm!69846 (= call!69846 call!69849)))

(assert (= (and start!132428 res!1061323) b!1549382))

(assert (= (and b!1549382 res!1061321) b!1549384))

(assert (= (and b!1549384 res!1061326) b!1549388))

(assert (= (and b!1549388 res!1061324) b!1549380))

(assert (= (and b!1549380 res!1061325) b!1549376))

(assert (= (and b!1549376 c!142710) b!1549385))

(assert (= (and b!1549376 (not c!142710)) b!1549387))

(assert (= (and b!1549387 c!142711) b!1549381))

(assert (= (and b!1549387 (not c!142711)) b!1549377))

(assert (= (and b!1549377 c!142709) b!1549374))

(assert (= (and b!1549377 (not c!142709)) b!1549378))

(assert (= (or b!1549374 b!1549378) bm!69843))

(assert (= (or b!1549381 bm!69843) bm!69846))

(assert (= (or b!1549381 b!1549374) bm!69845))

(assert (= (or b!1549385 bm!69846) bm!69844))

(assert (= (or b!1549385 bm!69845) bm!69842))

(assert (= (and b!1549376 res!1061327) b!1549375))

(assert (= (and b!1549375 res!1061322) b!1549373))

(assert (= (and b!1549383 condMapEmpty!58711) mapIsEmpty!58711))

(assert (= (and b!1549383 (not condMapEmpty!58711)) mapNonEmpty!58711))

(get-info :version)

(assert (= (and mapNonEmpty!58711 ((_ is ValueCellFull!18092) mapValue!58711)) b!1549379))

(assert (= (and b!1549383 ((_ is ValueCellFull!18092) mapDefault!58711)) b!1549386))

(assert (= start!132428 b!1549383))

(declare-fun m!1428939 () Bool)

(assert (=> b!1549388 m!1428939))

(declare-fun m!1428941 () Bool)

(assert (=> b!1549373 m!1428941))

(declare-fun m!1428943 () Bool)

(assert (=> b!1549373 m!1428943))

(declare-fun m!1428945 () Bool)

(assert (=> b!1549373 m!1428945))

(assert (=> b!1549373 m!1428941))

(declare-fun m!1428947 () Bool)

(assert (=> b!1549373 m!1428947))

(assert (=> b!1549373 m!1428941))

(declare-fun m!1428949 () Bool)

(assert (=> b!1549373 m!1428949))

(declare-fun m!1428951 () Bool)

(assert (=> b!1549373 m!1428951))

(assert (=> b!1549373 m!1428951))

(assert (=> b!1549373 m!1428941))

(declare-fun m!1428953 () Bool)

(assert (=> b!1549373 m!1428953))

(assert (=> b!1549373 m!1428941))

(declare-fun m!1428955 () Bool)

(assert (=> b!1549373 m!1428955))

(assert (=> b!1549373 m!1428947))

(assert (=> b!1549373 m!1428941))

(declare-fun m!1428957 () Bool)

(assert (=> b!1549373 m!1428957))

(declare-fun m!1428959 () Bool)

(assert (=> b!1549385 m!1428959))

(declare-fun m!1428961 () Bool)

(assert (=> mapNonEmpty!58711 m!1428961))

(declare-fun m!1428963 () Bool)

(assert (=> bm!69842 m!1428963))

(declare-fun m!1428965 () Bool)

(assert (=> b!1549384 m!1428965))

(assert (=> bm!69844 m!1428945))

(declare-fun m!1428967 () Bool)

(assert (=> start!132428 m!1428967))

(declare-fun m!1428969 () Bool)

(assert (=> start!132428 m!1428969))

(declare-fun m!1428971 () Bool)

(assert (=> start!132428 m!1428971))

(assert (=> b!1549375 m!1428941))

(assert (=> b!1549375 m!1428941))

(declare-fun m!1428973 () Bool)

(assert (=> b!1549375 m!1428973))

(check-sat (not bm!69842) (not b!1549373) (not b!1549385) (not b_next!31729) (not b!1549388) b_and!51141 (not bm!69844) (not b!1549384) (not mapNonEmpty!58711) (not b!1549375) tp_is_empty!38005 (not start!132428))
(check-sat b_and!51141 (not b_next!31729))
