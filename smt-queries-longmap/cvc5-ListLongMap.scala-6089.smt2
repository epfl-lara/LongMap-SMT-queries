; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78642 () Bool)

(assert start!78642)

(declare-fun b_free!16855 () Bool)

(declare-fun b_next!16855 () Bool)

(assert (=> start!78642 (= b_free!16855 (not b_next!16855))))

(declare-fun tp!59006 () Bool)

(declare-fun b_and!27477 () Bool)

(assert (=> start!78642 (= tp!59006 b_and!27477)))

(declare-fun b!916809 () Bool)

(declare-fun res!618067 () Bool)

(declare-fun e!514680 () Bool)

(assert (=> b!916809 (=> (not res!618067) (not e!514680))))

(declare-datatypes ((array!54712 0))(
  ( (array!54713 (arr!26301 (Array (_ BitVec 32) (_ BitVec 64))) (size!26760 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54712)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54712 (_ BitVec 32)) Bool)

(assert (=> b!916809 (= res!618067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916810 () Bool)

(declare-fun e!514683 () Bool)

(assert (=> b!916810 (= e!514680 e!514683)))

(declare-fun res!618064 () Bool)

(assert (=> b!916810 (=> (not res!618064) (not e!514683))))

(declare-datatypes ((V!30783 0))(
  ( (V!30784 (val!9732 Int)) )
))
(declare-datatypes ((tuple2!12628 0))(
  ( (tuple2!12629 (_1!6325 (_ BitVec 64)) (_2!6325 V!30783)) )
))
(declare-datatypes ((List!18440 0))(
  ( (Nil!18437) (Cons!18436 (h!19582 tuple2!12628) (t!26053 List!18440)) )
))
(declare-datatypes ((ListLongMap!11325 0))(
  ( (ListLongMap!11326 (toList!5678 List!18440)) )
))
(declare-fun lt!411874 () ListLongMap!11325)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4731 (ListLongMap!11325 (_ BitVec 64)) Bool)

(assert (=> b!916810 (= res!618064 (contains!4731 lt!411874 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9200 0))(
  ( (ValueCellFull!9200 (v!12250 V!30783)) (EmptyCell!9200) )
))
(declare-datatypes ((array!54714 0))(
  ( (array!54715 (arr!26302 (Array (_ BitVec 32) ValueCell!9200)) (size!26761 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54714)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30783)

(declare-fun minValue!1173 () V!30783)

(declare-fun getCurrentListMap!2938 (array!54712 array!54714 (_ BitVec 32) (_ BitVec 32) V!30783 V!30783 (_ BitVec 32) Int) ListLongMap!11325)

(assert (=> b!916810 (= lt!411874 (getCurrentListMap!2938 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!30801 () Bool)

(declare-fun mapRes!30801 () Bool)

(assert (=> mapIsEmpty!30801 mapRes!30801))

(declare-fun mapNonEmpty!30801 () Bool)

(declare-fun tp!59005 () Bool)

(declare-fun e!514682 () Bool)

(assert (=> mapNonEmpty!30801 (= mapRes!30801 (and tp!59005 e!514682))))

(declare-fun mapKey!30801 () (_ BitVec 32))

(declare-fun mapRest!30801 () (Array (_ BitVec 32) ValueCell!9200))

(declare-fun mapValue!30801 () ValueCell!9200)

(assert (=> mapNonEmpty!30801 (= (arr!26302 _values!1231) (store mapRest!30801 mapKey!30801 mapValue!30801))))

(declare-fun b!916812 () Bool)

(declare-fun res!618062 () Bool)

(assert (=> b!916812 (=> (not res!618062) (not e!514680))))

(assert (=> b!916812 (= res!618062 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26760 _keys!1487))))))

(declare-fun b!916813 () Bool)

(declare-fun tp_is_empty!19363 () Bool)

(assert (=> b!916813 (= e!514682 tp_is_empty!19363)))

(declare-fun b!916814 () Bool)

(declare-fun e!514679 () Bool)

(declare-fun e!514684 () Bool)

(assert (=> b!916814 (= e!514679 (and e!514684 mapRes!30801))))

(declare-fun condMapEmpty!30801 () Bool)

(declare-fun mapDefault!30801 () ValueCell!9200)

