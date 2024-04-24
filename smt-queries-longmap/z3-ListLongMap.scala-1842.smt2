; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33368 () Bool)

(assert start!33368)

(declare-fun res!182714 () Bool)

(declare-fun e!203459 () Bool)

(assert (=> start!33368 (=> (not res!182714) (not e!203459))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33368 (= res!182714 (validMask!0 mask!2385))))

(assert (=> start!33368 e!203459))

(assert (=> start!33368 true))

(declare-datatypes ((V!9875 0))(
  ( (V!9876 (val!3381 Int)) )
))
(declare-datatypes ((ValueCell!2993 0))(
  ( (ValueCellFull!2993 (v!5540 V!9875)) (EmptyCell!2993) )
))
(declare-datatypes ((array!16940 0))(
  ( (array!16941 (arr!8008 (Array (_ BitVec 32) ValueCell!2993)) (size!8360 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16940)

(declare-fun e!203462 () Bool)

(declare-fun array_inv!5958 (array!16940) Bool)

(assert (=> start!33368 (and (array_inv!5958 _values!1525) e!203462)))

(declare-datatypes ((array!16942 0))(
  ( (array!16943 (arr!8009 (Array (_ BitVec 32) (_ BitVec 64))) (size!8361 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16942)

(declare-fun array_inv!5959 (array!16942) Bool)

(assert (=> start!33368 (array_inv!5959 _keys!1895)))

(declare-fun b!331578 () Bool)

(declare-fun e!203461 () Bool)

(declare-fun tp_is_empty!6673 () Bool)

(assert (=> b!331578 (= e!203461 tp_is_empty!6673)))

(declare-fun b!331579 () Bool)

(declare-fun res!182715 () Bool)

(assert (=> b!331579 (=> (not res!182715) (not e!203459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16942 (_ BitVec 32)) Bool)

(assert (=> b!331579 (= res!182715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331580 () Bool)

(declare-fun mapRes!11382 () Bool)

(assert (=> b!331580 (= e!203462 (and e!203461 mapRes!11382))))

(declare-fun condMapEmpty!11382 () Bool)

(declare-fun mapDefault!11382 () ValueCell!2993)

(assert (=> b!331580 (= condMapEmpty!11382 (= (arr!8008 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2993)) mapDefault!11382)))))

(declare-fun b!331581 () Bool)

(declare-fun e!203460 () Bool)

(assert (=> b!331581 (= e!203460 tp_is_empty!6673)))

(declare-fun b!331582 () Bool)

(assert (=> b!331582 (= e!203459 (bvsgt #b00000000000000000000000000000000 (size!8361 _keys!1895)))))

(declare-fun mapIsEmpty!11382 () Bool)

(assert (=> mapIsEmpty!11382 mapRes!11382))

(declare-fun mapNonEmpty!11382 () Bool)

(declare-fun tp!23757 () Bool)

(assert (=> mapNonEmpty!11382 (= mapRes!11382 (and tp!23757 e!203460))))

(declare-fun mapKey!11382 () (_ BitVec 32))

(declare-fun mapRest!11382 () (Array (_ BitVec 32) ValueCell!2993))

(declare-fun mapValue!11382 () ValueCell!2993)

(assert (=> mapNonEmpty!11382 (= (arr!8008 _values!1525) (store mapRest!11382 mapKey!11382 mapValue!11382))))

(declare-fun b!331583 () Bool)

(declare-fun res!182713 () Bool)

(assert (=> b!331583 (=> (not res!182713) (not e!203459))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331583 (= res!182713 (and (= (size!8360 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8361 _keys!1895) (size!8360 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33368 res!182714) b!331583))

(assert (= (and b!331583 res!182713) b!331579))

(assert (= (and b!331579 res!182715) b!331582))

(assert (= (and b!331580 condMapEmpty!11382) mapIsEmpty!11382))

(assert (= (and b!331580 (not condMapEmpty!11382)) mapNonEmpty!11382))

(get-info :version)

(assert (= (and mapNonEmpty!11382 ((_ is ValueCellFull!2993) mapValue!11382)) b!331581))

(assert (= (and b!331580 ((_ is ValueCellFull!2993) mapDefault!11382)) b!331578))

(assert (= start!33368 b!331580))

(declare-fun m!336663 () Bool)

(assert (=> start!33368 m!336663))

(declare-fun m!336665 () Bool)

(assert (=> start!33368 m!336665))

(declare-fun m!336667 () Bool)

(assert (=> start!33368 m!336667))

(declare-fun m!336669 () Bool)

(assert (=> b!331579 m!336669))

(declare-fun m!336671 () Bool)

(assert (=> mapNonEmpty!11382 m!336671))

(check-sat (not b!331579) (not start!33368) (not mapNonEmpty!11382) tp_is_empty!6673)
(check-sat)
(get-model)

(declare-fun d!70485 () Bool)

(declare-fun res!182739 () Bool)

(declare-fun e!203501 () Bool)

(assert (=> d!70485 (=> res!182739 e!203501)))

(assert (=> d!70485 (= res!182739 (bvsge #b00000000000000000000000000000000 (size!8361 _keys!1895)))))

(assert (=> d!70485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203501)))

(declare-fun b!331628 () Bool)

(declare-fun e!203502 () Bool)

(declare-fun e!203500 () Bool)

(assert (=> b!331628 (= e!203502 e!203500)))

(declare-fun lt!158923 () (_ BitVec 64))

(assert (=> b!331628 (= lt!158923 (select (arr!8009 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10327 0))(
  ( (Unit!10328) )
))
(declare-fun lt!158925 () Unit!10327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16942 (_ BitVec 64) (_ BitVec 32)) Unit!10327)

(assert (=> b!331628 (= lt!158925 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158923 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331628 (arrayContainsKey!0 _keys!1895 lt!158923 #b00000000000000000000000000000000)))

(declare-fun lt!158924 () Unit!10327)

(assert (=> b!331628 (= lt!158924 lt!158925)))

(declare-fun res!182738 () Bool)

(declare-datatypes ((SeekEntryResult!3092 0))(
  ( (MissingZero!3092 (index!14547 (_ BitVec 32))) (Found!3092 (index!14548 (_ BitVec 32))) (Intermediate!3092 (undefined!3904 Bool) (index!14549 (_ BitVec 32)) (x!32969 (_ BitVec 32))) (Undefined!3092) (MissingVacant!3092 (index!14550 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16942 (_ BitVec 32)) SeekEntryResult!3092)

(assert (=> b!331628 (= res!182738 (= (seekEntryOrOpen!0 (select (arr!8009 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3092 #b00000000000000000000000000000000)))))

(assert (=> b!331628 (=> (not res!182738) (not e!203500))))

(declare-fun b!331629 () Bool)

(declare-fun call!26186 () Bool)

(assert (=> b!331629 (= e!203500 call!26186)))

(declare-fun b!331630 () Bool)

(assert (=> b!331630 (= e!203502 call!26186)))

(declare-fun bm!26183 () Bool)

(assert (=> bm!26183 (= call!26186 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!331631 () Bool)

(assert (=> b!331631 (= e!203501 e!203502)))

(declare-fun c!52046 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331631 (= c!52046 (validKeyInArray!0 (select (arr!8009 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70485 (not res!182739)) b!331631))

(assert (= (and b!331631 c!52046) b!331628))

(assert (= (and b!331631 (not c!52046)) b!331630))

(assert (= (and b!331628 res!182738) b!331629))

(assert (= (or b!331629 b!331630) bm!26183))

(declare-fun m!336693 () Bool)

(assert (=> b!331628 m!336693))

(declare-fun m!336695 () Bool)

(assert (=> b!331628 m!336695))

(declare-fun m!336697 () Bool)

(assert (=> b!331628 m!336697))

(assert (=> b!331628 m!336693))

(declare-fun m!336699 () Bool)

(assert (=> b!331628 m!336699))

(declare-fun m!336701 () Bool)

(assert (=> bm!26183 m!336701))

(assert (=> b!331631 m!336693))

(assert (=> b!331631 m!336693))

(declare-fun m!336703 () Bool)

(assert (=> b!331631 m!336703))

(assert (=> b!331579 d!70485))

(declare-fun d!70487 () Bool)

(assert (=> d!70487 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33368 d!70487))

(declare-fun d!70489 () Bool)

(assert (=> d!70489 (= (array_inv!5958 _values!1525) (bvsge (size!8360 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33368 d!70489))

(declare-fun d!70491 () Bool)

(assert (=> d!70491 (= (array_inv!5959 _keys!1895) (bvsge (size!8361 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33368 d!70491))

(declare-fun mapNonEmpty!11391 () Bool)

(declare-fun mapRes!11391 () Bool)

(declare-fun tp!23766 () Bool)

(declare-fun e!203508 () Bool)

(assert (=> mapNonEmpty!11391 (= mapRes!11391 (and tp!23766 e!203508))))

(declare-fun mapKey!11391 () (_ BitVec 32))

(declare-fun mapValue!11391 () ValueCell!2993)

(declare-fun mapRest!11391 () (Array (_ BitVec 32) ValueCell!2993))

(assert (=> mapNonEmpty!11391 (= mapRest!11382 (store mapRest!11391 mapKey!11391 mapValue!11391))))

(declare-fun b!331638 () Bool)

(assert (=> b!331638 (= e!203508 tp_is_empty!6673)))

(declare-fun b!331639 () Bool)

(declare-fun e!203507 () Bool)

(assert (=> b!331639 (= e!203507 tp_is_empty!6673)))

(declare-fun mapIsEmpty!11391 () Bool)

(assert (=> mapIsEmpty!11391 mapRes!11391))

(declare-fun condMapEmpty!11391 () Bool)

(declare-fun mapDefault!11391 () ValueCell!2993)

(assert (=> mapNonEmpty!11382 (= condMapEmpty!11391 (= mapRest!11382 ((as const (Array (_ BitVec 32) ValueCell!2993)) mapDefault!11391)))))

(assert (=> mapNonEmpty!11382 (= tp!23757 (and e!203507 mapRes!11391))))

(assert (= (and mapNonEmpty!11382 condMapEmpty!11391) mapIsEmpty!11391))

(assert (= (and mapNonEmpty!11382 (not condMapEmpty!11391)) mapNonEmpty!11391))

(assert (= (and mapNonEmpty!11391 ((_ is ValueCellFull!2993) mapValue!11391)) b!331638))

(assert (= (and mapNonEmpty!11382 ((_ is ValueCellFull!2993) mapDefault!11391)) b!331639))

(declare-fun m!336705 () Bool)

(assert (=> mapNonEmpty!11391 m!336705))

(check-sat tp_is_empty!6673 (not b!331631) (not b!331628) (not bm!26183) (not mapNonEmpty!11391))
(check-sat)
