; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43218 () Bool)

(assert start!43218)

(declare-fun b!478948 () Bool)

(declare-fun e!281699 () Bool)

(declare-fun e!281701 () Bool)

(declare-fun mapRes!22105 () Bool)

(assert (=> b!478948 (= e!281699 (and e!281701 mapRes!22105))))

(declare-fun condMapEmpty!22105 () Bool)

(declare-datatypes ((V!19213 0))(
  ( (V!19214 (val!6851 Int)) )
))
(declare-datatypes ((ValueCell!6442 0))(
  ( (ValueCellFull!6442 (v!9140 V!19213)) (EmptyCell!6442) )
))
(declare-datatypes ((array!30891 0))(
  ( (array!30892 (arr!14853 (Array (_ BitVec 32) ValueCell!6442)) (size!15211 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30891)

(declare-fun mapDefault!22105 () ValueCell!6442)

