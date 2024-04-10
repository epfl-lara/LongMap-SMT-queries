; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109018 () Bool)

(assert start!109018)

(declare-fun b_free!28507 () Bool)

(declare-fun b_next!28507 () Bool)

(assert (=> start!109018 (= b_free!28507 (not b_next!28507))))

(declare-fun tp!100639 () Bool)

(declare-fun b_and!46597 () Bool)

(assert (=> start!109018 (= tp!100639 b_and!46597)))

(declare-fun b!1288409 () Bool)

(declare-fun e!735703 () Bool)

(declare-fun e!735704 () Bool)

(declare-fun mapRes!52781 () Bool)

(assert (=> b!1288409 (= e!735703 (and e!735704 mapRes!52781))))

(declare-fun condMapEmpty!52781 () Bool)

(declare-datatypes ((V!50633 0))(
  ( (V!50634 (val!17148 Int)) )
))
(declare-datatypes ((ValueCell!16175 0))(
  ( (ValueCellFull!16175 (v!19751 V!50633)) (EmptyCell!16175) )
))
(declare-datatypes ((array!85340 0))(
  ( (array!85341 (arr!41171 (Array (_ BitVec 32) ValueCell!16175)) (size!41721 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85340)

(declare-fun mapDefault!52781 () ValueCell!16175)

