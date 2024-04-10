; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100042 () Bool)

(assert start!100042)

(declare-fun b_free!25621 () Bool)

(declare-fun b_next!25621 () Bool)

(assert (=> start!100042 (= b_free!25621 (not b_next!25621))))

(declare-fun tp!89576 () Bool)

(declare-fun b_and!42109 () Bool)

(assert (=> start!100042 (= tp!89576 b_and!42109)))

(declare-fun b!1192267 () Bool)

(declare-fun e!677693 () Bool)

(declare-fun e!677692 () Bool)

(assert (=> b!1192267 (= e!677693 (not e!677692))))

(declare-fun res!793120 () Bool)

(assert (=> b!1192267 (=> res!793120 e!677692)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192267 (= res!793120 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77089 0))(
  ( (array!77090 (arr!37194 (Array (_ BitVec 32) (_ BitVec 64))) (size!37730 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77089)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192267 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39552 0))(
  ( (Unit!39553) )
))
(declare-fun lt!542152 () Unit!39552)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77089 (_ BitVec 64) (_ BitVec 32)) Unit!39552)

(assert (=> b!1192267 (= lt!542152 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1192268 () Bool)

(declare-fun e!677696 () Bool)

(declare-fun e!677694 () Bool)

(declare-fun mapRes!47054 () Bool)

(assert (=> b!1192268 (= e!677696 (and e!677694 mapRes!47054))))

(declare-fun condMapEmpty!47054 () Bool)

(declare-datatypes ((V!45329 0))(
  ( (V!45330 (val!15132 Int)) )
))
(declare-datatypes ((ValueCell!14366 0))(
  ( (ValueCellFull!14366 (v!17770 V!45329)) (EmptyCell!14366) )
))
(declare-datatypes ((array!77091 0))(
  ( (array!77092 (arr!37195 (Array (_ BitVec 32) ValueCell!14366)) (size!37731 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77091)

(declare-fun mapDefault!47054 () ValueCell!14366)

