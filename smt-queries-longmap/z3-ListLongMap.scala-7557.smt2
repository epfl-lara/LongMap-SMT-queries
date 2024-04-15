; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95656 () Bool)

(assert start!95656)

(declare-fun b_free!22315 () Bool)

(declare-fun b_next!22315 () Bool)

(assert (=> start!95656 (= b_free!22315 (not b_next!22315))))

(declare-fun tp!78793 () Bool)

(declare-fun b_and!35279 () Bool)

(assert (=> start!95656 (= tp!78793 b_and!35279)))

(declare-fun b!1081044 () Bool)

(declare-fun res!720584 () Bool)

(declare-fun e!617920 () Bool)

(assert (=> b!1081044 (=> (not res!720584) (not e!617920))))

(declare-datatypes ((array!69514 0))(
  ( (array!69515 (arr!33431 (Array (_ BitVec 32) (_ BitVec 64))) (size!33969 (_ BitVec 32))) )
))
(declare-fun lt!479027 () array!69514)

(declare-datatypes ((List!23368 0))(
  ( (Nil!23365) (Cons!23364 (h!24573 (_ BitVec 64)) (t!32732 List!23368)) )
))
(declare-fun arrayNoDuplicates!0 (array!69514 (_ BitVec 32) List!23368) Bool)

