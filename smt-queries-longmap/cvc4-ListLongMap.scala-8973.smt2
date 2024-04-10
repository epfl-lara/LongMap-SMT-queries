; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108568 () Bool)

(assert start!108568)

(declare-fun b_free!28115 () Bool)

(declare-fun b_next!28115 () Bool)

(assert (=> start!108568 (= b_free!28115 (not b_next!28115))))

(declare-fun tp!99454 () Bool)

(declare-fun b_and!46175 () Bool)

(assert (=> start!108568 (= tp!99454 b_and!46175)))

(declare-fun b!1281651 () Bool)

(declare-fun e!732255 () Bool)

(declare-fun e!732252 () Bool)

(declare-fun mapRes!52184 () Bool)

(assert (=> b!1281651 (= e!732255 (and e!732252 mapRes!52184))))

(declare-fun condMapEmpty!52184 () Bool)

(declare-datatypes ((V!50109 0))(
  ( (V!50110 (val!16952 Int)) )
))
(declare-datatypes ((ValueCell!15979 0))(
  ( (ValueCellFull!15979 (v!19552 V!50109)) (EmptyCell!15979) )
))
(declare-datatypes ((array!84580 0))(
  ( (array!84581 (arr!40794 (Array (_ BitVec 32) ValueCell!15979)) (size!41344 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84580)

(declare-fun mapDefault!52184 () ValueCell!15979)

