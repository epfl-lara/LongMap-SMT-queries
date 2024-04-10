; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33412 () Bool)

(assert start!33412)

(declare-fun b!331803 () Bool)

(declare-fun res!182796 () Bool)

(declare-fun e!203631 () Bool)

(assert (=> b!331803 (=> (not res!182796) (not e!203631))))

(declare-datatypes ((array!16971 0))(
  ( (array!16972 (arr!8022 (Array (_ BitVec 32) (_ BitVec 64))) (size!8374 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16971)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16971 (_ BitVec 32)) Bool)

(assert (=> b!331803 (= res!182796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331804 () Bool)

(declare-fun e!203630 () Bool)

(declare-fun e!203632 () Bool)

(declare-fun mapRes!11409 () Bool)

(assert (=> b!331804 (= e!203630 (and e!203632 mapRes!11409))))

(declare-fun condMapEmpty!11409 () Bool)

(declare-datatypes ((V!9893 0))(
  ( (V!9894 (val!3388 Int)) )
))
(declare-datatypes ((ValueCell!3000 0))(
  ( (ValueCellFull!3000 (v!5546 V!9893)) (EmptyCell!3000) )
))
(declare-datatypes ((array!16973 0))(
  ( (array!16974 (arr!8023 (Array (_ BitVec 32) ValueCell!3000)) (size!8375 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16973)

(declare-fun mapDefault!11409 () ValueCell!3000)

(assert (=> b!331804 (= condMapEmpty!11409 (= (arr!8023 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3000)) mapDefault!11409)))))

(declare-fun b!331805 () Bool)

(declare-datatypes ((List!4575 0))(
  ( (Nil!4572) (Cons!4571 (h!5427 (_ BitVec 64)) (t!9657 List!4575)) )
))
(declare-fun noDuplicate!173 (List!4575) Bool)

(assert (=> b!331805 (= e!203631 (not (noDuplicate!173 Nil!4572)))))

(declare-fun mapNonEmpty!11409 () Bool)

(declare-fun tp!23784 () Bool)

(declare-fun e!203628 () Bool)

(assert (=> mapNonEmpty!11409 (= mapRes!11409 (and tp!23784 e!203628))))

(declare-fun mapValue!11409 () ValueCell!3000)

(declare-fun mapKey!11409 () (_ BitVec 32))

(declare-fun mapRest!11409 () (Array (_ BitVec 32) ValueCell!3000))

(assert (=> mapNonEmpty!11409 (= (arr!8023 _values!1525) (store mapRest!11409 mapKey!11409 mapValue!11409))))

(declare-fun b!331806 () Bool)

(declare-fun tp_is_empty!6687 () Bool)

(assert (=> b!331806 (= e!203632 tp_is_empty!6687)))

(declare-fun mapIsEmpty!11409 () Bool)

(assert (=> mapIsEmpty!11409 mapRes!11409))

(declare-fun b!331807 () Bool)

(assert (=> b!331807 (= e!203628 tp_is_empty!6687)))

(declare-fun b!331808 () Bool)

(declare-fun res!182799 () Bool)

(assert (=> b!331808 (=> (not res!182799) (not e!203631))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331808 (= res!182799 (and (= (size!8375 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8374 _keys!1895) (size!8375 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!182797 () Bool)

(assert (=> start!33412 (=> (not res!182797) (not e!203631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33412 (= res!182797 (validMask!0 mask!2385))))

(assert (=> start!33412 e!203631))

(assert (=> start!33412 true))

(declare-fun array_inv!5976 (array!16973) Bool)

(assert (=> start!33412 (and (array_inv!5976 _values!1525) e!203630)))

(declare-fun array_inv!5977 (array!16971) Bool)

(assert (=> start!33412 (array_inv!5977 _keys!1895)))

(declare-fun b!331802 () Bool)

(declare-fun res!182798 () Bool)

(assert (=> b!331802 (=> (not res!182798) (not e!203631))))

(assert (=> b!331802 (= res!182798 (and (bvsle #b00000000000000000000000000000000 (size!8374 _keys!1895)) (bvslt (size!8374 _keys!1895) #b01111111111111111111111111111111)))))

(assert (= (and start!33412 res!182797) b!331808))

(assert (= (and b!331808 res!182799) b!331803))

(assert (= (and b!331803 res!182796) b!331802))

(assert (= (and b!331802 res!182798) b!331805))

(assert (= (and b!331804 condMapEmpty!11409) mapIsEmpty!11409))

(assert (= (and b!331804 (not condMapEmpty!11409)) mapNonEmpty!11409))

(get-info :version)

(assert (= (and mapNonEmpty!11409 ((_ is ValueCellFull!3000) mapValue!11409)) b!331807))

(assert (= (and b!331804 ((_ is ValueCellFull!3000) mapDefault!11409)) b!331806))

(assert (= start!33412 b!331804))

(declare-fun m!336539 () Bool)

(assert (=> b!331803 m!336539))

(declare-fun m!336541 () Bool)

(assert (=> b!331805 m!336541))

(declare-fun m!336543 () Bool)

(assert (=> mapNonEmpty!11409 m!336543))

(declare-fun m!336545 () Bool)

(assert (=> start!33412 m!336545))

(declare-fun m!336547 () Bool)

(assert (=> start!33412 m!336547))

(declare-fun m!336549 () Bool)

(assert (=> start!33412 m!336549))

(check-sat tp_is_empty!6687 (not b!331805) (not b!331803) (not mapNonEmpty!11409) (not start!33412))
(check-sat)
(get-model)

(declare-fun d!70477 () Bool)

(declare-fun res!182816 () Bool)

(declare-fun e!203652 () Bool)

(assert (=> d!70477 (=> res!182816 e!203652)))

(assert (=> d!70477 (= res!182816 ((_ is Nil!4572) Nil!4572))))

(assert (=> d!70477 (= (noDuplicate!173 Nil!4572) e!203652)))

(declare-fun b!331834 () Bool)

(declare-fun e!203653 () Bool)

(assert (=> b!331834 (= e!203652 e!203653)))

(declare-fun res!182817 () Bool)

(assert (=> b!331834 (=> (not res!182817) (not e!203653))))

(declare-fun contains!2000 (List!4575 (_ BitVec 64)) Bool)

(assert (=> b!331834 (= res!182817 (not (contains!2000 (t!9657 Nil!4572) (h!5427 Nil!4572))))))

(declare-fun b!331835 () Bool)

(assert (=> b!331835 (= e!203653 (noDuplicate!173 (t!9657 Nil!4572)))))

(assert (= (and d!70477 (not res!182816)) b!331834))

(assert (= (and b!331834 res!182817) b!331835))

(declare-fun m!336563 () Bool)

(assert (=> b!331834 m!336563))

(declare-fun m!336565 () Bool)

(assert (=> b!331835 m!336565))

(assert (=> b!331805 d!70477))

(declare-fun d!70479 () Bool)

(assert (=> d!70479 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33412 d!70479))

(declare-fun d!70481 () Bool)

(assert (=> d!70481 (= (array_inv!5976 _values!1525) (bvsge (size!8375 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33412 d!70481))

(declare-fun d!70483 () Bool)

(assert (=> d!70483 (= (array_inv!5977 _keys!1895) (bvsge (size!8374 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33412 d!70483))

(declare-fun d!70485 () Bool)

(declare-fun res!182823 () Bool)

(declare-fun e!203661 () Bool)

(assert (=> d!70485 (=> res!182823 e!203661)))

(assert (=> d!70485 (= res!182823 (bvsge #b00000000000000000000000000000000 (size!8374 _keys!1895)))))

(assert (=> d!70485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203661)))

(declare-fun b!331844 () Bool)

(declare-fun e!203662 () Bool)

(declare-fun e!203660 () Bool)

(assert (=> b!331844 (= e!203662 e!203660)))

(declare-fun lt!158924 () (_ BitVec 64))

(assert (=> b!331844 (= lt!158924 (select (arr!8022 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10355 0))(
  ( (Unit!10356) )
))
(declare-fun lt!158925 () Unit!10355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16971 (_ BitVec 64) (_ BitVec 32)) Unit!10355)

(assert (=> b!331844 (= lt!158925 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158924 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331844 (arrayContainsKey!0 _keys!1895 lt!158924 #b00000000000000000000000000000000)))

(declare-fun lt!158923 () Unit!10355)

(assert (=> b!331844 (= lt!158923 lt!158925)))

(declare-fun res!182822 () Bool)

(declare-datatypes ((SeekEntryResult!3130 0))(
  ( (MissingZero!3130 (index!14699 (_ BitVec 32))) (Found!3130 (index!14700 (_ BitVec 32))) (Intermediate!3130 (undefined!3942 Bool) (index!14701 (_ BitVec 32)) (x!33030 (_ BitVec 32))) (Undefined!3130) (MissingVacant!3130 (index!14702 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16971 (_ BitVec 32)) SeekEntryResult!3130)

(assert (=> b!331844 (= res!182822 (= (seekEntryOrOpen!0 (select (arr!8022 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3130 #b00000000000000000000000000000000)))))

(assert (=> b!331844 (=> (not res!182822) (not e!203660))))

(declare-fun b!331845 () Bool)

(declare-fun call!26206 () Bool)

(assert (=> b!331845 (= e!203662 call!26206)))

(declare-fun b!331846 () Bool)

(assert (=> b!331846 (= e!203660 call!26206)))

(declare-fun b!331847 () Bool)

(assert (=> b!331847 (= e!203661 e!203662)))

(declare-fun c!52077 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331847 (= c!52077 (validKeyInArray!0 (select (arr!8022 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26203 () Bool)

(assert (=> bm!26203 (= call!26206 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!70485 (not res!182823)) b!331847))

(assert (= (and b!331847 c!52077) b!331844))

(assert (= (and b!331847 (not c!52077)) b!331845))

(assert (= (and b!331844 res!182822) b!331846))

(assert (= (or b!331846 b!331845) bm!26203))

(declare-fun m!336567 () Bool)

(assert (=> b!331844 m!336567))

(declare-fun m!336569 () Bool)

(assert (=> b!331844 m!336569))

(declare-fun m!336571 () Bool)

(assert (=> b!331844 m!336571))

(assert (=> b!331844 m!336567))

(declare-fun m!336573 () Bool)

(assert (=> b!331844 m!336573))

(assert (=> b!331847 m!336567))

(assert (=> b!331847 m!336567))

(declare-fun m!336575 () Bool)

(assert (=> b!331847 m!336575))

(declare-fun m!336577 () Bool)

(assert (=> bm!26203 m!336577))

(assert (=> b!331803 d!70485))

(declare-fun mapIsEmpty!11415 () Bool)

(declare-fun mapRes!11415 () Bool)

(assert (=> mapIsEmpty!11415 mapRes!11415))

(declare-fun b!331854 () Bool)

(declare-fun e!203667 () Bool)

(assert (=> b!331854 (= e!203667 tp_is_empty!6687)))

(declare-fun mapNonEmpty!11415 () Bool)

(declare-fun tp!23790 () Bool)

(assert (=> mapNonEmpty!11415 (= mapRes!11415 (and tp!23790 e!203667))))

(declare-fun mapKey!11415 () (_ BitVec 32))

(declare-fun mapValue!11415 () ValueCell!3000)

(declare-fun mapRest!11415 () (Array (_ BitVec 32) ValueCell!3000))

(assert (=> mapNonEmpty!11415 (= mapRest!11409 (store mapRest!11415 mapKey!11415 mapValue!11415))))

(declare-fun b!331855 () Bool)

(declare-fun e!203668 () Bool)

(assert (=> b!331855 (= e!203668 tp_is_empty!6687)))

(declare-fun condMapEmpty!11415 () Bool)

(declare-fun mapDefault!11415 () ValueCell!3000)

(assert (=> mapNonEmpty!11409 (= condMapEmpty!11415 (= mapRest!11409 ((as const (Array (_ BitVec 32) ValueCell!3000)) mapDefault!11415)))))

(assert (=> mapNonEmpty!11409 (= tp!23784 (and e!203668 mapRes!11415))))

(assert (= (and mapNonEmpty!11409 condMapEmpty!11415) mapIsEmpty!11415))

(assert (= (and mapNonEmpty!11409 (not condMapEmpty!11415)) mapNonEmpty!11415))

(assert (= (and mapNonEmpty!11415 ((_ is ValueCellFull!3000) mapValue!11415)) b!331854))

(assert (= (and mapNonEmpty!11409 ((_ is ValueCellFull!3000) mapDefault!11415)) b!331855))

(declare-fun m!336579 () Bool)

(assert (=> mapNonEmpty!11415 m!336579))

(check-sat tp_is_empty!6687 (not b!331834) (not b!331847) (not bm!26203) (not b!331835) (not mapNonEmpty!11415) (not b!331844))
(check-sat)
