; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98172 () Bool)

(assert start!98172)

(declare-fun b_free!23873 () Bool)

(declare-fun b_next!23873 () Bool)

(assert (=> start!98172 (= b_free!23873 (not b_next!23873))))

(declare-fun tp!84323 () Bool)

(declare-fun b_and!38529 () Bool)

(assert (=> start!98172 (= tp!84323 b_and!38529)))

(declare-fun b!1129116 () Bool)

(declare-datatypes ((Unit!36989 0))(
  ( (Unit!36990) )
))
(declare-fun e!642606 () Unit!36989)

(declare-fun e!642598 () Unit!36989)

(assert (=> b!1129116 (= e!642606 e!642598)))

(declare-fun c!109824 () Bool)

(declare-fun lt!501243 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1129116 (= c!109824 (and (not lt!501243) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44422 () Bool)

(declare-fun mapRes!44422 () Bool)

(declare-fun tp!84322 () Bool)

(declare-fun e!642610 () Bool)

(assert (=> mapNonEmpty!44422 (= mapRes!44422 (and tp!84322 e!642610))))

(declare-datatypes ((V!42997 0))(
  ( (V!42998 (val!14258 Int)) )
))
(declare-datatypes ((ValueCell!13492 0))(
  ( (ValueCellFull!13492 (v!16891 V!42997)) (EmptyCell!13492) )
))
(declare-fun mapValue!44422 () ValueCell!13492)

(declare-datatypes ((array!73663 0))(
  ( (array!73664 (arr!35484 (Array (_ BitVec 32) ValueCell!13492)) (size!36020 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73663)

(declare-fun mapKey!44422 () (_ BitVec 32))

(declare-fun mapRest!44422 () (Array (_ BitVec 32) ValueCell!13492))

(assert (=> mapNonEmpty!44422 (= (arr!35484 _values!996) (store mapRest!44422 mapKey!44422 mapValue!44422))))

(declare-fun b!1129117 () Bool)

(declare-fun res!754568 () Bool)

(declare-fun e!642601 () Bool)

(assert (=> b!1129117 (=> (not res!754568) (not e!642601))))

(declare-datatypes ((array!73665 0))(
  ( (array!73666 (arr!35485 (Array (_ BitVec 32) (_ BitVec 64))) (size!36021 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73665)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1129117 (= res!754568 (and (= (size!36020 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36021 _keys!1208) (size!36020 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!42997)

(declare-fun bm!47946 () Bool)

(declare-datatypes ((tuple2!17950 0))(
  ( (tuple2!17951 (_1!8986 (_ BitVec 64)) (_2!8986 V!42997)) )
))
(declare-datatypes ((List!24718 0))(
  ( (Nil!24715) (Cons!24714 (h!25923 tuple2!17950) (t!35583 List!24718)) )
))
(declare-datatypes ((ListLongMap!15919 0))(
  ( (ListLongMap!15920 (toList!7975 List!24718)) )
))
(declare-fun call!47952 () ListLongMap!15919)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!501253 () array!73663)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42997)

(declare-fun lt!501244 () array!73665)

(declare-fun getCurrentListMapNoExtraKeys!4462 (array!73665 array!73663 (_ BitVec 32) (_ BitVec 32) V!42997 V!42997 (_ BitVec 32) Int) ListLongMap!15919)

(assert (=> bm!47946 (= call!47952 (getCurrentListMapNoExtraKeys!4462 lt!501244 lt!501253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129118 () Bool)

(declare-fun lt!501256 () Unit!36989)

(assert (=> b!1129118 (= e!642606 lt!501256)))

(declare-fun lt!501245 () Unit!36989)

(declare-fun call!47954 () Unit!36989)

(assert (=> b!1129118 (= lt!501245 call!47954)))

(declare-fun lt!501248 () ListLongMap!15919)

(declare-fun call!47956 () ListLongMap!15919)

(assert (=> b!1129118 (= lt!501248 call!47956)))

(declare-fun call!47950 () Bool)

(assert (=> b!1129118 call!47950))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun addStillContains!689 (ListLongMap!15919 (_ BitVec 64) V!42997 (_ BitVec 64)) Unit!36989)

(assert (=> b!1129118 (= lt!501256 (addStillContains!689 lt!501248 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun contains!6498 (ListLongMap!15919 (_ BitVec 64)) Bool)

(declare-fun +!3427 (ListLongMap!15919 tuple2!17950) ListLongMap!15919)

(assert (=> b!1129118 (contains!6498 (+!3427 lt!501248 (tuple2!17951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1129119 () Bool)

(declare-fun e!642599 () Bool)

(assert (=> b!1129119 (= e!642601 e!642599)))

(declare-fun res!754567 () Bool)

(assert (=> b!1129119 (=> (not res!754567) (not e!642599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73665 (_ BitVec 32)) Bool)

(assert (=> b!1129119 (= res!754567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501244 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129119 (= lt!501244 (array!73666 (store (arr!35485 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36021 _keys!1208)))))

(declare-fun b!1129120 () Bool)

(declare-fun e!642602 () Bool)

(declare-fun e!642611 () Bool)

(assert (=> b!1129120 (= e!642602 e!642611)))

(declare-fun res!754562 () Bool)

(assert (=> b!1129120 (=> res!754562 e!642611)))

(assert (=> b!1129120 (= res!754562 (not (= from!1455 i!673)))))

(declare-fun lt!501257 () ListLongMap!15919)

(assert (=> b!1129120 (= lt!501257 (getCurrentListMapNoExtraKeys!4462 lt!501244 lt!501253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2542 (Int (_ BitVec 64)) V!42997)

(assert (=> b!1129120 (= lt!501253 (array!73664 (store (arr!35484 _values!996) i!673 (ValueCellFull!13492 (dynLambda!2542 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36020 _values!996)))))

(declare-fun lt!501247 () ListLongMap!15919)

(assert (=> b!1129120 (= lt!501247 (getCurrentListMapNoExtraKeys!4462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44422 () Bool)

(assert (=> mapIsEmpty!44422 mapRes!44422))

(declare-fun b!1129121 () Bool)

(declare-fun e!642603 () Bool)

(declare-fun tp_is_empty!28403 () Bool)

(assert (=> b!1129121 (= e!642603 tp_is_empty!28403)))

(declare-fun e!642608 () Bool)

(declare-fun b!1129122 () Bool)

(declare-fun call!47955 () ListLongMap!15919)

(declare-fun -!1157 (ListLongMap!15919 (_ BitVec 64)) ListLongMap!15919)

(assert (=> b!1129122 (= e!642608 (= call!47952 (-!1157 call!47955 k!934)))))

(declare-fun b!1129123 () Bool)

(declare-fun res!754571 () Bool)

(assert (=> b!1129123 (=> (not res!754571) (not e!642601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129123 (= res!754571 (validKeyInArray!0 k!934))))

(declare-fun b!1129124 () Bool)

(assert (=> b!1129124 (= e!642599 (not e!642602))))

(declare-fun res!754565 () Bool)

(assert (=> b!1129124 (=> res!754565 e!642602)))

(assert (=> b!1129124 (= res!754565 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129124 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501246 () Unit!36989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73665 (_ BitVec 64) (_ BitVec 32)) Unit!36989)

(assert (=> b!1129124 (= lt!501246 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1129125 () Bool)

(declare-fun res!754569 () Bool)

(assert (=> b!1129125 (=> (not res!754569) (not e!642601))))

(assert (=> b!1129125 (= res!754569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129126 () Bool)

(declare-fun call!47951 () Bool)

(assert (=> b!1129126 call!47951))

(declare-fun lt!501249 () Unit!36989)

(declare-fun call!47953 () Unit!36989)

(assert (=> b!1129126 (= lt!501249 call!47953)))

(assert (=> b!1129126 (= e!642598 lt!501249)))

(declare-fun bm!47947 () Bool)

(assert (=> bm!47947 (= call!47951 call!47950)))

(declare-fun b!1129127 () Bool)

(declare-fun c!109827 () Bool)

(assert (=> b!1129127 (= c!109827 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501243))))

(declare-fun e!642600 () Unit!36989)

(assert (=> b!1129127 (= e!642598 e!642600)))

(declare-fun b!1129128 () Bool)

(declare-fun e!642604 () Bool)

(assert (=> b!1129128 (= e!642604 (and e!642603 mapRes!44422))))

(declare-fun condMapEmpty!44422 () Bool)

(declare-fun mapDefault!44422 () ValueCell!13492)

