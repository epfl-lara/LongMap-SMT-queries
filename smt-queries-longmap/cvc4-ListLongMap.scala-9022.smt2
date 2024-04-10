; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108896 () Bool)

(assert start!108896)

(declare-fun b_free!28409 () Bool)

(declare-fun b_next!28409 () Bool)

(assert (=> start!108896 (= b_free!28409 (not b_next!28409))))

(declare-fun tp!100342 () Bool)

(declare-fun b_and!46479 () Bool)

(assert (=> start!108896 (= tp!100342 b_and!46479)))

(declare-fun b!1286303 () Bool)

(declare-fun e!734688 () Bool)

(declare-fun e!734691 () Bool)

(declare-fun mapRes!52631 () Bool)

(assert (=> b!1286303 (= e!734688 (and e!734691 mapRes!52631))))

(declare-fun condMapEmpty!52631 () Bool)

(declare-datatypes ((V!50501 0))(
  ( (V!50502 (val!17099 Int)) )
))
(declare-datatypes ((ValueCell!16126 0))(
  ( (ValueCellFull!16126 (v!19701 V!50501)) (EmptyCell!16126) )
))
(declare-datatypes ((array!85148 0))(
  ( (array!85149 (arr!41076 (Array (_ BitVec 32) ValueCell!16126)) (size!41626 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85148)

(declare-fun mapDefault!52631 () ValueCell!16126)

