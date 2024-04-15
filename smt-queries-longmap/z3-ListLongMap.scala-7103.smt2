; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90062 () Bool)

(assert start!90062)

(declare-fun b!1031440 () Bool)

(declare-fun b_free!20671 () Bool)

(declare-fun b_next!20671 () Bool)

(assert (=> b!1031440 (= b_free!20671 (not b_next!20671))))

(declare-fun tp!73083 () Bool)

(declare-fun b_and!33083 () Bool)

(assert (=> b!1031440 (= tp!73083 b_and!33083)))

(declare-fun mapIsEmpty!38040 () Bool)

(declare-fun mapRes!38040 () Bool)

(assert (=> mapIsEmpty!38040 mapRes!38040))

(declare-fun b!1031436 () Bool)

(declare-fun e!582577 () Bool)

(declare-fun e!582576 () Bool)

(assert (=> b!1031436 (= e!582577 e!582576)))

(declare-fun res!689672 () Bool)

(assert (=> b!1031436 (=> (not res!689672) (not e!582576))))

(declare-datatypes ((SeekEntryResult!9701 0))(
  ( (MissingZero!9701 (index!41175 (_ BitVec 32))) (Found!9701 (index!41176 (_ BitVec 32))) (Intermediate!9701 (undefined!10513 Bool) (index!41177 (_ BitVec 32)) (x!91862 (_ BitVec 32))) (Undefined!9701) (MissingVacant!9701 (index!41178 (_ BitVec 32))) )
))
(declare-fun lt!455300 () SeekEntryResult!9701)

(get-info :version)

