; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95748 () Bool)

(assert start!95748)

(declare-fun b_free!22401 () Bool)

(declare-fun b_next!22401 () Bool)

(assert (=> start!95748 (= b_free!22401 (not b_next!22401))))

(declare-fun tp!79051 () Bool)

(declare-fun b_and!35477 () Bool)

(assert (=> start!95748 (= tp!79051 b_and!35477)))

(declare-fun b!1082831 () Bool)

(declare-fun res!721811 () Bool)

(declare-fun e!618786 () Bool)

(assert (=> b!1082831 (=> (not res!721811) (not e!618786))))

(declare-datatypes ((array!69751 0))(
  ( (array!69752 (arr!33549 (Array (_ BitVec 32) (_ BitVec 64))) (size!34085 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69751)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082831 (= res!721811 (= (select (arr!33549 _keys!1070) i!650) k0!904))))

(declare-fun b!1082832 () Bool)

(declare-fun res!721815 () Bool)

(assert (=> b!1082832 (=> (not res!721815) (not e!618786))))

(assert (=> b!1082832 (= res!721815 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34085 _keys!1070))))))

(declare-fun b!1082833 () Bool)

(declare-fun e!618789 () Bool)

(declare-fun tp_is_empty!26403 () Bool)

(assert (=> b!1082833 (= e!618789 tp_is_empty!26403)))

(declare-fun b!1082834 () Bool)

(declare-fun res!721810 () Bool)

(assert (=> b!1082834 (=> (not res!721810) (not e!618786))))

(declare-datatypes ((List!23385 0))(
  ( (Nil!23382) (Cons!23381 (h!24590 (_ BitVec 64)) (t!32844 List!23385)) )
))
(declare-fun arrayNoDuplicates!0 (array!69751 (_ BitVec 32) List!23385) Bool)

(assert (=> b!1082834 (= res!721810 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23382))))

(declare-fun mapIsEmpty!41359 () Bool)

(declare-fun mapRes!41359 () Bool)

(assert (=> mapIsEmpty!41359 mapRes!41359))

(declare-fun b!1082835 () Bool)

(declare-fun res!721812 () Bool)

