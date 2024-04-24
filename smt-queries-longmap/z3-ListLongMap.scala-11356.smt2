; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132452 () Bool)

(assert start!132452)

(declare-fun b_free!31753 () Bool)

(declare-fun b_next!31753 () Bool)

(assert (=> start!132452 (= b_free!31753 (not b_next!31753))))

(declare-fun tp!111510 () Bool)

(declare-fun b_and!51165 () Bool)

(assert (=> start!132452 (= tp!111510 b_and!51165)))

(declare-fun b!1549949 () Bool)

(declare-fun res!1061573 () Bool)

(declare-fun e!862899 () Bool)

(assert (=> b!1549949 (=> (not res!1061573) (not e!862899))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103384 0))(
  ( (array!103385 (arr!49887 (Array (_ BitVec 32) (_ BitVec 64))) (size!50438 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103384)

(assert (=> b!1549949 (= res!1061573 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50438 _keys!618))))))

(declare-fun b!1549950 () Bool)

(declare-datatypes ((V!59149 0))(
  ( (V!59150 (val!19092 Int)) )
))
(declare-datatypes ((tuple2!24624 0))(
  ( (tuple2!24625 (_1!12323 (_ BitVec 64)) (_2!12323 V!59149)) )
))
(declare-datatypes ((List!36102 0))(
  ( (Nil!36099) (Cons!36098 (h!37561 tuple2!24624) (t!50788 List!36102)) )
))
(declare-datatypes ((ListLongMap!22241 0))(
  ( (ListLongMap!22242 (toList!11136 List!36102)) )
))
(declare-fun e!862901 () ListLongMap!22241)

(declare-fun e!862904 () ListLongMap!22241)

(assert (=> b!1549950 (= e!862901 e!862904)))

(declare-fun c!142817 () Bool)

