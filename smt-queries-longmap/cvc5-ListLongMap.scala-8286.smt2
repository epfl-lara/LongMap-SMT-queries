; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100988 () Bool)

(assert start!100988)

(declare-fun b_free!25987 () Bool)

(declare-fun b_next!25987 () Bool)

(assert (=> start!100988 (= b_free!25987 (not b_next!25987))))

(declare-fun tp!90977 () Bool)

(declare-fun b_and!43055 () Bool)

(assert (=> start!100988 (= tp!90977 b_and!43055)))

(declare-fun b!1209123 () Bool)

(declare-fun e!686723 () Bool)

(declare-fun e!686728 () Bool)

(assert (=> b!1209123 (= e!686723 e!686728)))

(declare-fun res!803631 () Bool)

(assert (=> b!1209123 (=> res!803631 e!686728)))

(declare-datatypes ((V!46049 0))(
  ( (V!46050 (val!15402 Int)) )
))
(declare-datatypes ((tuple2!19770 0))(
  ( (tuple2!19771 (_1!9896 (_ BitVec 64)) (_2!9896 V!46049)) )
))
(declare-datatypes ((List!26572 0))(
  ( (Nil!26569) (Cons!26568 (h!27777 tuple2!19770) (t!39539 List!26572)) )
))
(declare-datatypes ((ListLongMap!17739 0))(
  ( (ListLongMap!17740 (toList!8885 List!26572)) )
))
(declare-fun lt!548817 () ListLongMap!17739)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6951 (ListLongMap!17739 (_ BitVec 64)) Bool)

(assert (=> b!1209123 (= res!803631 (not (contains!6951 lt!548817 k!934)))))

(declare-fun zeroValue!944 () V!46049)

