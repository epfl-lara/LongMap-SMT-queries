; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99060 () Bool)

(assert start!99060)

(declare-fun b_free!24665 () Bool)

(declare-fun b_next!24665 () Bool)

(assert (=> start!99060 (= b_free!24665 (not b_next!24665))))

(declare-fun tp!86706 () Bool)

(declare-fun b_and!40179 () Bool)

(assert (=> start!99060 (= tp!86706 b_and!40179)))

(declare-fun res!772424 () Bool)

(declare-fun e!662211 () Bool)

(assert (=> start!99060 (=> (not res!772424) (not e!662211))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75221 0))(
  ( (array!75222 (arr!36261 (Array (_ BitVec 32) (_ BitVec 64))) (size!36797 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75221)

(assert (=> start!99060 (= res!772424 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36797 _keys!1208))))))

(assert (=> start!99060 e!662211))

(declare-fun tp_is_empty!29195 () Bool)

(assert (=> start!99060 tp_is_empty!29195))

(declare-fun array_inv!27740 (array!75221) Bool)

(assert (=> start!99060 (array_inv!27740 _keys!1208)))

(assert (=> start!99060 true))

(assert (=> start!99060 tp!86706))

(declare-datatypes ((V!44053 0))(
  ( (V!44054 (val!14654 Int)) )
))
(declare-datatypes ((ValueCell!13888 0))(
  ( (ValueCellFull!13888 (v!17291 V!44053)) (EmptyCell!13888) )
))
(declare-datatypes ((array!75223 0))(
  ( (array!75224 (arr!36262 (Array (_ BitVec 32) ValueCell!13888)) (size!36798 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75223)

(declare-fun e!662216 () Bool)

(declare-fun array_inv!27741 (array!75223) Bool)

(assert (=> start!99060 (and (array_inv!27741 _values!996) e!662216)))

(declare-fun b!1164754 () Bool)

(declare-fun res!772418 () Bool)

(assert (=> b!1164754 (=> (not res!772418) (not e!662211))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1164754 (= res!772418 (= (select (arr!36261 _keys!1208) i!673) k!934))))

(declare-fun b!1164755 () Bool)

(declare-fun res!772421 () Bool)

(assert (=> b!1164755 (=> (not res!772421) (not e!662211))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164755 (= res!772421 (validMask!0 mask!1564))))

(declare-fun b!1164756 () Bool)

(declare-fun e!662212 () Bool)

(declare-fun mapRes!45617 () Bool)

(assert (=> b!1164756 (= e!662216 (and e!662212 mapRes!45617))))

(declare-fun condMapEmpty!45617 () Bool)

(declare-fun mapDefault!45617 () ValueCell!13888)

