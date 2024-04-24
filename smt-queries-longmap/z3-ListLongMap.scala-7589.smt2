; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96090 () Bool)

(assert start!96090)

(declare-fun b_free!22507 () Bool)

(declare-fun b_next!22507 () Bool)

(assert (=> start!96090 (= b_free!22507 (not b_next!22507))))

(declare-fun tp!79369 () Bool)

(declare-fun b_and!35699 () Bool)

(assert (=> start!96090 (= tp!79369 b_and!35699)))

(declare-fun b!1086212 () Bool)

(declare-fun e!620626 () Bool)

(declare-fun tp_is_empty!26509 () Bool)

(assert (=> b!1086212 (= e!620626 tp_is_empty!26509)))

(declare-fun b!1086213 () Bool)

(declare-fun res!723807 () Bool)

(declare-fun e!620631 () Bool)

(assert (=> b!1086213 (=> (not res!723807) (not e!620631))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69993 0))(
  ( (array!69994 (arr!33664 (Array (_ BitVec 32) (_ BitVec 64))) (size!34201 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69993)

(declare-datatypes ((V!40473 0))(
  ( (V!40474 (val!13311 Int)) )
))
(declare-datatypes ((ValueCell!12545 0))(
  ( (ValueCellFull!12545 (v!15928 V!40473)) (EmptyCell!12545) )
))
(declare-datatypes ((array!69995 0))(
  ( (array!69996 (arr!33665 (Array (_ BitVec 32) ValueCell!12545)) (size!34202 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69995)

(assert (=> b!1086213 (= res!723807 (and (= (size!34202 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34201 _keys!1070) (size!34202 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!723812 () Bool)

(assert (=> start!96090 (=> (not res!723812) (not e!620631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96090 (= res!723812 (validMask!0 mask!1414))))

(assert (=> start!96090 e!620631))

(assert (=> start!96090 tp!79369))

(assert (=> start!96090 true))

(assert (=> start!96090 tp_is_empty!26509))

(declare-fun array_inv!26024 (array!69993) Bool)

(assert (=> start!96090 (array_inv!26024 _keys!1070)))

(declare-fun e!620633 () Bool)

(declare-fun array_inv!26025 (array!69995) Bool)

(assert (=> start!96090 (and (array_inv!26025 _values!874) e!620633)))

(declare-fun b!1086214 () Bool)

(declare-fun res!723810 () Bool)

(assert (=> b!1086214 (=> (not res!723810) (not e!620631))))

(declare-datatypes ((List!23478 0))(
  ( (Nil!23475) (Cons!23474 (h!24692 (_ BitVec 64)) (t!33035 List!23478)) )
))
(declare-fun arrayNoDuplicates!0 (array!69993 (_ BitVec 32) List!23478) Bool)

(assert (=> b!1086214 (= res!723810 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23475))))

(declare-fun b!1086215 () Bool)

(declare-fun res!723809 () Bool)

(assert (=> b!1086215 (=> (not res!723809) (not e!620631))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086215 (= res!723809 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34201 _keys!1070))))))

(declare-fun b!1086216 () Bool)

(declare-fun res!723804 () Bool)

(assert (=> b!1086216 (=> (not res!723804) (not e!620631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69993 (_ BitVec 32)) Bool)

(assert (=> b!1086216 (= res!723804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41518 () Bool)

(declare-fun mapRes!41518 () Bool)

(declare-fun tp!79370 () Bool)

(assert (=> mapNonEmpty!41518 (= mapRes!41518 (and tp!79370 e!620626))))

(declare-fun mapKey!41518 () (_ BitVec 32))

(declare-fun mapRest!41518 () (Array (_ BitVec 32) ValueCell!12545))

(declare-fun mapValue!41518 () ValueCell!12545)

(assert (=> mapNonEmpty!41518 (= (arr!33665 _values!874) (store mapRest!41518 mapKey!41518 mapValue!41518))))

(declare-fun b!1086217 () Bool)

(declare-fun e!620627 () Bool)

(assert (=> b!1086217 (= e!620627 true)))

(declare-fun k0!904 () (_ BitVec 64))

(declare-datatypes ((tuple2!16880 0))(
  ( (tuple2!16881 (_1!8451 (_ BitVec 64)) (_2!8451 V!40473)) )
))
(declare-fun lt!481566 () tuple2!16880)

(declare-datatypes ((List!23479 0))(
  ( (Nil!23476) (Cons!23475 (h!24693 tuple2!16880) (t!33036 List!23479)) )
))
(declare-datatypes ((ListLongMap!14857 0))(
  ( (ListLongMap!14858 (toList!7444 List!23479)) )
))
(declare-fun lt!481563 () ListLongMap!14857)

(declare-fun lt!481572 () ListLongMap!14857)

(declare-fun -!756 (ListLongMap!14857 (_ BitVec 64)) ListLongMap!14857)

(declare-fun +!3269 (ListLongMap!14857 tuple2!16880) ListLongMap!14857)

(assert (=> b!1086217 (= (-!756 lt!481572 k0!904) (+!3269 lt!481563 lt!481566))))

(declare-datatypes ((Unit!35679 0))(
  ( (Unit!35680) )
))
(declare-fun lt!481569 () Unit!35679)

(declare-fun minValue!831 () V!40473)

(declare-fun lt!481558 () ListLongMap!14857)

(declare-fun addRemoveCommutativeForDiffKeys!3 (ListLongMap!14857 (_ BitVec 64) V!40473 (_ BitVec 64)) Unit!35679)

(assert (=> b!1086217 (= lt!481569 (addRemoveCommutativeForDiffKeys!3 lt!481558 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086218 () Bool)

(declare-fun e!620628 () Bool)

(declare-fun e!620632 () Bool)

(assert (=> b!1086218 (= e!620628 (not e!620632))))

(declare-fun res!723805 () Bool)

(assert (=> b!1086218 (=> res!723805 e!620632)))

(assert (=> b!1086218 (= res!723805 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!481570 () ListLongMap!14857)

(declare-fun zeroValue!831 () V!40473)

(declare-fun getCurrentListMap!4216 (array!69993 array!69995 (_ BitVec 32) (_ BitVec 32) V!40473 V!40473 (_ BitVec 32) Int) ListLongMap!14857)

(assert (=> b!1086218 (= lt!481570 (getCurrentListMap!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481571 () array!69995)

(declare-fun lt!481556 () ListLongMap!14857)

(declare-fun lt!481557 () array!69993)

(assert (=> b!1086218 (= lt!481556 (getCurrentListMap!4216 lt!481557 lt!481571 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481568 () ListLongMap!14857)

(declare-fun lt!481562 () ListLongMap!14857)

(assert (=> b!1086218 (and (= lt!481568 lt!481562) (= lt!481562 lt!481568))))

(declare-fun lt!481564 () ListLongMap!14857)

(assert (=> b!1086218 (= lt!481562 (-!756 lt!481564 k0!904))))

(declare-fun lt!481565 () Unit!35679)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!45 (array!69993 array!69995 (_ BitVec 32) (_ BitVec 32) V!40473 V!40473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35679)

(assert (=> b!1086218 (= lt!481565 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!45 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4021 (array!69993 array!69995 (_ BitVec 32) (_ BitVec 32) V!40473 V!40473 (_ BitVec 32) Int) ListLongMap!14857)

(assert (=> b!1086218 (= lt!481568 (getCurrentListMapNoExtraKeys!4021 lt!481557 lt!481571 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2142 (Int (_ BitVec 64)) V!40473)

(assert (=> b!1086218 (= lt!481571 (array!69996 (store (arr!33665 _values!874) i!650 (ValueCellFull!12545 (dynLambda!2142 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34202 _values!874)))))

(assert (=> b!1086218 (= lt!481564 (getCurrentListMapNoExtraKeys!4021 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086218 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481561 () Unit!35679)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69993 (_ BitVec 64) (_ BitVec 32)) Unit!35679)

(assert (=> b!1086218 (= lt!481561 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086219 () Bool)

(declare-fun res!723813 () Bool)

(assert (=> b!1086219 (=> (not res!723813) (not e!620631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086219 (= res!723813 (validKeyInArray!0 k0!904))))

(declare-fun b!1086220 () Bool)

(declare-fun res!723808 () Bool)

(assert (=> b!1086220 (=> (not res!723808) (not e!620628))))

(assert (=> b!1086220 (= res!723808 (arrayNoDuplicates!0 lt!481557 #b00000000000000000000000000000000 Nil!23475))))

(declare-fun mapIsEmpty!41518 () Bool)

(assert (=> mapIsEmpty!41518 mapRes!41518))

(declare-fun b!1086221 () Bool)

(declare-fun e!620629 () Bool)

(assert (=> b!1086221 (= e!620633 (and e!620629 mapRes!41518))))

(declare-fun condMapEmpty!41518 () Bool)

(declare-fun mapDefault!41518 () ValueCell!12545)

(assert (=> b!1086221 (= condMapEmpty!41518 (= (arr!33665 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12545)) mapDefault!41518)))))

(declare-fun b!1086222 () Bool)

(assert (=> b!1086222 (= e!620629 tp_is_empty!26509)))

(declare-fun b!1086223 () Bool)

(assert (=> b!1086223 (= e!620631 e!620628)))

(declare-fun res!723803 () Bool)

(assert (=> b!1086223 (=> (not res!723803) (not e!620628))))

(assert (=> b!1086223 (= res!723803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481557 mask!1414))))

(assert (=> b!1086223 (= lt!481557 (array!69994 (store (arr!33664 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34201 _keys!1070)))))

(declare-fun b!1086224 () Bool)

(declare-fun res!723811 () Bool)

(assert (=> b!1086224 (=> (not res!723811) (not e!620631))))

(assert (=> b!1086224 (= res!723811 (= (select (arr!33664 _keys!1070) i!650) k0!904))))

(declare-fun b!1086225 () Bool)

(assert (=> b!1086225 (= e!620632 e!620627)))

(declare-fun res!723806 () Bool)

(assert (=> b!1086225 (=> res!723806 e!620627)))

(assert (=> b!1086225 (= res!723806 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481559 () ListLongMap!14857)

(assert (=> b!1086225 (= lt!481563 lt!481559)))

(assert (=> b!1086225 (= lt!481563 (-!756 lt!481558 k0!904))))

(declare-fun lt!481560 () Unit!35679)

(assert (=> b!1086225 (= lt!481560 (addRemoveCommutativeForDiffKeys!3 lt!481564 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1086225 (= lt!481556 (+!3269 lt!481559 lt!481566))))

(declare-fun lt!481567 () tuple2!16880)

(assert (=> b!1086225 (= lt!481559 (+!3269 lt!481562 lt!481567))))

(assert (=> b!1086225 (= lt!481570 lt!481572)))

(assert (=> b!1086225 (= lt!481572 (+!3269 lt!481558 lt!481566))))

(assert (=> b!1086225 (= lt!481558 (+!3269 lt!481564 lt!481567))))

(assert (=> b!1086225 (= lt!481556 (+!3269 (+!3269 lt!481568 lt!481567) lt!481566))))

(assert (=> b!1086225 (= lt!481566 (tuple2!16881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086225 (= lt!481567 (tuple2!16881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(assert (= (and start!96090 res!723812) b!1086213))

(assert (= (and b!1086213 res!723807) b!1086216))

(assert (= (and b!1086216 res!723804) b!1086214))

(assert (= (and b!1086214 res!723810) b!1086215))

(assert (= (and b!1086215 res!723809) b!1086219))

(assert (= (and b!1086219 res!723813) b!1086224))

(assert (= (and b!1086224 res!723811) b!1086223))

(assert (= (and b!1086223 res!723803) b!1086220))

(assert (= (and b!1086220 res!723808) b!1086218))

(assert (= (and b!1086218 (not res!723805)) b!1086225))

(assert (= (and b!1086225 (not res!723806)) b!1086217))

(assert (= (and b!1086221 condMapEmpty!41518) mapIsEmpty!41518))

(assert (= (and b!1086221 (not condMapEmpty!41518)) mapNonEmpty!41518))

(get-info :version)

(assert (= (and mapNonEmpty!41518 ((_ is ValueCellFull!12545) mapValue!41518)) b!1086212))

(assert (= (and b!1086221 ((_ is ValueCellFull!12545) mapDefault!41518)) b!1086222))

(assert (= start!96090 b!1086221))

(declare-fun b_lambda!17187 () Bool)

(assert (=> (not b_lambda!17187) (not b!1086218)))

(declare-fun t!33034 () Bool)

(declare-fun tb!7377 () Bool)

(assert (=> (and start!96090 (= defaultEntry!882 defaultEntry!882) t!33034) tb!7377))

(declare-fun result!15281 () Bool)

(assert (=> tb!7377 (= result!15281 tp_is_empty!26509)))

(assert (=> b!1086218 t!33034))

(declare-fun b_and!35701 () Bool)

(assert (= b_and!35699 (and (=> t!33034 result!15281) b_and!35701)))

(declare-fun m!1004351 () Bool)

(assert (=> b!1086217 m!1004351))

(declare-fun m!1004353 () Bool)

(assert (=> b!1086217 m!1004353))

(declare-fun m!1004355 () Bool)

(assert (=> b!1086217 m!1004355))

(declare-fun m!1004357 () Bool)

(assert (=> b!1086214 m!1004357))

(declare-fun m!1004359 () Bool)

(assert (=> b!1086216 m!1004359))

(declare-fun m!1004361 () Bool)

(assert (=> b!1086223 m!1004361))

(declare-fun m!1004363 () Bool)

(assert (=> b!1086223 m!1004363))

(declare-fun m!1004365 () Bool)

(assert (=> start!96090 m!1004365))

(declare-fun m!1004367 () Bool)

(assert (=> start!96090 m!1004367))

(declare-fun m!1004369 () Bool)

(assert (=> start!96090 m!1004369))

(declare-fun m!1004371 () Bool)

(assert (=> mapNonEmpty!41518 m!1004371))

(declare-fun m!1004373 () Bool)

(assert (=> b!1086220 m!1004373))

(declare-fun m!1004375 () Bool)

(assert (=> b!1086219 m!1004375))

(declare-fun m!1004377 () Bool)

(assert (=> b!1086218 m!1004377))

(declare-fun m!1004379 () Bool)

(assert (=> b!1086218 m!1004379))

(declare-fun m!1004381 () Bool)

(assert (=> b!1086218 m!1004381))

(declare-fun m!1004383 () Bool)

(assert (=> b!1086218 m!1004383))

(declare-fun m!1004385 () Bool)

(assert (=> b!1086218 m!1004385))

(declare-fun m!1004387 () Bool)

(assert (=> b!1086218 m!1004387))

(declare-fun m!1004389 () Bool)

(assert (=> b!1086218 m!1004389))

(declare-fun m!1004391 () Bool)

(assert (=> b!1086218 m!1004391))

(declare-fun m!1004393 () Bool)

(assert (=> b!1086218 m!1004393))

(declare-fun m!1004395 () Bool)

(assert (=> b!1086218 m!1004395))

(declare-fun m!1004397 () Bool)

(assert (=> b!1086224 m!1004397))

(declare-fun m!1004399 () Bool)

(assert (=> b!1086225 m!1004399))

(declare-fun m!1004401 () Bool)

(assert (=> b!1086225 m!1004401))

(declare-fun m!1004403 () Bool)

(assert (=> b!1086225 m!1004403))

(assert (=> b!1086225 m!1004399))

(declare-fun m!1004405 () Bool)

(assert (=> b!1086225 m!1004405))

(declare-fun m!1004407 () Bool)

(assert (=> b!1086225 m!1004407))

(declare-fun m!1004409 () Bool)

(assert (=> b!1086225 m!1004409))

(declare-fun m!1004411 () Bool)

(assert (=> b!1086225 m!1004411))

(declare-fun m!1004413 () Bool)

(assert (=> b!1086225 m!1004413))

(check-sat b_and!35701 tp_is_empty!26509 (not b_next!22507) (not b!1086218) (not b!1086214) (not b!1086216) (not b!1086219) (not b!1086220) (not mapNonEmpty!41518) (not start!96090) (not b!1086225) (not b_lambda!17187) (not b!1086217) (not b!1086223))
(check-sat b_and!35701 (not b_next!22507))
