; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99914 () Bool)

(assert start!99914)

(declare-fun b_free!25493 () Bool)

(declare-fun b_next!25493 () Bool)

(assert (=> start!99914 (= b_free!25493 (not b_next!25493))))

(declare-fun tp!89193 () Bool)

(declare-fun b_and!41853 () Bool)

(assert (=> start!99914 (= tp!89193 b_and!41853)))

(declare-fun b!1189259 () Bool)

(declare-fun res!790813 () Bool)

(declare-fun e!676162 () Bool)

(assert (=> b!1189259 (=> (not res!790813) (not e!676162))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76841 0))(
  ( (array!76842 (arr!37070 (Array (_ BitVec 32) (_ BitVec 64))) (size!37606 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76841)

(assert (=> b!1189259 (= res!790813 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37606 _keys!1208))))))

(declare-fun b!1189260 () Bool)

(declare-fun res!790816 () Bool)

(assert (=> b!1189260 (=> (not res!790816) (not e!676162))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1189260 (= res!790816 (= (select (arr!37070 _keys!1208) i!673) k!934))))

(declare-fun res!790814 () Bool)

(assert (=> start!99914 (=> (not res!790814) (not e!676162))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99914 (= res!790814 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37606 _keys!1208))))))

(assert (=> start!99914 e!676162))

(declare-fun tp_is_empty!30023 () Bool)

(assert (=> start!99914 tp_is_empty!30023))

(declare-fun array_inv!28274 (array!76841) Bool)

(assert (=> start!99914 (array_inv!28274 _keys!1208)))

(assert (=> start!99914 true))

(assert (=> start!99914 tp!89193))

(declare-datatypes ((V!45157 0))(
  ( (V!45158 (val!15068 Int)) )
))
(declare-datatypes ((ValueCell!14302 0))(
  ( (ValueCellFull!14302 (v!17706 V!45157)) (EmptyCell!14302) )
))
(declare-datatypes ((array!76843 0))(
  ( (array!76844 (arr!37071 (Array (_ BitVec 32) ValueCell!14302)) (size!37607 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76843)

(declare-fun e!676156 () Bool)

(declare-fun array_inv!28275 (array!76843) Bool)

(assert (=> start!99914 (and (array_inv!28275 _values!996) e!676156)))

(declare-fun b!1189261 () Bool)

(declare-fun e!676159 () Bool)

(declare-fun e!676155 () Bool)

(assert (=> b!1189261 (= e!676159 e!676155)))

(declare-fun res!790815 () Bool)

(assert (=> b!1189261 (=> res!790815 e!676155)))

(assert (=> b!1189261 (= res!790815 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540998 () array!76841)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541001 () array!76843)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45157)

(declare-fun zeroValue!944 () V!45157)

(declare-datatypes ((tuple2!19352 0))(
  ( (tuple2!19353 (_1!9687 (_ BitVec 64)) (_2!9687 V!45157)) )
))
(declare-datatypes ((List!26097 0))(
  ( (Nil!26094) (Cons!26093 (h!27302 tuple2!19352) (t!38582 List!26097)) )
))
(declare-datatypes ((ListLongMap!17321 0))(
  ( (ListLongMap!17322 (toList!8676 List!26097)) )
))
(declare-fun lt!540997 () ListLongMap!17321)

(declare-fun getCurrentListMapNoExtraKeys!5117 (array!76841 array!76843 (_ BitVec 32) (_ BitVec 32) V!45157 V!45157 (_ BitVec 32) Int) ListLongMap!17321)

(assert (=> b!1189261 (= lt!540997 (getCurrentListMapNoExtraKeys!5117 lt!540998 lt!541001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3061 (Int (_ BitVec 64)) V!45157)

(assert (=> b!1189261 (= lt!541001 (array!76844 (store (arr!37071 _values!996) i!673 (ValueCellFull!14302 (dynLambda!3061 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37607 _values!996)))))

(declare-fun lt!540999 () ListLongMap!17321)

(assert (=> b!1189261 (= lt!540999 (getCurrentListMapNoExtraKeys!5117 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46862 () Bool)

(declare-fun mapRes!46862 () Bool)

(assert (=> mapIsEmpty!46862 mapRes!46862))

(declare-fun b!1189262 () Bool)

(declare-fun e!676158 () Bool)

(assert (=> b!1189262 (= e!676156 (and e!676158 mapRes!46862))))

(declare-fun condMapEmpty!46862 () Bool)

(declare-fun mapDefault!46862 () ValueCell!14302)

