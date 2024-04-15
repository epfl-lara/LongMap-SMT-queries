; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77882 () Bool)

(assert start!77882)

(declare-fun b_free!16459 () Bool)

(declare-fun b_next!16459 () Bool)

(assert (=> start!77882 (= b_free!16459 (not b_next!16459))))

(declare-fun tp!57642 () Bool)

(declare-fun b_and!27001 () Bool)

(assert (=> start!77882 (= tp!57642 b_and!27001)))

(declare-fun b!909345 () Bool)

(declare-fun e!509736 () Bool)

(declare-fun e!509737 () Bool)

(declare-fun mapRes!30031 () Bool)

(assert (=> b!909345 (= e!509736 (and e!509737 mapRes!30031))))

(declare-fun condMapEmpty!30031 () Bool)

(declare-datatypes ((V!30135 0))(
  ( (V!30136 (val!9489 Int)) )
))
(declare-datatypes ((ValueCell!8957 0))(
  ( (ValueCellFull!8957 (v!11995 V!30135)) (EmptyCell!8957) )
))
(declare-datatypes ((array!53761 0))(
  ( (array!53762 (arr!25839 (Array (_ BitVec 32) ValueCell!8957)) (size!26300 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53761)

(declare-fun mapDefault!30031 () ValueCell!8957)

(assert (=> b!909345 (= condMapEmpty!30031 (= (arr!25839 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8957)) mapDefault!30031)))))

(declare-fun mapNonEmpty!30031 () Bool)

(declare-fun tp!57643 () Bool)

(declare-fun e!509738 () Bool)

(assert (=> mapNonEmpty!30031 (= mapRes!30031 (and tp!57643 e!509738))))

(declare-fun mapKey!30031 () (_ BitVec 32))

(declare-fun mapValue!30031 () ValueCell!8957)

(declare-fun mapRest!30031 () (Array (_ BitVec 32) ValueCell!8957))

(assert (=> mapNonEmpty!30031 (= (arr!25839 _values!1152) (store mapRest!30031 mapKey!30031 mapValue!30031))))

(declare-fun b!909347 () Bool)

(declare-fun tp_is_empty!18877 () Bool)

(assert (=> b!909347 (= e!509737 tp_is_empty!18877)))

(declare-fun b!909348 () Bool)

(declare-fun res!613787 () Bool)

(declare-fun e!509734 () Bool)

(assert (=> b!909348 (=> (not res!613787) (not e!509734))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30135)

(declare-datatypes ((array!53763 0))(
  ( (array!53764 (arr!25840 (Array (_ BitVec 32) (_ BitVec 64))) (size!26301 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53763)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30135)

(declare-datatypes ((tuple2!12394 0))(
  ( (tuple2!12395 (_1!6208 (_ BitVec 64)) (_2!6208 V!30135)) )
))
(declare-datatypes ((List!18177 0))(
  ( (Nil!18174) (Cons!18173 (h!19319 tuple2!12394) (t!25749 List!18177)) )
))
(declare-datatypes ((ListLongMap!11081 0))(
  ( (ListLongMap!11082 (toList!5556 List!18177)) )
))
(declare-fun contains!4555 (ListLongMap!11081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2758 (array!53763 array!53761 (_ BitVec 32) (_ BitVec 32) V!30135 V!30135 (_ BitVec 32) Int) ListLongMap!11081)

(assert (=> b!909348 (= res!613787 (contains!4555 (getCurrentListMap!2758 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30031 () Bool)

(assert (=> mapIsEmpty!30031 mapRes!30031))

(declare-fun b!909349 () Bool)

(declare-fun res!613785 () Bool)

(assert (=> b!909349 (=> (not res!613785) (not e!509734))))

(declare-datatypes ((List!18178 0))(
  ( (Nil!18175) (Cons!18174 (h!19320 (_ BitVec 64)) (t!25750 List!18178)) )
))
(declare-fun arrayNoDuplicates!0 (array!53763 (_ BitVec 32) List!18178) Bool)

(assert (=> b!909349 (= res!613785 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18175))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun b!909350 () Bool)

(assert (=> b!909350 (= e!509734 (and (= (select (arr!25840 _keys!1386) i!717) k0!1033) (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!26301 _keys!1386))))))

(declare-fun b!909351 () Bool)

(declare-fun res!613786 () Bool)

(assert (=> b!909351 (=> (not res!613786) (not e!509734))))

(assert (=> b!909351 (= res!613786 (and (= (size!26300 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26301 _keys!1386) (size!26300 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!613784 () Bool)

(assert (=> start!77882 (=> (not res!613784) (not e!509734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77882 (= res!613784 (validMask!0 mask!1756))))

(assert (=> start!77882 e!509734))

(declare-fun array_inv!20260 (array!53761) Bool)

(assert (=> start!77882 (and (array_inv!20260 _values!1152) e!509736)))

(assert (=> start!77882 tp!57642))

(assert (=> start!77882 true))

(assert (=> start!77882 tp_is_empty!18877))

(declare-fun array_inv!20261 (array!53763) Bool)

(assert (=> start!77882 (array_inv!20261 _keys!1386)))

(declare-fun b!909346 () Bool)

(declare-fun res!613788 () Bool)

(assert (=> b!909346 (=> (not res!613788) (not e!509734))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909346 (= res!613788 (inRange!0 i!717 mask!1756))))

(declare-fun b!909352 () Bool)

(declare-fun res!613789 () Bool)

(assert (=> b!909352 (=> (not res!613789) (not e!509734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53763 (_ BitVec 32)) Bool)

(assert (=> b!909352 (= res!613789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909353 () Bool)

(assert (=> b!909353 (= e!509738 tp_is_empty!18877)))

(assert (= (and start!77882 res!613784) b!909351))

(assert (= (and b!909351 res!613786) b!909352))

(assert (= (and b!909352 res!613789) b!909349))

(assert (= (and b!909349 res!613785) b!909348))

(assert (= (and b!909348 res!613787) b!909346))

(assert (= (and b!909346 res!613788) b!909350))

(assert (= (and b!909345 condMapEmpty!30031) mapIsEmpty!30031))

(assert (= (and b!909345 (not condMapEmpty!30031)) mapNonEmpty!30031))

(get-info :version)

(assert (= (and mapNonEmpty!30031 ((_ is ValueCellFull!8957) mapValue!30031)) b!909353))

(assert (= (and b!909345 ((_ is ValueCellFull!8957) mapDefault!30031)) b!909347))

(assert (= start!77882 b!909345))

(declare-fun m!844035 () Bool)

(assert (=> b!909349 m!844035))

(declare-fun m!844037 () Bool)

(assert (=> b!909350 m!844037))

(declare-fun m!844039 () Bool)

(assert (=> b!909352 m!844039))

(declare-fun m!844041 () Bool)

(assert (=> b!909348 m!844041))

(assert (=> b!909348 m!844041))

(declare-fun m!844043 () Bool)

(assert (=> b!909348 m!844043))

(declare-fun m!844045 () Bool)

(assert (=> start!77882 m!844045))

(declare-fun m!844047 () Bool)

(assert (=> start!77882 m!844047))

(declare-fun m!844049 () Bool)

(assert (=> start!77882 m!844049))

(declare-fun m!844051 () Bool)

(assert (=> mapNonEmpty!30031 m!844051))

(declare-fun m!844053 () Bool)

(assert (=> b!909346 m!844053))

(check-sat (not b!909349) (not b!909348) (not start!77882) (not mapNonEmpty!30031) (not b!909346) (not b_next!16459) (not b!909352) tp_is_empty!18877 b_and!27001)
(check-sat b_and!27001 (not b_next!16459))
(get-model)

(declare-fun b!909416 () Bool)

(declare-fun e!509775 () Bool)

(declare-fun call!40263 () Bool)

(assert (=> b!909416 (= e!509775 call!40263)))

(declare-fun b!909417 () Bool)

(declare-fun e!509777 () Bool)

(assert (=> b!909417 (= e!509777 call!40263)))

(declare-fun b!909418 () Bool)

(assert (=> b!909418 (= e!509777 e!509775)))

(declare-fun lt!409785 () (_ BitVec 64))

(assert (=> b!909418 (= lt!409785 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30784 0))(
  ( (Unit!30785) )
))
(declare-fun lt!409784 () Unit!30784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53763 (_ BitVec 64) (_ BitVec 32)) Unit!30784)

(assert (=> b!909418 (= lt!409784 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!409785 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909418 (arrayContainsKey!0 _keys!1386 lt!409785 #b00000000000000000000000000000000)))

(declare-fun lt!409783 () Unit!30784)

(assert (=> b!909418 (= lt!409783 lt!409784)))

(declare-fun res!613830 () Bool)

(declare-datatypes ((SeekEntryResult!8964 0))(
  ( (MissingZero!8964 (index!38227 (_ BitVec 32))) (Found!8964 (index!38228 (_ BitVec 32))) (Intermediate!8964 (undefined!9776 Bool) (index!38229 (_ BitVec 32)) (x!77718 (_ BitVec 32))) (Undefined!8964) (MissingVacant!8964 (index!38230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53763 (_ BitVec 32)) SeekEntryResult!8964)

(assert (=> b!909418 (= res!613830 (= (seekEntryOrOpen!0 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8964 #b00000000000000000000000000000000)))))

(assert (=> b!909418 (=> (not res!613830) (not e!509775))))

(declare-fun b!909419 () Bool)

(declare-fun e!509776 () Bool)

(assert (=> b!909419 (= e!509776 e!509777)))

(declare-fun c!95626 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!909419 (= c!95626 (validKeyInArray!0 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40260 () Bool)

(assert (=> bm!40260 (= call!40263 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!111961 () Bool)

(declare-fun res!613831 () Bool)

(assert (=> d!111961 (=> res!613831 e!509776)))

(assert (=> d!111961 (= res!613831 (bvsge #b00000000000000000000000000000000 (size!26301 _keys!1386)))))

(assert (=> d!111961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!509776)))

(assert (= (and d!111961 (not res!613831)) b!909419))

(assert (= (and b!909419 c!95626) b!909418))

(assert (= (and b!909419 (not c!95626)) b!909417))

(assert (= (and b!909418 res!613830) b!909416))

(assert (= (or b!909416 b!909417) bm!40260))

(declare-fun m!844095 () Bool)

(assert (=> b!909418 m!844095))

(declare-fun m!844097 () Bool)

(assert (=> b!909418 m!844097))

(declare-fun m!844099 () Bool)

(assert (=> b!909418 m!844099))

(assert (=> b!909418 m!844095))

(declare-fun m!844101 () Bool)

(assert (=> b!909418 m!844101))

(assert (=> b!909419 m!844095))

(assert (=> b!909419 m!844095))

(declare-fun m!844103 () Bool)

(assert (=> b!909419 m!844103))

(declare-fun m!844105 () Bool)

(assert (=> bm!40260 m!844105))

(assert (=> b!909352 d!111961))

(declare-fun d!111963 () Bool)

(assert (=> d!111963 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77882 d!111963))

(declare-fun d!111965 () Bool)

(assert (=> d!111965 (= (array_inv!20260 _values!1152) (bvsge (size!26300 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77882 d!111965))

(declare-fun d!111967 () Bool)

(assert (=> d!111967 (= (array_inv!20261 _keys!1386) (bvsge (size!26301 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77882 d!111967))

(declare-fun d!111969 () Bool)

(declare-fun e!509783 () Bool)

(assert (=> d!111969 e!509783))

(declare-fun res!613834 () Bool)

(assert (=> d!111969 (=> res!613834 e!509783)))

(declare-fun lt!409796 () Bool)

(assert (=> d!111969 (= res!613834 (not lt!409796))))

(declare-fun lt!409795 () Bool)

(assert (=> d!111969 (= lt!409796 lt!409795)))

(declare-fun lt!409794 () Unit!30784)

(declare-fun e!509782 () Unit!30784)

(assert (=> d!111969 (= lt!409794 e!509782)))

(declare-fun c!95629 () Bool)

(assert (=> d!111969 (= c!95629 lt!409795)))

(declare-fun containsKey!437 (List!18177 (_ BitVec 64)) Bool)

(assert (=> d!111969 (= lt!409795 (containsKey!437 (toList!5556 (getCurrentListMap!2758 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!111969 (= (contains!4555 (getCurrentListMap!2758 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!409796)))

(declare-fun b!909426 () Bool)

(declare-fun lt!409797 () Unit!30784)

(assert (=> b!909426 (= e!509782 lt!409797)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!332 (List!18177 (_ BitVec 64)) Unit!30784)

(assert (=> b!909426 (= lt!409797 (lemmaContainsKeyImpliesGetValueByKeyDefined!332 (toList!5556 (getCurrentListMap!2758 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!479 0))(
  ( (Some!478 (v!11998 V!30135)) (None!477) )
))
(declare-fun isDefined!345 (Option!479) Bool)

(declare-fun getValueByKey!473 (List!18177 (_ BitVec 64)) Option!479)

(assert (=> b!909426 (isDefined!345 (getValueByKey!473 (toList!5556 (getCurrentListMap!2758 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!909427 () Bool)

(declare-fun Unit!30786 () Unit!30784)

(assert (=> b!909427 (= e!509782 Unit!30786)))

(declare-fun b!909428 () Bool)

(assert (=> b!909428 (= e!509783 (isDefined!345 (getValueByKey!473 (toList!5556 (getCurrentListMap!2758 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!111969 c!95629) b!909426))

(assert (= (and d!111969 (not c!95629)) b!909427))

(assert (= (and d!111969 (not res!613834)) b!909428))

(declare-fun m!844107 () Bool)

(assert (=> d!111969 m!844107))

(declare-fun m!844109 () Bool)

(assert (=> b!909426 m!844109))

(declare-fun m!844111 () Bool)

(assert (=> b!909426 m!844111))

(assert (=> b!909426 m!844111))

(declare-fun m!844113 () Bool)

(assert (=> b!909426 m!844113))

(assert (=> b!909428 m!844111))

(assert (=> b!909428 m!844111))

(assert (=> b!909428 m!844113))

(assert (=> b!909348 d!111969))

(declare-fun b!909471 () Bool)

(declare-fun e!509815 () Bool)

(declare-fun e!509819 () Bool)

(assert (=> b!909471 (= e!509815 e!509819)))

(declare-fun c!95644 () Bool)

(assert (=> b!909471 (= c!95644 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40275 () Bool)

(declare-fun c!95647 () Bool)

(declare-fun call!40284 () ListLongMap!11081)

(declare-fun c!95645 () Bool)

(declare-fun call!40280 () ListLongMap!11081)

(declare-fun call!40282 () ListLongMap!11081)

(declare-fun call!40278 () ListLongMap!11081)

(declare-fun +!2629 (ListLongMap!11081 tuple2!12394) ListLongMap!11081)

(assert (=> bm!40275 (= call!40282 (+!2629 (ite c!95647 call!40278 (ite c!95645 call!40280 call!40284)) (ite (or c!95647 c!95645) (tuple2!12395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!909472 () Bool)

(declare-fun e!509820 () ListLongMap!11081)

(assert (=> b!909472 (= e!509820 (+!2629 call!40282 (tuple2!12395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!909473 () Bool)

(declare-fun e!509810 () Bool)

(assert (=> b!909473 (= e!509810 (validKeyInArray!0 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!909474 () Bool)

(declare-fun e!509811 () ListLongMap!11081)

(declare-fun call!40283 () ListLongMap!11081)

(assert (=> b!909474 (= e!509811 call!40283)))

(declare-fun d!111971 () Bool)

(assert (=> d!111971 e!509815))

(declare-fun res!613856 () Bool)

(assert (=> d!111971 (=> (not res!613856) (not e!509815))))

(assert (=> d!111971 (= res!613856 (or (bvsge #b00000000000000000000000000000000 (size!26301 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26301 _keys!1386)))))))

(declare-fun lt!409863 () ListLongMap!11081)

(declare-fun lt!409842 () ListLongMap!11081)

(assert (=> d!111971 (= lt!409863 lt!409842)))

(declare-fun lt!409856 () Unit!30784)

(declare-fun e!509822 () Unit!30784)

(assert (=> d!111971 (= lt!409856 e!509822)))

(declare-fun c!95646 () Bool)

(declare-fun e!509816 () Bool)

(assert (=> d!111971 (= c!95646 e!509816)))

(declare-fun res!613858 () Bool)

(assert (=> d!111971 (=> (not res!613858) (not e!509816))))

(assert (=> d!111971 (= res!613858 (bvslt #b00000000000000000000000000000000 (size!26301 _keys!1386)))))

(assert (=> d!111971 (= lt!409842 e!509820)))

(assert (=> d!111971 (= c!95647 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111971 (validMask!0 mask!1756)))

(assert (=> d!111971 (= (getCurrentListMap!2758 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!409863)))

(declare-fun b!909475 () Bool)

(declare-fun e!509821 () ListLongMap!11081)

(assert (=> b!909475 (= e!509820 e!509821)))

(assert (=> b!909475 (= c!95645 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!909476 () Bool)

(declare-fun lt!409861 () Unit!30784)

(assert (=> b!909476 (= e!509822 lt!409861)))

(declare-fun lt!409862 () ListLongMap!11081)

(declare-fun getCurrentListMapNoExtraKeys!3326 (array!53763 array!53761 (_ BitVec 32) (_ BitVec 32) V!30135 V!30135 (_ BitVec 32) Int) ListLongMap!11081)

(assert (=> b!909476 (= lt!409862 (getCurrentListMapNoExtraKeys!3326 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409857 () (_ BitVec 64))

(assert (=> b!909476 (= lt!409857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409853 () (_ BitVec 64))

(assert (=> b!909476 (= lt!409853 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409854 () Unit!30784)

(declare-fun addStillContains!344 (ListLongMap!11081 (_ BitVec 64) V!30135 (_ BitVec 64)) Unit!30784)

(assert (=> b!909476 (= lt!409854 (addStillContains!344 lt!409862 lt!409857 zeroValue!1094 lt!409853))))

(assert (=> b!909476 (contains!4555 (+!2629 lt!409862 (tuple2!12395 lt!409857 zeroValue!1094)) lt!409853)))

(declare-fun lt!409859 () Unit!30784)

(assert (=> b!909476 (= lt!409859 lt!409854)))

(declare-fun lt!409851 () ListLongMap!11081)

(assert (=> b!909476 (= lt!409851 (getCurrentListMapNoExtraKeys!3326 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409849 () (_ BitVec 64))

(assert (=> b!909476 (= lt!409849 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409847 () (_ BitVec 64))

(assert (=> b!909476 (= lt!409847 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409845 () Unit!30784)

(declare-fun addApplyDifferent!344 (ListLongMap!11081 (_ BitVec 64) V!30135 (_ BitVec 64)) Unit!30784)

(assert (=> b!909476 (= lt!409845 (addApplyDifferent!344 lt!409851 lt!409849 minValue!1094 lt!409847))))

(declare-fun apply!515 (ListLongMap!11081 (_ BitVec 64)) V!30135)

(assert (=> b!909476 (= (apply!515 (+!2629 lt!409851 (tuple2!12395 lt!409849 minValue!1094)) lt!409847) (apply!515 lt!409851 lt!409847))))

(declare-fun lt!409846 () Unit!30784)

(assert (=> b!909476 (= lt!409846 lt!409845)))

(declare-fun lt!409848 () ListLongMap!11081)

(assert (=> b!909476 (= lt!409848 (getCurrentListMapNoExtraKeys!3326 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409843 () (_ BitVec 64))

(assert (=> b!909476 (= lt!409843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409850 () (_ BitVec 64))

(assert (=> b!909476 (= lt!409850 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409858 () Unit!30784)

(assert (=> b!909476 (= lt!409858 (addApplyDifferent!344 lt!409848 lt!409843 zeroValue!1094 lt!409850))))

(assert (=> b!909476 (= (apply!515 (+!2629 lt!409848 (tuple2!12395 lt!409843 zeroValue!1094)) lt!409850) (apply!515 lt!409848 lt!409850))))

(declare-fun lt!409844 () Unit!30784)

(assert (=> b!909476 (= lt!409844 lt!409858)))

(declare-fun lt!409860 () ListLongMap!11081)

(assert (=> b!909476 (= lt!409860 (getCurrentListMapNoExtraKeys!3326 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409852 () (_ BitVec 64))

(assert (=> b!909476 (= lt!409852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409855 () (_ BitVec 64))

(assert (=> b!909476 (= lt!409855 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!909476 (= lt!409861 (addApplyDifferent!344 lt!409860 lt!409852 minValue!1094 lt!409855))))

(assert (=> b!909476 (= (apply!515 (+!2629 lt!409860 (tuple2!12395 lt!409852 minValue!1094)) lt!409855) (apply!515 lt!409860 lt!409855))))

(declare-fun b!909477 () Bool)

(declare-fun e!509817 () Bool)

(assert (=> b!909477 (= e!509819 e!509817)))

(declare-fun res!613859 () Bool)

(declare-fun call!40281 () Bool)

(assert (=> b!909477 (= res!613859 call!40281)))

(assert (=> b!909477 (=> (not res!613859) (not e!509817))))

(declare-fun bm!40276 () Bool)

(declare-fun call!40279 () Bool)

(assert (=> bm!40276 (= call!40279 (contains!4555 lt!409863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40277 () Bool)

(assert (=> bm!40277 (= call!40278 (getCurrentListMapNoExtraKeys!3326 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!909478 () Bool)

(assert (=> b!909478 (= e!509821 call!40283)))

(declare-fun e!509812 () Bool)

(declare-fun b!909479 () Bool)

(declare-fun get!13602 (ValueCell!8957 V!30135) V!30135)

(declare-fun dynLambda!1380 (Int (_ BitVec 64)) V!30135)

(assert (=> b!909479 (= e!509812 (= (apply!515 lt!409863 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000)) (get!13602 (select (arr!25839 _values!1152) #b00000000000000000000000000000000) (dynLambda!1380 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!909479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26300 _values!1152)))))

(assert (=> b!909479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26301 _keys!1386)))))

(declare-fun b!909480 () Bool)

(assert (=> b!909480 (= e!509811 call!40284)))

(declare-fun b!909481 () Bool)

(assert (=> b!909481 (= e!509816 (validKeyInArray!0 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!909482 () Bool)

(assert (=> b!909482 (= e!509817 (= (apply!515 lt!409863 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!909483 () Bool)

(declare-fun res!613854 () Bool)

(assert (=> b!909483 (=> (not res!613854) (not e!509815))))

(declare-fun e!509814 () Bool)

(assert (=> b!909483 (= res!613854 e!509814)))

(declare-fun res!613853 () Bool)

(assert (=> b!909483 (=> res!613853 e!509814)))

(assert (=> b!909483 (= res!613853 (not e!509810))))

(declare-fun res!613860 () Bool)

(assert (=> b!909483 (=> (not res!613860) (not e!509810))))

(assert (=> b!909483 (= res!613860 (bvslt #b00000000000000000000000000000000 (size!26301 _keys!1386)))))

(declare-fun bm!40278 () Bool)

(assert (=> bm!40278 (= call!40281 (contains!4555 lt!409863 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!909484 () Bool)

(assert (=> b!909484 (= e!509819 (not call!40281))))

(declare-fun b!909485 () Bool)

(declare-fun Unit!30787 () Unit!30784)

(assert (=> b!909485 (= e!509822 Unit!30787)))

(declare-fun b!909486 () Bool)

(declare-fun e!509818 () Bool)

(assert (=> b!909486 (= e!509818 (= (apply!515 lt!409863 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!909487 () Bool)

(declare-fun res!613855 () Bool)

(assert (=> b!909487 (=> (not res!613855) (not e!509815))))

(declare-fun e!509813 () Bool)

(assert (=> b!909487 (= res!613855 e!509813)))

(declare-fun c!95643 () Bool)

(assert (=> b!909487 (= c!95643 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40279 () Bool)

(assert (=> bm!40279 (= call!40280 call!40278)))

(declare-fun b!909488 () Bool)

(assert (=> b!909488 (= e!509813 e!509818)))

(declare-fun res!613861 () Bool)

(assert (=> b!909488 (= res!613861 call!40279)))

(assert (=> b!909488 (=> (not res!613861) (not e!509818))))

(declare-fun b!909489 () Bool)

(declare-fun c!95642 () Bool)

(assert (=> b!909489 (= c!95642 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!909489 (= e!509821 e!509811)))

(declare-fun b!909490 () Bool)

(assert (=> b!909490 (= e!509813 (not call!40279))))

(declare-fun bm!40280 () Bool)

(assert (=> bm!40280 (= call!40283 call!40282)))

(declare-fun b!909491 () Bool)

(assert (=> b!909491 (= e!509814 e!509812)))

(declare-fun res!613857 () Bool)

(assert (=> b!909491 (=> (not res!613857) (not e!509812))))

(assert (=> b!909491 (= res!613857 (contains!4555 lt!409863 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!909491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26301 _keys!1386)))))

(declare-fun bm!40281 () Bool)

(assert (=> bm!40281 (= call!40284 call!40280)))

(assert (= (and d!111971 c!95647) b!909472))

(assert (= (and d!111971 (not c!95647)) b!909475))

(assert (= (and b!909475 c!95645) b!909478))

(assert (= (and b!909475 (not c!95645)) b!909489))

(assert (= (and b!909489 c!95642) b!909474))

(assert (= (and b!909489 (not c!95642)) b!909480))

(assert (= (or b!909474 b!909480) bm!40281))

(assert (= (or b!909478 bm!40281) bm!40279))

(assert (= (or b!909478 b!909474) bm!40280))

(assert (= (or b!909472 bm!40279) bm!40277))

(assert (= (or b!909472 bm!40280) bm!40275))

(assert (= (and d!111971 res!613858) b!909481))

(assert (= (and d!111971 c!95646) b!909476))

(assert (= (and d!111971 (not c!95646)) b!909485))

(assert (= (and d!111971 res!613856) b!909483))

(assert (= (and b!909483 res!613860) b!909473))

(assert (= (and b!909483 (not res!613853)) b!909491))

(assert (= (and b!909491 res!613857) b!909479))

(assert (= (and b!909483 res!613854) b!909487))

(assert (= (and b!909487 c!95643) b!909488))

(assert (= (and b!909487 (not c!95643)) b!909490))

(assert (= (and b!909488 res!613861) b!909486))

(assert (= (or b!909488 b!909490) bm!40276))

(assert (= (and b!909487 res!613855) b!909471))

(assert (= (and b!909471 c!95644) b!909477))

(assert (= (and b!909471 (not c!95644)) b!909484))

(assert (= (and b!909477 res!613859) b!909482))

(assert (= (or b!909477 b!909484) bm!40278))

(declare-fun b_lambda!13277 () Bool)

(assert (=> (not b_lambda!13277) (not b!909479)))

(declare-fun t!25752 () Bool)

(declare-fun tb!5425 () Bool)

(assert (=> (and start!77882 (= defaultEntry!1160 defaultEntry!1160) t!25752) tb!5425))

(declare-fun result!10655 () Bool)

(assert (=> tb!5425 (= result!10655 tp_is_empty!18877)))

(assert (=> b!909479 t!25752))

(declare-fun b_and!27007 () Bool)

(assert (= b_and!27001 (and (=> t!25752 result!10655) b_and!27007)))

(assert (=> b!909479 m!844095))

(declare-fun m!844115 () Bool)

(assert (=> b!909479 m!844115))

(declare-fun m!844117 () Bool)

(assert (=> b!909479 m!844117))

(declare-fun m!844119 () Bool)

(assert (=> b!909479 m!844119))

(assert (=> b!909479 m!844117))

(assert (=> b!909479 m!844095))

(declare-fun m!844121 () Bool)

(assert (=> b!909479 m!844121))

(assert (=> b!909479 m!844115))

(declare-fun m!844123 () Bool)

(assert (=> b!909472 m!844123))

(declare-fun m!844125 () Bool)

(assert (=> bm!40276 m!844125))

(assert (=> b!909473 m!844095))

(assert (=> b!909473 m!844095))

(assert (=> b!909473 m!844103))

(declare-fun m!844127 () Bool)

(assert (=> bm!40275 m!844127))

(declare-fun m!844129 () Bool)

(assert (=> b!909476 m!844129))

(assert (=> b!909476 m!844095))

(declare-fun m!844131 () Bool)

(assert (=> b!909476 m!844131))

(declare-fun m!844133 () Bool)

(assert (=> b!909476 m!844133))

(declare-fun m!844135 () Bool)

(assert (=> b!909476 m!844135))

(declare-fun m!844137 () Bool)

(assert (=> b!909476 m!844137))

(declare-fun m!844139 () Bool)

(assert (=> b!909476 m!844139))

(declare-fun m!844141 () Bool)

(assert (=> b!909476 m!844141))

(assert (=> b!909476 m!844129))

(declare-fun m!844143 () Bool)

(assert (=> b!909476 m!844143))

(declare-fun m!844145 () Bool)

(assert (=> b!909476 m!844145))

(declare-fun m!844147 () Bool)

(assert (=> b!909476 m!844147))

(declare-fun m!844149 () Bool)

(assert (=> b!909476 m!844149))

(assert (=> b!909476 m!844135))

(declare-fun m!844151 () Bool)

(assert (=> b!909476 m!844151))

(declare-fun m!844153 () Bool)

(assert (=> b!909476 m!844153))

(assert (=> b!909476 m!844145))

(declare-fun m!844155 () Bool)

(assert (=> b!909476 m!844155))

(declare-fun m!844157 () Bool)

(assert (=> b!909476 m!844157))

(assert (=> b!909476 m!844147))

(declare-fun m!844159 () Bool)

(assert (=> b!909476 m!844159))

(assert (=> b!909481 m!844095))

(assert (=> b!909481 m!844095))

(assert (=> b!909481 m!844103))

(assert (=> b!909491 m!844095))

(assert (=> b!909491 m!844095))

(declare-fun m!844161 () Bool)

(assert (=> b!909491 m!844161))

(declare-fun m!844163 () Bool)

(assert (=> b!909482 m!844163))

(assert (=> bm!40277 m!844159))

(assert (=> d!111971 m!844045))

(declare-fun m!844165 () Bool)

(assert (=> bm!40278 m!844165))

(declare-fun m!844167 () Bool)

(assert (=> b!909486 m!844167))

(assert (=> b!909348 d!111971))

(declare-fun b!909504 () Bool)

(declare-fun e!509834 () Bool)

(declare-fun contains!4556 (List!18178 (_ BitVec 64)) Bool)

(assert (=> b!909504 (= e!509834 (contains!4556 Nil!18175 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!111973 () Bool)

(declare-fun res!613870 () Bool)

(declare-fun e!509833 () Bool)

(assert (=> d!111973 (=> res!613870 e!509833)))

(assert (=> d!111973 (= res!613870 (bvsge #b00000000000000000000000000000000 (size!26301 _keys!1386)))))

(assert (=> d!111973 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18175) e!509833)))

(declare-fun b!909505 () Bool)

(declare-fun e!509831 () Bool)

(declare-fun call!40287 () Bool)

(assert (=> b!909505 (= e!509831 call!40287)))

(declare-fun b!909506 () Bool)

(declare-fun e!509832 () Bool)

(assert (=> b!909506 (= e!509833 e!509832)))

(declare-fun res!613869 () Bool)

(assert (=> b!909506 (=> (not res!613869) (not e!509832))))

(assert (=> b!909506 (= res!613869 (not e!509834))))

(declare-fun res!613868 () Bool)

(assert (=> b!909506 (=> (not res!613868) (not e!509834))))

(assert (=> b!909506 (= res!613868 (validKeyInArray!0 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!909507 () Bool)

(assert (=> b!909507 (= e!509832 e!509831)))

(declare-fun c!95650 () Bool)

(assert (=> b!909507 (= c!95650 (validKeyInArray!0 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40284 () Bool)

(assert (=> bm!40284 (= call!40287 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95650 (Cons!18174 (select (arr!25840 _keys!1386) #b00000000000000000000000000000000) Nil!18175) Nil!18175)))))

(declare-fun b!909508 () Bool)

(assert (=> b!909508 (= e!509831 call!40287)))

(assert (= (and d!111973 (not res!613870)) b!909506))

(assert (= (and b!909506 res!613868) b!909504))

(assert (= (and b!909506 res!613869) b!909507))

(assert (= (and b!909507 c!95650) b!909508))

(assert (= (and b!909507 (not c!95650)) b!909505))

(assert (= (or b!909508 b!909505) bm!40284))

(assert (=> b!909504 m!844095))

(assert (=> b!909504 m!844095))

(declare-fun m!844169 () Bool)

(assert (=> b!909504 m!844169))

(assert (=> b!909506 m!844095))

(assert (=> b!909506 m!844095))

(assert (=> b!909506 m!844103))

(assert (=> b!909507 m!844095))

(assert (=> b!909507 m!844095))

(assert (=> b!909507 m!844103))

(assert (=> bm!40284 m!844095))

(declare-fun m!844171 () Bool)

(assert (=> bm!40284 m!844171))

(assert (=> b!909349 d!111973))

(declare-fun d!111975 () Bool)

(assert (=> d!111975 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!909346 d!111975))

(declare-fun condMapEmpty!30040 () Bool)

(declare-fun mapDefault!30040 () ValueCell!8957)

(assert (=> mapNonEmpty!30031 (= condMapEmpty!30040 (= mapRest!30031 ((as const (Array (_ BitVec 32) ValueCell!8957)) mapDefault!30040)))))

(declare-fun e!509840 () Bool)

(declare-fun mapRes!30040 () Bool)

(assert (=> mapNonEmpty!30031 (= tp!57643 (and e!509840 mapRes!30040))))

(declare-fun b!909516 () Bool)

(assert (=> b!909516 (= e!509840 tp_is_empty!18877)))

(declare-fun mapIsEmpty!30040 () Bool)

(assert (=> mapIsEmpty!30040 mapRes!30040))

(declare-fun b!909515 () Bool)

(declare-fun e!509839 () Bool)

(assert (=> b!909515 (= e!509839 tp_is_empty!18877)))

(declare-fun mapNonEmpty!30040 () Bool)

(declare-fun tp!57658 () Bool)

(assert (=> mapNonEmpty!30040 (= mapRes!30040 (and tp!57658 e!509839))))

(declare-fun mapValue!30040 () ValueCell!8957)

(declare-fun mapKey!30040 () (_ BitVec 32))

(declare-fun mapRest!30040 () (Array (_ BitVec 32) ValueCell!8957))

(assert (=> mapNonEmpty!30040 (= mapRest!30031 (store mapRest!30040 mapKey!30040 mapValue!30040))))

(assert (= (and mapNonEmpty!30031 condMapEmpty!30040) mapIsEmpty!30040))

(assert (= (and mapNonEmpty!30031 (not condMapEmpty!30040)) mapNonEmpty!30040))

(assert (= (and mapNonEmpty!30040 ((_ is ValueCellFull!8957) mapValue!30040)) b!909515))

(assert (= (and mapNonEmpty!30031 ((_ is ValueCellFull!8957) mapDefault!30040)) b!909516))

(declare-fun m!844173 () Bool)

(assert (=> mapNonEmpty!30040 m!844173))

(declare-fun b_lambda!13279 () Bool)

(assert (= b_lambda!13277 (or (and start!77882 b_free!16459) b_lambda!13279)))

(check-sat (not b!909476) (not bm!40278) (not b!909419) (not bm!40276) (not b!909481) (not b!909506) b_and!27007 (not b!909428) (not mapNonEmpty!30040) (not bm!40260) (not b!909418) (not b!909479) tp_is_empty!18877 (not bm!40284) (not bm!40277) (not b!909472) (not b!909426) (not b!909482) (not d!111969) (not b_lambda!13279) (not b!909491) (not b!909486) (not b_next!16459) (not b!909507) (not b!909473) (not b!909504) (not bm!40275) (not d!111971))
(check-sat b_and!27007 (not b_next!16459))
