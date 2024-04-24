; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4214 () Bool)

(assert start!4214)

(declare-fun b_free!1123 () Bool)

(declare-fun b_next!1123 () Bool)

(assert (=> start!4214 (= b_free!1123 (not b_next!1123))))

(declare-fun tp!4788 () Bool)

(declare-fun b_and!1923 () Bool)

(assert (=> start!4214 (= tp!4788 b_and!1923)))

(declare-fun b!32145 () Bool)

(declare-fun res!19547 () Bool)

(declare-fun e!20437 () Bool)

(assert (=> b!32145 (=> (not res!19547) (not e!20437))))

(declare-datatypes ((array!2151 0))(
  ( (array!2152 (arr!1029 (Array (_ BitVec 32) (_ BitVec 64))) (size!1130 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2151)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32145 (= res!19547 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32146 () Bool)

(declare-fun e!20433 () Bool)

(declare-fun tp_is_empty!1477 () Bool)

(assert (=> b!32146 (= e!20433 tp_is_empty!1477)))

(declare-fun b!32147 () Bool)

(declare-fun res!19542 () Bool)

(assert (=> b!32147 (=> (not res!19542) (not e!20437))))

(declare-datatypes ((V!1795 0))(
  ( (V!1796 (val!765 Int)) )
))
(declare-datatypes ((ValueCell!539 0))(
  ( (ValueCellFull!539 (v!1854 V!1795)) (EmptyCell!539) )
))
(declare-datatypes ((array!2153 0))(
  ( (array!2154 (arr!1030 (Array (_ BitVec 32) ValueCell!539)) (size!1131 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2153)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1795)

(declare-fun minValue!1443 () V!1795)

(declare-datatypes ((tuple2!1234 0))(
  ( (tuple2!1235 (_1!628 (_ BitVec 64)) (_2!628 V!1795)) )
))
(declare-datatypes ((List!829 0))(
  ( (Nil!826) (Cons!825 (h!1392 tuple2!1234) (t!3516 List!829)) )
))
(declare-datatypes ((ListLongMap!805 0))(
  ( (ListLongMap!806 (toList!418 List!829)) )
))
(declare-fun contains!360 (ListLongMap!805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!243 (array!2151 array!2153 (_ BitVec 32) (_ BitVec 32) V!1795 V!1795 (_ BitVec 32) Int) ListLongMap!805)

(assert (=> b!32147 (= res!19542 (not (contains!360 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapNonEmpty!1744 () Bool)

(declare-fun mapRes!1744 () Bool)

(declare-fun tp!4789 () Bool)

(declare-fun e!20434 () Bool)

(assert (=> mapNonEmpty!1744 (= mapRes!1744 (and tp!4789 e!20434))))

(declare-fun mapValue!1744 () ValueCell!539)

(declare-fun mapKey!1744 () (_ BitVec 32))

(declare-fun mapRest!1744 () (Array (_ BitVec 32) ValueCell!539))

(assert (=> mapNonEmpty!1744 (= (arr!1030 _values!1501) (store mapRest!1744 mapKey!1744 mapValue!1744))))

(declare-fun mapIsEmpty!1744 () Bool)

(assert (=> mapIsEmpty!1744 mapRes!1744))

(declare-fun b!32148 () Bool)

(assert (=> b!32148 (= e!20434 tp_is_empty!1477)))

(declare-fun b!32149 () Bool)

(declare-fun res!19541 () Bool)

(assert (=> b!32149 (=> (not res!19541) (not e!20437))))

(declare-datatypes ((List!830 0))(
  ( (Nil!827) (Cons!826 (h!1393 (_ BitVec 64)) (t!3517 List!830)) )
))
(declare-fun arrayNoDuplicates!0 (array!2151 (_ BitVec 32) List!830) Bool)

(assert (=> b!32149 (= res!19541 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!827))))

(declare-fun b!32150 () Bool)

(declare-fun res!19546 () Bool)

(assert (=> b!32150 (=> (not res!19546) (not e!20437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2151 (_ BitVec 32)) Bool)

(assert (=> b!32150 (= res!19546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32151 () Bool)

(declare-fun res!19543 () Bool)

(assert (=> b!32151 (=> (not res!19543) (not e!20437))))

(assert (=> b!32151 (= res!19543 (and (= (size!1131 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1130 _keys!1833) (size!1131 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32152 () Bool)

(declare-fun e!20436 () Bool)

(assert (=> b!32152 (= e!20436 (and e!20433 mapRes!1744))))

(declare-fun condMapEmpty!1744 () Bool)

(declare-fun mapDefault!1744 () ValueCell!539)

(assert (=> b!32152 (= condMapEmpty!1744 (= (arr!1030 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!539)) mapDefault!1744)))))

(declare-fun b!32154 () Bool)

(declare-fun res!19545 () Bool)

(assert (=> b!32154 (=> (not res!19545) (not e!20437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32154 (= res!19545 (validKeyInArray!0 k0!1304))))

(declare-fun res!19544 () Bool)

(assert (=> start!4214 (=> (not res!19544) (not e!20437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4214 (= res!19544 (validMask!0 mask!2294))))

(assert (=> start!4214 e!20437))

(assert (=> start!4214 true))

(assert (=> start!4214 tp!4788))

(declare-fun array_inv!707 (array!2153) Bool)

(assert (=> start!4214 (and (array_inv!707 _values!1501) e!20436)))

(declare-fun array_inv!708 (array!2151) Bool)

(assert (=> start!4214 (array_inv!708 _keys!1833)))

(assert (=> start!4214 tp_is_empty!1477))

(declare-fun b!32153 () Bool)

(declare-fun lt!11601 () (_ BitVec 32))

(assert (=> b!32153 (= e!20437 (or (bvslt lt!11601 #b00000000000000000000000000000000) (bvsge lt!11601 (size!1130 _keys!1833))))))

(declare-fun arrayScanForKey!0 (array!2151 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32153 (= lt!11601 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!4214 res!19544) b!32151))

(assert (= (and b!32151 res!19543) b!32150))

(assert (= (and b!32150 res!19546) b!32149))

(assert (= (and b!32149 res!19541) b!32154))

(assert (= (and b!32154 res!19545) b!32147))

(assert (= (and b!32147 res!19542) b!32145))

(assert (= (and b!32145 res!19547) b!32153))

(assert (= (and b!32152 condMapEmpty!1744) mapIsEmpty!1744))

(assert (= (and b!32152 (not condMapEmpty!1744)) mapNonEmpty!1744))

(get-info :version)

(assert (= (and mapNonEmpty!1744 ((_ is ValueCellFull!539) mapValue!1744)) b!32148))

(assert (= (and b!32152 ((_ is ValueCellFull!539) mapDefault!1744)) b!32146))

(assert (= start!4214 b!32152))

(declare-fun m!25637 () Bool)

(assert (=> b!32149 m!25637))

(declare-fun m!25639 () Bool)

(assert (=> b!32145 m!25639))

(declare-fun m!25641 () Bool)

(assert (=> b!32154 m!25641))

(declare-fun m!25643 () Bool)

(assert (=> start!4214 m!25643))

(declare-fun m!25645 () Bool)

(assert (=> start!4214 m!25645))

(declare-fun m!25647 () Bool)

(assert (=> start!4214 m!25647))

(declare-fun m!25649 () Bool)

(assert (=> b!32153 m!25649))

(declare-fun m!25651 () Bool)

(assert (=> mapNonEmpty!1744 m!25651))

(declare-fun m!25653 () Bool)

(assert (=> b!32150 m!25653))

(declare-fun m!25655 () Bool)

(assert (=> b!32147 m!25655))

(assert (=> b!32147 m!25655))

(declare-fun m!25657 () Bool)

(assert (=> b!32147 m!25657))

(check-sat (not b!32153) (not b!32149) tp_is_empty!1477 (not start!4214) (not b!32150) (not b!32154) (not mapNonEmpty!1744) (not b!32147) (not b_next!1123) (not b!32145) b_and!1923)
(check-sat b_and!1923 (not b_next!1123))
(get-model)

(declare-fun d!5039 () Bool)

(declare-fun e!20473 () Bool)

(assert (=> d!5039 e!20473))

(declare-fun res!19592 () Bool)

(assert (=> d!5039 (=> res!19592 e!20473)))

(declare-fun lt!11616 () Bool)

(assert (=> d!5039 (= res!19592 (not lt!11616))))

(declare-fun lt!11618 () Bool)

(assert (=> d!5039 (= lt!11616 lt!11618)))

(declare-datatypes ((Unit!717 0))(
  ( (Unit!718) )
))
(declare-fun lt!11617 () Unit!717)

(declare-fun e!20472 () Unit!717)

(assert (=> d!5039 (= lt!11617 e!20472)))

(declare-fun c!3724 () Bool)

(assert (=> d!5039 (= c!3724 lt!11618)))

(declare-fun containsKey!29 (List!829 (_ BitVec 64)) Bool)

(assert (=> d!5039 (= lt!11618 (containsKey!29 (toList!418 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5039 (= (contains!360 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!11616)))

(declare-fun b!32221 () Bool)

(declare-fun lt!11619 () Unit!717)

(assert (=> b!32221 (= e!20472 lt!11619)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!26 (List!829 (_ BitVec 64)) Unit!717)

(assert (=> b!32221 (= lt!11619 (lemmaContainsKeyImpliesGetValueByKeyDefined!26 (toList!418 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!71 0))(
  ( (Some!70 (v!1857 V!1795)) (None!69) )
))
(declare-fun isDefined!27 (Option!71) Bool)

(declare-fun getValueByKey!65 (List!829 (_ BitVec 64)) Option!71)

(assert (=> b!32221 (isDefined!27 (getValueByKey!65 (toList!418 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!32222 () Bool)

(declare-fun Unit!719 () Unit!717)

(assert (=> b!32222 (= e!20472 Unit!719)))

(declare-fun b!32223 () Bool)

(assert (=> b!32223 (= e!20473 (isDefined!27 (getValueByKey!65 (toList!418 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5039 c!3724) b!32221))

(assert (= (and d!5039 (not c!3724)) b!32222))

(assert (= (and d!5039 (not res!19592)) b!32223))

(declare-fun m!25703 () Bool)

(assert (=> d!5039 m!25703))

(declare-fun m!25705 () Bool)

(assert (=> b!32221 m!25705))

(declare-fun m!25707 () Bool)

(assert (=> b!32221 m!25707))

(assert (=> b!32221 m!25707))

(declare-fun m!25709 () Bool)

(assert (=> b!32221 m!25709))

(assert (=> b!32223 m!25707))

(assert (=> b!32223 m!25707))

(assert (=> b!32223 m!25709))

(assert (=> b!32147 d!5039))

(declare-fun c!3739 () Bool)

(declare-fun call!2595 () ListLongMap!805)

(declare-fun bm!2586 () Bool)

(declare-fun c!3740 () Bool)

(declare-fun call!2591 () ListLongMap!805)

(declare-fun call!2592 () ListLongMap!805)

(declare-fun call!2590 () ListLongMap!805)

(declare-fun +!50 (ListLongMap!805 tuple2!1234) ListLongMap!805)

(assert (=> bm!2586 (= call!2591 (+!50 (ite c!3740 call!2592 (ite c!3739 call!2595 call!2590)) (ite (or c!3740 c!3739) (tuple2!1235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun bm!2587 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!20 (array!2151 array!2153 (_ BitVec 32) (_ BitVec 32) V!1795 V!1795 (_ BitVec 32) Int) ListLongMap!805)

(assert (=> bm!2587 (= call!2592 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32266 () Bool)

(declare-fun res!19614 () Bool)

(declare-fun e!20502 () Bool)

(assert (=> b!32266 (=> (not res!19614) (not e!20502))))

(declare-fun e!20508 () Bool)

(assert (=> b!32266 (= res!19614 e!20508)))

(declare-fun c!3741 () Bool)

(assert (=> b!32266 (= c!3741 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!32267 () Bool)

(declare-fun e!20500 () Bool)

(declare-fun e!20504 () Bool)

(assert (=> b!32267 (= e!20500 e!20504)))

(declare-fun res!19617 () Bool)

(declare-fun call!2594 () Bool)

(assert (=> b!32267 (= res!19617 call!2594)))

(assert (=> b!32267 (=> (not res!19617) (not e!20504))))

(declare-fun b!32268 () Bool)

(declare-fun e!20503 () Unit!717)

(declare-fun Unit!720 () Unit!717)

(assert (=> b!32268 (= e!20503 Unit!720)))

(declare-fun b!32269 () Bool)

(declare-fun e!20511 () Bool)

(assert (=> b!32269 (= e!20511 (validKeyInArray!0 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32270 () Bool)

(declare-fun e!20506 () ListLongMap!805)

(assert (=> b!32270 (= e!20506 (+!50 call!2591 (tuple2!1235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!32271 () Bool)

(declare-fun res!19615 () Bool)

(assert (=> b!32271 (=> (not res!19615) (not e!20502))))

(declare-fun e!20512 () Bool)

(assert (=> b!32271 (= res!19615 e!20512)))

(declare-fun res!19618 () Bool)

(assert (=> b!32271 (=> res!19618 e!20512)))

(assert (=> b!32271 (= res!19618 (not e!20511))))

(declare-fun res!19611 () Bool)

(assert (=> b!32271 (=> (not res!19611) (not e!20511))))

(assert (=> b!32271 (= res!19611 (bvslt #b00000000000000000000000000000000 (size!1130 _keys!1833)))))

(declare-fun b!32272 () Bool)

(declare-fun lt!11669 () Unit!717)

(assert (=> b!32272 (= e!20503 lt!11669)))

(declare-fun lt!11666 () ListLongMap!805)

(assert (=> b!32272 (= lt!11666 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11683 () (_ BitVec 64))

(assert (=> b!32272 (= lt!11683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11668 () (_ BitVec 64))

(assert (=> b!32272 (= lt!11668 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11685 () Unit!717)

(declare-fun addStillContains!18 (ListLongMap!805 (_ BitVec 64) V!1795 (_ BitVec 64)) Unit!717)

(assert (=> b!32272 (= lt!11685 (addStillContains!18 lt!11666 lt!11683 zeroValue!1443 lt!11668))))

(assert (=> b!32272 (contains!360 (+!50 lt!11666 (tuple2!1235 lt!11683 zeroValue!1443)) lt!11668)))

(declare-fun lt!11675 () Unit!717)

(assert (=> b!32272 (= lt!11675 lt!11685)))

(declare-fun lt!11671 () ListLongMap!805)

(assert (=> b!32272 (= lt!11671 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11679 () (_ BitVec 64))

(assert (=> b!32272 (= lt!11679 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11677 () (_ BitVec 64))

(assert (=> b!32272 (= lt!11677 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11664 () Unit!717)

(declare-fun addApplyDifferent!18 (ListLongMap!805 (_ BitVec 64) V!1795 (_ BitVec 64)) Unit!717)

(assert (=> b!32272 (= lt!11664 (addApplyDifferent!18 lt!11671 lt!11679 minValue!1443 lt!11677))))

(declare-fun apply!33 (ListLongMap!805 (_ BitVec 64)) V!1795)

(assert (=> b!32272 (= (apply!33 (+!50 lt!11671 (tuple2!1235 lt!11679 minValue!1443)) lt!11677) (apply!33 lt!11671 lt!11677))))

(declare-fun lt!11684 () Unit!717)

(assert (=> b!32272 (= lt!11684 lt!11664)))

(declare-fun lt!11680 () ListLongMap!805)

(assert (=> b!32272 (= lt!11680 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11667 () (_ BitVec 64))

(assert (=> b!32272 (= lt!11667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11682 () (_ BitVec 64))

(assert (=> b!32272 (= lt!11682 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11681 () Unit!717)

(assert (=> b!32272 (= lt!11681 (addApplyDifferent!18 lt!11680 lt!11667 zeroValue!1443 lt!11682))))

(assert (=> b!32272 (= (apply!33 (+!50 lt!11680 (tuple2!1235 lt!11667 zeroValue!1443)) lt!11682) (apply!33 lt!11680 lt!11682))))

(declare-fun lt!11674 () Unit!717)

(assert (=> b!32272 (= lt!11674 lt!11681)))

(declare-fun lt!11673 () ListLongMap!805)

(assert (=> b!32272 (= lt!11673 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11676 () (_ BitVec 64))

(assert (=> b!32272 (= lt!11676 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11665 () (_ BitVec 64))

(assert (=> b!32272 (= lt!11665 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!32272 (= lt!11669 (addApplyDifferent!18 lt!11673 lt!11676 minValue!1443 lt!11665))))

(assert (=> b!32272 (= (apply!33 (+!50 lt!11673 (tuple2!1235 lt!11676 minValue!1443)) lt!11665) (apply!33 lt!11673 lt!11665))))

(declare-fun bm!2588 () Bool)

(declare-fun lt!11672 () ListLongMap!805)

(assert (=> bm!2588 (= call!2594 (contains!360 lt!11672 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2589 () Bool)

(assert (=> bm!2589 (= call!2595 call!2592)))

(declare-fun bm!2590 () Bool)

(assert (=> bm!2590 (= call!2590 call!2595)))

(declare-fun b!32273 () Bool)

(declare-fun e!20509 () ListLongMap!805)

(declare-fun call!2589 () ListLongMap!805)

(assert (=> b!32273 (= e!20509 call!2589)))

(declare-fun b!32274 () Bool)

(declare-fun e!20501 () ListLongMap!805)

(assert (=> b!32274 (= e!20501 call!2589)))

(declare-fun b!32275 () Bool)

(assert (=> b!32275 (= e!20502 e!20500)))

(declare-fun c!3738 () Bool)

(assert (=> b!32275 (= c!3738 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!32276 () Bool)

(declare-fun c!3737 () Bool)

(assert (=> b!32276 (= c!3737 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!32276 (= e!20509 e!20501)))

(declare-fun d!5041 () Bool)

(assert (=> d!5041 e!20502))

(declare-fun res!19619 () Bool)

(assert (=> d!5041 (=> (not res!19619) (not e!20502))))

(assert (=> d!5041 (= res!19619 (or (bvsge #b00000000000000000000000000000000 (size!1130 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1130 _keys!1833)))))))

(declare-fun lt!11678 () ListLongMap!805)

(assert (=> d!5041 (= lt!11672 lt!11678)))

(declare-fun lt!11670 () Unit!717)

(assert (=> d!5041 (= lt!11670 e!20503)))

(declare-fun c!3742 () Bool)

(declare-fun e!20510 () Bool)

(assert (=> d!5041 (= c!3742 e!20510)))

(declare-fun res!19616 () Bool)

(assert (=> d!5041 (=> (not res!19616) (not e!20510))))

(assert (=> d!5041 (= res!19616 (bvslt #b00000000000000000000000000000000 (size!1130 _keys!1833)))))

(assert (=> d!5041 (= lt!11678 e!20506)))

(assert (=> d!5041 (= c!3740 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5041 (validMask!0 mask!2294)))

(assert (=> d!5041 (= (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!11672)))

(declare-fun b!32277 () Bool)

(declare-fun e!20505 () Bool)

(assert (=> b!32277 (= e!20512 e!20505)))

(declare-fun res!19612 () Bool)

(assert (=> b!32277 (=> (not res!19612) (not e!20505))))

(assert (=> b!32277 (= res!19612 (contains!360 lt!11672 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!32277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1130 _keys!1833)))))

(declare-fun b!32278 () Bool)

(assert (=> b!32278 (= e!20510 (validKeyInArray!0 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32279 () Bool)

(assert (=> b!32279 (= e!20506 e!20509)))

(assert (=> b!32279 (= c!3739 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!32280 () Bool)

(assert (=> b!32280 (= e!20504 (= (apply!33 lt!11672 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!32281 () Bool)

(declare-fun e!20507 () Bool)

(assert (=> b!32281 (= e!20507 (= (apply!33 lt!11672 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!32282 () Bool)

(assert (=> b!32282 (= e!20500 (not call!2594))))

(declare-fun bm!2591 () Bool)

(assert (=> bm!2591 (= call!2589 call!2591)))

(declare-fun bm!2592 () Bool)

(declare-fun call!2593 () Bool)

(assert (=> bm!2592 (= call!2593 (contains!360 lt!11672 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32283 () Bool)

(assert (=> b!32283 (= e!20508 (not call!2593))))

(declare-fun b!32284 () Bool)

(declare-fun get!550 (ValueCell!539 V!1795) V!1795)

(declare-fun dynLambda!146 (Int (_ BitVec 64)) V!1795)

(assert (=> b!32284 (= e!20505 (= (apply!33 lt!11672 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000)) (get!550 (select (arr!1030 _values!1501) #b00000000000000000000000000000000) (dynLambda!146 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1131 _values!1501)))))

(assert (=> b!32284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1130 _keys!1833)))))

(declare-fun b!32285 () Bool)

(assert (=> b!32285 (= e!20501 call!2590)))

(declare-fun b!32286 () Bool)

(assert (=> b!32286 (= e!20508 e!20507)))

(declare-fun res!19613 () Bool)

(assert (=> b!32286 (= res!19613 call!2593)))

(assert (=> b!32286 (=> (not res!19613) (not e!20507))))

(assert (= (and d!5041 c!3740) b!32270))

(assert (= (and d!5041 (not c!3740)) b!32279))

(assert (= (and b!32279 c!3739) b!32273))

(assert (= (and b!32279 (not c!3739)) b!32276))

(assert (= (and b!32276 c!3737) b!32274))

(assert (= (and b!32276 (not c!3737)) b!32285))

(assert (= (or b!32274 b!32285) bm!2590))

(assert (= (or b!32273 bm!2590) bm!2589))

(assert (= (or b!32273 b!32274) bm!2591))

(assert (= (or b!32270 bm!2589) bm!2587))

(assert (= (or b!32270 bm!2591) bm!2586))

(assert (= (and d!5041 res!19616) b!32278))

(assert (= (and d!5041 c!3742) b!32272))

(assert (= (and d!5041 (not c!3742)) b!32268))

(assert (= (and d!5041 res!19619) b!32271))

(assert (= (and b!32271 res!19611) b!32269))

(assert (= (and b!32271 (not res!19618)) b!32277))

(assert (= (and b!32277 res!19612) b!32284))

(assert (= (and b!32271 res!19615) b!32266))

(assert (= (and b!32266 c!3741) b!32286))

(assert (= (and b!32266 (not c!3741)) b!32283))

(assert (= (and b!32286 res!19613) b!32281))

(assert (= (or b!32286 b!32283) bm!2592))

(assert (= (and b!32266 res!19614) b!32275))

(assert (= (and b!32275 c!3738) b!32267))

(assert (= (and b!32275 (not c!3738)) b!32282))

(assert (= (and b!32267 res!19617) b!32280))

(assert (= (or b!32267 b!32282) bm!2588))

(declare-fun b_lambda!1679 () Bool)

(assert (=> (not b_lambda!1679) (not b!32284)))

(declare-fun t!3522 () Bool)

(declare-fun tb!675 () Bool)

(assert (=> (and start!4214 (= defaultEntry!1504 defaultEntry!1504) t!3522) tb!675))

(declare-fun result!1147 () Bool)

(assert (=> tb!675 (= result!1147 tp_is_empty!1477)))

(assert (=> b!32284 t!3522))

(declare-fun b_and!1929 () Bool)

(assert (= b_and!1923 (and (=> t!3522 result!1147) b_and!1929)))

(declare-fun m!25711 () Bool)

(assert (=> bm!2587 m!25711))

(declare-fun m!25713 () Bool)

(assert (=> bm!2586 m!25713))

(declare-fun m!25715 () Bool)

(assert (=> b!32284 m!25715))

(declare-fun m!25717 () Bool)

(assert (=> b!32284 m!25717))

(assert (=> b!32284 m!25717))

(declare-fun m!25719 () Bool)

(assert (=> b!32284 m!25719))

(declare-fun m!25721 () Bool)

(assert (=> b!32284 m!25721))

(assert (=> b!32284 m!25715))

(declare-fun m!25723 () Bool)

(assert (=> b!32284 m!25723))

(assert (=> b!32284 m!25719))

(assert (=> b!32278 m!25715))

(assert (=> b!32278 m!25715))

(declare-fun m!25725 () Bool)

(assert (=> b!32278 m!25725))

(assert (=> d!5041 m!25643))

(assert (=> b!32269 m!25715))

(assert (=> b!32269 m!25715))

(assert (=> b!32269 m!25725))

(declare-fun m!25727 () Bool)

(assert (=> b!32270 m!25727))

(declare-fun m!25729 () Bool)

(assert (=> b!32281 m!25729))

(declare-fun m!25731 () Bool)

(assert (=> b!32280 m!25731))

(declare-fun m!25733 () Bool)

(assert (=> b!32272 m!25733))

(declare-fun m!25735 () Bool)

(assert (=> b!32272 m!25735))

(declare-fun m!25737 () Bool)

(assert (=> b!32272 m!25737))

(declare-fun m!25739 () Bool)

(assert (=> b!32272 m!25739))

(declare-fun m!25741 () Bool)

(assert (=> b!32272 m!25741))

(assert (=> b!32272 m!25715))

(declare-fun m!25743 () Bool)

(assert (=> b!32272 m!25743))

(assert (=> b!32272 m!25743))

(declare-fun m!25745 () Bool)

(assert (=> b!32272 m!25745))

(declare-fun m!25747 () Bool)

(assert (=> b!32272 m!25747))

(declare-fun m!25749 () Bool)

(assert (=> b!32272 m!25749))

(declare-fun m!25751 () Bool)

(assert (=> b!32272 m!25751))

(declare-fun m!25753 () Bool)

(assert (=> b!32272 m!25753))

(declare-fun m!25755 () Bool)

(assert (=> b!32272 m!25755))

(declare-fun m!25757 () Bool)

(assert (=> b!32272 m!25757))

(declare-fun m!25759 () Bool)

(assert (=> b!32272 m!25759))

(assert (=> b!32272 m!25757))

(assert (=> b!32272 m!25751))

(assert (=> b!32272 m!25737))

(assert (=> b!32272 m!25711))

(declare-fun m!25761 () Bool)

(assert (=> b!32272 m!25761))

(declare-fun m!25763 () Bool)

(assert (=> bm!2592 m!25763))

(declare-fun m!25765 () Bool)

(assert (=> bm!2588 m!25765))

(assert (=> b!32277 m!25715))

(assert (=> b!32277 m!25715))

(declare-fun m!25767 () Bool)

(assert (=> b!32277 m!25767))

(assert (=> b!32147 d!5041))

(declare-fun bm!2595 () Bool)

(declare-fun call!2598 () Bool)

(assert (=> bm!2595 (= call!2598 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!5043 () Bool)

(declare-fun res!19624 () Bool)

(declare-fun e!20521 () Bool)

(assert (=> d!5043 (=> res!19624 e!20521)))

(assert (=> d!5043 (= res!19624 (bvsge #b00000000000000000000000000000000 (size!1130 _keys!1833)))))

(assert (=> d!5043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!20521)))

(declare-fun b!32297 () Bool)

(declare-fun e!20520 () Bool)

(assert (=> b!32297 (= e!20520 call!2598)))

(declare-fun b!32298 () Bool)

(declare-fun e!20519 () Bool)

(assert (=> b!32298 (= e!20521 e!20519)))

(declare-fun c!3745 () Bool)

(assert (=> b!32298 (= c!3745 (validKeyInArray!0 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32299 () Bool)

(assert (=> b!32299 (= e!20519 call!2598)))

(declare-fun b!32300 () Bool)

(assert (=> b!32300 (= e!20519 e!20520)))

(declare-fun lt!11692 () (_ BitVec 64))

(assert (=> b!32300 (= lt!11692 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11693 () Unit!717)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2151 (_ BitVec 64) (_ BitVec 32)) Unit!717)

(assert (=> b!32300 (= lt!11693 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!11692 #b00000000000000000000000000000000))))

(assert (=> b!32300 (arrayContainsKey!0 _keys!1833 lt!11692 #b00000000000000000000000000000000)))

(declare-fun lt!11694 () Unit!717)

(assert (=> b!32300 (= lt!11694 lt!11693)))

(declare-fun res!19625 () Bool)

(declare-datatypes ((SeekEntryResult!120 0))(
  ( (MissingZero!120 (index!2602 (_ BitVec 32))) (Found!120 (index!2603 (_ BitVec 32))) (Intermediate!120 (undefined!932 Bool) (index!2604 (_ BitVec 32)) (x!6720 (_ BitVec 32))) (Undefined!120) (MissingVacant!120 (index!2605 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2151 (_ BitVec 32)) SeekEntryResult!120)

(assert (=> b!32300 (= res!19625 (= (seekEntryOrOpen!0 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!120 #b00000000000000000000000000000000)))))

(assert (=> b!32300 (=> (not res!19625) (not e!20520))))

(assert (= (and d!5043 (not res!19624)) b!32298))

(assert (= (and b!32298 c!3745) b!32300))

(assert (= (and b!32298 (not c!3745)) b!32299))

(assert (= (and b!32300 res!19625) b!32297))

(assert (= (or b!32297 b!32299) bm!2595))

(declare-fun m!25769 () Bool)

(assert (=> bm!2595 m!25769))

(assert (=> b!32298 m!25715))

(assert (=> b!32298 m!25715))

(assert (=> b!32298 m!25725))

(assert (=> b!32300 m!25715))

(declare-fun m!25771 () Bool)

(assert (=> b!32300 m!25771))

(declare-fun m!25773 () Bool)

(assert (=> b!32300 m!25773))

(assert (=> b!32300 m!25715))

(declare-fun m!25775 () Bool)

(assert (=> b!32300 m!25775))

(assert (=> b!32150 d!5043))

(declare-fun b!32311 () Bool)

(declare-fun e!20531 () Bool)

(declare-fun e!20530 () Bool)

(assert (=> b!32311 (= e!20531 e!20530)))

(declare-fun res!19633 () Bool)

(assert (=> b!32311 (=> (not res!19633) (not e!20530))))

(declare-fun e!20532 () Bool)

(assert (=> b!32311 (= res!19633 (not e!20532))))

(declare-fun res!19634 () Bool)

(assert (=> b!32311 (=> (not res!19634) (not e!20532))))

(assert (=> b!32311 (= res!19634 (validKeyInArray!0 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32312 () Bool)

(declare-fun e!20533 () Bool)

(assert (=> b!32312 (= e!20530 e!20533)))

(declare-fun c!3748 () Bool)

(assert (=> b!32312 (= c!3748 (validKeyInArray!0 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2598 () Bool)

(declare-fun call!2601 () Bool)

(assert (=> bm!2598 (= call!2601 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3748 (Cons!826 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000) Nil!827) Nil!827)))))

(declare-fun b!32313 () Bool)

(assert (=> b!32313 (= e!20533 call!2601)))

(declare-fun d!5045 () Bool)

(declare-fun res!19632 () Bool)

(assert (=> d!5045 (=> res!19632 e!20531)))

(assert (=> d!5045 (= res!19632 (bvsge #b00000000000000000000000000000000 (size!1130 _keys!1833)))))

(assert (=> d!5045 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!827) e!20531)))

(declare-fun b!32314 () Bool)

(declare-fun contains!362 (List!830 (_ BitVec 64)) Bool)

(assert (=> b!32314 (= e!20532 (contains!362 Nil!827 (select (arr!1029 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32315 () Bool)

(assert (=> b!32315 (= e!20533 call!2601)))

(assert (= (and d!5045 (not res!19632)) b!32311))

(assert (= (and b!32311 res!19634) b!32314))

(assert (= (and b!32311 res!19633) b!32312))

(assert (= (and b!32312 c!3748) b!32315))

(assert (= (and b!32312 (not c!3748)) b!32313))

(assert (= (or b!32315 b!32313) bm!2598))

(assert (=> b!32311 m!25715))

(assert (=> b!32311 m!25715))

(assert (=> b!32311 m!25725))

(assert (=> b!32312 m!25715))

(assert (=> b!32312 m!25715))

(assert (=> b!32312 m!25725))

(assert (=> bm!2598 m!25715))

(declare-fun m!25777 () Bool)

(assert (=> bm!2598 m!25777))

(assert (=> b!32314 m!25715))

(assert (=> b!32314 m!25715))

(declare-fun m!25779 () Bool)

(assert (=> b!32314 m!25779))

(assert (=> b!32149 d!5045))

(declare-fun d!5047 () Bool)

(assert (=> d!5047 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4214 d!5047))

(declare-fun d!5049 () Bool)

(assert (=> d!5049 (= (array_inv!707 _values!1501) (bvsge (size!1131 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4214 d!5049))

(declare-fun d!5051 () Bool)

(assert (=> d!5051 (= (array_inv!708 _keys!1833) (bvsge (size!1130 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4214 d!5051))

(declare-fun d!5053 () Bool)

(assert (=> d!5053 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32154 d!5053))

(declare-fun d!5055 () Bool)

(declare-fun res!19639 () Bool)

(declare-fun e!20538 () Bool)

(assert (=> d!5055 (=> res!19639 e!20538)))

(assert (=> d!5055 (= res!19639 (= (select (arr!1029 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5055 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!20538)))

(declare-fun b!32320 () Bool)

(declare-fun e!20539 () Bool)

(assert (=> b!32320 (= e!20538 e!20539)))

(declare-fun res!19640 () Bool)

(assert (=> b!32320 (=> (not res!19640) (not e!20539))))

(assert (=> b!32320 (= res!19640 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1130 _keys!1833)))))

(declare-fun b!32321 () Bool)

(assert (=> b!32321 (= e!20539 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5055 (not res!19639)) b!32320))

(assert (= (and b!32320 res!19640) b!32321))

(assert (=> d!5055 m!25715))

(declare-fun m!25781 () Bool)

(assert (=> b!32321 m!25781))

(assert (=> b!32145 d!5055))

(declare-fun d!5057 () Bool)

(declare-fun lt!11697 () (_ BitVec 32))

(assert (=> d!5057 (and (or (bvslt lt!11697 #b00000000000000000000000000000000) (bvsge lt!11697 (size!1130 _keys!1833)) (and (bvsge lt!11697 #b00000000000000000000000000000000) (bvslt lt!11697 (size!1130 _keys!1833)))) (bvsge lt!11697 #b00000000000000000000000000000000) (bvslt lt!11697 (size!1130 _keys!1833)) (= (select (arr!1029 _keys!1833) lt!11697) k0!1304))))

(declare-fun e!20542 () (_ BitVec 32))

(assert (=> d!5057 (= lt!11697 e!20542)))

(declare-fun c!3751 () Bool)

(assert (=> d!5057 (= c!3751 (= (select (arr!1029 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1130 _keys!1833)) (bvslt (size!1130 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5057 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!11697)))

(declare-fun b!32326 () Bool)

(assert (=> b!32326 (= e!20542 #b00000000000000000000000000000000)))

(declare-fun b!32327 () Bool)

(assert (=> b!32327 (= e!20542 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5057 c!3751) b!32326))

(assert (= (and d!5057 (not c!3751)) b!32327))

(declare-fun m!25783 () Bool)

(assert (=> d!5057 m!25783))

(assert (=> d!5057 m!25715))

(declare-fun m!25785 () Bool)

(assert (=> b!32327 m!25785))

(assert (=> b!32153 d!5057))

(declare-fun condMapEmpty!1753 () Bool)

(declare-fun mapDefault!1753 () ValueCell!539)

(assert (=> mapNonEmpty!1744 (= condMapEmpty!1753 (= mapRest!1744 ((as const (Array (_ BitVec 32) ValueCell!539)) mapDefault!1753)))))

(declare-fun e!20547 () Bool)

(declare-fun mapRes!1753 () Bool)

(assert (=> mapNonEmpty!1744 (= tp!4789 (and e!20547 mapRes!1753))))

(declare-fun mapNonEmpty!1753 () Bool)

(declare-fun tp!4804 () Bool)

(declare-fun e!20548 () Bool)

(assert (=> mapNonEmpty!1753 (= mapRes!1753 (and tp!4804 e!20548))))

(declare-fun mapKey!1753 () (_ BitVec 32))

(declare-fun mapValue!1753 () ValueCell!539)

(declare-fun mapRest!1753 () (Array (_ BitVec 32) ValueCell!539))

(assert (=> mapNonEmpty!1753 (= mapRest!1744 (store mapRest!1753 mapKey!1753 mapValue!1753))))

(declare-fun b!32334 () Bool)

(assert (=> b!32334 (= e!20548 tp_is_empty!1477)))

(declare-fun b!32335 () Bool)

(assert (=> b!32335 (= e!20547 tp_is_empty!1477)))

(declare-fun mapIsEmpty!1753 () Bool)

(assert (=> mapIsEmpty!1753 mapRes!1753))

(assert (= (and mapNonEmpty!1744 condMapEmpty!1753) mapIsEmpty!1753))

(assert (= (and mapNonEmpty!1744 (not condMapEmpty!1753)) mapNonEmpty!1753))

(assert (= (and mapNonEmpty!1753 ((_ is ValueCellFull!539) mapValue!1753)) b!32334))

(assert (= (and mapNonEmpty!1744 ((_ is ValueCellFull!539) mapDefault!1753)) b!32335))

(declare-fun m!25787 () Bool)

(assert (=> mapNonEmpty!1753 m!25787))

(declare-fun b_lambda!1681 () Bool)

(assert (= b_lambda!1679 (or (and start!4214 b_free!1123) b_lambda!1681)))

(check-sat (not b!32277) (not b!32312) (not d!5041) (not bm!2598) tp_is_empty!1477 b_and!1929 (not b!32281) (not b!32270) (not bm!2588) (not mapNonEmpty!1753) (not b_lambda!1681) (not b_next!1123) (not b!32327) (not b!32269) (not b!32280) (not bm!2587) (not b!32223) (not b!32284) (not b!32314) (not b!32272) (not b!32300) (not bm!2592) (not b!32221) (not bm!2595) (not b!32298) (not b!32311) (not bm!2586) (not b!32278) (not b!32321) (not d!5039))
(check-sat b_and!1929 (not b_next!1123))
