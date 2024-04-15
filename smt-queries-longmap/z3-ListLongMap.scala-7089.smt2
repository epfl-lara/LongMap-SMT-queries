; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89766 () Bool)

(assert start!89766)

(declare-fun b!1028712 () Bool)

(declare-fun b_free!20587 () Bool)

(declare-fun b_next!20587 () Bool)

(assert (=> b!1028712 (= b_free!20587 (not b_next!20587))))

(declare-fun tp!72817 () Bool)

(declare-fun b_and!32867 () Bool)

(assert (=> b!1028712 (= tp!72817 b_and!32867)))

(declare-fun b!1028709 () Bool)

(declare-fun e!580721 () Bool)

(declare-datatypes ((V!37283 0))(
  ( (V!37284 (val!12204 Int)) )
))
(declare-datatypes ((ValueCell!11450 0))(
  ( (ValueCellFull!11450 (v!14776 V!37283)) (EmptyCell!11450) )
))
(declare-datatypes ((Unit!33485 0))(
  ( (Unit!33486) )
))
(declare-datatypes ((array!64609 0))(
  ( (array!64610 (arr!31110 (Array (_ BitVec 32) (_ BitVec 64))) (size!31627 (_ BitVec 32))) )
))
(declare-datatypes ((array!64611 0))(
  ( (array!64612 (arr!31111 (Array (_ BitVec 32) ValueCell!11450)) (size!31628 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5494 0))(
  ( (LongMapFixedSize!5495 (defaultEntry!6109 Int) (mask!29850 (_ BitVec 32)) (extraKeys!5841 (_ BitVec 32)) (zeroValue!5945 V!37283) (minValue!5945 V!37283) (_size!2802 (_ BitVec 32)) (_keys!11264 array!64609) (_values!6132 array!64611) (_vacant!2802 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15636 0))(
  ( (tuple2!15637 (_1!7829 Unit!33485) (_2!7829 LongMapFixedSize!5494)) )
))
(declare-fun lt!453141 () tuple2!15636)

(assert (=> b!1028709 (= e!580721 (or (not (= (size!31628 (_values!6132 (_2!7829 lt!453141))) (bvadd #b00000000000000000000000000000001 (mask!29850 (_2!7829 lt!453141))))) (not (= (size!31627 (_keys!11264 (_2!7829 lt!453141))) (size!31628 (_values!6132 (_2!7829 lt!453141))))) (bvsge (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000000000000000)))))

(declare-fun b!1028710 () Bool)

(declare-fun e!580720 () Bool)

(declare-fun e!580718 () Bool)

(assert (=> b!1028710 (= e!580720 e!580718)))

(declare-fun res!688278 () Bool)

(assert (=> b!1028710 (=> (not res!688278) (not e!580718))))

(declare-datatypes ((SeekEntryResult!9670 0))(
  ( (MissingZero!9670 (index!41051 (_ BitVec 32))) (Found!9670 (index!41052 (_ BitVec 32))) (Intermediate!9670 (undefined!10482 Bool) (index!41053 (_ BitVec 32)) (x!91539 (_ BitVec 32))) (Undefined!9670) (MissingVacant!9670 (index!41054 (_ BitVec 32))) )
))
(declare-fun lt!453144 () SeekEntryResult!9670)

(get-info :version)

(assert (=> b!1028710 (= res!688278 ((_ is Found!9670) lt!453144))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun thiss!1427 () LongMapFixedSize!5494)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64609 (_ BitVec 32)) SeekEntryResult!9670)

(assert (=> b!1028710 (= lt!453144 (seekEntry!0 key!909 (_keys!11264 thiss!1427) (mask!29850 thiss!1427)))))

(declare-fun b!1028711 () Bool)

(declare-fun e!580717 () Bool)

(declare-fun e!580716 () Bool)

(declare-fun mapRes!37900 () Bool)

(assert (=> b!1028711 (= e!580717 (and e!580716 mapRes!37900))))

(declare-fun condMapEmpty!37900 () Bool)

(declare-fun mapDefault!37900 () ValueCell!11450)

(assert (=> b!1028711 (= condMapEmpty!37900 (= (arr!31111 (_values!6132 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11450)) mapDefault!37900)))))

(declare-fun e!580719 () Bool)

(declare-fun tp_is_empty!24307 () Bool)

(declare-fun array_inv!24087 (array!64609) Bool)

(declare-fun array_inv!24088 (array!64611) Bool)

(assert (=> b!1028712 (= e!580719 (and tp!72817 tp_is_empty!24307 (array_inv!24087 (_keys!11264 thiss!1427)) (array_inv!24088 (_values!6132 thiss!1427)) e!580717))))

(declare-fun b!1028713 () Bool)

(assert (=> b!1028713 (= e!580716 tp_is_empty!24307)))

(declare-fun b!1028714 () Bool)

(declare-fun res!688276 () Bool)

(assert (=> b!1028714 (=> (not res!688276) (not e!580720))))

(assert (=> b!1028714 (= res!688276 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37900 () Bool)

(declare-fun tp!72818 () Bool)

(declare-fun e!580715 () Bool)

(assert (=> mapNonEmpty!37900 (= mapRes!37900 (and tp!72818 e!580715))))

(declare-fun mapValue!37900 () ValueCell!11450)

(declare-fun mapKey!37900 () (_ BitVec 32))

(declare-fun mapRest!37900 () (Array (_ BitVec 32) ValueCell!11450))

(assert (=> mapNonEmpty!37900 (= (arr!31111 (_values!6132 thiss!1427)) (store mapRest!37900 mapKey!37900 mapValue!37900))))

(declare-fun b!1028715 () Bool)

(assert (=> b!1028715 (= e!580715 tp_is_empty!24307)))

(declare-fun b!1028716 () Bool)

(assert (=> b!1028716 (= e!580718 (not e!580721))))

(declare-fun res!688275 () Bool)

(assert (=> b!1028716 (=> res!688275 e!580721)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028716 (= res!688275 (not (validMask!0 (mask!29850 (_2!7829 lt!453141)))))))

(declare-fun lt!453138 () array!64611)

(declare-fun lt!453142 () array!64609)

(declare-fun Unit!33487 () Unit!33485)

(declare-fun Unit!33488 () Unit!33485)

(assert (=> b!1028716 (= lt!453141 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2802 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15637 Unit!33487 (LongMapFixedSize!5495 (defaultEntry!6109 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (bvsub (_size!2802 thiss!1427) #b00000000000000000000000000000001) lt!453142 lt!453138 (bvadd #b00000000000000000000000000000001 (_vacant!2802 thiss!1427)))) (tuple2!15637 Unit!33488 (LongMapFixedSize!5495 (defaultEntry!6109 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (bvsub (_size!2802 thiss!1427) #b00000000000000000000000000000001) lt!453142 lt!453138 (_vacant!2802 thiss!1427)))))))

(declare-datatypes ((tuple2!15638 0))(
  ( (tuple2!15639 (_1!7830 (_ BitVec 64)) (_2!7830 V!37283)) )
))
(declare-datatypes ((List!21852 0))(
  ( (Nil!21849) (Cons!21848 (h!23048 tuple2!15638) (t!30925 List!21852)) )
))
(declare-datatypes ((ListLongMap!13753 0))(
  ( (ListLongMap!13754 (toList!6892 List!21852)) )
))
(declare-fun -!484 (ListLongMap!13753 (_ BitVec 64)) ListLongMap!13753)

(declare-fun getCurrentListMap!3859 (array!64609 array!64611 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) Int) ListLongMap!13753)

(assert (=> b!1028716 (= (-!484 (getCurrentListMap!3859 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) key!909) (getCurrentListMap!3859 lt!453142 lt!453138 (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun dynLambda!1946 (Int (_ BitVec 64)) V!37283)

(assert (=> b!1028716 (= lt!453138 (array!64612 (store (arr!31111 (_values!6132 thiss!1427)) (index!41052 lt!453144) (ValueCellFull!11450 (dynLambda!1946 (defaultEntry!6109 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31628 (_values!6132 thiss!1427))))))

(declare-fun lt!453140 () Unit!33485)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!9 (array!64609 array!64611 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) (_ BitVec 64) Int) Unit!33485)

(assert (=> b!1028716 (= lt!453140 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!9 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (index!41052 lt!453144) key!909 (defaultEntry!6109 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028716 (not (arrayContainsKey!0 lt!453142 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453143 () Unit!33485)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64609 (_ BitVec 32) (_ BitVec 64)) Unit!33485)

(assert (=> b!1028716 (= lt!453143 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11264 thiss!1427) (index!41052 lt!453144) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64609 (_ BitVec 32)) Bool)

(assert (=> b!1028716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453142 (mask!29850 thiss!1427))))

(declare-fun lt!453139 () Unit!33485)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64609 (_ BitVec 32) (_ BitVec 32)) Unit!33485)

(assert (=> b!1028716 (= lt!453139 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11264 thiss!1427) (index!41052 lt!453144) (mask!29850 thiss!1427)))))

(declare-datatypes ((List!21853 0))(
  ( (Nil!21850) (Cons!21849 (h!23049 (_ BitVec 64)) (t!30926 List!21853)) )
))
(declare-fun arrayNoDuplicates!0 (array!64609 (_ BitVec 32) List!21853) Bool)

(assert (=> b!1028716 (arrayNoDuplicates!0 lt!453142 #b00000000000000000000000000000000 Nil!21850)))

(declare-fun lt!453137 () Unit!33485)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64609 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21853) Unit!33485)

(assert (=> b!1028716 (= lt!453137 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11264 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41052 lt!453144) #b00000000000000000000000000000000 Nil!21850))))

(declare-fun arrayCountValidKeys!0 (array!64609 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028716 (= (arrayCountValidKeys!0 lt!453142 #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11264 thiss!1427) #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028716 (= lt!453142 (array!64610 (store (arr!31110 (_keys!11264 thiss!1427)) (index!41052 lt!453144) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31627 (_keys!11264 thiss!1427))))))

(declare-fun lt!453145 () Unit!33485)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64609 (_ BitVec 32) (_ BitVec 64)) Unit!33485)

(assert (=> b!1028716 (= lt!453145 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11264 thiss!1427) (index!41052 lt!453144) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37900 () Bool)

(assert (=> mapIsEmpty!37900 mapRes!37900))

(declare-fun res!688277 () Bool)

(assert (=> start!89766 (=> (not res!688277) (not e!580720))))

(declare-fun valid!2073 (LongMapFixedSize!5494) Bool)

(assert (=> start!89766 (= res!688277 (valid!2073 thiss!1427))))

(assert (=> start!89766 e!580720))

(assert (=> start!89766 e!580719))

(assert (=> start!89766 true))

(assert (= (and start!89766 res!688277) b!1028714))

(assert (= (and b!1028714 res!688276) b!1028710))

(assert (= (and b!1028710 res!688278) b!1028716))

(assert (= (and b!1028716 (not res!688275)) b!1028709))

(assert (= (and b!1028711 condMapEmpty!37900) mapIsEmpty!37900))

(assert (= (and b!1028711 (not condMapEmpty!37900)) mapNonEmpty!37900))

(assert (= (and mapNonEmpty!37900 ((_ is ValueCellFull!11450) mapValue!37900)) b!1028715))

(assert (= (and b!1028711 ((_ is ValueCellFull!11450) mapDefault!37900)) b!1028713))

(assert (= b!1028712 b!1028711))

(assert (= start!89766 b!1028712))

(declare-fun b_lambda!15805 () Bool)

(assert (=> (not b_lambda!15805) (not b!1028716)))

(declare-fun t!30924 () Bool)

(declare-fun tb!6897 () Bool)

(assert (=> (and b!1028712 (= (defaultEntry!6109 thiss!1427) (defaultEntry!6109 thiss!1427)) t!30924) tb!6897))

(declare-fun result!14123 () Bool)

(assert (=> tb!6897 (= result!14123 tp_is_empty!24307)))

(assert (=> b!1028716 t!30924))

(declare-fun b_and!32869 () Bool)

(assert (= b_and!32867 (and (=> t!30924 result!14123) b_and!32869)))

(declare-fun m!947311 () Bool)

(assert (=> b!1028710 m!947311))

(declare-fun m!947313 () Bool)

(assert (=> b!1028716 m!947313))

(declare-fun m!947315 () Bool)

(assert (=> b!1028716 m!947315))

(declare-fun m!947317 () Bool)

(assert (=> b!1028716 m!947317))

(declare-fun m!947319 () Bool)

(assert (=> b!1028716 m!947319))

(declare-fun m!947321 () Bool)

(assert (=> b!1028716 m!947321))

(declare-fun m!947323 () Bool)

(assert (=> b!1028716 m!947323))

(declare-fun m!947325 () Bool)

(assert (=> b!1028716 m!947325))

(declare-fun m!947327 () Bool)

(assert (=> b!1028716 m!947327))

(declare-fun m!947329 () Bool)

(assert (=> b!1028716 m!947329))

(declare-fun m!947331 () Bool)

(assert (=> b!1028716 m!947331))

(declare-fun m!947333 () Bool)

(assert (=> b!1028716 m!947333))

(declare-fun m!947335 () Bool)

(assert (=> b!1028716 m!947335))

(declare-fun m!947337 () Bool)

(assert (=> b!1028716 m!947337))

(declare-fun m!947339 () Bool)

(assert (=> b!1028716 m!947339))

(declare-fun m!947341 () Bool)

(assert (=> b!1028716 m!947341))

(declare-fun m!947343 () Bool)

(assert (=> b!1028716 m!947343))

(declare-fun m!947345 () Bool)

(assert (=> b!1028716 m!947345))

(assert (=> b!1028716 m!947327))

(declare-fun m!947347 () Bool)

(assert (=> start!89766 m!947347))

(declare-fun m!947349 () Bool)

(assert (=> b!1028712 m!947349))

(declare-fun m!947351 () Bool)

(assert (=> b!1028712 m!947351))

(declare-fun m!947353 () Bool)

(assert (=> mapNonEmpty!37900 m!947353))

(check-sat (not b_lambda!15805) b_and!32869 (not b!1028712) (not b!1028716) (not mapNonEmpty!37900) (not b!1028710) (not start!89766) (not b_next!20587) tp_is_empty!24307)
(check-sat b_and!32869 (not b_next!20587))
(get-model)

(declare-fun b_lambda!15811 () Bool)

(assert (= b_lambda!15805 (or (and b!1028712 b_free!20587) b_lambda!15811)))

(check-sat (not b_lambda!15811) b_and!32869 (not b!1028712) (not b!1028716) (not mapNonEmpty!37900) (not b!1028710) (not start!89766) (not b_next!20587) tp_is_empty!24307)
(check-sat b_and!32869 (not b_next!20587))
(get-model)

(declare-fun d!122999 () Bool)

(declare-fun e!580772 () Bool)

(assert (=> d!122999 e!580772))

(declare-fun res!688305 () Bool)

(assert (=> d!122999 (=> (not res!688305) (not e!580772))))

(assert (=> d!122999 (= res!688305 (and (bvsge (index!41052 lt!453144) #b00000000000000000000000000000000) (bvslt (index!41052 lt!453144) (size!31627 (_keys!11264 thiss!1427)))))))

(declare-fun lt!453202 () Unit!33485)

(declare-fun choose!53 (array!64609 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21853) Unit!33485)

(assert (=> d!122999 (= lt!453202 (choose!53 (_keys!11264 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41052 lt!453144) #b00000000000000000000000000000000 Nil!21850))))

(assert (=> d!122999 (bvslt (size!31627 (_keys!11264 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!122999 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11264 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41052 lt!453144) #b00000000000000000000000000000000 Nil!21850) lt!453202)))

(declare-fun b!1028773 () Bool)

(assert (=> b!1028773 (= e!580772 (arrayNoDuplicates!0 (array!64610 (store (arr!31110 (_keys!11264 thiss!1427)) (index!41052 lt!453144) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31627 (_keys!11264 thiss!1427))) #b00000000000000000000000000000000 Nil!21850))))

(assert (= (and d!122999 res!688305) b!1028773))

(declare-fun m!947443 () Bool)

(assert (=> d!122999 m!947443))

(assert (=> b!1028773 m!947317))

(declare-fun m!947445 () Bool)

(assert (=> b!1028773 m!947445))

(assert (=> b!1028716 d!122999))

(declare-fun d!123001 () Bool)

(declare-fun e!580775 () Bool)

(assert (=> d!123001 e!580775))

(declare-fun res!688308 () Bool)

(assert (=> d!123001 (=> (not res!688308) (not e!580775))))

(assert (=> d!123001 (= res!688308 (and (bvsge (index!41052 lt!453144) #b00000000000000000000000000000000) (bvslt (index!41052 lt!453144) (size!31627 (_keys!11264 thiss!1427)))))))

(declare-fun lt!453205 () Unit!33485)

(declare-fun choose!25 (array!64609 (_ BitVec 32) (_ BitVec 32)) Unit!33485)

(assert (=> d!123001 (= lt!453205 (choose!25 (_keys!11264 thiss!1427) (index!41052 lt!453144) (mask!29850 thiss!1427)))))

(assert (=> d!123001 (validMask!0 (mask!29850 thiss!1427))))

(assert (=> d!123001 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11264 thiss!1427) (index!41052 lt!453144) (mask!29850 thiss!1427)) lt!453205)))

(declare-fun b!1028776 () Bool)

(assert (=> b!1028776 (= e!580775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64610 (store (arr!31110 (_keys!11264 thiss!1427)) (index!41052 lt!453144) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31627 (_keys!11264 thiss!1427))) (mask!29850 thiss!1427)))))

(assert (= (and d!123001 res!688308) b!1028776))

(declare-fun m!947447 () Bool)

(assert (=> d!123001 m!947447))

(declare-fun m!947449 () Bool)

(assert (=> d!123001 m!947449))

(assert (=> b!1028776 m!947317))

(declare-fun m!947451 () Bool)

(assert (=> b!1028776 m!947451))

(assert (=> b!1028716 d!123001))

(declare-fun b!1028819 () Bool)

(declare-fun e!580809 () Bool)

(declare-fun e!580810 () Bool)

(assert (=> b!1028819 (= e!580809 e!580810)))

(declare-fun res!688327 () Bool)

(assert (=> b!1028819 (=> (not res!688327) (not e!580810))))

(declare-fun lt!453271 () ListLongMap!13753)

(declare-fun contains!5949 (ListLongMap!13753 (_ BitVec 64)) Bool)

(assert (=> b!1028819 (= res!688327 (contains!5949 lt!453271 (select (arr!31110 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))))))

(declare-fun bm!43385 () Bool)

(declare-fun call!43389 () ListLongMap!13753)

(declare-fun call!43392 () ListLongMap!13753)

(assert (=> bm!43385 (= call!43389 call!43392)))

(declare-fun bm!43386 () Bool)

(declare-fun call!43391 () ListLongMap!13753)

(declare-fun call!43394 () ListLongMap!13753)

(assert (=> bm!43386 (= call!43391 call!43394)))

(declare-fun b!1028820 () Bool)

(declare-fun e!580808 () Bool)

(declare-fun call!43388 () Bool)

(assert (=> b!1028820 (= e!580808 (not call!43388))))

(declare-fun b!1028821 () Bool)

(declare-fun e!580812 () ListLongMap!13753)

(assert (=> b!1028821 (= e!580812 call!43391)))

(declare-fun c!103851 () Bool)

(declare-fun c!103852 () Bool)

(declare-fun bm!43387 () Bool)

(declare-fun call!43393 () ListLongMap!13753)

(declare-fun +!3126 (ListLongMap!13753 tuple2!15638) ListLongMap!13753)

(assert (=> bm!43387 (= call!43394 (+!3126 (ite c!103852 call!43393 (ite c!103851 call!43392 call!43389)) (ite (or c!103852 c!103851) (tuple2!15639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5945 thiss!1427)) (tuple2!15639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5945 thiss!1427)))))))

(declare-fun d!123003 () Bool)

(declare-fun e!580807 () Bool)

(assert (=> d!123003 e!580807))

(declare-fun res!688328 () Bool)

(assert (=> d!123003 (=> (not res!688328) (not e!580807))))

(assert (=> d!123003 (= res!688328 (or (bvsge #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))))))))

(declare-fun lt!453265 () ListLongMap!13753)

(assert (=> d!123003 (= lt!453271 lt!453265)))

(declare-fun lt!453255 () Unit!33485)

(declare-fun e!580814 () Unit!33485)

(assert (=> d!123003 (= lt!453255 e!580814)))

(declare-fun c!103849 () Bool)

(declare-fun e!580803 () Bool)

(assert (=> d!123003 (= c!103849 e!580803)))

(declare-fun res!688331 () Bool)

(assert (=> d!123003 (=> (not res!688331) (not e!580803))))

(assert (=> d!123003 (= res!688331 (bvslt #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))))))

(declare-fun e!580811 () ListLongMap!13753)

(assert (=> d!123003 (= lt!453265 e!580811)))

(assert (=> d!123003 (= c!103852 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123003 (validMask!0 (mask!29850 thiss!1427))))

(assert (=> d!123003 (= (getCurrentListMap!3859 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) lt!453271)))

(declare-fun b!1028822 () Bool)

(assert (=> b!1028822 (= e!580811 (+!3126 call!43394 (tuple2!15639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5945 thiss!1427))))))

(declare-fun bm!43388 () Bool)

(assert (=> bm!43388 (= call!43388 (contains!5949 lt!453271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028823 () Bool)

(declare-fun e!580805 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1028823 (= e!580805 (validKeyInArray!0 (select (arr!31110 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028824 () Bool)

(declare-fun e!580806 () ListLongMap!13753)

(assert (=> b!1028824 (= e!580811 e!580806)))

(assert (=> b!1028824 (= c!103851 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43389 () Bool)

(assert (=> bm!43389 (= call!43392 call!43393)))

(declare-fun b!1028825 () Bool)

(assert (=> b!1028825 (= e!580806 call!43391)))

(declare-fun bm!43390 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3561 (array!64609 array!64611 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) Int) ListLongMap!13753)

(assert (=> bm!43390 (= call!43393 (getCurrentListMapNoExtraKeys!3561 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun b!1028826 () Bool)

(assert (=> b!1028826 (= e!580803 (validKeyInArray!0 (select (arr!31110 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028827 () Bool)

(declare-fun e!580804 () Bool)

(declare-fun call!43390 () Bool)

(assert (=> b!1028827 (= e!580804 (not call!43390))))

(declare-fun b!1028828 () Bool)

(declare-fun res!688335 () Bool)

(assert (=> b!1028828 (=> (not res!688335) (not e!580807))))

(assert (=> b!1028828 (= res!688335 e!580809)))

(declare-fun res!688332 () Bool)

(assert (=> b!1028828 (=> res!688332 e!580809)))

(assert (=> b!1028828 (= res!688332 (not e!580805))))

(declare-fun res!688329 () Bool)

(assert (=> b!1028828 (=> (not res!688329) (not e!580805))))

(assert (=> b!1028828 (= res!688329 (bvslt #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))))))

(declare-fun bm!43391 () Bool)

(assert (=> bm!43391 (= call!43390 (contains!5949 lt!453271 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028829 () Bool)

(declare-fun e!580802 () Bool)

(assert (=> b!1028829 (= e!580808 e!580802)))

(declare-fun res!688330 () Bool)

(assert (=> b!1028829 (= res!688330 call!43388)))

(assert (=> b!1028829 (=> (not res!688330) (not e!580802))))

(declare-fun b!1028830 () Bool)

(declare-fun e!580813 () Bool)

(declare-fun apply!895 (ListLongMap!13753 (_ BitVec 64)) V!37283)

(assert (=> b!1028830 (= e!580813 (= (apply!895 lt!453271 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5945 thiss!1427)))))

(declare-fun b!1028831 () Bool)

(declare-fun res!688334 () Bool)

(assert (=> b!1028831 (=> (not res!688334) (not e!580807))))

(assert (=> b!1028831 (= res!688334 e!580808)))

(declare-fun c!103850 () Bool)

(assert (=> b!1028831 (= c!103850 (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028832 () Bool)

(declare-fun get!16348 (ValueCell!11450 V!37283) V!37283)

(assert (=> b!1028832 (= e!580810 (= (apply!895 lt!453271 (select (arr!31110 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000)) (get!16348 (select (arr!31111 (_values!6132 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1946 (defaultEntry!6109 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31628 (_values!6132 thiss!1427))))))

(assert (=> b!1028832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))))))

(declare-fun b!1028833 () Bool)

(declare-fun c!103853 () Bool)

(assert (=> b!1028833 (= c!103853 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1028833 (= e!580806 e!580812)))

(declare-fun b!1028834 () Bool)

(assert (=> b!1028834 (= e!580807 e!580804)))

(declare-fun c!103854 () Bool)

(assert (=> b!1028834 (= c!103854 (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028835 () Bool)

(assert (=> b!1028835 (= e!580804 e!580813)))

(declare-fun res!688333 () Bool)

(assert (=> b!1028835 (= res!688333 call!43390)))

(assert (=> b!1028835 (=> (not res!688333) (not e!580813))))

(declare-fun b!1028836 () Bool)

(assert (=> b!1028836 (= e!580802 (= (apply!895 lt!453271 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5945 thiss!1427)))))

(declare-fun b!1028837 () Bool)

(declare-fun Unit!33493 () Unit!33485)

(assert (=> b!1028837 (= e!580814 Unit!33493)))

(declare-fun b!1028838 () Bool)

(assert (=> b!1028838 (= e!580812 call!43389)))

(declare-fun b!1028839 () Bool)

(declare-fun lt!453261 () Unit!33485)

(assert (=> b!1028839 (= e!580814 lt!453261)))

(declare-fun lt!453269 () ListLongMap!13753)

(assert (=> b!1028839 (= lt!453269 (getCurrentListMapNoExtraKeys!3561 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453262 () (_ BitVec 64))

(assert (=> b!1028839 (= lt!453262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453259 () (_ BitVec 64))

(assert (=> b!1028839 (= lt!453259 (select (arr!31110 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453256 () Unit!33485)

(declare-fun addStillContains!614 (ListLongMap!13753 (_ BitVec 64) V!37283 (_ BitVec 64)) Unit!33485)

(assert (=> b!1028839 (= lt!453256 (addStillContains!614 lt!453269 lt!453262 (zeroValue!5945 thiss!1427) lt!453259))))

(assert (=> b!1028839 (contains!5949 (+!3126 lt!453269 (tuple2!15639 lt!453262 (zeroValue!5945 thiss!1427))) lt!453259)))

(declare-fun lt!453258 () Unit!33485)

(assert (=> b!1028839 (= lt!453258 lt!453256)))

(declare-fun lt!453251 () ListLongMap!13753)

(assert (=> b!1028839 (= lt!453251 (getCurrentListMapNoExtraKeys!3561 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453260 () (_ BitVec 64))

(assert (=> b!1028839 (= lt!453260 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453270 () (_ BitVec 64))

(assert (=> b!1028839 (= lt!453270 (select (arr!31110 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453252 () Unit!33485)

(declare-fun addApplyDifferent!470 (ListLongMap!13753 (_ BitVec 64) V!37283 (_ BitVec 64)) Unit!33485)

(assert (=> b!1028839 (= lt!453252 (addApplyDifferent!470 lt!453251 lt!453260 (minValue!5945 thiss!1427) lt!453270))))

(assert (=> b!1028839 (= (apply!895 (+!3126 lt!453251 (tuple2!15639 lt!453260 (minValue!5945 thiss!1427))) lt!453270) (apply!895 lt!453251 lt!453270))))

(declare-fun lt!453267 () Unit!33485)

(assert (=> b!1028839 (= lt!453267 lt!453252)))

(declare-fun lt!453263 () ListLongMap!13753)

(assert (=> b!1028839 (= lt!453263 (getCurrentListMapNoExtraKeys!3561 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453268 () (_ BitVec 64))

(assert (=> b!1028839 (= lt!453268 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453266 () (_ BitVec 64))

(assert (=> b!1028839 (= lt!453266 (select (arr!31110 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453250 () Unit!33485)

(assert (=> b!1028839 (= lt!453250 (addApplyDifferent!470 lt!453263 lt!453268 (zeroValue!5945 thiss!1427) lt!453266))))

(assert (=> b!1028839 (= (apply!895 (+!3126 lt!453263 (tuple2!15639 lt!453268 (zeroValue!5945 thiss!1427))) lt!453266) (apply!895 lt!453263 lt!453266))))

(declare-fun lt!453257 () Unit!33485)

(assert (=> b!1028839 (= lt!453257 lt!453250)))

(declare-fun lt!453254 () ListLongMap!13753)

(assert (=> b!1028839 (= lt!453254 (getCurrentListMapNoExtraKeys!3561 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453253 () (_ BitVec 64))

(assert (=> b!1028839 (= lt!453253 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453264 () (_ BitVec 64))

(assert (=> b!1028839 (= lt!453264 (select (arr!31110 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028839 (= lt!453261 (addApplyDifferent!470 lt!453254 lt!453253 (minValue!5945 thiss!1427) lt!453264))))

(assert (=> b!1028839 (= (apply!895 (+!3126 lt!453254 (tuple2!15639 lt!453253 (minValue!5945 thiss!1427))) lt!453264) (apply!895 lt!453254 lt!453264))))

(assert (= (and d!123003 c!103852) b!1028822))

(assert (= (and d!123003 (not c!103852)) b!1028824))

(assert (= (and b!1028824 c!103851) b!1028825))

(assert (= (and b!1028824 (not c!103851)) b!1028833))

(assert (= (and b!1028833 c!103853) b!1028821))

(assert (= (and b!1028833 (not c!103853)) b!1028838))

(assert (= (or b!1028821 b!1028838) bm!43385))

(assert (= (or b!1028825 bm!43385) bm!43389))

(assert (= (or b!1028825 b!1028821) bm!43386))

(assert (= (or b!1028822 bm!43389) bm!43390))

(assert (= (or b!1028822 bm!43386) bm!43387))

(assert (= (and d!123003 res!688331) b!1028826))

(assert (= (and d!123003 c!103849) b!1028839))

(assert (= (and d!123003 (not c!103849)) b!1028837))

(assert (= (and d!123003 res!688328) b!1028828))

(assert (= (and b!1028828 res!688329) b!1028823))

(assert (= (and b!1028828 (not res!688332)) b!1028819))

(assert (= (and b!1028819 res!688327) b!1028832))

(assert (= (and b!1028828 res!688335) b!1028831))

(assert (= (and b!1028831 c!103850) b!1028829))

(assert (= (and b!1028831 (not c!103850)) b!1028820))

(assert (= (and b!1028829 res!688330) b!1028836))

(assert (= (or b!1028829 b!1028820) bm!43388))

(assert (= (and b!1028831 res!688334) b!1028834))

(assert (= (and b!1028834 c!103854) b!1028835))

(assert (= (and b!1028834 (not c!103854)) b!1028827))

(assert (= (and b!1028835 res!688333) b!1028830))

(assert (= (or b!1028835 b!1028827) bm!43391))

(declare-fun b_lambda!15813 () Bool)

(assert (=> (not b_lambda!15813) (not b!1028832)))

(assert (=> b!1028832 t!30924))

(declare-fun b_and!32879 () Bool)

(assert (= b_and!32869 (and (=> t!30924 result!14123) b_and!32879)))

(declare-fun m!947453 () Bool)

(assert (=> b!1028822 m!947453))

(declare-fun m!947455 () Bool)

(assert (=> b!1028819 m!947455))

(assert (=> b!1028819 m!947455))

(declare-fun m!947457 () Bool)

(assert (=> b!1028819 m!947457))

(declare-fun m!947459 () Bool)

(assert (=> bm!43391 m!947459))

(declare-fun m!947461 () Bool)

(assert (=> bm!43390 m!947461))

(declare-fun m!947463 () Bool)

(assert (=> bm!43388 m!947463))

(assert (=> b!1028826 m!947455))

(assert (=> b!1028826 m!947455))

(declare-fun m!947465 () Bool)

(assert (=> b!1028826 m!947465))

(assert (=> b!1028839 m!947455))

(declare-fun m!947467 () Bool)

(assert (=> b!1028839 m!947467))

(declare-fun m!947469 () Bool)

(assert (=> b!1028839 m!947469))

(declare-fun m!947471 () Bool)

(assert (=> b!1028839 m!947471))

(declare-fun m!947473 () Bool)

(assert (=> b!1028839 m!947473))

(declare-fun m!947475 () Bool)

(assert (=> b!1028839 m!947475))

(declare-fun m!947477 () Bool)

(assert (=> b!1028839 m!947477))

(declare-fun m!947479 () Bool)

(assert (=> b!1028839 m!947479))

(assert (=> b!1028839 m!947467))

(declare-fun m!947481 () Bool)

(assert (=> b!1028839 m!947481))

(declare-fun m!947483 () Bool)

(assert (=> b!1028839 m!947483))

(declare-fun m!947485 () Bool)

(assert (=> b!1028839 m!947485))

(declare-fun m!947487 () Bool)

(assert (=> b!1028839 m!947487))

(declare-fun m!947489 () Bool)

(assert (=> b!1028839 m!947489))

(declare-fun m!947491 () Bool)

(assert (=> b!1028839 m!947491))

(declare-fun m!947493 () Bool)

(assert (=> b!1028839 m!947493))

(assert (=> b!1028839 m!947461))

(assert (=> b!1028839 m!947477))

(assert (=> b!1028839 m!947473))

(declare-fun m!947495 () Bool)

(assert (=> b!1028839 m!947495))

(assert (=> b!1028839 m!947485))

(assert (=> b!1028832 m!947455))

(declare-fun m!947497 () Bool)

(assert (=> b!1028832 m!947497))

(assert (=> b!1028832 m!947455))

(declare-fun m!947499 () Bool)

(assert (=> b!1028832 m!947499))

(assert (=> b!1028832 m!947497))

(assert (=> b!1028832 m!947337))

(declare-fun m!947501 () Bool)

(assert (=> b!1028832 m!947501))

(assert (=> b!1028832 m!947337))

(assert (=> b!1028823 m!947455))

(assert (=> b!1028823 m!947455))

(assert (=> b!1028823 m!947465))

(declare-fun m!947503 () Bool)

(assert (=> b!1028830 m!947503))

(declare-fun m!947505 () Bool)

(assert (=> b!1028836 m!947505))

(assert (=> d!123003 m!947449))

(declare-fun m!947507 () Bool)

(assert (=> bm!43387 m!947507))

(assert (=> b!1028716 d!123003))

(declare-fun b!1028850 () Bool)

(declare-fun e!580820 () Bool)

(assert (=> b!1028850 (= e!580820 (bvslt (size!31627 (_keys!11264 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1028848 () Bool)

(declare-fun res!688345 () Bool)

(assert (=> b!1028848 (=> (not res!688345) (not e!580820))))

(assert (=> b!1028848 (= res!688345 (validKeyInArray!0 (select (arr!31110 (_keys!11264 thiss!1427)) (index!41052 lt!453144))))))

(declare-fun b!1028851 () Bool)

(declare-fun e!580819 () Bool)

(assert (=> b!1028851 (= e!580819 (= (arrayCountValidKeys!0 (array!64610 (store (arr!31110 (_keys!11264 thiss!1427)) (index!41052 lt!453144) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31627 (_keys!11264 thiss!1427))) #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11264 thiss!1427) #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!123005 () Bool)

(assert (=> d!123005 e!580819))

(declare-fun res!688347 () Bool)

(assert (=> d!123005 (=> (not res!688347) (not e!580819))))

(assert (=> d!123005 (= res!688347 (and (bvsge (index!41052 lt!453144) #b00000000000000000000000000000000) (bvslt (index!41052 lt!453144) (size!31627 (_keys!11264 thiss!1427)))))))

(declare-fun lt!453274 () Unit!33485)

(declare-fun choose!82 (array!64609 (_ BitVec 32) (_ BitVec 64)) Unit!33485)

(assert (=> d!123005 (= lt!453274 (choose!82 (_keys!11264 thiss!1427) (index!41052 lt!453144) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123005 e!580820))

(declare-fun res!688344 () Bool)

(assert (=> d!123005 (=> (not res!688344) (not e!580820))))

(assert (=> d!123005 (= res!688344 (and (bvsge (index!41052 lt!453144) #b00000000000000000000000000000000) (bvslt (index!41052 lt!453144) (size!31627 (_keys!11264 thiss!1427)))))))

(assert (=> d!123005 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11264 thiss!1427) (index!41052 lt!453144) #b1000000000000000000000000000000000000000000000000000000000000000) lt!453274)))

(declare-fun b!1028849 () Bool)

(declare-fun res!688346 () Bool)

(assert (=> b!1028849 (=> (not res!688346) (not e!580820))))

(assert (=> b!1028849 (= res!688346 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123005 res!688344) b!1028848))

(assert (= (and b!1028848 res!688345) b!1028849))

(assert (= (and b!1028849 res!688346) b!1028850))

(assert (= (and d!123005 res!688347) b!1028851))

(declare-fun m!947509 () Bool)

(assert (=> b!1028848 m!947509))

(assert (=> b!1028848 m!947509))

(declare-fun m!947511 () Bool)

(assert (=> b!1028848 m!947511))

(assert (=> b!1028851 m!947317))

(declare-fun m!947513 () Bool)

(assert (=> b!1028851 m!947513))

(assert (=> b!1028851 m!947325))

(declare-fun m!947515 () Bool)

(assert (=> d!123005 m!947515))

(declare-fun m!947517 () Bool)

(assert (=> b!1028849 m!947517))

(assert (=> b!1028716 d!123005))

(declare-fun d!123007 () Bool)

(assert (=> d!123007 (= (validMask!0 (mask!29850 (_2!7829 lt!453141))) (and (or (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000000000000111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000000000001111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000000000011111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000000000111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000000001111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000000011111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000000111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000001111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000011111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000000111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000001111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000011111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000000111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000001111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000011111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000000111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000001111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000011111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000000111111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000001111111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000011111111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000000111111111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000001111111111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000011111111111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00000111111111111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00001111111111111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00011111111111111111111111111111) (= (mask!29850 (_2!7829 lt!453141)) #b00111111111111111111111111111111)) (bvsle (mask!29850 (_2!7829 lt!453141)) #b00111111111111111111111111111111)))))

(assert (=> b!1028716 d!123007))

(declare-fun d!123009 () Bool)

(declare-fun res!688352 () Bool)

(declare-fun e!580825 () Bool)

(assert (=> d!123009 (=> res!688352 e!580825)))

(assert (=> d!123009 (= res!688352 (= (select (arr!31110 lt!453142) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123009 (= (arrayContainsKey!0 lt!453142 key!909 #b00000000000000000000000000000000) e!580825)))

(declare-fun b!1028856 () Bool)

(declare-fun e!580826 () Bool)

(assert (=> b!1028856 (= e!580825 e!580826)))

(declare-fun res!688353 () Bool)

(assert (=> b!1028856 (=> (not res!688353) (not e!580826))))

(assert (=> b!1028856 (= res!688353 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31627 lt!453142)))))

(declare-fun b!1028857 () Bool)

(assert (=> b!1028857 (= e!580826 (arrayContainsKey!0 lt!453142 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123009 (not res!688352)) b!1028856))

(assert (= (and b!1028856 res!688353) b!1028857))

(declare-fun m!947519 () Bool)

(assert (=> d!123009 m!947519))

(declare-fun m!947521 () Bool)

(assert (=> b!1028857 m!947521))

(assert (=> b!1028716 d!123009))

(declare-fun b!1028866 () Bool)

(declare-fun e!580834 () Bool)

(declare-fun e!580835 () Bool)

(assert (=> b!1028866 (= e!580834 e!580835)))

(declare-fun c!103857 () Bool)

(assert (=> b!1028866 (= c!103857 (validKeyInArray!0 (select (arr!31110 lt!453142) #b00000000000000000000000000000000)))))

(declare-fun b!1028867 () Bool)

(declare-fun call!43397 () Bool)

(assert (=> b!1028867 (= e!580835 call!43397)))

(declare-fun b!1028868 () Bool)

(declare-fun e!580833 () Bool)

(assert (=> b!1028868 (= e!580833 call!43397)))

(declare-fun b!1028869 () Bool)

(assert (=> b!1028869 (= e!580835 e!580833)))

(declare-fun lt!453283 () (_ BitVec 64))

(assert (=> b!1028869 (= lt!453283 (select (arr!31110 lt!453142) #b00000000000000000000000000000000))))

(declare-fun lt!453281 () Unit!33485)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64609 (_ BitVec 64) (_ BitVec 32)) Unit!33485)

(assert (=> b!1028869 (= lt!453281 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453142 lt!453283 #b00000000000000000000000000000000))))

(assert (=> b!1028869 (arrayContainsKey!0 lt!453142 lt!453283 #b00000000000000000000000000000000)))

(declare-fun lt!453282 () Unit!33485)

(assert (=> b!1028869 (= lt!453282 lt!453281)))

(declare-fun res!688358 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64609 (_ BitVec 32)) SeekEntryResult!9670)

(assert (=> b!1028869 (= res!688358 (= (seekEntryOrOpen!0 (select (arr!31110 lt!453142) #b00000000000000000000000000000000) lt!453142 (mask!29850 thiss!1427)) (Found!9670 #b00000000000000000000000000000000)))))

(assert (=> b!1028869 (=> (not res!688358) (not e!580833))))

(declare-fun d!123011 () Bool)

(declare-fun res!688359 () Bool)

(assert (=> d!123011 (=> res!688359 e!580834)))

(assert (=> d!123011 (= res!688359 (bvsge #b00000000000000000000000000000000 (size!31627 lt!453142)))))

(assert (=> d!123011 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453142 (mask!29850 thiss!1427)) e!580834)))

(declare-fun bm!43394 () Bool)

(assert (=> bm!43394 (= call!43397 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453142 (mask!29850 thiss!1427)))))

(assert (= (and d!123011 (not res!688359)) b!1028866))

(assert (= (and b!1028866 c!103857) b!1028869))

(assert (= (and b!1028866 (not c!103857)) b!1028867))

(assert (= (and b!1028869 res!688358) b!1028868))

(assert (= (or b!1028868 b!1028867) bm!43394))

(assert (=> b!1028866 m!947519))

(assert (=> b!1028866 m!947519))

(declare-fun m!947523 () Bool)

(assert (=> b!1028866 m!947523))

(assert (=> b!1028869 m!947519))

(declare-fun m!947525 () Bool)

(assert (=> b!1028869 m!947525))

(declare-fun m!947527 () Bool)

(assert (=> b!1028869 m!947527))

(assert (=> b!1028869 m!947519))

(declare-fun m!947529 () Bool)

(assert (=> b!1028869 m!947529))

(declare-fun m!947531 () Bool)

(assert (=> bm!43394 m!947531))

(assert (=> b!1028716 d!123011))

(declare-fun b!1028878 () Bool)

(declare-fun e!580841 () (_ BitVec 32))

(assert (=> b!1028878 (= e!580841 #b00000000000000000000000000000000)))

(declare-fun b!1028880 () Bool)

(declare-fun e!580840 () (_ BitVec 32))

(assert (=> b!1028880 (= e!580841 e!580840)))

(declare-fun c!103862 () Bool)

(assert (=> b!1028880 (= c!103862 (validKeyInArray!0 (select (arr!31110 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028881 () Bool)

(declare-fun call!43400 () (_ BitVec 32))

(assert (=> b!1028881 (= e!580840 call!43400)))

(declare-fun bm!43397 () Bool)

(assert (=> bm!43397 (= call!43400 (arrayCountValidKeys!0 (_keys!11264 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31627 (_keys!11264 thiss!1427))))))

(declare-fun b!1028879 () Bool)

(assert (=> b!1028879 (= e!580840 (bvadd #b00000000000000000000000000000001 call!43400))))

(declare-fun d!123013 () Bool)

(declare-fun lt!453286 () (_ BitVec 32))

(assert (=> d!123013 (and (bvsge lt!453286 #b00000000000000000000000000000000) (bvsle lt!453286 (bvsub (size!31627 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123013 (= lt!453286 e!580841)))

(declare-fun c!103863 () Bool)

(assert (=> d!123013 (= c!103863 (bvsge #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))))))

(assert (=> d!123013 (and (bvsle #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31627 (_keys!11264 thiss!1427)) (size!31627 (_keys!11264 thiss!1427))))))

(assert (=> d!123013 (= (arrayCountValidKeys!0 (_keys!11264 thiss!1427) #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) lt!453286)))

(assert (= (and d!123013 c!103863) b!1028878))

(assert (= (and d!123013 (not c!103863)) b!1028880))

(assert (= (and b!1028880 c!103862) b!1028879))

(assert (= (and b!1028880 (not c!103862)) b!1028881))

(assert (= (or b!1028879 b!1028881) bm!43397))

(assert (=> b!1028880 m!947455))

(assert (=> b!1028880 m!947455))

(assert (=> b!1028880 m!947465))

(declare-fun m!947533 () Bool)

(assert (=> bm!43397 m!947533))

(assert (=> b!1028716 d!123013))

(declare-fun d!123015 () Bool)

(declare-fun e!580844 () Bool)

(assert (=> d!123015 e!580844))

(declare-fun res!688362 () Bool)

(assert (=> d!123015 (=> (not res!688362) (not e!580844))))

(assert (=> d!123015 (= res!688362 (bvslt (index!41052 lt!453144) (size!31627 (_keys!11264 thiss!1427))))))

(declare-fun lt!453289 () Unit!33485)

(declare-fun choose!121 (array!64609 (_ BitVec 32) (_ BitVec 64)) Unit!33485)

(assert (=> d!123015 (= lt!453289 (choose!121 (_keys!11264 thiss!1427) (index!41052 lt!453144) key!909))))

(assert (=> d!123015 (bvsge (index!41052 lt!453144) #b00000000000000000000000000000000)))

(assert (=> d!123015 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11264 thiss!1427) (index!41052 lt!453144) key!909) lt!453289)))

(declare-fun b!1028884 () Bool)

(assert (=> b!1028884 (= e!580844 (not (arrayContainsKey!0 (array!64610 (store (arr!31110 (_keys!11264 thiss!1427)) (index!41052 lt!453144) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31627 (_keys!11264 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123015 res!688362) b!1028884))

(declare-fun m!947535 () Bool)

(assert (=> d!123015 m!947535))

(assert (=> b!1028884 m!947317))

(declare-fun m!947537 () Bool)

(assert (=> b!1028884 m!947537))

(assert (=> b!1028716 d!123015))

(declare-fun b!1028885 () Bool)

(declare-fun e!580846 () (_ BitVec 32))

(assert (=> b!1028885 (= e!580846 #b00000000000000000000000000000000)))

(declare-fun b!1028887 () Bool)

(declare-fun e!580845 () (_ BitVec 32))

(assert (=> b!1028887 (= e!580846 e!580845)))

(declare-fun c!103864 () Bool)

(assert (=> b!1028887 (= c!103864 (validKeyInArray!0 (select (arr!31110 lt!453142) #b00000000000000000000000000000000)))))

(declare-fun b!1028888 () Bool)

(declare-fun call!43401 () (_ BitVec 32))

(assert (=> b!1028888 (= e!580845 call!43401)))

(declare-fun bm!43398 () Bool)

(assert (=> bm!43398 (= call!43401 (arrayCountValidKeys!0 lt!453142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31627 (_keys!11264 thiss!1427))))))

(declare-fun b!1028886 () Bool)

(assert (=> b!1028886 (= e!580845 (bvadd #b00000000000000000000000000000001 call!43401))))

(declare-fun d!123017 () Bool)

(declare-fun lt!453290 () (_ BitVec 32))

(assert (=> d!123017 (and (bvsge lt!453290 #b00000000000000000000000000000000) (bvsle lt!453290 (bvsub (size!31627 lt!453142) #b00000000000000000000000000000000)))))

(assert (=> d!123017 (= lt!453290 e!580846)))

(declare-fun c!103865 () Bool)

(assert (=> d!123017 (= c!103865 (bvsge #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))))))

(assert (=> d!123017 (and (bvsle #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31627 (_keys!11264 thiss!1427)) (size!31627 lt!453142)))))

(assert (=> d!123017 (= (arrayCountValidKeys!0 lt!453142 #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) lt!453290)))

(assert (= (and d!123017 c!103865) b!1028885))

(assert (= (and d!123017 (not c!103865)) b!1028887))

(assert (= (and b!1028887 c!103864) b!1028886))

(assert (= (and b!1028887 (not c!103864)) b!1028888))

(assert (= (or b!1028886 b!1028888) bm!43398))

(assert (=> b!1028887 m!947519))

(assert (=> b!1028887 m!947519))

(assert (=> b!1028887 m!947523))

(declare-fun m!947539 () Bool)

(assert (=> bm!43398 m!947539))

(assert (=> b!1028716 d!123017))

(declare-fun d!123019 () Bool)

(declare-fun lt!453293 () ListLongMap!13753)

(assert (=> d!123019 (not (contains!5949 lt!453293 key!909))))

(declare-fun removeStrictlySorted!52 (List!21852 (_ BitVec 64)) List!21852)

(assert (=> d!123019 (= lt!453293 (ListLongMap!13754 (removeStrictlySorted!52 (toList!6892 (getCurrentListMap!3859 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427))) key!909)))))

(assert (=> d!123019 (= (-!484 (getCurrentListMap!3859 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) key!909) lt!453293)))

(declare-fun bs!30023 () Bool)

(assert (= bs!30023 d!123019))

(declare-fun m!947541 () Bool)

(assert (=> bs!30023 m!947541))

(declare-fun m!947543 () Bool)

(assert (=> bs!30023 m!947543))

(assert (=> b!1028716 d!123019))

(declare-fun b!1028889 () Bool)

(declare-fun e!580854 () Bool)

(declare-fun e!580855 () Bool)

(assert (=> b!1028889 (= e!580854 e!580855)))

(declare-fun res!688363 () Bool)

(assert (=> b!1028889 (=> (not res!688363) (not e!580855))))

(declare-fun lt!453315 () ListLongMap!13753)

(assert (=> b!1028889 (= res!688363 (contains!5949 lt!453315 (select (arr!31110 lt!453142) #b00000000000000000000000000000000)))))

(assert (=> b!1028889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31627 lt!453142)))))

(declare-fun bm!43399 () Bool)

(declare-fun call!43403 () ListLongMap!13753)

(declare-fun call!43406 () ListLongMap!13753)

(assert (=> bm!43399 (= call!43403 call!43406)))

(declare-fun bm!43400 () Bool)

(declare-fun call!43405 () ListLongMap!13753)

(declare-fun call!43408 () ListLongMap!13753)

(assert (=> bm!43400 (= call!43405 call!43408)))

(declare-fun b!1028890 () Bool)

(declare-fun e!580853 () Bool)

(declare-fun call!43402 () Bool)

(assert (=> b!1028890 (= e!580853 (not call!43402))))

(declare-fun b!1028891 () Bool)

(declare-fun e!580857 () ListLongMap!13753)

(assert (=> b!1028891 (= e!580857 call!43405)))

(declare-fun c!103868 () Bool)

(declare-fun bm!43401 () Bool)

(declare-fun call!43407 () ListLongMap!13753)

(declare-fun c!103869 () Bool)

(assert (=> bm!43401 (= call!43408 (+!3126 (ite c!103869 call!43407 (ite c!103868 call!43406 call!43403)) (ite (or c!103869 c!103868) (tuple2!15639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5945 thiss!1427)) (tuple2!15639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5945 thiss!1427)))))))

(declare-fun d!123021 () Bool)

(declare-fun e!580852 () Bool)

(assert (=> d!123021 e!580852))

(declare-fun res!688364 () Bool)

(assert (=> d!123021 (=> (not res!688364) (not e!580852))))

(assert (=> d!123021 (= res!688364 (or (bvsge #b00000000000000000000000000000000 (size!31627 lt!453142)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31627 lt!453142)))))))

(declare-fun lt!453309 () ListLongMap!13753)

(assert (=> d!123021 (= lt!453315 lt!453309)))

(declare-fun lt!453299 () Unit!33485)

(declare-fun e!580859 () Unit!33485)

(assert (=> d!123021 (= lt!453299 e!580859)))

(declare-fun c!103866 () Bool)

(declare-fun e!580848 () Bool)

(assert (=> d!123021 (= c!103866 e!580848)))

(declare-fun res!688367 () Bool)

(assert (=> d!123021 (=> (not res!688367) (not e!580848))))

(assert (=> d!123021 (= res!688367 (bvslt #b00000000000000000000000000000000 (size!31627 lt!453142)))))

(declare-fun e!580856 () ListLongMap!13753)

(assert (=> d!123021 (= lt!453309 e!580856)))

(assert (=> d!123021 (= c!103869 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123021 (validMask!0 (mask!29850 thiss!1427))))

(assert (=> d!123021 (= (getCurrentListMap!3859 lt!453142 lt!453138 (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) lt!453315)))

(declare-fun b!1028892 () Bool)

(assert (=> b!1028892 (= e!580856 (+!3126 call!43408 (tuple2!15639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5945 thiss!1427))))))

(declare-fun bm!43402 () Bool)

(assert (=> bm!43402 (= call!43402 (contains!5949 lt!453315 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028893 () Bool)

(declare-fun e!580850 () Bool)

(assert (=> b!1028893 (= e!580850 (validKeyInArray!0 (select (arr!31110 lt!453142) #b00000000000000000000000000000000)))))

(declare-fun b!1028894 () Bool)

(declare-fun e!580851 () ListLongMap!13753)

(assert (=> b!1028894 (= e!580856 e!580851)))

(assert (=> b!1028894 (= c!103868 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43403 () Bool)

(assert (=> bm!43403 (= call!43406 call!43407)))

(declare-fun b!1028895 () Bool)

(assert (=> b!1028895 (= e!580851 call!43405)))

(declare-fun bm!43404 () Bool)

(assert (=> bm!43404 (= call!43407 (getCurrentListMapNoExtraKeys!3561 lt!453142 lt!453138 (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun b!1028896 () Bool)

(assert (=> b!1028896 (= e!580848 (validKeyInArray!0 (select (arr!31110 lt!453142) #b00000000000000000000000000000000)))))

(declare-fun b!1028897 () Bool)

(declare-fun e!580849 () Bool)

(declare-fun call!43404 () Bool)

(assert (=> b!1028897 (= e!580849 (not call!43404))))

(declare-fun b!1028898 () Bool)

(declare-fun res!688371 () Bool)

(assert (=> b!1028898 (=> (not res!688371) (not e!580852))))

(assert (=> b!1028898 (= res!688371 e!580854)))

(declare-fun res!688368 () Bool)

(assert (=> b!1028898 (=> res!688368 e!580854)))

(assert (=> b!1028898 (= res!688368 (not e!580850))))

(declare-fun res!688365 () Bool)

(assert (=> b!1028898 (=> (not res!688365) (not e!580850))))

(assert (=> b!1028898 (= res!688365 (bvslt #b00000000000000000000000000000000 (size!31627 lt!453142)))))

(declare-fun bm!43405 () Bool)

(assert (=> bm!43405 (= call!43404 (contains!5949 lt!453315 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028899 () Bool)

(declare-fun e!580847 () Bool)

(assert (=> b!1028899 (= e!580853 e!580847)))

(declare-fun res!688366 () Bool)

(assert (=> b!1028899 (= res!688366 call!43402)))

(assert (=> b!1028899 (=> (not res!688366) (not e!580847))))

(declare-fun b!1028900 () Bool)

(declare-fun e!580858 () Bool)

(assert (=> b!1028900 (= e!580858 (= (apply!895 lt!453315 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5945 thiss!1427)))))

(declare-fun b!1028901 () Bool)

(declare-fun res!688370 () Bool)

(assert (=> b!1028901 (=> (not res!688370) (not e!580852))))

(assert (=> b!1028901 (= res!688370 e!580853)))

(declare-fun c!103867 () Bool)

(assert (=> b!1028901 (= c!103867 (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028902 () Bool)

(assert (=> b!1028902 (= e!580855 (= (apply!895 lt!453315 (select (arr!31110 lt!453142) #b00000000000000000000000000000000)) (get!16348 (select (arr!31111 lt!453138) #b00000000000000000000000000000000) (dynLambda!1946 (defaultEntry!6109 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028902 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31628 lt!453138)))))

(assert (=> b!1028902 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31627 lt!453142)))))

(declare-fun b!1028903 () Bool)

(declare-fun c!103870 () Bool)

(assert (=> b!1028903 (= c!103870 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1028903 (= e!580851 e!580857)))

(declare-fun b!1028904 () Bool)

(assert (=> b!1028904 (= e!580852 e!580849)))

(declare-fun c!103871 () Bool)

(assert (=> b!1028904 (= c!103871 (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028905 () Bool)

(assert (=> b!1028905 (= e!580849 e!580858)))

(declare-fun res!688369 () Bool)

(assert (=> b!1028905 (= res!688369 call!43404)))

(assert (=> b!1028905 (=> (not res!688369) (not e!580858))))

(declare-fun b!1028906 () Bool)

(assert (=> b!1028906 (= e!580847 (= (apply!895 lt!453315 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5945 thiss!1427)))))

(declare-fun b!1028907 () Bool)

(declare-fun Unit!33494 () Unit!33485)

(assert (=> b!1028907 (= e!580859 Unit!33494)))

(declare-fun b!1028908 () Bool)

(assert (=> b!1028908 (= e!580857 call!43403)))

(declare-fun b!1028909 () Bool)

(declare-fun lt!453305 () Unit!33485)

(assert (=> b!1028909 (= e!580859 lt!453305)))

(declare-fun lt!453313 () ListLongMap!13753)

(assert (=> b!1028909 (= lt!453313 (getCurrentListMapNoExtraKeys!3561 lt!453142 lt!453138 (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453306 () (_ BitVec 64))

(assert (=> b!1028909 (= lt!453306 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453303 () (_ BitVec 64))

(assert (=> b!1028909 (= lt!453303 (select (arr!31110 lt!453142) #b00000000000000000000000000000000))))

(declare-fun lt!453300 () Unit!33485)

(assert (=> b!1028909 (= lt!453300 (addStillContains!614 lt!453313 lt!453306 (zeroValue!5945 thiss!1427) lt!453303))))

(assert (=> b!1028909 (contains!5949 (+!3126 lt!453313 (tuple2!15639 lt!453306 (zeroValue!5945 thiss!1427))) lt!453303)))

(declare-fun lt!453302 () Unit!33485)

(assert (=> b!1028909 (= lt!453302 lt!453300)))

(declare-fun lt!453295 () ListLongMap!13753)

(assert (=> b!1028909 (= lt!453295 (getCurrentListMapNoExtraKeys!3561 lt!453142 lt!453138 (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453304 () (_ BitVec 64))

(assert (=> b!1028909 (= lt!453304 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453314 () (_ BitVec 64))

(assert (=> b!1028909 (= lt!453314 (select (arr!31110 lt!453142) #b00000000000000000000000000000000))))

(declare-fun lt!453296 () Unit!33485)

(assert (=> b!1028909 (= lt!453296 (addApplyDifferent!470 lt!453295 lt!453304 (minValue!5945 thiss!1427) lt!453314))))

(assert (=> b!1028909 (= (apply!895 (+!3126 lt!453295 (tuple2!15639 lt!453304 (minValue!5945 thiss!1427))) lt!453314) (apply!895 lt!453295 lt!453314))))

(declare-fun lt!453311 () Unit!33485)

(assert (=> b!1028909 (= lt!453311 lt!453296)))

(declare-fun lt!453307 () ListLongMap!13753)

(assert (=> b!1028909 (= lt!453307 (getCurrentListMapNoExtraKeys!3561 lt!453142 lt!453138 (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453312 () (_ BitVec 64))

(assert (=> b!1028909 (= lt!453312 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453310 () (_ BitVec 64))

(assert (=> b!1028909 (= lt!453310 (select (arr!31110 lt!453142) #b00000000000000000000000000000000))))

(declare-fun lt!453294 () Unit!33485)

(assert (=> b!1028909 (= lt!453294 (addApplyDifferent!470 lt!453307 lt!453312 (zeroValue!5945 thiss!1427) lt!453310))))

(assert (=> b!1028909 (= (apply!895 (+!3126 lt!453307 (tuple2!15639 lt!453312 (zeroValue!5945 thiss!1427))) lt!453310) (apply!895 lt!453307 lt!453310))))

(declare-fun lt!453301 () Unit!33485)

(assert (=> b!1028909 (= lt!453301 lt!453294)))

(declare-fun lt!453298 () ListLongMap!13753)

(assert (=> b!1028909 (= lt!453298 (getCurrentListMapNoExtraKeys!3561 lt!453142 lt!453138 (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453297 () (_ BitVec 64))

(assert (=> b!1028909 (= lt!453297 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453308 () (_ BitVec 64))

(assert (=> b!1028909 (= lt!453308 (select (arr!31110 lt!453142) #b00000000000000000000000000000000))))

(assert (=> b!1028909 (= lt!453305 (addApplyDifferent!470 lt!453298 lt!453297 (minValue!5945 thiss!1427) lt!453308))))

(assert (=> b!1028909 (= (apply!895 (+!3126 lt!453298 (tuple2!15639 lt!453297 (minValue!5945 thiss!1427))) lt!453308) (apply!895 lt!453298 lt!453308))))

(assert (= (and d!123021 c!103869) b!1028892))

(assert (= (and d!123021 (not c!103869)) b!1028894))

(assert (= (and b!1028894 c!103868) b!1028895))

(assert (= (and b!1028894 (not c!103868)) b!1028903))

(assert (= (and b!1028903 c!103870) b!1028891))

(assert (= (and b!1028903 (not c!103870)) b!1028908))

(assert (= (or b!1028891 b!1028908) bm!43399))

(assert (= (or b!1028895 bm!43399) bm!43403))

(assert (= (or b!1028895 b!1028891) bm!43400))

(assert (= (or b!1028892 bm!43403) bm!43404))

(assert (= (or b!1028892 bm!43400) bm!43401))

(assert (= (and d!123021 res!688367) b!1028896))

(assert (= (and d!123021 c!103866) b!1028909))

(assert (= (and d!123021 (not c!103866)) b!1028907))

(assert (= (and d!123021 res!688364) b!1028898))

(assert (= (and b!1028898 res!688365) b!1028893))

(assert (= (and b!1028898 (not res!688368)) b!1028889))

(assert (= (and b!1028889 res!688363) b!1028902))

(assert (= (and b!1028898 res!688371) b!1028901))

(assert (= (and b!1028901 c!103867) b!1028899))

(assert (= (and b!1028901 (not c!103867)) b!1028890))

(assert (= (and b!1028899 res!688366) b!1028906))

(assert (= (or b!1028899 b!1028890) bm!43402))

(assert (= (and b!1028901 res!688370) b!1028904))

(assert (= (and b!1028904 c!103871) b!1028905))

(assert (= (and b!1028904 (not c!103871)) b!1028897))

(assert (= (and b!1028905 res!688369) b!1028900))

(assert (= (or b!1028905 b!1028897) bm!43405))

(declare-fun b_lambda!15815 () Bool)

(assert (=> (not b_lambda!15815) (not b!1028902)))

(assert (=> b!1028902 t!30924))

(declare-fun b_and!32881 () Bool)

(assert (= b_and!32879 (and (=> t!30924 result!14123) b_and!32881)))

(declare-fun m!947545 () Bool)

(assert (=> b!1028892 m!947545))

(assert (=> b!1028889 m!947519))

(assert (=> b!1028889 m!947519))

(declare-fun m!947547 () Bool)

(assert (=> b!1028889 m!947547))

(declare-fun m!947549 () Bool)

(assert (=> bm!43405 m!947549))

(declare-fun m!947551 () Bool)

(assert (=> bm!43404 m!947551))

(declare-fun m!947553 () Bool)

(assert (=> bm!43402 m!947553))

(assert (=> b!1028896 m!947519))

(assert (=> b!1028896 m!947519))

(assert (=> b!1028896 m!947523))

(assert (=> b!1028909 m!947519))

(declare-fun m!947555 () Bool)

(assert (=> b!1028909 m!947555))

(declare-fun m!947557 () Bool)

(assert (=> b!1028909 m!947557))

(declare-fun m!947559 () Bool)

(assert (=> b!1028909 m!947559))

(declare-fun m!947561 () Bool)

(assert (=> b!1028909 m!947561))

(declare-fun m!947563 () Bool)

(assert (=> b!1028909 m!947563))

(declare-fun m!947565 () Bool)

(assert (=> b!1028909 m!947565))

(declare-fun m!947567 () Bool)

(assert (=> b!1028909 m!947567))

(assert (=> b!1028909 m!947555))

(declare-fun m!947569 () Bool)

(assert (=> b!1028909 m!947569))

(declare-fun m!947571 () Bool)

(assert (=> b!1028909 m!947571))

(declare-fun m!947573 () Bool)

(assert (=> b!1028909 m!947573))

(declare-fun m!947575 () Bool)

(assert (=> b!1028909 m!947575))

(declare-fun m!947577 () Bool)

(assert (=> b!1028909 m!947577))

(declare-fun m!947579 () Bool)

(assert (=> b!1028909 m!947579))

(declare-fun m!947581 () Bool)

(assert (=> b!1028909 m!947581))

(assert (=> b!1028909 m!947551))

(assert (=> b!1028909 m!947565))

(assert (=> b!1028909 m!947561))

(declare-fun m!947583 () Bool)

(assert (=> b!1028909 m!947583))

(assert (=> b!1028909 m!947573))

(assert (=> b!1028902 m!947519))

(declare-fun m!947585 () Bool)

(assert (=> b!1028902 m!947585))

(assert (=> b!1028902 m!947519))

(declare-fun m!947587 () Bool)

(assert (=> b!1028902 m!947587))

(assert (=> b!1028902 m!947585))

(assert (=> b!1028902 m!947337))

(declare-fun m!947589 () Bool)

(assert (=> b!1028902 m!947589))

(assert (=> b!1028902 m!947337))

(assert (=> b!1028893 m!947519))

(assert (=> b!1028893 m!947519))

(assert (=> b!1028893 m!947523))

(declare-fun m!947591 () Bool)

(assert (=> b!1028900 m!947591))

(declare-fun m!947593 () Bool)

(assert (=> b!1028906 m!947593))

(assert (=> d!123021 m!947449))

(declare-fun m!947595 () Bool)

(assert (=> bm!43401 m!947595))

(assert (=> b!1028716 d!123021))

(declare-fun bm!43408 () Bool)

(declare-fun call!43411 () Bool)

(declare-fun c!103874 () Bool)

(assert (=> bm!43408 (= call!43411 (arrayNoDuplicates!0 lt!453142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103874 (Cons!21849 (select (arr!31110 lt!453142) #b00000000000000000000000000000000) Nil!21850) Nil!21850)))))

(declare-fun d!123023 () Bool)

(declare-fun res!688379 () Bool)

(declare-fun e!580871 () Bool)

(assert (=> d!123023 (=> res!688379 e!580871)))

(assert (=> d!123023 (= res!688379 (bvsge #b00000000000000000000000000000000 (size!31627 lt!453142)))))

(assert (=> d!123023 (= (arrayNoDuplicates!0 lt!453142 #b00000000000000000000000000000000 Nil!21850) e!580871)))

(declare-fun b!1028920 () Bool)

(declare-fun e!580869 () Bool)

(declare-fun contains!5950 (List!21853 (_ BitVec 64)) Bool)

(assert (=> b!1028920 (= e!580869 (contains!5950 Nil!21850 (select (arr!31110 lt!453142) #b00000000000000000000000000000000)))))

(declare-fun b!1028921 () Bool)

(declare-fun e!580870 () Bool)

(assert (=> b!1028921 (= e!580870 call!43411)))

(declare-fun b!1028922 () Bool)

(assert (=> b!1028922 (= e!580870 call!43411)))

(declare-fun b!1028923 () Bool)

(declare-fun e!580868 () Bool)

(assert (=> b!1028923 (= e!580868 e!580870)))

(assert (=> b!1028923 (= c!103874 (validKeyInArray!0 (select (arr!31110 lt!453142) #b00000000000000000000000000000000)))))

(declare-fun b!1028924 () Bool)

(assert (=> b!1028924 (= e!580871 e!580868)))

(declare-fun res!688378 () Bool)

(assert (=> b!1028924 (=> (not res!688378) (not e!580868))))

(assert (=> b!1028924 (= res!688378 (not e!580869))))

(declare-fun res!688380 () Bool)

(assert (=> b!1028924 (=> (not res!688380) (not e!580869))))

(assert (=> b!1028924 (= res!688380 (validKeyInArray!0 (select (arr!31110 lt!453142) #b00000000000000000000000000000000)))))

(assert (= (and d!123023 (not res!688379)) b!1028924))

(assert (= (and b!1028924 res!688380) b!1028920))

(assert (= (and b!1028924 res!688378) b!1028923))

(assert (= (and b!1028923 c!103874) b!1028921))

(assert (= (and b!1028923 (not c!103874)) b!1028922))

(assert (= (or b!1028921 b!1028922) bm!43408))

(assert (=> bm!43408 m!947519))

(declare-fun m!947597 () Bool)

(assert (=> bm!43408 m!947597))

(assert (=> b!1028920 m!947519))

(assert (=> b!1028920 m!947519))

(declare-fun m!947599 () Bool)

(assert (=> b!1028920 m!947599))

(assert (=> b!1028923 m!947519))

(assert (=> b!1028923 m!947519))

(assert (=> b!1028923 m!947523))

(assert (=> b!1028924 m!947519))

(assert (=> b!1028924 m!947519))

(assert (=> b!1028924 m!947523))

(assert (=> b!1028716 d!123023))

(declare-fun d!123025 () Bool)

(declare-fun e!580874 () Bool)

(assert (=> d!123025 e!580874))

(declare-fun res!688383 () Bool)

(assert (=> d!123025 (=> (not res!688383) (not e!580874))))

(assert (=> d!123025 (= res!688383 (and (bvsge (index!41052 lt!453144) #b00000000000000000000000000000000) (bvslt (index!41052 lt!453144) (size!31627 (_keys!11264 thiss!1427)))))))

(declare-fun lt!453318 () Unit!33485)

(declare-fun choose!1695 (array!64609 array!64611 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) (_ BitVec 64) Int) Unit!33485)

(assert (=> d!123025 (= lt!453318 (choose!1695 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (index!41052 lt!453144) key!909 (defaultEntry!6109 thiss!1427)))))

(assert (=> d!123025 (validMask!0 (mask!29850 thiss!1427))))

(assert (=> d!123025 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!9 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (index!41052 lt!453144) key!909 (defaultEntry!6109 thiss!1427)) lt!453318)))

(declare-fun b!1028927 () Bool)

(assert (=> b!1028927 (= e!580874 (= (-!484 (getCurrentListMap!3859 (_keys!11264 thiss!1427) (_values!6132 thiss!1427) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) key!909) (getCurrentListMap!3859 (array!64610 (store (arr!31110 (_keys!11264 thiss!1427)) (index!41052 lt!453144) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31627 (_keys!11264 thiss!1427))) (array!64612 (store (arr!31111 (_values!6132 thiss!1427)) (index!41052 lt!453144) (ValueCellFull!11450 (dynLambda!1946 (defaultEntry!6109 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31628 (_values!6132 thiss!1427))) (mask!29850 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427))))))

(assert (=> b!1028927 (bvslt (index!41052 lt!453144) (size!31628 (_values!6132 thiss!1427)))))

(assert (= (and d!123025 res!688383) b!1028927))

(declare-fun b_lambda!15817 () Bool)

(assert (=> (not b_lambda!15817) (not b!1028927)))

(assert (=> b!1028927 t!30924))

(declare-fun b_and!32883 () Bool)

(assert (= b_and!32881 (and (=> t!30924 result!14123) b_and!32883)))

(declare-fun m!947601 () Bool)

(assert (=> d!123025 m!947601))

(assert (=> d!123025 m!947449))

(declare-fun m!947603 () Bool)

(assert (=> b!1028927 m!947603))

(assert (=> b!1028927 m!947317))

(assert (=> b!1028927 m!947327))

(assert (=> b!1028927 m!947327))

(assert (=> b!1028927 m!947329))

(assert (=> b!1028927 m!947315))

(assert (=> b!1028927 m!947337))

(assert (=> b!1028716 d!123025))

(declare-fun d!123027 () Bool)

(assert (=> d!123027 (= (array_inv!24087 (_keys!11264 thiss!1427)) (bvsge (size!31627 (_keys!11264 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028712 d!123027))

(declare-fun d!123029 () Bool)

(assert (=> d!123029 (= (array_inv!24088 (_values!6132 thiss!1427)) (bvsge (size!31628 (_values!6132 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028712 d!123029))

(declare-fun b!1028940 () Bool)

(declare-fun e!580883 () SeekEntryResult!9670)

(declare-fun lt!453329 () SeekEntryResult!9670)

(assert (=> b!1028940 (= e!580883 (ite ((_ is MissingVacant!9670) lt!453329) (MissingZero!9670 (index!41054 lt!453329)) lt!453329))))

(declare-fun lt!453328 () SeekEntryResult!9670)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64609 (_ BitVec 32)) SeekEntryResult!9670)

(assert (=> b!1028940 (= lt!453329 (seekKeyOrZeroReturnVacant!0 (x!91539 lt!453328) (index!41053 lt!453328) (index!41053 lt!453328) key!909 (_keys!11264 thiss!1427) (mask!29850 thiss!1427)))))

(declare-fun b!1028941 () Bool)

(declare-fun e!580881 () SeekEntryResult!9670)

(assert (=> b!1028941 (= e!580881 Undefined!9670)))

(declare-fun b!1028943 () Bool)

(declare-fun c!103883 () Bool)

(declare-fun lt!453327 () (_ BitVec 64))

(assert (=> b!1028943 (= c!103883 (= lt!453327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580882 () SeekEntryResult!9670)

(assert (=> b!1028943 (= e!580882 e!580883)))

(declare-fun b!1028944 () Bool)

(assert (=> b!1028944 (= e!580881 e!580882)))

(assert (=> b!1028944 (= lt!453327 (select (arr!31110 (_keys!11264 thiss!1427)) (index!41053 lt!453328)))))

(declare-fun c!103881 () Bool)

(assert (=> b!1028944 (= c!103881 (= lt!453327 key!909))))

(declare-fun b!1028945 () Bool)

(assert (=> b!1028945 (= e!580882 (Found!9670 (index!41053 lt!453328)))))

(declare-fun d!123031 () Bool)

(declare-fun lt!453330 () SeekEntryResult!9670)

(assert (=> d!123031 (and (or ((_ is MissingVacant!9670) lt!453330) (not ((_ is Found!9670) lt!453330)) (and (bvsge (index!41052 lt!453330) #b00000000000000000000000000000000) (bvslt (index!41052 lt!453330) (size!31627 (_keys!11264 thiss!1427))))) (not ((_ is MissingVacant!9670) lt!453330)) (or (not ((_ is Found!9670) lt!453330)) (= (select (arr!31110 (_keys!11264 thiss!1427)) (index!41052 lt!453330)) key!909)))))

(assert (=> d!123031 (= lt!453330 e!580881)))

(declare-fun c!103882 () Bool)

(assert (=> d!123031 (= c!103882 (and ((_ is Intermediate!9670) lt!453328) (undefined!10482 lt!453328)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64609 (_ BitVec 32)) SeekEntryResult!9670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123031 (= lt!453328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29850 thiss!1427)) key!909 (_keys!11264 thiss!1427) (mask!29850 thiss!1427)))))

(assert (=> d!123031 (validMask!0 (mask!29850 thiss!1427))))

(assert (=> d!123031 (= (seekEntry!0 key!909 (_keys!11264 thiss!1427) (mask!29850 thiss!1427)) lt!453330)))

(declare-fun b!1028942 () Bool)

(assert (=> b!1028942 (= e!580883 (MissingZero!9670 (index!41053 lt!453328)))))

(assert (= (and d!123031 c!103882) b!1028941))

(assert (= (and d!123031 (not c!103882)) b!1028944))

(assert (= (and b!1028944 c!103881) b!1028945))

(assert (= (and b!1028944 (not c!103881)) b!1028943))

(assert (= (and b!1028943 c!103883) b!1028942))

(assert (= (and b!1028943 (not c!103883)) b!1028940))

(declare-fun m!947605 () Bool)

(assert (=> b!1028940 m!947605))

(declare-fun m!947607 () Bool)

(assert (=> b!1028944 m!947607))

(declare-fun m!947609 () Bool)

(assert (=> d!123031 m!947609))

(declare-fun m!947611 () Bool)

(assert (=> d!123031 m!947611))

(assert (=> d!123031 m!947611))

(declare-fun m!947613 () Bool)

(assert (=> d!123031 m!947613))

(assert (=> d!123031 m!947449))

(assert (=> b!1028710 d!123031))

(declare-fun d!123033 () Bool)

(declare-fun res!688390 () Bool)

(declare-fun e!580886 () Bool)

(assert (=> d!123033 (=> (not res!688390) (not e!580886))))

(declare-fun simpleValid!393 (LongMapFixedSize!5494) Bool)

(assert (=> d!123033 (= res!688390 (simpleValid!393 thiss!1427))))

(assert (=> d!123033 (= (valid!2073 thiss!1427) e!580886)))

(declare-fun b!1028952 () Bool)

(declare-fun res!688391 () Bool)

(assert (=> b!1028952 (=> (not res!688391) (not e!580886))))

(assert (=> b!1028952 (= res!688391 (= (arrayCountValidKeys!0 (_keys!11264 thiss!1427) #b00000000000000000000000000000000 (size!31627 (_keys!11264 thiss!1427))) (_size!2802 thiss!1427)))))

(declare-fun b!1028953 () Bool)

(declare-fun res!688392 () Bool)

(assert (=> b!1028953 (=> (not res!688392) (not e!580886))))

(assert (=> b!1028953 (= res!688392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11264 thiss!1427) (mask!29850 thiss!1427)))))

(declare-fun b!1028954 () Bool)

(assert (=> b!1028954 (= e!580886 (arrayNoDuplicates!0 (_keys!11264 thiss!1427) #b00000000000000000000000000000000 Nil!21850))))

(assert (= (and d!123033 res!688390) b!1028952))

(assert (= (and b!1028952 res!688391) b!1028953))

(assert (= (and b!1028953 res!688392) b!1028954))

(declare-fun m!947615 () Bool)

(assert (=> d!123033 m!947615))

(assert (=> b!1028952 m!947325))

(declare-fun m!947617 () Bool)

(assert (=> b!1028953 m!947617))

(declare-fun m!947619 () Bool)

(assert (=> b!1028954 m!947619))

(assert (=> start!89766 d!123033))

(declare-fun b!1028961 () Bool)

(declare-fun e!580892 () Bool)

(assert (=> b!1028961 (= e!580892 tp_is_empty!24307)))

(declare-fun b!1028962 () Bool)

(declare-fun e!580891 () Bool)

(assert (=> b!1028962 (= e!580891 tp_is_empty!24307)))

(declare-fun mapNonEmpty!37909 () Bool)

(declare-fun mapRes!37909 () Bool)

(declare-fun tp!72833 () Bool)

(assert (=> mapNonEmpty!37909 (= mapRes!37909 (and tp!72833 e!580892))))

(declare-fun mapKey!37909 () (_ BitVec 32))

(declare-fun mapValue!37909 () ValueCell!11450)

(declare-fun mapRest!37909 () (Array (_ BitVec 32) ValueCell!11450))

(assert (=> mapNonEmpty!37909 (= mapRest!37900 (store mapRest!37909 mapKey!37909 mapValue!37909))))

(declare-fun mapIsEmpty!37909 () Bool)

(assert (=> mapIsEmpty!37909 mapRes!37909))

(declare-fun condMapEmpty!37909 () Bool)

(declare-fun mapDefault!37909 () ValueCell!11450)

(assert (=> mapNonEmpty!37900 (= condMapEmpty!37909 (= mapRest!37900 ((as const (Array (_ BitVec 32) ValueCell!11450)) mapDefault!37909)))))

(assert (=> mapNonEmpty!37900 (= tp!72818 (and e!580891 mapRes!37909))))

(assert (= (and mapNonEmpty!37900 condMapEmpty!37909) mapIsEmpty!37909))

(assert (= (and mapNonEmpty!37900 (not condMapEmpty!37909)) mapNonEmpty!37909))

(assert (= (and mapNonEmpty!37909 ((_ is ValueCellFull!11450) mapValue!37909)) b!1028961))

(assert (= (and mapNonEmpty!37900 ((_ is ValueCellFull!11450) mapDefault!37909)) b!1028962))

(declare-fun m!947621 () Bool)

(assert (=> mapNonEmpty!37909 m!947621))

(declare-fun b_lambda!15819 () Bool)

(assert (= b_lambda!15815 (or (and b!1028712 b_free!20587) b_lambda!15819)))

(declare-fun b_lambda!15821 () Bool)

(assert (= b_lambda!15813 (or (and b!1028712 b_free!20587) b_lambda!15821)))

(declare-fun b_lambda!15823 () Bool)

(assert (= b_lambda!15817 (or (and b!1028712 b_free!20587) b_lambda!15823)))

(check-sat (not b!1028924) (not b!1028887) (not b!1028892) (not b!1028836) (not b!1028953) (not d!123019) (not b!1028896) (not b!1028776) (not b!1028920) (not b!1028832) (not b_lambda!15811) (not b!1028954) (not bm!43391) (not bm!43401) (not b!1028851) (not b!1028857) (not b!1028849) (not d!123003) b_and!32883 (not b!1028893) (not b!1028940) (not b!1028889) (not d!123021) (not b!1028927) (not d!123005) (not b!1028819) (not d!123033) (not d!123015) (not bm!43388) (not b!1028900) (not b!1028822) (not b!1028830) (not bm!43387) (not b!1028823) (not bm!43408) (not bm!43398) (not b!1028880) (not b!1028848) (not b!1028826) (not b!1028923) (not mapNonEmpty!37909) (not b_lambda!15821) (not b!1028773) (not bm!43390) (not b_next!20587) tp_is_empty!24307 (not b!1028906) (not b!1028869) (not d!123001) (not b_lambda!15819) (not b!1028884) (not bm!43404) (not b!1028902) (not d!123025) (not bm!43405) (not d!123031) (not b_lambda!15823) (not d!122999) (not bm!43402) (not bm!43394) (not b!1028909) (not bm!43397) (not b!1028839) (not b!1028952) (not b!1028866))
(check-sat b_and!32883 (not b_next!20587))
