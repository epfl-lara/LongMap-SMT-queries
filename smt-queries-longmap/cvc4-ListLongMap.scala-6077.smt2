; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78574 () Bool)

(assert start!78574)

(declare-fun b_free!16787 () Bool)

(declare-fun b_next!16787 () Bool)

(assert (=> start!78574 (= b_free!16787 (not b_next!16787))))

(declare-fun tp!58801 () Bool)

(declare-fun b_and!27409 () Bool)

(assert (=> start!78574 (= tp!58801 b_and!27409)))

(declare-fun b!915937 () Bool)

(declare-fun res!617500 () Bool)

(declare-fun e!514122 () Bool)

(assert (=> b!915937 (=> (not res!617500) (not e!514122))))

(declare-datatypes ((array!54584 0))(
  ( (array!54585 (arr!26237 (Array (_ BitVec 32) (_ BitVec 64))) (size!26696 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54584)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54584 (_ BitVec 32)) Bool)

(assert (=> b!915937 (= res!617500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915938 () Bool)

(assert (=> b!915938 (= e!514122 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!411733 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!30691 0))(
  ( (V!30692 (val!9698 Int)) )
))
(declare-datatypes ((ValueCell!9166 0))(
  ( (ValueCellFull!9166 (v!12216 V!30691)) (EmptyCell!9166) )
))
(declare-datatypes ((array!54586 0))(
  ( (array!54587 (arr!26238 (Array (_ BitVec 32) ValueCell!9166)) (size!26697 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54586)

(declare-fun zeroValue!1173 () V!30691)

(declare-fun minValue!1173 () V!30691)

(declare-datatypes ((tuple2!12584 0))(
  ( (tuple2!12585 (_1!6303 (_ BitVec 64)) (_2!6303 V!30691)) )
))
(declare-datatypes ((List!18395 0))(
  ( (Nil!18392) (Cons!18391 (h!19537 tuple2!12584) (t!26008 List!18395)) )
))
(declare-datatypes ((ListLongMap!11281 0))(
  ( (ListLongMap!11282 (toList!5656 List!18395)) )
))
(declare-fun contains!4710 (ListLongMap!11281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2917 (array!54584 array!54586 (_ BitVec 32) (_ BitVec 32) V!30691 V!30691 (_ BitVec 32) Int) ListLongMap!11281)

(assert (=> b!915938 (= lt!411733 (contains!4710 (getCurrentListMap!2917 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k!1099))))

(declare-fun mapIsEmpty!30699 () Bool)

(declare-fun mapRes!30699 () Bool)

(assert (=> mapIsEmpty!30699 mapRes!30699))

(declare-fun b!915939 () Bool)

(declare-fun res!617498 () Bool)

(assert (=> b!915939 (=> (not res!617498) (not e!514122))))

(assert (=> b!915939 (= res!617498 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26696 _keys!1487))))))

(declare-fun b!915940 () Bool)

(declare-fun res!617497 () Bool)

(assert (=> b!915940 (=> (not res!617497) (not e!514122))))

(declare-datatypes ((List!18396 0))(
  ( (Nil!18393) (Cons!18392 (h!19538 (_ BitVec 64)) (t!26009 List!18396)) )
))
(declare-fun arrayNoDuplicates!0 (array!54584 (_ BitVec 32) List!18396) Bool)

(assert (=> b!915940 (= res!617497 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18393))))

(declare-fun mapNonEmpty!30699 () Bool)

(declare-fun tp!58802 () Bool)

(declare-fun e!514126 () Bool)

(assert (=> mapNonEmpty!30699 (= mapRes!30699 (and tp!58802 e!514126))))

(declare-fun mapValue!30699 () ValueCell!9166)

(declare-fun mapKey!30699 () (_ BitVec 32))

(declare-fun mapRest!30699 () (Array (_ BitVec 32) ValueCell!9166))

(assert (=> mapNonEmpty!30699 (= (arr!26238 _values!1231) (store mapRest!30699 mapKey!30699 mapValue!30699))))

(declare-fun b!915941 () Bool)

(declare-fun e!514125 () Bool)

(declare-fun e!514124 () Bool)

(assert (=> b!915941 (= e!514125 (and e!514124 mapRes!30699))))

(declare-fun condMapEmpty!30699 () Bool)

(declare-fun mapDefault!30699 () ValueCell!9166)

