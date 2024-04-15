; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16738 () Bool)

(assert start!16738)

(declare-fun b!167931 () Bool)

(declare-fun b_free!4039 () Bool)

(declare-fun b_next!4039 () Bool)

(assert (=> b!167931 (= b_free!4039 (not b_next!4039))))

(declare-fun tp!14718 () Bool)

(declare-fun b_and!10427 () Bool)

(assert (=> b!167931 (= tp!14718 b_and!10427)))

(declare-fun b!167925 () Bool)

(declare-fun res!79885 () Bool)

(declare-fun e!110350 () Bool)

(assert (=> b!167925 (=> res!79885 e!110350)))

(declare-datatypes ((V!4769 0))(
  ( (V!4770 (val!1965 Int)) )
))
(declare-datatypes ((ValueCell!1577 0))(
  ( (ValueCellFull!1577 (v!3824 V!4769)) (EmptyCell!1577) )
))
(declare-datatypes ((array!6759 0))(
  ( (array!6760 (arr!3214 (Array (_ BitVec 32) (_ BitVec 64))) (size!3503 (_ BitVec 32))) )
))
(declare-datatypes ((array!6761 0))(
  ( (array!6762 (arr!3215 (Array (_ BitVec 32) ValueCell!1577)) (size!3504 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2062 0))(
  ( (LongMapFixedSize!2063 (defaultEntry!3473 Int) (mask!8231 (_ BitVec 32)) (extraKeys!3214 (_ BitVec 32)) (zeroValue!3316 V!4769) (minValue!3316 V!4769) (_size!1080 (_ BitVec 32)) (_keys!5297 array!6759) (_values!3456 array!6761) (_vacant!1080 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2062)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6759 (_ BitVec 32)) Bool)

(assert (=> b!167925 (= res!79885 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5297 thiss!1248) (mask!8231 thiss!1248))))))

(declare-fun b!167927 () Bool)

(declare-fun e!110352 () Bool)

(declare-fun e!110356 () Bool)

(declare-fun mapRes!6480 () Bool)

(assert (=> b!167927 (= e!110352 (and e!110356 mapRes!6480))))

(declare-fun condMapEmpty!6480 () Bool)

(declare-fun mapDefault!6480 () ValueCell!1577)

(assert (=> b!167927 (= condMapEmpty!6480 (= (arr!3215 (_values!3456 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1577)) mapDefault!6480)))))

(declare-fun b!167928 () Bool)

(declare-fun res!79888 () Bool)

(assert (=> b!167928 (=> res!79888 e!110350)))

