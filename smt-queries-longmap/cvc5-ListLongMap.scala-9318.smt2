; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111344 () Bool)

(assert start!111344)

(declare-fun mapIsEmpty!55379 () Bool)

(declare-fun mapRes!55379 () Bool)

(assert (=> mapIsEmpty!55379 mapRes!55379))

(declare-fun mapNonEmpty!55379 () Bool)

(declare-fun tp!105485 () Bool)

(declare-fun e!751847 () Bool)

(assert (=> mapNonEmpty!55379 (= mapRes!55379 (and tp!105485 e!751847))))

(declare-datatypes ((V!52865 0))(
  ( (V!52866 (val!17985 Int)) )
))
(declare-datatypes ((ValueCell!17012 0))(
  ( (ValueCellFull!17012 (v!20615 V!52865)) (EmptyCell!17012) )
))
(declare-datatypes ((array!88596 0))(
  ( (array!88597 (arr!42772 (Array (_ BitVec 32) ValueCell!17012)) (size!43322 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88596)

(declare-fun mapRest!55379 () (Array (_ BitVec 32) ValueCell!17012))

(declare-fun mapValue!55379 () ValueCell!17012)

(declare-fun mapKey!55379 () (_ BitVec 32))

(assert (=> mapNonEmpty!55379 (= (arr!42772 _values!1337) (store mapRest!55379 mapKey!55379 mapValue!55379))))

(declare-fun res!874436 () Bool)

(declare-fun e!751846 () Bool)

(assert (=> start!111344 (=> (not res!874436) (not e!751846))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111344 (= res!874436 (validMask!0 mask!2019))))

(assert (=> start!111344 e!751846))

(declare-datatypes ((array!88598 0))(
  ( (array!88599 (arr!42773 (Array (_ BitVec 32) (_ BitVec 64))) (size!43323 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88598)

(declare-fun array_inv!32305 (array!88598) Bool)

(assert (=> start!111344 (array_inv!32305 _keys!1609)))

(assert (=> start!111344 true))

(declare-fun e!751848 () Bool)

(declare-fun array_inv!32306 (array!88596) Bool)

(assert (=> start!111344 (and (array_inv!32306 _values!1337) e!751848)))

(declare-fun b!1317539 () Bool)

(declare-fun e!751849 () Bool)

(declare-fun tp_is_empty!35821 () Bool)

(assert (=> b!1317539 (= e!751849 tp_is_empty!35821)))

(declare-fun b!1317540 () Bool)

(declare-fun res!874435 () Bool)

(assert (=> b!1317540 (=> (not res!874435) (not e!751846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88598 (_ BitVec 32)) Bool)

(assert (=> b!1317540 (= res!874435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317541 () Bool)

(assert (=> b!1317541 (= e!751847 tp_is_empty!35821)))

(declare-fun b!1317542 () Bool)

(declare-fun res!874433 () Bool)

(assert (=> b!1317542 (=> (not res!874433) (not e!751846))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317542 (= res!874433 (and (= (size!43322 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43323 _keys!1609) (size!43322 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317543 () Bool)

(assert (=> b!1317543 (= e!751848 (and e!751849 mapRes!55379))))

(declare-fun condMapEmpty!55379 () Bool)

(declare-fun mapDefault!55379 () ValueCell!17012)

