; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16714 () Bool)

(assert start!16714)

(declare-fun b!167662 () Bool)

(declare-fun b_free!4015 () Bool)

(declare-fun b_next!4015 () Bool)

(assert (=> b!167662 (= b_free!4015 (not b_next!4015))))

(declare-fun tp!14645 () Bool)

(declare-fun b_and!10443 () Bool)

(assert (=> b!167662 (= tp!14645 b_and!10443)))

(declare-fun b!167651 () Bool)

(declare-fun res!79750 () Bool)

(declare-fun e!110123 () Bool)

(assert (=> b!167651 (=> (not res!79750) (not e!110123))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!167651 (= res!79750 (not (= key!828 (bvneg key!828))))))

(declare-fun e!110117 () Bool)

(declare-fun b!167652 () Bool)

(declare-datatypes ((V!4737 0))(
  ( (V!4738 (val!1953 Int)) )
))
(declare-datatypes ((ValueCell!1565 0))(
  ( (ValueCellFull!1565 (v!3819 V!4737)) (EmptyCell!1565) )
))
(declare-datatypes ((array!6717 0))(
  ( (array!6718 (arr!3194 (Array (_ BitVec 32) (_ BitVec 64))) (size!3482 (_ BitVec 32))) )
))
(declare-datatypes ((array!6719 0))(
  ( (array!6720 (arr!3195 (Array (_ BitVec 32) ValueCell!1565)) (size!3483 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2038 0))(
  ( (LongMapFixedSize!2039 (defaultEntry!3461 Int) (mask!8212 (_ BitVec 32)) (extraKeys!3202 (_ BitVec 32)) (zeroValue!3304 V!4737) (minValue!3304 V!4737) (_size!1068 (_ BitVec 32)) (_keys!5286 array!6717) (_values!3444 array!6719) (_vacant!1068 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2038)

(declare-datatypes ((SeekEntryResult!476 0))(
  ( (MissingZero!476 (index!4072 (_ BitVec 32))) (Found!476 (index!4073 (_ BitVec 32))) (Intermediate!476 (undefined!1288 Bool) (index!4074 (_ BitVec 32)) (x!18536 (_ BitVec 32))) (Undefined!476) (MissingVacant!476 (index!4075 (_ BitVec 32))) )
))
(declare-fun lt!83835 () SeekEntryResult!476)

(assert (=> b!167652 (= e!110117 (= (select (arr!3194 (_keys!5286 thiss!1248)) (index!4073 lt!83835)) key!828))))

(declare-fun b!167653 () Bool)

(declare-fun e!110120 () Bool)

(declare-fun tp_is_empty!3817 () Bool)

(assert (=> b!167653 (= e!110120 tp_is_empty!3817)))

(declare-fun b!167654 () Bool)

(declare-datatypes ((Unit!5146 0))(
  ( (Unit!5147) )
))
(declare-fun e!110115 () Unit!5146)

(declare-fun lt!83840 () Unit!5146)

(assert (=> b!167654 (= e!110115 lt!83840)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!112 (array!6717 array!6719 (_ BitVec 32) (_ BitVec 32) V!4737 V!4737 (_ BitVec 64) Int) Unit!5146)

(assert (=> b!167654 (= lt!83840 (lemmaInListMapThenSeekEntryOrOpenFindsIt!112 (_keys!5286 thiss!1248) (_values!3444 thiss!1248) (mask!8212 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) key!828 (defaultEntry!3461 thiss!1248)))))

(declare-fun res!79749 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167654 (= res!79749 (inRange!0 (index!4073 lt!83835) (mask!8212 thiss!1248)))))

(assert (=> b!167654 (=> (not res!79749) (not e!110117))))

(assert (=> b!167654 e!110117))

(declare-fun b!167655 () Bool)

(declare-fun e!110119 () Bool)

(assert (=> b!167655 (= e!110123 e!110119)))

(declare-fun res!79751 () Bool)

(assert (=> b!167655 (=> (not res!79751) (not e!110119))))

(get-info :version)

(assert (=> b!167655 (= res!79751 (and (not ((_ is Undefined!476) lt!83835)) (not ((_ is MissingVacant!476) lt!83835)) (not ((_ is MissingZero!476) lt!83835)) ((_ is Found!476) lt!83835)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6717 (_ BitVec 32)) SeekEntryResult!476)

(assert (=> b!167655 (= lt!83835 (seekEntryOrOpen!0 key!828 (_keys!5286 thiss!1248) (mask!8212 thiss!1248)))))

(declare-fun b!167656 () Bool)

(declare-fun e!110121 () Bool)

(assert (=> b!167656 (= e!110119 (not e!110121))))

(declare-fun res!79752 () Bool)

(assert (=> b!167656 (=> res!79752 e!110121)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167656 (= res!79752 (not (validMask!0 (mask!8212 thiss!1248))))))

(declare-fun v!309 () V!4737)

(declare-datatypes ((tuple2!3104 0))(
  ( (tuple2!3105 (_1!1563 (_ BitVec 64)) (_2!1563 V!4737)) )
))
(declare-datatypes ((List!2119 0))(
  ( (Nil!2116) (Cons!2115 (h!2732 tuple2!3104) (t!6913 List!2119)) )
))
(declare-datatypes ((ListLongMap!2065 0))(
  ( (ListLongMap!2066 (toList!1048 List!2119)) )
))
(declare-fun lt!83836 () ListLongMap!2065)

(declare-fun +!216 (ListLongMap!2065 tuple2!3104) ListLongMap!2065)

(declare-fun getCurrentListMap!710 (array!6717 array!6719 (_ BitVec 32) (_ BitVec 32) V!4737 V!4737 (_ BitVec 32) Int) ListLongMap!2065)

(assert (=> b!167656 (= (+!216 lt!83836 (tuple2!3105 key!828 v!309)) (getCurrentListMap!710 (_keys!5286 thiss!1248) (array!6720 (store (arr!3195 (_values!3444 thiss!1248)) (index!4073 lt!83835) (ValueCellFull!1565 v!309)) (size!3483 (_values!3444 thiss!1248))) (mask!8212 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3461 thiss!1248)))))

(declare-fun lt!83838 () Unit!5146)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!74 (array!6717 array!6719 (_ BitVec 32) (_ BitVec 32) V!4737 V!4737 (_ BitVec 32) (_ BitVec 64) V!4737 Int) Unit!5146)

(assert (=> b!167656 (= lt!83838 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!74 (_keys!5286 thiss!1248) (_values!3444 thiss!1248) (mask!8212 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) (index!4073 lt!83835) key!828 v!309 (defaultEntry!3461 thiss!1248)))))

(declare-fun lt!83839 () Unit!5146)

(assert (=> b!167656 (= lt!83839 e!110115)))

(declare-fun c!30317 () Bool)

(declare-fun contains!1100 (ListLongMap!2065 (_ BitVec 64)) Bool)

(assert (=> b!167656 (= c!30317 (contains!1100 lt!83836 key!828))))

(assert (=> b!167656 (= lt!83836 (getCurrentListMap!710 (_keys!5286 thiss!1248) (_values!3444 thiss!1248) (mask!8212 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3461 thiss!1248)))))

(declare-fun b!167657 () Bool)

(declare-fun res!79754 () Bool)

(assert (=> b!167657 (=> res!79754 e!110121)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6717 (_ BitVec 32)) Bool)

(assert (=> b!167657 (= res!79754 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5286 thiss!1248) (mask!8212 thiss!1248))))))

(declare-fun b!167658 () Bool)

(assert (=> b!167658 (= e!110121 true)))

(declare-fun lt!83841 () Bool)

(declare-datatypes ((List!2120 0))(
  ( (Nil!2117) (Cons!2116 (h!2733 (_ BitVec 64)) (t!6914 List!2120)) )
))
(declare-fun arrayNoDuplicates!0 (array!6717 (_ BitVec 32) List!2120) Bool)

(assert (=> b!167658 (= lt!83841 (arrayNoDuplicates!0 (_keys!5286 thiss!1248) #b00000000000000000000000000000000 Nil!2117))))

(declare-fun b!167659 () Bool)

(declare-fun res!79755 () Bool)

(assert (=> b!167659 (=> res!79755 e!110121)))

(assert (=> b!167659 (= res!79755 (or (not (= (size!3483 (_values!3444 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8212 thiss!1248)))) (not (= (size!3482 (_keys!5286 thiss!1248)) (size!3483 (_values!3444 thiss!1248)))) (bvslt (mask!8212 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3202 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3202 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6444 () Bool)

(declare-fun mapRes!6444 () Bool)

(assert (=> mapIsEmpty!6444 mapRes!6444))

(declare-fun b!167660 () Bool)

(declare-fun e!110122 () Bool)

(assert (=> b!167660 (= e!110122 tp_is_empty!3817)))

(declare-fun b!167661 () Bool)

(declare-fun Unit!5148 () Unit!5146)

(assert (=> b!167661 (= e!110115 Unit!5148)))

(declare-fun lt!83837 () Unit!5146)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!104 (array!6717 array!6719 (_ BitVec 32) (_ BitVec 32) V!4737 V!4737 (_ BitVec 64) Int) Unit!5146)

(assert (=> b!167661 (= lt!83837 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!104 (_keys!5286 thiss!1248) (_values!3444 thiss!1248) (mask!8212 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) key!828 (defaultEntry!3461 thiss!1248)))))

(assert (=> b!167661 false))

(declare-fun res!79753 () Bool)

(assert (=> start!16714 (=> (not res!79753) (not e!110123))))

(declare-fun valid!899 (LongMapFixedSize!2038) Bool)

(assert (=> start!16714 (= res!79753 (valid!899 thiss!1248))))

(assert (=> start!16714 e!110123))

(declare-fun e!110118 () Bool)

(assert (=> start!16714 e!110118))

(assert (=> start!16714 true))

(assert (=> start!16714 tp_is_empty!3817))

(declare-fun e!110116 () Bool)

(declare-fun array_inv!2043 (array!6717) Bool)

(declare-fun array_inv!2044 (array!6719) Bool)

(assert (=> b!167662 (= e!110118 (and tp!14645 tp_is_empty!3817 (array_inv!2043 (_keys!5286 thiss!1248)) (array_inv!2044 (_values!3444 thiss!1248)) e!110116))))

(declare-fun mapNonEmpty!6444 () Bool)

(declare-fun tp!14646 () Bool)

(assert (=> mapNonEmpty!6444 (= mapRes!6444 (and tp!14646 e!110122))))

(declare-fun mapKey!6444 () (_ BitVec 32))

(declare-fun mapRest!6444 () (Array (_ BitVec 32) ValueCell!1565))

(declare-fun mapValue!6444 () ValueCell!1565)

(assert (=> mapNonEmpty!6444 (= (arr!3195 (_values!3444 thiss!1248)) (store mapRest!6444 mapKey!6444 mapValue!6444))))

(declare-fun b!167663 () Bool)

(assert (=> b!167663 (= e!110116 (and e!110120 mapRes!6444))))

(declare-fun condMapEmpty!6444 () Bool)

(declare-fun mapDefault!6444 () ValueCell!1565)

(assert (=> b!167663 (= condMapEmpty!6444 (= (arr!3195 (_values!3444 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1565)) mapDefault!6444)))))

(assert (= (and start!16714 res!79753) b!167651))

(assert (= (and b!167651 res!79750) b!167655))

(assert (= (and b!167655 res!79751) b!167656))

(assert (= (and b!167656 c!30317) b!167654))

(assert (= (and b!167656 (not c!30317)) b!167661))

(assert (= (and b!167654 res!79749) b!167652))

(assert (= (and b!167656 (not res!79752)) b!167659))

(assert (= (and b!167659 (not res!79755)) b!167657))

(assert (= (and b!167657 (not res!79754)) b!167658))

(assert (= (and b!167663 condMapEmpty!6444) mapIsEmpty!6444))

(assert (= (and b!167663 (not condMapEmpty!6444)) mapNonEmpty!6444))

(assert (= (and mapNonEmpty!6444 ((_ is ValueCellFull!1565) mapValue!6444)) b!167660))

(assert (= (and b!167663 ((_ is ValueCellFull!1565) mapDefault!6444)) b!167653))

(assert (= b!167662 b!167663))

(assert (= start!16714 b!167662))

(declare-fun m!196925 () Bool)

(assert (=> start!16714 m!196925))

(declare-fun m!196927 () Bool)

(assert (=> b!167661 m!196927))

(declare-fun m!196929 () Bool)

(assert (=> b!167657 m!196929))

(declare-fun m!196931 () Bool)

(assert (=> b!167655 m!196931))

(declare-fun m!196933 () Bool)

(assert (=> b!167662 m!196933))

(declare-fun m!196935 () Bool)

(assert (=> b!167662 m!196935))

(declare-fun m!196937 () Bool)

(assert (=> b!167654 m!196937))

(declare-fun m!196939 () Bool)

(assert (=> b!167654 m!196939))

(declare-fun m!196941 () Bool)

(assert (=> b!167652 m!196941))

(declare-fun m!196943 () Bool)

(assert (=> b!167656 m!196943))

(declare-fun m!196945 () Bool)

(assert (=> b!167656 m!196945))

(declare-fun m!196947 () Bool)

(assert (=> b!167656 m!196947))

(declare-fun m!196949 () Bool)

(assert (=> b!167656 m!196949))

(declare-fun m!196951 () Bool)

(assert (=> b!167656 m!196951))

(declare-fun m!196953 () Bool)

(assert (=> b!167656 m!196953))

(declare-fun m!196955 () Bool)

(assert (=> b!167656 m!196955))

(declare-fun m!196957 () Bool)

(assert (=> mapNonEmpty!6444 m!196957))

(declare-fun m!196959 () Bool)

(assert (=> b!167658 m!196959))

(check-sat (not b!167661) (not b!167656) (not b!167657) b_and!10443 (not b_next!4015) (not b!167654) (not b!167658) (not mapNonEmpty!6444) tp_is_empty!3817 (not b!167662) (not b!167655) (not start!16714))
(check-sat b_and!10443 (not b_next!4015))
