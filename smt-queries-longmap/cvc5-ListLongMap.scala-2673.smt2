; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39856 () Bool)

(assert start!39856)

(declare-fun b_free!10123 () Bool)

(declare-fun b_next!10123 () Bool)

(assert (=> start!39856 (= b_free!10123 (not b_next!10123))))

(declare-fun tp!35897 () Bool)

(declare-fun b_and!17905 () Bool)

(assert (=> start!39856 (= tp!35897 b_and!17905)))

(declare-fun b!431014 () Bool)

(declare-fun res!253339 () Bool)

(declare-fun e!255111 () Bool)

(assert (=> b!431014 (=> (not res!253339) (not e!255111))))

(declare-datatypes ((array!26385 0))(
  ( (array!26386 (arr!12642 (Array (_ BitVec 32) (_ BitVec 64))) (size!12994 (_ BitVec 32))) )
))
(declare-fun lt!197285 () array!26385)

(declare-datatypes ((List!7504 0))(
  ( (Nil!7501) (Cons!7500 (h!8356 (_ BitVec 64)) (t!13076 List!7504)) )
))
(declare-fun arrayNoDuplicates!0 (array!26385 (_ BitVec 32) List!7504) Bool)

(assert (=> b!431014 (= res!253339 (arrayNoDuplicates!0 lt!197285 #b00000000000000000000000000000000 Nil!7501))))

(declare-fun res!253346 () Bool)

(declare-fun e!255104 () Bool)

(assert (=> start!39856 (=> (not res!253346) (not e!255104))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!26385)

(assert (=> start!39856 (= res!253346 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12994 _keys!709))))))

(assert (=> start!39856 e!255104))

(declare-fun tp_is_empty!11275 () Bool)

(assert (=> start!39856 tp_is_empty!11275))

(assert (=> start!39856 tp!35897))

(assert (=> start!39856 true))

(declare-datatypes ((V!16139 0))(
  ( (V!16140 (val!5682 Int)) )
))
(declare-datatypes ((ValueCell!5294 0))(
  ( (ValueCellFull!5294 (v!7929 V!16139)) (EmptyCell!5294) )
))
(declare-datatypes ((array!26387 0))(
  ( (array!26388 (arr!12643 (Array (_ BitVec 32) ValueCell!5294)) (size!12995 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26387)

(declare-fun e!255110 () Bool)

(declare-fun array_inv!9204 (array!26387) Bool)

(assert (=> start!39856 (and (array_inv!9204 _values!549) e!255110)))

(declare-fun array_inv!9205 (array!26385) Bool)

(assert (=> start!39856 (array_inv!9205 _keys!709)))

(declare-fun b!431015 () Bool)

(declare-datatypes ((Unit!12696 0))(
  ( (Unit!12697) )
))
(declare-fun e!255102 () Unit!12696)

(declare-fun Unit!12698 () Unit!12696)

(assert (=> b!431015 (= e!255102 Unit!12698)))

(declare-fun b!431016 () Bool)

(declare-fun res!253344 () Bool)

(assert (=> b!431016 (=> (not res!253344) (not e!255104))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431016 (= res!253344 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12994 _keys!709))))))

(declare-fun b!431017 () Bool)

(declare-fun res!253336 () Bool)

(assert (=> b!431017 (=> (not res!253336) (not e!255104))))

(assert (=> b!431017 (= res!253336 (or (= (select (arr!12642 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12642 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431018 () Bool)

(declare-fun e!255108 () Bool)

(assert (=> b!431018 (= e!255111 e!255108)))

(declare-fun res!253341 () Bool)

(assert (=> b!431018 (=> (not res!253341) (not e!255108))))

(assert (=> b!431018 (= res!253341 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16139)

(declare-datatypes ((tuple2!7488 0))(
  ( (tuple2!7489 (_1!3755 (_ BitVec 64)) (_2!3755 V!16139)) )
))
(declare-datatypes ((List!7505 0))(
  ( (Nil!7502) (Cons!7501 (h!8357 tuple2!7488) (t!13077 List!7505)) )
))
(declare-datatypes ((ListLongMap!6401 0))(
  ( (ListLongMap!6402 (toList!3216 List!7505)) )
))
(declare-fun lt!197283 () ListLongMap!6401)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!197278 () array!26387)

(declare-fun minValue!515 () V!16139)

(declare-fun getCurrentListMapNoExtraKeys!1417 (array!26385 array!26387 (_ BitVec 32) (_ BitVec 32) V!16139 V!16139 (_ BitVec 32) Int) ListLongMap!6401)

(assert (=> b!431018 (= lt!197283 (getCurrentListMapNoExtraKeys!1417 lt!197285 lt!197278 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16139)

(assert (=> b!431018 (= lt!197278 (array!26388 (store (arr!12643 _values!549) i!563 (ValueCellFull!5294 v!412)) (size!12995 _values!549)))))

(declare-fun lt!197280 () ListLongMap!6401)

(assert (=> b!431018 (= lt!197280 (getCurrentListMapNoExtraKeys!1417 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431019 () Bool)

(declare-fun e!255106 () Bool)

(assert (=> b!431019 (= e!255108 (not e!255106))))

(declare-fun res!253342 () Bool)

(assert (=> b!431019 (=> res!253342 e!255106)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431019 (= res!253342 (not (validKeyInArray!0 (select (arr!12642 _keys!709) from!863))))))

(declare-fun lt!197282 () ListLongMap!6401)

(declare-fun lt!197272 () ListLongMap!6401)

(assert (=> b!431019 (= lt!197282 lt!197272)))

(declare-fun lt!197284 () ListLongMap!6401)

(declare-fun lt!197271 () tuple2!7488)

(declare-fun +!1365 (ListLongMap!6401 tuple2!7488) ListLongMap!6401)

(assert (=> b!431019 (= lt!197272 (+!1365 lt!197284 lt!197271))))

(assert (=> b!431019 (= lt!197282 (getCurrentListMapNoExtraKeys!1417 lt!197285 lt!197278 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!431019 (= lt!197271 (tuple2!7489 k!794 v!412))))

(assert (=> b!431019 (= lt!197284 (getCurrentListMapNoExtraKeys!1417 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197274 () Unit!12696)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!553 (array!26385 array!26387 (_ BitVec 32) (_ BitVec 32) V!16139 V!16139 (_ BitVec 32) (_ BitVec 64) V!16139 (_ BitVec 32) Int) Unit!12696)

(assert (=> b!431019 (= lt!197274 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!553 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431020 () Bool)

(declare-fun res!253350 () Bool)

(assert (=> b!431020 (=> (not res!253350) (not e!255104))))

(declare-fun arrayContainsKey!0 (array!26385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431020 (= res!253350 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!431021 () Bool)

(declare-fun res!253337 () Bool)

(assert (=> b!431021 (=> (not res!253337) (not e!255104))))

(assert (=> b!431021 (= res!253337 (and (= (size!12995 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12994 _keys!709) (size!12995 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18534 () Bool)

(declare-fun mapRes!18534 () Bool)

(declare-fun tp!35898 () Bool)

(declare-fun e!255105 () Bool)

(assert (=> mapNonEmpty!18534 (= mapRes!18534 (and tp!35898 e!255105))))

(declare-fun mapKey!18534 () (_ BitVec 32))

(declare-fun mapValue!18534 () ValueCell!5294)

(declare-fun mapRest!18534 () (Array (_ BitVec 32) ValueCell!5294))

(assert (=> mapNonEmpty!18534 (= (arr!12643 _values!549) (store mapRest!18534 mapKey!18534 mapValue!18534))))

(declare-fun b!431022 () Bool)

(declare-fun e!255107 () Bool)

(assert (=> b!431022 (= e!255106 e!255107)))

(declare-fun res!253338 () Bool)

(assert (=> b!431022 (=> res!253338 e!255107)))

(assert (=> b!431022 (= res!253338 (= k!794 (select (arr!12642 _keys!709) from!863)))))

(assert (=> b!431022 (not (= (select (arr!12642 _keys!709) from!863) k!794))))

(declare-fun lt!197276 () Unit!12696)

(assert (=> b!431022 (= lt!197276 e!255102)))

(declare-fun c!55520 () Bool)

(assert (=> b!431022 (= c!55520 (= (select (arr!12642 _keys!709) from!863) k!794))))

(declare-fun lt!197275 () ListLongMap!6401)

(assert (=> b!431022 (= lt!197283 lt!197275)))

(declare-fun lt!197273 () tuple2!7488)

(assert (=> b!431022 (= lt!197275 (+!1365 lt!197272 lt!197273))))

(declare-fun lt!197281 () V!16139)

(assert (=> b!431022 (= lt!197273 (tuple2!7489 (select (arr!12642 _keys!709) from!863) lt!197281))))

(declare-fun get!6277 (ValueCell!5294 V!16139) V!16139)

(declare-fun dynLambda!788 (Int (_ BitVec 64)) V!16139)

(assert (=> b!431022 (= lt!197281 (get!6277 (select (arr!12643 _values!549) from!863) (dynLambda!788 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431023 () Bool)

(declare-fun Unit!12699 () Unit!12696)

(assert (=> b!431023 (= e!255102 Unit!12699)))

(declare-fun lt!197277 () Unit!12696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26385 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12696)

(assert (=> b!431023 (= lt!197277 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431023 false))

(declare-fun b!431024 () Bool)

(declare-fun res!253345 () Bool)

(assert (=> b!431024 (=> (not res!253345) (not e!255104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26385 (_ BitVec 32)) Bool)

(assert (=> b!431024 (= res!253345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18534 () Bool)

(assert (=> mapIsEmpty!18534 mapRes!18534))

(declare-fun b!431025 () Bool)

(declare-fun res!253349 () Bool)

(assert (=> b!431025 (=> (not res!253349) (not e!255104))))

(assert (=> b!431025 (= res!253349 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7501))))

(declare-fun b!431026 () Bool)

(declare-fun res!253340 () Bool)

(assert (=> b!431026 (=> (not res!253340) (not e!255104))))

(assert (=> b!431026 (= res!253340 (validKeyInArray!0 k!794))))

(declare-fun b!431027 () Bool)

(assert (=> b!431027 (= e!255105 tp_is_empty!11275)))

(declare-fun b!431028 () Bool)

(declare-fun res!253348 () Bool)

(assert (=> b!431028 (=> (not res!253348) (not e!255104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431028 (= res!253348 (validMask!0 mask!1025))))

(declare-fun b!431029 () Bool)

(declare-fun e!255103 () Bool)

(assert (=> b!431029 (= e!255110 (and e!255103 mapRes!18534))))

(declare-fun condMapEmpty!18534 () Bool)

(declare-fun mapDefault!18534 () ValueCell!5294)

