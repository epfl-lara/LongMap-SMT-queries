; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78370 () Bool)

(assert start!78370)

(declare-fun b_free!16753 () Bool)

(declare-fun b_next!16753 () Bool)

(assert (=> start!78370 (= b_free!16753 (not b_next!16753))))

(declare-fun tp!58548 () Bool)

(declare-fun b_and!27347 () Bool)

(assert (=> start!78370 (= tp!58548 b_and!27347)))

(declare-fun b!914198 () Bool)

(declare-fun e!512835 () Bool)

(assert (=> b!914198 (= e!512835 false)))

(declare-datatypes ((V!30527 0))(
  ( (V!30528 (val!9636 Int)) )
))
(declare-datatypes ((ValueCell!9104 0))(
  ( (ValueCellFull!9104 (v!12151 V!30527)) (EmptyCell!9104) )
))
(declare-datatypes ((array!54339 0))(
  ( (array!54340 (arr!26121 (Array (_ BitVec 32) ValueCell!9104)) (size!26582 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54339)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30527)

(declare-datatypes ((array!54341 0))(
  ( (array!54342 (arr!26122 (Array (_ BitVec 32) (_ BitVec 64))) (size!26583 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54341)

(declare-fun lt!411247 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30527)

(declare-datatypes ((tuple2!12610 0))(
  ( (tuple2!12611 (_1!6316 (_ BitVec 64)) (_2!6316 V!30527)) )
))
(declare-datatypes ((List!18386 0))(
  ( (Nil!18383) (Cons!18382 (h!19528 tuple2!12610) (t!25988 List!18386)) )
))
(declare-datatypes ((ListLongMap!11297 0))(
  ( (ListLongMap!11298 (toList!5664 List!18386)) )
))
(declare-fun contains!4670 (ListLongMap!11297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2864 (array!54341 array!54339 (_ BitVec 32) (_ BitVec 32) V!30527 V!30527 (_ BitVec 32) Int) ListLongMap!11297)

(assert (=> b!914198 (= lt!411247 (contains!4670 (getCurrentListMap!2864 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30495 () Bool)

(declare-fun mapRes!30495 () Bool)

(assert (=> mapIsEmpty!30495 mapRes!30495))

(declare-fun b!914200 () Bool)

(declare-fun e!512832 () Bool)

(declare-fun e!512833 () Bool)

(assert (=> b!914200 (= e!512832 (and e!512833 mapRes!30495))))

(declare-fun condMapEmpty!30495 () Bool)

(declare-fun mapDefault!30495 () ValueCell!9104)

(assert (=> b!914200 (= condMapEmpty!30495 (= (arr!26121 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9104)) mapDefault!30495)))))

(declare-fun b!914201 () Bool)

(declare-fun res!616592 () Bool)

(assert (=> b!914201 (=> (not res!616592) (not e!512835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54341 (_ BitVec 32)) Bool)

(assert (=> b!914201 (= res!616592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!914202 () Bool)

(declare-fun res!616591 () Bool)

(assert (=> b!914202 (=> (not res!616591) (not e!512835))))

(declare-datatypes ((List!18387 0))(
  ( (Nil!18384) (Cons!18383 (h!19529 (_ BitVec 64)) (t!25989 List!18387)) )
))
(declare-fun arrayNoDuplicates!0 (array!54341 (_ BitVec 32) List!18387) Bool)

(assert (=> b!914202 (= res!616591 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18384))))

(declare-fun b!914203 () Bool)

(declare-fun e!512836 () Bool)

(declare-fun tp_is_empty!19171 () Bool)

(assert (=> b!914203 (= e!512836 tp_is_empty!19171)))

(declare-fun b!914204 () Bool)

(assert (=> b!914204 (= e!512833 tp_is_empty!19171)))

(declare-fun mapNonEmpty!30495 () Bool)

(declare-fun tp!58547 () Bool)

(assert (=> mapNonEmpty!30495 (= mapRes!30495 (and tp!58547 e!512836))))

(declare-fun mapKey!30495 () (_ BitVec 32))

(declare-fun mapRest!30495 () (Array (_ BitVec 32) ValueCell!9104))

(declare-fun mapValue!30495 () ValueCell!9104)

(assert (=> mapNonEmpty!30495 (= (arr!26121 _values!1152) (store mapRest!30495 mapKey!30495 mapValue!30495))))

(declare-fun res!616590 () Bool)

(assert (=> start!78370 (=> (not res!616590) (not e!512835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78370 (= res!616590 (validMask!0 mask!1756))))

(assert (=> start!78370 e!512835))

(declare-fun array_inv!20480 (array!54339) Bool)

(assert (=> start!78370 (and (array_inv!20480 _values!1152) e!512832)))

(assert (=> start!78370 tp!58548))

(assert (=> start!78370 true))

(assert (=> start!78370 tp_is_empty!19171))

(declare-fun array_inv!20481 (array!54341) Bool)

(assert (=> start!78370 (array_inv!20481 _keys!1386)))

(declare-fun b!914199 () Bool)

(declare-fun res!616593 () Bool)

(assert (=> b!914199 (=> (not res!616593) (not e!512835))))

(assert (=> b!914199 (= res!616593 (and (= (size!26582 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26583 _keys!1386) (size!26582 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78370 res!616590) b!914199))

(assert (= (and b!914199 res!616593) b!914201))

(assert (= (and b!914201 res!616592) b!914202))

(assert (= (and b!914202 res!616591) b!914198))

(assert (= (and b!914200 condMapEmpty!30495) mapIsEmpty!30495))

(assert (= (and b!914200 (not condMapEmpty!30495)) mapNonEmpty!30495))

(get-info :version)

(assert (= (and mapNonEmpty!30495 ((_ is ValueCellFull!9104) mapValue!30495)) b!914203))

(assert (= (and b!914200 ((_ is ValueCellFull!9104) mapDefault!30495)) b!914204))

(assert (= start!78370 b!914200))

(declare-fun m!848417 () Bool)

(assert (=> mapNonEmpty!30495 m!848417))

(declare-fun m!848419 () Bool)

(assert (=> b!914202 m!848419))

(declare-fun m!848421 () Bool)

(assert (=> b!914198 m!848421))

(assert (=> b!914198 m!848421))

(declare-fun m!848423 () Bool)

(assert (=> b!914198 m!848423))

(declare-fun m!848425 () Bool)

(assert (=> start!78370 m!848425))

(declare-fun m!848427 () Bool)

(assert (=> start!78370 m!848427))

(declare-fun m!848429 () Bool)

(assert (=> start!78370 m!848429))

(declare-fun m!848431 () Bool)

(assert (=> b!914201 m!848431))

(check-sat (not start!78370) tp_is_empty!19171 (not b_next!16753) (not mapNonEmpty!30495) (not b!914201) (not b!914198) b_and!27347 (not b!914202))
(check-sat b_and!27347 (not b_next!16753))
