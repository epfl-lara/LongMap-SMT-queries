; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96270 () Bool)

(assert start!96270)

(declare-fun b_free!22923 () Bool)

(declare-fun b_next!22923 () Bool)

(assert (=> start!96270 (= b_free!22923 (not b_next!22923))))

(declare-fun tp!80618 () Bool)

(declare-fun b_and!36521 () Bool)

(assert (=> start!96270 (= tp!80618 b_and!36521)))

(declare-fun mapNonEmpty!42142 () Bool)

(declare-fun mapRes!42142 () Bool)

(declare-fun tp!80617 () Bool)

(declare-fun e!624522 () Bool)

(assert (=> mapNonEmpty!42142 (= mapRes!42142 (and tp!80617 e!624522))))

(declare-datatypes ((V!41027 0))(
  ( (V!41028 (val!13519 Int)) )
))
(declare-datatypes ((ValueCell!12753 0))(
  ( (ValueCellFull!12753 (v!16140 V!41027)) (EmptyCell!12753) )
))
(declare-fun mapRest!42142 () (Array (_ BitVec 32) ValueCell!12753))

(declare-datatypes ((array!70767 0))(
  ( (array!70768 (arr!34057 (Array (_ BitVec 32) ValueCell!12753)) (size!34593 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70767)

(declare-fun mapValue!42142 () ValueCell!12753)

(declare-fun mapKey!42142 () (_ BitVec 32))

(assert (=> mapNonEmpty!42142 (= (arr!34057 _values!874) (store mapRest!42142 mapKey!42142 mapValue!42142))))

(declare-fun mapIsEmpty!42142 () Bool)

(assert (=> mapIsEmpty!42142 mapRes!42142))

(declare-fun b!1093811 () Bool)

(declare-fun res!729927 () Bool)

(declare-fun e!624519 () Bool)

(assert (=> b!1093811 (=> (not res!729927) (not e!624519))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70769 0))(
  ( (array!70770 (arr!34058 (Array (_ BitVec 32) (_ BitVec 64))) (size!34594 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70769)

(assert (=> b!1093811 (= res!729927 (and (= (size!34593 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34594 _keys!1070) (size!34593 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093812 () Bool)

(declare-fun res!729919 () Bool)

(assert (=> b!1093812 (=> (not res!729919) (not e!624519))))

(declare-datatypes ((List!23793 0))(
  ( (Nil!23790) (Cons!23789 (h!24998 (_ BitVec 64)) (t!33774 List!23793)) )
))
(declare-fun arrayNoDuplicates!0 (array!70769 (_ BitVec 32) List!23793) Bool)

(assert (=> b!1093812 (= res!729919 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23790))))

(declare-fun res!729926 () Bool)

(assert (=> start!96270 (=> (not res!729926) (not e!624519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96270 (= res!729926 (validMask!0 mask!1414))))

(assert (=> start!96270 e!624519))

(assert (=> start!96270 tp!80618))

(assert (=> start!96270 true))

(declare-fun tp_is_empty!26925 () Bool)

(assert (=> start!96270 tp_is_empty!26925))

(declare-fun array_inv!26246 (array!70769) Bool)

(assert (=> start!96270 (array_inv!26246 _keys!1070)))

(declare-fun e!624521 () Bool)

(declare-fun array_inv!26247 (array!70767) Bool)

(assert (=> start!96270 (and (array_inv!26247 _values!874) e!624521)))

(declare-fun b!1093813 () Bool)

(declare-fun res!729921 () Bool)

(assert (=> b!1093813 (=> (not res!729921) (not e!624519))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093813 (= res!729921 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34594 _keys!1070))))))

(declare-fun b!1093814 () Bool)

(declare-fun e!624524 () Bool)

(assert (=> b!1093814 (= e!624524 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41027)

(declare-datatypes ((tuple2!17196 0))(
  ( (tuple2!17197 (_1!8609 (_ BitVec 64)) (_2!8609 V!41027)) )
))
(declare-datatypes ((List!23794 0))(
  ( (Nil!23791) (Cons!23790 (h!24999 tuple2!17196) (t!33775 List!23794)) )
))
(declare-datatypes ((ListLongMap!15165 0))(
  ( (ListLongMap!15166 (toList!7598 List!23794)) )
))
(declare-fun lt!489267 () ListLongMap!15165)

(declare-fun zeroValue!831 () V!41027)

(declare-fun getCurrentListMap!4354 (array!70769 array!70767 (_ BitVec 32) (_ BitVec 32) V!41027 V!41027 (_ BitVec 32) Int) ListLongMap!15165)

(assert (=> b!1093814 (= lt!489267 (getCurrentListMap!4354 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489261 () array!70767)

(declare-fun lt!489260 () ListLongMap!15165)

(declare-fun lt!489268 () array!70769)

(assert (=> b!1093814 (= lt!489260 (getCurrentListMap!4354 lt!489268 lt!489261 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489266 () ListLongMap!15165)

(declare-fun lt!489264 () ListLongMap!15165)

(assert (=> b!1093814 (and (= lt!489266 lt!489264) (= lt!489264 lt!489266))))

(declare-fun lt!489262 () ListLongMap!15165)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!917 (ListLongMap!15165 (_ BitVec 64)) ListLongMap!15165)

(assert (=> b!1093814 (= lt!489264 (-!917 lt!489262 k0!904))))

(declare-datatypes ((Unit!36000 0))(
  ( (Unit!36001) )
))
(declare-fun lt!489263 () Unit!36000)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!173 (array!70769 array!70767 (_ BitVec 32) (_ BitVec 32) V!41027 V!41027 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36000)

(assert (=> b!1093814 (= lt!489263 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!173 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4114 (array!70769 array!70767 (_ BitVec 32) (_ BitVec 32) V!41027 V!41027 (_ BitVec 32) Int) ListLongMap!15165)

(assert (=> b!1093814 (= lt!489266 (getCurrentListMapNoExtraKeys!4114 lt!489268 lt!489261 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2251 (Int (_ BitVec 64)) V!41027)

(assert (=> b!1093814 (= lt!489261 (array!70768 (store (arr!34057 _values!874) i!650 (ValueCellFull!12753 (dynLambda!2251 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34593 _values!874)))))

(assert (=> b!1093814 (= lt!489262 (getCurrentListMapNoExtraKeys!4114 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093814 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489265 () Unit!36000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70769 (_ BitVec 64) (_ BitVec 32)) Unit!36000)

(assert (=> b!1093814 (= lt!489265 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093815 () Bool)

(declare-fun res!729922 () Bool)

(assert (=> b!1093815 (=> (not res!729922) (not e!624519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70769 (_ BitVec 32)) Bool)

(assert (=> b!1093815 (= res!729922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093816 () Bool)

(declare-fun e!624520 () Bool)

(assert (=> b!1093816 (= e!624520 tp_is_empty!26925)))

(declare-fun b!1093817 () Bool)

(assert (=> b!1093817 (= e!624521 (and e!624520 mapRes!42142))))

(declare-fun condMapEmpty!42142 () Bool)

(declare-fun mapDefault!42142 () ValueCell!12753)

(assert (=> b!1093817 (= condMapEmpty!42142 (= (arr!34057 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12753)) mapDefault!42142)))))

(declare-fun b!1093818 () Bool)

(declare-fun res!729925 () Bool)

(assert (=> b!1093818 (=> (not res!729925) (not e!624519))))

(assert (=> b!1093818 (= res!729925 (= (select (arr!34058 _keys!1070) i!650) k0!904))))

(declare-fun b!1093819 () Bool)

(assert (=> b!1093819 (= e!624522 tp_is_empty!26925)))

(declare-fun b!1093820 () Bool)

(assert (=> b!1093820 (= e!624519 e!624524)))

(declare-fun res!729923 () Bool)

(assert (=> b!1093820 (=> (not res!729923) (not e!624524))))

(assert (=> b!1093820 (= res!729923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489268 mask!1414))))

(assert (=> b!1093820 (= lt!489268 (array!70770 (store (arr!34058 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34594 _keys!1070)))))

(declare-fun b!1093821 () Bool)

(declare-fun res!729924 () Bool)

(assert (=> b!1093821 (=> (not res!729924) (not e!624519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093821 (= res!729924 (validKeyInArray!0 k0!904))))

(declare-fun b!1093822 () Bool)

(declare-fun res!729920 () Bool)

(assert (=> b!1093822 (=> (not res!729920) (not e!624524))))

(assert (=> b!1093822 (= res!729920 (arrayNoDuplicates!0 lt!489268 #b00000000000000000000000000000000 Nil!23790))))

(assert (= (and start!96270 res!729926) b!1093811))

(assert (= (and b!1093811 res!729927) b!1093815))

(assert (= (and b!1093815 res!729922) b!1093812))

(assert (= (and b!1093812 res!729919) b!1093813))

(assert (= (and b!1093813 res!729921) b!1093821))

(assert (= (and b!1093821 res!729924) b!1093818))

(assert (= (and b!1093818 res!729925) b!1093820))

(assert (= (and b!1093820 res!729923) b!1093822))

(assert (= (and b!1093822 res!729920) b!1093814))

(assert (= (and b!1093817 condMapEmpty!42142) mapIsEmpty!42142))

(assert (= (and b!1093817 (not condMapEmpty!42142)) mapNonEmpty!42142))

(get-info :version)

(assert (= (and mapNonEmpty!42142 ((_ is ValueCellFull!12753) mapValue!42142)) b!1093819))

(assert (= (and b!1093817 ((_ is ValueCellFull!12753) mapDefault!42142)) b!1093816))

(assert (= start!96270 b!1093817))

(declare-fun b_lambda!17593 () Bool)

(assert (=> (not b_lambda!17593) (not b!1093814)))

(declare-fun t!33773 () Bool)

(declare-fun tb!7801 () Bool)

(assert (=> (and start!96270 (= defaultEntry!882 defaultEntry!882) t!33773) tb!7801))

(declare-fun result!16121 () Bool)

(assert (=> tb!7801 (= result!16121 tp_is_empty!26925)))

(assert (=> b!1093814 t!33773))

(declare-fun b_and!36523 () Bool)

(assert (= b_and!36521 (and (=> t!33773 result!16121) b_and!36523)))

(declare-fun m!1013719 () Bool)

(assert (=> start!96270 m!1013719))

(declare-fun m!1013721 () Bool)

(assert (=> start!96270 m!1013721))

(declare-fun m!1013723 () Bool)

(assert (=> start!96270 m!1013723))

(declare-fun m!1013725 () Bool)

(assert (=> b!1093822 m!1013725))

(declare-fun m!1013727 () Bool)

(assert (=> b!1093812 m!1013727))

(declare-fun m!1013729 () Bool)

(assert (=> b!1093820 m!1013729))

(declare-fun m!1013731 () Bool)

(assert (=> b!1093820 m!1013731))

(declare-fun m!1013733 () Bool)

(assert (=> b!1093814 m!1013733))

(declare-fun m!1013735 () Bool)

(assert (=> b!1093814 m!1013735))

(declare-fun m!1013737 () Bool)

(assert (=> b!1093814 m!1013737))

(declare-fun m!1013739 () Bool)

(assert (=> b!1093814 m!1013739))

(declare-fun m!1013741 () Bool)

(assert (=> b!1093814 m!1013741))

(declare-fun m!1013743 () Bool)

(assert (=> b!1093814 m!1013743))

(declare-fun m!1013745 () Bool)

(assert (=> b!1093814 m!1013745))

(declare-fun m!1013747 () Bool)

(assert (=> b!1093814 m!1013747))

(declare-fun m!1013749 () Bool)

(assert (=> b!1093814 m!1013749))

(declare-fun m!1013751 () Bool)

(assert (=> b!1093814 m!1013751))

(declare-fun m!1013753 () Bool)

(assert (=> b!1093821 m!1013753))

(declare-fun m!1013755 () Bool)

(assert (=> mapNonEmpty!42142 m!1013755))

(declare-fun m!1013757 () Bool)

(assert (=> b!1093818 m!1013757))

(declare-fun m!1013759 () Bool)

(assert (=> b!1093815 m!1013759))

(check-sat (not b!1093812) (not b!1093820) (not b!1093815) (not mapNonEmpty!42142) (not b!1093814) b_and!36523 (not b_lambda!17593) (not start!96270) (not b!1093821) tp_is_empty!26925 (not b_next!22923) (not b!1093822))
(check-sat b_and!36523 (not b_next!22923))