(assert (=> b!1031436 (= res!689672 ((_ is Found!9701) lt!455300))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37395 0))(
  ( (V!37396 (val!12246 Int)) )
))
(declare-datatypes ((ValueCell!11492 0))(
  ( (ValueCellFull!11492 (v!14822 V!37395)) (EmptyCell!11492) )
))
(declare-datatypes ((array!64785 0))(
  ( (array!64786 (arr!31194 (Array (_ BitVec 32) (_ BitVec 64))) (size!31713 (_ BitVec 32))) )
))
(declare-datatypes ((array!64787 0))(
  ( (array!64788 (arr!31195 (Array (_ BitVec 32) ValueCell!11492)) (size!31714 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5578 0))(
  ( (LongMapFixedSize!5579 (defaultEntry!6163 Int) (mask!29958 (_ BitVec 32)) (extraKeys!5895 (_ BitVec 32)) (zeroValue!5999 V!37395) (minValue!5999 V!37395) (_size!2844 (_ BitVec 32)) (_keys!11332 array!64785) (_values!6186 array!64787) (_vacant!2844 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5578)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64785 (_ BitVec 32)) SeekEntryResult!9701)

(assert (=> b!1031436 (= lt!455300 (seekEntry!0 key!909 (_keys!11332 thiss!1427) (mask!29958 thiss!1427)))))

(declare-fun res!689668 () Bool)

(assert (=> start!90062 (=> (not res!689668) (not e!582577))))

(declare-fun valid!2101 (LongMapFixedSize!5578) Bool)

(assert (=> start!90062 (= res!689668 (valid!2101 thiss!1427))))

(assert (=> start!90062 e!582577))

(declare-fun e!582571 () Bool)

(assert (=> start!90062 e!582571))

(assert (=> start!90062 true))

(declare-fun b!1031437 () Bool)

(declare-fun e!582573 () Bool)

(assert (=> b!1031437 (= e!582573 true)))

(declare-fun lt!455295 () Bool)

(declare-datatypes ((Unit!33637 0))(
  ( (Unit!33638) )
))
(declare-datatypes ((tuple2!15760 0))(
  ( (tuple2!15761 (_1!7891 Unit!33637) (_2!7891 LongMapFixedSize!5578)) )
))
(declare-fun lt!455297 () tuple2!15760)

(declare-datatypes ((List!21909 0))(
  ( (Nil!21906) (Cons!21905 (h!23107 (_ BitVec 64)) (t!31066 List!21909)) )
))
(declare-fun arrayNoDuplicates!0 (array!64785 (_ BitVec 32) List!21909) Bool)

(assert (=> b!1031437 (= lt!455295 (arrayNoDuplicates!0 (_keys!11332 (_2!7891 lt!455297)) #b00000000000000000000000000000000 Nil!21906))))

(declare-fun b!1031438 () Bool)

(declare-fun e!582575 () Bool)

(declare-fun tp_is_empty!24391 () Bool)

(assert (=> b!1031438 (= e!582575 tp_is_empty!24391)))

(declare-fun b!1031439 () Bool)

(assert (=> b!1031439 (= e!582576 (not e!582573))))

(declare-fun res!689674 () Bool)

(assert (=> b!1031439 (=> res!689674 e!582573)))

(declare-datatypes ((tuple2!15762 0))(
  ( (tuple2!15763 (_1!7892 (_ BitVec 64)) (_2!7892 V!37395)) )
))
(declare-datatypes ((List!21910 0))(
  ( (Nil!21907) (Cons!21906 (h!23108 tuple2!15762) (t!31067 List!21910)) )
))
(declare-datatypes ((ListLongMap!13807 0))(
  ( (ListLongMap!13808 (toList!6919 List!21910)) )
))
(declare-fun contains!5975 (ListLongMap!13807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3886 (array!64785 array!64787 (_ BitVec 32) (_ BitVec 32) V!37395 V!37395 (_ BitVec 32) Int) ListLongMap!13807)

(assert (=> b!1031439 (= res!689674 (not (contains!5975 (getCurrentListMap!3886 (_keys!11332 (_2!7891 lt!455297)) (_values!6186 (_2!7891 lt!455297)) (mask!29958 (_2!7891 lt!455297)) (extraKeys!5895 (_2!7891 lt!455297)) (zeroValue!5999 (_2!7891 lt!455297)) (minValue!5999 (_2!7891 lt!455297)) #b00000000000000000000000000000000 (defaultEntry!6163 (_2!7891 lt!455297))) key!909)))))

(declare-fun lt!455293 () array!64785)

(declare-fun lt!455296 () array!64787)

(declare-fun Unit!33639 () Unit!33637)

(declare-fun Unit!33640 () Unit!33637)

(assert (=> b!1031439 (= lt!455297 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2844 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15761 Unit!33639 (LongMapFixedSize!5579 (defaultEntry!6163 thiss!1427) (mask!29958 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) (bvsub (_size!2844 thiss!1427) #b00000000000000000000000000000001) lt!455293 lt!455296 (bvadd #b00000000000000000000000000000001 (_vacant!2844 thiss!1427)))) (tuple2!15761 Unit!33640 (LongMapFixedSize!5579 (defaultEntry!6163 thiss!1427) (mask!29958 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) (bvsub (_size!2844 thiss!1427) #b00000000000000000000000000000001) lt!455293 lt!455296 (_vacant!2844 thiss!1427)))))))

(declare-fun -!511 (ListLongMap!13807 (_ BitVec 64)) ListLongMap!13807)

(assert (=> b!1031439 (= (-!511 (getCurrentListMap!3886 (_keys!11332 thiss!1427) (_values!6186 thiss!1427) (mask!29958 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6163 thiss!1427)) key!909) (getCurrentListMap!3886 lt!455293 lt!455296 (mask!29958 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6163 thiss!1427)))))

(declare-fun dynLambda!1973 (Int (_ BitVec 64)) V!37395)

(assert (=> b!1031439 (= lt!455296 (array!64788 (store (arr!31195 (_values!6186 thiss!1427)) (index!41176 lt!455300) (ValueCellFull!11492 (dynLambda!1973 (defaultEntry!6163 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31714 (_values!6186 thiss!1427))))))

(declare-fun lt!455299 () Unit!33637)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!36 (array!64785 array!64787 (_ BitVec 32) (_ BitVec 32) V!37395 V!37395 (_ BitVec 32) (_ BitVec 64) Int) Unit!33637)

(assert (=> b!1031439 (= lt!455299 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!36 (_keys!11332 thiss!1427) (_values!6186 thiss!1427) (mask!29958 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) (index!41176 lt!455300) key!909 (defaultEntry!6163 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031439 (not (arrayContainsKey!0 lt!455293 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455298 () Unit!33637)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64785 (_ BitVec 32) (_ BitVec 64)) Unit!33637)

(assert (=> b!1031439 (= lt!455298 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11332 thiss!1427) (index!41176 lt!455300) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64785 (_ BitVec 32)) Bool)

(assert (=> b!1031439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455293 (mask!29958 thiss!1427))))

(declare-fun lt!455301 () Unit!33637)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64785 (_ BitVec 32) (_ BitVec 32)) Unit!33637)

(assert (=> b!1031439 (= lt!455301 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11332 thiss!1427) (index!41176 lt!455300) (mask!29958 thiss!1427)))))

(assert (=> b!1031439 (arrayNoDuplicates!0 lt!455293 #b00000000000000000000000000000000 Nil!21906)))

(declare-fun lt!455292 () Unit!33637)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64785 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21909) Unit!33637)

(assert (=> b!1031439 (= lt!455292 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11332 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41176 lt!455300) #b00000000000000000000000000000000 Nil!21906))))

(declare-fun arrayCountValidKeys!0 (array!64785 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031439 (= (arrayCountValidKeys!0 lt!455293 #b00000000000000000000000000000000 (size!31713 (_keys!11332 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11332 thiss!1427) #b00000000000000000000000000000000 (size!31713 (_keys!11332 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031439 (= lt!455293 (array!64786 (store (arr!31194 (_keys!11332 thiss!1427)) (index!41176 lt!455300) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31713 (_keys!11332 thiss!1427))))))

(declare-fun lt!455294 () Unit!33637)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64785 (_ BitVec 32) (_ BitVec 64)) Unit!33637)

(assert (=> b!1031439 (= lt!455294 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11332 thiss!1427) (index!41176 lt!455300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38040 () Bool)

(declare-fun tp!73084 () Bool)

(assert (=> mapNonEmpty!38040 (= mapRes!38040 (and tp!73084 e!582575))))

(declare-fun mapValue!38040 () ValueCell!11492)

(declare-fun mapKey!38040 () (_ BitVec 32))

(declare-fun mapRest!38040 () (Array (_ BitVec 32) ValueCell!11492))

(assert (=> mapNonEmpty!38040 (= (arr!31195 (_values!6186 thiss!1427)) (store mapRest!38040 mapKey!38040 mapValue!38040))))

(declare-fun e!582574 () Bool)

(declare-fun array_inv!24147 (array!64785) Bool)

(declare-fun array_inv!24148 (array!64787) Bool)

(assert (=> b!1031440 (= e!582571 (and tp!73083 tp_is_empty!24391 (array_inv!24147 (_keys!11332 thiss!1427)) (array_inv!24148 (_values!6186 thiss!1427)) e!582574))))

(declare-fun b!1031441 () Bool)

(declare-fun e!582572 () Bool)

(assert (=> b!1031441 (= e!582572 tp_is_empty!24391)))

(declare-fun b!1031442 () Bool)

(declare-fun res!689673 () Bool)

(assert (=> b!1031442 (=> res!689673 e!582573)))

(assert (=> b!1031442 (= res!689673 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11332 (_2!7891 lt!455297)) (mask!29958 (_2!7891 lt!455297)))))))

(declare-fun b!1031443 () Bool)

(declare-fun res!689670 () Bool)

(assert (=> b!1031443 (=> res!689670 e!582573)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031443 (= res!689670 (not (validMask!0 (mask!29958 (_2!7891 lt!455297)))))))

(declare-fun b!1031444 () Bool)

(assert (=> b!1031444 (= e!582574 (and e!582572 mapRes!38040))))

(declare-fun condMapEmpty!38040 () Bool)

(declare-fun mapDefault!38040 () ValueCell!11492)

(assert (=> b!1031444 (= condMapEmpty!38040 (= (arr!31195 (_values!6186 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11492)) mapDefault!38040)))))

(declare-fun b!1031445 () Bool)

(declare-fun res!689669 () Bool)

(assert (=> b!1031445 (=> (not res!689669) (not e!582577))))

(assert (=> b!1031445 (= res!689669 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031446 () Bool)

(declare-fun res!689671 () Bool)

(assert (=> b!1031446 (=> res!689671 e!582573)))

(assert (=> b!1031446 (= res!689671 (or (not (= (size!31714 (_values!6186 (_2!7891 lt!455297))) (bvadd #b00000000000000000000000000000001 (mask!29958 (_2!7891 lt!455297))))) (not (= (size!31713 (_keys!11332 (_2!7891 lt!455297))) (size!31714 (_values!6186 (_2!7891 lt!455297))))) (bvslt (mask!29958 (_2!7891 lt!455297)) #b00000000000000000000000000000000) (bvslt (extraKeys!5895 (_2!7891 lt!455297)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5895 (_2!7891 lt!455297)) #b00000000000000000000000000000011)))))

(assert (= (and start!90062 res!689668) b!1031445))

(assert (= (and b!1031445 res!689669) b!1031436))

(assert (= (and b!1031436 res!689672) b!1031439))

(assert (= (and b!1031439 (not res!689674)) b!1031443))

(assert (= (and b!1031443 (not res!689670)) b!1031446))

(assert (= (and b!1031446 (not res!689671)) b!1031442))

(assert (= (and b!1031442 (not res!689673)) b!1031437))

(assert (= (and b!1031444 condMapEmpty!38040) mapIsEmpty!38040))

(assert (= (and b!1031444 (not condMapEmpty!38040)) mapNonEmpty!38040))

(assert (= (and mapNonEmpty!38040 ((_ is ValueCellFull!11492) mapValue!38040)) b!1031438))

(assert (= (and b!1031444 ((_ is ValueCellFull!11492) mapDefault!38040)) b!1031441))

(assert (= b!1031440 b!1031444))

(assert (= start!90062 b!1031440))

(declare-fun b_lambda!15993 () Bool)

(assert (=> (not b_lambda!15993) (not b!1031439)))

(declare-fun t!31065 () Bool)

(declare-fun tb!6981 () Bool)

(assert (=> (and b!1031440 (= (defaultEntry!6163 thiss!1427) (defaultEntry!6163 thiss!1427)) t!31065) tb!6981))

(declare-fun result!14299 () Bool)

(assert (=> tb!6981 (= result!14299 tp_is_empty!24391)))

(assert (=> b!1031439 t!31065))

(declare-fun b_and!33085 () Bool)

(assert (= b_and!33083 (and (=> t!31065 result!14299) b_and!33085)))

(declare-fun m!951157 () Bool)

(assert (=> b!1031442 m!951157))

(declare-fun m!951159 () Bool)

(assert (=> b!1031439 m!951159))

(declare-fun m!951161 () Bool)

(assert (=> b!1031439 m!951161))

(declare-fun m!951163 () Bool)

(assert (=> b!1031439 m!951163))

(declare-fun m!951165 () Bool)

(assert (=> b!1031439 m!951165))

(declare-fun m!951167 () Bool)

(assert (=> b!1031439 m!951167))

(declare-fun m!951169 () Bool)

(assert (=> b!1031439 m!951169))

(declare-fun m!951171 () Bool)

(assert (=> b!1031439 m!951171))

(declare-fun m!951173 () Bool)

(assert (=> b!1031439 m!951173))

(declare-fun m!951175 () Bool)

(assert (=> b!1031439 m!951175))

(declare-fun m!951177 () Bool)

(assert (=> b!1031439 m!951177))

(declare-fun m!951179 () Bool)

(assert (=> b!1031439 m!951179))

(declare-fun m!951181 () Bool)

(assert (=> b!1031439 m!951181))

(assert (=> b!1031439 m!951179))

(declare-fun m!951183 () Bool)

(assert (=> b!1031439 m!951183))

(declare-fun m!951185 () Bool)

(assert (=> b!1031439 m!951185))

(declare-fun m!951187 () Bool)

(assert (=> b!1031439 m!951187))

(declare-fun m!951189 () Bool)

(assert (=> b!1031439 m!951189))

(declare-fun m!951191 () Bool)

(assert (=> b!1031439 m!951191))

(assert (=> b!1031439 m!951161))

(declare-fun m!951193 () Bool)

(assert (=> b!1031439 m!951193))

(declare-fun m!951195 () Bool)

(assert (=> b!1031437 m!951195))

(declare-fun m!951197 () Bool)

(assert (=> b!1031436 m!951197))

(declare-fun m!951199 () Bool)

(assert (=> b!1031443 m!951199))

(declare-fun m!951201 () Bool)

(assert (=> mapNonEmpty!38040 m!951201))

(declare-fun m!951203 () Bool)

(assert (=> b!1031440 m!951203))

(declare-fun m!951205 () Bool)

(assert (=> b!1031440 m!951205))

(declare-fun m!951207 () Bool)

(assert (=> start!90062 m!951207))

(check-sat (not start!90062) b_and!33085 (not b!1031439) (not b!1031442) (not b_next!20671) (not b!1031436) (not b!1031443) (not b!1031440) (not b!1031437) (not mapNonEmpty!38040) tp_is_empty!24391 (not b_lambda!15993))
(check-sat b_and!33085 (not b_next!20671))
