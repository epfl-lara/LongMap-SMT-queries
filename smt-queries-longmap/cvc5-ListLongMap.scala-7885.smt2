; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98054 () Bool)

(assert start!98054)

(declare-fun b_free!23755 () Bool)

(declare-fun b_next!23755 () Bool)

(assert (=> start!98054 (= b_free!23755 (not b_next!23755))))

(declare-fun tp!83968 () Bool)

(declare-fun b_and!38293 () Bool)

(assert (=> start!98054 (= tp!83968 b_and!38293)))

(declare-fun b!1125730 () Bool)

(declare-fun res!752225 () Bool)

(declare-fun e!640796 () Bool)

(assert (=> b!1125730 (=> (not res!752225) (not e!640796))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125730 (= res!752225 (validMask!0 mask!1564))))

(declare-datatypes ((V!42841 0))(
  ( (V!42842 (val!14199 Int)) )
))
(declare-fun zeroValue!944 () V!42841)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47544 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13433 0))(
  ( (ValueCellFull!13433 (v!16832 V!42841)) (EmptyCell!13433) )
))
(declare-datatypes ((array!73433 0))(
  ( (array!73434 (arr!35369 (Array (_ BitVec 32) ValueCell!13433)) (size!35905 (_ BitVec 32))) )
))
(declare-fun lt!499958 () array!73433)

(declare-datatypes ((tuple2!17846 0))(
  ( (tuple2!17847 (_1!8934 (_ BitVec 64)) (_2!8934 V!42841)) )
))
(declare-datatypes ((List!24624 0))(
  ( (Nil!24621) (Cons!24620 (h!25829 tuple2!17846) (t!35371 List!24624)) )
))
(declare-datatypes ((ListLongMap!15815 0))(
  ( (ListLongMap!15816 (toList!7923 List!24624)) )
))
(declare-fun call!47547 () ListLongMap!15815)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73435 0))(
  ( (array!73436 (arr!35370 (Array (_ BitVec 32) (_ BitVec 64))) (size!35906 (_ BitVec 32))) )
))
(declare-fun lt!499961 () array!73435)

(declare-fun minValue!944 () V!42841)

(declare-fun getCurrentListMapNoExtraKeys!4411 (array!73435 array!73433 (_ BitVec 32) (_ BitVec 32) V!42841 V!42841 (_ BitVec 32) Int) ListLongMap!15815)

(assert (=> bm!47544 (= call!47547 (getCurrentListMapNoExtraKeys!4411 lt!499961 lt!499958 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!752226 () Bool)

(assert (=> start!98054 (=> (not res!752226) (not e!640796))))

(declare-fun _keys!1208 () array!73435)

(assert (=> start!98054 (= res!752226 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35906 _keys!1208))))))

(assert (=> start!98054 e!640796))

(declare-fun tp_is_empty!28285 () Bool)

(assert (=> start!98054 tp_is_empty!28285))

(declare-fun array_inv!27150 (array!73435) Bool)

(assert (=> start!98054 (array_inv!27150 _keys!1208)))

(assert (=> start!98054 true))

(assert (=> start!98054 tp!83968))

(declare-fun _values!996 () array!73433)

(declare-fun e!640795 () Bool)

(declare-fun array_inv!27151 (array!73433) Bool)

(assert (=> start!98054 (and (array_inv!27151 _values!996) e!640795)))

(declare-fun mapNonEmpty!44245 () Bool)

(declare-fun mapRes!44245 () Bool)

(declare-fun tp!83969 () Bool)

(declare-fun e!640792 () Bool)

(assert (=> mapNonEmpty!44245 (= mapRes!44245 (and tp!83969 e!640792))))

(declare-fun mapValue!44245 () ValueCell!13433)

(declare-fun mapRest!44245 () (Array (_ BitVec 32) ValueCell!13433))

(declare-fun mapKey!44245 () (_ BitVec 32))

(assert (=> mapNonEmpty!44245 (= (arr!35369 _values!996) (store mapRest!44245 mapKey!44245 mapValue!44245))))

(declare-fun b!1125731 () Bool)

(declare-fun res!752229 () Bool)

(assert (=> b!1125731 (=> (not res!752229) (not e!640796))))

(declare-datatypes ((List!24625 0))(
  ( (Nil!24622) (Cons!24621 (h!25830 (_ BitVec 64)) (t!35372 List!24625)) )
))
(declare-fun arrayNoDuplicates!0 (array!73435 (_ BitVec 32) List!24625) Bool)

(assert (=> b!1125731 (= res!752229 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24622))))

(declare-fun b!1125732 () Bool)

(declare-fun res!752236 () Bool)

(assert (=> b!1125732 (=> (not res!752236) (not e!640796))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125732 (= res!752236 (= (select (arr!35370 _keys!1208) i!673) k!934))))

(declare-fun b!1125733 () Bool)

(declare-fun e!640797 () Bool)

(declare-fun call!47548 () ListLongMap!15815)

(assert (=> b!1125733 (= e!640797 (= call!47547 call!47548))))

