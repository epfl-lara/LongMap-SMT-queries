; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78522 () Bool)

(assert start!78522)

(declare-fun b!915313 () Bool)

(declare-fun e!513720 () Bool)

(assert (=> b!915313 (= e!513720 false)))

(declare-fun lt!411455 () Bool)

(declare-datatypes ((array!54511 0))(
  ( (array!54512 (arr!26201 (Array (_ BitVec 32) (_ BitVec 64))) (size!26662 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54511)

(declare-datatypes ((List!18412 0))(
  ( (Nil!18409) (Cons!18408 (h!19554 (_ BitVec 64)) (t!26016 List!18412)) )
))
(declare-fun arrayNoDuplicates!0 (array!54511 (_ BitVec 32) List!18412) Bool)

(assert (=> b!915313 (= lt!411455 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18409))))

(declare-fun mapIsEmpty!30648 () Bool)

(declare-fun mapRes!30648 () Bool)

(assert (=> mapIsEmpty!30648 mapRes!30648))

(declare-fun b!915314 () Bool)

(declare-fun res!617156 () Bool)

(assert (=> b!915314 (=> (not res!617156) (not e!513720))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54511 (_ BitVec 32)) Bool)

(assert (=> b!915314 (= res!617156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915315 () Bool)

(declare-fun res!617155 () Bool)

(assert (=> b!915315 (=> (not res!617155) (not e!513720))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30647 0))(
  ( (V!30648 (val!9681 Int)) )
))
(declare-datatypes ((ValueCell!9149 0))(
  ( (ValueCellFull!9149 (v!12198 V!30647)) (EmptyCell!9149) )
))
(declare-datatypes ((array!54513 0))(
  ( (array!54514 (arr!26202 (Array (_ BitVec 32) ValueCell!9149)) (size!26663 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54513)

(assert (=> b!915315 (= res!617155 (and (= (size!26663 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26662 _keys!1487) (size!26663 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915316 () Bool)

(declare-fun e!513723 () Bool)

(declare-fun tp_is_empty!19261 () Bool)

(assert (=> b!915316 (= e!513723 tp_is_empty!19261)))

(declare-fun b!915317 () Bool)

(declare-fun e!513721 () Bool)

(assert (=> b!915317 (= e!513721 tp_is_empty!19261)))

(declare-fun res!617154 () Bool)

(assert (=> start!78522 (=> (not res!617154) (not e!513720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78522 (= res!617154 (validMask!0 mask!1881))))

(assert (=> start!78522 e!513720))

(assert (=> start!78522 true))

(declare-fun e!513722 () Bool)

(declare-fun array_inv!20532 (array!54513) Bool)

(assert (=> start!78522 (and (array_inv!20532 _values!1231) e!513722)))

(declare-fun array_inv!20533 (array!54511) Bool)

(assert (=> start!78522 (array_inv!20533 _keys!1487)))

(declare-fun mapNonEmpty!30648 () Bool)

(declare-fun tp!58716 () Bool)

(assert (=> mapNonEmpty!30648 (= mapRes!30648 (and tp!58716 e!513721))))

(declare-fun mapKey!30648 () (_ BitVec 32))

(declare-fun mapRest!30648 () (Array (_ BitVec 32) ValueCell!9149))

(declare-fun mapValue!30648 () ValueCell!9149)

(assert (=> mapNonEmpty!30648 (= (arr!26202 _values!1231) (store mapRest!30648 mapKey!30648 mapValue!30648))))

(declare-fun b!915318 () Bool)

(assert (=> b!915318 (= e!513722 (and e!513723 mapRes!30648))))

(declare-fun condMapEmpty!30648 () Bool)

(declare-fun mapDefault!30648 () ValueCell!9149)

(assert (=> b!915318 (= condMapEmpty!30648 (= (arr!26202 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9149)) mapDefault!30648)))))

(assert (= (and start!78522 res!617154) b!915315))

(assert (= (and b!915315 res!617155) b!915314))

(assert (= (and b!915314 res!617156) b!915313))

(assert (= (and b!915318 condMapEmpty!30648) mapIsEmpty!30648))

(assert (= (and b!915318 (not condMapEmpty!30648)) mapNonEmpty!30648))

(get-info :version)

(assert (= (and mapNonEmpty!30648 ((_ is ValueCellFull!9149) mapValue!30648)) b!915317))

(assert (= (and b!915318 ((_ is ValueCellFull!9149) mapDefault!30648)) b!915316))

(assert (= start!78522 b!915318))

(declare-fun m!849133 () Bool)

(assert (=> b!915313 m!849133))

(declare-fun m!849135 () Bool)

(assert (=> b!915314 m!849135))

(declare-fun m!849137 () Bool)

(assert (=> start!78522 m!849137))

(declare-fun m!849139 () Bool)

(assert (=> start!78522 m!849139))

(declare-fun m!849141 () Bool)

(assert (=> start!78522 m!849141))

(declare-fun m!849143 () Bool)

(assert (=> mapNonEmpty!30648 m!849143))

(check-sat (not mapNonEmpty!30648) tp_is_empty!19261 (not b!915314) (not start!78522) (not b!915313))
(check-sat)
