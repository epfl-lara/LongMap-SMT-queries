; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133690 () Bool)

(assert start!133690)

(declare-fun b!1563072 () Bool)

(declare-fun e!871136 () Bool)

(declare-fun e!871134 () Bool)

(declare-fun mapRes!59535 () Bool)

(assert (=> b!1563072 (= e!871136 (and e!871134 mapRes!59535))))

(declare-fun condMapEmpty!59535 () Bool)

(declare-datatypes ((V!59905 0))(
  ( (V!59906 (val!19470 Int)) )
))
(declare-datatypes ((ValueCell!18356 0))(
  ( (ValueCellFull!18356 (v!22222 V!59905)) (EmptyCell!18356) )
))
(declare-datatypes ((array!104246 0))(
  ( (array!104247 (arr!50315 (Array (_ BitVec 32) ValueCell!18356)) (size!50865 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104246)

(declare-fun mapDefault!59535 () ValueCell!18356)

