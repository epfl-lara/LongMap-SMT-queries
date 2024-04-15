; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90074 () Bool)

(assert start!90074)

(declare-fun b!1031663 () Bool)

(declare-fun b_free!20683 () Bool)

(declare-fun b_next!20683 () Bool)

(assert (=> b!1031663 (= b_free!20683 (not b_next!20683))))

(declare-fun tp!73120 () Bool)

(declare-fun b_and!33107 () Bool)

(assert (=> b!1031663 (= tp!73120 b_and!33107)))

(declare-fun b!1031657 () Bool)

(declare-fun e!582742 () Bool)

(assert (=> b!1031657 (= e!582742 false)))

(declare-fun b!1031658 () Bool)

(declare-datatypes ((Unit!33651 0))(
  ( (Unit!33652) )
))
(declare-fun e!582737 () Unit!33651)

(declare-fun Unit!33653 () Unit!33651)

(assert (=> b!1031658 (= e!582737 Unit!33653)))

(declare-fun b!1031659 () Bool)

(declare-fun e!582738 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37411 0))(
  ( (V!37412 (val!12252 Int)) )
))
(declare-datatypes ((ValueCell!11498 0))(
  ( (ValueCellFull!11498 (v!14828 V!37411)) (EmptyCell!11498) )
))
(declare-datatypes ((array!64809 0))(
  ( (array!64810 (arr!31206 (Array (_ BitVec 32) (_ BitVec 64))) (size!31725 (_ BitVec 32))) )
))
(declare-datatypes ((array!64811 0))(
  ( (array!64812 (arr!31207 (Array (_ BitVec 32) ValueCell!11498)) (size!31726 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5590 0))(
  ( (LongMapFixedSize!5591 (defaultEntry!6169 Int) (mask!29968 (_ BitVec 32)) (extraKeys!5901 (_ BitVec 32)) (zeroValue!6005 V!37411) (minValue!6005 V!37411) (_size!2850 (_ BitVec 32)) (_keys!11338 array!64809) (_values!6192 array!64811) (_vacant!2850 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15772 0))(
  ( (tuple2!15773 (_1!7897 Unit!33651) (_2!7897 LongMapFixedSize!5590)) )
))
(declare-fun lt!455504 () tuple2!15772)

(assert (=> b!1031659 (= e!582738 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5901 (_2!7897 lt!455504)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5901 (_2!7897 lt!455504)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1031660 () Bool)

(declare-fun e!582739 () Bool)

(declare-fun tp_is_empty!24403 () Bool)

(assert (=> b!1031660 (= e!582739 tp_is_empty!24403)))

(declare-fun b!1031661 () Bool)

(declare-fun arrayContainsKey!0 (array!64809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031661 (= e!582738 (arrayContainsKey!0 (_keys!11338 (_2!7897 lt!455504)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1031662 () Bool)

(declare-fun e!582741 () Bool)

(assert (=> b!1031662 (= e!582741 (not true))))

(declare-fun lt!455494 () Bool)

(declare-fun valid!2104 (LongMapFixedSize!5590) Bool)

(assert (=> b!1031662 (= lt!455494 (valid!2104 (_2!7897 lt!455504)))))

(declare-fun lt!455496 () Unit!33651)

(assert (=> b!1031662 (= lt!455496 e!582737)))

(declare-fun c!104214 () Bool)

(declare-datatypes ((tuple2!15774 0))(
  ( (tuple2!15775 (_1!7898 (_ BitVec 64)) (_2!7898 V!37411)) )
))
(declare-datatypes ((List!21915 0))(
  ( (Nil!21912) (Cons!21911 (h!23113 tuple2!15774) (t!31084 List!21915)) )
))
(declare-datatypes ((ListLongMap!13813 0))(
  ( (ListLongMap!13814 (toList!6922 List!21915)) )
))
(declare-fun contains!5978 (ListLongMap!13813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3889 (array!64809 array!64811 (_ BitVec 32) (_ BitVec 32) V!37411 V!37411 (_ BitVec 32) Int) ListLongMap!13813)

(assert (=> b!1031662 (= c!104214 (contains!5978 (getCurrentListMap!3889 (_keys!11338 (_2!7897 lt!455504)) (_values!6192 (_2!7897 lt!455504)) (mask!29968 (_2!7897 lt!455504)) (extraKeys!5901 (_2!7897 lt!455504)) (zeroValue!6005 (_2!7897 lt!455504)) (minValue!6005 (_2!7897 lt!455504)) #b00000000000000000000000000000000 (defaultEntry!6169 (_2!7897 lt!455504))) key!909))))

(declare-fun lt!455502 () array!64809)

(declare-fun lt!455497 () array!64811)

(declare-fun thiss!1427 () LongMapFixedSize!5590)

(declare-fun Unit!33654 () Unit!33651)

(declare-fun Unit!33655 () Unit!33651)

(assert (=> b!1031662 (= lt!455504 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2850 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15773 Unit!33654 (LongMapFixedSize!5591 (defaultEntry!6169 thiss!1427) (mask!29968 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) (bvsub (_size!2850 thiss!1427) #b00000000000000000000000000000001) lt!455502 lt!455497 (bvadd #b00000000000000000000000000000001 (_vacant!2850 thiss!1427)))) (tuple2!15773 Unit!33655 (LongMapFixedSize!5591 (defaultEntry!6169 thiss!1427) (mask!29968 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) (bvsub (_size!2850 thiss!1427) #b00000000000000000000000000000001) lt!455502 lt!455497 (_vacant!2850 thiss!1427)))))))

(declare-fun -!514 (ListLongMap!13813 (_ BitVec 64)) ListLongMap!13813)

(assert (=> b!1031662 (= (-!514 (getCurrentListMap!3889 (_keys!11338 thiss!1427) (_values!6192 thiss!1427) (mask!29968 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6169 thiss!1427)) key!909) (getCurrentListMap!3889 lt!455502 lt!455497 (mask!29968 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6169 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9705 0))(
  ( (MissingZero!9705 (index!41191 (_ BitVec 32))) (Found!9705 (index!41192 (_ BitVec 32))) (Intermediate!9705 (undefined!10517 Bool) (index!41193 (_ BitVec 32)) (x!91894 (_ BitVec 32))) (Undefined!9705) (MissingVacant!9705 (index!41194 (_ BitVec 32))) )
))
(declare-fun lt!455505 () SeekEntryResult!9705)

(declare-fun dynLambda!1976 (Int (_ BitVec 64)) V!37411)

(assert (=> b!1031662 (= lt!455497 (array!64812 (store (arr!31207 (_values!6192 thiss!1427)) (index!41192 lt!455505) (ValueCellFull!11498 (dynLambda!1976 (defaultEntry!6169 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31726 (_values!6192 thiss!1427))))))

(declare-fun lt!455503 () Unit!33651)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!39 (array!64809 array!64811 (_ BitVec 32) (_ BitVec 32) V!37411 V!37411 (_ BitVec 32) (_ BitVec 64) Int) Unit!33651)

(assert (=> b!1031662 (= lt!455503 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!39 (_keys!11338 thiss!1427) (_values!6192 thiss!1427) (mask!29968 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) (index!41192 lt!455505) key!909 (defaultEntry!6169 thiss!1427)))))

(assert (=> b!1031662 (not (arrayContainsKey!0 lt!455502 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455495 () Unit!33651)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64809 (_ BitVec 32) (_ BitVec 64)) Unit!33651)

(assert (=> b!1031662 (= lt!455495 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11338 thiss!1427) (index!41192 lt!455505) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64809 (_ BitVec 32)) Bool)

(assert (=> b!1031662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455502 (mask!29968 thiss!1427))))

(declare-fun lt!455498 () Unit!33651)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64809 (_ BitVec 32) (_ BitVec 32)) Unit!33651)

(assert (=> b!1031662 (= lt!455498 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11338 thiss!1427) (index!41192 lt!455505) (mask!29968 thiss!1427)))))

(declare-datatypes ((List!21916 0))(
  ( (Nil!21913) (Cons!21912 (h!23114 (_ BitVec 64)) (t!31085 List!21916)) )
))
(declare-fun arrayNoDuplicates!0 (array!64809 (_ BitVec 32) List!21916) Bool)

(assert (=> b!1031662 (arrayNoDuplicates!0 lt!455502 #b00000000000000000000000000000000 Nil!21913)))

(declare-fun lt!455501 () Unit!33651)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64809 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21916) Unit!33651)

(assert (=> b!1031662 (= lt!455501 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11338 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41192 lt!455505) #b00000000000000000000000000000000 Nil!21913))))

(declare-fun arrayCountValidKeys!0 (array!64809 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031662 (= (arrayCountValidKeys!0 lt!455502 #b00000000000000000000000000000000 (size!31725 (_keys!11338 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11338 thiss!1427) #b00000000000000000000000000000000 (size!31725 (_keys!11338 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031662 (= lt!455502 (array!64810 (store (arr!31206 (_keys!11338 thiss!1427)) (index!41192 lt!455505) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31725 (_keys!11338 thiss!1427))))))

(declare-fun lt!455500 () Unit!33651)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64809 (_ BitVec 32) (_ BitVec 64)) Unit!33651)

(assert (=> b!1031662 (= lt!455500 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11338 thiss!1427) (index!41192 lt!455505) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582746 () Bool)

(declare-fun e!582745 () Bool)

(declare-fun array_inv!24153 (array!64809) Bool)

(declare-fun array_inv!24154 (array!64811) Bool)

(assert (=> b!1031663 (= e!582745 (and tp!73120 tp_is_empty!24403 (array_inv!24153 (_keys!11338 thiss!1427)) (array_inv!24154 (_values!6192 thiss!1427)) e!582746))))

(declare-fun b!1031664 () Bool)

(declare-fun res!689764 () Bool)

(declare-fun e!582744 () Bool)

(assert (=> b!1031664 (=> (not res!689764) (not e!582744))))

(assert (=> b!1031664 (= res!689764 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031665 () Bool)

(assert (=> b!1031665 (= e!582744 e!582741)))

(declare-fun res!689763 () Bool)

(assert (=> b!1031665 (=> (not res!689763) (not e!582741))))

(get-info :version)

(assert (=> b!1031665 (= res!689763 ((_ is Found!9705) lt!455505))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64809 (_ BitVec 32)) SeekEntryResult!9705)

(assert (=> b!1031665 (= lt!455505 (seekEntry!0 key!909 (_keys!11338 thiss!1427) (mask!29968 thiss!1427)))))

(declare-fun b!1031666 () Bool)

(declare-fun e!582740 () Bool)

(declare-fun mapRes!38058 () Bool)

(assert (=> b!1031666 (= e!582746 (and e!582740 mapRes!38058))))

(declare-fun condMapEmpty!38058 () Bool)

(declare-fun mapDefault!38058 () ValueCell!11498)

(assert (=> b!1031666 (= condMapEmpty!38058 (= (arr!31207 (_values!6192 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11498)) mapDefault!38058)))))

(declare-fun res!689761 () Bool)

(assert (=> start!90074 (=> (not res!689761) (not e!582744))))

(assert (=> start!90074 (= res!689761 (valid!2104 thiss!1427))))

(assert (=> start!90074 e!582744))

(assert (=> start!90074 e!582745))

(assert (=> start!90074 true))

(declare-fun b!1031667 () Bool)

(declare-fun Unit!33656 () Unit!33651)

(assert (=> b!1031667 (= e!582737 Unit!33656)))

(declare-fun lt!455499 () Unit!33651)

(declare-fun lemmaKeyInListMapIsInArray!326 (array!64809 array!64811 (_ BitVec 32) (_ BitVec 32) V!37411 V!37411 (_ BitVec 64) Int) Unit!33651)

(assert (=> b!1031667 (= lt!455499 (lemmaKeyInListMapIsInArray!326 (_keys!11338 (_2!7897 lt!455504)) (_values!6192 (_2!7897 lt!455504)) (mask!29968 (_2!7897 lt!455504)) (extraKeys!5901 (_2!7897 lt!455504)) (zeroValue!6005 (_2!7897 lt!455504)) (minValue!6005 (_2!7897 lt!455504)) key!909 (defaultEntry!6169 (_2!7897 lt!455504))))))

(declare-fun c!104213 () Bool)

(assert (=> b!1031667 (= c!104213 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689762 () Bool)

(assert (=> b!1031667 (= res!689762 e!582738)))

(assert (=> b!1031667 (=> (not res!689762) (not e!582742))))

(assert (=> b!1031667 e!582742))

(declare-fun mapIsEmpty!38058 () Bool)

(assert (=> mapIsEmpty!38058 mapRes!38058))

(declare-fun b!1031668 () Bool)

(assert (=> b!1031668 (= e!582740 tp_is_empty!24403)))

(declare-fun mapNonEmpty!38058 () Bool)

(declare-fun tp!73119 () Bool)

(assert (=> mapNonEmpty!38058 (= mapRes!38058 (and tp!73119 e!582739))))

(declare-fun mapValue!38058 () ValueCell!11498)

(declare-fun mapKey!38058 () (_ BitVec 32))

(declare-fun mapRest!38058 () (Array (_ BitVec 32) ValueCell!11498))

(assert (=> mapNonEmpty!38058 (= (arr!31207 (_values!6192 thiss!1427)) (store mapRest!38058 mapKey!38058 mapValue!38058))))

(assert (= (and start!90074 res!689761) b!1031664))

(assert (= (and b!1031664 res!689764) b!1031665))

(assert (= (and b!1031665 res!689763) b!1031662))

(assert (= (and b!1031662 c!104214) b!1031667))

(assert (= (and b!1031662 (not c!104214)) b!1031658))

(assert (= (and b!1031667 c!104213) b!1031661))

(assert (= (and b!1031667 (not c!104213)) b!1031659))

(assert (= (and b!1031667 res!689762) b!1031657))

(assert (= (and b!1031666 condMapEmpty!38058) mapIsEmpty!38058))

(assert (= (and b!1031666 (not condMapEmpty!38058)) mapNonEmpty!38058))

(assert (= (and mapNonEmpty!38058 ((_ is ValueCellFull!11498) mapValue!38058)) b!1031660))

(assert (= (and b!1031666 ((_ is ValueCellFull!11498) mapDefault!38058)) b!1031668))

(assert (= b!1031663 b!1031666))

(assert (= start!90074 b!1031663))

(declare-fun b_lambda!16005 () Bool)

(assert (=> (not b_lambda!16005) (not b!1031662)))

(declare-fun t!31083 () Bool)

(declare-fun tb!6993 () Bool)

(assert (=> (and b!1031663 (= (defaultEntry!6169 thiss!1427) (defaultEntry!6169 thiss!1427)) t!31083) tb!6993))

(declare-fun result!14323 () Bool)

(assert (=> tb!6993 (= result!14323 tp_is_empty!24403)))

(assert (=> b!1031662 t!31083))

(declare-fun b_and!33109 () Bool)

(assert (= b_and!33107 (and (=> t!31083 result!14323) b_and!33109)))

(declare-fun m!951469 () Bool)

(assert (=> b!1031665 m!951469))

(declare-fun m!951471 () Bool)

(assert (=> b!1031661 m!951471))

(declare-fun m!951473 () Bool)

(assert (=> mapNonEmpty!38058 m!951473))

(declare-fun m!951475 () Bool)

(assert (=> b!1031662 m!951475))

(declare-fun m!951477 () Bool)

(assert (=> b!1031662 m!951477))

(declare-fun m!951479 () Bool)

(assert (=> b!1031662 m!951479))

(declare-fun m!951481 () Bool)

(assert (=> b!1031662 m!951481))

(declare-fun m!951483 () Bool)

(assert (=> b!1031662 m!951483))

(declare-fun m!951485 () Bool)

(assert (=> b!1031662 m!951485))

(declare-fun m!951487 () Bool)

(assert (=> b!1031662 m!951487))

(declare-fun m!951489 () Bool)

(assert (=> b!1031662 m!951489))

(declare-fun m!951491 () Bool)

(assert (=> b!1031662 m!951491))

(assert (=> b!1031662 m!951485))

(declare-fun m!951493 () Bool)

(assert (=> b!1031662 m!951493))

(declare-fun m!951495 () Bool)

(assert (=> b!1031662 m!951495))

(declare-fun m!951497 () Bool)

(assert (=> b!1031662 m!951497))

(declare-fun m!951499 () Bool)

(assert (=> b!1031662 m!951499))

(declare-fun m!951501 () Bool)

(assert (=> b!1031662 m!951501))

(declare-fun m!951503 () Bool)

(assert (=> b!1031662 m!951503))

(assert (=> b!1031662 m!951491))

(declare-fun m!951505 () Bool)

(assert (=> b!1031662 m!951505))

(declare-fun m!951507 () Bool)

(assert (=> b!1031662 m!951507))

(declare-fun m!951509 () Bool)

(assert (=> b!1031662 m!951509))

(declare-fun m!951511 () Bool)

(assert (=> b!1031662 m!951511))

(declare-fun m!951513 () Bool)

(assert (=> start!90074 m!951513))

(declare-fun m!951515 () Bool)

(assert (=> b!1031667 m!951515))

(declare-fun m!951517 () Bool)

(assert (=> b!1031663 m!951517))

(declare-fun m!951519 () Bool)

(assert (=> b!1031663 m!951519))

(check-sat (not b!1031661) (not mapNonEmpty!38058) (not b!1031667) (not b!1031662) (not b_lambda!16005) (not start!90074) (not b!1031665) b_and!33109 (not b!1031663) (not b_next!20683) tp_is_empty!24403)
(check-sat b_and!33109 (not b_next!20683))
