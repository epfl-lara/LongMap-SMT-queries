; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109054 () Bool)

(assert start!109054)

(declare-fun b_free!28543 () Bool)

(declare-fun b_next!28543 () Bool)

(assert (=> start!109054 (= b_free!28543 (not b_next!28543))))

(declare-fun tp!100748 () Bool)

(declare-fun b_and!46633 () Bool)

(assert (=> start!109054 (= tp!100748 b_and!46633)))

(declare-fun b!1289057 () Bool)

(declare-fun e!736025 () Bool)

(declare-fun e!736023 () Bool)

(declare-fun mapRes!52835 () Bool)

(assert (=> b!1289057 (= e!736025 (and e!736023 mapRes!52835))))

(declare-fun condMapEmpty!52835 () Bool)

(declare-datatypes ((V!50681 0))(
  ( (V!50682 (val!17166 Int)) )
))
(declare-datatypes ((ValueCell!16193 0))(
  ( (ValueCellFull!16193 (v!19769 V!50681)) (EmptyCell!16193) )
))
(declare-datatypes ((array!85410 0))(
  ( (array!85411 (arr!41206 (Array (_ BitVec 32) ValueCell!16193)) (size!41756 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85410)

(declare-fun mapDefault!52835 () ValueCell!16193)

