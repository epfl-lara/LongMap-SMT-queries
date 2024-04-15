; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76354 () Bool)

(assert start!76354)

(declare-fun b!895742 () Bool)

(declare-fun b_free!15931 () Bool)

(declare-fun b_next!15931 () Bool)

(assert (=> b!895742 (= b_free!15931 (not b_next!15931))))

(declare-fun tp!55815 () Bool)

(declare-fun b_and!26197 () Bool)

(assert (=> b!895742 (= tp!55815 b_and!26197)))

(declare-fun b!895741 () Bool)

(declare-fun e!500554 () Bool)

(declare-datatypes ((SeekEntryResult!8894 0))(
  ( (MissingZero!8894 (index!37947 (_ BitVec 32))) (Found!8894 (index!37948 (_ BitVec 32))) (Intermediate!8894 (undefined!9706 Bool) (index!37949 (_ BitVec 32)) (x!76265 (_ BitVec 32))) (Undefined!8894) (MissingVacant!8894 (index!37950 (_ BitVec 32))) )
))
(declare-fun lt!404426 () SeekEntryResult!8894)

(declare-datatypes ((array!52511 0))(
  ( (array!52512 (arr!25247 (Array (_ BitVec 32) (_ BitVec 64))) (size!25699 (_ BitVec 32))) )
))
(declare-datatypes ((V!29311 0))(
  ( (V!29312 (val!9180 Int)) )
))
(declare-datatypes ((ValueCell!8648 0))(
  ( (ValueCellFull!8648 (v!11667 V!29311)) (EmptyCell!8648) )
))
(declare-datatypes ((array!52513 0))(
  ( (array!52514 (arr!25248 (Array (_ BitVec 32) ValueCell!8648)) (size!25700 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4312 0))(
  ( (LongMapFixedSize!4313 (defaultEntry!5368 Int) (mask!25980 (_ BitVec 32)) (extraKeys!5065 (_ BitVec 32)) (zeroValue!5169 V!29311) (minValue!5169 V!29311) (_size!2211 (_ BitVec 32)) (_keys!10086 array!52511) (_values!5356 array!52513) (_vacant!2211 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4312)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!895741 (= e!500554 (inRange!0 (index!37948 lt!404426) (mask!25980 thiss!1181)))))

(declare-fun tp_is_empty!18259 () Bool)

(declare-fun e!500558 () Bool)

(declare-fun e!500556 () Bool)

(declare-fun array_inv!19874 (array!52511) Bool)

(declare-fun array_inv!19875 (array!52513) Bool)

(assert (=> b!895742 (= e!500558 (and tp!55815 tp_is_empty!18259 (array_inv!19874 (_keys!10086 thiss!1181)) (array_inv!19875 (_values!5356 thiss!1181)) e!500556))))

(declare-fun res!605847 () Bool)

(declare-fun e!500559 () Bool)

(assert (=> start!76354 (=> (not res!605847) (not e!500559))))

(declare-fun valid!1669 (LongMapFixedSize!4312) Bool)

(assert (=> start!76354 (= res!605847 (valid!1669 thiss!1181))))

(assert (=> start!76354 e!500559))

(assert (=> start!76354 e!500558))

(assert (=> start!76354 true))

(declare-fun b!895743 () Bool)

(declare-fun e!500560 () Bool)

(declare-fun mapRes!28996 () Bool)

(assert (=> b!895743 (= e!500556 (and e!500560 mapRes!28996))))

(declare-fun condMapEmpty!28996 () Bool)

(declare-fun mapDefault!28996 () ValueCell!8648)

(assert (=> b!895743 (= condMapEmpty!28996 (= (arr!25248 (_values!5356 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8648)) mapDefault!28996)))))

(declare-fun b!895744 () Bool)

(assert (=> b!895744 (= e!500560 tp_is_empty!18259)))

(declare-fun mapNonEmpty!28996 () Bool)

(declare-fun tp!55816 () Bool)

(declare-fun e!500555 () Bool)

(assert (=> mapNonEmpty!28996 (= mapRes!28996 (and tp!55816 e!500555))))

(declare-fun mapRest!28996 () (Array (_ BitVec 32) ValueCell!8648))

(declare-fun mapKey!28996 () (_ BitVec 32))

(declare-fun mapValue!28996 () ValueCell!8648)

(assert (=> mapNonEmpty!28996 (= (arr!25248 (_values!5356 thiss!1181)) (store mapRest!28996 mapKey!28996 mapValue!28996))))

(declare-fun b!895745 () Bool)

(declare-fun res!605845 () Bool)

(assert (=> b!895745 (=> (not res!605845) (not e!500559))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895745 (= res!605845 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28996 () Bool)

(assert (=> mapIsEmpty!28996 mapRes!28996))

(declare-fun b!895746 () Bool)

(get-info :version)

(assert (=> b!895746 (= e!500559 (not (or (not ((_ is Found!8894) lt!404426)) (bvslt (index!37948 lt!404426) #b00000000000000000000000000000000) (bvslt (index!37948 lt!404426) (size!25699 (_keys!10086 thiss!1181))))))))

(assert (=> b!895746 e!500554))

(declare-fun res!605846 () Bool)

(assert (=> b!895746 (=> res!605846 e!500554)))

(assert (=> b!895746 (= res!605846 (not ((_ is Found!8894) lt!404426)))))

(declare-datatypes ((Unit!30416 0))(
  ( (Unit!30417) )
))
(declare-fun lt!404425 () Unit!30416)

(declare-fun lemmaSeekEntryGivesInRangeIndex!67 (array!52511 array!52513 (_ BitVec 32) (_ BitVec 32) V!29311 V!29311 (_ BitVec 64)) Unit!30416)

(assert (=> b!895746 (= lt!404425 (lemmaSeekEntryGivesInRangeIndex!67 (_keys!10086 thiss!1181) (_values!5356 thiss!1181) (mask!25980 thiss!1181) (extraKeys!5065 thiss!1181) (zeroValue!5169 thiss!1181) (minValue!5169 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52511 (_ BitVec 32)) SeekEntryResult!8894)

(assert (=> b!895746 (= lt!404426 (seekEntry!0 key!785 (_keys!10086 thiss!1181) (mask!25980 thiss!1181)))))

(declare-fun b!895747 () Bool)

(assert (=> b!895747 (= e!500555 tp_is_empty!18259)))

(assert (= (and start!76354 res!605847) b!895745))

(assert (= (and b!895745 res!605845) b!895746))

(assert (= (and b!895746 (not res!605846)) b!895741))

(assert (= (and b!895743 condMapEmpty!28996) mapIsEmpty!28996))

(assert (= (and b!895743 (not condMapEmpty!28996)) mapNonEmpty!28996))

(assert (= (and mapNonEmpty!28996 ((_ is ValueCellFull!8648) mapValue!28996)) b!895747))

(assert (= (and b!895743 ((_ is ValueCellFull!8648) mapDefault!28996)) b!895744))

(assert (= b!895742 b!895743))

(assert (= start!76354 b!895742))

(declare-fun m!832577 () Bool)

(assert (=> b!895741 m!832577))

(declare-fun m!832579 () Bool)

(assert (=> start!76354 m!832579))

(declare-fun m!832581 () Bool)

(assert (=> b!895742 m!832581))

(declare-fun m!832583 () Bool)

(assert (=> b!895742 m!832583))

(declare-fun m!832585 () Bool)

(assert (=> mapNonEmpty!28996 m!832585))

(declare-fun m!832587 () Bool)

(assert (=> b!895746 m!832587))

(declare-fun m!832589 () Bool)

(assert (=> b!895746 m!832589))

(check-sat (not b_next!15931) b_and!26197 (not start!76354) tp_is_empty!18259 (not mapNonEmpty!28996) (not b!895746) (not b!895742) (not b!895741))
(check-sat b_and!26197 (not b_next!15931))
(get-model)

(declare-fun d!110647 () Bool)

(assert (=> d!110647 (= (inRange!0 (index!37948 lt!404426) (mask!25980 thiss!1181)) (and (bvsge (index!37948 lt!404426) #b00000000000000000000000000000000) (bvslt (index!37948 lt!404426) (bvadd (mask!25980 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!895741 d!110647))

(declare-fun d!110649 () Bool)

(declare-fun e!500605 () Bool)

(assert (=> d!110649 e!500605))

(declare-fun res!605868 () Bool)

(assert (=> d!110649 (=> res!605868 e!500605)))

(declare-fun lt!404444 () SeekEntryResult!8894)

(assert (=> d!110649 (= res!605868 (not ((_ is Found!8894) lt!404444)))))

(assert (=> d!110649 (= lt!404444 (seekEntry!0 key!785 (_keys!10086 thiss!1181) (mask!25980 thiss!1181)))))

(declare-fun lt!404443 () Unit!30416)

(declare-fun choose!1484 (array!52511 array!52513 (_ BitVec 32) (_ BitVec 32) V!29311 V!29311 (_ BitVec 64)) Unit!30416)

(assert (=> d!110649 (= lt!404443 (choose!1484 (_keys!10086 thiss!1181) (_values!5356 thiss!1181) (mask!25980 thiss!1181) (extraKeys!5065 thiss!1181) (zeroValue!5169 thiss!1181) (minValue!5169 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110649 (validMask!0 (mask!25980 thiss!1181))))

(assert (=> d!110649 (= (lemmaSeekEntryGivesInRangeIndex!67 (_keys!10086 thiss!1181) (_values!5356 thiss!1181) (mask!25980 thiss!1181) (extraKeys!5065 thiss!1181) (zeroValue!5169 thiss!1181) (minValue!5169 thiss!1181) key!785) lt!404443)))

(declare-fun b!895792 () Bool)

(assert (=> b!895792 (= e!500605 (inRange!0 (index!37948 lt!404444) (mask!25980 thiss!1181)))))

(assert (= (and d!110649 (not res!605868)) b!895792))

(assert (=> d!110649 m!832589))

(declare-fun m!832619 () Bool)

(assert (=> d!110649 m!832619))

(declare-fun m!832621 () Bool)

(assert (=> d!110649 m!832621))

(declare-fun m!832623 () Bool)

(assert (=> b!895792 m!832623))

(assert (=> b!895746 d!110649))

(declare-fun b!895805 () Bool)

(declare-fun c!94569 () Bool)

(declare-fun lt!404455 () (_ BitVec 64))

(assert (=> b!895805 (= c!94569 (= lt!404455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500613 () SeekEntryResult!8894)

(declare-fun e!500612 () SeekEntryResult!8894)

(assert (=> b!895805 (= e!500613 e!500612)))

(declare-fun b!895806 () Bool)

(declare-fun lt!404454 () SeekEntryResult!8894)

(assert (=> b!895806 (= e!500612 (ite ((_ is MissingVacant!8894) lt!404454) (MissingZero!8894 (index!37950 lt!404454)) lt!404454))))

(declare-fun lt!404453 () SeekEntryResult!8894)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52511 (_ BitVec 32)) SeekEntryResult!8894)

(assert (=> b!895806 (= lt!404454 (seekKeyOrZeroReturnVacant!0 (x!76265 lt!404453) (index!37949 lt!404453) (index!37949 lt!404453) key!785 (_keys!10086 thiss!1181) (mask!25980 thiss!1181)))))

(declare-fun d!110651 () Bool)

(declare-fun lt!404456 () SeekEntryResult!8894)

(assert (=> d!110651 (and (or ((_ is MissingVacant!8894) lt!404456) (not ((_ is Found!8894) lt!404456)) (and (bvsge (index!37948 lt!404456) #b00000000000000000000000000000000) (bvslt (index!37948 lt!404456) (size!25699 (_keys!10086 thiss!1181))))) (not ((_ is MissingVacant!8894) lt!404456)) (or (not ((_ is Found!8894) lt!404456)) (= (select (arr!25247 (_keys!10086 thiss!1181)) (index!37948 lt!404456)) key!785)))))

(declare-fun e!500614 () SeekEntryResult!8894)

(assert (=> d!110651 (= lt!404456 e!500614)))

(declare-fun c!94568 () Bool)

(assert (=> d!110651 (= c!94568 (and ((_ is Intermediate!8894) lt!404453) (undefined!9706 lt!404453)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52511 (_ BitVec 32)) SeekEntryResult!8894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110651 (= lt!404453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25980 thiss!1181)) key!785 (_keys!10086 thiss!1181) (mask!25980 thiss!1181)))))

(assert (=> d!110651 (validMask!0 (mask!25980 thiss!1181))))

(assert (=> d!110651 (= (seekEntry!0 key!785 (_keys!10086 thiss!1181) (mask!25980 thiss!1181)) lt!404456)))

(declare-fun b!895807 () Bool)

(assert (=> b!895807 (= e!500612 (MissingZero!8894 (index!37949 lt!404453)))))

(declare-fun b!895808 () Bool)

(assert (=> b!895808 (= e!500614 Undefined!8894)))

(declare-fun b!895809 () Bool)

(assert (=> b!895809 (= e!500614 e!500613)))

(assert (=> b!895809 (= lt!404455 (select (arr!25247 (_keys!10086 thiss!1181)) (index!37949 lt!404453)))))

(declare-fun c!94567 () Bool)

(assert (=> b!895809 (= c!94567 (= lt!404455 key!785))))

(declare-fun b!895810 () Bool)

(assert (=> b!895810 (= e!500613 (Found!8894 (index!37949 lt!404453)))))

(assert (= (and d!110651 c!94568) b!895808))

(assert (= (and d!110651 (not c!94568)) b!895809))

(assert (= (and b!895809 c!94567) b!895810))

(assert (= (and b!895809 (not c!94567)) b!895805))

(assert (= (and b!895805 c!94569) b!895807))

(assert (= (and b!895805 (not c!94569)) b!895806))

(declare-fun m!832625 () Bool)

(assert (=> b!895806 m!832625))

(declare-fun m!832627 () Bool)

(assert (=> d!110651 m!832627))

(declare-fun m!832629 () Bool)

(assert (=> d!110651 m!832629))

(assert (=> d!110651 m!832629))

(declare-fun m!832631 () Bool)

(assert (=> d!110651 m!832631))

(assert (=> d!110651 m!832621))

(declare-fun m!832633 () Bool)

(assert (=> b!895809 m!832633))

(assert (=> b!895746 d!110651))

(declare-fun d!110653 () Bool)

(assert (=> d!110653 (= (array_inv!19874 (_keys!10086 thiss!1181)) (bvsge (size!25699 (_keys!10086 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895742 d!110653))

(declare-fun d!110655 () Bool)

(assert (=> d!110655 (= (array_inv!19875 (_values!5356 thiss!1181)) (bvsge (size!25700 (_values!5356 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895742 d!110655))

(declare-fun d!110657 () Bool)

(declare-fun res!605875 () Bool)

(declare-fun e!500617 () Bool)

(assert (=> d!110657 (=> (not res!605875) (not e!500617))))

(declare-fun simpleValid!310 (LongMapFixedSize!4312) Bool)

(assert (=> d!110657 (= res!605875 (simpleValid!310 thiss!1181))))

(assert (=> d!110657 (= (valid!1669 thiss!1181) e!500617)))

(declare-fun b!895817 () Bool)

(declare-fun res!605876 () Bool)

(assert (=> b!895817 (=> (not res!605876) (not e!500617))))

(declare-fun arrayCountValidKeys!0 (array!52511 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895817 (= res!605876 (= (arrayCountValidKeys!0 (_keys!10086 thiss!1181) #b00000000000000000000000000000000 (size!25699 (_keys!10086 thiss!1181))) (_size!2211 thiss!1181)))))

(declare-fun b!895818 () Bool)

(declare-fun res!605877 () Bool)

(assert (=> b!895818 (=> (not res!605877) (not e!500617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52511 (_ BitVec 32)) Bool)

(assert (=> b!895818 (= res!605877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10086 thiss!1181) (mask!25980 thiss!1181)))))

(declare-fun b!895819 () Bool)

(declare-datatypes ((List!17828 0))(
  ( (Nil!17825) (Cons!17824 (h!18961 (_ BitVec 64)) (t!25158 List!17828)) )
))
(declare-fun arrayNoDuplicates!0 (array!52511 (_ BitVec 32) List!17828) Bool)

(assert (=> b!895819 (= e!500617 (arrayNoDuplicates!0 (_keys!10086 thiss!1181) #b00000000000000000000000000000000 Nil!17825))))

(assert (= (and d!110657 res!605875) b!895817))

(assert (= (and b!895817 res!605876) b!895818))

(assert (= (and b!895818 res!605877) b!895819))

(declare-fun m!832635 () Bool)

(assert (=> d!110657 m!832635))

(declare-fun m!832637 () Bool)

(assert (=> b!895817 m!832637))

(declare-fun m!832639 () Bool)

(assert (=> b!895818 m!832639))

(declare-fun m!832641 () Bool)

(assert (=> b!895819 m!832641))

(assert (=> start!76354 d!110657))

(declare-fun mapNonEmpty!29005 () Bool)

(declare-fun mapRes!29005 () Bool)

(declare-fun tp!55831 () Bool)

(declare-fun e!500622 () Bool)

(assert (=> mapNonEmpty!29005 (= mapRes!29005 (and tp!55831 e!500622))))

(declare-fun mapRest!29005 () (Array (_ BitVec 32) ValueCell!8648))

(declare-fun mapValue!29005 () ValueCell!8648)

(declare-fun mapKey!29005 () (_ BitVec 32))

(assert (=> mapNonEmpty!29005 (= mapRest!28996 (store mapRest!29005 mapKey!29005 mapValue!29005))))

(declare-fun b!895826 () Bool)

(assert (=> b!895826 (= e!500622 tp_is_empty!18259)))

(declare-fun mapIsEmpty!29005 () Bool)

(assert (=> mapIsEmpty!29005 mapRes!29005))

(declare-fun condMapEmpty!29005 () Bool)

(declare-fun mapDefault!29005 () ValueCell!8648)

(assert (=> mapNonEmpty!28996 (= condMapEmpty!29005 (= mapRest!28996 ((as const (Array (_ BitVec 32) ValueCell!8648)) mapDefault!29005)))))

(declare-fun e!500623 () Bool)

(assert (=> mapNonEmpty!28996 (= tp!55816 (and e!500623 mapRes!29005))))

(declare-fun b!895827 () Bool)

(assert (=> b!895827 (= e!500623 tp_is_empty!18259)))

(assert (= (and mapNonEmpty!28996 condMapEmpty!29005) mapIsEmpty!29005))

(assert (= (and mapNonEmpty!28996 (not condMapEmpty!29005)) mapNonEmpty!29005))

(assert (= (and mapNonEmpty!29005 ((_ is ValueCellFull!8648) mapValue!29005)) b!895826))

(assert (= (and mapNonEmpty!28996 ((_ is ValueCellFull!8648) mapDefault!29005)) b!895827))

(declare-fun m!832643 () Bool)

(assert (=> mapNonEmpty!29005 m!832643))

(check-sat (not b_next!15931) (not d!110651) (not b!895806) tp_is_empty!18259 (not b!895819) (not mapNonEmpty!29005) (not b!895818) (not d!110649) b_and!26197 (not d!110657) (not b!895817) (not b!895792))
(check-sat b_and!26197 (not b_next!15931))
