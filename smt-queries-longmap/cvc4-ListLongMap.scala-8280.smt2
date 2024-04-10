; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100816 () Bool)

(assert start!100816)

(declare-fun b_free!25955 () Bool)

(declare-fun b_next!25955 () Bool)

(assert (=> start!100816 (= b_free!25955 (not b_next!25955))))

(declare-fun tp!90871 () Bool)

(declare-fun b_and!42911 () Bool)

(assert (=> start!100816 (= tp!90871 b_and!42911)))

(declare-datatypes ((V!46005 0))(
  ( (V!46006 (val!15386 Int)) )
))
(declare-fun zeroValue!944 () V!46005)

(declare-datatypes ((ValueCell!14620 0))(
  ( (ValueCellFull!14620 (v!18031 V!46005)) (EmptyCell!14620) )
))
(declare-datatypes ((array!78101 0))(
  ( (array!78102 (arr!37690 (Array (_ BitVec 32) ValueCell!14620)) (size!38226 (_ BitVec 32))) )
))
(declare-fun lt!547497 () array!78101)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!78103 0))(
  ( (array!78104 (arr!37691 (Array (_ BitVec 32) (_ BitVec 64))) (size!38227 (_ BitVec 32))) )
))
(declare-fun lt!547507 () array!78103)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!58806 () Bool)

(declare-fun minValue!944 () V!46005)

(declare-datatypes ((tuple2!19744 0))(
  ( (tuple2!19745 (_1!9883 (_ BitVec 64)) (_2!9883 V!46005)) )
))
(declare-datatypes ((List!26546 0))(
  ( (Nil!26543) (Cons!26542 (h!27751 tuple2!19744) (t!39481 List!26546)) )
))
(declare-datatypes ((ListLongMap!17713 0))(
  ( (ListLongMap!17714 (toList!8872 List!26546)) )
))
(declare-fun call!58815 () ListLongMap!17713)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5306 (array!78103 array!78101 (_ BitVec 32) (_ BitVec 32) V!46005 V!46005 (_ BitVec 32) Int) ListLongMap!17713)

