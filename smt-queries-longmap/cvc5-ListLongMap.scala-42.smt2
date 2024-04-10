; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!724 () Bool)

(assert start!724)

(declare-fun b_free!157 () Bool)

(declare-fun b_next!157 () Bool)

(assert (=> start!724 (= b_free!157 (not b_next!157))))

(declare-fun tp!695 () Bool)

(declare-fun b_and!299 () Bool)

(assert (=> start!724 (= tp!695 b_and!299)))

(declare-fun mapIsEmpty!317 () Bool)

(declare-fun mapRes!317 () Bool)

(assert (=> mapIsEmpty!317 mapRes!317))

(declare-fun b!5059 () Bool)

(declare-fun res!6047 () Bool)

(declare-fun e!2706 () Bool)

(assert (=> b!5059 (=> (not res!6047) (not e!2706))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!491 0))(
  ( (V!492 (val!123 Int)) )
))
(declare-datatypes ((ValueCell!101 0))(
  ( (ValueCellFull!101 (v!1212 V!491)) (EmptyCell!101) )
))
(declare-datatypes ((array!403 0))(
  ( (array!404 (arr!192 (Array (_ BitVec 32) ValueCell!101)) (size!254 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!403)

(declare-fun minValue!1434 () V!491)

(declare-datatypes ((array!405 0))(
  ( (array!406 (arr!193 (Array (_ BitVec 32) (_ BitVec 64))) (size!255 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!405)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!491)

(declare-datatypes ((tuple2!114 0))(
  ( (tuple2!115 (_1!57 (_ BitVec 64)) (_2!57 V!491)) )
))
(declare-datatypes ((List!126 0))(
  ( (Nil!123) (Cons!122 (h!688 tuple2!114) (t!2257 List!126)) )
))
(declare-datatypes ((ListLongMap!119 0))(
  ( (ListLongMap!120 (toList!75 List!126)) )
))
(declare-fun contains!47 (ListLongMap!119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!34 (array!405 array!403 (_ BitVec 32) (_ BitVec 32) V!491 V!491 (_ BitVec 32) Int) ListLongMap!119)

(assert (=> b!5059 (= res!6047 (contains!47 (getCurrentListMap!34 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!5060 () Bool)

(declare-fun res!6049 () Bool)

(assert (=> b!5060 (=> (not res!6049) (not e!2706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!405 (_ BitVec 32)) Bool)

(assert (=> b!5060 (= res!6049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!317 () Bool)

(declare-fun tp!694 () Bool)

(declare-fun e!2705 () Bool)

(assert (=> mapNonEmpty!317 (= mapRes!317 (and tp!694 e!2705))))

(declare-fun mapValue!317 () ValueCell!101)

(declare-fun mapKey!317 () (_ BitVec 32))

(declare-fun mapRest!317 () (Array (_ BitVec 32) ValueCell!101))

(assert (=> mapNonEmpty!317 (= (arr!192 _values!1492) (store mapRest!317 mapKey!317 mapValue!317))))

(declare-fun b!5061 () Bool)

(declare-fun res!6051 () Bool)

(assert (=> b!5061 (=> (not res!6051) (not e!2706))))

(assert (=> b!5061 (= res!6051 (and (= (size!254 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!255 _keys!1806) (size!254 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!6050 () Bool)

(assert (=> start!724 (=> (not res!6050) (not e!2706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!724 (= res!6050 (validMask!0 mask!2250))))

(assert (=> start!724 e!2706))

(assert (=> start!724 tp!695))

(assert (=> start!724 true))

(declare-fun e!2708 () Bool)

(declare-fun array_inv!141 (array!403) Bool)

(assert (=> start!724 (and (array_inv!141 _values!1492) e!2708)))

(declare-fun tp_is_empty!235 () Bool)

(assert (=> start!724 tp_is_empty!235))

(declare-fun array_inv!142 (array!405) Bool)

(assert (=> start!724 (array_inv!142 _keys!1806)))

(declare-fun b!5062 () Bool)

(declare-fun e!2709 () Bool)

(assert (=> b!5062 (= e!2706 (not e!2709))))

(declare-fun res!6048 () Bool)

(assert (=> b!5062 (=> res!6048 e!2709)))

(declare-fun arrayContainsKey!0 (array!405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5062 (= res!6048 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!2710 () Bool)

(assert (=> b!5062 e!2710))

(declare-fun c!308 () Bool)

(assert (=> b!5062 (= c!308 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!59 0))(
  ( (Unit!60) )
))
(declare-fun lt!816 () Unit!59)

(declare-fun lemmaKeyInListMapIsInArray!17 (array!405 array!403 (_ BitVec 32) (_ BitVec 32) V!491 V!491 (_ BitVec 64) Int) Unit!59)

(assert (=> b!5062 (= lt!816 (lemmaKeyInListMapIsInArray!17 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!5063 () Bool)

(declare-fun res!6046 () Bool)

(assert (=> b!5063 (=> (not res!6046) (not e!2706))))

(declare-datatypes ((List!127 0))(
  ( (Nil!124) (Cons!123 (h!689 (_ BitVec 64)) (t!2258 List!127)) )
))
(declare-fun arrayNoDuplicates!0 (array!405 (_ BitVec 32) List!127) Bool)

(assert (=> b!5063 (= res!6046 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!124))))

(declare-fun b!5064 () Bool)

(declare-fun e!2711 () Bool)

(assert (=> b!5064 (= e!2711 tp_is_empty!235)))

(declare-fun b!5065 () Bool)

(assert (=> b!5065 (= e!2710 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!5066 () Bool)

(assert (=> b!5066 (= e!2705 tp_is_empty!235)))

(declare-fun b!5067 () Bool)

(assert (=> b!5067 (= e!2710 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5068 () Bool)

(assert (=> b!5068 (= e!2708 (and e!2711 mapRes!317))))

(declare-fun condMapEmpty!317 () Bool)

(declare-fun mapDefault!317 () ValueCell!101)

