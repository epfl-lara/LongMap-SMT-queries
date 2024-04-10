; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17266 () Bool)

(assert start!17266)

(declare-fun b!173146 () Bool)

(declare-fun b_free!4303 () Bool)

(declare-fun b_next!4303 () Bool)

(assert (=> b!173146 (= b_free!4303 (not b_next!4303))))

(declare-fun tp!15570 () Bool)

(declare-fun b_and!10743 () Bool)

(assert (=> b!173146 (= tp!15570 b_and!10743)))

(declare-fun b!173142 () Bool)

(declare-fun e!114368 () Bool)

(declare-datatypes ((V!5081 0))(
  ( (V!5082 (val!2082 Int)) )
))
(declare-datatypes ((ValueCell!1694 0))(
  ( (ValueCellFull!1694 (v!3950 V!5081)) (EmptyCell!1694) )
))
(declare-datatypes ((array!7279 0))(
  ( (array!7280 (arr!3459 (Array (_ BitVec 32) (_ BitVec 64))) (size!3758 (_ BitVec 32))) )
))
(declare-datatypes ((array!7281 0))(
  ( (array!7282 (arr!3460 (Array (_ BitVec 32) ValueCell!1694)) (size!3759 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2296 0))(
  ( (LongMapFixedSize!2297 (defaultEntry!3594 Int) (mask!8462 (_ BitVec 32)) (extraKeys!3333 (_ BitVec 32)) (zeroValue!3435 V!5081) (minValue!3437 V!5081) (_size!1197 (_ BitVec 32)) (_keys!5434 array!7279) (_values!3577 array!7281) (_vacant!1197 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2296)

(declare-datatypes ((List!2203 0))(
  ( (Nil!2200) (Cons!2199 (h!2816 (_ BitVec 64)) (t!7010 List!2203)) )
))
(declare-fun arrayNoDuplicates!0 (array!7279 (_ BitVec 32) List!2203) Bool)

(assert (=> b!173142 (= e!114368 (not (arrayNoDuplicates!0 (_keys!5434 thiss!1248) #b00000000000000000000000000000000 Nil!2200)))))

(declare-fun b!173143 () Bool)

(declare-fun e!114363 () Bool)

(declare-fun e!114365 () Bool)

(declare-fun mapRes!6936 () Bool)

(assert (=> b!173143 (= e!114363 (and e!114365 mapRes!6936))))

(declare-fun condMapEmpty!6936 () Bool)

(declare-fun mapDefault!6936 () ValueCell!1694)

