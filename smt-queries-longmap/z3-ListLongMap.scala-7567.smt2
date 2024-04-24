; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95958 () Bool)

(assert start!95958)

(declare-fun b_free!22375 () Bool)

(declare-fun b_next!22375 () Bool)

(assert (=> start!95958 (= b_free!22375 (not b_next!22375))))

(declare-fun tp!78974 () Bool)

(declare-fun b_and!35435 () Bool)

(assert (=> start!95958 (= tp!78974 b_and!35435)))

(declare-fun b!1083664 () Bool)

(declare-fun e!619408 () Bool)

(declare-fun tp_is_empty!26377 () Bool)

(assert (=> b!1083664 (= e!619408 tp_is_empty!26377)))

(declare-fun b!1083665 () Bool)

(declare-fun e!619410 () Bool)

(declare-fun e!619407 () Bool)

(assert (=> b!1083665 (= e!619410 e!619407)))

(declare-fun res!721989 () Bool)

(assert (=> b!1083665 (=> (not res!721989) (not e!619407))))

(declare-datatypes ((array!69737 0))(
  ( (array!69738 (arr!33536 (Array (_ BitVec 32) (_ BitVec 64))) (size!34073 (_ BitVec 32))) )
))
(declare-fun lt!480102 () array!69737)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69737 (_ BitVec 32)) Bool)

(assert (=> b!1083665 (= res!721989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480102 mask!1414))))

(declare-fun _keys!1070 () array!69737)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083665 (= lt!480102 (array!69738 (store (arr!33536 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34073 _keys!1070)))))

(declare-fun mapIsEmpty!41320 () Bool)

(declare-fun mapRes!41320 () Bool)

(assert (=> mapIsEmpty!41320 mapRes!41320))

(declare-fun b!1083666 () Bool)

(declare-fun e!619412 () Bool)

(assert (=> b!1083666 (= e!619412 (and e!619408 mapRes!41320))))

(declare-fun condMapEmpty!41320 () Bool)

