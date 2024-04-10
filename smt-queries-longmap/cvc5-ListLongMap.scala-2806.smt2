; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40724 () Bool)

(assert start!40724)

(declare-fun b_free!10735 () Bool)

(declare-fun b_next!10735 () Bool)

(assert (=> start!40724 (= b_free!10735 (not b_next!10735))))

(declare-fun tp!38024 () Bool)

(declare-fun b_and!18743 () Bool)

(assert (=> start!40724 (= tp!38024 b_and!18743)))

(declare-fun b!450904 () Bool)

(declare-fun res!268440 () Bool)

(declare-fun e!264175 () Bool)

(assert (=> b!450904 (=> (not res!268440) (not e!264175))))

(declare-datatypes ((array!27951 0))(
  ( (array!27952 (arr!13421 (Array (_ BitVec 32) (_ BitVec 64))) (size!13773 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27951)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450904 (= res!268440 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!450905 () Bool)

(declare-fun e!264178 () Bool)

(declare-fun e!264180 () Bool)

(declare-fun mapRes!19743 () Bool)

(assert (=> b!450905 (= e!264178 (and e!264180 mapRes!19743))))

(declare-fun condMapEmpty!19743 () Bool)

(declare-datatypes ((V!17203 0))(
  ( (V!17204 (val!6081 Int)) )
))
(declare-datatypes ((ValueCell!5693 0))(
  ( (ValueCellFull!5693 (v!8336 V!17203)) (EmptyCell!5693) )
))
(declare-datatypes ((array!27953 0))(
  ( (array!27954 (arr!13422 (Array (_ BitVec 32) ValueCell!5693)) (size!13774 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27953)

(declare-fun mapDefault!19743 () ValueCell!5693)

