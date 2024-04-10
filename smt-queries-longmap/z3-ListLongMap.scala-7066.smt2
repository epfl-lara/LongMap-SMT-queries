; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89452 () Bool)

(assert start!89452)

(declare-fun b!1025817 () Bool)

(declare-fun b_free!20451 () Bool)

(declare-fun b_next!20451 () Bool)

(assert (=> b!1025817 (= b_free!20451 (not b_next!20451))))

(declare-fun tp!72399 () Bool)

(declare-fun b_and!32697 () Bool)

(assert (=> b!1025817 (= tp!72399 b_and!32697)))

(declare-fun b!1025815 () Bool)

(declare-fun e!578470 () Bool)

(declare-fun tp_is_empty!24171 () Bool)

(assert (=> b!1025815 (= e!578470 tp_is_empty!24171)))

(declare-fun res!686771 () Bool)

(declare-fun e!578467 () Bool)

(assert (=> start!89452 (=> (not res!686771) (not e!578467))))

(declare-datatypes ((V!37101 0))(
  ( (V!37102 (val!12136 Int)) )
))
(declare-datatypes ((ValueCell!11382 0))(
  ( (ValueCellFull!11382 (v!14705 V!37101)) (EmptyCell!11382) )
))
(declare-datatypes ((array!64392 0))(
  ( (array!64393 (arr!31005 (Array (_ BitVec 32) (_ BitVec 64))) (size!31518 (_ BitVec 32))) )
))
(declare-datatypes ((array!64394 0))(
  ( (array!64395 (arr!31006 (Array (_ BitVec 32) ValueCell!11382)) (size!31519 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5358 0))(
  ( (LongMapFixedSize!5359 (defaultEntry!6031 Int) (mask!29709 (_ BitVec 32)) (extraKeys!5763 (_ BitVec 32)) (zeroValue!5867 V!37101) (minValue!5867 V!37101) (_size!2734 (_ BitVec 32)) (_keys!11178 array!64392) (_values!6054 array!64394) (_vacant!2734 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5358)

(declare-fun valid!2037 (LongMapFixedSize!5358) Bool)

(assert (=> start!89452 (= res!686771 (valid!2037 thiss!1427))))

(assert (=> start!89452 e!578467))

(declare-fun e!578464 () Bool)

(assert (=> start!89452 e!578464))

(assert (=> start!89452 true))

(declare-fun b!1025816 () Bool)

(declare-fun e!578463 () Bool)

(declare-fun e!578466 () Bool)

(assert (=> b!1025816 (= e!578463 (not e!578466))))

(declare-fun res!686775 () Bool)

(assert (=> b!1025816 (=> res!686775 e!578466)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025816 (= res!686775 (not (validMask!0 (mask!29709 thiss!1427))))))

(declare-fun lt!451110 () array!64392)

(declare-datatypes ((List!21761 0))(
  ( (Nil!21758) (Cons!21757 (h!22955 (_ BitVec 64)) (t!30823 List!21761)) )
))
(declare-fun arrayNoDuplicates!0 (array!64392 (_ BitVec 32) List!21761) Bool)

(assert (=> b!1025816 (arrayNoDuplicates!0 lt!451110 #b00000000000000000000000000000000 Nil!21758)))

(declare-datatypes ((Unit!33407 0))(
  ( (Unit!33408) )
))
(declare-fun lt!451111 () Unit!33407)

(declare-datatypes ((SeekEntryResult!9630 0))(
  ( (MissingZero!9630 (index!40891 (_ BitVec 32))) (Found!9630 (index!40892 (_ BitVec 32))) (Intermediate!9630 (undefined!10442 Bool) (index!40893 (_ BitVec 32)) (x!91228 (_ BitVec 32))) (Undefined!9630) (MissingVacant!9630 (index!40894 (_ BitVec 32))) )
))
(declare-fun lt!451109 () SeekEntryResult!9630)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21761) Unit!33407)

(assert (=> b!1025816 (= lt!451111 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11178 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40892 lt!451109) #b00000000000000000000000000000000 Nil!21758))))

(declare-fun arrayCountValidKeys!0 (array!64392 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025816 (= (arrayCountValidKeys!0 lt!451110 #b00000000000000000000000000000000 (size!31518 (_keys!11178 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11178 thiss!1427) #b00000000000000000000000000000000 (size!31518 (_keys!11178 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025816 (= lt!451110 (array!64393 (store (arr!31005 (_keys!11178 thiss!1427)) (index!40892 lt!451109) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31518 (_keys!11178 thiss!1427))))))

(declare-fun lt!451112 () Unit!33407)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64392 (_ BitVec 32) (_ BitVec 64)) Unit!33407)

(assert (=> b!1025816 (= lt!451112 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11178 thiss!1427) (index!40892 lt!451109) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!578469 () Bool)

(declare-fun array_inv!24013 (array!64392) Bool)

(declare-fun array_inv!24014 (array!64394) Bool)

(assert (=> b!1025817 (= e!578464 (and tp!72399 tp_is_empty!24171 (array_inv!24013 (_keys!11178 thiss!1427)) (array_inv!24014 (_values!6054 thiss!1427)) e!578469))))

(declare-fun mapIsEmpty!37685 () Bool)

(declare-fun mapRes!37685 () Bool)

(assert (=> mapIsEmpty!37685 mapRes!37685))

(declare-fun b!1025818 () Bool)

(assert (=> b!1025818 (= e!578467 e!578463)))

(declare-fun res!686776 () Bool)

(assert (=> b!1025818 (=> (not res!686776) (not e!578463))))

(get-info :version)

(assert (=> b!1025818 (= res!686776 ((_ is Found!9630) lt!451109))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64392 (_ BitVec 32)) SeekEntryResult!9630)

(assert (=> b!1025818 (= lt!451109 (seekEntry!0 key!909 (_keys!11178 thiss!1427) (mask!29709 thiss!1427)))))

(declare-fun b!1025819 () Bool)

(declare-fun e!578465 () Bool)

(assert (=> b!1025819 (= e!578465 tp_is_empty!24171)))

(declare-fun b!1025820 () Bool)

(declare-fun res!686777 () Bool)

(assert (=> b!1025820 (=> res!686777 e!578466)))

(assert (=> b!1025820 (= res!686777 (not (arrayNoDuplicates!0 (_keys!11178 thiss!1427) #b00000000000000000000000000000000 Nil!21758)))))

(declare-fun b!1025821 () Bool)

(declare-fun res!686772 () Bool)

(assert (=> b!1025821 (=> res!686772 e!578466)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025821 (= res!686772 (not (validKeyInArray!0 (select (arr!31005 (_keys!11178 thiss!1427)) (index!40892 lt!451109)))))))

(declare-fun b!1025822 () Bool)

(assert (=> b!1025822 (= e!578469 (and e!578470 mapRes!37685))))

(declare-fun condMapEmpty!37685 () Bool)

(declare-fun mapDefault!37685 () ValueCell!11382)

(assert (=> b!1025822 (= condMapEmpty!37685 (= (arr!31006 (_values!6054 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11382)) mapDefault!37685)))))

(declare-fun b!1025823 () Bool)

(declare-fun res!686774 () Bool)

(assert (=> b!1025823 (=> (not res!686774) (not e!578467))))

(assert (=> b!1025823 (= res!686774 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025824 () Bool)

(declare-fun res!686773 () Bool)

(assert (=> b!1025824 (=> res!686773 e!578466)))

(assert (=> b!1025824 (= res!686773 (or (not (= (size!31518 (_keys!11178 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29709 thiss!1427)))) (bvslt (index!40892 lt!451109) #b00000000000000000000000000000000) (bvsge (index!40892 lt!451109) (size!31518 (_keys!11178 thiss!1427)))))))

(declare-fun b!1025825 () Bool)

(assert (=> b!1025825 (= e!578466 true)))

(declare-fun lt!451113 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64392 (_ BitVec 32)) Bool)

(assert (=> b!1025825 (= lt!451113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11178 thiss!1427) (mask!29709 thiss!1427)))))

(declare-fun mapNonEmpty!37685 () Bool)

(declare-fun tp!72398 () Bool)

(assert (=> mapNonEmpty!37685 (= mapRes!37685 (and tp!72398 e!578465))))

(declare-fun mapKey!37685 () (_ BitVec 32))

(declare-fun mapValue!37685 () ValueCell!11382)

(declare-fun mapRest!37685 () (Array (_ BitVec 32) ValueCell!11382))

(assert (=> mapNonEmpty!37685 (= (arr!31006 (_values!6054 thiss!1427)) (store mapRest!37685 mapKey!37685 mapValue!37685))))

(assert (= (and start!89452 res!686771) b!1025823))

(assert (= (and b!1025823 res!686774) b!1025818))

(assert (= (and b!1025818 res!686776) b!1025816))

(assert (= (and b!1025816 (not res!686775)) b!1025824))

(assert (= (and b!1025824 (not res!686773)) b!1025821))

(assert (= (and b!1025821 (not res!686772)) b!1025820))

(assert (= (and b!1025820 (not res!686777)) b!1025825))

(assert (= (and b!1025822 condMapEmpty!37685) mapIsEmpty!37685))

(assert (= (and b!1025822 (not condMapEmpty!37685)) mapNonEmpty!37685))

(assert (= (and mapNonEmpty!37685 ((_ is ValueCellFull!11382) mapValue!37685)) b!1025819))

(assert (= (and b!1025822 ((_ is ValueCellFull!11382) mapDefault!37685)) b!1025815))

(assert (= b!1025817 b!1025822))

(assert (= start!89452 b!1025817))

(declare-fun m!943983 () Bool)

(assert (=> b!1025820 m!943983))

(declare-fun m!943985 () Bool)

(assert (=> b!1025825 m!943985))

(declare-fun m!943987 () Bool)

(assert (=> mapNonEmpty!37685 m!943987))

(declare-fun m!943989 () Bool)

(assert (=> b!1025821 m!943989))

(assert (=> b!1025821 m!943989))

(declare-fun m!943991 () Bool)

(assert (=> b!1025821 m!943991))

(declare-fun m!943993 () Bool)

(assert (=> b!1025818 m!943993))

(declare-fun m!943995 () Bool)

(assert (=> b!1025817 m!943995))

(declare-fun m!943997 () Bool)

(assert (=> b!1025817 m!943997))

(declare-fun m!943999 () Bool)

(assert (=> start!89452 m!943999))

(declare-fun m!944001 () Bool)

(assert (=> b!1025816 m!944001))

(declare-fun m!944003 () Bool)

(assert (=> b!1025816 m!944003))

(declare-fun m!944005 () Bool)

(assert (=> b!1025816 m!944005))

(declare-fun m!944007 () Bool)

(assert (=> b!1025816 m!944007))

(declare-fun m!944009 () Bool)

(assert (=> b!1025816 m!944009))

(declare-fun m!944011 () Bool)

(assert (=> b!1025816 m!944011))

(declare-fun m!944013 () Bool)

(assert (=> b!1025816 m!944013))

(check-sat (not mapNonEmpty!37685) (not b!1025816) (not start!89452) (not b!1025820) (not b!1025818) (not b_next!20451) tp_is_empty!24171 b_and!32697 (not b!1025821) (not b!1025817) (not b!1025825))
(check-sat b_and!32697 (not b_next!20451))
