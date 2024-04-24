; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96516 () Bool)

(assert start!96516)

(declare-fun b_free!22933 () Bool)

(declare-fun b_next!22933 () Bool)

(assert (=> start!96516 (= b_free!22933 (not b_next!22933))))

(declare-fun tp!80648 () Bool)

(declare-fun b_and!36551 () Bool)

(assert (=> start!96516 (= tp!80648 b_and!36551)))

(declare-fun b!1095328 () Bool)

(declare-fun e!625467 () Bool)

(declare-fun tp_is_empty!26935 () Bool)

(assert (=> b!1095328 (= e!625467 tp_is_empty!26935)))

(declare-fun res!730584 () Bool)

(declare-fun e!625465 () Bool)

(assert (=> start!96516 (=> (not res!730584) (not e!625465))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96516 (= res!730584 (validMask!0 mask!1414))))

(assert (=> start!96516 e!625465))

(assert (=> start!96516 tp!80648))

(assert (=> start!96516 true))

(assert (=> start!96516 tp_is_empty!26935))

(declare-datatypes ((array!70815 0))(
  ( (array!70816 (arr!34075 (Array (_ BitVec 32) (_ BitVec 64))) (size!34612 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70815)

(declare-fun array_inv!26300 (array!70815) Bool)

(assert (=> start!96516 (array_inv!26300 _keys!1070)))

(declare-datatypes ((V!41041 0))(
  ( (V!41042 (val!13524 Int)) )
))
(declare-datatypes ((ValueCell!12758 0))(
  ( (ValueCellFull!12758 (v!16141 V!41041)) (EmptyCell!12758) )
))
(declare-datatypes ((array!70817 0))(
  ( (array!70818 (arr!34076 (Array (_ BitVec 32) ValueCell!12758)) (size!34613 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70817)

(declare-fun e!625466 () Bool)

(declare-fun array_inv!26301 (array!70817) Bool)

(assert (=> start!96516 (and (array_inv!26301 _values!874) e!625466)))

(declare-fun b!1095329 () Bool)

(declare-fun res!730582 () Bool)

(assert (=> b!1095329 (=> (not res!730582) (not e!625465))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095329 (= res!730582 (and (= (size!34613 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34612 _keys!1070) (size!34613 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095330 () Bool)

(declare-fun e!625469 () Bool)

(declare-fun mapRes!42157 () Bool)

(assert (=> b!1095330 (= e!625466 (and e!625469 mapRes!42157))))

(declare-fun condMapEmpty!42157 () Bool)

(declare-fun mapDefault!42157 () ValueCell!12758)

(assert (=> b!1095330 (= condMapEmpty!42157 (= (arr!34076 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12758)) mapDefault!42157)))))

(declare-fun mapNonEmpty!42157 () Bool)

(declare-fun tp!80647 () Bool)

(assert (=> mapNonEmpty!42157 (= mapRes!42157 (and tp!80647 e!625467))))

(declare-fun mapValue!42157 () ValueCell!12758)

(declare-fun mapRest!42157 () (Array (_ BitVec 32) ValueCell!12758))

(declare-fun mapKey!42157 () (_ BitVec 32))

(assert (=> mapNonEmpty!42157 (= (arr!34076 _values!874) (store mapRest!42157 mapKey!42157 mapValue!42157))))

(declare-fun b!1095331 () Bool)

(declare-fun res!730580 () Bool)

(assert (=> b!1095331 (=> (not res!730580) (not e!625465))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095331 (= res!730580 (validKeyInArray!0 k0!904))))

(declare-fun b!1095332 () Bool)

(declare-fun res!730577 () Bool)

(assert (=> b!1095332 (=> (not res!730577) (not e!625465))))

(declare-datatypes ((List!23811 0))(
  ( (Nil!23808) (Cons!23807 (h!25025 (_ BitVec 64)) (t!33794 List!23811)) )
))
(declare-fun arrayNoDuplicates!0 (array!70815 (_ BitVec 32) List!23811) Bool)

(assert (=> b!1095332 (= res!730577 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23808))))

(declare-fun b!1095333 () Bool)

(assert (=> b!1095333 (= e!625469 tp_is_empty!26935)))

(declare-fun b!1095334 () Bool)

(declare-fun res!730581 () Bool)

(declare-fun e!625468 () Bool)

(assert (=> b!1095334 (=> (not res!730581) (not e!625468))))

(declare-fun lt!489912 () array!70815)

(assert (=> b!1095334 (= res!730581 (arrayNoDuplicates!0 lt!489912 #b00000000000000000000000000000000 Nil!23808))))

(declare-fun mapIsEmpty!42157 () Bool)

(assert (=> mapIsEmpty!42157 mapRes!42157))

(declare-fun b!1095335 () Bool)

(declare-fun res!730576 () Bool)

(assert (=> b!1095335 (=> (not res!730576) (not e!625465))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095335 (= res!730576 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34612 _keys!1070))))))

(declare-fun b!1095336 () Bool)

(declare-fun res!730579 () Bool)

(assert (=> b!1095336 (=> (not res!730579) (not e!625465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70815 (_ BitVec 32)) Bool)

(assert (=> b!1095336 (= res!730579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095337 () Bool)

(assert (=> b!1095337 (= e!625468 (not true))))

(declare-fun minValue!831 () V!41041)

(declare-fun zeroValue!831 () V!41041)

(declare-datatypes ((tuple2!17214 0))(
  ( (tuple2!17215 (_1!8618 (_ BitVec 64)) (_2!8618 V!41041)) )
))
(declare-datatypes ((List!23812 0))(
  ( (Nil!23809) (Cons!23808 (h!25026 tuple2!17214) (t!33795 List!23812)) )
))
(declare-datatypes ((ListLongMap!15191 0))(
  ( (ListLongMap!15192 (toList!7611 List!23812)) )
))
(declare-fun lt!489915 () ListLongMap!15191)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4359 (array!70815 array!70817 (_ BitVec 32) (_ BitVec 32) V!41041 V!41041 (_ BitVec 32) Int) ListLongMap!15191)

(assert (=> b!1095337 (= lt!489915 (getCurrentListMap!4359 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489918 () array!70817)

(declare-fun lt!489911 () ListLongMap!15191)

(assert (=> b!1095337 (= lt!489911 (getCurrentListMap!4359 lt!489912 lt!489918 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489916 () ListLongMap!15191)

(declare-fun lt!489917 () ListLongMap!15191)

(assert (=> b!1095337 (and (= lt!489916 lt!489917) (= lt!489917 lt!489916))))

(declare-fun lt!489910 () ListLongMap!15191)

(declare-fun -!916 (ListLongMap!15191 (_ BitVec 64)) ListLongMap!15191)

(assert (=> b!1095337 (= lt!489917 (-!916 lt!489910 k0!904))))

(declare-datatypes ((Unit!35999 0))(
  ( (Unit!36000) )
))
(declare-fun lt!489914 () Unit!35999)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!188 (array!70815 array!70817 (_ BitVec 32) (_ BitVec 32) V!41041 V!41041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35999)

(assert (=> b!1095337 (= lt!489914 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4164 (array!70815 array!70817 (_ BitVec 32) (_ BitVec 32) V!41041 V!41041 (_ BitVec 32) Int) ListLongMap!15191)

(assert (=> b!1095337 (= lt!489916 (getCurrentListMapNoExtraKeys!4164 lt!489912 lt!489918 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2285 (Int (_ BitVec 64)) V!41041)

(assert (=> b!1095337 (= lt!489918 (array!70818 (store (arr!34076 _values!874) i!650 (ValueCellFull!12758 (dynLambda!2285 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34613 _values!874)))))

(assert (=> b!1095337 (= lt!489910 (getCurrentListMapNoExtraKeys!4164 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095337 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489913 () Unit!35999)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70815 (_ BitVec 64) (_ BitVec 32)) Unit!35999)

(assert (=> b!1095337 (= lt!489913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095338 () Bool)

(assert (=> b!1095338 (= e!625465 e!625468)))

(declare-fun res!730583 () Bool)

(assert (=> b!1095338 (=> (not res!730583) (not e!625468))))

(assert (=> b!1095338 (= res!730583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489912 mask!1414))))

(assert (=> b!1095338 (= lt!489912 (array!70816 (store (arr!34075 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34612 _keys!1070)))))

(declare-fun b!1095339 () Bool)

(declare-fun res!730578 () Bool)

(assert (=> b!1095339 (=> (not res!730578) (not e!625465))))

(assert (=> b!1095339 (= res!730578 (= (select (arr!34075 _keys!1070) i!650) k0!904))))

(assert (= (and start!96516 res!730584) b!1095329))

(assert (= (and b!1095329 res!730582) b!1095336))

(assert (= (and b!1095336 res!730579) b!1095332))

(assert (= (and b!1095332 res!730577) b!1095335))

(assert (= (and b!1095335 res!730576) b!1095331))

(assert (= (and b!1095331 res!730580) b!1095339))

(assert (= (and b!1095339 res!730578) b!1095338))

(assert (= (and b!1095338 res!730583) b!1095334))

(assert (= (and b!1095334 res!730581) b!1095337))

(assert (= (and b!1095330 condMapEmpty!42157) mapIsEmpty!42157))

(assert (= (and b!1095330 (not condMapEmpty!42157)) mapNonEmpty!42157))

(get-info :version)

(assert (= (and mapNonEmpty!42157 ((_ is ValueCellFull!12758) mapValue!42157)) b!1095328))

(assert (= (and b!1095330 ((_ is ValueCellFull!12758) mapDefault!42157)) b!1095333))

(assert (= start!96516 b!1095330))

(declare-fun b_lambda!17613 () Bool)

(assert (=> (not b_lambda!17613) (not b!1095337)))

(declare-fun t!33793 () Bool)

(declare-fun tb!7803 () Bool)

(assert (=> (and start!96516 (= defaultEntry!882 defaultEntry!882) t!33793) tb!7803))

(declare-fun result!16133 () Bool)

(assert (=> tb!7803 (= result!16133 tp_is_empty!26935)))

(assert (=> b!1095337 t!33793))

(declare-fun b_and!36553 () Bool)

(assert (= b_and!36551 (and (=> t!33793 result!16133) b_and!36553)))

(declare-fun m!1015601 () Bool)

(assert (=> b!1095337 m!1015601))

(declare-fun m!1015603 () Bool)

(assert (=> b!1095337 m!1015603))

(declare-fun m!1015605 () Bool)

(assert (=> b!1095337 m!1015605))

(declare-fun m!1015607 () Bool)

(assert (=> b!1095337 m!1015607))

(declare-fun m!1015609 () Bool)

(assert (=> b!1095337 m!1015609))

(declare-fun m!1015611 () Bool)

(assert (=> b!1095337 m!1015611))

(declare-fun m!1015613 () Bool)

(assert (=> b!1095337 m!1015613))

(declare-fun m!1015615 () Bool)

(assert (=> b!1095337 m!1015615))

(declare-fun m!1015617 () Bool)

(assert (=> b!1095337 m!1015617))

(declare-fun m!1015619 () Bool)

(assert (=> b!1095337 m!1015619))

(declare-fun m!1015621 () Bool)

(assert (=> b!1095332 m!1015621))

(declare-fun m!1015623 () Bool)

(assert (=> b!1095331 m!1015623))

(declare-fun m!1015625 () Bool)

(assert (=> mapNonEmpty!42157 m!1015625))

(declare-fun m!1015627 () Bool)

(assert (=> b!1095338 m!1015627))

(declare-fun m!1015629 () Bool)

(assert (=> b!1095338 m!1015629))

(declare-fun m!1015631 () Bool)

(assert (=> b!1095336 m!1015631))

(declare-fun m!1015633 () Bool)

(assert (=> b!1095339 m!1015633))

(declare-fun m!1015635 () Bool)

(assert (=> b!1095334 m!1015635))

(declare-fun m!1015637 () Bool)

(assert (=> start!96516 m!1015637))

(declare-fun m!1015639 () Bool)

(assert (=> start!96516 m!1015639))

(declare-fun m!1015641 () Bool)

(assert (=> start!96516 m!1015641))

(check-sat (not b!1095336) (not start!96516) b_and!36553 (not b_lambda!17613) (not b_next!22933) (not b!1095337) tp_is_empty!26935 (not b!1095334) (not b!1095331) (not b!1095338) (not mapNonEmpty!42157) (not b!1095332))
(check-sat b_and!36553 (not b_next!22933))