(declare-datatypes ((array!78167 0))(
  ( (array!78168 (arr!37720 (Array (_ BitVec 32) (_ BitVec 64))) (size!38256 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78167)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!46049)

(declare-datatypes ((ValueCell!14636 0))(
  ( (ValueCellFull!14636 (v!18053 V!46049)) (EmptyCell!14636) )
))
(declare-datatypes ((array!78169 0))(
  ( (array!78170 (arr!37721 (Array (_ BitVec 32) ValueCell!14636)) (size!38257 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78169)

(declare-fun getCurrentListMapNoExtraKeys!5319 (array!78167 array!78169 (_ BitVec 32) (_ BitVec 32) V!46049 V!46049 (_ BitVec 32) Int) ListLongMap!17739)

(assert (=> b!1209123 (= lt!548817 (getCurrentListMapNoExtraKeys!5319 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209124 () Bool)

(declare-datatypes ((Unit!40074 0))(
  ( (Unit!40075) )
))
(declare-fun e!686735 () Unit!40074)

(declare-fun e!686720 () Unit!40074)

(assert (=> b!1209124 (= e!686735 e!686720)))

(declare-fun c!119023 () Bool)

(declare-fun lt!548825 () Bool)

(assert (=> b!1209124 (= c!119023 (and (not lt!548825) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!47905 () Bool)

(declare-fun mapRes!47905 () Bool)

(declare-fun tp!90976 () Bool)

(declare-fun e!686734 () Bool)

(assert (=> mapNonEmpty!47905 (= mapRes!47905 (and tp!90976 e!686734))))

(declare-fun mapValue!47905 () ValueCell!14636)

(declare-fun mapKey!47905 () (_ BitVec 32))

(declare-fun mapRest!47905 () (Array (_ BitVec 32) ValueCell!14636))

(assert (=> mapNonEmpty!47905 (= (arr!37721 _values!996) (store mapRest!47905 mapKey!47905 mapValue!47905))))

(declare-fun b!1209125 () Bool)

(declare-fun tp_is_empty!30691 () Bool)

(assert (=> b!1209125 (= e!686734 tp_is_empty!30691)))

(declare-fun call!59292 () ListLongMap!17739)

(declare-fun call!59287 () ListLongMap!17739)

(declare-fun b!1209126 () Bool)

(declare-fun e!686722 () Bool)

(declare-fun -!1839 (ListLongMap!17739 (_ BitVec 64)) ListLongMap!17739)

(assert (=> b!1209126 (= e!686722 (= call!59287 (-!1839 call!59292 k!934)))))

(declare-fun b!1209127 () Bool)

(declare-fun e!686730 () Unit!40074)

(declare-fun Unit!40076 () Unit!40074)

(assert (=> b!1209127 (= e!686730 Unit!40076)))

(declare-fun b!1209128 () Bool)

(declare-fun e!686732 () Bool)

(declare-fun e!686721 () Bool)

(assert (=> b!1209128 (= e!686732 (not e!686721))))

(declare-fun res!803640 () Bool)

(assert (=> b!1209128 (=> res!803640 e!686721)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209128 (= res!803640 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209128 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!548821 () Unit!40074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78167 (_ BitVec 64) (_ BitVec 32)) Unit!40074)

(assert (=> b!1209128 (= lt!548821 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!803627 () Bool)

(declare-fun e!686719 () Bool)

(assert (=> start!100988 (=> (not res!803627) (not e!686719))))

(assert (=> start!100988 (= res!803627 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38256 _keys!1208))))))

(assert (=> start!100988 e!686719))

(assert (=> start!100988 tp_is_empty!30691))

(declare-fun array_inv!28732 (array!78167) Bool)

(assert (=> start!100988 (array_inv!28732 _keys!1208)))

(assert (=> start!100988 true))

(assert (=> start!100988 tp!90977))

(declare-fun e!686724 () Bool)

(declare-fun array_inv!28733 (array!78169) Bool)

(assert (=> start!100988 (and (array_inv!28733 _values!996) e!686724)))

(declare-fun b!1209129 () Bool)

(declare-fun e!686727 () Bool)

(assert (=> b!1209129 (= e!686727 e!686723)))

(declare-fun res!803633 () Bool)

(assert (=> b!1209129 (=> res!803633 e!686723)))

(assert (=> b!1209129 (= res!803633 (not (= (select (arr!37720 _keys!1208) from!1455) k!934)))))

(assert (=> b!1209129 e!686722))

(declare-fun c!119024 () Bool)

(assert (=> b!1209129 (= c!119024 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548827 () Unit!40074)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1047 (array!78167 array!78169 (_ BitVec 32) (_ BitVec 32) V!46049 V!46049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40074)

(assert (=> b!1209129 (= lt!548827 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1047 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209130 () Bool)

(declare-fun c!119021 () Bool)

(assert (=> b!1209130 (= c!119021 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548825))))

(assert (=> b!1209130 (= e!686720 e!686730)))

(declare-fun bm!59282 () Bool)

(declare-fun call!59290 () Unit!40074)

(declare-fun call!59286 () Unit!40074)

(assert (=> bm!59282 (= call!59290 call!59286)))

(declare-fun b!1209131 () Bool)

(declare-fun res!803634 () Bool)

(assert (=> b!1209131 (=> (not res!803634) (not e!686719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209131 (= res!803634 (validMask!0 mask!1564))))

(declare-fun b!1209132 () Bool)

(declare-fun e!686731 () Bool)

(assert (=> b!1209132 (= e!686731 tp_is_empty!30691)))

(declare-fun bm!59283 () Bool)

(declare-fun call!59285 () ListLongMap!17739)

(declare-fun call!59288 () ListLongMap!17739)

(assert (=> bm!59283 (= call!59285 call!59288)))

(declare-fun b!1209133 () Bool)

(declare-fun lt!548815 () Unit!40074)

(assert (=> b!1209133 (= e!686735 lt!548815)))

(declare-fun lt!548820 () Unit!40074)

(declare-fun addStillContains!1033 (ListLongMap!17739 (_ BitVec 64) V!46049 (_ BitVec 64)) Unit!40074)

(assert (=> b!1209133 (= lt!548820 (addStillContains!1033 lt!548817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!548811 () ListLongMap!17739)

(declare-fun +!4004 (ListLongMap!17739 tuple2!19770) ListLongMap!17739)

(assert (=> b!1209133 (= lt!548811 (+!4004 lt!548817 (tuple2!19771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!59291 () Bool)

(assert (=> b!1209133 call!59291))

(assert (=> b!1209133 (= lt!548815 call!59286)))

(assert (=> b!1209133 (contains!6951 call!59288 k!934)))

(declare-fun b!1209134 () Bool)

(assert (=> b!1209134 (= e!686724 (and e!686731 mapRes!47905))))

(declare-fun condMapEmpty!47905 () Bool)

(declare-fun mapDefault!47905 () ValueCell!14636)

