; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110068 () Bool)

(assert start!110068)

(declare-fun b_free!29267 () Bool)

(declare-fun b_next!29267 () Bool)

(assert (=> start!110068 (= b_free!29267 (not b_next!29267))))

(declare-fun tp!102951 () Bool)

(declare-fun b_and!47431 () Bool)

(assert (=> start!110068 (= tp!102951 b_and!47431)))

(declare-fun b!1303550 () Bool)

(declare-fun e!743528 () Bool)

(declare-fun e!743526 () Bool)

(declare-fun mapRes!53953 () Bool)

(assert (=> b!1303550 (= e!743528 (and e!743526 mapRes!53953))))

(declare-fun condMapEmpty!53953 () Bool)

(declare-datatypes ((V!51645 0))(
  ( (V!51646 (val!17528 Int)) )
))
(declare-datatypes ((ValueCell!16555 0))(
  ( (ValueCellFull!16555 (v!20144 V!51645)) (EmptyCell!16555) )
))
(declare-datatypes ((array!86826 0))(
  ( (array!86827 (arr!41904 (Array (_ BitVec 32) ValueCell!16555)) (size!42454 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86826)

(declare-fun mapDefault!53953 () ValueCell!16555)

