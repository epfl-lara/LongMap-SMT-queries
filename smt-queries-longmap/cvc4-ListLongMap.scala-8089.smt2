; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99404 () Bool)

(assert start!99404)

(declare-fun b_free!24983 () Bool)

(declare-fun b_next!24983 () Bool)

(assert (=> start!99404 (= b_free!24983 (not b_next!24983))))

(declare-fun tp!87662 () Bool)

(declare-fun b_and!40833 () Bool)

(assert (=> start!99404 (= tp!87662 b_and!40833)))

(declare-fun res!779191 () Bool)

(declare-fun e!666978 () Bool)

(assert (=> start!99404 (=> (not res!779191) (not e!666978))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75837 0))(
  ( (array!75838 (arr!36568 (Array (_ BitVec 32) (_ BitVec 64))) (size!37104 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75837)

(assert (=> start!99404 (= res!779191 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37104 _keys!1208))))))

(assert (=> start!99404 e!666978))

(declare-fun tp_is_empty!29513 () Bool)

(assert (=> start!99404 tp_is_empty!29513))

(declare-fun array_inv!27938 (array!75837) Bool)

(assert (=> start!99404 (array_inv!27938 _keys!1208)))

(assert (=> start!99404 true))

(assert (=> start!99404 tp!87662))

(declare-datatypes ((V!44477 0))(
  ( (V!44478 (val!14813 Int)) )
))
(declare-datatypes ((ValueCell!14047 0))(
  ( (ValueCellFull!14047 (v!17451 V!44477)) (EmptyCell!14047) )
))
(declare-datatypes ((array!75839 0))(
  ( (array!75840 (arr!36569 (Array (_ BitVec 32) ValueCell!14047)) (size!37105 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75839)

(declare-fun e!666977 () Bool)

(declare-fun array_inv!27939 (array!75839) Bool)

(assert (=> start!99404 (and (array_inv!27939 _values!996) e!666977)))

(declare-fun b!1173417 () Bool)

(declare-fun res!779178 () Bool)

(assert (=> b!1173417 (=> (not res!779178) (not e!666978))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173417 (= res!779178 (validMask!0 mask!1564))))

(declare-fun b!1173418 () Bool)

(declare-fun e!666974 () Bool)

(declare-fun mapRes!46097 () Bool)

(assert (=> b!1173418 (= e!666977 (and e!666974 mapRes!46097))))

(declare-fun condMapEmpty!46097 () Bool)

(declare-fun mapDefault!46097 () ValueCell!14047)

