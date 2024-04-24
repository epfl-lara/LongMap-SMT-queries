; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33356 () Bool)

(assert start!33356)

(declare-fun mapNonEmpty!11370 () Bool)

(declare-fun mapRes!11370 () Bool)

(declare-fun tp!23745 () Bool)

(declare-fun e!203408 () Bool)

(assert (=> mapNonEmpty!11370 (= mapRes!11370 (and tp!23745 e!203408))))

(declare-datatypes ((V!9867 0))(
  ( (V!9868 (val!3378 Int)) )
))
(declare-datatypes ((ValueCell!2990 0))(
  ( (ValueCellFull!2990 (v!5537 V!9867)) (EmptyCell!2990) )
))
(declare-fun mapRest!11370 () (Array (_ BitVec 32) ValueCell!2990))

(declare-fun mapValue!11370 () ValueCell!2990)

(declare-fun mapKey!11370 () (_ BitVec 32))

(declare-datatypes ((array!16926 0))(
  ( (array!16927 (arr!8002 (Array (_ BitVec 32) ValueCell!2990)) (size!8354 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16926)

(assert (=> mapNonEmpty!11370 (= (arr!8002 _values!1525) (store mapRest!11370 mapKey!11370 mapValue!11370))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun e!203409 () Bool)

(declare-datatypes ((array!16928 0))(
  ( (array!16929 (arr!8003 (Array (_ BitVec 32) (_ BitVec 64))) (size!8355 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16928)

(declare-fun b!331530 () Bool)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331530 (= e!203409 (and (= (size!8354 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8355 _keys!1895) (size!8354 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011) (= (size!8355 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)) (bvsgt #b00000000000000000000000000000000 (size!8355 _keys!1895))))))

(declare-fun b!331531 () Bool)

(declare-fun e!203411 () Bool)

(declare-fun tp_is_empty!6667 () Bool)

(assert (=> b!331531 (= e!203411 tp_is_empty!6667)))

(declare-fun res!182700 () Bool)

(assert (=> start!33356 (=> (not res!182700) (not e!203409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33356 (= res!182700 (validMask!0 mask!2385))))

(assert (=> start!33356 e!203409))

(assert (=> start!33356 true))

(declare-fun e!203410 () Bool)

(declare-fun array_inv!5952 (array!16926) Bool)

(assert (=> start!33356 (and (array_inv!5952 _values!1525) e!203410)))

(declare-fun array_inv!5953 (array!16928) Bool)

(assert (=> start!33356 (array_inv!5953 _keys!1895)))

(declare-fun b!331532 () Bool)

(assert (=> b!331532 (= e!203408 tp_is_empty!6667)))

(declare-fun b!331533 () Bool)

(assert (=> b!331533 (= e!203410 (and e!203411 mapRes!11370))))

(declare-fun condMapEmpty!11370 () Bool)

(declare-fun mapDefault!11370 () ValueCell!2990)

(assert (=> b!331533 (= condMapEmpty!11370 (= (arr!8002 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2990)) mapDefault!11370)))))

(declare-fun mapIsEmpty!11370 () Bool)

(assert (=> mapIsEmpty!11370 mapRes!11370))

(assert (= (and start!33356 res!182700) b!331530))

(assert (= (and b!331533 condMapEmpty!11370) mapIsEmpty!11370))

(assert (= (and b!331533 (not condMapEmpty!11370)) mapNonEmpty!11370))

(get-info :version)

(assert (= (and mapNonEmpty!11370 ((_ is ValueCellFull!2990) mapValue!11370)) b!331532))

(assert (= (and b!331533 ((_ is ValueCellFull!2990) mapDefault!11370)) b!331531))

(assert (= start!33356 b!331533))

(declare-fun m!336637 () Bool)

(assert (=> mapNonEmpty!11370 m!336637))

(declare-fun m!336639 () Bool)

(assert (=> start!33356 m!336639))

(declare-fun m!336641 () Bool)

(assert (=> start!33356 m!336641))

(declare-fun m!336643 () Bool)

(assert (=> start!33356 m!336643))

(check-sat (not start!33356) (not mapNonEmpty!11370) tp_is_empty!6667)
(check-sat)
(get-model)

(declare-fun d!70477 () Bool)

(assert (=> d!70477 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33356 d!70477))

(declare-fun d!70479 () Bool)

(assert (=> d!70479 (= (array_inv!5952 _values!1525) (bvsge (size!8354 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33356 d!70479))

(declare-fun d!70481 () Bool)

(assert (=> d!70481 (= (array_inv!5953 _keys!1895) (bvsge (size!8355 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33356 d!70481))

(declare-fun b!331564 () Bool)

(declare-fun e!203448 () Bool)

(assert (=> b!331564 (= e!203448 tp_is_empty!6667)))

(declare-fun mapNonEmpty!11379 () Bool)

(declare-fun mapRes!11379 () Bool)

(declare-fun tp!23754 () Bool)

(assert (=> mapNonEmpty!11379 (= mapRes!11379 (and tp!23754 e!203448))))

(declare-fun mapRest!11379 () (Array (_ BitVec 32) ValueCell!2990))

(declare-fun mapKey!11379 () (_ BitVec 32))

(declare-fun mapValue!11379 () ValueCell!2990)

(assert (=> mapNonEmpty!11379 (= mapRest!11370 (store mapRest!11379 mapKey!11379 mapValue!11379))))

(declare-fun condMapEmpty!11379 () Bool)

(declare-fun mapDefault!11379 () ValueCell!2990)

(assert (=> mapNonEmpty!11370 (= condMapEmpty!11379 (= mapRest!11370 ((as const (Array (_ BitVec 32) ValueCell!2990)) mapDefault!11379)))))

(declare-fun e!203447 () Bool)

(assert (=> mapNonEmpty!11370 (= tp!23745 (and e!203447 mapRes!11379))))

(declare-fun mapIsEmpty!11379 () Bool)

(assert (=> mapIsEmpty!11379 mapRes!11379))

(declare-fun b!331565 () Bool)

(assert (=> b!331565 (= e!203447 tp_is_empty!6667)))

(assert (= (and mapNonEmpty!11370 condMapEmpty!11379) mapIsEmpty!11379))

(assert (= (and mapNonEmpty!11370 (not condMapEmpty!11379)) mapNonEmpty!11379))

(assert (= (and mapNonEmpty!11379 ((_ is ValueCellFull!2990) mapValue!11379)) b!331564))

(assert (= (and mapNonEmpty!11370 ((_ is ValueCellFull!2990) mapDefault!11379)) b!331565))

(declare-fun m!336661 () Bool)

(assert (=> mapNonEmpty!11379 m!336661))

(check-sat (not mapNonEmpty!11379) tp_is_empty!6667)
(check-sat)
