; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99688 () Bool)

(assert start!99688)

(declare-fun b_free!25267 () Bool)

(declare-fun b_next!25267 () Bool)

(assert (=> start!99688 (= b_free!25267 (not b_next!25267))))

(declare-fun tp!88515 () Bool)

(declare-fun b_and!41401 () Bool)

(assert (=> start!99688 (= tp!88515 b_and!41401)))

(declare-fun b!1182563 () Bool)

(declare-fun e!672344 () Bool)

(declare-fun e!672335 () Bool)

(assert (=> b!1182563 (= e!672344 e!672335)))

(declare-fun res!785912 () Bool)

(assert (=> b!1182563 (=> res!785912 e!672335)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182563 (= res!785912 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44857 0))(
  ( (V!44858 (val!14955 Int)) )
))
(declare-fun zeroValue!944 () V!44857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14189 0))(
  ( (ValueCellFull!14189 (v!17593 V!44857)) (EmptyCell!14189) )
))
(declare-datatypes ((array!76397 0))(
  ( (array!76398 (arr!36848 (Array (_ BitVec 32) ValueCell!14189)) (size!37384 (_ BitVec 32))) )
))
(declare-fun lt!535366 () array!76397)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19168 0))(
  ( (tuple2!19169 (_1!9595 (_ BitVec 64)) (_2!9595 V!44857)) )
))
(declare-datatypes ((List!25909 0))(
  ( (Nil!25906) (Cons!25905 (h!27114 tuple2!19168) (t!38168 List!25909)) )
))
(declare-datatypes ((ListLongMap!17137 0))(
  ( (ListLongMap!17138 (toList!8584 List!25909)) )
))
(declare-fun lt!535367 () ListLongMap!17137)

(declare-fun minValue!944 () V!44857)

(declare-datatypes ((array!76399 0))(
  ( (array!76400 (arr!36849 (Array (_ BitVec 32) (_ BitVec 64))) (size!37385 (_ BitVec 32))) )
))
(declare-fun lt!535362 () array!76399)

(declare-fun getCurrentListMapNoExtraKeys!5035 (array!76399 array!76397 (_ BitVec 32) (_ BitVec 32) V!44857 V!44857 (_ BitVec 32) Int) ListLongMap!17137)

(assert (=> b!1182563 (= lt!535367 (getCurrentListMapNoExtraKeys!5035 lt!535362 lt!535366 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535379 () V!44857)

(declare-fun _values!996 () array!76397)

(assert (=> b!1182563 (= lt!535366 (array!76398 (store (arr!36848 _values!996) i!673 (ValueCellFull!14189 lt!535379)) (size!37384 _values!996)))))

(declare-fun dynLambda!2990 (Int (_ BitVec 64)) V!44857)

(assert (=> b!1182563 (= lt!535379 (dynLambda!2990 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76399)

(declare-fun lt!535364 () ListLongMap!17137)

(assert (=> b!1182563 (= lt!535364 (getCurrentListMapNoExtraKeys!5035 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182564 () Bool)

(declare-fun res!785913 () Bool)

(declare-fun e!672337 () Bool)

(assert (=> b!1182564 (=> (not res!785913) (not e!672337))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1182564 (= res!785913 (= (select (arr!36849 _keys!1208) i!673) k!934))))

(declare-fun b!1182565 () Bool)

(declare-fun e!672343 () Bool)

(declare-fun e!672341 () Bool)

(declare-fun mapRes!46523 () Bool)

(assert (=> b!1182565 (= e!672343 (and e!672341 mapRes!46523))))

(declare-fun condMapEmpty!46523 () Bool)

(declare-fun mapDefault!46523 () ValueCell!14189)

