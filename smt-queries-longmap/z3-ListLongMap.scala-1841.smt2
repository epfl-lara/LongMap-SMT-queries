; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33372 () Bool)

(assert start!33372)

(declare-fun mapNonEmpty!11373 () Bool)

(declare-fun mapRes!11373 () Bool)

(declare-fun tp!23748 () Bool)

(declare-fun e!203461 () Bool)

(assert (=> mapNonEmpty!11373 (= mapRes!11373 (and tp!23748 e!203461))))

(declare-fun mapKey!11373 () (_ BitVec 32))

(declare-datatypes ((V!9869 0))(
  ( (V!9870 (val!3379 Int)) )
))
(declare-datatypes ((ValueCell!2991 0))(
  ( (ValueCellFull!2991 (v!5537 V!9869)) (EmptyCell!2991) )
))
(declare-fun mapRest!11373 () (Array (_ BitVec 32) ValueCell!2991))

(declare-datatypes ((array!16929 0))(
  ( (array!16930 (arr!8004 (Array (_ BitVec 32) ValueCell!2991)) (size!8356 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16929)

(declare-fun mapValue!11373 () ValueCell!2991)

(assert (=> mapNonEmpty!11373 (= (arr!8004 _values!1525) (store mapRest!11373 mapKey!11373 mapValue!11373))))

(declare-fun b!331596 () Bool)

(declare-fun e!203459 () Bool)

(declare-fun tp_is_empty!6669 () Bool)

(assert (=> b!331596 (= e!203459 tp_is_empty!6669)))

(declare-fun mapIsEmpty!11373 () Bool)

(assert (=> mapIsEmpty!11373 mapRes!11373))

(declare-fun res!182706 () Bool)

(declare-fun e!203460 () Bool)

(assert (=> start!33372 (=> (not res!182706) (not e!203460))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33372 (= res!182706 (validMask!0 mask!2385))))

(assert (=> start!33372 e!203460))

(assert (=> start!33372 true))

(declare-fun e!203457 () Bool)

(declare-fun array_inv!5962 (array!16929) Bool)

(assert (=> start!33372 (and (array_inv!5962 _values!1525) e!203457)))

(declare-datatypes ((array!16931 0))(
  ( (array!16932 (arr!8005 (Array (_ BitVec 32) (_ BitVec 64))) (size!8357 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16931)

(declare-fun array_inv!5963 (array!16931) Bool)

(assert (=> start!33372 (array_inv!5963 _keys!1895)))

(declare-fun b!331595 () Bool)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331595 (= e!203460 (and (= (size!8356 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8357 _keys!1895) (size!8356 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011) (= (size!8357 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)) (bvsgt #b00000000000000000000000000000000 (size!8357 _keys!1895))))))

(declare-fun b!331597 () Bool)

(assert (=> b!331597 (= e!203457 (and e!203459 mapRes!11373))))

(declare-fun condMapEmpty!11373 () Bool)

(declare-fun mapDefault!11373 () ValueCell!2991)

(assert (=> b!331597 (= condMapEmpty!11373 (= (arr!8004 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2991)) mapDefault!11373)))))

(declare-fun b!331598 () Bool)

(assert (=> b!331598 (= e!203461 tp_is_empty!6669)))

(assert (= (and start!33372 res!182706) b!331595))

(assert (= (and b!331597 condMapEmpty!11373) mapIsEmpty!11373))

(assert (= (and b!331597 (not condMapEmpty!11373)) mapNonEmpty!11373))

(get-info :version)

(assert (= (and mapNonEmpty!11373 ((_ is ValueCellFull!2991) mapValue!11373)) b!331598))

(assert (= (and b!331597 ((_ is ValueCellFull!2991) mapDefault!11373)) b!331596))

(assert (= start!33372 b!331597))

(declare-fun m!336421 () Bool)

(assert (=> mapNonEmpty!11373 m!336421))

(declare-fun m!336423 () Bool)

(assert (=> start!33372 m!336423))

(declare-fun m!336425 () Bool)

(assert (=> start!33372 m!336425))

(declare-fun m!336427 () Bool)

(assert (=> start!33372 m!336427))

(check-sat (not start!33372) (not mapNonEmpty!11373) tp_is_empty!6669)
(check-sat)
(get-model)

(declare-fun d!70449 () Bool)

(assert (=> d!70449 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33372 d!70449))

(declare-fun d!70451 () Bool)

(assert (=> d!70451 (= (array_inv!5962 _values!1525) (bvsge (size!8356 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33372 d!70451))

(declare-fun d!70453 () Bool)

(assert (=> d!70453 (= (array_inv!5963 _keys!1895) (bvsge (size!8357 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33372 d!70453))

(declare-fun mapIsEmpty!11379 () Bool)

(declare-fun mapRes!11379 () Bool)

(assert (=> mapIsEmpty!11379 mapRes!11379))

(declare-fun mapNonEmpty!11379 () Bool)

(declare-fun tp!23754 () Bool)

(declare-fun e!203482 () Bool)

(assert (=> mapNonEmpty!11379 (= mapRes!11379 (and tp!23754 e!203482))))

(declare-fun mapKey!11379 () (_ BitVec 32))

(declare-fun mapValue!11379 () ValueCell!2991)

(declare-fun mapRest!11379 () (Array (_ BitVec 32) ValueCell!2991))

(assert (=> mapNonEmpty!11379 (= mapRest!11373 (store mapRest!11379 mapKey!11379 mapValue!11379))))

(declare-fun b!331617 () Bool)

(assert (=> b!331617 (= e!203482 tp_is_empty!6669)))

(declare-fun b!331618 () Bool)

(declare-fun e!203481 () Bool)

(assert (=> b!331618 (= e!203481 tp_is_empty!6669)))

(declare-fun condMapEmpty!11379 () Bool)

(declare-fun mapDefault!11379 () ValueCell!2991)

(assert (=> mapNonEmpty!11373 (= condMapEmpty!11379 (= mapRest!11373 ((as const (Array (_ BitVec 32) ValueCell!2991)) mapDefault!11379)))))

(assert (=> mapNonEmpty!11373 (= tp!23748 (and e!203481 mapRes!11379))))

(assert (= (and mapNonEmpty!11373 condMapEmpty!11379) mapIsEmpty!11379))

(assert (= (and mapNonEmpty!11373 (not condMapEmpty!11379)) mapNonEmpty!11379))

(assert (= (and mapNonEmpty!11379 ((_ is ValueCellFull!2991) mapValue!11379)) b!331617))

(assert (= (and mapNonEmpty!11373 ((_ is ValueCellFull!2991) mapDefault!11379)) b!331618))

(declare-fun m!336437 () Bool)

(assert (=> mapNonEmpty!11379 m!336437))

(check-sat (not mapNonEmpty!11379) tp_is_empty!6669)
(check-sat)
