; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77926 () Bool)

(assert start!77926)

(declare-fun b_free!16469 () Bool)

(declare-fun b_next!16469 () Bool)

(assert (=> start!77926 (= b_free!16469 (not b_next!16469))))

(declare-fun tp!57675 () Bool)

(declare-fun b_and!27039 () Bool)

(assert (=> start!77926 (= tp!57675 b_and!27039)))

(declare-fun b!909812 () Bool)

(declare-fun res!614015 () Bool)

(declare-fun e!510031 () Bool)

(assert (=> b!909812 (=> (not res!614015) (not e!510031))))

(declare-datatypes ((array!53798 0))(
  ( (array!53799 (arr!25856 (Array (_ BitVec 32) (_ BitVec 64))) (size!26315 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53798)

(declare-datatypes ((List!18165 0))(
  ( (Nil!18162) (Cons!18161 (h!19307 (_ BitVec 64)) (t!25748 List!18165)) )
))
(declare-fun arrayNoDuplicates!0 (array!53798 (_ BitVec 32) List!18165) Bool)

(assert (=> b!909812 (= res!614015 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18162))))

(declare-fun b!909813 () Bool)

(declare-fun res!614014 () Bool)

(assert (=> b!909813 (=> (not res!614014) (not e!510031))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53798 (_ BitVec 32)) Bool)

(assert (=> b!909813 (= res!614014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909814 () Bool)

(assert (=> b!909814 (= e!510031 false)))

(declare-datatypes ((V!30147 0))(
  ( (V!30148 (val!9494 Int)) )
))
(declare-datatypes ((ValueCell!8962 0))(
  ( (ValueCellFull!8962 (v!12002 V!30147)) (EmptyCell!8962) )
))
(declare-datatypes ((array!53800 0))(
  ( (array!53801 (arr!25857 (Array (_ BitVec 32) ValueCell!8962)) (size!26316 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53800)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30147)

(declare-fun lt!410108 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30147)

(declare-fun k!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12372 0))(
  ( (tuple2!12373 (_1!6197 (_ BitVec 64)) (_2!6197 V!30147)) )
))
(declare-datatypes ((List!18166 0))(
  ( (Nil!18163) (Cons!18162 (h!19308 tuple2!12372) (t!25749 List!18166)) )
))
(declare-datatypes ((ListLongMap!11069 0))(
  ( (ListLongMap!11070 (toList!5550 List!18166)) )
))
(declare-fun contains!4593 (ListLongMap!11069 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2812 (array!53798 array!53800 (_ BitVec 32) (_ BitVec 32) V!30147 V!30147 (_ BitVec 32) Int) ListLongMap!11069)

(assert (=> b!909814 (= lt!410108 (contains!4593 (getCurrentListMap!2812 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909815 () Bool)

(declare-fun e!510032 () Bool)

(declare-fun e!510033 () Bool)

(declare-fun mapRes!30049 () Bool)

(assert (=> b!909815 (= e!510032 (and e!510033 mapRes!30049))))

(declare-fun condMapEmpty!30049 () Bool)

(declare-fun mapDefault!30049 () ValueCell!8962)

