; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78386 () Bool)

(assert start!78386)

(declare-fun b_free!16751 () Bool)

(declare-fun b_next!16751 () Bool)

(assert (=> start!78386 (= b_free!16751 (not b_next!16751))))

(declare-fun tp!58541 () Bool)

(declare-fun b_and!27369 () Bool)

(assert (=> start!78386 (= tp!58541 b_and!27369)))

(declare-fun b!914408 () Bool)

(declare-fun res!616683 () Bool)

(declare-fun e!512969 () Bool)

(assert (=> b!914408 (=> (not res!616683) (not e!512969))))

(declare-datatypes ((array!54330 0))(
  ( (array!54331 (arr!26116 (Array (_ BitVec 32) (_ BitVec 64))) (size!26575 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54330)

(declare-datatypes ((List!18348 0))(
  ( (Nil!18345) (Cons!18344 (h!19490 (_ BitVec 64)) (t!25959 List!18348)) )
))
(declare-fun arrayNoDuplicates!0 (array!54330 (_ BitVec 32) List!18348) Bool)

(assert (=> b!914408 (= res!616683 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18345))))

(declare-fun b!914409 () Bool)

(declare-fun res!616689 () Bool)

(assert (=> b!914409 (=> (not res!616689) (not e!512969))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54330 (_ BitVec 32)) Bool)

(assert (=> b!914409 (= res!616689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!914410 () Bool)

(declare-fun e!512968 () Bool)

(declare-fun tp_is_empty!19169 () Bool)

(assert (=> b!914410 (= e!512968 tp_is_empty!19169)))

(declare-fun b!914411 () Bool)

(declare-fun res!616685 () Bool)

(declare-fun e!512962 () Bool)

(assert (=> b!914411 (=> (not res!616685) (not e!512962))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!914411 (= res!616685 (and (= (select (arr!26116 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914412 () Bool)

(declare-fun e!512967 () Bool)

(assert (=> b!914412 (= e!512967 tp_is_empty!19169)))

(declare-fun b!914413 () Bool)

(declare-fun e!512963 () Bool)

(declare-fun e!512964 () Bool)

(assert (=> b!914413 (= e!512963 e!512964)))

(declare-fun res!616687 () Bool)

(assert (=> b!914413 (=> res!616687 e!512964)))

(declare-datatypes ((V!30523 0))(
  ( (V!30524 (val!9635 Int)) )
))
(declare-datatypes ((tuple2!12560 0))(
  ( (tuple2!12561 (_1!6291 (_ BitVec 64)) (_2!6291 V!30523)) )
))
(declare-datatypes ((List!18349 0))(
  ( (Nil!18346) (Cons!18345 (h!19491 tuple2!12560) (t!25960 List!18349)) )
))
(declare-datatypes ((ListLongMap!11257 0))(
  ( (ListLongMap!11258 (toList!5644 List!18349)) )
))
(declare-fun lt!411477 () ListLongMap!11257)

(declare-fun contains!4694 (ListLongMap!11257 (_ BitVec 64)) Bool)

(assert (=> b!914413 (= res!616687 (not (contains!4694 lt!411477 k!1033)))))

(declare-datatypes ((ValueCell!9103 0))(
  ( (ValueCellFull!9103 (v!12151 V!30523)) (EmptyCell!9103) )
))
(declare-datatypes ((array!54332 0))(
  ( (array!54333 (arr!26117 (Array (_ BitVec 32) ValueCell!9103)) (size!26576 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54332)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30523)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30523)

(declare-fun getCurrentListMap!2905 (array!54330 array!54332 (_ BitVec 32) (_ BitVec 32) V!30523 V!30523 (_ BitVec 32) Int) ListLongMap!11257)

(assert (=> b!914413 (= lt!411477 (getCurrentListMap!2905 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!616682 () Bool)

(assert (=> start!78386 (=> (not res!616682) (not e!512969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78386 (= res!616682 (validMask!0 mask!1756))))

(assert (=> start!78386 e!512969))

(declare-fun e!512966 () Bool)

(declare-fun array_inv!20396 (array!54332) Bool)

(assert (=> start!78386 (and (array_inv!20396 _values!1152) e!512966)))

(assert (=> start!78386 tp!58541))

(assert (=> start!78386 true))

(assert (=> start!78386 tp_is_empty!19169))

(declare-fun array_inv!20397 (array!54330) Bool)

(assert (=> start!78386 (array_inv!20397 _keys!1386)))

(declare-fun mapIsEmpty!30492 () Bool)

(declare-fun mapRes!30492 () Bool)

(assert (=> mapIsEmpty!30492 mapRes!30492))

(declare-fun b!914414 () Bool)

(assert (=> b!914414 (= e!512964 true)))

(declare-fun lt!411480 () ListLongMap!11257)

(declare-fun lt!411479 () V!30523)

(declare-fun apply!522 (ListLongMap!11257 (_ BitVec 64)) V!30523)

(assert (=> b!914414 (= (apply!522 lt!411480 k!1033) lt!411479)))

(declare-datatypes ((Unit!30956 0))(
  ( (Unit!30957) )
))
(declare-fun lt!411476 () Unit!30956)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!65 (array!54330 array!54332 (_ BitVec 32) (_ BitVec 32) V!30523 V!30523 (_ BitVec 64) V!30523 (_ BitVec 32) Int) Unit!30956)

(assert (=> b!914414 (= lt!411476 (lemmaListMapApplyFromThenApplyFromZero!65 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!411479 i!717 defaultEntry!1160))))

(declare-fun b!914415 () Bool)

(assert (=> b!914415 (= e!512969 e!512962)))

(declare-fun res!616686 () Bool)

(assert (=> b!914415 (=> (not res!616686) (not e!512962))))

(assert (=> b!914415 (= res!616686 (contains!4694 lt!411480 k!1033))))

(assert (=> b!914415 (= lt!411480 (getCurrentListMap!2905 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914416 () Bool)

(declare-fun res!616690 () Bool)

(assert (=> b!914416 (=> (not res!616690) (not e!512969))))

(assert (=> b!914416 (= res!616690 (and (= (size!26576 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26575 _keys!1386) (size!26576 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914417 () Bool)

(declare-fun res!616684 () Bool)

(assert (=> b!914417 (=> res!616684 e!512964)))

(assert (=> b!914417 (= res!616684 (not (= (apply!522 lt!411477 k!1033) lt!411479)))))

(declare-fun b!914418 () Bool)

(assert (=> b!914418 (= e!512966 (and e!512967 mapRes!30492))))

(declare-fun condMapEmpty!30492 () Bool)

(declare-fun mapDefault!30492 () ValueCell!9103)

