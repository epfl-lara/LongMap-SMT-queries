; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96162 () Bool)

(assert start!96162)

(declare-fun b_free!22815 () Bool)

(declare-fun b_next!22815 () Bool)

(assert (=> start!96162 (= b_free!22815 (not b_next!22815))))

(declare-fun tp!80293 () Bool)

(declare-fun b_and!36305 () Bool)

(assert (=> start!96162 (= tp!80293 b_and!36305)))

(declare-fun b!1091679 () Bool)

(declare-fun e!623467 () Bool)

(declare-fun e!623470 () Bool)

(assert (=> b!1091679 (= e!623467 e!623470)))

(declare-fun res!728381 () Bool)

(assert (=> b!1091679 (=> (not res!728381) (not e!623470))))

(declare-datatypes ((array!70553 0))(
  ( (array!70554 (arr!33950 (Array (_ BitVec 32) (_ BitVec 64))) (size!34486 (_ BitVec 32))) )
))
(declare-fun lt!487640 () array!70553)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70553 (_ BitVec 32)) Bool)

(assert (=> b!1091679 (= res!728381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487640 mask!1414))))

(declare-fun _keys!1070 () array!70553)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091679 (= lt!487640 (array!70554 (store (arr!33950 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34486 _keys!1070)))))

(declare-fun b!1091680 () Bool)

(declare-fun e!623468 () Bool)

(declare-fun e!623471 () Bool)

(assert (=> b!1091680 (= e!623468 e!623471)))

(declare-fun res!728390 () Bool)

(assert (=> b!1091680 (=> res!728390 e!623471)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1091680 (= res!728390 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40883 0))(
  ( (V!40884 (val!13465 Int)) )
))
(declare-datatypes ((tuple2!17130 0))(
  ( (tuple2!17131 (_1!8576 (_ BitVec 64)) (_2!8576 V!40883)) )
))
(declare-datatypes ((List!23714 0))(
  ( (Nil!23711) (Cons!23710 (h!24919 tuple2!17130) (t!33587 List!23714)) )
))
(declare-datatypes ((ListLongMap!15099 0))(
  ( (ListLongMap!15100 (toList!7565 List!23714)) )
))
(declare-fun lt!487635 () ListLongMap!15099)

(declare-fun lt!487636 () ListLongMap!15099)

(assert (=> b!1091680 (= lt!487635 lt!487636)))

(declare-fun lt!487638 () ListLongMap!15099)

(declare-fun lt!487637 () tuple2!17130)

(declare-fun +!3347 (ListLongMap!15099 tuple2!17130) ListLongMap!15099)

(assert (=> b!1091680 (= lt!487636 (+!3347 lt!487638 lt!487637))))

(declare-fun lt!487641 () ListLongMap!15099)

(declare-fun lt!487634 () ListLongMap!15099)

(assert (=> b!1091680 (= lt!487641 lt!487634)))

(declare-fun lt!487633 () ListLongMap!15099)

(assert (=> b!1091680 (= lt!487634 (+!3347 lt!487633 lt!487637))))

(declare-fun lt!487645 () ListLongMap!15099)

(assert (=> b!1091680 (= lt!487641 (+!3347 lt!487645 lt!487637))))

(declare-fun minValue!831 () V!40883)

