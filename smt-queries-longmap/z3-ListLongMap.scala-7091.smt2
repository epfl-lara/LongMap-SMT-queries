; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89888 () Bool)

(assert start!89888)

(declare-fun b!1029718 () Bool)

(declare-fun b_free!20601 () Bool)

(declare-fun b_next!20601 () Bool)

(assert (=> b!1029718 (= b_free!20601 (not b_next!20601))))

(declare-fun tp!72866 () Bool)

(declare-fun b_and!32945 () Bool)

(assert (=> b!1029718 (= tp!72866 b_and!32945)))

(declare-fun b!1029717 () Bool)

(declare-fun e!581397 () Bool)

(declare-fun e!581399 () Bool)

(assert (=> b!1029717 (= e!581397 (not e!581399))))

(declare-fun res!688732 () Bool)

(assert (=> b!1029717 (=> res!688732 e!581399)))

(declare-datatypes ((V!37301 0))(
  ( (V!37302 (val!12211 Int)) )
))
(declare-datatypes ((ValueCell!11457 0))(
  ( (ValueCellFull!11457 (v!14786 V!37301)) (EmptyCell!11457) )
))
(declare-datatypes ((Unit!33629 0))(
  ( (Unit!33630) )
))
(declare-datatypes ((array!64702 0))(
  ( (array!64703 (arr!31155 (Array (_ BitVec 32) (_ BitVec 64))) (size!31671 (_ BitVec 32))) )
))
(declare-datatypes ((array!64704 0))(
  ( (array!64705 (arr!31156 (Array (_ BitVec 32) ValueCell!11457)) (size!31672 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5508 0))(
  ( (LongMapFixedSize!5509 (defaultEntry!6122 Int) (mask!29885 (_ BitVec 32)) (extraKeys!5854 (_ BitVec 32)) (zeroValue!5958 V!37301) (minValue!5958 V!37301) (_size!2809 (_ BitVec 32)) (_keys!11288 array!64702) (_values!6145 array!64704) (_vacant!2809 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15570 0))(
  ( (tuple2!15571 (_1!7796 Unit!33629) (_2!7796 LongMapFixedSize!5508)) )
))
(declare-fun lt!454004 () tuple2!15570)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1029717 (= res!688732 (not (validMask!0 (mask!29885 (_2!7796 lt!454004)))))))

(declare-fun lt!454000 () array!64704)

(declare-fun lt!453998 () array!64702)

(declare-fun thiss!1427 () LongMapFixedSize!5508)

(declare-fun Unit!33631 () Unit!33629)

(declare-fun Unit!33632 () Unit!33629)

(assert (=> b!1029717 (= lt!454004 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2809 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15571 Unit!33631 (LongMapFixedSize!5509 (defaultEntry!6122 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (bvsub (_size!2809 thiss!1427) #b00000000000000000000000000000001) lt!453998 lt!454000 (bvadd #b00000000000000000000000000000001 (_vacant!2809 thiss!1427)))) (tuple2!15571 Unit!33632 (LongMapFixedSize!5509 (defaultEntry!6122 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (bvsub (_size!2809 thiss!1427) #b00000000000000000000000000000001) lt!453998 lt!454000 (_vacant!2809 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15572 0))(
  ( (tuple2!15573 (_1!7797 (_ BitVec 64)) (_2!7797 V!37301)) )
))
(declare-datatypes ((List!21829 0))(
  ( (Nil!21826) (Cons!21825 (h!23026 tuple2!15572) (t!30925 List!21829)) )
))
(declare-datatypes ((ListLongMap!13689 0))(
  ( (ListLongMap!13690 (toList!6860 List!21829)) )
))
(declare-fun -!487 (ListLongMap!13689 (_ BitVec 64)) ListLongMap!13689)

(declare-fun getCurrentListMap!3908 (array!64702 array!64704 (_ BitVec 32) (_ BitVec 32) V!37301 V!37301 (_ BitVec 32) Int) ListLongMap!13689)

(assert (=> b!1029717 (= (-!487 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)) key!909) (getCurrentListMap!3908 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9686 0))(
  ( (MissingZero!9686 (index!41115 (_ BitVec 32))) (Found!9686 (index!41116 (_ BitVec 32))) (Intermediate!9686 (undefined!10498 Bool) (index!41117 (_ BitVec 32)) (x!91636 (_ BitVec 32))) (Undefined!9686) (MissingVacant!9686 (index!41118 (_ BitVec 32))) )
))
(declare-fun lt!454003 () SeekEntryResult!9686)

(declare-fun dynLambda!1957 (Int (_ BitVec 64)) V!37301)

(assert (=> b!1029717 (= lt!454000 (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))))))

(declare-fun lt!454001 () Unit!33629)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!13 (array!64702 array!64704 (_ BitVec 32) (_ BitVec 32) V!37301 V!37301 (_ BitVec 32) (_ BitVec 64) Int) Unit!33629)

(assert (=> b!1029717 (= lt!454001 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!13 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (index!41116 lt!454003) key!909 (defaultEntry!6122 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1029717 (not (arrayContainsKey!0 lt!453998 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453999 () Unit!33629)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64702 (_ BitVec 32) (_ BitVec 64)) Unit!33629)

(assert (=> b!1029717 (= lt!453999 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11288 thiss!1427) (index!41116 lt!454003) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64702 (_ BitVec 32)) Bool)

(assert (=> b!1029717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453998 (mask!29885 thiss!1427))))

(declare-fun lt!454002 () Unit!33629)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64702 (_ BitVec 32) (_ BitVec 32)) Unit!33629)

(assert (=> b!1029717 (= lt!454002 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11288 thiss!1427) (index!41116 lt!454003) (mask!29885 thiss!1427)))))

(declare-datatypes ((List!21830 0))(
  ( (Nil!21827) (Cons!21826 (h!23027 (_ BitVec 64)) (t!30926 List!21830)) )
))
(declare-fun arrayNoDuplicates!0 (array!64702 (_ BitVec 32) List!21830) Bool)

