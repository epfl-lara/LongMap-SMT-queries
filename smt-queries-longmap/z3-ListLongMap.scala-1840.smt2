; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33350 () Bool)

(assert start!33350)

(declare-fun b!331494 () Bool)

(declare-fun e!203366 () Bool)

(declare-fun tp_is_empty!6661 () Bool)

(assert (=> b!331494 (= e!203366 tp_is_empty!6661)))

(declare-fun mapIsEmpty!11361 () Bool)

(declare-fun mapRes!11361 () Bool)

(assert (=> mapIsEmpty!11361 mapRes!11361))

(declare-fun b!331495 () Bool)

(declare-fun e!203363 () Bool)

(assert (=> b!331495 (= e!203363 (and e!203366 mapRes!11361))))

(declare-fun condMapEmpty!11361 () Bool)

(declare-datatypes ((V!9859 0))(
  ( (V!9860 (val!3375 Int)) )
))
(declare-datatypes ((ValueCell!2987 0))(
  ( (ValueCellFull!2987 (v!5534 V!9859)) (EmptyCell!2987) )
))
(declare-datatypes ((array!16914 0))(
  ( (array!16915 (arr!7996 (Array (_ BitVec 32) ValueCell!2987)) (size!8348 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16914)

(declare-fun mapDefault!11361 () ValueCell!2987)

(assert (=> b!331495 (= condMapEmpty!11361 (= (arr!7996 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2987)) mapDefault!11361)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun e!203365 () Bool)

(declare-fun b!331496 () Bool)

(declare-datatypes ((array!16916 0))(
  ( (array!16917 (arr!7997 (Array (_ BitVec 32) (_ BitVec 64))) (size!8349 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16916)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331496 (= e!203365 (and (= (size!8348 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8349 _keys!1895) (size!8348 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011) (not (= (size!8349 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun res!182691 () Bool)

(assert (=> start!33350 (=> (not res!182691) (not e!203365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33350 (= res!182691 (validMask!0 mask!2385))))

(assert (=> start!33350 e!203365))

(assert (=> start!33350 true))

(declare-fun array_inv!5946 (array!16914) Bool)

(assert (=> start!33350 (and (array_inv!5946 _values!1525) e!203363)))

(declare-fun array_inv!5947 (array!16916) Bool)

(assert (=> start!33350 (array_inv!5947 _keys!1895)))

(declare-fun b!331497 () Bool)

(declare-fun e!203364 () Bool)

(assert (=> b!331497 (= e!203364 tp_is_empty!6661)))

(declare-fun mapNonEmpty!11361 () Bool)

(declare-fun tp!23736 () Bool)

(assert (=> mapNonEmpty!11361 (= mapRes!11361 (and tp!23736 e!203364))))

(declare-fun mapRest!11361 () (Array (_ BitVec 32) ValueCell!2987))

(declare-fun mapKey!11361 () (_ BitVec 32))

(declare-fun mapValue!11361 () ValueCell!2987)

(assert (=> mapNonEmpty!11361 (= (arr!7996 _values!1525) (store mapRest!11361 mapKey!11361 mapValue!11361))))

(assert (= (and start!33350 res!182691) b!331496))

(assert (= (and b!331495 condMapEmpty!11361) mapIsEmpty!11361))

(assert (= (and b!331495 (not condMapEmpty!11361)) mapNonEmpty!11361))

(get-info :version)

(assert (= (and mapNonEmpty!11361 ((_ is ValueCellFull!2987) mapValue!11361)) b!331497))

(assert (= (and b!331495 ((_ is ValueCellFull!2987) mapDefault!11361)) b!331494))

(assert (= start!33350 b!331495))

(declare-fun m!336613 () Bool)

(assert (=> start!33350 m!336613))

(declare-fun m!336615 () Bool)

(assert (=> start!33350 m!336615))

(declare-fun m!336617 () Bool)

(assert (=> start!33350 m!336617))

(declare-fun m!336619 () Bool)

(assert (=> mapNonEmpty!11361 m!336619))

(check-sat (not start!33350) (not mapNonEmpty!11361) tp_is_empty!6661)
(check-sat)
