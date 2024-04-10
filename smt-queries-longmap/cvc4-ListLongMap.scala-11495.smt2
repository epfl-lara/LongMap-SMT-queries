; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133782 () Bool)

(assert start!133782)

(declare-fun b!1564295 () Bool)

(declare-fun e!871866 () Bool)

(declare-fun e!871869 () Bool)

(declare-fun mapRes!59661 () Bool)

(assert (=> b!1564295 (= e!871866 (and e!871869 mapRes!59661))))

(declare-fun condMapEmpty!59661 () Bool)

(declare-datatypes ((V!60013 0))(
  ( (V!60014 (val!19511 Int)) )
))
(declare-datatypes ((ValueCell!18397 0))(
  ( (ValueCellFull!18397 (v!22263 V!60013)) (EmptyCell!18397) )
))
(declare-datatypes ((array!104402 0))(
  ( (array!104403 (arr!50392 (Array (_ BitVec 32) ValueCell!18397)) (size!50942 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104402)

(declare-fun mapDefault!59661 () ValueCell!18397)

