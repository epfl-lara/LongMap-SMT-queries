; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22064 () Bool)

(assert start!22064)

(declare-fun b!228447 () Bool)

(declare-fun b_free!6131 () Bool)

(declare-fun b_next!6131 () Bool)

(assert (=> b!228447 (= b_free!6131 (not b_next!6131))))

(declare-fun tp!21534 () Bool)

(declare-fun b_and!13029 () Bool)

(assert (=> b!228447 (= tp!21534 b_and!13029)))

(declare-fun bm!21224 () Bool)

(declare-fun call!21227 () Bool)

(declare-datatypes ((V!7637 0))(
  ( (V!7638 (val!3041 Int)) )
))
(declare-datatypes ((ValueCell!2653 0))(
  ( (ValueCellFull!2653 (v!5061 V!7637)) (EmptyCell!2653) )
))
(declare-datatypes ((array!11229 0))(
  ( (array!11230 (arr!5334 (Array (_ BitVec 32) ValueCell!2653)) (size!5667 (_ BitVec 32))) )
))
(declare-datatypes ((array!11231 0))(
  ( (array!11232 (arr!5335 (Array (_ BitVec 32) (_ BitVec 64))) (size!5668 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3206 0))(
  ( (LongMapFixedSize!3207 (defaultEntry!4262 Int) (mask!10132 (_ BitVec 32)) (extraKeys!3999 (_ BitVec 32)) (zeroValue!4103 V!7637) (minValue!4103 V!7637) (_size!1652 (_ BitVec 32)) (_keys!6316 array!11231) (_values!4245 array!11229) (_vacant!1652 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3206)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21224 (= call!21227 (arrayContainsKey!0 (_keys!6316 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228436 () Bool)

(declare-fun e!148202 () Bool)

(assert (=> b!228436 (= e!148202 true)))

(declare-fun lt!114927 () Bool)

(declare-datatypes ((List!3411 0))(
  ( (Nil!3408) (Cons!3407 (h!4055 (_ BitVec 64)) (t!8370 List!3411)) )
))
(declare-fun arrayNoDuplicates!0 (array!11231 (_ BitVec 32) List!3411) Bool)

(assert (=> b!228436 (= lt!114927 (arrayNoDuplicates!0 (_keys!6316 thiss!1504) #b00000000000000000000000000000000 Nil!3408))))

(declare-fun b!228437 () Bool)

(declare-datatypes ((Unit!6948 0))(
  ( (Unit!6949) )
))
(declare-fun e!148200 () Unit!6948)

(declare-fun Unit!6950 () Unit!6948)

(assert (=> b!228437 (= e!148200 Unit!6950)))

(declare-fun b!228438 () Bool)

(declare-fun e!148205 () Bool)

(declare-fun e!148203 () Bool)

(declare-fun mapRes!10159 () Bool)

(assert (=> b!228438 (= e!148205 (and e!148203 mapRes!10159))))

(declare-fun condMapEmpty!10159 () Bool)

(declare-fun mapDefault!10159 () ValueCell!2653)

