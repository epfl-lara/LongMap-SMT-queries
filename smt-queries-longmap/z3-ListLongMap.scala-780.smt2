; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18466 () Bool)

(assert start!18466)

(declare-fun b!183176 () Bool)

(declare-fun b_free!4519 () Bool)

(declare-fun b_next!4519 () Bool)

(assert (=> b!183176 (= b_free!4519 (not b_next!4519))))

(declare-fun tp!16325 () Bool)

(declare-fun b_and!11101 () Bool)

(assert (=> b!183176 (= tp!16325 b_and!11101)))

(declare-fun b!183174 () Bool)

(declare-fun res!86715 () Bool)

(declare-fun e!120586 () Bool)

(assert (=> b!183174 (=> (not res!86715) (not e!120586))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!183174 (= res!86715 (not (= key!828 (bvneg key!828))))))

(declare-fun b!183175 () Bool)

(declare-fun e!120584 () Bool)

(assert (=> b!183175 (= e!120586 e!120584)))

(declare-fun res!86712 () Bool)

(assert (=> b!183175 (=> (not res!86712) (not e!120584))))

(declare-datatypes ((SeekEntryResult!606 0))(
  ( (MissingZero!606 (index!4594 (_ BitVec 32))) (Found!606 (index!4595 (_ BitVec 32))) (Intermediate!606 (undefined!1418 Bool) (index!4596 (_ BitVec 32)) (x!19942 (_ BitVec 32))) (Undefined!606) (MissingVacant!606 (index!4597 (_ BitVec 32))) )
))
(declare-fun lt!90582 () SeekEntryResult!606)

(get-info :version)

(assert (=> b!183175 (= res!86712 (and (not ((_ is Undefined!606) lt!90582)) (not ((_ is MissingVacant!606) lt!90582)) (not ((_ is MissingZero!606) lt!90582)) ((_ is Found!606) lt!90582)))))

