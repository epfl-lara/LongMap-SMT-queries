; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83238 () Bool)

(assert start!83238)

(declare-fun b_free!19231 () Bool)

(declare-fun b_next!19231 () Bool)

(assert (=> start!83238 (= b_free!19231 (not b_next!19231))))

(declare-fun tp!66971 () Bool)

(declare-fun b_and!30719 () Bool)

(assert (=> start!83238 (= tp!66971 b_and!30719)))

(declare-fun b!971269 () Bool)

(declare-fun e!547534 () Bool)

(declare-fun e!547532 () Bool)

(declare-fun mapRes!35203 () Bool)

(assert (=> b!971269 (= e!547534 (and e!547532 mapRes!35203))))

(declare-fun condMapEmpty!35203 () Bool)

(declare-datatypes ((V!34489 0))(
  ( (V!34490 (val!11115 Int)) )
))
(declare-datatypes ((ValueCell!10583 0))(
  ( (ValueCellFull!10583 (v!13674 V!34489)) (EmptyCell!10583) )
))
(declare-datatypes ((array!60309 0))(
  ( (array!60310 (arr!29018 (Array (_ BitVec 32) ValueCell!10583)) (size!29497 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60309)

(declare-fun mapDefault!35203 () ValueCell!10583)

