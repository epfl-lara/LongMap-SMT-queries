; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95638 () Bool)

(assert start!95638)

(declare-fun b_free!22297 () Bool)

(declare-fun b_next!22297 () Bool)

(assert (=> start!95638 (= b_free!22297 (not b_next!22297))))

(declare-fun tp!78740 () Bool)

(declare-fun b_and!35249 () Bool)

(assert (=> start!95638 (= tp!78740 b_and!35249)))

(declare-fun mapNonEmpty!41203 () Bool)

(declare-fun mapRes!41203 () Bool)

(declare-fun tp!78739 () Bool)

(declare-fun e!617757 () Bool)

(assert (=> mapNonEmpty!41203 (= mapRes!41203 (and tp!78739 e!617757))))

(declare-datatypes ((V!40193 0))(
  ( (V!40194 (val!13206 Int)) )
))
(declare-datatypes ((ValueCell!12440 0))(
  ( (ValueCellFull!12440 (v!15826 V!40193)) (EmptyCell!12440) )
))
(declare-datatypes ((array!69478 0))(
  ( (array!69479 (arr!33413 (Array (_ BitVec 32) ValueCell!12440)) (size!33951 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69478)

(declare-fun mapValue!41203 () ValueCell!12440)

(declare-fun mapKey!41203 () (_ BitVec 32))

(declare-fun mapRest!41203 () (Array (_ BitVec 32) ValueCell!12440))

(assert (=> mapNonEmpty!41203 (= (arr!33413 _values!874) (store mapRest!41203 mapKey!41203 mapValue!41203))))

(declare-fun b!1080708 () Bool)

(declare-fun res!720337 () Bool)

(declare-fun e!617762 () Bool)

(assert (=> b!1080708 (=> (not res!720337) (not e!617762))))

(declare-datatypes ((array!69480 0))(
  ( (array!69481 (arr!33414 (Array (_ BitVec 32) (_ BitVec 64))) (size!33952 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69480)

(declare-datatypes ((List!23357 0))(
  ( (Nil!23354) (Cons!23353 (h!24562 (_ BitVec 64)) (t!32707 List!23357)) )
))
(declare-fun arrayNoDuplicates!0 (array!69480 (_ BitVec 32) List!23357) Bool)

(assert (=> b!1080708 (= res!720337 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23354))))

(declare-fun b!1080709 () Bool)

(declare-fun res!720340 () Bool)

(assert (=> b!1080709 (=> (not res!720340) (not e!617762))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080709 (= res!720340 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33952 _keys!1070))))))

(declare-fun b!1080710 () Bool)

(declare-fun res!720344 () Bool)

(assert (=> b!1080710 (=> (not res!720344) (not e!617762))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080710 (= res!720344 (validKeyInArray!0 k0!904))))

(declare-fun b!1080711 () Bool)

(declare-fun res!720342 () Bool)

(assert (=> b!1080711 (=> (not res!720342) (not e!617762))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080711 (= res!720342 (and (= (size!33951 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33952 _keys!1070) (size!33951 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080712 () Bool)

(declare-fun res!720338 () Bool)

(assert (=> b!1080712 (=> (not res!720338) (not e!617762))))

(assert (=> b!1080712 (= res!720338 (= (select (arr!33414 _keys!1070) i!650) k0!904))))

(declare-fun b!1080713 () Bool)

(declare-fun e!617759 () Bool)

(declare-fun tp_is_empty!26299 () Bool)

(assert (=> b!1080713 (= e!617759 tp_is_empty!26299)))

(declare-fun mapIsEmpty!41203 () Bool)

(assert (=> mapIsEmpty!41203 mapRes!41203))

(declare-fun b!1080714 () Bool)

(declare-fun res!720345 () Bool)

(assert (=> b!1080714 (=> (not res!720345) (not e!617762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69480 (_ BitVec 32)) Bool)

(assert (=> b!1080714 (= res!720345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080715 () Bool)

(declare-fun e!617758 () Bool)

(assert (=> b!1080715 (= e!617758 (and e!617759 mapRes!41203))))

(declare-fun condMapEmpty!41203 () Bool)

(declare-fun mapDefault!41203 () ValueCell!12440)

(assert (=> b!1080715 (= condMapEmpty!41203 (= (arr!33413 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12440)) mapDefault!41203)))))

(declare-fun res!720343 () Bool)

(assert (=> start!95638 (=> (not res!720343) (not e!617762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95638 (= res!720343 (validMask!0 mask!1414))))

(assert (=> start!95638 e!617762))

(assert (=> start!95638 tp!78740))

(assert (=> start!95638 true))

(assert (=> start!95638 tp_is_empty!26299))

(declare-fun array_inv!25830 (array!69480) Bool)

(assert (=> start!95638 (array_inv!25830 _keys!1070)))

(declare-fun array_inv!25831 (array!69478) Bool)

(assert (=> start!95638 (and (array_inv!25831 _values!874) e!617758)))

(declare-fun b!1080716 () Bool)

(declare-fun res!720341 () Bool)

(declare-fun e!617760 () Bool)

(assert (=> b!1080716 (=> (not res!720341) (not e!617760))))

(declare-fun lt!478923 () array!69480)

(assert (=> b!1080716 (= res!720341 (arrayNoDuplicates!0 lt!478923 #b00000000000000000000000000000000 Nil!23354))))

(declare-fun b!1080717 () Bool)

(assert (=> b!1080717 (= e!617757 tp_is_empty!26299)))

(declare-fun b!1080718 () Bool)

(assert (=> b!1080718 (= e!617762 e!617760)))

(declare-fun res!720339 () Bool)

(assert (=> b!1080718 (=> (not res!720339) (not e!617760))))

(assert (=> b!1080718 (= res!720339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478923 mask!1414))))

(assert (=> b!1080718 (= lt!478923 (array!69481 (store (arr!33414 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33952 _keys!1070)))))

(declare-fun b!1080719 () Bool)

(assert (=> b!1080719 (= e!617760 (not (bvsle #b00000000000000000000000000000000 (size!33952 _keys!1070))))))

(declare-datatypes ((tuple2!16796 0))(
  ( (tuple2!16797 (_1!8409 (_ BitVec 64)) (_2!8409 V!40193)) )
))
(declare-datatypes ((List!23358 0))(
  ( (Nil!23355) (Cons!23354 (h!24563 tuple2!16796) (t!32708 List!23358)) )
))
(declare-datatypes ((ListLongMap!14765 0))(
  ( (ListLongMap!14766 (toList!7398 List!23358)) )
))
(declare-fun lt!478925 () ListLongMap!14765)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40193)

(declare-fun zeroValue!831 () V!40193)

(declare-fun getCurrentListMapNoExtraKeys!3961 (array!69480 array!69478 (_ BitVec 32) (_ BitVec 32) V!40193 V!40193 (_ BitVec 32) Int) ListLongMap!14765)

(assert (=> b!1080719 (= lt!478925 (getCurrentListMapNoExtraKeys!3961 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080719 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35389 0))(
  ( (Unit!35390) )
))
(declare-fun lt!478924 () Unit!35389)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69480 (_ BitVec 64) (_ BitVec 32)) Unit!35389)

(assert (=> b!1080719 (= lt!478924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95638 res!720343) b!1080711))

(assert (= (and b!1080711 res!720342) b!1080714))

(assert (= (and b!1080714 res!720345) b!1080708))

(assert (= (and b!1080708 res!720337) b!1080709))

(assert (= (and b!1080709 res!720340) b!1080710))

(assert (= (and b!1080710 res!720344) b!1080712))

(assert (= (and b!1080712 res!720338) b!1080718))

(assert (= (and b!1080718 res!720339) b!1080716))

(assert (= (and b!1080716 res!720341) b!1080719))

(assert (= (and b!1080715 condMapEmpty!41203) mapIsEmpty!41203))

(assert (= (and b!1080715 (not condMapEmpty!41203)) mapNonEmpty!41203))

(get-info :version)

(assert (= (and mapNonEmpty!41203 ((_ is ValueCellFull!12440) mapValue!41203)) b!1080717))

(assert (= (and b!1080715 ((_ is ValueCellFull!12440) mapDefault!41203)) b!1080713))

(assert (= start!95638 b!1080715))

(declare-fun m!998099 () Bool)

(assert (=> b!1080712 m!998099))

(declare-fun m!998101 () Bool)

(assert (=> b!1080708 m!998101))

(declare-fun m!998103 () Bool)

(assert (=> b!1080719 m!998103))

(declare-fun m!998105 () Bool)

(assert (=> b!1080719 m!998105))

(declare-fun m!998107 () Bool)

(assert (=> b!1080719 m!998107))

(declare-fun m!998109 () Bool)

(assert (=> mapNonEmpty!41203 m!998109))

(declare-fun m!998111 () Bool)

(assert (=> start!95638 m!998111))

(declare-fun m!998113 () Bool)

(assert (=> start!95638 m!998113))

(declare-fun m!998115 () Bool)

(assert (=> start!95638 m!998115))

(declare-fun m!998117 () Bool)

(assert (=> b!1080716 m!998117))

(declare-fun m!998119 () Bool)

(assert (=> b!1080718 m!998119))

(declare-fun m!998121 () Bool)

(assert (=> b!1080718 m!998121))

(declare-fun m!998123 () Bool)

(assert (=> b!1080714 m!998123))

(declare-fun m!998125 () Bool)

(assert (=> b!1080710 m!998125))

(check-sat (not mapNonEmpty!41203) (not b!1080719) (not b_next!22297) (not b!1080714) (not b!1080710) (not b!1080718) (not b!1080708) tp_is_empty!26299 b_and!35249 (not start!95638) (not b!1080716))
(check-sat b_and!35249 (not b_next!22297))
