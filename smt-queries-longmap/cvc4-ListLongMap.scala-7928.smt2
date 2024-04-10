; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98412 () Bool)

(assert start!98412)

(declare-fun b_free!24017 () Bool)

(declare-fun b_next!24017 () Bool)

(assert (=> start!98412 (= b_free!24017 (not b_next!24017))))

(declare-fun tp!84762 () Bool)

(declare-fun b_and!38883 () Bool)

(assert (=> start!98412 (= tp!84762 b_and!38883)))

(declare-fun e!646475 () Bool)

(declare-fun b!1136027 () Bool)

(declare-datatypes ((V!43189 0))(
  ( (V!43190 (val!14330 Int)) )
))
(declare-datatypes ((tuple2!18088 0))(
  ( (tuple2!18089 (_1!9055 (_ BitVec 64)) (_2!9055 V!43189)) )
))
(declare-datatypes ((List!24847 0))(
  ( (Nil!24844) (Cons!24843 (h!26052 tuple2!18088) (t!35856 List!24847)) )
))
(declare-datatypes ((ListLongMap!16057 0))(
  ( (ListLongMap!16058 (toList!8044 List!24847)) )
))
(declare-fun call!49748 () ListLongMap!16057)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!49752 () ListLongMap!16057)

(declare-fun -!1205 (ListLongMap!16057 (_ BitVec 64)) ListLongMap!16057)

(assert (=> b!1136027 (= e!646475 (= call!49748 (-!1205 call!49752 k!934)))))

(declare-fun bm!49743 () Bool)

(declare-fun call!49746 () ListLongMap!16057)

(declare-fun lt!505076 () ListLongMap!16057)

(declare-fun call!49751 () Bool)

(declare-fun c!111033 () Bool)

(declare-fun contains!6579 (ListLongMap!16057 (_ BitVec 64)) Bool)

(assert (=> bm!49743 (= call!49751 (contains!6579 (ite c!111033 lt!505076 call!49746) k!934))))

(declare-fun b!1136028 () Bool)

(declare-fun res!758246 () Bool)

(declare-fun e!646473 () Bool)

(assert (=> b!1136028 (=> (not res!758246) (not e!646473))))

(declare-datatypes ((array!73955 0))(
  ( (array!73956 (arr!35628 (Array (_ BitVec 32) (_ BitVec 64))) (size!36164 (_ BitVec 32))) )
))
(declare-fun lt!505077 () array!73955)

(declare-datatypes ((List!24848 0))(
  ( (Nil!24845) (Cons!24844 (h!26053 (_ BitVec 64)) (t!35857 List!24848)) )
))
(declare-fun arrayNoDuplicates!0 (array!73955 (_ BitVec 32) List!24848) Bool)

(assert (=> b!1136028 (= res!758246 (arrayNoDuplicates!0 lt!505077 #b00000000000000000000000000000000 Nil!24845))))

(declare-fun b!1136029 () Bool)

(declare-datatypes ((Unit!37207 0))(
  ( (Unit!37208) )
))
(declare-fun e!646485 () Unit!37207)

(declare-fun lt!505074 () Unit!37207)

(assert (=> b!1136029 (= e!646485 lt!505074)))

(declare-fun call!49747 () Unit!37207)

(assert (=> b!1136029 (= lt!505074 call!49747)))

(declare-fun call!49753 () Bool)

(assert (=> b!1136029 call!49753))

(declare-fun b!1136030 () Bool)

(declare-fun e!646477 () Unit!37207)

(declare-fun lt!505078 () Unit!37207)

(assert (=> b!1136030 (= e!646477 lt!505078)))

(declare-fun zeroValue!944 () V!43189)

(declare-fun lt!505069 () ListLongMap!16057)

(declare-fun lt!505067 () Unit!37207)

(declare-fun addStillContains!742 (ListLongMap!16057 (_ BitVec 64) V!43189 (_ BitVec 64)) Unit!37207)

(assert (=> b!1136030 (= lt!505067 (addStillContains!742 lt!505069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun call!49749 () ListLongMap!16057)

(assert (=> b!1136030 (= lt!505076 call!49749)))

(assert (=> b!1136030 call!49751))

(declare-fun call!49750 () Unit!37207)

(assert (=> b!1136030 (= lt!505078 call!49750)))

(declare-fun minValue!944 () V!43189)

(declare-fun +!3480 (ListLongMap!16057 tuple2!18088) ListLongMap!16057)

(assert (=> b!1136030 (contains!6579 (+!3480 lt!505076 (tuple2!18089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1136031 () Bool)

(declare-fun e!646481 () Unit!37207)

(assert (=> b!1136031 (= e!646477 e!646481)))

(declare-fun c!111032 () Bool)

(declare-fun lt!505072 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1136031 (= c!111032 (and (not lt!505072) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1136032 () Bool)

(declare-fun res!758250 () Bool)

(declare-fun e!646470 () Bool)

(assert (=> b!1136032 (=> (not res!758250) (not e!646470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136032 (= res!758250 (validKeyInArray!0 k!934))))

(declare-fun b!1136033 () Bool)

(assert (=> b!1136033 (= e!646475 (= call!49748 call!49752))))

(declare-fun res!758255 () Bool)

(assert (=> start!98412 (=> (not res!758255) (not e!646470))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!73955)

(assert (=> start!98412 (= res!758255 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36164 _keys!1208))))))

(assert (=> start!98412 e!646470))

(declare-fun tp_is_empty!28547 () Bool)

(assert (=> start!98412 tp_is_empty!28547))

(declare-fun array_inv!27320 (array!73955) Bool)

(assert (=> start!98412 (array_inv!27320 _keys!1208)))

(assert (=> start!98412 true))

(assert (=> start!98412 tp!84762))

(declare-datatypes ((ValueCell!13564 0))(
  ( (ValueCellFull!13564 (v!16967 V!43189)) (EmptyCell!13564) )
))
(declare-datatypes ((array!73957 0))(
  ( (array!73958 (arr!35629 (Array (_ BitVec 32) ValueCell!13564)) (size!36165 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73957)

(declare-fun e!646480 () Bool)

(declare-fun array_inv!27321 (array!73957) Bool)

(assert (=> start!98412 (and (array_inv!27321 _values!996) e!646480)))

(declare-fun b!1136034 () Bool)

(declare-fun res!758260 () Bool)

(assert (=> b!1136034 (=> (not res!758260) (not e!646470))))

(assert (=> b!1136034 (= res!758260 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24845))))

(declare-fun b!1136035 () Bool)

(assert (=> b!1136035 (= e!646470 e!646473)))

(declare-fun res!758257 () Bool)

(assert (=> b!1136035 (=> (not res!758257) (not e!646473))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73955 (_ BitVec 32)) Bool)

(assert (=> b!1136035 (= res!758257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505077 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136035 (= lt!505077 (array!73956 (store (arr!35628 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36164 _keys!1208)))))

(declare-fun e!646479 () Bool)

(declare-fun b!1136036 () Bool)

(assert (=> b!1136036 (= e!646479 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505072) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49744 () Bool)

(assert (=> bm!49744 (= call!49750 (addStillContains!742 (ite c!111033 lt!505076 lt!505069) (ite c!111033 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111032 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111033 minValue!944 (ite c!111032 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1136037 () Bool)

(declare-fun e!646472 () Bool)

(declare-fun mapRes!44645 () Bool)

(assert (=> b!1136037 (= e!646480 (and e!646472 mapRes!44645))))

(declare-fun condMapEmpty!44645 () Bool)

(declare-fun mapDefault!44645 () ValueCell!13564)

