; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95730 () Bool)

(assert start!95730)

(declare-fun b_free!22383 () Bool)

(declare-fun b_next!22383 () Bool)

(assert (=> start!95730 (= b_free!22383 (not b_next!22383))))

(declare-fun tp!78998 () Bool)

(declare-fun b_and!35441 () Bool)

(assert (=> start!95730 (= tp!78998 b_and!35441)))

(declare-fun b!1082489 () Bool)

(declare-fun res!721570 () Bool)

(declare-fun e!618625 () Bool)

(assert (=> b!1082489 (=> (not res!721570) (not e!618625))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082489 (= res!721570 (validKeyInArray!0 k0!904))))

(declare-fun b!1082490 () Bool)

(declare-fun res!721571 () Bool)

(assert (=> b!1082490 (=> (not res!721571) (not e!618625))))

(declare-datatypes ((array!69717 0))(
  ( (array!69718 (arr!33532 (Array (_ BitVec 32) (_ BitVec 64))) (size!34068 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69717)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69717 (_ BitVec 32)) Bool)

(assert (=> b!1082490 (= res!721571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082491 () Bool)

(declare-fun e!618628 () Bool)

(declare-fun tp_is_empty!26385 () Bool)

(assert (=> b!1082491 (= e!618628 tp_is_empty!26385)))

(declare-fun b!1082492 () Bool)

(declare-fun res!721574 () Bool)

(assert (=> b!1082492 (=> (not res!721574) (not e!618625))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40307 0))(
  ( (V!40308 (val!13249 Int)) )
))
(declare-datatypes ((ValueCell!12483 0))(
  ( (ValueCellFull!12483 (v!15870 V!40307)) (EmptyCell!12483) )
))
(declare-datatypes ((array!69719 0))(
  ( (array!69720 (arr!33533 (Array (_ BitVec 32) ValueCell!12483)) (size!34069 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69719)

(assert (=> b!1082492 (= res!721574 (and (= (size!34069 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34068 _keys!1070) (size!34069 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082493 () Bool)

(declare-fun res!721567 () Bool)

(assert (=> b!1082493 (=> (not res!721567) (not e!618625))))

(declare-datatypes ((List!23371 0))(
  ( (Nil!23368) (Cons!23367 (h!24576 (_ BitVec 64)) (t!32812 List!23371)) )
))
(declare-fun arrayNoDuplicates!0 (array!69717 (_ BitVec 32) List!23371) Bool)

(assert (=> b!1082493 (= res!721567 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23368))))

(declare-fun mapIsEmpty!41332 () Bool)

(declare-fun mapRes!41332 () Bool)

(assert (=> mapIsEmpty!41332 mapRes!41332))

(declare-fun b!1082494 () Bool)

(declare-fun res!721569 () Bool)

(assert (=> b!1082494 (=> (not res!721569) (not e!618625))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082494 (= res!721569 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34068 _keys!1070))))))

(declare-fun b!1082495 () Bool)

(declare-fun res!721568 () Bool)

(assert (=> b!1082495 (=> (not res!721568) (not e!618625))))

(assert (=> b!1082495 (= res!721568 (= (select (arr!33532 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41332 () Bool)

(declare-fun tp!78997 () Bool)

(assert (=> mapNonEmpty!41332 (= mapRes!41332 (and tp!78997 e!618628))))

(declare-fun mapRest!41332 () (Array (_ BitVec 32) ValueCell!12483))

(declare-fun mapKey!41332 () (_ BitVec 32))

(declare-fun mapValue!41332 () ValueCell!12483)

(assert (=> mapNonEmpty!41332 (= (arr!33533 _values!874) (store mapRest!41332 mapKey!41332 mapValue!41332))))

(declare-fun res!721572 () Bool)

(assert (=> start!95730 (=> (not res!721572) (not e!618625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95730 (= res!721572 (validMask!0 mask!1414))))

(assert (=> start!95730 e!618625))

(assert (=> start!95730 tp!78998))

(assert (=> start!95730 true))

(assert (=> start!95730 tp_is_empty!26385))

(declare-fun array_inv!25884 (array!69717) Bool)

(assert (=> start!95730 (array_inv!25884 _keys!1070)))

(declare-fun e!618627 () Bool)

(declare-fun array_inv!25885 (array!69719) Bool)

(assert (=> start!95730 (and (array_inv!25885 _values!874) e!618627)))

(declare-fun b!1082496 () Bool)

(declare-fun e!618624 () Bool)

(assert (=> b!1082496 (= e!618627 (and e!618624 mapRes!41332))))

(declare-fun condMapEmpty!41332 () Bool)

(declare-fun mapDefault!41332 () ValueCell!12483)

(assert (=> b!1082496 (= condMapEmpty!41332 (= (arr!33533 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12483)) mapDefault!41332)))))

(declare-fun b!1082497 () Bool)

(declare-fun e!618626 () Bool)

(assert (=> b!1082497 (= e!618626 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40307)

(declare-datatypes ((tuple2!16786 0))(
  ( (tuple2!16787 (_1!8404 (_ BitVec 64)) (_2!8404 V!40307)) )
))
(declare-datatypes ((List!23372 0))(
  ( (Nil!23369) (Cons!23368 (h!24577 tuple2!16786) (t!32813 List!23372)) )
))
(declare-datatypes ((ListLongMap!14755 0))(
  ( (ListLongMap!14756 (toList!7393 List!23372)) )
))
(declare-fun lt!479635 () ListLongMap!14755)

(declare-fun zeroValue!831 () V!40307)

(declare-fun lt!479632 () array!69717)

(declare-fun getCurrentListMapNoExtraKeys!3941 (array!69717 array!69719 (_ BitVec 32) (_ BitVec 32) V!40307 V!40307 (_ BitVec 32) Int) ListLongMap!14755)

(declare-fun dynLambda!2078 (Int (_ BitVec 64)) V!40307)

(assert (=> b!1082497 (= lt!479635 (getCurrentListMapNoExtraKeys!3941 lt!479632 (array!69720 (store (arr!33533 _values!874) i!650 (ValueCellFull!12483 (dynLambda!2078 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34069 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479634 () ListLongMap!14755)

(assert (=> b!1082497 (= lt!479634 (getCurrentListMapNoExtraKeys!3941 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082497 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35606 0))(
  ( (Unit!35607) )
))
(declare-fun lt!479633 () Unit!35606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69717 (_ BitVec 64) (_ BitVec 32)) Unit!35606)

(assert (=> b!1082497 (= lt!479633 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082498 () Bool)

(assert (=> b!1082498 (= e!618624 tp_is_empty!26385)))

(declare-fun b!1082499 () Bool)

(declare-fun res!721575 () Bool)

(assert (=> b!1082499 (=> (not res!721575) (not e!618626))))

(assert (=> b!1082499 (= res!721575 (arrayNoDuplicates!0 lt!479632 #b00000000000000000000000000000000 Nil!23368))))

(declare-fun b!1082500 () Bool)

(assert (=> b!1082500 (= e!618625 e!618626)))

(declare-fun res!721573 () Bool)

(assert (=> b!1082500 (=> (not res!721573) (not e!618626))))

(assert (=> b!1082500 (= res!721573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479632 mask!1414))))

(assert (=> b!1082500 (= lt!479632 (array!69718 (store (arr!33532 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34068 _keys!1070)))))

(assert (= (and start!95730 res!721572) b!1082492))

(assert (= (and b!1082492 res!721574) b!1082490))

(assert (= (and b!1082490 res!721571) b!1082493))

(assert (= (and b!1082493 res!721567) b!1082494))

(assert (= (and b!1082494 res!721569) b!1082489))

(assert (= (and b!1082489 res!721570) b!1082495))

(assert (= (and b!1082495 res!721568) b!1082500))

(assert (= (and b!1082500 res!721573) b!1082499))

(assert (= (and b!1082499 res!721575) b!1082497))

(assert (= (and b!1082496 condMapEmpty!41332) mapIsEmpty!41332))

(assert (= (and b!1082496 (not condMapEmpty!41332)) mapNonEmpty!41332))

(get-info :version)

(assert (= (and mapNonEmpty!41332 ((_ is ValueCellFull!12483) mapValue!41332)) b!1082491))

(assert (= (and b!1082496 ((_ is ValueCellFull!12483) mapDefault!41332)) b!1082498))

(assert (= start!95730 b!1082496))

(declare-fun b_lambda!17053 () Bool)

(assert (=> (not b_lambda!17053) (not b!1082497)))

(declare-fun t!32811 () Bool)

(declare-fun tb!7261 () Bool)

(assert (=> (and start!95730 (= defaultEntry!882 defaultEntry!882) t!32811) tb!7261))

(declare-fun result!15041 () Bool)

(assert (=> tb!7261 (= result!15041 tp_is_empty!26385)))

(assert (=> b!1082497 t!32811))

(declare-fun b_and!35443 () Bool)

(assert (= b_and!35441 (and (=> t!32811 result!15041) b_and!35443)))

(declare-fun m!1000169 () Bool)

(assert (=> mapNonEmpty!41332 m!1000169))

(declare-fun m!1000171 () Bool)

(assert (=> b!1082495 m!1000171))

(declare-fun m!1000173 () Bool)

(assert (=> b!1082493 m!1000173))

(declare-fun m!1000175 () Bool)

(assert (=> b!1082497 m!1000175))

(declare-fun m!1000177 () Bool)

(assert (=> b!1082497 m!1000177))

(declare-fun m!1000179 () Bool)

(assert (=> b!1082497 m!1000179))

(declare-fun m!1000181 () Bool)

(assert (=> b!1082497 m!1000181))

(declare-fun m!1000183 () Bool)

(assert (=> b!1082497 m!1000183))

(declare-fun m!1000185 () Bool)

(assert (=> b!1082497 m!1000185))

(declare-fun m!1000187 () Bool)

(assert (=> b!1082489 m!1000187))

(declare-fun m!1000189 () Bool)

(assert (=> b!1082490 m!1000189))

(declare-fun m!1000191 () Bool)

(assert (=> start!95730 m!1000191))

(declare-fun m!1000193 () Bool)

(assert (=> start!95730 m!1000193))

(declare-fun m!1000195 () Bool)

(assert (=> start!95730 m!1000195))

(declare-fun m!1000197 () Bool)

(assert (=> b!1082500 m!1000197))

(declare-fun m!1000199 () Bool)

(assert (=> b!1082500 m!1000199))

(declare-fun m!1000201 () Bool)

(assert (=> b!1082499 m!1000201))

(check-sat (not mapNonEmpty!41332) (not b!1082493) (not b!1082489) tp_is_empty!26385 (not b!1082497) (not b!1082500) b_and!35443 (not b_next!22383) (not start!95730) (not b_lambda!17053) (not b!1082490) (not b!1082499))
(check-sat b_and!35443 (not b_next!22383))
