; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40082 () Bool)

(assert start!40082)

(declare-fun b_free!10349 () Bool)

(declare-fun b_next!10349 () Bool)

(assert (=> start!40082 (= b_free!10349 (not b_next!10349))))

(declare-fun tp!36575 () Bool)

(declare-fun b_and!18317 () Bool)

(assert (=> start!40082 (= tp!36575 b_and!18317)))

(declare-fun b!437732 () Bool)

(declare-fun e!258309 () Bool)

(declare-fun e!258306 () Bool)

(declare-fun mapRes!18873 () Bool)

(assert (=> b!437732 (= e!258309 (and e!258306 mapRes!18873))))

(declare-fun condMapEmpty!18873 () Bool)

(declare-datatypes ((V!16439 0))(
  ( (V!16440 (val!5795 Int)) )
))
(declare-datatypes ((ValueCell!5407 0))(
  ( (ValueCellFull!5407 (v!8042 V!16439)) (EmptyCell!5407) )
))
(declare-datatypes ((array!26821 0))(
  ( (array!26822 (arr!12860 (Array (_ BitVec 32) ValueCell!5407)) (size!13212 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26821)

(declare-fun mapDefault!18873 () ValueCell!5407)

