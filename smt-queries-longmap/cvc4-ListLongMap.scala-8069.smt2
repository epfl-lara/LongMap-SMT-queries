; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99284 () Bool)

(assert start!99284)

(declare-fun b_free!24863 () Bool)

(declare-fun b_next!24863 () Bool)

(assert (=> start!99284 (= b_free!24863 (not b_next!24863))))

(declare-fun tp!87303 () Bool)

(declare-fun b_and!40593 () Bool)

(assert (=> start!99284 (= tp!87303 b_and!40593)))

(declare-fun res!776118 () Bool)

(declare-fun e!664756 () Bool)

(assert (=> start!99284 (=> (not res!776118) (not e!664756))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75609 0))(
  ( (array!75610 (arr!36454 (Array (_ BitVec 32) (_ BitVec 64))) (size!36990 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75609)

(assert (=> start!99284 (= res!776118 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36990 _keys!1208))))))

(assert (=> start!99284 e!664756))

(declare-fun tp_is_empty!29393 () Bool)

(assert (=> start!99284 tp_is_empty!29393))

(declare-fun array_inv!27862 (array!75609) Bool)

(assert (=> start!99284 (array_inv!27862 _keys!1208)))

(assert (=> start!99284 true))

(assert (=> start!99284 tp!87303))

(declare-datatypes ((V!44317 0))(
  ( (V!44318 (val!14753 Int)) )
))
(declare-datatypes ((ValueCell!13987 0))(
  ( (ValueCellFull!13987 (v!17391 V!44317)) (EmptyCell!13987) )
))
(declare-datatypes ((array!75611 0))(
  ( (array!75612 (arr!36455 (Array (_ BitVec 32) ValueCell!13987)) (size!36991 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75611)

(declare-fun e!664750 () Bool)

(declare-fun array_inv!27863 (array!75611) Bool)

(assert (=> start!99284 (and (array_inv!27863 _values!996) e!664750)))

(declare-fun b!1169618 () Bool)

(declare-fun e!664758 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169618 (= e!664758 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1169619 () Bool)

(declare-fun e!664754 () Bool)

(assert (=> b!1169619 (= e!664754 tp_is_empty!29393)))

(declare-fun b!1169620 () Bool)

(declare-fun res!776112 () Bool)

(assert (=> b!1169620 (=> (not res!776112) (not e!664756))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169620 (= res!776112 (validMask!0 mask!1564))))

(declare-fun b!1169621 () Bool)

(declare-fun mapRes!45917 () Bool)

(assert (=> b!1169621 (= e!664750 (and e!664754 mapRes!45917))))

(declare-fun condMapEmpty!45917 () Bool)

(declare-fun mapDefault!45917 () ValueCell!13987)

