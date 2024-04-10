; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21960 () Bool)

(assert start!21960)

(declare-fun b!224714 () Bool)

(declare-fun b_free!6027 () Bool)

(declare-fun b_next!6027 () Bool)

(assert (=> b!224714 (= b_free!6027 (not b_next!6027))))

(declare-fun tp!21222 () Bool)

(declare-fun b_and!12925 () Bool)

(assert (=> b!224714 (= tp!21222 b_and!12925)))

(declare-fun b!224697 () Bool)

(declare-fun e!145869 () Bool)

(declare-fun call!20915 () Bool)

(assert (=> b!224697 (= e!145869 (not call!20915))))

(declare-fun b!224698 () Bool)

(declare-fun res!110576 () Bool)

(declare-fun e!145872 () Bool)

(assert (=> b!224698 (=> (not res!110576) (not e!145872))))

(declare-fun call!20916 () Bool)

(assert (=> b!224698 (= res!110576 call!20916)))

(declare-fun e!145865 () Bool)

(assert (=> b!224698 (= e!145865 e!145872)))

(declare-fun b!224699 () Bool)

(declare-fun e!145876 () Bool)

(declare-datatypes ((SeekEntryResult!860 0))(
  ( (MissingZero!860 (index!5610 (_ BitVec 32))) (Found!860 (index!5611 (_ BitVec 32))) (Intermediate!860 (undefined!1672 Bool) (index!5612 (_ BitVec 32)) (x!23144 (_ BitVec 32))) (Undefined!860) (MissingVacant!860 (index!5613 (_ BitVec 32))) )
))
(declare-fun lt!113225 () SeekEntryResult!860)

(get-info :version)

(assert (=> b!224699 (= e!145876 ((_ is Undefined!860) lt!113225))))

(declare-fun bm!20912 () Bool)

