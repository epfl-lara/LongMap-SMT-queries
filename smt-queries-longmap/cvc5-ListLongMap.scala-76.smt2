; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1032 () Bool)

(assert start!1032)

(declare-fun b_free!361 () Bool)

(declare-fun b_next!361 () Bool)

(assert (=> start!1032 (= b_free!361 (not b_next!361))))

(declare-fun tp!1322 () Bool)

(declare-fun b_and!513 () Bool)

(assert (=> start!1032 (= tp!1322 b_and!513)))

(declare-fun b!9015 () Bool)

(declare-fun res!8276 () Bool)

(declare-fun e!5146 () Bool)

(assert (=> b!9015 (=> (not res!8276) (not e!5146))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9015 (= res!8276 (validKeyInArray!0 k!1278))))

(declare-fun b!9016 () Bool)

(declare-fun e!5143 () Bool)

(assert (=> b!9016 (= e!5146 (not e!5143))))

(declare-fun res!8275 () Bool)

(assert (=> b!9016 (=> res!8275 e!5143)))

(declare-datatypes ((array!811 0))(
  ( (array!812 (arr!391 (Array (_ BitVec 32) (_ BitVec 64))) (size!453 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!811)

(declare-fun arrayContainsKey!0 (array!811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9016 (= res!8275 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!5147 () Bool)

(assert (=> b!9016 e!5147))

(declare-fun c!689 () Bool)

(assert (=> b!9016 (= c!689 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((Unit!181 0))(
  ( (Unit!182) )
))
(declare-fun lt!1953 () Unit!181)

(declare-datatypes ((V!763 0))(
  ( (V!764 (val!225 Int)) )
))
(declare-datatypes ((ValueCell!203 0))(
  ( (ValueCellFull!203 (v!1319 V!763)) (EmptyCell!203) )
))
(declare-datatypes ((array!813 0))(
  ( (array!814 (arr!392 (Array (_ BitVec 32) ValueCell!203)) (size!454 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!813)

(declare-fun minValue!1434 () V!763)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!763)

(declare-fun lemmaKeyInListMapIsInArray!67 (array!811 array!813 (_ BitVec 32) (_ BitVec 32) V!763 V!763 (_ BitVec 64) Int) Unit!181)

(assert (=> b!9016 (= lt!1953 (lemmaKeyInListMapIsInArray!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!9017 () Bool)

(declare-fun res!8274 () Bool)

(assert (=> b!9017 (=> (not res!8274) (not e!5146))))

(declare-datatypes ((tuple2!262 0))(
  ( (tuple2!263 (_1!131 (_ BitVec 64)) (_2!131 V!763)) )
))
(declare-datatypes ((List!272 0))(
  ( (Nil!269) (Cons!268 (h!834 tuple2!262) (t!2413 List!272)) )
))
(declare-datatypes ((ListLongMap!267 0))(
  ( (ListLongMap!268 (toList!149 List!272)) )
))
(declare-fun contains!126 (ListLongMap!267 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!108 (array!811 array!813 (_ BitVec 32) (_ BitVec 32) V!763 V!763 (_ BitVec 32) Int) ListLongMap!267)

(assert (=> b!9017 (= res!8274 (contains!126 (getCurrentListMap!108 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!9018 () Bool)

(declare-fun e!5141 () Bool)

(declare-fun tp_is_empty!439 () Bool)

(assert (=> b!9018 (= e!5141 tp_is_empty!439)))

(declare-fun b!9019 () Bool)

(declare-fun res!8277 () Bool)

(assert (=> b!9019 (=> (not res!8277) (not e!5146))))

(declare-datatypes ((List!273 0))(
  ( (Nil!270) (Cons!269 (h!835 (_ BitVec 64)) (t!2414 List!273)) )
))
(declare-fun arrayNoDuplicates!0 (array!811 (_ BitVec 32) List!273) Bool)

(assert (=> b!9019 (= res!8277 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!270))))

(declare-fun b!9020 () Bool)

(declare-fun res!8278 () Bool)

(assert (=> b!9020 (=> (not res!8278) (not e!5146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!811 (_ BitVec 32)) Bool)

(assert (=> b!9020 (= res!8278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!9021 () Bool)

(declare-fun res!8273 () Bool)

(assert (=> b!9021 (=> (not res!8273) (not e!5146))))

(assert (=> b!9021 (= res!8273 (and (= (size!454 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!453 _keys!1806) (size!454 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9022 () Bool)

(declare-fun e!5142 () Bool)

(declare-fun mapRes!638 () Bool)

(assert (=> b!9022 (= e!5142 (and e!5141 mapRes!638))))

(declare-fun condMapEmpty!638 () Bool)

(declare-fun mapDefault!638 () ValueCell!203)

