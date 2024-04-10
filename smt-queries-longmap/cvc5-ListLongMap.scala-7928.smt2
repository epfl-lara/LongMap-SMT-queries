; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98408 () Bool)

(assert start!98408)

(declare-fun b_free!24013 () Bool)

(declare-fun b_next!24013 () Bool)

(assert (=> start!98408 (= b_free!24013 (not b_next!24013))))

(declare-fun tp!84749 () Bool)

(declare-fun b_and!38875 () Bool)

(assert (=> start!98408 (= tp!84749 b_and!38875)))

(declare-datatypes ((V!43185 0))(
  ( (V!43186 (val!14328 Int)) )
))
(declare-fun zeroValue!944 () V!43185)

(declare-datatypes ((array!73947 0))(
  ( (array!73948 (arr!35624 (Array (_ BitVec 32) (_ BitVec 64))) (size!36160 (_ BitVec 32))) )
))
(declare-fun lt!504964 () array!73947)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!49695 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13562 0))(
  ( (ValueCellFull!13562 (v!16965 V!43185)) (EmptyCell!13562) )
))
(declare-datatypes ((array!73949 0))(
  ( (array!73950 (arr!35625 (Array (_ BitVec 32) ValueCell!13562)) (size!36161 (_ BitVec 32))) )
))
(declare-fun lt!504972 () array!73949)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18084 0))(
  ( (tuple2!18085 (_1!9053 (_ BitVec 64)) (_2!9053 V!43185)) )
))
(declare-datatypes ((List!24843 0))(
  ( (Nil!24840) (Cons!24839 (h!26048 tuple2!18084) (t!35848 List!24843)) )
))
(declare-datatypes ((ListLongMap!16053 0))(
  ( (ListLongMap!16054 (toList!8042 List!24843)) )
))
(declare-fun call!49698 () ListLongMap!16053)

(declare-fun minValue!944 () V!43185)

(declare-fun getCurrentListMapNoExtraKeys!4527 (array!73947 array!73949 (_ BitVec 32) (_ BitVec 32) V!43185 V!43185 (_ BitVec 32) Int) ListLongMap!16053)

