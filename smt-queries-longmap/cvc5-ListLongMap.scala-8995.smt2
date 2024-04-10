; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108730 () Bool)

(assert start!108730)

(declare-fun b_free!28243 () Bool)

(declare-fun b_next!28243 () Bool)

(assert (=> start!108730 (= b_free!28243 (not b_next!28243))))

(declare-fun tp!99845 () Bool)

(declare-fun b_and!46309 () Bool)

(assert (=> start!108730 (= tp!99845 b_and!46309)))

(declare-fun b!1283812 () Bool)

(declare-fun e!733383 () Bool)

(declare-fun e!733384 () Bool)

(declare-fun mapRes!52382 () Bool)

(assert (=> b!1283812 (= e!733383 (and e!733384 mapRes!52382))))

(declare-fun condMapEmpty!52382 () Bool)

(declare-datatypes ((V!50281 0))(
  ( (V!50282 (val!17016 Int)) )
))
(declare-datatypes ((ValueCell!16043 0))(
  ( (ValueCellFull!16043 (v!19618 V!50281)) (EmptyCell!16043) )
))
(declare-datatypes ((array!84828 0))(
  ( (array!84829 (arr!40916 (Array (_ BitVec 32) ValueCell!16043)) (size!41466 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84828)

(declare-fun mapDefault!52382 () ValueCell!16043)

