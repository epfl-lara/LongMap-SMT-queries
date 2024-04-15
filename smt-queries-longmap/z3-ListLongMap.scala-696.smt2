; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16684 () Bool)

(assert start!16684)

(declare-fun b!166883 () Bool)

(declare-fun b_free!3985 () Bool)

(declare-fun b_next!3985 () Bool)

(assert (=> b!166883 (= b_free!3985 (not b_next!3985))))

(declare-fun tp!14556 () Bool)

(declare-fun b_and!10373 () Bool)

(assert (=> b!166883 (= tp!14556 b_and!10373)))

(declare-fun b!166872 () Bool)

(declare-datatypes ((Unit!5069 0))(
  ( (Unit!5070) )
))
(declare-fun e!109542 () Unit!5069)

(declare-fun Unit!5071 () Unit!5069)

(assert (=> b!166872 (= e!109542 Unit!5071)))

(declare-fun lt!83349 () Unit!5069)

(declare-datatypes ((V!4697 0))(
  ( (V!4698 (val!1938 Int)) )
))
(declare-datatypes ((ValueCell!1550 0))(
  ( (ValueCellFull!1550 (v!3797 V!4697)) (EmptyCell!1550) )
))
(declare-datatypes ((array!6651 0))(
  ( (array!6652 (arr!3160 (Array (_ BitVec 32) (_ BitVec 64))) (size!3449 (_ BitVec 32))) )
))
(declare-datatypes ((array!6653 0))(
  ( (array!6654 (arr!3161 (Array (_ BitVec 32) ValueCell!1550)) (size!3450 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2008 0))(
  ( (LongMapFixedSize!2009 (defaultEntry!3446 Int) (mask!8186 (_ BitVec 32)) (extraKeys!3187 (_ BitVec 32)) (zeroValue!3289 V!4697) (minValue!3289 V!4697) (_size!1053 (_ BitVec 32)) (_keys!5270 array!6651) (_values!3429 array!6653) (_vacant!1053 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2008)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!93 (array!6651 array!6653 (_ BitVec 32) (_ BitVec 32) V!4697 V!4697 (_ BitVec 64) Int) Unit!5069)

(assert (=> b!166872 (= lt!83349 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!93 (_keys!5270 thiss!1248) (_values!3429 thiss!1248) (mask!8186 thiss!1248) (extraKeys!3187 thiss!1248) (zeroValue!3289 thiss!1248) (minValue!3289 thiss!1248) key!828 (defaultEntry!3446 thiss!1248)))))

(assert (=> b!166872 false))

(declare-fun b!166873 () Bool)

(declare-datatypes ((SeekEntryResult!478 0))(
  ( (MissingZero!478 (index!4080 (_ BitVec 32))) (Found!478 (index!4081 (_ BitVec 32))) (Intermediate!478 (undefined!1290 Bool) (index!4082 (_ BitVec 32)) (x!18497 (_ BitVec 32))) (Undefined!478) (MissingVacant!478 (index!4083 (_ BitVec 32))) )
))
(declare-fun lt!83350 () SeekEntryResult!478)

(declare-fun e!109544 () Bool)

(assert (=> b!166873 (= e!109544 (= (select (arr!3160 (_keys!5270 thiss!1248)) (index!4081 lt!83350)) key!828))))

(declare-fun res!79322 () Bool)

(declare-fun e!109548 () Bool)

(assert (=> start!16684 (=> (not res!79322) (not e!109548))))

(declare-fun valid!886 (LongMapFixedSize!2008) Bool)

(assert (=> start!16684 (= res!79322 (valid!886 thiss!1248))))

(assert (=> start!16684 e!109548))

(declare-fun e!109546 () Bool)

(assert (=> start!16684 e!109546))

(assert (=> start!16684 true))

(declare-fun b!166874 () Bool)

(declare-fun e!109547 () Bool)

(declare-fun tp_is_empty!3787 () Bool)

(assert (=> b!166874 (= e!109547 tp_is_empty!3787)))

(declare-fun b!166875 () Bool)

(declare-fun e!109545 () Bool)

(declare-fun mapRes!6399 () Bool)

(assert (=> b!166875 (= e!109545 (and e!109547 mapRes!6399))))

(declare-fun condMapEmpty!6399 () Bool)

(declare-fun mapDefault!6399 () ValueCell!1550)

(assert (=> b!166875 (= condMapEmpty!6399 (= (arr!3161 (_values!3429 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1550)) mapDefault!6399)))))

(declare-fun b!166876 () Bool)

(declare-fun res!79319 () Bool)

(assert (=> b!166876 (=> (not res!79319) (not e!109548))))

(assert (=> b!166876 (= res!79319 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166877 () Bool)

(declare-fun e!109540 () Bool)

(assert (=> b!166877 (= e!109548 e!109540)))

(declare-fun res!79323 () Bool)

(assert (=> b!166877 (=> (not res!79323) (not e!109540))))

(get-info :version)

(assert (=> b!166877 (= res!79323 (and (not ((_ is Undefined!478) lt!83350)) (not ((_ is MissingVacant!478) lt!83350)) (not ((_ is MissingZero!478) lt!83350)) ((_ is Found!478) lt!83350)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6651 (_ BitVec 32)) SeekEntryResult!478)

(assert (=> b!166877 (= lt!83350 (seekEntryOrOpen!0 key!828 (_keys!5270 thiss!1248) (mask!8186 thiss!1248)))))

(declare-fun b!166878 () Bool)

(declare-fun lt!83351 () Unit!5069)

(assert (=> b!166878 (= e!109542 lt!83351)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!94 (array!6651 array!6653 (_ BitVec 32) (_ BitVec 32) V!4697 V!4697 (_ BitVec 64) Int) Unit!5069)

(assert (=> b!166878 (= lt!83351 (lemmaInListMapThenSeekEntryOrOpenFindsIt!94 (_keys!5270 thiss!1248) (_values!3429 thiss!1248) (mask!8186 thiss!1248) (extraKeys!3187 thiss!1248) (zeroValue!3289 thiss!1248) (minValue!3289 thiss!1248) key!828 (defaultEntry!3446 thiss!1248)))))

(declare-fun res!79318 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166878 (= res!79318 (inRange!0 (index!4081 lt!83350) (mask!8186 thiss!1248)))))

(assert (=> b!166878 (=> (not res!79318) (not e!109544))))

(assert (=> b!166878 e!109544))

(declare-fun b!166879 () Bool)

(declare-fun res!79320 () Bool)

(declare-fun e!109539 () Bool)

(assert (=> b!166879 (=> (not res!79320) (not e!109539))))

(assert (=> b!166879 (= res!79320 (and (= (size!3450 (_values!3429 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8186 thiss!1248))) (= (size!3449 (_keys!5270 thiss!1248)) (size!3450 (_values!3429 thiss!1248))) (bvsge (mask!8186 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3187 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3187 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6399 () Bool)

(assert (=> mapIsEmpty!6399 mapRes!6399))

(declare-fun b!166880 () Bool)

(declare-fun res!79321 () Bool)

(assert (=> b!166880 (=> (not res!79321) (not e!109539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6651 (_ BitVec 32)) Bool)

(assert (=> b!166880 (= res!79321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5270 thiss!1248) (mask!8186 thiss!1248)))))

(declare-fun b!166881 () Bool)

(assert (=> b!166881 (= e!109540 e!109539)))

(declare-fun res!79324 () Bool)

(assert (=> b!166881 (=> (not res!79324) (not e!109539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166881 (= res!79324 (validMask!0 (mask!8186 thiss!1248)))))

(declare-fun lt!83348 () Unit!5069)

(assert (=> b!166881 (= lt!83348 e!109542)))

(declare-fun c!30233 () Bool)

(declare-datatypes ((tuple2!3110 0))(
  ( (tuple2!3111 (_1!1566 (_ BitVec 64)) (_2!1566 V!4697)) )
))
(declare-datatypes ((List!2115 0))(
  ( (Nil!2112) (Cons!2111 (h!2728 tuple2!3110) (t!6908 List!2115)) )
))
(declare-datatypes ((ListLongMap!2053 0))(
  ( (ListLongMap!2054 (toList!1042 List!2115)) )
))
(declare-fun contains!1087 (ListLongMap!2053 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!684 (array!6651 array!6653 (_ BitVec 32) (_ BitVec 32) V!4697 V!4697 (_ BitVec 32) Int) ListLongMap!2053)

(assert (=> b!166881 (= c!30233 (contains!1087 (getCurrentListMap!684 (_keys!5270 thiss!1248) (_values!3429 thiss!1248) (mask!8186 thiss!1248) (extraKeys!3187 thiss!1248) (zeroValue!3289 thiss!1248) (minValue!3289 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3446 thiss!1248)) key!828))))

(declare-fun b!166882 () Bool)

(declare-fun e!109543 () Bool)

(assert (=> b!166882 (= e!109543 tp_is_empty!3787)))

(declare-fun array_inv!2035 (array!6651) Bool)

(declare-fun array_inv!2036 (array!6653) Bool)

(assert (=> b!166883 (= e!109546 (and tp!14556 tp_is_empty!3787 (array_inv!2035 (_keys!5270 thiss!1248)) (array_inv!2036 (_values!3429 thiss!1248)) e!109545))))

(declare-fun b!166884 () Bool)

(assert (=> b!166884 (= e!109539 false)))

(declare-fun lt!83352 () Bool)

(declare-datatypes ((List!2116 0))(
  ( (Nil!2113) (Cons!2112 (h!2729 (_ BitVec 64)) (t!6909 List!2116)) )
))
(declare-fun arrayNoDuplicates!0 (array!6651 (_ BitVec 32) List!2116) Bool)

(assert (=> b!166884 (= lt!83352 (arrayNoDuplicates!0 (_keys!5270 thiss!1248) #b00000000000000000000000000000000 Nil!2113))))

(declare-fun mapNonEmpty!6399 () Bool)

(declare-fun tp!14555 () Bool)

(assert (=> mapNonEmpty!6399 (= mapRes!6399 (and tp!14555 e!109543))))

(declare-fun mapRest!6399 () (Array (_ BitVec 32) ValueCell!1550))

(declare-fun mapKey!6399 () (_ BitVec 32))

(declare-fun mapValue!6399 () ValueCell!1550)

(assert (=> mapNonEmpty!6399 (= (arr!3161 (_values!3429 thiss!1248)) (store mapRest!6399 mapKey!6399 mapValue!6399))))

(assert (= (and start!16684 res!79322) b!166876))

(assert (= (and b!166876 res!79319) b!166877))

(assert (= (and b!166877 res!79323) b!166881))

(assert (= (and b!166881 c!30233) b!166878))

(assert (= (and b!166881 (not c!30233)) b!166872))

(assert (= (and b!166878 res!79318) b!166873))

(assert (= (and b!166881 res!79324) b!166879))

(assert (= (and b!166879 res!79320) b!166880))

(assert (= (and b!166880 res!79321) b!166884))

(assert (= (and b!166875 condMapEmpty!6399) mapIsEmpty!6399))

(assert (= (and b!166875 (not condMapEmpty!6399)) mapNonEmpty!6399))

(assert (= (and mapNonEmpty!6399 ((_ is ValueCellFull!1550) mapValue!6399)) b!166882))

(assert (= (and b!166875 ((_ is ValueCellFull!1550) mapDefault!6399)) b!166874))

(assert (= b!166883 b!166875))

(assert (= start!16684 b!166883))

(declare-fun m!195679 () Bool)

(assert (=> b!166884 m!195679))

(declare-fun m!195681 () Bool)

(assert (=> b!166873 m!195681))

(declare-fun m!195683 () Bool)

(assert (=> b!166877 m!195683))

(declare-fun m!195685 () Bool)

(assert (=> b!166881 m!195685))

(declare-fun m!195687 () Bool)

(assert (=> b!166881 m!195687))

(assert (=> b!166881 m!195687))

(declare-fun m!195689 () Bool)

(assert (=> b!166881 m!195689))

(declare-fun m!195691 () Bool)

(assert (=> b!166878 m!195691))

(declare-fun m!195693 () Bool)

(assert (=> b!166878 m!195693))

(declare-fun m!195695 () Bool)

(assert (=> b!166883 m!195695))

(declare-fun m!195697 () Bool)

(assert (=> b!166883 m!195697))

(declare-fun m!195699 () Bool)

(assert (=> mapNonEmpty!6399 m!195699))

(declare-fun m!195701 () Bool)

(assert (=> start!16684 m!195701))

(declare-fun m!195703 () Bool)

(assert (=> b!166880 m!195703))

(declare-fun m!195705 () Bool)

(assert (=> b!166872 m!195705))

(check-sat (not start!16684) (not mapNonEmpty!6399) (not b!166878) (not b!166881) (not b!166877) (not b_next!3985) (not b!166872) (not b!166880) (not b!166884) (not b!166883) tp_is_empty!3787 b_and!10373)
(check-sat b_and!10373 (not b_next!3985))
