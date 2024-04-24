; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33382 () Bool)

(assert start!33382)

(declare-fun b!331652 () Bool)

(declare-fun e!203519 () Bool)

(declare-fun tp_is_empty!6679 () Bool)

(assert (=> b!331652 (= e!203519 tp_is_empty!6679)))

(declare-fun b!331653 () Bool)

(declare-fun e!203521 () Bool)

(assert (=> b!331653 (= e!203521 tp_is_empty!6679)))

(declare-fun mapIsEmpty!11394 () Bool)

(declare-fun mapRes!11394 () Bool)

(assert (=> mapIsEmpty!11394 mapRes!11394))

(declare-fun b!331654 () Bool)

(declare-fun res!182746 () Bool)

(declare-fun e!203523 () Bool)

(assert (=> b!331654 (=> (not res!182746) (not e!203523))))

(declare-datatypes ((array!16954 0))(
  ( (array!16955 (arr!8014 (Array (_ BitVec 32) (_ BitVec 64))) (size!8366 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16954)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16954 (_ BitVec 32)) Bool)

(assert (=> b!331654 (= res!182746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11394 () Bool)

(declare-fun tp!23769 () Bool)

(assert (=> mapNonEmpty!11394 (= mapRes!11394 (and tp!23769 e!203519))))

(declare-datatypes ((V!9883 0))(
  ( (V!9884 (val!3384 Int)) )
))
(declare-datatypes ((ValueCell!2996 0))(
  ( (ValueCellFull!2996 (v!5543 V!9883)) (EmptyCell!2996) )
))
(declare-fun mapValue!11394 () ValueCell!2996)

(declare-fun mapKey!11394 () (_ BitVec 32))

(declare-fun mapRest!11394 () (Array (_ BitVec 32) ValueCell!2996))

(declare-datatypes ((array!16956 0))(
  ( (array!16957 (arr!8015 (Array (_ BitVec 32) ValueCell!2996)) (size!8367 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16956)

(assert (=> mapNonEmpty!11394 (= (arr!8015 _values!1525) (store mapRest!11394 mapKey!11394 mapValue!11394))))

(declare-fun b!331655 () Bool)

(assert (=> b!331655 (= e!203523 (and (bvsle #b00000000000000000000000000000000 (size!8366 _keys!1895)) (bvsge (size!8366 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!331656 () Bool)

(declare-fun res!182748 () Bool)

(assert (=> b!331656 (=> (not res!182748) (not e!203523))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331656 (= res!182748 (and (= (size!8367 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8366 _keys!1895) (size!8367 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331657 () Bool)

(declare-fun e!203522 () Bool)

(assert (=> b!331657 (= e!203522 (and e!203521 mapRes!11394))))

(declare-fun condMapEmpty!11394 () Bool)

(declare-fun mapDefault!11394 () ValueCell!2996)

(assert (=> b!331657 (= condMapEmpty!11394 (= (arr!8015 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2996)) mapDefault!11394)))))

(declare-fun res!182747 () Bool)

(assert (=> start!33382 (=> (not res!182747) (not e!203523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33382 (= res!182747 (validMask!0 mask!2385))))

(assert (=> start!33382 e!203523))

(assert (=> start!33382 true))

(declare-fun array_inv!5962 (array!16956) Bool)

(assert (=> start!33382 (and (array_inv!5962 _values!1525) e!203522)))

(declare-fun array_inv!5963 (array!16954) Bool)

(assert (=> start!33382 (array_inv!5963 _keys!1895)))

(assert (= (and start!33382 res!182747) b!331656))

(assert (= (and b!331656 res!182748) b!331654))

(assert (= (and b!331654 res!182746) b!331655))

(assert (= (and b!331657 condMapEmpty!11394) mapIsEmpty!11394))

(assert (= (and b!331657 (not condMapEmpty!11394)) mapNonEmpty!11394))

(get-info :version)

(assert (= (and mapNonEmpty!11394 ((_ is ValueCellFull!2996) mapValue!11394)) b!331652))

(assert (= (and b!331657 ((_ is ValueCellFull!2996) mapDefault!11394)) b!331653))

(assert (= start!33382 b!331657))

(declare-fun m!336707 () Bool)

(assert (=> b!331654 m!336707))

(declare-fun m!336709 () Bool)

(assert (=> mapNonEmpty!11394 m!336709))

(declare-fun m!336711 () Bool)

(assert (=> start!33382 m!336711))

(declare-fun m!336713 () Bool)

(assert (=> start!33382 m!336713))

(declare-fun m!336715 () Bool)

(assert (=> start!33382 m!336715))

(check-sat (not b!331654) (not start!33382) (not mapNonEmpty!11394) tp_is_empty!6679)
(check-sat)
(get-model)

(declare-fun b!331702 () Bool)

(declare-fun e!203560 () Bool)

(declare-fun call!26189 () Bool)

(assert (=> b!331702 (= e!203560 call!26189)))

(declare-fun b!331703 () Bool)

(declare-fun e!203562 () Bool)

(assert (=> b!331703 (= e!203562 call!26189)))

(declare-fun d!70495 () Bool)

(declare-fun res!182771 () Bool)

(declare-fun e!203561 () Bool)

(assert (=> d!70495 (=> res!182771 e!203561)))

(assert (=> d!70495 (= res!182771 (bvsge #b00000000000000000000000000000000 (size!8366 _keys!1895)))))

(assert (=> d!70495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203561)))

(declare-fun bm!26186 () Bool)

(assert (=> bm!26186 (= call!26189 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!331704 () Bool)

(assert (=> b!331704 (= e!203561 e!203562)))

(declare-fun c!52049 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331704 (= c!52049 (validKeyInArray!0 (select (arr!8014 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!331705 () Bool)

(assert (=> b!331705 (= e!203562 e!203560)))

(declare-fun lt!158932 () (_ BitVec 64))

(assert (=> b!331705 (= lt!158932 (select (arr!8014 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10329 0))(
  ( (Unit!10330) )
))
(declare-fun lt!158933 () Unit!10329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16954 (_ BitVec 64) (_ BitVec 32)) Unit!10329)

(assert (=> b!331705 (= lt!158933 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158932 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331705 (arrayContainsKey!0 _keys!1895 lt!158932 #b00000000000000000000000000000000)))

(declare-fun lt!158934 () Unit!10329)

(assert (=> b!331705 (= lt!158934 lt!158933)))

(declare-fun res!182772 () Bool)

(declare-datatypes ((SeekEntryResult!3093 0))(
  ( (MissingZero!3093 (index!14551 (_ BitVec 32))) (Found!3093 (index!14552 (_ BitVec 32))) (Intermediate!3093 (undefined!3905 Bool) (index!14553 (_ BitVec 32)) (x!32980 (_ BitVec 32))) (Undefined!3093) (MissingVacant!3093 (index!14554 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16954 (_ BitVec 32)) SeekEntryResult!3093)

(assert (=> b!331705 (= res!182772 (= (seekEntryOrOpen!0 (select (arr!8014 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3093 #b00000000000000000000000000000000)))))

(assert (=> b!331705 (=> (not res!182772) (not e!203560))))

(assert (= (and d!70495 (not res!182771)) b!331704))

(assert (= (and b!331704 c!52049) b!331705))

(assert (= (and b!331704 (not c!52049)) b!331703))

(assert (= (and b!331705 res!182772) b!331702))

(assert (= (or b!331702 b!331703) bm!26186))

(declare-fun m!336737 () Bool)

(assert (=> bm!26186 m!336737))

(declare-fun m!336739 () Bool)

(assert (=> b!331704 m!336739))

(assert (=> b!331704 m!336739))

(declare-fun m!336741 () Bool)

(assert (=> b!331704 m!336741))

(assert (=> b!331705 m!336739))

(declare-fun m!336743 () Bool)

(assert (=> b!331705 m!336743))

(declare-fun m!336745 () Bool)

(assert (=> b!331705 m!336745))

(assert (=> b!331705 m!336739))

(declare-fun m!336747 () Bool)

(assert (=> b!331705 m!336747))

(assert (=> b!331654 d!70495))

(declare-fun d!70497 () Bool)

(assert (=> d!70497 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33382 d!70497))

(declare-fun d!70499 () Bool)

(assert (=> d!70499 (= (array_inv!5962 _values!1525) (bvsge (size!8367 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33382 d!70499))

(declare-fun d!70501 () Bool)

(assert (=> d!70501 (= (array_inv!5963 _keys!1895) (bvsge (size!8366 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33382 d!70501))

(declare-fun mapIsEmpty!11403 () Bool)

(declare-fun mapRes!11403 () Bool)

(assert (=> mapIsEmpty!11403 mapRes!11403))

(declare-fun b!331713 () Bool)

(declare-fun e!203567 () Bool)

(assert (=> b!331713 (= e!203567 tp_is_empty!6679)))

(declare-fun b!331712 () Bool)

(declare-fun e!203568 () Bool)

(assert (=> b!331712 (= e!203568 tp_is_empty!6679)))

(declare-fun condMapEmpty!11403 () Bool)

(declare-fun mapDefault!11403 () ValueCell!2996)

(assert (=> mapNonEmpty!11394 (= condMapEmpty!11403 (= mapRest!11394 ((as const (Array (_ BitVec 32) ValueCell!2996)) mapDefault!11403)))))

(assert (=> mapNonEmpty!11394 (= tp!23769 (and e!203567 mapRes!11403))))

(declare-fun mapNonEmpty!11403 () Bool)

(declare-fun tp!23778 () Bool)

(assert (=> mapNonEmpty!11403 (= mapRes!11403 (and tp!23778 e!203568))))

(declare-fun mapValue!11403 () ValueCell!2996)

(declare-fun mapRest!11403 () (Array (_ BitVec 32) ValueCell!2996))

(declare-fun mapKey!11403 () (_ BitVec 32))

(assert (=> mapNonEmpty!11403 (= mapRest!11394 (store mapRest!11403 mapKey!11403 mapValue!11403))))

(assert (= (and mapNonEmpty!11394 condMapEmpty!11403) mapIsEmpty!11403))

(assert (= (and mapNonEmpty!11394 (not condMapEmpty!11403)) mapNonEmpty!11403))

(assert (= (and mapNonEmpty!11403 ((_ is ValueCellFull!2996) mapValue!11403)) b!331712))

(assert (= (and mapNonEmpty!11394 ((_ is ValueCellFull!2996) mapDefault!11403)) b!331713))

(declare-fun m!336749 () Bool)

(assert (=> mapNonEmpty!11403 m!336749))

(check-sat (not b!331704) (not b!331705) (not mapNonEmpty!11403) tp_is_empty!6679 (not bm!26186))
(check-sat)
