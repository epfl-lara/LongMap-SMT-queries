; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16524 () Bool)

(assert start!16524)

(declare-fun b!164323 () Bool)

(declare-fun b_free!3829 () Bool)

(declare-fun b_next!3829 () Bool)

(assert (=> b!164323 (= b_free!3829 (not b_next!3829))))

(declare-fun tp!14087 () Bool)

(declare-fun b_and!10243 () Bool)

(assert (=> b!164323 (= tp!14087 b_and!10243)))

(declare-fun b!164315 () Bool)

(declare-fun e!107810 () Bool)

(declare-fun e!107812 () Bool)

(assert (=> b!164315 (= e!107810 e!107812)))

(declare-fun res!77780 () Bool)

(assert (=> b!164315 (=> (not res!77780) (not e!107812))))

(declare-datatypes ((SeekEntryResult!413 0))(
  ( (MissingZero!413 (index!3820 (_ BitVec 32))) (Found!413 (index!3821 (_ BitVec 32))) (Intermediate!413 (undefined!1225 Bool) (index!3822 (_ BitVec 32)) (x!18225 (_ BitVec 32))) (Undefined!413) (MissingVacant!413 (index!3823 (_ BitVec 32))) )
))
(declare-fun lt!82867 () SeekEntryResult!413)

(assert (=> b!164315 (= res!77780 (and (not (is-Undefined!413 lt!82867)) (not (is-MissingVacant!413 lt!82867)) (not (is-MissingZero!413 lt!82867)) (is-Found!413 lt!82867)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4489 0))(
  ( (V!4490 (val!1860 Int)) )
))
(declare-datatypes ((ValueCell!1472 0))(
  ( (ValueCellFull!1472 (v!3725 V!4489)) (EmptyCell!1472) )
))
(declare-datatypes ((array!6359 0))(
  ( (array!6360 (arr!3015 (Array (_ BitVec 32) (_ BitVec 64))) (size!3303 (_ BitVec 32))) )
))
(declare-datatypes ((array!6361 0))(
  ( (array!6362 (arr!3016 (Array (_ BitVec 32) ValueCell!1472)) (size!3304 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1852 0))(
  ( (LongMapFixedSize!1853 (defaultEntry!3368 Int) (mask!8057 (_ BitVec 32)) (extraKeys!3109 (_ BitVec 32)) (zeroValue!3211 V!4489) (minValue!3211 V!4489) (_size!975 (_ BitVec 32)) (_keys!5193 array!6359) (_values!3351 array!6361) (_vacant!975 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1852)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6359 (_ BitVec 32)) SeekEntryResult!413)

(assert (=> b!164315 (= lt!82867 (seekEntryOrOpen!0 key!828 (_keys!5193 thiss!1248) (mask!8057 thiss!1248)))))

(declare-fun b!164316 () Bool)

(declare-fun res!77775 () Bool)

(assert (=> b!164316 (=> (not res!77775) (not e!107812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164316 (= res!77775 (validMask!0 (mask!8057 thiss!1248)))))

(declare-fun res!77777 () Bool)

(assert (=> start!16524 (=> (not res!77777) (not e!107810))))

(declare-fun valid!824 (LongMapFixedSize!1852) Bool)

(assert (=> start!16524 (= res!77777 (valid!824 thiss!1248))))

(assert (=> start!16524 e!107810))

(declare-fun e!107808 () Bool)

(assert (=> start!16524 e!107808))

(assert (=> start!16524 true))

(declare-fun b!164317 () Bool)

(declare-fun res!77779 () Bool)

(assert (=> b!164317 (=> (not res!77779) (not e!107812))))

(declare-datatypes ((tuple2!3018 0))(
  ( (tuple2!3019 (_1!1520 (_ BitVec 64)) (_2!1520 V!4489)) )
))
(declare-datatypes ((List!2001 0))(
  ( (Nil!1998) (Cons!1997 (h!2614 tuple2!3018) (t!6803 List!2001)) )
))
(declare-datatypes ((ListLongMap!1973 0))(
  ( (ListLongMap!1974 (toList!1002 List!2001)) )
))
(declare-fun contains!1044 (ListLongMap!1973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!660 (array!6359 array!6361 (_ BitVec 32) (_ BitVec 32) V!4489 V!4489 (_ BitVec 32) Int) ListLongMap!1973)

(assert (=> b!164317 (= res!77779 (contains!1044 (getCurrentListMap!660 (_keys!5193 thiss!1248) (_values!3351 thiss!1248) (mask!8057 thiss!1248) (extraKeys!3109 thiss!1248) (zeroValue!3211 thiss!1248) (minValue!3211 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3368 thiss!1248)) key!828))))

(declare-fun b!164318 () Bool)

(declare-fun res!77776 () Bool)

(assert (=> b!164318 (=> (not res!77776) (not e!107810))))

(assert (=> b!164318 (= res!77776 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164319 () Bool)

(declare-fun e!107813 () Bool)

(declare-fun e!107809 () Bool)

(declare-fun mapRes!6165 () Bool)

(assert (=> b!164319 (= e!107813 (and e!107809 mapRes!6165))))

(declare-fun condMapEmpty!6165 () Bool)

(declare-fun mapDefault!6165 () ValueCell!1472)

