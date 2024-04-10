; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132136 () Bool)

(assert start!132136)

(declare-fun b_free!31849 () Bool)

(declare-fun b_next!31849 () Bool)

(assert (=> start!132136 (= b_free!31849 (not b_next!31849))))

(declare-fun tp!111799 () Bool)

(declare-fun b_and!51265 () Bool)

(assert (=> start!132136 (= tp!111799 b_and!51265)))

(declare-datatypes ((array!103446 0))(
  ( (array!103447 (arr!49925 (Array (_ BitVec 32) (_ BitVec 64))) (size!50475 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103446)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((V!59277 0))(
  ( (V!59278 (val!19140 Int)) )
))
(declare-datatypes ((ValueCell!18152 0))(
  ( (ValueCellFull!18152 (v!21941 V!59277)) (EmptyCell!18152) )
))
(declare-datatypes ((array!103448 0))(
  ( (array!103449 (arr!49926 (Array (_ BitVec 32) ValueCell!18152)) (size!50476 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103448)

(declare-datatypes ((tuple2!24658 0))(
  ( (tuple2!24659 (_1!12340 (_ BitVec 64)) (_2!12340 V!59277)) )
))
(declare-datatypes ((List!36142 0))(
  ( (Nil!36139) (Cons!36138 (h!37583 tuple2!24658) (t!50844 List!36142)) )
))
(declare-datatypes ((ListLongMap!22267 0))(
  ( (ListLongMap!22268 (toList!11149 List!36142)) )
))
(declare-fun lt!668140 () ListLongMap!22267)

(declare-fun e!862751 () Bool)

(declare-fun b!1549904 () Bool)

(declare-fun apply!1088 (ListLongMap!22267 (_ BitVec 64)) V!59277)

(declare-fun get!25999 (ValueCell!18152 V!59277) V!59277)

(declare-fun dynLambda!3798 (Int (_ BitVec 64)) V!59277)

(assert (=> b!1549904 (= e!862751 (= (apply!1088 lt!668140 (select (arr!49925 _keys!618) from!762)) (get!25999 (select (arr!49926 _values!470) from!762) (dynLambda!3798 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!70594 () Bool)

(declare-fun call!70602 () Bool)

(declare-fun contains!10095 (ListLongMap!22267 (_ BitVec 64)) Bool)

(assert (=> bm!70594 (= call!70602 (contains!10095 lt!668140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1549905 () Bool)

(declare-fun e!862762 () ListLongMap!22267)

(declare-fun call!70600 () ListLongMap!22267)

(assert (=> b!1549905 (= e!862762 call!70600)))

(declare-fun mapIsEmpty!58891 () Bool)

(declare-fun mapRes!58891 () Bool)

(assert (=> mapIsEmpty!58891 mapRes!58891))

(declare-fun bm!70595 () Bool)

(declare-fun call!70599 () ListLongMap!22267)

(declare-fun call!70601 () ListLongMap!22267)

(assert (=> bm!70595 (= call!70599 call!70601)))

(declare-fun b!1549906 () Bool)

(declare-fun e!862764 () Bool)

(declare-fun e!862755 () Bool)

(assert (=> b!1549906 (= e!862764 e!862755)))

(declare-fun res!1061762 () Bool)

(assert (=> b!1549906 (= res!1061762 call!70602)))

(assert (=> b!1549906 (=> (not res!1061762) (not e!862755))))

(declare-fun b!1549907 () Bool)

(declare-fun e!862763 () Bool)

(declare-fun e!862753 () Bool)

(assert (=> b!1549907 (= e!862763 e!862753)))

(declare-fun res!1061765 () Bool)

(assert (=> b!1549907 (=> (not res!1061765) (not e!862753))))

(declare-fun e!862756 () Bool)

(assert (=> b!1549907 (= res!1061765 e!862756)))

(declare-fun res!1061767 () Bool)

(assert (=> b!1549907 (=> res!1061767 e!862756)))

(declare-fun lt!668139 () Bool)

(assert (=> b!1549907 (= res!1061767 lt!668139)))

(declare-datatypes ((Unit!51634 0))(
  ( (Unit!51635) )
))
(declare-fun lt!668137 () Unit!51634)

(declare-fun e!862759 () Unit!51634)

(assert (=> b!1549907 (= lt!668137 e!862759)))

(declare-fun c!142475 () Bool)

(assert (=> b!1549907 (= c!142475 (not lt!668139))))

(declare-fun e!862750 () Bool)

(assert (=> b!1549907 (= lt!668139 e!862750)))

(declare-fun res!1061766 () Bool)

(assert (=> b!1549907 (=> res!1061766 e!862750)))

(assert (=> b!1549907 (= res!1061766 (bvsge from!762 (size!50475 _keys!618)))))

(declare-fun e!862761 () ListLongMap!22267)

(assert (=> b!1549907 (= lt!668140 e!862761)))

(declare-fun c!142473 () Bool)

(declare-fun lt!668138 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1549907 (= c!142473 (and (not lt!668138) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549907 (= lt!668138 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!58891 () Bool)

(declare-fun tp!111798 () Bool)

(declare-fun e!862752 () Bool)

(assert (=> mapNonEmpty!58891 (= mapRes!58891 (and tp!111798 e!862752))))

(declare-fun mapKey!58891 () (_ BitVec 32))

(declare-fun mapValue!58891 () ValueCell!18152)

(declare-fun mapRest!58891 () (Array (_ BitVec 32) ValueCell!18152))

(assert (=> mapNonEmpty!58891 (= (arr!49926 _values!470) (store mapRest!58891 mapKey!58891 mapValue!58891))))

(declare-fun res!1061769 () Bool)

(assert (=> start!132136 (=> (not res!1061769) (not e!862763))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132136 (= res!1061769 (validMask!0 mask!926))))

(assert (=> start!132136 e!862763))

(declare-fun array_inv!38815 (array!103446) Bool)

(assert (=> start!132136 (array_inv!38815 _keys!618)))

(declare-fun tp_is_empty!38125 () Bool)

(assert (=> start!132136 tp_is_empty!38125))

(assert (=> start!132136 true))

(assert (=> start!132136 tp!111799))

(declare-fun e!862760 () Bool)

(declare-fun array_inv!38816 (array!103448) Bool)

(assert (=> start!132136 (and (array_inv!38816 _values!470) e!862760)))

(declare-fun b!1549908 () Bool)

(declare-fun e!862754 () Bool)

(assert (=> b!1549908 (= e!862754 tp_is_empty!38125)))

(declare-fun b!1549909 () Bool)

(declare-fun zeroValue!436 () V!59277)

(assert (=> b!1549909 (= e!862755 (= (apply!1088 lt!668140 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!436))))

(declare-fun b!1549910 () Bool)

(declare-fun res!1061763 () Bool)

(assert (=> b!1549910 (=> (not res!1061763) (not e!862753))))

(assert (=> b!1549910 (= res!1061763 (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549911 () Bool)

(declare-fun res!1061768 () Bool)

(assert (=> b!1549911 (=> (not res!1061768) (not e!862753))))

(assert (=> b!1549911 (= res!1061768 e!862764)))

(declare-fun c!142474 () Bool)

(assert (=> b!1549911 (= c!142474 (not lt!668138))))

(declare-fun b!1549912 () Bool)

(declare-fun c!142471 () Bool)

(assert (=> b!1549912 (= c!142471 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668138))))

(declare-fun e!862757 () ListLongMap!22267)

(assert (=> b!1549912 (= e!862762 e!862757)))

(declare-fun b!1549913 () Bool)

(declare-fun res!1061761 () Bool)

(assert (=> b!1549913 (=> (not res!1061761) (not e!862763))))

(assert (=> b!1549913 (= res!1061761 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50475 _keys!618))))))

(declare-fun minValue!436 () V!59277)

(declare-fun bm!70596 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6599 (array!103446 array!103448 (_ BitVec 32) (_ BitVec 32) V!59277 V!59277 (_ BitVec 32) Int) ListLongMap!22267)

(assert (=> bm!70596 (= call!70601 (getCurrentListMapNoExtraKeys!6599 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70597 () Bool)

(declare-fun call!70597 () ListLongMap!22267)

(assert (=> bm!70597 (= call!70597 call!70599)))

(declare-fun b!1549914 () Bool)

(assert (=> b!1549914 (= e!862756 e!862751)))

(declare-fun res!1061759 () Bool)

(assert (=> b!1549914 (=> (not res!1061759) (not e!862751))))

(assert (=> b!1549914 (= res!1061759 (contains!10095 lt!668140 (select (arr!49925 _keys!618) from!762)))))

(declare-fun b!1549915 () Bool)

(assert (=> b!1549915 (= e!862753 false)))

(declare-fun lt!668136 () Bool)

(assert (=> b!1549915 (= lt!668136 (contains!10095 lt!668140 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1549916 () Bool)

(declare-fun Unit!51636 () Unit!51634)

(assert (=> b!1549916 (= e!862759 Unit!51636)))

(declare-fun b!1549917 () Bool)

(declare-fun res!1061760 () Bool)

(assert (=> b!1549917 (=> (not res!1061760) (not e!862763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103446 (_ BitVec 32)) Bool)

(assert (=> b!1549917 (= res!1061760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549918 () Bool)

(declare-fun call!70598 () ListLongMap!22267)

(declare-fun +!4974 (ListLongMap!22267 tuple2!24658) ListLongMap!22267)

(assert (=> b!1549918 (= e!862761 (+!4974 call!70598 (tuple2!24659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549919 () Bool)

(assert (=> b!1549919 (= e!862757 call!70597)))

(declare-fun b!1549920 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549920 (= e!862750 (not (validKeyInArray!0 (select (arr!49925 _keys!618) from!762))))))

(declare-fun b!1549921 () Bool)

(declare-fun res!1061758 () Bool)

(assert (=> b!1549921 (=> (not res!1061758) (not e!862763))))

(assert (=> b!1549921 (= res!1061758 (and (= (size!50476 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50475 _keys!618) (size!50476 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun c!142472 () Bool)

(declare-fun bm!70598 () Bool)

(assert (=> bm!70598 (= call!70598 (+!4974 (ite c!142473 call!70601 (ite c!142472 call!70599 call!70597)) (ite (or c!142473 c!142472) (tuple2!24659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549922 () Bool)

(assert (=> b!1549922 (= e!862761 e!862762)))

(assert (=> b!1549922 (= c!142472 (and (not lt!668138) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70599 () Bool)

(assert (=> bm!70599 (= call!70600 call!70598)))

(declare-fun b!1549923 () Bool)

(declare-fun res!1061764 () Bool)

(assert (=> b!1549923 (=> (not res!1061764) (not e!862763))))

(declare-datatypes ((List!36143 0))(
  ( (Nil!36140) (Cons!36139 (h!37584 (_ BitVec 64)) (t!50845 List!36143)) )
))
(declare-fun arrayNoDuplicates!0 (array!103446 (_ BitVec 32) List!36143) Bool)

(assert (=> b!1549923 (= res!1061764 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36140))))

(declare-fun b!1549924 () Bool)

(assert (=> b!1549924 (= e!862757 call!70600)))

(declare-fun b!1549925 () Bool)

(declare-fun lt!668145 () Unit!51634)

(assert (=> b!1549925 (= e!862759 lt!668145)))

(declare-fun lt!668144 () ListLongMap!22267)

(assert (=> b!1549925 (= lt!668144 (getCurrentListMapNoExtraKeys!6599 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668142 () Unit!51634)

(declare-fun addStillContains!1282 (ListLongMap!22267 (_ BitVec 64) V!59277 (_ BitVec 64)) Unit!51634)

(assert (=> b!1549925 (= lt!668142 (addStillContains!1282 lt!668144 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49925 _keys!618) from!762)))))

(declare-fun lt!668146 () ListLongMap!22267)

(assert (=> b!1549925 (= lt!668146 (+!4974 lt!668144 (tuple2!24659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1549925 (contains!10095 lt!668146 (select (arr!49925 _keys!618) from!762))))

(declare-fun addApplyDifferent!629 (ListLongMap!22267 (_ BitVec 64) V!59277 (_ BitVec 64)) Unit!51634)

(assert (=> b!1549925 (= lt!668145 (addApplyDifferent!629 lt!668144 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49925 _keys!618) from!762)))))

(declare-fun lt!668143 () V!59277)

(assert (=> b!1549925 (= lt!668143 (apply!1088 (+!4974 lt!668144 (tuple2!24659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49925 _keys!618) from!762)))))

(declare-fun lt!668141 () V!59277)

(assert (=> b!1549925 (= lt!668141 (apply!1088 lt!668144 (select (arr!49925 _keys!618) from!762)))))

(assert (=> b!1549925 (= lt!668143 lt!668141)))

(declare-fun lt!668147 () Unit!51634)

(assert (=> b!1549925 (= lt!668147 (addApplyDifferent!629 lt!668144 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49925 _keys!618) from!762)))))

(assert (=> b!1549925 (= (apply!1088 lt!668146 (select (arr!49925 _keys!618) from!762)) lt!668141)))

(declare-fun b!1549926 () Bool)

(assert (=> b!1549926 (= e!862764 (not call!70602))))

(declare-fun b!1549927 () Bool)

(assert (=> b!1549927 (= e!862752 tp_is_empty!38125)))

(declare-fun b!1549928 () Bool)

(assert (=> b!1549928 (= e!862760 (and e!862754 mapRes!58891))))

(declare-fun condMapEmpty!58891 () Bool)

(declare-fun mapDefault!58891 () ValueCell!18152)

