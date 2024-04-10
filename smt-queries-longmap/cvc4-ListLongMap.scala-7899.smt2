; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98142 () Bool)

(assert start!98142)

(declare-fun b_free!23843 () Bool)

(declare-fun b_next!23843 () Bool)

(assert (=> start!98142 (= b_free!23843 (not b_next!23843))))

(declare-fun tp!84233 () Bool)

(declare-fun b_and!38469 () Bool)

(assert (=> start!98142 (= tp!84233 b_and!38469)))

(declare-fun mapIsEmpty!44377 () Bool)

(declare-fun mapRes!44377 () Bool)

(assert (=> mapIsEmpty!44377 mapRes!44377))

(declare-fun b!1128203 () Bool)

(declare-fun e!642110 () Bool)

(declare-fun e!642109 () Bool)

(assert (=> b!1128203 (= e!642110 e!642109)))

(declare-fun res!753957 () Bool)

(assert (=> b!1128203 (=> res!753957 e!642109)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128203 (= res!753957 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42957 0))(
  ( (V!42958 (val!14243 Int)) )
))
(declare-fun zeroValue!944 () V!42957)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17922 0))(
  ( (tuple2!17923 (_1!8972 (_ BitVec 64)) (_2!8972 V!42957)) )
))
(declare-datatypes ((List!24693 0))(
  ( (Nil!24690) (Cons!24689 (h!25898 tuple2!17922) (t!35528 List!24693)) )
))
(declare-datatypes ((ListLongMap!15891 0))(
  ( (ListLongMap!15892 (toList!7961 List!24693)) )
))
(declare-fun lt!500874 () ListLongMap!15891)

(declare-datatypes ((array!73605 0))(
  ( (array!73606 (arr!35455 (Array (_ BitVec 32) (_ BitVec 64))) (size!35991 (_ BitVec 32))) )
))
(declare-fun lt!500873 () array!73605)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13477 0))(
  ( (ValueCellFull!13477 (v!16876 V!42957)) (EmptyCell!13477) )
))
(declare-datatypes ((array!73607 0))(
  ( (array!73608 (arr!35456 (Array (_ BitVec 32) ValueCell!13477)) (size!35992 (_ BitVec 32))) )
))
(declare-fun lt!500879 () array!73607)

(declare-fun minValue!944 () V!42957)

(declare-fun getCurrentListMapNoExtraKeys!4448 (array!73605 array!73607 (_ BitVec 32) (_ BitVec 32) V!42957 V!42957 (_ BitVec 32) Int) ListLongMap!15891)

(assert (=> b!1128203 (= lt!500874 (getCurrentListMapNoExtraKeys!4448 lt!500873 lt!500879 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73607)

(declare-fun dynLambda!2532 (Int (_ BitVec 64)) V!42957)

(assert (=> b!1128203 (= lt!500879 (array!73608 (store (arr!35456 _values!996) i!673 (ValueCellFull!13477 (dynLambda!2532 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35992 _values!996)))))

(declare-fun _keys!1208 () array!73605)

(declare-fun lt!500876 () ListLongMap!15891)

(assert (=> b!1128203 (= lt!500876 (getCurrentListMapNoExtraKeys!4448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128204 () Bool)

(declare-fun res!753961 () Bool)

(declare-fun e!642117 () Bool)

(assert (=> b!1128204 (=> (not res!753961) (not e!642117))))

(assert (=> b!1128204 (= res!753961 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35991 _keys!1208))))))

(declare-fun b!1128205 () Bool)

(declare-fun e!642114 () Bool)

(assert (=> b!1128205 (= e!642109 e!642114)))

(declare-fun res!753958 () Bool)

(assert (=> b!1128205 (=> res!753958 e!642114)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1128205 (= res!753958 (not (= (select (arr!35455 _keys!1208) from!1455) k!934)))))

(declare-fun e!642112 () Bool)

(assert (=> b!1128205 e!642112))

(declare-fun c!109755 () Bool)

(assert (=> b!1128205 (= c!109755 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36962 0))(
  ( (Unit!36963) )
))
(declare-fun lt!500875 () Unit!36962)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!400 (array!73605 array!73607 (_ BitVec 32) (_ BitVec 32) V!42957 V!42957 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36962)

(assert (=> b!1128205 (= lt!500875 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!753953 () Bool)

(assert (=> start!98142 (=> (not res!753953) (not e!642117))))

(assert (=> start!98142 (= res!753953 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35991 _keys!1208))))))

(assert (=> start!98142 e!642117))

(declare-fun tp_is_empty!28373 () Bool)

(assert (=> start!98142 tp_is_empty!28373))

(declare-fun array_inv!27204 (array!73605) Bool)

(assert (=> start!98142 (array_inv!27204 _keys!1208)))

(assert (=> start!98142 true))

(assert (=> start!98142 tp!84233))

(declare-fun e!642115 () Bool)

(declare-fun array_inv!27205 (array!73607) Bool)

(assert (=> start!98142 (and (array_inv!27205 _values!996) e!642115)))

(declare-fun call!47812 () ListLongMap!15891)

(declare-fun call!47811 () ListLongMap!15891)

(declare-fun b!1128206 () Bool)

(declare-fun -!1147 (ListLongMap!15891 (_ BitVec 64)) ListLongMap!15891)

(assert (=> b!1128206 (= e!642112 (= call!47812 (-!1147 call!47811 k!934)))))

(declare-fun b!1128207 () Bool)

(declare-fun res!753952 () Bool)

(assert (=> b!1128207 (=> (not res!753952) (not e!642117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128207 (= res!753952 (validMask!0 mask!1564))))

(declare-fun b!1128208 () Bool)

(declare-fun e!642113 () Bool)

(assert (=> b!1128208 (= e!642115 (and e!642113 mapRes!44377))))

(declare-fun condMapEmpty!44377 () Bool)

(declare-fun mapDefault!44377 () ValueCell!13477)

