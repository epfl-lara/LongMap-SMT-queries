; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33366 () Bool)

(assert start!33366)

(declare-fun mapNonEmpty!11364 () Bool)

(declare-fun mapRes!11364 () Bool)

(declare-fun tp!23739 () Bool)

(declare-fun e!203414 () Bool)

(assert (=> mapNonEmpty!11364 (= mapRes!11364 (and tp!23739 e!203414))))

(declare-datatypes ((V!9861 0))(
  ( (V!9862 (val!3376 Int)) )
))
(declare-datatypes ((ValueCell!2988 0))(
  ( (ValueCellFull!2988 (v!5534 V!9861)) (EmptyCell!2988) )
))
(declare-fun mapValue!11364 () ValueCell!2988)

(declare-datatypes ((array!16917 0))(
  ( (array!16918 (arr!7998 (Array (_ BitVec 32) ValueCell!2988)) (size!8350 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16917)

(declare-fun mapRest!11364 () (Array (_ BitVec 32) ValueCell!2988))

(declare-fun mapKey!11364 () (_ BitVec 32))

(assert (=> mapNonEmpty!11364 (= (arr!7998 _values!1525) (store mapRest!11364 mapKey!11364 mapValue!11364))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun e!203416 () Bool)

(declare-fun b!331559 () Bool)

(declare-datatypes ((array!16919 0))(
  ( (array!16920 (arr!7999 (Array (_ BitVec 32) (_ BitVec 64))) (size!8351 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16919)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331559 (= e!203416 (and (= (size!8350 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8351 _keys!1895) (size!8350 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011) (not (= (size!8351 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun b!331560 () Bool)

(declare-fun tp_is_empty!6663 () Bool)

(assert (=> b!331560 (= e!203414 tp_is_empty!6663)))

(declare-fun b!331561 () Bool)

(declare-fun e!203412 () Bool)

(declare-fun e!203415 () Bool)

(assert (=> b!331561 (= e!203412 (and e!203415 mapRes!11364))))

(declare-fun condMapEmpty!11364 () Bool)

(declare-fun mapDefault!11364 () ValueCell!2988)

(assert (=> b!331561 (= condMapEmpty!11364 (= (arr!7998 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2988)) mapDefault!11364)))))

(declare-fun mapIsEmpty!11364 () Bool)

(assert (=> mapIsEmpty!11364 mapRes!11364))

(declare-fun b!331562 () Bool)

(assert (=> b!331562 (= e!203415 tp_is_empty!6663)))

(declare-fun res!182697 () Bool)

(assert (=> start!33366 (=> (not res!182697) (not e!203416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33366 (= res!182697 (validMask!0 mask!2385))))

(assert (=> start!33366 e!203416))

(assert (=> start!33366 true))

(declare-fun array_inv!5960 (array!16917) Bool)

(assert (=> start!33366 (and (array_inv!5960 _values!1525) e!203412)))

(declare-fun array_inv!5961 (array!16919) Bool)

(assert (=> start!33366 (array_inv!5961 _keys!1895)))

(assert (= (and start!33366 res!182697) b!331559))

(assert (= (and b!331561 condMapEmpty!11364) mapIsEmpty!11364))

(assert (= (and b!331561 (not condMapEmpty!11364)) mapNonEmpty!11364))

(get-info :version)

(assert (= (and mapNonEmpty!11364 ((_ is ValueCellFull!2988) mapValue!11364)) b!331560))

(assert (= (and b!331561 ((_ is ValueCellFull!2988) mapDefault!11364)) b!331562))

(assert (= start!33366 b!331561))

(declare-fun m!336397 () Bool)

(assert (=> mapNonEmpty!11364 m!336397))

(declare-fun m!336399 () Bool)

(assert (=> start!33366 m!336399))

(declare-fun m!336401 () Bool)

(assert (=> start!33366 m!336401))

(declare-fun m!336403 () Bool)

(assert (=> start!33366 m!336403))

(check-sat (not start!33366) (not mapNonEmpty!11364) tp_is_empty!6663)
(check-sat)
