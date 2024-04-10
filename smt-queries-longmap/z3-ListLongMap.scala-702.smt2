; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16718 () Bool)

(assert start!16718)

(declare-fun b!167771 () Bool)

(declare-fun b_free!4023 () Bool)

(declare-fun b_next!4023 () Bool)

(assert (=> b!167771 (= b_free!4023 (not b_next!4023))))

(declare-fun tp!14669 () Bool)

(declare-fun b_and!10437 () Bool)

(assert (=> b!167771 (= tp!14669 b_and!10437)))

(declare-fun b!167760 () Bool)

(declare-fun e!110214 () Bool)

(declare-fun e!110216 () Bool)

(assert (=> b!167760 (= e!110214 (not e!110216))))

(declare-fun res!79815 () Bool)

(assert (=> b!167760 (=> res!79815 e!110216)))

(declare-datatypes ((V!4747 0))(
  ( (V!4748 (val!1957 Int)) )
))
(declare-datatypes ((ValueCell!1569 0))(
  ( (ValueCellFull!1569 (v!3822 V!4747)) (EmptyCell!1569) )
))
(declare-datatypes ((array!6747 0))(
  ( (array!6748 (arr!3209 (Array (_ BitVec 32) (_ BitVec 64))) (size!3497 (_ BitVec 32))) )
))
(declare-datatypes ((array!6749 0))(
  ( (array!6750 (arr!3210 (Array (_ BitVec 32) ValueCell!1569)) (size!3498 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2046 0))(
  ( (LongMapFixedSize!2047 (defaultEntry!3465 Int) (mask!8218 (_ BitVec 32)) (extraKeys!3206 (_ BitVec 32)) (zeroValue!3308 V!4747) (minValue!3308 V!4747) (_size!1072 (_ BitVec 32)) (_keys!5290 array!6747) (_values!3448 array!6749) (_vacant!1072 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2046)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167760 (= res!79815 (not (validMask!0 (mask!8218 thiss!1248))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4747)

(declare-datatypes ((tuple2!3150 0))(
  ( (tuple2!3151 (_1!1586 (_ BitVec 64)) (_2!1586 V!4747)) )
))
(declare-datatypes ((List!2138 0))(
  ( (Nil!2135) (Cons!2134 (h!2751 tuple2!3150) (t!6940 List!2138)) )
))
(declare-datatypes ((ListLongMap!2105 0))(
  ( (ListLongMap!2106 (toList!1068 List!2138)) )
))
(declare-fun lt!83866 () ListLongMap!2105)

(declare-datatypes ((SeekEntryResult!486 0))(
  ( (MissingZero!486 (index!4112 (_ BitVec 32))) (Found!486 (index!4113 (_ BitVec 32))) (Intermediate!486 (undefined!1298 Bool) (index!4114 (_ BitVec 32)) (x!18554 (_ BitVec 32))) (Undefined!486) (MissingVacant!486 (index!4115 (_ BitVec 32))) )
))
(declare-fun lt!83862 () SeekEntryResult!486)

(declare-fun +!220 (ListLongMap!2105 tuple2!3150) ListLongMap!2105)

(declare-fun getCurrentListMap!726 (array!6747 array!6749 (_ BitVec 32) (_ BitVec 32) V!4747 V!4747 (_ BitVec 32) Int) ListLongMap!2105)

(assert (=> b!167760 (= (+!220 lt!83866 (tuple2!3151 key!828 v!309)) (getCurrentListMap!726 (_keys!5290 thiss!1248) (array!6750 (store (arr!3210 (_values!3448 thiss!1248)) (index!4113 lt!83862) (ValueCellFull!1569 v!309)) (size!3498 (_values!3448 thiss!1248))) (mask!8218 thiss!1248) (extraKeys!3206 thiss!1248) (zeroValue!3308 thiss!1248) (minValue!3308 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3465 thiss!1248)))))

(declare-datatypes ((Unit!5145 0))(
  ( (Unit!5146) )
))
(declare-fun lt!83864 () Unit!5145)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!75 (array!6747 array!6749 (_ BitVec 32) (_ BitVec 32) V!4747 V!4747 (_ BitVec 32) (_ BitVec 64) V!4747 Int) Unit!5145)

(assert (=> b!167760 (= lt!83864 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!75 (_keys!5290 thiss!1248) (_values!3448 thiss!1248) (mask!8218 thiss!1248) (extraKeys!3206 thiss!1248) (zeroValue!3308 thiss!1248) (minValue!3308 thiss!1248) (index!4113 lt!83862) key!828 v!309 (defaultEntry!3465 thiss!1248)))))

(declare-fun lt!83863 () Unit!5145)

(declare-fun e!110211 () Unit!5145)

(assert (=> b!167760 (= lt!83863 e!110211)))

(declare-fun c!30316 () Bool)

(declare-fun contains!1110 (ListLongMap!2105 (_ BitVec 64)) Bool)

(assert (=> b!167760 (= c!30316 (contains!1110 lt!83866 key!828))))

(assert (=> b!167760 (= lt!83866 (getCurrentListMap!726 (_keys!5290 thiss!1248) (_values!3448 thiss!1248) (mask!8218 thiss!1248) (extraKeys!3206 thiss!1248) (zeroValue!3308 thiss!1248) (minValue!3308 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3465 thiss!1248)))))

(declare-fun b!167761 () Bool)

(declare-fun e!110212 () Bool)

(declare-fun e!110210 () Bool)

(declare-fun mapRes!6456 () Bool)

(assert (=> b!167761 (= e!110212 (and e!110210 mapRes!6456))))

(declare-fun condMapEmpty!6456 () Bool)

(declare-fun mapDefault!6456 () ValueCell!1569)

(assert (=> b!167761 (= condMapEmpty!6456 (= (arr!3210 (_values!3448 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1569)) mapDefault!6456)))))

(declare-fun b!167762 () Bool)

(declare-fun Unit!5147 () Unit!5145)

(assert (=> b!167762 (= e!110211 Unit!5147)))

(declare-fun lt!83860 () Unit!5145)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!112 (array!6747 array!6749 (_ BitVec 32) (_ BitVec 32) V!4747 V!4747 (_ BitVec 64) Int) Unit!5145)

(assert (=> b!167762 (= lt!83860 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!112 (_keys!5290 thiss!1248) (_values!3448 thiss!1248) (mask!8218 thiss!1248) (extraKeys!3206 thiss!1248) (zeroValue!3308 thiss!1248) (minValue!3308 thiss!1248) key!828 (defaultEntry!3465 thiss!1248)))))

(assert (=> b!167762 false))

(declare-fun res!79814 () Bool)

(declare-fun e!110219 () Bool)

(assert (=> start!16718 (=> (not res!79814) (not e!110219))))

(declare-fun valid!891 (LongMapFixedSize!2046) Bool)

(assert (=> start!16718 (= res!79814 (valid!891 thiss!1248))))

(assert (=> start!16718 e!110219))

(declare-fun e!110217 () Bool)

(assert (=> start!16718 e!110217))

(assert (=> start!16718 true))

(declare-fun tp_is_empty!3825 () Bool)

(assert (=> start!16718 tp_is_empty!3825))

(declare-fun b!167763 () Bool)

(assert (=> b!167763 (= e!110219 e!110214)))

(declare-fun res!79812 () Bool)

(assert (=> b!167763 (=> (not res!79812) (not e!110214))))

(get-info :version)

(assert (=> b!167763 (= res!79812 (and (not ((_ is Undefined!486) lt!83862)) (not ((_ is MissingVacant!486) lt!83862)) (not ((_ is MissingZero!486) lt!83862)) ((_ is Found!486) lt!83862)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6747 (_ BitVec 32)) SeekEntryResult!486)

(assert (=> b!167763 (= lt!83862 (seekEntryOrOpen!0 key!828 (_keys!5290 thiss!1248) (mask!8218 thiss!1248)))))

(declare-fun b!167764 () Bool)

(declare-fun e!110218 () Bool)

(assert (=> b!167764 (= e!110218 tp_is_empty!3825)))

(declare-fun e!110215 () Bool)

(declare-fun b!167765 () Bool)

(assert (=> b!167765 (= e!110215 (= (select (arr!3209 (_keys!5290 thiss!1248)) (index!4113 lt!83862)) key!828))))

(declare-fun b!167766 () Bool)

(declare-fun res!79817 () Bool)

(assert (=> b!167766 (=> res!79817 e!110216)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6747 (_ BitVec 32)) Bool)

(assert (=> b!167766 (= res!79817 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5290 thiss!1248) (mask!8218 thiss!1248))))))

(declare-fun b!167767 () Bool)

(assert (=> b!167767 (= e!110210 tp_is_empty!3825)))

(declare-fun b!167768 () Bool)

(declare-fun lt!83861 () Unit!5145)

(assert (=> b!167768 (= e!110211 lt!83861)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!111 (array!6747 array!6749 (_ BitVec 32) (_ BitVec 32) V!4747 V!4747 (_ BitVec 64) Int) Unit!5145)

(assert (=> b!167768 (= lt!83861 (lemmaInListMapThenSeekEntryOrOpenFindsIt!111 (_keys!5290 thiss!1248) (_values!3448 thiss!1248) (mask!8218 thiss!1248) (extraKeys!3206 thiss!1248) (zeroValue!3308 thiss!1248) (minValue!3308 thiss!1248) key!828 (defaultEntry!3465 thiss!1248)))))

(declare-fun res!79818 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167768 (= res!79818 (inRange!0 (index!4113 lt!83862) (mask!8218 thiss!1248)))))

(assert (=> b!167768 (=> (not res!79818) (not e!110215))))

(assert (=> b!167768 e!110215))

(declare-fun b!167769 () Bool)

(declare-fun res!79813 () Bool)

(assert (=> b!167769 (=> res!79813 e!110216)))

(assert (=> b!167769 (= res!79813 (or (not (= (size!3498 (_values!3448 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8218 thiss!1248)))) (not (= (size!3497 (_keys!5290 thiss!1248)) (size!3498 (_values!3448 thiss!1248)))) (bvslt (mask!8218 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3206 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3206 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6456 () Bool)

(assert (=> mapIsEmpty!6456 mapRes!6456))

(declare-fun mapNonEmpty!6456 () Bool)

(declare-fun tp!14670 () Bool)

(assert (=> mapNonEmpty!6456 (= mapRes!6456 (and tp!14670 e!110218))))

(declare-fun mapRest!6456 () (Array (_ BitVec 32) ValueCell!1569))

(declare-fun mapKey!6456 () (_ BitVec 32))

(declare-fun mapValue!6456 () ValueCell!1569)

(assert (=> mapNonEmpty!6456 (= (arr!3210 (_values!3448 thiss!1248)) (store mapRest!6456 mapKey!6456 mapValue!6456))))

(declare-fun b!167770 () Bool)

(declare-fun res!79816 () Bool)

(assert (=> b!167770 (=> (not res!79816) (not e!110219))))

(assert (=> b!167770 (= res!79816 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2065 (array!6747) Bool)

(declare-fun array_inv!2066 (array!6749) Bool)

(assert (=> b!167771 (= e!110217 (and tp!14669 tp_is_empty!3825 (array_inv!2065 (_keys!5290 thiss!1248)) (array_inv!2066 (_values!3448 thiss!1248)) e!110212))))

(declare-fun b!167772 () Bool)

(assert (=> b!167772 (= e!110216 true)))

(declare-fun lt!83865 () Bool)

(declare-datatypes ((List!2139 0))(
  ( (Nil!2136) (Cons!2135 (h!2752 (_ BitVec 64)) (t!6941 List!2139)) )
))
(declare-fun arrayNoDuplicates!0 (array!6747 (_ BitVec 32) List!2139) Bool)

(assert (=> b!167772 (= lt!83865 (arrayNoDuplicates!0 (_keys!5290 thiss!1248) #b00000000000000000000000000000000 Nil!2136))))

(assert (= (and start!16718 res!79814) b!167770))

(assert (= (and b!167770 res!79816) b!167763))

(assert (= (and b!167763 res!79812) b!167760))

(assert (= (and b!167760 c!30316) b!167768))

(assert (= (and b!167760 (not c!30316)) b!167762))

(assert (= (and b!167768 res!79818) b!167765))

(assert (= (and b!167760 (not res!79815)) b!167769))

(assert (= (and b!167769 (not res!79813)) b!167766))

(assert (= (and b!167766 (not res!79817)) b!167772))

(assert (= (and b!167761 condMapEmpty!6456) mapIsEmpty!6456))

(assert (= (and b!167761 (not condMapEmpty!6456)) mapNonEmpty!6456))

(assert (= (and mapNonEmpty!6456 ((_ is ValueCellFull!1569) mapValue!6456)) b!167764))

(assert (= (and b!167761 ((_ is ValueCellFull!1569) mapDefault!6456)) b!167767))

(assert (= b!167771 b!167761))

(assert (= start!16718 b!167771))

(declare-fun m!196887 () Bool)

(assert (=> b!167763 m!196887))

(declare-fun m!196889 () Bool)

(assert (=> b!167760 m!196889))

(declare-fun m!196891 () Bool)

(assert (=> b!167760 m!196891))

(declare-fun m!196893 () Bool)

(assert (=> b!167760 m!196893))

(declare-fun m!196895 () Bool)

(assert (=> b!167760 m!196895))

(declare-fun m!196897 () Bool)

(assert (=> b!167760 m!196897))

(declare-fun m!196899 () Bool)

(assert (=> b!167760 m!196899))

(declare-fun m!196901 () Bool)

(assert (=> b!167760 m!196901))

(declare-fun m!196903 () Bool)

(assert (=> b!167768 m!196903))

(declare-fun m!196905 () Bool)

(assert (=> b!167768 m!196905))

(declare-fun m!196907 () Bool)

(assert (=> b!167766 m!196907))

(declare-fun m!196909 () Bool)

(assert (=> b!167762 m!196909))

(declare-fun m!196911 () Bool)

(assert (=> b!167772 m!196911))

(declare-fun m!196913 () Bool)

(assert (=> start!16718 m!196913))

(declare-fun m!196915 () Bool)

(assert (=> mapNonEmpty!6456 m!196915))

(declare-fun m!196917 () Bool)

(assert (=> b!167771 m!196917))

(declare-fun m!196919 () Bool)

(assert (=> b!167771 m!196919))

(declare-fun m!196921 () Bool)

(assert (=> b!167765 m!196921))

(check-sat (not b!167762) b_and!10437 (not b!167766) (not b!167768) (not b!167771) (not b!167763) (not b_next!4023) (not start!16718) tp_is_empty!3825 (not mapNonEmpty!6456) (not b!167760) (not b!167772))
(check-sat b_and!10437 (not b_next!4023))
