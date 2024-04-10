; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15662 () Bool)

(assert start!15662)

(declare-fun b!156053 () Bool)

(declare-fun b_free!3329 () Bool)

(declare-fun b_next!3329 () Bool)

(assert (=> b!156053 (= b_free!3329 (not b_next!3329))))

(declare-fun tp!12512 () Bool)

(declare-fun b_and!9743 () Bool)

(assert (=> b!156053 (= tp!12512 b_and!9743)))

(declare-fun res!73702 () Bool)

(declare-fun e!102057 () Bool)

(assert (=> start!15662 (=> (not res!73702) (not e!102057))))

(declare-datatypes ((V!3821 0))(
  ( (V!3822 (val!1610 Int)) )
))
(declare-datatypes ((ValueCell!1222 0))(
  ( (ValueCellFull!1222 (v!3475 V!3821)) (EmptyCell!1222) )
))
(declare-datatypes ((array!5315 0))(
  ( (array!5316 (arr!2515 (Array (_ BitVec 32) (_ BitVec 64))) (size!2793 (_ BitVec 32))) )
))
(declare-datatypes ((array!5317 0))(
  ( (array!5318 (arr!2516 (Array (_ BitVec 32) ValueCell!1222)) (size!2794 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1352 0))(
  ( (LongMapFixedSize!1353 (defaultEntry!3118 Int) (mask!7559 (_ BitVec 32)) (extraKeys!2859 (_ BitVec 32)) (zeroValue!2961 V!3821) (minValue!2961 V!3821) (_size!725 (_ BitVec 32)) (_keys!4893 array!5315) (_values!3101 array!5317) (_vacant!725 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1352)

(declare-fun valid!658 (LongMapFixedSize!1352) Bool)

(assert (=> start!15662 (= res!73702 (valid!658 thiss!1248))))

(assert (=> start!15662 e!102057))

(declare-fun e!102053 () Bool)

(assert (=> start!15662 e!102053))

(assert (=> start!15662 true))

(declare-fun tp_is_empty!3131 () Bool)

(assert (=> start!15662 tp_is_empty!3131))

(declare-fun b!156051 () Bool)

(declare-fun e!102052 () Bool)

(declare-fun e!102056 () Bool)

(declare-fun mapRes!5339 () Bool)

(assert (=> b!156051 (= e!102052 (and e!102056 mapRes!5339))))

(declare-fun condMapEmpty!5339 () Bool)

(declare-fun mapDefault!5339 () ValueCell!1222)

