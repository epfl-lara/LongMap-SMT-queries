; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22530 () Bool)

(assert start!22530)

(declare-fun b!235560 () Bool)

(declare-fun b_free!6335 () Bool)

(declare-fun b_next!6335 () Bool)

(assert (=> b!235560 (= b_free!6335 (not b_next!6335))))

(declare-fun tp!22174 () Bool)

(declare-fun b_and!13265 () Bool)

(assert (=> b!235560 (= tp!22174 b_and!13265)))

(declare-datatypes ((V!7909 0))(
  ( (V!7910 (val!3143 Int)) )
))
(declare-datatypes ((ValueCell!2755 0))(
  ( (ValueCellFull!2755 (v!5171 V!7909)) (EmptyCell!2755) )
))
(declare-datatypes ((array!11653 0))(
  ( (array!11654 (arr!5538 (Array (_ BitVec 32) ValueCell!2755)) (size!5875 (_ BitVec 32))) )
))
(declare-datatypes ((array!11655 0))(
  ( (array!11656 (arr!5539 (Array (_ BitVec 32) (_ BitVec 64))) (size!5876 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3410 0))(
  ( (LongMapFixedSize!3411 (defaultEntry!4376 Int) (mask!10348 (_ BitVec 32)) (extraKeys!4113 (_ BitVec 32)) (zeroValue!4217 V!7909) (minValue!4217 V!7909) (_size!1754 (_ BitVec 32)) (_keys!6452 array!11655) (_values!4359 array!11653) (_vacant!1754 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3410)

(declare-fun e!152982 () Bool)

(declare-fun tp_is_empty!6197 () Bool)

(declare-fun e!152983 () Bool)

(declare-fun array_inv!3655 (array!11655) Bool)

(declare-fun array_inv!3656 (array!11653) Bool)

(assert (=> b!235560 (= e!152982 (and tp!22174 tp_is_empty!6197 (array_inv!3655 (_keys!6452 thiss!1504)) (array_inv!3656 (_values!4359 thiss!1504)) e!152983))))

(declare-fun b!235561 () Bool)

(declare-fun res!115524 () Bool)

(declare-fun e!152981 () Bool)

(assert (=> b!235561 (=> (not res!115524) (not e!152981))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!235561 (= res!115524 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235562 () Bool)

(declare-fun e!152979 () Bool)

(assert (=> b!235562 (= e!152979 false)))

(declare-fun lt!119149 () Bool)

(declare-datatypes ((List!3541 0))(
  ( (Nil!3538) (Cons!3537 (h!4189 (_ BitVec 64)) (t!8516 List!3541)) )
))
(declare-fun arrayNoDuplicates!0 (array!11655 (_ BitVec 32) List!3541) Bool)

(assert (=> b!235562 (= lt!119149 (arrayNoDuplicates!0 (_keys!6452 thiss!1504) #b00000000000000000000000000000000 Nil!3538))))

(declare-fun b!235563 () Bool)

(declare-fun e!152977 () Bool)

(assert (=> b!235563 (= e!152977 tp_is_empty!6197)))

(declare-fun b!235564 () Bool)

(declare-fun res!115523 () Bool)

(assert (=> b!235564 (=> (not res!115523) (not e!152979))))

(declare-datatypes ((tuple2!4632 0))(
  ( (tuple2!4633 (_1!2327 (_ BitVec 64)) (_2!2327 V!7909)) )
))
(declare-datatypes ((List!3542 0))(
  ( (Nil!3539) (Cons!3538 (h!4190 tuple2!4632) (t!8517 List!3542)) )
))
(declare-datatypes ((ListLongMap!3545 0))(
  ( (ListLongMap!3546 (toList!1788 List!3542)) )
))
(declare-fun contains!1665 (ListLongMap!3545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1316 (array!11655 array!11653 (_ BitVec 32) (_ BitVec 32) V!7909 V!7909 (_ BitVec 32) Int) ListLongMap!3545)

(assert (=> b!235564 (= res!115523 (contains!1665 (getCurrentListMap!1316 (_keys!6452 thiss!1504) (_values!4359 thiss!1504) (mask!10348 thiss!1504) (extraKeys!4113 thiss!1504) (zeroValue!4217 thiss!1504) (minValue!4217 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4376 thiss!1504)) key!932))))

(declare-fun b!235565 () Bool)

(declare-fun res!115518 () Bool)

(assert (=> b!235565 (=> (not res!115518) (not e!152979))))

(assert (=> b!235565 (= res!115518 (and (= (size!5875 (_values!4359 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10348 thiss!1504))) (= (size!5876 (_keys!6452 thiss!1504)) (size!5875 (_values!4359 thiss!1504))) (bvsge (mask!10348 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4113 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4113 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235566 () Bool)

(declare-fun res!115520 () Bool)

(assert (=> b!235566 (=> (not res!115520) (not e!152979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11655 (_ BitVec 32)) Bool)

(assert (=> b!235566 (= res!115520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6452 thiss!1504) (mask!10348 thiss!1504)))))

(declare-fun b!235568 () Bool)

(declare-fun e!152978 () Bool)

(assert (=> b!235568 (= e!152978 tp_is_empty!6197)))

(declare-fun mapIsEmpty!10493 () Bool)

(declare-fun mapRes!10493 () Bool)

(assert (=> mapIsEmpty!10493 mapRes!10493))

(declare-fun b!235567 () Bool)

(assert (=> b!235567 (= e!152981 e!152979)))

(declare-fun res!115519 () Bool)

(assert (=> b!235567 (=> (not res!115519) (not e!152979))))

(declare-datatypes ((SeekEntryResult!991 0))(
  ( (MissingZero!991 (index!6134 (_ BitVec 32))) (Found!991 (index!6135 (_ BitVec 32))) (Intermediate!991 (undefined!1803 Bool) (index!6136 (_ BitVec 32)) (x!23795 (_ BitVec 32))) (Undefined!991) (MissingVacant!991 (index!6137 (_ BitVec 32))) )
))
(declare-fun lt!119148 () SeekEntryResult!991)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235567 (= res!115519 (or (= lt!119148 (MissingZero!991 index!297)) (= lt!119148 (MissingVacant!991 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11655 (_ BitVec 32)) SeekEntryResult!991)

(assert (=> b!235567 (= lt!119148 (seekEntryOrOpen!0 key!932 (_keys!6452 thiss!1504) (mask!10348 thiss!1504)))))

(declare-fun res!115521 () Bool)

(assert (=> start!22530 (=> (not res!115521) (not e!152981))))

(declare-fun valid!1347 (LongMapFixedSize!3410) Bool)

(assert (=> start!22530 (= res!115521 (valid!1347 thiss!1504))))

(assert (=> start!22530 e!152981))

(assert (=> start!22530 e!152982))

(assert (=> start!22530 true))

(declare-fun b!235569 () Bool)

(assert (=> b!235569 (= e!152983 (and e!152977 mapRes!10493))))

(declare-fun condMapEmpty!10493 () Bool)

(declare-fun mapDefault!10493 () ValueCell!2755)

