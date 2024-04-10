; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!990 () Bool)

(assert start!990)

(declare-fun b_free!341 () Bool)

(declare-fun b_next!341 () Bool)

(assert (=> start!990 (= b_free!341 (not b_next!341))))

(declare-fun tp!1258 () Bool)

(declare-fun b_and!491 () Bool)

(assert (=> start!990 (= tp!1258 b_and!491)))

(declare-fun b!8528 () Bool)

(declare-fun res!8012 () Bool)

(declare-fun e!4847 () Bool)

(assert (=> b!8528 (=> (not res!8012) (not e!4847))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((V!735 0))(
  ( (V!736 (val!215 Int)) )
))
(declare-datatypes ((ValueCell!193 0))(
  ( (ValueCellFull!193 (v!1308 V!735)) (EmptyCell!193) )
))
(declare-datatypes ((array!769 0))(
  ( (array!770 (arr!371 (Array (_ BitVec 32) ValueCell!193)) (size!433 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!769)

(declare-fun minValue!1434 () V!735)

(declare-datatypes ((array!771 0))(
  ( (array!772 (arr!372 (Array (_ BitVec 32) (_ BitVec 64))) (size!434 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!771)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!735)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((tuple2!246 0))(
  ( (tuple2!247 (_1!123 (_ BitVec 64)) (_2!123 V!735)) )
))
(declare-datatypes ((List!256 0))(
  ( (Nil!253) (Cons!252 (h!818 tuple2!246) (t!2395 List!256)) )
))
(declare-datatypes ((ListLongMap!251 0))(
  ( (ListLongMap!252 (toList!141 List!256)) )
))
(declare-fun contains!117 (ListLongMap!251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!100 (array!771 array!769 (_ BitVec 32) (_ BitVec 32) V!735 V!735 (_ BitVec 32) Int) ListLongMap!251)

(assert (=> b!8528 (= res!8012 (contains!117 (getCurrentListMap!100 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8529 () Bool)

(declare-fun res!8013 () Bool)

(assert (=> b!8529 (=> (not res!8013) (not e!4847))))

(declare-datatypes ((List!257 0))(
  ( (Nil!254) (Cons!253 (h!819 (_ BitVec 64)) (t!2396 List!257)) )
))
(declare-fun arrayNoDuplicates!0 (array!771 (_ BitVec 32) List!257) Bool)

(assert (=> b!8529 (= res!8013 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!254))))

(declare-fun b!8530 () Bool)

(declare-fun res!8011 () Bool)

(assert (=> b!8530 (=> (not res!8011) (not e!4847))))

(assert (=> b!8530 (= res!8011 (and (= (size!433 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!434 _keys!1806) (size!433 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8531 () Bool)

(declare-fun e!4848 () Bool)

(declare-fun lt!1778 () (_ BitVec 32))

(assert (=> b!8531 (= e!4848 (or (not (= (size!434 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))) (bvsgt #b00000000000000000000000000000000 (size!434 _keys!1806)) (and (bvsge lt!1778 #b00000000000000000000000000000000) (bvsle lt!1778 (size!434 _keys!1806)))))))

(declare-fun arrayScanForKey!0 (array!771 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8531 (= lt!1778 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8532 () Bool)

(declare-fun e!4853 () Bool)

(declare-fun arrayContainsKey!0 (array!771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8532 (= e!4853 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8533 () Bool)

(assert (=> b!8533 (= e!4847 (not e!4848))))

(declare-fun res!8014 () Bool)

(assert (=> b!8533 (=> res!8014 e!4848)))

(assert (=> b!8533 (= res!8014 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8533 e!4853))

(declare-fun c!626 () Bool)

(assert (=> b!8533 (= c!626 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!167 0))(
  ( (Unit!168) )
))
(declare-fun lt!1779 () Unit!167)

(declare-fun lemmaKeyInListMapIsInArray!63 (array!771 array!769 (_ BitVec 32) (_ BitVec 32) V!735 V!735 (_ BitVec 64) Int) Unit!167)

(assert (=> b!8533 (= lt!1779 (lemmaKeyInListMapIsInArray!63 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!8534 () Bool)

(declare-fun res!8017 () Bool)

(assert (=> b!8534 (=> (not res!8017) (not e!4847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!771 (_ BitVec 32)) Bool)

(assert (=> b!8534 (= res!8017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!8016 () Bool)

(assert (=> start!990 (=> (not res!8016) (not e!4847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!990 (= res!8016 (validMask!0 mask!2250))))

(assert (=> start!990 e!4847))

(assert (=> start!990 tp!1258))

(assert (=> start!990 true))

(declare-fun e!4850 () Bool)

(declare-fun array_inv!275 (array!769) Bool)

(assert (=> start!990 (and (array_inv!275 _values!1492) e!4850)))

(declare-fun tp_is_empty!419 () Bool)

(assert (=> start!990 tp_is_empty!419))

(declare-fun array_inv!276 (array!771) Bool)

(assert (=> start!990 (array_inv!276 _keys!1806)))

(declare-fun mapIsEmpty!605 () Bool)

(declare-fun mapRes!605 () Bool)

(assert (=> mapIsEmpty!605 mapRes!605))

(declare-fun b!8535 () Bool)

(declare-fun e!4849 () Bool)

(assert (=> b!8535 (= e!4849 tp_is_empty!419)))

(declare-fun b!8536 () Bool)

(declare-fun res!8015 () Bool)

(assert (=> b!8536 (=> (not res!8015) (not e!4847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8536 (= res!8015 (validKeyInArray!0 k!1278))))

(declare-fun b!8537 () Bool)

(declare-fun e!4852 () Bool)

(assert (=> b!8537 (= e!4852 tp_is_empty!419)))

(declare-fun b!8538 () Bool)

(assert (=> b!8538 (= e!4850 (and e!4852 mapRes!605))))

(declare-fun condMapEmpty!605 () Bool)

(declare-fun mapDefault!605 () ValueCell!193)

