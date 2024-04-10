; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108594 () Bool)

(assert start!108594)

(declare-fun b_free!28121 () Bool)

(declare-fun b_next!28121 () Bool)

(assert (=> start!108594 (= b_free!28121 (not b_next!28121))))

(declare-fun tp!99476 () Bool)

(declare-fun b_and!46185 () Bool)

(assert (=> start!108594 (= tp!99476 b_and!46185)))

(declare-fun b!1281871 () Bool)

(declare-fun e!732396 () Bool)

(declare-fun e!732394 () Bool)

(declare-fun mapRes!52196 () Bool)

(assert (=> b!1281871 (= e!732396 (and e!732394 mapRes!52196))))

(declare-fun condMapEmpty!52196 () Bool)

(declare-datatypes ((V!50117 0))(
  ( (V!50118 (val!16955 Int)) )
))
(declare-datatypes ((ValueCell!15982 0))(
  ( (ValueCellFull!15982 (v!19556 V!50117)) (EmptyCell!15982) )
))
(declare-datatypes ((array!84592 0))(
  ( (array!84593 (arr!40799 (Array (_ BitVec 32) ValueCell!15982)) (size!41349 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84592)

(declare-fun mapDefault!52196 () ValueCell!15982)

