; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21220 () Bool)

(assert start!21220)

(declare-fun b_free!5647 () Bool)

(declare-fun b_next!5647 () Bool)

(assert (=> start!21220 (= b_free!5647 (not b_next!5647))))

(declare-fun tp!20015 () Bool)

(declare-fun b_and!12539 () Bool)

(assert (=> start!21220 (= tp!20015 b_and!12539)))

(declare-fun b!213813 () Bool)

(declare-fun e!139026 () Bool)

(declare-fun e!139025 () Bool)

(assert (=> b!213813 (= e!139026 (not e!139025))))

(declare-fun res!104678 () Bool)

(assert (=> b!213813 (=> res!104678 e!139025)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun lt!110626 () Bool)

(declare-datatypes ((V!6993 0))(
  ( (V!6994 (val!2799 Int)) )
))
(declare-datatypes ((tuple2!4174 0))(
  ( (tuple2!4175 (_1!2098 (_ BitVec 64)) (_2!2098 V!6993)) )
))
(declare-datatypes ((List!3057 0))(
  ( (Nil!3054) (Cons!3053 (h!3695 tuple2!4174) (t!8002 List!3057)) )
))
(declare-datatypes ((ListLongMap!3089 0))(
  ( (ListLongMap!3090 (toList!1560 List!3057)) )
))
(declare-fun lt!110622 () ListLongMap!3089)

(declare-fun lt!110625 () ListLongMap!3089)

(assert (=> b!213813 (= res!104678 (or (and (not lt!110626) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110626) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110626) (not (= lt!110625 lt!110622))))))

