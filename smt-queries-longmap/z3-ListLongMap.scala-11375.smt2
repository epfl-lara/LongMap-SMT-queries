; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132566 () Bool)

(assert start!132566)

(declare-fun b_free!31867 () Bool)

(declare-fun b_next!31867 () Bool)

(assert (=> start!132566 (= b_free!31867 (not b_next!31867))))

(declare-fun tp!111852 () Bool)

(declare-fun b_and!51291 () Bool)

(assert (=> start!132566 (= tp!111852 b_and!51291)))

(declare-fun b!1552823 () Bool)

(declare-fun res!1062826 () Bool)

(declare-fun e!864541 () Bool)

(assert (=> b!1552823 (=> (not res!1062826) (not e!864541))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103608 0))(
  ( (array!103609 (arr!49999 (Array (_ BitVec 32) (_ BitVec 64))) (size!50550 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103608)

(assert (=> b!1552823 (= res!1062826 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50550 _keys!618))))))

(declare-fun b!1552824 () Bool)

(declare-fun e!864542 () Bool)

(declare-fun e!864539 () Bool)

(declare-fun mapRes!58918 () Bool)

(assert (=> b!1552824 (= e!864542 (and e!864539 mapRes!58918))))

(declare-fun condMapEmpty!58918 () Bool)

