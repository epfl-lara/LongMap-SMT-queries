; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19258 () Bool)

(assert start!19258)

(declare-fun b!189456 () Bool)

(declare-fun b_free!4645 () Bool)

(declare-fun b_next!4645 () Bool)

(assert (=> b!189456 (= b_free!4645 (not b_next!4645))))

(declare-fun tp!16767 () Bool)

(declare-fun b_and!11297 () Bool)

(assert (=> b!189456 (= tp!16767 b_and!11297)))

(declare-fun b!189448 () Bool)

(declare-fun e!124658 () Bool)

(declare-fun e!124661 () Bool)

(declare-fun mapRes!7621 () Bool)

(assert (=> b!189448 (= e!124658 (and e!124661 mapRes!7621))))

(declare-fun condMapEmpty!7621 () Bool)

(declare-datatypes ((V!5537 0))(
  ( (V!5538 (val!2253 Int)) )
))
(declare-datatypes ((ValueCell!1865 0))(
  ( (ValueCellFull!1865 (v!4175 V!5537)) (EmptyCell!1865) )
))
(declare-datatypes ((array!8049 0))(
  ( (array!8050 (arr!3794 (Array (_ BitVec 32) (_ BitVec 64))) (size!4114 (_ BitVec 32))) )
))
(declare-datatypes ((array!8051 0))(
  ( (array!8052 (arr!3795 (Array (_ BitVec 32) ValueCell!1865)) (size!4115 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2638 0))(
  ( (LongMapFixedSize!2639 (defaultEntry!3863 Int) (mask!9050 (_ BitVec 32)) (extraKeys!3600 (_ BitVec 32)) (zeroValue!3704 V!5537) (minValue!3704 V!5537) (_size!1368 (_ BitVec 32)) (_keys!5830 array!8049) (_values!3846 array!8051) (_vacant!1368 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2638)

(declare-fun mapDefault!7621 () ValueCell!1865)

(assert (=> b!189448 (= condMapEmpty!7621 (= (arr!3795 (_values!3846 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1865)) mapDefault!7621)))))

(declare-fun b!189449 () Bool)

(declare-fun res!89572 () Bool)

(declare-fun e!124660 () Bool)

(assert (=> b!189449 (=> (not res!89572) (not e!124660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8049 (_ BitVec 32)) Bool)

(assert (=> b!189449 (= res!89572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5830 thiss!1248) (mask!9050 thiss!1248)))))

(declare-fun mapNonEmpty!7621 () Bool)

(declare-fun tp!16768 () Bool)

(declare-fun e!124657 () Bool)

(assert (=> mapNonEmpty!7621 (= mapRes!7621 (and tp!16768 e!124657))))

(declare-fun mapRest!7621 () (Array (_ BitVec 32) ValueCell!1865))

(declare-fun mapKey!7621 () (_ BitVec 32))

(declare-fun mapValue!7621 () ValueCell!1865)

(assert (=> mapNonEmpty!7621 (= (arr!3795 (_values!3846 thiss!1248)) (store mapRest!7621 mapKey!7621 mapValue!7621))))

(declare-fun b!189450 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!654 0))(
  ( (MissingZero!654 (index!4786 (_ BitVec 32))) (Found!654 (index!4787 (_ BitVec 32))) (Intermediate!654 (undefined!1466 Bool) (index!4788 (_ BitVec 32)) (x!20412 (_ BitVec 32))) (Undefined!654) (MissingVacant!654 (index!4789 (_ BitVec 32))) )
))
(declare-fun lt!93808 () SeekEntryResult!654)

(declare-fun e!124663 () Bool)

(assert (=> b!189450 (= e!124663 (= (select (arr!3794 (_keys!5830 thiss!1248)) (index!4787 lt!93808)) key!828))))

(declare-fun b!189451 () Bool)

(declare-fun tp_is_empty!4417 () Bool)

(assert (=> b!189451 (= e!124657 tp_is_empty!4417)))

(declare-fun b!189452 () Bool)

(declare-fun res!89581 () Bool)

(assert (=> b!189452 (=> (not res!89581) (not e!124660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189452 (= res!89581 (validKeyInArray!0 key!828))))

(declare-fun b!189453 () Bool)

(declare-datatypes ((Unit!5710 0))(
  ( (Unit!5711) )
))
(declare-fun e!124664 () Unit!5710)

(declare-fun lt!93807 () Unit!5710)

(assert (=> b!189453 (= e!124664 lt!93807)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!164 (array!8049 array!8051 (_ BitVec 32) (_ BitVec 32) V!5537 V!5537 (_ BitVec 64) Int) Unit!5710)

(assert (=> b!189453 (= lt!93807 (lemmaInListMapThenSeekEntryOrOpenFindsIt!164 (_keys!5830 thiss!1248) (_values!3846 thiss!1248) (mask!9050 thiss!1248) (extraKeys!3600 thiss!1248) (zeroValue!3704 thiss!1248) (minValue!3704 thiss!1248) key!828 (defaultEntry!3863 thiss!1248)))))

(declare-fun res!89578 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189453 (= res!89578 (inRange!0 (index!4787 lt!93808) (mask!9050 thiss!1248)))))

(assert (=> b!189453 (=> (not res!89578) (not e!124663))))

(assert (=> b!189453 e!124663))

(declare-fun b!189455 () Bool)

(assert (=> b!189455 (= e!124661 tp_is_empty!4417)))

(declare-fun e!124656 () Bool)

(declare-fun array_inv!2447 (array!8049) Bool)

(declare-fun array_inv!2448 (array!8051) Bool)

(assert (=> b!189456 (= e!124656 (and tp!16767 tp_is_empty!4417 (array_inv!2447 (_keys!5830 thiss!1248)) (array_inv!2448 (_values!3846 thiss!1248)) e!124658))))

(declare-fun b!189457 () Bool)

(declare-fun res!89575 () Bool)

(assert (=> b!189457 (=> (not res!89575) (not e!124660))))

(declare-datatypes ((List!2370 0))(
  ( (Nil!2367) (Cons!2366 (h!3003 (_ BitVec 64)) (t!7266 List!2370)) )
))
(declare-fun arrayNoDuplicates!0 (array!8049 (_ BitVec 32) List!2370) Bool)

(assert (=> b!189457 (= res!89575 (arrayNoDuplicates!0 (_keys!5830 thiss!1248) #b00000000000000000000000000000000 Nil!2367))))

(declare-fun b!189458 () Bool)

(declare-fun e!124665 () Bool)

(declare-fun e!124662 () Bool)

(assert (=> b!189458 (= e!124665 e!124662)))

(declare-fun res!89579 () Bool)

(assert (=> b!189458 (=> (not res!89579) (not e!124662))))

(get-info :version)

(assert (=> b!189458 (= res!89579 (and (not ((_ is Undefined!654) lt!93808)) (not ((_ is MissingVacant!654) lt!93808)) (not ((_ is MissingZero!654) lt!93808)) ((_ is Found!654) lt!93808)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8049 (_ BitVec 32)) SeekEntryResult!654)

(assert (=> b!189458 (= lt!93808 (seekEntryOrOpen!0 key!828 (_keys!5830 thiss!1248) (mask!9050 thiss!1248)))))

(declare-fun b!189459 () Bool)

(assert (=> b!189459 (= e!124662 e!124660)))

(declare-fun res!89577 () Bool)

(assert (=> b!189459 (=> (not res!89577) (not e!124660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189459 (= res!89577 (validMask!0 (mask!9050 thiss!1248)))))

(declare-fun lt!93806 () Unit!5710)

(assert (=> b!189459 (= lt!93806 e!124664)))

(declare-fun c!34053 () Bool)

(declare-datatypes ((tuple2!3454 0))(
  ( (tuple2!3455 (_1!1738 (_ BitVec 64)) (_2!1738 V!5537)) )
))
(declare-datatypes ((List!2371 0))(
  ( (Nil!2368) (Cons!2367 (h!3004 tuple2!3454) (t!7267 List!2371)) )
))
(declare-datatypes ((ListLongMap!2375 0))(
  ( (ListLongMap!2376 (toList!1203 List!2371)) )
))
(declare-fun contains!1322 (ListLongMap!2375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!855 (array!8049 array!8051 (_ BitVec 32) (_ BitVec 32) V!5537 V!5537 (_ BitVec 32) Int) ListLongMap!2375)

(assert (=> b!189459 (= c!34053 (contains!1322 (getCurrentListMap!855 (_keys!5830 thiss!1248) (_values!3846 thiss!1248) (mask!9050 thiss!1248) (extraKeys!3600 thiss!1248) (zeroValue!3704 thiss!1248) (minValue!3704 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3863 thiss!1248)) key!828))))

(declare-fun b!189460 () Bool)

(assert (=> b!189460 (= e!124660 (not (= (select (arr!3794 (_keys!5830 thiss!1248)) (index!4787 lt!93808)) key!828)))))

(declare-fun b!189461 () Bool)

(declare-fun res!89576 () Bool)

(assert (=> b!189461 (=> (not res!89576) (not e!124665))))

(assert (=> b!189461 (= res!89576 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189462 () Bool)

(declare-fun res!89580 () Bool)

(assert (=> b!189462 (=> (not res!89580) (not e!124660))))

(assert (=> b!189462 (= res!89580 (and (= (size!4115 (_values!3846 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9050 thiss!1248))) (= (size!4114 (_keys!5830 thiss!1248)) (size!4115 (_values!3846 thiss!1248))) (bvsge (mask!9050 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3600 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3600 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!189463 () Bool)

(declare-fun Unit!5712 () Unit!5710)

(assert (=> b!189463 (= e!124664 Unit!5712)))

(declare-fun lt!93805 () Unit!5710)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!159 (array!8049 array!8051 (_ BitVec 32) (_ BitVec 32) V!5537 V!5537 (_ BitVec 64) Int) Unit!5710)

(assert (=> b!189463 (= lt!93805 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!159 (_keys!5830 thiss!1248) (_values!3846 thiss!1248) (mask!9050 thiss!1248) (extraKeys!3600 thiss!1248) (zeroValue!3704 thiss!1248) (minValue!3704 thiss!1248) key!828 (defaultEntry!3863 thiss!1248)))))

(assert (=> b!189463 false))

(declare-fun mapIsEmpty!7621 () Bool)

(assert (=> mapIsEmpty!7621 mapRes!7621))

(declare-fun res!89573 () Bool)

(assert (=> start!19258 (=> (not res!89573) (not e!124665))))

(declare-fun valid!1110 (LongMapFixedSize!2638) Bool)

(assert (=> start!19258 (= res!89573 (valid!1110 thiss!1248))))

(assert (=> start!19258 e!124665))

(assert (=> start!19258 e!124656))

(assert (=> start!19258 true))

(declare-fun b!189454 () Bool)

(declare-fun res!89574 () Bool)

(assert (=> b!189454 (=> (not res!89574) (not e!124660))))

(assert (=> b!189454 (= res!89574 (and (bvsge (index!4787 lt!93808) #b00000000000000000000000000000000) (bvslt (index!4787 lt!93808) (size!4114 (_keys!5830 thiss!1248)))))))

(assert (= (and start!19258 res!89573) b!189461))

(assert (= (and b!189461 res!89576) b!189458))

(assert (= (and b!189458 res!89579) b!189459))

(assert (= (and b!189459 c!34053) b!189453))

(assert (= (and b!189459 (not c!34053)) b!189463))

(assert (= (and b!189453 res!89578) b!189450))

(assert (= (and b!189459 res!89577) b!189462))

(assert (= (and b!189462 res!89580) b!189449))

(assert (= (and b!189449 res!89572) b!189457))

(assert (= (and b!189457 res!89575) b!189454))

(assert (= (and b!189454 res!89574) b!189452))

(assert (= (and b!189452 res!89581) b!189460))

(assert (= (and b!189448 condMapEmpty!7621) mapIsEmpty!7621))

(assert (= (and b!189448 (not condMapEmpty!7621)) mapNonEmpty!7621))

(assert (= (and mapNonEmpty!7621 ((_ is ValueCellFull!1865) mapValue!7621)) b!189451))

(assert (= (and b!189448 ((_ is ValueCellFull!1865) mapDefault!7621)) b!189455))

(assert (= b!189456 b!189448))

(assert (= start!19258 b!189456))

(declare-fun m!215933 () Bool)

(assert (=> start!19258 m!215933))

(declare-fun m!215935 () Bool)

(assert (=> b!189453 m!215935))

(declare-fun m!215937 () Bool)

(assert (=> b!189453 m!215937))

(declare-fun m!215939 () Bool)

(assert (=> b!189457 m!215939))

(declare-fun m!215941 () Bool)

(assert (=> mapNonEmpty!7621 m!215941))

(declare-fun m!215943 () Bool)

(assert (=> b!189460 m!215943))

(declare-fun m!215945 () Bool)

(assert (=> b!189456 m!215945))

(declare-fun m!215947 () Bool)

(assert (=> b!189456 m!215947))

(assert (=> b!189450 m!215943))

(declare-fun m!215949 () Bool)

(assert (=> b!189452 m!215949))

(declare-fun m!215951 () Bool)

(assert (=> b!189463 m!215951))

(declare-fun m!215953 () Bool)

(assert (=> b!189458 m!215953))

(declare-fun m!215955 () Bool)

(assert (=> b!189459 m!215955))

(declare-fun m!215957 () Bool)

(assert (=> b!189459 m!215957))

(assert (=> b!189459 m!215957))

(declare-fun m!215959 () Bool)

(assert (=> b!189459 m!215959))

(declare-fun m!215961 () Bool)

(assert (=> b!189449 m!215961))

(check-sat (not b!189463) (not b!189458) (not b!189459) (not b_next!4645) (not b!189449) (not b!189457) (not mapNonEmpty!7621) (not start!19258) tp_is_empty!4417 (not b!189452) (not b!189456) (not b!189453) b_and!11297)
(check-sat b_and!11297 (not b_next!4645))
