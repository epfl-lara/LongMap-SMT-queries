; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99478 () Bool)

(assert start!99478)

(declare-fun b_free!25057 () Bool)

(declare-fun b_next!25057 () Bool)

(assert (=> start!99478 (= b_free!25057 (not b_next!25057))))

(declare-fun tp!87884 () Bool)

(declare-fun b_and!40981 () Bool)

(assert (=> start!99478 (= tp!87884 b_and!40981)))

(declare-fun b!1175711 () Bool)

(declare-fun res!780846 () Bool)

(declare-fun e!668313 () Bool)

(assert (=> b!1175711 (=> (not res!780846) (not e!668313))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175711 (= res!780846 (validMask!0 mask!1564))))

(declare-fun res!780847 () Bool)

(assert (=> start!99478 (=> (not res!780847) (not e!668313))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75981 0))(
  ( (array!75982 (arr!36640 (Array (_ BitVec 32) (_ BitVec 64))) (size!37176 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75981)

(assert (=> start!99478 (= res!780847 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37176 _keys!1208))))))

(assert (=> start!99478 e!668313))

(declare-fun tp_is_empty!29587 () Bool)

(assert (=> start!99478 tp_is_empty!29587))

(declare-fun array_inv!27986 (array!75981) Bool)

(assert (=> start!99478 (array_inv!27986 _keys!1208)))

(assert (=> start!99478 true))

(assert (=> start!99478 tp!87884))

(declare-datatypes ((V!44577 0))(
  ( (V!44578 (val!14850 Int)) )
))
(declare-datatypes ((ValueCell!14084 0))(
  ( (ValueCellFull!14084 (v!17488 V!44577)) (EmptyCell!14084) )
))
(declare-datatypes ((array!75983 0))(
  ( (array!75984 (arr!36641 (Array (_ BitVec 32) ValueCell!14084)) (size!37177 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75983)

(declare-fun e!668305 () Bool)

(declare-fun array_inv!27987 (array!75983) Bool)

(assert (=> start!99478 (and (array_inv!27987 _values!996) e!668305)))

(declare-fun b!1175712 () Bool)

(declare-fun res!780843 () Bool)

(assert (=> b!1175712 (=> (not res!780843) (not e!668313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75981 (_ BitVec 32)) Bool)

(assert (=> b!1175712 (= res!780843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175713 () Bool)

(declare-fun e!668311 () Bool)

(declare-fun mapRes!46208 () Bool)

(assert (=> b!1175713 (= e!668305 (and e!668311 mapRes!46208))))

(declare-fun condMapEmpty!46208 () Bool)

(declare-fun mapDefault!46208 () ValueCell!14084)

