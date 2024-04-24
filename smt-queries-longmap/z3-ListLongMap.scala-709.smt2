; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16762 () Bool)

(assert start!16762)

(declare-fun b!168597 () Bool)

(declare-fun b_free!4063 () Bool)

(declare-fun b_next!4063 () Bool)

(assert (=> b!168597 (= b_free!4063 (not b_next!4063))))

(declare-fun tp!14790 () Bool)

(declare-fun b_and!10491 () Bool)

(assert (=> b!168597 (= tp!14790 b_and!10491)))

(declare-fun b!168587 () Bool)

(declare-fun e!110838 () Bool)

(declare-fun e!110837 () Bool)

(assert (=> b!168587 (= e!110838 e!110837)))

(declare-fun res!80257 () Bool)

(assert (=> b!168587 (=> (not res!80257) (not e!110837))))

(declare-datatypes ((SeekEntryResult!496 0))(
  ( (MissingZero!496 (index!4152 (_ BitVec 32))) (Found!496 (index!4153 (_ BitVec 32))) (Intermediate!496 (undefined!1308 Bool) (index!4154 (_ BitVec 32)) (x!18620 (_ BitVec 32))) (Undefined!496) (MissingVacant!496 (index!4155 (_ BitVec 32))) )
))
(declare-fun lt!84343 () SeekEntryResult!496)

(get-info :version)

(assert (=> b!168587 (= res!80257 (and (not ((_ is Undefined!496) lt!84343)) (not ((_ is MissingVacant!496) lt!84343)) (not ((_ is MissingZero!496) lt!84343)) ((_ is Found!496) lt!84343)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4801 0))(
  ( (V!4802 (val!1977 Int)) )
))
(declare-datatypes ((ValueCell!1589 0))(
  ( (ValueCellFull!1589 (v!3843 V!4801)) (EmptyCell!1589) )
))
(declare-datatypes ((array!6813 0))(
  ( (array!6814 (arr!3242 (Array (_ BitVec 32) (_ BitVec 64))) (size!3530 (_ BitVec 32))) )
))
(declare-datatypes ((array!6815 0))(
  ( (array!6816 (arr!3243 (Array (_ BitVec 32) ValueCell!1589)) (size!3531 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2086 0))(
  ( (LongMapFixedSize!2087 (defaultEntry!3485 Int) (mask!8252 (_ BitVec 32)) (extraKeys!3226 (_ BitVec 32)) (zeroValue!3328 V!4801) (minValue!3328 V!4801) (_size!1092 (_ BitVec 32)) (_keys!5310 array!6813) (_values!3468 array!6815) (_vacant!1092 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2086)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6813 (_ BitVec 32)) SeekEntryResult!496)

(assert (=> b!168587 (= lt!84343 (seekEntryOrOpen!0 key!828 (_keys!5310 thiss!1248) (mask!8252 thiss!1248)))))

(declare-fun b!168588 () Bool)

(declare-fun res!80256 () Bool)

(assert (=> b!168588 (=> (not res!80256) (not e!110838))))

(assert (=> b!168588 (= res!80256 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168589 () Bool)

(declare-fun res!80255 () Bool)

(declare-fun e!110840 () Bool)

(assert (=> b!168589 (=> res!80255 e!110840)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6813 (_ BitVec 32)) Bool)

(assert (=> b!168589 (= res!80255 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5310 thiss!1248) (mask!8252 thiss!1248))))))

(declare-fun mapNonEmpty!6516 () Bool)

(declare-fun mapRes!6516 () Bool)

(declare-fun tp!14789 () Bool)

(declare-fun e!110841 () Bool)

(assert (=> mapNonEmpty!6516 (= mapRes!6516 (and tp!14789 e!110841))))

(declare-fun mapValue!6516 () ValueCell!1589)

(declare-fun mapRest!6516 () (Array (_ BitVec 32) ValueCell!1589))

(declare-fun mapKey!6516 () (_ BitVec 32))

(assert (=> mapNonEmpty!6516 (= (arr!3243 (_values!3468 thiss!1248)) (store mapRest!6516 mapKey!6516 mapValue!6516))))

(declare-fun b!168590 () Bool)

(declare-fun e!110843 () Bool)

(declare-fun e!110835 () Bool)

(assert (=> b!168590 (= e!110843 (and e!110835 mapRes!6516))))

(declare-fun condMapEmpty!6516 () Bool)

(declare-fun mapDefault!6516 () ValueCell!1589)

(assert (=> b!168590 (= condMapEmpty!6516 (= (arr!3243 (_values!3468 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1589)) mapDefault!6516)))))

(declare-fun b!168591 () Bool)

(declare-datatypes ((Unit!5195 0))(
  ( (Unit!5196) )
))
(declare-fun e!110839 () Unit!5195)

(declare-fun Unit!5197 () Unit!5195)

(assert (=> b!168591 (= e!110839 Unit!5197)))

(declare-fun lt!84339 () Unit!5195)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!117 (array!6813 array!6815 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 64) Int) Unit!5195)

(assert (=> b!168591 (= lt!84339 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!117 (_keys!5310 thiss!1248) (_values!3468 thiss!1248) (mask!8252 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) key!828 (defaultEntry!3485 thiss!1248)))))

