; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109124 () Bool)

(assert start!109124)

(declare-fun b_free!28613 () Bool)

(declare-fun b_next!28613 () Bool)

(assert (=> start!109124 (= b_free!28613 (not b_next!28613))))

(declare-fun tp!100958 () Bool)

(declare-fun b_and!46703 () Bool)

(assert (=> start!109124 (= tp!100958 b_and!46703)))

(declare-fun b!1290317 () Bool)

(declare-fun e!736655 () Bool)

(declare-fun e!736653 () Bool)

(declare-fun mapRes!52940 () Bool)

(assert (=> b!1290317 (= e!736655 (and e!736653 mapRes!52940))))

(declare-fun condMapEmpty!52940 () Bool)

(declare-datatypes ((V!50773 0))(
  ( (V!50774 (val!17201 Int)) )
))
(declare-datatypes ((ValueCell!16228 0))(
  ( (ValueCellFull!16228 (v!19804 V!50773)) (EmptyCell!16228) )
))
(declare-datatypes ((array!85548 0))(
  ( (array!85549 (arr!41275 (Array (_ BitVec 32) ValueCell!16228)) (size!41825 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85548)

(declare-fun mapDefault!52940 () ValueCell!16228)

