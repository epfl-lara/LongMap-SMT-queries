; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99988 () Bool)

(assert start!99988)

(declare-fun b_free!25567 () Bool)

(declare-fun b_next!25567 () Bool)

(assert (=> start!99988 (= b_free!25567 (not b_next!25567))))

(declare-fun tp!89415 () Bool)

(declare-fun b_and!42001 () Bool)

(assert (=> start!99988 (= tp!89415 b_and!42001)))

(declare-fun b!1190998 () Bool)

(declare-fun e!677044 () Bool)

(declare-fun e!677049 () Bool)

(assert (=> b!1190998 (= e!677044 (not e!677049))))

(declare-fun res!792143 () Bool)

(assert (=> b!1190998 (=> res!792143 e!677049)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190998 (= res!792143 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76985 0))(
  ( (array!76986 (arr!37142 (Array (_ BitVec 32) (_ BitVec 64))) (size!37678 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76985)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190998 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39508 0))(
  ( (Unit!39509) )
))
(declare-fun lt!541664 () Unit!39508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76985 (_ BitVec 64) (_ BitVec 32)) Unit!39508)

(assert (=> b!1190998 (= lt!541664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!792148 () Bool)

(declare-fun e!677048 () Bool)

(assert (=> start!99988 (=> (not res!792148) (not e!677048))))

(assert (=> start!99988 (= res!792148 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37678 _keys!1208))))))

(assert (=> start!99988 e!677048))

(declare-fun tp_is_empty!30097 () Bool)

(assert (=> start!99988 tp_is_empty!30097))

(declare-fun array_inv!28324 (array!76985) Bool)

(assert (=> start!99988 (array_inv!28324 _keys!1208)))

(assert (=> start!99988 true))

(assert (=> start!99988 tp!89415))

(declare-datatypes ((V!45257 0))(
  ( (V!45258 (val!15105 Int)) )
))
(declare-datatypes ((ValueCell!14339 0))(
  ( (ValueCellFull!14339 (v!17743 V!45257)) (EmptyCell!14339) )
))
(declare-datatypes ((array!76987 0))(
  ( (array!76988 (arr!37143 (Array (_ BitVec 32) ValueCell!14339)) (size!37679 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76987)

(declare-fun e!677043 () Bool)

(declare-fun array_inv!28325 (array!76987) Bool)

(assert (=> start!99988 (and (array_inv!28325 _values!996) e!677043)))

(declare-fun b!1190999 () Bool)

(declare-fun e!677050 () Bool)

(assert (=> b!1190999 (= e!677050 true)))

(declare-fun zeroValue!944 () V!45257)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541666 () array!76985)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541667 () array!76987)

(declare-fun minValue!944 () V!45257)

(declare-datatypes ((tuple2!19410 0))(
  ( (tuple2!19411 (_1!9716 (_ BitVec 64)) (_2!9716 V!45257)) )
))
(declare-datatypes ((List!26155 0))(
  ( (Nil!26152) (Cons!26151 (h!27360 tuple2!19410) (t!38714 List!26155)) )
))
(declare-datatypes ((ListLongMap!17379 0))(
  ( (ListLongMap!17380 (toList!8705 List!26155)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5146 (array!76985 array!76987 (_ BitVec 32) (_ BitVec 32) V!45257 V!45257 (_ BitVec 32) Int) ListLongMap!17379)

(declare-fun -!1731 (ListLongMap!17379 (_ BitVec 64)) ListLongMap!17379)

(assert (=> b!1190999 (= (getCurrentListMapNoExtraKeys!5146 lt!541666 lt!541667 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1731 (getCurrentListMapNoExtraKeys!5146 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!541665 () Unit!39508)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!940 (array!76985 array!76987 (_ BitVec 32) (_ BitVec 32) V!45257 V!45257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39508)

(assert (=> b!1190999 (= lt!541665 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!940 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191000 () Bool)

(declare-fun res!792140 () Bool)

(assert (=> b!1191000 (=> (not res!792140) (not e!677048))))

(assert (=> b!1191000 (= res!792140 (= (select (arr!37142 _keys!1208) i!673) k!934))))

(declare-fun b!1191001 () Bool)

(declare-fun res!792146 () Bool)

(assert (=> b!1191001 (=> (not res!792146) (not e!677048))))

(assert (=> b!1191001 (= res!792146 (and (= (size!37679 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37678 _keys!1208) (size!37679 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191002 () Bool)

(declare-fun res!792144 () Bool)

(assert (=> b!1191002 (=> (not res!792144) (not e!677048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191002 (= res!792144 (validMask!0 mask!1564))))

(declare-fun b!1191003 () Bool)

(declare-fun e!677047 () Bool)

(assert (=> b!1191003 (= e!677047 tp_is_empty!30097)))

(declare-fun b!1191004 () Bool)

(declare-fun res!792142 () Bool)

(assert (=> b!1191004 (=> (not res!792142) (not e!677048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191004 (= res!792142 (validKeyInArray!0 k!934))))

(declare-fun b!1191005 () Bool)

(declare-fun res!792151 () Bool)

(assert (=> b!1191005 (=> (not res!792151) (not e!677048))))

(declare-datatypes ((List!26156 0))(
  ( (Nil!26153) (Cons!26152 (h!27361 (_ BitVec 64)) (t!38715 List!26156)) )
))
(declare-fun arrayNoDuplicates!0 (array!76985 (_ BitVec 32) List!26156) Bool)

(assert (=> b!1191005 (= res!792151 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26153))))

(declare-fun b!1191006 () Bool)

(declare-fun e!677045 () Bool)

(declare-fun mapRes!46973 () Bool)

(assert (=> b!1191006 (= e!677043 (and e!677045 mapRes!46973))))

(declare-fun condMapEmpty!46973 () Bool)

(declare-fun mapDefault!46973 () ValueCell!14339)

