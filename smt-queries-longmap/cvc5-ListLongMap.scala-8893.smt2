; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107998 () Bool)

(assert start!107998)

(declare-fun b!1275676 () Bool)

(declare-fun e!728288 () Bool)

(declare-fun e!728287 () Bool)

(declare-fun mapRes!51434 () Bool)

(assert (=> b!1275676 (= e!728288 (and e!728287 mapRes!51434))))

(declare-fun condMapEmpty!51434 () Bool)

(declare-datatypes ((V!49465 0))(
  ( (V!49466 (val!16710 Int)) )
))
(declare-datatypes ((ValueCell!15737 0))(
  ( (ValueCellFull!15737 (v!19307 V!49465)) (EmptyCell!15737) )
))
(declare-datatypes ((array!83650 0))(
  ( (array!83651 (arr!40337 (Array (_ BitVec 32) ValueCell!15737)) (size!40887 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83650)

(declare-fun mapDefault!51434 () ValueCell!15737)

