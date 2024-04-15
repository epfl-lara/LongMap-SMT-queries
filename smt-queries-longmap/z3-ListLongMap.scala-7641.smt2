; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96160 () Bool)

(assert start!96160)

(declare-fun b_free!22819 () Bool)

(declare-fun b_next!22819 () Bool)

(assert (=> start!96160 (= b_free!22819 (not b_next!22819))))

(declare-fun tp!80305 () Bool)

(declare-fun b_and!36287 () Bool)

(assert (=> start!96160 (= tp!80305 b_and!36287)))

(declare-fun b!1091614 () Bool)

(declare-fun e!623429 () Bool)

(declare-fun e!623427 () Bool)

(assert (=> b!1091614 (= e!623429 e!623427)))

(declare-fun res!728379 () Bool)

(assert (=> b!1091614 (=> res!728379 e!623427)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1091614 (= res!728379 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40889 0))(
  ( (V!40890 (val!13467 Int)) )
))
(declare-datatypes ((tuple2!17186 0))(
  ( (tuple2!17187 (_1!8604 (_ BitVec 64)) (_2!8604 V!40889)) )
))
(declare-datatypes ((List!23748 0))(
  ( (Nil!23745) (Cons!23744 (h!24953 tuple2!17186) (t!33616 List!23748)) )
))
(declare-datatypes ((ListLongMap!15155 0))(
  ( (ListLongMap!15156 (toList!7593 List!23748)) )
))
(declare-fun lt!487520 () ListLongMap!15155)

(declare-fun lt!487514 () ListLongMap!15155)

(assert (=> b!1091614 (= lt!487520 lt!487514)))

(declare-fun lt!487515 () ListLongMap!15155)

(declare-fun lt!487521 () tuple2!17186)

(declare-fun +!3380 (ListLongMap!15155 tuple2!17186) ListLongMap!15155)

(assert (=> b!1091614 (= lt!487514 (+!3380 lt!487515 lt!487521))))

(declare-fun lt!487523 () ListLongMap!15155)

(declare-fun lt!487517 () ListLongMap!15155)

(assert (=> b!1091614 (= lt!487523 lt!487517)))

(declare-fun lt!487518 () ListLongMap!15155)

(assert (=> b!1091614 (= lt!487517 (+!3380 lt!487518 lt!487521))))

(declare-fun lt!487522 () ListLongMap!15155)

(assert (=> b!1091614 (= lt!487523 (+!3380 lt!487522 lt!487521))))

(declare-fun minValue!831 () V!40889)

