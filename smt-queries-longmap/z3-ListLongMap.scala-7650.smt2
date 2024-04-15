; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96214 () Bool)

(assert start!96214)

(declare-fun b_free!22873 () Bool)

(declare-fun b_next!22873 () Bool)

(assert (=> start!96214 (= b_free!22873 (not b_next!22873))))

(declare-fun tp!80467 () Bool)

(declare-fun b_and!36395 () Bool)

(assert (=> start!96214 (= tp!80467 b_and!36395)))

(declare-fun b!1092708 () Bool)

(declare-fun e!623979 () Bool)

(assert (=> b!1092708 (= e!623979 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40961 0))(
  ( (V!40962 (val!13494 Int)) )
))
(declare-fun minValue!831 () V!40961)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40961)

(declare-datatypes ((array!70582 0))(
  ( (array!70583 (arr!33965 (Array (_ BitVec 32) (_ BitVec 64))) (size!34503 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70582)

(declare-datatypes ((ValueCell!12728 0))(
  ( (ValueCellFull!12728 (v!16114 V!40961)) (EmptyCell!12728) )
))
(declare-datatypes ((array!70584 0))(
  ( (array!70585 (arr!33966 (Array (_ BitVec 32) ValueCell!12728)) (size!34504 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70584)

(declare-datatypes ((tuple2!17222 0))(
  ( (tuple2!17223 (_1!8622 (_ BitVec 64)) (_2!8622 V!40961)) )
))
(declare-datatypes ((List!23788 0))(
  ( (Nil!23785) (Cons!23784 (h!24993 tuple2!17222) (t!33710 List!23788)) )
))
(declare-datatypes ((ListLongMap!15191 0))(
  ( (ListLongMap!15192 (toList!7611 List!23788)) )
))
(declare-fun lt!488376 () ListLongMap!15191)

(declare-fun getCurrentListMap!4274 (array!70582 array!70584 (_ BitVec 32) (_ BitVec 32) V!40961 V!40961 (_ BitVec 32) Int) ListLongMap!15191)

(assert (=> b!1092708 (= lt!488376 (getCurrentListMap!4274 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488383 () array!70584)

(declare-fun lt!488382 () ListLongMap!15191)

(declare-fun lt!488380 () array!70582)

(assert (=> b!1092708 (= lt!488382 (getCurrentListMap!4274 lt!488380 lt!488383 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488381 () ListLongMap!15191)

(declare-fun lt!488378 () ListLongMap!15191)

(assert (=> b!1092708 (and (= lt!488381 lt!488378) (= lt!488378 lt!488381))))

(declare-fun lt!488377 () ListLongMap!15191)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!883 (ListLongMap!15191 (_ BitVec 64)) ListLongMap!15191)

(assert (=> b!1092708 (= lt!488378 (-!883 lt!488377 k0!904))))

(declare-datatypes ((Unit!35801 0))(
  ( (Unit!35802) )
))
(declare-fun lt!488384 () Unit!35801)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!158 (array!70582 array!70584 (_ BitVec 32) (_ BitVec 32) V!40961 V!40961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35801)

(assert (=> b!1092708 (= lt!488384 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!158 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4144 (array!70582 array!70584 (_ BitVec 32) (_ BitVec 32) V!40961 V!40961 (_ BitVec 32) Int) ListLongMap!15191)

(assert (=> b!1092708 (= lt!488381 (getCurrentListMapNoExtraKeys!4144 lt!488380 lt!488383 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2215 (Int (_ BitVec 64)) V!40961)

(assert (=> b!1092708 (= lt!488383 (array!70585 (store (arr!33966 _values!874) i!650 (ValueCellFull!12728 (dynLambda!2215 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34504 _values!874)))))

(assert (=> b!1092708 (= lt!488377 (getCurrentListMapNoExtraKeys!4144 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092708 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488379 () Unit!35801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70582 (_ BitVec 64) (_ BitVec 32)) Unit!35801)

(assert (=> b!1092708 (= lt!488379 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092709 () Bool)

(declare-fun e!623976 () Bool)

(assert (=> b!1092709 (= e!623976 e!623979)))

(declare-fun res!729177 () Bool)

(assert (=> b!1092709 (=> (not res!729177) (not e!623979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70582 (_ BitVec 32)) Bool)

(assert (=> b!1092709 (= res!729177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488380 mask!1414))))

(assert (=> b!1092709 (= lt!488380 (array!70583 (store (arr!33965 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34503 _keys!1070)))))

(declare-fun b!1092710 () Bool)

(declare-fun e!623980 () Bool)

(declare-fun e!623978 () Bool)

(declare-fun mapRes!42067 () Bool)

(assert (=> b!1092710 (= e!623980 (and e!623978 mapRes!42067))))

(declare-fun condMapEmpty!42067 () Bool)

(declare-fun mapDefault!42067 () ValueCell!12728)

(assert (=> b!1092710 (= condMapEmpty!42067 (= (arr!33966 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12728)) mapDefault!42067)))))

(declare-fun b!1092711 () Bool)

(declare-fun tp_is_empty!26875 () Bool)

(assert (=> b!1092711 (= e!623978 tp_is_empty!26875)))

(declare-fun b!1092712 () Bool)

(declare-fun res!729176 () Bool)

(assert (=> b!1092712 (=> (not res!729176) (not e!623976))))

(assert (=> b!1092712 (= res!729176 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34503 _keys!1070))))))

(declare-fun b!1092713 () Bool)

(declare-fun e!623981 () Bool)

(assert (=> b!1092713 (= e!623981 tp_is_empty!26875)))

(declare-fun b!1092715 () Bool)

(declare-fun res!729182 () Bool)

(assert (=> b!1092715 (=> (not res!729182) (not e!623976))))

(assert (=> b!1092715 (= res!729182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092716 () Bool)

(declare-fun res!729180 () Bool)

(assert (=> b!1092716 (=> (not res!729180) (not e!623976))))

(assert (=> b!1092716 (= res!729180 (= (select (arr!33965 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42067 () Bool)

(assert (=> mapIsEmpty!42067 mapRes!42067))

(declare-fun mapNonEmpty!42067 () Bool)

(declare-fun tp!80468 () Bool)

(assert (=> mapNonEmpty!42067 (= mapRes!42067 (and tp!80468 e!623981))))

(declare-fun mapValue!42067 () ValueCell!12728)

(declare-fun mapRest!42067 () (Array (_ BitVec 32) ValueCell!12728))

(declare-fun mapKey!42067 () (_ BitVec 32))

(assert (=> mapNonEmpty!42067 (= (arr!33966 _values!874) (store mapRest!42067 mapKey!42067 mapValue!42067))))

(declare-fun b!1092717 () Bool)

(declare-fun res!729183 () Bool)

(assert (=> b!1092717 (=> (not res!729183) (not e!623976))))

(declare-datatypes ((List!23789 0))(
  ( (Nil!23786) (Cons!23785 (h!24994 (_ BitVec 64)) (t!33711 List!23789)) )
))
(declare-fun arrayNoDuplicates!0 (array!70582 (_ BitVec 32) List!23789) Bool)

(assert (=> b!1092717 (= res!729183 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23786))))

(declare-fun res!729175 () Bool)

(assert (=> start!96214 (=> (not res!729175) (not e!623976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96214 (= res!729175 (validMask!0 mask!1414))))

(assert (=> start!96214 e!623976))

(assert (=> start!96214 tp!80467))

(assert (=> start!96214 true))

(assert (=> start!96214 tp_is_empty!26875))

(declare-fun array_inv!26220 (array!70582) Bool)

(assert (=> start!96214 (array_inv!26220 _keys!1070)))

(declare-fun array_inv!26221 (array!70584) Bool)

(assert (=> start!96214 (and (array_inv!26221 _values!874) e!623980)))

(declare-fun b!1092714 () Bool)

(declare-fun res!729179 () Bool)

(assert (=> b!1092714 (=> (not res!729179) (not e!623976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092714 (= res!729179 (validKeyInArray!0 k0!904))))

(declare-fun b!1092718 () Bool)

(declare-fun res!729178 () Bool)

(assert (=> b!1092718 (=> (not res!729178) (not e!623979))))

(assert (=> b!1092718 (= res!729178 (arrayNoDuplicates!0 lt!488380 #b00000000000000000000000000000000 Nil!23786))))

(declare-fun b!1092719 () Bool)

(declare-fun res!729181 () Bool)

(assert (=> b!1092719 (=> (not res!729181) (not e!623976))))

(assert (=> b!1092719 (= res!729181 (and (= (size!34504 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34503 _keys!1070) (size!34504 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96214 res!729175) b!1092719))

(assert (= (and b!1092719 res!729181) b!1092715))

(assert (= (and b!1092715 res!729182) b!1092717))

(assert (= (and b!1092717 res!729183) b!1092712))

(assert (= (and b!1092712 res!729176) b!1092714))

(assert (= (and b!1092714 res!729179) b!1092716))

(assert (= (and b!1092716 res!729180) b!1092709))

(assert (= (and b!1092709 res!729177) b!1092718))

(assert (= (and b!1092718 res!729178) b!1092708))

(assert (= (and b!1092710 condMapEmpty!42067) mapIsEmpty!42067))

(assert (= (and b!1092710 (not condMapEmpty!42067)) mapNonEmpty!42067))

(get-info :version)

(assert (= (and mapNonEmpty!42067 ((_ is ValueCellFull!12728) mapValue!42067)) b!1092713))

(assert (= (and b!1092710 ((_ is ValueCellFull!12728) mapDefault!42067)) b!1092711))

(assert (= start!96214 b!1092710))

(declare-fun b_lambda!17521 () Bool)

(assert (=> (not b_lambda!17521) (not b!1092708)))

(declare-fun t!33709 () Bool)

(declare-fun tb!7743 () Bool)

(assert (=> (and start!96214 (= defaultEntry!882 defaultEntry!882) t!33709) tb!7743))

(declare-fun result!16013 () Bool)

(assert (=> tb!7743 (= result!16013 tp_is_empty!26875)))

(assert (=> b!1092708 t!33709))

(declare-fun b_and!36397 () Bool)

(assert (= b_and!36395 (and (=> t!33709 result!16013) b_and!36397)))

(declare-fun m!1012043 () Bool)

(assert (=> b!1092715 m!1012043))

(declare-fun m!1012045 () Bool)

(assert (=> b!1092709 m!1012045))

(declare-fun m!1012047 () Bool)

(assert (=> b!1092709 m!1012047))

(declare-fun m!1012049 () Bool)

(assert (=> mapNonEmpty!42067 m!1012049))

(declare-fun m!1012051 () Bool)

(assert (=> b!1092714 m!1012051))

(declare-fun m!1012053 () Bool)

(assert (=> b!1092717 m!1012053))

(declare-fun m!1012055 () Bool)

(assert (=> start!96214 m!1012055))

(declare-fun m!1012057 () Bool)

(assert (=> start!96214 m!1012057))

(declare-fun m!1012059 () Bool)

(assert (=> start!96214 m!1012059))

(declare-fun m!1012061 () Bool)

(assert (=> b!1092716 m!1012061))

(declare-fun m!1012063 () Bool)

(assert (=> b!1092718 m!1012063))

(declare-fun m!1012065 () Bool)

(assert (=> b!1092708 m!1012065))

(declare-fun m!1012067 () Bool)

(assert (=> b!1092708 m!1012067))

(declare-fun m!1012069 () Bool)

(assert (=> b!1092708 m!1012069))

(declare-fun m!1012071 () Bool)

(assert (=> b!1092708 m!1012071))

(declare-fun m!1012073 () Bool)

(assert (=> b!1092708 m!1012073))

(declare-fun m!1012075 () Bool)

(assert (=> b!1092708 m!1012075))

(declare-fun m!1012077 () Bool)

(assert (=> b!1092708 m!1012077))

(declare-fun m!1012079 () Bool)

(assert (=> b!1092708 m!1012079))

(declare-fun m!1012081 () Bool)

(assert (=> b!1092708 m!1012081))

(declare-fun m!1012083 () Bool)

(assert (=> b!1092708 m!1012083))

(check-sat (not mapNonEmpty!42067) (not b_next!22873) (not b!1092717) (not b!1092708) (not b!1092709) (not start!96214) (not b_lambda!17521) (not b!1092718) (not b!1092715) (not b!1092714) tp_is_empty!26875 b_and!36397)
(check-sat b_and!36397 (not b_next!22873))
