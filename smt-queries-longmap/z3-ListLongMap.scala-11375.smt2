; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132104 () Bool)

(assert start!132104)

(declare-fun b_free!31867 () Bool)

(declare-fun b_next!31867 () Bool)

(assert (=> start!132104 (= b_free!31867 (not b_next!31867))))

(declare-fun tp!111854 () Bool)

(declare-fun b_and!51271 () Bool)

(assert (=> start!132104 (= tp!111854 b_and!51271)))

(declare-fun b!1550074 () Bool)

(declare-fun e!862828 () Bool)

(declare-fun e!862829 () Bool)

(assert (=> b!1550074 (= e!862828 e!862829)))

(declare-fun res!1061836 () Bool)

(assert (=> b!1550074 (=> (not res!1061836) (not e!862829))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103406 0))(
  ( (array!103407 (arr!49906 (Array (_ BitVec 32) (_ BitVec 64))) (size!50458 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103406)

(assert (=> b!1550074 (= res!1061836 (bvslt from!762 (size!50458 _keys!618)))))

(declare-datatypes ((V!59301 0))(
  ( (V!59302 (val!19149 Int)) )
))
(declare-datatypes ((tuple2!24750 0))(
  ( (tuple2!24751 (_1!12386 (_ BitVec 64)) (_2!12386 V!59301)) )
))
(declare-datatypes ((List!36203 0))(
  ( (Nil!36200) (Cons!36199 (h!37645 tuple2!24750) (t!50901 List!36203)) )
))
(declare-datatypes ((ListLongMap!22359 0))(
  ( (ListLongMap!22360 (toList!11195 List!36203)) )
))
(declare-fun lt!667983 () ListLongMap!22359)

(declare-fun e!862835 () ListLongMap!22359)

(assert (=> b!1550074 (= lt!667983 e!862835)))

(declare-fun c!142478 () Bool)

(declare-fun lt!667984 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1550074 (= c!142478 (and (not lt!667984) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550074 (= lt!667984 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550075 () Bool)

(declare-fun e!862833 () ListLongMap!22359)

(declare-fun call!70708 () ListLongMap!22359)

(assert (=> b!1550075 (= e!862833 call!70708)))

(declare-fun b!1550076 () Bool)

(declare-fun call!70706 () ListLongMap!22359)

(declare-fun minValue!436 () V!59301)

(declare-fun +!5012 (ListLongMap!22359 tuple2!24750) ListLongMap!22359)

(assert (=> b!1550076 (= e!862835 (+!5012 call!70706 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapNonEmpty!58918 () Bool)

(declare-fun mapRes!58918 () Bool)

(declare-fun tp!111853 () Bool)

(declare-fun e!862836 () Bool)

(assert (=> mapNonEmpty!58918 (= mapRes!58918 (and tp!111853 e!862836))))

(declare-fun mapKey!58918 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18161 0))(
  ( (ValueCellFull!18161 (v!21946 V!59301)) (EmptyCell!18161) )
))
(declare-datatypes ((array!103408 0))(
  ( (array!103409 (arr!49907 (Array (_ BitVec 32) ValueCell!18161)) (size!50459 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103408)

(declare-fun mapValue!58918 () ValueCell!18161)

(declare-fun mapRest!58918 () (Array (_ BitVec 32) ValueCell!18161))

(assert (=> mapNonEmpty!58918 (= (arr!49907 _values!470) (store mapRest!58918 mapKey!58918 mapValue!58918))))

(declare-fun b!1550077 () Bool)

(declare-fun zeroValue!436 () V!59301)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun contains!10057 (ListLongMap!22359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6635 (array!103406 array!103408 (_ BitVec 32) (_ BitVec 32) V!59301 V!59301 (_ BitVec 32) Int) ListLongMap!22359)

(assert (=> b!1550077 (= e!862829 (not (contains!10057 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49906 _keys!618) from!762))))))

(declare-fun b!1550078 () Bool)

(declare-fun e!862830 () Bool)

(declare-fun tp_is_empty!38143 () Bool)

(assert (=> b!1550078 (= e!862830 tp_is_empty!38143)))

(declare-fun b!1550079 () Bool)

(assert (=> b!1550079 (= e!862836 tp_is_empty!38143)))

(declare-fun b!1550080 () Bool)

(declare-fun res!1061839 () Bool)

(assert (=> b!1550080 (=> (not res!1061839) (not e!862828))))

(assert (=> b!1550080 (= res!1061839 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50458 _keys!618))))))

(declare-fun call!70704 () ListLongMap!22359)

(declare-fun bm!70701 () Bool)

(declare-fun call!70707 () ListLongMap!22359)

(declare-fun c!142479 () Bool)

(declare-fun call!70705 () ListLongMap!22359)

(assert (=> bm!70701 (= call!70706 (+!5012 (ite c!142478 call!70705 (ite c!142479 call!70704 call!70707)) (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70702 () Bool)

(assert (=> bm!70702 (= call!70708 call!70706)))

(declare-fun b!1550081 () Bool)

(declare-fun e!862834 () ListLongMap!22359)

(assert (=> b!1550081 (= e!862834 call!70708)))

(declare-fun mapIsEmpty!58918 () Bool)

(assert (=> mapIsEmpty!58918 mapRes!58918))

(declare-fun res!1061838 () Bool)

(assert (=> start!132104 (=> (not res!1061838) (not e!862828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132104 (= res!1061838 (validMask!0 mask!926))))

(assert (=> start!132104 e!862828))

(declare-fun array_inv!39003 (array!103406) Bool)

(assert (=> start!132104 (array_inv!39003 _keys!618)))

(assert (=> start!132104 tp_is_empty!38143))

(assert (=> start!132104 true))

(assert (=> start!132104 tp!111854))

(declare-fun e!862831 () Bool)

(declare-fun array_inv!39004 (array!103408) Bool)

(assert (=> start!132104 (and (array_inv!39004 _values!470) e!862831)))

(declare-fun b!1550082 () Bool)

(declare-fun res!1061841 () Bool)

(assert (=> b!1550082 (=> (not res!1061841) (not e!862828))))

(declare-datatypes ((List!36204 0))(
  ( (Nil!36201) (Cons!36200 (h!37646 (_ BitVec 64)) (t!50902 List!36204)) )
))
(declare-fun arrayNoDuplicates!0 (array!103406 (_ BitVec 32) List!36204) Bool)

(assert (=> b!1550082 (= res!1061841 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36201))))

(declare-fun b!1550083 () Bool)

(assert (=> b!1550083 (= e!862831 (and e!862830 mapRes!58918))))

(declare-fun condMapEmpty!58918 () Bool)

(declare-fun mapDefault!58918 () ValueCell!18161)

(assert (=> b!1550083 (= condMapEmpty!58918 (= (arr!49907 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18161)) mapDefault!58918)))))

(declare-fun b!1550084 () Bool)

(declare-fun res!1061840 () Bool)

(assert (=> b!1550084 (=> (not res!1061840) (not e!862828))))

(assert (=> b!1550084 (= res!1061840 (and (= (size!50459 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50458 _keys!618) (size!50459 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550085 () Bool)

(declare-fun res!1061837 () Bool)

(assert (=> b!1550085 (=> (not res!1061837) (not e!862828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103406 (_ BitVec 32)) Bool)

(assert (=> b!1550085 (= res!1061837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70703 () Bool)

(assert (=> bm!70703 (= call!70704 call!70705)))

(declare-fun b!1550086 () Bool)

(declare-fun res!1061835 () Bool)

(assert (=> b!1550086 (=> (not res!1061835) (not e!862829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550086 (= res!1061835 (validKeyInArray!0 (select (arr!49906 _keys!618) from!762)))))

(declare-fun b!1550087 () Bool)

(assert (=> b!1550087 (= e!862834 call!70707)))

(declare-fun b!1550088 () Bool)

(declare-fun c!142477 () Bool)

(assert (=> b!1550088 (= c!142477 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667984))))

(assert (=> b!1550088 (= e!862833 e!862834)))

(declare-fun bm!70704 () Bool)

(assert (=> bm!70704 (= call!70707 call!70704)))

(declare-fun bm!70705 () Bool)

(assert (=> bm!70705 (= call!70705 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550089 () Bool)

(assert (=> b!1550089 (= e!862835 e!862833)))

(assert (=> b!1550089 (= c!142479 (and (not lt!667984) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!132104 res!1061838) b!1550084))

(assert (= (and b!1550084 res!1061840) b!1550085))

(assert (= (and b!1550085 res!1061837) b!1550082))

(assert (= (and b!1550082 res!1061841) b!1550080))

(assert (= (and b!1550080 res!1061839) b!1550074))

(assert (= (and b!1550074 c!142478) b!1550076))

(assert (= (and b!1550074 (not c!142478)) b!1550089))

(assert (= (and b!1550089 c!142479) b!1550075))

(assert (= (and b!1550089 (not c!142479)) b!1550088))

(assert (= (and b!1550088 c!142477) b!1550081))

(assert (= (and b!1550088 (not c!142477)) b!1550087))

(assert (= (or b!1550081 b!1550087) bm!70704))

(assert (= (or b!1550075 bm!70704) bm!70703))

(assert (= (or b!1550075 b!1550081) bm!70702))

(assert (= (or b!1550076 bm!70703) bm!70705))

(assert (= (or b!1550076 bm!70702) bm!70701))

(assert (= (and b!1550074 res!1061836) b!1550086))

(assert (= (and b!1550086 res!1061835) b!1550077))

(assert (= (and b!1550083 condMapEmpty!58918) mapIsEmpty!58918))

(assert (= (and b!1550083 (not condMapEmpty!58918)) mapNonEmpty!58918))

(get-info :version)

(assert (= (and mapNonEmpty!58918 ((_ is ValueCellFull!18161) mapValue!58918)) b!1550079))

(assert (= (and b!1550083 ((_ is ValueCellFull!18161) mapDefault!58918)) b!1550078))

(assert (= start!132104 b!1550083))

(declare-fun m!1428435 () Bool)

(assert (=> bm!70705 m!1428435))

(declare-fun m!1428437 () Bool)

(assert (=> b!1550076 m!1428437))

(declare-fun m!1428439 () Bool)

(assert (=> bm!70701 m!1428439))

(declare-fun m!1428441 () Bool)

(assert (=> start!132104 m!1428441))

(declare-fun m!1428443 () Bool)

(assert (=> start!132104 m!1428443))

(declare-fun m!1428445 () Bool)

(assert (=> start!132104 m!1428445))

(declare-fun m!1428447 () Bool)

(assert (=> b!1550085 m!1428447))

(declare-fun m!1428449 () Bool)

(assert (=> mapNonEmpty!58918 m!1428449))

(declare-fun m!1428451 () Bool)

(assert (=> b!1550086 m!1428451))

(assert (=> b!1550086 m!1428451))

(declare-fun m!1428453 () Bool)

(assert (=> b!1550086 m!1428453))

(declare-fun m!1428455 () Bool)

(assert (=> b!1550082 m!1428455))

(assert (=> b!1550077 m!1428435))

(assert (=> b!1550077 m!1428451))

(assert (=> b!1550077 m!1428435))

(assert (=> b!1550077 m!1428451))

(declare-fun m!1428457 () Bool)

(assert (=> b!1550077 m!1428457))

(check-sat (not start!132104) (not bm!70705) (not mapNonEmpty!58918) tp_is_empty!38143 (not b!1550082) b_and!51271 (not b_next!31867) (not b!1550085) (not b!1550086) (not b!1550076) (not bm!70701) (not b!1550077))
(check-sat b_and!51271 (not b_next!31867))
(get-model)

(declare-fun d!160651 () Bool)

(assert (=> d!160651 (= (validKeyInArray!0 (select (arr!49906 _keys!618) from!762)) (and (not (= (select (arr!49906 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49906 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1550086 d!160651))

(declare-fun b!1550196 () Bool)

(declare-fun e!862901 () Bool)

(declare-fun call!70741 () Bool)

(assert (=> b!1550196 (= e!862901 call!70741)))

(declare-fun b!1550197 () Bool)

(declare-fun e!862900 () Bool)

(assert (=> b!1550197 (= e!862900 e!862901)))

(declare-fun c!142500 () Bool)

(assert (=> b!1550197 (= c!142500 (validKeyInArray!0 (select (arr!49906 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun bm!70738 () Bool)

(assert (=> bm!70738 (= call!70741 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142500 (Cons!36200 (select (arr!49906 _keys!618) #b00000000000000000000000000000000) Nil!36201) Nil!36201)))))

(declare-fun b!1550198 () Bool)

(assert (=> b!1550198 (= e!862901 call!70741)))

(declare-fun b!1550199 () Bool)

(declare-fun e!862899 () Bool)

(declare-fun contains!10060 (List!36204 (_ BitVec 64)) Bool)

(assert (=> b!1550199 (= e!862899 (contains!10060 Nil!36201 (select (arr!49906 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550200 () Bool)

(declare-fun e!862902 () Bool)

(assert (=> b!1550200 (= e!862902 e!862900)))

(declare-fun res!1061891 () Bool)

(assert (=> b!1550200 (=> (not res!1061891) (not e!862900))))

(assert (=> b!1550200 (= res!1061891 (not e!862899))))

(declare-fun res!1061890 () Bool)

(assert (=> b!1550200 (=> (not res!1061890) (not e!862899))))

(assert (=> b!1550200 (= res!1061890 (validKeyInArray!0 (select (arr!49906 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!160653 () Bool)

(declare-fun res!1061892 () Bool)

(assert (=> d!160653 (=> res!1061892 e!862902)))

(assert (=> d!160653 (= res!1061892 (bvsge #b00000000000000000000000000000000 (size!50458 _keys!618)))))

(assert (=> d!160653 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36201) e!862902)))

(assert (= (and d!160653 (not res!1061892)) b!1550200))

(assert (= (and b!1550200 res!1061890) b!1550199))

(assert (= (and b!1550200 res!1061891) b!1550197))

(assert (= (and b!1550197 c!142500) b!1550198))

(assert (= (and b!1550197 (not c!142500)) b!1550196))

(assert (= (or b!1550198 b!1550196) bm!70738))

(declare-fun m!1428507 () Bool)

(assert (=> b!1550197 m!1428507))

(assert (=> b!1550197 m!1428507))

(declare-fun m!1428509 () Bool)

(assert (=> b!1550197 m!1428509))

(assert (=> bm!70738 m!1428507))

(declare-fun m!1428511 () Bool)

(assert (=> bm!70738 m!1428511))

(assert (=> b!1550199 m!1428507))

(assert (=> b!1550199 m!1428507))

(declare-fun m!1428513 () Bool)

(assert (=> b!1550199 m!1428513))

(assert (=> b!1550200 m!1428507))

(assert (=> b!1550200 m!1428507))

(assert (=> b!1550200 m!1428509))

(assert (=> b!1550082 d!160653))

(declare-fun b!1550225 () Bool)

(declare-fun e!862923 () Bool)

(assert (=> b!1550225 (= e!862923 (validKeyInArray!0 (select (arr!49906 _keys!618) from!762)))))

(assert (=> b!1550225 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun d!160655 () Bool)

(declare-fun e!862922 () Bool)

(assert (=> d!160655 e!862922))

(declare-fun res!1061901 () Bool)

(assert (=> d!160655 (=> (not res!1061901) (not e!862922))))

(declare-fun lt!668011 () ListLongMap!22359)

(assert (=> d!160655 (= res!1061901 (not (contains!10057 lt!668011 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!862919 () ListLongMap!22359)

(assert (=> d!160655 (= lt!668011 e!862919)))

(declare-fun c!142511 () Bool)

(assert (=> d!160655 (= c!142511 (bvsge from!762 (size!50458 _keys!618)))))

(assert (=> d!160655 (validMask!0 mask!926)))

(assert (=> d!160655 (= (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!668011)))

(declare-fun b!1550226 () Bool)

(declare-fun e!862920 () Bool)

(declare-fun isEmpty!1133 (ListLongMap!22359) Bool)

(assert (=> b!1550226 (= e!862920 (isEmpty!1133 lt!668011))))

(declare-fun b!1550227 () Bool)

(declare-fun e!862917 () ListLongMap!22359)

(assert (=> b!1550227 (= e!862919 e!862917)))

(declare-fun c!142512 () Bool)

(assert (=> b!1550227 (= c!142512 (validKeyInArray!0 (select (arr!49906 _keys!618) from!762)))))

(declare-fun b!1550228 () Bool)

(assert (=> b!1550228 (= e!862920 (= lt!668011 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun call!70744 () ListLongMap!22359)

(declare-fun bm!70741 () Bool)

(assert (=> bm!70741 (= call!70744 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1550229 () Bool)

(declare-fun e!862918 () Bool)

(declare-fun e!862921 () Bool)

(assert (=> b!1550229 (= e!862918 e!862921)))

(assert (=> b!1550229 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50458 _keys!618)))))

(declare-fun res!1061902 () Bool)

(assert (=> b!1550229 (= res!1061902 (contains!10057 lt!668011 (select (arr!49906 _keys!618) from!762)))))

(assert (=> b!1550229 (=> (not res!1061902) (not e!862921))))

(declare-fun b!1550230 () Bool)

(assert (=> b!1550230 (= e!862922 e!862918)))

(declare-fun c!142510 () Bool)

(assert (=> b!1550230 (= c!142510 e!862923)))

(declare-fun res!1061904 () Bool)

(assert (=> b!1550230 (=> (not res!1061904) (not e!862923))))

(assert (=> b!1550230 (= res!1061904 (bvslt from!762 (size!50458 _keys!618)))))

(declare-fun b!1550231 () Bool)

(declare-datatypes ((Unit!51465 0))(
  ( (Unit!51466) )
))
(declare-fun lt!668016 () Unit!51465)

(declare-fun lt!668015 () Unit!51465)

(assert (=> b!1550231 (= lt!668016 lt!668015)))

(declare-fun lt!668017 () ListLongMap!22359)

(declare-fun lt!668014 () (_ BitVec 64))

(declare-fun lt!668012 () (_ BitVec 64))

(declare-fun lt!668013 () V!59301)

(assert (=> b!1550231 (not (contains!10057 (+!5012 lt!668017 (tuple2!24751 lt!668014 lt!668013)) lt!668012))))

(declare-fun addStillNotContains!497 (ListLongMap!22359 (_ BitVec 64) V!59301 (_ BitVec 64)) Unit!51465)

(assert (=> b!1550231 (= lt!668015 (addStillNotContains!497 lt!668017 lt!668014 lt!668013 lt!668012))))

(assert (=> b!1550231 (= lt!668012 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!26007 (ValueCell!18161 V!59301) V!59301)

(declare-fun dynLambda!3824 (Int (_ BitVec 64)) V!59301)

(assert (=> b!1550231 (= lt!668013 (get!26007 (select (arr!49907 _values!470) from!762) (dynLambda!3824 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1550231 (= lt!668014 (select (arr!49906 _keys!618) from!762))))

(assert (=> b!1550231 (= lt!668017 call!70744)))

(assert (=> b!1550231 (= e!862917 (+!5012 call!70744 (tuple2!24751 (select (arr!49906 _keys!618) from!762) (get!26007 (select (arr!49907 _values!470) from!762) (dynLambda!3824 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1550232 () Bool)

(assert (=> b!1550232 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50458 _keys!618)))))

(assert (=> b!1550232 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50459 _values!470)))))

(declare-fun apply!1081 (ListLongMap!22359 (_ BitVec 64)) V!59301)

(assert (=> b!1550232 (= e!862921 (= (apply!1081 lt!668011 (select (arr!49906 _keys!618) from!762)) (get!26007 (select (arr!49907 _values!470) from!762) (dynLambda!3824 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1550233 () Bool)

(assert (=> b!1550233 (= e!862919 (ListLongMap!22360 Nil!36200))))

(declare-fun b!1550234 () Bool)

(assert (=> b!1550234 (= e!862917 call!70744)))

(declare-fun b!1550235 () Bool)

(assert (=> b!1550235 (= e!862918 e!862920)))

(declare-fun c!142509 () Bool)

(assert (=> b!1550235 (= c!142509 (bvslt from!762 (size!50458 _keys!618)))))

(declare-fun b!1550236 () Bool)

(declare-fun res!1061903 () Bool)

(assert (=> b!1550236 (=> (not res!1061903) (not e!862922))))

(assert (=> b!1550236 (= res!1061903 (not (contains!10057 lt!668011 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160655 c!142511) b!1550233))

(assert (= (and d!160655 (not c!142511)) b!1550227))

(assert (= (and b!1550227 c!142512) b!1550231))

(assert (= (and b!1550227 (not c!142512)) b!1550234))

(assert (= (or b!1550231 b!1550234) bm!70741))

(assert (= (and d!160655 res!1061901) b!1550236))

(assert (= (and b!1550236 res!1061903) b!1550230))

(assert (= (and b!1550230 res!1061904) b!1550225))

(assert (= (and b!1550230 c!142510) b!1550229))

(assert (= (and b!1550230 (not c!142510)) b!1550235))

(assert (= (and b!1550229 res!1061902) b!1550232))

(assert (= (and b!1550235 c!142509) b!1550228))

(assert (= (and b!1550235 (not c!142509)) b!1550226))

(declare-fun b_lambda!24745 () Bool)

(assert (=> (not b_lambda!24745) (not b!1550231)))

(declare-fun t!50907 () Bool)

(declare-fun tb!12467 () Bool)

(assert (=> (and start!132104 (= defaultEntry!478 defaultEntry!478) t!50907) tb!12467))

(declare-fun result!26053 () Bool)

(assert (=> tb!12467 (= result!26053 tp_is_empty!38143)))

(assert (=> b!1550231 t!50907))

(declare-fun b_and!51277 () Bool)

(assert (= b_and!51271 (and (=> t!50907 result!26053) b_and!51277)))

(declare-fun b_lambda!24747 () Bool)

(assert (=> (not b_lambda!24747) (not b!1550232)))

(assert (=> b!1550232 t!50907))

(declare-fun b_and!51279 () Bool)

(assert (= b_and!51277 (and (=> t!50907 result!26053) b_and!51279)))

(declare-fun m!1428515 () Bool)

(assert (=> b!1550226 m!1428515))

(declare-fun m!1428517 () Bool)

(assert (=> b!1550231 m!1428517))

(assert (=> b!1550231 m!1428517))

(declare-fun m!1428519 () Bool)

(assert (=> b!1550231 m!1428519))

(declare-fun m!1428521 () Bool)

(assert (=> b!1550231 m!1428521))

(declare-fun m!1428523 () Bool)

(assert (=> b!1550231 m!1428523))

(declare-fun m!1428525 () Bool)

(assert (=> b!1550231 m!1428525))

(declare-fun m!1428527 () Bool)

(assert (=> b!1550231 m!1428527))

(declare-fun m!1428529 () Bool)

(assert (=> b!1550231 m!1428529))

(assert (=> b!1550231 m!1428521))

(assert (=> b!1550231 m!1428523))

(assert (=> b!1550231 m!1428451))

(assert (=> b!1550227 m!1428451))

(assert (=> b!1550227 m!1428451))

(assert (=> b!1550227 m!1428453))

(declare-fun m!1428531 () Bool)

(assert (=> b!1550228 m!1428531))

(declare-fun m!1428533 () Bool)

(assert (=> d!160655 m!1428533))

(assert (=> d!160655 m!1428441))

(assert (=> b!1550232 m!1428521))

(assert (=> b!1550232 m!1428521))

(assert (=> b!1550232 m!1428523))

(assert (=> b!1550232 m!1428525))

(assert (=> b!1550232 m!1428451))

(declare-fun m!1428535 () Bool)

(assert (=> b!1550232 m!1428535))

(assert (=> b!1550232 m!1428523))

(assert (=> b!1550232 m!1428451))

(assert (=> b!1550225 m!1428451))

(assert (=> b!1550225 m!1428451))

(assert (=> b!1550225 m!1428453))

(assert (=> bm!70741 m!1428531))

(declare-fun m!1428537 () Bool)

(assert (=> b!1550236 m!1428537))

(assert (=> b!1550229 m!1428451))

(assert (=> b!1550229 m!1428451))

(declare-fun m!1428539 () Bool)

(assert (=> b!1550229 m!1428539))

(assert (=> bm!70705 d!160655))

(declare-fun d!160657 () Bool)

(assert (=> d!160657 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132104 d!160657))

(declare-fun d!160659 () Bool)

(assert (=> d!160659 (= (array_inv!39003 _keys!618) (bvsge (size!50458 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132104 d!160659))

(declare-fun d!160661 () Bool)

(assert (=> d!160661 (= (array_inv!39004 _values!470) (bvsge (size!50459 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132104 d!160661))

(declare-fun b!1550247 () Bool)

(declare-fun e!862932 () Bool)

(declare-fun e!862931 () Bool)

(assert (=> b!1550247 (= e!862932 e!862931)))

(declare-fun c!142515 () Bool)

(assert (=> b!1550247 (= c!142515 (validKeyInArray!0 (select (arr!49906 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun bm!70744 () Bool)

(declare-fun call!70747 () Bool)

(assert (=> bm!70744 (= call!70747 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1550248 () Bool)

(assert (=> b!1550248 (= e!862931 call!70747)))

(declare-fun d!160663 () Bool)

(declare-fun res!1061910 () Bool)

(assert (=> d!160663 (=> res!1061910 e!862932)))

(assert (=> d!160663 (= res!1061910 (bvsge #b00000000000000000000000000000000 (size!50458 _keys!618)))))

(assert (=> d!160663 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!862932)))

(declare-fun b!1550249 () Bool)

(declare-fun e!862930 () Bool)

(assert (=> b!1550249 (= e!862931 e!862930)))

(declare-fun lt!668024 () (_ BitVec 64))

(assert (=> b!1550249 (= lt!668024 (select (arr!49906 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!668026 () Unit!51465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103406 (_ BitVec 64) (_ BitVec 32)) Unit!51465)

(assert (=> b!1550249 (= lt!668026 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!668024 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1550249 (arrayContainsKey!0 _keys!618 lt!668024 #b00000000000000000000000000000000)))

(declare-fun lt!668025 () Unit!51465)

(assert (=> b!1550249 (= lt!668025 lt!668026)))

(declare-fun res!1061909 () Bool)

(declare-datatypes ((SeekEntryResult!13512 0))(
  ( (MissingZero!13512 (index!56446 (_ BitVec 32))) (Found!13512 (index!56447 (_ BitVec 32))) (Intermediate!13512 (undefined!14324 Bool) (index!56448 (_ BitVec 32)) (x!139068 (_ BitVec 32))) (Undefined!13512) (MissingVacant!13512 (index!56449 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103406 (_ BitVec 32)) SeekEntryResult!13512)

(assert (=> b!1550249 (= res!1061909 (= (seekEntryOrOpen!0 (select (arr!49906 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13512 #b00000000000000000000000000000000)))))

(assert (=> b!1550249 (=> (not res!1061909) (not e!862930))))

(declare-fun b!1550250 () Bool)

(assert (=> b!1550250 (= e!862930 call!70747)))

(assert (= (and d!160663 (not res!1061910)) b!1550247))

(assert (= (and b!1550247 c!142515) b!1550249))

(assert (= (and b!1550247 (not c!142515)) b!1550248))

(assert (= (and b!1550249 res!1061909) b!1550250))

(assert (= (or b!1550250 b!1550248) bm!70744))

(assert (=> b!1550247 m!1428507))

(assert (=> b!1550247 m!1428507))

(assert (=> b!1550247 m!1428509))

(declare-fun m!1428541 () Bool)

(assert (=> bm!70744 m!1428541))

(assert (=> b!1550249 m!1428507))

(declare-fun m!1428543 () Bool)

(assert (=> b!1550249 m!1428543))

(declare-fun m!1428545 () Bool)

(assert (=> b!1550249 m!1428545))

(assert (=> b!1550249 m!1428507))

(declare-fun m!1428547 () Bool)

(assert (=> b!1550249 m!1428547))

(assert (=> b!1550085 d!160663))

(declare-fun d!160665 () Bool)

(declare-fun e!862937 () Bool)

(assert (=> d!160665 e!862937))

(declare-fun res!1061913 () Bool)

(assert (=> d!160665 (=> res!1061913 e!862937)))

(declare-fun lt!668036 () Bool)

(assert (=> d!160665 (= res!1061913 (not lt!668036))))

(declare-fun lt!668035 () Bool)

(assert (=> d!160665 (= lt!668036 lt!668035)))

(declare-fun lt!668038 () Unit!51465)

(declare-fun e!862938 () Unit!51465)

(assert (=> d!160665 (= lt!668038 e!862938)))

(declare-fun c!142518 () Bool)

(assert (=> d!160665 (= c!142518 lt!668035)))

(declare-fun containsKey!748 (List!36203 (_ BitVec 64)) Bool)

(assert (=> d!160665 (= lt!668035 (containsKey!748 (toList!11195 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49906 _keys!618) from!762)))))

(assert (=> d!160665 (= (contains!10057 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49906 _keys!618) from!762)) lt!668036)))

(declare-fun b!1550257 () Bool)

(declare-fun lt!668037 () Unit!51465)

(assert (=> b!1550257 (= e!862938 lt!668037)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!495 (List!36203 (_ BitVec 64)) Unit!51465)

(assert (=> b!1550257 (= lt!668037 (lemmaContainsKeyImpliesGetValueByKeyDefined!495 (toList!11195 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49906 _keys!618) from!762)))))

(declare-datatypes ((Option!806 0))(
  ( (Some!805 (v!21949 V!59301)) (None!804) )
))
(declare-fun isDefined!547 (Option!806) Bool)

(declare-fun getValueByKey!731 (List!36203 (_ BitVec 64)) Option!806)

(assert (=> b!1550257 (isDefined!547 (getValueByKey!731 (toList!11195 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49906 _keys!618) from!762)))))

(declare-fun b!1550258 () Bool)

(declare-fun Unit!51467 () Unit!51465)

(assert (=> b!1550258 (= e!862938 Unit!51467)))

(declare-fun b!1550259 () Bool)

(assert (=> b!1550259 (= e!862937 (isDefined!547 (getValueByKey!731 (toList!11195 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49906 _keys!618) from!762))))))

(assert (= (and d!160665 c!142518) b!1550257))

(assert (= (and d!160665 (not c!142518)) b!1550258))

(assert (= (and d!160665 (not res!1061913)) b!1550259))

(assert (=> d!160665 m!1428451))

(declare-fun m!1428549 () Bool)

(assert (=> d!160665 m!1428549))

(assert (=> b!1550257 m!1428451))

(declare-fun m!1428551 () Bool)

(assert (=> b!1550257 m!1428551))

(assert (=> b!1550257 m!1428451))

(declare-fun m!1428553 () Bool)

(assert (=> b!1550257 m!1428553))

(assert (=> b!1550257 m!1428553))

(declare-fun m!1428555 () Bool)

(assert (=> b!1550257 m!1428555))

(assert (=> b!1550259 m!1428451))

(assert (=> b!1550259 m!1428553))

(assert (=> b!1550259 m!1428553))

(assert (=> b!1550259 m!1428555))

(assert (=> b!1550077 d!160665))

(assert (=> b!1550077 d!160655))

(declare-fun d!160667 () Bool)

(declare-fun e!862941 () Bool)

(assert (=> d!160667 e!862941))

(declare-fun res!1061919 () Bool)

(assert (=> d!160667 (=> (not res!1061919) (not e!862941))))

(declare-fun lt!668050 () ListLongMap!22359)

(assert (=> d!160667 (= res!1061919 (contains!10057 lt!668050 (_1!12386 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668049 () List!36203)

(assert (=> d!160667 (= lt!668050 (ListLongMap!22360 lt!668049))))

(declare-fun lt!668048 () Unit!51465)

(declare-fun lt!668047 () Unit!51465)

(assert (=> d!160667 (= lt!668048 lt!668047)))

(assert (=> d!160667 (= (getValueByKey!731 lt!668049 (_1!12386 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!805 (_2!12386 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!371 (List!36203 (_ BitVec 64) V!59301) Unit!51465)

(assert (=> d!160667 (= lt!668047 (lemmaContainsTupThenGetReturnValue!371 lt!668049 (_1!12386 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12386 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun insertStrictlySorted!500 (List!36203 (_ BitVec 64) V!59301) List!36203)

(assert (=> d!160667 (= lt!668049 (insertStrictlySorted!500 (toList!11195 call!70706) (_1!12386 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12386 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160667 (= (+!5012 call!70706 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668050)))

(declare-fun b!1550264 () Bool)

(declare-fun res!1061918 () Bool)

(assert (=> b!1550264 (=> (not res!1061918) (not e!862941))))

(assert (=> b!1550264 (= res!1061918 (= (getValueByKey!731 (toList!11195 lt!668050) (_1!12386 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!805 (_2!12386 (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1550265 () Bool)

(declare-fun contains!10061 (List!36203 tuple2!24750) Bool)

(assert (=> b!1550265 (= e!862941 (contains!10061 (toList!11195 lt!668050) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160667 res!1061919) b!1550264))

(assert (= (and b!1550264 res!1061918) b!1550265))

(declare-fun m!1428557 () Bool)

(assert (=> d!160667 m!1428557))

(declare-fun m!1428559 () Bool)

(assert (=> d!160667 m!1428559))

(declare-fun m!1428561 () Bool)

(assert (=> d!160667 m!1428561))

(declare-fun m!1428563 () Bool)

(assert (=> d!160667 m!1428563))

(declare-fun m!1428565 () Bool)

(assert (=> b!1550264 m!1428565))

(declare-fun m!1428567 () Bool)

(assert (=> b!1550265 m!1428567))

(assert (=> b!1550076 d!160667))

(declare-fun d!160669 () Bool)

(declare-fun e!862942 () Bool)

(assert (=> d!160669 e!862942))

(declare-fun res!1061921 () Bool)

(assert (=> d!160669 (=> (not res!1061921) (not e!862942))))

(declare-fun lt!668054 () ListLongMap!22359)

(assert (=> d!160669 (= res!1061921 (contains!10057 lt!668054 (_1!12386 (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!668053 () List!36203)

(assert (=> d!160669 (= lt!668054 (ListLongMap!22360 lt!668053))))

(declare-fun lt!668052 () Unit!51465)

(declare-fun lt!668051 () Unit!51465)

(assert (=> d!160669 (= lt!668052 lt!668051)))

(assert (=> d!160669 (= (getValueByKey!731 lt!668053 (_1!12386 (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!805 (_2!12386 (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160669 (= lt!668051 (lemmaContainsTupThenGetReturnValue!371 lt!668053 (_1!12386 (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12386 (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160669 (= lt!668053 (insertStrictlySorted!500 (toList!11195 (ite c!142478 call!70705 (ite c!142479 call!70704 call!70707))) (_1!12386 (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12386 (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160669 (= (+!5012 (ite c!142478 call!70705 (ite c!142479 call!70704 call!70707)) (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!668054)))

(declare-fun b!1550266 () Bool)

(declare-fun res!1061920 () Bool)

(assert (=> b!1550266 (=> (not res!1061920) (not e!862942))))

(assert (=> b!1550266 (= res!1061920 (= (getValueByKey!731 (toList!11195 lt!668054) (_1!12386 (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!805 (_2!12386 (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1550267 () Bool)

(assert (=> b!1550267 (= e!862942 (contains!10061 (toList!11195 lt!668054) (ite (or c!142478 c!142479) (tuple2!24751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160669 res!1061921) b!1550266))

(assert (= (and b!1550266 res!1061920) b!1550267))

(declare-fun m!1428569 () Bool)

(assert (=> d!160669 m!1428569))

(declare-fun m!1428571 () Bool)

(assert (=> d!160669 m!1428571))

(declare-fun m!1428573 () Bool)

(assert (=> d!160669 m!1428573))

(declare-fun m!1428575 () Bool)

(assert (=> d!160669 m!1428575))

(declare-fun m!1428577 () Bool)

(assert (=> b!1550266 m!1428577))

(declare-fun m!1428579 () Bool)

(assert (=> b!1550267 m!1428579))

(assert (=> bm!70701 d!160669))

(declare-fun condMapEmpty!58927 () Bool)

(declare-fun mapDefault!58927 () ValueCell!18161)

(assert (=> mapNonEmpty!58918 (= condMapEmpty!58927 (= mapRest!58918 ((as const (Array (_ BitVec 32) ValueCell!18161)) mapDefault!58927)))))

(declare-fun e!862948 () Bool)

(declare-fun mapRes!58927 () Bool)

(assert (=> mapNonEmpty!58918 (= tp!111853 (and e!862948 mapRes!58927))))

(declare-fun b!1550275 () Bool)

(assert (=> b!1550275 (= e!862948 tp_is_empty!38143)))

(declare-fun mapIsEmpty!58927 () Bool)

(assert (=> mapIsEmpty!58927 mapRes!58927))

(declare-fun b!1550274 () Bool)

(declare-fun e!862947 () Bool)

(assert (=> b!1550274 (= e!862947 tp_is_empty!38143)))

(declare-fun mapNonEmpty!58927 () Bool)

(declare-fun tp!111869 () Bool)

(assert (=> mapNonEmpty!58927 (= mapRes!58927 (and tp!111869 e!862947))))

(declare-fun mapRest!58927 () (Array (_ BitVec 32) ValueCell!18161))

(declare-fun mapKey!58927 () (_ BitVec 32))

(declare-fun mapValue!58927 () ValueCell!18161)

(assert (=> mapNonEmpty!58927 (= mapRest!58918 (store mapRest!58927 mapKey!58927 mapValue!58927))))

(assert (= (and mapNonEmpty!58918 condMapEmpty!58927) mapIsEmpty!58927))

(assert (= (and mapNonEmpty!58918 (not condMapEmpty!58927)) mapNonEmpty!58927))

(assert (= (and mapNonEmpty!58927 ((_ is ValueCellFull!18161) mapValue!58927)) b!1550274))

(assert (= (and mapNonEmpty!58918 ((_ is ValueCellFull!18161) mapDefault!58927)) b!1550275))

(declare-fun m!1428581 () Bool)

(assert (=> mapNonEmpty!58927 m!1428581))

(declare-fun b_lambda!24749 () Bool)

(assert (= b_lambda!24745 (or (and start!132104 b_free!31867) b_lambda!24749)))

(declare-fun b_lambda!24751 () Bool)

(assert (= b_lambda!24747 (or (and start!132104 b_free!31867) b_lambda!24751)))

(check-sat (not b!1550225) (not b!1550249) (not b!1550229) (not d!160665) (not bm!70744) tp_is_empty!38143 (not d!160667) (not b!1550236) b_and!51279 (not b!1550227) (not b!1550257) (not b!1550265) (not mapNonEmpty!58927) (not b!1550232) (not b_next!31867) (not b!1550197) (not b!1550259) (not b!1550267) (not b!1550199) (not d!160669) (not b!1550231) (not b_lambda!24751) (not b!1550247) (not bm!70738) (not bm!70741) (not b_lambda!24749) (not b!1550228) (not d!160655) (not b!1550266) (not b!1550200) (not b!1550226) (not b!1550264))
(check-sat b_and!51279 (not b_next!31867))
