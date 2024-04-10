; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132308 () Bool)

(assert start!132308)

(declare-fun b_free!31935 () Bool)

(declare-fun b_next!31935 () Bool)

(assert (=> start!132308 (= b_free!31935 (not b_next!31935))))

(declare-fun tp!112069 () Bool)

(declare-fun b_and!51375 () Bool)

(assert (=> start!132308 (= tp!112069 b_and!51375)))

(declare-fun bm!71292 () Bool)

(declare-datatypes ((V!59391 0))(
  ( (V!59392 (val!19183 Int)) )
))
(declare-datatypes ((tuple2!24742 0))(
  ( (tuple2!24743 (_1!12382 (_ BitVec 64)) (_2!12382 V!59391)) )
))
(declare-datatypes ((List!36216 0))(
  ( (Nil!36213) (Cons!36212 (h!37657 tuple2!24742) (t!50934 List!36216)) )
))
(declare-datatypes ((ListLongMap!22351 0))(
  ( (ListLongMap!22352 (toList!11191 List!36216)) )
))
(declare-fun call!71295 () ListLongMap!22351)

(declare-fun call!71300 () ListLongMap!22351)

(assert (=> bm!71292 (= call!71295 call!71300)))

(declare-fun b!1552557 () Bool)

(declare-fun res!1062898 () Bool)

(declare-fun e!864327 () Bool)

(assert (=> b!1552557 (=> (not res!1062898) (not e!864327))))

(declare-datatypes ((array!103624 0))(
  ( (array!103625 (arr!50010 (Array (_ BitVec 32) (_ BitVec 64))) (size!50560 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103624)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18195 0))(
  ( (ValueCellFull!18195 (v!21988 V!59391)) (EmptyCell!18195) )
))
(declare-datatypes ((array!103626 0))(
  ( (array!103627 (arr!50011 (Array (_ BitVec 32) ValueCell!18195)) (size!50561 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103626)

(assert (=> b!1552557 (= res!1062898 (and (= (size!50561 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50560 _keys!618) (size!50561 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552558 () Bool)

(declare-fun c!143015 () Bool)

(declare-fun lt!669337 () Bool)

(assert (=> b!1552558 (= c!143015 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669337))))

(declare-fun e!864324 () ListLongMap!22351)

(declare-fun e!864326 () ListLongMap!22351)

(assert (=> b!1552558 (= e!864324 e!864326)))

(declare-fun b!1552559 () Bool)

(declare-fun e!864328 () Bool)

(declare-fun call!71296 () Bool)

(assert (=> b!1552559 (= e!864328 call!71296)))

(declare-fun b!1552560 () Bool)

(declare-fun e!864331 () ListLongMap!22351)

(assert (=> b!1552560 (= e!864331 e!864324)))

(declare-fun c!143013 () Bool)

(assert (=> b!1552560 (= c!143013 (and (not lt!669337) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552561 () Bool)

(declare-fun e!864325 () Bool)

(declare-fun call!71299 () Bool)

(assert (=> b!1552561 (= e!864325 call!71299)))

(declare-fun b!1552562 () Bool)

(declare-datatypes ((Unit!51710 0))(
  ( (Unit!51711) )
))
(declare-fun e!864322 () Unit!51710)

(declare-fun Unit!51712 () Unit!51710)

(assert (=> b!1552562 (= e!864322 Unit!51712)))

(declare-fun res!1062901 () Bool)

(assert (=> start!132308 (=> (not res!1062901) (not e!864327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132308 (= res!1062901 (validMask!0 mask!926))))

(assert (=> start!132308 e!864327))

(declare-fun array_inv!38877 (array!103624) Bool)

(assert (=> start!132308 (array_inv!38877 _keys!618)))

(declare-fun tp_is_empty!38211 () Bool)

(assert (=> start!132308 tp_is_empty!38211))

(assert (=> start!132308 true))

(assert (=> start!132308 tp!112069))

(declare-fun e!864319 () Bool)

(declare-fun array_inv!38878 (array!103626) Bool)

(assert (=> start!132308 (and (array_inv!38878 _values!470) e!864319)))

(declare-fun b!1552563 () Bool)

(declare-fun e!864323 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552563 (= e!864323 (not (validKeyInArray!0 (select (arr!50010 _keys!618) from!762))))))

(declare-fun b!1552564 () Bool)

(declare-fun e!864321 () Bool)

(declare-fun e!864316 () Bool)

(assert (=> b!1552564 (= e!864321 e!864316)))

(declare-fun res!1062895 () Bool)

(assert (=> b!1552564 (=> res!1062895 e!864316)))

(declare-fun lt!669336 () ListLongMap!22351)

(declare-fun contains!10131 (ListLongMap!22351 (_ BitVec 64)) Bool)

(assert (=> b!1552564 (= res!1062895 (not (contains!10131 lt!669336 (select (arr!50010 _keys!618) from!762))))))

(declare-fun bm!71293 () Bool)

(assert (=> bm!71293 (= call!71296 (contains!10131 lt!669336 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!143012 () Bool)

(declare-fun zeroValue!436 () V!59391)

(declare-fun bm!71294 () Bool)

(declare-fun call!71297 () ListLongMap!22351)

(declare-fun minValue!436 () V!59391)

(declare-fun call!71298 () ListLongMap!22351)

(declare-fun +!5011 (ListLongMap!22351 tuple2!24742) ListLongMap!22351)

(assert (=> bm!71294 (= call!71297 (+!5011 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!59032 () Bool)

(declare-fun mapRes!59032 () Bool)

(assert (=> mapIsEmpty!59032 mapRes!59032))

(declare-fun mapNonEmpty!59032 () Bool)

(declare-fun tp!112068 () Bool)

(declare-fun e!864315 () Bool)

(assert (=> mapNonEmpty!59032 (= mapRes!59032 (and tp!112068 e!864315))))

(declare-fun mapKey!59032 () (_ BitVec 32))

(declare-fun mapRest!59032 () (Array (_ BitVec 32) ValueCell!18195))

(declare-fun mapValue!59032 () ValueCell!18195)

(assert (=> mapNonEmpty!59032 (= (arr!50011 _values!470) (store mapRest!59032 mapKey!59032 mapValue!59032))))

(declare-fun b!1552565 () Bool)

(assert (=> b!1552565 (= e!864331 (+!5011 call!71297 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552566 () Bool)

(declare-fun call!71301 () ListLongMap!22351)

(assert (=> b!1552566 (= e!864326 call!71301)))

(declare-fun b!1552567 () Bool)

(declare-fun e!864318 () Bool)

(assert (=> b!1552567 (= e!864318 e!864328)))

(declare-fun c!143014 () Bool)

(assert (=> b!1552567 (= c!143014 (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552568 () Bool)

(assert (=> b!1552568 (= e!864327 e!864318)))

(declare-fun res!1062896 () Bool)

(assert (=> b!1552568 (=> res!1062896 e!864318)))

(assert (=> b!1552568 (= res!1062896 e!864321)))

(declare-fun res!1062900 () Bool)

(assert (=> b!1552568 (=> (not res!1062900) (not e!864321))))

(declare-fun lt!669335 () Bool)

(assert (=> b!1552568 (= res!1062900 (not lt!669335))))

(declare-fun lt!669338 () Unit!51710)

(assert (=> b!1552568 (= lt!669338 e!864322)))

(declare-fun c!143010 () Bool)

(assert (=> b!1552568 (= c!143010 (not lt!669335))))

(assert (=> b!1552568 (= lt!669335 e!864323)))

(declare-fun res!1062903 () Bool)

(assert (=> b!1552568 (=> res!1062903 e!864323)))

(assert (=> b!1552568 (= res!1062903 (bvsge from!762 (size!50560 _keys!618)))))

(assert (=> b!1552568 (= lt!669336 e!864331)))

(assert (=> b!1552568 (= c!143012 (and (not lt!669337) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552568 (= lt!669337 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552569 () Bool)

(assert (=> b!1552569 (= e!864315 tp_is_empty!38211)))

(declare-fun b!1552570 () Bool)

(declare-fun e!864317 () Bool)

(assert (=> b!1552570 (= e!864317 tp_is_empty!38211)))

(declare-fun b!1552571 () Bool)

(declare-fun lt!669334 () Unit!51710)

(assert (=> b!1552571 (= e!864322 lt!669334)))

(declare-fun defaultEntry!478 () Int)

(declare-fun lt!669329 () ListLongMap!22351)

(declare-fun getCurrentListMapNoExtraKeys!6636 (array!103624 array!103626 (_ BitVec 32) (_ BitVec 32) V!59391 V!59391 (_ BitVec 32) Int) ListLongMap!22351)

(assert (=> b!1552571 (= lt!669329 (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669333 () Unit!51710)

(declare-fun addStillContains!1307 (ListLongMap!22351 (_ BitVec 64) V!59391 (_ BitVec 64)) Unit!51710)

(assert (=> b!1552571 (= lt!669333 (addStillContains!1307 lt!669329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669332 () ListLongMap!22351)

(assert (=> b!1552571 (= lt!669332 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1552571 (contains!10131 lt!669332 (select (arr!50010 _keys!618) from!762))))

(declare-fun addApplyDifferent!649 (ListLongMap!22351 (_ BitVec 64) V!59391 (_ BitVec 64)) Unit!51710)

(assert (=> b!1552571 (= lt!669334 (addApplyDifferent!649 lt!669329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669339 () V!59391)

(declare-fun apply!1111 (ListLongMap!22351 (_ BitVec 64)) V!59391)

(assert (=> b!1552571 (= lt!669339 (apply!1111 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669331 () V!59391)

(assert (=> b!1552571 (= lt!669331 (apply!1111 lt!669329 (select (arr!50010 _keys!618) from!762)))))

(assert (=> b!1552571 (= lt!669339 lt!669331)))

(declare-fun lt!669330 () Unit!51710)

(assert (=> b!1552571 (= lt!669330 (addApplyDifferent!649 lt!669329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50010 _keys!618) from!762)))))

(assert (=> b!1552571 (= (apply!1111 lt!669332 (select (arr!50010 _keys!618) from!762)) lt!669331)))

(declare-fun bm!71295 () Bool)

(assert (=> bm!71295 (= call!71299 (contains!10131 lt!669336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552572 () Bool)

(declare-fun e!864330 () Bool)

(assert (=> b!1552572 (= e!864330 (not (= (apply!1111 lt!669336 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!436)))))

(declare-fun b!1552573 () Bool)

(declare-fun res!1062894 () Bool)

(assert (=> b!1552573 (=> (not res!1062894) (not e!864327))))

(assert (=> b!1552573 (= res!1062894 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50560 _keys!618))))))

(declare-fun b!1552574 () Bool)

(assert (=> b!1552574 (= e!864325 e!864330)))

(declare-fun res!1062899 () Bool)

(assert (=> b!1552574 (= res!1062899 (not call!71299))))

(assert (=> b!1552574 (=> res!1062899 e!864330)))

(declare-fun b!1552575 () Bool)

(declare-fun get!26037 (ValueCell!18195 V!59391) V!59391)

(declare-fun dynLambda!3806 (Int (_ BitVec 64)) V!59391)

(assert (=> b!1552575 (= e!864316 (not (= (apply!1111 lt!669336 (select (arr!50010 _keys!618) from!762)) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!71296 () Bool)

(assert (=> bm!71296 (= call!71301 call!71297)))

(declare-fun b!1552576 () Bool)

(declare-fun res!1062902 () Bool)

(assert (=> b!1552576 (=> (not res!1062902) (not e!864327))))

(declare-datatypes ((List!36217 0))(
  ( (Nil!36214) (Cons!36213 (h!37658 (_ BitVec 64)) (t!50935 List!36217)) )
))
(declare-fun arrayNoDuplicates!0 (array!103624 (_ BitVec 32) List!36217) Bool)

(assert (=> b!1552576 (= res!1062902 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36214))))

(declare-fun b!1552577 () Bool)

(declare-fun res!1062897 () Bool)

(assert (=> b!1552577 (=> res!1062897 e!864318)))

(assert (=> b!1552577 (= res!1062897 e!864325)))

(declare-fun c!143011 () Bool)

(assert (=> b!1552577 (= c!143011 (not lt!669337))))

(declare-fun bm!71297 () Bool)

(assert (=> bm!71297 (= call!71300 call!71298)))

(declare-fun b!1552578 () Bool)

(assert (=> b!1552578 (= e!864319 (and e!864317 mapRes!59032))))

(declare-fun condMapEmpty!59032 () Bool)

(declare-fun mapDefault!59032 () ValueCell!18195)

(assert (=> b!1552578 (= condMapEmpty!59032 (= (arr!50011 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18195)) mapDefault!59032)))))

(declare-fun b!1552579 () Bool)

(assert (=> b!1552579 (= e!864326 call!71295)))

(declare-fun b!1552580 () Bool)

(assert (=> b!1552580 (= e!864324 call!71301)))

(declare-fun bm!71298 () Bool)

(assert (=> bm!71298 (= call!71298 (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1552581 () Bool)

(declare-fun e!864329 () Bool)

(assert (=> b!1552581 (= e!864328 e!864329)))

(declare-fun res!1062904 () Bool)

(assert (=> b!1552581 (= res!1062904 (not call!71296))))

(assert (=> b!1552581 (=> res!1062904 e!864329)))

(declare-fun b!1552582 () Bool)

(declare-fun res!1062893 () Bool)

(assert (=> b!1552582 (=> (not res!1062893) (not e!864327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103624 (_ BitVec 32)) Bool)

(assert (=> b!1552582 (= res!1062893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552583 () Bool)

(assert (=> b!1552583 (= e!864329 (not (= (apply!1111 lt!669336 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!436)))))

(assert (= (and start!132308 res!1062901) b!1552557))

(assert (= (and b!1552557 res!1062898) b!1552582))

(assert (= (and b!1552582 res!1062893) b!1552576))

(assert (= (and b!1552576 res!1062902) b!1552573))

(assert (= (and b!1552573 res!1062894) b!1552568))

(assert (= (and b!1552568 c!143012) b!1552565))

(assert (= (and b!1552568 (not c!143012)) b!1552560))

(assert (= (and b!1552560 c!143013) b!1552580))

(assert (= (and b!1552560 (not c!143013)) b!1552558))

(assert (= (and b!1552558 c!143015) b!1552566))

(assert (= (and b!1552558 (not c!143015)) b!1552579))

(assert (= (or b!1552566 b!1552579) bm!71292))

(assert (= (or b!1552580 bm!71292) bm!71297))

(assert (= (or b!1552580 b!1552566) bm!71296))

(assert (= (or b!1552565 bm!71297) bm!71298))

(assert (= (or b!1552565 bm!71296) bm!71294))

(assert (= (and b!1552568 (not res!1062903)) b!1552563))

(assert (= (and b!1552568 c!143010) b!1552571))

(assert (= (and b!1552568 (not c!143010)) b!1552562))

(assert (= (and b!1552568 res!1062900) b!1552564))

(assert (= (and b!1552564 (not res!1062895)) b!1552575))

(assert (= (and b!1552568 (not res!1062896)) b!1552577))

(assert (= (and b!1552577 c!143011) b!1552574))

(assert (= (and b!1552577 (not c!143011)) b!1552561))

(assert (= (and b!1552574 (not res!1062899)) b!1552572))

(assert (= (or b!1552574 b!1552561) bm!71295))

(assert (= (and b!1552577 (not res!1062897)) b!1552567))

(assert (= (and b!1552567 c!143014) b!1552581))

(assert (= (and b!1552567 (not c!143014)) b!1552559))

(assert (= (and b!1552581 (not res!1062904)) b!1552583))

(assert (= (or b!1552581 b!1552559) bm!71293))

(assert (= (and b!1552578 condMapEmpty!59032) mapIsEmpty!59032))

(assert (= (and b!1552578 (not condMapEmpty!59032)) mapNonEmpty!59032))

(get-info :version)

(assert (= (and mapNonEmpty!59032 ((_ is ValueCellFull!18195) mapValue!59032)) b!1552569))

(assert (= (and b!1552578 ((_ is ValueCellFull!18195) mapDefault!59032)) b!1552570))

(assert (= start!132308 b!1552578))

(declare-fun b_lambda!24789 () Bool)

(assert (=> (not b_lambda!24789) (not b!1552575)))

(declare-fun t!50933 () Bool)

(declare-fun tb!12485 () Bool)

(assert (=> (and start!132308 (= defaultEntry!478 defaultEntry!478) t!50933) tb!12485))

(declare-fun result!26089 () Bool)

(assert (=> tb!12485 (= result!26089 tp_is_empty!38211)))

(assert (=> b!1552575 t!50933))

(declare-fun b_and!51377 () Bool)

(assert (= b_and!51375 (and (=> t!50933 result!26089) b_and!51377)))

(declare-fun m!1431009 () Bool)

(assert (=> b!1552582 m!1431009))

(declare-fun m!1431011 () Bool)

(assert (=> b!1552572 m!1431011))

(declare-fun m!1431013 () Bool)

(assert (=> bm!71293 m!1431013))

(declare-fun m!1431015 () Bool)

(assert (=> start!132308 m!1431015))

(declare-fun m!1431017 () Bool)

(assert (=> start!132308 m!1431017))

(declare-fun m!1431019 () Bool)

(assert (=> start!132308 m!1431019))

(declare-fun m!1431021 () Bool)

(assert (=> b!1552583 m!1431021))

(declare-fun m!1431023 () Bool)

(assert (=> b!1552564 m!1431023))

(assert (=> b!1552564 m!1431023))

(declare-fun m!1431025 () Bool)

(assert (=> b!1552564 m!1431025))

(declare-fun m!1431027 () Bool)

(assert (=> mapNonEmpty!59032 m!1431027))

(declare-fun m!1431029 () Bool)

(assert (=> b!1552575 m!1431029))

(assert (=> b!1552575 m!1431023))

(assert (=> b!1552575 m!1431029))

(declare-fun m!1431031 () Bool)

(assert (=> b!1552575 m!1431031))

(declare-fun m!1431033 () Bool)

(assert (=> b!1552575 m!1431033))

(assert (=> b!1552575 m!1431023))

(declare-fun m!1431035 () Bool)

(assert (=> b!1552575 m!1431035))

(assert (=> b!1552575 m!1431031))

(declare-fun m!1431037 () Bool)

(assert (=> bm!71295 m!1431037))

(assert (=> b!1552571 m!1431023))

(declare-fun m!1431039 () Bool)

(assert (=> b!1552571 m!1431039))

(declare-fun m!1431041 () Bool)

(assert (=> b!1552571 m!1431041))

(assert (=> b!1552571 m!1431041))

(assert (=> b!1552571 m!1431023))

(declare-fun m!1431043 () Bool)

(assert (=> b!1552571 m!1431043))

(declare-fun m!1431045 () Bool)

(assert (=> b!1552571 m!1431045))

(assert (=> b!1552571 m!1431023))

(declare-fun m!1431047 () Bool)

(assert (=> b!1552571 m!1431047))

(declare-fun m!1431049 () Bool)

(assert (=> b!1552571 m!1431049))

(assert (=> b!1552571 m!1431023))

(declare-fun m!1431051 () Bool)

(assert (=> b!1552571 m!1431051))

(assert (=> b!1552571 m!1431023))

(declare-fun m!1431053 () Bool)

(assert (=> b!1552571 m!1431053))

(assert (=> b!1552571 m!1431023))

(declare-fun m!1431055 () Bool)

(assert (=> b!1552571 m!1431055))

(assert (=> b!1552571 m!1431023))

(assert (=> b!1552571 m!1431023))

(declare-fun m!1431057 () Bool)

(assert (=> b!1552571 m!1431057))

(declare-fun m!1431059 () Bool)

(assert (=> bm!71294 m!1431059))

(declare-fun m!1431061 () Bool)

(assert (=> b!1552576 m!1431061))

(assert (=> bm!71298 m!1431045))

(assert (=> b!1552563 m!1431023))

(assert (=> b!1552563 m!1431023))

(declare-fun m!1431063 () Bool)

(assert (=> b!1552563 m!1431063))

(declare-fun m!1431065 () Bool)

(assert (=> b!1552565 m!1431065))

(check-sat (not b!1552583) (not b!1552563) (not bm!71293) (not b!1552582) (not b_next!31935) tp_is_empty!38211 (not bm!71295) (not bm!71298) (not b_lambda!24789) (not mapNonEmpty!59032) (not start!132308) (not bm!71294) (not b!1552564) (not b!1552575) (not b!1552565) b_and!51377 (not b!1552571) (not b!1552576) (not b!1552572))
(check-sat b_and!51377 (not b_next!31935))
(get-model)

(declare-fun b_lambda!24793 () Bool)

(assert (= b_lambda!24789 (or (and start!132308 b_free!31935) b_lambda!24793)))

(check-sat (not b!1552583) (not b!1552563) (not bm!71293) (not b!1552582) (not b_next!31935) tp_is_empty!38211 (not bm!71295) (not bm!71298) (not mapNonEmpty!59032) (not start!132308) (not b_lambda!24793) (not bm!71294) (not b!1552564) (not b!1552575) (not b!1552565) b_and!51377 (not b!1552571) (not b!1552576) (not b!1552572))
(check-sat b_and!51377 (not b_next!31935))
(get-model)

(declare-fun d!161045 () Bool)

(declare-fun res!1062948 () Bool)

(declare-fun e!864394 () Bool)

(assert (=> d!161045 (=> res!1062948 e!864394)))

(assert (=> d!161045 (= res!1062948 (bvsge #b00000000000000000000000000000000 (size!50560 _keys!618)))))

(assert (=> d!161045 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36214) e!864394)))

(declare-fun b!1552679 () Bool)

(declare-fun e!864393 () Bool)

(assert (=> b!1552679 (= e!864394 e!864393)))

(declare-fun res!1062947 () Bool)

(assert (=> b!1552679 (=> (not res!1062947) (not e!864393))))

(declare-fun e!864392 () Bool)

(assert (=> b!1552679 (= res!1062947 (not e!864392))))

(declare-fun res!1062949 () Bool)

(assert (=> b!1552679 (=> (not res!1062949) (not e!864392))))

(assert (=> b!1552679 (= res!1062949 (validKeyInArray!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1552680 () Bool)

(declare-fun e!864391 () Bool)

(assert (=> b!1552680 (= e!864393 e!864391)))

(declare-fun c!143036 () Bool)

(assert (=> b!1552680 (= c!143036 (validKeyInArray!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun bm!71322 () Bool)

(declare-fun call!71325 () Bool)

(assert (=> bm!71322 (= call!71325 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)))))

(declare-fun b!1552681 () Bool)

(assert (=> b!1552681 (= e!864391 call!71325)))

(declare-fun b!1552682 () Bool)

(assert (=> b!1552682 (= e!864391 call!71325)))

(declare-fun b!1552683 () Bool)

(declare-fun contains!10133 (List!36217 (_ BitVec 64)) Bool)

(assert (=> b!1552683 (= e!864392 (contains!10133 Nil!36214 (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!161045 (not res!1062948)) b!1552679))

(assert (= (and b!1552679 res!1062949) b!1552683))

(assert (= (and b!1552679 res!1062947) b!1552680))

(assert (= (and b!1552680 c!143036) b!1552681))

(assert (= (and b!1552680 (not c!143036)) b!1552682))

(assert (= (or b!1552681 b!1552682) bm!71322))

(declare-fun m!1431125 () Bool)

(assert (=> b!1552679 m!1431125))

(assert (=> b!1552679 m!1431125))

(declare-fun m!1431127 () Bool)

(assert (=> b!1552679 m!1431127))

(assert (=> b!1552680 m!1431125))

(assert (=> b!1552680 m!1431125))

(assert (=> b!1552680 m!1431127))

(assert (=> bm!71322 m!1431125))

(declare-fun m!1431129 () Bool)

(assert (=> bm!71322 m!1431129))

(assert (=> b!1552683 m!1431125))

(assert (=> b!1552683 m!1431125))

(declare-fun m!1431131 () Bool)

(assert (=> b!1552683 m!1431131))

(assert (=> b!1552576 d!161045))

(declare-fun d!161047 () Bool)

(assert (=> d!161047 (= (apply!1111 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50010 _keys!618) from!762)) (apply!1111 lt!669329 (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669375 () Unit!51710)

(declare-fun choose!2035 (ListLongMap!22351 (_ BitVec 64) V!59391 (_ BitVec 64)) Unit!51710)

(assert (=> d!161047 (= lt!669375 (choose!2035 lt!669329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50010 _keys!618) from!762)))))

(declare-fun e!864397 () Bool)

(assert (=> d!161047 e!864397))

(declare-fun res!1062952 () Bool)

(assert (=> d!161047 (=> (not res!1062952) (not e!864397))))

(assert (=> d!161047 (= res!1062952 (contains!10131 lt!669329 (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161047 (= (addApplyDifferent!649 lt!669329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50010 _keys!618) from!762)) lt!669375)))

(declare-fun b!1552687 () Bool)

(assert (=> b!1552687 (= e!864397 (not (= (select (arr!50010 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161047 res!1062952) b!1552687))

(assert (=> d!161047 m!1431041))

(assert (=> d!161047 m!1431041))

(assert (=> d!161047 m!1431023))

(assert (=> d!161047 m!1431043))

(assert (=> d!161047 m!1431023))

(declare-fun m!1431133 () Bool)

(assert (=> d!161047 m!1431133))

(assert (=> d!161047 m!1431023))

(declare-fun m!1431135 () Bool)

(assert (=> d!161047 m!1431135))

(assert (=> d!161047 m!1431023))

(assert (=> d!161047 m!1431053))

(assert (=> b!1552571 d!161047))

(declare-fun d!161049 () Bool)

(assert (=> d!161049 (= (apply!1111 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50010 _keys!618) from!762)) (apply!1111 lt!669329 (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669376 () Unit!51710)

(assert (=> d!161049 (= lt!669376 (choose!2035 lt!669329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50010 _keys!618) from!762)))))

(declare-fun e!864398 () Bool)

(assert (=> d!161049 e!864398))

(declare-fun res!1062953 () Bool)

(assert (=> d!161049 (=> (not res!1062953) (not e!864398))))

(assert (=> d!161049 (= res!1062953 (contains!10131 lt!669329 (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161049 (= (addApplyDifferent!649 lt!669329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50010 _keys!618) from!762)) lt!669376)))

(declare-fun b!1552688 () Bool)

(assert (=> b!1552688 (= e!864398 (not (= (select (arr!50010 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161049 res!1062953) b!1552688))

(assert (=> d!161049 m!1431049))

(assert (=> d!161049 m!1431049))

(assert (=> d!161049 m!1431023))

(declare-fun m!1431137 () Bool)

(assert (=> d!161049 m!1431137))

(assert (=> d!161049 m!1431023))

(declare-fun m!1431139 () Bool)

(assert (=> d!161049 m!1431139))

(assert (=> d!161049 m!1431023))

(assert (=> d!161049 m!1431135))

(assert (=> d!161049 m!1431023))

(assert (=> d!161049 m!1431053))

(assert (=> b!1552571 d!161049))

(declare-fun d!161051 () Bool)

(declare-fun e!864404 () Bool)

(assert (=> d!161051 e!864404))

(declare-fun res!1062956 () Bool)

(assert (=> d!161051 (=> res!1062956 e!864404)))

(declare-fun lt!669386 () Bool)

(assert (=> d!161051 (= res!1062956 (not lt!669386))))

(declare-fun lt!669387 () Bool)

(assert (=> d!161051 (= lt!669386 lt!669387)))

(declare-fun lt!669385 () Unit!51710)

(declare-fun e!864403 () Unit!51710)

(assert (=> d!161051 (= lt!669385 e!864403)))

(declare-fun c!143039 () Bool)

(assert (=> d!161051 (= c!143039 lt!669387)))

(declare-fun containsKey!754 (List!36216 (_ BitVec 64)) Bool)

(assert (=> d!161051 (= lt!669387 (containsKey!754 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161051 (= (contains!10131 lt!669332 (select (arr!50010 _keys!618) from!762)) lt!669386)))

(declare-fun b!1552695 () Bool)

(declare-fun lt!669388 () Unit!51710)

(assert (=> b!1552695 (= e!864403 lt!669388)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!500 (List!36216 (_ BitVec 64)) Unit!51710)

(assert (=> b!1552695 (= lt!669388 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)))))

(declare-datatypes ((Option!808 0))(
  ( (Some!807 (v!21990 V!59391)) (None!806) )
))
(declare-fun isDefined!548 (Option!808) Bool)

(declare-fun getValueByKey!732 (List!36216 (_ BitVec 64)) Option!808)

(assert (=> b!1552695 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)))))

(declare-fun b!1552696 () Bool)

(declare-fun Unit!51713 () Unit!51710)

(assert (=> b!1552696 (= e!864403 Unit!51713)))

(declare-fun b!1552697 () Bool)

(assert (=> b!1552697 (= e!864404 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762))))))

(assert (= (and d!161051 c!143039) b!1552695))

(assert (= (and d!161051 (not c!143039)) b!1552696))

(assert (= (and d!161051 (not res!1062956)) b!1552697))

(assert (=> d!161051 m!1431023))

(declare-fun m!1431141 () Bool)

(assert (=> d!161051 m!1431141))

(assert (=> b!1552695 m!1431023))

(declare-fun m!1431143 () Bool)

(assert (=> b!1552695 m!1431143))

(assert (=> b!1552695 m!1431023))

(declare-fun m!1431145 () Bool)

(assert (=> b!1552695 m!1431145))

(assert (=> b!1552695 m!1431145))

(declare-fun m!1431147 () Bool)

(assert (=> b!1552695 m!1431147))

(assert (=> b!1552697 m!1431023))

(assert (=> b!1552697 m!1431145))

(assert (=> b!1552697 m!1431145))

(assert (=> b!1552697 m!1431147))

(assert (=> b!1552571 d!161051))

(declare-fun d!161053 () Bool)

(declare-fun e!864407 () Bool)

(assert (=> d!161053 e!864407))

(declare-fun res!1062962 () Bool)

(assert (=> d!161053 (=> (not res!1062962) (not e!864407))))

(declare-fun lt!669399 () ListLongMap!22351)

(assert (=> d!161053 (= res!1062962 (contains!10131 lt!669399 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669398 () List!36216)

(assert (=> d!161053 (= lt!669399 (ListLongMap!22352 lt!669398))))

(declare-fun lt!669400 () Unit!51710)

(declare-fun lt!669397 () Unit!51710)

(assert (=> d!161053 (= lt!669400 lt!669397)))

(assert (=> d!161053 (= (getValueByKey!732 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!374 (List!36216 (_ BitVec 64) V!59391) Unit!51710)

(assert (=> d!161053 (= lt!669397 (lemmaContainsTupThenGetReturnValue!374 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun insertStrictlySorted!503 (List!36216 (_ BitVec 64) V!59391) List!36216)

(assert (=> d!161053 (= lt!669398 (insertStrictlySorted!503 (toList!11191 lt!669329) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161053 (= (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669399)))

(declare-fun b!1552702 () Bool)

(declare-fun res!1062961 () Bool)

(assert (=> b!1552702 (=> (not res!1062961) (not e!864407))))

(assert (=> b!1552702 (= res!1062961 (= (getValueByKey!732 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552703 () Bool)

(declare-fun contains!10134 (List!36216 tuple2!24742) Bool)

(assert (=> b!1552703 (= e!864407 (contains!10134 (toList!11191 lt!669399) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161053 res!1062962) b!1552702))

(assert (= (and b!1552702 res!1062961) b!1552703))

(declare-fun m!1431149 () Bool)

(assert (=> d!161053 m!1431149))

(declare-fun m!1431151 () Bool)

(assert (=> d!161053 m!1431151))

(declare-fun m!1431153 () Bool)

(assert (=> d!161053 m!1431153))

(declare-fun m!1431155 () Bool)

(assert (=> d!161053 m!1431155))

(declare-fun m!1431157 () Bool)

(assert (=> b!1552702 m!1431157))

(declare-fun m!1431159 () Bool)

(assert (=> b!1552703 m!1431159))

(assert (=> b!1552571 d!161053))

(declare-fun d!161055 () Bool)

(assert (=> d!161055 (contains!10131 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50010 _keys!618) from!762))))

(declare-fun lt!669403 () Unit!51710)

(declare-fun choose!2036 (ListLongMap!22351 (_ BitVec 64) V!59391 (_ BitVec 64)) Unit!51710)

(assert (=> d!161055 (= lt!669403 (choose!2036 lt!669329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161055 (contains!10131 lt!669329 (select (arr!50010 _keys!618) from!762))))

(assert (=> d!161055 (= (addStillContains!1307 lt!669329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50010 _keys!618) from!762)) lt!669403)))

(declare-fun bs!44601 () Bool)

(assert (= bs!44601 d!161055))

(assert (=> bs!44601 m!1431049))

(assert (=> bs!44601 m!1431049))

(assert (=> bs!44601 m!1431023))

(declare-fun m!1431161 () Bool)

(assert (=> bs!44601 m!1431161))

(assert (=> bs!44601 m!1431023))

(declare-fun m!1431163 () Bool)

(assert (=> bs!44601 m!1431163))

(assert (=> bs!44601 m!1431023))

(assert (=> bs!44601 m!1431135))

(assert (=> b!1552571 d!161055))

(declare-fun d!161057 () Bool)

(declare-fun get!26039 (Option!808) V!59391)

(assert (=> d!161057 (= (apply!1111 lt!669332 (select (arr!50010 _keys!618) from!762)) (get!26039 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762))))))

(declare-fun bs!44602 () Bool)

(assert (= bs!44602 d!161057))

(assert (=> bs!44602 m!1431023))

(assert (=> bs!44602 m!1431145))

(assert (=> bs!44602 m!1431145))

(declare-fun m!1431165 () Bool)

(assert (=> bs!44602 m!1431165))

(assert (=> b!1552571 d!161057))

(declare-fun d!161059 () Bool)

(assert (=> d!161059 (= (apply!1111 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50010 _keys!618) from!762)) (get!26039 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50010 _keys!618) from!762))))))

(declare-fun bs!44603 () Bool)

(assert (= bs!44603 d!161059))

(assert (=> bs!44603 m!1431023))

(declare-fun m!1431167 () Bool)

(assert (=> bs!44603 m!1431167))

(assert (=> bs!44603 m!1431167))

(declare-fun m!1431169 () Bool)

(assert (=> bs!44603 m!1431169))

(assert (=> b!1552571 d!161059))

(declare-fun d!161061 () Bool)

(declare-fun e!864408 () Bool)

(assert (=> d!161061 e!864408))

(declare-fun res!1062964 () Bool)

(assert (=> d!161061 (=> (not res!1062964) (not e!864408))))

(declare-fun lt!669406 () ListLongMap!22351)

(assert (=> d!161061 (= res!1062964 (contains!10131 lt!669406 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!669405 () List!36216)

(assert (=> d!161061 (= lt!669406 (ListLongMap!22352 lt!669405))))

(declare-fun lt!669407 () Unit!51710)

(declare-fun lt!669404 () Unit!51710)

(assert (=> d!161061 (= lt!669407 lt!669404)))

(assert (=> d!161061 (= (getValueByKey!732 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161061 (= lt!669404 (lemmaContainsTupThenGetReturnValue!374 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161061 (= lt!669405 (insertStrictlySorted!503 (toList!11191 lt!669329) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161061 (= (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!669406)))

(declare-fun b!1552705 () Bool)

(declare-fun res!1062963 () Bool)

(assert (=> b!1552705 (=> (not res!1062963) (not e!864408))))

(assert (=> b!1552705 (= res!1062963 (= (getValueByKey!732 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1552706 () Bool)

(assert (=> b!1552706 (= e!864408 (contains!10134 (toList!11191 lt!669406) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161061 res!1062964) b!1552705))

(assert (= (and b!1552705 res!1062963) b!1552706))

(declare-fun m!1431171 () Bool)

(assert (=> d!161061 m!1431171))

(declare-fun m!1431173 () Bool)

(assert (=> d!161061 m!1431173))

(declare-fun m!1431175 () Bool)

(assert (=> d!161061 m!1431175))

(declare-fun m!1431177 () Bool)

(assert (=> d!161061 m!1431177))

(declare-fun m!1431179 () Bool)

(assert (=> b!1552705 m!1431179))

(declare-fun m!1431181 () Bool)

(assert (=> b!1552706 m!1431181))

(assert (=> b!1552571 d!161061))

(declare-fun b!1552732 () Bool)

(declare-fun e!864428 () Bool)

(declare-fun e!864427 () Bool)

(assert (=> b!1552732 (= e!864428 e!864427)))

(declare-fun c!143051 () Bool)

(assert (=> b!1552732 (= c!143051 (bvslt from!762 (size!50560 _keys!618)))))

(declare-fun b!1552733 () Bool)

(assert (=> b!1552733 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50560 _keys!618)))))

(assert (=> b!1552733 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50561 _values!470)))))

(declare-fun e!864426 () Bool)

(declare-fun lt!669428 () ListLongMap!22351)

(assert (=> b!1552733 (= e!864426 (= (apply!1111 lt!669428 (select (arr!50010 _keys!618) from!762)) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552734 () Bool)

(declare-fun e!864429 () Bool)

(assert (=> b!1552734 (= e!864429 (validKeyInArray!0 (select (arr!50010 _keys!618) from!762)))))

(assert (=> b!1552734 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun b!1552735 () Bool)

(declare-fun res!1062976 () Bool)

(declare-fun e!864425 () Bool)

(assert (=> b!1552735 (=> (not res!1062976) (not e!864425))))

(assert (=> b!1552735 (= res!1062976 (not (contains!10131 lt!669428 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552736 () Bool)

(declare-fun e!864423 () ListLongMap!22351)

(declare-fun e!864424 () ListLongMap!22351)

(assert (=> b!1552736 (= e!864423 e!864424)))

(declare-fun c!143049 () Bool)

(assert (=> b!1552736 (= c!143049 (validKeyInArray!0 (select (arr!50010 _keys!618) from!762)))))

(declare-fun b!1552737 () Bool)

(declare-fun call!71328 () ListLongMap!22351)

(assert (=> b!1552737 (= e!864424 call!71328)))

(declare-fun b!1552738 () Bool)

(assert (=> b!1552738 (= e!864425 e!864428)))

(declare-fun c!143050 () Bool)

(assert (=> b!1552738 (= c!143050 e!864429)))

(declare-fun res!1062973 () Bool)

(assert (=> b!1552738 (=> (not res!1062973) (not e!864429))))

(assert (=> b!1552738 (= res!1062973 (bvslt from!762 (size!50560 _keys!618)))))

(declare-fun b!1552739 () Bool)

(assert (=> b!1552739 (= e!864423 (ListLongMap!22352 Nil!36213))))

(declare-fun b!1552731 () Bool)

(declare-fun isEmpty!1132 (ListLongMap!22351) Bool)

(assert (=> b!1552731 (= e!864427 (isEmpty!1132 lt!669428))))

(declare-fun d!161063 () Bool)

(assert (=> d!161063 e!864425))

(declare-fun res!1062975 () Bool)

(assert (=> d!161063 (=> (not res!1062975) (not e!864425))))

(assert (=> d!161063 (= res!1062975 (not (contains!10131 lt!669428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161063 (= lt!669428 e!864423)))

(declare-fun c!143048 () Bool)

(assert (=> d!161063 (= c!143048 (bvsge from!762 (size!50560 _keys!618)))))

(assert (=> d!161063 (validMask!0 mask!926)))

(assert (=> d!161063 (= (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!669428)))

(declare-fun b!1552740 () Bool)

(assert (=> b!1552740 (= e!864428 e!864426)))

(assert (=> b!1552740 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50560 _keys!618)))))

(declare-fun res!1062974 () Bool)

(assert (=> b!1552740 (= res!1062974 (contains!10131 lt!669428 (select (arr!50010 _keys!618) from!762)))))

(assert (=> b!1552740 (=> (not res!1062974) (not e!864426))))

(declare-fun b!1552741 () Bool)

(assert (=> b!1552741 (= e!864427 (= lt!669428 (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1552742 () Bool)

(declare-fun lt!669426 () Unit!51710)

(declare-fun lt!669424 () Unit!51710)

(assert (=> b!1552742 (= lt!669426 lt!669424)))

(declare-fun lt!669427 () V!59391)

(declare-fun lt!669422 () (_ BitVec 64))

(declare-fun lt!669425 () (_ BitVec 64))

(declare-fun lt!669423 () ListLongMap!22351)

(assert (=> b!1552742 (not (contains!10131 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)) lt!669422))))

(declare-fun addStillNotContains!513 (ListLongMap!22351 (_ BitVec 64) V!59391 (_ BitVec 64)) Unit!51710)

(assert (=> b!1552742 (= lt!669424 (addStillNotContains!513 lt!669423 lt!669425 lt!669427 lt!669422))))

(assert (=> b!1552742 (= lt!669422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1552742 (= lt!669427 (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1552742 (= lt!669425 (select (arr!50010 _keys!618) from!762))))

(assert (=> b!1552742 (= lt!669423 call!71328)))

(assert (=> b!1552742 (= e!864424 (+!5011 call!71328 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!71325 () Bool)

(assert (=> bm!71325 (= call!71328 (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(assert (= (and d!161063 c!143048) b!1552739))

(assert (= (and d!161063 (not c!143048)) b!1552736))

(assert (= (and b!1552736 c!143049) b!1552742))

(assert (= (and b!1552736 (not c!143049)) b!1552737))

(assert (= (or b!1552742 b!1552737) bm!71325))

(assert (= (and d!161063 res!1062975) b!1552735))

(assert (= (and b!1552735 res!1062976) b!1552738))

(assert (= (and b!1552738 res!1062973) b!1552734))

(assert (= (and b!1552738 c!143050) b!1552740))

(assert (= (and b!1552738 (not c!143050)) b!1552732))

(assert (= (and b!1552740 res!1062974) b!1552733))

(assert (= (and b!1552732 c!143051) b!1552741))

(assert (= (and b!1552732 (not c!143051)) b!1552731))

(declare-fun b_lambda!24795 () Bool)

(assert (=> (not b_lambda!24795) (not b!1552733)))

(assert (=> b!1552733 t!50933))

(declare-fun b_and!51383 () Bool)

(assert (= b_and!51377 (and (=> t!50933 result!26089) b_and!51383)))

(declare-fun b_lambda!24797 () Bool)

(assert (=> (not b_lambda!24797) (not b!1552742)))

(assert (=> b!1552742 t!50933))

(declare-fun b_and!51385 () Bool)

(assert (= b_and!51383 (and (=> t!50933 result!26089) b_and!51385)))

(declare-fun m!1431183 () Bool)

(assert (=> d!161063 m!1431183))

(assert (=> d!161063 m!1431015))

(declare-fun m!1431185 () Bool)

(assert (=> bm!71325 m!1431185))

(declare-fun m!1431187 () Bool)

(assert (=> b!1552735 m!1431187))

(assert (=> b!1552736 m!1431023))

(assert (=> b!1552736 m!1431023))

(assert (=> b!1552736 m!1431063))

(declare-fun m!1431189 () Bool)

(assert (=> b!1552731 m!1431189))

(assert (=> b!1552740 m!1431023))

(assert (=> b!1552740 m!1431023))

(declare-fun m!1431191 () Bool)

(assert (=> b!1552740 m!1431191))

(assert (=> b!1552741 m!1431185))

(declare-fun m!1431193 () Bool)

(assert (=> b!1552742 m!1431193))

(declare-fun m!1431195 () Bool)

(assert (=> b!1552742 m!1431195))

(declare-fun m!1431197 () Bool)

(assert (=> b!1552742 m!1431197))

(assert (=> b!1552742 m!1431029))

(assert (=> b!1552742 m!1431031))

(assert (=> b!1552742 m!1431033))

(assert (=> b!1552742 m!1431029))

(assert (=> b!1552742 m!1431031))

(assert (=> b!1552742 m!1431193))

(assert (=> b!1552742 m!1431023))

(declare-fun m!1431199 () Bool)

(assert (=> b!1552742 m!1431199))

(assert (=> b!1552734 m!1431023))

(assert (=> b!1552734 m!1431023))

(assert (=> b!1552734 m!1431063))

(assert (=> b!1552733 m!1431029))

(assert (=> b!1552733 m!1431031))

(assert (=> b!1552733 m!1431033))

(assert (=> b!1552733 m!1431029))

(assert (=> b!1552733 m!1431023))

(declare-fun m!1431201 () Bool)

(assert (=> b!1552733 m!1431201))

(assert (=> b!1552733 m!1431031))

(assert (=> b!1552733 m!1431023))

(assert (=> b!1552571 d!161063))

(declare-fun d!161065 () Bool)

(assert (=> d!161065 (= (apply!1111 lt!669329 (select (arr!50010 _keys!618) from!762)) (get!26039 (getValueByKey!732 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762))))))

(declare-fun bs!44604 () Bool)

(assert (= bs!44604 d!161065))

(assert (=> bs!44604 m!1431023))

(declare-fun m!1431203 () Bool)

(assert (=> bs!44604 m!1431203))

(assert (=> bs!44604 m!1431203))

(declare-fun m!1431205 () Bool)

(assert (=> bs!44604 m!1431205))

(assert (=> b!1552571 d!161065))

(declare-fun d!161067 () Bool)

(assert (=> d!161067 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132308 d!161067))

(declare-fun d!161069 () Bool)

(assert (=> d!161069 (= (array_inv!38877 _keys!618) (bvsge (size!50560 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132308 d!161069))

(declare-fun d!161071 () Bool)

(assert (=> d!161071 (= (array_inv!38878 _values!470) (bvsge (size!50561 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132308 d!161071))

(declare-fun d!161073 () Bool)

(declare-fun e!864431 () Bool)

(assert (=> d!161073 e!864431))

(declare-fun res!1062977 () Bool)

(assert (=> d!161073 (=> res!1062977 e!864431)))

(declare-fun lt!669430 () Bool)

(assert (=> d!161073 (= res!1062977 (not lt!669430))))

(declare-fun lt!669431 () Bool)

(assert (=> d!161073 (= lt!669430 lt!669431)))

(declare-fun lt!669429 () Unit!51710)

(declare-fun e!864430 () Unit!51710)

(assert (=> d!161073 (= lt!669429 e!864430)))

(declare-fun c!143052 () Bool)

(assert (=> d!161073 (= c!143052 lt!669431)))

(assert (=> d!161073 (= lt!669431 (containsKey!754 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161073 (= (contains!10131 lt!669336 (select (arr!50010 _keys!618) from!762)) lt!669430)))

(declare-fun b!1552743 () Bool)

(declare-fun lt!669432 () Unit!51710)

(assert (=> b!1552743 (= e!864430 lt!669432)))

(assert (=> b!1552743 (= lt!669432 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)))))

(assert (=> b!1552743 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)))))

(declare-fun b!1552744 () Bool)

(declare-fun Unit!51714 () Unit!51710)

(assert (=> b!1552744 (= e!864430 Unit!51714)))

(declare-fun b!1552745 () Bool)

(assert (=> b!1552745 (= e!864431 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762))))))

(assert (= (and d!161073 c!143052) b!1552743))

(assert (= (and d!161073 (not c!143052)) b!1552744))

(assert (= (and d!161073 (not res!1062977)) b!1552745))

(assert (=> d!161073 m!1431023))

(declare-fun m!1431207 () Bool)

(assert (=> d!161073 m!1431207))

(assert (=> b!1552743 m!1431023))

(declare-fun m!1431209 () Bool)

(assert (=> b!1552743 m!1431209))

(assert (=> b!1552743 m!1431023))

(declare-fun m!1431211 () Bool)

(assert (=> b!1552743 m!1431211))

(assert (=> b!1552743 m!1431211))

(declare-fun m!1431213 () Bool)

(assert (=> b!1552743 m!1431213))

(assert (=> b!1552745 m!1431023))

(assert (=> b!1552745 m!1431211))

(assert (=> b!1552745 m!1431211))

(assert (=> b!1552745 m!1431213))

(assert (=> b!1552564 d!161073))

(declare-fun d!161075 () Bool)

(assert (=> d!161075 (= (validKeyInArray!0 (select (arr!50010 _keys!618) from!762)) (and (not (= (select (arr!50010 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50010 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1552563 d!161075))

(declare-fun d!161077 () Bool)

(assert (=> d!161077 (= (apply!1111 lt!669336 #b0000000000000000000000000000000000000000000000000000000000000000) (get!26039 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!44605 () Bool)

(assert (= bs!44605 d!161077))

(declare-fun m!1431215 () Bool)

(assert (=> bs!44605 m!1431215))

(assert (=> bs!44605 m!1431215))

(declare-fun m!1431217 () Bool)

(assert (=> bs!44605 m!1431217))

(assert (=> b!1552572 d!161077))

(assert (=> bm!71298 d!161063))

(declare-fun d!161079 () Bool)

(declare-fun e!864432 () Bool)

(assert (=> d!161079 e!864432))

(declare-fun res!1062979 () Bool)

(assert (=> d!161079 (=> (not res!1062979) (not e!864432))))

(declare-fun lt!669435 () ListLongMap!22351)

(assert (=> d!161079 (= res!1062979 (contains!10131 lt!669435 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669434 () List!36216)

(assert (=> d!161079 (= lt!669435 (ListLongMap!22352 lt!669434))))

(declare-fun lt!669436 () Unit!51710)

(declare-fun lt!669433 () Unit!51710)

(assert (=> d!161079 (= lt!669436 lt!669433)))

(assert (=> d!161079 (= (getValueByKey!732 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!807 (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161079 (= lt!669433 (lemmaContainsTupThenGetReturnValue!374 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161079 (= lt!669434 (insertStrictlySorted!503 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161079 (= (+!5011 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669435)))

(declare-fun b!1552746 () Bool)

(declare-fun res!1062978 () Bool)

(assert (=> b!1552746 (=> (not res!1062978) (not e!864432))))

(assert (=> b!1552746 (= res!1062978 (= (getValueByKey!732 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!807 (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552747 () Bool)

(assert (=> b!1552747 (= e!864432 (contains!10134 (toList!11191 lt!669435) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161079 res!1062979) b!1552746))

(assert (= (and b!1552746 res!1062978) b!1552747))

(declare-fun m!1431219 () Bool)

(assert (=> d!161079 m!1431219))

(declare-fun m!1431221 () Bool)

(assert (=> d!161079 m!1431221))

(declare-fun m!1431223 () Bool)

(assert (=> d!161079 m!1431223))

(declare-fun m!1431225 () Bool)

(assert (=> d!161079 m!1431225))

(declare-fun m!1431227 () Bool)

(assert (=> b!1552746 m!1431227))

(declare-fun m!1431229 () Bool)

(assert (=> b!1552747 m!1431229))

(assert (=> bm!71294 d!161079))

(declare-fun d!161081 () Bool)

(declare-fun e!864434 () Bool)

(assert (=> d!161081 e!864434))

(declare-fun res!1062980 () Bool)

(assert (=> d!161081 (=> res!1062980 e!864434)))

(declare-fun lt!669438 () Bool)

(assert (=> d!161081 (= res!1062980 (not lt!669438))))

(declare-fun lt!669439 () Bool)

(assert (=> d!161081 (= lt!669438 lt!669439)))

(declare-fun lt!669437 () Unit!51710)

(declare-fun e!864433 () Unit!51710)

(assert (=> d!161081 (= lt!669437 e!864433)))

(declare-fun c!143053 () Bool)

(assert (=> d!161081 (= c!143053 lt!669439)))

(assert (=> d!161081 (= lt!669439 (containsKey!754 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161081 (= (contains!10131 lt!669336 #b1000000000000000000000000000000000000000000000000000000000000000) lt!669438)))

(declare-fun b!1552748 () Bool)

(declare-fun lt!669440 () Unit!51710)

(assert (=> b!1552748 (= e!864433 lt!669440)))

(assert (=> b!1552748 (= lt!669440 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552748 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552749 () Bool)

(declare-fun Unit!51715 () Unit!51710)

(assert (=> b!1552749 (= e!864433 Unit!51715)))

(declare-fun b!1552750 () Bool)

(assert (=> b!1552750 (= e!864434 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161081 c!143053) b!1552748))

(assert (= (and d!161081 (not c!143053)) b!1552749))

(assert (= (and d!161081 (not res!1062980)) b!1552750))

(declare-fun m!1431231 () Bool)

(assert (=> d!161081 m!1431231))

(declare-fun m!1431233 () Bool)

(assert (=> b!1552748 m!1431233))

(declare-fun m!1431235 () Bool)

(assert (=> b!1552748 m!1431235))

(assert (=> b!1552748 m!1431235))

(declare-fun m!1431237 () Bool)

(assert (=> b!1552748 m!1431237))

(assert (=> b!1552750 m!1431235))

(assert (=> b!1552750 m!1431235))

(assert (=> b!1552750 m!1431237))

(assert (=> bm!71293 d!161081))

(declare-fun d!161083 () Bool)

(declare-fun e!864436 () Bool)

(assert (=> d!161083 e!864436))

(declare-fun res!1062981 () Bool)

(assert (=> d!161083 (=> res!1062981 e!864436)))

(declare-fun lt!669442 () Bool)

(assert (=> d!161083 (= res!1062981 (not lt!669442))))

(declare-fun lt!669443 () Bool)

(assert (=> d!161083 (= lt!669442 lt!669443)))

(declare-fun lt!669441 () Unit!51710)

(declare-fun e!864435 () Unit!51710)

(assert (=> d!161083 (= lt!669441 e!864435)))

(declare-fun c!143054 () Bool)

(assert (=> d!161083 (= c!143054 lt!669443)))

(assert (=> d!161083 (= lt!669443 (containsKey!754 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161083 (= (contains!10131 lt!669336 #b0000000000000000000000000000000000000000000000000000000000000000) lt!669442)))

(declare-fun b!1552751 () Bool)

(declare-fun lt!669444 () Unit!51710)

(assert (=> b!1552751 (= e!864435 lt!669444)))

(assert (=> b!1552751 (= lt!669444 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552751 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552752 () Bool)

(declare-fun Unit!51716 () Unit!51710)

(assert (=> b!1552752 (= e!864435 Unit!51716)))

(declare-fun b!1552753 () Bool)

(assert (=> b!1552753 (= e!864436 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161083 c!143054) b!1552751))

(assert (= (and d!161083 (not c!143054)) b!1552752))

(assert (= (and d!161083 (not res!1062981)) b!1552753))

(declare-fun m!1431239 () Bool)

(assert (=> d!161083 m!1431239))

(declare-fun m!1431241 () Bool)

(assert (=> b!1552751 m!1431241))

(assert (=> b!1552751 m!1431215))

(assert (=> b!1552751 m!1431215))

(declare-fun m!1431243 () Bool)

(assert (=> b!1552751 m!1431243))

(assert (=> b!1552753 m!1431215))

(assert (=> b!1552753 m!1431215))

(assert (=> b!1552753 m!1431243))

(assert (=> bm!71295 d!161083))

(declare-fun d!161085 () Bool)

(assert (=> d!161085 (= (apply!1111 lt!669336 #b1000000000000000000000000000000000000000000000000000000000000000) (get!26039 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!44606 () Bool)

(assert (= bs!44606 d!161085))

(assert (=> bs!44606 m!1431235))

(assert (=> bs!44606 m!1431235))

(declare-fun m!1431245 () Bool)

(assert (=> bs!44606 m!1431245))

(assert (=> b!1552583 d!161085))

(declare-fun d!161087 () Bool)

(declare-fun e!864437 () Bool)

(assert (=> d!161087 e!864437))

(declare-fun res!1062983 () Bool)

(assert (=> d!161087 (=> (not res!1062983) (not e!864437))))

(declare-fun lt!669447 () ListLongMap!22351)

(assert (=> d!161087 (= res!1062983 (contains!10131 lt!669447 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669446 () List!36216)

(assert (=> d!161087 (= lt!669447 (ListLongMap!22352 lt!669446))))

(declare-fun lt!669448 () Unit!51710)

(declare-fun lt!669445 () Unit!51710)

(assert (=> d!161087 (= lt!669448 lt!669445)))

(assert (=> d!161087 (= (getValueByKey!732 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161087 (= lt!669445 (lemmaContainsTupThenGetReturnValue!374 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161087 (= lt!669446 (insertStrictlySorted!503 (toList!11191 call!71297) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161087 (= (+!5011 call!71297 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669447)))

(declare-fun b!1552754 () Bool)

(declare-fun res!1062982 () Bool)

(assert (=> b!1552754 (=> (not res!1062982) (not e!864437))))

(assert (=> b!1552754 (= res!1062982 (= (getValueByKey!732 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552755 () Bool)

(assert (=> b!1552755 (= e!864437 (contains!10134 (toList!11191 lt!669447) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161087 res!1062983) b!1552754))

(assert (= (and b!1552754 res!1062982) b!1552755))

(declare-fun m!1431247 () Bool)

(assert (=> d!161087 m!1431247))

(declare-fun m!1431249 () Bool)

(assert (=> d!161087 m!1431249))

(declare-fun m!1431251 () Bool)

(assert (=> d!161087 m!1431251))

(declare-fun m!1431253 () Bool)

(assert (=> d!161087 m!1431253))

(declare-fun m!1431255 () Bool)

(assert (=> b!1552754 m!1431255))

(declare-fun m!1431257 () Bool)

(assert (=> b!1552755 m!1431257))

(assert (=> b!1552565 d!161087))

(declare-fun d!161089 () Bool)

(assert (=> d!161089 (= (apply!1111 lt!669336 (select (arr!50010 _keys!618) from!762)) (get!26039 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762))))))

(declare-fun bs!44607 () Bool)

(assert (= bs!44607 d!161089))

(assert (=> bs!44607 m!1431023))

(assert (=> bs!44607 m!1431211))

(assert (=> bs!44607 m!1431211))

(declare-fun m!1431259 () Bool)

(assert (=> bs!44607 m!1431259))

(assert (=> b!1552575 d!161089))

(declare-fun d!161091 () Bool)

(declare-fun c!143057 () Bool)

(assert (=> d!161091 (= c!143057 ((_ is ValueCellFull!18195) (select (arr!50011 _values!470) from!762)))))

(declare-fun e!864440 () V!59391)

(assert (=> d!161091 (= (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) e!864440)))

(declare-fun b!1552760 () Bool)

(declare-fun get!26040 (ValueCell!18195 V!59391) V!59391)

(assert (=> b!1552760 (= e!864440 (get!26040 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552761 () Bool)

(declare-fun get!26041 (ValueCell!18195 V!59391) V!59391)

(assert (=> b!1552761 (= e!864440 (get!26041 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161091 c!143057) b!1552760))

(assert (= (and d!161091 (not c!143057)) b!1552761))

(assert (=> b!1552760 m!1431029))

(assert (=> b!1552760 m!1431031))

(declare-fun m!1431261 () Bool)

(assert (=> b!1552760 m!1431261))

(assert (=> b!1552761 m!1431029))

(assert (=> b!1552761 m!1431031))

(declare-fun m!1431263 () Bool)

(assert (=> b!1552761 m!1431263))

(assert (=> b!1552575 d!161091))

(declare-fun b!1552770 () Bool)

(declare-fun e!864448 () Bool)

(declare-fun e!864447 () Bool)

(assert (=> b!1552770 (= e!864448 e!864447)))

(declare-fun lt!669455 () (_ BitVec 64))

(assert (=> b!1552770 (= lt!669455 (select (arr!50010 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!669456 () Unit!51710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103624 (_ BitVec 64) (_ BitVec 32)) Unit!51710)

(assert (=> b!1552770 (= lt!669456 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669455 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1552770 (arrayContainsKey!0 _keys!618 lt!669455 #b00000000000000000000000000000000)))

(declare-fun lt!669457 () Unit!51710)

(assert (=> b!1552770 (= lt!669457 lt!669456)))

(declare-fun res!1062989 () Bool)

(declare-datatypes ((SeekEntryResult!13516 0))(
  ( (MissingZero!13516 (index!56462 (_ BitVec 32))) (Found!13516 (index!56463 (_ BitVec 32))) (Intermediate!13516 (undefined!14328 Bool) (index!56464 (_ BitVec 32)) (x!139215 (_ BitVec 32))) (Undefined!13516) (MissingVacant!13516 (index!56465 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103624 (_ BitVec 32)) SeekEntryResult!13516)

(assert (=> b!1552770 (= res!1062989 (= (seekEntryOrOpen!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13516 #b00000000000000000000000000000000)))))

(assert (=> b!1552770 (=> (not res!1062989) (not e!864447))))

(declare-fun b!1552771 () Bool)

(declare-fun call!71331 () Bool)

(assert (=> b!1552771 (= e!864447 call!71331)))

(declare-fun bm!71328 () Bool)

(assert (=> bm!71328 (= call!71331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1552772 () Bool)

(declare-fun e!864449 () Bool)

(assert (=> b!1552772 (= e!864449 e!864448)))

(declare-fun c!143060 () Bool)

(assert (=> b!1552772 (= c!143060 (validKeyInArray!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1552773 () Bool)

(assert (=> b!1552773 (= e!864448 call!71331)))

(declare-fun d!161093 () Bool)

(declare-fun res!1062988 () Bool)

(assert (=> d!161093 (=> res!1062988 e!864449)))

(assert (=> d!161093 (= res!1062988 (bvsge #b00000000000000000000000000000000 (size!50560 _keys!618)))))

(assert (=> d!161093 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!864449)))

(assert (= (and d!161093 (not res!1062988)) b!1552772))

(assert (= (and b!1552772 c!143060) b!1552770))

(assert (= (and b!1552772 (not c!143060)) b!1552773))

(assert (= (and b!1552770 res!1062989) b!1552771))

(assert (= (or b!1552771 b!1552773) bm!71328))

(assert (=> b!1552770 m!1431125))

(declare-fun m!1431265 () Bool)

(assert (=> b!1552770 m!1431265))

(declare-fun m!1431267 () Bool)

(assert (=> b!1552770 m!1431267))

(assert (=> b!1552770 m!1431125))

(declare-fun m!1431269 () Bool)

(assert (=> b!1552770 m!1431269))

(declare-fun m!1431271 () Bool)

(assert (=> bm!71328 m!1431271))

(assert (=> b!1552772 m!1431125))

(assert (=> b!1552772 m!1431125))

(assert (=> b!1552772 m!1431127))

(assert (=> b!1552582 d!161093))

(declare-fun mapNonEmpty!59038 () Bool)

(declare-fun mapRes!59038 () Bool)

(declare-fun tp!112078 () Bool)

(declare-fun e!864454 () Bool)

(assert (=> mapNonEmpty!59038 (= mapRes!59038 (and tp!112078 e!864454))))

(declare-fun mapKey!59038 () (_ BitVec 32))

(declare-fun mapRest!59038 () (Array (_ BitVec 32) ValueCell!18195))

(declare-fun mapValue!59038 () ValueCell!18195)

(assert (=> mapNonEmpty!59038 (= mapRest!59032 (store mapRest!59038 mapKey!59038 mapValue!59038))))

(declare-fun mapIsEmpty!59038 () Bool)

(assert (=> mapIsEmpty!59038 mapRes!59038))

(declare-fun condMapEmpty!59038 () Bool)

(declare-fun mapDefault!59038 () ValueCell!18195)

(assert (=> mapNonEmpty!59032 (= condMapEmpty!59038 (= mapRest!59032 ((as const (Array (_ BitVec 32) ValueCell!18195)) mapDefault!59038)))))

(declare-fun e!864455 () Bool)

(assert (=> mapNonEmpty!59032 (= tp!112068 (and e!864455 mapRes!59038))))

(declare-fun b!1552781 () Bool)

(assert (=> b!1552781 (= e!864455 tp_is_empty!38211)))

(declare-fun b!1552780 () Bool)

(assert (=> b!1552780 (= e!864454 tp_is_empty!38211)))

(assert (= (and mapNonEmpty!59032 condMapEmpty!59038) mapIsEmpty!59038))

(assert (= (and mapNonEmpty!59032 (not condMapEmpty!59038)) mapNonEmpty!59038))

(assert (= (and mapNonEmpty!59038 ((_ is ValueCellFull!18195) mapValue!59038)) b!1552780))

(assert (= (and mapNonEmpty!59032 ((_ is ValueCellFull!18195) mapDefault!59038)) b!1552781))

(declare-fun m!1431273 () Bool)

(assert (=> mapNonEmpty!59038 m!1431273))

(declare-fun b_lambda!24799 () Bool)

(assert (= b_lambda!24795 (or (and start!132308 b_free!31935) b_lambda!24799)))

(declare-fun b_lambda!24801 () Bool)

(assert (= b_lambda!24797 (or (and start!132308 b_free!31935) b_lambda!24801)))

(check-sat (not d!161083) (not d!161047) (not b!1552706) (not b!1552680) (not bm!71325) (not b!1552743) (not b!1552772) (not b!1552755) (not bm!71328) (not b_lambda!24801) b_and!51385 (not d!161079) (not d!161049) (not b!1552733) (not b_lambda!24793) (not b!1552683) (not d!161089) (not d!161065) (not b_lambda!24799) (not b!1552695) (not b!1552754) (not d!161055) (not b!1552705) (not b!1552745) (not d!161081) (not b!1552731) (not b!1552740) (not b!1552702) (not b!1552746) (not d!161063) (not b!1552748) (not b!1552703) (not b!1552750) (not d!161059) (not b!1552741) (not b_next!31935) (not d!161085) (not b!1552736) (not d!161051) (not d!161073) (not b!1552751) (not d!161053) tp_is_empty!38211 (not b!1552747) (not b!1552735) (not b!1552753) (not b!1552760) (not bm!71322) (not b!1552697) (not b!1552761) (not d!161061) (not mapNonEmpty!59038) (not b!1552742) (not b!1552734) (not d!161087) (not b!1552679) (not b!1552770) (not d!161057) (not d!161077))
(check-sat b_and!51385 (not b_next!31935))
(get-model)

(declare-fun d!161095 () Bool)

(assert (=> d!161095 (= (validKeyInArray!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000)) (and (not (= (select (arr!50010 _keys!618) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50010 _keys!618) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1552772 d!161095))

(declare-fun d!161097 () Bool)

(declare-fun e!864457 () Bool)

(assert (=> d!161097 e!864457))

(declare-fun res!1062990 () Bool)

(assert (=> d!161097 (=> res!1062990 e!864457)))

(declare-fun lt!669459 () Bool)

(assert (=> d!161097 (= res!1062990 (not lt!669459))))

(declare-fun lt!669460 () Bool)

(assert (=> d!161097 (= lt!669459 lt!669460)))

(declare-fun lt!669458 () Unit!51710)

(declare-fun e!864456 () Unit!51710)

(assert (=> d!161097 (= lt!669458 e!864456)))

(declare-fun c!143061 () Bool)

(assert (=> d!161097 (= c!143061 lt!669460)))

(assert (=> d!161097 (= lt!669460 (containsKey!754 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161097 (= (contains!10131 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50010 _keys!618) from!762)) lt!669459)))

(declare-fun b!1552782 () Bool)

(declare-fun lt!669461 () Unit!51710)

(assert (=> b!1552782 (= e!864456 lt!669461)))

(assert (=> b!1552782 (= lt!669461 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)))))

(assert (=> b!1552782 (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)))))

(declare-fun b!1552783 () Bool)

(declare-fun Unit!51717 () Unit!51710)

(assert (=> b!1552783 (= e!864456 Unit!51717)))

(declare-fun b!1552784 () Bool)

(assert (=> b!1552784 (= e!864457 (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762))))))

(assert (= (and d!161097 c!143061) b!1552782))

(assert (= (and d!161097 (not c!143061)) b!1552783))

(assert (= (and d!161097 (not res!1062990)) b!1552784))

(assert (=> d!161097 m!1431023))

(declare-fun m!1431275 () Bool)

(assert (=> d!161097 m!1431275))

(assert (=> b!1552782 m!1431023))

(declare-fun m!1431277 () Bool)

(assert (=> b!1552782 m!1431277))

(assert (=> b!1552782 m!1431023))

(declare-fun m!1431279 () Bool)

(assert (=> b!1552782 m!1431279))

(assert (=> b!1552782 m!1431279))

(declare-fun m!1431281 () Bool)

(assert (=> b!1552782 m!1431281))

(assert (=> b!1552784 m!1431023))

(assert (=> b!1552784 m!1431279))

(assert (=> b!1552784 m!1431279))

(assert (=> b!1552784 m!1431281))

(assert (=> d!161055 d!161097))

(assert (=> d!161055 d!161061))

(declare-fun d!161099 () Bool)

(assert (=> d!161099 (contains!10131 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50010 _keys!618) from!762))))

(assert (=> d!161099 true))

(declare-fun _$35!463 () Unit!51710)

(assert (=> d!161099 (= (choose!2036 lt!669329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50010 _keys!618) from!762)) _$35!463)))

(declare-fun bs!44608 () Bool)

(assert (= bs!44608 d!161099))

(assert (=> bs!44608 m!1431049))

(assert (=> bs!44608 m!1431049))

(assert (=> bs!44608 m!1431023))

(assert (=> bs!44608 m!1431161))

(assert (=> d!161055 d!161099))

(declare-fun d!161101 () Bool)

(declare-fun e!864459 () Bool)

(assert (=> d!161101 e!864459))

(declare-fun res!1062991 () Bool)

(assert (=> d!161101 (=> res!1062991 e!864459)))

(declare-fun lt!669463 () Bool)

(assert (=> d!161101 (= res!1062991 (not lt!669463))))

(declare-fun lt!669464 () Bool)

(assert (=> d!161101 (= lt!669463 lt!669464)))

(declare-fun lt!669462 () Unit!51710)

(declare-fun e!864458 () Unit!51710)

(assert (=> d!161101 (= lt!669462 e!864458)))

(declare-fun c!143062 () Bool)

(assert (=> d!161101 (= c!143062 lt!669464)))

(assert (=> d!161101 (= lt!669464 (containsKey!754 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161101 (= (contains!10131 lt!669329 (select (arr!50010 _keys!618) from!762)) lt!669463)))

(declare-fun b!1552786 () Bool)

(declare-fun lt!669465 () Unit!51710)

(assert (=> b!1552786 (= e!864458 lt!669465)))

(assert (=> b!1552786 (= lt!669465 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)))))

(assert (=> b!1552786 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)))))

(declare-fun b!1552787 () Bool)

(declare-fun Unit!51718 () Unit!51710)

(assert (=> b!1552787 (= e!864458 Unit!51718)))

(declare-fun b!1552788 () Bool)

(assert (=> b!1552788 (= e!864459 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762))))))

(assert (= (and d!161101 c!143062) b!1552786))

(assert (= (and d!161101 (not c!143062)) b!1552787))

(assert (= (and d!161101 (not res!1062991)) b!1552788))

(assert (=> d!161101 m!1431023))

(declare-fun m!1431283 () Bool)

(assert (=> d!161101 m!1431283))

(assert (=> b!1552786 m!1431023))

(declare-fun m!1431285 () Bool)

(assert (=> b!1552786 m!1431285))

(assert (=> b!1552786 m!1431023))

(assert (=> b!1552786 m!1431203))

(assert (=> b!1552786 m!1431203))

(declare-fun m!1431287 () Bool)

(assert (=> b!1552786 m!1431287))

(assert (=> b!1552788 m!1431023))

(assert (=> b!1552788 m!1431203))

(assert (=> b!1552788 m!1431203))

(assert (=> b!1552788 m!1431287))

(assert (=> d!161055 d!161101))

(assert (=> d!161047 d!161065))

(assert (=> d!161047 d!161053))

(assert (=> d!161047 d!161101))

(declare-fun d!161103 () Bool)

(assert (=> d!161103 (= (apply!1111 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50010 _keys!618) from!762)) (apply!1111 lt!669329 (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161103 true))

(declare-fun _$34!1191 () Unit!51710)

(assert (=> d!161103 (= (choose!2035 lt!669329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50010 _keys!618) from!762)) _$34!1191)))

(declare-fun bs!44609 () Bool)

(assert (= bs!44609 d!161103))

(assert (=> bs!44609 m!1431041))

(assert (=> bs!44609 m!1431041))

(assert (=> bs!44609 m!1431023))

(assert (=> bs!44609 m!1431043))

(assert (=> bs!44609 m!1431023))

(assert (=> bs!44609 m!1431053))

(assert (=> d!161047 d!161103))

(assert (=> d!161047 d!161059))

(declare-fun d!161105 () Bool)

(declare-fun isEmpty!1133 (Option!808) Bool)

(assert (=> d!161105 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762))) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun bs!44610 () Bool)

(assert (= bs!44610 d!161105))

(assert (=> bs!44610 m!1431211))

(declare-fun m!1431289 () Bool)

(assert (=> bs!44610 m!1431289))

(assert (=> b!1552745 d!161105))

(declare-fun b!1552801 () Bool)

(declare-fun e!864465 () Option!808)

(assert (=> b!1552801 (= e!864465 None!806)))

(declare-fun b!1552799 () Bool)

(declare-fun e!864464 () Option!808)

(assert (=> b!1552799 (= e!864464 e!864465)))

(declare-fun c!143068 () Bool)

(assert (=> b!1552799 (= c!143068 (and ((_ is Cons!36212) (toList!11191 lt!669336)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669336))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun c!143067 () Bool)

(declare-fun d!161107 () Bool)

(assert (=> d!161107 (= c!143067 (and ((_ is Cons!36212) (toList!11191 lt!669336)) (= (_1!12382 (h!37657 (toList!11191 lt!669336))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161107 (= (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)) e!864464)))

(declare-fun b!1552798 () Bool)

(assert (=> b!1552798 (= e!864464 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669336)))))))

(declare-fun b!1552800 () Bool)

(assert (=> b!1552800 (= e!864465 (getValueByKey!732 (t!50934 (toList!11191 lt!669336)) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161107 c!143067) b!1552798))

(assert (= (and d!161107 (not c!143067)) b!1552799))

(assert (= (and b!1552799 c!143068) b!1552800))

(assert (= (and b!1552799 (not c!143068)) b!1552801))

(assert (=> b!1552800 m!1431023))

(declare-fun m!1431291 () Bool)

(assert (=> b!1552800 m!1431291))

(assert (=> b!1552745 d!161107))

(declare-fun d!161109 () Bool)

(assert (=> d!161109 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669468 () Unit!51710)

(declare-fun choose!2037 (List!36216 (_ BitVec 64)) Unit!51710)

(assert (=> d!161109 (= lt!669468 (choose!2037 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)))))

(declare-fun e!864468 () Bool)

(assert (=> d!161109 e!864468))

(declare-fun res!1062994 () Bool)

(assert (=> d!161109 (=> (not res!1062994) (not e!864468))))

(declare-fun isStrictlySorted!887 (List!36216) Bool)

(assert (=> d!161109 (= res!1062994 (isStrictlySorted!887 (toList!11191 lt!669336)))))

(assert (=> d!161109 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)) lt!669468)))

(declare-fun b!1552804 () Bool)

(assert (=> b!1552804 (= e!864468 (containsKey!754 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161109 res!1062994) b!1552804))

(assert (=> d!161109 m!1431023))

(assert (=> d!161109 m!1431211))

(assert (=> d!161109 m!1431211))

(assert (=> d!161109 m!1431213))

(assert (=> d!161109 m!1431023))

(declare-fun m!1431293 () Bool)

(assert (=> d!161109 m!1431293))

(declare-fun m!1431295 () Bool)

(assert (=> d!161109 m!1431295))

(assert (=> b!1552804 m!1431023))

(assert (=> b!1552804 m!1431207))

(assert (=> b!1552743 d!161109))

(assert (=> b!1552743 d!161105))

(assert (=> b!1552743 d!161107))

(declare-fun b!1552806 () Bool)

(declare-fun e!864474 () Bool)

(declare-fun e!864473 () Bool)

(assert (=> b!1552806 (= e!864474 e!864473)))

(declare-fun c!143072 () Bool)

(assert (=> b!1552806 (= c!143072 (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(declare-fun b!1552807 () Bool)

(assert (=> b!1552807 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(assert (=> b!1552807 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50561 _values!470)))))

(declare-fun lt!669475 () ListLongMap!22351)

(declare-fun e!864472 () Bool)

(assert (=> b!1552807 (= e!864472 (= (apply!1111 lt!669475 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1552808 () Bool)

(declare-fun e!864475 () Bool)

(assert (=> b!1552808 (= e!864475 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> b!1552808 (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1552809 () Bool)

(declare-fun res!1062998 () Bool)

(declare-fun e!864471 () Bool)

(assert (=> b!1552809 (=> (not res!1062998) (not e!864471))))

(assert (=> b!1552809 (= res!1062998 (not (contains!10131 lt!669475 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552810 () Bool)

(declare-fun e!864469 () ListLongMap!22351)

(declare-fun e!864470 () ListLongMap!22351)

(assert (=> b!1552810 (= e!864469 e!864470)))

(declare-fun c!143070 () Bool)

(assert (=> b!1552810 (= c!143070 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(declare-fun b!1552811 () Bool)

(declare-fun call!71332 () ListLongMap!22351)

(assert (=> b!1552811 (= e!864470 call!71332)))

(declare-fun b!1552812 () Bool)

(assert (=> b!1552812 (= e!864471 e!864474)))

(declare-fun c!143071 () Bool)

(assert (=> b!1552812 (= c!143071 e!864475)))

(declare-fun res!1062995 () Bool)

(assert (=> b!1552812 (=> (not res!1062995) (not e!864475))))

(assert (=> b!1552812 (= res!1062995 (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(declare-fun b!1552813 () Bool)

(assert (=> b!1552813 (= e!864469 (ListLongMap!22352 Nil!36213))))

(declare-fun b!1552805 () Bool)

(assert (=> b!1552805 (= e!864473 (isEmpty!1132 lt!669475))))

(declare-fun d!161111 () Bool)

(assert (=> d!161111 e!864471))

(declare-fun res!1062997 () Bool)

(assert (=> d!161111 (=> (not res!1062997) (not e!864471))))

(assert (=> d!161111 (= res!1062997 (not (contains!10131 lt!669475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161111 (= lt!669475 e!864469)))

(declare-fun c!143069 () Bool)

(assert (=> d!161111 (= c!143069 (bvsge (bvadd from!762 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(assert (=> d!161111 (validMask!0 mask!926)))

(assert (=> d!161111 (= (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478) lt!669475)))

(declare-fun b!1552814 () Bool)

(assert (=> b!1552814 (= e!864474 e!864472)))

(assert (=> b!1552814 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(declare-fun res!1062996 () Bool)

(assert (=> b!1552814 (= res!1062996 (contains!10131 lt!669475 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> b!1552814 (=> (not res!1062996) (not e!864472))))

(declare-fun b!1552815 () Bool)

(assert (=> b!1552815 (= e!864473 (= lt!669475 (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1552816 () Bool)

(declare-fun lt!669473 () Unit!51710)

(declare-fun lt!669471 () Unit!51710)

(assert (=> b!1552816 (= lt!669473 lt!669471)))

(declare-fun lt!669470 () ListLongMap!22351)

(declare-fun lt!669469 () (_ BitVec 64))

(declare-fun lt!669472 () (_ BitVec 64))

(declare-fun lt!669474 () V!59391)

(assert (=> b!1552816 (not (contains!10131 (+!5011 lt!669470 (tuple2!24743 lt!669472 lt!669474)) lt!669469))))

(assert (=> b!1552816 (= lt!669471 (addStillNotContains!513 lt!669470 lt!669472 lt!669474 lt!669469))))

(assert (=> b!1552816 (= lt!669469 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1552816 (= lt!669474 (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1552816 (= lt!669472 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)))))

(assert (=> b!1552816 (= lt!669470 call!71332)))

(assert (=> b!1552816 (= e!864470 (+!5011 call!71332 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!71329 () Bool)

(assert (=> bm!71329 (= call!71332 (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478))))

(assert (= (and d!161111 c!143069) b!1552813))

(assert (= (and d!161111 (not c!143069)) b!1552810))

(assert (= (and b!1552810 c!143070) b!1552816))

(assert (= (and b!1552810 (not c!143070)) b!1552811))

(assert (= (or b!1552816 b!1552811) bm!71329))

(assert (= (and d!161111 res!1062997) b!1552809))

(assert (= (and b!1552809 res!1062998) b!1552812))

(assert (= (and b!1552812 res!1062995) b!1552808))

(assert (= (and b!1552812 c!143071) b!1552814))

(assert (= (and b!1552812 (not c!143071)) b!1552806))

(assert (= (and b!1552814 res!1062996) b!1552807))

(assert (= (and b!1552806 c!143072) b!1552815))

(assert (= (and b!1552806 (not c!143072)) b!1552805))

(declare-fun b_lambda!24803 () Bool)

(assert (=> (not b_lambda!24803) (not b!1552807)))

(assert (=> b!1552807 t!50933))

(declare-fun b_and!51387 () Bool)

(assert (= b_and!51385 (and (=> t!50933 result!26089) b_and!51387)))

(declare-fun b_lambda!24805 () Bool)

(assert (=> (not b_lambda!24805) (not b!1552816)))

(assert (=> b!1552816 t!50933))

(declare-fun b_and!51389 () Bool)

(assert (= b_and!51387 (and (=> t!50933 result!26089) b_and!51389)))

(declare-fun m!1431297 () Bool)

(assert (=> d!161111 m!1431297))

(assert (=> d!161111 m!1431015))

(declare-fun m!1431299 () Bool)

(assert (=> bm!71329 m!1431299))

(declare-fun m!1431301 () Bool)

(assert (=> b!1552809 m!1431301))

(declare-fun m!1431303 () Bool)

(assert (=> b!1552810 m!1431303))

(assert (=> b!1552810 m!1431303))

(declare-fun m!1431305 () Bool)

(assert (=> b!1552810 m!1431305))

(declare-fun m!1431307 () Bool)

(assert (=> b!1552805 m!1431307))

(assert (=> b!1552814 m!1431303))

(assert (=> b!1552814 m!1431303))

(declare-fun m!1431309 () Bool)

(assert (=> b!1552814 m!1431309))

(assert (=> b!1552815 m!1431299))

(declare-fun m!1431311 () Bool)

(assert (=> b!1552816 m!1431311))

(declare-fun m!1431313 () Bool)

(assert (=> b!1552816 m!1431313))

(declare-fun m!1431315 () Bool)

(assert (=> b!1552816 m!1431315))

(declare-fun m!1431317 () Bool)

(assert (=> b!1552816 m!1431317))

(assert (=> b!1552816 m!1431031))

(declare-fun m!1431319 () Bool)

(assert (=> b!1552816 m!1431319))

(assert (=> b!1552816 m!1431317))

(assert (=> b!1552816 m!1431031))

(assert (=> b!1552816 m!1431311))

(assert (=> b!1552816 m!1431303))

(declare-fun m!1431321 () Bool)

(assert (=> b!1552816 m!1431321))

(assert (=> b!1552808 m!1431303))

(assert (=> b!1552808 m!1431303))

(assert (=> b!1552808 m!1431305))

(assert (=> b!1552807 m!1431317))

(assert (=> b!1552807 m!1431031))

(assert (=> b!1552807 m!1431319))

(assert (=> b!1552807 m!1431317))

(assert (=> b!1552807 m!1431303))

(declare-fun m!1431323 () Bool)

(assert (=> b!1552807 m!1431323))

(assert (=> b!1552807 m!1431031))

(assert (=> b!1552807 m!1431303))

(assert (=> b!1552741 d!161111))

(assert (=> bm!71325 d!161111))

(declare-fun d!161113 () Bool)

(assert (=> d!161113 (= (get!26039 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50010 _keys!618) from!762))) (v!21990 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161059 d!161113))

(declare-fun b!1552820 () Bool)

(declare-fun e!864477 () Option!808)

(assert (=> b!1552820 (= e!864477 None!806)))

(declare-fun b!1552818 () Bool)

(declare-fun e!864476 () Option!808)

(assert (=> b!1552818 (= e!864476 e!864477)))

(declare-fun c!143074 () Bool)

(assert (=> b!1552818 (= c!143074 (and ((_ is Cons!36212) (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (not (= (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun d!161115 () Bool)

(declare-fun c!143073 () Bool)

(assert (=> d!161115 (= c!143073 (and ((_ is Cons!36212) (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (= (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161115 (= (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50010 _keys!618) from!762)) e!864476)))

(declare-fun b!1552817 () Bool)

(assert (=> b!1552817 (= e!864476 (Some!807 (_2!12382 (h!37657 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun b!1552819 () Bool)

(assert (=> b!1552819 (= e!864477 (getValueByKey!732 (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161115 c!143073) b!1552817))

(assert (= (and d!161115 (not c!143073)) b!1552818))

(assert (= (and b!1552818 c!143074) b!1552819))

(assert (= (and b!1552818 (not c!143074)) b!1552820))

(assert (=> b!1552819 m!1431023))

(declare-fun m!1431325 () Bool)

(assert (=> b!1552819 m!1431325))

(assert (=> d!161059 d!161115))

(declare-fun d!161117 () Bool)

(assert (=> d!161117 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669476 () Unit!51710)

(assert (=> d!161117 (= lt!669476 (choose!2037 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)))))

(declare-fun e!864478 () Bool)

(assert (=> d!161117 e!864478))

(declare-fun res!1062999 () Bool)

(assert (=> d!161117 (=> (not res!1062999) (not e!864478))))

(assert (=> d!161117 (= res!1062999 (isStrictlySorted!887 (toList!11191 lt!669332)))))

(assert (=> d!161117 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)) lt!669476)))

(declare-fun b!1552821 () Bool)

(assert (=> b!1552821 (= e!864478 (containsKey!754 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161117 res!1062999) b!1552821))

(assert (=> d!161117 m!1431023))

(assert (=> d!161117 m!1431145))

(assert (=> d!161117 m!1431145))

(assert (=> d!161117 m!1431147))

(assert (=> d!161117 m!1431023))

(declare-fun m!1431327 () Bool)

(assert (=> d!161117 m!1431327))

(declare-fun m!1431329 () Bool)

(assert (=> d!161117 m!1431329))

(assert (=> b!1552821 m!1431023))

(assert (=> b!1552821 m!1431141))

(assert (=> b!1552695 d!161117))

(declare-fun d!161119 () Bool)

(assert (=> d!161119 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762))) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun bs!44611 () Bool)

(assert (= bs!44611 d!161119))

(assert (=> bs!44611 m!1431145))

(declare-fun m!1431331 () Bool)

(assert (=> bs!44611 m!1431331))

(assert (=> b!1552695 d!161119))

(declare-fun b!1552825 () Bool)

(declare-fun e!864480 () Option!808)

(assert (=> b!1552825 (= e!864480 None!806)))

(declare-fun b!1552823 () Bool)

(declare-fun e!864479 () Option!808)

(assert (=> b!1552823 (= e!864479 e!864480)))

(declare-fun c!143076 () Bool)

(assert (=> b!1552823 (= c!143076 (and ((_ is Cons!36212) (toList!11191 lt!669332)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669332))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun d!161121 () Bool)

(declare-fun c!143075 () Bool)

(assert (=> d!161121 (= c!143075 (and ((_ is Cons!36212) (toList!11191 lt!669332)) (= (_1!12382 (h!37657 (toList!11191 lt!669332))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161121 (= (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)) e!864479)))

(declare-fun b!1552822 () Bool)

(assert (=> b!1552822 (= e!864479 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669332)))))))

(declare-fun b!1552824 () Bool)

(assert (=> b!1552824 (= e!864480 (getValueByKey!732 (t!50934 (toList!11191 lt!669332)) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161121 c!143075) b!1552822))

(assert (= (and d!161121 (not c!143075)) b!1552823))

(assert (= (and b!1552823 c!143076) b!1552824))

(assert (= (and b!1552823 (not c!143076)) b!1552825))

(assert (=> b!1552824 m!1431023))

(declare-fun m!1431333 () Bool)

(assert (=> b!1552824 m!1431333))

(assert (=> b!1552695 d!161121))

(declare-fun d!161123 () Bool)

(declare-fun e!864482 () Bool)

(assert (=> d!161123 e!864482))

(declare-fun res!1063000 () Bool)

(assert (=> d!161123 (=> res!1063000 e!864482)))

(declare-fun lt!669478 () Bool)

(assert (=> d!161123 (= res!1063000 (not lt!669478))))

(declare-fun lt!669479 () Bool)

(assert (=> d!161123 (= lt!669478 lt!669479)))

(declare-fun lt!669477 () Unit!51710)

(declare-fun e!864481 () Unit!51710)

(assert (=> d!161123 (= lt!669477 e!864481)))

(declare-fun c!143077 () Bool)

(assert (=> d!161123 (= c!143077 lt!669479)))

(assert (=> d!161123 (= lt!669479 (containsKey!754 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161123 (= (contains!10131 lt!669447 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669478)))

(declare-fun b!1552826 () Bool)

(declare-fun lt!669480 () Unit!51710)

(assert (=> b!1552826 (= e!864481 lt!669480)))

(assert (=> b!1552826 (= lt!669480 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> b!1552826 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552827 () Bool)

(declare-fun Unit!51719 () Unit!51710)

(assert (=> b!1552827 (= e!864481 Unit!51719)))

(declare-fun b!1552828 () Bool)

(assert (=> b!1552828 (= e!864482 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161123 c!143077) b!1552826))

(assert (= (and d!161123 (not c!143077)) b!1552827))

(assert (= (and d!161123 (not res!1063000)) b!1552828))

(declare-fun m!1431335 () Bool)

(assert (=> d!161123 m!1431335))

(declare-fun m!1431337 () Bool)

(assert (=> b!1552826 m!1431337))

(assert (=> b!1552826 m!1431255))

(assert (=> b!1552826 m!1431255))

(declare-fun m!1431339 () Bool)

(assert (=> b!1552826 m!1431339))

(assert (=> b!1552828 m!1431255))

(assert (=> b!1552828 m!1431255))

(assert (=> b!1552828 m!1431339))

(assert (=> d!161087 d!161123))

(declare-fun b!1552832 () Bool)

(declare-fun e!864484 () Option!808)

(assert (=> b!1552832 (= e!864484 None!806)))

(declare-fun b!1552830 () Bool)

(declare-fun e!864483 () Option!808)

(assert (=> b!1552830 (= e!864483 e!864484)))

(declare-fun c!143079 () Bool)

(assert (=> b!1552830 (= c!143079 (and ((_ is Cons!36212) lt!669446) (not (= (_1!12382 (h!37657 lt!669446)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161125 () Bool)

(declare-fun c!143078 () Bool)

(assert (=> d!161125 (= c!143078 (and ((_ is Cons!36212) lt!669446) (= (_1!12382 (h!37657 lt!669446)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161125 (= (getValueByKey!732 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864483)))

(declare-fun b!1552829 () Bool)

(assert (=> b!1552829 (= e!864483 (Some!807 (_2!12382 (h!37657 lt!669446))))))

(declare-fun b!1552831 () Bool)

(assert (=> b!1552831 (= e!864484 (getValueByKey!732 (t!50934 lt!669446) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161125 c!143078) b!1552829))

(assert (= (and d!161125 (not c!143078)) b!1552830))

(assert (= (and b!1552830 c!143079) b!1552831))

(assert (= (and b!1552830 (not c!143079)) b!1552832))

(declare-fun m!1431341 () Bool)

(assert (=> b!1552831 m!1431341))

(assert (=> d!161087 d!161125))

(declare-fun d!161127 () Bool)

(assert (=> d!161127 (= (getValueByKey!732 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669483 () Unit!51710)

(declare-fun choose!2038 (List!36216 (_ BitVec 64) V!59391) Unit!51710)

(assert (=> d!161127 (= lt!669483 (choose!2038 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864487 () Bool)

(assert (=> d!161127 e!864487))

(declare-fun res!1063005 () Bool)

(assert (=> d!161127 (=> (not res!1063005) (not e!864487))))

(assert (=> d!161127 (= res!1063005 (isStrictlySorted!887 lt!669446))))

(assert (=> d!161127 (= (lemmaContainsTupThenGetReturnValue!374 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669483)))

(declare-fun b!1552837 () Bool)

(declare-fun res!1063006 () Bool)

(assert (=> b!1552837 (=> (not res!1063006) (not e!864487))))

(assert (=> b!1552837 (= res!1063006 (containsKey!754 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552838 () Bool)

(assert (=> b!1552838 (= e!864487 (contains!10134 lt!669446 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161127 res!1063005) b!1552837))

(assert (= (and b!1552837 res!1063006) b!1552838))

(assert (=> d!161127 m!1431249))

(declare-fun m!1431343 () Bool)

(assert (=> d!161127 m!1431343))

(declare-fun m!1431345 () Bool)

(assert (=> d!161127 m!1431345))

(declare-fun m!1431347 () Bool)

(assert (=> b!1552837 m!1431347))

(declare-fun m!1431349 () Bool)

(assert (=> b!1552838 m!1431349))

(assert (=> d!161087 d!161127))

(declare-fun b!1552859 () Bool)

(declare-fun e!864502 () List!36216)

(declare-fun call!71341 () List!36216)

(assert (=> b!1552859 (= e!864502 call!71341)))

(declare-fun b!1552860 () Bool)

(declare-fun e!864499 () List!36216)

(declare-fun call!71340 () List!36216)

(assert (=> b!1552860 (= e!864499 call!71340)))

(declare-fun bm!71336 () Bool)

(declare-fun c!143091 () Bool)

(declare-fun e!864500 () List!36216)

(declare-fun $colon$colon!944 (List!36216 tuple2!24742) List!36216)

(assert (=> bm!71336 (= call!71341 ($colon$colon!944 e!864500 (ite c!143091 (h!37657 (toList!11191 call!71297)) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143089 () Bool)

(assert (=> bm!71336 (= c!143089 c!143091)))

(declare-fun b!1552861 () Bool)

(declare-fun e!864498 () Bool)

(declare-fun lt!669486 () List!36216)

(assert (=> b!1552861 (= e!864498 (contains!10134 lt!669486 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun d!161129 () Bool)

(assert (=> d!161129 e!864498))

(declare-fun res!1063011 () Bool)

(assert (=> d!161129 (=> (not res!1063011) (not e!864498))))

(assert (=> d!161129 (= res!1063011 (isStrictlySorted!887 lt!669486))))

(assert (=> d!161129 (= lt!669486 e!864502)))

(assert (=> d!161129 (= c!143091 (and ((_ is Cons!36212) (toList!11191 call!71297)) (bvslt (_1!12382 (h!37657 (toList!11191 call!71297))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161129 (isStrictlySorted!887 (toList!11191 call!71297))))

(assert (=> d!161129 (= (insertStrictlySorted!503 (toList!11191 call!71297) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669486)))

(declare-fun b!1552862 () Bool)

(declare-fun e!864501 () List!36216)

(assert (=> b!1552862 (= e!864502 e!864501)))

(declare-fun c!143088 () Bool)

(assert (=> b!1552862 (= c!143088 (and ((_ is Cons!36212) (toList!11191 call!71297)) (= (_1!12382 (h!37657 (toList!11191 call!71297))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552863 () Bool)

(assert (=> b!1552863 (= e!864500 (insertStrictlySorted!503 (t!50934 (toList!11191 call!71297)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552864 () Bool)

(assert (=> b!1552864 (= e!864499 call!71340)))

(declare-fun b!1552865 () Bool)

(declare-fun c!143090 () Bool)

(assert (=> b!1552865 (= c!143090 (and ((_ is Cons!36212) (toList!11191 call!71297)) (bvsgt (_1!12382 (h!37657 (toList!11191 call!71297))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1552865 (= e!864501 e!864499)))

(declare-fun b!1552866 () Bool)

(declare-fun res!1063012 () Bool)

(assert (=> b!1552866 (=> (not res!1063012) (not e!864498))))

(assert (=> b!1552866 (= res!1063012 (containsKey!754 lt!669486 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71337 () Bool)

(declare-fun call!71339 () List!36216)

(assert (=> bm!71337 (= call!71339 call!71341)))

(declare-fun bm!71338 () Bool)

(assert (=> bm!71338 (= call!71340 call!71339)))

(declare-fun b!1552867 () Bool)

(assert (=> b!1552867 (= e!864500 (ite c!143088 (t!50934 (toList!11191 call!71297)) (ite c!143090 (Cons!36212 (h!37657 (toList!11191 call!71297)) (t!50934 (toList!11191 call!71297))) Nil!36213)))))

(declare-fun b!1552868 () Bool)

(assert (=> b!1552868 (= e!864501 call!71339)))

(assert (= (and d!161129 c!143091) b!1552859))

(assert (= (and d!161129 (not c!143091)) b!1552862))

(assert (= (and b!1552862 c!143088) b!1552868))

(assert (= (and b!1552862 (not c!143088)) b!1552865))

(assert (= (and b!1552865 c!143090) b!1552864))

(assert (= (and b!1552865 (not c!143090)) b!1552860))

(assert (= (or b!1552864 b!1552860) bm!71338))

(assert (= (or b!1552868 bm!71338) bm!71337))

(assert (= (or b!1552859 bm!71337) bm!71336))

(assert (= (and bm!71336 c!143089) b!1552863))

(assert (= (and bm!71336 (not c!143089)) b!1552867))

(assert (= (and d!161129 res!1063011) b!1552866))

(assert (= (and b!1552866 res!1063012) b!1552861))

(declare-fun m!1431351 () Bool)

(assert (=> b!1552866 m!1431351))

(declare-fun m!1431353 () Bool)

(assert (=> b!1552863 m!1431353))

(declare-fun m!1431355 () Bool)

(assert (=> bm!71336 m!1431355))

(declare-fun m!1431357 () Bool)

(assert (=> d!161129 m!1431357))

(declare-fun m!1431359 () Bool)

(assert (=> d!161129 m!1431359))

(declare-fun m!1431361 () Bool)

(assert (=> b!1552861 m!1431361))

(assert (=> d!161087 d!161129))

(declare-fun b!1552872 () Bool)

(declare-fun e!864504 () Option!808)

(assert (=> b!1552872 (= e!864504 None!806)))

(declare-fun b!1552870 () Bool)

(declare-fun e!864503 () Option!808)

(assert (=> b!1552870 (= e!864503 e!864504)))

(declare-fun c!143093 () Bool)

(assert (=> b!1552870 (= c!143093 (and ((_ is Cons!36212) (toList!11191 lt!669399)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669399))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161131 () Bool)

(declare-fun c!143092 () Bool)

(assert (=> d!161131 (= c!143092 (and ((_ is Cons!36212) (toList!11191 lt!669399)) (= (_1!12382 (h!37657 (toList!11191 lt!669399))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161131 (= (getValueByKey!732 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864503)))

(declare-fun b!1552869 () Bool)

(assert (=> b!1552869 (= e!864503 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669399)))))))

(declare-fun b!1552871 () Bool)

(assert (=> b!1552871 (= e!864504 (getValueByKey!732 (t!50934 (toList!11191 lt!669399)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161131 c!143092) b!1552869))

(assert (= (and d!161131 (not c!143092)) b!1552870))

(assert (= (and b!1552870 c!143093) b!1552871))

(assert (= (and b!1552870 (not c!143093)) b!1552872))

(declare-fun m!1431363 () Bool)

(assert (=> b!1552871 m!1431363))

(assert (=> b!1552702 d!161131))

(declare-fun d!161133 () Bool)

(declare-fun res!1063014 () Bool)

(declare-fun e!864508 () Bool)

(assert (=> d!161133 (=> res!1063014 e!864508)))

(assert (=> d!161133 (= res!1063014 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(assert (=> d!161133 (= (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) e!864508)))

(declare-fun b!1552873 () Bool)

(declare-fun e!864507 () Bool)

(assert (=> b!1552873 (= e!864508 e!864507)))

(declare-fun res!1063013 () Bool)

(assert (=> b!1552873 (=> (not res!1063013) (not e!864507))))

(declare-fun e!864506 () Bool)

(assert (=> b!1552873 (= res!1063013 (not e!864506))))

(declare-fun res!1063015 () Bool)

(assert (=> b!1552873 (=> (not res!1063015) (not e!864506))))

(assert (=> b!1552873 (= res!1063015 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1552874 () Bool)

(declare-fun e!864505 () Bool)

(assert (=> b!1552874 (= e!864507 e!864505)))

(declare-fun c!143094 () Bool)

(assert (=> b!1552874 (= c!143094 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!71339 () Bool)

(declare-fun call!71342 () Bool)

(assert (=> bm!71339 (= call!71342 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!143094 (Cons!36213 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214))))))

(declare-fun b!1552875 () Bool)

(assert (=> b!1552875 (= e!864505 call!71342)))

(declare-fun b!1552876 () Bool)

(assert (=> b!1552876 (= e!864505 call!71342)))

(declare-fun b!1552877 () Bool)

(assert (=> b!1552877 (= e!864506 (contains!10133 (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214) (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!161133 (not res!1063014)) b!1552873))

(assert (= (and b!1552873 res!1063015) b!1552877))

(assert (= (and b!1552873 res!1063013) b!1552874))

(assert (= (and b!1552874 c!143094) b!1552875))

(assert (= (and b!1552874 (not c!143094)) b!1552876))

(assert (= (or b!1552875 b!1552876) bm!71339))

(declare-fun m!1431365 () Bool)

(assert (=> b!1552873 m!1431365))

(assert (=> b!1552873 m!1431365))

(declare-fun m!1431367 () Bool)

(assert (=> b!1552873 m!1431367))

(assert (=> b!1552874 m!1431365))

(assert (=> b!1552874 m!1431365))

(assert (=> b!1552874 m!1431367))

(assert (=> bm!71339 m!1431365))

(declare-fun m!1431369 () Bool)

(assert (=> bm!71339 m!1431369))

(assert (=> b!1552877 m!1431365))

(assert (=> b!1552877 m!1431365))

(declare-fun m!1431371 () Bool)

(assert (=> b!1552877 m!1431371))

(assert (=> bm!71322 d!161133))

(declare-fun d!161135 () Bool)

(assert (=> d!161135 (= (get!26039 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762))) (v!21990 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161089 d!161135))

(assert (=> d!161089 d!161107))

(assert (=> b!1552679 d!161095))

(declare-fun d!161137 () Bool)

(assert (=> d!161137 (= (get!26041 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1552761 d!161137))

(assert (=> b!1552697 d!161119))

(assert (=> b!1552697 d!161121))

(declare-fun d!161139 () Bool)

(declare-fun res!1063020 () Bool)

(declare-fun e!864513 () Bool)

(assert (=> d!161139 (=> res!1063020 e!864513)))

(assert (=> d!161139 (= res!1063020 (and ((_ is Cons!36212) (toList!11191 lt!669336)) (= (_1!12382 (h!37657 (toList!11191 lt!669336))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161139 (= (containsKey!754 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)) e!864513)))

(declare-fun b!1552882 () Bool)

(declare-fun e!864514 () Bool)

(assert (=> b!1552882 (= e!864513 e!864514)))

(declare-fun res!1063021 () Bool)

(assert (=> b!1552882 (=> (not res!1063021) (not e!864514))))

(assert (=> b!1552882 (= res!1063021 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669336))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669336))) (select (arr!50010 _keys!618) from!762))) ((_ is Cons!36212) (toList!11191 lt!669336)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669336))) (select (arr!50010 _keys!618) from!762))))))

(declare-fun b!1552883 () Bool)

(assert (=> b!1552883 (= e!864514 (containsKey!754 (t!50934 (toList!11191 lt!669336)) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161139 (not res!1063020)) b!1552882))

(assert (= (and b!1552882 res!1063021) b!1552883))

(assert (=> b!1552883 m!1431023))

(declare-fun m!1431373 () Bool)

(assert (=> b!1552883 m!1431373))

(assert (=> d!161073 d!161139))

(declare-fun d!161141 () Bool)

(assert (=> d!161141 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!669487 () Unit!51710)

(assert (=> d!161141 (= lt!669487 (choose!2037 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864515 () Bool)

(assert (=> d!161141 e!864515))

(declare-fun res!1063022 () Bool)

(assert (=> d!161141 (=> (not res!1063022) (not e!864515))))

(assert (=> d!161141 (= res!1063022 (isStrictlySorted!887 (toList!11191 lt!669336)))))

(assert (=> d!161141 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000) lt!669487)))

(declare-fun b!1552884 () Bool)

(assert (=> b!1552884 (= e!864515 (containsKey!754 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161141 res!1063022) b!1552884))

(assert (=> d!161141 m!1431215))

(assert (=> d!161141 m!1431215))

(assert (=> d!161141 m!1431243))

(declare-fun m!1431375 () Bool)

(assert (=> d!161141 m!1431375))

(assert (=> d!161141 m!1431295))

(assert (=> b!1552884 m!1431239))

(assert (=> b!1552751 d!161141))

(declare-fun d!161143 () Bool)

(assert (=> d!161143 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44612 () Bool)

(assert (= bs!44612 d!161143))

(assert (=> bs!44612 m!1431215))

(declare-fun m!1431377 () Bool)

(assert (=> bs!44612 m!1431377))

(assert (=> b!1552751 d!161143))

(declare-fun b!1552888 () Bool)

(declare-fun e!864517 () Option!808)

(assert (=> b!1552888 (= e!864517 None!806)))

(declare-fun b!1552886 () Bool)

(declare-fun e!864516 () Option!808)

(assert (=> b!1552886 (= e!864516 e!864517)))

(declare-fun c!143096 () Bool)

(assert (=> b!1552886 (= c!143096 (and ((_ is Cons!36212) (toList!11191 lt!669336)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669336))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!161145 () Bool)

(declare-fun c!143095 () Bool)

(assert (=> d!161145 (= c!143095 (and ((_ is Cons!36212) (toList!11191 lt!669336)) (= (_1!12382 (h!37657 (toList!11191 lt!669336))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161145 (= (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000) e!864516)))

(declare-fun b!1552885 () Bool)

(assert (=> b!1552885 (= e!864516 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669336)))))))

(declare-fun b!1552887 () Bool)

(assert (=> b!1552887 (= e!864517 (getValueByKey!732 (t!50934 (toList!11191 lt!669336)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161145 c!143095) b!1552885))

(assert (= (and d!161145 (not c!143095)) b!1552886))

(assert (= (and b!1552886 c!143096) b!1552887))

(assert (= (and b!1552886 (not c!143096)) b!1552888))

(declare-fun m!1431379 () Bool)

(assert (=> b!1552887 m!1431379))

(assert (=> b!1552751 d!161145))

(declare-fun d!161147 () Bool)

(declare-fun lt!669490 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!794 (List!36216) (InoxSet tuple2!24742))

(assert (=> d!161147 (= lt!669490 (select (content!794 (toList!11191 lt!669435)) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864523 () Bool)

(assert (=> d!161147 (= lt!669490 e!864523)))

(declare-fun res!1063028 () Bool)

(assert (=> d!161147 (=> (not res!1063028) (not e!864523))))

(assert (=> d!161147 (= res!1063028 ((_ is Cons!36212) (toList!11191 lt!669435)))))

(assert (=> d!161147 (= (contains!10134 (toList!11191 lt!669435) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669490)))

(declare-fun b!1552893 () Bool)

(declare-fun e!864522 () Bool)

(assert (=> b!1552893 (= e!864523 e!864522)))

(declare-fun res!1063027 () Bool)

(assert (=> b!1552893 (=> res!1063027 e!864522)))

(assert (=> b!1552893 (= res!1063027 (= (h!37657 (toList!11191 lt!669435)) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552894 () Bool)

(assert (=> b!1552894 (= e!864522 (contains!10134 (t!50934 (toList!11191 lt!669435)) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161147 res!1063028) b!1552893))

(assert (= (and b!1552893 (not res!1063027)) b!1552894))

(declare-fun m!1431381 () Bool)

(assert (=> d!161147 m!1431381))

(declare-fun m!1431383 () Bool)

(assert (=> d!161147 m!1431383))

(declare-fun m!1431385 () Bool)

(assert (=> b!1552894 m!1431385))

(assert (=> b!1552747 d!161147))

(assert (=> b!1552753 d!161143))

(assert (=> b!1552753 d!161145))

(declare-fun b!1552898 () Bool)

(declare-fun e!864525 () Option!808)

(assert (=> b!1552898 (= e!864525 None!806)))

(declare-fun b!1552896 () Bool)

(declare-fun e!864524 () Option!808)

(assert (=> b!1552896 (= e!864524 e!864525)))

(declare-fun c!143098 () Bool)

(assert (=> b!1552896 (= c!143098 (and ((_ is Cons!36212) (toList!11191 lt!669447)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669447))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161149 () Bool)

(declare-fun c!143097 () Bool)

(assert (=> d!161149 (= c!143097 (and ((_ is Cons!36212) (toList!11191 lt!669447)) (= (_1!12382 (h!37657 (toList!11191 lt!669447))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161149 (= (getValueByKey!732 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864524)))

(declare-fun b!1552895 () Bool)

(assert (=> b!1552895 (= e!864524 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669447)))))))

(declare-fun b!1552897 () Bool)

(assert (=> b!1552897 (= e!864525 (getValueByKey!732 (t!50934 (toList!11191 lt!669447)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161149 c!143097) b!1552895))

(assert (= (and d!161149 (not c!143097)) b!1552896))

(assert (= (and b!1552896 c!143098) b!1552897))

(assert (= (and b!1552896 (not c!143098)) b!1552898))

(declare-fun m!1431387 () Bool)

(assert (=> b!1552897 m!1431387))

(assert (=> b!1552754 d!161149))

(declare-fun d!161151 () Bool)

(assert (=> d!161151 (= (get!26039 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762))) (v!21990 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161057 d!161151))

(assert (=> d!161057 d!161121))

(assert (=> b!1552734 d!161075))

(declare-fun d!161153 () Bool)

(assert (=> d!161153 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44613 () Bool)

(assert (= bs!44613 d!161153))

(assert (=> bs!44613 m!1431235))

(declare-fun m!1431389 () Bool)

(assert (=> bs!44613 m!1431389))

(assert (=> b!1552750 d!161153))

(declare-fun b!1552902 () Bool)

(declare-fun e!864527 () Option!808)

(assert (=> b!1552902 (= e!864527 None!806)))

(declare-fun b!1552900 () Bool)

(declare-fun e!864526 () Option!808)

(assert (=> b!1552900 (= e!864526 e!864527)))

(declare-fun c!143100 () Bool)

(assert (=> b!1552900 (= c!143100 (and ((_ is Cons!36212) (toList!11191 lt!669336)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669336))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!161155 () Bool)

(declare-fun c!143099 () Bool)

(assert (=> d!161155 (= c!143099 (and ((_ is Cons!36212) (toList!11191 lt!669336)) (= (_1!12382 (h!37657 (toList!11191 lt!669336))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161155 (= (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000) e!864526)))

(declare-fun b!1552899 () Bool)

(assert (=> b!1552899 (= e!864526 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669336)))))))

(declare-fun b!1552901 () Bool)

(assert (=> b!1552901 (= e!864527 (getValueByKey!732 (t!50934 (toList!11191 lt!669336)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161155 c!143099) b!1552899))

(assert (= (and d!161155 (not c!143099)) b!1552900))

(assert (= (and b!1552900 c!143100) b!1552901))

(assert (= (and b!1552900 (not c!143100)) b!1552902))

(declare-fun m!1431391 () Bool)

(assert (=> b!1552901 m!1431391))

(assert (=> b!1552750 d!161155))

(declare-fun d!161157 () Bool)

(assert (=> d!161157 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!669491 () Unit!51710)

(assert (=> d!161157 (= lt!669491 (choose!2037 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864528 () Bool)

(assert (=> d!161157 e!864528))

(declare-fun res!1063029 () Bool)

(assert (=> d!161157 (=> (not res!1063029) (not e!864528))))

(assert (=> d!161157 (= res!1063029 (isStrictlySorted!887 (toList!11191 lt!669336)))))

(assert (=> d!161157 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000) lt!669491)))

(declare-fun b!1552903 () Bool)

(assert (=> b!1552903 (= e!864528 (containsKey!754 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161157 res!1063029) b!1552903))

(assert (=> d!161157 m!1431235))

(assert (=> d!161157 m!1431235))

(assert (=> d!161157 m!1431237))

(declare-fun m!1431393 () Bool)

(assert (=> d!161157 m!1431393))

(assert (=> d!161157 m!1431295))

(assert (=> b!1552903 m!1431231))

(assert (=> b!1552748 d!161157))

(assert (=> b!1552748 d!161153))

(assert (=> b!1552748 d!161155))

(assert (=> b!1552736 d!161075))

(declare-fun d!161159 () Bool)

(assert (=> d!161159 (arrayContainsKey!0 _keys!618 lt!669455 #b00000000000000000000000000000000)))

(declare-fun lt!669494 () Unit!51710)

(declare-fun choose!13 (array!103624 (_ BitVec 64) (_ BitVec 32)) Unit!51710)

(assert (=> d!161159 (= lt!669494 (choose!13 _keys!618 lt!669455 #b00000000000000000000000000000000))))

(assert (=> d!161159 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!161159 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669455 #b00000000000000000000000000000000) lt!669494)))

(declare-fun bs!44614 () Bool)

(assert (= bs!44614 d!161159))

(assert (=> bs!44614 m!1431267))

(declare-fun m!1431395 () Bool)

(assert (=> bs!44614 m!1431395))

(assert (=> b!1552770 d!161159))

(declare-fun d!161161 () Bool)

(declare-fun res!1063034 () Bool)

(declare-fun e!864533 () Bool)

(assert (=> d!161161 (=> res!1063034 e!864533)))

(assert (=> d!161161 (= res!1063034 (= (select (arr!50010 _keys!618) #b00000000000000000000000000000000) lt!669455))))

(assert (=> d!161161 (= (arrayContainsKey!0 _keys!618 lt!669455 #b00000000000000000000000000000000) e!864533)))

(declare-fun b!1552908 () Bool)

(declare-fun e!864534 () Bool)

(assert (=> b!1552908 (= e!864533 e!864534)))

(declare-fun res!1063035 () Bool)

(assert (=> b!1552908 (=> (not res!1063035) (not e!864534))))

(assert (=> b!1552908 (= res!1063035 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(declare-fun b!1552909 () Bool)

(assert (=> b!1552909 (= e!864534 (arrayContainsKey!0 _keys!618 lt!669455 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!161161 (not res!1063034)) b!1552908))

(assert (= (and b!1552908 res!1063035) b!1552909))

(assert (=> d!161161 m!1431125))

(declare-fun m!1431397 () Bool)

(assert (=> b!1552909 m!1431397))

(assert (=> b!1552770 d!161161))

(declare-fun b!1552922 () Bool)

(declare-fun c!143108 () Bool)

(declare-fun lt!669502 () (_ BitVec 64))

(assert (=> b!1552922 (= c!143108 (= lt!669502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864542 () SeekEntryResult!13516)

(declare-fun e!864543 () SeekEntryResult!13516)

(assert (=> b!1552922 (= e!864542 e!864543)))

(declare-fun b!1552923 () Bool)

(declare-fun lt!669503 () SeekEntryResult!13516)

(assert (=> b!1552923 (= e!864543 (MissingZero!13516 (index!56464 lt!669503)))))

(declare-fun b!1552924 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!103624 (_ BitVec 32)) SeekEntryResult!13516)

(assert (=> b!1552924 (= e!864543 (seekKeyOrZeroReturnVacant!0 (x!139215 lt!669503) (index!56464 lt!669503) (index!56464 lt!669503) (select (arr!50010 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(declare-fun b!1552925 () Bool)

(declare-fun e!864541 () SeekEntryResult!13516)

(assert (=> b!1552925 (= e!864541 e!864542)))

(assert (=> b!1552925 (= lt!669502 (select (arr!50010 _keys!618) (index!56464 lt!669503)))))

(declare-fun c!143107 () Bool)

(assert (=> b!1552925 (= c!143107 (= lt!669502 (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!161163 () Bool)

(declare-fun lt!669501 () SeekEntryResult!13516)

(assert (=> d!161163 (and (or ((_ is Undefined!13516) lt!669501) (not ((_ is Found!13516) lt!669501)) (and (bvsge (index!56463 lt!669501) #b00000000000000000000000000000000) (bvslt (index!56463 lt!669501) (size!50560 _keys!618)))) (or ((_ is Undefined!13516) lt!669501) ((_ is Found!13516) lt!669501) (not ((_ is MissingZero!13516) lt!669501)) (and (bvsge (index!56462 lt!669501) #b00000000000000000000000000000000) (bvslt (index!56462 lt!669501) (size!50560 _keys!618)))) (or ((_ is Undefined!13516) lt!669501) ((_ is Found!13516) lt!669501) ((_ is MissingZero!13516) lt!669501) (not ((_ is MissingVacant!13516) lt!669501)) (and (bvsge (index!56465 lt!669501) #b00000000000000000000000000000000) (bvslt (index!56465 lt!669501) (size!50560 _keys!618)))) (or ((_ is Undefined!13516) lt!669501) (ite ((_ is Found!13516) lt!669501) (= (select (arr!50010 _keys!618) (index!56463 lt!669501)) (select (arr!50010 _keys!618) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13516) lt!669501) (= (select (arr!50010 _keys!618) (index!56462 lt!669501)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13516) lt!669501) (= (select (arr!50010 _keys!618) (index!56465 lt!669501)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161163 (= lt!669501 e!864541)))

(declare-fun c!143109 () Bool)

(assert (=> d!161163 (= c!143109 (and ((_ is Intermediate!13516) lt!669503) (undefined!14328 lt!669503)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!103624 (_ BitVec 32)) SeekEntryResult!13516)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!161163 (= lt!669503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) mask!926) (select (arr!50010 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(assert (=> d!161163 (validMask!0 mask!926)))

(assert (=> d!161163 (= (seekEntryOrOpen!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) lt!669501)))

(declare-fun b!1552926 () Bool)

(assert (=> b!1552926 (= e!864541 Undefined!13516)))

(declare-fun b!1552927 () Bool)

(assert (=> b!1552927 (= e!864542 (Found!13516 (index!56464 lt!669503)))))

(assert (= (and d!161163 c!143109) b!1552926))

(assert (= (and d!161163 (not c!143109)) b!1552925))

(assert (= (and b!1552925 c!143107) b!1552927))

(assert (= (and b!1552925 (not c!143107)) b!1552922))

(assert (= (and b!1552922 c!143108) b!1552923))

(assert (= (and b!1552922 (not c!143108)) b!1552924))

(assert (=> b!1552924 m!1431125))

(declare-fun m!1431399 () Bool)

(assert (=> b!1552924 m!1431399))

(declare-fun m!1431401 () Bool)

(assert (=> b!1552925 m!1431401))

(assert (=> d!161163 m!1431125))

(declare-fun m!1431403 () Bool)

(assert (=> d!161163 m!1431403))

(declare-fun m!1431405 () Bool)

(assert (=> d!161163 m!1431405))

(assert (=> d!161163 m!1431015))

(declare-fun m!1431407 () Bool)

(assert (=> d!161163 m!1431407))

(assert (=> d!161163 m!1431403))

(assert (=> d!161163 m!1431125))

(declare-fun m!1431409 () Bool)

(assert (=> d!161163 m!1431409))

(declare-fun m!1431411 () Bool)

(assert (=> d!161163 m!1431411))

(assert (=> b!1552770 d!161163))

(declare-fun d!161165 () Bool)

(declare-fun e!864545 () Bool)

(assert (=> d!161165 e!864545))

(declare-fun res!1063036 () Bool)

(assert (=> d!161165 (=> res!1063036 e!864545)))

(declare-fun lt!669505 () Bool)

(assert (=> d!161165 (= res!1063036 (not lt!669505))))

(declare-fun lt!669506 () Bool)

(assert (=> d!161165 (= lt!669505 lt!669506)))

(declare-fun lt!669504 () Unit!51710)

(declare-fun e!864544 () Unit!51710)

(assert (=> d!161165 (= lt!669504 e!864544)))

(declare-fun c!143110 () Bool)

(assert (=> d!161165 (= c!143110 lt!669506)))

(assert (=> d!161165 (= lt!669506 (containsKey!754 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161165 (= (contains!10131 lt!669399 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669505)))

(declare-fun b!1552928 () Bool)

(declare-fun lt!669507 () Unit!51710)

(assert (=> b!1552928 (= e!864544 lt!669507)))

(assert (=> b!1552928 (= lt!669507 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> b!1552928 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552929 () Bool)

(declare-fun Unit!51720 () Unit!51710)

(assert (=> b!1552929 (= e!864544 Unit!51720)))

(declare-fun b!1552930 () Bool)

(assert (=> b!1552930 (= e!864545 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161165 c!143110) b!1552928))

(assert (= (and d!161165 (not c!143110)) b!1552929))

(assert (= (and d!161165 (not res!1063036)) b!1552930))

(declare-fun m!1431413 () Bool)

(assert (=> d!161165 m!1431413))

(declare-fun m!1431415 () Bool)

(assert (=> b!1552928 m!1431415))

(assert (=> b!1552928 m!1431157))

(assert (=> b!1552928 m!1431157))

(declare-fun m!1431417 () Bool)

(assert (=> b!1552928 m!1431417))

(assert (=> b!1552930 m!1431157))

(assert (=> b!1552930 m!1431157))

(assert (=> b!1552930 m!1431417))

(assert (=> d!161053 d!161165))

(declare-fun b!1552934 () Bool)

(declare-fun e!864547 () Option!808)

(assert (=> b!1552934 (= e!864547 None!806)))

(declare-fun b!1552932 () Bool)

(declare-fun e!864546 () Option!808)

(assert (=> b!1552932 (= e!864546 e!864547)))

(declare-fun c!143112 () Bool)

(assert (=> b!1552932 (= c!143112 (and ((_ is Cons!36212) lt!669398) (not (= (_1!12382 (h!37657 lt!669398)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161167 () Bool)

(declare-fun c!143111 () Bool)

(assert (=> d!161167 (= c!143111 (and ((_ is Cons!36212) lt!669398) (= (_1!12382 (h!37657 lt!669398)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161167 (= (getValueByKey!732 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864546)))

(declare-fun b!1552931 () Bool)

(assert (=> b!1552931 (= e!864546 (Some!807 (_2!12382 (h!37657 lt!669398))))))

(declare-fun b!1552933 () Bool)

(assert (=> b!1552933 (= e!864547 (getValueByKey!732 (t!50934 lt!669398) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161167 c!143111) b!1552931))

(assert (= (and d!161167 (not c!143111)) b!1552932))

(assert (= (and b!1552932 c!143112) b!1552933))

(assert (= (and b!1552932 (not c!143112)) b!1552934))

(declare-fun m!1431419 () Bool)

(assert (=> b!1552933 m!1431419))

(assert (=> d!161053 d!161167))

(declare-fun d!161169 () Bool)

(assert (=> d!161169 (= (getValueByKey!732 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669508 () Unit!51710)

(assert (=> d!161169 (= lt!669508 (choose!2038 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864548 () Bool)

(assert (=> d!161169 e!864548))

(declare-fun res!1063037 () Bool)

(assert (=> d!161169 (=> (not res!1063037) (not e!864548))))

(assert (=> d!161169 (= res!1063037 (isStrictlySorted!887 lt!669398))))

(assert (=> d!161169 (= (lemmaContainsTupThenGetReturnValue!374 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669508)))

(declare-fun b!1552935 () Bool)

(declare-fun res!1063038 () Bool)

(assert (=> b!1552935 (=> (not res!1063038) (not e!864548))))

(assert (=> b!1552935 (= res!1063038 (containsKey!754 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552936 () Bool)

(assert (=> b!1552936 (= e!864548 (contains!10134 lt!669398 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161169 res!1063037) b!1552935))

(assert (= (and b!1552935 res!1063038) b!1552936))

(assert (=> d!161169 m!1431151))

(declare-fun m!1431421 () Bool)

(assert (=> d!161169 m!1431421))

(declare-fun m!1431423 () Bool)

(assert (=> d!161169 m!1431423))

(declare-fun m!1431425 () Bool)

(assert (=> b!1552935 m!1431425))

(declare-fun m!1431427 () Bool)

(assert (=> b!1552936 m!1431427))

(assert (=> d!161053 d!161169))

(declare-fun b!1552937 () Bool)

(declare-fun e!864553 () List!36216)

(declare-fun call!71345 () List!36216)

(assert (=> b!1552937 (= e!864553 call!71345)))

(declare-fun b!1552938 () Bool)

(declare-fun e!864550 () List!36216)

(declare-fun call!71344 () List!36216)

(assert (=> b!1552938 (= e!864550 call!71344)))

(declare-fun bm!71340 () Bool)

(declare-fun c!143116 () Bool)

(declare-fun e!864551 () List!36216)

(assert (=> bm!71340 (= call!71345 ($colon$colon!944 e!864551 (ite c!143116 (h!37657 (toList!11191 lt!669329)) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143114 () Bool)

(assert (=> bm!71340 (= c!143114 c!143116)))

(declare-fun b!1552939 () Bool)

(declare-fun e!864549 () Bool)

(declare-fun lt!669509 () List!36216)

(assert (=> b!1552939 (= e!864549 (contains!10134 lt!669509 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun d!161171 () Bool)

(assert (=> d!161171 e!864549))

(declare-fun res!1063039 () Bool)

(assert (=> d!161171 (=> (not res!1063039) (not e!864549))))

(assert (=> d!161171 (= res!1063039 (isStrictlySorted!887 lt!669509))))

(assert (=> d!161171 (= lt!669509 e!864553)))

(assert (=> d!161171 (= c!143116 (and ((_ is Cons!36212) (toList!11191 lt!669329)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669329))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161171 (isStrictlySorted!887 (toList!11191 lt!669329))))

(assert (=> d!161171 (= (insertStrictlySorted!503 (toList!11191 lt!669329) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669509)))

(declare-fun b!1552940 () Bool)

(declare-fun e!864552 () List!36216)

(assert (=> b!1552940 (= e!864553 e!864552)))

(declare-fun c!143113 () Bool)

(assert (=> b!1552940 (= c!143113 (and ((_ is Cons!36212) (toList!11191 lt!669329)) (= (_1!12382 (h!37657 (toList!11191 lt!669329))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552941 () Bool)

(assert (=> b!1552941 (= e!864551 (insertStrictlySorted!503 (t!50934 (toList!11191 lt!669329)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552942 () Bool)

(assert (=> b!1552942 (= e!864550 call!71344)))

(declare-fun b!1552943 () Bool)

(declare-fun c!143115 () Bool)

(assert (=> b!1552943 (= c!143115 (and ((_ is Cons!36212) (toList!11191 lt!669329)) (bvsgt (_1!12382 (h!37657 (toList!11191 lt!669329))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1552943 (= e!864552 e!864550)))

(declare-fun b!1552944 () Bool)

(declare-fun res!1063040 () Bool)

(assert (=> b!1552944 (=> (not res!1063040) (not e!864549))))

(assert (=> b!1552944 (= res!1063040 (containsKey!754 lt!669509 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71341 () Bool)

(declare-fun call!71343 () List!36216)

(assert (=> bm!71341 (= call!71343 call!71345)))

(declare-fun bm!71342 () Bool)

(assert (=> bm!71342 (= call!71344 call!71343)))

(declare-fun b!1552945 () Bool)

(assert (=> b!1552945 (= e!864551 (ite c!143113 (t!50934 (toList!11191 lt!669329)) (ite c!143115 (Cons!36212 (h!37657 (toList!11191 lt!669329)) (t!50934 (toList!11191 lt!669329))) Nil!36213)))))

(declare-fun b!1552946 () Bool)

(assert (=> b!1552946 (= e!864552 call!71343)))

(assert (= (and d!161171 c!143116) b!1552937))

(assert (= (and d!161171 (not c!143116)) b!1552940))

(assert (= (and b!1552940 c!143113) b!1552946))

(assert (= (and b!1552940 (not c!143113)) b!1552943))

(assert (= (and b!1552943 c!143115) b!1552942))

(assert (= (and b!1552943 (not c!143115)) b!1552938))

(assert (= (or b!1552942 b!1552938) bm!71342))

(assert (= (or b!1552946 bm!71342) bm!71341))

(assert (= (or b!1552937 bm!71341) bm!71340))

(assert (= (and bm!71340 c!143114) b!1552941))

(assert (= (and bm!71340 (not c!143114)) b!1552945))

(assert (= (and d!161171 res!1063039) b!1552944))

(assert (= (and b!1552944 res!1063040) b!1552939))

(declare-fun m!1431429 () Bool)

(assert (=> b!1552944 m!1431429))

(declare-fun m!1431431 () Bool)

(assert (=> b!1552941 m!1431431))

(declare-fun m!1431433 () Bool)

(assert (=> bm!71340 m!1431433))

(declare-fun m!1431435 () Bool)

(assert (=> d!161171 m!1431435))

(declare-fun m!1431437 () Bool)

(assert (=> d!161171 m!1431437))

(declare-fun m!1431439 () Bool)

(assert (=> b!1552939 m!1431439))

(assert (=> d!161053 d!161171))

(declare-fun d!161173 () Bool)

(declare-fun lt!669510 () Bool)

(assert (=> d!161173 (= lt!669510 (select (content!794 (toList!11191 lt!669406)) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun e!864555 () Bool)

(assert (=> d!161173 (= lt!669510 e!864555)))

(declare-fun res!1063042 () Bool)

(assert (=> d!161173 (=> (not res!1063042) (not e!864555))))

(assert (=> d!161173 (= res!1063042 ((_ is Cons!36212) (toList!11191 lt!669406)))))

(assert (=> d!161173 (= (contains!10134 (toList!11191 lt!669406) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!669510)))

(declare-fun b!1552947 () Bool)

(declare-fun e!864554 () Bool)

(assert (=> b!1552947 (= e!864555 e!864554)))

(declare-fun res!1063041 () Bool)

(assert (=> b!1552947 (=> res!1063041 e!864554)))

(assert (=> b!1552947 (= res!1063041 (= (h!37657 (toList!11191 lt!669406)) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun b!1552948 () Bool)

(assert (=> b!1552948 (= e!864554 (contains!10134 (t!50934 (toList!11191 lt!669406)) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161173 res!1063042) b!1552947))

(assert (= (and b!1552947 (not res!1063041)) b!1552948))

(declare-fun m!1431441 () Bool)

(assert (=> d!161173 m!1431441))

(declare-fun m!1431443 () Bool)

(assert (=> d!161173 m!1431443))

(declare-fun m!1431445 () Bool)

(assert (=> b!1552948 m!1431445))

(assert (=> b!1552706 d!161173))

(declare-fun b!1552949 () Bool)

(declare-fun e!864557 () Bool)

(declare-fun e!864556 () Bool)

(assert (=> b!1552949 (= e!864557 e!864556)))

(declare-fun lt!669511 () (_ BitVec 64))

(assert (=> b!1552949 (= lt!669511 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!669512 () Unit!51710)

(assert (=> b!1552949 (= lt!669512 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669511 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1552949 (arrayContainsKey!0 _keys!618 lt!669511 #b00000000000000000000000000000000)))

(declare-fun lt!669513 () Unit!51710)

(assert (=> b!1552949 (= lt!669513 lt!669512)))

(declare-fun res!1063044 () Bool)

(assert (=> b!1552949 (= res!1063044 (= (seekEntryOrOpen!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926) (Found!13516 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1552949 (=> (not res!1063044) (not e!864556))))

(declare-fun b!1552950 () Bool)

(declare-fun call!71346 () Bool)

(assert (=> b!1552950 (= e!864556 call!71346)))

(declare-fun bm!71343 () Bool)

(assert (=> bm!71343 (= call!71346 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1552951 () Bool)

(declare-fun e!864558 () Bool)

(assert (=> b!1552951 (= e!864558 e!864557)))

(declare-fun c!143117 () Bool)

(assert (=> b!1552951 (= c!143117 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1552952 () Bool)

(assert (=> b!1552952 (= e!864557 call!71346)))

(declare-fun d!161175 () Bool)

(declare-fun res!1063043 () Bool)

(assert (=> d!161175 (=> res!1063043 e!864558)))

(assert (=> d!161175 (= res!1063043 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(assert (=> d!161175 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926) e!864558)))

(assert (= (and d!161175 (not res!1063043)) b!1552951))

(assert (= (and b!1552951 c!143117) b!1552949))

(assert (= (and b!1552951 (not c!143117)) b!1552952))

(assert (= (and b!1552949 res!1063044) b!1552950))

(assert (= (or b!1552950 b!1552952) bm!71343))

(assert (=> b!1552949 m!1431365))

(declare-fun m!1431447 () Bool)

(assert (=> b!1552949 m!1431447))

(declare-fun m!1431449 () Bool)

(assert (=> b!1552949 m!1431449))

(assert (=> b!1552949 m!1431365))

(declare-fun m!1431451 () Bool)

(assert (=> b!1552949 m!1431451))

(declare-fun m!1431453 () Bool)

(assert (=> bm!71343 m!1431453))

(assert (=> b!1552951 m!1431365))

(assert (=> b!1552951 m!1431365))

(assert (=> b!1552951 m!1431367))

(assert (=> bm!71328 d!161175))

(declare-fun d!161177 () Bool)

(assert (=> d!161177 (= (get!26039 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!21990 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161085 d!161177))

(assert (=> d!161085 d!161155))

(assert (=> b!1552742 d!161091))

(declare-fun d!161179 () Bool)

(declare-fun e!864560 () Bool)

(assert (=> d!161179 e!864560))

(declare-fun res!1063045 () Bool)

(assert (=> d!161179 (=> res!1063045 e!864560)))

(declare-fun lt!669515 () Bool)

(assert (=> d!161179 (= res!1063045 (not lt!669515))))

(declare-fun lt!669516 () Bool)

(assert (=> d!161179 (= lt!669515 lt!669516)))

(declare-fun lt!669514 () Unit!51710)

(declare-fun e!864559 () Unit!51710)

(assert (=> d!161179 (= lt!669514 e!864559)))

(declare-fun c!143118 () Bool)

(assert (=> d!161179 (= c!143118 lt!669516)))

(assert (=> d!161179 (= lt!669516 (containsKey!754 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422))))

(assert (=> d!161179 (= (contains!10131 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)) lt!669422) lt!669515)))

(declare-fun b!1552953 () Bool)

(declare-fun lt!669517 () Unit!51710)

(assert (=> b!1552953 (= e!864559 lt!669517)))

(assert (=> b!1552953 (= lt!669517 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422))))

(assert (=> b!1552953 (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422))))

(declare-fun b!1552954 () Bool)

(declare-fun Unit!51721 () Unit!51710)

(assert (=> b!1552954 (= e!864559 Unit!51721)))

(declare-fun b!1552955 () Bool)

(assert (=> b!1552955 (= e!864560 (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422)))))

(assert (= (and d!161179 c!143118) b!1552953))

(assert (= (and d!161179 (not c!143118)) b!1552954))

(assert (= (and d!161179 (not res!1063045)) b!1552955))

(declare-fun m!1431455 () Bool)

(assert (=> d!161179 m!1431455))

(declare-fun m!1431457 () Bool)

(assert (=> b!1552953 m!1431457))

(declare-fun m!1431459 () Bool)

(assert (=> b!1552953 m!1431459))

(assert (=> b!1552953 m!1431459))

(declare-fun m!1431461 () Bool)

(assert (=> b!1552953 m!1431461))

(assert (=> b!1552955 m!1431459))

(assert (=> b!1552955 m!1431459))

(assert (=> b!1552955 m!1431461))

(assert (=> b!1552742 d!161179))

(declare-fun d!161181 () Bool)

(declare-fun e!864561 () Bool)

(assert (=> d!161181 e!864561))

(declare-fun res!1063047 () Bool)

(assert (=> d!161181 (=> (not res!1063047) (not e!864561))))

(declare-fun lt!669520 () ListLongMap!22351)

(assert (=> d!161181 (= res!1063047 (contains!10131 lt!669520 (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))

(declare-fun lt!669519 () List!36216)

(assert (=> d!161181 (= lt!669520 (ListLongMap!22352 lt!669519))))

(declare-fun lt!669521 () Unit!51710)

(declare-fun lt!669518 () Unit!51710)

(assert (=> d!161181 (= lt!669521 lt!669518)))

(assert (=> d!161181 (= (getValueByKey!732 lt!669519 (_1!12382 (tuple2!24743 lt!669425 lt!669427))) (Some!807 (_2!12382 (tuple2!24743 lt!669425 lt!669427))))))

(assert (=> d!161181 (= lt!669518 (lemmaContainsTupThenGetReturnValue!374 lt!669519 (_1!12382 (tuple2!24743 lt!669425 lt!669427)) (_2!12382 (tuple2!24743 lt!669425 lt!669427))))))

(assert (=> d!161181 (= lt!669519 (insertStrictlySorted!503 (toList!11191 lt!669423) (_1!12382 (tuple2!24743 lt!669425 lt!669427)) (_2!12382 (tuple2!24743 lt!669425 lt!669427))))))

(assert (=> d!161181 (= (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)) lt!669520)))

(declare-fun b!1552956 () Bool)

(declare-fun res!1063046 () Bool)

(assert (=> b!1552956 (=> (not res!1063046) (not e!864561))))

(assert (=> b!1552956 (= res!1063046 (= (getValueByKey!732 (toList!11191 lt!669520) (_1!12382 (tuple2!24743 lt!669425 lt!669427))) (Some!807 (_2!12382 (tuple2!24743 lt!669425 lt!669427)))))))

(declare-fun b!1552957 () Bool)

(assert (=> b!1552957 (= e!864561 (contains!10134 (toList!11191 lt!669520) (tuple2!24743 lt!669425 lt!669427)))))

(assert (= (and d!161181 res!1063047) b!1552956))

(assert (= (and b!1552956 res!1063046) b!1552957))

(declare-fun m!1431463 () Bool)

(assert (=> d!161181 m!1431463))

(declare-fun m!1431465 () Bool)

(assert (=> d!161181 m!1431465))

(declare-fun m!1431467 () Bool)

(assert (=> d!161181 m!1431467))

(declare-fun m!1431469 () Bool)

(assert (=> d!161181 m!1431469))

(declare-fun m!1431471 () Bool)

(assert (=> b!1552956 m!1431471))

(declare-fun m!1431473 () Bool)

(assert (=> b!1552957 m!1431473))

(assert (=> b!1552742 d!161181))

(declare-fun d!161183 () Bool)

(assert (=> d!161183 (not (contains!10131 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)) lt!669422))))

(declare-fun lt!669524 () Unit!51710)

(declare-fun choose!2039 (ListLongMap!22351 (_ BitVec 64) V!59391 (_ BitVec 64)) Unit!51710)

(assert (=> d!161183 (= lt!669524 (choose!2039 lt!669423 lt!669425 lt!669427 lt!669422))))

(declare-fun e!864564 () Bool)

(assert (=> d!161183 e!864564))

(declare-fun res!1063050 () Bool)

(assert (=> d!161183 (=> (not res!1063050) (not e!864564))))

(assert (=> d!161183 (= res!1063050 (not (contains!10131 lt!669423 lt!669422)))))

(assert (=> d!161183 (= (addStillNotContains!513 lt!669423 lt!669425 lt!669427 lt!669422) lt!669524)))

(declare-fun b!1552961 () Bool)

(assert (=> b!1552961 (= e!864564 (not (= lt!669425 lt!669422)))))

(assert (= (and d!161183 res!1063050) b!1552961))

(assert (=> d!161183 m!1431193))

(assert (=> d!161183 m!1431193))

(assert (=> d!161183 m!1431195))

(declare-fun m!1431475 () Bool)

(assert (=> d!161183 m!1431475))

(declare-fun m!1431477 () Bool)

(assert (=> d!161183 m!1431477))

(assert (=> b!1552742 d!161183))

(declare-fun d!161185 () Bool)

(declare-fun e!864565 () Bool)

(assert (=> d!161185 e!864565))

(declare-fun res!1063052 () Bool)

(assert (=> d!161185 (=> (not res!1063052) (not e!864565))))

(declare-fun lt!669527 () ListLongMap!22351)

(assert (=> d!161185 (= res!1063052 (contains!10131 lt!669527 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!669526 () List!36216)

(assert (=> d!161185 (= lt!669527 (ListLongMap!22352 lt!669526))))

(declare-fun lt!669528 () Unit!51710)

(declare-fun lt!669525 () Unit!51710)

(assert (=> d!161185 (= lt!669528 lt!669525)))

(assert (=> d!161185 (= (getValueByKey!732 lt!669526 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!807 (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161185 (= lt!669525 (lemmaContainsTupThenGetReturnValue!374 lt!669526 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161185 (= lt!669526 (insertStrictlySorted!503 (toList!11191 call!71328) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161185 (= (+!5011 call!71328 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!669527)))

(declare-fun b!1552962 () Bool)

(declare-fun res!1063051 () Bool)

(assert (=> b!1552962 (=> (not res!1063051) (not e!864565))))

(assert (=> b!1552962 (= res!1063051 (= (getValueByKey!732 (toList!11191 lt!669527) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!807 (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1552963 () Bool)

(assert (=> b!1552963 (= e!864565 (contains!10134 (toList!11191 lt!669527) (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!161185 res!1063052) b!1552962))

(assert (= (and b!1552962 res!1063051) b!1552963))

(declare-fun m!1431479 () Bool)

(assert (=> d!161185 m!1431479))

(declare-fun m!1431481 () Bool)

(assert (=> d!161185 m!1431481))

(declare-fun m!1431483 () Bool)

(assert (=> d!161185 m!1431483))

(declare-fun m!1431485 () Bool)

(assert (=> d!161185 m!1431485))

(declare-fun m!1431487 () Bool)

(assert (=> b!1552962 m!1431487))

(declare-fun m!1431489 () Bool)

(assert (=> b!1552963 m!1431489))

(assert (=> b!1552742 d!161185))

(declare-fun d!161187 () Bool)

(declare-fun e!864567 () Bool)

(assert (=> d!161187 e!864567))

(declare-fun res!1063053 () Bool)

(assert (=> d!161187 (=> res!1063053 e!864567)))

(declare-fun lt!669530 () Bool)

(assert (=> d!161187 (= res!1063053 (not lt!669530))))

(declare-fun lt!669531 () Bool)

(assert (=> d!161187 (= lt!669530 lt!669531)))

(declare-fun lt!669529 () Unit!51710)

(declare-fun e!864566 () Unit!51710)

(assert (=> d!161187 (= lt!669529 e!864566)))

(declare-fun c!143119 () Bool)

(assert (=> d!161187 (= c!143119 lt!669531)))

(assert (=> d!161187 (= lt!669531 (containsKey!754 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161187 (= (contains!10131 lt!669428 (select (arr!50010 _keys!618) from!762)) lt!669530)))

(declare-fun b!1552964 () Bool)

(declare-fun lt!669532 () Unit!51710)

(assert (=> b!1552964 (= e!864566 lt!669532)))

(assert (=> b!1552964 (= lt!669532 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)))))

(assert (=> b!1552964 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)))))

(declare-fun b!1552965 () Bool)

(declare-fun Unit!51722 () Unit!51710)

(assert (=> b!1552965 (= e!864566 Unit!51722)))

(declare-fun b!1552966 () Bool)

(assert (=> b!1552966 (= e!864567 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762))))))

(assert (= (and d!161187 c!143119) b!1552964))

(assert (= (and d!161187 (not c!143119)) b!1552965))

(assert (= (and d!161187 (not res!1063053)) b!1552966))

(assert (=> d!161187 m!1431023))

(declare-fun m!1431491 () Bool)

(assert (=> d!161187 m!1431491))

(assert (=> b!1552964 m!1431023))

(declare-fun m!1431493 () Bool)

(assert (=> b!1552964 m!1431493))

(assert (=> b!1552964 m!1431023))

(declare-fun m!1431495 () Bool)

(assert (=> b!1552964 m!1431495))

(assert (=> b!1552964 m!1431495))

(declare-fun m!1431497 () Bool)

(assert (=> b!1552964 m!1431497))

(assert (=> b!1552966 m!1431023))

(assert (=> b!1552966 m!1431495))

(assert (=> b!1552966 m!1431495))

(assert (=> b!1552966 m!1431497))

(assert (=> b!1552740 d!161187))

(assert (=> d!161049 d!161061))

(assert (=> d!161049 d!161065))

(declare-fun d!161189 () Bool)

(assert (=> d!161189 (= (apply!1111 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50010 _keys!618) from!762)) (get!26039 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762))))))

(declare-fun bs!44615 () Bool)

(assert (= bs!44615 d!161189))

(assert (=> bs!44615 m!1431023))

(assert (=> bs!44615 m!1431279))

(assert (=> bs!44615 m!1431279))

(declare-fun m!1431499 () Bool)

(assert (=> bs!44615 m!1431499))

(assert (=> d!161049 d!161189))

(declare-fun d!161191 () Bool)

(assert (=> d!161191 (= (apply!1111 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50010 _keys!618) from!762)) (apply!1111 lt!669329 (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161191 true))

(declare-fun _$34!1192 () Unit!51710)

(assert (=> d!161191 (= (choose!2035 lt!669329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50010 _keys!618) from!762)) _$34!1192)))

(declare-fun bs!44616 () Bool)

(assert (= bs!44616 d!161191))

(assert (=> bs!44616 m!1431049))

(assert (=> bs!44616 m!1431049))

(assert (=> bs!44616 m!1431023))

(assert (=> bs!44616 m!1431137))

(assert (=> bs!44616 m!1431023))

(assert (=> bs!44616 m!1431053))

(assert (=> d!161049 d!161191))

(assert (=> d!161049 d!161101))

(declare-fun d!161193 () Bool)

(declare-fun res!1063054 () Bool)

(declare-fun e!864568 () Bool)

(assert (=> d!161193 (=> res!1063054 e!864568)))

(assert (=> d!161193 (= res!1063054 (and ((_ is Cons!36212) (toList!11191 lt!669336)) (= (_1!12382 (h!37657 (toList!11191 lt!669336))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161193 (= (containsKey!754 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000) e!864568)))

(declare-fun b!1552967 () Bool)

(declare-fun e!864569 () Bool)

(assert (=> b!1552967 (= e!864568 e!864569)))

(declare-fun res!1063055 () Bool)

(assert (=> b!1552967 (=> (not res!1063055) (not e!864569))))

(assert (=> b!1552967 (= res!1063055 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669336))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669336))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36212) (toList!11191 lt!669336)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669336))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552968 () Bool)

(assert (=> b!1552968 (= e!864569 (containsKey!754 (t!50934 (toList!11191 lt!669336)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161193 (not res!1063054)) b!1552967))

(assert (= (and b!1552967 res!1063055) b!1552968))

(declare-fun m!1431501 () Bool)

(assert (=> b!1552968 m!1431501))

(assert (=> d!161081 d!161193))

(declare-fun d!161195 () Bool)

(declare-fun res!1063056 () Bool)

(declare-fun e!864570 () Bool)

(assert (=> d!161195 (=> res!1063056 e!864570)))

(assert (=> d!161195 (= res!1063056 (and ((_ is Cons!36212) (toList!11191 lt!669336)) (= (_1!12382 (h!37657 (toList!11191 lt!669336))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161195 (= (containsKey!754 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000) e!864570)))

(declare-fun b!1552969 () Bool)

(declare-fun e!864571 () Bool)

(assert (=> b!1552969 (= e!864570 e!864571)))

(declare-fun res!1063057 () Bool)

(assert (=> b!1552969 (=> (not res!1063057) (not e!864571))))

(assert (=> b!1552969 (= res!1063057 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669336))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669336))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36212) (toList!11191 lt!669336)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669336))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552970 () Bool)

(assert (=> b!1552970 (= e!864571 (containsKey!754 (t!50934 (toList!11191 lt!669336)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161195 (not res!1063056)) b!1552969))

(assert (= (and b!1552969 res!1063057) b!1552970))

(declare-fun m!1431503 () Bool)

(assert (=> b!1552970 m!1431503))

(assert (=> d!161083 d!161195))

(declare-fun d!161197 () Bool)

(declare-fun e!864573 () Bool)

(assert (=> d!161197 e!864573))

(declare-fun res!1063058 () Bool)

(assert (=> d!161197 (=> res!1063058 e!864573)))

(declare-fun lt!669534 () Bool)

(assert (=> d!161197 (= res!1063058 (not lt!669534))))

(declare-fun lt!669535 () Bool)

(assert (=> d!161197 (= lt!669534 lt!669535)))

(declare-fun lt!669533 () Unit!51710)

(declare-fun e!864572 () Unit!51710)

(assert (=> d!161197 (= lt!669533 e!864572)))

(declare-fun c!143120 () Bool)

(assert (=> d!161197 (= c!143120 lt!669535)))

(assert (=> d!161197 (= lt!669535 (containsKey!754 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161197 (= (contains!10131 lt!669435 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669534)))

(declare-fun b!1552971 () Bool)

(declare-fun lt!669536 () Unit!51710)

(assert (=> b!1552971 (= e!864572 lt!669536)))

(assert (=> b!1552971 (= lt!669536 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1552971 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552972 () Bool)

(declare-fun Unit!51723 () Unit!51710)

(assert (=> b!1552972 (= e!864572 Unit!51723)))

(declare-fun b!1552973 () Bool)

(assert (=> b!1552973 (= e!864573 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!161197 c!143120) b!1552971))

(assert (= (and d!161197 (not c!143120)) b!1552972))

(assert (= (and d!161197 (not res!1063058)) b!1552973))

(declare-fun m!1431505 () Bool)

(assert (=> d!161197 m!1431505))

(declare-fun m!1431507 () Bool)

(assert (=> b!1552971 m!1431507))

(assert (=> b!1552971 m!1431227))

(assert (=> b!1552971 m!1431227))

(declare-fun m!1431509 () Bool)

(assert (=> b!1552971 m!1431509))

(assert (=> b!1552973 m!1431227))

(assert (=> b!1552973 m!1431227))

(assert (=> b!1552973 m!1431509))

(assert (=> d!161079 d!161197))

(declare-fun b!1552977 () Bool)

(declare-fun e!864575 () Option!808)

(assert (=> b!1552977 (= e!864575 None!806)))

(declare-fun b!1552975 () Bool)

(declare-fun e!864574 () Option!808)

(assert (=> b!1552975 (= e!864574 e!864575)))

(declare-fun c!143122 () Bool)

(assert (=> b!1552975 (= c!143122 (and ((_ is Cons!36212) lt!669434) (not (= (_1!12382 (h!37657 lt!669434)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun d!161199 () Bool)

(declare-fun c!143121 () Bool)

(assert (=> d!161199 (= c!143121 (and ((_ is Cons!36212) lt!669434) (= (_1!12382 (h!37657 lt!669434)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161199 (= (getValueByKey!732 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864574)))

(declare-fun b!1552974 () Bool)

(assert (=> b!1552974 (= e!864574 (Some!807 (_2!12382 (h!37657 lt!669434))))))

(declare-fun b!1552976 () Bool)

(assert (=> b!1552976 (= e!864575 (getValueByKey!732 (t!50934 lt!669434) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161199 c!143121) b!1552974))

(assert (= (and d!161199 (not c!143121)) b!1552975))

(assert (= (and b!1552975 c!143122) b!1552976))

(assert (= (and b!1552975 (not c!143122)) b!1552977))

(declare-fun m!1431511 () Bool)

(assert (=> b!1552976 m!1431511))

(assert (=> d!161079 d!161199))

(declare-fun d!161201 () Bool)

(assert (=> d!161201 (= (getValueByKey!732 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!807 (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669537 () Unit!51710)

(assert (=> d!161201 (= lt!669537 (choose!2038 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864576 () Bool)

(assert (=> d!161201 e!864576))

(declare-fun res!1063059 () Bool)

(assert (=> d!161201 (=> (not res!1063059) (not e!864576))))

(assert (=> d!161201 (= res!1063059 (isStrictlySorted!887 lt!669434))))

(assert (=> d!161201 (= (lemmaContainsTupThenGetReturnValue!374 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669537)))

(declare-fun b!1552978 () Bool)

(declare-fun res!1063060 () Bool)

(assert (=> b!1552978 (=> (not res!1063060) (not e!864576))))

(assert (=> b!1552978 (= res!1063060 (containsKey!754 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552979 () Bool)

(assert (=> b!1552979 (= e!864576 (contains!10134 lt!669434 (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!161201 res!1063059) b!1552978))

(assert (= (and b!1552978 res!1063060) b!1552979))

(assert (=> d!161201 m!1431221))

(declare-fun m!1431513 () Bool)

(assert (=> d!161201 m!1431513))

(declare-fun m!1431515 () Bool)

(assert (=> d!161201 m!1431515))

(declare-fun m!1431517 () Bool)

(assert (=> b!1552978 m!1431517))

(declare-fun m!1431519 () Bool)

(assert (=> b!1552979 m!1431519))

(assert (=> d!161079 d!161201))

(declare-fun b!1552980 () Bool)

(declare-fun e!864581 () List!36216)

(declare-fun call!71349 () List!36216)

(assert (=> b!1552980 (= e!864581 call!71349)))

(declare-fun b!1552981 () Bool)

(declare-fun e!864578 () List!36216)

(declare-fun call!71348 () List!36216)

(assert (=> b!1552981 (= e!864578 call!71348)))

(declare-fun e!864579 () List!36216)

(declare-fun c!143126 () Bool)

(declare-fun bm!71344 () Bool)

(assert (=> bm!71344 (= call!71349 ($colon$colon!944 e!864579 (ite c!143126 (h!37657 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun c!143124 () Bool)

(assert (=> bm!71344 (= c!143124 c!143126)))

(declare-fun e!864577 () Bool)

(declare-fun b!1552982 () Bool)

(declare-fun lt!669538 () List!36216)

(assert (=> b!1552982 (= e!864577 (contains!10134 lt!669538 (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161203 () Bool)

(assert (=> d!161203 e!864577))

(declare-fun res!1063061 () Bool)

(assert (=> d!161203 (=> (not res!1063061) (not e!864577))))

(assert (=> d!161203 (= res!1063061 (isStrictlySorted!887 lt!669538))))

(assert (=> d!161203 (= lt!669538 e!864581)))

(assert (=> d!161203 (= c!143126 (and ((_ is Cons!36212) (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (bvslt (_1!12382 (h!37657 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161203 (isStrictlySorted!887 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))))

(assert (=> d!161203 (= (insertStrictlySorted!503 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669538)))

(declare-fun b!1552983 () Bool)

(declare-fun e!864580 () List!36216)

(assert (=> b!1552983 (= e!864581 e!864580)))

(declare-fun c!143123 () Bool)

(assert (=> b!1552983 (= c!143123 (and ((_ is Cons!36212) (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (= (_1!12382 (h!37657 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1552984 () Bool)

(assert (=> b!1552984 (= e!864579 (insertStrictlySorted!503 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1552985 () Bool)

(assert (=> b!1552985 (= e!864578 call!71348)))

(declare-fun b!1552986 () Bool)

(declare-fun c!143125 () Bool)

(assert (=> b!1552986 (= c!143125 (and ((_ is Cons!36212) (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (bvsgt (_1!12382 (h!37657 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> b!1552986 (= e!864580 e!864578)))

(declare-fun b!1552987 () Bool)

(declare-fun res!1063062 () Bool)

(assert (=> b!1552987 (=> (not res!1063062) (not e!864577))))

(assert (=> b!1552987 (= res!1063062 (containsKey!754 lt!669538 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun bm!71345 () Bool)

(declare-fun call!71347 () List!36216)

(assert (=> bm!71345 (= call!71347 call!71349)))

(declare-fun bm!71346 () Bool)

(assert (=> bm!71346 (= call!71348 call!71347)))

(declare-fun b!1552988 () Bool)

(assert (=> b!1552988 (= e!864579 (ite c!143123 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (ite c!143125 (Cons!36212 (h!37657 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) Nil!36213)))))

(declare-fun b!1552989 () Bool)

(assert (=> b!1552989 (= e!864580 call!71347)))

(assert (= (and d!161203 c!143126) b!1552980))

(assert (= (and d!161203 (not c!143126)) b!1552983))

(assert (= (and b!1552983 c!143123) b!1552989))

(assert (= (and b!1552983 (not c!143123)) b!1552986))

(assert (= (and b!1552986 c!143125) b!1552985))

(assert (= (and b!1552986 (not c!143125)) b!1552981))

(assert (= (or b!1552985 b!1552981) bm!71346))

(assert (= (or b!1552989 bm!71346) bm!71345))

(assert (= (or b!1552980 bm!71345) bm!71344))

(assert (= (and bm!71344 c!143124) b!1552984))

(assert (= (and bm!71344 (not c!143124)) b!1552988))

(assert (= (and d!161203 res!1063061) b!1552987))

(assert (= (and b!1552987 res!1063062) b!1552982))

(declare-fun m!1431521 () Bool)

(assert (=> b!1552987 m!1431521))

(declare-fun m!1431523 () Bool)

(assert (=> b!1552984 m!1431523))

(declare-fun m!1431525 () Bool)

(assert (=> bm!71344 m!1431525))

(declare-fun m!1431527 () Bool)

(assert (=> d!161203 m!1431527))

(declare-fun m!1431529 () Bool)

(assert (=> d!161203 m!1431529))

(declare-fun m!1431531 () Bool)

(assert (=> b!1552982 m!1431531))

(assert (=> d!161079 d!161203))

(declare-fun d!161205 () Bool)

(declare-fun lt!669539 () Bool)

(assert (=> d!161205 (= lt!669539 (select (content!794 (toList!11191 lt!669399)) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!864583 () Bool)

(assert (=> d!161205 (= lt!669539 e!864583)))

(declare-fun res!1063064 () Bool)

(assert (=> d!161205 (=> (not res!1063064) (not e!864583))))

(assert (=> d!161205 (= res!1063064 ((_ is Cons!36212) (toList!11191 lt!669399)))))

(assert (=> d!161205 (= (contains!10134 (toList!11191 lt!669399) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669539)))

(declare-fun b!1552990 () Bool)

(declare-fun e!864582 () Bool)

(assert (=> b!1552990 (= e!864583 e!864582)))

(declare-fun res!1063063 () Bool)

(assert (=> b!1552990 (=> res!1063063 e!864582)))

(assert (=> b!1552990 (= res!1063063 (= (h!37657 (toList!11191 lt!669399)) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552991 () Bool)

(assert (=> b!1552991 (= e!864582 (contains!10134 (t!50934 (toList!11191 lt!669399)) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161205 res!1063064) b!1552990))

(assert (= (and b!1552990 (not res!1063063)) b!1552991))

(declare-fun m!1431533 () Bool)

(assert (=> d!161205 m!1431533))

(declare-fun m!1431535 () Bool)

(assert (=> d!161205 m!1431535))

(declare-fun m!1431537 () Bool)

(assert (=> b!1552991 m!1431537))

(assert (=> b!1552703 d!161205))

(declare-fun d!161207 () Bool)

(assert (=> d!161207 (= (get!26040 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21988 (select (arr!50011 _values!470) from!762)))))

(assert (=> b!1552760 d!161207))

(declare-fun d!161209 () Bool)

(declare-fun e!864585 () Bool)

(assert (=> d!161209 e!864585))

(declare-fun res!1063065 () Bool)

(assert (=> d!161209 (=> res!1063065 e!864585)))

(declare-fun lt!669541 () Bool)

(assert (=> d!161209 (= res!1063065 (not lt!669541))))

(declare-fun lt!669542 () Bool)

(assert (=> d!161209 (= lt!669541 lt!669542)))

(declare-fun lt!669540 () Unit!51710)

(declare-fun e!864584 () Unit!51710)

(assert (=> d!161209 (= lt!669540 e!864584)))

(declare-fun c!143127 () Bool)

(assert (=> d!161209 (= c!143127 lt!669542)))

(assert (=> d!161209 (= lt!669542 (containsKey!754 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161209 (= (contains!10131 lt!669406 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669541)))

(declare-fun b!1552992 () Bool)

(declare-fun lt!669543 () Unit!51710)

(assert (=> b!1552992 (= e!864584 lt!669543)))

(assert (=> b!1552992 (= lt!669543 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> b!1552992 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1552993 () Bool)

(declare-fun Unit!51724 () Unit!51710)

(assert (=> b!1552993 (= e!864584 Unit!51724)))

(declare-fun b!1552994 () Bool)

(assert (=> b!1552994 (= e!864585 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!161209 c!143127) b!1552992))

(assert (= (and d!161209 (not c!143127)) b!1552993))

(assert (= (and d!161209 (not res!1063065)) b!1552994))

(declare-fun m!1431539 () Bool)

(assert (=> d!161209 m!1431539))

(declare-fun m!1431541 () Bool)

(assert (=> b!1552992 m!1431541))

(assert (=> b!1552992 m!1431179))

(assert (=> b!1552992 m!1431179))

(declare-fun m!1431543 () Bool)

(assert (=> b!1552992 m!1431543))

(assert (=> b!1552994 m!1431179))

(assert (=> b!1552994 m!1431179))

(assert (=> b!1552994 m!1431543))

(assert (=> d!161061 d!161209))

(declare-fun b!1552998 () Bool)

(declare-fun e!864587 () Option!808)

(assert (=> b!1552998 (= e!864587 None!806)))

(declare-fun b!1552996 () Bool)

(declare-fun e!864586 () Option!808)

(assert (=> b!1552996 (= e!864586 e!864587)))

(declare-fun c!143129 () Bool)

(assert (=> b!1552996 (= c!143129 (and ((_ is Cons!36212) lt!669405) (not (= (_1!12382 (h!37657 lt!669405)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun d!161211 () Bool)

(declare-fun c!143128 () Bool)

(assert (=> d!161211 (= c!143128 (and ((_ is Cons!36212) lt!669405) (= (_1!12382 (h!37657 lt!669405)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161211 (= (getValueByKey!732 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864586)))

(declare-fun b!1552995 () Bool)

(assert (=> b!1552995 (= e!864586 (Some!807 (_2!12382 (h!37657 lt!669405))))))

(declare-fun b!1552997 () Bool)

(assert (=> b!1552997 (= e!864587 (getValueByKey!732 (t!50934 lt!669405) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161211 c!143128) b!1552995))

(assert (= (and d!161211 (not c!143128)) b!1552996))

(assert (= (and b!1552996 c!143129) b!1552997))

(assert (= (and b!1552996 (not c!143129)) b!1552998))

(declare-fun m!1431545 () Bool)

(assert (=> b!1552997 m!1431545))

(assert (=> d!161061 d!161211))

(declare-fun d!161213 () Bool)

(assert (=> d!161213 (= (getValueByKey!732 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!669544 () Unit!51710)

(assert (=> d!161213 (= lt!669544 (choose!2038 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun e!864588 () Bool)

(assert (=> d!161213 e!864588))

(declare-fun res!1063066 () Bool)

(assert (=> d!161213 (=> (not res!1063066) (not e!864588))))

(assert (=> d!161213 (= res!1063066 (isStrictlySorted!887 lt!669405))))

(assert (=> d!161213 (= (lemmaContainsTupThenGetReturnValue!374 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669544)))

(declare-fun b!1552999 () Bool)

(declare-fun res!1063067 () Bool)

(assert (=> b!1552999 (=> (not res!1063067) (not e!864588))))

(assert (=> b!1552999 (= res!1063067 (containsKey!754 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1553000 () Bool)

(assert (=> b!1553000 (= e!864588 (contains!10134 lt!669405 (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!161213 res!1063066) b!1552999))

(assert (= (and b!1552999 res!1063067) b!1553000))

(assert (=> d!161213 m!1431173))

(declare-fun m!1431547 () Bool)

(assert (=> d!161213 m!1431547))

(declare-fun m!1431549 () Bool)

(assert (=> d!161213 m!1431549))

(declare-fun m!1431551 () Bool)

(assert (=> b!1552999 m!1431551))

(declare-fun m!1431553 () Bool)

(assert (=> b!1553000 m!1431553))

(assert (=> d!161061 d!161213))

(declare-fun b!1553001 () Bool)

(declare-fun e!864593 () List!36216)

(declare-fun call!71352 () List!36216)

(assert (=> b!1553001 (= e!864593 call!71352)))

(declare-fun b!1553002 () Bool)

(declare-fun e!864590 () List!36216)

(declare-fun call!71351 () List!36216)

(assert (=> b!1553002 (= e!864590 call!71351)))

(declare-fun e!864591 () List!36216)

(declare-fun bm!71347 () Bool)

(declare-fun c!143133 () Bool)

(assert (=> bm!71347 (= call!71352 ($colon$colon!944 e!864591 (ite c!143133 (h!37657 (toList!11191 lt!669329)) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun c!143131 () Bool)

(assert (=> bm!71347 (= c!143131 c!143133)))

(declare-fun b!1553003 () Bool)

(declare-fun e!864589 () Bool)

(declare-fun lt!669545 () List!36216)

(assert (=> b!1553003 (= e!864589 (contains!10134 lt!669545 (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun d!161215 () Bool)

(assert (=> d!161215 e!864589))

(declare-fun res!1063068 () Bool)

(assert (=> d!161215 (=> (not res!1063068) (not e!864589))))

(assert (=> d!161215 (= res!1063068 (isStrictlySorted!887 lt!669545))))

(assert (=> d!161215 (= lt!669545 e!864593)))

(assert (=> d!161215 (= c!143133 (and ((_ is Cons!36212) (toList!11191 lt!669329)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669329))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161215 (isStrictlySorted!887 (toList!11191 lt!669329))))

(assert (=> d!161215 (= (insertStrictlySorted!503 (toList!11191 lt!669329) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669545)))

(declare-fun b!1553004 () Bool)

(declare-fun e!864592 () List!36216)

(assert (=> b!1553004 (= e!864593 e!864592)))

(declare-fun c!143130 () Bool)

(assert (=> b!1553004 (= c!143130 (and ((_ is Cons!36212) (toList!11191 lt!669329)) (= (_1!12382 (h!37657 (toList!11191 lt!669329))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553005 () Bool)

(assert (=> b!1553005 (= e!864591 (insertStrictlySorted!503 (t!50934 (toList!11191 lt!669329)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1553006 () Bool)

(assert (=> b!1553006 (= e!864590 call!71351)))

(declare-fun b!1553007 () Bool)

(declare-fun c!143132 () Bool)

(assert (=> b!1553007 (= c!143132 (and ((_ is Cons!36212) (toList!11191 lt!669329)) (bvsgt (_1!12382 (h!37657 (toList!11191 lt!669329))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> b!1553007 (= e!864592 e!864590)))

(declare-fun b!1553008 () Bool)

(declare-fun res!1063069 () Bool)

(assert (=> b!1553008 (=> (not res!1063069) (not e!864589))))

(assert (=> b!1553008 (= res!1063069 (containsKey!754 lt!669545 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun bm!71348 () Bool)

(declare-fun call!71350 () List!36216)

(assert (=> bm!71348 (= call!71350 call!71352)))

(declare-fun bm!71349 () Bool)

(assert (=> bm!71349 (= call!71351 call!71350)))

(declare-fun b!1553009 () Bool)

(assert (=> b!1553009 (= e!864591 (ite c!143130 (t!50934 (toList!11191 lt!669329)) (ite c!143132 (Cons!36212 (h!37657 (toList!11191 lt!669329)) (t!50934 (toList!11191 lt!669329))) Nil!36213)))))

(declare-fun b!1553010 () Bool)

(assert (=> b!1553010 (= e!864592 call!71350)))

(assert (= (and d!161215 c!143133) b!1553001))

(assert (= (and d!161215 (not c!143133)) b!1553004))

(assert (= (and b!1553004 c!143130) b!1553010))

(assert (= (and b!1553004 (not c!143130)) b!1553007))

(assert (= (and b!1553007 c!143132) b!1553006))

(assert (= (and b!1553007 (not c!143132)) b!1553002))

(assert (= (or b!1553006 b!1553002) bm!71349))

(assert (= (or b!1553010 bm!71349) bm!71348))

(assert (= (or b!1553001 bm!71348) bm!71347))

(assert (= (and bm!71347 c!143131) b!1553005))

(assert (= (and bm!71347 (not c!143131)) b!1553009))

(assert (= (and d!161215 res!1063068) b!1553008))

(assert (= (and b!1553008 res!1063069) b!1553003))

(declare-fun m!1431555 () Bool)

(assert (=> b!1553008 m!1431555))

(declare-fun m!1431557 () Bool)

(assert (=> b!1553005 m!1431557))

(declare-fun m!1431559 () Bool)

(assert (=> bm!71347 m!1431559))

(declare-fun m!1431561 () Bool)

(assert (=> d!161215 m!1431561))

(assert (=> d!161215 m!1431437))

(declare-fun m!1431563 () Bool)

(assert (=> b!1553003 m!1431563))

(assert (=> d!161061 d!161215))

(assert (=> b!1552680 d!161095))

(declare-fun d!161217 () Bool)

(declare-fun isEmpty!1134 (List!36216) Bool)

(assert (=> d!161217 (= (isEmpty!1132 lt!669428) (isEmpty!1134 (toList!11191 lt!669428)))))

(declare-fun bs!44617 () Bool)

(assert (= bs!44617 d!161217))

(declare-fun m!1431565 () Bool)

(assert (=> bs!44617 m!1431565))

(assert (=> b!1552731 d!161217))

(declare-fun d!161219 () Bool)

(declare-fun e!864595 () Bool)

(assert (=> d!161219 e!864595))

(declare-fun res!1063070 () Bool)

(assert (=> d!161219 (=> res!1063070 e!864595)))

(declare-fun lt!669547 () Bool)

(assert (=> d!161219 (= res!1063070 (not lt!669547))))

(declare-fun lt!669548 () Bool)

(assert (=> d!161219 (= lt!669547 lt!669548)))

(declare-fun lt!669546 () Unit!51710)

(declare-fun e!864594 () Unit!51710)

(assert (=> d!161219 (= lt!669546 e!864594)))

(declare-fun c!143134 () Bool)

(assert (=> d!161219 (= c!143134 lt!669548)))

(assert (=> d!161219 (= lt!669548 (containsKey!754 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161219 (= (contains!10131 lt!669428 #b0000000000000000000000000000000000000000000000000000000000000000) lt!669547)))

(declare-fun b!1553011 () Bool)

(declare-fun lt!669549 () Unit!51710)

(assert (=> b!1553011 (= e!864594 lt!669549)))

(assert (=> b!1553011 (= lt!669549 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1553011 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1553012 () Bool)

(declare-fun Unit!51725 () Unit!51710)

(assert (=> b!1553012 (= e!864594 Unit!51725)))

(declare-fun b!1553013 () Bool)

(assert (=> b!1553013 (= e!864595 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161219 c!143134) b!1553011))

(assert (= (and d!161219 (not c!143134)) b!1553012))

(assert (= (and d!161219 (not res!1063070)) b!1553013))

(declare-fun m!1431567 () Bool)

(assert (=> d!161219 m!1431567))

(declare-fun m!1431569 () Bool)

(assert (=> b!1553011 m!1431569))

(declare-fun m!1431571 () Bool)

(assert (=> b!1553011 m!1431571))

(assert (=> b!1553011 m!1431571))

(declare-fun m!1431573 () Bool)

(assert (=> b!1553011 m!1431573))

(assert (=> b!1553013 m!1431571))

(assert (=> b!1553013 m!1431571))

(assert (=> b!1553013 m!1431573))

(assert (=> d!161063 d!161219))

(assert (=> d!161063 d!161067))

(declare-fun d!161221 () Bool)

(declare-fun lt!669552 () Bool)

(declare-fun content!795 (List!36217) (InoxSet (_ BitVec 64)))

(assert (=> d!161221 (= lt!669552 (select (content!795 Nil!36214) (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun e!864601 () Bool)

(assert (=> d!161221 (= lt!669552 e!864601)))

(declare-fun res!1063076 () Bool)

(assert (=> d!161221 (=> (not res!1063076) (not e!864601))))

(assert (=> d!161221 (= res!1063076 ((_ is Cons!36213) Nil!36214))))

(assert (=> d!161221 (= (contains!10133 Nil!36214 (select (arr!50010 _keys!618) #b00000000000000000000000000000000)) lt!669552)))

(declare-fun b!1553018 () Bool)

(declare-fun e!864600 () Bool)

(assert (=> b!1553018 (= e!864601 e!864600)))

(declare-fun res!1063075 () Bool)

(assert (=> b!1553018 (=> res!1063075 e!864600)))

(assert (=> b!1553018 (= res!1063075 (= (h!37658 Nil!36214) (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1553019 () Bool)

(assert (=> b!1553019 (= e!864600 (contains!10133 (t!50935 Nil!36214) (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!161221 res!1063076) b!1553018))

(assert (= (and b!1553018 (not res!1063075)) b!1553019))

(declare-fun m!1431575 () Bool)

(assert (=> d!161221 m!1431575))

(assert (=> d!161221 m!1431125))

(declare-fun m!1431577 () Bool)

(assert (=> d!161221 m!1431577))

(assert (=> b!1553019 m!1431125))

(declare-fun m!1431579 () Bool)

(assert (=> b!1553019 m!1431579))

(assert (=> b!1552683 d!161221))

(declare-fun b!1553023 () Bool)

(declare-fun e!864603 () Option!808)

(assert (=> b!1553023 (= e!864603 None!806)))

(declare-fun b!1553021 () Bool)

(declare-fun e!864602 () Option!808)

(assert (=> b!1553021 (= e!864602 e!864603)))

(declare-fun c!143136 () Bool)

(assert (=> b!1553021 (= c!143136 (and ((_ is Cons!36212) (toList!11191 lt!669435)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669435))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun d!161223 () Bool)

(declare-fun c!143135 () Bool)

(assert (=> d!161223 (= c!143135 (and ((_ is Cons!36212) (toList!11191 lt!669435)) (= (_1!12382 (h!37657 (toList!11191 lt!669435))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161223 (= (getValueByKey!732 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864602)))

(declare-fun b!1553020 () Bool)

(assert (=> b!1553020 (= e!864602 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669435)))))))

(declare-fun b!1553022 () Bool)

(assert (=> b!1553022 (= e!864603 (getValueByKey!732 (t!50934 (toList!11191 lt!669435)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161223 c!143135) b!1553020))

(assert (= (and d!161223 (not c!143135)) b!1553021))

(assert (= (and b!1553021 c!143136) b!1553022))

(assert (= (and b!1553021 (not c!143136)) b!1553023))

(declare-fun m!1431581 () Bool)

(assert (=> b!1553022 m!1431581))

(assert (=> b!1552746 d!161223))

(declare-fun d!161225 () Bool)

(assert (=> d!161225 (= (get!26039 (getValueByKey!732 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762))) (v!21990 (getValueByKey!732 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161065 d!161225))

(declare-fun b!1553027 () Bool)

(declare-fun e!864605 () Option!808)

(assert (=> b!1553027 (= e!864605 None!806)))

(declare-fun b!1553025 () Bool)

(declare-fun e!864604 () Option!808)

(assert (=> b!1553025 (= e!864604 e!864605)))

(declare-fun c!143138 () Bool)

(assert (=> b!1553025 (= c!143138 (and ((_ is Cons!36212) (toList!11191 lt!669329)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669329))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun c!143137 () Bool)

(declare-fun d!161227 () Bool)

(assert (=> d!161227 (= c!143137 (and ((_ is Cons!36212) (toList!11191 lt!669329)) (= (_1!12382 (h!37657 (toList!11191 lt!669329))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161227 (= (getValueByKey!732 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)) e!864604)))

(declare-fun b!1553024 () Bool)

(assert (=> b!1553024 (= e!864604 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669329)))))))

(declare-fun b!1553026 () Bool)

(assert (=> b!1553026 (= e!864605 (getValueByKey!732 (t!50934 (toList!11191 lt!669329)) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161227 c!143137) b!1553024))

(assert (= (and d!161227 (not c!143137)) b!1553025))

(assert (= (and b!1553025 c!143138) b!1553026))

(assert (= (and b!1553025 (not c!143138)) b!1553027))

(assert (=> b!1553026 m!1431023))

(declare-fun m!1431583 () Bool)

(assert (=> b!1553026 m!1431583))

(assert (=> d!161065 d!161227))

(declare-fun d!161229 () Bool)

(declare-fun lt!669553 () Bool)

(assert (=> d!161229 (= lt!669553 (select (content!794 (toList!11191 lt!669447)) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!864607 () Bool)

(assert (=> d!161229 (= lt!669553 e!864607)))

(declare-fun res!1063078 () Bool)

(assert (=> d!161229 (=> (not res!1063078) (not e!864607))))

(assert (=> d!161229 (= res!1063078 ((_ is Cons!36212) (toList!11191 lt!669447)))))

(assert (=> d!161229 (= (contains!10134 (toList!11191 lt!669447) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669553)))

(declare-fun b!1553028 () Bool)

(declare-fun e!864606 () Bool)

(assert (=> b!1553028 (= e!864607 e!864606)))

(declare-fun res!1063077 () Bool)

(assert (=> b!1553028 (=> res!1063077 e!864606)))

(assert (=> b!1553028 (= res!1063077 (= (h!37657 (toList!11191 lt!669447)) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1553029 () Bool)

(assert (=> b!1553029 (= e!864606 (contains!10134 (t!50934 (toList!11191 lt!669447)) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161229 res!1063078) b!1553028))

(assert (= (and b!1553028 (not res!1063077)) b!1553029))

(declare-fun m!1431585 () Bool)

(assert (=> d!161229 m!1431585))

(declare-fun m!1431587 () Bool)

(assert (=> d!161229 m!1431587))

(declare-fun m!1431589 () Bool)

(assert (=> b!1553029 m!1431589))

(assert (=> b!1552755 d!161229))

(declare-fun d!161231 () Bool)

(declare-fun res!1063079 () Bool)

(declare-fun e!864608 () Bool)

(assert (=> d!161231 (=> res!1063079 e!864608)))

(assert (=> d!161231 (= res!1063079 (and ((_ is Cons!36212) (toList!11191 lt!669332)) (= (_1!12382 (h!37657 (toList!11191 lt!669332))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161231 (= (containsKey!754 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)) e!864608)))

(declare-fun b!1553030 () Bool)

(declare-fun e!864609 () Bool)

(assert (=> b!1553030 (= e!864608 e!864609)))

(declare-fun res!1063080 () Bool)

(assert (=> b!1553030 (=> (not res!1063080) (not e!864609))))

(assert (=> b!1553030 (= res!1063080 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669332))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669332))) (select (arr!50010 _keys!618) from!762))) ((_ is Cons!36212) (toList!11191 lt!669332)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669332))) (select (arr!50010 _keys!618) from!762))))))

(declare-fun b!1553031 () Bool)

(assert (=> b!1553031 (= e!864609 (containsKey!754 (t!50934 (toList!11191 lt!669332)) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161231 (not res!1063079)) b!1553030))

(assert (= (and b!1553030 res!1063080) b!1553031))

(assert (=> b!1553031 m!1431023))

(declare-fun m!1431591 () Bool)

(assert (=> b!1553031 m!1431591))

(assert (=> d!161051 d!161231))

(declare-fun d!161233 () Bool)

(assert (=> d!161233 (= (apply!1111 lt!669428 (select (arr!50010 _keys!618) from!762)) (get!26039 (getValueByKey!732 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762))))))

(declare-fun bs!44618 () Bool)

(assert (= bs!44618 d!161233))

(assert (=> bs!44618 m!1431023))

(assert (=> bs!44618 m!1431495))

(assert (=> bs!44618 m!1431495))

(declare-fun m!1431593 () Bool)

(assert (=> bs!44618 m!1431593))

(assert (=> b!1552733 d!161233))

(assert (=> b!1552733 d!161091))

(declare-fun b!1553035 () Bool)

(declare-fun e!864611 () Option!808)

(assert (=> b!1553035 (= e!864611 None!806)))

(declare-fun b!1553033 () Bool)

(declare-fun e!864610 () Option!808)

(assert (=> b!1553033 (= e!864610 e!864611)))

(declare-fun c!143140 () Bool)

(assert (=> b!1553033 (= c!143140 (and ((_ is Cons!36212) (toList!11191 lt!669406)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669406))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun d!161235 () Bool)

(declare-fun c!143139 () Bool)

(assert (=> d!161235 (= c!143139 (and ((_ is Cons!36212) (toList!11191 lt!669406)) (= (_1!12382 (h!37657 (toList!11191 lt!669406))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161235 (= (getValueByKey!732 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864610)))

(declare-fun b!1553032 () Bool)

(assert (=> b!1553032 (= e!864610 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669406)))))))

(declare-fun b!1553034 () Bool)

(assert (=> b!1553034 (= e!864611 (getValueByKey!732 (t!50934 (toList!11191 lt!669406)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161235 c!143139) b!1553032))

(assert (= (and d!161235 (not c!143139)) b!1553033))

(assert (= (and b!1553033 c!143140) b!1553034))

(assert (= (and b!1553033 (not c!143140)) b!1553035))

(declare-fun m!1431595 () Bool)

(assert (=> b!1553034 m!1431595))

(assert (=> b!1552705 d!161235))

(declare-fun d!161237 () Bool)

(declare-fun e!864613 () Bool)

(assert (=> d!161237 e!864613))

(declare-fun res!1063081 () Bool)

(assert (=> d!161237 (=> res!1063081 e!864613)))

(declare-fun lt!669555 () Bool)

(assert (=> d!161237 (= res!1063081 (not lt!669555))))

(declare-fun lt!669556 () Bool)

(assert (=> d!161237 (= lt!669555 lt!669556)))

(declare-fun lt!669554 () Unit!51710)

(declare-fun e!864612 () Unit!51710)

(assert (=> d!161237 (= lt!669554 e!864612)))

(declare-fun c!143141 () Bool)

(assert (=> d!161237 (= c!143141 lt!669556)))

(assert (=> d!161237 (= lt!669556 (containsKey!754 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161237 (= (contains!10131 lt!669428 #b1000000000000000000000000000000000000000000000000000000000000000) lt!669555)))

(declare-fun b!1553036 () Bool)

(declare-fun lt!669557 () Unit!51710)

(assert (=> b!1553036 (= e!864612 lt!669557)))

(assert (=> b!1553036 (= lt!669557 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1553036 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1553037 () Bool)

(declare-fun Unit!51726 () Unit!51710)

(assert (=> b!1553037 (= e!864612 Unit!51726)))

(declare-fun b!1553038 () Bool)

(assert (=> b!1553038 (= e!864613 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161237 c!143141) b!1553036))

(assert (= (and d!161237 (not c!143141)) b!1553037))

(assert (= (and d!161237 (not res!1063081)) b!1553038))

(declare-fun m!1431597 () Bool)

(assert (=> d!161237 m!1431597))

(declare-fun m!1431599 () Bool)

(assert (=> b!1553036 m!1431599))

(declare-fun m!1431601 () Bool)

(assert (=> b!1553036 m!1431601))

(assert (=> b!1553036 m!1431601))

(declare-fun m!1431603 () Bool)

(assert (=> b!1553036 m!1431603))

(assert (=> b!1553038 m!1431601))

(assert (=> b!1553038 m!1431601))

(assert (=> b!1553038 m!1431603))

(assert (=> b!1552735 d!161237))

(declare-fun d!161239 () Bool)

(assert (=> d!161239 (= (get!26039 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21990 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161077 d!161239))

(assert (=> d!161077 d!161145))

(declare-fun mapNonEmpty!59039 () Bool)

(declare-fun mapRes!59039 () Bool)

(declare-fun tp!112079 () Bool)

(declare-fun e!864614 () Bool)

(assert (=> mapNonEmpty!59039 (= mapRes!59039 (and tp!112079 e!864614))))

(declare-fun mapValue!59039 () ValueCell!18195)

(declare-fun mapRest!59039 () (Array (_ BitVec 32) ValueCell!18195))

(declare-fun mapKey!59039 () (_ BitVec 32))

(assert (=> mapNonEmpty!59039 (= mapRest!59038 (store mapRest!59039 mapKey!59039 mapValue!59039))))

(declare-fun mapIsEmpty!59039 () Bool)

(assert (=> mapIsEmpty!59039 mapRes!59039))

(declare-fun condMapEmpty!59039 () Bool)

(declare-fun mapDefault!59039 () ValueCell!18195)

(assert (=> mapNonEmpty!59038 (= condMapEmpty!59039 (= mapRest!59038 ((as const (Array (_ BitVec 32) ValueCell!18195)) mapDefault!59039)))))

(declare-fun e!864615 () Bool)

(assert (=> mapNonEmpty!59038 (= tp!112078 (and e!864615 mapRes!59039))))

(declare-fun b!1553040 () Bool)

(assert (=> b!1553040 (= e!864615 tp_is_empty!38211)))

(declare-fun b!1553039 () Bool)

(assert (=> b!1553039 (= e!864614 tp_is_empty!38211)))

(assert (= (and mapNonEmpty!59038 condMapEmpty!59039) mapIsEmpty!59039))

(assert (= (and mapNonEmpty!59038 (not condMapEmpty!59039)) mapNonEmpty!59039))

(assert (= (and mapNonEmpty!59039 ((_ is ValueCellFull!18195) mapValue!59039)) b!1553039))

(assert (= (and mapNonEmpty!59038 ((_ is ValueCellFull!18195) mapDefault!59039)) b!1553040))

(declare-fun m!1431605 () Bool)

(assert (=> mapNonEmpty!59039 m!1431605))

(declare-fun b_lambda!24807 () Bool)

(assert (= b_lambda!24805 (or (and start!132308 b_free!31935) b_lambda!24807)))

(declare-fun b_lambda!24809 () Bool)

(assert (= b_lambda!24803 (or (and start!132308 b_free!31935) b_lambda!24809)))

(check-sat (not d!161221) (not b!1552939) (not b!1552782) (not b!1552819) (not d!161187) (not b!1552962) (not d!161157) (not b!1552973) (not b!1552956) (not b!1552978) (not b!1552992) (not b!1552788) (not b!1552951) (not b_lambda!24793) (not d!161191) (not d!161189) (not d!161099) (not d!161209) (not b!1552955) (not b!1552941) (not bm!71347) (not b_lambda!24807) (not b!1553000) (not b_lambda!24799) (not d!161123) (not d!161179) (not b!1552824) (not b!1552909) (not d!161129) (not d!161111) (not b!1552991) (not b!1553031) (not b!1553013) (not d!161163) (not b!1553029) (not b!1552863) (not b!1552831) (not b!1553038) (not b!1552968) (not b!1552784) (not b!1552808) (not b!1552948) (not b!1552897) (not b!1552964) (not b!1552976) (not b!1552924) (not d!161147) (not bm!71336) (not d!161237) (not b_lambda!24809) (not b!1553011) (not d!161185) (not b!1552815) (not b!1552903) (not b!1552930) (not b!1552837) (not b!1552884) (not b!1553026) (not b!1552982) (not b!1552984) (not b!1552805) (not b!1552786) (not d!161153) (not b!1553034) (not b!1552883) (not b!1552887) (not bm!71343) (not d!161229) (not b!1552953) (not b!1552828) (not bm!71339) (not b!1552935) (not d!161143) (not b!1552949) (not b!1552800) (not d!161203) (not b!1552804) (not b!1553019) b_and!51389 (not b!1552877) (not b!1552971) (not d!161159) (not d!161183) (not d!161165) (not b!1552933) (not b_next!31935) (not b!1552979) (not b!1552987) tp_is_empty!38211 (not d!161171) (not b!1552994) (not b!1552997) (not d!161119) (not b!1552866) (not b!1552810) (not b!1553036) (not b!1552861) (not d!161101) (not b!1552826) (not d!161201) (not b!1552809) (not b!1552874) (not d!161105) (not b!1552999) (not b!1552814) (not d!161127) (not d!161141) (not d!161215) (not b!1553008) (not d!161181) (not b!1552873) (not b!1552838) (not b!1552901) (not b!1552816) (not b!1552894) (not d!161169) (not b!1552936) (not bm!71344) (not b!1552821) (not d!161213) (not bm!71340) (not mapNonEmpty!59039) (not bm!71329) (not b!1552963) (not d!161219) (not d!161197) (not b!1552966) (not b!1553003) (not d!161109) (not b_lambda!24801) (not b!1553005) (not b!1552807) (not b!1553022) (not b!1552944) (not d!161233) (not d!161173) (not d!161103) (not b!1552928) (not b!1552970) (not d!161205) (not b!1552871) (not b!1552957) (not d!161117) (not d!161097) (not d!161217))
(check-sat b_and!51389 (not b_next!31935))
(get-model)

(declare-fun b!1553044 () Bool)

(declare-fun e!864617 () Option!808)

(assert (=> b!1553044 (= e!864617 None!806)))

(declare-fun b!1553042 () Bool)

(declare-fun e!864616 () Option!808)

(assert (=> b!1553042 (= e!864616 e!864617)))

(declare-fun c!143143 () Bool)

(assert (=> b!1553042 (= c!143143 (and ((_ is Cons!36212) (toList!11191 lt!669527)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669527))) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun d!161241 () Bool)

(declare-fun c!143142 () Bool)

(assert (=> d!161241 (= c!143142 (and ((_ is Cons!36212) (toList!11191 lt!669527)) (= (_1!12382 (h!37657 (toList!11191 lt!669527))) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!161241 (= (getValueByKey!732 (toList!11191 lt!669527) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!864616)))

(declare-fun b!1553041 () Bool)

(assert (=> b!1553041 (= e!864616 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669527)))))))

(declare-fun b!1553043 () Bool)

(assert (=> b!1553043 (= e!864617 (getValueByKey!732 (t!50934 (toList!11191 lt!669527)) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!161241 c!143142) b!1553041))

(assert (= (and d!161241 (not c!143142)) b!1553042))

(assert (= (and b!1553042 c!143143) b!1553043))

(assert (= (and b!1553042 (not c!143143)) b!1553044))

(declare-fun m!1431607 () Bool)

(assert (=> b!1553043 m!1431607))

(assert (=> b!1552962 d!161241))

(declare-fun d!161243 () Bool)

(assert (=> d!161243 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669558 () Unit!51710)

(assert (=> d!161243 (= lt!669558 (choose!2037 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864618 () Bool)

(assert (=> d!161243 e!864618))

(declare-fun res!1063082 () Bool)

(assert (=> d!161243 (=> (not res!1063082) (not e!864618))))

(assert (=> d!161243 (= res!1063082 (isStrictlySorted!887 (toList!11191 lt!669447)))))

(assert (=> d!161243 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669558)))

(declare-fun b!1553045 () Bool)

(assert (=> b!1553045 (= e!864618 (containsKey!754 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161243 res!1063082) b!1553045))

(assert (=> d!161243 m!1431255))

(assert (=> d!161243 m!1431255))

(assert (=> d!161243 m!1431339))

(declare-fun m!1431609 () Bool)

(assert (=> d!161243 m!1431609))

(declare-fun m!1431611 () Bool)

(assert (=> d!161243 m!1431611))

(assert (=> b!1553045 m!1431335))

(assert (=> b!1552826 d!161243))

(declare-fun d!161245 () Bool)

(assert (=> d!161245 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun bs!44619 () Bool)

(assert (= bs!44619 d!161245))

(assert (=> bs!44619 m!1431255))

(declare-fun m!1431613 () Bool)

(assert (=> bs!44619 m!1431613))

(assert (=> b!1552826 d!161245))

(assert (=> b!1552826 d!161149))

(declare-fun d!161247 () Bool)

(assert (=> d!161247 (= ($colon$colon!944 e!864579 (ite c!143126 (h!37657 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))) (Cons!36212 (ite c!143126 (h!37657 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) e!864579))))

(assert (=> bm!71344 d!161247))

(declare-fun d!161249 () Bool)

(assert (=> d!161249 (= (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762))) (not ((_ is Some!807) (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)))))))

(assert (=> d!161105 d!161249))

(declare-fun d!161251 () Bool)

(assert (=> d!161251 (= (apply!1111 lt!669475 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) (get!26039 (getValueByKey!732 (toList!11191 lt!669475) (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)))))))

(declare-fun bs!44620 () Bool)

(assert (= bs!44620 d!161251))

(assert (=> bs!44620 m!1431303))

(declare-fun m!1431615 () Bool)

(assert (=> bs!44620 m!1431615))

(assert (=> bs!44620 m!1431615))

(declare-fun m!1431617 () Bool)

(assert (=> bs!44620 m!1431617))

(assert (=> b!1552807 d!161251))

(declare-fun d!161253 () Bool)

(declare-fun c!143144 () Bool)

(assert (=> d!161253 (= c!143144 ((_ is ValueCellFull!18195) (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001))))))

(declare-fun e!864619 () V!59391)

(assert (=> d!161253 (= (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)) e!864619)))

(declare-fun b!1553046 () Bool)

(assert (=> b!1553046 (= e!864619 (get!26040 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553047 () Bool)

(assert (=> b!1553047 (= e!864619 (get!26041 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161253 c!143144) b!1553046))

(assert (= (and d!161253 (not c!143144)) b!1553047))

(assert (=> b!1553046 m!1431317))

(assert (=> b!1553046 m!1431031))

(declare-fun m!1431619 () Bool)

(assert (=> b!1553046 m!1431619))

(assert (=> b!1553047 m!1431317))

(assert (=> b!1553047 m!1431031))

(declare-fun m!1431621 () Bool)

(assert (=> b!1553047 m!1431621))

(assert (=> b!1552807 d!161253))

(declare-fun d!161255 () Bool)

(assert (=> d!161255 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44621 () Bool)

(assert (= bs!44621 d!161255))

(assert (=> bs!44621 m!1431571))

(declare-fun m!1431623 () Bool)

(assert (=> bs!44621 m!1431623))

(assert (=> b!1553013 d!161255))

(declare-fun b!1553051 () Bool)

(declare-fun e!864621 () Option!808)

(assert (=> b!1553051 (= e!864621 None!806)))

(declare-fun b!1553049 () Bool)

(declare-fun e!864620 () Option!808)

(assert (=> b!1553049 (= e!864620 e!864621)))

(declare-fun c!143146 () Bool)

(assert (=> b!1553049 (= c!143146 (and ((_ is Cons!36212) (toList!11191 lt!669428)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669428))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!161257 () Bool)

(declare-fun c!143145 () Bool)

(assert (=> d!161257 (= c!143145 (and ((_ is Cons!36212) (toList!11191 lt!669428)) (= (_1!12382 (h!37657 (toList!11191 lt!669428))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161257 (= (getValueByKey!732 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000) e!864620)))

(declare-fun b!1553048 () Bool)

(assert (=> b!1553048 (= e!864620 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669428)))))))

(declare-fun b!1553050 () Bool)

(assert (=> b!1553050 (= e!864621 (getValueByKey!732 (t!50934 (toList!11191 lt!669428)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161257 c!143145) b!1553048))

(assert (= (and d!161257 (not c!143145)) b!1553049))

(assert (= (and b!1553049 c!143146) b!1553050))

(assert (= (and b!1553049 (not c!143146)) b!1553051))

(declare-fun m!1431625 () Bool)

(assert (=> b!1553050 m!1431625))

(assert (=> b!1553013 d!161257))

(declare-fun d!161259 () Bool)

(assert (=> d!161259 (= ($colon$colon!944 e!864500 (ite c!143091 (h!37657 (toList!11191 call!71297)) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (Cons!36212 (ite c!143091 (h!37657 (toList!11191 call!71297)) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864500))))

(assert (=> bm!71336 d!161259))

(declare-fun d!161261 () Bool)

(assert (=> d!161261 (= (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1552873 d!161261))

(declare-fun b!1553052 () Bool)

(declare-fun e!864626 () List!36216)

(declare-fun call!71355 () List!36216)

(assert (=> b!1553052 (= e!864626 call!71355)))

(declare-fun b!1553053 () Bool)

(declare-fun e!864623 () List!36216)

(declare-fun call!71354 () List!36216)

(assert (=> b!1553053 (= e!864623 call!71354)))

(declare-fun c!143150 () Bool)

(declare-fun e!864624 () List!36216)

(declare-fun bm!71350 () Bool)

(assert (=> bm!71350 (= call!71355 ($colon$colon!944 e!864624 (ite c!143150 (h!37657 (t!50934 (toList!11191 lt!669329))) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun c!143148 () Bool)

(assert (=> bm!71350 (= c!143148 c!143150)))

(declare-fun b!1553054 () Bool)

(declare-fun e!864622 () Bool)

(declare-fun lt!669559 () List!36216)

(assert (=> b!1553054 (= e!864622 (contains!10134 lt!669559 (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun d!161263 () Bool)

(assert (=> d!161263 e!864622))

(declare-fun res!1063083 () Bool)

(assert (=> d!161263 (=> (not res!1063083) (not e!864622))))

(assert (=> d!161263 (= res!1063083 (isStrictlySorted!887 lt!669559))))

(assert (=> d!161263 (= lt!669559 e!864626)))

(assert (=> d!161263 (= c!143150 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669329))) (bvslt (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669329)))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161263 (isStrictlySorted!887 (t!50934 (toList!11191 lt!669329)))))

(assert (=> d!161263 (= (insertStrictlySorted!503 (t!50934 (toList!11191 lt!669329)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669559)))

(declare-fun b!1553055 () Bool)

(declare-fun e!864625 () List!36216)

(assert (=> b!1553055 (= e!864626 e!864625)))

(declare-fun c!143147 () Bool)

(assert (=> b!1553055 (= c!143147 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669329))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669329)))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553056 () Bool)

(assert (=> b!1553056 (= e!864624 (insertStrictlySorted!503 (t!50934 (t!50934 (toList!11191 lt!669329))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun b!1553057 () Bool)

(assert (=> b!1553057 (= e!864623 call!71354)))

(declare-fun b!1553058 () Bool)

(declare-fun c!143149 () Bool)

(assert (=> b!1553058 (= c!143149 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669329))) (bvsgt (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669329)))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> b!1553058 (= e!864625 e!864623)))

(declare-fun b!1553059 () Bool)

(declare-fun res!1063084 () Bool)

(assert (=> b!1553059 (=> (not res!1063084) (not e!864622))))

(assert (=> b!1553059 (= res!1063084 (containsKey!754 lt!669559 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun bm!71351 () Bool)

(declare-fun call!71353 () List!36216)

(assert (=> bm!71351 (= call!71353 call!71355)))

(declare-fun bm!71352 () Bool)

(assert (=> bm!71352 (= call!71354 call!71353)))

(declare-fun b!1553060 () Bool)

(assert (=> b!1553060 (= e!864624 (ite c!143147 (t!50934 (t!50934 (toList!11191 lt!669329))) (ite c!143149 (Cons!36212 (h!37657 (t!50934 (toList!11191 lt!669329))) (t!50934 (t!50934 (toList!11191 lt!669329)))) Nil!36213)))))

(declare-fun b!1553061 () Bool)

(assert (=> b!1553061 (= e!864625 call!71353)))

(assert (= (and d!161263 c!143150) b!1553052))

(assert (= (and d!161263 (not c!143150)) b!1553055))

(assert (= (and b!1553055 c!143147) b!1553061))

(assert (= (and b!1553055 (not c!143147)) b!1553058))

(assert (= (and b!1553058 c!143149) b!1553057))

(assert (= (and b!1553058 (not c!143149)) b!1553053))

(assert (= (or b!1553057 b!1553053) bm!71352))

(assert (= (or b!1553061 bm!71352) bm!71351))

(assert (= (or b!1553052 bm!71351) bm!71350))

(assert (= (and bm!71350 c!143148) b!1553056))

(assert (= (and bm!71350 (not c!143148)) b!1553060))

(assert (= (and d!161263 res!1063083) b!1553059))

(assert (= (and b!1553059 res!1063084) b!1553054))

(declare-fun m!1431627 () Bool)

(assert (=> b!1553059 m!1431627))

(declare-fun m!1431629 () Bool)

(assert (=> b!1553056 m!1431629))

(declare-fun m!1431631 () Bool)

(assert (=> bm!71350 m!1431631))

(declare-fun m!1431633 () Bool)

(assert (=> d!161263 m!1431633))

(declare-fun m!1431635 () Bool)

(assert (=> d!161263 m!1431635))

(declare-fun m!1431637 () Bool)

(assert (=> b!1553054 m!1431637))

(assert (=> b!1553005 d!161263))

(declare-fun d!161265 () Bool)

(declare-fun c!143153 () Bool)

(assert (=> d!161265 (= c!143153 ((_ is Nil!36213) (toList!11191 lt!669406)))))

(declare-fun e!864629 () (InoxSet tuple2!24742))

(assert (=> d!161265 (= (content!794 (toList!11191 lt!669406)) e!864629)))

(declare-fun b!1553066 () Bool)

(assert (=> b!1553066 (= e!864629 ((as const (Array tuple2!24742 Bool)) false))))

(declare-fun b!1553067 () Bool)

(assert (=> b!1553067 (= e!864629 ((_ map or) (store ((as const (Array tuple2!24742 Bool)) false) (h!37657 (toList!11191 lt!669406)) true) (content!794 (t!50934 (toList!11191 lt!669406)))))))

(assert (= (and d!161265 c!143153) b!1553066))

(assert (= (and d!161265 (not c!143153)) b!1553067))

(declare-fun m!1431639 () Bool)

(assert (=> b!1553067 m!1431639))

(declare-fun m!1431641 () Bool)

(assert (=> b!1553067 m!1431641))

(assert (=> d!161173 d!161265))

(declare-fun d!161267 () Bool)

(assert (=> d!161267 (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669560 () Unit!51710)

(assert (=> d!161267 (= lt!669560 (choose!2037 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)))))

(declare-fun e!864630 () Bool)

(assert (=> d!161267 e!864630))

(declare-fun res!1063085 () Bool)

(assert (=> d!161267 (=> (not res!1063085) (not e!864630))))

(assert (=> d!161267 (= res!1063085 (isStrictlySorted!887 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161267 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)) lt!669560)))

(declare-fun b!1553068 () Bool)

(assert (=> b!1553068 (= e!864630 (containsKey!754 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161267 res!1063085) b!1553068))

(assert (=> d!161267 m!1431023))

(assert (=> d!161267 m!1431279))

(assert (=> d!161267 m!1431279))

(assert (=> d!161267 m!1431281))

(assert (=> d!161267 m!1431023))

(declare-fun m!1431643 () Bool)

(assert (=> d!161267 m!1431643))

(declare-fun m!1431645 () Bool)

(assert (=> d!161267 m!1431645))

(assert (=> b!1553068 m!1431023))

(assert (=> b!1553068 m!1431275))

(assert (=> b!1552782 d!161267))

(declare-fun d!161269 () Bool)

(assert (=> d!161269 (= (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762))) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun bs!44622 () Bool)

(assert (= bs!44622 d!161269))

(assert (=> bs!44622 m!1431279))

(declare-fun m!1431647 () Bool)

(assert (=> bs!44622 m!1431647))

(assert (=> b!1552782 d!161269))

(declare-fun b!1553072 () Bool)

(declare-fun e!864632 () Option!808)

(assert (=> b!1553072 (= e!864632 None!806)))

(declare-fun b!1553070 () Bool)

(declare-fun e!864631 () Option!808)

(assert (=> b!1553070 (= e!864631 e!864632)))

(declare-fun c!143155 () Bool)

(assert (=> b!1553070 (= c!143155 (and ((_ is Cons!36212) (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (not (= (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun c!143154 () Bool)

(declare-fun d!161271 () Bool)

(assert (=> d!161271 (= c!143154 (and ((_ is Cons!36212) (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (= (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161271 (= (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)) e!864631)))

(declare-fun b!1553069 () Bool)

(assert (=> b!1553069 (= e!864631 (Some!807 (_2!12382 (h!37657 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))))

(declare-fun b!1553071 () Bool)

(assert (=> b!1553071 (= e!864632 (getValueByKey!732 (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161271 c!143154) b!1553069))

(assert (= (and d!161271 (not c!143154)) b!1553070))

(assert (= (and b!1553070 c!143155) b!1553071))

(assert (= (and b!1553070 (not c!143155)) b!1553072))

(assert (=> b!1553071 m!1431023))

(declare-fun m!1431649 () Bool)

(assert (=> b!1553071 m!1431649))

(assert (=> b!1552782 d!161271))

(declare-fun d!161273 () Bool)

(declare-fun res!1063086 () Bool)

(declare-fun e!864633 () Bool)

(assert (=> d!161273 (=> res!1063086 e!864633)))

(assert (=> d!161273 (= res!1063086 (and ((_ is Cons!36212) (toList!11191 lt!669447)) (= (_1!12382 (h!37657 (toList!11191 lt!669447))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161273 (= (containsKey!754 (toList!11191 lt!669447) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864633)))

(declare-fun b!1553073 () Bool)

(declare-fun e!864634 () Bool)

(assert (=> b!1553073 (= e!864633 e!864634)))

(declare-fun res!1063087 () Bool)

(assert (=> b!1553073 (=> (not res!1063087) (not e!864634))))

(assert (=> b!1553073 (= res!1063087 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669447))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669447))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36212) (toList!11191 lt!669447)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669447))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553074 () Bool)

(assert (=> b!1553074 (= e!864634 (containsKey!754 (t!50934 (toList!11191 lt!669447)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161273 (not res!1063086)) b!1553073))

(assert (= (and b!1553073 res!1063087) b!1553074))

(declare-fun m!1431651 () Bool)

(assert (=> b!1553074 m!1431651))

(assert (=> d!161123 d!161273))

(declare-fun b!1553075 () Bool)

(declare-fun e!864639 () List!36216)

(declare-fun call!71358 () List!36216)

(assert (=> b!1553075 (= e!864639 call!71358)))

(declare-fun b!1553076 () Bool)

(declare-fun e!864636 () List!36216)

(declare-fun call!71357 () List!36216)

(assert (=> b!1553076 (= e!864636 call!71357)))

(declare-fun bm!71353 () Bool)

(declare-fun c!143159 () Bool)

(declare-fun e!864637 () List!36216)

(assert (=> bm!71353 (= call!71358 ($colon$colon!944 e!864637 (ite c!143159 (h!37657 (t!50934 (toList!11191 lt!669329))) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143157 () Bool)

(assert (=> bm!71353 (= c!143157 c!143159)))

(declare-fun b!1553077 () Bool)

(declare-fun e!864635 () Bool)

(declare-fun lt!669561 () List!36216)

(assert (=> b!1553077 (= e!864635 (contains!10134 lt!669561 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun d!161275 () Bool)

(assert (=> d!161275 e!864635))

(declare-fun res!1063088 () Bool)

(assert (=> d!161275 (=> (not res!1063088) (not e!864635))))

(assert (=> d!161275 (= res!1063088 (isStrictlySorted!887 lt!669561))))

(assert (=> d!161275 (= lt!669561 e!864639)))

(assert (=> d!161275 (= c!143159 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669329))) (bvslt (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669329)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161275 (isStrictlySorted!887 (t!50934 (toList!11191 lt!669329)))))

(assert (=> d!161275 (= (insertStrictlySorted!503 (t!50934 (toList!11191 lt!669329)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669561)))

(declare-fun b!1553078 () Bool)

(declare-fun e!864638 () List!36216)

(assert (=> b!1553078 (= e!864639 e!864638)))

(declare-fun c!143156 () Bool)

(assert (=> b!1553078 (= c!143156 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669329))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669329)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553079 () Bool)

(assert (=> b!1553079 (= e!864637 (insertStrictlySorted!503 (t!50934 (t!50934 (toList!11191 lt!669329))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1553080 () Bool)

(assert (=> b!1553080 (= e!864636 call!71357)))

(declare-fun b!1553081 () Bool)

(declare-fun c!143158 () Bool)

(assert (=> b!1553081 (= c!143158 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669329))) (bvsgt (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669329)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1553081 (= e!864638 e!864636)))

(declare-fun b!1553082 () Bool)

(declare-fun res!1063089 () Bool)

(assert (=> b!1553082 (=> (not res!1063089) (not e!864635))))

(assert (=> b!1553082 (= res!1063089 (containsKey!754 lt!669561 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71354 () Bool)

(declare-fun call!71356 () List!36216)

(assert (=> bm!71354 (= call!71356 call!71358)))

(declare-fun bm!71355 () Bool)

(assert (=> bm!71355 (= call!71357 call!71356)))

(declare-fun b!1553083 () Bool)

(assert (=> b!1553083 (= e!864637 (ite c!143156 (t!50934 (t!50934 (toList!11191 lt!669329))) (ite c!143158 (Cons!36212 (h!37657 (t!50934 (toList!11191 lt!669329))) (t!50934 (t!50934 (toList!11191 lt!669329)))) Nil!36213)))))

(declare-fun b!1553084 () Bool)

(assert (=> b!1553084 (= e!864638 call!71356)))

(assert (= (and d!161275 c!143159) b!1553075))

(assert (= (and d!161275 (not c!143159)) b!1553078))

(assert (= (and b!1553078 c!143156) b!1553084))

(assert (= (and b!1553078 (not c!143156)) b!1553081))

(assert (= (and b!1553081 c!143158) b!1553080))

(assert (= (and b!1553081 (not c!143158)) b!1553076))

(assert (= (or b!1553080 b!1553076) bm!71355))

(assert (= (or b!1553084 bm!71355) bm!71354))

(assert (= (or b!1553075 bm!71354) bm!71353))

(assert (= (and bm!71353 c!143157) b!1553079))

(assert (= (and bm!71353 (not c!143157)) b!1553083))

(assert (= (and d!161275 res!1063088) b!1553082))

(assert (= (and b!1553082 res!1063089) b!1553077))

(declare-fun m!1431653 () Bool)

(assert (=> b!1553082 m!1431653))

(declare-fun m!1431655 () Bool)

(assert (=> b!1553079 m!1431655))

(declare-fun m!1431657 () Bool)

(assert (=> bm!71353 m!1431657))

(declare-fun m!1431659 () Bool)

(assert (=> d!161275 m!1431659))

(assert (=> d!161275 m!1431635))

(declare-fun m!1431661 () Bool)

(assert (=> b!1553077 m!1431661))

(assert (=> b!1552941 d!161275))

(declare-fun d!161277 () Bool)

(declare-fun res!1063094 () Bool)

(declare-fun e!864644 () Bool)

(assert (=> d!161277 (=> res!1063094 e!864644)))

(assert (=> d!161277 (= res!1063094 (or ((_ is Nil!36213) lt!669509) ((_ is Nil!36213) (t!50934 lt!669509))))))

(assert (=> d!161277 (= (isStrictlySorted!887 lt!669509) e!864644)))

(declare-fun b!1553089 () Bool)

(declare-fun e!864645 () Bool)

(assert (=> b!1553089 (= e!864644 e!864645)))

(declare-fun res!1063095 () Bool)

(assert (=> b!1553089 (=> (not res!1063095) (not e!864645))))

(assert (=> b!1553089 (= res!1063095 (bvslt (_1!12382 (h!37657 lt!669509)) (_1!12382 (h!37657 (t!50934 lt!669509)))))))

(declare-fun b!1553090 () Bool)

(assert (=> b!1553090 (= e!864645 (isStrictlySorted!887 (t!50934 lt!669509)))))

(assert (= (and d!161277 (not res!1063094)) b!1553089))

(assert (= (and b!1553089 res!1063095) b!1553090))

(declare-fun m!1431663 () Bool)

(assert (=> b!1553090 m!1431663))

(assert (=> d!161171 d!161277))

(declare-fun d!161279 () Bool)

(declare-fun res!1063096 () Bool)

(declare-fun e!864646 () Bool)

(assert (=> d!161279 (=> res!1063096 e!864646)))

(assert (=> d!161279 (= res!1063096 (or ((_ is Nil!36213) (toList!11191 lt!669329)) ((_ is Nil!36213) (t!50934 (toList!11191 lt!669329)))))))

(assert (=> d!161279 (= (isStrictlySorted!887 (toList!11191 lt!669329)) e!864646)))

(declare-fun b!1553091 () Bool)

(declare-fun e!864647 () Bool)

(assert (=> b!1553091 (= e!864646 e!864647)))

(declare-fun res!1063097 () Bool)

(assert (=> b!1553091 (=> (not res!1063097) (not e!864647))))

(assert (=> b!1553091 (= res!1063097 (bvslt (_1!12382 (h!37657 (toList!11191 lt!669329))) (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669329))))))))

(declare-fun b!1553092 () Bool)

(assert (=> b!1553092 (= e!864647 (isStrictlySorted!887 (t!50934 (toList!11191 lt!669329))))))

(assert (= (and d!161279 (not res!1063096)) b!1553091))

(assert (= (and b!1553091 res!1063097) b!1553092))

(assert (=> b!1553092 m!1431635))

(assert (=> d!161171 d!161279))

(assert (=> d!161201 d!161199))

(declare-fun d!161281 () Bool)

(assert (=> d!161281 (= (getValueByKey!732 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!807 (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161281 true))

(declare-fun _$22!586 () Unit!51710)

(assert (=> d!161281 (= (choose!2038 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) _$22!586)))

(declare-fun bs!44623 () Bool)

(assert (= bs!44623 d!161281))

(assert (=> bs!44623 m!1431221))

(assert (=> d!161201 d!161281))

(declare-fun d!161283 () Bool)

(declare-fun res!1063098 () Bool)

(declare-fun e!864648 () Bool)

(assert (=> d!161283 (=> res!1063098 e!864648)))

(assert (=> d!161283 (= res!1063098 (or ((_ is Nil!36213) lt!669434) ((_ is Nil!36213) (t!50934 lt!669434))))))

(assert (=> d!161283 (= (isStrictlySorted!887 lt!669434) e!864648)))

(declare-fun b!1553093 () Bool)

(declare-fun e!864649 () Bool)

(assert (=> b!1553093 (= e!864648 e!864649)))

(declare-fun res!1063099 () Bool)

(assert (=> b!1553093 (=> (not res!1063099) (not e!864649))))

(assert (=> b!1553093 (= res!1063099 (bvslt (_1!12382 (h!37657 lt!669434)) (_1!12382 (h!37657 (t!50934 lt!669434)))))))

(declare-fun b!1553094 () Bool)

(assert (=> b!1553094 (= e!864649 (isStrictlySorted!887 (t!50934 lt!669434)))))

(assert (= (and d!161283 (not res!1063098)) b!1553093))

(assert (= (and b!1553093 res!1063099) b!1553094))

(declare-fun m!1431665 () Bool)

(assert (=> b!1553094 m!1431665))

(assert (=> d!161201 d!161283))

(declare-fun b!1553098 () Bool)

(declare-fun e!864651 () Option!808)

(assert (=> b!1553098 (= e!864651 None!806)))

(declare-fun b!1553096 () Bool)

(declare-fun e!864650 () Option!808)

(assert (=> b!1553096 (= e!864650 e!864651)))

(declare-fun c!143161 () Bool)

(assert (=> b!1553096 (= c!143161 (and ((_ is Cons!36212) (t!50934 lt!669398)) (not (= (_1!12382 (h!37657 (t!50934 lt!669398))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161285 () Bool)

(declare-fun c!143160 () Bool)

(assert (=> d!161285 (= c!143160 (and ((_ is Cons!36212) (t!50934 lt!669398)) (= (_1!12382 (h!37657 (t!50934 lt!669398))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161285 (= (getValueByKey!732 (t!50934 lt!669398) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864650)))

(declare-fun b!1553095 () Bool)

(assert (=> b!1553095 (= e!864650 (Some!807 (_2!12382 (h!37657 (t!50934 lt!669398)))))))

(declare-fun b!1553097 () Bool)

(assert (=> b!1553097 (= e!864651 (getValueByKey!732 (t!50934 (t!50934 lt!669398)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161285 c!143160) b!1553095))

(assert (= (and d!161285 (not c!143160)) b!1553096))

(assert (= (and b!1553096 c!143161) b!1553097))

(assert (= (and b!1553096 (not c!143161)) b!1553098))

(declare-fun m!1431667 () Bool)

(assert (=> b!1553097 m!1431667))

(assert (=> b!1552933 d!161285))

(declare-fun b!1553102 () Bool)

(declare-fun e!864653 () Option!808)

(assert (=> b!1553102 (= e!864653 None!806)))

(declare-fun b!1553100 () Bool)

(declare-fun e!864652 () Option!808)

(assert (=> b!1553100 (= e!864652 e!864653)))

(declare-fun c!143163 () Bool)

(assert (=> b!1553100 (= c!143163 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669435))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669435)))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun d!161287 () Bool)

(declare-fun c!143162 () Bool)

(assert (=> d!161287 (= c!143162 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669435))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669435)))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161287 (= (getValueByKey!732 (t!50934 (toList!11191 lt!669435)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864652)))

(declare-fun b!1553099 () Bool)

(assert (=> b!1553099 (= e!864652 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 lt!669435))))))))

(declare-fun b!1553101 () Bool)

(assert (=> b!1553101 (= e!864653 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 lt!669435))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161287 c!143162) b!1553099))

(assert (= (and d!161287 (not c!143162)) b!1553100))

(assert (= (and b!1553100 c!143163) b!1553101))

(assert (= (and b!1553100 (not c!143163)) b!1553102))

(declare-fun m!1431669 () Bool)

(assert (=> b!1553101 m!1431669))

(assert (=> b!1553022 d!161287))

(declare-fun d!161289 () Bool)

(declare-fun res!1063100 () Bool)

(declare-fun e!864654 () Bool)

(assert (=> d!161289 (=> res!1063100 e!864654)))

(assert (=> d!161289 (= res!1063100 (or ((_ is Nil!36213) lt!669545) ((_ is Nil!36213) (t!50934 lt!669545))))))

(assert (=> d!161289 (= (isStrictlySorted!887 lt!669545) e!864654)))

(declare-fun b!1553103 () Bool)

(declare-fun e!864655 () Bool)

(assert (=> b!1553103 (= e!864654 e!864655)))

(declare-fun res!1063101 () Bool)

(assert (=> b!1553103 (=> (not res!1063101) (not e!864655))))

(assert (=> b!1553103 (= res!1063101 (bvslt (_1!12382 (h!37657 lt!669545)) (_1!12382 (h!37657 (t!50934 lt!669545)))))))

(declare-fun b!1553104 () Bool)

(assert (=> b!1553104 (= e!864655 (isStrictlySorted!887 (t!50934 lt!669545)))))

(assert (= (and d!161289 (not res!1063100)) b!1553103))

(assert (= (and b!1553103 res!1063101) b!1553104))

(declare-fun m!1431671 () Bool)

(assert (=> b!1553104 m!1431671))

(assert (=> d!161215 d!161289))

(assert (=> d!161215 d!161279))

(declare-fun d!161291 () Bool)

(declare-fun e!864657 () Bool)

(assert (=> d!161291 e!864657))

(declare-fun res!1063102 () Bool)

(assert (=> d!161291 (=> res!1063102 e!864657)))

(declare-fun lt!669563 () Bool)

(assert (=> d!161291 (= res!1063102 (not lt!669563))))

(declare-fun lt!669564 () Bool)

(assert (=> d!161291 (= lt!669563 lt!669564)))

(declare-fun lt!669562 () Unit!51710)

(declare-fun e!864656 () Unit!51710)

(assert (=> d!161291 (= lt!669562 e!864656)))

(declare-fun c!143164 () Bool)

(assert (=> d!161291 (= c!143164 lt!669564)))

(assert (=> d!161291 (= lt!669564 (containsKey!754 (toList!11191 lt!669520) (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))

(assert (=> d!161291 (= (contains!10131 lt!669520 (_1!12382 (tuple2!24743 lt!669425 lt!669427))) lt!669563)))

(declare-fun b!1553105 () Bool)

(declare-fun lt!669565 () Unit!51710)

(assert (=> b!1553105 (= e!864656 lt!669565)))

(assert (=> b!1553105 (= lt!669565 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669520) (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))

(assert (=> b!1553105 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669520) (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))

(declare-fun b!1553106 () Bool)

(declare-fun Unit!51727 () Unit!51710)

(assert (=> b!1553106 (= e!864656 Unit!51727)))

(declare-fun b!1553107 () Bool)

(assert (=> b!1553107 (= e!864657 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669520) (_1!12382 (tuple2!24743 lt!669425 lt!669427)))))))

(assert (= (and d!161291 c!143164) b!1553105))

(assert (= (and d!161291 (not c!143164)) b!1553106))

(assert (= (and d!161291 (not res!1063102)) b!1553107))

(declare-fun m!1431673 () Bool)

(assert (=> d!161291 m!1431673))

(declare-fun m!1431675 () Bool)

(assert (=> b!1553105 m!1431675))

(assert (=> b!1553105 m!1431471))

(assert (=> b!1553105 m!1431471))

(declare-fun m!1431677 () Bool)

(assert (=> b!1553105 m!1431677))

(assert (=> b!1553107 m!1431471))

(assert (=> b!1553107 m!1431471))

(assert (=> b!1553107 m!1431677))

(assert (=> d!161181 d!161291))

(declare-fun b!1553111 () Bool)

(declare-fun e!864659 () Option!808)

(assert (=> b!1553111 (= e!864659 None!806)))

(declare-fun b!1553109 () Bool)

(declare-fun e!864658 () Option!808)

(assert (=> b!1553109 (= e!864658 e!864659)))

(declare-fun c!143166 () Bool)

(assert (=> b!1553109 (= c!143166 (and ((_ is Cons!36212) lt!669519) (not (= (_1!12382 (h!37657 lt!669519)) (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))))

(declare-fun c!143165 () Bool)

(declare-fun d!161293 () Bool)

(assert (=> d!161293 (= c!143165 (and ((_ is Cons!36212) lt!669519) (= (_1!12382 (h!37657 lt!669519)) (_1!12382 (tuple2!24743 lt!669425 lt!669427)))))))

(assert (=> d!161293 (= (getValueByKey!732 lt!669519 (_1!12382 (tuple2!24743 lt!669425 lt!669427))) e!864658)))

(declare-fun b!1553108 () Bool)

(assert (=> b!1553108 (= e!864658 (Some!807 (_2!12382 (h!37657 lt!669519))))))

(declare-fun b!1553110 () Bool)

(assert (=> b!1553110 (= e!864659 (getValueByKey!732 (t!50934 lt!669519) (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))

(assert (= (and d!161293 c!143165) b!1553108))

(assert (= (and d!161293 (not c!143165)) b!1553109))

(assert (= (and b!1553109 c!143166) b!1553110))

(assert (= (and b!1553109 (not c!143166)) b!1553111))

(declare-fun m!1431679 () Bool)

(assert (=> b!1553110 m!1431679))

(assert (=> d!161181 d!161293))

(declare-fun d!161295 () Bool)

(assert (=> d!161295 (= (getValueByKey!732 lt!669519 (_1!12382 (tuple2!24743 lt!669425 lt!669427))) (Some!807 (_2!12382 (tuple2!24743 lt!669425 lt!669427))))))

(declare-fun lt!669566 () Unit!51710)

(assert (=> d!161295 (= lt!669566 (choose!2038 lt!669519 (_1!12382 (tuple2!24743 lt!669425 lt!669427)) (_2!12382 (tuple2!24743 lt!669425 lt!669427))))))

(declare-fun e!864660 () Bool)

(assert (=> d!161295 e!864660))

(declare-fun res!1063103 () Bool)

(assert (=> d!161295 (=> (not res!1063103) (not e!864660))))

(assert (=> d!161295 (= res!1063103 (isStrictlySorted!887 lt!669519))))

(assert (=> d!161295 (= (lemmaContainsTupThenGetReturnValue!374 lt!669519 (_1!12382 (tuple2!24743 lt!669425 lt!669427)) (_2!12382 (tuple2!24743 lt!669425 lt!669427))) lt!669566)))

(declare-fun b!1553112 () Bool)

(declare-fun res!1063104 () Bool)

(assert (=> b!1553112 (=> (not res!1063104) (not e!864660))))

(assert (=> b!1553112 (= res!1063104 (containsKey!754 lt!669519 (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))

(declare-fun b!1553113 () Bool)

(assert (=> b!1553113 (= e!864660 (contains!10134 lt!669519 (tuple2!24743 (_1!12382 (tuple2!24743 lt!669425 lt!669427)) (_2!12382 (tuple2!24743 lt!669425 lt!669427)))))))

(assert (= (and d!161295 res!1063103) b!1553112))

(assert (= (and b!1553112 res!1063104) b!1553113))

(assert (=> d!161295 m!1431465))

(declare-fun m!1431681 () Bool)

(assert (=> d!161295 m!1431681))

(declare-fun m!1431683 () Bool)

(assert (=> d!161295 m!1431683))

(declare-fun m!1431685 () Bool)

(assert (=> b!1553112 m!1431685))

(declare-fun m!1431687 () Bool)

(assert (=> b!1553113 m!1431687))

(assert (=> d!161181 d!161295))

(declare-fun b!1553114 () Bool)

(declare-fun e!864665 () List!36216)

(declare-fun call!71361 () List!36216)

(assert (=> b!1553114 (= e!864665 call!71361)))

(declare-fun b!1553115 () Bool)

(declare-fun e!864662 () List!36216)

(declare-fun call!71360 () List!36216)

(assert (=> b!1553115 (= e!864662 call!71360)))

(declare-fun bm!71356 () Bool)

(declare-fun e!864663 () List!36216)

(declare-fun c!143170 () Bool)

(assert (=> bm!71356 (= call!71361 ($colon$colon!944 e!864663 (ite c!143170 (h!37657 (toList!11191 lt!669423)) (tuple2!24743 (_1!12382 (tuple2!24743 lt!669425 lt!669427)) (_2!12382 (tuple2!24743 lt!669425 lt!669427))))))))

(declare-fun c!143168 () Bool)

(assert (=> bm!71356 (= c!143168 c!143170)))

(declare-fun lt!669567 () List!36216)

(declare-fun e!864661 () Bool)

(declare-fun b!1553116 () Bool)

(assert (=> b!1553116 (= e!864661 (contains!10134 lt!669567 (tuple2!24743 (_1!12382 (tuple2!24743 lt!669425 lt!669427)) (_2!12382 (tuple2!24743 lt!669425 lt!669427)))))))

(declare-fun d!161297 () Bool)

(assert (=> d!161297 e!864661))

(declare-fun res!1063105 () Bool)

(assert (=> d!161297 (=> (not res!1063105) (not e!864661))))

(assert (=> d!161297 (= res!1063105 (isStrictlySorted!887 lt!669567))))

(assert (=> d!161297 (= lt!669567 e!864665)))

(assert (=> d!161297 (= c!143170 (and ((_ is Cons!36212) (toList!11191 lt!669423)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669423))) (_1!12382 (tuple2!24743 lt!669425 lt!669427)))))))

(assert (=> d!161297 (isStrictlySorted!887 (toList!11191 lt!669423))))

(assert (=> d!161297 (= (insertStrictlySorted!503 (toList!11191 lt!669423) (_1!12382 (tuple2!24743 lt!669425 lt!669427)) (_2!12382 (tuple2!24743 lt!669425 lt!669427))) lt!669567)))

(declare-fun b!1553117 () Bool)

(declare-fun e!864664 () List!36216)

(assert (=> b!1553117 (= e!864665 e!864664)))

(declare-fun c!143167 () Bool)

(assert (=> b!1553117 (= c!143167 (and ((_ is Cons!36212) (toList!11191 lt!669423)) (= (_1!12382 (h!37657 (toList!11191 lt!669423))) (_1!12382 (tuple2!24743 lt!669425 lt!669427)))))))

(declare-fun b!1553118 () Bool)

(assert (=> b!1553118 (= e!864663 (insertStrictlySorted!503 (t!50934 (toList!11191 lt!669423)) (_1!12382 (tuple2!24743 lt!669425 lt!669427)) (_2!12382 (tuple2!24743 lt!669425 lt!669427))))))

(declare-fun b!1553119 () Bool)

(assert (=> b!1553119 (= e!864662 call!71360)))

(declare-fun c!143169 () Bool)

(declare-fun b!1553120 () Bool)

(assert (=> b!1553120 (= c!143169 (and ((_ is Cons!36212) (toList!11191 lt!669423)) (bvsgt (_1!12382 (h!37657 (toList!11191 lt!669423))) (_1!12382 (tuple2!24743 lt!669425 lt!669427)))))))

(assert (=> b!1553120 (= e!864664 e!864662)))

(declare-fun b!1553121 () Bool)

(declare-fun res!1063106 () Bool)

(assert (=> b!1553121 (=> (not res!1063106) (not e!864661))))

(assert (=> b!1553121 (= res!1063106 (containsKey!754 lt!669567 (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))

(declare-fun bm!71357 () Bool)

(declare-fun call!71359 () List!36216)

(assert (=> bm!71357 (= call!71359 call!71361)))

(declare-fun bm!71358 () Bool)

(assert (=> bm!71358 (= call!71360 call!71359)))

(declare-fun b!1553122 () Bool)

(assert (=> b!1553122 (= e!864663 (ite c!143167 (t!50934 (toList!11191 lt!669423)) (ite c!143169 (Cons!36212 (h!37657 (toList!11191 lt!669423)) (t!50934 (toList!11191 lt!669423))) Nil!36213)))))

(declare-fun b!1553123 () Bool)

(assert (=> b!1553123 (= e!864664 call!71359)))

(assert (= (and d!161297 c!143170) b!1553114))

(assert (= (and d!161297 (not c!143170)) b!1553117))

(assert (= (and b!1553117 c!143167) b!1553123))

(assert (= (and b!1553117 (not c!143167)) b!1553120))

(assert (= (and b!1553120 c!143169) b!1553119))

(assert (= (and b!1553120 (not c!143169)) b!1553115))

(assert (= (or b!1553119 b!1553115) bm!71358))

(assert (= (or b!1553123 bm!71358) bm!71357))

(assert (= (or b!1553114 bm!71357) bm!71356))

(assert (= (and bm!71356 c!143168) b!1553118))

(assert (= (and bm!71356 (not c!143168)) b!1553122))

(assert (= (and d!161297 res!1063105) b!1553121))

(assert (= (and b!1553121 res!1063106) b!1553116))

(declare-fun m!1431689 () Bool)

(assert (=> b!1553121 m!1431689))

(declare-fun m!1431691 () Bool)

(assert (=> b!1553118 m!1431691))

(declare-fun m!1431693 () Bool)

(assert (=> bm!71356 m!1431693))

(declare-fun m!1431695 () Bool)

(assert (=> d!161297 m!1431695))

(declare-fun m!1431697 () Bool)

(assert (=> d!161297 m!1431697))

(declare-fun m!1431699 () Bool)

(assert (=> b!1553116 m!1431699))

(assert (=> d!161181 d!161297))

(declare-fun b!1553127 () Bool)

(declare-fun e!864667 () Option!808)

(assert (=> b!1553127 (= e!864667 None!806)))

(declare-fun b!1553125 () Bool)

(declare-fun e!864666 () Option!808)

(assert (=> b!1553125 (= e!864666 e!864667)))

(declare-fun c!143172 () Bool)

(assert (=> b!1553125 (= c!143172 (and ((_ is Cons!36212) (t!50934 lt!669405)) (not (= (_1!12382 (h!37657 (t!50934 lt!669405))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun d!161299 () Bool)

(declare-fun c!143171 () Bool)

(assert (=> d!161299 (= c!143171 (and ((_ is Cons!36212) (t!50934 lt!669405)) (= (_1!12382 (h!37657 (t!50934 lt!669405))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161299 (= (getValueByKey!732 (t!50934 lt!669405) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864666)))

(declare-fun b!1553124 () Bool)

(assert (=> b!1553124 (= e!864666 (Some!807 (_2!12382 (h!37657 (t!50934 lt!669405)))))))

(declare-fun b!1553126 () Bool)

(assert (=> b!1553126 (= e!864667 (getValueByKey!732 (t!50934 (t!50934 lt!669405)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161299 c!143171) b!1553124))

(assert (= (and d!161299 (not c!143171)) b!1553125))

(assert (= (and b!1553125 c!143172) b!1553126))

(assert (= (and b!1553125 (not c!143172)) b!1553127))

(declare-fun m!1431701 () Bool)

(assert (=> b!1553126 m!1431701))

(assert (=> b!1552997 d!161299))

(declare-fun d!161301 () Bool)

(declare-fun res!1063107 () Bool)

(declare-fun e!864668 () Bool)

(assert (=> d!161301 (=> res!1063107 e!864668)))

(assert (=> d!161301 (= res!1063107 (and ((_ is Cons!36212) (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)))) (= (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))))) lt!669422)))))

(assert (=> d!161301 (= (containsKey!754 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422) e!864668)))

(declare-fun b!1553128 () Bool)

(declare-fun e!864669 () Bool)

(assert (=> b!1553128 (= e!864668 e!864669)))

(declare-fun res!1063108 () Bool)

(assert (=> b!1553128 (=> (not res!1063108) (not e!864669))))

(assert (=> b!1553128 (= res!1063108 (and (or (not ((_ is Cons!36212) (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))))) (bvsle (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))))) lt!669422)) ((_ is Cons!36212) (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)))) (bvslt (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))))) lt!669422)))))

(declare-fun b!1553129 () Bool)

(assert (=> b!1553129 (= e!864669 (containsKey!754 (t!50934 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)))) lt!669422))))

(assert (= (and d!161301 (not res!1063107)) b!1553128))

(assert (= (and b!1553128 res!1063108) b!1553129))

(declare-fun m!1431703 () Bool)

(assert (=> b!1553129 m!1431703))

(assert (=> d!161179 d!161301))

(declare-fun d!161303 () Bool)

(assert (=> d!161303 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!669568 () Unit!51710)

(assert (=> d!161303 (= lt!669568 (choose!2037 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun e!864670 () Bool)

(assert (=> d!161303 e!864670))

(declare-fun res!1063109 () Bool)

(assert (=> d!161303 (=> (not res!1063109) (not e!864670))))

(assert (=> d!161303 (= res!1063109 (isStrictlySorted!887 (toList!11191 lt!669406)))))

(assert (=> d!161303 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) lt!669568)))

(declare-fun b!1553130 () Bool)

(assert (=> b!1553130 (= e!864670 (containsKey!754 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161303 res!1063109) b!1553130))

(assert (=> d!161303 m!1431179))

(assert (=> d!161303 m!1431179))

(assert (=> d!161303 m!1431543))

(declare-fun m!1431705 () Bool)

(assert (=> d!161303 m!1431705))

(declare-fun m!1431707 () Bool)

(assert (=> d!161303 m!1431707))

(assert (=> b!1553130 m!1431539))

(assert (=> b!1552992 d!161303))

(declare-fun d!161305 () Bool)

(assert (=> d!161305 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun bs!44624 () Bool)

(assert (= bs!44624 d!161305))

(assert (=> bs!44624 m!1431179))

(declare-fun m!1431709 () Bool)

(assert (=> bs!44624 m!1431709))

(assert (=> b!1552992 d!161305))

(assert (=> b!1552992 d!161235))

(declare-fun b!1553132 () Bool)

(declare-fun e!864676 () Bool)

(declare-fun e!864675 () Bool)

(assert (=> b!1553132 (= e!864676 e!864675)))

(declare-fun c!143176 () Bool)

(assert (=> b!1553132 (= c!143176 (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(declare-fun b!1553133 () Bool)

(assert (=> b!1553133 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(assert (=> b!1553133 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50561 _values!470)))))

(declare-fun lt!669575 () ListLongMap!22351)

(declare-fun e!864674 () Bool)

(assert (=> b!1553133 (= e!864674 (= (apply!1111 lt!669575 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1553134 () Bool)

(declare-fun e!864677 () Bool)

(assert (=> b!1553134 (= e!864677 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1553134 (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1553135 () Bool)

(declare-fun res!1063113 () Bool)

(declare-fun e!864673 () Bool)

(assert (=> b!1553135 (=> (not res!1063113) (not e!864673))))

(assert (=> b!1553135 (= res!1063113 (not (contains!10131 lt!669575 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553136 () Bool)

(declare-fun e!864671 () ListLongMap!22351)

(declare-fun e!864672 () ListLongMap!22351)

(assert (=> b!1553136 (= e!864671 e!864672)))

(declare-fun c!143174 () Bool)

(assert (=> b!1553136 (= c!143174 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1553137 () Bool)

(declare-fun call!71362 () ListLongMap!22351)

(assert (=> b!1553137 (= e!864672 call!71362)))

(declare-fun b!1553138 () Bool)

(assert (=> b!1553138 (= e!864673 e!864676)))

(declare-fun c!143175 () Bool)

(assert (=> b!1553138 (= c!143175 e!864677)))

(declare-fun res!1063110 () Bool)

(assert (=> b!1553138 (=> (not res!1063110) (not e!864677))))

(assert (=> b!1553138 (= res!1063110 (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(declare-fun b!1553139 () Bool)

(assert (=> b!1553139 (= e!864671 (ListLongMap!22352 Nil!36213))))

(declare-fun b!1553131 () Bool)

(assert (=> b!1553131 (= e!864675 (isEmpty!1132 lt!669575))))

(declare-fun d!161307 () Bool)

(assert (=> d!161307 e!864673))

(declare-fun res!1063112 () Bool)

(assert (=> d!161307 (=> (not res!1063112) (not e!864673))))

(assert (=> d!161307 (= res!1063112 (not (contains!10131 lt!669575 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161307 (= lt!669575 e!864671)))

(declare-fun c!143173 () Bool)

(assert (=> d!161307 (= c!143173 (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(assert (=> d!161307 (validMask!0 mask!926)))

(assert (=> d!161307 (= (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478) lt!669575)))

(declare-fun b!1553140 () Bool)

(assert (=> b!1553140 (= e!864676 e!864674)))

(assert (=> b!1553140 (and (bvsge (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(declare-fun res!1063111 () Bool)

(assert (=> b!1553140 (= res!1063111 (contains!10131 lt!669575 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1553140 (=> (not res!1063111) (not e!864674))))

(declare-fun b!1553141 () Bool)

(assert (=> b!1553141 (= e!864675 (= lt!669575 (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1553142 () Bool)

(declare-fun lt!669573 () Unit!51710)

(declare-fun lt!669571 () Unit!51710)

(assert (=> b!1553142 (= lt!669573 lt!669571)))

(declare-fun lt!669572 () (_ BitVec 64))

(declare-fun lt!669574 () V!59391)

(declare-fun lt!669569 () (_ BitVec 64))

(declare-fun lt!669570 () ListLongMap!22351)

(assert (=> b!1553142 (not (contains!10131 (+!5011 lt!669570 (tuple2!24743 lt!669572 lt!669574)) lt!669569))))

(assert (=> b!1553142 (= lt!669571 (addStillNotContains!513 lt!669570 lt!669572 lt!669574 lt!669569))))

(assert (=> b!1553142 (= lt!669569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1553142 (= lt!669574 (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1553142 (= lt!669572 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1553142 (= lt!669570 call!71362)))

(assert (=> b!1553142 (= e!864672 (+!5011 call!71362 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!71359 () Bool)

(assert (=> bm!71359 (= call!71362 (getCurrentListMapNoExtraKeys!6636 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!478))))

(assert (= (and d!161307 c!143173) b!1553139))

(assert (= (and d!161307 (not c!143173)) b!1553136))

(assert (= (and b!1553136 c!143174) b!1553142))

(assert (= (and b!1553136 (not c!143174)) b!1553137))

(assert (= (or b!1553142 b!1553137) bm!71359))

(assert (= (and d!161307 res!1063112) b!1553135))

(assert (= (and b!1553135 res!1063113) b!1553138))

(assert (= (and b!1553138 res!1063110) b!1553134))

(assert (= (and b!1553138 c!143175) b!1553140))

(assert (= (and b!1553138 (not c!143175)) b!1553132))

(assert (= (and b!1553140 res!1063111) b!1553133))

(assert (= (and b!1553132 c!143176) b!1553141))

(assert (= (and b!1553132 (not c!143176)) b!1553131))

(declare-fun b_lambda!24811 () Bool)

(assert (=> (not b_lambda!24811) (not b!1553133)))

(assert (=> b!1553133 t!50933))

(declare-fun b_and!51391 () Bool)

(assert (= b_and!51389 (and (=> t!50933 result!26089) b_and!51391)))

(declare-fun b_lambda!24813 () Bool)

(assert (=> (not b_lambda!24813) (not b!1553142)))

(assert (=> b!1553142 t!50933))

(declare-fun b_and!51393 () Bool)

(assert (= b_and!51391 (and (=> t!50933 result!26089) b_and!51393)))

(declare-fun m!1431711 () Bool)

(assert (=> d!161307 m!1431711))

(assert (=> d!161307 m!1431015))

(declare-fun m!1431713 () Bool)

(assert (=> bm!71359 m!1431713))

(declare-fun m!1431715 () Bool)

(assert (=> b!1553135 m!1431715))

(declare-fun m!1431717 () Bool)

(assert (=> b!1553136 m!1431717))

(assert (=> b!1553136 m!1431717))

(declare-fun m!1431719 () Bool)

(assert (=> b!1553136 m!1431719))

(declare-fun m!1431721 () Bool)

(assert (=> b!1553131 m!1431721))

(assert (=> b!1553140 m!1431717))

(assert (=> b!1553140 m!1431717))

(declare-fun m!1431723 () Bool)

(assert (=> b!1553140 m!1431723))

(assert (=> b!1553141 m!1431713))

(declare-fun m!1431725 () Bool)

(assert (=> b!1553142 m!1431725))

(declare-fun m!1431727 () Bool)

(assert (=> b!1553142 m!1431727))

(declare-fun m!1431729 () Bool)

(assert (=> b!1553142 m!1431729))

(declare-fun m!1431731 () Bool)

(assert (=> b!1553142 m!1431731))

(assert (=> b!1553142 m!1431031))

(declare-fun m!1431733 () Bool)

(assert (=> b!1553142 m!1431733))

(assert (=> b!1553142 m!1431731))

(assert (=> b!1553142 m!1431031))

(assert (=> b!1553142 m!1431725))

(assert (=> b!1553142 m!1431717))

(declare-fun m!1431735 () Bool)

(assert (=> b!1553142 m!1431735))

(assert (=> b!1553134 m!1431717))

(assert (=> b!1553134 m!1431717))

(assert (=> b!1553134 m!1431719))

(assert (=> b!1553133 m!1431731))

(assert (=> b!1553133 m!1431031))

(assert (=> b!1553133 m!1431733))

(assert (=> b!1553133 m!1431731))

(assert (=> b!1553133 m!1431717))

(declare-fun m!1431737 () Bool)

(assert (=> b!1553133 m!1431737))

(assert (=> b!1553133 m!1431031))

(assert (=> b!1553133 m!1431717))

(assert (=> b!1552815 d!161307))

(declare-fun d!161309 () Bool)

(assert (=> d!161309 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669576 () Unit!51710)

(assert (=> d!161309 (= lt!669576 (choose!2037 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864678 () Bool)

(assert (=> d!161309 e!864678))

(declare-fun res!1063114 () Bool)

(assert (=> d!161309 (=> (not res!1063114) (not e!864678))))

(assert (=> d!161309 (= res!1063114 (isStrictlySorted!887 (toList!11191 lt!669399)))))

(assert (=> d!161309 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669576)))

(declare-fun b!1553143 () Bool)

(assert (=> b!1553143 (= e!864678 (containsKey!754 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161309 res!1063114) b!1553143))

(assert (=> d!161309 m!1431157))

(assert (=> d!161309 m!1431157))

(assert (=> d!161309 m!1431417))

(declare-fun m!1431739 () Bool)

(assert (=> d!161309 m!1431739))

(declare-fun m!1431741 () Bool)

(assert (=> d!161309 m!1431741))

(assert (=> b!1553143 m!1431413))

(assert (=> b!1552928 d!161309))

(declare-fun d!161311 () Bool)

(assert (=> d!161311 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun bs!44625 () Bool)

(assert (= bs!44625 d!161311))

(assert (=> bs!44625 m!1431157))

(declare-fun m!1431743 () Bool)

(assert (=> bs!44625 m!1431743))

(assert (=> b!1552928 d!161311))

(assert (=> b!1552928 d!161131))

(declare-fun d!161313 () Bool)

(assert (=> d!161313 (= (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762))) (not ((_ is Some!807) (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)))))))

(assert (=> d!161119 d!161313))

(declare-fun b!1553147 () Bool)

(declare-fun e!864680 () Option!808)

(assert (=> b!1553147 (= e!864680 None!806)))

(declare-fun b!1553145 () Bool)

(declare-fun e!864679 () Option!808)

(assert (=> b!1553145 (= e!864679 e!864680)))

(declare-fun c!143178 () Bool)

(assert (=> b!1553145 (= c!143178 (and ((_ is Cons!36212) (toList!11191 lt!669520)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669520))) (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))))

(declare-fun c!143177 () Bool)

(declare-fun d!161315 () Bool)

(assert (=> d!161315 (= c!143177 (and ((_ is Cons!36212) (toList!11191 lt!669520)) (= (_1!12382 (h!37657 (toList!11191 lt!669520))) (_1!12382 (tuple2!24743 lt!669425 lt!669427)))))))

(assert (=> d!161315 (= (getValueByKey!732 (toList!11191 lt!669520) (_1!12382 (tuple2!24743 lt!669425 lt!669427))) e!864679)))

(declare-fun b!1553144 () Bool)

(assert (=> b!1553144 (= e!864679 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669520)))))))

(declare-fun b!1553146 () Bool)

(assert (=> b!1553146 (= e!864680 (getValueByKey!732 (t!50934 (toList!11191 lt!669520)) (_1!12382 (tuple2!24743 lt!669425 lt!669427))))))

(assert (= (and d!161315 c!143177) b!1553144))

(assert (= (and d!161315 (not c!143177)) b!1553145))

(assert (= (and b!1553145 c!143178) b!1553146))

(assert (= (and b!1553145 (not c!143178)) b!1553147))

(declare-fun m!1431745 () Bool)

(assert (=> b!1553146 m!1431745))

(assert (=> b!1552956 d!161315))

(assert (=> d!161157 d!161153))

(assert (=> d!161157 d!161155))

(declare-fun d!161317 () Bool)

(assert (=> d!161317 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161317 true))

(declare-fun _$12!483 () Unit!51710)

(assert (=> d!161317 (= (choose!2037 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000) _$12!483)))

(declare-fun bs!44626 () Bool)

(assert (= bs!44626 d!161317))

(assert (=> bs!44626 m!1431235))

(assert (=> bs!44626 m!1431235))

(assert (=> bs!44626 m!1431237))

(assert (=> d!161157 d!161317))

(declare-fun d!161319 () Bool)

(declare-fun res!1063115 () Bool)

(declare-fun e!864681 () Bool)

(assert (=> d!161319 (=> res!1063115 e!864681)))

(assert (=> d!161319 (= res!1063115 (or ((_ is Nil!36213) (toList!11191 lt!669336)) ((_ is Nil!36213) (t!50934 (toList!11191 lt!669336)))))))

(assert (=> d!161319 (= (isStrictlySorted!887 (toList!11191 lt!669336)) e!864681)))

(declare-fun b!1553148 () Bool)

(declare-fun e!864682 () Bool)

(assert (=> b!1553148 (= e!864681 e!864682)))

(declare-fun res!1063116 () Bool)

(assert (=> b!1553148 (=> (not res!1063116) (not e!864682))))

(assert (=> b!1553148 (= res!1063116 (bvslt (_1!12382 (h!37657 (toList!11191 lt!669336))) (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336))))))))

(declare-fun b!1553149 () Bool)

(assert (=> b!1553149 (= e!864682 (isStrictlySorted!887 (t!50934 (toList!11191 lt!669336))))))

(assert (= (and d!161319 (not res!1063115)) b!1553148))

(assert (= (and b!1553148 res!1063116) b!1553149))

(declare-fun m!1431747 () Bool)

(assert (=> b!1553149 m!1431747))

(assert (=> d!161157 d!161319))

(assert (=> b!1552951 d!161261))

(declare-fun d!161321 () Bool)

(assert (=> d!161321 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669577 () Unit!51710)

(assert (=> d!161321 (= lt!669577 (choose!2037 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)))))

(declare-fun e!864683 () Bool)

(assert (=> d!161321 e!864683))

(declare-fun res!1063117 () Bool)

(assert (=> d!161321 (=> (not res!1063117) (not e!864683))))

(assert (=> d!161321 (= res!1063117 (isStrictlySorted!887 (toList!11191 lt!669329)))))

(assert (=> d!161321 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)) lt!669577)))

(declare-fun b!1553150 () Bool)

(assert (=> b!1553150 (= e!864683 (containsKey!754 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161321 res!1063117) b!1553150))

(assert (=> d!161321 m!1431023))

(assert (=> d!161321 m!1431203))

(assert (=> d!161321 m!1431203))

(assert (=> d!161321 m!1431287))

(assert (=> d!161321 m!1431023))

(declare-fun m!1431749 () Bool)

(assert (=> d!161321 m!1431749))

(assert (=> d!161321 m!1431437))

(assert (=> b!1553150 m!1431023))

(assert (=> b!1553150 m!1431283))

(assert (=> b!1552786 d!161321))

(declare-fun d!161323 () Bool)

(assert (=> d!161323 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762))) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun bs!44627 () Bool)

(assert (= bs!44627 d!161323))

(assert (=> bs!44627 m!1431203))

(declare-fun m!1431751 () Bool)

(assert (=> bs!44627 m!1431751))

(assert (=> b!1552786 d!161323))

(assert (=> b!1552786 d!161227))

(assert (=> b!1552903 d!161193))

(declare-fun d!161325 () Bool)

(declare-fun lt!669578 () Bool)

(assert (=> d!161325 (= lt!669578 (select (content!794 lt!669446) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864685 () Bool)

(assert (=> d!161325 (= lt!669578 e!864685)))

(declare-fun res!1063119 () Bool)

(assert (=> d!161325 (=> (not res!1063119) (not e!864685))))

(assert (=> d!161325 (= res!1063119 ((_ is Cons!36212) lt!669446))))

(assert (=> d!161325 (= (contains!10134 lt!669446 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669578)))

(declare-fun b!1553151 () Bool)

(declare-fun e!864684 () Bool)

(assert (=> b!1553151 (= e!864685 e!864684)))

(declare-fun res!1063118 () Bool)

(assert (=> b!1553151 (=> res!1063118 e!864684)))

(assert (=> b!1553151 (= res!1063118 (= (h!37657 lt!669446) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553152 () Bool)

(assert (=> b!1553152 (= e!864684 (contains!10134 (t!50934 lt!669446) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161325 res!1063119) b!1553151))

(assert (= (and b!1553151 (not res!1063118)) b!1553152))

(declare-fun m!1431753 () Bool)

(assert (=> d!161325 m!1431753))

(declare-fun m!1431755 () Bool)

(assert (=> d!161325 m!1431755))

(declare-fun m!1431757 () Bool)

(assert (=> b!1553152 m!1431757))

(assert (=> b!1552838 d!161325))

(declare-fun d!161327 () Bool)

(assert (=> d!161327 (= (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!807) (getValueByKey!732 (toList!11191 lt!669336) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!161153 d!161327))

(assert (=> d!161191 d!161189))

(assert (=> d!161191 d!161061))

(assert (=> d!161191 d!161065))

(declare-fun d!161329 () Bool)

(declare-fun e!864687 () Bool)

(assert (=> d!161329 e!864687))

(declare-fun res!1063120 () Bool)

(assert (=> d!161329 (=> res!1063120 e!864687)))

(declare-fun lt!669580 () Bool)

(assert (=> d!161329 (= res!1063120 (not lt!669580))))

(declare-fun lt!669581 () Bool)

(assert (=> d!161329 (= lt!669580 lt!669581)))

(declare-fun lt!669579 () Unit!51710)

(declare-fun e!864686 () Unit!51710)

(assert (=> d!161329 (= lt!669579 e!864686)))

(declare-fun c!143179 () Bool)

(assert (=> d!161329 (= c!143179 lt!669581)))

(assert (=> d!161329 (= lt!669581 (containsKey!754 (toList!11191 lt!669475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161329 (= (contains!10131 lt!669475 #b0000000000000000000000000000000000000000000000000000000000000000) lt!669580)))

(declare-fun b!1553153 () Bool)

(declare-fun lt!669582 () Unit!51710)

(assert (=> b!1553153 (= e!864686 lt!669582)))

(assert (=> b!1553153 (= lt!669582 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1553153 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1553154 () Bool)

(declare-fun Unit!51728 () Unit!51710)

(assert (=> b!1553154 (= e!864686 Unit!51728)))

(declare-fun b!1553155 () Bool)

(assert (=> b!1553155 (= e!864687 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669475) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161329 c!143179) b!1553153))

(assert (= (and d!161329 (not c!143179)) b!1553154))

(assert (= (and d!161329 (not res!1063120)) b!1553155))

(declare-fun m!1431759 () Bool)

(assert (=> d!161329 m!1431759))

(declare-fun m!1431761 () Bool)

(assert (=> b!1553153 m!1431761))

(declare-fun m!1431763 () Bool)

(assert (=> b!1553153 m!1431763))

(assert (=> b!1553153 m!1431763))

(declare-fun m!1431765 () Bool)

(assert (=> b!1553153 m!1431765))

(assert (=> b!1553155 m!1431763))

(assert (=> b!1553155 m!1431763))

(assert (=> b!1553155 m!1431765))

(assert (=> d!161111 d!161329))

(assert (=> d!161111 d!161067))

(declare-fun d!161331 () Bool)

(assert (=> d!161331 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)))))

(declare-fun lt!669583 () Unit!51710)

(assert (=> d!161331 (= lt!669583 (choose!2037 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)))))

(declare-fun e!864688 () Bool)

(assert (=> d!161331 e!864688))

(declare-fun res!1063121 () Bool)

(assert (=> d!161331 (=> (not res!1063121) (not e!864688))))

(assert (=> d!161331 (= res!1063121 (isStrictlySorted!887 (toList!11191 lt!669428)))))

(assert (=> d!161331 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)) lt!669583)))

(declare-fun b!1553156 () Bool)

(assert (=> b!1553156 (= e!864688 (containsKey!754 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161331 res!1063121) b!1553156))

(assert (=> d!161331 m!1431023))

(assert (=> d!161331 m!1431495))

(assert (=> d!161331 m!1431495))

(assert (=> d!161331 m!1431497))

(assert (=> d!161331 m!1431023))

(declare-fun m!1431767 () Bool)

(assert (=> d!161331 m!1431767))

(declare-fun m!1431769 () Bool)

(assert (=> d!161331 m!1431769))

(assert (=> b!1553156 m!1431023))

(assert (=> b!1553156 m!1431491))

(assert (=> b!1552964 d!161331))

(declare-fun d!161333 () Bool)

(assert (=> d!161333 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762))) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun bs!44628 () Bool)

(assert (= bs!44628 d!161333))

(assert (=> bs!44628 m!1431495))

(declare-fun m!1431771 () Bool)

(assert (=> bs!44628 m!1431771))

(assert (=> b!1552964 d!161333))

(declare-fun b!1553160 () Bool)

(declare-fun e!864690 () Option!808)

(assert (=> b!1553160 (= e!864690 None!806)))

(declare-fun b!1553158 () Bool)

(declare-fun e!864689 () Option!808)

(assert (=> b!1553158 (= e!864689 e!864690)))

(declare-fun c!143181 () Bool)

(assert (=> b!1553158 (= c!143181 (and ((_ is Cons!36212) (toList!11191 lt!669428)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669428))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun d!161335 () Bool)

(declare-fun c!143180 () Bool)

(assert (=> d!161335 (= c!143180 (and ((_ is Cons!36212) (toList!11191 lt!669428)) (= (_1!12382 (h!37657 (toList!11191 lt!669428))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161335 (= (getValueByKey!732 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)) e!864689)))

(declare-fun b!1553157 () Bool)

(assert (=> b!1553157 (= e!864689 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669428)))))))

(declare-fun b!1553159 () Bool)

(assert (=> b!1553159 (= e!864690 (getValueByKey!732 (t!50934 (toList!11191 lt!669428)) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161335 c!143180) b!1553157))

(assert (= (and d!161335 (not c!143180)) b!1553158))

(assert (= (and b!1553158 c!143181) b!1553159))

(assert (= (and b!1553158 (not c!143181)) b!1553160))

(assert (=> b!1553159 m!1431023))

(declare-fun m!1431773 () Bool)

(assert (=> b!1553159 m!1431773))

(assert (=> b!1552964 d!161335))

(declare-fun d!161337 () Bool)

(declare-fun res!1063122 () Bool)

(declare-fun e!864691 () Bool)

(assert (=> d!161337 (=> res!1063122 e!864691)))

(assert (=> d!161337 (= res!1063122 (and ((_ is Cons!36212) (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (= (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161337 (= (containsKey!754 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762)) e!864691)))

(declare-fun b!1553161 () Bool)

(declare-fun e!864692 () Bool)

(assert (=> b!1553161 (= e!864691 e!864692)))

(declare-fun res!1063123 () Bool)

(assert (=> b!1553161 (=> (not res!1063123) (not e!864692))))

(assert (=> b!1553161 (= res!1063123 (and (or (not ((_ is Cons!36212) (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (bvsle (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50010 _keys!618) from!762))) ((_ is Cons!36212) (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (bvslt (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (select (arr!50010 _keys!618) from!762))))))

(declare-fun b!1553162 () Bool)

(assert (=> b!1553162 (= e!864692 (containsKey!754 (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161337 (not res!1063122)) b!1553161))

(assert (= (and b!1553161 res!1063123) b!1553162))

(assert (=> b!1553162 m!1431023))

(declare-fun m!1431775 () Bool)

(assert (=> b!1553162 m!1431775))

(assert (=> d!161097 d!161337))

(assert (=> d!161099 d!161097))

(assert (=> d!161099 d!161061))

(declare-fun d!161339 () Bool)

(declare-fun c!143182 () Bool)

(assert (=> d!161339 (= c!143182 ((_ is Nil!36213) (toList!11191 lt!669399)))))

(declare-fun e!864693 () (InoxSet tuple2!24742))

(assert (=> d!161339 (= (content!794 (toList!11191 lt!669399)) e!864693)))

(declare-fun b!1553163 () Bool)

(assert (=> b!1553163 (= e!864693 ((as const (Array tuple2!24742 Bool)) false))))

(declare-fun b!1553164 () Bool)

(assert (=> b!1553164 (= e!864693 ((_ map or) (store ((as const (Array tuple2!24742 Bool)) false) (h!37657 (toList!11191 lt!669399)) true) (content!794 (t!50934 (toList!11191 lt!669399)))))))

(assert (= (and d!161339 c!143182) b!1553163))

(assert (= (and d!161339 (not c!143182)) b!1553164))

(declare-fun m!1431777 () Bool)

(assert (=> b!1553164 m!1431777))

(declare-fun m!1431779 () Bool)

(assert (=> b!1553164 m!1431779))

(assert (=> d!161205 d!161339))

(declare-fun b!1553165 () Bool)

(declare-fun e!864698 () List!36216)

(declare-fun call!71365 () List!36216)

(assert (=> b!1553165 (= e!864698 call!71365)))

(declare-fun b!1553166 () Bool)

(declare-fun e!864695 () List!36216)

(declare-fun call!71364 () List!36216)

(assert (=> b!1553166 (= e!864695 call!71364)))

(declare-fun e!864696 () List!36216)

(declare-fun bm!71360 () Bool)

(declare-fun c!143186 () Bool)

(assert (=> bm!71360 (= call!71365 ($colon$colon!944 e!864696 (ite c!143186 (h!37657 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun c!143184 () Bool)

(assert (=> bm!71360 (= c!143184 c!143186)))

(declare-fun e!864694 () Bool)

(declare-fun lt!669584 () List!36216)

(declare-fun b!1553167 () Bool)

(assert (=> b!1553167 (= e!864694 (contains!10134 lt!669584 (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161341 () Bool)

(assert (=> d!161341 e!864694))

(declare-fun res!1063124 () Bool)

(assert (=> d!161341 (=> (not res!1063124) (not e!864694))))

(assert (=> d!161341 (= res!1063124 (isStrictlySorted!887 lt!669584))))

(assert (=> d!161341 (= lt!669584 e!864698)))

(assert (=> d!161341 (= c!143186 (and ((_ is Cons!36212) (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (bvslt (_1!12382 (h!37657 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161341 (isStrictlySorted!887 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))))))

(assert (=> d!161341 (= (insertStrictlySorted!503 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669584)))

(declare-fun b!1553168 () Bool)

(declare-fun e!864697 () List!36216)

(assert (=> b!1553168 (= e!864698 e!864697)))

(declare-fun c!143183 () Bool)

(assert (=> b!1553168 (= c!143183 (and ((_ is Cons!36212) (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553169 () Bool)

(assert (=> b!1553169 (= e!864696 (insertStrictlySorted!503 (t!50934 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553170 () Bool)

(assert (=> b!1553170 (= e!864695 call!71364)))

(declare-fun c!143185 () Bool)

(declare-fun b!1553171 () Bool)

(assert (=> b!1553171 (= c!143185 (and ((_ is Cons!36212) (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (bvsgt (_1!12382 (h!37657 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> b!1553171 (= e!864697 e!864695)))

(declare-fun b!1553172 () Bool)

(declare-fun res!1063125 () Bool)

(assert (=> b!1553172 (=> (not res!1063125) (not e!864694))))

(assert (=> b!1553172 (= res!1063125 (containsKey!754 lt!669584 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun bm!71361 () Bool)

(declare-fun call!71363 () List!36216)

(assert (=> bm!71361 (= call!71363 call!71365)))

(declare-fun bm!71362 () Bool)

(assert (=> bm!71362 (= call!71364 call!71363)))

(declare-fun b!1553173 () Bool)

(assert (=> b!1553173 (= e!864696 (ite c!143183 (t!50934 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (ite c!143185 (Cons!36212 (h!37657 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (t!50934 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))))) Nil!36213)))))

(declare-fun b!1553174 () Bool)

(assert (=> b!1553174 (= e!864697 call!71363)))

(assert (= (and d!161341 c!143186) b!1553165))

(assert (= (and d!161341 (not c!143186)) b!1553168))

(assert (= (and b!1553168 c!143183) b!1553174))

(assert (= (and b!1553168 (not c!143183)) b!1553171))

(assert (= (and b!1553171 c!143185) b!1553170))

(assert (= (and b!1553171 (not c!143185)) b!1553166))

(assert (= (or b!1553170 b!1553166) bm!71362))

(assert (= (or b!1553174 bm!71362) bm!71361))

(assert (= (or b!1553165 bm!71361) bm!71360))

(assert (= (and bm!71360 c!143184) b!1553169))

(assert (= (and bm!71360 (not c!143184)) b!1553173))

(assert (= (and d!161341 res!1063124) b!1553172))

(assert (= (and b!1553172 res!1063125) b!1553167))

(declare-fun m!1431781 () Bool)

(assert (=> b!1553172 m!1431781))

(declare-fun m!1431783 () Bool)

(assert (=> b!1553169 m!1431783))

(declare-fun m!1431785 () Bool)

(assert (=> bm!71360 m!1431785))

(declare-fun m!1431787 () Bool)

(assert (=> d!161341 m!1431787))

(declare-fun m!1431789 () Bool)

(assert (=> d!161341 m!1431789))

(declare-fun m!1431791 () Bool)

(assert (=> b!1553167 m!1431791))

(assert (=> b!1552984 d!161341))

(declare-fun b!1553178 () Bool)

(declare-fun e!864700 () Option!808)

(assert (=> b!1553178 (= e!864700 None!806)))

(declare-fun b!1553176 () Bool)

(declare-fun e!864699 () Option!808)

(assert (=> b!1553176 (= e!864699 e!864700)))

(declare-fun c!143188 () Bool)

(assert (=> b!1553176 (= c!143188 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669332))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669332)))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun d!161343 () Bool)

(declare-fun c!143187 () Bool)

(assert (=> d!161343 (= c!143187 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669332))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669332)))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161343 (= (getValueByKey!732 (t!50934 (toList!11191 lt!669332)) (select (arr!50010 _keys!618) from!762)) e!864699)))

(declare-fun b!1553175 () Bool)

(assert (=> b!1553175 (= e!864699 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 lt!669332))))))))

(declare-fun b!1553177 () Bool)

(assert (=> b!1553177 (= e!864700 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 lt!669332))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161343 c!143187) b!1553175))

(assert (= (and d!161343 (not c!143187)) b!1553176))

(assert (= (and b!1553176 c!143188) b!1553177))

(assert (= (and b!1553176 (not c!143188)) b!1553178))

(assert (=> b!1553177 m!1431023))

(declare-fun m!1431793 () Bool)

(assert (=> b!1553177 m!1431793))

(assert (=> b!1552824 d!161343))

(declare-fun d!161345 () Bool)

(declare-fun res!1063126 () Bool)

(declare-fun e!864701 () Bool)

(assert (=> d!161345 (=> res!1063126 e!864701)))

(assert (=> d!161345 (= res!1063126 (or ((_ is Nil!36213) lt!669538) ((_ is Nil!36213) (t!50934 lt!669538))))))

(assert (=> d!161345 (= (isStrictlySorted!887 lt!669538) e!864701)))

(declare-fun b!1553179 () Bool)

(declare-fun e!864702 () Bool)

(assert (=> b!1553179 (= e!864701 e!864702)))

(declare-fun res!1063127 () Bool)

(assert (=> b!1553179 (=> (not res!1063127) (not e!864702))))

(assert (=> b!1553179 (= res!1063127 (bvslt (_1!12382 (h!37657 lt!669538)) (_1!12382 (h!37657 (t!50934 lt!669538)))))))

(declare-fun b!1553180 () Bool)

(assert (=> b!1553180 (= e!864702 (isStrictlySorted!887 (t!50934 lt!669538)))))

(assert (= (and d!161345 (not res!1063126)) b!1553179))

(assert (= (and b!1553179 res!1063127) b!1553180))

(declare-fun m!1431795 () Bool)

(assert (=> b!1553180 m!1431795))

(assert (=> d!161203 d!161345))

(declare-fun d!161347 () Bool)

(declare-fun res!1063128 () Bool)

(declare-fun e!864703 () Bool)

(assert (=> d!161347 (=> res!1063128 e!864703)))

(assert (=> d!161347 (= res!1063128 (or ((_ is Nil!36213) (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) ((_ is Nil!36213) (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))))))))

(assert (=> d!161347 (= (isStrictlySorted!887 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295)))) e!864703)))

(declare-fun b!1553181 () Bool)

(declare-fun e!864704 () Bool)

(assert (=> b!1553181 (= e!864703 e!864704)))

(declare-fun res!1063129 () Bool)

(assert (=> b!1553181 (=> (not res!1063129) (not e!864704))))

(assert (=> b!1553181 (= res!1063129 (bvslt (_1!12382 (h!37657 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))) (_1!12382 (h!37657 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))))))))

(declare-fun b!1553182 () Bool)

(assert (=> b!1553182 (= e!864704 (isStrictlySorted!887 (t!50934 (toList!11191 (ite c!143012 call!71298 (ite c!143013 call!71300 call!71295))))))))

(assert (= (and d!161347 (not res!1063128)) b!1553181))

(assert (= (and b!1553181 res!1063129) b!1553182))

(assert (=> b!1553182 m!1431789))

(assert (=> d!161203 d!161347))

(declare-fun b!1553186 () Bool)

(declare-fun e!864706 () Option!808)

(assert (=> b!1553186 (= e!864706 None!806)))

(declare-fun b!1553184 () Bool)

(declare-fun e!864705 () Option!808)

(assert (=> b!1553184 (= e!864705 e!864706)))

(declare-fun c!143190 () Bool)

(assert (=> b!1553184 (= c!143190 (and ((_ is Cons!36212) (t!50934 lt!669434)) (not (= (_1!12382 (h!37657 (t!50934 lt!669434))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun d!161349 () Bool)

(declare-fun c!143189 () Bool)

(assert (=> d!161349 (= c!143189 (and ((_ is Cons!36212) (t!50934 lt!669434)) (= (_1!12382 (h!37657 (t!50934 lt!669434))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161349 (= (getValueByKey!732 (t!50934 lt!669434) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864705)))

(declare-fun b!1553183 () Bool)

(assert (=> b!1553183 (= e!864705 (Some!807 (_2!12382 (h!37657 (t!50934 lt!669434)))))))

(declare-fun b!1553185 () Bool)

(assert (=> b!1553185 (= e!864706 (getValueByKey!732 (t!50934 (t!50934 lt!669434)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161349 c!143189) b!1553183))

(assert (= (and d!161349 (not c!143189)) b!1553184))

(assert (= (and b!1553184 c!143190) b!1553185))

(assert (= (and b!1553184 (not c!143190)) b!1553186))

(declare-fun m!1431797 () Bool)

(assert (=> b!1553185 m!1431797))

(assert (=> b!1552976 d!161349))

(assert (=> d!161159 d!161161))

(declare-fun d!161351 () Bool)

(assert (=> d!161351 (arrayContainsKey!0 _keys!618 lt!669455 #b00000000000000000000000000000000)))

(assert (=> d!161351 true))

(declare-fun _$60!454 () Unit!51710)

(assert (=> d!161351 (= (choose!13 _keys!618 lt!669455 #b00000000000000000000000000000000) _$60!454)))

(declare-fun bs!44629 () Bool)

(assert (= bs!44629 d!161351))

(assert (=> bs!44629 m!1431267))

(assert (=> d!161159 d!161351))

(declare-fun d!161353 () Bool)

(declare-fun res!1063130 () Bool)

(declare-fun e!864707 () Bool)

(assert (=> d!161353 (=> res!1063130 e!864707)))

(assert (=> d!161353 (= res!1063130 (and ((_ is Cons!36212) (toList!11191 lt!669406)) (= (_1!12382 (h!37657 (toList!11191 lt!669406))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161353 (= (containsKey!754 (toList!11191 lt!669406) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864707)))

(declare-fun b!1553187 () Bool)

(declare-fun e!864708 () Bool)

(assert (=> b!1553187 (= e!864707 e!864708)))

(declare-fun res!1063131 () Bool)

(assert (=> b!1553187 (=> (not res!1063131) (not e!864708))))

(assert (=> b!1553187 (= res!1063131 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669406))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669406))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) ((_ is Cons!36212) (toList!11191 lt!669406)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669406))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553188 () Bool)

(assert (=> b!1553188 (= e!864708 (containsKey!754 (t!50934 (toList!11191 lt!669406)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161353 (not res!1063130)) b!1553187))

(assert (= (and b!1553187 res!1063131) b!1553188))

(declare-fun m!1431799 () Bool)

(assert (=> b!1553188 m!1431799))

(assert (=> d!161209 d!161353))

(declare-fun d!161355 () Bool)

(declare-fun res!1063132 () Bool)

(declare-fun e!864709 () Bool)

(assert (=> d!161355 (=> res!1063132 e!864709)))

(assert (=> d!161355 (= res!1063132 (and ((_ is Cons!36212) (toList!11191 lt!669399)) (= (_1!12382 (h!37657 (toList!11191 lt!669399))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161355 (= (containsKey!754 (toList!11191 lt!669399) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864709)))

(declare-fun b!1553189 () Bool)

(declare-fun e!864710 () Bool)

(assert (=> b!1553189 (= e!864709 e!864710)))

(declare-fun res!1063133 () Bool)

(assert (=> b!1553189 (=> (not res!1063133) (not e!864710))))

(assert (=> b!1553189 (= res!1063133 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669399))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669399))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36212) (toList!11191 lt!669399)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669399))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553190 () Bool)

(assert (=> b!1553190 (= e!864710 (containsKey!754 (t!50934 (toList!11191 lt!669399)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161355 (not res!1063132)) b!1553189))

(assert (= (and b!1553189 res!1063133) b!1553190))

(declare-fun m!1431801 () Bool)

(assert (=> b!1553190 m!1431801))

(assert (=> d!161165 d!161355))

(declare-fun d!161357 () Bool)

(assert (=> d!161357 (= (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) (and (not (= (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1552810 d!161357))

(declare-fun b!1553191 () Bool)

(declare-fun e!864715 () List!36216)

(declare-fun call!71368 () List!36216)

(assert (=> b!1553191 (= e!864715 call!71368)))

(declare-fun b!1553192 () Bool)

(declare-fun e!864712 () List!36216)

(declare-fun call!71367 () List!36216)

(assert (=> b!1553192 (= e!864712 call!71367)))

(declare-fun e!864713 () List!36216)

(declare-fun bm!71363 () Bool)

(declare-fun c!143194 () Bool)

(assert (=> bm!71363 (= call!71368 ($colon$colon!944 e!864713 (ite c!143194 (h!37657 (t!50934 (toList!11191 call!71297))) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun c!143192 () Bool)

(assert (=> bm!71363 (= c!143192 c!143194)))

(declare-fun b!1553193 () Bool)

(declare-fun e!864711 () Bool)

(declare-fun lt!669585 () List!36216)

(assert (=> b!1553193 (= e!864711 (contains!10134 lt!669585 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun d!161359 () Bool)

(assert (=> d!161359 e!864711))

(declare-fun res!1063134 () Bool)

(assert (=> d!161359 (=> (not res!1063134) (not e!864711))))

(assert (=> d!161359 (= res!1063134 (isStrictlySorted!887 lt!669585))))

(assert (=> d!161359 (= lt!669585 e!864715)))

(assert (=> d!161359 (= c!143194 (and ((_ is Cons!36212) (t!50934 (toList!11191 call!71297))) (bvslt (_1!12382 (h!37657 (t!50934 (toList!11191 call!71297)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161359 (isStrictlySorted!887 (t!50934 (toList!11191 call!71297)))))

(assert (=> d!161359 (= (insertStrictlySorted!503 (t!50934 (toList!11191 call!71297)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669585)))

(declare-fun b!1553194 () Bool)

(declare-fun e!864714 () List!36216)

(assert (=> b!1553194 (= e!864715 e!864714)))

(declare-fun c!143191 () Bool)

(assert (=> b!1553194 (= c!143191 (and ((_ is Cons!36212) (t!50934 (toList!11191 call!71297))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 call!71297)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553195 () Bool)

(assert (=> b!1553195 (= e!864713 (insertStrictlySorted!503 (t!50934 (t!50934 (toList!11191 call!71297))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1553196 () Bool)

(assert (=> b!1553196 (= e!864712 call!71367)))

(declare-fun b!1553197 () Bool)

(declare-fun c!143193 () Bool)

(assert (=> b!1553197 (= c!143193 (and ((_ is Cons!36212) (t!50934 (toList!11191 call!71297))) (bvsgt (_1!12382 (h!37657 (t!50934 (toList!11191 call!71297)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> b!1553197 (= e!864714 e!864712)))

(declare-fun b!1553198 () Bool)

(declare-fun res!1063135 () Bool)

(assert (=> b!1553198 (=> (not res!1063135) (not e!864711))))

(assert (=> b!1553198 (= res!1063135 (containsKey!754 lt!669585 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71364 () Bool)

(declare-fun call!71366 () List!36216)

(assert (=> bm!71364 (= call!71366 call!71368)))

(declare-fun bm!71365 () Bool)

(assert (=> bm!71365 (= call!71367 call!71366)))

(declare-fun b!1553199 () Bool)

(assert (=> b!1553199 (= e!864713 (ite c!143191 (t!50934 (t!50934 (toList!11191 call!71297))) (ite c!143193 (Cons!36212 (h!37657 (t!50934 (toList!11191 call!71297))) (t!50934 (t!50934 (toList!11191 call!71297)))) Nil!36213)))))

(declare-fun b!1553200 () Bool)

(assert (=> b!1553200 (= e!864714 call!71366)))

(assert (= (and d!161359 c!143194) b!1553191))

(assert (= (and d!161359 (not c!143194)) b!1553194))

(assert (= (and b!1553194 c!143191) b!1553200))

(assert (= (and b!1553194 (not c!143191)) b!1553197))

(assert (= (and b!1553197 c!143193) b!1553196))

(assert (= (and b!1553197 (not c!143193)) b!1553192))

(assert (= (or b!1553196 b!1553192) bm!71365))

(assert (= (or b!1553200 bm!71365) bm!71364))

(assert (= (or b!1553191 bm!71364) bm!71363))

(assert (= (and bm!71363 c!143192) b!1553195))

(assert (= (and bm!71363 (not c!143192)) b!1553199))

(assert (= (and d!161359 res!1063134) b!1553198))

(assert (= (and b!1553198 res!1063135) b!1553193))

(declare-fun m!1431803 () Bool)

(assert (=> b!1553198 m!1431803))

(declare-fun m!1431805 () Bool)

(assert (=> b!1553195 m!1431805))

(declare-fun m!1431807 () Bool)

(assert (=> bm!71363 m!1431807))

(declare-fun m!1431809 () Bool)

(assert (=> d!161359 m!1431809))

(declare-fun m!1431811 () Bool)

(assert (=> d!161359 m!1431811))

(declare-fun m!1431813 () Bool)

(assert (=> b!1553193 m!1431813))

(assert (=> b!1552863 d!161359))

(declare-fun d!161361 () Bool)

(assert (=> d!161361 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669586 () Unit!51710)

(assert (=> d!161361 (= lt!669586 (choose!2037 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864716 () Bool)

(assert (=> d!161361 e!864716))

(declare-fun res!1063136 () Bool)

(assert (=> d!161361 (=> (not res!1063136) (not e!864716))))

(assert (=> d!161361 (= res!1063136 (isStrictlySorted!887 (toList!11191 lt!669435)))))

(assert (=> d!161361 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669586)))

(declare-fun b!1553201 () Bool)

(assert (=> b!1553201 (= e!864716 (containsKey!754 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161361 res!1063136) b!1553201))

(assert (=> d!161361 m!1431227))

(assert (=> d!161361 m!1431227))

(assert (=> d!161361 m!1431509))

(declare-fun m!1431815 () Bool)

(assert (=> d!161361 m!1431815))

(declare-fun m!1431817 () Bool)

(assert (=> d!161361 m!1431817))

(assert (=> b!1553201 m!1431505))

(assert (=> b!1552971 d!161361))

(declare-fun d!161363 () Bool)

(assert (=> d!161363 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))))

(declare-fun bs!44630 () Bool)

(assert (= bs!44630 d!161363))

(assert (=> bs!44630 m!1431227))

(declare-fun m!1431819 () Bool)

(assert (=> bs!44630 m!1431819))

(assert (=> b!1552971 d!161363))

(assert (=> b!1552971 d!161223))

(declare-fun d!161365 () Bool)

(declare-fun e!864718 () Bool)

(assert (=> d!161365 e!864718))

(declare-fun res!1063137 () Bool)

(assert (=> d!161365 (=> res!1063137 e!864718)))

(declare-fun lt!669588 () Bool)

(assert (=> d!161365 (= res!1063137 (not lt!669588))))

(declare-fun lt!669589 () Bool)

(assert (=> d!161365 (= lt!669588 lt!669589)))

(declare-fun lt!669587 () Unit!51710)

(declare-fun e!864717 () Unit!51710)

(assert (=> d!161365 (= lt!669587 e!864717)))

(declare-fun c!143195 () Bool)

(assert (=> d!161365 (= c!143195 lt!669589)))

(assert (=> d!161365 (= lt!669589 (containsKey!754 (toList!11191 lt!669475) (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> d!161365 (= (contains!10131 lt!669475 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))) lt!669588)))

(declare-fun b!1553202 () Bool)

(declare-fun lt!669590 () Unit!51710)

(assert (=> b!1553202 (= e!864717 lt!669590)))

(assert (=> b!1553202 (= lt!669590 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669475) (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(assert (=> b!1553202 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669475) (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001))))))

(declare-fun b!1553203 () Bool)

(declare-fun Unit!51729 () Unit!51710)

(assert (=> b!1553203 (= e!864717 Unit!51729)))

(declare-fun b!1553204 () Bool)

(assert (=> b!1553204 (= e!864718 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669475) (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)))))))

(assert (= (and d!161365 c!143195) b!1553202))

(assert (= (and d!161365 (not c!143195)) b!1553203))

(assert (= (and d!161365 (not res!1063137)) b!1553204))

(assert (=> d!161365 m!1431303))

(declare-fun m!1431821 () Bool)

(assert (=> d!161365 m!1431821))

(assert (=> b!1553202 m!1431303))

(declare-fun m!1431823 () Bool)

(assert (=> b!1553202 m!1431823))

(assert (=> b!1553202 m!1431303))

(assert (=> b!1553202 m!1431615))

(assert (=> b!1553202 m!1431615))

(declare-fun m!1431825 () Bool)

(assert (=> b!1553202 m!1431825))

(assert (=> b!1553204 m!1431303))

(assert (=> b!1553204 m!1431615))

(assert (=> b!1553204 m!1431615))

(assert (=> b!1553204 m!1431825))

(assert (=> b!1552814 d!161365))

(declare-fun d!161367 () Bool)

(declare-fun res!1063138 () Bool)

(declare-fun e!864719 () Bool)

(assert (=> d!161367 (=> res!1063138 e!864719)))

(assert (=> d!161367 (= res!1063138 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161367 (= (containsKey!754 (t!50934 (toList!11191 lt!669336)) (select (arr!50010 _keys!618) from!762)) e!864719)))

(declare-fun b!1553205 () Bool)

(declare-fun e!864720 () Bool)

(assert (=> b!1553205 (= e!864719 e!864720)))

(declare-fun res!1063139 () Bool)

(assert (=> b!1553205 (=> (not res!1063139) (not e!864720))))

(assert (=> b!1553205 (= res!1063139 (and (or (not ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336)))) (bvsle (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) (select (arr!50010 _keys!618) from!762))) ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (bvslt (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) (select (arr!50010 _keys!618) from!762))))))

(declare-fun b!1553206 () Bool)

(assert (=> b!1553206 (= e!864720 (containsKey!754 (t!50934 (t!50934 (toList!11191 lt!669336))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161367 (not res!1063138)) b!1553205))

(assert (= (and b!1553205 res!1063139) b!1553206))

(assert (=> b!1553206 m!1431023))

(declare-fun m!1431827 () Bool)

(assert (=> b!1553206 m!1431827))

(assert (=> b!1552883 d!161367))

(declare-fun d!161369 () Bool)

(declare-fun res!1063140 () Bool)

(declare-fun e!864721 () Bool)

(assert (=> d!161369 (=> res!1063140 e!864721)))

(assert (=> d!161369 (= res!1063140 (and ((_ is Cons!36212) (toList!11191 lt!669329)) (= (_1!12382 (h!37657 (toList!11191 lt!669329))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161369 (= (containsKey!754 (toList!11191 lt!669329) (select (arr!50010 _keys!618) from!762)) e!864721)))

(declare-fun b!1553207 () Bool)

(declare-fun e!864722 () Bool)

(assert (=> b!1553207 (= e!864721 e!864722)))

(declare-fun res!1063141 () Bool)

(assert (=> b!1553207 (=> (not res!1063141) (not e!864722))))

(assert (=> b!1553207 (= res!1063141 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669329))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669329))) (select (arr!50010 _keys!618) from!762))) ((_ is Cons!36212) (toList!11191 lt!669329)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669329))) (select (arr!50010 _keys!618) from!762))))))

(declare-fun b!1553208 () Bool)

(assert (=> b!1553208 (= e!864722 (containsKey!754 (t!50934 (toList!11191 lt!669329)) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161369 (not res!1063140)) b!1553207))

(assert (= (and b!1553207 res!1063141) b!1553208))

(assert (=> b!1553208 m!1431023))

(declare-fun m!1431829 () Bool)

(assert (=> b!1553208 m!1431829))

(assert (=> d!161101 d!161369))

(declare-fun d!161371 () Bool)

(declare-fun res!1063142 () Bool)

(declare-fun e!864723 () Bool)

(assert (=> d!161371 (=> res!1063142 e!864723)))

(assert (=> d!161371 (= res!1063142 (and ((_ is Cons!36212) lt!669509) (= (_1!12382 (h!37657 lt!669509)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161371 (= (containsKey!754 lt!669509 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864723)))

(declare-fun b!1553209 () Bool)

(declare-fun e!864724 () Bool)

(assert (=> b!1553209 (= e!864723 e!864724)))

(declare-fun res!1063143 () Bool)

(assert (=> b!1553209 (=> (not res!1063143) (not e!864724))))

(assert (=> b!1553209 (= res!1063143 (and (or (not ((_ is Cons!36212) lt!669509)) (bvsle (_1!12382 (h!37657 lt!669509)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36212) lt!669509) (bvslt (_1!12382 (h!37657 lt!669509)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553210 () Bool)

(assert (=> b!1553210 (= e!864724 (containsKey!754 (t!50934 lt!669509) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161371 (not res!1063142)) b!1553209))

(assert (= (and b!1553209 res!1063143) b!1553210))

(declare-fun m!1431831 () Bool)

(assert (=> b!1553210 m!1431831))

(assert (=> b!1552944 d!161371))

(assert (=> d!161141 d!161143))

(assert (=> d!161141 d!161145))

(declare-fun d!161373 () Bool)

(assert (=> d!161373 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161373 true))

(declare-fun _$12!484 () Unit!51710)

(assert (=> d!161373 (= (choose!2037 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000) _$12!484)))

(declare-fun bs!44631 () Bool)

(assert (= bs!44631 d!161373))

(assert (=> bs!44631 m!1431215))

(assert (=> bs!44631 m!1431215))

(assert (=> bs!44631 m!1431243))

(assert (=> d!161141 d!161373))

(assert (=> d!161141 d!161319))

(declare-fun d!161375 () Bool)

(declare-fun res!1063144 () Bool)

(declare-fun e!864725 () Bool)

(assert (=> d!161375 (=> res!1063144 e!864725)))

(assert (=> d!161375 (= res!1063144 (and ((_ is Cons!36212) lt!669545) (= (_1!12382 (h!37657 lt!669545)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161375 (= (containsKey!754 lt!669545 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864725)))

(declare-fun b!1553211 () Bool)

(declare-fun e!864726 () Bool)

(assert (=> b!1553211 (= e!864725 e!864726)))

(declare-fun res!1063145 () Bool)

(assert (=> b!1553211 (=> (not res!1063145) (not e!864726))))

(assert (=> b!1553211 (= res!1063145 (and (or (not ((_ is Cons!36212) lt!669545)) (bvsle (_1!12382 (h!37657 lt!669545)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) ((_ is Cons!36212) lt!669545) (bvslt (_1!12382 (h!37657 lt!669545)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553212 () Bool)

(assert (=> b!1553212 (= e!864726 (containsKey!754 (t!50934 lt!669545) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161375 (not res!1063144)) b!1553211))

(assert (= (and b!1553211 res!1063145) b!1553212))

(declare-fun m!1431833 () Bool)

(assert (=> b!1553212 m!1431833))

(assert (=> b!1553008 d!161375))

(declare-fun b!1553216 () Bool)

(declare-fun e!864728 () Option!808)

(assert (=> b!1553216 (= e!864728 None!806)))

(declare-fun b!1553214 () Bool)

(declare-fun e!864727 () Option!808)

(assert (=> b!1553214 (= e!864727 e!864728)))

(declare-fun c!143197 () Bool)

(assert (=> b!1553214 (= c!143197 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!161377 () Bool)

(declare-fun c!143196 () Bool)

(assert (=> d!161377 (= c!143196 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161377 (= (getValueByKey!732 (t!50934 (toList!11191 lt!669336)) #b1000000000000000000000000000000000000000000000000000000000000000) e!864727)))

(declare-fun b!1553213 () Bool)

(assert (=> b!1553213 (= e!864727 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 lt!669336))))))))

(declare-fun b!1553215 () Bool)

(assert (=> b!1553215 (= e!864728 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 lt!669336))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161377 c!143196) b!1553213))

(assert (= (and d!161377 (not c!143196)) b!1553214))

(assert (= (and b!1553214 c!143197) b!1553215))

(assert (= (and b!1553214 (not c!143197)) b!1553216))

(declare-fun m!1431835 () Bool)

(assert (=> b!1553215 m!1431835))

(assert (=> b!1552901 d!161377))

(declare-fun d!161379 () Bool)

(assert (=> d!161379 (= (get!26039 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762))) (v!21990 (getValueByKey!732 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161189 d!161379))

(assert (=> d!161189 d!161271))

(declare-fun d!161381 () Bool)

(declare-fun res!1063146 () Bool)

(declare-fun e!864729 () Bool)

(assert (=> d!161381 (=> res!1063146 e!864729)))

(assert (=> d!161381 (= res!1063146 (and ((_ is Cons!36212) (toList!11191 lt!669428)) (= (_1!12382 (h!37657 (toList!11191 lt!669428))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161381 (= (containsKey!754 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762)) e!864729)))

(declare-fun b!1553217 () Bool)

(declare-fun e!864730 () Bool)

(assert (=> b!1553217 (= e!864729 e!864730)))

(declare-fun res!1063147 () Bool)

(assert (=> b!1553217 (=> (not res!1063147) (not e!864730))))

(assert (=> b!1553217 (= res!1063147 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669428))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669428))) (select (arr!50010 _keys!618) from!762))) ((_ is Cons!36212) (toList!11191 lt!669428)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669428))) (select (arr!50010 _keys!618) from!762))))))

(declare-fun b!1553218 () Bool)

(assert (=> b!1553218 (= e!864730 (containsKey!754 (t!50934 (toList!11191 lt!669428)) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161381 (not res!1063146)) b!1553217))

(assert (= (and b!1553217 res!1063147) b!1553218))

(assert (=> b!1553218 m!1431023))

(declare-fun m!1431837 () Bool)

(assert (=> b!1553218 m!1431837))

(assert (=> d!161187 d!161381))

(declare-fun d!161383 () Bool)

(declare-fun res!1063148 () Bool)

(declare-fun e!864731 () Bool)

(assert (=> d!161383 (=> res!1063148 e!864731)))

(assert (=> d!161383 (= res!1063148 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161383 (= (containsKey!754 (t!50934 (toList!11191 lt!669336)) #b0000000000000000000000000000000000000000000000000000000000000000) e!864731)))

(declare-fun b!1553219 () Bool)

(declare-fun e!864732 () Bool)

(assert (=> b!1553219 (= e!864731 e!864732)))

(declare-fun res!1063149 () Bool)

(assert (=> b!1553219 (=> (not res!1063149) (not e!864732))))

(assert (=> b!1553219 (= res!1063149 (and (or (not ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336)))) (bvsle (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (bvslt (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553220 () Bool)

(assert (=> b!1553220 (= e!864732 (containsKey!754 (t!50934 (t!50934 (toList!11191 lt!669336))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161383 (not res!1063148)) b!1553219))

(assert (= (and b!1553219 res!1063149) b!1553220))

(declare-fun m!1431839 () Bool)

(assert (=> b!1553220 m!1431839))

(assert (=> b!1552970 d!161383))

(declare-fun b!1553221 () Bool)

(declare-fun e!864734 () Bool)

(declare-fun e!864733 () Bool)

(assert (=> b!1553221 (= e!864734 e!864733)))

(declare-fun lt!669591 () (_ BitVec 64))

(assert (=> b!1553221 (= lt!669591 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!669592 () Unit!51710)

(assert (=> b!1553221 (= lt!669592 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669591 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1553221 (arrayContainsKey!0 _keys!618 lt!669591 #b00000000000000000000000000000000)))

(declare-fun lt!669593 () Unit!51710)

(assert (=> b!1553221 (= lt!669593 lt!669592)))

(declare-fun res!1063151 () Bool)

(assert (=> b!1553221 (= res!1063151 (= (seekEntryOrOpen!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!618 mask!926) (Found!13516 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1553221 (=> (not res!1063151) (not e!864733))))

(declare-fun b!1553222 () Bool)

(declare-fun call!71369 () Bool)

(assert (=> b!1553222 (= e!864733 call!71369)))

(declare-fun bm!71366 () Bool)

(assert (=> bm!71366 (= call!71369 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1553223 () Bool)

(declare-fun e!864735 () Bool)

(assert (=> b!1553223 (= e!864735 e!864734)))

(declare-fun c!143198 () Bool)

(assert (=> b!1553223 (= c!143198 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1553224 () Bool)

(assert (=> b!1553224 (= e!864734 call!71369)))

(declare-fun d!161385 () Bool)

(declare-fun res!1063150 () Bool)

(assert (=> d!161385 (=> res!1063150 e!864735)))

(assert (=> d!161385 (= res!1063150 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(assert (=> d!161385 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!618 mask!926) e!864735)))

(assert (= (and d!161385 (not res!1063150)) b!1553223))

(assert (= (and b!1553223 c!143198) b!1553221))

(assert (= (and b!1553223 (not c!143198)) b!1553224))

(assert (= (and b!1553221 res!1063151) b!1553222))

(assert (= (or b!1553222 b!1553224) bm!71366))

(declare-fun m!1431841 () Bool)

(assert (=> b!1553221 m!1431841))

(declare-fun m!1431843 () Bool)

(assert (=> b!1553221 m!1431843))

(declare-fun m!1431845 () Bool)

(assert (=> b!1553221 m!1431845))

(assert (=> b!1553221 m!1431841))

(declare-fun m!1431847 () Bool)

(assert (=> b!1553221 m!1431847))

(declare-fun m!1431849 () Bool)

(assert (=> bm!71366 m!1431849))

(assert (=> b!1553223 m!1431841))

(assert (=> b!1553223 m!1431841))

(declare-fun m!1431851 () Bool)

(assert (=> b!1553223 m!1431851))

(assert (=> bm!71343 d!161385))

(declare-fun d!161387 () Bool)

(declare-fun lt!669594 () Bool)

(assert (=> d!161387 (= lt!669594 (select (content!794 (t!50934 (toList!11191 lt!669406))) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun e!864737 () Bool)

(assert (=> d!161387 (= lt!669594 e!864737)))

(declare-fun res!1063153 () Bool)

(assert (=> d!161387 (=> (not res!1063153) (not e!864737))))

(assert (=> d!161387 (= res!1063153 ((_ is Cons!36212) (t!50934 (toList!11191 lt!669406))))))

(assert (=> d!161387 (= (contains!10134 (t!50934 (toList!11191 lt!669406)) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!669594)))

(declare-fun b!1553225 () Bool)

(declare-fun e!864736 () Bool)

(assert (=> b!1553225 (= e!864737 e!864736)))

(declare-fun res!1063152 () Bool)

(assert (=> b!1553225 (=> res!1063152 e!864736)))

(assert (=> b!1553225 (= res!1063152 (= (h!37657 (t!50934 (toList!11191 lt!669406))) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun b!1553226 () Bool)

(assert (=> b!1553226 (= e!864736 (contains!10134 (t!50934 (t!50934 (toList!11191 lt!669406))) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161387 res!1063153) b!1553225))

(assert (= (and b!1553225 (not res!1063152)) b!1553226))

(assert (=> d!161387 m!1431641))

(declare-fun m!1431853 () Bool)

(assert (=> d!161387 m!1431853))

(declare-fun m!1431855 () Bool)

(assert (=> b!1553226 m!1431855))

(assert (=> b!1552948 d!161387))

(declare-fun d!161389 () Bool)

(assert (=> d!161389 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!669595 () Unit!51710)

(assert (=> d!161389 (= lt!669595 (choose!2037 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864738 () Bool)

(assert (=> d!161389 e!864738))

(declare-fun res!1063154 () Bool)

(assert (=> d!161389 (=> (not res!1063154) (not e!864738))))

(assert (=> d!161389 (= res!1063154 (isStrictlySorted!887 (toList!11191 lt!669428)))))

(assert (=> d!161389 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000) lt!669595)))

(declare-fun b!1553227 () Bool)

(assert (=> b!1553227 (= e!864738 (containsKey!754 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161389 res!1063154) b!1553227))

(assert (=> d!161389 m!1431601))

(assert (=> d!161389 m!1431601))

(assert (=> d!161389 m!1431603))

(declare-fun m!1431857 () Bool)

(assert (=> d!161389 m!1431857))

(assert (=> d!161389 m!1431769))

(assert (=> b!1553227 m!1431597))

(assert (=> b!1553036 d!161389))

(declare-fun d!161391 () Bool)

(assert (=> d!161391 (= (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!44632 () Bool)

(assert (= bs!44632 d!161391))

(assert (=> bs!44632 m!1431601))

(declare-fun m!1431859 () Bool)

(assert (=> bs!44632 m!1431859))

(assert (=> b!1553036 d!161391))

(declare-fun b!1553231 () Bool)

(declare-fun e!864740 () Option!808)

(assert (=> b!1553231 (= e!864740 None!806)))

(declare-fun b!1553229 () Bool)

(declare-fun e!864739 () Option!808)

(assert (=> b!1553229 (= e!864739 e!864740)))

(declare-fun c!143200 () Bool)

(assert (=> b!1553229 (= c!143200 (and ((_ is Cons!36212) (toList!11191 lt!669428)) (not (= (_1!12382 (h!37657 (toList!11191 lt!669428))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!161393 () Bool)

(declare-fun c!143199 () Bool)

(assert (=> d!161393 (= c!143199 (and ((_ is Cons!36212) (toList!11191 lt!669428)) (= (_1!12382 (h!37657 (toList!11191 lt!669428))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161393 (= (getValueByKey!732 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000) e!864739)))

(declare-fun b!1553228 () Bool)

(assert (=> b!1553228 (= e!864739 (Some!807 (_2!12382 (h!37657 (toList!11191 lt!669428)))))))

(declare-fun b!1553230 () Bool)

(assert (=> b!1553230 (= e!864740 (getValueByKey!732 (t!50934 (toList!11191 lt!669428)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161393 c!143199) b!1553228))

(assert (= (and d!161393 (not c!143199)) b!1553229))

(assert (= (and b!1553229 c!143200) b!1553230))

(assert (= (and b!1553229 (not c!143200)) b!1553231))

(declare-fun m!1431861 () Bool)

(assert (=> b!1553230 m!1431861))

(assert (=> b!1553036 d!161393))

(declare-fun d!161395 () Bool)

(declare-fun c!143201 () Bool)

(assert (=> d!161395 (= c!143201 ((_ is Nil!36213) (toList!11191 lt!669435)))))

(declare-fun e!864741 () (InoxSet tuple2!24742))

(assert (=> d!161395 (= (content!794 (toList!11191 lt!669435)) e!864741)))

(declare-fun b!1553232 () Bool)

(assert (=> b!1553232 (= e!864741 ((as const (Array tuple2!24742 Bool)) false))))

(declare-fun b!1553233 () Bool)

(assert (=> b!1553233 (= e!864741 ((_ map or) (store ((as const (Array tuple2!24742 Bool)) false) (h!37657 (toList!11191 lt!669435)) true) (content!794 (t!50934 (toList!11191 lt!669435)))))))

(assert (= (and d!161395 c!143201) b!1553232))

(assert (= (and d!161395 (not c!143201)) b!1553233))

(declare-fun m!1431863 () Bool)

(assert (=> b!1553233 m!1431863))

(declare-fun m!1431865 () Bool)

(assert (=> b!1553233 m!1431865))

(assert (=> d!161147 d!161395))

(assert (=> b!1552884 d!161195))

(declare-fun d!161397 () Bool)

(declare-fun res!1063155 () Bool)

(declare-fun e!864742 () Bool)

(assert (=> d!161397 (=> res!1063155 e!864742)))

(assert (=> d!161397 (= res!1063155 (and ((_ is Cons!36212) lt!669446) (= (_1!12382 (h!37657 lt!669446)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161397 (= (containsKey!754 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864742)))

(declare-fun b!1553234 () Bool)

(declare-fun e!864743 () Bool)

(assert (=> b!1553234 (= e!864742 e!864743)))

(declare-fun res!1063156 () Bool)

(assert (=> b!1553234 (=> (not res!1063156) (not e!864743))))

(assert (=> b!1553234 (= res!1063156 (and (or (not ((_ is Cons!36212) lt!669446)) (bvsle (_1!12382 (h!37657 lt!669446)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36212) lt!669446) (bvslt (_1!12382 (h!37657 lt!669446)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553235 () Bool)

(assert (=> b!1553235 (= e!864743 (containsKey!754 (t!50934 lt!669446) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161397 (not res!1063155)) b!1553234))

(assert (= (and b!1553234 res!1063156) b!1553235))

(declare-fun m!1431867 () Bool)

(assert (=> b!1553235 m!1431867))

(assert (=> b!1552837 d!161397))

(declare-fun lt!669596 () Bool)

(declare-fun d!161399 () Bool)

(assert (=> d!161399 (= lt!669596 (select (content!794 (t!50934 (toList!11191 lt!669435))) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun e!864745 () Bool)

(assert (=> d!161399 (= lt!669596 e!864745)))

(declare-fun res!1063158 () Bool)

(assert (=> d!161399 (=> (not res!1063158) (not e!864745))))

(assert (=> d!161399 (= res!1063158 ((_ is Cons!36212) (t!50934 (toList!11191 lt!669435))))))

(assert (=> d!161399 (= (contains!10134 (t!50934 (toList!11191 lt!669435)) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669596)))

(declare-fun b!1553236 () Bool)

(declare-fun e!864744 () Bool)

(assert (=> b!1553236 (= e!864745 e!864744)))

(declare-fun res!1063157 () Bool)

(assert (=> b!1553236 (=> res!1063157 e!864744)))

(assert (=> b!1553236 (= res!1063157 (= (h!37657 (t!50934 (toList!11191 lt!669435))) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1553237 () Bool)

(assert (=> b!1553237 (= e!864744 (contains!10134 (t!50934 (t!50934 (toList!11191 lt!669435))) (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161399 res!1063158) b!1553236))

(assert (= (and b!1553236 (not res!1063157)) b!1553237))

(assert (=> d!161399 m!1431865))

(declare-fun m!1431869 () Bool)

(assert (=> d!161399 m!1431869))

(declare-fun m!1431871 () Bool)

(assert (=> b!1553237 m!1431871))

(assert (=> b!1552894 d!161399))

(assert (=> b!1552828 d!161245))

(assert (=> b!1552828 d!161149))

(declare-fun d!161401 () Bool)

(assert (=> d!161401 (= (isEmpty!1133 (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!807) (getValueByKey!732 (toList!11191 lt!669336) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!161143 d!161401))

(assert (=> d!161109 d!161105))

(assert (=> d!161109 d!161107))

(declare-fun d!161403 () Bool)

(assert (=> d!161403 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161403 true))

(declare-fun _$12!485 () Unit!51710)

(assert (=> d!161403 (= (choose!2037 (toList!11191 lt!669336) (select (arr!50010 _keys!618) from!762)) _$12!485)))

(declare-fun bs!44633 () Bool)

(assert (= bs!44633 d!161403))

(assert (=> bs!44633 m!1431023))

(assert (=> bs!44633 m!1431211))

(assert (=> bs!44633 m!1431211))

(assert (=> bs!44633 m!1431213))

(assert (=> d!161109 d!161403))

(assert (=> d!161109 d!161319))

(declare-fun d!161405 () Bool)

(declare-fun lt!669597 () Bool)

(assert (=> d!161405 (= lt!669597 (select (content!794 lt!669405) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!864747 () Bool)

(assert (=> d!161405 (= lt!669597 e!864747)))

(declare-fun res!1063160 () Bool)

(assert (=> d!161405 (=> (not res!1063160) (not e!864747))))

(assert (=> d!161405 (= res!1063160 ((_ is Cons!36212) lt!669405))))

(assert (=> d!161405 (= (contains!10134 lt!669405 (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) lt!669597)))

(declare-fun b!1553238 () Bool)

(declare-fun e!864746 () Bool)

(assert (=> b!1553238 (= e!864747 e!864746)))

(declare-fun res!1063159 () Bool)

(assert (=> b!1553238 (=> res!1063159 e!864746)))

(assert (=> b!1553238 (= res!1063159 (= (h!37657 lt!669405) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553239 () Bool)

(assert (=> b!1553239 (= e!864746 (contains!10134 (t!50934 lt!669405) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!161405 res!1063160) b!1553238))

(assert (= (and b!1553238 (not res!1063159)) b!1553239))

(declare-fun m!1431873 () Bool)

(assert (=> d!161405 m!1431873))

(declare-fun m!1431875 () Bool)

(assert (=> d!161405 m!1431875))

(declare-fun m!1431877 () Bool)

(assert (=> b!1553239 m!1431877))

(assert (=> b!1553000 d!161405))

(declare-fun d!161407 () Bool)

(assert (=> d!161407 (= (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422)) (not (isEmpty!1133 (getValueByKey!732 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422))))))

(declare-fun bs!44634 () Bool)

(assert (= bs!44634 d!161407))

(assert (=> bs!44634 m!1431459))

(declare-fun m!1431879 () Bool)

(assert (=> bs!44634 m!1431879))

(assert (=> b!1552955 d!161407))

(declare-fun b!1553243 () Bool)

(declare-fun e!864749 () Option!808)

(assert (=> b!1553243 (= e!864749 None!806)))

(declare-fun b!1553241 () Bool)

(declare-fun e!864748 () Option!808)

(assert (=> b!1553241 (= e!864748 e!864749)))

(declare-fun c!143203 () Bool)

(assert (=> b!1553241 (= c!143203 (and ((_ is Cons!36212) (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)))) (not (= (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))))) lt!669422))))))

(declare-fun d!161409 () Bool)

(declare-fun c!143202 () Bool)

(assert (=> d!161409 (= c!143202 (and ((_ is Cons!36212) (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)))) (= (_1!12382 (h!37657 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))))) lt!669422)))))

(assert (=> d!161409 (= (getValueByKey!732 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422) e!864748)))

(declare-fun b!1553240 () Bool)

(assert (=> b!1553240 (= e!864748 (Some!807 (_2!12382 (h!37657 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)))))))))

(declare-fun b!1553242 () Bool)

(assert (=> b!1553242 (= e!864749 (getValueByKey!732 (t!50934 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)))) lt!669422))))

(assert (= (and d!161409 c!143202) b!1553240))

(assert (= (and d!161409 (not c!143202)) b!1553241))

(assert (= (and b!1553241 c!143203) b!1553242))

(assert (= (and b!1553241 (not c!143203)) b!1553243))

(declare-fun m!1431881 () Bool)

(assert (=> b!1553242 m!1431881))

(assert (=> b!1552955 d!161409))

(declare-fun d!161411 () Bool)

(declare-fun lt!669598 () Bool)

(assert (=> d!161411 (= lt!669598 (select (content!794 lt!669398) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864751 () Bool)

(assert (=> d!161411 (= lt!669598 e!864751)))

(declare-fun res!1063162 () Bool)

(assert (=> d!161411 (=> (not res!1063162) (not e!864751))))

(assert (=> d!161411 (= res!1063162 ((_ is Cons!36212) lt!669398))))

(assert (=> d!161411 (= (contains!10134 lt!669398 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669598)))

(declare-fun b!1553244 () Bool)

(declare-fun e!864750 () Bool)

(assert (=> b!1553244 (= e!864751 e!864750)))

(declare-fun res!1063161 () Bool)

(assert (=> b!1553244 (=> res!1063161 e!864750)))

(assert (=> b!1553244 (= res!1063161 (= (h!37657 lt!669398) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553245 () Bool)

(assert (=> b!1553245 (= e!864750 (contains!10134 (t!50934 lt!669398) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161411 res!1063162) b!1553244))

(assert (= (and b!1553244 (not res!1063161)) b!1553245))

(declare-fun m!1431883 () Bool)

(assert (=> d!161411 m!1431883))

(declare-fun m!1431885 () Bool)

(assert (=> d!161411 m!1431885))

(declare-fun m!1431887 () Bool)

(assert (=> b!1553245 m!1431887))

(assert (=> b!1552936 d!161411))

(declare-fun d!161413 () Bool)

(declare-fun res!1063163 () Bool)

(declare-fun e!864752 () Bool)

(assert (=> d!161413 (=> res!1063163 e!864752)))

(assert (=> d!161413 (= res!1063163 (and ((_ is Cons!36212) (toList!11191 lt!669435)) (= (_1!12382 (h!37657 (toList!11191 lt!669435))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161413 (= (containsKey!754 (toList!11191 lt!669435) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864752)))

(declare-fun b!1553246 () Bool)

(declare-fun e!864753 () Bool)

(assert (=> b!1553246 (= e!864752 e!864753)))

(declare-fun res!1063164 () Bool)

(assert (=> b!1553246 (=> (not res!1063164) (not e!864753))))

(assert (=> b!1553246 (= res!1063164 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669435))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669435))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) ((_ is Cons!36212) (toList!11191 lt!669435)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669435))) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553247 () Bool)

(assert (=> b!1553247 (= e!864753 (containsKey!754 (t!50934 (toList!11191 lt!669435)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161413 (not res!1063163)) b!1553246))

(assert (= (and b!1553246 res!1063164) b!1553247))

(declare-fun m!1431889 () Bool)

(assert (=> b!1553247 m!1431889))

(assert (=> d!161197 d!161413))

(declare-fun d!161415 () Bool)

(assert (=> d!161415 (= (isEmpty!1132 lt!669475) (isEmpty!1134 (toList!11191 lt!669475)))))

(declare-fun bs!44635 () Bool)

(assert (= bs!44635 d!161415))

(declare-fun m!1431891 () Bool)

(assert (=> bs!44635 m!1431891))

(assert (=> b!1552805 d!161415))

(declare-fun d!161417 () Bool)

(assert (=> d!161417 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!669599 () Unit!51710)

(assert (=> d!161417 (= lt!669599 (choose!2037 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864754 () Bool)

(assert (=> d!161417 e!864754))

(declare-fun res!1063165 () Bool)

(assert (=> d!161417 (=> (not res!1063165) (not e!864754))))

(assert (=> d!161417 (= res!1063165 (isStrictlySorted!887 (toList!11191 lt!669428)))))

(assert (=> d!161417 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000) lt!669599)))

(declare-fun b!1553248 () Bool)

(assert (=> b!1553248 (= e!864754 (containsKey!754 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161417 res!1063165) b!1553248))

(assert (=> d!161417 m!1431571))

(assert (=> d!161417 m!1431571))

(assert (=> d!161417 m!1431573))

(declare-fun m!1431893 () Bool)

(assert (=> d!161417 m!1431893))

(assert (=> d!161417 m!1431769))

(assert (=> b!1553248 m!1431567))

(assert (=> b!1553011 d!161417))

(assert (=> b!1553011 d!161255))

(assert (=> b!1553011 d!161257))

(assert (=> d!161117 d!161119))

(assert (=> d!161117 d!161121))

(declare-fun d!161419 () Bool)

(assert (=> d!161419 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)))))

(assert (=> d!161419 true))

(declare-fun _$12!486 () Unit!51710)

(assert (=> d!161419 (= (choose!2037 (toList!11191 lt!669332) (select (arr!50010 _keys!618) from!762)) _$12!486)))

(declare-fun bs!44636 () Bool)

(assert (= bs!44636 d!161419))

(assert (=> bs!44636 m!1431023))

(assert (=> bs!44636 m!1431145))

(assert (=> bs!44636 m!1431145))

(assert (=> bs!44636 m!1431147))

(assert (=> d!161117 d!161419))

(declare-fun d!161421 () Bool)

(declare-fun res!1063166 () Bool)

(declare-fun e!864755 () Bool)

(assert (=> d!161421 (=> res!1063166 e!864755)))

(assert (=> d!161421 (= res!1063166 (or ((_ is Nil!36213) (toList!11191 lt!669332)) ((_ is Nil!36213) (t!50934 (toList!11191 lt!669332)))))))

(assert (=> d!161421 (= (isStrictlySorted!887 (toList!11191 lt!669332)) e!864755)))

(declare-fun b!1553249 () Bool)

(declare-fun e!864756 () Bool)

(assert (=> b!1553249 (= e!864755 e!864756)))

(declare-fun res!1063167 () Bool)

(assert (=> b!1553249 (=> (not res!1063167) (not e!864756))))

(assert (=> b!1553249 (= res!1063167 (bvslt (_1!12382 (h!37657 (toList!11191 lt!669332))) (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669332))))))))

(declare-fun b!1553250 () Bool)

(assert (=> b!1553250 (= e!864756 (isStrictlySorted!887 (t!50934 (toList!11191 lt!669332))))))

(assert (= (and d!161421 (not res!1063166)) b!1553249))

(assert (= (and b!1553249 res!1063167) b!1553250))

(declare-fun m!1431895 () Bool)

(assert (=> b!1553250 m!1431895))

(assert (=> d!161117 d!161421))

(declare-fun d!161423 () Bool)

(declare-fun e!864758 () Bool)

(assert (=> d!161423 e!864758))

(declare-fun res!1063168 () Bool)

(assert (=> d!161423 (=> res!1063168 e!864758)))

(declare-fun lt!669601 () Bool)

(assert (=> d!161423 (= res!1063168 (not lt!669601))))

(declare-fun lt!669602 () Bool)

(assert (=> d!161423 (= lt!669601 lt!669602)))

(declare-fun lt!669600 () Unit!51710)

(declare-fun e!864757 () Unit!51710)

(assert (=> d!161423 (= lt!669600 e!864757)))

(declare-fun c!143204 () Bool)

(assert (=> d!161423 (= c!143204 lt!669602)))

(assert (=> d!161423 (= lt!669602 (containsKey!754 (toList!11191 lt!669475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!161423 (= (contains!10131 lt!669475 #b1000000000000000000000000000000000000000000000000000000000000000) lt!669601)))

(declare-fun b!1553251 () Bool)

(declare-fun lt!669603 () Unit!51710)

(assert (=> b!1553251 (= e!864757 lt!669603)))

(assert (=> b!1553251 (= lt!669603 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1553251 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1553252 () Bool)

(declare-fun Unit!51730 () Unit!51710)

(assert (=> b!1553252 (= e!864757 Unit!51730)))

(declare-fun b!1553253 () Bool)

(assert (=> b!1553253 (= e!864758 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161423 c!143204) b!1553251))

(assert (= (and d!161423 (not c!143204)) b!1553252))

(assert (= (and d!161423 (not res!1063168)) b!1553253))

(declare-fun m!1431897 () Bool)

(assert (=> d!161423 m!1431897))

(declare-fun m!1431899 () Bool)

(assert (=> b!1553251 m!1431899))

(declare-fun m!1431901 () Bool)

(assert (=> b!1553251 m!1431901))

(assert (=> b!1553251 m!1431901))

(declare-fun m!1431903 () Bool)

(assert (=> b!1553251 m!1431903))

(assert (=> b!1553253 m!1431901))

(assert (=> b!1553253 m!1431901))

(assert (=> b!1553253 m!1431903))

(assert (=> b!1552809 d!161423))

(declare-fun d!161425 () Bool)

(declare-fun res!1063169 () Bool)

(declare-fun e!864759 () Bool)

(assert (=> d!161425 (=> res!1063169 e!864759)))

(assert (=> d!161425 (= res!1063169 (and ((_ is Cons!36212) lt!669538) (= (_1!12382 (h!37657 lt!669538)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161425 (= (containsKey!754 lt!669538 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864759)))

(declare-fun b!1553254 () Bool)

(declare-fun e!864760 () Bool)

(assert (=> b!1553254 (= e!864759 e!864760)))

(declare-fun res!1063170 () Bool)

(assert (=> b!1553254 (=> (not res!1063170) (not e!864760))))

(assert (=> b!1553254 (= res!1063170 (and (or (not ((_ is Cons!36212) lt!669538)) (bvsle (_1!12382 (h!37657 lt!669538)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) ((_ is Cons!36212) lt!669538) (bvslt (_1!12382 (h!37657 lt!669538)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553255 () Bool)

(assert (=> b!1553255 (= e!864760 (containsKey!754 (t!50934 lt!669538) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161425 (not res!1063169)) b!1553254))

(assert (= (and b!1553254 res!1063170) b!1553255))

(declare-fun m!1431905 () Bool)

(assert (=> b!1553255 m!1431905))

(assert (=> b!1552987 d!161425))

(declare-fun d!161427 () Bool)

(declare-fun res!1063171 () Bool)

(declare-fun e!864761 () Bool)

(assert (=> d!161427 (=> res!1063171 e!864761)))

(assert (=> d!161427 (= res!1063171 (and ((_ is Cons!36212) (toList!11191 lt!669428)) (= (_1!12382 (h!37657 (toList!11191 lt!669428))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161427 (= (containsKey!754 (toList!11191 lt!669428) #b1000000000000000000000000000000000000000000000000000000000000000) e!864761)))

(declare-fun b!1553256 () Bool)

(declare-fun e!864762 () Bool)

(assert (=> b!1553256 (= e!864761 e!864762)))

(declare-fun res!1063172 () Bool)

(assert (=> b!1553256 (=> (not res!1063172) (not e!864762))))

(assert (=> b!1553256 (= res!1063172 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669428))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669428))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36212) (toList!11191 lt!669428)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669428))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553257 () Bool)

(assert (=> b!1553257 (= e!864762 (containsKey!754 (t!50934 (toList!11191 lt!669428)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161427 (not res!1063171)) b!1553256))

(assert (= (and b!1553256 res!1063172) b!1553257))

(declare-fun m!1431907 () Bool)

(assert (=> b!1553257 m!1431907))

(assert (=> d!161237 d!161427))

(declare-fun d!161429 () Bool)

(declare-fun lt!669604 () Bool)

(assert (=> d!161429 (= lt!669604 (select (content!794 lt!669509) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864764 () Bool)

(assert (=> d!161429 (= lt!669604 e!864764)))

(declare-fun res!1063174 () Bool)

(assert (=> d!161429 (=> (not res!1063174) (not e!864764))))

(assert (=> d!161429 (= res!1063174 ((_ is Cons!36212) lt!669509))))

(assert (=> d!161429 (= (contains!10134 lt!669509 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669604)))

(declare-fun b!1553258 () Bool)

(declare-fun e!864763 () Bool)

(assert (=> b!1553258 (= e!864764 e!864763)))

(declare-fun res!1063173 () Bool)

(assert (=> b!1553258 (=> res!1063173 e!864763)))

(assert (=> b!1553258 (= res!1063173 (= (h!37657 lt!669509) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553259 () Bool)

(assert (=> b!1553259 (= e!864763 (contains!10134 (t!50934 lt!669509) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161429 res!1063174) b!1553258))

(assert (= (and b!1553258 (not res!1063173)) b!1553259))

(declare-fun m!1431909 () Bool)

(assert (=> d!161429 m!1431909))

(declare-fun m!1431911 () Bool)

(assert (=> d!161429 m!1431911))

(declare-fun m!1431913 () Bool)

(assert (=> b!1553259 m!1431913))

(assert (=> b!1552939 d!161429))

(declare-fun d!161431 () Bool)

(declare-fun res!1063175 () Bool)

(declare-fun e!864765 () Bool)

(assert (=> d!161431 (=> res!1063175 e!864765)))

(assert (=> d!161431 (= res!1063175 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669332))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669332)))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161431 (= (containsKey!754 (t!50934 (toList!11191 lt!669332)) (select (arr!50010 _keys!618) from!762)) e!864765)))

(declare-fun b!1553260 () Bool)

(declare-fun e!864766 () Bool)

(assert (=> b!1553260 (= e!864765 e!864766)))

(declare-fun res!1063176 () Bool)

(assert (=> b!1553260 (=> (not res!1063176) (not e!864766))))

(assert (=> b!1553260 (= res!1063176 (and (or (not ((_ is Cons!36212) (t!50934 (toList!11191 lt!669332)))) (bvsle (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669332)))) (select (arr!50010 _keys!618) from!762))) ((_ is Cons!36212) (t!50934 (toList!11191 lt!669332))) (bvslt (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669332)))) (select (arr!50010 _keys!618) from!762))))))

(declare-fun b!1553261 () Bool)

(assert (=> b!1553261 (= e!864766 (containsKey!754 (t!50934 (t!50934 (toList!11191 lt!669332))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161431 (not res!1063175)) b!1553260))

(assert (= (and b!1553260 res!1063176) b!1553261))

(assert (=> b!1553261 m!1431023))

(declare-fun m!1431915 () Bool)

(assert (=> b!1553261 m!1431915))

(assert (=> b!1553031 d!161431))

(declare-fun d!161433 () Bool)

(assert (=> d!161433 (= (isEmpty!1134 (toList!11191 lt!669428)) ((_ is Nil!36213) (toList!11191 lt!669428)))))

(assert (=> d!161217 d!161433))

(declare-fun d!161435 () Bool)

(declare-fun lt!669605 () Bool)

(assert (=> d!161435 (= lt!669605 (select (content!794 lt!669545) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun e!864768 () Bool)

(assert (=> d!161435 (= lt!669605 e!864768)))

(declare-fun res!1063178 () Bool)

(assert (=> d!161435 (=> (not res!1063178) (not e!864768))))

(assert (=> d!161435 (= res!1063178 ((_ is Cons!36212) lt!669545))))

(assert (=> d!161435 (= (contains!10134 lt!669545 (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) lt!669605)))

(declare-fun b!1553262 () Bool)

(declare-fun e!864767 () Bool)

(assert (=> b!1553262 (= e!864768 e!864767)))

(declare-fun res!1063177 () Bool)

(assert (=> b!1553262 (=> res!1063177 e!864767)))

(assert (=> b!1553262 (= res!1063177 (= (h!37657 lt!669545) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553263 () Bool)

(assert (=> b!1553263 (= e!864767 (contains!10134 (t!50934 lt!669545) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (= (and d!161435 res!1063178) b!1553262))

(assert (= (and b!1553262 (not res!1063177)) b!1553263))

(declare-fun m!1431917 () Bool)

(assert (=> d!161435 m!1431917))

(declare-fun m!1431919 () Bool)

(assert (=> d!161435 m!1431919))

(declare-fun m!1431921 () Bool)

(assert (=> b!1553263 m!1431921))

(assert (=> b!1553003 d!161435))

(declare-fun d!161437 () Bool)

(declare-fun res!1063179 () Bool)

(declare-fun e!864769 () Bool)

(assert (=> d!161437 (=> res!1063179 e!864769)))

(assert (=> d!161437 (= res!1063179 (and ((_ is Cons!36212) lt!669486) (= (_1!12382 (h!37657 lt!669486)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161437 (= (containsKey!754 lt!669486 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864769)))

(declare-fun b!1553264 () Bool)

(declare-fun e!864770 () Bool)

(assert (=> b!1553264 (= e!864769 e!864770)))

(declare-fun res!1063180 () Bool)

(assert (=> b!1553264 (=> (not res!1063180) (not e!864770))))

(assert (=> b!1553264 (= res!1063180 (and (or (not ((_ is Cons!36212) lt!669486)) (bvsle (_1!12382 (h!37657 lt!669486)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36212) lt!669486) (bvslt (_1!12382 (h!37657 lt!669486)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553265 () Bool)

(assert (=> b!1553265 (= e!864770 (containsKey!754 (t!50934 lt!669486) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161437 (not res!1063179)) b!1553264))

(assert (= (and b!1553264 res!1063180) b!1553265))

(declare-fun m!1431923 () Bool)

(assert (=> b!1553265 m!1431923))

(assert (=> b!1552866 d!161437))

(assert (=> d!161183 d!161179))

(assert (=> d!161183 d!161181))

(declare-fun d!161439 () Bool)

(assert (=> d!161439 (not (contains!10131 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)) lt!669422))))

(assert (=> d!161439 true))

(declare-fun _$36!385 () Unit!51710)

(assert (=> d!161439 (= (choose!2039 lt!669423 lt!669425 lt!669427 lt!669422) _$36!385)))

(declare-fun bs!44637 () Bool)

(assert (= bs!44637 d!161439))

(assert (=> bs!44637 m!1431193))

(assert (=> bs!44637 m!1431193))

(assert (=> bs!44637 m!1431195))

(assert (=> d!161183 d!161439))

(declare-fun d!161441 () Bool)

(declare-fun e!864772 () Bool)

(assert (=> d!161441 e!864772))

(declare-fun res!1063181 () Bool)

(assert (=> d!161441 (=> res!1063181 e!864772)))

(declare-fun lt!669607 () Bool)

(assert (=> d!161441 (= res!1063181 (not lt!669607))))

(declare-fun lt!669608 () Bool)

(assert (=> d!161441 (= lt!669607 lt!669608)))

(declare-fun lt!669606 () Unit!51710)

(declare-fun e!864771 () Unit!51710)

(assert (=> d!161441 (= lt!669606 e!864771)))

(declare-fun c!143205 () Bool)

(assert (=> d!161441 (= c!143205 lt!669608)))

(assert (=> d!161441 (= lt!669608 (containsKey!754 (toList!11191 lt!669423) lt!669422))))

(assert (=> d!161441 (= (contains!10131 lt!669423 lt!669422) lt!669607)))

(declare-fun b!1553267 () Bool)

(declare-fun lt!669609 () Unit!51710)

(assert (=> b!1553267 (= e!864771 lt!669609)))

(assert (=> b!1553267 (= lt!669609 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669423) lt!669422))))

(assert (=> b!1553267 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669423) lt!669422))))

(declare-fun b!1553268 () Bool)

(declare-fun Unit!51731 () Unit!51710)

(assert (=> b!1553268 (= e!864771 Unit!51731)))

(declare-fun b!1553269 () Bool)

(assert (=> b!1553269 (= e!864772 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669423) lt!669422)))))

(assert (= (and d!161441 c!143205) b!1553267))

(assert (= (and d!161441 (not c!143205)) b!1553268))

(assert (= (and d!161441 (not res!1063181)) b!1553269))

(declare-fun m!1431925 () Bool)

(assert (=> d!161441 m!1431925))

(declare-fun m!1431927 () Bool)

(assert (=> b!1553267 m!1431927))

(declare-fun m!1431929 () Bool)

(assert (=> b!1553267 m!1431929))

(assert (=> b!1553267 m!1431929))

(declare-fun m!1431931 () Bool)

(assert (=> b!1553267 m!1431931))

(assert (=> b!1553269 m!1431929))

(assert (=> b!1553269 m!1431929))

(assert (=> b!1553269 m!1431931))

(assert (=> d!161183 d!161441))

(declare-fun d!161443 () Bool)

(declare-fun c!143206 () Bool)

(assert (=> d!161443 (= c!143206 ((_ is Nil!36213) (toList!11191 lt!669447)))))

(declare-fun e!864773 () (InoxSet tuple2!24742))

(assert (=> d!161443 (= (content!794 (toList!11191 lt!669447)) e!864773)))

(declare-fun b!1553270 () Bool)

(assert (=> b!1553270 (= e!864773 ((as const (Array tuple2!24742 Bool)) false))))

(declare-fun b!1553271 () Bool)

(assert (=> b!1553271 (= e!864773 ((_ map or) (store ((as const (Array tuple2!24742 Bool)) false) (h!37657 (toList!11191 lt!669447)) true) (content!794 (t!50934 (toList!11191 lt!669447)))))))

(assert (= (and d!161443 c!143206) b!1553270))

(assert (= (and d!161443 (not c!143206)) b!1553271))

(declare-fun m!1431933 () Bool)

(assert (=> b!1553271 m!1431933))

(declare-fun m!1431935 () Bool)

(assert (=> b!1553271 m!1431935))

(assert (=> d!161229 d!161443))

(assert (=> b!1552821 d!161231))

(declare-fun d!161445 () Bool)

(declare-fun res!1063183 () Bool)

(declare-fun e!864777 () Bool)

(assert (=> d!161445 (=> res!1063183 e!864777)))

(assert (=> d!161445 (= res!1063183 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(assert (=> d!161445 (= (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!143094 (Cons!36213 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214))) e!864777)))

(declare-fun b!1553272 () Bool)

(declare-fun e!864776 () Bool)

(assert (=> b!1553272 (= e!864777 e!864776)))

(declare-fun res!1063182 () Bool)

(assert (=> b!1553272 (=> (not res!1063182) (not e!864776))))

(declare-fun e!864775 () Bool)

(assert (=> b!1553272 (= res!1063182 (not e!864775))))

(declare-fun res!1063184 () Bool)

(assert (=> b!1553272 (=> (not res!1063184) (not e!864775))))

(assert (=> b!1553272 (= res!1063184 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1553273 () Bool)

(declare-fun e!864774 () Bool)

(assert (=> b!1553273 (= e!864776 e!864774)))

(declare-fun c!143207 () Bool)

(assert (=> b!1553273 (= c!143207 (validKeyInArray!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun call!71370 () Bool)

(declare-fun bm!71367 () Bool)

(assert (=> bm!71367 (= call!71370 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!143207 (Cons!36213 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!143094 (Cons!36213 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214))) (ite c!143094 (Cons!36213 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)))))))

(declare-fun b!1553274 () Bool)

(assert (=> b!1553274 (= e!864774 call!71370)))

(declare-fun b!1553275 () Bool)

(assert (=> b!1553275 (= e!864774 call!71370)))

(declare-fun b!1553276 () Bool)

(assert (=> b!1553276 (= e!864775 (contains!10133 (ite c!143094 (Cons!36213 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!161445 (not res!1063183)) b!1553272))

(assert (= (and b!1553272 res!1063184) b!1553276))

(assert (= (and b!1553272 res!1063182) b!1553273))

(assert (= (and b!1553273 c!143207) b!1553274))

(assert (= (and b!1553273 (not c!143207)) b!1553275))

(assert (= (or b!1553274 b!1553275) bm!71367))

(assert (=> b!1553272 m!1431841))

(assert (=> b!1553272 m!1431841))

(assert (=> b!1553272 m!1431851))

(assert (=> b!1553273 m!1431841))

(assert (=> b!1553273 m!1431841))

(assert (=> b!1553273 m!1431851))

(assert (=> bm!71367 m!1431841))

(declare-fun m!1431937 () Bool)

(assert (=> bm!71367 m!1431937))

(assert (=> b!1553276 m!1431841))

(assert (=> b!1553276 m!1431841))

(declare-fun m!1431939 () Bool)

(assert (=> b!1553276 m!1431939))

(assert (=> bm!71339 d!161445))

(assert (=> bm!71329 d!161307))

(declare-fun b!1553280 () Bool)

(declare-fun e!864779 () Option!808)

(assert (=> b!1553280 (= e!864779 None!806)))

(declare-fun b!1553278 () Bool)

(declare-fun e!864778 () Option!808)

(assert (=> b!1553278 (= e!864778 e!864779)))

(declare-fun c!143209 () Bool)

(assert (=> b!1553278 (= c!143209 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669399))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669399)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161447 () Bool)

(declare-fun c!143208 () Bool)

(assert (=> d!161447 (= c!143208 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669399))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669399)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161447 (= (getValueByKey!732 (t!50934 (toList!11191 lt!669399)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864778)))

(declare-fun b!1553277 () Bool)

(assert (=> b!1553277 (= e!864778 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 lt!669399))))))))

(declare-fun b!1553279 () Bool)

(assert (=> b!1553279 (= e!864779 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 lt!669399))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161447 c!143208) b!1553277))

(assert (= (and d!161447 (not c!143208)) b!1553278))

(assert (= (and b!1553278 c!143209) b!1553279))

(assert (= (and b!1553278 (not c!143209)) b!1553280))

(declare-fun m!1431941 () Bool)

(assert (=> b!1553279 m!1431941))

(assert (=> b!1552871 d!161447))

(declare-fun d!161449 () Bool)

(assert (=> d!161449 (= (content!795 Nil!36214) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!161221 d!161449))

(declare-fun d!161451 () Bool)

(declare-fun lt!669610 () Bool)

(assert (=> d!161451 (= lt!669610 (select (content!794 (t!50934 (toList!11191 lt!669399))) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!864781 () Bool)

(assert (=> d!161451 (= lt!669610 e!864781)))

(declare-fun res!1063186 () Bool)

(assert (=> d!161451 (=> (not res!1063186) (not e!864781))))

(assert (=> d!161451 (= res!1063186 ((_ is Cons!36212) (t!50934 (toList!11191 lt!669399))))))

(assert (=> d!161451 (= (contains!10134 (t!50934 (toList!11191 lt!669399)) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669610)))

(declare-fun b!1553281 () Bool)

(declare-fun e!864780 () Bool)

(assert (=> b!1553281 (= e!864781 e!864780)))

(declare-fun res!1063185 () Bool)

(assert (=> b!1553281 (=> res!1063185 e!864780)))

(assert (=> b!1553281 (= res!1063185 (= (h!37657 (t!50934 (toList!11191 lt!669399))) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1553282 () Bool)

(assert (=> b!1553282 (= e!864780 (contains!10134 (t!50934 (t!50934 (toList!11191 lt!669399))) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161451 res!1063186) b!1553281))

(assert (= (and b!1553281 (not res!1063185)) b!1553282))

(assert (=> d!161451 m!1431779))

(declare-fun m!1431943 () Bool)

(assert (=> d!161451 m!1431943))

(declare-fun m!1431945 () Bool)

(assert (=> b!1553282 m!1431945))

(assert (=> b!1552991 d!161451))

(assert (=> b!1552784 d!161269))

(assert (=> b!1552784 d!161271))

(declare-fun b!1553286 () Bool)

(declare-fun e!864783 () Option!808)

(assert (=> b!1553286 (= e!864783 None!806)))

(declare-fun b!1553284 () Bool)

(declare-fun e!864782 () Option!808)

(assert (=> b!1553284 (= e!864782 e!864783)))

(declare-fun c!143211 () Bool)

(assert (=> b!1553284 (= c!143211 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!161453 () Bool)

(declare-fun c!143210 () Bool)

(assert (=> d!161453 (= c!143210 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161453 (= (getValueByKey!732 (t!50934 (toList!11191 lt!669336)) #b0000000000000000000000000000000000000000000000000000000000000000) e!864782)))

(declare-fun b!1553283 () Bool)

(assert (=> b!1553283 (= e!864782 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 lt!669336))))))))

(declare-fun b!1553285 () Bool)

(assert (=> b!1553285 (= e!864783 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 lt!669336))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161453 c!143210) b!1553283))

(assert (= (and d!161453 (not c!143210)) b!1553284))

(assert (= (and b!1553284 c!143211) b!1553285))

(assert (= (and b!1553284 (not c!143211)) b!1553286))

(declare-fun m!1431947 () Bool)

(assert (=> b!1553285 m!1431947))

(assert (=> b!1552887 d!161453))

(declare-fun d!161455 () Bool)

(assert (=> d!161455 (= (get!26039 (getValueByKey!732 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762))) (v!21990 (getValueByKey!732 (toList!11191 lt!669428) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161233 d!161455))

(assert (=> d!161233 d!161335))

(assert (=> b!1552994 d!161305))

(assert (=> b!1552994 d!161235))

(assert (=> b!1552804 d!161139))

(declare-fun d!161457 () Bool)

(declare-fun res!1063187 () Bool)

(declare-fun e!864784 () Bool)

(assert (=> d!161457 (=> res!1063187 e!864784)))

(assert (=> d!161457 (= res!1063187 (and ((_ is Cons!36212) (toList!11191 lt!669428)) (= (_1!12382 (h!37657 (toList!11191 lt!669428))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161457 (= (containsKey!754 (toList!11191 lt!669428) #b0000000000000000000000000000000000000000000000000000000000000000) e!864784)))

(declare-fun b!1553287 () Bool)

(declare-fun e!864785 () Bool)

(assert (=> b!1553287 (= e!864784 e!864785)))

(declare-fun res!1063188 () Bool)

(assert (=> b!1553287 (=> (not res!1063188) (not e!864785))))

(assert (=> b!1553287 (= res!1063188 (and (or (not ((_ is Cons!36212) (toList!11191 lt!669428))) (bvsle (_1!12382 (h!37657 (toList!11191 lt!669428))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36212) (toList!11191 lt!669428)) (bvslt (_1!12382 (h!37657 (toList!11191 lt!669428))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553288 () Bool)

(assert (=> b!1553288 (= e!864785 (containsKey!754 (t!50934 (toList!11191 lt!669428)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161457 (not res!1063187)) b!1553287))

(assert (= (and b!1553287 res!1063188) b!1553288))

(declare-fun m!1431949 () Bool)

(assert (=> b!1553288 m!1431949))

(assert (=> d!161219 d!161457))

(declare-fun b!1553292 () Bool)

(declare-fun e!864787 () Option!808)

(assert (=> b!1553292 (= e!864787 None!806)))

(declare-fun b!1553290 () Bool)

(declare-fun e!864786 () Option!808)

(assert (=> b!1553290 (= e!864786 e!864787)))

(declare-fun c!143213 () Bool)

(assert (=> b!1553290 (= c!143213 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun c!143212 () Bool)

(declare-fun d!161459 () Bool)

(assert (=> d!161459 (= c!143212 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161459 (= (getValueByKey!732 (t!50934 (toList!11191 lt!669336)) (select (arr!50010 _keys!618) from!762)) e!864786)))

(declare-fun b!1553289 () Bool)

(assert (=> b!1553289 (= e!864786 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 lt!669336))))))))

(declare-fun b!1553291 () Bool)

(assert (=> b!1553291 (= e!864787 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 lt!669336))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161459 c!143212) b!1553289))

(assert (= (and d!161459 (not c!143212)) b!1553290))

(assert (= (and b!1553290 c!143213) b!1553291))

(assert (= (and b!1553290 (not c!143213)) b!1553292))

(assert (=> b!1553291 m!1431023))

(declare-fun m!1431951 () Bool)

(assert (=> b!1553291 m!1431951))

(assert (=> b!1552800 d!161459))

(declare-fun d!161461 () Bool)

(declare-fun res!1063189 () Bool)

(declare-fun e!864788 () Bool)

(assert (=> d!161461 (=> res!1063189 e!864788)))

(assert (=> d!161461 (= res!1063189 (= (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!669455))))

(assert (=> d!161461 (= (arrayContainsKey!0 _keys!618 lt!669455 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!864788)))

(declare-fun b!1553293 () Bool)

(declare-fun e!864789 () Bool)

(assert (=> b!1553293 (= e!864788 e!864789)))

(declare-fun res!1063190 () Bool)

(assert (=> b!1553293 (=> (not res!1063190) (not e!864789))))

(assert (=> b!1553293 (= res!1063190 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(declare-fun b!1553294 () Bool)

(assert (=> b!1553294 (= e!864789 (arrayContainsKey!0 _keys!618 lt!669455 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!161461 (not res!1063189)) b!1553293))

(assert (= (and b!1553293 res!1063190) b!1553294))

(assert (=> d!161461 m!1431365))

(declare-fun m!1431953 () Bool)

(assert (=> b!1553294 m!1431953))

(assert (=> b!1552909 d!161461))

(declare-fun d!161463 () Bool)

(declare-fun res!1063191 () Bool)

(declare-fun e!864790 () Bool)

(assert (=> d!161463 (=> res!1063191 e!864790)))

(assert (=> d!161463 (= res!1063191 (and ((_ is Cons!36212) lt!669405) (= (_1!12382 (h!37657 lt!669405)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161463 (= (containsKey!754 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864790)))

(declare-fun b!1553295 () Bool)

(declare-fun e!864791 () Bool)

(assert (=> b!1553295 (= e!864790 e!864791)))

(declare-fun res!1063192 () Bool)

(assert (=> b!1553295 (=> (not res!1063192) (not e!864791))))

(assert (=> b!1553295 (= res!1063192 (and (or (not ((_ is Cons!36212) lt!669405)) (bvsle (_1!12382 (h!37657 lt!669405)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) ((_ is Cons!36212) lt!669405) (bvslt (_1!12382 (h!37657 lt!669405)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553296 () Bool)

(assert (=> b!1553296 (= e!864791 (containsKey!754 (t!50934 lt!669405) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161463 (not res!1063191)) b!1553295))

(assert (= (and b!1553295 res!1063192) b!1553296))

(declare-fun m!1431955 () Bool)

(assert (=> b!1553296 m!1431955))

(assert (=> b!1552999 d!161463))

(declare-fun lt!669611 () Bool)

(declare-fun d!161465 () Bool)

(assert (=> d!161465 (= lt!669611 (select (content!794 lt!669434) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864793 () Bool)

(assert (=> d!161465 (= lt!669611 e!864793)))

(declare-fun res!1063194 () Bool)

(assert (=> d!161465 (=> (not res!1063194) (not e!864793))))

(assert (=> d!161465 (= res!1063194 ((_ is Cons!36212) lt!669434))))

(assert (=> d!161465 (= (contains!10134 lt!669434 (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) lt!669611)))

(declare-fun b!1553297 () Bool)

(declare-fun e!864792 () Bool)

(assert (=> b!1553297 (= e!864793 e!864792)))

(declare-fun res!1063193 () Bool)

(assert (=> b!1553297 (=> res!1063193 e!864792)))

(assert (=> b!1553297 (= res!1063193 (= (h!37657 lt!669434) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553298 () Bool)

(assert (=> b!1553298 (= e!864792 (contains!10134 (t!50934 lt!669434) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!161465 res!1063194) b!1553297))

(assert (= (and b!1553297 (not res!1063193)) b!1553298))

(declare-fun m!1431957 () Bool)

(assert (=> d!161465 m!1431957))

(declare-fun m!1431959 () Bool)

(assert (=> d!161465 m!1431959))

(declare-fun m!1431961 () Bool)

(assert (=> b!1553298 m!1431961))

(assert (=> b!1552979 d!161465))

(assert (=> b!1552930 d!161311))

(assert (=> b!1552930 d!161131))

(declare-fun d!161467 () Bool)

(assert (not d!161467))

(assert (=> b!1553019 d!161467))

(declare-fun b!1553302 () Bool)

(declare-fun e!864795 () Option!808)

(assert (=> b!1553302 (= e!864795 None!806)))

(declare-fun b!1553300 () Bool)

(declare-fun e!864794 () Option!808)

(assert (=> b!1553300 (= e!864794 e!864795)))

(declare-fun c!143215 () Bool)

(assert (=> b!1553300 (= c!143215 (and ((_ is Cons!36212) (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun c!143214 () Bool)

(declare-fun d!161469 () Bool)

(assert (=> d!161469 (= c!143214 (and ((_ is Cons!36212) (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161469 (= (getValueByKey!732 (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (select (arr!50010 _keys!618) from!762)) e!864794)))

(declare-fun b!1553299 () Bool)

(assert (=> b!1553299 (= e!864794 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))))

(declare-fun b!1553301 () Bool)

(assert (=> b!1553301 (= e!864795 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 (+!5011 lt!669329 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161469 c!143214) b!1553299))

(assert (= (and d!161469 (not c!143214)) b!1553300))

(assert (= (and b!1553300 c!143215) b!1553301))

(assert (= (and b!1553300 (not c!143215)) b!1553302))

(assert (=> b!1553301 m!1431023))

(declare-fun m!1431963 () Bool)

(assert (=> b!1553301 m!1431963))

(assert (=> b!1552819 d!161469))

(declare-fun d!161471 () Bool)

(declare-fun res!1063195 () Bool)

(declare-fun e!864796 () Bool)

(assert (=> d!161471 (=> res!1063195 e!864796)))

(assert (=> d!161471 (= res!1063195 (and ((_ is Cons!36212) lt!669398) (= (_1!12382 (h!37657 lt!669398)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161471 (= (containsKey!754 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864796)))

(declare-fun b!1553303 () Bool)

(declare-fun e!864797 () Bool)

(assert (=> b!1553303 (= e!864796 e!864797)))

(declare-fun res!1063196 () Bool)

(assert (=> b!1553303 (=> (not res!1063196) (not e!864797))))

(assert (=> b!1553303 (= res!1063196 (and (or (not ((_ is Cons!36212) lt!669398)) (bvsle (_1!12382 (h!37657 lt!669398)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) ((_ is Cons!36212) lt!669398) (bvslt (_1!12382 (h!37657 lt!669398)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553304 () Bool)

(assert (=> b!1553304 (= e!864797 (containsKey!754 (t!50934 lt!669398) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161471 (not res!1063195)) b!1553303))

(assert (= (and b!1553303 res!1063196) b!1553304))

(declare-fun m!1431965 () Bool)

(assert (=> b!1553304 m!1431965))

(assert (=> b!1552935 d!161471))

(assert (=> d!161127 d!161125))

(declare-fun d!161473 () Bool)

(assert (=> d!161473 (= (getValueByKey!732 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161473 true))

(declare-fun _$22!587 () Unit!51710)

(assert (=> d!161473 (= (choose!2038 lt!669446 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) _$22!587)))

(declare-fun bs!44638 () Bool)

(assert (= bs!44638 d!161473))

(assert (=> bs!44638 m!1431249))

(assert (=> d!161127 d!161473))

(declare-fun d!161475 () Bool)

(declare-fun res!1063197 () Bool)

(declare-fun e!864798 () Bool)

(assert (=> d!161475 (=> res!1063197 e!864798)))

(assert (=> d!161475 (= res!1063197 (or ((_ is Nil!36213) lt!669446) ((_ is Nil!36213) (t!50934 lt!669446))))))

(assert (=> d!161475 (= (isStrictlySorted!887 lt!669446) e!864798)))

(declare-fun b!1553305 () Bool)

(declare-fun e!864799 () Bool)

(assert (=> b!1553305 (= e!864798 e!864799)))

(declare-fun res!1063198 () Bool)

(assert (=> b!1553305 (=> (not res!1063198) (not e!864799))))

(assert (=> b!1553305 (= res!1063198 (bvslt (_1!12382 (h!37657 lt!669446)) (_1!12382 (h!37657 (t!50934 lt!669446)))))))

(declare-fun b!1553306 () Bool)

(assert (=> b!1553306 (= e!864799 (isStrictlySorted!887 (t!50934 lt!669446)))))

(assert (= (and d!161475 (not res!1063197)) b!1553305))

(assert (= (and b!1553305 res!1063198) b!1553306))

(declare-fun m!1431967 () Bool)

(assert (=> b!1553306 m!1431967))

(assert (=> d!161127 d!161475))

(assert (=> b!1552788 d!161323))

(assert (=> b!1552788 d!161227))

(declare-fun lt!669612 () Bool)

(declare-fun d!161477 () Bool)

(assert (=> d!161477 (= lt!669612 (select (content!794 lt!669538) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun e!864801 () Bool)

(assert (=> d!161477 (= lt!669612 e!864801)))

(declare-fun res!1063200 () Bool)

(assert (=> d!161477 (=> (not res!1063200) (not e!864801))))

(assert (=> d!161477 (= res!1063200 ((_ is Cons!36212) lt!669538))))

(assert (=> d!161477 (= (contains!10134 lt!669538 (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) lt!669612)))

(declare-fun b!1553307 () Bool)

(declare-fun e!864800 () Bool)

(assert (=> b!1553307 (= e!864801 e!864800)))

(declare-fun res!1063199 () Bool)

(assert (=> b!1553307 (=> res!1063199 e!864800)))

(assert (=> b!1553307 (= res!1063199 (= (h!37657 lt!669538) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553308 () Bool)

(assert (=> b!1553308 (= e!864800 (contains!10134 (t!50934 lt!669538) (tuple2!24743 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (= (and d!161477 res!1063200) b!1553307))

(assert (= (and b!1553307 (not res!1063199)) b!1553308))

(declare-fun m!1431969 () Bool)

(assert (=> d!161477 m!1431969))

(declare-fun m!1431971 () Bool)

(assert (=> d!161477 m!1431971))

(declare-fun m!1431973 () Bool)

(assert (=> b!1553308 m!1431973))

(assert (=> b!1552982 d!161477))

(declare-fun b!1553312 () Bool)

(declare-fun e!864803 () Option!808)

(assert (=> b!1553312 (= e!864803 None!806)))

(declare-fun b!1553310 () Bool)

(declare-fun e!864802 () Option!808)

(assert (=> b!1553310 (= e!864802 e!864803)))

(declare-fun c!143217 () Bool)

(assert (=> b!1553310 (= c!143217 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669406))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669406)))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))))

(declare-fun d!161479 () Bool)

(declare-fun c!143216 () Bool)

(assert (=> d!161479 (= c!143216 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669406))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669406)))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(assert (=> d!161479 (= (getValueByKey!732 (t!50934 (toList!11191 lt!669406)) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) e!864802)))

(declare-fun b!1553309 () Bool)

(assert (=> b!1553309 (= e!864802 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 lt!669406))))))))

(declare-fun b!1553311 () Bool)

(assert (=> b!1553311 (= e!864803 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 lt!669406))) (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (= (and d!161479 c!143216) b!1553309))

(assert (= (and d!161479 (not c!143216)) b!1553310))

(assert (= (and b!1553310 c!143217) b!1553311))

(assert (= (and b!1553310 (not c!143217)) b!1553312))

(declare-fun m!1431975 () Bool)

(assert (=> b!1553311 m!1431975))

(assert (=> b!1553034 d!161479))

(declare-fun d!161481 () Bool)

(declare-fun lt!669613 () Bool)

(assert (=> d!161481 (= lt!669613 (select (content!794 (toList!11191 lt!669527)) (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!864805 () Bool)

(assert (=> d!161481 (= lt!669613 e!864805)))

(declare-fun res!1063202 () Bool)

(assert (=> d!161481 (=> (not res!1063202) (not e!864805))))

(assert (=> d!161481 (= res!1063202 ((_ is Cons!36212) (toList!11191 lt!669527)))))

(assert (=> d!161481 (= (contains!10134 (toList!11191 lt!669527) (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!669613)))

(declare-fun b!1553313 () Bool)

(declare-fun e!864804 () Bool)

(assert (=> b!1553313 (= e!864805 e!864804)))

(declare-fun res!1063201 () Bool)

(assert (=> b!1553313 (=> res!1063201 e!864804)))

(assert (=> b!1553313 (= res!1063201 (= (h!37657 (toList!11191 lt!669527)) (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1553314 () Bool)

(assert (=> b!1553314 (= e!864804 (contains!10134 (t!50934 (toList!11191 lt!669527)) (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!161481 res!1063202) b!1553313))

(assert (= (and b!1553313 (not res!1063201)) b!1553314))

(declare-fun m!1431977 () Bool)

(assert (=> d!161481 m!1431977))

(declare-fun m!1431979 () Bool)

(assert (=> d!161481 m!1431979))

(declare-fun m!1431981 () Bool)

(assert (=> b!1553314 m!1431981))

(assert (=> b!1552963 d!161481))

(declare-fun b!1553333 () Bool)

(declare-fun e!864817 () SeekEntryResult!13516)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1553333 (= e!864817 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) mask!926) #b00000000000000000000000000000000 mask!926) (select (arr!50010 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(declare-fun b!1553334 () Bool)

(declare-fun lt!669618 () SeekEntryResult!13516)

(assert (=> b!1553334 (and (bvsge (index!56464 lt!669618) #b00000000000000000000000000000000) (bvslt (index!56464 lt!669618) (size!50560 _keys!618)))))

(declare-fun res!1063211 () Bool)

(assert (=> b!1553334 (= res!1063211 (= (select (arr!50010 _keys!618) (index!56464 lt!669618)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864816 () Bool)

(assert (=> b!1553334 (=> res!1063211 e!864816)))

(declare-fun b!1553335 () Bool)

(assert (=> b!1553335 (= e!864817 (Intermediate!13516 false (toIndex!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) mask!926) #b00000000000000000000000000000000))))

(declare-fun b!1553336 () Bool)

(assert (=> b!1553336 (and (bvsge (index!56464 lt!669618) #b00000000000000000000000000000000) (bvslt (index!56464 lt!669618) (size!50560 _keys!618)))))

(declare-fun res!1063209 () Bool)

(assert (=> b!1553336 (= res!1063209 (= (select (arr!50010 _keys!618) (index!56464 lt!669618)) (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(assert (=> b!1553336 (=> res!1063209 e!864816)))

(declare-fun e!864819 () Bool)

(assert (=> b!1553336 (= e!864819 e!864816)))

(declare-fun d!161483 () Bool)

(declare-fun e!864818 () Bool)

(assert (=> d!161483 e!864818))

(declare-fun c!143225 () Bool)

(assert (=> d!161483 (= c!143225 (and ((_ is Intermediate!13516) lt!669618) (undefined!14328 lt!669618)))))

(declare-fun e!864820 () SeekEntryResult!13516)

(assert (=> d!161483 (= lt!669618 e!864820)))

(declare-fun c!143226 () Bool)

(assert (=> d!161483 (= c!143226 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!669619 () (_ BitVec 64))

(assert (=> d!161483 (= lt!669619 (select (arr!50010 _keys!618) (toIndex!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) mask!926)))))

(assert (=> d!161483 (validMask!0 mask!926)))

(assert (=> d!161483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) mask!926) (select (arr!50010 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) lt!669618)))

(declare-fun b!1553337 () Bool)

(assert (=> b!1553337 (= e!864820 e!864817)))

(declare-fun c!143224 () Bool)

(assert (=> b!1553337 (= c!143224 (or (= lt!669619 (select (arr!50010 _keys!618) #b00000000000000000000000000000000)) (= (bvadd lt!669619 lt!669619) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553338 () Bool)

(assert (=> b!1553338 (= e!864818 (bvsge (x!139215 lt!669618) #b01111111111111111111111111111110))))

(declare-fun b!1553339 () Bool)

(assert (=> b!1553339 (= e!864818 e!864819)))

(declare-fun res!1063210 () Bool)

(assert (=> b!1553339 (= res!1063210 (and ((_ is Intermediate!13516) lt!669618) (not (undefined!14328 lt!669618)) (bvslt (x!139215 lt!669618) #b01111111111111111111111111111110) (bvsge (x!139215 lt!669618) #b00000000000000000000000000000000) (bvsge (x!139215 lt!669618) #b00000000000000000000000000000000)))))

(assert (=> b!1553339 (=> (not res!1063210) (not e!864819))))

(declare-fun b!1553340 () Bool)

(assert (=> b!1553340 (and (bvsge (index!56464 lt!669618) #b00000000000000000000000000000000) (bvslt (index!56464 lt!669618) (size!50560 _keys!618)))))

(assert (=> b!1553340 (= e!864816 (= (select (arr!50010 _keys!618) (index!56464 lt!669618)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1553341 () Bool)

(assert (=> b!1553341 (= e!864820 (Intermediate!13516 true (toIndex!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) mask!926) #b00000000000000000000000000000000))))

(assert (= (and d!161483 c!143226) b!1553341))

(assert (= (and d!161483 (not c!143226)) b!1553337))

(assert (= (and b!1553337 c!143224) b!1553335))

(assert (= (and b!1553337 (not c!143224)) b!1553333))

(assert (= (and d!161483 c!143225) b!1553338))

(assert (= (and d!161483 (not c!143225)) b!1553339))

(assert (= (and b!1553339 res!1063210) b!1553336))

(assert (= (and b!1553336 (not res!1063209)) b!1553334))

(assert (= (and b!1553334 (not res!1063211)) b!1553340))

(declare-fun m!1431983 () Bool)

(assert (=> b!1553336 m!1431983))

(assert (=> d!161483 m!1431403))

(declare-fun m!1431985 () Bool)

(assert (=> d!161483 m!1431985))

(assert (=> d!161483 m!1431015))

(assert (=> b!1553333 m!1431403))

(declare-fun m!1431987 () Bool)

(assert (=> b!1553333 m!1431987))

(assert (=> b!1553333 m!1431987))

(assert (=> b!1553333 m!1431125))

(declare-fun m!1431989 () Bool)

(assert (=> b!1553333 m!1431989))

(assert (=> b!1553340 m!1431983))

(assert (=> b!1553334 m!1431983))

(assert (=> d!161163 d!161483))

(declare-fun d!161485 () Bool)

(declare-fun lt!669625 () (_ BitVec 32))

(declare-fun lt!669624 () (_ BitVec 32))

(assert (=> d!161485 (= lt!669625 (bvmul (bvxor lt!669624 (bvlshr lt!669624 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!161485 (= lt!669624 ((_ extract 31 0) (bvand (bvxor (select (arr!50010 _keys!618) #b00000000000000000000000000000000) (bvlshr (select (arr!50010 _keys!618) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!161485 (and (bvsge mask!926 #b00000000000000000000000000000000) (let ((res!1063212 (let ((h!37660 ((_ extract 31 0) (bvand (bvxor (select (arr!50010 _keys!618) #b00000000000000000000000000000000) (bvlshr (select (arr!50010 _keys!618) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!139225 (bvmul (bvxor h!37660 (bvlshr h!37660 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!139225 (bvlshr x!139225 #b00000000000000000000000000001101)) mask!926))))) (and (bvslt res!1063212 (bvadd mask!926 #b00000000000000000000000000000001)) (bvsge res!1063212 #b00000000000000000000000000000000))))))

(assert (=> d!161485 (= (toIndex!0 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) mask!926) (bvand (bvxor lt!669625 (bvlshr lt!669625 #b00000000000000000000000000001101)) mask!926))))

(assert (=> d!161163 d!161485))

(assert (=> d!161163 d!161067))

(assert (=> b!1552966 d!161333))

(assert (=> b!1552966 d!161335))

(assert (=> b!1552808 d!161357))

(declare-fun d!161487 () Bool)

(declare-fun lt!669626 () Bool)

(assert (=> d!161487 (= lt!669626 (select (content!794 lt!669486) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun e!864822 () Bool)

(assert (=> d!161487 (= lt!669626 e!864822)))

(declare-fun res!1063214 () Bool)

(assert (=> d!161487 (=> (not res!1063214) (not e!864822))))

(assert (=> d!161487 (= res!1063214 ((_ is Cons!36212) lt!669486))))

(assert (=> d!161487 (= (contains!10134 lt!669486 (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) lt!669626)))

(declare-fun b!1553342 () Bool)

(declare-fun e!864821 () Bool)

(assert (=> b!1553342 (= e!864822 e!864821)))

(declare-fun res!1063213 () Bool)

(assert (=> b!1553342 (=> res!1063213 e!864821)))

(assert (=> b!1553342 (= res!1063213 (= (h!37657 lt!669486) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553343 () Bool)

(assert (=> b!1553343 (= e!864821 (contains!10134 (t!50934 lt!669486) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161487 res!1063214) b!1553342))

(assert (= (and b!1553342 (not res!1063213)) b!1553343))

(declare-fun m!1431991 () Bool)

(assert (=> d!161487 m!1431991))

(declare-fun m!1431993 () Bool)

(assert (=> d!161487 m!1431993))

(declare-fun m!1431995 () Bool)

(assert (=> b!1553343 m!1431995))

(assert (=> b!1552861 d!161487))

(declare-fun d!161489 () Bool)

(assert (=> d!161489 (= ($colon$colon!944 e!864591 (ite c!143133 (h!37657 (toList!11191 lt!669329)) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))) (Cons!36212 (ite c!143133 (h!37657 (toList!11191 lt!669329)) (tuple2!24743 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))) e!864591))))

(assert (=> bm!71347 d!161489))

(declare-fun b!1553347 () Bool)

(declare-fun e!864824 () Option!808)

(assert (=> b!1553347 (= e!864824 None!806)))

(declare-fun b!1553345 () Bool)

(declare-fun e!864823 () Option!808)

(assert (=> b!1553345 (= e!864823 e!864824)))

(declare-fun c!143228 () Bool)

(assert (=> b!1553345 (= c!143228 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669329))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669329)))) (select (arr!50010 _keys!618) from!762)))))))

(declare-fun c!143227 () Bool)

(declare-fun d!161491 () Bool)

(assert (=> d!161491 (= c!143227 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669329))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669329)))) (select (arr!50010 _keys!618) from!762))))))

(assert (=> d!161491 (= (getValueByKey!732 (t!50934 (toList!11191 lt!669329)) (select (arr!50010 _keys!618) from!762)) e!864823)))

(declare-fun b!1553344 () Bool)

(assert (=> b!1553344 (= e!864823 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 lt!669329))))))))

(declare-fun b!1553346 () Bool)

(assert (=> b!1553346 (= e!864824 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 lt!669329))) (select (arr!50010 _keys!618) from!762)))))

(assert (= (and d!161491 c!143227) b!1553344))

(assert (= (and d!161491 (not c!143227)) b!1553345))

(assert (= (and b!1553345 c!143228) b!1553346))

(assert (= (and b!1553345 (not c!143228)) b!1553347))

(assert (=> b!1553346 m!1431023))

(declare-fun m!1431997 () Bool)

(assert (=> b!1553346 m!1431997))

(assert (=> b!1553026 d!161491))

(declare-fun d!161493 () Bool)

(assert (=> d!161493 (= ($colon$colon!944 e!864551 (ite c!143116 (h!37657 (toList!11191 lt!669329)) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) (Cons!36212 (ite c!143116 (h!37657 (toList!11191 lt!669329)) (tuple2!24743 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864551))))

(assert (=> bm!71340 d!161493))

(assert (=> b!1552874 d!161261))

(declare-fun d!161495 () Bool)

(declare-fun res!1063215 () Bool)

(declare-fun e!864825 () Bool)

(assert (=> d!161495 (=> res!1063215 e!864825)))

(assert (=> d!161495 (= res!1063215 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161495 (= (containsKey!754 (t!50934 (toList!11191 lt!669336)) #b1000000000000000000000000000000000000000000000000000000000000000) e!864825)))

(declare-fun b!1553348 () Bool)

(declare-fun e!864826 () Bool)

(assert (=> b!1553348 (= e!864825 e!864826)))

(declare-fun res!1063216 () Bool)

(assert (=> b!1553348 (=> (not res!1063216) (not e!864826))))

(assert (=> b!1553348 (= res!1063216 (and (or (not ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336)))) (bvsle (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36212) (t!50934 (toList!11191 lt!669336))) (bvslt (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669336)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553349 () Bool)

(assert (=> b!1553349 (= e!864826 (containsKey!754 (t!50934 (t!50934 (toList!11191 lt!669336))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!161495 (not res!1063215)) b!1553348))

(assert (= (and b!1553348 res!1063216) b!1553349))

(declare-fun m!1431999 () Bool)

(assert (=> b!1553349 m!1431999))

(assert (=> b!1552968 d!161495))

(assert (=> d!161103 d!161059))

(assert (=> d!161103 d!161053))

(assert (=> d!161103 d!161065))

(declare-fun d!161497 () Bool)

(declare-fun res!1063217 () Bool)

(declare-fun e!864827 () Bool)

(assert (=> d!161497 (=> res!1063217 e!864827)))

(assert (=> d!161497 (= res!1063217 (or ((_ is Nil!36213) lt!669486) ((_ is Nil!36213) (t!50934 lt!669486))))))

(assert (=> d!161497 (= (isStrictlySorted!887 lt!669486) e!864827)))

(declare-fun b!1553350 () Bool)

(declare-fun e!864828 () Bool)

(assert (=> b!1553350 (= e!864827 e!864828)))

(declare-fun res!1063218 () Bool)

(assert (=> b!1553350 (=> (not res!1063218) (not e!864828))))

(assert (=> b!1553350 (= res!1063218 (bvslt (_1!12382 (h!37657 lt!669486)) (_1!12382 (h!37657 (t!50934 lt!669486)))))))

(declare-fun b!1553351 () Bool)

(assert (=> b!1553351 (= e!864828 (isStrictlySorted!887 (t!50934 lt!669486)))))

(assert (= (and d!161497 (not res!1063217)) b!1553350))

(assert (= (and b!1553350 res!1063218) b!1553351))

(declare-fun m!1432001 () Bool)

(assert (=> b!1553351 m!1432001))

(assert (=> d!161129 d!161497))

(declare-fun d!161499 () Bool)

(declare-fun res!1063219 () Bool)

(declare-fun e!864829 () Bool)

(assert (=> d!161499 (=> res!1063219 e!864829)))

(assert (=> d!161499 (= res!1063219 (or ((_ is Nil!36213) (toList!11191 call!71297)) ((_ is Nil!36213) (t!50934 (toList!11191 call!71297)))))))

(assert (=> d!161499 (= (isStrictlySorted!887 (toList!11191 call!71297)) e!864829)))

(declare-fun b!1553352 () Bool)

(declare-fun e!864830 () Bool)

(assert (=> b!1553352 (= e!864829 e!864830)))

(declare-fun res!1063220 () Bool)

(assert (=> b!1553352 (=> (not res!1063220) (not e!864830))))

(assert (=> b!1553352 (= res!1063220 (bvslt (_1!12382 (h!37657 (toList!11191 call!71297))) (_1!12382 (h!37657 (t!50934 (toList!11191 call!71297))))))))

(declare-fun b!1553353 () Bool)

(assert (=> b!1553353 (= e!864830 (isStrictlySorted!887 (t!50934 (toList!11191 call!71297))))))

(assert (= (and d!161499 (not res!1063219)) b!1553352))

(assert (= (and b!1553352 res!1063220) b!1553353))

(assert (=> b!1553353 m!1431811))

(assert (=> d!161129 d!161499))

(declare-fun b!1553366 () Bool)

(declare-fun e!864838 () SeekEntryResult!13516)

(assert (=> b!1553366 (= e!864838 (Found!13516 (index!56464 lt!669503)))))

(declare-fun b!1553368 () Bool)

(declare-fun e!864839 () SeekEntryResult!13516)

(assert (=> b!1553368 (= e!864839 Undefined!13516)))

(declare-fun b!1553369 () Bool)

(declare-fun c!143235 () Bool)

(declare-fun lt!669632 () (_ BitVec 64))

(assert (=> b!1553369 (= c!143235 (= lt!669632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864837 () SeekEntryResult!13516)

(assert (=> b!1553369 (= e!864838 e!864837)))

(declare-fun b!1553370 () Bool)

(assert (=> b!1553370 (= e!864837 (MissingVacant!13516 (index!56464 lt!669503)))))

(declare-fun b!1553371 () Bool)

(assert (=> b!1553371 (= e!864837 (seekKeyOrZeroReturnVacant!0 (bvadd (x!139215 lt!669503) #b00000000000000000000000000000001) (nextIndex!0 (index!56464 lt!669503) (x!139215 lt!669503) mask!926) (index!56464 lt!669503) (select (arr!50010 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926))))

(declare-fun b!1553367 () Bool)

(assert (=> b!1553367 (= e!864839 e!864838)))

(declare-fun c!143236 () Bool)

(assert (=> b!1553367 (= c!143236 (= lt!669632 (select (arr!50010 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!161501 () Bool)

(declare-fun lt!669631 () SeekEntryResult!13516)

(assert (=> d!161501 (and (or ((_ is Undefined!13516) lt!669631) (not ((_ is Found!13516) lt!669631)) (and (bvsge (index!56463 lt!669631) #b00000000000000000000000000000000) (bvslt (index!56463 lt!669631) (size!50560 _keys!618)))) (or ((_ is Undefined!13516) lt!669631) ((_ is Found!13516) lt!669631) (not ((_ is MissingVacant!13516) lt!669631)) (not (= (index!56465 lt!669631) (index!56464 lt!669503))) (and (bvsge (index!56465 lt!669631) #b00000000000000000000000000000000) (bvslt (index!56465 lt!669631) (size!50560 _keys!618)))) (or ((_ is Undefined!13516) lt!669631) (ite ((_ is Found!13516) lt!669631) (= (select (arr!50010 _keys!618) (index!56463 lt!669631)) (select (arr!50010 _keys!618) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!13516) lt!669631) (= (index!56465 lt!669631) (index!56464 lt!669503)) (= (select (arr!50010 _keys!618) (index!56465 lt!669631)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161501 (= lt!669631 e!864839)))

(declare-fun c!143237 () Bool)

(assert (=> d!161501 (= c!143237 (bvsge (x!139215 lt!669503) #b01111111111111111111111111111110))))

(assert (=> d!161501 (= lt!669632 (select (arr!50010 _keys!618) (index!56464 lt!669503)))))

(assert (=> d!161501 (validMask!0 mask!926)))

(assert (=> d!161501 (= (seekKeyOrZeroReturnVacant!0 (x!139215 lt!669503) (index!56464 lt!669503) (index!56464 lt!669503) (select (arr!50010 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) lt!669631)))

(assert (= (and d!161501 c!143237) b!1553368))

(assert (= (and d!161501 (not c!143237)) b!1553367))

(assert (= (and b!1553367 c!143236) b!1553366))

(assert (= (and b!1553367 (not c!143236)) b!1553369))

(assert (= (and b!1553369 c!143235) b!1553370))

(assert (= (and b!1553369 (not c!143235)) b!1553371))

(declare-fun m!1432003 () Bool)

(assert (=> b!1553371 m!1432003))

(assert (=> b!1553371 m!1432003))

(assert (=> b!1553371 m!1431125))

(declare-fun m!1432005 () Bool)

(assert (=> b!1553371 m!1432005))

(declare-fun m!1432007 () Bool)

(assert (=> d!161501 m!1432007))

(declare-fun m!1432009 () Bool)

(assert (=> d!161501 m!1432009))

(assert (=> d!161501 m!1431401))

(assert (=> d!161501 m!1431015))

(assert (=> b!1552924 d!161501))

(assert (=> b!1552816 d!161253))

(declare-fun d!161503 () Bool)

(declare-fun e!864841 () Bool)

(assert (=> d!161503 e!864841))

(declare-fun res!1063221 () Bool)

(assert (=> d!161503 (=> res!1063221 e!864841)))

(declare-fun lt!669634 () Bool)

(assert (=> d!161503 (= res!1063221 (not lt!669634))))

(declare-fun lt!669635 () Bool)

(assert (=> d!161503 (= lt!669634 lt!669635)))

(declare-fun lt!669633 () Unit!51710)

(declare-fun e!864840 () Unit!51710)

(assert (=> d!161503 (= lt!669633 e!864840)))

(declare-fun c!143238 () Bool)

(assert (=> d!161503 (= c!143238 lt!669635)))

(assert (=> d!161503 (= lt!669635 (containsKey!754 (toList!11191 (+!5011 lt!669470 (tuple2!24743 lt!669472 lt!669474))) lt!669469))))

(assert (=> d!161503 (= (contains!10131 (+!5011 lt!669470 (tuple2!24743 lt!669472 lt!669474)) lt!669469) lt!669634)))

(declare-fun b!1553372 () Bool)

(declare-fun lt!669636 () Unit!51710)

(assert (=> b!1553372 (= e!864840 lt!669636)))

(assert (=> b!1553372 (= lt!669636 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 (+!5011 lt!669470 (tuple2!24743 lt!669472 lt!669474))) lt!669469))))

(assert (=> b!1553372 (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669470 (tuple2!24743 lt!669472 lt!669474))) lt!669469))))

(declare-fun b!1553373 () Bool)

(declare-fun Unit!51732 () Unit!51710)

(assert (=> b!1553373 (= e!864840 Unit!51732)))

(declare-fun b!1553374 () Bool)

(assert (=> b!1553374 (= e!864841 (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669470 (tuple2!24743 lt!669472 lt!669474))) lt!669469)))))

(assert (= (and d!161503 c!143238) b!1553372))

(assert (= (and d!161503 (not c!143238)) b!1553373))

(assert (= (and d!161503 (not res!1063221)) b!1553374))

(declare-fun m!1432011 () Bool)

(assert (=> d!161503 m!1432011))

(declare-fun m!1432013 () Bool)

(assert (=> b!1553372 m!1432013))

(declare-fun m!1432015 () Bool)

(assert (=> b!1553372 m!1432015))

(assert (=> b!1553372 m!1432015))

(declare-fun m!1432017 () Bool)

(assert (=> b!1553372 m!1432017))

(assert (=> b!1553374 m!1432015))

(assert (=> b!1553374 m!1432015))

(assert (=> b!1553374 m!1432017))

(assert (=> b!1552816 d!161503))

(declare-fun d!161505 () Bool)

(declare-fun e!864842 () Bool)

(assert (=> d!161505 e!864842))

(declare-fun res!1063223 () Bool)

(assert (=> d!161505 (=> (not res!1063223) (not e!864842))))

(declare-fun lt!669639 () ListLongMap!22351)

(assert (=> d!161505 (= res!1063223 (contains!10131 lt!669639 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!669638 () List!36216)

(assert (=> d!161505 (= lt!669639 (ListLongMap!22352 lt!669638))))

(declare-fun lt!669640 () Unit!51710)

(declare-fun lt!669637 () Unit!51710)

(assert (=> d!161505 (= lt!669640 lt!669637)))

(assert (=> d!161505 (= (getValueByKey!732 lt!669638 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!807 (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161505 (= lt!669637 (lemmaContainsTupThenGetReturnValue!374 lt!669638 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161505 (= lt!669638 (insertStrictlySorted!503 (toList!11191 call!71332) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161505 (= (+!5011 call!71332 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!669639)))

(declare-fun b!1553375 () Bool)

(declare-fun res!1063222 () Bool)

(assert (=> b!1553375 (=> (not res!1063222) (not e!864842))))

(assert (=> b!1553375 (= res!1063222 (= (getValueByKey!732 (toList!11191 lt!669639) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!807 (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1553376 () Bool)

(assert (=> b!1553376 (= e!864842 (contains!10134 (toList!11191 lt!669639) (tuple2!24743 (select (arr!50010 _keys!618) (bvadd from!762 #b00000000000000000000000000000001)) (get!26037 (select (arr!50011 _values!470) (bvadd from!762 #b00000000000000000000000000000001)) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!161505 res!1063223) b!1553375))

(assert (= (and b!1553375 res!1063222) b!1553376))

(declare-fun m!1432019 () Bool)

(assert (=> d!161505 m!1432019))

(declare-fun m!1432021 () Bool)

(assert (=> d!161505 m!1432021))

(declare-fun m!1432023 () Bool)

(assert (=> d!161505 m!1432023))

(declare-fun m!1432025 () Bool)

(assert (=> d!161505 m!1432025))

(declare-fun m!1432027 () Bool)

(assert (=> b!1553375 m!1432027))

(declare-fun m!1432029 () Bool)

(assert (=> b!1553376 m!1432029))

(assert (=> b!1552816 d!161505))

(declare-fun d!161507 () Bool)

(declare-fun e!864843 () Bool)

(assert (=> d!161507 e!864843))

(declare-fun res!1063225 () Bool)

(assert (=> d!161507 (=> (not res!1063225) (not e!864843))))

(declare-fun lt!669643 () ListLongMap!22351)

(assert (=> d!161507 (= res!1063225 (contains!10131 lt!669643 (_1!12382 (tuple2!24743 lt!669472 lt!669474))))))

(declare-fun lt!669642 () List!36216)

(assert (=> d!161507 (= lt!669643 (ListLongMap!22352 lt!669642))))

(declare-fun lt!669644 () Unit!51710)

(declare-fun lt!669641 () Unit!51710)

(assert (=> d!161507 (= lt!669644 lt!669641)))

(assert (=> d!161507 (= (getValueByKey!732 lt!669642 (_1!12382 (tuple2!24743 lt!669472 lt!669474))) (Some!807 (_2!12382 (tuple2!24743 lt!669472 lt!669474))))))

(assert (=> d!161507 (= lt!669641 (lemmaContainsTupThenGetReturnValue!374 lt!669642 (_1!12382 (tuple2!24743 lt!669472 lt!669474)) (_2!12382 (tuple2!24743 lt!669472 lt!669474))))))

(assert (=> d!161507 (= lt!669642 (insertStrictlySorted!503 (toList!11191 lt!669470) (_1!12382 (tuple2!24743 lt!669472 lt!669474)) (_2!12382 (tuple2!24743 lt!669472 lt!669474))))))

(assert (=> d!161507 (= (+!5011 lt!669470 (tuple2!24743 lt!669472 lt!669474)) lt!669643)))

(declare-fun b!1553377 () Bool)

(declare-fun res!1063224 () Bool)

(assert (=> b!1553377 (=> (not res!1063224) (not e!864843))))

(assert (=> b!1553377 (= res!1063224 (= (getValueByKey!732 (toList!11191 lt!669643) (_1!12382 (tuple2!24743 lt!669472 lt!669474))) (Some!807 (_2!12382 (tuple2!24743 lt!669472 lt!669474)))))))

(declare-fun b!1553378 () Bool)

(assert (=> b!1553378 (= e!864843 (contains!10134 (toList!11191 lt!669643) (tuple2!24743 lt!669472 lt!669474)))))

(assert (= (and d!161507 res!1063225) b!1553377))

(assert (= (and b!1553377 res!1063224) b!1553378))

(declare-fun m!1432031 () Bool)

(assert (=> d!161507 m!1432031))

(declare-fun m!1432033 () Bool)

(assert (=> d!161507 m!1432033))

(declare-fun m!1432035 () Bool)

(assert (=> d!161507 m!1432035))

(declare-fun m!1432037 () Bool)

(assert (=> d!161507 m!1432037))

(declare-fun m!1432039 () Bool)

(assert (=> b!1553377 m!1432039))

(declare-fun m!1432041 () Bool)

(assert (=> b!1553378 m!1432041))

(assert (=> b!1552816 d!161507))

(declare-fun d!161509 () Bool)

(assert (=> d!161509 (not (contains!10131 (+!5011 lt!669470 (tuple2!24743 lt!669472 lt!669474)) lt!669469))))

(declare-fun lt!669645 () Unit!51710)

(assert (=> d!161509 (= lt!669645 (choose!2039 lt!669470 lt!669472 lt!669474 lt!669469))))

(declare-fun e!864844 () Bool)

(assert (=> d!161509 e!864844))

(declare-fun res!1063226 () Bool)

(assert (=> d!161509 (=> (not res!1063226) (not e!864844))))

(assert (=> d!161509 (= res!1063226 (not (contains!10131 lt!669470 lt!669469)))))

(assert (=> d!161509 (= (addStillNotContains!513 lt!669470 lt!669472 lt!669474 lt!669469) lt!669645)))

(declare-fun b!1553379 () Bool)

(assert (=> b!1553379 (= e!864844 (not (= lt!669472 lt!669469)))))

(assert (= (and d!161509 res!1063226) b!1553379))

(assert (=> d!161509 m!1431311))

(assert (=> d!161509 m!1431311))

(assert (=> d!161509 m!1431313))

(declare-fun m!1432043 () Bool)

(assert (=> d!161509 m!1432043))

(declare-fun m!1432045 () Bool)

(assert (=> d!161509 m!1432045))

(assert (=> b!1552816 d!161509))

(declare-fun d!161511 () Bool)

(declare-fun e!864846 () Bool)

(assert (=> d!161511 e!864846))

(declare-fun res!1063227 () Bool)

(assert (=> d!161511 (=> res!1063227 e!864846)))

(declare-fun lt!669647 () Bool)

(assert (=> d!161511 (= res!1063227 (not lt!669647))))

(declare-fun lt!669648 () Bool)

(assert (=> d!161511 (= lt!669647 lt!669648)))

(declare-fun lt!669646 () Unit!51710)

(declare-fun e!864845 () Unit!51710)

(assert (=> d!161511 (= lt!669646 e!864845)))

(declare-fun c!143239 () Bool)

(assert (=> d!161511 (= c!143239 lt!669648)))

(assert (=> d!161511 (= lt!669648 (containsKey!754 (toList!11191 lt!669527) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161511 (= (contains!10131 lt!669527 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!669647)))

(declare-fun b!1553380 () Bool)

(declare-fun lt!669649 () Unit!51710)

(assert (=> b!1553380 (= e!864845 lt!669649)))

(assert (=> b!1553380 (= lt!669649 (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 lt!669527) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1553380 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669527) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1553381 () Bool)

(declare-fun Unit!51733 () Unit!51710)

(assert (=> b!1553381 (= e!864845 Unit!51733)))

(declare-fun b!1553382 () Bool)

(assert (=> b!1553382 (= e!864846 (isDefined!548 (getValueByKey!732 (toList!11191 lt!669527) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!161511 c!143239) b!1553380))

(assert (= (and d!161511 (not c!143239)) b!1553381))

(assert (= (and d!161511 (not res!1063227)) b!1553382))

(declare-fun m!1432047 () Bool)

(assert (=> d!161511 m!1432047))

(declare-fun m!1432049 () Bool)

(assert (=> b!1553380 m!1432049))

(assert (=> b!1553380 m!1431487))

(assert (=> b!1553380 m!1431487))

(declare-fun m!1432051 () Bool)

(assert (=> b!1553380 m!1432051))

(assert (=> b!1553382 m!1431487))

(assert (=> b!1553382 m!1431487))

(assert (=> b!1553382 m!1432051))

(assert (=> d!161185 d!161511))

(declare-fun b!1553386 () Bool)

(declare-fun e!864848 () Option!808)

(assert (=> b!1553386 (= e!864848 None!806)))

(declare-fun b!1553384 () Bool)

(declare-fun e!864847 () Option!808)

(assert (=> b!1553384 (= e!864847 e!864848)))

(declare-fun c!143241 () Bool)

(assert (=> b!1553384 (= c!143241 (and ((_ is Cons!36212) lt!669526) (not (= (_1!12382 (h!37657 lt!669526)) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun d!161513 () Bool)

(declare-fun c!143240 () Bool)

(assert (=> d!161513 (= c!143240 (and ((_ is Cons!36212) lt!669526) (= (_1!12382 (h!37657 lt!669526)) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!161513 (= (getValueByKey!732 lt!669526 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!864847)))

(declare-fun b!1553383 () Bool)

(assert (=> b!1553383 (= e!864847 (Some!807 (_2!12382 (h!37657 lt!669526))))))

(declare-fun b!1553385 () Bool)

(assert (=> b!1553385 (= e!864848 (getValueByKey!732 (t!50934 lt!669526) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!161513 c!143240) b!1553383))

(assert (= (and d!161513 (not c!143240)) b!1553384))

(assert (= (and b!1553384 c!143241) b!1553385))

(assert (= (and b!1553384 (not c!143241)) b!1553386))

(declare-fun m!1432053 () Bool)

(assert (=> b!1553385 m!1432053))

(assert (=> d!161185 d!161513))

(declare-fun d!161515 () Bool)

(assert (=> d!161515 (= (getValueByKey!732 lt!669526 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!807 (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!669650 () Unit!51710)

(assert (=> d!161515 (= lt!669650 (choose!2038 lt!669526 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!864849 () Bool)

(assert (=> d!161515 e!864849))

(declare-fun res!1063228 () Bool)

(assert (=> d!161515 (=> (not res!1063228) (not e!864849))))

(assert (=> d!161515 (= res!1063228 (isStrictlySorted!887 lt!669526))))

(assert (=> d!161515 (= (lemmaContainsTupThenGetReturnValue!374 lt!669526 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!669650)))

(declare-fun b!1553387 () Bool)

(declare-fun res!1063229 () Bool)

(assert (=> b!1553387 (=> (not res!1063229) (not e!864849))))

(assert (=> b!1553387 (= res!1063229 (containsKey!754 lt!669526 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1553388 () Bool)

(assert (=> b!1553388 (= e!864849 (contains!10134 lt!669526 (tuple2!24743 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!161515 res!1063228) b!1553387))

(assert (= (and b!1553387 res!1063229) b!1553388))

(assert (=> d!161515 m!1431481))

(declare-fun m!1432055 () Bool)

(assert (=> d!161515 m!1432055))

(declare-fun m!1432057 () Bool)

(assert (=> d!161515 m!1432057))

(declare-fun m!1432059 () Bool)

(assert (=> b!1553387 m!1432059))

(declare-fun m!1432061 () Bool)

(assert (=> b!1553388 m!1432061))

(assert (=> d!161185 d!161515))

(declare-fun b!1553389 () Bool)

(declare-fun e!864854 () List!36216)

(declare-fun call!71373 () List!36216)

(assert (=> b!1553389 (= e!864854 call!71373)))

(declare-fun b!1553390 () Bool)

(declare-fun e!864851 () List!36216)

(declare-fun call!71372 () List!36216)

(assert (=> b!1553390 (= e!864851 call!71372)))

(declare-fun bm!71368 () Bool)

(declare-fun e!864852 () List!36216)

(declare-fun c!143245 () Bool)

(assert (=> bm!71368 (= call!71373 ($colon$colon!944 e!864852 (ite c!143245 (h!37657 (toList!11191 call!71328)) (tuple2!24743 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!143243 () Bool)

(assert (=> bm!71368 (= c!143243 c!143245)))

(declare-fun b!1553391 () Bool)

(declare-fun e!864850 () Bool)

(declare-fun lt!669651 () List!36216)

(assert (=> b!1553391 (= e!864850 (contains!10134 lt!669651 (tuple2!24743 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!161517 () Bool)

(assert (=> d!161517 e!864850))

(declare-fun res!1063230 () Bool)

(assert (=> d!161517 (=> (not res!1063230) (not e!864850))))

(assert (=> d!161517 (= res!1063230 (isStrictlySorted!887 lt!669651))))

(assert (=> d!161517 (= lt!669651 e!864854)))

(assert (=> d!161517 (= c!143245 (and ((_ is Cons!36212) (toList!11191 call!71328)) (bvslt (_1!12382 (h!37657 (toList!11191 call!71328))) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!161517 (isStrictlySorted!887 (toList!11191 call!71328))))

(assert (=> d!161517 (= (insertStrictlySorted!503 (toList!11191 call!71328) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!669651)))

(declare-fun b!1553392 () Bool)

(declare-fun e!864853 () List!36216)

(assert (=> b!1553392 (= e!864854 e!864853)))

(declare-fun c!143242 () Bool)

(assert (=> b!1553392 (= c!143242 (and ((_ is Cons!36212) (toList!11191 call!71328)) (= (_1!12382 (h!37657 (toList!11191 call!71328))) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1553393 () Bool)

(assert (=> b!1553393 (= e!864852 (insertStrictlySorted!503 (t!50934 (toList!11191 call!71328)) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1553394 () Bool)

(assert (=> b!1553394 (= e!864851 call!71372)))

(declare-fun c!143244 () Bool)

(declare-fun b!1553395 () Bool)

(assert (=> b!1553395 (= c!143244 (and ((_ is Cons!36212) (toList!11191 call!71328)) (bvsgt (_1!12382 (h!37657 (toList!11191 call!71328))) (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1553395 (= e!864853 e!864851)))

(declare-fun b!1553396 () Bool)

(declare-fun res!1063231 () Bool)

(assert (=> b!1553396 (=> (not res!1063231) (not e!864850))))

(assert (=> b!1553396 (= res!1063231 (containsKey!754 lt!669651 (_1!12382 (tuple2!24743 (select (arr!50010 _keys!618) from!762) (get!26037 (select (arr!50011 _values!470) from!762) (dynLambda!3806 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!71369 () Bool)

(declare-fun call!71371 () List!36216)

(assert (=> bm!71369 (= call!71371 call!71373)))

(declare-fun bm!71370 () Bool)

(assert (=> bm!71370 (= call!71372 call!71371)))

(declare-fun b!1553397 () Bool)

(assert (=> b!1553397 (= e!864852 (ite c!143242 (t!50934 (toList!11191 call!71328)) (ite c!143244 (Cons!36212 (h!37657 (toList!11191 call!71328)) (t!50934 (toList!11191 call!71328))) Nil!36213)))))

(declare-fun b!1553398 () Bool)

(assert (=> b!1553398 (= e!864853 call!71371)))

(assert (= (and d!161517 c!143245) b!1553389))

(assert (= (and d!161517 (not c!143245)) b!1553392))

(assert (= (and b!1553392 c!143242) b!1553398))

(assert (= (and b!1553392 (not c!143242)) b!1553395))

(assert (= (and b!1553395 c!143244) b!1553394))

(assert (= (and b!1553395 (not c!143244)) b!1553390))

(assert (= (or b!1553394 b!1553390) bm!71370))

(assert (= (or b!1553398 bm!71370) bm!71369))

(assert (= (or b!1553389 bm!71369) bm!71368))

(assert (= (and bm!71368 c!143243) b!1553393))

(assert (= (and bm!71368 (not c!143243)) b!1553397))

(assert (= (and d!161517 res!1063230) b!1553396))

(assert (= (and b!1553396 res!1063231) b!1553391))

(declare-fun m!1432063 () Bool)

(assert (=> b!1553396 m!1432063))

(declare-fun m!1432065 () Bool)

(assert (=> b!1553393 m!1432065))

(declare-fun m!1432067 () Bool)

(assert (=> bm!71368 m!1432067))

(declare-fun m!1432069 () Bool)

(assert (=> d!161517 m!1432069))

(declare-fun m!1432071 () Bool)

(assert (=> d!161517 m!1432071))

(declare-fun m!1432073 () Bool)

(assert (=> b!1553391 m!1432073))

(assert (=> d!161185 d!161517))

(assert (=> b!1552973 d!161363))

(assert (=> b!1552973 d!161223))

(declare-fun d!161519 () Bool)

(declare-fun lt!669652 () Bool)

(assert (=> d!161519 (= lt!669652 (select (content!795 (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!864856 () Bool)

(assert (=> d!161519 (= lt!669652 e!864856)))

(declare-fun res!1063233 () Bool)

(assert (=> d!161519 (=> (not res!1063233) (not e!864856))))

(assert (=> d!161519 (= res!1063233 ((_ is Cons!36213) (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)))))

(assert (=> d!161519 (= (contains!10133 (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214) (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!669652)))

(declare-fun b!1553399 () Bool)

(declare-fun e!864855 () Bool)

(assert (=> b!1553399 (= e!864856 e!864855)))

(declare-fun res!1063232 () Bool)

(assert (=> b!1553399 (=> res!1063232 e!864855)))

(assert (=> b!1553399 (= res!1063232 (= (h!37658 (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1553400 () Bool)

(assert (=> b!1553400 (= e!864855 (contains!10133 (t!50935 (ite c!143036 (Cons!36213 (select (arr!50010 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)) (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!161519 res!1063233) b!1553399))

(assert (= (and b!1553399 (not res!1063232)) b!1553400))

(declare-fun m!1432075 () Bool)

(assert (=> d!161519 m!1432075))

(assert (=> d!161519 m!1431365))

(declare-fun m!1432077 () Bool)

(assert (=> d!161519 m!1432077))

(assert (=> b!1553400 m!1431365))

(declare-fun m!1432079 () Bool)

(assert (=> b!1553400 m!1432079))

(assert (=> b!1552877 d!161519))

(declare-fun d!161521 () Bool)

(declare-fun res!1063234 () Bool)

(declare-fun e!864857 () Bool)

(assert (=> d!161521 (=> res!1063234 e!864857)))

(assert (=> d!161521 (= res!1063234 (and ((_ is Cons!36212) lt!669434) (= (_1!12382 (h!37657 lt!669434)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(assert (=> d!161521 (= (containsKey!754 lt!669434 (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) e!864857)))

(declare-fun b!1553401 () Bool)

(declare-fun e!864858 () Bool)

(assert (=> b!1553401 (= e!864857 e!864858)))

(declare-fun res!1063235 () Bool)

(assert (=> b!1553401 (=> (not res!1063235) (not e!864858))))

(assert (=> b!1553401 (= res!1063235 (and (or (not ((_ is Cons!36212) lt!669434)) (bvsle (_1!12382 (h!37657 lt!669434)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))) ((_ is Cons!36212) lt!669434) (bvslt (_1!12382 (h!37657 lt!669434)) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553402 () Bool)

(assert (=> b!1553402 (= e!864858 (containsKey!754 (t!50934 lt!669434) (_1!12382 (ite (or c!143012 c!143013) (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (= (and d!161521 (not res!1063234)) b!1553401))

(assert (= (and b!1553401 res!1063235) b!1553402))

(declare-fun m!1432081 () Bool)

(assert (=> b!1553402 m!1432081))

(assert (=> b!1552978 d!161521))

(declare-fun d!161523 () Bool)

(declare-fun lt!669653 () Bool)

(assert (=> d!161523 (= lt!669653 (select (content!794 (t!50934 (toList!11191 lt!669447))) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!864860 () Bool)

(assert (=> d!161523 (= lt!669653 e!864860)))

(declare-fun res!1063237 () Bool)

(assert (=> d!161523 (=> (not res!1063237) (not e!864860))))

(assert (=> d!161523 (= res!1063237 ((_ is Cons!36212) (t!50934 (toList!11191 lt!669447))))))

(assert (=> d!161523 (= (contains!10134 (t!50934 (toList!11191 lt!669447)) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669653)))

(declare-fun b!1553403 () Bool)

(declare-fun e!864859 () Bool)

(assert (=> b!1553403 (= e!864860 e!864859)))

(declare-fun res!1063236 () Bool)

(assert (=> b!1553403 (=> res!1063236 e!864859)))

(assert (=> b!1553403 (= res!1063236 (= (h!37657 (t!50934 (toList!11191 lt!669447))) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1553404 () Bool)

(assert (=> b!1553404 (= e!864859 (contains!10134 (t!50934 (t!50934 (toList!11191 lt!669447))) (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161523 res!1063237) b!1553403))

(assert (= (and b!1553403 (not res!1063236)) b!1553404))

(assert (=> d!161523 m!1431935))

(declare-fun m!1432083 () Bool)

(assert (=> d!161523 m!1432083))

(declare-fun m!1432085 () Bool)

(assert (=> b!1553404 m!1432085))

(assert (=> b!1553029 d!161523))

(assert (=> d!161169 d!161167))

(declare-fun d!161525 () Bool)

(assert (=> d!161525 (= (getValueByKey!732 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161525 true))

(declare-fun _$22!588 () Unit!51710)

(assert (=> d!161525 (= (choose!2038 lt!669398 (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) _$22!588)))

(declare-fun bs!44639 () Bool)

(assert (= bs!44639 d!161525))

(assert (=> bs!44639 m!1431151))

(assert (=> d!161169 d!161525))

(declare-fun d!161527 () Bool)

(declare-fun res!1063238 () Bool)

(declare-fun e!864861 () Bool)

(assert (=> d!161527 (=> res!1063238 e!864861)))

(assert (=> d!161527 (= res!1063238 (or ((_ is Nil!36213) lt!669398) ((_ is Nil!36213) (t!50934 lt!669398))))))

(assert (=> d!161527 (= (isStrictlySorted!887 lt!669398) e!864861)))

(declare-fun b!1553405 () Bool)

(declare-fun e!864862 () Bool)

(assert (=> b!1553405 (= e!864861 e!864862)))

(declare-fun res!1063239 () Bool)

(assert (=> b!1553405 (=> (not res!1063239) (not e!864862))))

(assert (=> b!1553405 (= res!1063239 (bvslt (_1!12382 (h!37657 lt!669398)) (_1!12382 (h!37657 (t!50934 lt!669398)))))))

(declare-fun b!1553406 () Bool)

(assert (=> b!1553406 (= e!864862 (isStrictlySorted!887 (t!50934 lt!669398)))))

(assert (= (and d!161527 (not res!1063238)) b!1553405))

(assert (= (and b!1553405 res!1063239) b!1553406))

(declare-fun m!1432087 () Bool)

(assert (=> b!1553406 m!1432087))

(assert (=> d!161169 d!161527))

(assert (=> d!161213 d!161211))

(declare-fun d!161529 () Bool)

(assert (=> d!161529 (= (getValueByKey!732 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!807 (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161529 true))

(declare-fun _$22!589 () Unit!51710)

(assert (=> d!161529 (= (choose!2038 lt!669405 (_1!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12382 (tuple2!24743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) _$22!589)))

(declare-fun bs!44640 () Bool)

(assert (= bs!44640 d!161529))

(assert (=> bs!44640 m!1431173))

(assert (=> d!161213 d!161529))

(declare-fun d!161531 () Bool)

(declare-fun res!1063240 () Bool)

(declare-fun e!864863 () Bool)

(assert (=> d!161531 (=> res!1063240 e!864863)))

(assert (=> d!161531 (= res!1063240 (or ((_ is Nil!36213) lt!669405) ((_ is Nil!36213) (t!50934 lt!669405))))))

(assert (=> d!161531 (= (isStrictlySorted!887 lt!669405) e!864863)))

(declare-fun b!1553407 () Bool)

(declare-fun e!864864 () Bool)

(assert (=> b!1553407 (= e!864863 e!864864)))

(declare-fun res!1063241 () Bool)

(assert (=> b!1553407 (=> (not res!1063241) (not e!864864))))

(assert (=> b!1553407 (= res!1063241 (bvslt (_1!12382 (h!37657 lt!669405)) (_1!12382 (h!37657 (t!50934 lt!669405)))))))

(declare-fun b!1553408 () Bool)

(assert (=> b!1553408 (= e!864864 (isStrictlySorted!887 (t!50934 lt!669405)))))

(assert (= (and d!161531 (not res!1063240)) b!1553407))

(assert (= (and b!1553407 res!1063241) b!1553408))

(declare-fun m!1432089 () Bool)

(assert (=> b!1553408 m!1432089))

(assert (=> d!161213 d!161531))

(declare-fun b!1553412 () Bool)

(declare-fun e!864866 () Option!808)

(assert (=> b!1553412 (= e!864866 None!806)))

(declare-fun b!1553410 () Bool)

(declare-fun e!864865 () Option!808)

(assert (=> b!1553410 (= e!864865 e!864866)))

(declare-fun c!143247 () Bool)

(assert (=> b!1553410 (= c!143247 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669447))) (not (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669447)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161533 () Bool)

(declare-fun c!143246 () Bool)

(assert (=> d!161533 (= c!143246 (and ((_ is Cons!36212) (t!50934 (toList!11191 lt!669447))) (= (_1!12382 (h!37657 (t!50934 (toList!11191 lt!669447)))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161533 (= (getValueByKey!732 (t!50934 (toList!11191 lt!669447)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864865)))

(declare-fun b!1553409 () Bool)

(assert (=> b!1553409 (= e!864865 (Some!807 (_2!12382 (h!37657 (t!50934 (toList!11191 lt!669447))))))))

(declare-fun b!1553411 () Bool)

(assert (=> b!1553411 (= e!864866 (getValueByKey!732 (t!50934 (t!50934 (toList!11191 lt!669447))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161533 c!143246) b!1553409))

(assert (= (and d!161533 (not c!143246)) b!1553410))

(assert (= (and b!1553410 c!143247) b!1553411))

(assert (= (and b!1553410 (not c!143247)) b!1553412))

(declare-fun m!1432091 () Bool)

(assert (=> b!1553411 m!1432091))

(assert (=> b!1552897 d!161533))

(declare-fun d!161535 () Bool)

(assert (=> d!161535 (arrayContainsKey!0 _keys!618 lt!669511 #b00000000000000000000000000000000)))

(declare-fun lt!669654 () Unit!51710)

(assert (=> d!161535 (= lt!669654 (choose!13 _keys!618 lt!669511 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!161535 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!161535 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669511 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!669654)))

(declare-fun bs!44641 () Bool)

(assert (= bs!44641 d!161535))

(assert (=> bs!44641 m!1431449))

(declare-fun m!1432093 () Bool)

(assert (=> bs!44641 m!1432093))

(assert (=> b!1552949 d!161535))

(declare-fun d!161537 () Bool)

(declare-fun res!1063242 () Bool)

(declare-fun e!864867 () Bool)

(assert (=> d!161537 (=> res!1063242 e!864867)))

(assert (=> d!161537 (= res!1063242 (= (select (arr!50010 _keys!618) #b00000000000000000000000000000000) lt!669511))))

(assert (=> d!161537 (= (arrayContainsKey!0 _keys!618 lt!669511 #b00000000000000000000000000000000) e!864867)))

(declare-fun b!1553413 () Bool)

(declare-fun e!864868 () Bool)

(assert (=> b!1553413 (= e!864867 e!864868)))

(declare-fun res!1063243 () Bool)

(assert (=> b!1553413 (=> (not res!1063243) (not e!864868))))

(assert (=> b!1553413 (= res!1063243 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50560 _keys!618)))))

(declare-fun b!1553414 () Bool)

(assert (=> b!1553414 (= e!864868 (arrayContainsKey!0 _keys!618 lt!669511 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!161537 (not res!1063242)) b!1553413))

(assert (= (and b!1553413 res!1063243) b!1553414))

(assert (=> d!161537 m!1431125))

(declare-fun m!1432095 () Bool)

(assert (=> b!1553414 m!1432095))

(assert (=> b!1552949 d!161537))

(declare-fun b!1553415 () Bool)

(declare-fun c!143249 () Bool)

(declare-fun lt!669656 () (_ BitVec 64))

(assert (=> b!1553415 (= c!143249 (= lt!669656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!864870 () SeekEntryResult!13516)

(declare-fun e!864871 () SeekEntryResult!13516)

(assert (=> b!1553415 (= e!864870 e!864871)))

(declare-fun b!1553416 () Bool)

(declare-fun lt!669657 () SeekEntryResult!13516)

(assert (=> b!1553416 (= e!864871 (MissingZero!13516 (index!56464 lt!669657)))))

(declare-fun b!1553417 () Bool)

(assert (=> b!1553417 (= e!864871 (seekKeyOrZeroReturnVacant!0 (x!139215 lt!669657) (index!56464 lt!669657) (index!56464 lt!669657) (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926))))

(declare-fun b!1553418 () Bool)

(declare-fun e!864869 () SeekEntryResult!13516)

(assert (=> b!1553418 (= e!864869 e!864870)))

(assert (=> b!1553418 (= lt!669656 (select (arr!50010 _keys!618) (index!56464 lt!669657)))))

(declare-fun c!143248 () Bool)

(assert (=> b!1553418 (= c!143248 (= lt!669656 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!161539 () Bool)

(declare-fun lt!669655 () SeekEntryResult!13516)

(assert (=> d!161539 (and (or ((_ is Undefined!13516) lt!669655) (not ((_ is Found!13516) lt!669655)) (and (bvsge (index!56463 lt!669655) #b00000000000000000000000000000000) (bvslt (index!56463 lt!669655) (size!50560 _keys!618)))) (or ((_ is Undefined!13516) lt!669655) ((_ is Found!13516) lt!669655) (not ((_ is MissingZero!13516) lt!669655)) (and (bvsge (index!56462 lt!669655) #b00000000000000000000000000000000) (bvslt (index!56462 lt!669655) (size!50560 _keys!618)))) (or ((_ is Undefined!13516) lt!669655) ((_ is Found!13516) lt!669655) ((_ is MissingZero!13516) lt!669655) (not ((_ is MissingVacant!13516) lt!669655)) (and (bvsge (index!56465 lt!669655) #b00000000000000000000000000000000) (bvslt (index!56465 lt!669655) (size!50560 _keys!618)))) (or ((_ is Undefined!13516) lt!669655) (ite ((_ is Found!13516) lt!669655) (= (select (arr!50010 _keys!618) (index!56463 lt!669655)) (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!13516) lt!669655) (= (select (arr!50010 _keys!618) (index!56462 lt!669655)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13516) lt!669655) (= (select (arr!50010 _keys!618) (index!56465 lt!669655)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!161539 (= lt!669655 e!864869)))

(declare-fun c!143250 () Bool)

(assert (=> d!161539 (= c!143250 (and ((_ is Intermediate!13516) lt!669657) (undefined!14328 lt!669657)))))

(assert (=> d!161539 (= lt!669657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!926) (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926))))

(assert (=> d!161539 (validMask!0 mask!926)))

(assert (=> d!161539 (= (seekEntryOrOpen!0 (select (arr!50010 _keys!618) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!618 mask!926) lt!669655)))

(declare-fun b!1553419 () Bool)

(assert (=> b!1553419 (= e!864869 Undefined!13516)))

(declare-fun b!1553420 () Bool)

(assert (=> b!1553420 (= e!864870 (Found!13516 (index!56464 lt!669657)))))

(assert (= (and d!161539 c!143250) b!1553419))

(assert (= (and d!161539 (not c!143250)) b!1553418))

(assert (= (and b!1553418 c!143248) b!1553420))

(assert (= (and b!1553418 (not c!143248)) b!1553415))

(assert (= (and b!1553415 c!143249) b!1553416))

(assert (= (and b!1553415 (not c!143249)) b!1553417))

(assert (=> b!1553417 m!1431365))

(declare-fun m!1432097 () Bool)

(assert (=> b!1553417 m!1432097))

(declare-fun m!1432099 () Bool)

(assert (=> b!1553418 m!1432099))

(assert (=> d!161539 m!1431365))

(declare-fun m!1432101 () Bool)

(assert (=> d!161539 m!1432101))

(declare-fun m!1432103 () Bool)

(assert (=> d!161539 m!1432103))

(assert (=> d!161539 m!1431015))

(declare-fun m!1432105 () Bool)

(assert (=> d!161539 m!1432105))

(assert (=> d!161539 m!1432101))

(assert (=> d!161539 m!1431365))

(declare-fun m!1432107 () Bool)

(assert (=> d!161539 m!1432107))

(declare-fun m!1432109 () Bool)

(assert (=> d!161539 m!1432109))

(assert (=> b!1552949 d!161539))

(declare-fun b!1553424 () Bool)

(declare-fun e!864873 () Option!808)

(assert (=> b!1553424 (= e!864873 None!806)))

(declare-fun b!1553422 () Bool)

(declare-fun e!864872 () Option!808)

(assert (=> b!1553422 (= e!864872 e!864873)))

(declare-fun c!143252 () Bool)

(assert (=> b!1553422 (= c!143252 (and ((_ is Cons!36212) (t!50934 lt!669446)) (not (= (_1!12382 (h!37657 (t!50934 lt!669446))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun d!161541 () Bool)

(declare-fun c!143251 () Bool)

(assert (=> d!161541 (= c!143251 (and ((_ is Cons!36212) (t!50934 lt!669446)) (= (_1!12382 (h!37657 (t!50934 lt!669446))) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161541 (= (getValueByKey!732 (t!50934 lt!669446) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) e!864872)))

(declare-fun b!1553421 () Bool)

(assert (=> b!1553421 (= e!864872 (Some!807 (_2!12382 (h!37657 (t!50934 lt!669446)))))))

(declare-fun b!1553423 () Bool)

(assert (=> b!1553423 (= e!864873 (getValueByKey!732 (t!50934 (t!50934 lt!669446)) (_1!12382 (tuple2!24743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161541 c!143251) b!1553421))

(assert (= (and d!161541 (not c!143251)) b!1553422))

(assert (= (and b!1553422 c!143252) b!1553423))

(assert (= (and b!1553422 (not c!143252)) b!1553424))

(declare-fun m!1432111 () Bool)

(assert (=> b!1553423 m!1432111))

(assert (=> b!1552831 d!161541))

(declare-fun lt!669658 () Bool)

(declare-fun d!161543 () Bool)

(assert (=> d!161543 (= lt!669658 (select (content!794 (toList!11191 lt!669520)) (tuple2!24743 lt!669425 lt!669427)))))

(declare-fun e!864875 () Bool)

(assert (=> d!161543 (= lt!669658 e!864875)))

(declare-fun res!1063245 () Bool)

(assert (=> d!161543 (=> (not res!1063245) (not e!864875))))

(assert (=> d!161543 (= res!1063245 ((_ is Cons!36212) (toList!11191 lt!669520)))))

(assert (=> d!161543 (= (contains!10134 (toList!11191 lt!669520) (tuple2!24743 lt!669425 lt!669427)) lt!669658)))

(declare-fun b!1553425 () Bool)

(declare-fun e!864874 () Bool)

(assert (=> b!1553425 (= e!864875 e!864874)))

(declare-fun res!1063244 () Bool)

(assert (=> b!1553425 (=> res!1063244 e!864874)))

(assert (=> b!1553425 (= res!1063244 (= (h!37657 (toList!11191 lt!669520)) (tuple2!24743 lt!669425 lt!669427)))))

(declare-fun b!1553426 () Bool)

(assert (=> b!1553426 (= e!864874 (contains!10134 (t!50934 (toList!11191 lt!669520)) (tuple2!24743 lt!669425 lt!669427)))))

(assert (= (and d!161543 res!1063245) b!1553425))

(assert (= (and b!1553425 (not res!1063244)) b!1553426))

(declare-fun m!1432113 () Bool)

(assert (=> d!161543 m!1432113))

(declare-fun m!1432115 () Bool)

(assert (=> d!161543 m!1432115))

(declare-fun m!1432117 () Bool)

(assert (=> b!1553426 m!1432117))

(assert (=> b!1552957 d!161543))

(declare-fun d!161545 () Bool)

(assert (=> d!161545 (isDefined!548 (getValueByKey!732 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422))))

(declare-fun lt!669659 () Unit!51710)

(assert (=> d!161545 (= lt!669659 (choose!2037 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422))))

(declare-fun e!864876 () Bool)

(assert (=> d!161545 e!864876))

(declare-fun res!1063246 () Bool)

(assert (=> d!161545 (=> (not res!1063246) (not e!864876))))

(assert (=> d!161545 (= res!1063246 (isStrictlySorted!887 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427)))))))

(assert (=> d!161545 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!500 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422) lt!669659)))

(declare-fun b!1553427 () Bool)

(assert (=> b!1553427 (= e!864876 (containsKey!754 (toList!11191 (+!5011 lt!669423 (tuple2!24743 lt!669425 lt!669427))) lt!669422))))

(assert (= (and d!161545 res!1063246) b!1553427))

(assert (=> d!161545 m!1431459))

(assert (=> d!161545 m!1431459))

(assert (=> d!161545 m!1431461))

(declare-fun m!1432119 () Bool)

(assert (=> d!161545 m!1432119))

(declare-fun m!1432121 () Bool)

(assert (=> d!161545 m!1432121))

(assert (=> b!1553427 m!1431455))

(assert (=> b!1552953 d!161545))

(assert (=> b!1552953 d!161407))

(assert (=> b!1552953 d!161409))

(assert (=> b!1553038 d!161391))

(assert (=> b!1553038 d!161393))

(declare-fun mapNonEmpty!59040 () Bool)

(declare-fun mapRes!59040 () Bool)

(declare-fun tp!112080 () Bool)

(declare-fun e!864877 () Bool)

(assert (=> mapNonEmpty!59040 (= mapRes!59040 (and tp!112080 e!864877))))

(declare-fun mapRest!59040 () (Array (_ BitVec 32) ValueCell!18195))

(declare-fun mapKey!59040 () (_ BitVec 32))

(declare-fun mapValue!59040 () ValueCell!18195)

(assert (=> mapNonEmpty!59040 (= mapRest!59039 (store mapRest!59040 mapKey!59040 mapValue!59040))))

(declare-fun mapIsEmpty!59040 () Bool)

(assert (=> mapIsEmpty!59040 mapRes!59040))

(declare-fun condMapEmpty!59040 () Bool)

(declare-fun mapDefault!59040 () ValueCell!18195)

(assert (=> mapNonEmpty!59039 (= condMapEmpty!59040 (= mapRest!59039 ((as const (Array (_ BitVec 32) ValueCell!18195)) mapDefault!59040)))))

(declare-fun e!864878 () Bool)

(assert (=> mapNonEmpty!59039 (= tp!112079 (and e!864878 mapRes!59040))))

(declare-fun b!1553429 () Bool)

(assert (=> b!1553429 (= e!864878 tp_is_empty!38211)))

(declare-fun b!1553428 () Bool)

(assert (=> b!1553428 (= e!864877 tp_is_empty!38211)))

(assert (= (and mapNonEmpty!59039 condMapEmpty!59040) mapIsEmpty!59040))

(assert (= (and mapNonEmpty!59039 (not condMapEmpty!59040)) mapNonEmpty!59040))

(assert (= (and mapNonEmpty!59040 ((_ is ValueCellFull!18195) mapValue!59040)) b!1553428))

(assert (= (and mapNonEmpty!59039 ((_ is ValueCellFull!18195) mapDefault!59040)) b!1553429))

(declare-fun m!1432123 () Bool)

(assert (=> mapNonEmpty!59040 m!1432123))

(declare-fun b_lambda!24815 () Bool)

(assert (= b_lambda!24811 (or (and start!132308 b_free!31935) b_lambda!24815)))

(declare-fun b_lambda!24817 () Bool)

(assert (= b_lambda!24813 (or (and start!132308 b_free!31935) b_lambda!24817)))

(check-sat (not bm!71350) (not d!161507) (not b!1553391) (not b!1553094) (not d!161473) (not b!1553248) (not b!1553097) (not b_lambda!24815) (not b!1553301) (not b_lambda!24793) (not b!1553054) (not b!1553110) (not d!161439) (not d!161267) (not d!161359) (not d!161389) (not d!161309) (not b!1553050) (not b!1553077) (not b!1553143) (not d!161483) (not d!161291) (not b_lambda!24807) (not b!1553105) (not b_lambda!24799) (not b!1553242) (not d!161535) (not b!1553376) (not b!1553247) (not d!161529) (not b!1553408) (not d!161515) (not b!1553400) (not b!1553257) (not b!1553134) (not b!1553116) (not b!1553074) (not b!1553294) (not b!1553272) (not bm!71363) (not b!1553059) (not b!1553118) (not b!1553129) (not d!161501) (not b!1553092) (not d!161269) (not b!1553296) (not b!1553411) (not b!1553263) (not b!1553204) (not d!161333) (not b!1553079) (not d!161331) (not bm!71359) (not d!161419) (not d!161517) (not b!1553201) (not d!161477) (not d!161295) (not b!1553237) (not d!161435) (not b!1553279) (not b!1553371) (not d!161317) (not b!1553155) (not d!161487) (not b!1553142) (not b!1553288) (not d!161525) (not d!161373) (not d!161325) (not b!1553372) (not b!1553311) (not b!1553113) (not b!1553159) (not d!161503) (not b!1553282) (not d!161243) (not d!161329) (not b_lambda!24809) (not d!161505) (not b!1553255) (not b!1553285) (not b!1553426) (not b!1553291) (not b!1553221) (not d!161311) (not b!1553251) (not b!1553245) (not d!161263) (not d!161351) (not b!1553177) (not b!1553250) (not b!1553215) (not b!1553304) (not b!1553374) (not b!1553140) (not b!1553417) (not b!1553208) (not b!1553393) (not b!1553385) (not b!1553353) (not b!1553172) (not d!161403) (not b!1553195) (not b!1553193) (not b!1553218) (not b!1553180) (not b!1553162) (not b!1553153) (not b!1553146) (not b!1553167) (not d!161307) (not b!1553141) (not b!1553261) (not b!1553388) (not b!1553265) (not b!1553273) (not d!161465) (not b!1553121) (not d!161303) (not d!161341) (not b!1553104) (not d!161417) (not b!1553133) (not b!1553333) (not d!161305) (not d!161539) (not b!1553276) (not b!1553188) (not d!161275) (not d!161423) (not d!161399) (not d!161245) (not b!1553375) (not b!1553382) (not b_next!31935) b_and!51393 (not d!161545) tp_is_empty!38211 (not b!1553156) (not b!1553427) (not b!1553220) (not d!161519) (not b!1553253) (not b!1553043) (not d!161297) (not b!1553349) (not d!161481) (not d!161363) (not d!161387) (not d!161511) (not b!1553308) (not d!161255) (not b!1553239) (not bm!71353) (not b!1553082) (not b!1553378) (not b!1553227) (not bm!71366) (not b!1553071) (not d!161365) (not mapNonEmpty!59040) (not b!1553164) (not b!1553377) (not d!161323) (not b!1553101) (not b!1553233) (not b!1553206) (not d!161523) (not d!161361) (not b!1553182) (not b!1553130) (not b!1553190) (not d!161281) (not d!161405) (not bm!71356) (not b!1553414) (not b!1553298) (not b!1553067) (not b!1553047) (not b_lambda!24817) (not d!161391) (not bm!71360) (not b!1553198) (not d!161407) (not b!1553406) (not b!1553404) (not b!1553126) (not b!1553107) (not b!1553090) (not b!1553226) (not b!1553185) (not d!161321) (not b!1553396) (not d!161543) (not d!161251) (not b!1553152) (not b!1553150) (not d!161429) (not b!1553387) (not d!161451) (not b!1553212) (not b!1553149) (not b!1553343) (not b!1553131) (not b!1553223) (not d!161441) (not b!1553135) (not b_lambda!24801) (not b!1553267) (not b!1553230) (not b!1553045) (not b!1553346) (not b!1553306) (not b!1553402) (not b!1553056) (not b!1553259) (not d!161509) (not b!1553271) (not b!1553202) (not b!1553351) (not b!1553423) (not bm!71367) (not b!1553112) (not b!1553380) (not bm!71368) (not b!1553046) (not d!161415) (not b!1553269) (not b!1553314) (not d!161411) (not b!1553169) (not b!1553235) (not b!1553136) (not b!1553068) (not b!1553210))
(check-sat b_and!51393 (not b_next!31935))
