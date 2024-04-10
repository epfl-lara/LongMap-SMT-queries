; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22502 () Bool)

(assert start!22502)

(declare-fun b!235266 () Bool)

(declare-fun b_free!6325 () Bool)

(declare-fun b_next!6325 () Bool)

(assert (=> b!235266 (= b_free!6325 (not b_next!6325))))

(declare-fun tp!22141 () Bool)

(declare-fun b_and!13253 () Bool)

(assert (=> b!235266 (= tp!22141 b_and!13253)))

(declare-fun b!235259 () Bool)

(declare-fun res!115365 () Bool)

(declare-fun e!152790 () Bool)

(assert (=> b!235259 (=> (not res!115365) (not e!152790))))

(declare-datatypes ((V!7897 0))(
  ( (V!7898 (val!3138 Int)) )
))
(declare-datatypes ((ValueCell!2750 0))(
  ( (ValueCellFull!2750 (v!5165 V!7897)) (EmptyCell!2750) )
))
(declare-datatypes ((array!11631 0))(
  ( (array!11632 (arr!5528 (Array (_ BitVec 32) ValueCell!2750)) (size!5865 (_ BitVec 32))) )
))
(declare-datatypes ((array!11633 0))(
  ( (array!11634 (arr!5529 (Array (_ BitVec 32) (_ BitVec 64))) (size!5866 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3400 0))(
  ( (LongMapFixedSize!3401 (defaultEntry!4370 Int) (mask!10337 (_ BitVec 32)) (extraKeys!4107 (_ BitVec 32)) (zeroValue!4211 V!7897) (minValue!4211 V!7897) (_size!1749 (_ BitVec 32)) (_keys!6444 array!11633) (_values!4353 array!11631) (_vacant!1749 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3400)

(assert (=> b!235259 (= res!115365 (and (= (size!5865 (_values!4353 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10337 thiss!1504))) (= (size!5866 (_keys!6444 thiss!1504)) (size!5865 (_values!4353 thiss!1504))) (bvsge (mask!10337 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4107 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4107 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235260 () Bool)

(declare-datatypes ((List!3532 0))(
  ( (Nil!3529) (Cons!3528 (h!4180 (_ BitVec 64)) (t!8505 List!3532)) )
))
(declare-fun arrayNoDuplicates!0 (array!11633 (_ BitVec 32) List!3532) Bool)

(assert (=> b!235260 (= e!152790 (not (arrayNoDuplicates!0 (_keys!6444 thiss!1504) #b00000000000000000000000000000000 Nil!3529)))))

(declare-fun b!235261 () Bool)

(declare-fun res!115359 () Bool)

(declare-fun e!152792 () Bool)

(assert (=> b!235261 (=> (not res!115359) (not e!152792))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!235261 (= res!115359 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10475 () Bool)

(declare-fun mapRes!10475 () Bool)

(declare-fun tp!22142 () Bool)

(declare-fun e!152791 () Bool)

(assert (=> mapNonEmpty!10475 (= mapRes!10475 (and tp!22142 e!152791))))

(declare-fun mapValue!10475 () ValueCell!2750)

(declare-fun mapKey!10475 () (_ BitVec 32))

(declare-fun mapRest!10475 () (Array (_ BitVec 32) ValueCell!2750))

(assert (=> mapNonEmpty!10475 (= (arr!5528 (_values!4353 thiss!1504)) (store mapRest!10475 mapKey!10475 mapValue!10475))))

(declare-fun b!235262 () Bool)

(declare-fun res!115362 () Bool)

(assert (=> b!235262 (=> (not res!115362) (not e!152790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235262 (= res!115362 (validMask!0 (mask!10337 thiss!1504)))))

(declare-fun b!235263 () Bool)

(assert (=> b!235263 (= e!152792 e!152790)))

(declare-fun res!115361 () Bool)

(assert (=> b!235263 (=> (not res!115361) (not e!152790))))

(declare-datatypes ((SeekEntryResult!986 0))(
  ( (MissingZero!986 (index!6114 (_ BitVec 32))) (Found!986 (index!6115 (_ BitVec 32))) (Intermediate!986 (undefined!1798 Bool) (index!6116 (_ BitVec 32)) (x!23772 (_ BitVec 32))) (Undefined!986) (MissingVacant!986 (index!6117 (_ BitVec 32))) )
))
(declare-fun lt!119029 () SeekEntryResult!986)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235263 (= res!115361 (or (= lt!119029 (MissingZero!986 index!297)) (= lt!119029 (MissingVacant!986 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11633 (_ BitVec 32)) SeekEntryResult!986)

(assert (=> b!235263 (= lt!119029 (seekEntryOrOpen!0 key!932 (_keys!6444 thiss!1504) (mask!10337 thiss!1504)))))

(declare-fun b!235264 () Bool)

(declare-fun res!115363 () Bool)

(assert (=> b!235264 (=> (not res!115363) (not e!152790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11633 (_ BitVec 32)) Bool)

(assert (=> b!235264 (= res!115363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6444 thiss!1504) (mask!10337 thiss!1504)))))

(declare-fun b!235265 () Bool)

(declare-fun e!152789 () Bool)

(declare-fun tp_is_empty!6187 () Bool)

(assert (=> b!235265 (= e!152789 tp_is_empty!6187)))

(declare-fun e!152793 () Bool)

(declare-fun e!152794 () Bool)

(declare-fun array_inv!3645 (array!11633) Bool)

(declare-fun array_inv!3646 (array!11631) Bool)

(assert (=> b!235266 (= e!152794 (and tp!22141 tp_is_empty!6187 (array_inv!3645 (_keys!6444 thiss!1504)) (array_inv!3646 (_values!4353 thiss!1504)) e!152793))))

(declare-fun b!235267 () Bool)

(declare-fun res!115364 () Bool)

(assert (=> b!235267 (=> (not res!115364) (not e!152790))))

(declare-datatypes ((tuple2!4624 0))(
  ( (tuple2!4625 (_1!2323 (_ BitVec 64)) (_2!2323 V!7897)) )
))
(declare-datatypes ((List!3533 0))(
  ( (Nil!3530) (Cons!3529 (h!4181 tuple2!4624) (t!8506 List!3533)) )
))
(declare-datatypes ((ListLongMap!3537 0))(
  ( (ListLongMap!3538 (toList!1784 List!3533)) )
))
(declare-fun contains!1660 (ListLongMap!3537 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1312 (array!11633 array!11631 (_ BitVec 32) (_ BitVec 32) V!7897 V!7897 (_ BitVec 32) Int) ListLongMap!3537)

(assert (=> b!235267 (= res!115364 (contains!1660 (getCurrentListMap!1312 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)) key!932))))

(declare-fun res!115360 () Bool)

(assert (=> start!22502 (=> (not res!115360) (not e!152792))))

(declare-fun valid!1342 (LongMapFixedSize!3400) Bool)

(assert (=> start!22502 (= res!115360 (valid!1342 thiss!1504))))

(assert (=> start!22502 e!152792))

(assert (=> start!22502 e!152794))

(assert (=> start!22502 true))

(declare-fun mapIsEmpty!10475 () Bool)

(assert (=> mapIsEmpty!10475 mapRes!10475))

(declare-fun b!235268 () Bool)

(assert (=> b!235268 (= e!152791 tp_is_empty!6187)))

(declare-fun b!235269 () Bool)

(assert (=> b!235269 (= e!152793 (and e!152789 mapRes!10475))))

(declare-fun condMapEmpty!10475 () Bool)

(declare-fun mapDefault!10475 () ValueCell!2750)