(assert (=> b!1029717 (arrayNoDuplicates!0 lt!453998 #b00000000000000000000000000000000 Nil!21827)))

(declare-fun lt!454005 () Unit!33629)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64702 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21830) Unit!33629)

(assert (=> b!1029717 (= lt!454005 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11288 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41116 lt!454003) #b00000000000000000000000000000000 Nil!21827))))

(declare-fun arrayCountValidKeys!0 (array!64702 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029717 (= (arrayCountValidKeys!0 lt!453998 #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11288 thiss!1427) #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1029717 (= lt!453998 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun lt!454006 () Unit!33629)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64702 (_ BitVec 32) (_ BitVec 64)) Unit!33629)

(assert (=> b!1029717 (= lt!454006 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11288 thiss!1427) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581396 () Bool)

(declare-fun tp_is_empty!24321 () Bool)

(declare-fun e!581398 () Bool)

(declare-fun array_inv!24117 (array!64702) Bool)

(declare-fun array_inv!24118 (array!64704) Bool)

(assert (=> b!1029718 (= e!581398 (and tp!72866 tp_is_empty!24321 (array_inv!24117 (_keys!11288 thiss!1427)) (array_inv!24118 (_values!6145 thiss!1427)) e!581396))))

(declare-fun b!1029720 () Bool)

(declare-fun res!688733 () Bool)

(declare-fun e!581394 () Bool)

(assert (=> b!1029720 (=> (not res!688733) (not e!581394))))

(assert (=> b!1029720 (= res!688733 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37928 () Bool)

(declare-fun mapRes!37928 () Bool)

(declare-fun tp!72867 () Bool)

(declare-fun e!581395 () Bool)

(assert (=> mapNonEmpty!37928 (= mapRes!37928 (and tp!72867 e!581395))))

(declare-fun mapValue!37928 () ValueCell!11457)

(declare-fun mapKey!37928 () (_ BitVec 32))

(declare-fun mapRest!37928 () (Array (_ BitVec 32) ValueCell!11457))

(assert (=> mapNonEmpty!37928 (= (arr!31156 (_values!6145 thiss!1427)) (store mapRest!37928 mapKey!37928 mapValue!37928))))

(declare-fun b!1029721 () Bool)

(declare-fun e!581401 () Bool)

(assert (=> b!1029721 (= e!581396 (and e!581401 mapRes!37928))))

(declare-fun condMapEmpty!37928 () Bool)

(declare-fun mapDefault!37928 () ValueCell!11457)

(assert (=> b!1029721 (= condMapEmpty!37928 (= (arr!31156 (_values!6145 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11457)) mapDefault!37928)))))

(declare-fun b!1029722 () Bool)

(assert (=> b!1029722 (= e!581395 tp_is_empty!24321)))

(declare-fun b!1029723 () Bool)

(assert (=> b!1029723 (= e!581401 tp_is_empty!24321)))

(declare-fun mapIsEmpty!37928 () Bool)

(assert (=> mapIsEmpty!37928 mapRes!37928))

(declare-fun b!1029724 () Bool)

(assert (=> b!1029724 (= e!581394 e!581397)))

(declare-fun res!688731 () Bool)

(assert (=> b!1029724 (=> (not res!688731) (not e!581397))))

(get-info :version)

(assert (=> b!1029724 (= res!688731 ((_ is Found!9686) lt!454003))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64702 (_ BitVec 32)) SeekEntryResult!9686)

(assert (=> b!1029724 (= lt!454003 (seekEntry!0 key!909 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)))))

(declare-fun res!688730 () Bool)

(assert (=> start!89888 (=> (not res!688730) (not e!581394))))

(declare-fun valid!2086 (LongMapFixedSize!5508) Bool)

(assert (=> start!89888 (= res!688730 (valid!2086 thiss!1427))))

(assert (=> start!89888 e!581394))

(assert (=> start!89888 e!581398))

(assert (=> start!89888 true))

(declare-fun b!1029719 () Bool)

(assert (=> b!1029719 (= e!581399 (or (not (= (size!31672 (_values!6145 (_2!7796 lt!454004))) (bvadd #b00000000000000000000000000000001 (mask!29885 (_2!7796 lt!454004))))) (not (= (size!31671 (_keys!11288 (_2!7796 lt!454004))) (size!31672 (_values!6145 (_2!7796 lt!454004))))) (bvslt (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000000000000000) (bvslt (extraKeys!5854 (_2!7796 lt!454004)) #b00000000000000000000000000000000) (bvsle (extraKeys!5854 (_2!7796 lt!454004)) #b00000000000000000000000000000011)))))

(assert (= (and start!89888 res!688730) b!1029720))

(assert (= (and b!1029720 res!688733) b!1029724))

(assert (= (and b!1029724 res!688731) b!1029717))

(assert (= (and b!1029717 (not res!688732)) b!1029719))

(assert (= (and b!1029721 condMapEmpty!37928) mapIsEmpty!37928))

(assert (= (and b!1029721 (not condMapEmpty!37928)) mapNonEmpty!37928))

(assert (= (and mapNonEmpty!37928 ((_ is ValueCellFull!11457) mapValue!37928)) b!1029722))

(assert (= (and b!1029721 ((_ is ValueCellFull!11457) mapDefault!37928)) b!1029723))

(assert (= b!1029718 b!1029721))

(assert (= start!89888 b!1029718))

(declare-fun b_lambda!15893 () Bool)

(assert (=> (not b_lambda!15893) (not b!1029717)))

(declare-fun t!30924 () Bool)

(declare-fun tb!6919 () Bool)

(assert (=> (and b!1029718 (= (defaultEntry!6122 thiss!1427) (defaultEntry!6122 thiss!1427)) t!30924) tb!6919))

(declare-fun result!14163 () Bool)

(assert (=> tb!6919 (= result!14163 tp_is_empty!24321)))

(assert (=> b!1029717 t!30924))

(declare-fun b_and!32947 () Bool)

(assert (= b_and!32945 (and (=> t!30924 result!14163) b_and!32947)))

(declare-fun m!949119 () Bool)

(assert (=> b!1029717 m!949119))

(declare-fun m!949121 () Bool)

(assert (=> b!1029717 m!949121))

(declare-fun m!949123 () Bool)

(assert (=> b!1029717 m!949123))

(declare-fun m!949125 () Bool)

(assert (=> b!1029717 m!949125))

(declare-fun m!949127 () Bool)

(assert (=> b!1029717 m!949127))

(declare-fun m!949129 () Bool)

(assert (=> b!1029717 m!949129))

(declare-fun m!949131 () Bool)

(assert (=> b!1029717 m!949131))

(declare-fun m!949133 () Bool)

(assert (=> b!1029717 m!949133))

(declare-fun m!949135 () Bool)

(assert (=> b!1029717 m!949135))

(declare-fun m!949137 () Bool)

(assert (=> b!1029717 m!949137))

(declare-fun m!949139 () Bool)

(assert (=> b!1029717 m!949139))

(declare-fun m!949141 () Bool)

(assert (=> b!1029717 m!949141))

(declare-fun m!949143 () Bool)

(assert (=> b!1029717 m!949143))

(declare-fun m!949145 () Bool)

(assert (=> b!1029717 m!949145))

(declare-fun m!949147 () Bool)

(assert (=> b!1029717 m!949147))

(assert (=> b!1029717 m!949127))

(declare-fun m!949149 () Bool)

(assert (=> b!1029717 m!949149))

(declare-fun m!949151 () Bool)

(assert (=> b!1029717 m!949151))

(declare-fun m!949153 () Bool)

(assert (=> start!89888 m!949153))

(declare-fun m!949155 () Bool)

(assert (=> b!1029718 m!949155))

(declare-fun m!949157 () Bool)

(assert (=> b!1029718 m!949157))

(declare-fun m!949159 () Bool)

(assert (=> mapNonEmpty!37928 m!949159))

(declare-fun m!949161 () Bool)

(assert (=> b!1029724 m!949161))

(check-sat tp_is_empty!24321 b_and!32947 (not start!89888) (not b_lambda!15893) (not b!1029718) (not b_next!20601) (not mapNonEmpty!37928) (not b!1029717) (not b!1029724))
(check-sat b_and!32947 (not b_next!20601))
(get-model)

(declare-fun b_lambda!15897 () Bool)

(assert (= b_lambda!15893 (or (and b!1029718 b_free!20601) b_lambda!15897)))

(check-sat (not b_lambda!15897) tp_is_empty!24321 b_and!32947 (not start!89888) (not b!1029718) (not b_next!20601) (not mapNonEmpty!37928) (not b!1029717) (not b!1029724))
(check-sat b_and!32947 (not b_next!20601))
(get-model)

(declare-fun d!123389 () Bool)

(declare-fun res!688752 () Bool)

(declare-fun e!581428 () Bool)

(assert (=> d!123389 (=> (not res!688752) (not e!581428))))

(declare-fun simpleValid!395 (LongMapFixedSize!5508) Bool)

(assert (=> d!123389 (= res!688752 (simpleValid!395 thiss!1427))))

(assert (=> d!123389 (= (valid!2086 thiss!1427) e!581428)))

(declare-fun b!1029759 () Bool)

(declare-fun res!688753 () Bool)

(assert (=> b!1029759 (=> (not res!688753) (not e!581428))))

(assert (=> b!1029759 (= res!688753 (= (arrayCountValidKeys!0 (_keys!11288 thiss!1427) #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) (_size!2809 thiss!1427)))))

(declare-fun b!1029760 () Bool)

(declare-fun res!688754 () Bool)

(assert (=> b!1029760 (=> (not res!688754) (not e!581428))))

(assert (=> b!1029760 (= res!688754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)))))

(declare-fun b!1029761 () Bool)

(assert (=> b!1029761 (= e!581428 (arrayNoDuplicates!0 (_keys!11288 thiss!1427) #b00000000000000000000000000000000 Nil!21827))))

(assert (= (and d!123389 res!688752) b!1029759))

(assert (= (and b!1029759 res!688753) b!1029760))

(assert (= (and b!1029760 res!688754) b!1029761))

(declare-fun m!949207 () Bool)

(assert (=> d!123389 m!949207))

(assert (=> b!1029759 m!949141))

(declare-fun m!949209 () Bool)

(assert (=> b!1029760 m!949209))

(declare-fun m!949211 () Bool)

(assert (=> b!1029761 m!949211))

(assert (=> start!89888 d!123389))

(declare-fun d!123391 () Bool)

(declare-fun lt!454042 () SeekEntryResult!9686)

(assert (=> d!123391 (and (or ((_ is MissingVacant!9686) lt!454042) (not ((_ is Found!9686) lt!454042)) (and (bvsge (index!41116 lt!454042) #b00000000000000000000000000000000) (bvslt (index!41116 lt!454042) (size!31671 (_keys!11288 thiss!1427))))) (not ((_ is MissingVacant!9686) lt!454042)) (or (not ((_ is Found!9686) lt!454042)) (= (select (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454042)) key!909)))))

(declare-fun e!581437 () SeekEntryResult!9686)

(assert (=> d!123391 (= lt!454042 e!581437)))

(declare-fun c!104060 () Bool)

(declare-fun lt!454044 () SeekEntryResult!9686)

(assert (=> d!123391 (= c!104060 (and ((_ is Intermediate!9686) lt!454044) (undefined!10498 lt!454044)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64702 (_ BitVec 32)) SeekEntryResult!9686)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123391 (= lt!454044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29885 thiss!1427)) key!909 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)))))

(assert (=> d!123391 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123391 (= (seekEntry!0 key!909 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)) lt!454042)))

(declare-fun b!1029774 () Bool)

(assert (=> b!1029774 (= e!581437 Undefined!9686)))

(declare-fun b!1029775 () Bool)

(declare-fun e!581435 () SeekEntryResult!9686)

(assert (=> b!1029775 (= e!581435 (Found!9686 (index!41117 lt!454044)))))

(declare-fun b!1029776 () Bool)

(assert (=> b!1029776 (= e!581437 e!581435)))

(declare-fun lt!454045 () (_ BitVec 64))

(assert (=> b!1029776 (= lt!454045 (select (arr!31155 (_keys!11288 thiss!1427)) (index!41117 lt!454044)))))

(declare-fun c!104059 () Bool)

(assert (=> b!1029776 (= c!104059 (= lt!454045 key!909))))

(declare-fun b!1029777 () Bool)

(declare-fun e!581436 () SeekEntryResult!9686)

(declare-fun lt!454043 () SeekEntryResult!9686)

(assert (=> b!1029777 (= e!581436 (ite ((_ is MissingVacant!9686) lt!454043) (MissingZero!9686 (index!41118 lt!454043)) lt!454043))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64702 (_ BitVec 32)) SeekEntryResult!9686)

(assert (=> b!1029777 (= lt!454043 (seekKeyOrZeroReturnVacant!0 (x!91636 lt!454044) (index!41117 lt!454044) (index!41117 lt!454044) key!909 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)))))

(declare-fun b!1029778 () Bool)

(assert (=> b!1029778 (= e!581436 (MissingZero!9686 (index!41117 lt!454044)))))

(declare-fun b!1029779 () Bool)

(declare-fun c!104058 () Bool)

(assert (=> b!1029779 (= c!104058 (= lt!454045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029779 (= e!581435 e!581436)))

(assert (= (and d!123391 c!104060) b!1029774))

(assert (= (and d!123391 (not c!104060)) b!1029776))

(assert (= (and b!1029776 c!104059) b!1029775))

(assert (= (and b!1029776 (not c!104059)) b!1029779))

(assert (= (and b!1029779 c!104058) b!1029778))

(assert (= (and b!1029779 (not c!104058)) b!1029777))

(declare-fun m!949213 () Bool)

(assert (=> d!123391 m!949213))

(declare-fun m!949215 () Bool)

(assert (=> d!123391 m!949215))

(assert (=> d!123391 m!949215))

(declare-fun m!949217 () Bool)

(assert (=> d!123391 m!949217))

(declare-fun m!949219 () Bool)

(assert (=> d!123391 m!949219))

(declare-fun m!949221 () Bool)

(assert (=> b!1029776 m!949221))

(declare-fun m!949223 () Bool)

(assert (=> b!1029777 m!949223))

(assert (=> b!1029724 d!123391))

(declare-fun d!123393 () Bool)

(declare-fun e!581440 () Bool)

(assert (=> d!123393 e!581440))

(declare-fun res!688757 () Bool)

(assert (=> d!123393 (=> (not res!688757) (not e!581440))))

(assert (=> d!123393 (= res!688757 (and (bvsge (index!41116 lt!454003) #b00000000000000000000000000000000) (bvslt (index!41116 lt!454003) (size!31671 (_keys!11288 thiss!1427)))))))

(declare-fun lt!454048 () Unit!33629)

(declare-fun choose!53 (array!64702 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21830) Unit!33629)

(assert (=> d!123393 (= lt!454048 (choose!53 (_keys!11288 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41116 lt!454003) #b00000000000000000000000000000000 Nil!21827))))

(assert (=> d!123393 (bvslt (size!31671 (_keys!11288 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123393 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11288 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41116 lt!454003) #b00000000000000000000000000000000 Nil!21827) lt!454048)))

(declare-fun b!1029782 () Bool)

(assert (=> b!1029782 (= e!581440 (arrayNoDuplicates!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) #b00000000000000000000000000000000 Nil!21827))))

(assert (= (and d!123393 res!688757) b!1029782))

(declare-fun m!949225 () Bool)

(assert (=> d!123393 m!949225))

(assert (=> b!1029782 m!949121))

(declare-fun m!949227 () Bool)

(assert (=> b!1029782 m!949227))

(assert (=> b!1029717 d!123393))

(declare-fun b!1029825 () Bool)

(declare-fun e!581474 () ListLongMap!13689)

(declare-fun call!43511 () ListLongMap!13689)

(assert (=> b!1029825 (= e!581474 call!43511)))

(declare-fun b!1029826 () Bool)

(declare-fun e!581472 () Unit!33629)

(declare-fun Unit!33633 () Unit!33629)

(assert (=> b!1029826 (= e!581472 Unit!33633)))

(declare-fun b!1029827 () Bool)

(declare-fun e!581478 () Bool)

(declare-fun lt!454107 () ListLongMap!13689)

(declare-fun apply!904 (ListLongMap!13689 (_ BitVec 64)) V!37301)

(assert (=> b!1029827 (= e!581478 (= (apply!904 lt!454107 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5958 thiss!1427)))))

(declare-fun b!1029828 () Bool)

(declare-fun e!581469 () ListLongMap!13689)

(declare-fun call!43507 () ListLongMap!13689)

(declare-fun +!3102 (ListLongMap!13689 tuple2!15572) ListLongMap!13689)

(assert (=> b!1029828 (= e!581469 (+!3102 call!43507 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))

(declare-fun b!1029829 () Bool)

(declare-fun e!581473 () Bool)

(declare-fun call!43509 () Bool)

(assert (=> b!1029829 (= e!581473 (not call!43509))))

(declare-fun b!1029830 () Bool)

(declare-fun e!581476 () Bool)

(declare-fun get!16362 (ValueCell!11457 V!37301) V!37301)

(assert (=> b!1029830 (= e!581476 (= (apply!904 lt!454107 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)) (get!16362 (select (arr!31156 (_values!6145 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31672 (_values!6145 thiss!1427))))))

(assert (=> b!1029830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun bm!43504 () Bool)

(assert (=> bm!43504 (= call!43511 call!43507)))

(declare-fun bm!43505 () Bool)

(declare-fun contains!5975 (ListLongMap!13689 (_ BitVec 64)) Bool)

(assert (=> bm!43505 (= call!43509 (contains!5975 lt!454107 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029831 () Bool)

(declare-fun e!581471 () Bool)

(declare-fun call!43513 () Bool)

(assert (=> b!1029831 (= e!581471 (not call!43513))))

(declare-fun d!123395 () Bool)

(declare-fun e!581479 () Bool)

(assert (=> d!123395 e!581479))

(declare-fun res!688780 () Bool)

(assert (=> d!123395 (=> (not res!688780) (not e!581479))))

(assert (=> d!123395 (= res!688780 (or (bvsge #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))))

(declare-fun lt!454106 () ListLongMap!13689)

(assert (=> d!123395 (= lt!454107 lt!454106)))

(declare-fun lt!454103 () Unit!33629)

(assert (=> d!123395 (= lt!454103 e!581472)))

(declare-fun c!104078 () Bool)

(declare-fun e!581468 () Bool)

(assert (=> d!123395 (= c!104078 e!581468)))

(declare-fun res!688776 () Bool)

(assert (=> d!123395 (=> (not res!688776) (not e!581468))))

(assert (=> d!123395 (= res!688776 (bvslt #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123395 (= lt!454106 e!581469)))

(declare-fun c!104074 () Bool)

(assert (=> d!123395 (= c!104074 (and (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123395 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123395 (= (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)) lt!454107)))

(declare-fun b!1029832 () Bool)

(declare-fun res!688781 () Bool)

(assert (=> b!1029832 (=> (not res!688781) (not e!581479))))

(assert (=> b!1029832 (= res!688781 e!581471)))

(declare-fun c!104077 () Bool)

(assert (=> b!1029832 (= c!104077 (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43506 () Bool)

(declare-fun call!43512 () ListLongMap!13689)

(declare-fun getCurrentListMapNoExtraKeys!3518 (array!64702 array!64704 (_ BitVec 32) (_ BitVec 32) V!37301 V!37301 (_ BitVec 32) Int) ListLongMap!13689)

(assert (=> bm!43506 (= call!43512 (getCurrentListMapNoExtraKeys!3518 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun b!1029833 () Bool)

(declare-fun e!581470 () Bool)

(assert (=> b!1029833 (= e!581470 (= (apply!904 lt!454107 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5958 thiss!1427)))))

(declare-fun b!1029834 () Bool)

(declare-fun lt!454105 () Unit!33629)

(assert (=> b!1029834 (= e!581472 lt!454105)))

(declare-fun lt!454114 () ListLongMap!13689)

(assert (=> b!1029834 (= lt!454114 (getCurrentListMapNoExtraKeys!3518 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454110 () (_ BitVec 64))

(assert (=> b!1029834 (= lt!454110 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454101 () (_ BitVec 64))

(assert (=> b!1029834 (= lt!454101 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454108 () Unit!33629)

(declare-fun addStillContains!623 (ListLongMap!13689 (_ BitVec 64) V!37301 (_ BitVec 64)) Unit!33629)

(assert (=> b!1029834 (= lt!454108 (addStillContains!623 lt!454114 lt!454110 (zeroValue!5958 thiss!1427) lt!454101))))

(assert (=> b!1029834 (contains!5975 (+!3102 lt!454114 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427))) lt!454101)))

(declare-fun lt!454100 () Unit!33629)

(assert (=> b!1029834 (= lt!454100 lt!454108)))

(declare-fun lt!454094 () ListLongMap!13689)

(assert (=> b!1029834 (= lt!454094 (getCurrentListMapNoExtraKeys!3518 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454113 () (_ BitVec 64))

(assert (=> b!1029834 (= lt!454113 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454095 () (_ BitVec 64))

(assert (=> b!1029834 (= lt!454095 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454112 () Unit!33629)

(declare-fun addApplyDifferent!483 (ListLongMap!13689 (_ BitVec 64) V!37301 (_ BitVec 64)) Unit!33629)

(assert (=> b!1029834 (= lt!454112 (addApplyDifferent!483 lt!454094 lt!454113 (minValue!5958 thiss!1427) lt!454095))))

(assert (=> b!1029834 (= (apply!904 (+!3102 lt!454094 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427))) lt!454095) (apply!904 lt!454094 lt!454095))))

(declare-fun lt!454104 () Unit!33629)

(assert (=> b!1029834 (= lt!454104 lt!454112)))

(declare-fun lt!454093 () ListLongMap!13689)

(assert (=> b!1029834 (= lt!454093 (getCurrentListMapNoExtraKeys!3518 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454097 () (_ BitVec 64))

(assert (=> b!1029834 (= lt!454097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454109 () (_ BitVec 64))

(assert (=> b!1029834 (= lt!454109 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454096 () Unit!33629)

(assert (=> b!1029834 (= lt!454096 (addApplyDifferent!483 lt!454093 lt!454097 (zeroValue!5958 thiss!1427) lt!454109))))

(assert (=> b!1029834 (= (apply!904 (+!3102 lt!454093 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427))) lt!454109) (apply!904 lt!454093 lt!454109))))

(declare-fun lt!454098 () Unit!33629)

(assert (=> b!1029834 (= lt!454098 lt!454096)))

(declare-fun lt!454099 () ListLongMap!13689)

(assert (=> b!1029834 (= lt!454099 (getCurrentListMapNoExtraKeys!3518 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454102 () (_ BitVec 64))

(assert (=> b!1029834 (= lt!454102 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454111 () (_ BitVec 64))

(assert (=> b!1029834 (= lt!454111 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029834 (= lt!454105 (addApplyDifferent!483 lt!454099 lt!454102 (minValue!5958 thiss!1427) lt!454111))))

(assert (=> b!1029834 (= (apply!904 (+!3102 lt!454099 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427))) lt!454111) (apply!904 lt!454099 lt!454111))))

(declare-fun bm!43507 () Bool)

(declare-fun call!43508 () ListLongMap!13689)

(assert (=> bm!43507 (= call!43508 call!43512)))

(declare-fun b!1029835 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1029835 (= e!581468 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029836 () Bool)

(declare-fun c!104073 () Bool)

(assert (=> b!1029836 (= c!104073 (and (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581467 () ListLongMap!13689)

(assert (=> b!1029836 (= e!581467 e!581474)))

(declare-fun b!1029837 () Bool)

(declare-fun e!581475 () Bool)

(assert (=> b!1029837 (= e!581475 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029838 () Bool)

(assert (=> b!1029838 (= e!581479 e!581473)))

(declare-fun c!104075 () Bool)

(assert (=> b!1029838 (= c!104075 (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029839 () Bool)

(assert (=> b!1029839 (= e!581471 e!581478)))

(declare-fun res!688782 () Bool)

(assert (=> b!1029839 (= res!688782 call!43513)))

(assert (=> b!1029839 (=> (not res!688782) (not e!581478))))

(declare-fun bm!43508 () Bool)

(declare-fun call!43510 () ListLongMap!13689)

(assert (=> bm!43508 (= call!43510 call!43508)))

(declare-fun b!1029840 () Bool)

(assert (=> b!1029840 (= e!581467 call!43511)))

(declare-fun b!1029841 () Bool)

(declare-fun e!581477 () Bool)

(assert (=> b!1029841 (= e!581477 e!581476)))

(declare-fun res!688778 () Bool)

(assert (=> b!1029841 (=> (not res!688778) (not e!581476))))

(assert (=> b!1029841 (= res!688778 (contains!5975 lt!454107 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun b!1029842 () Bool)

(assert (=> b!1029842 (= e!581473 e!581470)))

(declare-fun res!688777 () Bool)

(assert (=> b!1029842 (= res!688777 call!43509)))

(assert (=> b!1029842 (=> (not res!688777) (not e!581470))))

(declare-fun b!1029843 () Bool)

(assert (=> b!1029843 (= e!581474 call!43510)))

(declare-fun b!1029844 () Bool)

(declare-fun res!688783 () Bool)

(assert (=> b!1029844 (=> (not res!688783) (not e!581479))))

(assert (=> b!1029844 (= res!688783 e!581477)))

(declare-fun res!688779 () Bool)

(assert (=> b!1029844 (=> res!688779 e!581477)))

(assert (=> b!1029844 (= res!688779 (not e!581475))))

(declare-fun res!688784 () Bool)

(assert (=> b!1029844 (=> (not res!688784) (not e!581475))))

(assert (=> b!1029844 (= res!688784 (bvslt #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun b!1029845 () Bool)

(assert (=> b!1029845 (= e!581469 e!581467)))

(declare-fun c!104076 () Bool)

(assert (=> b!1029845 (= c!104076 (and (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43509 () Bool)

(assert (=> bm!43509 (= call!43513 (contains!5975 lt!454107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43510 () Bool)

(assert (=> bm!43510 (= call!43507 (+!3102 (ite c!104074 call!43512 (ite c!104076 call!43508 call!43510)) (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (= (and d!123395 c!104074) b!1029828))

(assert (= (and d!123395 (not c!104074)) b!1029845))

(assert (= (and b!1029845 c!104076) b!1029840))

(assert (= (and b!1029845 (not c!104076)) b!1029836))

(assert (= (and b!1029836 c!104073) b!1029825))

(assert (= (and b!1029836 (not c!104073)) b!1029843))

(assert (= (or b!1029825 b!1029843) bm!43508))

(assert (= (or b!1029840 bm!43508) bm!43507))

(assert (= (or b!1029840 b!1029825) bm!43504))

(assert (= (or b!1029828 bm!43507) bm!43506))

(assert (= (or b!1029828 bm!43504) bm!43510))

(assert (= (and d!123395 res!688776) b!1029835))

(assert (= (and d!123395 c!104078) b!1029834))

(assert (= (and d!123395 (not c!104078)) b!1029826))

(assert (= (and d!123395 res!688780) b!1029844))

(assert (= (and b!1029844 res!688784) b!1029837))

(assert (= (and b!1029844 (not res!688779)) b!1029841))

(assert (= (and b!1029841 res!688778) b!1029830))

(assert (= (and b!1029844 res!688783) b!1029832))

(assert (= (and b!1029832 c!104077) b!1029839))

(assert (= (and b!1029832 (not c!104077)) b!1029831))

(assert (= (and b!1029839 res!688782) b!1029827))

(assert (= (or b!1029839 b!1029831) bm!43509))

(assert (= (and b!1029832 res!688781) b!1029838))

(assert (= (and b!1029838 c!104075) b!1029842))

(assert (= (and b!1029838 (not c!104075)) b!1029829))

(assert (= (and b!1029842 res!688777) b!1029833))

(assert (= (or b!1029842 b!1029829) bm!43505))

(declare-fun b_lambda!15899 () Bool)

(assert (=> (not b_lambda!15899) (not b!1029830)))

(assert (=> b!1029830 t!30924))

(declare-fun b_and!32953 () Bool)

(assert (= b_and!32947 (and (=> t!30924 result!14163) b_and!32953)))

(declare-fun m!949229 () Bool)

(assert (=> bm!43506 m!949229))

(declare-fun m!949231 () Bool)

(assert (=> bm!43509 m!949231))

(declare-fun m!949233 () Bool)

(assert (=> b!1029837 m!949233))

(assert (=> b!1029837 m!949233))

(declare-fun m!949235 () Bool)

(assert (=> b!1029837 m!949235))

(declare-fun m!949237 () Bool)

(assert (=> bm!43505 m!949237))

(declare-fun m!949239 () Bool)

(assert (=> b!1029827 m!949239))

(declare-fun m!949241 () Bool)

(assert (=> b!1029834 m!949241))

(declare-fun m!949243 () Bool)

(assert (=> b!1029834 m!949243))

(declare-fun m!949245 () Bool)

(assert (=> b!1029834 m!949245))

(assert (=> b!1029834 m!949229))

(declare-fun m!949247 () Bool)

(assert (=> b!1029834 m!949247))

(declare-fun m!949249 () Bool)

(assert (=> b!1029834 m!949249))

(declare-fun m!949251 () Bool)

(assert (=> b!1029834 m!949251))

(declare-fun m!949253 () Bool)

(assert (=> b!1029834 m!949253))

(assert (=> b!1029834 m!949241))

(declare-fun m!949255 () Bool)

(assert (=> b!1029834 m!949255))

(declare-fun m!949257 () Bool)

(assert (=> b!1029834 m!949257))

(declare-fun m!949259 () Bool)

(assert (=> b!1029834 m!949259))

(assert (=> b!1029834 m!949233))

(assert (=> b!1029834 m!949253))

(declare-fun m!949261 () Bool)

(assert (=> b!1029834 m!949261))

(declare-fun m!949263 () Bool)

(assert (=> b!1029834 m!949263))

(declare-fun m!949265 () Bool)

(assert (=> b!1029834 m!949265))

(assert (=> b!1029834 m!949259))

(declare-fun m!949267 () Bool)

(assert (=> b!1029834 m!949267))

(assert (=> b!1029834 m!949247))

(declare-fun m!949269 () Bool)

(assert (=> b!1029834 m!949269))

(declare-fun m!949271 () Bool)

(assert (=> b!1029828 m!949271))

(assert (=> b!1029841 m!949233))

(assert (=> b!1029841 m!949233))

(declare-fun m!949273 () Bool)

(assert (=> b!1029841 m!949273))

(declare-fun m!949275 () Bool)

(assert (=> b!1029833 m!949275))

(assert (=> d!123395 m!949219))

(assert (=> b!1029835 m!949233))

(assert (=> b!1029835 m!949233))

(assert (=> b!1029835 m!949235))

(declare-fun m!949277 () Bool)

(assert (=> bm!43510 m!949277))

(assert (=> b!1029830 m!949233))

(declare-fun m!949279 () Bool)

(assert (=> b!1029830 m!949279))

(assert (=> b!1029830 m!949279))

(assert (=> b!1029830 m!949151))

(declare-fun m!949281 () Bool)

(assert (=> b!1029830 m!949281))

(assert (=> b!1029830 m!949233))

(declare-fun m!949283 () Bool)

(assert (=> b!1029830 m!949283))

(assert (=> b!1029830 m!949151))

(assert (=> b!1029717 d!123395))

(declare-fun d!123397 () Bool)

(declare-fun lt!454117 () ListLongMap!13689)

(assert (=> d!123397 (not (contains!5975 lt!454117 key!909))))

(declare-fun removeStrictlySorted!54 (List!21829 (_ BitVec 64)) List!21829)

(assert (=> d!123397 (= lt!454117 (ListLongMap!13690 (removeStrictlySorted!54 (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427))) key!909)))))

(assert (=> d!123397 (= (-!487 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)) key!909) lt!454117)))

(declare-fun bs!30085 () Bool)

(assert (= bs!30085 d!123397))

(declare-fun m!949285 () Bool)

(assert (=> bs!30085 m!949285))

(declare-fun m!949287 () Bool)

(assert (=> bs!30085 m!949287))

(assert (=> b!1029717 d!123397))

(declare-fun b!1029846 () Bool)

(declare-fun e!581487 () ListLongMap!13689)

(declare-fun call!43518 () ListLongMap!13689)

(assert (=> b!1029846 (= e!581487 call!43518)))

(declare-fun b!1029847 () Bool)

(declare-fun e!581485 () Unit!33629)

(declare-fun Unit!33634 () Unit!33629)

(assert (=> b!1029847 (= e!581485 Unit!33634)))

(declare-fun b!1029848 () Bool)

(declare-fun e!581491 () Bool)

(declare-fun lt!454132 () ListLongMap!13689)

(assert (=> b!1029848 (= e!581491 (= (apply!904 lt!454132 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5958 thiss!1427)))))

(declare-fun b!1029849 () Bool)

(declare-fun e!581482 () ListLongMap!13689)

(declare-fun call!43514 () ListLongMap!13689)

(assert (=> b!1029849 (= e!581482 (+!3102 call!43514 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))

(declare-fun b!1029850 () Bool)

(declare-fun e!581486 () Bool)

(declare-fun call!43516 () Bool)

(assert (=> b!1029850 (= e!581486 (not call!43516))))

(declare-fun b!1029851 () Bool)

(declare-fun e!581489 () Bool)

(assert (=> b!1029851 (= e!581489 (= (apply!904 lt!454132 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)) (get!16362 (select (arr!31156 lt!454000) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029851 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31672 lt!454000)))))

(assert (=> b!1029851 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(declare-fun bm!43511 () Bool)

(assert (=> bm!43511 (= call!43518 call!43514)))

(declare-fun bm!43512 () Bool)

(assert (=> bm!43512 (= call!43516 (contains!5975 lt!454132 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029852 () Bool)

(declare-fun e!581484 () Bool)

(declare-fun call!43520 () Bool)

(assert (=> b!1029852 (= e!581484 (not call!43520))))

(declare-fun d!123399 () Bool)

(declare-fun e!581492 () Bool)

(assert (=> d!123399 e!581492))

(declare-fun res!688789 () Bool)

(assert (=> d!123399 (=> (not res!688789) (not e!581492))))

(assert (=> d!123399 (= res!688789 (or (bvsge #b00000000000000000000000000000000 (size!31671 lt!453998)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 lt!453998)))))))

(declare-fun lt!454131 () ListLongMap!13689)

(assert (=> d!123399 (= lt!454132 lt!454131)))

(declare-fun lt!454128 () Unit!33629)

(assert (=> d!123399 (= lt!454128 e!581485)))

(declare-fun c!104084 () Bool)

(declare-fun e!581481 () Bool)

(assert (=> d!123399 (= c!104084 e!581481)))

(declare-fun res!688785 () Bool)

(assert (=> d!123399 (=> (not res!688785) (not e!581481))))

(assert (=> d!123399 (= res!688785 (bvslt #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(assert (=> d!123399 (= lt!454131 e!581482)))

(declare-fun c!104080 () Bool)

(assert (=> d!123399 (= c!104080 (and (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123399 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123399 (= (getCurrentListMap!3908 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)) lt!454132)))

(declare-fun b!1029853 () Bool)

(declare-fun res!688790 () Bool)

(assert (=> b!1029853 (=> (not res!688790) (not e!581492))))

(assert (=> b!1029853 (= res!688790 e!581484)))

(declare-fun c!104083 () Bool)

(assert (=> b!1029853 (= c!104083 (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43513 () Bool)

(declare-fun call!43519 () ListLongMap!13689)

(assert (=> bm!43513 (= call!43519 (getCurrentListMapNoExtraKeys!3518 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun b!1029854 () Bool)

(declare-fun e!581483 () Bool)

(assert (=> b!1029854 (= e!581483 (= (apply!904 lt!454132 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5958 thiss!1427)))))

(declare-fun b!1029855 () Bool)

(declare-fun lt!454130 () Unit!33629)

(assert (=> b!1029855 (= e!581485 lt!454130)))

(declare-fun lt!454139 () ListLongMap!13689)

(assert (=> b!1029855 (= lt!454139 (getCurrentListMapNoExtraKeys!3518 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454135 () (_ BitVec 64))

(assert (=> b!1029855 (= lt!454135 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454126 () (_ BitVec 64))

(assert (=> b!1029855 (= lt!454126 (select (arr!31155 lt!453998) #b00000000000000000000000000000000))))

(declare-fun lt!454133 () Unit!33629)

(assert (=> b!1029855 (= lt!454133 (addStillContains!623 lt!454139 lt!454135 (zeroValue!5958 thiss!1427) lt!454126))))

(assert (=> b!1029855 (contains!5975 (+!3102 lt!454139 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427))) lt!454126)))

(declare-fun lt!454125 () Unit!33629)

(assert (=> b!1029855 (= lt!454125 lt!454133)))

(declare-fun lt!454119 () ListLongMap!13689)

(assert (=> b!1029855 (= lt!454119 (getCurrentListMapNoExtraKeys!3518 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454138 () (_ BitVec 64))

(assert (=> b!1029855 (= lt!454138 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454120 () (_ BitVec 64))

(assert (=> b!1029855 (= lt!454120 (select (arr!31155 lt!453998) #b00000000000000000000000000000000))))

(declare-fun lt!454137 () Unit!33629)

(assert (=> b!1029855 (= lt!454137 (addApplyDifferent!483 lt!454119 lt!454138 (minValue!5958 thiss!1427) lt!454120))))

(assert (=> b!1029855 (= (apply!904 (+!3102 lt!454119 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427))) lt!454120) (apply!904 lt!454119 lt!454120))))

(declare-fun lt!454129 () Unit!33629)

(assert (=> b!1029855 (= lt!454129 lt!454137)))

(declare-fun lt!454118 () ListLongMap!13689)

(assert (=> b!1029855 (= lt!454118 (getCurrentListMapNoExtraKeys!3518 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454122 () (_ BitVec 64))

(assert (=> b!1029855 (= lt!454122 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454134 () (_ BitVec 64))

(assert (=> b!1029855 (= lt!454134 (select (arr!31155 lt!453998) #b00000000000000000000000000000000))))

(declare-fun lt!454121 () Unit!33629)

(assert (=> b!1029855 (= lt!454121 (addApplyDifferent!483 lt!454118 lt!454122 (zeroValue!5958 thiss!1427) lt!454134))))

(assert (=> b!1029855 (= (apply!904 (+!3102 lt!454118 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427))) lt!454134) (apply!904 lt!454118 lt!454134))))

(declare-fun lt!454123 () Unit!33629)

(assert (=> b!1029855 (= lt!454123 lt!454121)))

(declare-fun lt!454124 () ListLongMap!13689)

(assert (=> b!1029855 (= lt!454124 (getCurrentListMapNoExtraKeys!3518 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454127 () (_ BitVec 64))

(assert (=> b!1029855 (= lt!454127 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454136 () (_ BitVec 64))

(assert (=> b!1029855 (= lt!454136 (select (arr!31155 lt!453998) #b00000000000000000000000000000000))))

(assert (=> b!1029855 (= lt!454130 (addApplyDifferent!483 lt!454124 lt!454127 (minValue!5958 thiss!1427) lt!454136))))

(assert (=> b!1029855 (= (apply!904 (+!3102 lt!454124 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427))) lt!454136) (apply!904 lt!454124 lt!454136))))

(declare-fun bm!43514 () Bool)

(declare-fun call!43515 () ListLongMap!13689)

(assert (=> bm!43514 (= call!43515 call!43519)))

(declare-fun b!1029856 () Bool)

(assert (=> b!1029856 (= e!581481 (validKeyInArray!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun b!1029857 () Bool)

(declare-fun c!104079 () Bool)

(assert (=> b!1029857 (= c!104079 (and (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581480 () ListLongMap!13689)

(assert (=> b!1029857 (= e!581480 e!581487)))

(declare-fun b!1029858 () Bool)

(declare-fun e!581488 () Bool)

(assert (=> b!1029858 (= e!581488 (validKeyInArray!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun b!1029859 () Bool)

(assert (=> b!1029859 (= e!581492 e!581486)))

(declare-fun c!104081 () Bool)

(assert (=> b!1029859 (= c!104081 (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029860 () Bool)

(assert (=> b!1029860 (= e!581484 e!581491)))

(declare-fun res!688791 () Bool)

(assert (=> b!1029860 (= res!688791 call!43520)))

(assert (=> b!1029860 (=> (not res!688791) (not e!581491))))

(declare-fun bm!43515 () Bool)

(declare-fun call!43517 () ListLongMap!13689)

(assert (=> bm!43515 (= call!43517 call!43515)))

(declare-fun b!1029861 () Bool)

(assert (=> b!1029861 (= e!581480 call!43518)))

(declare-fun b!1029862 () Bool)

(declare-fun e!581490 () Bool)

(assert (=> b!1029862 (= e!581490 e!581489)))

(declare-fun res!688787 () Bool)

(assert (=> b!1029862 (=> (not res!688787) (not e!581489))))

(assert (=> b!1029862 (= res!688787 (contains!5975 lt!454132 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(assert (=> b!1029862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(declare-fun b!1029863 () Bool)

(assert (=> b!1029863 (= e!581486 e!581483)))

(declare-fun res!688786 () Bool)

(assert (=> b!1029863 (= res!688786 call!43516)))

(assert (=> b!1029863 (=> (not res!688786) (not e!581483))))

(declare-fun b!1029864 () Bool)

(assert (=> b!1029864 (= e!581487 call!43517)))

(declare-fun b!1029865 () Bool)

(declare-fun res!688792 () Bool)

(assert (=> b!1029865 (=> (not res!688792) (not e!581492))))

(assert (=> b!1029865 (= res!688792 e!581490)))

(declare-fun res!688788 () Bool)

(assert (=> b!1029865 (=> res!688788 e!581490)))

(assert (=> b!1029865 (= res!688788 (not e!581488))))

(declare-fun res!688793 () Bool)

(assert (=> b!1029865 (=> (not res!688793) (not e!581488))))

(assert (=> b!1029865 (= res!688793 (bvslt #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(declare-fun b!1029866 () Bool)

(assert (=> b!1029866 (= e!581482 e!581480)))

(declare-fun c!104082 () Bool)

(assert (=> b!1029866 (= c!104082 (and (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43516 () Bool)

(assert (=> bm!43516 (= call!43520 (contains!5975 lt!454132 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43517 () Bool)

(assert (=> bm!43517 (= call!43514 (+!3102 (ite c!104080 call!43519 (ite c!104082 call!43515 call!43517)) (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (= (and d!123399 c!104080) b!1029849))

(assert (= (and d!123399 (not c!104080)) b!1029866))

(assert (= (and b!1029866 c!104082) b!1029861))

(assert (= (and b!1029866 (not c!104082)) b!1029857))

(assert (= (and b!1029857 c!104079) b!1029846))

(assert (= (and b!1029857 (not c!104079)) b!1029864))

(assert (= (or b!1029846 b!1029864) bm!43515))

(assert (= (or b!1029861 bm!43515) bm!43514))

(assert (= (or b!1029861 b!1029846) bm!43511))

(assert (= (or b!1029849 bm!43514) bm!43513))

(assert (= (or b!1029849 bm!43511) bm!43517))

(assert (= (and d!123399 res!688785) b!1029856))

(assert (= (and d!123399 c!104084) b!1029855))

(assert (= (and d!123399 (not c!104084)) b!1029847))

(assert (= (and d!123399 res!688789) b!1029865))

(assert (= (and b!1029865 res!688793) b!1029858))

(assert (= (and b!1029865 (not res!688788)) b!1029862))

(assert (= (and b!1029862 res!688787) b!1029851))

(assert (= (and b!1029865 res!688792) b!1029853))

(assert (= (and b!1029853 c!104083) b!1029860))

(assert (= (and b!1029853 (not c!104083)) b!1029852))

(assert (= (and b!1029860 res!688791) b!1029848))

(assert (= (or b!1029860 b!1029852) bm!43516))

(assert (= (and b!1029853 res!688790) b!1029859))

(assert (= (and b!1029859 c!104081) b!1029863))

(assert (= (and b!1029859 (not c!104081)) b!1029850))

(assert (= (and b!1029863 res!688786) b!1029854))

(assert (= (or b!1029863 b!1029850) bm!43512))

(declare-fun b_lambda!15901 () Bool)

(assert (=> (not b_lambda!15901) (not b!1029851)))

(assert (=> b!1029851 t!30924))

(declare-fun b_and!32955 () Bool)

(assert (= b_and!32953 (and (=> t!30924 result!14163) b_and!32955)))

(declare-fun m!949289 () Bool)

(assert (=> bm!43513 m!949289))

(declare-fun m!949291 () Bool)

(assert (=> bm!43516 m!949291))

(declare-fun m!949293 () Bool)

(assert (=> b!1029858 m!949293))

(assert (=> b!1029858 m!949293))

(declare-fun m!949295 () Bool)

(assert (=> b!1029858 m!949295))

(declare-fun m!949297 () Bool)

(assert (=> bm!43512 m!949297))

(declare-fun m!949299 () Bool)

(assert (=> b!1029848 m!949299))

(declare-fun m!949301 () Bool)

(assert (=> b!1029855 m!949301))

(declare-fun m!949303 () Bool)

(assert (=> b!1029855 m!949303))

(declare-fun m!949305 () Bool)

(assert (=> b!1029855 m!949305))

(assert (=> b!1029855 m!949289))

(declare-fun m!949307 () Bool)

(assert (=> b!1029855 m!949307))

(declare-fun m!949309 () Bool)

(assert (=> b!1029855 m!949309))

(declare-fun m!949311 () Bool)

(assert (=> b!1029855 m!949311))

(declare-fun m!949313 () Bool)

(assert (=> b!1029855 m!949313))

(assert (=> b!1029855 m!949301))

(declare-fun m!949315 () Bool)

(assert (=> b!1029855 m!949315))

(declare-fun m!949317 () Bool)

(assert (=> b!1029855 m!949317))

(declare-fun m!949319 () Bool)

(assert (=> b!1029855 m!949319))

(assert (=> b!1029855 m!949293))

(assert (=> b!1029855 m!949313))

(declare-fun m!949321 () Bool)

(assert (=> b!1029855 m!949321))

(declare-fun m!949323 () Bool)

(assert (=> b!1029855 m!949323))

(declare-fun m!949325 () Bool)

(assert (=> b!1029855 m!949325))

(assert (=> b!1029855 m!949319))

(declare-fun m!949327 () Bool)

(assert (=> b!1029855 m!949327))

(assert (=> b!1029855 m!949307))

(declare-fun m!949329 () Bool)

(assert (=> b!1029855 m!949329))

(declare-fun m!949331 () Bool)

(assert (=> b!1029849 m!949331))

(assert (=> b!1029862 m!949293))

(assert (=> b!1029862 m!949293))

(declare-fun m!949333 () Bool)

(assert (=> b!1029862 m!949333))

(declare-fun m!949335 () Bool)

(assert (=> b!1029854 m!949335))

(assert (=> d!123399 m!949219))

(assert (=> b!1029856 m!949293))

(assert (=> b!1029856 m!949293))

(assert (=> b!1029856 m!949295))

(declare-fun m!949337 () Bool)

(assert (=> bm!43517 m!949337))

(assert (=> b!1029851 m!949293))

(declare-fun m!949339 () Bool)

(assert (=> b!1029851 m!949339))

(assert (=> b!1029851 m!949339))

(assert (=> b!1029851 m!949151))

(declare-fun m!949341 () Bool)

(assert (=> b!1029851 m!949341))

(assert (=> b!1029851 m!949293))

(declare-fun m!949343 () Bool)

(assert (=> b!1029851 m!949343))

(assert (=> b!1029851 m!949151))

(assert (=> b!1029717 d!123399))

(declare-fun d!123401 () Bool)

(declare-fun e!581495 () Bool)

(assert (=> d!123401 e!581495))

(declare-fun res!688796 () Bool)

(assert (=> d!123401 (=> (not res!688796) (not e!581495))))

(assert (=> d!123401 (= res!688796 (and (bvsge (index!41116 lt!454003) #b00000000000000000000000000000000) (bvslt (index!41116 lt!454003) (size!31671 (_keys!11288 thiss!1427)))))))

(declare-fun lt!454142 () Unit!33629)

(declare-fun choose!1692 (array!64702 array!64704 (_ BitVec 32) (_ BitVec 32) V!37301 V!37301 (_ BitVec 32) (_ BitVec 64) Int) Unit!33629)

(assert (=> d!123401 (= lt!454142 (choose!1692 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (index!41116 lt!454003) key!909 (defaultEntry!6122 thiss!1427)))))

(assert (=> d!123401 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123401 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!13 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (index!41116 lt!454003) key!909 (defaultEntry!6122 thiss!1427)) lt!454142)))

(declare-fun b!1029869 () Bool)

(assert (=> b!1029869 (= e!581495 (= (-!487 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)) key!909) (getCurrentListMap!3908 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427))))))

(assert (=> b!1029869 (bvslt (index!41116 lt!454003) (size!31672 (_values!6145 thiss!1427)))))

(assert (= (and d!123401 res!688796) b!1029869))

(declare-fun b_lambda!15903 () Bool)

(assert (=> (not b_lambda!15903) (not b!1029869)))

(assert (=> b!1029869 t!30924))

(declare-fun b_and!32957 () Bool)

(assert (= b_and!32955 (and (=> t!30924 result!14163) b_and!32957)))

(declare-fun m!949345 () Bool)

(assert (=> d!123401 m!949345))

(assert (=> d!123401 m!949219))

(assert (=> b!1029869 m!949145))

(assert (=> b!1029869 m!949127))

(assert (=> b!1029869 m!949121))

(assert (=> b!1029869 m!949151))

(declare-fun m!949347 () Bool)

(assert (=> b!1029869 m!949347))

(assert (=> b!1029869 m!949127))

(assert (=> b!1029869 m!949129))

(assert (=> b!1029717 d!123401))

(declare-fun b!1029881 () Bool)

(declare-fun e!581500 () Bool)

(assert (=> b!1029881 (= e!581500 (= (arrayCountValidKeys!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11288 thiss!1427) #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!123403 () Bool)

(assert (=> d!123403 e!581500))

(declare-fun res!688805 () Bool)

(assert (=> d!123403 (=> (not res!688805) (not e!581500))))

(assert (=> d!123403 (= res!688805 (and (bvsge (index!41116 lt!454003) #b00000000000000000000000000000000) (bvslt (index!41116 lt!454003) (size!31671 (_keys!11288 thiss!1427)))))))

(declare-fun lt!454145 () Unit!33629)

(declare-fun choose!82 (array!64702 (_ BitVec 32) (_ BitVec 64)) Unit!33629)

(assert (=> d!123403 (= lt!454145 (choose!82 (_keys!11288 thiss!1427) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581501 () Bool)

(assert (=> d!123403 e!581501))

(declare-fun res!688807 () Bool)

(assert (=> d!123403 (=> (not res!688807) (not e!581501))))

(assert (=> d!123403 (= res!688807 (and (bvsge (index!41116 lt!454003) #b00000000000000000000000000000000) (bvslt (index!41116 lt!454003) (size!31671 (_keys!11288 thiss!1427)))))))

(assert (=> d!123403 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11288 thiss!1427) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) lt!454145)))

(declare-fun b!1029880 () Bool)

(assert (=> b!1029880 (= e!581501 (bvslt (size!31671 (_keys!11288 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1029879 () Bool)

(declare-fun res!688808 () Bool)

(assert (=> b!1029879 (=> (not res!688808) (not e!581501))))

(assert (=> b!1029879 (= res!688808 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029878 () Bool)

(declare-fun res!688806 () Bool)

(assert (=> b!1029878 (=> (not res!688806) (not e!581501))))

(assert (=> b!1029878 (= res!688806 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003))))))

(assert (= (and d!123403 res!688807) b!1029878))

(assert (= (and b!1029878 res!688806) b!1029879))

(assert (= (and b!1029879 res!688808) b!1029880))

(assert (= (and d!123403 res!688805) b!1029881))

(assert (=> b!1029881 m!949121))

(declare-fun m!949349 () Bool)

(assert (=> b!1029881 m!949349))

(assert (=> b!1029881 m!949141))

(declare-fun m!949351 () Bool)

(assert (=> d!123403 m!949351))

(declare-fun m!949353 () Bool)

(assert (=> b!1029879 m!949353))

(declare-fun m!949355 () Bool)

(assert (=> b!1029878 m!949355))

(assert (=> b!1029878 m!949355))

(declare-fun m!949357 () Bool)

(assert (=> b!1029878 m!949357))

(assert (=> b!1029717 d!123403))

(declare-fun d!123405 () Bool)

(declare-fun e!581504 () Bool)

(assert (=> d!123405 e!581504))

(declare-fun res!688811 () Bool)

(assert (=> d!123405 (=> (not res!688811) (not e!581504))))

(assert (=> d!123405 (= res!688811 (and (bvsge (index!41116 lt!454003) #b00000000000000000000000000000000) (bvslt (index!41116 lt!454003) (size!31671 (_keys!11288 thiss!1427)))))))

(declare-fun lt!454148 () Unit!33629)

(declare-fun choose!25 (array!64702 (_ BitVec 32) (_ BitVec 32)) Unit!33629)

(assert (=> d!123405 (= lt!454148 (choose!25 (_keys!11288 thiss!1427) (index!41116 lt!454003) (mask!29885 thiss!1427)))))

(assert (=> d!123405 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123405 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11288 thiss!1427) (index!41116 lt!454003) (mask!29885 thiss!1427)) lt!454148)))

(declare-fun b!1029884 () Bool)

(assert (=> b!1029884 (= e!581504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (mask!29885 thiss!1427)))))

(assert (= (and d!123405 res!688811) b!1029884))

(declare-fun m!949359 () Bool)

(assert (=> d!123405 m!949359))

(assert (=> d!123405 m!949219))

(assert (=> b!1029884 m!949121))

(declare-fun m!949361 () Bool)

(assert (=> b!1029884 m!949361))

(assert (=> b!1029717 d!123405))

(declare-fun b!1029893 () Bool)

(declare-fun e!581509 () (_ BitVec 32))

(declare-fun call!43523 () (_ BitVec 32))

(assert (=> b!1029893 (= e!581509 call!43523)))

(declare-fun d!123407 () Bool)

(declare-fun lt!454151 () (_ BitVec 32))

(assert (=> d!123407 (and (bvsge lt!454151 #b00000000000000000000000000000000) (bvsle lt!454151 (bvsub (size!31671 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581510 () (_ BitVec 32))

(assert (=> d!123407 (= lt!454151 e!581510)))

(declare-fun c!104089 () Bool)

(assert (=> d!123407 (= c!104089 (bvsge #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123407 (and (bvsle #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31671 (_keys!11288 thiss!1427)) (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123407 (= (arrayCountValidKeys!0 (_keys!11288 thiss!1427) #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) lt!454151)))

(declare-fun bm!43520 () Bool)

(assert (=> bm!43520 (= call!43523 (arrayCountValidKeys!0 (_keys!11288 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun b!1029894 () Bool)

(assert (=> b!1029894 (= e!581510 #b00000000000000000000000000000000)))

(declare-fun b!1029895 () Bool)

(assert (=> b!1029895 (= e!581509 (bvadd #b00000000000000000000000000000001 call!43523))))

(declare-fun b!1029896 () Bool)

(assert (=> b!1029896 (= e!581510 e!581509)))

(declare-fun c!104090 () Bool)

(assert (=> b!1029896 (= c!104090 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123407 c!104089) b!1029894))

(assert (= (and d!123407 (not c!104089)) b!1029896))

(assert (= (and b!1029896 c!104090) b!1029895))

(assert (= (and b!1029896 (not c!104090)) b!1029893))

(assert (= (or b!1029895 b!1029893) bm!43520))

(declare-fun m!949363 () Bool)

(assert (=> bm!43520 m!949363))

(assert (=> b!1029896 m!949233))

(assert (=> b!1029896 m!949233))

(assert (=> b!1029896 m!949235))

(assert (=> b!1029717 d!123407))

(declare-fun d!123409 () Bool)

(declare-fun e!581513 () Bool)

(assert (=> d!123409 e!581513))

(declare-fun res!688814 () Bool)

(assert (=> d!123409 (=> (not res!688814) (not e!581513))))

(assert (=> d!123409 (= res!688814 (bvslt (index!41116 lt!454003) (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun lt!454154 () Unit!33629)

(declare-fun choose!121 (array!64702 (_ BitVec 32) (_ BitVec 64)) Unit!33629)

(assert (=> d!123409 (= lt!454154 (choose!121 (_keys!11288 thiss!1427) (index!41116 lt!454003) key!909))))

(assert (=> d!123409 (bvsge (index!41116 lt!454003) #b00000000000000000000000000000000)))

(assert (=> d!123409 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11288 thiss!1427) (index!41116 lt!454003) key!909) lt!454154)))

(declare-fun b!1029899 () Bool)

(assert (=> b!1029899 (= e!581513 (not (arrayContainsKey!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123409 res!688814) b!1029899))

(declare-fun m!949365 () Bool)

(assert (=> d!123409 m!949365))

(assert (=> b!1029899 m!949121))

(declare-fun m!949367 () Bool)

(assert (=> b!1029899 m!949367))

(assert (=> b!1029717 d!123409))

(declare-fun b!1029908 () Bool)

(declare-fun e!581522 () Bool)

(declare-fun e!581521 () Bool)

(assert (=> b!1029908 (= e!581522 e!581521)))

(declare-fun c!104093 () Bool)

(assert (=> b!1029908 (= c!104093 (validKeyInArray!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun bm!43523 () Bool)

(declare-fun call!43526 () Bool)

(assert (=> bm!43523 (= call!43526 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453998 (mask!29885 thiss!1427)))))

(declare-fun b!1029909 () Bool)

(declare-fun e!581520 () Bool)

(assert (=> b!1029909 (= e!581520 call!43526)))

(declare-fun d!123411 () Bool)

(declare-fun res!688820 () Bool)

(assert (=> d!123411 (=> res!688820 e!581522)))

(assert (=> d!123411 (= res!688820 (bvsge #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(assert (=> d!123411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453998 (mask!29885 thiss!1427)) e!581522)))

(declare-fun b!1029910 () Bool)

(assert (=> b!1029910 (= e!581521 e!581520)))

(declare-fun lt!454162 () (_ BitVec 64))

(assert (=> b!1029910 (= lt!454162 (select (arr!31155 lt!453998) #b00000000000000000000000000000000))))

(declare-fun lt!454163 () Unit!33629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64702 (_ BitVec 64) (_ BitVec 32)) Unit!33629)

(assert (=> b!1029910 (= lt!454163 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453998 lt!454162 #b00000000000000000000000000000000))))

(assert (=> b!1029910 (arrayContainsKey!0 lt!453998 lt!454162 #b00000000000000000000000000000000)))

(declare-fun lt!454161 () Unit!33629)

(assert (=> b!1029910 (= lt!454161 lt!454163)))

(declare-fun res!688819 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64702 (_ BitVec 32)) SeekEntryResult!9686)

(assert (=> b!1029910 (= res!688819 (= (seekEntryOrOpen!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000) lt!453998 (mask!29885 thiss!1427)) (Found!9686 #b00000000000000000000000000000000)))))

(assert (=> b!1029910 (=> (not res!688819) (not e!581520))))

(declare-fun b!1029911 () Bool)

(assert (=> b!1029911 (= e!581521 call!43526)))

(assert (= (and d!123411 (not res!688820)) b!1029908))

(assert (= (and b!1029908 c!104093) b!1029910))

(assert (= (and b!1029908 (not c!104093)) b!1029911))

(assert (= (and b!1029910 res!688819) b!1029909))

(assert (= (or b!1029909 b!1029911) bm!43523))

(assert (=> b!1029908 m!949293))

(assert (=> b!1029908 m!949293))

(assert (=> b!1029908 m!949295))

(declare-fun m!949369 () Bool)

(assert (=> bm!43523 m!949369))

(assert (=> b!1029910 m!949293))

(declare-fun m!949371 () Bool)

(assert (=> b!1029910 m!949371))

(declare-fun m!949373 () Bool)

(assert (=> b!1029910 m!949373))

(assert (=> b!1029910 m!949293))

(declare-fun m!949375 () Bool)

(assert (=> b!1029910 m!949375))

(assert (=> b!1029717 d!123411))

(declare-fun bm!43526 () Bool)

(declare-fun call!43529 () Bool)

(declare-fun c!104096 () Bool)

(assert (=> bm!43526 (= call!43529 (arrayNoDuplicates!0 lt!453998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104096 (Cons!21826 (select (arr!31155 lt!453998) #b00000000000000000000000000000000) Nil!21827) Nil!21827)))))

(declare-fun d!123413 () Bool)

(declare-fun res!688829 () Bool)

(declare-fun e!581533 () Bool)

(assert (=> d!123413 (=> res!688829 e!581533)))

(assert (=> d!123413 (= res!688829 (bvsge #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(assert (=> d!123413 (= (arrayNoDuplicates!0 lt!453998 #b00000000000000000000000000000000 Nil!21827) e!581533)))

(declare-fun b!1029922 () Bool)

(declare-fun e!581531 () Bool)

(assert (=> b!1029922 (= e!581531 call!43529)))

(declare-fun b!1029923 () Bool)

(declare-fun e!581532 () Bool)

(assert (=> b!1029923 (= e!581532 e!581531)))

(assert (=> b!1029923 (= c!104096 (validKeyInArray!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun b!1029924 () Bool)

(declare-fun e!581534 () Bool)

(declare-fun contains!5976 (List!21830 (_ BitVec 64)) Bool)

(assert (=> b!1029924 (= e!581534 (contains!5976 Nil!21827 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun b!1029925 () Bool)

(assert (=> b!1029925 (= e!581533 e!581532)))

(declare-fun res!688827 () Bool)

(assert (=> b!1029925 (=> (not res!688827) (not e!581532))))

(assert (=> b!1029925 (= res!688827 (not e!581534))))

(declare-fun res!688828 () Bool)

(assert (=> b!1029925 (=> (not res!688828) (not e!581534))))

(assert (=> b!1029925 (= res!688828 (validKeyInArray!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun b!1029926 () Bool)

(assert (=> b!1029926 (= e!581531 call!43529)))

(assert (= (and d!123413 (not res!688829)) b!1029925))

(assert (= (and b!1029925 res!688828) b!1029924))

(assert (= (and b!1029925 res!688827) b!1029923))

(assert (= (and b!1029923 c!104096) b!1029926))

(assert (= (and b!1029923 (not c!104096)) b!1029922))

(assert (= (or b!1029926 b!1029922) bm!43526))

(assert (=> bm!43526 m!949293))

(declare-fun m!949377 () Bool)

(assert (=> bm!43526 m!949377))

(assert (=> b!1029923 m!949293))

(assert (=> b!1029923 m!949293))

(assert (=> b!1029923 m!949295))

(assert (=> b!1029924 m!949293))

(assert (=> b!1029924 m!949293))

(declare-fun m!949379 () Bool)

(assert (=> b!1029924 m!949379))

(assert (=> b!1029925 m!949293))

(assert (=> b!1029925 m!949293))

(assert (=> b!1029925 m!949295))

(assert (=> b!1029717 d!123413))

(declare-fun d!123415 () Bool)

(assert (=> d!123415 (= (validMask!0 (mask!29885 (_2!7796 lt!454004))) (and (or (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000000000000111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000000000001111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000000000011111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000000000111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000000001111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000000011111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000000111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000001111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000011111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000000111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000001111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000011111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000000111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000001111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000011111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000000111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000001111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000011111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000000111111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000001111111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000011111111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000000111111111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000001111111111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000011111111111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00000111111111111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00001111111111111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00011111111111111111111111111111) (= (mask!29885 (_2!7796 lt!454004)) #b00111111111111111111111111111111)) (bvsle (mask!29885 (_2!7796 lt!454004)) #b00111111111111111111111111111111)))))

(assert (=> b!1029717 d!123415))

(declare-fun d!123417 () Bool)

(declare-fun res!688834 () Bool)

(declare-fun e!581539 () Bool)

(assert (=> d!123417 (=> res!688834 e!581539)))

(assert (=> d!123417 (= res!688834 (= (select (arr!31155 lt!453998) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123417 (= (arrayContainsKey!0 lt!453998 key!909 #b00000000000000000000000000000000) e!581539)))

(declare-fun b!1029931 () Bool)

(declare-fun e!581540 () Bool)

(assert (=> b!1029931 (= e!581539 e!581540)))

(declare-fun res!688835 () Bool)

(assert (=> b!1029931 (=> (not res!688835) (not e!581540))))

(assert (=> b!1029931 (= res!688835 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 lt!453998)))))

(declare-fun b!1029932 () Bool)

(assert (=> b!1029932 (= e!581540 (arrayContainsKey!0 lt!453998 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123417 (not res!688834)) b!1029931))

(assert (= (and b!1029931 res!688835) b!1029932))

(assert (=> d!123417 m!949293))

(declare-fun m!949381 () Bool)

(assert (=> b!1029932 m!949381))

(assert (=> b!1029717 d!123417))

(declare-fun b!1029933 () Bool)

(declare-fun e!581541 () (_ BitVec 32))

(declare-fun call!43530 () (_ BitVec 32))

(assert (=> b!1029933 (= e!581541 call!43530)))

(declare-fun d!123419 () Bool)

(declare-fun lt!454164 () (_ BitVec 32))

(assert (=> d!123419 (and (bvsge lt!454164 #b00000000000000000000000000000000) (bvsle lt!454164 (bvsub (size!31671 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun e!581542 () (_ BitVec 32))

(assert (=> d!123419 (= lt!454164 e!581542)))

(declare-fun c!104097 () Bool)

(assert (=> d!123419 (= c!104097 (bvsge #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123419 (and (bvsle #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31671 (_keys!11288 thiss!1427)) (size!31671 lt!453998)))))

(assert (=> d!123419 (= (arrayCountValidKeys!0 lt!453998 #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) lt!454164)))

(declare-fun bm!43527 () Bool)

(assert (=> bm!43527 (= call!43530 (arrayCountValidKeys!0 lt!453998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun b!1029934 () Bool)

(assert (=> b!1029934 (= e!581542 #b00000000000000000000000000000000)))

(declare-fun b!1029935 () Bool)

(assert (=> b!1029935 (= e!581541 (bvadd #b00000000000000000000000000000001 call!43530))))

(declare-fun b!1029936 () Bool)

(assert (=> b!1029936 (= e!581542 e!581541)))

(declare-fun c!104098 () Bool)

(assert (=> b!1029936 (= c!104098 (validKeyInArray!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(assert (= (and d!123419 c!104097) b!1029934))

(assert (= (and d!123419 (not c!104097)) b!1029936))

(assert (= (and b!1029936 c!104098) b!1029935))

(assert (= (and b!1029936 (not c!104098)) b!1029933))

(assert (= (or b!1029935 b!1029933) bm!43527))

(declare-fun m!949383 () Bool)

(assert (=> bm!43527 m!949383))

(assert (=> b!1029936 m!949293))

(assert (=> b!1029936 m!949293))

(assert (=> b!1029936 m!949295))

(assert (=> b!1029717 d!123419))

(declare-fun d!123421 () Bool)

(assert (=> d!123421 (= (array_inv!24117 (_keys!11288 thiss!1427)) (bvsge (size!31671 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029718 d!123421))

(declare-fun d!123423 () Bool)

(assert (=> d!123423 (= (array_inv!24118 (_values!6145 thiss!1427)) (bvsge (size!31672 (_values!6145 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029718 d!123423))

(declare-fun mapNonEmpty!37934 () Bool)

(declare-fun mapRes!37934 () Bool)

(declare-fun tp!72876 () Bool)

(declare-fun e!581547 () Bool)

(assert (=> mapNonEmpty!37934 (= mapRes!37934 (and tp!72876 e!581547))))

(declare-fun mapRest!37934 () (Array (_ BitVec 32) ValueCell!11457))

(declare-fun mapKey!37934 () (_ BitVec 32))

(declare-fun mapValue!37934 () ValueCell!11457)

(assert (=> mapNonEmpty!37934 (= mapRest!37928 (store mapRest!37934 mapKey!37934 mapValue!37934))))

(declare-fun b!1029943 () Bool)

(assert (=> b!1029943 (= e!581547 tp_is_empty!24321)))

(declare-fun condMapEmpty!37934 () Bool)

(declare-fun mapDefault!37934 () ValueCell!11457)

(assert (=> mapNonEmpty!37928 (= condMapEmpty!37934 (= mapRest!37928 ((as const (Array (_ BitVec 32) ValueCell!11457)) mapDefault!37934)))))

(declare-fun e!581548 () Bool)

(assert (=> mapNonEmpty!37928 (= tp!72867 (and e!581548 mapRes!37934))))

(declare-fun b!1029944 () Bool)

(assert (=> b!1029944 (= e!581548 tp_is_empty!24321)))

(declare-fun mapIsEmpty!37934 () Bool)

(assert (=> mapIsEmpty!37934 mapRes!37934))

(assert (= (and mapNonEmpty!37928 condMapEmpty!37934) mapIsEmpty!37934))

(assert (= (and mapNonEmpty!37928 (not condMapEmpty!37934)) mapNonEmpty!37934))

(assert (= (and mapNonEmpty!37934 ((_ is ValueCellFull!11457) mapValue!37934)) b!1029943))

(assert (= (and mapNonEmpty!37928 ((_ is ValueCellFull!11457) mapDefault!37934)) b!1029944))

(declare-fun m!949385 () Bool)

(assert (=> mapNonEmpty!37934 m!949385))

(declare-fun b_lambda!15905 () Bool)

(assert (= b_lambda!15903 (or (and b!1029718 b_free!20601) b_lambda!15905)))

(declare-fun b_lambda!15907 () Bool)

(assert (= b_lambda!15901 (or (and b!1029718 b_free!20601) b_lambda!15907)))

(declare-fun b_lambda!15909 () Bool)

(assert (= b_lambda!15899 (or (and b!1029718 b_free!20601) b_lambda!15909)))

(check-sat (not b!1029924) b_and!32957 (not d!123391) (not b!1029855) (not b_next!20601) (not b!1029878) (not b!1029841) (not b!1029834) (not b!1029835) (not b!1029848) (not b_lambda!15897) (not b!1029862) (not b!1029830) (not d!123393) (not d!123399) (not bm!43506) (not b!1029910) (not b_lambda!15907) (not bm!43526) tp_is_empty!24321 (not bm!43527) (not b!1029908) (not bm!43523) (not b!1029923) (not bm!43516) (not d!123409) (not bm!43512) (not b!1029760) (not b!1029761) (not b!1029936) (not bm!43505) (not b!1029925) (not b!1029856) (not b!1029869) (not b!1029827) (not b!1029854) (not bm!43513) (not d!123401) (not d!123389) (not b!1029837) (not b_lambda!15909) (not b!1029851) (not bm!43510) (not bm!43509) (not b!1029858) (not b!1029896) (not mapNonEmpty!37934) (not bm!43517) (not bm!43520) (not d!123405) (not b!1029782) (not b!1029828) (not d!123397) (not b!1029881) (not b!1029899) (not b_lambda!15905) (not b!1029777) (not b!1029849) (not b!1029932) (not d!123395) (not b!1029879) (not b!1029759) (not d!123403) (not b!1029833) (not b!1029884))
(check-sat b_and!32957 (not b_next!20601))
(get-model)

(declare-fun d!123425 () Bool)

(declare-fun e!581551 () Bool)

(assert (=> d!123425 e!581551))

(declare-fun res!688841 () Bool)

(assert (=> d!123425 (=> (not res!688841) (not e!581551))))

(declare-fun lt!454174 () ListLongMap!13689)

(assert (=> d!123425 (= res!688841 (contains!5975 lt!454174 (_1!7797 (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(declare-fun lt!454175 () List!21829)

(assert (=> d!123425 (= lt!454174 (ListLongMap!13690 lt!454175))))

(declare-fun lt!454173 () Unit!33629)

(declare-fun lt!454176 () Unit!33629)

(assert (=> d!123425 (= lt!454173 lt!454176)))

(declare-datatypes ((Option!638 0))(
  ( (Some!637 (v!14789 V!37301)) (None!636) )
))
(declare-fun getValueByKey!587 (List!21829 (_ BitVec 64)) Option!638)

(assert (=> d!123425 (= (getValueByKey!587 lt!454175 (_1!7797 (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))) (Some!637 (_2!7797 (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!278 (List!21829 (_ BitVec 64) V!37301) Unit!33629)

(assert (=> d!123425 (= lt!454176 (lemmaContainsTupThenGetReturnValue!278 lt!454175 (_1!7797 (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) (_2!7797 (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(declare-fun insertStrictlySorted!371 (List!21829 (_ BitVec 64) V!37301) List!21829)

(assert (=> d!123425 (= lt!454175 (insertStrictlySorted!371 (toList!6860 (ite c!104080 call!43519 (ite c!104082 call!43515 call!43517))) (_1!7797 (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) (_2!7797 (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(assert (=> d!123425 (= (+!3102 (ite c!104080 call!43519 (ite c!104082 call!43515 call!43517)) (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) lt!454174)))

(declare-fun b!1029949 () Bool)

(declare-fun res!688840 () Bool)

(assert (=> b!1029949 (=> (not res!688840) (not e!581551))))

(assert (=> b!1029949 (= res!688840 (= (getValueByKey!587 (toList!6860 lt!454174) (_1!7797 (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))) (Some!637 (_2!7797 (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))))

(declare-fun b!1029950 () Bool)

(declare-fun contains!5977 (List!21829 tuple2!15572) Bool)

(assert (=> b!1029950 (= e!581551 (contains!5977 (toList!6860 lt!454174) (ite (or c!104080 c!104082) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (= (and d!123425 res!688841) b!1029949))

(assert (= (and b!1029949 res!688840) b!1029950))

(declare-fun m!949387 () Bool)

(assert (=> d!123425 m!949387))

(declare-fun m!949389 () Bool)

(assert (=> d!123425 m!949389))

(declare-fun m!949391 () Bool)

(assert (=> d!123425 m!949391))

(declare-fun m!949393 () Bool)

(assert (=> d!123425 m!949393))

(declare-fun m!949395 () Bool)

(assert (=> b!1029949 m!949395))

(declare-fun m!949397 () Bool)

(assert (=> b!1029950 m!949397))

(assert (=> bm!43517 d!123425))

(declare-fun d!123427 () Bool)

(assert (=> d!123427 (= (validKeyInArray!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)) (and (not (= (select (arr!31155 lt!453998) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31155 lt!453998) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029925 d!123427))

(declare-fun d!123429 () Bool)

(assert (=> d!123429 (= (validMask!0 (mask!29885 thiss!1427)) (and (or (= (mask!29885 thiss!1427) #b00000000000000000000000000000111) (= (mask!29885 thiss!1427) #b00000000000000000000000000001111) (= (mask!29885 thiss!1427) #b00000000000000000000000000011111) (= (mask!29885 thiss!1427) #b00000000000000000000000000111111) (= (mask!29885 thiss!1427) #b00000000000000000000000001111111) (= (mask!29885 thiss!1427) #b00000000000000000000000011111111) (= (mask!29885 thiss!1427) #b00000000000000000000000111111111) (= (mask!29885 thiss!1427) #b00000000000000000000001111111111) (= (mask!29885 thiss!1427) #b00000000000000000000011111111111) (= (mask!29885 thiss!1427) #b00000000000000000000111111111111) (= (mask!29885 thiss!1427) #b00000000000000000001111111111111) (= (mask!29885 thiss!1427) #b00000000000000000011111111111111) (= (mask!29885 thiss!1427) #b00000000000000000111111111111111) (= (mask!29885 thiss!1427) #b00000000000000001111111111111111) (= (mask!29885 thiss!1427) #b00000000000000011111111111111111) (= (mask!29885 thiss!1427) #b00000000000000111111111111111111) (= (mask!29885 thiss!1427) #b00000000000001111111111111111111) (= (mask!29885 thiss!1427) #b00000000000011111111111111111111) (= (mask!29885 thiss!1427) #b00000000000111111111111111111111) (= (mask!29885 thiss!1427) #b00000000001111111111111111111111) (= (mask!29885 thiss!1427) #b00000000011111111111111111111111) (= (mask!29885 thiss!1427) #b00000000111111111111111111111111) (= (mask!29885 thiss!1427) #b00000001111111111111111111111111) (= (mask!29885 thiss!1427) #b00000011111111111111111111111111) (= (mask!29885 thiss!1427) #b00000111111111111111111111111111) (= (mask!29885 thiss!1427) #b00001111111111111111111111111111) (= (mask!29885 thiss!1427) #b00011111111111111111111111111111) (= (mask!29885 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29885 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123395 d!123429))

(assert (=> b!1029908 d!123427))

(declare-fun d!123431 () Bool)

(assert (=> d!123431 (arrayNoDuplicates!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) #b00000000000000000000000000000000 Nil!21827)))

(assert (=> d!123431 true))

(declare-fun _$66!41 () Unit!33629)

(assert (=> d!123431 (= (choose!53 (_keys!11288 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41116 lt!454003) #b00000000000000000000000000000000 Nil!21827) _$66!41)))

(declare-fun bs!30086 () Bool)

(assert (= bs!30086 d!123431))

(assert (=> bs!30086 m!949121))

(assert (=> bs!30086 m!949227))

(assert (=> d!123393 d!123431))

(declare-fun call!43531 () Bool)

(declare-fun bm!43528 () Bool)

(declare-fun c!104099 () Bool)

(assert (=> bm!43528 (= call!43531 (arrayNoDuplicates!0 lt!453998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104099 (Cons!21826 (select (arr!31155 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104096 (Cons!21826 (select (arr!31155 lt!453998) #b00000000000000000000000000000000) Nil!21827) Nil!21827)) (ite c!104096 (Cons!21826 (select (arr!31155 lt!453998) #b00000000000000000000000000000000) Nil!21827) Nil!21827))))))

(declare-fun d!123433 () Bool)

(declare-fun res!688844 () Bool)

(declare-fun e!581554 () Bool)

(assert (=> d!123433 (=> res!688844 e!581554)))

(assert (=> d!123433 (= res!688844 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 lt!453998)))))

(assert (=> d!123433 (= (arrayNoDuplicates!0 lt!453998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104096 (Cons!21826 (select (arr!31155 lt!453998) #b00000000000000000000000000000000) Nil!21827) Nil!21827)) e!581554)))

(declare-fun b!1029951 () Bool)

(declare-fun e!581552 () Bool)

(assert (=> b!1029951 (= e!581552 call!43531)))

(declare-fun b!1029952 () Bool)

(declare-fun e!581553 () Bool)

(assert (=> b!1029952 (= e!581553 e!581552)))

(assert (=> b!1029952 (= c!104099 (validKeyInArray!0 (select (arr!31155 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029953 () Bool)

(declare-fun e!581555 () Bool)

(assert (=> b!1029953 (= e!581555 (contains!5976 (ite c!104096 (Cons!21826 (select (arr!31155 lt!453998) #b00000000000000000000000000000000) Nil!21827) Nil!21827) (select (arr!31155 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029954 () Bool)

(assert (=> b!1029954 (= e!581554 e!581553)))

(declare-fun res!688842 () Bool)

(assert (=> b!1029954 (=> (not res!688842) (not e!581553))))

(assert (=> b!1029954 (= res!688842 (not e!581555))))

(declare-fun res!688843 () Bool)

(assert (=> b!1029954 (=> (not res!688843) (not e!581555))))

(assert (=> b!1029954 (= res!688843 (validKeyInArray!0 (select (arr!31155 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029955 () Bool)

(assert (=> b!1029955 (= e!581552 call!43531)))

(assert (= (and d!123433 (not res!688844)) b!1029954))

(assert (= (and b!1029954 res!688843) b!1029953))

(assert (= (and b!1029954 res!688842) b!1029952))

(assert (= (and b!1029952 c!104099) b!1029955))

(assert (= (and b!1029952 (not c!104099)) b!1029951))

(assert (= (or b!1029955 b!1029951) bm!43528))

(declare-fun m!949399 () Bool)

(assert (=> bm!43528 m!949399))

(declare-fun m!949401 () Bool)

(assert (=> bm!43528 m!949401))

(assert (=> b!1029952 m!949399))

(assert (=> b!1029952 m!949399))

(declare-fun m!949403 () Bool)

(assert (=> b!1029952 m!949403))

(assert (=> b!1029953 m!949399))

(assert (=> b!1029953 m!949399))

(declare-fun m!949405 () Bool)

(assert (=> b!1029953 m!949405))

(assert (=> b!1029954 m!949399))

(assert (=> b!1029954 m!949399))

(assert (=> b!1029954 m!949403))

(assert (=> bm!43526 d!123433))

(declare-fun d!123435 () Bool)

(assert (=> d!123435 (not (arrayContainsKey!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!123435 true))

(declare-fun _$59!20 () Unit!33629)

(assert (=> d!123435 (= (choose!121 (_keys!11288 thiss!1427) (index!41116 lt!454003) key!909) _$59!20)))

(declare-fun bs!30087 () Bool)

(assert (= bs!30087 d!123435))

(assert (=> bs!30087 m!949121))

(assert (=> bs!30087 m!949367))

(assert (=> d!123409 d!123435))

(declare-fun d!123437 () Bool)

(assert (=> d!123437 (= (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029835 d!123437))

(assert (=> b!1029923 d!123427))

(assert (=> b!1029837 d!123437))

(declare-fun d!123439 () Bool)

(declare-fun e!581561 () Bool)

(assert (=> d!123439 e!581561))

(declare-fun res!688847 () Bool)

(assert (=> d!123439 (=> res!688847 e!581561)))

(declare-fun lt!454185 () Bool)

(assert (=> d!123439 (= res!688847 (not lt!454185))))

(declare-fun lt!454188 () Bool)

(assert (=> d!123439 (= lt!454185 lt!454188)))

(declare-fun lt!454186 () Unit!33629)

(declare-fun e!581560 () Unit!33629)

(assert (=> d!123439 (= lt!454186 e!581560)))

(declare-fun c!104102 () Bool)

(assert (=> d!123439 (= c!104102 lt!454188)))

(declare-fun containsKey!562 (List!21829 (_ BitVec 64)) Bool)

(assert (=> d!123439 (= lt!454188 (containsKey!562 (toList!6860 lt!454132) (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(assert (=> d!123439 (= (contains!5975 lt!454132 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)) lt!454185)))

(declare-fun b!1029962 () Bool)

(declare-fun lt!454187 () Unit!33629)

(assert (=> b!1029962 (= e!581560 lt!454187)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!395 (List!21829 (_ BitVec 64)) Unit!33629)

(assert (=> b!1029962 (= lt!454187 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6860 lt!454132) (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun isDefined!434 (Option!638) Bool)

(assert (=> b!1029962 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454132) (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun b!1029963 () Bool)

(declare-fun Unit!33635 () Unit!33629)

(assert (=> b!1029963 (= e!581560 Unit!33635)))

(declare-fun b!1029964 () Bool)

(assert (=> b!1029964 (= e!581561 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454132) (select (arr!31155 lt!453998) #b00000000000000000000000000000000))))))

(assert (= (and d!123439 c!104102) b!1029962))

(assert (= (and d!123439 (not c!104102)) b!1029963))

(assert (= (and d!123439 (not res!688847)) b!1029964))

(assert (=> d!123439 m!949293))

(declare-fun m!949407 () Bool)

(assert (=> d!123439 m!949407))

(assert (=> b!1029962 m!949293))

(declare-fun m!949409 () Bool)

(assert (=> b!1029962 m!949409))

(assert (=> b!1029962 m!949293))

(declare-fun m!949411 () Bool)

(assert (=> b!1029962 m!949411))

(assert (=> b!1029962 m!949411))

(declare-fun m!949413 () Bool)

(assert (=> b!1029962 m!949413))

(assert (=> b!1029964 m!949293))

(assert (=> b!1029964 m!949411))

(assert (=> b!1029964 m!949411))

(assert (=> b!1029964 m!949413))

(assert (=> b!1029862 d!123439))

(declare-fun d!123441 () Bool)

(declare-fun e!581562 () Bool)

(assert (=> d!123441 e!581562))

(declare-fun res!688849 () Bool)

(assert (=> d!123441 (=> (not res!688849) (not e!581562))))

(declare-fun lt!454190 () ListLongMap!13689)

(assert (=> d!123441 (= res!688849 (contains!5975 lt!454190 (_1!7797 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427)))))))

(declare-fun lt!454191 () List!21829)

(assert (=> d!123441 (= lt!454190 (ListLongMap!13690 lt!454191))))

(declare-fun lt!454189 () Unit!33629)

(declare-fun lt!454192 () Unit!33629)

(assert (=> d!123441 (= lt!454189 lt!454192)))

(assert (=> d!123441 (= (getValueByKey!587 lt!454191 (_1!7797 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427)))))))

(assert (=> d!123441 (= lt!454192 (lemmaContainsTupThenGetReturnValue!278 lt!454191 (_1!7797 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427)))))))

(assert (=> d!123441 (= lt!454191 (insertStrictlySorted!371 (toList!6860 lt!454099) (_1!7797 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427)))))))

(assert (=> d!123441 (= (+!3102 lt!454099 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427))) lt!454190)))

(declare-fun b!1029965 () Bool)

(declare-fun res!688848 () Bool)

(assert (=> b!1029965 (=> (not res!688848) (not e!581562))))

(assert (=> b!1029965 (= res!688848 (= (getValueByKey!587 (toList!6860 lt!454190) (_1!7797 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427))))))))

(declare-fun b!1029966 () Bool)

(assert (=> b!1029966 (= e!581562 (contains!5977 (toList!6860 lt!454190) (tuple2!15573 lt!454102 (minValue!5958 thiss!1427))))))

(assert (= (and d!123441 res!688849) b!1029965))

(assert (= (and b!1029965 res!688848) b!1029966))

(declare-fun m!949415 () Bool)

(assert (=> d!123441 m!949415))

(declare-fun m!949417 () Bool)

(assert (=> d!123441 m!949417))

(declare-fun m!949419 () Bool)

(assert (=> d!123441 m!949419))

(declare-fun m!949421 () Bool)

(assert (=> d!123441 m!949421))

(declare-fun m!949423 () Bool)

(assert (=> b!1029965 m!949423))

(declare-fun m!949425 () Bool)

(assert (=> b!1029966 m!949425))

(assert (=> b!1029834 d!123441))

(declare-fun b!1029991 () Bool)

(declare-fun e!581581 () Bool)

(assert (=> b!1029991 (= e!581581 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029991 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1029992 () Bool)

(declare-fun e!581579 () Bool)

(declare-fun lt!454208 () ListLongMap!13689)

(declare-fun isEmpty!925 (ListLongMap!13689) Bool)

(assert (=> b!1029992 (= e!581579 (isEmpty!925 lt!454208))))

(declare-fun d!123443 () Bool)

(declare-fun e!581578 () Bool)

(assert (=> d!123443 e!581578))

(declare-fun res!688859 () Bool)

(assert (=> d!123443 (=> (not res!688859) (not e!581578))))

(assert (=> d!123443 (= res!688859 (not (contains!5975 lt!454208 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!581577 () ListLongMap!13689)

(assert (=> d!123443 (= lt!454208 e!581577)))

(declare-fun c!104111 () Bool)

(assert (=> d!123443 (= c!104111 (bvsge #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123443 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123443 (= (getCurrentListMapNoExtraKeys!3518 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)) lt!454208)))

(declare-fun b!1029993 () Bool)

(declare-fun e!581582 () Bool)

(assert (=> b!1029993 (= e!581578 e!581582)))

(declare-fun c!104112 () Bool)

(assert (=> b!1029993 (= c!104112 e!581581)))

(declare-fun res!688858 () Bool)

(assert (=> b!1029993 (=> (not res!688858) (not e!581581))))

(assert (=> b!1029993 (= res!688858 (bvslt #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun b!1029994 () Bool)

(declare-fun e!581583 () ListLongMap!13689)

(assert (=> b!1029994 (= e!581577 e!581583)))

(declare-fun c!104114 () Bool)

(assert (=> b!1029994 (= c!104114 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029995 () Bool)

(declare-fun lt!454212 () Unit!33629)

(declare-fun lt!454207 () Unit!33629)

(assert (=> b!1029995 (= lt!454212 lt!454207)))

(declare-fun lt!454209 () (_ BitVec 64))

(declare-fun lt!454211 () ListLongMap!13689)

(declare-fun lt!454210 () V!37301)

(declare-fun lt!454213 () (_ BitVec 64))

(assert (=> b!1029995 (not (contains!5975 (+!3102 lt!454211 (tuple2!15573 lt!454213 lt!454210)) lt!454209))))

(declare-fun addStillNotContains!241 (ListLongMap!13689 (_ BitVec 64) V!37301 (_ BitVec 64)) Unit!33629)

(assert (=> b!1029995 (= lt!454207 (addStillNotContains!241 lt!454211 lt!454213 lt!454210 lt!454209))))

(assert (=> b!1029995 (= lt!454209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1029995 (= lt!454210 (get!16362 (select (arr!31156 (_values!6145 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1029995 (= lt!454213 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun call!43534 () ListLongMap!13689)

(assert (=> b!1029995 (= lt!454211 call!43534)))

(assert (=> b!1029995 (= e!581583 (+!3102 call!43534 (tuple2!15573 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000) (get!16362 (select (arr!31156 (_values!6145 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1029996 () Bool)

(assert (=> b!1029996 (= e!581577 (ListLongMap!13690 Nil!21826))))

(declare-fun b!1029997 () Bool)

(assert (=> b!1029997 (= e!581579 (= lt!454208 (getCurrentListMapNoExtraKeys!3518 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6122 thiss!1427))))))

(declare-fun b!1029998 () Bool)

(assert (=> b!1029998 (= e!581582 e!581579)))

(declare-fun c!104113 () Bool)

(assert (=> b!1029998 (= c!104113 (bvslt #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun b!1029999 () Bool)

(declare-fun e!581580 () Bool)

(assert (=> b!1029999 (= e!581582 e!581580)))

(assert (=> b!1029999 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun res!688861 () Bool)

(assert (=> b!1029999 (= res!688861 (contains!5975 lt!454208 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029999 (=> (not res!688861) (not e!581580))))

(declare-fun b!1030000 () Bool)

(declare-fun res!688860 () Bool)

(assert (=> b!1030000 (=> (not res!688860) (not e!581578))))

(assert (=> b!1030000 (= res!688860 (not (contains!5975 lt!454208 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030001 () Bool)

(assert (=> b!1030001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> b!1030001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31672 (_values!6145 thiss!1427))))))

(assert (=> b!1030001 (= e!581580 (= (apply!904 lt!454208 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)) (get!16362 (select (arr!31156 (_values!6145 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!43531 () Bool)

(assert (=> bm!43531 (= call!43534 (getCurrentListMapNoExtraKeys!3518 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6122 thiss!1427)))))

(declare-fun b!1030002 () Bool)

(assert (=> b!1030002 (= e!581583 call!43534)))

(assert (= (and d!123443 c!104111) b!1029996))

(assert (= (and d!123443 (not c!104111)) b!1029994))

(assert (= (and b!1029994 c!104114) b!1029995))

(assert (= (and b!1029994 (not c!104114)) b!1030002))

(assert (= (or b!1029995 b!1030002) bm!43531))

(assert (= (and d!123443 res!688859) b!1030000))

(assert (= (and b!1030000 res!688860) b!1029993))

(assert (= (and b!1029993 res!688858) b!1029991))

(assert (= (and b!1029993 c!104112) b!1029999))

(assert (= (and b!1029993 (not c!104112)) b!1029998))

(assert (= (and b!1029999 res!688861) b!1030001))

(assert (= (and b!1029998 c!104113) b!1029997))

(assert (= (and b!1029998 (not c!104113)) b!1029992))

(declare-fun b_lambda!15911 () Bool)

(assert (=> (not b_lambda!15911) (not b!1029995)))

(assert (=> b!1029995 t!30924))

(declare-fun b_and!32959 () Bool)

(assert (= b_and!32957 (and (=> t!30924 result!14163) b_and!32959)))

(declare-fun b_lambda!15913 () Bool)

(assert (=> (not b_lambda!15913) (not b!1030001)))

(assert (=> b!1030001 t!30924))

(declare-fun b_and!32961 () Bool)

(assert (= b_and!32959 (and (=> t!30924 result!14163) b_and!32961)))

(declare-fun m!949427 () Bool)

(assert (=> b!1030000 m!949427))

(assert (=> b!1029991 m!949233))

(assert (=> b!1029991 m!949233))

(assert (=> b!1029991 m!949235))

(declare-fun m!949429 () Bool)

(assert (=> b!1029997 m!949429))

(assert (=> b!1029999 m!949233))

(assert (=> b!1029999 m!949233))

(declare-fun m!949431 () Bool)

(assert (=> b!1029999 m!949431))

(assert (=> bm!43531 m!949429))

(declare-fun m!949433 () Bool)

(assert (=> b!1029992 m!949433))

(assert (=> b!1029994 m!949233))

(assert (=> b!1029994 m!949233))

(assert (=> b!1029994 m!949235))

(assert (=> b!1030001 m!949279))

(assert (=> b!1030001 m!949151))

(assert (=> b!1030001 m!949281))

(assert (=> b!1030001 m!949279))

(assert (=> b!1030001 m!949151))

(assert (=> b!1030001 m!949233))

(declare-fun m!949435 () Bool)

(assert (=> b!1030001 m!949435))

(assert (=> b!1030001 m!949233))

(assert (=> b!1029995 m!949279))

(assert (=> b!1029995 m!949151))

(assert (=> b!1029995 m!949281))

(assert (=> b!1029995 m!949279))

(declare-fun m!949437 () Bool)

(assert (=> b!1029995 m!949437))

(assert (=> b!1029995 m!949151))

(declare-fun m!949439 () Bool)

(assert (=> b!1029995 m!949439))

(declare-fun m!949441 () Bool)

(assert (=> b!1029995 m!949441))

(assert (=> b!1029995 m!949439))

(declare-fun m!949443 () Bool)

(assert (=> b!1029995 m!949443))

(assert (=> b!1029995 m!949233))

(declare-fun m!949445 () Bool)

(assert (=> d!123443 m!949445))

(assert (=> d!123443 m!949219))

(assert (=> b!1029834 d!123443))

(declare-fun d!123445 () Bool)

(declare-fun get!16363 (Option!638) V!37301)

(assert (=> d!123445 (= (apply!904 lt!454094 lt!454095) (get!16363 (getValueByKey!587 (toList!6860 lt!454094) lt!454095)))))

(declare-fun bs!30088 () Bool)

(assert (= bs!30088 d!123445))

(declare-fun m!949447 () Bool)

(assert (=> bs!30088 m!949447))

(assert (=> bs!30088 m!949447))

(declare-fun m!949449 () Bool)

(assert (=> bs!30088 m!949449))

(assert (=> b!1029834 d!123445))

(declare-fun d!123447 () Bool)

(assert (=> d!123447 (= (apply!904 (+!3102 lt!454099 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427))) lt!454111) (get!16363 (getValueByKey!587 (toList!6860 (+!3102 lt!454099 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427)))) lt!454111)))))

(declare-fun bs!30089 () Bool)

(assert (= bs!30089 d!123447))

(declare-fun m!949451 () Bool)

(assert (=> bs!30089 m!949451))

(assert (=> bs!30089 m!949451))

(declare-fun m!949453 () Bool)

(assert (=> bs!30089 m!949453))

(assert (=> b!1029834 d!123447))

(declare-fun d!123449 () Bool)

(assert (=> d!123449 (= (apply!904 (+!3102 lt!454099 (tuple2!15573 lt!454102 (minValue!5958 thiss!1427))) lt!454111) (apply!904 lt!454099 lt!454111))))

(declare-fun lt!454216 () Unit!33629)

(declare-fun choose!1693 (ListLongMap!13689 (_ BitVec 64) V!37301 (_ BitVec 64)) Unit!33629)

(assert (=> d!123449 (= lt!454216 (choose!1693 lt!454099 lt!454102 (minValue!5958 thiss!1427) lt!454111))))

(declare-fun e!581586 () Bool)

(assert (=> d!123449 e!581586))

(declare-fun res!688864 () Bool)

(assert (=> d!123449 (=> (not res!688864) (not e!581586))))

(assert (=> d!123449 (= res!688864 (contains!5975 lt!454099 lt!454111))))

(assert (=> d!123449 (= (addApplyDifferent!483 lt!454099 lt!454102 (minValue!5958 thiss!1427) lt!454111) lt!454216)))

(declare-fun b!1030006 () Bool)

(assert (=> b!1030006 (= e!581586 (not (= lt!454111 lt!454102)))))

(assert (= (and d!123449 res!688864) b!1030006))

(declare-fun m!949455 () Bool)

(assert (=> d!123449 m!949455))

(declare-fun m!949457 () Bool)

(assert (=> d!123449 m!949457))

(assert (=> d!123449 m!949247))

(assert (=> d!123449 m!949249))

(assert (=> d!123449 m!949269))

(assert (=> d!123449 m!949247))

(assert (=> b!1029834 d!123449))

(declare-fun d!123451 () Bool)

(assert (=> d!123451 (= (apply!904 (+!3102 lt!454094 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427))) lt!454095) (apply!904 lt!454094 lt!454095))))

(declare-fun lt!454217 () Unit!33629)

(assert (=> d!123451 (= lt!454217 (choose!1693 lt!454094 lt!454113 (minValue!5958 thiss!1427) lt!454095))))

(declare-fun e!581587 () Bool)

(assert (=> d!123451 e!581587))

(declare-fun res!688865 () Bool)

(assert (=> d!123451 (=> (not res!688865) (not e!581587))))

(assert (=> d!123451 (= res!688865 (contains!5975 lt!454094 lt!454095))))

(assert (=> d!123451 (= (addApplyDifferent!483 lt!454094 lt!454113 (minValue!5958 thiss!1427) lt!454095) lt!454217)))

(declare-fun b!1030007 () Bool)

(assert (=> b!1030007 (= e!581587 (not (= lt!454095 lt!454113)))))

(assert (= (and d!123451 res!688865) b!1030007))

(declare-fun m!949459 () Bool)

(assert (=> d!123451 m!949459))

(declare-fun m!949461 () Bool)

(assert (=> d!123451 m!949461))

(assert (=> d!123451 m!949241))

(assert (=> d!123451 m!949255))

(assert (=> d!123451 m!949265))

(assert (=> d!123451 m!949241))

(assert (=> b!1029834 d!123451))

(declare-fun d!123453 () Bool)

(declare-fun e!581589 () Bool)

(assert (=> d!123453 e!581589))

(declare-fun res!688866 () Bool)

(assert (=> d!123453 (=> res!688866 e!581589)))

(declare-fun lt!454218 () Bool)

(assert (=> d!123453 (= res!688866 (not lt!454218))))

(declare-fun lt!454221 () Bool)

(assert (=> d!123453 (= lt!454218 lt!454221)))

(declare-fun lt!454219 () Unit!33629)

(declare-fun e!581588 () Unit!33629)

(assert (=> d!123453 (= lt!454219 e!581588)))

(declare-fun c!104115 () Bool)

(assert (=> d!123453 (= c!104115 lt!454221)))

(assert (=> d!123453 (= lt!454221 (containsKey!562 (toList!6860 (+!3102 lt!454114 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))) lt!454101))))

(assert (=> d!123453 (= (contains!5975 (+!3102 lt!454114 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427))) lt!454101) lt!454218)))

(declare-fun b!1030008 () Bool)

(declare-fun lt!454220 () Unit!33629)

(assert (=> b!1030008 (= e!581588 lt!454220)))

(assert (=> b!1030008 (= lt!454220 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6860 (+!3102 lt!454114 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))) lt!454101))))

(assert (=> b!1030008 (isDefined!434 (getValueByKey!587 (toList!6860 (+!3102 lt!454114 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))) lt!454101))))

(declare-fun b!1030009 () Bool)

(declare-fun Unit!33636 () Unit!33629)

(assert (=> b!1030009 (= e!581588 Unit!33636)))

(declare-fun b!1030010 () Bool)

(assert (=> b!1030010 (= e!581589 (isDefined!434 (getValueByKey!587 (toList!6860 (+!3102 lt!454114 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))) lt!454101)))))

(assert (= (and d!123453 c!104115) b!1030008))

(assert (= (and d!123453 (not c!104115)) b!1030009))

(assert (= (and d!123453 (not res!688866)) b!1030010))

(declare-fun m!949463 () Bool)

(assert (=> d!123453 m!949463))

(declare-fun m!949465 () Bool)

(assert (=> b!1030008 m!949465))

(declare-fun m!949467 () Bool)

(assert (=> b!1030008 m!949467))

(assert (=> b!1030008 m!949467))

(declare-fun m!949469 () Bool)

(assert (=> b!1030008 m!949469))

(assert (=> b!1030010 m!949467))

(assert (=> b!1030010 m!949467))

(assert (=> b!1030010 m!949469))

(assert (=> b!1029834 d!123453))

(declare-fun d!123455 () Bool)

(assert (=> d!123455 (= (apply!904 (+!3102 lt!454093 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427))) lt!454109) (apply!904 lt!454093 lt!454109))))

(declare-fun lt!454222 () Unit!33629)

(assert (=> d!123455 (= lt!454222 (choose!1693 lt!454093 lt!454097 (zeroValue!5958 thiss!1427) lt!454109))))

(declare-fun e!581590 () Bool)

(assert (=> d!123455 e!581590))

(declare-fun res!688867 () Bool)

(assert (=> d!123455 (=> (not res!688867) (not e!581590))))

(assert (=> d!123455 (= res!688867 (contains!5975 lt!454093 lt!454109))))

(assert (=> d!123455 (= (addApplyDifferent!483 lt!454093 lt!454097 (zeroValue!5958 thiss!1427) lt!454109) lt!454222)))

(declare-fun b!1030011 () Bool)

(assert (=> b!1030011 (= e!581590 (not (= lt!454109 lt!454097)))))

(assert (= (and d!123455 res!688867) b!1030011))

(declare-fun m!949471 () Bool)

(assert (=> d!123455 m!949471))

(declare-fun m!949473 () Bool)

(assert (=> d!123455 m!949473))

(assert (=> d!123455 m!949259))

(assert (=> d!123455 m!949267))

(assert (=> d!123455 m!949251))

(assert (=> d!123455 m!949259))

(assert (=> b!1029834 d!123455))

(declare-fun d!123457 () Bool)

(assert (=> d!123457 (= (apply!904 lt!454099 lt!454111) (get!16363 (getValueByKey!587 (toList!6860 lt!454099) lt!454111)))))

(declare-fun bs!30090 () Bool)

(assert (= bs!30090 d!123457))

(declare-fun m!949475 () Bool)

(assert (=> bs!30090 m!949475))

(assert (=> bs!30090 m!949475))

(declare-fun m!949477 () Bool)

(assert (=> bs!30090 m!949477))

(assert (=> b!1029834 d!123457))

(declare-fun d!123459 () Bool)

(assert (=> d!123459 (= (apply!904 (+!3102 lt!454093 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427))) lt!454109) (get!16363 (getValueByKey!587 (toList!6860 (+!3102 lt!454093 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427)))) lt!454109)))))

(declare-fun bs!30091 () Bool)

(assert (= bs!30091 d!123459))

(declare-fun m!949479 () Bool)

(assert (=> bs!30091 m!949479))

(assert (=> bs!30091 m!949479))

(declare-fun m!949481 () Bool)

(assert (=> bs!30091 m!949481))

(assert (=> b!1029834 d!123459))

(declare-fun d!123461 () Bool)

(declare-fun e!581591 () Bool)

(assert (=> d!123461 e!581591))

(declare-fun res!688869 () Bool)

(assert (=> d!123461 (=> (not res!688869) (not e!581591))))

(declare-fun lt!454224 () ListLongMap!13689)

(assert (=> d!123461 (= res!688869 (contains!5975 lt!454224 (_1!7797 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427)))))))

(declare-fun lt!454225 () List!21829)

(assert (=> d!123461 (= lt!454224 (ListLongMap!13690 lt!454225))))

(declare-fun lt!454223 () Unit!33629)

(declare-fun lt!454226 () Unit!33629)

(assert (=> d!123461 (= lt!454223 lt!454226)))

(assert (=> d!123461 (= (getValueByKey!587 lt!454225 (_1!7797 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427)))))))

(assert (=> d!123461 (= lt!454226 (lemmaContainsTupThenGetReturnValue!278 lt!454225 (_1!7797 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427)))))))

(assert (=> d!123461 (= lt!454225 (insertStrictlySorted!371 (toList!6860 lt!454094) (_1!7797 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427)))))))

(assert (=> d!123461 (= (+!3102 lt!454094 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427))) lt!454224)))

(declare-fun b!1030012 () Bool)

(declare-fun res!688868 () Bool)

(assert (=> b!1030012 (=> (not res!688868) (not e!581591))))

(assert (=> b!1030012 (= res!688868 (= (getValueByKey!587 (toList!6860 lt!454224) (_1!7797 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427))))))))

(declare-fun b!1030013 () Bool)

(assert (=> b!1030013 (= e!581591 (contains!5977 (toList!6860 lt!454224) (tuple2!15573 lt!454113 (minValue!5958 thiss!1427))))))

(assert (= (and d!123461 res!688869) b!1030012))

(assert (= (and b!1030012 res!688868) b!1030013))

(declare-fun m!949483 () Bool)

(assert (=> d!123461 m!949483))

(declare-fun m!949485 () Bool)

(assert (=> d!123461 m!949485))

(declare-fun m!949487 () Bool)

(assert (=> d!123461 m!949487))

(declare-fun m!949489 () Bool)

(assert (=> d!123461 m!949489))

(declare-fun m!949491 () Bool)

(assert (=> b!1030012 m!949491))

(declare-fun m!949493 () Bool)

(assert (=> b!1030013 m!949493))

(assert (=> b!1029834 d!123461))

(declare-fun d!123463 () Bool)

(declare-fun e!581592 () Bool)

(assert (=> d!123463 e!581592))

(declare-fun res!688871 () Bool)

(assert (=> d!123463 (=> (not res!688871) (not e!581592))))

(declare-fun lt!454228 () ListLongMap!13689)

(assert (=> d!123463 (= res!688871 (contains!5975 lt!454228 (_1!7797 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427)))))))

(declare-fun lt!454229 () List!21829)

(assert (=> d!123463 (= lt!454228 (ListLongMap!13690 lt!454229))))

(declare-fun lt!454227 () Unit!33629)

(declare-fun lt!454230 () Unit!33629)

(assert (=> d!123463 (= lt!454227 lt!454230)))

(assert (=> d!123463 (= (getValueByKey!587 lt!454229 (_1!7797 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123463 (= lt!454230 (lemmaContainsTupThenGetReturnValue!278 lt!454229 (_1!7797 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123463 (= lt!454229 (insertStrictlySorted!371 (toList!6860 lt!454093) (_1!7797 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123463 (= (+!3102 lt!454093 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427))) lt!454228)))

(declare-fun b!1030014 () Bool)

(declare-fun res!688870 () Bool)

(assert (=> b!1030014 (=> (not res!688870) (not e!581592))))

(assert (=> b!1030014 (= res!688870 (= (getValueByKey!587 (toList!6860 lt!454228) (_1!7797 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427))))))))

(declare-fun b!1030015 () Bool)

(assert (=> b!1030015 (= e!581592 (contains!5977 (toList!6860 lt!454228) (tuple2!15573 lt!454097 (zeroValue!5958 thiss!1427))))))

(assert (= (and d!123463 res!688871) b!1030014))

(assert (= (and b!1030014 res!688870) b!1030015))

(declare-fun m!949495 () Bool)

(assert (=> d!123463 m!949495))

(declare-fun m!949497 () Bool)

(assert (=> d!123463 m!949497))

(declare-fun m!949499 () Bool)

(assert (=> d!123463 m!949499))

(declare-fun m!949501 () Bool)

(assert (=> d!123463 m!949501))

(declare-fun m!949503 () Bool)

(assert (=> b!1030014 m!949503))

(declare-fun m!949505 () Bool)

(assert (=> b!1030015 m!949505))

(assert (=> b!1029834 d!123463))

(declare-fun d!123465 () Bool)

(assert (=> d!123465 (contains!5975 (+!3102 lt!454114 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427))) lt!454101)))

(declare-fun lt!454233 () Unit!33629)

(declare-fun choose!1694 (ListLongMap!13689 (_ BitVec 64) V!37301 (_ BitVec 64)) Unit!33629)

(assert (=> d!123465 (= lt!454233 (choose!1694 lt!454114 lt!454110 (zeroValue!5958 thiss!1427) lt!454101))))

(assert (=> d!123465 (contains!5975 lt!454114 lt!454101)))

(assert (=> d!123465 (= (addStillContains!623 lt!454114 lt!454110 (zeroValue!5958 thiss!1427) lt!454101) lt!454233)))

(declare-fun bs!30092 () Bool)

(assert (= bs!30092 d!123465))

(assert (=> bs!30092 m!949253))

(assert (=> bs!30092 m!949253))

(assert (=> bs!30092 m!949261))

(declare-fun m!949507 () Bool)

(assert (=> bs!30092 m!949507))

(declare-fun m!949509 () Bool)

(assert (=> bs!30092 m!949509))

(assert (=> b!1029834 d!123465))

(declare-fun d!123467 () Bool)

(assert (=> d!123467 (= (apply!904 (+!3102 lt!454094 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427))) lt!454095) (get!16363 (getValueByKey!587 (toList!6860 (+!3102 lt!454094 (tuple2!15573 lt!454113 (minValue!5958 thiss!1427)))) lt!454095)))))

(declare-fun bs!30093 () Bool)

(assert (= bs!30093 d!123467))

(declare-fun m!949511 () Bool)

(assert (=> bs!30093 m!949511))

(assert (=> bs!30093 m!949511))

(declare-fun m!949513 () Bool)

(assert (=> bs!30093 m!949513))

(assert (=> b!1029834 d!123467))

(declare-fun d!123469 () Bool)

(assert (=> d!123469 (= (apply!904 lt!454093 lt!454109) (get!16363 (getValueByKey!587 (toList!6860 lt!454093) lt!454109)))))

(declare-fun bs!30094 () Bool)

(assert (= bs!30094 d!123469))

(declare-fun m!949515 () Bool)

(assert (=> bs!30094 m!949515))

(assert (=> bs!30094 m!949515))

(declare-fun m!949517 () Bool)

(assert (=> bs!30094 m!949517))

(assert (=> b!1029834 d!123469))

(declare-fun d!123471 () Bool)

(declare-fun e!581593 () Bool)

(assert (=> d!123471 e!581593))

(declare-fun res!688873 () Bool)

(assert (=> d!123471 (=> (not res!688873) (not e!581593))))

(declare-fun lt!454235 () ListLongMap!13689)

(assert (=> d!123471 (= res!688873 (contains!5975 lt!454235 (_1!7797 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))))))

(declare-fun lt!454236 () List!21829)

(assert (=> d!123471 (= lt!454235 (ListLongMap!13690 lt!454236))))

(declare-fun lt!454234 () Unit!33629)

(declare-fun lt!454237 () Unit!33629)

(assert (=> d!123471 (= lt!454234 lt!454237)))

(assert (=> d!123471 (= (getValueByKey!587 lt!454236 (_1!7797 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123471 (= lt!454237 (lemmaContainsTupThenGetReturnValue!278 lt!454236 (_1!7797 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123471 (= lt!454236 (insertStrictlySorted!371 (toList!6860 lt!454114) (_1!7797 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123471 (= (+!3102 lt!454114 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427))) lt!454235)))

(declare-fun b!1030017 () Bool)

(declare-fun res!688872 () Bool)

(assert (=> b!1030017 (=> (not res!688872) (not e!581593))))

(assert (=> b!1030017 (= res!688872 (= (getValueByKey!587 (toList!6860 lt!454235) (_1!7797 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427))))))))

(declare-fun b!1030018 () Bool)

(assert (=> b!1030018 (= e!581593 (contains!5977 (toList!6860 lt!454235) (tuple2!15573 lt!454110 (zeroValue!5958 thiss!1427))))))

(assert (= (and d!123471 res!688873) b!1030017))

(assert (= (and b!1030017 res!688872) b!1030018))

(declare-fun m!949519 () Bool)

(assert (=> d!123471 m!949519))

(declare-fun m!949521 () Bool)

(assert (=> d!123471 m!949521))

(declare-fun m!949523 () Bool)

(assert (=> d!123471 m!949523))

(declare-fun m!949525 () Bool)

(assert (=> d!123471 m!949525))

(declare-fun m!949527 () Bool)

(assert (=> b!1030017 m!949527))

(declare-fun m!949529 () Bool)

(assert (=> b!1030018 m!949529))

(assert (=> b!1029834 d!123471))

(declare-fun call!43535 () Bool)

(declare-fun c!104116 () Bool)

(declare-fun bm!43532 () Bool)

(assert (=> bm!43532 (= call!43535 (arrayNoDuplicates!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104116 (Cons!21826 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000) Nil!21827) Nil!21827)))))

(declare-fun d!123473 () Bool)

(declare-fun res!688876 () Bool)

(declare-fun e!581596 () Bool)

(assert (=> d!123473 (=> res!688876 e!581596)))

(assert (=> d!123473 (= res!688876 (bvsge #b00000000000000000000000000000000 (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))))

(assert (=> d!123473 (= (arrayNoDuplicates!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) #b00000000000000000000000000000000 Nil!21827) e!581596)))

(declare-fun b!1030019 () Bool)

(declare-fun e!581594 () Bool)

(assert (=> b!1030019 (= e!581594 call!43535)))

(declare-fun b!1030020 () Bool)

(declare-fun e!581595 () Bool)

(assert (=> b!1030020 (= e!581595 e!581594)))

(assert (=> b!1030020 (= c!104116 (validKeyInArray!0 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030021 () Bool)

(declare-fun e!581597 () Bool)

(assert (=> b!1030021 (= e!581597 (contains!5976 Nil!21827 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030022 () Bool)

(assert (=> b!1030022 (= e!581596 e!581595)))

(declare-fun res!688874 () Bool)

(assert (=> b!1030022 (=> (not res!688874) (not e!581595))))

(assert (=> b!1030022 (= res!688874 (not e!581597))))

(declare-fun res!688875 () Bool)

(assert (=> b!1030022 (=> (not res!688875) (not e!581597))))

(assert (=> b!1030022 (= res!688875 (validKeyInArray!0 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030023 () Bool)

(assert (=> b!1030023 (= e!581594 call!43535)))

(assert (= (and d!123473 (not res!688876)) b!1030022))

(assert (= (and b!1030022 res!688875) b!1030021))

(assert (= (and b!1030022 res!688874) b!1030020))

(assert (= (and b!1030020 c!104116) b!1030023))

(assert (= (and b!1030020 (not c!104116)) b!1030019))

(assert (= (or b!1030023 b!1030019) bm!43532))

(declare-fun m!949531 () Bool)

(assert (=> bm!43532 m!949531))

(declare-fun m!949533 () Bool)

(assert (=> bm!43532 m!949533))

(assert (=> b!1030020 m!949531))

(assert (=> b!1030020 m!949531))

(declare-fun m!949535 () Bool)

(assert (=> b!1030020 m!949535))

(assert (=> b!1030021 m!949531))

(assert (=> b!1030021 m!949531))

(declare-fun m!949537 () Bool)

(assert (=> b!1030021 m!949537))

(assert (=> b!1030022 m!949531))

(assert (=> b!1030022 m!949531))

(assert (=> b!1030022 m!949535))

(assert (=> b!1029782 d!123473))

(declare-fun d!123475 () Bool)

(assert (=> d!123475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (mask!29885 thiss!1427))))

(assert (=> d!123475 true))

(declare-fun _$44!18 () Unit!33629)

(assert (=> d!123475 (= (choose!25 (_keys!11288 thiss!1427) (index!41116 lt!454003) (mask!29885 thiss!1427)) _$44!18)))

(declare-fun bs!30095 () Bool)

(assert (= bs!30095 d!123475))

(assert (=> bs!30095 m!949121))

(assert (=> bs!30095 m!949361))

(assert (=> d!123405 d!123475))

(assert (=> d!123405 d!123429))

(declare-fun d!123477 () Bool)

(assert (=> d!123477 (= (apply!904 lt!454132 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16363 (getValueByKey!587 (toList!6860 lt!454132) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30096 () Bool)

(assert (= bs!30096 d!123477))

(declare-fun m!949539 () Bool)

(assert (=> bs!30096 m!949539))

(assert (=> bs!30096 m!949539))

(declare-fun m!949541 () Bool)

(assert (=> bs!30096 m!949541))

(assert (=> b!1029848 d!123477))

(declare-fun b!1030024 () Bool)

(declare-fun e!581600 () Bool)

(declare-fun e!581599 () Bool)

(assert (=> b!1030024 (= e!581600 e!581599)))

(declare-fun c!104117 () Bool)

(assert (=> b!1030024 (= c!104117 (validKeyInArray!0 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43533 () Bool)

(declare-fun call!43536 () Bool)

(assert (=> bm!43533 (= call!43536 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (mask!29885 thiss!1427)))))

(declare-fun b!1030025 () Bool)

(declare-fun e!581598 () Bool)

(assert (=> b!1030025 (= e!581598 call!43536)))

(declare-fun d!123479 () Bool)

(declare-fun res!688878 () Bool)

(assert (=> d!123479 (=> res!688878 e!581600)))

(assert (=> d!123479 (= res!688878 (bvsge #b00000000000000000000000000000000 (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))))

(assert (=> d!123479 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (mask!29885 thiss!1427)) e!581600)))

(declare-fun b!1030026 () Bool)

(assert (=> b!1030026 (= e!581599 e!581598)))

(declare-fun lt!454239 () (_ BitVec 64))

(assert (=> b!1030026 (= lt!454239 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454240 () Unit!33629)

(assert (=> b!1030026 (= lt!454240 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) lt!454239 #b00000000000000000000000000000000))))

(assert (=> b!1030026 (arrayContainsKey!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) lt!454239 #b00000000000000000000000000000000)))

(declare-fun lt!454238 () Unit!33629)

(assert (=> b!1030026 (= lt!454238 lt!454240)))

(declare-fun res!688877 () Bool)

(assert (=> b!1030026 (= res!688877 (= (seekEntryOrOpen!0 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000) (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (mask!29885 thiss!1427)) (Found!9686 #b00000000000000000000000000000000)))))

(assert (=> b!1030026 (=> (not res!688877) (not e!581598))))

(declare-fun b!1030027 () Bool)

(assert (=> b!1030027 (= e!581599 call!43536)))

(assert (= (and d!123479 (not res!688878)) b!1030024))

(assert (= (and b!1030024 c!104117) b!1030026))

(assert (= (and b!1030024 (not c!104117)) b!1030027))

(assert (= (and b!1030026 res!688877) b!1030025))

(assert (= (or b!1030025 b!1030027) bm!43533))

(assert (=> b!1030024 m!949531))

(assert (=> b!1030024 m!949531))

(assert (=> b!1030024 m!949535))

(declare-fun m!949543 () Bool)

(assert (=> bm!43533 m!949543))

(assert (=> b!1030026 m!949531))

(declare-fun m!949545 () Bool)

(assert (=> b!1030026 m!949545))

(declare-fun m!949547 () Bool)

(assert (=> b!1030026 m!949547))

(assert (=> b!1030026 m!949531))

(declare-fun m!949549 () Bool)

(assert (=> b!1030026 m!949549))

(assert (=> b!1029884 d!123479))

(declare-fun d!123481 () Bool)

(declare-fun res!688879 () Bool)

(declare-fun e!581601 () Bool)

(assert (=> d!123481 (=> res!688879 e!581601)))

(assert (=> d!123481 (= res!688879 (= (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123481 (= (arrayContainsKey!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) key!909 #b00000000000000000000000000000000) e!581601)))

(declare-fun b!1030028 () Bool)

(declare-fun e!581602 () Bool)

(assert (=> b!1030028 (= e!581601 e!581602)))

(declare-fun res!688880 () Bool)

(assert (=> b!1030028 (=> (not res!688880) (not e!581602))))

(assert (=> b!1030028 (= res!688880 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))))

(declare-fun b!1030029 () Bool)

(assert (=> b!1030029 (= e!581602 (arrayContainsKey!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123481 (not res!688879)) b!1030028))

(assert (= (and b!1030028 res!688880) b!1030029))

(assert (=> d!123481 m!949531))

(declare-fun m!949551 () Bool)

(assert (=> b!1030029 m!949551))

(assert (=> b!1029899 d!123481))

(assert (=> b!1029896 d!123437))

(assert (=> bm!43506 d!123443))

(assert (=> b!1029858 d!123427))

(declare-fun b!1030030 () Bool)

(declare-fun e!581603 () (_ BitVec 32))

(declare-fun call!43537 () (_ BitVec 32))

(assert (=> b!1030030 (= e!581603 call!43537)))

(declare-fun d!123483 () Bool)

(declare-fun lt!454241 () (_ BitVec 32))

(assert (=> d!123483 (and (bvsge lt!454241 #b00000000000000000000000000000000) (bvsle lt!454241 (bvsub (size!31671 (_keys!11288 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!581604 () (_ BitVec 32))

(assert (=> d!123483 (= lt!454241 e!581604)))

(declare-fun c!104118 () Bool)

(assert (=> d!123483 (= c!104118 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123483 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31671 (_keys!11288 thiss!1427)) (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123483 (= (arrayCountValidKeys!0 (_keys!11288 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))) lt!454241)))

(declare-fun bm!43534 () Bool)

(assert (=> bm!43534 (= call!43537 (arrayCountValidKeys!0 (_keys!11288 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun b!1030031 () Bool)

(assert (=> b!1030031 (= e!581604 #b00000000000000000000000000000000)))

(declare-fun b!1030032 () Bool)

(assert (=> b!1030032 (= e!581603 (bvadd #b00000000000000000000000000000001 call!43537))))

(declare-fun b!1030033 () Bool)

(assert (=> b!1030033 (= e!581604 e!581603)))

(declare-fun c!104119 () Bool)

(assert (=> b!1030033 (= c!104119 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!123483 c!104118) b!1030031))

(assert (= (and d!123483 (not c!104118)) b!1030033))

(assert (= (and b!1030033 c!104119) b!1030032))

(assert (= (and b!1030033 (not c!104119)) b!1030030))

(assert (= (or b!1030032 b!1030030) bm!43534))

(declare-fun m!949553 () Bool)

(assert (=> bm!43534 m!949553))

(declare-fun m!949555 () Bool)

(assert (=> b!1030033 m!949555))

(assert (=> b!1030033 m!949555))

(declare-fun m!949557 () Bool)

(assert (=> b!1030033 m!949557))

(assert (=> bm!43520 d!123483))

(declare-fun d!123485 () Bool)

(declare-fun e!581606 () Bool)

(assert (=> d!123485 e!581606))

(declare-fun res!688881 () Bool)

(assert (=> d!123485 (=> res!688881 e!581606)))

(declare-fun lt!454242 () Bool)

(assert (=> d!123485 (= res!688881 (not lt!454242))))

(declare-fun lt!454245 () Bool)

(assert (=> d!123485 (= lt!454242 lt!454245)))

(declare-fun lt!454243 () Unit!33629)

(declare-fun e!581605 () Unit!33629)

(assert (=> d!123485 (= lt!454243 e!581605)))

(declare-fun c!104120 () Bool)

(assert (=> d!123485 (= c!104120 lt!454245)))

(assert (=> d!123485 (= lt!454245 (containsKey!562 (toList!6860 lt!454107) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123485 (= (contains!5975 lt!454107 #b1000000000000000000000000000000000000000000000000000000000000000) lt!454242)))

(declare-fun b!1030034 () Bool)

(declare-fun lt!454244 () Unit!33629)

(assert (=> b!1030034 (= e!581605 lt!454244)))

(assert (=> b!1030034 (= lt!454244 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6860 lt!454107) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030034 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454107) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030035 () Bool)

(declare-fun Unit!33637 () Unit!33629)

(assert (=> b!1030035 (= e!581605 Unit!33637)))

(declare-fun b!1030036 () Bool)

(assert (=> b!1030036 (= e!581606 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123485 c!104120) b!1030034))

(assert (= (and d!123485 (not c!104120)) b!1030035))

(assert (= (and d!123485 (not res!688881)) b!1030036))

(declare-fun m!949559 () Bool)

(assert (=> d!123485 m!949559))

(declare-fun m!949561 () Bool)

(assert (=> b!1030034 m!949561))

(declare-fun m!949563 () Bool)

(assert (=> b!1030034 m!949563))

(assert (=> b!1030034 m!949563))

(declare-fun m!949565 () Bool)

(assert (=> b!1030034 m!949565))

(assert (=> b!1030036 m!949563))

(assert (=> b!1030036 m!949563))

(assert (=> b!1030036 m!949565))

(assert (=> bm!43505 d!123485))

(declare-fun d!123487 () Bool)

(declare-fun e!581608 () Bool)

(assert (=> d!123487 e!581608))

(declare-fun res!688882 () Bool)

(assert (=> d!123487 (=> res!688882 e!581608)))

(declare-fun lt!454246 () Bool)

(assert (=> d!123487 (= res!688882 (not lt!454246))))

(declare-fun lt!454249 () Bool)

(assert (=> d!123487 (= lt!454246 lt!454249)))

(declare-fun lt!454247 () Unit!33629)

(declare-fun e!581607 () Unit!33629)

(assert (=> d!123487 (= lt!454247 e!581607)))

(declare-fun c!104121 () Bool)

(assert (=> d!123487 (= c!104121 lt!454249)))

(assert (=> d!123487 (= lt!454249 (containsKey!562 (toList!6860 lt!454117) key!909))))

(assert (=> d!123487 (= (contains!5975 lt!454117 key!909) lt!454246)))

(declare-fun b!1030037 () Bool)

(declare-fun lt!454248 () Unit!33629)

(assert (=> b!1030037 (= e!581607 lt!454248)))

(assert (=> b!1030037 (= lt!454248 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6860 lt!454117) key!909))))

(assert (=> b!1030037 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454117) key!909))))

(declare-fun b!1030038 () Bool)

(declare-fun Unit!33638 () Unit!33629)

(assert (=> b!1030038 (= e!581607 Unit!33638)))

(declare-fun b!1030039 () Bool)

(assert (=> b!1030039 (= e!581608 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454117) key!909)))))

(assert (= (and d!123487 c!104121) b!1030037))

(assert (= (and d!123487 (not c!104121)) b!1030038))

(assert (= (and d!123487 (not res!688882)) b!1030039))

(declare-fun m!949567 () Bool)

(assert (=> d!123487 m!949567))

(declare-fun m!949569 () Bool)

(assert (=> b!1030037 m!949569))

(declare-fun m!949571 () Bool)

(assert (=> b!1030037 m!949571))

(assert (=> b!1030037 m!949571))

(declare-fun m!949573 () Bool)

(assert (=> b!1030037 m!949573))

(assert (=> b!1030039 m!949571))

(assert (=> b!1030039 m!949571))

(assert (=> b!1030039 m!949573))

(assert (=> d!123397 d!123487))

(declare-fun d!123489 () Bool)

(declare-fun e!581615 () Bool)

(assert (=> d!123489 e!581615))

(declare-fun res!688885 () Bool)

(assert (=> d!123489 (=> (not res!688885) (not e!581615))))

(declare-fun lt!454252 () List!21829)

(declare-fun isStrictlySorted!717 (List!21829) Bool)

(assert (=> d!123489 (= res!688885 (isStrictlySorted!717 lt!454252))))

(declare-fun e!581616 () List!21829)

(assert (=> d!123489 (= lt!454252 e!581616)))

(declare-fun c!104126 () Bool)

(assert (=> d!123489 (= c!104126 (and ((_ is Cons!21825) (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))) (= (_1!7797 (h!23026 (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427))))) key!909)))))

(assert (=> d!123489 (isStrictlySorted!717 (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427))))))

(assert (=> d!123489 (= (removeStrictlySorted!54 (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427))) key!909) lt!454252)))

(declare-fun b!1030050 () Bool)

(declare-fun e!581617 () List!21829)

(assert (=> b!1030050 (= e!581617 Nil!21826)))

(declare-fun b!1030051 () Bool)

(declare-fun $colon$colon!601 (List!21829 tuple2!15572) List!21829)

(assert (=> b!1030051 (= e!581617 ($colon$colon!601 (removeStrictlySorted!54 (t!30925 (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))) key!909) (h!23026 (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427))))))))

(declare-fun b!1030052 () Bool)

(assert (=> b!1030052 (= e!581616 (t!30925 (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))))

(declare-fun b!1030053 () Bool)

(assert (=> b!1030053 (= e!581616 e!581617)))

(declare-fun c!104127 () Bool)

(assert (=> b!1030053 (= c!104127 (and ((_ is Cons!21825) (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))) (not (= (_1!7797 (h!23026 (toList!6860 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427))))) key!909))))))

(declare-fun b!1030054 () Bool)

(assert (=> b!1030054 (= e!581615 (not (containsKey!562 lt!454252 key!909)))))

(assert (= (and d!123489 c!104126) b!1030052))

(assert (= (and d!123489 (not c!104126)) b!1030053))

(assert (= (and b!1030053 c!104127) b!1030051))

(assert (= (and b!1030053 (not c!104127)) b!1030050))

(assert (= (and d!123489 res!688885) b!1030054))

(declare-fun m!949575 () Bool)

(assert (=> d!123489 m!949575))

(declare-fun m!949577 () Bool)

(assert (=> d!123489 m!949577))

(declare-fun m!949579 () Bool)

(assert (=> b!1030051 m!949579))

(assert (=> b!1030051 m!949579))

(declare-fun m!949581 () Bool)

(assert (=> b!1030051 m!949581))

(declare-fun m!949583 () Bool)

(assert (=> b!1030054 m!949583))

(assert (=> d!123397 d!123489))

(assert (=> b!1029856 d!123427))

(assert (=> b!1029936 d!123427))

(declare-fun d!123491 () Bool)

(assert (=> d!123491 (= (apply!904 lt!454107 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)) (get!16363 (getValueByKey!587 (toList!6860 lt!454107) (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30097 () Bool)

(assert (= bs!30097 d!123491))

(assert (=> bs!30097 m!949233))

(declare-fun m!949585 () Bool)

(assert (=> bs!30097 m!949585))

(assert (=> bs!30097 m!949585))

(declare-fun m!949587 () Bool)

(assert (=> bs!30097 m!949587))

(assert (=> b!1029830 d!123491))

(declare-fun d!123493 () Bool)

(declare-fun c!104130 () Bool)

(assert (=> d!123493 (= c!104130 ((_ is ValueCellFull!11457) (select (arr!31156 (_values!6145 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581620 () V!37301)

(assert (=> d!123493 (= (get!16362 (select (arr!31156 (_values!6145 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581620)))

(declare-fun b!1030059 () Bool)

(declare-fun get!16364 (ValueCell!11457 V!37301) V!37301)

(assert (=> b!1030059 (= e!581620 (get!16364 (select (arr!31156 (_values!6145 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030060 () Bool)

(declare-fun get!16365 (ValueCell!11457 V!37301) V!37301)

(assert (=> b!1030060 (= e!581620 (get!16365 (select (arr!31156 (_values!6145 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123493 c!104130) b!1030059))

(assert (= (and d!123493 (not c!104130)) b!1030060))

(assert (=> b!1030059 m!949279))

(assert (=> b!1030059 m!949151))

(declare-fun m!949589 () Bool)

(assert (=> b!1030059 m!949589))

(assert (=> b!1030060 m!949279))

(assert (=> b!1030060 m!949151))

(declare-fun m!949591 () Bool)

(assert (=> b!1030060 m!949591))

(assert (=> b!1029830 d!123493))

(declare-fun d!123495 () Bool)

(declare-fun e!581622 () Bool)

(assert (=> d!123495 e!581622))

(declare-fun res!688886 () Bool)

(assert (=> d!123495 (=> res!688886 e!581622)))

(declare-fun lt!454253 () Bool)

(assert (=> d!123495 (= res!688886 (not lt!454253))))

(declare-fun lt!454256 () Bool)

(assert (=> d!123495 (= lt!454253 lt!454256)))

(declare-fun lt!454254 () Unit!33629)

(declare-fun e!581621 () Unit!33629)

(assert (=> d!123495 (= lt!454254 e!581621)))

(declare-fun c!104131 () Bool)

(assert (=> d!123495 (= c!104131 lt!454256)))

(assert (=> d!123495 (= lt!454256 (containsKey!562 (toList!6860 lt!454107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123495 (= (contains!5975 lt!454107 #b0000000000000000000000000000000000000000000000000000000000000000) lt!454253)))

(declare-fun b!1030061 () Bool)

(declare-fun lt!454255 () Unit!33629)

(assert (=> b!1030061 (= e!581621 lt!454255)))

(assert (=> b!1030061 (= lt!454255 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6860 lt!454107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030061 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030062 () Bool)

(declare-fun Unit!33639 () Unit!33629)

(assert (=> b!1030062 (= e!581621 Unit!33639)))

(declare-fun b!1030063 () Bool)

(assert (=> b!1030063 (= e!581622 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123495 c!104131) b!1030061))

(assert (= (and d!123495 (not c!104131)) b!1030062))

(assert (= (and d!123495 (not res!688886)) b!1030063))

(declare-fun m!949593 () Bool)

(assert (=> d!123495 m!949593))

(declare-fun m!949595 () Bool)

(assert (=> b!1030061 m!949595))

(declare-fun m!949597 () Bool)

(assert (=> b!1030061 m!949597))

(assert (=> b!1030061 m!949597))

(declare-fun m!949599 () Bool)

(assert (=> b!1030061 m!949599))

(assert (=> b!1030063 m!949597))

(assert (=> b!1030063 m!949597))

(assert (=> b!1030063 m!949599))

(assert (=> bm!43509 d!123495))

(declare-fun d!123497 () Bool)

(declare-fun e!581623 () Bool)

(assert (=> d!123497 e!581623))

(declare-fun res!688888 () Bool)

(assert (=> d!123497 (=> (not res!688888) (not e!581623))))

(declare-fun lt!454258 () ListLongMap!13689)

(assert (=> d!123497 (= res!688888 (contains!5975 lt!454258 (_1!7797 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427)))))))

(declare-fun lt!454259 () List!21829)

(assert (=> d!123497 (= lt!454258 (ListLongMap!13690 lt!454259))))

(declare-fun lt!454257 () Unit!33629)

(declare-fun lt!454260 () Unit!33629)

(assert (=> d!123497 (= lt!454257 lt!454260)))

(assert (=> d!123497 (= (getValueByKey!587 lt!454259 (_1!7797 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123497 (= lt!454260 (lemmaContainsTupThenGetReturnValue!278 lt!454259 (_1!7797 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123497 (= lt!454259 (insertStrictlySorted!371 (toList!6860 lt!454118) (_1!7797 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123497 (= (+!3102 lt!454118 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427))) lt!454258)))

(declare-fun b!1030064 () Bool)

(declare-fun res!688887 () Bool)

(assert (=> b!1030064 (=> (not res!688887) (not e!581623))))

(assert (=> b!1030064 (= res!688887 (= (getValueByKey!587 (toList!6860 lt!454258) (_1!7797 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427))))))))

(declare-fun b!1030065 () Bool)

(assert (=> b!1030065 (= e!581623 (contains!5977 (toList!6860 lt!454258) (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427))))))

(assert (= (and d!123497 res!688888) b!1030064))

(assert (= (and b!1030064 res!688887) b!1030065))

(declare-fun m!949601 () Bool)

(assert (=> d!123497 m!949601))

(declare-fun m!949603 () Bool)

(assert (=> d!123497 m!949603))

(declare-fun m!949605 () Bool)

(assert (=> d!123497 m!949605))

(declare-fun m!949607 () Bool)

(assert (=> d!123497 m!949607))

(declare-fun m!949609 () Bool)

(assert (=> b!1030064 m!949609))

(declare-fun m!949611 () Bool)

(assert (=> b!1030065 m!949611))

(assert (=> b!1029855 d!123497))

(declare-fun b!1030066 () Bool)

(declare-fun e!581628 () Bool)

(assert (=> b!1030066 (= e!581628 (validKeyInArray!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(assert (=> b!1030066 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1030067 () Bool)

(declare-fun e!581626 () Bool)

(declare-fun lt!454262 () ListLongMap!13689)

(assert (=> b!1030067 (= e!581626 (isEmpty!925 lt!454262))))

(declare-fun d!123499 () Bool)

(declare-fun e!581625 () Bool)

(assert (=> d!123499 e!581625))

(declare-fun res!688890 () Bool)

(assert (=> d!123499 (=> (not res!688890) (not e!581625))))

(assert (=> d!123499 (= res!688890 (not (contains!5975 lt!454262 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!581624 () ListLongMap!13689)

(assert (=> d!123499 (= lt!454262 e!581624)))

(declare-fun c!104132 () Bool)

(assert (=> d!123499 (= c!104132 (bvsge #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(assert (=> d!123499 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123499 (= (getCurrentListMapNoExtraKeys!3518 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)) lt!454262)))

(declare-fun b!1030068 () Bool)

(declare-fun e!581629 () Bool)

(assert (=> b!1030068 (= e!581625 e!581629)))

(declare-fun c!104133 () Bool)

(assert (=> b!1030068 (= c!104133 e!581628)))

(declare-fun res!688889 () Bool)

(assert (=> b!1030068 (=> (not res!688889) (not e!581628))))

(assert (=> b!1030068 (= res!688889 (bvslt #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(declare-fun b!1030069 () Bool)

(declare-fun e!581630 () ListLongMap!13689)

(assert (=> b!1030069 (= e!581624 e!581630)))

(declare-fun c!104135 () Bool)

(assert (=> b!1030069 (= c!104135 (validKeyInArray!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun b!1030070 () Bool)

(declare-fun lt!454266 () Unit!33629)

(declare-fun lt!454261 () Unit!33629)

(assert (=> b!1030070 (= lt!454266 lt!454261)))

(declare-fun lt!454265 () ListLongMap!13689)

(declare-fun lt!454264 () V!37301)

(declare-fun lt!454267 () (_ BitVec 64))

(declare-fun lt!454263 () (_ BitVec 64))

(assert (=> b!1030070 (not (contains!5975 (+!3102 lt!454265 (tuple2!15573 lt!454267 lt!454264)) lt!454263))))

(assert (=> b!1030070 (= lt!454261 (addStillNotContains!241 lt!454265 lt!454267 lt!454264 lt!454263))))

(assert (=> b!1030070 (= lt!454263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1030070 (= lt!454264 (get!16362 (select (arr!31156 lt!454000) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1030070 (= lt!454267 (select (arr!31155 lt!453998) #b00000000000000000000000000000000))))

(declare-fun call!43538 () ListLongMap!13689)

(assert (=> b!1030070 (= lt!454265 call!43538)))

(assert (=> b!1030070 (= e!581630 (+!3102 call!43538 (tuple2!15573 (select (arr!31155 lt!453998) #b00000000000000000000000000000000) (get!16362 (select (arr!31156 lt!454000) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1030071 () Bool)

(assert (=> b!1030071 (= e!581624 (ListLongMap!13690 Nil!21826))))

(declare-fun b!1030072 () Bool)

(assert (=> b!1030072 (= e!581626 (= lt!454262 (getCurrentListMapNoExtraKeys!3518 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6122 thiss!1427))))))

(declare-fun b!1030073 () Bool)

(assert (=> b!1030073 (= e!581629 e!581626)))

(declare-fun c!104134 () Bool)

(assert (=> b!1030073 (= c!104134 (bvslt #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(declare-fun b!1030074 () Bool)

(declare-fun e!581627 () Bool)

(assert (=> b!1030074 (= e!581629 e!581627)))

(assert (=> b!1030074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(declare-fun res!688892 () Bool)

(assert (=> b!1030074 (= res!688892 (contains!5975 lt!454262 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(assert (=> b!1030074 (=> (not res!688892) (not e!581627))))

(declare-fun b!1030075 () Bool)

(declare-fun res!688891 () Bool)

(assert (=> b!1030075 (=> (not res!688891) (not e!581625))))

(assert (=> b!1030075 (= res!688891 (not (contains!5975 lt!454262 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030076 () Bool)

(assert (=> b!1030076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 lt!453998)))))

(assert (=> b!1030076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31672 lt!454000)))))

(assert (=> b!1030076 (= e!581627 (= (apply!904 lt!454262 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)) (get!16362 (select (arr!31156 lt!454000) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!43535 () Bool)

(assert (=> bm!43535 (= call!43538 (getCurrentListMapNoExtraKeys!3518 lt!453998 lt!454000 (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6122 thiss!1427)))))

(declare-fun b!1030077 () Bool)

(assert (=> b!1030077 (= e!581630 call!43538)))

(assert (= (and d!123499 c!104132) b!1030071))

(assert (= (and d!123499 (not c!104132)) b!1030069))

(assert (= (and b!1030069 c!104135) b!1030070))

(assert (= (and b!1030069 (not c!104135)) b!1030077))

(assert (= (or b!1030070 b!1030077) bm!43535))

(assert (= (and d!123499 res!688890) b!1030075))

(assert (= (and b!1030075 res!688891) b!1030068))

(assert (= (and b!1030068 res!688889) b!1030066))

(assert (= (and b!1030068 c!104133) b!1030074))

(assert (= (and b!1030068 (not c!104133)) b!1030073))

(assert (= (and b!1030074 res!688892) b!1030076))

(assert (= (and b!1030073 c!104134) b!1030072))

(assert (= (and b!1030073 (not c!104134)) b!1030067))

(declare-fun b_lambda!15915 () Bool)

(assert (=> (not b_lambda!15915) (not b!1030070)))

(assert (=> b!1030070 t!30924))

(declare-fun b_and!32963 () Bool)

(assert (= b_and!32961 (and (=> t!30924 result!14163) b_and!32963)))

(declare-fun b_lambda!15917 () Bool)

(assert (=> (not b_lambda!15917) (not b!1030076)))

(assert (=> b!1030076 t!30924))

(declare-fun b_and!32965 () Bool)

(assert (= b_and!32963 (and (=> t!30924 result!14163) b_and!32965)))

(declare-fun m!949613 () Bool)

(assert (=> b!1030075 m!949613))

(assert (=> b!1030066 m!949293))

(assert (=> b!1030066 m!949293))

(assert (=> b!1030066 m!949295))

(declare-fun m!949615 () Bool)

(assert (=> b!1030072 m!949615))

(assert (=> b!1030074 m!949293))

(assert (=> b!1030074 m!949293))

(declare-fun m!949617 () Bool)

(assert (=> b!1030074 m!949617))

(assert (=> bm!43535 m!949615))

(declare-fun m!949619 () Bool)

(assert (=> b!1030067 m!949619))

(assert (=> b!1030069 m!949293))

(assert (=> b!1030069 m!949293))

(assert (=> b!1030069 m!949295))

(assert (=> b!1030076 m!949339))

(assert (=> b!1030076 m!949151))

(assert (=> b!1030076 m!949341))

(assert (=> b!1030076 m!949339))

(assert (=> b!1030076 m!949151))

(assert (=> b!1030076 m!949293))

(declare-fun m!949621 () Bool)

(assert (=> b!1030076 m!949621))

(assert (=> b!1030076 m!949293))

(assert (=> b!1030070 m!949339))

(assert (=> b!1030070 m!949151))

(assert (=> b!1030070 m!949341))

(assert (=> b!1030070 m!949339))

(declare-fun m!949623 () Bool)

(assert (=> b!1030070 m!949623))

(assert (=> b!1030070 m!949151))

(declare-fun m!949625 () Bool)

(assert (=> b!1030070 m!949625))

(declare-fun m!949627 () Bool)

(assert (=> b!1030070 m!949627))

(assert (=> b!1030070 m!949625))

(declare-fun m!949629 () Bool)

(assert (=> b!1030070 m!949629))

(assert (=> b!1030070 m!949293))

(declare-fun m!949631 () Bool)

(assert (=> d!123499 m!949631))

(assert (=> d!123499 m!949219))

(assert (=> b!1029855 d!123499))

(declare-fun d!123501 () Bool)

(assert (=> d!123501 (= (apply!904 (+!3102 lt!454124 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427))) lt!454136) (get!16363 (getValueByKey!587 (toList!6860 (+!3102 lt!454124 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427)))) lt!454136)))))

(declare-fun bs!30098 () Bool)

(assert (= bs!30098 d!123501))

(declare-fun m!949633 () Bool)

(assert (=> bs!30098 m!949633))

(assert (=> bs!30098 m!949633))

(declare-fun m!949635 () Bool)

(assert (=> bs!30098 m!949635))

(assert (=> b!1029855 d!123501))

(declare-fun d!123503 () Bool)

(assert (=> d!123503 (= (apply!904 (+!3102 lt!454118 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427))) lt!454134) (apply!904 lt!454118 lt!454134))))

(declare-fun lt!454268 () Unit!33629)

(assert (=> d!123503 (= lt!454268 (choose!1693 lt!454118 lt!454122 (zeroValue!5958 thiss!1427) lt!454134))))

(declare-fun e!581631 () Bool)

(assert (=> d!123503 e!581631))

(declare-fun res!688893 () Bool)

(assert (=> d!123503 (=> (not res!688893) (not e!581631))))

(assert (=> d!123503 (= res!688893 (contains!5975 lt!454118 lt!454134))))

(assert (=> d!123503 (= (addApplyDifferent!483 lt!454118 lt!454122 (zeroValue!5958 thiss!1427) lt!454134) lt!454268)))

(declare-fun b!1030078 () Bool)

(assert (=> b!1030078 (= e!581631 (not (= lt!454134 lt!454122)))))

(assert (= (and d!123503 res!688893) b!1030078))

(declare-fun m!949637 () Bool)

(assert (=> d!123503 m!949637))

(declare-fun m!949639 () Bool)

(assert (=> d!123503 m!949639))

(assert (=> d!123503 m!949319))

(assert (=> d!123503 m!949327))

(assert (=> d!123503 m!949311))

(assert (=> d!123503 m!949319))

(assert (=> b!1029855 d!123503))

(declare-fun d!123505 () Bool)

(declare-fun e!581632 () Bool)

(assert (=> d!123505 e!581632))

(declare-fun res!688895 () Bool)

(assert (=> d!123505 (=> (not res!688895) (not e!581632))))

(declare-fun lt!454270 () ListLongMap!13689)

(assert (=> d!123505 (= res!688895 (contains!5975 lt!454270 (_1!7797 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427)))))))

(declare-fun lt!454271 () List!21829)

(assert (=> d!123505 (= lt!454270 (ListLongMap!13690 lt!454271))))

(declare-fun lt!454269 () Unit!33629)

(declare-fun lt!454272 () Unit!33629)

(assert (=> d!123505 (= lt!454269 lt!454272)))

(assert (=> d!123505 (= (getValueByKey!587 lt!454271 (_1!7797 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427)))))))

(assert (=> d!123505 (= lt!454272 (lemmaContainsTupThenGetReturnValue!278 lt!454271 (_1!7797 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427)))))))

(assert (=> d!123505 (= lt!454271 (insertStrictlySorted!371 (toList!6860 lt!454119) (_1!7797 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427)))))))

(assert (=> d!123505 (= (+!3102 lt!454119 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427))) lt!454270)))

(declare-fun b!1030079 () Bool)

(declare-fun res!688894 () Bool)

(assert (=> b!1030079 (=> (not res!688894) (not e!581632))))

(assert (=> b!1030079 (= res!688894 (= (getValueByKey!587 (toList!6860 lt!454270) (_1!7797 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427))))))))

(declare-fun b!1030080 () Bool)

(assert (=> b!1030080 (= e!581632 (contains!5977 (toList!6860 lt!454270) (tuple2!15573 lt!454138 (minValue!5958 thiss!1427))))))

(assert (= (and d!123505 res!688895) b!1030079))

(assert (= (and b!1030079 res!688894) b!1030080))

(declare-fun m!949641 () Bool)

(assert (=> d!123505 m!949641))

(declare-fun m!949643 () Bool)

(assert (=> d!123505 m!949643))

(declare-fun m!949645 () Bool)

(assert (=> d!123505 m!949645))

(declare-fun m!949647 () Bool)

(assert (=> d!123505 m!949647))

(declare-fun m!949649 () Bool)

(assert (=> b!1030079 m!949649))

(declare-fun m!949651 () Bool)

(assert (=> b!1030080 m!949651))

(assert (=> b!1029855 d!123505))

(declare-fun d!123507 () Bool)

(assert (=> d!123507 (= (apply!904 (+!3102 lt!454119 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427))) lt!454120) (apply!904 lt!454119 lt!454120))))

(declare-fun lt!454273 () Unit!33629)

(assert (=> d!123507 (= lt!454273 (choose!1693 lt!454119 lt!454138 (minValue!5958 thiss!1427) lt!454120))))

(declare-fun e!581633 () Bool)

(assert (=> d!123507 e!581633))

(declare-fun res!688896 () Bool)

(assert (=> d!123507 (=> (not res!688896) (not e!581633))))

(assert (=> d!123507 (= res!688896 (contains!5975 lt!454119 lt!454120))))

(assert (=> d!123507 (= (addApplyDifferent!483 lt!454119 lt!454138 (minValue!5958 thiss!1427) lt!454120) lt!454273)))

(declare-fun b!1030081 () Bool)

(assert (=> b!1030081 (= e!581633 (not (= lt!454120 lt!454138)))))

(assert (= (and d!123507 res!688896) b!1030081))

(declare-fun m!949653 () Bool)

(assert (=> d!123507 m!949653))

(declare-fun m!949655 () Bool)

(assert (=> d!123507 m!949655))

(assert (=> d!123507 m!949301))

(assert (=> d!123507 m!949315))

(assert (=> d!123507 m!949325))

(assert (=> d!123507 m!949301))

(assert (=> b!1029855 d!123507))

(declare-fun d!123509 () Bool)

(assert (=> d!123509 (= (apply!904 lt!454119 lt!454120) (get!16363 (getValueByKey!587 (toList!6860 lt!454119) lt!454120)))))

(declare-fun bs!30099 () Bool)

(assert (= bs!30099 d!123509))

(declare-fun m!949657 () Bool)

(assert (=> bs!30099 m!949657))

(assert (=> bs!30099 m!949657))

(declare-fun m!949659 () Bool)

(assert (=> bs!30099 m!949659))

(assert (=> b!1029855 d!123509))

(declare-fun d!123511 () Bool)

(assert (=> d!123511 (contains!5975 (+!3102 lt!454139 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427))) lt!454126)))

(declare-fun lt!454274 () Unit!33629)

(assert (=> d!123511 (= lt!454274 (choose!1694 lt!454139 lt!454135 (zeroValue!5958 thiss!1427) lt!454126))))

(assert (=> d!123511 (contains!5975 lt!454139 lt!454126)))

(assert (=> d!123511 (= (addStillContains!623 lt!454139 lt!454135 (zeroValue!5958 thiss!1427) lt!454126) lt!454274)))

(declare-fun bs!30100 () Bool)

(assert (= bs!30100 d!123511))

(assert (=> bs!30100 m!949313))

(assert (=> bs!30100 m!949313))

(assert (=> bs!30100 m!949321))

(declare-fun m!949661 () Bool)

(assert (=> bs!30100 m!949661))

(declare-fun m!949663 () Bool)

(assert (=> bs!30100 m!949663))

(assert (=> b!1029855 d!123511))

(declare-fun d!123513 () Bool)

(assert (=> d!123513 (= (apply!904 (+!3102 lt!454124 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427))) lt!454136) (apply!904 lt!454124 lt!454136))))

(declare-fun lt!454275 () Unit!33629)

(assert (=> d!123513 (= lt!454275 (choose!1693 lt!454124 lt!454127 (minValue!5958 thiss!1427) lt!454136))))

(declare-fun e!581634 () Bool)

(assert (=> d!123513 e!581634))

(declare-fun res!688897 () Bool)

(assert (=> d!123513 (=> (not res!688897) (not e!581634))))

(assert (=> d!123513 (= res!688897 (contains!5975 lt!454124 lt!454136))))

(assert (=> d!123513 (= (addApplyDifferent!483 lt!454124 lt!454127 (minValue!5958 thiss!1427) lt!454136) lt!454275)))

(declare-fun b!1030082 () Bool)

(assert (=> b!1030082 (= e!581634 (not (= lt!454136 lt!454127)))))

(assert (= (and d!123513 res!688897) b!1030082))

(declare-fun m!949665 () Bool)

(assert (=> d!123513 m!949665))

(declare-fun m!949667 () Bool)

(assert (=> d!123513 m!949667))

(assert (=> d!123513 m!949307))

(assert (=> d!123513 m!949309))

(assert (=> d!123513 m!949329))

(assert (=> d!123513 m!949307))

(assert (=> b!1029855 d!123513))

(declare-fun d!123515 () Bool)

(assert (=> d!123515 (= (apply!904 lt!454124 lt!454136) (get!16363 (getValueByKey!587 (toList!6860 lt!454124) lt!454136)))))

(declare-fun bs!30101 () Bool)

(assert (= bs!30101 d!123515))

(declare-fun m!949669 () Bool)

(assert (=> bs!30101 m!949669))

(assert (=> bs!30101 m!949669))

(declare-fun m!949671 () Bool)

(assert (=> bs!30101 m!949671))

(assert (=> b!1029855 d!123515))

(declare-fun d!123517 () Bool)

(declare-fun e!581635 () Bool)

(assert (=> d!123517 e!581635))

(declare-fun res!688899 () Bool)

(assert (=> d!123517 (=> (not res!688899) (not e!581635))))

(declare-fun lt!454277 () ListLongMap!13689)

(assert (=> d!123517 (= res!688899 (contains!5975 lt!454277 (_1!7797 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427)))))))

(declare-fun lt!454278 () List!21829)

(assert (=> d!123517 (= lt!454277 (ListLongMap!13690 lt!454278))))

(declare-fun lt!454276 () Unit!33629)

(declare-fun lt!454279 () Unit!33629)

(assert (=> d!123517 (= lt!454276 lt!454279)))

(assert (=> d!123517 (= (getValueByKey!587 lt!454278 (_1!7797 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427)))))))

(assert (=> d!123517 (= lt!454279 (lemmaContainsTupThenGetReturnValue!278 lt!454278 (_1!7797 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427)))))))

(assert (=> d!123517 (= lt!454278 (insertStrictlySorted!371 (toList!6860 lt!454124) (_1!7797 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427)))))))

(assert (=> d!123517 (= (+!3102 lt!454124 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427))) lt!454277)))

(declare-fun b!1030083 () Bool)

(declare-fun res!688898 () Bool)

(assert (=> b!1030083 (=> (not res!688898) (not e!581635))))

(assert (=> b!1030083 (= res!688898 (= (getValueByKey!587 (toList!6860 lt!454277) (_1!7797 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454127 (minValue!5958 thiss!1427))))))))

(declare-fun b!1030084 () Bool)

(assert (=> b!1030084 (= e!581635 (contains!5977 (toList!6860 lt!454277) (tuple2!15573 lt!454127 (minValue!5958 thiss!1427))))))

(assert (= (and d!123517 res!688899) b!1030083))

(assert (= (and b!1030083 res!688898) b!1030084))

(declare-fun m!949673 () Bool)

(assert (=> d!123517 m!949673))

(declare-fun m!949675 () Bool)

(assert (=> d!123517 m!949675))

(declare-fun m!949677 () Bool)

(assert (=> d!123517 m!949677))

(declare-fun m!949679 () Bool)

(assert (=> d!123517 m!949679))

(declare-fun m!949681 () Bool)

(assert (=> b!1030083 m!949681))

(declare-fun m!949683 () Bool)

(assert (=> b!1030084 m!949683))

(assert (=> b!1029855 d!123517))

(declare-fun d!123519 () Bool)

(declare-fun e!581636 () Bool)

(assert (=> d!123519 e!581636))

(declare-fun res!688901 () Bool)

(assert (=> d!123519 (=> (not res!688901) (not e!581636))))

(declare-fun lt!454281 () ListLongMap!13689)

(assert (=> d!123519 (= res!688901 (contains!5975 lt!454281 (_1!7797 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))))))

(declare-fun lt!454282 () List!21829)

(assert (=> d!123519 (= lt!454281 (ListLongMap!13690 lt!454282))))

(declare-fun lt!454280 () Unit!33629)

(declare-fun lt!454283 () Unit!33629)

(assert (=> d!123519 (= lt!454280 lt!454283)))

(assert (=> d!123519 (= (getValueByKey!587 lt!454282 (_1!7797 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123519 (= lt!454283 (lemmaContainsTupThenGetReturnValue!278 lt!454282 (_1!7797 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123519 (= lt!454282 (insertStrictlySorted!371 (toList!6860 lt!454139) (_1!7797 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))))))

(assert (=> d!123519 (= (+!3102 lt!454139 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427))) lt!454281)))

(declare-fun b!1030085 () Bool)

(declare-fun res!688900 () Bool)

(assert (=> b!1030085 (=> (not res!688900) (not e!581636))))

(assert (=> b!1030085 (= res!688900 (= (getValueByKey!587 (toList!6860 lt!454281) (_1!7797 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427))))))))

(declare-fun b!1030086 () Bool)

(assert (=> b!1030086 (= e!581636 (contains!5977 (toList!6860 lt!454281) (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427))))))

(assert (= (and d!123519 res!688901) b!1030085))

(assert (= (and b!1030085 res!688900) b!1030086))

(declare-fun m!949685 () Bool)

(assert (=> d!123519 m!949685))

(declare-fun m!949687 () Bool)

(assert (=> d!123519 m!949687))

(declare-fun m!949689 () Bool)

(assert (=> d!123519 m!949689))

(declare-fun m!949691 () Bool)

(assert (=> d!123519 m!949691))

(declare-fun m!949693 () Bool)

(assert (=> b!1030085 m!949693))

(declare-fun m!949695 () Bool)

(assert (=> b!1030086 m!949695))

(assert (=> b!1029855 d!123519))

(declare-fun d!123521 () Bool)

(declare-fun e!581638 () Bool)

(assert (=> d!123521 e!581638))

(declare-fun res!688902 () Bool)

(assert (=> d!123521 (=> res!688902 e!581638)))

(declare-fun lt!454284 () Bool)

(assert (=> d!123521 (= res!688902 (not lt!454284))))

(declare-fun lt!454287 () Bool)

(assert (=> d!123521 (= lt!454284 lt!454287)))

(declare-fun lt!454285 () Unit!33629)

(declare-fun e!581637 () Unit!33629)

(assert (=> d!123521 (= lt!454285 e!581637)))

(declare-fun c!104136 () Bool)

(assert (=> d!123521 (= c!104136 lt!454287)))

(assert (=> d!123521 (= lt!454287 (containsKey!562 (toList!6860 (+!3102 lt!454139 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))) lt!454126))))

(assert (=> d!123521 (= (contains!5975 (+!3102 lt!454139 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427))) lt!454126) lt!454284)))

(declare-fun b!1030087 () Bool)

(declare-fun lt!454286 () Unit!33629)

(assert (=> b!1030087 (= e!581637 lt!454286)))

(assert (=> b!1030087 (= lt!454286 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6860 (+!3102 lt!454139 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))) lt!454126))))

(assert (=> b!1030087 (isDefined!434 (getValueByKey!587 (toList!6860 (+!3102 lt!454139 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))) lt!454126))))

(declare-fun b!1030088 () Bool)

(declare-fun Unit!33640 () Unit!33629)

(assert (=> b!1030088 (= e!581637 Unit!33640)))

(declare-fun b!1030089 () Bool)

(assert (=> b!1030089 (= e!581638 (isDefined!434 (getValueByKey!587 (toList!6860 (+!3102 lt!454139 (tuple2!15573 lt!454135 (zeroValue!5958 thiss!1427)))) lt!454126)))))

(assert (= (and d!123521 c!104136) b!1030087))

(assert (= (and d!123521 (not c!104136)) b!1030088))

(assert (= (and d!123521 (not res!688902)) b!1030089))

(declare-fun m!949697 () Bool)

(assert (=> d!123521 m!949697))

(declare-fun m!949699 () Bool)

(assert (=> b!1030087 m!949699))

(declare-fun m!949701 () Bool)

(assert (=> b!1030087 m!949701))

(assert (=> b!1030087 m!949701))

(declare-fun m!949703 () Bool)

(assert (=> b!1030087 m!949703))

(assert (=> b!1030089 m!949701))

(assert (=> b!1030089 m!949701))

(assert (=> b!1030089 m!949703))

(assert (=> b!1029855 d!123521))

(declare-fun d!123523 () Bool)

(assert (=> d!123523 (= (apply!904 lt!454118 lt!454134) (get!16363 (getValueByKey!587 (toList!6860 lt!454118) lt!454134)))))

(declare-fun bs!30102 () Bool)

(assert (= bs!30102 d!123523))

(declare-fun m!949705 () Bool)

(assert (=> bs!30102 m!949705))

(assert (=> bs!30102 m!949705))

(declare-fun m!949707 () Bool)

(assert (=> bs!30102 m!949707))

(assert (=> b!1029855 d!123523))

(declare-fun d!123525 () Bool)

(assert (=> d!123525 (= (apply!904 (+!3102 lt!454118 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427))) lt!454134) (get!16363 (getValueByKey!587 (toList!6860 (+!3102 lt!454118 (tuple2!15573 lt!454122 (zeroValue!5958 thiss!1427)))) lt!454134)))))

(declare-fun bs!30103 () Bool)

(assert (= bs!30103 d!123525))

(declare-fun m!949709 () Bool)

(assert (=> bs!30103 m!949709))

(assert (=> bs!30103 m!949709))

(declare-fun m!949711 () Bool)

(assert (=> bs!30103 m!949711))

(assert (=> b!1029855 d!123525))

(declare-fun d!123527 () Bool)

(assert (=> d!123527 (= (apply!904 (+!3102 lt!454119 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427))) lt!454120) (get!16363 (getValueByKey!587 (toList!6860 (+!3102 lt!454119 (tuple2!15573 lt!454138 (minValue!5958 thiss!1427)))) lt!454120)))))

(declare-fun bs!30104 () Bool)

(assert (= bs!30104 d!123527))

(declare-fun m!949713 () Bool)

(assert (=> bs!30104 m!949713))

(assert (=> bs!30104 m!949713))

(declare-fun m!949715 () Bool)

(assert (=> bs!30104 m!949715))

(assert (=> b!1029855 d!123527))

(declare-fun bm!43536 () Bool)

(declare-fun call!43539 () Bool)

(declare-fun c!104137 () Bool)

(assert (=> bm!43536 (= call!43539 (arrayNoDuplicates!0 (_keys!11288 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104137 (Cons!21826 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000) Nil!21827) Nil!21827)))))

(declare-fun d!123529 () Bool)

(declare-fun res!688905 () Bool)

(declare-fun e!581641 () Bool)

(assert (=> d!123529 (=> res!688905 e!581641)))

(assert (=> d!123529 (= res!688905 (bvsge #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123529 (= (arrayNoDuplicates!0 (_keys!11288 thiss!1427) #b00000000000000000000000000000000 Nil!21827) e!581641)))

(declare-fun b!1030090 () Bool)

(declare-fun e!581639 () Bool)

(assert (=> b!1030090 (= e!581639 call!43539)))

(declare-fun b!1030091 () Bool)

(declare-fun e!581640 () Bool)

(assert (=> b!1030091 (= e!581640 e!581639)))

(assert (=> b!1030091 (= c!104137 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030092 () Bool)

(declare-fun e!581642 () Bool)

(assert (=> b!1030092 (= e!581642 (contains!5976 Nil!21827 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030093 () Bool)

(assert (=> b!1030093 (= e!581641 e!581640)))

(declare-fun res!688903 () Bool)

(assert (=> b!1030093 (=> (not res!688903) (not e!581640))))

(assert (=> b!1030093 (= res!688903 (not e!581642))))

(declare-fun res!688904 () Bool)

(assert (=> b!1030093 (=> (not res!688904) (not e!581642))))

(assert (=> b!1030093 (= res!688904 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030094 () Bool)

(assert (=> b!1030094 (= e!581639 call!43539)))

(assert (= (and d!123529 (not res!688905)) b!1030093))

(assert (= (and b!1030093 res!688904) b!1030092))

(assert (= (and b!1030093 res!688903) b!1030091))

(assert (= (and b!1030091 c!104137) b!1030094))

(assert (= (and b!1030091 (not c!104137)) b!1030090))

(assert (= (or b!1030094 b!1030090) bm!43536))

(assert (=> bm!43536 m!949233))

(declare-fun m!949717 () Bool)

(assert (=> bm!43536 m!949717))

(assert (=> b!1030091 m!949233))

(assert (=> b!1030091 m!949233))

(assert (=> b!1030091 m!949235))

(assert (=> b!1030092 m!949233))

(assert (=> b!1030092 m!949233))

(declare-fun m!949719 () Bool)

(assert (=> b!1030092 m!949719))

(assert (=> b!1030093 m!949233))

(assert (=> b!1030093 m!949233))

(assert (=> b!1030093 m!949235))

(assert (=> b!1029761 d!123529))

(declare-fun d!123531 () Bool)

(declare-fun e!581643 () Bool)

(assert (=> d!123531 e!581643))

(declare-fun res!688907 () Bool)

(assert (=> d!123531 (=> (not res!688907) (not e!581643))))

(declare-fun lt!454289 () ListLongMap!13689)

(assert (=> d!123531 (= res!688907 (contains!5975 lt!454289 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(declare-fun lt!454290 () List!21829)

(assert (=> d!123531 (= lt!454289 (ListLongMap!13690 lt!454290))))

(declare-fun lt!454288 () Unit!33629)

(declare-fun lt!454291 () Unit!33629)

(assert (=> d!123531 (= lt!454288 lt!454291)))

(assert (=> d!123531 (= (getValueByKey!587 lt!454290 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (=> d!123531 (= lt!454291 (lemmaContainsTupThenGetReturnValue!278 lt!454290 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (=> d!123531 (= lt!454290 (insertStrictlySorted!371 (toList!6860 call!43507) (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (=> d!123531 (= (+!3102 call!43507 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))) lt!454289)))

(declare-fun b!1030095 () Bool)

(declare-fun res!688906 () Bool)

(assert (=> b!1030095 (=> (not res!688906) (not e!581643))))

(assert (=> b!1030095 (= res!688906 (= (getValueByKey!587 (toList!6860 lt!454289) (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(declare-fun b!1030096 () Bool)

(assert (=> b!1030096 (= e!581643 (contains!5977 (toList!6860 lt!454289) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))

(assert (= (and d!123531 res!688907) b!1030095))

(assert (= (and b!1030095 res!688906) b!1030096))

(declare-fun m!949721 () Bool)

(assert (=> d!123531 m!949721))

(declare-fun m!949723 () Bool)

(assert (=> d!123531 m!949723))

(declare-fun m!949725 () Bool)

(assert (=> d!123531 m!949725))

(declare-fun m!949727 () Bool)

(assert (=> d!123531 m!949727))

(declare-fun m!949729 () Bool)

(assert (=> b!1030095 m!949729))

(declare-fun m!949731 () Bool)

(assert (=> b!1030096 m!949731))

(assert (=> b!1029828 d!123531))

(declare-fun d!123533 () Bool)

(assert (=> d!123533 (= (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003))) (and (not (= (select (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029878 d!123533))

(assert (=> bm!43513 d!123499))

(assert (=> b!1029759 d!123407))

(assert (=> b!1029869 d!123397))

(assert (=> b!1029869 d!123395))

(declare-fun b!1030097 () Bool)

(declare-fun e!581651 () ListLongMap!13689)

(declare-fun call!43544 () ListLongMap!13689)

(assert (=> b!1030097 (= e!581651 call!43544)))

(declare-fun b!1030098 () Bool)

(declare-fun e!581649 () Unit!33629)

(declare-fun Unit!33641 () Unit!33629)

(assert (=> b!1030098 (= e!581649 Unit!33641)))

(declare-fun b!1030099 () Bool)

(declare-fun e!581655 () Bool)

(declare-fun lt!454306 () ListLongMap!13689)

(assert (=> b!1030099 (= e!581655 (= (apply!904 lt!454306 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5958 thiss!1427)))))

(declare-fun b!1030100 () Bool)

(declare-fun e!581646 () ListLongMap!13689)

(declare-fun call!43540 () ListLongMap!13689)

(assert (=> b!1030100 (= e!581646 (+!3102 call!43540 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))

(declare-fun b!1030101 () Bool)

(declare-fun e!581650 () Bool)

(declare-fun call!43542 () Bool)

(assert (=> b!1030101 (= e!581650 (not call!43542))))

(declare-fun b!1030102 () Bool)

(declare-fun e!581653 () Bool)

(assert (=> b!1030102 (= e!581653 (= (apply!904 lt!454306 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)) (get!16362 (select (arr!31156 (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31672 (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))))))))

(assert (=> b!1030102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))))

(declare-fun bm!43537 () Bool)

(assert (=> bm!43537 (= call!43544 call!43540)))

(declare-fun bm!43538 () Bool)

(assert (=> bm!43538 (= call!43542 (contains!5975 lt!454306 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030103 () Bool)

(declare-fun e!581648 () Bool)

(declare-fun call!43546 () Bool)

(assert (=> b!1030103 (= e!581648 (not call!43546))))

(declare-fun d!123535 () Bool)

(declare-fun e!581656 () Bool)

(assert (=> d!123535 e!581656))

(declare-fun res!688912 () Bool)

(assert (=> d!123535 (=> (not res!688912) (not e!581656))))

(assert (=> d!123535 (= res!688912 (or (bvsge #b00000000000000000000000000000000 (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))))))

(declare-fun lt!454305 () ListLongMap!13689)

(assert (=> d!123535 (= lt!454306 lt!454305)))

(declare-fun lt!454302 () Unit!33629)

(assert (=> d!123535 (= lt!454302 e!581649)))

(declare-fun c!104143 () Bool)

(declare-fun e!581645 () Bool)

(assert (=> d!123535 (= c!104143 e!581645)))

(declare-fun res!688908 () Bool)

(assert (=> d!123535 (=> (not res!688908) (not e!581645))))

(assert (=> d!123535 (= res!688908 (bvslt #b00000000000000000000000000000000 (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))))

(assert (=> d!123535 (= lt!454305 e!581646)))

(declare-fun c!104139 () Bool)

(assert (=> d!123535 (= c!104139 (and (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123535 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123535 (= (getCurrentListMap!3908 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)) lt!454306)))

(declare-fun b!1030104 () Bool)

(declare-fun res!688913 () Bool)

(assert (=> b!1030104 (=> (not res!688913) (not e!581656))))

(assert (=> b!1030104 (= res!688913 e!581648)))

(declare-fun c!104142 () Bool)

(assert (=> b!1030104 (= c!104142 (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43539 () Bool)

(declare-fun call!43545 () ListLongMap!13689)

(assert (=> bm!43539 (= call!43545 (getCurrentListMapNoExtraKeys!3518 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun b!1030105 () Bool)

(declare-fun e!581647 () Bool)

(assert (=> b!1030105 (= e!581647 (= (apply!904 lt!454306 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5958 thiss!1427)))))

(declare-fun b!1030106 () Bool)

(declare-fun lt!454304 () Unit!33629)

(assert (=> b!1030106 (= e!581649 lt!454304)))

(declare-fun lt!454313 () ListLongMap!13689)

(assert (=> b!1030106 (= lt!454313 (getCurrentListMapNoExtraKeys!3518 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454309 () (_ BitVec 64))

(assert (=> b!1030106 (= lt!454309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454300 () (_ BitVec 64))

(assert (=> b!1030106 (= lt!454300 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454307 () Unit!33629)

(assert (=> b!1030106 (= lt!454307 (addStillContains!623 lt!454313 lt!454309 (zeroValue!5958 thiss!1427) lt!454300))))

(assert (=> b!1030106 (contains!5975 (+!3102 lt!454313 (tuple2!15573 lt!454309 (zeroValue!5958 thiss!1427))) lt!454300)))

(declare-fun lt!454299 () Unit!33629)

(assert (=> b!1030106 (= lt!454299 lt!454307)))

(declare-fun lt!454293 () ListLongMap!13689)

(assert (=> b!1030106 (= lt!454293 (getCurrentListMapNoExtraKeys!3518 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454312 () (_ BitVec 64))

(assert (=> b!1030106 (= lt!454312 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454294 () (_ BitVec 64))

(assert (=> b!1030106 (= lt!454294 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454311 () Unit!33629)

(assert (=> b!1030106 (= lt!454311 (addApplyDifferent!483 lt!454293 lt!454312 (minValue!5958 thiss!1427) lt!454294))))

(assert (=> b!1030106 (= (apply!904 (+!3102 lt!454293 (tuple2!15573 lt!454312 (minValue!5958 thiss!1427))) lt!454294) (apply!904 lt!454293 lt!454294))))

(declare-fun lt!454303 () Unit!33629)

(assert (=> b!1030106 (= lt!454303 lt!454311)))

(declare-fun lt!454292 () ListLongMap!13689)

(assert (=> b!1030106 (= lt!454292 (getCurrentListMapNoExtraKeys!3518 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454296 () (_ BitVec 64))

(assert (=> b!1030106 (= lt!454296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454308 () (_ BitVec 64))

(assert (=> b!1030106 (= lt!454308 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454295 () Unit!33629)

(assert (=> b!1030106 (= lt!454295 (addApplyDifferent!483 lt!454292 lt!454296 (zeroValue!5958 thiss!1427) lt!454308))))

(assert (=> b!1030106 (= (apply!904 (+!3102 lt!454292 (tuple2!15573 lt!454296 (zeroValue!5958 thiss!1427))) lt!454308) (apply!904 lt!454292 lt!454308))))

(declare-fun lt!454297 () Unit!33629)

(assert (=> b!1030106 (= lt!454297 lt!454295)))

(declare-fun lt!454298 () ListLongMap!13689)

(assert (=> b!1030106 (= lt!454298 (getCurrentListMapNoExtraKeys!3518 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(declare-fun lt!454301 () (_ BitVec 64))

(assert (=> b!1030106 (= lt!454301 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454310 () (_ BitVec 64))

(assert (=> b!1030106 (= lt!454310 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1030106 (= lt!454304 (addApplyDifferent!483 lt!454298 lt!454301 (minValue!5958 thiss!1427) lt!454310))))

(assert (=> b!1030106 (= (apply!904 (+!3102 lt!454298 (tuple2!15573 lt!454301 (minValue!5958 thiss!1427))) lt!454310) (apply!904 lt!454298 lt!454310))))

(declare-fun bm!43540 () Bool)

(declare-fun call!43541 () ListLongMap!13689)

(assert (=> bm!43540 (= call!43541 call!43545)))

(declare-fun b!1030107 () Bool)

(assert (=> b!1030107 (= e!581645 (validKeyInArray!0 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030108 () Bool)

(declare-fun c!104138 () Bool)

(assert (=> b!1030108 (= c!104138 (and (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581644 () ListLongMap!13689)

(assert (=> b!1030108 (= e!581644 e!581651)))

(declare-fun b!1030109 () Bool)

(declare-fun e!581652 () Bool)

(assert (=> b!1030109 (= e!581652 (validKeyInArray!0 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1030110 () Bool)

(assert (=> b!1030110 (= e!581656 e!581650)))

(declare-fun c!104140 () Bool)

(assert (=> b!1030110 (= c!104140 (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030111 () Bool)

(assert (=> b!1030111 (= e!581648 e!581655)))

(declare-fun res!688914 () Bool)

(assert (=> b!1030111 (= res!688914 call!43546)))

(assert (=> b!1030111 (=> (not res!688914) (not e!581655))))

(declare-fun bm!43541 () Bool)

(declare-fun call!43543 () ListLongMap!13689)

(assert (=> bm!43541 (= call!43543 call!43541)))

(declare-fun b!1030112 () Bool)

(assert (=> b!1030112 (= e!581644 call!43544)))

(declare-fun b!1030113 () Bool)

(declare-fun e!581654 () Bool)

(assert (=> b!1030113 (= e!581654 e!581653)))

(declare-fun res!688910 () Bool)

(assert (=> b!1030113 (=> (not res!688910) (not e!581653))))

(assert (=> b!1030113 (= res!688910 (contains!5975 lt!454306 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1030113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))))

(declare-fun b!1030114 () Bool)

(assert (=> b!1030114 (= e!581650 e!581647)))

(declare-fun res!688909 () Bool)

(assert (=> b!1030114 (= res!688909 call!43542)))

(assert (=> b!1030114 (=> (not res!688909) (not e!581647))))

(declare-fun b!1030115 () Bool)

(assert (=> b!1030115 (= e!581651 call!43543)))

(declare-fun b!1030116 () Bool)

(declare-fun res!688915 () Bool)

(assert (=> b!1030116 (=> (not res!688915) (not e!581656))))

(assert (=> b!1030116 (= res!688915 e!581654)))

(declare-fun res!688911 () Bool)

(assert (=> b!1030116 (=> res!688911 e!581654)))

(assert (=> b!1030116 (= res!688911 (not e!581652))))

(declare-fun res!688916 () Bool)

(assert (=> b!1030116 (=> (not res!688916) (not e!581652))))

(assert (=> b!1030116 (= res!688916 (bvslt #b00000000000000000000000000000000 (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))))

(declare-fun b!1030117 () Bool)

(assert (=> b!1030117 (= e!581646 e!581644)))

(declare-fun c!104141 () Bool)

(assert (=> b!1030117 (= c!104141 (and (not (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5854 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43542 () Bool)

(assert (=> bm!43542 (= call!43546 (contains!5975 lt!454306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43543 () Bool)

(assert (=> bm!43543 (= call!43540 (+!3102 (ite c!104139 call!43545 (ite c!104141 call!43541 call!43543)) (ite (or c!104139 c!104141) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (= (and d!123535 c!104139) b!1030100))

(assert (= (and d!123535 (not c!104139)) b!1030117))

(assert (= (and b!1030117 c!104141) b!1030112))

(assert (= (and b!1030117 (not c!104141)) b!1030108))

(assert (= (and b!1030108 c!104138) b!1030097))

(assert (= (and b!1030108 (not c!104138)) b!1030115))

(assert (= (or b!1030097 b!1030115) bm!43541))

(assert (= (or b!1030112 bm!43541) bm!43540))

(assert (= (or b!1030112 b!1030097) bm!43537))

(assert (= (or b!1030100 bm!43540) bm!43539))

(assert (= (or b!1030100 bm!43537) bm!43543))

(assert (= (and d!123535 res!688908) b!1030107))

(assert (= (and d!123535 c!104143) b!1030106))

(assert (= (and d!123535 (not c!104143)) b!1030098))

(assert (= (and d!123535 res!688912) b!1030116))

(assert (= (and b!1030116 res!688916) b!1030109))

(assert (= (and b!1030116 (not res!688911)) b!1030113))

(assert (= (and b!1030113 res!688910) b!1030102))

(assert (= (and b!1030116 res!688915) b!1030104))

(assert (= (and b!1030104 c!104142) b!1030111))

(assert (= (and b!1030104 (not c!104142)) b!1030103))

(assert (= (and b!1030111 res!688914) b!1030099))

(assert (= (or b!1030111 b!1030103) bm!43542))

(assert (= (and b!1030104 res!688913) b!1030110))

(assert (= (and b!1030110 c!104140) b!1030114))

(assert (= (and b!1030110 (not c!104140)) b!1030101))

(assert (= (and b!1030114 res!688909) b!1030105))

(assert (= (or b!1030114 b!1030101) bm!43538))

(declare-fun b_lambda!15919 () Bool)

(assert (=> (not b_lambda!15919) (not b!1030102)))

(assert (=> b!1030102 t!30924))

(declare-fun b_and!32967 () Bool)

(assert (= b_and!32965 (and (=> t!30924 result!14163) b_and!32967)))

(declare-fun m!949733 () Bool)

(assert (=> bm!43539 m!949733))

(declare-fun m!949735 () Bool)

(assert (=> bm!43542 m!949735))

(assert (=> b!1030109 m!949531))

(assert (=> b!1030109 m!949531))

(assert (=> b!1030109 m!949535))

(declare-fun m!949737 () Bool)

(assert (=> bm!43538 m!949737))

(declare-fun m!949739 () Bool)

(assert (=> b!1030099 m!949739))

(declare-fun m!949741 () Bool)

(assert (=> b!1030106 m!949741))

(declare-fun m!949743 () Bool)

(assert (=> b!1030106 m!949743))

(declare-fun m!949745 () Bool)

(assert (=> b!1030106 m!949745))

(assert (=> b!1030106 m!949733))

(declare-fun m!949747 () Bool)

(assert (=> b!1030106 m!949747))

(declare-fun m!949749 () Bool)

(assert (=> b!1030106 m!949749))

(declare-fun m!949751 () Bool)

(assert (=> b!1030106 m!949751))

(declare-fun m!949753 () Bool)

(assert (=> b!1030106 m!949753))

(assert (=> b!1030106 m!949741))

(declare-fun m!949755 () Bool)

(assert (=> b!1030106 m!949755))

(declare-fun m!949757 () Bool)

(assert (=> b!1030106 m!949757))

(declare-fun m!949759 () Bool)

(assert (=> b!1030106 m!949759))

(assert (=> b!1030106 m!949531))

(assert (=> b!1030106 m!949753))

(declare-fun m!949761 () Bool)

(assert (=> b!1030106 m!949761))

(declare-fun m!949763 () Bool)

(assert (=> b!1030106 m!949763))

(declare-fun m!949765 () Bool)

(assert (=> b!1030106 m!949765))

(assert (=> b!1030106 m!949759))

(declare-fun m!949767 () Bool)

(assert (=> b!1030106 m!949767))

(assert (=> b!1030106 m!949747))

(declare-fun m!949769 () Bool)

(assert (=> b!1030106 m!949769))

(declare-fun m!949771 () Bool)

(assert (=> b!1030100 m!949771))

(assert (=> b!1030113 m!949531))

(assert (=> b!1030113 m!949531))

(declare-fun m!949773 () Bool)

(assert (=> b!1030113 m!949773))

(declare-fun m!949775 () Bool)

(assert (=> b!1030105 m!949775))

(assert (=> d!123535 m!949219))

(assert (=> b!1030107 m!949531))

(assert (=> b!1030107 m!949531))

(assert (=> b!1030107 m!949535))

(declare-fun m!949777 () Bool)

(assert (=> bm!43543 m!949777))

(assert (=> b!1030102 m!949531))

(declare-fun m!949779 () Bool)

(assert (=> b!1030102 m!949779))

(assert (=> b!1030102 m!949779))

(assert (=> b!1030102 m!949151))

(declare-fun m!949781 () Bool)

(assert (=> b!1030102 m!949781))

(assert (=> b!1030102 m!949531))

(declare-fun m!949783 () Bool)

(assert (=> b!1030102 m!949783))

(assert (=> b!1030102 m!949151))

(assert (=> b!1029869 d!123535))

(declare-fun d!123537 () Bool)

(assert (=> d!123537 (= (apply!904 lt!454132 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)) (get!16363 (getValueByKey!587 (toList!6860 lt!454132) (select (arr!31155 lt!453998) #b00000000000000000000000000000000))))))

(declare-fun bs!30105 () Bool)

(assert (= bs!30105 d!123537))

(assert (=> bs!30105 m!949293))

(assert (=> bs!30105 m!949411))

(assert (=> bs!30105 m!949411))

(declare-fun m!949785 () Bool)

(assert (=> bs!30105 m!949785))

(assert (=> b!1029851 d!123537))

(declare-fun d!123539 () Bool)

(declare-fun c!104144 () Bool)

(assert (=> d!123539 (= c!104144 ((_ is ValueCellFull!11457) (select (arr!31156 lt!454000) #b00000000000000000000000000000000)))))

(declare-fun e!581657 () V!37301)

(assert (=> d!123539 (= (get!16362 (select (arr!31156 lt!454000) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581657)))

(declare-fun b!1030118 () Bool)

(assert (=> b!1030118 (= e!581657 (get!16364 (select (arr!31156 lt!454000) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030119 () Bool)

(assert (=> b!1030119 (= e!581657 (get!16365 (select (arr!31156 lt!454000) #b00000000000000000000000000000000) (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123539 c!104144) b!1030118))

(assert (= (and d!123539 (not c!104144)) b!1030119))

(assert (=> b!1030118 m!949339))

(assert (=> b!1030118 m!949151))

(declare-fun m!949787 () Bool)

(assert (=> b!1030118 m!949787))

(assert (=> b!1030119 m!949339))

(assert (=> b!1030119 m!949151))

(declare-fun m!949789 () Bool)

(assert (=> b!1030119 m!949789))

(assert (=> b!1029851 d!123539))

(declare-fun d!123541 () Bool)

(declare-fun lt!454316 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!511 (List!21830) (InoxSet (_ BitVec 64)))

(assert (=> d!123541 (= lt!454316 (select (content!511 Nil!21827) (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun e!581663 () Bool)

(assert (=> d!123541 (= lt!454316 e!581663)))

(declare-fun res!688922 () Bool)

(assert (=> d!123541 (=> (not res!688922) (not e!581663))))

(assert (=> d!123541 (= res!688922 ((_ is Cons!21826) Nil!21827))))

(assert (=> d!123541 (= (contains!5976 Nil!21827 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)) lt!454316)))

(declare-fun b!1030124 () Bool)

(declare-fun e!581662 () Bool)

(assert (=> b!1030124 (= e!581663 e!581662)))

(declare-fun res!688921 () Bool)

(assert (=> b!1030124 (=> res!688921 e!581662)))

(assert (=> b!1030124 (= res!688921 (= (h!23027 Nil!21827) (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun b!1030125 () Bool)

(assert (=> b!1030125 (= e!581662 (contains!5976 (t!30926 Nil!21827) (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(assert (= (and d!123541 res!688922) b!1030124))

(assert (= (and b!1030124 (not res!688921)) b!1030125))

(declare-fun m!949791 () Bool)

(assert (=> d!123541 m!949791))

(assert (=> d!123541 m!949293))

(declare-fun m!949793 () Bool)

(assert (=> d!123541 m!949793))

(assert (=> b!1030125 m!949293))

(declare-fun m!949795 () Bool)

(assert (=> b!1030125 m!949795))

(assert (=> b!1029924 d!123541))

(assert (=> d!123399 d!123429))

(declare-fun d!123543 () Bool)

(declare-fun e!581665 () Bool)

(assert (=> d!123543 e!581665))

(declare-fun res!688923 () Bool)

(assert (=> d!123543 (=> res!688923 e!581665)))

(declare-fun lt!454317 () Bool)

(assert (=> d!123543 (= res!688923 (not lt!454317))))

(declare-fun lt!454320 () Bool)

(assert (=> d!123543 (= lt!454317 lt!454320)))

(declare-fun lt!454318 () Unit!33629)

(declare-fun e!581664 () Unit!33629)

(assert (=> d!123543 (= lt!454318 e!581664)))

(declare-fun c!104145 () Bool)

(assert (=> d!123543 (= c!104145 lt!454320)))

(assert (=> d!123543 (= lt!454320 (containsKey!562 (toList!6860 lt!454132) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123543 (= (contains!5975 lt!454132 #b1000000000000000000000000000000000000000000000000000000000000000) lt!454317)))

(declare-fun b!1030126 () Bool)

(declare-fun lt!454319 () Unit!33629)

(assert (=> b!1030126 (= e!581664 lt!454319)))

(assert (=> b!1030126 (= lt!454319 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6860 lt!454132) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030126 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454132) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030127 () Bool)

(declare-fun Unit!33642 () Unit!33629)

(assert (=> b!1030127 (= e!581664 Unit!33642)))

(declare-fun b!1030128 () Bool)

(assert (=> b!1030128 (= e!581665 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123543 c!104145) b!1030126))

(assert (= (and d!123543 (not c!104145)) b!1030127))

(assert (= (and d!123543 (not res!688923)) b!1030128))

(declare-fun m!949797 () Bool)

(assert (=> d!123543 m!949797))

(declare-fun m!949799 () Bool)

(assert (=> b!1030126 m!949799))

(declare-fun m!949801 () Bool)

(assert (=> b!1030126 m!949801))

(assert (=> b!1030126 m!949801))

(declare-fun m!949803 () Bool)

(assert (=> b!1030126 m!949803))

(assert (=> b!1030128 m!949801))

(assert (=> b!1030128 m!949801))

(assert (=> b!1030128 m!949803))

(assert (=> bm!43512 d!123543))

(declare-fun d!123545 () Bool)

(declare-fun e!581666 () Bool)

(assert (=> d!123545 e!581666))

(declare-fun res!688925 () Bool)

(assert (=> d!123545 (=> (not res!688925) (not e!581666))))

(declare-fun lt!454322 () ListLongMap!13689)

(assert (=> d!123545 (= res!688925 (contains!5975 lt!454322 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(declare-fun lt!454323 () List!21829)

(assert (=> d!123545 (= lt!454322 (ListLongMap!13690 lt!454323))))

(declare-fun lt!454321 () Unit!33629)

(declare-fun lt!454324 () Unit!33629)

(assert (=> d!123545 (= lt!454321 lt!454324)))

(assert (=> d!123545 (= (getValueByKey!587 lt!454323 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (=> d!123545 (= lt!454324 (lemmaContainsTupThenGetReturnValue!278 lt!454323 (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (=> d!123545 (= lt!454323 (insertStrictlySorted!371 (toList!6860 call!43514) (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))) (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (=> d!123545 (= (+!3102 call!43514 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))) lt!454322)))

(declare-fun b!1030129 () Bool)

(declare-fun res!688924 () Bool)

(assert (=> b!1030129 (=> (not res!688924) (not e!581666))))

(assert (=> b!1030129 (= res!688924 (= (getValueByKey!587 (toList!6860 lt!454322) (_1!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) (Some!637 (_2!7797 (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(declare-fun b!1030130 () Bool)

(assert (=> b!1030130 (= e!581666 (contains!5977 (toList!6860 lt!454322) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))

(assert (= (and d!123545 res!688925) b!1030129))

(assert (= (and b!1030129 res!688924) b!1030130))

(declare-fun m!949805 () Bool)

(assert (=> d!123545 m!949805))

(declare-fun m!949807 () Bool)

(assert (=> d!123545 m!949807))

(declare-fun m!949809 () Bool)

(assert (=> d!123545 m!949809))

(declare-fun m!949811 () Bool)

(assert (=> d!123545 m!949811))

(declare-fun m!949813 () Bool)

(assert (=> b!1030129 m!949813))

(declare-fun m!949815 () Bool)

(assert (=> b!1030130 m!949815))

(assert (=> b!1029849 d!123545))

(declare-fun d!123547 () Bool)

(assert (=> d!123547 (= (-!487 (getCurrentListMap!3908 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)) key!909) (getCurrentListMap!3908 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (array!64705 (store (arr!31156 (_values!6145 thiss!1427)) (index!41116 lt!454003) (ValueCellFull!11457 (dynLambda!1957 (defaultEntry!6122 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31672 (_values!6145 thiss!1427))) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6122 thiss!1427)))))

(assert (=> d!123547 true))

(declare-fun _$9!44 () Unit!33629)

(assert (=> d!123547 (= (choose!1692 (_keys!11288 thiss!1427) (_values!6145 thiss!1427) (mask!29885 thiss!1427) (extraKeys!5854 thiss!1427) (zeroValue!5958 thiss!1427) (minValue!5958 thiss!1427) (index!41116 lt!454003) key!909 (defaultEntry!6122 thiss!1427)) _$9!44)))

(declare-fun b_lambda!15921 () Bool)

(assert (=> (not b_lambda!15921) (not d!123547)))

(assert (=> d!123547 t!30924))

(declare-fun b_and!32969 () Bool)

(assert (= b_and!32967 (and (=> t!30924 result!14163) b_and!32969)))

(assert (=> d!123547 m!949127))

(assert (=> d!123547 m!949129))

(assert (=> d!123547 m!949347))

(assert (=> d!123547 m!949145))

(assert (=> d!123547 m!949121))

(assert (=> d!123547 m!949127))

(assert (=> d!123547 m!949151))

(assert (=> d!123401 d!123547))

(assert (=> d!123401 d!123429))

(declare-fun d!123549 () Bool)

(declare-fun e!581668 () Bool)

(assert (=> d!123549 e!581668))

(declare-fun res!688926 () Bool)

(assert (=> d!123549 (=> res!688926 e!581668)))

(declare-fun lt!454325 () Bool)

(assert (=> d!123549 (= res!688926 (not lt!454325))))

(declare-fun lt!454328 () Bool)

(assert (=> d!123549 (= lt!454325 lt!454328)))

(declare-fun lt!454326 () Unit!33629)

(declare-fun e!581667 () Unit!33629)

(assert (=> d!123549 (= lt!454326 e!581667)))

(declare-fun c!104146 () Bool)

(assert (=> d!123549 (= c!104146 lt!454328)))

(assert (=> d!123549 (= lt!454328 (containsKey!562 (toList!6860 lt!454132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123549 (= (contains!5975 lt!454132 #b0000000000000000000000000000000000000000000000000000000000000000) lt!454325)))

(declare-fun b!1030131 () Bool)

(declare-fun lt!454327 () Unit!33629)

(assert (=> b!1030131 (= e!581667 lt!454327)))

(assert (=> b!1030131 (= lt!454327 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6860 lt!454132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030131 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030132 () Bool)

(declare-fun Unit!33643 () Unit!33629)

(assert (=> b!1030132 (= e!581667 Unit!33643)))

(declare-fun b!1030133 () Bool)

(assert (=> b!1030133 (= e!581668 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454132) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123549 c!104146) b!1030131))

(assert (= (and d!123549 (not c!104146)) b!1030132))

(assert (= (and d!123549 (not res!688926)) b!1030133))

(declare-fun m!949817 () Bool)

(assert (=> d!123549 m!949817))

(declare-fun m!949819 () Bool)

(assert (=> b!1030131 m!949819))

(assert (=> b!1030131 m!949539))

(assert (=> b!1030131 m!949539))

(declare-fun m!949821 () Bool)

(assert (=> b!1030131 m!949821))

(assert (=> b!1030133 m!949539))

(assert (=> b!1030133 m!949539))

(assert (=> b!1030133 m!949821))

(assert (=> bm!43516 d!123549))

(declare-fun b!1030152 () Bool)

(declare-fun lt!454334 () SeekEntryResult!9686)

(assert (=> b!1030152 (and (bvsge (index!41117 lt!454334) #b00000000000000000000000000000000) (bvslt (index!41117 lt!454334) (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun res!688934 () Bool)

(assert (=> b!1030152 (= res!688934 (= (select (arr!31155 (_keys!11288 thiss!1427)) (index!41117 lt!454334)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581679 () Bool)

(assert (=> b!1030152 (=> res!688934 e!581679)))

(declare-fun b!1030153 () Bool)

(declare-fun e!581682 () SeekEntryResult!9686)

(declare-fun e!581680 () SeekEntryResult!9686)

(assert (=> b!1030153 (= e!581682 e!581680)))

(declare-fun c!104153 () Bool)

(declare-fun lt!454333 () (_ BitVec 64))

(assert (=> b!1030153 (= c!104153 (or (= lt!454333 key!909) (= (bvadd lt!454333 lt!454333) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030154 () Bool)

(declare-fun e!581683 () Bool)

(declare-fun e!581681 () Bool)

(assert (=> b!1030154 (= e!581683 e!581681)))

(declare-fun res!688935 () Bool)

(assert (=> b!1030154 (= res!688935 (and ((_ is Intermediate!9686) lt!454334) (not (undefined!10498 lt!454334)) (bvslt (x!91636 lt!454334) #b01111111111111111111111111111110) (bvsge (x!91636 lt!454334) #b00000000000000000000000000000000) (bvsge (x!91636 lt!454334) #b00000000000000000000000000000000)))))

(assert (=> b!1030154 (=> (not res!688935) (not e!581681))))

(declare-fun b!1030155 () Bool)

(assert (=> b!1030155 (and (bvsge (index!41117 lt!454334) #b00000000000000000000000000000000) (bvslt (index!41117 lt!454334) (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun res!688933 () Bool)

(assert (=> b!1030155 (= res!688933 (= (select (arr!31155 (_keys!11288 thiss!1427)) (index!41117 lt!454334)) key!909))))

(assert (=> b!1030155 (=> res!688933 e!581679)))

(assert (=> b!1030155 (= e!581681 e!581679)))

(declare-fun b!1030156 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030156 (= e!581680 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29885 thiss!1427)) #b00000000000000000000000000000000 (mask!29885 thiss!1427)) key!909 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)))))

(declare-fun b!1030157 () Bool)

(assert (=> b!1030157 (= e!581680 (Intermediate!9686 false (toIndex!0 key!909 (mask!29885 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1030158 () Bool)

(assert (=> b!1030158 (and (bvsge (index!41117 lt!454334) #b00000000000000000000000000000000) (bvslt (index!41117 lt!454334) (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> b!1030158 (= e!581679 (= (select (arr!31155 (_keys!11288 thiss!1427)) (index!41117 lt!454334)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123551 () Bool)

(assert (=> d!123551 e!581683))

(declare-fun c!104155 () Bool)

(assert (=> d!123551 (= c!104155 (and ((_ is Intermediate!9686) lt!454334) (undefined!10498 lt!454334)))))

(assert (=> d!123551 (= lt!454334 e!581682)))

(declare-fun c!104154 () Bool)

(assert (=> d!123551 (= c!104154 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!123551 (= lt!454333 (select (arr!31155 (_keys!11288 thiss!1427)) (toIndex!0 key!909 (mask!29885 thiss!1427))))))

(assert (=> d!123551 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29885 thiss!1427)) key!909 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)) lt!454334)))

(declare-fun b!1030159 () Bool)

(assert (=> b!1030159 (= e!581683 (bvsge (x!91636 lt!454334) #b01111111111111111111111111111110))))

(declare-fun b!1030160 () Bool)

(assert (=> b!1030160 (= e!581682 (Intermediate!9686 true (toIndex!0 key!909 (mask!29885 thiss!1427)) #b00000000000000000000000000000000))))

(assert (= (and d!123551 c!104154) b!1030160))

(assert (= (and d!123551 (not c!104154)) b!1030153))

(assert (= (and b!1030153 c!104153) b!1030157))

(assert (= (and b!1030153 (not c!104153)) b!1030156))

(assert (= (and d!123551 c!104155) b!1030159))

(assert (= (and d!123551 (not c!104155)) b!1030154))

(assert (= (and b!1030154 res!688935) b!1030155))

(assert (= (and b!1030155 (not res!688933)) b!1030152))

(assert (= (and b!1030152 (not res!688934)) b!1030158))

(assert (=> d!123551 m!949215))

(declare-fun m!949823 () Bool)

(assert (=> d!123551 m!949823))

(assert (=> d!123551 m!949219))

(declare-fun m!949825 () Bool)

(assert (=> b!1030152 m!949825))

(assert (=> b!1030156 m!949215))

(declare-fun m!949827 () Bool)

(assert (=> b!1030156 m!949827))

(assert (=> b!1030156 m!949827))

(declare-fun m!949829 () Bool)

(assert (=> b!1030156 m!949829))

(assert (=> b!1030155 m!949825))

(assert (=> b!1030158 m!949825))

(assert (=> d!123391 d!123551))

(declare-fun d!123553 () Bool)

(declare-fun lt!454340 () (_ BitVec 32))

(declare-fun lt!454339 () (_ BitVec 32))

(assert (=> d!123553 (= lt!454340 (bvmul (bvxor lt!454339 (bvlshr lt!454339 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!123553 (= lt!454339 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!123553 (and (bvsge (mask!29885 thiss!1427) #b00000000000000000000000000000000) (let ((res!688936 (let ((h!23028 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91667 (bvmul (bvxor h!23028 (bvlshr h!23028 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91667 (bvlshr x!91667 #b00000000000000000000000000001101)) (mask!29885 thiss!1427)))))) (and (bvslt res!688936 (bvadd (mask!29885 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!688936 #b00000000000000000000000000000000))))))

(assert (=> d!123553 (= (toIndex!0 key!909 (mask!29885 thiss!1427)) (bvand (bvxor lt!454340 (bvlshr lt!454340 #b00000000000000000000000000001101)) (mask!29885 thiss!1427)))))

(assert (=> d!123391 d!123553))

(assert (=> d!123391 d!123429))

(declare-fun d!123555 () Bool)

(declare-fun res!688937 () Bool)

(declare-fun e!581684 () Bool)

(assert (=> d!123555 (=> res!688937 e!581684)))

(assert (=> d!123555 (= res!688937 (= (select (arr!31155 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!123555 (= (arrayContainsKey!0 lt!453998 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!581684)))

(declare-fun b!1030161 () Bool)

(declare-fun e!581685 () Bool)

(assert (=> b!1030161 (= e!581684 e!581685)))

(declare-fun res!688938 () Bool)

(assert (=> b!1030161 (=> (not res!688938) (not e!581685))))

(assert (=> b!1030161 (= res!688938 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31671 lt!453998)))))

(declare-fun b!1030162 () Bool)

(assert (=> b!1030162 (= e!581685 (arrayContainsKey!0 lt!453998 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!123555 (not res!688937)) b!1030161))

(assert (= (and b!1030161 res!688938) b!1030162))

(assert (=> d!123555 m!949399))

(declare-fun m!949831 () Bool)

(assert (=> b!1030162 m!949831))

(assert (=> b!1029932 d!123555))

(declare-fun d!123557 () Bool)

(assert (=> d!123557 (= (apply!904 lt!454107 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16363 (getValueByKey!587 (toList!6860 lt!454107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30106 () Bool)

(assert (= bs!30106 d!123557))

(assert (=> bs!30106 m!949563))

(assert (=> bs!30106 m!949563))

(declare-fun m!949833 () Bool)

(assert (=> bs!30106 m!949833))

(assert (=> b!1029833 d!123557))

(declare-fun d!123559 () Bool)

(assert (=> d!123559 (= (arrayCountValidKeys!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11288 thiss!1427) #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!123559 true))

(declare-fun _$79!17 () Unit!33629)

(assert (=> d!123559 (= (choose!82 (_keys!11288 thiss!1427) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!17)))

(declare-fun bs!30107 () Bool)

(assert (= bs!30107 d!123559))

(assert (=> bs!30107 m!949121))

(assert (=> bs!30107 m!949349))

(assert (=> bs!30107 m!949141))

(assert (=> d!123403 d!123559))

(declare-fun d!123561 () Bool)

(declare-fun e!581686 () Bool)

(assert (=> d!123561 e!581686))

(declare-fun res!688940 () Bool)

(assert (=> d!123561 (=> (not res!688940) (not e!581686))))

(declare-fun lt!454342 () ListLongMap!13689)

(assert (=> d!123561 (= res!688940 (contains!5975 lt!454342 (_1!7797 (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(declare-fun lt!454343 () List!21829)

(assert (=> d!123561 (= lt!454342 (ListLongMap!13690 lt!454343))))

(declare-fun lt!454341 () Unit!33629)

(declare-fun lt!454344 () Unit!33629)

(assert (=> d!123561 (= lt!454341 lt!454344)))

(assert (=> d!123561 (= (getValueByKey!587 lt!454343 (_1!7797 (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))) (Some!637 (_2!7797 (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(assert (=> d!123561 (= lt!454344 (lemmaContainsTupThenGetReturnValue!278 lt!454343 (_1!7797 (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) (_2!7797 (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(assert (=> d!123561 (= lt!454343 (insertStrictlySorted!371 (toList!6860 (ite c!104074 call!43512 (ite c!104076 call!43508 call!43510))) (_1!7797 (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) (_2!7797 (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))))))

(assert (=> d!123561 (= (+!3102 (ite c!104074 call!43512 (ite c!104076 call!43508 call!43510)) (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))) lt!454342)))

(declare-fun b!1030163 () Bool)

(declare-fun res!688939 () Bool)

(assert (=> b!1030163 (=> (not res!688939) (not e!581686))))

(assert (=> b!1030163 (= res!688939 (= (getValueByKey!587 (toList!6860 lt!454342) (_1!7797 (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427))))) (Some!637 (_2!7797 (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))))

(declare-fun b!1030164 () Bool)

(assert (=> b!1030164 (= e!581686 (contains!5977 (toList!6860 lt!454342) (ite (or c!104074 c!104076) (tuple2!15573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5958 thiss!1427)) (tuple2!15573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5958 thiss!1427)))))))

(assert (= (and d!123561 res!688940) b!1030163))

(assert (= (and b!1030163 res!688939) b!1030164))

(declare-fun m!949835 () Bool)

(assert (=> d!123561 m!949835))

(declare-fun m!949837 () Bool)

(assert (=> d!123561 m!949837))

(declare-fun m!949839 () Bool)

(assert (=> d!123561 m!949839))

(declare-fun m!949841 () Bool)

(assert (=> d!123561 m!949841))

(declare-fun m!949843 () Bool)

(assert (=> b!1030163 m!949843))

(declare-fun m!949845 () Bool)

(assert (=> b!1030164 m!949845))

(assert (=> bm!43510 d!123561))

(declare-fun b!1030165 () Bool)

(declare-fun e!581687 () (_ BitVec 32))

(declare-fun call!43547 () (_ BitVec 32))

(assert (=> b!1030165 (= e!581687 call!43547)))

(declare-fun d!123563 () Bool)

(declare-fun lt!454345 () (_ BitVec 32))

(assert (=> d!123563 (and (bvsge lt!454345 #b00000000000000000000000000000000) (bvsle lt!454345 (bvsub (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!581688 () (_ BitVec 32))

(assert (=> d!123563 (= lt!454345 e!581688)))

(declare-fun c!104156 () Bool)

(assert (=> d!123563 (= c!104156 (bvsge #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123563 (and (bvsle #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31671 (_keys!11288 thiss!1427)) (size!31671 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))))))))

(assert (=> d!123563 (= (arrayCountValidKeys!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))) lt!454345)))

(declare-fun bm!43544 () Bool)

(assert (=> bm!43544 (= call!43547 (arrayCountValidKeys!0 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun b!1030166 () Bool)

(assert (=> b!1030166 (= e!581688 #b00000000000000000000000000000000)))

(declare-fun b!1030167 () Bool)

(assert (=> b!1030167 (= e!581687 (bvadd #b00000000000000000000000000000001 call!43547))))

(declare-fun b!1030168 () Bool)

(assert (=> b!1030168 (= e!581688 e!581687)))

(declare-fun c!104157 () Bool)

(assert (=> b!1030168 (= c!104157 (validKeyInArray!0 (select (arr!31155 (array!64703 (store (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454003) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31671 (_keys!11288 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!123563 c!104156) b!1030166))

(assert (= (and d!123563 (not c!104156)) b!1030168))

(assert (= (and b!1030168 c!104157) b!1030167))

(assert (= (and b!1030168 (not c!104157)) b!1030165))

(assert (= (or b!1030167 b!1030165) bm!43544))

(declare-fun m!949847 () Bool)

(assert (=> bm!43544 m!949847))

(assert (=> b!1030168 m!949531))

(assert (=> b!1030168 m!949531))

(assert (=> b!1030168 m!949535))

(assert (=> b!1029881 d!123563))

(assert (=> b!1029881 d!123407))

(declare-fun d!123565 () Bool)

(assert (=> d!123565 (arrayContainsKey!0 lt!453998 lt!454162 #b00000000000000000000000000000000)))

(declare-fun lt!454348 () Unit!33629)

(declare-fun choose!13 (array!64702 (_ BitVec 64) (_ BitVec 32)) Unit!33629)

(assert (=> d!123565 (= lt!454348 (choose!13 lt!453998 lt!454162 #b00000000000000000000000000000000))))

(assert (=> d!123565 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!123565 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453998 lt!454162 #b00000000000000000000000000000000) lt!454348)))

(declare-fun bs!30108 () Bool)

(assert (= bs!30108 d!123565))

(assert (=> bs!30108 m!949373))

(declare-fun m!949849 () Bool)

(assert (=> bs!30108 m!949849))

(assert (=> b!1029910 d!123565))

(declare-fun d!123567 () Bool)

(declare-fun res!688941 () Bool)

(declare-fun e!581689 () Bool)

(assert (=> d!123567 (=> res!688941 e!581689)))

(assert (=> d!123567 (= res!688941 (= (select (arr!31155 lt!453998) #b00000000000000000000000000000000) lt!454162))))

(assert (=> d!123567 (= (arrayContainsKey!0 lt!453998 lt!454162 #b00000000000000000000000000000000) e!581689)))

(declare-fun b!1030169 () Bool)

(declare-fun e!581690 () Bool)

(assert (=> b!1030169 (= e!581689 e!581690)))

(declare-fun res!688942 () Bool)

(assert (=> b!1030169 (=> (not res!688942) (not e!581690))))

(assert (=> b!1030169 (= res!688942 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 lt!453998)))))

(declare-fun b!1030170 () Bool)

(assert (=> b!1030170 (= e!581690 (arrayContainsKey!0 lt!453998 lt!454162 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123567 (not res!688941)) b!1030169))

(assert (= (and b!1030169 res!688942) b!1030170))

(assert (=> d!123567 m!949293))

(declare-fun m!949851 () Bool)

(assert (=> b!1030170 m!949851))

(assert (=> b!1029910 d!123567))

(declare-fun b!1030183 () Bool)

(declare-fun c!104165 () Bool)

(declare-fun lt!454356 () (_ BitVec 64))

(assert (=> b!1030183 (= c!104165 (= lt!454356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581699 () SeekEntryResult!9686)

(declare-fun e!581698 () SeekEntryResult!9686)

(assert (=> b!1030183 (= e!581699 e!581698)))

(declare-fun b!1030184 () Bool)

(declare-fun e!581697 () SeekEntryResult!9686)

(assert (=> b!1030184 (= e!581697 e!581699)))

(declare-fun lt!454357 () SeekEntryResult!9686)

(assert (=> b!1030184 (= lt!454356 (select (arr!31155 lt!453998) (index!41117 lt!454357)))))

(declare-fun c!104166 () Bool)

(assert (=> b!1030184 (= c!104166 (= lt!454356 (select (arr!31155 lt!453998) #b00000000000000000000000000000000)))))

(declare-fun b!1030185 () Bool)

(assert (=> b!1030185 (= e!581699 (Found!9686 (index!41117 lt!454357)))))

(declare-fun d!123569 () Bool)

(declare-fun lt!454355 () SeekEntryResult!9686)

(assert (=> d!123569 (and (or ((_ is Undefined!9686) lt!454355) (not ((_ is Found!9686) lt!454355)) (and (bvsge (index!41116 lt!454355) #b00000000000000000000000000000000) (bvslt (index!41116 lt!454355) (size!31671 lt!453998)))) (or ((_ is Undefined!9686) lt!454355) ((_ is Found!9686) lt!454355) (not ((_ is MissingZero!9686) lt!454355)) (and (bvsge (index!41115 lt!454355) #b00000000000000000000000000000000) (bvslt (index!41115 lt!454355) (size!31671 lt!453998)))) (or ((_ is Undefined!9686) lt!454355) ((_ is Found!9686) lt!454355) ((_ is MissingZero!9686) lt!454355) (not ((_ is MissingVacant!9686) lt!454355)) (and (bvsge (index!41118 lt!454355) #b00000000000000000000000000000000) (bvslt (index!41118 lt!454355) (size!31671 lt!453998)))) (or ((_ is Undefined!9686) lt!454355) (ite ((_ is Found!9686) lt!454355) (= (select (arr!31155 lt!453998) (index!41116 lt!454355)) (select (arr!31155 lt!453998) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9686) lt!454355) (= (select (arr!31155 lt!453998) (index!41115 lt!454355)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9686) lt!454355) (= (select (arr!31155 lt!453998) (index!41118 lt!454355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!123569 (= lt!454355 e!581697)))

(declare-fun c!104164 () Bool)

(assert (=> d!123569 (= c!104164 (and ((_ is Intermediate!9686) lt!454357) (undefined!10498 lt!454357)))))

(assert (=> d!123569 (= lt!454357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000) (mask!29885 thiss!1427)) (select (arr!31155 lt!453998) #b00000000000000000000000000000000) lt!453998 (mask!29885 thiss!1427)))))

(assert (=> d!123569 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123569 (= (seekEntryOrOpen!0 (select (arr!31155 lt!453998) #b00000000000000000000000000000000) lt!453998 (mask!29885 thiss!1427)) lt!454355)))

(declare-fun b!1030186 () Bool)

(assert (=> b!1030186 (= e!581698 (seekKeyOrZeroReturnVacant!0 (x!91636 lt!454357) (index!41117 lt!454357) (index!41117 lt!454357) (select (arr!31155 lt!453998) #b00000000000000000000000000000000) lt!453998 (mask!29885 thiss!1427)))))

(declare-fun b!1030187 () Bool)

(assert (=> b!1030187 (= e!581697 Undefined!9686)))

(declare-fun b!1030188 () Bool)

(assert (=> b!1030188 (= e!581698 (MissingZero!9686 (index!41117 lt!454357)))))

(assert (= (and d!123569 c!104164) b!1030187))

(assert (= (and d!123569 (not c!104164)) b!1030184))

(assert (= (and b!1030184 c!104166) b!1030185))

(assert (= (and b!1030184 (not c!104166)) b!1030183))

(assert (= (and b!1030183 c!104165) b!1030188))

(assert (= (and b!1030183 (not c!104165)) b!1030186))

(declare-fun m!949853 () Bool)

(assert (=> b!1030184 m!949853))

(declare-fun m!949855 () Bool)

(assert (=> d!123569 m!949855))

(declare-fun m!949857 () Bool)

(assert (=> d!123569 m!949857))

(assert (=> d!123569 m!949293))

(declare-fun m!949859 () Bool)

(assert (=> d!123569 m!949859))

(assert (=> d!123569 m!949219))

(declare-fun m!949861 () Bool)

(assert (=> d!123569 m!949861))

(declare-fun m!949863 () Bool)

(assert (=> d!123569 m!949863))

(assert (=> d!123569 m!949293))

(assert (=> d!123569 m!949857))

(assert (=> b!1030186 m!949293))

(declare-fun m!949865 () Bool)

(assert (=> b!1030186 m!949865))

(assert (=> b!1029910 d!123569))

(declare-fun b!1030189 () Bool)

(declare-fun e!581700 () (_ BitVec 32))

(declare-fun call!43548 () (_ BitVec 32))

(assert (=> b!1030189 (= e!581700 call!43548)))

(declare-fun d!123571 () Bool)

(declare-fun lt!454358 () (_ BitVec 32))

(assert (=> d!123571 (and (bvsge lt!454358 #b00000000000000000000000000000000) (bvsle lt!454358 (bvsub (size!31671 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!581701 () (_ BitVec 32))

(assert (=> d!123571 (= lt!454358 e!581701)))

(declare-fun c!104167 () Bool)

(assert (=> d!123571 (= c!104167 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123571 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31671 (_keys!11288 thiss!1427)) (size!31671 lt!453998)))))

(assert (=> d!123571 (= (arrayCountValidKeys!0 lt!453998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))) lt!454358)))

(declare-fun bm!43545 () Bool)

(assert (=> bm!43545 (= call!43548 (arrayCountValidKeys!0 lt!453998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31671 (_keys!11288 thiss!1427))))))

(declare-fun b!1030190 () Bool)

(assert (=> b!1030190 (= e!581701 #b00000000000000000000000000000000)))

(declare-fun b!1030191 () Bool)

(assert (=> b!1030191 (= e!581700 (bvadd #b00000000000000000000000000000001 call!43548))))

(declare-fun b!1030192 () Bool)

(assert (=> b!1030192 (= e!581701 e!581700)))

(declare-fun c!104168 () Bool)

(assert (=> b!1030192 (= c!104168 (validKeyInArray!0 (select (arr!31155 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!123571 c!104167) b!1030190))

(assert (= (and d!123571 (not c!104167)) b!1030192))

(assert (= (and b!1030192 c!104168) b!1030191))

(assert (= (and b!1030192 (not c!104168)) b!1030189))

(assert (= (or b!1030191 b!1030189) bm!43545))

(declare-fun m!949867 () Bool)

(assert (=> bm!43545 m!949867))

(assert (=> b!1030192 m!949399))

(assert (=> b!1030192 m!949399))

(assert (=> b!1030192 m!949403))

(assert (=> bm!43527 d!123571))

(declare-fun d!123573 () Bool)

(assert (=> d!123573 (= (apply!904 lt!454132 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16363 (getValueByKey!587 (toList!6860 lt!454132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30109 () Bool)

(assert (= bs!30109 d!123573))

(assert (=> bs!30109 m!949801))

(assert (=> bs!30109 m!949801))

(declare-fun m!949869 () Bool)

(assert (=> bs!30109 m!949869))

(assert (=> b!1029854 d!123573))

(declare-fun b!1030193 () Bool)

(declare-fun e!581704 () Bool)

(declare-fun e!581703 () Bool)

(assert (=> b!1030193 (= e!581704 e!581703)))

(declare-fun c!104169 () Bool)

(assert (=> b!1030193 (= c!104169 (validKeyInArray!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43546 () Bool)

(declare-fun call!43549 () Bool)

(assert (=> bm!43546 (= call!43549 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11288 thiss!1427) (mask!29885 thiss!1427)))))

(declare-fun b!1030194 () Bool)

(declare-fun e!581702 () Bool)

(assert (=> b!1030194 (= e!581702 call!43549)))

(declare-fun d!123575 () Bool)

(declare-fun res!688944 () Bool)

(assert (=> d!123575 (=> res!688944 e!581704)))

(assert (=> d!123575 (= res!688944 (bvsge #b00000000000000000000000000000000 (size!31671 (_keys!11288 thiss!1427))))))

(assert (=> d!123575 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)) e!581704)))

(declare-fun b!1030195 () Bool)

(assert (=> b!1030195 (= e!581703 e!581702)))

(declare-fun lt!454360 () (_ BitVec 64))

(assert (=> b!1030195 (= lt!454360 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454361 () Unit!33629)

(assert (=> b!1030195 (= lt!454361 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11288 thiss!1427) lt!454360 #b00000000000000000000000000000000))))

(assert (=> b!1030195 (arrayContainsKey!0 (_keys!11288 thiss!1427) lt!454360 #b00000000000000000000000000000000)))

(declare-fun lt!454359 () Unit!33629)

(assert (=> b!1030195 (= lt!454359 lt!454361)))

(declare-fun res!688943 () Bool)

(assert (=> b!1030195 (= res!688943 (= (seekEntryOrOpen!0 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000) (_keys!11288 thiss!1427) (mask!29885 thiss!1427)) (Found!9686 #b00000000000000000000000000000000)))))

(assert (=> b!1030195 (=> (not res!688943) (not e!581702))))

(declare-fun b!1030196 () Bool)

(assert (=> b!1030196 (= e!581703 call!43549)))

(assert (= (and d!123575 (not res!688944)) b!1030193))

(assert (= (and b!1030193 c!104169) b!1030195))

(assert (= (and b!1030193 (not c!104169)) b!1030196))

(assert (= (and b!1030195 res!688943) b!1030194))

(assert (= (or b!1030194 b!1030196) bm!43546))

(assert (=> b!1030193 m!949233))

(assert (=> b!1030193 m!949233))

(assert (=> b!1030193 m!949235))

(declare-fun m!949871 () Bool)

(assert (=> bm!43546 m!949871))

(assert (=> b!1030195 m!949233))

(declare-fun m!949873 () Bool)

(assert (=> b!1030195 m!949873))

(declare-fun m!949875 () Bool)

(assert (=> b!1030195 m!949875))

(assert (=> b!1030195 m!949233))

(declare-fun m!949877 () Bool)

(assert (=> b!1030195 m!949877))

(assert (=> b!1029760 d!123575))

(declare-fun d!123577 () Bool)

(assert (=> d!123577 (= (apply!904 lt!454107 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16363 (getValueByKey!587 (toList!6860 lt!454107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30110 () Bool)

(assert (= bs!30110 d!123577))

(assert (=> bs!30110 m!949597))

(assert (=> bs!30110 m!949597))

(declare-fun m!949879 () Bool)

(assert (=> bs!30110 m!949879))

(assert (=> b!1029827 d!123577))

(declare-fun b!1030209 () Bool)

(declare-fun e!581713 () SeekEntryResult!9686)

(declare-fun e!581711 () SeekEntryResult!9686)

(assert (=> b!1030209 (= e!581713 e!581711)))

(declare-fun c!104177 () Bool)

(declare-fun lt!454367 () (_ BitVec 64))

(assert (=> b!1030209 (= c!104177 (= lt!454367 key!909))))

(declare-fun lt!454366 () SeekEntryResult!9686)

(declare-fun d!123579 () Bool)

(assert (=> d!123579 (and (or ((_ is Undefined!9686) lt!454366) (not ((_ is Found!9686) lt!454366)) (and (bvsge (index!41116 lt!454366) #b00000000000000000000000000000000) (bvslt (index!41116 lt!454366) (size!31671 (_keys!11288 thiss!1427))))) (or ((_ is Undefined!9686) lt!454366) ((_ is Found!9686) lt!454366) (not ((_ is MissingVacant!9686) lt!454366)) (not (= (index!41118 lt!454366) (index!41117 lt!454044))) (and (bvsge (index!41118 lt!454366) #b00000000000000000000000000000000) (bvslt (index!41118 lt!454366) (size!31671 (_keys!11288 thiss!1427))))) (or ((_ is Undefined!9686) lt!454366) (ite ((_ is Found!9686) lt!454366) (= (select (arr!31155 (_keys!11288 thiss!1427)) (index!41116 lt!454366)) key!909) (and ((_ is MissingVacant!9686) lt!454366) (= (index!41118 lt!454366) (index!41117 lt!454044)) (= (select (arr!31155 (_keys!11288 thiss!1427)) (index!41118 lt!454366)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!123579 (= lt!454366 e!581713)))

(declare-fun c!104178 () Bool)

(assert (=> d!123579 (= c!104178 (bvsge (x!91636 lt!454044) #b01111111111111111111111111111110))))

(assert (=> d!123579 (= lt!454367 (select (arr!31155 (_keys!11288 thiss!1427)) (index!41117 lt!454044)))))

(assert (=> d!123579 (validMask!0 (mask!29885 thiss!1427))))

(assert (=> d!123579 (= (seekKeyOrZeroReturnVacant!0 (x!91636 lt!454044) (index!41117 lt!454044) (index!41117 lt!454044) key!909 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)) lt!454366)))

(declare-fun b!1030210 () Bool)

(declare-fun e!581712 () SeekEntryResult!9686)

(assert (=> b!1030210 (= e!581712 (MissingVacant!9686 (index!41117 lt!454044)))))

(declare-fun b!1030211 () Bool)

(assert (=> b!1030211 (= e!581712 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91636 lt!454044) #b00000000000000000000000000000001) (nextIndex!0 (index!41117 lt!454044) (x!91636 lt!454044) (mask!29885 thiss!1427)) (index!41117 lt!454044) key!909 (_keys!11288 thiss!1427) (mask!29885 thiss!1427)))))

(declare-fun b!1030212 () Bool)

(assert (=> b!1030212 (= e!581713 Undefined!9686)))

(declare-fun b!1030213 () Bool)

(assert (=> b!1030213 (= e!581711 (Found!9686 (index!41117 lt!454044)))))

(declare-fun b!1030214 () Bool)

(declare-fun c!104176 () Bool)

(assert (=> b!1030214 (= c!104176 (= lt!454367 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030214 (= e!581711 e!581712)))

(assert (= (and d!123579 c!104178) b!1030212))

(assert (= (and d!123579 (not c!104178)) b!1030209))

(assert (= (and b!1030209 c!104177) b!1030213))

(assert (= (and b!1030209 (not c!104177)) b!1030214))

(assert (= (and b!1030214 c!104176) b!1030210))

(assert (= (and b!1030214 (not c!104176)) b!1030211))

(declare-fun m!949881 () Bool)

(assert (=> d!123579 m!949881))

(declare-fun m!949883 () Bool)

(assert (=> d!123579 m!949883))

(assert (=> d!123579 m!949221))

(assert (=> d!123579 m!949219))

(declare-fun m!949885 () Bool)

(assert (=> b!1030211 m!949885))

(assert (=> b!1030211 m!949885))

(declare-fun m!949887 () Bool)

(assert (=> b!1030211 m!949887))

(assert (=> b!1029777 d!123579))

(declare-fun d!123581 () Bool)

(assert (=> d!123581 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1029879 d!123581))

(declare-fun b!1030215 () Bool)

(declare-fun e!581716 () Bool)

(declare-fun e!581715 () Bool)

(assert (=> b!1030215 (= e!581716 e!581715)))

(declare-fun c!104179 () Bool)

(assert (=> b!1030215 (= c!104179 (validKeyInArray!0 (select (arr!31155 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43547 () Bool)

(declare-fun call!43550 () Bool)

(assert (=> bm!43547 (= call!43550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!453998 (mask!29885 thiss!1427)))))

(declare-fun b!1030216 () Bool)

(declare-fun e!581714 () Bool)

(assert (=> b!1030216 (= e!581714 call!43550)))

(declare-fun d!123583 () Bool)

(declare-fun res!688946 () Bool)

(assert (=> d!123583 (=> res!688946 e!581716)))

(assert (=> d!123583 (= res!688946 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31671 lt!453998)))))

(assert (=> d!123583 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453998 (mask!29885 thiss!1427)) e!581716)))

(declare-fun b!1030217 () Bool)

(assert (=> b!1030217 (= e!581715 e!581714)))

(declare-fun lt!454369 () (_ BitVec 64))

(assert (=> b!1030217 (= lt!454369 (select (arr!31155 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!454370 () Unit!33629)

(assert (=> b!1030217 (= lt!454370 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453998 lt!454369 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1030217 (arrayContainsKey!0 lt!453998 lt!454369 #b00000000000000000000000000000000)))

(declare-fun lt!454368 () Unit!33629)

(assert (=> b!1030217 (= lt!454368 lt!454370)))

(declare-fun res!688945 () Bool)

(assert (=> b!1030217 (= res!688945 (= (seekEntryOrOpen!0 (select (arr!31155 lt!453998) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!453998 (mask!29885 thiss!1427)) (Found!9686 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1030217 (=> (not res!688945) (not e!581714))))

(declare-fun b!1030218 () Bool)

(assert (=> b!1030218 (= e!581715 call!43550)))

(assert (= (and d!123583 (not res!688946)) b!1030215))

(assert (= (and b!1030215 c!104179) b!1030217))

(assert (= (and b!1030215 (not c!104179)) b!1030218))

(assert (= (and b!1030217 res!688945) b!1030216))

(assert (= (or b!1030216 b!1030218) bm!43547))

(assert (=> b!1030215 m!949399))

(assert (=> b!1030215 m!949399))

(assert (=> b!1030215 m!949403))

(declare-fun m!949889 () Bool)

(assert (=> bm!43547 m!949889))

(assert (=> b!1030217 m!949399))

(declare-fun m!949891 () Bool)

(assert (=> b!1030217 m!949891))

(declare-fun m!949893 () Bool)

(assert (=> b!1030217 m!949893))

(assert (=> b!1030217 m!949399))

(declare-fun m!949895 () Bool)

(assert (=> b!1030217 m!949895))

(assert (=> bm!43523 d!123583))

(declare-fun d!123585 () Bool)

(declare-fun e!581718 () Bool)

(assert (=> d!123585 e!581718))

(declare-fun res!688947 () Bool)

(assert (=> d!123585 (=> res!688947 e!581718)))

(declare-fun lt!454371 () Bool)

(assert (=> d!123585 (= res!688947 (not lt!454371))))

(declare-fun lt!454374 () Bool)

(assert (=> d!123585 (= lt!454371 lt!454374)))

(declare-fun lt!454372 () Unit!33629)

(declare-fun e!581717 () Unit!33629)

(assert (=> d!123585 (= lt!454372 e!581717)))

(declare-fun c!104180 () Bool)

(assert (=> d!123585 (= c!104180 lt!454374)))

(assert (=> d!123585 (= lt!454374 (containsKey!562 (toList!6860 lt!454107) (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123585 (= (contains!5975 lt!454107 (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)) lt!454371)))

(declare-fun b!1030219 () Bool)

(declare-fun lt!454373 () Unit!33629)

(assert (=> b!1030219 (= e!581717 lt!454373)))

(assert (=> b!1030219 (= lt!454373 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6860 lt!454107) (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030219 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454107) (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030220 () Bool)

(declare-fun Unit!33644 () Unit!33629)

(assert (=> b!1030220 (= e!581717 Unit!33644)))

(declare-fun b!1030221 () Bool)

(assert (=> b!1030221 (= e!581718 (isDefined!434 (getValueByKey!587 (toList!6860 lt!454107) (select (arr!31155 (_keys!11288 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123585 c!104180) b!1030219))

(assert (= (and d!123585 (not c!104180)) b!1030220))

(assert (= (and d!123585 (not res!688947)) b!1030221))

(assert (=> d!123585 m!949233))

(declare-fun m!949897 () Bool)

(assert (=> d!123585 m!949897))

(assert (=> b!1030219 m!949233))

(declare-fun m!949899 () Bool)

(assert (=> b!1030219 m!949899))

(assert (=> b!1030219 m!949233))

(assert (=> b!1030219 m!949585))

(assert (=> b!1030219 m!949585))

(declare-fun m!949901 () Bool)

(assert (=> b!1030219 m!949901))

(assert (=> b!1030221 m!949233))

(assert (=> b!1030221 m!949585))

(assert (=> b!1030221 m!949585))

(assert (=> b!1030221 m!949901))

(assert (=> b!1029841 d!123585))

(declare-fun b!1030230 () Bool)

(declare-fun res!688959 () Bool)

(declare-fun e!581721 () Bool)

(assert (=> b!1030230 (=> (not res!688959) (not e!581721))))

(assert (=> b!1030230 (= res!688959 (and (= (size!31672 (_values!6145 thiss!1427)) (bvadd (mask!29885 thiss!1427) #b00000000000000000000000000000001)) (= (size!31671 (_keys!11288 thiss!1427)) (size!31672 (_values!6145 thiss!1427))) (bvsge (_size!2809 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2809 thiss!1427) (bvadd (mask!29885 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1030232 () Bool)

(declare-fun res!688958 () Bool)

(assert (=> b!1030232 (=> (not res!688958) (not e!581721))))

(declare-fun size!31675 (LongMapFixedSize!5508) (_ BitVec 32))

(assert (=> b!1030232 (= res!688958 (= (size!31675 thiss!1427) (bvadd (_size!2809 thiss!1427) (bvsdiv (bvadd (extraKeys!5854 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1030233 () Bool)

(assert (=> b!1030233 (= e!581721 (and (bvsge (extraKeys!5854 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5854 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2809 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun d!123587 () Bool)

(declare-fun res!688956 () Bool)

(assert (=> d!123587 (=> (not res!688956) (not e!581721))))

(assert (=> d!123587 (= res!688956 (validMask!0 (mask!29885 thiss!1427)))))

(assert (=> d!123587 (= (simpleValid!395 thiss!1427) e!581721)))

(declare-fun b!1030231 () Bool)

(declare-fun res!688957 () Bool)

(assert (=> b!1030231 (=> (not res!688957) (not e!581721))))

(assert (=> b!1030231 (= res!688957 (bvsge (size!31675 thiss!1427) (_size!2809 thiss!1427)))))

(assert (= (and d!123587 res!688956) b!1030230))

(assert (= (and b!1030230 res!688959) b!1030231))

(assert (= (and b!1030231 res!688957) b!1030232))

(assert (= (and b!1030232 res!688958) b!1030233))

(declare-fun m!949903 () Bool)

(assert (=> b!1030232 m!949903))

(assert (=> d!123587 m!949219))

(assert (=> b!1030231 m!949903))

(assert (=> d!123389 d!123587))

(declare-fun mapNonEmpty!37935 () Bool)

(declare-fun mapRes!37935 () Bool)

(declare-fun tp!72877 () Bool)

(declare-fun e!581722 () Bool)

(assert (=> mapNonEmpty!37935 (= mapRes!37935 (and tp!72877 e!581722))))

(declare-fun mapRest!37935 () (Array (_ BitVec 32) ValueCell!11457))

(declare-fun mapKey!37935 () (_ BitVec 32))

(declare-fun mapValue!37935 () ValueCell!11457)

(assert (=> mapNonEmpty!37935 (= mapRest!37934 (store mapRest!37935 mapKey!37935 mapValue!37935))))

(declare-fun b!1030234 () Bool)

(assert (=> b!1030234 (= e!581722 tp_is_empty!24321)))

(declare-fun condMapEmpty!37935 () Bool)

(declare-fun mapDefault!37935 () ValueCell!11457)

(assert (=> mapNonEmpty!37934 (= condMapEmpty!37935 (= mapRest!37934 ((as const (Array (_ BitVec 32) ValueCell!11457)) mapDefault!37935)))))

(declare-fun e!581723 () Bool)

(assert (=> mapNonEmpty!37934 (= tp!72876 (and e!581723 mapRes!37935))))

(declare-fun b!1030235 () Bool)

(assert (=> b!1030235 (= e!581723 tp_is_empty!24321)))

(declare-fun mapIsEmpty!37935 () Bool)

(assert (=> mapIsEmpty!37935 mapRes!37935))

(assert (= (and mapNonEmpty!37934 condMapEmpty!37935) mapIsEmpty!37935))

(assert (= (and mapNonEmpty!37934 (not condMapEmpty!37935)) mapNonEmpty!37935))

(assert (= (and mapNonEmpty!37935 ((_ is ValueCellFull!11457) mapValue!37935)) b!1030234))

(assert (= (and mapNonEmpty!37934 ((_ is ValueCellFull!11457) mapDefault!37935)) b!1030235))

(declare-fun m!949905 () Bool)

(assert (=> mapNonEmpty!37935 m!949905))

(declare-fun b_lambda!15923 () Bool)

(assert (= b_lambda!15917 (or (and b!1029718 b_free!20601) b_lambda!15923)))

(declare-fun b_lambda!15925 () Bool)

(assert (= b_lambda!15913 (or (and b!1029718 b_free!20601) b_lambda!15925)))

(declare-fun b_lambda!15927 () Bool)

(assert (= b_lambda!15915 (or (and b!1029718 b_free!20601) b_lambda!15927)))

(declare-fun b_lambda!15929 () Bool)

(assert (= b_lambda!15921 (or (and b!1029718 b_free!20601) b_lambda!15929)))

(declare-fun b_lambda!15931 () Bool)

(assert (= b_lambda!15911 (or (and b!1029718 b_free!20601) b_lambda!15931)))

(declare-fun b_lambda!15933 () Bool)

(assert (= b_lambda!15919 (or (and b!1029718 b_free!20601) b_lambda!15933)))

(check-sat (not b!1030013) (not bm!43528) (not d!123461) (not b!1030026) (not b_lambda!15897) (not d!123559) (not d!123579) (not d!123453) (not b!1030029) (not d!123517) (not b!1030093) (not d!123507) (not bm!43545) (not b!1030089) (not b!1030060) (not d!123467) (not b_lambda!15907) (not b!1029953) (not b!1030054) (not b!1030096) (not b!1030156) (not bm!43531) tp_is_empty!24321 (not b!1030072) (not b!1030107) (not b_lambda!15929) (not b!1030219) (not b!1030211) (not b_lambda!15925) (not d!123531) (not b!1030033) (not b!1030162) (not b!1029950) (not d!123491) (not d!123445) (not b!1030085) (not bm!43542) (not b!1030069) (not b!1030131) (not b!1030130) (not bm!43538) (not d!123545) (not b_lambda!15933) (not b_lambda!15923) (not b!1029949) (not b!1030099) (not b!1029995) (not b!1029962) (not b!1029997) (not d!123449) (not b!1030170) (not d!123465) (not b!1030051) (not b!1030133) (not b!1030168) (not b!1029954) (not b!1030012) (not b!1029966) (not b!1030079) (not d!123525) (not b!1030092) (not b!1030008) (not bm!43544) (not b!1030015) (not b!1030018) (not d!123521) (not b!1030036) (not b!1030020) (not b!1030087) (not b!1030059) (not d!123459) (not b!1030095) (not b!1030083) (not d!123527) (not d!123565) (not b!1030017) (not bm!43532) (not b!1030067) (not b!1030128) (not d!123477) (not d!123443) (not b_next!20601) (not bm!43546) (not b!1030024) (not d!123569) (not d!123585) (not b!1030221) (not d!123495) (not d!123475) (not b!1030102) (not b!1030193) (not d!123549) (not b!1030091) (not b!1029999) (not d!123557) (not b!1030065) (not b!1030186) (not d!123587) (not d!123523) (not b!1030126) (not b!1030217) (not bm!43534) (not d!123447) (not b_lambda!15909) (not bm!43535) (not d!123505) (not b!1030034) (not b!1030129) (not d!123513) (not b!1030106) (not bm!43536) (not d!123561) (not b!1029964) (not b!1030105) (not b!1030075) (not d!123573) (not bm!43543) (not d!123451) (not d!123489) (not d!123519) (not b!1030119) (not d!123551) (not b!1030084) (not d!123543) (not b!1030021) (not d!123457) (not b!1030022) (not d!123463) (not d!123425) (not b!1030109) (not b!1030163) (not b!1030231) (not d!123431) (not b!1030063) (not d!123547) (not d!123435) (not b_lambda!15931) (not b!1030001) (not d!123499) (not b!1030232) (not d!123509) (not b!1030074) (not b!1030125) (not bm!43533) (not d!123541) (not b!1030080) (not d!123535) (not b_lambda!15905) (not b!1029994) (not b!1030014) (not d!123503) (not bm!43539) (not b_lambda!15927) (not b!1029952) (not b!1030100) (not b!1030195) (not b!1030076) (not d!123469) (not b!1030039) (not bm!43547) (not b!1030037) (not b!1030113) (not b!1030061) (not d!123501) (not b!1029992) (not d!123441) (not d!123515) (not d!123511) (not d!123487) (not d!123455) (not d!123577) (not b!1030215) (not b!1030118) (not d!123537) (not b!1029991) (not b!1030192) (not b!1029965) (not b!1030164) (not d!123439) (not b!1030070) (not b!1030064) (not b!1030010) b_and!32969 (not d!123471) (not b!1030066) (not mapNonEmpty!37935) (not d!123485) (not d!123497) (not b!1030000) (not b!1030086))
(check-sat b_and!32969 (not b_next!20601))
