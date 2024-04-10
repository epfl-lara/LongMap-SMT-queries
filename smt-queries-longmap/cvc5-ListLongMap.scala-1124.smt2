; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23056 () Bool)

(assert start!23056)

(declare-fun b!241632 () Bool)

(declare-fun b_free!6493 () Bool)

(declare-fun b_next!6493 () Bool)

(assert (=> b!241632 (= b_free!6493 (not b_next!6493))))

(declare-fun tp!22686 () Bool)

(declare-fun b_and!13465 () Bool)

(assert (=> b!241632 (= tp!22686 b_and!13465)))

(declare-datatypes ((V!8121 0))(
  ( (V!8122 (val!3222 Int)) )
))
(declare-datatypes ((ValueCell!2834 0))(
  ( (ValueCellFull!2834 (v!5261 V!8121)) (EmptyCell!2834) )
))
(declare-datatypes ((array!11991 0))(
  ( (array!11992 (arr!5696 (Array (_ BitVec 32) ValueCell!2834)) (size!6038 (_ BitVec 32))) )
))
(declare-datatypes ((array!11993 0))(
  ( (array!11994 (arr!5697 (Array (_ BitVec 32) (_ BitVec 64))) (size!6039 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3568 0))(
  ( (LongMapFixedSize!3569 (defaultEntry!4477 Int) (mask!10550 (_ BitVec 32)) (extraKeys!4214 (_ BitVec 32)) (zeroValue!4318 V!8121) (minValue!4318 V!8121) (_size!1833 (_ BitVec 32)) (_keys!6583 array!11993) (_values!4460 array!11991) (_vacant!1833 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3568)

(declare-fun e!156827 () Bool)

(declare-fun tp_is_empty!6355 () Bool)

(declare-fun e!156816 () Bool)

(declare-fun array_inv!3771 (array!11993) Bool)

(declare-fun array_inv!3772 (array!11991) Bool)

(assert (=> b!241632 (= e!156827 (and tp!22686 tp_is_empty!6355 (array_inv!3771 (_keys!6583 thiss!1504)) (array_inv!3772 (_values!4460 thiss!1504)) e!156816))))

(declare-fun b!241633 () Bool)

(declare-fun res!118438 () Bool)

(declare-fun e!156828 () Bool)

(assert (=> b!241633 (=> (not res!118438) (not e!156828))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!241633 (= res!118438 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241634 () Bool)

(declare-fun c!40288 () Bool)

(declare-datatypes ((SeekEntryResult!1058 0))(
  ( (MissingZero!1058 (index!6402 (_ BitVec 32))) (Found!1058 (index!6403 (_ BitVec 32))) (Intermediate!1058 (undefined!1870 Bool) (index!6404 (_ BitVec 32)) (x!24228 (_ BitVec 32))) (Undefined!1058) (MissingVacant!1058 (index!6405 (_ BitVec 32))) )
))
(declare-fun lt!121424 () SeekEntryResult!1058)

(assert (=> b!241634 (= c!40288 (is-MissingVacant!1058 lt!121424))))

(declare-fun e!156829 () Bool)

(declare-fun e!156825 () Bool)

(assert (=> b!241634 (= e!156829 e!156825)))

(declare-fun b!241635 () Bool)

(declare-fun e!156826 () Bool)

(assert (=> b!241635 (= e!156826 tp_is_empty!6355)))

(declare-fun b!241636 () Bool)

(declare-fun mapRes!10768 () Bool)

(assert (=> b!241636 (= e!156816 (and e!156826 mapRes!10768))))

(declare-fun condMapEmpty!10768 () Bool)

(declare-fun mapDefault!10768 () ValueCell!2834)

