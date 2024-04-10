; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15620 () Bool)

(assert start!15620)

(declare-fun b!155602 () Bool)

(declare-fun b_free!3287 () Bool)

(declare-fun b_next!3287 () Bool)

(assert (=> b!155602 (= b_free!3287 (not b_next!3287))))

(declare-fun tp!12386 () Bool)

(declare-fun b_and!9701 () Bool)

(assert (=> b!155602 (= tp!12386 b_and!9701)))

(declare-fun b!155598 () Bool)

(declare-fun e!101659 () Bool)

(declare-fun tp_is_empty!3089 () Bool)

(assert (=> b!155598 (= e!101659 tp_is_empty!3089)))

(declare-fun b!155599 () Bool)

(declare-fun res!73502 () Bool)

(declare-fun e!101656 () Bool)

(assert (=> b!155599 (=> (not res!73502) (not e!101656))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155599 (= res!73502 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155600 () Bool)

(declare-fun e!101658 () Bool)

(declare-fun e!101661 () Bool)

(declare-fun mapRes!5276 () Bool)

(assert (=> b!155600 (= e!101658 (and e!101661 mapRes!5276))))

(declare-fun condMapEmpty!5276 () Bool)

(declare-datatypes ((V!3765 0))(
  ( (V!3766 (val!1589 Int)) )
))
(declare-datatypes ((ValueCell!1201 0))(
  ( (ValueCellFull!1201 (v!3454 V!3765)) (EmptyCell!1201) )
))
(declare-datatypes ((array!5231 0))(
  ( (array!5232 (arr!2473 (Array (_ BitVec 32) (_ BitVec 64))) (size!2751 (_ BitVec 32))) )
))
(declare-datatypes ((array!5233 0))(
  ( (array!5234 (arr!2474 (Array (_ BitVec 32) ValueCell!1201)) (size!2752 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1310 0))(
  ( (LongMapFixedSize!1311 (defaultEntry!3097 Int) (mask!7524 (_ BitVec 32)) (extraKeys!2838 (_ BitVec 32)) (zeroValue!2940 V!3765) (minValue!2940 V!3765) (_size!704 (_ BitVec 32)) (_keys!4872 array!5231) (_values!3080 array!5233) (_vacant!704 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1310)

(declare-fun mapDefault!5276 () ValueCell!1201)

