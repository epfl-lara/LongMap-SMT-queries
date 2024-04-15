; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90044 () Bool)

(assert start!90044)

(declare-fun b!1031126 () Bool)

(declare-fun b_free!20653 () Bool)

(declare-fun b_next!20653 () Bool)

(assert (=> b!1031126 (= b_free!20653 (not b_next!20653))))

(declare-fun tp!73029 () Bool)

(declare-fun b_and!33047 () Bool)

(assert (=> b!1031126 (= tp!73029 b_and!33047)))

(declare-fun mapIsEmpty!38013 () Bool)

(declare-fun mapRes!38013 () Bool)

(assert (=> mapIsEmpty!38013 mapRes!38013))

(declare-fun b!1031121 () Bool)

(declare-fun e!582357 () Bool)

(declare-fun e!582356 () Bool)

(assert (=> b!1031121 (= e!582357 e!582356)))

(declare-fun res!689480 () Bool)

(assert (=> b!1031121 (=> (not res!689480) (not e!582356))))

(declare-datatypes ((SeekEntryResult!9694 0))(
  ( (MissingZero!9694 (index!41147 (_ BitVec 32))) (Found!9694 (index!41148 (_ BitVec 32))) (Intermediate!9694 (undefined!10506 Bool) (index!41149 (_ BitVec 32)) (x!91813 (_ BitVec 32))) (Undefined!9694) (MissingVacant!9694 (index!41150 (_ BitVec 32))) )
))
(declare-fun lt!455029 () SeekEntryResult!9694)

(get-info :version)

