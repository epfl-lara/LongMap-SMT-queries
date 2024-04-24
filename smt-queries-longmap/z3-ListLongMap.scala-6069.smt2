; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78690 () Bool)

(assert start!78690)

(declare-fun b!916293 () Bool)

(declare-fun e!514317 () Bool)

(declare-fun tp_is_empty!19243 () Bool)

(assert (=> b!916293 (= e!514317 tp_is_empty!19243)))

(declare-fun res!617529 () Bool)

(declare-fun e!514316 () Bool)

(assert (=> start!78690 (=> (not res!617529) (not e!514316))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78690 (= res!617529 (validMask!0 mask!1881))))

(assert (=> start!78690 e!514316))

(assert (=> start!78690 true))

(declare-datatypes ((V!30623 0))(
  ( (V!30624 (val!9672 Int)) )
))
(declare-datatypes ((ValueCell!9140 0))(
  ( (ValueCellFull!9140 (v!12187 V!30623)) (EmptyCell!9140) )
))
(declare-datatypes ((array!54539 0))(
  ( (array!54540 (arr!26210 (Array (_ BitVec 32) ValueCell!9140)) (size!26670 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54539)

(declare-fun e!514318 () Bool)

(declare-fun array_inv!20560 (array!54539) Bool)

(assert (=> start!78690 (and (array_inv!20560 _values!1231) e!514318)))

(declare-datatypes ((array!54541 0))(
  ( (array!54542 (arr!26211 (Array (_ BitVec 32) (_ BitVec 64))) (size!26671 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54541)

(declare-fun array_inv!20561 (array!54541) Bool)

(assert (=> start!78690 (array_inv!20561 _keys!1487)))

(declare-fun mapIsEmpty!30621 () Bool)

(declare-fun mapRes!30621 () Bool)

(assert (=> mapIsEmpty!30621 mapRes!30621))

(declare-fun b!916294 () Bool)

(declare-fun res!617527 () Bool)

(assert (=> b!916294 (=> (not res!617527) (not e!514316))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916294 (= res!617527 (and (= (size!26670 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26671 _keys!1487) (size!26670 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916295 () Bool)

(declare-fun e!514314 () Bool)

(assert (=> b!916295 (= e!514314 tp_is_empty!19243)))

(declare-fun b!916296 () Bool)

(assert (=> b!916296 (= e!514316 false)))

(declare-fun lt!412025 () Bool)

(declare-datatypes ((List!18358 0))(
  ( (Nil!18355) (Cons!18354 (h!19506 (_ BitVec 64)) (t!25963 List!18358)) )
))
(declare-fun arrayNoDuplicates!0 (array!54541 (_ BitVec 32) List!18358) Bool)

(assert (=> b!916296 (= lt!412025 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18355))))

(declare-fun b!916297 () Bool)

(assert (=> b!916297 (= e!514318 (and e!514317 mapRes!30621))))

(declare-fun condMapEmpty!30621 () Bool)

(declare-fun mapDefault!30621 () ValueCell!9140)

(assert (=> b!916297 (= condMapEmpty!30621 (= (arr!26210 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9140)) mapDefault!30621)))))

(declare-fun mapNonEmpty!30621 () Bool)

(declare-fun tp!58689 () Bool)

(assert (=> mapNonEmpty!30621 (= mapRes!30621 (and tp!58689 e!514314))))

(declare-fun mapKey!30621 () (_ BitVec 32))

(declare-fun mapValue!30621 () ValueCell!9140)

(declare-fun mapRest!30621 () (Array (_ BitVec 32) ValueCell!9140))

(assert (=> mapNonEmpty!30621 (= (arr!26210 _values!1231) (store mapRest!30621 mapKey!30621 mapValue!30621))))

(declare-fun b!916298 () Bool)

(declare-fun res!617528 () Bool)

(assert (=> b!916298 (=> (not res!617528) (not e!514316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54541 (_ BitVec 32)) Bool)

(assert (=> b!916298 (= res!617528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78690 res!617529) b!916294))

(assert (= (and b!916294 res!617527) b!916298))

(assert (= (and b!916298 res!617528) b!916296))

(assert (= (and b!916297 condMapEmpty!30621) mapIsEmpty!30621))

(assert (= (and b!916297 (not condMapEmpty!30621)) mapNonEmpty!30621))

(get-info :version)

(assert (= (and mapNonEmpty!30621 ((_ is ValueCellFull!9140) mapValue!30621)) b!916295))

(assert (= (and b!916297 ((_ is ValueCellFull!9140) mapDefault!30621)) b!916293))

(assert (= start!78690 b!916297))

(declare-fun m!851077 () Bool)

(assert (=> start!78690 m!851077))

(declare-fun m!851079 () Bool)

(assert (=> start!78690 m!851079))

(declare-fun m!851081 () Bool)

(assert (=> start!78690 m!851081))

(declare-fun m!851083 () Bool)

(assert (=> b!916296 m!851083))

(declare-fun m!851085 () Bool)

(assert (=> mapNonEmpty!30621 m!851085))

(declare-fun m!851087 () Bool)

(assert (=> b!916298 m!851087))

(check-sat (not b!916298) (not mapNonEmpty!30621) tp_is_empty!19243 (not b!916296) (not start!78690))
(check-sat)
