; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23366 () Bool)

(assert start!23366)

(declare-fun b!245672 () Bool)

(declare-fun b_free!6559 () Bool)

(declare-fun b_next!6559 () Bool)

(assert (=> b!245672 (= b_free!6559 (not b_next!6559))))

(declare-fun tp!22912 () Bool)

(declare-fun b_and!13549 () Bool)

(assert (=> b!245672 (= tp!22912 b_and!13549)))

(declare-fun res!120487 () Bool)

(declare-fun e!159376 () Bool)

(assert (=> start!23366 (=> (not res!120487) (not e!159376))))

(declare-datatypes ((V!8209 0))(
  ( (V!8210 (val!3255 Int)) )
))
(declare-datatypes ((ValueCell!2867 0))(
  ( (ValueCellFull!2867 (v!5308 V!8209)) (EmptyCell!2867) )
))
(declare-datatypes ((array!12141 0))(
  ( (array!12142 (arr!5762 (Array (_ BitVec 32) ValueCell!2867)) (size!6104 (_ BitVec 32))) )
))
(declare-datatypes ((array!12143 0))(
  ( (array!12144 (arr!5763 (Array (_ BitVec 32) (_ BitVec 64))) (size!6105 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3634 0))(
  ( (LongMapFixedSize!3635 (defaultEntry!4546 Int) (mask!10660 (_ BitVec 32)) (extraKeys!4283 (_ BitVec 32)) (zeroValue!4387 V!8209) (minValue!4387 V!8209) (_size!1866 (_ BitVec 32)) (_keys!6661 array!12143) (_values!4529 array!12141) (_vacant!1866 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3634)

(declare-fun valid!1422 (LongMapFixedSize!3634) Bool)

(assert (=> start!23366 (= res!120487 (valid!1422 thiss!1504))))

(assert (=> start!23366 e!159376))

(declare-fun e!159371 () Bool)

(assert (=> start!23366 e!159371))

(assert (=> start!23366 true))

(declare-fun b!245652 () Bool)

(declare-fun res!120484 () Bool)

(declare-datatypes ((SeekEntryResult!1090 0))(
  ( (MissingZero!1090 (index!6530 (_ BitVec 32))) (Found!1090 (index!6531 (_ BitVec 32))) (Intermediate!1090 (undefined!1902 Bool) (index!6532 (_ BitVec 32)) (x!24438 (_ BitVec 32))) (Undefined!1090) (MissingVacant!1090 (index!6533 (_ BitVec 32))) )
))
(declare-fun lt!123029 () SeekEntryResult!1090)

(assert (=> b!245652 (= res!120484 (= (select (arr!5763 (_keys!6661 thiss!1504)) (index!6533 lt!123029)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159381 () Bool)

(assert (=> b!245652 (=> (not res!120484) (not e!159381))))

(declare-fun b!245653 () Bool)

(declare-fun call!22944 () Bool)

(assert (=> b!245653 (= e!159381 (not call!22944))))

(declare-fun b!245654 () Bool)

(declare-fun e!159372 () Bool)

(assert (=> b!245654 (= e!159376 e!159372)))

(declare-fun res!120483 () Bool)

(assert (=> b!245654 (=> (not res!120483) (not e!159372))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!245654 (= res!120483 (or (= lt!123029 (MissingZero!1090 index!297)) (= lt!123029 (MissingVacant!1090 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12143 (_ BitVec 32)) SeekEntryResult!1090)

(assert (=> b!245654 (= lt!123029 (seekEntryOrOpen!0 key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(declare-fun mapNonEmpty!10894 () Bool)

(declare-fun mapRes!10894 () Bool)

(declare-fun tp!22911 () Bool)

(declare-fun e!159370 () Bool)

(assert (=> mapNonEmpty!10894 (= mapRes!10894 (and tp!22911 e!159370))))

(declare-fun mapKey!10894 () (_ BitVec 32))

(declare-fun mapValue!10894 () ValueCell!2867)

(declare-fun mapRest!10894 () (Array (_ BitVec 32) ValueCell!2867))

(assert (=> mapNonEmpty!10894 (= (arr!5762 (_values!4529 thiss!1504)) (store mapRest!10894 mapKey!10894 mapValue!10894))))

(declare-fun b!245655 () Bool)

(declare-fun c!41033 () Bool)

(assert (=> b!245655 (= c!41033 (is-MissingVacant!1090 lt!123029))))

(declare-fun e!159374 () Bool)

(declare-fun e!159380 () Bool)

(assert (=> b!245655 (= e!159374 e!159380)))

(declare-fun b!245656 () Bool)

(declare-fun e!159369 () Bool)

(declare-fun tp_is_empty!6421 () Bool)

(assert (=> b!245656 (= e!159369 tp_is_empty!6421)))

(declare-fun b!245657 () Bool)

(assert (=> b!245657 (= e!159380 (is-Undefined!1090 lt!123029))))

(declare-fun call!22945 () Bool)

(declare-fun c!41032 () Bool)

(declare-fun bm!22941 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22941 (= call!22945 (inRange!0 (ite c!41032 (index!6530 lt!123029) (index!6533 lt!123029)) (mask!10660 thiss!1504)))))

(declare-fun b!245658 () Bool)

(declare-fun e!159375 () Bool)

(assert (=> b!245658 (= e!159375 (not call!22944))))

(declare-fun b!245659 () Bool)

(declare-fun e!159368 () Bool)

(assert (=> b!245659 (= e!159368 (and e!159369 mapRes!10894))))

(declare-fun condMapEmpty!10894 () Bool)

(declare-fun mapDefault!10894 () ValueCell!2867)