(assert (=> b!167928 (= res!79888 (or (not (= (size!3504 (_values!3456 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8231 thiss!1248)))) (not (= (size!3503 (_keys!5297 thiss!1248)) (size!3504 (_values!3456 thiss!1248)))) (bvslt (mask!8231 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3214 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3214 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167929 () Bool)

(declare-datatypes ((Unit!5138 0))(
  ( (Unit!5139) )
))
(declare-fun e!110349 () Unit!5138)

(declare-fun Unit!5140 () Unit!5138)

(assert (=> b!167929 (= e!110349 Unit!5140)))

(declare-fun lt!83853 () Unit!5138)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!114 (array!6759 array!6761 (_ BitVec 32) (_ BitVec 32) V!4769 V!4769 (_ BitVec 64) Int) Unit!5138)

(assert (=> b!167929 (= lt!83853 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!114 (_keys!5297 thiss!1248) (_values!3456 thiss!1248) (mask!8231 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) key!828 (defaultEntry!3473 thiss!1248)))))

(assert (=> b!167929 false))

(declare-fun mapIsEmpty!6480 () Bool)

(assert (=> mapIsEmpty!6480 mapRes!6480))

(declare-fun b!167930 () Bool)

(declare-fun e!110351 () Bool)

(assert (=> b!167930 (= e!110351 (not e!110350))))

(declare-fun res!79891 () Bool)

(assert (=> b!167930 (=> res!79891 e!110350)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167930 (= res!79891 (not (validMask!0 (mask!8231 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!503 0))(
  ( (MissingZero!503 (index!4180 (_ BitVec 32))) (Found!503 (index!4181 (_ BitVec 32))) (Intermediate!503 (undefined!1315 Bool) (index!4182 (_ BitVec 32)) (x!18594 (_ BitVec 32))) (Undefined!503) (MissingVacant!503 (index!4183 (_ BitVec 32))) )
))
(declare-fun lt!83850 () SeekEntryResult!503)

(declare-datatypes ((tuple2!3154 0))(
  ( (tuple2!3155 (_1!1588 (_ BitVec 64)) (_2!1588 V!4769)) )
))
(declare-datatypes ((List!2156 0))(
  ( (Nil!2153) (Cons!2152 (h!2769 tuple2!3154) (t!6949 List!2156)) )
))
(declare-datatypes ((ListLongMap!2097 0))(
  ( (ListLongMap!2098 (toList!1064 List!2156)) )
))
(declare-fun lt!83847 () ListLongMap!2097)

(declare-fun v!309 () V!4769)

(declare-fun +!215 (ListLongMap!2097 tuple2!3154) ListLongMap!2097)

(declare-fun getCurrentListMap!706 (array!6759 array!6761 (_ BitVec 32) (_ BitVec 32) V!4769 V!4769 (_ BitVec 32) Int) ListLongMap!2097)

(assert (=> b!167930 (= (+!215 lt!83847 (tuple2!3155 key!828 v!309)) (getCurrentListMap!706 (_keys!5297 thiss!1248) (array!6762 (store (arr!3215 (_values!3456 thiss!1248)) (index!4181 lt!83850) (ValueCellFull!1577 v!309)) (size!3504 (_values!3456 thiss!1248))) (mask!8231 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3473 thiss!1248)))))

(declare-fun lt!83851 () Unit!5138)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!87 (array!6759 array!6761 (_ BitVec 32) (_ BitVec 32) V!4769 V!4769 (_ BitVec 32) (_ BitVec 64) V!4769 Int) Unit!5138)

(assert (=> b!167930 (= lt!83851 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!87 (_keys!5297 thiss!1248) (_values!3456 thiss!1248) (mask!8231 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) (index!4181 lt!83850) key!828 v!309 (defaultEntry!3473 thiss!1248)))))

(declare-fun lt!83852 () Unit!5138)

(assert (=> b!167930 (= lt!83852 e!110349)))

(declare-fun c!30314 () Bool)

(declare-fun contains!1109 (ListLongMap!2097 (_ BitVec 64)) Bool)

(assert (=> b!167930 (= c!30314 (contains!1109 lt!83847 key!828))))

(assert (=> b!167930 (= lt!83847 (getCurrentListMap!706 (_keys!5297 thiss!1248) (_values!3456 thiss!1248) (mask!8231 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3473 thiss!1248)))))

(declare-fun e!110357 () Bool)

(declare-fun tp_is_empty!3841 () Bool)

(declare-fun array_inv!2069 (array!6759) Bool)

(declare-fun array_inv!2070 (array!6761) Bool)

(assert (=> b!167931 (= e!110357 (and tp!14718 tp_is_empty!3841 (array_inv!2069 (_keys!5297 thiss!1248)) (array_inv!2070 (_values!3456 thiss!1248)) e!110352))))

(declare-fun b!167932 () Bool)

(assert (=> b!167932 (= e!110350 true)))

(declare-fun lt!83849 () Bool)

(declare-datatypes ((List!2157 0))(
  ( (Nil!2154) (Cons!2153 (h!2770 (_ BitVec 64)) (t!6950 List!2157)) )
))
(declare-fun arrayNoDuplicates!0 (array!6759 (_ BitVec 32) List!2157) Bool)

(assert (=> b!167932 (= lt!83849 (arrayNoDuplicates!0 (_keys!5297 thiss!1248) #b00000000000000000000000000000000 Nil!2154))))

(declare-fun b!167933 () Bool)

(declare-fun e!110354 () Bool)

(assert (=> b!167933 (= e!110354 (= (select (arr!3214 (_keys!5297 thiss!1248)) (index!4181 lt!83850)) key!828))))

(declare-fun b!167926 () Bool)

(declare-fun res!79890 () Bool)

(declare-fun e!110358 () Bool)

(assert (=> b!167926 (=> (not res!79890) (not e!110358))))

(assert (=> b!167926 (= res!79890 (not (= key!828 (bvneg key!828))))))

(declare-fun res!79889 () Bool)

(assert (=> start!16738 (=> (not res!79889) (not e!110358))))

(declare-fun valid!908 (LongMapFixedSize!2062) Bool)

(assert (=> start!16738 (= res!79889 (valid!908 thiss!1248))))

(assert (=> start!16738 e!110358))

(assert (=> start!16738 e!110357))

(assert (=> start!16738 true))

(assert (=> start!16738 tp_is_empty!3841))

(declare-fun b!167934 () Bool)

(declare-fun e!110353 () Bool)

(assert (=> b!167934 (= e!110353 tp_is_empty!3841)))

(declare-fun mapNonEmpty!6480 () Bool)

(declare-fun tp!14717 () Bool)

(assert (=> mapNonEmpty!6480 (= mapRes!6480 (and tp!14717 e!110353))))

(declare-fun mapValue!6480 () ValueCell!1577)

(declare-fun mapKey!6480 () (_ BitVec 32))

(declare-fun mapRest!6480 () (Array (_ BitVec 32) ValueCell!1577))

(assert (=> mapNonEmpty!6480 (= (arr!3215 (_values!3456 thiss!1248)) (store mapRest!6480 mapKey!6480 mapValue!6480))))

(declare-fun b!167935 () Bool)

(declare-fun lt!83848 () Unit!5138)

(assert (=> b!167935 (= e!110349 lt!83848)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!114 (array!6759 array!6761 (_ BitVec 32) (_ BitVec 32) V!4769 V!4769 (_ BitVec 64) Int) Unit!5138)

(assert (=> b!167935 (= lt!83848 (lemmaInListMapThenSeekEntryOrOpenFindsIt!114 (_keys!5297 thiss!1248) (_values!3456 thiss!1248) (mask!8231 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) key!828 (defaultEntry!3473 thiss!1248)))))

(declare-fun res!79887 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167935 (= res!79887 (inRange!0 (index!4181 lt!83850) (mask!8231 thiss!1248)))))

(assert (=> b!167935 (=> (not res!79887) (not e!110354))))

(assert (=> b!167935 e!110354))

(declare-fun b!167936 () Bool)

(assert (=> b!167936 (= e!110356 tp_is_empty!3841)))

(declare-fun b!167937 () Bool)

(assert (=> b!167937 (= e!110358 e!110351)))

(declare-fun res!79886 () Bool)

(assert (=> b!167937 (=> (not res!79886) (not e!110351))))

(get-info :version)

(assert (=> b!167937 (= res!79886 (and (not ((_ is Undefined!503) lt!83850)) (not ((_ is MissingVacant!503) lt!83850)) (not ((_ is MissingZero!503) lt!83850)) ((_ is Found!503) lt!83850)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6759 (_ BitVec 32)) SeekEntryResult!503)

(assert (=> b!167937 (= lt!83850 (seekEntryOrOpen!0 key!828 (_keys!5297 thiss!1248) (mask!8231 thiss!1248)))))

(assert (= (and start!16738 res!79889) b!167926))

(assert (= (and b!167926 res!79890) b!167937))

(assert (= (and b!167937 res!79886) b!167930))

(assert (= (and b!167930 c!30314) b!167935))

(assert (= (and b!167930 (not c!30314)) b!167929))

(assert (= (and b!167935 res!79887) b!167933))

(assert (= (and b!167930 (not res!79891)) b!167928))

(assert (= (and b!167928 (not res!79888)) b!167925))

(assert (= (and b!167925 (not res!79885)) b!167932))

(assert (= (and b!167927 condMapEmpty!6480) mapIsEmpty!6480))

(assert (= (and b!167927 (not condMapEmpty!6480)) mapNonEmpty!6480))

(assert (= (and mapNonEmpty!6480 ((_ is ValueCellFull!1577) mapValue!6480)) b!167934))

(assert (= (and b!167927 ((_ is ValueCellFull!1577) mapDefault!6480)) b!167936))

(assert (= b!167931 b!167927))

(assert (= start!16738 b!167931))

(declare-fun m!196555 () Bool)

(assert (=> b!167932 m!196555))

(declare-fun m!196557 () Bool)

(assert (=> b!167930 m!196557))

(declare-fun m!196559 () Bool)

(assert (=> b!167930 m!196559))

(declare-fun m!196561 () Bool)

(assert (=> b!167930 m!196561))

(declare-fun m!196563 () Bool)

(assert (=> b!167930 m!196563))

(declare-fun m!196565 () Bool)

(assert (=> b!167930 m!196565))

(declare-fun m!196567 () Bool)

(assert (=> b!167930 m!196567))

(declare-fun m!196569 () Bool)

(assert (=> b!167930 m!196569))

(declare-fun m!196571 () Bool)

(assert (=> b!167933 m!196571))

(declare-fun m!196573 () Bool)

(assert (=> b!167937 m!196573))

(declare-fun m!196575 () Bool)

(assert (=> start!16738 m!196575))

(declare-fun m!196577 () Bool)

(assert (=> mapNonEmpty!6480 m!196577))

(declare-fun m!196579 () Bool)

(assert (=> b!167929 m!196579))

(declare-fun m!196581 () Bool)

(assert (=> b!167931 m!196581))

(declare-fun m!196583 () Bool)

(assert (=> b!167931 m!196583))

(declare-fun m!196585 () Bool)

(assert (=> b!167925 m!196585))

(declare-fun m!196587 () Bool)

(assert (=> b!167935 m!196587))

(declare-fun m!196589 () Bool)

(assert (=> b!167935 m!196589))

(check-sat (not b!167931) (not b!167937) (not b_next!4039) (not mapNonEmpty!6480) tp_is_empty!3841 b_and!10427 (not start!16738) (not b!167929) (not b!167932) (not b!167935) (not b!167925) (not b!167930))
(check-sat b_and!10427 (not b_next!4039))
