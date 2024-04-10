; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39730 () Bool)

(assert start!39730)

(declare-fun b_free!9997 () Bool)

(declare-fun b_next!9997 () Bool)

(assert (=> start!39730 (= b_free!9997 (not b_next!9997))))

(declare-fun tp!35519 () Bool)

(declare-fun b_and!17653 () Bool)

(assert (=> start!39730 (= tp!35519 b_and!17653)))

(declare-fun b!427354 () Bool)

(declare-fun e!253408 () Bool)

(assert (=> b!427354 (= e!253408 true)))

(declare-datatypes ((V!15971 0))(
  ( (V!15972 (val!5619 Int)) )
))
(declare-datatypes ((ValueCell!5231 0))(
  ( (ValueCellFull!5231 (v!7866 V!15971)) (EmptyCell!5231) )
))
(declare-datatypes ((array!26135 0))(
  ( (array!26136 (arr!12517 (Array (_ BitVec 32) ValueCell!5231)) (size!12869 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26135)

(declare-datatypes ((tuple2!7384 0))(
  ( (tuple2!7385 (_1!3703 (_ BitVec 64)) (_2!3703 V!15971)) )
))
(declare-datatypes ((List!7400 0))(
  ( (Nil!7397) (Cons!7396 (h!8252 tuple2!7384) (t!12846 List!7400)) )
))
(declare-datatypes ((ListLongMap!6297 0))(
  ( (ListLongMap!6298 (toList!3164 List!7400)) )
))
(declare-fun lt!195253 () ListLongMap!6297)

(declare-datatypes ((array!26137 0))(
  ( (array!26138 (arr!12518 (Array (_ BitVec 32) (_ BitVec 64))) (size!12870 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26137)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!195257 () ListLongMap!6297)

(declare-fun +!1319 (ListLongMap!6297 tuple2!7384) ListLongMap!6297)

(declare-fun get!6195 (ValueCell!5231 V!15971) V!15971)

(declare-fun dynLambda!748 (Int (_ BitVec 64)) V!15971)

(assert (=> b!427354 (= lt!195253 (+!1319 lt!195257 (tuple2!7385 (select (arr!12518 _keys!709) from!863) (get!6195 (select (arr!12517 _values!549) from!863) (dynLambda!748 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427355 () Bool)

(declare-fun res!250656 () Bool)

(declare-fun e!253410 () Bool)

(assert (=> b!427355 (=> (not res!250656) (not e!253410))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26137 (_ BitVec 32)) Bool)

(assert (=> b!427355 (= res!250656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18345 () Bool)

(declare-fun mapRes!18345 () Bool)

(declare-fun tp!35520 () Bool)

(declare-fun e!253413 () Bool)

(assert (=> mapNonEmpty!18345 (= mapRes!18345 (and tp!35520 e!253413))))

(declare-fun mapKey!18345 () (_ BitVec 32))

(declare-fun mapValue!18345 () ValueCell!5231)

(declare-fun mapRest!18345 () (Array (_ BitVec 32) ValueCell!5231))

(assert (=> mapNonEmpty!18345 (= (arr!12517 _values!549) (store mapRest!18345 mapKey!18345 mapValue!18345))))

(declare-fun b!427356 () Bool)

(declare-fun res!250651 () Bool)

(assert (=> b!427356 (=> (not res!250651) (not e!253410))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427356 (= res!250651 (or (= (select (arr!12518 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12518 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427357 () Bool)

(declare-fun e!253411 () Bool)

(assert (=> b!427357 (= e!253410 e!253411)))

(declare-fun res!250650 () Bool)

(assert (=> b!427357 (=> (not res!250650) (not e!253411))))

(declare-fun lt!195254 () array!26137)

(assert (=> b!427357 (= res!250650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195254 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!427357 (= lt!195254 (array!26138 (store (arr!12518 _keys!709) i!563 k!794) (size!12870 _keys!709)))))

(declare-fun b!427358 () Bool)

(declare-fun tp_is_empty!11149 () Bool)

(assert (=> b!427358 (= e!253413 tp_is_empty!11149)))

(declare-fun b!427359 () Bool)

(declare-fun res!250646 () Bool)

(assert (=> b!427359 (=> (not res!250646) (not e!253410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427359 (= res!250646 (validMask!0 mask!1025))))

(declare-fun b!427360 () Bool)

(declare-fun e!253409 () Bool)

(assert (=> b!427360 (= e!253409 tp_is_empty!11149)))

(declare-fun b!427361 () Bool)

(declare-fun res!250644 () Bool)

(assert (=> b!427361 (=> (not res!250644) (not e!253410))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!427361 (= res!250644 (and (= (size!12869 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12870 _keys!709) (size!12869 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427362 () Bool)

(declare-fun e!253407 () Bool)

(assert (=> b!427362 (= e!253411 e!253407)))

(declare-fun res!250654 () Bool)

(assert (=> b!427362 (=> (not res!250654) (not e!253407))))

(assert (=> b!427362 (= res!250654 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun zeroValue!515 () V!15971)

(declare-fun lt!195255 () array!26135)

(declare-fun minValue!515 () V!15971)

(declare-fun getCurrentListMapNoExtraKeys!1368 (array!26137 array!26135 (_ BitVec 32) (_ BitVec 32) V!15971 V!15971 (_ BitVec 32) Int) ListLongMap!6297)

(assert (=> b!427362 (= lt!195253 (getCurrentListMapNoExtraKeys!1368 lt!195254 lt!195255 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15971)

(assert (=> b!427362 (= lt!195255 (array!26136 (store (arr!12517 _values!549) i!563 (ValueCellFull!5231 v!412)) (size!12869 _values!549)))))

(declare-fun lt!195256 () ListLongMap!6297)

(assert (=> b!427362 (= lt!195256 (getCurrentListMapNoExtraKeys!1368 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!250652 () Bool)

(assert (=> start!39730 (=> (not res!250652) (not e!253410))))

(assert (=> start!39730 (= res!250652 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12870 _keys!709))))))

(assert (=> start!39730 e!253410))

(assert (=> start!39730 tp_is_empty!11149))

(assert (=> start!39730 tp!35519))

(assert (=> start!39730 true))

(declare-fun e!253406 () Bool)

(declare-fun array_inv!9122 (array!26135) Bool)

(assert (=> start!39730 (and (array_inv!9122 _values!549) e!253406)))

(declare-fun array_inv!9123 (array!26137) Bool)

(assert (=> start!39730 (array_inv!9123 _keys!709)))

(declare-fun b!427363 () Bool)

(declare-fun res!250655 () Bool)

(assert (=> b!427363 (=> (not res!250655) (not e!253410))))

(declare-fun arrayContainsKey!0 (array!26137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427363 (= res!250655 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18345 () Bool)

(assert (=> mapIsEmpty!18345 mapRes!18345))

(declare-fun b!427364 () Bool)

(assert (=> b!427364 (= e!253407 (not e!253408))))

(declare-fun res!250647 () Bool)

(assert (=> b!427364 (=> res!250647 e!253408)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427364 (= res!250647 (not (validKeyInArray!0 (select (arr!12518 _keys!709) from!863))))))

(declare-fun lt!195252 () ListLongMap!6297)

(assert (=> b!427364 (= lt!195252 lt!195257)))

(declare-fun lt!195251 () ListLongMap!6297)

(assert (=> b!427364 (= lt!195257 (+!1319 lt!195251 (tuple2!7385 k!794 v!412)))))

(assert (=> b!427364 (= lt!195252 (getCurrentListMapNoExtraKeys!1368 lt!195254 lt!195255 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427364 (= lt!195251 (getCurrentListMapNoExtraKeys!1368 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12540 0))(
  ( (Unit!12541) )
))
(declare-fun lt!195250 () Unit!12540)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!514 (array!26137 array!26135 (_ BitVec 32) (_ BitVec 32) V!15971 V!15971 (_ BitVec 32) (_ BitVec 64) V!15971 (_ BitVec 32) Int) Unit!12540)

(assert (=> b!427364 (= lt!195250 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!514 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427365 () Bool)

(declare-fun res!250653 () Bool)

(assert (=> b!427365 (=> (not res!250653) (not e!253410))))

(assert (=> b!427365 (= res!250653 (validKeyInArray!0 k!794))))

(declare-fun b!427366 () Bool)

(assert (=> b!427366 (= e!253406 (and e!253409 mapRes!18345))))

(declare-fun condMapEmpty!18345 () Bool)

(declare-fun mapDefault!18345 () ValueCell!5231)

