; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22024 () Bool)

(assert start!22024)

(declare-fun b!227069 () Bool)

(declare-fun b_free!6091 () Bool)

(declare-fun b_next!6091 () Bool)

(assert (=> b!227069 (= b_free!6091 (not b_next!6091))))

(declare-fun tp!21414 () Bool)

(declare-fun b_and!12989 () Bool)

(assert (=> b!227069 (= tp!21414 b_and!12989)))

(declare-fun b!227055 () Bool)

(declare-fun e!147307 () Bool)

(declare-fun e!147303 () Bool)

(declare-fun mapRes!10099 () Bool)

(assert (=> b!227055 (= e!147307 (and e!147303 mapRes!10099))))

(declare-fun condMapEmpty!10099 () Bool)

(declare-datatypes ((V!7585 0))(
  ( (V!7586 (val!3021 Int)) )
))
(declare-datatypes ((ValueCell!2633 0))(
  ( (ValueCellFull!2633 (v!5041 V!7585)) (EmptyCell!2633) )
))
(declare-datatypes ((array!11149 0))(
  ( (array!11150 (arr!5294 (Array (_ BitVec 32) ValueCell!2633)) (size!5627 (_ BitVec 32))) )
))
(declare-datatypes ((array!11151 0))(
  ( (array!11152 (arr!5295 (Array (_ BitVec 32) (_ BitVec 64))) (size!5628 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3166 0))(
  ( (LongMapFixedSize!3167 (defaultEntry!4242 Int) (mask!10100 (_ BitVec 32)) (extraKeys!3979 (_ BitVec 32)) (zeroValue!4083 V!7585) (minValue!4083 V!7585) (_size!1632 (_ BitVec 32)) (_keys!6296 array!11151) (_values!4225 array!11149) (_vacant!1632 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3166)

(declare-fun mapDefault!10099 () ValueCell!2633)