(assert (=> b!1031121 (= res!689480 ((_ is Found!9694) lt!455029))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37371 0))(
  ( (V!37372 (val!12237 Int)) )
))
(declare-datatypes ((ValueCell!11483 0))(
  ( (ValueCellFull!11483 (v!14813 V!37371)) (EmptyCell!11483) )
))
(declare-datatypes ((array!64749 0))(
  ( (array!64750 (arr!31176 (Array (_ BitVec 32) (_ BitVec 64))) (size!31695 (_ BitVec 32))) )
))
(declare-datatypes ((array!64751 0))(
  ( (array!64752 (arr!31177 (Array (_ BitVec 32) ValueCell!11483)) (size!31696 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5560 0))(
  ( (LongMapFixedSize!5561 (defaultEntry!6154 Int) (mask!29943 (_ BitVec 32)) (extraKeys!5886 (_ BitVec 32)) (zeroValue!5990 V!37371) (minValue!5990 V!37371) (_size!2835 (_ BitVec 32)) (_keys!11323 array!64749) (_values!6177 array!64751) (_vacant!2835 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5560)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64749 (_ BitVec 32)) SeekEntryResult!9694)

(assert (=> b!1031121 (= lt!455029 (seekEntry!0 key!909 (_keys!11323 thiss!1427) (mask!29943 thiss!1427)))))

(declare-fun b!1031122 () Bool)

(declare-fun res!689483 () Bool)

(assert (=> b!1031122 (=> (not res!689483) (not e!582357))))

(assert (=> b!1031122 (= res!689483 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031124 () Bool)

(declare-fun e!582361 () Bool)

(declare-fun e!582360 () Bool)

(assert (=> b!1031124 (= e!582361 (and e!582360 mapRes!38013))))

(declare-fun condMapEmpty!38013 () Bool)

(declare-fun mapDefault!38013 () ValueCell!11483)

(assert (=> b!1031124 (= condMapEmpty!38013 (= (arr!31177 (_values!6177 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11483)) mapDefault!38013)))))

(declare-fun b!1031125 () Bool)

(declare-fun e!582359 () Bool)

(assert (=> b!1031125 (= e!582356 (not e!582359))))

(declare-fun res!689484 () Bool)

(assert (=> b!1031125 (=> res!689484 e!582359)))

(declare-datatypes ((Unit!33609 0))(
  ( (Unit!33610) )
))
(declare-datatypes ((tuple2!15732 0))(
  ( (tuple2!15733 (_1!7877 Unit!33609) (_2!7877 LongMapFixedSize!5560)) )
))
(declare-fun lt!455026 () tuple2!15732)

(declare-datatypes ((tuple2!15734 0))(
  ( (tuple2!15735 (_1!7878 (_ BitVec 64)) (_2!7878 V!37371)) )
))
(declare-datatypes ((List!21895 0))(
  ( (Nil!21892) (Cons!21891 (h!23093 tuple2!15734) (t!31034 List!21895)) )
))
(declare-datatypes ((ListLongMap!13795 0))(
  ( (ListLongMap!13796 (toList!6913 List!21895)) )
))
(declare-fun contains!5969 (ListLongMap!13795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3880 (array!64749 array!64751 (_ BitVec 32) (_ BitVec 32) V!37371 V!37371 (_ BitVec 32) Int) ListLongMap!13795)

(assert (=> b!1031125 (= res!689484 (not (contains!5969 (getCurrentListMap!3880 (_keys!11323 (_2!7877 lt!455026)) (_values!6177 (_2!7877 lt!455026)) (mask!29943 (_2!7877 lt!455026)) (extraKeys!5886 (_2!7877 lt!455026)) (zeroValue!5990 (_2!7877 lt!455026)) (minValue!5990 (_2!7877 lt!455026)) #b00000000000000000000000000000000 (defaultEntry!6154 (_2!7877 lt!455026))) key!909)))))

(declare-fun lt!455031 () array!64751)

(declare-fun lt!455028 () array!64749)

(declare-fun Unit!33611 () Unit!33609)

(declare-fun Unit!33612 () Unit!33609)

(assert (=> b!1031125 (= lt!455026 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2835 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15733 Unit!33611 (LongMapFixedSize!5561 (defaultEntry!6154 thiss!1427) (mask!29943 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) (bvsub (_size!2835 thiss!1427) #b00000000000000000000000000000001) lt!455028 lt!455031 (bvadd #b00000000000000000000000000000001 (_vacant!2835 thiss!1427)))) (tuple2!15733 Unit!33612 (LongMapFixedSize!5561 (defaultEntry!6154 thiss!1427) (mask!29943 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) (bvsub (_size!2835 thiss!1427) #b00000000000000000000000000000001) lt!455028 lt!455031 (_vacant!2835 thiss!1427)))))))

(declare-fun -!505 (ListLongMap!13795 (_ BitVec 64)) ListLongMap!13795)

(assert (=> b!1031125 (= (-!505 (getCurrentListMap!3880 (_keys!11323 thiss!1427) (_values!6177 thiss!1427) (mask!29943 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6154 thiss!1427)) key!909) (getCurrentListMap!3880 lt!455028 lt!455031 (mask!29943 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6154 thiss!1427)))))

(declare-fun dynLambda!1967 (Int (_ BitVec 64)) V!37371)

(assert (=> b!1031125 (= lt!455031 (array!64752 (store (arr!31177 (_values!6177 thiss!1427)) (index!41148 lt!455029) (ValueCellFull!11483 (dynLambda!1967 (defaultEntry!6154 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31696 (_values!6177 thiss!1427))))))

(declare-fun lt!455022 () Unit!33609)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!30 (array!64749 array!64751 (_ BitVec 32) (_ BitVec 32) V!37371 V!37371 (_ BitVec 32) (_ BitVec 64) Int) Unit!33609)

(assert (=> b!1031125 (= lt!455022 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!30 (_keys!11323 thiss!1427) (_values!6177 thiss!1427) (mask!29943 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) (index!41148 lt!455029) key!909 (defaultEntry!6154 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031125 (not (arrayContainsKey!0 lt!455028 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455024 () Unit!33609)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64749 (_ BitVec 32) (_ BitVec 64)) Unit!33609)

(assert (=> b!1031125 (= lt!455024 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11323 thiss!1427) (index!41148 lt!455029) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64749 (_ BitVec 32)) Bool)

(assert (=> b!1031125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455028 (mask!29943 thiss!1427))))

(declare-fun lt!455027 () Unit!33609)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64749 (_ BitVec 32) (_ BitVec 32)) Unit!33609)

(assert (=> b!1031125 (= lt!455027 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11323 thiss!1427) (index!41148 lt!455029) (mask!29943 thiss!1427)))))

(declare-datatypes ((List!21896 0))(
  ( (Nil!21893) (Cons!21892 (h!23094 (_ BitVec 64)) (t!31035 List!21896)) )
))
(declare-fun arrayNoDuplicates!0 (array!64749 (_ BitVec 32) List!21896) Bool)

(assert (=> b!1031125 (arrayNoDuplicates!0 lt!455028 #b00000000000000000000000000000000 Nil!21893)))

(declare-fun lt!455023 () Unit!33609)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64749 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21896) Unit!33609)

(assert (=> b!1031125 (= lt!455023 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11323 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41148 lt!455029) #b00000000000000000000000000000000 Nil!21893))))

(declare-fun arrayCountValidKeys!0 (array!64749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031125 (= (arrayCountValidKeys!0 lt!455028 #b00000000000000000000000000000000 (size!31695 (_keys!11323 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11323 thiss!1427) #b00000000000000000000000000000000 (size!31695 (_keys!11323 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031125 (= lt!455028 (array!64750 (store (arr!31176 (_keys!11323 thiss!1427)) (index!41148 lt!455029) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31695 (_keys!11323 thiss!1427))))))

(declare-fun lt!455030 () Unit!33609)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64749 (_ BitVec 32) (_ BitVec 64)) Unit!33609)

(assert (=> b!1031125 (= lt!455030 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11323 thiss!1427) (index!41148 lt!455029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582358 () Bool)

(declare-fun tp_is_empty!24373 () Bool)

(declare-fun array_inv!24135 (array!64749) Bool)

(declare-fun array_inv!24136 (array!64751) Bool)

(assert (=> b!1031126 (= e!582358 (and tp!73029 tp_is_empty!24373 (array_inv!24135 (_keys!11323 thiss!1427)) (array_inv!24136 (_values!6177 thiss!1427)) e!582361))))

(declare-fun b!1031127 () Bool)

(declare-fun res!689481 () Bool)

(assert (=> b!1031127 (=> res!689481 e!582359)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031127 (= res!689481 (not (validMask!0 (mask!29943 (_2!7877 lt!455026)))))))

(declare-fun b!1031128 () Bool)

(declare-fun res!689485 () Bool)

(assert (=> b!1031128 (=> res!689485 e!582359)))

(assert (=> b!1031128 (= res!689485 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11323 (_2!7877 lt!455026)) (mask!29943 (_2!7877 lt!455026)))))))

(declare-fun b!1031129 () Bool)

(assert (=> b!1031129 (= e!582359 true)))

(declare-fun lt!455025 () Bool)

(assert (=> b!1031129 (= lt!455025 (arrayNoDuplicates!0 (_keys!11323 (_2!7877 lt!455026)) #b00000000000000000000000000000000 Nil!21893))))

(declare-fun mapNonEmpty!38013 () Bool)

(declare-fun tp!73030 () Bool)

(declare-fun e!582362 () Bool)

(assert (=> mapNonEmpty!38013 (= mapRes!38013 (and tp!73030 e!582362))))

(declare-fun mapKey!38013 () (_ BitVec 32))

(declare-fun mapValue!38013 () ValueCell!11483)

(declare-fun mapRest!38013 () (Array (_ BitVec 32) ValueCell!11483))

(assert (=> mapNonEmpty!38013 (= (arr!31177 (_values!6177 thiss!1427)) (store mapRest!38013 mapKey!38013 mapValue!38013))))

(declare-fun res!689482 () Bool)

(assert (=> start!90044 (=> (not res!689482) (not e!582357))))

(declare-fun valid!2095 (LongMapFixedSize!5560) Bool)

(assert (=> start!90044 (= res!689482 (valid!2095 thiss!1427))))

(assert (=> start!90044 e!582357))

(assert (=> start!90044 e!582358))

(assert (=> start!90044 true))

(declare-fun b!1031123 () Bool)

(assert (=> b!1031123 (= e!582360 tp_is_empty!24373)))

(declare-fun b!1031130 () Bool)

(assert (=> b!1031130 (= e!582362 tp_is_empty!24373)))

(declare-fun b!1031131 () Bool)

(declare-fun res!689479 () Bool)

(assert (=> b!1031131 (=> res!689479 e!582359)))

(assert (=> b!1031131 (= res!689479 (or (not (= (size!31696 (_values!6177 (_2!7877 lt!455026))) (bvadd #b00000000000000000000000000000001 (mask!29943 (_2!7877 lt!455026))))) (not (= (size!31695 (_keys!11323 (_2!7877 lt!455026))) (size!31696 (_values!6177 (_2!7877 lt!455026))))) (bvslt (mask!29943 (_2!7877 lt!455026)) #b00000000000000000000000000000000) (bvslt (extraKeys!5886 (_2!7877 lt!455026)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5886 (_2!7877 lt!455026)) #b00000000000000000000000000000011)))))

(assert (= (and start!90044 res!689482) b!1031122))

(assert (= (and b!1031122 res!689483) b!1031121))

(assert (= (and b!1031121 res!689480) b!1031125))

(assert (= (and b!1031125 (not res!689484)) b!1031127))

(assert (= (and b!1031127 (not res!689481)) b!1031131))

(assert (= (and b!1031131 (not res!689479)) b!1031128))

(assert (= (and b!1031128 (not res!689485)) b!1031129))

(assert (= (and b!1031124 condMapEmpty!38013) mapIsEmpty!38013))

(assert (= (and b!1031124 (not condMapEmpty!38013)) mapNonEmpty!38013))

(assert (= (and mapNonEmpty!38013 ((_ is ValueCellFull!11483) mapValue!38013)) b!1031130))

(assert (= (and b!1031124 ((_ is ValueCellFull!11483) mapDefault!38013)) b!1031123))

(assert (= b!1031126 b!1031124))

(assert (= start!90044 b!1031126))

(declare-fun b_lambda!15975 () Bool)

(assert (=> (not b_lambda!15975) (not b!1031125)))

(declare-fun t!31033 () Bool)

(declare-fun tb!6963 () Bool)

(assert (=> (and b!1031126 (= (defaultEntry!6154 thiss!1427) (defaultEntry!6154 thiss!1427)) t!31033) tb!6963))

(declare-fun result!14263 () Bool)

(assert (=> tb!6963 (= result!14263 tp_is_empty!24373)))

(assert (=> b!1031125 t!31033))

(declare-fun b_and!33049 () Bool)

(assert (= b_and!33047 (and (=> t!31033 result!14263) b_and!33049)))

(declare-fun m!950689 () Bool)

(assert (=> b!1031125 m!950689))

(declare-fun m!950691 () Bool)

(assert (=> b!1031125 m!950691))

(declare-fun m!950693 () Bool)

(assert (=> b!1031125 m!950693))

(declare-fun m!950695 () Bool)

(assert (=> b!1031125 m!950695))

(declare-fun m!950697 () Bool)

(assert (=> b!1031125 m!950697))

(declare-fun m!950699 () Bool)

(assert (=> b!1031125 m!950699))

(declare-fun m!950701 () Bool)

(assert (=> b!1031125 m!950701))

(declare-fun m!950703 () Bool)

(assert (=> b!1031125 m!950703))

(assert (=> b!1031125 m!950691))

(declare-fun m!950705 () Bool)

(assert (=> b!1031125 m!950705))

(declare-fun m!950707 () Bool)

(assert (=> b!1031125 m!950707))

(declare-fun m!950709 () Bool)

(assert (=> b!1031125 m!950709))

(declare-fun m!950711 () Bool)

(assert (=> b!1031125 m!950711))

(declare-fun m!950713 () Bool)

(assert (=> b!1031125 m!950713))

(declare-fun m!950715 () Bool)

(assert (=> b!1031125 m!950715))

(declare-fun m!950717 () Bool)

(assert (=> b!1031125 m!950717))

(declare-fun m!950719 () Bool)

(assert (=> b!1031125 m!950719))

(declare-fun m!950721 () Bool)

(assert (=> b!1031125 m!950721))

(declare-fun m!950723 () Bool)

(assert (=> b!1031125 m!950723))

(assert (=> b!1031125 m!950697))

(declare-fun m!950725 () Bool)

(assert (=> start!90044 m!950725))

(declare-fun m!950727 () Bool)

(assert (=> b!1031128 m!950727))

(declare-fun m!950729 () Bool)

(assert (=> b!1031127 m!950729))

(declare-fun m!950731 () Bool)

(assert (=> b!1031121 m!950731))

(declare-fun m!950733 () Bool)

(assert (=> b!1031126 m!950733))

(declare-fun m!950735 () Bool)

(assert (=> b!1031126 m!950735))

(declare-fun m!950737 () Bool)

(assert (=> b!1031129 m!950737))

(declare-fun m!950739 () Bool)

(assert (=> mapNonEmpty!38013 m!950739))

(check-sat (not mapNonEmpty!38013) (not start!90044) (not b!1031121) (not b!1031125) (not b!1031128) (not b!1031126) (not b!1031127) tp_is_empty!24373 b_and!33049 (not b_next!20653) (not b_lambda!15975) (not b!1031129))
(check-sat b_and!33049 (not b_next!20653))