(declare-datatypes ((V!7499 0))(
  ( (V!7500 (val!2989 Int)) )
))
(declare-datatypes ((ValueCell!2601 0))(
  ( (ValueCellFull!2601 (v!5009 V!7499)) (EmptyCell!2601) )
))
(declare-datatypes ((array!11021 0))(
  ( (array!11022 (arr!5230 (Array (_ BitVec 32) ValueCell!2601)) (size!5563 (_ BitVec 32))) )
))
(declare-datatypes ((array!11023 0))(
  ( (array!11024 (arr!5231 (Array (_ BitVec 32) (_ BitVec 64))) (size!5564 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3102 0))(
  ( (LongMapFixedSize!3103 (defaultEntry!4210 Int) (mask!10046 (_ BitVec 32)) (extraKeys!3947 (_ BitVec 32)) (zeroValue!4051 V!7499) (minValue!4051 V!7499) (_size!1600 (_ BitVec 32)) (_keys!6264 array!11023) (_values!4193 array!11021) (_vacant!1600 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3102)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20912 (= call!20915 (arrayContainsKey!0 (_keys!6264 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224700 () Bool)

(declare-datatypes ((Unit!6760 0))(
  ( (Unit!6761) )
))
(declare-fun e!145875 () Unit!6760)

(declare-fun Unit!6762 () Unit!6760)

(assert (=> b!224700 (= e!145875 Unit!6762)))

(declare-fun lt!113229 () Unit!6760)

(declare-fun lemmaArrayContainsKeyThenInListMap!80 (array!11023 array!11021 (_ BitVec 32) (_ BitVec 32) V!7499 V!7499 (_ BitVec 64) (_ BitVec 32) Int) Unit!6760)

(assert (=> b!224700 (= lt!113229 (lemmaArrayContainsKeyThenInListMap!80 (_keys!6264 thiss!1504) (_values!4193 thiss!1504) (mask!10046 thiss!1504) (extraKeys!3947 thiss!1504) (zeroValue!4051 thiss!1504) (minValue!4051 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4210 thiss!1504)))))

(assert (=> b!224700 false))

(declare-fun mapNonEmpty!10003 () Bool)

(declare-fun mapRes!10003 () Bool)

(declare-fun tp!21223 () Bool)

(declare-fun e!145867 () Bool)

(assert (=> mapNonEmpty!10003 (= mapRes!10003 (and tp!21223 e!145867))))

(declare-fun mapRest!10003 () (Array (_ BitVec 32) ValueCell!2601))

(declare-fun mapValue!10003 () ValueCell!2601)

(declare-fun mapKey!10003 () (_ BitVec 32))

(assert (=> mapNonEmpty!10003 (= (arr!5230 (_values!4193 thiss!1504)) (store mapRest!10003 mapKey!10003 mapValue!10003))))

(declare-fun b!224701 () Bool)

(declare-fun e!145871 () Bool)

(assert (=> b!224701 (= e!145871 (not true))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((List!3340 0))(
  ( (Nil!3337) (Cons!3336 (h!3984 (_ BitVec 64)) (t!8299 List!3340)) )
))
(declare-fun arrayNoDuplicates!0 (array!11023 (_ BitVec 32) List!3340) Bool)

(assert (=> b!224701 (arrayNoDuplicates!0 (array!11024 (store (arr!5231 (_keys!6264 thiss!1504)) index!297 key!932) (size!5564 (_keys!6264 thiss!1504))) #b00000000000000000000000000000000 Nil!3337)))

(declare-fun lt!113231 () Unit!6760)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11023 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3340) Unit!6760)

(assert (=> b!224701 (= lt!113231 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6264 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3337))))

(declare-fun lt!113226 () Unit!6760)

(assert (=> b!224701 (= lt!113226 e!145875)))

(declare-fun c!37257 () Bool)

(assert (=> b!224701 (= c!37257 (arrayContainsKey!0 (_keys!6264 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224702 () Bool)

(assert (=> b!224702 (= e!145876 e!145869)))

(declare-fun res!110571 () Bool)

(assert (=> b!224702 (= res!110571 call!20916)))

(assert (=> b!224702 (=> (not res!110571) (not e!145869))))

(declare-fun b!224703 () Bool)

(declare-fun c!37259 () Bool)

(assert (=> b!224703 (= c!37259 ((_ is MissingVacant!860) lt!113225))))

(assert (=> b!224703 (= e!145865 e!145876)))

(declare-fun c!37258 () Bool)

(declare-fun bm!20913 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20913 (= call!20916 (inRange!0 (ite c!37258 (index!5610 lt!113225) (index!5613 lt!113225)) (mask!10046 thiss!1504)))))

(declare-fun b!224704 () Bool)

(declare-fun e!145873 () Bool)

(declare-fun tp_is_empty!5889 () Bool)

(assert (=> b!224704 (= e!145873 tp_is_empty!5889)))

(declare-fun b!224705 () Bool)

(declare-fun e!145874 () Bool)

(declare-fun e!145868 () Bool)

(assert (=> b!224705 (= e!145874 e!145868)))

(declare-fun res!110574 () Bool)

(assert (=> b!224705 (=> (not res!110574) (not e!145868))))

(assert (=> b!224705 (= res!110574 (or (= lt!113225 (MissingZero!860 index!297)) (= lt!113225 (MissingVacant!860 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11023 (_ BitVec 32)) SeekEntryResult!860)

(assert (=> b!224705 (= lt!113225 (seekEntryOrOpen!0 key!932 (_keys!6264 thiss!1504) (mask!10046 thiss!1504)))))

(declare-fun b!224706 () Bool)

(declare-fun Unit!6763 () Unit!6760)

(assert (=> b!224706 (= e!145875 Unit!6763)))

(declare-fun b!224707 () Bool)

(declare-fun e!145870 () Unit!6760)

(declare-fun lt!113230 () Unit!6760)

(assert (=> b!224707 (= e!145870 lt!113230)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!252 (array!11023 array!11021 (_ BitVec 32) (_ BitVec 32) V!7499 V!7499 (_ BitVec 64) Int) Unit!6760)

(assert (=> b!224707 (= lt!113230 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!252 (_keys!6264 thiss!1504) (_values!4193 thiss!1504) (mask!10046 thiss!1504) (extraKeys!3947 thiss!1504) (zeroValue!4051 thiss!1504) (minValue!4051 thiss!1504) key!932 (defaultEntry!4210 thiss!1504)))))

(assert (=> b!224707 (= c!37258 ((_ is MissingZero!860) lt!113225))))

(assert (=> b!224707 e!145865))

(declare-fun b!224708 () Bool)

(declare-fun Unit!6764 () Unit!6760)

(assert (=> b!224708 (= e!145870 Unit!6764)))

(declare-fun lt!113228 () Unit!6760)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!241 (array!11023 array!11021 (_ BitVec 32) (_ BitVec 32) V!7499 V!7499 (_ BitVec 64) Int) Unit!6760)

(assert (=> b!224708 (= lt!113228 (lemmaInListMapThenSeekEntryOrOpenFindsIt!241 (_keys!6264 thiss!1504) (_values!4193 thiss!1504) (mask!10046 thiss!1504) (extraKeys!3947 thiss!1504) (zeroValue!4051 thiss!1504) (minValue!4051 thiss!1504) key!932 (defaultEntry!4210 thiss!1504)))))

(assert (=> b!224708 false))

(declare-fun res!110578 () Bool)

(assert (=> start!21960 (=> (not res!110578) (not e!145874))))

(declare-fun valid!1251 (LongMapFixedSize!3102) Bool)

(assert (=> start!21960 (= res!110578 (valid!1251 thiss!1504))))

(assert (=> start!21960 e!145874))

(declare-fun e!145864 () Bool)

(assert (=> start!21960 e!145864))

(assert (=> start!21960 true))

(declare-fun b!224709 () Bool)

(assert (=> b!224709 (= e!145867 tp_is_empty!5889)))

(declare-fun b!224710 () Bool)

(declare-fun res!110572 () Bool)

(assert (=> b!224710 (=> (not res!110572) (not e!145872))))

(assert (=> b!224710 (= res!110572 (= (select (arr!5231 (_keys!6264 thiss!1504)) (index!5610 lt!113225)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224711 () Bool)

(declare-fun e!145866 () Bool)

(assert (=> b!224711 (= e!145866 (and e!145873 mapRes!10003))))

(declare-fun condMapEmpty!10003 () Bool)

(declare-fun mapDefault!10003 () ValueCell!2601)

(assert (=> b!224711 (= condMapEmpty!10003 (= (arr!5230 (_values!4193 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2601)) mapDefault!10003)))))

(declare-fun b!224712 () Bool)

(assert (=> b!224712 (= e!145872 (not call!20915))))

(declare-fun b!224713 () Bool)

(declare-fun res!110575 () Bool)

(assert (=> b!224713 (= res!110575 (= (select (arr!5231 (_keys!6264 thiss!1504)) (index!5613 lt!113225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224713 (=> (not res!110575) (not e!145869))))

(declare-fun array_inv!3461 (array!11023) Bool)

(declare-fun array_inv!3462 (array!11021) Bool)

(assert (=> b!224714 (= e!145864 (and tp!21222 tp_is_empty!5889 (array_inv!3461 (_keys!6264 thiss!1504)) (array_inv!3462 (_values!4193 thiss!1504)) e!145866))))

(declare-fun b!224715 () Bool)

(assert (=> b!224715 (= e!145868 e!145871)))

(declare-fun res!110577 () Bool)

(assert (=> b!224715 (=> (not res!110577) (not e!145871))))

(assert (=> b!224715 (= res!110577 (inRange!0 index!297 (mask!10046 thiss!1504)))))

(declare-fun lt!113227 () Unit!6760)

(assert (=> b!224715 (= lt!113227 e!145870)))

(declare-fun c!37260 () Bool)

(declare-datatypes ((tuple2!4428 0))(
  ( (tuple2!4429 (_1!2225 (_ BitVec 64)) (_2!2225 V!7499)) )
))
(declare-datatypes ((List!3341 0))(
  ( (Nil!3338) (Cons!3337 (h!3985 tuple2!4428) (t!8300 List!3341)) )
))
(declare-datatypes ((ListLongMap!3341 0))(
  ( (ListLongMap!3342 (toList!1686 List!3341)) )
))
(declare-fun contains!1560 (ListLongMap!3341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1214 (array!11023 array!11021 (_ BitVec 32) (_ BitVec 32) V!7499 V!7499 (_ BitVec 32) Int) ListLongMap!3341)

(assert (=> b!224715 (= c!37260 (contains!1560 (getCurrentListMap!1214 (_keys!6264 thiss!1504) (_values!4193 thiss!1504) (mask!10046 thiss!1504) (extraKeys!3947 thiss!1504) (zeroValue!4051 thiss!1504) (minValue!4051 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4210 thiss!1504)) key!932))))

(declare-fun b!224716 () Bool)

(declare-fun res!110573 () Bool)

(assert (=> b!224716 (=> (not res!110573) (not e!145874))))

(assert (=> b!224716 (= res!110573 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10003 () Bool)

(assert (=> mapIsEmpty!10003 mapRes!10003))

(assert (= (and start!21960 res!110578) b!224716))

(assert (= (and b!224716 res!110573) b!224705))

(assert (= (and b!224705 res!110574) b!224715))

(assert (= (and b!224715 c!37260) b!224708))

(assert (= (and b!224715 (not c!37260)) b!224707))

(assert (= (and b!224707 c!37258) b!224698))

(assert (= (and b!224707 (not c!37258)) b!224703))

(assert (= (and b!224698 res!110576) b!224710))

(assert (= (and b!224710 res!110572) b!224712))

(assert (= (and b!224703 c!37259) b!224702))

(assert (= (and b!224703 (not c!37259)) b!224699))

(assert (= (and b!224702 res!110571) b!224713))

(assert (= (and b!224713 res!110575) b!224697))

(assert (= (or b!224698 b!224702) bm!20913))

(assert (= (or b!224712 b!224697) bm!20912))

(assert (= (and b!224715 res!110577) b!224701))

(assert (= (and b!224701 c!37257) b!224700))

(assert (= (and b!224701 (not c!37257)) b!224706))

(assert (= (and b!224711 condMapEmpty!10003) mapIsEmpty!10003))

(assert (= (and b!224711 (not condMapEmpty!10003)) mapNonEmpty!10003))

(assert (= (and mapNonEmpty!10003 ((_ is ValueCellFull!2601) mapValue!10003)) b!224709))

(assert (= (and b!224711 ((_ is ValueCellFull!2601) mapDefault!10003)) b!224704))

(assert (= b!224714 b!224711))

(assert (= start!21960 b!224714))

(declare-fun m!247577 () Bool)

(assert (=> mapNonEmpty!10003 m!247577))

(declare-fun m!247579 () Bool)

(assert (=> b!224701 m!247579))

(declare-fun m!247581 () Bool)

(assert (=> b!224701 m!247581))

(declare-fun m!247583 () Bool)

(assert (=> b!224701 m!247583))

(declare-fun m!247585 () Bool)

(assert (=> b!224701 m!247585))

(declare-fun m!247587 () Bool)

(assert (=> b!224700 m!247587))

(declare-fun m!247589 () Bool)

(assert (=> b!224707 m!247589))

(declare-fun m!247591 () Bool)

(assert (=> start!21960 m!247591))

(declare-fun m!247593 () Bool)

(assert (=> b!224715 m!247593))

(declare-fun m!247595 () Bool)

(assert (=> b!224715 m!247595))

(assert (=> b!224715 m!247595))

(declare-fun m!247597 () Bool)

(assert (=> b!224715 m!247597))

(declare-fun m!247599 () Bool)

(assert (=> b!224705 m!247599))

(declare-fun m!247601 () Bool)

(assert (=> b!224708 m!247601))

(declare-fun m!247603 () Bool)

(assert (=> bm!20913 m!247603))

(declare-fun m!247605 () Bool)

(assert (=> b!224710 m!247605))

(declare-fun m!247607 () Bool)

(assert (=> b!224713 m!247607))

(assert (=> bm!20912 m!247585))

(declare-fun m!247609 () Bool)

(assert (=> b!224714 m!247609))

(declare-fun m!247611 () Bool)

(assert (=> b!224714 m!247611))

(check-sat (not mapNonEmpty!10003) (not bm!20913) (not b_next!6027) (not start!21960) (not b!224708) (not b!224707) (not b!224700) (not b!224714) tp_is_empty!5889 (not bm!20912) b_and!12925 (not b!224705) (not b!224715) (not b!224701))
(check-sat b_and!12925 (not b_next!6027))
