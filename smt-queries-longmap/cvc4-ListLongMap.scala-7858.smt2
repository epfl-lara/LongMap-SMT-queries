; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97896 () Bool)

(assert start!97896)

(declare-fun b_free!23597 () Bool)

(declare-fun b_next!23597 () Bool)

(assert (=> start!97896 (= b_free!23597 (not b_next!23597))))

(declare-fun tp!83495 () Bool)

(declare-fun b_and!37977 () Bool)

(assert (=> start!97896 (= tp!83495 b_and!37977)))

(declare-fun b!1121163 () Bool)

(declare-fun res!749004 () Bool)

(declare-fun e!638376 () Bool)

(assert (=> b!1121163 (=> (not res!749004) (not e!638376))))

(declare-datatypes ((array!73135 0))(
  ( (array!73136 (arr!35220 (Array (_ BitVec 32) (_ BitVec 64))) (size!35756 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73135)

(declare-datatypes ((List!24506 0))(
  ( (Nil!24503) (Cons!24502 (h!25711 (_ BitVec 64)) (t!35095 List!24506)) )
))
(declare-fun arrayNoDuplicates!0 (array!73135 (_ BitVec 32) List!24506) Bool)

(assert (=> b!1121163 (= res!749004 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24503))))

(declare-fun b!1121164 () Bool)

(declare-fun res!749009 () Bool)

(assert (=> b!1121164 (=> (not res!749009) (not e!638376))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42629 0))(
  ( (V!42630 (val!14120 Int)) )
))
(declare-datatypes ((ValueCell!13354 0))(
  ( (ValueCellFull!13354 (v!16753 V!42629)) (EmptyCell!13354) )
))
(declare-datatypes ((array!73137 0))(
  ( (array!73138 (arr!35221 (Array (_ BitVec 32) ValueCell!13354)) (size!35757 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73137)

(assert (=> b!1121164 (= res!749009 (and (= (size!35757 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35756 _keys!1208) (size!35757 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121165 () Bool)

(declare-fun e!638381 () Bool)

(declare-fun e!638377 () Bool)

(declare-fun mapRes!44008 () Bool)

(assert (=> b!1121165 (= e!638381 (and e!638377 mapRes!44008))))

(declare-fun condMapEmpty!44008 () Bool)

(declare-fun mapDefault!44008 () ValueCell!13354)

