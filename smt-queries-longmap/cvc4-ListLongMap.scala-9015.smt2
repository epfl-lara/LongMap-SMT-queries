; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108854 () Bool)

(assert start!108854)

(declare-fun b_free!28367 () Bool)

(declare-fun b_next!28367 () Bool)

(assert (=> start!108854 (= b_free!28367 (not b_next!28367))))

(declare-fun tp!100217 () Bool)

(declare-fun b_and!46433 () Bool)

(assert (=> start!108854 (= tp!100217 b_and!46433)))

(declare-fun b!1285535 () Bool)

(declare-fun e!734313 () Bool)

(declare-fun e!734314 () Bool)

(declare-fun mapRes!52568 () Bool)

(assert (=> b!1285535 (= e!734313 (and e!734314 mapRes!52568))))

(declare-fun condMapEmpty!52568 () Bool)

(declare-datatypes ((V!50445 0))(
  ( (V!50446 (val!17078 Int)) )
))
(declare-datatypes ((ValueCell!16105 0))(
  ( (ValueCellFull!16105 (v!19680 V!50445)) (EmptyCell!16105) )
))
(declare-datatypes ((array!85070 0))(
  ( (array!85071 (arr!41037 (Array (_ BitVec 32) ValueCell!16105)) (size!41587 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85070)

(declare-fun mapDefault!52568 () ValueCell!16105)