(declare-fun lt!667808 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1549950 (= c!142817 (and (not lt!667808) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549951 () Bool)

(declare-fun res!1061577 () Bool)

(declare-fun e!862898 () Bool)

(assert (=> b!1549951 (=> (not res!1061577) (not e!862898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549951 (= res!1061577 (validKeyInArray!0 (select (arr!49887 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59149)

(declare-fun call!70026 () ListLongMap!22241)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18104 0))(
  ( (ValueCellFull!18104 (v!21885 V!59149)) (EmptyCell!18104) )
))
(declare-datatypes ((array!103386 0))(
  ( (array!103387 (arr!49888 (Array (_ BitVec 32) ValueCell!18104)) (size!50439 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103386)

(declare-fun minValue!436 () V!59149)

(declare-fun bm!70022 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6610 (array!103384 array!103386 (_ BitVec 32) (_ BitVec 32) V!59149 V!59149 (_ BitVec 32) Int) ListLongMap!22241)

(assert (=> bm!70022 (= call!70026 (getCurrentListMapNoExtraKeys!6610 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549952 () Bool)

(assert (=> b!1549952 (= e!862898 (not true))))

(declare-fun lt!667810 () ListLongMap!22241)

(declare-fun apply!1061 (ListLongMap!22241 (_ BitVec 64)) V!59149)

(declare-fun +!4979 (ListLongMap!22241 tuple2!24624) ListLongMap!22241)

(assert (=> b!1549952 (= (apply!1061 (+!4979 lt!667810 (tuple2!24625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49887 _keys!618) from!762)) (apply!1061 lt!667810 (select (arr!49887 _keys!618) from!762)))))

(declare-datatypes ((Unit!51487 0))(
  ( (Unit!51488) )
))
(declare-fun lt!667807 () Unit!51487)

(declare-fun addApplyDifferent!590 (ListLongMap!22241 (_ BitVec 64) V!59149 (_ BitVec 64)) Unit!51487)

(assert (=> b!1549952 (= lt!667807 (addApplyDifferent!590 lt!667810 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49887 _keys!618) from!762)))))

(declare-fun contains!10109 (ListLongMap!22241 (_ BitVec 64)) Bool)

(assert (=> b!1549952 (contains!10109 (+!4979 lt!667810 (tuple2!24625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49887 _keys!618) from!762))))

(declare-fun lt!667806 () Unit!51487)

(declare-fun addStillContains!1251 (ListLongMap!22241 (_ BitVec 64) V!59149 (_ BitVec 64)) Unit!51487)

(assert (=> b!1549952 (= lt!667806 (addStillContains!1251 lt!667810 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49887 _keys!618) from!762)))))

(assert (=> b!1549952 (= lt!667810 (getCurrentListMapNoExtraKeys!6610 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549953 () Bool)

(declare-fun e!862897 () Bool)

(declare-fun tp_is_empty!38029 () Bool)

(assert (=> b!1549953 (= e!862897 tp_is_empty!38029)))

(declare-fun b!1549954 () Bool)

(declare-fun call!70025 () ListLongMap!22241)

(assert (=> b!1549954 (= e!862901 (+!4979 call!70025 (tuple2!24625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549955 () Bool)

(declare-fun e!862903 () ListLongMap!22241)

(declare-fun call!70028 () ListLongMap!22241)

(assert (=> b!1549955 (= e!862903 call!70028)))

(declare-fun mapIsEmpty!58747 () Bool)

(declare-fun mapRes!58747 () Bool)

(assert (=> mapIsEmpty!58747 mapRes!58747))

(declare-fun res!1061576 () Bool)

(assert (=> start!132452 (=> (not res!1061576) (not e!862899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132452 (= res!1061576 (validMask!0 mask!926))))

(assert (=> start!132452 e!862899))

(declare-fun array_inv!39059 (array!103384) Bool)

(assert (=> start!132452 (array_inv!39059 _keys!618)))

(assert (=> start!132452 tp_is_empty!38029))

(assert (=> start!132452 true))

(assert (=> start!132452 tp!111510))

(declare-fun e!862902 () Bool)

(declare-fun array_inv!39060 (array!103386) Bool)

(assert (=> start!132452 (and (array_inv!39060 _values!470) e!862902)))

(declare-fun b!1549956 () Bool)

(declare-fun call!70029 () ListLongMap!22241)

(assert (=> b!1549956 (= e!862903 call!70029)))

(declare-fun b!1549957 () Bool)

(assert (=> b!1549957 (= e!862904 call!70029)))

(declare-fun b!1549958 () Bool)

(declare-fun res!1061574 () Bool)

(assert (=> b!1549958 (=> (not res!1061574) (not e!862899))))

(assert (=> b!1549958 (= res!1061574 (and (= (size!50439 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50438 _keys!618) (size!50439 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549959 () Bool)

(declare-fun e!862905 () Bool)

(assert (=> b!1549959 (= e!862902 (and e!862905 mapRes!58747))))

(declare-fun condMapEmpty!58747 () Bool)

(declare-fun mapDefault!58747 () ValueCell!18104)

(assert (=> b!1549959 (= condMapEmpty!58747 (= (arr!49888 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18104)) mapDefault!58747)))))

(declare-fun b!1549960 () Bool)

(declare-fun res!1061579 () Bool)

(assert (=> b!1549960 (=> (not res!1061579) (not e!862899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103384 (_ BitVec 32)) Bool)

(assert (=> b!1549960 (= res!1061579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun call!70027 () ListLongMap!22241)

(declare-fun c!142819 () Bool)

(declare-fun bm!70023 () Bool)

(assert (=> bm!70023 (= call!70025 (+!4979 (ite c!142819 call!70026 (ite c!142817 call!70027 call!70028)) (ite (or c!142819 c!142817) (tuple2!24625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549961 () Bool)

(assert (=> b!1549961 (= e!862905 tp_is_empty!38029)))

(declare-fun bm!70024 () Bool)

(assert (=> bm!70024 (= call!70028 call!70027)))

(declare-fun b!1549962 () Bool)

(declare-fun res!1061575 () Bool)

(assert (=> b!1549962 (=> (not res!1061575) (not e!862899))))

(declare-datatypes ((List!36103 0))(
  ( (Nil!36100) (Cons!36099 (h!37562 (_ BitVec 64)) (t!50789 List!36103)) )
))
(declare-fun arrayNoDuplicates!0 (array!103384 (_ BitVec 32) List!36103) Bool)

(assert (=> b!1549962 (= res!1061575 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36100))))

(declare-fun b!1549963 () Bool)

(assert (=> b!1549963 (= e!862899 e!862898)))

(declare-fun res!1061578 () Bool)

(assert (=> b!1549963 (=> (not res!1061578) (not e!862898))))

(assert (=> b!1549963 (= res!1061578 (bvslt from!762 (size!50438 _keys!618)))))

(declare-fun lt!667809 () ListLongMap!22241)

(assert (=> b!1549963 (= lt!667809 e!862901)))

(assert (=> b!1549963 (= c!142819 (and (not lt!667808) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549963 (= lt!667808 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549964 () Bool)

(declare-fun c!142818 () Bool)

(assert (=> b!1549964 (= c!142818 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667808))))

(assert (=> b!1549964 (= e!862904 e!862903)))

(declare-fun mapNonEmpty!58747 () Bool)

(declare-fun tp!111511 () Bool)

(assert (=> mapNonEmpty!58747 (= mapRes!58747 (and tp!111511 e!862897))))

(declare-fun mapKey!58747 () (_ BitVec 32))

(declare-fun mapRest!58747 () (Array (_ BitVec 32) ValueCell!18104))

(declare-fun mapValue!58747 () ValueCell!18104)

(assert (=> mapNonEmpty!58747 (= (arr!49888 _values!470) (store mapRest!58747 mapKey!58747 mapValue!58747))))

(declare-fun bm!70025 () Bool)

(assert (=> bm!70025 (= call!70029 call!70025)))

(declare-fun bm!70026 () Bool)

(assert (=> bm!70026 (= call!70027 call!70026)))

(assert (= (and start!132452 res!1061576) b!1549958))

(assert (= (and b!1549958 res!1061574) b!1549960))

(assert (= (and b!1549960 res!1061579) b!1549962))

(assert (= (and b!1549962 res!1061575) b!1549949))

(assert (= (and b!1549949 res!1061573) b!1549963))

(assert (= (and b!1549963 c!142819) b!1549954))

(assert (= (and b!1549963 (not c!142819)) b!1549950))

(assert (= (and b!1549950 c!142817) b!1549957))

(assert (= (and b!1549950 (not c!142817)) b!1549964))

(assert (= (and b!1549964 c!142818) b!1549956))

(assert (= (and b!1549964 (not c!142818)) b!1549955))

(assert (= (or b!1549956 b!1549955) bm!70024))

(assert (= (or b!1549957 bm!70024) bm!70026))

(assert (= (or b!1549957 b!1549956) bm!70025))

(assert (= (or b!1549954 bm!70026) bm!70022))

(assert (= (or b!1549954 bm!70025) bm!70023))

(assert (= (and b!1549963 res!1061578) b!1549951))

(assert (= (and b!1549951 res!1061577) b!1549952))

(assert (= (and b!1549959 condMapEmpty!58747) mapIsEmpty!58747))

(assert (= (and b!1549959 (not condMapEmpty!58747)) mapNonEmpty!58747))

(get-info :version)

(assert (= (and mapNonEmpty!58747 ((_ is ValueCellFull!18104) mapValue!58747)) b!1549953))

(assert (= (and b!1549959 ((_ is ValueCellFull!18104) mapDefault!58747)) b!1549961))

(assert (= start!132452 b!1549959))

(declare-fun m!1429371 () Bool)

(assert (=> mapNonEmpty!58747 m!1429371))

(declare-fun m!1429373 () Bool)

(assert (=> start!132452 m!1429373))

(declare-fun m!1429375 () Bool)

(assert (=> start!132452 m!1429375))

(declare-fun m!1429377 () Bool)

(assert (=> start!132452 m!1429377))

(declare-fun m!1429379 () Bool)

(assert (=> b!1549952 m!1429379))

(declare-fun m!1429381 () Bool)

(assert (=> b!1549952 m!1429381))

(declare-fun m!1429383 () Bool)

(assert (=> b!1549952 m!1429383))

(assert (=> b!1549952 m!1429381))

(assert (=> b!1549952 m!1429379))

(assert (=> b!1549952 m!1429381))

(declare-fun m!1429385 () Bool)

(assert (=> b!1549952 m!1429385))

(declare-fun m!1429387 () Bool)

(assert (=> b!1549952 m!1429387))

(assert (=> b!1549952 m!1429381))

(declare-fun m!1429389 () Bool)

(assert (=> b!1549952 m!1429389))

(assert (=> b!1549952 m!1429381))

(declare-fun m!1429391 () Bool)

(assert (=> b!1549952 m!1429391))

(assert (=> b!1549952 m!1429387))

(declare-fun m!1429393 () Bool)

(assert (=> b!1549952 m!1429393))

(assert (=> b!1549952 m!1429381))

(declare-fun m!1429395 () Bool)

(assert (=> b!1549952 m!1429395))

(declare-fun m!1429397 () Bool)

(assert (=> b!1549960 m!1429397))

(assert (=> bm!70022 m!1429393))

(assert (=> b!1549951 m!1429381))

(assert (=> b!1549951 m!1429381))

(declare-fun m!1429399 () Bool)

(assert (=> b!1549951 m!1429399))

(declare-fun m!1429401 () Bool)

(assert (=> b!1549954 m!1429401))

(declare-fun m!1429403 () Bool)

(assert (=> b!1549962 m!1429403))

(declare-fun m!1429405 () Bool)

(assert (=> bm!70023 m!1429405))

(check-sat (not start!132452) (not b!1549960) (not mapNonEmpty!58747) (not bm!70022) tp_is_empty!38029 (not b_next!31753) (not b!1549954) b_and!51165 (not bm!70023) (not b!1549951) (not b!1549962) (not b!1549952))
(check-sat b_and!51165 (not b_next!31753))