(declare-datatypes ((V!59301 0))(
  ( (V!59302 (val!19149 Int)) )
))
(declare-datatypes ((ValueCell!18161 0))(
  ( (ValueCellFull!18161 (v!21942 V!59301)) (EmptyCell!18161) )
))
(declare-datatypes ((array!103610 0))(
  ( (array!103611 (arr!50000 (Array (_ BitVec 32) ValueCell!18161)) (size!50551 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103610)

(declare-fun mapDefault!58918 () ValueCell!18161)

(assert (=> b!1552824 (= condMapEmpty!58918 (= (arr!50000 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18161)) mapDefault!58918)))))

(declare-fun b!1552825 () Bool)

(declare-fun e!864543 () Bool)

(assert (=> b!1552825 (= e!864541 e!864543)))

(declare-fun res!1062827 () Bool)

(assert (=> b!1552825 (=> (not res!1062827) (not e!864543))))

(assert (=> b!1552825 (= res!1062827 (bvslt from!762 (size!50550 _keys!618)))))

(declare-datatypes ((tuple2!24730 0))(
  ( (tuple2!24731 (_1!12376 (_ BitVec 64)) (_2!12376 V!59301)) )
))
(declare-datatypes ((List!36189 0))(
  ( (Nil!36186) (Cons!36185 (h!37648 tuple2!24730) (t!50887 List!36189)) )
))
(declare-datatypes ((ListLongMap!22347 0))(
  ( (ListLongMap!22348 (toList!11189 List!36189)) )
))
(declare-fun lt!669177 () ListLongMap!22347)

(declare-fun e!864538 () ListLongMap!22347)

(assert (=> b!1552825 (= lt!669177 e!864538)))

(declare-fun c!143366 () Bool)

(declare-fun lt!669178 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1552825 (= c!143366 (and (not lt!669178) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552825 (= lt!669178 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552826 () Bool)

(declare-fun e!864535 () ListLongMap!22347)

(declare-fun call!70890 () ListLongMap!22347)

(assert (=> b!1552826 (= e!864535 call!70890)))

(declare-fun b!1552827 () Bool)

(declare-fun e!864536 () ListLongMap!22347)

(declare-fun call!70892 () ListLongMap!22347)

(assert (=> b!1552827 (= e!864536 call!70892)))

(declare-fun bm!70886 () Bool)

(declare-fun call!70891 () ListLongMap!22347)

(assert (=> bm!70886 (= call!70890 call!70891)))

(declare-fun b!1552828 () Bool)

(declare-fun res!1062830 () Bool)

(assert (=> b!1552828 (=> (not res!1062830) (not e!864541))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103608 (_ BitVec 32)) Bool)

(assert (=> b!1552828 (= res!1062830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun zeroValue!436 () V!59301)

(declare-fun defaultEntry!478 () Int)

(declare-fun b!1552829 () Bool)

(declare-fun minValue!436 () V!59301)

(declare-fun contains!10144 (ListLongMap!22347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6654 (array!103608 array!103610 (_ BitVec 32) (_ BitVec 32) V!59301 V!59301 (_ BitVec 32) Int) ListLongMap!22347)

(assert (=> b!1552829 (= e!864543 (not (contains!10144 (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49999 _keys!618) from!762))))))

(declare-fun b!1552830 () Bool)

(declare-fun res!1062825 () Bool)

(assert (=> b!1552830 (=> (not res!1062825) (not e!864541))))

(declare-datatypes ((List!36190 0))(
  ( (Nil!36187) (Cons!36186 (h!37649 (_ BitVec 64)) (t!50888 List!36190)) )
))
(declare-fun arrayNoDuplicates!0 (array!103608 (_ BitVec 32) List!36190) Bool)

(assert (=> b!1552830 (= res!1062825 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36187))))

(declare-fun b!1552831 () Bool)

(declare-fun +!5021 (ListLongMap!22347 tuple2!24730) ListLongMap!22347)

(assert (=> b!1552831 (= e!864538 (+!5021 call!70891 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552832 () Bool)

(assert (=> b!1552832 (= e!864538 e!864535)))

(declare-fun c!143368 () Bool)

(assert (=> b!1552832 (= c!143368 (and (not lt!669178) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58918 () Bool)

(assert (=> mapIsEmpty!58918 mapRes!58918))

(declare-fun b!1552833 () Bool)

(declare-fun c!143367 () Bool)

(assert (=> b!1552833 (= c!143367 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669178))))

(assert (=> b!1552833 (= e!864535 e!864536)))

(declare-fun bm!70887 () Bool)

(declare-fun call!70893 () ListLongMap!22347)

(declare-fun call!70889 () ListLongMap!22347)

(assert (=> bm!70887 (= call!70893 call!70889)))

(declare-fun bm!70888 () Bool)

(assert (=> bm!70888 (= call!70889 (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58918 () Bool)

(declare-fun tp!111853 () Bool)

(declare-fun e!864540 () Bool)

(assert (=> mapNonEmpty!58918 (= mapRes!58918 (and tp!111853 e!864540))))

(declare-fun mapValue!58918 () ValueCell!18161)

(declare-fun mapRest!58918 () (Array (_ BitVec 32) ValueCell!18161))

(declare-fun mapKey!58918 () (_ BitVec 32))

(assert (=> mapNonEmpty!58918 (= (arr!50000 _values!470) (store mapRest!58918 mapKey!58918 mapValue!58918))))

(declare-fun b!1552834 () Bool)

(declare-fun tp_is_empty!38143 () Bool)

(assert (=> b!1552834 (= e!864540 tp_is_empty!38143)))

(declare-fun b!1552835 () Bool)

(assert (=> b!1552835 (= e!864539 tp_is_empty!38143)))

(declare-fun res!1062829 () Bool)

(assert (=> start!132566 (=> (not res!1062829) (not e!864541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132566 (= res!1062829 (validMask!0 mask!926))))

(assert (=> start!132566 e!864541))

(declare-fun array_inv!39135 (array!103608) Bool)

(assert (=> start!132566 (array_inv!39135 _keys!618)))

(assert (=> start!132566 tp_is_empty!38143))

(assert (=> start!132566 true))

(assert (=> start!132566 tp!111852))

(declare-fun array_inv!39136 (array!103610) Bool)

(assert (=> start!132566 (and (array_inv!39136 _values!470) e!864542)))

(declare-fun bm!70889 () Bool)

(assert (=> bm!70889 (= call!70892 call!70893)))

(declare-fun b!1552836 () Bool)

(assert (=> b!1552836 (= e!864536 call!70890)))

(declare-fun bm!70890 () Bool)

(assert (=> bm!70890 (= call!70891 (+!5021 (ite c!143366 call!70889 (ite c!143368 call!70893 call!70892)) (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552837 () Bool)

(declare-fun res!1062828 () Bool)

(assert (=> b!1552837 (=> (not res!1062828) (not e!864543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552837 (= res!1062828 (validKeyInArray!0 (select (arr!49999 _keys!618) from!762)))))

(declare-fun b!1552838 () Bool)

(declare-fun res!1062824 () Bool)

(assert (=> b!1552838 (=> (not res!1062824) (not e!864541))))

(assert (=> b!1552838 (= res!1062824 (and (= (size!50551 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50550 _keys!618) (size!50551 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132566 res!1062829) b!1552838))

(assert (= (and b!1552838 res!1062824) b!1552828))

(assert (= (and b!1552828 res!1062830) b!1552830))

(assert (= (and b!1552830 res!1062825) b!1552823))

(assert (= (and b!1552823 res!1062826) b!1552825))

(assert (= (and b!1552825 c!143366) b!1552831))

(assert (= (and b!1552825 (not c!143366)) b!1552832))

(assert (= (and b!1552832 c!143368) b!1552826))

(assert (= (and b!1552832 (not c!143368)) b!1552833))

(assert (= (and b!1552833 c!143367) b!1552836))

(assert (= (and b!1552833 (not c!143367)) b!1552827))

(assert (= (or b!1552836 b!1552827) bm!70889))

(assert (= (or b!1552826 bm!70889) bm!70887))

(assert (= (or b!1552826 b!1552836) bm!70886))

(assert (= (or b!1552831 bm!70887) bm!70888))

(assert (= (or b!1552831 bm!70886) bm!70890))

(assert (= (and b!1552825 res!1062827) b!1552837))

(assert (= (and b!1552837 res!1062828) b!1552829))

(assert (= (and b!1552824 condMapEmpty!58918) mapIsEmpty!58918))

(assert (= (and b!1552824 (not condMapEmpty!58918)) mapNonEmpty!58918))

(get-info :version)

(assert (= (and mapNonEmpty!58918 ((_ is ValueCellFull!18161) mapValue!58918)) b!1552834))

(assert (= (and b!1552824 ((_ is ValueCellFull!18161) mapDefault!58918)) b!1552835))

(assert (= start!132566 b!1552824))

(declare-fun m!1431585 () Bool)

(assert (=> b!1552829 m!1431585))

(declare-fun m!1431587 () Bool)

(assert (=> b!1552829 m!1431587))

(assert (=> b!1552829 m!1431585))

(assert (=> b!1552829 m!1431587))

(declare-fun m!1431589 () Bool)

(assert (=> b!1552829 m!1431589))

(declare-fun m!1431591 () Bool)

(assert (=> b!1552830 m!1431591))

(declare-fun m!1431593 () Bool)

(assert (=> start!132566 m!1431593))

(declare-fun m!1431595 () Bool)

(assert (=> start!132566 m!1431595))

(declare-fun m!1431597 () Bool)

(assert (=> start!132566 m!1431597))

(assert (=> bm!70888 m!1431585))

(declare-fun m!1431599 () Bool)

(assert (=> b!1552828 m!1431599))

(assert (=> b!1552837 m!1431587))

(assert (=> b!1552837 m!1431587))

(declare-fun m!1431601 () Bool)

(assert (=> b!1552837 m!1431601))

(declare-fun m!1431603 () Bool)

(assert (=> mapNonEmpty!58918 m!1431603))

(declare-fun m!1431605 () Bool)

(assert (=> b!1552831 m!1431605))

(declare-fun m!1431607 () Bool)

(assert (=> bm!70890 m!1431607))

(check-sat (not b!1552828) (not bm!70890) (not b!1552830) (not mapNonEmpty!58918) (not b!1552837) b_and!51291 (not bm!70888) (not start!132566) (not b!1552829) (not b_next!31867) tp_is_empty!38143 (not b!1552831))
(check-sat b_and!51291 (not b_next!31867))
(get-model)

(declare-fun d!161605 () Bool)

(assert (=> d!161605 (= (validKeyInArray!0 (select (arr!49999 _keys!618) from!762)) (and (not (= (select (arr!49999 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49999 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1552837 d!161605))

(declare-fun b!1552943 () Bool)

(declare-fun e!864605 () Bool)

(declare-fun e!864606 () Bool)

(assert (=> b!1552943 (= e!864605 e!864606)))

(declare-fun lt!669199 () (_ BitVec 64))

(assert (=> b!1552943 (= lt!669199 (select (arr!49999 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51562 0))(
  ( (Unit!51563) )
))
(declare-fun lt!669197 () Unit!51562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103608 (_ BitVec 64) (_ BitVec 32)) Unit!51562)

(assert (=> b!1552943 (= lt!669197 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669199 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1552943 (arrayContainsKey!0 _keys!618 lt!669199 #b00000000000000000000000000000000)))

(declare-fun lt!669198 () Unit!51562)

(assert (=> b!1552943 (= lt!669198 lt!669197)))

(declare-fun res!1062877 () Bool)

(declare-datatypes ((SeekEntryResult!13460 0))(
  ( (MissingZero!13460 (index!56238 (_ BitVec 32))) (Found!13460 (index!56239 (_ BitVec 32))) (Intermediate!13460 (undefined!14272 Bool) (index!56240 (_ BitVec 32)) (x!139070 (_ BitVec 32))) (Undefined!13460) (MissingVacant!13460 (index!56241 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103608 (_ BitVec 32)) SeekEntryResult!13460)

(assert (=> b!1552943 (= res!1062877 (= (seekEntryOrOpen!0 (select (arr!49999 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13460 #b00000000000000000000000000000000)))))

(assert (=> b!1552943 (=> (not res!1062877) (not e!864606))))

(declare-fun b!1552944 () Bool)

(declare-fun e!864604 () Bool)

(assert (=> b!1552944 (= e!864604 e!864605)))

(declare-fun c!143389 () Bool)

(assert (=> b!1552944 (= c!143389 (validKeyInArray!0 (select (arr!49999 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!161607 () Bool)

(declare-fun res!1062878 () Bool)

(assert (=> d!161607 (=> res!1062878 e!864604)))

(assert (=> d!161607 (= res!1062878 (bvsge #b00000000000000000000000000000000 (size!50550 _keys!618)))))

(assert (=> d!161607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!864604)))

(declare-fun b!1552945 () Bool)

(declare-fun call!70926 () Bool)

(assert (=> b!1552945 (= e!864606 call!70926)))

(declare-fun b!1552946 () Bool)

(assert (=> b!1552946 (= e!864605 call!70926)))

(declare-fun bm!70923 () Bool)

(assert (=> bm!70923 (= call!70926 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(assert (= (and d!161607 (not res!1062878)) b!1552944))

(assert (= (and b!1552944 c!143389) b!1552943))

(assert (= (and b!1552944 (not c!143389)) b!1552946))

(assert (= (and b!1552943 res!1062877) b!1552945))

(assert (= (or b!1552945 b!1552946) bm!70923))

(declare-fun m!1431657 () Bool)

(assert (=> b!1552943 m!1431657))

(declare-fun m!1431659 () Bool)

(assert (=> b!1552943 m!1431659))

(declare-fun m!1431661 () Bool)

(assert (=> b!1552943 m!1431661))

(assert (=> b!1552943 m!1431657))

(declare-fun m!1431663 () Bool)

(assert (=> b!1552943 m!1431663))

(assert (=> b!1552944 m!1431657))

(assert (=> b!1552944 m!1431657))

(declare-fun m!1431665 () Bool)

(assert (=> b!1552944 m!1431665))

(declare-fun m!1431667 () Bool)

(assert (=> bm!70923 m!1431667))

(assert (=> b!1552828 d!161607))

(declare-fun d!161609 () Bool)

(declare-fun e!864612 () Bool)

(assert (=> d!161609 e!864612))

(declare-fun res!1062881 () Bool)

(assert (=> d!161609 (=> res!1062881 e!864612)))

(declare-fun lt!669210 () Bool)

(assert (=> d!161609 (= res!1062881 (not lt!669210))))

(declare-fun lt!669209 () Bool)

(assert (=> d!161609 (= lt!669210 lt!669209)))

(declare-fun lt!669208 () Unit!51562)

(declare-fun e!864611 () Unit!51562)

(assert (=> d!161609 (= lt!669208 e!864611)))

(declare-fun c!143392 () Bool)

(assert (=> d!161609 (= c!143392 lt!669209)))

(declare-fun containsKey!750 (List!36189 (_ BitVec 64)) Bool)

(assert (=> d!161609 (= lt!669209 (containsKey!750 (toList!11189 (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49999 _keys!618) from!762)))))

(assert (=> d!161609 (= (contains!10144 (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49999 _keys!618) from!762)) lt!669210)))

(declare-fun b!1552953 () Bool)

(declare-fun lt!669211 () Unit!51562)

(assert (=> b!1552953 (= e!864611 lt!669211)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!496 (List!36189 (_ BitVec 64)) Unit!51562)

(assert (=> b!1552953 (= lt!669211 (lemmaContainsKeyImpliesGetValueByKeyDefined!496 (toList!11189 (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49999 _keys!618) from!762)))))

(declare-datatypes ((Option!799 0))(
  ( (Some!798 (v!21945 V!59301)) (None!797) )
))
(declare-fun isDefined!542 (Option!799) Bool)

(declare-fun getValueByKey!724 (List!36189 (_ BitVec 64)) Option!799)

(assert (=> b!1552953 (isDefined!542 (getValueByKey!724 (toList!11189 (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49999 _keys!618) from!762)))))

(declare-fun b!1552954 () Bool)

(declare-fun Unit!51564 () Unit!51562)

(assert (=> b!1552954 (= e!864611 Unit!51564)))

(declare-fun b!1552955 () Bool)

(assert (=> b!1552955 (= e!864612 (isDefined!542 (getValueByKey!724 (toList!11189 (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478)) (select (arr!49999 _keys!618) from!762))))))

(assert (= (and d!161609 c!143392) b!1552953))

(assert (= (and d!161609 (not c!143392)) b!1552954))

(assert (= (and d!161609 (not res!1062881)) b!1552955))

(assert (=> d!161609 m!1431587))

(declare-fun m!1431669 () Bool)

(assert (=> d!161609 m!1431669))

(assert (=> b!1552953 m!1431587))

(declare-fun m!1431671 () Bool)

(assert (=> b!1552953 m!1431671))

(assert (=> b!1552953 m!1431587))

(declare-fun m!1431673 () Bool)

(assert (=> b!1552953 m!1431673))

(assert (=> b!1552953 m!1431673))

(declare-fun m!1431675 () Bool)

(assert (=> b!1552953 m!1431675))

(assert (=> b!1552955 m!1431587))

(assert (=> b!1552955 m!1431673))

(assert (=> b!1552955 m!1431673))

(assert (=> b!1552955 m!1431675))

(assert (=> b!1552829 d!161609))

(declare-fun b!1552980 () Bool)

(declare-fun e!864629 () ListLongMap!22347)

(declare-fun call!70929 () ListLongMap!22347)

(assert (=> b!1552980 (= e!864629 call!70929)))

(declare-fun b!1552981 () Bool)

(declare-fun e!864632 () Bool)

(declare-fun e!864633 () Bool)

(assert (=> b!1552981 (= e!864632 e!864633)))

(declare-fun c!143402 () Bool)

(assert (=> b!1552981 (= c!143402 (bvslt from!762 (size!50550 _keys!618)))))

(declare-fun lt!669228 () ListLongMap!22347)

(declare-fun b!1552982 () Bool)

(assert (=> b!1552982 (= e!864633 (= lt!669228 (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1552983 () Bool)

(assert (=> b!1552983 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50550 _keys!618)))))

(assert (=> b!1552983 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50551 _values!470)))))

(declare-fun e!864627 () Bool)

(declare-fun apply!1096 (ListLongMap!22347 (_ BitVec 64)) V!59301)

(declare-fun get!26050 (ValueCell!18161 V!59301) V!59301)

(declare-fun dynLambda!3855 (Int (_ BitVec 64)) V!59301)

(assert (=> b!1552983 (= e!864627 (= (apply!1096 lt!669228 (select (arr!49999 _keys!618) from!762)) (get!26050 (select (arr!50000 _values!470) from!762) (dynLambda!3855 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!70926 () Bool)

(assert (=> bm!70926 (= call!70929 (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1552984 () Bool)

(declare-fun e!864630 () ListLongMap!22347)

(assert (=> b!1552984 (= e!864630 (ListLongMap!22348 Nil!36186))))

(declare-fun b!1552985 () Bool)

(declare-fun lt!669227 () Unit!51562)

(declare-fun lt!669226 () Unit!51562)

(assert (=> b!1552985 (= lt!669227 lt!669226)))

(declare-fun lt!669230 () V!59301)

(declare-fun lt!669231 () ListLongMap!22347)

(declare-fun lt!669229 () (_ BitVec 64))

(declare-fun lt!669232 () (_ BitVec 64))

(assert (=> b!1552985 (not (contains!10144 (+!5021 lt!669231 (tuple2!24731 lt!669232 lt!669230)) lt!669229))))

(declare-fun addStillNotContains!510 (ListLongMap!22347 (_ BitVec 64) V!59301 (_ BitVec 64)) Unit!51562)

(assert (=> b!1552985 (= lt!669226 (addStillNotContains!510 lt!669231 lt!669232 lt!669230 lt!669229))))

(assert (=> b!1552985 (= lt!669229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1552985 (= lt!669230 (get!26050 (select (arr!50000 _values!470) from!762) (dynLambda!3855 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1552985 (= lt!669232 (select (arr!49999 _keys!618) from!762))))

(assert (=> b!1552985 (= lt!669231 call!70929)))

(assert (=> b!1552985 (= e!864629 (+!5021 call!70929 (tuple2!24731 (select (arr!49999 _keys!618) from!762) (get!26050 (select (arr!50000 _values!470) from!762) (dynLambda!3855 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1552987 () Bool)

(assert (=> b!1552987 (= e!864632 e!864627)))

(assert (=> b!1552987 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50550 _keys!618)))))

(declare-fun res!1062892 () Bool)

(assert (=> b!1552987 (= res!1062892 (contains!10144 lt!669228 (select (arr!49999 _keys!618) from!762)))))

(assert (=> b!1552987 (=> (not res!1062892) (not e!864627))))

(declare-fun b!1552988 () Bool)

(declare-fun e!864631 () Bool)

(assert (=> b!1552988 (= e!864631 e!864632)))

(declare-fun c!143401 () Bool)

(declare-fun e!864628 () Bool)

(assert (=> b!1552988 (= c!143401 e!864628)))

(declare-fun res!1062890 () Bool)

(assert (=> b!1552988 (=> (not res!1062890) (not e!864628))))

(assert (=> b!1552988 (= res!1062890 (bvslt from!762 (size!50550 _keys!618)))))

(declare-fun b!1552989 () Bool)

(assert (=> b!1552989 (= e!864630 e!864629)))

(declare-fun c!143404 () Bool)

(assert (=> b!1552989 (= c!143404 (validKeyInArray!0 (select (arr!49999 _keys!618) from!762)))))

(declare-fun b!1552990 () Bool)

(declare-fun isEmpty!1131 (ListLongMap!22347) Bool)

(assert (=> b!1552990 (= e!864633 (isEmpty!1131 lt!669228))))

(declare-fun b!1552991 () Bool)

(declare-fun res!1062893 () Bool)

(assert (=> b!1552991 (=> (not res!1062893) (not e!864631))))

(assert (=> b!1552991 (= res!1062893 (not (contains!10144 lt!669228 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1552986 () Bool)

(assert (=> b!1552986 (= e!864628 (validKeyInArray!0 (select (arr!49999 _keys!618) from!762)))))

(assert (=> b!1552986 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun d!161611 () Bool)

(assert (=> d!161611 e!864631))

(declare-fun res!1062891 () Bool)

(assert (=> d!161611 (=> (not res!1062891) (not e!864631))))

(assert (=> d!161611 (= res!1062891 (not (contains!10144 lt!669228 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!161611 (= lt!669228 e!864630)))

(declare-fun c!143403 () Bool)

(assert (=> d!161611 (= c!143403 (bvsge from!762 (size!50550 _keys!618)))))

(assert (=> d!161611 (validMask!0 mask!926)))

(assert (=> d!161611 (= (getCurrentListMapNoExtraKeys!6654 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!669228)))

(assert (= (and d!161611 c!143403) b!1552984))

(assert (= (and d!161611 (not c!143403)) b!1552989))

(assert (= (and b!1552989 c!143404) b!1552985))

(assert (= (and b!1552989 (not c!143404)) b!1552980))

(assert (= (or b!1552985 b!1552980) bm!70926))

(assert (= (and d!161611 res!1062891) b!1552991))

(assert (= (and b!1552991 res!1062893) b!1552988))

(assert (= (and b!1552988 res!1062890) b!1552986))

(assert (= (and b!1552988 c!143401) b!1552987))

(assert (= (and b!1552988 (not c!143401)) b!1552981))

(assert (= (and b!1552987 res!1062892) b!1552983))

(assert (= (and b!1552981 c!143402) b!1552982))

(assert (= (and b!1552981 (not c!143402)) b!1552990))

(declare-fun b_lambda!24749 () Bool)

(assert (=> (not b_lambda!24749) (not b!1552983)))

(declare-fun t!50893 () Bool)

(declare-fun tb!12467 () Bool)

(assert (=> (and start!132566 (= defaultEntry!478 defaultEntry!478) t!50893) tb!12467))

(declare-fun result!26053 () Bool)

(assert (=> tb!12467 (= result!26053 tp_is_empty!38143)))

(assert (=> b!1552983 t!50893))

(declare-fun b_and!51297 () Bool)

(assert (= b_and!51291 (and (=> t!50893 result!26053) b_and!51297)))

(declare-fun b_lambda!24751 () Bool)

(assert (=> (not b_lambda!24751) (not b!1552985)))

(assert (=> b!1552985 t!50893))

(declare-fun b_and!51299 () Bool)

(assert (= b_and!51297 (and (=> t!50893 result!26053) b_and!51299)))

(declare-fun m!1431677 () Bool)

(assert (=> b!1552991 m!1431677))

(declare-fun m!1431679 () Bool)

(assert (=> b!1552982 m!1431679))

(declare-fun m!1431681 () Bool)

(assert (=> b!1552990 m!1431681))

(assert (=> bm!70926 m!1431679))

(assert (=> b!1552987 m!1431587))

(assert (=> b!1552987 m!1431587))

(declare-fun m!1431683 () Bool)

(assert (=> b!1552987 m!1431683))

(assert (=> b!1552983 m!1431587))

(assert (=> b!1552983 m!1431587))

(declare-fun m!1431685 () Bool)

(assert (=> b!1552983 m!1431685))

(declare-fun m!1431687 () Bool)

(assert (=> b!1552983 m!1431687))

(declare-fun m!1431689 () Bool)

(assert (=> b!1552983 m!1431689))

(declare-fun m!1431691 () Bool)

(assert (=> b!1552983 m!1431691))

(assert (=> b!1552983 m!1431687))

(assert (=> b!1552983 m!1431689))

(assert (=> b!1552989 m!1431587))

(assert (=> b!1552989 m!1431587))

(assert (=> b!1552989 m!1431601))

(assert (=> b!1552986 m!1431587))

(assert (=> b!1552986 m!1431587))

(assert (=> b!1552986 m!1431601))

(declare-fun m!1431693 () Bool)

(assert (=> b!1552985 m!1431693))

(assert (=> b!1552985 m!1431587))

(declare-fun m!1431695 () Bool)

(assert (=> b!1552985 m!1431695))

(assert (=> b!1552985 m!1431687))

(assert (=> b!1552985 m!1431689))

(assert (=> b!1552985 m!1431691))

(declare-fun m!1431697 () Bool)

(assert (=> b!1552985 m!1431697))

(assert (=> b!1552985 m!1431689))

(assert (=> b!1552985 m!1431695))

(declare-fun m!1431699 () Bool)

(assert (=> b!1552985 m!1431699))

(assert (=> b!1552985 m!1431687))

(declare-fun m!1431701 () Bool)

(assert (=> d!161611 m!1431701))

(assert (=> d!161611 m!1431593))

(assert (=> b!1552829 d!161611))

(declare-fun d!161613 () Bool)

(declare-fun res!1062901 () Bool)

(declare-fun e!864643 () Bool)

(assert (=> d!161613 (=> res!1062901 e!864643)))

(assert (=> d!161613 (= res!1062901 (bvsge #b00000000000000000000000000000000 (size!50550 _keys!618)))))

(assert (=> d!161613 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36187) e!864643)))

(declare-fun bm!70929 () Bool)

(declare-fun call!70932 () Bool)

(declare-fun c!143407 () Bool)

(assert (=> bm!70929 (= call!70932 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!143407 (Cons!36186 (select (arr!49999 _keys!618) #b00000000000000000000000000000000) Nil!36187) Nil!36187)))))

(declare-fun b!1553004 () Bool)

(declare-fun e!864645 () Bool)

(assert (=> b!1553004 (= e!864645 call!70932)))

(declare-fun b!1553005 () Bool)

(declare-fun e!864644 () Bool)

(assert (=> b!1553005 (= e!864643 e!864644)))

(declare-fun res!1062902 () Bool)

(assert (=> b!1553005 (=> (not res!1062902) (not e!864644))))

(declare-fun e!864642 () Bool)

(assert (=> b!1553005 (= res!1062902 (not e!864642))))

(declare-fun res!1062900 () Bool)

(assert (=> b!1553005 (=> (not res!1062900) (not e!864642))))

(assert (=> b!1553005 (= res!1062900 (validKeyInArray!0 (select (arr!49999 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1553006 () Bool)

(declare-fun contains!10147 (List!36190 (_ BitVec 64)) Bool)

(assert (=> b!1553006 (= e!864642 (contains!10147 Nil!36187 (select (arr!49999 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1553007 () Bool)

(assert (=> b!1553007 (= e!864645 call!70932)))

(declare-fun b!1553008 () Bool)

(assert (=> b!1553008 (= e!864644 e!864645)))

(assert (=> b!1553008 (= c!143407 (validKeyInArray!0 (select (arr!49999 _keys!618) #b00000000000000000000000000000000)))))

(assert (= (and d!161613 (not res!1062901)) b!1553005))

(assert (= (and b!1553005 res!1062900) b!1553006))

(assert (= (and b!1553005 res!1062902) b!1553008))

(assert (= (and b!1553008 c!143407) b!1553007))

(assert (= (and b!1553008 (not c!143407)) b!1553004))

(assert (= (or b!1553007 b!1553004) bm!70929))

(assert (=> bm!70929 m!1431657))

(declare-fun m!1431703 () Bool)

(assert (=> bm!70929 m!1431703))

(assert (=> b!1553005 m!1431657))

(assert (=> b!1553005 m!1431657))

(assert (=> b!1553005 m!1431665))

(assert (=> b!1553006 m!1431657))

(assert (=> b!1553006 m!1431657))

(declare-fun m!1431705 () Bool)

(assert (=> b!1553006 m!1431705))

(assert (=> b!1553008 m!1431657))

(assert (=> b!1553008 m!1431657))

(assert (=> b!1553008 m!1431665))

(assert (=> b!1552830 d!161613))

(assert (=> bm!70888 d!161611))

(declare-fun d!161615 () Bool)

(assert (=> d!161615 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132566 d!161615))

(declare-fun d!161617 () Bool)

(assert (=> d!161617 (= (array_inv!39135 _keys!618) (bvsge (size!50550 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132566 d!161617))

(declare-fun d!161619 () Bool)

(assert (=> d!161619 (= (array_inv!39136 _values!470) (bvsge (size!50551 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132566 d!161619))

(declare-fun d!161621 () Bool)

(declare-fun e!864648 () Bool)

(assert (=> d!161621 e!864648))

(declare-fun res!1062907 () Bool)

(assert (=> d!161621 (=> (not res!1062907) (not e!864648))))

(declare-fun lt!669243 () ListLongMap!22347)

(assert (=> d!161621 (= res!1062907 (contains!10144 lt!669243 (_1!12376 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669244 () List!36189)

(assert (=> d!161621 (= lt!669243 (ListLongMap!22348 lt!669244))))

(declare-fun lt!669241 () Unit!51562)

(declare-fun lt!669242 () Unit!51562)

(assert (=> d!161621 (= lt!669241 lt!669242)))

(assert (=> d!161621 (= (getValueByKey!724 lt!669244 (_1!12376 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!798 (_2!12376 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!371 (List!36189 (_ BitVec 64) V!59301) Unit!51562)

(assert (=> d!161621 (= lt!669242 (lemmaContainsTupThenGetReturnValue!371 lt!669244 (_1!12376 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12376 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun insertStrictlySorted!500 (List!36189 (_ BitVec 64) V!59301) List!36189)

(assert (=> d!161621 (= lt!669244 (insertStrictlySorted!500 (toList!11189 call!70891) (_1!12376 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12376 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161621 (= (+!5021 call!70891 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669243)))

(declare-fun b!1553013 () Bool)

(declare-fun res!1062908 () Bool)

(assert (=> b!1553013 (=> (not res!1062908) (not e!864648))))

(assert (=> b!1553013 (= res!1062908 (= (getValueByKey!724 (toList!11189 lt!669243) (_1!12376 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!798 (_2!12376 (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553014 () Bool)

(declare-fun contains!10148 (List!36189 tuple2!24730) Bool)

(assert (=> b!1553014 (= e!864648 (contains!10148 (toList!11189 lt!669243) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161621 res!1062907) b!1553013))

(assert (= (and b!1553013 res!1062908) b!1553014))

(declare-fun m!1431707 () Bool)

(assert (=> d!161621 m!1431707))

(declare-fun m!1431709 () Bool)

(assert (=> d!161621 m!1431709))

(declare-fun m!1431711 () Bool)

(assert (=> d!161621 m!1431711))

(declare-fun m!1431713 () Bool)

(assert (=> d!161621 m!1431713))

(declare-fun m!1431715 () Bool)

(assert (=> b!1553013 m!1431715))

(declare-fun m!1431717 () Bool)

(assert (=> b!1553014 m!1431717))

(assert (=> b!1552831 d!161621))

(declare-fun d!161623 () Bool)

(declare-fun e!864649 () Bool)

(assert (=> d!161623 e!864649))

(declare-fun res!1062909 () Bool)

(assert (=> d!161623 (=> (not res!1062909) (not e!864649))))

(declare-fun lt!669247 () ListLongMap!22347)

(assert (=> d!161623 (= res!1062909 (contains!10144 lt!669247 (_1!12376 (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669248 () List!36189)

(assert (=> d!161623 (= lt!669247 (ListLongMap!22348 lt!669248))))

(declare-fun lt!669245 () Unit!51562)

(declare-fun lt!669246 () Unit!51562)

(assert (=> d!161623 (= lt!669245 lt!669246)))

(assert (=> d!161623 (= (getValueByKey!724 lt!669248 (_1!12376 (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!798 (_2!12376 (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161623 (= lt!669246 (lemmaContainsTupThenGetReturnValue!371 lt!669248 (_1!12376 (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12376 (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161623 (= lt!669248 (insertStrictlySorted!500 (toList!11189 (ite c!143366 call!70889 (ite c!143368 call!70893 call!70892))) (_1!12376 (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12376 (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161623 (= (+!5021 (ite c!143366 call!70889 (ite c!143368 call!70893 call!70892)) (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669247)))

(declare-fun b!1553015 () Bool)

(declare-fun res!1062910 () Bool)

(assert (=> b!1553015 (=> (not res!1062910) (not e!864649))))

(assert (=> b!1553015 (= res!1062910 (= (getValueByKey!724 (toList!11189 lt!669247) (_1!12376 (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!798 (_2!12376 (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553016 () Bool)

(assert (=> b!1553016 (= e!864649 (contains!10148 (toList!11189 lt!669247) (ite (or c!143366 c!143368) (tuple2!24731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161623 res!1062909) b!1553015))

(assert (= (and b!1553015 res!1062910) b!1553016))

(declare-fun m!1431719 () Bool)

(assert (=> d!161623 m!1431719))

(declare-fun m!1431721 () Bool)

(assert (=> d!161623 m!1431721))

(declare-fun m!1431723 () Bool)

(assert (=> d!161623 m!1431723))

(declare-fun m!1431725 () Bool)

(assert (=> d!161623 m!1431725))

(declare-fun m!1431727 () Bool)

(assert (=> b!1553015 m!1431727))

(declare-fun m!1431729 () Bool)

(assert (=> b!1553016 m!1431729))

(assert (=> bm!70890 d!161623))

(declare-fun mapIsEmpty!58927 () Bool)

(declare-fun mapRes!58927 () Bool)

(assert (=> mapIsEmpty!58927 mapRes!58927))

(declare-fun b!1553024 () Bool)

(declare-fun e!864654 () Bool)

(assert (=> b!1553024 (= e!864654 tp_is_empty!38143)))

(declare-fun condMapEmpty!58927 () Bool)

(declare-fun mapDefault!58927 () ValueCell!18161)

(assert (=> mapNonEmpty!58918 (= condMapEmpty!58927 (= mapRest!58918 ((as const (Array (_ BitVec 32) ValueCell!18161)) mapDefault!58927)))))

(assert (=> mapNonEmpty!58918 (= tp!111853 (and e!864654 mapRes!58927))))

(declare-fun b!1553023 () Bool)

(declare-fun e!864655 () Bool)

(assert (=> b!1553023 (= e!864655 tp_is_empty!38143)))

(declare-fun mapNonEmpty!58927 () Bool)

(declare-fun tp!111868 () Bool)

(assert (=> mapNonEmpty!58927 (= mapRes!58927 (and tp!111868 e!864655))))

(declare-fun mapKey!58927 () (_ BitVec 32))

(declare-fun mapRest!58927 () (Array (_ BitVec 32) ValueCell!18161))

(declare-fun mapValue!58927 () ValueCell!18161)

(assert (=> mapNonEmpty!58927 (= mapRest!58918 (store mapRest!58927 mapKey!58927 mapValue!58927))))

(assert (= (and mapNonEmpty!58918 condMapEmpty!58927) mapIsEmpty!58927))

(assert (= (and mapNonEmpty!58918 (not condMapEmpty!58927)) mapNonEmpty!58927))

(assert (= (and mapNonEmpty!58927 ((_ is ValueCellFull!18161) mapValue!58927)) b!1553023))

(assert (= (and mapNonEmpty!58918 ((_ is ValueCellFull!18161) mapDefault!58927)) b!1553024))

(declare-fun m!1431731 () Bool)

(assert (=> mapNonEmpty!58927 m!1431731))

(declare-fun b_lambda!24753 () Bool)

(assert (= b_lambda!24749 (or (and start!132566 b_free!31867) b_lambda!24753)))

(declare-fun b_lambda!24755 () Bool)

(assert (= b_lambda!24751 (or (and start!132566 b_free!31867) b_lambda!24755)))

(check-sat (not b!1553013) (not b!1552985) (not b!1552955) (not b!1552990) (not d!161611) (not b!1553015) (not b!1552944) (not b!1552982) (not b!1553014) (not bm!70923) (not b!1552953) (not mapNonEmpty!58927) (not b_next!31867) (not b!1552983) (not b!1553016) (not b!1553008) (not b!1553005) (not b!1552991) b_and!51299 (not b!1553006) (not bm!70926) (not b!1552987) (not b!1552989) (not b_lambda!24755) (not b!1552943) (not d!161621) (not d!161609) tp_is_empty!38143 (not bm!70929) (not b!1552986) (not d!161623) (not b_lambda!24753))
(check-sat b_and!51299 (not b_next!31867))
