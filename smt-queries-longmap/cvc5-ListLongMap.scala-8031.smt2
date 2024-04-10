; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99026 () Bool)

(assert start!99026)

(declare-fun b_free!24631 () Bool)

(declare-fun b_next!24631 () Bool)

(assert (=> start!99026 (= b_free!24631 (not b_next!24631))))

(declare-fun tp!86603 () Bool)

(declare-fun b_and!40111 () Bool)

(assert (=> start!99026 (= tp!86603 b_and!40111)))

(declare-fun res!771859 () Bool)

(declare-fun e!661858 () Bool)

(assert (=> start!99026 (=> (not res!771859) (not e!661858))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75161 0))(
  ( (array!75162 (arr!36231 (Array (_ BitVec 32) (_ BitVec 64))) (size!36767 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75161)

(assert (=> start!99026 (= res!771859 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36767 _keys!1208))))))

(assert (=> start!99026 e!661858))

(declare-fun tp_is_empty!29161 () Bool)

(assert (=> start!99026 tp_is_empty!29161))

(declare-fun array_inv!27722 (array!75161) Bool)

(assert (=> start!99026 (array_inv!27722 _keys!1208)))

(assert (=> start!99026 true))

(assert (=> start!99026 tp!86603))

(declare-datatypes ((V!44009 0))(
  ( (V!44010 (val!14637 Int)) )
))
(declare-datatypes ((ValueCell!13871 0))(
  ( (ValueCellFull!13871 (v!17274 V!44009)) (EmptyCell!13871) )
))
(declare-datatypes ((array!75163 0))(
  ( (array!75164 (arr!36232 (Array (_ BitVec 32) ValueCell!13871)) (size!36768 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75163)

(declare-fun e!661860 () Bool)

(declare-fun array_inv!27723 (array!75163) Bool)

(assert (=> start!99026 (and (array_inv!27723 _values!996) e!661860)))

(declare-fun mapIsEmpty!45566 () Bool)

(declare-fun mapRes!45566 () Bool)

(assert (=> mapIsEmpty!45566 mapRes!45566))

(declare-fun b!1164006 () Bool)

(declare-fun res!771865 () Bool)

(declare-fun e!661855 () Bool)

(assert (=> b!1164006 (=> (not res!771865) (not e!661855))))

(declare-fun lt!524520 () array!75161)

(declare-datatypes ((List!25402 0))(
  ( (Nil!25399) (Cons!25398 (h!26607 (_ BitVec 64)) (t!37025 List!25402)) )
))
(declare-fun arrayNoDuplicates!0 (array!75161 (_ BitVec 32) List!25402) Bool)

(assert (=> b!1164006 (= res!771865 (arrayNoDuplicates!0 lt!524520 #b00000000000000000000000000000000 Nil!25399))))

(declare-fun b!1164007 () Bool)

(declare-fun res!771862 () Bool)

(assert (=> b!1164007 (=> (not res!771862) (not e!661858))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1164007 (= res!771862 (= (select (arr!36231 _keys!1208) i!673) k!934))))

(declare-fun b!1164008 () Bool)

(assert (=> b!1164008 (= e!661858 e!661855)))

(declare-fun res!771858 () Bool)

(assert (=> b!1164008 (=> (not res!771858) (not e!661855))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75161 (_ BitVec 32)) Bool)

(assert (=> b!1164008 (= res!771858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524520 mask!1564))))

(assert (=> b!1164008 (= lt!524520 (array!75162 (store (arr!36231 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36767 _keys!1208)))))

(declare-fun mapNonEmpty!45566 () Bool)

(declare-fun tp!86604 () Bool)

(declare-fun e!661859 () Bool)

(assert (=> mapNonEmpty!45566 (= mapRes!45566 (and tp!86604 e!661859))))

(declare-fun mapKey!45566 () (_ BitVec 32))

(declare-fun mapRest!45566 () (Array (_ BitVec 32) ValueCell!13871))

(declare-fun mapValue!45566 () ValueCell!13871)

(assert (=> mapNonEmpty!45566 (= (arr!36232 _values!996) (store mapRest!45566 mapKey!45566 mapValue!45566))))

(declare-fun b!1164009 () Bool)

(declare-fun res!771864 () Bool)

(assert (=> b!1164009 (=> (not res!771864) (not e!661858))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1164009 (= res!771864 (and (= (size!36768 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36767 _keys!1208) (size!36768 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164010 () Bool)

(declare-fun res!771860 () Bool)

(assert (=> b!1164010 (=> (not res!771860) (not e!661858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164010 (= res!771860 (validKeyInArray!0 k!934))))

(declare-fun b!1164011 () Bool)

(declare-fun res!771866 () Bool)

(assert (=> b!1164011 (=> (not res!771866) (not e!661858))))

(assert (=> b!1164011 (= res!771866 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25399))))

(declare-fun b!1164012 () Bool)

(declare-fun e!661857 () Bool)

(assert (=> b!1164012 (= e!661857 tp_is_empty!29161)))

(declare-fun b!1164013 () Bool)

(declare-fun e!661854 () Bool)

(assert (=> b!1164013 (= e!661854 true)))

(declare-fun zeroValue!944 () V!44009)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44009)

(declare-datatypes ((tuple2!18670 0))(
  ( (tuple2!18671 (_1!9346 (_ BitVec 64)) (_2!9346 V!44009)) )
))
(declare-datatypes ((List!25403 0))(
  ( (Nil!25400) (Cons!25399 (h!26608 tuple2!18670) (t!37026 List!25403)) )
))
(declare-datatypes ((ListLongMap!16639 0))(
  ( (ListLongMap!16640 (toList!8335 List!25403)) )
))
(declare-fun lt!524523 () ListLongMap!16639)

(declare-fun getCurrentListMapNoExtraKeys!4799 (array!75161 array!75163 (_ BitVec 32) (_ BitVec 32) V!44009 V!44009 (_ BitVec 32) Int) ListLongMap!16639)

(declare-fun dynLambda!2789 (Int (_ BitVec 64)) V!44009)

(assert (=> b!1164013 (= lt!524523 (getCurrentListMapNoExtraKeys!4799 lt!524520 (array!75164 (store (arr!36232 _values!996) i!673 (ValueCellFull!13871 (dynLambda!2789 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36768 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524522 () ListLongMap!16639)

(assert (=> b!1164013 (= lt!524522 (getCurrentListMapNoExtraKeys!4799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164014 () Bool)

(assert (=> b!1164014 (= e!661855 (not e!661854))))

(declare-fun res!771863 () Bool)

(assert (=> b!1164014 (=> res!771863 e!661854)))

(assert (=> b!1164014 (= res!771863 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164014 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38420 0))(
  ( (Unit!38421) )
))
(declare-fun lt!524521 () Unit!38420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75161 (_ BitVec 64) (_ BitVec 32)) Unit!38420)

(assert (=> b!1164014 (= lt!524521 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1164015 () Bool)

(assert (=> b!1164015 (= e!661859 tp_is_empty!29161)))

(declare-fun b!1164016 () Bool)

(declare-fun res!771861 () Bool)

(assert (=> b!1164016 (=> (not res!771861) (not e!661858))))

(assert (=> b!1164016 (= res!771861 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36767 _keys!1208))))))

(declare-fun b!1164017 () Bool)

(assert (=> b!1164017 (= e!661860 (and e!661857 mapRes!45566))))

(declare-fun condMapEmpty!45566 () Bool)

(declare-fun mapDefault!45566 () ValueCell!13871)

