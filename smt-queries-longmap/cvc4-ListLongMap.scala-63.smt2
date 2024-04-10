; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!914 () Bool)

(assert start!914)

(declare-fun b_free!287 () Bool)

(declare-fun b_next!287 () Bool)

(assert (=> start!914 (= b_free!287 (not b_next!287))))

(declare-fun tp!1094 () Bool)

(declare-fun b_and!435 () Bool)

(assert (=> start!914 (= tp!1094 b_and!435)))

(declare-fun b!7659 () Bool)

(declare-fun res!7532 () Bool)

(declare-fun e!4290 () Bool)

(assert (=> b!7659 (=> (not res!7532) (not e!4290))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!663 0))(
  ( (V!664 (val!188 Int)) )
))
(declare-datatypes ((ValueCell!166 0))(
  ( (ValueCellFull!166 (v!1280 V!663)) (EmptyCell!166) )
))
(declare-datatypes ((array!663 0))(
  ( (array!664 (arr!319 (Array (_ BitVec 32) ValueCell!166)) (size!381 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!663)

(declare-datatypes ((array!665 0))(
  ( (array!666 (arr!320 (Array (_ BitVec 32) (_ BitVec 64))) (size!382 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!665)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7659 (= res!7532 (and (= (size!381 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!382 _keys!1806) (size!381 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7660 () Bool)

(declare-fun e!4291 () Bool)

(declare-fun tp_is_empty!365 () Bool)

(assert (=> b!7660 (= e!4291 tp_is_empty!365)))

(declare-fun mapNonEmpty!521 () Bool)

(declare-fun mapRes!521 () Bool)

(declare-fun tp!1093 () Bool)

(assert (=> mapNonEmpty!521 (= mapRes!521 (and tp!1093 e!4291))))

(declare-fun mapRest!521 () (Array (_ BitVec 32) ValueCell!166))

(declare-fun mapKey!521 () (_ BitVec 32))

(declare-fun mapValue!521 () ValueCell!166)

(assert (=> mapNonEmpty!521 (= (arr!319 _values!1492) (store mapRest!521 mapKey!521 mapValue!521))))

(declare-fun mapIsEmpty!521 () Bool)

(assert (=> mapIsEmpty!521 mapRes!521))

(declare-fun b!7661 () Bool)

(declare-fun e!4289 () Bool)

(assert (=> b!7661 (= e!4289 tp_is_empty!365)))

(declare-fun res!7531 () Bool)

(assert (=> start!914 (=> (not res!7531) (not e!4290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!914 (= res!7531 (validMask!0 mask!2250))))

(assert (=> start!914 e!4290))

(assert (=> start!914 tp!1094))

(assert (=> start!914 true))

(declare-fun e!4288 () Bool)

(declare-fun array_inv!237 (array!663) Bool)

(assert (=> start!914 (and (array_inv!237 _values!1492) e!4288)))

(assert (=> start!914 tp_is_empty!365))

(declare-fun array_inv!238 (array!665) Bool)

(assert (=> start!914 (array_inv!238 _keys!1806)))

(declare-fun b!7662 () Bool)

(assert (=> b!7662 (= e!4290 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!663)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!663)

(declare-fun lt!1569 () Bool)

(declare-datatypes ((tuple2!206 0))(
  ( (tuple2!207 (_1!103 (_ BitVec 64)) (_2!103 V!663)) )
))
(declare-datatypes ((List!215 0))(
  ( (Nil!212) (Cons!211 (h!777 tuple2!206) (t!2352 List!215)) )
))
(declare-datatypes ((ListLongMap!211 0))(
  ( (ListLongMap!212 (toList!121 List!215)) )
))
(declare-fun contains!96 (ListLongMap!211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!80 (array!665 array!663 (_ BitVec 32) (_ BitVec 32) V!663 V!663 (_ BitVec 32) Int) ListLongMap!211)

(assert (=> b!7662 (= lt!1569 (contains!96 (getCurrentListMap!80 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!7663 () Bool)

(declare-fun res!7533 () Bool)

(assert (=> b!7663 (=> (not res!7533) (not e!4290))))

(declare-datatypes ((List!216 0))(
  ( (Nil!213) (Cons!212 (h!778 (_ BitVec 64)) (t!2353 List!216)) )
))
(declare-fun arrayNoDuplicates!0 (array!665 (_ BitVec 32) List!216) Bool)

(assert (=> b!7663 (= res!7533 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!213))))

(declare-fun b!7664 () Bool)

(assert (=> b!7664 (= e!4288 (and e!4289 mapRes!521))))

(declare-fun condMapEmpty!521 () Bool)

(declare-fun mapDefault!521 () ValueCell!166)

