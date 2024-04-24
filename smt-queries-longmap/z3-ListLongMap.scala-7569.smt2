; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95970 () Bool)

(assert start!95970)

(declare-fun b_free!22387 () Bool)

(declare-fun b_next!22387 () Bool)

(assert (=> start!95970 (= b_free!22387 (not b_next!22387))))

(declare-fun tp!79010 () Bool)

(declare-fun b_and!35459 () Bool)

(assert (=> start!95970 (= tp!79010 b_and!35459)))

(declare-fun b!1083892 () Bool)

(declare-fun res!722150 () Bool)

(declare-fun e!619518 () Bool)

(assert (=> b!1083892 (=> (not res!722150) (not e!619518))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083892 (= res!722150 (validKeyInArray!0 k0!904))))

(declare-fun b!1083893 () Bool)

(declare-fun res!722149 () Bool)

(assert (=> b!1083893 (=> (not res!722149) (not e!619518))))

(declare-datatypes ((array!69761 0))(
  ( (array!69762 (arr!33548 (Array (_ BitVec 32) (_ BitVec 64))) (size!34085 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69761)

(declare-datatypes ((List!23384 0))(
  ( (Nil!23381) (Cons!23380 (h!24598 (_ BitVec 64)) (t!32821 List!23384)) )
))
(declare-fun arrayNoDuplicates!0 (array!69761 (_ BitVec 32) List!23384) Bool)

(assert (=> b!1083893 (= res!722149 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23381))))

(declare-fun b!1083894 () Bool)

(declare-fun e!619520 () Bool)

(declare-fun tp_is_empty!26389 () Bool)

(assert (=> b!1083894 (= e!619520 tp_is_empty!26389)))

(declare-fun mapNonEmpty!41338 () Bool)

(declare-fun mapRes!41338 () Bool)

(declare-fun tp!79009 () Bool)

(declare-fun e!619516 () Bool)

(assert (=> mapNonEmpty!41338 (= mapRes!41338 (and tp!79009 e!619516))))

(declare-fun mapKey!41338 () (_ BitVec 32))

(declare-datatypes ((V!40313 0))(
  ( (V!40314 (val!13251 Int)) )
))
(declare-datatypes ((ValueCell!12485 0))(
  ( (ValueCellFull!12485 (v!15868 V!40313)) (EmptyCell!12485) )
))
(declare-datatypes ((array!69763 0))(
  ( (array!69764 (arr!33549 (Array (_ BitVec 32) ValueCell!12485)) (size!34086 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69763)

(declare-fun mapValue!41338 () ValueCell!12485)

(declare-fun mapRest!41338 () (Array (_ BitVec 32) ValueCell!12485))

(assert (=> mapNonEmpty!41338 (= (arr!33549 _values!874) (store mapRest!41338 mapKey!41338 mapValue!41338))))

(declare-fun res!722151 () Bool)

(assert (=> start!95970 (=> (not res!722151) (not e!619518))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95970 (= res!722151 (validMask!0 mask!1414))))

(assert (=> start!95970 e!619518))

(assert (=> start!95970 tp!79010))

(assert (=> start!95970 true))

(assert (=> start!95970 tp_is_empty!26389))

(declare-fun array_inv!25940 (array!69761) Bool)

(assert (=> start!95970 (array_inv!25940 _keys!1070)))

(declare-fun e!619519 () Bool)

(declare-fun array_inv!25941 (array!69763) Bool)

(assert (=> start!95970 (and (array_inv!25941 _values!874) e!619519)))

(declare-fun b!1083895 () Bool)

(declare-fun res!722148 () Bool)

(assert (=> b!1083895 (=> (not res!722148) (not e!619518))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1083895 (= res!722148 (and (= (size!34086 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34085 _keys!1070) (size!34086 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083896 () Bool)

(declare-fun e!619517 () Bool)

(assert (=> b!1083896 (= e!619518 e!619517)))

(declare-fun res!722146 () Bool)

(assert (=> b!1083896 (=> (not res!722146) (not e!619517))))

(declare-fun lt!480176 () array!69761)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69761 (_ BitVec 32)) Bool)

(assert (=> b!1083896 (= res!722146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480176 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083896 (= lt!480176 (array!69762 (store (arr!33548 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34085 _keys!1070)))))

(declare-fun b!1083897 () Bool)

(assert (=> b!1083897 (= e!619519 (and e!619520 mapRes!41338))))

(declare-fun condMapEmpty!41338 () Bool)

(declare-fun mapDefault!41338 () ValueCell!12485)

(assert (=> b!1083897 (= condMapEmpty!41338 (= (arr!33549 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12485)) mapDefault!41338)))))

(declare-fun b!1083898 () Bool)

(declare-fun res!722143 () Bool)

(assert (=> b!1083898 (=> (not res!722143) (not e!619518))))

(assert (=> b!1083898 (= res!722143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083899 () Bool)

(assert (=> b!1083899 (= e!619517 (not true))))

(declare-datatypes ((tuple2!16792 0))(
  ( (tuple2!16793 (_1!8407 (_ BitVec 64)) (_2!8407 V!40313)) )
))
(declare-datatypes ((List!23385 0))(
  ( (Nil!23382) (Cons!23381 (h!24599 tuple2!16792) (t!32822 List!23385)) )
))
(declare-datatypes ((ListLongMap!14769 0))(
  ( (ListLongMap!14770 (toList!7400 List!23385)) )
))
(declare-fun lt!480180 () ListLongMap!14769)

(declare-fun lt!480179 () ListLongMap!14769)

(assert (=> b!1083899 (and (= lt!480180 lt!480179) (= lt!480179 lt!480180))))

(declare-fun lt!480177 () ListLongMap!14769)

(declare-fun -!712 (ListLongMap!14769 (_ BitVec 64)) ListLongMap!14769)

(assert (=> b!1083899 (= lt!480179 (-!712 lt!480177 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40313)

(declare-fun zeroValue!831 () V!40313)

(declare-datatypes ((Unit!35591 0))(
  ( (Unit!35592) )
))
(declare-fun lt!480175 () Unit!35591)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1 (array!69761 array!69763 (_ BitVec 32) (_ BitVec 32) V!40313 V!40313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35591)

(assert (=> b!1083899 (= lt!480175 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3977 (array!69761 array!69763 (_ BitVec 32) (_ BitVec 32) V!40313 V!40313 (_ BitVec 32) Int) ListLongMap!14769)

(declare-fun dynLambda!2098 (Int (_ BitVec 64)) V!40313)

(assert (=> b!1083899 (= lt!480180 (getCurrentListMapNoExtraKeys!3977 lt!480176 (array!69764 (store (arr!33549 _values!874) i!650 (ValueCellFull!12485 (dynLambda!2098 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34086 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083899 (= lt!480177 (getCurrentListMapNoExtraKeys!3977 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083899 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480178 () Unit!35591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69761 (_ BitVec 64) (_ BitVec 32)) Unit!35591)

(assert (=> b!1083899 (= lt!480178 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083900 () Bool)

(assert (=> b!1083900 (= e!619516 tp_is_empty!26389)))

(declare-fun b!1083901 () Bool)

(declare-fun res!722147 () Bool)

(assert (=> b!1083901 (=> (not res!722147) (not e!619518))))

(assert (=> b!1083901 (= res!722147 (= (select (arr!33548 _keys!1070) i!650) k0!904))))

(declare-fun b!1083902 () Bool)

(declare-fun res!722144 () Bool)

(assert (=> b!1083902 (=> (not res!722144) (not e!619518))))

(assert (=> b!1083902 (= res!722144 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34085 _keys!1070))))))

(declare-fun mapIsEmpty!41338 () Bool)

(assert (=> mapIsEmpty!41338 mapRes!41338))

(declare-fun b!1083903 () Bool)

(declare-fun res!722145 () Bool)

(assert (=> b!1083903 (=> (not res!722145) (not e!619517))))

(assert (=> b!1083903 (= res!722145 (arrayNoDuplicates!0 lt!480176 #b00000000000000000000000000000000 Nil!23381))))

(assert (= (and start!95970 res!722151) b!1083895))

(assert (= (and b!1083895 res!722148) b!1083898))

(assert (= (and b!1083898 res!722143) b!1083893))

(assert (= (and b!1083893 res!722149) b!1083902))

(assert (= (and b!1083902 res!722144) b!1083892))

(assert (= (and b!1083892 res!722150) b!1083901))

(assert (= (and b!1083901 res!722147) b!1083896))

(assert (= (and b!1083896 res!722146) b!1083903))

(assert (= (and b!1083903 res!722145) b!1083899))

(assert (= (and b!1083897 condMapEmpty!41338) mapIsEmpty!41338))

(assert (= (and b!1083897 (not condMapEmpty!41338)) mapNonEmpty!41338))

(get-info :version)

(assert (= (and mapNonEmpty!41338 ((_ is ValueCellFull!12485) mapValue!41338)) b!1083900))

(assert (= (and b!1083897 ((_ is ValueCellFull!12485) mapDefault!41338)) b!1083894))

(assert (= start!95970 b!1083897))

(declare-fun b_lambda!17067 () Bool)

(assert (=> (not b_lambda!17067) (not b!1083899)))

(declare-fun t!32820 () Bool)

(declare-fun tb!7257 () Bool)

(assert (=> (and start!95970 (= defaultEntry!882 defaultEntry!882) t!32820) tb!7257))

(declare-fun result!15041 () Bool)

(assert (=> tb!7257 (= result!15041 tp_is_empty!26389)))

(assert (=> b!1083899 t!32820))

(declare-fun b_and!35461 () Bool)

(assert (= b_and!35459 (and (=> t!32820 result!15041) b_and!35461)))

(declare-fun m!1001909 () Bool)

(assert (=> b!1083896 m!1001909))

(declare-fun m!1001911 () Bool)

(assert (=> b!1083896 m!1001911))

(declare-fun m!1001913 () Bool)

(assert (=> b!1083899 m!1001913))

(declare-fun m!1001915 () Bool)

(assert (=> b!1083899 m!1001915))

(declare-fun m!1001917 () Bool)

(assert (=> b!1083899 m!1001917))

(declare-fun m!1001919 () Bool)

(assert (=> b!1083899 m!1001919))

(declare-fun m!1001921 () Bool)

(assert (=> b!1083899 m!1001921))

(declare-fun m!1001923 () Bool)

(assert (=> b!1083899 m!1001923))

(declare-fun m!1001925 () Bool)

(assert (=> b!1083899 m!1001925))

(declare-fun m!1001927 () Bool)

(assert (=> b!1083899 m!1001927))

(declare-fun m!1001929 () Bool)

(assert (=> b!1083903 m!1001929))

(declare-fun m!1001931 () Bool)

(assert (=> b!1083893 m!1001931))

(declare-fun m!1001933 () Bool)

(assert (=> start!95970 m!1001933))

(declare-fun m!1001935 () Bool)

(assert (=> start!95970 m!1001935))

(declare-fun m!1001937 () Bool)

(assert (=> start!95970 m!1001937))

(declare-fun m!1001939 () Bool)

(assert (=> b!1083901 m!1001939))

(declare-fun m!1001941 () Bool)

(assert (=> mapNonEmpty!41338 m!1001941))

(declare-fun m!1001943 () Bool)

(assert (=> b!1083892 m!1001943))

(declare-fun m!1001945 () Bool)

(assert (=> b!1083898 m!1001945))

(check-sat (not b_lambda!17067) (not mapNonEmpty!41338) (not b!1083899) (not b!1083892) (not b!1083893) (not b!1083903) (not b!1083896) (not b_next!22387) (not start!95970) (not b!1083898) b_and!35461 tp_is_empty!26389)
(check-sat b_and!35461 (not b_next!22387))