(assert (=> bm!49695 (= call!49698 (getCurrentListMapNoExtraKeys!4527 lt!504964 lt!504972 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135837 () Bool)

(declare-fun res!758143 () Bool)

(declare-fun e!646368 () Bool)

(assert (=> b!1135837 (=> (not res!758143) (not e!646368))))

(declare-datatypes ((List!24844 0))(
  ( (Nil!24841) (Cons!24840 (h!26049 (_ BitVec 64)) (t!35849 List!24844)) )
))
(declare-fun arrayNoDuplicates!0 (array!73947 (_ BitVec 32) List!24844) Bool)

(assert (=> b!1135837 (= res!758143 (arrayNoDuplicates!0 lt!504964 #b00000000000000000000000000000000 Nil!24841))))

(declare-fun c!111003 () Bool)

(declare-fun call!49699 () ListLongMap!16053)

(declare-fun call!49703 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!504971 () ListLongMap!16053)

(declare-fun bm!49696 () Bool)

(declare-fun contains!6576 (ListLongMap!16053 (_ BitVec 64)) Bool)

(assert (=> bm!49696 (= call!49703 (contains!6576 (ite c!111003 lt!504971 call!49699) k!934))))

(declare-fun b!1135838 () Bool)

(declare-fun e!646367 () Bool)

(assert (=> b!1135838 (= e!646367 e!646368)))

(declare-fun res!758146 () Bool)

(assert (=> b!1135838 (=> (not res!758146) (not e!646368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73947 (_ BitVec 32)) Bool)

(assert (=> b!1135838 (= res!758146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504964 mask!1564))))

(declare-fun _keys!1208 () array!73947)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135838 (= lt!504964 (array!73948 (store (arr!35624 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36160 _keys!1208)))))

(declare-fun b!1135839 () Bool)

(declare-datatypes ((Unit!37201 0))(
  ( (Unit!37202) )
))
(declare-fun e!646375 () Unit!37201)

(declare-fun lt!504965 () Unit!37201)

(assert (=> b!1135839 (= e!646375 lt!504965)))

(declare-fun lt!504967 () Unit!37201)

(declare-fun lt!504966 () ListLongMap!16053)

(declare-fun addStillContains!740 (ListLongMap!16053 (_ BitVec 64) V!43185 (_ BitVec 64)) Unit!37201)

(assert (=> b!1135839 (= lt!504967 (addStillContains!740 lt!504966 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun call!49705 () ListLongMap!16053)

(assert (=> b!1135839 (= lt!504971 call!49705)))

(assert (=> b!1135839 call!49703))

(declare-fun call!49704 () Unit!37201)

(assert (=> b!1135839 (= lt!504965 call!49704)))

(declare-fun +!3478 (ListLongMap!16053 tuple2!18084) ListLongMap!16053)

(assert (=> b!1135839 (contains!6576 (+!3478 lt!504971 (tuple2!18085 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun bm!49697 () Bool)

(declare-fun call!49702 () Unit!37201)

(assert (=> bm!49697 (= call!49702 call!49704)))

(declare-fun b!1135840 () Bool)

(declare-fun e!646374 () Bool)

(assert (=> b!1135840 (= e!646368 (not e!646374))))

(declare-fun res!758145 () Bool)

(assert (=> b!1135840 (=> res!758145 e!646374)))

(assert (=> b!1135840 (= res!758145 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135840 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!504962 () Unit!37201)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73947 (_ BitVec 64) (_ BitVec 32)) Unit!37201)

(assert (=> b!1135840 (= lt!504962 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun c!111000 () Bool)

(declare-fun bm!49698 () Bool)

(assert (=> bm!49698 (= call!49705 (+!3478 lt!504966 (ite (or c!111003 c!111000) (tuple2!18085 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18085 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1135841 () Bool)

(declare-fun e!646372 () Unit!37201)

(assert (=> b!1135841 (= e!646375 e!646372)))

(declare-fun lt!504974 () Bool)

(assert (=> b!1135841 (= c!111000 (and (not lt!504974) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1135842 () Bool)

(declare-fun e!646370 () Bool)

(assert (=> b!1135842 (= e!646370 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135843 () Bool)

(declare-fun res!758152 () Bool)

(assert (=> b!1135843 (=> (not res!758152) (not e!646367))))

(assert (=> b!1135843 (= res!758152 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24841))))

(declare-fun res!758141 () Bool)

(assert (=> start!98408 (=> (not res!758141) (not e!646367))))

(assert (=> start!98408 (= res!758141 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36160 _keys!1208))))))

(assert (=> start!98408 e!646367))

(declare-fun tp_is_empty!28543 () Bool)

(assert (=> start!98408 tp_is_empty!28543))

(declare-fun array_inv!27316 (array!73947) Bool)

(assert (=> start!98408 (array_inv!27316 _keys!1208)))

(assert (=> start!98408 true))

(assert (=> start!98408 tp!84749))

(declare-fun _values!996 () array!73949)

(declare-fun e!646381 () Bool)

(declare-fun array_inv!27317 (array!73949) Bool)

(assert (=> start!98408 (and (array_inv!27317 _values!996) e!646381)))

(declare-fun bm!49699 () Bool)

(assert (=> bm!49699 (= call!49704 (addStillContains!740 (ite c!111003 lt!504971 lt!504966) (ite c!111003 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111000 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111003 minValue!944 (ite c!111000 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1135844 () Bool)

(declare-fun e!646382 () Bool)

(declare-fun e!646378 () Bool)

(assert (=> b!1135844 (= e!646382 e!646378)))

(declare-fun res!758153 () Bool)

(assert (=> b!1135844 (=> res!758153 e!646378)))

(assert (=> b!1135844 (= res!758153 (or (bvsge (size!36160 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36160 _keys!1208)) (bvsge from!1455 (size!36160 _keys!1208))))))

(assert (=> b!1135844 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24841)))

(declare-fun lt!504963 () Unit!37201)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73947 (_ BitVec 32) (_ BitVec 32)) Unit!37201)

(assert (=> b!1135844 (= lt!504963 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1135844 e!646370))

(declare-fun res!758142 () Bool)

(assert (=> b!1135844 (=> (not res!758142) (not e!646370))))

(declare-fun e!646371 () Bool)

(assert (=> b!1135844 (= res!758142 e!646371)))

(declare-fun c!111004 () Bool)

(assert (=> b!1135844 (= c!111004 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504976 () Unit!37201)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!345 (array!73947 array!73949 (_ BitVec 32) (_ BitVec 32) V!43185 V!43185 (_ BitVec 64) (_ BitVec 32) Int) Unit!37201)

(assert (=> b!1135844 (= lt!504976 (lemmaListMapContainsThenArrayContainsFrom!345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504977 () Unit!37201)

(assert (=> b!1135844 (= lt!504977 e!646375)))

(assert (=> b!1135844 (= c!111003 (and (not lt!504974) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135844 (= lt!504974 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!44639 () Bool)

(declare-fun mapRes!44639 () Bool)

(declare-fun tp!84750 () Bool)

(declare-fun e!646369 () Bool)

(assert (=> mapNonEmpty!44639 (= mapRes!44639 (and tp!84750 e!646369))))

(declare-fun mapKey!44639 () (_ BitVec 32))

(declare-fun mapValue!44639 () ValueCell!13562)

(declare-fun mapRest!44639 () (Array (_ BitVec 32) ValueCell!13562))

(assert (=> mapNonEmpty!44639 (= (arr!35625 _values!996) (store mapRest!44639 mapKey!44639 mapValue!44639))))

(declare-fun b!1135845 () Bool)

(declare-fun e!646383 () Unit!37201)

(declare-fun Unit!37203 () Unit!37201)

(assert (=> b!1135845 (= e!646383 Unit!37203)))

(declare-fun mapIsEmpty!44639 () Bool)

(assert (=> mapIsEmpty!44639 mapRes!44639))

(declare-fun b!1135846 () Bool)

(declare-fun res!758147 () Bool)

(assert (=> b!1135846 (=> (not res!758147) (not e!646367))))

(assert (=> b!1135846 (= res!758147 (and (= (size!36161 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36160 _keys!1208) (size!36161 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1135847 () Bool)

(assert (=> b!1135847 (= e!646371 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135848 () Bool)

(declare-fun e!646377 () Bool)

(declare-fun call!49700 () ListLongMap!16053)

(assert (=> b!1135848 (= e!646377 (= call!49698 call!49700))))

(declare-fun b!1135849 () Bool)

(assert (=> b!1135849 (= e!646371 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504974) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1135850 () Bool)

(declare-fun e!646379 () Bool)

(assert (=> b!1135850 (= e!646381 (and e!646379 mapRes!44639))))

(declare-fun condMapEmpty!44639 () Bool)

(declare-fun mapDefault!44639 () ValueCell!13562)