(assert (=> bm!58806 (= call!58815 (getCurrentListMapNoExtraKeys!5306 lt!547507 lt!547497 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _keys!1208 () array!78103)

(declare-fun _values!996 () array!78101)

(declare-fun call!58811 () ListLongMap!17713)

(declare-fun bm!58807 () Bool)

(assert (=> bm!58807 (= call!58811 (getCurrentListMapNoExtraKeys!5306 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206807 () Bool)

(declare-fun e!685334 () Bool)

(assert (=> b!1206807 (= e!685334 (= call!58815 call!58811))))

(declare-fun res!802498 () Bool)

(declare-fun e!685337 () Bool)

(assert (=> start!100816 (=> (not res!802498) (not e!685337))))

(assert (=> start!100816 (= res!802498 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38227 _keys!1208))))))

(assert (=> start!100816 e!685337))

(declare-fun tp_is_empty!30659 () Bool)

(assert (=> start!100816 tp_is_empty!30659))

(declare-fun array_inv!28710 (array!78103) Bool)

(assert (=> start!100816 (array_inv!28710 _keys!1208)))

(assert (=> start!100816 true))

(assert (=> start!100816 tp!90871))

(declare-fun e!685341 () Bool)

(declare-fun array_inv!28711 (array!78101) Bool)

(assert (=> start!100816 (and (array_inv!28711 _values!996) e!685341)))

(declare-fun b!1206808 () Bool)

(declare-fun e!685345 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206808 (= e!685345 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58808 () Bool)

(declare-fun call!58812 () ListLongMap!17713)

(declare-fun call!58809 () ListLongMap!17713)

(assert (=> bm!58808 (= call!58812 call!58809)))

(declare-fun b!1206809 () Bool)

(declare-fun -!1829 (ListLongMap!17713 (_ BitVec 64)) ListLongMap!17713)

(assert (=> b!1206809 (= e!685334 (= call!58815 (-!1829 call!58811 k!934)))))

(declare-fun c!118537 () Bool)

(declare-fun bm!58809 () Bool)

(declare-fun c!118534 () Bool)

(declare-fun lt!547508 () ListLongMap!17713)

(declare-fun +!3993 (ListLongMap!17713 tuple2!19744) ListLongMap!17713)

(assert (=> bm!58809 (= call!58809 (+!3993 lt!547508 (ite (or c!118537 c!118534) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1206810 () Bool)

(declare-fun e!685344 () Bool)

(declare-fun e!685343 () Bool)

(assert (=> b!1206810 (= e!685344 (not e!685343))))

(declare-fun res!802492 () Bool)

(assert (=> b!1206810 (=> res!802492 e!685343)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206810 (= res!802492 (bvsgt from!1455 i!673))))

(assert (=> b!1206810 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40005 0))(
  ( (Unit!40006) )
))
(declare-fun lt!547496 () Unit!40005)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78103 (_ BitVec 64) (_ BitVec 32)) Unit!40005)

(assert (=> b!1206810 (= lt!547496 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun lt!547511 () Bool)

(declare-fun e!685342 () Bool)

(declare-fun b!1206811 () Bool)

(assert (=> b!1206811 (= e!685342 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547511) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206812 () Bool)

(declare-fun c!118538 () Bool)

(assert (=> b!1206812 (= c!118538 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547511))))

(declare-fun e!685336 () Unit!40005)

(declare-fun e!685335 () Unit!40005)

(assert (=> b!1206812 (= e!685336 e!685335)))

(declare-fun b!1206813 () Bool)

(declare-fun e!685348 () Unit!40005)

(assert (=> b!1206813 (= e!685348 e!685336)))

(assert (=> b!1206813 (= c!118534 (and (not lt!547511) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206814 () Bool)

(declare-fun res!802494 () Bool)

(assert (=> b!1206814 (=> (not res!802494) (not e!685337))))

(assert (=> b!1206814 (= res!802494 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38227 _keys!1208))))))

(declare-fun b!1206815 () Bool)

(assert (=> b!1206815 (= e!685342 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206816 () Bool)

(declare-fun res!802499 () Bool)

(assert (=> b!1206816 (=> (not res!802499) (not e!685337))))

(assert (=> b!1206816 (= res!802499 (and (= (size!38226 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38227 _keys!1208) (size!38226 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47847 () Bool)

(declare-fun mapRes!47847 () Bool)

(declare-fun tp!90870 () Bool)

(declare-fun e!685340 () Bool)

(assert (=> mapNonEmpty!47847 (= mapRes!47847 (and tp!90870 e!685340))))

(declare-fun mapKey!47847 () (_ BitVec 32))

(declare-fun mapValue!47847 () ValueCell!14620)

(declare-fun mapRest!47847 () (Array (_ BitVec 32) ValueCell!14620))

(assert (=> mapNonEmpty!47847 (= (arr!37690 _values!996) (store mapRest!47847 mapKey!47847 mapValue!47847))))

(declare-fun b!1206817 () Bool)

(declare-fun lt!547504 () Unit!40005)

(assert (=> b!1206817 (= e!685348 lt!547504)))

(declare-fun lt!547506 () Unit!40005)

(declare-fun call!58814 () Unit!40005)

(assert (=> b!1206817 (= lt!547506 call!58814)))

(declare-fun lt!547509 () ListLongMap!17713)

(assert (=> b!1206817 (= lt!547509 call!58809)))

(declare-fun call!58816 () Bool)

(assert (=> b!1206817 call!58816))

(declare-fun addStillContains!1022 (ListLongMap!17713 (_ BitVec 64) V!46005 (_ BitVec 64)) Unit!40005)

(assert (=> b!1206817 (= lt!547504 (addStillContains!1022 lt!547509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun contains!6931 (ListLongMap!17713 (_ BitVec 64)) Bool)

(assert (=> b!1206817 (contains!6931 (+!3993 lt!547509 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1206818 () Bool)

(declare-fun e!685339 () Bool)

(assert (=> b!1206818 (= e!685339 tp_is_empty!30659)))

(declare-fun b!1206819 () Bool)

(declare-fun res!802502 () Bool)

(assert (=> b!1206819 (=> (not res!802502) (not e!685337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206819 (= res!802502 (validKeyInArray!0 k!934))))

(declare-fun b!1206820 () Bool)

(declare-fun res!802500 () Bool)

(assert (=> b!1206820 (=> (not res!802500) (not e!685337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78103 (_ BitVec 32)) Bool)

(assert (=> b!1206820 (= res!802500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206821 () Bool)

(declare-fun e!685347 () Bool)

(assert (=> b!1206821 (= e!685347 true)))

(declare-datatypes ((List!26547 0))(
  ( (Nil!26544) (Cons!26543 (h!27752 (_ BitVec 64)) (t!39482 List!26547)) )
))
(declare-fun arrayNoDuplicates!0 (array!78103 (_ BitVec 32) List!26547) Bool)

(assert (=> b!1206821 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26544)))

(declare-fun lt!547498 () Unit!40005)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78103 (_ BitVec 32) (_ BitVec 32)) Unit!40005)

(assert (=> b!1206821 (= lt!547498 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1206821 e!685345))

(declare-fun res!802491 () Bool)

(assert (=> b!1206821 (=> (not res!802491) (not e!685345))))

(assert (=> b!1206821 (= res!802491 e!685342)))

(declare-fun c!118536 () Bool)

(assert (=> b!1206821 (= c!118536 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547510 () Unit!40005)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!576 (array!78103 array!78101 (_ BitVec 32) (_ BitVec 32) V!46005 V!46005 (_ BitVec 64) (_ BitVec 32) Int) Unit!40005)

(assert (=> b!1206821 (= lt!547510 (lemmaListMapContainsThenArrayContainsFrom!576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547500 () Unit!40005)

(assert (=> b!1206821 (= lt!547500 e!685348)))

(assert (=> b!1206821 (= c!118537 (and (not lt!547511) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206821 (= lt!547511 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206822 () Bool)

(declare-fun e!685338 () Bool)

(declare-fun e!685349 () Bool)

(assert (=> b!1206822 (= e!685338 e!685349)))

(declare-fun res!802495 () Bool)

(assert (=> b!1206822 (=> res!802495 e!685349)))

(assert (=> b!1206822 (= res!802495 (not (= (select (arr!37691 _keys!1208) from!1455) k!934)))))

(assert (=> b!1206822 e!685334))

(declare-fun c!118535 () Bool)

(assert (=> b!1206822 (= c!118535 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547503 () Unit!40005)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1036 (array!78103 array!78101 (_ BitVec 32) (_ BitVec 32) V!46005 V!46005 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40005)

(assert (=> b!1206822 (= lt!547503 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1036 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206823 () Bool)

(declare-fun res!802496 () Bool)

(assert (=> b!1206823 (=> (not res!802496) (not e!685337))))

(assert (=> b!1206823 (= res!802496 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26544))))

(declare-fun b!1206824 () Bool)

(assert (=> b!1206824 (= e!685337 e!685344)))

(declare-fun res!802489 () Bool)

(assert (=> b!1206824 (=> (not res!802489) (not e!685344))))

(assert (=> b!1206824 (= res!802489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547507 mask!1564))))

(assert (=> b!1206824 (= lt!547507 (array!78104 (store (arr!37691 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38227 _keys!1208)))))

(declare-fun mapIsEmpty!47847 () Bool)

(assert (=> mapIsEmpty!47847 mapRes!47847))

(declare-fun bm!58810 () Bool)

(assert (=> bm!58810 (= call!58816 (contains!6931 (ite c!118537 lt!547509 call!58812) k!934))))

(declare-fun b!1206825 () Bool)

(assert (=> b!1206825 (= e!685340 tp_is_empty!30659)))

(declare-fun b!1206826 () Bool)

(assert (=> b!1206826 (= e!685349 e!685347)))

(declare-fun res!802503 () Bool)

(assert (=> b!1206826 (=> res!802503 e!685347)))

(assert (=> b!1206826 (= res!802503 (not (contains!6931 lt!547508 k!934)))))

(assert (=> b!1206826 (= lt!547508 (getCurrentListMapNoExtraKeys!5306 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206827 () Bool)

(declare-fun res!802497 () Bool)

(assert (=> b!1206827 (=> (not res!802497) (not e!685344))))

(assert (=> b!1206827 (= res!802497 (arrayNoDuplicates!0 lt!547507 #b00000000000000000000000000000000 Nil!26544))))

(declare-fun b!1206828 () Bool)

(assert (=> b!1206828 (= e!685341 (and e!685339 mapRes!47847))))

(declare-fun condMapEmpty!47847 () Bool)

(declare-fun mapDefault!47847 () ValueCell!14620)

