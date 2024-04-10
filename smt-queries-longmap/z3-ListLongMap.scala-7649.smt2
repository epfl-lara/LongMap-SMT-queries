; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96216 () Bool)

(assert start!96216)

(declare-fun b_free!22869 () Bool)

(declare-fun b_next!22869 () Bool)

(assert (=> start!96216 (= b_free!22869 (not b_next!22869))))

(declare-fun tp!80456 () Bool)

(declare-fun b_and!36413 () Bool)

(assert (=> start!96216 (= tp!80456 b_and!36413)))

(declare-fun b!1092785 () Bool)

(declare-fun res!729191 () Bool)

(declare-fun e!624034 () Bool)

(assert (=> b!1092785 (=> (not res!729191) (not e!624034))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70661 0))(
  ( (array!70662 (arr!34004 (Array (_ BitVec 32) (_ BitVec 64))) (size!34540 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70661)

(declare-datatypes ((V!40955 0))(
  ( (V!40956 (val!13492 Int)) )
))
(declare-datatypes ((ValueCell!12726 0))(
  ( (ValueCellFull!12726 (v!16113 V!40955)) (EmptyCell!12726) )
))
(declare-datatypes ((array!70663 0))(
  ( (array!70664 (arr!34005 (Array (_ BitVec 32) ValueCell!12726)) (size!34541 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70663)

(assert (=> b!1092785 (= res!729191 (and (= (size!34541 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34540 _keys!1070) (size!34541 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092786 () Bool)

(declare-fun res!729194 () Bool)

(declare-fun e!624038 () Bool)

(assert (=> b!1092786 (=> (not res!729194) (not e!624038))))

(declare-fun lt!488527 () array!70661)

(declare-datatypes ((List!23755 0))(
  ( (Nil!23752) (Cons!23751 (h!24960 (_ BitVec 64)) (t!33682 List!23755)) )
))
(declare-fun arrayNoDuplicates!0 (array!70661 (_ BitVec 32) List!23755) Bool)

(assert (=> b!1092786 (= res!729194 (arrayNoDuplicates!0 lt!488527 #b00000000000000000000000000000000 Nil!23752))))

(declare-fun res!729196 () Bool)

(assert (=> start!96216 (=> (not res!729196) (not e!624034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96216 (= res!729196 (validMask!0 mask!1414))))

(assert (=> start!96216 e!624034))

(assert (=> start!96216 tp!80456))

(assert (=> start!96216 true))

(declare-fun tp_is_empty!26871 () Bool)

(assert (=> start!96216 tp_is_empty!26871))

(declare-fun array_inv!26212 (array!70661) Bool)

(assert (=> start!96216 (array_inv!26212 _keys!1070)))

(declare-fun e!624036 () Bool)

(declare-fun array_inv!26213 (array!70663) Bool)

(assert (=> start!96216 (and (array_inv!26213 _values!874) e!624036)))

(declare-fun mapNonEmpty!42061 () Bool)

(declare-fun mapRes!42061 () Bool)

(declare-fun tp!80455 () Bool)

(declare-fun e!624033 () Bool)

(assert (=> mapNonEmpty!42061 (= mapRes!42061 (and tp!80455 e!624033))))

(declare-fun mapRest!42061 () (Array (_ BitVec 32) ValueCell!12726))

(declare-fun mapKey!42061 () (_ BitVec 32))

(declare-fun mapValue!42061 () ValueCell!12726)

(assert (=> mapNonEmpty!42061 (= (arr!34005 _values!874) (store mapRest!42061 mapKey!42061 mapValue!42061))))

(declare-fun b!1092787 () Bool)

(declare-fun res!729193 () Bool)

(assert (=> b!1092787 (=> (not res!729193) (not e!624034))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092787 (= res!729193 (validKeyInArray!0 k0!904))))

(declare-fun b!1092788 () Bool)

(assert (=> b!1092788 (= e!624034 e!624038)))

(declare-fun res!729192 () Bool)

(assert (=> b!1092788 (=> (not res!729192) (not e!624038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70661 (_ BitVec 32)) Bool)

(assert (=> b!1092788 (= res!729192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488527 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092788 (= lt!488527 (array!70662 (store (arr!34004 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34540 _keys!1070)))))

(declare-fun b!1092789 () Bool)

(declare-fun e!624037 () Bool)

(assert (=> b!1092789 (= e!624037 tp_is_empty!26871)))

(declare-fun b!1092790 () Bool)

(assert (=> b!1092790 (= e!624033 tp_is_empty!26871)))

(declare-fun b!1092791 () Bool)

(declare-fun res!729190 () Bool)

(assert (=> b!1092791 (=> (not res!729190) (not e!624034))))

(assert (=> b!1092791 (= res!729190 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23752))))

(declare-fun b!1092792 () Bool)

(assert (=> b!1092792 (= e!624036 (and e!624037 mapRes!42061))))

(declare-fun condMapEmpty!42061 () Bool)

(declare-fun mapDefault!42061 () ValueCell!12726)

(assert (=> b!1092792 (= condMapEmpty!42061 (= (arr!34005 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12726)) mapDefault!42061)))))

(declare-fun b!1092793 () Bool)

(declare-fun res!729198 () Bool)

(assert (=> b!1092793 (=> (not res!729198) (not e!624034))))

(assert (=> b!1092793 (= res!729198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092794 () Bool)

(declare-fun res!729197 () Bool)

(assert (=> b!1092794 (=> (not res!729197) (not e!624034))))

(assert (=> b!1092794 (= res!729197 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34540 _keys!1070))))))

(declare-fun b!1092795 () Bool)

(assert (=> b!1092795 (= e!624038 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40955)

(declare-fun zeroValue!831 () V!40955)

(declare-datatypes ((tuple2!17168 0))(
  ( (tuple2!17169 (_1!8595 (_ BitVec 64)) (_2!8595 V!40955)) )
))
(declare-datatypes ((List!23756 0))(
  ( (Nil!23753) (Cons!23752 (h!24961 tuple2!17168) (t!33683 List!23756)) )
))
(declare-datatypes ((ListLongMap!15137 0))(
  ( (ListLongMap!15138 (toList!7584 List!23756)) )
))
(declare-fun lt!488525 () ListLongMap!15137)

(declare-fun getCurrentListMap!4340 (array!70661 array!70663 (_ BitVec 32) (_ BitVec 32) V!40955 V!40955 (_ BitVec 32) Int) ListLongMap!15137)

(assert (=> b!1092795 (= lt!488525 (getCurrentListMap!4340 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488526 () ListLongMap!15137)

(declare-fun lt!488528 () array!70663)

(assert (=> b!1092795 (= lt!488526 (getCurrentListMap!4340 lt!488527 lt!488528 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488524 () ListLongMap!15137)

(declare-fun lt!488529 () ListLongMap!15137)

(assert (=> b!1092795 (and (= lt!488524 lt!488529) (= lt!488529 lt!488524))))

(declare-fun lt!488523 () ListLongMap!15137)

(declare-fun -!903 (ListLongMap!15137 (_ BitVec 64)) ListLongMap!15137)

(assert (=> b!1092795 (= lt!488529 (-!903 lt!488523 k0!904))))

(declare-datatypes ((Unit!35972 0))(
  ( (Unit!35973) )
))
(declare-fun lt!488522 () Unit!35972)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!159 (array!70661 array!70663 (_ BitVec 32) (_ BitVec 32) V!40955 V!40955 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35972)

(assert (=> b!1092795 (= lt!488522 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!159 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4100 (array!70661 array!70663 (_ BitVec 32) (_ BitVec 32) V!40955 V!40955 (_ BitVec 32) Int) ListLongMap!15137)

(assert (=> b!1092795 (= lt!488524 (getCurrentListMapNoExtraKeys!4100 lt!488527 lt!488528 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2237 (Int (_ BitVec 64)) V!40955)

(assert (=> b!1092795 (= lt!488528 (array!70664 (store (arr!34005 _values!874) i!650 (ValueCellFull!12726 (dynLambda!2237 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34541 _values!874)))))

(assert (=> b!1092795 (= lt!488523 (getCurrentListMapNoExtraKeys!4100 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092795 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488530 () Unit!35972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70661 (_ BitVec 64) (_ BitVec 32)) Unit!35972)

(assert (=> b!1092795 (= lt!488530 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42061 () Bool)

(assert (=> mapIsEmpty!42061 mapRes!42061))

(declare-fun b!1092796 () Bool)

(declare-fun res!729195 () Bool)

(assert (=> b!1092796 (=> (not res!729195) (not e!624034))))

(assert (=> b!1092796 (= res!729195 (= (select (arr!34004 _keys!1070) i!650) k0!904))))

(assert (= (and start!96216 res!729196) b!1092785))

(assert (= (and b!1092785 res!729191) b!1092793))

(assert (= (and b!1092793 res!729198) b!1092791))

(assert (= (and b!1092791 res!729190) b!1092794))

(assert (= (and b!1092794 res!729197) b!1092787))

(assert (= (and b!1092787 res!729193) b!1092796))

(assert (= (and b!1092796 res!729195) b!1092788))

(assert (= (and b!1092788 res!729192) b!1092786))

(assert (= (and b!1092786 res!729194) b!1092795))

(assert (= (and b!1092792 condMapEmpty!42061) mapIsEmpty!42061))

(assert (= (and b!1092792 (not condMapEmpty!42061)) mapNonEmpty!42061))

(get-info :version)

(assert (= (and mapNonEmpty!42061 ((_ is ValueCellFull!12726) mapValue!42061)) b!1092790))

(assert (= (and b!1092792 ((_ is ValueCellFull!12726) mapDefault!42061)) b!1092789))

(assert (= start!96216 b!1092792))

(declare-fun b_lambda!17539 () Bool)

(assert (=> (not b_lambda!17539) (not b!1092795)))

(declare-fun t!33681 () Bool)

(declare-fun tb!7747 () Bool)

(assert (=> (and start!96216 (= defaultEntry!882 defaultEntry!882) t!33681) tb!7747))

(declare-fun result!16013 () Bool)

(assert (=> tb!7747 (= result!16013 tp_is_empty!26871)))

(assert (=> b!1092795 t!33681))

(declare-fun b_and!36415 () Bool)

(assert (= b_and!36413 (and (=> t!33681 result!16013) b_and!36415)))

(declare-fun m!1012585 () Bool)

(assert (=> b!1092795 m!1012585))

(declare-fun m!1012587 () Bool)

(assert (=> b!1092795 m!1012587))

(declare-fun m!1012589 () Bool)

(assert (=> b!1092795 m!1012589))

(declare-fun m!1012591 () Bool)

(assert (=> b!1092795 m!1012591))

(declare-fun m!1012593 () Bool)

(assert (=> b!1092795 m!1012593))

(declare-fun m!1012595 () Bool)

(assert (=> b!1092795 m!1012595))

(declare-fun m!1012597 () Bool)

(assert (=> b!1092795 m!1012597))

(declare-fun m!1012599 () Bool)

(assert (=> b!1092795 m!1012599))

(declare-fun m!1012601 () Bool)

(assert (=> b!1092795 m!1012601))

(declare-fun m!1012603 () Bool)

(assert (=> b!1092795 m!1012603))

(declare-fun m!1012605 () Bool)

(assert (=> b!1092791 m!1012605))

(declare-fun m!1012607 () Bool)

(assert (=> b!1092786 m!1012607))

(declare-fun m!1012609 () Bool)

(assert (=> b!1092787 m!1012609))

(declare-fun m!1012611 () Bool)

(assert (=> mapNonEmpty!42061 m!1012611))

(declare-fun m!1012613 () Bool)

(assert (=> b!1092796 m!1012613))

(declare-fun m!1012615 () Bool)

(assert (=> b!1092793 m!1012615))

(declare-fun m!1012617 () Bool)

(assert (=> b!1092788 m!1012617))

(declare-fun m!1012619 () Bool)

(assert (=> b!1092788 m!1012619))

(declare-fun m!1012621 () Bool)

(assert (=> start!96216 m!1012621))

(declare-fun m!1012623 () Bool)

(assert (=> start!96216 m!1012623))

(declare-fun m!1012625 () Bool)

(assert (=> start!96216 m!1012625))

(check-sat (not b!1092795) (not b_next!22869) (not b!1092787) b_and!36415 (not start!96216) (not mapNonEmpty!42061) (not b!1092788) (not b_lambda!17539) (not b!1092793) tp_is_empty!26871 (not b!1092786) (not b!1092791))
(check-sat b_and!36415 (not b_next!22869))
