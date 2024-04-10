; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!710 () Bool)

(assert start!710)

(declare-fun b_free!143 () Bool)

(declare-fun b_next!143 () Bool)

(assert (=> start!710 (= b_free!143 (not b_next!143))))

(declare-fun tp!653 () Bool)

(declare-fun b_and!285 () Bool)

(assert (=> start!710 (= tp!653 b_and!285)))

(declare-fun mapNonEmpty!296 () Bool)

(declare-fun mapRes!296 () Bool)

(declare-fun tp!652 () Bool)

(declare-fun e!2568 () Bool)

(assert (=> mapNonEmpty!296 (= mapRes!296 (and tp!652 e!2568))))

(declare-datatypes ((V!471 0))(
  ( (V!472 (val!116 Int)) )
))
(declare-datatypes ((ValueCell!94 0))(
  ( (ValueCellFull!94 (v!1205 V!471)) (EmptyCell!94) )
))
(declare-fun mapValue!296 () ValueCell!94)

(declare-datatypes ((array!375 0))(
  ( (array!376 (arr!178 (Array (_ BitVec 32) ValueCell!94)) (size!240 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!375)

(declare-fun mapKey!296 () (_ BitVec 32))

(declare-fun mapRest!296 () (Array (_ BitVec 32) ValueCell!94))

(assert (=> mapNonEmpty!296 (= (arr!178 _values!1492) (store mapRest!296 mapKey!296 mapValue!296))))

(declare-fun b!4817 () Bool)

(declare-fun res!5914 () Bool)

(declare-fun e!2573 () Bool)

(assert (=> b!4817 (=> (not res!5914) (not e!2573))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!377 0))(
  ( (array!378 (arr!179 (Array (_ BitVec 32) (_ BitVec 64))) (size!241 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!377)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!471)

(declare-fun minValue!1434 () V!471)

(declare-datatypes ((tuple2!106 0))(
  ( (tuple2!107 (_1!53 (_ BitVec 64)) (_2!53 V!471)) )
))
(declare-datatypes ((List!115 0))(
  ( (Nil!112) (Cons!111 (h!677 tuple2!106) (t!2246 List!115)) )
))
(declare-datatypes ((ListLongMap!111 0))(
  ( (ListLongMap!112 (toList!71 List!115)) )
))
(declare-fun contains!43 (ListLongMap!111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!30 (array!377 array!375 (_ BitVec 32) (_ BitVec 32) V!471 V!471 (_ BitVec 32) Int) ListLongMap!111)

(assert (=> b!4817 (= res!5914 (contains!43 (getCurrentListMap!30 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!4818 () Bool)

(declare-fun res!5909 () Bool)

(assert (=> b!4818 (=> (not res!5909) (not e!2573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4818 (= res!5909 (validKeyInArray!0 k!1278))))

(declare-fun b!4819 () Bool)

(declare-fun e!2571 () Bool)

(declare-fun arrayContainsKey!0 (array!377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4819 (= e!2571 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun res!5910 () Bool)

(assert (=> start!710 (=> (not res!5910) (not e!2573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!710 (= res!5910 (validMask!0 mask!2250))))

(assert (=> start!710 e!2573))

(assert (=> start!710 tp!653))

(assert (=> start!710 true))

(declare-fun e!2570 () Bool)

(declare-fun array_inv!131 (array!375) Bool)

(assert (=> start!710 (and (array_inv!131 _values!1492) e!2570)))

(declare-fun tp_is_empty!221 () Bool)

(assert (=> start!710 tp_is_empty!221))

(declare-fun array_inv!132 (array!377) Bool)

(assert (=> start!710 (array_inv!132 _keys!1806)))

(declare-fun b!4820 () Bool)

(assert (=> b!4820 (= e!2568 tp_is_empty!221)))

(declare-fun b!4821 () Bool)

(declare-fun res!5912 () Bool)

(assert (=> b!4821 (=> (not res!5912) (not e!2573))))

(declare-datatypes ((List!116 0))(
  ( (Nil!113) (Cons!112 (h!678 (_ BitVec 64)) (t!2247 List!116)) )
))
(declare-fun arrayNoDuplicates!0 (array!377 (_ BitVec 32) List!116) Bool)

(assert (=> b!4821 (= res!5912 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!113))))

(declare-fun b!4822 () Bool)

(assert (=> b!4822 (= e!2571 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4823 () Bool)

(declare-fun res!5911 () Bool)

(assert (=> b!4823 (=> (not res!5911) (not e!2573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!377 (_ BitVec 32)) Bool)

(assert (=> b!4823 (= res!5911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4824 () Bool)

(declare-fun e!2572 () Bool)

(assert (=> b!4824 (= e!2570 (and e!2572 mapRes!296))))

(declare-fun condMapEmpty!296 () Bool)

(declare-fun mapDefault!296 () ValueCell!94)

