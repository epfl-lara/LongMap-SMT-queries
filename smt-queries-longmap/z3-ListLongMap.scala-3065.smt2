; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43218 () Bool)

(assert start!43218)

(declare-fun b!478805 () Bool)

(declare-fun res!285660 () Bool)

(declare-fun e!281632 () Bool)

(assert (=> b!478805 (=> (not res!285660) (not e!281632))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30907 0))(
  ( (array!30908 (arr!14861 (Array (_ BitVec 32) (_ BitVec 64))) (size!15220 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30907)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19233 0))(
  ( (V!19234 (val!6858 Int)) )
))
(declare-datatypes ((ValueCell!6449 0))(
  ( (ValueCellFull!6449 (v!9141 V!19233)) (EmptyCell!6449) )
))
(declare-datatypes ((array!30909 0))(
  ( (array!30910 (arr!14862 (Array (_ BitVec 32) ValueCell!6449)) (size!15221 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30909)

(assert (=> b!478805 (= res!285660 (and (= (size!15221 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15220 _keys!1874) (size!15221 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478806 () Bool)

(assert (=> b!478806 (= e!281632 (bvsgt #b00000000000000000000000000000000 (size!15220 _keys!1874)))))

(declare-fun b!478807 () Bool)

(declare-fun e!281631 () Bool)

(declare-fun e!281630 () Bool)

(declare-fun mapRes!22126 () Bool)

(assert (=> b!478807 (= e!281631 (and e!281630 mapRes!22126))))

(declare-fun condMapEmpty!22126 () Bool)

(declare-fun mapDefault!22126 () ValueCell!6449)

(assert (=> b!478807 (= condMapEmpty!22126 (= (arr!14862 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6449)) mapDefault!22126)))))

(declare-fun b!478808 () Bool)

(declare-fun e!281633 () Bool)

(declare-fun tp_is_empty!13621 () Bool)

(assert (=> b!478808 (= e!281633 tp_is_empty!13621)))

(declare-fun res!285657 () Bool)

(assert (=> start!43218 (=> (not res!285657) (not e!281632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43218 (= res!285657 (validMask!0 mask!2352))))

(assert (=> start!43218 e!281632))

(assert (=> start!43218 true))

(declare-fun array_inv!10810 (array!30909) Bool)

(assert (=> start!43218 (and (array_inv!10810 _values!1516) e!281631)))

(declare-fun array_inv!10811 (array!30907) Bool)

(assert (=> start!43218 (array_inv!10811 _keys!1874)))

(declare-fun mapIsEmpty!22126 () Bool)

(assert (=> mapIsEmpty!22126 mapRes!22126))

(declare-fun b!478809 () Bool)

(declare-fun res!285658 () Bool)

(assert (=> b!478809 (=> (not res!285658) (not e!281632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30907 (_ BitVec 32)) Bool)

(assert (=> b!478809 (= res!285658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478810 () Bool)

(assert (=> b!478810 (= e!281630 tp_is_empty!13621)))

(declare-fun mapNonEmpty!22126 () Bool)

(declare-fun tp!42601 () Bool)

(assert (=> mapNonEmpty!22126 (= mapRes!22126 (and tp!42601 e!281633))))

(declare-fun mapRest!22126 () (Array (_ BitVec 32) ValueCell!6449))

(declare-fun mapKey!22126 () (_ BitVec 32))

(declare-fun mapValue!22126 () ValueCell!6449)

(assert (=> mapNonEmpty!22126 (= (arr!14862 _values!1516) (store mapRest!22126 mapKey!22126 mapValue!22126))))

(declare-fun b!478811 () Bool)

(declare-fun res!285659 () Bool)

(assert (=> b!478811 (=> (not res!285659) (not e!281632))))

(declare-datatypes ((List!9123 0))(
  ( (Nil!9120) (Cons!9119 (h!9975 (_ BitVec 64)) (t!15320 List!9123)) )
))
(declare-fun arrayNoDuplicates!0 (array!30907 (_ BitVec 32) List!9123) Bool)

(assert (=> b!478811 (= res!285659 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9120))))

(assert (= (and start!43218 res!285657) b!478805))

(assert (= (and b!478805 res!285660) b!478809))

(assert (= (and b!478809 res!285658) b!478811))

(assert (= (and b!478811 res!285659) b!478806))

(assert (= (and b!478807 condMapEmpty!22126) mapIsEmpty!22126))

(assert (= (and b!478807 (not condMapEmpty!22126)) mapNonEmpty!22126))

(get-info :version)

(assert (= (and mapNonEmpty!22126 ((_ is ValueCellFull!6449) mapValue!22126)) b!478808))

(assert (= (and b!478807 ((_ is ValueCellFull!6449) mapDefault!22126)) b!478810))

(assert (= start!43218 b!478807))

(declare-fun m!460395 () Bool)

(assert (=> start!43218 m!460395))

(declare-fun m!460397 () Bool)

(assert (=> start!43218 m!460397))

(declare-fun m!460399 () Bool)

(assert (=> start!43218 m!460399))

(declare-fun m!460401 () Bool)

(assert (=> b!478809 m!460401))

(declare-fun m!460403 () Bool)

(assert (=> mapNonEmpty!22126 m!460403))

(declare-fun m!460405 () Bool)

(assert (=> b!478811 m!460405))

(check-sat (not b!478809) (not b!478811) (not mapNonEmpty!22126) tp_is_empty!13621 (not start!43218))
(check-sat)
(get-model)

(declare-fun b!478864 () Bool)

(declare-fun e!281676 () Bool)

(declare-fun contains!2573 (List!9123 (_ BitVec 64)) Bool)

(assert (=> b!478864 (= e!281676 (contains!2573 Nil!9120 (select (arr!14861 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!478865 () Bool)

(declare-fun e!281673 () Bool)

(declare-fun e!281674 () Bool)

(assert (=> b!478865 (= e!281673 e!281674)))

(declare-fun c!57602 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478865 (= c!57602 (validKeyInArray!0 (select (arr!14861 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!478866 () Bool)

(declare-fun e!281675 () Bool)

(assert (=> b!478866 (= e!281675 e!281673)))

(declare-fun res!285691 () Bool)

(assert (=> b!478866 (=> (not res!285691) (not e!281673))))

(assert (=> b!478866 (= res!285691 (not e!281676))))

(declare-fun res!285693 () Bool)

(assert (=> b!478866 (=> (not res!285693) (not e!281676))))

(assert (=> b!478866 (= res!285693 (validKeyInArray!0 (select (arr!14861 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!478867 () Bool)

(declare-fun call!30819 () Bool)

(assert (=> b!478867 (= e!281674 call!30819)))

(declare-fun b!478868 () Bool)

(assert (=> b!478868 (= e!281674 call!30819)))

(declare-fun bm!30816 () Bool)

(assert (=> bm!30816 (= call!30819 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57602 (Cons!9119 (select (arr!14861 _keys!1874) #b00000000000000000000000000000000) Nil!9120) Nil!9120)))))

(declare-fun d!76449 () Bool)

(declare-fun res!285692 () Bool)

(assert (=> d!76449 (=> res!285692 e!281675)))

(assert (=> d!76449 (= res!285692 (bvsge #b00000000000000000000000000000000 (size!15220 _keys!1874)))))

(assert (=> d!76449 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9120) e!281675)))

(assert (= (and d!76449 (not res!285692)) b!478866))

(assert (= (and b!478866 res!285693) b!478864))

(assert (= (and b!478866 res!285691) b!478865))

(assert (= (and b!478865 c!57602) b!478868))

(assert (= (and b!478865 (not c!57602)) b!478867))

(assert (= (or b!478868 b!478867) bm!30816))

(declare-fun m!460431 () Bool)

(assert (=> b!478864 m!460431))

(assert (=> b!478864 m!460431))

(declare-fun m!460433 () Bool)

(assert (=> b!478864 m!460433))

(assert (=> b!478865 m!460431))

(assert (=> b!478865 m!460431))

(declare-fun m!460435 () Bool)

(assert (=> b!478865 m!460435))

(assert (=> b!478866 m!460431))

(assert (=> b!478866 m!460431))

(assert (=> b!478866 m!460435))

(assert (=> bm!30816 m!460431))

(declare-fun m!460437 () Bool)

(assert (=> bm!30816 m!460437))

(assert (=> b!478811 d!76449))

(declare-fun d!76451 () Bool)

(assert (=> d!76451 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43218 d!76451))

(declare-fun d!76453 () Bool)

(assert (=> d!76453 (= (array_inv!10810 _values!1516) (bvsge (size!15221 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43218 d!76453))

(declare-fun d!76455 () Bool)

(assert (=> d!76455 (= (array_inv!10811 _keys!1874) (bvsge (size!15220 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43218 d!76455))

(declare-fun d!76457 () Bool)

(declare-fun res!285698 () Bool)

(declare-fun e!281685 () Bool)

(assert (=> d!76457 (=> res!285698 e!281685)))

(assert (=> d!76457 (= res!285698 (bvsge #b00000000000000000000000000000000 (size!15220 _keys!1874)))))

(assert (=> d!76457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281685)))

(declare-fun b!478877 () Bool)

(declare-fun e!281683 () Bool)

(declare-fun e!281684 () Bool)

(assert (=> b!478877 (= e!281683 e!281684)))

(declare-fun lt!217588 () (_ BitVec 64))

(assert (=> b!478877 (= lt!217588 (select (arr!14861 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14046 0))(
  ( (Unit!14047) )
))
(declare-fun lt!217587 () Unit!14046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30907 (_ BitVec 64) (_ BitVec 32)) Unit!14046)

(assert (=> b!478877 (= lt!217587 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217588 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478877 (arrayContainsKey!0 _keys!1874 lt!217588 #b00000000000000000000000000000000)))

(declare-fun lt!217586 () Unit!14046)

(assert (=> b!478877 (= lt!217586 lt!217587)))

(declare-fun res!285699 () Bool)

(declare-datatypes ((SeekEntryResult!3562 0))(
  ( (MissingZero!3562 (index!16427 (_ BitVec 32))) (Found!3562 (index!16428 (_ BitVec 32))) (Intermediate!3562 (undefined!4374 Bool) (index!16429 (_ BitVec 32)) (x!44981 (_ BitVec 32))) (Undefined!3562) (MissingVacant!3562 (index!16430 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30907 (_ BitVec 32)) SeekEntryResult!3562)

(assert (=> b!478877 (= res!285699 (= (seekEntryOrOpen!0 (select (arr!14861 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3562 #b00000000000000000000000000000000)))))

(assert (=> b!478877 (=> (not res!285699) (not e!281684))))

(declare-fun b!478878 () Bool)

(declare-fun call!30822 () Bool)

(assert (=> b!478878 (= e!281683 call!30822)))

(declare-fun bm!30819 () Bool)

(assert (=> bm!30819 (= call!30822 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478879 () Bool)

(assert (=> b!478879 (= e!281684 call!30822)))

(declare-fun b!478880 () Bool)

(assert (=> b!478880 (= e!281685 e!281683)))

(declare-fun c!57605 () Bool)

(assert (=> b!478880 (= c!57605 (validKeyInArray!0 (select (arr!14861 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76457 (not res!285698)) b!478880))

(assert (= (and b!478880 c!57605) b!478877))

(assert (= (and b!478880 (not c!57605)) b!478878))

(assert (= (and b!478877 res!285699) b!478879))

(assert (= (or b!478879 b!478878) bm!30819))

(assert (=> b!478877 m!460431))

(declare-fun m!460439 () Bool)

(assert (=> b!478877 m!460439))

(declare-fun m!460441 () Bool)

(assert (=> b!478877 m!460441))

(assert (=> b!478877 m!460431))

(declare-fun m!460443 () Bool)

(assert (=> b!478877 m!460443))

(declare-fun m!460445 () Bool)

(assert (=> bm!30819 m!460445))

(assert (=> b!478880 m!460431))

(assert (=> b!478880 m!460431))

(assert (=> b!478880 m!460435))

(assert (=> b!478809 d!76457))

(declare-fun b!478888 () Bool)

(declare-fun e!281690 () Bool)

(assert (=> b!478888 (= e!281690 tp_is_empty!13621)))

(declare-fun b!478887 () Bool)

(declare-fun e!281691 () Bool)

(assert (=> b!478887 (= e!281691 tp_is_empty!13621)))

(declare-fun mapIsEmpty!22135 () Bool)

(declare-fun mapRes!22135 () Bool)

(assert (=> mapIsEmpty!22135 mapRes!22135))

(declare-fun mapNonEmpty!22135 () Bool)

(declare-fun tp!42610 () Bool)

(assert (=> mapNonEmpty!22135 (= mapRes!22135 (and tp!42610 e!281691))))

(declare-fun mapKey!22135 () (_ BitVec 32))

(declare-fun mapRest!22135 () (Array (_ BitVec 32) ValueCell!6449))

(declare-fun mapValue!22135 () ValueCell!6449)

(assert (=> mapNonEmpty!22135 (= mapRest!22126 (store mapRest!22135 mapKey!22135 mapValue!22135))))

(declare-fun condMapEmpty!22135 () Bool)

(declare-fun mapDefault!22135 () ValueCell!6449)

(assert (=> mapNonEmpty!22126 (= condMapEmpty!22135 (= mapRest!22126 ((as const (Array (_ BitVec 32) ValueCell!6449)) mapDefault!22135)))))

(assert (=> mapNonEmpty!22126 (= tp!42601 (and e!281690 mapRes!22135))))

(assert (= (and mapNonEmpty!22126 condMapEmpty!22135) mapIsEmpty!22135))

(assert (= (and mapNonEmpty!22126 (not condMapEmpty!22135)) mapNonEmpty!22135))

(assert (= (and mapNonEmpty!22135 ((_ is ValueCellFull!6449) mapValue!22135)) b!478887))

(assert (= (and mapNonEmpty!22126 ((_ is ValueCellFull!6449) mapDefault!22135)) b!478888))

(declare-fun m!460447 () Bool)

(assert (=> mapNonEmpty!22135 m!460447))

(check-sat (not mapNonEmpty!22135) (not b!478877) (not bm!30819) tp_is_empty!13621 (not b!478865) (not bm!30816) (not b!478880) (not b!478864) (not b!478866))
(check-sat)
