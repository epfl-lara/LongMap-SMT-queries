; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17230 () Bool)

(assert start!17230)

(declare-fun b!172832 () Bool)

(declare-fun b_free!4277 () Bool)

(declare-fun b_next!4277 () Bool)

(assert (=> b!172832 (= b_free!4277 (not b_next!4277))))

(declare-fun tp!15489 () Bool)

(declare-fun b_and!10717 () Bool)

(assert (=> b!172832 (= tp!15489 b_and!10717)))

(declare-fun b!172827 () Bool)

(declare-fun res!82062 () Bool)

(declare-fun e!114115 () Bool)

(assert (=> b!172827 (=> (not res!82062) (not e!114115))))

(declare-datatypes ((V!5045 0))(
  ( (V!5046 (val!2069 Int)) )
))
(declare-datatypes ((ValueCell!1681 0))(
  ( (ValueCellFull!1681 (v!3937 V!5045)) (EmptyCell!1681) )
))
(declare-datatypes ((array!7225 0))(
  ( (array!7226 (arr!3433 (Array (_ BitVec 32) (_ BitVec 64))) (size!3732 (_ BitVec 32))) )
))
(declare-datatypes ((array!7227 0))(
  ( (array!7228 (arr!3434 (Array (_ BitVec 32) ValueCell!1681)) (size!3733 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2270 0))(
  ( (LongMapFixedSize!2271 (defaultEntry!3581 Int) (mask!8437 (_ BitVec 32)) (extraKeys!3320 (_ BitVec 32)) (zeroValue!3422 V!5045) (minValue!3424 V!5045) (_size!1184 (_ BitVec 32)) (_keys!5420 array!7225) (_values!3564 array!7227) (_vacant!1184 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2270)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172827 (= res!82062 (validMask!0 (mask!8437 thiss!1248)))))

(declare-fun res!82060 () Bool)

(assert (=> start!17230 (=> (not res!82060) (not e!114115))))

(declare-fun valid!962 (LongMapFixedSize!2270) Bool)

(assert (=> start!17230 (= res!82060 (valid!962 thiss!1248))))

(assert (=> start!17230 e!114115))

(declare-fun e!114113 () Bool)

(assert (=> start!17230 e!114113))

(assert (=> start!17230 true))

(declare-fun mapIsEmpty!6894 () Bool)

(declare-fun mapRes!6894 () Bool)

(assert (=> mapIsEmpty!6894 mapRes!6894))

(declare-fun b!172828 () Bool)

(declare-fun e!114114 () Bool)

(declare-fun e!114111 () Bool)

(assert (=> b!172828 (= e!114114 (and e!114111 mapRes!6894))))

(declare-fun condMapEmpty!6894 () Bool)

(declare-fun mapDefault!6894 () ValueCell!1681)

