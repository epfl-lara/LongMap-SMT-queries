; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10842 () Bool)

(assert start!10842)

(declare-fun b!87811 () Bool)

(declare-fun b_free!2253 () Bool)

(declare-fun b_next!2253 () Bool)

(assert (=> b!87811 (= b_free!2253 (not b_next!2253))))

(declare-fun tp!8994 () Bool)

(declare-fun b_and!5295 () Bool)

(assert (=> b!87811 (= tp!8994 b_and!5295)))

(declare-fun b!87806 () Bool)

(declare-fun b_free!2255 () Bool)

(declare-fun b_next!2255 () Bool)

(assert (=> b!87806 (= b_free!2255 (not b_next!2255))))

(declare-fun tp!8991 () Bool)

(declare-fun b_and!5297 () Bool)

(assert (=> b!87806 (= tp!8991 b_and!5297)))

(declare-fun b!87804 () Bool)

(declare-fun e!57228 () Bool)

(declare-fun e!57223 () Bool)

(declare-fun mapRes!3432 () Bool)

(assert (=> b!87804 (= e!57228 (and e!57223 mapRes!3432))))

(declare-fun condMapEmpty!3431 () Bool)

(declare-datatypes ((V!3037 0))(
  ( (V!3038 (val!1316 Int)) )
))
(declare-datatypes ((array!4047 0))(
  ( (array!4048 (arr!1927 (Array (_ BitVec 32) (_ BitVec 64))) (size!2172 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!928 0))(
  ( (ValueCellFull!928 (v!2662 V!3037)) (EmptyCell!928) )
))
(declare-datatypes ((array!4049 0))(
  ( (array!4050 (arr!1928 (Array (_ BitVec 32) ValueCell!928)) (size!2173 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!764 0))(
  ( (LongMapFixedSize!765 (defaultEntry!2360 Int) (mask!6398 (_ BitVec 32)) (extraKeys!2195 (_ BitVec 32)) (zeroValue!2250 V!3037) (minValue!2250 V!3037) (_size!431 (_ BitVec 32)) (_keys!4036 array!4047) (_values!2343 array!4049) (_vacant!431 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!564 0))(
  ( (Cell!565 (v!2663 LongMapFixedSize!764)) )
))
(declare-datatypes ((LongMap!564 0))(
  ( (LongMap!565 (underlying!293 Cell!564)) )
))
(declare-fun thiss!992 () LongMap!564)

(declare-fun mapDefault!3432 () ValueCell!928)

