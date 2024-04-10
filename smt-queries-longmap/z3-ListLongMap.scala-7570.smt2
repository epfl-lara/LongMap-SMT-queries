; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95742 () Bool)

(assert start!95742)

(declare-fun b_free!22395 () Bool)

(declare-fun b_next!22395 () Bool)

(assert (=> start!95742 (= b_free!22395 (not b_next!22395))))

(declare-fun tp!79033 () Bool)

(declare-fun b_and!35465 () Bool)

(assert (=> start!95742 (= tp!79033 b_and!35465)))

(declare-fun b!1082717 () Bool)

(declare-fun e!618732 () Bool)

(assert (=> b!1082717 (= e!618732 (not true))))

(declare-datatypes ((V!40323 0))(
  ( (V!40324 (val!13255 Int)) )
))
(declare-datatypes ((tuple2!16794 0))(
  ( (tuple2!16795 (_1!8408 (_ BitVec 64)) (_2!8408 V!40323)) )
))
(declare-datatypes ((List!23380 0))(
  ( (Nil!23377) (Cons!23376 (h!24585 tuple2!16794) (t!32833 List!23380)) )
))
(declare-datatypes ((ListLongMap!14763 0))(
  ( (ListLongMap!14764 (toList!7397 List!23380)) )
))
(declare-fun lt!479735 () ListLongMap!14763)

(declare-fun lt!479733 () ListLongMap!14763)

(assert (=> b!1082717 (and (= lt!479735 lt!479733) (= lt!479733 lt!479735))))

(declare-fun lt!479734 () ListLongMap!14763)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!724 (ListLongMap!14763 (_ BitVec 64)) ListLongMap!14763)

(assert (=> b!1082717 (= lt!479733 (-!724 lt!479734 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40323)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35614 0))(
  ( (Unit!35615) )
))
(declare-fun lt!479732 () Unit!35614)

(declare-fun zeroValue!831 () V!40323)

