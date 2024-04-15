; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!724 () Bool)

(assert start!724)

(declare-fun b_free!157 () Bool)

(declare-fun b_next!157 () Bool)

(assert (=> start!724 (= b_free!157 (not b_next!157))))

(declare-fun tp!694 () Bool)

(declare-fun b_and!299 () Bool)

(assert (=> start!724 (= tp!694 b_and!299)))

(declare-fun b!5059 () Bool)

(declare-fun res!6049 () Bool)

(declare-fun e!2707 () Bool)

(assert (=> b!5059 (=> (not res!6049) (not e!2707))))

(declare-datatypes ((array!397 0))(
  ( (array!398 (arr!189 (Array (_ BitVec 32) (_ BitVec 64))) (size!251 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!397)

(declare-datatypes ((List!124 0))(
  ( (Nil!121) (Cons!120 (h!686 (_ BitVec 64)) (t!2255 List!124)) )
))
(declare-fun arrayNoDuplicates!0 (array!397 (_ BitVec 32) List!124) Bool)

(assert (=> b!5059 (= res!6049 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!121))))

(declare-fun b!5060 () Bool)

(declare-fun res!6047 () Bool)

(assert (=> b!5060 (=> (not res!6047) (not e!2707))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!491 0))(
  ( (V!492 (val!123 Int)) )
))
(declare-datatypes ((ValueCell!101 0))(
  ( (ValueCellFull!101 (v!1212 V!491)) (EmptyCell!101) )
))
(declare-datatypes ((array!399 0))(
  ( (array!400 (arr!190 (Array (_ BitVec 32) ValueCell!101)) (size!252 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!399)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!5060 (= res!6047 (and (= (size!252 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!251 _keys!1806) (size!252 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5061 () Bool)

(declare-fun res!6046 () Bool)

(assert (=> b!5061 (=> (not res!6046) (not e!2707))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!491)

(declare-fun zeroValue!1434 () V!491)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-datatypes ((tuple2!114 0))(
  ( (tuple2!115 (_1!57 (_ BitVec 64)) (_2!57 V!491)) )
))
(declare-datatypes ((List!125 0))(
  ( (Nil!122) (Cons!121 (h!687 tuple2!114) (t!2256 List!125)) )
))
(declare-datatypes ((ListLongMap!119 0))(
  ( (ListLongMap!120 (toList!75 List!125)) )
))
(declare-fun contains!47 (ListLongMap!119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!34 (array!397 array!399 (_ BitVec 32) (_ BitVec 32) V!491 V!491 (_ BitVec 32) Int) ListLongMap!119)

(assert (=> b!5061 (= res!6046 (contains!47 (getCurrentListMap!34 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun res!6048 () Bool)

(assert (=> start!724 (=> (not res!6048) (not e!2707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!724 (= res!6048 (validMask!0 mask!2250))))

(assert (=> start!724 e!2707))

(assert (=> start!724 tp!694))

(assert (=> start!724 true))

(declare-fun e!2710 () Bool)

(declare-fun array_inv!133 (array!399) Bool)

(assert (=> start!724 (and (array_inv!133 _values!1492) e!2710)))

(declare-fun tp_is_empty!235 () Bool)

(assert (=> start!724 tp_is_empty!235))

(declare-fun array_inv!134 (array!397) Bool)

(assert (=> start!724 (array_inv!134 _keys!1806)))

(declare-fun b!5062 () Bool)

(declare-fun e!2706 () Bool)

(declare-fun arrayContainsKey!0 (array!397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5062 (= e!2706 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5063 () Bool)

(declare-fun e!2711 () Bool)

(assert (=> b!5063 (= e!2707 (not e!2711))))

(declare-fun res!6051 () Bool)

(assert (=> b!5063 (=> res!6051 e!2711)))

(assert (=> b!5063 (= res!6051 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!5063 e!2706))

(declare-fun c!308 () Bool)

(assert (=> b!5063 (= c!308 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!59 0))(
  ( (Unit!60) )
))
(declare-fun lt!816 () Unit!59)

(declare-fun lemmaKeyInListMapIsInArray!17 (array!397 array!399 (_ BitVec 32) (_ BitVec 32) V!491 V!491 (_ BitVec 64) Int) Unit!59)

(assert (=> b!5063 (= lt!816 (lemmaKeyInListMapIsInArray!17 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!5064 () Bool)

(assert (=> b!5064 (= e!2706 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5065 () Bool)

(declare-fun e!2708 () Bool)

(declare-fun mapRes!317 () Bool)

(assert (=> b!5065 (= e!2710 (and e!2708 mapRes!317))))

(declare-fun condMapEmpty!317 () Bool)

(declare-fun mapDefault!317 () ValueCell!101)

(assert (=> b!5065 (= condMapEmpty!317 (= (arr!190 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!101)) mapDefault!317)))))

(declare-fun b!5066 () Bool)

(assert (=> b!5066 (= e!2711 (or (not (= (size!251 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))) (bvsle #b00000000000000000000000000000000 (size!251 _keys!1806))))))

(declare-fun b!5067 () Bool)

(declare-fun res!6052 () Bool)

(assert (=> b!5067 (=> (not res!6052) (not e!2707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5067 (= res!6052 (validKeyInArray!0 k0!1278))))

(declare-fun b!5068 () Bool)

(declare-fun res!6050 () Bool)

(assert (=> b!5068 (=> (not res!6050) (not e!2707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!397 (_ BitVec 32)) Bool)

(assert (=> b!5068 (= res!6050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!317 () Bool)

(declare-fun tp!695 () Bool)

(declare-fun e!2705 () Bool)

(assert (=> mapNonEmpty!317 (= mapRes!317 (and tp!695 e!2705))))

(declare-fun mapValue!317 () ValueCell!101)

(declare-fun mapKey!317 () (_ BitVec 32))

(declare-fun mapRest!317 () (Array (_ BitVec 32) ValueCell!101))

(assert (=> mapNonEmpty!317 (= (arr!190 _values!1492) (store mapRest!317 mapKey!317 mapValue!317))))

(declare-fun b!5069 () Bool)

(assert (=> b!5069 (= e!2708 tp_is_empty!235)))

(declare-fun b!5070 () Bool)

(assert (=> b!5070 (= e!2705 tp_is_empty!235)))

(declare-fun mapIsEmpty!317 () Bool)

(assert (=> mapIsEmpty!317 mapRes!317))

(assert (= (and start!724 res!6048) b!5060))

(assert (= (and b!5060 res!6047) b!5068))

(assert (= (and b!5068 res!6050) b!5059))

(assert (= (and b!5059 res!6049) b!5061))

(assert (= (and b!5061 res!6046) b!5067))

(assert (= (and b!5067 res!6052) b!5063))

(assert (= (and b!5063 c!308) b!5062))

(assert (= (and b!5063 (not c!308)) b!5064))

(assert (= (and b!5063 (not res!6051)) b!5066))

(assert (= (and b!5065 condMapEmpty!317) mapIsEmpty!317))

(assert (= (and b!5065 (not condMapEmpty!317)) mapNonEmpty!317))

(get-info :version)

(assert (= (and mapNonEmpty!317 ((_ is ValueCellFull!101) mapValue!317)) b!5070))

(assert (= (and b!5065 ((_ is ValueCellFull!101) mapDefault!317)) b!5069))

(assert (= start!724 b!5065))

(declare-fun m!2771 () Bool)

(assert (=> start!724 m!2771))

(declare-fun m!2773 () Bool)

(assert (=> start!724 m!2773))

(declare-fun m!2775 () Bool)

(assert (=> start!724 m!2775))

(declare-fun m!2777 () Bool)

(assert (=> b!5067 m!2777))

(declare-fun m!2779 () Bool)

(assert (=> b!5059 m!2779))

(declare-fun m!2781 () Bool)

(assert (=> b!5063 m!2781))

(declare-fun m!2783 () Bool)

(assert (=> b!5063 m!2783))

(declare-fun m!2785 () Bool)

(assert (=> mapNonEmpty!317 m!2785))

(declare-fun m!2787 () Bool)

(assert (=> b!5061 m!2787))

(assert (=> b!5061 m!2787))

(declare-fun m!2789 () Bool)

(assert (=> b!5061 m!2789))

(declare-fun m!2791 () Bool)

(assert (=> b!5068 m!2791))

(assert (=> b!5062 m!2781))

(check-sat (not b!5063) tp_is_empty!235 (not b!5061) (not b!5062) (not start!724) (not b!5068) (not b!5067) (not b!5059) (not mapNonEmpty!317) (not b_next!157) b_and!299)
(check-sat b_and!299 (not b_next!157))
(get-model)

(declare-fun d!719 () Bool)

(declare-fun res!6099 () Bool)

(declare-fun e!2758 () Bool)

(assert (=> d!719 (=> res!6099 e!2758)))

(assert (=> d!719 (= res!6099 (= (select (arr!189 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!719 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!2758)))

(declare-fun b!5147 () Bool)

(declare-fun e!2759 () Bool)

(assert (=> b!5147 (= e!2758 e!2759)))

(declare-fun res!6100 () Bool)

(assert (=> b!5147 (=> (not res!6100) (not e!2759))))

(assert (=> b!5147 (= res!6100 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!251 _keys!1806)))))

(declare-fun b!5148 () Bool)

(assert (=> b!5148 (= e!2759 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!719 (not res!6099)) b!5147))

(assert (= (and b!5147 res!6100) b!5148))

(declare-fun m!2837 () Bool)

(assert (=> d!719 m!2837))

(declare-fun m!2839 () Bool)

(assert (=> b!5148 m!2839))

(assert (=> b!5063 d!719))

(declare-fun d!721 () Bool)

(declare-fun e!2762 () Bool)

(assert (=> d!721 e!2762))

(declare-fun c!317 () Bool)

(assert (=> d!721 (= c!317 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!825 () Unit!59)

(declare-fun choose!136 (array!397 array!399 (_ BitVec 32) (_ BitVec 32) V!491 V!491 (_ BitVec 64) Int) Unit!59)

(assert (=> d!721 (= lt!825 (choose!136 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!721 (validMask!0 mask!2250)))

(assert (=> d!721 (= (lemmaKeyInListMapIsInArray!17 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!825)))

(declare-fun b!5153 () Bool)

(assert (=> b!5153 (= e!2762 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5154 () Bool)

(assert (=> b!5154 (= e!2762 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!721 c!317) b!5153))

(assert (= (and d!721 (not c!317)) b!5154))

(declare-fun m!2841 () Bool)

(assert (=> d!721 m!2841))

(assert (=> d!721 m!2771))

(assert (=> b!5153 m!2781))

(assert (=> b!5063 d!721))

(declare-fun d!723 () Bool)

(declare-fun res!6106 () Bool)

(declare-fun e!2769 () Bool)

(assert (=> d!723 (=> res!6106 e!2769)))

(assert (=> d!723 (= res!6106 (bvsge #b00000000000000000000000000000000 (size!251 _keys!1806)))))

(assert (=> d!723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!2769)))

(declare-fun b!5163 () Bool)

(declare-fun e!2771 () Bool)

(declare-fun call!104 () Bool)

(assert (=> b!5163 (= e!2771 call!104)))

(declare-fun b!5164 () Bool)

(assert (=> b!5164 (= e!2769 e!2771)))

(declare-fun c!320 () Bool)

(assert (=> b!5164 (= c!320 (validKeyInArray!0 (select (arr!189 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!101 () Bool)

(assert (=> bm!101 (= call!104 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!5165 () Bool)

(declare-fun e!2770 () Bool)

(assert (=> b!5165 (= e!2770 call!104)))

(declare-fun b!5166 () Bool)

(assert (=> b!5166 (= e!2771 e!2770)))

(declare-fun lt!832 () (_ BitVec 64))

(assert (=> b!5166 (= lt!832 (select (arr!189 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!834 () Unit!59)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!397 (_ BitVec 64) (_ BitVec 32)) Unit!59)

(assert (=> b!5166 (= lt!834 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!832 #b00000000000000000000000000000000))))

(assert (=> b!5166 (arrayContainsKey!0 _keys!1806 lt!832 #b00000000000000000000000000000000)))

(declare-fun lt!833 () Unit!59)

(assert (=> b!5166 (= lt!833 lt!834)))

(declare-fun res!6105 () Bool)

(declare-datatypes ((SeekEntryResult!12 0))(
  ( (MissingZero!12 (index!2167 (_ BitVec 32))) (Found!12 (index!2168 (_ BitVec 32))) (Intermediate!12 (undefined!824 Bool) (index!2169 (_ BitVec 32)) (x!2428 (_ BitVec 32))) (Undefined!12) (MissingVacant!12 (index!2170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!397 (_ BitVec 32)) SeekEntryResult!12)

(assert (=> b!5166 (= res!6105 (= (seekEntryOrOpen!0 (select (arr!189 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!12 #b00000000000000000000000000000000)))))

(assert (=> b!5166 (=> (not res!6105) (not e!2770))))

(assert (= (and d!723 (not res!6106)) b!5164))

(assert (= (and b!5164 c!320) b!5166))

(assert (= (and b!5164 (not c!320)) b!5163))

(assert (= (and b!5166 res!6105) b!5165))

(assert (= (or b!5165 b!5163) bm!101))

(assert (=> b!5164 m!2837))

(assert (=> b!5164 m!2837))

(declare-fun m!2843 () Bool)

(assert (=> b!5164 m!2843))

(declare-fun m!2845 () Bool)

(assert (=> bm!101 m!2845))

(assert (=> b!5166 m!2837))

(declare-fun m!2847 () Bool)

(assert (=> b!5166 m!2847))

(declare-fun m!2849 () Bool)

(assert (=> b!5166 m!2849))

(assert (=> b!5166 m!2837))

(declare-fun m!2851 () Bool)

(assert (=> b!5166 m!2851))

(assert (=> b!5068 d!723))

(declare-fun d!725 () Bool)

(assert (=> d!725 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!724 d!725))

(declare-fun d!727 () Bool)

(assert (=> d!727 (= (array_inv!133 _values!1492) (bvsge (size!252 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!724 d!727))

(declare-fun d!729 () Bool)

(assert (=> d!729 (= (array_inv!134 _keys!1806) (bvsge (size!251 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!724 d!729))

(assert (=> b!5062 d!719))

(declare-fun d!731 () Bool)

(assert (=> d!731 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!5067 d!731))

(declare-fun d!733 () Bool)

(declare-fun e!2777 () Bool)

(assert (=> d!733 e!2777))

(declare-fun res!6109 () Bool)

(assert (=> d!733 (=> res!6109 e!2777)))

(declare-fun lt!845 () Bool)

(assert (=> d!733 (= res!6109 (not lt!845))))

(declare-fun lt!844 () Bool)

(assert (=> d!733 (= lt!845 lt!844)))

(declare-fun lt!843 () Unit!59)

(declare-fun e!2776 () Unit!59)

(assert (=> d!733 (= lt!843 e!2776)))

(declare-fun c!323 () Bool)

(assert (=> d!733 (= c!323 lt!844)))

(declare-fun containsKey!3 (List!125 (_ BitVec 64)) Bool)

(assert (=> d!733 (= lt!844 (containsKey!3 (toList!75 (getCurrentListMap!34 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!733 (= (contains!47 (getCurrentListMap!34 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!845)))

(declare-fun b!5173 () Bool)

(declare-fun lt!846 () Unit!59)

(assert (=> b!5173 (= e!2776 lt!846)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!3 (List!125 (_ BitVec 64)) Unit!59)

(assert (=> b!5173 (= lt!846 (lemmaContainsKeyImpliesGetValueByKeyDefined!3 (toList!75 (getCurrentListMap!34 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!15 0))(
  ( (Some!14 (v!1215 V!491)) (None!13) )
))
(declare-fun isDefined!4 (Option!15) Bool)

(declare-fun getValueByKey!9 (List!125 (_ BitVec 64)) Option!15)

(assert (=> b!5173 (isDefined!4 (getValueByKey!9 (toList!75 (getCurrentListMap!34 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!5174 () Bool)

(declare-fun Unit!63 () Unit!59)

(assert (=> b!5174 (= e!2776 Unit!63)))

(declare-fun b!5175 () Bool)

(assert (=> b!5175 (= e!2777 (isDefined!4 (getValueByKey!9 (toList!75 (getCurrentListMap!34 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!733 c!323) b!5173))

(assert (= (and d!733 (not c!323)) b!5174))

(assert (= (and d!733 (not res!6109)) b!5175))

(declare-fun m!2853 () Bool)

(assert (=> d!733 m!2853))

(declare-fun m!2855 () Bool)

(assert (=> b!5173 m!2855))

(declare-fun m!2857 () Bool)

(assert (=> b!5173 m!2857))

(assert (=> b!5173 m!2857))

(declare-fun m!2859 () Bool)

(assert (=> b!5173 m!2859))

(assert (=> b!5175 m!2857))

(assert (=> b!5175 m!2857))

(assert (=> b!5175 m!2859))

(assert (=> b!5061 d!733))

(declare-fun bm!116 () Bool)

(declare-fun call!123 () Bool)

(declare-fun lt!904 () ListLongMap!119)

(assert (=> bm!116 (= call!123 (contains!47 lt!904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!5218 () Bool)

(declare-fun e!2816 () Bool)

(assert (=> b!5218 (= e!2816 (not call!123))))

(declare-fun d!735 () Bool)

(declare-fun e!2807 () Bool)

(assert (=> d!735 e!2807))

(declare-fun res!6135 () Bool)

(assert (=> d!735 (=> (not res!6135) (not e!2807))))

(assert (=> d!735 (= res!6135 (or (bvsge #b00000000000000000000000000000000 (size!251 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!251 _keys!1806)))))))

(declare-fun lt!911 () ListLongMap!119)

(assert (=> d!735 (= lt!904 lt!911)))

(declare-fun lt!897 () Unit!59)

(declare-fun e!2813 () Unit!59)

(assert (=> d!735 (= lt!897 e!2813)))

(declare-fun c!340 () Bool)

(declare-fun e!2808 () Bool)

(assert (=> d!735 (= c!340 e!2808)))

(declare-fun res!6130 () Bool)

(assert (=> d!735 (=> (not res!6130) (not e!2808))))

(assert (=> d!735 (= res!6130 (bvslt #b00000000000000000000000000000000 (size!251 _keys!1806)))))

(declare-fun e!2815 () ListLongMap!119)

(assert (=> d!735 (= lt!911 e!2815)))

(declare-fun c!341 () Bool)

(assert (=> d!735 (= c!341 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!735 (validMask!0 mask!2250)))

(assert (=> d!735 (= (getCurrentListMap!34 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!904)))

(declare-fun call!122 () ListLongMap!119)

(declare-fun call!121 () ListLongMap!119)

(declare-fun call!124 () ListLongMap!119)

(declare-fun bm!117 () Bool)

(declare-fun call!119 () ListLongMap!119)

(declare-fun c!336 () Bool)

(declare-fun +!6 (ListLongMap!119 tuple2!114) ListLongMap!119)

(assert (=> bm!117 (= call!119 (+!6 (ite c!341 call!122 (ite c!336 call!121 call!124)) (ite (or c!341 c!336) (tuple2!115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun bm!118 () Bool)

(declare-fun call!125 () ListLongMap!119)

(assert (=> bm!118 (= call!125 call!119)))

(declare-fun b!5219 () Bool)

(declare-fun e!2810 () Bool)

(assert (=> b!5219 (= e!2816 e!2810)))

(declare-fun res!6128 () Bool)

(assert (=> b!5219 (= res!6128 call!123)))

(assert (=> b!5219 (=> (not res!6128) (not e!2810))))

(declare-fun bm!119 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3 (array!397 array!399 (_ BitVec 32) (_ BitVec 32) V!491 V!491 (_ BitVec 32) Int) ListLongMap!119)

(assert (=> bm!119 (= call!122 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!5220 () Bool)

(declare-fun lt!912 () Unit!59)

(assert (=> b!5220 (= e!2813 lt!912)))

(declare-fun lt!893 () ListLongMap!119)

(assert (=> b!5220 (= lt!893 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!896 () (_ BitVec 64))

(assert (=> b!5220 (= lt!896 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!907 () (_ BitVec 64))

(assert (=> b!5220 (= lt!907 (select (arr!189 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!898 () Unit!59)

(declare-fun addStillContains!4 (ListLongMap!119 (_ BitVec 64) V!491 (_ BitVec 64)) Unit!59)

(assert (=> b!5220 (= lt!898 (addStillContains!4 lt!893 lt!896 zeroValue!1434 lt!907))))

(assert (=> b!5220 (contains!47 (+!6 lt!893 (tuple2!115 lt!896 zeroValue!1434)) lt!907)))

(declare-fun lt!906 () Unit!59)

(assert (=> b!5220 (= lt!906 lt!898)))

(declare-fun lt!899 () ListLongMap!119)

(assert (=> b!5220 (= lt!899 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!900 () (_ BitVec 64))

(assert (=> b!5220 (= lt!900 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!892 () (_ BitVec 64))

(assert (=> b!5220 (= lt!892 (select (arr!189 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!895 () Unit!59)

(declare-fun addApplyDifferent!4 (ListLongMap!119 (_ BitVec 64) V!491 (_ BitVec 64)) Unit!59)

(assert (=> b!5220 (= lt!895 (addApplyDifferent!4 lt!899 lt!900 minValue!1434 lt!892))))

(declare-fun apply!19 (ListLongMap!119 (_ BitVec 64)) V!491)

(assert (=> b!5220 (= (apply!19 (+!6 lt!899 (tuple2!115 lt!900 minValue!1434)) lt!892) (apply!19 lt!899 lt!892))))

(declare-fun lt!902 () Unit!59)

(assert (=> b!5220 (= lt!902 lt!895)))

(declare-fun lt!901 () ListLongMap!119)

(assert (=> b!5220 (= lt!901 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!910 () (_ BitVec 64))

(assert (=> b!5220 (= lt!910 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!891 () (_ BitVec 64))

(assert (=> b!5220 (= lt!891 (select (arr!189 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!903 () Unit!59)

(assert (=> b!5220 (= lt!903 (addApplyDifferent!4 lt!901 lt!910 zeroValue!1434 lt!891))))

(assert (=> b!5220 (= (apply!19 (+!6 lt!901 (tuple2!115 lt!910 zeroValue!1434)) lt!891) (apply!19 lt!901 lt!891))))

(declare-fun lt!905 () Unit!59)

(assert (=> b!5220 (= lt!905 lt!903)))

(declare-fun lt!909 () ListLongMap!119)

(assert (=> b!5220 (= lt!909 (getCurrentListMapNoExtraKeys!3 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!894 () (_ BitVec 64))

(assert (=> b!5220 (= lt!894 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!908 () (_ BitVec 64))

(assert (=> b!5220 (= lt!908 (select (arr!189 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!5220 (= lt!912 (addApplyDifferent!4 lt!909 lt!894 minValue!1434 lt!908))))

(assert (=> b!5220 (= (apply!19 (+!6 lt!909 (tuple2!115 lt!894 minValue!1434)) lt!908) (apply!19 lt!909 lt!908))))

(declare-fun b!5221 () Bool)

(declare-fun res!6134 () Bool)

(assert (=> b!5221 (=> (not res!6134) (not e!2807))))

(declare-fun e!2805 () Bool)

(assert (=> b!5221 (= res!6134 e!2805)))

(declare-fun res!6129 () Bool)

(assert (=> b!5221 (=> res!6129 e!2805)))

(declare-fun e!2812 () Bool)

(assert (=> b!5221 (= res!6129 (not e!2812))))

(declare-fun res!6136 () Bool)

(assert (=> b!5221 (=> (not res!6136) (not e!2812))))

(assert (=> b!5221 (= res!6136 (bvslt #b00000000000000000000000000000000 (size!251 _keys!1806)))))

(declare-fun b!5222 () Bool)

(declare-fun c!339 () Bool)

(assert (=> b!5222 (= c!339 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!2804 () ListLongMap!119)

(declare-fun e!2811 () ListLongMap!119)

(assert (=> b!5222 (= e!2804 e!2811)))

(declare-fun bm!120 () Bool)

(declare-fun call!120 () Bool)

(assert (=> bm!120 (= call!120 (contains!47 lt!904 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!5223 () Bool)

(assert (=> b!5223 (= e!2811 call!124)))

(declare-fun bm!121 () Bool)

(assert (=> bm!121 (= call!124 call!121)))

(declare-fun b!5224 () Bool)

(assert (=> b!5224 (= e!2808 (validKeyInArray!0 (select (arr!189 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5225 () Bool)

(declare-fun e!2809 () Bool)

(assert (=> b!5225 (= e!2809 (= (apply!19 lt!904 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!5226 () Bool)

(assert (=> b!5226 (= e!2815 (+!6 call!119 (tuple2!115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!5227 () Bool)

(declare-fun Unit!64 () Unit!59)

(assert (=> b!5227 (= e!2813 Unit!64)))

(declare-fun b!5228 () Bool)

(declare-fun e!2814 () Bool)

(assert (=> b!5228 (= e!2814 e!2809)))

(declare-fun res!6133 () Bool)

(assert (=> b!5228 (= res!6133 call!120)))

(assert (=> b!5228 (=> (not res!6133) (not e!2809))))

(declare-fun e!2806 () Bool)

(declare-fun b!5229 () Bool)

(declare-fun get!99 (ValueCell!101 V!491) V!491)

(declare-fun dynLambda!41 (Int (_ BitVec 64)) V!491)

(assert (=> b!5229 (= e!2806 (= (apply!19 lt!904 (select (arr!189 _keys!1806) #b00000000000000000000000000000000)) (get!99 (select (arr!190 _values!1492) #b00000000000000000000000000000000) (dynLambda!41 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!5229 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!252 _values!1492)))))

(assert (=> b!5229 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!251 _keys!1806)))))

(declare-fun b!5230 () Bool)

(assert (=> b!5230 (= e!2815 e!2804)))

(assert (=> b!5230 (= c!336 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!5231 () Bool)

(assert (=> b!5231 (= e!2810 (= (apply!19 lt!904 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!5232 () Bool)

(declare-fun res!6131 () Bool)

(assert (=> b!5232 (=> (not res!6131) (not e!2807))))

(assert (=> b!5232 (= res!6131 e!2816)))

(declare-fun c!337 () Bool)

(assert (=> b!5232 (= c!337 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!5233 () Bool)

(assert (=> b!5233 (= e!2814 (not call!120))))

(declare-fun b!5234 () Bool)

(assert (=> b!5234 (= e!2804 call!125)))

(declare-fun b!5235 () Bool)

(assert (=> b!5235 (= e!2812 (validKeyInArray!0 (select (arr!189 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5236 () Bool)

(assert (=> b!5236 (= e!2811 call!125)))

(declare-fun bm!122 () Bool)

(assert (=> bm!122 (= call!121 call!122)))

(declare-fun b!5237 () Bool)

(assert (=> b!5237 (= e!2807 e!2814)))

(declare-fun c!338 () Bool)

(assert (=> b!5237 (= c!338 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!5238 () Bool)

(assert (=> b!5238 (= e!2805 e!2806)))

(declare-fun res!6132 () Bool)

(assert (=> b!5238 (=> (not res!6132) (not e!2806))))

(assert (=> b!5238 (= res!6132 (contains!47 lt!904 (select (arr!189 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!5238 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!251 _keys!1806)))))

(assert (= (and d!735 c!341) b!5226))

(assert (= (and d!735 (not c!341)) b!5230))

(assert (= (and b!5230 c!336) b!5234))

(assert (= (and b!5230 (not c!336)) b!5222))

(assert (= (and b!5222 c!339) b!5236))

(assert (= (and b!5222 (not c!339)) b!5223))

(assert (= (or b!5236 b!5223) bm!121))

(assert (= (or b!5234 bm!121) bm!122))

(assert (= (or b!5234 b!5236) bm!118))

(assert (= (or b!5226 bm!122) bm!119))

(assert (= (or b!5226 bm!118) bm!117))

(assert (= (and d!735 res!6130) b!5224))

(assert (= (and d!735 c!340) b!5220))

(assert (= (and d!735 (not c!340)) b!5227))

(assert (= (and d!735 res!6135) b!5221))

(assert (= (and b!5221 res!6136) b!5235))

(assert (= (and b!5221 (not res!6129)) b!5238))

(assert (= (and b!5238 res!6132) b!5229))

(assert (= (and b!5221 res!6134) b!5232))

(assert (= (and b!5232 c!337) b!5219))

(assert (= (and b!5232 (not c!337)) b!5218))

(assert (= (and b!5219 res!6128) b!5231))

(assert (= (or b!5219 b!5218) bm!116))

(assert (= (and b!5232 res!6131) b!5237))

(assert (= (and b!5237 c!338) b!5228))

(assert (= (and b!5237 (not c!338)) b!5233))

(assert (= (and b!5228 res!6133) b!5225))

(assert (= (or b!5228 b!5233) bm!120))

(declare-fun b_lambda!327 () Bool)

(assert (=> (not b_lambda!327) (not b!5229)))

(declare-fun t!2259 () Bool)

(declare-fun tb!131 () Bool)

(assert (=> (and start!724 (= defaultEntry!1495 defaultEntry!1495) t!2259) tb!131))

(declare-fun result!195 () Bool)

(assert (=> tb!131 (= result!195 tp_is_empty!235)))

(assert (=> b!5229 t!2259))

(declare-fun b_and!305 () Bool)

(assert (= b_and!299 (and (=> t!2259 result!195) b_and!305)))

(declare-fun m!2861 () Bool)

(assert (=> b!5220 m!2861))

(declare-fun m!2863 () Bool)

(assert (=> b!5220 m!2863))

(declare-fun m!2865 () Bool)

(assert (=> b!5220 m!2865))

(declare-fun m!2867 () Bool)

(assert (=> b!5220 m!2867))

(declare-fun m!2869 () Bool)

(assert (=> b!5220 m!2869))

(declare-fun m!2871 () Bool)

(assert (=> b!5220 m!2871))

(declare-fun m!2873 () Bool)

(assert (=> b!5220 m!2873))

(declare-fun m!2875 () Bool)

(assert (=> b!5220 m!2875))

(declare-fun m!2877 () Bool)

(assert (=> b!5220 m!2877))

(declare-fun m!2879 () Bool)

(assert (=> b!5220 m!2879))

(declare-fun m!2881 () Bool)

(assert (=> b!5220 m!2881))

(assert (=> b!5220 m!2871))

(assert (=> b!5220 m!2861))

(assert (=> b!5220 m!2837))

(declare-fun m!2883 () Bool)

(assert (=> b!5220 m!2883))

(declare-fun m!2885 () Bool)

(assert (=> b!5220 m!2885))

(assert (=> b!5220 m!2883))

(declare-fun m!2887 () Bool)

(assert (=> b!5220 m!2887))

(declare-fun m!2889 () Bool)

(assert (=> b!5220 m!2889))

(assert (=> b!5220 m!2885))

(declare-fun m!2891 () Bool)

(assert (=> b!5220 m!2891))

(assert (=> b!5224 m!2837))

(assert (=> b!5224 m!2837))

(assert (=> b!5224 m!2843))

(declare-fun m!2893 () Bool)

(assert (=> b!5229 m!2893))

(declare-fun m!2895 () Bool)

(assert (=> b!5229 m!2895))

(declare-fun m!2897 () Bool)

(assert (=> b!5229 m!2897))

(assert (=> b!5229 m!2895))

(assert (=> b!5229 m!2837))

(declare-fun m!2899 () Bool)

(assert (=> b!5229 m!2899))

(assert (=> b!5229 m!2893))

(assert (=> b!5229 m!2837))

(declare-fun m!2901 () Bool)

(assert (=> b!5231 m!2901))

(declare-fun m!2903 () Bool)

(assert (=> b!5225 m!2903))

(declare-fun m!2905 () Bool)

(assert (=> bm!117 m!2905))

(declare-fun m!2907 () Bool)

(assert (=> b!5226 m!2907))

(assert (=> d!735 m!2771))

(assert (=> b!5238 m!2837))

(assert (=> b!5238 m!2837))

(declare-fun m!2909 () Bool)

(assert (=> b!5238 m!2909))

(declare-fun m!2911 () Bool)

(assert (=> bm!116 m!2911))

(declare-fun m!2913 () Bool)

(assert (=> bm!120 m!2913))

(assert (=> b!5235 m!2837))

(assert (=> b!5235 m!2837))

(assert (=> b!5235 m!2843))

(assert (=> bm!119 m!2889))

(assert (=> b!5061 d!735))

(declare-fun d!737 () Bool)

(declare-fun res!6143 () Bool)

(declare-fun e!2825 () Bool)

(assert (=> d!737 (=> res!6143 e!2825)))

(assert (=> d!737 (= res!6143 (bvsge #b00000000000000000000000000000000 (size!251 _keys!1806)))))

(assert (=> d!737 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!121) e!2825)))

(declare-fun b!5251 () Bool)

(declare-fun e!2827 () Bool)

(assert (=> b!5251 (= e!2825 e!2827)))

(declare-fun res!6144 () Bool)

(assert (=> b!5251 (=> (not res!6144) (not e!2827))))

(declare-fun e!2826 () Bool)

(assert (=> b!5251 (= res!6144 (not e!2826))))

(declare-fun res!6145 () Bool)

(assert (=> b!5251 (=> (not res!6145) (not e!2826))))

(assert (=> b!5251 (= res!6145 (validKeyInArray!0 (select (arr!189 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5252 () Bool)

(declare-fun contains!49 (List!124 (_ BitVec 64)) Bool)

(assert (=> b!5252 (= e!2826 (contains!49 Nil!121 (select (arr!189 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!5253 () Bool)

(declare-fun e!2828 () Bool)

(assert (=> b!5253 (= e!2827 e!2828)))

(declare-fun c!344 () Bool)

(assert (=> b!5253 (= c!344 (validKeyInArray!0 (select (arr!189 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!125 () Bool)

(declare-fun call!128 () Bool)

(assert (=> bm!125 (= call!128 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!344 (Cons!120 (select (arr!189 _keys!1806) #b00000000000000000000000000000000) Nil!121) Nil!121)))))

(declare-fun b!5254 () Bool)

(assert (=> b!5254 (= e!2828 call!128)))

(declare-fun b!5255 () Bool)

(assert (=> b!5255 (= e!2828 call!128)))

(assert (= (and d!737 (not res!6143)) b!5251))

(assert (= (and b!5251 res!6145) b!5252))

(assert (= (and b!5251 res!6144) b!5253))

(assert (= (and b!5253 c!344) b!5255))

(assert (= (and b!5253 (not c!344)) b!5254))

(assert (= (or b!5255 b!5254) bm!125))

(assert (=> b!5251 m!2837))

(assert (=> b!5251 m!2837))

(assert (=> b!5251 m!2843))

(assert (=> b!5252 m!2837))

(assert (=> b!5252 m!2837))

(declare-fun m!2915 () Bool)

(assert (=> b!5252 m!2915))

(assert (=> b!5253 m!2837))

(assert (=> b!5253 m!2837))

(assert (=> b!5253 m!2843))

(assert (=> bm!125 m!2837))

(declare-fun m!2917 () Bool)

(assert (=> bm!125 m!2917))

(assert (=> b!5059 d!737))

(declare-fun b!5262 () Bool)

(declare-fun e!2834 () Bool)

(assert (=> b!5262 (= e!2834 tp_is_empty!235)))

(declare-fun b!5263 () Bool)

(declare-fun e!2833 () Bool)

(assert (=> b!5263 (= e!2833 tp_is_empty!235)))

(declare-fun mapNonEmpty!326 () Bool)

(declare-fun mapRes!326 () Bool)

(declare-fun tp!710 () Bool)

(assert (=> mapNonEmpty!326 (= mapRes!326 (and tp!710 e!2834))))

(declare-fun mapRest!326 () (Array (_ BitVec 32) ValueCell!101))

(declare-fun mapValue!326 () ValueCell!101)

(declare-fun mapKey!326 () (_ BitVec 32))

(assert (=> mapNonEmpty!326 (= mapRest!317 (store mapRest!326 mapKey!326 mapValue!326))))

(declare-fun mapIsEmpty!326 () Bool)

(assert (=> mapIsEmpty!326 mapRes!326))

(declare-fun condMapEmpty!326 () Bool)

(declare-fun mapDefault!326 () ValueCell!101)

(assert (=> mapNonEmpty!317 (= condMapEmpty!326 (= mapRest!317 ((as const (Array (_ BitVec 32) ValueCell!101)) mapDefault!326)))))

(assert (=> mapNonEmpty!317 (= tp!695 (and e!2833 mapRes!326))))

(assert (= (and mapNonEmpty!317 condMapEmpty!326) mapIsEmpty!326))

(assert (= (and mapNonEmpty!317 (not condMapEmpty!326)) mapNonEmpty!326))

(assert (= (and mapNonEmpty!326 ((_ is ValueCellFull!101) mapValue!326)) b!5262))

(assert (= (and mapNonEmpty!317 ((_ is ValueCellFull!101) mapDefault!326)) b!5263))

(declare-fun m!2919 () Bool)

(assert (=> mapNonEmpty!326 m!2919))

(declare-fun b_lambda!329 () Bool)

(assert (= b_lambda!327 (or (and start!724 b_free!157) b_lambda!329)))

(check-sat (not d!733) (not b!5235) (not d!721) tp_is_empty!235 (not d!735) (not bm!101) (not b!5164) (not bm!116) (not b!5153) (not b!5173) (not b!5251) (not bm!119) (not b!5224) (not mapNonEmpty!326) (not b!5231) (not bm!125) (not b!5175) b_and!305 (not bm!117) (not bm!120) (not b!5229) (not b_lambda!329) (not b!5238) (not b!5253) (not b!5220) (not b!5166) (not b!5252) (not b!5148) (not b_next!157) (not b!5225) (not b!5226))
(check-sat b_and!305 (not b_next!157))
