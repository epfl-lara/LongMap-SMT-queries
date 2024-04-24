; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97098 () Bool)

(assert start!97098)

(declare-fun b_free!23179 () Bool)

(declare-fun b_next!23179 () Bool)

(assert (=> start!97098 (= b_free!23179 (not b_next!23179))))

(declare-fun tp!81494 () Bool)

(declare-fun b_and!37171 () Bool)

(assert (=> start!97098 (= tp!81494 b_and!37171)))

(declare-fun b!1103135 () Bool)

(declare-fun e!629757 () Bool)

(declare-fun tp_is_empty!27229 () Bool)

(assert (=> b!1103135 (= e!629757 tp_is_empty!27229)))

(declare-fun b!1103136 () Bool)

(declare-fun res!735688 () Bool)

(declare-fun e!629751 () Bool)

(assert (=> b!1103136 (=> (not res!735688) (not e!629751))))

(declare-datatypes ((array!71417 0))(
  ( (array!71418 (arr!34364 (Array (_ BitVec 32) (_ BitVec 64))) (size!34901 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71417)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1103136 (= res!735688 (= (select (arr!34364 _keys!1070) i!650) k0!904))))

(declare-fun b!1103137 () Bool)

(declare-fun e!629755 () Bool)

(assert (=> b!1103137 (= e!629755 tp_is_empty!27229)))

(declare-fun b!1103138 () Bool)

(declare-fun e!629756 () Bool)

(declare-fun mapRes!42634 () Bool)

(assert (=> b!1103138 (= e!629756 (and e!629757 mapRes!42634))))

(declare-fun condMapEmpty!42634 () Bool)

(declare-datatypes ((V!41433 0))(
  ( (V!41434 (val!13671 Int)) )
))
(declare-datatypes ((ValueCell!12905 0))(
  ( (ValueCellFull!12905 (v!16298 V!41433)) (EmptyCell!12905) )
))
(declare-datatypes ((array!71419 0))(
  ( (array!71420 (arr!34365 (Array (_ BitVec 32) ValueCell!12905)) (size!34902 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71419)

(declare-fun mapDefault!42634 () ValueCell!12905)

(assert (=> b!1103138 (= condMapEmpty!42634 (= (arr!34365 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12905)) mapDefault!42634)))))

(declare-fun b!1103139 () Bool)

(declare-fun res!735687 () Bool)

(assert (=> b!1103139 (=> (not res!735687) (not e!629751))))

(declare-datatypes ((List!24023 0))(
  ( (Nil!24020) (Cons!24019 (h!25237 (_ BitVec 64)) (t!34240 List!24023)) )
))
(declare-fun arrayNoDuplicates!0 (array!71417 (_ BitVec 32) List!24023) Bool)

(assert (=> b!1103139 (= res!735687 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24020))))

(declare-fun b!1103140 () Bool)

(declare-fun e!629753 () Bool)

(declare-fun e!629758 () Bool)

(assert (=> b!1103140 (= e!629753 (not e!629758))))

(declare-fun res!735680 () Bool)

(assert (=> b!1103140 (=> res!735680 e!629758)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1103140 (= res!735680 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41433)

(declare-fun zeroValue!831 () V!41433)

(declare-datatypes ((tuple2!17404 0))(
  ( (tuple2!17405 (_1!8713 (_ BitVec 64)) (_2!8713 V!41433)) )
))
(declare-datatypes ((List!24024 0))(
  ( (Nil!24021) (Cons!24020 (h!25238 tuple2!17404) (t!34241 List!24024)) )
))
(declare-datatypes ((ListLongMap!15381 0))(
  ( (ListLongMap!15382 (toList!7706 List!24024)) )
))
(declare-fun lt!494618 () ListLongMap!15381)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun getCurrentListMap!4405 (array!71417 array!71419 (_ BitVec 32) (_ BitVec 32) V!41433 V!41433 (_ BitVec 32) Int) ListLongMap!15381)

(assert (=> b!1103140 (= lt!494618 (getCurrentListMap!4405 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494617 () array!71417)

(declare-fun lt!494610 () array!71419)

(declare-fun lt!494615 () ListLongMap!15381)

(assert (=> b!1103140 (= lt!494615 (getCurrentListMap!4405 lt!494617 lt!494610 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494607 () ListLongMap!15381)

(declare-fun lt!494608 () ListLongMap!15381)

(assert (=> b!1103140 (and (= lt!494607 lt!494608) (= lt!494608 lt!494607))))

(declare-fun lt!494614 () ListLongMap!15381)

(declare-fun -!969 (ListLongMap!15381 (_ BitVec 64)) ListLongMap!15381)

(assert (=> b!1103140 (= lt!494608 (-!969 lt!494614 k0!904))))

(declare-datatypes ((Unit!36197 0))(
  ( (Unit!36198) )
))
(declare-fun lt!494612 () Unit!36197)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!239 (array!71417 array!71419 (_ BitVec 32) (_ BitVec 32) V!41433 V!41433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36197)

(assert (=> b!1103140 (= lt!494612 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4246 (array!71417 array!71419 (_ BitVec 32) (_ BitVec 32) V!41433 V!41433 (_ BitVec 32) Int) ListLongMap!15381)

(assert (=> b!1103140 (= lt!494607 (getCurrentListMapNoExtraKeys!4246 lt!494617 lt!494610 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2364 (Int (_ BitVec 64)) V!41433)

(assert (=> b!1103140 (= lt!494610 (array!71420 (store (arr!34365 _values!874) i!650 (ValueCellFull!12905 (dynLambda!2364 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34902 _values!874)))))

(assert (=> b!1103140 (= lt!494614 (getCurrentListMapNoExtraKeys!4246 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103140 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494613 () Unit!36197)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71417 (_ BitVec 64) (_ BitVec 32)) Unit!36197)

(assert (=> b!1103140 (= lt!494613 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1103141 () Bool)

(declare-fun res!735685 () Bool)

(assert (=> b!1103141 (=> (not res!735685) (not e!629751))))

(assert (=> b!1103141 (= res!735685 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34901 _keys!1070))))))

(declare-fun b!1103142 () Bool)

(assert (=> b!1103142 (= e!629751 e!629753)))

(declare-fun res!735686 () Bool)

(assert (=> b!1103142 (=> (not res!735686) (not e!629753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71417 (_ BitVec 32)) Bool)

(assert (=> b!1103142 (= res!735686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494617 mask!1414))))

(assert (=> b!1103142 (= lt!494617 (array!71418 (store (arr!34364 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34901 _keys!1070)))))

(declare-fun b!1103143 () Bool)

(declare-fun res!735678 () Bool)

(assert (=> b!1103143 (=> (not res!735678) (not e!629751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103143 (= res!735678 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42634 () Bool)

(assert (=> mapIsEmpty!42634 mapRes!42634))

(declare-fun res!735679 () Bool)

(assert (=> start!97098 (=> (not res!735679) (not e!629751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97098 (= res!735679 (validMask!0 mask!1414))))

(assert (=> start!97098 e!629751))

(assert (=> start!97098 tp!81494))

(assert (=> start!97098 true))

(assert (=> start!97098 tp_is_empty!27229))

(declare-fun array_inv!26494 (array!71417) Bool)

(assert (=> start!97098 (array_inv!26494 _keys!1070)))

(declare-fun array_inv!26495 (array!71419) Bool)

(assert (=> start!97098 (and (array_inv!26495 _values!874) e!629756)))

(declare-fun b!1103144 () Bool)

(declare-fun e!629752 () Bool)

(assert (=> b!1103144 (= e!629752 true)))

(declare-fun lt!494611 () ListLongMap!15381)

(declare-fun lt!494619 () ListLongMap!15381)

(assert (=> b!1103144 (= (-!969 lt!494611 k0!904) lt!494619)))

(declare-fun lt!494609 () Unit!36197)

(declare-fun addRemoveCommutativeForDiffKeys!130 (ListLongMap!15381 (_ BitVec 64) V!41433 (_ BitVec 64)) Unit!36197)

(assert (=> b!1103144 (= lt!494609 (addRemoveCommutativeForDiffKeys!130 lt!494614 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1103145 () Bool)

(declare-fun res!735683 () Bool)

(assert (=> b!1103145 (=> (not res!735683) (not e!629753))))

(assert (=> b!1103145 (= res!735683 (arrayNoDuplicates!0 lt!494617 #b00000000000000000000000000000000 Nil!24020))))

(declare-fun b!1103146 () Bool)

(declare-fun res!735684 () Bool)

(assert (=> b!1103146 (=> (not res!735684) (not e!629751))))

(assert (=> b!1103146 (= res!735684 (and (= (size!34902 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34901 _keys!1070) (size!34902 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1103147 () Bool)

(assert (=> b!1103147 (= e!629758 e!629752)))

(declare-fun res!735681 () Bool)

(assert (=> b!1103147 (=> res!735681 e!629752)))

(assert (=> b!1103147 (= res!735681 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1103147 (= lt!494618 lt!494611)))

(declare-fun lt!494616 () tuple2!17404)

(declare-fun +!3434 (ListLongMap!15381 tuple2!17404) ListLongMap!15381)

(assert (=> b!1103147 (= lt!494611 (+!3434 lt!494614 lt!494616))))

(assert (=> b!1103147 (= lt!494615 lt!494619)))

(assert (=> b!1103147 (= lt!494619 (+!3434 lt!494608 lt!494616))))

(assert (=> b!1103147 (= lt!494615 (+!3434 lt!494607 lt!494616))))

(assert (=> b!1103147 (= lt!494616 (tuple2!17405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1103148 () Bool)

(declare-fun res!735682 () Bool)

(assert (=> b!1103148 (=> (not res!735682) (not e!629751))))

(assert (=> b!1103148 (= res!735682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42634 () Bool)

(declare-fun tp!81493 () Bool)

(assert (=> mapNonEmpty!42634 (= mapRes!42634 (and tp!81493 e!629755))))

(declare-fun mapRest!42634 () (Array (_ BitVec 32) ValueCell!12905))

(declare-fun mapKey!42634 () (_ BitVec 32))

(declare-fun mapValue!42634 () ValueCell!12905)

(assert (=> mapNonEmpty!42634 (= (arr!34365 _values!874) (store mapRest!42634 mapKey!42634 mapValue!42634))))

(assert (= (and start!97098 res!735679) b!1103146))

(assert (= (and b!1103146 res!735684) b!1103148))

(assert (= (and b!1103148 res!735682) b!1103139))

(assert (= (and b!1103139 res!735687) b!1103141))

(assert (= (and b!1103141 res!735685) b!1103143))

(assert (= (and b!1103143 res!735678) b!1103136))

(assert (= (and b!1103136 res!735688) b!1103142))

(assert (= (and b!1103142 res!735686) b!1103145))

(assert (= (and b!1103145 res!735683) b!1103140))

(assert (= (and b!1103140 (not res!735680)) b!1103147))

(assert (= (and b!1103147 (not res!735681)) b!1103144))

(assert (= (and b!1103138 condMapEmpty!42634) mapIsEmpty!42634))

(assert (= (and b!1103138 (not condMapEmpty!42634)) mapNonEmpty!42634))

(get-info :version)

(assert (= (and mapNonEmpty!42634 ((_ is ValueCellFull!12905) mapValue!42634)) b!1103137))

(assert (= (and b!1103138 ((_ is ValueCellFull!12905) mapDefault!42634)) b!1103135))

(assert (= start!97098 b!1103138))

(declare-fun b_lambda!18147 () Bool)

(assert (=> (not b_lambda!18147) (not b!1103140)))

(declare-fun t!34239 () Bool)

(declare-fun tb!8037 () Bool)

(assert (=> (and start!97098 (= defaultEntry!882 defaultEntry!882) t!34239) tb!8037))

(declare-fun result!16625 () Bool)

(assert (=> tb!8037 (= result!16625 tp_is_empty!27229)))

(assert (=> b!1103140 t!34239))

(declare-fun b_and!37173 () Bool)

(assert (= b_and!37171 (and (=> t!34239 result!16625) b_and!37173)))

(declare-fun m!1023689 () Bool)

(assert (=> b!1103148 m!1023689))

(declare-fun m!1023691 () Bool)

(assert (=> b!1103143 m!1023691))

(declare-fun m!1023693 () Bool)

(assert (=> b!1103147 m!1023693))

(declare-fun m!1023695 () Bool)

(assert (=> b!1103147 m!1023695))

(declare-fun m!1023697 () Bool)

(assert (=> b!1103147 m!1023697))

(declare-fun m!1023699 () Bool)

(assert (=> b!1103145 m!1023699))

(declare-fun m!1023701 () Bool)

(assert (=> b!1103139 m!1023701))

(declare-fun m!1023703 () Bool)

(assert (=> b!1103144 m!1023703))

(declare-fun m!1023705 () Bool)

(assert (=> b!1103144 m!1023705))

(declare-fun m!1023707 () Bool)

(assert (=> b!1103142 m!1023707))

(declare-fun m!1023709 () Bool)

(assert (=> b!1103142 m!1023709))

(declare-fun m!1023711 () Bool)

(assert (=> b!1103140 m!1023711))

(declare-fun m!1023713 () Bool)

(assert (=> b!1103140 m!1023713))

(declare-fun m!1023715 () Bool)

(assert (=> b!1103140 m!1023715))

(declare-fun m!1023717 () Bool)

(assert (=> b!1103140 m!1023717))

(declare-fun m!1023719 () Bool)

(assert (=> b!1103140 m!1023719))

(declare-fun m!1023721 () Bool)

(assert (=> b!1103140 m!1023721))

(declare-fun m!1023723 () Bool)

(assert (=> b!1103140 m!1023723))

(declare-fun m!1023725 () Bool)

(assert (=> b!1103140 m!1023725))

(declare-fun m!1023727 () Bool)

(assert (=> b!1103140 m!1023727))

(declare-fun m!1023729 () Bool)

(assert (=> b!1103140 m!1023729))

(declare-fun m!1023731 () Bool)

(assert (=> start!97098 m!1023731))

(declare-fun m!1023733 () Bool)

(assert (=> start!97098 m!1023733))

(declare-fun m!1023735 () Bool)

(assert (=> start!97098 m!1023735))

(declare-fun m!1023737 () Bool)

(assert (=> b!1103136 m!1023737))

(declare-fun m!1023739 () Bool)

(assert (=> mapNonEmpty!42634 m!1023739))

(check-sat (not start!97098) (not b!1103143) (not b!1103140) (not b_next!23179) (not b!1103145) tp_is_empty!27229 (not mapNonEmpty!42634) (not b_lambda!18147) (not b!1103142) b_and!37173 (not b!1103144) (not b!1103147) (not b!1103139) (not b!1103148))
(check-sat b_and!37173 (not b_next!23179))
