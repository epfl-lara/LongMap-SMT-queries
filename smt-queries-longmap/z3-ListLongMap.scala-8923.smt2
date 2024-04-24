; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108430 () Bool)

(assert start!108430)

(declare-fun b_free!27901 () Bool)

(declare-fun b_next!27901 () Bool)

(assert (=> start!108430 (= b_free!27901 (not b_next!27901))))

(declare-fun tp!98660 () Bool)

(declare-fun b_and!45961 () Bool)

(assert (=> start!108430 (= tp!98660 b_and!45961)))

(declare-fun b!1279068 () Bool)

(declare-fun res!849536 () Bool)

(declare-fun e!730620 () Bool)

(assert (=> b!1279068 (=> (not res!849536) (not e!730620))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49705 0))(
  ( (V!49706 (val!16800 Int)) )
))
(declare-fun minValue!1129 () V!49705)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15827 0))(
  ( (ValueCellFull!15827 (v!19393 V!49705)) (EmptyCell!15827) )
))
(declare-datatypes ((array!84023 0))(
  ( (array!84024 (arr!40517 (Array (_ BitVec 32) ValueCell!15827)) (size!41068 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84023)

(declare-fun zeroValue!1129 () V!49705)

(declare-datatypes ((array!84025 0))(
  ( (array!84026 (arr!40518 (Array (_ BitVec 32) (_ BitVec 64))) (size!41069 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!84025)

(declare-datatypes ((tuple2!21572 0))(
  ( (tuple2!21573 (_1!10797 (_ BitVec 64)) (_2!10797 V!49705)) )
))
(declare-datatypes ((List!28761 0))(
  ( (Nil!28758) (Cons!28757 (h!29975 tuple2!21572) (t!42291 List!28761)) )
))
(declare-datatypes ((ListLongMap!19237 0))(
  ( (ListLongMap!19238 (toList!9634 List!28761)) )
))
(declare-fun contains!7759 (ListLongMap!19237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4703 (array!84025 array!84023 (_ BitVec 32) (_ BitVec 32) V!49705 V!49705 (_ BitVec 32) Int) ListLongMap!19237)

(assert (=> b!1279068 (= res!849536 (contains!7759 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1279069 () Bool)

(declare-fun e!730618 () Bool)

(declare-fun tp_is_empty!33451 () Bool)

(assert (=> b!1279069 (= e!730618 tp_is_empty!33451)))

(declare-fun mapNonEmpty!51710 () Bool)

(declare-fun mapRes!51710 () Bool)

(declare-fun tp!98659 () Bool)

(declare-fun e!730617 () Bool)

(assert (=> mapNonEmpty!51710 (= mapRes!51710 (and tp!98659 e!730617))))

(declare-fun mapRest!51710 () (Array (_ BitVec 32) ValueCell!15827))

(declare-fun mapKey!51710 () (_ BitVec 32))

(declare-fun mapValue!51710 () ValueCell!15827)

(assert (=> mapNonEmpty!51710 (= (arr!40517 _values!1187) (store mapRest!51710 mapKey!51710 mapValue!51710))))

(declare-fun b!1279070 () Bool)

(assert (=> b!1279070 (= e!730617 tp_is_empty!33451)))

(declare-fun b!1279071 () Bool)

(declare-fun res!849534 () Bool)

(assert (=> b!1279071 (=> (not res!849534) (not e!730620))))

(assert (=> b!1279071 (= res!849534 (and (= (size!41068 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41069 _keys!1427) (size!41068 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1279072 () Bool)

(assert (=> b!1279072 (= e!730620 (bvsge #b00000000000000000000000000000000 (size!41069 _keys!1427)))))

(declare-fun b!1279073 () Bool)

(declare-fun res!849538 () Bool)

(assert (=> b!1279073 (=> (not res!849538) (not e!730620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84025 (_ BitVec 32)) Bool)

(assert (=> b!1279073 (= res!849538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1279067 () Bool)

(declare-fun e!730619 () Bool)

(assert (=> b!1279067 (= e!730619 (and e!730618 mapRes!51710))))

(declare-fun condMapEmpty!51710 () Bool)

(declare-fun mapDefault!51710 () ValueCell!15827)

(assert (=> b!1279067 (= condMapEmpty!51710 (= (arr!40517 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15827)) mapDefault!51710)))))

(declare-fun res!849535 () Bool)

(assert (=> start!108430 (=> (not res!849535) (not e!730620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108430 (= res!849535 (validMask!0 mask!1805))))

(assert (=> start!108430 e!730620))

(assert (=> start!108430 true))

(assert (=> start!108430 tp!98660))

(assert (=> start!108430 tp_is_empty!33451))

(declare-fun array_inv!30967 (array!84023) Bool)

(assert (=> start!108430 (and (array_inv!30967 _values!1187) e!730619)))

(declare-fun array_inv!30968 (array!84025) Bool)

(assert (=> start!108430 (array_inv!30968 _keys!1427)))

(declare-fun mapIsEmpty!51710 () Bool)

(assert (=> mapIsEmpty!51710 mapRes!51710))

(declare-fun b!1279074 () Bool)

(declare-fun res!849537 () Bool)

(assert (=> b!1279074 (=> (not res!849537) (not e!730620))))

(declare-datatypes ((List!28762 0))(
  ( (Nil!28759) (Cons!28758 (h!29976 (_ BitVec 64)) (t!42292 List!28762)) )
))
(declare-fun arrayNoDuplicates!0 (array!84025 (_ BitVec 32) List!28762) Bool)

(assert (=> b!1279074 (= res!849537 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28759))))

(assert (= (and start!108430 res!849535) b!1279071))

(assert (= (and b!1279071 res!849534) b!1279073))

(assert (= (and b!1279073 res!849538) b!1279074))

(assert (= (and b!1279074 res!849537) b!1279068))

(assert (= (and b!1279068 res!849536) b!1279072))

(assert (= (and b!1279067 condMapEmpty!51710) mapIsEmpty!51710))

(assert (= (and b!1279067 (not condMapEmpty!51710)) mapNonEmpty!51710))

(get-info :version)

(assert (= (and mapNonEmpty!51710 ((_ is ValueCellFull!15827) mapValue!51710)) b!1279070))

(assert (= (and b!1279067 ((_ is ValueCellFull!15827) mapDefault!51710)) b!1279069))

(assert (= start!108430 b!1279067))

(declare-fun m!1174917 () Bool)

(assert (=> b!1279068 m!1174917))

(assert (=> b!1279068 m!1174917))

(declare-fun m!1174919 () Bool)

(assert (=> b!1279068 m!1174919))

(declare-fun m!1174921 () Bool)

(assert (=> b!1279073 m!1174921))

(declare-fun m!1174923 () Bool)

(assert (=> mapNonEmpty!51710 m!1174923))

(declare-fun m!1174925 () Bool)

(assert (=> start!108430 m!1174925))

(declare-fun m!1174927 () Bool)

(assert (=> start!108430 m!1174927))

(declare-fun m!1174929 () Bool)

(assert (=> start!108430 m!1174929))

(declare-fun m!1174931 () Bool)

(assert (=> b!1279074 m!1174931))

(check-sat (not b!1279074) b_and!45961 (not start!108430) (not b!1279068) (not b_next!27901) (not mapNonEmpty!51710) tp_is_empty!33451 (not b!1279073))
(check-sat b_and!45961 (not b_next!27901))
(get-model)

(declare-fun d!140931 () Bool)

(declare-fun e!730657 () Bool)

(assert (=> d!140931 e!730657))

(declare-fun res!849571 () Bool)

(assert (=> d!140931 (=> res!849571 e!730657)))

(declare-fun lt!576236 () Bool)

(assert (=> d!140931 (= res!849571 (not lt!576236))))

(declare-fun lt!576234 () Bool)

(assert (=> d!140931 (= lt!576236 lt!576234)))

(declare-datatypes ((Unit!42346 0))(
  ( (Unit!42347) )
))
(declare-fun lt!576233 () Unit!42346)

(declare-fun e!730656 () Unit!42346)

(assert (=> d!140931 (= lt!576233 e!730656)))

(declare-fun c!124393 () Bool)

(assert (=> d!140931 (= c!124393 lt!576234)))

(declare-fun containsKey!713 (List!28761 (_ BitVec 64)) Bool)

(assert (=> d!140931 (= lt!576234 (containsKey!713 (toList!9634 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(assert (=> d!140931 (= (contains!7759 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053) lt!576236)))

(declare-fun b!1279129 () Bool)

(declare-fun lt!576235 () Unit!42346)

(assert (=> b!1279129 (= e!730656 lt!576235)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!459 (List!28761 (_ BitVec 64)) Unit!42346)

(assert (=> b!1279129 (= lt!576235 (lemmaContainsKeyImpliesGetValueByKeyDefined!459 (toList!9634 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-datatypes ((Option!738 0))(
  ( (Some!737 (v!19396 V!49705)) (None!736) )
))
(declare-fun isDefined!496 (Option!738) Bool)

(declare-fun getValueByKey!687 (List!28761 (_ BitVec 64)) Option!738)

(assert (=> b!1279129 (isDefined!496 (getValueByKey!687 (toList!9634 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-fun b!1279130 () Bool)

(declare-fun Unit!42348 () Unit!42346)

(assert (=> b!1279130 (= e!730656 Unit!42348)))

(declare-fun b!1279131 () Bool)

(assert (=> b!1279131 (= e!730657 (isDefined!496 (getValueByKey!687 (toList!9634 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053)))))

(assert (= (and d!140931 c!124393) b!1279129))

(assert (= (and d!140931 (not c!124393)) b!1279130))

(assert (= (and d!140931 (not res!849571)) b!1279131))

(declare-fun m!1174965 () Bool)

(assert (=> d!140931 m!1174965))

(declare-fun m!1174967 () Bool)

(assert (=> b!1279129 m!1174967))

(declare-fun m!1174969 () Bool)

(assert (=> b!1279129 m!1174969))

(assert (=> b!1279129 m!1174969))

(declare-fun m!1174971 () Bool)

(assert (=> b!1279129 m!1174971))

(assert (=> b!1279131 m!1174969))

(assert (=> b!1279131 m!1174969))

(assert (=> b!1279131 m!1174971))

(assert (=> b!1279068 d!140931))

(declare-fun bm!62754 () Bool)

(declare-fun call!62761 () Bool)

(declare-fun lt!576281 () ListLongMap!19237)

(assert (=> bm!62754 (= call!62761 (contains!7759 lt!576281 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1279174 () Bool)

(declare-fun e!730688 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1279174 (= e!730688 (validKeyInArray!0 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1279175 () Bool)

(declare-fun e!730689 () Bool)

(declare-fun e!730684 () Bool)

(assert (=> b!1279175 (= e!730689 e!730684)))

(declare-fun c!124411 () Bool)

(assert (=> b!1279175 (= c!124411 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!62759 () ListLongMap!19237)

(declare-fun c!124406 () Bool)

(declare-fun call!62758 () ListLongMap!19237)

(declare-fun bm!62755 () Bool)

(declare-fun call!62763 () ListLongMap!19237)

(declare-fun call!62757 () ListLongMap!19237)

(declare-fun c!124410 () Bool)

(declare-fun +!4317 (ListLongMap!19237 tuple2!21572) ListLongMap!19237)

(assert (=> bm!62755 (= call!62757 (+!4317 (ite c!124406 call!62759 (ite c!124410 call!62758 call!62763)) (ite (or c!124406 c!124410) (tuple2!21573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1129) (tuple2!21573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129))))))

(declare-fun b!1279176 () Bool)

(declare-fun res!849595 () Bool)

(assert (=> b!1279176 (=> (not res!849595) (not e!730689))))

(declare-fun e!730692 () Bool)

(assert (=> b!1279176 (= res!849595 e!730692)))

(declare-fun res!849591 () Bool)

(assert (=> b!1279176 (=> res!849591 e!730692)))

(assert (=> b!1279176 (= res!849591 (not e!730688))))

(declare-fun res!849593 () Bool)

(assert (=> b!1279176 (=> (not res!849593) (not e!730688))))

(assert (=> b!1279176 (= res!849593 (bvslt #b00000000000000000000000000000000 (size!41069 _keys!1427)))))

(declare-fun b!1279177 () Bool)

(declare-fun res!849597 () Bool)

(assert (=> b!1279177 (=> (not res!849597) (not e!730689))))

(declare-fun e!730691 () Bool)

(assert (=> b!1279177 (= res!849597 e!730691)))

(declare-fun c!124409 () Bool)

(assert (=> b!1279177 (= c!124409 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!730686 () Bool)

(declare-fun b!1279178 () Bool)

(declare-fun apply!1017 (ListLongMap!19237 (_ BitVec 64)) V!49705)

(declare-fun get!20702 (ValueCell!15827 V!49705) V!49705)

(declare-fun dynLambda!3469 (Int (_ BitVec 64)) V!49705)

(assert (=> b!1279178 (= e!730686 (= (apply!1017 lt!576281 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000)) (get!20702 (select (arr!40517 _values!1187) #b00000000000000000000000000000000) (dynLambda!3469 defaultEntry!1195 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1279178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41068 _values!1187)))))

(assert (=> b!1279178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41069 _keys!1427)))))

(declare-fun b!1279179 () Bool)

(declare-fun e!730696 () ListLongMap!19237)

(assert (=> b!1279179 (= e!730696 (+!4317 call!62757 (tuple2!21573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129)))))

(declare-fun bm!62756 () Bool)

(assert (=> bm!62756 (= call!62763 call!62758)))

(declare-fun b!1279180 () Bool)

(declare-fun e!730685 () Unit!42346)

(declare-fun lt!576288 () Unit!42346)

(assert (=> b!1279180 (= e!730685 lt!576288)))

(declare-fun lt!576286 () ListLongMap!19237)

(declare-fun getCurrentListMapNoExtraKeys!5949 (array!84025 array!84023 (_ BitVec 32) (_ BitVec 32) V!49705 V!49705 (_ BitVec 32) Int) ListLongMap!19237)

(assert (=> b!1279180 (= lt!576286 (getCurrentListMapNoExtraKeys!5949 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!576296 () (_ BitVec 64))

(assert (=> b!1279180 (= lt!576296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576301 () (_ BitVec 64))

(assert (=> b!1279180 (= lt!576301 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!576289 () Unit!42346)

(declare-fun addStillContains!1104 (ListLongMap!19237 (_ BitVec 64) V!49705 (_ BitVec 64)) Unit!42346)

(assert (=> b!1279180 (= lt!576289 (addStillContains!1104 lt!576286 lt!576296 zeroValue!1129 lt!576301))))

(assert (=> b!1279180 (contains!7759 (+!4317 lt!576286 (tuple2!21573 lt!576296 zeroValue!1129)) lt!576301)))

(declare-fun lt!576291 () Unit!42346)

(assert (=> b!1279180 (= lt!576291 lt!576289)))

(declare-fun lt!576294 () ListLongMap!19237)

(assert (=> b!1279180 (= lt!576294 (getCurrentListMapNoExtraKeys!5949 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!576299 () (_ BitVec 64))

(assert (=> b!1279180 (= lt!576299 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576287 () (_ BitVec 64))

(assert (=> b!1279180 (= lt!576287 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!576302 () Unit!42346)

(declare-fun addApplyDifferent!546 (ListLongMap!19237 (_ BitVec 64) V!49705 (_ BitVec 64)) Unit!42346)

(assert (=> b!1279180 (= lt!576302 (addApplyDifferent!546 lt!576294 lt!576299 minValue!1129 lt!576287))))

(assert (=> b!1279180 (= (apply!1017 (+!4317 lt!576294 (tuple2!21573 lt!576299 minValue!1129)) lt!576287) (apply!1017 lt!576294 lt!576287))))

(declare-fun lt!576300 () Unit!42346)

(assert (=> b!1279180 (= lt!576300 lt!576302)))

(declare-fun lt!576297 () ListLongMap!19237)

(assert (=> b!1279180 (= lt!576297 (getCurrentListMapNoExtraKeys!5949 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!576283 () (_ BitVec 64))

(assert (=> b!1279180 (= lt!576283 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576295 () (_ BitVec 64))

(assert (=> b!1279180 (= lt!576295 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!576282 () Unit!42346)

(assert (=> b!1279180 (= lt!576282 (addApplyDifferent!546 lt!576297 lt!576283 zeroValue!1129 lt!576295))))

(assert (=> b!1279180 (= (apply!1017 (+!4317 lt!576297 (tuple2!21573 lt!576283 zeroValue!1129)) lt!576295) (apply!1017 lt!576297 lt!576295))))

(declare-fun lt!576290 () Unit!42346)

(assert (=> b!1279180 (= lt!576290 lt!576282)))

(declare-fun lt!576284 () ListLongMap!19237)

(assert (=> b!1279180 (= lt!576284 (getCurrentListMapNoExtraKeys!5949 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!576285 () (_ BitVec 64))

(assert (=> b!1279180 (= lt!576285 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576298 () (_ BitVec 64))

(assert (=> b!1279180 (= lt!576298 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> b!1279180 (= lt!576288 (addApplyDifferent!546 lt!576284 lt!576285 minValue!1129 lt!576298))))

(assert (=> b!1279180 (= (apply!1017 (+!4317 lt!576284 (tuple2!21573 lt!576285 minValue!1129)) lt!576298) (apply!1017 lt!576284 lt!576298))))

(declare-fun b!1279181 () Bool)

(declare-fun e!730687 () Bool)

(assert (=> b!1279181 (= e!730687 (validKeyInArray!0 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun bm!62757 () Bool)

(assert (=> bm!62757 (= call!62758 call!62759)))

(declare-fun b!1279182 () Bool)

(declare-fun e!730693 () ListLongMap!19237)

(declare-fun call!62762 () ListLongMap!19237)

(assert (=> b!1279182 (= e!730693 call!62762)))

(declare-fun bm!62758 () Bool)

(assert (=> bm!62758 (= call!62762 call!62757)))

(declare-fun b!1279183 () Bool)

(declare-fun e!730695 () ListLongMap!19237)

(assert (=> b!1279183 (= e!730695 call!62762)))

(declare-fun bm!62759 () Bool)

(assert (=> bm!62759 (= call!62759 (getCurrentListMapNoExtraKeys!5949 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1279184 () Bool)

(declare-fun e!730694 () Bool)

(assert (=> b!1279184 (= e!730691 e!730694)))

(declare-fun res!849590 () Bool)

(declare-fun call!62760 () Bool)

(assert (=> b!1279184 (= res!849590 call!62760)))

(assert (=> b!1279184 (=> (not res!849590) (not e!730694))))

(declare-fun bm!62760 () Bool)

(assert (=> bm!62760 (= call!62760 (contains!7759 lt!576281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1279185 () Bool)

(assert (=> b!1279185 (= e!730691 (not call!62760))))

(declare-fun b!1279186 () Bool)

(declare-fun e!730690 () Bool)

(assert (=> b!1279186 (= e!730690 (= (apply!1017 lt!576281 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1129))))

(declare-fun b!1279187 () Bool)

(assert (=> b!1279187 (= e!730684 (not call!62761))))

(declare-fun b!1279188 () Bool)

(assert (=> b!1279188 (= e!730693 call!62763)))

(declare-fun b!1279189 () Bool)

(assert (=> b!1279189 (= e!730696 e!730695)))

(assert (=> b!1279189 (= c!124410 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1279190 () Bool)

(assert (=> b!1279190 (= e!730694 (= (apply!1017 lt!576281 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1129))))

(declare-fun b!1279191 () Bool)

(assert (=> b!1279191 (= e!730692 e!730686)))

(declare-fun res!849594 () Bool)

(assert (=> b!1279191 (=> (not res!849594) (not e!730686))))

(assert (=> b!1279191 (= res!849594 (contains!7759 lt!576281 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000)))))

(assert (=> b!1279191 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41069 _keys!1427)))))

(declare-fun b!1279192 () Bool)

(declare-fun c!124408 () Bool)

(assert (=> b!1279192 (= c!124408 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1279192 (= e!730695 e!730693)))

(declare-fun d!140933 () Bool)

(assert (=> d!140933 e!730689))

(declare-fun res!849592 () Bool)

(assert (=> d!140933 (=> (not res!849592) (not e!730689))))

(assert (=> d!140933 (= res!849592 (or (bvsge #b00000000000000000000000000000000 (size!41069 _keys!1427)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41069 _keys!1427)))))))

(declare-fun lt!576293 () ListLongMap!19237)

(assert (=> d!140933 (= lt!576281 lt!576293)))

(declare-fun lt!576292 () Unit!42346)

(assert (=> d!140933 (= lt!576292 e!730685)))

(declare-fun c!124407 () Bool)

(assert (=> d!140933 (= c!124407 e!730687)))

(declare-fun res!849596 () Bool)

(assert (=> d!140933 (=> (not res!849596) (not e!730687))))

(assert (=> d!140933 (= res!849596 (bvslt #b00000000000000000000000000000000 (size!41069 _keys!1427)))))

(assert (=> d!140933 (= lt!576293 e!730696)))

(assert (=> d!140933 (= c!124406 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140933 (validMask!0 mask!1805)))

(assert (=> d!140933 (= (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) lt!576281)))

(declare-fun b!1279193 () Bool)

(declare-fun Unit!42349 () Unit!42346)

(assert (=> b!1279193 (= e!730685 Unit!42349)))

(declare-fun b!1279194 () Bool)

(assert (=> b!1279194 (= e!730684 e!730690)))

(declare-fun res!849598 () Bool)

(assert (=> b!1279194 (= res!849598 call!62761)))

(assert (=> b!1279194 (=> (not res!849598) (not e!730690))))

(assert (= (and d!140933 c!124406) b!1279179))

(assert (= (and d!140933 (not c!124406)) b!1279189))

(assert (= (and b!1279189 c!124410) b!1279183))

(assert (= (and b!1279189 (not c!124410)) b!1279192))

(assert (= (and b!1279192 c!124408) b!1279182))

(assert (= (and b!1279192 (not c!124408)) b!1279188))

(assert (= (or b!1279182 b!1279188) bm!62756))

(assert (= (or b!1279183 bm!62756) bm!62757))

(assert (= (or b!1279183 b!1279182) bm!62758))

(assert (= (or b!1279179 bm!62757) bm!62759))

(assert (= (or b!1279179 bm!62758) bm!62755))

(assert (= (and d!140933 res!849596) b!1279181))

(assert (= (and d!140933 c!124407) b!1279180))

(assert (= (and d!140933 (not c!124407)) b!1279193))

(assert (= (and d!140933 res!849592) b!1279176))

(assert (= (and b!1279176 res!849593) b!1279174))

(assert (= (and b!1279176 (not res!849591)) b!1279191))

(assert (= (and b!1279191 res!849594) b!1279178))

(assert (= (and b!1279176 res!849595) b!1279177))

(assert (= (and b!1279177 c!124409) b!1279184))

(assert (= (and b!1279177 (not c!124409)) b!1279185))

(assert (= (and b!1279184 res!849590) b!1279190))

(assert (= (or b!1279184 b!1279185) bm!62760))

(assert (= (and b!1279177 res!849597) b!1279175))

(assert (= (and b!1279175 c!124411) b!1279194))

(assert (= (and b!1279175 (not c!124411)) b!1279187))

(assert (= (and b!1279194 res!849598) b!1279186))

(assert (= (or b!1279194 b!1279187) bm!62754))

(declare-fun b_lambda!23085 () Bool)

(assert (=> (not b_lambda!23085) (not b!1279178)))

(declare-fun t!42295 () Bool)

(declare-fun tb!11335 () Bool)

(assert (=> (and start!108430 (= defaultEntry!1195 defaultEntry!1195) t!42295) tb!11335))

(declare-fun result!23661 () Bool)

(assert (=> tb!11335 (= result!23661 tp_is_empty!33451)))

(assert (=> b!1279178 t!42295))

(declare-fun b_and!45967 () Bool)

(assert (= b_and!45961 (and (=> t!42295 result!23661) b_and!45967)))

(declare-fun m!1174973 () Bool)

(assert (=> bm!62754 m!1174973))

(declare-fun m!1174975 () Bool)

(assert (=> b!1279180 m!1174975))

(declare-fun m!1174977 () Bool)

(assert (=> b!1279180 m!1174977))

(declare-fun m!1174979 () Bool)

(assert (=> b!1279180 m!1174979))

(declare-fun m!1174981 () Bool)

(assert (=> b!1279180 m!1174981))

(declare-fun m!1174983 () Bool)

(assert (=> b!1279180 m!1174983))

(declare-fun m!1174985 () Bool)

(assert (=> b!1279180 m!1174985))

(declare-fun m!1174987 () Bool)

(assert (=> b!1279180 m!1174987))

(assert (=> b!1279180 m!1174977))

(declare-fun m!1174989 () Bool)

(assert (=> b!1279180 m!1174989))

(declare-fun m!1174991 () Bool)

(assert (=> b!1279180 m!1174991))

(assert (=> b!1279180 m!1174979))

(declare-fun m!1174993 () Bool)

(assert (=> b!1279180 m!1174993))

(declare-fun m!1174995 () Bool)

(assert (=> b!1279180 m!1174995))

(assert (=> b!1279180 m!1174983))

(declare-fun m!1174997 () Bool)

(assert (=> b!1279180 m!1174997))

(declare-fun m!1174999 () Bool)

(assert (=> b!1279180 m!1174999))

(declare-fun m!1175001 () Bool)

(assert (=> b!1279180 m!1175001))

(declare-fun m!1175003 () Bool)

(assert (=> b!1279180 m!1175003))

(declare-fun m!1175005 () Bool)

(assert (=> b!1279180 m!1175005))

(assert (=> b!1279180 m!1174985))

(declare-fun m!1175007 () Bool)

(assert (=> b!1279180 m!1175007))

(declare-fun m!1175009 () Bool)

(assert (=> bm!62760 m!1175009))

(declare-fun m!1175011 () Bool)

(assert (=> b!1279190 m!1175011))

(assert (=> bm!62759 m!1174975))

(assert (=> d!140933 m!1174925))

(assert (=> b!1279174 m!1175005))

(assert (=> b!1279174 m!1175005))

(declare-fun m!1175013 () Bool)

(assert (=> b!1279174 m!1175013))

(declare-fun m!1175015 () Bool)

(assert (=> bm!62755 m!1175015))

(declare-fun m!1175017 () Bool)

(assert (=> b!1279178 m!1175017))

(assert (=> b!1279178 m!1175017))

(declare-fun m!1175019 () Bool)

(assert (=> b!1279178 m!1175019))

(declare-fun m!1175021 () Bool)

(assert (=> b!1279178 m!1175021))

(assert (=> b!1279178 m!1175019))

(assert (=> b!1279178 m!1175005))

(assert (=> b!1279178 m!1175005))

(declare-fun m!1175023 () Bool)

(assert (=> b!1279178 m!1175023))

(assert (=> b!1279181 m!1175005))

(assert (=> b!1279181 m!1175005))

(assert (=> b!1279181 m!1175013))

(assert (=> b!1279191 m!1175005))

(assert (=> b!1279191 m!1175005))

(declare-fun m!1175025 () Bool)

(assert (=> b!1279191 m!1175025))

(declare-fun m!1175027 () Bool)

(assert (=> b!1279179 m!1175027))

(declare-fun m!1175029 () Bool)

(assert (=> b!1279186 m!1175029))

(assert (=> b!1279068 d!140933))

(declare-fun b!1279205 () Bool)

(declare-fun e!730705 () Bool)

(declare-fun e!730704 () Bool)

(assert (=> b!1279205 (= e!730705 e!730704)))

(declare-fun lt!576309 () (_ BitVec 64))

(assert (=> b!1279205 (= lt!576309 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!576311 () Unit!42346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84025 (_ BitVec 64) (_ BitVec 32)) Unit!42346)

(assert (=> b!1279205 (= lt!576311 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!576309 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1279205 (arrayContainsKey!0 _keys!1427 lt!576309 #b00000000000000000000000000000000)))

(declare-fun lt!576310 () Unit!42346)

(assert (=> b!1279205 (= lt!576310 lt!576311)))

(declare-fun res!849604 () Bool)

(declare-datatypes ((SeekEntryResult!9963 0))(
  ( (MissingZero!9963 (index!42223 (_ BitVec 32))) (Found!9963 (index!42224 (_ BitVec 32))) (Intermediate!9963 (undefined!10775 Bool) (index!42225 (_ BitVec 32)) (x!113230 (_ BitVec 32))) (Undefined!9963) (MissingVacant!9963 (index!42226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84025 (_ BitVec 32)) SeekEntryResult!9963)

(assert (=> b!1279205 (= res!849604 (= (seekEntryOrOpen!0 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!9963 #b00000000000000000000000000000000)))))

(assert (=> b!1279205 (=> (not res!849604) (not e!730704))))

(declare-fun b!1279206 () Bool)

(declare-fun e!730703 () Bool)

(assert (=> b!1279206 (= e!730703 e!730705)))

(declare-fun c!124414 () Bool)

(assert (=> b!1279206 (= c!124414 (validKeyInArray!0 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1279207 () Bool)

(declare-fun call!62766 () Bool)

(assert (=> b!1279207 (= e!730704 call!62766)))

(declare-fun b!1279208 () Bool)

(assert (=> b!1279208 (= e!730705 call!62766)))

(declare-fun d!140935 () Bool)

(declare-fun res!849603 () Bool)

(assert (=> d!140935 (=> res!849603 e!730703)))

(assert (=> d!140935 (= res!849603 (bvsge #b00000000000000000000000000000000 (size!41069 _keys!1427)))))

(assert (=> d!140935 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!730703)))

(declare-fun bm!62763 () Bool)

(assert (=> bm!62763 (= call!62766 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(assert (= (and d!140935 (not res!849603)) b!1279206))

(assert (= (and b!1279206 c!124414) b!1279205))

(assert (= (and b!1279206 (not c!124414)) b!1279208))

(assert (= (and b!1279205 res!849604) b!1279207))

(assert (= (or b!1279207 b!1279208) bm!62763))

(assert (=> b!1279205 m!1175005))

(declare-fun m!1175031 () Bool)

(assert (=> b!1279205 m!1175031))

(declare-fun m!1175033 () Bool)

(assert (=> b!1279205 m!1175033))

(assert (=> b!1279205 m!1175005))

(declare-fun m!1175035 () Bool)

(assert (=> b!1279205 m!1175035))

(assert (=> b!1279206 m!1175005))

(assert (=> b!1279206 m!1175005))

(assert (=> b!1279206 m!1175013))

(declare-fun m!1175037 () Bool)

(assert (=> bm!62763 m!1175037))

(assert (=> b!1279073 d!140935))

(declare-fun d!140937 () Bool)

(assert (=> d!140937 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108430 d!140937))

(declare-fun d!140939 () Bool)

(assert (=> d!140939 (= (array_inv!30967 _values!1187) (bvsge (size!41068 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108430 d!140939))

(declare-fun d!140941 () Bool)

(assert (=> d!140941 (= (array_inv!30968 _keys!1427) (bvsge (size!41069 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108430 d!140941))

(declare-fun d!140943 () Bool)

(declare-fun res!849611 () Bool)

(declare-fun e!730714 () Bool)

(assert (=> d!140943 (=> res!849611 e!730714)))

(assert (=> d!140943 (= res!849611 (bvsge #b00000000000000000000000000000000 (size!41069 _keys!1427)))))

(assert (=> d!140943 (= (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28759) e!730714)))

(declare-fun b!1279219 () Bool)

(declare-fun e!730716 () Bool)

(declare-fun e!730715 () Bool)

(assert (=> b!1279219 (= e!730716 e!730715)))

(declare-fun c!124417 () Bool)

(assert (=> b!1279219 (= c!124417 (validKeyInArray!0 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1279220 () Bool)

(assert (=> b!1279220 (= e!730714 e!730716)))

(declare-fun res!849613 () Bool)

(assert (=> b!1279220 (=> (not res!849613) (not e!730716))))

(declare-fun e!730717 () Bool)

(assert (=> b!1279220 (= res!849613 (not e!730717))))

(declare-fun res!849612 () Bool)

(assert (=> b!1279220 (=> (not res!849612) (not e!730717))))

(assert (=> b!1279220 (= res!849612 (validKeyInArray!0 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1279221 () Bool)

(declare-fun contains!7761 (List!28762 (_ BitVec 64)) Bool)

(assert (=> b!1279221 (= e!730717 (contains!7761 Nil!28759 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun bm!62766 () Bool)

(declare-fun call!62769 () Bool)

(assert (=> bm!62766 (= call!62769 (arrayNoDuplicates!0 _keys!1427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124417 (Cons!28758 (select (arr!40518 _keys!1427) #b00000000000000000000000000000000) Nil!28759) Nil!28759)))))

(declare-fun b!1279222 () Bool)

(assert (=> b!1279222 (= e!730715 call!62769)))

(declare-fun b!1279223 () Bool)

(assert (=> b!1279223 (= e!730715 call!62769)))

(assert (= (and d!140943 (not res!849611)) b!1279220))

(assert (= (and b!1279220 res!849612) b!1279221))

(assert (= (and b!1279220 res!849613) b!1279219))

(assert (= (and b!1279219 c!124417) b!1279222))

(assert (= (and b!1279219 (not c!124417)) b!1279223))

(assert (= (or b!1279222 b!1279223) bm!62766))

(assert (=> b!1279219 m!1175005))

(assert (=> b!1279219 m!1175005))

(assert (=> b!1279219 m!1175013))

(assert (=> b!1279220 m!1175005))

(assert (=> b!1279220 m!1175005))

(assert (=> b!1279220 m!1175013))

(assert (=> b!1279221 m!1175005))

(assert (=> b!1279221 m!1175005))

(declare-fun m!1175039 () Bool)

(assert (=> b!1279221 m!1175039))

(assert (=> bm!62766 m!1175005))

(declare-fun m!1175041 () Bool)

(assert (=> bm!62766 m!1175041))

(assert (=> b!1279074 d!140943))

(declare-fun b!1279231 () Bool)

(declare-fun e!730723 () Bool)

(assert (=> b!1279231 (= e!730723 tp_is_empty!33451)))

(declare-fun b!1279230 () Bool)

(declare-fun e!730722 () Bool)

(assert (=> b!1279230 (= e!730722 tp_is_empty!33451)))

(declare-fun mapNonEmpty!51719 () Bool)

(declare-fun mapRes!51719 () Bool)

(declare-fun tp!98675 () Bool)

(assert (=> mapNonEmpty!51719 (= mapRes!51719 (and tp!98675 e!730722))))

(declare-fun mapRest!51719 () (Array (_ BitVec 32) ValueCell!15827))

(declare-fun mapKey!51719 () (_ BitVec 32))

(declare-fun mapValue!51719 () ValueCell!15827)

(assert (=> mapNonEmpty!51719 (= mapRest!51710 (store mapRest!51719 mapKey!51719 mapValue!51719))))

(declare-fun condMapEmpty!51719 () Bool)

(declare-fun mapDefault!51719 () ValueCell!15827)

(assert (=> mapNonEmpty!51710 (= condMapEmpty!51719 (= mapRest!51710 ((as const (Array (_ BitVec 32) ValueCell!15827)) mapDefault!51719)))))

(assert (=> mapNonEmpty!51710 (= tp!98659 (and e!730723 mapRes!51719))))

(declare-fun mapIsEmpty!51719 () Bool)

(assert (=> mapIsEmpty!51719 mapRes!51719))

(assert (= (and mapNonEmpty!51710 condMapEmpty!51719) mapIsEmpty!51719))

(assert (= (and mapNonEmpty!51710 (not condMapEmpty!51719)) mapNonEmpty!51719))

(assert (= (and mapNonEmpty!51719 ((_ is ValueCellFull!15827) mapValue!51719)) b!1279230))

(assert (= (and mapNonEmpty!51710 ((_ is ValueCellFull!15827) mapDefault!51719)) b!1279231))

(declare-fun m!1175043 () Bool)

(assert (=> mapNonEmpty!51719 m!1175043))

(declare-fun b_lambda!23087 () Bool)

(assert (= b_lambda!23085 (or (and start!108430 b_free!27901) b_lambda!23087)))

(check-sat (not bm!62759) b_and!45967 (not b!1279186) (not b_lambda!23087) (not bm!62766) (not b!1279221) (not b!1279205) (not d!140931) (not b!1279178) (not b!1279220) (not b!1279129) (not b!1279206) (not b!1279180) (not b!1279219) (not b!1279181) (not bm!62755) (not bm!62763) (not d!140933) (not b!1279174) (not bm!62754) (not b_next!27901) (not bm!62760) (not b!1279131) (not b!1279190) tp_is_empty!33451 (not b!1279179) (not b!1279191) (not mapNonEmpty!51719))
(check-sat b_and!45967 (not b_next!27901))
