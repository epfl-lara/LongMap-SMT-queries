; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17726 () Bool)

(assert start!17726)

(declare-fun b!177211 () Bool)

(declare-fun b_free!4379 () Bool)

(declare-fun b_next!4379 () Bool)

(assert (=> b!177211 (= b_free!4379 (not b_next!4379))))

(declare-fun tp!15836 () Bool)

(declare-fun b_and!10879 () Bool)

(assert (=> b!177211 (= tp!15836 b_and!10879)))

(declare-fun b!177208 () Bool)

(declare-fun res!84002 () Bool)

(declare-fun e!116860 () Bool)

(assert (=> b!177208 (=> (not res!84002) (not e!116860))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!177208 (= res!84002 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177209 () Bool)

(declare-fun res!84005 () Bool)

(assert (=> b!177209 (=> (not res!84005) (not e!116860))))

(declare-datatypes ((V!5181 0))(
  ( (V!5182 (val!2120 Int)) )
))
(declare-datatypes ((ValueCell!1732 0))(
  ( (ValueCellFull!1732 (v!4000 V!5181)) (EmptyCell!1732) )
))
(declare-datatypes ((array!7453 0))(
  ( (array!7454 (arr!3535 (Array (_ BitVec 32) (_ BitVec 64))) (size!3839 (_ BitVec 32))) )
))
(declare-datatypes ((array!7455 0))(
  ( (array!7456 (arr!3536 (Array (_ BitVec 32) ValueCell!1732)) (size!3840 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2372 0))(
  ( (LongMapFixedSize!2373 (defaultEntry!3649 Int) (mask!8583 (_ BitVec 32)) (extraKeys!3386 (_ BitVec 32)) (zeroValue!3490 V!5181) (minValue!3490 V!5181) (_size!1235 (_ BitVec 32)) (_keys!5516 array!7453) (_values!3632 array!7455) (_vacant!1235 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2372)

(declare-datatypes ((SeekEntryResult!565 0))(
  ( (MissingZero!565 (index!4428 (_ BitVec 32))) (Found!565 (index!4429 (_ BitVec 32))) (Intermediate!565 (undefined!1377 Bool) (index!4430 (_ BitVec 32)) (x!19437 (_ BitVec 32))) (Undefined!565) (MissingVacant!565 (index!4431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7453 (_ BitVec 32)) SeekEntryResult!565)

(assert (=> b!177209 (= res!84005 (is-Undefined!565 (seekEntryOrOpen!0 key!828 (_keys!5516 thiss!1248) (mask!8583 thiss!1248))))))

(declare-fun b!177210 () Bool)

(assert (=> b!177210 (= e!116860 (not true))))

(assert (=> b!177210 false))

(declare-datatypes ((Unit!5418 0))(
  ( (Unit!5419) )
))
(declare-fun lt!87585 () Unit!5418)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!137 (array!7453 array!7455 (_ BitVec 32) (_ BitVec 32) V!5181 V!5181 (_ BitVec 64) Int) Unit!5418)

(assert (=> b!177210 (= lt!87585 (lemmaInListMapThenSeekEntryOrOpenFindsIt!137 (_keys!5516 thiss!1248) (_values!3632 thiss!1248) (mask!8583 thiss!1248) (extraKeys!3386 thiss!1248) (zeroValue!3490 thiss!1248) (minValue!3490 thiss!1248) key!828 (defaultEntry!3649 thiss!1248)))))

(declare-fun mapIsEmpty!7089 () Bool)

(declare-fun mapRes!7089 () Bool)

(assert (=> mapIsEmpty!7089 mapRes!7089))

(declare-fun e!116864 () Bool)

(declare-fun e!116861 () Bool)

(declare-fun tp_is_empty!4151 () Bool)

(declare-fun array_inv!2267 (array!7453) Bool)

(declare-fun array_inv!2268 (array!7455) Bool)

(assert (=> b!177211 (= e!116861 (and tp!15836 tp_is_empty!4151 (array_inv!2267 (_keys!5516 thiss!1248)) (array_inv!2268 (_values!3632 thiss!1248)) e!116864))))

(declare-fun b!177212 () Bool)

(declare-fun e!116863 () Bool)

(assert (=> b!177212 (= e!116863 tp_is_empty!4151)))

(declare-fun b!177213 () Bool)

(declare-fun res!84004 () Bool)

(assert (=> b!177213 (=> (not res!84004) (not e!116860))))

(declare-datatypes ((tuple2!3302 0))(
  ( (tuple2!3303 (_1!1662 (_ BitVec 64)) (_2!1662 V!5181)) )
))
(declare-datatypes ((List!2252 0))(
  ( (Nil!2249) (Cons!2248 (h!2869 tuple2!3302) (t!7082 List!2252)) )
))
(declare-datatypes ((ListLongMap!2229 0))(
  ( (ListLongMap!2230 (toList!1130 List!2252)) )
))
(declare-fun contains!1196 (ListLongMap!2229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!782 (array!7453 array!7455 (_ BitVec 32) (_ BitVec 32) V!5181 V!5181 (_ BitVec 32) Int) ListLongMap!2229)

(assert (=> b!177213 (= res!84004 (contains!1196 (getCurrentListMap!782 (_keys!5516 thiss!1248) (_values!3632 thiss!1248) (mask!8583 thiss!1248) (extraKeys!3386 thiss!1248) (zeroValue!3490 thiss!1248) (minValue!3490 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3649 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7089 () Bool)

(declare-fun tp!15837 () Bool)

(assert (=> mapNonEmpty!7089 (= mapRes!7089 (and tp!15837 e!116863))))

(declare-fun mapValue!7089 () ValueCell!1732)

(declare-fun mapKey!7089 () (_ BitVec 32))

(declare-fun mapRest!7089 () (Array (_ BitVec 32) ValueCell!1732))

(assert (=> mapNonEmpty!7089 (= (arr!3536 (_values!3632 thiss!1248)) (store mapRest!7089 mapKey!7089 mapValue!7089))))

(declare-fun res!84003 () Bool)

(assert (=> start!17726 (=> (not res!84003) (not e!116860))))

(declare-fun valid!995 (LongMapFixedSize!2372) Bool)

(assert (=> start!17726 (= res!84003 (valid!995 thiss!1248))))

(assert (=> start!17726 e!116860))

(assert (=> start!17726 e!116861))

(assert (=> start!17726 true))

(declare-fun b!177214 () Bool)

(declare-fun e!116859 () Bool)

(assert (=> b!177214 (= e!116859 tp_is_empty!4151)))

(declare-fun b!177215 () Bool)

(assert (=> b!177215 (= e!116864 (and e!116859 mapRes!7089))))

(declare-fun condMapEmpty!7089 () Bool)

(declare-fun mapDefault!7089 () ValueCell!1732)

