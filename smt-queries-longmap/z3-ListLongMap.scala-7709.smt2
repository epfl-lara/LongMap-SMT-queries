; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96856 () Bool)

(assert start!96856)

(declare-fun b_free!23179 () Bool)

(declare-fun b_next!23179 () Bool)

(assert (=> start!96856 (= b_free!23179 (not b_next!23179))))

(declare-fun tp!81493 () Bool)

(declare-fun b_and!37135 () Bool)

(assert (=> start!96856 (= tp!81493 b_and!37135)))

(declare-fun b!1101655 () Bool)

(declare-fun e!628804 () Bool)

(assert (=> b!1101655 (= e!628804 true)))

(declare-datatypes ((V!41433 0))(
  ( (V!41434 (val!13671 Int)) )
))
(declare-datatypes ((tuple2!17450 0))(
  ( (tuple2!17451 (_1!8736 (_ BitVec 64)) (_2!8736 V!41433)) )
))
(declare-datatypes ((List!24038 0))(
  ( (Nil!24035) (Cons!24034 (h!25243 tuple2!17450) (t!34254 List!24038)) )
))
(declare-datatypes ((ListLongMap!15419 0))(
  ( (ListLongMap!15420 (toList!7725 List!24038)) )
))
(declare-fun lt!493901 () ListLongMap!15419)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!493895 () ListLongMap!15419)

(declare-fun -!953 (ListLongMap!15419 (_ BitVec 64)) ListLongMap!15419)

(assert (=> b!1101655 (= (-!953 lt!493901 k0!904) lt!493895)))

(declare-fun minValue!831 () V!41433)

(declare-datatypes ((Unit!36033 0))(
  ( (Unit!36034) )
))
(declare-fun lt!493893 () Unit!36033)

(declare-fun lt!493898 () ListLongMap!15419)

(declare-fun addRemoveCommutativeForDiffKeys!131 (ListLongMap!15419 (_ BitVec 64) V!41433 (_ BitVec 64)) Unit!36033)

