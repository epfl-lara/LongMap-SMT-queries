; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18144 () Bool)

(assert start!18144)

(declare-fun b!180661 () Bool)

(declare-fun b_free!4465 () Bool)

(declare-fun b_next!4465 () Bool)

(assert (=> b!180661 (= b_free!4465 (not b_next!4465))))

(declare-fun tp!16135 () Bool)

(declare-fun b_and!11015 () Bool)

(assert (=> b!180661 (= tp!16135 b_and!11015)))

(declare-fun b!180653 () Bool)

(declare-fun e!119000 () Bool)

(declare-fun tp_is_empty!4237 () Bool)

(assert (=> b!180653 (= e!119000 tp_is_empty!4237)))

(declare-fun b!180654 () Bool)

(declare-fun res!85558 () Bool)

(declare-fun e!119004 () Bool)

(assert (=> b!180654 (=> (not res!85558) (not e!119004))))

(declare-datatypes ((V!5297 0))(
  ( (V!5298 (val!2163 Int)) )
))
(declare-datatypes ((ValueCell!1775 0))(
  ( (ValueCellFull!1775 (v!4058 V!5297)) (EmptyCell!1775) )
))
(declare-datatypes ((array!7635 0))(
  ( (array!7636 (arr!3614 (Array (_ BitVec 32) (_ BitVec 64))) (size!3922 (_ BitVec 32))) )
))
(declare-datatypes ((array!7637 0))(
  ( (array!7638 (arr!3615 (Array (_ BitVec 32) ValueCell!1775)) (size!3923 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2458 0))(
  ( (LongMapFixedSize!2459 (defaultEntry!3706 Int) (mask!8711 (_ BitVec 32)) (extraKeys!3443 (_ BitVec 32)) (zeroValue!3547 V!5297) (minValue!3547 V!5297) (_size!1278 (_ BitVec 32)) (_keys!5600 array!7635) (_values!3689 array!7637) (_vacant!1278 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2458)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180654 (= res!85558 (validMask!0 (mask!8711 thiss!1248)))))

(declare-fun b!180655 () Bool)

(declare-fun res!85557 () Bool)

(declare-fun e!119003 () Bool)

(assert (=> b!180655 (=> (not res!85557) (not e!119003))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!180655 (= res!85557 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180656 () Bool)

(declare-fun e!118998 () Bool)

(assert (=> b!180656 (= e!118998 tp_is_empty!4237)))

(declare-fun b!180657 () Bool)

(assert (=> b!180657 (= e!119003 e!119004)))

(declare-fun res!85560 () Bool)

(assert (=> b!180657 (=> (not res!85560) (not e!119004))))

(declare-datatypes ((SeekEntryResult!589 0))(
  ( (MissingZero!589 (index!4526 (_ BitVec 32))) (Found!589 (index!4527 (_ BitVec 32))) (Intermediate!589 (undefined!1401 Bool) (index!4528 (_ BitVec 32)) (x!19741 (_ BitVec 32))) (Undefined!589) (MissingVacant!589 (index!4529 (_ BitVec 32))) )
))
(declare-fun lt!89329 () SeekEntryResult!589)

(get-info :version)

(assert (=> b!180657 (= res!85560 (and (not ((_ is Undefined!589) lt!89329)) (not ((_ is MissingVacant!589) lt!89329)) (not ((_ is MissingZero!589) lt!89329)) ((_ is Found!589) lt!89329)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7635 (_ BitVec 32)) SeekEntryResult!589)

(assert (=> b!180657 (= lt!89329 (seekEntryOrOpen!0 key!828 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)))))

(declare-fun mapIsEmpty!7258 () Bool)

(declare-fun mapRes!7258 () Bool)

(assert (=> mapIsEmpty!7258 mapRes!7258))

(declare-fun res!85561 () Bool)

(assert (=> start!18144 (=> (not res!85561) (not e!119003))))

(declare-fun valid!1046 (LongMapFixedSize!2458) Bool)

(assert (=> start!18144 (= res!85561 (valid!1046 thiss!1248))))

(assert (=> start!18144 e!119003))

(declare-fun e!118999 () Bool)

(assert (=> start!18144 e!118999))

(assert (=> start!18144 true))

(declare-fun b!180658 () Bool)

(declare-fun res!85559 () Bool)

(assert (=> b!180658 (=> (not res!85559) (not e!119004))))

(declare-datatypes ((tuple2!3324 0))(
  ( (tuple2!3325 (_1!1673 (_ BitVec 64)) (_2!1673 V!5297)) )
))
(declare-datatypes ((List!2269 0))(
  ( (Nil!2266) (Cons!2265 (h!2890 tuple2!3324) (t!7111 List!2269)) )
))
(declare-datatypes ((ListLongMap!2245 0))(
  ( (ListLongMap!2246 (toList!1138 List!2269)) )
))
(declare-fun contains!1226 (ListLongMap!2245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!790 (array!7635 array!7637 (_ BitVec 32) (_ BitVec 32) V!5297 V!5297 (_ BitVec 32) Int) ListLongMap!2245)

(assert (=> b!180658 (= res!85559 (contains!1226 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)) key!828))))

(declare-fun b!180659 () Bool)

(assert (=> b!180659 (= e!119004 (not (= (size!3923 (_values!3689 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8711 thiss!1248)))))))

(declare-fun b!180660 () Bool)

(declare-fun e!119002 () Bool)

(assert (=> b!180660 (= e!119002 (and e!118998 mapRes!7258))))

(declare-fun condMapEmpty!7258 () Bool)

(declare-fun mapDefault!7258 () ValueCell!1775)

(assert (=> b!180660 (= condMapEmpty!7258 (= (arr!3615 (_values!3689 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1775)) mapDefault!7258)))))

(declare-fun array_inv!2331 (array!7635) Bool)

(declare-fun array_inv!2332 (array!7637) Bool)

(assert (=> b!180661 (= e!118999 (and tp!16135 tp_is_empty!4237 (array_inv!2331 (_keys!5600 thiss!1248)) (array_inv!2332 (_values!3689 thiss!1248)) e!119002))))

(declare-fun mapNonEmpty!7258 () Bool)

(declare-fun tp!16134 () Bool)

(assert (=> mapNonEmpty!7258 (= mapRes!7258 (and tp!16134 e!119000))))

(declare-fun mapValue!7258 () ValueCell!1775)

(declare-fun mapKey!7258 () (_ BitVec 32))

(declare-fun mapRest!7258 () (Array (_ BitVec 32) ValueCell!1775))

(assert (=> mapNonEmpty!7258 (= (arr!3615 (_values!3689 thiss!1248)) (store mapRest!7258 mapKey!7258 mapValue!7258))))

(assert (= (and start!18144 res!85561) b!180655))

(assert (= (and b!180655 res!85557) b!180657))

(assert (= (and b!180657 res!85560) b!180658))

(assert (= (and b!180658 res!85559) b!180654))

(assert (= (and b!180654 res!85558) b!180659))

(assert (= (and b!180660 condMapEmpty!7258) mapIsEmpty!7258))

(assert (= (and b!180660 (not condMapEmpty!7258)) mapNonEmpty!7258))

(assert (= (and mapNonEmpty!7258 ((_ is ValueCellFull!1775) mapValue!7258)) b!180653))

(assert (= (and b!180660 ((_ is ValueCellFull!1775) mapDefault!7258)) b!180656))

(assert (= b!180661 b!180660))

(assert (= start!18144 b!180661))

(declare-fun m!208781 () Bool)

(assert (=> start!18144 m!208781))

(declare-fun m!208783 () Bool)

(assert (=> b!180661 m!208783))

(declare-fun m!208785 () Bool)

(assert (=> b!180661 m!208785))

(declare-fun m!208787 () Bool)

(assert (=> mapNonEmpty!7258 m!208787))

(declare-fun m!208789 () Bool)

(assert (=> b!180654 m!208789))

(declare-fun m!208791 () Bool)

(assert (=> b!180657 m!208791))

(declare-fun m!208793 () Bool)

(assert (=> b!180658 m!208793))

(assert (=> b!180658 m!208793))

(declare-fun m!208795 () Bool)

(assert (=> b!180658 m!208795))

(check-sat (not b_next!4465) (not b!180658) b_and!11015 (not mapNonEmpty!7258) (not b!180657) (not start!18144) tp_is_empty!4237 (not b!180661) (not b!180654))
(check-sat b_and!11015 (not b_next!4465))
(get-model)

(declare-fun b!180728 () Bool)

(declare-fun e!119054 () SeekEntryResult!589)

(assert (=> b!180728 (= e!119054 Undefined!589)))

(declare-fun d!54323 () Bool)

(declare-fun lt!89344 () SeekEntryResult!589)

(assert (=> d!54323 (and (or ((_ is Undefined!589) lt!89344) (not ((_ is Found!589) lt!89344)) (and (bvsge (index!4527 lt!89344) #b00000000000000000000000000000000) (bvslt (index!4527 lt!89344) (size!3922 (_keys!5600 thiss!1248))))) (or ((_ is Undefined!589) lt!89344) ((_ is Found!589) lt!89344) (not ((_ is MissingZero!589) lt!89344)) (and (bvsge (index!4526 lt!89344) #b00000000000000000000000000000000) (bvslt (index!4526 lt!89344) (size!3922 (_keys!5600 thiss!1248))))) (or ((_ is Undefined!589) lt!89344) ((_ is Found!589) lt!89344) ((_ is MissingZero!589) lt!89344) (not ((_ is MissingVacant!589) lt!89344)) (and (bvsge (index!4529 lt!89344) #b00000000000000000000000000000000) (bvslt (index!4529 lt!89344) (size!3922 (_keys!5600 thiss!1248))))) (or ((_ is Undefined!589) lt!89344) (ite ((_ is Found!589) lt!89344) (= (select (arr!3614 (_keys!5600 thiss!1248)) (index!4527 lt!89344)) key!828) (ite ((_ is MissingZero!589) lt!89344) (= (select (arr!3614 (_keys!5600 thiss!1248)) (index!4526 lt!89344)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!589) lt!89344) (= (select (arr!3614 (_keys!5600 thiss!1248)) (index!4529 lt!89344)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54323 (= lt!89344 e!119054)))

(declare-fun c!32364 () Bool)

(declare-fun lt!89343 () SeekEntryResult!589)

(assert (=> d!54323 (= c!32364 (and ((_ is Intermediate!589) lt!89343) (undefined!1401 lt!89343)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7635 (_ BitVec 32)) SeekEntryResult!589)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54323 (= lt!89343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8711 thiss!1248)) key!828 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)))))

(assert (=> d!54323 (validMask!0 (mask!8711 thiss!1248))))

(assert (=> d!54323 (= (seekEntryOrOpen!0 key!828 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)) lt!89344)))

(declare-fun b!180729 () Bool)

(declare-fun e!119053 () SeekEntryResult!589)

(assert (=> b!180729 (= e!119054 e!119053)))

(declare-fun lt!89342 () (_ BitVec 64))

(assert (=> b!180729 (= lt!89342 (select (arr!3614 (_keys!5600 thiss!1248)) (index!4528 lt!89343)))))

(declare-fun c!32363 () Bool)

(assert (=> b!180729 (= c!32363 (= lt!89342 key!828))))

(declare-fun b!180730 () Bool)

(declare-fun e!119055 () SeekEntryResult!589)

(assert (=> b!180730 (= e!119055 (MissingZero!589 (index!4528 lt!89343)))))

(declare-fun b!180731 () Bool)

(declare-fun c!32362 () Bool)

(assert (=> b!180731 (= c!32362 (= lt!89342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180731 (= e!119053 e!119055)))

(declare-fun b!180732 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7635 (_ BitVec 32)) SeekEntryResult!589)

(assert (=> b!180732 (= e!119055 (seekKeyOrZeroReturnVacant!0 (x!19741 lt!89343) (index!4528 lt!89343) (index!4528 lt!89343) key!828 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)))))

(declare-fun b!180733 () Bool)

(assert (=> b!180733 (= e!119053 (Found!589 (index!4528 lt!89343)))))

(assert (= (and d!54323 c!32364) b!180728))

(assert (= (and d!54323 (not c!32364)) b!180729))

(assert (= (and b!180729 c!32363) b!180733))

(assert (= (and b!180729 (not c!32363)) b!180731))

(assert (= (and b!180731 c!32362) b!180730))

(assert (= (and b!180731 (not c!32362)) b!180732))

(declare-fun m!208829 () Bool)

(assert (=> d!54323 m!208829))

(declare-fun m!208831 () Bool)

(assert (=> d!54323 m!208831))

(assert (=> d!54323 m!208789))

(declare-fun m!208833 () Bool)

(assert (=> d!54323 m!208833))

(declare-fun m!208835 () Bool)

(assert (=> d!54323 m!208835))

(assert (=> d!54323 m!208833))

(declare-fun m!208837 () Bool)

(assert (=> d!54323 m!208837))

(declare-fun m!208839 () Bool)

(assert (=> b!180729 m!208839))

(declare-fun m!208841 () Bool)

(assert (=> b!180732 m!208841))

(assert (=> b!180657 d!54323))

(declare-fun d!54325 () Bool)

(assert (=> d!54325 (= (array_inv!2331 (_keys!5600 thiss!1248)) (bvsge (size!3922 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180661 d!54325))

(declare-fun d!54327 () Bool)

(assert (=> d!54327 (= (array_inv!2332 (_values!3689 thiss!1248)) (bvsge (size!3923 (_values!3689 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180661 d!54327))

(declare-fun d!54329 () Bool)

(declare-fun res!85598 () Bool)

(declare-fun e!119058 () Bool)

(assert (=> d!54329 (=> (not res!85598) (not e!119058))))

(declare-fun simpleValid!166 (LongMapFixedSize!2458) Bool)

(assert (=> d!54329 (= res!85598 (simpleValid!166 thiss!1248))))

(assert (=> d!54329 (= (valid!1046 thiss!1248) e!119058)))

(declare-fun b!180740 () Bool)

(declare-fun res!85599 () Bool)

(assert (=> b!180740 (=> (not res!85599) (not e!119058))))

(declare-fun arrayCountValidKeys!0 (array!7635 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180740 (= res!85599 (= (arrayCountValidKeys!0 (_keys!5600 thiss!1248) #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))) (_size!1278 thiss!1248)))))

(declare-fun b!180741 () Bool)

(declare-fun res!85600 () Bool)

(assert (=> b!180741 (=> (not res!85600) (not e!119058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7635 (_ BitVec 32)) Bool)

(assert (=> b!180741 (= res!85600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)))))

(declare-fun b!180742 () Bool)

(declare-datatypes ((List!2271 0))(
  ( (Nil!2268) (Cons!2267 (h!2892 (_ BitVec 64)) (t!7115 List!2271)) )
))
(declare-fun arrayNoDuplicates!0 (array!7635 (_ BitVec 32) List!2271) Bool)

(assert (=> b!180742 (= e!119058 (arrayNoDuplicates!0 (_keys!5600 thiss!1248) #b00000000000000000000000000000000 Nil!2268))))

(assert (= (and d!54329 res!85598) b!180740))

(assert (= (and b!180740 res!85599) b!180741))

(assert (= (and b!180741 res!85600) b!180742))

(declare-fun m!208843 () Bool)

(assert (=> d!54329 m!208843))

(declare-fun m!208845 () Bool)

(assert (=> b!180740 m!208845))

(declare-fun m!208847 () Bool)

(assert (=> b!180741 m!208847))

(declare-fun m!208849 () Bool)

(assert (=> b!180742 m!208849))

(assert (=> start!18144 d!54329))

(declare-fun d!54331 () Bool)

(assert (=> d!54331 (= (validMask!0 (mask!8711 thiss!1248)) (and (or (= (mask!8711 thiss!1248) #b00000000000000000000000000000111) (= (mask!8711 thiss!1248) #b00000000000000000000000000001111) (= (mask!8711 thiss!1248) #b00000000000000000000000000011111) (= (mask!8711 thiss!1248) #b00000000000000000000000000111111) (= (mask!8711 thiss!1248) #b00000000000000000000000001111111) (= (mask!8711 thiss!1248) #b00000000000000000000000011111111) (= (mask!8711 thiss!1248) #b00000000000000000000000111111111) (= (mask!8711 thiss!1248) #b00000000000000000000001111111111) (= (mask!8711 thiss!1248) #b00000000000000000000011111111111) (= (mask!8711 thiss!1248) #b00000000000000000000111111111111) (= (mask!8711 thiss!1248) #b00000000000000000001111111111111) (= (mask!8711 thiss!1248) #b00000000000000000011111111111111) (= (mask!8711 thiss!1248) #b00000000000000000111111111111111) (= (mask!8711 thiss!1248) #b00000000000000001111111111111111) (= (mask!8711 thiss!1248) #b00000000000000011111111111111111) (= (mask!8711 thiss!1248) #b00000000000000111111111111111111) (= (mask!8711 thiss!1248) #b00000000000001111111111111111111) (= (mask!8711 thiss!1248) #b00000000000011111111111111111111) (= (mask!8711 thiss!1248) #b00000000000111111111111111111111) (= (mask!8711 thiss!1248) #b00000000001111111111111111111111) (= (mask!8711 thiss!1248) #b00000000011111111111111111111111) (= (mask!8711 thiss!1248) #b00000000111111111111111111111111) (= (mask!8711 thiss!1248) #b00000001111111111111111111111111) (= (mask!8711 thiss!1248) #b00000011111111111111111111111111) (= (mask!8711 thiss!1248) #b00000111111111111111111111111111) (= (mask!8711 thiss!1248) #b00001111111111111111111111111111) (= (mask!8711 thiss!1248) #b00011111111111111111111111111111) (= (mask!8711 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8711 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!180654 d!54331))

(declare-fun d!54333 () Bool)

(declare-fun e!119063 () Bool)

(assert (=> d!54333 e!119063))

(declare-fun res!85603 () Bool)

(assert (=> d!54333 (=> res!85603 e!119063)))

(declare-fun lt!89353 () Bool)

(assert (=> d!54333 (= res!85603 (not lt!89353))))

(declare-fun lt!89354 () Bool)

(assert (=> d!54333 (= lt!89353 lt!89354)))

(declare-datatypes ((Unit!5496 0))(
  ( (Unit!5497) )
))
(declare-fun lt!89356 () Unit!5496)

(declare-fun e!119064 () Unit!5496)

(assert (=> d!54333 (= lt!89356 e!119064)))

(declare-fun c!32367 () Bool)

(assert (=> d!54333 (= c!32367 lt!89354)))

(declare-fun containsKey!211 (List!2269 (_ BitVec 64)) Bool)

(assert (=> d!54333 (= lt!89354 (containsKey!211 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(assert (=> d!54333 (= (contains!1226 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)) key!828) lt!89353)))

(declare-fun b!180749 () Bool)

(declare-fun lt!89355 () Unit!5496)

(assert (=> b!180749 (= e!119064 lt!89355)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!159 (List!2269 (_ BitVec 64)) Unit!5496)

(assert (=> b!180749 (= lt!89355 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(declare-datatypes ((Option!214 0))(
  ( (Some!213 (v!4061 V!5297)) (None!212) )
))
(declare-fun isDefined!160 (Option!214) Bool)

(declare-fun getValueByKey!208 (List!2269 (_ BitVec 64)) Option!214)

(assert (=> b!180749 (isDefined!160 (getValueByKey!208 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(declare-fun b!180750 () Bool)

(declare-fun Unit!5498 () Unit!5496)

(assert (=> b!180750 (= e!119064 Unit!5498)))

(declare-fun b!180751 () Bool)

(assert (=> b!180751 (= e!119063 (isDefined!160 (getValueByKey!208 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828)))))

(assert (= (and d!54333 c!32367) b!180749))

(assert (= (and d!54333 (not c!32367)) b!180750))

(assert (= (and d!54333 (not res!85603)) b!180751))

(declare-fun m!208851 () Bool)

(assert (=> d!54333 m!208851))

(declare-fun m!208853 () Bool)

(assert (=> b!180749 m!208853))

(declare-fun m!208855 () Bool)

(assert (=> b!180749 m!208855))

(assert (=> b!180749 m!208855))

(declare-fun m!208857 () Bool)

(assert (=> b!180749 m!208857))

(assert (=> b!180751 m!208855))

(assert (=> b!180751 m!208855))

(assert (=> b!180751 m!208857))

(assert (=> b!180658 d!54333))

(declare-fun bm!18256 () Bool)

(declare-fun c!32385 () Bool)

(declare-fun call!18265 () ListLongMap!2245)

(declare-fun c!32383 () Bool)

(declare-fun call!18264 () ListLongMap!2245)

(declare-fun call!18260 () ListLongMap!2245)

(declare-fun call!18261 () ListLongMap!2245)

(declare-fun +!270 (ListLongMap!2245 tuple2!3324) ListLongMap!2245)

(assert (=> bm!18256 (= call!18261 (+!270 (ite c!32383 call!18264 (ite c!32385 call!18260 call!18265)) (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(declare-fun b!180794 () Bool)

(declare-fun e!119099 () Bool)

(declare-fun lt!89420 () ListLongMap!2245)

(declare-fun apply!150 (ListLongMap!2245 (_ BitVec 64)) V!5297)

(declare-fun get!2073 (ValueCell!1775 V!5297) V!5297)

(declare-fun dynLambda!493 (Int (_ BitVec 64)) V!5297)

(assert (=> b!180794 (= e!119099 (= (apply!150 lt!89420 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)) (get!2073 (select (arr!3615 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3923 (_values!3689 thiss!1248))))))

(assert (=> b!180794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(declare-fun b!180795 () Bool)

(declare-fun e!119091 () Bool)

(declare-fun e!119098 () Bool)

(assert (=> b!180795 (= e!119091 e!119098)))

(declare-fun res!85629 () Bool)

(declare-fun call!18263 () Bool)

(assert (=> b!180795 (= res!85629 call!18263)))

(assert (=> b!180795 (=> (not res!85629) (not e!119098))))

(declare-fun b!180796 () Bool)

(declare-fun e!119102 () Unit!5496)

(declare-fun lt!89403 () Unit!5496)

(assert (=> b!180796 (= e!119102 lt!89403)))

(declare-fun lt!89407 () ListLongMap!2245)

(declare-fun getCurrentListMapNoExtraKeys!181 (array!7635 array!7637 (_ BitVec 32) (_ BitVec 32) V!5297 V!5297 (_ BitVec 32) Int) ListLongMap!2245)

(assert (=> b!180796 (= lt!89407 (getCurrentListMapNoExtraKeys!181 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun lt!89415 () (_ BitVec 64))

(assert (=> b!180796 (= lt!89415 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89405 () (_ BitVec 64))

(assert (=> b!180796 (= lt!89405 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89408 () Unit!5496)

(declare-fun addStillContains!126 (ListLongMap!2245 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5496)

(assert (=> b!180796 (= lt!89408 (addStillContains!126 lt!89407 lt!89415 (zeroValue!3547 thiss!1248) lt!89405))))

(assert (=> b!180796 (contains!1226 (+!270 lt!89407 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248))) lt!89405)))

(declare-fun lt!89402 () Unit!5496)

(assert (=> b!180796 (= lt!89402 lt!89408)))

(declare-fun lt!89417 () ListLongMap!2245)

(assert (=> b!180796 (= lt!89417 (getCurrentListMapNoExtraKeys!181 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun lt!89401 () (_ BitVec 64))

(assert (=> b!180796 (= lt!89401 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89413 () (_ BitVec 64))

(assert (=> b!180796 (= lt!89413 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89410 () Unit!5496)

(declare-fun addApplyDifferent!126 (ListLongMap!2245 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5496)

(assert (=> b!180796 (= lt!89410 (addApplyDifferent!126 lt!89417 lt!89401 (minValue!3547 thiss!1248) lt!89413))))

(assert (=> b!180796 (= (apply!150 (+!270 lt!89417 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248))) lt!89413) (apply!150 lt!89417 lt!89413))))

(declare-fun lt!89412 () Unit!5496)

(assert (=> b!180796 (= lt!89412 lt!89410)))

(declare-fun lt!89419 () ListLongMap!2245)

(assert (=> b!180796 (= lt!89419 (getCurrentListMapNoExtraKeys!181 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun lt!89422 () (_ BitVec 64))

(assert (=> b!180796 (= lt!89422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89406 () (_ BitVec 64))

(assert (=> b!180796 (= lt!89406 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89418 () Unit!5496)

(assert (=> b!180796 (= lt!89418 (addApplyDifferent!126 lt!89419 lt!89422 (zeroValue!3547 thiss!1248) lt!89406))))

(assert (=> b!180796 (= (apply!150 (+!270 lt!89419 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248))) lt!89406) (apply!150 lt!89419 lt!89406))))

(declare-fun lt!89421 () Unit!5496)

(assert (=> b!180796 (= lt!89421 lt!89418)))

(declare-fun lt!89414 () ListLongMap!2245)

(assert (=> b!180796 (= lt!89414 (getCurrentListMapNoExtraKeys!181 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun lt!89404 () (_ BitVec 64))

(assert (=> b!180796 (= lt!89404 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89411 () (_ BitVec 64))

(assert (=> b!180796 (= lt!89411 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180796 (= lt!89403 (addApplyDifferent!126 lt!89414 lt!89404 (minValue!3547 thiss!1248) lt!89411))))

(assert (=> b!180796 (= (apply!150 (+!270 lt!89414 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248))) lt!89411) (apply!150 lt!89414 lt!89411))))

(declare-fun b!180797 () Bool)

(declare-fun res!85623 () Bool)

(declare-fun e!119101 () Bool)

(assert (=> b!180797 (=> (not res!85623) (not e!119101))))

(declare-fun e!119097 () Bool)

(assert (=> b!180797 (= res!85623 e!119097)))

(declare-fun res!85624 () Bool)

(assert (=> b!180797 (=> res!85624 e!119097)))

(declare-fun e!119100 () Bool)

(assert (=> b!180797 (= res!85624 (not e!119100))))

(declare-fun res!85622 () Bool)

(assert (=> b!180797 (=> (not res!85622) (not e!119100))))

(assert (=> b!180797 (= res!85622 (bvslt #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(declare-fun bm!18257 () Bool)

(declare-fun call!18259 () ListLongMap!2245)

(assert (=> bm!18257 (= call!18259 call!18261)))

(declare-fun b!180798 () Bool)

(declare-fun e!119094 () ListLongMap!2245)

(assert (=> b!180798 (= e!119094 call!18265)))

(declare-fun b!180799 () Bool)

(declare-fun e!119103 () ListLongMap!2245)

(assert (=> b!180799 (= e!119103 (+!270 call!18261 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))

(declare-fun b!180801 () Bool)

(declare-fun e!119093 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!180801 (= e!119093 (validKeyInArray!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18258 () Bool)

(assert (=> bm!18258 (= call!18263 (contains!1226 lt!89420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180802 () Bool)

(declare-fun e!119092 () ListLongMap!2245)

(assert (=> b!180802 (= e!119092 call!18259)))

(declare-fun b!180803 () Bool)

(assert (=> b!180803 (= e!119097 e!119099)))

(declare-fun res!85627 () Bool)

(assert (=> b!180803 (=> (not res!85627) (not e!119099))))

(assert (=> b!180803 (= res!85627 (contains!1226 lt!89420 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(declare-fun b!180804 () Bool)

(assert (=> b!180804 (= e!119094 call!18259)))

(declare-fun bm!18259 () Bool)

(declare-fun call!18262 () Bool)

(assert (=> bm!18259 (= call!18262 (contains!1226 lt!89420 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180805 () Bool)

(declare-fun Unit!5499 () Unit!5496)

(assert (=> b!180805 (= e!119102 Unit!5499)))

(declare-fun b!180806 () Bool)

(declare-fun res!85625 () Bool)

(assert (=> b!180806 (=> (not res!85625) (not e!119101))))

(assert (=> b!180806 (= res!85625 e!119091)))

(declare-fun c!32384 () Bool)

(assert (=> b!180806 (= c!32384 (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18260 () Bool)

(assert (=> bm!18260 (= call!18264 (getCurrentListMapNoExtraKeys!181 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun b!180807 () Bool)

(declare-fun c!32382 () Bool)

(assert (=> b!180807 (= c!32382 (and (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!180807 (= e!119092 e!119094)))

(declare-fun b!180808 () Bool)

(assert (=> b!180808 (= e!119098 (= (apply!150 lt!89420 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3547 thiss!1248)))))

(declare-fun bm!18261 () Bool)

(assert (=> bm!18261 (= call!18260 call!18264)))

(declare-fun bm!18262 () Bool)

(assert (=> bm!18262 (= call!18265 call!18260)))

(declare-fun b!180809 () Bool)

(assert (=> b!180809 (= e!119103 e!119092)))

(assert (=> b!180809 (= c!32385 (and (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!180800 () Bool)

(assert (=> b!180800 (= e!119091 (not call!18263))))

(declare-fun d!54335 () Bool)

(assert (=> d!54335 e!119101))

(declare-fun res!85628 () Bool)

(assert (=> d!54335 (=> (not res!85628) (not e!119101))))

(assert (=> d!54335 (= res!85628 (or (bvsge #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))))

(declare-fun lt!89416 () ListLongMap!2245)

(assert (=> d!54335 (= lt!89420 lt!89416)))

(declare-fun lt!89409 () Unit!5496)

(assert (=> d!54335 (= lt!89409 e!119102)))

(declare-fun c!32380 () Bool)

(assert (=> d!54335 (= c!32380 e!119093)))

(declare-fun res!85626 () Bool)

(assert (=> d!54335 (=> (not res!85626) (not e!119093))))

(assert (=> d!54335 (= res!85626 (bvslt #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(assert (=> d!54335 (= lt!89416 e!119103)))

(assert (=> d!54335 (= c!32383 (and (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54335 (validMask!0 (mask!8711 thiss!1248))))

(assert (=> d!54335 (= (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)) lt!89420)))

(declare-fun b!180810 () Bool)

(declare-fun e!119095 () Bool)

(assert (=> b!180810 (= e!119095 (= (apply!150 lt!89420 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3547 thiss!1248)))))

(declare-fun b!180811 () Bool)

(declare-fun e!119096 () Bool)

(assert (=> b!180811 (= e!119096 e!119095)))

(declare-fun res!85630 () Bool)

(assert (=> b!180811 (= res!85630 call!18262)))

(assert (=> b!180811 (=> (not res!85630) (not e!119095))))

(declare-fun b!180812 () Bool)

(assert (=> b!180812 (= e!119101 e!119096)))

(declare-fun c!32381 () Bool)

(assert (=> b!180812 (= c!32381 (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!180813 () Bool)

(assert (=> b!180813 (= e!119100 (validKeyInArray!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180814 () Bool)

(assert (=> b!180814 (= e!119096 (not call!18262))))

(assert (= (and d!54335 c!32383) b!180799))

(assert (= (and d!54335 (not c!32383)) b!180809))

(assert (= (and b!180809 c!32385) b!180802))

(assert (= (and b!180809 (not c!32385)) b!180807))

(assert (= (and b!180807 c!32382) b!180804))

(assert (= (and b!180807 (not c!32382)) b!180798))

(assert (= (or b!180804 b!180798) bm!18262))

(assert (= (or b!180802 bm!18262) bm!18261))

(assert (= (or b!180802 b!180804) bm!18257))

(assert (= (or b!180799 bm!18261) bm!18260))

(assert (= (or b!180799 bm!18257) bm!18256))

(assert (= (and d!54335 res!85626) b!180801))

(assert (= (and d!54335 c!32380) b!180796))

(assert (= (and d!54335 (not c!32380)) b!180805))

(assert (= (and d!54335 res!85628) b!180797))

(assert (= (and b!180797 res!85622) b!180813))

(assert (= (and b!180797 (not res!85624)) b!180803))

(assert (= (and b!180803 res!85627) b!180794))

(assert (= (and b!180797 res!85623) b!180806))

(assert (= (and b!180806 c!32384) b!180795))

(assert (= (and b!180806 (not c!32384)) b!180800))

(assert (= (and b!180795 res!85629) b!180808))

(assert (= (or b!180795 b!180800) bm!18258))

(assert (= (and b!180806 res!85625) b!180812))

(assert (= (and b!180812 c!32381) b!180811))

(assert (= (and b!180812 (not c!32381)) b!180814))

(assert (= (and b!180811 res!85630) b!180810))

(assert (= (or b!180811 b!180814) bm!18259))

(declare-fun b_lambda!7145 () Bool)

(assert (=> (not b_lambda!7145) (not b!180794)))

(declare-fun t!7114 () Bool)

(declare-fun tb!2803 () Bool)

(assert (=> (and b!180661 (= (defaultEntry!3706 thiss!1248) (defaultEntry!3706 thiss!1248)) t!7114) tb!2803))

(declare-fun result!4703 () Bool)

(assert (=> tb!2803 (= result!4703 tp_is_empty!4237)))

(assert (=> b!180794 t!7114))

(declare-fun b_and!11021 () Bool)

(assert (= b_and!11015 (and (=> t!7114 result!4703) b_and!11021)))

(declare-fun m!208859 () Bool)

(assert (=> bm!18258 m!208859))

(declare-fun m!208861 () Bool)

(assert (=> b!180808 m!208861))

(declare-fun m!208863 () Bool)

(assert (=> b!180799 m!208863))

(declare-fun m!208865 () Bool)

(assert (=> bm!18256 m!208865))

(declare-fun m!208867 () Bool)

(assert (=> b!180813 m!208867))

(assert (=> b!180813 m!208867))

(declare-fun m!208869 () Bool)

(assert (=> b!180813 m!208869))

(declare-fun m!208871 () Bool)

(assert (=> bm!18259 m!208871))

(declare-fun m!208873 () Bool)

(assert (=> b!180810 m!208873))

(declare-fun m!208875 () Bool)

(assert (=> b!180796 m!208875))

(declare-fun m!208877 () Bool)

(assert (=> b!180796 m!208877))

(declare-fun m!208879 () Bool)

(assert (=> b!180796 m!208879))

(declare-fun m!208881 () Bool)

(assert (=> b!180796 m!208881))

(declare-fun m!208883 () Bool)

(assert (=> b!180796 m!208883))

(declare-fun m!208885 () Bool)

(assert (=> b!180796 m!208885))

(declare-fun m!208887 () Bool)

(assert (=> b!180796 m!208887))

(declare-fun m!208889 () Bool)

(assert (=> b!180796 m!208889))

(assert (=> b!180796 m!208867))

(declare-fun m!208891 () Bool)

(assert (=> b!180796 m!208891))

(assert (=> b!180796 m!208887))

(assert (=> b!180796 m!208879))

(declare-fun m!208893 () Bool)

(assert (=> b!180796 m!208893))

(declare-fun m!208895 () Bool)

(assert (=> b!180796 m!208895))

(declare-fun m!208897 () Bool)

(assert (=> b!180796 m!208897))

(declare-fun m!208899 () Bool)

(assert (=> b!180796 m!208899))

(assert (=> b!180796 m!208891))

(declare-fun m!208901 () Bool)

(assert (=> b!180796 m!208901))

(assert (=> b!180796 m!208875))

(declare-fun m!208903 () Bool)

(assert (=> b!180796 m!208903))

(declare-fun m!208905 () Bool)

(assert (=> b!180796 m!208905))

(declare-fun m!208907 () Bool)

(assert (=> b!180794 m!208907))

(assert (=> b!180794 m!208867))

(declare-fun m!208909 () Bool)

(assert (=> b!180794 m!208909))

(assert (=> b!180794 m!208867))

(declare-fun m!208911 () Bool)

(assert (=> b!180794 m!208911))

(assert (=> b!180794 m!208907))

(declare-fun m!208913 () Bool)

(assert (=> b!180794 m!208913))

(assert (=> b!180794 m!208911))

(assert (=> b!180801 m!208867))

(assert (=> b!180801 m!208867))

(assert (=> b!180801 m!208869))

(assert (=> b!180803 m!208867))

(assert (=> b!180803 m!208867))

(declare-fun m!208915 () Bool)

(assert (=> b!180803 m!208915))

(assert (=> d!54335 m!208789))

(assert (=> bm!18260 m!208905))

(assert (=> b!180658 d!54335))

(declare-fun condMapEmpty!7267 () Bool)

(declare-fun mapDefault!7267 () ValueCell!1775)

(assert (=> mapNonEmpty!7258 (= condMapEmpty!7267 (= mapRest!7258 ((as const (Array (_ BitVec 32) ValueCell!1775)) mapDefault!7267)))))

(declare-fun e!119109 () Bool)

(declare-fun mapRes!7267 () Bool)

(assert (=> mapNonEmpty!7258 (= tp!16134 (and e!119109 mapRes!7267))))

(declare-fun mapIsEmpty!7267 () Bool)

(assert (=> mapIsEmpty!7267 mapRes!7267))

(declare-fun b!180823 () Bool)

(declare-fun e!119108 () Bool)

(assert (=> b!180823 (= e!119108 tp_is_empty!4237)))

(declare-fun b!180824 () Bool)

(assert (=> b!180824 (= e!119109 tp_is_empty!4237)))

(declare-fun mapNonEmpty!7267 () Bool)

(declare-fun tp!16150 () Bool)

(assert (=> mapNonEmpty!7267 (= mapRes!7267 (and tp!16150 e!119108))))

(declare-fun mapValue!7267 () ValueCell!1775)

(declare-fun mapKey!7267 () (_ BitVec 32))

(declare-fun mapRest!7267 () (Array (_ BitVec 32) ValueCell!1775))

(assert (=> mapNonEmpty!7267 (= mapRest!7258 (store mapRest!7267 mapKey!7267 mapValue!7267))))

(assert (= (and mapNonEmpty!7258 condMapEmpty!7267) mapIsEmpty!7267))

(assert (= (and mapNonEmpty!7258 (not condMapEmpty!7267)) mapNonEmpty!7267))

(assert (= (and mapNonEmpty!7267 ((_ is ValueCellFull!1775) mapValue!7267)) b!180823))

(assert (= (and mapNonEmpty!7258 ((_ is ValueCellFull!1775) mapDefault!7267)) b!180824))

(declare-fun m!208917 () Bool)

(assert (=> mapNonEmpty!7267 m!208917))

(declare-fun b_lambda!7147 () Bool)

(assert (= b_lambda!7145 (or (and b!180661 b_free!4465) b_lambda!7147)))

(check-sat (not b!180749) (not b!180799) (not d!54323) (not mapNonEmpty!7267) (not d!54333) (not b!180742) (not b!180810) (not b!180740) (not b!180741) (not b_lambda!7147) tp_is_empty!4237 (not d!54335) (not bm!18256) (not b!180803) (not b!180808) (not b!180751) (not b_next!4465) b_and!11021 (not d!54329) (not bm!18260) (not b!180801) (not b!180813) (not b!180796) (not b!180794) (not bm!18259) (not bm!18258) (not b!180732))
(check-sat b_and!11021 (not b_next!4465))
(get-model)

(declare-fun d!54337 () Bool)

(assert (=> d!54337 (= (validKeyInArray!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180813 d!54337))

(declare-fun d!54339 () Bool)

(assert (=> d!54339 (= (apply!150 (+!270 lt!89419 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248))) lt!89406) (apply!150 lt!89419 lt!89406))))

(declare-fun lt!89425 () Unit!5496)

(declare-fun choose!965 (ListLongMap!2245 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5496)

(assert (=> d!54339 (= lt!89425 (choose!965 lt!89419 lt!89422 (zeroValue!3547 thiss!1248) lt!89406))))

(declare-fun e!119112 () Bool)

(assert (=> d!54339 e!119112))

(declare-fun res!85633 () Bool)

(assert (=> d!54339 (=> (not res!85633) (not e!119112))))

(assert (=> d!54339 (= res!85633 (contains!1226 lt!89419 lt!89406))))

(assert (=> d!54339 (= (addApplyDifferent!126 lt!89419 lt!89422 (zeroValue!3547 thiss!1248) lt!89406) lt!89425)))

(declare-fun b!180828 () Bool)

(assert (=> b!180828 (= e!119112 (not (= lt!89406 lt!89422)))))

(assert (= (and d!54339 res!85633) b!180828))

(declare-fun m!208919 () Bool)

(assert (=> d!54339 m!208919))

(assert (=> d!54339 m!208875))

(declare-fun m!208921 () Bool)

(assert (=> d!54339 m!208921))

(assert (=> d!54339 m!208903))

(assert (=> d!54339 m!208875))

(assert (=> d!54339 m!208877))

(assert (=> b!180796 d!54339))

(declare-fun d!54341 () Bool)

(declare-fun e!119113 () Bool)

(assert (=> d!54341 e!119113))

(declare-fun res!85634 () Bool)

(assert (=> d!54341 (=> res!85634 e!119113)))

(declare-fun lt!89426 () Bool)

(assert (=> d!54341 (= res!85634 (not lt!89426))))

(declare-fun lt!89427 () Bool)

(assert (=> d!54341 (= lt!89426 lt!89427)))

(declare-fun lt!89429 () Unit!5496)

(declare-fun e!119114 () Unit!5496)

(assert (=> d!54341 (= lt!89429 e!119114)))

(declare-fun c!32386 () Bool)

(assert (=> d!54341 (= c!32386 lt!89427)))

(assert (=> d!54341 (= lt!89427 (containsKey!211 (toList!1138 (+!270 lt!89407 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))) lt!89405))))

(assert (=> d!54341 (= (contains!1226 (+!270 lt!89407 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248))) lt!89405) lt!89426)))

(declare-fun b!180829 () Bool)

(declare-fun lt!89428 () Unit!5496)

(assert (=> b!180829 (= e!119114 lt!89428)))

(assert (=> b!180829 (= lt!89428 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1138 (+!270 lt!89407 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))) lt!89405))))

(assert (=> b!180829 (isDefined!160 (getValueByKey!208 (toList!1138 (+!270 lt!89407 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))) lt!89405))))

(declare-fun b!180830 () Bool)

(declare-fun Unit!5500 () Unit!5496)

(assert (=> b!180830 (= e!119114 Unit!5500)))

(declare-fun b!180831 () Bool)

(assert (=> b!180831 (= e!119113 (isDefined!160 (getValueByKey!208 (toList!1138 (+!270 lt!89407 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))) lt!89405)))))

(assert (= (and d!54341 c!32386) b!180829))

(assert (= (and d!54341 (not c!32386)) b!180830))

(assert (= (and d!54341 (not res!85634)) b!180831))

(declare-fun m!208923 () Bool)

(assert (=> d!54341 m!208923))

(declare-fun m!208925 () Bool)

(assert (=> b!180829 m!208925))

(declare-fun m!208927 () Bool)

(assert (=> b!180829 m!208927))

(assert (=> b!180829 m!208927))

(declare-fun m!208929 () Bool)

(assert (=> b!180829 m!208929))

(assert (=> b!180831 m!208927))

(assert (=> b!180831 m!208927))

(assert (=> b!180831 m!208929))

(assert (=> b!180796 d!54341))

(declare-fun d!54343 () Bool)

(assert (=> d!54343 (contains!1226 (+!270 lt!89407 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248))) lt!89405)))

(declare-fun lt!89432 () Unit!5496)

(declare-fun choose!966 (ListLongMap!2245 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5496)

(assert (=> d!54343 (= lt!89432 (choose!966 lt!89407 lt!89415 (zeroValue!3547 thiss!1248) lt!89405))))

(assert (=> d!54343 (contains!1226 lt!89407 lt!89405)))

(assert (=> d!54343 (= (addStillContains!126 lt!89407 lt!89415 (zeroValue!3547 thiss!1248) lt!89405) lt!89432)))

(declare-fun bs!7399 () Bool)

(assert (= bs!7399 d!54343))

(assert (=> bs!7399 m!208887))

(assert (=> bs!7399 m!208887))

(assert (=> bs!7399 m!208889))

(declare-fun m!208931 () Bool)

(assert (=> bs!7399 m!208931))

(declare-fun m!208933 () Bool)

(assert (=> bs!7399 m!208933))

(assert (=> b!180796 d!54343))

(declare-fun d!54345 () Bool)

(declare-fun e!119117 () Bool)

(assert (=> d!54345 e!119117))

(declare-fun res!85639 () Bool)

(assert (=> d!54345 (=> (not res!85639) (not e!119117))))

(declare-fun lt!89442 () ListLongMap!2245)

(assert (=> d!54345 (= res!85639 (contains!1226 lt!89442 (_1!1673 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))))))

(declare-fun lt!89441 () List!2269)

(assert (=> d!54345 (= lt!89442 (ListLongMap!2246 lt!89441))))

(declare-fun lt!89443 () Unit!5496)

(declare-fun lt!89444 () Unit!5496)

(assert (=> d!54345 (= lt!89443 lt!89444)))

(assert (=> d!54345 (= (getValueByKey!208 lt!89441 (_1!1673 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!110 (List!2269 (_ BitVec 64) V!5297) Unit!5496)

(assert (=> d!54345 (= lt!89444 (lemmaContainsTupThenGetReturnValue!110 lt!89441 (_1!1673 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))))))

(declare-fun insertStrictlySorted!113 (List!2269 (_ BitVec 64) V!5297) List!2269)

(assert (=> d!54345 (= lt!89441 (insertStrictlySorted!113 (toList!1138 lt!89407) (_1!1673 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54345 (= (+!270 lt!89407 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248))) lt!89442)))

(declare-fun b!180837 () Bool)

(declare-fun res!85640 () Bool)

(assert (=> b!180837 (=> (not res!85640) (not e!119117))))

(assert (=> b!180837 (= res!85640 (= (getValueByKey!208 (toList!1138 lt!89442) (_1!1673 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248))))))))

(declare-fun b!180838 () Bool)

(declare-fun contains!1228 (List!2269 tuple2!3324) Bool)

(assert (=> b!180838 (= e!119117 (contains!1228 (toList!1138 lt!89442) (tuple2!3325 lt!89415 (zeroValue!3547 thiss!1248))))))

(assert (= (and d!54345 res!85639) b!180837))

(assert (= (and b!180837 res!85640) b!180838))

(declare-fun m!208935 () Bool)

(assert (=> d!54345 m!208935))

(declare-fun m!208937 () Bool)

(assert (=> d!54345 m!208937))

(declare-fun m!208939 () Bool)

(assert (=> d!54345 m!208939))

(declare-fun m!208941 () Bool)

(assert (=> d!54345 m!208941))

(declare-fun m!208943 () Bool)

(assert (=> b!180837 m!208943))

(declare-fun m!208945 () Bool)

(assert (=> b!180838 m!208945))

(assert (=> b!180796 d!54345))

(declare-fun d!54347 () Bool)

(declare-fun get!2074 (Option!214) V!5297)

(assert (=> d!54347 (= (apply!150 lt!89417 lt!89413) (get!2074 (getValueByKey!208 (toList!1138 lt!89417) lt!89413)))))

(declare-fun bs!7400 () Bool)

(assert (= bs!7400 d!54347))

(declare-fun m!208947 () Bool)

(assert (=> bs!7400 m!208947))

(assert (=> bs!7400 m!208947))

(declare-fun m!208949 () Bool)

(assert (=> bs!7400 m!208949))

(assert (=> b!180796 d!54347))

(declare-fun d!54349 () Bool)

(declare-fun e!119118 () Bool)

(assert (=> d!54349 e!119118))

(declare-fun res!85641 () Bool)

(assert (=> d!54349 (=> (not res!85641) (not e!119118))))

(declare-fun lt!89446 () ListLongMap!2245)

(assert (=> d!54349 (= res!85641 (contains!1226 lt!89446 (_1!1673 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248)))))))

(declare-fun lt!89445 () List!2269)

(assert (=> d!54349 (= lt!89446 (ListLongMap!2246 lt!89445))))

(declare-fun lt!89447 () Unit!5496)

(declare-fun lt!89448 () Unit!5496)

(assert (=> d!54349 (= lt!89447 lt!89448)))

(assert (=> d!54349 (= (getValueByKey!208 lt!89445 (_1!1673 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248)))))))

(assert (=> d!54349 (= lt!89448 (lemmaContainsTupThenGetReturnValue!110 lt!89445 (_1!1673 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248)))))))

(assert (=> d!54349 (= lt!89445 (insertStrictlySorted!113 (toList!1138 lt!89414) (_1!1673 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248)))))))

(assert (=> d!54349 (= (+!270 lt!89414 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248))) lt!89446)))

(declare-fun b!180839 () Bool)

(declare-fun res!85642 () Bool)

(assert (=> b!180839 (=> (not res!85642) (not e!119118))))

(assert (=> b!180839 (= res!85642 (= (getValueByKey!208 (toList!1138 lt!89446) (_1!1673 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248))))))))

(declare-fun b!180840 () Bool)

(assert (=> b!180840 (= e!119118 (contains!1228 (toList!1138 lt!89446) (tuple2!3325 lt!89404 (minValue!3547 thiss!1248))))))

(assert (= (and d!54349 res!85641) b!180839))

(assert (= (and b!180839 res!85642) b!180840))

(declare-fun m!208951 () Bool)

(assert (=> d!54349 m!208951))

(declare-fun m!208953 () Bool)

(assert (=> d!54349 m!208953))

(declare-fun m!208955 () Bool)

(assert (=> d!54349 m!208955))

(declare-fun m!208957 () Bool)

(assert (=> d!54349 m!208957))

(declare-fun m!208959 () Bool)

(assert (=> b!180839 m!208959))

(declare-fun m!208961 () Bool)

(assert (=> b!180840 m!208961))

(assert (=> b!180796 d!54349))

(declare-fun d!54351 () Bool)

(assert (=> d!54351 (= (apply!150 (+!270 lt!89419 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248))) lt!89406) (get!2074 (getValueByKey!208 (toList!1138 (+!270 lt!89419 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248)))) lt!89406)))))

(declare-fun bs!7401 () Bool)

(assert (= bs!7401 d!54351))

(declare-fun m!208963 () Bool)

(assert (=> bs!7401 m!208963))

(assert (=> bs!7401 m!208963))

(declare-fun m!208965 () Bool)

(assert (=> bs!7401 m!208965))

(assert (=> b!180796 d!54351))

(declare-fun d!54353 () Bool)

(declare-fun e!119119 () Bool)

(assert (=> d!54353 e!119119))

(declare-fun res!85643 () Bool)

(assert (=> d!54353 (=> (not res!85643) (not e!119119))))

(declare-fun lt!89450 () ListLongMap!2245)

(assert (=> d!54353 (= res!85643 (contains!1226 lt!89450 (_1!1673 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248)))))))

(declare-fun lt!89449 () List!2269)

(assert (=> d!54353 (= lt!89450 (ListLongMap!2246 lt!89449))))

(declare-fun lt!89451 () Unit!5496)

(declare-fun lt!89452 () Unit!5496)

(assert (=> d!54353 (= lt!89451 lt!89452)))

(assert (=> d!54353 (= (getValueByKey!208 lt!89449 (_1!1673 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54353 (= lt!89452 (lemmaContainsTupThenGetReturnValue!110 lt!89449 (_1!1673 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54353 (= lt!89449 (insertStrictlySorted!113 (toList!1138 lt!89419) (_1!1673 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54353 (= (+!270 lt!89419 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248))) lt!89450)))

(declare-fun b!180841 () Bool)

(declare-fun res!85644 () Bool)

(assert (=> b!180841 (=> (not res!85644) (not e!119119))))

(assert (=> b!180841 (= res!85644 (= (getValueByKey!208 (toList!1138 lt!89450) (_1!1673 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248))))))))

(declare-fun b!180842 () Bool)

(assert (=> b!180842 (= e!119119 (contains!1228 (toList!1138 lt!89450) (tuple2!3325 lt!89422 (zeroValue!3547 thiss!1248))))))

(assert (= (and d!54353 res!85643) b!180841))

(assert (= (and b!180841 res!85644) b!180842))

(declare-fun m!208967 () Bool)

(assert (=> d!54353 m!208967))

(declare-fun m!208969 () Bool)

(assert (=> d!54353 m!208969))

(declare-fun m!208971 () Bool)

(assert (=> d!54353 m!208971))

(declare-fun m!208973 () Bool)

(assert (=> d!54353 m!208973))

(declare-fun m!208975 () Bool)

(assert (=> b!180841 m!208975))

(declare-fun m!208977 () Bool)

(assert (=> b!180842 m!208977))

(assert (=> b!180796 d!54353))

(declare-fun d!54355 () Bool)

(assert (=> d!54355 (= (apply!150 (+!270 lt!89417 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248))) lt!89413) (get!2074 (getValueByKey!208 (toList!1138 (+!270 lt!89417 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248)))) lt!89413)))))

(declare-fun bs!7402 () Bool)

(assert (= bs!7402 d!54355))

(declare-fun m!208979 () Bool)

(assert (=> bs!7402 m!208979))

(assert (=> bs!7402 m!208979))

(declare-fun m!208981 () Bool)

(assert (=> bs!7402 m!208981))

(assert (=> b!180796 d!54355))

(declare-fun d!54357 () Bool)

(assert (=> d!54357 (= (apply!150 lt!89419 lt!89406) (get!2074 (getValueByKey!208 (toList!1138 lt!89419) lt!89406)))))

(declare-fun bs!7403 () Bool)

(assert (= bs!7403 d!54357))

(declare-fun m!208983 () Bool)

(assert (=> bs!7403 m!208983))

(assert (=> bs!7403 m!208983))

(declare-fun m!208985 () Bool)

(assert (=> bs!7403 m!208985))

(assert (=> b!180796 d!54357))

(declare-fun d!54359 () Bool)

(assert (=> d!54359 (= (apply!150 (+!270 lt!89414 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248))) lt!89411) (get!2074 (getValueByKey!208 (toList!1138 (+!270 lt!89414 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248)))) lt!89411)))))

(declare-fun bs!7404 () Bool)

(assert (= bs!7404 d!54359))

(declare-fun m!208987 () Bool)

(assert (=> bs!7404 m!208987))

(assert (=> bs!7404 m!208987))

(declare-fun m!208989 () Bool)

(assert (=> bs!7404 m!208989))

(assert (=> b!180796 d!54359))

(declare-fun b!180867 () Bool)

(declare-fun e!119139 () ListLongMap!2245)

(declare-fun e!119135 () ListLongMap!2245)

(assert (=> b!180867 (= e!119139 e!119135)))

(declare-fun c!32397 () Bool)

(assert (=> b!180867 (= c!32397 (validKeyInArray!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180868 () Bool)

(assert (=> b!180868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(assert (=> b!180868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3923 (_values!3689 thiss!1248))))))

(declare-fun e!119137 () Bool)

(declare-fun lt!89470 () ListLongMap!2245)

(assert (=> b!180868 (= e!119137 (= (apply!150 lt!89470 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)) (get!2073 (select (arr!3615 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!180869 () Bool)

(declare-fun e!119136 () Bool)

(assert (=> b!180869 (= e!119136 (validKeyInArray!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180869 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!180870 () Bool)

(assert (=> b!180870 (= e!119139 (ListLongMap!2246 Nil!2266))))

(declare-fun b!180871 () Bool)

(declare-fun e!119140 () Bool)

(assert (=> b!180871 (= e!119140 (= lt!89470 (getCurrentListMapNoExtraKeys!181 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3706 thiss!1248))))))

(declare-fun b!180872 () Bool)

(declare-fun call!18268 () ListLongMap!2245)

(assert (=> b!180872 (= e!119135 call!18268)))

(declare-fun b!180873 () Bool)

(declare-fun e!119134 () Bool)

(assert (=> b!180873 (= e!119134 e!119140)))

(declare-fun c!32398 () Bool)

(assert (=> b!180873 (= c!32398 (bvslt #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(declare-fun b!180874 () Bool)

(declare-fun res!85653 () Bool)

(declare-fun e!119138 () Bool)

(assert (=> b!180874 (=> (not res!85653) (not e!119138))))

(assert (=> b!180874 (= res!85653 (not (contains!1226 lt!89470 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!18265 () Bool)

(assert (=> bm!18265 (= call!18268 (getCurrentListMapNoExtraKeys!181 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3706 thiss!1248)))))

(declare-fun d!54361 () Bool)

(assert (=> d!54361 e!119138))

(declare-fun res!85655 () Bool)

(assert (=> d!54361 (=> (not res!85655) (not e!119138))))

(assert (=> d!54361 (= res!85655 (not (contains!1226 lt!89470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54361 (= lt!89470 e!119139)))

(declare-fun c!32396 () Bool)

(assert (=> d!54361 (= c!32396 (bvsge #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(assert (=> d!54361 (validMask!0 (mask!8711 thiss!1248))))

(assert (=> d!54361 (= (getCurrentListMapNoExtraKeys!181 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)) lt!89470)))

(declare-fun b!180875 () Bool)

(declare-fun lt!89467 () Unit!5496)

(declare-fun lt!89472 () Unit!5496)

(assert (=> b!180875 (= lt!89467 lt!89472)))

(declare-fun lt!89469 () (_ BitVec 64))

(declare-fun lt!89468 () ListLongMap!2245)

(declare-fun lt!89473 () (_ BitVec 64))

(declare-fun lt!89471 () V!5297)

(assert (=> b!180875 (not (contains!1226 (+!270 lt!89468 (tuple2!3325 lt!89473 lt!89471)) lt!89469))))

(declare-fun addStillNotContains!83 (ListLongMap!2245 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5496)

(assert (=> b!180875 (= lt!89472 (addStillNotContains!83 lt!89468 lt!89473 lt!89471 lt!89469))))

(assert (=> b!180875 (= lt!89469 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!180875 (= lt!89471 (get!2073 (select (arr!3615 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180875 (= lt!89473 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180875 (= lt!89468 call!18268)))

(assert (=> b!180875 (= e!119135 (+!270 call!18268 (tuple2!3325 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000) (get!2073 (select (arr!3615 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!180876 () Bool)

(declare-fun isEmpty!461 (ListLongMap!2245) Bool)

(assert (=> b!180876 (= e!119140 (isEmpty!461 lt!89470))))

(declare-fun b!180877 () Bool)

(assert (=> b!180877 (= e!119134 e!119137)))

(assert (=> b!180877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(declare-fun res!85654 () Bool)

(assert (=> b!180877 (= res!85654 (contains!1226 lt!89470 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180877 (=> (not res!85654) (not e!119137))))

(declare-fun b!180878 () Bool)

(assert (=> b!180878 (= e!119138 e!119134)))

(declare-fun c!32395 () Bool)

(assert (=> b!180878 (= c!32395 e!119136)))

(declare-fun res!85656 () Bool)

(assert (=> b!180878 (=> (not res!85656) (not e!119136))))

(assert (=> b!180878 (= res!85656 (bvslt #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(assert (= (and d!54361 c!32396) b!180870))

(assert (= (and d!54361 (not c!32396)) b!180867))

(assert (= (and b!180867 c!32397) b!180875))

(assert (= (and b!180867 (not c!32397)) b!180872))

(assert (= (or b!180875 b!180872) bm!18265))

(assert (= (and d!54361 res!85655) b!180874))

(assert (= (and b!180874 res!85653) b!180878))

(assert (= (and b!180878 res!85656) b!180869))

(assert (= (and b!180878 c!32395) b!180877))

(assert (= (and b!180878 (not c!32395)) b!180873))

(assert (= (and b!180877 res!85654) b!180868))

(assert (= (and b!180873 c!32398) b!180871))

(assert (= (and b!180873 (not c!32398)) b!180876))

(declare-fun b_lambda!7149 () Bool)

(assert (=> (not b_lambda!7149) (not b!180868)))

(assert (=> b!180868 t!7114))

(declare-fun b_and!11023 () Bool)

(assert (= b_and!11021 (and (=> t!7114 result!4703) b_and!11023)))

(declare-fun b_lambda!7151 () Bool)

(assert (=> (not b_lambda!7151) (not b!180875)))

(assert (=> b!180875 t!7114))

(declare-fun b_and!11025 () Bool)

(assert (= b_and!11023 (and (=> t!7114 result!4703) b_and!11025)))

(assert (=> b!180869 m!208867))

(assert (=> b!180869 m!208867))

(assert (=> b!180869 m!208869))

(declare-fun m!208991 () Bool)

(assert (=> b!180874 m!208991))

(declare-fun m!208993 () Bool)

(assert (=> b!180871 m!208993))

(assert (=> bm!18265 m!208993))

(assert (=> b!180875 m!208867))

(declare-fun m!208995 () Bool)

(assert (=> b!180875 m!208995))

(assert (=> b!180875 m!208907))

(declare-fun m!208997 () Bool)

(assert (=> b!180875 m!208997))

(assert (=> b!180875 m!208995))

(declare-fun m!208999 () Bool)

(assert (=> b!180875 m!208999))

(assert (=> b!180875 m!208911))

(assert (=> b!180875 m!208907))

(assert (=> b!180875 m!208913))

(assert (=> b!180875 m!208911))

(declare-fun m!209001 () Bool)

(assert (=> b!180875 m!209001))

(assert (=> b!180867 m!208867))

(assert (=> b!180867 m!208867))

(assert (=> b!180867 m!208869))

(assert (=> b!180877 m!208867))

(assert (=> b!180877 m!208867))

(declare-fun m!209003 () Bool)

(assert (=> b!180877 m!209003))

(declare-fun m!209005 () Bool)

(assert (=> b!180876 m!209005))

(assert (=> b!180868 m!208867))

(assert (=> b!180868 m!208907))

(assert (=> b!180868 m!208911))

(assert (=> b!180868 m!208911))

(assert (=> b!180868 m!208907))

(assert (=> b!180868 m!208913))

(assert (=> b!180868 m!208867))

(declare-fun m!209007 () Bool)

(assert (=> b!180868 m!209007))

(declare-fun m!209009 () Bool)

(assert (=> d!54361 m!209009))

(assert (=> d!54361 m!208789))

(assert (=> b!180796 d!54361))

(declare-fun d!54363 () Bool)

(assert (=> d!54363 (= (apply!150 lt!89414 lt!89411) (get!2074 (getValueByKey!208 (toList!1138 lt!89414) lt!89411)))))

(declare-fun bs!7405 () Bool)

(assert (= bs!7405 d!54363))

(declare-fun m!209011 () Bool)

(assert (=> bs!7405 m!209011))

(assert (=> bs!7405 m!209011))

(declare-fun m!209013 () Bool)

(assert (=> bs!7405 m!209013))

(assert (=> b!180796 d!54363))

(declare-fun d!54365 () Bool)

(declare-fun e!119141 () Bool)

(assert (=> d!54365 e!119141))

(declare-fun res!85657 () Bool)

(assert (=> d!54365 (=> (not res!85657) (not e!119141))))

(declare-fun lt!89475 () ListLongMap!2245)

(assert (=> d!54365 (= res!85657 (contains!1226 lt!89475 (_1!1673 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248)))))))

(declare-fun lt!89474 () List!2269)

(assert (=> d!54365 (= lt!89475 (ListLongMap!2246 lt!89474))))

(declare-fun lt!89476 () Unit!5496)

(declare-fun lt!89477 () Unit!5496)

(assert (=> d!54365 (= lt!89476 lt!89477)))

(assert (=> d!54365 (= (getValueByKey!208 lt!89474 (_1!1673 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248)))))))

(assert (=> d!54365 (= lt!89477 (lemmaContainsTupThenGetReturnValue!110 lt!89474 (_1!1673 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248)))))))

(assert (=> d!54365 (= lt!89474 (insertStrictlySorted!113 (toList!1138 lt!89417) (_1!1673 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248)))))))

(assert (=> d!54365 (= (+!270 lt!89417 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248))) lt!89475)))

(declare-fun b!180879 () Bool)

(declare-fun res!85658 () Bool)

(assert (=> b!180879 (=> (not res!85658) (not e!119141))))

(assert (=> b!180879 (= res!85658 (= (getValueByKey!208 (toList!1138 lt!89475) (_1!1673 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248))))))))

(declare-fun b!180880 () Bool)

(assert (=> b!180880 (= e!119141 (contains!1228 (toList!1138 lt!89475) (tuple2!3325 lt!89401 (minValue!3547 thiss!1248))))))

(assert (= (and d!54365 res!85657) b!180879))

(assert (= (and b!180879 res!85658) b!180880))

(declare-fun m!209015 () Bool)

(assert (=> d!54365 m!209015))

(declare-fun m!209017 () Bool)

(assert (=> d!54365 m!209017))

(declare-fun m!209019 () Bool)

(assert (=> d!54365 m!209019))

(declare-fun m!209021 () Bool)

(assert (=> d!54365 m!209021))

(declare-fun m!209023 () Bool)

(assert (=> b!180879 m!209023))

(declare-fun m!209025 () Bool)

(assert (=> b!180880 m!209025))

(assert (=> b!180796 d!54365))

(declare-fun d!54367 () Bool)

(assert (=> d!54367 (= (apply!150 (+!270 lt!89417 (tuple2!3325 lt!89401 (minValue!3547 thiss!1248))) lt!89413) (apply!150 lt!89417 lt!89413))))

(declare-fun lt!89478 () Unit!5496)

(assert (=> d!54367 (= lt!89478 (choose!965 lt!89417 lt!89401 (minValue!3547 thiss!1248) lt!89413))))

(declare-fun e!119142 () Bool)

(assert (=> d!54367 e!119142))

(declare-fun res!85659 () Bool)

(assert (=> d!54367 (=> (not res!85659) (not e!119142))))

(assert (=> d!54367 (= res!85659 (contains!1226 lt!89417 lt!89413))))

(assert (=> d!54367 (= (addApplyDifferent!126 lt!89417 lt!89401 (minValue!3547 thiss!1248) lt!89413) lt!89478)))

(declare-fun b!180881 () Bool)

(assert (=> b!180881 (= e!119142 (not (= lt!89413 lt!89401)))))

(assert (= (and d!54367 res!85659) b!180881))

(declare-fun m!209027 () Bool)

(assert (=> d!54367 m!209027))

(assert (=> d!54367 m!208879))

(declare-fun m!209029 () Bool)

(assert (=> d!54367 m!209029))

(assert (=> d!54367 m!208883))

(assert (=> d!54367 m!208879))

(assert (=> d!54367 m!208881))

(assert (=> b!180796 d!54367))

(declare-fun d!54369 () Bool)

(assert (=> d!54369 (= (apply!150 (+!270 lt!89414 (tuple2!3325 lt!89404 (minValue!3547 thiss!1248))) lt!89411) (apply!150 lt!89414 lt!89411))))

(declare-fun lt!89479 () Unit!5496)

(assert (=> d!54369 (= lt!89479 (choose!965 lt!89414 lt!89404 (minValue!3547 thiss!1248) lt!89411))))

(declare-fun e!119143 () Bool)

(assert (=> d!54369 e!119143))

(declare-fun res!85660 () Bool)

(assert (=> d!54369 (=> (not res!85660) (not e!119143))))

(assert (=> d!54369 (= res!85660 (contains!1226 lt!89414 lt!89411))))

(assert (=> d!54369 (= (addApplyDifferent!126 lt!89414 lt!89404 (minValue!3547 thiss!1248) lt!89411) lt!89479)))

(declare-fun b!180882 () Bool)

(assert (=> b!180882 (= e!119143 (not (= lt!89411 lt!89404)))))

(assert (= (and d!54369 res!85660) b!180882))

(declare-fun m!209031 () Bool)

(assert (=> d!54369 m!209031))

(assert (=> d!54369 m!208891))

(declare-fun m!209033 () Bool)

(assert (=> d!54369 m!209033))

(assert (=> d!54369 m!208885))

(assert (=> d!54369 m!208891))

(assert (=> d!54369 m!208901))

(assert (=> b!180796 d!54369))

(declare-fun d!54371 () Bool)

(declare-fun res!85665 () Bool)

(declare-fun e!119148 () Bool)

(assert (=> d!54371 (=> res!85665 e!119148)))

(assert (=> d!54371 (= res!85665 (and ((_ is Cons!2265) (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) (= (_1!1673 (h!2890 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828)))))

(assert (=> d!54371 (= (containsKey!211 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828) e!119148)))

(declare-fun b!180887 () Bool)

(declare-fun e!119149 () Bool)

(assert (=> b!180887 (= e!119148 e!119149)))

(declare-fun res!85666 () Bool)

(assert (=> b!180887 (=> (not res!85666) (not e!119149))))

(assert (=> b!180887 (= res!85666 (and (or (not ((_ is Cons!2265) (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) (bvsle (_1!1673 (h!2890 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828)) ((_ is Cons!2265) (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) (bvslt (_1!1673 (h!2890 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828)))))

(declare-fun b!180888 () Bool)

(assert (=> b!180888 (= e!119149 (containsKey!211 (t!7111 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) key!828))))

(assert (= (and d!54371 (not res!85665)) b!180887))

(assert (= (and b!180887 res!85666) b!180888))

(declare-fun m!209035 () Bool)

(assert (=> b!180888 m!209035))

(assert (=> d!54333 d!54371))

(declare-fun d!54373 () Bool)

(declare-fun e!119150 () Bool)

(assert (=> d!54373 e!119150))

(declare-fun res!85667 () Bool)

(assert (=> d!54373 (=> res!85667 e!119150)))

(declare-fun lt!89480 () Bool)

(assert (=> d!54373 (= res!85667 (not lt!89480))))

(declare-fun lt!89481 () Bool)

(assert (=> d!54373 (= lt!89480 lt!89481)))

(declare-fun lt!89483 () Unit!5496)

(declare-fun e!119151 () Unit!5496)

(assert (=> d!54373 (= lt!89483 e!119151)))

(declare-fun c!32399 () Bool)

(assert (=> d!54373 (= c!32399 lt!89481)))

(assert (=> d!54373 (= lt!89481 (containsKey!211 (toList!1138 lt!89420) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54373 (= (contains!1226 lt!89420 #b1000000000000000000000000000000000000000000000000000000000000000) lt!89480)))

(declare-fun b!180889 () Bool)

(declare-fun lt!89482 () Unit!5496)

(assert (=> b!180889 (= e!119151 lt!89482)))

(assert (=> b!180889 (= lt!89482 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1138 lt!89420) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180889 (isDefined!160 (getValueByKey!208 (toList!1138 lt!89420) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180890 () Bool)

(declare-fun Unit!5501 () Unit!5496)

(assert (=> b!180890 (= e!119151 Unit!5501)))

(declare-fun b!180891 () Bool)

(assert (=> b!180891 (= e!119150 (isDefined!160 (getValueByKey!208 (toList!1138 lt!89420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54373 c!32399) b!180889))

(assert (= (and d!54373 (not c!32399)) b!180890))

(assert (= (and d!54373 (not res!85667)) b!180891))

(declare-fun m!209037 () Bool)

(assert (=> d!54373 m!209037))

(declare-fun m!209039 () Bool)

(assert (=> b!180889 m!209039))

(declare-fun m!209041 () Bool)

(assert (=> b!180889 m!209041))

(assert (=> b!180889 m!209041))

(declare-fun m!209043 () Bool)

(assert (=> b!180889 m!209043))

(assert (=> b!180891 m!209041))

(assert (=> b!180891 m!209041))

(assert (=> b!180891 m!209043))

(assert (=> bm!18259 d!54373))

(declare-fun b!180910 () Bool)

(declare-fun lt!89488 () SeekEntryResult!589)

(assert (=> b!180910 (and (bvsge (index!4528 lt!89488) #b00000000000000000000000000000000) (bvslt (index!4528 lt!89488) (size!3922 (_keys!5600 thiss!1248))))))

(declare-fun e!119164 () Bool)

(assert (=> b!180910 (= e!119164 (= (select (arr!3614 (_keys!5600 thiss!1248)) (index!4528 lt!89488)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180911 () Bool)

(declare-fun e!119163 () Bool)

(assert (=> b!180911 (= e!119163 (bvsge (x!19741 lt!89488) #b01111111111111111111111111111110))))

(declare-fun b!180912 () Bool)

(declare-fun e!119162 () SeekEntryResult!589)

(assert (=> b!180912 (= e!119162 (Intermediate!589 true (toIndex!0 key!828 (mask!8711 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!54375 () Bool)

(assert (=> d!54375 e!119163))

(declare-fun c!32406 () Bool)

(assert (=> d!54375 (= c!32406 (and ((_ is Intermediate!589) lt!89488) (undefined!1401 lt!89488)))))

(assert (=> d!54375 (= lt!89488 e!119162)))

(declare-fun c!32407 () Bool)

(assert (=> d!54375 (= c!32407 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!89489 () (_ BitVec 64))

(assert (=> d!54375 (= lt!89489 (select (arr!3614 (_keys!5600 thiss!1248)) (toIndex!0 key!828 (mask!8711 thiss!1248))))))

(assert (=> d!54375 (validMask!0 (mask!8711 thiss!1248))))

(assert (=> d!54375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8711 thiss!1248)) key!828 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)) lt!89488)))

(declare-fun b!180913 () Bool)

(declare-fun e!119166 () SeekEntryResult!589)

(assert (=> b!180913 (= e!119162 e!119166)))

(declare-fun c!32408 () Bool)

(assert (=> b!180913 (= c!32408 (or (= lt!89489 key!828) (= (bvadd lt!89489 lt!89489) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180914 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180914 (= e!119166 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8711 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8711 thiss!1248)) key!828 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)))))

(declare-fun b!180915 () Bool)

(assert (=> b!180915 (= e!119166 (Intermediate!589 false (toIndex!0 key!828 (mask!8711 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!180916 () Bool)

(declare-fun e!119165 () Bool)

(assert (=> b!180916 (= e!119163 e!119165)))

(declare-fun res!85676 () Bool)

(assert (=> b!180916 (= res!85676 (and ((_ is Intermediate!589) lt!89488) (not (undefined!1401 lt!89488)) (bvslt (x!19741 lt!89488) #b01111111111111111111111111111110) (bvsge (x!19741 lt!89488) #b00000000000000000000000000000000) (bvsge (x!19741 lt!89488) #b00000000000000000000000000000000)))))

(assert (=> b!180916 (=> (not res!85676) (not e!119165))))

(declare-fun b!180917 () Bool)

(assert (=> b!180917 (and (bvsge (index!4528 lt!89488) #b00000000000000000000000000000000) (bvslt (index!4528 lt!89488) (size!3922 (_keys!5600 thiss!1248))))))

(declare-fun res!85674 () Bool)

(assert (=> b!180917 (= res!85674 (= (select (arr!3614 (_keys!5600 thiss!1248)) (index!4528 lt!89488)) key!828))))

(assert (=> b!180917 (=> res!85674 e!119164)))

(assert (=> b!180917 (= e!119165 e!119164)))

(declare-fun b!180918 () Bool)

(assert (=> b!180918 (and (bvsge (index!4528 lt!89488) #b00000000000000000000000000000000) (bvslt (index!4528 lt!89488) (size!3922 (_keys!5600 thiss!1248))))))

(declare-fun res!85675 () Bool)

(assert (=> b!180918 (= res!85675 (= (select (arr!3614 (_keys!5600 thiss!1248)) (index!4528 lt!89488)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180918 (=> res!85675 e!119164)))

(assert (= (and d!54375 c!32407) b!180912))

(assert (= (and d!54375 (not c!32407)) b!180913))

(assert (= (and b!180913 c!32408) b!180915))

(assert (= (and b!180913 (not c!32408)) b!180914))

(assert (= (and d!54375 c!32406) b!180911))

(assert (= (and d!54375 (not c!32406)) b!180916))

(assert (= (and b!180916 res!85676) b!180917))

(assert (= (and b!180917 (not res!85674)) b!180918))

(assert (= (and b!180918 (not res!85675)) b!180910))

(declare-fun m!209045 () Bool)

(assert (=> b!180917 m!209045))

(assert (=> b!180914 m!208833))

(declare-fun m!209047 () Bool)

(assert (=> b!180914 m!209047))

(assert (=> b!180914 m!209047))

(declare-fun m!209049 () Bool)

(assert (=> b!180914 m!209049))

(assert (=> b!180910 m!209045))

(assert (=> b!180918 m!209045))

(assert (=> d!54375 m!208833))

(declare-fun m!209051 () Bool)

(assert (=> d!54375 m!209051))

(assert (=> d!54375 m!208789))

(assert (=> d!54323 d!54375))

(declare-fun d!54377 () Bool)

(declare-fun lt!89495 () (_ BitVec 32))

(declare-fun lt!89494 () (_ BitVec 32))

(assert (=> d!54377 (= lt!89495 (bvmul (bvxor lt!89494 (bvlshr lt!89494 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54377 (= lt!89494 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54377 (and (bvsge (mask!8711 thiss!1248) #b00000000000000000000000000000000) (let ((res!85677 (let ((h!2893 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19759 (bvmul (bvxor h!2893 (bvlshr h!2893 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19759 (bvlshr x!19759 #b00000000000000000000000000001101)) (mask!8711 thiss!1248)))))) (and (bvslt res!85677 (bvadd (mask!8711 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!85677 #b00000000000000000000000000000000))))))

(assert (=> d!54377 (= (toIndex!0 key!828 (mask!8711 thiss!1248)) (bvand (bvxor lt!89495 (bvlshr lt!89495 #b00000000000000000000000000001101)) (mask!8711 thiss!1248)))))

(assert (=> d!54323 d!54377))

(assert (=> d!54323 d!54331))

(declare-fun d!54379 () Bool)

(assert (=> d!54379 (= (apply!150 lt!89420 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2074 (getValueByKey!208 (toList!1138 lt!89420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7406 () Bool)

(assert (= bs!7406 d!54379))

(assert (=> bs!7406 m!209041))

(assert (=> bs!7406 m!209041))

(declare-fun m!209053 () Bool)

(assert (=> bs!7406 m!209053))

(assert (=> b!180810 d!54379))

(declare-fun d!54381 () Bool)

(assert (=> d!54381 (= (apply!150 lt!89420 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)) (get!2074 (getValueByKey!208 (toList!1138 lt!89420) (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7407 () Bool)

(assert (= bs!7407 d!54381))

(assert (=> bs!7407 m!208867))

(declare-fun m!209055 () Bool)

(assert (=> bs!7407 m!209055))

(assert (=> bs!7407 m!209055))

(declare-fun m!209057 () Bool)

(assert (=> bs!7407 m!209057))

(assert (=> b!180794 d!54381))

(declare-fun d!54383 () Bool)

(declare-fun c!32411 () Bool)

(assert (=> d!54383 (= c!32411 ((_ is ValueCellFull!1775) (select (arr!3615 (_values!3689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119169 () V!5297)

(assert (=> d!54383 (= (get!2073 (select (arr!3615 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119169)))

(declare-fun b!180923 () Bool)

(declare-fun get!2075 (ValueCell!1775 V!5297) V!5297)

(assert (=> b!180923 (= e!119169 (get!2075 (select (arr!3615 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180924 () Bool)

(declare-fun get!2076 (ValueCell!1775 V!5297) V!5297)

(assert (=> b!180924 (= e!119169 (get!2076 (select (arr!3615 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54383 c!32411) b!180923))

(assert (= (and d!54383 (not c!32411)) b!180924))

(assert (=> b!180923 m!208911))

(assert (=> b!180923 m!208907))

(declare-fun m!209059 () Bool)

(assert (=> b!180923 m!209059))

(assert (=> b!180924 m!208911))

(assert (=> b!180924 m!208907))

(declare-fun m!209061 () Bool)

(assert (=> b!180924 m!209061))

(assert (=> b!180794 d!54383))

(declare-fun b!180937 () Bool)

(declare-fun e!119178 () SeekEntryResult!589)

(declare-fun e!119177 () SeekEntryResult!589)

(assert (=> b!180937 (= e!119178 e!119177)))

(declare-fun c!32420 () Bool)

(declare-fun lt!89501 () (_ BitVec 64))

(assert (=> b!180937 (= c!32420 (= lt!89501 key!828))))

(declare-fun b!180938 () Bool)

(declare-fun e!119176 () SeekEntryResult!589)

(assert (=> b!180938 (= e!119176 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19741 lt!89343) #b00000000000000000000000000000001) (nextIndex!0 (index!4528 lt!89343) (bvadd (x!19741 lt!89343) #b00000000000000000000000000000001) (mask!8711 thiss!1248)) (index!4528 lt!89343) key!828 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)))))

(declare-fun d!54385 () Bool)

(declare-fun lt!89500 () SeekEntryResult!589)

(assert (=> d!54385 (and (or ((_ is Undefined!589) lt!89500) (not ((_ is Found!589) lt!89500)) (and (bvsge (index!4527 lt!89500) #b00000000000000000000000000000000) (bvslt (index!4527 lt!89500) (size!3922 (_keys!5600 thiss!1248))))) (or ((_ is Undefined!589) lt!89500) ((_ is Found!589) lt!89500) (not ((_ is MissingVacant!589) lt!89500)) (not (= (index!4529 lt!89500) (index!4528 lt!89343))) (and (bvsge (index!4529 lt!89500) #b00000000000000000000000000000000) (bvslt (index!4529 lt!89500) (size!3922 (_keys!5600 thiss!1248))))) (or ((_ is Undefined!589) lt!89500) (ite ((_ is Found!589) lt!89500) (= (select (arr!3614 (_keys!5600 thiss!1248)) (index!4527 lt!89500)) key!828) (and ((_ is MissingVacant!589) lt!89500) (= (index!4529 lt!89500) (index!4528 lt!89343)) (= (select (arr!3614 (_keys!5600 thiss!1248)) (index!4529 lt!89500)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54385 (= lt!89500 e!119178)))

(declare-fun c!32419 () Bool)

(assert (=> d!54385 (= c!32419 (bvsge (x!19741 lt!89343) #b01111111111111111111111111111110))))

(assert (=> d!54385 (= lt!89501 (select (arr!3614 (_keys!5600 thiss!1248)) (index!4528 lt!89343)))))

(assert (=> d!54385 (validMask!0 (mask!8711 thiss!1248))))

(assert (=> d!54385 (= (seekKeyOrZeroReturnVacant!0 (x!19741 lt!89343) (index!4528 lt!89343) (index!4528 lt!89343) key!828 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)) lt!89500)))

(declare-fun b!180939 () Bool)

(assert (=> b!180939 (= e!119176 (MissingVacant!589 (index!4528 lt!89343)))))

(declare-fun b!180940 () Bool)

(assert (=> b!180940 (= e!119177 (Found!589 (index!4528 lt!89343)))))

(declare-fun b!180941 () Bool)

(assert (=> b!180941 (= e!119178 Undefined!589)))

(declare-fun b!180942 () Bool)

(declare-fun c!32418 () Bool)

(assert (=> b!180942 (= c!32418 (= lt!89501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180942 (= e!119177 e!119176)))

(assert (= (and d!54385 c!32419) b!180941))

(assert (= (and d!54385 (not c!32419)) b!180937))

(assert (= (and b!180937 c!32420) b!180940))

(assert (= (and b!180937 (not c!32420)) b!180942))

(assert (= (and b!180942 c!32418) b!180939))

(assert (= (and b!180942 (not c!32418)) b!180938))

(declare-fun m!209063 () Bool)

(assert (=> b!180938 m!209063))

(assert (=> b!180938 m!209063))

(declare-fun m!209065 () Bool)

(assert (=> b!180938 m!209065))

(declare-fun m!209067 () Bool)

(assert (=> d!54385 m!209067))

(declare-fun m!209069 () Bool)

(assert (=> d!54385 m!209069))

(assert (=> d!54385 m!208839))

(assert (=> d!54385 m!208789))

(assert (=> b!180732 d!54385))

(declare-fun d!54387 () Bool)

(declare-fun e!119179 () Bool)

(assert (=> d!54387 e!119179))

(declare-fun res!85678 () Bool)

(assert (=> d!54387 (=> res!85678 e!119179)))

(declare-fun lt!89502 () Bool)

(assert (=> d!54387 (= res!85678 (not lt!89502))))

(declare-fun lt!89503 () Bool)

(assert (=> d!54387 (= lt!89502 lt!89503)))

(declare-fun lt!89505 () Unit!5496)

(declare-fun e!119180 () Unit!5496)

(assert (=> d!54387 (= lt!89505 e!119180)))

(declare-fun c!32421 () Bool)

(assert (=> d!54387 (= c!32421 lt!89503)))

(assert (=> d!54387 (= lt!89503 (containsKey!211 (toList!1138 lt!89420) (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54387 (= (contains!1226 lt!89420 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)) lt!89502)))

(declare-fun b!180943 () Bool)

(declare-fun lt!89504 () Unit!5496)

(assert (=> b!180943 (= e!119180 lt!89504)))

(assert (=> b!180943 (= lt!89504 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1138 lt!89420) (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180943 (isDefined!160 (getValueByKey!208 (toList!1138 lt!89420) (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180944 () Bool)

(declare-fun Unit!5502 () Unit!5496)

(assert (=> b!180944 (= e!119180 Unit!5502)))

(declare-fun b!180945 () Bool)

(assert (=> b!180945 (= e!119179 (isDefined!160 (getValueByKey!208 (toList!1138 lt!89420) (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54387 c!32421) b!180943))

(assert (= (and d!54387 (not c!32421)) b!180944))

(assert (= (and d!54387 (not res!85678)) b!180945))

(assert (=> d!54387 m!208867))

(declare-fun m!209071 () Bool)

(assert (=> d!54387 m!209071))

(assert (=> b!180943 m!208867))

(declare-fun m!209073 () Bool)

(assert (=> b!180943 m!209073))

(assert (=> b!180943 m!208867))

(assert (=> b!180943 m!209055))

(assert (=> b!180943 m!209055))

(declare-fun m!209075 () Bool)

(assert (=> b!180943 m!209075))

(assert (=> b!180945 m!208867))

(assert (=> b!180945 m!209055))

(assert (=> b!180945 m!209055))

(assert (=> b!180945 m!209075))

(assert (=> b!180803 d!54387))

(declare-fun d!54389 () Bool)

(declare-fun e!119181 () Bool)

(assert (=> d!54389 e!119181))

(declare-fun res!85679 () Bool)

(assert (=> d!54389 (=> (not res!85679) (not e!119181))))

(declare-fun lt!89507 () ListLongMap!2245)

(assert (=> d!54389 (= res!85679 (contains!1226 lt!89507 (_1!1673 (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(declare-fun lt!89506 () List!2269)

(assert (=> d!54389 (= lt!89507 (ListLongMap!2246 lt!89506))))

(declare-fun lt!89508 () Unit!5496)

(declare-fun lt!89509 () Unit!5496)

(assert (=> d!54389 (= lt!89508 lt!89509)))

(assert (=> d!54389 (= (getValueByKey!208 lt!89506 (_1!1673 (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))) (Some!213 (_2!1673 (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(assert (=> d!54389 (= lt!89509 (lemmaContainsTupThenGetReturnValue!110 lt!89506 (_1!1673 (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) (_2!1673 (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(assert (=> d!54389 (= lt!89506 (insertStrictlySorted!113 (toList!1138 (ite c!32383 call!18264 (ite c!32385 call!18260 call!18265))) (_1!1673 (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) (_2!1673 (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(assert (=> d!54389 (= (+!270 (ite c!32383 call!18264 (ite c!32385 call!18260 call!18265)) (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) lt!89507)))

(declare-fun b!180946 () Bool)

(declare-fun res!85680 () Bool)

(assert (=> b!180946 (=> (not res!85680) (not e!119181))))

(assert (=> b!180946 (= res!85680 (= (getValueByKey!208 (toList!1138 lt!89507) (_1!1673 (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))) (Some!213 (_2!1673 (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))))

(declare-fun b!180947 () Bool)

(assert (=> b!180947 (= e!119181 (contains!1228 (toList!1138 lt!89507) (ite (or c!32383 c!32385) (tuple2!3325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(assert (= (and d!54389 res!85679) b!180946))

(assert (= (and b!180946 res!85680) b!180947))

(declare-fun m!209077 () Bool)

(assert (=> d!54389 m!209077))

(declare-fun m!209079 () Bool)

(assert (=> d!54389 m!209079))

(declare-fun m!209081 () Bool)

(assert (=> d!54389 m!209081))

(declare-fun m!209083 () Bool)

(assert (=> d!54389 m!209083))

(declare-fun m!209085 () Bool)

(assert (=> b!180946 m!209085))

(declare-fun m!209087 () Bool)

(assert (=> b!180947 m!209087))

(assert (=> bm!18256 d!54389))

(declare-fun d!54391 () Bool)

(declare-fun e!119182 () Bool)

(assert (=> d!54391 e!119182))

(declare-fun res!85681 () Bool)

(assert (=> d!54391 (=> res!85681 e!119182)))

(declare-fun lt!89510 () Bool)

(assert (=> d!54391 (= res!85681 (not lt!89510))))

(declare-fun lt!89511 () Bool)

(assert (=> d!54391 (= lt!89510 lt!89511)))

(declare-fun lt!89513 () Unit!5496)

(declare-fun e!119183 () Unit!5496)

(assert (=> d!54391 (= lt!89513 e!119183)))

(declare-fun c!32422 () Bool)

(assert (=> d!54391 (= c!32422 lt!89511)))

(assert (=> d!54391 (= lt!89511 (containsKey!211 (toList!1138 lt!89420) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54391 (= (contains!1226 lt!89420 #b0000000000000000000000000000000000000000000000000000000000000000) lt!89510)))

(declare-fun b!180948 () Bool)

(declare-fun lt!89512 () Unit!5496)

(assert (=> b!180948 (= e!119183 lt!89512)))

(assert (=> b!180948 (= lt!89512 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1138 lt!89420) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180948 (isDefined!160 (getValueByKey!208 (toList!1138 lt!89420) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180949 () Bool)

(declare-fun Unit!5503 () Unit!5496)

(assert (=> b!180949 (= e!119183 Unit!5503)))

(declare-fun b!180950 () Bool)

(assert (=> b!180950 (= e!119182 (isDefined!160 (getValueByKey!208 (toList!1138 lt!89420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54391 c!32422) b!180948))

(assert (= (and d!54391 (not c!32422)) b!180949))

(assert (= (and d!54391 (not res!85681)) b!180950))

(declare-fun m!209089 () Bool)

(assert (=> d!54391 m!209089))

(declare-fun m!209091 () Bool)

(assert (=> b!180948 m!209091))

(declare-fun m!209093 () Bool)

(assert (=> b!180948 m!209093))

(assert (=> b!180948 m!209093))

(declare-fun m!209095 () Bool)

(assert (=> b!180948 m!209095))

(assert (=> b!180950 m!209093))

(assert (=> b!180950 m!209093))

(assert (=> b!180950 m!209095))

(assert (=> bm!18258 d!54391))

(declare-fun b!180961 () Bool)

(declare-fun e!119195 () Bool)

(declare-fun contains!1229 (List!2271 (_ BitVec 64)) Bool)

(assert (=> b!180961 (= e!119195 (contains!1229 Nil!2268 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180962 () Bool)

(declare-fun e!119193 () Bool)

(declare-fun e!119192 () Bool)

(assert (=> b!180962 (= e!119193 e!119192)))

(declare-fun c!32425 () Bool)

(assert (=> b!180962 (= c!32425 (validKeyInArray!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18268 () Bool)

(declare-fun call!18271 () Bool)

(assert (=> bm!18268 (= call!18271 (arrayNoDuplicates!0 (_keys!5600 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32425 (Cons!2267 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000) Nil!2268) Nil!2268)))))

(declare-fun d!54393 () Bool)

(declare-fun res!85689 () Bool)

(declare-fun e!119194 () Bool)

(assert (=> d!54393 (=> res!85689 e!119194)))

(assert (=> d!54393 (= res!85689 (bvsge #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(assert (=> d!54393 (= (arrayNoDuplicates!0 (_keys!5600 thiss!1248) #b00000000000000000000000000000000 Nil!2268) e!119194)))

(declare-fun b!180963 () Bool)

(assert (=> b!180963 (= e!119192 call!18271)))

(declare-fun b!180964 () Bool)

(assert (=> b!180964 (= e!119192 call!18271)))

(declare-fun b!180965 () Bool)

(assert (=> b!180965 (= e!119194 e!119193)))

(declare-fun res!85688 () Bool)

(assert (=> b!180965 (=> (not res!85688) (not e!119193))))

(assert (=> b!180965 (= res!85688 (not e!119195))))

(declare-fun res!85690 () Bool)

(assert (=> b!180965 (=> (not res!85690) (not e!119195))))

(assert (=> b!180965 (= res!85690 (validKeyInArray!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54393 (not res!85689)) b!180965))

(assert (= (and b!180965 res!85690) b!180961))

(assert (= (and b!180965 res!85688) b!180962))

(assert (= (and b!180962 c!32425) b!180964))

(assert (= (and b!180962 (not c!32425)) b!180963))

(assert (= (or b!180964 b!180963) bm!18268))

(assert (=> b!180961 m!208867))

(assert (=> b!180961 m!208867))

(declare-fun m!209097 () Bool)

(assert (=> b!180961 m!209097))

(assert (=> b!180962 m!208867))

(assert (=> b!180962 m!208867))

(assert (=> b!180962 m!208869))

(assert (=> bm!18268 m!208867))

(declare-fun m!209099 () Bool)

(assert (=> bm!18268 m!209099))

(assert (=> b!180965 m!208867))

(assert (=> b!180965 m!208867))

(assert (=> b!180965 m!208869))

(assert (=> b!180742 d!54393))

(assert (=> b!180801 d!54337))

(declare-fun d!54395 () Bool)

(assert (=> d!54395 (= (apply!150 lt!89420 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2074 (getValueByKey!208 (toList!1138 lt!89420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7408 () Bool)

(assert (= bs!7408 d!54395))

(assert (=> bs!7408 m!209093))

(assert (=> bs!7408 m!209093))

(declare-fun m!209101 () Bool)

(assert (=> bs!7408 m!209101))

(assert (=> b!180808 d!54395))

(declare-fun b!180974 () Bool)

(declare-fun e!119203 () Bool)

(declare-fun call!18274 () Bool)

(assert (=> b!180974 (= e!119203 call!18274)))

(declare-fun bm!18271 () Bool)

(assert (=> bm!18271 (= call!18274 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5600 thiss!1248) (mask!8711 thiss!1248)))))

(declare-fun b!180975 () Bool)

(declare-fun e!119204 () Bool)

(assert (=> b!180975 (= e!119203 e!119204)))

(declare-fun lt!89520 () (_ BitVec 64))

(assert (=> b!180975 (= lt!89520 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89521 () Unit!5496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7635 (_ BitVec 64) (_ BitVec 32)) Unit!5496)

(assert (=> b!180975 (= lt!89521 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5600 thiss!1248) lt!89520 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!180975 (arrayContainsKey!0 (_keys!5600 thiss!1248) lt!89520 #b00000000000000000000000000000000)))

(declare-fun lt!89522 () Unit!5496)

(assert (=> b!180975 (= lt!89522 lt!89521)))

(declare-fun res!85696 () Bool)

(assert (=> b!180975 (= res!85696 (= (seekEntryOrOpen!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000) (_keys!5600 thiss!1248) (mask!8711 thiss!1248)) (Found!589 #b00000000000000000000000000000000)))))

(assert (=> b!180975 (=> (not res!85696) (not e!119204))))

(declare-fun b!180976 () Bool)

(declare-fun e!119202 () Bool)

(assert (=> b!180976 (= e!119202 e!119203)))

(declare-fun c!32428 () Bool)

(assert (=> b!180976 (= c!32428 (validKeyInArray!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54397 () Bool)

(declare-fun res!85695 () Bool)

(assert (=> d!54397 (=> res!85695 e!119202)))

(assert (=> d!54397 (= res!85695 (bvsge #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(assert (=> d!54397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)) e!119202)))

(declare-fun b!180977 () Bool)

(assert (=> b!180977 (= e!119204 call!18274)))

(assert (= (and d!54397 (not res!85695)) b!180976))

(assert (= (and b!180976 c!32428) b!180975))

(assert (= (and b!180976 (not c!32428)) b!180974))

(assert (= (and b!180975 res!85696) b!180977))

(assert (= (or b!180977 b!180974) bm!18271))

(declare-fun m!209103 () Bool)

(assert (=> bm!18271 m!209103))

(assert (=> b!180975 m!208867))

(declare-fun m!209105 () Bool)

(assert (=> b!180975 m!209105))

(declare-fun m!209107 () Bool)

(assert (=> b!180975 m!209107))

(assert (=> b!180975 m!208867))

(declare-fun m!209109 () Bool)

(assert (=> b!180975 m!209109))

(assert (=> b!180976 m!208867))

(assert (=> b!180976 m!208867))

(assert (=> b!180976 m!208869))

(assert (=> b!180741 d!54397))

(declare-fun d!54399 () Bool)

(declare-fun isEmpty!462 (Option!214) Bool)

(assert (=> d!54399 (= (isDefined!160 (getValueByKey!208 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828)) (not (isEmpty!462 (getValueByKey!208 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))))

(declare-fun bs!7409 () Bool)

(assert (= bs!7409 d!54399))

(assert (=> bs!7409 m!208855))

(declare-fun m!209111 () Bool)

(assert (=> bs!7409 m!209111))

(assert (=> b!180751 d!54399))

(declare-fun b!180987 () Bool)

(declare-fun e!119209 () Option!214)

(declare-fun e!119210 () Option!214)

(assert (=> b!180987 (= e!119209 e!119210)))

(declare-fun c!32434 () Bool)

(assert (=> b!180987 (= c!32434 (and ((_ is Cons!2265) (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) (not (= (_1!1673 (h!2890 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828))))))

(declare-fun b!180986 () Bool)

(assert (=> b!180986 (= e!119209 (Some!213 (_2!1673 (h!2890 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))))))

(declare-fun d!54401 () Bool)

(declare-fun c!32433 () Bool)

(assert (=> d!54401 (= c!32433 (and ((_ is Cons!2265) (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) (= (_1!1673 (h!2890 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828)))))

(assert (=> d!54401 (= (getValueByKey!208 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828) e!119209)))

(declare-fun b!180989 () Bool)

(assert (=> b!180989 (= e!119210 None!212)))

(declare-fun b!180988 () Bool)

(assert (=> b!180988 (= e!119210 (getValueByKey!208 (t!7111 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) key!828))))

(assert (= (and d!54401 c!32433) b!180986))

(assert (= (and d!54401 (not c!32433)) b!180987))

(assert (= (and b!180987 c!32434) b!180988))

(assert (= (and b!180987 (not c!32434)) b!180989))

(declare-fun m!209113 () Bool)

(assert (=> b!180988 m!209113))

(assert (=> b!180751 d!54401))

(declare-fun d!54403 () Bool)

(declare-fun lt!89525 () (_ BitVec 32))

(assert (=> d!54403 (and (bvsge lt!89525 #b00000000000000000000000000000000) (bvsle lt!89525 (bvsub (size!3922 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119216 () (_ BitVec 32))

(assert (=> d!54403 (= lt!89525 e!119216)))

(declare-fun c!32440 () Bool)

(assert (=> d!54403 (= c!32440 (bvsge #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))))))

(assert (=> d!54403 (and (bvsle #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3922 (_keys!5600 thiss!1248)) (size!3922 (_keys!5600 thiss!1248))))))

(assert (=> d!54403 (= (arrayCountValidKeys!0 (_keys!5600 thiss!1248) #b00000000000000000000000000000000 (size!3922 (_keys!5600 thiss!1248))) lt!89525)))

(declare-fun b!180998 () Bool)

(assert (=> b!180998 (= e!119216 #b00000000000000000000000000000000)))

(declare-fun b!180999 () Bool)

(declare-fun e!119215 () (_ BitVec 32))

(declare-fun call!18277 () (_ BitVec 32))

(assert (=> b!180999 (= e!119215 call!18277)))

(declare-fun bm!18274 () Bool)

(assert (=> bm!18274 (= call!18277 (arrayCountValidKeys!0 (_keys!5600 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3922 (_keys!5600 thiss!1248))))))

(declare-fun b!181000 () Bool)

(assert (=> b!181000 (= e!119215 (bvadd #b00000000000000000000000000000001 call!18277))))

(declare-fun b!181001 () Bool)

(assert (=> b!181001 (= e!119216 e!119215)))

(declare-fun c!32439 () Bool)

(assert (=> b!181001 (= c!32439 (validKeyInArray!0 (select (arr!3614 (_keys!5600 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54403 c!32440) b!180998))

(assert (= (and d!54403 (not c!32440)) b!181001))

(assert (= (and b!181001 c!32439) b!181000))

(assert (= (and b!181001 (not c!32439)) b!180999))

(assert (= (or b!181000 b!180999) bm!18274))

(declare-fun m!209115 () Bool)

(assert (=> bm!18274 m!209115))

(assert (=> b!181001 m!208867))

(assert (=> b!181001 m!208867))

(assert (=> b!181001 m!208869))

(assert (=> b!180740 d!54403))

(assert (=> d!54335 d!54331))

(declare-fun d!54405 () Bool)

(declare-fun e!119217 () Bool)

(assert (=> d!54405 e!119217))

(declare-fun res!85697 () Bool)

(assert (=> d!54405 (=> (not res!85697) (not e!119217))))

(declare-fun lt!89527 () ListLongMap!2245)

(assert (=> d!54405 (= res!85697 (contains!1226 lt!89527 (_1!1673 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(declare-fun lt!89526 () List!2269)

(assert (=> d!54405 (= lt!89527 (ListLongMap!2246 lt!89526))))

(declare-fun lt!89528 () Unit!5496)

(declare-fun lt!89529 () Unit!5496)

(assert (=> d!54405 (= lt!89528 lt!89529)))

(assert (=> d!54405 (= (getValueByKey!208 lt!89526 (_1!1673 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(assert (=> d!54405 (= lt!89529 (lemmaContainsTupThenGetReturnValue!110 lt!89526 (_1!1673 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(assert (=> d!54405 (= lt!89526 (insertStrictlySorted!113 (toList!1138 call!18261) (_1!1673 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))) (_2!1673 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(assert (=> d!54405 (= (+!270 call!18261 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))) lt!89527)))

(declare-fun b!181002 () Bool)

(declare-fun res!85698 () Bool)

(assert (=> b!181002 (=> (not res!85698) (not e!119217))))

(assert (=> b!181002 (= res!85698 (= (getValueByKey!208 (toList!1138 lt!89527) (_1!1673 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) (Some!213 (_2!1673 (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(declare-fun b!181003 () Bool)

(assert (=> b!181003 (= e!119217 (contains!1228 (toList!1138 lt!89527) (tuple2!3325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))

(assert (= (and d!54405 res!85697) b!181002))

(assert (= (and b!181002 res!85698) b!181003))

(declare-fun m!209117 () Bool)

(assert (=> d!54405 m!209117))

(declare-fun m!209119 () Bool)

(assert (=> d!54405 m!209119))

(declare-fun m!209121 () Bool)

(assert (=> d!54405 m!209121))

(declare-fun m!209123 () Bool)

(assert (=> d!54405 m!209123))

(declare-fun m!209125 () Bool)

(assert (=> b!181002 m!209125))

(declare-fun m!209127 () Bool)

(assert (=> b!181003 m!209127))

(assert (=> b!180799 d!54405))

(declare-fun d!54407 () Bool)

(declare-fun res!85707 () Bool)

(declare-fun e!119220 () Bool)

(assert (=> d!54407 (=> (not res!85707) (not e!119220))))

(assert (=> d!54407 (= res!85707 (validMask!0 (mask!8711 thiss!1248)))))

(assert (=> d!54407 (= (simpleValid!166 thiss!1248) e!119220)))

(declare-fun b!181012 () Bool)

(declare-fun res!85708 () Bool)

(assert (=> b!181012 (=> (not res!85708) (not e!119220))))

(assert (=> b!181012 (= res!85708 (and (= (size!3923 (_values!3689 thiss!1248)) (bvadd (mask!8711 thiss!1248) #b00000000000000000000000000000001)) (= (size!3922 (_keys!5600 thiss!1248)) (size!3923 (_values!3689 thiss!1248))) (bvsge (_size!1278 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1278 thiss!1248) (bvadd (mask!8711 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!181015 () Bool)

(assert (=> b!181015 (= e!119220 (and (bvsge (extraKeys!3443 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3443 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1278 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!181014 () Bool)

(declare-fun res!85709 () Bool)

(assert (=> b!181014 (=> (not res!85709) (not e!119220))))

(declare-fun size!3928 (LongMapFixedSize!2458) (_ BitVec 32))

(assert (=> b!181014 (= res!85709 (= (size!3928 thiss!1248) (bvadd (_size!1278 thiss!1248) (bvsdiv (bvadd (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!181013 () Bool)

(declare-fun res!85710 () Bool)

(assert (=> b!181013 (=> (not res!85710) (not e!119220))))

(assert (=> b!181013 (= res!85710 (bvsge (size!3928 thiss!1248) (_size!1278 thiss!1248)))))

(assert (= (and d!54407 res!85707) b!181012))

(assert (= (and b!181012 res!85708) b!181013))

(assert (= (and b!181013 res!85710) b!181014))

(assert (= (and b!181014 res!85709) b!181015))

(assert (=> d!54407 m!208789))

(declare-fun m!209129 () Bool)

(assert (=> b!181014 m!209129))

(assert (=> b!181013 m!209129))

(assert (=> d!54329 d!54407))

(assert (=> bm!18260 d!54361))

(declare-fun d!54409 () Bool)

(assert (=> d!54409 (isDefined!160 (getValueByKey!208 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(declare-fun lt!89532 () Unit!5496)

(declare-fun choose!967 (List!2269 (_ BitVec 64)) Unit!5496)

(assert (=> d!54409 (= lt!89532 (choose!967 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(declare-fun e!119223 () Bool)

(assert (=> d!54409 e!119223))

(declare-fun res!85713 () Bool)

(assert (=> d!54409 (=> (not res!85713) (not e!119223))))

(declare-fun isStrictlySorted!328 (List!2269) Bool)

(assert (=> d!54409 (= res!85713 (isStrictlySorted!328 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))))

(assert (=> d!54409 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828) lt!89532)))

(declare-fun b!181018 () Bool)

(assert (=> b!181018 (= e!119223 (containsKey!211 (toList!1138 (getCurrentListMap!790 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(assert (= (and d!54409 res!85713) b!181018))

(assert (=> d!54409 m!208855))

(assert (=> d!54409 m!208855))

(assert (=> d!54409 m!208857))

(declare-fun m!209131 () Bool)

(assert (=> d!54409 m!209131))

(declare-fun m!209133 () Bool)

(assert (=> d!54409 m!209133))

(assert (=> b!181018 m!208851))

(assert (=> b!180749 d!54409))

(assert (=> b!180749 d!54399))

(assert (=> b!180749 d!54401))

(declare-fun condMapEmpty!7268 () Bool)

(declare-fun mapDefault!7268 () ValueCell!1775)

(assert (=> mapNonEmpty!7267 (= condMapEmpty!7268 (= mapRest!7267 ((as const (Array (_ BitVec 32) ValueCell!1775)) mapDefault!7268)))))

(declare-fun e!119225 () Bool)

(declare-fun mapRes!7268 () Bool)

(assert (=> mapNonEmpty!7267 (= tp!16150 (and e!119225 mapRes!7268))))

(declare-fun mapIsEmpty!7268 () Bool)

(assert (=> mapIsEmpty!7268 mapRes!7268))

(declare-fun b!181019 () Bool)

(declare-fun e!119224 () Bool)

(assert (=> b!181019 (= e!119224 tp_is_empty!4237)))

(declare-fun b!181020 () Bool)

(assert (=> b!181020 (= e!119225 tp_is_empty!4237)))

(declare-fun mapNonEmpty!7268 () Bool)

(declare-fun tp!16151 () Bool)

(assert (=> mapNonEmpty!7268 (= mapRes!7268 (and tp!16151 e!119224))))

(declare-fun mapKey!7268 () (_ BitVec 32))

(declare-fun mapRest!7268 () (Array (_ BitVec 32) ValueCell!1775))

(declare-fun mapValue!7268 () ValueCell!1775)

(assert (=> mapNonEmpty!7268 (= mapRest!7267 (store mapRest!7268 mapKey!7268 mapValue!7268))))

(assert (= (and mapNonEmpty!7267 condMapEmpty!7268) mapIsEmpty!7268))

(assert (= (and mapNonEmpty!7267 (not condMapEmpty!7268)) mapNonEmpty!7268))

(assert (= (and mapNonEmpty!7268 ((_ is ValueCellFull!1775) mapValue!7268)) b!181019))

(assert (= (and mapNonEmpty!7267 ((_ is ValueCellFull!1775) mapDefault!7268)) b!181020))

(declare-fun m!209135 () Bool)

(assert (=> mapNonEmpty!7268 m!209135))

(declare-fun b_lambda!7153 () Bool)

(assert (= b_lambda!7149 (or (and b!180661 b_free!4465) b_lambda!7153)))

(declare-fun b_lambda!7155 () Bool)

(assert (= b_lambda!7151 (or (and b!180661 b_free!4465) b_lambda!7155)))

(check-sat (not b!180842) b_and!11025 (not b_lambda!7153) (not d!54369) (not b!180947) (not b!180891) (not b!180869) (not b!180988) (not b!180888) (not b_next!4465) (not d!54405) (not b!180946) (not b!180839) (not d!54339) (not d!54353) (not b!180924) (not d!54345) (not b!180876) (not b!180874) (not d!54361) (not b!180976) (not d!54365) (not b!180923) (not b!180965) (not b!180841) (not d!54399) (not b!180943) (not b!180914) (not b!180868) (not b!180889) (not b!181002) (not d!54389) (not d!54359) (not d!54357) (not b!180867) (not d!54367) (not b!180879) (not b!180837) (not d!54363) (not b!180831) (not b_lambda!7155) (not b!180950) (not b!181014) (not d!54379) (not d!54391) (not b!180961) (not mapNonEmpty!7268) (not b!180975) (not d!54409) (not d!54349) (not b_lambda!7147) (not bm!18274) (not d!54347) (not b!181018) (not d!54375) (not d!54351) (not b!180962) (not d!54341) (not b!181001) tp_is_empty!4237 (not b!180838) (not d!54373) (not d!54343) (not b!180880) (not b!180875) (not bm!18271) (not d!54385) (not b!181013) (not d!54407) (not b!180829) (not b!180840) (not b!181003) (not b!180877) (not b!180948) (not d!54395) (not b!180938) (not b!180871) (not bm!18268) (not d!54387) (not d!54381) (not d!54355) (not b!180945) (not bm!18265))
(check-sat b_and!11025 (not b_next!4465))
