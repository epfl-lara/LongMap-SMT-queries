; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98160 () Bool)

(assert start!98160)

(declare-fun b_free!23861 () Bool)

(declare-fun b_next!23861 () Bool)

(assert (=> start!98160 (= b_free!23861 (not b_next!23861))))

(declare-fun tp!84287 () Bool)

(declare-fun b_and!38505 () Bool)

(assert (=> start!98160 (= tp!84287 b_and!38505)))

(declare-fun b!1128715 () Bool)

(declare-fun res!754318 () Bool)

(declare-fun e!642380 () Bool)

(assert (=> b!1128715 (=> (not res!754318) (not e!642380))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73641 0))(
  ( (array!73642 (arr!35473 (Array (_ BitVec 32) (_ BitVec 64))) (size!36009 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73641)

(assert (=> b!1128715 (= res!754318 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36009 _keys!1208))))))

(declare-fun b!1128716 () Bool)

(declare-fun e!642379 () Bool)

(declare-fun e!642381 () Bool)

(assert (=> b!1128716 (= e!642379 e!642381)))

(declare-fun res!754320 () Bool)

(assert (=> b!1128716 (=> res!754320 e!642381)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128716 (= res!754320 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!42981 0))(
  ( (V!42982 (val!14252 Int)) )
))
(declare-datatypes ((ValueCell!13486 0))(
  ( (ValueCellFull!13486 (v!16885 V!42981)) (EmptyCell!13486) )
))
(declare-datatypes ((array!73643 0))(
  ( (array!73644 (arr!35474 (Array (_ BitVec 32) ValueCell!13486)) (size!36010 (_ BitVec 32))) )
))
(declare-fun lt!501059 () array!73643)

(declare-fun lt!501057 () array!73641)

(declare-fun zeroValue!944 () V!42981)

(declare-datatypes ((tuple2!17940 0))(
  ( (tuple2!17941 (_1!8981 (_ BitVec 64)) (_2!8981 V!42981)) )
))
(declare-datatypes ((List!24708 0))(
  ( (Nil!24705) (Cons!24704 (h!25913 tuple2!17940) (t!35561 List!24708)) )
))
(declare-datatypes ((ListLongMap!15909 0))(
  ( (ListLongMap!15910 (toList!7970 List!24708)) )
))
(declare-fun lt!501055 () ListLongMap!15909)

(declare-fun minValue!944 () V!42981)

(declare-fun getCurrentListMapNoExtraKeys!4457 (array!73641 array!73643 (_ BitVec 32) (_ BitVec 32) V!42981 V!42981 (_ BitVec 32) Int) ListLongMap!15909)

