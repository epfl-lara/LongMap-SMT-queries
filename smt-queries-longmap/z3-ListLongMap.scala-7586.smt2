; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95830 () Bool)

(assert start!95830)

(declare-fun b_free!22489 () Bool)

(declare-fun b_next!22489 () Bool)

(assert (=> start!95830 (= b_free!22489 (not b_next!22489))))

(declare-fun tp!79315 () Bool)

(declare-fun b_and!35627 () Bool)

(assert (=> start!95830 (= tp!79315 b_and!35627)))

(declare-fun b!1084350 () Bool)

(declare-fun e!619490 () Bool)

(declare-fun e!619486 () Bool)

(declare-fun mapRes!41491 () Bool)

(assert (=> b!1084350 (= e!619490 (and e!619486 mapRes!41491))))

(declare-fun condMapEmpty!41491 () Bool)

(declare-datatypes ((V!40449 0))(
  ( (V!40450 (val!13302 Int)) )
))
(declare-datatypes ((ValueCell!12536 0))(
  ( (ValueCellFull!12536 (v!15922 V!40449)) (EmptyCell!12536) )
))
(declare-datatypes ((array!69844 0))(
  ( (array!69845 (arr!33596 (Array (_ BitVec 32) ValueCell!12536)) (size!34134 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69844)

(declare-fun mapDefault!41491 () ValueCell!12536)

(assert (=> b!1084350 (= condMapEmpty!41491 (= (arr!33596 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12536)) mapDefault!41491)))))

(declare-fun mapNonEmpty!41491 () Bool)

(declare-fun tp!79316 () Bool)

(declare-fun e!619488 () Bool)

(assert (=> mapNonEmpty!41491 (= mapRes!41491 (and tp!79316 e!619488))))

(declare-fun mapKey!41491 () (_ BitVec 32))

(declare-fun mapValue!41491 () ValueCell!12536)

(declare-fun mapRest!41491 () (Array (_ BitVec 32) ValueCell!12536))

(assert (=> mapNonEmpty!41491 (= (arr!33596 _values!874) (store mapRest!41491 mapKey!41491 mapValue!41491))))

(declare-fun b!1084351 () Bool)

(declare-fun e!619487 () Bool)

(declare-fun e!619485 () Bool)

(assert (=> b!1084351 (= e!619487 e!619485)))

(declare-fun res!722932 () Bool)

(assert (=> b!1084351 (=> (not res!722932) (not e!619485))))

(declare-datatypes ((array!69846 0))(
  ( (array!69847 (arr!33597 (Array (_ BitVec 32) (_ BitVec 64))) (size!34135 (_ BitVec 32))) )
))
(declare-fun lt!480526 () array!69846)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69846 (_ BitVec 32)) Bool)

(assert (=> b!1084351 (= res!722932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480526 mask!1414))))

(declare-fun _keys!1070 () array!69846)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084351 (= lt!480526 (array!69847 (store (arr!33597 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34135 _keys!1070)))))

(declare-fun b!1084352 () Bool)

