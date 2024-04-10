; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40124 () Bool)

(assert start!40124)

(declare-fun b_free!10391 () Bool)

(declare-fun b_next!10391 () Bool)

(assert (=> start!40124 (= b_free!10391 (not b_next!10391))))

(declare-fun tp!36701 () Bool)

(declare-fun b_and!18359 () Bool)

(assert (=> start!40124 (= tp!36701 b_and!18359)))

(declare-fun b!438740 () Bool)

(declare-fun res!259128 () Bool)

(declare-fun e!258749 () Bool)

(assert (=> b!438740 (=> (not res!259128) (not e!258749))))

(declare-datatypes ((array!26903 0))(
  ( (array!26904 (arr!12901 (Array (_ BitVec 32) (_ BitVec 64))) (size!13253 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26903)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438740 (= res!259128 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18936 () Bool)

(declare-fun mapRes!18936 () Bool)

(declare-fun tp!36702 () Bool)

(declare-fun e!258748 () Bool)

(assert (=> mapNonEmpty!18936 (= mapRes!18936 (and tp!36702 e!258748))))

(declare-datatypes ((V!16495 0))(
  ( (V!16496 (val!5816 Int)) )
))
(declare-datatypes ((ValueCell!5428 0))(
  ( (ValueCellFull!5428 (v!8063 V!16495)) (EmptyCell!5428) )
))
(declare-fun mapRest!18936 () (Array (_ BitVec 32) ValueCell!5428))

(declare-fun mapKey!18936 () (_ BitVec 32))

(declare-datatypes ((array!26905 0))(
  ( (array!26906 (arr!12902 (Array (_ BitVec 32) ValueCell!5428)) (size!13254 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26905)

(declare-fun mapValue!18936 () ValueCell!5428)

(assert (=> mapNonEmpty!18936 (= (arr!12902 _values!549) (store mapRest!18936 mapKey!18936 mapValue!18936))))

(declare-fun res!259125 () Bool)

(assert (=> start!40124 (=> (not res!259125) (not e!258749))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40124 (= res!259125 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13253 _keys!709))))))

(assert (=> start!40124 e!258749))

(declare-fun tp_is_empty!11543 () Bool)

(assert (=> start!40124 tp_is_empty!11543))

(assert (=> start!40124 tp!36701))

(assert (=> start!40124 true))

(declare-fun e!258752 () Bool)

(declare-fun array_inv!9370 (array!26905) Bool)

(assert (=> start!40124 (and (array_inv!9370 _values!549) e!258752)))

(declare-fun array_inv!9371 (array!26903) Bool)

(assert (=> start!40124 (array_inv!9371 _keys!709)))

(declare-fun b!438741 () Bool)

(declare-fun res!259118 () Bool)

(declare-fun e!258753 () Bool)

(assert (=> b!438741 (=> (not res!259118) (not e!258753))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438741 (= res!259118 (bvsle from!863 i!563))))

(declare-fun b!438742 () Bool)

(declare-fun res!259122 () Bool)

(assert (=> b!438742 (=> (not res!259122) (not e!258749))))

(assert (=> b!438742 (= res!259122 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13253 _keys!709))))))

(declare-fun b!438743 () Bool)

(declare-fun res!259117 () Bool)

(assert (=> b!438743 (=> (not res!259117) (not e!258749))))

(declare-datatypes ((List!7716 0))(
  ( (Nil!7713) (Cons!7712 (h!8568 (_ BitVec 64)) (t!13472 List!7716)) )
))
(declare-fun arrayNoDuplicates!0 (array!26903 (_ BitVec 32) List!7716) Bool)

(assert (=> b!438743 (= res!259117 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7713))))

(declare-fun mapIsEmpty!18936 () Bool)

(assert (=> mapIsEmpty!18936 mapRes!18936))

(declare-fun b!438744 () Bool)

(declare-fun e!258747 () Bool)

(assert (=> b!438744 (= e!258752 (and e!258747 mapRes!18936))))

(declare-fun condMapEmpty!18936 () Bool)

(declare-fun mapDefault!18936 () ValueCell!5428)

