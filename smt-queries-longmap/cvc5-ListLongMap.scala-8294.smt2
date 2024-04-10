; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101074 () Bool)

(assert start!101074)

(declare-fun b_free!26035 () Bool)

(declare-fun b_next!26035 () Bool)

(assert (=> start!101074 (= b_free!26035 (not b_next!26035))))

(declare-fun tp!91123 () Bool)

(declare-fun b_and!43169 () Bool)

(assert (=> start!101074 (= tp!91123 b_and!43169)))

(declare-fun b!1211469 () Bool)

(declare-datatypes ((Unit!40168 0))(
  ( (Unit!40169) )
))
(declare-fun e!688017 () Unit!40168)

(declare-fun lt!550277 () Unit!40168)

(assert (=> b!1211469 (= e!688017 lt!550277)))

(declare-fun call!59888 () Unit!40168)

(assert (=> b!1211469 (= lt!550277 call!59888)))

(declare-fun call!59883 () Bool)

(assert (=> b!1211469 call!59883))

(declare-fun b!1211470 () Bool)

(declare-fun c!119478 () Bool)

(declare-fun lt!550270 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1211470 (= c!119478 (and (not lt!550270) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!688025 () Unit!40168)

(assert (=> b!1211470 (= e!688025 e!688017)))

(declare-datatypes ((V!46113 0))(
  ( (V!46114 (val!15426 Int)) )
))
(declare-fun zeroValue!944 () V!46113)

(declare-fun bm!59879 () Bool)

(declare-fun call!59886 () Unit!40168)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!19816 0))(
  ( (tuple2!19817 (_1!9919 (_ BitVec 64)) (_2!9919 V!46113)) )
))
(declare-datatypes ((List!26617 0))(
  ( (Nil!26614) (Cons!26613 (h!27822 tuple2!19816) (t!39632 List!26617)) )
))
(declare-datatypes ((ListLongMap!17785 0))(
  ( (ListLongMap!17786 (toList!8908 List!26617)) )
))
(declare-fun lt!550268 () ListLongMap!17785)

(declare-fun minValue!944 () V!46113)

(declare-fun lt!550280 () ListLongMap!17785)

(declare-fun c!119479 () Bool)

(declare-fun addStillContains!1053 (ListLongMap!17785 (_ BitVec 64) V!46113 (_ BitVec 64)) Unit!40168)

(assert (=> bm!59879 (= call!59886 (addStillContains!1053 (ite c!119479 lt!550268 lt!550280) (ite c!119479 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119478 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119479 minValue!944 (ite c!119478 zeroValue!944 minValue!944)) k!934))))

(declare-fun call!59887 () ListLongMap!17785)

(declare-fun bm!59880 () Bool)

(declare-fun +!4026 (ListLongMap!17785 tuple2!19816) ListLongMap!17785)

