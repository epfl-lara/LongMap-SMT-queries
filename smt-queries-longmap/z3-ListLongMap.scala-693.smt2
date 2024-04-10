; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16664 () Bool)

(assert start!16664)

(declare-fun b!166709 () Bool)

(declare-fun b_free!3969 () Bool)

(declare-fun b_next!3969 () Bool)

(assert (=> b!166709 (= b_free!3969 (not b_next!3969))))

(declare-fun tp!14508 () Bool)

(declare-fun b_and!10383 () Bool)

(assert (=> b!166709 (= tp!14508 b_and!10383)))

(declare-fun b!166707 () Bool)

(declare-fun res!79248 () Bool)

(declare-fun e!109403 () Bool)

(assert (=> b!166707 (=> (not res!79248) (not e!109403))))

(declare-datatypes ((V!4675 0))(
  ( (V!4676 (val!1930 Int)) )
))
(declare-datatypes ((ValueCell!1542 0))(
  ( (ValueCellFull!1542 (v!3795 V!4675)) (EmptyCell!1542) )
))
(declare-datatypes ((array!6639 0))(
  ( (array!6640 (arr!3155 (Array (_ BitVec 32) (_ BitVec 64))) (size!3443 (_ BitVec 32))) )
))
(declare-datatypes ((array!6641 0))(
  ( (array!6642 (arr!3156 (Array (_ BitVec 32) ValueCell!1542)) (size!3444 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1992 0))(
  ( (LongMapFixedSize!1993 (defaultEntry!3438 Int) (mask!8173 (_ BitVec 32)) (extraKeys!3179 (_ BitVec 32)) (zeroValue!3281 V!4675) (minValue!3281 V!4675) (_size!1045 (_ BitVec 32)) (_keys!5263 array!6639) (_values!3421 array!6641) (_vacant!1045 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1992)

(assert (=> b!166707 (= res!79248 (and (= (size!3444 (_values!3421 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8173 thiss!1248))) (= (size!3443 (_keys!5263 thiss!1248)) (size!3444 (_values!3421 thiss!1248))) (bvsge (mask!8173 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3179 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3179 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166708 () Bool)

(declare-fun e!109404 () Bool)

(assert (=> b!166708 (= e!109404 e!109403)))

(declare-fun res!79247 () Bool)

(assert (=> b!166708 (=> (not res!79247) (not e!109403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166708 (= res!79247 (validMask!0 (mask!8173 thiss!1248)))))

(declare-datatypes ((Unit!5078 0))(
  ( (Unit!5079) )
))
(declare-fun lt!83410 () Unit!5078)

(declare-fun e!109405 () Unit!5078)

(assert (=> b!166708 (= lt!83410 e!109405)))

(declare-fun c!30235 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3114 0))(
  ( (tuple2!3115 (_1!1568 (_ BitVec 64)) (_2!1568 V!4675)) )
))
(declare-datatypes ((List!2102 0))(
  ( (Nil!2099) (Cons!2098 (h!2715 tuple2!3114) (t!6904 List!2102)) )
))
(declare-datatypes ((ListLongMap!2069 0))(
  ( (ListLongMap!2070 (toList!1050 List!2102)) )
))
(declare-fun contains!1092 (ListLongMap!2069 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!708 (array!6639 array!6641 (_ BitVec 32) (_ BitVec 32) V!4675 V!4675 (_ BitVec 32) Int) ListLongMap!2069)

(assert (=> b!166708 (= c!30235 (contains!1092 (getCurrentListMap!708 (_keys!5263 thiss!1248) (_values!3421 thiss!1248) (mask!8173 thiss!1248) (extraKeys!3179 thiss!1248) (zeroValue!3281 thiss!1248) (minValue!3281 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3438 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!6375 () Bool)

(declare-fun mapRes!6375 () Bool)

(declare-fun tp!14507 () Bool)

(declare-fun e!109400 () Bool)

(assert (=> mapNonEmpty!6375 (= mapRes!6375 (and tp!14507 e!109400))))

(declare-fun mapRest!6375 () (Array (_ BitVec 32) ValueCell!1542))

(declare-fun mapValue!6375 () ValueCell!1542)

(declare-fun mapKey!6375 () (_ BitVec 32))

(assert (=> mapNonEmpty!6375 (= (arr!3156 (_values!3421 thiss!1248)) (store mapRest!6375 mapKey!6375 mapValue!6375))))

(declare-fun res!79249 () Bool)

(declare-fun e!109408 () Bool)

(assert (=> start!16664 (=> (not res!79249) (not e!109408))))

(declare-fun valid!874 (LongMapFixedSize!1992) Bool)

(assert (=> start!16664 (= res!79249 (valid!874 thiss!1248))))

(assert (=> start!16664 e!109408))

(declare-fun e!109402 () Bool)

(assert (=> start!16664 e!109402))

(assert (=> start!16664 true))

(declare-fun tp_is_empty!3771 () Bool)

(declare-fun e!109409 () Bool)

(declare-fun array_inv!2027 (array!6639) Bool)

(declare-fun array_inv!2028 (array!6641) Bool)

(assert (=> b!166709 (= e!109402 (and tp!14508 tp_is_empty!3771 (array_inv!2027 (_keys!5263 thiss!1248)) (array_inv!2028 (_values!3421 thiss!1248)) e!109409))))

(declare-fun mapIsEmpty!6375 () Bool)

(assert (=> mapIsEmpty!6375 mapRes!6375))

(declare-fun b!166710 () Bool)

(assert (=> b!166710 (= e!109400 tp_is_empty!3771)))

(declare-fun b!166711 () Bool)

(declare-fun Unit!5080 () Unit!5078)

(assert (=> b!166711 (= e!109405 Unit!5080)))

(declare-fun lt!83409 () Unit!5078)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!93 (array!6639 array!6641 (_ BitVec 32) (_ BitVec 32) V!4675 V!4675 (_ BitVec 64) Int) Unit!5078)

(assert (=> b!166711 (= lt!83409 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!93 (_keys!5263 thiss!1248) (_values!3421 thiss!1248) (mask!8173 thiss!1248) (extraKeys!3179 thiss!1248) (zeroValue!3281 thiss!1248) (minValue!3281 thiss!1248) key!828 (defaultEntry!3438 thiss!1248)))))

(assert (=> b!166711 false))

(declare-fun b!166712 () Bool)

(assert (=> b!166712 (= e!109403 false)))

(declare-fun lt!83413 () Bool)

(declare-datatypes ((List!2103 0))(
  ( (Nil!2100) (Cons!2099 (h!2716 (_ BitVec 64)) (t!6905 List!2103)) )
))
(declare-fun arrayNoDuplicates!0 (array!6639 (_ BitVec 32) List!2103) Bool)

(assert (=> b!166712 (= lt!83413 (arrayNoDuplicates!0 (_keys!5263 thiss!1248) #b00000000000000000000000000000000 Nil!2100))))

(declare-fun b!166713 () Bool)

(declare-fun e!109406 () Bool)

(assert (=> b!166713 (= e!109409 (and e!109406 mapRes!6375))))

(declare-fun condMapEmpty!6375 () Bool)

(declare-fun mapDefault!6375 () ValueCell!1542)

(assert (=> b!166713 (= condMapEmpty!6375 (= (arr!3156 (_values!3421 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1542)) mapDefault!6375)))))

(declare-fun b!166714 () Bool)

(assert (=> b!166714 (= e!109406 tp_is_empty!3771)))

(declare-datatypes ((SeekEntryResult!462 0))(
  ( (MissingZero!462 (index!4016 (_ BitVec 32))) (Found!462 (index!4017 (_ BitVec 32))) (Intermediate!462 (undefined!1274 Bool) (index!4018 (_ BitVec 32)) (x!18458 (_ BitVec 32))) (Undefined!462) (MissingVacant!462 (index!4019 (_ BitVec 32))) )
))
(declare-fun lt!83411 () SeekEntryResult!462)

(declare-fun e!109401 () Bool)

(declare-fun b!166715 () Bool)

(assert (=> b!166715 (= e!109401 (= (select (arr!3155 (_keys!5263 thiss!1248)) (index!4017 lt!83411)) key!828))))

(declare-fun b!166716 () Bool)

(assert (=> b!166716 (= e!109408 e!109404)))

(declare-fun res!79250 () Bool)

(assert (=> b!166716 (=> (not res!79250) (not e!109404))))

(get-info :version)

(assert (=> b!166716 (= res!79250 (and (not ((_ is Undefined!462) lt!83411)) (not ((_ is MissingVacant!462) lt!83411)) (not ((_ is MissingZero!462) lt!83411)) ((_ is Found!462) lt!83411)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6639 (_ BitVec 32)) SeekEntryResult!462)

(assert (=> b!166716 (= lt!83411 (seekEntryOrOpen!0 key!828 (_keys!5263 thiss!1248) (mask!8173 thiss!1248)))))

(declare-fun b!166717 () Bool)

(declare-fun lt!83412 () Unit!5078)

(assert (=> b!166717 (= e!109405 lt!83412)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!92 (array!6639 array!6641 (_ BitVec 32) (_ BitVec 32) V!4675 V!4675 (_ BitVec 64) Int) Unit!5078)

(assert (=> b!166717 (= lt!83412 (lemmaInListMapThenSeekEntryOrOpenFindsIt!92 (_keys!5263 thiss!1248) (_values!3421 thiss!1248) (mask!8173 thiss!1248) (extraKeys!3179 thiss!1248) (zeroValue!3281 thiss!1248) (minValue!3281 thiss!1248) key!828 (defaultEntry!3438 thiss!1248)))))

(declare-fun res!79246 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166717 (= res!79246 (inRange!0 (index!4017 lt!83411) (mask!8173 thiss!1248)))))

(assert (=> b!166717 (=> (not res!79246) (not e!109401))))

(assert (=> b!166717 e!109401))

(declare-fun b!166718 () Bool)

(declare-fun res!79245 () Bool)

(assert (=> b!166718 (=> (not res!79245) (not e!109408))))

(assert (=> b!166718 (= res!79245 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166719 () Bool)

(declare-fun res!79251 () Bool)

(assert (=> b!166719 (=> (not res!79251) (not e!109403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6639 (_ BitVec 32)) Bool)

(assert (=> b!166719 (= res!79251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5263 thiss!1248) (mask!8173 thiss!1248)))))

(assert (= (and start!16664 res!79249) b!166718))

(assert (= (and b!166718 res!79245) b!166716))

(assert (= (and b!166716 res!79250) b!166708))

(assert (= (and b!166708 c!30235) b!166717))

(assert (= (and b!166708 (not c!30235)) b!166711))

(assert (= (and b!166717 res!79246) b!166715))

(assert (= (and b!166708 res!79247) b!166707))

(assert (= (and b!166707 res!79248) b!166719))

(assert (= (and b!166719 res!79251) b!166712))

(assert (= (and b!166713 condMapEmpty!6375) mapIsEmpty!6375))

(assert (= (and b!166713 (not condMapEmpty!6375)) mapNonEmpty!6375))

(assert (= (and mapNonEmpty!6375 ((_ is ValueCellFull!1542) mapValue!6375)) b!166710))

(assert (= (and b!166713 ((_ is ValueCellFull!1542) mapDefault!6375)) b!166714))

(assert (= b!166709 b!166713))

(assert (= start!16664 b!166709))

(declare-fun m!196075 () Bool)

(assert (=> b!166709 m!196075))

(declare-fun m!196077 () Bool)

(assert (=> b!166709 m!196077))

(declare-fun m!196079 () Bool)

(assert (=> start!16664 m!196079))

(declare-fun m!196081 () Bool)

(assert (=> b!166711 m!196081))

(declare-fun m!196083 () Bool)

(assert (=> b!166717 m!196083))

(declare-fun m!196085 () Bool)

(assert (=> b!166717 m!196085))

(declare-fun m!196087 () Bool)

(assert (=> mapNonEmpty!6375 m!196087))

(declare-fun m!196089 () Bool)

(assert (=> b!166708 m!196089))

(declare-fun m!196091 () Bool)

(assert (=> b!166708 m!196091))

(assert (=> b!166708 m!196091))

(declare-fun m!196093 () Bool)

(assert (=> b!166708 m!196093))

(declare-fun m!196095 () Bool)

(assert (=> b!166712 m!196095))

(declare-fun m!196097 () Bool)

(assert (=> b!166716 m!196097))

(declare-fun m!196099 () Bool)

(assert (=> b!166715 m!196099))

(declare-fun m!196101 () Bool)

(assert (=> b!166719 m!196101))

(check-sat (not b!166709) (not b_next!3969) (not b!166717) (not b!166719) (not start!16664) (not b!166708) b_and!10383 (not mapNonEmpty!6375) (not b!166712) (not b!166716) (not b!166711) tp_is_empty!3771)
(check-sat b_and!10383 (not b_next!3969))
