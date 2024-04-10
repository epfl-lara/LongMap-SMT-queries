; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!726 () Bool)

(assert start!726)

(declare-fun b_free!159 () Bool)

(declare-fun b_next!159 () Bool)

(assert (=> start!726 (= b_free!159 (not b_next!159))))

(declare-fun tp!701 () Bool)

(declare-fun b_and!301 () Bool)

(assert (=> start!726 (= tp!701 b_and!301)))

(declare-fun b!5095 () Bool)

(declare-fun e!2728 () Bool)

(declare-datatypes ((array!407 0))(
  ( (array!408 (arr!194 (Array (_ BitVec 32) (_ BitVec 64))) (size!256 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!407)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!5095 (= e!2728 (or (not (= (size!256 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))) (bvsle #b00000000000000000000000000000000 (size!256 _keys!1806))))))

(declare-fun b!5096 () Bool)

(declare-fun res!6072 () Bool)

(declare-fun e!2730 () Bool)

(assert (=> b!5096 (=> (not res!6072) (not e!2730))))

(declare-datatypes ((List!128 0))(
  ( (Nil!125) (Cons!124 (h!690 (_ BitVec 64)) (t!2259 List!128)) )
))
(declare-fun arrayNoDuplicates!0 (array!407 (_ BitVec 32) List!128) Bool)

(assert (=> b!5096 (= res!6072 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!125))))

(declare-fun res!6069 () Bool)

(assert (=> start!726 (=> (not res!6069) (not e!2730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!726 (= res!6069 (validMask!0 mask!2250))))

(assert (=> start!726 e!2730))

(assert (=> start!726 tp!701))

(assert (=> start!726 true))

(declare-datatypes ((V!493 0))(
  ( (V!494 (val!124 Int)) )
))
(declare-datatypes ((ValueCell!102 0))(
  ( (ValueCellFull!102 (v!1213 V!493)) (EmptyCell!102) )
))
(declare-datatypes ((array!409 0))(
  ( (array!410 (arr!195 (Array (_ BitVec 32) ValueCell!102)) (size!257 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!409)

(declare-fun e!2729 () Bool)

(declare-fun array_inv!143 (array!409) Bool)

(assert (=> start!726 (and (array_inv!143 _values!1492) e!2729)))

(declare-fun tp_is_empty!237 () Bool)

(assert (=> start!726 tp_is_empty!237))

(declare-fun array_inv!144 (array!407) Bool)

(assert (=> start!726 (array_inv!144 _keys!1806)))

(declare-fun b!5097 () Bool)

(declare-fun e!2726 () Bool)

(assert (=> b!5097 (= e!2726 tp_is_empty!237)))

(declare-fun b!5098 () Bool)

(declare-fun res!6067 () Bool)

(assert (=> b!5098 (=> (not res!6067) (not e!2730))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!493)

(declare-fun minValue!1434 () V!493)

(declare-datatypes ((tuple2!116 0))(
  ( (tuple2!117 (_1!58 (_ BitVec 64)) (_2!58 V!493)) )
))
(declare-datatypes ((List!129 0))(
  ( (Nil!126) (Cons!125 (h!691 tuple2!116) (t!2260 List!129)) )
))
(declare-datatypes ((ListLongMap!121 0))(
  ( (ListLongMap!122 (toList!76 List!129)) )
))
(declare-fun contains!48 (ListLongMap!121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!35 (array!407 array!409 (_ BitVec 32) (_ BitVec 32) V!493 V!493 (_ BitVec 32) Int) ListLongMap!121)

(assert (=> b!5098 (= res!6067 (contains!48 (getCurrentListMap!35 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapIsEmpty!320 () Bool)

(declare-fun mapRes!320 () Bool)

(assert (=> mapIsEmpty!320 mapRes!320))

(declare-fun b!5099 () Bool)

(declare-fun e!2732 () Bool)

(assert (=> b!5099 (= e!2732 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5100 () Bool)

(declare-fun res!6073 () Bool)

(assert (=> b!5100 (=> (not res!6073) (not e!2730))))

(assert (=> b!5100 (= res!6073 (and (= (size!257 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!256 _keys!1806) (size!257 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5101 () Bool)

(declare-fun res!6071 () Bool)

(assert (=> b!5101 (=> (not res!6071) (not e!2730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5101 (= res!6071 (validKeyInArray!0 k0!1278))))

(declare-fun b!5102 () Bool)

(declare-fun res!6070 () Bool)

(assert (=> b!5102 (=> (not res!6070) (not e!2730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!407 (_ BitVec 32)) Bool)

(assert (=> b!5102 (= res!6070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5103 () Bool)

(assert (=> b!5103 (= e!2730 (not e!2728))))

(declare-fun res!6068 () Bool)

(assert (=> b!5103 (=> res!6068 e!2728)))

(declare-fun arrayContainsKey!0 (array!407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5103 (= res!6068 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!5103 e!2732))

(declare-fun c!311 () Bool)

(assert (=> b!5103 (= c!311 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!61 0))(
  ( (Unit!62) )
))
(declare-fun lt!819 () Unit!61)

(declare-fun lemmaKeyInListMapIsInArray!18 (array!407 array!409 (_ BitVec 32) (_ BitVec 32) V!493 V!493 (_ BitVec 64) Int) Unit!61)

(assert (=> b!5103 (= lt!819 (lemmaKeyInListMapIsInArray!18 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!320 () Bool)

(declare-fun tp!700 () Bool)

(assert (=> mapNonEmpty!320 (= mapRes!320 (and tp!700 e!2726))))

(declare-fun mapKey!320 () (_ BitVec 32))

(declare-fun mapRest!320 () (Array (_ BitVec 32) ValueCell!102))

(declare-fun mapValue!320 () ValueCell!102)

(assert (=> mapNonEmpty!320 (= (arr!195 _values!1492) (store mapRest!320 mapKey!320 mapValue!320))))

(declare-fun b!5104 () Bool)

(assert (=> b!5104 (= e!2732 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5105 () Bool)

(declare-fun e!2727 () Bool)

(assert (=> b!5105 (= e!2729 (and e!2727 mapRes!320))))

(declare-fun condMapEmpty!320 () Bool)

(declare-fun mapDefault!320 () ValueCell!102)

(assert (=> b!5105 (= condMapEmpty!320 (= (arr!195 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!102)) mapDefault!320)))))

(declare-fun b!5106 () Bool)

(assert (=> b!5106 (= e!2727 tp_is_empty!237)))

(assert (= (and start!726 res!6069) b!5100))

(assert (= (and b!5100 res!6073) b!5102))

(assert (= (and b!5102 res!6070) b!5096))

(assert (= (and b!5096 res!6072) b!5098))

(assert (= (and b!5098 res!6067) b!5101))

(assert (= (and b!5101 res!6071) b!5103))

(assert (= (and b!5103 c!311) b!5104))

(assert (= (and b!5103 (not c!311)) b!5099))

(assert (= (and b!5103 (not res!6068)) b!5095))

(assert (= (and b!5105 condMapEmpty!320) mapIsEmpty!320))

(assert (= (and b!5105 (not condMapEmpty!320)) mapNonEmpty!320))

(get-info :version)

(assert (= (and mapNonEmpty!320 ((_ is ValueCellFull!102) mapValue!320)) b!5097))

(assert (= (and b!5105 ((_ is ValueCellFull!102) mapDefault!320)) b!5106))

(assert (= start!726 b!5105))

(declare-fun m!2793 () Bool)

(assert (=> b!5101 m!2793))

(declare-fun m!2795 () Bool)

(assert (=> start!726 m!2795))

(declare-fun m!2797 () Bool)

(assert (=> start!726 m!2797))

(declare-fun m!2799 () Bool)

(assert (=> start!726 m!2799))

(declare-fun m!2801 () Bool)

(assert (=> mapNonEmpty!320 m!2801))

(declare-fun m!2803 () Bool)

(assert (=> b!5104 m!2803))

(declare-fun m!2805 () Bool)

(assert (=> b!5102 m!2805))

(declare-fun m!2807 () Bool)

(assert (=> b!5098 m!2807))

(assert (=> b!5098 m!2807))

(declare-fun m!2809 () Bool)

(assert (=> b!5098 m!2809))

(declare-fun m!2811 () Bool)

(assert (=> b!5096 m!2811))

(assert (=> b!5103 m!2803))

(declare-fun m!2813 () Bool)

(assert (=> b!5103 m!2813))

(check-sat b_and!301 (not b!5098) (not b!5103) (not b!5096) (not b!5102) (not b_next!159) (not start!726) (not mapNonEmpty!320) (not b!5101) (not b!5104) tp_is_empty!237)
(check-sat b_and!301 (not b_next!159))
(get-model)

(declare-fun d!719 () Bool)

(declare-fun res!6099 () Bool)

(declare-fun e!2758 () Bool)

(assert (=> d!719 (=> res!6099 e!2758)))

(assert (=> d!719 (= res!6099 (= (select (arr!194 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!719 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!2758)))

(declare-fun b!5147 () Bool)

(declare-fun e!2759 () Bool)

(assert (=> b!5147 (= e!2758 e!2759)))

(declare-fun res!6100 () Bool)

(assert (=> b!5147 (=> (not res!6100) (not e!2759))))

(assert (=> b!5147 (= res!6100 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!256 _keys!1806)))))

(declare-fun b!5148 () Bool)

(assert (=> b!5148 (= e!2759 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!719 (not res!6099)) b!5147))

(assert (= (and b!5147 res!6100) b!5148))

(declare-fun m!2837 () Bool)

(assert (=> d!719 m!2837))

(declare-fun m!2839 () Bool)

(assert (=> b!5148 m!2839))

(assert (=> b!5103 d!719))

(declare-fun d!721 () Bool)

(declare-fun e!2762 () Bool)

(assert (=> d!721 e!2762))

(declare-fun c!317 () Bool)

(assert (=> d!721 (= c!317 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!825 () Unit!61)

(declare-fun choose!136 (array!407 array!409 (_ BitVec 32) (_ BitVec 32) V!493 V!493 (_ BitVec 64) Int) Unit!61)

(assert (=> d!721 (= lt!825 (choose!136 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!721 (validMask!0 mask!2250)))

(assert (=> d!721 (= (lemmaKeyInListMapIsInArray!18 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!825)))

(declare-fun b!5153 () Bool)

(assert (=> b!5153 (= e!2762 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5154 () Bool)

(assert (=> b!5154 (= e!2762 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!721 c!317) b!5153))

(assert (= (and d!721 (not c!317)) b!5154))

(declare-fun m!2841 () Bool)

(assert (=> d!721 m!2841))

(assert (=> d!721 m!2795))

(assert (=> b!5153 m!2803))

(assert (=> b!5103 d!721))

(declare-fun d!723 () Bool)

(assert (=> d!723 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!726 d!723))

(declare-fun d!725 () Bool)

(assert (=> d!725 (= (array_inv!143 _values!1492) (bvsge (size!257 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!726 d!725))

(declare-fun d!727 () Bool)

(assert (=> d!727 (= (array_inv!144 _keys!1806) (bvsge (size!256 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!726 d!727))

(declare-fun d!729 () Bool)

(declare-fun e!2767 () Bool)

(assert (=> d!729 e!2767))

(declare-fun res!6103 () Bool)

(assert (=> d!729 (=> res!6103 e!2767)))

(declare-fun lt!835 () Bool)

(assert (=> d!729 (= res!6103 (not lt!835))))

(declare-fun lt!836 () Bool)

(assert (=> d!729 (= lt!835 lt!836)))

(declare-fun lt!834 () Unit!61)

(declare-fun e!2768 () Unit!61)

(assert (=> d!729 (= lt!834 e!2768)))

(declare-fun c!320 () Bool)

(assert (=> d!729 (= c!320 lt!836)))

(declare-fun containsKey!3 (List!129 (_ BitVec 64)) Bool)

(assert (=> d!729 (= lt!836 (containsKey!3 (toList!76 (getCurrentListMap!35 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!729 (= (contains!48 (getCurrentListMap!35 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!835)))

(declare-fun b!5161 () Bool)

(declare-fun lt!837 () Unit!61)

(assert (=> b!5161 (= e!2768 lt!837)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!3 (List!129 (_ BitVec 64)) Unit!61)

(assert (=> b!5161 (= lt!837 (lemmaContainsKeyImpliesGetValueByKeyDefined!3 (toList!76 (getCurrentListMap!35 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!15 0))(
  ( (Some!14 (v!1215 V!493)) (None!13) )
))
(declare-fun isDefined!4 (Option!15) Bool)

(declare-fun getValueByKey!9 (List!129 (_ BitVec 64)) Option!15)

(assert (=> b!5161 (isDefined!4 (getValueByKey!9 (toList!76 (getCurrentListMap!35 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!5162 () Bool)

(declare-fun Unit!63 () Unit!61)

(assert (=> b!5162 (= e!2768 Unit!63)))

(declare-fun b!5163 () Bool)

(assert (=> b!5163 (= e!2767 (isDefined!4 (getValueByKey!9 (toList!76 (getCurrentListMap!35 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!729 c!320) b!5161))

(assert (= (and d!729 (not c!320)) b!5162))

(assert (= (and d!729 (not res!6103)) b!5163))

(declare-fun m!2843 () Bool)

(assert (=> d!729 m!2843))

(declare-fun m!2845 () Bool)

(assert (=> b!5161 m!2845))

(declare-fun m!2847 () Bool)

(assert (=> b!5161 m!2847))

(assert (=> b!5161 m!2847))

(declare-fun m!2849 () Bool)

(assert (=> b!5161 m!2849))

(assert (=> b!5163 m!2847))

(assert (=> b!5163 m!2847))

(assert (=> b!5163 m!2849))

(assert (=> b!5098 d!729))

(declare-fun b!5206 () Bool)

(declare-fun e!2797 () Bool)

(declare-fun e!2805 () Bool)

(assert (=> b!5206 (= e!2797 e!2805)))

(declare-fun res!6128 () Bool)

(declare-fun call!122 () Bool)

(assert (=> b!5206 (= res!6128 call!122)))

(assert (=> b!5206 (=> (not res!6128) (not e!2805))))

(declare-fun d!731 () Bool)

(declare-fun e!2804 () Bool)

(assert (=> d!731 e!2804))

(declare-fun res!6122 () Bool)

(assert (=> d!731 (=> (not res!6122) (not e!2804))))

(assert (=> d!731 (= res!6122 (or (bvsge #b00000000000000000000000000000000 (size!256 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!256 _keys!1806)))))))

(declare-fun lt!893 () ListLongMap!121)

(declare-fun lt!886 () ListLongMap!121)

(assert (=> d!731 (= lt!893 lt!886)))

(declare-fun lt!883 () Unit!61)

(declare-fun e!2798 () Unit!61)

(assert (=> d!731 (= lt!883 e!2798)))

(declare-fun c!335 () Bool)

(declare-fun e!2803 () Bool)

(assert (=> d!731 (= c!335 e!2803)))

(declare-fun res!6129 () Bool)

(assert (=> d!731 (=> (not res!6129) (not e!2803))))

(assert (=> d!731 (= res!6129 (bvslt #b00000000000000000000000000000000 (size!256 _keys!1806)))))

(declare-fun e!2800 () ListLongMap!121)

(assert (=> d!731 (= lt!886 e!2800)))

(declare-fun c!336 () Bool)

(assert (=> d!731 (= c!336 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!731 (validMask!0 mask!2250)))

(assert (=> d!731 (= (getCurrentListMap!35 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!893)))

(declare-fun b!5207 () Bool)

(declare-fun res!6126 () Bool)

(assert (=> b!5207 (=> (not res!6126) (not e!2804))))

(assert (=> b!5207 (= res!6126 e!2797)))

(declare-fun c!338 () Bool)

(assert (=> b!5207 (= c!338 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!5208 () Bool)

(declare-fun call!118 () ListLongMap!121)

(declare-fun +!6 (ListLongMap!121 tuple2!116) ListLongMap!121)

(assert (=> b!5208 (= e!2800 (+!6 call!118 (tuple2!117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun call!119 () ListLongMap!121)

(declare-fun call!117 () ListLongMap!121)

(declare-fun bm!113 () Bool)

(declare-fun c!334 () Bool)

(declare-fun call!121 () ListLongMap!121)

(assert (=> bm!113 (= call!118 (+!6 (ite c!336 call!119 (ite c!334 call!121 call!117)) (ite (or c!336 c!334) (tuple2!117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun bm!114 () Bool)

(assert (=> bm!114 (= call!121 call!119)))

(declare-fun b!5209 () Bool)

(declare-fun Unit!64 () Unit!61)

(assert (=> b!5209 (= e!2798 Unit!64)))

(declare-fun b!5210 () Bool)

(declare-fun lt!889 () Unit!61)

(assert (=> b!5210 (= e!2798 lt!889)))

(declare-fun lt!884 () ListLongMap!121)

(declare-fun getCurrentListMapNoExtraKeys!3 (array!407 array!409 (_ BitVec 32) (_ BitVec 32) V!493 V!493 (_ BitVec 32) Int) ListLongMap!121)

(assert (=> b!5210 (= lt!884 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!892 () (_ BitVec 64))

(assert (=> b!5210 (= lt!892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!903 () (_ BitVec 64))

(assert (=> b!5210 (= lt!903 (select (arr!194 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!896 () Unit!61)

(declare-fun addStillContains!4 (ListLongMap!121 (_ BitVec 64) V!493 (_ BitVec 64)) Unit!61)

(assert (=> b!5210 (= lt!896 (addStillContains!4 lt!884 lt!892 zeroValue!1434 lt!903))))

(assert (=> b!5210 (contains!48 (+!6 lt!884 (tuple2!117 lt!892 zeroValue!1434)) lt!903)))

(declare-fun lt!882 () Unit!61)

(assert (=> b!5210 (= lt!882 lt!896)))

(declare-fun lt!901 () ListLongMap!121)

(assert (=> b!5210 (= lt!901 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!890 () (_ BitVec 64))

(assert (=> b!5210 (= lt!890 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!895 () (_ BitVec 64))

(assert (=> b!5210 (= lt!895 (select (arr!194 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!898 () Unit!61)

(declare-fun addApplyDifferent!4 (ListLongMap!121 (_ BitVec 64) V!493 (_ BitVec 64)) Unit!61)

(assert (=> b!5210 (= lt!898 (addApplyDifferent!4 lt!901 lt!890 minValue!1434 lt!895))))

(declare-fun apply!19 (ListLongMap!121 (_ BitVec 64)) V!493)

(assert (=> b!5210 (= (apply!19 (+!6 lt!901 (tuple2!117 lt!890 minValue!1434)) lt!895) (apply!19 lt!901 lt!895))))

(declare-fun lt!900 () Unit!61)

(assert (=> b!5210 (= lt!900 lt!898)))

(declare-fun lt!891 () ListLongMap!121)

(assert (=> b!5210 (= lt!891 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!887 () (_ BitVec 64))

(assert (=> b!5210 (= lt!887 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!902 () (_ BitVec 64))

(assert (=> b!5210 (= lt!902 (select (arr!194 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!885 () Unit!61)

(assert (=> b!5210 (= lt!885 (addApplyDifferent!4 lt!891 lt!887 zeroValue!1434 lt!902))))

(assert (=> b!5210 (= (apply!19 (+!6 lt!891 (tuple2!117 lt!887 zeroValue!1434)) lt!902) (apply!19 lt!891 lt!902))))

(declare-fun lt!899 () Unit!61)

(assert (=> b!5210 (= lt!899 lt!885)))

(declare-fun lt!897 () ListLongMap!121)

(assert (=> b!5210 (= lt!897 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!888 () (_ BitVec 64))

(assert (=> b!5210 (= lt!888 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!894 () (_ BitVec 64))

(assert (=> b!5210 (= lt!894 (select (arr!194 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!5210 (= lt!889 (addApplyDifferent!4 lt!897 lt!888 minValue!1434 lt!894))))

(assert (=> b!5210 (= (apply!19 (+!6 lt!897 (tuple2!117 lt!888 minValue!1434)) lt!894) (apply!19 lt!897 lt!894))))

(declare-fun b!5211 () Bool)

(declare-fun e!2806 () ListLongMap!121)

(declare-fun call!120 () ListLongMap!121)

(assert (=> b!5211 (= e!2806 call!120)))

(declare-fun b!5212 () Bool)

(declare-fun res!6125 () Bool)

(assert (=> b!5212 (=> (not res!6125) (not e!2804))))

(declare-fun e!2795 () Bool)

(assert (=> b!5212 (= res!6125 e!2795)))

(declare-fun res!6123 () Bool)

(assert (=> b!5212 (=> res!6123 e!2795)))

(declare-fun e!2807 () Bool)

(assert (=> b!5212 (= res!6123 (not e!2807))))

(declare-fun res!6130 () Bool)

(assert (=> b!5212 (=> (not res!6130) (not e!2807))))

(assert (=> b!5212 (= res!6130 (bvslt #b00000000000000000000000000000000 (size!256 _keys!1806)))))

(declare-fun b!5213 () Bool)

(declare-fun e!2799 () ListLongMap!121)

(assert (=> b!5213 (= e!2799 call!120)))

(declare-fun b!5214 () Bool)

(declare-fun c!337 () Bool)

(assert (=> b!5214 (= c!337 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!5214 (= e!2806 e!2799)))

(declare-fun b!5215 () Bool)

(assert (=> b!5215 (= e!2800 e!2806)))

(assert (=> b!5215 (= c!334 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!5216 () Bool)

(assert (=> b!5216 (= e!2797 (not call!122))))

(declare-fun bm!115 () Bool)

(assert (=> bm!115 (= call!117 call!121)))

(declare-fun b!5217 () Bool)

(assert (=> b!5217 (= e!2807 (validKeyInArray!0 (select (arr!194 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5218 () Bool)

(assert (=> b!5218 (= e!2805 (= (apply!19 lt!893 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!5219 () Bool)

(declare-fun e!2802 () Bool)

(declare-fun call!116 () Bool)

(assert (=> b!5219 (= e!2802 (not call!116))))

(declare-fun b!5220 () Bool)

(assert (=> b!5220 (= e!2803 (validKeyInArray!0 (select (arr!194 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!116 () Bool)

(assert (=> bm!116 (= call!120 call!118)))

(declare-fun bm!117 () Bool)

(assert (=> bm!117 (= call!122 (contains!48 lt!893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!5221 () Bool)

(declare-fun e!2796 () Bool)

(assert (=> b!5221 (= e!2795 e!2796)))

(declare-fun res!6124 () Bool)

(assert (=> b!5221 (=> (not res!6124) (not e!2796))))

(assert (=> b!5221 (= res!6124 (contains!48 lt!893 (select (arr!194 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!5221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!256 _keys!1806)))))

(declare-fun bm!118 () Bool)

(assert (=> bm!118 (= call!119 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!5222 () Bool)

(declare-fun get!99 (ValueCell!102 V!493) V!493)

(declare-fun dynLambda!41 (Int (_ BitVec 64)) V!493)

(assert (=> b!5222 (= e!2796 (= (apply!19 lt!893 (select (arr!194 _keys!1806) #b00000000000000000000000000000000)) (get!99 (select (arr!195 _values!1492) #b00000000000000000000000000000000) (dynLambda!41 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!5222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!257 _values!1492)))))

(assert (=> b!5222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!256 _keys!1806)))))

(declare-fun b!5223 () Bool)

(declare-fun e!2801 () Bool)

(assert (=> b!5223 (= e!2802 e!2801)))

(declare-fun res!6127 () Bool)

(assert (=> b!5223 (= res!6127 call!116)))

(assert (=> b!5223 (=> (not res!6127) (not e!2801))))

(declare-fun b!5224 () Bool)

(assert (=> b!5224 (= e!2804 e!2802)))

(declare-fun c!333 () Bool)

(assert (=> b!5224 (= c!333 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!119 () Bool)

(assert (=> bm!119 (= call!116 (contains!48 lt!893 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!5225 () Bool)

(assert (=> b!5225 (= e!2799 call!117)))

(declare-fun b!5226 () Bool)

(assert (=> b!5226 (= e!2801 (= (apply!19 lt!893 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(assert (= (and d!731 c!336) b!5208))

(assert (= (and d!731 (not c!336)) b!5215))

(assert (= (and b!5215 c!334) b!5211))

(assert (= (and b!5215 (not c!334)) b!5214))

(assert (= (and b!5214 c!337) b!5213))

(assert (= (and b!5214 (not c!337)) b!5225))

(assert (= (or b!5213 b!5225) bm!115))

(assert (= (or b!5211 bm!115) bm!114))

(assert (= (or b!5211 b!5213) bm!116))

(assert (= (or b!5208 bm!114) bm!118))

(assert (= (or b!5208 bm!116) bm!113))

(assert (= (and d!731 res!6129) b!5220))

(assert (= (and d!731 c!335) b!5210))

(assert (= (and d!731 (not c!335)) b!5209))

(assert (= (and d!731 res!6122) b!5212))

(assert (= (and b!5212 res!6130) b!5217))

(assert (= (and b!5212 (not res!6123)) b!5221))

(assert (= (and b!5221 res!6124) b!5222))

(assert (= (and b!5212 res!6125) b!5207))

(assert (= (and b!5207 c!338) b!5206))

(assert (= (and b!5207 (not c!338)) b!5216))

(assert (= (and b!5206 res!6128) b!5218))

(assert (= (or b!5206 b!5216) bm!117))

(assert (= (and b!5207 res!6126) b!5224))

(assert (= (and b!5224 c!333) b!5223))

(assert (= (and b!5224 (not c!333)) b!5219))

(assert (= (and b!5223 res!6127) b!5226))

(assert (= (or b!5223 b!5219) bm!119))

(declare-fun b_lambda!327 () Bool)

(assert (=> (not b_lambda!327) (not b!5222)))

(declare-fun t!2262 () Bool)

(declare-fun tb!131 () Bool)

(assert (=> (and start!726 (= defaultEntry!1495 defaultEntry!1495) t!2262) tb!131))

(declare-fun result!195 () Bool)

(assert (=> tb!131 (= result!195 tp_is_empty!237)))

(assert (=> b!5222 t!2262))

(declare-fun b_and!305 () Bool)

(assert (= b_and!301 (and (=> t!2262 result!195) b_and!305)))

(declare-fun m!2851 () Bool)

(assert (=> b!5226 m!2851))

(declare-fun m!2853 () Bool)

(assert (=> bm!117 m!2853))

(declare-fun m!2855 () Bool)

(assert (=> b!5208 m!2855))

(declare-fun m!2857 () Bool)

(assert (=> bm!118 m!2857))

(assert (=> b!5221 m!2837))

(assert (=> b!5221 m!2837))

(declare-fun m!2859 () Bool)

(assert (=> b!5221 m!2859))

(declare-fun m!2861 () Bool)

(assert (=> b!5218 m!2861))

(declare-fun m!2863 () Bool)

(assert (=> bm!119 m!2863))

(assert (=> b!5217 m!2837))

(assert (=> b!5217 m!2837))

(declare-fun m!2865 () Bool)

(assert (=> b!5217 m!2865))

(assert (=> b!5222 m!2837))

(assert (=> b!5222 m!2837))

(declare-fun m!2867 () Bool)

(assert (=> b!5222 m!2867))

(declare-fun m!2869 () Bool)

(assert (=> b!5222 m!2869))

(declare-fun m!2871 () Bool)

(assert (=> b!5222 m!2871))

(declare-fun m!2873 () Bool)

(assert (=> b!5222 m!2873))

(assert (=> b!5222 m!2871))

(assert (=> b!5222 m!2869))

(declare-fun m!2875 () Bool)

(assert (=> bm!113 m!2875))

(assert (=> b!5220 m!2837))

(assert (=> b!5220 m!2837))

(assert (=> b!5220 m!2865))

(assert (=> b!5210 m!2837))

(declare-fun m!2877 () Bool)

(assert (=> b!5210 m!2877))

(assert (=> b!5210 m!2857))

(declare-fun m!2879 () Bool)

(assert (=> b!5210 m!2879))

(declare-fun m!2881 () Bool)

(assert (=> b!5210 m!2881))

(declare-fun m!2883 () Bool)

(assert (=> b!5210 m!2883))

(declare-fun m!2885 () Bool)

(assert (=> b!5210 m!2885))

(declare-fun m!2887 () Bool)

(assert (=> b!5210 m!2887))

(declare-fun m!2889 () Bool)

(assert (=> b!5210 m!2889))

(declare-fun m!2891 () Bool)

(assert (=> b!5210 m!2891))

(assert (=> b!5210 m!2881))

(declare-fun m!2893 () Bool)

(assert (=> b!5210 m!2893))

(declare-fun m!2895 () Bool)

(assert (=> b!5210 m!2895))

(declare-fun m!2897 () Bool)

(assert (=> b!5210 m!2897))

(declare-fun m!2899 () Bool)

(assert (=> b!5210 m!2899))

(assert (=> b!5210 m!2891))

(declare-fun m!2901 () Bool)

(assert (=> b!5210 m!2901))

(assert (=> b!5210 m!2899))

(declare-fun m!2903 () Bool)

(assert (=> b!5210 m!2903))

(assert (=> b!5210 m!2877))

(declare-fun m!2905 () Bool)

(assert (=> b!5210 m!2905))

(assert (=> d!731 m!2795))

(assert (=> b!5098 d!731))

(declare-fun b!5238 () Bool)

(declare-fun e!2814 () Bool)

(declare-fun call!125 () Bool)

(assert (=> b!5238 (= e!2814 call!125)))

(declare-fun b!5239 () Bool)

(declare-fun e!2815 () Bool)

(assert (=> b!5239 (= e!2815 e!2814)))

(declare-fun lt!910 () (_ BitVec 64))

(assert (=> b!5239 (= lt!910 (select (arr!194 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!912 () Unit!61)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!407 (_ BitVec 64) (_ BitVec 32)) Unit!61)

(assert (=> b!5239 (= lt!912 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!910 #b00000000000000000000000000000000))))

(assert (=> b!5239 (arrayContainsKey!0 _keys!1806 lt!910 #b00000000000000000000000000000000)))

(declare-fun lt!911 () Unit!61)

(assert (=> b!5239 (= lt!911 lt!912)))

(declare-fun res!6136 () Bool)

(declare-datatypes ((SeekEntryResult!12 0))(
  ( (MissingZero!12 (index!2167 (_ BitVec 32))) (Found!12 (index!2168 (_ BitVec 32))) (Intermediate!12 (undefined!824 Bool) (index!2169 (_ BitVec 32)) (x!2428 (_ BitVec 32))) (Undefined!12) (MissingVacant!12 (index!2170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!407 (_ BitVec 32)) SeekEntryResult!12)

(assert (=> b!5239 (= res!6136 (= (seekEntryOrOpen!0 (select (arr!194 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!12 #b00000000000000000000000000000000)))))

(assert (=> b!5239 (=> (not res!6136) (not e!2814))))

(declare-fun d!733 () Bool)

(declare-fun res!6135 () Bool)

(declare-fun e!2816 () Bool)

(assert (=> d!733 (=> res!6135 e!2816)))

(assert (=> d!733 (= res!6135 (bvsge #b00000000000000000000000000000000 (size!256 _keys!1806)))))

(assert (=> d!733 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!2816)))

(declare-fun b!5237 () Bool)

(assert (=> b!5237 (= e!2815 call!125)))

(declare-fun bm!122 () Bool)

(assert (=> bm!122 (= call!125 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!5240 () Bool)

(assert (=> b!5240 (= e!2816 e!2815)))

(declare-fun c!341 () Bool)

(assert (=> b!5240 (= c!341 (validKeyInArray!0 (select (arr!194 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!733 (not res!6135)) b!5240))

(assert (= (and b!5240 c!341) b!5239))

(assert (= (and b!5240 (not c!341)) b!5237))

(assert (= (and b!5239 res!6136) b!5238))

(assert (= (or b!5238 b!5237) bm!122))

(assert (=> b!5239 m!2837))

(declare-fun m!2907 () Bool)

(assert (=> b!5239 m!2907))

(declare-fun m!2909 () Bool)

(assert (=> b!5239 m!2909))

(assert (=> b!5239 m!2837))

(declare-fun m!2911 () Bool)

(assert (=> b!5239 m!2911))

(declare-fun m!2913 () Bool)

(assert (=> bm!122 m!2913))

(assert (=> b!5240 m!2837))

(assert (=> b!5240 m!2837))

(assert (=> b!5240 m!2865))

(assert (=> b!5102 d!733))

(declare-fun d!735 () Bool)

(assert (=> d!735 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!5101 d!735))

(declare-fun bm!125 () Bool)

(declare-fun call!128 () Bool)

(declare-fun c!344 () Bool)

(assert (=> bm!125 (= call!128 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!344 (Cons!124 (select (arr!194 _keys!1806) #b00000000000000000000000000000000) Nil!125) Nil!125)))))

(declare-fun b!5251 () Bool)

(declare-fun e!2827 () Bool)

(assert (=> b!5251 (= e!2827 call!128)))

(declare-fun b!5252 () Bool)

(assert (=> b!5252 (= e!2827 call!128)))

(declare-fun d!737 () Bool)

(declare-fun res!6144 () Bool)

(declare-fun e!2826 () Bool)

(assert (=> d!737 (=> res!6144 e!2826)))

(assert (=> d!737 (= res!6144 (bvsge #b00000000000000000000000000000000 (size!256 _keys!1806)))))

(assert (=> d!737 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!125) e!2826)))

(declare-fun b!5253 () Bool)

(declare-fun e!2825 () Bool)

(declare-fun contains!49 (List!128 (_ BitVec 64)) Bool)

(assert (=> b!5253 (= e!2825 (contains!49 Nil!125 (select (arr!194 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5254 () Bool)

(declare-fun e!2828 () Bool)

(assert (=> b!5254 (= e!2826 e!2828)))

(declare-fun res!6145 () Bool)

(assert (=> b!5254 (=> (not res!6145) (not e!2828))))

(assert (=> b!5254 (= res!6145 (not e!2825))))

(declare-fun res!6143 () Bool)

(assert (=> b!5254 (=> (not res!6143) (not e!2825))))

(assert (=> b!5254 (= res!6143 (validKeyInArray!0 (select (arr!194 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5255 () Bool)

(assert (=> b!5255 (= e!2828 e!2827)))

(assert (=> b!5255 (= c!344 (validKeyInArray!0 (select (arr!194 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!737 (not res!6144)) b!5254))

(assert (= (and b!5254 res!6143) b!5253))

(assert (= (and b!5254 res!6145) b!5255))

(assert (= (and b!5255 c!344) b!5252))

(assert (= (and b!5255 (not c!344)) b!5251))

(assert (= (or b!5252 b!5251) bm!125))

(assert (=> bm!125 m!2837))

(declare-fun m!2915 () Bool)

(assert (=> bm!125 m!2915))

(assert (=> b!5253 m!2837))

(assert (=> b!5253 m!2837))

(declare-fun m!2917 () Bool)

(assert (=> b!5253 m!2917))

(assert (=> b!5254 m!2837))

(assert (=> b!5254 m!2837))

(assert (=> b!5254 m!2865))

(assert (=> b!5255 m!2837))

(assert (=> b!5255 m!2837))

(assert (=> b!5255 m!2865))

(assert (=> b!5096 d!737))

(assert (=> b!5104 d!719))

(declare-fun mapIsEmpty!326 () Bool)

(declare-fun mapRes!326 () Bool)

(assert (=> mapIsEmpty!326 mapRes!326))

(declare-fun b!5262 () Bool)

(declare-fun e!2834 () Bool)

(assert (=> b!5262 (= e!2834 tp_is_empty!237)))

(declare-fun condMapEmpty!326 () Bool)

(declare-fun mapDefault!326 () ValueCell!102)

(assert (=> mapNonEmpty!320 (= condMapEmpty!326 (= mapRest!320 ((as const (Array (_ BitVec 32) ValueCell!102)) mapDefault!326)))))

(declare-fun e!2833 () Bool)

(assert (=> mapNonEmpty!320 (= tp!700 (and e!2833 mapRes!326))))

(declare-fun b!5263 () Bool)

(assert (=> b!5263 (= e!2833 tp_is_empty!237)))

(declare-fun mapNonEmpty!326 () Bool)

(declare-fun tp!710 () Bool)

(assert (=> mapNonEmpty!326 (= mapRes!326 (and tp!710 e!2834))))

(declare-fun mapKey!326 () (_ BitVec 32))

(declare-fun mapValue!326 () ValueCell!102)

(declare-fun mapRest!326 () (Array (_ BitVec 32) ValueCell!102))

(assert (=> mapNonEmpty!326 (= mapRest!320 (store mapRest!326 mapKey!326 mapValue!326))))

(assert (= (and mapNonEmpty!320 condMapEmpty!326) mapIsEmpty!326))

(assert (= (and mapNonEmpty!320 (not condMapEmpty!326)) mapNonEmpty!326))

(assert (= (and mapNonEmpty!326 ((_ is ValueCellFull!102) mapValue!326)) b!5262))

(assert (= (and mapNonEmpty!320 ((_ is ValueCellFull!102) mapDefault!326)) b!5263))

(declare-fun m!2919 () Bool)

(assert (=> mapNonEmpty!326 m!2919))

(declare-fun b_lambda!329 () Bool)

(assert (= b_lambda!327 (or (and start!726 b_free!159) b_lambda!329)))

(check-sat (not bm!118) (not b!5255) (not bm!119) (not d!721) (not bm!117) (not mapNonEmpty!326) (not b_next!159) (not d!731) (not b!5226) tp_is_empty!237 (not d!729) (not b_lambda!329) (not b!5218) (not b!5239) b_and!305 (not b!5163) (not bm!122) (not bm!125) (not b!5153) (not b!5222) (not b!5221) (not b!5210) (not b!5208) (not b!5161) (not b!5240) (not b!5254) (not b!5253) (not b!5148) (not bm!113) (not b!5220) (not b!5217))
(check-sat b_and!305 (not b_next!159))
