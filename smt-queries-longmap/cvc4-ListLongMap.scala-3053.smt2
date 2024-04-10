; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43126 () Bool)

(assert start!43126)

(declare-fun b!478326 () Bool)

(declare-fun e!281209 () Bool)

(declare-fun e!281206 () Bool)

(declare-fun mapRes!22012 () Bool)

(assert (=> b!478326 (= e!281209 (and e!281206 mapRes!22012))))

(declare-fun condMapEmpty!22012 () Bool)

(declare-datatypes ((V!19141 0))(
  ( (V!19142 (val!6824 Int)) )
))
(declare-datatypes ((ValueCell!6415 0))(
  ( (ValueCellFull!6415 (v!9112 V!19141)) (EmptyCell!6415) )
))
(declare-datatypes ((array!30777 0))(
  ( (array!30778 (arr!14800 (Array (_ BitVec 32) ValueCell!6415)) (size!15158 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30777)

(declare-fun mapDefault!22012 () ValueCell!6415)

