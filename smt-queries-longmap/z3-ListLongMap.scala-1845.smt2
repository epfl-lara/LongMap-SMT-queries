; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33412 () Bool)

(assert start!33412)

(declare-fun b!331821 () Bool)

(declare-fun e!203649 () Bool)

(declare-fun e!203647 () Bool)

(declare-fun mapRes!11418 () Bool)

(assert (=> b!331821 (= e!203649 (and e!203647 mapRes!11418))))

(declare-fun condMapEmpty!11418 () Bool)

(declare-datatypes ((V!9899 0))(
  ( (V!9900 (val!3390 Int)) )
))
(declare-datatypes ((ValueCell!3002 0))(
  ( (ValueCellFull!3002 (v!5549 V!9899)) (EmptyCell!3002) )
))
(declare-datatypes ((array!16982 0))(
  ( (array!16983 (arr!8026 (Array (_ BitVec 32) ValueCell!3002)) (size!8378 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16982)

(declare-fun mapDefault!11418 () ValueCell!3002)

(assert (=> b!331821 (= condMapEmpty!11418 (= (arr!8026 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3002)) mapDefault!11418)))))

(declare-fun b!331822 () Bool)

(declare-fun e!203651 () Bool)

(declare-fun tp_is_empty!6691 () Bool)

(assert (=> b!331822 (= e!203651 tp_is_empty!6691)))

(declare-fun b!331823 () Bool)

(declare-fun res!182837 () Bool)

(declare-fun e!203652 () Bool)

(assert (=> b!331823 (=> (not res!182837) (not e!203652))))

(declare-datatypes ((List!4490 0))(
  ( (Nil!4487) (Cons!4486 (h!5342 (_ BitVec 64)) (t!9564 List!4490)) )
))
(declare-fun noDuplicate!179 (List!4490) Bool)

(assert (=> b!331823 (= res!182837 (noDuplicate!179 Nil!4487))))

(declare-fun b!331824 () Bool)

(declare-fun e!203650 () Bool)

(assert (=> b!331824 (= e!203652 e!203650)))

(declare-fun res!182833 () Bool)

(assert (=> b!331824 (=> res!182833 e!203650)))

(declare-fun contains!1976 (List!4490 (_ BitVec 64)) Bool)

(assert (=> b!331824 (= res!182833 (contains!1976 Nil!4487 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!11418 () Bool)

(declare-fun tp!23793 () Bool)

(assert (=> mapNonEmpty!11418 (= mapRes!11418 (and tp!23793 e!203651))))

(declare-fun mapKey!11418 () (_ BitVec 32))

(declare-fun mapRest!11418 () (Array (_ BitVec 32) ValueCell!3002))

(declare-fun mapValue!11418 () ValueCell!3002)

(assert (=> mapNonEmpty!11418 (= (arr!8026 _values!1525) (store mapRest!11418 mapKey!11418 mapValue!11418))))

(declare-fun mapIsEmpty!11418 () Bool)

(assert (=> mapIsEmpty!11418 mapRes!11418))

(declare-fun b!331825 () Bool)

(assert (=> b!331825 (= e!203650 (contains!1976 Nil!4487 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!182834 () Bool)

(assert (=> start!33412 (=> (not res!182834) (not e!203652))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33412 (= res!182834 (validMask!0 mask!2385))))

(assert (=> start!33412 e!203652))

(assert (=> start!33412 true))

(declare-fun array_inv!5970 (array!16982) Bool)

(assert (=> start!33412 (and (array_inv!5970 _values!1525) e!203649)))

(declare-datatypes ((array!16984 0))(
  ( (array!16985 (arr!8027 (Array (_ BitVec 32) (_ BitVec 64))) (size!8379 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16984)

(declare-fun array_inv!5971 (array!16984) Bool)

(assert (=> start!33412 (array_inv!5971 _keys!1895)))

(declare-fun b!331826 () Bool)

(declare-fun res!182838 () Bool)

(assert (=> b!331826 (=> (not res!182838) (not e!203652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16984 (_ BitVec 32)) Bool)

(assert (=> b!331826 (= res!182838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331827 () Bool)

(assert (=> b!331827 (= e!203647 tp_is_empty!6691)))

(declare-fun b!331828 () Bool)

(declare-fun res!182836 () Bool)

(assert (=> b!331828 (=> (not res!182836) (not e!203652))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331828 (= res!182836 (and (= (size!8378 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8379 _keys!1895) (size!8378 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331829 () Bool)

(declare-fun res!182835 () Bool)

(assert (=> b!331829 (=> (not res!182835) (not e!203652))))

(assert (=> b!331829 (= res!182835 (and (bvsle #b00000000000000000000000000000000 (size!8379 _keys!1895)) (bvslt (size!8379 _keys!1895) #b01111111111111111111111111111111)))))

(assert (= (and start!33412 res!182834) b!331828))

(assert (= (and b!331828 res!182836) b!331826))

(assert (= (and b!331826 res!182838) b!331829))

(assert (= (and b!331829 res!182835) b!331823))

(assert (= (and b!331823 res!182837) b!331824))

(assert (= (and b!331824 (not res!182833)) b!331825))

(assert (= (and b!331821 condMapEmpty!11418) mapIsEmpty!11418))

(assert (= (and b!331821 (not condMapEmpty!11418)) mapNonEmpty!11418))

(get-info :version)

(assert (= (and mapNonEmpty!11418 ((_ is ValueCellFull!3002) mapValue!11418)) b!331822))

(assert (= (and b!331821 ((_ is ValueCellFull!3002) mapDefault!11418)) b!331827))

(assert (= start!33412 b!331821))

(declare-fun m!336805 () Bool)

(assert (=> b!331825 m!336805))

(declare-fun m!336807 () Bool)

(assert (=> start!33412 m!336807))

(declare-fun m!336809 () Bool)

(assert (=> start!33412 m!336809))

(declare-fun m!336811 () Bool)

(assert (=> start!33412 m!336811))

(declare-fun m!336813 () Bool)

(assert (=> mapNonEmpty!11418 m!336813))

(declare-fun m!336815 () Bool)

(assert (=> b!331823 m!336815))

(declare-fun m!336817 () Bool)

(assert (=> b!331824 m!336817))

(declare-fun m!336819 () Bool)

(assert (=> b!331826 m!336819))

(check-sat (not b!331823) (not b!331826) (not mapNonEmpty!11418) tp_is_empty!6691 (not start!33412) (not b!331825) (not b!331824))
(check-sat)
(get-model)

(declare-fun d!70517 () Bool)

(declare-fun lt!158946 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!198 (List!4490) (InoxSet (_ BitVec 64)))

(assert (=> d!70517 (= lt!158946 (select (content!198 Nil!4487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203694 () Bool)

(assert (=> d!70517 (= lt!158946 e!203694)))

(declare-fun res!182880 () Bool)

(assert (=> d!70517 (=> (not res!182880) (not e!203694))))

(assert (=> d!70517 (= res!182880 ((_ is Cons!4486) Nil!4487))))

(assert (=> d!70517 (= (contains!1976 Nil!4487 #b1000000000000000000000000000000000000000000000000000000000000000) lt!158946)))

(declare-fun b!331888 () Bool)

(declare-fun e!203693 () Bool)

(assert (=> b!331888 (= e!203694 e!203693)))

(declare-fun res!182879 () Bool)

(assert (=> b!331888 (=> res!182879 e!203693)))

(assert (=> b!331888 (= res!182879 (= (h!5342 Nil!4487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331889 () Bool)

(assert (=> b!331889 (= e!203693 (contains!1976 (t!9564 Nil!4487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70517 res!182880) b!331888))

(assert (= (and b!331888 (not res!182879)) b!331889))

(declare-fun m!336853 () Bool)

(assert (=> d!70517 m!336853))

(declare-fun m!336855 () Bool)

(assert (=> d!70517 m!336855))

(declare-fun m!336857 () Bool)

(assert (=> b!331889 m!336857))

(assert (=> b!331825 d!70517))

(declare-fun bm!26192 () Bool)

(declare-fun call!26195 () Bool)

(assert (=> bm!26192 (= call!26195 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!331898 () Bool)

(declare-fun e!203703 () Bool)

(assert (=> b!331898 (= e!203703 call!26195)))

(declare-fun b!331899 () Bool)

(declare-fun e!203702 () Bool)

(declare-fun e!203701 () Bool)

(assert (=> b!331899 (= e!203702 e!203701)))

(declare-fun c!52055 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331899 (= c!52055 (validKeyInArray!0 (select (arr!8027 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70519 () Bool)

(declare-fun res!182885 () Bool)

(assert (=> d!70519 (=> res!182885 e!203702)))

(assert (=> d!70519 (= res!182885 (bvsge #b00000000000000000000000000000000 (size!8379 _keys!1895)))))

(assert (=> d!70519 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203702)))

(declare-fun b!331900 () Bool)

(assert (=> b!331900 (= e!203701 call!26195)))

(declare-fun b!331901 () Bool)

(assert (=> b!331901 (= e!203701 e!203703)))

(declare-fun lt!158954 () (_ BitVec 64))

(assert (=> b!331901 (= lt!158954 (select (arr!8027 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10333 0))(
  ( (Unit!10334) )
))
(declare-fun lt!158955 () Unit!10333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16984 (_ BitVec 64) (_ BitVec 32)) Unit!10333)

(assert (=> b!331901 (= lt!158955 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158954 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331901 (arrayContainsKey!0 _keys!1895 lt!158954 #b00000000000000000000000000000000)))

(declare-fun lt!158953 () Unit!10333)

(assert (=> b!331901 (= lt!158953 lt!158955)))

(declare-fun res!182886 () Bool)

(declare-datatypes ((SeekEntryResult!3095 0))(
  ( (MissingZero!3095 (index!14559 (_ BitVec 32))) (Found!3095 (index!14560 (_ BitVec 32))) (Intermediate!3095 (undefined!3907 Bool) (index!14561 (_ BitVec 32)) (x!33002 (_ BitVec 32))) (Undefined!3095) (MissingVacant!3095 (index!14562 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16984 (_ BitVec 32)) SeekEntryResult!3095)

(assert (=> b!331901 (= res!182886 (= (seekEntryOrOpen!0 (select (arr!8027 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3095 #b00000000000000000000000000000000)))))

(assert (=> b!331901 (=> (not res!182886) (not e!203703))))

(assert (= (and d!70519 (not res!182885)) b!331899))

(assert (= (and b!331899 c!52055) b!331901))

(assert (= (and b!331899 (not c!52055)) b!331900))

(assert (= (and b!331901 res!182886) b!331898))

(assert (= (or b!331898 b!331900) bm!26192))

(declare-fun m!336859 () Bool)

(assert (=> bm!26192 m!336859))

(declare-fun m!336861 () Bool)

(assert (=> b!331899 m!336861))

(assert (=> b!331899 m!336861))

(declare-fun m!336863 () Bool)

(assert (=> b!331899 m!336863))

(assert (=> b!331901 m!336861))

(declare-fun m!336865 () Bool)

(assert (=> b!331901 m!336865))

(declare-fun m!336867 () Bool)

(assert (=> b!331901 m!336867))

(assert (=> b!331901 m!336861))

(declare-fun m!336869 () Bool)

(assert (=> b!331901 m!336869))

(assert (=> b!331826 d!70519))

(declare-fun d!70521 () Bool)

(declare-fun res!182891 () Bool)

(declare-fun e!203708 () Bool)

(assert (=> d!70521 (=> res!182891 e!203708)))

(assert (=> d!70521 (= res!182891 ((_ is Nil!4487) Nil!4487))))

(assert (=> d!70521 (= (noDuplicate!179 Nil!4487) e!203708)))

(declare-fun b!331906 () Bool)

(declare-fun e!203709 () Bool)

(assert (=> b!331906 (= e!203708 e!203709)))

(declare-fun res!182892 () Bool)

(assert (=> b!331906 (=> (not res!182892) (not e!203709))))

(assert (=> b!331906 (= res!182892 (not (contains!1976 (t!9564 Nil!4487) (h!5342 Nil!4487))))))

(declare-fun b!331907 () Bool)

(assert (=> b!331907 (= e!203709 (noDuplicate!179 (t!9564 Nil!4487)))))

(assert (= (and d!70521 (not res!182891)) b!331906))

(assert (= (and b!331906 res!182892) b!331907))

(declare-fun m!336871 () Bool)

(assert (=> b!331906 m!336871))

(declare-fun m!336873 () Bool)

(assert (=> b!331907 m!336873))

(assert (=> b!331823 d!70521))

(declare-fun d!70523 () Bool)

(declare-fun lt!158956 () Bool)

(assert (=> d!70523 (= lt!158956 (select (content!198 Nil!4487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203711 () Bool)

(assert (=> d!70523 (= lt!158956 e!203711)))

(declare-fun res!182894 () Bool)

(assert (=> d!70523 (=> (not res!182894) (not e!203711))))

(assert (=> d!70523 (= res!182894 ((_ is Cons!4486) Nil!4487))))

(assert (=> d!70523 (= (contains!1976 Nil!4487 #b0000000000000000000000000000000000000000000000000000000000000000) lt!158956)))

(declare-fun b!331908 () Bool)

(declare-fun e!203710 () Bool)

(assert (=> b!331908 (= e!203711 e!203710)))

(declare-fun res!182893 () Bool)

(assert (=> b!331908 (=> res!182893 e!203710)))

(assert (=> b!331908 (= res!182893 (= (h!5342 Nil!4487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331909 () Bool)

(assert (=> b!331909 (= e!203710 (contains!1976 (t!9564 Nil!4487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70523 res!182894) b!331908))

(assert (= (and b!331908 (not res!182893)) b!331909))

(assert (=> d!70523 m!336853))

(declare-fun m!336875 () Bool)

(assert (=> d!70523 m!336875))

(declare-fun m!336877 () Bool)

(assert (=> b!331909 m!336877))

(assert (=> b!331824 d!70523))

(declare-fun d!70525 () Bool)

(assert (=> d!70525 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33412 d!70525))

(declare-fun d!70527 () Bool)

(assert (=> d!70527 (= (array_inv!5970 _values!1525) (bvsge (size!8378 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33412 d!70527))

(declare-fun d!70529 () Bool)

(assert (=> d!70529 (= (array_inv!5971 _keys!1895) (bvsge (size!8379 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33412 d!70529))

(declare-fun condMapEmpty!11427 () Bool)

(declare-fun mapDefault!11427 () ValueCell!3002)

(assert (=> mapNonEmpty!11418 (= condMapEmpty!11427 (= mapRest!11418 ((as const (Array (_ BitVec 32) ValueCell!3002)) mapDefault!11427)))))

(declare-fun e!203717 () Bool)

(declare-fun mapRes!11427 () Bool)

(assert (=> mapNonEmpty!11418 (= tp!23793 (and e!203717 mapRes!11427))))

(declare-fun b!331916 () Bool)

(declare-fun e!203716 () Bool)

(assert (=> b!331916 (= e!203716 tp_is_empty!6691)))

(declare-fun b!331917 () Bool)

(assert (=> b!331917 (= e!203717 tp_is_empty!6691)))

(declare-fun mapIsEmpty!11427 () Bool)

(assert (=> mapIsEmpty!11427 mapRes!11427))

(declare-fun mapNonEmpty!11427 () Bool)

(declare-fun tp!23802 () Bool)

(assert (=> mapNonEmpty!11427 (= mapRes!11427 (and tp!23802 e!203716))))

(declare-fun mapKey!11427 () (_ BitVec 32))

(declare-fun mapRest!11427 () (Array (_ BitVec 32) ValueCell!3002))

(declare-fun mapValue!11427 () ValueCell!3002)

(assert (=> mapNonEmpty!11427 (= mapRest!11418 (store mapRest!11427 mapKey!11427 mapValue!11427))))

(assert (= (and mapNonEmpty!11418 condMapEmpty!11427) mapIsEmpty!11427))

(assert (= (and mapNonEmpty!11418 (not condMapEmpty!11427)) mapNonEmpty!11427))

(assert (= (and mapNonEmpty!11427 ((_ is ValueCellFull!3002) mapValue!11427)) b!331916))

(assert (= (and mapNonEmpty!11418 ((_ is ValueCellFull!3002) mapDefault!11427)) b!331917))

(declare-fun m!336879 () Bool)

(assert (=> mapNonEmpty!11427 m!336879))

(check-sat (not b!331901) (not d!70523) (not b!331889) (not mapNonEmpty!11427) (not d!70517) tp_is_empty!6691 (not b!331899) (not bm!26192) (not b!331909) (not b!331907) (not b!331906))
(check-sat)
