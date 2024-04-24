; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90286 () Bool)

(assert start!90286)

(declare-fun b!1032696 () Bool)

(declare-fun b_free!20659 () Bool)

(declare-fun b_next!20659 () Bool)

(assert (=> b!1032696 (= b_free!20659 (not b_next!20659))))

(declare-fun tp!73047 () Bool)

(declare-fun b_and!33095 () Bool)

(assert (=> b!1032696 (= tp!73047 b_and!33095)))

(declare-fun b!1032692 () Bool)

(declare-fun res!690121 () Bool)

(declare-fun e!583367 () Bool)

(assert (=> b!1032692 (=> res!690121 e!583367)))

(declare-datatypes ((V!37379 0))(
  ( (V!37380 (val!12240 Int)) )
))
(declare-datatypes ((ValueCell!11486 0))(
  ( (ValueCellFull!11486 (v!14813 V!37379)) (EmptyCell!11486) )
))
(declare-datatypes ((Unit!33734 0))(
  ( (Unit!33735) )
))
(declare-datatypes ((array!64871 0))(
  ( (array!64872 (arr!31231 (Array (_ BitVec 32) (_ BitVec 64))) (size!31749 (_ BitVec 32))) )
))
(declare-datatypes ((array!64873 0))(
  ( (array!64874 (arr!31232 (Array (_ BitVec 32) ValueCell!11486)) (size!31750 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5566 0))(
  ( (LongMapFixedSize!5567 (defaultEntry!6157 Int) (mask!30013 (_ BitVec 32)) (extraKeys!5889 (_ BitVec 32)) (zeroValue!5993 V!37379) (minValue!5993 V!37379) (_size!2838 (_ BitVec 32)) (_keys!11368 array!64871) (_values!6180 array!64873) (_vacant!2838 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15658 0))(
  ( (tuple2!15659 (_1!7840 Unit!33734) (_2!7840 LongMapFixedSize!5566)) )
))
(declare-fun lt!455836 () tuple2!15658)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032692 (= res!690121 (not (validMask!0 (mask!30013 (_2!7840 lt!455836)))))))

(declare-fun b!1032693 () Bool)

(assert (=> b!1032693 (= e!583367 true)))

(declare-fun lt!455830 () Bool)

(declare-datatypes ((List!21852 0))(
  ( (Nil!21849) (Cons!21848 (h!23059 (_ BitVec 64)) (t!30998 List!21852)) )
))
(declare-fun arrayNoDuplicates!0 (array!64871 (_ BitVec 32) List!21852) Bool)

(assert (=> b!1032693 (= lt!455830 (arrayNoDuplicates!0 (_keys!11368 (_2!7840 lt!455836)) #b00000000000000000000000000000000 Nil!21849))))

(declare-fun b!1032694 () Bool)

(declare-fun e!583365 () Bool)

(assert (=> b!1032694 (= e!583365 (not e!583367))))

(declare-fun res!690125 () Bool)

(assert (=> b!1032694 (=> res!690125 e!583367)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15660 0))(
  ( (tuple2!15661 (_1!7841 (_ BitVec 64)) (_2!7841 V!37379)) )
))
(declare-datatypes ((List!21853 0))(
  ( (Nil!21850) (Cons!21849 (h!23060 tuple2!15660) (t!30999 List!21853)) )
))
(declare-datatypes ((ListLongMap!13733 0))(
  ( (ListLongMap!13734 (toList!6882 List!21853)) )
))
(declare-fun contains!6017 (ListLongMap!13733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3928 (array!64871 array!64873 (_ BitVec 32) (_ BitVec 32) V!37379 V!37379 (_ BitVec 32) Int) ListLongMap!13733)

(assert (=> b!1032694 (= res!690125 (not (contains!6017 (getCurrentListMap!3928 (_keys!11368 (_2!7840 lt!455836)) (_values!6180 (_2!7840 lt!455836)) (mask!30013 (_2!7840 lt!455836)) (extraKeys!5889 (_2!7840 lt!455836)) (zeroValue!5993 (_2!7840 lt!455836)) (minValue!5993 (_2!7840 lt!455836)) #b00000000000000000000000000000000 (defaultEntry!6157 (_2!7840 lt!455836))) key!909)))))

(declare-fun lt!455834 () array!64871)

(declare-fun lt!455827 () array!64873)

(declare-fun thiss!1427 () LongMapFixedSize!5566)

(declare-fun Unit!33736 () Unit!33734)

(declare-fun Unit!33737 () Unit!33734)

(assert (=> b!1032694 (= lt!455836 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2838 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15659 Unit!33736 (LongMapFixedSize!5567 (defaultEntry!6157 thiss!1427) (mask!30013 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) (bvsub (_size!2838 thiss!1427) #b00000000000000000000000000000001) lt!455834 lt!455827 (bvadd #b00000000000000000000000000000001 (_vacant!2838 thiss!1427)))) (tuple2!15659 Unit!33737 (LongMapFixedSize!5567 (defaultEntry!6157 thiss!1427) (mask!30013 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) (bvsub (_size!2838 thiss!1427) #b00000000000000000000000000000001) lt!455834 lt!455827 (_vacant!2838 thiss!1427)))))))

(declare-fun -!505 (ListLongMap!13733 (_ BitVec 64)) ListLongMap!13733)

(assert (=> b!1032694 (= (-!505 (getCurrentListMap!3928 (_keys!11368 thiss!1427) (_values!6180 thiss!1427) (mask!30013 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6157 thiss!1427)) key!909) (getCurrentListMap!3928 lt!455834 lt!455827 (mask!30013 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6157 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9660 0))(
  ( (MissingZero!9660 (index!41011 (_ BitVec 32))) (Found!9660 (index!41012 (_ BitVec 32))) (Intermediate!9660 (undefined!10472 Bool) (index!41013 (_ BitVec 32)) (x!91818 (_ BitVec 32))) (Undefined!9660) (MissingVacant!9660 (index!41014 (_ BitVec 32))) )
))
(declare-fun lt!455829 () SeekEntryResult!9660)

(declare-fun dynLambda!1999 (Int (_ BitVec 64)) V!37379)

(assert (=> b!1032694 (= lt!455827 (array!64874 (store (arr!31232 (_values!6180 thiss!1427)) (index!41012 lt!455829) (ValueCellFull!11486 (dynLambda!1999 (defaultEntry!6157 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31750 (_values!6180 thiss!1427))))))

(declare-fun lt!455833 () Unit!33734)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!31 (array!64871 array!64873 (_ BitVec 32) (_ BitVec 32) V!37379 V!37379 (_ BitVec 32) (_ BitVec 64) Int) Unit!33734)

(assert (=> b!1032694 (= lt!455833 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!31 (_keys!11368 thiss!1427) (_values!6180 thiss!1427) (mask!30013 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) (index!41012 lt!455829) key!909 (defaultEntry!6157 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032694 (not (arrayContainsKey!0 lt!455834 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455828 () Unit!33734)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64871 (_ BitVec 32) (_ BitVec 64)) Unit!33734)

(assert (=> b!1032694 (= lt!455828 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11368 thiss!1427) (index!41012 lt!455829) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64871 (_ BitVec 32)) Bool)

(assert (=> b!1032694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455834 (mask!30013 thiss!1427))))

(declare-fun lt!455835 () Unit!33734)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64871 (_ BitVec 32) (_ BitVec 32)) Unit!33734)

(assert (=> b!1032694 (= lt!455835 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11368 thiss!1427) (index!41012 lt!455829) (mask!30013 thiss!1427)))))

(assert (=> b!1032694 (arrayNoDuplicates!0 lt!455834 #b00000000000000000000000000000000 Nil!21849)))

(declare-fun lt!455831 () Unit!33734)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64871 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21852) Unit!33734)

(assert (=> b!1032694 (= lt!455831 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11368 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41012 lt!455829) #b00000000000000000000000000000000 Nil!21849))))

(declare-fun arrayCountValidKeys!0 (array!64871 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032694 (= (arrayCountValidKeys!0 lt!455834 #b00000000000000000000000000000000 (size!31749 (_keys!11368 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11368 thiss!1427) #b00000000000000000000000000000000 (size!31749 (_keys!11368 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032694 (= lt!455834 (array!64872 (store (arr!31231 (_keys!11368 thiss!1427)) (index!41012 lt!455829) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31749 (_keys!11368 thiss!1427))))))

(declare-fun lt!455832 () Unit!33734)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64871 (_ BitVec 32) (_ BitVec 64)) Unit!33734)

(assert (=> b!1032694 (= lt!455832 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11368 thiss!1427) (index!41012 lt!455829) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1032695 () Bool)

(declare-fun e!583366 () Bool)

(declare-fun e!583361 () Bool)

(declare-fun mapRes!38022 () Bool)

(assert (=> b!1032695 (= e!583366 (and e!583361 mapRes!38022))))

(declare-fun condMapEmpty!38022 () Bool)

(declare-fun mapDefault!38022 () ValueCell!11486)

(assert (=> b!1032695 (= condMapEmpty!38022 (= (arr!31232 (_values!6180 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11486)) mapDefault!38022)))))

(declare-fun mapNonEmpty!38022 () Bool)

(declare-fun tp!73048 () Bool)

(declare-fun e!583368 () Bool)

(assert (=> mapNonEmpty!38022 (= mapRes!38022 (and tp!73048 e!583368))))

(declare-fun mapRest!38022 () (Array (_ BitVec 32) ValueCell!11486))

(declare-fun mapValue!38022 () ValueCell!11486)

(declare-fun mapKey!38022 () (_ BitVec 32))

(assert (=> mapNonEmpty!38022 (= (arr!31232 (_values!6180 thiss!1427)) (store mapRest!38022 mapKey!38022 mapValue!38022))))

(declare-fun tp_is_empty!24379 () Bool)

(declare-fun e!583363 () Bool)

(declare-fun array_inv!24181 (array!64871) Bool)

(declare-fun array_inv!24182 (array!64873) Bool)

(assert (=> b!1032696 (= e!583363 (and tp!73047 tp_is_empty!24379 (array_inv!24181 (_keys!11368 thiss!1427)) (array_inv!24182 (_values!6180 thiss!1427)) e!583366))))

(declare-fun res!690119 () Bool)

(declare-fun e!583364 () Bool)

(assert (=> start!90286 (=> (not res!690119) (not e!583364))))

(declare-fun valid!2111 (LongMapFixedSize!5566) Bool)

(assert (=> start!90286 (= res!690119 (valid!2111 thiss!1427))))

(assert (=> start!90286 e!583364))

(assert (=> start!90286 e!583363))

(assert (=> start!90286 true))

(declare-fun b!1032697 () Bool)

(assert (=> b!1032697 (= e!583368 tp_is_empty!24379)))

(declare-fun mapIsEmpty!38022 () Bool)

(assert (=> mapIsEmpty!38022 mapRes!38022))

(declare-fun b!1032698 () Bool)

(declare-fun res!690123 () Bool)

(assert (=> b!1032698 (=> res!690123 e!583367)))

(assert (=> b!1032698 (= res!690123 (or (not (= (size!31750 (_values!6180 (_2!7840 lt!455836))) (bvadd #b00000000000000000000000000000001 (mask!30013 (_2!7840 lt!455836))))) (not (= (size!31749 (_keys!11368 (_2!7840 lt!455836))) (size!31750 (_values!6180 (_2!7840 lt!455836))))) (bvslt (mask!30013 (_2!7840 lt!455836)) #b00000000000000000000000000000000) (bvslt (extraKeys!5889 (_2!7840 lt!455836)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5889 (_2!7840 lt!455836)) #b00000000000000000000000000000011)))))

(declare-fun b!1032699 () Bool)

(declare-fun res!690120 () Bool)

(assert (=> b!1032699 (=> res!690120 e!583367)))

(assert (=> b!1032699 (= res!690120 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11368 (_2!7840 lt!455836)) (mask!30013 (_2!7840 lt!455836)))))))

(declare-fun b!1032700 () Bool)

(assert (=> b!1032700 (= e!583364 e!583365)))

(declare-fun res!690122 () Bool)

(assert (=> b!1032700 (=> (not res!690122) (not e!583365))))

(get-info :version)

(assert (=> b!1032700 (= res!690122 ((_ is Found!9660) lt!455829))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64871 (_ BitVec 32)) SeekEntryResult!9660)

(assert (=> b!1032700 (= lt!455829 (seekEntry!0 key!909 (_keys!11368 thiss!1427) (mask!30013 thiss!1427)))))

(declare-fun b!1032701 () Bool)

(declare-fun res!690124 () Bool)

(assert (=> b!1032701 (=> (not res!690124) (not e!583364))))

(assert (=> b!1032701 (= res!690124 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032702 () Bool)

(assert (=> b!1032702 (= e!583361 tp_is_empty!24379)))

(assert (= (and start!90286 res!690119) b!1032701))

(assert (= (and b!1032701 res!690124) b!1032700))

(assert (= (and b!1032700 res!690122) b!1032694))

(assert (= (and b!1032694 (not res!690125)) b!1032692))

(assert (= (and b!1032692 (not res!690121)) b!1032698))

(assert (= (and b!1032698 (not res!690123)) b!1032699))

(assert (= (and b!1032699 (not res!690120)) b!1032693))

(assert (= (and b!1032695 condMapEmpty!38022) mapIsEmpty!38022))

(assert (= (and b!1032695 (not condMapEmpty!38022)) mapNonEmpty!38022))

(assert (= (and mapNonEmpty!38022 ((_ is ValueCellFull!11486) mapValue!38022)) b!1032697))

(assert (= (and b!1032695 ((_ is ValueCellFull!11486) mapDefault!38022)) b!1032702))

(assert (= b!1032696 b!1032695))

(assert (= start!90286 b!1032696))

(declare-fun b_lambda!16013 () Bool)

(assert (=> (not b_lambda!16013) (not b!1032694)))

(declare-fun t!30997 () Bool)

(declare-fun tb!6969 () Bool)

(assert (=> (and b!1032696 (= (defaultEntry!6157 thiss!1427) (defaultEntry!6157 thiss!1427)) t!30997) tb!6969))

(declare-fun result!14275 () Bool)

(assert (=> tb!6969 (= result!14275 tp_is_empty!24379)))

(assert (=> b!1032694 t!30997))

(declare-fun b_and!33097 () Bool)

(assert (= b_and!33095 (and (=> t!30997 result!14275) b_and!33097)))

(declare-fun m!953129 () Bool)

(assert (=> b!1032694 m!953129))

(declare-fun m!953131 () Bool)

(assert (=> b!1032694 m!953131))

(declare-fun m!953133 () Bool)

(assert (=> b!1032694 m!953133))

(declare-fun m!953135 () Bool)

(assert (=> b!1032694 m!953135))

(declare-fun m!953137 () Bool)

(assert (=> b!1032694 m!953137))

(declare-fun m!953139 () Bool)

(assert (=> b!1032694 m!953139))

(declare-fun m!953141 () Bool)

(assert (=> b!1032694 m!953141))

(assert (=> b!1032694 m!953141))

(declare-fun m!953143 () Bool)

(assert (=> b!1032694 m!953143))

(declare-fun m!953145 () Bool)

(assert (=> b!1032694 m!953145))

(declare-fun m!953147 () Bool)

(assert (=> b!1032694 m!953147))

(declare-fun m!953149 () Bool)

(assert (=> b!1032694 m!953149))

(declare-fun m!953151 () Bool)

(assert (=> b!1032694 m!953151))

(declare-fun m!953153 () Bool)

(assert (=> b!1032694 m!953153))

(declare-fun m!953155 () Bool)

(assert (=> b!1032694 m!953155))

(declare-fun m!953157 () Bool)

(assert (=> b!1032694 m!953157))

(assert (=> b!1032694 m!953137))

(declare-fun m!953159 () Bool)

(assert (=> b!1032694 m!953159))

(declare-fun m!953161 () Bool)

(assert (=> b!1032694 m!953161))

(declare-fun m!953163 () Bool)

(assert (=> b!1032694 m!953163))

(declare-fun m!953165 () Bool)

(assert (=> b!1032693 m!953165))

(declare-fun m!953167 () Bool)

(assert (=> b!1032692 m!953167))

(declare-fun m!953169 () Bool)

(assert (=> mapNonEmpty!38022 m!953169))

(declare-fun m!953171 () Bool)

(assert (=> b!1032700 m!953171))

(declare-fun m!953173 () Bool)

(assert (=> start!90286 m!953173))

(declare-fun m!953175 () Bool)

(assert (=> b!1032696 m!953175))

(declare-fun m!953177 () Bool)

(assert (=> b!1032696 m!953177))

(declare-fun m!953179 () Bool)

(assert (=> b!1032699 m!953179))

(check-sat (not b!1032700) b_and!33097 (not mapNonEmpty!38022) (not b!1032699) (not b!1032693) (not b_next!20659) tp_is_empty!24379 (not b!1032696) (not start!90286) (not b!1032694) (not b!1032692) (not b_lambda!16013))
(check-sat b_and!33097 (not b_next!20659))
