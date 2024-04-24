; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96390 () Bool)

(assert start!96390)

(declare-fun b_free!22807 () Bool)

(declare-fun b_next!22807 () Bool)

(assert (=> start!96390 (= b_free!22807 (not b_next!22807))))

(declare-fun tp!80269 () Bool)

(declare-fun b_and!36299 () Bool)

(assert (=> start!96390 (= tp!80269 b_and!36299)))

(declare-fun res!728776 () Bool)

(declare-fun e!624228 () Bool)

(assert (=> start!96390 (=> (not res!728776) (not e!624228))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96390 (= res!728776 (validMask!0 mask!1414))))

(assert (=> start!96390 e!624228))

(assert (=> start!96390 tp!80269))

(assert (=> start!96390 true))

(declare-fun tp_is_empty!26809 () Bool)

(assert (=> start!96390 tp_is_empty!26809))

(declare-datatypes ((array!70573 0))(
  ( (array!70574 (arr!33954 (Array (_ BitVec 32) (_ BitVec 64))) (size!34491 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70573)

(declare-fun array_inv!26220 (array!70573) Bool)

(assert (=> start!96390 (array_inv!26220 _keys!1070)))

(declare-datatypes ((V!40873 0))(
  ( (V!40874 (val!13461 Int)) )
))
(declare-datatypes ((ValueCell!12695 0))(
  ( (ValueCellFull!12695 (v!16078 V!40873)) (EmptyCell!12695) )
))
(declare-datatypes ((array!70575 0))(
  ( (array!70576 (arr!33955 (Array (_ BitVec 32) ValueCell!12695)) (size!34492 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70575)

(declare-fun e!624229 () Bool)

(declare-fun array_inv!26221 (array!70575) Bool)

(assert (=> start!96390 (and (array_inv!26221 _values!874) e!624229)))

(declare-fun b!1092830 () Bool)

(declare-fun e!624226 () Bool)

(declare-fun e!624230 () Bool)

(assert (=> b!1092830 (= e!624226 (not e!624230))))

(declare-fun res!728773 () Bool)

(assert (=> b!1092830 (=> res!728773 e!624230)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092830 (= res!728773 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17124 0))(
  ( (tuple2!17125 (_1!8573 (_ BitVec 64)) (_2!8573 V!40873)) )
))
(declare-datatypes ((List!23717 0))(
  ( (Nil!23714) (Cons!23713 (h!24931 tuple2!17124) (t!33574 List!23717)) )
))
(declare-datatypes ((ListLongMap!15101 0))(
  ( (ListLongMap!15102 (toList!7566 List!23717)) )
))
(declare-fun lt!487998 () ListLongMap!15101)

(declare-fun minValue!831 () V!40873)

(declare-fun zeroValue!831 () V!40873)

(declare-fun getCurrentListMap!4316 (array!70573 array!70575 (_ BitVec 32) (_ BitVec 32) V!40873 V!40873 (_ BitVec 32) Int) ListLongMap!15101)

(assert (=> b!1092830 (= lt!487998 (getCurrentListMap!4316 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487999 () array!70575)

(declare-fun lt!487997 () ListLongMap!15101)

(declare-fun lt!487996 () array!70573)

(assert (=> b!1092830 (= lt!487997 (getCurrentListMap!4316 lt!487996 lt!487999 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487995 () ListLongMap!15101)

(declare-fun lt!488001 () ListLongMap!15101)

(assert (=> b!1092830 (and (= lt!487995 lt!488001) (= lt!488001 lt!487995))))

(declare-fun lt!487992 () ListLongMap!15101)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!871 (ListLongMap!15101 (_ BitVec 64)) ListLongMap!15101)

(assert (=> b!1092830 (= lt!488001 (-!871 lt!487992 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35909 0))(
  ( (Unit!35910) )
))
(declare-fun lt!488004 () Unit!35909)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!145 (array!70573 array!70575 (_ BitVec 32) (_ BitVec 32) V!40873 V!40873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35909)

(assert (=> b!1092830 (= lt!488004 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!145 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4121 (array!70573 array!70575 (_ BitVec 32) (_ BitVec 32) V!40873 V!40873 (_ BitVec 32) Int) ListLongMap!15101)

(assert (=> b!1092830 (= lt!487995 (getCurrentListMapNoExtraKeys!4121 lt!487996 lt!487999 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2242 (Int (_ BitVec 64)) V!40873)

(assert (=> b!1092830 (= lt!487999 (array!70576 (store (arr!33955 _values!874) i!650 (ValueCellFull!12695 (dynLambda!2242 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34492 _values!874)))))

(assert (=> b!1092830 (= lt!487992 (getCurrentListMapNoExtraKeys!4121 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092830 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487994 () Unit!35909)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70573 (_ BitVec 64) (_ BitVec 32)) Unit!35909)

(assert (=> b!1092830 (= lt!487994 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092831 () Bool)

(declare-fun res!728779 () Bool)

(assert (=> b!1092831 (=> (not res!728779) (not e!624228))))

(declare-datatypes ((List!23718 0))(
  ( (Nil!23715) (Cons!23714 (h!24932 (_ BitVec 64)) (t!33575 List!23718)) )
))
(declare-fun arrayNoDuplicates!0 (array!70573 (_ BitVec 32) List!23718) Bool)

(assert (=> b!1092831 (= res!728779 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23715))))

(declare-fun b!1092832 () Bool)

(declare-fun e!624231 () Bool)

(assert (=> b!1092832 (= e!624231 tp_is_empty!26809)))

(declare-fun b!1092833 () Bool)

(declare-fun res!728781 () Bool)

(assert (=> b!1092833 (=> (not res!728781) (not e!624228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092833 (= res!728781 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41968 () Bool)

(declare-fun mapRes!41968 () Bool)

(assert (=> mapIsEmpty!41968 mapRes!41968))

(declare-fun b!1092834 () Bool)

(assert (=> b!1092834 (= e!624228 e!624226)))

(declare-fun res!728774 () Bool)

(assert (=> b!1092834 (=> (not res!728774) (not e!624226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70573 (_ BitVec 32)) Bool)

(assert (=> b!1092834 (= res!728774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487996 mask!1414))))

(assert (=> b!1092834 (= lt!487996 (array!70574 (store (arr!33954 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34491 _keys!1070)))))

(declare-fun mapNonEmpty!41968 () Bool)

(declare-fun tp!80270 () Bool)

(assert (=> mapNonEmpty!41968 (= mapRes!41968 (and tp!80270 e!624231))))

(declare-fun mapRest!41968 () (Array (_ BitVec 32) ValueCell!12695))

(declare-fun mapValue!41968 () ValueCell!12695)

(declare-fun mapKey!41968 () (_ BitVec 32))

(assert (=> mapNonEmpty!41968 (= (arr!33955 _values!874) (store mapRest!41968 mapKey!41968 mapValue!41968))))

(declare-fun b!1092835 () Bool)

(declare-fun e!624232 () Bool)

(assert (=> b!1092835 (= e!624230 e!624232)))

(declare-fun res!728775 () Bool)

(assert (=> b!1092835 (=> res!728775 e!624232)))

(assert (=> b!1092835 (= res!728775 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!487993 () ListLongMap!15101)

(assert (=> b!1092835 (= lt!487998 lt!487993)))

(declare-fun lt!488003 () tuple2!17124)

(declare-fun +!3381 (ListLongMap!15101 tuple2!17124) ListLongMap!15101)

(assert (=> b!1092835 (= lt!487993 (+!3381 lt!487992 lt!488003))))

(declare-fun lt!488002 () ListLongMap!15101)

(assert (=> b!1092835 (= lt!487997 lt!488002)))

(assert (=> b!1092835 (= lt!488002 (+!3381 lt!488001 lt!488003))))

(assert (=> b!1092835 (= lt!487997 (+!3381 lt!487995 lt!488003))))

(assert (=> b!1092835 (= lt!488003 (tuple2!17125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092836 () Bool)

(declare-fun res!728777 () Bool)

(assert (=> b!1092836 (=> (not res!728777) (not e!624228))))

(assert (=> b!1092836 (= res!728777 (= (select (arr!33954 _keys!1070) i!650) k0!904))))

(declare-fun b!1092837 () Bool)

(declare-fun res!728780 () Bool)

(assert (=> b!1092837 (=> (not res!728780) (not e!624226))))

(assert (=> b!1092837 (= res!728780 (arrayNoDuplicates!0 lt!487996 #b00000000000000000000000000000000 Nil!23715))))

(declare-fun b!1092838 () Bool)

(declare-fun res!728771 () Bool)

(assert (=> b!1092838 (=> (not res!728771) (not e!624228))))

(assert (=> b!1092838 (= res!728771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092839 () Bool)

(assert (=> b!1092839 (= e!624232 true)))

(assert (=> b!1092839 (= (-!871 lt!487993 k0!904) lt!488002)))

(declare-fun lt!488000 () Unit!35909)

(declare-fun addRemoveCommutativeForDiffKeys!104 (ListLongMap!15101 (_ BitVec 64) V!40873 (_ BitVec 64)) Unit!35909)

(assert (=> b!1092839 (= lt!488000 (addRemoveCommutativeForDiffKeys!104 lt!487992 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1092840 () Bool)

(declare-fun res!728778 () Bool)

(assert (=> b!1092840 (=> (not res!728778) (not e!624228))))

(assert (=> b!1092840 (= res!728778 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34491 _keys!1070))))))

(declare-fun b!1092841 () Bool)

(declare-fun res!728772 () Bool)

(assert (=> b!1092841 (=> (not res!728772) (not e!624228))))

(assert (=> b!1092841 (= res!728772 (and (= (size!34492 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34491 _keys!1070) (size!34492 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092842 () Bool)

(declare-fun e!624227 () Bool)

(assert (=> b!1092842 (= e!624227 tp_is_empty!26809)))

(declare-fun b!1092843 () Bool)

(assert (=> b!1092843 (= e!624229 (and e!624227 mapRes!41968))))

(declare-fun condMapEmpty!41968 () Bool)

(declare-fun mapDefault!41968 () ValueCell!12695)

(assert (=> b!1092843 (= condMapEmpty!41968 (= (arr!33955 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12695)) mapDefault!41968)))))

(assert (= (and start!96390 res!728776) b!1092841))

(assert (= (and b!1092841 res!728772) b!1092838))

(assert (= (and b!1092838 res!728771) b!1092831))

(assert (= (and b!1092831 res!728779) b!1092840))

(assert (= (and b!1092840 res!728778) b!1092833))

(assert (= (and b!1092833 res!728781) b!1092836))

(assert (= (and b!1092836 res!728777) b!1092834))

(assert (= (and b!1092834 res!728774) b!1092837))

(assert (= (and b!1092837 res!728780) b!1092830))

(assert (= (and b!1092830 (not res!728773)) b!1092835))

(assert (= (and b!1092835 (not res!728775)) b!1092839))

(assert (= (and b!1092843 condMapEmpty!41968) mapIsEmpty!41968))

(assert (= (and b!1092843 (not condMapEmpty!41968)) mapNonEmpty!41968))

(get-info :version)

(assert (= (and mapNonEmpty!41968 ((_ is ValueCellFull!12695) mapValue!41968)) b!1092832))

(assert (= (and b!1092843 ((_ is ValueCellFull!12695) mapDefault!41968)) b!1092842))

(assert (= start!96390 b!1092843))

(declare-fun b_lambda!17487 () Bool)

(assert (=> (not b_lambda!17487) (not b!1092830)))

(declare-fun t!33573 () Bool)

(declare-fun tb!7677 () Bool)

(assert (=> (and start!96390 (= defaultEntry!882 defaultEntry!882) t!33573) tb!7677))

(declare-fun result!15881 () Bool)

(assert (=> tb!7677 (= result!15881 tp_is_empty!26809)))

(assert (=> b!1092830 t!33573))

(declare-fun b_and!36301 () Bool)

(assert (= b_and!36299 (and (=> t!33573 result!15881) b_and!36301)))

(declare-fun m!1012775 () Bool)

(assert (=> mapNonEmpty!41968 m!1012775))

(declare-fun m!1012777 () Bool)

(assert (=> b!1092833 m!1012777))

(declare-fun m!1012779 () Bool)

(assert (=> b!1092836 m!1012779))

(declare-fun m!1012781 () Bool)

(assert (=> b!1092831 m!1012781))

(declare-fun m!1012783 () Bool)

(assert (=> b!1092830 m!1012783))

(declare-fun m!1012785 () Bool)

(assert (=> b!1092830 m!1012785))

(declare-fun m!1012787 () Bool)

(assert (=> b!1092830 m!1012787))

(declare-fun m!1012789 () Bool)

(assert (=> b!1092830 m!1012789))

(declare-fun m!1012791 () Bool)

(assert (=> b!1092830 m!1012791))

(declare-fun m!1012793 () Bool)

(assert (=> b!1092830 m!1012793))

(declare-fun m!1012795 () Bool)

(assert (=> b!1092830 m!1012795))

(declare-fun m!1012797 () Bool)

(assert (=> b!1092830 m!1012797))

(declare-fun m!1012799 () Bool)

(assert (=> b!1092830 m!1012799))

(declare-fun m!1012801 () Bool)

(assert (=> b!1092830 m!1012801))

(declare-fun m!1012803 () Bool)

(assert (=> b!1092837 m!1012803))

(declare-fun m!1012805 () Bool)

(assert (=> b!1092839 m!1012805))

(declare-fun m!1012807 () Bool)

(assert (=> b!1092839 m!1012807))

(declare-fun m!1012809 () Bool)

(assert (=> start!96390 m!1012809))

(declare-fun m!1012811 () Bool)

(assert (=> start!96390 m!1012811))

(declare-fun m!1012813 () Bool)

(assert (=> start!96390 m!1012813))

(declare-fun m!1012815 () Bool)

(assert (=> b!1092838 m!1012815))

(declare-fun m!1012817 () Bool)

(assert (=> b!1092835 m!1012817))

(declare-fun m!1012819 () Bool)

(assert (=> b!1092835 m!1012819))

(declare-fun m!1012821 () Bool)

(assert (=> b!1092835 m!1012821))

(declare-fun m!1012823 () Bool)

(assert (=> b!1092834 m!1012823))

(declare-fun m!1012825 () Bool)

(assert (=> b!1092834 m!1012825))

(check-sat (not b!1092835) (not b!1092834) tp_is_empty!26809 (not b_lambda!17487) (not b!1092831) (not b!1092839) (not b!1092833) (not b!1092838) (not start!96390) (not b!1092837) (not mapNonEmpty!41968) (not b!1092830) (not b_next!22807) b_and!36301)
(check-sat b_and!36301 (not b_next!22807))
