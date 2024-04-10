; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15688 () Bool)

(assert start!15688)

(declare-fun b!156404 () Bool)

(declare-fun b_free!3355 () Bool)

(declare-fun b_next!3355 () Bool)

(assert (=> b!156404 (= b_free!3355 (not b_next!3355))))

(declare-fun tp!12589 () Bool)

(declare-fun b_and!9769 () Bool)

(assert (=> b!156404 (= tp!12589 b_and!9769)))

(declare-fun b!156399 () Bool)

(declare-fun e!102291 () Bool)

(declare-fun e!102290 () Bool)

(declare-fun mapRes!5378 () Bool)

(assert (=> b!156399 (= e!102291 (and e!102290 mapRes!5378))))

(declare-fun condMapEmpty!5378 () Bool)

(declare-datatypes ((V!3857 0))(
  ( (V!3858 (val!1623 Int)) )
))
(declare-datatypes ((ValueCell!1235 0))(
  ( (ValueCellFull!1235 (v!3488 V!3857)) (EmptyCell!1235) )
))
(declare-datatypes ((array!5367 0))(
  ( (array!5368 (arr!2541 (Array (_ BitVec 32) (_ BitVec 64))) (size!2819 (_ BitVec 32))) )
))
(declare-datatypes ((array!5369 0))(
  ( (array!5370 (arr!2542 (Array (_ BitVec 32) ValueCell!1235)) (size!2820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1378 0))(
  ( (LongMapFixedSize!1379 (defaultEntry!3131 Int) (mask!7582 (_ BitVec 32)) (extraKeys!2872 (_ BitVec 32)) (zeroValue!2974 V!3857) (minValue!2974 V!3857) (_size!738 (_ BitVec 32)) (_keys!4906 array!5367) (_values!3114 array!5369) (_vacant!738 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1378)

(declare-fun mapDefault!5378 () ValueCell!1235)

