; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33356 () Bool)

(assert start!33356)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun b!331308 () Bool)

(declare-datatypes ((array!16915 0))(
  ( (array!16916 (arr!7997 (Array (_ BitVec 32) (_ BitVec 64))) (size!8350 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16915)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun e!203268 () Bool)

(declare-datatypes ((V!9867 0))(
  ( (V!9868 (val!3378 Int)) )
))
(declare-datatypes ((ValueCell!2990 0))(
  ( (ValueCellFull!2990 (v!5530 V!9867)) (EmptyCell!2990) )
))
(declare-datatypes ((array!16917 0))(
  ( (array!16918 (arr!7998 (Array (_ BitVec 32) ValueCell!2990)) (size!8351 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16917)

(assert (=> b!331308 (= e!203268 (and (= (size!8351 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8350 _keys!1895) (size!8351 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011) (= (size!8350 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)) (bvsgt #b00000000000000000000000000000000 (size!8350 _keys!1895))))))

(declare-fun mapNonEmpty!11370 () Bool)

(declare-fun mapRes!11370 () Bool)

(declare-fun tp!23745 () Bool)

(declare-fun e!203269 () Bool)

(assert (=> mapNonEmpty!11370 (= mapRes!11370 (and tp!23745 e!203269))))

(declare-fun mapKey!11370 () (_ BitVec 32))

(declare-fun mapRest!11370 () (Array (_ BitVec 32) ValueCell!2990))

(declare-fun mapValue!11370 () ValueCell!2990)

(assert (=> mapNonEmpty!11370 (= (arr!7998 _values!1525) (store mapRest!11370 mapKey!11370 mapValue!11370))))

(declare-fun b!331309 () Bool)

(declare-fun e!203270 () Bool)

(declare-fun e!203266 () Bool)

(assert (=> b!331309 (= e!203270 (and e!203266 mapRes!11370))))

(declare-fun condMapEmpty!11370 () Bool)

(declare-fun mapDefault!11370 () ValueCell!2990)

(assert (=> b!331309 (= condMapEmpty!11370 (= (arr!7998 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2990)) mapDefault!11370)))))

(declare-fun b!331310 () Bool)

(declare-fun tp_is_empty!6667 () Bool)

(assert (=> b!331310 (= e!203266 tp_is_empty!6667)))

(declare-fun res!182574 () Bool)

(assert (=> start!33356 (=> (not res!182574) (not e!203268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33356 (= res!182574 (validMask!0 mask!2385))))

(assert (=> start!33356 e!203268))

(assert (=> start!33356 true))

(declare-fun array_inv!5966 (array!16917) Bool)

(assert (=> start!33356 (and (array_inv!5966 _values!1525) e!203270)))

(declare-fun array_inv!5967 (array!16915) Bool)

(assert (=> start!33356 (array_inv!5967 _keys!1895)))

(declare-fun mapIsEmpty!11370 () Bool)

(assert (=> mapIsEmpty!11370 mapRes!11370))

(declare-fun b!331311 () Bool)

(assert (=> b!331311 (= e!203269 tp_is_empty!6667)))

(assert (= (and start!33356 res!182574) b!331308))

(assert (= (and b!331309 condMapEmpty!11370) mapIsEmpty!11370))

(assert (= (and b!331309 (not condMapEmpty!11370)) mapNonEmpty!11370))

(get-info :version)

(assert (= (and mapNonEmpty!11370 ((_ is ValueCellFull!2990) mapValue!11370)) b!331311))

(assert (= (and b!331309 ((_ is ValueCellFull!2990) mapDefault!11370)) b!331310))

(assert (= start!33356 b!331309))

(declare-fun m!335683 () Bool)

(assert (=> mapNonEmpty!11370 m!335683))

(declare-fun m!335685 () Bool)

(assert (=> start!33356 m!335685))

(declare-fun m!335687 () Bool)

(assert (=> start!33356 m!335687))

(declare-fun m!335689 () Bool)

(assert (=> start!33356 m!335689))

(check-sat (not start!33356) (not mapNonEmpty!11370) tp_is_empty!6667)
(check-sat)
(get-model)

(declare-fun d!70243 () Bool)

(assert (=> d!70243 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33356 d!70243))

(declare-fun d!70245 () Bool)

(assert (=> d!70245 (= (array_inv!5966 _values!1525) (bvsge (size!8351 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33356 d!70245))

(declare-fun d!70247 () Bool)

(assert (=> d!70247 (= (array_inv!5967 _keys!1895) (bvsge (size!8350 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33356 d!70247))

(declare-fun mapNonEmpty!11379 () Bool)

(declare-fun mapRes!11379 () Bool)

(declare-fun tp!23754 () Bool)

(declare-fun e!203306 () Bool)

(assert (=> mapNonEmpty!11379 (= mapRes!11379 (and tp!23754 e!203306))))

(declare-fun mapKey!11379 () (_ BitVec 32))

(declare-fun mapValue!11379 () ValueCell!2990)

(declare-fun mapRest!11379 () (Array (_ BitVec 32) ValueCell!2990))

(assert (=> mapNonEmpty!11379 (= mapRest!11370 (store mapRest!11379 mapKey!11379 mapValue!11379))))

(declare-fun condMapEmpty!11379 () Bool)

(declare-fun mapDefault!11379 () ValueCell!2990)

(assert (=> mapNonEmpty!11370 (= condMapEmpty!11379 (= mapRest!11370 ((as const (Array (_ BitVec 32) ValueCell!2990)) mapDefault!11379)))))

(declare-fun e!203305 () Bool)

(assert (=> mapNonEmpty!11370 (= tp!23745 (and e!203305 mapRes!11379))))

(declare-fun b!331342 () Bool)

(assert (=> b!331342 (= e!203306 tp_is_empty!6667)))

(declare-fun b!331343 () Bool)

(assert (=> b!331343 (= e!203305 tp_is_empty!6667)))

(declare-fun mapIsEmpty!11379 () Bool)

(assert (=> mapIsEmpty!11379 mapRes!11379))

(assert (= (and mapNonEmpty!11370 condMapEmpty!11379) mapIsEmpty!11379))

(assert (= (and mapNonEmpty!11370 (not condMapEmpty!11379)) mapNonEmpty!11379))

(assert (= (and mapNonEmpty!11379 ((_ is ValueCellFull!2990) mapValue!11379)) b!331342))

(assert (= (and mapNonEmpty!11370 ((_ is ValueCellFull!2990) mapDefault!11379)) b!331343))

(declare-fun m!335707 () Bool)

(assert (=> mapNonEmpty!11379 m!335707))

(check-sat (not mapNonEmpty!11379) tp_is_empty!6667)
(check-sat)