(declare-fun b!1125734 () Bool)

(declare-fun e!640794 () Bool)

(assert (=> b!1125734 (= e!640794 tp_is_empty!28285)))

(declare-fun mapIsEmpty!44245 () Bool)

(assert (=> mapIsEmpty!44245 mapRes!44245))

(declare-fun b!1125735 () Bool)

(declare-fun e!640793 () Bool)

(declare-fun e!640790 () Bool)

(assert (=> b!1125735 (= e!640793 (not e!640790))))

(declare-fun res!752224 () Bool)

(assert (=> b!1125735 (=> res!752224 e!640790)))

(assert (=> b!1125735 (= res!752224 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125735 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36894 0))(
  ( (Unit!36895) )
))
(declare-fun lt!499963 () Unit!36894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73435 (_ BitVec 64) (_ BitVec 32)) Unit!36894)

(assert (=> b!1125735 (= lt!499963 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1125736 () Bool)

(declare-fun res!752230 () Bool)

(assert (=> b!1125736 (=> (not res!752230) (not e!640796))))

(assert (=> b!1125736 (= res!752230 (and (= (size!35905 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35906 _keys!1208) (size!35905 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125737 () Bool)

(declare-fun res!752234 () Bool)

(assert (=> b!1125737 (=> (not res!752234) (not e!640796))))

(assert (=> b!1125737 (= res!752234 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35906 _keys!1208))))))

(declare-fun b!1125738 () Bool)

(declare-fun -!1121 (ListLongMap!15815 (_ BitVec 64)) ListLongMap!15815)

(assert (=> b!1125738 (= e!640797 (= call!47547 (-!1121 call!47548 k!934)))))

(declare-fun b!1125739 () Bool)

(declare-fun e!640788 () Bool)

(declare-fun e!640791 () Bool)

(assert (=> b!1125739 (= e!640788 e!640791)))

(declare-fun res!752233 () Bool)

(assert (=> b!1125739 (=> res!752233 e!640791)))

(assert (=> b!1125739 (= res!752233 (not (= (select (arr!35370 _keys!1208) from!1455) k!934)))))

(assert (=> b!1125739 e!640797))

(declare-fun c!109623 () Bool)

(assert (=> b!1125739 (= c!109623 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499960 () Unit!36894)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!368 (array!73435 array!73433 (_ BitVec 32) (_ BitVec 32) V!42841 V!42841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36894)

(assert (=> b!1125739 (= lt!499960 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125740 () Bool)

(assert (=> b!1125740 (= e!640790 e!640788)))

(declare-fun res!752228 () Bool)

(assert (=> b!1125740 (=> res!752228 e!640788)))

(assert (=> b!1125740 (= res!752228 (not (= from!1455 i!673)))))

(declare-fun lt!499959 () ListLongMap!15815)

(assert (=> b!1125740 (= lt!499959 (getCurrentListMapNoExtraKeys!4411 lt!499961 lt!499958 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2501 (Int (_ BitVec 64)) V!42841)

(assert (=> b!1125740 (= lt!499958 (array!73434 (store (arr!35369 _values!996) i!673 (ValueCellFull!13433 (dynLambda!2501 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35905 _values!996)))))

(declare-fun lt!499964 () ListLongMap!15815)

(assert (=> b!1125740 (= lt!499964 (getCurrentListMapNoExtraKeys!4411 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125741 () Bool)

(declare-fun res!752231 () Bool)

(assert (=> b!1125741 (=> (not res!752231) (not e!640796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73435 (_ BitVec 32)) Bool)

(assert (=> b!1125741 (= res!752231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125742 () Bool)

(assert (=> b!1125742 (= e!640796 e!640793)))

(declare-fun res!752235 () Bool)

(assert (=> b!1125742 (=> (not res!752235) (not e!640793))))

(assert (=> b!1125742 (= res!752235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499961 mask!1564))))

(assert (=> b!1125742 (= lt!499961 (array!73436 (store (arr!35370 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35906 _keys!1208)))))

(declare-fun b!1125743 () Bool)

(assert (=> b!1125743 (= e!640792 tp_is_empty!28285)))

(declare-fun b!1125744 () Bool)

(declare-fun res!752232 () Bool)

(assert (=> b!1125744 (=> (not res!752232) (not e!640793))))

(assert (=> b!1125744 (= res!752232 (arrayNoDuplicates!0 lt!499961 #b00000000000000000000000000000000 Nil!24622))))

(declare-fun b!1125745 () Bool)

(assert (=> b!1125745 (= e!640791 true)))

(declare-fun lt!499962 () Bool)

(declare-fun contains!6458 (ListLongMap!15815 (_ BitVec 64)) Bool)

(assert (=> b!1125745 (= lt!499962 (contains!6458 (getCurrentListMapNoExtraKeys!4411 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1125746 () Bool)

(assert (=> b!1125746 (= e!640795 (and e!640794 mapRes!44245))))

(declare-fun condMapEmpty!44245 () Bool)

(declare-fun mapDefault!44245 () ValueCell!13433)