(declare-datatypes ((array!69739 0))(
  ( (array!69740 (arr!33543 (Array (_ BitVec 32) (_ BitVec 64))) (size!34079 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69739)

(declare-datatypes ((ValueCell!12489 0))(
  ( (ValueCellFull!12489 (v!15876 V!40323)) (EmptyCell!12489) )
))
(declare-datatypes ((array!69741 0))(
  ( (array!69742 (arr!33544 (Array (_ BitVec 32) ValueCell!12489)) (size!34080 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69741)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!4 (array!69739 array!69741 (_ BitVec 32) (_ BitVec 32) V!40323 V!40323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35614)

(assert (=> b!1082717 (= lt!479732 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!4 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479736 () array!69739)

(declare-fun getCurrentListMapNoExtraKeys!3945 (array!69739 array!69741 (_ BitVec 32) (_ BitVec 32) V!40323 V!40323 (_ BitVec 32) Int) ListLongMap!14763)

(declare-fun dynLambda!2082 (Int (_ BitVec 64)) V!40323)

(assert (=> b!1082717 (= lt!479735 (getCurrentListMapNoExtraKeys!3945 lt!479736 (array!69742 (store (arr!33544 _values!874) i!650 (ValueCellFull!12489 (dynLambda!2082 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34080 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082717 (= lt!479734 (getCurrentListMapNoExtraKeys!3945 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082717 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479737 () Unit!35614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69739 (_ BitVec 64) (_ BitVec 32)) Unit!35614)

(assert (=> b!1082717 (= lt!479737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082718 () Bool)

(declare-fun res!721732 () Bool)

(declare-fun e!618737 () Bool)

(assert (=> b!1082718 (=> (not res!721732) (not e!618737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69739 (_ BitVec 32)) Bool)

(assert (=> b!1082718 (= res!721732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41350 () Bool)

(declare-fun mapRes!41350 () Bool)

(assert (=> mapIsEmpty!41350 mapRes!41350))

(declare-fun b!1082719 () Bool)

(declare-fun e!618736 () Bool)

(declare-fun tp_is_empty!26397 () Bool)

(assert (=> b!1082719 (= e!618736 tp_is_empty!26397)))

(declare-fun mapNonEmpty!41350 () Bool)

(declare-fun tp!79034 () Bool)

(assert (=> mapNonEmpty!41350 (= mapRes!41350 (and tp!79034 e!618736))))

(declare-fun mapValue!41350 () ValueCell!12489)

(declare-fun mapKey!41350 () (_ BitVec 32))

(declare-fun mapRest!41350 () (Array (_ BitVec 32) ValueCell!12489))

(assert (=> mapNonEmpty!41350 (= (arr!33544 _values!874) (store mapRest!41350 mapKey!41350 mapValue!41350))))

(declare-fun b!1082720 () Bool)

(declare-fun res!721731 () Bool)

(assert (=> b!1082720 (=> (not res!721731) (not e!618737))))

(assert (=> b!1082720 (= res!721731 (= (select (arr!33543 _keys!1070) i!650) k0!904))))

(declare-fun b!1082721 () Bool)

(declare-fun res!721733 () Bool)

(assert (=> b!1082721 (=> (not res!721733) (not e!618737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082721 (= res!721733 (validKeyInArray!0 k0!904))))

(declare-fun b!1082722 () Bool)

(declare-fun e!618734 () Bool)

(assert (=> b!1082722 (= e!618734 tp_is_empty!26397)))

(declare-fun b!1082723 () Bool)

(declare-fun res!721734 () Bool)

(assert (=> b!1082723 (=> (not res!721734) (not e!618737))))

(assert (=> b!1082723 (= res!721734 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34079 _keys!1070))))))

(declare-fun b!1082724 () Bool)

(assert (=> b!1082724 (= e!618737 e!618732)))

(declare-fun res!721736 () Bool)

(assert (=> b!1082724 (=> (not res!721736) (not e!618732))))

(assert (=> b!1082724 (= res!721736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479736 mask!1414))))

(assert (=> b!1082724 (= lt!479736 (array!69740 (store (arr!33543 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34079 _keys!1070)))))

(declare-fun b!1082725 () Bool)

(declare-fun res!721729 () Bool)

(assert (=> b!1082725 (=> (not res!721729) (not e!618737))))

(assert (=> b!1082725 (= res!721729 (and (= (size!34080 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34079 _keys!1070) (size!34080 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082726 () Bool)

(declare-fun e!618735 () Bool)

(assert (=> b!1082726 (= e!618735 (and e!618734 mapRes!41350))))

(declare-fun condMapEmpty!41350 () Bool)

(declare-fun mapDefault!41350 () ValueCell!12489)

(assert (=> b!1082726 (= condMapEmpty!41350 (= (arr!33544 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12489)) mapDefault!41350)))))

(declare-fun b!1082727 () Bool)

(declare-fun res!721730 () Bool)

(assert (=> b!1082727 (=> (not res!721730) (not e!618732))))

(declare-datatypes ((List!23381 0))(
  ( (Nil!23378) (Cons!23377 (h!24586 (_ BitVec 64)) (t!32834 List!23381)) )
))
(declare-fun arrayNoDuplicates!0 (array!69739 (_ BitVec 32) List!23381) Bool)

(assert (=> b!1082727 (= res!721730 (arrayNoDuplicates!0 lt!479736 #b00000000000000000000000000000000 Nil!23378))))

(declare-fun b!1082728 () Bool)

(declare-fun res!721735 () Bool)

(assert (=> b!1082728 (=> (not res!721735) (not e!618737))))

(assert (=> b!1082728 (= res!721735 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23378))))

(declare-fun res!721737 () Bool)

(assert (=> start!95742 (=> (not res!721737) (not e!618737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95742 (= res!721737 (validMask!0 mask!1414))))

(assert (=> start!95742 e!618737))

(assert (=> start!95742 tp!79033))

(assert (=> start!95742 true))

(assert (=> start!95742 tp_is_empty!26397))

(declare-fun array_inv!25890 (array!69739) Bool)

(assert (=> start!95742 (array_inv!25890 _keys!1070)))

(declare-fun array_inv!25891 (array!69741) Bool)

(assert (=> start!95742 (and (array_inv!25891 _values!874) e!618735)))

(assert (= (and start!95742 res!721737) b!1082725))

(assert (= (and b!1082725 res!721729) b!1082718))

(assert (= (and b!1082718 res!721732) b!1082728))

(assert (= (and b!1082728 res!721735) b!1082723))

(assert (= (and b!1082723 res!721734) b!1082721))

(assert (= (and b!1082721 res!721733) b!1082720))

(assert (= (and b!1082720 res!721731) b!1082724))

(assert (= (and b!1082724 res!721736) b!1082727))

(assert (= (and b!1082727 res!721730) b!1082717))

(assert (= (and b!1082726 condMapEmpty!41350) mapIsEmpty!41350))

(assert (= (and b!1082726 (not condMapEmpty!41350)) mapNonEmpty!41350))

(get-info :version)

(assert (= (and mapNonEmpty!41350 ((_ is ValueCellFull!12489) mapValue!41350)) b!1082719))

(assert (= (and b!1082726 ((_ is ValueCellFull!12489) mapDefault!41350)) b!1082722))

(assert (= start!95742 b!1082726))

(declare-fun b_lambda!17065 () Bool)

(assert (=> (not b_lambda!17065) (not b!1082717)))

(declare-fun t!32832 () Bool)

(declare-fun tb!7273 () Bool)

(assert (=> (and start!95742 (= defaultEntry!882 defaultEntry!882) t!32832) tb!7273))

(declare-fun result!15065 () Bool)

(assert (=> tb!7273 (= result!15065 tp_is_empty!26397)))

(assert (=> b!1082717 t!32832))

(declare-fun b_and!35467 () Bool)

(assert (= b_and!35465 (and (=> t!32832 result!15065) b_and!35467)))

(declare-fun m!1000389 () Bool)

(assert (=> b!1082721 m!1000389))

(declare-fun m!1000391 () Bool)

(assert (=> start!95742 m!1000391))

(declare-fun m!1000393 () Bool)

(assert (=> start!95742 m!1000393))

(declare-fun m!1000395 () Bool)

(assert (=> start!95742 m!1000395))

(declare-fun m!1000397 () Bool)

(assert (=> b!1082724 m!1000397))

(declare-fun m!1000399 () Bool)

(assert (=> b!1082724 m!1000399))

(declare-fun m!1000401 () Bool)

(assert (=> b!1082720 m!1000401))

(declare-fun m!1000403 () Bool)

(assert (=> b!1082717 m!1000403))

(declare-fun m!1000405 () Bool)

(assert (=> b!1082717 m!1000405))

(declare-fun m!1000407 () Bool)

(assert (=> b!1082717 m!1000407))

(declare-fun m!1000409 () Bool)

(assert (=> b!1082717 m!1000409))

(declare-fun m!1000411 () Bool)

(assert (=> b!1082717 m!1000411))

(declare-fun m!1000413 () Bool)

(assert (=> b!1082717 m!1000413))

(declare-fun m!1000415 () Bool)

(assert (=> b!1082717 m!1000415))

(declare-fun m!1000417 () Bool)

(assert (=> b!1082717 m!1000417))

(declare-fun m!1000419 () Bool)

(assert (=> mapNonEmpty!41350 m!1000419))

(declare-fun m!1000421 () Bool)

(assert (=> b!1082727 m!1000421))

(declare-fun m!1000423 () Bool)

(assert (=> b!1082728 m!1000423))

(declare-fun m!1000425 () Bool)

(assert (=> b!1082718 m!1000425))

(check-sat (not b_next!22395) (not b!1082718) (not start!95742) (not b!1082728) b_and!35467 (not b!1082727) (not b!1082721) (not b!1082724) tp_is_empty!26397 (not b!1082717) (not mapNonEmpty!41350) (not b_lambda!17065))
(check-sat b_and!35467 (not b_next!22395))
