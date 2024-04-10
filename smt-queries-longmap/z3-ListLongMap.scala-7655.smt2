; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96252 () Bool)

(assert start!96252)

(declare-fun b_free!22905 () Bool)

(declare-fun b_next!22905 () Bool)

(assert (=> start!96252 (= b_free!22905 (not b_next!22905))))

(declare-fun tp!80564 () Bool)

(declare-fun b_and!36485 () Bool)

(assert (=> start!96252 (= tp!80564 b_and!36485)))

(declare-fun mapNonEmpty!42115 () Bool)

(declare-fun mapRes!42115 () Bool)

(declare-fun tp!80563 () Bool)

(declare-fun e!624358 () Bool)

(assert (=> mapNonEmpty!42115 (= mapRes!42115 (and tp!80563 e!624358))))

(declare-datatypes ((V!41003 0))(
  ( (V!41004 (val!13510 Int)) )
))
(declare-datatypes ((ValueCell!12744 0))(
  ( (ValueCellFull!12744 (v!16131 V!41003)) (EmptyCell!12744) )
))
(declare-datatypes ((array!70731 0))(
  ( (array!70732 (arr!34039 (Array (_ BitVec 32) ValueCell!12744)) (size!34575 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70731)

(declare-fun mapValue!42115 () ValueCell!12744)

(declare-fun mapKey!42115 () (_ BitVec 32))

(declare-fun mapRest!42115 () (Array (_ BitVec 32) ValueCell!12744))

(assert (=> mapNonEmpty!42115 (= (arr!34039 _values!874) (store mapRest!42115 mapKey!42115 mapValue!42115))))

(declare-fun b!1093469 () Bool)

(declare-fun res!729676 () Bool)

(declare-fun e!624362 () Bool)

(assert (=> b!1093469 (=> (not res!729676) (not e!624362))))

(declare-datatypes ((array!70733 0))(
  ( (array!70734 (arr!34040 (Array (_ BitVec 32) (_ BitVec 64))) (size!34576 (_ BitVec 32))) )
))
(declare-fun lt!489018 () array!70733)

(declare-datatypes ((List!23781 0))(
  ( (Nil!23778) (Cons!23777 (h!24986 (_ BitVec 64)) (t!33744 List!23781)) )
))
(declare-fun arrayNoDuplicates!0 (array!70733 (_ BitVec 32) List!23781) Bool)

(assert (=> b!1093469 (= res!729676 (arrayNoDuplicates!0 lt!489018 #b00000000000000000000000000000000 Nil!23778))))

(declare-fun b!1093470 () Bool)

(declare-fun e!624357 () Bool)

(assert (=> b!1093470 (= e!624357 e!624362)))

(declare-fun res!729677 () Bool)

(assert (=> b!1093470 (=> (not res!729677) (not e!624362))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70733 (_ BitVec 32)) Bool)

(assert (=> b!1093470 (= res!729677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489018 mask!1414))))

(declare-fun _keys!1070 () array!70733)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093470 (= lt!489018 (array!70734 (store (arr!34040 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34576 _keys!1070)))))

(declare-fun b!1093471 () Bool)

(declare-fun res!729684 () Bool)

(assert (=> b!1093471 (=> (not res!729684) (not e!624357))))

(assert (=> b!1093471 (= res!729684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093472 () Bool)

(declare-fun res!729682 () Bool)

(assert (=> b!1093472 (=> (not res!729682) (not e!624357))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093472 (= res!729682 (validKeyInArray!0 k0!904))))

(declare-fun b!1093473 () Bool)

(declare-fun res!729683 () Bool)

(assert (=> b!1093473 (=> (not res!729683) (not e!624357))))

(assert (=> b!1093473 (= res!729683 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23778))))

(declare-fun b!1093474 () Bool)

(declare-fun e!624359 () Bool)

(declare-fun e!624361 () Bool)

(assert (=> b!1093474 (= e!624359 (and e!624361 mapRes!42115))))

(declare-fun condMapEmpty!42115 () Bool)

(declare-fun mapDefault!42115 () ValueCell!12744)

(assert (=> b!1093474 (= condMapEmpty!42115 (= (arr!34039 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12744)) mapDefault!42115)))))

(declare-fun mapIsEmpty!42115 () Bool)

(assert (=> mapIsEmpty!42115 mapRes!42115))

(declare-fun res!729678 () Bool)

(assert (=> start!96252 (=> (not res!729678) (not e!624357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96252 (= res!729678 (validMask!0 mask!1414))))

(assert (=> start!96252 e!624357))

(assert (=> start!96252 tp!80564))

(assert (=> start!96252 true))

(declare-fun tp_is_empty!26907 () Bool)

(assert (=> start!96252 tp_is_empty!26907))

(declare-fun array_inv!26232 (array!70733) Bool)

(assert (=> start!96252 (array_inv!26232 _keys!1070)))

(declare-fun array_inv!26233 (array!70731) Bool)

(assert (=> start!96252 (and (array_inv!26233 _values!874) e!624359)))

(declare-fun b!1093475 () Bool)

(declare-fun res!729681 () Bool)

(assert (=> b!1093475 (=> (not res!729681) (not e!624357))))

(assert (=> b!1093475 (= res!729681 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34576 _keys!1070))))))

(declare-fun b!1093476 () Bool)

(assert (=> b!1093476 (= e!624362 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41003)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17188 0))(
  ( (tuple2!17189 (_1!8605 (_ BitVec 64)) (_2!8605 V!41003)) )
))
(declare-datatypes ((List!23782 0))(
  ( (Nil!23779) (Cons!23778 (h!24987 tuple2!17188) (t!33745 List!23782)) )
))
(declare-datatypes ((ListLongMap!15157 0))(
  ( (ListLongMap!15158 (toList!7594 List!23782)) )
))
(declare-fun lt!489022 () ListLongMap!15157)

(declare-fun zeroValue!831 () V!41003)

(declare-fun getCurrentListMap!4350 (array!70733 array!70731 (_ BitVec 32) (_ BitVec 32) V!41003 V!41003 (_ BitVec 32) Int) ListLongMap!15157)

(assert (=> b!1093476 (= lt!489022 (getCurrentListMap!4350 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489021 () array!70731)

(declare-fun lt!489019 () ListLongMap!15157)

(assert (=> b!1093476 (= lt!489019 (getCurrentListMap!4350 lt!489018 lt!489021 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489017 () ListLongMap!15157)

(declare-fun lt!489024 () ListLongMap!15157)

(assert (=> b!1093476 (and (= lt!489017 lt!489024) (= lt!489024 lt!489017))))

(declare-fun lt!489020 () ListLongMap!15157)

(declare-fun -!913 (ListLongMap!15157 (_ BitVec 64)) ListLongMap!15157)

(assert (=> b!1093476 (= lt!489024 (-!913 lt!489020 k0!904))))

(declare-datatypes ((Unit!35992 0))(
  ( (Unit!35993) )
))
(declare-fun lt!489025 () Unit!35992)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!169 (array!70733 array!70731 (_ BitVec 32) (_ BitVec 32) V!41003 V!41003 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35992)

(assert (=> b!1093476 (= lt!489025 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4110 (array!70733 array!70731 (_ BitVec 32) (_ BitVec 32) V!41003 V!41003 (_ BitVec 32) Int) ListLongMap!15157)

(assert (=> b!1093476 (= lt!489017 (getCurrentListMapNoExtraKeys!4110 lt!489018 lt!489021 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2247 (Int (_ BitVec 64)) V!41003)

(assert (=> b!1093476 (= lt!489021 (array!70732 (store (arr!34039 _values!874) i!650 (ValueCellFull!12744 (dynLambda!2247 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34575 _values!874)))))

(assert (=> b!1093476 (= lt!489020 (getCurrentListMapNoExtraKeys!4110 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093476 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489023 () Unit!35992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70733 (_ BitVec 64) (_ BitVec 32)) Unit!35992)

(assert (=> b!1093476 (= lt!489023 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093477 () Bool)

(declare-fun res!729680 () Bool)

(assert (=> b!1093477 (=> (not res!729680) (not e!624357))))

(assert (=> b!1093477 (= res!729680 (and (= (size!34575 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34576 _keys!1070) (size!34575 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093478 () Bool)

(declare-fun res!729679 () Bool)

(assert (=> b!1093478 (=> (not res!729679) (not e!624357))))

(assert (=> b!1093478 (= res!729679 (= (select (arr!34040 _keys!1070) i!650) k0!904))))

(declare-fun b!1093479 () Bool)

(assert (=> b!1093479 (= e!624358 tp_is_empty!26907)))

(declare-fun b!1093480 () Bool)

(assert (=> b!1093480 (= e!624361 tp_is_empty!26907)))

(assert (= (and start!96252 res!729678) b!1093477))

(assert (= (and b!1093477 res!729680) b!1093471))

(assert (= (and b!1093471 res!729684) b!1093473))

(assert (= (and b!1093473 res!729683) b!1093475))

(assert (= (and b!1093475 res!729681) b!1093472))

(assert (= (and b!1093472 res!729682) b!1093478))

(assert (= (and b!1093478 res!729679) b!1093470))

(assert (= (and b!1093470 res!729677) b!1093469))

(assert (= (and b!1093469 res!729676) b!1093476))

(assert (= (and b!1093474 condMapEmpty!42115) mapIsEmpty!42115))

(assert (= (and b!1093474 (not condMapEmpty!42115)) mapNonEmpty!42115))

(get-info :version)

(assert (= (and mapNonEmpty!42115 ((_ is ValueCellFull!12744) mapValue!42115)) b!1093479))

(assert (= (and b!1093474 ((_ is ValueCellFull!12744) mapDefault!42115)) b!1093480))

(assert (= start!96252 b!1093474))

(declare-fun b_lambda!17575 () Bool)

(assert (=> (not b_lambda!17575) (not b!1093476)))

(declare-fun t!33743 () Bool)

(declare-fun tb!7783 () Bool)

(assert (=> (and start!96252 (= defaultEntry!882 defaultEntry!882) t!33743) tb!7783))

(declare-fun result!16085 () Bool)

(assert (=> tb!7783 (= result!16085 tp_is_empty!26907)))

(assert (=> b!1093476 t!33743))

(declare-fun b_and!36487 () Bool)

(assert (= b_and!36485 (and (=> t!33743 result!16085) b_and!36487)))

(declare-fun m!1013341 () Bool)

(assert (=> b!1093470 m!1013341))

(declare-fun m!1013343 () Bool)

(assert (=> b!1093470 m!1013343))

(declare-fun m!1013345 () Bool)

(assert (=> b!1093478 m!1013345))

(declare-fun m!1013347 () Bool)

(assert (=> start!96252 m!1013347))

(declare-fun m!1013349 () Bool)

(assert (=> start!96252 m!1013349))

(declare-fun m!1013351 () Bool)

(assert (=> start!96252 m!1013351))

(declare-fun m!1013353 () Bool)

(assert (=> b!1093473 m!1013353))

(declare-fun m!1013355 () Bool)

(assert (=> b!1093472 m!1013355))

(declare-fun m!1013357 () Bool)

(assert (=> b!1093476 m!1013357))

(declare-fun m!1013359 () Bool)

(assert (=> b!1093476 m!1013359))

(declare-fun m!1013361 () Bool)

(assert (=> b!1093476 m!1013361))

(declare-fun m!1013363 () Bool)

(assert (=> b!1093476 m!1013363))

(declare-fun m!1013365 () Bool)

(assert (=> b!1093476 m!1013365))

(declare-fun m!1013367 () Bool)

(assert (=> b!1093476 m!1013367))

(declare-fun m!1013369 () Bool)

(assert (=> b!1093476 m!1013369))

(declare-fun m!1013371 () Bool)

(assert (=> b!1093476 m!1013371))

(declare-fun m!1013373 () Bool)

(assert (=> b!1093476 m!1013373))

(declare-fun m!1013375 () Bool)

(assert (=> b!1093476 m!1013375))

(declare-fun m!1013377 () Bool)

(assert (=> mapNonEmpty!42115 m!1013377))

(declare-fun m!1013379 () Bool)

(assert (=> b!1093471 m!1013379))

(declare-fun m!1013381 () Bool)

(assert (=> b!1093469 m!1013381))

(check-sat (not start!96252) (not b!1093476) (not b!1093473) (not b_next!22905) (not b!1093472) (not mapNonEmpty!42115) tp_is_empty!26907 b_and!36487 (not b!1093470) (not b!1093471) (not b!1093469) (not b_lambda!17575))
(check-sat b_and!36487 (not b_next!22905))
