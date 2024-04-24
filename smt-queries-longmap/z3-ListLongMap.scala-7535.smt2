; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95750 () Bool)

(assert start!95750)

(declare-fun b!1080086 () Bool)

(declare-fun e!617642 () Bool)

(declare-fun e!617644 () Bool)

(declare-fun mapRes!41029 () Bool)

(assert (=> b!1080086 (= e!617642 (and e!617644 mapRes!41029))))

(declare-fun condMapEmpty!41029 () Bool)

(declare-datatypes ((V!40041 0))(
  ( (V!40042 (val!13149 Int)) )
))
(declare-datatypes ((ValueCell!12383 0))(
  ( (ValueCellFull!12383 (v!15766 V!40041)) (EmptyCell!12383) )
))
(declare-datatypes ((array!69361 0))(
  ( (array!69362 (arr!33349 (Array (_ BitVec 32) ValueCell!12383)) (size!33886 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69361)

(declare-fun mapDefault!41029 () ValueCell!12383)

(assert (=> b!1080086 (= condMapEmpty!41029 (= (arr!33349 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12383)) mapDefault!41029)))))

(declare-fun b!1080087 () Bool)

(declare-fun res!719368 () Bool)

(declare-fun e!617639 () Bool)

(assert (=> b!1080087 (=> (not res!719368) (not e!617639))))

(declare-datatypes ((array!69363 0))(
  ( (array!69364 (arr!33350 (Array (_ BitVec 32) (_ BitVec 64))) (size!33887 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69363)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69363 (_ BitVec 32)) Bool)

(assert (=> b!1080087 (= res!719368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080088 () Bool)

(declare-fun res!719367 () Bool)

(assert (=> b!1080088 (=> (not res!719367) (not e!617639))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080088 (= res!719367 (validKeyInArray!0 k0!904))))

(declare-fun b!1080089 () Bool)

(declare-fun res!719369 () Bool)

(assert (=> b!1080089 (=> (not res!719369) (not e!617639))))

(declare-datatypes ((List!23256 0))(
  ( (Nil!23253) (Cons!23252 (h!24470 (_ BitVec 64)) (t!32607 List!23256)) )
))
(declare-fun arrayNoDuplicates!0 (array!69363 (_ BitVec 32) List!23256) Bool)

(assert (=> b!1080089 (= res!719369 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23253))))

(declare-fun b!1080090 () Bool)

(declare-fun e!617643 () Bool)

(declare-fun tp_is_empty!26185 () Bool)

(assert (=> b!1080090 (= e!617643 tp_is_empty!26185)))

(declare-fun b!1080092 () Bool)

(declare-fun res!719363 () Bool)

(declare-fun e!617641 () Bool)

(assert (=> b!1080092 (=> (not res!719363) (not e!617641))))

(declare-fun lt!479207 () array!69363)

(assert (=> b!1080092 (= res!719363 (arrayNoDuplicates!0 lt!479207 #b00000000000000000000000000000000 Nil!23253))))

(declare-fun b!1080093 () Bool)

(declare-fun res!719366 () Bool)

(assert (=> b!1080093 (=> (not res!719366) (not e!617639))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080093 (= res!719366 (and (= (size!33886 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33887 _keys!1070) (size!33886 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41029 () Bool)

(declare-fun tp!78491 () Bool)

(assert (=> mapNonEmpty!41029 (= mapRes!41029 (and tp!78491 e!617643))))

(declare-fun mapRest!41029 () (Array (_ BitVec 32) ValueCell!12383))

(declare-fun mapKey!41029 () (_ BitVec 32))

(declare-fun mapValue!41029 () ValueCell!12383)

(assert (=> mapNonEmpty!41029 (= (arr!33349 _values!874) (store mapRest!41029 mapKey!41029 mapValue!41029))))

(declare-fun mapIsEmpty!41029 () Bool)

(assert (=> mapIsEmpty!41029 mapRes!41029))

(declare-fun b!1080094 () Bool)

(assert (=> b!1080094 (= e!617641 (not (bvslt #b00000000000000000000000000000000 (size!33887 _keys!1070))))))

(declare-fun arrayContainsKey!0 (array!69363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080094 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35445 0))(
  ( (Unit!35446) )
))
(declare-fun lt!479208 () Unit!35445)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69363 (_ BitVec 64) (_ BitVec 32)) Unit!35445)

(assert (=> b!1080094 (= lt!479208 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080095 () Bool)

(declare-fun res!719371 () Bool)

(assert (=> b!1080095 (=> (not res!719371) (not e!617639))))

(assert (=> b!1080095 (= res!719371 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33887 _keys!1070))))))

(declare-fun b!1080091 () Bool)

(assert (=> b!1080091 (= e!617644 tp_is_empty!26185)))

(declare-fun res!719370 () Bool)

(assert (=> start!95750 (=> (not res!719370) (not e!617639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95750 (= res!719370 (validMask!0 mask!1414))))

(assert (=> start!95750 e!617639))

(assert (=> start!95750 true))

(declare-fun array_inv!25796 (array!69363) Bool)

(assert (=> start!95750 (array_inv!25796 _keys!1070)))

(declare-fun array_inv!25797 (array!69361) Bool)

(assert (=> start!95750 (and (array_inv!25797 _values!874) e!617642)))

(declare-fun b!1080096 () Bool)

(declare-fun res!719364 () Bool)

(assert (=> b!1080096 (=> (not res!719364) (not e!617639))))

(assert (=> b!1080096 (= res!719364 (= (select (arr!33350 _keys!1070) i!650) k0!904))))

(declare-fun b!1080097 () Bool)

(assert (=> b!1080097 (= e!617639 e!617641)))

(declare-fun res!719365 () Bool)

(assert (=> b!1080097 (=> (not res!719365) (not e!617641))))

(assert (=> b!1080097 (= res!719365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479207 mask!1414))))

(assert (=> b!1080097 (= lt!479207 (array!69364 (store (arr!33350 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33887 _keys!1070)))))

(assert (= (and start!95750 res!719370) b!1080093))

(assert (= (and b!1080093 res!719366) b!1080087))

(assert (= (and b!1080087 res!719368) b!1080089))

(assert (= (and b!1080089 res!719369) b!1080095))

(assert (= (and b!1080095 res!719371) b!1080088))

(assert (= (and b!1080088 res!719367) b!1080096))

(assert (= (and b!1080096 res!719364) b!1080097))

(assert (= (and b!1080097 res!719365) b!1080092))

(assert (= (and b!1080092 res!719363) b!1080094))

(assert (= (and b!1080086 condMapEmpty!41029) mapIsEmpty!41029))

(assert (= (and b!1080086 (not condMapEmpty!41029)) mapNonEmpty!41029))

(get-info :version)

(assert (= (and mapNonEmpty!41029 ((_ is ValueCellFull!12383) mapValue!41029)) b!1080090))

(assert (= (and b!1080086 ((_ is ValueCellFull!12383) mapDefault!41029)) b!1080091))

(assert (= start!95750 b!1080086))

(declare-fun m!998829 () Bool)

(assert (=> b!1080097 m!998829))

(declare-fun m!998831 () Bool)

(assert (=> b!1080097 m!998831))

(declare-fun m!998833 () Bool)

(assert (=> b!1080088 m!998833))

(declare-fun m!998835 () Bool)

(assert (=> b!1080092 m!998835))

(declare-fun m!998837 () Bool)

(assert (=> b!1080096 m!998837))

(declare-fun m!998839 () Bool)

(assert (=> mapNonEmpty!41029 m!998839))

(declare-fun m!998841 () Bool)

(assert (=> start!95750 m!998841))

(declare-fun m!998843 () Bool)

(assert (=> start!95750 m!998843))

(declare-fun m!998845 () Bool)

(assert (=> start!95750 m!998845))

(declare-fun m!998847 () Bool)

(assert (=> b!1080094 m!998847))

(declare-fun m!998849 () Bool)

(assert (=> b!1080094 m!998849))

(declare-fun m!998851 () Bool)

(assert (=> b!1080089 m!998851))

(declare-fun m!998853 () Bool)

(assert (=> b!1080087 m!998853))

(check-sat (not mapNonEmpty!41029) (not b!1080092) (not start!95750) (not b!1080094) (not b!1080097) (not b!1080089) (not b!1080088) tp_is_empty!26185 (not b!1080087))
(check-sat)