(assert (=> b!1128716 (= lt!501055 (getCurrentListMapNoExtraKeys!4457 lt!501057 lt!501059 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73643)

(declare-fun dynLambda!2538 (Int (_ BitVec 64)) V!42981)

(assert (=> b!1128716 (= lt!501059 (array!73644 (store (arr!35474 _values!996) i!673 (ValueCellFull!13486 (dynLambda!2538 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36010 _values!996)))))

(declare-fun lt!501054 () ListLongMap!15909)

(assert (=> b!1128716 (= lt!501054 (getCurrentListMapNoExtraKeys!4457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128717 () Bool)

(declare-fun res!754313 () Bool)

(declare-fun e!642384 () Bool)

(assert (=> b!1128717 (=> res!754313 e!642384)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6494 (ListLongMap!15909 (_ BitVec 64)) Bool)

(assert (=> b!1128717 (= res!754313 (not (contains!6494 (getCurrentListMapNoExtraKeys!4457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934)))))

(declare-fun call!47866 () ListLongMap!15909)

(declare-fun call!47865 () ListLongMap!15909)

(declare-fun e!642383 () Bool)

(declare-fun b!1128718 () Bool)

(declare-fun -!1152 (ListLongMap!15909 (_ BitVec 64)) ListLongMap!15909)

(assert (=> b!1128718 (= e!642383 (= call!47866 (-!1152 call!47865 k!934)))))

(declare-fun b!1128719 () Bool)

(declare-fun res!754312 () Bool)

(assert (=> b!1128719 (=> (not res!754312) (not e!642380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128719 (= res!754312 (validMask!0 mask!1564))))

(declare-fun b!1128720 () Bool)

(declare-fun e!642382 () Bool)

(assert (=> b!1128720 (= e!642380 e!642382)))

(declare-fun res!754310 () Bool)

(assert (=> b!1128720 (=> (not res!754310) (not e!642382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73641 (_ BitVec 32)) Bool)

(assert (=> b!1128720 (= res!754310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501057 mask!1564))))

(assert (=> b!1128720 (= lt!501057 (array!73642 (store (arr!35473 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36009 _keys!1208)))))

(declare-fun b!1128721 () Bool)

(declare-fun e!642378 () Bool)

(declare-fun tp_is_empty!28391 () Bool)

(assert (=> b!1128721 (= e!642378 tp_is_empty!28391)))

(declare-fun b!1128723 () Bool)

(declare-fun res!754316 () Bool)

(assert (=> b!1128723 (=> (not res!754316) (not e!642380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128723 (= res!754316 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!44404 () Bool)

(declare-fun mapRes!44404 () Bool)

(assert (=> mapIsEmpty!44404 mapRes!44404))

(declare-fun bm!47862 () Bool)

(assert (=> bm!47862 (= call!47866 (getCurrentListMapNoExtraKeys!4457 lt!501057 lt!501059 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128724 () Bool)

(declare-fun res!754317 () Bool)

(assert (=> b!1128724 (=> (not res!754317) (not e!642380))))

(declare-datatypes ((List!24709 0))(
  ( (Nil!24706) (Cons!24705 (h!25914 (_ BitVec 64)) (t!35562 List!24709)) )
))
(declare-fun arrayNoDuplicates!0 (array!73641 (_ BitVec 32) List!24709) Bool)

(assert (=> b!1128724 (= res!754317 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24706))))

(declare-fun b!1128725 () Bool)

(assert (=> b!1128725 (= e!642381 e!642384)))

(declare-fun res!754315 () Bool)

(assert (=> b!1128725 (=> res!754315 e!642384)))

(assert (=> b!1128725 (= res!754315 (not (= (select (arr!35473 _keys!1208) from!1455) k!934)))))

(assert (=> b!1128725 e!642383))

(declare-fun c!109782 () Bool)

(assert (=> b!1128725 (= c!109782 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36978 0))(
  ( (Unit!36979) )
))
(declare-fun lt!501056 () Unit!36978)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!406 (array!73641 array!73643 (_ BitVec 32) (_ BitVec 32) V!42981 V!42981 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36978)

(assert (=> b!1128725 (= lt!501056 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128726 () Bool)

(assert (=> b!1128726 (= e!642382 (not e!642379))))

(declare-fun res!754311 () Bool)

(assert (=> b!1128726 (=> res!754311 e!642379)))

(assert (=> b!1128726 (= res!754311 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128726 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501058 () Unit!36978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73641 (_ BitVec 64) (_ BitVec 32)) Unit!36978)

(assert (=> b!1128726 (= lt!501058 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1128727 () Bool)

(declare-fun res!754319 () Bool)

(assert (=> b!1128727 (=> (not res!754319) (not e!642380))))

(assert (=> b!1128727 (= res!754319 (and (= (size!36010 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36009 _keys!1208) (size!36010 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128728 () Bool)

(declare-fun e!642386 () Bool)

(assert (=> b!1128728 (= e!642386 tp_is_empty!28391)))

(declare-fun b!1128729 () Bool)

(assert (=> b!1128729 (= e!642384 (or (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36009 _keys!1208)))))))

(declare-fun b!1128730 () Bool)

(declare-fun res!754309 () Bool)

(assert (=> b!1128730 (=> (not res!754309) (not e!642380))))

(assert (=> b!1128730 (= res!754309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128731 () Bool)

(declare-fun res!754321 () Bool)

(assert (=> b!1128731 (=> (not res!754321) (not e!642382))))

(assert (=> b!1128731 (= res!754321 (arrayNoDuplicates!0 lt!501057 #b00000000000000000000000000000000 Nil!24706))))

(declare-fun b!1128722 () Bool)

(declare-fun res!754314 () Bool)

(assert (=> b!1128722 (=> (not res!754314) (not e!642380))))

(assert (=> b!1128722 (= res!754314 (= (select (arr!35473 _keys!1208) i!673) k!934))))

(declare-fun res!754308 () Bool)

(assert (=> start!98160 (=> (not res!754308) (not e!642380))))

(assert (=> start!98160 (= res!754308 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36009 _keys!1208))))))

(assert (=> start!98160 e!642380))

(assert (=> start!98160 tp_is_empty!28391))

(declare-fun array_inv!27218 (array!73641) Bool)

(assert (=> start!98160 (array_inv!27218 _keys!1208)))

(assert (=> start!98160 true))

(assert (=> start!98160 tp!84287))

(declare-fun e!642385 () Bool)

(declare-fun array_inv!27219 (array!73643) Bool)

(assert (=> start!98160 (and (array_inv!27219 _values!996) e!642385)))

(declare-fun b!1128732 () Bool)

(assert (=> b!1128732 (= e!642383 (= call!47866 call!47865))))

(declare-fun mapNonEmpty!44404 () Bool)

(declare-fun tp!84286 () Bool)

(assert (=> mapNonEmpty!44404 (= mapRes!44404 (and tp!84286 e!642386))))

(declare-fun mapValue!44404 () ValueCell!13486)

(declare-fun mapRest!44404 () (Array (_ BitVec 32) ValueCell!13486))

(declare-fun mapKey!44404 () (_ BitVec 32))

(assert (=> mapNonEmpty!44404 (= (arr!35474 _values!996) (store mapRest!44404 mapKey!44404 mapValue!44404))))

(declare-fun bm!47863 () Bool)

(assert (=> bm!47863 (= call!47865 (getCurrentListMapNoExtraKeys!4457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128733 () Bool)

(assert (=> b!1128733 (= e!642385 (and e!642378 mapRes!44404))))

(declare-fun condMapEmpty!44404 () Bool)

(declare-fun mapDefault!44404 () ValueCell!13486)

