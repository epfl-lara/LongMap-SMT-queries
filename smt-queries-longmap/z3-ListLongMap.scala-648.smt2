; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16240 () Bool)

(assert start!16240)

(declare-fun b!162024 () Bool)

(declare-fun b_free!3697 () Bool)

(declare-fun b_next!3697 () Bool)

(assert (=> b!162024 (= b_free!3697 (not b_next!3697))))

(declare-fun tp!13661 () Bool)

(declare-fun b_and!10125 () Bool)

(assert (=> b!162024 (= tp!13661 b_and!10125)))

(declare-fun mapNonEmpty!5936 () Bool)

(declare-fun mapRes!5936 () Bool)

(declare-fun tp!13660 () Bool)

(declare-fun e!106023 () Bool)

(assert (=> mapNonEmpty!5936 (= mapRes!5936 (and tp!13660 e!106023))))

(declare-datatypes ((V!4313 0))(
  ( (V!4314 (val!1794 Int)) )
))
(declare-datatypes ((ValueCell!1406 0))(
  ( (ValueCellFull!1406 (v!3660 V!4313)) (EmptyCell!1406) )
))
(declare-fun mapRest!5936 () (Array (_ BitVec 32) ValueCell!1406))

(declare-fun mapKey!5936 () (_ BitVec 32))

(declare-fun mapValue!5936 () ValueCell!1406)

