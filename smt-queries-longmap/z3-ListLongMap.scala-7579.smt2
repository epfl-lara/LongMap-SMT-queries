; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95796 () Bool)

(assert start!95796)

(declare-fun b_free!22449 () Bool)

(declare-fun b_next!22449 () Bool)

(assert (=> start!95796 (= b_free!22449 (not b_next!22449))))

(declare-fun tp!79196 () Bool)

(declare-fun b_and!35573 () Bool)

(assert (=> start!95796 (= tp!79196 b_and!35573)))

(declare-fun res!722458 () Bool)

(declare-fun e!619219 () Bool)

(assert (=> start!95796 (=> (not res!722458) (not e!619219))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95796 (= res!722458 (validMask!0 mask!1414))))

(assert (=> start!95796 e!619219))

(assert (=> start!95796 tp!79196))

(assert (=> start!95796 true))

(declare-fun tp_is_empty!26451 () Bool)

(assert (=> start!95796 tp_is_empty!26451))

(declare-datatypes ((array!69845 0))(
  ( (array!69846 (arr!33596 (Array (_ BitVec 32) (_ BitVec 64))) (size!34132 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69845)

(declare-fun array_inv!25930 (array!69845) Bool)

(assert (=> start!95796 (array_inv!25930 _keys!1070)))

(declare-datatypes ((V!40395 0))(
  ( (V!40396 (val!13282 Int)) )
))
(declare-datatypes ((ValueCell!12516 0))(
  ( (ValueCellFull!12516 (v!15903 V!40395)) (EmptyCell!12516) )
))
(declare-datatypes ((array!69847 0))(
  ( (array!69848 (arr!33597 (Array (_ BitVec 32) ValueCell!12516)) (size!34133 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69847)

(declare-fun e!619218 () Bool)

(declare-fun array_inv!25931 (array!69847) Bool)

(assert (=> start!95796 (and (array_inv!25931 _values!874) e!619218)))

(declare-fun b!1083743 () Bool)

(declare-fun res!722461 () Bool)

(assert (=> b!1083743 (=> (not res!722461) (not e!619219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69845 (_ BitVec 32)) Bool)

(assert (=> b!1083743 (= res!722461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41431 () Bool)

(declare-fun mapRes!41431 () Bool)

(assert (=> mapIsEmpty!41431 mapRes!41431))

(declare-fun b!1083744 () Bool)

(declare-fun e!619221 () Bool)

(assert (=> b!1083744 (= e!619219 e!619221)))

(declare-fun res!722465 () Bool)

(assert (=> b!1083744 (=> (not res!722465) (not e!619221))))

(declare-fun lt!480247 () array!69845)

(assert (=> b!1083744 (= res!722465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480247 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083744 (= lt!480247 (array!69846 (store (arr!33596 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34132 _keys!1070)))))

(declare-fun b!1083745 () Bool)

(declare-fun res!722459 () Bool)

(assert (=> b!1083745 (=> (not res!722459) (not e!619219))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083745 (= res!722459 (validKeyInArray!0 k0!904))))

(declare-fun b!1083746 () Bool)

(declare-fun res!722462 () Bool)

(assert (=> b!1083746 (=> (not res!722462) (not e!619219))))

(declare-datatypes ((List!23421 0))(
  ( (Nil!23418) (Cons!23417 (h!24626 (_ BitVec 64)) (t!32928 List!23421)) )
))
(declare-fun arrayNoDuplicates!0 (array!69845 (_ BitVec 32) List!23421) Bool)

(assert (=> b!1083746 (= res!722462 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23418))))

(declare-fun b!1083747 () Bool)

(declare-fun e!619223 () Bool)

(assert (=> b!1083747 (= e!619218 (and e!619223 mapRes!41431))))

(declare-fun condMapEmpty!41431 () Bool)

(declare-fun mapDefault!41431 () ValueCell!12516)

(assert (=> b!1083747 (= condMapEmpty!41431 (= (arr!33597 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12516)) mapDefault!41431)))))

(declare-fun b!1083748 () Bool)

(declare-fun res!722463 () Bool)

(assert (=> b!1083748 (=> (not res!722463) (not e!619221))))

(assert (=> b!1083748 (= res!722463 (arrayNoDuplicates!0 lt!480247 #b00000000000000000000000000000000 Nil!23418))))

(declare-fun b!1083749 () Bool)

(declare-fun res!722464 () Bool)

(assert (=> b!1083749 (=> (not res!722464) (not e!619219))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1083749 (= res!722464 (and (= (size!34133 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34132 _keys!1070) (size!34133 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083750 () Bool)

(declare-fun res!722460 () Bool)

(assert (=> b!1083750 (=> (not res!722460) (not e!619219))))

(assert (=> b!1083750 (= res!722460 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34132 _keys!1070))))))

(declare-fun b!1083751 () Bool)

(assert (=> b!1083751 (= e!619223 tp_is_empty!26451)))

(declare-fun b!1083752 () Bool)

(declare-fun e!619220 () Bool)

(assert (=> b!1083752 (= e!619220 tp_is_empty!26451)))

(declare-fun b!1083753 () Bool)

(declare-fun res!722466 () Bool)

(assert (=> b!1083753 (=> (not res!722466) (not e!619219))))

(assert (=> b!1083753 (= res!722466 (= (select (arr!33596 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41431 () Bool)

(declare-fun tp!79195 () Bool)

(assert (=> mapNonEmpty!41431 (= mapRes!41431 (and tp!79195 e!619220))))

(declare-fun mapValue!41431 () ValueCell!12516)

(declare-fun mapKey!41431 () (_ BitVec 32))

(declare-fun mapRest!41431 () (Array (_ BitVec 32) ValueCell!12516))

(assert (=> mapNonEmpty!41431 (= (arr!33597 _values!874) (store mapRest!41431 mapKey!41431 mapValue!41431))))

(declare-fun b!1083754 () Bool)

(assert (=> b!1083754 (= e!619221 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40395)

(declare-fun lt!480250 () array!69847)

(declare-datatypes ((tuple2!16834 0))(
  ( (tuple2!16835 (_1!8428 (_ BitVec 64)) (_2!8428 V!40395)) )
))
(declare-datatypes ((List!23422 0))(
  ( (Nil!23419) (Cons!23418 (h!24627 tuple2!16834) (t!32929 List!23422)) )
))
(declare-datatypes ((ListLongMap!14803 0))(
  ( (ListLongMap!14804 (toList!7417 List!23422)) )
))
(declare-fun lt!480248 () ListLongMap!14803)

(declare-fun zeroValue!831 () V!40395)

(declare-fun getCurrentListMap!4205 (array!69845 array!69847 (_ BitVec 32) (_ BitVec 32) V!40395 V!40395 (_ BitVec 32) Int) ListLongMap!14803)

(assert (=> b!1083754 (= lt!480248 (getCurrentListMap!4205 lt!480247 lt!480250 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480252 () ListLongMap!14803)

(declare-fun lt!480253 () ListLongMap!14803)

(assert (=> b!1083754 (and (= lt!480252 lt!480253) (= lt!480253 lt!480252))))

(declare-fun lt!480249 () ListLongMap!14803)

(declare-fun -!744 (ListLongMap!14803 (_ BitVec 64)) ListLongMap!14803)

(assert (=> b!1083754 (= lt!480253 (-!744 lt!480249 k0!904))))

(declare-datatypes ((Unit!35654 0))(
  ( (Unit!35655) )
))
(declare-fun lt!480246 () Unit!35654)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!24 (array!69845 array!69847 (_ BitVec 32) (_ BitVec 32) V!40395 V!40395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35654)

(assert (=> b!1083754 (= lt!480246 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!24 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3965 (array!69845 array!69847 (_ BitVec 32) (_ BitVec 32) V!40395 V!40395 (_ BitVec 32) Int) ListLongMap!14803)

(assert (=> b!1083754 (= lt!480252 (getCurrentListMapNoExtraKeys!3965 lt!480247 lt!480250 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2102 (Int (_ BitVec 64)) V!40395)

(assert (=> b!1083754 (= lt!480250 (array!69848 (store (arr!33597 _values!874) i!650 (ValueCellFull!12516 (dynLambda!2102 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34133 _values!874)))))

(assert (=> b!1083754 (= lt!480249 (getCurrentListMapNoExtraKeys!3965 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083754 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480251 () Unit!35654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69845 (_ BitVec 64) (_ BitVec 32)) Unit!35654)

(assert (=> b!1083754 (= lt!480251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95796 res!722458) b!1083749))

(assert (= (and b!1083749 res!722464) b!1083743))

(assert (= (and b!1083743 res!722461) b!1083746))

(assert (= (and b!1083746 res!722462) b!1083750))

(assert (= (and b!1083750 res!722460) b!1083745))

(assert (= (and b!1083745 res!722459) b!1083753))

(assert (= (and b!1083753 res!722466) b!1083744))

(assert (= (and b!1083744 res!722465) b!1083748))

(assert (= (and b!1083748 res!722463) b!1083754))

(assert (= (and b!1083747 condMapEmpty!41431) mapIsEmpty!41431))

(assert (= (and b!1083747 (not condMapEmpty!41431)) mapNonEmpty!41431))

(get-info :version)

(assert (= (and mapNonEmpty!41431 ((_ is ValueCellFull!12516) mapValue!41431)) b!1083752))

(assert (= (and b!1083747 ((_ is ValueCellFull!12516) mapDefault!41431)) b!1083751))

(assert (= start!95796 b!1083747))

(declare-fun b_lambda!17119 () Bool)

(assert (=> (not b_lambda!17119) (not b!1083754)))

(declare-fun t!32927 () Bool)

(declare-fun tb!7327 () Bool)

(assert (=> (and start!95796 (= defaultEntry!882 defaultEntry!882) t!32927) tb!7327))

(declare-fun result!15173 () Bool)

(assert (=> tb!7327 (= result!15173 tp_is_empty!26451)))

(assert (=> b!1083754 t!32927))

(declare-fun b_and!35575 () Bool)

(assert (= b_and!35573 (and (=> t!32927 result!15173) b_and!35575)))

(declare-fun m!1001423 () Bool)

(assert (=> b!1083744 m!1001423))

(declare-fun m!1001425 () Bool)

(assert (=> b!1083744 m!1001425))

(declare-fun m!1001427 () Bool)

(assert (=> b!1083745 m!1001427))

(declare-fun m!1001429 () Bool)

(assert (=> b!1083743 m!1001429))

(declare-fun m!1001431 () Bool)

(assert (=> b!1083748 m!1001431))

(declare-fun m!1001433 () Bool)

(assert (=> b!1083754 m!1001433))

(declare-fun m!1001435 () Bool)

(assert (=> b!1083754 m!1001435))

(declare-fun m!1001437 () Bool)

(assert (=> b!1083754 m!1001437))

(declare-fun m!1001439 () Bool)

(assert (=> b!1083754 m!1001439))

(declare-fun m!1001441 () Bool)

(assert (=> b!1083754 m!1001441))

(declare-fun m!1001443 () Bool)

(assert (=> b!1083754 m!1001443))

(declare-fun m!1001445 () Bool)

(assert (=> b!1083754 m!1001445))

(declare-fun m!1001447 () Bool)

(assert (=> b!1083754 m!1001447))

(declare-fun m!1001449 () Bool)

(assert (=> b!1083754 m!1001449))

(declare-fun m!1001451 () Bool)

(assert (=> b!1083746 m!1001451))

(declare-fun m!1001453 () Bool)

(assert (=> b!1083753 m!1001453))

(declare-fun m!1001455 () Bool)

(assert (=> start!95796 m!1001455))

(declare-fun m!1001457 () Bool)

(assert (=> start!95796 m!1001457))

(declare-fun m!1001459 () Bool)

(assert (=> start!95796 m!1001459))

(declare-fun m!1001461 () Bool)

(assert (=> mapNonEmpty!41431 m!1001461))

(check-sat b_and!35575 (not b_next!22449) (not b!1083744) tp_is_empty!26451 (not b!1083754) (not b!1083743) (not b!1083745) (not b_lambda!17119) (not mapNonEmpty!41431) (not b!1083748) (not b!1083746) (not start!95796))
(check-sat b_and!35575 (not b_next!22449))
