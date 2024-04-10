; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97758 () Bool)

(assert start!97758)

(declare-fun b_free!23459 () Bool)

(declare-fun b_next!23459 () Bool)

(assert (=> start!97758 (= b_free!23459 (not b_next!23459))))

(declare-fun tp!83081 () Bool)

(declare-fun b_and!37733 () Bool)

(assert (=> start!97758 (= tp!83081 b_and!37733)))

(declare-fun b!1118054 () Bool)

(declare-fun res!746696 () Bool)

(declare-fun e!636857 () Bool)

(assert (=> b!1118054 (=> (not res!746696) (not e!636857))))

(declare-datatypes ((array!72869 0))(
  ( (array!72870 (arr!35087 (Array (_ BitVec 32) (_ BitVec 64))) (size!35623 (_ BitVec 32))) )
))
(declare-fun lt!497413 () array!72869)

(declare-datatypes ((List!24406 0))(
  ( (Nil!24403) (Cons!24402 (h!25611 (_ BitVec 64)) (t!34887 List!24406)) )
))
(declare-fun arrayNoDuplicates!0 (array!72869 (_ BitVec 32) List!24406) Bool)

(assert (=> b!1118054 (= res!746696 (arrayNoDuplicates!0 lt!497413 #b00000000000000000000000000000000 Nil!24403))))

(declare-fun b!1118055 () Bool)

(declare-fun res!746692 () Bool)

(declare-fun e!636859 () Bool)

(assert (=> b!1118055 (=> (not res!746692) (not e!636859))))

(declare-fun _keys!1208 () array!72869)

(assert (=> b!1118055 (= res!746692 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24403))))

(declare-fun b!1118056 () Bool)

(declare-fun res!746697 () Bool)

(assert (=> b!1118056 (=> (not res!746697) (not e!636859))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1118056 (= res!746697 (= (select (arr!35087 _keys!1208) i!673) k!934))))

(declare-fun b!1118057 () Bool)

(declare-fun res!746695 () Bool)

(assert (=> b!1118057 (=> (not res!746695) (not e!636859))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118057 (= res!746695 (validMask!0 mask!1564))))

(declare-fun res!746688 () Bool)

(assert (=> start!97758 (=> (not res!746688) (not e!636859))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97758 (= res!746688 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35623 _keys!1208))))))

(assert (=> start!97758 e!636859))

(declare-fun tp_is_empty!27989 () Bool)

(assert (=> start!97758 tp_is_empty!27989))

(declare-fun array_inv!26956 (array!72869) Bool)

(assert (=> start!97758 (array_inv!26956 _keys!1208)))

(assert (=> start!97758 true))

(assert (=> start!97758 tp!83081))

(declare-datatypes ((V!42445 0))(
  ( (V!42446 (val!14051 Int)) )
))
(declare-datatypes ((ValueCell!13285 0))(
  ( (ValueCellFull!13285 (v!16684 V!42445)) (EmptyCell!13285) )
))
(declare-datatypes ((array!72871 0))(
  ( (array!72872 (arr!35088 (Array (_ BitVec 32) ValueCell!13285)) (size!35624 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72871)

(declare-fun e!636860 () Bool)

(declare-fun array_inv!26957 (array!72871) Bool)

(assert (=> start!97758 (and (array_inv!26957 _values!996) e!636860)))

(declare-fun b!1118058 () Bool)

(declare-fun e!636861 () Bool)

(assert (=> b!1118058 (= e!636861 true)))

(declare-fun zeroValue!944 () V!42445)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17620 0))(
  ( (tuple2!17621 (_1!8821 (_ BitVec 64)) (_2!8821 V!42445)) )
))
(declare-datatypes ((List!24407 0))(
  ( (Nil!24404) (Cons!24403 (h!25612 tuple2!17620) (t!34888 List!24407)) )
))
(declare-datatypes ((ListLongMap!15589 0))(
  ( (ListLongMap!15590 (toList!7810 List!24407)) )
))
(declare-fun lt!497412 () ListLongMap!15589)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42445)

(declare-fun getCurrentListMapNoExtraKeys!4300 (array!72869 array!72871 (_ BitVec 32) (_ BitVec 32) V!42445 V!42445 (_ BitVec 32) Int) ListLongMap!15589)

(assert (=> b!1118058 (= lt!497412 (getCurrentListMapNoExtraKeys!4300 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118059 () Bool)

(assert (=> b!1118059 (= e!636857 (not e!636861))))

(declare-fun res!746691 () Bool)

(assert (=> b!1118059 (=> res!746691 e!636861)))

(assert (=> b!1118059 (= res!746691 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118059 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36692 0))(
  ( (Unit!36693) )
))
(declare-fun lt!497414 () Unit!36692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72869 (_ BitVec 64) (_ BitVec 32)) Unit!36692)

(assert (=> b!1118059 (= lt!497414 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1118060 () Bool)

(declare-fun e!636855 () Bool)

(declare-fun mapRes!43801 () Bool)

(assert (=> b!1118060 (= e!636860 (and e!636855 mapRes!43801))))

(declare-fun condMapEmpty!43801 () Bool)

(declare-fun mapDefault!43801 () ValueCell!13285)

