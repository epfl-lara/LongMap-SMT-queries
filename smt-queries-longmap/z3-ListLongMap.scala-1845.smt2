; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33412 () Bool)

(assert start!33412)

(declare-fun b!331599 () Bool)

(declare-fun e!203509 () Bool)

(declare-fun tp_is_empty!6691 () Bool)

(assert (=> b!331599 (= e!203509 tp_is_empty!6691)))

(declare-fun b!331600 () Bool)

(declare-fun e!203505 () Bool)

(declare-fun mapRes!11418 () Bool)

(assert (=> b!331600 (= e!203505 (and e!203509 mapRes!11418))))

(declare-fun condMapEmpty!11418 () Bool)

(declare-datatypes ((V!9899 0))(
  ( (V!9900 (val!3390 Int)) )
))
(declare-datatypes ((ValueCell!3002 0))(
  ( (ValueCellFull!3002 (v!5542 V!9899)) (EmptyCell!3002) )
))
(declare-datatypes ((array!16969 0))(
  ( (array!16970 (arr!8020 (Array (_ BitVec 32) ValueCell!3002)) (size!8373 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16969)

(declare-fun mapDefault!11418 () ValueCell!3002)

(assert (=> b!331600 (= condMapEmpty!11418 (= (arr!8020 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3002)) mapDefault!11418)))))

(declare-fun res!182711 () Bool)

(declare-fun e!203507 () Bool)

(assert (=> start!33412 (=> (not res!182711) (not e!203507))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33412 (= res!182711 (validMask!0 mask!2385))))

(assert (=> start!33412 e!203507))

(assert (=> start!33412 true))

(declare-fun array_inv!5986 (array!16969) Bool)

(assert (=> start!33412 (and (array_inv!5986 _values!1525) e!203505)))

(declare-datatypes ((array!16971 0))(
  ( (array!16972 (arr!8021 (Array (_ BitVec 32) (_ BitVec 64))) (size!8374 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16971)

(declare-fun array_inv!5987 (array!16971) Bool)

(assert (=> start!33412 (array_inv!5987 _keys!1895)))

(declare-fun b!331601 () Bool)

(declare-fun res!182710 () Bool)

(assert (=> b!331601 (=> (not res!182710) (not e!203507))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331601 (= res!182710 (and (= (size!8373 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8374 _keys!1895) (size!8373 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331602 () Bool)

(declare-fun res!182707 () Bool)

(assert (=> b!331602 (=> (not res!182707) (not e!203507))))

(assert (=> b!331602 (= res!182707 (and (bvsle #b00000000000000000000000000000000 (size!8374 _keys!1895)) (bvslt (size!8374 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!331603 () Bool)

(declare-fun res!182712 () Bool)

(assert (=> b!331603 (=> (not res!182712) (not e!203507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16971 (_ BitVec 32)) Bool)

(assert (=> b!331603 (= res!182712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331604 () Bool)

(declare-fun e!203510 () Bool)

(declare-datatypes ((List!4544 0))(
  ( (Nil!4541) (Cons!4540 (h!5396 (_ BitVec 64)) (t!9617 List!4544)) )
))
(declare-fun contains!1979 (List!4544 (_ BitVec 64)) Bool)

(assert (=> b!331604 (= e!203510 (contains!1979 Nil!4541 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331605 () Bool)

(assert (=> b!331605 (= e!203507 e!203510)))

(declare-fun res!182709 () Bool)

(assert (=> b!331605 (=> res!182709 e!203510)))

(assert (=> b!331605 (= res!182709 (contains!1979 Nil!4541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!11418 () Bool)

(assert (=> mapIsEmpty!11418 mapRes!11418))

(declare-fun mapNonEmpty!11418 () Bool)

(declare-fun tp!23793 () Bool)

(declare-fun e!203506 () Bool)

(assert (=> mapNonEmpty!11418 (= mapRes!11418 (and tp!23793 e!203506))))

(declare-fun mapKey!11418 () (_ BitVec 32))

(declare-fun mapValue!11418 () ValueCell!3002)

(declare-fun mapRest!11418 () (Array (_ BitVec 32) ValueCell!3002))

(assert (=> mapNonEmpty!11418 (= (arr!8020 _values!1525) (store mapRest!11418 mapKey!11418 mapValue!11418))))

(declare-fun b!331606 () Bool)

(assert (=> b!331606 (= e!203506 tp_is_empty!6691)))

(declare-fun b!331607 () Bool)

(declare-fun res!182708 () Bool)

(assert (=> b!331607 (=> (not res!182708) (not e!203507))))

(declare-fun noDuplicate!176 (List!4544) Bool)

(assert (=> b!331607 (= res!182708 (noDuplicate!176 Nil!4541))))

(assert (= (and start!33412 res!182711) b!331601))

(assert (= (and b!331601 res!182710) b!331603))

(assert (= (and b!331603 res!182712) b!331602))

(assert (= (and b!331602 res!182707) b!331607))

(assert (= (and b!331607 res!182708) b!331605))

(assert (= (and b!331605 (not res!182709)) b!331604))

(assert (= (and b!331600 condMapEmpty!11418) mapIsEmpty!11418))

(assert (= (and b!331600 (not condMapEmpty!11418)) mapNonEmpty!11418))

(get-info :version)

(assert (= (and mapNonEmpty!11418 ((_ is ValueCellFull!3002) mapValue!11418)) b!331606))

(assert (= (and b!331600 ((_ is ValueCellFull!3002) mapDefault!11418)) b!331599))

(assert (= start!33412 b!331600))

(declare-fun m!335851 () Bool)

(assert (=> mapNonEmpty!11418 m!335851))

(declare-fun m!335853 () Bool)

(assert (=> b!331605 m!335853))

(declare-fun m!335855 () Bool)

(assert (=> b!331603 m!335855))

(declare-fun m!335857 () Bool)

(assert (=> start!33412 m!335857))

(declare-fun m!335859 () Bool)

(assert (=> start!33412 m!335859))

(declare-fun m!335861 () Bool)

(assert (=> start!33412 m!335861))

(declare-fun m!335863 () Bool)

(assert (=> b!331607 m!335863))

(declare-fun m!335865 () Bool)

(assert (=> b!331604 m!335865))

(check-sat (not b!331605) tp_is_empty!6691 (not mapNonEmpty!11418) (not b!331603) (not b!331604) (not start!33412) (not b!331607))
(check-sat)
(get-model)

(declare-fun b!331670 () Bool)

(declare-fun e!203553 () Bool)

(declare-fun e!203555 () Bool)

(assert (=> b!331670 (= e!203553 e!203555)))

(declare-fun c!52007 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331670 (= c!52007 (validKeyInArray!0 (select (arr!8021 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70283 () Bool)

(declare-fun res!182753 () Bool)

(assert (=> d!70283 (=> res!182753 e!203553)))

(assert (=> d!70283 (= res!182753 (bvsge #b00000000000000000000000000000000 (size!8374 _keys!1895)))))

(assert (=> d!70283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203553)))

(declare-fun b!331671 () Bool)

(declare-fun call!26183 () Bool)

(assert (=> b!331671 (= e!203555 call!26183)))

(declare-fun b!331672 () Bool)

(declare-fun e!203554 () Bool)

(assert (=> b!331672 (= e!203555 e!203554)))

(declare-fun lt!158698 () (_ BitVec 64))

(assert (=> b!331672 (= lt!158698 (select (arr!8021 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10334 0))(
  ( (Unit!10335) )
))
(declare-fun lt!158699 () Unit!10334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16971 (_ BitVec 64) (_ BitVec 32)) Unit!10334)

(assert (=> b!331672 (= lt!158699 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158698 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331672 (arrayContainsKey!0 _keys!1895 lt!158698 #b00000000000000000000000000000000)))

(declare-fun lt!158697 () Unit!10334)

(assert (=> b!331672 (= lt!158697 lt!158699)))

(declare-fun res!182754 () Bool)

(declare-datatypes ((SeekEntryResult!3125 0))(
  ( (MissingZero!3125 (index!14679 (_ BitVec 32))) (Found!3125 (index!14680 (_ BitVec 32))) (Intermediate!3125 (undefined!3937 Bool) (index!14681 (_ BitVec 32)) (x!33030 (_ BitVec 32))) (Undefined!3125) (MissingVacant!3125 (index!14682 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16971 (_ BitVec 32)) SeekEntryResult!3125)

(assert (=> b!331672 (= res!182754 (= (seekEntryOrOpen!0 (select (arr!8021 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3125 #b00000000000000000000000000000000)))))

(assert (=> b!331672 (=> (not res!182754) (not e!203554))))

(declare-fun bm!26180 () Bool)

(assert (=> bm!26180 (= call!26183 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!331673 () Bool)

(assert (=> b!331673 (= e!203554 call!26183)))

(assert (= (and d!70283 (not res!182753)) b!331670))

(assert (= (and b!331670 c!52007) b!331672))

(assert (= (and b!331670 (not c!52007)) b!331671))

(assert (= (and b!331672 res!182754) b!331673))

(assert (= (or b!331673 b!331671) bm!26180))

(declare-fun m!335899 () Bool)

(assert (=> b!331670 m!335899))

(assert (=> b!331670 m!335899))

(declare-fun m!335901 () Bool)

(assert (=> b!331670 m!335901))

(assert (=> b!331672 m!335899))

(declare-fun m!335903 () Bool)

(assert (=> b!331672 m!335903))

(declare-fun m!335905 () Bool)

(assert (=> b!331672 m!335905))

(assert (=> b!331672 m!335899))

(declare-fun m!335907 () Bool)

(assert (=> b!331672 m!335907))

(declare-fun m!335909 () Bool)

(assert (=> bm!26180 m!335909))

(assert (=> b!331603 d!70283))

(declare-fun d!70285 () Bool)

(assert (=> d!70285 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33412 d!70285))

(declare-fun d!70287 () Bool)

(assert (=> d!70287 (= (array_inv!5986 _values!1525) (bvsge (size!8373 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33412 d!70287))

(declare-fun d!70289 () Bool)

(assert (=> d!70289 (= (array_inv!5987 _keys!1895) (bvsge (size!8374 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33412 d!70289))

(declare-fun d!70291 () Bool)

(declare-fun lt!158702 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!197 (List!4544) (InoxSet (_ BitVec 64)))

(assert (=> d!70291 (= lt!158702 (select (content!197 Nil!4541) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203561 () Bool)

(assert (=> d!70291 (= lt!158702 e!203561)))

(declare-fun res!182760 () Bool)

(assert (=> d!70291 (=> (not res!182760) (not e!203561))))

(assert (=> d!70291 (= res!182760 ((_ is Cons!4540) Nil!4541))))

(assert (=> d!70291 (= (contains!1979 Nil!4541 #b1000000000000000000000000000000000000000000000000000000000000000) lt!158702)))

(declare-fun b!331678 () Bool)

(declare-fun e!203560 () Bool)

(assert (=> b!331678 (= e!203561 e!203560)))

(declare-fun res!182759 () Bool)

(assert (=> b!331678 (=> res!182759 e!203560)))

(assert (=> b!331678 (= res!182759 (= (h!5396 Nil!4541) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331679 () Bool)

(assert (=> b!331679 (= e!203560 (contains!1979 (t!9617 Nil!4541) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70291 res!182760) b!331678))

(assert (= (and b!331678 (not res!182759)) b!331679))

(declare-fun m!335911 () Bool)

(assert (=> d!70291 m!335911))

(declare-fun m!335913 () Bool)

(assert (=> d!70291 m!335913))

(declare-fun m!335915 () Bool)

(assert (=> b!331679 m!335915))

(assert (=> b!331604 d!70291))

(declare-fun d!70293 () Bool)

(declare-fun res!182765 () Bool)

(declare-fun e!203566 () Bool)

(assert (=> d!70293 (=> res!182765 e!203566)))

(assert (=> d!70293 (= res!182765 ((_ is Nil!4541) Nil!4541))))

(assert (=> d!70293 (= (noDuplicate!176 Nil!4541) e!203566)))

(declare-fun b!331684 () Bool)

(declare-fun e!203567 () Bool)

(assert (=> b!331684 (= e!203566 e!203567)))

(declare-fun res!182766 () Bool)

(assert (=> b!331684 (=> (not res!182766) (not e!203567))))

(assert (=> b!331684 (= res!182766 (not (contains!1979 (t!9617 Nil!4541) (h!5396 Nil!4541))))))

(declare-fun b!331685 () Bool)

(assert (=> b!331685 (= e!203567 (noDuplicate!176 (t!9617 Nil!4541)))))

(assert (= (and d!70293 (not res!182765)) b!331684))

(assert (= (and b!331684 res!182766) b!331685))

(declare-fun m!335917 () Bool)

(assert (=> b!331684 m!335917))

(declare-fun m!335919 () Bool)

(assert (=> b!331685 m!335919))

(assert (=> b!331607 d!70293))

(declare-fun d!70295 () Bool)

(declare-fun lt!158703 () Bool)

(assert (=> d!70295 (= lt!158703 (select (content!197 Nil!4541) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203569 () Bool)

(assert (=> d!70295 (= lt!158703 e!203569)))

(declare-fun res!182768 () Bool)

(assert (=> d!70295 (=> (not res!182768) (not e!203569))))

(assert (=> d!70295 (= res!182768 ((_ is Cons!4540) Nil!4541))))

(assert (=> d!70295 (= (contains!1979 Nil!4541 #b0000000000000000000000000000000000000000000000000000000000000000) lt!158703)))

(declare-fun b!331686 () Bool)

(declare-fun e!203568 () Bool)

(assert (=> b!331686 (= e!203569 e!203568)))

(declare-fun res!182767 () Bool)

(assert (=> b!331686 (=> res!182767 e!203568)))

(assert (=> b!331686 (= res!182767 (= (h!5396 Nil!4541) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331687 () Bool)

(assert (=> b!331687 (= e!203568 (contains!1979 (t!9617 Nil!4541) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70295 res!182768) b!331686))

(assert (= (and b!331686 (not res!182767)) b!331687))

(assert (=> d!70295 m!335911))

(declare-fun m!335921 () Bool)

(assert (=> d!70295 m!335921))

(declare-fun m!335923 () Bool)

(assert (=> b!331687 m!335923))

(assert (=> b!331605 d!70295))

(declare-fun mapNonEmpty!11427 () Bool)

(declare-fun mapRes!11427 () Bool)

(declare-fun tp!23802 () Bool)

(declare-fun e!203574 () Bool)

(assert (=> mapNonEmpty!11427 (= mapRes!11427 (and tp!23802 e!203574))))

(declare-fun mapRest!11427 () (Array (_ BitVec 32) ValueCell!3002))

(declare-fun mapValue!11427 () ValueCell!3002)

(declare-fun mapKey!11427 () (_ BitVec 32))

(assert (=> mapNonEmpty!11427 (= mapRest!11418 (store mapRest!11427 mapKey!11427 mapValue!11427))))

(declare-fun mapIsEmpty!11427 () Bool)

(assert (=> mapIsEmpty!11427 mapRes!11427))

(declare-fun b!331695 () Bool)

(declare-fun e!203575 () Bool)

(assert (=> b!331695 (= e!203575 tp_is_empty!6691)))

(declare-fun condMapEmpty!11427 () Bool)

(declare-fun mapDefault!11427 () ValueCell!3002)

(assert (=> mapNonEmpty!11418 (= condMapEmpty!11427 (= mapRest!11418 ((as const (Array (_ BitVec 32) ValueCell!3002)) mapDefault!11427)))))

(assert (=> mapNonEmpty!11418 (= tp!23793 (and e!203575 mapRes!11427))))

(declare-fun b!331694 () Bool)

(assert (=> b!331694 (= e!203574 tp_is_empty!6691)))

(assert (= (and mapNonEmpty!11418 condMapEmpty!11427) mapIsEmpty!11427))

(assert (= (and mapNonEmpty!11418 (not condMapEmpty!11427)) mapNonEmpty!11427))

(assert (= (and mapNonEmpty!11427 ((_ is ValueCellFull!3002) mapValue!11427)) b!331694))

(assert (= (and mapNonEmpty!11418 ((_ is ValueCellFull!3002) mapDefault!11427)) b!331695))

(declare-fun m!335925 () Bool)

(assert (=> mapNonEmpty!11427 m!335925))

(check-sat (not b!331687) (not b!331672) (not d!70295) tp_is_empty!6691 (not b!331670) (not b!331685) (not d!70291) (not b!331684) (not mapNonEmpty!11427) (not b!331679) (not bm!26180))
(check-sat)