(assert (=> b!1081044 (= res!720584 (arrayNoDuplicates!0 lt!479027 #b00000000000000000000000000000000 Nil!23365))))

(declare-fun b!1081045 () Bool)

(declare-fun res!720586 () Bool)

(declare-fun e!617924 () Bool)

(assert (=> b!1081045 (=> (not res!720586) (not e!617924))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69514)

(declare-datatypes ((V!40217 0))(
  ( (V!40218 (val!13215 Int)) )
))
(declare-datatypes ((ValueCell!12449 0))(
  ( (ValueCellFull!12449 (v!15835 V!40217)) (EmptyCell!12449) )
))
(declare-datatypes ((array!69516 0))(
  ( (array!69517 (arr!33432 (Array (_ BitVec 32) ValueCell!12449)) (size!33970 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69516)

(assert (=> b!1081045 (= res!720586 (and (= (size!33970 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33969 _keys!1070) (size!33970 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41230 () Bool)

(declare-fun mapRes!41230 () Bool)

(declare-fun tp!78794 () Bool)

(declare-fun e!617921 () Bool)

(assert (=> mapNonEmpty!41230 (= mapRes!41230 (and tp!78794 e!617921))))

(declare-fun mapRest!41230 () (Array (_ BitVec 32) ValueCell!12449))

(declare-fun mapValue!41230 () ValueCell!12449)

(declare-fun mapKey!41230 () (_ BitVec 32))

(assert (=> mapNonEmpty!41230 (= (arr!33432 _values!874) (store mapRest!41230 mapKey!41230 mapValue!41230))))

(declare-fun b!1081046 () Bool)

(declare-fun res!720583 () Bool)

(assert (=> b!1081046 (=> (not res!720583) (not e!617924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69514 (_ BitVec 32)) Bool)

(assert (=> b!1081046 (= res!720583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081047 () Bool)

(declare-fun tp_is_empty!26317 () Bool)

(assert (=> b!1081047 (= e!617921 tp_is_empty!26317)))

(declare-fun b!1081048 () Bool)

(declare-fun res!720580 () Bool)

(assert (=> b!1081048 (=> (not res!720580) (not e!617924))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081048 (= res!720580 (validKeyInArray!0 k0!904))))

(declare-fun b!1081049 () Bool)

(declare-fun res!720581 () Bool)

(assert (=> b!1081049 (=> (not res!720581) (not e!617924))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081049 (= res!720581 (= (select (arr!33431 _keys!1070) i!650) k0!904))))

(declare-fun b!1081050 () Bool)

(assert (=> b!1081050 (= e!617920 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40217)

(declare-fun zeroValue!831 () V!40217)

(declare-datatypes ((tuple2!16806 0))(
  ( (tuple2!16807 (_1!8414 (_ BitVec 64)) (_2!8414 V!40217)) )
))
(declare-datatypes ((List!23369 0))(
  ( (Nil!23366) (Cons!23365 (h!24574 tuple2!16806) (t!32733 List!23369)) )
))
(declare-datatypes ((ListLongMap!14775 0))(
  ( (ListLongMap!14776 (toList!7403 List!23369)) )
))
(declare-fun lt!479026 () ListLongMap!14775)

(declare-fun getCurrentListMapNoExtraKeys!3966 (array!69514 array!69516 (_ BitVec 32) (_ BitVec 32) V!40217 V!40217 (_ BitVec 32) Int) ListLongMap!14775)

(declare-fun dynLambda!2037 (Int (_ BitVec 64)) V!40217)

(assert (=> b!1081050 (= lt!479026 (getCurrentListMapNoExtraKeys!3966 lt!479027 (array!69517 (store (arr!33432 _values!874) i!650 (ValueCellFull!12449 (dynLambda!2037 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33970 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479025 () ListLongMap!14775)

(assert (=> b!1081050 (= lt!479025 (getCurrentListMapNoExtraKeys!3966 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081050 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35399 0))(
  ( (Unit!35400) )
))
(declare-fun lt!479024 () Unit!35399)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69514 (_ BitVec 64) (_ BitVec 32)) Unit!35399)

(assert (=> b!1081050 (= lt!479024 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081051 () Bool)

(declare-fun res!720588 () Bool)

(assert (=> b!1081051 (=> (not res!720588) (not e!617924))))

(assert (=> b!1081051 (= res!720588 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33969 _keys!1070))))))

(declare-fun b!1081052 () Bool)

(declare-fun e!617923 () Bool)

(assert (=> b!1081052 (= e!617923 tp_is_empty!26317)))

(declare-fun b!1081053 () Bool)

(declare-fun e!617919 () Bool)

(assert (=> b!1081053 (= e!617919 (and e!617923 mapRes!41230))))

(declare-fun condMapEmpty!41230 () Bool)

(declare-fun mapDefault!41230 () ValueCell!12449)

(assert (=> b!1081053 (= condMapEmpty!41230 (= (arr!33432 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12449)) mapDefault!41230)))))

(declare-fun b!1081054 () Bool)

(declare-fun res!720582 () Bool)

(assert (=> b!1081054 (=> (not res!720582) (not e!617924))))

(assert (=> b!1081054 (= res!720582 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23365))))

(declare-fun res!720585 () Bool)

(assert (=> start!95656 (=> (not res!720585) (not e!617924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95656 (= res!720585 (validMask!0 mask!1414))))

(assert (=> start!95656 e!617924))

(assert (=> start!95656 tp!78793))

(assert (=> start!95656 true))

(assert (=> start!95656 tp_is_empty!26317))

(declare-fun array_inv!25842 (array!69514) Bool)

(assert (=> start!95656 (array_inv!25842 _keys!1070)))

(declare-fun array_inv!25843 (array!69516) Bool)

(assert (=> start!95656 (and (array_inv!25843 _values!874) e!617919)))

(declare-fun b!1081055 () Bool)

(assert (=> b!1081055 (= e!617924 e!617920)))

(declare-fun res!720587 () Bool)

(assert (=> b!1081055 (=> (not res!720587) (not e!617920))))

(assert (=> b!1081055 (= res!720587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479027 mask!1414))))

(assert (=> b!1081055 (= lt!479027 (array!69515 (store (arr!33431 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33969 _keys!1070)))))

(declare-fun mapIsEmpty!41230 () Bool)

(assert (=> mapIsEmpty!41230 mapRes!41230))

(assert (= (and start!95656 res!720585) b!1081045))

(assert (= (and b!1081045 res!720586) b!1081046))

(assert (= (and b!1081046 res!720583) b!1081054))

(assert (= (and b!1081054 res!720582) b!1081051))

(assert (= (and b!1081051 res!720588) b!1081048))

(assert (= (and b!1081048 res!720580) b!1081049))

(assert (= (and b!1081049 res!720581) b!1081055))

(assert (= (and b!1081055 res!720587) b!1081044))

(assert (= (and b!1081044 res!720584) b!1081050))

(assert (= (and b!1081053 condMapEmpty!41230) mapIsEmpty!41230))

(assert (= (and b!1081053 (not condMapEmpty!41230)) mapNonEmpty!41230))

(get-info :version)

(assert (= (and mapNonEmpty!41230 ((_ is ValueCellFull!12449) mapValue!41230)) b!1081047))

(assert (= (and b!1081053 ((_ is ValueCellFull!12449) mapDefault!41230)) b!1081052))

(assert (= start!95656 b!1081053))

(declare-fun b_lambda!16963 () Bool)

(assert (=> (not b_lambda!16963) (not b!1081050)))

(declare-fun t!32731 () Bool)

(declare-fun tb!7185 () Bool)

(assert (=> (and start!95656 (= defaultEntry!882 defaultEntry!882) t!32731) tb!7185))

(declare-fun result!14897 () Bool)

(assert (=> tb!7185 (= result!14897 tp_is_empty!26317)))

(assert (=> b!1081050 t!32731))

(declare-fun b_and!35281 () Bool)

(assert (= b_and!35279 (and (=> t!32731 result!14897) b_and!35281)))

(declare-fun m!998387 () Bool)

(assert (=> b!1081055 m!998387))

(declare-fun m!998389 () Bool)

(assert (=> b!1081055 m!998389))

(declare-fun m!998391 () Bool)

(assert (=> b!1081050 m!998391))

(declare-fun m!998393 () Bool)

(assert (=> b!1081050 m!998393))

(declare-fun m!998395 () Bool)

(assert (=> b!1081050 m!998395))

(declare-fun m!998397 () Bool)

(assert (=> b!1081050 m!998397))

(declare-fun m!998399 () Bool)

(assert (=> b!1081050 m!998399))

(declare-fun m!998401 () Bool)

(assert (=> b!1081050 m!998401))

(declare-fun m!998403 () Bool)

(assert (=> start!95656 m!998403))

(declare-fun m!998405 () Bool)

(assert (=> start!95656 m!998405))

(declare-fun m!998407 () Bool)

(assert (=> start!95656 m!998407))

(declare-fun m!998409 () Bool)

(assert (=> b!1081044 m!998409))

(declare-fun m!998411 () Bool)

(assert (=> b!1081046 m!998411))

(declare-fun m!998413 () Bool)

(assert (=> mapNonEmpty!41230 m!998413))

(declare-fun m!998415 () Bool)

(assert (=> b!1081048 m!998415))

(declare-fun m!998417 () Bool)

(assert (=> b!1081054 m!998417))

(declare-fun m!998419 () Bool)

(assert (=> b!1081049 m!998419))

(check-sat (not start!95656) tp_is_empty!26317 (not b!1081055) (not b!1081044) (not b_next!22315) (not b!1081048) (not mapNonEmpty!41230) b_and!35281 (not b!1081054) (not b!1081046) (not b_lambda!16963) (not b!1081050))
(check-sat b_and!35281 (not b_next!22315))
