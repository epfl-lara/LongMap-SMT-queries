; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16766 () Bool)

(assert start!16766)

(declare-fun b!168684 () Bool)

(declare-fun b_free!4071 () Bool)

(declare-fun b_next!4071 () Bool)

(assert (=> b!168684 (= b_free!4071 (not b_next!4071))))

(declare-fun tp!14814 () Bool)

(declare-fun b_and!10485 () Bool)

(assert (=> b!168684 (= tp!14814 b_and!10485)))

(declare-fun b!168681 () Bool)

(declare-fun e!110926 () Bool)

(declare-fun tp_is_empty!3873 () Bool)

(assert (=> b!168681 (= e!110926 tp_is_empty!3873)))

(declare-fun b!168683 () Bool)

(declare-fun e!110925 () Bool)

(declare-fun e!110928 () Bool)

(assert (=> b!168683 (= e!110925 e!110928)))

(declare-fun res!80304 () Bool)

(assert (=> b!168683 (=> (not res!80304) (not e!110928))))

(declare-datatypes ((SeekEntryResult!506 0))(
  ( (MissingZero!506 (index!4192 (_ BitVec 32))) (Found!506 (index!4193 (_ BitVec 32))) (Intermediate!506 (undefined!1318 Bool) (index!4194 (_ BitVec 32)) (x!18638 (_ BitVec 32))) (Undefined!506) (MissingVacant!506 (index!4195 (_ BitVec 32))) )
))
(declare-fun lt!84393 () SeekEntryResult!506)

(get-info :version)

(assert (=> b!168683 (= res!80304 (and (not ((_ is Undefined!506) lt!84393)) (not ((_ is MissingVacant!506) lt!84393)) (not ((_ is MissingZero!506) lt!84393)) ((_ is Found!506) lt!84393)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4811 0))(
  ( (V!4812 (val!1981 Int)) )
))
(declare-datatypes ((ValueCell!1593 0))(
  ( (ValueCellFull!1593 (v!3846 V!4811)) (EmptyCell!1593) )
))
(declare-datatypes ((array!6843 0))(
  ( (array!6844 (arr!3257 (Array (_ BitVec 32) (_ BitVec 64))) (size!3545 (_ BitVec 32))) )
))
(declare-datatypes ((array!6845 0))(
  ( (array!6846 (arr!3258 (Array (_ BitVec 32) ValueCell!1593)) (size!3546 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2094 0))(
  ( (LongMapFixedSize!2095 (defaultEntry!3489 Int) (mask!8258 (_ BitVec 32)) (extraKeys!3230 (_ BitVec 32)) (zeroValue!3332 V!4811) (minValue!3332 V!4811) (_size!1096 (_ BitVec 32)) (_keys!5314 array!6843) (_values!3472 array!6845) (_vacant!1096 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2094)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6843 (_ BitVec 32)) SeekEntryResult!506)

(assert (=> b!168683 (= lt!84393 (seekEntryOrOpen!0 key!828 (_keys!5314 thiss!1248) (mask!8258 thiss!1248)))))

(declare-fun e!110931 () Bool)

(declare-fun e!110927 () Bool)

(declare-fun array_inv!2095 (array!6843) Bool)

(declare-fun array_inv!2096 (array!6845) Bool)

(assert (=> b!168684 (= e!110927 (and tp!14814 tp_is_empty!3873 (array_inv!2095 (_keys!5314 thiss!1248)) (array_inv!2096 (_values!3472 thiss!1248)) e!110931))))

(declare-fun b!168685 () Bool)

(declare-fun res!80301 () Bool)

(assert (=> b!168685 (=> (not res!80301) (not e!110925))))

(assert (=> b!168685 (= res!80301 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168686 () Bool)

(declare-datatypes ((Unit!5199 0))(
  ( (Unit!5200) )
))
(declare-fun e!110929 () Unit!5199)

(declare-fun Unit!5201 () Unit!5199)

(assert (=> b!168686 (= e!110929 Unit!5201)))

(declare-fun lt!84388 () Unit!5199)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!128 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4811 V!4811 (_ BitVec 64) Int) Unit!5199)

(assert (=> b!168686 (= lt!84388 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!128 (_keys!5314 thiss!1248) (_values!3472 thiss!1248) (mask!8258 thiss!1248) (extraKeys!3230 thiss!1248) (zeroValue!3332 thiss!1248) (minValue!3332 thiss!1248) key!828 (defaultEntry!3489 thiss!1248)))))

(assert (=> b!168686 false))

(declare-fun b!168687 () Bool)

(assert (=> b!168687 (= e!110928 (not true))))

(declare-fun lt!84387 () Bool)

(declare-fun lt!84392 () array!6845)

(declare-fun valid!906 (LongMapFixedSize!2094) Bool)

(assert (=> b!168687 (= lt!84387 (valid!906 (LongMapFixedSize!2095 (defaultEntry!3489 thiss!1248) (mask!8258 thiss!1248) (extraKeys!3230 thiss!1248) (zeroValue!3332 thiss!1248) (minValue!3332 thiss!1248) (_size!1096 thiss!1248) (_keys!5314 thiss!1248) lt!84392 (_vacant!1096 thiss!1248))))))

(declare-datatypes ((tuple2!3174 0))(
  ( (tuple2!3175 (_1!1598 (_ BitVec 64)) (_2!1598 V!4811)) )
))
(declare-datatypes ((List!2168 0))(
  ( (Nil!2165) (Cons!2164 (h!2781 tuple2!3174) (t!6970 List!2168)) )
))
(declare-datatypes ((ListLongMap!2129 0))(
  ( (ListLongMap!2130 (toList!1080 List!2168)) )
))
(declare-fun lt!84391 () ListLongMap!2129)

(declare-fun contains!1122 (ListLongMap!2129 (_ BitVec 64)) Bool)

(assert (=> b!168687 (contains!1122 lt!84391 (select (arr!3257 (_keys!5314 thiss!1248)) (index!4193 lt!84393)))))

(declare-fun lt!84384 () Unit!5199)

(declare-fun lemmaValidKeyInArrayIsInListMap!133 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4811 V!4811 (_ BitVec 32) Int) Unit!5199)

(assert (=> b!168687 (= lt!84384 (lemmaValidKeyInArrayIsInListMap!133 (_keys!5314 thiss!1248) lt!84392 (mask!8258 thiss!1248) (extraKeys!3230 thiss!1248) (zeroValue!3332 thiss!1248) (minValue!3332 thiss!1248) (index!4193 lt!84393) (defaultEntry!3489 thiss!1248)))))

(declare-fun lt!84394 () ListLongMap!2129)

(assert (=> b!168687 (= lt!84394 lt!84391)))

(declare-fun getCurrentListMap!738 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4811 V!4811 (_ BitVec 32) Int) ListLongMap!2129)

(assert (=> b!168687 (= lt!84391 (getCurrentListMap!738 (_keys!5314 thiss!1248) lt!84392 (mask!8258 thiss!1248) (extraKeys!3230 thiss!1248) (zeroValue!3332 thiss!1248) (minValue!3332 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3489 thiss!1248)))))

(declare-fun lt!84390 () ListLongMap!2129)

(declare-fun v!309 () V!4811)

(declare-fun +!232 (ListLongMap!2129 tuple2!3174) ListLongMap!2129)

(assert (=> b!168687 (= lt!84394 (+!232 lt!84390 (tuple2!3175 key!828 v!309)))))

(assert (=> b!168687 (= lt!84392 (array!6846 (store (arr!3258 (_values!3472 thiss!1248)) (index!4193 lt!84393) (ValueCellFull!1593 v!309)) (size!3546 (_values!3472 thiss!1248))))))

(declare-fun lt!84385 () Unit!5199)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!87 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4811 V!4811 (_ BitVec 32) (_ BitVec 64) V!4811 Int) Unit!5199)

