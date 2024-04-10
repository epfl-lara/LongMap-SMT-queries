; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40306 () Bool)

(assert start!40306)

(declare-fun b!442596 () Bool)

(declare-fun res!262145 () Bool)

(declare-fun e!260496 () Bool)

(assert (=> b!442596 (=> (not res!262145) (not e!260496))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442596 (= res!262145 (validMask!0 mask!1025))))

(declare-fun res!262146 () Bool)

(assert (=> start!40306 (=> (not res!262146) (not e!260496))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27223 0))(
  ( (array!27224 (arr!13060 (Array (_ BitVec 32) (_ BitVec 64))) (size!13412 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27223)

(assert (=> start!40306 (= res!262146 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13412 _keys!709))))))

(assert (=> start!40306 e!260496))

(assert (=> start!40306 true))

(declare-datatypes ((V!16711 0))(
  ( (V!16712 (val!5897 Int)) )
))
(declare-datatypes ((ValueCell!5509 0))(
  ( (ValueCellFull!5509 (v!8148 V!16711)) (EmptyCell!5509) )
))
(declare-datatypes ((array!27225 0))(
  ( (array!27226 (arr!13061 (Array (_ BitVec 32) ValueCell!5509)) (size!13413 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27225)

(declare-fun e!260497 () Bool)

(declare-fun array_inv!9476 (array!27225) Bool)

(assert (=> start!40306 (and (array_inv!9476 _values!549) e!260497)))

(declare-fun array_inv!9477 (array!27223) Bool)

(assert (=> start!40306 (array_inv!9477 _keys!709)))

(declare-fun b!442597 () Bool)

(declare-fun e!260500 () Bool)

(declare-fun mapRes!19182 () Bool)

(assert (=> b!442597 (= e!260497 (and e!260500 mapRes!19182))))

(declare-fun condMapEmpty!19182 () Bool)

(declare-fun mapDefault!19182 () ValueCell!5509)

