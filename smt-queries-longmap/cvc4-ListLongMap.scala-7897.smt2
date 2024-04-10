; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98130 () Bool)

(assert start!98130)

(declare-fun b_free!23831 () Bool)

(declare-fun b_next!23831 () Bool)

(assert (=> start!98130 (= b_free!23831 (not b_next!23831))))

(declare-fun tp!84196 () Bool)

(declare-fun b_and!38445 () Bool)

(assert (=> start!98130 (= tp!84196 b_and!38445)))

(declare-datatypes ((V!42941 0))(
  ( (V!42942 (val!14237 Int)) )
))
(declare-datatypes ((tuple2!17910 0))(
  ( (tuple2!17911 (_1!8966 (_ BitVec 64)) (_2!8966 V!42941)) )
))
(declare-datatypes ((List!24682 0))(
  ( (Nil!24679) (Cons!24678 (h!25887 tuple2!17910) (t!35505 List!24682)) )
))
(declare-datatypes ((ListLongMap!15879 0))(
  ( (ListLongMap!15880 (toList!7955 List!24682)) )
))
(declare-fun call!47775 () ListLongMap!15879)

(declare-fun e!641936 () Bool)

(declare-fun call!47776 () ListLongMap!15879)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1127867 () Bool)

(declare-fun -!1143 (ListLongMap!15879 (_ BitVec 64)) ListLongMap!15879)

(assert (=> b!1127867 (= e!641936 (= call!47776 (-!1143 call!47775 k!934)))))

(declare-fun b!1127868 () Bool)

(declare-fun e!641929 () Bool)

(declare-fun e!641928 () Bool)

(assert (=> b!1127868 (= e!641929 e!641928)))

(declare-fun res!753721 () Bool)

(assert (=> b!1127868 (=> (not res!753721) (not e!641928))))

(declare-datatypes ((array!73581 0))(
  ( (array!73582 (arr!35443 (Array (_ BitVec 32) (_ BitVec 64))) (size!35979 (_ BitVec 32))) )
))
(declare-fun lt!500751 () array!73581)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73581 (_ BitVec 32)) Bool)

(assert (=> b!1127868 (= res!753721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500751 mask!1564))))

(declare-fun _keys!1208 () array!73581)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127868 (= lt!500751 (array!73582 (store (arr!35443 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35979 _keys!1208)))))

(declare-fun b!1127869 () Bool)

(declare-fun res!753722 () Bool)

(assert (=> b!1127869 (=> (not res!753722) (not e!641929))))

(declare-datatypes ((List!24683 0))(
  ( (Nil!24680) (Cons!24679 (h!25888 (_ BitVec 64)) (t!35506 List!24683)) )
))
(declare-fun arrayNoDuplicates!0 (array!73581 (_ BitVec 32) List!24683) Bool)

(assert (=> b!1127869 (= res!753722 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24680))))

(declare-fun res!753720 () Bool)

(assert (=> start!98130 (=> (not res!753720) (not e!641929))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98130 (= res!753720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35979 _keys!1208))))))

(assert (=> start!98130 e!641929))

(declare-fun tp_is_empty!28361 () Bool)

(assert (=> start!98130 tp_is_empty!28361))

(declare-fun array_inv!27196 (array!73581) Bool)

(assert (=> start!98130 (array_inv!27196 _keys!1208)))

(assert (=> start!98130 true))

(assert (=> start!98130 tp!84196))

