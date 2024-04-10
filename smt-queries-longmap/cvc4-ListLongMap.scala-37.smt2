; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!658 () Bool)

(assert start!658)

(declare-fun b_free!131 () Bool)

(declare-fun b_next!131 () Bool)

(assert (=> start!658 (= b_free!131 (not b_next!131))))

(declare-fun tp!610 () Bool)

(declare-fun b_and!269 () Bool)

(assert (=> start!658 (= tp!610 b_and!269)))

(declare-fun b!4377 () Bool)

(declare-fun res!5702 () Bool)

(declare-fun e!2300 () Bool)

(assert (=> b!4377 (=> (not res!5702) (not e!2300))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!455 0))(
  ( (V!456 (val!110 Int)) )
))
(declare-datatypes ((ValueCell!88 0))(
  ( (ValueCellFull!88 (v!1197 V!455)) (EmptyCell!88) )
))
(declare-datatypes ((array!349 0))(
  ( (array!350 (arr!167 (Array (_ BitVec 32) ValueCell!88)) (size!229 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!349)

(declare-fun minValue!1434 () V!455)

(declare-datatypes ((array!351 0))(
  ( (array!352 (arr!168 (Array (_ BitVec 32) (_ BitVec 64))) (size!230 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!351)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!455)

(declare-fun k!1278 () (_ BitVec 64))

(declare-datatypes ((tuple2!96 0))(
  ( (tuple2!97 (_1!48 (_ BitVec 64)) (_2!48 V!455)) )
))
(declare-datatypes ((List!105 0))(
  ( (Nil!102) (Cons!101 (h!667 tuple2!96) (t!2232 List!105)) )
))
(declare-datatypes ((ListLongMap!101 0))(
  ( (ListLongMap!102 (toList!66 List!105)) )
))
(declare-fun contains!36 (ListLongMap!101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!25 (array!351 array!349 (_ BitVec 32) (_ BitVec 32) V!455 V!455 (_ BitVec 32) Int) ListLongMap!101)

(assert (=> b!4377 (= res!5702 (contains!36 (getCurrentListMap!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!4378 () Bool)

(declare-fun res!5703 () Bool)

(assert (=> b!4378 (=> (not res!5703) (not e!2300))))

(assert (=> b!4378 (= res!5703 (and (= (size!229 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!230 _keys!1806) (size!229 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!272 () Bool)

(declare-fun mapRes!272 () Bool)

(assert (=> mapIsEmpty!272 mapRes!272))

(declare-fun b!4379 () Bool)

(declare-fun res!5704 () Bool)

(assert (=> b!4379 (=> (not res!5704) (not e!2300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4379 (= res!5704 (validKeyInArray!0 k!1278))))

(declare-fun b!4380 () Bool)

(assert (=> b!4380 (= e!2300 (not (bvslt #b00000000000000000000000000000000 (size!230 _keys!1806))))))

(declare-fun e!2301 () Bool)

(assert (=> b!4380 e!2301))

(declare-fun c!209 () Bool)

(assert (=> b!4380 (= c!209 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!39 0))(
  ( (Unit!40) )
))
(declare-fun lt!597 () Unit!39)

(declare-fun lemmaKeyInListMapIsInArray!9 (array!351 array!349 (_ BitVec 32) (_ BitVec 32) V!455 V!455 (_ BitVec 64) Int) Unit!39)

(assert (=> b!4380 (= lt!597 (lemmaKeyInListMapIsInArray!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!4381 () Bool)

(declare-fun e!2298 () Bool)

(declare-fun tp_is_empty!209 () Bool)

(assert (=> b!4381 (= e!2298 tp_is_empty!209)))

(declare-fun res!5700 () Bool)

(assert (=> start!658 (=> (not res!5700) (not e!2300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!658 (= res!5700 (validMask!0 mask!2250))))

(assert (=> start!658 e!2300))

(assert (=> start!658 tp!610))

(assert (=> start!658 true))

(declare-fun e!2299 () Bool)

(declare-fun array_inv!121 (array!349) Bool)

(assert (=> start!658 (and (array_inv!121 _values!1492) e!2299)))

(assert (=> start!658 tp_is_empty!209))

(declare-fun array_inv!122 (array!351) Bool)

(assert (=> start!658 (array_inv!122 _keys!1806)))

(declare-fun mapNonEmpty!272 () Bool)

(declare-fun tp!611 () Bool)

(assert (=> mapNonEmpty!272 (= mapRes!272 (and tp!611 e!2298))))

(declare-fun mapRest!272 () (Array (_ BitVec 32) ValueCell!88))

(declare-fun mapKey!272 () (_ BitVec 32))

(declare-fun mapValue!272 () ValueCell!88)

(assert (=> mapNonEmpty!272 (= (arr!167 _values!1492) (store mapRest!272 mapKey!272 mapValue!272))))

(declare-fun b!4382 () Bool)

(declare-fun res!5701 () Bool)

(assert (=> b!4382 (=> (not res!5701) (not e!2300))))

(declare-datatypes ((List!106 0))(
  ( (Nil!103) (Cons!102 (h!668 (_ BitVec 64)) (t!2233 List!106)) )
))
(declare-fun arrayNoDuplicates!0 (array!351 (_ BitVec 32) List!106) Bool)

(assert (=> b!4382 (= res!5701 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!103))))

(declare-fun b!4383 () Bool)

(declare-fun e!2303 () Bool)

(assert (=> b!4383 (= e!2303 tp_is_empty!209)))

(declare-fun b!4384 () Bool)

(assert (=> b!4384 (= e!2299 (and e!2303 mapRes!272))))

(declare-fun condMapEmpty!272 () Bool)

(declare-fun mapDefault!272 () ValueCell!88)

