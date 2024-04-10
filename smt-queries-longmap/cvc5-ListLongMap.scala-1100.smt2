; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22564 () Bool)

(assert start!22564)

(declare-fun b!235925 () Bool)

(declare-fun b_free!6349 () Bool)

(declare-fun b_next!6349 () Bool)

(assert (=> b!235925 (= b_free!6349 (not b_next!6349))))

(declare-fun tp!22220 () Bool)

(declare-fun b_and!13281 () Bool)

(assert (=> b!235925 (= tp!22220 b_and!13281)))

(declare-fun res!115714 () Bool)

(declare-fun e!153221 () Bool)

(assert (=> start!22564 (=> (not res!115714) (not e!153221))))

(declare-datatypes ((V!7929 0))(
  ( (V!7930 (val!3150 Int)) )
))
(declare-datatypes ((ValueCell!2762 0))(
  ( (ValueCellFull!2762 (v!5179 V!7929)) (EmptyCell!2762) )
))
(declare-datatypes ((array!11683 0))(
  ( (array!11684 (arr!5552 (Array (_ BitVec 32) ValueCell!2762)) (size!5889 (_ BitVec 32))) )
))
(declare-datatypes ((array!11685 0))(
  ( (array!11686 (arr!5553 (Array (_ BitVec 32) (_ BitVec 64))) (size!5890 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3424 0))(
  ( (LongMapFixedSize!3425 (defaultEntry!4384 Int) (mask!10365 (_ BitVec 32)) (extraKeys!4121 (_ BitVec 32)) (zeroValue!4225 V!7929) (minValue!4225 V!7929) (_size!1761 (_ BitVec 32)) (_keys!6462 array!11685) (_values!4367 array!11683) (_vacant!1761 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3424)

(declare-fun valid!1353 (LongMapFixedSize!3424) Bool)

(assert (=> start!22564 (= res!115714 (valid!1353 thiss!1504))))

(assert (=> start!22564 e!153221))

(declare-fun e!153218 () Bool)

(assert (=> start!22564 e!153218))

(assert (=> start!22564 true))

(declare-fun b!235921 () Bool)

(declare-fun e!153217 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235921 (= e!153217 (not (validMask!0 (mask!10365 thiss!1504))))))

(declare-fun b!235922 () Bool)

(declare-fun res!115713 () Bool)

(assert (=> b!235922 (=> (not res!115713) (not e!153217))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4642 0))(
  ( (tuple2!4643 (_1!2332 (_ BitVec 64)) (_2!2332 V!7929)) )
))
(declare-datatypes ((List!3549 0))(
  ( (Nil!3546) (Cons!3545 (h!4197 tuple2!4642) (t!8526 List!3549)) )
))
(declare-datatypes ((ListLongMap!3555 0))(
  ( (ListLongMap!3556 (toList!1793 List!3549)) )
))
(declare-fun contains!1671 (ListLongMap!3555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1321 (array!11685 array!11683 (_ BitVec 32) (_ BitVec 32) V!7929 V!7929 (_ BitVec 32) Int) ListLongMap!3555)

(assert (=> b!235922 (= res!115713 (not (contains!1671 (getCurrentListMap!1321 (_keys!6462 thiss!1504) (_values!4367 thiss!1504) (mask!10365 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)) key!932)))))

(declare-fun b!235923 () Bool)

(assert (=> b!235923 (= e!153221 e!153217)))

(declare-fun res!115715 () Bool)

(assert (=> b!235923 (=> (not res!115715) (not e!153217))))

(declare-datatypes ((SeekEntryResult!997 0))(
  ( (MissingZero!997 (index!6158 (_ BitVec 32))) (Found!997 (index!6159 (_ BitVec 32))) (Intermediate!997 (undefined!1809 Bool) (index!6160 (_ BitVec 32)) (x!23835 (_ BitVec 32))) (Undefined!997) (MissingVacant!997 (index!6161 (_ BitVec 32))) )
))
(declare-fun lt!119275 () SeekEntryResult!997)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235923 (= res!115715 (or (= lt!119275 (MissingZero!997 index!297)) (= lt!119275 (MissingVacant!997 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11685 (_ BitVec 32)) SeekEntryResult!997)

(assert (=> b!235923 (= lt!119275 (seekEntryOrOpen!0 key!932 (_keys!6462 thiss!1504) (mask!10365 thiss!1504)))))

(declare-fun mapIsEmpty!10517 () Bool)

(declare-fun mapRes!10517 () Bool)

(assert (=> mapIsEmpty!10517 mapRes!10517))

(declare-fun b!235924 () Bool)

(declare-fun e!153223 () Bool)

(declare-fun tp_is_empty!6211 () Bool)

(assert (=> b!235924 (= e!153223 tp_is_empty!6211)))

(declare-fun mapNonEmpty!10517 () Bool)

(declare-fun tp!22219 () Bool)

(declare-fun e!153220 () Bool)

(assert (=> mapNonEmpty!10517 (= mapRes!10517 (and tp!22219 e!153220))))

(declare-fun mapValue!10517 () ValueCell!2762)

(declare-fun mapKey!10517 () (_ BitVec 32))

(declare-fun mapRest!10517 () (Array (_ BitVec 32) ValueCell!2762))

(assert (=> mapNonEmpty!10517 (= (arr!5552 (_values!4367 thiss!1504)) (store mapRest!10517 mapKey!10517 mapValue!10517))))

(declare-fun e!153222 () Bool)

(declare-fun array_inv!3663 (array!11685) Bool)

(declare-fun array_inv!3664 (array!11683) Bool)

(assert (=> b!235925 (= e!153218 (and tp!22220 tp_is_empty!6211 (array_inv!3663 (_keys!6462 thiss!1504)) (array_inv!3664 (_values!4367 thiss!1504)) e!153222))))

(declare-fun b!235926 () Bool)

(assert (=> b!235926 (= e!153220 tp_is_empty!6211)))

(declare-fun b!235927 () Bool)

(declare-fun res!115716 () Bool)

(assert (=> b!235927 (=> (not res!115716) (not e!153221))))

(assert (=> b!235927 (= res!115716 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235928 () Bool)

(assert (=> b!235928 (= e!153222 (and e!153223 mapRes!10517))))

(declare-fun condMapEmpty!10517 () Bool)

(declare-fun mapDefault!10517 () ValueCell!2762)

