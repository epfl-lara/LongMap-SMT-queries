; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22066 () Bool)

(assert start!22066)

(declare-fun b!228525 () Bool)

(declare-fun b_free!6133 () Bool)

(declare-fun b_next!6133 () Bool)

(assert (=> b!228525 (= b_free!6133 (not b_next!6133))))

(declare-fun tp!21540 () Bool)

(declare-fun b_and!13031 () Bool)

(assert (=> b!228525 (= tp!21540 b_and!13031)))

(declare-fun b!228504 () Bool)

(declare-datatypes ((Unit!6951 0))(
  ( (Unit!6952) )
))
(declare-fun e!148258 () Unit!6951)

(declare-fun lt!114962 () Unit!6951)

(assert (=> b!228504 (= e!148258 lt!114962)))

(declare-datatypes ((V!7641 0))(
  ( (V!7642 (val!3042 Int)) )
))
(declare-datatypes ((ValueCell!2654 0))(
  ( (ValueCellFull!2654 (v!5062 V!7641)) (EmptyCell!2654) )
))
(declare-datatypes ((array!11233 0))(
  ( (array!11234 (arr!5336 (Array (_ BitVec 32) ValueCell!2654)) (size!5669 (_ BitVec 32))) )
))
(declare-datatypes ((array!11235 0))(
  ( (array!11236 (arr!5337 (Array (_ BitVec 32) (_ BitVec 64))) (size!5670 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3208 0))(
  ( (LongMapFixedSize!3209 (defaultEntry!4263 Int) (mask!10135 (_ BitVec 32)) (extraKeys!4000 (_ BitVec 32)) (zeroValue!4104 V!7641) (minValue!4104 V!7641) (_size!1653 (_ BitVec 32)) (_keys!6317 array!11235) (_values!4246 array!11233) (_vacant!1653 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3208)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!287 (array!11235 array!11233 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 64) Int) Unit!6951)

(assert (=> b!228504 (= lt!114962 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!287 (_keys!6317 thiss!1504) (_values!4246 thiss!1504) (mask!10135 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) key!932 (defaultEntry!4263 thiss!1504)))))

(declare-fun c!37893 () Bool)

(declare-datatypes ((SeekEntryResult!908 0))(
  ( (MissingZero!908 (index!5802 (_ BitVec 32))) (Found!908 (index!5803 (_ BitVec 32))) (Intermediate!908 (undefined!1720 Bool) (index!5804 (_ BitVec 32)) (x!23336 (_ BitVec 32))) (Undefined!908) (MissingVacant!908 (index!5805 (_ BitVec 32))) )
))
(declare-fun lt!114959 () SeekEntryResult!908)

(assert (=> b!228504 (= c!37893 (is-MissingZero!908 lt!114959))))

(declare-fun e!148254 () Bool)

(assert (=> b!228504 e!148254))

(declare-fun b!228505 () Bool)

(declare-fun e!148255 () Bool)

(assert (=> b!228505 (= e!148255 true)))

(declare-fun lt!114958 () Bool)

(declare-datatypes ((List!3412 0))(
  ( (Nil!3409) (Cons!3408 (h!4056 (_ BitVec 64)) (t!8371 List!3412)) )
))
(declare-fun arrayNoDuplicates!0 (array!11235 (_ BitVec 32) List!3412) Bool)

(assert (=> b!228505 (= lt!114958 (arrayNoDuplicates!0 (_keys!6317 thiss!1504) #b00000000000000000000000000000000 Nil!3409))))

(declare-fun b!228506 () Bool)

(declare-fun e!148253 () Bool)

(declare-fun tp_is_empty!5995 () Bool)

(assert (=> b!228506 (= e!148253 tp_is_empty!5995)))

(declare-fun b!228507 () Bool)

(declare-fun e!148246 () Bool)

(declare-fun e!148259 () Bool)

(assert (=> b!228507 (= e!148246 e!148259)))

(declare-fun res!112477 () Bool)

(assert (=> b!228507 (=> (not res!112477) (not e!148259))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228507 (= res!112477 (inRange!0 index!297 (mask!10135 thiss!1504)))))

(declare-fun lt!114963 () Unit!6951)

(assert (=> b!228507 (= lt!114963 e!148258)))

(declare-fun c!37895 () Bool)

(declare-datatypes ((tuple2!4490 0))(
  ( (tuple2!4491 (_1!2256 (_ BitVec 64)) (_2!2256 V!7641)) )
))
(declare-datatypes ((List!3413 0))(
  ( (Nil!3410) (Cons!3409 (h!4057 tuple2!4490) (t!8372 List!3413)) )
))
(declare-datatypes ((ListLongMap!3403 0))(
  ( (ListLongMap!3404 (toList!1717 List!3413)) )
))
(declare-fun contains!1591 (ListLongMap!3403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1245 (array!11235 array!11233 (_ BitVec 32) (_ BitVec 32) V!7641 V!7641 (_ BitVec 32) Int) ListLongMap!3403)

(assert (=> b!228507 (= c!37895 (contains!1591 (getCurrentListMap!1245 (_keys!6317 thiss!1504) (_values!4246 thiss!1504) (mask!10135 thiss!1504) (extraKeys!4000 thiss!1504) (zeroValue!4104 thiss!1504) (minValue!4104 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4263 thiss!1504)) key!932))))

(declare-fun b!228508 () Bool)

(declare-fun c!37894 () Bool)

(assert (=> b!228508 (= c!37894 (is-MissingVacant!908 lt!114959))))

(declare-fun e!148257 () Bool)

(assert (=> b!228508 (= e!148254 e!148257)))

(declare-fun b!228509 () Bool)

(declare-fun e!148248 () Bool)

(declare-fun mapRes!10162 () Bool)

(assert (=> b!228509 (= e!148248 (and e!148253 mapRes!10162))))

(declare-fun condMapEmpty!10162 () Bool)

(declare-fun mapDefault!10162 () ValueCell!2654)

