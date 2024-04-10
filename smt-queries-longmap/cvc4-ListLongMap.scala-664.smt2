; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16404 () Bool)

(assert start!16404)

(declare-fun b!163409 () Bool)

(declare-fun b_free!3797 () Bool)

(declare-fun b_next!3797 () Bool)

(assert (=> b!163409 (= b_free!3797 (not b_next!3797))))

(declare-fun tp!13975 () Bool)

(declare-fun b_and!10211 () Bool)

(assert (=> b!163409 (= tp!13975 b_and!10211)))

(declare-fun b!163407 () Bool)

(declare-fun e!107222 () Bool)

(declare-fun tp_is_empty!3599 () Bool)

(assert (=> b!163407 (= e!107222 tp_is_empty!3599)))

(declare-fun b!163408 () Bool)

(declare-fun e!107219 () Bool)

(declare-fun e!107223 () Bool)

(declare-fun mapRes!6100 () Bool)

(assert (=> b!163408 (= e!107219 (and e!107223 mapRes!6100))))

(declare-fun condMapEmpty!6100 () Bool)

(declare-datatypes ((V!4445 0))(
  ( (V!4446 (val!1844 Int)) )
))
(declare-datatypes ((ValueCell!1456 0))(
  ( (ValueCellFull!1456 (v!3709 V!4445)) (EmptyCell!1456) )
))
(declare-datatypes ((array!6285 0))(
  ( (array!6286 (arr!2983 (Array (_ BitVec 32) (_ BitVec 64))) (size!3269 (_ BitVec 32))) )
))
(declare-datatypes ((array!6287 0))(
  ( (array!6288 (arr!2984 (Array (_ BitVec 32) ValueCell!1456)) (size!3270 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1820 0))(
  ( (LongMapFixedSize!1821 (defaultEntry!3352 Int) (mask!8008 (_ BitVec 32)) (extraKeys!3093 (_ BitVec 32)) (zeroValue!3195 V!4445) (minValue!3195 V!4445) (_size!959 (_ BitVec 32)) (_keys!5163 array!6285) (_values!3335 array!6287) (_vacant!959 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1820)

(declare-fun mapDefault!6100 () ValueCell!1456)

