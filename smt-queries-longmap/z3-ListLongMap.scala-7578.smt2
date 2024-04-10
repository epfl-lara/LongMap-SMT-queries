; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95790 () Bool)

(assert start!95790)

(declare-fun b_free!22443 () Bool)

(declare-fun b_next!22443 () Bool)

(assert (=> start!95790 (= b_free!22443 (not b_next!22443))))

(declare-fun tp!79178 () Bool)

(declare-fun b_and!35561 () Bool)

(assert (=> start!95790 (= tp!79178 b_and!35561)))

(declare-fun b!1083629 () Bool)

(declare-fun e!619165 () Bool)

(declare-fun tp_is_empty!26445 () Bool)

(assert (=> b!1083629 (= e!619165 tp_is_empty!26445)))

(declare-fun b!1083630 () Bool)

(declare-fun e!619167 () Bool)

(declare-fun e!619164 () Bool)

(assert (=> b!1083630 (= e!619167 e!619164)))

(declare-fun res!722378 () Bool)

(assert (=> b!1083630 (=> (not res!722378) (not e!619164))))

(declare-datatypes ((array!69833 0))(
  ( (array!69834 (arr!33590 (Array (_ BitVec 32) (_ BitVec 64))) (size!34126 (_ BitVec 32))) )
))
(declare-fun lt!480177 () array!69833)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69833 (_ BitVec 32)) Bool)

(assert (=> b!1083630 (= res!722378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480177 mask!1414))))

(declare-fun _keys!1070 () array!69833)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083630 (= lt!480177 (array!69834 (store (arr!33590 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34126 _keys!1070)))))

(declare-fun b!1083632 () Bool)

(declare-fun e!619169 () Bool)

(declare-fun mapRes!41422 () Bool)

(assert (=> b!1083632 (= e!619169 (and e!619165 mapRes!41422))))

(declare-fun condMapEmpty!41422 () Bool)

