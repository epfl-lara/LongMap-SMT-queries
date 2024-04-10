; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109490 () Bool)

(assert start!109490)

(declare-fun b_free!28979 () Bool)

(declare-fun b_next!28979 () Bool)

(assert (=> start!109490 (= b_free!28979 (not b_next!28979))))

(declare-fun tp!102056 () Bool)

(declare-fun b_and!47069 () Bool)

(assert (=> start!109490 (= tp!102056 b_and!47069)))

(declare-fun b!1296774 () Bool)

(declare-fun e!739816 () Bool)

(declare-fun e!739817 () Bool)

(declare-fun mapRes!53489 () Bool)

(assert (=> b!1296774 (= e!739816 (and e!739817 mapRes!53489))))

(declare-fun condMapEmpty!53489 () Bool)

(declare-datatypes ((V!51261 0))(
  ( (V!51262 (val!17384 Int)) )
))
(declare-datatypes ((ValueCell!16411 0))(
  ( (ValueCellFull!16411 (v!19987 V!51261)) (EmptyCell!16411) )
))
(declare-datatypes ((array!86256 0))(
  ( (array!86257 (arr!41629 (Array (_ BitVec 32) ValueCell!16411)) (size!42179 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86256)

(declare-fun mapDefault!53489 () ValueCell!16411)

