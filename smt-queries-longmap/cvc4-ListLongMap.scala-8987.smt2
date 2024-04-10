; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108686 () Bool)

(assert start!108686)

(declare-fun b_free!28199 () Bool)

(declare-fun b_next!28199 () Bool)

(assert (=> start!108686 (= b_free!28199 (not b_next!28199))))

(declare-fun tp!99713 () Bool)

(declare-fun b_and!46265 () Bool)

(assert (=> start!108686 (= tp!99713 b_and!46265)))

(declare-fun b!1283020 () Bool)

(declare-fun e!733051 () Bool)

(declare-fun e!733053 () Bool)

(declare-fun mapRes!52316 () Bool)

(assert (=> b!1283020 (= e!733051 (and e!733053 mapRes!52316))))

(declare-fun condMapEmpty!52316 () Bool)

(declare-datatypes ((V!50221 0))(
  ( (V!50222 (val!16994 Int)) )
))
(declare-datatypes ((ValueCell!16021 0))(
  ( (ValueCellFull!16021 (v!19596 V!50221)) (EmptyCell!16021) )
))
(declare-datatypes ((array!84742 0))(
  ( (array!84743 (arr!40873 (Array (_ BitVec 32) ValueCell!16021)) (size!41423 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84742)

(declare-fun mapDefault!52316 () ValueCell!16021)