(declare-datatypes ((V!40297 0))(
  ( (V!40298 (val!13245 Int)) )
))
(declare-datatypes ((ValueCell!12479 0))(
  ( (ValueCellFull!12479 (v!15862 V!40297)) (EmptyCell!12479) )
))
(declare-datatypes ((array!69739 0))(
  ( (array!69740 (arr!33537 (Array (_ BitVec 32) ValueCell!12479)) (size!34074 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69739)

(declare-fun mapDefault!41320 () ValueCell!12479)

(assert (=> b!1083666 (= condMapEmpty!41320 (= (arr!33537 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12479)) mapDefault!41320)))))

(declare-fun res!721981 () Bool)

(assert (=> start!95958 (=> (not res!721981) (not e!619410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95958 (= res!721981 (validMask!0 mask!1414))))

(assert (=> start!95958 e!619410))

(assert (=> start!95958 tp!78974))

(assert (=> start!95958 true))

(assert (=> start!95958 tp_is_empty!26377))

(declare-fun array_inv!25932 (array!69737) Bool)

(assert (=> start!95958 (array_inv!25932 _keys!1070)))

(declare-fun array_inv!25933 (array!69739) Bool)

(assert (=> start!95958 (and (array_inv!25933 _values!874) e!619412)))

(declare-fun b!1083667 () Bool)

(declare-fun e!619411 () Bool)

(assert (=> b!1083667 (= e!619411 tp_is_empty!26377)))

(declare-fun b!1083668 () Bool)

(declare-fun res!721985 () Bool)

(assert (=> b!1083668 (=> (not res!721985) (not e!619410))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083668 (= res!721985 (validKeyInArray!0 k0!904))))

(declare-fun b!1083669 () Bool)

(assert (=> b!1083669 (= e!619407 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40297)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16786 0))(
  ( (tuple2!16787 (_1!8404 (_ BitVec 64)) (_2!8404 V!40297)) )
))
(declare-datatypes ((List!23376 0))(
  ( (Nil!23373) (Cons!23372 (h!24590 tuple2!16786) (t!32801 List!23376)) )
))
(declare-datatypes ((ListLongMap!14763 0))(
  ( (ListLongMap!14764 (toList!7397 List!23376)) )
))
(declare-fun lt!480100 () ListLongMap!14763)

(declare-fun zeroValue!831 () V!40297)

(declare-fun getCurrentListMapNoExtraKeys!3974 (array!69737 array!69739 (_ BitVec 32) (_ BitVec 32) V!40297 V!40297 (_ BitVec 32) Int) ListLongMap!14763)

(declare-fun dynLambda!2095 (Int (_ BitVec 64)) V!40297)

(assert (=> b!1083669 (= lt!480100 (getCurrentListMapNoExtraKeys!3974 lt!480102 (array!69740 (store (arr!33537 _values!874) i!650 (ValueCellFull!12479 (dynLambda!2095 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34074 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480099 () ListLongMap!14763)

(assert (=> b!1083669 (= lt!480099 (getCurrentListMapNoExtraKeys!3974 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083669 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35585 0))(
  ( (Unit!35586) )
))
(declare-fun lt!480101 () Unit!35585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69737 (_ BitVec 64) (_ BitVec 32)) Unit!35585)

(assert (=> b!1083669 (= lt!480101 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41320 () Bool)

(declare-fun tp!78973 () Bool)

(assert (=> mapNonEmpty!41320 (= mapRes!41320 (and tp!78973 e!619411))))

(declare-fun mapRest!41320 () (Array (_ BitVec 32) ValueCell!12479))

(declare-fun mapKey!41320 () (_ BitVec 32))

(declare-fun mapValue!41320 () ValueCell!12479)

(assert (=> mapNonEmpty!41320 (= (arr!33537 _values!874) (store mapRest!41320 mapKey!41320 mapValue!41320))))

(declare-fun b!1083670 () Bool)

(declare-fun res!721984 () Bool)

(assert (=> b!1083670 (=> (not res!721984) (not e!619407))))

(declare-datatypes ((List!23377 0))(
  ( (Nil!23374) (Cons!23373 (h!24591 (_ BitVec 64)) (t!32802 List!23377)) )
))
(declare-fun arrayNoDuplicates!0 (array!69737 (_ BitVec 32) List!23377) Bool)

(assert (=> b!1083670 (= res!721984 (arrayNoDuplicates!0 lt!480102 #b00000000000000000000000000000000 Nil!23374))))

(declare-fun b!1083671 () Bool)

(declare-fun res!721982 () Bool)

(assert (=> b!1083671 (=> (not res!721982) (not e!619410))))

(assert (=> b!1083671 (= res!721982 (and (= (size!34074 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34073 _keys!1070) (size!34074 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083672 () Bool)

(declare-fun res!721988 () Bool)

(assert (=> b!1083672 (=> (not res!721988) (not e!619410))))

(assert (=> b!1083672 (= res!721988 (= (select (arr!33536 _keys!1070) i!650) k0!904))))

(declare-fun b!1083673 () Bool)

(declare-fun res!721987 () Bool)

(assert (=> b!1083673 (=> (not res!721987) (not e!619410))))

(assert (=> b!1083673 (= res!721987 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34073 _keys!1070))))))

(declare-fun b!1083674 () Bool)

(declare-fun res!721986 () Bool)

(assert (=> b!1083674 (=> (not res!721986) (not e!619410))))

(assert (=> b!1083674 (= res!721986 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23374))))

(declare-fun b!1083675 () Bool)

(declare-fun res!721983 () Bool)

(assert (=> b!1083675 (=> (not res!721983) (not e!619410))))

(assert (=> b!1083675 (= res!721983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95958 res!721981) b!1083671))

(assert (= (and b!1083671 res!721982) b!1083675))

(assert (= (and b!1083675 res!721983) b!1083674))

(assert (= (and b!1083674 res!721986) b!1083673))

(assert (= (and b!1083673 res!721987) b!1083668))

(assert (= (and b!1083668 res!721985) b!1083672))

(assert (= (and b!1083672 res!721988) b!1083665))

(assert (= (and b!1083665 res!721989) b!1083670))

(assert (= (and b!1083670 res!721984) b!1083669))

(assert (= (and b!1083666 condMapEmpty!41320) mapIsEmpty!41320))

(assert (= (and b!1083666 (not condMapEmpty!41320)) mapNonEmpty!41320))

(get-info :version)

(assert (= (and mapNonEmpty!41320 ((_ is ValueCellFull!12479) mapValue!41320)) b!1083667))

(assert (= (and b!1083666 ((_ is ValueCellFull!12479) mapDefault!41320)) b!1083664))

(assert (= start!95958 b!1083666))

(declare-fun b_lambda!17055 () Bool)

(assert (=> (not b_lambda!17055) (not b!1083669)))

(declare-fun t!32800 () Bool)

(declare-fun tb!7245 () Bool)

(assert (=> (and start!95958 (= defaultEntry!882 defaultEntry!882) t!32800) tb!7245))

(declare-fun result!15017 () Bool)

(assert (=> tb!7245 (= result!15017 tp_is_empty!26377)))

(assert (=> b!1083669 t!32800))

(declare-fun b_and!35437 () Bool)

(assert (= b_and!35435 (and (=> t!32800 result!15017) b_and!35437)))

(declare-fun m!1001705 () Bool)

(assert (=> start!95958 m!1001705))

(declare-fun m!1001707 () Bool)

(assert (=> start!95958 m!1001707))

(declare-fun m!1001709 () Bool)

(assert (=> start!95958 m!1001709))

(declare-fun m!1001711 () Bool)

(assert (=> mapNonEmpty!41320 m!1001711))

(declare-fun m!1001713 () Bool)

(assert (=> b!1083672 m!1001713))

(declare-fun m!1001715 () Bool)

(assert (=> b!1083674 m!1001715))

(declare-fun m!1001717 () Bool)

(assert (=> b!1083665 m!1001717))

(declare-fun m!1001719 () Bool)

(assert (=> b!1083665 m!1001719))

(declare-fun m!1001721 () Bool)

(assert (=> b!1083669 m!1001721))

(declare-fun m!1001723 () Bool)

(assert (=> b!1083669 m!1001723))

(declare-fun m!1001725 () Bool)

(assert (=> b!1083669 m!1001725))

(declare-fun m!1001727 () Bool)

(assert (=> b!1083669 m!1001727))

(declare-fun m!1001729 () Bool)

(assert (=> b!1083669 m!1001729))

(declare-fun m!1001731 () Bool)

(assert (=> b!1083669 m!1001731))

(declare-fun m!1001733 () Bool)

(assert (=> b!1083675 m!1001733))

(declare-fun m!1001735 () Bool)

(assert (=> b!1083670 m!1001735))

(declare-fun m!1001737 () Bool)

(assert (=> b!1083668 m!1001737))

(check-sat (not mapNonEmpty!41320) (not b_lambda!17055) (not b!1083675) tp_is_empty!26377 (not b!1083670) (not b_next!22375) (not b!1083665) b_and!35437 (not start!95958) (not b!1083674) (not b!1083669) (not b!1083668))
(check-sat b_and!35437 (not b_next!22375))
