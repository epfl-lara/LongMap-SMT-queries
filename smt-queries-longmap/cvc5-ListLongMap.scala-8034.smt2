; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99044 () Bool)

(assert start!99044)

(declare-fun b_free!24649 () Bool)

(declare-fun b_next!24649 () Bool)

(assert (=> start!99044 (= b_free!24649 (not b_next!24649))))

(declare-fun tp!86658 () Bool)

(declare-fun b_and!40147 () Bool)

(assert (=> start!99044 (= tp!86658 b_and!40147)))

(declare-fun b!1164402 () Bool)

(declare-fun res!772154 () Bool)

(declare-fun e!662048 () Bool)

(assert (=> b!1164402 (=> (not res!772154) (not e!662048))))

(declare-datatypes ((array!75193 0))(
  ( (array!75194 (arr!36247 (Array (_ BitVec 32) (_ BitVec 64))) (size!36783 (_ BitVec 32))) )
))
(declare-fun lt!524631 () array!75193)

(declare-datatypes ((List!25412 0))(
  ( (Nil!25409) (Cons!25408 (h!26617 (_ BitVec 64)) (t!37053 List!25412)) )
))
(declare-fun arrayNoDuplicates!0 (array!75193 (_ BitVec 32) List!25412) Bool)

(assert (=> b!1164402 (= res!772154 (arrayNoDuplicates!0 lt!524631 #b00000000000000000000000000000000 Nil!25409))))

(declare-fun b!1164403 () Bool)

(declare-fun e!662043 () Bool)

(declare-fun tp_is_empty!29179 () Bool)

(assert (=> b!1164403 (= e!662043 tp_is_empty!29179)))

(declare-fun b!1164404 () Bool)

(declare-fun res!772159 () Bool)

(declare-fun e!662047 () Bool)

(assert (=> b!1164404 (=> (not res!772159) (not e!662047))))

(declare-fun _keys!1208 () array!75193)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44033 0))(
  ( (V!44034 (val!14646 Int)) )
))
(declare-datatypes ((ValueCell!13880 0))(
  ( (ValueCellFull!13880 (v!17283 V!44033)) (EmptyCell!13880) )
))
(declare-datatypes ((array!75195 0))(
  ( (array!75196 (arr!36248 (Array (_ BitVec 32) ValueCell!13880)) (size!36784 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75195)

(assert (=> b!1164404 (= res!772159 (and (= (size!36784 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36783 _keys!1208) (size!36784 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164405 () Bool)

(declare-fun res!772157 () Bool)

(assert (=> b!1164405 (=> (not res!772157) (not e!662047))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164405 (= res!772157 (validKeyInArray!0 k!934))))

(declare-fun b!1164406 () Bool)

(declare-fun res!772163 () Bool)

(assert (=> b!1164406 (=> (not res!772163) (not e!662047))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164406 (= res!772163 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36783 _keys!1208))))))

(declare-fun res!772155 () Bool)

(assert (=> start!99044 (=> (not res!772155) (not e!662047))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99044 (= res!772155 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36783 _keys!1208))))))

(assert (=> start!99044 e!662047))

(assert (=> start!99044 tp_is_empty!29179))

(declare-fun array_inv!27732 (array!75193) Bool)

(assert (=> start!99044 (array_inv!27732 _keys!1208)))

(assert (=> start!99044 true))

(assert (=> start!99044 tp!86658))

(declare-fun e!662045 () Bool)

(declare-fun array_inv!27733 (array!75195) Bool)

(assert (=> start!99044 (and (array_inv!27733 _values!996) e!662045)))

(declare-fun b!1164407 () Bool)

(declare-fun e!662049 () Bool)

(declare-fun mapRes!45593 () Bool)

(assert (=> b!1164407 (= e!662045 (and e!662049 mapRes!45593))))

(declare-fun condMapEmpty!45593 () Bool)

(declare-fun mapDefault!45593 () ValueCell!13880)