(declare-datatypes ((V!5369 0))(
  ( (V!5370 (val!2190 Int)) )
))
(declare-datatypes ((ValueCell!1802 0))(
  ( (ValueCellFull!1802 (v!4093 V!5369)) (EmptyCell!1802) )
))
(declare-datatypes ((array!7759 0))(
  ( (array!7760 (arr!3668 (Array (_ BitVec 32) (_ BitVec 64))) (size!3980 (_ BitVec 32))) )
))
(declare-datatypes ((array!7761 0))(
  ( (array!7762 (arr!3669 (Array (_ BitVec 32) ValueCell!1802)) (size!3981 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2512 0))(
  ( (LongMapFixedSize!2513 (defaultEntry!3745 Int) (mask!8803 (_ BitVec 32)) (extraKeys!3482 (_ BitVec 32)) (zeroValue!3586 V!5369) (minValue!3586 V!5369) (_size!1305 (_ BitVec 32)) (_keys!5662 array!7759) (_values!3728 array!7761) (_vacant!1305 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2512)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7759 (_ BitVec 32)) SeekEntryResult!606)

(assert (=> b!183175 (= lt!90582 (seekEntryOrOpen!0 key!828 (_keys!5662 thiss!1248) (mask!8803 thiss!1248)))))

(declare-fun res!86714 () Bool)

(assert (=> start!18466 (=> (not res!86714) (not e!120586))))

(declare-fun valid!1061 (LongMapFixedSize!2512) Bool)

(assert (=> start!18466 (= res!86714 (valid!1061 thiss!1248))))

(assert (=> start!18466 e!120586))

(declare-fun e!120589 () Bool)

(assert (=> start!18466 e!120589))

(assert (=> start!18466 true))

(declare-fun tp_is_empty!4291 () Bool)

(declare-fun e!120590 () Bool)

(declare-fun array_inv!2369 (array!7759) Bool)

(declare-fun array_inv!2370 (array!7761) Bool)

(assert (=> b!183176 (= e!120589 (and tp!16325 tp_is_empty!4291 (array_inv!2369 (_keys!5662 thiss!1248)) (array_inv!2370 (_values!3728 thiss!1248)) e!120590))))

(declare-fun b!183177 () Bool)

(declare-fun e!120587 () Bool)

(assert (=> b!183177 (= e!120587 tp_is_empty!4291)))

(declare-fun b!183178 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183178 (= e!120584 (not (validMask!0 (mask!8803 thiss!1248))))))

(declare-fun mapNonEmpty!7367 () Bool)

(declare-fun mapRes!7367 () Bool)

(declare-fun tp!16324 () Bool)

(assert (=> mapNonEmpty!7367 (= mapRes!7367 (and tp!16324 e!120587))))

(declare-fun mapKey!7367 () (_ BitVec 32))

(declare-fun mapValue!7367 () ValueCell!1802)

(declare-fun mapRest!7367 () (Array (_ BitVec 32) ValueCell!1802))

(assert (=> mapNonEmpty!7367 (= (arr!3669 (_values!3728 thiss!1248)) (store mapRest!7367 mapKey!7367 mapValue!7367))))

(declare-fun b!183179 () Bool)

(declare-fun e!120585 () Bool)

(assert (=> b!183179 (= e!120590 (and e!120585 mapRes!7367))))

(declare-fun condMapEmpty!7367 () Bool)

(declare-fun mapDefault!7367 () ValueCell!1802)

(assert (=> b!183179 (= condMapEmpty!7367 (= (arr!3669 (_values!3728 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1802)) mapDefault!7367)))))

(declare-fun mapIsEmpty!7367 () Bool)

(assert (=> mapIsEmpty!7367 mapRes!7367))

(declare-fun b!183180 () Bool)

(assert (=> b!183180 (= e!120585 tp_is_empty!4291)))

(declare-fun b!183181 () Bool)

(declare-fun res!86713 () Bool)

(assert (=> b!183181 (=> (not res!86713) (not e!120584))))

(declare-datatypes ((tuple2!3356 0))(
  ( (tuple2!3357 (_1!1689 (_ BitVec 64)) (_2!1689 V!5369)) )
))
(declare-datatypes ((List!2297 0))(
  ( (Nil!2294) (Cons!2293 (h!2922 tuple2!3356) (t!7155 List!2297)) )
))
(declare-datatypes ((ListLongMap!2277 0))(
  ( (ListLongMap!2278 (toList!1154 List!2297)) )
))
(declare-fun contains!1252 (ListLongMap!2277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!806 (array!7759 array!7761 (_ BitVec 32) (_ BitVec 32) V!5369 V!5369 (_ BitVec 32) Int) ListLongMap!2277)

(assert (=> b!183181 (= res!86713 (not (contains!1252 (getCurrentListMap!806 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)) key!828)))))

(assert (= (and start!18466 res!86714) b!183174))

(assert (= (and b!183174 res!86715) b!183175))

(assert (= (and b!183175 res!86712) b!183181))

(assert (= (and b!183181 res!86713) b!183178))

(assert (= (and b!183179 condMapEmpty!7367) mapIsEmpty!7367))

(assert (= (and b!183179 (not condMapEmpty!7367)) mapNonEmpty!7367))

(assert (= (and mapNonEmpty!7367 ((_ is ValueCellFull!1802) mapValue!7367)) b!183177))

(assert (= (and b!183179 ((_ is ValueCellFull!1802) mapDefault!7367)) b!183180))

(assert (= b!183176 b!183179))

(assert (= start!18466 b!183176))

(declare-fun m!210875 () Bool)

(assert (=> b!183175 m!210875))

(declare-fun m!210877 () Bool)

(assert (=> b!183176 m!210877))

(declare-fun m!210879 () Bool)

(assert (=> b!183176 m!210879))

(declare-fun m!210881 () Bool)

(assert (=> mapNonEmpty!7367 m!210881))

(declare-fun m!210883 () Bool)

(assert (=> b!183181 m!210883))

(assert (=> b!183181 m!210883))

(declare-fun m!210885 () Bool)

(assert (=> b!183181 m!210885))

(declare-fun m!210887 () Bool)

(assert (=> start!18466 m!210887))

(declare-fun m!210889 () Bool)

(assert (=> b!183178 m!210889))

(check-sat (not b!183181) b_and!11101 (not b!183175) (not b!183178) (not b_next!4519) (not start!18466) (not mapNonEmpty!7367) (not b!183176) tp_is_empty!4291)
(check-sat b_and!11101 (not b_next!4519))
(get-model)

(declare-fun b!183242 () Bool)

(declare-fun e!120639 () SeekEntryResult!606)

(declare-fun e!120640 () SeekEntryResult!606)

(assert (=> b!183242 (= e!120639 e!120640)))

(declare-fun lt!90597 () (_ BitVec 64))

(declare-fun lt!90595 () SeekEntryResult!606)

(assert (=> b!183242 (= lt!90597 (select (arr!3668 (_keys!5662 thiss!1248)) (index!4596 lt!90595)))))

(declare-fun c!32839 () Bool)

(assert (=> b!183242 (= c!32839 (= lt!90597 key!828))))

(declare-fun d!54761 () Bool)

(declare-fun lt!90596 () SeekEntryResult!606)

(assert (=> d!54761 (and (or ((_ is Undefined!606) lt!90596) (not ((_ is Found!606) lt!90596)) (and (bvsge (index!4595 lt!90596) #b00000000000000000000000000000000) (bvslt (index!4595 lt!90596) (size!3980 (_keys!5662 thiss!1248))))) (or ((_ is Undefined!606) lt!90596) ((_ is Found!606) lt!90596) (not ((_ is MissingZero!606) lt!90596)) (and (bvsge (index!4594 lt!90596) #b00000000000000000000000000000000) (bvslt (index!4594 lt!90596) (size!3980 (_keys!5662 thiss!1248))))) (or ((_ is Undefined!606) lt!90596) ((_ is Found!606) lt!90596) ((_ is MissingZero!606) lt!90596) (not ((_ is MissingVacant!606) lt!90596)) (and (bvsge (index!4597 lt!90596) #b00000000000000000000000000000000) (bvslt (index!4597 lt!90596) (size!3980 (_keys!5662 thiss!1248))))) (or ((_ is Undefined!606) lt!90596) (ite ((_ is Found!606) lt!90596) (= (select (arr!3668 (_keys!5662 thiss!1248)) (index!4595 lt!90596)) key!828) (ite ((_ is MissingZero!606) lt!90596) (= (select (arr!3668 (_keys!5662 thiss!1248)) (index!4594 lt!90596)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!606) lt!90596) (= (select (arr!3668 (_keys!5662 thiss!1248)) (index!4597 lt!90596)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54761 (= lt!90596 e!120639)))

(declare-fun c!32837 () Bool)

(assert (=> d!54761 (= c!32837 (and ((_ is Intermediate!606) lt!90595) (undefined!1418 lt!90595)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7759 (_ BitVec 32)) SeekEntryResult!606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54761 (= lt!90595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8803 thiss!1248)) key!828 (_keys!5662 thiss!1248) (mask!8803 thiss!1248)))))

(assert (=> d!54761 (validMask!0 (mask!8803 thiss!1248))))

(assert (=> d!54761 (= (seekEntryOrOpen!0 key!828 (_keys!5662 thiss!1248) (mask!8803 thiss!1248)) lt!90596)))

(declare-fun b!183243 () Bool)

(assert (=> b!183243 (= e!120639 Undefined!606)))

(declare-fun b!183244 () Bool)

(declare-fun c!32838 () Bool)

(assert (=> b!183244 (= c!32838 (= lt!90597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120641 () SeekEntryResult!606)

(assert (=> b!183244 (= e!120640 e!120641)))

(declare-fun b!183245 () Bool)

(assert (=> b!183245 (= e!120641 (MissingZero!606 (index!4596 lt!90595)))))

(declare-fun b!183246 () Bool)

(assert (=> b!183246 (= e!120640 (Found!606 (index!4596 lt!90595)))))

(declare-fun b!183247 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7759 (_ BitVec 32)) SeekEntryResult!606)

(assert (=> b!183247 (= e!120641 (seekKeyOrZeroReturnVacant!0 (x!19942 lt!90595) (index!4596 lt!90595) (index!4596 lt!90595) key!828 (_keys!5662 thiss!1248) (mask!8803 thiss!1248)))))

(assert (= (and d!54761 c!32837) b!183243))

(assert (= (and d!54761 (not c!32837)) b!183242))

(assert (= (and b!183242 c!32839) b!183246))

(assert (= (and b!183242 (not c!32839)) b!183244))

(assert (= (and b!183244 c!32838) b!183245))

(assert (= (and b!183244 (not c!32838)) b!183247))

(declare-fun m!210923 () Bool)

(assert (=> b!183242 m!210923))

(declare-fun m!210925 () Bool)

(assert (=> d!54761 m!210925))

(assert (=> d!54761 m!210889))

(declare-fun m!210927 () Bool)

(assert (=> d!54761 m!210927))

(declare-fun m!210929 () Bool)

(assert (=> d!54761 m!210929))

(declare-fun m!210931 () Bool)

(assert (=> d!54761 m!210931))

(assert (=> d!54761 m!210927))

(declare-fun m!210933 () Bool)

(assert (=> d!54761 m!210933))

(declare-fun m!210935 () Bool)

(assert (=> b!183247 m!210935))

(assert (=> b!183175 d!54761))

(declare-fun d!54763 () Bool)

(assert (=> d!54763 (= (array_inv!2369 (_keys!5662 thiss!1248)) (bvsge (size!3980 (_keys!5662 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183176 d!54763))

(declare-fun d!54765 () Bool)

(assert (=> d!54765 (= (array_inv!2370 (_values!3728 thiss!1248)) (bvsge (size!3981 (_values!3728 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183176 d!54765))

(declare-fun d!54767 () Bool)

(declare-fun res!86746 () Bool)

(declare-fun e!120644 () Bool)

(assert (=> d!54767 (=> (not res!86746) (not e!120644))))

(declare-fun simpleValid!174 (LongMapFixedSize!2512) Bool)

(assert (=> d!54767 (= res!86746 (simpleValid!174 thiss!1248))))

(assert (=> d!54767 (= (valid!1061 thiss!1248) e!120644)))

(declare-fun b!183254 () Bool)

(declare-fun res!86747 () Bool)

(assert (=> b!183254 (=> (not res!86747) (not e!120644))))

(declare-fun arrayCountValidKeys!0 (array!7759 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183254 (= res!86747 (= (arrayCountValidKeys!0 (_keys!5662 thiss!1248) #b00000000000000000000000000000000 (size!3980 (_keys!5662 thiss!1248))) (_size!1305 thiss!1248)))))

(declare-fun b!183255 () Bool)

(declare-fun res!86748 () Bool)

(assert (=> b!183255 (=> (not res!86748) (not e!120644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7759 (_ BitVec 32)) Bool)

(assert (=> b!183255 (= res!86748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5662 thiss!1248) (mask!8803 thiss!1248)))))

(declare-fun b!183256 () Bool)

(declare-datatypes ((List!2299 0))(
  ( (Nil!2296) (Cons!2295 (h!2924 (_ BitVec 64)) (t!7159 List!2299)) )
))
(declare-fun arrayNoDuplicates!0 (array!7759 (_ BitVec 32) List!2299) Bool)

(assert (=> b!183256 (= e!120644 (arrayNoDuplicates!0 (_keys!5662 thiss!1248) #b00000000000000000000000000000000 Nil!2296))))

(assert (= (and d!54767 res!86746) b!183254))

(assert (= (and b!183254 res!86747) b!183255))

(assert (= (and b!183255 res!86748) b!183256))

(declare-fun m!210937 () Bool)

(assert (=> d!54767 m!210937))

(declare-fun m!210939 () Bool)

(assert (=> b!183254 m!210939))

(declare-fun m!210941 () Bool)

(assert (=> b!183255 m!210941))

(declare-fun m!210943 () Bool)

(assert (=> b!183256 m!210943))

(assert (=> start!18466 d!54767))

(declare-fun d!54769 () Bool)

(assert (=> d!54769 (= (validMask!0 (mask!8803 thiss!1248)) (and (or (= (mask!8803 thiss!1248) #b00000000000000000000000000000111) (= (mask!8803 thiss!1248) #b00000000000000000000000000001111) (= (mask!8803 thiss!1248) #b00000000000000000000000000011111) (= (mask!8803 thiss!1248) #b00000000000000000000000000111111) (= (mask!8803 thiss!1248) #b00000000000000000000000001111111) (= (mask!8803 thiss!1248) #b00000000000000000000000011111111) (= (mask!8803 thiss!1248) #b00000000000000000000000111111111) (= (mask!8803 thiss!1248) #b00000000000000000000001111111111) (= (mask!8803 thiss!1248) #b00000000000000000000011111111111) (= (mask!8803 thiss!1248) #b00000000000000000000111111111111) (= (mask!8803 thiss!1248) #b00000000000000000001111111111111) (= (mask!8803 thiss!1248) #b00000000000000000011111111111111) (= (mask!8803 thiss!1248) #b00000000000000000111111111111111) (= (mask!8803 thiss!1248) #b00000000000000001111111111111111) (= (mask!8803 thiss!1248) #b00000000000000011111111111111111) (= (mask!8803 thiss!1248) #b00000000000000111111111111111111) (= (mask!8803 thiss!1248) #b00000000000001111111111111111111) (= (mask!8803 thiss!1248) #b00000000000011111111111111111111) (= (mask!8803 thiss!1248) #b00000000000111111111111111111111) (= (mask!8803 thiss!1248) #b00000000001111111111111111111111) (= (mask!8803 thiss!1248) #b00000000011111111111111111111111) (= (mask!8803 thiss!1248) #b00000000111111111111111111111111) (= (mask!8803 thiss!1248) #b00000001111111111111111111111111) (= (mask!8803 thiss!1248) #b00000011111111111111111111111111) (= (mask!8803 thiss!1248) #b00000111111111111111111111111111) (= (mask!8803 thiss!1248) #b00001111111111111111111111111111) (= (mask!8803 thiss!1248) #b00011111111111111111111111111111) (= (mask!8803 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8803 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!183178 d!54769))

(declare-fun d!54771 () Bool)

(declare-fun e!120650 () Bool)

(assert (=> d!54771 e!120650))

(declare-fun res!86751 () Bool)

(assert (=> d!54771 (=> res!86751 e!120650)))

(declare-fun lt!90609 () Bool)

(assert (=> d!54771 (= res!86751 (not lt!90609))))

(declare-fun lt!90606 () Bool)

(assert (=> d!54771 (= lt!90609 lt!90606)))

(declare-datatypes ((Unit!5544 0))(
  ( (Unit!5545) )
))
(declare-fun lt!90607 () Unit!5544)

(declare-fun e!120649 () Unit!5544)

(assert (=> d!54771 (= lt!90607 e!120649)))

(declare-fun c!32842 () Bool)

(assert (=> d!54771 (= c!32842 lt!90606)))

(declare-fun containsKey!219 (List!2297 (_ BitVec 64)) Bool)

(assert (=> d!54771 (= lt!90606 (containsKey!219 (toList!1154 (getCurrentListMap!806 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248))) key!828))))

(assert (=> d!54771 (= (contains!1252 (getCurrentListMap!806 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)) key!828) lt!90609)))

(declare-fun b!183263 () Bool)

(declare-fun lt!90608 () Unit!5544)

(assert (=> b!183263 (= e!120649 lt!90608)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!167 (List!2297 (_ BitVec 64)) Unit!5544)

(assert (=> b!183263 (= lt!90608 (lemmaContainsKeyImpliesGetValueByKeyDefined!167 (toList!1154 (getCurrentListMap!806 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248))) key!828))))

(declare-datatypes ((Option!222 0))(
  ( (Some!221 (v!4096 V!5369)) (None!220) )
))
(declare-fun isDefined!168 (Option!222) Bool)

(declare-fun getValueByKey!216 (List!2297 (_ BitVec 64)) Option!222)

(assert (=> b!183263 (isDefined!168 (getValueByKey!216 (toList!1154 (getCurrentListMap!806 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248))) key!828))))

(declare-fun b!183264 () Bool)

(declare-fun Unit!5546 () Unit!5544)

(assert (=> b!183264 (= e!120649 Unit!5546)))

(declare-fun b!183265 () Bool)

(assert (=> b!183265 (= e!120650 (isDefined!168 (getValueByKey!216 (toList!1154 (getCurrentListMap!806 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248))) key!828)))))

(assert (= (and d!54771 c!32842) b!183263))

(assert (= (and d!54771 (not c!32842)) b!183264))

(assert (= (and d!54771 (not res!86751)) b!183265))

(declare-fun m!210945 () Bool)

(assert (=> d!54771 m!210945))

(declare-fun m!210947 () Bool)

(assert (=> b!183263 m!210947))

(declare-fun m!210949 () Bool)

(assert (=> b!183263 m!210949))

(assert (=> b!183263 m!210949))

(declare-fun m!210951 () Bool)

(assert (=> b!183263 m!210951))

(assert (=> b!183265 m!210949))

(assert (=> b!183265 m!210949))

(assert (=> b!183265 m!210951))

(assert (=> b!183181 d!54771))

(declare-fun b!183308 () Bool)

(declare-fun e!120684 () Bool)

(declare-fun call!18492 () Bool)

(assert (=> b!183308 (= e!120684 (not call!18492))))

(declare-fun b!183309 () Bool)

(declare-fun e!120688 () Bool)

(declare-fun lt!90669 () ListLongMap!2277)

(declare-fun apply!158 (ListLongMap!2277 (_ BitVec 64)) V!5369)

(assert (=> b!183309 (= e!120688 (= (apply!158 lt!90669 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3586 thiss!1248)))))

(declare-fun b!183310 () Bool)

(declare-fun e!120683 () Bool)

(declare-fun e!120685 () Bool)

(assert (=> b!183310 (= e!120683 e!120685)))

(declare-fun res!86776 () Bool)

(assert (=> b!183310 (=> (not res!86776) (not e!120685))))

(assert (=> b!183310 (= res!86776 (contains!1252 lt!90669 (select (arr!3668 (_keys!5662 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3980 (_keys!5662 thiss!1248))))))

(declare-fun b!183311 () Bool)

(declare-fun res!86775 () Bool)

(declare-fun e!120677 () Bool)

(assert (=> b!183311 (=> (not res!86775) (not e!120677))))

(declare-fun e!120689 () Bool)

(assert (=> b!183311 (= res!86775 e!120689)))

(declare-fun c!32858 () Bool)

(assert (=> b!183311 (= c!32858 (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!183312 () Bool)

(declare-fun e!120687 () ListLongMap!2277)

(declare-fun call!18491 () ListLongMap!2277)

(assert (=> b!183312 (= e!120687 call!18491)))

(declare-fun bm!18487 () Bool)

(declare-fun call!18490 () ListLongMap!2277)

(declare-fun getCurrentListMapNoExtraKeys!189 (array!7759 array!7761 (_ BitVec 32) (_ BitVec 32) V!5369 V!5369 (_ BitVec 32) Int) ListLongMap!2277)

(assert (=> bm!18487 (= call!18490 (getCurrentListMapNoExtraKeys!189 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun b!183313 () Bool)

(assert (=> b!183313 (= e!120684 e!120688)))

(declare-fun res!86771 () Bool)

(assert (=> b!183313 (= res!86771 call!18492)))

(assert (=> b!183313 (=> (not res!86771) (not e!120688))))

(declare-fun b!183314 () Bool)

(declare-fun e!120680 () ListLongMap!2277)

(declare-fun call!18494 () ListLongMap!2277)

(assert (=> b!183314 (= e!120680 call!18494)))

(declare-fun b!183315 () Bool)

(declare-fun e!120678 () ListLongMap!2277)

(assert (=> b!183315 (= e!120678 e!120687)))

(declare-fun c!32855 () Bool)

(assert (=> b!183315 (= c!32855 (and (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183316 () Bool)

(declare-fun e!120686 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!183316 (= e!120686 (validKeyInArray!0 (select (arr!3668 (_keys!5662 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18488 () Bool)

(declare-fun call!18496 () ListLongMap!2277)

(assert (=> bm!18488 (= call!18491 call!18496)))

(declare-fun d!54773 () Bool)

(assert (=> d!54773 e!120677))

(declare-fun res!86773 () Bool)

(assert (=> d!54773 (=> (not res!86773) (not e!120677))))

(assert (=> d!54773 (= res!86773 (or (bvsge #b00000000000000000000000000000000 (size!3980 (_keys!5662 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3980 (_keys!5662 thiss!1248))))))))

(declare-fun lt!90666 () ListLongMap!2277)

(assert (=> d!54773 (= lt!90669 lt!90666)))

(declare-fun lt!90674 () Unit!5544)

(declare-fun e!120681 () Unit!5544)

(assert (=> d!54773 (= lt!90674 e!120681)))

(declare-fun c!32857 () Bool)

(declare-fun e!120679 () Bool)

(assert (=> d!54773 (= c!32857 e!120679)))

(declare-fun res!86778 () Bool)

(assert (=> d!54773 (=> (not res!86778) (not e!120679))))

(assert (=> d!54773 (= res!86778 (bvslt #b00000000000000000000000000000000 (size!3980 (_keys!5662 thiss!1248))))))

(assert (=> d!54773 (= lt!90666 e!120678)))

(declare-fun c!32859 () Bool)

(assert (=> d!54773 (= c!32859 (and (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54773 (validMask!0 (mask!8803 thiss!1248))))

(assert (=> d!54773 (= (getCurrentListMap!806 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)) lt!90669)))

(declare-fun b!183317 () Bool)

(assert (=> b!183317 (= e!120677 e!120684)))

(declare-fun c!32856 () Bool)

(assert (=> b!183317 (= c!32856 (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18489 () Bool)

(assert (=> bm!18489 (= call!18492 (contains!1252 lt!90669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183318 () Bool)

(declare-fun +!278 (ListLongMap!2277 tuple2!3356) ListLongMap!2277)

(assert (=> b!183318 (= e!120678 (+!278 call!18496 (tuple2!3357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3586 thiss!1248))))))

(declare-fun b!183319 () Bool)

(declare-fun Unit!5547 () Unit!5544)

(assert (=> b!183319 (= e!120681 Unit!5547)))

(declare-fun bm!18490 () Bool)

(declare-fun call!18493 () ListLongMap!2277)

(assert (=> bm!18490 (= call!18493 call!18490)))

(declare-fun b!183320 () Bool)

(declare-fun e!120682 () Bool)

(assert (=> b!183320 (= e!120682 (= (apply!158 lt!90669 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3586 thiss!1248)))))

(declare-fun b!183321 () Bool)

(declare-fun get!2111 (ValueCell!1802 V!5369) V!5369)

(declare-fun dynLambda!501 (Int (_ BitVec 64)) V!5369)

(assert (=> b!183321 (= e!120685 (= (apply!158 lt!90669 (select (arr!3668 (_keys!5662 thiss!1248)) #b00000000000000000000000000000000)) (get!2111 (select (arr!3669 (_values!3728 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!501 (defaultEntry!3745 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183321 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3981 (_values!3728 thiss!1248))))))

(assert (=> b!183321 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3980 (_keys!5662 thiss!1248))))))

(declare-fun b!183322 () Bool)

(assert (=> b!183322 (= e!120680 call!18491)))

(declare-fun b!183323 () Bool)

(declare-fun lt!90655 () Unit!5544)

(assert (=> b!183323 (= e!120681 lt!90655)))

(declare-fun lt!90667 () ListLongMap!2277)

(assert (=> b!183323 (= lt!90667 (getCurrentListMapNoExtraKeys!189 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun lt!90675 () (_ BitVec 64))

(assert (=> b!183323 (= lt!90675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90668 () (_ BitVec 64))

(assert (=> b!183323 (= lt!90668 (select (arr!3668 (_keys!5662 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90656 () Unit!5544)

(declare-fun addStillContains!134 (ListLongMap!2277 (_ BitVec 64) V!5369 (_ BitVec 64)) Unit!5544)

(assert (=> b!183323 (= lt!90656 (addStillContains!134 lt!90667 lt!90675 (zeroValue!3586 thiss!1248) lt!90668))))

(assert (=> b!183323 (contains!1252 (+!278 lt!90667 (tuple2!3357 lt!90675 (zeroValue!3586 thiss!1248))) lt!90668)))

(declare-fun lt!90662 () Unit!5544)

(assert (=> b!183323 (= lt!90662 lt!90656)))

(declare-fun lt!90670 () ListLongMap!2277)

(assert (=> b!183323 (= lt!90670 (getCurrentListMapNoExtraKeys!189 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun lt!90658 () (_ BitVec 64))

(assert (=> b!183323 (= lt!90658 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90672 () (_ BitVec 64))

(assert (=> b!183323 (= lt!90672 (select (arr!3668 (_keys!5662 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90664 () Unit!5544)

(declare-fun addApplyDifferent!134 (ListLongMap!2277 (_ BitVec 64) V!5369 (_ BitVec 64)) Unit!5544)

(assert (=> b!183323 (= lt!90664 (addApplyDifferent!134 lt!90670 lt!90658 (minValue!3586 thiss!1248) lt!90672))))

(assert (=> b!183323 (= (apply!158 (+!278 lt!90670 (tuple2!3357 lt!90658 (minValue!3586 thiss!1248))) lt!90672) (apply!158 lt!90670 lt!90672))))

(declare-fun lt!90660 () Unit!5544)

(assert (=> b!183323 (= lt!90660 lt!90664)))

(declare-fun lt!90657 () ListLongMap!2277)

(assert (=> b!183323 (= lt!90657 (getCurrentListMapNoExtraKeys!189 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun lt!90659 () (_ BitVec 64))

(assert (=> b!183323 (= lt!90659 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90673 () (_ BitVec 64))

(assert (=> b!183323 (= lt!90673 (select (arr!3668 (_keys!5662 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90654 () Unit!5544)

(assert (=> b!183323 (= lt!90654 (addApplyDifferent!134 lt!90657 lt!90659 (zeroValue!3586 thiss!1248) lt!90673))))

(assert (=> b!183323 (= (apply!158 (+!278 lt!90657 (tuple2!3357 lt!90659 (zeroValue!3586 thiss!1248))) lt!90673) (apply!158 lt!90657 lt!90673))))

(declare-fun lt!90665 () Unit!5544)

(assert (=> b!183323 (= lt!90665 lt!90654)))

(declare-fun lt!90671 () ListLongMap!2277)

(assert (=> b!183323 (= lt!90671 (getCurrentListMapNoExtraKeys!189 (_keys!5662 thiss!1248) (_values!3728 thiss!1248) (mask!8803 thiss!1248) (extraKeys!3482 thiss!1248) (zeroValue!3586 thiss!1248) (minValue!3586 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3745 thiss!1248)))))

(declare-fun lt!90663 () (_ BitVec 64))

(assert (=> b!183323 (= lt!90663 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90661 () (_ BitVec 64))

(assert (=> b!183323 (= lt!90661 (select (arr!3668 (_keys!5662 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183323 (= lt!90655 (addApplyDifferent!134 lt!90671 lt!90663 (minValue!3586 thiss!1248) lt!90661))))

(assert (=> b!183323 (= (apply!158 (+!278 lt!90671 (tuple2!3357 lt!90663 (minValue!3586 thiss!1248))) lt!90661) (apply!158 lt!90671 lt!90661))))

(declare-fun b!183324 () Bool)

(declare-fun res!86777 () Bool)

(assert (=> b!183324 (=> (not res!86777) (not e!120677))))

(assert (=> b!183324 (= res!86777 e!120683)))

(declare-fun res!86772 () Bool)

(assert (=> b!183324 (=> res!86772 e!120683)))

(assert (=> b!183324 (= res!86772 (not e!120686))))

(declare-fun res!86774 () Bool)

(assert (=> b!183324 (=> (not res!86774) (not e!120686))))

(assert (=> b!183324 (= res!86774 (bvslt #b00000000000000000000000000000000 (size!3980 (_keys!5662 thiss!1248))))))

(declare-fun bm!18491 () Bool)

(declare-fun call!18495 () Bool)

(assert (=> bm!18491 (= call!18495 (contains!1252 lt!90669 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183325 () Bool)

(assert (=> b!183325 (= e!120689 (not call!18495))))

(declare-fun bm!18492 () Bool)

(assert (=> bm!18492 (= call!18496 (+!278 (ite c!32859 call!18490 (ite c!32855 call!18493 call!18494)) (ite (or c!32859 c!32855) (tuple2!3357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3586 thiss!1248)) (tuple2!3357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3586 thiss!1248)))))))

(declare-fun b!183326 () Bool)

(assert (=> b!183326 (= e!120679 (validKeyInArray!0 (select (arr!3668 (_keys!5662 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183327 () Bool)

(declare-fun c!32860 () Bool)

(assert (=> b!183327 (= c!32860 (and (not (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3482 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!183327 (= e!120687 e!120680)))

(declare-fun b!183328 () Bool)

(assert (=> b!183328 (= e!120689 e!120682)))

(declare-fun res!86770 () Bool)

(assert (=> b!183328 (= res!86770 call!18495)))

(assert (=> b!183328 (=> (not res!86770) (not e!120682))))

(declare-fun bm!18493 () Bool)

(assert (=> bm!18493 (= call!18494 call!18493)))

(assert (= (and d!54773 c!32859) b!183318))

(assert (= (and d!54773 (not c!32859)) b!183315))

(assert (= (and b!183315 c!32855) b!183312))

(assert (= (and b!183315 (not c!32855)) b!183327))

(assert (= (and b!183327 c!32860) b!183322))

(assert (= (and b!183327 (not c!32860)) b!183314))

(assert (= (or b!183322 b!183314) bm!18493))

(assert (= (or b!183312 bm!18493) bm!18490))

(assert (= (or b!183312 b!183322) bm!18488))

(assert (= (or b!183318 bm!18490) bm!18487))

(assert (= (or b!183318 bm!18488) bm!18492))

(assert (= (and d!54773 res!86778) b!183326))

(assert (= (and d!54773 c!32857) b!183323))

(assert (= (and d!54773 (not c!32857)) b!183319))

(assert (= (and d!54773 res!86773) b!183324))

(assert (= (and b!183324 res!86774) b!183316))

(assert (= (and b!183324 (not res!86772)) b!183310))

(assert (= (and b!183310 res!86776) b!183321))

(assert (= (and b!183324 res!86777) b!183311))

(assert (= (and b!183311 c!32858) b!183328))

(assert (= (and b!183311 (not c!32858)) b!183325))

(assert (= (and b!183328 res!86770) b!183320))

(assert (= (or b!183328 b!183325) bm!18491))

(assert (= (and b!183311 res!86775) b!183317))

(assert (= (and b!183317 c!32856) b!183313))

(assert (= (and b!183317 (not c!32856)) b!183308))

(assert (= (and b!183313 res!86771) b!183309))

(assert (= (or b!183313 b!183308) bm!18489))

(declare-fun b_lambda!7209 () Bool)

(assert (=> (not b_lambda!7209) (not b!183321)))

(declare-fun t!7158 () Bool)

(declare-fun tb!2819 () Bool)

(assert (=> (and b!183176 (= (defaultEntry!3745 thiss!1248) (defaultEntry!3745 thiss!1248)) t!7158) tb!2819))

(declare-fun result!4751 () Bool)

(assert (=> tb!2819 (= result!4751 tp_is_empty!4291)))

(assert (=> b!183321 t!7158))

(declare-fun b_and!11107 () Bool)

(assert (= b_and!11101 (and (=> t!7158 result!4751) b_and!11107)))

(declare-fun m!210953 () Bool)

(assert (=> b!183310 m!210953))

(assert (=> b!183310 m!210953))

(declare-fun m!210955 () Bool)

(assert (=> b!183310 m!210955))

(assert (=> b!183326 m!210953))

(assert (=> b!183326 m!210953))

(declare-fun m!210957 () Bool)

(assert (=> b!183326 m!210957))

(declare-fun m!210959 () Bool)

(assert (=> bm!18489 m!210959))

(declare-fun m!210961 () Bool)

(assert (=> b!183323 m!210961))

(declare-fun m!210963 () Bool)

(assert (=> b!183323 m!210963))

(declare-fun m!210965 () Bool)

(assert (=> b!183323 m!210965))

(declare-fun m!210967 () Bool)

(assert (=> b!183323 m!210967))

(declare-fun m!210969 () Bool)

(assert (=> b!183323 m!210969))

(assert (=> b!183323 m!210953))

(declare-fun m!210971 () Bool)

(assert (=> b!183323 m!210971))

(declare-fun m!210973 () Bool)

(assert (=> b!183323 m!210973))

(declare-fun m!210975 () Bool)

(assert (=> b!183323 m!210975))

(declare-fun m!210977 () Bool)

(assert (=> b!183323 m!210977))

(declare-fun m!210979 () Bool)

(assert (=> b!183323 m!210979))

(assert (=> b!183323 m!210961))

(declare-fun m!210981 () Bool)

(assert (=> b!183323 m!210981))

(declare-fun m!210983 () Bool)

(assert (=> b!183323 m!210983))

(declare-fun m!210985 () Bool)

(assert (=> b!183323 m!210985))

(assert (=> b!183323 m!210965))

(declare-fun m!210987 () Bool)

(assert (=> b!183323 m!210987))

(assert (=> b!183323 m!210979))

(declare-fun m!210989 () Bool)

(assert (=> b!183323 m!210989))

(assert (=> b!183323 m!210971))

(declare-fun m!210991 () Bool)

(assert (=> b!183323 m!210991))

(assert (=> bm!18487 m!210975))

(declare-fun m!210993 () Bool)

(assert (=> b!183309 m!210993))

(declare-fun m!210995 () Bool)

(assert (=> b!183320 m!210995))

(declare-fun m!210997 () Bool)

(assert (=> bm!18492 m!210997))

(assert (=> b!183321 m!210953))

(assert (=> b!183321 m!210953))

(declare-fun m!210999 () Bool)

(assert (=> b!183321 m!210999))

(declare-fun m!211001 () Bool)

(assert (=> b!183321 m!211001))

(declare-fun m!211003 () Bool)

(assert (=> b!183321 m!211003))

(declare-fun m!211005 () Bool)

(assert (=> b!183321 m!211005))

(assert (=> b!183321 m!211001))

(assert (=> b!183321 m!211003))

(assert (=> b!183316 m!210953))

(assert (=> b!183316 m!210953))

(assert (=> b!183316 m!210957))

(assert (=> d!54773 m!210889))

(declare-fun m!211007 () Bool)

(assert (=> b!183318 m!211007))

(declare-fun m!211009 () Bool)

(assert (=> bm!18491 m!211009))

(assert (=> b!183181 d!54773))

(declare-fun b!183338 () Bool)

(declare-fun e!120694 () Bool)

(assert (=> b!183338 (= e!120694 tp_is_empty!4291)))

(declare-fun condMapEmpty!7376 () Bool)

(declare-fun mapDefault!7376 () ValueCell!1802)

(assert (=> mapNonEmpty!7367 (= condMapEmpty!7376 (= mapRest!7367 ((as const (Array (_ BitVec 32) ValueCell!1802)) mapDefault!7376)))))

(declare-fun mapRes!7376 () Bool)

(assert (=> mapNonEmpty!7367 (= tp!16324 (and e!120694 mapRes!7376))))

(declare-fun b!183337 () Bool)

(declare-fun e!120695 () Bool)

(assert (=> b!183337 (= e!120695 tp_is_empty!4291)))

(declare-fun mapIsEmpty!7376 () Bool)

(assert (=> mapIsEmpty!7376 mapRes!7376))

(declare-fun mapNonEmpty!7376 () Bool)

(declare-fun tp!16340 () Bool)

(assert (=> mapNonEmpty!7376 (= mapRes!7376 (and tp!16340 e!120695))))

(declare-fun mapValue!7376 () ValueCell!1802)

(declare-fun mapRest!7376 () (Array (_ BitVec 32) ValueCell!1802))

(declare-fun mapKey!7376 () (_ BitVec 32))

(assert (=> mapNonEmpty!7376 (= mapRest!7367 (store mapRest!7376 mapKey!7376 mapValue!7376))))

(assert (= (and mapNonEmpty!7367 condMapEmpty!7376) mapIsEmpty!7376))

(assert (= (and mapNonEmpty!7367 (not condMapEmpty!7376)) mapNonEmpty!7376))

(assert (= (and mapNonEmpty!7376 ((_ is ValueCellFull!1802) mapValue!7376)) b!183337))

(assert (= (and mapNonEmpty!7367 ((_ is ValueCellFull!1802) mapDefault!7376)) b!183338))

(declare-fun m!211011 () Bool)

(assert (=> mapNonEmpty!7376 m!211011))

(declare-fun b_lambda!7211 () Bool)

(assert (= b_lambda!7209 (or (and b!183176 b_free!4519) b_lambda!7211)))

(check-sat (not b!183326) (not d!54767) tp_is_empty!4291 (not b!183321) (not b!183323) (not b!183263) (not b!183310) (not b!183265) (not bm!18492) (not bm!18491) (not d!54771) (not bm!18487) (not bm!18489) (not b!183318) (not mapNonEmpty!7376) (not d!54761) (not b!183255) (not b!183316) (not b!183320) (not b!183254) b_and!11107 (not b_next!4519) (not b!183309) (not d!54773) (not b_lambda!7211) (not b!183256) (not b!183247))
(check-sat b_and!11107 (not b_next!4519))
