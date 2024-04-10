; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22532 () Bool)

(assert start!22532)

(declare-fun b!235603 () Bool)

(declare-fun b_free!6337 () Bool)

(declare-fun b_next!6337 () Bool)

(assert (=> b!235603 (= b_free!6337 (not b_next!6337))))

(declare-fun tp!22180 () Bool)

(declare-fun b_and!13267 () Bool)

(assert (=> b!235603 (= tp!22180 b_and!13267)))

(declare-fun b!235595 () Bool)

(declare-fun res!115541 () Bool)

(declare-fun e!153003 () Bool)

(assert (=> b!235595 (=> (not res!115541) (not e!153003))))

(declare-datatypes ((V!7913 0))(
  ( (V!7914 (val!3144 Int)) )
))
(declare-datatypes ((ValueCell!2756 0))(
  ( (ValueCellFull!2756 (v!5172 V!7913)) (EmptyCell!2756) )
))
(declare-datatypes ((array!11657 0))(
  ( (array!11658 (arr!5540 (Array (_ BitVec 32) ValueCell!2756)) (size!5877 (_ BitVec 32))) )
))
(declare-datatypes ((array!11659 0))(
  ( (array!11660 (arr!5541 (Array (_ BitVec 32) (_ BitVec 64))) (size!5878 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3412 0))(
  ( (LongMapFixedSize!3413 (defaultEntry!4377 Int) (mask!10351 (_ BitVec 32)) (extraKeys!4114 (_ BitVec 32)) (zeroValue!4218 V!7913) (minValue!4218 V!7913) (_size!1755 (_ BitVec 32)) (_keys!6453 array!11659) (_values!4360 array!11657) (_vacant!1755 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3412)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235595 (= res!115541 (validMask!0 (mask!10351 thiss!1504)))))

(declare-fun b!235596 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235596 (= e!153003 (not (validKeyInArray!0 key!932)))))

(declare-fun b!235597 () Bool)

(declare-fun res!115547 () Bool)

(assert (=> b!235597 (=> (not res!115547) (not e!153003))))

(assert (=> b!235597 (= res!115547 (and (= (size!5877 (_values!4360 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10351 thiss!1504))) (= (size!5878 (_keys!6453 thiss!1504)) (size!5877 (_values!4360 thiss!1504))) (bvsge (mask!10351 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4114 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4114 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235598 () Bool)

(declare-fun res!115542 () Bool)

(assert (=> b!235598 (=> (not res!115542) (not e!153003))))

(declare-datatypes ((List!3543 0))(
  ( (Nil!3540) (Cons!3539 (h!4191 (_ BitVec 64)) (t!8518 List!3543)) )
))
(declare-fun arrayNoDuplicates!0 (array!11659 (_ BitVec 32) List!3543) Bool)

(assert (=> b!235598 (= res!115542 (arrayNoDuplicates!0 (_keys!6453 thiss!1504) #b00000000000000000000000000000000 Nil!3540))))

(declare-fun res!115546 () Bool)

(declare-fun e!152999 () Bool)

(assert (=> start!22532 (=> (not res!115546) (not e!152999))))

(declare-fun valid!1348 (LongMapFixedSize!3412) Bool)

(assert (=> start!22532 (= res!115546 (valid!1348 thiss!1504))))

(assert (=> start!22532 e!152999))

(declare-fun e!153004 () Bool)

(assert (=> start!22532 e!153004))

(assert (=> start!22532 true))

(declare-fun b!235599 () Bool)

(assert (=> b!235599 (= e!152999 e!153003)))

(declare-fun res!115548 () Bool)

(assert (=> b!235599 (=> (not res!115548) (not e!153003))))

(declare-datatypes ((SeekEntryResult!992 0))(
  ( (MissingZero!992 (index!6138 (_ BitVec 32))) (Found!992 (index!6139 (_ BitVec 32))) (Intermediate!992 (undefined!1804 Bool) (index!6140 (_ BitVec 32)) (x!23804 (_ BitVec 32))) (Undefined!992) (MissingVacant!992 (index!6141 (_ BitVec 32))) )
))
(declare-fun lt!119152 () SeekEntryResult!992)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235599 (= res!115548 (or (= lt!119152 (MissingZero!992 index!297)) (= lt!119152 (MissingVacant!992 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11659 (_ BitVec 32)) SeekEntryResult!992)

(assert (=> b!235599 (= lt!119152 (seekEntryOrOpen!0 key!932 (_keys!6453 thiss!1504) (mask!10351 thiss!1504)))))

(declare-fun b!235600 () Bool)

(declare-fun res!115543 () Bool)

(assert (=> b!235600 (=> (not res!115543) (not e!153003))))

(declare-datatypes ((tuple2!4634 0))(
  ( (tuple2!4635 (_1!2328 (_ BitVec 64)) (_2!2328 V!7913)) )
))
(declare-datatypes ((List!3544 0))(
  ( (Nil!3541) (Cons!3540 (h!4192 tuple2!4634) (t!8519 List!3544)) )
))
(declare-datatypes ((ListLongMap!3547 0))(
  ( (ListLongMap!3548 (toList!1789 List!3544)) )
))
(declare-fun contains!1666 (ListLongMap!3547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1317 (array!11659 array!11657 (_ BitVec 32) (_ BitVec 32) V!7913 V!7913 (_ BitVec 32) Int) ListLongMap!3547)

(assert (=> b!235600 (= res!115543 (contains!1666 (getCurrentListMap!1317 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)) key!932))))

(declare-fun b!235601 () Bool)

(declare-fun e!152998 () Bool)

(declare-fun e!153002 () Bool)

(declare-fun mapRes!10496 () Bool)

(assert (=> b!235601 (= e!152998 (and e!153002 mapRes!10496))))

(declare-fun condMapEmpty!10496 () Bool)

(declare-fun mapDefault!10496 () ValueCell!2756)

