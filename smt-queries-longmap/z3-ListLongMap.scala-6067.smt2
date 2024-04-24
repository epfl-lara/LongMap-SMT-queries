; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78678 () Bool)

(assert start!78678)

(declare-fun b!916185 () Bool)

(declare-fun e!514224 () Bool)

(assert (=> b!916185 (= e!514224 false)))

(declare-fun lt!412007 () Bool)

(declare-datatypes ((array!54517 0))(
  ( (array!54518 (arr!26199 (Array (_ BitVec 32) (_ BitVec 64))) (size!26659 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54517)

(declare-datatypes ((List!18353 0))(
  ( (Nil!18350) (Cons!18349 (h!19501 (_ BitVec 64)) (t!25958 List!18353)) )
))
(declare-fun arrayNoDuplicates!0 (array!54517 (_ BitVec 32) List!18353) Bool)

(assert (=> b!916185 (= lt!412007 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18350))))

(declare-fun mapIsEmpty!30603 () Bool)

(declare-fun mapRes!30603 () Bool)

(assert (=> mapIsEmpty!30603 mapRes!30603))

(declare-fun b!916186 () Bool)

(declare-fun e!514227 () Bool)

(declare-fun e!514226 () Bool)

(assert (=> b!916186 (= e!514227 (and e!514226 mapRes!30603))))

(declare-fun condMapEmpty!30603 () Bool)

(declare-datatypes ((V!30607 0))(
  ( (V!30608 (val!9666 Int)) )
))
(declare-datatypes ((ValueCell!9134 0))(
  ( (ValueCellFull!9134 (v!12181 V!30607)) (EmptyCell!9134) )
))
(declare-datatypes ((array!54519 0))(
  ( (array!54520 (arr!26200 (Array (_ BitVec 32) ValueCell!9134)) (size!26660 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54519)

(declare-fun mapDefault!30603 () ValueCell!9134)

(assert (=> b!916186 (= condMapEmpty!30603 (= (arr!26200 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9134)) mapDefault!30603)))))

(declare-fun b!916187 () Bool)

(declare-fun e!514225 () Bool)

(declare-fun tp_is_empty!19231 () Bool)

(assert (=> b!916187 (= e!514225 tp_is_empty!19231)))

(declare-fun b!916188 () Bool)

(declare-fun res!617474 () Bool)

(assert (=> b!916188 (=> (not res!617474) (not e!514224))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916188 (= res!617474 (and (= (size!26660 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26659 _keys!1487) (size!26660 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916189 () Bool)

(assert (=> b!916189 (= e!514226 tp_is_empty!19231)))

(declare-fun mapNonEmpty!30603 () Bool)

(declare-fun tp!58671 () Bool)

(assert (=> mapNonEmpty!30603 (= mapRes!30603 (and tp!58671 e!514225))))

(declare-fun mapKey!30603 () (_ BitVec 32))

(declare-fun mapValue!30603 () ValueCell!9134)

(declare-fun mapRest!30603 () (Array (_ BitVec 32) ValueCell!9134))

(assert (=> mapNonEmpty!30603 (= (arr!26200 _values!1231) (store mapRest!30603 mapKey!30603 mapValue!30603))))

(declare-fun b!916190 () Bool)

(declare-fun res!617473 () Bool)

(assert (=> b!916190 (=> (not res!617473) (not e!514224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54517 (_ BitVec 32)) Bool)

(assert (=> b!916190 (= res!617473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617475 () Bool)

(assert (=> start!78678 (=> (not res!617475) (not e!514224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78678 (= res!617475 (validMask!0 mask!1881))))

(assert (=> start!78678 e!514224))

(assert (=> start!78678 true))

(declare-fun array_inv!20550 (array!54519) Bool)

(assert (=> start!78678 (and (array_inv!20550 _values!1231) e!514227)))

(declare-fun array_inv!20551 (array!54517) Bool)

(assert (=> start!78678 (array_inv!20551 _keys!1487)))

(assert (= (and start!78678 res!617475) b!916188))

(assert (= (and b!916188 res!617474) b!916190))

(assert (= (and b!916190 res!617473) b!916185))

(assert (= (and b!916186 condMapEmpty!30603) mapIsEmpty!30603))

(assert (= (and b!916186 (not condMapEmpty!30603)) mapNonEmpty!30603))

(get-info :version)

(assert (= (and mapNonEmpty!30603 ((_ is ValueCellFull!9134) mapValue!30603)) b!916187))

(assert (= (and b!916186 ((_ is ValueCellFull!9134) mapDefault!30603)) b!916189))

(assert (= start!78678 b!916186))

(declare-fun m!851005 () Bool)

(assert (=> b!916185 m!851005))

(declare-fun m!851007 () Bool)

(assert (=> mapNonEmpty!30603 m!851007))

(declare-fun m!851009 () Bool)

(assert (=> b!916190 m!851009))

(declare-fun m!851011 () Bool)

(assert (=> start!78678 m!851011))

(declare-fun m!851013 () Bool)

(assert (=> start!78678 m!851013))

(declare-fun m!851015 () Bool)

(assert (=> start!78678 m!851015))

(check-sat (not b!916185) (not mapNonEmpty!30603) (not b!916190) (not start!78678) tp_is_empty!19231)
(check-sat)
