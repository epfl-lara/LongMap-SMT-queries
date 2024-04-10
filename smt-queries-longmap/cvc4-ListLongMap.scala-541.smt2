; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13964 () Bool)

(assert start!13964)

(declare-fun b!129265 () Bool)

(declare-fun b_free!2889 () Bool)

(declare-fun b_next!2889 () Bool)

(assert (=> b!129265 (= b_free!2889 (not b_next!2889))))

(declare-fun tp!11091 () Bool)

(declare-fun b_and!7999 () Bool)

(assert (=> b!129265 (= tp!11091 b_and!7999)))

(declare-fun b!129270 () Bool)

(declare-fun b_free!2891 () Bool)

(declare-fun b_next!2891 () Bool)

(assert (=> b!129270 (= b_free!2891 (not b_next!2891))))

(declare-fun tp!11089 () Bool)

(declare-fun b_and!8001 () Bool)

(assert (=> b!129270 (= tp!11089 b_and!8001)))

(declare-fun b!129262 () Bool)

(declare-fun e!84400 () Bool)

(declare-fun e!84397 () Bool)

(declare-fun mapRes!4576 () Bool)

(assert (=> b!129262 (= e!84400 (and e!84397 mapRes!4576))))

(declare-fun condMapEmpty!4576 () Bool)

(declare-datatypes ((V!3461 0))(
  ( (V!3462 (val!1475 Int)) )
))
(declare-datatypes ((array!4743 0))(
  ( (array!4744 (arr!2245 (Array (_ BitVec 32) (_ BitVec 64))) (size!2511 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1087 0))(
  ( (ValueCellFull!1087 (v!3163 V!3461)) (EmptyCell!1087) )
))
(declare-datatypes ((array!4745 0))(
  ( (array!4746 (arr!2246 (Array (_ BitVec 32) ValueCell!1087)) (size!2512 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1082 0))(
  ( (LongMapFixedSize!1083 (defaultEntry!2825 Int) (mask!7103 (_ BitVec 32)) (extraKeys!2598 (_ BitVec 32)) (zeroValue!2684 V!3461) (minValue!2684 V!3461) (_size!590 (_ BitVec 32)) (_keys!4566 array!4743) (_values!2808 array!4745) (_vacant!590 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1082)

(declare-fun mapDefault!4575 () ValueCell!1087)

