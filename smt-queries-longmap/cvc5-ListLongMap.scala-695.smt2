; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16674 () Bool)

(assert start!16674)

(declare-fun b!166912 () Bool)

(declare-fun b_free!3979 () Bool)

(declare-fun b_next!3979 () Bool)

(assert (=> b!166912 (= b_free!3979 (not b_next!3979))))

(declare-fun tp!14537 () Bool)

(declare-fun b_and!10393 () Bool)

(assert (=> b!166912 (= tp!14537 b_and!10393)))

(declare-fun res!79355 () Bool)

(declare-fun e!109550 () Bool)

(assert (=> start!16674 (=> (not res!79355) (not e!109550))))

(declare-datatypes ((V!4689 0))(
  ( (V!4690 (val!1935 Int)) )
))
(declare-datatypes ((ValueCell!1547 0))(
  ( (ValueCellFull!1547 (v!3800 V!4689)) (EmptyCell!1547) )
))
(declare-datatypes ((array!6659 0))(
  ( (array!6660 (arr!3165 (Array (_ BitVec 32) (_ BitVec 64))) (size!3453 (_ BitVec 32))) )
))
(declare-datatypes ((array!6661 0))(
  ( (array!6662 (arr!3166 (Array (_ BitVec 32) ValueCell!1547)) (size!3454 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2002 0))(
  ( (LongMapFixedSize!2003 (defaultEntry!3443 Int) (mask!8182 (_ BitVec 32)) (extraKeys!3184 (_ BitVec 32)) (zeroValue!3286 V!4689) (minValue!3286 V!4689) (_size!1050 (_ BitVec 32)) (_keys!5268 array!6659) (_values!3426 array!6661) (_vacant!1050 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2002)

(declare-fun valid!877 (LongMapFixedSize!2002) Bool)

(assert (=> start!16674 (= res!79355 (valid!877 thiss!1248))))

(assert (=> start!16674 e!109550))

(declare-fun e!109558 () Bool)

(assert (=> start!16674 e!109558))

(assert (=> start!16674 true))

(declare-fun mapIsEmpty!6390 () Bool)

(declare-fun mapRes!6390 () Bool)

(assert (=> mapIsEmpty!6390 mapRes!6390))

(declare-fun b!166902 () Bool)

(declare-datatypes ((Unit!5090 0))(
  ( (Unit!5091) )
))
(declare-fun e!109552 () Unit!5090)

(declare-fun Unit!5092 () Unit!5090)

(assert (=> b!166902 (= e!109552 Unit!5092)))

(declare-fun lt!83488 () Unit!5090)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!97 (array!6659 array!6661 (_ BitVec 32) (_ BitVec 32) V!4689 V!4689 (_ BitVec 64) Int) Unit!5090)

(assert (=> b!166902 (= lt!83488 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!97 (_keys!5268 thiss!1248) (_values!3426 thiss!1248) (mask!8182 thiss!1248) (extraKeys!3184 thiss!1248) (zeroValue!3286 thiss!1248) (minValue!3286 thiss!1248) key!828 (defaultEntry!3443 thiss!1248)))))

(assert (=> b!166902 false))

(declare-fun b!166903 () Bool)

(declare-fun e!109556 () Bool)

(declare-fun tp_is_empty!3781 () Bool)

(assert (=> b!166903 (= e!109556 tp_is_empty!3781)))

(declare-fun b!166904 () Bool)

(declare-fun e!109553 () Bool)

(assert (=> b!166904 (= e!109553 tp_is_empty!3781)))

(declare-fun b!166905 () Bool)

(declare-fun e!109557 () Bool)

(declare-datatypes ((SeekEntryResult!466 0))(
  ( (MissingZero!466 (index!4032 (_ BitVec 32))) (Found!466 (index!4033 (_ BitVec 32))) (Intermediate!466 (undefined!1278 Bool) (index!4034 (_ BitVec 32)) (x!18478 (_ BitVec 32))) (Undefined!466) (MissingVacant!466 (index!4035 (_ BitVec 32))) )
))
(declare-fun lt!83487 () SeekEntryResult!466)

(assert (=> b!166905 (= e!109557 (= (select (arr!3165 (_keys!5268 thiss!1248)) (index!4033 lt!83487)) key!828))))

(declare-fun b!166906 () Bool)

(declare-fun e!109555 () Bool)

(assert (=> b!166906 (= e!109550 e!109555)))

(declare-fun res!79351 () Bool)

(assert (=> b!166906 (=> (not res!79351) (not e!109555))))

(assert (=> b!166906 (= res!79351 (and (not (is-Undefined!466 lt!83487)) (not (is-MissingVacant!466 lt!83487)) (not (is-MissingZero!466 lt!83487)) (is-Found!466 lt!83487)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6659 (_ BitVec 32)) SeekEntryResult!466)

(assert (=> b!166906 (= lt!83487 (seekEntryOrOpen!0 key!828 (_keys!5268 thiss!1248) (mask!8182 thiss!1248)))))

(declare-fun b!166907 () Bool)

(declare-fun res!79350 () Bool)

(assert (=> b!166907 (=> (not res!79350) (not e!109550))))

(assert (=> b!166907 (= res!79350 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166908 () Bool)

(declare-fun e!109559 () Bool)

(assert (=> b!166908 (= e!109555 e!109559)))

(declare-fun res!79354 () Bool)

(assert (=> b!166908 (=> (not res!79354) (not e!109559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166908 (= res!79354 (validMask!0 (mask!8182 thiss!1248)))))

(declare-fun lt!83485 () Unit!5090)

(assert (=> b!166908 (= lt!83485 e!109552)))

(declare-fun c!30250 () Bool)

(declare-datatypes ((tuple2!3120 0))(
  ( (tuple2!3121 (_1!1571 (_ BitVec 64)) (_2!1571 V!4689)) )
))
(declare-datatypes ((List!2108 0))(
  ( (Nil!2105) (Cons!2104 (h!2721 tuple2!3120) (t!6910 List!2108)) )
))
(declare-datatypes ((ListLongMap!2075 0))(
  ( (ListLongMap!2076 (toList!1053 List!2108)) )
))
(declare-fun contains!1095 (ListLongMap!2075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!711 (array!6659 array!6661 (_ BitVec 32) (_ BitVec 32) V!4689 V!4689 (_ BitVec 32) Int) ListLongMap!2075)

(assert (=> b!166908 (= c!30250 (contains!1095 (getCurrentListMap!711 (_keys!5268 thiss!1248) (_values!3426 thiss!1248) (mask!8182 thiss!1248) (extraKeys!3184 thiss!1248) (zeroValue!3286 thiss!1248) (minValue!3286 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3443 thiss!1248)) key!828))))

(declare-fun b!166909 () Bool)

(declare-fun e!109551 () Bool)

(assert (=> b!166909 (= e!109551 (and e!109553 mapRes!6390))))

(declare-fun condMapEmpty!6390 () Bool)

(declare-fun mapDefault!6390 () ValueCell!1547)