(declare-datatypes ((ValueCell!13471 0))(
  ( (ValueCellFull!13471 (v!16870 V!42941)) (EmptyCell!13471) )
))
(declare-datatypes ((array!73583 0))(
  ( (array!73584 (arr!35444 (Array (_ BitVec 32) ValueCell!13471)) (size!35980 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73583)

(declare-fun e!641935 () Bool)

(declare-fun array_inv!27197 (array!73583) Bool)

(assert (=> start!98130 (and (array_inv!27197 _values!996) e!641935)))

(declare-fun b!1127870 () Bool)

(declare-fun res!753717 () Bool)

(assert (=> b!1127870 (=> (not res!753717) (not e!641929))))

(assert (=> b!1127870 (= res!753717 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35979 _keys!1208))))))

(declare-fun b!1127871 () Bool)

(declare-fun e!641933 () Bool)

(assert (=> b!1127871 (= e!641933 true)))

(declare-fun zeroValue!944 () V!42941)

(declare-fun lt!500753 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42941)

(declare-fun contains!6484 (ListLongMap!15879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4443 (array!73581 array!73583 (_ BitVec 32) (_ BitVec 32) V!42941 V!42941 (_ BitVec 32) Int) ListLongMap!15879)

(assert (=> b!1127871 (= lt!500753 (contains!6484 (getCurrentListMapNoExtraKeys!4443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1127872 () Bool)

(declare-fun e!641937 () Bool)

(assert (=> b!1127872 (= e!641928 (not e!641937))))

(declare-fun res!753726 () Bool)

(assert (=> b!1127872 (=> res!753726 e!641937)))

(assert (=> b!1127872 (= res!753726 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127872 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36954 0))(
  ( (Unit!36955) )
))
(declare-fun lt!500749 () Unit!36954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73581 (_ BitVec 64) (_ BitVec 32)) Unit!36954)

(assert (=> b!1127872 (= lt!500749 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!47772 () Bool)

(declare-fun lt!500747 () array!73583)

(assert (=> bm!47772 (= call!47776 (getCurrentListMapNoExtraKeys!4443 lt!500751 lt!500747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127873 () Bool)

(declare-fun e!641931 () Bool)

(assert (=> b!1127873 (= e!641937 e!641931)))

(declare-fun res!753718 () Bool)

(assert (=> b!1127873 (=> res!753718 e!641931)))

(assert (=> b!1127873 (= res!753718 (not (= from!1455 i!673)))))

(declare-fun lt!500752 () ListLongMap!15879)

(assert (=> b!1127873 (= lt!500752 (getCurrentListMapNoExtraKeys!4443 lt!500751 lt!500747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2528 (Int (_ BitVec 64)) V!42941)

(assert (=> b!1127873 (= lt!500747 (array!73584 (store (arr!35444 _values!996) i!673 (ValueCellFull!13471 (dynLambda!2528 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35980 _values!996)))))

(declare-fun lt!500750 () ListLongMap!15879)

(assert (=> b!1127873 (= lt!500750 (getCurrentListMapNoExtraKeys!4443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127874 () Bool)

(declare-fun e!641934 () Bool)

(assert (=> b!1127874 (= e!641934 tp_is_empty!28361)))

(declare-fun b!1127875 () Bool)

(declare-fun res!753724 () Bool)

(assert (=> b!1127875 (=> (not res!753724) (not e!641929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127875 (= res!753724 (validKeyInArray!0 k!934))))

(declare-fun bm!47773 () Bool)

(assert (=> bm!47773 (= call!47775 (getCurrentListMapNoExtraKeys!4443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44359 () Bool)

(declare-fun mapRes!44359 () Bool)

(declare-fun tp!84197 () Bool)

(assert (=> mapNonEmpty!44359 (= mapRes!44359 (and tp!84197 e!641934))))

(declare-fun mapRest!44359 () (Array (_ BitVec 32) ValueCell!13471))

(declare-fun mapKey!44359 () (_ BitVec 32))

(declare-fun mapValue!44359 () ValueCell!13471)

(assert (=> mapNonEmpty!44359 (= (arr!35444 _values!996) (store mapRest!44359 mapKey!44359 mapValue!44359))))

(declare-fun b!1127876 () Bool)

(declare-fun e!641930 () Bool)

(assert (=> b!1127876 (= e!641935 (and e!641930 mapRes!44359))))

(declare-fun condMapEmpty!44359 () Bool)

(declare-fun mapDefault!44359 () ValueCell!13471)

