; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16190 () Bool)

(assert start!16190)

(declare-fun b!161481 () Bool)

(declare-fun b_free!3651 () Bool)

(declare-fun b_next!3651 () Bool)

(assert (=> b!161481 (= b_free!3651 (not b_next!3651))))

(declare-fun tp!13523 () Bool)

(declare-fun b_and!10065 () Bool)

(assert (=> b!161481 (= tp!13523 b_and!10065)))

(declare-fun mapNonEmpty!5867 () Bool)

(declare-fun mapRes!5867 () Bool)

(declare-fun tp!13522 () Bool)

(declare-fun e!105542 () Bool)

(assert (=> mapNonEmpty!5867 (= mapRes!5867 (and tp!13522 e!105542))))

(declare-datatypes ((V!4251 0))(
  ( (V!4252 (val!1771 Int)) )
))
(declare-datatypes ((ValueCell!1383 0))(
  ( (ValueCellFull!1383 (v!3636 V!4251)) (EmptyCell!1383) )
))
(declare-fun mapRest!5867 () (Array (_ BitVec 32) ValueCell!1383))

(declare-fun mapKey!5867 () (_ BitVec 32))

(declare-datatypes ((array!5985 0))(
  ( (array!5986 (arr!2837 (Array (_ BitVec 32) (_ BitVec 64))) (size!3121 (_ BitVec 32))) )
))
(declare-datatypes ((array!5987 0))(
  ( (array!5988 (arr!2838 (Array (_ BitVec 32) ValueCell!1383)) (size!3122 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1674 0))(
  ( (LongMapFixedSize!1675 (defaultEntry!3279 Int) (mask!7871 (_ BitVec 32)) (extraKeys!3020 (_ BitVec 32)) (zeroValue!3122 V!4251) (minValue!3122 V!4251) (_size!886 (_ BitVec 32)) (_keys!5080 array!5985) (_values!3262 array!5987) (_vacant!886 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1674)

(declare-fun mapValue!5867 () ValueCell!1383)

(assert (=> mapNonEmpty!5867 (= (arr!2838 (_values!3262 thiss!1248)) (store mapRest!5867 mapKey!5867 mapValue!5867))))

(declare-fun mapIsEmpty!5867 () Bool)

(assert (=> mapIsEmpty!5867 mapRes!5867))

(declare-fun b!161477 () Bool)

(declare-fun e!105537 () Bool)

(assert (=> b!161477 (= e!105537 false)))

(declare-datatypes ((Unit!5020 0))(
  ( (Unit!5021) )
))
(declare-fun lt!82222 () Unit!5020)

(declare-fun e!105538 () Unit!5020)

(assert (=> b!161477 (= lt!82222 e!105538)))

(declare-fun c!29965 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2962 0))(
  ( (tuple2!2963 (_1!1492 (_ BitVec 64)) (_2!1492 V!4251)) )
))
(declare-datatypes ((List!1977 0))(
  ( (Nil!1974) (Cons!1973 (h!2586 tuple2!2962) (t!6779 List!1977)) )
))
(declare-datatypes ((ListLongMap!1949 0))(
  ( (ListLongMap!1950 (toList!990 List!1977)) )
))
(declare-fun contains!1026 (ListLongMap!1949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!654 (array!5985 array!5987 (_ BitVec 32) (_ BitVec 32) V!4251 V!4251 (_ BitVec 32) Int) ListLongMap!1949)

(assert (=> b!161477 (= c!29965 (contains!1026 (getCurrentListMap!654 (_keys!5080 thiss!1248) (_values!3262 thiss!1248) (mask!7871 thiss!1248) (extraKeys!3020 thiss!1248) (zeroValue!3122 thiss!1248) (minValue!3122 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3279 thiss!1248)) key!828))))

(declare-fun b!161478 () Bool)

(declare-fun res!76539 () Bool)

(assert (=> b!161478 (=> (not res!76539) (not e!105537))))

(assert (=> b!161478 (= res!76539 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161479 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!80 (array!5985 array!5987 (_ BitVec 32) (_ BitVec 32) V!4251 V!4251 (_ BitVec 64) Int) Unit!5020)

(assert (=> b!161479 (= e!105538 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!80 (_keys!5080 thiss!1248) (_values!3262 thiss!1248) (mask!7871 thiss!1248) (extraKeys!3020 thiss!1248) (zeroValue!3122 thiss!1248) (minValue!3122 thiss!1248) key!828 (defaultEntry!3279 thiss!1248)))))

(declare-fun b!161480 () Bool)

(declare-fun e!105543 () Bool)

(declare-fun e!105540 () Bool)

(assert (=> b!161480 (= e!105543 (and e!105540 mapRes!5867))))

(declare-fun condMapEmpty!5867 () Bool)

(declare-fun mapDefault!5867 () ValueCell!1383)

(assert (=> b!161480 (= condMapEmpty!5867 (= (arr!2838 (_values!3262 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1383)) mapDefault!5867)))))

(declare-fun tp_is_empty!3453 () Bool)

(declare-fun e!105541 () Bool)

(declare-fun array_inv!1813 (array!5985) Bool)

(declare-fun array_inv!1814 (array!5987) Bool)

(assert (=> b!161481 (= e!105541 (and tp!13523 tp_is_empty!3453 (array_inv!1813 (_keys!5080 thiss!1248)) (array_inv!1814 (_values!3262 thiss!1248)) e!105543))))

(declare-fun res!76540 () Bool)

(assert (=> start!16190 (=> (not res!76540) (not e!105537))))

(declare-fun valid!767 (LongMapFixedSize!1674) Bool)

(assert (=> start!16190 (= res!76540 (valid!767 thiss!1248))))

(assert (=> start!16190 e!105537))

(assert (=> start!16190 e!105541))

(assert (=> start!16190 true))

(declare-fun b!161482 () Bool)

(declare-fun res!76541 () Bool)

(assert (=> b!161482 (=> (not res!76541) (not e!105537))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!355 0))(
  ( (MissingZero!355 (index!3588 (_ BitVec 32))) (Found!355 (index!3589 (_ BitVec 32))) (Intermediate!355 (undefined!1167 Bool) (index!3590 (_ BitVec 32)) (x!17819 (_ BitVec 32))) (Undefined!355) (MissingVacant!355 (index!3591 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5985 (_ BitVec 32)) SeekEntryResult!355)

(assert (=> b!161482 (= res!76541 ((_ is Undefined!355) (seekEntryOrOpen!0 key!828 (_keys!5080 thiss!1248) (mask!7871 thiss!1248))))))

(declare-fun b!161483 () Bool)

(assert (=> b!161483 (= e!105542 tp_is_empty!3453)))

(declare-fun b!161484 () Bool)

(assert (=> b!161484 (= e!105540 tp_is_empty!3453)))

(declare-fun b!161485 () Bool)

(declare-fun Unit!5022 () Unit!5020)

(assert (=> b!161485 (= e!105538 Unit!5022)))

(declare-fun lt!82221 () Unit!5020)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!78 (array!5985 array!5987 (_ BitVec 32) (_ BitVec 32) V!4251 V!4251 (_ BitVec 64) Int) Unit!5020)

(assert (=> b!161485 (= lt!82221 (lemmaInListMapThenSeekEntryOrOpenFindsIt!78 (_keys!5080 thiss!1248) (_values!3262 thiss!1248) (mask!7871 thiss!1248) (extraKeys!3020 thiss!1248) (zeroValue!3122 thiss!1248) (minValue!3122 thiss!1248) key!828 (defaultEntry!3279 thiss!1248)))))

(assert (=> b!161485 false))

(assert (= (and start!16190 res!76540) b!161478))

(assert (= (and b!161478 res!76539) b!161482))

(assert (= (and b!161482 res!76541) b!161477))

(assert (= (and b!161477 c!29965) b!161485))

(assert (= (and b!161477 (not c!29965)) b!161479))

(assert (= (and b!161480 condMapEmpty!5867) mapIsEmpty!5867))

(assert (= (and b!161480 (not condMapEmpty!5867)) mapNonEmpty!5867))

(assert (= (and mapNonEmpty!5867 ((_ is ValueCellFull!1383) mapValue!5867)) b!161483))

(assert (= (and b!161480 ((_ is ValueCellFull!1383) mapDefault!5867)) b!161484))

(assert (= b!161481 b!161480))

(assert (= start!16190 b!161481))

(declare-fun m!192957 () Bool)

(assert (=> b!161477 m!192957))

(assert (=> b!161477 m!192957))

(declare-fun m!192959 () Bool)

(assert (=> b!161477 m!192959))

(declare-fun m!192961 () Bool)

(assert (=> b!161482 m!192961))

(declare-fun m!192963 () Bool)

(assert (=> b!161485 m!192963))

(declare-fun m!192965 () Bool)

(assert (=> mapNonEmpty!5867 m!192965))

(declare-fun m!192967 () Bool)

(assert (=> b!161479 m!192967))

(declare-fun m!192969 () Bool)

(assert (=> b!161481 m!192969))

(declare-fun m!192971 () Bool)

(assert (=> b!161481 m!192971))

(declare-fun m!192973 () Bool)

(assert (=> start!16190 m!192973))

(check-sat (not mapNonEmpty!5867) (not b!161482) (not b!161477) (not b_next!3651) (not b!161479) (not b!161481) (not start!16190) (not b!161485) b_and!10065 tp_is_empty!3453)
(check-sat b_and!10065 (not b_next!3651))
