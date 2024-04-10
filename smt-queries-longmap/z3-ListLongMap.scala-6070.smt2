; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78530 () Bool)

(assert start!78530)

(declare-fun b!915463 () Bool)

(declare-fun res!617219 () Bool)

(declare-fun e!513795 () Bool)

(assert (=> b!915463 (=> (not res!617219) (not e!513795))))

(declare-datatypes ((array!54498 0))(
  ( (array!54499 (arr!26194 (Array (_ BitVec 32) (_ BitVec 64))) (size!26653 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54498)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30633 0))(
  ( (V!30634 (val!9676 Int)) )
))
(declare-datatypes ((ValueCell!9144 0))(
  ( (ValueCellFull!9144 (v!12194 V!30633)) (EmptyCell!9144) )
))
(declare-datatypes ((array!54500 0))(
  ( (array!54501 (arr!26195 (Array (_ BitVec 32) ValueCell!9144)) (size!26654 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54500)

(assert (=> b!915463 (= res!617219 (and (= (size!26654 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26653 _keys!1487) (size!26654 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915464 () Bool)

(declare-fun e!513793 () Bool)

(declare-fun tp_is_empty!19251 () Bool)

(assert (=> b!915464 (= e!513793 tp_is_empty!19251)))

(declare-fun b!915465 () Bool)

(assert (=> b!915465 (= e!513795 false)))

(declare-fun lt!411676 () Bool)

(declare-datatypes ((List!18373 0))(
  ( (Nil!18370) (Cons!18369 (h!19515 (_ BitVec 64)) (t!25986 List!18373)) )
))
(declare-fun arrayNoDuplicates!0 (array!54498 (_ BitVec 32) List!18373) Bool)

(assert (=> b!915465 (= lt!411676 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18370))))

(declare-fun b!915466 () Bool)

(declare-fun e!513796 () Bool)

(declare-fun e!513792 () Bool)

(declare-fun mapRes!30633 () Bool)

(assert (=> b!915466 (= e!513796 (and e!513792 mapRes!30633))))

(declare-fun condMapEmpty!30633 () Bool)

(declare-fun mapDefault!30633 () ValueCell!9144)

(assert (=> b!915466 (= condMapEmpty!30633 (= (arr!26195 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9144)) mapDefault!30633)))))

(declare-fun mapIsEmpty!30633 () Bool)

(assert (=> mapIsEmpty!30633 mapRes!30633))

(declare-fun res!617221 () Bool)

(assert (=> start!78530 (=> (not res!617221) (not e!513795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78530 (= res!617221 (validMask!0 mask!1881))))

(assert (=> start!78530 e!513795))

(assert (=> start!78530 true))

(declare-fun array_inv!20446 (array!54500) Bool)

(assert (=> start!78530 (and (array_inv!20446 _values!1231) e!513796)))

(declare-fun array_inv!20447 (array!54498) Bool)

(assert (=> start!78530 (array_inv!20447 _keys!1487)))

(declare-fun b!915462 () Bool)

(declare-fun res!617220 () Bool)

(assert (=> b!915462 (=> (not res!617220) (not e!513795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54498 (_ BitVec 32)) Bool)

(assert (=> b!915462 (= res!617220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915467 () Bool)

(assert (=> b!915467 (= e!513792 tp_is_empty!19251)))

(declare-fun mapNonEmpty!30633 () Bool)

(declare-fun tp!58700 () Bool)

(assert (=> mapNonEmpty!30633 (= mapRes!30633 (and tp!58700 e!513793))))

(declare-fun mapKey!30633 () (_ BitVec 32))

(declare-fun mapRest!30633 () (Array (_ BitVec 32) ValueCell!9144))

(declare-fun mapValue!30633 () ValueCell!9144)

(assert (=> mapNonEmpty!30633 (= (arr!26195 _values!1231) (store mapRest!30633 mapKey!30633 mapValue!30633))))

(assert (= (and start!78530 res!617221) b!915463))

(assert (= (and b!915463 res!617219) b!915462))

(assert (= (and b!915462 res!617220) b!915465))

(assert (= (and b!915466 condMapEmpty!30633) mapIsEmpty!30633))

(assert (= (and b!915466 (not condMapEmpty!30633)) mapNonEmpty!30633))

(get-info :version)

(assert (= (and mapNonEmpty!30633 ((_ is ValueCellFull!9144) mapValue!30633)) b!915464))

(assert (= (and b!915466 ((_ is ValueCellFull!9144) mapDefault!30633)) b!915467))

(assert (= start!78530 b!915466))

(declare-fun m!849831 () Bool)

(assert (=> b!915465 m!849831))

(declare-fun m!849833 () Bool)

(assert (=> start!78530 m!849833))

(declare-fun m!849835 () Bool)

(assert (=> start!78530 m!849835))

(declare-fun m!849837 () Bool)

(assert (=> start!78530 m!849837))

(declare-fun m!849839 () Bool)

(assert (=> b!915462 m!849839))

(declare-fun m!849841 () Bool)

(assert (=> mapNonEmpty!30633 m!849841))

(check-sat (not b!915462) (not mapNonEmpty!30633) tp_is_empty!19251 (not b!915465) (not start!78530))
(check-sat)
