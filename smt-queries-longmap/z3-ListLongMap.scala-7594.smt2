; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95886 () Bool)

(assert start!95886)

(declare-fun b_free!22539 () Bool)

(declare-fun b_next!22539 () Bool)

(assert (=> start!95886 (= b_free!22539 (not b_next!22539))))

(declare-fun tp!79465 () Bool)

(declare-fun b_and!35753 () Bool)

(assert (=> start!95886 (= tp!79465 b_and!35753)))

(declare-fun b!1085589 () Bool)

(declare-fun e!620157 () Bool)

(declare-fun tp_is_empty!26541 () Bool)

(assert (=> b!1085589 (= e!620157 tp_is_empty!26541)))

(declare-fun mapIsEmpty!41566 () Bool)

(declare-fun mapRes!41566 () Bool)

(assert (=> mapIsEmpty!41566 mapRes!41566))

(declare-fun b!1085590 () Bool)

(declare-fun res!723810 () Bool)

(declare-fun e!620161 () Bool)

(assert (=> b!1085590 (=> (not res!723810) (not e!620161))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70017 0))(
  ( (array!70018 (arr!33682 (Array (_ BitVec 32) (_ BitVec 64))) (size!34218 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70017)

(declare-datatypes ((V!40515 0))(
  ( (V!40516 (val!13327 Int)) )
))
(declare-datatypes ((ValueCell!12561 0))(
  ( (ValueCellFull!12561 (v!15948 V!40515)) (EmptyCell!12561) )
))
(declare-datatypes ((array!70019 0))(
  ( (array!70020 (arr!33683 (Array (_ BitVec 32) ValueCell!12561)) (size!34219 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70019)

(assert (=> b!1085590 (= res!723810 (and (= (size!34219 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34218 _keys!1070) (size!34219 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085591 () Bool)

(declare-fun res!723815 () Bool)

(assert (=> b!1085591 (=> (not res!723815) (not e!620161))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085591 (= res!723815 (= (select (arr!33682 _keys!1070) i!650) k0!904))))

(declare-fun b!1085592 () Bool)

(declare-fun res!723812 () Bool)

(assert (=> b!1085592 (=> (not res!723812) (not e!620161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085592 (= res!723812 (validKeyInArray!0 k0!904))))

(declare-fun b!1085593 () Bool)

(declare-fun e!620159 () Bool)

(declare-fun e!620156 () Bool)

(assert (=> b!1085593 (= e!620159 e!620156)))

(declare-fun res!723819 () Bool)

(assert (=> b!1085593 (=> res!723819 e!620156)))

(assert (=> b!1085593 (= res!723819 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16900 0))(
  ( (tuple2!16901 (_1!8461 (_ BitVec 64)) (_2!8461 V!40515)) )
))
(declare-datatypes ((List!23489 0))(
  ( (Nil!23486) (Cons!23485 (h!24694 tuple2!16900) (t!33086 List!23489)) )
))
(declare-datatypes ((ListLongMap!14869 0))(
  ( (ListLongMap!14870 (toList!7450 List!23489)) )
))
(declare-fun lt!481871 () ListLongMap!14869)

(declare-fun lt!481869 () ListLongMap!14869)

(assert (=> b!1085593 (= lt!481871 lt!481869)))

(declare-fun lt!481867 () ListLongMap!14869)

(declare-fun -!776 (ListLongMap!14869 (_ BitVec 64)) ListLongMap!14869)

(assert (=> b!1085593 (= lt!481871 (-!776 lt!481867 k0!904))))

(declare-fun lt!481865 () ListLongMap!14869)

(declare-fun zeroValue!831 () V!40515)

(declare-datatypes ((Unit!35718 0))(
  ( (Unit!35719) )
))
(declare-fun lt!481864 () Unit!35718)

(declare-fun addRemoveCommutativeForDiffKeys!14 (ListLongMap!14869 (_ BitVec 64) V!40515 (_ BitVec 64)) Unit!35718)

(assert (=> b!1085593 (= lt!481864 (addRemoveCommutativeForDiffKeys!14 lt!481865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481860 () ListLongMap!14869)

(declare-fun lt!481862 () tuple2!16900)

(declare-fun +!3258 (ListLongMap!14869 tuple2!16900) ListLongMap!14869)

(assert (=> b!1085593 (= lt!481860 (+!3258 lt!481869 lt!481862))))

(declare-fun lt!481861 () ListLongMap!14869)

(declare-fun lt!481863 () tuple2!16900)

(assert (=> b!1085593 (= lt!481869 (+!3258 lt!481861 lt!481863))))

(declare-fun lt!481857 () ListLongMap!14869)

(declare-fun lt!481868 () ListLongMap!14869)

(assert (=> b!1085593 (= lt!481857 lt!481868)))

(assert (=> b!1085593 (= lt!481868 (+!3258 lt!481867 lt!481862))))

(assert (=> b!1085593 (= lt!481867 (+!3258 lt!481865 lt!481863))))

(declare-fun lt!481866 () ListLongMap!14869)

(assert (=> b!1085593 (= lt!481860 (+!3258 (+!3258 lt!481866 lt!481863) lt!481862))))

(declare-fun minValue!831 () V!40515)

(assert (=> b!1085593 (= lt!481862 (tuple2!16901 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085593 (= lt!481863 (tuple2!16901 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!723809 () Bool)

(assert (=> start!95886 (=> (not res!723809) (not e!620161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95886 (= res!723809 (validMask!0 mask!1414))))

(assert (=> start!95886 e!620161))

(assert (=> start!95886 tp!79465))

(assert (=> start!95886 true))

(assert (=> start!95886 tp_is_empty!26541))

(declare-fun array_inv!25994 (array!70017) Bool)

(assert (=> start!95886 (array_inv!25994 _keys!1070)))

(declare-fun e!620162 () Bool)

(declare-fun array_inv!25995 (array!70019) Bool)

(assert (=> start!95886 (and (array_inv!25995 _values!874) e!620162)))

(declare-fun b!1085594 () Bool)

(assert (=> b!1085594 (= e!620162 (and e!620157 mapRes!41566))))

(declare-fun condMapEmpty!41566 () Bool)

(declare-fun mapDefault!41566 () ValueCell!12561)

(assert (=> b!1085594 (= condMapEmpty!41566 (= (arr!33683 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12561)) mapDefault!41566)))))

(declare-fun b!1085595 () Bool)

(declare-fun e!620155 () Bool)

(assert (=> b!1085595 (= e!620155 (not e!620159))))

(declare-fun res!723813 () Bool)

(assert (=> b!1085595 (=> res!723813 e!620159)))

(assert (=> b!1085595 (= res!723813 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4235 (array!70017 array!70019 (_ BitVec 32) (_ BitVec 32) V!40515 V!40515 (_ BitVec 32) Int) ListLongMap!14869)

(assert (=> b!1085595 (= lt!481857 (getCurrentListMap!4235 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481872 () array!70019)

(declare-fun lt!481858 () array!70017)

(assert (=> b!1085595 (= lt!481860 (getCurrentListMap!4235 lt!481858 lt!481872 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085595 (and (= lt!481866 lt!481861) (= lt!481861 lt!481866))))

(assert (=> b!1085595 (= lt!481861 (-!776 lt!481865 k0!904))))

(declare-fun lt!481870 () Unit!35718)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!54 (array!70017 array!70019 (_ BitVec 32) (_ BitVec 32) V!40515 V!40515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35718)

(assert (=> b!1085595 (= lt!481870 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!54 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3995 (array!70017 array!70019 (_ BitVec 32) (_ BitVec 32) V!40515 V!40515 (_ BitVec 32) Int) ListLongMap!14869)

(assert (=> b!1085595 (= lt!481866 (getCurrentListMapNoExtraKeys!3995 lt!481858 lt!481872 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2132 (Int (_ BitVec 64)) V!40515)

(assert (=> b!1085595 (= lt!481872 (array!70020 (store (arr!33683 _values!874) i!650 (ValueCellFull!12561 (dynLambda!2132 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34219 _values!874)))))

(assert (=> b!1085595 (= lt!481865 (getCurrentListMapNoExtraKeys!3995 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085595 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481873 () Unit!35718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70017 (_ BitVec 64) (_ BitVec 32)) Unit!35718)

(assert (=> b!1085595 (= lt!481873 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085596 () Bool)

(declare-fun res!723818 () Bool)

(assert (=> b!1085596 (=> (not res!723818) (not e!620161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70017 (_ BitVec 32)) Bool)

(assert (=> b!1085596 (= res!723818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085597 () Bool)

(declare-fun e!620158 () Bool)

(assert (=> b!1085597 (= e!620158 tp_is_empty!26541)))

(declare-fun b!1085598 () Bool)

(assert (=> b!1085598 (= e!620161 e!620155)))

(declare-fun res!723816 () Bool)

(assert (=> b!1085598 (=> (not res!723816) (not e!620155))))

(assert (=> b!1085598 (= res!723816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481858 mask!1414))))

(assert (=> b!1085598 (= lt!481858 (array!70018 (store (arr!33682 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34218 _keys!1070)))))

(declare-fun b!1085599 () Bool)

(declare-fun res!723814 () Bool)

(assert (=> b!1085599 (=> (not res!723814) (not e!620161))))

(assert (=> b!1085599 (= res!723814 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34218 _keys!1070))))))

(declare-fun mapNonEmpty!41566 () Bool)

(declare-fun tp!79466 () Bool)

(assert (=> mapNonEmpty!41566 (= mapRes!41566 (and tp!79466 e!620158))))

(declare-fun mapRest!41566 () (Array (_ BitVec 32) ValueCell!12561))

(declare-fun mapKey!41566 () (_ BitVec 32))

(declare-fun mapValue!41566 () ValueCell!12561)

(assert (=> mapNonEmpty!41566 (= (arr!33683 _values!874) (store mapRest!41566 mapKey!41566 mapValue!41566))))

(declare-fun b!1085600 () Bool)

(assert (=> b!1085600 (= e!620156 true)))

(assert (=> b!1085600 (= (-!776 lt!481868 k0!904) (+!3258 lt!481871 lt!481862))))

(declare-fun lt!481859 () Unit!35718)

(assert (=> b!1085600 (= lt!481859 (addRemoveCommutativeForDiffKeys!14 lt!481867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085601 () Bool)

(declare-fun res!723817 () Bool)

(assert (=> b!1085601 (=> (not res!723817) (not e!620155))))

(declare-datatypes ((List!23490 0))(
  ( (Nil!23487) (Cons!23486 (h!24695 (_ BitVec 64)) (t!33087 List!23490)) )
))
(declare-fun arrayNoDuplicates!0 (array!70017 (_ BitVec 32) List!23490) Bool)

(assert (=> b!1085601 (= res!723817 (arrayNoDuplicates!0 lt!481858 #b00000000000000000000000000000000 Nil!23487))))

(declare-fun b!1085602 () Bool)

(declare-fun res!723811 () Bool)

(assert (=> b!1085602 (=> (not res!723811) (not e!620161))))

(assert (=> b!1085602 (= res!723811 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23487))))

(assert (= (and start!95886 res!723809) b!1085590))

(assert (= (and b!1085590 res!723810) b!1085596))

(assert (= (and b!1085596 res!723818) b!1085602))

(assert (= (and b!1085602 res!723811) b!1085599))

(assert (= (and b!1085599 res!723814) b!1085592))

(assert (= (and b!1085592 res!723812) b!1085591))

(assert (= (and b!1085591 res!723815) b!1085598))

(assert (= (and b!1085598 res!723816) b!1085601))

(assert (= (and b!1085601 res!723817) b!1085595))

(assert (= (and b!1085595 (not res!723813)) b!1085593))

(assert (= (and b!1085593 (not res!723819)) b!1085600))

(assert (= (and b!1085594 condMapEmpty!41566) mapIsEmpty!41566))

(assert (= (and b!1085594 (not condMapEmpty!41566)) mapNonEmpty!41566))

(get-info :version)

(assert (= (and mapNonEmpty!41566 ((_ is ValueCellFull!12561) mapValue!41566)) b!1085597))

(assert (= (and b!1085594 ((_ is ValueCellFull!12561) mapDefault!41566)) b!1085589))

(assert (= start!95886 b!1085594))

(declare-fun b_lambda!17209 () Bool)

(assert (=> (not b_lambda!17209) (not b!1085595)))

(declare-fun t!33085 () Bool)

(declare-fun tb!7417 () Bool)

(assert (=> (and start!95886 (= defaultEntry!882 defaultEntry!882) t!33085) tb!7417))

(declare-fun result!15353 () Bool)

(assert (=> tb!7417 (= result!15353 tp_is_empty!26541)))

(assert (=> b!1085595 t!33085))

(declare-fun b_and!35755 () Bool)

(assert (= b_and!35753 (and (=> t!33085 result!15353) b_and!35755)))

(declare-fun m!1003703 () Bool)

(assert (=> b!1085596 m!1003703))

(declare-fun m!1003705 () Bool)

(assert (=> b!1085601 m!1003705))

(declare-fun m!1003707 () Bool)

(assert (=> b!1085595 m!1003707))

(declare-fun m!1003709 () Bool)

(assert (=> b!1085595 m!1003709))

(declare-fun m!1003711 () Bool)

(assert (=> b!1085595 m!1003711))

(declare-fun m!1003713 () Bool)

(assert (=> b!1085595 m!1003713))

(declare-fun m!1003715 () Bool)

(assert (=> b!1085595 m!1003715))

(declare-fun m!1003717 () Bool)

(assert (=> b!1085595 m!1003717))

(declare-fun m!1003719 () Bool)

(assert (=> b!1085595 m!1003719))

(declare-fun m!1003721 () Bool)

(assert (=> b!1085595 m!1003721))

(declare-fun m!1003723 () Bool)

(assert (=> b!1085595 m!1003723))

(declare-fun m!1003725 () Bool)

(assert (=> b!1085595 m!1003725))

(declare-fun m!1003727 () Bool)

(assert (=> start!95886 m!1003727))

(declare-fun m!1003729 () Bool)

(assert (=> start!95886 m!1003729))

(declare-fun m!1003731 () Bool)

(assert (=> start!95886 m!1003731))

(declare-fun m!1003733 () Bool)

(assert (=> b!1085598 m!1003733))

(declare-fun m!1003735 () Bool)

(assert (=> b!1085598 m!1003735))

(declare-fun m!1003737 () Bool)

(assert (=> mapNonEmpty!41566 m!1003737))

(declare-fun m!1003739 () Bool)

(assert (=> b!1085591 m!1003739))

(declare-fun m!1003741 () Bool)

(assert (=> b!1085592 m!1003741))

(declare-fun m!1003743 () Bool)

(assert (=> b!1085593 m!1003743))

(declare-fun m!1003745 () Bool)

(assert (=> b!1085593 m!1003745))

(declare-fun m!1003747 () Bool)

(assert (=> b!1085593 m!1003747))

(declare-fun m!1003749 () Bool)

(assert (=> b!1085593 m!1003749))

(declare-fun m!1003751 () Bool)

(assert (=> b!1085593 m!1003751))

(declare-fun m!1003753 () Bool)

(assert (=> b!1085593 m!1003753))

(assert (=> b!1085593 m!1003747))

(declare-fun m!1003755 () Bool)

(assert (=> b!1085593 m!1003755))

(declare-fun m!1003757 () Bool)

(assert (=> b!1085593 m!1003757))

(declare-fun m!1003759 () Bool)

(assert (=> b!1085600 m!1003759))

(declare-fun m!1003761 () Bool)

(assert (=> b!1085600 m!1003761))

(declare-fun m!1003763 () Bool)

(assert (=> b!1085600 m!1003763))

(declare-fun m!1003765 () Bool)

(assert (=> b!1085602 m!1003765))

(check-sat (not b_next!22539) (not b!1085602) (not b!1085601) (not start!95886) (not b!1085595) (not b!1085598) (not b!1085592) tp_is_empty!26541 (not b_lambda!17209) (not b!1085593) (not b!1085596) (not b!1085600) (not mapNonEmpty!41566) b_and!35755)
(check-sat b_and!35755 (not b_next!22539))
