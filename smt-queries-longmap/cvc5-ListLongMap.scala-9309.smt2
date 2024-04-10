; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111278 () Bool)

(assert start!111278)

(declare-fun b!1316996 () Bool)

(declare-fun e!751407 () Bool)

(declare-fun e!751404 () Bool)

(assert (=> b!1316996 (= e!751407 e!751404)))

(declare-fun res!874149 () Bool)

(assert (=> b!1316996 (=> res!874149 e!751404)))

(declare-datatypes ((List!30291 0))(
  ( (Nil!30288) (Cons!30287 (h!31496 (_ BitVec 64)) (t!43899 List!30291)) )
))
(declare-fun contains!8573 (List!30291 (_ BitVec 64)) Bool)

(assert (=> b!1316996 (= res!874149 (contains!8573 Nil!30288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316997 () Bool)

(declare-fun res!874148 () Bool)

(assert (=> b!1316997 (=> (not res!874148) (not e!751407))))

(declare-datatypes ((array!88496 0))(
  ( (array!88497 (arr!42723 (Array (_ BitVec 32) (_ BitVec 64))) (size!43273 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88496)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52793 0))(
  ( (V!52794 (val!17958 Int)) )
))
(declare-datatypes ((ValueCell!16985 0))(
  ( (ValueCellFull!16985 (v!20587 V!52793)) (EmptyCell!16985) )
))
(declare-datatypes ((array!88498 0))(
  ( (array!88499 (arr!42724 (Array (_ BitVec 32) ValueCell!16985)) (size!43274 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88498)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1316997 (= res!874148 (and (= (size!43274 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43273 _keys!1609) (size!43274 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!874150 () Bool)

(assert (=> start!111278 (=> (not res!874150) (not e!751407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111278 (= res!874150 (validMask!0 mask!2019))))

(assert (=> start!111278 e!751407))

(assert (=> start!111278 true))

(declare-fun e!751406 () Bool)

(declare-fun array_inv!32265 (array!88498) Bool)

(assert (=> start!111278 (and (array_inv!32265 _values!1337) e!751406)))

(declare-fun array_inv!32266 (array!88496) Bool)

(assert (=> start!111278 (array_inv!32266 _keys!1609)))

(declare-fun b!1316998 () Bool)

(declare-fun res!874152 () Bool)

(assert (=> b!1316998 (=> (not res!874152) (not e!751407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88496 (_ BitVec 32)) Bool)

(assert (=> b!1316998 (= res!874152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55295 () Bool)

(declare-fun mapRes!55295 () Bool)

(assert (=> mapIsEmpty!55295 mapRes!55295))

(declare-fun b!1316999 () Bool)

(declare-fun res!874147 () Bool)

(assert (=> b!1316999 (=> (not res!874147) (not e!751407))))

(assert (=> b!1316999 (= res!874147 (and (bvsle #b00000000000000000000000000000000 (size!43273 _keys!1609)) (bvslt (size!43273 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun b!1317000 () Bool)

(declare-fun e!751405 () Bool)

(declare-fun tp_is_empty!35767 () Bool)

(assert (=> b!1317000 (= e!751405 tp_is_empty!35767)))

(declare-fun b!1317001 () Bool)

(assert (=> b!1317001 (= e!751404 (contains!8573 Nil!30288 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317002 () Bool)

(declare-fun res!874151 () Bool)

(assert (=> b!1317002 (=> (not res!874151) (not e!751407))))

(declare-fun noDuplicate!2062 (List!30291) Bool)

(assert (=> b!1317002 (= res!874151 (noDuplicate!2062 Nil!30288))))

(declare-fun mapNonEmpty!55295 () Bool)

(declare-fun tp!105401 () Bool)

(assert (=> mapNonEmpty!55295 (= mapRes!55295 (and tp!105401 e!751405))))

(declare-fun mapRest!55295 () (Array (_ BitVec 32) ValueCell!16985))

(declare-fun mapKey!55295 () (_ BitVec 32))

(declare-fun mapValue!55295 () ValueCell!16985)

(assert (=> mapNonEmpty!55295 (= (arr!42724 _values!1337) (store mapRest!55295 mapKey!55295 mapValue!55295))))

(declare-fun b!1317003 () Bool)

(declare-fun e!751409 () Bool)

(assert (=> b!1317003 (= e!751406 (and e!751409 mapRes!55295))))

(declare-fun condMapEmpty!55295 () Bool)

(declare-fun mapDefault!55295 () ValueCell!16985)

