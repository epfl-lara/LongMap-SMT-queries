; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16666 () Bool)

(assert start!16666)

(declare-fun b!166715 () Bool)

(declare-fun b_free!3967 () Bool)

(declare-fun b_next!3967 () Bool)

(assert (=> b!166715 (= b_free!3967 (not b_next!3967))))

(declare-fun tp!14501 () Bool)

(declare-fun b_and!10395 () Bool)

(assert (=> b!166715 (= tp!14501 b_and!10395)))

(declare-fun tp_is_empty!3769 () Bool)

(declare-fun e!109395 () Bool)

(declare-datatypes ((V!4673 0))(
  ( (V!4674 (val!1929 Int)) )
))
(declare-datatypes ((ValueCell!1541 0))(
  ( (ValueCellFull!1541 (v!3795 V!4673)) (EmptyCell!1541) )
))
(declare-datatypes ((array!6621 0))(
  ( (array!6622 (arr!3146 (Array (_ BitVec 32) (_ BitVec 64))) (size!3434 (_ BitVec 32))) )
))
(declare-datatypes ((array!6623 0))(
  ( (array!6624 (arr!3147 (Array (_ BitVec 32) ValueCell!1541)) (size!3435 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1990 0))(
  ( (LongMapFixedSize!1991 (defaultEntry!3437 Int) (mask!8172 (_ BitVec 32)) (extraKeys!3178 (_ BitVec 32)) (zeroValue!3280 V!4673) (minValue!3280 V!4673) (_size!1044 (_ BitVec 32)) (_keys!5262 array!6621) (_values!3420 array!6623) (_vacant!1044 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1990)

(declare-fun e!109399 () Bool)

(declare-fun array_inv!2011 (array!6621) Bool)

(declare-fun array_inv!2012 (array!6623) Bool)

(assert (=> b!166715 (= e!109399 (and tp!14501 tp_is_empty!3769 (array_inv!2011 (_keys!5262 thiss!1248)) (array_inv!2012 (_values!3420 thiss!1248)) e!109395))))

(declare-fun b!166716 () Bool)

(declare-fun res!79247 () Bool)

(declare-fun e!109394 () Bool)

(assert (=> b!166716 (=> (not res!79247) (not e!109394))))

(assert (=> b!166716 (= res!79247 (and (= (size!3435 (_values!3420 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8172 thiss!1248))) (= (size!3434 (_keys!5262 thiss!1248)) (size!3435 (_values!3420 thiss!1248))) (bvsge (mask!8172 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3178 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3178 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166717 () Bool)

(declare-fun e!109397 () Bool)

(assert (=> b!166717 (= e!109397 tp_is_empty!3769)))

(declare-fun res!79245 () Bool)

(declare-fun e!109398 () Bool)

(assert (=> start!16666 (=> (not res!79245) (not e!109398))))

(declare-fun valid!886 (LongMapFixedSize!1990) Bool)

(assert (=> start!16666 (= res!79245 (valid!886 thiss!1248))))

(assert (=> start!16666 e!109398))

(assert (=> start!16666 e!109399))

(assert (=> start!16666 true))

(declare-fun b!166718 () Bool)

(declare-fun res!79251 () Bool)

(assert (=> b!166718 (=> (not res!79251) (not e!109394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6621 (_ BitVec 32)) Bool)

(assert (=> b!166718 (= res!79251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5262 thiss!1248) (mask!8172 thiss!1248)))))

(declare-fun e!109396 () Bool)

(declare-datatypes ((SeekEntryResult!457 0))(
  ( (MissingZero!457 (index!3996 (_ BitVec 32))) (Found!457 (index!3997 (_ BitVec 32))) (Intermediate!457 (undefined!1269 Bool) (index!3998 (_ BitVec 32)) (x!18453 (_ BitVec 32))) (Undefined!457) (MissingVacant!457 (index!3999 (_ BitVec 32))) )
))
(declare-fun lt!83454 () SeekEntryResult!457)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun b!166719 () Bool)

(assert (=> b!166719 (= e!109396 (= (select (arr!3146 (_keys!5262 thiss!1248)) (index!3997 lt!83454)) key!828))))

(declare-fun b!166720 () Bool)

(declare-fun e!109401 () Bool)

(declare-fun mapRes!6372 () Bool)

(assert (=> b!166720 (= e!109395 (and e!109401 mapRes!6372))))

(declare-fun condMapEmpty!6372 () Bool)

(declare-fun mapDefault!6372 () ValueCell!1541)

(assert (=> b!166720 (= condMapEmpty!6372 (= (arr!3147 (_values!3420 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1541)) mapDefault!6372)))))

(declare-fun b!166721 () Bool)

(assert (=> b!166721 (= e!109401 tp_is_empty!3769)))

(declare-fun mapIsEmpty!6372 () Bool)

(assert (=> mapIsEmpty!6372 mapRes!6372))

(declare-fun b!166722 () Bool)

(declare-datatypes ((Unit!5090 0))(
  ( (Unit!5091) )
))
(declare-fun e!109403 () Unit!5090)

(declare-fun lt!83453 () Unit!5090)

(assert (=> b!166722 (= e!109403 lt!83453)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!96 (array!6621 array!6623 (_ BitVec 32) (_ BitVec 32) V!4673 V!4673 (_ BitVec 64) Int) Unit!5090)

(assert (=> b!166722 (= lt!83453 (lemmaInListMapThenSeekEntryOrOpenFindsIt!96 (_keys!5262 thiss!1248) (_values!3420 thiss!1248) (mask!8172 thiss!1248) (extraKeys!3178 thiss!1248) (zeroValue!3280 thiss!1248) (minValue!3280 thiss!1248) key!828 (defaultEntry!3437 thiss!1248)))))

(declare-fun res!79250 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166722 (= res!79250 (inRange!0 (index!3997 lt!83454) (mask!8172 thiss!1248)))))

(assert (=> b!166722 (=> (not res!79250) (not e!109396))))

(assert (=> b!166722 e!109396))

(declare-fun b!166723 () Bool)

(declare-fun e!109402 () Bool)

(assert (=> b!166723 (= e!109398 e!109402)))

(declare-fun res!79248 () Bool)

(assert (=> b!166723 (=> (not res!79248) (not e!109402))))

(get-info :version)

(assert (=> b!166723 (= res!79248 (and (not ((_ is Undefined!457) lt!83454)) (not ((_ is MissingVacant!457) lt!83454)) (not ((_ is MissingZero!457) lt!83454)) ((_ is Found!457) lt!83454)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6621 (_ BitVec 32)) SeekEntryResult!457)

(assert (=> b!166723 (= lt!83454 (seekEntryOrOpen!0 key!828 (_keys!5262 thiss!1248) (mask!8172 thiss!1248)))))

(declare-fun b!166724 () Bool)

(assert (=> b!166724 (= e!109394 false)))

(declare-fun lt!83456 () Bool)

(declare-datatypes ((List!2086 0))(
  ( (Nil!2083) (Cons!2082 (h!2699 (_ BitVec 64)) (t!6880 List!2086)) )
))
(declare-fun arrayNoDuplicates!0 (array!6621 (_ BitVec 32) List!2086) Bool)

(assert (=> b!166724 (= lt!83456 (arrayNoDuplicates!0 (_keys!5262 thiss!1248) #b00000000000000000000000000000000 Nil!2083))))

(declare-fun b!166725 () Bool)

(assert (=> b!166725 (= e!109402 e!109394)))

(declare-fun res!79246 () Bool)

(assert (=> b!166725 (=> (not res!79246) (not e!109394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166725 (= res!79246 (validMask!0 (mask!8172 thiss!1248)))))

(declare-fun lt!83455 () Unit!5090)

(assert (=> b!166725 (= lt!83455 e!109403)))

(declare-fun c!30245 () Bool)

(declare-datatypes ((tuple2!3068 0))(
  ( (tuple2!3069 (_1!1545 (_ BitVec 64)) (_2!1545 V!4673)) )
))
(declare-datatypes ((List!2087 0))(
  ( (Nil!2084) (Cons!2083 (h!2700 tuple2!3068) (t!6881 List!2087)) )
))
(declare-datatypes ((ListLongMap!2029 0))(
  ( (ListLongMap!2030 (toList!1030 List!2087)) )
))
(declare-fun contains!1082 (ListLongMap!2029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!692 (array!6621 array!6623 (_ BitVec 32) (_ BitVec 32) V!4673 V!4673 (_ BitVec 32) Int) ListLongMap!2029)

(assert (=> b!166725 (= c!30245 (contains!1082 (getCurrentListMap!692 (_keys!5262 thiss!1248) (_values!3420 thiss!1248) (mask!8172 thiss!1248) (extraKeys!3178 thiss!1248) (zeroValue!3280 thiss!1248) (minValue!3280 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3437 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!6372 () Bool)

(declare-fun tp!14502 () Bool)

(assert (=> mapNonEmpty!6372 (= mapRes!6372 (and tp!14502 e!109397))))

(declare-fun mapValue!6372 () ValueCell!1541)

(declare-fun mapRest!6372 () (Array (_ BitVec 32) ValueCell!1541))

(declare-fun mapKey!6372 () (_ BitVec 32))

(assert (=> mapNonEmpty!6372 (= (arr!3147 (_values!3420 thiss!1248)) (store mapRest!6372 mapKey!6372 mapValue!6372))))

(declare-fun b!166726 () Bool)

(declare-fun Unit!5092 () Unit!5090)

(assert (=> b!166726 (= e!109403 Unit!5092)))

(declare-fun lt!83457 () Unit!5090)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!92 (array!6621 array!6623 (_ BitVec 32) (_ BitVec 32) V!4673 V!4673 (_ BitVec 64) Int) Unit!5090)

(assert (=> b!166726 (= lt!83457 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!92 (_keys!5262 thiss!1248) (_values!3420 thiss!1248) (mask!8172 thiss!1248) (extraKeys!3178 thiss!1248) (zeroValue!3280 thiss!1248) (minValue!3280 thiss!1248) key!828 (defaultEntry!3437 thiss!1248)))))

(assert (=> b!166726 false))

(declare-fun b!166727 () Bool)

(declare-fun res!79249 () Bool)

(assert (=> b!166727 (=> (not res!79249) (not e!109398))))

(assert (=> b!166727 (= res!79249 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16666 res!79245) b!166727))

(assert (= (and b!166727 res!79249) b!166723))

(assert (= (and b!166723 res!79248) b!166725))

(assert (= (and b!166725 c!30245) b!166722))

(assert (= (and b!166725 (not c!30245)) b!166726))

(assert (= (and b!166722 res!79250) b!166719))

(assert (= (and b!166725 res!79246) b!166716))

(assert (= (and b!166716 res!79247) b!166718))

(assert (= (and b!166718 res!79251) b!166724))

(assert (= (and b!166720 condMapEmpty!6372) mapIsEmpty!6372))

(assert (= (and b!166720 (not condMapEmpty!6372)) mapNonEmpty!6372))

(assert (= (and mapNonEmpty!6372 ((_ is ValueCellFull!1541) mapValue!6372)) b!166717))

(assert (= (and b!166720 ((_ is ValueCellFull!1541) mapDefault!6372)) b!166721))

(assert (= b!166715 b!166720))

(assert (= start!16666 b!166715))

(declare-fun m!196229 () Bool)

(assert (=> b!166725 m!196229))

(declare-fun m!196231 () Bool)

(assert (=> b!166725 m!196231))

(assert (=> b!166725 m!196231))

(declare-fun m!196233 () Bool)

(assert (=> b!166725 m!196233))

(declare-fun m!196235 () Bool)

(assert (=> b!166719 m!196235))

(declare-fun m!196237 () Bool)

(assert (=> b!166726 m!196237))

(declare-fun m!196239 () Bool)

(assert (=> b!166715 m!196239))

(declare-fun m!196241 () Bool)

(assert (=> b!166715 m!196241))

(declare-fun m!196243 () Bool)

(assert (=> b!166724 m!196243))

(declare-fun m!196245 () Bool)

(assert (=> b!166718 m!196245))

(declare-fun m!196247 () Bool)

(assert (=> start!16666 m!196247))

(declare-fun m!196249 () Bool)

(assert (=> b!166723 m!196249))

(declare-fun m!196251 () Bool)

(assert (=> b!166722 m!196251))

(declare-fun m!196253 () Bool)

(assert (=> b!166722 m!196253))

(declare-fun m!196255 () Bool)

(assert (=> mapNonEmpty!6372 m!196255))

(check-sat (not b_next!3967) (not b!166722) tp_is_empty!3769 (not b!166718) (not mapNonEmpty!6372) (not b!166723) (not b!166725) b_and!10395 (not b!166726) (not start!16666) (not b!166715) (not b!166724))
(check-sat b_and!10395 (not b_next!3967))
