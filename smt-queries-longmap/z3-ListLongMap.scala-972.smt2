; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21054 () Bool)

(assert start!21054)

(declare-fun b_free!5581 () Bool)

(declare-fun b_next!5581 () Bool)

(assert (=> start!21054 (= b_free!5581 (not b_next!5581))))

(declare-fun tp!19802 () Bool)

(declare-fun b_and!12413 () Bool)

(assert (=> start!21054 (= tp!19802 b_and!12413)))

(declare-fun b!211725 () Bool)

(declare-fun res!103427 () Bool)

(declare-fun e!137797 () Bool)

(assert (=> b!211725 (=> (not res!103427) (not e!137797))))

(declare-datatypes ((array!10085 0))(
  ( (array!10086 (arr!4787 (Array (_ BitVec 32) (_ BitVec 64))) (size!5112 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10085)

(declare-datatypes ((List!3016 0))(
  ( (Nil!3013) (Cons!3012 (h!3654 (_ BitVec 64)) (t!7951 List!3016)) )
))
(declare-fun arrayNoDuplicates!0 (array!10085 (_ BitVec 32) List!3016) Bool)

(assert (=> b!211725 (= res!103427 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3013))))

(declare-fun b!211726 () Bool)

(declare-fun res!103432 () Bool)

(assert (=> b!211726 (=> (not res!103432) (not e!137797))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211726 (= res!103432 (validKeyInArray!0 k0!843))))

(declare-fun b!211727 () Bool)

(declare-fun e!137800 () Bool)

(assert (=> b!211727 (= e!137797 (not e!137800))))

(declare-fun res!103428 () Bool)

(assert (=> b!211727 (=> res!103428 e!137800)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211727 (= res!103428 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6905 0))(
  ( (V!6906 (val!2766 Int)) )
))
(declare-datatypes ((tuple2!4132 0))(
  ( (tuple2!4133 (_1!2077 (_ BitVec 64)) (_2!2077 V!6905)) )
))
(declare-datatypes ((List!3017 0))(
  ( (Nil!3014) (Cons!3013 (h!3655 tuple2!4132) (t!7952 List!3017)) )
))
(declare-datatypes ((ListLongMap!3047 0))(
  ( (ListLongMap!3048 (toList!1539 List!3017)) )
))
(declare-fun lt!108956 () ListLongMap!3047)

(declare-datatypes ((ValueCell!2378 0))(
  ( (ValueCellFull!2378 (v!4761 V!6905)) (EmptyCell!2378) )
))
(declare-datatypes ((array!10087 0))(
  ( (array!10088 (arr!4788 (Array (_ BitVec 32) ValueCell!2378)) (size!5113 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10087)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6905)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6905)

(declare-fun getCurrentListMap!1075 (array!10085 array!10087 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) Int) ListLongMap!3047)

(assert (=> b!211727 (= lt!108956 (getCurrentListMap!1075 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108951 () array!10087)

(declare-fun lt!108955 () ListLongMap!3047)

(assert (=> b!211727 (= lt!108955 (getCurrentListMap!1075 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108954 () ListLongMap!3047)

(declare-fun lt!108953 () ListLongMap!3047)

(assert (=> b!211727 (and (= lt!108954 lt!108953) (= lt!108953 lt!108954))))

(declare-fun lt!108957 () ListLongMap!3047)

(declare-fun v!520 () V!6905)

(declare-fun +!568 (ListLongMap!3047 tuple2!4132) ListLongMap!3047)

(assert (=> b!211727 (= lt!108953 (+!568 lt!108957 (tuple2!4133 k0!843 v!520)))))

(declare-datatypes ((Unit!6420 0))(
  ( (Unit!6421) )
))
(declare-fun lt!108950 () Unit!6420)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!216 (array!10085 array!10087 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) (_ BitVec 64) V!6905 (_ BitVec 32) Int) Unit!6420)

(assert (=> b!211727 (= lt!108950 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!216 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!498 (array!10085 array!10087 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) Int) ListLongMap!3047)

(assert (=> b!211727 (= lt!108954 (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211727 (= lt!108951 (array!10088 (store (arr!4788 _values!649) i!601 (ValueCellFull!2378 v!520)) (size!5113 _values!649)))))

(assert (=> b!211727 (= lt!108957 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211728 () Bool)

(assert (=> b!211728 (= e!137800 (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!137799 () Bool)

(assert (=> b!211728 e!137799))

(declare-fun res!103431 () Bool)

(assert (=> b!211728 (=> (not res!103431) (not e!137799))))

(declare-fun lt!108952 () tuple2!4132)

(assert (=> b!211728 (= res!103431 (= lt!108955 (+!568 lt!108954 lt!108952)))))

(assert (=> b!211728 (= lt!108952 (tuple2!4133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211729 () Bool)

(declare-fun e!137801 () Bool)

(declare-fun tp_is_empty!5443 () Bool)

(assert (=> b!211729 (= e!137801 tp_is_empty!5443)))

(declare-fun b!211730 () Bool)

(declare-fun res!103434 () Bool)

(assert (=> b!211730 (=> (not res!103434) (not e!137797))))

(assert (=> b!211730 (= res!103434 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5112 _keys!825))))))

(declare-fun b!211731 () Bool)

(declare-fun e!137802 () Bool)

(declare-fun mapRes!9251 () Bool)

(assert (=> b!211731 (= e!137802 (and e!137801 mapRes!9251))))

(declare-fun condMapEmpty!9251 () Bool)

(declare-fun mapDefault!9251 () ValueCell!2378)

(assert (=> b!211731 (= condMapEmpty!9251 (= (arr!4788 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2378)) mapDefault!9251)))))

(declare-fun mapIsEmpty!9251 () Bool)

(assert (=> mapIsEmpty!9251 mapRes!9251))

(declare-fun b!211733 () Bool)

(declare-fun res!103430 () Bool)

(assert (=> b!211733 (=> (not res!103430) (not e!137799))))

(assert (=> b!211733 (= res!103430 (= lt!108956 (+!568 lt!108957 lt!108952)))))

(declare-fun mapNonEmpty!9251 () Bool)

(declare-fun tp!19801 () Bool)

(declare-fun e!137796 () Bool)

(assert (=> mapNonEmpty!9251 (= mapRes!9251 (and tp!19801 e!137796))))

(declare-fun mapRest!9251 () (Array (_ BitVec 32) ValueCell!2378))

(declare-fun mapValue!9251 () ValueCell!2378)

(declare-fun mapKey!9251 () (_ BitVec 32))

(assert (=> mapNonEmpty!9251 (= (arr!4788 _values!649) (store mapRest!9251 mapKey!9251 mapValue!9251))))

(declare-fun b!211734 () Bool)

(declare-fun res!103425 () Bool)

(assert (=> b!211734 (=> (not res!103425) (not e!137797))))

(assert (=> b!211734 (= res!103425 (and (= (size!5113 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5112 _keys!825) (size!5113 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211735 () Bool)

(declare-fun res!103429 () Bool)

(assert (=> b!211735 (=> (not res!103429) (not e!137797))))

(assert (=> b!211735 (= res!103429 (= (select (arr!4787 _keys!825) i!601) k0!843))))

(declare-fun b!211736 () Bool)

(assert (=> b!211736 (= e!137796 tp_is_empty!5443)))

(declare-fun b!211737 () Bool)

(assert (=> b!211737 (= e!137799 (= lt!108955 (+!568 lt!108953 lt!108952)))))

(declare-fun res!103426 () Bool)

(assert (=> start!21054 (=> (not res!103426) (not e!137797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21054 (= res!103426 (validMask!0 mask!1149))))

(assert (=> start!21054 e!137797))

(declare-fun array_inv!3147 (array!10087) Bool)

(assert (=> start!21054 (and (array_inv!3147 _values!649) e!137802)))

(assert (=> start!21054 true))

(assert (=> start!21054 tp_is_empty!5443))

(declare-fun array_inv!3148 (array!10085) Bool)

(assert (=> start!21054 (array_inv!3148 _keys!825)))

(assert (=> start!21054 tp!19802))

(declare-fun b!211732 () Bool)

(declare-fun res!103433 () Bool)

(assert (=> b!211732 (=> (not res!103433) (not e!137797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10085 (_ BitVec 32)) Bool)

(assert (=> b!211732 (= res!103433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!21054 res!103426) b!211734))

(assert (= (and b!211734 res!103425) b!211732))

(assert (= (and b!211732 res!103433) b!211725))

(assert (= (and b!211725 res!103427) b!211730))

(assert (= (and b!211730 res!103434) b!211726))

(assert (= (and b!211726 res!103432) b!211735))

(assert (= (and b!211735 res!103429) b!211727))

(assert (= (and b!211727 (not res!103428)) b!211728))

(assert (= (and b!211728 res!103431) b!211733))

(assert (= (and b!211733 res!103430) b!211737))

(assert (= (and b!211731 condMapEmpty!9251) mapIsEmpty!9251))

(assert (= (and b!211731 (not condMapEmpty!9251)) mapNonEmpty!9251))

(get-info :version)

(assert (= (and mapNonEmpty!9251 ((_ is ValueCellFull!2378) mapValue!9251)) b!211736))

(assert (= (and b!211731 ((_ is ValueCellFull!2378) mapDefault!9251)) b!211729))

(assert (= start!21054 b!211731))

(declare-fun m!239611 () Bool)

(assert (=> b!211737 m!239611))

(declare-fun m!239613 () Bool)

(assert (=> mapNonEmpty!9251 m!239613))

(declare-fun m!239615 () Bool)

(assert (=> b!211727 m!239615))

(declare-fun m!239617 () Bool)

(assert (=> b!211727 m!239617))

(declare-fun m!239619 () Bool)

(assert (=> b!211727 m!239619))

(declare-fun m!239621 () Bool)

(assert (=> b!211727 m!239621))

(declare-fun m!239623 () Bool)

(assert (=> b!211727 m!239623))

(declare-fun m!239625 () Bool)

(assert (=> b!211727 m!239625))

(declare-fun m!239627 () Bool)

(assert (=> b!211727 m!239627))

(declare-fun m!239629 () Bool)

(assert (=> b!211728 m!239629))

(declare-fun m!239631 () Bool)

(assert (=> b!211735 m!239631))

(declare-fun m!239633 () Bool)

(assert (=> b!211726 m!239633))

(declare-fun m!239635 () Bool)

(assert (=> b!211732 m!239635))

(declare-fun m!239637 () Bool)

(assert (=> start!21054 m!239637))

(declare-fun m!239639 () Bool)

(assert (=> start!21054 m!239639))

(declare-fun m!239641 () Bool)

(assert (=> start!21054 m!239641))

(declare-fun m!239643 () Bool)

(assert (=> b!211733 m!239643))

(declare-fun m!239645 () Bool)

(assert (=> b!211725 m!239645))

(check-sat (not b!211732) b_and!12413 (not b!211737) (not b!211727) (not b!211728) (not b!211725) (not start!21054) (not b!211726) (not b_next!5581) (not mapNonEmpty!9251) tp_is_empty!5443 (not b!211733))
(check-sat b_and!12413 (not b_next!5581))
(get-model)

(declare-fun b!211826 () Bool)

(declare-fun e!137855 () Bool)

(declare-fun contains!1390 (List!3016 (_ BitVec 64)) Bool)

(assert (=> b!211826 (= e!137855 (contains!1390 Nil!3013 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20028 () Bool)

(declare-fun call!20031 () Bool)

(declare-fun c!35745 () Bool)

(assert (=> bm!20028 (= call!20031 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35745 (Cons!3012 (select (arr!4787 _keys!825) #b00000000000000000000000000000000) Nil!3013) Nil!3013)))))

(declare-fun b!211827 () Bool)

(declare-fun e!137853 () Bool)

(declare-fun e!137854 () Bool)

(assert (=> b!211827 (= e!137853 e!137854)))

(declare-fun res!103501 () Bool)

(assert (=> b!211827 (=> (not res!103501) (not e!137854))))

(assert (=> b!211827 (= res!103501 (not e!137855))))

(declare-fun res!103503 () Bool)

(assert (=> b!211827 (=> (not res!103503) (not e!137855))))

(assert (=> b!211827 (= res!103503 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211828 () Bool)

(declare-fun e!137856 () Bool)

(assert (=> b!211828 (= e!137854 e!137856)))

(assert (=> b!211828 (= c!35745 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211829 () Bool)

(assert (=> b!211829 (= e!137856 call!20031)))

(declare-fun b!211830 () Bool)

(assert (=> b!211830 (= e!137856 call!20031)))

(declare-fun d!58145 () Bool)

(declare-fun res!103502 () Bool)

(assert (=> d!58145 (=> res!103502 e!137853)))

(assert (=> d!58145 (= res!103502 (bvsge #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(assert (=> d!58145 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3013) e!137853)))

(assert (= (and d!58145 (not res!103502)) b!211827))

(assert (= (and b!211827 res!103503) b!211826))

(assert (= (and b!211827 res!103501) b!211828))

(assert (= (and b!211828 c!35745) b!211830))

(assert (= (and b!211828 (not c!35745)) b!211829))

(assert (= (or b!211830 b!211829) bm!20028))

(declare-fun m!239719 () Bool)

(assert (=> b!211826 m!239719))

(assert (=> b!211826 m!239719))

(declare-fun m!239721 () Bool)

(assert (=> b!211826 m!239721))

(assert (=> bm!20028 m!239719))

(declare-fun m!239723 () Bool)

(assert (=> bm!20028 m!239723))

(assert (=> b!211827 m!239719))

(assert (=> b!211827 m!239719))

(declare-fun m!239725 () Bool)

(assert (=> b!211827 m!239725))

(assert (=> b!211828 m!239719))

(assert (=> b!211828 m!239719))

(assert (=> b!211828 m!239725))

(assert (=> b!211725 d!58145))

(declare-fun d!58147 () Bool)

(assert (=> d!58147 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211726 d!58147))

(declare-fun d!58149 () Bool)

(assert (=> d!58149 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21054 d!58149))

(declare-fun d!58151 () Bool)

(assert (=> d!58151 (= (array_inv!3147 _values!649) (bvsge (size!5113 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21054 d!58151))

(declare-fun d!58153 () Bool)

(assert (=> d!58153 (= (array_inv!3148 _keys!825) (bvsge (size!5112 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21054 d!58153))

(declare-fun d!58155 () Bool)

(declare-fun e!137859 () Bool)

(assert (=> d!58155 e!137859))

(declare-fun res!103508 () Bool)

(assert (=> d!58155 (=> (not res!103508) (not e!137859))))

(declare-fun lt!109015 () ListLongMap!3047)

(declare-fun contains!1391 (ListLongMap!3047 (_ BitVec 64)) Bool)

(assert (=> d!58155 (= res!103508 (contains!1391 lt!109015 (_1!2077 (tuple2!4133 k0!843 v!520))))))

(declare-fun lt!109014 () List!3017)

(assert (=> d!58155 (= lt!109015 (ListLongMap!3048 lt!109014))))

(declare-fun lt!109016 () Unit!6420)

(declare-fun lt!109017 () Unit!6420)

(assert (=> d!58155 (= lt!109016 lt!109017)))

(declare-datatypes ((Option!260 0))(
  ( (Some!259 (v!4767 V!6905)) (None!258) )
))
(declare-fun getValueByKey!254 (List!3017 (_ BitVec 64)) Option!260)

(assert (=> d!58155 (= (getValueByKey!254 lt!109014 (_1!2077 (tuple2!4133 k0!843 v!520))) (Some!259 (_2!2077 (tuple2!4133 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!141 (List!3017 (_ BitVec 64) V!6905) Unit!6420)

(assert (=> d!58155 (= lt!109017 (lemmaContainsTupThenGetReturnValue!141 lt!109014 (_1!2077 (tuple2!4133 k0!843 v!520)) (_2!2077 (tuple2!4133 k0!843 v!520))))))

(declare-fun insertStrictlySorted!144 (List!3017 (_ BitVec 64) V!6905) List!3017)

(assert (=> d!58155 (= lt!109014 (insertStrictlySorted!144 (toList!1539 lt!108957) (_1!2077 (tuple2!4133 k0!843 v!520)) (_2!2077 (tuple2!4133 k0!843 v!520))))))

(assert (=> d!58155 (= (+!568 lt!108957 (tuple2!4133 k0!843 v!520)) lt!109015)))

(declare-fun b!211835 () Bool)

(declare-fun res!103509 () Bool)

(assert (=> b!211835 (=> (not res!103509) (not e!137859))))

(assert (=> b!211835 (= res!103509 (= (getValueByKey!254 (toList!1539 lt!109015) (_1!2077 (tuple2!4133 k0!843 v!520))) (Some!259 (_2!2077 (tuple2!4133 k0!843 v!520)))))))

(declare-fun b!211836 () Bool)

(declare-fun contains!1392 (List!3017 tuple2!4132) Bool)

(assert (=> b!211836 (= e!137859 (contains!1392 (toList!1539 lt!109015) (tuple2!4133 k0!843 v!520)))))

(assert (= (and d!58155 res!103508) b!211835))

(assert (= (and b!211835 res!103509) b!211836))

(declare-fun m!239727 () Bool)

(assert (=> d!58155 m!239727))

(declare-fun m!239729 () Bool)

(assert (=> d!58155 m!239729))

(declare-fun m!239731 () Bool)

(assert (=> d!58155 m!239731))

(declare-fun m!239733 () Bool)

(assert (=> d!58155 m!239733))

(declare-fun m!239735 () Bool)

(assert (=> b!211835 m!239735))

(declare-fun m!239737 () Bool)

(assert (=> b!211836 m!239737))

(assert (=> b!211727 d!58155))

(declare-fun b!211879 () Bool)

(declare-fun e!137895 () Bool)

(declare-fun call!20051 () Bool)

(assert (=> b!211879 (= e!137895 (not call!20051))))

(declare-fun b!211880 () Bool)

(declare-fun res!103533 () Bool)

(declare-fun e!137889 () Bool)

(assert (=> b!211880 (=> (not res!103533) (not e!137889))))

(declare-fun e!137894 () Bool)

(assert (=> b!211880 (= res!103533 e!137894)))

(declare-fun res!103531 () Bool)

(assert (=> b!211880 (=> res!103531 e!137894)))

(declare-fun e!137888 () Bool)

(assert (=> b!211880 (= res!103531 (not e!137888))))

(declare-fun res!103528 () Bool)

(assert (=> b!211880 (=> (not res!103528) (not e!137888))))

(assert (=> b!211880 (= res!103528 (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun b!211881 () Bool)

(declare-fun e!137887 () Bool)

(assert (=> b!211881 (= e!137895 e!137887)))

(declare-fun res!103530 () Bool)

(assert (=> b!211881 (= res!103530 call!20051)))

(assert (=> b!211881 (=> (not res!103530) (not e!137887))))

(declare-fun b!211882 () Bool)

(declare-fun e!137891 () Bool)

(declare-fun e!137896 () Bool)

(assert (=> b!211882 (= e!137891 e!137896)))

(declare-fun res!103536 () Bool)

(declare-fun call!20049 () Bool)

(assert (=> b!211882 (= res!103536 call!20049)))

(assert (=> b!211882 (=> (not res!103536) (not e!137896))))

(declare-fun b!211883 () Bool)

(declare-fun e!137886 () Unit!6420)

(declare-fun Unit!6422 () Unit!6420)

(assert (=> b!211883 (= e!137886 Unit!6422)))

(declare-fun b!211884 () Bool)

(declare-fun e!137892 () ListLongMap!3047)

(declare-fun call!20052 () ListLongMap!3047)

(assert (=> b!211884 (= e!137892 call!20052)))

(declare-fun b!211885 () Bool)

(declare-fun e!137893 () ListLongMap!3047)

(assert (=> b!211885 (= e!137893 call!20052)))

(declare-fun b!211886 () Bool)

(assert (=> b!211886 (= e!137888 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211887 () Bool)

(assert (=> b!211887 (= e!137891 (not call!20049))))

(declare-fun bm!20043 () Bool)

(declare-fun call!20046 () ListLongMap!3047)

(declare-fun call!20048 () ListLongMap!3047)

(assert (=> bm!20043 (= call!20046 call!20048)))

(declare-fun b!211888 () Bool)

(declare-fun e!137897 () ListLongMap!3047)

(declare-fun call!20047 () ListLongMap!3047)

(assert (=> b!211888 (= e!137897 (+!568 call!20047 (tuple2!4133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!211889 () Bool)

(declare-fun lt!109078 () ListLongMap!3047)

(declare-fun apply!195 (ListLongMap!3047 (_ BitVec 64)) V!6905)

(assert (=> b!211889 (= e!137896 (= (apply!195 lt!109078 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211890 () Bool)

(declare-fun call!20050 () ListLongMap!3047)

(assert (=> b!211890 (= e!137892 call!20050)))

(declare-fun b!211891 () Bool)

(assert (=> b!211891 (= e!137889 e!137895)))

(declare-fun c!35758 () Bool)

(assert (=> b!211891 (= c!35758 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211892 () Bool)

(declare-fun e!137898 () Bool)

(assert (=> b!211892 (= e!137898 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211893 () Bool)

(declare-fun c!35762 () Bool)

(assert (=> b!211893 (= c!35762 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!211893 (= e!137893 e!137892)))

(declare-fun d!58157 () Bool)

(assert (=> d!58157 e!137889))

(declare-fun res!103535 () Bool)

(assert (=> d!58157 (=> (not res!103535) (not e!137889))))

(assert (=> d!58157 (= res!103535 (or (bvsge #b00000000000000000000000000000000 (size!5112 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))))

(declare-fun lt!109069 () ListLongMap!3047)

(assert (=> d!58157 (= lt!109078 lt!109069)))

(declare-fun lt!109068 () Unit!6420)

(assert (=> d!58157 (= lt!109068 e!137886)))

(declare-fun c!35760 () Bool)

(assert (=> d!58157 (= c!35760 e!137898)))

(declare-fun res!103529 () Bool)

(assert (=> d!58157 (=> (not res!103529) (not e!137898))))

(assert (=> d!58157 (= res!103529 (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(assert (=> d!58157 (= lt!109069 e!137897)))

(declare-fun c!35761 () Bool)

(assert (=> d!58157 (= c!35761 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58157 (validMask!0 mask!1149)))

(assert (=> d!58157 (= (getCurrentListMap!1075 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109078)))

(declare-fun bm!20044 () Bool)

(assert (=> bm!20044 (= call!20050 call!20046)))

(declare-fun bm!20045 () Bool)

(assert (=> bm!20045 (= call!20052 call!20047)))

(declare-fun b!211894 () Bool)

(assert (=> b!211894 (= e!137897 e!137893)))

(declare-fun c!35763 () Bool)

(assert (=> b!211894 (= c!35763 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211895 () Bool)

(assert (=> b!211895 (= e!137887 (= (apply!195 lt!109078 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211896 () Bool)

(declare-fun e!137890 () Bool)

(declare-fun get!2571 (ValueCell!2378 V!6905) V!6905)

(declare-fun dynLambda!538 (Int (_ BitVec 64)) V!6905)

(assert (=> b!211896 (= e!137890 (= (apply!195 lt!109078 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)) (get!2571 (select (arr!4788 _values!649) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5113 _values!649)))))

(assert (=> b!211896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun b!211897 () Bool)

(declare-fun res!103532 () Bool)

(assert (=> b!211897 (=> (not res!103532) (not e!137889))))

(assert (=> b!211897 (= res!103532 e!137891)))

(declare-fun c!35759 () Bool)

(assert (=> b!211897 (= c!35759 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20046 () Bool)

(assert (=> bm!20046 (= call!20047 (+!568 (ite c!35761 call!20048 (ite c!35763 call!20046 call!20050)) (ite (or c!35761 c!35763) (tuple2!4133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211898 () Bool)

(assert (=> b!211898 (= e!137894 e!137890)))

(declare-fun res!103534 () Bool)

(assert (=> b!211898 (=> (not res!103534) (not e!137890))))

(assert (=> b!211898 (= res!103534 (contains!1391 lt!109078 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun bm!20047 () Bool)

(assert (=> bm!20047 (= call!20051 (contains!1391 lt!109078 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211899 () Bool)

(declare-fun lt!109064 () Unit!6420)

(assert (=> b!211899 (= e!137886 lt!109064)))

(declare-fun lt!109070 () ListLongMap!3047)

(assert (=> b!211899 (= lt!109070 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109075 () (_ BitVec 64))

(assert (=> b!211899 (= lt!109075 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109065 () (_ BitVec 64))

(assert (=> b!211899 (= lt!109065 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109062 () Unit!6420)

(declare-fun addStillContains!171 (ListLongMap!3047 (_ BitVec 64) V!6905 (_ BitVec 64)) Unit!6420)

(assert (=> b!211899 (= lt!109062 (addStillContains!171 lt!109070 lt!109075 zeroValue!615 lt!109065))))

(assert (=> b!211899 (contains!1391 (+!568 lt!109070 (tuple2!4133 lt!109075 zeroValue!615)) lt!109065)))

(declare-fun lt!109071 () Unit!6420)

(assert (=> b!211899 (= lt!109071 lt!109062)))

(declare-fun lt!109076 () ListLongMap!3047)

(assert (=> b!211899 (= lt!109076 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109074 () (_ BitVec 64))

(assert (=> b!211899 (= lt!109074 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109066 () (_ BitVec 64))

(assert (=> b!211899 (= lt!109066 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109081 () Unit!6420)

(declare-fun addApplyDifferent!171 (ListLongMap!3047 (_ BitVec 64) V!6905 (_ BitVec 64)) Unit!6420)

(assert (=> b!211899 (= lt!109081 (addApplyDifferent!171 lt!109076 lt!109074 minValue!615 lt!109066))))

(assert (=> b!211899 (= (apply!195 (+!568 lt!109076 (tuple2!4133 lt!109074 minValue!615)) lt!109066) (apply!195 lt!109076 lt!109066))))

(declare-fun lt!109079 () Unit!6420)

(assert (=> b!211899 (= lt!109079 lt!109081)))

(declare-fun lt!109077 () ListLongMap!3047)

(assert (=> b!211899 (= lt!109077 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109082 () (_ BitVec 64))

(assert (=> b!211899 (= lt!109082 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109080 () (_ BitVec 64))

(assert (=> b!211899 (= lt!109080 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109072 () Unit!6420)

(assert (=> b!211899 (= lt!109072 (addApplyDifferent!171 lt!109077 lt!109082 zeroValue!615 lt!109080))))

(assert (=> b!211899 (= (apply!195 (+!568 lt!109077 (tuple2!4133 lt!109082 zeroValue!615)) lt!109080) (apply!195 lt!109077 lt!109080))))

(declare-fun lt!109083 () Unit!6420)

(assert (=> b!211899 (= lt!109083 lt!109072)))

(declare-fun lt!109073 () ListLongMap!3047)

(assert (=> b!211899 (= lt!109073 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109067 () (_ BitVec 64))

(assert (=> b!211899 (= lt!109067 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109063 () (_ BitVec 64))

(assert (=> b!211899 (= lt!109063 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211899 (= lt!109064 (addApplyDifferent!171 lt!109073 lt!109067 minValue!615 lt!109063))))

(assert (=> b!211899 (= (apply!195 (+!568 lt!109073 (tuple2!4133 lt!109067 minValue!615)) lt!109063) (apply!195 lt!109073 lt!109063))))

(declare-fun bm!20048 () Bool)

(assert (=> bm!20048 (= call!20049 (contains!1391 lt!109078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20049 () Bool)

(assert (=> bm!20049 (= call!20048 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58157 c!35761) b!211888))

(assert (= (and d!58157 (not c!35761)) b!211894))

(assert (= (and b!211894 c!35763) b!211885))

(assert (= (and b!211894 (not c!35763)) b!211893))

(assert (= (and b!211893 c!35762) b!211884))

(assert (= (and b!211893 (not c!35762)) b!211890))

(assert (= (or b!211884 b!211890) bm!20044))

(assert (= (or b!211885 bm!20044) bm!20043))

(assert (= (or b!211885 b!211884) bm!20045))

(assert (= (or b!211888 bm!20043) bm!20049))

(assert (= (or b!211888 bm!20045) bm!20046))

(assert (= (and d!58157 res!103529) b!211892))

(assert (= (and d!58157 c!35760) b!211899))

(assert (= (and d!58157 (not c!35760)) b!211883))

(assert (= (and d!58157 res!103535) b!211880))

(assert (= (and b!211880 res!103528) b!211886))

(assert (= (and b!211880 (not res!103531)) b!211898))

(assert (= (and b!211898 res!103534) b!211896))

(assert (= (and b!211880 res!103533) b!211897))

(assert (= (and b!211897 c!35759) b!211882))

(assert (= (and b!211897 (not c!35759)) b!211887))

(assert (= (and b!211882 res!103536) b!211889))

(assert (= (or b!211882 b!211887) bm!20048))

(assert (= (and b!211897 res!103532) b!211891))

(assert (= (and b!211891 c!35758) b!211881))

(assert (= (and b!211891 (not c!35758)) b!211879))

(assert (= (and b!211881 res!103530) b!211895))

(assert (= (or b!211881 b!211879) bm!20047))

(declare-fun b_lambda!7705 () Bool)

(assert (=> (not b_lambda!7705) (not b!211896)))

(declare-fun t!7954 () Bool)

(declare-fun tb!2895 () Bool)

(assert (=> (and start!21054 (= defaultEntry!657 defaultEntry!657) t!7954) tb!2895))

(declare-fun result!4989 () Bool)

(assert (=> tb!2895 (= result!4989 tp_is_empty!5443)))

(assert (=> b!211896 t!7954))

(declare-fun b_and!12419 () Bool)

(assert (= b_and!12413 (and (=> t!7954 result!4989) b_and!12419)))

(declare-fun m!239739 () Bool)

(assert (=> b!211895 m!239739))

(assert (=> d!58157 m!239637))

(assert (=> bm!20049 m!239627))

(declare-fun m!239741 () Bool)

(assert (=> bm!20047 m!239741))

(assert (=> b!211886 m!239719))

(assert (=> b!211886 m!239719))

(assert (=> b!211886 m!239725))

(declare-fun m!239743 () Bool)

(assert (=> bm!20046 m!239743))

(assert (=> b!211898 m!239719))

(assert (=> b!211898 m!239719))

(declare-fun m!239745 () Bool)

(assert (=> b!211898 m!239745))

(declare-fun m!239747 () Bool)

(assert (=> b!211896 m!239747))

(declare-fun m!239749 () Bool)

(assert (=> b!211896 m!239749))

(assert (=> b!211896 m!239719))

(declare-fun m!239751 () Bool)

(assert (=> b!211896 m!239751))

(assert (=> b!211896 m!239719))

(assert (=> b!211896 m!239749))

(assert (=> b!211896 m!239747))

(declare-fun m!239753 () Bool)

(assert (=> b!211896 m!239753))

(assert (=> b!211892 m!239719))

(assert (=> b!211892 m!239719))

(assert (=> b!211892 m!239725))

(declare-fun m!239755 () Bool)

(assert (=> b!211888 m!239755))

(declare-fun m!239757 () Bool)

(assert (=> b!211899 m!239757))

(declare-fun m!239759 () Bool)

(assert (=> b!211899 m!239759))

(declare-fun m!239761 () Bool)

(assert (=> b!211899 m!239761))

(assert (=> b!211899 m!239757))

(declare-fun m!239763 () Bool)

(assert (=> b!211899 m!239763))

(declare-fun m!239765 () Bool)

(assert (=> b!211899 m!239765))

(declare-fun m!239767 () Bool)

(assert (=> b!211899 m!239767))

(declare-fun m!239769 () Bool)

(assert (=> b!211899 m!239769))

(assert (=> b!211899 m!239719))

(declare-fun m!239771 () Bool)

(assert (=> b!211899 m!239771))

(assert (=> b!211899 m!239759))

(declare-fun m!239773 () Bool)

(assert (=> b!211899 m!239773))

(declare-fun m!239775 () Bool)

(assert (=> b!211899 m!239775))

(assert (=> b!211899 m!239627))

(declare-fun m!239777 () Bool)

(assert (=> b!211899 m!239777))

(declare-fun m!239779 () Bool)

(assert (=> b!211899 m!239779))

(assert (=> b!211899 m!239773))

(declare-fun m!239781 () Bool)

(assert (=> b!211899 m!239781))

(declare-fun m!239783 () Bool)

(assert (=> b!211899 m!239783))

(assert (=> b!211899 m!239771))

(declare-fun m!239785 () Bool)

(assert (=> b!211899 m!239785))

(declare-fun m!239787 () Bool)

(assert (=> bm!20048 m!239787))

(declare-fun m!239789 () Bool)

(assert (=> b!211889 m!239789))

(assert (=> b!211727 d!58157))

(declare-fun b!211926 () Bool)

(declare-fun lt!109099 () Unit!6420)

(declare-fun lt!109103 () Unit!6420)

(assert (=> b!211926 (= lt!109099 lt!109103)))

(declare-fun lt!109104 () (_ BitVec 64))

(declare-fun lt!109102 () (_ BitVec 64))

(declare-fun lt!109098 () ListLongMap!3047)

(declare-fun lt!109101 () V!6905)

(assert (=> b!211926 (not (contains!1391 (+!568 lt!109098 (tuple2!4133 lt!109102 lt!109101)) lt!109104))))

(declare-fun addStillNotContains!106 (ListLongMap!3047 (_ BitVec 64) V!6905 (_ BitVec 64)) Unit!6420)

(assert (=> b!211926 (= lt!109103 (addStillNotContains!106 lt!109098 lt!109102 lt!109101 lt!109104))))

(assert (=> b!211926 (= lt!109104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211926 (= lt!109101 (get!2571 (select (arr!4788 _values!649) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211926 (= lt!109102 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!20055 () ListLongMap!3047)

(assert (=> b!211926 (= lt!109098 call!20055)))

(declare-fun e!137919 () ListLongMap!3047)

(assert (=> b!211926 (= e!137919 (+!568 call!20055 (tuple2!4133 (select (arr!4787 _keys!825) #b00000000000000000000000000000000) (get!2571 (select (arr!4788 _values!649) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!20052 () Bool)

(assert (=> bm!20052 (= call!20055 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211927 () Bool)

(declare-fun e!137913 () ListLongMap!3047)

(assert (=> b!211927 (= e!137913 e!137919)))

(declare-fun c!35774 () Bool)

(assert (=> b!211927 (= c!35774 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211928 () Bool)

(declare-fun e!137914 () Bool)

(assert (=> b!211928 (= e!137914 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211928 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211929 () Bool)

(assert (=> b!211929 (= e!137919 call!20055)))

(declare-fun b!211930 () Bool)

(assert (=> b!211930 (= e!137913 (ListLongMap!3048 Nil!3014))))

(declare-fun d!58159 () Bool)

(declare-fun e!137918 () Bool)

(assert (=> d!58159 e!137918))

(declare-fun res!103546 () Bool)

(assert (=> d!58159 (=> (not res!103546) (not e!137918))))

(declare-fun lt!109100 () ListLongMap!3047)

(assert (=> d!58159 (= res!103546 (not (contains!1391 lt!109100 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58159 (= lt!109100 e!137913)))

(declare-fun c!35775 () Bool)

(assert (=> d!58159 (= c!35775 (bvsge #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(assert (=> d!58159 (validMask!0 mask!1149)))

(assert (=> d!58159 (= (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109100)))

(declare-fun b!211931 () Bool)

(declare-fun res!103545 () Bool)

(assert (=> b!211931 (=> (not res!103545) (not e!137918))))

(assert (=> b!211931 (= res!103545 (not (contains!1391 lt!109100 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211932 () Bool)

(declare-fun e!137915 () Bool)

(declare-fun e!137917 () Bool)

(assert (=> b!211932 (= e!137915 e!137917)))

(declare-fun c!35773 () Bool)

(assert (=> b!211932 (= c!35773 (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun b!211933 () Bool)

(assert (=> b!211933 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(assert (=> b!211933 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5113 _values!649)))))

(declare-fun e!137916 () Bool)

(assert (=> b!211933 (= e!137916 (= (apply!195 lt!109100 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)) (get!2571 (select (arr!4788 _values!649) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211934 () Bool)

(assert (=> b!211934 (= e!137918 e!137915)))

(declare-fun c!35772 () Bool)

(assert (=> b!211934 (= c!35772 e!137914)))

(declare-fun res!103547 () Bool)

(assert (=> b!211934 (=> (not res!103547) (not e!137914))))

(assert (=> b!211934 (= res!103547 (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun b!211935 () Bool)

(declare-fun isEmpty!502 (ListLongMap!3047) Bool)

(assert (=> b!211935 (= e!137917 (isEmpty!502 lt!109100))))

(declare-fun b!211936 () Bool)

(assert (=> b!211936 (= e!137917 (= lt!109100 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211937 () Bool)

(assert (=> b!211937 (= e!137915 e!137916)))

(assert (=> b!211937 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun res!103548 () Bool)

(assert (=> b!211937 (= res!103548 (contains!1391 lt!109100 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211937 (=> (not res!103548) (not e!137916))))

(assert (= (and d!58159 c!35775) b!211930))

(assert (= (and d!58159 (not c!35775)) b!211927))

(assert (= (and b!211927 c!35774) b!211926))

(assert (= (and b!211927 (not c!35774)) b!211929))

(assert (= (or b!211926 b!211929) bm!20052))

(assert (= (and d!58159 res!103546) b!211931))

(assert (= (and b!211931 res!103545) b!211934))

(assert (= (and b!211934 res!103547) b!211928))

(assert (= (and b!211934 c!35772) b!211937))

(assert (= (and b!211934 (not c!35772)) b!211932))

(assert (= (and b!211937 res!103548) b!211933))

(assert (= (and b!211932 c!35773) b!211936))

(assert (= (and b!211932 (not c!35773)) b!211935))

(declare-fun b_lambda!7707 () Bool)

(assert (=> (not b_lambda!7707) (not b!211926)))

(assert (=> b!211926 t!7954))

(declare-fun b_and!12421 () Bool)

(assert (= b_and!12419 (and (=> t!7954 result!4989) b_and!12421)))

(declare-fun b_lambda!7709 () Bool)

(assert (=> (not b_lambda!7709) (not b!211933)))

(assert (=> b!211933 t!7954))

(declare-fun b_and!12423 () Bool)

(assert (= b_and!12421 (and (=> t!7954 result!4989) b_and!12423)))

(assert (=> b!211926 m!239749))

(declare-fun m!239791 () Bool)

(assert (=> b!211926 m!239791))

(declare-fun m!239793 () Bool)

(assert (=> b!211926 m!239793))

(assert (=> b!211926 m!239791))

(assert (=> b!211926 m!239719))

(assert (=> b!211926 m!239747))

(declare-fun m!239795 () Bool)

(assert (=> b!211926 m!239795))

(declare-fun m!239797 () Bool)

(assert (=> b!211926 m!239797))

(assert (=> b!211926 m!239749))

(assert (=> b!211926 m!239747))

(assert (=> b!211926 m!239753))

(declare-fun m!239799 () Bool)

(assert (=> d!58159 m!239799))

(assert (=> d!58159 m!239637))

(declare-fun m!239801 () Bool)

(assert (=> bm!20052 m!239801))

(declare-fun m!239803 () Bool)

(assert (=> b!211935 m!239803))

(assert (=> b!211933 m!239749))

(assert (=> b!211933 m!239719))

(declare-fun m!239805 () Bool)

(assert (=> b!211933 m!239805))

(assert (=> b!211933 m!239719))

(assert (=> b!211933 m!239747))

(assert (=> b!211933 m!239749))

(assert (=> b!211933 m!239747))

(assert (=> b!211933 m!239753))

(assert (=> b!211936 m!239801))

(assert (=> b!211928 m!239719))

(assert (=> b!211928 m!239719))

(assert (=> b!211928 m!239725))

(declare-fun m!239807 () Bool)

(assert (=> b!211931 m!239807))

(assert (=> b!211937 m!239719))

(assert (=> b!211937 m!239719))

(declare-fun m!239809 () Bool)

(assert (=> b!211937 m!239809))

(assert (=> b!211927 m!239719))

(assert (=> b!211927 m!239719))

(assert (=> b!211927 m!239725))

(assert (=> b!211727 d!58159))

(declare-fun b!211938 () Bool)

(declare-fun e!137929 () Bool)

(declare-fun call!20061 () Bool)

(assert (=> b!211938 (= e!137929 (not call!20061))))

(declare-fun b!211939 () Bool)

(declare-fun res!103554 () Bool)

(declare-fun e!137923 () Bool)

(assert (=> b!211939 (=> (not res!103554) (not e!137923))))

(declare-fun e!137928 () Bool)

(assert (=> b!211939 (= res!103554 e!137928)))

(declare-fun res!103552 () Bool)

(assert (=> b!211939 (=> res!103552 e!137928)))

(declare-fun e!137922 () Bool)

(assert (=> b!211939 (= res!103552 (not e!137922))))

(declare-fun res!103549 () Bool)

(assert (=> b!211939 (=> (not res!103549) (not e!137922))))

(assert (=> b!211939 (= res!103549 (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun b!211940 () Bool)

(declare-fun e!137921 () Bool)

(assert (=> b!211940 (= e!137929 e!137921)))

(declare-fun res!103551 () Bool)

(assert (=> b!211940 (= res!103551 call!20061)))

(assert (=> b!211940 (=> (not res!103551) (not e!137921))))

(declare-fun b!211941 () Bool)

(declare-fun e!137925 () Bool)

(declare-fun e!137930 () Bool)

(assert (=> b!211941 (= e!137925 e!137930)))

(declare-fun res!103557 () Bool)

(declare-fun call!20059 () Bool)

(assert (=> b!211941 (= res!103557 call!20059)))

(assert (=> b!211941 (=> (not res!103557) (not e!137930))))

(declare-fun b!211942 () Bool)

(declare-fun e!137920 () Unit!6420)

(declare-fun Unit!6423 () Unit!6420)

(assert (=> b!211942 (= e!137920 Unit!6423)))

(declare-fun b!211943 () Bool)

(declare-fun e!137926 () ListLongMap!3047)

(declare-fun call!20062 () ListLongMap!3047)

(assert (=> b!211943 (= e!137926 call!20062)))

(declare-fun b!211944 () Bool)

(declare-fun e!137927 () ListLongMap!3047)

(assert (=> b!211944 (= e!137927 call!20062)))

(declare-fun b!211945 () Bool)

(assert (=> b!211945 (= e!137922 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211946 () Bool)

(assert (=> b!211946 (= e!137925 (not call!20059))))

(declare-fun bm!20053 () Bool)

(declare-fun call!20056 () ListLongMap!3047)

(declare-fun call!20058 () ListLongMap!3047)

(assert (=> bm!20053 (= call!20056 call!20058)))

(declare-fun b!211947 () Bool)

(declare-fun e!137931 () ListLongMap!3047)

(declare-fun call!20057 () ListLongMap!3047)

(assert (=> b!211947 (= e!137931 (+!568 call!20057 (tuple2!4133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!211948 () Bool)

(declare-fun lt!109121 () ListLongMap!3047)

(assert (=> b!211948 (= e!137930 (= (apply!195 lt!109121 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!211949 () Bool)

(declare-fun call!20060 () ListLongMap!3047)

(assert (=> b!211949 (= e!137926 call!20060)))

(declare-fun b!211950 () Bool)

(assert (=> b!211950 (= e!137923 e!137929)))

(declare-fun c!35776 () Bool)

(assert (=> b!211950 (= c!35776 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211951 () Bool)

(declare-fun e!137932 () Bool)

(assert (=> b!211951 (= e!137932 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211952 () Bool)

(declare-fun c!35780 () Bool)

(assert (=> b!211952 (= c!35780 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!211952 (= e!137927 e!137926)))

(declare-fun d!58161 () Bool)

(assert (=> d!58161 e!137923))

(declare-fun res!103556 () Bool)

(assert (=> d!58161 (=> (not res!103556) (not e!137923))))

(assert (=> d!58161 (= res!103556 (or (bvsge #b00000000000000000000000000000000 (size!5112 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))))

(declare-fun lt!109112 () ListLongMap!3047)

(assert (=> d!58161 (= lt!109121 lt!109112)))

(declare-fun lt!109111 () Unit!6420)

(assert (=> d!58161 (= lt!109111 e!137920)))

(declare-fun c!35778 () Bool)

(assert (=> d!58161 (= c!35778 e!137932)))

(declare-fun res!103550 () Bool)

(assert (=> d!58161 (=> (not res!103550) (not e!137932))))

(assert (=> d!58161 (= res!103550 (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(assert (=> d!58161 (= lt!109112 e!137931)))

(declare-fun c!35779 () Bool)

(assert (=> d!58161 (= c!35779 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58161 (validMask!0 mask!1149)))

(assert (=> d!58161 (= (getCurrentListMap!1075 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109121)))

(declare-fun bm!20054 () Bool)

(assert (=> bm!20054 (= call!20060 call!20056)))

(declare-fun bm!20055 () Bool)

(assert (=> bm!20055 (= call!20062 call!20057)))

(declare-fun b!211953 () Bool)

(assert (=> b!211953 (= e!137931 e!137927)))

(declare-fun c!35781 () Bool)

(assert (=> b!211953 (= c!35781 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211954 () Bool)

(assert (=> b!211954 (= e!137921 (= (apply!195 lt!109121 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun e!137924 () Bool)

(declare-fun b!211955 () Bool)

(assert (=> b!211955 (= e!137924 (= (apply!195 lt!109121 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)) (get!2571 (select (arr!4788 lt!108951) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5113 lt!108951)))))

(assert (=> b!211955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun b!211956 () Bool)

(declare-fun res!103553 () Bool)

(assert (=> b!211956 (=> (not res!103553) (not e!137923))))

(assert (=> b!211956 (= res!103553 e!137925)))

(declare-fun c!35777 () Bool)

(assert (=> b!211956 (= c!35777 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20056 () Bool)

(assert (=> bm!20056 (= call!20057 (+!568 (ite c!35779 call!20058 (ite c!35781 call!20056 call!20060)) (ite (or c!35779 c!35781) (tuple2!4133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211957 () Bool)

(assert (=> b!211957 (= e!137928 e!137924)))

(declare-fun res!103555 () Bool)

(assert (=> b!211957 (=> (not res!103555) (not e!137924))))

(assert (=> b!211957 (= res!103555 (contains!1391 lt!109121 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211957 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun bm!20057 () Bool)

(assert (=> bm!20057 (= call!20061 (contains!1391 lt!109121 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211958 () Bool)

(declare-fun lt!109107 () Unit!6420)

(assert (=> b!211958 (= e!137920 lt!109107)))

(declare-fun lt!109113 () ListLongMap!3047)

(assert (=> b!211958 (= lt!109113 (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109118 () (_ BitVec 64))

(assert (=> b!211958 (= lt!109118 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109108 () (_ BitVec 64))

(assert (=> b!211958 (= lt!109108 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109105 () Unit!6420)

(assert (=> b!211958 (= lt!109105 (addStillContains!171 lt!109113 lt!109118 zeroValue!615 lt!109108))))

(assert (=> b!211958 (contains!1391 (+!568 lt!109113 (tuple2!4133 lt!109118 zeroValue!615)) lt!109108)))

(declare-fun lt!109114 () Unit!6420)

(assert (=> b!211958 (= lt!109114 lt!109105)))

(declare-fun lt!109119 () ListLongMap!3047)

(assert (=> b!211958 (= lt!109119 (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109117 () (_ BitVec 64))

(assert (=> b!211958 (= lt!109117 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109109 () (_ BitVec 64))

(assert (=> b!211958 (= lt!109109 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109124 () Unit!6420)

(assert (=> b!211958 (= lt!109124 (addApplyDifferent!171 lt!109119 lt!109117 minValue!615 lt!109109))))

(assert (=> b!211958 (= (apply!195 (+!568 lt!109119 (tuple2!4133 lt!109117 minValue!615)) lt!109109) (apply!195 lt!109119 lt!109109))))

(declare-fun lt!109122 () Unit!6420)

(assert (=> b!211958 (= lt!109122 lt!109124)))

(declare-fun lt!109120 () ListLongMap!3047)

(assert (=> b!211958 (= lt!109120 (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109125 () (_ BitVec 64))

(assert (=> b!211958 (= lt!109125 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109123 () (_ BitVec 64))

(assert (=> b!211958 (= lt!109123 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109115 () Unit!6420)

(assert (=> b!211958 (= lt!109115 (addApplyDifferent!171 lt!109120 lt!109125 zeroValue!615 lt!109123))))

(assert (=> b!211958 (= (apply!195 (+!568 lt!109120 (tuple2!4133 lt!109125 zeroValue!615)) lt!109123) (apply!195 lt!109120 lt!109123))))

(declare-fun lt!109126 () Unit!6420)

(assert (=> b!211958 (= lt!109126 lt!109115)))

(declare-fun lt!109116 () ListLongMap!3047)

(assert (=> b!211958 (= lt!109116 (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109110 () (_ BitVec 64))

(assert (=> b!211958 (= lt!109110 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109106 () (_ BitVec 64))

(assert (=> b!211958 (= lt!109106 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211958 (= lt!109107 (addApplyDifferent!171 lt!109116 lt!109110 minValue!615 lt!109106))))

(assert (=> b!211958 (= (apply!195 (+!568 lt!109116 (tuple2!4133 lt!109110 minValue!615)) lt!109106) (apply!195 lt!109116 lt!109106))))

(declare-fun bm!20058 () Bool)

(assert (=> bm!20058 (= call!20059 (contains!1391 lt!109121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20059 () Bool)

(assert (=> bm!20059 (= call!20058 (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!58161 c!35779) b!211947))

(assert (= (and d!58161 (not c!35779)) b!211953))

(assert (= (and b!211953 c!35781) b!211944))

(assert (= (and b!211953 (not c!35781)) b!211952))

(assert (= (and b!211952 c!35780) b!211943))

(assert (= (and b!211952 (not c!35780)) b!211949))

(assert (= (or b!211943 b!211949) bm!20054))

(assert (= (or b!211944 bm!20054) bm!20053))

(assert (= (or b!211944 b!211943) bm!20055))

(assert (= (or b!211947 bm!20053) bm!20059))

(assert (= (or b!211947 bm!20055) bm!20056))

(assert (= (and d!58161 res!103550) b!211951))

(assert (= (and d!58161 c!35778) b!211958))

(assert (= (and d!58161 (not c!35778)) b!211942))

(assert (= (and d!58161 res!103556) b!211939))

(assert (= (and b!211939 res!103549) b!211945))

(assert (= (and b!211939 (not res!103552)) b!211957))

(assert (= (and b!211957 res!103555) b!211955))

(assert (= (and b!211939 res!103554) b!211956))

(assert (= (and b!211956 c!35777) b!211941))

(assert (= (and b!211956 (not c!35777)) b!211946))

(assert (= (and b!211941 res!103557) b!211948))

(assert (= (or b!211941 b!211946) bm!20058))

(assert (= (and b!211956 res!103553) b!211950))

(assert (= (and b!211950 c!35776) b!211940))

(assert (= (and b!211950 (not c!35776)) b!211938))

(assert (= (and b!211940 res!103551) b!211954))

(assert (= (or b!211940 b!211938) bm!20057))

(declare-fun b_lambda!7711 () Bool)

(assert (=> (not b_lambda!7711) (not b!211955)))

(assert (=> b!211955 t!7954))

(declare-fun b_and!12425 () Bool)

(assert (= b_and!12423 (and (=> t!7954 result!4989) b_and!12425)))

(declare-fun m!239811 () Bool)

(assert (=> b!211954 m!239811))

(assert (=> d!58161 m!239637))

(assert (=> bm!20059 m!239623))

(declare-fun m!239813 () Bool)

(assert (=> bm!20057 m!239813))

(assert (=> b!211945 m!239719))

(assert (=> b!211945 m!239719))

(assert (=> b!211945 m!239725))

(declare-fun m!239815 () Bool)

(assert (=> bm!20056 m!239815))

(assert (=> b!211957 m!239719))

(assert (=> b!211957 m!239719))

(declare-fun m!239817 () Bool)

(assert (=> b!211957 m!239817))

(assert (=> b!211955 m!239747))

(declare-fun m!239819 () Bool)

(assert (=> b!211955 m!239819))

(assert (=> b!211955 m!239719))

(declare-fun m!239821 () Bool)

(assert (=> b!211955 m!239821))

(assert (=> b!211955 m!239719))

(assert (=> b!211955 m!239819))

(assert (=> b!211955 m!239747))

(declare-fun m!239823 () Bool)

(assert (=> b!211955 m!239823))

(assert (=> b!211951 m!239719))

(assert (=> b!211951 m!239719))

(assert (=> b!211951 m!239725))

(declare-fun m!239825 () Bool)

(assert (=> b!211947 m!239825))

(declare-fun m!239827 () Bool)

(assert (=> b!211958 m!239827))

(declare-fun m!239829 () Bool)

(assert (=> b!211958 m!239829))

(declare-fun m!239831 () Bool)

(assert (=> b!211958 m!239831))

(assert (=> b!211958 m!239827))

(declare-fun m!239833 () Bool)

(assert (=> b!211958 m!239833))

(declare-fun m!239835 () Bool)

(assert (=> b!211958 m!239835))

(declare-fun m!239837 () Bool)

(assert (=> b!211958 m!239837))

(declare-fun m!239839 () Bool)

(assert (=> b!211958 m!239839))

(assert (=> b!211958 m!239719))

(declare-fun m!239841 () Bool)

(assert (=> b!211958 m!239841))

(assert (=> b!211958 m!239829))

(declare-fun m!239843 () Bool)

(assert (=> b!211958 m!239843))

(declare-fun m!239845 () Bool)

(assert (=> b!211958 m!239845))

(assert (=> b!211958 m!239623))

(declare-fun m!239847 () Bool)

(assert (=> b!211958 m!239847))

(declare-fun m!239849 () Bool)

(assert (=> b!211958 m!239849))

(assert (=> b!211958 m!239843))

(declare-fun m!239851 () Bool)

(assert (=> b!211958 m!239851))

(declare-fun m!239853 () Bool)

(assert (=> b!211958 m!239853))

(assert (=> b!211958 m!239841))

(declare-fun m!239855 () Bool)

(assert (=> b!211958 m!239855))

(declare-fun m!239857 () Bool)

(assert (=> bm!20058 m!239857))

(declare-fun m!239859 () Bool)

(assert (=> b!211948 m!239859))

(assert (=> b!211727 d!58161))

(declare-fun b!211959 () Bool)

(declare-fun lt!109128 () Unit!6420)

(declare-fun lt!109132 () Unit!6420)

(assert (=> b!211959 (= lt!109128 lt!109132)))

(declare-fun lt!109127 () ListLongMap!3047)

(declare-fun lt!109131 () (_ BitVec 64))

(declare-fun lt!109133 () (_ BitVec 64))

(declare-fun lt!109130 () V!6905)

(assert (=> b!211959 (not (contains!1391 (+!568 lt!109127 (tuple2!4133 lt!109131 lt!109130)) lt!109133))))

(assert (=> b!211959 (= lt!109132 (addStillNotContains!106 lt!109127 lt!109131 lt!109130 lt!109133))))

(assert (=> b!211959 (= lt!109133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211959 (= lt!109130 (get!2571 (select (arr!4788 lt!108951) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211959 (= lt!109131 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!20063 () ListLongMap!3047)

(assert (=> b!211959 (= lt!109127 call!20063)))

(declare-fun e!137939 () ListLongMap!3047)

(assert (=> b!211959 (= e!137939 (+!568 call!20063 (tuple2!4133 (select (arr!4787 _keys!825) #b00000000000000000000000000000000) (get!2571 (select (arr!4788 lt!108951) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!20060 () Bool)

(assert (=> bm!20060 (= call!20063 (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211960 () Bool)

(declare-fun e!137933 () ListLongMap!3047)

(assert (=> b!211960 (= e!137933 e!137939)))

(declare-fun c!35784 () Bool)

(assert (=> b!211960 (= c!35784 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211961 () Bool)

(declare-fun e!137934 () Bool)

(assert (=> b!211961 (= e!137934 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211961 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!211962 () Bool)

(assert (=> b!211962 (= e!137939 call!20063)))

(declare-fun b!211963 () Bool)

(assert (=> b!211963 (= e!137933 (ListLongMap!3048 Nil!3014))))

(declare-fun d!58163 () Bool)

(declare-fun e!137938 () Bool)

(assert (=> d!58163 e!137938))

(declare-fun res!103559 () Bool)

(assert (=> d!58163 (=> (not res!103559) (not e!137938))))

(declare-fun lt!109129 () ListLongMap!3047)

(assert (=> d!58163 (= res!103559 (not (contains!1391 lt!109129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58163 (= lt!109129 e!137933)))

(declare-fun c!35785 () Bool)

(assert (=> d!58163 (= c!35785 (bvsge #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(assert (=> d!58163 (validMask!0 mask!1149)))

(assert (=> d!58163 (= (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109129)))

(declare-fun b!211964 () Bool)

(declare-fun res!103558 () Bool)

(assert (=> b!211964 (=> (not res!103558) (not e!137938))))

(assert (=> b!211964 (= res!103558 (not (contains!1391 lt!109129 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211965 () Bool)

(declare-fun e!137935 () Bool)

(declare-fun e!137937 () Bool)

(assert (=> b!211965 (= e!137935 e!137937)))

(declare-fun c!35783 () Bool)

(assert (=> b!211965 (= c!35783 (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun b!211966 () Bool)

(assert (=> b!211966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(assert (=> b!211966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5113 lt!108951)))))

(declare-fun e!137936 () Bool)

(assert (=> b!211966 (= e!137936 (= (apply!195 lt!109129 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)) (get!2571 (select (arr!4788 lt!108951) #b00000000000000000000000000000000) (dynLambda!538 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211967 () Bool)

(assert (=> b!211967 (= e!137938 e!137935)))

(declare-fun c!35782 () Bool)

(assert (=> b!211967 (= c!35782 e!137934)))

(declare-fun res!103560 () Bool)

(assert (=> b!211967 (=> (not res!103560) (not e!137934))))

(assert (=> b!211967 (= res!103560 (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun b!211968 () Bool)

(assert (=> b!211968 (= e!137937 (isEmpty!502 lt!109129))))

(declare-fun b!211969 () Bool)

(assert (=> b!211969 (= e!137937 (= lt!109129 (getCurrentListMapNoExtraKeys!498 _keys!825 lt!108951 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211970 () Bool)

(assert (=> b!211970 (= e!137935 e!137936)))

(assert (=> b!211970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(declare-fun res!103561 () Bool)

(assert (=> b!211970 (= res!103561 (contains!1391 lt!109129 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211970 (=> (not res!103561) (not e!137936))))

(assert (= (and d!58163 c!35785) b!211963))

(assert (= (and d!58163 (not c!35785)) b!211960))

(assert (= (and b!211960 c!35784) b!211959))

(assert (= (and b!211960 (not c!35784)) b!211962))

(assert (= (or b!211959 b!211962) bm!20060))

(assert (= (and d!58163 res!103559) b!211964))

(assert (= (and b!211964 res!103558) b!211967))

(assert (= (and b!211967 res!103560) b!211961))

(assert (= (and b!211967 c!35782) b!211970))

(assert (= (and b!211967 (not c!35782)) b!211965))

(assert (= (and b!211970 res!103561) b!211966))

(assert (= (and b!211965 c!35783) b!211969))

(assert (= (and b!211965 (not c!35783)) b!211968))

(declare-fun b_lambda!7713 () Bool)

(assert (=> (not b_lambda!7713) (not b!211959)))

(assert (=> b!211959 t!7954))

(declare-fun b_and!12427 () Bool)

(assert (= b_and!12425 (and (=> t!7954 result!4989) b_and!12427)))

(declare-fun b_lambda!7715 () Bool)

(assert (=> (not b_lambda!7715) (not b!211966)))

(assert (=> b!211966 t!7954))

(declare-fun b_and!12429 () Bool)

(assert (= b_and!12427 (and (=> t!7954 result!4989) b_and!12429)))

(assert (=> b!211959 m!239819))

(declare-fun m!239861 () Bool)

(assert (=> b!211959 m!239861))

(declare-fun m!239863 () Bool)

(assert (=> b!211959 m!239863))

(assert (=> b!211959 m!239861))

(assert (=> b!211959 m!239719))

(assert (=> b!211959 m!239747))

(declare-fun m!239865 () Bool)

(assert (=> b!211959 m!239865))

(declare-fun m!239867 () Bool)

(assert (=> b!211959 m!239867))

(assert (=> b!211959 m!239819))

(assert (=> b!211959 m!239747))

(assert (=> b!211959 m!239823))

(declare-fun m!239869 () Bool)

(assert (=> d!58163 m!239869))

(assert (=> d!58163 m!239637))

(declare-fun m!239871 () Bool)

(assert (=> bm!20060 m!239871))

(declare-fun m!239873 () Bool)

(assert (=> b!211968 m!239873))

(assert (=> b!211966 m!239819))

(assert (=> b!211966 m!239719))

(declare-fun m!239875 () Bool)

(assert (=> b!211966 m!239875))

(assert (=> b!211966 m!239719))

(assert (=> b!211966 m!239747))

(assert (=> b!211966 m!239819))

(assert (=> b!211966 m!239747))

(assert (=> b!211966 m!239823))

(assert (=> b!211969 m!239871))

(assert (=> b!211961 m!239719))

(assert (=> b!211961 m!239719))

(assert (=> b!211961 m!239725))

(declare-fun m!239877 () Bool)

(assert (=> b!211964 m!239877))

(assert (=> b!211970 m!239719))

(assert (=> b!211970 m!239719))

(declare-fun m!239879 () Bool)

(assert (=> b!211970 m!239879))

(assert (=> b!211960 m!239719))

(assert (=> b!211960 m!239719))

(assert (=> b!211960 m!239725))

(assert (=> b!211727 d!58163))

(declare-fun call!20069 () ListLongMap!3047)

(declare-fun bm!20065 () Bool)

(assert (=> bm!20065 (= call!20069 (getCurrentListMapNoExtraKeys!498 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211977 () Bool)

(declare-fun e!137944 () Bool)

(declare-fun call!20068 () ListLongMap!3047)

(assert (=> b!211977 (= e!137944 (= call!20068 call!20069))))

(declare-fun b!211978 () Bool)

(assert (=> b!211978 (= e!137944 (= call!20068 (+!568 call!20069 (tuple2!4133 k0!843 v!520))))))

(declare-fun bm!20066 () Bool)

(assert (=> bm!20066 (= call!20068 (getCurrentListMapNoExtraKeys!498 _keys!825 (array!10088 (store (arr!4788 _values!649) i!601 (ValueCellFull!2378 v!520)) (size!5113 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211979 () Bool)

(declare-fun e!137945 () Bool)

(assert (=> b!211979 (= e!137945 e!137944)))

(declare-fun c!35788 () Bool)

(assert (=> b!211979 (= c!35788 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun d!58165 () Bool)

(assert (=> d!58165 e!137945))

(declare-fun res!103564 () Bool)

(assert (=> d!58165 (=> (not res!103564) (not e!137945))))

(assert (=> d!58165 (= res!103564 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5113 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5113 _values!649))))))))

(declare-fun lt!109136 () Unit!6420)

(declare-fun choose!1086 (array!10085 array!10087 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) (_ BitVec 64) V!6905 (_ BitVec 32) Int) Unit!6420)

(assert (=> d!58165 (= lt!109136 (choose!1086 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(assert (=> d!58165 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!216 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!109136)))

(assert (= (and d!58165 res!103564) b!211979))

(assert (= (and b!211979 c!35788) b!211978))

(assert (= (and b!211979 (not c!35788)) b!211977))

(assert (= (or b!211978 b!211977) bm!20066))

(assert (= (or b!211978 b!211977) bm!20065))

(assert (=> bm!20065 m!239627))

(declare-fun m!239881 () Bool)

(assert (=> b!211978 m!239881))

(assert (=> bm!20066 m!239619))

(declare-fun m!239883 () Bool)

(assert (=> bm!20066 m!239883))

(declare-fun m!239885 () Bool)

(assert (=> d!58165 m!239885))

(assert (=> b!211727 d!58165))

(declare-fun d!58167 () Bool)

(declare-fun e!137946 () Bool)

(assert (=> d!58167 e!137946))

(declare-fun res!103565 () Bool)

(assert (=> d!58167 (=> (not res!103565) (not e!137946))))

(declare-fun lt!109138 () ListLongMap!3047)

(assert (=> d!58167 (= res!103565 (contains!1391 lt!109138 (_1!2077 lt!108952)))))

(declare-fun lt!109137 () List!3017)

(assert (=> d!58167 (= lt!109138 (ListLongMap!3048 lt!109137))))

(declare-fun lt!109139 () Unit!6420)

(declare-fun lt!109140 () Unit!6420)

(assert (=> d!58167 (= lt!109139 lt!109140)))

(assert (=> d!58167 (= (getValueByKey!254 lt!109137 (_1!2077 lt!108952)) (Some!259 (_2!2077 lt!108952)))))

(assert (=> d!58167 (= lt!109140 (lemmaContainsTupThenGetReturnValue!141 lt!109137 (_1!2077 lt!108952) (_2!2077 lt!108952)))))

(assert (=> d!58167 (= lt!109137 (insertStrictlySorted!144 (toList!1539 lt!108954) (_1!2077 lt!108952) (_2!2077 lt!108952)))))

(assert (=> d!58167 (= (+!568 lt!108954 lt!108952) lt!109138)))

(declare-fun b!211980 () Bool)

(declare-fun res!103566 () Bool)

(assert (=> b!211980 (=> (not res!103566) (not e!137946))))

(assert (=> b!211980 (= res!103566 (= (getValueByKey!254 (toList!1539 lt!109138) (_1!2077 lt!108952)) (Some!259 (_2!2077 lt!108952))))))

(declare-fun b!211981 () Bool)

(assert (=> b!211981 (= e!137946 (contains!1392 (toList!1539 lt!109138) lt!108952))))

(assert (= (and d!58167 res!103565) b!211980))

(assert (= (and b!211980 res!103566) b!211981))

(declare-fun m!239887 () Bool)

(assert (=> d!58167 m!239887))

(declare-fun m!239889 () Bool)

(assert (=> d!58167 m!239889))

(declare-fun m!239891 () Bool)

(assert (=> d!58167 m!239891))

(declare-fun m!239893 () Bool)

(assert (=> d!58167 m!239893))

(declare-fun m!239895 () Bool)

(assert (=> b!211980 m!239895))

(declare-fun m!239897 () Bool)

(assert (=> b!211981 m!239897))

(assert (=> b!211728 d!58167))

(declare-fun b!211990 () Bool)

(declare-fun e!137954 () Bool)

(declare-fun call!20072 () Bool)

(assert (=> b!211990 (= e!137954 call!20072)))

(declare-fun bm!20069 () Bool)

(assert (=> bm!20069 (= call!20072 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!211991 () Bool)

(declare-fun e!137955 () Bool)

(assert (=> b!211991 (= e!137954 e!137955)))

(declare-fun lt!109149 () (_ BitVec 64))

(assert (=> b!211991 (= lt!109149 (select (arr!4787 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109148 () Unit!6420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10085 (_ BitVec 64) (_ BitVec 32)) Unit!6420)

(assert (=> b!211991 (= lt!109148 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109149 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!211991 (arrayContainsKey!0 _keys!825 lt!109149 #b00000000000000000000000000000000)))

(declare-fun lt!109147 () Unit!6420)

(assert (=> b!211991 (= lt!109147 lt!109148)))

(declare-fun res!103572 () Bool)

(declare-datatypes ((SeekEntryResult!699 0))(
  ( (MissingZero!699 (index!4966 (_ BitVec 32))) (Found!699 (index!4967 (_ BitVec 32))) (Intermediate!699 (undefined!1511 Bool) (index!4968 (_ BitVec 32)) (x!22115 (_ BitVec 32))) (Undefined!699) (MissingVacant!699 (index!4969 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10085 (_ BitVec 32)) SeekEntryResult!699)

(assert (=> b!211991 (= res!103572 (= (seekEntryOrOpen!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!699 #b00000000000000000000000000000000)))))

(assert (=> b!211991 (=> (not res!103572) (not e!137955))))

(declare-fun d!58169 () Bool)

(declare-fun res!103571 () Bool)

(declare-fun e!137953 () Bool)

(assert (=> d!58169 (=> res!103571 e!137953)))

(assert (=> d!58169 (= res!103571 (bvsge #b00000000000000000000000000000000 (size!5112 _keys!825)))))

(assert (=> d!58169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137953)))

(declare-fun b!211992 () Bool)

(assert (=> b!211992 (= e!137953 e!137954)))

(declare-fun c!35791 () Bool)

(assert (=> b!211992 (= c!35791 (validKeyInArray!0 (select (arr!4787 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211993 () Bool)

(assert (=> b!211993 (= e!137955 call!20072)))

(assert (= (and d!58169 (not res!103571)) b!211992))

(assert (= (and b!211992 c!35791) b!211991))

(assert (= (and b!211992 (not c!35791)) b!211990))

(assert (= (and b!211991 res!103572) b!211993))

(assert (= (or b!211993 b!211990) bm!20069))

(declare-fun m!239899 () Bool)

(assert (=> bm!20069 m!239899))

(assert (=> b!211991 m!239719))

(declare-fun m!239901 () Bool)

(assert (=> b!211991 m!239901))

(declare-fun m!239903 () Bool)

(assert (=> b!211991 m!239903))

(assert (=> b!211991 m!239719))

(declare-fun m!239905 () Bool)

(assert (=> b!211991 m!239905))

(assert (=> b!211992 m!239719))

(assert (=> b!211992 m!239719))

(assert (=> b!211992 m!239725))

(assert (=> b!211732 d!58169))

(declare-fun d!58171 () Bool)

(declare-fun e!137956 () Bool)

(assert (=> d!58171 e!137956))

(declare-fun res!103573 () Bool)

(assert (=> d!58171 (=> (not res!103573) (not e!137956))))

(declare-fun lt!109151 () ListLongMap!3047)

(assert (=> d!58171 (= res!103573 (contains!1391 lt!109151 (_1!2077 lt!108952)))))

(declare-fun lt!109150 () List!3017)

(assert (=> d!58171 (= lt!109151 (ListLongMap!3048 lt!109150))))

(declare-fun lt!109152 () Unit!6420)

(declare-fun lt!109153 () Unit!6420)

(assert (=> d!58171 (= lt!109152 lt!109153)))

(assert (=> d!58171 (= (getValueByKey!254 lt!109150 (_1!2077 lt!108952)) (Some!259 (_2!2077 lt!108952)))))

(assert (=> d!58171 (= lt!109153 (lemmaContainsTupThenGetReturnValue!141 lt!109150 (_1!2077 lt!108952) (_2!2077 lt!108952)))))

(assert (=> d!58171 (= lt!109150 (insertStrictlySorted!144 (toList!1539 lt!108957) (_1!2077 lt!108952) (_2!2077 lt!108952)))))

(assert (=> d!58171 (= (+!568 lt!108957 lt!108952) lt!109151)))

(declare-fun b!211994 () Bool)

(declare-fun res!103574 () Bool)

(assert (=> b!211994 (=> (not res!103574) (not e!137956))))

(assert (=> b!211994 (= res!103574 (= (getValueByKey!254 (toList!1539 lt!109151) (_1!2077 lt!108952)) (Some!259 (_2!2077 lt!108952))))))

(declare-fun b!211995 () Bool)

(assert (=> b!211995 (= e!137956 (contains!1392 (toList!1539 lt!109151) lt!108952))))

(assert (= (and d!58171 res!103573) b!211994))

(assert (= (and b!211994 res!103574) b!211995))

(declare-fun m!239907 () Bool)

(assert (=> d!58171 m!239907))

(declare-fun m!239909 () Bool)

(assert (=> d!58171 m!239909))

(declare-fun m!239911 () Bool)

(assert (=> d!58171 m!239911))

(declare-fun m!239913 () Bool)

(assert (=> d!58171 m!239913))

(declare-fun m!239915 () Bool)

(assert (=> b!211994 m!239915))

(declare-fun m!239917 () Bool)

(assert (=> b!211995 m!239917))

(assert (=> b!211733 d!58171))

(declare-fun d!58173 () Bool)

(declare-fun e!137957 () Bool)

(assert (=> d!58173 e!137957))

(declare-fun res!103575 () Bool)

(assert (=> d!58173 (=> (not res!103575) (not e!137957))))

(declare-fun lt!109155 () ListLongMap!3047)

(assert (=> d!58173 (= res!103575 (contains!1391 lt!109155 (_1!2077 lt!108952)))))

(declare-fun lt!109154 () List!3017)

(assert (=> d!58173 (= lt!109155 (ListLongMap!3048 lt!109154))))

(declare-fun lt!109156 () Unit!6420)

(declare-fun lt!109157 () Unit!6420)

(assert (=> d!58173 (= lt!109156 lt!109157)))

(assert (=> d!58173 (= (getValueByKey!254 lt!109154 (_1!2077 lt!108952)) (Some!259 (_2!2077 lt!108952)))))

(assert (=> d!58173 (= lt!109157 (lemmaContainsTupThenGetReturnValue!141 lt!109154 (_1!2077 lt!108952) (_2!2077 lt!108952)))))

(assert (=> d!58173 (= lt!109154 (insertStrictlySorted!144 (toList!1539 lt!108953) (_1!2077 lt!108952) (_2!2077 lt!108952)))))

(assert (=> d!58173 (= (+!568 lt!108953 lt!108952) lt!109155)))

(declare-fun b!211996 () Bool)

(declare-fun res!103576 () Bool)

(assert (=> b!211996 (=> (not res!103576) (not e!137957))))

(assert (=> b!211996 (= res!103576 (= (getValueByKey!254 (toList!1539 lt!109155) (_1!2077 lt!108952)) (Some!259 (_2!2077 lt!108952))))))

(declare-fun b!211997 () Bool)

(assert (=> b!211997 (= e!137957 (contains!1392 (toList!1539 lt!109155) lt!108952))))

(assert (= (and d!58173 res!103575) b!211996))

(assert (= (and b!211996 res!103576) b!211997))

(declare-fun m!239919 () Bool)

(assert (=> d!58173 m!239919))

(declare-fun m!239921 () Bool)

(assert (=> d!58173 m!239921))

(declare-fun m!239923 () Bool)

(assert (=> d!58173 m!239923))

(declare-fun m!239925 () Bool)

(assert (=> d!58173 m!239925))

(declare-fun m!239927 () Bool)

(assert (=> b!211996 m!239927))

(declare-fun m!239929 () Bool)

(assert (=> b!211997 m!239929))

(assert (=> b!211737 d!58173))

(declare-fun mapIsEmpty!9260 () Bool)

(declare-fun mapRes!9260 () Bool)

(assert (=> mapIsEmpty!9260 mapRes!9260))

(declare-fun condMapEmpty!9260 () Bool)

(declare-fun mapDefault!9260 () ValueCell!2378)

(assert (=> mapNonEmpty!9251 (= condMapEmpty!9260 (= mapRest!9251 ((as const (Array (_ BitVec 32) ValueCell!2378)) mapDefault!9260)))))

(declare-fun e!137963 () Bool)

(assert (=> mapNonEmpty!9251 (= tp!19801 (and e!137963 mapRes!9260))))

(declare-fun b!212005 () Bool)

(assert (=> b!212005 (= e!137963 tp_is_empty!5443)))

(declare-fun mapNonEmpty!9260 () Bool)

(declare-fun tp!19817 () Bool)

(declare-fun e!137962 () Bool)

(assert (=> mapNonEmpty!9260 (= mapRes!9260 (and tp!19817 e!137962))))

(declare-fun mapKey!9260 () (_ BitVec 32))

(declare-fun mapRest!9260 () (Array (_ BitVec 32) ValueCell!2378))

(declare-fun mapValue!9260 () ValueCell!2378)

(assert (=> mapNonEmpty!9260 (= mapRest!9251 (store mapRest!9260 mapKey!9260 mapValue!9260))))

(declare-fun b!212004 () Bool)

(assert (=> b!212004 (= e!137962 tp_is_empty!5443)))

(assert (= (and mapNonEmpty!9251 condMapEmpty!9260) mapIsEmpty!9260))

(assert (= (and mapNonEmpty!9251 (not condMapEmpty!9260)) mapNonEmpty!9260))

(assert (= (and mapNonEmpty!9260 ((_ is ValueCellFull!2378) mapValue!9260)) b!212004))

(assert (= (and mapNonEmpty!9251 ((_ is ValueCellFull!2378) mapDefault!9260)) b!212005))

(declare-fun m!239931 () Bool)

(assert (=> mapNonEmpty!9260 m!239931))

(declare-fun b_lambda!7717 () Bool)

(assert (= b_lambda!7707 (or (and start!21054 b_free!5581) b_lambda!7717)))

(declare-fun b_lambda!7719 () Bool)

(assert (= b_lambda!7711 (or (and start!21054 b_free!5581) b_lambda!7719)))

(declare-fun b_lambda!7721 () Bool)

(assert (= b_lambda!7715 (or (and start!21054 b_free!5581) b_lambda!7721)))

(declare-fun b_lambda!7723 () Bool)

(assert (= b_lambda!7705 (or (and start!21054 b_free!5581) b_lambda!7723)))

(declare-fun b_lambda!7725 () Bool)

(assert (= b_lambda!7713 (or (and start!21054 b_free!5581) b_lambda!7725)))

(declare-fun b_lambda!7727 () Bool)

(assert (= b_lambda!7709 (or (and start!21054 b_free!5581) b_lambda!7727)))

(check-sat (not b_lambda!7725) (not bm!20060) (not b!211991) (not b!211828) (not b!211958) (not b!211980) (not d!58161) (not b_next!5581) (not bm!20065) (not b!211961) (not d!58155) (not bm!20052) (not d!58167) (not b!211960) (not b!211898) (not b!211892) (not b!211937) (not b!211992) (not b!211966) (not b!211957) (not b!211997) (not b_lambda!7719) b_and!12429 (not b!211935) (not b!211955) (not b_lambda!7717) (not b!211933) (not b!211995) (not bm!20056) (not bm!20028) (not b!211896) (not mapNonEmpty!9260) (not b!211954) (not d!58173) (not b!211931) (not d!58157) (not bm!20048) (not b_lambda!7721) (not d!58165) (not bm!20049) (not b_lambda!7727) (not b!211970) (not b!211959) (not bm!20069) (not b!211926) (not b!211948) (not b!211947) (not bm!20047) (not b!211927) (not b!211889) (not b!211936) tp_is_empty!5443 (not b!211968) (not d!58159) (not b!211978) (not bm!20058) (not b!211981) (not b!211928) (not b!211945) (not b!211951) (not bm!20066) (not d!58171) (not b!211996) (not bm!20046) (not bm!20059) (not d!58163) (not b!211826) (not b!211888) (not b!211899) (not b!211994) (not b!211886) (not b!211835) (not b!211895) (not b!211836) (not b!211969) (not b!211827) (not bm!20057) (not b_lambda!7723) (not b!211964))
(check-sat b_and!12429 (not b_next!5581))