(assert (=> b!1091614 (= lt!487521 (tuple2!17187 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091615 () Bool)

(declare-fun e!623424 () Bool)

(declare-fun tp_is_empty!26821 () Bool)

(assert (=> b!1091615 (= e!623424 tp_is_empty!26821)))

(declare-fun b!1091617 () Bool)

(assert (=> b!1091617 (= e!623427 true)))

(declare-fun -!865 (ListLongMap!15155 (_ BitVec 64)) ListLongMap!15155)

(assert (=> b!1091617 (= (-!865 lt!487514 k0!904) lt!487517)))

(declare-datatypes ((Unit!35765 0))(
  ( (Unit!35766) )
))
(declare-fun lt!487512 () Unit!35765)

(declare-fun addRemoveCommutativeForDiffKeys!108 (ListLongMap!15155 (_ BitVec 64) V!40889 (_ BitVec 64)) Unit!35765)

(assert (=> b!1091617 (= lt!487512 (addRemoveCommutativeForDiffKeys!108 lt!487515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091618 () Bool)

(declare-fun res!728385 () Bool)

(declare-fun e!623422 () Bool)

(assert (=> b!1091618 (=> (not res!728385) (not e!623422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091618 (= res!728385 (validKeyInArray!0 k0!904))))

(declare-fun b!1091619 () Bool)

(declare-fun e!623423 () Bool)

(assert (=> b!1091619 (= e!623423 (not e!623429))))

(declare-fun res!728382 () Bool)

(assert (=> b!1091619 (=> res!728382 e!623429)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091619 (= res!728382 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40889)

(declare-datatypes ((array!70480 0))(
  ( (array!70481 (arr!33914 (Array (_ BitVec 32) (_ BitVec 64))) (size!34452 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70480)

(declare-datatypes ((ValueCell!12701 0))(
  ( (ValueCellFull!12701 (v!16087 V!40889)) (EmptyCell!12701) )
))
(declare-datatypes ((array!70482 0))(
  ( (array!70483 (arr!33915 (Array (_ BitVec 32) ValueCell!12701)) (size!34453 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70482)

(declare-fun getCurrentListMap!4258 (array!70480 array!70482 (_ BitVec 32) (_ BitVec 32) V!40889 V!40889 (_ BitVec 32) Int) ListLongMap!15155)

(assert (=> b!1091619 (= lt!487520 (getCurrentListMap!4258 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487519 () array!70482)

(declare-fun lt!487511 () array!70480)

(assert (=> b!1091619 (= lt!487523 (getCurrentListMap!4258 lt!487511 lt!487519 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091619 (and (= lt!487522 lt!487518) (= lt!487518 lt!487522))))

(assert (=> b!1091619 (= lt!487518 (-!865 lt!487515 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!487516 () Unit!35765)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!142 (array!70480 array!70482 (_ BitVec 32) (_ BitVec 32) V!40889 V!40889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35765)

(assert (=> b!1091619 (= lt!487516 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!142 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4128 (array!70480 array!70482 (_ BitVec 32) (_ BitVec 32) V!40889 V!40889 (_ BitVec 32) Int) ListLongMap!15155)

(assert (=> b!1091619 (= lt!487522 (getCurrentListMapNoExtraKeys!4128 lt!487511 lt!487519 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2199 (Int (_ BitVec 64)) V!40889)

(assert (=> b!1091619 (= lt!487519 (array!70483 (store (arr!33915 _values!874) i!650 (ValueCellFull!12701 (dynLambda!2199 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34453 _values!874)))))

(assert (=> b!1091619 (= lt!487515 (getCurrentListMapNoExtraKeys!4128 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091619 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487513 () Unit!35765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70480 (_ BitVec 64) (_ BitVec 32)) Unit!35765)

(assert (=> b!1091619 (= lt!487513 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091620 () Bool)

(declare-fun res!728387 () Bool)

(assert (=> b!1091620 (=> (not res!728387) (not e!623422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70480 (_ BitVec 32)) Bool)

(assert (=> b!1091620 (= res!728387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091621 () Bool)

(declare-fun res!728380 () Bool)

(assert (=> b!1091621 (=> (not res!728380) (not e!623422))))

(assert (=> b!1091621 (= res!728380 (and (= (size!34453 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34452 _keys!1070) (size!34453 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091622 () Bool)

(assert (=> b!1091622 (= e!623422 e!623423)))

(declare-fun res!728388 () Bool)

(assert (=> b!1091622 (=> (not res!728388) (not e!623423))))

(assert (=> b!1091622 (= res!728388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487511 mask!1414))))

(assert (=> b!1091622 (= lt!487511 (array!70481 (store (arr!33914 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34452 _keys!1070)))))

(declare-fun b!1091623 () Bool)

(declare-fun res!728381 () Bool)

(assert (=> b!1091623 (=> (not res!728381) (not e!623422))))

(assert (=> b!1091623 (= res!728381 (= (select (arr!33914 _keys!1070) i!650) k0!904))))

(declare-fun b!1091624 () Bool)

(declare-fun res!728386 () Bool)

(assert (=> b!1091624 (=> (not res!728386) (not e!623422))))

(assert (=> b!1091624 (= res!728386 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34452 _keys!1070))))))

(declare-fun mapNonEmpty!41986 () Bool)

(declare-fun mapRes!41986 () Bool)

(declare-fun tp!80306 () Bool)

(assert (=> mapNonEmpty!41986 (= mapRes!41986 (and tp!80306 e!623424))))

(declare-fun mapRest!41986 () (Array (_ BitVec 32) ValueCell!12701))

(declare-fun mapValue!41986 () ValueCell!12701)

(declare-fun mapKey!41986 () (_ BitVec 32))

(assert (=> mapNonEmpty!41986 (= (arr!33915 _values!874) (store mapRest!41986 mapKey!41986 mapValue!41986))))

(declare-fun b!1091625 () Bool)

(declare-fun e!623426 () Bool)

(declare-fun e!623428 () Bool)

(assert (=> b!1091625 (= e!623426 (and e!623428 mapRes!41986))))

(declare-fun condMapEmpty!41986 () Bool)

(declare-fun mapDefault!41986 () ValueCell!12701)

(assert (=> b!1091625 (= condMapEmpty!41986 (= (arr!33915 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12701)) mapDefault!41986)))))

(declare-fun b!1091626 () Bool)

(declare-fun res!728384 () Bool)

(assert (=> b!1091626 (=> (not res!728384) (not e!623423))))

(declare-datatypes ((List!23749 0))(
  ( (Nil!23746) (Cons!23745 (h!24954 (_ BitVec 64)) (t!33617 List!23749)) )
))
(declare-fun arrayNoDuplicates!0 (array!70480 (_ BitVec 32) List!23749) Bool)

(assert (=> b!1091626 (= res!728384 (arrayNoDuplicates!0 lt!487511 #b00000000000000000000000000000000 Nil!23746))))

(declare-fun b!1091616 () Bool)

(assert (=> b!1091616 (= e!623428 tp_is_empty!26821)))

(declare-fun res!728378 () Bool)

(assert (=> start!96160 (=> (not res!728378) (not e!623422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96160 (= res!728378 (validMask!0 mask!1414))))

(assert (=> start!96160 e!623422))

(assert (=> start!96160 tp!80305))

(assert (=> start!96160 true))

(assert (=> start!96160 tp_is_empty!26821))

(declare-fun array_inv!26188 (array!70480) Bool)

(assert (=> start!96160 (array_inv!26188 _keys!1070)))

(declare-fun array_inv!26189 (array!70482) Bool)

(assert (=> start!96160 (and (array_inv!26189 _values!874) e!623426)))

(declare-fun mapIsEmpty!41986 () Bool)

(assert (=> mapIsEmpty!41986 mapRes!41986))

(declare-fun b!1091627 () Bool)

(declare-fun res!728383 () Bool)

(assert (=> b!1091627 (=> (not res!728383) (not e!623422))))

(assert (=> b!1091627 (= res!728383 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23746))))

(assert (= (and start!96160 res!728378) b!1091621))

(assert (= (and b!1091621 res!728380) b!1091620))

(assert (= (and b!1091620 res!728387) b!1091627))

(assert (= (and b!1091627 res!728383) b!1091624))

(assert (= (and b!1091624 res!728386) b!1091618))

(assert (= (and b!1091618 res!728385) b!1091623))

(assert (= (and b!1091623 res!728381) b!1091622))

(assert (= (and b!1091622 res!728388) b!1091626))

(assert (= (and b!1091626 res!728384) b!1091619))

(assert (= (and b!1091619 (not res!728382)) b!1091614))

(assert (= (and b!1091614 (not res!728379)) b!1091617))

(assert (= (and b!1091625 condMapEmpty!41986) mapIsEmpty!41986))

(assert (= (and b!1091625 (not condMapEmpty!41986)) mapNonEmpty!41986))

(get-info :version)

(assert (= (and mapNonEmpty!41986 ((_ is ValueCellFull!12701) mapValue!41986)) b!1091615))

(assert (= (and b!1091625 ((_ is ValueCellFull!12701) mapDefault!41986)) b!1091616))

(assert (= start!96160 b!1091625))

(declare-fun b_lambda!17467 () Bool)

(assert (=> (not b_lambda!17467) (not b!1091619)))

(declare-fun t!33615 () Bool)

(declare-fun tb!7689 () Bool)

(assert (=> (and start!96160 (= defaultEntry!882 defaultEntry!882) t!33615) tb!7689))

(declare-fun result!15905 () Bool)

(assert (=> tb!7689 (= result!15905 tp_is_empty!26821)))

(assert (=> b!1091619 t!33615))

(declare-fun b_and!36289 () Bool)

(assert (= b_and!36287 (and (=> t!33615 result!15905) b_and!36289)))

(declare-fun m!1010789 () Bool)

(assert (=> b!1091622 m!1010789))

(declare-fun m!1010791 () Bool)

(assert (=> b!1091622 m!1010791))

(declare-fun m!1010793 () Bool)

(assert (=> b!1091626 m!1010793))

(declare-fun m!1010795 () Bool)

(assert (=> start!96160 m!1010795))

(declare-fun m!1010797 () Bool)

(assert (=> start!96160 m!1010797))

(declare-fun m!1010799 () Bool)

(assert (=> start!96160 m!1010799))

(declare-fun m!1010801 () Bool)

(assert (=> b!1091627 m!1010801))

(declare-fun m!1010803 () Bool)

(assert (=> b!1091614 m!1010803))

(declare-fun m!1010805 () Bool)

(assert (=> b!1091614 m!1010805))

(declare-fun m!1010807 () Bool)

(assert (=> b!1091614 m!1010807))

(declare-fun m!1010809 () Bool)

(assert (=> mapNonEmpty!41986 m!1010809))

(declare-fun m!1010811 () Bool)

(assert (=> b!1091618 m!1010811))

(declare-fun m!1010813 () Bool)

(assert (=> b!1091623 m!1010813))

(declare-fun m!1010815 () Bool)

(assert (=> b!1091619 m!1010815))

(declare-fun m!1010817 () Bool)

(assert (=> b!1091619 m!1010817))

(declare-fun m!1010819 () Bool)

(assert (=> b!1091619 m!1010819))

(declare-fun m!1010821 () Bool)

(assert (=> b!1091619 m!1010821))

(declare-fun m!1010823 () Bool)

(assert (=> b!1091619 m!1010823))

(declare-fun m!1010825 () Bool)

(assert (=> b!1091619 m!1010825))

(declare-fun m!1010827 () Bool)

(assert (=> b!1091619 m!1010827))

(declare-fun m!1010829 () Bool)

(assert (=> b!1091619 m!1010829))

(declare-fun m!1010831 () Bool)

(assert (=> b!1091619 m!1010831))

(declare-fun m!1010833 () Bool)

(assert (=> b!1091619 m!1010833))

(declare-fun m!1010835 () Bool)

(assert (=> b!1091620 m!1010835))

(declare-fun m!1010837 () Bool)

(assert (=> b!1091617 m!1010837))

(declare-fun m!1010839 () Bool)

(assert (=> b!1091617 m!1010839))

(check-sat (not mapNonEmpty!41986) (not b!1091627) (not b!1091618) (not b!1091617) (not b!1091626) (not start!96160) (not b_next!22819) (not b!1091622) (not b!1091620) (not b!1091619) (not b_lambda!17467) b_and!36289 (not b!1091614) tp_is_empty!26821)
(check-sat b_and!36289 (not b_next!22819))
