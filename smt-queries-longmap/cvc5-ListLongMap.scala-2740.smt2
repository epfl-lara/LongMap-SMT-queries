; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40258 () Bool)

(assert start!40258)

(declare-fun res!261728 () Bool)

(declare-fun e!260156 () Bool)

(assert (=> start!40258 (=> (not res!261728) (not e!260156))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27165 0))(
  ( (array!27166 (arr!13032 (Array (_ BitVec 32) (_ BitVec 64))) (size!13384 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27165)

(assert (=> start!40258 (= res!261728 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13384 _keys!709))))))

(assert (=> start!40258 e!260156))

(assert (=> start!40258 true))

(declare-datatypes ((V!16675 0))(
  ( (V!16676 (val!5883 Int)) )
))
(declare-datatypes ((ValueCell!5495 0))(
  ( (ValueCellFull!5495 (v!8130 V!16675)) (EmptyCell!5495) )
))
(declare-datatypes ((array!27167 0))(
  ( (array!27168 (arr!13033 (Array (_ BitVec 32) ValueCell!5495)) (size!13385 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27167)

(declare-fun e!260153 () Bool)

(declare-fun array_inv!9458 (array!27167) Bool)

(assert (=> start!40258 (and (array_inv!9458 _values!549) e!260153)))

(declare-fun array_inv!9459 (array!27165) Bool)

(assert (=> start!40258 (array_inv!9459 _keys!709)))

(declare-fun b!441950 () Bool)

(declare-fun res!261724 () Bool)

(assert (=> b!441950 (=> (not res!261724) (not e!260156))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441950 (= res!261724 (validKeyInArray!0 k!794))))

(declare-fun b!441951 () Bool)

(declare-fun e!260157 () Bool)

(declare-fun mapRes!19137 () Bool)

(assert (=> b!441951 (= e!260153 (and e!260157 mapRes!19137))))

(declare-fun condMapEmpty!19137 () Bool)

(declare-fun mapDefault!19137 () ValueCell!5495)

