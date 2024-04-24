; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78708 () Bool)

(assert start!78708)

(declare-fun b!916455 () Bool)

(declare-fun e!514452 () Bool)

(declare-fun tp_is_empty!19261 () Bool)

(assert (=> b!916455 (= e!514452 tp_is_empty!19261)))

(declare-fun res!617609 () Bool)

(declare-fun e!514449 () Bool)

(assert (=> start!78708 (=> (not res!617609) (not e!514449))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78708 (= res!617609 (validMask!0 mask!1881))))

(assert (=> start!78708 e!514449))

(assert (=> start!78708 true))

(declare-datatypes ((V!30647 0))(
  ( (V!30648 (val!9681 Int)) )
))
(declare-datatypes ((ValueCell!9149 0))(
  ( (ValueCellFull!9149 (v!12196 V!30647)) (EmptyCell!9149) )
))
(declare-datatypes ((array!54569 0))(
  ( (array!54570 (arr!26225 (Array (_ BitVec 32) ValueCell!9149)) (size!26685 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54569)

(declare-fun e!514451 () Bool)

(declare-fun array_inv!20568 (array!54569) Bool)

(assert (=> start!78708 (and (array_inv!20568 _values!1231) e!514451)))

(declare-datatypes ((array!54571 0))(
  ( (array!54572 (arr!26226 (Array (_ BitVec 32) (_ BitVec 64))) (size!26686 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54571)

(declare-fun array_inv!20569 (array!54571) Bool)

(assert (=> start!78708 (array_inv!20569 _keys!1487)))

(declare-fun b!916456 () Bool)

(declare-fun e!514450 () Bool)

(assert (=> b!916456 (= e!514450 tp_is_empty!19261)))

(declare-fun mapNonEmpty!30648 () Bool)

(declare-fun mapRes!30648 () Bool)

(declare-fun tp!58716 () Bool)

(assert (=> mapNonEmpty!30648 (= mapRes!30648 (and tp!58716 e!514452))))

(declare-fun mapRest!30648 () (Array (_ BitVec 32) ValueCell!9149))

(declare-fun mapKey!30648 () (_ BitVec 32))

(declare-fun mapValue!30648 () ValueCell!9149)

(assert (=> mapNonEmpty!30648 (= (arr!26225 _values!1231) (store mapRest!30648 mapKey!30648 mapValue!30648))))

(declare-fun b!916457 () Bool)

(assert (=> b!916457 (= e!514449 false)))

(declare-fun lt!412052 () Bool)

(declare-datatypes ((List!18362 0))(
  ( (Nil!18359) (Cons!18358 (h!19510 (_ BitVec 64)) (t!25967 List!18362)) )
))
(declare-fun arrayNoDuplicates!0 (array!54571 (_ BitVec 32) List!18362) Bool)

(assert (=> b!916457 (= lt!412052 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18359))))

(declare-fun b!916458 () Bool)

(declare-fun res!617610 () Bool)

(assert (=> b!916458 (=> (not res!617610) (not e!514449))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916458 (= res!617610 (and (= (size!26685 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26686 _keys!1487) (size!26685 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916459 () Bool)

(declare-fun res!617608 () Bool)

(assert (=> b!916459 (=> (not res!617608) (not e!514449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54571 (_ BitVec 32)) Bool)

(assert (=> b!916459 (= res!617608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916460 () Bool)

(assert (=> b!916460 (= e!514451 (and e!514450 mapRes!30648))))

(declare-fun condMapEmpty!30648 () Bool)

(declare-fun mapDefault!30648 () ValueCell!9149)

(assert (=> b!916460 (= condMapEmpty!30648 (= (arr!26225 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9149)) mapDefault!30648)))))

(declare-fun mapIsEmpty!30648 () Bool)

(assert (=> mapIsEmpty!30648 mapRes!30648))

(assert (= (and start!78708 res!617609) b!916458))

(assert (= (and b!916458 res!617610) b!916459))

(assert (= (and b!916459 res!617608) b!916457))

(assert (= (and b!916460 condMapEmpty!30648) mapIsEmpty!30648))

(assert (= (and b!916460 (not condMapEmpty!30648)) mapNonEmpty!30648))

(get-info :version)

(assert (= (and mapNonEmpty!30648 ((_ is ValueCellFull!9149) mapValue!30648)) b!916455))

(assert (= (and b!916460 ((_ is ValueCellFull!9149) mapDefault!30648)) b!916456))

(assert (= start!78708 b!916460))

(declare-fun m!851185 () Bool)

(assert (=> start!78708 m!851185))

(declare-fun m!851187 () Bool)

(assert (=> start!78708 m!851187))

(declare-fun m!851189 () Bool)

(assert (=> start!78708 m!851189))

(declare-fun m!851191 () Bool)

(assert (=> mapNonEmpty!30648 m!851191))

(declare-fun m!851193 () Bool)

(assert (=> b!916457 m!851193))

(declare-fun m!851195 () Bool)

(assert (=> b!916459 m!851195))

(check-sat tp_is_empty!19261 (not start!78708) (not mapNonEmpty!30648) (not b!916459) (not b!916457))
(check-sat)
