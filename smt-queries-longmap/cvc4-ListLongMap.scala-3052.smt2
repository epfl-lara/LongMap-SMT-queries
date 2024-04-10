; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43114 () Bool)

(assert start!43114)

(declare-fun b!478266 () Bool)

(declare-fun e!281156 () Bool)

(declare-fun e!281157 () Bool)

(declare-fun mapRes!22000 () Bool)

(assert (=> b!478266 (= e!281156 (and e!281157 mapRes!22000))))

(declare-fun condMapEmpty!22000 () Bool)

(declare-datatypes ((V!19133 0))(
  ( (V!19134 (val!6821 Int)) )
))
(declare-datatypes ((ValueCell!6412 0))(
  ( (ValueCellFull!6412 (v!9109 V!19133)) (EmptyCell!6412) )
))
(declare-datatypes ((array!30765 0))(
  ( (array!30766 (arr!14795 (Array (_ BitVec 32) ValueCell!6412)) (size!15153 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30765)

(declare-fun mapDefault!22000 () ValueCell!6412)