(declare-datatypes ((array!6063 0))(
  ( (array!6064 (arr!2876 (Array (_ BitVec 32) (_ BitVec 64))) (size!3160 (_ BitVec 32))) )
))
(declare-datatypes ((array!6065 0))(
  ( (array!6066 (arr!2877 (Array (_ BitVec 32) ValueCell!1406)) (size!3161 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1720 0))(
  ( (LongMapFixedSize!1721 (defaultEntry!3302 Int) (mask!7910 (_ BitVec 32)) (extraKeys!3043 (_ BitVec 32)) (zeroValue!3145 V!4313) (minValue!3145 V!4313) (_size!909 (_ BitVec 32)) (_keys!5103 array!6063) (_values!3285 array!6065) (_vacant!909 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1720)

(assert (=> mapNonEmpty!5936 (= (arr!2877 (_values!3285 thiss!1248)) (store mapRest!5936 mapKey!5936 mapValue!5936))))

(declare-fun res!76754 () Bool)

(declare-fun e!106021 () Bool)

(assert (=> start!16240 (=> (not res!76754) (not e!106021))))

(declare-fun valid!802 (LongMapFixedSize!1720) Bool)

(assert (=> start!16240 (= res!76754 (valid!802 thiss!1248))))

(assert (=> start!16240 e!106021))

(declare-fun e!106024 () Bool)

(assert (=> start!16240 e!106024))

(assert (=> start!16240 true))

(declare-fun tp_is_empty!3499 () Bool)

(assert (=> start!16240 tp_is_empty!3499))

(declare-fun b!162019 () Bool)

(declare-fun e!106022 () Bool)

(assert (=> b!162019 (= e!106021 e!106022)))

(declare-fun res!76753 () Bool)

(assert (=> b!162019 (=> (not res!76753) (not e!106022))))

(declare-datatypes ((SeekEntryResult!364 0))(
  ( (MissingZero!364 (index!3624 (_ BitVec 32))) (Found!364 (index!3625 (_ BitVec 32))) (Intermediate!364 (undefined!1176 Bool) (index!3626 (_ BitVec 32)) (x!17892 (_ BitVec 32))) (Undefined!364) (MissingVacant!364 (index!3627 (_ BitVec 32))) )
))
(declare-fun lt!82394 () SeekEntryResult!364)

(get-info :version)

(assert (=> b!162019 (= res!76753 (and (not ((_ is Undefined!364) lt!82394)) ((_ is MissingVacant!364) lt!82394)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6063 (_ BitVec 32)) SeekEntryResult!364)

(assert (=> b!162019 (= lt!82394 (seekEntryOrOpen!0 key!828 (_keys!5103 thiss!1248) (mask!7910 thiss!1248)))))

(declare-fun b!162020 () Bool)

(declare-fun e!106020 () Bool)

(assert (=> b!162020 (= e!106020 false)))

(declare-fun lt!82395 () Bool)

(declare-datatypes ((tuple2!2934 0))(
  ( (tuple2!2935 (_1!1478 Bool) (_2!1478 LongMapFixedSize!1720)) )
))
(declare-fun lt!82393 () tuple2!2934)

(declare-datatypes ((tuple2!2936 0))(
  ( (tuple2!2937 (_1!1479 (_ BitVec 64)) (_2!1479 V!4313)) )
))
(declare-datatypes ((List!1979 0))(
  ( (Nil!1976) (Cons!1975 (h!2588 tuple2!2936) (t!6773 List!1979)) )
))
(declare-datatypes ((ListLongMap!1925 0))(
  ( (ListLongMap!1926 (toList!978 List!1979)) )
))
(declare-fun contains!1024 (ListLongMap!1925 (_ BitVec 64)) Bool)

(declare-fun map!1666 (LongMapFixedSize!1720) ListLongMap!1925)

(assert (=> b!162020 (= lt!82395 (contains!1024 (map!1666 (_2!1478 lt!82393)) key!828))))

(declare-fun mapIsEmpty!5936 () Bool)

(assert (=> mapIsEmpty!5936 mapRes!5936))

(declare-fun b!162021 () Bool)

(declare-fun e!106019 () Bool)

(assert (=> b!162021 (= e!106019 tp_is_empty!3499)))

(declare-fun b!162022 () Bool)

(declare-fun e!106026 () Bool)

(assert (=> b!162022 (= e!106026 (and e!106019 mapRes!5936))))

(declare-fun condMapEmpty!5936 () Bool)

(declare-fun mapDefault!5936 () ValueCell!1406)

(assert (=> b!162022 (= condMapEmpty!5936 (= (arr!2877 (_values!3285 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1406)) mapDefault!5936)))))

(declare-fun b!162023 () Bool)

(declare-fun res!76756 () Bool)

(assert (=> b!162023 (=> (not res!76756) (not e!106021))))

(assert (=> b!162023 (= res!76756 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!1843 (array!6063) Bool)

(declare-fun array_inv!1844 (array!6065) Bool)

(assert (=> b!162024 (= e!106024 (and tp!13661 tp_is_empty!3499 (array_inv!1843 (_keys!5103 thiss!1248)) (array_inv!1844 (_values!3285 thiss!1248)) e!106026))))

(declare-fun b!162025 () Bool)

(assert (=> b!162025 (= e!106023 tp_is_empty!3499)))

(declare-fun b!162026 () Bool)

(declare-fun res!76757 () Bool)

(assert (=> b!162026 (=> (not res!76757) (not e!106020))))

(assert (=> b!162026 (= res!76757 (_1!1478 lt!82393))))

(declare-fun b!162027 () Bool)

(assert (=> b!162027 (= e!106022 e!106020)))

(declare-fun res!76755 () Bool)

(assert (=> b!162027 (=> (not res!76755) (not e!106020))))

(assert (=> b!162027 (= res!76755 (valid!802 (_2!1478 lt!82393)))))

(declare-fun v!309 () V!4313)

(declare-fun updateHelperNewKey!76 (LongMapFixedSize!1720 (_ BitVec 64) V!4313 (_ BitVec 32)) tuple2!2934)

(assert (=> b!162027 (= lt!82393 (updateHelperNewKey!76 thiss!1248 key!828 v!309 (index!3627 lt!82394)))))

(assert (= (and start!16240 res!76754) b!162023))

(assert (= (and b!162023 res!76756) b!162019))

(assert (= (and b!162019 res!76753) b!162027))

(assert (= (and b!162027 res!76755) b!162026))

(assert (= (and b!162026 res!76757) b!162020))

(assert (= (and b!162022 condMapEmpty!5936) mapIsEmpty!5936))

(assert (= (and b!162022 (not condMapEmpty!5936)) mapNonEmpty!5936))

(assert (= (and mapNonEmpty!5936 ((_ is ValueCellFull!1406) mapValue!5936)) b!162025))

(assert (= (and b!162022 ((_ is ValueCellFull!1406) mapDefault!5936)) b!162021))

(assert (= b!162024 b!162022))

(assert (= start!16240 b!162024))

(declare-fun m!193445 () Bool)

(assert (=> b!162020 m!193445))

(assert (=> b!162020 m!193445))

(declare-fun m!193447 () Bool)

(assert (=> b!162020 m!193447))

(declare-fun m!193449 () Bool)

(assert (=> b!162027 m!193449))

(declare-fun m!193451 () Bool)

(assert (=> b!162027 m!193451))

(declare-fun m!193453 () Bool)

(assert (=> b!162024 m!193453))

(declare-fun m!193455 () Bool)

(assert (=> b!162024 m!193455))

(declare-fun m!193457 () Bool)

(assert (=> mapNonEmpty!5936 m!193457))

(declare-fun m!193459 () Bool)

(assert (=> b!162019 m!193459))

(declare-fun m!193461 () Bool)

(assert (=> start!16240 m!193461))

(check-sat tp_is_empty!3499 b_and!10125 (not start!16240) (not b!162024) (not b_next!3697) (not b!162027) (not b!162020) (not b!162019) (not mapNonEmpty!5936))
(check-sat b_and!10125 (not b_next!3697))
