; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22696 () Bool)

(assert start!22696)

(declare-fun b!236877 () Bool)

(declare-fun b_free!6367 () Bool)

(declare-fun b_next!6367 () Bool)

(assert (=> b!236877 (= b_free!6367 (not b_next!6367))))

(declare-fun tp!22285 () Bool)

(declare-fun b_and!13313 () Bool)

(assert (=> b!236877 (= tp!22285 b_and!13313)))

(declare-fun mapIsEmpty!10555 () Bool)

(declare-fun mapRes!10555 () Bool)

(assert (=> mapIsEmpty!10555 mapRes!10555))

(declare-fun b!236876 () Bool)

(declare-fun res!116127 () Bool)

(declare-fun e!153830 () Bool)

(assert (=> b!236876 (=> (not res!116127) (not e!153830))))

(declare-datatypes ((V!7953 0))(
  ( (V!7954 (val!3159 Int)) )
))
(declare-datatypes ((ValueCell!2771 0))(
  ( (ValueCellFull!2771 (v!5191 V!7953)) (EmptyCell!2771) )
))
(declare-datatypes ((array!11725 0))(
  ( (array!11726 (arr!5570 (Array (_ BitVec 32) ValueCell!2771)) (size!5909 (_ BitVec 32))) )
))
(declare-datatypes ((array!11727 0))(
  ( (array!11728 (arr!5571 (Array (_ BitVec 32) (_ BitVec 64))) (size!5910 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3442 0))(
  ( (LongMapFixedSize!3443 (defaultEntry!4398 Int) (mask!10399 (_ BitVec 32)) (extraKeys!4135 (_ BitVec 32)) (zeroValue!4239 V!7953) (minValue!4239 V!7953) (_size!1770 (_ BitVec 32)) (_keys!6485 array!11727) (_values!4381 array!11725) (_vacant!1770 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3442)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236876 (= res!116127 (validMask!0 (mask!10399 thiss!1504)))))

(declare-fun mapNonEmpty!10555 () Bool)

(declare-fun tp!22284 () Bool)

(declare-fun e!153829 () Bool)

(assert (=> mapNonEmpty!10555 (= mapRes!10555 (and tp!22284 e!153829))))

(declare-fun mapKey!10555 () (_ BitVec 32))

(declare-fun mapRest!10555 () (Array (_ BitVec 32) ValueCell!2771))

(declare-fun mapValue!10555 () ValueCell!2771)

(assert (=> mapNonEmpty!10555 (= (arr!5570 (_values!4381 thiss!1504)) (store mapRest!10555 mapKey!10555 mapValue!10555))))

(declare-fun e!153833 () Bool)

(declare-fun e!153828 () Bool)

(declare-fun tp_is_empty!6229 () Bool)

(declare-fun array_inv!3675 (array!11727) Bool)

(declare-fun array_inv!3676 (array!11725) Bool)

(assert (=> b!236877 (= e!153833 (and tp!22285 tp_is_empty!6229 (array_inv!3675 (_keys!6485 thiss!1504)) (array_inv!3676 (_values!4381 thiss!1504)) e!153828))))

(declare-fun b!236878 () Bool)

(declare-fun e!153831 () Bool)

(assert (=> b!236878 (= e!153831 e!153830)))

(declare-fun res!116124 () Bool)

(assert (=> b!236878 (=> (not res!116124) (not e!153830))))

(declare-datatypes ((SeekEntryResult!1004 0))(
  ( (MissingZero!1004 (index!6186 (_ BitVec 32))) (Found!1004 (index!6187 (_ BitVec 32))) (Intermediate!1004 (undefined!1816 Bool) (index!6188 (_ BitVec 32)) (x!23912 (_ BitVec 32))) (Undefined!1004) (MissingVacant!1004 (index!6189 (_ BitVec 32))) )
))
(declare-fun lt!119783 () SeekEntryResult!1004)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236878 (= res!116124 (or (= lt!119783 (MissingZero!1004 index!297)) (= lt!119783 (MissingVacant!1004 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11727 (_ BitVec 32)) SeekEntryResult!1004)

(assert (=> b!236878 (= lt!119783 (seekEntryOrOpen!0 key!932 (_keys!6485 thiss!1504) (mask!10399 thiss!1504)))))

(declare-fun b!236879 () Bool)

(assert (=> b!236879 (= e!153829 tp_is_empty!6229)))

(declare-fun res!116128 () Bool)

(assert (=> start!22696 (=> (not res!116128) (not e!153831))))

(declare-fun valid!1357 (LongMapFixedSize!3442) Bool)

(assert (=> start!22696 (= res!116128 (valid!1357 thiss!1504))))

(assert (=> start!22696 e!153831))

(assert (=> start!22696 e!153833))

(assert (=> start!22696 true))

(declare-fun b!236880 () Bool)

(declare-fun e!153832 () Bool)

(assert (=> b!236880 (= e!153828 (and e!153832 mapRes!10555))))

(declare-fun condMapEmpty!10555 () Bool)

(declare-fun mapDefault!10555 () ValueCell!2771)

