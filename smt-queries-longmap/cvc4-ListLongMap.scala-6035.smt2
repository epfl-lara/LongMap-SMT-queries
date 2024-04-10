; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78114 () Bool)

(assert start!78114)

(declare-fun b_free!16625 () Bool)

(declare-fun b_next!16625 () Bool)

(assert (=> start!78114 (= b_free!16625 (not b_next!16625))))

(declare-fun tp!58148 () Bool)

(declare-fun b_and!27199 () Bool)

(assert (=> start!78114 (= tp!58148 b_and!27199)))

(declare-fun mapIsEmpty!30289 () Bool)

(declare-fun mapRes!30289 () Bool)

(assert (=> mapIsEmpty!30289 mapRes!30289))

(declare-fun b!911704 () Bool)

(declare-fun res!615076 () Bool)

(declare-fun e!511343 () Bool)

(assert (=> b!911704 (=> (not res!615076) (not e!511343))))

(declare-datatypes ((V!30355 0))(
  ( (V!30356 (val!9572 Int)) )
))
(declare-datatypes ((ValueCell!9040 0))(
  ( (ValueCellFull!9040 (v!12082 V!30355)) (EmptyCell!9040) )
))
(declare-datatypes ((array!54086 0))(
  ( (array!54087 (arr!25998 (Array (_ BitVec 32) ValueCell!9040)) (size!26457 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54086)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54088 0))(
  ( (array!54089 (arr!25999 (Array (_ BitVec 32) (_ BitVec 64))) (size!26458 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54088)

(assert (=> b!911704 (= res!615076 (and (= (size!26457 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26458 _keys!1386) (size!26457 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615077 () Bool)

(assert (=> start!78114 (=> (not res!615077) (not e!511343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78114 (= res!615077 (validMask!0 mask!1756))))

(assert (=> start!78114 e!511343))

(declare-fun e!511344 () Bool)

(declare-fun array_inv!20322 (array!54086) Bool)

(assert (=> start!78114 (and (array_inv!20322 _values!1152) e!511344)))

(assert (=> start!78114 tp!58148))

(assert (=> start!78114 true))

(declare-fun tp_is_empty!19043 () Bool)

(assert (=> start!78114 tp_is_empty!19043))

(declare-fun array_inv!20323 (array!54088) Bool)

(assert (=> start!78114 (array_inv!20323 _keys!1386)))

(declare-fun b!911705 () Bool)

(assert (=> b!911705 (= e!511343 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30355)

(declare-fun lt!410498 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30355)

(declare-datatypes ((tuple2!12468 0))(
  ( (tuple2!12469 (_1!6245 (_ BitVec 64)) (_2!6245 V!30355)) )
))
(declare-datatypes ((List!18260 0))(
  ( (Nil!18257) (Cons!18256 (h!19402 tuple2!12468) (t!25847 List!18260)) )
))
(declare-datatypes ((ListLongMap!11165 0))(
  ( (ListLongMap!11166 (toList!5598 List!18260)) )
))
(declare-fun contains!4643 (ListLongMap!11165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2860 (array!54088 array!54086 (_ BitVec 32) (_ BitVec 32) V!30355 V!30355 (_ BitVec 32) Int) ListLongMap!11165)

(assert (=> b!911705 (= lt!410498 (contains!4643 (getCurrentListMap!2860 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911706 () Bool)

(declare-fun e!511346 () Bool)

(assert (=> b!911706 (= e!511346 tp_is_empty!19043)))

(declare-fun mapNonEmpty!30289 () Bool)

(declare-fun tp!58149 () Bool)

(declare-fun e!511347 () Bool)

(assert (=> mapNonEmpty!30289 (= mapRes!30289 (and tp!58149 e!511347))))

(declare-fun mapKey!30289 () (_ BitVec 32))

(declare-fun mapRest!30289 () (Array (_ BitVec 32) ValueCell!9040))

(declare-fun mapValue!30289 () ValueCell!9040)

(assert (=> mapNonEmpty!30289 (= (arr!25998 _values!1152) (store mapRest!30289 mapKey!30289 mapValue!30289))))

(declare-fun b!911707 () Bool)

(declare-fun res!615075 () Bool)

(assert (=> b!911707 (=> (not res!615075) (not e!511343))))

(declare-datatypes ((List!18261 0))(
  ( (Nil!18258) (Cons!18257 (h!19403 (_ BitVec 64)) (t!25848 List!18261)) )
))
(declare-fun arrayNoDuplicates!0 (array!54088 (_ BitVec 32) List!18261) Bool)

(assert (=> b!911707 (= res!615075 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18258))))

(declare-fun b!911708 () Bool)

(declare-fun res!615078 () Bool)

(assert (=> b!911708 (=> (not res!615078) (not e!511343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54088 (_ BitVec 32)) Bool)

(assert (=> b!911708 (= res!615078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911709 () Bool)

(assert (=> b!911709 (= e!511347 tp_is_empty!19043)))

(declare-fun b!911710 () Bool)

(assert (=> b!911710 (= e!511344 (and e!511346 mapRes!30289))))

(declare-fun condMapEmpty!30289 () Bool)

(declare-fun mapDefault!30289 () ValueCell!9040)

