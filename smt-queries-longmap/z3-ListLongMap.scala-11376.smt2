; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132128 () Bool)

(assert start!132128)

(declare-fun b_free!31873 () Bool)

(declare-fun b_next!31873 () Bool)

(assert (=> start!132128 (= b_free!31873 (not b_next!31873))))

(declare-fun tp!111874 () Bool)

(declare-fun b_and!51281 () Bool)

(assert (=> start!132128 (= tp!111874 b_and!51281)))

(declare-fun b!1550308 () Bool)

(declare-fun res!1061937 () Bool)

(declare-fun e!862968 () Bool)

(assert (=> b!1550308 (=> (not res!1061937) (not e!862968))))

(declare-datatypes ((array!103420 0))(
  ( (array!103421 (arr!49912 (Array (_ BitVec 32) (_ BitVec 64))) (size!50464 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103420)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59309 0))(
  ( (V!59310 (val!19152 Int)) )
))
(declare-datatypes ((ValueCell!18164 0))(
  ( (ValueCellFull!18164 (v!21950 V!59309)) (EmptyCell!18164) )
))
(declare-datatypes ((array!103422 0))(
  ( (array!103423 (arr!49913 (Array (_ BitVec 32) ValueCell!18164)) (size!50465 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103422)

(assert (=> b!1550308 (= res!1061937 (and (= (size!50465 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50464 _keys!618) (size!50465 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550309 () Bool)

(declare-fun res!1061938 () Bool)

(assert (=> b!1550309 (=> (not res!1061938) (not e!862968))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1550309 (= res!1061938 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50464 _keys!618))))))

(declare-fun bm!70755 () Bool)

(declare-datatypes ((tuple2!24756 0))(
  ( (tuple2!24757 (_1!12389 (_ BitVec 64)) (_2!12389 V!59309)) )
))
(declare-datatypes ((List!36208 0))(
  ( (Nil!36205) (Cons!36204 (h!37650 tuple2!24756) (t!50908 List!36208)) )
))
(declare-datatypes ((ListLongMap!22365 0))(
  ( (ListLongMap!22366 (toList!11198 List!36208)) )
))
(declare-fun call!70760 () ListLongMap!22365)

(declare-fun call!70761 () ListLongMap!22365)

(assert (=> bm!70755 (= call!70760 call!70761)))

(declare-fun minValue!436 () V!59309)

(declare-fun call!70759 () ListLongMap!22365)

(declare-fun call!70758 () ListLongMap!22365)

(declare-fun c!142527 () Bool)

(declare-fun bm!70756 () Bool)

(declare-fun c!142525 () Bool)

(declare-fun zeroValue!436 () V!59309)

(declare-fun +!5014 (ListLongMap!22365 tuple2!24756) ListLongMap!22365)

(assert (=> bm!70756 (= call!70759 (+!5014 (ite c!142525 call!70761 (ite c!142527 call!70760 call!70758)) (ite (or c!142525 c!142527) (tuple2!24757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550310 () Bool)

(declare-fun e!862971 () Bool)

(declare-fun tp_is_empty!38149 () Bool)

(assert (=> b!1550310 (= e!862971 tp_is_empty!38149)))

(declare-fun b!1550311 () Bool)

(declare-fun e!862969 () ListLongMap!22365)

(assert (=> b!1550311 (= e!862969 (+!5014 call!70759 (tuple2!24757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1061941 () Bool)

(assert (=> start!132128 (=> (not res!1061941) (not e!862968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132128 (= res!1061941 (validMask!0 mask!926))))

(assert (=> start!132128 e!862968))

(declare-fun array_inv!39007 (array!103420) Bool)

(assert (=> start!132128 (array_inv!39007 _keys!618)))

(assert (=> start!132128 tp_is_empty!38149))

(assert (=> start!132128 true))

(assert (=> start!132128 tp!111874))

(declare-fun e!862972 () Bool)

(declare-fun array_inv!39008 (array!103422) Bool)

(assert (=> start!132128 (and (array_inv!39008 _values!470) e!862972)))

(declare-fun b!1550312 () Bool)

(declare-fun res!1061942 () Bool)

(assert (=> b!1550312 (=> (not res!1061942) (not e!862968))))

(declare-datatypes ((List!36209 0))(
  ( (Nil!36206) (Cons!36205 (h!37651 (_ BitVec 64)) (t!50909 List!36209)) )
))
(declare-fun arrayNoDuplicates!0 (array!103420 (_ BitVec 32) List!36209) Bool)

(assert (=> b!1550312 (= res!1061942 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36206))))

(declare-fun b!1550313 () Bool)

(declare-fun e!862975 () ListLongMap!22365)

(assert (=> b!1550313 (= e!862969 e!862975)))

(declare-fun lt!668066 () Bool)

(assert (=> b!1550313 (= c!142527 (and (not lt!668066) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550314 () Bool)

(declare-fun mapRes!58930 () Bool)

(assert (=> b!1550314 (= e!862972 (and e!862971 mapRes!58930))))

(declare-fun condMapEmpty!58930 () Bool)

(declare-fun mapDefault!58930 () ValueCell!18164)

(assert (=> b!1550314 (= condMapEmpty!58930 (= (arr!49913 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18164)) mapDefault!58930)))))

(declare-fun b!1550315 () Bool)

(declare-fun res!1061936 () Bool)

(assert (=> b!1550315 (=> (not res!1061936) (not e!862968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103420 (_ BitVec 32)) Bool)

(assert (=> b!1550315 (= res!1061936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70757 () Bool)

(declare-fun call!70762 () ListLongMap!22365)

(assert (=> bm!70757 (= call!70762 call!70759)))

(declare-fun b!1550316 () Bool)

(declare-fun e!862974 () Bool)

(assert (=> b!1550316 (= e!862974 (not true))))

(declare-fun lt!668064 () ListLongMap!22365)

(declare-fun contains!10062 (ListLongMap!22365 (_ BitVec 64)) Bool)

(assert (=> b!1550316 (contains!10062 (+!5014 lt!668064 (tuple2!24757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49912 _keys!618) from!762))))

(declare-datatypes ((Unit!51468 0))(
  ( (Unit!51469) )
))
(declare-fun lt!668063 () Unit!51468)

(declare-fun addStillContains!1279 (ListLongMap!22365 (_ BitVec 64) V!59309 (_ BitVec 64)) Unit!51468)

(assert (=> b!1550316 (= lt!668063 (addStillContains!1279 lt!668064 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49912 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6638 (array!103420 array!103422 (_ BitVec 32) (_ BitVec 32) V!59309 V!59309 (_ BitVec 32) Int) ListLongMap!22365)

(assert (=> b!1550316 (= lt!668064 (getCurrentListMapNoExtraKeys!6638 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70758 () Bool)

(assert (=> bm!70758 (= call!70758 call!70760)))

(declare-fun b!1550317 () Bool)

(declare-fun c!142526 () Bool)

(assert (=> b!1550317 (= c!142526 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668066))))

(declare-fun e!862973 () ListLongMap!22365)

(assert (=> b!1550317 (= e!862975 e!862973)))

(declare-fun bm!70759 () Bool)

(assert (=> bm!70759 (= call!70761 (getCurrentListMapNoExtraKeys!6638 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550318 () Bool)

(declare-fun res!1061940 () Bool)

(assert (=> b!1550318 (=> (not res!1061940) (not e!862974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550318 (= res!1061940 (validKeyInArray!0 (select (arr!49912 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58930 () Bool)

(declare-fun tp!111875 () Bool)

(declare-fun e!862967 () Bool)

(assert (=> mapNonEmpty!58930 (= mapRes!58930 (and tp!111875 e!862967))))

(declare-fun mapRest!58930 () (Array (_ BitVec 32) ValueCell!18164))

(declare-fun mapKey!58930 () (_ BitVec 32))

(declare-fun mapValue!58930 () ValueCell!18164)

(assert (=> mapNonEmpty!58930 (= (arr!49913 _values!470) (store mapRest!58930 mapKey!58930 mapValue!58930))))

(declare-fun b!1550319 () Bool)

(assert (=> b!1550319 (= e!862968 e!862974)))

(declare-fun res!1061939 () Bool)

(assert (=> b!1550319 (=> (not res!1061939) (not e!862974))))

(assert (=> b!1550319 (= res!1061939 (bvslt from!762 (size!50464 _keys!618)))))

(declare-fun lt!668065 () ListLongMap!22365)

(assert (=> b!1550319 (= lt!668065 e!862969)))

(assert (=> b!1550319 (= c!142525 (and (not lt!668066) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550319 (= lt!668066 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550320 () Bool)

(assert (=> b!1550320 (= e!862975 call!70762)))

(declare-fun b!1550321 () Bool)

(assert (=> b!1550321 (= e!862973 call!70762)))

(declare-fun b!1550322 () Bool)

(assert (=> b!1550322 (= e!862973 call!70758)))

(declare-fun b!1550323 () Bool)

(assert (=> b!1550323 (= e!862967 tp_is_empty!38149)))

(declare-fun mapIsEmpty!58930 () Bool)

(assert (=> mapIsEmpty!58930 mapRes!58930))

(assert (= (and start!132128 res!1061941) b!1550308))

(assert (= (and b!1550308 res!1061937) b!1550315))

(assert (= (and b!1550315 res!1061936) b!1550312))

(assert (= (and b!1550312 res!1061942) b!1550309))

(assert (= (and b!1550309 res!1061938) b!1550319))

(assert (= (and b!1550319 c!142525) b!1550311))

(assert (= (and b!1550319 (not c!142525)) b!1550313))

(assert (= (and b!1550313 c!142527) b!1550320))

(assert (= (and b!1550313 (not c!142527)) b!1550317))

(assert (= (and b!1550317 c!142526) b!1550321))

(assert (= (and b!1550317 (not c!142526)) b!1550322))

(assert (= (or b!1550321 b!1550322) bm!70758))

(assert (= (or b!1550320 bm!70758) bm!70755))

(assert (= (or b!1550320 b!1550321) bm!70757))

(assert (= (or b!1550311 bm!70755) bm!70759))

(assert (= (or b!1550311 bm!70757) bm!70756))

(assert (= (and b!1550319 res!1061939) b!1550318))

(assert (= (and b!1550318 res!1061940) b!1550316))

(assert (= (and b!1550314 condMapEmpty!58930) mapIsEmpty!58930))

(assert (= (and b!1550314 (not condMapEmpty!58930)) mapNonEmpty!58930))

(get-info :version)

(assert (= (and mapNonEmpty!58930 ((_ is ValueCellFull!18164) mapValue!58930)) b!1550323))

(assert (= (and b!1550314 ((_ is ValueCellFull!18164) mapDefault!58930)) b!1550310))

(assert (= start!132128 b!1550314))

(declare-fun m!1428583 () Bool)

(assert (=> b!1550312 m!1428583))

(declare-fun m!1428585 () Bool)

(assert (=> mapNonEmpty!58930 m!1428585))

(declare-fun m!1428587 () Bool)

(assert (=> b!1550311 m!1428587))

(declare-fun m!1428589 () Bool)

(assert (=> b!1550315 m!1428589))

(declare-fun m!1428591 () Bool)

(assert (=> b!1550316 m!1428591))

(declare-fun m!1428593 () Bool)

(assert (=> b!1550316 m!1428593))

(declare-fun m!1428595 () Bool)

(assert (=> b!1550316 m!1428595))

(assert (=> b!1550316 m!1428593))

(declare-fun m!1428597 () Bool)

(assert (=> b!1550316 m!1428597))

(assert (=> b!1550316 m!1428595))

(assert (=> b!1550316 m!1428593))

(declare-fun m!1428599 () Bool)

(assert (=> b!1550316 m!1428599))

(assert (=> b!1550318 m!1428593))

(assert (=> b!1550318 m!1428593))

(declare-fun m!1428601 () Bool)

(assert (=> b!1550318 m!1428601))

(declare-fun m!1428603 () Bool)

(assert (=> bm!70756 m!1428603))

(declare-fun m!1428605 () Bool)

(assert (=> start!132128 m!1428605))

(declare-fun m!1428607 () Bool)

(assert (=> start!132128 m!1428607))

(declare-fun m!1428609 () Bool)

(assert (=> start!132128 m!1428609))

(assert (=> bm!70759 m!1428591))

(check-sat (not bm!70759) (not mapNonEmpty!58930) (not bm!70756) (not b!1550312) b_and!51281 (not b!1550315) (not b!1550316) (not b!1550311) (not start!132128) (not b_next!31873) tp_is_empty!38149 (not b!1550318))
(check-sat b_and!51281 (not b_next!31873))