(assert (=> b!1082835 (=> (not res!721812) (not e!618786))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40331 0))(
  ( (V!40332 (val!13258 Int)) )
))
(declare-datatypes ((ValueCell!12492 0))(
  ( (ValueCellFull!12492 (v!15879 V!40331)) (EmptyCell!12492) )
))
(declare-datatypes ((array!69753 0))(
  ( (array!69754 (arr!33550 (Array (_ BitVec 32) ValueCell!12492)) (size!34086 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69753)

(assert (=> b!1082835 (= res!721812 (and (= (size!34086 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34085 _keys!1070) (size!34086 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082837 () Bool)

(declare-fun res!721817 () Bool)

(assert (=> b!1082837 (=> (not res!721817) (not e!618786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082837 (= res!721817 (validKeyInArray!0 k0!904))))

(declare-fun b!1082838 () Bool)

(declare-fun e!618788 () Bool)

(assert (=> b!1082838 (= e!618788 (and e!618789 mapRes!41359))))

(declare-fun condMapEmpty!41359 () Bool)

(declare-fun mapDefault!41359 () ValueCell!12492)

(assert (=> b!1082838 (= condMapEmpty!41359 (= (arr!33550 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12492)) mapDefault!41359)))))

(declare-fun b!1082839 () Bool)

(declare-fun e!618791 () Bool)

(assert (=> b!1082839 (= e!618791 tp_is_empty!26403)))

(declare-fun b!1082840 () Bool)

(declare-fun e!618790 () Bool)

(assert (=> b!1082840 (= e!618786 e!618790)))

(declare-fun res!721816 () Bool)

(assert (=> b!1082840 (=> (not res!721816) (not e!618790))))

(declare-fun lt!479791 () array!69751)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69751 (_ BitVec 32)) Bool)

(assert (=> b!1082840 (= res!721816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479791 mask!1414))))

(assert (=> b!1082840 (= lt!479791 (array!69752 (store (arr!33549 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34085 _keys!1070)))))

(declare-fun b!1082841 () Bool)

(assert (=> b!1082841 (= e!618790 (not true))))

(declare-datatypes ((tuple2!16798 0))(
  ( (tuple2!16799 (_1!8410 (_ BitVec 64)) (_2!8410 V!40331)) )
))
(declare-datatypes ((List!23386 0))(
  ( (Nil!23383) (Cons!23382 (h!24591 tuple2!16798) (t!32845 List!23386)) )
))
(declare-datatypes ((ListLongMap!14767 0))(
  ( (ListLongMap!14768 (toList!7399 List!23386)) )
))
(declare-fun lt!479787 () ListLongMap!14767)

(declare-fun lt!479789 () ListLongMap!14767)

(assert (=> b!1082841 (and (= lt!479787 lt!479789) (= lt!479789 lt!479787))))

(declare-fun lt!479786 () ListLongMap!14767)

(declare-fun -!726 (ListLongMap!14767 (_ BitVec 64)) ListLongMap!14767)

(assert (=> b!1082841 (= lt!479789 (-!726 lt!479786 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40331)

(declare-datatypes ((Unit!35618 0))(
  ( (Unit!35619) )
))
(declare-fun lt!479788 () Unit!35618)

(declare-fun zeroValue!831 () V!40331)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!6 (array!69751 array!69753 (_ BitVec 32) (_ BitVec 32) V!40331 V!40331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35618)

(assert (=> b!1082841 (= lt!479788 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!6 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3947 (array!69751 array!69753 (_ BitVec 32) (_ BitVec 32) V!40331 V!40331 (_ BitVec 32) Int) ListLongMap!14767)

(declare-fun dynLambda!2084 (Int (_ BitVec 64)) V!40331)

(assert (=> b!1082841 (= lt!479787 (getCurrentListMapNoExtraKeys!3947 lt!479791 (array!69754 (store (arr!33550 _values!874) i!650 (ValueCellFull!12492 (dynLambda!2084 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34086 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082841 (= lt!479786 (getCurrentListMapNoExtraKeys!3947 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082841 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479790 () Unit!35618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69751 (_ BitVec 64) (_ BitVec 32)) Unit!35618)

(assert (=> b!1082841 (= lt!479790 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082836 () Bool)

(declare-fun res!721814 () Bool)

(assert (=> b!1082836 (=> (not res!721814) (not e!618786))))

(assert (=> b!1082836 (= res!721814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!721818 () Bool)

(assert (=> start!95748 (=> (not res!721818) (not e!618786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95748 (= res!721818 (validMask!0 mask!1414))))

(assert (=> start!95748 e!618786))

(assert (=> start!95748 tp!79051))

(assert (=> start!95748 true))

(assert (=> start!95748 tp_is_empty!26403))

(declare-fun array_inv!25894 (array!69751) Bool)

(assert (=> start!95748 (array_inv!25894 _keys!1070)))

(declare-fun array_inv!25895 (array!69753) Bool)

(assert (=> start!95748 (and (array_inv!25895 _values!874) e!618788)))

(declare-fun mapNonEmpty!41359 () Bool)

(declare-fun tp!79052 () Bool)

(assert (=> mapNonEmpty!41359 (= mapRes!41359 (and tp!79052 e!618791))))

(declare-fun mapRest!41359 () (Array (_ BitVec 32) ValueCell!12492))

(declare-fun mapValue!41359 () ValueCell!12492)

(declare-fun mapKey!41359 () (_ BitVec 32))

(assert (=> mapNonEmpty!41359 (= (arr!33550 _values!874) (store mapRest!41359 mapKey!41359 mapValue!41359))))

(declare-fun b!1082842 () Bool)

(declare-fun res!721813 () Bool)

(assert (=> b!1082842 (=> (not res!721813) (not e!618790))))

(assert (=> b!1082842 (= res!721813 (arrayNoDuplicates!0 lt!479791 #b00000000000000000000000000000000 Nil!23382))))

(assert (= (and start!95748 res!721818) b!1082835))

(assert (= (and b!1082835 res!721812) b!1082836))

(assert (= (and b!1082836 res!721814) b!1082834))

(assert (= (and b!1082834 res!721810) b!1082832))

(assert (= (and b!1082832 res!721815) b!1082837))

(assert (= (and b!1082837 res!721817) b!1082831))

(assert (= (and b!1082831 res!721811) b!1082840))

(assert (= (and b!1082840 res!721816) b!1082842))

(assert (= (and b!1082842 res!721813) b!1082841))

(assert (= (and b!1082838 condMapEmpty!41359) mapIsEmpty!41359))

(assert (= (and b!1082838 (not condMapEmpty!41359)) mapNonEmpty!41359))

(get-info :version)

(assert (= (and mapNonEmpty!41359 ((_ is ValueCellFull!12492) mapValue!41359)) b!1082839))

(assert (= (and b!1082838 ((_ is ValueCellFull!12492) mapDefault!41359)) b!1082833))

(assert (= start!95748 b!1082838))

(declare-fun b_lambda!17071 () Bool)

(assert (=> (not b_lambda!17071) (not b!1082841)))

(declare-fun t!32843 () Bool)

(declare-fun tb!7279 () Bool)

(assert (=> (and start!95748 (= defaultEntry!882 defaultEntry!882) t!32843) tb!7279))

(declare-fun result!15077 () Bool)

(assert (=> tb!7279 (= result!15077 tp_is_empty!26403)))

(assert (=> b!1082841 t!32843))

(declare-fun b_and!35479 () Bool)

(assert (= b_and!35477 (and (=> t!32843 result!15077) b_and!35479)))

(declare-fun m!1000503 () Bool)

(assert (=> mapNonEmpty!41359 m!1000503))

(declare-fun m!1000505 () Bool)

(assert (=> b!1082840 m!1000505))

(declare-fun m!1000507 () Bool)

(assert (=> b!1082840 m!1000507))

(declare-fun m!1000509 () Bool)

(assert (=> b!1082842 m!1000509))

(declare-fun m!1000511 () Bool)

(assert (=> b!1082831 m!1000511))

(declare-fun m!1000513 () Bool)

(assert (=> b!1082836 m!1000513))

(declare-fun m!1000515 () Bool)

(assert (=> b!1082837 m!1000515))

(declare-fun m!1000517 () Bool)

(assert (=> b!1082841 m!1000517))

(declare-fun m!1000519 () Bool)

(assert (=> b!1082841 m!1000519))

(declare-fun m!1000521 () Bool)

(assert (=> b!1082841 m!1000521))

(declare-fun m!1000523 () Bool)

(assert (=> b!1082841 m!1000523))

(declare-fun m!1000525 () Bool)

(assert (=> b!1082841 m!1000525))

(declare-fun m!1000527 () Bool)

(assert (=> b!1082841 m!1000527))

(declare-fun m!1000529 () Bool)

(assert (=> b!1082841 m!1000529))

(declare-fun m!1000531 () Bool)

(assert (=> b!1082841 m!1000531))

(declare-fun m!1000533 () Bool)

(assert (=> start!95748 m!1000533))

(declare-fun m!1000535 () Bool)

(assert (=> start!95748 m!1000535))

(declare-fun m!1000537 () Bool)

(assert (=> start!95748 m!1000537))

(declare-fun m!1000539 () Bool)

(assert (=> b!1082834 m!1000539))

(check-sat (not b!1082841) (not b!1082834) (not b!1082836) (not mapNonEmpty!41359) (not b!1082842) (not start!95748) (not b!1082837) (not b_lambda!17071) b_and!35479 tp_is_empty!26403 (not b_next!22401) (not b!1082840))
(check-sat b_and!35479 (not b_next!22401))
