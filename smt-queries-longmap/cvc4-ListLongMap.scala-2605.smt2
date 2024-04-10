; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39452 () Bool)

(assert start!39452)

(declare-fun b_free!9719 () Bool)

(declare-fun b_next!9719 () Bool)

(assert (=> start!39452 (= b_free!9719 (not b_next!9719))))

(declare-fun tp!34685 () Bool)

(declare-fun b_and!17313 () Bool)

(assert (=> start!39452 (= tp!34685 b_and!17313)))

(declare-fun res!245292 () Bool)

(declare-fun e!250463 () Bool)

(assert (=> start!39452 (=> (not res!245292) (not e!250463))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25591 0))(
  ( (array!25592 (arr!12245 (Array (_ BitVec 32) (_ BitVec 64))) (size!12597 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25591)

(assert (=> start!39452 (= res!245292 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12597 _keys!709))))))

(assert (=> start!39452 e!250463))

(declare-fun tp_is_empty!10871 () Bool)

(assert (=> start!39452 tp_is_empty!10871))

(assert (=> start!39452 tp!34685))

(assert (=> start!39452 true))

(declare-datatypes ((V!15599 0))(
  ( (V!15600 (val!5480 Int)) )
))
(declare-datatypes ((ValueCell!5092 0))(
  ( (ValueCellFull!5092 (v!7727 V!15599)) (EmptyCell!5092) )
))
(declare-datatypes ((array!25593 0))(
  ( (array!25594 (arr!12246 (Array (_ BitVec 32) ValueCell!5092)) (size!12598 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25593)

(declare-fun e!250461 () Bool)

(declare-fun array_inv!8928 (array!25593) Bool)

(assert (=> start!39452 (and (array_inv!8928 _values!549) e!250461)))

(declare-fun array_inv!8929 (array!25591) Bool)

(assert (=> start!39452 (array_inv!8929 _keys!709)))

(declare-fun b!420498 () Bool)

(declare-fun e!250460 () Bool)

(declare-fun e!250457 () Bool)

(assert (=> b!420498 (= e!250460 (not e!250457))))

(declare-fun res!245291 () Bool)

(assert (=> b!420498 (=> res!245291 e!250457)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420498 (= res!245291 (validKeyInArray!0 (select (arr!12245 _keys!709) from!863)))))

(declare-fun e!250464 () Bool)

(assert (=> b!420498 e!250464))

(declare-fun c!55292 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420498 (= c!55292 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15599)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12424 0))(
  ( (Unit!12425) )
))
(declare-fun lt!192940 () Unit!12424)

(declare-fun v!412 () V!15599)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15599)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!459 (array!25591 array!25593 (_ BitVec 32) (_ BitVec 32) V!15599 V!15599 (_ BitVec 32) (_ BitVec 64) V!15599 (_ BitVec 32) Int) Unit!12424)