(assert (=> b!213813 (= lt!110626 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!110627 () ListLongMap!3089)

(declare-datatypes ((ValueCell!2411 0))(
  ( (ValueCellFull!2411 (v!4814 V!6993)) (EmptyCell!2411) )
))
(declare-datatypes ((array!10221 0))(
  ( (array!10222 (arr!4850 (Array (_ BitVec 32) ValueCell!2411)) (size!5175 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10221)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6993)

(declare-datatypes ((array!10223 0))(
  ( (array!10224 (arr!4851 (Array (_ BitVec 32) (_ BitVec 64))) (size!5176 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10223)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6993)

(declare-fun getCurrentListMap!1093 (array!10223 array!10221 (_ BitVec 32) (_ BitVec 32) V!6993 V!6993 (_ BitVec 32) Int) ListLongMap!3089)

(assert (=> b!213813 (= lt!110627 (getCurrentListMap!1093 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110620 () array!10221)

(assert (=> b!213813 (= lt!110625 (getCurrentListMap!1093 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110619 () ListLongMap!3089)

(assert (=> b!213813 (and (= lt!110622 lt!110619) (= lt!110619 lt!110622))))

(declare-fun lt!110621 () ListLongMap!3089)

(declare-fun lt!110623 () tuple2!4174)

(declare-fun +!589 (ListLongMap!3089 tuple2!4174) ListLongMap!3089)

(assert (=> b!213813 (= lt!110619 (+!589 lt!110621 lt!110623))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6993)

(assert (=> b!213813 (= lt!110623 (tuple2!4175 k0!843 v!520))))

(declare-datatypes ((Unit!6470 0))(
  ( (Unit!6471) )
))
(declare-fun lt!110624 () Unit!6470)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!234 (array!10223 array!10221 (_ BitVec 32) (_ BitVec 32) V!6993 V!6993 (_ BitVec 32) (_ BitVec 64) V!6993 (_ BitVec 32) Int) Unit!6470)

(assert (=> b!213813 (= lt!110624 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!234 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!516 (array!10223 array!10221 (_ BitVec 32) (_ BitVec 32) V!6993 V!6993 (_ BitVec 32) Int) ListLongMap!3089)

(assert (=> b!213813 (= lt!110622 (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213813 (= lt!110620 (array!10222 (store (arr!4850 _values!649) i!601 (ValueCellFull!2411 v!520)) (size!5175 _values!649)))))

(assert (=> b!213813 (= lt!110621 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213814 () Bool)

(declare-fun e!139027 () Bool)

(declare-fun tp_is_empty!5509 () Bool)

(assert (=> b!213814 (= e!139027 tp_is_empty!5509)))

(declare-fun res!104682 () Bool)

(assert (=> start!21220 (=> (not res!104682) (not e!139026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21220 (= res!104682 (validMask!0 mask!1149))))

(assert (=> start!21220 e!139026))

(declare-fun e!139023 () Bool)

(declare-fun array_inv!3185 (array!10221) Bool)

(assert (=> start!21220 (and (array_inv!3185 _values!649) e!139023)))

(assert (=> start!21220 true))

(assert (=> start!21220 tp_is_empty!5509))

(declare-fun array_inv!3186 (array!10223) Bool)

(assert (=> start!21220 (array_inv!3186 _keys!825)))

(assert (=> start!21220 tp!20015))

(declare-fun b!213815 () Bool)

(declare-fun res!104681 () Bool)

(assert (=> b!213815 (=> (not res!104681) (not e!139026))))

(assert (=> b!213815 (= res!104681 (= (select (arr!4851 _keys!825) i!601) k0!843))))

(declare-fun b!213816 () Bool)

(declare-fun mapRes!9365 () Bool)

(assert (=> b!213816 (= e!139023 (and e!139027 mapRes!9365))))

(declare-fun condMapEmpty!9365 () Bool)

(declare-fun mapDefault!9365 () ValueCell!2411)

(assert (=> b!213816 (= condMapEmpty!9365 (= (arr!4850 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2411)) mapDefault!9365)))))

(declare-fun b!213817 () Bool)

(declare-fun e!139024 () Bool)

(assert (=> b!213817 (= e!139024 tp_is_empty!5509)))

(declare-fun b!213818 () Bool)

(assert (=> b!213818 (= e!139025 (= (+!589 lt!110627 lt!110623) lt!110625))))

(declare-fun b!213819 () Bool)

(declare-fun res!104677 () Bool)

(assert (=> b!213819 (=> (not res!104677) (not e!139026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10223 (_ BitVec 32)) Bool)

(assert (=> b!213819 (= res!104677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213820 () Bool)

(declare-fun res!104676 () Bool)

(assert (=> b!213820 (=> (not res!104676) (not e!139026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213820 (= res!104676 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!9365 () Bool)

(assert (=> mapIsEmpty!9365 mapRes!9365))

(declare-fun b!213821 () Bool)

(declare-fun res!104679 () Bool)

(assert (=> b!213821 (=> (not res!104679) (not e!139026))))

(assert (=> b!213821 (= res!104679 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5176 _keys!825))))))

(declare-fun b!213822 () Bool)

(declare-fun res!104683 () Bool)

(assert (=> b!213822 (=> (not res!104683) (not e!139026))))

(declare-datatypes ((List!3058 0))(
  ( (Nil!3055) (Cons!3054 (h!3696 (_ BitVec 64)) (t!8003 List!3058)) )
))
(declare-fun arrayNoDuplicates!0 (array!10223 (_ BitVec 32) List!3058) Bool)

(assert (=> b!213822 (= res!104683 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3055))))

(declare-fun mapNonEmpty!9365 () Bool)

(declare-fun tp!20014 () Bool)

(assert (=> mapNonEmpty!9365 (= mapRes!9365 (and tp!20014 e!139024))))

(declare-fun mapValue!9365 () ValueCell!2411)

(declare-fun mapKey!9365 () (_ BitVec 32))

(declare-fun mapRest!9365 () (Array (_ BitVec 32) ValueCell!2411))

(assert (=> mapNonEmpty!9365 (= (arr!4850 _values!649) (store mapRest!9365 mapKey!9365 mapValue!9365))))

(declare-fun b!213823 () Bool)

(declare-fun res!104680 () Bool)

(assert (=> b!213823 (=> (not res!104680) (not e!139026))))

(assert (=> b!213823 (= res!104680 (and (= (size!5175 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5176 _keys!825) (size!5175 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!21220 res!104682) b!213823))

(assert (= (and b!213823 res!104680) b!213819))

(assert (= (and b!213819 res!104677) b!213822))

(assert (= (and b!213822 res!104683) b!213821))

(assert (= (and b!213821 res!104679) b!213820))

(assert (= (and b!213820 res!104676) b!213815))

(assert (= (and b!213815 res!104681) b!213813))

(assert (= (and b!213813 (not res!104678)) b!213818))

(assert (= (and b!213816 condMapEmpty!9365) mapIsEmpty!9365))

(assert (= (and b!213816 (not condMapEmpty!9365)) mapNonEmpty!9365))

(get-info :version)

(assert (= (and mapNonEmpty!9365 ((_ is ValueCellFull!2411) mapValue!9365)) b!213817))

(assert (= (and b!213816 ((_ is ValueCellFull!2411) mapDefault!9365)) b!213814))

(assert (= start!21220 b!213816))

(declare-fun m!241815 () Bool)

(assert (=> b!213815 m!241815))

(declare-fun m!241817 () Bool)

(assert (=> b!213820 m!241817))

(declare-fun m!241819 () Bool)

(assert (=> b!213822 m!241819))

(declare-fun m!241821 () Bool)

(assert (=> mapNonEmpty!9365 m!241821))

(declare-fun m!241823 () Bool)

(assert (=> b!213813 m!241823))

(declare-fun m!241825 () Bool)

(assert (=> b!213813 m!241825))

(declare-fun m!241827 () Bool)

(assert (=> b!213813 m!241827))

(declare-fun m!241829 () Bool)

(assert (=> b!213813 m!241829))

(declare-fun m!241831 () Bool)

(assert (=> b!213813 m!241831))

(declare-fun m!241833 () Bool)

(assert (=> b!213813 m!241833))

(declare-fun m!241835 () Bool)

(assert (=> b!213813 m!241835))

(declare-fun m!241837 () Bool)

(assert (=> b!213818 m!241837))

(declare-fun m!241839 () Bool)

(assert (=> start!21220 m!241839))

(declare-fun m!241841 () Bool)

(assert (=> start!21220 m!241841))

(declare-fun m!241843 () Bool)

(assert (=> start!21220 m!241843))

(declare-fun m!241845 () Bool)

(assert (=> b!213819 m!241845))

(check-sat (not b_next!5647) (not b!213822) (not b!213818) (not b!213819) (not mapNonEmpty!9365) b_and!12539 (not b!213813) tp_is_empty!5509 (not start!21220) (not b!213820))
(check-sat b_and!12539 (not b_next!5647))
(get-model)

(declare-fun d!58307 () Bool)

(assert (=> d!58307 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213820 d!58307))

(declare-fun bm!20260 () Bool)

(declare-fun call!20264 () ListLongMap!3089)

(declare-fun call!20265 () ListLongMap!3089)

(assert (=> bm!20260 (= call!20264 call!20265)))

(declare-fun c!36000 () Bool)

(declare-fun call!20263 () ListLongMap!3089)

(declare-fun bm!20261 () Bool)

(declare-fun call!20268 () ListLongMap!3089)

(declare-fun c!36001 () Bool)

(assert (=> bm!20261 (= call!20268 (+!589 (ite c!36000 call!20263 (ite c!36001 call!20265 call!20264)) (ite (or c!36000 c!36001) (tuple2!4175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!213932 () Bool)

(declare-fun e!139099 () ListLongMap!3089)

(assert (=> b!213932 (= e!139099 call!20264)))

(declare-fun b!213933 () Bool)

(declare-fun e!139103 () ListLongMap!3089)

(assert (=> b!213933 (= e!139103 (+!589 call!20268 (tuple2!4175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20262 () Bool)

(declare-fun call!20269 () Bool)

(declare-fun lt!110729 () ListLongMap!3089)

(declare-fun contains!1405 (ListLongMap!3089 (_ BitVec 64)) Bool)

(assert (=> bm!20262 (= call!20269 (contains!1405 lt!110729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213934 () Bool)

(declare-fun e!139098 () ListLongMap!3089)

(declare-fun call!20266 () ListLongMap!3089)

(assert (=> b!213934 (= e!139098 call!20266)))

(declare-fun b!213935 () Bool)

(declare-fun e!139100 () Bool)

(assert (=> b!213935 (= e!139100 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213936 () Bool)

(declare-fun e!139097 () Bool)

(assert (=> b!213936 (= e!139097 (not call!20269))))

(declare-fun b!213937 () Bool)

(declare-fun c!36005 () Bool)

(assert (=> b!213937 (= c!36005 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213937 (= e!139098 e!139099)))

(declare-fun bm!20263 () Bool)

(assert (=> bm!20263 (= call!20266 call!20268)))

(declare-fun b!213938 () Bool)

(declare-fun e!139094 () Bool)

(declare-fun apply!200 (ListLongMap!3089 (_ BitVec 64)) V!6993)

(assert (=> b!213938 (= e!139094 (= (apply!200 lt!110729 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20264 () Bool)

(assert (=> bm!20264 (= call!20263 (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213939 () Bool)

(declare-fun e!139102 () Bool)

(assert (=> b!213939 (= e!139097 e!139102)))

(declare-fun res!104752 () Bool)

(assert (=> b!213939 (= res!104752 call!20269)))

(assert (=> b!213939 (=> (not res!104752) (not e!139102))))

(declare-fun b!213940 () Bool)

(declare-fun e!139096 () Bool)

(declare-fun call!20267 () Bool)

(assert (=> b!213940 (= e!139096 (not call!20267))))

(declare-fun b!213941 () Bool)

(declare-fun e!139101 () Bool)

(declare-fun get!2598 (ValueCell!2411 V!6993) V!6993)

(declare-fun dynLambda!543 (Int (_ BitVec 64)) V!6993)

(assert (=> b!213941 (= e!139101 (= (apply!200 lt!110729 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)) (get!2598 (select (arr!4850 lt!110620) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5175 lt!110620)))))

(assert (=> b!213941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun b!213942 () Bool)

(declare-fun res!104756 () Bool)

(declare-fun e!139091 () Bool)

(assert (=> b!213942 (=> (not res!104756) (not e!139091))))

(assert (=> b!213942 (= res!104756 e!139097)))

(declare-fun c!36003 () Bool)

(assert (=> b!213942 (= c!36003 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213943 () Bool)

(assert (=> b!213943 (= e!139102 (= (apply!200 lt!110729 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213944 () Bool)

(declare-fun e!139093 () Bool)

(assert (=> b!213944 (= e!139093 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213945 () Bool)

(assert (=> b!213945 (= e!139099 call!20266)))

(declare-fun b!213946 () Bool)

(declare-fun res!104757 () Bool)

(assert (=> b!213946 (=> (not res!104757) (not e!139091))))

(declare-fun e!139092 () Bool)

(assert (=> b!213946 (= res!104757 e!139092)))

(declare-fun res!104753 () Bool)

(assert (=> b!213946 (=> res!104753 e!139092)))

(assert (=> b!213946 (= res!104753 (not e!139100))))

(declare-fun res!104755 () Bool)

(assert (=> b!213946 (=> (not res!104755) (not e!139100))))

(assert (=> b!213946 (= res!104755 (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun bm!20265 () Bool)

(assert (=> bm!20265 (= call!20265 call!20263)))

(declare-fun b!213947 () Bool)

(assert (=> b!213947 (= e!139092 e!139101)))

(declare-fun res!104758 () Bool)

(assert (=> b!213947 (=> (not res!104758) (not e!139101))))

(assert (=> b!213947 (= res!104758 (contains!1405 lt!110729 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun d!58309 () Bool)

(assert (=> d!58309 e!139091))

(declare-fun res!104750 () Bool)

(assert (=> d!58309 (=> (not res!104750) (not e!139091))))

(assert (=> d!58309 (= res!104750 (or (bvsge #b00000000000000000000000000000000 (size!5176 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))))

(declare-fun lt!110741 () ListLongMap!3089)

(assert (=> d!58309 (= lt!110729 lt!110741)))

(declare-fun lt!110730 () Unit!6470)

(declare-fun e!139095 () Unit!6470)

(assert (=> d!58309 (= lt!110730 e!139095)))

(declare-fun c!36002 () Bool)

(assert (=> d!58309 (= c!36002 e!139093)))

(declare-fun res!104754 () Bool)

(assert (=> d!58309 (=> (not res!104754) (not e!139093))))

(assert (=> d!58309 (= res!104754 (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(assert (=> d!58309 (= lt!110741 e!139103)))

(assert (=> d!58309 (= c!36000 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58309 (validMask!0 mask!1149)))

(assert (=> d!58309 (= (getCurrentListMap!1093 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110729)))

(declare-fun b!213948 () Bool)

(assert (=> b!213948 (= e!139103 e!139098)))

(assert (=> b!213948 (= c!36001 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20266 () Bool)

(assert (=> bm!20266 (= call!20267 (contains!1405 lt!110729 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213949 () Bool)

(assert (=> b!213949 (= e!139091 e!139096)))

(declare-fun c!36004 () Bool)

(assert (=> b!213949 (= c!36004 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213950 () Bool)

(declare-fun lt!110742 () Unit!6470)

(assert (=> b!213950 (= e!139095 lt!110742)))

(declare-fun lt!110733 () ListLongMap!3089)

(assert (=> b!213950 (= lt!110733 (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110747 () (_ BitVec 64))

(assert (=> b!213950 (= lt!110747 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110744 () (_ BitVec 64))

(assert (=> b!213950 (= lt!110744 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110739 () Unit!6470)

(declare-fun addStillContains!176 (ListLongMap!3089 (_ BitVec 64) V!6993 (_ BitVec 64)) Unit!6470)

(assert (=> b!213950 (= lt!110739 (addStillContains!176 lt!110733 lt!110747 zeroValue!615 lt!110744))))

(assert (=> b!213950 (contains!1405 (+!589 lt!110733 (tuple2!4175 lt!110747 zeroValue!615)) lt!110744)))

(declare-fun lt!110727 () Unit!6470)

(assert (=> b!213950 (= lt!110727 lt!110739)))

(declare-fun lt!110735 () ListLongMap!3089)

(assert (=> b!213950 (= lt!110735 (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110737 () (_ BitVec 64))

(assert (=> b!213950 (= lt!110737 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110734 () (_ BitVec 64))

(assert (=> b!213950 (= lt!110734 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110738 () Unit!6470)

(declare-fun addApplyDifferent!176 (ListLongMap!3089 (_ BitVec 64) V!6993 (_ BitVec 64)) Unit!6470)

(assert (=> b!213950 (= lt!110738 (addApplyDifferent!176 lt!110735 lt!110737 minValue!615 lt!110734))))

(assert (=> b!213950 (= (apply!200 (+!589 lt!110735 (tuple2!4175 lt!110737 minValue!615)) lt!110734) (apply!200 lt!110735 lt!110734))))

(declare-fun lt!110743 () Unit!6470)

(assert (=> b!213950 (= lt!110743 lt!110738)))

(declare-fun lt!110726 () ListLongMap!3089)

(assert (=> b!213950 (= lt!110726 (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110728 () (_ BitVec 64))

(assert (=> b!213950 (= lt!110728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110740 () (_ BitVec 64))

(assert (=> b!213950 (= lt!110740 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110745 () Unit!6470)

(assert (=> b!213950 (= lt!110745 (addApplyDifferent!176 lt!110726 lt!110728 zeroValue!615 lt!110740))))

(assert (=> b!213950 (= (apply!200 (+!589 lt!110726 (tuple2!4175 lt!110728 zeroValue!615)) lt!110740) (apply!200 lt!110726 lt!110740))))

(declare-fun lt!110731 () Unit!6470)

(assert (=> b!213950 (= lt!110731 lt!110745)))

(declare-fun lt!110736 () ListLongMap!3089)

(assert (=> b!213950 (= lt!110736 (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110732 () (_ BitVec 64))

(assert (=> b!213950 (= lt!110732 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110746 () (_ BitVec 64))

(assert (=> b!213950 (= lt!110746 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213950 (= lt!110742 (addApplyDifferent!176 lt!110736 lt!110732 minValue!615 lt!110746))))

(assert (=> b!213950 (= (apply!200 (+!589 lt!110736 (tuple2!4175 lt!110732 minValue!615)) lt!110746) (apply!200 lt!110736 lt!110746))))

(declare-fun b!213951 () Bool)

(declare-fun Unit!6472 () Unit!6470)

(assert (=> b!213951 (= e!139095 Unit!6472)))

(declare-fun b!213952 () Bool)

(assert (=> b!213952 (= e!139096 e!139094)))

(declare-fun res!104751 () Bool)

(assert (=> b!213952 (= res!104751 call!20267)))

(assert (=> b!213952 (=> (not res!104751) (not e!139094))))

(assert (= (and d!58309 c!36000) b!213933))

(assert (= (and d!58309 (not c!36000)) b!213948))

(assert (= (and b!213948 c!36001) b!213934))

(assert (= (and b!213948 (not c!36001)) b!213937))

(assert (= (and b!213937 c!36005) b!213945))

(assert (= (and b!213937 (not c!36005)) b!213932))

(assert (= (or b!213945 b!213932) bm!20260))

(assert (= (or b!213934 bm!20260) bm!20265))

(assert (= (or b!213934 b!213945) bm!20263))

(assert (= (or b!213933 bm!20265) bm!20264))

(assert (= (or b!213933 bm!20263) bm!20261))

(assert (= (and d!58309 res!104754) b!213944))

(assert (= (and d!58309 c!36002) b!213950))

(assert (= (and d!58309 (not c!36002)) b!213951))

(assert (= (and d!58309 res!104750) b!213946))

(assert (= (and b!213946 res!104755) b!213935))

(assert (= (and b!213946 (not res!104753)) b!213947))

(assert (= (and b!213947 res!104758) b!213941))

(assert (= (and b!213946 res!104757) b!213942))

(assert (= (and b!213942 c!36003) b!213939))

(assert (= (and b!213942 (not c!36003)) b!213936))

(assert (= (and b!213939 res!104752) b!213943))

(assert (= (or b!213939 b!213936) bm!20262))

(assert (= (and b!213942 res!104756) b!213949))

(assert (= (and b!213949 c!36004) b!213952))

(assert (= (and b!213949 (not c!36004)) b!213940))

(assert (= (and b!213952 res!104751) b!213938))

(assert (= (or b!213952 b!213940) bm!20266))

(declare-fun b_lambda!7825 () Bool)

(assert (=> (not b_lambda!7825) (not b!213941)))

(declare-fun t!8007 () Bool)

(declare-fun tb!2905 () Bool)

(assert (=> (and start!21220 (= defaultEntry!657 defaultEntry!657) t!8007) tb!2905))

(declare-fun result!5019 () Bool)

(assert (=> tb!2905 (= result!5019 tp_is_empty!5509)))

(assert (=> b!213941 t!8007))

(declare-fun b_and!12545 () Bool)

(assert (= b_and!12539 (and (=> t!8007 result!5019) b_and!12545)))

(declare-fun m!241911 () Bool)

(assert (=> b!213943 m!241911))

(declare-fun m!241913 () Bool)

(assert (=> bm!20262 m!241913))

(declare-fun m!241915 () Bool)

(assert (=> b!213935 m!241915))

(assert (=> b!213935 m!241915))

(declare-fun m!241917 () Bool)

(assert (=> b!213935 m!241917))

(assert (=> bm!20264 m!241829))

(assert (=> b!213944 m!241915))

(assert (=> b!213944 m!241915))

(assert (=> b!213944 m!241917))

(assert (=> d!58309 m!241839))

(declare-fun m!241919 () Bool)

(assert (=> b!213941 m!241919))

(assert (=> b!213941 m!241915))

(declare-fun m!241921 () Bool)

(assert (=> b!213941 m!241921))

(assert (=> b!213941 m!241919))

(declare-fun m!241923 () Bool)

(assert (=> b!213941 m!241923))

(assert (=> b!213941 m!241915))

(declare-fun m!241925 () Bool)

(assert (=> b!213941 m!241925))

(assert (=> b!213941 m!241921))

(declare-fun m!241927 () Bool)

(assert (=> b!213950 m!241927))

(declare-fun m!241929 () Bool)

(assert (=> b!213950 m!241929))

(declare-fun m!241931 () Bool)

(assert (=> b!213950 m!241931))

(declare-fun m!241933 () Bool)

(assert (=> b!213950 m!241933))

(declare-fun m!241935 () Bool)

(assert (=> b!213950 m!241935))

(declare-fun m!241937 () Bool)

(assert (=> b!213950 m!241937))

(assert (=> b!213950 m!241937))

(declare-fun m!241939 () Bool)

(assert (=> b!213950 m!241939))

(declare-fun m!241941 () Bool)

(assert (=> b!213950 m!241941))

(assert (=> b!213950 m!241933))

(declare-fun m!241943 () Bool)

(assert (=> b!213950 m!241943))

(declare-fun m!241945 () Bool)

(assert (=> b!213950 m!241945))

(assert (=> b!213950 m!241929))

(assert (=> b!213950 m!241927))

(declare-fun m!241947 () Bool)

(assert (=> b!213950 m!241947))

(assert (=> b!213950 m!241829))

(declare-fun m!241949 () Bool)

(assert (=> b!213950 m!241949))

(declare-fun m!241951 () Bool)

(assert (=> b!213950 m!241951))

(declare-fun m!241953 () Bool)

(assert (=> b!213950 m!241953))

(declare-fun m!241955 () Bool)

(assert (=> b!213950 m!241955))

(assert (=> b!213950 m!241915))

(assert (=> b!213947 m!241915))

(assert (=> b!213947 m!241915))

(declare-fun m!241957 () Bool)

(assert (=> b!213947 m!241957))

(declare-fun m!241959 () Bool)

(assert (=> b!213938 m!241959))

(declare-fun m!241961 () Bool)

(assert (=> bm!20261 m!241961))

(declare-fun m!241963 () Bool)

(assert (=> bm!20266 m!241963))

(declare-fun m!241965 () Bool)

(assert (=> b!213933 m!241965))

(assert (=> b!213813 d!58309))

(declare-fun b!213979 () Bool)

(declare-fun e!139119 () ListLongMap!3089)

(assert (=> b!213979 (= e!139119 (ListLongMap!3090 Nil!3054))))

(declare-fun b!213980 () Bool)

(assert (=> b!213980 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(assert (=> b!213980 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5175 _values!649)))))

(declare-fun lt!110764 () ListLongMap!3089)

(declare-fun e!139121 () Bool)

(assert (=> b!213980 (= e!139121 (= (apply!200 lt!110764 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)) (get!2598 (select (arr!4850 _values!649) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213981 () Bool)

(declare-fun e!139118 () Bool)

(declare-fun e!139124 () Bool)

(assert (=> b!213981 (= e!139118 e!139124)))

(declare-fun c!36016 () Bool)

(assert (=> b!213981 (= c!36016 (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun b!213982 () Bool)

(declare-fun isEmpty!507 (ListLongMap!3089) Bool)

(assert (=> b!213982 (= e!139124 (isEmpty!507 lt!110764))))

(declare-fun b!213983 () Bool)

(declare-fun e!139120 () ListLongMap!3089)

(declare-fun call!20272 () ListLongMap!3089)

(assert (=> b!213983 (= e!139120 call!20272)))

(declare-fun b!213984 () Bool)

(declare-fun e!139123 () Bool)

(assert (=> b!213984 (= e!139123 e!139118)))

(declare-fun c!36015 () Bool)

(declare-fun e!139122 () Bool)

(assert (=> b!213984 (= c!36015 e!139122)))

(declare-fun res!104769 () Bool)

(assert (=> b!213984 (=> (not res!104769) (not e!139122))))

(assert (=> b!213984 (= res!104769 (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun bm!20269 () Bool)

(assert (=> bm!20269 (= call!20272 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213985 () Bool)

(assert (=> b!213985 (= e!139119 e!139120)))

(declare-fun c!36017 () Bool)

(assert (=> b!213985 (= c!36017 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213986 () Bool)

(assert (=> b!213986 (= e!139118 e!139121)))

(assert (=> b!213986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun res!104767 () Bool)

(assert (=> b!213986 (= res!104767 (contains!1405 lt!110764 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213986 (=> (not res!104767) (not e!139121))))

(declare-fun b!213987 () Bool)

(assert (=> b!213987 (= e!139124 (= lt!110764 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!58311 () Bool)

(assert (=> d!58311 e!139123))

(declare-fun res!104770 () Bool)

(assert (=> d!58311 (=> (not res!104770) (not e!139123))))

(assert (=> d!58311 (= res!104770 (not (contains!1405 lt!110764 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58311 (= lt!110764 e!139119)))

(declare-fun c!36014 () Bool)

(assert (=> d!58311 (= c!36014 (bvsge #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(assert (=> d!58311 (validMask!0 mask!1149)))

(assert (=> d!58311 (= (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110764)))

(declare-fun b!213988 () Bool)

(declare-fun res!104768 () Bool)

(assert (=> b!213988 (=> (not res!104768) (not e!139123))))

(assert (=> b!213988 (= res!104768 (not (contains!1405 lt!110764 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213989 () Bool)

(declare-fun lt!110768 () Unit!6470)

(declare-fun lt!110763 () Unit!6470)

(assert (=> b!213989 (= lt!110768 lt!110763)))

(declare-fun lt!110765 () (_ BitVec 64))

(declare-fun lt!110762 () (_ BitVec 64))

(declare-fun lt!110766 () ListLongMap!3089)

(declare-fun lt!110767 () V!6993)

(assert (=> b!213989 (not (contains!1405 (+!589 lt!110766 (tuple2!4175 lt!110765 lt!110767)) lt!110762))))

(declare-fun addStillNotContains!111 (ListLongMap!3089 (_ BitVec 64) V!6993 (_ BitVec 64)) Unit!6470)

(assert (=> b!213989 (= lt!110763 (addStillNotContains!111 lt!110766 lt!110765 lt!110767 lt!110762))))

(assert (=> b!213989 (= lt!110762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213989 (= lt!110767 (get!2598 (select (arr!4850 _values!649) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213989 (= lt!110765 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213989 (= lt!110766 call!20272)))

(assert (=> b!213989 (= e!139120 (+!589 call!20272 (tuple2!4175 (select (arr!4851 _keys!825) #b00000000000000000000000000000000) (get!2598 (select (arr!4850 _values!649) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213990 () Bool)

(assert (=> b!213990 (= e!139122 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213990 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!58311 c!36014) b!213979))

(assert (= (and d!58311 (not c!36014)) b!213985))

(assert (= (and b!213985 c!36017) b!213989))

(assert (= (and b!213985 (not c!36017)) b!213983))

(assert (= (or b!213989 b!213983) bm!20269))

(assert (= (and d!58311 res!104770) b!213988))

(assert (= (and b!213988 res!104768) b!213984))

(assert (= (and b!213984 res!104769) b!213990))

(assert (= (and b!213984 c!36015) b!213986))

(assert (= (and b!213984 (not c!36015)) b!213981))

(assert (= (and b!213986 res!104767) b!213980))

(assert (= (and b!213981 c!36016) b!213987))

(assert (= (and b!213981 (not c!36016)) b!213982))

(declare-fun b_lambda!7827 () Bool)

(assert (=> (not b_lambda!7827) (not b!213980)))

(assert (=> b!213980 t!8007))

(declare-fun b_and!12547 () Bool)

(assert (= b_and!12545 (and (=> t!8007 result!5019) b_and!12547)))

(declare-fun b_lambda!7829 () Bool)

(assert (=> (not b_lambda!7829) (not b!213989)))

(assert (=> b!213989 t!8007))

(declare-fun b_and!12549 () Bool)

(assert (= b_and!12547 (and (=> t!8007 result!5019) b_and!12549)))

(declare-fun m!241967 () Bool)

(assert (=> b!213980 m!241967))

(assert (=> b!213980 m!241919))

(declare-fun m!241969 () Bool)

(assert (=> b!213980 m!241969))

(assert (=> b!213980 m!241915))

(declare-fun m!241971 () Bool)

(assert (=> b!213980 m!241971))

(assert (=> b!213980 m!241915))

(assert (=> b!213980 m!241967))

(assert (=> b!213980 m!241919))

(assert (=> b!213990 m!241915))

(assert (=> b!213990 m!241915))

(assert (=> b!213990 m!241917))

(declare-fun m!241973 () Bool)

(assert (=> b!213987 m!241973))

(declare-fun m!241975 () Bool)

(assert (=> d!58311 m!241975))

(assert (=> d!58311 m!241839))

(assert (=> b!213986 m!241915))

(assert (=> b!213986 m!241915))

(declare-fun m!241977 () Bool)

(assert (=> b!213986 m!241977))

(assert (=> bm!20269 m!241973))

(declare-fun m!241979 () Bool)

(assert (=> b!213988 m!241979))

(assert (=> b!213985 m!241915))

(assert (=> b!213985 m!241915))

(assert (=> b!213985 m!241917))

(declare-fun m!241981 () Bool)

(assert (=> b!213982 m!241981))

(declare-fun m!241983 () Bool)

(assert (=> b!213989 m!241983))

(declare-fun m!241985 () Bool)

(assert (=> b!213989 m!241985))

(declare-fun m!241987 () Bool)

(assert (=> b!213989 m!241987))

(assert (=> b!213989 m!241967))

(assert (=> b!213989 m!241919))

(assert (=> b!213989 m!241969))

(assert (=> b!213989 m!241915))

(assert (=> b!213989 m!241967))

(declare-fun m!241989 () Bool)

(assert (=> b!213989 m!241989))

(assert (=> b!213989 m!241919))

(assert (=> b!213989 m!241983))

(assert (=> b!213813 d!58311))

(declare-fun b!213991 () Bool)

(declare-fun e!139126 () ListLongMap!3089)

(assert (=> b!213991 (= e!139126 (ListLongMap!3090 Nil!3054))))

(declare-fun b!213992 () Bool)

(assert (=> b!213992 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(assert (=> b!213992 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5175 lt!110620)))))

(declare-fun e!139128 () Bool)

(declare-fun lt!110771 () ListLongMap!3089)

(assert (=> b!213992 (= e!139128 (= (apply!200 lt!110771 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)) (get!2598 (select (arr!4850 lt!110620) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213993 () Bool)

(declare-fun e!139125 () Bool)

(declare-fun e!139131 () Bool)

(assert (=> b!213993 (= e!139125 e!139131)))

(declare-fun c!36020 () Bool)

(assert (=> b!213993 (= c!36020 (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun b!213994 () Bool)

(assert (=> b!213994 (= e!139131 (isEmpty!507 lt!110771))))

(declare-fun b!213995 () Bool)

(declare-fun e!139127 () ListLongMap!3089)

(declare-fun call!20273 () ListLongMap!3089)

(assert (=> b!213995 (= e!139127 call!20273)))

(declare-fun b!213996 () Bool)

(declare-fun e!139130 () Bool)

(assert (=> b!213996 (= e!139130 e!139125)))

(declare-fun c!36019 () Bool)

(declare-fun e!139129 () Bool)

(assert (=> b!213996 (= c!36019 e!139129)))

(declare-fun res!104773 () Bool)

(assert (=> b!213996 (=> (not res!104773) (not e!139129))))

(assert (=> b!213996 (= res!104773 (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun bm!20270 () Bool)

(assert (=> bm!20270 (= call!20273 (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213997 () Bool)

(assert (=> b!213997 (= e!139126 e!139127)))

(declare-fun c!36021 () Bool)

(assert (=> b!213997 (= c!36021 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213998 () Bool)

(assert (=> b!213998 (= e!139125 e!139128)))

(assert (=> b!213998 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun res!104771 () Bool)

(assert (=> b!213998 (= res!104771 (contains!1405 lt!110771 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213998 (=> (not res!104771) (not e!139128))))

(declare-fun b!213999 () Bool)

(assert (=> b!213999 (= e!139131 (= lt!110771 (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!58313 () Bool)

(assert (=> d!58313 e!139130))

(declare-fun res!104774 () Bool)

(assert (=> d!58313 (=> (not res!104774) (not e!139130))))

(assert (=> d!58313 (= res!104774 (not (contains!1405 lt!110771 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58313 (= lt!110771 e!139126)))

(declare-fun c!36018 () Bool)

(assert (=> d!58313 (= c!36018 (bvsge #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(assert (=> d!58313 (validMask!0 mask!1149)))

(assert (=> d!58313 (= (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110620 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110771)))

(declare-fun b!214000 () Bool)

(declare-fun res!104772 () Bool)

(assert (=> b!214000 (=> (not res!104772) (not e!139130))))

(assert (=> b!214000 (= res!104772 (not (contains!1405 lt!110771 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!214001 () Bool)

(declare-fun lt!110775 () Unit!6470)

(declare-fun lt!110770 () Unit!6470)

(assert (=> b!214001 (= lt!110775 lt!110770)))

(declare-fun lt!110774 () V!6993)

(declare-fun lt!110773 () ListLongMap!3089)

(declare-fun lt!110769 () (_ BitVec 64))

(declare-fun lt!110772 () (_ BitVec 64))

(assert (=> b!214001 (not (contains!1405 (+!589 lt!110773 (tuple2!4175 lt!110772 lt!110774)) lt!110769))))

(assert (=> b!214001 (= lt!110770 (addStillNotContains!111 lt!110773 lt!110772 lt!110774 lt!110769))))

(assert (=> b!214001 (= lt!110769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!214001 (= lt!110774 (get!2598 (select (arr!4850 lt!110620) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214001 (= lt!110772 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!214001 (= lt!110773 call!20273)))

(assert (=> b!214001 (= e!139127 (+!589 call!20273 (tuple2!4175 (select (arr!4851 _keys!825) #b00000000000000000000000000000000) (get!2598 (select (arr!4850 lt!110620) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!214002 () Bool)

(assert (=> b!214002 (= e!139129 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!214002 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!58313 c!36018) b!213991))

(assert (= (and d!58313 (not c!36018)) b!213997))

(assert (= (and b!213997 c!36021) b!214001))

(assert (= (and b!213997 (not c!36021)) b!213995))

(assert (= (or b!214001 b!213995) bm!20270))

(assert (= (and d!58313 res!104774) b!214000))

(assert (= (and b!214000 res!104772) b!213996))

(assert (= (and b!213996 res!104773) b!214002))

(assert (= (and b!213996 c!36019) b!213998))

(assert (= (and b!213996 (not c!36019)) b!213993))

(assert (= (and b!213998 res!104771) b!213992))

(assert (= (and b!213993 c!36020) b!213999))

(assert (= (and b!213993 (not c!36020)) b!213994))

(declare-fun b_lambda!7831 () Bool)

(assert (=> (not b_lambda!7831) (not b!213992)))

(assert (=> b!213992 t!8007))

(declare-fun b_and!12551 () Bool)

(assert (= b_and!12549 (and (=> t!8007 result!5019) b_and!12551)))

(declare-fun b_lambda!7833 () Bool)

(assert (=> (not b_lambda!7833) (not b!214001)))

(assert (=> b!214001 t!8007))

(declare-fun b_and!12553 () Bool)

(assert (= b_and!12551 (and (=> t!8007 result!5019) b_and!12553)))

(assert (=> b!213992 m!241921))

(assert (=> b!213992 m!241919))

(assert (=> b!213992 m!241923))

(assert (=> b!213992 m!241915))

(declare-fun m!241991 () Bool)

(assert (=> b!213992 m!241991))

(assert (=> b!213992 m!241915))

(assert (=> b!213992 m!241921))

(assert (=> b!213992 m!241919))

(assert (=> b!214002 m!241915))

(assert (=> b!214002 m!241915))

(assert (=> b!214002 m!241917))

(declare-fun m!241993 () Bool)

(assert (=> b!213999 m!241993))

(declare-fun m!241995 () Bool)

(assert (=> d!58313 m!241995))

(assert (=> d!58313 m!241839))

(assert (=> b!213998 m!241915))

(assert (=> b!213998 m!241915))

(declare-fun m!241997 () Bool)

(assert (=> b!213998 m!241997))

(assert (=> bm!20270 m!241993))

(declare-fun m!241999 () Bool)

(assert (=> b!214000 m!241999))

(assert (=> b!213997 m!241915))

(assert (=> b!213997 m!241915))

(assert (=> b!213997 m!241917))

(declare-fun m!242001 () Bool)

(assert (=> b!213994 m!242001))

(declare-fun m!242003 () Bool)

(assert (=> b!214001 m!242003))

(declare-fun m!242005 () Bool)

(assert (=> b!214001 m!242005))

(declare-fun m!242007 () Bool)

(assert (=> b!214001 m!242007))

(assert (=> b!214001 m!241921))

(assert (=> b!214001 m!241919))

(assert (=> b!214001 m!241923))

(assert (=> b!214001 m!241915))

(assert (=> b!214001 m!241921))

(declare-fun m!242009 () Bool)

(assert (=> b!214001 m!242009))

(assert (=> b!214001 m!241919))

(assert (=> b!214001 m!242003))

(assert (=> b!213813 d!58313))

(declare-fun d!58315 () Bool)

(declare-fun e!139137 () Bool)

(assert (=> d!58315 e!139137))

(declare-fun res!104777 () Bool)

(assert (=> d!58315 (=> (not res!104777) (not e!139137))))

(assert (=> d!58315 (= res!104777 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5175 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5175 _values!649))))))))

(declare-fun lt!110778 () Unit!6470)

(declare-fun choose!1091 (array!10223 array!10221 (_ BitVec 32) (_ BitVec 32) V!6993 V!6993 (_ BitVec 32) (_ BitVec 64) V!6993 (_ BitVec 32) Int) Unit!6470)

(assert (=> d!58315 (= lt!110778 (choose!1091 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58315 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(assert (=> d!58315 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!234 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!110778)))

(declare-fun b!214009 () Bool)

(declare-fun e!139136 () Bool)

(declare-fun call!20278 () ListLongMap!3089)

(declare-fun call!20279 () ListLongMap!3089)

(assert (=> b!214009 (= e!139136 (= call!20278 call!20279))))

(declare-fun b!214010 () Bool)

(assert (=> b!214010 (= e!139137 e!139136)))

(declare-fun c!36024 () Bool)

(assert (=> b!214010 (= c!36024 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun bm!20275 () Bool)

(assert (=> bm!20275 (= call!20279 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!214011 () Bool)

(assert (=> b!214011 (= e!139136 (= call!20278 (+!589 call!20279 (tuple2!4175 k0!843 v!520))))))

(declare-fun bm!20276 () Bool)

(assert (=> bm!20276 (= call!20278 (getCurrentListMapNoExtraKeys!516 _keys!825 (array!10222 (store (arr!4850 _values!649) i!601 (ValueCellFull!2411 v!520)) (size!5175 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58315 res!104777) b!214010))

(assert (= (and b!214010 c!36024) b!214011))

(assert (= (and b!214010 (not c!36024)) b!214009))

(assert (= (or b!214011 b!214009) bm!20276))

(assert (= (or b!214011 b!214009) bm!20275))

(declare-fun m!242011 () Bool)

(assert (=> d!58315 m!242011))

(assert (=> bm!20275 m!241835))

(declare-fun m!242013 () Bool)

(assert (=> b!214011 m!242013))

(assert (=> bm!20276 m!241827))

(declare-fun m!242015 () Bool)

(assert (=> bm!20276 m!242015))

(assert (=> b!213813 d!58315))

(declare-fun d!58317 () Bool)

(declare-fun e!139140 () Bool)

(assert (=> d!58317 e!139140))

(declare-fun res!104782 () Bool)

(assert (=> d!58317 (=> (not res!104782) (not e!139140))))

(declare-fun lt!110788 () ListLongMap!3089)

(assert (=> d!58317 (= res!104782 (contains!1405 lt!110788 (_1!2098 lt!110623)))))

(declare-fun lt!110789 () List!3057)

(assert (=> d!58317 (= lt!110788 (ListLongMap!3090 lt!110789))))

(declare-fun lt!110790 () Unit!6470)

(declare-fun lt!110787 () Unit!6470)

(assert (=> d!58317 (= lt!110790 lt!110787)))

(declare-datatypes ((Option!265 0))(
  ( (Some!264 (v!4820 V!6993)) (None!263) )
))
(declare-fun getValueByKey!259 (List!3057 (_ BitVec 64)) Option!265)

(assert (=> d!58317 (= (getValueByKey!259 lt!110789 (_1!2098 lt!110623)) (Some!264 (_2!2098 lt!110623)))))

(declare-fun lemmaContainsTupThenGetReturnValue!146 (List!3057 (_ BitVec 64) V!6993) Unit!6470)

(assert (=> d!58317 (= lt!110787 (lemmaContainsTupThenGetReturnValue!146 lt!110789 (_1!2098 lt!110623) (_2!2098 lt!110623)))))

(declare-fun insertStrictlySorted!149 (List!3057 (_ BitVec 64) V!6993) List!3057)

(assert (=> d!58317 (= lt!110789 (insertStrictlySorted!149 (toList!1560 lt!110621) (_1!2098 lt!110623) (_2!2098 lt!110623)))))

(assert (=> d!58317 (= (+!589 lt!110621 lt!110623) lt!110788)))

(declare-fun b!214016 () Bool)

(declare-fun res!104783 () Bool)

(assert (=> b!214016 (=> (not res!104783) (not e!139140))))

(assert (=> b!214016 (= res!104783 (= (getValueByKey!259 (toList!1560 lt!110788) (_1!2098 lt!110623)) (Some!264 (_2!2098 lt!110623))))))

(declare-fun b!214017 () Bool)

(declare-fun contains!1406 (List!3057 tuple2!4174) Bool)

(assert (=> b!214017 (= e!139140 (contains!1406 (toList!1560 lt!110788) lt!110623))))

(assert (= (and d!58317 res!104782) b!214016))

(assert (= (and b!214016 res!104783) b!214017))

(declare-fun m!242017 () Bool)

(assert (=> d!58317 m!242017))

(declare-fun m!242019 () Bool)

(assert (=> d!58317 m!242019))

(declare-fun m!242021 () Bool)

(assert (=> d!58317 m!242021))

(declare-fun m!242023 () Bool)

(assert (=> d!58317 m!242023))

(declare-fun m!242025 () Bool)

(assert (=> b!214016 m!242025))

(declare-fun m!242027 () Bool)

(assert (=> b!214017 m!242027))

(assert (=> b!213813 d!58317))

(declare-fun bm!20277 () Bool)

(declare-fun call!20281 () ListLongMap!3089)

(declare-fun call!20282 () ListLongMap!3089)

(assert (=> bm!20277 (= call!20281 call!20282)))

(declare-fun c!36026 () Bool)

(declare-fun call!20280 () ListLongMap!3089)

(declare-fun bm!20278 () Bool)

(declare-fun call!20285 () ListLongMap!3089)

(declare-fun c!36025 () Bool)

(assert (=> bm!20278 (= call!20285 (+!589 (ite c!36025 call!20280 (ite c!36026 call!20282 call!20281)) (ite (or c!36025 c!36026) (tuple2!4175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!214018 () Bool)

(declare-fun e!139149 () ListLongMap!3089)

(assert (=> b!214018 (= e!139149 call!20281)))

(declare-fun b!214019 () Bool)

(declare-fun e!139153 () ListLongMap!3089)

(assert (=> b!214019 (= e!139153 (+!589 call!20285 (tuple2!4175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20279 () Bool)

(declare-fun call!20286 () Bool)

(declare-fun lt!110794 () ListLongMap!3089)

(assert (=> bm!20279 (= call!20286 (contains!1405 lt!110794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!214020 () Bool)

(declare-fun e!139148 () ListLongMap!3089)

(declare-fun call!20283 () ListLongMap!3089)

(assert (=> b!214020 (= e!139148 call!20283)))

(declare-fun b!214021 () Bool)

(declare-fun e!139150 () Bool)

(assert (=> b!214021 (= e!139150 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!214022 () Bool)

(declare-fun e!139147 () Bool)

(assert (=> b!214022 (= e!139147 (not call!20286))))

(declare-fun b!214023 () Bool)

(declare-fun c!36030 () Bool)

(assert (=> b!214023 (= c!36030 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!214023 (= e!139148 e!139149)))

(declare-fun bm!20280 () Bool)

(assert (=> bm!20280 (= call!20283 call!20285)))

(declare-fun b!214024 () Bool)

(declare-fun e!139144 () Bool)

(assert (=> b!214024 (= e!139144 (= (apply!200 lt!110794 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20281 () Bool)

(assert (=> bm!20281 (= call!20280 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!214025 () Bool)

(declare-fun e!139152 () Bool)

(assert (=> b!214025 (= e!139147 e!139152)))

(declare-fun res!104786 () Bool)

(assert (=> b!214025 (= res!104786 call!20286)))

(assert (=> b!214025 (=> (not res!104786) (not e!139152))))

(declare-fun b!214026 () Bool)

(declare-fun e!139146 () Bool)

(declare-fun call!20284 () Bool)

(assert (=> b!214026 (= e!139146 (not call!20284))))

(declare-fun b!214027 () Bool)

(declare-fun e!139151 () Bool)

(assert (=> b!214027 (= e!139151 (= (apply!200 lt!110794 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)) (get!2598 (select (arr!4850 _values!649) #b00000000000000000000000000000000) (dynLambda!543 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!214027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5175 _values!649)))))

(assert (=> b!214027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun b!214028 () Bool)

(declare-fun res!104790 () Bool)

(declare-fun e!139141 () Bool)

(assert (=> b!214028 (=> (not res!104790) (not e!139141))))

(assert (=> b!214028 (= res!104790 e!139147)))

(declare-fun c!36028 () Bool)

(assert (=> b!214028 (= c!36028 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!214029 () Bool)

(assert (=> b!214029 (= e!139152 (= (apply!200 lt!110794 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!214030 () Bool)

(declare-fun e!139143 () Bool)

(assert (=> b!214030 (= e!139143 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!214031 () Bool)

(assert (=> b!214031 (= e!139149 call!20283)))

(declare-fun b!214032 () Bool)

(declare-fun res!104791 () Bool)

(assert (=> b!214032 (=> (not res!104791) (not e!139141))))

(declare-fun e!139142 () Bool)

(assert (=> b!214032 (= res!104791 e!139142)))

(declare-fun res!104787 () Bool)

(assert (=> b!214032 (=> res!104787 e!139142)))

(assert (=> b!214032 (= res!104787 (not e!139150))))

(declare-fun res!104789 () Bool)

(assert (=> b!214032 (=> (not res!104789) (not e!139150))))

(assert (=> b!214032 (= res!104789 (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun bm!20282 () Bool)

(assert (=> bm!20282 (= call!20282 call!20280)))

(declare-fun b!214033 () Bool)

(assert (=> b!214033 (= e!139142 e!139151)))

(declare-fun res!104792 () Bool)

(assert (=> b!214033 (=> (not res!104792) (not e!139151))))

(assert (=> b!214033 (= res!104792 (contains!1405 lt!110794 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!214033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(declare-fun d!58319 () Bool)

(assert (=> d!58319 e!139141))

(declare-fun res!104784 () Bool)

(assert (=> d!58319 (=> (not res!104784) (not e!139141))))

(assert (=> d!58319 (= res!104784 (or (bvsge #b00000000000000000000000000000000 (size!5176 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))))

(declare-fun lt!110806 () ListLongMap!3089)

(assert (=> d!58319 (= lt!110794 lt!110806)))

(declare-fun lt!110795 () Unit!6470)

(declare-fun e!139145 () Unit!6470)

(assert (=> d!58319 (= lt!110795 e!139145)))

(declare-fun c!36027 () Bool)

(assert (=> d!58319 (= c!36027 e!139143)))

(declare-fun res!104788 () Bool)

(assert (=> d!58319 (=> (not res!104788) (not e!139143))))

(assert (=> d!58319 (= res!104788 (bvslt #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(assert (=> d!58319 (= lt!110806 e!139153)))

(assert (=> d!58319 (= c!36025 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58319 (validMask!0 mask!1149)))

(assert (=> d!58319 (= (getCurrentListMap!1093 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110794)))

(declare-fun b!214034 () Bool)

(assert (=> b!214034 (= e!139153 e!139148)))

(assert (=> b!214034 (= c!36026 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20283 () Bool)

(assert (=> bm!20283 (= call!20284 (contains!1405 lt!110794 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!214035 () Bool)

(assert (=> b!214035 (= e!139141 e!139146)))

(declare-fun c!36029 () Bool)

(assert (=> b!214035 (= c!36029 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!214036 () Bool)

(declare-fun lt!110807 () Unit!6470)

(assert (=> b!214036 (= e!139145 lt!110807)))

(declare-fun lt!110798 () ListLongMap!3089)

(assert (=> b!214036 (= lt!110798 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110812 () (_ BitVec 64))

(assert (=> b!214036 (= lt!110812 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110809 () (_ BitVec 64))

(assert (=> b!214036 (= lt!110809 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110804 () Unit!6470)

(assert (=> b!214036 (= lt!110804 (addStillContains!176 lt!110798 lt!110812 zeroValue!615 lt!110809))))

(assert (=> b!214036 (contains!1405 (+!589 lt!110798 (tuple2!4175 lt!110812 zeroValue!615)) lt!110809)))

(declare-fun lt!110792 () Unit!6470)

(assert (=> b!214036 (= lt!110792 lt!110804)))

(declare-fun lt!110800 () ListLongMap!3089)

(assert (=> b!214036 (= lt!110800 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110802 () (_ BitVec 64))

(assert (=> b!214036 (= lt!110802 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110799 () (_ BitVec 64))

(assert (=> b!214036 (= lt!110799 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110803 () Unit!6470)

(assert (=> b!214036 (= lt!110803 (addApplyDifferent!176 lt!110800 lt!110802 minValue!615 lt!110799))))

(assert (=> b!214036 (= (apply!200 (+!589 lt!110800 (tuple2!4175 lt!110802 minValue!615)) lt!110799) (apply!200 lt!110800 lt!110799))))

(declare-fun lt!110808 () Unit!6470)

(assert (=> b!214036 (= lt!110808 lt!110803)))

(declare-fun lt!110791 () ListLongMap!3089)

(assert (=> b!214036 (= lt!110791 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110793 () (_ BitVec 64))

(assert (=> b!214036 (= lt!110793 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110805 () (_ BitVec 64))

(assert (=> b!214036 (= lt!110805 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110810 () Unit!6470)

(assert (=> b!214036 (= lt!110810 (addApplyDifferent!176 lt!110791 lt!110793 zeroValue!615 lt!110805))))

(assert (=> b!214036 (= (apply!200 (+!589 lt!110791 (tuple2!4175 lt!110793 zeroValue!615)) lt!110805) (apply!200 lt!110791 lt!110805))))

(declare-fun lt!110796 () Unit!6470)

(assert (=> b!214036 (= lt!110796 lt!110810)))

(declare-fun lt!110801 () ListLongMap!3089)

(assert (=> b!214036 (= lt!110801 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110797 () (_ BitVec 64))

(assert (=> b!214036 (= lt!110797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110811 () (_ BitVec 64))

(assert (=> b!214036 (= lt!110811 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!214036 (= lt!110807 (addApplyDifferent!176 lt!110801 lt!110797 minValue!615 lt!110811))))

(assert (=> b!214036 (= (apply!200 (+!589 lt!110801 (tuple2!4175 lt!110797 minValue!615)) lt!110811) (apply!200 lt!110801 lt!110811))))

(declare-fun b!214037 () Bool)

(declare-fun Unit!6473 () Unit!6470)

(assert (=> b!214037 (= e!139145 Unit!6473)))

(declare-fun b!214038 () Bool)

(assert (=> b!214038 (= e!139146 e!139144)))

(declare-fun res!104785 () Bool)

(assert (=> b!214038 (= res!104785 call!20284)))

(assert (=> b!214038 (=> (not res!104785) (not e!139144))))

(assert (= (and d!58319 c!36025) b!214019))

(assert (= (and d!58319 (not c!36025)) b!214034))

(assert (= (and b!214034 c!36026) b!214020))

(assert (= (and b!214034 (not c!36026)) b!214023))

(assert (= (and b!214023 c!36030) b!214031))

(assert (= (and b!214023 (not c!36030)) b!214018))

(assert (= (or b!214031 b!214018) bm!20277))

(assert (= (or b!214020 bm!20277) bm!20282))

(assert (= (or b!214020 b!214031) bm!20280))

(assert (= (or b!214019 bm!20282) bm!20281))

(assert (= (or b!214019 bm!20280) bm!20278))

(assert (= (and d!58319 res!104788) b!214030))

(assert (= (and d!58319 c!36027) b!214036))

(assert (= (and d!58319 (not c!36027)) b!214037))

(assert (= (and d!58319 res!104784) b!214032))

(assert (= (and b!214032 res!104789) b!214021))

(assert (= (and b!214032 (not res!104787)) b!214033))

(assert (= (and b!214033 res!104792) b!214027))

(assert (= (and b!214032 res!104791) b!214028))

(assert (= (and b!214028 c!36028) b!214025))

(assert (= (and b!214028 (not c!36028)) b!214022))

(assert (= (and b!214025 res!104786) b!214029))

(assert (= (or b!214025 b!214022) bm!20279))

(assert (= (and b!214028 res!104790) b!214035))

(assert (= (and b!214035 c!36029) b!214038))

(assert (= (and b!214035 (not c!36029)) b!214026))

(assert (= (and b!214038 res!104785) b!214024))

(assert (= (or b!214038 b!214026) bm!20283))

(declare-fun b_lambda!7835 () Bool)

(assert (=> (not b_lambda!7835) (not b!214027)))

(assert (=> b!214027 t!8007))

(declare-fun b_and!12555 () Bool)

(assert (= b_and!12553 (and (=> t!8007 result!5019) b_and!12555)))

(declare-fun m!242029 () Bool)

(assert (=> b!214029 m!242029))

(declare-fun m!242031 () Bool)

(assert (=> bm!20279 m!242031))

(assert (=> b!214021 m!241915))

(assert (=> b!214021 m!241915))

(assert (=> b!214021 m!241917))

(assert (=> bm!20281 m!241835))

(assert (=> b!214030 m!241915))

(assert (=> b!214030 m!241915))

(assert (=> b!214030 m!241917))

(assert (=> d!58319 m!241839))

(assert (=> b!214027 m!241919))

(assert (=> b!214027 m!241915))

(assert (=> b!214027 m!241967))

(assert (=> b!214027 m!241919))

(assert (=> b!214027 m!241969))

(assert (=> b!214027 m!241915))

(declare-fun m!242033 () Bool)

(assert (=> b!214027 m!242033))

(assert (=> b!214027 m!241967))

(declare-fun m!242035 () Bool)

(assert (=> b!214036 m!242035))

(declare-fun m!242037 () Bool)

(assert (=> b!214036 m!242037))

(declare-fun m!242039 () Bool)

(assert (=> b!214036 m!242039))

(declare-fun m!242041 () Bool)

(assert (=> b!214036 m!242041))

(declare-fun m!242043 () Bool)

(assert (=> b!214036 m!242043))

(declare-fun m!242045 () Bool)

(assert (=> b!214036 m!242045))

(assert (=> b!214036 m!242045))

(declare-fun m!242047 () Bool)

(assert (=> b!214036 m!242047))

(declare-fun m!242049 () Bool)

(assert (=> b!214036 m!242049))

(assert (=> b!214036 m!242041))

(declare-fun m!242051 () Bool)

(assert (=> b!214036 m!242051))

(declare-fun m!242053 () Bool)

(assert (=> b!214036 m!242053))

(assert (=> b!214036 m!242037))

(assert (=> b!214036 m!242035))

(declare-fun m!242055 () Bool)

(assert (=> b!214036 m!242055))

(assert (=> b!214036 m!241835))

(declare-fun m!242057 () Bool)

(assert (=> b!214036 m!242057))

(declare-fun m!242059 () Bool)

(assert (=> b!214036 m!242059))

(declare-fun m!242061 () Bool)

(assert (=> b!214036 m!242061))

(declare-fun m!242063 () Bool)

(assert (=> b!214036 m!242063))

(assert (=> b!214036 m!241915))

(assert (=> b!214033 m!241915))

(assert (=> b!214033 m!241915))

(declare-fun m!242065 () Bool)

(assert (=> b!214033 m!242065))

(declare-fun m!242067 () Bool)

(assert (=> b!214024 m!242067))

(declare-fun m!242069 () Bool)

(assert (=> bm!20278 m!242069))

(declare-fun m!242071 () Bool)

(assert (=> bm!20283 m!242071))

(declare-fun m!242073 () Bool)

(assert (=> b!214019 m!242073))

(assert (=> b!213813 d!58319))

(declare-fun bm!20286 () Bool)

(declare-fun call!20289 () Bool)

(assert (=> bm!20286 (= call!20289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun d!58321 () Bool)

(declare-fun res!104797 () Bool)

(declare-fun e!139160 () Bool)

(assert (=> d!58321 (=> res!104797 e!139160)))

(assert (=> d!58321 (= res!104797 (bvsge #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(assert (=> d!58321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!139160)))

(declare-fun b!214047 () Bool)

(declare-fun e!139162 () Bool)

(assert (=> b!214047 (= e!139162 call!20289)))

(declare-fun b!214048 () Bool)

(assert (=> b!214048 (= e!139160 e!139162)))

(declare-fun c!36033 () Bool)

(assert (=> b!214048 (= c!36033 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!214049 () Bool)

(declare-fun e!139161 () Bool)

(assert (=> b!214049 (= e!139162 e!139161)))

(declare-fun lt!110821 () (_ BitVec 64))

(assert (=> b!214049 (= lt!110821 (select (arr!4851 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110820 () Unit!6470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10223 (_ BitVec 64) (_ BitVec 32)) Unit!6470)

(assert (=> b!214049 (= lt!110820 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!110821 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!214049 (arrayContainsKey!0 _keys!825 lt!110821 #b00000000000000000000000000000000)))

(declare-fun lt!110819 () Unit!6470)

(assert (=> b!214049 (= lt!110819 lt!110820)))

(declare-fun res!104798 () Bool)

(declare-datatypes ((SeekEntryResult!704 0))(
  ( (MissingZero!704 (index!4986 (_ BitVec 32))) (Found!704 (index!4987 (_ BitVec 32))) (Intermediate!704 (undefined!1516 Bool) (index!4988 (_ BitVec 32)) (x!22263 (_ BitVec 32))) (Undefined!704) (MissingVacant!704 (index!4989 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10223 (_ BitVec 32)) SeekEntryResult!704)

(assert (=> b!214049 (= res!104798 (= (seekEntryOrOpen!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!704 #b00000000000000000000000000000000)))))

(assert (=> b!214049 (=> (not res!104798) (not e!139161))))

(declare-fun b!214050 () Bool)

(assert (=> b!214050 (= e!139161 call!20289)))

(assert (= (and d!58321 (not res!104797)) b!214048))

(assert (= (and b!214048 c!36033) b!214049))

(assert (= (and b!214048 (not c!36033)) b!214047))

(assert (= (and b!214049 res!104798) b!214050))

(assert (= (or b!214050 b!214047) bm!20286))

(declare-fun m!242075 () Bool)

(assert (=> bm!20286 m!242075))

(assert (=> b!214048 m!241915))

(assert (=> b!214048 m!241915))

(assert (=> b!214048 m!241917))

(assert (=> b!214049 m!241915))

(declare-fun m!242077 () Bool)

(assert (=> b!214049 m!242077))

(declare-fun m!242079 () Bool)

(assert (=> b!214049 m!242079))

(assert (=> b!214049 m!241915))

(declare-fun m!242081 () Bool)

(assert (=> b!214049 m!242081))

(assert (=> b!213819 d!58321))

(declare-fun d!58323 () Bool)

(assert (=> d!58323 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21220 d!58323))

(declare-fun d!58325 () Bool)

(assert (=> d!58325 (= (array_inv!3185 _values!649) (bvsge (size!5175 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21220 d!58325))

(declare-fun d!58327 () Bool)

(assert (=> d!58327 (= (array_inv!3186 _keys!825) (bvsge (size!5176 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21220 d!58327))

(declare-fun b!214061 () Bool)

(declare-fun e!139171 () Bool)

(declare-fun e!139172 () Bool)

(assert (=> b!214061 (= e!139171 e!139172)))

(declare-fun c!36036 () Bool)

(assert (=> b!214061 (= c!36036 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!214062 () Bool)

(declare-fun call!20292 () Bool)

(assert (=> b!214062 (= e!139172 call!20292)))

(declare-fun b!214063 () Bool)

(assert (=> b!214063 (= e!139172 call!20292)))

(declare-fun d!58329 () Bool)

(declare-fun res!104807 () Bool)

(declare-fun e!139173 () Bool)

(assert (=> d!58329 (=> res!104807 e!139173)))

(assert (=> d!58329 (= res!104807 (bvsge #b00000000000000000000000000000000 (size!5176 _keys!825)))))

(assert (=> d!58329 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3055) e!139173)))

(declare-fun b!214064 () Bool)

(declare-fun e!139174 () Bool)

(declare-fun contains!1407 (List!3058 (_ BitVec 64)) Bool)

(assert (=> b!214064 (= e!139174 (contains!1407 Nil!3055 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20289 () Bool)

(assert (=> bm!20289 (= call!20292 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36036 (Cons!3054 (select (arr!4851 _keys!825) #b00000000000000000000000000000000) Nil!3055) Nil!3055)))))

(declare-fun b!214065 () Bool)

(assert (=> b!214065 (= e!139173 e!139171)))

(declare-fun res!104806 () Bool)

(assert (=> b!214065 (=> (not res!104806) (not e!139171))))

(assert (=> b!214065 (= res!104806 (not e!139174))))

(declare-fun res!104805 () Bool)

(assert (=> b!214065 (=> (not res!104805) (not e!139174))))

(assert (=> b!214065 (= res!104805 (validKeyInArray!0 (select (arr!4851 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58329 (not res!104807)) b!214065))

(assert (= (and b!214065 res!104805) b!214064))

(assert (= (and b!214065 res!104806) b!214061))

(assert (= (and b!214061 c!36036) b!214062))

(assert (= (and b!214061 (not c!36036)) b!214063))

(assert (= (or b!214062 b!214063) bm!20289))

(assert (=> b!214061 m!241915))

(assert (=> b!214061 m!241915))

(assert (=> b!214061 m!241917))

(assert (=> b!214064 m!241915))

(assert (=> b!214064 m!241915))

(declare-fun m!242083 () Bool)

(assert (=> b!214064 m!242083))

(assert (=> bm!20289 m!241915))

(declare-fun m!242085 () Bool)

(assert (=> bm!20289 m!242085))

(assert (=> b!214065 m!241915))

(assert (=> b!214065 m!241915))

(assert (=> b!214065 m!241917))

(assert (=> b!213822 d!58329))

(declare-fun d!58331 () Bool)

(declare-fun e!139175 () Bool)

(assert (=> d!58331 e!139175))

(declare-fun res!104808 () Bool)

(assert (=> d!58331 (=> (not res!104808) (not e!139175))))

(declare-fun lt!110823 () ListLongMap!3089)

(assert (=> d!58331 (= res!104808 (contains!1405 lt!110823 (_1!2098 lt!110623)))))

(declare-fun lt!110824 () List!3057)

(assert (=> d!58331 (= lt!110823 (ListLongMap!3090 lt!110824))))

(declare-fun lt!110825 () Unit!6470)

(declare-fun lt!110822 () Unit!6470)

(assert (=> d!58331 (= lt!110825 lt!110822)))

(assert (=> d!58331 (= (getValueByKey!259 lt!110824 (_1!2098 lt!110623)) (Some!264 (_2!2098 lt!110623)))))

(assert (=> d!58331 (= lt!110822 (lemmaContainsTupThenGetReturnValue!146 lt!110824 (_1!2098 lt!110623) (_2!2098 lt!110623)))))

(assert (=> d!58331 (= lt!110824 (insertStrictlySorted!149 (toList!1560 lt!110627) (_1!2098 lt!110623) (_2!2098 lt!110623)))))

(assert (=> d!58331 (= (+!589 lt!110627 lt!110623) lt!110823)))

(declare-fun b!214066 () Bool)

(declare-fun res!104809 () Bool)

(assert (=> b!214066 (=> (not res!104809) (not e!139175))))

(assert (=> b!214066 (= res!104809 (= (getValueByKey!259 (toList!1560 lt!110823) (_1!2098 lt!110623)) (Some!264 (_2!2098 lt!110623))))))

(declare-fun b!214067 () Bool)

(assert (=> b!214067 (= e!139175 (contains!1406 (toList!1560 lt!110823) lt!110623))))

(assert (= (and d!58331 res!104808) b!214066))

(assert (= (and b!214066 res!104809) b!214067))

(declare-fun m!242087 () Bool)

(assert (=> d!58331 m!242087))

(declare-fun m!242089 () Bool)

(assert (=> d!58331 m!242089))

(declare-fun m!242091 () Bool)

(assert (=> d!58331 m!242091))

(declare-fun m!242093 () Bool)

(assert (=> d!58331 m!242093))

(declare-fun m!242095 () Bool)

(assert (=> b!214066 m!242095))

(declare-fun m!242097 () Bool)

(assert (=> b!214067 m!242097))

(assert (=> b!213818 d!58331))

(declare-fun condMapEmpty!9374 () Bool)

(declare-fun mapDefault!9374 () ValueCell!2411)

(assert (=> mapNonEmpty!9365 (= condMapEmpty!9374 (= mapRest!9365 ((as const (Array (_ BitVec 32) ValueCell!2411)) mapDefault!9374)))))

(declare-fun e!139180 () Bool)

(declare-fun mapRes!9374 () Bool)

(assert (=> mapNonEmpty!9365 (= tp!20014 (and e!139180 mapRes!9374))))

(declare-fun b!214074 () Bool)

(declare-fun e!139181 () Bool)

(assert (=> b!214074 (= e!139181 tp_is_empty!5509)))

(declare-fun mapIsEmpty!9374 () Bool)

(assert (=> mapIsEmpty!9374 mapRes!9374))

(declare-fun mapNonEmpty!9374 () Bool)

(declare-fun tp!20030 () Bool)

(assert (=> mapNonEmpty!9374 (= mapRes!9374 (and tp!20030 e!139181))))

(declare-fun mapRest!9374 () (Array (_ BitVec 32) ValueCell!2411))

(declare-fun mapValue!9374 () ValueCell!2411)

(declare-fun mapKey!9374 () (_ BitVec 32))

(assert (=> mapNonEmpty!9374 (= mapRest!9365 (store mapRest!9374 mapKey!9374 mapValue!9374))))

(declare-fun b!214075 () Bool)

(assert (=> b!214075 (= e!139180 tp_is_empty!5509)))

(assert (= (and mapNonEmpty!9365 condMapEmpty!9374) mapIsEmpty!9374))

(assert (= (and mapNonEmpty!9365 (not condMapEmpty!9374)) mapNonEmpty!9374))

(assert (= (and mapNonEmpty!9374 ((_ is ValueCellFull!2411) mapValue!9374)) b!214074))

(assert (= (and mapNonEmpty!9365 ((_ is ValueCellFull!2411) mapDefault!9374)) b!214075))

(declare-fun m!242099 () Bool)

(assert (=> mapNonEmpty!9374 m!242099))

(declare-fun b_lambda!7837 () Bool)

(assert (= b_lambda!7827 (or (and start!21220 b_free!5647) b_lambda!7837)))

(declare-fun b_lambda!7839 () Bool)

(assert (= b_lambda!7831 (or (and start!21220 b_free!5647) b_lambda!7839)))

(declare-fun b_lambda!7841 () Bool)

(assert (= b_lambda!7825 (or (and start!21220 b_free!5647) b_lambda!7841)))

(declare-fun b_lambda!7843 () Bool)

(assert (= b_lambda!7833 (or (and start!21220 b_free!5647) b_lambda!7843)))

(declare-fun b_lambda!7845 () Bool)

(assert (= b_lambda!7829 (or (and start!21220 b_free!5647) b_lambda!7845)))

(declare-fun b_lambda!7847 () Bool)

(assert (= b_lambda!7835 (or (and start!21220 b_free!5647) b_lambda!7847)))

(check-sat (not b!214016) (not b!213999) (not b!214067) (not bm!20261) (not bm!20289) (not b!213950) (not b!214065) (not b!213935) (not b!214049) (not b!213944) (not b_next!5647) (not b_lambda!7845) (not b_lambda!7847) (not b!214033) (not b!214024) (not b!214029) (not b!213933) (not b!213987) (not b!214000) (not d!58319) (not bm!20266) (not bm!20270) (not b!213947) (not b_lambda!7837) (not b!214017) (not d!58331) (not b!214064) (not d!58313) (not d!58311) (not d!58309) (not bm!20286) (not b!213938) (not bm!20262) (not bm!20269) (not d!58317) (not b_lambda!7843) (not b!214001) (not b!213990) (not bm!20279) (not b!213986) (not b!213982) (not b!214030) (not b!213941) (not b!213992) (not b!213988) (not b!214048) (not bm!20276) (not b!214061) (not b!214011) b_and!12555 (not b!214066) (not bm!20281) (not b!213943) (not d!58315) (not mapNonEmpty!9374) (not b!213994) (not bm!20278) (not b!214027) (not b!213989) (not b!213985) (not b_lambda!7839) (not b!213998) tp_is_empty!5509 (not b!213980) (not b!214036) (not bm!20275) (not b!214002) (not b_lambda!7841) (not b!213997) (not bm!20283) (not bm!20264) (not b!214019) (not b!214021))
(check-sat b_and!12555 (not b_next!5647))