(declare-datatypes ((V!40387 0))(
  ( (V!40388 (val!13279 Int)) )
))
(declare-datatypes ((ValueCell!12513 0))(
  ( (ValueCellFull!12513 (v!15900 V!40387)) (EmptyCell!12513) )
))
(declare-datatypes ((array!69835 0))(
  ( (array!69836 (arr!33591 (Array (_ BitVec 32) ValueCell!12513)) (size!34127 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69835)

(declare-fun mapDefault!41422 () ValueCell!12513)

(assert (=> b!1083632 (= condMapEmpty!41422 (= (arr!33591 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12513)) mapDefault!41422)))))

(declare-fun b!1083633 () Bool)

(assert (=> b!1083633 (= e!619164 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40387)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!480178 () array!69835)

(declare-datatypes ((tuple2!16828 0))(
  ( (tuple2!16829 (_1!8425 (_ BitVec 64)) (_2!8425 V!40387)) )
))
(declare-datatypes ((List!23415 0))(
  ( (Nil!23412) (Cons!23411 (h!24620 tuple2!16828) (t!32916 List!23415)) )
))
(declare-datatypes ((ListLongMap!14797 0))(
  ( (ListLongMap!14798 (toList!7414 List!23415)) )
))
(declare-fun lt!480174 () ListLongMap!14797)

(declare-fun zeroValue!831 () V!40387)

(declare-fun getCurrentListMap!4202 (array!69833 array!69835 (_ BitVec 32) (_ BitVec 32) V!40387 V!40387 (_ BitVec 32) Int) ListLongMap!14797)

(assert (=> b!1083633 (= lt!480174 (getCurrentListMap!4202 lt!480177 lt!480178 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480176 () ListLongMap!14797)

(declare-fun lt!480181 () ListLongMap!14797)

(assert (=> b!1083633 (and (= lt!480176 lt!480181) (= lt!480181 lt!480176))))

(declare-fun lt!480175 () ListLongMap!14797)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!741 (ListLongMap!14797 (_ BitVec 64)) ListLongMap!14797)

(assert (=> b!1083633 (= lt!480181 (-!741 lt!480175 k0!904))))

(declare-datatypes ((Unit!35648 0))(
  ( (Unit!35649) )
))
(declare-fun lt!480179 () Unit!35648)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!21 (array!69833 array!69835 (_ BitVec 32) (_ BitVec 32) V!40387 V!40387 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35648)

(assert (=> b!1083633 (= lt!480179 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!21 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3962 (array!69833 array!69835 (_ BitVec 32) (_ BitVec 32) V!40387 V!40387 (_ BitVec 32) Int) ListLongMap!14797)

(assert (=> b!1083633 (= lt!480176 (getCurrentListMapNoExtraKeys!3962 lt!480177 lt!480178 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2099 (Int (_ BitVec 64)) V!40387)

(assert (=> b!1083633 (= lt!480178 (array!69836 (store (arr!33591 _values!874) i!650 (ValueCellFull!12513 (dynLambda!2099 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34127 _values!874)))))

(assert (=> b!1083633 (= lt!480175 (getCurrentListMapNoExtraKeys!3962 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083633 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480180 () Unit!35648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69833 (_ BitVec 64) (_ BitVec 32)) Unit!35648)

(assert (=> b!1083633 (= lt!480180 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083634 () Bool)

(declare-fun e!619166 () Bool)

(assert (=> b!1083634 (= e!619166 tp_is_empty!26445)))

(declare-fun b!1083635 () Bool)

(declare-fun res!722382 () Bool)

(assert (=> b!1083635 (=> (not res!722382) (not e!619167))))

(assert (=> b!1083635 (= res!722382 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34126 _keys!1070))))))

(declare-fun mapNonEmpty!41422 () Bool)

(declare-fun tp!79177 () Bool)

(assert (=> mapNonEmpty!41422 (= mapRes!41422 (and tp!79177 e!619166))))

(declare-fun mapKey!41422 () (_ BitVec 32))

(declare-fun mapValue!41422 () ValueCell!12513)

(declare-fun mapRest!41422 () (Array (_ BitVec 32) ValueCell!12513))

(assert (=> mapNonEmpty!41422 (= (arr!33591 _values!874) (store mapRest!41422 mapKey!41422 mapValue!41422))))

(declare-fun b!1083636 () Bool)

(declare-fun res!722384 () Bool)

(assert (=> b!1083636 (=> (not res!722384) (not e!619167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083636 (= res!722384 (validKeyInArray!0 k0!904))))

(declare-fun b!1083637 () Bool)

(declare-fun res!722380 () Bool)

(assert (=> b!1083637 (=> (not res!722380) (not e!619167))))

(assert (=> b!1083637 (= res!722380 (and (= (size!34127 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34126 _keys!1070) (size!34127 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!722385 () Bool)

(assert (=> start!95790 (=> (not res!722385) (not e!619167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95790 (= res!722385 (validMask!0 mask!1414))))

(assert (=> start!95790 e!619167))

(assert (=> start!95790 tp!79178))

(assert (=> start!95790 true))

(assert (=> start!95790 tp_is_empty!26445))

(declare-fun array_inv!25926 (array!69833) Bool)

(assert (=> start!95790 (array_inv!25926 _keys!1070)))

(declare-fun array_inv!25927 (array!69835) Bool)

(assert (=> start!95790 (and (array_inv!25927 _values!874) e!619169)))

(declare-fun b!1083631 () Bool)

(declare-fun res!722377 () Bool)

(assert (=> b!1083631 (=> (not res!722377) (not e!619167))))

(declare-datatypes ((List!23416 0))(
  ( (Nil!23413) (Cons!23412 (h!24621 (_ BitVec 64)) (t!32917 List!23416)) )
))
(declare-fun arrayNoDuplicates!0 (array!69833 (_ BitVec 32) List!23416) Bool)

(assert (=> b!1083631 (= res!722377 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23413))))

(declare-fun b!1083638 () Bool)

(declare-fun res!722383 () Bool)

(assert (=> b!1083638 (=> (not res!722383) (not e!619167))))

(assert (=> b!1083638 (= res!722383 (= (select (arr!33590 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41422 () Bool)

(assert (=> mapIsEmpty!41422 mapRes!41422))

(declare-fun b!1083639 () Bool)

(declare-fun res!722379 () Bool)

(assert (=> b!1083639 (=> (not res!722379) (not e!619164))))

(assert (=> b!1083639 (= res!722379 (arrayNoDuplicates!0 lt!480177 #b00000000000000000000000000000000 Nil!23413))))

(declare-fun b!1083640 () Bool)

(declare-fun res!722381 () Bool)

(assert (=> b!1083640 (=> (not res!722381) (not e!619167))))

(assert (=> b!1083640 (= res!722381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95790 res!722385) b!1083637))

(assert (= (and b!1083637 res!722380) b!1083640))

(assert (= (and b!1083640 res!722381) b!1083631))

(assert (= (and b!1083631 res!722377) b!1083635))

(assert (= (and b!1083635 res!722382) b!1083636))

(assert (= (and b!1083636 res!722384) b!1083638))

(assert (= (and b!1083638 res!722383) b!1083630))

(assert (= (and b!1083630 res!722378) b!1083639))

(assert (= (and b!1083639 res!722379) b!1083633))

(assert (= (and b!1083632 condMapEmpty!41422) mapIsEmpty!41422))

(assert (= (and b!1083632 (not condMapEmpty!41422)) mapNonEmpty!41422))

(get-info :version)

(assert (= (and mapNonEmpty!41422 ((_ is ValueCellFull!12513) mapValue!41422)) b!1083634))

(assert (= (and b!1083632 ((_ is ValueCellFull!12513) mapDefault!41422)) b!1083629))

(assert (= start!95790 b!1083632))

(declare-fun b_lambda!17113 () Bool)

(assert (=> (not b_lambda!17113) (not b!1083633)))

(declare-fun t!32915 () Bool)

(declare-fun tb!7321 () Bool)

(assert (=> (and start!95790 (= defaultEntry!882 defaultEntry!882) t!32915) tb!7321))

(declare-fun result!15161 () Bool)

(assert (=> tb!7321 (= result!15161 tp_is_empty!26445)))

(assert (=> b!1083633 t!32915))

(declare-fun b_and!35563 () Bool)

(assert (= b_and!35561 (and (=> t!32915 result!15161) b_and!35563)))

(declare-fun m!1001303 () Bool)

(assert (=> mapNonEmpty!41422 m!1001303))

(declare-fun m!1001305 () Bool)

(assert (=> b!1083631 m!1001305))

(declare-fun m!1001307 () Bool)

(assert (=> b!1083633 m!1001307))

(declare-fun m!1001309 () Bool)

(assert (=> b!1083633 m!1001309))

(declare-fun m!1001311 () Bool)

(assert (=> b!1083633 m!1001311))

(declare-fun m!1001313 () Bool)

(assert (=> b!1083633 m!1001313))

(declare-fun m!1001315 () Bool)

(assert (=> b!1083633 m!1001315))

(declare-fun m!1001317 () Bool)

(assert (=> b!1083633 m!1001317))

(declare-fun m!1001319 () Bool)

(assert (=> b!1083633 m!1001319))

(declare-fun m!1001321 () Bool)

(assert (=> b!1083633 m!1001321))

(declare-fun m!1001323 () Bool)

(assert (=> b!1083633 m!1001323))

(declare-fun m!1001325 () Bool)

(assert (=> b!1083640 m!1001325))

(declare-fun m!1001327 () Bool)

(assert (=> b!1083636 m!1001327))

(declare-fun m!1001329 () Bool)

(assert (=> start!95790 m!1001329))

(declare-fun m!1001331 () Bool)

(assert (=> start!95790 m!1001331))

(declare-fun m!1001333 () Bool)

(assert (=> start!95790 m!1001333))

(declare-fun m!1001335 () Bool)

(assert (=> b!1083630 m!1001335))

(declare-fun m!1001337 () Bool)

(assert (=> b!1083630 m!1001337))

(declare-fun m!1001339 () Bool)

(assert (=> b!1083638 m!1001339))

(declare-fun m!1001341 () Bool)

(assert (=> b!1083639 m!1001341))

(check-sat (not b!1083631) (not b!1083639) (not mapNonEmpty!41422) b_and!35563 tp_is_empty!26445 (not start!95790) (not b!1083633) (not b_next!22443) (not b!1083630) (not b!1083636) (not b_lambda!17113) (not b!1083640))
(check-sat b_and!35563 (not b_next!22443))
