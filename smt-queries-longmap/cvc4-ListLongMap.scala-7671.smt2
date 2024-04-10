; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96376 () Bool)

(assert start!96376)

(declare-fun b_free!22955 () Bool)

(declare-fun b_next!22955 () Bool)

(assert (=> start!96376 (= b_free!22955 (not b_next!22955))))

(declare-fun tp!80791 () Bool)

(declare-fun b_and!36581 () Bool)

(assert (=> start!96376 (= tp!80791 b_and!36581)))

(declare-fun b!1095238 () Bool)

(declare-fun res!730913 () Bool)

(declare-fun e!625288 () Bool)

(assert (=> b!1095238 (=> (not res!730913) (not e!625288))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095238 (= res!730913 (validKeyInArray!0 k!904))))

(declare-fun b!1095239 () Bool)

(declare-fun e!625287 () Bool)

(declare-fun e!625286 () Bool)

(declare-fun mapRes!42268 () Bool)

(assert (=> b!1095239 (= e!625287 (and e!625286 mapRes!42268))))

(declare-fun condMapEmpty!42268 () Bool)

(declare-datatypes ((V!41133 0))(
  ( (V!41134 (val!13559 Int)) )
))
(declare-datatypes ((ValueCell!12793 0))(
  ( (ValueCellFull!12793 (v!16180 V!41133)) (EmptyCell!12793) )
))
(declare-datatypes ((array!70925 0))(
  ( (array!70926 (arr!34134 (Array (_ BitVec 32) ValueCell!12793)) (size!34670 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70925)

(declare-fun mapDefault!42268 () ValueCell!12793)

