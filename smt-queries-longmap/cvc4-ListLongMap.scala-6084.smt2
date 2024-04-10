; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78616 () Bool)

(assert start!78616)

(declare-fun b_free!16829 () Bool)

(declare-fun b_next!16829 () Bool)

(assert (=> start!78616 (= b_free!16829 (not b_next!16829))))

(declare-fun tp!58928 () Bool)

(declare-fun b_and!27451 () Bool)

(assert (=> start!78616 (= tp!58928 b_and!27451)))

(declare-fun b!916458 () Bool)

(declare-fun e!514449 () Bool)

(assert (=> b!916458 (= e!514449 false)))

(declare-datatypes ((V!30747 0))(
  ( (V!30748 (val!9719 Int)) )
))
(declare-fun lt!411796 () V!30747)

(declare-datatypes ((tuple2!12610 0))(
  ( (tuple2!12611 (_1!6316 (_ BitVec 64)) (_2!6316 V!30747)) )
))
(declare-datatypes ((List!18421 0))(
  ( (Nil!18418) (Cons!18417 (h!19563 tuple2!12610) (t!26034 List!18421)) )
))
(declare-datatypes ((ListLongMap!11307 0))(
  ( (ListLongMap!11308 (toList!5669 List!18421)) )
))
(declare-fun lt!411795 () ListLongMap!11307)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!528 (ListLongMap!11307 (_ BitVec 64)) V!30747)

(assert (=> b!916458 (= lt!411796 (apply!528 lt!411795 k!1099))))

(declare-fun mapNonEmpty!30762 () Bool)

(declare-fun mapRes!30762 () Bool)

(declare-fun tp!58927 () Bool)

(declare-fun e!514448 () Bool)

(assert (=> mapNonEmpty!30762 (= mapRes!30762 (and tp!58927 e!514448))))

(declare-datatypes ((ValueCell!9187 0))(
  ( (ValueCellFull!9187 (v!12237 V!30747)) (EmptyCell!9187) )
))
(declare-fun mapRest!30762 () (Array (_ BitVec 32) ValueCell!9187))

(declare-datatypes ((array!54662 0))(
  ( (array!54663 (arr!26276 (Array (_ BitVec 32) ValueCell!9187)) (size!26735 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54662)

(declare-fun mapKey!30762 () (_ BitVec 32))

(declare-fun mapValue!30762 () ValueCell!9187)

(assert (=> mapNonEmpty!30762 (= (arr!26276 _values!1231) (store mapRest!30762 mapKey!30762 mapValue!30762))))

(declare-fun b!916459 () Bool)

(declare-fun res!617833 () Bool)

(declare-fun e!514450 () Bool)

(assert (=> b!916459 (=> (not res!617833) (not e!514450))))

(declare-datatypes ((array!54664 0))(
  ( (array!54665 (arr!26277 (Array (_ BitVec 32) (_ BitVec 64))) (size!26736 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54664)

(declare-datatypes ((List!18422 0))(
  ( (Nil!18419) (Cons!18418 (h!19564 (_ BitVec 64)) (t!26035 List!18422)) )
))
(declare-fun arrayNoDuplicates!0 (array!54664 (_ BitVec 32) List!18422) Bool)

(assert (=> b!916459 (= res!617833 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18419))))

(declare-fun res!617828 () Bool)

(assert (=> start!78616 (=> (not res!617828) (not e!514450))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78616 (= res!617828 (validMask!0 mask!1881))))

(assert (=> start!78616 e!514450))

(assert (=> start!78616 true))

(declare-fun e!514446 () Bool)

(declare-fun array_inv!20496 (array!54662) Bool)

(assert (=> start!78616 (and (array_inv!20496 _values!1231) e!514446)))

(assert (=> start!78616 tp!58928))

(declare-fun array_inv!20497 (array!54664) Bool)

(assert (=> start!78616 (array_inv!20497 _keys!1487)))

(declare-fun tp_is_empty!19337 () Bool)

(assert (=> start!78616 tp_is_empty!19337))

(declare-fun b!916460 () Bool)

(declare-fun res!617831 () Bool)

(assert (=> b!916460 (=> (not res!617831) (not e!514450))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916460 (= res!617831 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26736 _keys!1487))))))

(declare-fun mapIsEmpty!30762 () Bool)

(assert (=> mapIsEmpty!30762 mapRes!30762))

(declare-fun b!916461 () Bool)

(declare-fun e!514447 () Bool)

(assert (=> b!916461 (= e!514446 (and e!514447 mapRes!30762))))

(declare-fun condMapEmpty!30762 () Bool)

(declare-fun mapDefault!30762 () ValueCell!9187)