(assert (=> b!168687 (= lt!84385 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!87 (_keys!5314 thiss!1248) (_values!3472 thiss!1248) (mask!8258 thiss!1248) (extraKeys!3230 thiss!1248) (zeroValue!3332 thiss!1248) (minValue!3332 thiss!1248) (index!4193 lt!84393) key!828 v!309 (defaultEntry!3489 thiss!1248)))))

(declare-fun lt!84389 () Unit!5199)

(assert (=> b!168687 (= lt!84389 e!110929)))

(declare-fun c!30388 () Bool)

(assert (=> b!168687 (= c!30388 (contains!1122 lt!84390 key!828))))

(assert (=> b!168687 (= lt!84390 (getCurrentListMap!738 (_keys!5314 thiss!1248) (_values!3472 thiss!1248) (mask!8258 thiss!1248) (extraKeys!3230 thiss!1248) (zeroValue!3332 thiss!1248) (minValue!3332 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3489 thiss!1248)))))

(declare-fun b!168682 () Bool)

(declare-fun lt!84386 () Unit!5199)

(assert (=> b!168682 (= e!110929 lt!84386)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!126 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4811 V!4811 (_ BitVec 64) Int) Unit!5199)

(assert (=> b!168682 (= lt!84386 (lemmaInListMapThenSeekEntryOrOpenFindsIt!126 (_keys!5314 thiss!1248) (_values!3472 thiss!1248) (mask!8258 thiss!1248) (extraKeys!3230 thiss!1248) (zeroValue!3332 thiss!1248) (minValue!3332 thiss!1248) key!828 (defaultEntry!3489 thiss!1248)))))

(declare-fun res!80302 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168682 (= res!80302 (inRange!0 (index!4193 lt!84393) (mask!8258 thiss!1248)))))

