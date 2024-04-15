; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16714 () Bool)

(assert start!16714)

(declare-fun b!167467 () Bool)

(declare-fun b_free!4015 () Bool)

(declare-fun b_next!4015 () Bool)

(assert (=> b!167467 (= b_free!4015 (not b_next!4015))))

(declare-fun tp!14646 () Bool)

(declare-fun b_and!10403 () Bool)

(assert (=> b!167467 (= tp!14646 b_and!10403)))

(declare-fun b!167457 () Bool)

(declare-fun e!109997 () Bool)

(declare-fun tp_is_empty!3817 () Bool)

(assert (=> b!167457 (= e!109997 tp_is_empty!3817)))

(declare-fun b!167458 () Bool)

(declare-fun e!109990 () Bool)

(assert (=> b!167458 (= e!109990 true)))

(declare-fun lt!83596 () Bool)

(declare-datatypes ((V!4737 0))(
  ( (V!4738 (val!1953 Int)) )
))
(declare-datatypes ((ValueCell!1565 0))(
  ( (ValueCellFull!1565 (v!3812 V!4737)) (EmptyCell!1565) )
))
(declare-datatypes ((array!6711 0))(
  ( (array!6712 (arr!3190 (Array (_ BitVec 32) (_ BitVec 64))) (size!3479 (_ BitVec 32))) )
))
(declare-datatypes ((array!6713 0))(
  ( (array!6714 (arr!3191 (Array (_ BitVec 32) ValueCell!1565)) (size!3480 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2038 0))(
  ( (LongMapFixedSize!2039 (defaultEntry!3461 Int) (mask!8211 (_ BitVec 32)) (extraKeys!3202 (_ BitVec 32)) (zeroValue!3304 V!4737) (minValue!3304 V!4737) (_size!1068 (_ BitVec 32)) (_keys!5285 array!6711) (_values!3444 array!6713) (_vacant!1068 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2038)

(declare-datatypes ((List!2135 0))(
  ( (Nil!2132) (Cons!2131 (h!2748 (_ BitVec 64)) (t!6928 List!2135)) )
))
(declare-fun arrayNoDuplicates!0 (array!6711 (_ BitVec 32) List!2135) Bool)

(assert (=> b!167458 (= lt!83596 (arrayNoDuplicates!0 (_keys!5285 thiss!1248) #b00000000000000000000000000000000 Nil!2132))))

(declare-fun b!167459 () Bool)

(declare-fun res!79637 () Bool)

(assert (=> b!167459 (=> res!79637 e!109990)))

(assert (=> b!167459 (= res!79637 (or (not (= (size!3480 (_values!3444 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8211 thiss!1248)))) (not (= (size!3479 (_keys!5285 thiss!1248)) (size!3480 (_values!3444 thiss!1248)))) (bvslt (mask!8211 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3202 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3202 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167460 () Bool)

(declare-fun e!109991 () Bool)

(assert (=> b!167460 (= e!109991 (not e!109990))))

(declare-fun res!79633 () Bool)

(assert (=> b!167460 (=> res!79633 e!109990)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167460 (= res!79633 (not (validMask!0 (mask!8211 thiss!1248))))))

(declare-datatypes ((tuple2!3130 0))(
  ( (tuple2!3131 (_1!1576 (_ BitVec 64)) (_2!1576 V!4737)) )
))
(declare-datatypes ((List!2136 0))(
  ( (Nil!2133) (Cons!2132 (h!2749 tuple2!3130) (t!6929 List!2136)) )
))
(declare-datatypes ((ListLongMap!2073 0))(
  ( (ListLongMap!2074 (toList!1052 List!2136)) )
))
(declare-fun lt!83599 () ListLongMap!2073)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!491 0))(
  ( (MissingZero!491 (index!4132 (_ BitVec 32))) (Found!491 (index!4133 (_ BitVec 32))) (Intermediate!491 (undefined!1303 Bool) (index!4134 (_ BitVec 32)) (x!18550 (_ BitVec 32))) (Undefined!491) (MissingVacant!491 (index!4135 (_ BitVec 32))) )
))
(declare-fun lt!83601 () SeekEntryResult!491)

(declare-fun v!309 () V!4737)

(declare-fun +!203 (ListLongMap!2073 tuple2!3130) ListLongMap!2073)

(declare-fun getCurrentListMap!694 (array!6711 array!6713 (_ BitVec 32) (_ BitVec 32) V!4737 V!4737 (_ BitVec 32) Int) ListLongMap!2073)

(assert (=> b!167460 (= (+!203 lt!83599 (tuple2!3131 key!828 v!309)) (getCurrentListMap!694 (_keys!5285 thiss!1248) (array!6714 (store (arr!3191 (_values!3444 thiss!1248)) (index!4133 lt!83601) (ValueCellFull!1565 v!309)) (size!3480 (_values!3444 thiss!1248))) (mask!8211 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3461 thiss!1248)))))

(declare-datatypes ((Unit!5104 0))(
  ( (Unit!5105) )
))
(declare-fun lt!83597 () Unit!5104)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!75 (array!6711 array!6713 (_ BitVec 32) (_ BitVec 32) V!4737 V!4737 (_ BitVec 32) (_ BitVec 64) V!4737 Int) Unit!5104)

(assert (=> b!167460 (= lt!83597 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!75 (_keys!5285 thiss!1248) (_values!3444 thiss!1248) (mask!8211 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) (index!4133 lt!83601) key!828 v!309 (defaultEntry!3461 thiss!1248)))))

(declare-fun lt!83600 () Unit!5104)

(declare-fun e!109995 () Unit!5104)

(assert (=> b!167460 (= lt!83600 e!109995)))

(declare-fun c!30278 () Bool)

(declare-fun contains!1097 (ListLongMap!2073 (_ BitVec 64)) Bool)

(assert (=> b!167460 (= c!30278 (contains!1097 lt!83599 key!828))))

(assert (=> b!167460 (= lt!83599 (getCurrentListMap!694 (_keys!5285 thiss!1248) (_values!3444 thiss!1248) (mask!8211 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3461 thiss!1248)))))

(declare-fun res!79634 () Bool)

(declare-fun e!109998 () Bool)

(assert (=> start!16714 (=> (not res!79634) (not e!109998))))

(declare-fun valid!898 (LongMapFixedSize!2038) Bool)

(assert (=> start!16714 (= res!79634 (valid!898 thiss!1248))))

(assert (=> start!16714 e!109998))

(declare-fun e!109992 () Bool)

(assert (=> start!16714 e!109992))

(assert (=> start!16714 true))

(assert (=> start!16714 tp_is_empty!3817))

(declare-fun b!167461 () Bool)

(declare-fun e!109996 () Bool)

(declare-fun mapRes!6444 () Bool)

(assert (=> b!167461 (= e!109996 (and e!109997 mapRes!6444))))

(declare-fun condMapEmpty!6444 () Bool)

(declare-fun mapDefault!6444 () ValueCell!1565)

(assert (=> b!167461 (= condMapEmpty!6444 (= (arr!3191 (_values!3444 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1565)) mapDefault!6444)))))

(declare-fun b!167462 () Bool)

(declare-fun e!109993 () Bool)

(assert (=> b!167462 (= e!109993 tp_is_empty!3817)))

(declare-fun b!167463 () Bool)

(declare-fun lt!83595 () Unit!5104)

(assert (=> b!167463 (= e!109995 lt!83595)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!105 (array!6711 array!6713 (_ BitVec 32) (_ BitVec 32) V!4737 V!4737 (_ BitVec 64) Int) Unit!5104)

(assert (=> b!167463 (= lt!83595 (lemmaInListMapThenSeekEntryOrOpenFindsIt!105 (_keys!5285 thiss!1248) (_values!3444 thiss!1248) (mask!8211 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) key!828 (defaultEntry!3461 thiss!1248)))))

(declare-fun res!79638 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167463 (= res!79638 (inRange!0 (index!4133 lt!83601) (mask!8211 thiss!1248)))))

(declare-fun e!109989 () Bool)

(assert (=> b!167463 (=> (not res!79638) (not e!109989))))

(assert (=> b!167463 e!109989))

(declare-fun mapIsEmpty!6444 () Bool)

(assert (=> mapIsEmpty!6444 mapRes!6444))

(declare-fun b!167464 () Bool)

(declare-fun res!79636 () Bool)

(assert (=> b!167464 (=> res!79636 e!109990)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6711 (_ BitVec 32)) Bool)

(assert (=> b!167464 (= res!79636 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5285 thiss!1248) (mask!8211 thiss!1248))))))

(declare-fun b!167465 () Bool)

(assert (=> b!167465 (= e!109989 (= (select (arr!3190 (_keys!5285 thiss!1248)) (index!4133 lt!83601)) key!828))))

(declare-fun b!167466 () Bool)

(assert (=> b!167466 (= e!109998 e!109991)))

(declare-fun res!79635 () Bool)

(assert (=> b!167466 (=> (not res!79635) (not e!109991))))

(get-info :version)

(assert (=> b!167466 (= res!79635 (and (not ((_ is Undefined!491) lt!83601)) (not ((_ is MissingVacant!491) lt!83601)) (not ((_ is MissingZero!491) lt!83601)) ((_ is Found!491) lt!83601)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6711 (_ BitVec 32)) SeekEntryResult!491)

(assert (=> b!167466 (= lt!83601 (seekEntryOrOpen!0 key!828 (_keys!5285 thiss!1248) (mask!8211 thiss!1248)))))

(declare-fun mapNonEmpty!6444 () Bool)

(declare-fun tp!14645 () Bool)

(assert (=> mapNonEmpty!6444 (= mapRes!6444 (and tp!14645 e!109993))))

(declare-fun mapRest!6444 () (Array (_ BitVec 32) ValueCell!1565))

(declare-fun mapKey!6444 () (_ BitVec 32))

(declare-fun mapValue!6444 () ValueCell!1565)

(assert (=> mapNonEmpty!6444 (= (arr!3191 (_values!3444 thiss!1248)) (store mapRest!6444 mapKey!6444 mapValue!6444))))

(declare-fun array_inv!2055 (array!6711) Bool)

(declare-fun array_inv!2056 (array!6713) Bool)

(assert (=> b!167467 (= e!109992 (and tp!14646 tp_is_empty!3817 (array_inv!2055 (_keys!5285 thiss!1248)) (array_inv!2056 (_values!3444 thiss!1248)) e!109996))))

(declare-fun b!167468 () Bool)

(declare-fun res!79639 () Bool)

(assert (=> b!167468 (=> (not res!79639) (not e!109998))))

(assert (=> b!167468 (= res!79639 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167469 () Bool)

(declare-fun Unit!5106 () Unit!5104)

(assert (=> b!167469 (= e!109995 Unit!5106)))

(declare-fun lt!83598 () Unit!5104)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!104 (array!6711 array!6713 (_ BitVec 32) (_ BitVec 32) V!4737 V!4737 (_ BitVec 64) Int) Unit!5104)

(assert (=> b!167469 (= lt!83598 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!104 (_keys!5285 thiss!1248) (_values!3444 thiss!1248) (mask!8211 thiss!1248) (extraKeys!3202 thiss!1248) (zeroValue!3304 thiss!1248) (minValue!3304 thiss!1248) key!828 (defaultEntry!3461 thiss!1248)))))

(assert (=> b!167469 false))

(assert (= (and start!16714 res!79634) b!167468))

(assert (= (and b!167468 res!79639) b!167466))

(assert (= (and b!167466 res!79635) b!167460))

(assert (= (and b!167460 c!30278) b!167463))

(assert (= (and b!167460 (not c!30278)) b!167469))

(assert (= (and b!167463 res!79638) b!167465))

(assert (= (and b!167460 (not res!79633)) b!167459))

(assert (= (and b!167459 (not res!79637)) b!167464))

(assert (= (and b!167464 (not res!79636)) b!167458))

(assert (= (and b!167461 condMapEmpty!6444) mapIsEmpty!6444))

(assert (= (and b!167461 (not condMapEmpty!6444)) mapNonEmpty!6444))

(assert (= (and mapNonEmpty!6444 ((_ is ValueCellFull!1565) mapValue!6444)) b!167462))

(assert (= (and b!167461 ((_ is ValueCellFull!1565) mapDefault!6444)) b!167457))

(assert (= b!167467 b!167461))

(assert (= start!16714 b!167467))

(declare-fun m!196123 () Bool)

(assert (=> start!16714 m!196123))

(declare-fun m!196125 () Bool)

(assert (=> b!167458 m!196125))

(declare-fun m!196127 () Bool)

(assert (=> b!167463 m!196127))

(declare-fun m!196129 () Bool)

(assert (=> b!167463 m!196129))

(declare-fun m!196131 () Bool)

(assert (=> b!167460 m!196131))

(declare-fun m!196133 () Bool)

(assert (=> b!167460 m!196133))

(declare-fun m!196135 () Bool)

(assert (=> b!167460 m!196135))

(declare-fun m!196137 () Bool)

(assert (=> b!167460 m!196137))

(declare-fun m!196139 () Bool)

(assert (=> b!167460 m!196139))

(declare-fun m!196141 () Bool)

(assert (=> b!167460 m!196141))

(declare-fun m!196143 () Bool)

(assert (=> b!167460 m!196143))

(declare-fun m!196145 () Bool)

(assert (=> b!167464 m!196145))

(declare-fun m!196147 () Bool)

(assert (=> b!167465 m!196147))

(declare-fun m!196149 () Bool)

(assert (=> b!167469 m!196149))

(declare-fun m!196151 () Bool)

(assert (=> mapNonEmpty!6444 m!196151))

(declare-fun m!196153 () Bool)

(assert (=> b!167466 m!196153))

(declare-fun m!196155 () Bool)

(assert (=> b!167467 m!196155))

(declare-fun m!196157 () Bool)

(assert (=> b!167467 m!196157))

(check-sat (not b!167463) (not b!167464) (not mapNonEmpty!6444) (not b_next!4015) b_and!10403 (not b!167467) (not b!167469) (not start!16714) (not b!167458) (not b!167466) (not b!167460) tp_is_empty!3817)
(check-sat b_and!10403 (not b_next!4015))
