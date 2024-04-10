; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21378 () Bool)

(assert start!21378)

(declare-fun b!214887 () Bool)

(declare-fun b_free!5695 () Bool)

(declare-fun b_next!5695 () Bool)

(assert (=> b!214887 (= b_free!5695 (not b_next!5695))))

(declare-fun tp!20186 () Bool)

(declare-fun b_and!12585 () Bool)

(assert (=> b!214887 (= tp!20186 b_and!12585)))

(declare-fun b!214883 () Bool)

(declare-fun res!105164 () Bool)

(declare-fun e!139760 () Bool)

(assert (=> b!214883 (=> (not res!105164) (not e!139760))))

(declare-datatypes ((V!7057 0))(
  ( (V!7058 (val!2823 Int)) )
))
(declare-datatypes ((ValueCell!2435 0))(
  ( (ValueCellFull!2435 (v!4841 V!7057)) (EmptyCell!2435) )
))
(declare-datatypes ((array!10333 0))(
  ( (array!10334 (arr!4898 (Array (_ BitVec 32) ValueCell!2435)) (size!5226 (_ BitVec 32))) )
))
(declare-datatypes ((array!10335 0))(
  ( (array!10336 (arr!4899 (Array (_ BitVec 32) (_ BitVec 64))) (size!5227 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2770 0))(
  ( (LongMapFixedSize!2771 (defaultEntry!4035 Int) (mask!9713 (_ BitVec 32)) (extraKeys!3772 (_ BitVec 32)) (zeroValue!3876 V!7057) (minValue!3876 V!7057) (_size!1434 (_ BitVec 32)) (_keys!6059 array!10335) (_values!4018 array!10333) (_vacant!1434 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2770)

(assert (=> b!214883 (= res!105164 (and (bvsge (mask!9713 thiss!1504) #b00000000000000000000000000000000) (= (size!5227 (_keys!6059 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9713 thiss!1504)))))))

(declare-fun b!214884 () Bool)

(declare-fun e!139758 () Bool)

(declare-fun tp_is_empty!5557 () Bool)

(assert (=> b!214884 (= e!139758 tp_is_empty!5557)))

(declare-fun mapIsEmpty!9464 () Bool)

(declare-fun mapRes!9464 () Bool)

(assert (=> mapIsEmpty!9464 mapRes!9464))

(declare-fun b!214885 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214885 (= e!139760 (not (validKeyInArray!0 key!932)))))

(declare-fun e!139762 () Bool)

(declare-fun e!139759 () Bool)

(declare-fun array_inv!3241 (array!10335) Bool)

(declare-fun array_inv!3242 (array!10333) Bool)

(assert (=> b!214887 (= e!139762 (and tp!20186 tp_is_empty!5557 (array_inv!3241 (_keys!6059 thiss!1504)) (array_inv!3242 (_values!4018 thiss!1504)) e!139759))))

(declare-fun b!214888 () Bool)

(declare-fun res!105160 () Bool)

(assert (=> b!214888 (=> (not res!105160) (not e!139760))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!724 0))(
  ( (MissingZero!724 (index!5066 (_ BitVec 32))) (Found!724 (index!5067 (_ BitVec 32))) (Intermediate!724 (undefined!1536 Bool) (index!5068 (_ BitVec 32)) (x!22424 (_ BitVec 32))) (Undefined!724) (MissingVacant!724 (index!5069 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10335 (_ BitVec 32)) SeekEntryResult!724)

(assert (=> b!214888 (= res!105160 (not (= (seekEntryOrOpen!0 key!932 (_keys!6059 thiss!1504) (mask!9713 thiss!1504)) (MissingZero!724 index!297))))))

(declare-fun b!214889 () Bool)

(declare-fun e!139763 () Bool)

(assert (=> b!214889 (= e!139763 tp_is_empty!5557)))

(declare-fun b!214890 () Bool)

(assert (=> b!214890 (= e!139759 (and e!139758 mapRes!9464))))

(declare-fun condMapEmpty!9464 () Bool)

(declare-fun mapDefault!9464 () ValueCell!2435)

