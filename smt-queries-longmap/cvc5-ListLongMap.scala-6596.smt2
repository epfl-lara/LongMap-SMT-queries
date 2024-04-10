; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83460 () Bool)

(assert start!83460)

(declare-fun b_free!19447 () Bool)

(declare-fun b_next!19447 () Bool)

(assert (=> start!83460 (= b_free!19447 (not b_next!19447))))

(declare-fun tp!67628 () Bool)

(declare-fun b_and!31049 () Bool)

(assert (=> start!83460 (= tp!67628 b_and!31049)))

(declare-fun b!974857 () Bool)

(declare-fun e!549459 () Bool)

(declare-fun e!549456 () Bool)

(declare-fun mapRes!35536 () Bool)

(assert (=> b!974857 (= e!549459 (and e!549456 mapRes!35536))))

(declare-fun condMapEmpty!35536 () Bool)

(declare-datatypes ((V!34785 0))(
  ( (V!34786 (val!11226 Int)) )
))
(declare-datatypes ((ValueCell!10694 0))(
  ( (ValueCellFull!10694 (v!13785 V!34785)) (EmptyCell!10694) )
))
(declare-datatypes ((array!60739 0))(
  ( (array!60740 (arr!29233 (Array (_ BitVec 32) ValueCell!10694)) (size!29712 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60739)

(declare-fun mapDefault!35536 () ValueCell!10694)

