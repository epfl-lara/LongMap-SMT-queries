; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78622 () Bool)

(assert start!78622)

(declare-fun b_free!16835 () Bool)

(declare-fun b_next!16835 () Bool)

(assert (=> start!78622 (= b_free!16835 (not b_next!16835))))

(declare-fun tp!58945 () Bool)

(declare-fun b_and!27457 () Bool)

(assert (=> start!78622 (= tp!58945 b_and!27457)))

(declare-fun res!617884 () Bool)

(declare-fun e!514499 () Bool)

(assert (=> start!78622 (=> (not res!617884) (not e!514499))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78622 (= res!617884 (validMask!0 mask!1881))))

(assert (=> start!78622 e!514499))

(assert (=> start!78622 true))

(declare-datatypes ((V!30755 0))(
  ( (V!30756 (val!9722 Int)) )
))
(declare-datatypes ((ValueCell!9190 0))(
  ( (ValueCellFull!9190 (v!12240 V!30755)) (EmptyCell!9190) )
))
(declare-datatypes ((array!54674 0))(
  ( (array!54675 (arr!26282 (Array (_ BitVec 32) ValueCell!9190)) (size!26741 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54674)

(declare-fun e!514501 () Bool)

(declare-fun array_inv!20500 (array!54674) Bool)

(assert (=> start!78622 (and (array_inv!20500 _values!1231) e!514501)))

(assert (=> start!78622 tp!58945))

(declare-datatypes ((array!54676 0))(
  ( (array!54677 (arr!26283 (Array (_ BitVec 32) (_ BitVec 64))) (size!26742 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54676)

(declare-fun array_inv!20501 (array!54676) Bool)

(assert (=> start!78622 (array_inv!20501 _keys!1487)))

(declare-fun tp_is_empty!19343 () Bool)

(assert (=> start!78622 tp_is_empty!19343))

(declare-fun b!916539 () Bool)

(declare-fun res!617883 () Bool)

(assert (=> b!916539 (=> (not res!617883) (not e!514499))))

(declare-datatypes ((List!18426 0))(
  ( (Nil!18423) (Cons!18422 (h!19568 (_ BitVec 64)) (t!26039 List!18426)) )
))
(declare-fun arrayNoDuplicates!0 (array!54676 (_ BitVec 32) List!18426) Bool)

(assert (=> b!916539 (= res!617883 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18423))))

(declare-fun b!916540 () Bool)

(declare-fun res!617882 () Bool)

(assert (=> b!916540 (=> (not res!617882) (not e!514499))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916540 (= res!617882 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26742 _keys!1487))))))

(declare-fun b!916541 () Bool)

(declare-fun res!617886 () Bool)

(assert (=> b!916541 (=> (not res!617886) (not e!514499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54676 (_ BitVec 32)) Bool)

(assert (=> b!916541 (= res!617886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916542 () Bool)

(declare-fun e!514502 () Bool)

(assert (=> b!916542 (= e!514502 false)))

(declare-fun lt!411814 () V!30755)

(declare-datatypes ((tuple2!12616 0))(
  ( (tuple2!12617 (_1!6319 (_ BitVec 64)) (_2!6319 V!30755)) )
))
(declare-datatypes ((List!18427 0))(
  ( (Nil!18424) (Cons!18423 (h!19569 tuple2!12616) (t!26040 List!18427)) )
))
(declare-datatypes ((ListLongMap!11313 0))(
  ( (ListLongMap!11314 (toList!5672 List!18427)) )
))
(declare-fun lt!411813 () ListLongMap!11313)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!531 (ListLongMap!11313 (_ BitVec 64)) V!30755)

(assert (=> b!916542 (= lt!411814 (apply!531 lt!411813 k!1099))))

(declare-fun b!916543 () Bool)

(assert (=> b!916543 (= e!514499 e!514502)))

(declare-fun res!617885 () Bool)

(assert (=> b!916543 (=> (not res!617885) (not e!514502))))

(declare-fun contains!4725 (ListLongMap!11313 (_ BitVec 64)) Bool)

(assert (=> b!916543 (= res!617885 (contains!4725 lt!411813 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30755)

(declare-fun minValue!1173 () V!30755)

(declare-fun getCurrentListMap!2932 (array!54676 array!54674 (_ BitVec 32) (_ BitVec 32) V!30755 V!30755 (_ BitVec 32) Int) ListLongMap!11313)

(assert (=> b!916543 (= lt!411813 (getCurrentListMap!2932 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916544 () Bool)

(declare-fun res!617887 () Bool)

(assert (=> b!916544 (=> (not res!617887) (not e!514499))))

(assert (=> b!916544 (= res!617887 (and (= (size!26741 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26742 _keys!1487) (size!26741 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916545 () Bool)

(declare-fun e!514503 () Bool)

(assert (=> b!916545 (= e!514503 tp_is_empty!19343)))

(declare-fun mapNonEmpty!30771 () Bool)

(declare-fun mapRes!30771 () Bool)

(declare-fun tp!58946 () Bool)

(assert (=> mapNonEmpty!30771 (= mapRes!30771 (and tp!58946 e!514503))))

(declare-fun mapKey!30771 () (_ BitVec 32))

(declare-fun mapValue!30771 () ValueCell!9190)

(declare-fun mapRest!30771 () (Array (_ BitVec 32) ValueCell!9190))

(assert (=> mapNonEmpty!30771 (= (arr!26282 _values!1231) (store mapRest!30771 mapKey!30771 mapValue!30771))))

(declare-fun b!916546 () Bool)

(declare-fun e!514500 () Bool)

(assert (=> b!916546 (= e!514500 tp_is_empty!19343)))

(declare-fun mapIsEmpty!30771 () Bool)

(assert (=> mapIsEmpty!30771 mapRes!30771))

(declare-fun b!916547 () Bool)

(assert (=> b!916547 (= e!514501 (and e!514500 mapRes!30771))))

(declare-fun condMapEmpty!30771 () Bool)

(declare-fun mapDefault!30771 () ValueCell!9190)

