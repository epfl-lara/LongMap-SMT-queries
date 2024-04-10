; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15760 () Bool)

(assert start!15760)

(declare-fun b!157278 () Bool)

(declare-fun b_free!3427 () Bool)

(declare-fun b_next!3427 () Bool)

(assert (=> b!157278 (= b_free!3427 (not b_next!3427))))

(declare-fun tp!12805 () Bool)

(declare-fun b_and!9841 () Bool)

(assert (=> b!157278 (= tp!12805 b_and!9841)))

(declare-fun b!157275 () Bool)

(declare-fun e!102952 () Bool)

(declare-fun e!102957 () Bool)

(declare-fun mapRes!5486 () Bool)

(assert (=> b!157275 (= e!102952 (and e!102957 mapRes!5486))))

(declare-fun condMapEmpty!5486 () Bool)

(declare-datatypes ((V!3953 0))(
  ( (V!3954 (val!1659 Int)) )
))
(declare-datatypes ((ValueCell!1271 0))(
  ( (ValueCellFull!1271 (v!3524 V!3953)) (EmptyCell!1271) )
))
(declare-datatypes ((array!5511 0))(
  ( (array!5512 (arr!2613 (Array (_ BitVec 32) (_ BitVec 64))) (size!2891 (_ BitVec 32))) )
))
(declare-datatypes ((array!5513 0))(
  ( (array!5514 (arr!2614 (Array (_ BitVec 32) ValueCell!1271)) (size!2892 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1450 0))(
  ( (LongMapFixedSize!1451 (defaultEntry!3167 Int) (mask!7642 (_ BitVec 32)) (extraKeys!2908 (_ BitVec 32)) (zeroValue!3010 V!3953) (minValue!3010 V!3953) (_size!774 (_ BitVec 32)) (_keys!4942 array!5511) (_values!3150 array!5513) (_vacant!774 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1450)

(declare-fun mapDefault!5486 () ValueCell!1271)