(assert (=> b!1101655 (= lt!493893 (addRemoveCommutativeForDiffKeys!131 lt!493898 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1101656 () Bool)

(declare-fun res!735095 () Bool)

(declare-fun e!628805 () Bool)

(assert (=> b!1101656 (=> (not res!735095) (not e!628805))))

(declare-datatypes ((array!71286 0))(
  ( (array!71287 (arr!34305 (Array (_ BitVec 32) (_ BitVec 64))) (size!34843 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71286)

(declare-datatypes ((List!24039 0))(
  ( (Nil!24036) (Cons!24035 (h!25244 (_ BitVec 64)) (t!34255 List!24039)) )
))
(declare-fun arrayNoDuplicates!0 (array!71286 (_ BitVec 32) List!24039) Bool)

(assert (=> b!1101656 (= res!735095 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24036))))

(declare-fun b!1101657 () Bool)

(declare-fun res!735089 () Bool)

(assert (=> b!1101657 (=> (not res!735089) (not e!628805))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71286 (_ BitVec 32)) Bool)

(assert (=> b!1101657 (= res!735089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101658 () Bool)

(declare-fun res!735090 () Bool)

(declare-fun e!628806 () Bool)

(assert (=> b!1101658 (=> (not res!735090) (not e!628806))))

(declare-fun lt!493903 () array!71286)

(assert (=> b!1101658 (= res!735090 (arrayNoDuplicates!0 lt!493903 #b00000000000000000000000000000000 Nil!24036))))

(declare-fun b!1101659 () Bool)

(declare-fun e!628810 () Bool)

(assert (=> b!1101659 (= e!628810 e!628804)))

(declare-fun res!735096 () Bool)

(assert (=> b!1101659 (=> res!735096 e!628804)))

(assert (=> b!1101659 (= res!735096 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!493904 () ListLongMap!15419)

(assert (=> b!1101659 (= lt!493904 lt!493901)))

(declare-fun lt!493896 () tuple2!17450)

(declare-fun +!3435 (ListLongMap!15419 tuple2!17450) ListLongMap!15419)

(assert (=> b!1101659 (= lt!493901 (+!3435 lt!493898 lt!493896))))

(declare-fun lt!493900 () ListLongMap!15419)

(assert (=> b!1101659 (= lt!493900 lt!493895)))

(declare-fun lt!493902 () ListLongMap!15419)

(assert (=> b!1101659 (= lt!493895 (+!3435 lt!493902 lt!493896))))

(declare-fun lt!493899 () ListLongMap!15419)

(assert (=> b!1101659 (= lt!493900 (+!3435 lt!493899 lt!493896))))

(assert (=> b!1101659 (= lt!493896 (tuple2!17451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1101660 () Bool)

(declare-fun res!735088 () Bool)

(assert (=> b!1101660 (=> (not res!735088) (not e!628805))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101660 (= res!735088 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34843 _keys!1070))))))

(declare-fun b!1101661 () Bool)

(declare-fun e!628803 () Bool)

(declare-fun tp_is_empty!27229 () Bool)

(assert (=> b!1101661 (= e!628803 tp_is_empty!27229)))

(declare-fun b!1101662 () Bool)

(assert (=> b!1101662 (= e!628806 (not e!628810))))

(declare-fun res!735094 () Bool)

(assert (=> b!1101662 (=> res!735094 e!628810)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101662 (= res!735094 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41433)

(declare-datatypes ((ValueCell!12905 0))(
  ( (ValueCellFull!12905 (v!16301 V!41433)) (EmptyCell!12905) )
))
(declare-datatypes ((array!71288 0))(
  ( (array!71289 (arr!34306 (Array (_ BitVec 32) ValueCell!12905)) (size!34844 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71288)

(declare-fun getCurrentListMap!4338 (array!71286 array!71288 (_ BitVec 32) (_ BitVec 32) V!41433 V!41433 (_ BitVec 32) Int) ListLongMap!15419)

(assert (=> b!1101662 (= lt!493904 (getCurrentListMap!4338 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493892 () array!71288)

(assert (=> b!1101662 (= lt!493900 (getCurrentListMap!4338 lt!493903 lt!493892 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1101662 (and (= lt!493899 lt!493902) (= lt!493902 lt!493899))))

(assert (=> b!1101662 (= lt!493902 (-!953 lt!493898 k0!904))))

(declare-fun lt!493897 () Unit!36033)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!227 (array!71286 array!71288 (_ BitVec 32) (_ BitVec 32) V!41433 V!41433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36033)

(assert (=> b!1101662 (= lt!493897 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!227 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4245 (array!71286 array!71288 (_ BitVec 32) (_ BitVec 32) V!41433 V!41433 (_ BitVec 32) Int) ListLongMap!15419)

(assert (=> b!1101662 (= lt!493899 (getCurrentListMapNoExtraKeys!4245 lt!493903 lt!493892 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2314 (Int (_ BitVec 64)) V!41433)

(assert (=> b!1101662 (= lt!493892 (array!71289 (store (arr!34306 _values!874) i!650 (ValueCellFull!12905 (dynLambda!2314 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34844 _values!874)))))

(assert (=> b!1101662 (= lt!493898 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101662 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493894 () Unit!36033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71286 (_ BitVec 64) (_ BitVec 32)) Unit!36033)

(assert (=> b!1101662 (= lt!493894 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101663 () Bool)

(declare-fun res!735091 () Bool)

(assert (=> b!1101663 (=> (not res!735091) (not e!628805))))

(assert (=> b!1101663 (= res!735091 (and (= (size!34844 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34843 _keys!1070) (size!34844 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101664 () Bool)

(declare-fun res!735097 () Bool)

(assert (=> b!1101664 (=> (not res!735097) (not e!628805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101664 (= res!735097 (validKeyInArray!0 k0!904))))

(declare-fun b!1101665 () Bool)

(declare-fun res!735092 () Bool)

(assert (=> b!1101665 (=> (not res!735092) (not e!628805))))

(assert (=> b!1101665 (= res!735092 (= (select (arr!34305 _keys!1070) i!650) k0!904))))

(declare-fun b!1101666 () Bool)

(declare-fun e!628807 () Bool)

(declare-fun e!628808 () Bool)

(declare-fun mapRes!42634 () Bool)

(assert (=> b!1101666 (= e!628807 (and e!628808 mapRes!42634))))

(declare-fun condMapEmpty!42634 () Bool)

(declare-fun mapDefault!42634 () ValueCell!12905)

(assert (=> b!1101666 (= condMapEmpty!42634 (= (arr!34306 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12905)) mapDefault!42634)))))

(declare-fun b!1101667 () Bool)

(assert (=> b!1101667 (= e!628808 tp_is_empty!27229)))

(declare-fun b!1101668 () Bool)

(assert (=> b!1101668 (= e!628805 e!628806)))

(declare-fun res!735087 () Bool)

(assert (=> b!1101668 (=> (not res!735087) (not e!628806))))

(assert (=> b!1101668 (= res!735087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493903 mask!1414))))

(assert (=> b!1101668 (= lt!493903 (array!71287 (store (arr!34305 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34843 _keys!1070)))))

(declare-fun mapNonEmpty!42634 () Bool)

(declare-fun tp!81494 () Bool)

(assert (=> mapNonEmpty!42634 (= mapRes!42634 (and tp!81494 e!628803))))

(declare-fun mapValue!42634 () ValueCell!12905)

(declare-fun mapRest!42634 () (Array (_ BitVec 32) ValueCell!12905))

(declare-fun mapKey!42634 () (_ BitVec 32))

(assert (=> mapNonEmpty!42634 (= (arr!34306 _values!874) (store mapRest!42634 mapKey!42634 mapValue!42634))))

(declare-fun res!735093 () Bool)

(assert (=> start!96856 (=> (not res!735093) (not e!628805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96856 (= res!735093 (validMask!0 mask!1414))))

(assert (=> start!96856 e!628805))

(assert (=> start!96856 tp!81493))

(assert (=> start!96856 true))

(assert (=> start!96856 tp_is_empty!27229))

(declare-fun array_inv!26456 (array!71286) Bool)

(assert (=> start!96856 (array_inv!26456 _keys!1070)))

(declare-fun array_inv!26457 (array!71288) Bool)

(assert (=> start!96856 (and (array_inv!26457 _values!874) e!628807)))

(declare-fun mapIsEmpty!42634 () Bool)

(assert (=> mapIsEmpty!42634 mapRes!42634))

(assert (= (and start!96856 res!735093) b!1101663))

(assert (= (and b!1101663 res!735091) b!1101657))

(assert (= (and b!1101657 res!735089) b!1101656))

(assert (= (and b!1101656 res!735095) b!1101660))

(assert (= (and b!1101660 res!735088) b!1101664))

(assert (= (and b!1101664 res!735097) b!1101665))

(assert (= (and b!1101665 res!735092) b!1101668))

(assert (= (and b!1101668 res!735087) b!1101658))

(assert (= (and b!1101658 res!735090) b!1101662))

(assert (= (and b!1101662 (not res!735094)) b!1101659))

(assert (= (and b!1101659 (not res!735096)) b!1101655))

(assert (= (and b!1101666 condMapEmpty!42634) mapIsEmpty!42634))

(assert (= (and b!1101666 (not condMapEmpty!42634)) mapNonEmpty!42634))

(get-info :version)

(assert (= (and mapNonEmpty!42634 ((_ is ValueCellFull!12905) mapValue!42634)) b!1101661))

(assert (= (and b!1101666 ((_ is ValueCellFull!12905) mapDefault!42634)) b!1101667))

(assert (= start!96856 b!1101666))

(declare-fun b_lambda!18115 () Bool)

(assert (=> (not b_lambda!18115) (not b!1101662)))

(declare-fun t!34253 () Bool)

(declare-fun tb!8037 () Bool)

(assert (=> (and start!96856 (= defaultEntry!882 defaultEntry!882) t!34253) tb!8037))

(declare-fun result!16625 () Bool)

(assert (=> tb!8037 (= result!16625 tp_is_empty!27229)))

(assert (=> b!1101662 t!34253))

(declare-fun b_and!37137 () Bool)

(assert (= b_and!37135 (and (=> t!34253 result!16625) b_and!37137)))

(declare-fun m!1021391 () Bool)

(assert (=> b!1101657 m!1021391))

(declare-fun m!1021393 () Bool)

(assert (=> b!1101665 m!1021393))

(declare-fun m!1021395 () Bool)

(assert (=> b!1101656 m!1021395))

(declare-fun m!1021397 () Bool)

(assert (=> b!1101668 m!1021397))

(declare-fun m!1021399 () Bool)

(assert (=> b!1101668 m!1021399))

(declare-fun m!1021401 () Bool)

(assert (=> start!96856 m!1021401))

(declare-fun m!1021403 () Bool)

(assert (=> start!96856 m!1021403))

(declare-fun m!1021405 () Bool)

(assert (=> start!96856 m!1021405))

(declare-fun m!1021407 () Bool)

(assert (=> b!1101662 m!1021407))

(declare-fun m!1021409 () Bool)

(assert (=> b!1101662 m!1021409))

(declare-fun m!1021411 () Bool)

(assert (=> b!1101662 m!1021411))

(declare-fun m!1021413 () Bool)

(assert (=> b!1101662 m!1021413))

(declare-fun m!1021415 () Bool)

(assert (=> b!1101662 m!1021415))

(declare-fun m!1021417 () Bool)

(assert (=> b!1101662 m!1021417))

(declare-fun m!1021419 () Bool)

(assert (=> b!1101662 m!1021419))

(declare-fun m!1021421 () Bool)

(assert (=> b!1101662 m!1021421))

(declare-fun m!1021423 () Bool)

(assert (=> b!1101662 m!1021423))

(declare-fun m!1021425 () Bool)

(assert (=> b!1101662 m!1021425))

(declare-fun m!1021427 () Bool)

(assert (=> b!1101659 m!1021427))

(declare-fun m!1021429 () Bool)

(assert (=> b!1101659 m!1021429))

(declare-fun m!1021431 () Bool)

(assert (=> b!1101659 m!1021431))

(declare-fun m!1021433 () Bool)

(assert (=> b!1101664 m!1021433))

(declare-fun m!1021435 () Bool)

(assert (=> b!1101658 m!1021435))

(declare-fun m!1021437 () Bool)

(assert (=> b!1101655 m!1021437))

(declare-fun m!1021439 () Bool)

(assert (=> b!1101655 m!1021439))

(declare-fun m!1021441 () Bool)

(assert (=> mapNonEmpty!42634 m!1021441))

(check-sat (not b!1101657) (not b!1101664) (not b!1101662) (not b!1101658) (not b_next!23179) (not start!96856) (not b!1101656) (not b!1101655) (not b!1101668) (not b!1101659) b_and!37137 (not b_lambda!18115) (not mapNonEmpty!42634) tp_is_empty!27229)
(check-sat b_and!37137 (not b_next!23179))
