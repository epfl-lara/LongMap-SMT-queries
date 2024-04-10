; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78606 () Bool)

(assert start!78606)

(declare-fun b_free!16819 () Bool)

(declare-fun b_next!16819 () Bool)

(assert (=> start!78606 (= b_free!16819 (not b_next!16819))))

(declare-fun tp!58898 () Bool)

(declare-fun b_and!27441 () Bool)

(assert (=> start!78606 (= tp!58898 b_and!27441)))

(declare-fun mapIsEmpty!30747 () Bool)

(declare-fun mapRes!30747 () Bool)

(assert (=> mapIsEmpty!30747 mapRes!30747))

(declare-fun b!916331 () Bool)

(declare-fun e!514364 () Bool)

(declare-fun tp_is_empty!19327 () Bool)

(assert (=> b!916331 (= e!514364 tp_is_empty!19327)))

(declare-fun b!916332 () Bool)

(declare-fun res!617746 () Bool)

(declare-fun e!514363 () Bool)

(assert (=> b!916332 (=> (not res!617746) (not e!514363))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54644 0))(
  ( (array!54645 (arr!26267 (Array (_ BitVec 32) (_ BitVec 64))) (size!26726 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54644)

(assert (=> b!916332 (= res!617746 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26726 _keys!1487))))))

(declare-fun b!916333 () Bool)

(assert (=> b!916333 (= e!514363 false)))

(declare-fun lt!411772 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30735 0))(
  ( (V!30736 (val!9714 Int)) )
))
(declare-datatypes ((ValueCell!9182 0))(
  ( (ValueCellFull!9182 (v!12232 V!30735)) (EmptyCell!9182) )
))
(declare-datatypes ((array!54646 0))(
  ( (array!54647 (arr!26268 (Array (_ BitVec 32) ValueCell!9182)) (size!26727 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54646)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30735)

(declare-fun minValue!1173 () V!30735)

(declare-datatypes ((tuple2!12602 0))(
  ( (tuple2!12603 (_1!6312 (_ BitVec 64)) (_2!6312 V!30735)) )
))
(declare-datatypes ((List!18414 0))(
  ( (Nil!18411) (Cons!18410 (h!19556 tuple2!12602) (t!26027 List!18414)) )
))
(declare-datatypes ((ListLongMap!11299 0))(
  ( (ListLongMap!11300 (toList!5665 List!18414)) )
))
(declare-fun contains!4719 (ListLongMap!11299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2926 (array!54644 array!54646 (_ BitVec 32) (_ BitVec 32) V!30735 V!30735 (_ BitVec 32) Int) ListLongMap!11299)

(assert (=> b!916333 (= lt!411772 (contains!4719 (getCurrentListMap!2926 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k!1099))))

(declare-fun mapNonEmpty!30747 () Bool)

(declare-fun tp!58897 () Bool)

(declare-fun e!514365 () Bool)

(assert (=> mapNonEmpty!30747 (= mapRes!30747 (and tp!58897 e!514365))))

(declare-fun mapRest!30747 () (Array (_ BitVec 32) ValueCell!9182))

(declare-fun mapValue!30747 () ValueCell!9182)

(declare-fun mapKey!30747 () (_ BitVec 32))

(assert (=> mapNonEmpty!30747 (= (arr!26268 _values!1231) (store mapRest!30747 mapKey!30747 mapValue!30747))))

(declare-fun b!916334 () Bool)

(declare-fun e!514366 () Bool)

(assert (=> b!916334 (= e!514366 (and e!514364 mapRes!30747))))

(declare-fun condMapEmpty!30747 () Bool)

(declare-fun mapDefault!30747 () ValueCell!9182)

