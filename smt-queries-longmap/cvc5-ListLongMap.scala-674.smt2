; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16548 () Bool)

(assert start!16548)

(declare-fun b!164715 () Bool)

(declare-fun b_free!3853 () Bool)

(declare-fun b_next!3853 () Bool)

(assert (=> b!164715 (= b_free!3853 (not b_next!3853))))

(declare-fun tp!14159 () Bool)

(declare-fun b_and!10267 () Bool)

(assert (=> b!164715 (= tp!14159 b_and!10267)))

(declare-fun b!164711 () Bool)

(declare-fun e!108060 () Bool)

(declare-fun e!108065 () Bool)

(declare-fun mapRes!6201 () Bool)

(assert (=> b!164711 (= e!108060 (and e!108065 mapRes!6201))))

(declare-fun condMapEmpty!6201 () Bool)

(declare-datatypes ((V!4521 0))(
  ( (V!4522 (val!1872 Int)) )
))
(declare-datatypes ((ValueCell!1484 0))(
  ( (ValueCellFull!1484 (v!3737 V!4521)) (EmptyCell!1484) )
))
(declare-datatypes ((array!6407 0))(
  ( (array!6408 (arr!3039 (Array (_ BitVec 32) (_ BitVec 64))) (size!3327 (_ BitVec 32))) )
))
(declare-datatypes ((array!6409 0))(
  ( (array!6410 (arr!3040 (Array (_ BitVec 32) ValueCell!1484)) (size!3328 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1876 0))(
  ( (LongMapFixedSize!1877 (defaultEntry!3380 Int) (mask!8077 (_ BitVec 32)) (extraKeys!3121 (_ BitVec 32)) (zeroValue!3223 V!4521) (minValue!3223 V!4521) (_size!987 (_ BitVec 32)) (_keys!5205 array!6407) (_values!3363 array!6409) (_vacant!987 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1876)

(declare-fun mapDefault!6201 () ValueCell!1484)

