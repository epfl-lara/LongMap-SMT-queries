; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!606 () Bool)

(assert start!606)

(declare-fun b_free!79 () Bool)

(declare-fun b_next!79 () Bool)

(assert (=> start!606 (= b_free!79 (not b_next!79))))

(declare-fun tp!454 () Bool)

(declare-fun b_and!217 () Bool)

(assert (=> start!606 (= tp!454 b_and!217)))

(declare-fun res!5354 () Bool)

(declare-fun e!1894 () Bool)

(assert (=> start!606 (=> (not res!5354) (not e!1894))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!606 (= res!5354 (validMask!0 mask!2250))))

(assert (=> start!606 e!1894))

(assert (=> start!606 tp!454))

(assert (=> start!606 true))

(declare-datatypes ((V!387 0))(
  ( (V!388 (val!84 Int)) )
))
(declare-datatypes ((ValueCell!62 0))(
  ( (ValueCellFull!62 (v!1171 V!387)) (EmptyCell!62) )
))
(declare-datatypes ((array!249 0))(
  ( (array!250 (arr!117 (Array (_ BitVec 32) ValueCell!62)) (size!179 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!249)

(declare-fun e!1891 () Bool)

(declare-fun array_inv!83 (array!249) Bool)

(assert (=> start!606 (and (array_inv!83 _values!1492) e!1891)))

(declare-fun tp_is_empty!157 () Bool)

(assert (=> start!606 tp_is_empty!157))

(declare-datatypes ((array!251 0))(
  ( (array!252 (arr!118 (Array (_ BitVec 32) (_ BitVec 64))) (size!180 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!251)

(declare-fun array_inv!84 (array!251) Bool)

(assert (=> start!606 (array_inv!84 _keys!1806)))

(declare-fun b!3763 () Bool)

(declare-fun e!1895 () Bool)

(assert (=> b!3763 (= e!1895 tp_is_empty!157)))

(declare-fun b!3764 () Bool)

(declare-fun res!5353 () Bool)

(assert (=> b!3764 (=> (not res!5353) (not e!1894))))

(declare-datatypes ((List!69 0))(
  ( (Nil!66) (Cons!65 (h!631 (_ BitVec 64)) (t!2196 List!69)) )
))
(declare-fun arrayNoDuplicates!0 (array!251 (_ BitVec 32) List!69) Bool)

(assert (=> b!3764 (= res!5353 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!66))))

(declare-fun b!3765 () Bool)

(declare-fun res!5356 () Bool)

(assert (=> b!3765 (=> (not res!5356) (not e!1894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!251 (_ BitVec 32)) Bool)

(assert (=> b!3765 (= res!5356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!194 () Bool)

(declare-fun mapRes!194 () Bool)

(assert (=> mapIsEmpty!194 mapRes!194))

(declare-fun b!3766 () Bool)

(assert (=> b!3766 (= e!1894 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!387)

(declare-fun lt!519 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!387)

(declare-datatypes ((tuple2!58 0))(
  ( (tuple2!59 (_1!29 (_ BitVec 64)) (_2!29 V!387)) )
))
(declare-datatypes ((List!70 0))(
  ( (Nil!67) (Cons!66 (h!632 tuple2!58) (t!2197 List!70)) )
))
(declare-datatypes ((ListLongMap!63 0))(
  ( (ListLongMap!64 (toList!47 List!70)) )
))
(declare-fun contains!17 (ListLongMap!63 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!6 (array!251 array!249 (_ BitVec 32) (_ BitVec 32) V!387 V!387 (_ BitVec 32) Int) ListLongMap!63)

(assert (=> b!3766 (= lt!519 (contains!17 (getCurrentListMap!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!3767 () Bool)

(declare-fun e!1893 () Bool)

(assert (=> b!3767 (= e!1891 (and e!1893 mapRes!194))))

(declare-fun condMapEmpty!194 () Bool)

(declare-fun mapDefault!194 () ValueCell!62)