(declare-fun e!110932 () Bool)

(assert (=> b!168682 (=> (not res!80302) (not e!110932))))

(assert (=> b!168682 e!110932))

(declare-fun res!80303 () Bool)

(assert (=> start!16766 (=> (not res!80303) (not e!110925))))

(assert (=> start!16766 (= res!80303 (valid!906 thiss!1248))))

(assert (=> start!16766 e!110925))

(assert (=> start!16766 e!110927))

(assert (=> start!16766 true))

(assert (=> start!16766 tp_is_empty!3873))

(declare-fun b!168688 () Bool)

(declare-fun e!110930 () Bool)

(declare-fun mapRes!6528 () Bool)

(assert (=> b!168688 (= e!110931 (and e!110930 mapRes!6528))))

(declare-fun condMapEmpty!6528 () Bool)

(declare-fun mapDefault!6528 () ValueCell!1593)

(assert (=> b!168688 (= condMapEmpty!6528 (= (arr!3258 (_values!3472 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1593)) mapDefault!6528)))))

(declare-fun mapIsEmpty!6528 () Bool)

(assert (=> mapIsEmpty!6528 mapRes!6528))

(declare-fun mapNonEmpty!6528 () Bool)

(declare-fun tp!14813 () Bool)

(assert (=> mapNonEmpty!6528 (= mapRes!6528 (and tp!14813 e!110926))))

(declare-fun mapValue!6528 () ValueCell!1593)

(declare-fun mapKey!6528 () (_ BitVec 32))

(declare-fun mapRest!6528 () (Array (_ BitVec 32) ValueCell!1593))

(assert (=> mapNonEmpty!6528 (= (arr!3258 (_values!3472 thiss!1248)) (store mapRest!6528 mapKey!6528 mapValue!6528))))

(declare-fun b!168689 () Bool)

(assert (=> b!168689 (= e!110932 (= (select (arr!3257 (_keys!5314 thiss!1248)) (index!4193 lt!84393)) key!828))))

(declare-fun b!168690 () Bool)

(assert (=> b!168690 (= e!110930 tp_is_empty!3873)))

(assert (= (and start!16766 res!80303) b!168685))

(assert (= (and b!168685 res!80301) b!168683))

(assert (= (and b!168683 res!80304) b!168687))

(assert (= (and b!168687 c!30388) b!168682))

(assert (= (and b!168687 (not c!30388)) b!168686))

(assert (= (and b!168682 res!80302) b!168689))

(assert (= (and b!168688 condMapEmpty!6528) mapIsEmpty!6528))

(assert (= (and b!168688 (not condMapEmpty!6528)) mapNonEmpty!6528))

(assert (= (and mapNonEmpty!6528 ((_ is ValueCellFull!1593) mapValue!6528)) b!168681))

(assert (= (and b!168688 ((_ is ValueCellFull!1593) mapDefault!6528)) b!168690))

(assert (= b!168684 b!168688))

(assert (= start!16766 b!168684))

(declare-fun m!197751 () Bool)

(assert (=> b!168683 m!197751))

(declare-fun m!197753 () Bool)

(assert (=> b!168684 m!197753))

(declare-fun m!197755 () Bool)

(assert (=> b!168684 m!197755))

(declare-fun m!197757 () Bool)

(assert (=> b!168682 m!197757))

(declare-fun m!197759 () Bool)

(assert (=> b!168682 m!197759))

(declare-fun m!197761 () Bool)

(assert (=> b!168687 m!197761))

(declare-fun m!197763 () Bool)

(assert (=> b!168687 m!197763))

(declare-fun m!197765 () Bool)

(assert (=> b!168687 m!197765))

(declare-fun m!197767 () Bool)

(assert (=> b!168687 m!197767))

(declare-fun m!197769 () Bool)

(assert (=> b!168687 m!197769))

(declare-fun m!197771 () Bool)

(assert (=> b!168687 m!197771))

(declare-fun m!197773 () Bool)

(assert (=> b!168687 m!197773))

(assert (=> b!168687 m!197773))

(declare-fun m!197775 () Bool)

(assert (=> b!168687 m!197775))

(declare-fun m!197777 () Bool)

(assert (=> b!168687 m!197777))

(declare-fun m!197779 () Bool)

(assert (=> b!168687 m!197779))

(assert (=> b!168689 m!197773))

(declare-fun m!197781 () Bool)

(assert (=> mapNonEmpty!6528 m!197781))

(declare-fun m!197783 () Bool)

(assert (=> start!16766 m!197783))

(declare-fun m!197785 () Bool)

(assert (=> b!168686 m!197785))

(check-sat (not mapNonEmpty!6528) (not start!16766) (not b!168686) (not b!168682) tp_is_empty!3873 (not b!168684) (not b!168683) (not b_next!4071) (not b!168687) b_and!10485)
(check-sat b_and!10485 (not b_next!4071))
