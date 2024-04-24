; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96486 () Bool)

(assert start!96486)

(declare-fun b_free!22903 () Bool)

(declare-fun b_next!22903 () Bool)

(assert (=> start!96486 (= b_free!22903 (not b_next!22903))))

(declare-fun tp!80557 () Bool)

(declare-fun b_and!36491 () Bool)

(assert (=> start!96486 (= tp!80557 b_and!36491)))

(declare-fun res!730177 () Bool)

(declare-fun e!625196 () Bool)

(assert (=> start!96486 (=> (not res!730177) (not e!625196))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96486 (= res!730177 (validMask!0 mask!1414))))

(assert (=> start!96486 e!625196))

(assert (=> start!96486 tp!80557))

(assert (=> start!96486 true))

(declare-fun tp_is_empty!26905 () Bool)

(assert (=> start!96486 tp_is_empty!26905))

(declare-datatypes ((array!70755 0))(
  ( (array!70756 (arr!34045 (Array (_ BitVec 32) (_ BitVec 64))) (size!34582 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70755)

(declare-fun array_inv!26278 (array!70755) Bool)

(assert (=> start!96486 (array_inv!26278 _keys!1070)))

(declare-datatypes ((V!41001 0))(
  ( (V!41002 (val!13509 Int)) )
))
(declare-datatypes ((ValueCell!12743 0))(
  ( (ValueCellFull!12743 (v!16126 V!41001)) (EmptyCell!12743) )
))
(declare-datatypes ((array!70757 0))(
  ( (array!70758 (arr!34046 (Array (_ BitVec 32) ValueCell!12743)) (size!34583 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70757)

(declare-fun e!625195 () Bool)

(declare-fun array_inv!26279 (array!70757) Bool)

(assert (=> start!96486 (and (array_inv!26279 _values!874) e!625195)))

(declare-fun b!1094758 () Bool)

(declare-fun res!730175 () Bool)

(declare-fun e!625194 () Bool)

(assert (=> b!1094758 (=> (not res!730175) (not e!625194))))

(declare-fun lt!489510 () array!70755)

(declare-datatypes ((List!23786 0))(
  ( (Nil!23783) (Cons!23782 (h!25000 (_ BitVec 64)) (t!33739 List!23786)) )
))
(declare-fun arrayNoDuplicates!0 (array!70755 (_ BitVec 32) List!23786) Bool)

(assert (=> b!1094758 (= res!730175 (arrayNoDuplicates!0 lt!489510 #b00000000000000000000000000000000 Nil!23783))))

(declare-fun b!1094759 () Bool)

(declare-fun res!730173 () Bool)

(assert (=> b!1094759 (=> (not res!730173) (not e!625196))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094759 (= res!730173 (= (select (arr!34045 _keys!1070) i!650) k0!904))))

(declare-fun b!1094760 () Bool)

(declare-fun e!625198 () Bool)

(assert (=> b!1094760 (= e!625198 tp_is_empty!26905)))

(declare-fun b!1094761 () Bool)

(declare-fun res!730176 () Bool)

(assert (=> b!1094761 (=> (not res!730176) (not e!625196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094761 (= res!730176 (validKeyInArray!0 k0!904))))

(declare-fun b!1094762 () Bool)

(declare-fun res!730178 () Bool)

(assert (=> b!1094762 (=> (not res!730178) (not e!625196))))

(assert (=> b!1094762 (= res!730178 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23783))))

(declare-fun b!1094763 () Bool)

(declare-fun e!625197 () Bool)

(declare-fun mapRes!42112 () Bool)

(assert (=> b!1094763 (= e!625195 (and e!625197 mapRes!42112))))

(declare-fun condMapEmpty!42112 () Bool)

(declare-fun mapDefault!42112 () ValueCell!12743)

(assert (=> b!1094763 (= condMapEmpty!42112 (= (arr!34046 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12743)) mapDefault!42112)))))

(declare-fun b!1094764 () Bool)

(declare-fun res!730179 () Bool)

(assert (=> b!1094764 (=> (not res!730179) (not e!625196))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094764 (= res!730179 (and (= (size!34583 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34582 _keys!1070) (size!34583 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094765 () Bool)

(declare-fun res!730174 () Bool)

(assert (=> b!1094765 (=> (not res!730174) (not e!625196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70755 (_ BitVec 32)) Bool)

(assert (=> b!1094765 (= res!730174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42112 () Bool)

(assert (=> mapIsEmpty!42112 mapRes!42112))

(declare-fun b!1094766 () Bool)

(assert (=> b!1094766 (= e!625194 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41001)

(declare-datatypes ((tuple2!17190 0))(
  ( (tuple2!17191 (_1!8606 (_ BitVec 64)) (_2!8606 V!41001)) )
))
(declare-datatypes ((List!23787 0))(
  ( (Nil!23784) (Cons!23783 (h!25001 tuple2!17190) (t!33740 List!23787)) )
))
(declare-datatypes ((ListLongMap!15167 0))(
  ( (ListLongMap!15168 (toList!7599 List!23787)) )
))
(declare-fun lt!489508 () ListLongMap!15167)

(declare-fun zeroValue!831 () V!41001)

(declare-fun getCurrentListMap!4347 (array!70755 array!70757 (_ BitVec 32) (_ BitVec 32) V!41001 V!41001 (_ BitVec 32) Int) ListLongMap!15167)

(assert (=> b!1094766 (= lt!489508 (getCurrentListMap!4347 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489507 () array!70757)

(declare-fun lt!489505 () ListLongMap!15167)

(assert (=> b!1094766 (= lt!489505 (getCurrentListMap!4347 lt!489510 lt!489507 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489509 () ListLongMap!15167)

(declare-fun lt!489513 () ListLongMap!15167)

(assert (=> b!1094766 (and (= lt!489509 lt!489513) (= lt!489513 lt!489509))))

(declare-fun lt!489506 () ListLongMap!15167)

(declare-fun -!904 (ListLongMap!15167 (_ BitVec 64)) ListLongMap!15167)

(assert (=> b!1094766 (= lt!489513 (-!904 lt!489506 k0!904))))

(declare-datatypes ((Unit!35975 0))(
  ( (Unit!35976) )
))
(declare-fun lt!489512 () Unit!35975)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!176 (array!70755 array!70757 (_ BitVec 32) (_ BitVec 32) V!41001 V!41001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35975)

(assert (=> b!1094766 (= lt!489512 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!176 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4152 (array!70755 array!70757 (_ BitVec 32) (_ BitVec 32) V!41001 V!41001 (_ BitVec 32) Int) ListLongMap!15167)

(assert (=> b!1094766 (= lt!489509 (getCurrentListMapNoExtraKeys!4152 lt!489510 lt!489507 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2273 (Int (_ BitVec 64)) V!41001)

(assert (=> b!1094766 (= lt!489507 (array!70758 (store (arr!34046 _values!874) i!650 (ValueCellFull!12743 (dynLambda!2273 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34583 _values!874)))))

(assert (=> b!1094766 (= lt!489506 (getCurrentListMapNoExtraKeys!4152 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094766 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489511 () Unit!35975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70755 (_ BitVec 64) (_ BitVec 32)) Unit!35975)

(assert (=> b!1094766 (= lt!489511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094767 () Bool)

(assert (=> b!1094767 (= e!625196 e!625194)))

(declare-fun res!730171 () Bool)

(assert (=> b!1094767 (=> (not res!730171) (not e!625194))))

(assert (=> b!1094767 (= res!730171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489510 mask!1414))))

(assert (=> b!1094767 (= lt!489510 (array!70756 (store (arr!34045 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34582 _keys!1070)))))

(declare-fun b!1094768 () Bool)

(assert (=> b!1094768 (= e!625197 tp_is_empty!26905)))

(declare-fun b!1094769 () Bool)

(declare-fun res!730172 () Bool)

(assert (=> b!1094769 (=> (not res!730172) (not e!625196))))

(assert (=> b!1094769 (= res!730172 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34582 _keys!1070))))))

(declare-fun mapNonEmpty!42112 () Bool)

(declare-fun tp!80558 () Bool)

(assert (=> mapNonEmpty!42112 (= mapRes!42112 (and tp!80558 e!625198))))

(declare-fun mapKey!42112 () (_ BitVec 32))

(declare-fun mapValue!42112 () ValueCell!12743)

(declare-fun mapRest!42112 () (Array (_ BitVec 32) ValueCell!12743))

(assert (=> mapNonEmpty!42112 (= (arr!34046 _values!874) (store mapRest!42112 mapKey!42112 mapValue!42112))))

(assert (= (and start!96486 res!730177) b!1094764))

(assert (= (and b!1094764 res!730179) b!1094765))

(assert (= (and b!1094765 res!730174) b!1094762))

(assert (= (and b!1094762 res!730178) b!1094769))

(assert (= (and b!1094769 res!730172) b!1094761))

(assert (= (and b!1094761 res!730176) b!1094759))

(assert (= (and b!1094759 res!730173) b!1094767))

(assert (= (and b!1094767 res!730171) b!1094758))

(assert (= (and b!1094758 res!730175) b!1094766))

(assert (= (and b!1094763 condMapEmpty!42112) mapIsEmpty!42112))

(assert (= (and b!1094763 (not condMapEmpty!42112)) mapNonEmpty!42112))

(get-info :version)

(assert (= (and mapNonEmpty!42112 ((_ is ValueCellFull!12743) mapValue!42112)) b!1094760))

(assert (= (and b!1094763 ((_ is ValueCellFull!12743) mapDefault!42112)) b!1094768))

(assert (= start!96486 b!1094763))

(declare-fun b_lambda!17583 () Bool)

(assert (=> (not b_lambda!17583) (not b!1094766)))

(declare-fun t!33738 () Bool)

(declare-fun tb!7773 () Bool)

(assert (=> (and start!96486 (= defaultEntry!882 defaultEntry!882) t!33738) tb!7773))

(declare-fun result!16073 () Bool)

(assert (=> tb!7773 (= result!16073 tp_is_empty!26905)))

(assert (=> b!1094766 t!33738))

(declare-fun b_and!36493 () Bool)

(assert (= b_and!36491 (and (=> t!33738 result!16073) b_and!36493)))

(declare-fun m!1014971 () Bool)

(assert (=> b!1094761 m!1014971))

(declare-fun m!1014973 () Bool)

(assert (=> b!1094762 m!1014973))

(declare-fun m!1014975 () Bool)

(assert (=> b!1094766 m!1014975))

(declare-fun m!1014977 () Bool)

(assert (=> b!1094766 m!1014977))

(declare-fun m!1014979 () Bool)

(assert (=> b!1094766 m!1014979))

(declare-fun m!1014981 () Bool)

(assert (=> b!1094766 m!1014981))

(declare-fun m!1014983 () Bool)

(assert (=> b!1094766 m!1014983))

(declare-fun m!1014985 () Bool)

(assert (=> b!1094766 m!1014985))

(declare-fun m!1014987 () Bool)

(assert (=> b!1094766 m!1014987))

(declare-fun m!1014989 () Bool)

(assert (=> b!1094766 m!1014989))

(declare-fun m!1014991 () Bool)

(assert (=> b!1094766 m!1014991))

(declare-fun m!1014993 () Bool)

(assert (=> b!1094766 m!1014993))

(declare-fun m!1014995 () Bool)

(assert (=> b!1094767 m!1014995))

(declare-fun m!1014997 () Bool)

(assert (=> b!1094767 m!1014997))

(declare-fun m!1014999 () Bool)

(assert (=> start!96486 m!1014999))

(declare-fun m!1015001 () Bool)

(assert (=> start!96486 m!1015001))

(declare-fun m!1015003 () Bool)

(assert (=> start!96486 m!1015003))

(declare-fun m!1015005 () Bool)

(assert (=> b!1094758 m!1015005))

(declare-fun m!1015007 () Bool)

(assert (=> b!1094759 m!1015007))

(declare-fun m!1015009 () Bool)

(assert (=> mapNonEmpty!42112 m!1015009))

(declare-fun m!1015011 () Bool)

(assert (=> b!1094765 m!1015011))

(check-sat (not mapNonEmpty!42112) tp_is_empty!26905 (not start!96486) b_and!36493 (not b_lambda!17583) (not b!1094767) (not b!1094758) (not b!1094761) (not b_next!22903) (not b!1094765) (not b!1094762) (not b!1094766))
(check-sat b_and!36493 (not b_next!22903))
