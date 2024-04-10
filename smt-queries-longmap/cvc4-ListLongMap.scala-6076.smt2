; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78568 () Bool)

(assert start!78568)

(declare-fun b_free!16781 () Bool)

(declare-fun b_next!16781 () Bool)

(assert (=> start!78568 (= b_free!16781 (not b_next!16781))))

(declare-fun tp!58783 () Bool)

(declare-fun b_and!27403 () Bool)

(assert (=> start!78568 (= tp!58783 b_and!27403)))

(declare-fun b!915866 () Bool)

(declare-fun e!514077 () Bool)

(declare-fun tp_is_empty!19289 () Bool)

(assert (=> b!915866 (= e!514077 tp_is_empty!19289)))

(declare-fun b!915867 () Bool)

(declare-fun e!514081 () Bool)

(assert (=> b!915867 (= e!514081 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30683 0))(
  ( (V!30684 (val!9695 Int)) )
))
(declare-datatypes ((ValueCell!9163 0))(
  ( (ValueCellFull!9163 (v!12213 V!30683)) (EmptyCell!9163) )
))
(declare-datatypes ((array!54572 0))(
  ( (array!54573 (arr!26231 (Array (_ BitVec 32) ValueCell!9163)) (size!26690 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54572)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!54574 0))(
  ( (array!54575 (arr!26232 (Array (_ BitVec 32) (_ BitVec 64))) (size!26691 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54574)

(declare-fun lt!411724 () Bool)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30683)

(declare-fun minValue!1173 () V!30683)

(declare-datatypes ((tuple2!12580 0))(
  ( (tuple2!12581 (_1!6301 (_ BitVec 64)) (_2!6301 V!30683)) )
))
(declare-datatypes ((List!18391 0))(
  ( (Nil!18388) (Cons!18387 (h!19533 tuple2!12580) (t!26004 List!18391)) )
))
(declare-datatypes ((ListLongMap!11277 0))(
  ( (ListLongMap!11278 (toList!5654 List!18391)) )
))
(declare-fun contains!4708 (ListLongMap!11277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2915 (array!54574 array!54572 (_ BitVec 32) (_ BitVec 32) V!30683 V!30683 (_ BitVec 32) Int) ListLongMap!11277)

(assert (=> b!915867 (= lt!411724 (contains!4708 (getCurrentListMap!2915 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k!1099))))

(declare-fun b!915868 () Bool)

(declare-fun res!617455 () Bool)

(assert (=> b!915868 (=> (not res!617455) (not e!514081))))

(declare-datatypes ((List!18392 0))(
  ( (Nil!18389) (Cons!18388 (h!19534 (_ BitVec 64)) (t!26005 List!18392)) )
))
(declare-fun arrayNoDuplicates!0 (array!54574 (_ BitVec 32) List!18392) Bool)

(assert (=> b!915868 (= res!617455 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18389))))

(declare-fun mapNonEmpty!30690 () Bool)

(declare-fun mapRes!30690 () Bool)

(declare-fun tp!58784 () Bool)

(assert (=> mapNonEmpty!30690 (= mapRes!30690 (and tp!58784 e!514077))))

(declare-fun mapValue!30690 () ValueCell!9163)

(declare-fun mapKey!30690 () (_ BitVec 32))

(declare-fun mapRest!30690 () (Array (_ BitVec 32) ValueCell!9163))

(assert (=> mapNonEmpty!30690 (= (arr!26231 _values!1231) (store mapRest!30690 mapKey!30690 mapValue!30690))))

(declare-fun b!915869 () Bool)

(declare-fun res!617452 () Bool)

(assert (=> b!915869 (=> (not res!617452) (not e!514081))))

(assert (=> b!915869 (= res!617452 (and (= (size!26690 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26691 _keys!1487) (size!26690 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!617451 () Bool)

(assert (=> start!78568 (=> (not res!617451) (not e!514081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78568 (= res!617451 (validMask!0 mask!1881))))

(assert (=> start!78568 e!514081))

(assert (=> start!78568 true))

(declare-fun e!514078 () Bool)

(declare-fun array_inv!20466 (array!54572) Bool)

(assert (=> start!78568 (and (array_inv!20466 _values!1231) e!514078)))

(assert (=> start!78568 tp!58783))

(declare-fun array_inv!20467 (array!54574) Bool)

(assert (=> start!78568 (array_inv!20467 _keys!1487)))

(assert (=> start!78568 tp_is_empty!19289))

(declare-fun b!915865 () Bool)

(declare-fun res!617454 () Bool)

(assert (=> b!915865 (=> (not res!617454) (not e!514081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54574 (_ BitVec 32)) Bool)

(assert (=> b!915865 (= res!617454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30690 () Bool)

(assert (=> mapIsEmpty!30690 mapRes!30690))

(declare-fun b!915870 () Bool)

(declare-fun res!617453 () Bool)

(assert (=> b!915870 (=> (not res!617453) (not e!514081))))

(assert (=> b!915870 (= res!617453 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26691 _keys!1487))))))

(declare-fun b!915871 () Bool)

(declare-fun e!514079 () Bool)

(assert (=> b!915871 (= e!514079 tp_is_empty!19289)))

(declare-fun b!915872 () Bool)

(assert (=> b!915872 (= e!514078 (and e!514079 mapRes!30690))))

(declare-fun condMapEmpty!30690 () Bool)

(declare-fun mapDefault!30690 () ValueCell!9163)

