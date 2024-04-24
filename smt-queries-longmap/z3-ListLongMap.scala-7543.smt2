; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95814 () Bool)

(assert start!95814)

(declare-fun b!1081000 () Bool)

(declare-fun e!618114 () Bool)

(declare-fun e!618111 () Bool)

(declare-fun mapRes!41104 () Bool)

(assert (=> b!1081000 (= e!618114 (and e!618111 mapRes!41104))))

(declare-fun condMapEmpty!41104 () Bool)

(declare-datatypes ((V!40105 0))(
  ( (V!40106 (val!13173 Int)) )
))
(declare-datatypes ((ValueCell!12407 0))(
  ( (ValueCellFull!12407 (v!15790 V!40105)) (EmptyCell!12407) )
))
(declare-datatypes ((array!69455 0))(
  ( (array!69456 (arr!33395 (Array (_ BitVec 32) ValueCell!12407)) (size!33932 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69455)

(declare-fun mapDefault!41104 () ValueCell!12407)

(assert (=> b!1081000 (= condMapEmpty!41104 (= (arr!33395 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12407)) mapDefault!41104)))))

(declare-fun res!720039 () Bool)

(declare-fun e!618116 () Bool)

(assert (=> start!95814 (=> (not res!720039) (not e!618116))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95814 (= res!720039 (validMask!0 mask!1414))))

(assert (=> start!95814 e!618116))

(assert (=> start!95814 true))

(declare-datatypes ((array!69457 0))(
  ( (array!69458 (arr!33396 (Array (_ BitVec 32) (_ BitVec 64))) (size!33933 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69457)

(declare-fun array_inv!25824 (array!69457) Bool)

(assert (=> start!95814 (array_inv!25824 _keys!1070)))

(declare-fun array_inv!25825 (array!69455) Bool)

(assert (=> start!95814 (and (array_inv!25825 _values!874) e!618114)))

(declare-fun b!1081001 () Bool)

(declare-fun res!720041 () Bool)

(assert (=> b!1081001 (=> (not res!720041) (not e!618116))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081001 (= res!720041 (and (= (size!33932 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33933 _keys!1070) (size!33932 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41104 () Bool)

(declare-fun tp!78566 () Bool)

(declare-fun e!618112 () Bool)

(assert (=> mapNonEmpty!41104 (= mapRes!41104 (and tp!78566 e!618112))))

(declare-fun mapValue!41104 () ValueCell!12407)

(declare-fun mapRest!41104 () (Array (_ BitVec 32) ValueCell!12407))

(declare-fun mapKey!41104 () (_ BitVec 32))

(assert (=> mapNonEmpty!41104 (= (arr!33395 _values!874) (store mapRest!41104 mapKey!41104 mapValue!41104))))

(declare-fun b!1081002 () Bool)

(declare-fun e!618113 () Bool)

(assert (=> b!1081002 (= e!618116 e!618113)))

(declare-fun res!720037 () Bool)

(assert (=> b!1081002 (=> (not res!720037) (not e!618113))))

(declare-fun lt!479367 () array!69457)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69457 (_ BitVec 32)) Bool)

(assert (=> b!1081002 (= res!720037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479367 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081002 (= lt!479367 (array!69458 (store (arr!33396 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33933 _keys!1070)))))

(declare-fun b!1081003 () Bool)

(declare-fun res!720043 () Bool)

(assert (=> b!1081003 (=> (not res!720043) (not e!618113))))

(declare-datatypes ((List!23272 0))(
  ( (Nil!23269) (Cons!23268 (h!24486 (_ BitVec 64)) (t!32623 List!23272)) )
))
(declare-fun arrayNoDuplicates!0 (array!69457 (_ BitVec 32) List!23272) Bool)

(assert (=> b!1081003 (= res!720043 (arrayNoDuplicates!0 lt!479367 #b00000000000000000000000000000000 Nil!23269))))

(declare-fun b!1081004 () Bool)

(declare-fun res!720045 () Bool)

(assert (=> b!1081004 (=> (not res!720045) (not e!618116))))

(assert (=> b!1081004 (= res!720045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081005 () Bool)

(declare-fun res!720044 () Bool)

(assert (=> b!1081005 (=> (not res!720044) (not e!618116))))

(assert (=> b!1081005 (= res!720044 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23269))))

(declare-fun b!1081006 () Bool)

(declare-fun tp_is_empty!26233 () Bool)

(assert (=> b!1081006 (= e!618112 tp_is_empty!26233)))

(declare-fun b!1081007 () Bool)

(assert (=> b!1081007 (= e!618111 tp_is_empty!26233)))

(declare-fun b!1081008 () Bool)

(assert (=> b!1081008 (= e!618113 (not true))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081008 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35475 0))(
  ( (Unit!35476) )
))
(declare-fun lt!479366 () Unit!35475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69457 (_ BitVec 64) (_ BitVec 32)) Unit!35475)

(assert (=> b!1081008 (= lt!479366 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081009 () Bool)

(declare-fun res!720040 () Bool)

(assert (=> b!1081009 (=> (not res!720040) (not e!618116))))

(assert (=> b!1081009 (= res!720040 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33933 _keys!1070))))))

(declare-fun b!1081010 () Bool)

(declare-fun res!720038 () Bool)

(assert (=> b!1081010 (=> (not res!720038) (not e!618116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081010 (= res!720038 (validKeyInArray!0 k0!904))))

(declare-fun b!1081011 () Bool)

(declare-fun res!720042 () Bool)

(assert (=> b!1081011 (=> (not res!720042) (not e!618116))))

(assert (=> b!1081011 (= res!720042 (= (select (arr!33396 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41104 () Bool)

(assert (=> mapIsEmpty!41104 mapRes!41104))

(assert (= (and start!95814 res!720039) b!1081001))

(assert (= (and b!1081001 res!720041) b!1081004))

(assert (= (and b!1081004 res!720045) b!1081005))

(assert (= (and b!1081005 res!720044) b!1081009))

(assert (= (and b!1081009 res!720040) b!1081010))

(assert (= (and b!1081010 res!720038) b!1081011))

(assert (= (and b!1081011 res!720042) b!1081002))

(assert (= (and b!1081002 res!720037) b!1081003))

(assert (= (and b!1081003 res!720043) b!1081008))

(assert (= (and b!1081000 condMapEmpty!41104) mapIsEmpty!41104))

(assert (= (and b!1081000 (not condMapEmpty!41104)) mapNonEmpty!41104))

(get-info :version)

(assert (= (and mapNonEmpty!41104 ((_ is ValueCellFull!12407) mapValue!41104)) b!1081006))

(assert (= (and b!1081000 ((_ is ValueCellFull!12407) mapDefault!41104)) b!1081007))

(assert (= start!95814 b!1081000))

(declare-fun m!999491 () Bool)

(assert (=> b!1081005 m!999491))

(declare-fun m!999493 () Bool)

(assert (=> b!1081002 m!999493))

(declare-fun m!999495 () Bool)

(assert (=> b!1081002 m!999495))

(declare-fun m!999497 () Bool)

(assert (=> b!1081003 m!999497))

(declare-fun m!999499 () Bool)

(assert (=> b!1081008 m!999499))

(declare-fun m!999501 () Bool)

(assert (=> b!1081008 m!999501))

(declare-fun m!999503 () Bool)

(assert (=> b!1081011 m!999503))

(declare-fun m!999505 () Bool)

(assert (=> start!95814 m!999505))

(declare-fun m!999507 () Bool)

(assert (=> start!95814 m!999507))

(declare-fun m!999509 () Bool)

(assert (=> start!95814 m!999509))

(declare-fun m!999511 () Bool)

(assert (=> mapNonEmpty!41104 m!999511))

(declare-fun m!999513 () Bool)

(assert (=> b!1081004 m!999513))

(declare-fun m!999515 () Bool)

(assert (=> b!1081010 m!999515))

(check-sat (not b!1081004) (not b!1081008) (not b!1081010) tp_is_empty!26233 (not b!1081003) (not b!1081002) (not b!1081005) (not mapNonEmpty!41104) (not start!95814))
(check-sat)