(assert (=> b!1091680 (= lt!487637 (tuple2!17131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapIsEmpty!41980 () Bool)

(declare-fun mapRes!41980 () Bool)

(assert (=> mapIsEmpty!41980 mapRes!41980))

(declare-fun b!1091681 () Bool)

(declare-fun res!728384 () Bool)

(assert (=> b!1091681 (=> (not res!728384) (not e!623467))))

(assert (=> b!1091681 (= res!728384 (= (select (arr!33950 _keys!1070) i!650) k0!904))))

(declare-fun b!1091682 () Bool)

(declare-fun e!623474 () Bool)

(declare-fun e!623473 () Bool)

(assert (=> b!1091682 (= e!623474 (and e!623473 mapRes!41980))))

(declare-fun condMapEmpty!41980 () Bool)

(declare-datatypes ((ValueCell!12699 0))(
  ( (ValueCellFull!12699 (v!16086 V!40883)) (EmptyCell!12699) )
))
(declare-datatypes ((array!70555 0))(
  ( (array!70556 (arr!33951 (Array (_ BitVec 32) ValueCell!12699)) (size!34487 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70555)

(declare-fun mapDefault!41980 () ValueCell!12699)

(assert (=> b!1091682 (= condMapEmpty!41980 (= (arr!33951 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12699)) mapDefault!41980)))))

(declare-fun b!1091683 () Bool)

(assert (=> b!1091683 (= e!623470 (not e!623468))))

(declare-fun res!728386 () Bool)

(assert (=> b!1091683 (=> res!728386 e!623468)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091683 (= res!728386 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40883)

(declare-fun getCurrentListMap!4323 (array!70553 array!70555 (_ BitVec 32) (_ BitVec 32) V!40883 V!40883 (_ BitVec 32) Int) ListLongMap!15099)

(assert (=> b!1091683 (= lt!487635 (getCurrentListMap!4323 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487643 () array!70555)

(assert (=> b!1091683 (= lt!487641 (getCurrentListMap!4323 lt!487640 lt!487643 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091683 (and (= lt!487645 lt!487633) (= lt!487633 lt!487645))))

(declare-fun -!885 (ListLongMap!15099 (_ BitVec 64)) ListLongMap!15099)

(assert (=> b!1091683 (= lt!487633 (-!885 lt!487638 k0!904))))

(declare-datatypes ((Unit!35936 0))(
  ( (Unit!35937) )
))
(declare-fun lt!487644 () Unit!35936)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!142 (array!70553 array!70555 (_ BitVec 32) (_ BitVec 32) V!40883 V!40883 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35936)

(assert (=> b!1091683 (= lt!487644 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!142 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4083 (array!70553 array!70555 (_ BitVec 32) (_ BitVec 32) V!40883 V!40883 (_ BitVec 32) Int) ListLongMap!15099)

(assert (=> b!1091683 (= lt!487645 (getCurrentListMapNoExtraKeys!4083 lt!487640 lt!487643 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2220 (Int (_ BitVec 64)) V!40883)

(assert (=> b!1091683 (= lt!487643 (array!70556 (store (arr!33951 _values!874) i!650 (ValueCellFull!12699 (dynLambda!2220 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34487 _values!874)))))

(assert (=> b!1091683 (= lt!487638 (getCurrentListMapNoExtraKeys!4083 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091683 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487639 () Unit!35936)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70553 (_ BitVec 64) (_ BitVec 32)) Unit!35936)

(assert (=> b!1091683 (= lt!487639 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091684 () Bool)

(declare-fun res!728387 () Bool)

(assert (=> b!1091684 (=> (not res!728387) (not e!623467))))

(declare-datatypes ((List!23715 0))(
  ( (Nil!23712) (Cons!23711 (h!24920 (_ BitVec 64)) (t!33588 List!23715)) )
))
(declare-fun arrayNoDuplicates!0 (array!70553 (_ BitVec 32) List!23715) Bool)

(assert (=> b!1091684 (= res!728387 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23712))))

(declare-fun b!1091685 () Bool)

(declare-fun res!728389 () Bool)

(assert (=> b!1091685 (=> (not res!728389) (not e!623470))))

(assert (=> b!1091685 (= res!728389 (arrayNoDuplicates!0 lt!487640 #b00000000000000000000000000000000 Nil!23712))))

(declare-fun b!1091686 () Bool)

(assert (=> b!1091686 (= e!623471 true)))

(assert (=> b!1091686 (= (-!885 lt!487636 k0!904) lt!487634)))

(declare-fun lt!487642 () Unit!35936)

(declare-fun addRemoveCommutativeForDiffKeys!107 (ListLongMap!15099 (_ BitVec 64) V!40883 (_ BitVec 64)) Unit!35936)

(assert (=> b!1091686 (= lt!487642 (addRemoveCommutativeForDiffKeys!107 lt!487638 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapNonEmpty!41980 () Bool)

(declare-fun tp!80294 () Bool)

(declare-fun e!623469 () Bool)

(assert (=> mapNonEmpty!41980 (= mapRes!41980 (and tp!80294 e!623469))))

(declare-fun mapKey!41980 () (_ BitVec 32))

(declare-fun mapValue!41980 () ValueCell!12699)

(declare-fun mapRest!41980 () (Array (_ BitVec 32) ValueCell!12699))

(assert (=> mapNonEmpty!41980 (= (arr!33951 _values!874) (store mapRest!41980 mapKey!41980 mapValue!41980))))

(declare-fun b!1091688 () Bool)

(declare-fun tp_is_empty!26817 () Bool)

(assert (=> b!1091688 (= e!623473 tp_is_empty!26817)))

(declare-fun b!1091689 () Bool)

(declare-fun res!728391 () Bool)

(assert (=> b!1091689 (=> (not res!728391) (not e!623467))))

(assert (=> b!1091689 (= res!728391 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34486 _keys!1070))))))

(declare-fun b!1091690 () Bool)

(declare-fun res!728388 () Bool)

(assert (=> b!1091690 (=> (not res!728388) (not e!623467))))

(assert (=> b!1091690 (= res!728388 (and (= (size!34487 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34486 _keys!1070) (size!34487 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091691 () Bool)

(declare-fun res!728385 () Bool)

(assert (=> b!1091691 (=> (not res!728385) (not e!623467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091691 (= res!728385 (validKeyInArray!0 k0!904))))

(declare-fun b!1091692 () Bool)

(declare-fun res!728383 () Bool)

(assert (=> b!1091692 (=> (not res!728383) (not e!623467))))

(assert (=> b!1091692 (= res!728383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091687 () Bool)

(assert (=> b!1091687 (= e!623469 tp_is_empty!26817)))

(declare-fun res!728382 () Bool)

(assert (=> start!96162 (=> (not res!728382) (not e!623467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96162 (= res!728382 (validMask!0 mask!1414))))

(assert (=> start!96162 e!623467))

(assert (=> start!96162 tp!80293))

(assert (=> start!96162 true))

(assert (=> start!96162 tp_is_empty!26817))

(declare-fun array_inv!26176 (array!70553) Bool)

(assert (=> start!96162 (array_inv!26176 _keys!1070)))

(declare-fun array_inv!26177 (array!70555) Bool)

(assert (=> start!96162 (and (array_inv!26177 _values!874) e!623474)))

(assert (= (and start!96162 res!728382) b!1091690))

(assert (= (and b!1091690 res!728388) b!1091692))

(assert (= (and b!1091692 res!728383) b!1091684))

(assert (= (and b!1091684 res!728387) b!1091689))

(assert (= (and b!1091689 res!728391) b!1091691))

(assert (= (and b!1091691 res!728385) b!1091681))

(assert (= (and b!1091681 res!728384) b!1091679))

(assert (= (and b!1091679 res!728381) b!1091685))

(assert (= (and b!1091685 res!728389) b!1091683))

(assert (= (and b!1091683 (not res!728386)) b!1091680))

(assert (= (and b!1091680 (not res!728390)) b!1091686))

(assert (= (and b!1091682 condMapEmpty!41980) mapIsEmpty!41980))

(assert (= (and b!1091682 (not condMapEmpty!41980)) mapNonEmpty!41980))

(get-info :version)

(assert (= (and mapNonEmpty!41980 ((_ is ValueCellFull!12699) mapValue!41980)) b!1091687))

(assert (= (and b!1091682 ((_ is ValueCellFull!12699) mapDefault!41980)) b!1091688))

(assert (= start!96162 b!1091682))

(declare-fun b_lambda!17485 () Bool)

(assert (=> (not b_lambda!17485) (not b!1091683)))

(declare-fun t!33586 () Bool)

(declare-fun tb!7693 () Bool)

(assert (=> (and start!96162 (= defaultEntry!882 defaultEntry!882) t!33586) tb!7693))

(declare-fun result!15905 () Bool)

(assert (=> tb!7693 (= result!15905 tp_is_empty!26817)))

(assert (=> b!1091683 t!33586))

(declare-fun b_and!36307 () Bool)

(assert (= b_and!36305 (and (=> t!33586 result!15905) b_and!36307)))

(declare-fun m!1011311 () Bool)

(assert (=> b!1091681 m!1011311))

(declare-fun m!1011313 () Bool)

(assert (=> b!1091680 m!1011313))

(declare-fun m!1011315 () Bool)

(assert (=> b!1091680 m!1011315))

(declare-fun m!1011317 () Bool)

(assert (=> b!1091680 m!1011317))

(declare-fun m!1011319 () Bool)

(assert (=> b!1091686 m!1011319))

(declare-fun m!1011321 () Bool)

(assert (=> b!1091686 m!1011321))

(declare-fun m!1011323 () Bool)

(assert (=> b!1091684 m!1011323))

(declare-fun m!1011325 () Bool)

(assert (=> start!96162 m!1011325))

(declare-fun m!1011327 () Bool)

(assert (=> start!96162 m!1011327))

(declare-fun m!1011329 () Bool)

(assert (=> start!96162 m!1011329))

(declare-fun m!1011331 () Bool)

(assert (=> b!1091692 m!1011331))

(declare-fun m!1011333 () Bool)

(assert (=> b!1091679 m!1011333))

(declare-fun m!1011335 () Bool)

(assert (=> b!1091679 m!1011335))

(declare-fun m!1011337 () Bool)

(assert (=> b!1091685 m!1011337))

(declare-fun m!1011339 () Bool)

(assert (=> mapNonEmpty!41980 m!1011339))

(declare-fun m!1011341 () Bool)

(assert (=> b!1091683 m!1011341))

(declare-fun m!1011343 () Bool)

(assert (=> b!1091683 m!1011343))

(declare-fun m!1011345 () Bool)

(assert (=> b!1091683 m!1011345))

(declare-fun m!1011347 () Bool)

(assert (=> b!1091683 m!1011347))

(declare-fun m!1011349 () Bool)

(assert (=> b!1091683 m!1011349))

(declare-fun m!1011351 () Bool)

(assert (=> b!1091683 m!1011351))

(declare-fun m!1011353 () Bool)

(assert (=> b!1091683 m!1011353))

(declare-fun m!1011355 () Bool)

(assert (=> b!1091683 m!1011355))

(declare-fun m!1011357 () Bool)

(assert (=> b!1091683 m!1011357))

(declare-fun m!1011359 () Bool)

(assert (=> b!1091683 m!1011359))

(declare-fun m!1011361 () Bool)

(assert (=> b!1091691 m!1011361))

(check-sat (not b!1091679) (not b_lambda!17485) (not start!96162) (not b!1091684) b_and!36307 (not b!1091683) (not b!1091692) (not mapNonEmpty!41980) (not b!1091680) tp_is_empty!26817 (not b!1091686) (not b!1091691) (not b_next!22815) (not b!1091685))
(check-sat b_and!36307 (not b_next!22815))
