; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101790 () Bool)

(assert start!101790)

(declare-fun b_free!26479 () Bool)

(declare-fun b_next!26479 () Bool)

(assert (=> start!101790 (= b_free!26479 (not b_next!26479))))

(declare-fun tp!92482 () Bool)

(declare-fun b_and!44219 () Bool)

(assert (=> start!101790 (= tp!92482 b_and!44219)))

(declare-fun b!1226132 () Bool)

(declare-fun e!696368 () Bool)

(declare-fun e!696374 () Bool)

(assert (=> b!1226132 (= e!696368 e!696374)))

(declare-fun res!814892 () Bool)

(assert (=> b!1226132 (=> res!814892 e!696374)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1226132 (= res!814892 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46705 0))(
  ( (V!46706 (val!15648 Int)) )
))
(declare-fun zeroValue!944 () V!46705)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14882 0))(
  ( (ValueCellFull!14882 (v!18310 V!46705)) (EmptyCell!14882) )
))
(declare-datatypes ((array!79143 0))(
  ( (array!79144 (arr!38198 (Array (_ BitVec 32) ValueCell!14882)) (size!38734 (_ BitVec 32))) )
))
(declare-fun lt!558705 () array!79143)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!79145 0))(
  ( (array!79146 (arr!38199 (Array (_ BitVec 32) (_ BitVec 64))) (size!38735 (_ BitVec 32))) )
))
(declare-fun lt!558710 () array!79145)

(declare-fun minValue!944 () V!46705)

(declare-datatypes ((tuple2!20168 0))(
  ( (tuple2!20169 (_1!10095 (_ BitVec 64)) (_2!10095 V!46705)) )
))
(declare-datatypes ((List!26971 0))(
  ( (Nil!26968) (Cons!26967 (h!28176 tuple2!20168) (t!40430 List!26971)) )
))
(declare-datatypes ((ListLongMap!18137 0))(
  ( (ListLongMap!18138 (toList!9084 List!26971)) )
))
(declare-fun lt!558707 () ListLongMap!18137)

(declare-fun getCurrentListMapNoExtraKeys!5503 (array!79145 array!79143 (_ BitVec 32) (_ BitVec 32) V!46705 V!46705 (_ BitVec 32) Int) ListLongMap!18137)

(assert (=> b!1226132 (= lt!558707 (getCurrentListMapNoExtraKeys!5503 lt!558710 lt!558705 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!79143)

(declare-fun dynLambda!3374 (Int (_ BitVec 64)) V!46705)

(assert (=> b!1226132 (= lt!558705 (array!79144 (store (arr!38198 _values!996) i!673 (ValueCellFull!14882 (dynLambda!3374 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38734 _values!996)))))

(declare-fun lt!558709 () ListLongMap!18137)

(declare-fun _keys!1208 () array!79145)

(assert (=> b!1226132 (= lt!558709 (getCurrentListMapNoExtraKeys!5503 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!814890 () Bool)

(declare-fun e!696369 () Bool)

(assert (=> start!101790 (=> (not res!814890) (not e!696369))))

(assert (=> start!101790 (= res!814890 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38735 _keys!1208))))))

(assert (=> start!101790 e!696369))

(declare-fun tp_is_empty!31183 () Bool)

(assert (=> start!101790 tp_is_empty!31183))

(declare-fun array_inv!29046 (array!79145) Bool)

(assert (=> start!101790 (array_inv!29046 _keys!1208)))

(assert (=> start!101790 true))

(assert (=> start!101790 tp!92482))

(declare-fun e!696372 () Bool)

(declare-fun array_inv!29047 (array!79143) Bool)

(assert (=> start!101790 (and (array_inv!29047 _values!996) e!696372)))

(declare-fun b!1226133 () Bool)

(declare-fun res!814888 () Bool)

(assert (=> b!1226133 (=> (not res!814888) (not e!696369))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1226133 (= res!814888 (= (select (arr!38199 _keys!1208) i!673) k!934))))

(declare-fun b!1226134 () Bool)

(declare-fun res!814885 () Bool)

(assert (=> b!1226134 (=> (not res!814885) (not e!696369))))

(declare-datatypes ((List!26972 0))(
  ( (Nil!26969) (Cons!26968 (h!28177 (_ BitVec 64)) (t!40431 List!26972)) )
))
(declare-fun arrayNoDuplicates!0 (array!79145 (_ BitVec 32) List!26972) Bool)

(assert (=> b!1226134 (= res!814885 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26969))))

(declare-fun b!1226135 () Bool)

(declare-fun res!814889 () Bool)

(assert (=> b!1226135 (=> (not res!814889) (not e!696369))))

(assert (=> b!1226135 (= res!814889 (and (= (size!38734 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38735 _keys!1208) (size!38734 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226136 () Bool)

(declare-fun e!696370 () Bool)

(assert (=> b!1226136 (= e!696370 (not e!696368))))

(declare-fun res!814894 () Bool)

(assert (=> b!1226136 (=> res!814894 e!696368)))

(assert (=> b!1226136 (= res!814894 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226136 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40636 0))(
  ( (Unit!40637) )
))
(declare-fun lt!558708 () Unit!40636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79145 (_ BitVec 64) (_ BitVec 32)) Unit!40636)

(assert (=> b!1226136 (= lt!558708 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun e!696376 () Bool)

(declare-fun b!1226137 () Bool)

(declare-fun -!1983 (ListLongMap!18137 (_ BitVec 64)) ListLongMap!18137)

(assert (=> b!1226137 (= e!696376 (= lt!558707 (-!1983 lt!558709 k!934)))))

(declare-fun b!1226138 () Bool)

(declare-fun res!814887 () Bool)

(assert (=> b!1226138 (=> (not res!814887) (not e!696369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226138 (= res!814887 (validKeyInArray!0 k!934))))

(declare-fun b!1226139 () Bool)

(declare-fun res!814891 () Bool)

(assert (=> b!1226139 (=> (not res!814891) (not e!696369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226139 (= res!814891 (validMask!0 mask!1564))))

(declare-fun b!1226140 () Bool)

(declare-fun e!696375 () Bool)

(declare-fun mapRes!48673 () Bool)

(assert (=> b!1226140 (= e!696372 (and e!696375 mapRes!48673))))

(declare-fun condMapEmpty!48673 () Bool)

(declare-fun mapDefault!48673 () ValueCell!14882)

