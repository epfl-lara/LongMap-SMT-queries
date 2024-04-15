; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22034 () Bool)

(assert start!22034)

(declare-fun b!227136 () Bool)

(declare-fun b_free!6097 () Bool)

(declare-fun b_next!6097 () Bool)

(assert (=> b!227136 (= b_free!6097 (not b_next!6097))))

(declare-fun tp!21432 () Bool)

(declare-fun b_and!12969 () Bool)

(assert (=> b!227136 (= tp!21432 b_and!12969)))

(declare-fun b!227115 () Bool)

(declare-fun e!147335 () Bool)

(declare-fun e!147347 () Bool)

(assert (=> b!227115 (= e!147335 e!147347)))

(declare-fun res!111787 () Bool)

(assert (=> b!227115 (=> (not res!111787) (not e!147347))))

(declare-datatypes ((SeekEntryResult!892 0))(
  ( (MissingZero!892 (index!5738 (_ BitVec 32))) (Found!892 (index!5739 (_ BitVec 32))) (Intermediate!892 (undefined!1704 Bool) (index!5740 (_ BitVec 32)) (x!23271 (_ BitVec 32))) (Undefined!892) (MissingVacant!892 (index!5741 (_ BitVec 32))) )
))
(declare-fun lt!114188 () SeekEntryResult!892)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!227115 (= res!111787 (or (= lt!114188 (MissingZero!892 index!297)) (= lt!114188 (MissingVacant!892 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7593 0))(
  ( (V!7594 (val!3024 Int)) )
))
(declare-datatypes ((ValueCell!2636 0))(
  ( (ValueCellFull!2636 (v!5038 V!7593)) (EmptyCell!2636) )
))
(declare-datatypes ((array!11153 0))(
  ( (array!11154 (arr!5295 (Array (_ BitVec 32) ValueCell!2636)) (size!5629 (_ BitVec 32))) )
))
(declare-datatypes ((array!11155 0))(
  ( (array!11156 (arr!5296 (Array (_ BitVec 32) (_ BitVec 64))) (size!5630 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3172 0))(
  ( (LongMapFixedSize!3173 (defaultEntry!4245 Int) (mask!10104 (_ BitVec 32)) (extraKeys!3982 (_ BitVec 32)) (zeroValue!4086 V!7593) (minValue!4086 V!7593) (_size!1635 (_ BitVec 32)) (_keys!6298 array!11155) (_values!4228 array!11153) (_vacant!1635 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3172)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11155 (_ BitVec 32)) SeekEntryResult!892)

(assert (=> b!227115 (= lt!114188 (seekEntryOrOpen!0 key!932 (_keys!6298 thiss!1504) (mask!10104 thiss!1504)))))

(declare-fun bm!21098 () Bool)

(declare-fun call!21102 () Bool)

(declare-fun arrayContainsKey!0 (array!11155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21098 (= call!21102 (arrayContainsKey!0 (_keys!6298 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227116 () Bool)

(declare-fun e!147348 () Bool)

(assert (=> b!227116 (= e!147348 (not call!21102))))

(declare-fun b!227117 () Bool)

(declare-fun e!147341 () Bool)

(declare-fun e!147340 () Bool)

(declare-fun mapRes!10108 () Bool)

(assert (=> b!227117 (= e!147341 (and e!147340 mapRes!10108))))

(declare-fun condMapEmpty!10108 () Bool)

(declare-fun mapDefault!10108 () ValueCell!2636)

(assert (=> b!227117 (= condMapEmpty!10108 (= (arr!5295 (_values!4228 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2636)) mapDefault!10108)))))

(declare-fun b!227118 () Bool)

(declare-fun e!147336 () Bool)

(assert (=> b!227118 (= e!147336 true)))

(declare-fun lt!114187 () Bool)

(declare-datatypes ((List!3378 0))(
  ( (Nil!3375) (Cons!3374 (h!4022 (_ BitVec 64)) (t!8328 List!3378)) )
))
(declare-fun arrayNoDuplicates!0 (array!11155 (_ BitVec 32) List!3378) Bool)

(assert (=> b!227118 (= lt!114187 (arrayNoDuplicates!0 (_keys!6298 thiss!1504) #b00000000000000000000000000000000 Nil!3375))))

(declare-fun b!227119 () Bool)

(declare-fun tp_is_empty!5959 () Bool)

(assert (=> b!227119 (= e!147340 tp_is_empty!5959)))

(declare-fun res!111788 () Bool)

(assert (=> start!22034 (=> (not res!111788) (not e!147335))))

(declare-fun valid!1285 (LongMapFixedSize!3172) Bool)

(assert (=> start!22034 (= res!111788 (valid!1285 thiss!1504))))

(assert (=> start!22034 e!147335))

(declare-fun e!147334 () Bool)

(assert (=> start!22034 e!147334))

(assert (=> start!22034 true))

(declare-fun b!227120 () Bool)

(declare-fun res!111789 () Bool)

(assert (=> b!227120 (=> (not res!111789) (not e!147335))))

(assert (=> b!227120 (= res!111789 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227121 () Bool)

(declare-fun c!37653 () Bool)

(get-info :version)

(assert (=> b!227121 (= c!37653 ((_ is MissingVacant!892) lt!114188))))

(declare-fun e!147343 () Bool)

(declare-fun e!147346 () Bool)

(assert (=> b!227121 (= e!147343 e!147346)))

(declare-fun b!227122 () Bool)

(declare-datatypes ((Unit!6849 0))(
  ( (Unit!6850) )
))
(declare-fun e!147344 () Unit!6849)

(declare-fun Unit!6851 () Unit!6849)

(assert (=> b!227122 (= e!147344 Unit!6851)))

(declare-fun lt!114185 () Unit!6849)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!262 (array!11155 array!11153 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 64) Int) Unit!6849)

(assert (=> b!227122 (= lt!114185 (lemmaInListMapThenSeekEntryOrOpenFindsIt!262 (_keys!6298 thiss!1504) (_values!4228 thiss!1504) (mask!10104 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) key!932 (defaultEntry!4245 thiss!1504)))))

(assert (=> b!227122 false))

(declare-fun b!227123 () Bool)

(declare-fun e!147337 () Unit!6849)

(declare-fun Unit!6852 () Unit!6849)

(assert (=> b!227123 (= e!147337 Unit!6852)))

(declare-fun lt!114184 () Unit!6849)

(declare-fun lemmaArrayContainsKeyThenInListMap!101 (array!11155 array!11153 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 64) (_ BitVec 32) Int) Unit!6849)

(assert (=> b!227123 (= lt!114184 (lemmaArrayContainsKeyThenInListMap!101 (_keys!6298 thiss!1504) (_values!4228 thiss!1504) (mask!10104 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4245 thiss!1504)))))

(assert (=> b!227123 false))

(declare-fun b!227124 () Bool)

(declare-fun e!147342 () Bool)

(assert (=> b!227124 (= e!147347 e!147342)))

(declare-fun res!111790 () Bool)

(assert (=> b!227124 (=> (not res!111790) (not e!147342))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227124 (= res!111790 (inRange!0 index!297 (mask!10104 thiss!1504)))))

(declare-fun lt!114189 () Unit!6849)

(assert (=> b!227124 (= lt!114189 e!147344)))

(declare-fun c!37654 () Bool)

(declare-datatypes ((tuple2!4448 0))(
  ( (tuple2!4449 (_1!2235 (_ BitVec 64)) (_2!2235 V!7593)) )
))
(declare-datatypes ((List!3379 0))(
  ( (Nil!3376) (Cons!3375 (h!4023 tuple2!4448) (t!8329 List!3379)) )
))
(declare-datatypes ((ListLongMap!3351 0))(
  ( (ListLongMap!3352 (toList!1691 List!3379)) )
))
(declare-fun contains!1566 (ListLongMap!3351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1200 (array!11155 array!11153 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 32) Int) ListLongMap!3351)

(assert (=> b!227124 (= c!37654 (contains!1566 (getCurrentListMap!1200 (_keys!6298 thiss!1504) (_values!4228 thiss!1504) (mask!10104 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4245 thiss!1504)) key!932))))

(declare-fun b!227125 () Bool)

(declare-fun res!111783 () Bool)

(declare-fun e!147339 () Bool)

(assert (=> b!227125 (=> (not res!111783) (not e!147339))))

(assert (=> b!227125 (= res!111783 (= (select (arr!5296 (_keys!6298 thiss!1504)) (index!5738 lt!114188)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!37651 () Bool)

(declare-fun bm!21099 () Bool)

(declare-fun call!21101 () Bool)

(assert (=> bm!21099 (= call!21101 (inRange!0 (ite c!37651 (index!5738 lt!114188) (index!5741 lt!114188)) (mask!10104 thiss!1504)))))

(declare-fun b!227126 () Bool)

(assert (=> b!227126 (= e!147346 e!147348)))

(declare-fun res!111786 () Bool)

(assert (=> b!227126 (= res!111786 call!21101)))

(assert (=> b!227126 (=> (not res!111786) (not e!147348))))

(declare-fun mapIsEmpty!10108 () Bool)

(assert (=> mapIsEmpty!10108 mapRes!10108))

(declare-fun b!227127 () Bool)

(declare-fun lt!114190 () Unit!6849)

(assert (=> b!227127 (= e!147344 lt!114190)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!258 (array!11155 array!11153 (_ BitVec 32) (_ BitVec 32) V!7593 V!7593 (_ BitVec 64) Int) Unit!6849)

(assert (=> b!227127 (= lt!114190 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!258 (_keys!6298 thiss!1504) (_values!4228 thiss!1504) (mask!10104 thiss!1504) (extraKeys!3982 thiss!1504) (zeroValue!4086 thiss!1504) (minValue!4086 thiss!1504) key!932 (defaultEntry!4245 thiss!1504)))))

(assert (=> b!227127 (= c!37651 ((_ is MissingZero!892) lt!114188))))

(assert (=> b!227127 e!147343))

(declare-fun b!227128 () Bool)

(assert (=> b!227128 (= e!147346 ((_ is Undefined!892) lt!114188))))

(declare-fun b!227129 () Bool)

(assert (=> b!227129 (= e!147339 (not call!21102))))

(declare-fun mapNonEmpty!10108 () Bool)

(declare-fun tp!21433 () Bool)

(declare-fun e!147345 () Bool)

(assert (=> mapNonEmpty!10108 (= mapRes!10108 (and tp!21433 e!147345))))

(declare-fun mapRest!10108 () (Array (_ BitVec 32) ValueCell!2636))

(declare-fun mapValue!10108 () ValueCell!2636)

(declare-fun mapKey!10108 () (_ BitVec 32))

(assert (=> mapNonEmpty!10108 (= (arr!5295 (_values!4228 thiss!1504)) (store mapRest!10108 mapKey!10108 mapValue!10108))))

(declare-fun b!227130 () Bool)

(declare-fun res!111791 () Bool)

(assert (=> b!227130 (=> res!111791 e!147336)))

(assert (=> b!227130 (= res!111791 (or (not (= (size!5629 (_values!4228 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10104 thiss!1504)))) (not (= (size!5630 (_keys!6298 thiss!1504)) (size!5629 (_values!4228 thiss!1504)))) (bvslt (mask!10104 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3982 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3982 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227131 () Bool)

(declare-fun res!111785 () Bool)

(assert (=> b!227131 (=> res!111785 e!147336)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11155 (_ BitVec 32)) Bool)

(assert (=> b!227131 (= res!111785 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6298 thiss!1504) (mask!10104 thiss!1504))))))

(declare-fun b!227132 () Bool)

(declare-fun res!111781 () Bool)

(assert (=> b!227132 (= res!111781 (= (select (arr!5296 (_keys!6298 thiss!1504)) (index!5741 lt!114188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227132 (=> (not res!111781) (not e!147348))))

(declare-fun b!227133 () Bool)

(assert (=> b!227133 (= e!147342 (not e!147336))))

(declare-fun res!111784 () Bool)

(assert (=> b!227133 (=> res!111784 e!147336)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227133 (= res!111784 (not (validMask!0 (mask!10104 thiss!1504))))))

(declare-fun lt!114192 () array!11155)

(assert (=> b!227133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114192 (mask!10104 thiss!1504))))

(declare-fun lt!114183 () Unit!6849)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11155 (_ BitVec 32) (_ BitVec 32)) Unit!6849)

(assert (=> b!227133 (= lt!114183 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6298 thiss!1504) index!297 (mask!10104 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11155 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227133 (= (arrayCountValidKeys!0 lt!114192 #b00000000000000000000000000000000 (size!5630 (_keys!6298 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6298 thiss!1504) #b00000000000000000000000000000000 (size!5630 (_keys!6298 thiss!1504)))))))

(declare-fun lt!114186 () Unit!6849)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11155 (_ BitVec 32) (_ BitVec 64)) Unit!6849)

(assert (=> b!227133 (= lt!114186 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6298 thiss!1504) index!297 key!932))))

(assert (=> b!227133 (arrayNoDuplicates!0 lt!114192 #b00000000000000000000000000000000 Nil!3375)))

(assert (=> b!227133 (= lt!114192 (array!11156 (store (arr!5296 (_keys!6298 thiss!1504)) index!297 key!932) (size!5630 (_keys!6298 thiss!1504))))))

(declare-fun lt!114193 () Unit!6849)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3378) Unit!6849)

(assert (=> b!227133 (= lt!114193 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6298 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3375))))

(declare-fun lt!114191 () Unit!6849)

(assert (=> b!227133 (= lt!114191 e!147337)))

(declare-fun c!37652 () Bool)

(assert (=> b!227133 (= c!37652 (arrayContainsKey!0 (_keys!6298 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227134 () Bool)

(declare-fun Unit!6853 () Unit!6849)

(assert (=> b!227134 (= e!147337 Unit!6853)))

(declare-fun b!227135 () Bool)

(declare-fun res!111782 () Bool)

(assert (=> b!227135 (=> (not res!111782) (not e!147339))))

(assert (=> b!227135 (= res!111782 call!21101)))

(assert (=> b!227135 (= e!147343 e!147339)))

(declare-fun array_inv!3495 (array!11155) Bool)

(declare-fun array_inv!3496 (array!11153) Bool)

(assert (=> b!227136 (= e!147334 (and tp!21432 tp_is_empty!5959 (array_inv!3495 (_keys!6298 thiss!1504)) (array_inv!3496 (_values!4228 thiss!1504)) e!147341))))

(declare-fun b!227137 () Bool)

(assert (=> b!227137 (= e!147345 tp_is_empty!5959)))

(assert (= (and start!22034 res!111788) b!227120))

(assert (= (and b!227120 res!111789) b!227115))

(assert (= (and b!227115 res!111787) b!227124))

(assert (= (and b!227124 c!37654) b!227122))

(assert (= (and b!227124 (not c!37654)) b!227127))

(assert (= (and b!227127 c!37651) b!227135))

(assert (= (and b!227127 (not c!37651)) b!227121))

(assert (= (and b!227135 res!111782) b!227125))

(assert (= (and b!227125 res!111783) b!227129))

(assert (= (and b!227121 c!37653) b!227126))

(assert (= (and b!227121 (not c!37653)) b!227128))

(assert (= (and b!227126 res!111786) b!227132))

(assert (= (and b!227132 res!111781) b!227116))

(assert (= (or b!227135 b!227126) bm!21099))

(assert (= (or b!227129 b!227116) bm!21098))

(assert (= (and b!227124 res!111790) b!227133))

(assert (= (and b!227133 c!37652) b!227123))

(assert (= (and b!227133 (not c!37652)) b!227134))

(assert (= (and b!227133 (not res!111784)) b!227130))

(assert (= (and b!227130 (not res!111791)) b!227131))

(assert (= (and b!227131 (not res!111785)) b!227118))

(assert (= (and b!227117 condMapEmpty!10108) mapIsEmpty!10108))

(assert (= (and b!227117 (not condMapEmpty!10108)) mapNonEmpty!10108))

(assert (= (and mapNonEmpty!10108 ((_ is ValueCellFull!2636) mapValue!10108)) b!227137))

(assert (= (and b!227117 ((_ is ValueCellFull!2636) mapDefault!10108)) b!227119))

(assert (= b!227136 b!227117))

(assert (= start!22034 b!227136))

(declare-fun m!248695 () Bool)

(assert (=> mapNonEmpty!10108 m!248695))

(declare-fun m!248697 () Bool)

(assert (=> b!227115 m!248697))

(declare-fun m!248699 () Bool)

(assert (=> b!227133 m!248699))

(declare-fun m!248701 () Bool)

(assert (=> b!227133 m!248701))

(declare-fun m!248703 () Bool)

(assert (=> b!227133 m!248703))

(declare-fun m!248705 () Bool)

(assert (=> b!227133 m!248705))

(declare-fun m!248707 () Bool)

(assert (=> b!227133 m!248707))

(declare-fun m!248709 () Bool)

(assert (=> b!227133 m!248709))

(declare-fun m!248711 () Bool)

(assert (=> b!227133 m!248711))

(declare-fun m!248713 () Bool)

(assert (=> b!227133 m!248713))

(declare-fun m!248715 () Bool)

(assert (=> b!227133 m!248715))

(declare-fun m!248717 () Bool)

(assert (=> b!227133 m!248717))

(declare-fun m!248719 () Bool)

(assert (=> b!227136 m!248719))

(declare-fun m!248721 () Bool)

(assert (=> b!227136 m!248721))

(declare-fun m!248723 () Bool)

(assert (=> b!227125 m!248723))

(declare-fun m!248725 () Bool)

(assert (=> b!227123 m!248725))

(declare-fun m!248727 () Bool)

(assert (=> b!227127 m!248727))

(declare-fun m!248729 () Bool)

(assert (=> b!227131 m!248729))

(declare-fun m!248731 () Bool)

(assert (=> b!227118 m!248731))

(assert (=> bm!21098 m!248701))

(declare-fun m!248733 () Bool)

(assert (=> b!227124 m!248733))

(declare-fun m!248735 () Bool)

(assert (=> b!227124 m!248735))

(assert (=> b!227124 m!248735))

(declare-fun m!248737 () Bool)

(assert (=> b!227124 m!248737))

(declare-fun m!248739 () Bool)

(assert (=> b!227122 m!248739))

(declare-fun m!248741 () Bool)

(assert (=> start!22034 m!248741))

(declare-fun m!248743 () Bool)

(assert (=> b!227132 m!248743))

(declare-fun m!248745 () Bool)

(assert (=> bm!21099 m!248745))

(check-sat (not b_next!6097) (not b!227122) (not b!227124) (not b!227131) (not b!227115) (not start!22034) (not b!227136) (not b!227123) (not mapNonEmpty!10108) (not b!227127) (not bm!21098) tp_is_empty!5959 b_and!12969 (not b!227133) (not bm!21099) (not b!227118))
(check-sat b_and!12969 (not b_next!6097))
