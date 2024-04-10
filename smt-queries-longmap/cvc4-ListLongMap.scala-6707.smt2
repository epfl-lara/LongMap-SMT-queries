; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84218 () Bool)

(assert start!84218)

(declare-fun b_free!19919 () Bool)

(declare-fun b_next!19919 () Bool)

(assert (=> start!84218 (= b_free!19919 (not b_next!19919))))

(declare-fun tp!69360 () Bool)

(declare-fun b_and!31915 () Bool)

(assert (=> start!84218 (= tp!69360 b_and!31915)))

(declare-fun b!985122 () Bool)

(declare-fun res!659204 () Bool)

(declare-fun e!555318 () Bool)

(assert (=> b!985122 (=> (not res!659204) (not e!555318))))

(declare-datatypes ((array!62017 0))(
  ( (array!62018 (arr!29866 (Array (_ BitVec 32) (_ BitVec 64))) (size!30345 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62017)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985122 (= res!659204 (validKeyInArray!0 (select (arr!29866 _keys!1544) from!1932)))))

(declare-fun b!985123 () Bool)

(declare-fun e!555316 () Bool)

(declare-fun e!555313 () Bool)

(declare-fun mapRes!36560 () Bool)

(assert (=> b!985123 (= e!555316 (and e!555313 mapRes!36560))))

(declare-fun condMapEmpty!36560 () Bool)

(declare-datatypes ((V!35677 0))(
  ( (V!35678 (val!11561 Int)) )
))
(declare-datatypes ((ValueCell!11029 0))(
  ( (ValueCellFull!11029 (v!14123 V!35677)) (EmptyCell!11029) )
))
(declare-datatypes ((array!62019 0))(
  ( (array!62020 (arr!29867 (Array (_ BitVec 32) ValueCell!11029)) (size!30346 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62019)

(declare-fun mapDefault!36560 () ValueCell!11029)

