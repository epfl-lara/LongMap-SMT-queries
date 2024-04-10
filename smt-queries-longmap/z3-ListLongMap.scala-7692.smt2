; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96552 () Bool)

(assert start!96552)

(declare-fun b_free!23079 () Bool)

(declare-fun b_next!23079 () Bool)

(assert (=> start!96552 (= b_free!23079 (not b_next!23079))))

(declare-fun tp!81170 () Bool)

(declare-fun b_and!36849 () Bool)

(assert (=> start!96552 (= tp!81170 b_and!36849)))

(declare-fun b!1098016 () Bool)

(declare-fun e!626695 () Bool)

(declare-fun e!626696 () Bool)

(declare-fun mapRes!42460 () Bool)

(assert (=> b!1098016 (= e!626695 (and e!626696 mapRes!42460))))

(declare-fun condMapEmpty!42460 () Bool)

(declare-datatypes ((V!41299 0))(
  ( (V!41300 (val!13621 Int)) )
))
(declare-datatypes ((ValueCell!12855 0))(
  ( (ValueCellFull!12855 (v!16244 V!41299)) (EmptyCell!12855) )
))
(declare-datatypes ((array!71171 0))(
  ( (array!71172 (arr!34255 (Array (_ BitVec 32) ValueCell!12855)) (size!34791 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71171)

(declare-fun mapDefault!42460 () ValueCell!12855)

(assert (=> b!1098016 (= condMapEmpty!42460 (= (arr!34255 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12855)) mapDefault!42460)))))

(declare-fun b!1098017 () Bool)

(declare-fun res!732801 () Bool)

(declare-fun e!626697 () Bool)

(assert (=> b!1098017 (=> (not res!732801) (not e!626697))))

(declare-datatypes ((array!71173 0))(
  ( (array!71174 (arr!34256 (Array (_ BitVec 32) (_ BitVec 64))) (size!34792 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71173)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098017 (= res!732801 (= (select (arr!34256 _keys!1070) i!650) k0!904))))

(declare-fun b!1098018 () Bool)

(declare-fun res!732797 () Bool)

(assert (=> b!1098018 (=> (not res!732797) (not e!626697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098018 (= res!732797 (validKeyInArray!0 k0!904))))

(declare-datatypes ((tuple2!17300 0))(
  ( (tuple2!17301 (_1!8661 (_ BitVec 64)) (_2!8661 V!41299)) )
))
(declare-fun lt!491030 () tuple2!17300)

(declare-fun b!1098019 () Bool)

(declare-fun lt!491023 () tuple2!17300)

(declare-datatypes ((List!23921 0))(
  ( (Nil!23918) (Cons!23917 (h!25126 tuple2!17300) (t!34046 List!23921)) )
))
(declare-datatypes ((ListLongMap!15269 0))(
  ( (ListLongMap!15270 (toList!7650 List!23921)) )
))
(declare-fun lt!491022 () ListLongMap!15269)

(declare-fun lt!491025 () ListLongMap!15269)

(declare-fun e!626694 () Bool)

(declare-fun +!3359 (ListLongMap!15269 tuple2!17300) ListLongMap!15269)

(assert (=> b!1098019 (= e!626694 (= lt!491025 (+!3359 (+!3359 lt!491022 lt!491023) lt!491030)))))

(declare-fun e!626698 () Bool)

(assert (=> b!1098019 e!626698))

(declare-fun res!732802 () Bool)

(assert (=> b!1098019 (=> (not res!732802) (not e!626698))))

(declare-fun lt!491021 () ListLongMap!15269)

(assert (=> b!1098019 (= res!732802 (= lt!491025 (+!3359 (+!3359 lt!491021 lt!491023) lt!491030)))))

(declare-fun minValue!831 () V!41299)

(assert (=> b!1098019 (= lt!491030 (tuple2!17301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!41299)

(assert (=> b!1098019 (= lt!491023 (tuple2!17301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098020 () Bool)

(declare-fun e!626692 () Bool)

(assert (=> b!1098020 (= e!626692 (not e!626694))))

(declare-fun res!732804 () Bool)

(assert (=> b!1098020 (=> res!732804 e!626694)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098020 (= res!732804 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!491024 () ListLongMap!15269)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun getCurrentListMap!4370 (array!71173 array!71171 (_ BitVec 32) (_ BitVec 32) V!41299 V!41299 (_ BitVec 32) Int) ListLongMap!15269)

(assert (=> b!1098020 (= lt!491024 (getCurrentListMap!4370 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491026 () array!71173)

(declare-fun lt!491031 () array!71171)

(assert (=> b!1098020 (= lt!491025 (getCurrentListMap!4370 lt!491026 lt!491031 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1098020 (and (= lt!491021 lt!491022) (= lt!491022 lt!491021))))

(declare-fun lt!491027 () ListLongMap!15269)

(declare-fun -!940 (ListLongMap!15269 (_ BitVec 64)) ListLongMap!15269)

(assert (=> b!1098020 (= lt!491022 (-!940 lt!491027 k0!904))))

(declare-datatypes ((Unit!36116 0))(
  ( (Unit!36117) )
))
(declare-fun lt!491029 () Unit!36116)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!196 (array!71173 array!71171 (_ BitVec 32) (_ BitVec 32) V!41299 V!41299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36116)

(assert (=> b!1098020 (= lt!491029 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!196 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4166 (array!71173 array!71171 (_ BitVec 32) (_ BitVec 32) V!41299 V!41299 (_ BitVec 32) Int) ListLongMap!15269)

(assert (=> b!1098020 (= lt!491021 (getCurrentListMapNoExtraKeys!4166 lt!491026 lt!491031 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2301 (Int (_ BitVec 64)) V!41299)

(assert (=> b!1098020 (= lt!491031 (array!71172 (store (arr!34255 _values!874) i!650 (ValueCellFull!12855 (dynLambda!2301 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34791 _values!874)))))

(assert (=> b!1098020 (= lt!491027 (getCurrentListMapNoExtraKeys!4166 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098020 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491028 () Unit!36116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71173 (_ BitVec 64) (_ BitVec 32)) Unit!36116)

(assert (=> b!1098020 (= lt!491028 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098022 () Bool)

(assert (=> b!1098022 (= e!626698 (= lt!491024 (+!3359 (+!3359 lt!491027 lt!491023) lt!491030)))))

(declare-fun b!1098023 () Bool)

(declare-fun tp_is_empty!27129 () Bool)

(assert (=> b!1098023 (= e!626696 tp_is_empty!27129)))

(declare-fun b!1098024 () Bool)

(declare-fun res!732800 () Bool)

(assert (=> b!1098024 (=> (not res!732800) (not e!626697))))

(assert (=> b!1098024 (= res!732800 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34792 _keys!1070))))))

(declare-fun mapIsEmpty!42460 () Bool)

(assert (=> mapIsEmpty!42460 mapRes!42460))

(declare-fun b!1098025 () Bool)

(declare-fun res!732796 () Bool)

(assert (=> b!1098025 (=> (not res!732796) (not e!626697))))

(assert (=> b!1098025 (= res!732796 (and (= (size!34791 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34792 _keys!1070) (size!34791 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098026 () Bool)

(declare-fun res!732799 () Bool)

(assert (=> b!1098026 (=> (not res!732799) (not e!626697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71173 (_ BitVec 32)) Bool)

(assert (=> b!1098026 (= res!732799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098021 () Bool)

(declare-fun res!732794 () Bool)

(assert (=> b!1098021 (=> (not res!732794) (not e!626692))))

(declare-datatypes ((List!23922 0))(
  ( (Nil!23919) (Cons!23918 (h!25127 (_ BitVec 64)) (t!34047 List!23922)) )
))
(declare-fun arrayNoDuplicates!0 (array!71173 (_ BitVec 32) List!23922) Bool)

(assert (=> b!1098021 (= res!732794 (arrayNoDuplicates!0 lt!491026 #b00000000000000000000000000000000 Nil!23919))))

(declare-fun res!732803 () Bool)

(assert (=> start!96552 (=> (not res!732803) (not e!626697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96552 (= res!732803 (validMask!0 mask!1414))))

(assert (=> start!96552 e!626697))

(assert (=> start!96552 tp!81170))

(assert (=> start!96552 true))

(assert (=> start!96552 tp_is_empty!27129))

(declare-fun array_inv!26390 (array!71173) Bool)

(assert (=> start!96552 (array_inv!26390 _keys!1070)))

(declare-fun array_inv!26391 (array!71171) Bool)

(assert (=> start!96552 (and (array_inv!26391 _values!874) e!626695)))

(declare-fun b!1098027 () Bool)

(assert (=> b!1098027 (= e!626697 e!626692)))

(declare-fun res!732795 () Bool)

(assert (=> b!1098027 (=> (not res!732795) (not e!626692))))

(assert (=> b!1098027 (= res!732795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491026 mask!1414))))

(assert (=> b!1098027 (= lt!491026 (array!71174 (store (arr!34256 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34792 _keys!1070)))))

(declare-fun mapNonEmpty!42460 () Bool)

(declare-fun tp!81169 () Bool)

(declare-fun e!626699 () Bool)

(assert (=> mapNonEmpty!42460 (= mapRes!42460 (and tp!81169 e!626699))))

(declare-fun mapRest!42460 () (Array (_ BitVec 32) ValueCell!12855))

(declare-fun mapKey!42460 () (_ BitVec 32))

(declare-fun mapValue!42460 () ValueCell!12855)

(assert (=> mapNonEmpty!42460 (= (arr!34255 _values!874) (store mapRest!42460 mapKey!42460 mapValue!42460))))

(declare-fun b!1098028 () Bool)

(assert (=> b!1098028 (= e!626699 tp_is_empty!27129)))

(declare-fun b!1098029 () Bool)

(declare-fun res!732798 () Bool)

(assert (=> b!1098029 (=> (not res!732798) (not e!626697))))

(assert (=> b!1098029 (= res!732798 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23919))))

(assert (= (and start!96552 res!732803) b!1098025))

(assert (= (and b!1098025 res!732796) b!1098026))

(assert (= (and b!1098026 res!732799) b!1098029))

(assert (= (and b!1098029 res!732798) b!1098024))

(assert (= (and b!1098024 res!732800) b!1098018))

(assert (= (and b!1098018 res!732797) b!1098017))

(assert (= (and b!1098017 res!732801) b!1098027))

(assert (= (and b!1098027 res!732795) b!1098021))

(assert (= (and b!1098021 res!732794) b!1098020))

(assert (= (and b!1098020 (not res!732804)) b!1098019))

(assert (= (and b!1098019 res!732802) b!1098022))

(assert (= (and b!1098016 condMapEmpty!42460) mapIsEmpty!42460))

(assert (= (and b!1098016 (not condMapEmpty!42460)) mapNonEmpty!42460))

(get-info :version)

(assert (= (and mapNonEmpty!42460 ((_ is ValueCellFull!12855) mapValue!42460)) b!1098028))

(assert (= (and b!1098016 ((_ is ValueCellFull!12855) mapDefault!42460)) b!1098023))

(assert (= start!96552 b!1098016))

(declare-fun b_lambda!17797 () Bool)

(assert (=> (not b_lambda!17797) (not b!1098020)))

(declare-fun t!34045 () Bool)

(declare-fun tb!7945 () Bool)

(assert (=> (and start!96552 (= defaultEntry!882 defaultEntry!882) t!34045) tb!7945))

(declare-fun result!16417 () Bool)

(assert (=> tb!7945 (= result!16417 tp_is_empty!27129)))

(assert (=> b!1098020 t!34045))

(declare-fun b_and!36851 () Bool)

(assert (= b_and!36849 (and (=> t!34045 result!16417) b_and!36851)))

(declare-fun m!1017585 () Bool)

(assert (=> b!1098029 m!1017585))

(declare-fun m!1017587 () Bool)

(assert (=> b!1098026 m!1017587))

(declare-fun m!1017589 () Bool)

(assert (=> b!1098027 m!1017589))

(declare-fun m!1017591 () Bool)

(assert (=> b!1098027 m!1017591))

(declare-fun m!1017593 () Bool)

(assert (=> b!1098021 m!1017593))

(declare-fun m!1017595 () Bool)

(assert (=> start!96552 m!1017595))

(declare-fun m!1017597 () Bool)

(assert (=> start!96552 m!1017597))

(declare-fun m!1017599 () Bool)

(assert (=> start!96552 m!1017599))

(declare-fun m!1017601 () Bool)

(assert (=> b!1098020 m!1017601))

(declare-fun m!1017603 () Bool)

(assert (=> b!1098020 m!1017603))

(declare-fun m!1017605 () Bool)

(assert (=> b!1098020 m!1017605))

(declare-fun m!1017607 () Bool)

(assert (=> b!1098020 m!1017607))

(declare-fun m!1017609 () Bool)

(assert (=> b!1098020 m!1017609))

(declare-fun m!1017611 () Bool)

(assert (=> b!1098020 m!1017611))

(declare-fun m!1017613 () Bool)

(assert (=> b!1098020 m!1017613))

(declare-fun m!1017615 () Bool)

(assert (=> b!1098020 m!1017615))

(declare-fun m!1017617 () Bool)

(assert (=> b!1098020 m!1017617))

(declare-fun m!1017619 () Bool)

(assert (=> b!1098020 m!1017619))

(declare-fun m!1017621 () Bool)

(assert (=> b!1098019 m!1017621))

(assert (=> b!1098019 m!1017621))

(declare-fun m!1017623 () Bool)

(assert (=> b!1098019 m!1017623))

(declare-fun m!1017625 () Bool)

(assert (=> b!1098019 m!1017625))

(assert (=> b!1098019 m!1017625))

(declare-fun m!1017627 () Bool)

(assert (=> b!1098019 m!1017627))

(declare-fun m!1017629 () Bool)

(assert (=> b!1098018 m!1017629))

(declare-fun m!1017631 () Bool)

(assert (=> b!1098017 m!1017631))

(declare-fun m!1017633 () Bool)

(assert (=> b!1098022 m!1017633))

(assert (=> b!1098022 m!1017633))

(declare-fun m!1017635 () Bool)

(assert (=> b!1098022 m!1017635))

(declare-fun m!1017637 () Bool)

(assert (=> mapNonEmpty!42460 m!1017637))

(check-sat (not b!1098029) tp_is_empty!27129 (not b!1098027) (not b!1098026) (not b!1098021) (not start!96552) b_and!36851 (not mapNonEmpty!42460) (not b!1098018) (not b!1098020) (not b_next!23079) (not b!1098019) (not b!1098022) (not b_lambda!17797))
(check-sat b_and!36851 (not b_next!23079))
