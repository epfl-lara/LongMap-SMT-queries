; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40150 () Bool)

(assert start!40150)

(declare-fun b_free!10417 () Bool)

(declare-fun b_next!10417 () Bool)

(assert (=> start!40150 (= b_free!10417 (not b_next!10417))))

(declare-fun tp!36780 () Bool)

(declare-fun b_and!18385 () Bool)

(assert (=> start!40150 (= tp!36780 b_and!18385)))

(declare-fun b!439364 () Bool)

(declare-fun res!259633 () Bool)

(declare-fun e!259025 () Bool)

(assert (=> b!439364 (=> (not res!259633) (not e!259025))))

(declare-datatypes ((array!26955 0))(
  ( (array!26956 (arr!12927 (Array (_ BitVec 32) (_ BitVec 64))) (size!13279 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26955)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16531 0))(
  ( (V!16532 (val!5829 Int)) )
))
(declare-datatypes ((ValueCell!5441 0))(
  ( (ValueCellFull!5441 (v!8076 V!16531)) (EmptyCell!5441) )
))
(declare-datatypes ((array!26957 0))(
  ( (array!26958 (arr!12928 (Array (_ BitVec 32) ValueCell!5441)) (size!13280 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26957)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!439364 (= res!259633 (and (= (size!13280 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13279 _keys!709) (size!13280 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18975 () Bool)

(declare-fun mapRes!18975 () Bool)

(declare-fun tp!36779 () Bool)

(declare-fun e!259023 () Bool)

(assert (=> mapNonEmpty!18975 (= mapRes!18975 (and tp!36779 e!259023))))

(declare-fun mapKey!18975 () (_ BitVec 32))

(declare-fun mapRest!18975 () (Array (_ BitVec 32) ValueCell!5441))

(declare-fun mapValue!18975 () ValueCell!5441)

(assert (=> mapNonEmpty!18975 (= (arr!12928 _values!549) (store mapRest!18975 mapKey!18975 mapValue!18975))))

(declare-fun b!439365 () Bool)

(declare-fun res!259624 () Bool)

(declare-fun e!259020 () Bool)

(assert (=> b!439365 (=> (not res!259624) (not e!259020))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439365 (= res!259624 (bvsle from!863 i!563))))

(declare-fun b!439367 () Bool)

(declare-fun res!259630 () Bool)

(assert (=> b!439367 (=> (not res!259630) (not e!259025))))

(assert (=> b!439367 (= res!259630 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13279 _keys!709))))))

(declare-fun b!439368 () Bool)

(declare-fun res!259626 () Bool)

(assert (=> b!439368 (=> (not res!259626) (not e!259025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439368 (= res!259626 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18975 () Bool)

(assert (=> mapIsEmpty!18975 mapRes!18975))

(declare-fun b!439369 () Bool)

(declare-fun res!259632 () Bool)

(assert (=> b!439369 (=> (not res!259632) (not e!259025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439369 (= res!259632 (validMask!0 mask!1025))))

(declare-fun b!439370 () Bool)

(declare-fun res!259635 () Bool)

(assert (=> b!439370 (=> (not res!259635) (not e!259025))))

(assert (=> b!439370 (= res!259635 (or (= (select (arr!12927 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12927 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439371 () Bool)

(declare-fun tp_is_empty!11569 () Bool)

(assert (=> b!439371 (= e!259023 tp_is_empty!11569)))

(declare-fun b!439372 () Bool)

(declare-fun e!259026 () Bool)

(assert (=> b!439372 (= e!259026 tp_is_empty!11569)))

(declare-fun b!439373 () Bool)

(declare-fun e!259021 () Bool)

(assert (=> b!439373 (= e!259021 (and e!259026 mapRes!18975))))

(declare-fun condMapEmpty!18975 () Bool)

(declare-fun mapDefault!18975 () ValueCell!5441)

