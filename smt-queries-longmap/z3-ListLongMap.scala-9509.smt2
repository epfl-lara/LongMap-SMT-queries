; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112804 () Bool)

(assert start!112804)

(declare-fun b_free!31057 () Bool)

(declare-fun b_next!31057 () Bool)

(assert (=> start!112804 (= b_free!31057 (not b_next!31057))))

(declare-fun tp!108819 () Bool)

(declare-fun b_and!50043 () Bool)

(assert (=> start!112804 (= tp!108819 b_and!50043)))

(declare-fun b!1337827 () Bool)

(declare-fun res!887752 () Bool)

(declare-fun e!761771 () Bool)

(assert (=> b!1337827 (=> (not res!887752) (not e!761771))))

(declare-datatypes ((V!54393 0))(
  ( (V!54394 (val!18558 Int)) )
))
(declare-datatypes ((ValueCell!17585 0))(
  ( (ValueCellFull!17585 (v!21201 V!54393)) (EmptyCell!17585) )
))
(declare-datatypes ((array!90735 0))(
  ( (array!90736 (arr!43831 (Array (_ BitVec 32) ValueCell!17585)) (size!44383 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90735)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90737 0))(
  ( (array!90738 (arr!43832 (Array (_ BitVec 32) (_ BitVec 64))) (size!44384 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90737)

(assert (=> b!1337827 (= res!887752 (and (= (size!44383 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44384 _keys!1590) (size!44383 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57135 () Bool)

(declare-fun mapRes!57135 () Bool)

(declare-fun tp!108820 () Bool)

(declare-fun e!761773 () Bool)

(assert (=> mapNonEmpty!57135 (= mapRes!57135 (and tp!108820 e!761773))))

(declare-fun mapRest!57135 () (Array (_ BitVec 32) ValueCell!17585))

(declare-fun mapKey!57135 () (_ BitVec 32))

(declare-fun mapValue!57135 () ValueCell!17585)

(assert (=> mapNonEmpty!57135 (= (arr!43831 _values!1320) (store mapRest!57135 mapKey!57135 mapValue!57135))))

(declare-fun res!887756 () Bool)

(assert (=> start!112804 (=> (not res!887756) (not e!761771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112804 (= res!887756 (validMask!0 mask!1998))))

(assert (=> start!112804 e!761771))

(declare-fun e!761769 () Bool)

(declare-fun array_inv!33249 (array!90735) Bool)

(assert (=> start!112804 (and (array_inv!33249 _values!1320) e!761769)))

(assert (=> start!112804 true))

(declare-fun array_inv!33250 (array!90737) Bool)

(assert (=> start!112804 (array_inv!33250 _keys!1590)))

(assert (=> start!112804 tp!108819))

(declare-fun tp_is_empty!36967 () Bool)

(assert (=> start!112804 tp_is_empty!36967))

(declare-fun b!1337828 () Bool)

(declare-fun res!887760 () Bool)

(assert (=> b!1337828 (=> (not res!887760) (not e!761771))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337828 (= res!887760 (validKeyInArray!0 (select (arr!43832 _keys!1590) from!1980)))))

(declare-fun b!1337829 () Bool)

(declare-fun res!887762 () Bool)

(assert (=> b!1337829 (=> (not res!887762) (not e!761771))))

(declare-datatypes ((List!31125 0))(
  ( (Nil!31122) (Cons!31121 (h!32330 (_ BitVec 64)) (t!45443 List!31125)) )
))
(declare-fun arrayNoDuplicates!0 (array!90737 (_ BitVec 32) List!31125) Bool)

(assert (=> b!1337829 (= res!887762 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31122))))

(declare-fun b!1337830 () Bool)

(declare-fun res!887758 () Bool)

(assert (=> b!1337830 (=> (not res!887758) (not e!761771))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1337830 (= res!887758 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44384 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57135 () Bool)

(assert (=> mapIsEmpty!57135 mapRes!57135))

(declare-fun b!1337831 () Bool)

(declare-fun res!887754 () Bool)

(assert (=> b!1337831 (=> (not res!887754) (not e!761771))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54393)

(declare-fun zeroValue!1262 () V!54393)

(declare-datatypes ((tuple2!23996 0))(
  ( (tuple2!23997 (_1!12009 (_ BitVec 64)) (_2!12009 V!54393)) )
))
(declare-datatypes ((List!31126 0))(
  ( (Nil!31123) (Cons!31122 (h!32331 tuple2!23996) (t!45444 List!31126)) )
))
(declare-datatypes ((ListLongMap!21653 0))(
  ( (ListLongMap!21654 (toList!10842 List!31126)) )
))
(declare-fun contains!8940 (ListLongMap!21653 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5695 (array!90737 array!90735 (_ BitVec 32) (_ BitVec 32) V!54393 V!54393 (_ BitVec 32) Int) ListLongMap!21653)

(assert (=> b!1337831 (= res!887754 (contains!8940 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1337832 () Bool)

(declare-fun res!887757 () Bool)

(declare-fun e!761774 () Bool)

(assert (=> b!1337832 (=> (not res!887757) (not e!761774))))

(assert (=> b!1337832 (= res!887757 (not (= k0!1153 (select (arr!43832 _keys!1590) from!1980))))))

(declare-fun b!1337833 () Bool)

(declare-fun res!887753 () Bool)

(assert (=> b!1337833 (=> (not res!887753) (not e!761771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90737 (_ BitVec 32)) Bool)

(assert (=> b!1337833 (= res!887753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337834 () Bool)

(declare-fun e!761770 () Bool)

(assert (=> b!1337834 (= e!761769 (and e!761770 mapRes!57135))))

(declare-fun condMapEmpty!57135 () Bool)

(declare-fun mapDefault!57135 () ValueCell!17585)

(assert (=> b!1337834 (= condMapEmpty!57135 (= (arr!43831 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17585)) mapDefault!57135)))))

(declare-fun b!1337835 () Bool)

(declare-fun res!887759 () Bool)

(assert (=> b!1337835 (=> (not res!887759) (not e!761771))))

(assert (=> b!1337835 (= res!887759 (not (= (select (arr!43832 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337836 () Bool)

(assert (=> b!1337836 (= e!761770 tp_is_empty!36967)))

(declare-fun b!1337837 () Bool)

(assert (=> b!1337837 (= e!761771 e!761774)))

(declare-fun res!887755 () Bool)

(assert (=> b!1337837 (=> (not res!887755) (not e!761774))))

(declare-fun lt!593158 () V!54393)

(declare-fun lt!593159 () ListLongMap!21653)

(declare-fun +!4772 (ListLongMap!21653 tuple2!23996) ListLongMap!21653)

(assert (=> b!1337837 (= res!887755 (contains!8940 (+!4772 lt!593159 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6415 (array!90737 array!90735 (_ BitVec 32) (_ BitVec 32) V!54393 V!54393 (_ BitVec 32) Int) ListLongMap!21653)

(assert (=> b!1337837 (= lt!593159 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22129 (ValueCell!17585 V!54393) V!54393)

(declare-fun dynLambda!3702 (Int (_ BitVec 64)) V!54393)

(assert (=> b!1337837 (= lt!593158 (get!22129 (select (arr!43831 _values!1320) from!1980) (dynLambda!3702 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337838 () Bool)

(assert (=> b!1337838 (= e!761774 (not (contains!8940 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153)))))

(assert (=> b!1337838 (contains!8940 lt!593159 k0!1153)))

(declare-datatypes ((Unit!43764 0))(
  ( (Unit!43765) )
))
(declare-fun lt!593157 () Unit!43764)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!314 ((_ BitVec 64) (_ BitVec 64) V!54393 ListLongMap!21653) Unit!43764)

(assert (=> b!1337838 (= lt!593157 (lemmaInListMapAfterAddingDiffThenInBefore!314 k0!1153 (select (arr!43832 _keys!1590) from!1980) lt!593158 lt!593159))))

(declare-fun b!1337839 () Bool)

(assert (=> b!1337839 (= e!761773 tp_is_empty!36967)))

(declare-fun b!1337840 () Bool)

(declare-fun res!887761 () Bool)

(assert (=> b!1337840 (=> (not res!887761) (not e!761771))))

(assert (=> b!1337840 (= res!887761 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(assert (= (and start!112804 res!887756) b!1337827))

(assert (= (and b!1337827 res!887752) b!1337833))

(assert (= (and b!1337833 res!887753) b!1337829))

(assert (= (and b!1337829 res!887762) b!1337830))

(assert (= (and b!1337830 res!887758) b!1337831))

(assert (= (and b!1337831 res!887754) b!1337835))

(assert (= (and b!1337835 res!887759) b!1337828))

(assert (= (and b!1337828 res!887760) b!1337840))

(assert (= (and b!1337840 res!887761) b!1337837))

(assert (= (and b!1337837 res!887755) b!1337832))

(assert (= (and b!1337832 res!887757) b!1337838))

(assert (= (and b!1337834 condMapEmpty!57135) mapIsEmpty!57135))

(assert (= (and b!1337834 (not condMapEmpty!57135)) mapNonEmpty!57135))

(get-info :version)

(assert (= (and mapNonEmpty!57135 ((_ is ValueCellFull!17585) mapValue!57135)) b!1337839))

(assert (= (and b!1337834 ((_ is ValueCellFull!17585) mapDefault!57135)) b!1337836))

(assert (= start!112804 b!1337834))

(declare-fun b_lambda!24241 () Bool)

(assert (=> (not b_lambda!24241) (not b!1337837)))

(declare-fun t!45442 () Bool)

(declare-fun tb!12121 () Bool)

(assert (=> (and start!112804 (= defaultEntry!1323 defaultEntry!1323) t!45442) tb!12121))

(declare-fun result!25327 () Bool)

(assert (=> tb!12121 (= result!25327 tp_is_empty!36967)))

(assert (=> b!1337837 t!45442))

(declare-fun b_and!50045 () Bool)

(assert (= b_and!50043 (and (=> t!45442 result!25327) b_and!50045)))

(declare-fun m!1225521 () Bool)

(assert (=> b!1337835 m!1225521))

(declare-fun m!1225523 () Bool)

(assert (=> b!1337833 m!1225523))

(assert (=> b!1337828 m!1225521))

(assert (=> b!1337828 m!1225521))

(declare-fun m!1225525 () Bool)

(assert (=> b!1337828 m!1225525))

(declare-fun m!1225527 () Bool)

(assert (=> b!1337829 m!1225527))

(declare-fun m!1225529 () Bool)

(assert (=> b!1337831 m!1225529))

(assert (=> b!1337831 m!1225529))

(declare-fun m!1225531 () Bool)

(assert (=> b!1337831 m!1225531))

(declare-fun m!1225533 () Bool)

(assert (=> b!1337837 m!1225533))

(declare-fun m!1225535 () Bool)

(assert (=> b!1337837 m!1225535))

(declare-fun m!1225537 () Bool)

(assert (=> b!1337837 m!1225537))

(declare-fun m!1225539 () Bool)

(assert (=> b!1337837 m!1225539))

(assert (=> b!1337837 m!1225537))

(declare-fun m!1225541 () Bool)

(assert (=> b!1337837 m!1225541))

(declare-fun m!1225543 () Bool)

(assert (=> b!1337837 m!1225543))

(assert (=> b!1337837 m!1225539))

(assert (=> b!1337837 m!1225533))

(assert (=> b!1337837 m!1225521))

(declare-fun m!1225545 () Bool)

(assert (=> mapNonEmpty!57135 m!1225545))

(declare-fun m!1225547 () Bool)

(assert (=> b!1337838 m!1225547))

(assert (=> b!1337838 m!1225521))

(declare-fun m!1225549 () Bool)

(assert (=> b!1337838 m!1225549))

(assert (=> b!1337838 m!1225547))

(declare-fun m!1225551 () Bool)

(assert (=> b!1337838 m!1225551))

(declare-fun m!1225553 () Bool)

(assert (=> b!1337838 m!1225553))

(assert (=> b!1337838 m!1225521))

(declare-fun m!1225555 () Bool)

(assert (=> start!112804 m!1225555))

(declare-fun m!1225557 () Bool)

(assert (=> start!112804 m!1225557))

(declare-fun m!1225559 () Bool)

(assert (=> start!112804 m!1225559))

(assert (=> b!1337832 m!1225521))

(check-sat (not b!1337833) (not b!1337828) (not start!112804) (not b_next!31057) (not b!1337831) tp_is_empty!36967 (not b!1337829) b_and!50045 (not mapNonEmpty!57135) (not b_lambda!24241) (not b!1337837) (not b!1337838))
(check-sat b_and!50045 (not b_next!31057))
(get-model)

(declare-fun b_lambda!24247 () Bool)

(assert (= b_lambda!24241 (or (and start!112804 b_free!31057) b_lambda!24247)))

(check-sat (not b!1337833) (not b!1337828) (not b_lambda!24247) (not start!112804) (not b_next!31057) (not b!1337831) tp_is_empty!36967 (not b!1337829) b_and!50045 (not mapNonEmpty!57135) (not b!1337837) (not b!1337838))
(check-sat b_and!50045 (not b_next!31057))
(get-model)

(declare-fun d!143767 () Bool)

(assert (=> d!143767 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112804 d!143767))

(declare-fun d!143769 () Bool)

(assert (=> d!143769 (= (array_inv!33249 _values!1320) (bvsge (size!44383 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112804 d!143769))

(declare-fun d!143771 () Bool)

(assert (=> d!143771 (= (array_inv!33250 _keys!1590) (bvsge (size!44384 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112804 d!143771))

(declare-fun d!143773 () Bool)

(declare-fun e!761816 () Bool)

(assert (=> d!143773 e!761816))

(declare-fun res!887831 () Bool)

(assert (=> d!143773 (=> res!887831 e!761816)))

(declare-fun lt!593187 () Bool)

(assert (=> d!143773 (= res!887831 (not lt!593187))))

(declare-fun lt!593189 () Bool)

(assert (=> d!143773 (= lt!593187 lt!593189)))

(declare-fun lt!593188 () Unit!43764)

(declare-fun e!761815 () Unit!43764)

(assert (=> d!143773 (= lt!593188 e!761815)))

(declare-fun c!126139 () Bool)

(assert (=> d!143773 (= c!126139 lt!593189)))

(declare-fun containsKey!738 (List!31126 (_ BitVec 64)) Bool)

(assert (=> d!143773 (= lt!593189 (containsKey!738 (toList!10842 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143773 (= (contains!8940 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593187)))

(declare-fun b!1337937 () Bool)

(declare-fun lt!593186 () Unit!43764)

(assert (=> b!1337937 (= e!761815 lt!593186)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!485 (List!31126 (_ BitVec 64)) Unit!43764)

(assert (=> b!1337937 (= lt!593186 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10842 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-datatypes ((Option!772 0))(
  ( (Some!771 (v!21204 V!54393)) (None!770) )
))
(declare-fun isDefined!528 (Option!772) Bool)

(declare-fun getValueByKey!721 (List!31126 (_ BitVec 64)) Option!772)

(assert (=> b!1337937 (isDefined!528 (getValueByKey!721 (toList!10842 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1337938 () Bool)

(declare-fun Unit!43768 () Unit!43764)

(assert (=> b!1337938 (= e!761815 Unit!43768)))

(declare-fun b!1337939 () Bool)

(assert (=> b!1337939 (= e!761816 (isDefined!528 (getValueByKey!721 (toList!10842 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143773 c!126139) b!1337937))

(assert (= (and d!143773 (not c!126139)) b!1337938))

(assert (= (and d!143773 (not res!887831)) b!1337939))

(declare-fun m!1225641 () Bool)

(assert (=> d!143773 m!1225641))

(declare-fun m!1225643 () Bool)

(assert (=> b!1337937 m!1225643))

(declare-fun m!1225645 () Bool)

(assert (=> b!1337937 m!1225645))

(assert (=> b!1337937 m!1225645))

(declare-fun m!1225647 () Bool)

(assert (=> b!1337937 m!1225647))

(assert (=> b!1337939 m!1225645))

(assert (=> b!1337939 m!1225645))

(assert (=> b!1337939 m!1225647))

(assert (=> b!1337831 d!143773))

(declare-fun b!1337982 () Bool)

(declare-fun e!761847 () ListLongMap!21653)

(declare-fun call!64950 () ListLongMap!21653)

(assert (=> b!1337982 (= e!761847 call!64950)))

(declare-fun b!1337983 () Bool)

(declare-fun e!761848 () Bool)

(assert (=> b!1337983 (= e!761848 (validKeyInArray!0 (select (arr!43832 _keys!1590) from!1980)))))

(declare-fun bm!64941 () Bool)

(declare-fun call!64947 () ListLongMap!21653)

(declare-fun call!64945 () ListLongMap!21653)

(assert (=> bm!64941 (= call!64947 call!64945)))

(declare-fun b!1337984 () Bool)

(declare-fun e!761854 () Bool)

(declare-fun call!64944 () Bool)

(assert (=> b!1337984 (= e!761854 (not call!64944))))

(declare-fun d!143775 () Bool)

(declare-fun e!761853 () Bool)

(assert (=> d!143775 e!761853))

(declare-fun res!887854 () Bool)

(assert (=> d!143775 (=> (not res!887854) (not e!761853))))

(assert (=> d!143775 (= res!887854 (or (bvsge from!1980 (size!44384 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44384 _keys!1590)))))))

(declare-fun lt!593247 () ListLongMap!21653)

(declare-fun lt!593248 () ListLongMap!21653)

(assert (=> d!143775 (= lt!593247 lt!593248)))

(declare-fun lt!593249 () Unit!43764)

(declare-fun e!761843 () Unit!43764)

(assert (=> d!143775 (= lt!593249 e!761843)))

(declare-fun c!126155 () Bool)

(declare-fun e!761849 () Bool)

(assert (=> d!143775 (= c!126155 e!761849)))

(declare-fun res!887851 () Bool)

(assert (=> d!143775 (=> (not res!887851) (not e!761849))))

(assert (=> d!143775 (= res!887851 (bvslt from!1980 (size!44384 _keys!1590)))))

(declare-fun e!761844 () ListLongMap!21653)

(assert (=> d!143775 (= lt!593248 e!761844)))

(declare-fun c!126153 () Bool)

(assert (=> d!143775 (= c!126153 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143775 (validMask!0 mask!1998)))

(assert (=> d!143775 (= (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593247)))

(declare-fun e!761855 () Bool)

(declare-fun b!1337985 () Bool)

(declare-fun apply!1028 (ListLongMap!21653 (_ BitVec 64)) V!54393)

(assert (=> b!1337985 (= e!761855 (= (apply!1028 lt!593247 (select (arr!43832 _keys!1590) from!1980)) (get!22129 (select (arr!43831 _values!1320) from!1980) (dynLambda!3702 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337985 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44383 _values!1320)))))

(assert (=> b!1337985 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44384 _keys!1590)))))

(declare-fun b!1337986 () Bool)

(declare-fun e!761850 () Bool)

(assert (=> b!1337986 (= e!761853 e!761850)))

(declare-fun c!126154 () Bool)

(assert (=> b!1337986 (= c!126154 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337987 () Bool)

(declare-fun e!761852 () Bool)

(assert (=> b!1337987 (= e!761854 e!761852)))

(declare-fun res!887850 () Bool)

(assert (=> b!1337987 (= res!887850 call!64944)))

(assert (=> b!1337987 (=> (not res!887850) (not e!761852))))

(declare-fun b!1337988 () Bool)

(declare-fun call!64949 () ListLongMap!21653)

(assert (=> b!1337988 (= e!761844 (+!4772 call!64949 (tuple2!23997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun bm!64942 () Bool)

(assert (=> bm!64942 (= call!64944 (contains!8940 lt!593247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337989 () Bool)

(declare-fun e!761846 () Bool)

(assert (=> b!1337989 (= e!761850 e!761846)))

(declare-fun res!887857 () Bool)

(declare-fun call!64946 () Bool)

(assert (=> b!1337989 (= res!887857 call!64946)))

(assert (=> b!1337989 (=> (not res!887857) (not e!761846))))

(declare-fun bm!64943 () Bool)

(declare-fun call!64948 () ListLongMap!21653)

(assert (=> bm!64943 (= call!64945 call!64948)))

(declare-fun bm!64944 () Bool)

(assert (=> bm!64944 (= call!64950 call!64949)))

(declare-fun b!1337990 () Bool)

(assert (=> b!1337990 (= e!761847 call!64947)))

(declare-fun b!1337991 () Bool)

(assert (=> b!1337991 (= e!761852 (= (apply!1028 lt!593247 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1337992 () Bool)

(declare-fun c!126152 () Bool)

(assert (=> b!1337992 (= c!126152 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!761851 () ListLongMap!21653)

(assert (=> b!1337992 (= e!761851 e!761847)))

(declare-fun b!1337993 () Bool)

(assert (=> b!1337993 (= e!761851 call!64950)))

(declare-fun b!1337994 () Bool)

(assert (=> b!1337994 (= e!761846 (= (apply!1028 lt!593247 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!64945 () Bool)

(assert (=> bm!64945 (= call!64946 (contains!8940 lt!593247 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337995 () Bool)

(declare-fun res!887856 () Bool)

(assert (=> b!1337995 (=> (not res!887856) (not e!761853))))

(assert (=> b!1337995 (= res!887856 e!761854)))

(declare-fun c!126156 () Bool)

(assert (=> b!1337995 (= c!126156 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1337996 () Bool)

(assert (=> b!1337996 (= e!761844 e!761851)))

(declare-fun c!126157 () Bool)

(assert (=> b!1337996 (= c!126157 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337997 () Bool)

(declare-fun Unit!43769 () Unit!43764)

(assert (=> b!1337997 (= e!761843 Unit!43769)))

(declare-fun b!1337998 () Bool)

(assert (=> b!1337998 (= e!761850 (not call!64946))))

(declare-fun b!1337999 () Bool)

(declare-fun lt!593241 () Unit!43764)

(assert (=> b!1337999 (= e!761843 lt!593241)))

(declare-fun lt!593239 () ListLongMap!21653)

(assert (=> b!1337999 (= lt!593239 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593253 () (_ BitVec 64))

(assert (=> b!1337999 (= lt!593253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593254 () (_ BitVec 64))

(assert (=> b!1337999 (= lt!593254 (select (arr!43832 _keys!1590) from!1980))))

(declare-fun lt!593238 () Unit!43764)

(declare-fun addStillContains!1186 (ListLongMap!21653 (_ BitVec 64) V!54393 (_ BitVec 64)) Unit!43764)

(assert (=> b!1337999 (= lt!593238 (addStillContains!1186 lt!593239 lt!593253 zeroValue!1262 lt!593254))))

(assert (=> b!1337999 (contains!8940 (+!4772 lt!593239 (tuple2!23997 lt!593253 zeroValue!1262)) lt!593254)))

(declare-fun lt!593243 () Unit!43764)

(assert (=> b!1337999 (= lt!593243 lt!593238)))

(declare-fun lt!593250 () ListLongMap!21653)

(assert (=> b!1337999 (= lt!593250 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593245 () (_ BitVec 64))

(assert (=> b!1337999 (= lt!593245 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593237 () (_ BitVec 64))

(assert (=> b!1337999 (= lt!593237 (select (arr!43832 _keys!1590) from!1980))))

(declare-fun lt!593246 () Unit!43764)

(declare-fun addApplyDifferent!566 (ListLongMap!21653 (_ BitVec 64) V!54393 (_ BitVec 64)) Unit!43764)

(assert (=> b!1337999 (= lt!593246 (addApplyDifferent!566 lt!593250 lt!593245 minValue!1262 lt!593237))))

(assert (=> b!1337999 (= (apply!1028 (+!4772 lt!593250 (tuple2!23997 lt!593245 minValue!1262)) lt!593237) (apply!1028 lt!593250 lt!593237))))

(declare-fun lt!593235 () Unit!43764)

(assert (=> b!1337999 (= lt!593235 lt!593246)))

(declare-fun lt!593234 () ListLongMap!21653)

(assert (=> b!1337999 (= lt!593234 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593242 () (_ BitVec 64))

(assert (=> b!1337999 (= lt!593242 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593236 () (_ BitVec 64))

(assert (=> b!1337999 (= lt!593236 (select (arr!43832 _keys!1590) from!1980))))

(declare-fun lt!593255 () Unit!43764)

(assert (=> b!1337999 (= lt!593255 (addApplyDifferent!566 lt!593234 lt!593242 zeroValue!1262 lt!593236))))

(assert (=> b!1337999 (= (apply!1028 (+!4772 lt!593234 (tuple2!23997 lt!593242 zeroValue!1262)) lt!593236) (apply!1028 lt!593234 lt!593236))))

(declare-fun lt!593251 () Unit!43764)

(assert (=> b!1337999 (= lt!593251 lt!593255)))

(declare-fun lt!593240 () ListLongMap!21653)

(assert (=> b!1337999 (= lt!593240 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593244 () (_ BitVec 64))

(assert (=> b!1337999 (= lt!593244 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593252 () (_ BitVec 64))

(assert (=> b!1337999 (= lt!593252 (select (arr!43832 _keys!1590) from!1980))))

(assert (=> b!1337999 (= lt!593241 (addApplyDifferent!566 lt!593240 lt!593244 minValue!1262 lt!593252))))

(assert (=> b!1337999 (= (apply!1028 (+!4772 lt!593240 (tuple2!23997 lt!593244 minValue!1262)) lt!593252) (apply!1028 lt!593240 lt!593252))))

(declare-fun b!1338000 () Bool)

(assert (=> b!1338000 (= e!761849 (validKeyInArray!0 (select (arr!43832 _keys!1590) from!1980)))))

(declare-fun bm!64946 () Bool)

(assert (=> bm!64946 (= call!64948 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1338001 () Bool)

(declare-fun e!761845 () Bool)

(assert (=> b!1338001 (= e!761845 e!761855)))

(declare-fun res!887855 () Bool)

(assert (=> b!1338001 (=> (not res!887855) (not e!761855))))

(assert (=> b!1338001 (= res!887855 (contains!8940 lt!593247 (select (arr!43832 _keys!1590) from!1980)))))

(assert (=> b!1338001 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44384 _keys!1590)))))

(declare-fun bm!64947 () Bool)

(assert (=> bm!64947 (= call!64949 (+!4772 (ite c!126153 call!64948 (ite c!126157 call!64945 call!64947)) (ite (or c!126153 c!126157) (tuple2!23997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1338002 () Bool)

(declare-fun res!887853 () Bool)

(assert (=> b!1338002 (=> (not res!887853) (not e!761853))))

(assert (=> b!1338002 (= res!887853 e!761845)))

(declare-fun res!887852 () Bool)

(assert (=> b!1338002 (=> res!887852 e!761845)))

(assert (=> b!1338002 (= res!887852 (not e!761848))))

(declare-fun res!887858 () Bool)

(assert (=> b!1338002 (=> (not res!887858) (not e!761848))))

(assert (=> b!1338002 (= res!887858 (bvslt from!1980 (size!44384 _keys!1590)))))

(assert (= (and d!143775 c!126153) b!1337988))

(assert (= (and d!143775 (not c!126153)) b!1337996))

(assert (= (and b!1337996 c!126157) b!1337993))

(assert (= (and b!1337996 (not c!126157)) b!1337992))

(assert (= (and b!1337992 c!126152) b!1337982))

(assert (= (and b!1337992 (not c!126152)) b!1337990))

(assert (= (or b!1337982 b!1337990) bm!64941))

(assert (= (or b!1337993 bm!64941) bm!64943))

(assert (= (or b!1337993 b!1337982) bm!64944))

(assert (= (or b!1337988 bm!64943) bm!64946))

(assert (= (or b!1337988 bm!64944) bm!64947))

(assert (= (and d!143775 res!887851) b!1338000))

(assert (= (and d!143775 c!126155) b!1337999))

(assert (= (and d!143775 (not c!126155)) b!1337997))

(assert (= (and d!143775 res!887854) b!1338002))

(assert (= (and b!1338002 res!887858) b!1337983))

(assert (= (and b!1338002 (not res!887852)) b!1338001))

(assert (= (and b!1338001 res!887855) b!1337985))

(assert (= (and b!1338002 res!887853) b!1337995))

(assert (= (and b!1337995 c!126156) b!1337987))

(assert (= (and b!1337995 (not c!126156)) b!1337984))

(assert (= (and b!1337987 res!887850) b!1337991))

(assert (= (or b!1337987 b!1337984) bm!64942))

(assert (= (and b!1337995 res!887856) b!1337986))

(assert (= (and b!1337986 c!126154) b!1337989))

(assert (= (and b!1337986 (not c!126154)) b!1337998))

(assert (= (and b!1337989 res!887857) b!1337994))

(assert (= (or b!1337989 b!1337998) bm!64945))

(declare-fun b_lambda!24249 () Bool)

(assert (=> (not b_lambda!24249) (not b!1337985)))

(assert (=> b!1337985 t!45442))

(declare-fun b_and!50055 () Bool)

(assert (= b_and!50045 (and (=> t!45442 result!25327) b_and!50055)))

(assert (=> b!1338001 m!1225521))

(assert (=> b!1338001 m!1225521))

(declare-fun m!1225649 () Bool)

(assert (=> b!1338001 m!1225649))

(declare-fun m!1225651 () Bool)

(assert (=> b!1337999 m!1225651))

(declare-fun m!1225653 () Bool)

(assert (=> b!1337999 m!1225653))

(declare-fun m!1225655 () Bool)

(assert (=> b!1337999 m!1225655))

(declare-fun m!1225657 () Bool)

(assert (=> b!1337999 m!1225657))

(declare-fun m!1225659 () Bool)

(assert (=> b!1337999 m!1225659))

(declare-fun m!1225661 () Bool)

(assert (=> b!1337999 m!1225661))

(declare-fun m!1225663 () Bool)

(assert (=> b!1337999 m!1225663))

(declare-fun m!1225665 () Bool)

(assert (=> b!1337999 m!1225665))

(declare-fun m!1225667 () Bool)

(assert (=> b!1337999 m!1225667))

(declare-fun m!1225669 () Bool)

(assert (=> b!1337999 m!1225669))

(assert (=> b!1337999 m!1225667))

(declare-fun m!1225671 () Bool)

(assert (=> b!1337999 m!1225671))

(declare-fun m!1225673 () Bool)

(assert (=> b!1337999 m!1225673))

(assert (=> b!1337999 m!1225655))

(assert (=> b!1337999 m!1225651))

(declare-fun m!1225675 () Bool)

(assert (=> b!1337999 m!1225675))

(declare-fun m!1225677 () Bool)

(assert (=> b!1337999 m!1225677))

(declare-fun m!1225679 () Bool)

(assert (=> b!1337999 m!1225679))

(assert (=> b!1337999 m!1225521))

(assert (=> b!1337999 m!1225671))

(declare-fun m!1225681 () Bool)

(assert (=> b!1337999 m!1225681))

(declare-fun m!1225683 () Bool)

(assert (=> b!1337991 m!1225683))

(assert (=> b!1338000 m!1225521))

(assert (=> b!1338000 m!1225521))

(assert (=> b!1338000 m!1225525))

(declare-fun m!1225685 () Bool)

(assert (=> bm!64945 m!1225685))

(declare-fun m!1225687 () Bool)

(assert (=> b!1337994 m!1225687))

(declare-fun m!1225689 () Bool)

(assert (=> b!1337988 m!1225689))

(assert (=> b!1337985 m!1225539))

(assert (=> b!1337985 m!1225537))

(assert (=> b!1337985 m!1225541))

(assert (=> b!1337985 m!1225539))

(assert (=> b!1337985 m!1225537))

(assert (=> b!1337985 m!1225521))

(declare-fun m!1225691 () Bool)

(assert (=> b!1337985 m!1225691))

(assert (=> b!1337985 m!1225521))

(assert (=> b!1337983 m!1225521))

(assert (=> b!1337983 m!1225521))

(assert (=> b!1337983 m!1225525))

(declare-fun m!1225693 () Bool)

(assert (=> bm!64947 m!1225693))

(assert (=> bm!64946 m!1225677))

(declare-fun m!1225695 () Bool)

(assert (=> bm!64942 m!1225695))

(assert (=> d!143775 m!1225555))

(assert (=> b!1337831 d!143775))

(declare-fun d!143777 () Bool)

(declare-fun e!761857 () Bool)

(assert (=> d!143777 e!761857))

(declare-fun res!887859 () Bool)

(assert (=> d!143777 (=> res!887859 e!761857)))

(declare-fun lt!593257 () Bool)

(assert (=> d!143777 (= res!887859 (not lt!593257))))

(declare-fun lt!593259 () Bool)

(assert (=> d!143777 (= lt!593257 lt!593259)))

(declare-fun lt!593258 () Unit!43764)

(declare-fun e!761856 () Unit!43764)

(assert (=> d!143777 (= lt!593258 e!761856)))

(declare-fun c!126158 () Bool)

(assert (=> d!143777 (= c!126158 lt!593259)))

(assert (=> d!143777 (= lt!593259 (containsKey!738 (toList!10842 (+!4772 lt!593159 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))) k0!1153))))

(assert (=> d!143777 (= (contains!8940 (+!4772 lt!593159 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158)) k0!1153) lt!593257)))

(declare-fun b!1338003 () Bool)

(declare-fun lt!593256 () Unit!43764)

(assert (=> b!1338003 (= e!761856 lt!593256)))

(assert (=> b!1338003 (= lt!593256 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10842 (+!4772 lt!593159 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))) k0!1153))))

(assert (=> b!1338003 (isDefined!528 (getValueByKey!721 (toList!10842 (+!4772 lt!593159 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))) k0!1153))))

(declare-fun b!1338004 () Bool)

(declare-fun Unit!43770 () Unit!43764)

(assert (=> b!1338004 (= e!761856 Unit!43770)))

(declare-fun b!1338005 () Bool)

(assert (=> b!1338005 (= e!761857 (isDefined!528 (getValueByKey!721 (toList!10842 (+!4772 lt!593159 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))) k0!1153)))))

(assert (= (and d!143777 c!126158) b!1338003))

(assert (= (and d!143777 (not c!126158)) b!1338004))

(assert (= (and d!143777 (not res!887859)) b!1338005))

(declare-fun m!1225697 () Bool)

(assert (=> d!143777 m!1225697))

(declare-fun m!1225699 () Bool)

(assert (=> b!1338003 m!1225699))

(declare-fun m!1225701 () Bool)

(assert (=> b!1338003 m!1225701))

(assert (=> b!1338003 m!1225701))

(declare-fun m!1225703 () Bool)

(assert (=> b!1338003 m!1225703))

(assert (=> b!1338005 m!1225701))

(assert (=> b!1338005 m!1225701))

(assert (=> b!1338005 m!1225703))

(assert (=> b!1337837 d!143777))

(declare-fun d!143779 () Bool)

(declare-fun e!761860 () Bool)

(assert (=> d!143779 e!761860))

(declare-fun res!887865 () Bool)

(assert (=> d!143779 (=> (not res!887865) (not e!761860))))

(declare-fun lt!593271 () ListLongMap!21653)

(assert (=> d!143779 (= res!887865 (contains!8940 lt!593271 (_1!12009 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))))))

(declare-fun lt!593269 () List!31126)

(assert (=> d!143779 (= lt!593271 (ListLongMap!21654 lt!593269))))

(declare-fun lt!593268 () Unit!43764)

(declare-fun lt!593270 () Unit!43764)

(assert (=> d!143779 (= lt!593268 lt!593270)))

(assert (=> d!143779 (= (getValueByKey!721 lt!593269 (_1!12009 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))) (Some!771 (_2!12009 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))))))

(declare-fun lemmaContainsTupThenGetReturnValue!364 (List!31126 (_ BitVec 64) V!54393) Unit!43764)

(assert (=> d!143779 (= lt!593270 (lemmaContainsTupThenGetReturnValue!364 lt!593269 (_1!12009 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158)) (_2!12009 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))))))

(declare-fun insertStrictlySorted!493 (List!31126 (_ BitVec 64) V!54393) List!31126)

(assert (=> d!143779 (= lt!593269 (insertStrictlySorted!493 (toList!10842 lt!593159) (_1!12009 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158)) (_2!12009 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))))))

(assert (=> d!143779 (= (+!4772 lt!593159 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158)) lt!593271)))

(declare-fun b!1338010 () Bool)

(declare-fun res!887864 () Bool)

(assert (=> b!1338010 (=> (not res!887864) (not e!761860))))

(assert (=> b!1338010 (= res!887864 (= (getValueByKey!721 (toList!10842 lt!593271) (_1!12009 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158))) (Some!771 (_2!12009 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158)))))))

(declare-fun b!1338011 () Bool)

(declare-fun contains!8943 (List!31126 tuple2!23996) Bool)

(assert (=> b!1338011 (= e!761860 (contains!8943 (toList!10842 lt!593271) (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158)))))

(assert (= (and d!143779 res!887865) b!1338010))

(assert (= (and b!1338010 res!887864) b!1338011))

(declare-fun m!1225705 () Bool)

(assert (=> d!143779 m!1225705))

(declare-fun m!1225707 () Bool)

(assert (=> d!143779 m!1225707))

(declare-fun m!1225709 () Bool)

(assert (=> d!143779 m!1225709))

(declare-fun m!1225711 () Bool)

(assert (=> d!143779 m!1225711))

(declare-fun m!1225713 () Bool)

(assert (=> b!1338010 m!1225713))

(declare-fun m!1225715 () Bool)

(assert (=> b!1338011 m!1225715))

(assert (=> b!1337837 d!143779))

(declare-fun b!1338037 () Bool)

(declare-fun e!761878 () Bool)

(declare-fun e!761881 () Bool)

(assert (=> b!1338037 (= e!761878 e!761881)))

(declare-fun c!126167 () Bool)

(declare-fun e!761880 () Bool)

(assert (=> b!1338037 (= c!126167 e!761880)))

(declare-fun res!887875 () Bool)

(assert (=> b!1338037 (=> (not res!887875) (not e!761880))))

(assert (=> b!1338037 (= res!887875 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))

(declare-fun bm!64950 () Bool)

(declare-fun call!64953 () ListLongMap!21653)

(assert (=> bm!64950 (= call!64953 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338038 () Bool)

(declare-fun e!761875 () ListLongMap!21653)

(assert (=> b!1338038 (= e!761875 call!64953)))

(declare-fun b!1338039 () Bool)

(declare-fun e!761879 () Bool)

(declare-fun lt!593290 () ListLongMap!21653)

(declare-fun isEmpty!1094 (ListLongMap!21653) Bool)

(assert (=> b!1338039 (= e!761879 (isEmpty!1094 lt!593290))))

(declare-fun b!1338040 () Bool)

(declare-fun res!887874 () Bool)

(assert (=> b!1338040 (=> (not res!887874) (not e!761878))))

(assert (=> b!1338040 (= res!887874 (not (contains!8940 lt!593290 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338041 () Bool)

(assert (=> b!1338041 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))

(assert (=> b!1338041 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _values!1320)))))

(declare-fun e!761877 () Bool)

(assert (=> b!1338041 (= e!761877 (= (apply!1028 lt!593290 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22129 (select (arr!43831 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3702 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1338042 () Bool)

(assert (=> b!1338042 (= e!761880 (validKeyInArray!0 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338042 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1338043 () Bool)

(assert (=> b!1338043 (= e!761881 e!761877)))

(assert (=> b!1338043 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))

(declare-fun res!887877 () Bool)

(assert (=> b!1338043 (= res!887877 (contains!8940 lt!593290 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338043 (=> (not res!887877) (not e!761877))))

(declare-fun b!1338036 () Bool)

(declare-fun lt!593289 () Unit!43764)

(declare-fun lt!593288 () Unit!43764)

(assert (=> b!1338036 (= lt!593289 lt!593288)))

(declare-fun lt!593286 () (_ BitVec 64))

(declare-fun lt!593292 () (_ BitVec 64))

(declare-fun lt!593287 () ListLongMap!21653)

(declare-fun lt!593291 () V!54393)

(assert (=> b!1338036 (not (contains!8940 (+!4772 lt!593287 (tuple2!23997 lt!593286 lt!593291)) lt!593292))))

(declare-fun addStillNotContains!487 (ListLongMap!21653 (_ BitVec 64) V!54393 (_ BitVec 64)) Unit!43764)

(assert (=> b!1338036 (= lt!593288 (addStillNotContains!487 lt!593287 lt!593286 lt!593291 lt!593292))))

(assert (=> b!1338036 (= lt!593292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338036 (= lt!593291 (get!22129 (select (arr!43831 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3702 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338036 (= lt!593286 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338036 (= lt!593287 call!64953)))

(assert (=> b!1338036 (= e!761875 (+!4772 call!64953 (tuple2!23997 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22129 (select (arr!43831 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3702 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!143781 () Bool)

(assert (=> d!143781 e!761878))

(declare-fun res!887876 () Bool)

(assert (=> d!143781 (=> (not res!887876) (not e!761878))))

(assert (=> d!143781 (= res!887876 (not (contains!8940 lt!593290 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!761876 () ListLongMap!21653)

(assert (=> d!143781 (= lt!593290 e!761876)))

(declare-fun c!126170 () Bool)

(assert (=> d!143781 (= c!126170 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))

(assert (=> d!143781 (validMask!0 mask!1998)))

(assert (=> d!143781 (= (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593290)))

(declare-fun b!1338044 () Bool)

(assert (=> b!1338044 (= e!761879 (= lt!593290 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1338045 () Bool)

(assert (=> b!1338045 (= e!761881 e!761879)))

(declare-fun c!126169 () Bool)

(assert (=> b!1338045 (= c!126169 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))

(declare-fun b!1338046 () Bool)

(assert (=> b!1338046 (= e!761876 (ListLongMap!21654 Nil!31123))))

(declare-fun b!1338047 () Bool)

(assert (=> b!1338047 (= e!761876 e!761875)))

(declare-fun c!126168 () Bool)

(assert (=> b!1338047 (= c!126168 (validKeyInArray!0 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (= (and d!143781 c!126170) b!1338046))

(assert (= (and d!143781 (not c!126170)) b!1338047))

(assert (= (and b!1338047 c!126168) b!1338036))

(assert (= (and b!1338047 (not c!126168)) b!1338038))

(assert (= (or b!1338036 b!1338038) bm!64950))

(assert (= (and d!143781 res!887876) b!1338040))

(assert (= (and b!1338040 res!887874) b!1338037))

(assert (= (and b!1338037 res!887875) b!1338042))

(assert (= (and b!1338037 c!126167) b!1338043))

(assert (= (and b!1338037 (not c!126167)) b!1338045))

(assert (= (and b!1338043 res!887877) b!1338041))

(assert (= (and b!1338045 c!126169) b!1338044))

(assert (= (and b!1338045 (not c!126169)) b!1338039))

(declare-fun b_lambda!24251 () Bool)

(assert (=> (not b_lambda!24251) (not b!1338041)))

(assert (=> b!1338041 t!45442))

(declare-fun b_and!50057 () Bool)

(assert (= b_and!50055 (and (=> t!45442 result!25327) b_and!50057)))

(declare-fun b_lambda!24253 () Bool)

(assert (=> (not b_lambda!24253) (not b!1338036)))

(assert (=> b!1338036 t!45442))

(declare-fun b_and!50059 () Bool)

(assert (= b_and!50057 (and (=> t!45442 result!25327) b_and!50059)))

(declare-fun m!1225717 () Bool)

(assert (=> b!1338042 m!1225717))

(assert (=> b!1338042 m!1225717))

(declare-fun m!1225719 () Bool)

(assert (=> b!1338042 m!1225719))

(declare-fun m!1225721 () Bool)

(assert (=> b!1338036 m!1225721))

(declare-fun m!1225723 () Bool)

(assert (=> b!1338036 m!1225723))

(declare-fun m!1225725 () Bool)

(assert (=> b!1338036 m!1225725))

(assert (=> b!1338036 m!1225721))

(declare-fun m!1225727 () Bool)

(assert (=> b!1338036 m!1225727))

(assert (=> b!1338036 m!1225537))

(declare-fun m!1225729 () Bool)

(assert (=> b!1338036 m!1225729))

(assert (=> b!1338036 m!1225717))

(assert (=> b!1338036 m!1225725))

(assert (=> b!1338036 m!1225537))

(declare-fun m!1225731 () Bool)

(assert (=> b!1338036 m!1225731))

(assert (=> b!1338047 m!1225717))

(assert (=> b!1338047 m!1225717))

(assert (=> b!1338047 m!1225719))

(declare-fun m!1225733 () Bool)

(assert (=> d!143781 m!1225733))

(assert (=> d!143781 m!1225555))

(declare-fun m!1225735 () Bool)

(assert (=> b!1338044 m!1225735))

(assert (=> bm!64950 m!1225735))

(assert (=> b!1338043 m!1225717))

(assert (=> b!1338043 m!1225717))

(declare-fun m!1225737 () Bool)

(assert (=> b!1338043 m!1225737))

(assert (=> b!1338041 m!1225725))

(assert (=> b!1338041 m!1225537))

(assert (=> b!1338041 m!1225717))

(declare-fun m!1225739 () Bool)

(assert (=> b!1338041 m!1225739))

(assert (=> b!1338041 m!1225717))

(assert (=> b!1338041 m!1225725))

(assert (=> b!1338041 m!1225537))

(assert (=> b!1338041 m!1225731))

(declare-fun m!1225741 () Bool)

(assert (=> b!1338040 m!1225741))

(declare-fun m!1225743 () Bool)

(assert (=> b!1338039 m!1225743))

(assert (=> b!1337837 d!143781))

(declare-fun d!143783 () Bool)

(declare-fun c!126173 () Bool)

(assert (=> d!143783 (= c!126173 ((_ is ValueCellFull!17585) (select (arr!43831 _values!1320) from!1980)))))

(declare-fun e!761884 () V!54393)

(assert (=> d!143783 (= (get!22129 (select (arr!43831 _values!1320) from!1980) (dynLambda!3702 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761884)))

(declare-fun b!1338052 () Bool)

(declare-fun get!22131 (ValueCell!17585 V!54393) V!54393)

(assert (=> b!1338052 (= e!761884 (get!22131 (select (arr!43831 _values!1320) from!1980) (dynLambda!3702 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338053 () Bool)

(declare-fun get!22132 (ValueCell!17585 V!54393) V!54393)

(assert (=> b!1338053 (= e!761884 (get!22132 (select (arr!43831 _values!1320) from!1980) (dynLambda!3702 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143783 c!126173) b!1338052))

(assert (= (and d!143783 (not c!126173)) b!1338053))

(assert (=> b!1338052 m!1225539))

(assert (=> b!1338052 m!1225537))

(declare-fun m!1225745 () Bool)

(assert (=> b!1338052 m!1225745))

(assert (=> b!1338053 m!1225539))

(assert (=> b!1338053 m!1225537))

(declare-fun m!1225747 () Bool)

(assert (=> b!1338053 m!1225747))

(assert (=> b!1337837 d!143783))

(declare-fun d!143785 () Bool)

(assert (=> d!143785 (= (validKeyInArray!0 (select (arr!43832 _keys!1590) from!1980)) (and (not (= (select (arr!43832 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43832 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337828 d!143785))

(declare-fun b!1338062 () Bool)

(declare-fun e!761893 () Bool)

(declare-fun call!64956 () Bool)

(assert (=> b!1338062 (= e!761893 call!64956)))

(declare-fun b!1338063 () Bool)

(declare-fun e!761891 () Bool)

(assert (=> b!1338063 (= e!761891 call!64956)))

(declare-fun b!1338064 () Bool)

(declare-fun e!761892 () Bool)

(assert (=> b!1338064 (= e!761892 e!761893)))

(declare-fun c!126176 () Bool)

(assert (=> b!1338064 (= c!126176 (validKeyInArray!0 (select (arr!43832 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143787 () Bool)

(declare-fun res!887883 () Bool)

(assert (=> d!143787 (=> res!887883 e!761892)))

(assert (=> d!143787 (= res!887883 (bvsge #b00000000000000000000000000000000 (size!44384 _keys!1590)))))

(assert (=> d!143787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!761892)))

(declare-fun b!1338065 () Bool)

(assert (=> b!1338065 (= e!761893 e!761891)))

(declare-fun lt!593300 () (_ BitVec 64))

(assert (=> b!1338065 (= lt!593300 (select (arr!43832 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!593299 () Unit!43764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90737 (_ BitVec 64) (_ BitVec 32)) Unit!43764)

(assert (=> b!1338065 (= lt!593299 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593300 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338065 (arrayContainsKey!0 _keys!1590 lt!593300 #b00000000000000000000000000000000)))

(declare-fun lt!593301 () Unit!43764)

(assert (=> b!1338065 (= lt!593301 lt!593299)))

(declare-fun res!887882 () Bool)

(declare-datatypes ((SeekEntryResult!10049 0))(
  ( (MissingZero!10049 (index!42567 (_ BitVec 32))) (Found!10049 (index!42568 (_ BitVec 32))) (Intermediate!10049 (undefined!10861 Bool) (index!42569 (_ BitVec 32)) (x!119522 (_ BitVec 32))) (Undefined!10049) (MissingVacant!10049 (index!42570 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90737 (_ BitVec 32)) SeekEntryResult!10049)

(assert (=> b!1338065 (= res!887882 (= (seekEntryOrOpen!0 (select (arr!43832 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10049 #b00000000000000000000000000000000)))))

(assert (=> b!1338065 (=> (not res!887882) (not e!761891))))

(declare-fun bm!64953 () Bool)

(assert (=> bm!64953 (= call!64956 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(assert (= (and d!143787 (not res!887883)) b!1338064))

(assert (= (and b!1338064 c!126176) b!1338065))

(assert (= (and b!1338064 (not c!126176)) b!1338062))

(assert (= (and b!1338065 res!887882) b!1338063))

(assert (= (or b!1338063 b!1338062) bm!64953))

(declare-fun m!1225749 () Bool)

(assert (=> b!1338064 m!1225749))

(assert (=> b!1338064 m!1225749))

(declare-fun m!1225751 () Bool)

(assert (=> b!1338064 m!1225751))

(assert (=> b!1338065 m!1225749))

(declare-fun m!1225753 () Bool)

(assert (=> b!1338065 m!1225753))

(declare-fun m!1225755 () Bool)

(assert (=> b!1338065 m!1225755))

(assert (=> b!1338065 m!1225749))

(declare-fun m!1225757 () Bool)

(assert (=> b!1338065 m!1225757))

(declare-fun m!1225759 () Bool)

(assert (=> bm!64953 m!1225759))

(assert (=> b!1337833 d!143787))

(declare-fun d!143789 () Bool)

(declare-fun e!761895 () Bool)

(assert (=> d!143789 e!761895))

(declare-fun res!887884 () Bool)

(assert (=> d!143789 (=> res!887884 e!761895)))

(declare-fun lt!593303 () Bool)

(assert (=> d!143789 (= res!887884 (not lt!593303))))

(declare-fun lt!593305 () Bool)

(assert (=> d!143789 (= lt!593303 lt!593305)))

(declare-fun lt!593304 () Unit!43764)

(declare-fun e!761894 () Unit!43764)

(assert (=> d!143789 (= lt!593304 e!761894)))

(declare-fun c!126177 () Bool)

(assert (=> d!143789 (= c!126177 lt!593305)))

(assert (=> d!143789 (= lt!593305 (containsKey!738 (toList!10842 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> d!143789 (= (contains!8940 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153) lt!593303)))

(declare-fun b!1338066 () Bool)

(declare-fun lt!593302 () Unit!43764)

(assert (=> b!1338066 (= e!761894 lt!593302)))

(assert (=> b!1338066 (= lt!593302 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10842 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> b!1338066 (isDefined!528 (getValueByKey!721 (toList!10842 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun b!1338067 () Bool)

(declare-fun Unit!43771 () Unit!43764)

(assert (=> b!1338067 (= e!761894 Unit!43771)))

(declare-fun b!1338068 () Bool)

(assert (=> b!1338068 (= e!761895 (isDefined!528 (getValueByKey!721 (toList!10842 (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143789 c!126177) b!1338066))

(assert (= (and d!143789 (not c!126177)) b!1338067))

(assert (= (and d!143789 (not res!887884)) b!1338068))

(declare-fun m!1225761 () Bool)

(assert (=> d!143789 m!1225761))

(declare-fun m!1225763 () Bool)

(assert (=> b!1338066 m!1225763))

(declare-fun m!1225765 () Bool)

(assert (=> b!1338066 m!1225765))

(assert (=> b!1338066 m!1225765))

(declare-fun m!1225767 () Bool)

(assert (=> b!1338066 m!1225767))

(assert (=> b!1338068 m!1225765))

(assert (=> b!1338068 m!1225765))

(assert (=> b!1338068 m!1225767))

(assert (=> b!1337838 d!143789))

(declare-fun b!1338069 () Bool)

(declare-fun e!761900 () ListLongMap!21653)

(declare-fun call!64963 () ListLongMap!21653)

(assert (=> b!1338069 (= e!761900 call!64963)))

(declare-fun b!1338070 () Bool)

(declare-fun e!761901 () Bool)

(assert (=> b!1338070 (= e!761901 (validKeyInArray!0 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun bm!64954 () Bool)

(declare-fun call!64960 () ListLongMap!21653)

(declare-fun call!64958 () ListLongMap!21653)

(assert (=> bm!64954 (= call!64960 call!64958)))

(declare-fun b!1338071 () Bool)

(declare-fun e!761907 () Bool)

(declare-fun call!64957 () Bool)

(assert (=> b!1338071 (= e!761907 (not call!64957))))

(declare-fun d!143791 () Bool)

(declare-fun e!761906 () Bool)

(assert (=> d!143791 e!761906))

(declare-fun res!887889 () Bool)

(assert (=> d!143791 (=> (not res!887889) (not e!761906))))

(assert (=> d!143791 (= res!887889 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))))

(declare-fun lt!593319 () ListLongMap!21653)

(declare-fun lt!593320 () ListLongMap!21653)

(assert (=> d!143791 (= lt!593319 lt!593320)))

(declare-fun lt!593321 () Unit!43764)

(declare-fun e!761896 () Unit!43764)

(assert (=> d!143791 (= lt!593321 e!761896)))

(declare-fun c!126181 () Bool)

(declare-fun e!761902 () Bool)

(assert (=> d!143791 (= c!126181 e!761902)))

(declare-fun res!887886 () Bool)

(assert (=> d!143791 (=> (not res!887886) (not e!761902))))

(assert (=> d!143791 (= res!887886 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))

(declare-fun e!761897 () ListLongMap!21653)

(assert (=> d!143791 (= lt!593320 e!761897)))

(declare-fun c!126179 () Bool)

(assert (=> d!143791 (= c!126179 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143791 (validMask!0 mask!1998)))

(assert (=> d!143791 (= (getCurrentListMap!5695 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593319)))

(declare-fun e!761908 () Bool)

(declare-fun b!1338072 () Bool)

(assert (=> b!1338072 (= e!761908 (= (apply!1028 lt!593319 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22129 (select (arr!43831 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3702 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338072 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _values!1320)))))

(assert (=> b!1338072 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))

(declare-fun b!1338073 () Bool)

(declare-fun e!761903 () Bool)

(assert (=> b!1338073 (= e!761906 e!761903)))

(declare-fun c!126180 () Bool)

(assert (=> b!1338073 (= c!126180 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338074 () Bool)

(declare-fun e!761905 () Bool)

(assert (=> b!1338074 (= e!761907 e!761905)))

(declare-fun res!887885 () Bool)

(assert (=> b!1338074 (= res!887885 call!64957)))

(assert (=> b!1338074 (=> (not res!887885) (not e!761905))))

(declare-fun b!1338075 () Bool)

(declare-fun call!64962 () ListLongMap!21653)

(assert (=> b!1338075 (= e!761897 (+!4772 call!64962 (tuple2!23997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun bm!64955 () Bool)

(assert (=> bm!64955 (= call!64957 (contains!8940 lt!593319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338076 () Bool)

(declare-fun e!761899 () Bool)

(assert (=> b!1338076 (= e!761903 e!761899)))

(declare-fun res!887892 () Bool)

(declare-fun call!64959 () Bool)

(assert (=> b!1338076 (= res!887892 call!64959)))

(assert (=> b!1338076 (=> (not res!887892) (not e!761899))))

(declare-fun bm!64956 () Bool)

(declare-fun call!64961 () ListLongMap!21653)

(assert (=> bm!64956 (= call!64958 call!64961)))

(declare-fun bm!64957 () Bool)

(assert (=> bm!64957 (= call!64963 call!64962)))

(declare-fun b!1338077 () Bool)

(assert (=> b!1338077 (= e!761900 call!64960)))

(declare-fun b!1338078 () Bool)

(assert (=> b!1338078 (= e!761905 (= (apply!1028 lt!593319 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1338079 () Bool)

(declare-fun c!126178 () Bool)

(assert (=> b!1338079 (= c!126178 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!761904 () ListLongMap!21653)

(assert (=> b!1338079 (= e!761904 e!761900)))

(declare-fun b!1338080 () Bool)

(assert (=> b!1338080 (= e!761904 call!64963)))

(declare-fun b!1338081 () Bool)

(assert (=> b!1338081 (= e!761899 (= (apply!1028 lt!593319 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!64958 () Bool)

(assert (=> bm!64958 (= call!64959 (contains!8940 lt!593319 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338082 () Bool)

(declare-fun res!887891 () Bool)

(assert (=> b!1338082 (=> (not res!887891) (not e!761906))))

(assert (=> b!1338082 (= res!887891 e!761907)))

(declare-fun c!126182 () Bool)

(assert (=> b!1338082 (= c!126182 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1338083 () Bool)

(assert (=> b!1338083 (= e!761897 e!761904)))

(declare-fun c!126183 () Bool)

(assert (=> b!1338083 (= c!126183 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338084 () Bool)

(declare-fun Unit!43772 () Unit!43764)

(assert (=> b!1338084 (= e!761896 Unit!43772)))

(declare-fun b!1338085 () Bool)

(assert (=> b!1338085 (= e!761903 (not call!64959))))

(declare-fun b!1338086 () Bool)

(declare-fun lt!593313 () Unit!43764)

(assert (=> b!1338086 (= e!761896 lt!593313)))

(declare-fun lt!593311 () ListLongMap!21653)

(assert (=> b!1338086 (= lt!593311 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593325 () (_ BitVec 64))

(assert (=> b!1338086 (= lt!593325 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593326 () (_ BitVec 64))

(assert (=> b!1338086 (= lt!593326 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593310 () Unit!43764)

(assert (=> b!1338086 (= lt!593310 (addStillContains!1186 lt!593311 lt!593325 zeroValue!1262 lt!593326))))

(assert (=> b!1338086 (contains!8940 (+!4772 lt!593311 (tuple2!23997 lt!593325 zeroValue!1262)) lt!593326)))

(declare-fun lt!593315 () Unit!43764)

(assert (=> b!1338086 (= lt!593315 lt!593310)))

(declare-fun lt!593322 () ListLongMap!21653)

(assert (=> b!1338086 (= lt!593322 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593317 () (_ BitVec 64))

(assert (=> b!1338086 (= lt!593317 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593309 () (_ BitVec 64))

(assert (=> b!1338086 (= lt!593309 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593318 () Unit!43764)

(assert (=> b!1338086 (= lt!593318 (addApplyDifferent!566 lt!593322 lt!593317 minValue!1262 lt!593309))))

(assert (=> b!1338086 (= (apply!1028 (+!4772 lt!593322 (tuple2!23997 lt!593317 minValue!1262)) lt!593309) (apply!1028 lt!593322 lt!593309))))

(declare-fun lt!593307 () Unit!43764)

(assert (=> b!1338086 (= lt!593307 lt!593318)))

(declare-fun lt!593306 () ListLongMap!21653)

(assert (=> b!1338086 (= lt!593306 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593314 () (_ BitVec 64))

(assert (=> b!1338086 (= lt!593314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593308 () (_ BitVec 64))

(assert (=> b!1338086 (= lt!593308 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593327 () Unit!43764)

(assert (=> b!1338086 (= lt!593327 (addApplyDifferent!566 lt!593306 lt!593314 zeroValue!1262 lt!593308))))

(assert (=> b!1338086 (= (apply!1028 (+!4772 lt!593306 (tuple2!23997 lt!593314 zeroValue!1262)) lt!593308) (apply!1028 lt!593306 lt!593308))))

(declare-fun lt!593323 () Unit!43764)

(assert (=> b!1338086 (= lt!593323 lt!593327)))

(declare-fun lt!593312 () ListLongMap!21653)

(assert (=> b!1338086 (= lt!593312 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593316 () (_ BitVec 64))

(assert (=> b!1338086 (= lt!593316 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593324 () (_ BitVec 64))

(assert (=> b!1338086 (= lt!593324 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338086 (= lt!593313 (addApplyDifferent!566 lt!593312 lt!593316 minValue!1262 lt!593324))))

(assert (=> b!1338086 (= (apply!1028 (+!4772 lt!593312 (tuple2!23997 lt!593316 minValue!1262)) lt!593324) (apply!1028 lt!593312 lt!593324))))

(declare-fun b!1338087 () Bool)

(assert (=> b!1338087 (= e!761902 (validKeyInArray!0 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun bm!64959 () Bool)

(assert (=> bm!64959 (= call!64961 (getCurrentListMapNoExtraKeys!6415 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1338088 () Bool)

(declare-fun e!761898 () Bool)

(assert (=> b!1338088 (= e!761898 e!761908)))

(declare-fun res!887890 () Bool)

(assert (=> b!1338088 (=> (not res!887890) (not e!761908))))

(assert (=> b!1338088 (= res!887890 (contains!8940 lt!593319 (select (arr!43832 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338088 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))

(declare-fun bm!64960 () Bool)

(assert (=> bm!64960 (= call!64962 (+!4772 (ite c!126179 call!64961 (ite c!126183 call!64958 call!64960)) (ite (or c!126179 c!126183) (tuple2!23997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1338089 () Bool)

(declare-fun res!887888 () Bool)

(assert (=> b!1338089 (=> (not res!887888) (not e!761906))))

(assert (=> b!1338089 (= res!887888 e!761898)))

(declare-fun res!887887 () Bool)

(assert (=> b!1338089 (=> res!887887 e!761898)))

(assert (=> b!1338089 (= res!887887 (not e!761901))))

(declare-fun res!887893 () Bool)

(assert (=> b!1338089 (=> (not res!887893) (not e!761901))))

(assert (=> b!1338089 (= res!887893 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _keys!1590)))))

(assert (= (and d!143791 c!126179) b!1338075))

(assert (= (and d!143791 (not c!126179)) b!1338083))

(assert (= (and b!1338083 c!126183) b!1338080))

(assert (= (and b!1338083 (not c!126183)) b!1338079))

(assert (= (and b!1338079 c!126178) b!1338069))

(assert (= (and b!1338079 (not c!126178)) b!1338077))

(assert (= (or b!1338069 b!1338077) bm!64954))

(assert (= (or b!1338080 bm!64954) bm!64956))

(assert (= (or b!1338080 b!1338069) bm!64957))

(assert (= (or b!1338075 bm!64956) bm!64959))

(assert (= (or b!1338075 bm!64957) bm!64960))

(assert (= (and d!143791 res!887886) b!1338087))

(assert (= (and d!143791 c!126181) b!1338086))

(assert (= (and d!143791 (not c!126181)) b!1338084))

(assert (= (and d!143791 res!887889) b!1338089))

(assert (= (and b!1338089 res!887893) b!1338070))

(assert (= (and b!1338089 (not res!887887)) b!1338088))

(assert (= (and b!1338088 res!887890) b!1338072))

(assert (= (and b!1338089 res!887888) b!1338082))

(assert (= (and b!1338082 c!126182) b!1338074))

(assert (= (and b!1338082 (not c!126182)) b!1338071))

(assert (= (and b!1338074 res!887885) b!1338078))

(assert (= (or b!1338074 b!1338071) bm!64955))

(assert (= (and b!1338082 res!887891) b!1338073))

(assert (= (and b!1338073 c!126180) b!1338076))

(assert (= (and b!1338073 (not c!126180)) b!1338085))

(assert (= (and b!1338076 res!887892) b!1338081))

(assert (= (or b!1338076 b!1338085) bm!64958))

(declare-fun b_lambda!24255 () Bool)

(assert (=> (not b_lambda!24255) (not b!1338072)))

(assert (=> b!1338072 t!45442))

(declare-fun b_and!50061 () Bool)

(assert (= b_and!50059 (and (=> t!45442 result!25327) b_and!50061)))

(assert (=> b!1338088 m!1225717))

(assert (=> b!1338088 m!1225717))

(declare-fun m!1225769 () Bool)

(assert (=> b!1338088 m!1225769))

(declare-fun m!1225771 () Bool)

(assert (=> b!1338086 m!1225771))

(declare-fun m!1225773 () Bool)

(assert (=> b!1338086 m!1225773))

(declare-fun m!1225775 () Bool)

(assert (=> b!1338086 m!1225775))

(declare-fun m!1225777 () Bool)

(assert (=> b!1338086 m!1225777))

(declare-fun m!1225779 () Bool)

(assert (=> b!1338086 m!1225779))

(declare-fun m!1225781 () Bool)

(assert (=> b!1338086 m!1225781))

(declare-fun m!1225783 () Bool)

(assert (=> b!1338086 m!1225783))

(declare-fun m!1225785 () Bool)

(assert (=> b!1338086 m!1225785))

(declare-fun m!1225787 () Bool)

(assert (=> b!1338086 m!1225787))

(declare-fun m!1225789 () Bool)

(assert (=> b!1338086 m!1225789))

(assert (=> b!1338086 m!1225787))

(declare-fun m!1225791 () Bool)

(assert (=> b!1338086 m!1225791))

(declare-fun m!1225793 () Bool)

(assert (=> b!1338086 m!1225793))

(assert (=> b!1338086 m!1225775))

(assert (=> b!1338086 m!1225771))

(declare-fun m!1225795 () Bool)

(assert (=> b!1338086 m!1225795))

(assert (=> b!1338086 m!1225543))

(declare-fun m!1225797 () Bool)

(assert (=> b!1338086 m!1225797))

(assert (=> b!1338086 m!1225717))

(assert (=> b!1338086 m!1225791))

(declare-fun m!1225799 () Bool)

(assert (=> b!1338086 m!1225799))

(declare-fun m!1225801 () Bool)

(assert (=> b!1338078 m!1225801))

(assert (=> b!1338087 m!1225717))

(assert (=> b!1338087 m!1225717))

(assert (=> b!1338087 m!1225719))

(declare-fun m!1225803 () Bool)

(assert (=> bm!64958 m!1225803))

(declare-fun m!1225805 () Bool)

(assert (=> b!1338081 m!1225805))

(declare-fun m!1225807 () Bool)

(assert (=> b!1338075 m!1225807))

(assert (=> b!1338072 m!1225725))

(assert (=> b!1338072 m!1225537))

(assert (=> b!1338072 m!1225731))

(assert (=> b!1338072 m!1225725))

(assert (=> b!1338072 m!1225537))

(assert (=> b!1338072 m!1225717))

(declare-fun m!1225809 () Bool)

(assert (=> b!1338072 m!1225809))

(assert (=> b!1338072 m!1225717))

(assert (=> b!1338070 m!1225717))

(assert (=> b!1338070 m!1225717))

(assert (=> b!1338070 m!1225719))

(declare-fun m!1225811 () Bool)

(assert (=> bm!64960 m!1225811))

(assert (=> bm!64959 m!1225543))

(declare-fun m!1225813 () Bool)

(assert (=> bm!64955 m!1225813))

(assert (=> d!143791 m!1225555))

(assert (=> b!1337838 d!143791))

(declare-fun d!143793 () Bool)

(declare-fun e!761910 () Bool)

(assert (=> d!143793 e!761910))

(declare-fun res!887894 () Bool)

(assert (=> d!143793 (=> res!887894 e!761910)))

(declare-fun lt!593329 () Bool)

(assert (=> d!143793 (= res!887894 (not lt!593329))))

(declare-fun lt!593331 () Bool)

(assert (=> d!143793 (= lt!593329 lt!593331)))

(declare-fun lt!593330 () Unit!43764)

(declare-fun e!761909 () Unit!43764)

(assert (=> d!143793 (= lt!593330 e!761909)))

(declare-fun c!126184 () Bool)

(assert (=> d!143793 (= c!126184 lt!593331)))

(assert (=> d!143793 (= lt!593331 (containsKey!738 (toList!10842 lt!593159) k0!1153))))

(assert (=> d!143793 (= (contains!8940 lt!593159 k0!1153) lt!593329)))

(declare-fun b!1338090 () Bool)

(declare-fun lt!593328 () Unit!43764)

(assert (=> b!1338090 (= e!761909 lt!593328)))

(assert (=> b!1338090 (= lt!593328 (lemmaContainsKeyImpliesGetValueByKeyDefined!485 (toList!10842 lt!593159) k0!1153))))

(assert (=> b!1338090 (isDefined!528 (getValueByKey!721 (toList!10842 lt!593159) k0!1153))))

(declare-fun b!1338091 () Bool)

(declare-fun Unit!43773 () Unit!43764)

(assert (=> b!1338091 (= e!761909 Unit!43773)))

(declare-fun b!1338092 () Bool)

(assert (=> b!1338092 (= e!761910 (isDefined!528 (getValueByKey!721 (toList!10842 lt!593159) k0!1153)))))

(assert (= (and d!143793 c!126184) b!1338090))

(assert (= (and d!143793 (not c!126184)) b!1338091))

(assert (= (and d!143793 (not res!887894)) b!1338092))

(declare-fun m!1225815 () Bool)

(assert (=> d!143793 m!1225815))

(declare-fun m!1225817 () Bool)

(assert (=> b!1338090 m!1225817))

(declare-fun m!1225819 () Bool)

(assert (=> b!1338090 m!1225819))

(assert (=> b!1338090 m!1225819))

(declare-fun m!1225821 () Bool)

(assert (=> b!1338090 m!1225821))

(assert (=> b!1338092 m!1225819))

(assert (=> b!1338092 m!1225819))

(assert (=> b!1338092 m!1225821))

(assert (=> b!1337838 d!143793))

(declare-fun d!143795 () Bool)

(assert (=> d!143795 (contains!8940 lt!593159 k0!1153)))

(declare-fun lt!593334 () Unit!43764)

(declare-fun choose!1976 ((_ BitVec 64) (_ BitVec 64) V!54393 ListLongMap!21653) Unit!43764)

(assert (=> d!143795 (= lt!593334 (choose!1976 k0!1153 (select (arr!43832 _keys!1590) from!1980) lt!593158 lt!593159))))

(assert (=> d!143795 (contains!8940 (+!4772 lt!593159 (tuple2!23997 (select (arr!43832 _keys!1590) from!1980) lt!593158)) k0!1153)))

(assert (=> d!143795 (= (lemmaInListMapAfterAddingDiffThenInBefore!314 k0!1153 (select (arr!43832 _keys!1590) from!1980) lt!593158 lt!593159) lt!593334)))

(declare-fun bs!38289 () Bool)

(assert (= bs!38289 d!143795))

(assert (=> bs!38289 m!1225553))

(assert (=> bs!38289 m!1225521))

(declare-fun m!1225823 () Bool)

(assert (=> bs!38289 m!1225823))

(assert (=> bs!38289 m!1225533))

(assert (=> bs!38289 m!1225533))

(assert (=> bs!38289 m!1225535))

(assert (=> b!1337838 d!143795))

(declare-fun b!1338103 () Bool)

(declare-fun e!761919 () Bool)

(declare-fun e!761921 () Bool)

(assert (=> b!1338103 (= e!761919 e!761921)))

(declare-fun c!126187 () Bool)

(assert (=> b!1338103 (= c!126187 (validKeyInArray!0 (select (arr!43832 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338104 () Bool)

(declare-fun call!64966 () Bool)

(assert (=> b!1338104 (= e!761921 call!64966)))

(declare-fun b!1338105 () Bool)

(declare-fun e!761920 () Bool)

(declare-fun contains!8944 (List!31125 (_ BitVec 64)) Bool)

(assert (=> b!1338105 (= e!761920 (contains!8944 Nil!31122 (select (arr!43832 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143797 () Bool)

(declare-fun res!887903 () Bool)

(declare-fun e!761922 () Bool)

(assert (=> d!143797 (=> res!887903 e!761922)))

(assert (=> d!143797 (= res!887903 (bvsge #b00000000000000000000000000000000 (size!44384 _keys!1590)))))

(assert (=> d!143797 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31122) e!761922)))

(declare-fun b!1338106 () Bool)

(assert (=> b!1338106 (= e!761922 e!761919)))

(declare-fun res!887901 () Bool)

(assert (=> b!1338106 (=> (not res!887901) (not e!761919))))

(assert (=> b!1338106 (= res!887901 (not e!761920))))

(declare-fun res!887902 () Bool)

(assert (=> b!1338106 (=> (not res!887902) (not e!761920))))

(assert (=> b!1338106 (= res!887902 (validKeyInArray!0 (select (arr!43832 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64963 () Bool)

(assert (=> bm!64963 (= call!64966 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126187 (Cons!31121 (select (arr!43832 _keys!1590) #b00000000000000000000000000000000) Nil!31122) Nil!31122)))))

(declare-fun b!1338107 () Bool)

(assert (=> b!1338107 (= e!761921 call!64966)))

(assert (= (and d!143797 (not res!887903)) b!1338106))

(assert (= (and b!1338106 res!887902) b!1338105))

(assert (= (and b!1338106 res!887901) b!1338103))

(assert (= (and b!1338103 c!126187) b!1338104))

(assert (= (and b!1338103 (not c!126187)) b!1338107))

(assert (= (or b!1338104 b!1338107) bm!64963))

(assert (=> b!1338103 m!1225749))

(assert (=> b!1338103 m!1225749))

(assert (=> b!1338103 m!1225751))

(assert (=> b!1338105 m!1225749))

(assert (=> b!1338105 m!1225749))

(declare-fun m!1225825 () Bool)

(assert (=> b!1338105 m!1225825))

(assert (=> b!1338106 m!1225749))

(assert (=> b!1338106 m!1225749))

(assert (=> b!1338106 m!1225751))

(assert (=> bm!64963 m!1225749))

(declare-fun m!1225827 () Bool)

(assert (=> bm!64963 m!1225827))

(assert (=> b!1337829 d!143797))

(declare-fun mapIsEmpty!57144 () Bool)

(declare-fun mapRes!57144 () Bool)

(assert (=> mapIsEmpty!57144 mapRes!57144))

(declare-fun b!1338114 () Bool)

(declare-fun e!761927 () Bool)

(assert (=> b!1338114 (= e!761927 tp_is_empty!36967)))

(declare-fun mapNonEmpty!57144 () Bool)

(declare-fun tp!108835 () Bool)

(assert (=> mapNonEmpty!57144 (= mapRes!57144 (and tp!108835 e!761927))))

(declare-fun mapValue!57144 () ValueCell!17585)

(declare-fun mapKey!57144 () (_ BitVec 32))

(declare-fun mapRest!57144 () (Array (_ BitVec 32) ValueCell!17585))

(assert (=> mapNonEmpty!57144 (= mapRest!57135 (store mapRest!57144 mapKey!57144 mapValue!57144))))

(declare-fun b!1338115 () Bool)

(declare-fun e!761928 () Bool)

(assert (=> b!1338115 (= e!761928 tp_is_empty!36967)))

(declare-fun condMapEmpty!57144 () Bool)

(declare-fun mapDefault!57144 () ValueCell!17585)

(assert (=> mapNonEmpty!57135 (= condMapEmpty!57144 (= mapRest!57135 ((as const (Array (_ BitVec 32) ValueCell!17585)) mapDefault!57144)))))

(assert (=> mapNonEmpty!57135 (= tp!108820 (and e!761928 mapRes!57144))))

(assert (= (and mapNonEmpty!57135 condMapEmpty!57144) mapIsEmpty!57144))

(assert (= (and mapNonEmpty!57135 (not condMapEmpty!57144)) mapNonEmpty!57144))

(assert (= (and mapNonEmpty!57144 ((_ is ValueCellFull!17585) mapValue!57144)) b!1338114))

(assert (= (and mapNonEmpty!57135 ((_ is ValueCellFull!17585) mapDefault!57144)) b!1338115))

(declare-fun m!1225829 () Bool)

(assert (=> mapNonEmpty!57144 m!1225829))

(declare-fun b_lambda!24257 () Bool)

(assert (= b_lambda!24255 (or (and start!112804 b_free!31057) b_lambda!24257)))

(declare-fun b_lambda!24259 () Bool)

(assert (= b_lambda!24251 (or (and start!112804 b_free!31057) b_lambda!24259)))

(declare-fun b_lambda!24261 () Bool)

(assert (= b_lambda!24249 (or (and start!112804 b_free!31057) b_lambda!24261)))

(declare-fun b_lambda!24263 () Bool)

(assert (= b_lambda!24253 (or (and start!112804 b_free!31057) b_lambda!24263)))

(check-sat (not bm!64963) (not b!1338000) (not b!1338072) (not b!1338086) (not b!1338090) (not b!1338042) (not b!1337985) (not b!1338087) (not d!143779) (not b!1338078) (not bm!64955) (not b!1338081) b_and!50061 (not b!1337988) (not b_lambda!24247) (not b!1337994) (not d!143795) (not b!1338039) (not b!1338047) (not b!1338052) (not b!1337937) (not bm!64958) (not b!1338001) (not b!1338106) (not b_next!31057) (not b!1338068) (not b_lambda!24257) (not bm!64942) (not bm!64959) (not bm!64946) (not d!143781) (not d!143777) (not b!1338011) tp_is_empty!36967 (not b!1338003) (not b!1338092) (not b!1338065) (not bm!64960) (not b_lambda!24259) (not d!143773) (not b!1338010) (not bm!64950) (not b_lambda!24261) (not b!1338070) (not d!143791) (not bm!64945) (not b!1338103) (not b!1337939) (not b!1338043) (not b!1337983) (not b_lambda!24263) (not b!1338075) (not b!1338040) (not b!1338041) (not b!1338036) (not d!143789) (not bm!64947) (not d!143775) (not bm!64953) (not b!1338066) (not b!1338105) (not b!1338053) (not b!1338044) (not b!1338064) (not b!1338005) (not d!143793) (not b!1337991) (not b!1337999) (not b!1338088) (not mapNonEmpty!57144))
(check-sat b_and!50061 (not b_next!31057))
