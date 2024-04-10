; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133678 () Bool)

(assert start!133678)

(declare-fun b!1562958 () Bool)

(declare-fun e!871046 () Bool)

(declare-fun e!871045 () Bool)

(declare-fun mapRes!59517 () Bool)

(assert (=> b!1562958 (= e!871046 (and e!871045 mapRes!59517))))

(declare-fun condMapEmpty!59517 () Bool)

(declare-datatypes ((V!59889 0))(
  ( (V!59890 (val!19464 Int)) )
))
(declare-datatypes ((ValueCell!18350 0))(
  ( (ValueCellFull!18350 (v!22216 V!59889)) (EmptyCell!18350) )
))
(declare-datatypes ((array!104226 0))(
  ( (array!104227 (arr!50305 (Array (_ BitVec 32) ValueCell!18350)) (size!50855 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104226)

(declare-fun mapDefault!59517 () ValueCell!18350)

