; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16558 () Bool)

(assert start!16558)

(declare-fun b!164880 () Bool)

(declare-fun b_free!3863 () Bool)

(declare-fun b_next!3863 () Bool)

(assert (=> b!164880 (= b_free!3863 (not b_next!3863))))

(declare-fun tp!14190 () Bool)

(declare-fun b_and!10277 () Bool)

(assert (=> b!164880 (= tp!14190 b_and!10277)))

(declare-fun b!164876 () Bool)

(declare-fun res!78136 () Bool)

(declare-fun e!108169 () Bool)

(assert (=> b!164876 (=> (not res!78136) (not e!108169))))

(declare-datatypes ((V!4533 0))(
  ( (V!4534 (val!1877 Int)) )
))
(declare-datatypes ((ValueCell!1489 0))(
  ( (ValueCellFull!1489 (v!3742 V!4533)) (EmptyCell!1489) )
))
(declare-datatypes ((array!6427 0))(
  ( (array!6428 (arr!3049 (Array (_ BitVec 32) (_ BitVec 64))) (size!3337 (_ BitVec 32))) )
))
(declare-datatypes ((array!6429 0))(
  ( (array!6430 (arr!3050 (Array (_ BitVec 32) ValueCell!1489)) (size!3338 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1886 0))(
  ( (LongMapFixedSize!1887 (defaultEntry!3385 Int) (mask!8084 (_ BitVec 32)) (extraKeys!3126 (_ BitVec 32)) (zeroValue!3228 V!4533) (minValue!3228 V!4533) (_size!992 (_ BitVec 32)) (_keys!5210 array!6427) (_values!3368 array!6429) (_vacant!992 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1886)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164876 (= res!78136 (validMask!0 (mask!8084 thiss!1248)))))

(declare-fun b!164877 () Bool)

(declare-fun e!108164 () Bool)

(declare-fun e!108168 () Bool)

(declare-fun mapRes!6216 () Bool)

(assert (=> b!164877 (= e!108164 (and e!108168 mapRes!6216))))

(declare-fun condMapEmpty!6216 () Bool)

(declare-fun mapDefault!6216 () ValueCell!1489)

