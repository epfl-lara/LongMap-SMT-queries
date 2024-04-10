; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99056 () Bool)

(assert start!99056)

(declare-fun b_free!24661 () Bool)

(declare-fun b_next!24661 () Bool)

(assert (=> start!99056 (= b_free!24661 (not b_next!24661))))

(declare-fun tp!86693 () Bool)

(declare-fun b_and!40171 () Bool)

(assert (=> start!99056 (= tp!86693 b_and!40171)))

(declare-fun b!1164666 () Bool)

(declare-fun res!772355 () Bool)

(declare-fun e!662175 () Bool)

(assert (=> b!1164666 (=> (not res!772355) (not e!662175))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164666 (= res!772355 (validMask!0 mask!1564))))

(declare-fun b!1164667 () Bool)

(declare-fun e!662172 () Bool)

(declare-fun e!662173 () Bool)

(declare-fun mapRes!45611 () Bool)

(assert (=> b!1164667 (= e!662172 (and e!662173 mapRes!45611))))

(declare-fun condMapEmpty!45611 () Bool)

(declare-datatypes ((V!44049 0))(
  ( (V!44050 (val!14652 Int)) )
))
(declare-datatypes ((ValueCell!13886 0))(
  ( (ValueCellFull!13886 (v!17289 V!44049)) (EmptyCell!13886) )
))
(declare-datatypes ((array!75215 0))(
  ( (array!75216 (arr!36258 (Array (_ BitVec 32) ValueCell!13886)) (size!36794 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75215)

(declare-fun mapDefault!45611 () ValueCell!13886)