(assert (=> b!420498 (= lt!192940 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!459 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420499 () Bool)

(assert (=> b!420499 (= e!250457 true)))

(declare-datatypes ((tuple2!7182 0))(
  ( (tuple2!7183 (_1!3602 (_ BitVec 64)) (_2!3602 V!15599)) )
))
(declare-fun lt!192945 () tuple2!7182)

(declare-datatypes ((List!7189 0))(
  ( (Nil!7186) (Cons!7185 (h!8041 tuple2!7182) (t!12573 List!7189)) )
))
(declare-datatypes ((ListLongMap!6095 0))(
  ( (ListLongMap!6096 (toList!3063 List!7189)) )
))
(declare-fun lt!192944 () ListLongMap!6095)

(declare-fun lt!192937 () V!15599)

(declare-fun +!1260 (ListLongMap!6095 tuple2!7182) ListLongMap!6095)

(assert (=> b!420499 (= (+!1260 lt!192944 lt!192945) (+!1260 (+!1260 lt!192944 (tuple2!7183 k!794 lt!192937)) lt!192945))))

(declare-fun lt!192947 () V!15599)

(assert (=> b!420499 (= lt!192945 (tuple2!7183 k!794 lt!192947))))

(declare-fun lt!192946 () Unit!12424)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!57 (ListLongMap!6095 (_ BitVec 64) V!15599 V!15599) Unit!12424)

(assert (=> b!420499 (= lt!192946 (addSameAsAddTwiceSameKeyDiffValues!57 lt!192944 k!794 lt!192937 lt!192947))))

(declare-fun lt!192938 () V!15599)

(declare-fun get!6081 (ValueCell!5092 V!15599) V!15599)

(assert (=> b!420499 (= lt!192937 (get!6081 (select (arr!12246 _values!549) from!863) lt!192938))))

(declare-fun lt!192939 () array!25591)

(declare-fun lt!192943 () ListLongMap!6095)

(assert (=> b!420499 (= lt!192943 (+!1260 lt!192944 (tuple2!7183 (select (arr!12245 lt!192939) from!863) lt!192947)))))

(assert (=> b!420499 (= lt!192947 (get!6081 (select (store (arr!12246 _values!549) i!563 (ValueCellFull!5092 v!412)) from!863) lt!192938))))

(declare-fun dynLambda!728 (Int (_ BitVec 64)) V!15599)

(assert (=> b!420499 (= lt!192938 (dynLambda!728 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!192942 () array!25593)

(declare-fun getCurrentListMapNoExtraKeys!1268 (array!25591 array!25593 (_ BitVec 32) (_ BitVec 32) V!15599 V!15599 (_ BitVec 32) Int) ListLongMap!6095)

(assert (=> b!420499 (= lt!192944 (getCurrentListMapNoExtraKeys!1268 lt!192939 lt!192942 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420500 () Bool)

(declare-fun res!245294 () Bool)

(assert (=> b!420500 (=> (not res!245294) (not e!250463))))

(declare-fun arrayContainsKey!0 (array!25591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420500 (= res!245294 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!420501 () Bool)

(declare-fun res!245283 () Bool)

(declare-fun e!250462 () Bool)

(assert (=> b!420501 (=> (not res!245283) (not e!250462))))

(assert (=> b!420501 (= res!245283 (bvsle from!863 i!563))))

(declare-fun b!420502 () Bool)

(declare-fun res!245287 () Bool)

(assert (=> b!420502 (=> (not res!245287) (not e!250463))))

(assert (=> b!420502 (= res!245287 (validKeyInArray!0 k!794))))

(declare-fun b!420503 () Bool)

(assert (=> b!420503 (= e!250463 e!250462)))

(declare-fun res!245290 () Bool)

(assert (=> b!420503 (=> (not res!245290) (not e!250462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25591 (_ BitVec 32)) Bool)

(assert (=> b!420503 (= res!245290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192939 mask!1025))))

(assert (=> b!420503 (= lt!192939 (array!25592 (store (arr!12245 _keys!709) i!563 k!794) (size!12597 _keys!709)))))

(declare-fun call!29336 () ListLongMap!6095)

(declare-fun b!420504 () Bool)

(declare-fun call!29335 () ListLongMap!6095)

(assert (=> b!420504 (= e!250464 (= call!29336 (+!1260 call!29335 (tuple2!7183 k!794 v!412))))))

(declare-fun b!420505 () Bool)

(declare-fun res!245282 () Bool)

(assert (=> b!420505 (=> (not res!245282) (not e!250463))))

(assert (=> b!420505 (= res!245282 (and (= (size!12598 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12597 _keys!709) (size!12598 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17928 () Bool)

(declare-fun mapRes!17928 () Bool)

(declare-fun tp!34686 () Bool)

(declare-fun e!250458 () Bool)

(assert (=> mapNonEmpty!17928 (= mapRes!17928 (and tp!34686 e!250458))))

(declare-fun mapValue!17928 () ValueCell!5092)

(declare-fun mapKey!17928 () (_ BitVec 32))

(declare-fun mapRest!17928 () (Array (_ BitVec 32) ValueCell!5092))

(assert (=> mapNonEmpty!17928 (= (arr!12246 _values!549) (store mapRest!17928 mapKey!17928 mapValue!17928))))

(declare-fun b!420506 () Bool)

(assert (=> b!420506 (= e!250458 tp_is_empty!10871)))

(declare-fun b!420507 () Bool)

(declare-fun res!245295 () Bool)

(assert (=> b!420507 (=> (not res!245295) (not e!250463))))

(assert (=> b!420507 (= res!245295 (or (= (select (arr!12245 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12245 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420508 () Bool)

(declare-fun e!250459 () Bool)

(assert (=> b!420508 (= e!250459 tp_is_empty!10871)))

(declare-fun b!420509 () Bool)

(assert (=> b!420509 (= e!250462 e!250460)))

(declare-fun res!245293 () Bool)

(assert (=> b!420509 (=> (not res!245293) (not e!250460))))

(assert (=> b!420509 (= res!245293 (= from!863 i!563))))

(assert (=> b!420509 (= lt!192943 (getCurrentListMapNoExtraKeys!1268 lt!192939 lt!192942 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420509 (= lt!192942 (array!25594 (store (arr!12246 _values!549) i!563 (ValueCellFull!5092 v!412)) (size!12598 _values!549)))))

(declare-fun lt!192941 () ListLongMap!6095)

(assert (=> b!420509 (= lt!192941 (getCurrentListMapNoExtraKeys!1268 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420510 () Bool)

(declare-fun res!245289 () Bool)

(assert (=> b!420510 (=> (not res!245289) (not e!250463))))

(assert (=> b!420510 (= res!245289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420511 () Bool)

(declare-fun res!245286 () Bool)

(assert (=> b!420511 (=> (not res!245286) (not e!250463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420511 (= res!245286 (validMask!0 mask!1025))))

(declare-fun b!420512 () Bool)

(declare-fun res!245285 () Bool)

(assert (=> b!420512 (=> (not res!245285) (not e!250463))))

(declare-datatypes ((List!7190 0))(
  ( (Nil!7187) (Cons!7186 (h!8042 (_ BitVec 64)) (t!12574 List!7190)) )
))
(declare-fun arrayNoDuplicates!0 (array!25591 (_ BitVec 32) List!7190) Bool)

(assert (=> b!420512 (= res!245285 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7187))))

(declare-fun b!420513 () Bool)

(assert (=> b!420513 (= e!250461 (and e!250459 mapRes!17928))))

(declare-fun condMapEmpty!17928 () Bool)

(declare-fun mapDefault!17928 () ValueCell!5092)

