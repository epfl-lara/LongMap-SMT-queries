; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16672 () Bool)

(assert start!16672)

(declare-fun b!166868 () Bool)

(declare-fun b_free!3977 () Bool)

(declare-fun b_next!3977 () Bool)

(assert (=> b!166868 (= b_free!3977 (not b_next!3977))))

(declare-fun tp!14532 () Bool)

(declare-fun b_and!10391 () Bool)

(assert (=> b!166868 (= tp!14532 b_and!10391)))

(declare-fun b!166863 () Bool)

(declare-datatypes ((Unit!5087 0))(
  ( (Unit!5088) )
))
(declare-fun e!109522 () Unit!5087)

(declare-fun lt!83470 () Unit!5087)

(assert (=> b!166863 (= e!109522 lt!83470)))

(declare-datatypes ((V!4685 0))(
  ( (V!4686 (val!1934 Int)) )
))
(declare-datatypes ((ValueCell!1546 0))(
  ( (ValueCellFull!1546 (v!3799 V!4685)) (EmptyCell!1546) )
))
(declare-datatypes ((array!6655 0))(
  ( (array!6656 (arr!3163 (Array (_ BitVec 32) (_ BitVec 64))) (size!3451 (_ BitVec 32))) )
))
(declare-datatypes ((array!6657 0))(
  ( (array!6658 (arr!3164 (Array (_ BitVec 32) ValueCell!1546)) (size!3452 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2000 0))(
  ( (LongMapFixedSize!2001 (defaultEntry!3442 Int) (mask!8179 (_ BitVec 32)) (extraKeys!3183 (_ BitVec 32)) (zeroValue!3285 V!4685) (minValue!3285 V!4685) (_size!1049 (_ BitVec 32)) (_keys!5267 array!6655) (_values!3425 array!6657) (_vacant!1049 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2000)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!94 (array!6655 array!6657 (_ BitVec 32) (_ BitVec 32) V!4685 V!4685 (_ BitVec 64) Int) Unit!5087)

(assert (=> b!166863 (= lt!83470 (lemmaInListMapThenSeekEntryOrOpenFindsIt!94 (_keys!5267 thiss!1248) (_values!3425 thiss!1248) (mask!8179 thiss!1248) (extraKeys!3183 thiss!1248) (zeroValue!3285 thiss!1248) (minValue!3285 thiss!1248) key!828 (defaultEntry!3442 thiss!1248)))))

(declare-fun res!79335 () Bool)

(declare-datatypes ((SeekEntryResult!465 0))(
  ( (MissingZero!465 (index!4028 (_ BitVec 32))) (Found!465 (index!4029 (_ BitVec 32))) (Intermediate!465 (undefined!1277 Bool) (index!4030 (_ BitVec 32)) (x!18469 (_ BitVec 32))) (Undefined!465) (MissingVacant!465 (index!4031 (_ BitVec 32))) )
))
(declare-fun lt!83472 () SeekEntryResult!465)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166863 (= res!79335 (inRange!0 (index!4029 lt!83472) (mask!8179 thiss!1248)))))

(declare-fun e!109525 () Bool)

(assert (=> b!166863 (=> (not res!79335) (not e!109525))))

(assert (=> b!166863 e!109525))

(declare-fun b!166864 () Bool)

(declare-fun e!109524 () Bool)

(declare-fun e!109523 () Bool)

(assert (=> b!166864 (= e!109524 e!109523)))

(declare-fun res!79333 () Bool)

(assert (=> b!166864 (=> (not res!79333) (not e!109523))))

(assert (=> b!166864 (= res!79333 (and (not (is-Undefined!465 lt!83472)) (not (is-MissingVacant!465 lt!83472)) (not (is-MissingZero!465 lt!83472)) (is-Found!465 lt!83472)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6655 (_ BitVec 32)) SeekEntryResult!465)

(assert (=> b!166864 (= lt!83472 (seekEntryOrOpen!0 key!828 (_keys!5267 thiss!1248) (mask!8179 thiss!1248)))))

(declare-fun b!166865 () Bool)

(declare-fun res!79329 () Bool)

(declare-fun e!109529 () Bool)

(assert (=> b!166865 (=> (not res!79329) (not e!109529))))

(assert (=> b!166865 (= res!79329 (and (= (size!3452 (_values!3425 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8179 thiss!1248))) (= (size!3451 (_keys!5267 thiss!1248)) (size!3452 (_values!3425 thiss!1248))) (bvsge (mask!8179 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3183 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3183 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166866 () Bool)

(assert (=> b!166866 (= e!109523 e!109529)))

(declare-fun res!79331 () Bool)

(assert (=> b!166866 (=> (not res!79331) (not e!109529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166866 (= res!79331 (validMask!0 (mask!8179 thiss!1248)))))

(declare-fun lt!83471 () Unit!5087)

(assert (=> b!166866 (= lt!83471 e!109522)))

(declare-fun c!30247 () Bool)

(declare-datatypes ((tuple2!3118 0))(
  ( (tuple2!3119 (_1!1570 (_ BitVec 64)) (_2!1570 V!4685)) )
))
(declare-datatypes ((List!2107 0))(
  ( (Nil!2104) (Cons!2103 (h!2720 tuple2!3118) (t!6909 List!2107)) )
))
(declare-datatypes ((ListLongMap!2073 0))(
  ( (ListLongMap!2074 (toList!1052 List!2107)) )
))
(declare-fun contains!1094 (ListLongMap!2073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!710 (array!6655 array!6657 (_ BitVec 32) (_ BitVec 32) V!4685 V!4685 (_ BitVec 32) Int) ListLongMap!2073)

(assert (=> b!166866 (= c!30247 (contains!1094 (getCurrentListMap!710 (_keys!5267 thiss!1248) (_values!3425 thiss!1248) (mask!8179 thiss!1248) (extraKeys!3183 thiss!1248) (zeroValue!3285 thiss!1248) (minValue!3285 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3442 thiss!1248)) key!828))))

(declare-fun res!79330 () Bool)

(assert (=> start!16672 (=> (not res!79330) (not e!109524))))

(declare-fun valid!876 (LongMapFixedSize!2000) Bool)

(assert (=> start!16672 (= res!79330 (valid!876 thiss!1248))))

(assert (=> start!16672 e!109524))

(declare-fun e!109521 () Bool)

(assert (=> start!16672 e!109521))

(assert (=> start!16672 true))

(declare-fun b!166867 () Bool)

(declare-fun Unit!5089 () Unit!5087)

(assert (=> b!166867 (= e!109522 Unit!5089)))

(declare-fun lt!83473 () Unit!5087)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!96 (array!6655 array!6657 (_ BitVec 32) (_ BitVec 32) V!4685 V!4685 (_ BitVec 64) Int) Unit!5087)

(assert (=> b!166867 (= lt!83473 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!96 (_keys!5267 thiss!1248) (_values!3425 thiss!1248) (mask!8179 thiss!1248) (extraKeys!3183 thiss!1248) (zeroValue!3285 thiss!1248) (minValue!3285 thiss!1248) key!828 (defaultEntry!3442 thiss!1248)))))

(assert (=> b!166867 false))

(declare-fun tp_is_empty!3779 () Bool)

(declare-fun e!109527 () Bool)

(declare-fun array_inv!2031 (array!6655) Bool)

(declare-fun array_inv!2032 (array!6657) Bool)

(assert (=> b!166868 (= e!109521 (and tp!14532 tp_is_empty!3779 (array_inv!2031 (_keys!5267 thiss!1248)) (array_inv!2032 (_values!3425 thiss!1248)) e!109527))))

(declare-fun mapNonEmpty!6387 () Bool)

(declare-fun mapRes!6387 () Bool)

(declare-fun tp!14531 () Bool)

(declare-fun e!109520 () Bool)

(assert (=> mapNonEmpty!6387 (= mapRes!6387 (and tp!14531 e!109520))))

(declare-fun mapKey!6387 () (_ BitVec 32))

(declare-fun mapValue!6387 () ValueCell!1546)

(declare-fun mapRest!6387 () (Array (_ BitVec 32) ValueCell!1546))

(assert (=> mapNonEmpty!6387 (= (arr!3164 (_values!3425 thiss!1248)) (store mapRest!6387 mapKey!6387 mapValue!6387))))

(declare-fun mapIsEmpty!6387 () Bool)

(assert (=> mapIsEmpty!6387 mapRes!6387))

(declare-fun b!166869 () Bool)

(declare-fun e!109528 () Bool)

(assert (=> b!166869 (= e!109528 tp_is_empty!3779)))

(declare-fun b!166870 () Bool)

(assert (=> b!166870 (= e!109527 (and e!109528 mapRes!6387))))

(declare-fun condMapEmpty!6387 () Bool)

(declare-fun mapDefault!6387 () ValueCell!1546)

