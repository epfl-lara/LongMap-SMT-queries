; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16700 () Bool)

(assert start!16700)

(declare-fun b!167410 () Bool)

(declare-fun b_free!4005 () Bool)

(declare-fun b_next!4005 () Bool)

(assert (=> b!167410 (= b_free!4005 (not b_next!4005))))

(declare-fun tp!14615 () Bool)

(declare-fun b_and!10419 () Bool)

(assert (=> b!167410 (= tp!14615 b_and!10419)))

(declare-datatypes ((SeekEntryResult!479 0))(
  ( (MissingZero!479 (index!4084 (_ BitVec 32))) (Found!479 (index!4085 (_ BitVec 32))) (Intermediate!479 (undefined!1291 Bool) (index!4086 (_ BitVec 32)) (x!18523 (_ BitVec 32))) (Undefined!479) (MissingVacant!479 (index!4087 (_ BitVec 32))) )
))
(declare-fun lt!83679 () SeekEntryResult!479)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!109944 () Bool)

(declare-fun b!167409 () Bool)

(declare-datatypes ((V!4723 0))(
  ( (V!4724 (val!1948 Int)) )
))
(declare-datatypes ((ValueCell!1560 0))(
  ( (ValueCellFull!1560 (v!3813 V!4723)) (EmptyCell!1560) )
))
(declare-datatypes ((array!6711 0))(
  ( (array!6712 (arr!3191 (Array (_ BitVec 32) (_ BitVec 64))) (size!3479 (_ BitVec 32))) )
))
(declare-datatypes ((array!6713 0))(
  ( (array!6714 (arr!3192 (Array (_ BitVec 32) ValueCell!1560)) (size!3480 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2028 0))(
  ( (LongMapFixedSize!2029 (defaultEntry!3456 Int) (mask!8203 (_ BitVec 32)) (extraKeys!3197 (_ BitVec 32)) (zeroValue!3299 V!4723) (minValue!3299 V!4723) (_size!1063 (_ BitVec 32)) (_keys!5281 array!6711) (_values!3439 array!6713) (_vacant!1063 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2028)

(assert (=> b!167409 (= e!109944 (= (select (arr!3191 (_keys!5281 thiss!1248)) (index!4085 lt!83679)) key!828))))

(declare-fun res!79629 () Bool)

(declare-fun e!109947 () Bool)

(assert (=> start!16700 (=> (not res!79629) (not e!109947))))

(declare-fun valid!886 (LongMapFixedSize!2028) Bool)

(assert (=> start!16700 (= res!79629 (valid!886 thiss!1248))))

(assert (=> start!16700 e!109947))

(declare-fun e!109943 () Bool)

(assert (=> start!16700 e!109943))

(assert (=> start!16700 true))

(declare-fun e!109942 () Bool)

(declare-fun tp_is_empty!3807 () Bool)

(declare-fun array_inv!2057 (array!6711) Bool)

(declare-fun array_inv!2058 (array!6713) Bool)

(assert (=> b!167410 (= e!109943 (and tp!14615 tp_is_empty!3807 (array_inv!2057 (_keys!5281 thiss!1248)) (array_inv!2058 (_values!3439 thiss!1248)) e!109942))))

(declare-fun b!167411 () Bool)

(declare-datatypes ((Unit!5126 0))(
  ( (Unit!5127) )
))
(declare-fun e!109948 () Unit!5126)

(declare-fun Unit!5128 () Unit!5126)

(assert (=> b!167411 (= e!109948 Unit!5128)))

(declare-fun lt!83680 () Unit!5126)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!107 (array!6711 array!6713 (_ BitVec 32) (_ BitVec 32) V!4723 V!4723 (_ BitVec 64) Int) Unit!5126)

(assert (=> b!167411 (= lt!83680 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!107 (_keys!5281 thiss!1248) (_values!3439 thiss!1248) (mask!8203 thiss!1248) (extraKeys!3197 thiss!1248) (zeroValue!3299 thiss!1248) (minValue!3299 thiss!1248) key!828 (defaultEntry!3456 thiss!1248)))))

(assert (=> b!167411 false))

(declare-fun mapIsEmpty!6429 () Bool)

(declare-fun mapRes!6429 () Bool)

(assert (=> mapIsEmpty!6429 mapRes!6429))

(declare-fun b!167412 () Bool)

(declare-fun res!79626 () Bool)

(declare-fun e!109940 () Bool)

(assert (=> b!167412 (=> (not res!79626) (not e!109940))))

(assert (=> b!167412 (= res!79626 (and (= (size!3480 (_values!3439 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8203 thiss!1248))) (= (size!3479 (_keys!5281 thiss!1248)) (size!3480 (_values!3439 thiss!1248))) (bvsge (mask!8203 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3197 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3197 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167413 () Bool)

(declare-fun e!109946 () Bool)

(assert (=> b!167413 (= e!109946 e!109940)))

(declare-fun res!79624 () Bool)

(assert (=> b!167413 (=> (not res!79624) (not e!109940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167413 (= res!79624 (validMask!0 (mask!8203 thiss!1248)))))

(declare-fun lt!83683 () Unit!5126)

(assert (=> b!167413 (= lt!83683 e!109948)))

(declare-fun c!30289 () Bool)

(declare-datatypes ((tuple2!3142 0))(
  ( (tuple2!3143 (_1!1582 (_ BitVec 64)) (_2!1582 V!4723)) )
))
(declare-datatypes ((List!2129 0))(
  ( (Nil!2126) (Cons!2125 (h!2742 tuple2!3142) (t!6931 List!2129)) )
))
(declare-datatypes ((ListLongMap!2097 0))(
  ( (ListLongMap!2098 (toList!1064 List!2129)) )
))
(declare-fun contains!1106 (ListLongMap!2097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!722 (array!6711 array!6713 (_ BitVec 32) (_ BitVec 32) V!4723 V!4723 (_ BitVec 32) Int) ListLongMap!2097)

(assert (=> b!167413 (= c!30289 (contains!1106 (getCurrentListMap!722 (_keys!5281 thiss!1248) (_values!3439 thiss!1248) (mask!8203 thiss!1248) (extraKeys!3197 thiss!1248) (zeroValue!3299 thiss!1248) (minValue!3299 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3456 thiss!1248)) key!828))))

(declare-fun b!167414 () Bool)

(declare-fun lt!83681 () Unit!5126)

(assert (=> b!167414 (= e!109948 lt!83681)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!106 (array!6711 array!6713 (_ BitVec 32) (_ BitVec 32) V!4723 V!4723 (_ BitVec 64) Int) Unit!5126)

(assert (=> b!167414 (= lt!83681 (lemmaInListMapThenSeekEntryOrOpenFindsIt!106 (_keys!5281 thiss!1248) (_values!3439 thiss!1248) (mask!8203 thiss!1248) (extraKeys!3197 thiss!1248) (zeroValue!3299 thiss!1248) (minValue!3299 thiss!1248) key!828 (defaultEntry!3456 thiss!1248)))))

(declare-fun res!79623 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167414 (= res!79623 (inRange!0 (index!4085 lt!83679) (mask!8203 thiss!1248)))))

(assert (=> b!167414 (=> (not res!79623) (not e!109944))))

(assert (=> b!167414 e!109944))

(declare-fun b!167415 () Bool)

(assert (=> b!167415 (= e!109940 false)))

(declare-fun lt!83682 () Bool)

(declare-datatypes ((List!2130 0))(
  ( (Nil!2127) (Cons!2126 (h!2743 (_ BitVec 64)) (t!6932 List!2130)) )
))
(declare-fun arrayNoDuplicates!0 (array!6711 (_ BitVec 32) List!2130) Bool)

(assert (=> b!167415 (= lt!83682 (arrayNoDuplicates!0 (_keys!5281 thiss!1248) #b00000000000000000000000000000000 Nil!2127))))

(declare-fun b!167416 () Bool)

(declare-fun e!109945 () Bool)

(assert (=> b!167416 (= e!109945 tp_is_empty!3807)))

(declare-fun b!167417 () Bool)

(assert (=> b!167417 (= e!109947 e!109946)))

(declare-fun res!79625 () Bool)

(assert (=> b!167417 (=> (not res!79625) (not e!109946))))

(get-info :version)

(assert (=> b!167417 (= res!79625 (and (not ((_ is Undefined!479) lt!83679)) (not ((_ is MissingVacant!479) lt!83679)) (not ((_ is MissingZero!479) lt!83679)) ((_ is Found!479) lt!83679)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6711 (_ BitVec 32)) SeekEntryResult!479)

(assert (=> b!167417 (= lt!83679 (seekEntryOrOpen!0 key!828 (_keys!5281 thiss!1248) (mask!8203 thiss!1248)))))

(declare-fun b!167418 () Bool)

(declare-fun e!109941 () Bool)

(assert (=> b!167418 (= e!109941 tp_is_empty!3807)))

(declare-fun mapNonEmpty!6429 () Bool)

(declare-fun tp!14616 () Bool)

(assert (=> mapNonEmpty!6429 (= mapRes!6429 (and tp!14616 e!109945))))

(declare-fun mapValue!6429 () ValueCell!1560)

(declare-fun mapKey!6429 () (_ BitVec 32))

(declare-fun mapRest!6429 () (Array (_ BitVec 32) ValueCell!1560))

(assert (=> mapNonEmpty!6429 (= (arr!3192 (_values!3439 thiss!1248)) (store mapRest!6429 mapKey!6429 mapValue!6429))))

(declare-fun b!167419 () Bool)

(declare-fun res!79627 () Bool)

(assert (=> b!167419 (=> (not res!79627) (not e!109947))))

(assert (=> b!167419 (= res!79627 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167420 () Bool)

(assert (=> b!167420 (= e!109942 (and e!109941 mapRes!6429))))

(declare-fun condMapEmpty!6429 () Bool)

(declare-fun mapDefault!6429 () ValueCell!1560)

(assert (=> b!167420 (= condMapEmpty!6429 (= (arr!3192 (_values!3439 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1560)) mapDefault!6429)))))

(declare-fun b!167421 () Bool)

(declare-fun res!79628 () Bool)

(assert (=> b!167421 (=> (not res!79628) (not e!109940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6711 (_ BitVec 32)) Bool)

(assert (=> b!167421 (= res!79628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5281 thiss!1248) (mask!8203 thiss!1248)))))

(assert (= (and start!16700 res!79629) b!167419))

(assert (= (and b!167419 res!79627) b!167417))

(assert (= (and b!167417 res!79625) b!167413))

(assert (= (and b!167413 c!30289) b!167414))

(assert (= (and b!167413 (not c!30289)) b!167411))

(assert (= (and b!167414 res!79623) b!167409))

(assert (= (and b!167413 res!79624) b!167412))

(assert (= (and b!167412 res!79626) b!167421))

(assert (= (and b!167421 res!79628) b!167415))

(assert (= (and b!167420 condMapEmpty!6429) mapIsEmpty!6429))

(assert (= (and b!167420 (not condMapEmpty!6429)) mapNonEmpty!6429))

(assert (= (and mapNonEmpty!6429 ((_ is ValueCellFull!1560) mapValue!6429)) b!167416))

(assert (= (and b!167420 ((_ is ValueCellFull!1560) mapDefault!6429)) b!167418))

(assert (= b!167410 b!167420))

(assert (= start!16700 b!167410))

(declare-fun m!196579 () Bool)

(assert (=> b!167410 m!196579))

(declare-fun m!196581 () Bool)

(assert (=> b!167410 m!196581))

(declare-fun m!196583 () Bool)

(assert (=> b!167411 m!196583))

(declare-fun m!196585 () Bool)

(assert (=> b!167415 m!196585))

(declare-fun m!196587 () Bool)

(assert (=> b!167409 m!196587))

(declare-fun m!196589 () Bool)

(assert (=> b!167414 m!196589))

(declare-fun m!196591 () Bool)

(assert (=> b!167414 m!196591))

(declare-fun m!196593 () Bool)

(assert (=> start!16700 m!196593))

(declare-fun m!196595 () Bool)

(assert (=> b!167421 m!196595))

(declare-fun m!196597 () Bool)

(assert (=> b!167417 m!196597))

(declare-fun m!196599 () Bool)

(assert (=> mapNonEmpty!6429 m!196599))

(declare-fun m!196601 () Bool)

(assert (=> b!167413 m!196601))

(declare-fun m!196603 () Bool)

(assert (=> b!167413 m!196603))

(assert (=> b!167413 m!196603))

(declare-fun m!196605 () Bool)

(assert (=> b!167413 m!196605))

(check-sat (not b!167411) (not b!167421) (not b!167415) (not b!167413) tp_is_empty!3807 (not mapNonEmpty!6429) (not b!167417) (not b!167414) b_and!10419 (not b!167410) (not start!16700) (not b_next!4005))
(check-sat b_and!10419 (not b_next!4005))
