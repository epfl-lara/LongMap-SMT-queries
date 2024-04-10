; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!780 () Bool)

(assert start!780)

(declare-fun b_free!173 () Bool)

(declare-fun b_next!173 () Bool)

(assert (=> start!780 (= b_free!173 (not b_next!173))))

(declare-fun tp!748 () Bool)

(declare-fun b_and!319 () Bool)

(assert (=> start!780 (= tp!748 b_and!319)))

(declare-fun b!5581 () Bool)

(declare-fun e!3032 () Bool)

(declare-fun tp_is_empty!251 () Bool)

(assert (=> b!5581 (= e!3032 tp_is_empty!251)))

(declare-fun b!5582 () Bool)

(declare-fun res!6310 () Bool)

(declare-fun e!3031 () Bool)

(assert (=> b!5582 (=> (not res!6310) (not e!3031))))

(declare-datatypes ((array!439 0))(
  ( (array!440 (arr!208 (Array (_ BitVec 32) (_ BitVec 64))) (size!270 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!439)

(declare-datatypes ((List!139 0))(
  ( (Nil!136) (Cons!135 (h!701 (_ BitVec 64)) (t!2274 List!139)) )
))
(declare-fun arrayNoDuplicates!0 (array!439 (_ BitVec 32) List!139) Bool)

(assert (=> b!5582 (= res!6310 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!136))))

(declare-fun b!5583 () Bool)

(declare-fun e!3030 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!5583 (= e!3030 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5584 () Bool)

(declare-fun e!3029 () Bool)

(assert (=> b!5584 (= e!3029 tp_is_empty!251)))

(declare-fun b!5585 () Bool)

(declare-fun res!6308 () Bool)

(assert (=> b!5585 (=> (not res!6308) (not e!3031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5585 (= res!6308 (validKeyInArray!0 k!1278))))

(declare-fun b!5586 () Bool)

(declare-fun res!6309 () Bool)

(assert (=> b!5586 (=> (not res!6309) (not e!3031))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!511 0))(
  ( (V!512 (val!131 Int)) )
))
(declare-datatypes ((ValueCell!109 0))(
  ( (ValueCellFull!109 (v!1222 V!511)) (EmptyCell!109) )
))
(declare-datatypes ((array!441 0))(
  ( (array!442 (arr!209 (Array (_ BitVec 32) ValueCell!109)) (size!271 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!441)

(assert (=> b!5586 (= res!6309 (and (= (size!271 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!270 _keys!1806) (size!271 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5587 () Bool)

(declare-fun res!6313 () Bool)

(assert (=> b!5587 (=> (not res!6313) (not e!3031))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!511)

(declare-fun zeroValue!1434 () V!511)

(declare-datatypes ((tuple2!126 0))(
  ( (tuple2!127 (_1!63 (_ BitVec 64)) (_2!63 V!511)) )
))
(declare-datatypes ((List!140 0))(
  ( (Nil!137) (Cons!136 (h!702 tuple2!126) (t!2275 List!140)) )
))
(declare-datatypes ((ListLongMap!131 0))(
  ( (ListLongMap!132 (toList!81 List!140)) )
))
(declare-fun contains!55 (ListLongMap!131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!40 (array!439 array!441 (_ BitVec 32) (_ BitVec 32) V!511 V!511 (_ BitVec 32) Int) ListLongMap!131)

(assert (=> b!5587 (= res!6313 (contains!55 (getCurrentListMap!40 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun res!6311 () Bool)

(assert (=> start!780 (=> (not res!6311) (not e!3031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!780 (= res!6311 (validMask!0 mask!2250))))

(assert (=> start!780 e!3031))

(assert (=> start!780 tp!748))

(assert (=> start!780 true))

(declare-fun e!3028 () Bool)

(declare-fun array_inv!155 (array!441) Bool)

(assert (=> start!780 (and (array_inv!155 _values!1492) e!3028)))

(assert (=> start!780 tp_is_empty!251))

(declare-fun array_inv!156 (array!439) Bool)

(assert (=> start!780 (array_inv!156 _keys!1806)))

(declare-fun mapIsEmpty!347 () Bool)

(declare-fun mapRes!347 () Bool)

(assert (=> mapIsEmpty!347 mapRes!347))

(declare-fun b!5588 () Bool)

(assert (=> b!5588 (= e!3028 (and e!3029 mapRes!347))))

(declare-fun condMapEmpty!347 () Bool)

(declare-fun mapDefault!347 () ValueCell!109)

