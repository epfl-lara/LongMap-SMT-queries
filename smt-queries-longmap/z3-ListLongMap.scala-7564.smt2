; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95940 () Bool)

(assert start!95940)

(declare-fun b_free!22357 () Bool)

(declare-fun b_next!22357 () Bool)

(assert (=> start!95940 (= b_free!22357 (not b_next!22357))))

(declare-fun tp!78919 () Bool)

(declare-fun b_and!35399 () Bool)

(assert (=> start!95940 (= tp!78919 b_and!35399)))

(declare-fun b!1083322 () Bool)

(declare-fun res!721743 () Bool)

(declare-fun e!619247 () Bool)

(assert (=> b!1083322 (=> (not res!721743) (not e!619247))))

(declare-datatypes ((array!69701 0))(
  ( (array!69702 (arr!33518 (Array (_ BitVec 32) (_ BitVec 64))) (size!34055 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69701)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083322 (= res!721743 (= (select (arr!33518 _keys!1070) i!650) k0!904))))

(declare-fun b!1083324 () Bool)

(declare-fun e!619250 () Bool)

(assert (=> b!1083324 (= e!619247 e!619250)))

(declare-fun res!721741 () Bool)

(assert (=> b!1083324 (=> (not res!721741) (not e!619250))))

(declare-fun lt!479993 () array!69701)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69701 (_ BitVec 32)) Bool)

(assert (=> b!1083324 (= res!721741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479993 mask!1414))))