(assert (=> b!168591 false))

(declare-fun b!168592 () Bool)

(declare-fun res!80259 () Bool)

(assert (=> b!168592 (=> res!80259 e!110840)))

(assert (=> b!168592 (= res!80259 (or (not (= (size!3531 (_values!3468 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8252 thiss!1248)))) (not (= (size!3530 (_keys!5310 thiss!1248)) (size!3531 (_values!3468 thiss!1248)))) (bvslt (mask!8252 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3226 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3226 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168593 () Bool)

(declare-fun tp_is_empty!3865 () Bool)

(assert (=> b!168593 (= e!110841 tp_is_empty!3865)))

(declare-fun b!168594 () Bool)

(declare-fun e!110842 () Bool)

(assert (=> b!168594 (= e!110842 (= (select (arr!3242 (_keys!5310 thiss!1248)) (index!4153 lt!84343)) key!828))))

(declare-fun b!168595 () Bool)

(assert (=> b!168595 (= e!110837 (not e!110840))))

(declare-fun res!80253 () Bool)

(assert (=> b!168595 (=> res!80253 e!110840)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168595 (= res!80253 (not (validMask!0 (mask!8252 thiss!1248))))))

(declare-datatypes ((tuple2!3136 0))(
  ( (tuple2!3137 (_1!1579 (_ BitVec 64)) (_2!1579 V!4801)) )
))
(declare-datatypes ((List!2147 0))(
  ( (Nil!2144) (Cons!2143 (h!2760 tuple2!3136) (t!6941 List!2147)) )
))
(declare-datatypes ((ListLongMap!2097 0))(
  ( (ListLongMap!2098 (toList!1064 List!2147)) )
))
(declare-fun lt!84341 () ListLongMap!2097)

(declare-fun v!309 () V!4801)

(declare-fun +!232 (ListLongMap!2097 tuple2!3136) ListLongMap!2097)

(declare-fun getCurrentListMap!726 (array!6813 array!6815 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 32) Int) ListLongMap!2097)

(assert (=> b!168595 (= (+!232 lt!84341 (tuple2!3137 key!828 v!309)) (getCurrentListMap!726 (_keys!5310 thiss!1248) (array!6816 (store (arr!3243 (_values!3468 thiss!1248)) (index!4153 lt!84343) (ValueCellFull!1589 v!309)) (size!3531 (_values!3468 thiss!1248))) (mask!8252 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3485 thiss!1248)))))

(declare-fun lt!84344 () Unit!5195)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!90 (array!6813 array!6815 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 32) (_ BitVec 64) V!4801 Int) Unit!5195)

(assert (=> b!168595 (= lt!84344 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!90 (_keys!5310 thiss!1248) (_values!3468 thiss!1248) (mask!8252 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) (index!4153 lt!84343) key!828 v!309 (defaultEntry!3485 thiss!1248)))))

(declare-fun lt!84342 () Unit!5195)

(assert (=> b!168595 (= lt!84342 e!110839)))

(declare-fun c!30389 () Bool)

(declare-fun contains!1116 (ListLongMap!2097 (_ BitVec 64)) Bool)

(assert (=> b!168595 (= c!30389 (contains!1116 lt!84341 key!828))))

(assert (=> b!168595 (= lt!84341 (getCurrentListMap!726 (_keys!5310 thiss!1248) (_values!3468 thiss!1248) (mask!8252 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3485 thiss!1248)))))

(declare-fun res!80254 () Bool)

(assert (=> start!16762 (=> (not res!80254) (not e!110838))))

(declare-fun valid!915 (LongMapFixedSize!2086) Bool)

(assert (=> start!16762 (= res!80254 (valid!915 thiss!1248))))

(assert (=> start!16762 e!110838))

(declare-fun e!110836 () Bool)

(assert (=> start!16762 e!110836))

(assert (=> start!16762 true))

(assert (=> start!16762 tp_is_empty!3865))

(declare-fun b!168596 () Bool)

(assert (=> b!168596 (= e!110840 true)))

(declare-fun lt!84345 () Bool)

(declare-datatypes ((List!2148 0))(
  ( (Nil!2145) (Cons!2144 (h!2761 (_ BitVec 64)) (t!6942 List!2148)) )
))
(declare-fun arrayNoDuplicates!0 (array!6813 (_ BitVec 32) List!2148) Bool)

(assert (=> b!168596 (= lt!84345 (arrayNoDuplicates!0 (_keys!5310 thiss!1248) #b00000000000000000000000000000000 Nil!2145))))

(declare-fun array_inv!2079 (array!6813) Bool)

(declare-fun array_inv!2080 (array!6815) Bool)

(assert (=> b!168597 (= e!110836 (and tp!14790 tp_is_empty!3865 (array_inv!2079 (_keys!5310 thiss!1248)) (array_inv!2080 (_values!3468 thiss!1248)) e!110843))))

(declare-fun b!168598 () Bool)

(declare-fun lt!84340 () Unit!5195)

(assert (=> b!168598 (= e!110839 lt!84340)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!125 (array!6813 array!6815 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 64) Int) Unit!5195)

(assert (=> b!168598 (= lt!84340 (lemmaInListMapThenSeekEntryOrOpenFindsIt!125 (_keys!5310 thiss!1248) (_values!3468 thiss!1248) (mask!8252 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) key!828 (defaultEntry!3485 thiss!1248)))))

(declare-fun res!80258 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168598 (= res!80258 (inRange!0 (index!4153 lt!84343) (mask!8252 thiss!1248)))))

(assert (=> b!168598 (=> (not res!80258) (not e!110842))))

(assert (=> b!168598 e!110842))

(declare-fun mapIsEmpty!6516 () Bool)

(assert (=> mapIsEmpty!6516 mapRes!6516))

(declare-fun b!168599 () Bool)

(assert (=> b!168599 (= e!110835 tp_is_empty!3865)))

(assert (= (and start!16762 res!80254) b!168588))

(assert (= (and b!168588 res!80256) b!168587))

(assert (= (and b!168587 res!80257) b!168595))

(assert (= (and b!168595 c!30389) b!168598))

(assert (= (and b!168595 (not c!30389)) b!168591))

(assert (= (and b!168598 res!80258) b!168594))

(assert (= (and b!168595 (not res!80253)) b!168592))

(assert (= (and b!168592 (not res!80259)) b!168589))

(assert (= (and b!168589 (not res!80255)) b!168596))

(assert (= (and b!168590 condMapEmpty!6516) mapIsEmpty!6516))

(assert (= (and b!168590 (not condMapEmpty!6516)) mapNonEmpty!6516))

(assert (= (and mapNonEmpty!6516 ((_ is ValueCellFull!1589) mapValue!6516)) b!168593))

(assert (= (and b!168590 ((_ is ValueCellFull!1589) mapDefault!6516)) b!168599))

(assert (= b!168597 b!168590))

(assert (= start!16762 b!168597))

(declare-fun m!197789 () Bool)

(assert (=> mapNonEmpty!6516 m!197789))

(declare-fun m!197791 () Bool)

(assert (=> b!168587 m!197791))

(declare-fun m!197793 () Bool)

(assert (=> b!168591 m!197793))

(declare-fun m!197795 () Bool)

(assert (=> b!168598 m!197795))

(declare-fun m!197797 () Bool)

(assert (=> b!168598 m!197797))

(declare-fun m!197799 () Bool)

(assert (=> b!168595 m!197799))

(declare-fun m!197801 () Bool)

(assert (=> b!168595 m!197801))

(declare-fun m!197803 () Bool)

(assert (=> b!168595 m!197803))

(declare-fun m!197805 () Bool)

(assert (=> b!168595 m!197805))

(declare-fun m!197807 () Bool)

(assert (=> b!168595 m!197807))

(declare-fun m!197809 () Bool)

(assert (=> b!168595 m!197809))

(declare-fun m!197811 () Bool)

(assert (=> b!168595 m!197811))

(declare-fun m!197813 () Bool)

(assert (=> b!168594 m!197813))

(declare-fun m!197815 () Bool)

(assert (=> start!16762 m!197815))

(declare-fun m!197817 () Bool)

(assert (=> b!168597 m!197817))

(declare-fun m!197819 () Bool)

(assert (=> b!168597 m!197819))

(declare-fun m!197821 () Bool)

(assert (=> b!168596 m!197821))

(declare-fun m!197823 () Bool)

(assert (=> b!168589 m!197823))

(check-sat b_and!10491 (not b!168596) (not b!168591) tp_is_empty!3865 (not b!168597) (not b!168589) (not start!16762) (not b!168587) (not b_next!4063) (not b!168595) (not b!168598) (not mapNonEmpty!6516))
(check-sat b_and!10491 (not b_next!4063))
