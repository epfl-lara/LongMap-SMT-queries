; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16198 () Bool)

(assert start!16198)

(declare-fun b!161591 () Bool)

(declare-fun b_free!3659 () Bool)

(declare-fun b_next!3659 () Bool)

(assert (=> b!161591 (= b_free!3659 (not b_next!3659))))

(declare-fun tp!13547 () Bool)

(declare-fun b_and!10073 () Bool)

(assert (=> b!161591 (= tp!13547 b_and!10073)))

(declare-fun mapIsEmpty!5879 () Bool)

(declare-fun mapRes!5879 () Bool)

(assert (=> mapIsEmpty!5879 mapRes!5879))

(declare-fun b!161586 () Bool)

(declare-datatypes ((Unit!5032 0))(
  ( (Unit!5033) )
))
(declare-fun e!105625 () Unit!5032)

(declare-fun Unit!5034 () Unit!5032)

(assert (=> b!161586 (= e!105625 Unit!5034)))

(declare-fun lt!82245 () Unit!5032)

(declare-datatypes ((V!4261 0))(
  ( (V!4262 (val!1775 Int)) )
))
(declare-datatypes ((ValueCell!1387 0))(
  ( (ValueCellFull!1387 (v!3640 V!4261)) (EmptyCell!1387) )
))
(declare-datatypes ((array!6001 0))(
  ( (array!6002 (arr!2845 (Array (_ BitVec 32) (_ BitVec 64))) (size!3129 (_ BitVec 32))) )
))
(declare-datatypes ((array!6003 0))(
  ( (array!6004 (arr!2846 (Array (_ BitVec 32) ValueCell!1387)) (size!3130 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1682 0))(
  ( (LongMapFixedSize!1683 (defaultEntry!3283 Int) (mask!7877 (_ BitVec 32)) (extraKeys!3024 (_ BitVec 32)) (zeroValue!3126 V!4261) (minValue!3126 V!4261) (_size!890 (_ BitVec 32)) (_keys!5084 array!6001) (_values!3266 array!6003) (_vacant!890 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1682)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!82 (array!6001 array!6003 (_ BitVec 32) (_ BitVec 32) V!4261 V!4261 (_ BitVec 64) Int) Unit!5032)

(assert (=> b!161586 (= lt!82245 (lemmaInListMapThenSeekEntryOrOpenFindsIt!82 (_keys!5084 thiss!1248) (_values!3266 thiss!1248) (mask!7877 thiss!1248) (extraKeys!3024 thiss!1248) (zeroValue!3126 thiss!1248) (minValue!3126 thiss!1248) key!828 (defaultEntry!3283 thiss!1248)))))

(assert (=> b!161586 false))

(declare-fun b!161587 () Bool)

(declare-fun e!105624 () Bool)

(assert (=> b!161587 (= e!105624 false)))

(declare-fun lt!82246 () Unit!5032)

(assert (=> b!161587 (= lt!82246 e!105625)))

(declare-fun c!29977 () Bool)

(declare-datatypes ((tuple2!2968 0))(
  ( (tuple2!2969 (_1!1495 (_ BitVec 64)) (_2!1495 V!4261)) )
))
(declare-datatypes ((List!1980 0))(
  ( (Nil!1977) (Cons!1976 (h!2589 tuple2!2968) (t!6782 List!1980)) )
))
(declare-datatypes ((ListLongMap!1955 0))(
  ( (ListLongMap!1956 (toList!993 List!1980)) )
))
(declare-fun contains!1029 (ListLongMap!1955 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!657 (array!6001 array!6003 (_ BitVec 32) (_ BitVec 32) V!4261 V!4261 (_ BitVec 32) Int) ListLongMap!1955)

(assert (=> b!161587 (= c!29977 (contains!1029 (getCurrentListMap!657 (_keys!5084 thiss!1248) (_values!3266 thiss!1248) (mask!7877 thiss!1248) (extraKeys!3024 thiss!1248) (zeroValue!3126 thiss!1248) (minValue!3126 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3283 thiss!1248)) key!828))))

(declare-fun b!161588 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!83 (array!6001 array!6003 (_ BitVec 32) (_ BitVec 32) V!4261 V!4261 (_ BitVec 64) Int) Unit!5032)

(assert (=> b!161588 (= e!105625 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!83 (_keys!5084 thiss!1248) (_values!3266 thiss!1248) (mask!7877 thiss!1248) (extraKeys!3024 thiss!1248) (zeroValue!3126 thiss!1248) (minValue!3126 thiss!1248) key!828 (defaultEntry!3283 thiss!1248)))))

(declare-fun mapNonEmpty!5879 () Bool)

(declare-fun tp!13546 () Bool)

(declare-fun e!105622 () Bool)

(assert (=> mapNonEmpty!5879 (= mapRes!5879 (and tp!13546 e!105622))))

(declare-fun mapKey!5879 () (_ BitVec 32))

(declare-fun mapRest!5879 () (Array (_ BitVec 32) ValueCell!1387))

(declare-fun mapValue!5879 () ValueCell!1387)

(assert (=> mapNonEmpty!5879 (= (arr!2846 (_values!3266 thiss!1248)) (store mapRest!5879 mapKey!5879 mapValue!5879))))

(declare-fun b!161589 () Bool)

(declare-fun e!105627 () Bool)

(declare-fun e!105623 () Bool)

(assert (=> b!161589 (= e!105627 (and e!105623 mapRes!5879))))

(declare-fun condMapEmpty!5879 () Bool)

(declare-fun mapDefault!5879 () ValueCell!1387)