(assert (=> b!1083324 (= lt!479993 (array!69702 (store (arr!33518 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34055 _keys!1070)))))

(declare-fun b!1083325 () Bool)

(declare-fun res!721738 () Bool)

(assert (=> b!1083325 (=> (not res!721738) (not e!619247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083325 (= res!721738 (validKeyInArray!0 k0!904))))

(declare-fun b!1083326 () Bool)

(declare-fun res!721746 () Bool)

(assert (=> b!1083326 (=> (not res!721746) (not e!619250))))

(declare-datatypes ((List!23363 0))(
  ( (Nil!23360) (Cons!23359 (h!24577 (_ BitVec 64)) (t!32770 List!23363)) )
))
(declare-fun arrayNoDuplicates!0 (array!69701 (_ BitVec 32) List!23363) Bool)

(assert (=> b!1083326 (= res!721746 (arrayNoDuplicates!0 lt!479993 #b00000000000000000000000000000000 Nil!23360))))

(declare-fun b!1083327 () Bool)

(assert (=> b!1083327 (= e!619250 (not true))))

(declare-datatypes ((V!40273 0))(
  ( (V!40274 (val!13236 Int)) )
))
(declare-datatypes ((ValueCell!12470 0))(
  ( (ValueCellFull!12470 (v!15853 V!40273)) (EmptyCell!12470) )
))
(declare-datatypes ((array!69703 0))(
  ( (array!69704 (arr!33519 (Array (_ BitVec 32) ValueCell!12470)) (size!34056 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69703)

(declare-fun minValue!831 () V!40273)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40273)

(declare-datatypes ((tuple2!16774 0))(
  ( (tuple2!16775 (_1!8398 (_ BitVec 64)) (_2!8398 V!40273)) )
))
(declare-datatypes ((List!23364 0))(
  ( (Nil!23361) (Cons!23360 (h!24578 tuple2!16774) (t!32771 List!23364)) )
))
(declare-datatypes ((ListLongMap!14751 0))(
  ( (ListLongMap!14752 (toList!7391 List!23364)) )
))
(declare-fun lt!479991 () ListLongMap!14751)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3968 (array!69701 array!69703 (_ BitVec 32) (_ BitVec 32) V!40273 V!40273 (_ BitVec 32) Int) ListLongMap!14751)

(declare-fun dynLambda!2089 (Int (_ BitVec 64)) V!40273)

(assert (=> b!1083327 (= lt!479991 (getCurrentListMapNoExtraKeys!3968 lt!479993 (array!69704 (store (arr!33519 _values!874) i!650 (ValueCellFull!12470 (dynLambda!2089 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34056 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479992 () ListLongMap!14751)

(assert (=> b!1083327 (= lt!479992 (getCurrentListMapNoExtraKeys!3968 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083327 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35573 0))(
  ( (Unit!35574) )
))
(declare-fun lt!479994 () Unit!35573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69701 (_ BitVec 64) (_ BitVec 32)) Unit!35573)

(assert (=> b!1083327 (= lt!479994 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083328 () Bool)

(declare-fun res!721744 () Bool)

(assert (=> b!1083328 (=> (not res!721744) (not e!619247))))

(assert (=> b!1083328 (= res!721744 (and (= (size!34056 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34055 _keys!1070) (size!34056 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083329 () Bool)

(declare-fun e!619245 () Bool)

(declare-fun tp_is_empty!26359 () Bool)

(assert (=> b!1083329 (= e!619245 tp_is_empty!26359)))

(declare-fun mapIsEmpty!41293 () Bool)

(declare-fun mapRes!41293 () Bool)

(assert (=> mapIsEmpty!41293 mapRes!41293))

(declare-fun b!1083330 () Bool)

(declare-fun e!619246 () Bool)

(assert (=> b!1083330 (= e!619246 (and e!619245 mapRes!41293))))

(declare-fun condMapEmpty!41293 () Bool)

(declare-fun mapDefault!41293 () ValueCell!12470)

(assert (=> b!1083330 (= condMapEmpty!41293 (= (arr!33519 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12470)) mapDefault!41293)))))

(declare-fun b!1083331 () Bool)

(declare-fun res!721740 () Bool)

(assert (=> b!1083331 (=> (not res!721740) (not e!619247))))

(assert (=> b!1083331 (= res!721740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41293 () Bool)

(declare-fun tp!78920 () Bool)

(declare-fun e!619249 () Bool)

(assert (=> mapNonEmpty!41293 (= mapRes!41293 (and tp!78920 e!619249))))

(declare-fun mapRest!41293 () (Array (_ BitVec 32) ValueCell!12470))

(declare-fun mapKey!41293 () (_ BitVec 32))

(declare-fun mapValue!41293 () ValueCell!12470)

(assert (=> mapNonEmpty!41293 (= (arr!33519 _values!874) (store mapRest!41293 mapKey!41293 mapValue!41293))))

(declare-fun b!1083332 () Bool)

(declare-fun res!721739 () Bool)

(assert (=> b!1083332 (=> (not res!721739) (not e!619247))))

(assert (=> b!1083332 (= res!721739 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23360))))

(declare-fun b!1083333 () Bool)

(assert (=> b!1083333 (= e!619249 tp_is_empty!26359)))

(declare-fun res!721742 () Bool)

(assert (=> start!95940 (=> (not res!721742) (not e!619247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95940 (= res!721742 (validMask!0 mask!1414))))

(assert (=> start!95940 e!619247))

(assert (=> start!95940 tp!78919))

(assert (=> start!95940 true))

(assert (=> start!95940 tp_is_empty!26359))

(declare-fun array_inv!25914 (array!69701) Bool)

(assert (=> start!95940 (array_inv!25914 _keys!1070)))

(declare-fun array_inv!25915 (array!69703) Bool)

(assert (=> start!95940 (and (array_inv!25915 _values!874) e!619246)))

(declare-fun b!1083323 () Bool)

(declare-fun res!721745 () Bool)

(assert (=> b!1083323 (=> (not res!721745) (not e!619247))))

(assert (=> b!1083323 (= res!721745 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34055 _keys!1070))))))

(assert (= (and start!95940 res!721742) b!1083328))

(assert (= (and b!1083328 res!721744) b!1083331))

(assert (= (and b!1083331 res!721740) b!1083332))

(assert (= (and b!1083332 res!721739) b!1083323))

(assert (= (and b!1083323 res!721745) b!1083325))

(assert (= (and b!1083325 res!721738) b!1083322))

(assert (= (and b!1083322 res!721743) b!1083324))

(assert (= (and b!1083324 res!721741) b!1083326))

(assert (= (and b!1083326 res!721746) b!1083327))

(assert (= (and b!1083330 condMapEmpty!41293) mapIsEmpty!41293))

(assert (= (and b!1083330 (not condMapEmpty!41293)) mapNonEmpty!41293))

(get-info :version)

(assert (= (and mapNonEmpty!41293 ((_ is ValueCellFull!12470) mapValue!41293)) b!1083333))

(assert (= (and b!1083330 ((_ is ValueCellFull!12470) mapDefault!41293)) b!1083329))

(assert (= start!95940 b!1083330))

(declare-fun b_lambda!17037 () Bool)

(assert (=> (not b_lambda!17037) (not b!1083327)))

(declare-fun t!32769 () Bool)

(declare-fun tb!7227 () Bool)

(assert (=> (and start!95940 (= defaultEntry!882 defaultEntry!882) t!32769) tb!7227))

(declare-fun result!14981 () Bool)

(assert (=> tb!7227 (= result!14981 tp_is_empty!26359)))

(assert (=> b!1083327 t!32769))

(declare-fun b_and!35401 () Bool)

(assert (= b_and!35399 (and (=> t!32769 result!14981) b_and!35401)))

(declare-fun m!1001399 () Bool)

(assert (=> b!1083322 m!1001399))

(declare-fun m!1001401 () Bool)

(assert (=> start!95940 m!1001401))

(declare-fun m!1001403 () Bool)

(assert (=> start!95940 m!1001403))

(declare-fun m!1001405 () Bool)

(assert (=> start!95940 m!1001405))

(declare-fun m!1001407 () Bool)

(assert (=> b!1083325 m!1001407))

(declare-fun m!1001409 () Bool)

(assert (=> b!1083324 m!1001409))

(declare-fun m!1001411 () Bool)

(assert (=> b!1083324 m!1001411))

(declare-fun m!1001413 () Bool)

(assert (=> b!1083332 m!1001413))

(declare-fun m!1001415 () Bool)

(assert (=> b!1083326 m!1001415))

(declare-fun m!1001417 () Bool)

(assert (=> b!1083327 m!1001417))

(declare-fun m!1001419 () Bool)

(assert (=> b!1083327 m!1001419))

(declare-fun m!1001421 () Bool)

(assert (=> b!1083327 m!1001421))

(declare-fun m!1001423 () Bool)

(assert (=> b!1083327 m!1001423))

(declare-fun m!1001425 () Bool)

(assert (=> b!1083327 m!1001425))

(declare-fun m!1001427 () Bool)

(assert (=> b!1083327 m!1001427))

(declare-fun m!1001429 () Bool)

(assert (=> b!1083331 m!1001429))

(declare-fun m!1001431 () Bool)

(assert (=> mapNonEmpty!41293 m!1001431))

(check-sat (not b!1083331) (not b_next!22357) tp_is_empty!26359 b_and!35401 (not start!95940) (not b_lambda!17037) (not mapNonEmpty!41293) (not b!1083325) (not b!1083326) (not b!1083327) (not b!1083332) (not b!1083324))
(check-sat b_and!35401 (not b_next!22357))
