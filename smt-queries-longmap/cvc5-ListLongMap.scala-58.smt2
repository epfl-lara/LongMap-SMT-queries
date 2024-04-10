; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!860 () Bool)

(assert start!860)

(declare-fun b_free!253 () Bool)

(declare-fun b_next!253 () Bool)

(assert (=> start!860 (= b_free!253 (not b_next!253))))

(declare-fun tp!988 () Bool)

(declare-fun b_and!399 () Bool)

(assert (=> start!860 (= tp!988 b_and!399)))

(declare-fun res!7245 () Bool)

(declare-fun e!3936 () Bool)

(assert (=> start!860 (=> (not res!7245) (not e!3936))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!860 (= res!7245 (validMask!0 mask!2250))))

(assert (=> start!860 e!3936))

(assert (=> start!860 tp!988))

(assert (=> start!860 true))

(declare-datatypes ((V!619 0))(
  ( (V!620 (val!171 Int)) )
))
(declare-datatypes ((ValueCell!149 0))(
  ( (ValueCellFull!149 (v!1262 V!619)) (EmptyCell!149) )
))
(declare-datatypes ((array!593 0))(
  ( (array!594 (arr!285 (Array (_ BitVec 32) ValueCell!149)) (size!347 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!593)

(declare-fun e!3937 () Bool)

(declare-fun array_inv!209 (array!593) Bool)

(assert (=> start!860 (and (array_inv!209 _values!1492) e!3937)))

(declare-fun tp_is_empty!331 () Bool)

(assert (=> start!860 tp_is_empty!331))

(declare-datatypes ((array!595 0))(
  ( (array!596 (arr!286 (Array (_ BitVec 32) (_ BitVec 64))) (size!348 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!595)

(declare-fun array_inv!210 (array!595) Bool)

(assert (=> start!860 (array_inv!210 _keys!1806)))

(declare-fun b!7117 () Bool)

(declare-fun res!7248 () Bool)

(assert (=> b!7117 (=> (not res!7248) (not e!3936))))

(declare-datatypes ((List!192 0))(
  ( (Nil!189) (Cons!188 (h!754 (_ BitVec 64)) (t!2327 List!192)) )
))
(declare-fun arrayNoDuplicates!0 (array!595 (_ BitVec 32) List!192) Bool)

(assert (=> b!7117 (= res!7248 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!189))))

(declare-fun b!7118 () Bool)

(declare-fun e!3940 () Bool)

(assert (=> b!7118 (= e!3940 tp_is_empty!331)))

(declare-fun b!7119 () Bool)

(declare-fun res!7244 () Bool)

(assert (=> b!7119 (=> (not res!7244) (not e!3936))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7119 (= res!7244 (and (= (size!347 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!348 _keys!1806) (size!347 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7120 () Bool)

(declare-fun res!7246 () Bool)

(assert (=> b!7120 (=> (not res!7246) (not e!3936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!595 (_ BitVec 32)) Bool)

(assert (=> b!7120 (= res!7246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7121 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!7121 (= e!3936 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3941 () Bool)

(assert (=> b!7121 e!3941))

(declare-fun c!512 () Bool)

(assert (=> b!7121 (= c!512 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((Unit!135 0))(
  ( (Unit!136) )
))
(declare-fun lt!1428 () Unit!135)

(declare-fun minValue!1434 () V!619)

(declare-fun zeroValue!1434 () V!619)

(declare-fun lemmaKeyInListMapIsInArray!49 (array!595 array!593 (_ BitVec 32) (_ BitVec 32) V!619 V!619 (_ BitVec 64) Int) Unit!135)

(assert (=> b!7121 (= lt!1428 (lemmaKeyInListMapIsInArray!49 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!7122 () Bool)

(declare-fun res!7249 () Bool)

(assert (=> b!7122 (=> (not res!7249) (not e!3936))))

(declare-datatypes ((tuple2!182 0))(
  ( (tuple2!183 (_1!91 (_ BitVec 64)) (_2!91 V!619)) )
))
(declare-datatypes ((List!193 0))(
  ( (Nil!190) (Cons!189 (h!755 tuple2!182) (t!2328 List!193)) )
))
(declare-datatypes ((ListLongMap!187 0))(
  ( (ListLongMap!188 (toList!109 List!193)) )
))
(declare-fun contains!83 (ListLongMap!187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!68 (array!595 array!593 (_ BitVec 32) (_ BitVec 32) V!619 V!619 (_ BitVec 32) Int) ListLongMap!187)

(assert (=> b!7122 (= res!7249 (contains!83 (getCurrentListMap!68 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!7123 () Bool)

(declare-fun mapRes!467 () Bool)

(assert (=> b!7123 (= e!3937 (and e!3940 mapRes!467))))

(declare-fun condMapEmpty!467 () Bool)

(declare-fun mapDefault!467 () ValueCell!149)

