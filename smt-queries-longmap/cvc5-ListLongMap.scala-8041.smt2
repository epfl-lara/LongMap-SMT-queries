; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99086 () Bool)

(assert start!99086)

(declare-fun b_free!24691 () Bool)

(declare-fun b_next!24691 () Bool)

(assert (=> start!99086 (= b_free!24691 (not b_next!24691))))

(declare-fun tp!86783 () Bool)

(declare-fun b_and!40231 () Bool)

(assert (=> start!99086 (= tp!86783 b_and!40231)))

(declare-fun b!1165326 () Bool)

(declare-fun res!772846 () Bool)

(declare-fun e!662488 () Bool)

(assert (=> b!1165326 (=> (not res!772846) (not e!662488))))

(declare-datatypes ((array!75273 0))(
  ( (array!75274 (arr!36287 (Array (_ BitVec 32) (_ BitVec 64))) (size!36823 (_ BitVec 32))) )
))
(declare-fun lt!524883 () array!75273)

(declare-datatypes ((List!25440 0))(
  ( (Nil!25437) (Cons!25436 (h!26645 (_ BitVec 64)) (t!37123 List!25440)) )
))
(declare-fun arrayNoDuplicates!0 (array!75273 (_ BitVec 32) List!25440) Bool)

(assert (=> b!1165326 (= res!772846 (arrayNoDuplicates!0 lt!524883 #b00000000000000000000000000000000 Nil!25437))))

(declare-fun res!772851 () Bool)

(declare-fun e!662485 () Bool)

(assert (=> start!99086 (=> (not res!772851) (not e!662485))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!75273)

(assert (=> start!99086 (= res!772851 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36823 _keys!1208))))))

(assert (=> start!99086 e!662485))

(declare-fun tp_is_empty!29221 () Bool)

(assert (=> start!99086 tp_is_empty!29221))

(declare-fun array_inv!27756 (array!75273) Bool)

(assert (=> start!99086 (array_inv!27756 _keys!1208)))

(assert (=> start!99086 true))

(assert (=> start!99086 tp!86783))

(declare-datatypes ((V!44089 0))(
  ( (V!44090 (val!14667 Int)) )
))
(declare-datatypes ((ValueCell!13901 0))(
  ( (ValueCellFull!13901 (v!17304 V!44089)) (EmptyCell!13901) )
))
(declare-datatypes ((array!75275 0))(
  ( (array!75276 (arr!36288 (Array (_ BitVec 32) ValueCell!13901)) (size!36824 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75275)

(declare-fun e!662489 () Bool)

(declare-fun array_inv!27757 (array!75275) Bool)

(assert (=> start!99086 (and (array_inv!27757 _values!996) e!662489)))

(declare-fun b!1165327 () Bool)

(declare-fun e!662486 () Bool)

(declare-fun mapRes!45656 () Bool)

(assert (=> b!1165327 (= e!662489 (and e!662486 mapRes!45656))))

(declare-fun condMapEmpty!45656 () Bool)

(declare-fun mapDefault!45656 () ValueCell!13901)