(assert (=> bm!59880 (= call!59887 (+!4026 lt!550280 (ite (or c!119479 c!119478) (tuple2!19817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!688024 () Bool)

(declare-fun b!1211471 () Bool)

(assert (=> b!1211471 (= e!688024 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550270) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!804791 () Bool)

(declare-fun e!688014 () Bool)

(assert (=> start!101074 (=> (not res!804791) (not e!688014))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78265 0))(
  ( (array!78266 (arr!37768 (Array (_ BitVec 32) (_ BitVec 64))) (size!38304 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78265)

(assert (=> start!101074 (= res!804791 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38304 _keys!1208))))))

(assert (=> start!101074 e!688014))

(declare-fun tp_is_empty!30739 () Bool)

(assert (=> start!101074 tp_is_empty!30739))

(declare-fun array_inv!28768 (array!78265) Bool)

(assert (=> start!101074 (array_inv!28768 _keys!1208)))

(assert (=> start!101074 true))

(assert (=> start!101074 tp!91123))

(declare-datatypes ((ValueCell!14660 0))(
  ( (ValueCellFull!14660 (v!18078 V!46113)) (EmptyCell!14660) )
))
(declare-datatypes ((array!78267 0))(
  ( (array!78268 (arr!37769 (Array (_ BitVec 32) ValueCell!14660)) (size!38305 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78267)

(declare-fun e!688020 () Bool)

(declare-fun array_inv!28769 (array!78267) Bool)

(assert (=> start!101074 (and (array_inv!28769 _values!996) e!688020)))

(declare-fun b!1211472 () Bool)

(declare-fun res!804797 () Bool)

(assert (=> b!1211472 (=> (not res!804797) (not e!688014))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211472 (= res!804797 (validMask!0 mask!1564))))

(declare-fun lt!550283 () array!78265)

(declare-fun bm!59881 () Bool)

(declare-fun lt!550278 () array!78267)

(declare-fun call!59884 () ListLongMap!17785)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5340 (array!78265 array!78267 (_ BitVec 32) (_ BitVec 32) V!46113 V!46113 (_ BitVec 32) Int) ListLongMap!17785)

(assert (=> bm!59881 (= call!59884 (getCurrentListMapNoExtraKeys!5340 lt!550283 lt!550278 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211473 () Bool)

(declare-fun e!688028 () Bool)

(assert (=> b!1211473 (= e!688028 tp_is_empty!30739)))

(declare-fun b!1211474 () Bool)

(declare-fun e!688029 () Bool)

(assert (=> b!1211474 (= e!688014 e!688029)))

(declare-fun res!804795 () Bool)

(assert (=> b!1211474 (=> (not res!804795) (not e!688029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78265 (_ BitVec 32)) Bool)

(assert (=> b!1211474 (= res!804795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550283 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211474 (= lt!550283 (array!78266 (store (arr!37768 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38304 _keys!1208)))))

(declare-fun b!1211475 () Bool)

(declare-fun e!688015 () Bool)

(declare-fun e!688021 () Bool)

(assert (=> b!1211475 (= e!688015 e!688021)))

(declare-fun res!804794 () Bool)

(assert (=> b!1211475 (=> res!804794 e!688021)))

(assert (=> b!1211475 (= res!804794 (not (= (select (arr!37768 _keys!1208) from!1455) k!934)))))

(declare-fun e!688026 () Bool)

(assert (=> b!1211475 e!688026))

(declare-fun c!119476 () Bool)

(assert (=> b!1211475 (= c!119476 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550271 () Unit!40168)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1066 (array!78265 array!78267 (_ BitVec 32) (_ BitVec 32) V!46113 V!46113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40168)

(assert (=> b!1211475 (= lt!550271 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1066 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47980 () Bool)

(declare-fun mapRes!47980 () Bool)

(declare-fun tp!91124 () Bool)

(assert (=> mapNonEmpty!47980 (= mapRes!47980 (and tp!91124 e!688028))))

(declare-fun mapValue!47980 () ValueCell!14660)

(declare-fun mapRest!47980 () (Array (_ BitVec 32) ValueCell!14660))

(declare-fun mapKey!47980 () (_ BitVec 32))

(assert (=> mapNonEmpty!47980 (= (arr!37769 _values!996) (store mapRest!47980 mapKey!47980 mapValue!47980))))

(declare-fun b!1211476 () Bool)

(declare-fun e!688023 () Unit!40168)

(declare-fun Unit!40170 () Unit!40168)

(assert (=> b!1211476 (= e!688023 Unit!40170)))

(assert (=> b!1211476 (= lt!550270 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211476 (= c!119479 (and (not lt!550270) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550274 () Unit!40168)

(assert (=> b!1211476 (= lt!550274 e!688025)))

(declare-fun lt!550282 () Unit!40168)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!604 (array!78265 array!78267 (_ BitVec 32) (_ BitVec 32) V!46113 V!46113 (_ BitVec 64) (_ BitVec 32) Int) Unit!40168)

(assert (=> b!1211476 (= lt!550282 (lemmaListMapContainsThenArrayContainsFrom!604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119477 () Bool)

(assert (=> b!1211476 (= c!119477 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804803 () Bool)

(assert (=> b!1211476 (= res!804803 e!688024)))

(declare-fun e!688016 () Bool)

(assert (=> b!1211476 (=> (not res!804803) (not e!688016))))

(assert (=> b!1211476 e!688016))

(declare-fun lt!550272 () Unit!40168)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78265 (_ BitVec 32) (_ BitVec 32)) Unit!40168)

(assert (=> b!1211476 (= lt!550272 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26618 0))(
  ( (Nil!26615) (Cons!26614 (h!27823 (_ BitVec 64)) (t!39633 List!26618)) )
))
(declare-fun arrayNoDuplicates!0 (array!78265 (_ BitVec 32) List!26618) Bool)

(assert (=> b!1211476 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26615)))

(declare-fun lt!550275 () Unit!40168)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78265 (_ BitVec 64) (_ BitVec 32) List!26618) Unit!40168)

(assert (=> b!1211476 (= lt!550275 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26615))))

(assert (=> b!1211476 false))

(declare-fun b!1211477 () Bool)

(declare-fun res!804799 () Bool)

(assert (=> b!1211477 (=> (not res!804799) (not e!688014))))

(assert (=> b!1211477 (= res!804799 (= (select (arr!37768 _keys!1208) i!673) k!934))))

(declare-fun b!1211478 () Bool)

(declare-fun arrayContainsKey!0 (array!78265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211478 (= e!688024 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211479 () Bool)

(declare-fun e!688013 () Bool)

(assert (=> b!1211479 (= e!688013 tp_is_empty!30739)))

(declare-fun b!1211480 () Bool)

(declare-fun res!804796 () Bool)

(assert (=> b!1211480 (=> (not res!804796) (not e!688014))))

(assert (=> b!1211480 (= res!804796 (and (= (size!38305 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38304 _keys!1208) (size!38305 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1211481 () Bool)

(declare-fun Unit!40171 () Unit!40168)

(assert (=> b!1211481 (= e!688023 Unit!40171)))

(declare-fun b!1211482 () Bool)

(assert (=> b!1211482 (= e!688020 (and e!688013 mapRes!47980))))

(declare-fun condMapEmpty!47980 () Bool)

(declare-fun mapDefault!47980 () ValueCell!14660)

