; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96124 () Bool)

(assert start!96124)

(declare-fun b_free!22783 () Bool)

(declare-fun b_next!22783 () Bool)

(assert (=> start!96124 (= b_free!22783 (not b_next!22783))))

(declare-fun tp!80197 () Bool)

(declare-fun b_and!36215 () Bool)

(assert (=> start!96124 (= tp!80197 b_and!36215)))

(declare-fun b!1090822 () Bool)

(declare-fun e!622995 () Bool)

(declare-datatypes ((array!70412 0))(
  ( (array!70413 (arr!33880 (Array (_ BitVec 32) (_ BitVec 64))) (size!34418 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70412)

(assert (=> b!1090822 (= e!622995 (bvsle #b00000000000000000000000000000000 (size!34418 _keys!1070)))))

(declare-datatypes ((V!40841 0))(
  ( (V!40842 (val!13449 Int)) )
))
(declare-datatypes ((tuple2!17154 0))(
  ( (tuple2!17155 (_1!8588 (_ BitVec 64)) (_2!8588 V!40841)) )
))
(declare-datatypes ((List!23720 0))(
  ( (Nil!23717) (Cons!23716 (h!24925 tuple2!17154) (t!33552 List!23720)) )
))
(declare-datatypes ((ListLongMap!15123 0))(
  ( (ListLongMap!15124 (toList!7577 List!23720)) )
))
(declare-fun lt!486811 () ListLongMap!15123)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!486813 () ListLongMap!15123)

(declare-fun -!851 (ListLongMap!15123 (_ BitVec 64)) ListLongMap!15123)

(assert (=> b!1090822 (= (-!851 lt!486811 k0!904) lt!486813)))

(declare-datatypes ((Unit!35737 0))(
  ( (Unit!35738) )
))
(declare-fun lt!486820 () Unit!35737)

(declare-fun lt!486815 () ListLongMap!15123)

(declare-fun minValue!831 () V!40841)

(declare-fun addRemoveCommutativeForDiffKeys!95 (ListLongMap!15123 (_ BitVec 64) V!40841 (_ BitVec 64)) Unit!35737)

(assert (=> b!1090822 (= lt!486820 (addRemoveCommutativeForDiffKeys!95 lt!486815 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1090823 () Bool)

(declare-fun res!727789 () Bool)

(declare-fun e!622997 () Bool)

(assert (=> b!1090823 (=> (not res!727789) (not e!622997))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12683 0))(
  ( (ValueCellFull!12683 (v!16069 V!40841)) (EmptyCell!12683) )
))
(declare-datatypes ((array!70414 0))(
  ( (array!70415 (arr!33881 (Array (_ BitVec 32) ValueCell!12683)) (size!34419 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70414)

(assert (=> b!1090823 (= res!727789 (and (= (size!34419 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34418 _keys!1070) (size!34419 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090824 () Bool)

(declare-fun res!727786 () Bool)

(assert (=> b!1090824 (=> (not res!727786) (not e!622997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70412 (_ BitVec 32)) Bool)

(assert (=> b!1090824 (= res!727786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090825 () Bool)

(declare-fun res!727791 () Bool)

(assert (=> b!1090825 (=> (not res!727791) (not e!622997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090825 (= res!727791 (validKeyInArray!0 k0!904))))

(declare-fun b!1090826 () Bool)

(declare-fun e!622996 () Bool)

(declare-fun tp_is_empty!26785 () Bool)

(assert (=> b!1090826 (= e!622996 tp_is_empty!26785)))

(declare-fun res!727794 () Bool)

(assert (=> start!96124 (=> (not res!727794) (not e!622997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96124 (= res!727794 (validMask!0 mask!1414))))

(assert (=> start!96124 e!622997))

(assert (=> start!96124 tp!80197))

(assert (=> start!96124 true))

(assert (=> start!96124 tp_is_empty!26785))

(declare-fun array_inv!26162 (array!70412) Bool)

(assert (=> start!96124 (array_inv!26162 _keys!1070)))

(declare-fun e!622994 () Bool)

(declare-fun array_inv!26163 (array!70414) Bool)

(assert (=> start!96124 (and (array_inv!26163 _values!874) e!622994)))

(declare-fun b!1090827 () Bool)

(declare-fun res!727792 () Bool)

(assert (=> b!1090827 (=> (not res!727792) (not e!622997))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090827 (= res!727792 (= (select (arr!33880 _keys!1070) i!650) k0!904))))

(declare-fun b!1090828 () Bool)

(declare-fun res!727787 () Bool)

(assert (=> b!1090828 (=> (not res!727787) (not e!622997))))

(assert (=> b!1090828 (= res!727787 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34418 _keys!1070))))))

(declare-fun b!1090829 () Bool)

(declare-fun e!622991 () Bool)

(declare-fun e!622990 () Bool)

(assert (=> b!1090829 (= e!622991 (not e!622990))))

(declare-fun res!727790 () Bool)

(assert (=> b!1090829 (=> res!727790 e!622990)))

(assert (=> b!1090829 (= res!727790 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!486818 () ListLongMap!15123)

(declare-fun zeroValue!831 () V!40841)

(declare-fun getCurrentListMap!4247 (array!70412 array!70414 (_ BitVec 32) (_ BitVec 32) V!40841 V!40841 (_ BitVec 32) Int) ListLongMap!15123)

(assert (=> b!1090829 (= lt!486818 (getCurrentListMap!4247 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486817 () array!70412)

(declare-fun lt!486821 () array!70414)

(declare-fun lt!486816 () ListLongMap!15123)

(assert (=> b!1090829 (= lt!486816 (getCurrentListMap!4247 lt!486817 lt!486821 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486819 () ListLongMap!15123)

(declare-fun lt!486809 () ListLongMap!15123)

(assert (=> b!1090829 (and (= lt!486819 lt!486809) (= lt!486809 lt!486819))))

(assert (=> b!1090829 (= lt!486809 (-!851 lt!486815 k0!904))))

(declare-fun lt!486810 () Unit!35737)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!131 (array!70412 array!70414 (_ BitVec 32) (_ BitVec 32) V!40841 V!40841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35737)

(assert (=> b!1090829 (= lt!486810 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!131 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4117 (array!70412 array!70414 (_ BitVec 32) (_ BitVec 32) V!40841 V!40841 (_ BitVec 32) Int) ListLongMap!15123)

(assert (=> b!1090829 (= lt!486819 (getCurrentListMapNoExtraKeys!4117 lt!486817 lt!486821 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2188 (Int (_ BitVec 64)) V!40841)

(assert (=> b!1090829 (= lt!486821 (array!70415 (store (arr!33881 _values!874) i!650 (ValueCellFull!12683 (dynLambda!2188 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34419 _values!874)))))

(assert (=> b!1090829 (= lt!486815 (getCurrentListMapNoExtraKeys!4117 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090829 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486814 () Unit!35737)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70412 (_ BitVec 64) (_ BitVec 32)) Unit!35737)

(assert (=> b!1090829 (= lt!486814 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090830 () Bool)

(declare-fun res!727785 () Bool)

(assert (=> b!1090830 (=> (not res!727785) (not e!622991))))

(declare-datatypes ((List!23721 0))(
  ( (Nil!23718) (Cons!23717 (h!24926 (_ BitVec 64)) (t!33553 List!23721)) )
))
(declare-fun arrayNoDuplicates!0 (array!70412 (_ BitVec 32) List!23721) Bool)

(assert (=> b!1090830 (= res!727785 (arrayNoDuplicates!0 lt!486817 #b00000000000000000000000000000000 Nil!23718))))

(declare-fun b!1090831 () Bool)

(assert (=> b!1090831 (= e!622990 e!622995)))

(declare-fun res!727788 () Bool)

(assert (=> b!1090831 (=> res!727788 e!622995)))

(assert (=> b!1090831 (= res!727788 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1090831 (= lt!486818 lt!486811)))

(declare-fun lt!486812 () tuple2!17154)

(declare-fun +!3367 (ListLongMap!15123 tuple2!17154) ListLongMap!15123)

(assert (=> b!1090831 (= lt!486811 (+!3367 lt!486815 lt!486812))))

(assert (=> b!1090831 (= lt!486816 lt!486813)))

(assert (=> b!1090831 (= lt!486813 (+!3367 lt!486809 lt!486812))))

(assert (=> b!1090831 (= lt!486816 (+!3367 lt!486819 lt!486812))))

(assert (=> b!1090831 (= lt!486812 (tuple2!17155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090832 () Bool)

(declare-fun e!622992 () Bool)

(assert (=> b!1090832 (= e!622992 tp_is_empty!26785)))

(declare-fun b!1090833 () Bool)

(assert (=> b!1090833 (= e!622997 e!622991)))

(declare-fun res!727784 () Bool)

(assert (=> b!1090833 (=> (not res!727784) (not e!622991))))

(assert (=> b!1090833 (= res!727784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486817 mask!1414))))

(assert (=> b!1090833 (= lt!486817 (array!70413 (store (arr!33880 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34418 _keys!1070)))))

(declare-fun b!1090834 () Bool)

(declare-fun res!727793 () Bool)

(assert (=> b!1090834 (=> (not res!727793) (not e!622997))))

(assert (=> b!1090834 (= res!727793 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23718))))

(declare-fun mapNonEmpty!41932 () Bool)

(declare-fun mapRes!41932 () Bool)

(declare-fun tp!80198 () Bool)

(assert (=> mapNonEmpty!41932 (= mapRes!41932 (and tp!80198 e!622992))))

(declare-fun mapRest!41932 () (Array (_ BitVec 32) ValueCell!12683))

(declare-fun mapValue!41932 () ValueCell!12683)

(declare-fun mapKey!41932 () (_ BitVec 32))

(assert (=> mapNonEmpty!41932 (= (arr!33881 _values!874) (store mapRest!41932 mapKey!41932 mapValue!41932))))

(declare-fun b!1090835 () Bool)

(assert (=> b!1090835 (= e!622994 (and e!622996 mapRes!41932))))

(declare-fun condMapEmpty!41932 () Bool)

(declare-fun mapDefault!41932 () ValueCell!12683)

(assert (=> b!1090835 (= condMapEmpty!41932 (= (arr!33881 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12683)) mapDefault!41932)))))

(declare-fun mapIsEmpty!41932 () Bool)

(assert (=> mapIsEmpty!41932 mapRes!41932))

(assert (= (and start!96124 res!727794) b!1090823))

(assert (= (and b!1090823 res!727789) b!1090824))

(assert (= (and b!1090824 res!727786) b!1090834))

(assert (= (and b!1090834 res!727793) b!1090828))

(assert (= (and b!1090828 res!727787) b!1090825))

(assert (= (and b!1090825 res!727791) b!1090827))

(assert (= (and b!1090827 res!727792) b!1090833))

(assert (= (and b!1090833 res!727784) b!1090830))

(assert (= (and b!1090830 res!727785) b!1090829))

(assert (= (and b!1090829 (not res!727790)) b!1090831))

(assert (= (and b!1090831 (not res!727788)) b!1090822))

(assert (= (and b!1090835 condMapEmpty!41932) mapIsEmpty!41932))

(assert (= (and b!1090835 (not condMapEmpty!41932)) mapNonEmpty!41932))

(get-info :version)

(assert (= (and mapNonEmpty!41932 ((_ is ValueCellFull!12683) mapValue!41932)) b!1090832))

(assert (= (and b!1090835 ((_ is ValueCellFull!12683) mapDefault!41932)) b!1090826))

(assert (= start!96124 b!1090835))

(declare-fun b_lambda!17431 () Bool)

(assert (=> (not b_lambda!17431) (not b!1090829)))

(declare-fun t!33551 () Bool)

(declare-fun tb!7653 () Bool)

(assert (=> (and start!96124 (= defaultEntry!882 defaultEntry!882) t!33551) tb!7653))

(declare-fun result!15833 () Bool)

(assert (=> tb!7653 (= result!15833 tp_is_empty!26785)))

(assert (=> b!1090829 t!33551))

(declare-fun b_and!36217 () Bool)

(assert (= b_and!36215 (and (=> t!33551 result!15833) b_and!36217)))

(declare-fun m!1009853 () Bool)

(assert (=> b!1090834 m!1009853))

(declare-fun m!1009855 () Bool)

(assert (=> b!1090831 m!1009855))

(declare-fun m!1009857 () Bool)

(assert (=> b!1090831 m!1009857))

(declare-fun m!1009859 () Bool)

(assert (=> b!1090831 m!1009859))

(declare-fun m!1009861 () Bool)

(assert (=> b!1090825 m!1009861))

(declare-fun m!1009863 () Bool)

(assert (=> b!1090822 m!1009863))

(declare-fun m!1009865 () Bool)

(assert (=> b!1090822 m!1009865))

(declare-fun m!1009867 () Bool)

(assert (=> b!1090827 m!1009867))

(declare-fun m!1009869 () Bool)

(assert (=> b!1090824 m!1009869))

(declare-fun m!1009871 () Bool)

(assert (=> mapNonEmpty!41932 m!1009871))

(declare-fun m!1009873 () Bool)

(assert (=> start!96124 m!1009873))

(declare-fun m!1009875 () Bool)

(assert (=> start!96124 m!1009875))

(declare-fun m!1009877 () Bool)

(assert (=> start!96124 m!1009877))

(declare-fun m!1009879 () Bool)

(assert (=> b!1090829 m!1009879))

(declare-fun m!1009881 () Bool)

(assert (=> b!1090829 m!1009881))

(declare-fun m!1009883 () Bool)

(assert (=> b!1090829 m!1009883))

(declare-fun m!1009885 () Bool)

(assert (=> b!1090829 m!1009885))

(declare-fun m!1009887 () Bool)

(assert (=> b!1090829 m!1009887))

(declare-fun m!1009889 () Bool)

(assert (=> b!1090829 m!1009889))

(declare-fun m!1009891 () Bool)

(assert (=> b!1090829 m!1009891))

(declare-fun m!1009893 () Bool)

(assert (=> b!1090829 m!1009893))

(declare-fun m!1009895 () Bool)

(assert (=> b!1090829 m!1009895))

(declare-fun m!1009897 () Bool)

(assert (=> b!1090829 m!1009897))

(declare-fun m!1009899 () Bool)

(assert (=> b!1090830 m!1009899))

(declare-fun m!1009901 () Bool)

(assert (=> b!1090833 m!1009901))

(declare-fun m!1009903 () Bool)

(assert (=> b!1090833 m!1009903))

(check-sat (not b!1090833) (not b!1090822) (not b!1090829) (not b!1090831) b_and!36217 tp_is_empty!26785 (not mapNonEmpty!41932) (not b!1090824) (not b_lambda!17431) (not b!1090830) (not b!1090834) (not b_next!22783) (not b!1090825) (not start!96124))
(check-sat b_and!36217 (not b_next!22783))
