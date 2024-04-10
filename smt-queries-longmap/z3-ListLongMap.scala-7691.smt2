; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96520 () Bool)

(assert start!96520)

(declare-fun b_free!23073 () Bool)

(declare-fun b_next!23073 () Bool)

(assert (=> start!96520 (= b_free!23073 (not b_next!23073))))

(declare-fun tp!81148 () Bool)

(declare-fun b_and!36823 () Bool)

(assert (=> start!96520 (= tp!81148 b_and!36823)))

(declare-fun b!1097685 () Bool)

(declare-fun res!732609 () Bool)

(declare-fun e!626492 () Bool)

(assert (=> b!1097685 (=> (not res!732609) (not e!626492))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71157 0))(
  ( (array!71158 (arr!34249 (Array (_ BitVec 32) (_ BitVec 64))) (size!34785 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71157)

(declare-datatypes ((V!41291 0))(
  ( (V!41292 (val!13618 Int)) )
))
(declare-datatypes ((ValueCell!12852 0))(
  ( (ValueCellFull!12852 (v!16240 V!41291)) (EmptyCell!12852) )
))
(declare-datatypes ((array!71159 0))(
  ( (array!71160 (arr!34250 (Array (_ BitVec 32) ValueCell!12852)) (size!34786 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71159)

(assert (=> b!1097685 (= res!732609 (and (= (size!34786 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34785 _keys!1070) (size!34786 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun e!626494 () Bool)

(declare-datatypes ((tuple2!17294 0))(
  ( (tuple2!17295 (_1!8658 (_ BitVec 64)) (_2!8658 V!41291)) )
))
(declare-fun lt!490762 () tuple2!17294)

(declare-fun lt!490767 () tuple2!17294)

(declare-datatypes ((List!23916 0))(
  ( (Nil!23913) (Cons!23912 (h!25121 tuple2!17294) (t!34035 List!23916)) )
))
(declare-datatypes ((ListLongMap!15263 0))(
  ( (ListLongMap!15264 (toList!7647 List!23916)) )
))
(declare-fun lt!490765 () ListLongMap!15263)

(declare-fun lt!490766 () ListLongMap!15263)

(declare-fun b!1097686 () Bool)

(declare-fun +!3357 (ListLongMap!15263 tuple2!17294) ListLongMap!15263)

(assert (=> b!1097686 (= e!626494 (= lt!490765 (+!3357 (+!3357 lt!490766 lt!490767) lt!490762)))))

(declare-fun lt!490768 () ListLongMap!15263)

(declare-fun lt!490763 () ListLongMap!15263)

(assert (=> b!1097686 (= lt!490763 (+!3357 (+!3357 lt!490768 lt!490767) lt!490762))))

(declare-fun minValue!831 () V!41291)

(assert (=> b!1097686 (= lt!490762 (tuple2!17295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!41291)

(assert (=> b!1097686 (= lt!490767 (tuple2!17295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1097687 () Bool)

(declare-fun e!626497 () Bool)

(declare-fun tp_is_empty!27123 () Bool)

(assert (=> b!1097687 (= e!626497 tp_is_empty!27123)))

(declare-fun b!1097688 () Bool)

(declare-fun res!732610 () Bool)

(assert (=> b!1097688 (=> (not res!732610) (not e!626492))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097688 (= res!732610 (validKeyInArray!0 k0!904))))

(declare-fun b!1097689 () Bool)

(declare-fun e!626493 () Bool)

(declare-fun mapRes!42448 () Bool)

(assert (=> b!1097689 (= e!626493 (and e!626497 mapRes!42448))))

(declare-fun condMapEmpty!42448 () Bool)

(declare-fun mapDefault!42448 () ValueCell!12852)

(assert (=> b!1097689 (= condMapEmpty!42448 (= (arr!34250 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12852)) mapDefault!42448)))))

(declare-fun b!1097690 () Bool)

(declare-fun e!626496 () Bool)

(assert (=> b!1097690 (= e!626496 (not e!626494))))

(declare-fun res!732611 () Bool)

(assert (=> b!1097690 (=> res!732611 e!626494)))

(assert (=> b!1097690 (= res!732611 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4367 (array!71157 array!71159 (_ BitVec 32) (_ BitVec 32) V!41291 V!41291 (_ BitVec 32) Int) ListLongMap!15263)

(assert (=> b!1097690 (= lt!490765 (getCurrentListMap!4367 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490761 () array!71159)

(declare-fun lt!490770 () array!71157)

(assert (=> b!1097690 (= lt!490763 (getCurrentListMap!4367 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490771 () ListLongMap!15263)

(assert (=> b!1097690 (and (= lt!490768 lt!490771) (= lt!490771 lt!490768))))

(declare-fun -!937 (ListLongMap!15263 (_ BitVec 64)) ListLongMap!15263)

(assert (=> b!1097690 (= lt!490771 (-!937 lt!490766 k0!904))))

(declare-datatypes ((Unit!36108 0))(
  ( (Unit!36109) )
))
(declare-fun lt!490769 () Unit!36108)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!193 (array!71157 array!71159 (_ BitVec 32) (_ BitVec 32) V!41291 V!41291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36108)

(assert (=> b!1097690 (= lt!490769 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!193 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4163 (array!71157 array!71159 (_ BitVec 32) (_ BitVec 32) V!41291 V!41291 (_ BitVec 32) Int) ListLongMap!15263)

(assert (=> b!1097690 (= lt!490768 (getCurrentListMapNoExtraKeys!4163 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2298 (Int (_ BitVec 64)) V!41291)

(assert (=> b!1097690 (= lt!490761 (array!71160 (store (arr!34250 _values!874) i!650 (ValueCellFull!12852 (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34786 _values!874)))))

(assert (=> b!1097690 (= lt!490766 (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097690 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490764 () Unit!36108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71157 (_ BitVec 64) (_ BitVec 32)) Unit!36108)

(assert (=> b!1097690 (= lt!490764 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097691 () Bool)

(declare-fun e!626495 () Bool)

(assert (=> b!1097691 (= e!626495 tp_is_empty!27123)))

(declare-fun res!732613 () Bool)

(assert (=> start!96520 (=> (not res!732613) (not e!626492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96520 (= res!732613 (validMask!0 mask!1414))))

(assert (=> start!96520 e!626492))

(assert (=> start!96520 tp!81148))

(assert (=> start!96520 true))

(assert (=> start!96520 tp_is_empty!27123))

(declare-fun array_inv!26386 (array!71157) Bool)

(assert (=> start!96520 (array_inv!26386 _keys!1070)))

(declare-fun array_inv!26387 (array!71159) Bool)

(assert (=> start!96520 (and (array_inv!26387 _values!874) e!626493)))

(declare-fun b!1097692 () Bool)

(declare-fun res!732608 () Bool)

(assert (=> b!1097692 (=> (not res!732608) (not e!626492))))

(assert (=> b!1097692 (= res!732608 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34785 _keys!1070))))))

(declare-fun b!1097693 () Bool)

(declare-fun res!732607 () Bool)

(assert (=> b!1097693 (=> (not res!732607) (not e!626496))))

(declare-datatypes ((List!23917 0))(
  ( (Nil!23914) (Cons!23913 (h!25122 (_ BitVec 64)) (t!34036 List!23917)) )
))
(declare-fun arrayNoDuplicates!0 (array!71157 (_ BitVec 32) List!23917) Bool)

(assert (=> b!1097693 (= res!732607 (arrayNoDuplicates!0 lt!490770 #b00000000000000000000000000000000 Nil!23914))))

(declare-fun b!1097694 () Bool)

(declare-fun res!732615 () Bool)

(assert (=> b!1097694 (=> (not res!732615) (not e!626492))))

(assert (=> b!1097694 (= res!732615 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23914))))

(declare-fun mapIsEmpty!42448 () Bool)

(assert (=> mapIsEmpty!42448 mapRes!42448))

(declare-fun b!1097695 () Bool)

(assert (=> b!1097695 (= e!626492 e!626496)))

(declare-fun res!732612 () Bool)

(assert (=> b!1097695 (=> (not res!732612) (not e!626496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71157 (_ BitVec 32)) Bool)

(assert (=> b!1097695 (= res!732612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490770 mask!1414))))

(assert (=> b!1097695 (= lt!490770 (array!71158 (store (arr!34249 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34785 _keys!1070)))))

(declare-fun b!1097696 () Bool)

(declare-fun res!732614 () Bool)

(assert (=> b!1097696 (=> (not res!732614) (not e!626492))))

(assert (=> b!1097696 (= res!732614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42448 () Bool)

(declare-fun tp!81149 () Bool)

(assert (=> mapNonEmpty!42448 (= mapRes!42448 (and tp!81149 e!626495))))

(declare-fun mapKey!42448 () (_ BitVec 32))

(declare-fun mapValue!42448 () ValueCell!12852)

(declare-fun mapRest!42448 () (Array (_ BitVec 32) ValueCell!12852))

(assert (=> mapNonEmpty!42448 (= (arr!34250 _values!874) (store mapRest!42448 mapKey!42448 mapValue!42448))))

(declare-fun b!1097697 () Bool)

(declare-fun res!732606 () Bool)

(assert (=> b!1097697 (=> (not res!732606) (not e!626492))))

(assert (=> b!1097697 (= res!732606 (= (select (arr!34249 _keys!1070) i!650) k0!904))))

(assert (= (and start!96520 res!732613) b!1097685))

(assert (= (and b!1097685 res!732609) b!1097696))

(assert (= (and b!1097696 res!732614) b!1097694))

(assert (= (and b!1097694 res!732615) b!1097692))

(assert (= (and b!1097692 res!732608) b!1097688))

(assert (= (and b!1097688 res!732610) b!1097697))

(assert (= (and b!1097697 res!732606) b!1097695))

(assert (= (and b!1097695 res!732612) b!1097693))

(assert (= (and b!1097693 res!732607) b!1097690))

(assert (= (and b!1097690 (not res!732611)) b!1097686))

(assert (= (and b!1097689 condMapEmpty!42448) mapIsEmpty!42448))

(assert (= (and b!1097689 (not condMapEmpty!42448)) mapNonEmpty!42448))

(get-info :version)

(assert (= (and mapNonEmpty!42448 ((_ is ValueCellFull!12852) mapValue!42448)) b!1097691))

(assert (= (and b!1097689 ((_ is ValueCellFull!12852) mapDefault!42448)) b!1097687))

(assert (= start!96520 b!1097689))

(declare-fun b_lambda!17761 () Bool)

(assert (=> (not b_lambda!17761) (not b!1097690)))

(declare-fun t!34034 () Bool)

(declare-fun tb!7939 () Bool)

(assert (=> (and start!96520 (= defaultEntry!882 defaultEntry!882) t!34034) tb!7939))

(declare-fun result!16403 () Bool)

(assert (=> tb!7939 (= result!16403 tp_is_empty!27123)))

(assert (=> b!1097690 t!34034))

(declare-fun b_and!36825 () Bool)

(assert (= b_and!36823 (and (=> t!34034 result!16403) b_and!36825)))

(declare-fun m!1017195 () Bool)

(assert (=> b!1097695 m!1017195))

(declare-fun m!1017197 () Bool)

(assert (=> b!1097695 m!1017197))

(declare-fun m!1017199 () Bool)

(assert (=> mapNonEmpty!42448 m!1017199))

(declare-fun m!1017201 () Bool)

(assert (=> b!1097686 m!1017201))

(assert (=> b!1097686 m!1017201))

(declare-fun m!1017203 () Bool)

(assert (=> b!1097686 m!1017203))

(declare-fun m!1017205 () Bool)

(assert (=> b!1097686 m!1017205))

(assert (=> b!1097686 m!1017205))

(declare-fun m!1017207 () Bool)

(assert (=> b!1097686 m!1017207))

(declare-fun m!1017209 () Bool)

(assert (=> b!1097688 m!1017209))

(declare-fun m!1017211 () Bool)

(assert (=> b!1097693 m!1017211))

(declare-fun m!1017213 () Bool)

(assert (=> start!96520 m!1017213))

(declare-fun m!1017215 () Bool)

(assert (=> start!96520 m!1017215))

(declare-fun m!1017217 () Bool)

(assert (=> start!96520 m!1017217))

(declare-fun m!1017219 () Bool)

(assert (=> b!1097694 m!1017219))

(declare-fun m!1017221 () Bool)

(assert (=> b!1097690 m!1017221))

(declare-fun m!1017223 () Bool)

(assert (=> b!1097690 m!1017223))

(declare-fun m!1017225 () Bool)

(assert (=> b!1097690 m!1017225))

(declare-fun m!1017227 () Bool)

(assert (=> b!1097690 m!1017227))

(declare-fun m!1017229 () Bool)

(assert (=> b!1097690 m!1017229))

(declare-fun m!1017231 () Bool)

(assert (=> b!1097690 m!1017231))

(declare-fun m!1017233 () Bool)

(assert (=> b!1097690 m!1017233))

(declare-fun m!1017235 () Bool)

(assert (=> b!1097690 m!1017235))

(declare-fun m!1017237 () Bool)

(assert (=> b!1097690 m!1017237))

(declare-fun m!1017239 () Bool)

(assert (=> b!1097690 m!1017239))

(declare-fun m!1017241 () Bool)

(assert (=> b!1097697 m!1017241))

(declare-fun m!1017243 () Bool)

(assert (=> b!1097696 m!1017243))

(check-sat (not b!1097696) (not mapNonEmpty!42448) (not b_lambda!17761) (not b!1097695) (not b!1097688) (not b!1097694) (not b!1097690) b_and!36825 (not b!1097686) (not b_next!23073) (not start!96520) tp_is_empty!27123 (not b!1097693))
(check-sat b_and!36825 (not b_next!23073))
(get-model)

(declare-fun b_lambda!17765 () Bool)

(assert (= b_lambda!17761 (or (and start!96520 b_free!23073) b_lambda!17765)))

(check-sat (not b!1097696) (not mapNonEmpty!42448) (not b!1097695) (not b!1097688) (not b!1097694) (not b!1097690) b_and!36825 (not b_lambda!17765) (not b!1097686) (not b_next!23073) (not start!96520) tp_is_empty!27123 (not b!1097693))
(check-sat b_and!36825 (not b_next!23073))
(get-model)

(declare-fun d!130331 () Bool)

(declare-fun e!626522 () Bool)

(assert (=> d!130331 e!626522))

(declare-fun res!732650 () Bool)

(assert (=> d!130331 (=> (not res!732650) (not e!626522))))

(declare-fun lt!490816 () ListLongMap!15263)

(declare-fun contains!6380 (ListLongMap!15263 (_ BitVec 64)) Bool)

(assert (=> d!130331 (= res!732650 (contains!6380 lt!490816 (_1!8658 lt!490762)))))

(declare-fun lt!490813 () List!23916)

(assert (=> d!130331 (= lt!490816 (ListLongMap!15264 lt!490813))))

(declare-fun lt!490814 () Unit!36108)

(declare-fun lt!490815 () Unit!36108)

(assert (=> d!130331 (= lt!490814 lt!490815)))

(declare-datatypes ((Option!670 0))(
  ( (Some!669 (v!16242 V!41291)) (None!668) )
))
(declare-fun getValueByKey!619 (List!23916 (_ BitVec 64)) Option!670)

(assert (=> d!130331 (= (getValueByKey!619 lt!490813 (_1!8658 lt!490762)) (Some!669 (_2!8658 lt!490762)))))

(declare-fun lemmaContainsTupThenGetReturnValue!296 (List!23916 (_ BitVec 64) V!41291) Unit!36108)

(assert (=> d!130331 (= lt!490815 (lemmaContainsTupThenGetReturnValue!296 lt!490813 (_1!8658 lt!490762) (_2!8658 lt!490762)))))

(declare-fun insertStrictlySorted!389 (List!23916 (_ BitVec 64) V!41291) List!23916)

(assert (=> d!130331 (= lt!490813 (insertStrictlySorted!389 (toList!7647 (+!3357 lt!490766 lt!490767)) (_1!8658 lt!490762) (_2!8658 lt!490762)))))

(assert (=> d!130331 (= (+!3357 (+!3357 lt!490766 lt!490767) lt!490762) lt!490816)))

(declare-fun b!1097745 () Bool)

(declare-fun res!732651 () Bool)

(assert (=> b!1097745 (=> (not res!732651) (not e!626522))))

(assert (=> b!1097745 (= res!732651 (= (getValueByKey!619 (toList!7647 lt!490816) (_1!8658 lt!490762)) (Some!669 (_2!8658 lt!490762))))))

(declare-fun b!1097746 () Bool)

(declare-fun contains!6381 (List!23916 tuple2!17294) Bool)

(assert (=> b!1097746 (= e!626522 (contains!6381 (toList!7647 lt!490816) lt!490762))))

(assert (= (and d!130331 res!732650) b!1097745))

(assert (= (and b!1097745 res!732651) b!1097746))

(declare-fun m!1017295 () Bool)

(assert (=> d!130331 m!1017295))

(declare-fun m!1017297 () Bool)

(assert (=> d!130331 m!1017297))

(declare-fun m!1017299 () Bool)

(assert (=> d!130331 m!1017299))

(declare-fun m!1017301 () Bool)

(assert (=> d!130331 m!1017301))

(declare-fun m!1017303 () Bool)

(assert (=> b!1097745 m!1017303))

(declare-fun m!1017305 () Bool)

(assert (=> b!1097746 m!1017305))

(assert (=> b!1097686 d!130331))

(declare-fun d!130333 () Bool)

(declare-fun e!626523 () Bool)

(assert (=> d!130333 e!626523))

(declare-fun res!732652 () Bool)

(assert (=> d!130333 (=> (not res!732652) (not e!626523))))

(declare-fun lt!490820 () ListLongMap!15263)

(assert (=> d!130333 (= res!732652 (contains!6380 lt!490820 (_1!8658 lt!490767)))))

(declare-fun lt!490817 () List!23916)

(assert (=> d!130333 (= lt!490820 (ListLongMap!15264 lt!490817))))

(declare-fun lt!490818 () Unit!36108)

(declare-fun lt!490819 () Unit!36108)

(assert (=> d!130333 (= lt!490818 lt!490819)))

(assert (=> d!130333 (= (getValueByKey!619 lt!490817 (_1!8658 lt!490767)) (Some!669 (_2!8658 lt!490767)))))

(assert (=> d!130333 (= lt!490819 (lemmaContainsTupThenGetReturnValue!296 lt!490817 (_1!8658 lt!490767) (_2!8658 lt!490767)))))

(assert (=> d!130333 (= lt!490817 (insertStrictlySorted!389 (toList!7647 lt!490766) (_1!8658 lt!490767) (_2!8658 lt!490767)))))

(assert (=> d!130333 (= (+!3357 lt!490766 lt!490767) lt!490820)))

(declare-fun b!1097747 () Bool)

(declare-fun res!732653 () Bool)

(assert (=> b!1097747 (=> (not res!732653) (not e!626523))))

(assert (=> b!1097747 (= res!732653 (= (getValueByKey!619 (toList!7647 lt!490820) (_1!8658 lt!490767)) (Some!669 (_2!8658 lt!490767))))))

(declare-fun b!1097748 () Bool)

(assert (=> b!1097748 (= e!626523 (contains!6381 (toList!7647 lt!490820) lt!490767))))

(assert (= (and d!130333 res!732652) b!1097747))

(assert (= (and b!1097747 res!732653) b!1097748))

(declare-fun m!1017307 () Bool)

(assert (=> d!130333 m!1017307))

(declare-fun m!1017309 () Bool)

(assert (=> d!130333 m!1017309))

(declare-fun m!1017311 () Bool)

(assert (=> d!130333 m!1017311))

(declare-fun m!1017313 () Bool)

(assert (=> d!130333 m!1017313))

(declare-fun m!1017315 () Bool)

(assert (=> b!1097747 m!1017315))

(declare-fun m!1017317 () Bool)

(assert (=> b!1097748 m!1017317))

(assert (=> b!1097686 d!130333))

(declare-fun d!130335 () Bool)

(declare-fun e!626524 () Bool)

(assert (=> d!130335 e!626524))

(declare-fun res!732654 () Bool)

(assert (=> d!130335 (=> (not res!732654) (not e!626524))))

(declare-fun lt!490824 () ListLongMap!15263)

(assert (=> d!130335 (= res!732654 (contains!6380 lt!490824 (_1!8658 lt!490762)))))

(declare-fun lt!490821 () List!23916)

(assert (=> d!130335 (= lt!490824 (ListLongMap!15264 lt!490821))))

(declare-fun lt!490822 () Unit!36108)

(declare-fun lt!490823 () Unit!36108)

(assert (=> d!130335 (= lt!490822 lt!490823)))

(assert (=> d!130335 (= (getValueByKey!619 lt!490821 (_1!8658 lt!490762)) (Some!669 (_2!8658 lt!490762)))))

(assert (=> d!130335 (= lt!490823 (lemmaContainsTupThenGetReturnValue!296 lt!490821 (_1!8658 lt!490762) (_2!8658 lt!490762)))))

(assert (=> d!130335 (= lt!490821 (insertStrictlySorted!389 (toList!7647 (+!3357 lt!490768 lt!490767)) (_1!8658 lt!490762) (_2!8658 lt!490762)))))

(assert (=> d!130335 (= (+!3357 (+!3357 lt!490768 lt!490767) lt!490762) lt!490824)))

(declare-fun b!1097749 () Bool)

(declare-fun res!732655 () Bool)

(assert (=> b!1097749 (=> (not res!732655) (not e!626524))))

(assert (=> b!1097749 (= res!732655 (= (getValueByKey!619 (toList!7647 lt!490824) (_1!8658 lt!490762)) (Some!669 (_2!8658 lt!490762))))))

(declare-fun b!1097750 () Bool)

(assert (=> b!1097750 (= e!626524 (contains!6381 (toList!7647 lt!490824) lt!490762))))

(assert (= (and d!130335 res!732654) b!1097749))

(assert (= (and b!1097749 res!732655) b!1097750))

(declare-fun m!1017319 () Bool)

(assert (=> d!130335 m!1017319))

(declare-fun m!1017321 () Bool)

(assert (=> d!130335 m!1017321))

(declare-fun m!1017323 () Bool)

(assert (=> d!130335 m!1017323))

(declare-fun m!1017325 () Bool)

(assert (=> d!130335 m!1017325))

(declare-fun m!1017327 () Bool)

(assert (=> b!1097749 m!1017327))

(declare-fun m!1017329 () Bool)

(assert (=> b!1097750 m!1017329))

(assert (=> b!1097686 d!130335))

(declare-fun d!130337 () Bool)

(declare-fun e!626525 () Bool)

(assert (=> d!130337 e!626525))

(declare-fun res!732656 () Bool)

(assert (=> d!130337 (=> (not res!732656) (not e!626525))))

(declare-fun lt!490828 () ListLongMap!15263)

(assert (=> d!130337 (= res!732656 (contains!6380 lt!490828 (_1!8658 lt!490767)))))

(declare-fun lt!490825 () List!23916)

(assert (=> d!130337 (= lt!490828 (ListLongMap!15264 lt!490825))))

(declare-fun lt!490826 () Unit!36108)

(declare-fun lt!490827 () Unit!36108)

(assert (=> d!130337 (= lt!490826 lt!490827)))

(assert (=> d!130337 (= (getValueByKey!619 lt!490825 (_1!8658 lt!490767)) (Some!669 (_2!8658 lt!490767)))))

(assert (=> d!130337 (= lt!490827 (lemmaContainsTupThenGetReturnValue!296 lt!490825 (_1!8658 lt!490767) (_2!8658 lt!490767)))))

(assert (=> d!130337 (= lt!490825 (insertStrictlySorted!389 (toList!7647 lt!490768) (_1!8658 lt!490767) (_2!8658 lt!490767)))))

(assert (=> d!130337 (= (+!3357 lt!490768 lt!490767) lt!490828)))

(declare-fun b!1097751 () Bool)

(declare-fun res!732657 () Bool)

(assert (=> b!1097751 (=> (not res!732657) (not e!626525))))

(assert (=> b!1097751 (= res!732657 (= (getValueByKey!619 (toList!7647 lt!490828) (_1!8658 lt!490767)) (Some!669 (_2!8658 lt!490767))))))

(declare-fun b!1097752 () Bool)

(assert (=> b!1097752 (= e!626525 (contains!6381 (toList!7647 lt!490828) lt!490767))))

(assert (= (and d!130337 res!732656) b!1097751))

(assert (= (and b!1097751 res!732657) b!1097752))

(declare-fun m!1017331 () Bool)

(assert (=> d!130337 m!1017331))

(declare-fun m!1017333 () Bool)

(assert (=> d!130337 m!1017333))

(declare-fun m!1017335 () Bool)

(assert (=> d!130337 m!1017335))

(declare-fun m!1017337 () Bool)

(assert (=> d!130337 m!1017337))

(declare-fun m!1017339 () Bool)

(assert (=> b!1097751 m!1017339))

(declare-fun m!1017341 () Bool)

(assert (=> b!1097752 m!1017341))

(assert (=> b!1097686 d!130337))

(declare-fun b!1097761 () Bool)

(declare-fun e!626534 () Bool)

(declare-fun call!45813 () Bool)

(assert (=> b!1097761 (= e!626534 call!45813)))

(declare-fun b!1097762 () Bool)

(declare-fun e!626533 () Bool)

(assert (=> b!1097762 (= e!626533 e!626534)))

(declare-fun c!108412 () Bool)

(assert (=> b!1097762 (= c!108412 (validKeyInArray!0 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130339 () Bool)

(declare-fun res!732662 () Bool)

(assert (=> d!130339 (=> res!732662 e!626533)))

(assert (=> d!130339 (= res!732662 (bvsge #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> d!130339 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!626533)))

(declare-fun b!1097763 () Bool)

(declare-fun e!626532 () Bool)

(assert (=> b!1097763 (= e!626532 call!45813)))

(declare-fun bm!45810 () Bool)

(assert (=> bm!45810 (= call!45813 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1097764 () Bool)

(assert (=> b!1097764 (= e!626534 e!626532)))

(declare-fun lt!490835 () (_ BitVec 64))

(assert (=> b!1097764 (= lt!490835 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490836 () Unit!36108)

(assert (=> b!1097764 (= lt!490836 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!490835 #b00000000000000000000000000000000))))

(assert (=> b!1097764 (arrayContainsKey!0 _keys!1070 lt!490835 #b00000000000000000000000000000000)))

(declare-fun lt!490837 () Unit!36108)

(assert (=> b!1097764 (= lt!490837 lt!490836)))

(declare-fun res!732663 () Bool)

(declare-datatypes ((SeekEntryResult!9907 0))(
  ( (MissingZero!9907 (index!41999 (_ BitVec 32))) (Found!9907 (index!42000 (_ BitVec 32))) (Intermediate!9907 (undefined!10719 Bool) (index!42001 (_ BitVec 32)) (x!98736 (_ BitVec 32))) (Undefined!9907) (MissingVacant!9907 (index!42002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71157 (_ BitVec 32)) SeekEntryResult!9907)

(assert (=> b!1097764 (= res!732663 (= (seekEntryOrOpen!0 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9907 #b00000000000000000000000000000000)))))

(assert (=> b!1097764 (=> (not res!732663) (not e!626532))))

(assert (= (and d!130339 (not res!732662)) b!1097762))

(assert (= (and b!1097762 c!108412) b!1097764))

(assert (= (and b!1097762 (not c!108412)) b!1097761))

(assert (= (and b!1097764 res!732663) b!1097763))

(assert (= (or b!1097763 b!1097761) bm!45810))

(declare-fun m!1017343 () Bool)

(assert (=> b!1097762 m!1017343))

(assert (=> b!1097762 m!1017343))

(declare-fun m!1017345 () Bool)

(assert (=> b!1097762 m!1017345))

(declare-fun m!1017347 () Bool)

(assert (=> bm!45810 m!1017347))

(assert (=> b!1097764 m!1017343))

(declare-fun m!1017349 () Bool)

(assert (=> b!1097764 m!1017349))

(declare-fun m!1017351 () Bool)

(assert (=> b!1097764 m!1017351))

(assert (=> b!1097764 m!1017343))

(declare-fun m!1017353 () Bool)

(assert (=> b!1097764 m!1017353))

(assert (=> b!1097696 d!130339))

(declare-fun d!130341 () Bool)

(declare-fun res!732671 () Bool)

(declare-fun e!626544 () Bool)

(assert (=> d!130341 (=> res!732671 e!626544)))

(assert (=> d!130341 (= res!732671 (bvsge #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(assert (=> d!130341 (= (arrayNoDuplicates!0 lt!490770 #b00000000000000000000000000000000 Nil!23914) e!626544)))

(declare-fun bm!45813 () Bool)

(declare-fun call!45816 () Bool)

(declare-fun c!108415 () Bool)

(assert (=> bm!45813 (= call!45816 (arrayNoDuplicates!0 lt!490770 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108415 (Cons!23913 (select (arr!34249 lt!490770) #b00000000000000000000000000000000) Nil!23914) Nil!23914)))))

(declare-fun b!1097775 () Bool)

(declare-fun e!626545 () Bool)

(declare-fun contains!6382 (List!23917 (_ BitVec 64)) Bool)

(assert (=> b!1097775 (= e!626545 (contains!6382 Nil!23914 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(declare-fun b!1097776 () Bool)

(declare-fun e!626543 () Bool)

(declare-fun e!626546 () Bool)

(assert (=> b!1097776 (= e!626543 e!626546)))

(assert (=> b!1097776 (= c!108415 (validKeyInArray!0 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(declare-fun b!1097777 () Bool)

(assert (=> b!1097777 (= e!626546 call!45816)))

(declare-fun b!1097778 () Bool)

(assert (=> b!1097778 (= e!626546 call!45816)))

(declare-fun b!1097779 () Bool)

(assert (=> b!1097779 (= e!626544 e!626543)))

(declare-fun res!732670 () Bool)

(assert (=> b!1097779 (=> (not res!732670) (not e!626543))))

(assert (=> b!1097779 (= res!732670 (not e!626545))))

(declare-fun res!732672 () Bool)

(assert (=> b!1097779 (=> (not res!732672) (not e!626545))))

(assert (=> b!1097779 (= res!732672 (validKeyInArray!0 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(assert (= (and d!130341 (not res!732671)) b!1097779))

(assert (= (and b!1097779 res!732672) b!1097775))

(assert (= (and b!1097779 res!732670) b!1097776))

(assert (= (and b!1097776 c!108415) b!1097778))

(assert (= (and b!1097776 (not c!108415)) b!1097777))

(assert (= (or b!1097778 b!1097777) bm!45813))

(declare-fun m!1017355 () Bool)

(assert (=> bm!45813 m!1017355))

(declare-fun m!1017357 () Bool)

(assert (=> bm!45813 m!1017357))

(assert (=> b!1097775 m!1017355))

(assert (=> b!1097775 m!1017355))

(declare-fun m!1017359 () Bool)

(assert (=> b!1097775 m!1017359))

(assert (=> b!1097776 m!1017355))

(assert (=> b!1097776 m!1017355))

(declare-fun m!1017361 () Bool)

(assert (=> b!1097776 m!1017361))

(assert (=> b!1097779 m!1017355))

(assert (=> b!1097779 m!1017355))

(assert (=> b!1097779 m!1017361))

(assert (=> b!1097693 d!130341))

(declare-fun d!130343 () Bool)

(assert (=> d!130343 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96520 d!130343))

(declare-fun d!130345 () Bool)

(assert (=> d!130345 (= (array_inv!26386 _keys!1070) (bvsge (size!34785 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96520 d!130345))

(declare-fun d!130347 () Bool)

(assert (=> d!130347 (= (array_inv!26387 _values!874) (bvsge (size!34786 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96520 d!130347))

(declare-fun d!130349 () Bool)

(assert (=> d!130349 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097688 d!130349))

(declare-fun d!130351 () Bool)

(declare-fun res!732674 () Bool)

(declare-fun e!626548 () Bool)

(assert (=> d!130351 (=> res!732674 e!626548)))

(assert (=> d!130351 (= res!732674 (bvsge #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> d!130351 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23914) e!626548)))

(declare-fun bm!45814 () Bool)

(declare-fun call!45817 () Bool)

(declare-fun c!108416 () Bool)

(assert (=> bm!45814 (= call!45817 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108416 (Cons!23913 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000) Nil!23914) Nil!23914)))))

(declare-fun b!1097780 () Bool)

(declare-fun e!626549 () Bool)

(assert (=> b!1097780 (= e!626549 (contains!6382 Nil!23914 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097781 () Bool)

(declare-fun e!626547 () Bool)

(declare-fun e!626550 () Bool)

(assert (=> b!1097781 (= e!626547 e!626550)))

(assert (=> b!1097781 (= c!108416 (validKeyInArray!0 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097782 () Bool)

(assert (=> b!1097782 (= e!626550 call!45817)))

(declare-fun b!1097783 () Bool)

(assert (=> b!1097783 (= e!626550 call!45817)))

(declare-fun b!1097784 () Bool)

(assert (=> b!1097784 (= e!626548 e!626547)))

(declare-fun res!732673 () Bool)

(assert (=> b!1097784 (=> (not res!732673) (not e!626547))))

(assert (=> b!1097784 (= res!732673 (not e!626549))))

(declare-fun res!732675 () Bool)

(assert (=> b!1097784 (=> (not res!732675) (not e!626549))))

(assert (=> b!1097784 (= res!732675 (validKeyInArray!0 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130351 (not res!732674)) b!1097784))

(assert (= (and b!1097784 res!732675) b!1097780))

(assert (= (and b!1097784 res!732673) b!1097781))

(assert (= (and b!1097781 c!108416) b!1097783))

(assert (= (and b!1097781 (not c!108416)) b!1097782))

(assert (= (or b!1097783 b!1097782) bm!45814))

(assert (=> bm!45814 m!1017343))

(declare-fun m!1017363 () Bool)

(assert (=> bm!45814 m!1017363))

(assert (=> b!1097780 m!1017343))

(assert (=> b!1097780 m!1017343))

(declare-fun m!1017365 () Bool)

(assert (=> b!1097780 m!1017365))

(assert (=> b!1097781 m!1017343))

(assert (=> b!1097781 m!1017343))

(assert (=> b!1097781 m!1017345))

(assert (=> b!1097784 m!1017343))

(assert (=> b!1097784 m!1017343))

(assert (=> b!1097784 m!1017345))

(assert (=> b!1097694 d!130351))

(declare-fun d!130353 () Bool)

(declare-fun res!732680 () Bool)

(declare-fun e!626555 () Bool)

(assert (=> d!130353 (=> res!732680 e!626555)))

(assert (=> d!130353 (= res!732680 (= (select (arr!34249 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130353 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!626555)))

(declare-fun b!1097789 () Bool)

(declare-fun e!626556 () Bool)

(assert (=> b!1097789 (= e!626555 e!626556)))

(declare-fun res!732681 () Bool)

(assert (=> b!1097789 (=> (not res!732681) (not e!626556))))

(assert (=> b!1097789 (= res!732681 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34785 _keys!1070)))))

(declare-fun b!1097790 () Bool)

(assert (=> b!1097790 (= e!626556 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130353 (not res!732680)) b!1097789))

(assert (= (and b!1097789 res!732681) b!1097790))

(assert (=> d!130353 m!1017343))

(declare-fun m!1017367 () Bool)

(assert (=> b!1097790 m!1017367))

(assert (=> b!1097690 d!130353))

(declare-fun b!1097833 () Bool)

(declare-fun e!626593 () Bool)

(declare-fun lt!490901 () ListLongMap!15263)

(declare-fun apply!944 (ListLongMap!15263 (_ BitVec 64)) V!41291)

(assert (=> b!1097833 (= e!626593 (= (apply!944 lt!490901 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1097834 () Bool)

(declare-fun e!626588 () ListLongMap!15263)

(declare-fun call!45838 () ListLongMap!15263)

(assert (=> b!1097834 (= e!626588 call!45838)))

(declare-fun b!1097835 () Bool)

(declare-fun e!626587 () Bool)

(assert (=> b!1097835 (= e!626587 (validKeyInArray!0 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45829 () Bool)

(declare-fun call!45832 () Bool)

(assert (=> bm!45829 (= call!45832 (contains!6380 lt!490901 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097836 () Bool)

(declare-fun e!626594 () Bool)

(assert (=> b!1097836 (= e!626594 (not call!45832))))

(declare-fun bm!45830 () Bool)

(declare-fun call!45837 () ListLongMap!15263)

(assert (=> bm!45830 (= call!45838 call!45837)))

(declare-fun b!1097837 () Bool)

(declare-fun call!45834 () ListLongMap!15263)

(assert (=> b!1097837 (= e!626588 call!45834)))

(declare-fun b!1097838 () Bool)

(declare-fun e!626591 () Bool)

(declare-fun call!45836 () Bool)

(assert (=> b!1097838 (= e!626591 (not call!45836))))

(declare-fun b!1097839 () Bool)

(declare-fun e!626589 () ListLongMap!15263)

(declare-fun call!45833 () ListLongMap!15263)

(assert (=> b!1097839 (= e!626589 (+!3357 call!45833 (tuple2!17295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1097840 () Bool)

(declare-fun e!626583 () Bool)

(assert (=> b!1097840 (= e!626583 e!626591)))

(declare-fun c!108433 () Bool)

(assert (=> b!1097840 (= c!108433 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097841 () Bool)

(declare-fun res!732700 () Bool)

(assert (=> b!1097841 (=> (not res!732700) (not e!626583))))

(assert (=> b!1097841 (= res!732700 e!626594)))

(declare-fun c!108434 () Bool)

(assert (=> b!1097841 (= c!108434 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1097842 () Bool)

(declare-fun e!626585 () Bool)

(assert (=> b!1097842 (= e!626585 (validKeyInArray!0 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097843 () Bool)

(assert (=> b!1097843 (= e!626594 e!626593)))

(declare-fun res!732701 () Bool)

(assert (=> b!1097843 (= res!732701 call!45832)))

(assert (=> b!1097843 (=> (not res!732701) (not e!626593))))

(declare-fun call!45835 () ListLongMap!15263)

(declare-fun bm!45831 () Bool)

(assert (=> bm!45831 (= call!45835 (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097844 () Bool)

(declare-fun e!626592 () ListLongMap!15263)

(assert (=> b!1097844 (= e!626589 e!626592)))

(declare-fun c!108430 () Bool)

(assert (=> b!1097844 (= c!108430 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!130355 () Bool)

(assert (=> d!130355 e!626583))

(declare-fun res!732705 () Bool)

(assert (=> d!130355 (=> (not res!732705) (not e!626583))))

(assert (=> d!130355 (= res!732705 (or (bvsge #b00000000000000000000000000000000 (size!34785 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))))

(declare-fun lt!490892 () ListLongMap!15263)

(assert (=> d!130355 (= lt!490901 lt!490892)))

(declare-fun lt!490882 () Unit!36108)

(declare-fun e!626586 () Unit!36108)

(assert (=> d!130355 (= lt!490882 e!626586)))

(declare-fun c!108432 () Bool)

(assert (=> d!130355 (= c!108432 e!626587)))

(declare-fun res!732706 () Bool)

(assert (=> d!130355 (=> (not res!732706) (not e!626587))))

(assert (=> d!130355 (= res!732706 (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> d!130355 (= lt!490892 e!626589)))

(declare-fun c!108429 () Bool)

(assert (=> d!130355 (= c!108429 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130355 (validMask!0 mask!1414)))

(assert (=> d!130355 (= (getCurrentListMap!4367 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490901)))

(declare-fun e!626595 () Bool)

(declare-fun b!1097845 () Bool)

(declare-fun get!17614 (ValueCell!12852 V!41291) V!41291)

(assert (=> b!1097845 (= e!626595 (= (apply!944 lt!490901 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)) (get!17614 (select (arr!34250 _values!874) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097845 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34786 _values!874)))))

(assert (=> b!1097845 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun bm!45832 () Bool)

(assert (=> bm!45832 (= call!45833 (+!3357 (ite c!108429 call!45835 (ite c!108430 call!45837 call!45838)) (ite (or c!108429 c!108430) (tuple2!17295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1097846 () Bool)

(declare-fun Unit!36112 () Unit!36108)

(assert (=> b!1097846 (= e!626586 Unit!36112)))

(declare-fun bm!45833 () Bool)

(assert (=> bm!45833 (= call!45837 call!45835)))

(declare-fun b!1097847 () Bool)

(assert (=> b!1097847 (= e!626592 call!45834)))

(declare-fun bm!45834 () Bool)

(assert (=> bm!45834 (= call!45836 (contains!6380 lt!490901 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097848 () Bool)

(declare-fun e!626584 () Bool)

(assert (=> b!1097848 (= e!626584 e!626595)))

(declare-fun res!732708 () Bool)

(assert (=> b!1097848 (=> (not res!732708) (not e!626595))))

(assert (=> b!1097848 (= res!732708 (contains!6380 lt!490901 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097848 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun b!1097849 () Bool)

(declare-fun c!108431 () Bool)

(assert (=> b!1097849 (= c!108431 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1097849 (= e!626592 e!626588)))

(declare-fun bm!45835 () Bool)

(assert (=> bm!45835 (= call!45834 call!45833)))

(declare-fun b!1097850 () Bool)

(declare-fun e!626590 () Bool)

(assert (=> b!1097850 (= e!626591 e!626590)))

(declare-fun res!732702 () Bool)

(assert (=> b!1097850 (= res!732702 call!45836)))

(assert (=> b!1097850 (=> (not res!732702) (not e!626590))))

(declare-fun b!1097851 () Bool)

(declare-fun lt!490889 () Unit!36108)

(assert (=> b!1097851 (= e!626586 lt!490889)))

(declare-fun lt!490900 () ListLongMap!15263)

(assert (=> b!1097851 (= lt!490900 (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490887 () (_ BitVec 64))

(assert (=> b!1097851 (= lt!490887 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490895 () (_ BitVec 64))

(assert (=> b!1097851 (= lt!490895 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490903 () Unit!36108)

(declare-fun addStillContains!657 (ListLongMap!15263 (_ BitVec 64) V!41291 (_ BitVec 64)) Unit!36108)

(assert (=> b!1097851 (= lt!490903 (addStillContains!657 lt!490900 lt!490887 zeroValue!831 lt!490895))))

(assert (=> b!1097851 (contains!6380 (+!3357 lt!490900 (tuple2!17295 lt!490887 zeroValue!831)) lt!490895)))

(declare-fun lt!490896 () Unit!36108)

(assert (=> b!1097851 (= lt!490896 lt!490903)))

(declare-fun lt!490883 () ListLongMap!15263)

(assert (=> b!1097851 (= lt!490883 (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490897 () (_ BitVec 64))

(assert (=> b!1097851 (= lt!490897 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490884 () (_ BitVec 64))

(assert (=> b!1097851 (= lt!490884 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490893 () Unit!36108)

(declare-fun addApplyDifferent!517 (ListLongMap!15263 (_ BitVec 64) V!41291 (_ BitVec 64)) Unit!36108)

(assert (=> b!1097851 (= lt!490893 (addApplyDifferent!517 lt!490883 lt!490897 minValue!831 lt!490884))))

(assert (=> b!1097851 (= (apply!944 (+!3357 lt!490883 (tuple2!17295 lt!490897 minValue!831)) lt!490884) (apply!944 lt!490883 lt!490884))))

(declare-fun lt!490899 () Unit!36108)

(assert (=> b!1097851 (= lt!490899 lt!490893)))

(declare-fun lt!490891 () ListLongMap!15263)

(assert (=> b!1097851 (= lt!490891 (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490886 () (_ BitVec 64))

(assert (=> b!1097851 (= lt!490886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490894 () (_ BitVec 64))

(assert (=> b!1097851 (= lt!490894 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490898 () Unit!36108)

(assert (=> b!1097851 (= lt!490898 (addApplyDifferent!517 lt!490891 lt!490886 zeroValue!831 lt!490894))))

(assert (=> b!1097851 (= (apply!944 (+!3357 lt!490891 (tuple2!17295 lt!490886 zeroValue!831)) lt!490894) (apply!944 lt!490891 lt!490894))))

(declare-fun lt!490885 () Unit!36108)

(assert (=> b!1097851 (= lt!490885 lt!490898)))

(declare-fun lt!490902 () ListLongMap!15263)

(assert (=> b!1097851 (= lt!490902 (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490890 () (_ BitVec 64))

(assert (=> b!1097851 (= lt!490890 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490888 () (_ BitVec 64))

(assert (=> b!1097851 (= lt!490888 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1097851 (= lt!490889 (addApplyDifferent!517 lt!490902 lt!490890 minValue!831 lt!490888))))

(assert (=> b!1097851 (= (apply!944 (+!3357 lt!490902 (tuple2!17295 lt!490890 minValue!831)) lt!490888) (apply!944 lt!490902 lt!490888))))

(declare-fun b!1097852 () Bool)

(declare-fun res!732707 () Bool)

(assert (=> b!1097852 (=> (not res!732707) (not e!626583))))

(assert (=> b!1097852 (= res!732707 e!626584)))

(declare-fun res!732704 () Bool)

(assert (=> b!1097852 (=> res!732704 e!626584)))

(assert (=> b!1097852 (= res!732704 (not e!626585))))

(declare-fun res!732703 () Bool)

(assert (=> b!1097852 (=> (not res!732703) (not e!626585))))

(assert (=> b!1097852 (= res!732703 (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun b!1097853 () Bool)

(assert (=> b!1097853 (= e!626590 (= (apply!944 lt!490901 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(assert (= (and d!130355 c!108429) b!1097839))

(assert (= (and d!130355 (not c!108429)) b!1097844))

(assert (= (and b!1097844 c!108430) b!1097847))

(assert (= (and b!1097844 (not c!108430)) b!1097849))

(assert (= (and b!1097849 c!108431) b!1097837))

(assert (= (and b!1097849 (not c!108431)) b!1097834))

(assert (= (or b!1097837 b!1097834) bm!45830))

(assert (= (or b!1097847 bm!45830) bm!45833))

(assert (= (or b!1097847 b!1097837) bm!45835))

(assert (= (or b!1097839 bm!45833) bm!45831))

(assert (= (or b!1097839 bm!45835) bm!45832))

(assert (= (and d!130355 res!732706) b!1097835))

(assert (= (and d!130355 c!108432) b!1097851))

(assert (= (and d!130355 (not c!108432)) b!1097846))

(assert (= (and d!130355 res!732705) b!1097852))

(assert (= (and b!1097852 res!732703) b!1097842))

(assert (= (and b!1097852 (not res!732704)) b!1097848))

(assert (= (and b!1097848 res!732708) b!1097845))

(assert (= (and b!1097852 res!732707) b!1097841))

(assert (= (and b!1097841 c!108434) b!1097843))

(assert (= (and b!1097841 (not c!108434)) b!1097836))

(assert (= (and b!1097843 res!732701) b!1097833))

(assert (= (or b!1097843 b!1097836) bm!45829))

(assert (= (and b!1097841 res!732700) b!1097840))

(assert (= (and b!1097840 c!108433) b!1097850))

(assert (= (and b!1097840 (not c!108433)) b!1097838))

(assert (= (and b!1097850 res!732702) b!1097853))

(assert (= (or b!1097850 b!1097838) bm!45834))

(declare-fun b_lambda!17767 () Bool)

(assert (=> (not b_lambda!17767) (not b!1097845)))

(assert (=> b!1097845 t!34034))

(declare-fun b_and!36831 () Bool)

(assert (= b_and!36825 (and (=> t!34034 result!16403) b_and!36831)))

(declare-fun m!1017369 () Bool)

(assert (=> b!1097853 m!1017369))

(declare-fun m!1017371 () Bool)

(assert (=> b!1097839 m!1017371))

(assert (=> b!1097845 m!1017343))

(declare-fun m!1017373 () Bool)

(assert (=> b!1097845 m!1017373))

(assert (=> b!1097845 m!1017233))

(declare-fun m!1017375 () Bool)

(assert (=> b!1097845 m!1017375))

(assert (=> b!1097845 m!1017375))

(assert (=> b!1097845 m!1017233))

(declare-fun m!1017377 () Bool)

(assert (=> b!1097845 m!1017377))

(assert (=> b!1097845 m!1017343))

(declare-fun m!1017379 () Bool)

(assert (=> bm!45832 m!1017379))

(assert (=> b!1097842 m!1017343))

(assert (=> b!1097842 m!1017343))

(assert (=> b!1097842 m!1017345))

(assert (=> b!1097848 m!1017343))

(assert (=> b!1097848 m!1017343))

(declare-fun m!1017381 () Bool)

(assert (=> b!1097848 m!1017381))

(declare-fun m!1017383 () Bool)

(assert (=> b!1097851 m!1017383))

(declare-fun m!1017385 () Bool)

(assert (=> b!1097851 m!1017385))

(declare-fun m!1017387 () Bool)

(assert (=> b!1097851 m!1017387))

(declare-fun m!1017389 () Bool)

(assert (=> b!1097851 m!1017389))

(declare-fun m!1017391 () Bool)

(assert (=> b!1097851 m!1017391))

(declare-fun m!1017393 () Bool)

(assert (=> b!1097851 m!1017393))

(declare-fun m!1017395 () Bool)

(assert (=> b!1097851 m!1017395))

(declare-fun m!1017397 () Bool)

(assert (=> b!1097851 m!1017397))

(declare-fun m!1017399 () Bool)

(assert (=> b!1097851 m!1017399))

(assert (=> b!1097851 m!1017385))

(assert (=> b!1097851 m!1017397))

(declare-fun m!1017401 () Bool)

(assert (=> b!1097851 m!1017401))

(assert (=> b!1097851 m!1017343))

(declare-fun m!1017403 () Bool)

(assert (=> b!1097851 m!1017403))

(assert (=> b!1097851 m!1017393))

(declare-fun m!1017405 () Bool)

(assert (=> b!1097851 m!1017405))

(assert (=> b!1097851 m!1017231))

(declare-fun m!1017407 () Bool)

(assert (=> b!1097851 m!1017407))

(assert (=> b!1097851 m!1017401))

(declare-fun m!1017409 () Bool)

(assert (=> b!1097851 m!1017409))

(declare-fun m!1017411 () Bool)

(assert (=> b!1097851 m!1017411))

(assert (=> b!1097835 m!1017343))

(assert (=> b!1097835 m!1017343))

(assert (=> b!1097835 m!1017345))

(declare-fun m!1017413 () Bool)

(assert (=> bm!45829 m!1017413))

(assert (=> bm!45831 m!1017231))

(declare-fun m!1017415 () Bool)

(assert (=> bm!45834 m!1017415))

(assert (=> d!130355 m!1017213))

(declare-fun m!1017417 () Bool)

(assert (=> b!1097833 m!1017417))

(assert (=> b!1097690 d!130355))

(declare-fun b!1097860 () Bool)

(declare-fun e!626601 () Bool)

(declare-fun call!45843 () ListLongMap!15263)

(declare-fun call!45844 () ListLongMap!15263)

(assert (=> b!1097860 (= e!626601 (= call!45843 call!45844))))

(assert (=> b!1097860 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34786 _values!874)))))

(declare-fun bm!45840 () Bool)

(assert (=> bm!45840 (= call!45844 (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!45841 () Bool)

(assert (=> bm!45841 (= call!45843 (getCurrentListMapNoExtraKeys!4163 (array!71158 (store (arr!34249 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34785 _keys!1070)) (array!71160 (store (arr!34250 _values!874) i!650 (ValueCellFull!12852 (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34786 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097861 () Bool)

(assert (=> b!1097861 (= e!626601 (= call!45843 (-!937 call!45844 k0!904)))))

(assert (=> b!1097861 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34786 _values!874)))))

(declare-fun b!1097862 () Bool)

(declare-fun e!626600 () Bool)

(assert (=> b!1097862 (= e!626600 e!626601)))

(declare-fun c!108437 () Bool)

(assert (=> b!1097862 (= c!108437 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun d!130357 () Bool)

(assert (=> d!130357 e!626600))

(declare-fun res!732711 () Bool)

(assert (=> d!130357 (=> (not res!732711) (not e!626600))))

(assert (=> d!130357 (= res!732711 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34785 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34785 _keys!1070))))))))

(declare-fun lt!490906 () Unit!36108)

(declare-fun choose!1762 (array!71157 array!71159 (_ BitVec 32) (_ BitVec 32) V!41291 V!41291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36108)

(assert (=> d!130357 (= lt!490906 (choose!1762 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> d!130357 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!193 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!490906)))

(assert (= (and d!130357 res!732711) b!1097862))

(assert (= (and b!1097862 c!108437) b!1097861))

(assert (= (and b!1097862 (not c!108437)) b!1097860))

(assert (= (or b!1097861 b!1097860) bm!45840))

(assert (= (or b!1097861 b!1097860) bm!45841))

(declare-fun b_lambda!17769 () Bool)

(assert (=> (not b_lambda!17769) (not bm!45841)))

(assert (=> bm!45841 t!34034))

(declare-fun b_and!36833 () Bool)

(assert (= b_and!36831 (and (=> t!34034 result!16403) b_and!36833)))

(assert (=> bm!45840 m!1017231))

(assert (=> bm!45841 m!1017197))

(assert (=> bm!45841 m!1017233))

(assert (=> bm!45841 m!1017223))

(declare-fun m!1017419 () Bool)

(assert (=> bm!45841 m!1017419))

(declare-fun m!1017421 () Bool)

(assert (=> b!1097861 m!1017421))

(declare-fun m!1017423 () Bool)

(assert (=> d!130357 m!1017423))

(assert (=> b!1097690 d!130357))

(declare-fun b!1097863 () Bool)

(declare-fun e!626612 () Bool)

(declare-fun lt!490926 () ListLongMap!15263)

(assert (=> b!1097863 (= e!626612 (= (apply!944 lt!490926 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1097864 () Bool)

(declare-fun e!626607 () ListLongMap!15263)

(declare-fun call!45851 () ListLongMap!15263)

(assert (=> b!1097864 (= e!626607 call!45851)))

(declare-fun b!1097865 () Bool)

(declare-fun e!626606 () Bool)

(assert (=> b!1097865 (= e!626606 (validKeyInArray!0 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(declare-fun bm!45842 () Bool)

(declare-fun call!45845 () Bool)

(assert (=> bm!45842 (= call!45845 (contains!6380 lt!490926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097866 () Bool)

(declare-fun e!626613 () Bool)

(assert (=> b!1097866 (= e!626613 (not call!45845))))

(declare-fun bm!45843 () Bool)

(declare-fun call!45850 () ListLongMap!15263)

(assert (=> bm!45843 (= call!45851 call!45850)))

(declare-fun b!1097867 () Bool)

(declare-fun call!45847 () ListLongMap!15263)

(assert (=> b!1097867 (= e!626607 call!45847)))

(declare-fun b!1097868 () Bool)

(declare-fun e!626610 () Bool)

(declare-fun call!45849 () Bool)

(assert (=> b!1097868 (= e!626610 (not call!45849))))

(declare-fun b!1097869 () Bool)

(declare-fun e!626608 () ListLongMap!15263)

(declare-fun call!45846 () ListLongMap!15263)

(assert (=> b!1097869 (= e!626608 (+!3357 call!45846 (tuple2!17295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1097870 () Bool)

(declare-fun e!626602 () Bool)

(assert (=> b!1097870 (= e!626602 e!626610)))

(declare-fun c!108442 () Bool)

(assert (=> b!1097870 (= c!108442 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097871 () Bool)

(declare-fun res!732712 () Bool)

(assert (=> b!1097871 (=> (not res!732712) (not e!626602))))

(assert (=> b!1097871 (= res!732712 e!626613)))

(declare-fun c!108443 () Bool)

(assert (=> b!1097871 (= c!108443 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1097872 () Bool)

(declare-fun e!626604 () Bool)

(assert (=> b!1097872 (= e!626604 (validKeyInArray!0 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(declare-fun b!1097873 () Bool)

(assert (=> b!1097873 (= e!626613 e!626612)))

(declare-fun res!732713 () Bool)

(assert (=> b!1097873 (= res!732713 call!45845)))

(assert (=> b!1097873 (=> (not res!732713) (not e!626612))))

(declare-fun call!45848 () ListLongMap!15263)

(declare-fun bm!45844 () Bool)

(assert (=> bm!45844 (= call!45848 (getCurrentListMapNoExtraKeys!4163 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097874 () Bool)

(declare-fun e!626611 () ListLongMap!15263)

(assert (=> b!1097874 (= e!626608 e!626611)))

(declare-fun c!108439 () Bool)

(assert (=> b!1097874 (= c!108439 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!130359 () Bool)

(assert (=> d!130359 e!626602))

(declare-fun res!732717 () Bool)

(assert (=> d!130359 (=> (not res!732717) (not e!626602))))

(assert (=> d!130359 (= res!732717 (or (bvsge #b00000000000000000000000000000000 (size!34785 lt!490770)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!490770)))))))

(declare-fun lt!490917 () ListLongMap!15263)

(assert (=> d!130359 (= lt!490926 lt!490917)))

(declare-fun lt!490907 () Unit!36108)

(declare-fun e!626605 () Unit!36108)

(assert (=> d!130359 (= lt!490907 e!626605)))

(declare-fun c!108441 () Bool)

(assert (=> d!130359 (= c!108441 e!626606)))

(declare-fun res!732718 () Bool)

(assert (=> d!130359 (=> (not res!732718) (not e!626606))))

(assert (=> d!130359 (= res!732718 (bvslt #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(assert (=> d!130359 (= lt!490917 e!626608)))

(declare-fun c!108438 () Bool)

(assert (=> d!130359 (= c!108438 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130359 (validMask!0 mask!1414)))

(assert (=> d!130359 (= (getCurrentListMap!4367 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490926)))

(declare-fun b!1097875 () Bool)

(declare-fun e!626614 () Bool)

(assert (=> b!1097875 (= e!626614 (= (apply!944 lt!490926 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)) (get!17614 (select (arr!34250 lt!490761) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097875 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34786 lt!490761)))))

(assert (=> b!1097875 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(declare-fun bm!45845 () Bool)

(assert (=> bm!45845 (= call!45846 (+!3357 (ite c!108438 call!45848 (ite c!108439 call!45850 call!45851)) (ite (or c!108438 c!108439) (tuple2!17295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1097876 () Bool)

(declare-fun Unit!36113 () Unit!36108)

(assert (=> b!1097876 (= e!626605 Unit!36113)))

(declare-fun bm!45846 () Bool)

(assert (=> bm!45846 (= call!45850 call!45848)))

(declare-fun b!1097877 () Bool)

(assert (=> b!1097877 (= e!626611 call!45847)))

(declare-fun bm!45847 () Bool)

(assert (=> bm!45847 (= call!45849 (contains!6380 lt!490926 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097878 () Bool)

(declare-fun e!626603 () Bool)

(assert (=> b!1097878 (= e!626603 e!626614)))

(declare-fun res!732720 () Bool)

(assert (=> b!1097878 (=> (not res!732720) (not e!626614))))

(assert (=> b!1097878 (= res!732720 (contains!6380 lt!490926 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(assert (=> b!1097878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(declare-fun b!1097879 () Bool)

(declare-fun c!108440 () Bool)

(assert (=> b!1097879 (= c!108440 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1097879 (= e!626611 e!626607)))

(declare-fun bm!45848 () Bool)

(assert (=> bm!45848 (= call!45847 call!45846)))

(declare-fun b!1097880 () Bool)

(declare-fun e!626609 () Bool)

(assert (=> b!1097880 (= e!626610 e!626609)))

(declare-fun res!732714 () Bool)

(assert (=> b!1097880 (= res!732714 call!45849)))

(assert (=> b!1097880 (=> (not res!732714) (not e!626609))))

(declare-fun b!1097881 () Bool)

(declare-fun lt!490914 () Unit!36108)

(assert (=> b!1097881 (= e!626605 lt!490914)))

(declare-fun lt!490925 () ListLongMap!15263)

(assert (=> b!1097881 (= lt!490925 (getCurrentListMapNoExtraKeys!4163 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490912 () (_ BitVec 64))

(assert (=> b!1097881 (= lt!490912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490920 () (_ BitVec 64))

(assert (=> b!1097881 (= lt!490920 (select (arr!34249 lt!490770) #b00000000000000000000000000000000))))

(declare-fun lt!490928 () Unit!36108)

(assert (=> b!1097881 (= lt!490928 (addStillContains!657 lt!490925 lt!490912 zeroValue!831 lt!490920))))

(assert (=> b!1097881 (contains!6380 (+!3357 lt!490925 (tuple2!17295 lt!490912 zeroValue!831)) lt!490920)))

(declare-fun lt!490921 () Unit!36108)

(assert (=> b!1097881 (= lt!490921 lt!490928)))

(declare-fun lt!490908 () ListLongMap!15263)

(assert (=> b!1097881 (= lt!490908 (getCurrentListMapNoExtraKeys!4163 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490922 () (_ BitVec 64))

(assert (=> b!1097881 (= lt!490922 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490909 () (_ BitVec 64))

(assert (=> b!1097881 (= lt!490909 (select (arr!34249 lt!490770) #b00000000000000000000000000000000))))

(declare-fun lt!490918 () Unit!36108)

(assert (=> b!1097881 (= lt!490918 (addApplyDifferent!517 lt!490908 lt!490922 minValue!831 lt!490909))))

(assert (=> b!1097881 (= (apply!944 (+!3357 lt!490908 (tuple2!17295 lt!490922 minValue!831)) lt!490909) (apply!944 lt!490908 lt!490909))))

(declare-fun lt!490924 () Unit!36108)

(assert (=> b!1097881 (= lt!490924 lt!490918)))

(declare-fun lt!490916 () ListLongMap!15263)

(assert (=> b!1097881 (= lt!490916 (getCurrentListMapNoExtraKeys!4163 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490911 () (_ BitVec 64))

(assert (=> b!1097881 (= lt!490911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490919 () (_ BitVec 64))

(assert (=> b!1097881 (= lt!490919 (select (arr!34249 lt!490770) #b00000000000000000000000000000000))))

(declare-fun lt!490923 () Unit!36108)

(assert (=> b!1097881 (= lt!490923 (addApplyDifferent!517 lt!490916 lt!490911 zeroValue!831 lt!490919))))

(assert (=> b!1097881 (= (apply!944 (+!3357 lt!490916 (tuple2!17295 lt!490911 zeroValue!831)) lt!490919) (apply!944 lt!490916 lt!490919))))

(declare-fun lt!490910 () Unit!36108)

(assert (=> b!1097881 (= lt!490910 lt!490923)))

(declare-fun lt!490927 () ListLongMap!15263)

(assert (=> b!1097881 (= lt!490927 (getCurrentListMapNoExtraKeys!4163 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490915 () (_ BitVec 64))

(assert (=> b!1097881 (= lt!490915 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490913 () (_ BitVec 64))

(assert (=> b!1097881 (= lt!490913 (select (arr!34249 lt!490770) #b00000000000000000000000000000000))))

(assert (=> b!1097881 (= lt!490914 (addApplyDifferent!517 lt!490927 lt!490915 minValue!831 lt!490913))))

(assert (=> b!1097881 (= (apply!944 (+!3357 lt!490927 (tuple2!17295 lt!490915 minValue!831)) lt!490913) (apply!944 lt!490927 lt!490913))))

(declare-fun b!1097882 () Bool)

(declare-fun res!732719 () Bool)

(assert (=> b!1097882 (=> (not res!732719) (not e!626602))))

(assert (=> b!1097882 (= res!732719 e!626603)))

(declare-fun res!732716 () Bool)

(assert (=> b!1097882 (=> res!732716 e!626603)))

(assert (=> b!1097882 (= res!732716 (not e!626604))))

(declare-fun res!732715 () Bool)

(assert (=> b!1097882 (=> (not res!732715) (not e!626604))))

(assert (=> b!1097882 (= res!732715 (bvslt #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(declare-fun b!1097883 () Bool)

(assert (=> b!1097883 (= e!626609 (= (apply!944 lt!490926 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(assert (= (and d!130359 c!108438) b!1097869))

(assert (= (and d!130359 (not c!108438)) b!1097874))

(assert (= (and b!1097874 c!108439) b!1097877))

(assert (= (and b!1097874 (not c!108439)) b!1097879))

(assert (= (and b!1097879 c!108440) b!1097867))

(assert (= (and b!1097879 (not c!108440)) b!1097864))

(assert (= (or b!1097867 b!1097864) bm!45843))

(assert (= (or b!1097877 bm!45843) bm!45846))

(assert (= (or b!1097877 b!1097867) bm!45848))

(assert (= (or b!1097869 bm!45846) bm!45844))

(assert (= (or b!1097869 bm!45848) bm!45845))

(assert (= (and d!130359 res!732718) b!1097865))

(assert (= (and d!130359 c!108441) b!1097881))

(assert (= (and d!130359 (not c!108441)) b!1097876))

(assert (= (and d!130359 res!732717) b!1097882))

(assert (= (and b!1097882 res!732715) b!1097872))

(assert (= (and b!1097882 (not res!732716)) b!1097878))

(assert (= (and b!1097878 res!732720) b!1097875))

(assert (= (and b!1097882 res!732719) b!1097871))

(assert (= (and b!1097871 c!108443) b!1097873))

(assert (= (and b!1097871 (not c!108443)) b!1097866))

(assert (= (and b!1097873 res!732713) b!1097863))

(assert (= (or b!1097873 b!1097866) bm!45842))

(assert (= (and b!1097871 res!732712) b!1097870))

(assert (= (and b!1097870 c!108442) b!1097880))

(assert (= (and b!1097870 (not c!108442)) b!1097868))

(assert (= (and b!1097880 res!732714) b!1097883))

(assert (= (or b!1097880 b!1097868) bm!45847))

(declare-fun b_lambda!17771 () Bool)

(assert (=> (not b_lambda!17771) (not b!1097875)))

(assert (=> b!1097875 t!34034))

(declare-fun b_and!36835 () Bool)

(assert (= b_and!36833 (and (=> t!34034 result!16403) b_and!36835)))

(declare-fun m!1017425 () Bool)

(assert (=> b!1097883 m!1017425))

(declare-fun m!1017427 () Bool)

(assert (=> b!1097869 m!1017427))

(assert (=> b!1097875 m!1017355))

(declare-fun m!1017429 () Bool)

(assert (=> b!1097875 m!1017429))

(assert (=> b!1097875 m!1017233))

(declare-fun m!1017431 () Bool)

(assert (=> b!1097875 m!1017431))

(assert (=> b!1097875 m!1017431))

(assert (=> b!1097875 m!1017233))

(declare-fun m!1017433 () Bool)

(assert (=> b!1097875 m!1017433))

(assert (=> b!1097875 m!1017355))

(declare-fun m!1017435 () Bool)

(assert (=> bm!45845 m!1017435))

(assert (=> b!1097872 m!1017355))

(assert (=> b!1097872 m!1017355))

(assert (=> b!1097872 m!1017361))

(assert (=> b!1097878 m!1017355))

(assert (=> b!1097878 m!1017355))

(declare-fun m!1017437 () Bool)

(assert (=> b!1097878 m!1017437))

(declare-fun m!1017439 () Bool)

(assert (=> b!1097881 m!1017439))

(declare-fun m!1017441 () Bool)

(assert (=> b!1097881 m!1017441))

(declare-fun m!1017443 () Bool)

(assert (=> b!1097881 m!1017443))

(declare-fun m!1017445 () Bool)

(assert (=> b!1097881 m!1017445))

(declare-fun m!1017447 () Bool)

(assert (=> b!1097881 m!1017447))

(declare-fun m!1017449 () Bool)

(assert (=> b!1097881 m!1017449))

(declare-fun m!1017451 () Bool)

(assert (=> b!1097881 m!1017451))

(declare-fun m!1017453 () Bool)

(assert (=> b!1097881 m!1017453))

(declare-fun m!1017455 () Bool)

(assert (=> b!1097881 m!1017455))

(assert (=> b!1097881 m!1017441))

(assert (=> b!1097881 m!1017453))

(declare-fun m!1017457 () Bool)

(assert (=> b!1097881 m!1017457))

(assert (=> b!1097881 m!1017355))

(declare-fun m!1017459 () Bool)

(assert (=> b!1097881 m!1017459))

(assert (=> b!1097881 m!1017449))

(declare-fun m!1017461 () Bool)

(assert (=> b!1097881 m!1017461))

(assert (=> b!1097881 m!1017229))

(declare-fun m!1017463 () Bool)

(assert (=> b!1097881 m!1017463))

(assert (=> b!1097881 m!1017457))

(declare-fun m!1017465 () Bool)

(assert (=> b!1097881 m!1017465))

(declare-fun m!1017467 () Bool)

(assert (=> b!1097881 m!1017467))

(assert (=> b!1097865 m!1017355))

(assert (=> b!1097865 m!1017355))

(assert (=> b!1097865 m!1017361))

(declare-fun m!1017469 () Bool)

(assert (=> bm!45842 m!1017469))

(assert (=> bm!45844 m!1017229))

(declare-fun m!1017471 () Bool)

(assert (=> bm!45847 m!1017471))

(assert (=> d!130359 m!1017213))

(declare-fun m!1017473 () Bool)

(assert (=> b!1097863 m!1017473))

(assert (=> b!1097690 d!130359))

(declare-fun b!1097908 () Bool)

(declare-fun e!626629 () ListLongMap!15263)

(assert (=> b!1097908 (= e!626629 (ListLongMap!15264 Nil!23913))))

(declare-fun b!1097909 () Bool)

(declare-fun e!626635 () ListLongMap!15263)

(declare-fun call!45854 () ListLongMap!15263)

(assert (=> b!1097909 (= e!626635 call!45854)))

(declare-fun b!1097910 () Bool)

(declare-fun res!732729 () Bool)

(declare-fun e!626632 () Bool)

(assert (=> b!1097910 (=> (not res!732729) (not e!626632))))

(declare-fun lt!490947 () ListLongMap!15263)

(assert (=> b!1097910 (= res!732729 (not (contains!6380 lt!490947 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!130361 () Bool)

(assert (=> d!130361 e!626632))

(declare-fun res!732730 () Bool)

(assert (=> d!130361 (=> (not res!732730) (not e!626632))))

(assert (=> d!130361 (= res!732730 (not (contains!6380 lt!490947 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130361 (= lt!490947 e!626629)))

(declare-fun c!108454 () Bool)

(assert (=> d!130361 (= c!108454 (bvsge #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> d!130361 (validMask!0 mask!1414)))

(assert (=> d!130361 (= (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490947)))

(declare-fun b!1097911 () Bool)

(declare-fun e!626630 () Bool)

(assert (=> b!1097911 (= e!626630 (= lt!490947 (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1097912 () Bool)

(declare-fun isEmpty!962 (ListLongMap!15263) Bool)

(assert (=> b!1097912 (= e!626630 (isEmpty!962 lt!490947))))

(declare-fun b!1097913 () Bool)

(declare-fun e!626631 () Bool)

(assert (=> b!1097913 (= e!626631 e!626630)))

(declare-fun c!108455 () Bool)

(assert (=> b!1097913 (= c!108455 (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun b!1097914 () Bool)

(assert (=> b!1097914 (= e!626629 e!626635)))

(declare-fun c!108452 () Bool)

(assert (=> b!1097914 (= c!108452 (validKeyInArray!0 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097915 () Bool)

(declare-fun lt!490949 () Unit!36108)

(declare-fun lt!490946 () Unit!36108)

(assert (=> b!1097915 (= lt!490949 lt!490946)))

(declare-fun lt!490943 () ListLongMap!15263)

(declare-fun lt!490944 () V!41291)

(declare-fun lt!490945 () (_ BitVec 64))

(declare-fun lt!490948 () (_ BitVec 64))

(assert (=> b!1097915 (not (contains!6380 (+!3357 lt!490943 (tuple2!17295 lt!490948 lt!490944)) lt!490945))))

(declare-fun addStillNotContains!272 (ListLongMap!15263 (_ BitVec 64) V!41291 (_ BitVec 64)) Unit!36108)

(assert (=> b!1097915 (= lt!490946 (addStillNotContains!272 lt!490943 lt!490948 lt!490944 lt!490945))))

(assert (=> b!1097915 (= lt!490945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1097915 (= lt!490944 (get!17614 (select (arr!34250 _values!874) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1097915 (= lt!490948 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1097915 (= lt!490943 call!45854)))

(assert (=> b!1097915 (= e!626635 (+!3357 call!45854 (tuple2!17295 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000) (get!17614 (select (arr!34250 _values!874) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1097916 () Bool)

(assert (=> b!1097916 (= e!626632 e!626631)))

(declare-fun c!108453 () Bool)

(declare-fun e!626634 () Bool)

(assert (=> b!1097916 (= c!108453 e!626634)))

(declare-fun res!732732 () Bool)

(assert (=> b!1097916 (=> (not res!732732) (not e!626634))))

(assert (=> b!1097916 (= res!732732 (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun b!1097917 () Bool)

(assert (=> b!1097917 (= e!626634 (validKeyInArray!0 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097917 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45851 () Bool)

(assert (=> bm!45851 (= call!45854 (getCurrentListMapNoExtraKeys!4163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1097918 () Bool)

(assert (=> b!1097918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(assert (=> b!1097918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34786 _values!874)))))

(declare-fun e!626633 () Bool)

(assert (=> b!1097918 (= e!626633 (= (apply!944 lt!490947 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)) (get!17614 (select (arr!34250 _values!874) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1097919 () Bool)

(assert (=> b!1097919 (= e!626631 e!626633)))

(assert (=> b!1097919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 _keys!1070)))))

(declare-fun res!732731 () Bool)

(assert (=> b!1097919 (= res!732731 (contains!6380 lt!490947 (select (arr!34249 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097919 (=> (not res!732731) (not e!626633))))

(assert (= (and d!130361 c!108454) b!1097908))

(assert (= (and d!130361 (not c!108454)) b!1097914))

(assert (= (and b!1097914 c!108452) b!1097915))

(assert (= (and b!1097914 (not c!108452)) b!1097909))

(assert (= (or b!1097915 b!1097909) bm!45851))

(assert (= (and d!130361 res!732730) b!1097910))

(assert (= (and b!1097910 res!732729) b!1097916))

(assert (= (and b!1097916 res!732732) b!1097917))

(assert (= (and b!1097916 c!108453) b!1097919))

(assert (= (and b!1097916 (not c!108453)) b!1097913))

(assert (= (and b!1097919 res!732731) b!1097918))

(assert (= (and b!1097913 c!108455) b!1097911))

(assert (= (and b!1097913 (not c!108455)) b!1097912))

(declare-fun b_lambda!17773 () Bool)

(assert (=> (not b_lambda!17773) (not b!1097915)))

(assert (=> b!1097915 t!34034))

(declare-fun b_and!36837 () Bool)

(assert (= b_and!36835 (and (=> t!34034 result!16403) b_and!36837)))

(declare-fun b_lambda!17775 () Bool)

(assert (=> (not b_lambda!17775) (not b!1097918)))

(assert (=> b!1097918 t!34034))

(declare-fun b_and!36839 () Bool)

(assert (= b_and!36837 (and (=> t!34034 result!16403) b_and!36839)))

(declare-fun m!1017475 () Bool)

(assert (=> b!1097910 m!1017475))

(assert (=> b!1097918 m!1017233))

(assert (=> b!1097918 m!1017375))

(assert (=> b!1097918 m!1017343))

(assert (=> b!1097918 m!1017375))

(assert (=> b!1097918 m!1017233))

(assert (=> b!1097918 m!1017377))

(assert (=> b!1097918 m!1017343))

(declare-fun m!1017477 () Bool)

(assert (=> b!1097918 m!1017477))

(assert (=> b!1097915 m!1017233))

(declare-fun m!1017479 () Bool)

(assert (=> b!1097915 m!1017479))

(declare-fun m!1017481 () Bool)

(assert (=> b!1097915 m!1017481))

(assert (=> b!1097915 m!1017375))

(assert (=> b!1097915 m!1017479))

(assert (=> b!1097915 m!1017343))

(assert (=> b!1097915 m!1017375))

(assert (=> b!1097915 m!1017233))

(assert (=> b!1097915 m!1017377))

(declare-fun m!1017483 () Bool)

(assert (=> b!1097915 m!1017483))

(declare-fun m!1017485 () Bool)

(assert (=> b!1097915 m!1017485))

(declare-fun m!1017487 () Bool)

(assert (=> b!1097912 m!1017487))

(assert (=> b!1097917 m!1017343))

(assert (=> b!1097917 m!1017343))

(assert (=> b!1097917 m!1017345))

(assert (=> b!1097919 m!1017343))

(assert (=> b!1097919 m!1017343))

(declare-fun m!1017489 () Bool)

(assert (=> b!1097919 m!1017489))

(declare-fun m!1017491 () Bool)

(assert (=> bm!45851 m!1017491))

(assert (=> b!1097914 m!1017343))

(assert (=> b!1097914 m!1017343))

(assert (=> b!1097914 m!1017345))

(assert (=> b!1097911 m!1017491))

(declare-fun m!1017493 () Bool)

(assert (=> d!130361 m!1017493))

(assert (=> d!130361 m!1017213))

(assert (=> b!1097690 d!130361))

(declare-fun d!130363 () Bool)

(assert (=> d!130363 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490952 () Unit!36108)

(declare-fun choose!13 (array!71157 (_ BitVec 64) (_ BitVec 32)) Unit!36108)

(assert (=> d!130363 (= lt!490952 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130363 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130363 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!490952)))

(declare-fun bs!32259 () Bool)

(assert (= bs!32259 d!130363))

(assert (=> bs!32259 m!1017225))

(declare-fun m!1017495 () Bool)

(assert (=> bs!32259 m!1017495))

(assert (=> b!1097690 d!130363))

(declare-fun d!130365 () Bool)

(declare-fun lt!490955 () ListLongMap!15263)

(assert (=> d!130365 (not (contains!6380 lt!490955 k0!904))))

(declare-fun removeStrictlySorted!78 (List!23916 (_ BitVec 64)) List!23916)

(assert (=> d!130365 (= lt!490955 (ListLongMap!15264 (removeStrictlySorted!78 (toList!7647 lt!490766) k0!904)))))

(assert (=> d!130365 (= (-!937 lt!490766 k0!904) lt!490955)))

(declare-fun bs!32260 () Bool)

(assert (= bs!32260 d!130365))

(declare-fun m!1017497 () Bool)

(assert (=> bs!32260 m!1017497))

(declare-fun m!1017499 () Bool)

(assert (=> bs!32260 m!1017499))

(assert (=> b!1097690 d!130365))

(declare-fun b!1097920 () Bool)

(declare-fun e!626636 () ListLongMap!15263)

(assert (=> b!1097920 (= e!626636 (ListLongMap!15264 Nil!23913))))

(declare-fun b!1097921 () Bool)

(declare-fun e!626642 () ListLongMap!15263)

(declare-fun call!45855 () ListLongMap!15263)

(assert (=> b!1097921 (= e!626642 call!45855)))

(declare-fun b!1097922 () Bool)

(declare-fun res!732733 () Bool)

(declare-fun e!626639 () Bool)

(assert (=> b!1097922 (=> (not res!732733) (not e!626639))))

(declare-fun lt!490960 () ListLongMap!15263)

(assert (=> b!1097922 (= res!732733 (not (contains!6380 lt!490960 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!130367 () Bool)

(assert (=> d!130367 e!626639))

(declare-fun res!732734 () Bool)

(assert (=> d!130367 (=> (not res!732734) (not e!626639))))

(assert (=> d!130367 (= res!732734 (not (contains!6380 lt!490960 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130367 (= lt!490960 e!626636)))

(declare-fun c!108458 () Bool)

(assert (=> d!130367 (= c!108458 (bvsge #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(assert (=> d!130367 (validMask!0 mask!1414)))

(assert (=> d!130367 (= (getCurrentListMapNoExtraKeys!4163 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490960)))

(declare-fun b!1097923 () Bool)

(declare-fun e!626637 () Bool)

(assert (=> b!1097923 (= e!626637 (= lt!490960 (getCurrentListMapNoExtraKeys!4163 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1097924 () Bool)

(assert (=> b!1097924 (= e!626637 (isEmpty!962 lt!490960))))

(declare-fun b!1097925 () Bool)

(declare-fun e!626638 () Bool)

(assert (=> b!1097925 (= e!626638 e!626637)))

(declare-fun c!108459 () Bool)

(assert (=> b!1097925 (= c!108459 (bvslt #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(declare-fun b!1097926 () Bool)

(assert (=> b!1097926 (= e!626636 e!626642)))

(declare-fun c!108456 () Bool)

(assert (=> b!1097926 (= c!108456 (validKeyInArray!0 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(declare-fun b!1097927 () Bool)

(declare-fun lt!490962 () Unit!36108)

(declare-fun lt!490959 () Unit!36108)

(assert (=> b!1097927 (= lt!490962 lt!490959)))

(declare-fun lt!490961 () (_ BitVec 64))

(declare-fun lt!490956 () ListLongMap!15263)

(declare-fun lt!490958 () (_ BitVec 64))

(declare-fun lt!490957 () V!41291)

(assert (=> b!1097927 (not (contains!6380 (+!3357 lt!490956 (tuple2!17295 lt!490961 lt!490957)) lt!490958))))

(assert (=> b!1097927 (= lt!490959 (addStillNotContains!272 lt!490956 lt!490961 lt!490957 lt!490958))))

(assert (=> b!1097927 (= lt!490958 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1097927 (= lt!490957 (get!17614 (select (arr!34250 lt!490761) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1097927 (= lt!490961 (select (arr!34249 lt!490770) #b00000000000000000000000000000000))))

(assert (=> b!1097927 (= lt!490956 call!45855)))

(assert (=> b!1097927 (= e!626642 (+!3357 call!45855 (tuple2!17295 (select (arr!34249 lt!490770) #b00000000000000000000000000000000) (get!17614 (select (arr!34250 lt!490761) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1097928 () Bool)

(assert (=> b!1097928 (= e!626639 e!626638)))

(declare-fun c!108457 () Bool)

(declare-fun e!626641 () Bool)

(assert (=> b!1097928 (= c!108457 e!626641)))

(declare-fun res!732736 () Bool)

(assert (=> b!1097928 (=> (not res!732736) (not e!626641))))

(assert (=> b!1097928 (= res!732736 (bvslt #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(declare-fun b!1097929 () Bool)

(assert (=> b!1097929 (= e!626641 (validKeyInArray!0 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(assert (=> b!1097929 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45852 () Bool)

(assert (=> bm!45852 (= call!45855 (getCurrentListMapNoExtraKeys!4163 lt!490770 lt!490761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1097930 () Bool)

(assert (=> b!1097930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(assert (=> b!1097930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34786 lt!490761)))))

(declare-fun e!626640 () Bool)

(assert (=> b!1097930 (= e!626640 (= (apply!944 lt!490960 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)) (get!17614 (select (arr!34250 lt!490761) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1097931 () Bool)

(assert (=> b!1097931 (= e!626638 e!626640)))

(assert (=> b!1097931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(declare-fun res!732735 () Bool)

(assert (=> b!1097931 (= res!732735 (contains!6380 lt!490960 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(assert (=> b!1097931 (=> (not res!732735) (not e!626640))))

(assert (= (and d!130367 c!108458) b!1097920))

(assert (= (and d!130367 (not c!108458)) b!1097926))

(assert (= (and b!1097926 c!108456) b!1097927))

(assert (= (and b!1097926 (not c!108456)) b!1097921))

(assert (= (or b!1097927 b!1097921) bm!45852))

(assert (= (and d!130367 res!732734) b!1097922))

(assert (= (and b!1097922 res!732733) b!1097928))

(assert (= (and b!1097928 res!732736) b!1097929))

(assert (= (and b!1097928 c!108457) b!1097931))

(assert (= (and b!1097928 (not c!108457)) b!1097925))

(assert (= (and b!1097931 res!732735) b!1097930))

(assert (= (and b!1097925 c!108459) b!1097923))

(assert (= (and b!1097925 (not c!108459)) b!1097924))

(declare-fun b_lambda!17777 () Bool)

(assert (=> (not b_lambda!17777) (not b!1097927)))

(assert (=> b!1097927 t!34034))

(declare-fun b_and!36841 () Bool)

(assert (= b_and!36839 (and (=> t!34034 result!16403) b_and!36841)))

(declare-fun b_lambda!17779 () Bool)

(assert (=> (not b_lambda!17779) (not b!1097930)))

(assert (=> b!1097930 t!34034))

(declare-fun b_and!36843 () Bool)

(assert (= b_and!36841 (and (=> t!34034 result!16403) b_and!36843)))

(declare-fun m!1017501 () Bool)

(assert (=> b!1097922 m!1017501))

(assert (=> b!1097930 m!1017233))

(assert (=> b!1097930 m!1017431))

(assert (=> b!1097930 m!1017355))

(assert (=> b!1097930 m!1017431))

(assert (=> b!1097930 m!1017233))

(assert (=> b!1097930 m!1017433))

(assert (=> b!1097930 m!1017355))

(declare-fun m!1017503 () Bool)

(assert (=> b!1097930 m!1017503))

(assert (=> b!1097927 m!1017233))

(declare-fun m!1017505 () Bool)

(assert (=> b!1097927 m!1017505))

(declare-fun m!1017507 () Bool)

(assert (=> b!1097927 m!1017507))

(assert (=> b!1097927 m!1017431))

(assert (=> b!1097927 m!1017505))

(assert (=> b!1097927 m!1017355))

(assert (=> b!1097927 m!1017431))

(assert (=> b!1097927 m!1017233))

(assert (=> b!1097927 m!1017433))

(declare-fun m!1017509 () Bool)

(assert (=> b!1097927 m!1017509))

(declare-fun m!1017511 () Bool)

(assert (=> b!1097927 m!1017511))

(declare-fun m!1017513 () Bool)

(assert (=> b!1097924 m!1017513))

(assert (=> b!1097929 m!1017355))

(assert (=> b!1097929 m!1017355))

(assert (=> b!1097929 m!1017361))

(assert (=> b!1097931 m!1017355))

(assert (=> b!1097931 m!1017355))

(declare-fun m!1017515 () Bool)

(assert (=> b!1097931 m!1017515))

(declare-fun m!1017517 () Bool)

(assert (=> bm!45852 m!1017517))

(assert (=> b!1097926 m!1017355))

(assert (=> b!1097926 m!1017355))

(assert (=> b!1097926 m!1017361))

(assert (=> b!1097923 m!1017517))

(declare-fun m!1017519 () Bool)

(assert (=> d!130367 m!1017519))

(assert (=> d!130367 m!1017213))

(assert (=> b!1097690 d!130367))

(declare-fun b!1097932 () Bool)

(declare-fun e!626645 () Bool)

(declare-fun call!45856 () Bool)

(assert (=> b!1097932 (= e!626645 call!45856)))

(declare-fun b!1097933 () Bool)

(declare-fun e!626644 () Bool)

(assert (=> b!1097933 (= e!626644 e!626645)))

(declare-fun c!108460 () Bool)

(assert (=> b!1097933 (= c!108460 (validKeyInArray!0 (select (arr!34249 lt!490770) #b00000000000000000000000000000000)))))

(declare-fun d!130369 () Bool)

(declare-fun res!732737 () Bool)

(assert (=> d!130369 (=> res!732737 e!626644)))

(assert (=> d!130369 (= res!732737 (bvsge #b00000000000000000000000000000000 (size!34785 lt!490770)))))

(assert (=> d!130369 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490770 mask!1414) e!626644)))

(declare-fun b!1097934 () Bool)

(declare-fun e!626643 () Bool)

(assert (=> b!1097934 (= e!626643 call!45856)))

(declare-fun bm!45853 () Bool)

(assert (=> bm!45853 (= call!45856 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!490770 mask!1414))))

(declare-fun b!1097935 () Bool)

(assert (=> b!1097935 (= e!626645 e!626643)))

(declare-fun lt!490963 () (_ BitVec 64))

(assert (=> b!1097935 (= lt!490963 (select (arr!34249 lt!490770) #b00000000000000000000000000000000))))

(declare-fun lt!490964 () Unit!36108)

(assert (=> b!1097935 (= lt!490964 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!490770 lt!490963 #b00000000000000000000000000000000))))

(assert (=> b!1097935 (arrayContainsKey!0 lt!490770 lt!490963 #b00000000000000000000000000000000)))

(declare-fun lt!490965 () Unit!36108)

(assert (=> b!1097935 (= lt!490965 lt!490964)))

(declare-fun res!732738 () Bool)

(assert (=> b!1097935 (= res!732738 (= (seekEntryOrOpen!0 (select (arr!34249 lt!490770) #b00000000000000000000000000000000) lt!490770 mask!1414) (Found!9907 #b00000000000000000000000000000000)))))

(assert (=> b!1097935 (=> (not res!732738) (not e!626643))))

(assert (= (and d!130369 (not res!732737)) b!1097933))

(assert (= (and b!1097933 c!108460) b!1097935))

(assert (= (and b!1097933 (not c!108460)) b!1097932))

(assert (= (and b!1097935 res!732738) b!1097934))

(assert (= (or b!1097934 b!1097932) bm!45853))

(assert (=> b!1097933 m!1017355))

(assert (=> b!1097933 m!1017355))

(assert (=> b!1097933 m!1017361))

(declare-fun m!1017521 () Bool)

(assert (=> bm!45853 m!1017521))

(assert (=> b!1097935 m!1017355))

(declare-fun m!1017523 () Bool)

(assert (=> b!1097935 m!1017523))

(declare-fun m!1017525 () Bool)

(assert (=> b!1097935 m!1017525))

(assert (=> b!1097935 m!1017355))

(declare-fun m!1017527 () Bool)

(assert (=> b!1097935 m!1017527))

(assert (=> b!1097695 d!130369))

(declare-fun mapIsEmpty!42454 () Bool)

(declare-fun mapRes!42454 () Bool)

(assert (=> mapIsEmpty!42454 mapRes!42454))

(declare-fun b!1097943 () Bool)

(declare-fun e!626650 () Bool)

(assert (=> b!1097943 (= e!626650 tp_is_empty!27123)))

(declare-fun mapNonEmpty!42454 () Bool)

(declare-fun tp!81158 () Bool)

(declare-fun e!626651 () Bool)

(assert (=> mapNonEmpty!42454 (= mapRes!42454 (and tp!81158 e!626651))))

(declare-fun mapRest!42454 () (Array (_ BitVec 32) ValueCell!12852))

(declare-fun mapKey!42454 () (_ BitVec 32))

(declare-fun mapValue!42454 () ValueCell!12852)

(assert (=> mapNonEmpty!42454 (= mapRest!42448 (store mapRest!42454 mapKey!42454 mapValue!42454))))

(declare-fun b!1097942 () Bool)

(assert (=> b!1097942 (= e!626651 tp_is_empty!27123)))

(declare-fun condMapEmpty!42454 () Bool)

(declare-fun mapDefault!42454 () ValueCell!12852)

(assert (=> mapNonEmpty!42448 (= condMapEmpty!42454 (= mapRest!42448 ((as const (Array (_ BitVec 32) ValueCell!12852)) mapDefault!42454)))))

(assert (=> mapNonEmpty!42448 (= tp!81149 (and e!626650 mapRes!42454))))

(assert (= (and mapNonEmpty!42448 condMapEmpty!42454) mapIsEmpty!42454))

(assert (= (and mapNonEmpty!42448 (not condMapEmpty!42454)) mapNonEmpty!42454))

(assert (= (and mapNonEmpty!42454 ((_ is ValueCellFull!12852) mapValue!42454)) b!1097942))

(assert (= (and mapNonEmpty!42448 ((_ is ValueCellFull!12852) mapDefault!42454)) b!1097943))

(declare-fun m!1017529 () Bool)

(assert (=> mapNonEmpty!42454 m!1017529))

(declare-fun b_lambda!17781 () Bool)

(assert (= b_lambda!17777 (or (and start!96520 b_free!23073) b_lambda!17781)))

(declare-fun b_lambda!17783 () Bool)

(assert (= b_lambda!17775 (or (and start!96520 b_free!23073) b_lambda!17783)))

(declare-fun b_lambda!17785 () Bool)

(assert (= b_lambda!17779 (or (and start!96520 b_free!23073) b_lambda!17785)))

(declare-fun b_lambda!17787 () Bool)

(assert (= b_lambda!17773 (or (and start!96520 b_free!23073) b_lambda!17787)))

(declare-fun b_lambda!17789 () Bool)

(assert (= b_lambda!17769 (or (and start!96520 b_free!23073) b_lambda!17789)))

(declare-fun b_lambda!17791 () Bool)

(assert (= b_lambda!17771 (or (and start!96520 b_free!23073) b_lambda!17791)))

(declare-fun b_lambda!17793 () Bool)

(assert (= b_lambda!17767 (or (and start!96520 b_free!23073) b_lambda!17793)))

(check-sat (not d!130333) (not b!1097865) (not b!1097918) (not b!1097750) (not b!1097833) (not b!1097848) (not b_lambda!17787) (not b!1097883) (not bm!45853) (not bm!45852) (not bm!45810) (not d!130357) (not b!1097910) (not bm!45842) (not b_next!23073) (not b!1097752) (not b!1097762) (not b!1097919) (not b!1097749) (not bm!45832) (not b!1097748) (not b!1097790) (not b!1097780) tp_is_empty!27123 (not d!130359) (not b_lambda!17781) (not bm!45813) (not b!1097911) (not b_lambda!17783) (not b!1097935) (not b!1097922) (not b!1097878) (not b!1097784) (not b!1097745) (not b!1097912) (not b!1097926) (not b!1097861) (not b!1097764) (not bm!45844) (not bm!45834) (not b!1097842) (not b!1097747) (not bm!45851) (not b!1097924) (not b_lambda!17791) (not b!1097781) (not mapNonEmpty!42454) (not b_lambda!17789) (not bm!45841) (not b!1097779) (not d!130361) (not b!1097839) (not b_lambda!17793) (not b!1097929) b_and!36843 (not b!1097751) (not d!130367) (not b_lambda!17785) (not b!1097881) (not b!1097930) (not b!1097915) (not b!1097933) (not d!130335) (not b!1097775) (not b!1097863) (not bm!45814) (not b!1097853) (not b!1097914) (not bm!45829) (not d!130365) (not b!1097917) (not b!1097845) (not b!1097875) (not d!130363) (not b!1097851) (not b!1097869) (not d!130331) (not b!1097872) (not b!1097746) (not b_lambda!17765) (not b!1097931) (not bm!45840) (not b!1097776) (not b!1097927) (not b!1097835) (not d!130355) (not bm!45845) (not bm!45847) (not b!1097923) (not d!130337) (not bm!45831))
(check-sat b_and!36843 (not b_next!23073))
