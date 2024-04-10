; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16184 () Bool)

(assert start!16184)

(declare-fun b!161403 () Bool)

(declare-fun b_free!3645 () Bool)

(declare-fun b_next!3645 () Bool)

(assert (=> b!161403 (= b_free!3645 (not b_next!3645))))

(declare-fun tp!13504 () Bool)

(declare-fun b_and!10059 () Bool)

(assert (=> b!161403 (= tp!13504 b_and!10059)))

(declare-fun mapIsEmpty!5858 () Bool)

(declare-fun mapRes!5858 () Bool)

(assert (=> mapIsEmpty!5858 mapRes!5858))

(declare-fun b!161396 () Bool)

(declare-fun res!76513 () Bool)

(declare-fun e!105475 () Bool)

(assert (=> b!161396 (=> (not res!76513) (not e!105475))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4243 0))(
  ( (V!4244 (val!1768 Int)) )
))
(declare-datatypes ((ValueCell!1380 0))(
  ( (ValueCellFull!1380 (v!3633 V!4243)) (EmptyCell!1380) )
))
(declare-datatypes ((array!5973 0))(
  ( (array!5974 (arr!2831 (Array (_ BitVec 32) (_ BitVec 64))) (size!3115 (_ BitVec 32))) )
))
(declare-datatypes ((array!5975 0))(
  ( (array!5976 (arr!2832 (Array (_ BitVec 32) ValueCell!1380)) (size!3116 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1668 0))(
  ( (LongMapFixedSize!1669 (defaultEntry!3276 Int) (mask!7866 (_ BitVec 32)) (extraKeys!3017 (_ BitVec 32)) (zeroValue!3119 V!4243) (minValue!3119 V!4243) (_size!883 (_ BitVec 32)) (_keys!5077 array!5973) (_values!3259 array!5975) (_vacant!883 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1668)

(get-info :version)

(declare-datatypes ((SeekEntryResult!354 0))(
  ( (MissingZero!354 (index!3584 (_ BitVec 32))) (Found!354 (index!3585 (_ BitVec 32))) (Intermediate!354 (undefined!1166 Bool) (index!3586 (_ BitVec 32)) (x!17810 (_ BitVec 32))) (Undefined!354) (MissingVacant!354 (index!3587 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5973 (_ BitVec 32)) SeekEntryResult!354)

(assert (=> b!161396 (= res!76513 ((_ is Undefined!354) (seekEntryOrOpen!0 key!828 (_keys!5077 thiss!1248) (mask!7866 thiss!1248))))))

(declare-fun res!76514 () Bool)

(assert (=> start!16184 (=> (not res!76514) (not e!105475))))

(declare-fun valid!765 (LongMapFixedSize!1668) Bool)

(assert (=> start!16184 (= res!76514 (valid!765 thiss!1248))))

(assert (=> start!16184 e!105475))

(declare-fun e!105476 () Bool)

(assert (=> start!16184 e!105476))

(assert (=> start!16184 true))

(declare-fun b!161397 () Bool)

(declare-datatypes ((Unit!5012 0))(
  ( (Unit!5013) )
))
(declare-fun e!105477 () Unit!5012)

(declare-fun Unit!5014 () Unit!5012)

(assert (=> b!161397 (= e!105477 Unit!5014)))

(declare-fun lt!82203 () Unit!5012)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!76 (array!5973 array!5975 (_ BitVec 32) (_ BitVec 32) V!4243 V!4243 (_ BitVec 64) Int) Unit!5012)

(assert (=> b!161397 (= lt!82203 (lemmaInListMapThenSeekEntryOrOpenFindsIt!76 (_keys!5077 thiss!1248) (_values!3259 thiss!1248) (mask!7866 thiss!1248) (extraKeys!3017 thiss!1248) (zeroValue!3119 thiss!1248) (minValue!3119 thiss!1248) key!828 (defaultEntry!3276 thiss!1248)))))

(assert (=> b!161397 false))

(declare-fun b!161398 () Bool)

(declare-fun e!105478 () Bool)

(declare-fun tp_is_empty!3447 () Bool)

(assert (=> b!161398 (= e!105478 tp_is_empty!3447)))

(declare-fun b!161399 () Bool)

(declare-fun e!105480 () Bool)

(assert (=> b!161399 (= e!105480 tp_is_empty!3447)))

(declare-fun b!161400 () Bool)

(declare-fun res!76512 () Bool)

(assert (=> b!161400 (=> (not res!76512) (not e!105475))))

(assert (=> b!161400 (= res!76512 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161401 () Bool)

(declare-fun e!105474 () Bool)

(assert (=> b!161401 (= e!105474 (and e!105480 mapRes!5858))))

(declare-fun condMapEmpty!5858 () Bool)

(declare-fun mapDefault!5858 () ValueCell!1380)

(assert (=> b!161401 (= condMapEmpty!5858 (= (arr!2832 (_values!3259 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1380)) mapDefault!5858)))))

(declare-fun b!161402 () Bool)

(assert (=> b!161402 (= e!105475 false)))

(declare-fun lt!82204 () Unit!5012)

(assert (=> b!161402 (= lt!82204 e!105477)))

(declare-fun c!29956 () Bool)

(declare-datatypes ((tuple2!2960 0))(
  ( (tuple2!2961 (_1!1491 (_ BitVec 64)) (_2!1491 V!4243)) )
))
(declare-datatypes ((List!1976 0))(
  ( (Nil!1973) (Cons!1972 (h!2585 tuple2!2960) (t!6778 List!1976)) )
))
(declare-datatypes ((ListLongMap!1947 0))(
  ( (ListLongMap!1948 (toList!989 List!1976)) )
))
(declare-fun contains!1025 (ListLongMap!1947 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!653 (array!5973 array!5975 (_ BitVec 32) (_ BitVec 32) V!4243 V!4243 (_ BitVec 32) Int) ListLongMap!1947)

(assert (=> b!161402 (= c!29956 (contains!1025 (getCurrentListMap!653 (_keys!5077 thiss!1248) (_values!3259 thiss!1248) (mask!7866 thiss!1248) (extraKeys!3017 thiss!1248) (zeroValue!3119 thiss!1248) (minValue!3119 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3276 thiss!1248)) key!828))))

(declare-fun array_inv!1811 (array!5973) Bool)

(declare-fun array_inv!1812 (array!5975) Bool)

(assert (=> b!161403 (= e!105476 (and tp!13504 tp_is_empty!3447 (array_inv!1811 (_keys!5077 thiss!1248)) (array_inv!1812 (_values!3259 thiss!1248)) e!105474))))

(declare-fun mapNonEmpty!5858 () Bool)

(declare-fun tp!13505 () Bool)

(assert (=> mapNonEmpty!5858 (= mapRes!5858 (and tp!13505 e!105478))))

(declare-fun mapValue!5858 () ValueCell!1380)

(declare-fun mapKey!5858 () (_ BitVec 32))

(declare-fun mapRest!5858 () (Array (_ BitVec 32) ValueCell!1380))

(assert (=> mapNonEmpty!5858 (= (arr!2832 (_values!3259 thiss!1248)) (store mapRest!5858 mapKey!5858 mapValue!5858))))

(declare-fun b!161404 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!77 (array!5973 array!5975 (_ BitVec 32) (_ BitVec 32) V!4243 V!4243 (_ BitVec 64) Int) Unit!5012)

(assert (=> b!161404 (= e!105477 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!77 (_keys!5077 thiss!1248) (_values!3259 thiss!1248) (mask!7866 thiss!1248) (extraKeys!3017 thiss!1248) (zeroValue!3119 thiss!1248) (minValue!3119 thiss!1248) key!828 (defaultEntry!3276 thiss!1248)))))

(assert (= (and start!16184 res!76514) b!161400))

(assert (= (and b!161400 res!76512) b!161396))

(assert (= (and b!161396 res!76513) b!161402))

(assert (= (and b!161402 c!29956) b!161397))

(assert (= (and b!161402 (not c!29956)) b!161404))

(assert (= (and b!161401 condMapEmpty!5858) mapIsEmpty!5858))

(assert (= (and b!161401 (not condMapEmpty!5858)) mapNonEmpty!5858))

(assert (= (and mapNonEmpty!5858 ((_ is ValueCellFull!1380) mapValue!5858)) b!161398))

(assert (= (and b!161401 ((_ is ValueCellFull!1380) mapDefault!5858)) b!161399))

(assert (= b!161403 b!161401))

(assert (= start!16184 b!161403))

(declare-fun m!192903 () Bool)

(assert (=> b!161402 m!192903))

(assert (=> b!161402 m!192903))

(declare-fun m!192905 () Bool)

(assert (=> b!161402 m!192905))

(declare-fun m!192907 () Bool)

(assert (=> b!161397 m!192907))

(declare-fun m!192909 () Bool)

(assert (=> mapNonEmpty!5858 m!192909))

(declare-fun m!192911 () Bool)

(assert (=> start!16184 m!192911))

(declare-fun m!192913 () Bool)

(assert (=> b!161403 m!192913))

(declare-fun m!192915 () Bool)

(assert (=> b!161403 m!192915))

(declare-fun m!192917 () Bool)

(assert (=> b!161404 m!192917))

(declare-fun m!192919 () Bool)

(assert (=> b!161396 m!192919))

(check-sat (not b!161396) (not b!161403) (not b!161402) tp_is_empty!3447 (not start!16184) (not b_next!3645) (not mapNonEmpty!5858) (not b!161397) (not b!161404) b_and!10059)
(check-sat b_and!10059 (not b_next!3645))