(assert (=> b!1084352 (= e!619485 (not (bvsle #b00000000000000000000000000000000 (size!34135 _keys!1070))))))

(declare-fun lt!480527 () array!69844)

(declare-fun minValue!831 () V!40449)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40449)

(declare-datatypes ((tuple2!16918 0))(
  ( (tuple2!16919 (_1!8470 (_ BitVec 64)) (_2!8470 V!40449)) )
))
(declare-datatypes ((List!23490 0))(
  ( (Nil!23487) (Cons!23486 (h!24695 tuple2!16918) (t!33028 List!23490)) )
))
(declare-datatypes ((ListLongMap!14887 0))(
  ( (ListLongMap!14888 (toList!7459 List!23490)) )
))
(declare-fun lt!480531 () ListLongMap!14887)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4152 (array!69846 array!69844 (_ BitVec 32) (_ BitVec 32) V!40449 V!40449 (_ BitVec 32) Int) ListLongMap!14887)

(assert (=> b!1084352 (= lt!480531 (getCurrentListMap!4152 lt!480526 lt!480527 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480532 () ListLongMap!14887)

(declare-fun lt!480528 () ListLongMap!14887)

(assert (=> b!1084352 (and (= lt!480532 lt!480528) (= lt!480528 lt!480532))))

(declare-fun lt!480530 () ListLongMap!14887)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!738 (ListLongMap!14887 (_ BitVec 64)) ListLongMap!14887)

(assert (=> b!1084352 (= lt!480528 (-!738 lt!480530 k0!904))))

(declare-datatypes ((Unit!35511 0))(
  ( (Unit!35512) )
))
(declare-fun lt!480533 () Unit!35511)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!36 (array!69846 array!69844 (_ BitVec 32) (_ BitVec 32) V!40449 V!40449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35511)

(assert (=> b!1084352 (= lt!480533 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!36 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4022 (array!69846 array!69844 (_ BitVec 32) (_ BitVec 32) V!40449 V!40449 (_ BitVec 32) Int) ListLongMap!14887)

(assert (=> b!1084352 (= lt!480532 (getCurrentListMapNoExtraKeys!4022 lt!480526 lt!480527 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2093 (Int (_ BitVec 64)) V!40449)

(assert (=> b!1084352 (= lt!480527 (array!69845 (store (arr!33596 _values!874) i!650 (ValueCellFull!12536 (dynLambda!2093 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34134 _values!874)))))

(assert (=> b!1084352 (= lt!480530 (getCurrentListMapNoExtraKeys!4022 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084352 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480529 () Unit!35511)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69846 (_ BitVec 64) (_ BitVec 32)) Unit!35511)

(assert (=> b!1084352 (= lt!480529 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!722935 () Bool)

(assert (=> start!95830 (=> (not res!722935) (not e!619487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95830 (= res!722935 (validMask!0 mask!1414))))

(assert (=> start!95830 e!619487))

(assert (=> start!95830 tp!79315))

(assert (=> start!95830 true))

(declare-fun tp_is_empty!26491 () Bool)

(assert (=> start!95830 tp_is_empty!26491))

(declare-fun array_inv!25968 (array!69846) Bool)

(assert (=> start!95830 (array_inv!25968 _keys!1070)))

(declare-fun array_inv!25969 (array!69844) Bool)

(assert (=> start!95830 (and (array_inv!25969 _values!874) e!619490)))

(declare-fun b!1084353 () Bool)

(declare-fun res!722931 () Bool)

(assert (=> b!1084353 (=> (not res!722931) (not e!619487))))

(assert (=> b!1084353 (= res!722931 (= (select (arr!33597 _keys!1070) i!650) k0!904))))

(declare-fun b!1084354 () Bool)

(assert (=> b!1084354 (= e!619488 tp_is_empty!26491)))

(declare-fun b!1084355 () Bool)

(assert (=> b!1084355 (= e!619486 tp_is_empty!26491)))

(declare-fun b!1084356 () Bool)

(declare-fun res!722930 () Bool)

(assert (=> b!1084356 (=> (not res!722930) (not e!619487))))

(assert (=> b!1084356 (= res!722930 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34135 _keys!1070))))))

(declare-fun b!1084357 () Bool)

(declare-fun res!722937 () Bool)

(assert (=> b!1084357 (=> (not res!722937) (not e!619487))))

(declare-datatypes ((List!23491 0))(
  ( (Nil!23488) (Cons!23487 (h!24696 (_ BitVec 64)) (t!33029 List!23491)) )
))
(declare-fun arrayNoDuplicates!0 (array!69846 (_ BitVec 32) List!23491) Bool)

(assert (=> b!1084357 (= res!722937 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23488))))

(declare-fun b!1084358 () Bool)

(declare-fun res!722933 () Bool)

(assert (=> b!1084358 (=> (not res!722933) (not e!619487))))

(assert (=> b!1084358 (= res!722933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41491 () Bool)

(assert (=> mapIsEmpty!41491 mapRes!41491))

(declare-fun b!1084359 () Bool)

(declare-fun res!722934 () Bool)

(assert (=> b!1084359 (=> (not res!722934) (not e!619487))))

(assert (=> b!1084359 (= res!722934 (and (= (size!34134 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34135 _keys!1070) (size!34134 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084360 () Bool)

(declare-fun res!722929 () Bool)

(assert (=> b!1084360 (=> (not res!722929) (not e!619485))))

(assert (=> b!1084360 (= res!722929 (arrayNoDuplicates!0 lt!480526 #b00000000000000000000000000000000 Nil!23488))))

(declare-fun b!1084361 () Bool)

(declare-fun res!722936 () Bool)

(assert (=> b!1084361 (=> (not res!722936) (not e!619487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084361 (= res!722936 (validKeyInArray!0 k0!904))))

(assert (= (and start!95830 res!722935) b!1084359))

(assert (= (and b!1084359 res!722934) b!1084358))

(assert (= (and b!1084358 res!722933) b!1084357))

(assert (= (and b!1084357 res!722937) b!1084356))

(assert (= (and b!1084356 res!722930) b!1084361))

(assert (= (and b!1084361 res!722936) b!1084353))

(assert (= (and b!1084353 res!722931) b!1084351))

(assert (= (and b!1084351 res!722932) b!1084360))

(assert (= (and b!1084360 res!722929) b!1084352))

(assert (= (and b!1084350 condMapEmpty!41491) mapIsEmpty!41491))

(assert (= (and b!1084350 (not condMapEmpty!41491)) mapNonEmpty!41491))

(get-info :version)

(assert (= (and mapNonEmpty!41491 ((_ is ValueCellFull!12536) mapValue!41491)) b!1084354))

(assert (= (and b!1084350 ((_ is ValueCellFull!12536) mapDefault!41491)) b!1084355))

(assert (= start!95830 b!1084350))

(declare-fun b_lambda!17137 () Bool)

(assert (=> (not b_lambda!17137) (not b!1084352)))

(declare-fun t!33027 () Bool)

(declare-fun tb!7359 () Bool)

(assert (=> (and start!95830 (= defaultEntry!882 defaultEntry!882) t!33027) tb!7359))

(declare-fun result!15245 () Bool)

(assert (=> tb!7359 (= result!15245 tp_is_empty!26491)))

(assert (=> b!1084352 t!33027))

(declare-fun b_and!35629 () Bool)

(assert (= b_and!35627 (and (=> t!33027 result!15245) b_and!35629)))

(declare-fun m!1001597 () Bool)

(assert (=> b!1084351 m!1001597))

(declare-fun m!1001599 () Bool)

(assert (=> b!1084351 m!1001599))

(declare-fun m!1001601 () Bool)

(assert (=> b!1084352 m!1001601))

(declare-fun m!1001603 () Bool)

(assert (=> b!1084352 m!1001603))

(declare-fun m!1001605 () Bool)

(assert (=> b!1084352 m!1001605))

(declare-fun m!1001607 () Bool)

(assert (=> b!1084352 m!1001607))

(declare-fun m!1001609 () Bool)

(assert (=> b!1084352 m!1001609))

(declare-fun m!1001611 () Bool)

(assert (=> b!1084352 m!1001611))

(declare-fun m!1001613 () Bool)

(assert (=> b!1084352 m!1001613))

(declare-fun m!1001615 () Bool)

(assert (=> b!1084352 m!1001615))

(declare-fun m!1001617 () Bool)

(assert (=> b!1084352 m!1001617))

(declare-fun m!1001619 () Bool)

(assert (=> b!1084360 m!1001619))

(declare-fun m!1001621 () Bool)

(assert (=> b!1084357 m!1001621))

(declare-fun m!1001623 () Bool)

(assert (=> b!1084361 m!1001623))

(declare-fun m!1001625 () Bool)

(assert (=> start!95830 m!1001625))

(declare-fun m!1001627 () Bool)

(assert (=> start!95830 m!1001627))

(declare-fun m!1001629 () Bool)

(assert (=> start!95830 m!1001629))

(declare-fun m!1001631 () Bool)

(assert (=> mapNonEmpty!41491 m!1001631))

(declare-fun m!1001633 () Bool)

(assert (=> b!1084353 m!1001633))

(declare-fun m!1001635 () Bool)

(assert (=> b!1084358 m!1001635))

(check-sat (not b!1084357) (not mapNonEmpty!41491) (not b_lambda!17137) (not start!95830) (not b!1084360) b_and!35629 (not b!1084358) (not b!1084351) (not b!1084361) (not b_next!22489) (not b!1084352) tp_is_empty!26491)
(check-sat b_and!35629 (not b_next!22489))
