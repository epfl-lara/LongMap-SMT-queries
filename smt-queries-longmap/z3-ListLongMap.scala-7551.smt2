; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95628 () Bool)

(assert start!95628)

(declare-fun b_free!22281 () Bool)

(declare-fun b_next!22281 () Bool)

(assert (=> start!95628 (= b_free!22281 (not b_next!22281))))

(declare-fun tp!78691 () Bool)

(declare-fun b_and!35259 () Bool)

(assert (=> start!95628 (= tp!78691 b_and!35259)))

(declare-fun b!1080573 () Bool)

(declare-fun res!720198 () Bool)

(declare-fun e!617709 () Bool)

(assert (=> b!1080573 (=> (not res!720198) (not e!617709))))

(declare-datatypes ((array!69517 0))(
  ( (array!69518 (arr!33432 (Array (_ BitVec 32) (_ BitVec 64))) (size!33968 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69517)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080573 (= res!720198 (= (select (arr!33432 _keys!1070) i!650) k0!904))))

(declare-fun b!1080574 () Bool)

(declare-fun res!720191 () Bool)

(assert (=> b!1080574 (=> (not res!720191) (not e!617709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080574 (= res!720191 (validKeyInArray!0 k0!904))))

(declare-fun res!720195 () Bool)

(assert (=> start!95628 (=> (not res!720195) (not e!617709))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95628 (= res!720195 (validMask!0 mask!1414))))

(assert (=> start!95628 e!617709))

(assert (=> start!95628 tp!78691))

(assert (=> start!95628 true))

(declare-fun tp_is_empty!26283 () Bool)

(assert (=> start!95628 tp_is_empty!26283))

(declare-fun array_inv!25812 (array!69517) Bool)

(assert (=> start!95628 (array_inv!25812 _keys!1070)))

(declare-datatypes ((V!40171 0))(
  ( (V!40172 (val!13198 Int)) )
))
(declare-datatypes ((ValueCell!12432 0))(
  ( (ValueCellFull!12432 (v!15819 V!40171)) (EmptyCell!12432) )
))
(declare-datatypes ((array!69519 0))(
  ( (array!69520 (arr!33433 (Array (_ BitVec 32) ValueCell!12432)) (size!33969 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69519)

(declare-fun e!617707 () Bool)

(declare-fun array_inv!25813 (array!69519) Bool)

(assert (=> start!95628 (and (array_inv!25813 _values!874) e!617707)))

(declare-fun mapNonEmpty!41179 () Bool)

(declare-fun mapRes!41179 () Bool)

(declare-fun tp!78692 () Bool)

(declare-fun e!617710 () Bool)

(assert (=> mapNonEmpty!41179 (= mapRes!41179 (and tp!78692 e!617710))))

(declare-fun mapValue!41179 () ValueCell!12432)

(declare-fun mapKey!41179 () (_ BitVec 32))

(declare-fun mapRest!41179 () (Array (_ BitVec 32) ValueCell!12432))

(assert (=> mapNonEmpty!41179 (= (arr!33433 _values!874) (store mapRest!41179 mapKey!41179 mapValue!41179))))

(declare-fun mapIsEmpty!41179 () Bool)

(assert (=> mapIsEmpty!41179 mapRes!41179))

(declare-fun b!1080575 () Bool)

(declare-fun res!720192 () Bool)

(assert (=> b!1080575 (=> (not res!720192) (not e!617709))))

(assert (=> b!1080575 (= res!720192 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33968 _keys!1070))))))

(declare-fun b!1080576 () Bool)

(declare-fun res!720193 () Bool)

(assert (=> b!1080576 (=> (not res!720193) (not e!617709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69517 (_ BitVec 32)) Bool)

(assert (=> b!1080576 (= res!720193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080577 () Bool)

(declare-fun e!617711 () Bool)

(assert (=> b!1080577 (= e!617711 tp_is_empty!26283)))

(declare-fun b!1080578 () Bool)

(declare-fun res!720194 () Bool)

(declare-fun e!617708 () Bool)

(assert (=> b!1080578 (=> (not res!720194) (not e!617708))))

(declare-fun lt!479051 () array!69517)

(declare-datatypes ((List!23297 0))(
  ( (Nil!23294) (Cons!23293 (h!24502 (_ BitVec 64)) (t!32656 List!23297)) )
))
(declare-fun arrayNoDuplicates!0 (array!69517 (_ BitVec 32) List!23297) Bool)

(assert (=> b!1080578 (= res!720194 (arrayNoDuplicates!0 lt!479051 #b00000000000000000000000000000000 Nil!23294))))

(declare-fun b!1080579 () Bool)

(assert (=> b!1080579 (= e!617709 e!617708)))

(declare-fun res!720197 () Bool)

(assert (=> b!1080579 (=> (not res!720197) (not e!617708))))

(assert (=> b!1080579 (= res!720197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479051 mask!1414))))

(assert (=> b!1080579 (= lt!479051 (array!69518 (store (arr!33432 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33968 _keys!1070)))))

(declare-fun b!1080580 () Bool)

(declare-fun res!720196 () Bool)

(assert (=> b!1080580 (=> (not res!720196) (not e!617709))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080580 (= res!720196 (and (= (size!33969 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33968 _keys!1070) (size!33969 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080581 () Bool)

(assert (=> b!1080581 (= e!617710 tp_is_empty!26283)))

(declare-fun b!1080582 () Bool)

(declare-fun res!720190 () Bool)

(assert (=> b!1080582 (=> (not res!720190) (not e!617709))))

(assert (=> b!1080582 (= res!720190 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23294))))

(declare-fun b!1080583 () Bool)

(assert (=> b!1080583 (= e!617708 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40171)

(declare-datatypes ((tuple2!16716 0))(
  ( (tuple2!16717 (_1!8369 (_ BitVec 64)) (_2!8369 V!40171)) )
))
(declare-datatypes ((List!23298 0))(
  ( (Nil!23295) (Cons!23294 (h!24503 tuple2!16716) (t!32657 List!23298)) )
))
(declare-datatypes ((ListLongMap!14685 0))(
  ( (ListLongMap!14686 (toList!7358 List!23298)) )
))
(declare-fun lt!479052 () ListLongMap!14685)

(declare-fun zeroValue!831 () V!40171)

(declare-fun getCurrentListMapNoExtraKeys!3906 (array!69517 array!69519 (_ BitVec 32) (_ BitVec 32) V!40171 V!40171 (_ BitVec 32) Int) ListLongMap!14685)

(assert (=> b!1080583 (= lt!479052 (getCurrentListMapNoExtraKeys!3906 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080583 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35536 0))(
  ( (Unit!35537) )
))
(declare-fun lt!479053 () Unit!35536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69517 (_ BitVec 64) (_ BitVec 32)) Unit!35536)

(assert (=> b!1080583 (= lt!479053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080584 () Bool)

(assert (=> b!1080584 (= e!617707 (and e!617711 mapRes!41179))))

(declare-fun condMapEmpty!41179 () Bool)

(declare-fun mapDefault!41179 () ValueCell!12432)

(assert (=> b!1080584 (= condMapEmpty!41179 (= (arr!33433 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12432)) mapDefault!41179)))))

(assert (= (and start!95628 res!720195) b!1080580))

(assert (= (and b!1080580 res!720196) b!1080576))

(assert (= (and b!1080576 res!720193) b!1080582))

(assert (= (and b!1080582 res!720190) b!1080575))

(assert (= (and b!1080575 res!720192) b!1080574))

(assert (= (and b!1080574 res!720191) b!1080573))

(assert (= (and b!1080573 res!720198) b!1080579))

(assert (= (and b!1080579 res!720197) b!1080578))

(assert (= (and b!1080578 res!720194) b!1080583))

(assert (= (and b!1080584 condMapEmpty!41179) mapIsEmpty!41179))

(assert (= (and b!1080584 (not condMapEmpty!41179)) mapNonEmpty!41179))

(get-info :version)

(assert (= (and mapNonEmpty!41179 ((_ is ValueCellFull!12432) mapValue!41179)) b!1080581))

(assert (= (and b!1080584 ((_ is ValueCellFull!12432) mapDefault!41179)) b!1080577))

(assert (= start!95628 b!1080584))

(declare-fun m!998501 () Bool)

(assert (=> b!1080576 m!998501))

(declare-fun m!998503 () Bool)

(assert (=> b!1080579 m!998503))

(declare-fun m!998505 () Bool)

(assert (=> b!1080579 m!998505))

(declare-fun m!998507 () Bool)

(assert (=> start!95628 m!998507))

(declare-fun m!998509 () Bool)

(assert (=> start!95628 m!998509))

(declare-fun m!998511 () Bool)

(assert (=> start!95628 m!998511))

(declare-fun m!998513 () Bool)

(assert (=> b!1080582 m!998513))

(declare-fun m!998515 () Bool)

(assert (=> b!1080574 m!998515))

(declare-fun m!998517 () Bool)

(assert (=> mapNonEmpty!41179 m!998517))

(declare-fun m!998519 () Bool)

(assert (=> b!1080583 m!998519))

(declare-fun m!998521 () Bool)

(assert (=> b!1080583 m!998521))

(declare-fun m!998523 () Bool)

(assert (=> b!1080583 m!998523))

(declare-fun m!998525 () Bool)

(assert (=> b!1080573 m!998525))

(declare-fun m!998527 () Bool)

(assert (=> b!1080578 m!998527))

(check-sat b_and!35259 (not b!1080582) (not b!1080576) (not b!1080579) tp_is_empty!26283 (not b_next!22281) (not b!1080583) (not start!95628) (not b!1080574) (not b!1080578) (not mapNonEmpty!41179))
(check-sat b_and!35259 (not b_next!22281))
