; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22776 () Bool)

(assert start!22776)

(declare-fun b!237510 () Bool)

(declare-fun b_free!6383 () Bool)

(declare-fun b_next!6383 () Bool)

(assert (=> b!237510 (= b_free!6383 (not b_next!6383))))

(declare-fun tp!22339 () Bool)

(declare-fun b_and!13337 () Bool)

(assert (=> b!237510 (= tp!22339 b_and!13337)))

(declare-fun res!116408 () Bool)

(declare-fun e!154237 () Bool)

(assert (=> start!22776 (=> (not res!116408) (not e!154237))))

(declare-datatypes ((V!7973 0))(
  ( (V!7974 (val!3167 Int)) )
))
(declare-datatypes ((ValueCell!2779 0))(
  ( (ValueCellFull!2779 (v!5201 V!7973)) (EmptyCell!2779) )
))
(declare-datatypes ((array!11761 0))(
  ( (array!11762 (arr!5586 (Array (_ BitVec 32) ValueCell!2779)) (size!5926 (_ BitVec 32))) )
))
(declare-datatypes ((array!11763 0))(
  ( (array!11764 (arr!5587 (Array (_ BitVec 32) (_ BitVec 64))) (size!5927 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3458 0))(
  ( (LongMapFixedSize!3459 (defaultEntry!4409 Int) (mask!10422 (_ BitVec 32)) (extraKeys!4146 (_ BitVec 32)) (zeroValue!4250 V!7973) (minValue!4250 V!7973) (_size!1778 (_ BitVec 32)) (_keys!6501 array!11763) (_values!4392 array!11761) (_vacant!1778 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3458)

(declare-fun valid!1365 (LongMapFixedSize!3458) Bool)

(assert (=> start!22776 (= res!116408 (valid!1365 thiss!1504))))

(assert (=> start!22776 e!154237))

(declare-fun e!154240 () Bool)

(assert (=> start!22776 e!154240))

(assert (=> start!22776 true))

(declare-fun b!237506 () Bool)

(declare-fun e!154243 () Bool)

(assert (=> b!237506 (= e!154237 e!154243)))

(declare-fun res!116407 () Bool)

(assert (=> b!237506 (=> (not res!116407) (not e!154243))))

(declare-datatypes ((SeekEntryResult!1010 0))(
  ( (MissingZero!1010 (index!6210 (_ BitVec 32))) (Found!1010 (index!6211 (_ BitVec 32))) (Intermediate!1010 (undefined!1822 Bool) (index!6212 (_ BitVec 32)) (x!23962 (_ BitVec 32))) (Undefined!1010) (MissingVacant!1010 (index!6213 (_ BitVec 32))) )
))
(declare-fun lt!120091 () SeekEntryResult!1010)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237506 (= res!116407 (or (= lt!120091 (MissingZero!1010 index!297)) (= lt!120091 (MissingVacant!1010 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11763 (_ BitVec 32)) SeekEntryResult!1010)

(assert (=> b!237506 (= lt!120091 (seekEntryOrOpen!0 key!932 (_keys!6501 thiss!1504) (mask!10422 thiss!1504)))))

(declare-fun b!237507 () Bool)

(declare-fun e!154241 () Bool)

(declare-fun tp_is_empty!6245 () Bool)

(assert (=> b!237507 (= e!154241 tp_is_empty!6245)))

(declare-fun b!237508 () Bool)

(declare-fun e!154238 () Bool)

(assert (=> b!237508 (= e!154238 tp_is_empty!6245)))

(declare-fun b!237509 () Bool)

(declare-fun res!116405 () Bool)

(assert (=> b!237509 (=> (not res!116405) (not e!154243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237509 (= res!116405 (validMask!0 (mask!10422 thiss!1504)))))

(declare-fun mapIsEmpty!10586 () Bool)

(declare-fun mapRes!10586 () Bool)

(assert (=> mapIsEmpty!10586 mapRes!10586))

(declare-fun e!154242 () Bool)

(declare-fun array_inv!3689 (array!11763) Bool)

(declare-fun array_inv!3690 (array!11761) Bool)

(assert (=> b!237510 (= e!154240 (and tp!22339 tp_is_empty!6245 (array_inv!3689 (_keys!6501 thiss!1504)) (array_inv!3690 (_values!4392 thiss!1504)) e!154242))))

(declare-fun b!237511 () Bool)

(declare-fun res!116406 () Bool)

(assert (=> b!237511 (=> (not res!116406) (not e!154243))))

(declare-datatypes ((tuple2!4668 0))(
  ( (tuple2!4669 (_1!2345 (_ BitVec 64)) (_2!2345 V!7973)) )
))
(declare-datatypes ((List!3567 0))(
  ( (Nil!3564) (Cons!3563 (h!4218 tuple2!4668) (t!8554 List!3567)) )
))
(declare-datatypes ((ListLongMap!3581 0))(
  ( (ListLongMap!3582 (toList!1806 List!3567)) )
))
(declare-fun contains!1690 (ListLongMap!3581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1334 (array!11763 array!11761 (_ BitVec 32) (_ BitVec 32) V!7973 V!7973 (_ BitVec 32) Int) ListLongMap!3581)

(assert (=> b!237511 (= res!116406 (not (contains!1690 (getCurrentListMap!1334 (_keys!6501 thiss!1504) (_values!4392 thiss!1504) (mask!10422 thiss!1504) (extraKeys!4146 thiss!1504) (zeroValue!4250 thiss!1504) (minValue!4250 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4409 thiss!1504)) key!932)))))

(declare-fun b!237512 () Bool)

(declare-fun res!116409 () Bool)

(assert (=> b!237512 (=> (not res!116409) (not e!154237))))

(assert (=> b!237512 (= res!116409 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237513 () Bool)

(assert (=> b!237513 (= e!154242 (and e!154241 mapRes!10586))))

(declare-fun condMapEmpty!10586 () Bool)

(declare-fun mapDefault!10586 () ValueCell!2779)

