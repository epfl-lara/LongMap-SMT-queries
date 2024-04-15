; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78498 () Bool)

(assert start!78498)

(declare-fun b!915097 () Bool)

(declare-fun res!617048 () Bool)

(declare-fun e!513542 () Bool)

(assert (=> b!915097 (=> (not res!617048) (not e!513542))))

(declare-datatypes ((array!54465 0))(
  ( (array!54466 (arr!26178 (Array (_ BitVec 32) (_ BitVec 64))) (size!26639 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54465)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30615 0))(
  ( (V!30616 (val!9669 Int)) )
))
(declare-datatypes ((ValueCell!9137 0))(
  ( (ValueCellFull!9137 (v!12186 V!30615)) (EmptyCell!9137) )
))
(declare-datatypes ((array!54467 0))(
  ( (array!54468 (arr!26179 (Array (_ BitVec 32) ValueCell!9137)) (size!26640 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54467)

(assert (=> b!915097 (= res!617048 (and (= (size!26640 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26639 _keys!1487) (size!26640 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915098 () Bool)

(declare-fun e!513541 () Bool)

(declare-fun e!513540 () Bool)

(declare-fun mapRes!30612 () Bool)

(assert (=> b!915098 (= e!513541 (and e!513540 mapRes!30612))))

(declare-fun condMapEmpty!30612 () Bool)

(declare-fun mapDefault!30612 () ValueCell!9137)

(assert (=> b!915098 (= condMapEmpty!30612 (= (arr!26179 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9137)) mapDefault!30612)))))

(declare-fun res!617047 () Bool)

(assert (=> start!78498 (=> (not res!617047) (not e!513542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78498 (= res!617047 (validMask!0 mask!1881))))

(assert (=> start!78498 e!513542))

(assert (=> start!78498 true))

(declare-fun array_inv!20518 (array!54467) Bool)

(assert (=> start!78498 (and (array_inv!20518 _values!1231) e!513541)))

(declare-fun array_inv!20519 (array!54465) Bool)

(assert (=> start!78498 (array_inv!20519 _keys!1487)))

(declare-fun mapIsEmpty!30612 () Bool)

(assert (=> mapIsEmpty!30612 mapRes!30612))

(declare-fun b!915099 () Bool)

(declare-fun e!513543 () Bool)

(declare-fun tp_is_empty!19237 () Bool)

(assert (=> b!915099 (= e!513543 tp_is_empty!19237)))

(declare-fun mapNonEmpty!30612 () Bool)

(declare-fun tp!58680 () Bool)

(assert (=> mapNonEmpty!30612 (= mapRes!30612 (and tp!58680 e!513543))))

(declare-fun mapRest!30612 () (Array (_ BitVec 32) ValueCell!9137))

(declare-fun mapValue!30612 () ValueCell!9137)

(declare-fun mapKey!30612 () (_ BitVec 32))

(assert (=> mapNonEmpty!30612 (= (arr!26179 _values!1231) (store mapRest!30612 mapKey!30612 mapValue!30612))))

(declare-fun b!915100 () Bool)

(assert (=> b!915100 (= e!513540 tp_is_empty!19237)))

(declare-fun b!915101 () Bool)

(declare-fun res!617046 () Bool)

(assert (=> b!915101 (=> (not res!617046) (not e!513542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54465 (_ BitVec 32)) Bool)

(assert (=> b!915101 (= res!617046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915102 () Bool)

(assert (=> b!915102 (= e!513542 false)))

(declare-fun lt!411419 () Bool)

(declare-datatypes ((List!18404 0))(
  ( (Nil!18401) (Cons!18400 (h!19546 (_ BitVec 64)) (t!26008 List!18404)) )
))
(declare-fun arrayNoDuplicates!0 (array!54465 (_ BitVec 32) List!18404) Bool)

(assert (=> b!915102 (= lt!411419 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18401))))

(assert (= (and start!78498 res!617047) b!915097))

(assert (= (and b!915097 res!617048) b!915101))

(assert (= (and b!915101 res!617046) b!915102))

(assert (= (and b!915098 condMapEmpty!30612) mapIsEmpty!30612))

(assert (= (and b!915098 (not condMapEmpty!30612)) mapNonEmpty!30612))

(get-info :version)

(assert (= (and mapNonEmpty!30612 ((_ is ValueCellFull!9137) mapValue!30612)) b!915099))

(assert (= (and b!915098 ((_ is ValueCellFull!9137) mapDefault!30612)) b!915100))

(assert (= start!78498 b!915098))

(declare-fun m!848989 () Bool)

(assert (=> start!78498 m!848989))

(declare-fun m!848991 () Bool)

(assert (=> start!78498 m!848991))

(declare-fun m!848993 () Bool)

(assert (=> start!78498 m!848993))

(declare-fun m!848995 () Bool)

(assert (=> mapNonEmpty!30612 m!848995))

(declare-fun m!848997 () Bool)

(assert (=> b!915101 m!848997))

(declare-fun m!848999 () Bool)

(assert (=> b!915102 m!848999))

(check-sat (not b!915101) (not b!915102) (not start!78498) tp_is_empty!19237 (not mapNonEmpty!30612))
(check-sat)
