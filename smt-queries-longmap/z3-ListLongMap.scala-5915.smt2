; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76690 () Bool)

(assert start!76690)

(declare-fun b!897748 () Bool)

(declare-fun b_free!15993 () Bool)

(declare-fun b_next!15993 () Bool)

(assert (=> b!897748 (= b_free!15993 (not b_next!15993))))

(declare-fun tp!56035 () Bool)

(declare-fun b_and!26285 () Bool)

(assert (=> b!897748 (= tp!56035 b_and!26285)))

(declare-fun b!897739 () Bool)

(declare-fun e!502060 () Bool)

(declare-fun e!502065 () Bool)

(declare-fun mapRes!29124 () Bool)

(assert (=> b!897739 (= e!502060 (and e!502065 mapRes!29124))))

(declare-fun condMapEmpty!29124 () Bool)

(declare-datatypes ((array!52672 0))(
  ( (array!52673 (arr!25317 (Array (_ BitVec 32) (_ BitVec 64))) (size!25772 (_ BitVec 32))) )
))
(declare-datatypes ((V!29393 0))(
  ( (V!29394 (val!9211 Int)) )
))
(declare-datatypes ((ValueCell!8679 0))(
  ( (ValueCellFull!8679 (v!11701 V!29393)) (EmptyCell!8679) )
))
(declare-datatypes ((array!52674 0))(
  ( (array!52675 (arr!25318 (Array (_ BitVec 32) ValueCell!8679)) (size!25773 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4374 0))(
  ( (LongMapFixedSize!4375 (defaultEntry!5399 Int) (mask!26102 (_ BitVec 32)) (extraKeys!5111 (_ BitVec 32)) (zeroValue!5215 V!29393) (minValue!5215 V!29393) (_size!2242 (_ BitVec 32)) (_keys!10163 array!52672) (_values!5402 array!52674) (_vacant!2242 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4374)

(declare-fun mapDefault!29124 () ValueCell!8679)

(assert (=> b!897739 (= condMapEmpty!29124 (= (arr!25318 (_values!5402 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8679)) mapDefault!29124)))))

(declare-fun b!897740 () Bool)

(declare-fun e!502066 () Bool)

(declare-fun e!502062 () Bool)

(assert (=> b!897740 (= e!502066 (not e!502062))))

(declare-fun res!606772 () Bool)

(assert (=> b!897740 (=> res!606772 e!502062)))

(declare-datatypes ((SeekEntryResult!8914 0))(
  ( (MissingZero!8914 (index!38027 (_ BitVec 32))) (Found!8914 (index!38028 (_ BitVec 32))) (Intermediate!8914 (undefined!9726 Bool) (index!38029 (_ BitVec 32)) (x!76495 (_ BitVec 32))) (Undefined!8914) (MissingVacant!8914 (index!38030 (_ BitVec 32))) )
))
(declare-fun lt!405291 () SeekEntryResult!8914)

(get-info :version)

(assert (=> b!897740 (= res!606772 (not ((_ is Found!8914) lt!405291)))))

(declare-fun e!502067 () Bool)

(assert (=> b!897740 e!502067))

(declare-fun res!606775 () Bool)

(assert (=> b!897740 (=> res!606775 e!502067)))

(assert (=> b!897740 (= res!606775 (not ((_ is Found!8914) lt!405291)))))

(declare-datatypes ((Unit!30518 0))(
  ( (Unit!30519) )
))
(declare-fun lt!405292 () Unit!30518)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!84 (array!52672 array!52674 (_ BitVec 32) (_ BitVec 32) V!29393 V!29393 (_ BitVec 64)) Unit!30518)

(assert (=> b!897740 (= lt!405292 (lemmaSeekEntryGivesInRangeIndex!84 (_keys!10163 thiss!1181) (_values!5402 thiss!1181) (mask!26102 thiss!1181) (extraKeys!5111 thiss!1181) (zeroValue!5215 thiss!1181) (minValue!5215 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52672 (_ BitVec 32)) SeekEntryResult!8914)

(assert (=> b!897740 (= lt!405291 (seekEntry!0 key!785 (_keys!10163 thiss!1181) (mask!26102 thiss!1181)))))

(declare-fun b!897741 () Bool)

(declare-fun res!606777 () Bool)

(assert (=> b!897741 (=> (not res!606777) (not e!502066))))

(assert (=> b!897741 (= res!606777 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29124 () Bool)

(assert (=> mapIsEmpty!29124 mapRes!29124))

(declare-fun b!897742 () Bool)

(declare-fun res!606774 () Bool)

(declare-fun e!502064 () Bool)

(assert (=> b!897742 (=> res!606774 e!502064)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52672 (_ BitVec 32)) Bool)

(assert (=> b!897742 (= res!606774 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10163 thiss!1181) (mask!26102 thiss!1181))))))

(declare-fun b!897743 () Bool)

(assert (=> b!897743 (= e!502062 e!502064)))

(declare-fun res!606773 () Bool)

(assert (=> b!897743 (=> res!606773 e!502064)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897743 (= res!606773 (not (validMask!0 (mask!26102 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897743 (arrayContainsKey!0 (_keys!10163 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405290 () Unit!30518)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52672 (_ BitVec 64) (_ BitVec 32)) Unit!30518)

(assert (=> b!897743 (= lt!405290 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10163 thiss!1181) key!785 (index!38028 lt!405291)))))

(declare-fun res!606771 () Bool)

(assert (=> start!76690 (=> (not res!606771) (not e!502066))))

(declare-fun valid!1684 (LongMapFixedSize!4374) Bool)

(assert (=> start!76690 (= res!606771 (valid!1684 thiss!1181))))

(assert (=> start!76690 e!502066))

(declare-fun e!502063 () Bool)

(assert (=> start!76690 e!502063))

(assert (=> start!76690 true))

(declare-fun mapNonEmpty!29124 () Bool)

(declare-fun tp!56036 () Bool)

(declare-fun e!502059 () Bool)

(assert (=> mapNonEmpty!29124 (= mapRes!29124 (and tp!56036 e!502059))))

(declare-fun mapKey!29124 () (_ BitVec 32))

(declare-fun mapValue!29124 () ValueCell!8679)

(declare-fun mapRest!29124 () (Array (_ BitVec 32) ValueCell!8679))

(assert (=> mapNonEmpty!29124 (= (arr!25318 (_values!5402 thiss!1181)) (store mapRest!29124 mapKey!29124 mapValue!29124))))

(declare-fun b!897744 () Bool)

(declare-datatypes ((List!17830 0))(
  ( (Nil!17827) (Cons!17826 (h!18968 (_ BitVec 64)) (t!25169 List!17830)) )
))
(declare-fun arrayNoDuplicates!0 (array!52672 (_ BitVec 32) List!17830) Bool)

(assert (=> b!897744 (= e!502064 (arrayNoDuplicates!0 (_keys!10163 thiss!1181) #b00000000000000000000000000000000 Nil!17827))))

(declare-fun b!897745 () Bool)

(declare-fun tp_is_empty!18321 () Bool)

(assert (=> b!897745 (= e!502059 tp_is_empty!18321)))

(declare-fun b!897746 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897746 (= e!502067 (inRange!0 (index!38028 lt!405291) (mask!26102 thiss!1181)))))

(declare-fun b!897747 () Bool)

(declare-fun res!606776 () Bool)

(assert (=> b!897747 (=> res!606776 e!502064)))

(assert (=> b!897747 (= res!606776 (or (not (= (size!25773 (_values!5402 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26102 thiss!1181)))) (not (= (size!25772 (_keys!10163 thiss!1181)) (size!25773 (_values!5402 thiss!1181)))) (bvslt (mask!26102 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5111 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5111 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun array_inv!19872 (array!52672) Bool)

(declare-fun array_inv!19873 (array!52674) Bool)

(assert (=> b!897748 (= e!502063 (and tp!56035 tp_is_empty!18321 (array_inv!19872 (_keys!10163 thiss!1181)) (array_inv!19873 (_values!5402 thiss!1181)) e!502060))))

(declare-fun b!897749 () Bool)

(assert (=> b!897749 (= e!502065 tp_is_empty!18321)))

(assert (= (and start!76690 res!606771) b!897741))

(assert (= (and b!897741 res!606777) b!897740))

(assert (= (and b!897740 (not res!606775)) b!897746))

(assert (= (and b!897740 (not res!606772)) b!897743))

(assert (= (and b!897743 (not res!606773)) b!897747))

(assert (= (and b!897747 (not res!606776)) b!897742))

(assert (= (and b!897742 (not res!606774)) b!897744))

(assert (= (and b!897739 condMapEmpty!29124) mapIsEmpty!29124))

(assert (= (and b!897739 (not condMapEmpty!29124)) mapNonEmpty!29124))

(assert (= (and mapNonEmpty!29124 ((_ is ValueCellFull!8679) mapValue!29124)) b!897745))

(assert (= (and b!897739 ((_ is ValueCellFull!8679) mapDefault!29124)) b!897749))

(assert (= b!897748 b!897739))

(assert (= start!76690 b!897748))

(declare-fun m!834425 () Bool)

(assert (=> b!897748 m!834425))

(declare-fun m!834427 () Bool)

(assert (=> b!897748 m!834427))

(declare-fun m!834429 () Bool)

(assert (=> b!897740 m!834429))

(declare-fun m!834431 () Bool)

(assert (=> b!897740 m!834431))

(declare-fun m!834433 () Bool)

(assert (=> b!897744 m!834433))

(declare-fun m!834435 () Bool)

(assert (=> mapNonEmpty!29124 m!834435))

(declare-fun m!834437 () Bool)

(assert (=> b!897743 m!834437))

(declare-fun m!834439 () Bool)

(assert (=> b!897743 m!834439))

(declare-fun m!834441 () Bool)

(assert (=> b!897743 m!834441))

(declare-fun m!834443 () Bool)

(assert (=> b!897746 m!834443))

(declare-fun m!834445 () Bool)

(assert (=> start!76690 m!834445))

(declare-fun m!834447 () Bool)

(assert (=> b!897742 m!834447))

(check-sat (not b!897742) b_and!26285 (not start!76690) (not b!897748) (not b!897743) (not b!897740) (not b_next!15993) tp_is_empty!18321 (not mapNonEmpty!29124) (not b!897744) (not b!897746))
(check-sat b_and!26285 (not b_next!15993))
(get-model)

(declare-fun d!111139 () Bool)

(assert (=> d!111139 (= (inRange!0 (index!38028 lt!405291) (mask!26102 thiss!1181)) (and (bvsge (index!38028 lt!405291) #b00000000000000000000000000000000) (bvslt (index!38028 lt!405291) (bvadd (mask!26102 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897746 d!111139))

(declare-fun b!897791 () Bool)

(declare-fun e!502102 () Bool)

(declare-fun call!39820 () Bool)

(assert (=> b!897791 (= e!502102 call!39820)))

(declare-fun b!897792 () Bool)

(declare-fun e!502101 () Bool)

(assert (=> b!897792 (= e!502101 e!502102)))

(declare-fun lt!405310 () (_ BitVec 64))

(assert (=> b!897792 (= lt!405310 (select (arr!25317 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405309 () Unit!30518)

(assert (=> b!897792 (= lt!405309 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10163 thiss!1181) lt!405310 #b00000000000000000000000000000000))))

(assert (=> b!897792 (arrayContainsKey!0 (_keys!10163 thiss!1181) lt!405310 #b00000000000000000000000000000000)))

(declare-fun lt!405308 () Unit!30518)

(assert (=> b!897792 (= lt!405308 lt!405309)))

(declare-fun res!606803 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52672 (_ BitVec 32)) SeekEntryResult!8914)

(assert (=> b!897792 (= res!606803 (= (seekEntryOrOpen!0 (select (arr!25317 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000) (_keys!10163 thiss!1181) (mask!26102 thiss!1181)) (Found!8914 #b00000000000000000000000000000000)))))

(assert (=> b!897792 (=> (not res!606803) (not e!502102))))

(declare-fun b!897793 () Bool)

(assert (=> b!897793 (= e!502101 call!39820)))

(declare-fun d!111141 () Bool)

(declare-fun res!606804 () Bool)

(declare-fun e!502103 () Bool)

(assert (=> d!111141 (=> res!606804 e!502103)))

(assert (=> d!111141 (= res!606804 (bvsge #b00000000000000000000000000000000 (size!25772 (_keys!10163 thiss!1181))))))

(assert (=> d!111141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10163 thiss!1181) (mask!26102 thiss!1181)) e!502103)))

(declare-fun bm!39817 () Bool)

(assert (=> bm!39817 (= call!39820 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10163 thiss!1181) (mask!26102 thiss!1181)))))

(declare-fun b!897794 () Bool)

(assert (=> b!897794 (= e!502103 e!502101)))

(declare-fun c!94871 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897794 (= c!94871 (validKeyInArray!0 (select (arr!25317 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111141 (not res!606804)) b!897794))

(assert (= (and b!897794 c!94871) b!897792))

(assert (= (and b!897794 (not c!94871)) b!897793))

(assert (= (and b!897792 res!606803) b!897791))

(assert (= (or b!897791 b!897793) bm!39817))

(declare-fun m!834473 () Bool)

(assert (=> b!897792 m!834473))

(declare-fun m!834475 () Bool)

(assert (=> b!897792 m!834475))

(declare-fun m!834477 () Bool)

(assert (=> b!897792 m!834477))

(assert (=> b!897792 m!834473))

(declare-fun m!834479 () Bool)

(assert (=> b!897792 m!834479))

(declare-fun m!834481 () Bool)

(assert (=> bm!39817 m!834481))

(assert (=> b!897794 m!834473))

(assert (=> b!897794 m!834473))

(declare-fun m!834483 () Bool)

(assert (=> b!897794 m!834483))

(assert (=> b!897742 d!111141))

(declare-fun b!897805 () Bool)

(declare-fun e!502115 () Bool)

(declare-fun e!502112 () Bool)

(assert (=> b!897805 (= e!502115 e!502112)))

(declare-fun c!94874 () Bool)

(assert (=> b!897805 (= c!94874 (validKeyInArray!0 (select (arr!25317 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39820 () Bool)

(declare-fun call!39823 () Bool)

(assert (=> bm!39820 (= call!39823 (arrayNoDuplicates!0 (_keys!10163 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94874 (Cons!17826 (select (arr!25317 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000) Nil!17827) Nil!17827)))))

(declare-fun b!897806 () Bool)

(assert (=> b!897806 (= e!502112 call!39823)))

(declare-fun b!897807 () Bool)

(declare-fun e!502113 () Bool)

(assert (=> b!897807 (= e!502113 e!502115)))

(declare-fun res!606811 () Bool)

(assert (=> b!897807 (=> (not res!606811) (not e!502115))))

(declare-fun e!502114 () Bool)

(assert (=> b!897807 (= res!606811 (not e!502114))))

(declare-fun res!606812 () Bool)

(assert (=> b!897807 (=> (not res!606812) (not e!502114))))

(assert (=> b!897807 (= res!606812 (validKeyInArray!0 (select (arr!25317 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897808 () Bool)

(assert (=> b!897808 (= e!502112 call!39823)))

(declare-fun b!897809 () Bool)

(declare-fun contains!4405 (List!17830 (_ BitVec 64)) Bool)

(assert (=> b!897809 (= e!502114 (contains!4405 Nil!17827 (select (arr!25317 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111143 () Bool)

(declare-fun res!606813 () Bool)

(assert (=> d!111143 (=> res!606813 e!502113)))

(assert (=> d!111143 (= res!606813 (bvsge #b00000000000000000000000000000000 (size!25772 (_keys!10163 thiss!1181))))))

(assert (=> d!111143 (= (arrayNoDuplicates!0 (_keys!10163 thiss!1181) #b00000000000000000000000000000000 Nil!17827) e!502113)))

(assert (= (and d!111143 (not res!606813)) b!897807))

(assert (= (and b!897807 res!606812) b!897809))

(assert (= (and b!897807 res!606811) b!897805))

(assert (= (and b!897805 c!94874) b!897808))

(assert (= (and b!897805 (not c!94874)) b!897806))

(assert (= (or b!897808 b!897806) bm!39820))

(assert (=> b!897805 m!834473))

(assert (=> b!897805 m!834473))

(assert (=> b!897805 m!834483))

(assert (=> bm!39820 m!834473))

(declare-fun m!834485 () Bool)

(assert (=> bm!39820 m!834485))

(assert (=> b!897807 m!834473))

(assert (=> b!897807 m!834473))

(assert (=> b!897807 m!834483))

(assert (=> b!897809 m!834473))

(assert (=> b!897809 m!834473))

(declare-fun m!834487 () Bool)

(assert (=> b!897809 m!834487))

(assert (=> b!897744 d!111143))

(declare-fun d!111145 () Bool)

(declare-fun res!606820 () Bool)

(declare-fun e!502118 () Bool)

(assert (=> d!111145 (=> (not res!606820) (not e!502118))))

(declare-fun simpleValid!320 (LongMapFixedSize!4374) Bool)

(assert (=> d!111145 (= res!606820 (simpleValid!320 thiss!1181))))

(assert (=> d!111145 (= (valid!1684 thiss!1181) e!502118)))

(declare-fun b!897816 () Bool)

(declare-fun res!606821 () Bool)

(assert (=> b!897816 (=> (not res!606821) (not e!502118))))

(declare-fun arrayCountValidKeys!0 (array!52672 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897816 (= res!606821 (= (arrayCountValidKeys!0 (_keys!10163 thiss!1181) #b00000000000000000000000000000000 (size!25772 (_keys!10163 thiss!1181))) (_size!2242 thiss!1181)))))

(declare-fun b!897817 () Bool)

(declare-fun res!606822 () Bool)

(assert (=> b!897817 (=> (not res!606822) (not e!502118))))

(assert (=> b!897817 (= res!606822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10163 thiss!1181) (mask!26102 thiss!1181)))))

(declare-fun b!897818 () Bool)

(assert (=> b!897818 (= e!502118 (arrayNoDuplicates!0 (_keys!10163 thiss!1181) #b00000000000000000000000000000000 Nil!17827))))

(assert (= (and d!111145 res!606820) b!897816))

(assert (= (and b!897816 res!606821) b!897817))

(assert (= (and b!897817 res!606822) b!897818))

(declare-fun m!834489 () Bool)

(assert (=> d!111145 m!834489))

(declare-fun m!834491 () Bool)

(assert (=> b!897816 m!834491))

(assert (=> b!897817 m!834447))

(assert (=> b!897818 m!834433))

(assert (=> start!76690 d!111145))

(declare-fun d!111147 () Bool)

(declare-fun e!502121 () Bool)

(assert (=> d!111147 e!502121))

(declare-fun res!606825 () Bool)

(assert (=> d!111147 (=> res!606825 e!502121)))

(declare-fun lt!405316 () SeekEntryResult!8914)

(assert (=> d!111147 (= res!606825 (not ((_ is Found!8914) lt!405316)))))

(assert (=> d!111147 (= lt!405316 (seekEntry!0 key!785 (_keys!10163 thiss!1181) (mask!26102 thiss!1181)))))

(declare-fun lt!405315 () Unit!30518)

(declare-fun choose!1485 (array!52672 array!52674 (_ BitVec 32) (_ BitVec 32) V!29393 V!29393 (_ BitVec 64)) Unit!30518)

(assert (=> d!111147 (= lt!405315 (choose!1485 (_keys!10163 thiss!1181) (_values!5402 thiss!1181) (mask!26102 thiss!1181) (extraKeys!5111 thiss!1181) (zeroValue!5215 thiss!1181) (minValue!5215 thiss!1181) key!785))))

(assert (=> d!111147 (validMask!0 (mask!26102 thiss!1181))))

(assert (=> d!111147 (= (lemmaSeekEntryGivesInRangeIndex!84 (_keys!10163 thiss!1181) (_values!5402 thiss!1181) (mask!26102 thiss!1181) (extraKeys!5111 thiss!1181) (zeroValue!5215 thiss!1181) (minValue!5215 thiss!1181) key!785) lt!405315)))

(declare-fun b!897821 () Bool)

(assert (=> b!897821 (= e!502121 (inRange!0 (index!38028 lt!405316) (mask!26102 thiss!1181)))))

(assert (= (and d!111147 (not res!606825)) b!897821))

(assert (=> d!111147 m!834431))

(declare-fun m!834493 () Bool)

(assert (=> d!111147 m!834493))

(assert (=> d!111147 m!834437))

(declare-fun m!834495 () Bool)

(assert (=> b!897821 m!834495))

(assert (=> b!897740 d!111147))

(declare-fun b!897834 () Bool)

(declare-fun e!502128 () SeekEntryResult!8914)

(declare-fun lt!405326 () SeekEntryResult!8914)

(assert (=> b!897834 (= e!502128 (ite ((_ is MissingVacant!8914) lt!405326) (MissingZero!8914 (index!38030 lt!405326)) lt!405326))))

(declare-fun lt!405325 () SeekEntryResult!8914)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52672 (_ BitVec 32)) SeekEntryResult!8914)

(assert (=> b!897834 (= lt!405326 (seekKeyOrZeroReturnVacant!0 (x!76495 lt!405325) (index!38029 lt!405325) (index!38029 lt!405325) key!785 (_keys!10163 thiss!1181) (mask!26102 thiss!1181)))))

(declare-fun b!897835 () Bool)

(declare-fun c!94882 () Bool)

(declare-fun lt!405328 () (_ BitVec 64))

(assert (=> b!897835 (= c!94882 (= lt!405328 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502129 () SeekEntryResult!8914)

(assert (=> b!897835 (= e!502129 e!502128)))

(declare-fun b!897836 () Bool)

(declare-fun e!502130 () SeekEntryResult!8914)

(assert (=> b!897836 (= e!502130 e!502129)))

(assert (=> b!897836 (= lt!405328 (select (arr!25317 (_keys!10163 thiss!1181)) (index!38029 lt!405325)))))

(declare-fun c!94883 () Bool)

(assert (=> b!897836 (= c!94883 (= lt!405328 key!785))))

(declare-fun d!111149 () Bool)

(declare-fun lt!405327 () SeekEntryResult!8914)

(assert (=> d!111149 (and (or ((_ is MissingVacant!8914) lt!405327) (not ((_ is Found!8914) lt!405327)) (and (bvsge (index!38028 lt!405327) #b00000000000000000000000000000000) (bvslt (index!38028 lt!405327) (size!25772 (_keys!10163 thiss!1181))))) (not ((_ is MissingVacant!8914) lt!405327)) (or (not ((_ is Found!8914) lt!405327)) (= (select (arr!25317 (_keys!10163 thiss!1181)) (index!38028 lt!405327)) key!785)))))

(assert (=> d!111149 (= lt!405327 e!502130)))

(declare-fun c!94881 () Bool)

(assert (=> d!111149 (= c!94881 (and ((_ is Intermediate!8914) lt!405325) (undefined!9726 lt!405325)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52672 (_ BitVec 32)) SeekEntryResult!8914)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111149 (= lt!405325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26102 thiss!1181)) key!785 (_keys!10163 thiss!1181) (mask!26102 thiss!1181)))))

(assert (=> d!111149 (validMask!0 (mask!26102 thiss!1181))))

(assert (=> d!111149 (= (seekEntry!0 key!785 (_keys!10163 thiss!1181) (mask!26102 thiss!1181)) lt!405327)))

(declare-fun b!897837 () Bool)

(assert (=> b!897837 (= e!502128 (MissingZero!8914 (index!38029 lt!405325)))))

(declare-fun b!897838 () Bool)

(assert (=> b!897838 (= e!502130 Undefined!8914)))

(declare-fun b!897839 () Bool)

(assert (=> b!897839 (= e!502129 (Found!8914 (index!38029 lt!405325)))))

(assert (= (and d!111149 c!94881) b!897838))

(assert (= (and d!111149 (not c!94881)) b!897836))

(assert (= (and b!897836 c!94883) b!897839))

(assert (= (and b!897836 (not c!94883)) b!897835))

(assert (= (and b!897835 c!94882) b!897837))

(assert (= (and b!897835 (not c!94882)) b!897834))

(declare-fun m!834497 () Bool)

(assert (=> b!897834 m!834497))

(declare-fun m!834499 () Bool)

(assert (=> b!897836 m!834499))

(declare-fun m!834501 () Bool)

(assert (=> d!111149 m!834501))

(declare-fun m!834503 () Bool)

(assert (=> d!111149 m!834503))

(assert (=> d!111149 m!834503))

(declare-fun m!834505 () Bool)

(assert (=> d!111149 m!834505))

(assert (=> d!111149 m!834437))

(assert (=> b!897740 d!111149))

(declare-fun d!111151 () Bool)

(assert (=> d!111151 (= (array_inv!19872 (_keys!10163 thiss!1181)) (bvsge (size!25772 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897748 d!111151))

(declare-fun d!111153 () Bool)

(assert (=> d!111153 (= (array_inv!19873 (_values!5402 thiss!1181)) (bvsge (size!25773 (_values!5402 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897748 d!111153))

(declare-fun d!111155 () Bool)

(assert (=> d!111155 (= (validMask!0 (mask!26102 thiss!1181)) (and (or (= (mask!26102 thiss!1181) #b00000000000000000000000000000111) (= (mask!26102 thiss!1181) #b00000000000000000000000000001111) (= (mask!26102 thiss!1181) #b00000000000000000000000000011111) (= (mask!26102 thiss!1181) #b00000000000000000000000000111111) (= (mask!26102 thiss!1181) #b00000000000000000000000001111111) (= (mask!26102 thiss!1181) #b00000000000000000000000011111111) (= (mask!26102 thiss!1181) #b00000000000000000000000111111111) (= (mask!26102 thiss!1181) #b00000000000000000000001111111111) (= (mask!26102 thiss!1181) #b00000000000000000000011111111111) (= (mask!26102 thiss!1181) #b00000000000000000000111111111111) (= (mask!26102 thiss!1181) #b00000000000000000001111111111111) (= (mask!26102 thiss!1181) #b00000000000000000011111111111111) (= (mask!26102 thiss!1181) #b00000000000000000111111111111111) (= (mask!26102 thiss!1181) #b00000000000000001111111111111111) (= (mask!26102 thiss!1181) #b00000000000000011111111111111111) (= (mask!26102 thiss!1181) #b00000000000000111111111111111111) (= (mask!26102 thiss!1181) #b00000000000001111111111111111111) (= (mask!26102 thiss!1181) #b00000000000011111111111111111111) (= (mask!26102 thiss!1181) #b00000000000111111111111111111111) (= (mask!26102 thiss!1181) #b00000000001111111111111111111111) (= (mask!26102 thiss!1181) #b00000000011111111111111111111111) (= (mask!26102 thiss!1181) #b00000000111111111111111111111111) (= (mask!26102 thiss!1181) #b00000001111111111111111111111111) (= (mask!26102 thiss!1181) #b00000011111111111111111111111111) (= (mask!26102 thiss!1181) #b00000111111111111111111111111111) (= (mask!26102 thiss!1181) #b00001111111111111111111111111111) (= (mask!26102 thiss!1181) #b00011111111111111111111111111111) (= (mask!26102 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26102 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897743 d!111155))

(declare-fun d!111157 () Bool)

(declare-fun res!606830 () Bool)

(declare-fun e!502135 () Bool)

(assert (=> d!111157 (=> res!606830 e!502135)))

(assert (=> d!111157 (= res!606830 (= (select (arr!25317 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111157 (= (arrayContainsKey!0 (_keys!10163 thiss!1181) key!785 #b00000000000000000000000000000000) e!502135)))

(declare-fun b!897844 () Bool)

(declare-fun e!502136 () Bool)

(assert (=> b!897844 (= e!502135 e!502136)))

(declare-fun res!606831 () Bool)

(assert (=> b!897844 (=> (not res!606831) (not e!502136))))

(assert (=> b!897844 (= res!606831 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25772 (_keys!10163 thiss!1181))))))

(declare-fun b!897845 () Bool)

(assert (=> b!897845 (= e!502136 (arrayContainsKey!0 (_keys!10163 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111157 (not res!606830)) b!897844))

(assert (= (and b!897844 res!606831) b!897845))

(assert (=> d!111157 m!834473))

(declare-fun m!834507 () Bool)

(assert (=> b!897845 m!834507))

(assert (=> b!897743 d!111157))

(declare-fun d!111159 () Bool)

(assert (=> d!111159 (arrayContainsKey!0 (_keys!10163 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405331 () Unit!30518)

(declare-fun choose!13 (array!52672 (_ BitVec 64) (_ BitVec 32)) Unit!30518)

(assert (=> d!111159 (= lt!405331 (choose!13 (_keys!10163 thiss!1181) key!785 (index!38028 lt!405291)))))

(assert (=> d!111159 (bvsge (index!38028 lt!405291) #b00000000000000000000000000000000)))

(assert (=> d!111159 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10163 thiss!1181) key!785 (index!38028 lt!405291)) lt!405331)))

(declare-fun bs!25198 () Bool)

(assert (= bs!25198 d!111159))

(assert (=> bs!25198 m!834439))

(declare-fun m!834509 () Bool)

(assert (=> bs!25198 m!834509))

(assert (=> b!897743 d!111159))

(declare-fun b!897852 () Bool)

(declare-fun e!502141 () Bool)

(assert (=> b!897852 (= e!502141 tp_is_empty!18321)))

(declare-fun b!897853 () Bool)

(declare-fun e!502142 () Bool)

(assert (=> b!897853 (= e!502142 tp_is_empty!18321)))

(declare-fun mapIsEmpty!29130 () Bool)

(declare-fun mapRes!29130 () Bool)

(assert (=> mapIsEmpty!29130 mapRes!29130))

(declare-fun condMapEmpty!29130 () Bool)

(declare-fun mapDefault!29130 () ValueCell!8679)

(assert (=> mapNonEmpty!29124 (= condMapEmpty!29130 (= mapRest!29124 ((as const (Array (_ BitVec 32) ValueCell!8679)) mapDefault!29130)))))

(assert (=> mapNonEmpty!29124 (= tp!56036 (and e!502142 mapRes!29130))))

(declare-fun mapNonEmpty!29130 () Bool)

(declare-fun tp!56045 () Bool)

(assert (=> mapNonEmpty!29130 (= mapRes!29130 (and tp!56045 e!502141))))

(declare-fun mapRest!29130 () (Array (_ BitVec 32) ValueCell!8679))

(declare-fun mapValue!29130 () ValueCell!8679)

(declare-fun mapKey!29130 () (_ BitVec 32))

(assert (=> mapNonEmpty!29130 (= mapRest!29124 (store mapRest!29130 mapKey!29130 mapValue!29130))))

(assert (= (and mapNonEmpty!29124 condMapEmpty!29130) mapIsEmpty!29130))

(assert (= (and mapNonEmpty!29124 (not condMapEmpty!29130)) mapNonEmpty!29130))

(assert (= (and mapNonEmpty!29130 ((_ is ValueCellFull!8679) mapValue!29130)) b!897852))

(assert (= (and mapNonEmpty!29124 ((_ is ValueCellFull!8679) mapDefault!29130)) b!897853))

(declare-fun m!834511 () Bool)

(assert (=> mapNonEmpty!29130 m!834511))

(check-sat (not b!897845) (not d!111159) (not b!897818) (not b!897834) (not b!897817) (not b!897805) (not b!897809) (not mapNonEmpty!29130) (not b!897807) (not b_next!15993) (not b!897816) (not b!897794) (not d!111145) (not d!111149) (not b!897792) (not b!897821) b_and!26285 tp_is_empty!18321 (not bm!39817) (not d!111147) (not bm!39820))
(check-sat b_and!26285 (not b_next!15993))
