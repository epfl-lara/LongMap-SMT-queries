; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23114 () Bool)

(assert start!23114)

(declare-fun b!242317 () Bool)

(declare-fun b_free!6505 () Bool)

(declare-fun b_next!6505 () Bool)

(assert (=> b!242317 (= b_free!6505 (not b_next!6505))))

(declare-fun tp!22728 () Bool)

(declare-fun b_and!13481 () Bool)

(assert (=> b!242317 (= tp!22728 b_and!13481)))

(declare-fun b!242303 () Bool)

(declare-fun e!157269 () Bool)

(declare-fun e!157256 () Bool)

(assert (=> b!242303 (= e!157269 e!157256)))

(declare-fun res!118725 () Bool)

(assert (=> b!242303 (=> (not res!118725) (not e!157256))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8137 0))(
  ( (V!8138 (val!3228 Int)) )
))
(declare-datatypes ((ValueCell!2840 0))(
  ( (ValueCellFull!2840 (v!5269 V!8137)) (EmptyCell!2840) )
))
(declare-datatypes ((array!12019 0))(
  ( (array!12020 (arr!5708 (Array (_ BitVec 32) ValueCell!2840)) (size!6050 (_ BitVec 32))) )
))
(declare-datatypes ((array!12021 0))(
  ( (array!12022 (arr!5709 (Array (_ BitVec 32) (_ BitVec 64))) (size!6051 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3580 0))(
  ( (LongMapFixedSize!3581 (defaultEntry!4491 Int) (mask!10572 (_ BitVec 32)) (extraKeys!4228 (_ BitVec 32)) (zeroValue!4332 V!8137) (minValue!4332 V!8137) (_size!1839 (_ BitVec 32)) (_keys!6599 array!12021) (_values!4474 array!12019) (_vacant!1839 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3580)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242303 (= res!118725 (inRange!0 index!297 (mask!10572 thiss!1504)))))

(declare-datatypes ((Unit!7471 0))(
  ( (Unit!7472) )
))
(declare-fun lt!121735 () Unit!7471)

(declare-fun e!157264 () Unit!7471)

(assert (=> b!242303 (= lt!121735 e!157264)))

(declare-fun c!40433 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4756 0))(
  ( (tuple2!4757 (_1!2389 (_ BitVec 64)) (_2!2389 V!8137)) )
))
(declare-datatypes ((List!3633 0))(
  ( (Nil!3630) (Cons!3629 (h!4286 tuple2!4756) (t!8634 List!3633)) )
))
(declare-datatypes ((ListLongMap!3669 0))(
  ( (ListLongMap!3670 (toList!1850 List!3633)) )
))
(declare-fun contains!1741 (ListLongMap!3669 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1378 (array!12021 array!12019 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 32) Int) ListLongMap!3669)

(assert (=> b!242303 (= c!40433 (contains!1741 (getCurrentListMap!1378 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) key!932))))

(declare-fun b!242305 () Bool)

(declare-fun e!157258 () Bool)

(declare-fun e!157267 () Bool)

(declare-fun mapRes!10792 () Bool)

(assert (=> b!242305 (= e!157258 (and e!157267 mapRes!10792))))

(declare-fun condMapEmpty!10792 () Bool)

(declare-fun mapDefault!10792 () ValueCell!2840)

