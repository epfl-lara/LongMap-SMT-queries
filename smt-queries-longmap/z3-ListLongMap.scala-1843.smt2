; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33382 () Bool)

(assert start!33382)

(declare-fun b!331430 () Bool)

(declare-fun res!182622 () Bool)

(declare-fun e!203379 () Bool)

(assert (=> b!331430 (=> (not res!182622) (not e!203379))))

(declare-datatypes ((array!16943 0))(
  ( (array!16944 (arr!8009 (Array (_ BitVec 32) (_ BitVec 64))) (size!8362 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16943)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16943 (_ BitVec 32)) Bool)

(assert (=> b!331430 (= res!182622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!182620 () Bool)

(assert (=> start!33382 (=> (not res!182620) (not e!203379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33382 (= res!182620 (validMask!0 mask!2385))))

(assert (=> start!33382 e!203379))

(assert (=> start!33382 true))

(declare-datatypes ((V!9883 0))(
  ( (V!9884 (val!3384 Int)) )
))
(declare-datatypes ((ValueCell!2996 0))(
  ( (ValueCellFull!2996 (v!5536 V!9883)) (EmptyCell!2996) )
))
(declare-datatypes ((array!16945 0))(
  ( (array!16946 (arr!8010 (Array (_ BitVec 32) ValueCell!2996)) (size!8363 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16945)

(declare-fun e!203380 () Bool)

(declare-fun array_inv!5978 (array!16945) Bool)

(assert (=> start!33382 (and (array_inv!5978 _values!1525) e!203380)))

(declare-fun array_inv!5979 (array!16943) Bool)

(assert (=> start!33382 (array_inv!5979 _keys!1895)))

(declare-fun b!331431 () Bool)

(declare-fun e!203377 () Bool)

(declare-fun tp_is_empty!6679 () Bool)

(assert (=> b!331431 (= e!203377 tp_is_empty!6679)))

(declare-fun b!331432 () Bool)

(declare-fun mapRes!11394 () Bool)

(assert (=> b!331432 (= e!203380 (and e!203377 mapRes!11394))))

(declare-fun condMapEmpty!11394 () Bool)

(declare-fun mapDefault!11394 () ValueCell!2996)

(assert (=> b!331432 (= condMapEmpty!11394 (= (arr!8010 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2996)) mapDefault!11394)))))

(declare-fun b!331433 () Bool)

(declare-fun res!182621 () Bool)

(assert (=> b!331433 (=> (not res!182621) (not e!203379))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331433 (= res!182621 (and (= (size!8363 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8362 _keys!1895) (size!8363 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331434 () Bool)

(assert (=> b!331434 (= e!203379 (and (bvsle #b00000000000000000000000000000000 (size!8362 _keys!1895)) (bvsge (size!8362 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!11394 () Bool)

(assert (=> mapIsEmpty!11394 mapRes!11394))

(declare-fun mapNonEmpty!11394 () Bool)

(declare-fun tp!23769 () Bool)

(declare-fun e!203381 () Bool)

(assert (=> mapNonEmpty!11394 (= mapRes!11394 (and tp!23769 e!203381))))

(declare-fun mapRest!11394 () (Array (_ BitVec 32) ValueCell!2996))

(declare-fun mapKey!11394 () (_ BitVec 32))

(declare-fun mapValue!11394 () ValueCell!2996)

(assert (=> mapNonEmpty!11394 (= (arr!8010 _values!1525) (store mapRest!11394 mapKey!11394 mapValue!11394))))

(declare-fun b!331435 () Bool)

(assert (=> b!331435 (= e!203381 tp_is_empty!6679)))

(assert (= (and start!33382 res!182620) b!331433))

(assert (= (and b!331433 res!182621) b!331430))

(assert (= (and b!331430 res!182622) b!331434))

(assert (= (and b!331432 condMapEmpty!11394) mapIsEmpty!11394))

(assert (= (and b!331432 (not condMapEmpty!11394)) mapNonEmpty!11394))

(get-info :version)

(assert (= (and mapNonEmpty!11394 ((_ is ValueCellFull!2996) mapValue!11394)) b!331435))

(assert (= (and b!331432 ((_ is ValueCellFull!2996) mapDefault!11394)) b!331431))

(assert (= start!33382 b!331432))

(declare-fun m!335753 () Bool)

(assert (=> b!331430 m!335753))

(declare-fun m!335755 () Bool)

(assert (=> start!33382 m!335755))

(declare-fun m!335757 () Bool)

(assert (=> start!33382 m!335757))

(declare-fun m!335759 () Bool)

(assert (=> start!33382 m!335759))

(declare-fun m!335761 () Bool)

(assert (=> mapNonEmpty!11394 m!335761))

(check-sat (not b!331430) (not start!33382) (not mapNonEmpty!11394) tp_is_empty!6679)
(check-sat)
(get-model)

(declare-fun bm!26174 () Bool)

(declare-fun call!26177 () Bool)

(assert (=> bm!26174 (= call!26177 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!331480 () Bool)

(declare-fun e!203420 () Bool)

(declare-fun e!203419 () Bool)

(assert (=> b!331480 (= e!203420 e!203419)))

(declare-fun lt!158681 () (_ BitVec 64))

(assert (=> b!331480 (= lt!158681 (select (arr!8009 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10330 0))(
  ( (Unit!10331) )
))
(declare-fun lt!158679 () Unit!10330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16943 (_ BitVec 64) (_ BitVec 32)) Unit!10330)

(assert (=> b!331480 (= lt!158679 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158681 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331480 (arrayContainsKey!0 _keys!1895 lt!158681 #b00000000000000000000000000000000)))

(declare-fun lt!158680 () Unit!10330)

(assert (=> b!331480 (= lt!158680 lt!158679)))

(declare-fun res!182646 () Bool)

(declare-datatypes ((SeekEntryResult!3123 0))(
  ( (MissingZero!3123 (index!14671 (_ BitVec 32))) (Found!3123 (index!14672 (_ BitVec 32))) (Intermediate!3123 (undefined!3935 Bool) (index!14673 (_ BitVec 32)) (x!33008 (_ BitVec 32))) (Undefined!3123) (MissingVacant!3123 (index!14674 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16943 (_ BitVec 32)) SeekEntryResult!3123)

(assert (=> b!331480 (= res!182646 (= (seekEntryOrOpen!0 (select (arr!8009 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3123 #b00000000000000000000000000000000)))))

(assert (=> b!331480 (=> (not res!182646) (not e!203419))))

(declare-fun b!331481 () Bool)

(assert (=> b!331481 (= e!203420 call!26177)))

(declare-fun d!70261 () Bool)

(declare-fun res!182645 () Bool)

(declare-fun e!203418 () Bool)

(assert (=> d!70261 (=> res!182645 e!203418)))

(assert (=> d!70261 (= res!182645 (bvsge #b00000000000000000000000000000000 (size!8362 _keys!1895)))))

(assert (=> d!70261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203418)))

(declare-fun b!331482 () Bool)

(assert (=> b!331482 (= e!203419 call!26177)))

(declare-fun b!331483 () Bool)

(assert (=> b!331483 (= e!203418 e!203420)))

(declare-fun c!52001 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331483 (= c!52001 (validKeyInArray!0 (select (arr!8009 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70261 (not res!182645)) b!331483))

(assert (= (and b!331483 c!52001) b!331480))

(assert (= (and b!331483 (not c!52001)) b!331481))

(assert (= (and b!331480 res!182646) b!331482))

(assert (= (or b!331482 b!331481) bm!26174))

(declare-fun m!335783 () Bool)

(assert (=> bm!26174 m!335783))

(declare-fun m!335785 () Bool)

(assert (=> b!331480 m!335785))

(declare-fun m!335787 () Bool)

(assert (=> b!331480 m!335787))

(declare-fun m!335789 () Bool)

(assert (=> b!331480 m!335789))

(assert (=> b!331480 m!335785))

(declare-fun m!335791 () Bool)

(assert (=> b!331480 m!335791))

(assert (=> b!331483 m!335785))

(assert (=> b!331483 m!335785))

(declare-fun m!335793 () Bool)

(assert (=> b!331483 m!335793))

(assert (=> b!331430 d!70261))

(declare-fun d!70263 () Bool)

(assert (=> d!70263 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33382 d!70263))

(declare-fun d!70265 () Bool)

(assert (=> d!70265 (= (array_inv!5978 _values!1525) (bvsge (size!8363 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33382 d!70265))

(declare-fun d!70267 () Bool)

(assert (=> d!70267 (= (array_inv!5979 _keys!1895) (bvsge (size!8362 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33382 d!70267))

(declare-fun mapIsEmpty!11403 () Bool)

(declare-fun mapRes!11403 () Bool)

(assert (=> mapIsEmpty!11403 mapRes!11403))

(declare-fun mapNonEmpty!11403 () Bool)

(declare-fun tp!23778 () Bool)

(declare-fun e!203426 () Bool)

(assert (=> mapNonEmpty!11403 (= mapRes!11403 (and tp!23778 e!203426))))

(declare-fun mapValue!11403 () ValueCell!2996)

(declare-fun mapKey!11403 () (_ BitVec 32))

(declare-fun mapRest!11403 () (Array (_ BitVec 32) ValueCell!2996))

(assert (=> mapNonEmpty!11403 (= mapRest!11394 (store mapRest!11403 mapKey!11403 mapValue!11403))))

(declare-fun b!331490 () Bool)

(assert (=> b!331490 (= e!203426 tp_is_empty!6679)))

(declare-fun b!331491 () Bool)

(declare-fun e!203425 () Bool)

(assert (=> b!331491 (= e!203425 tp_is_empty!6679)))

(declare-fun condMapEmpty!11403 () Bool)

(declare-fun mapDefault!11403 () ValueCell!2996)

(assert (=> mapNonEmpty!11394 (= condMapEmpty!11403 (= mapRest!11394 ((as const (Array (_ BitVec 32) ValueCell!2996)) mapDefault!11403)))))

(assert (=> mapNonEmpty!11394 (= tp!23769 (and e!203425 mapRes!11403))))

(assert (= (and mapNonEmpty!11394 condMapEmpty!11403) mapIsEmpty!11403))

(assert (= (and mapNonEmpty!11394 (not condMapEmpty!11403)) mapNonEmpty!11403))

(assert (= (and mapNonEmpty!11403 ((_ is ValueCellFull!2996) mapValue!11403)) b!331490))

(assert (= (and mapNonEmpty!11394 ((_ is ValueCellFull!2996) mapDefault!11403)) b!331491))

(declare-fun m!335795 () Bool)

(assert (=> mapNonEmpty!11403 m!335795))

(check-sat (not b!331480) (not bm!26174) (not mapNonEmpty!11403) (not b!331483) tp_is_empty!6679)
(check-sat)
