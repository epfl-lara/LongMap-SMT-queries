; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40716 () Bool)

(assert start!40716)

(declare-fun b_free!10741 () Bool)

(declare-fun b_next!10741 () Bool)

(assert (=> start!40716 (= b_free!10741 (not b_next!10741))))

(declare-fun tp!38043 () Bool)

(declare-fun b_and!18763 () Bool)

(assert (=> start!40716 (= tp!38043 b_and!18763)))

(declare-fun b!451026 () Bool)

(declare-fun e!264229 () Bool)

(declare-fun tp_is_empty!12079 () Bool)

(assert (=> b!451026 (= e!264229 tp_is_empty!12079)))

(declare-fun b!451027 () Bool)

(declare-fun res!268558 () Bool)

(declare-fun e!264223 () Bool)

(assert (=> b!451027 (=> (not res!268558) (not e!264223))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451027 (= res!268558 (bvsle from!863 i!563))))

(declare-fun b!451028 () Bool)

(declare-fun res!268567 () Bool)

(declare-fun e!264230 () Bool)

(assert (=> b!451028 (=> (not res!268567) (not e!264230))))

(declare-datatypes ((array!27956 0))(
  ( (array!27957 (arr!13423 (Array (_ BitVec 32) (_ BitVec 64))) (size!13775 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27956)

(assert (=> b!451028 (= res!268567 (or (= (select (arr!13423 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13423 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451029 () Bool)

(declare-fun e!264227 () Bool)

(assert (=> b!451029 (= e!264223 e!264227)))

(declare-fun res!268560 () Bool)

(assert (=> b!451029 (=> (not res!268560) (not e!264227))))

(assert (=> b!451029 (= res!268560 (= from!863 i!563))))

(declare-datatypes ((V!17211 0))(
  ( (V!17212 (val!6084 Int)) )
))
(declare-fun minValue!515 () V!17211)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5696 0))(
  ( (ValueCellFull!5696 (v!8340 V!17211)) (EmptyCell!5696) )
))
(declare-datatypes ((array!27958 0))(
  ( (array!27959 (arr!13424 (Array (_ BitVec 32) ValueCell!5696)) (size!13776 (_ BitVec 32))) )
))
(declare-fun lt!204813 () array!27958)

(declare-fun zeroValue!515 () V!17211)

(declare-fun lt!204816 () array!27956)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7902 0))(
  ( (tuple2!7903 (_1!3962 (_ BitVec 64)) (_2!3962 V!17211)) )
))
(declare-datatypes ((List!7973 0))(
  ( (Nil!7970) (Cons!7969 (h!8825 tuple2!7902) (t!13729 List!7973)) )
))
(declare-datatypes ((ListLongMap!6817 0))(
  ( (ListLongMap!6818 (toList!3424 List!7973)) )
))
(declare-fun lt!204815 () ListLongMap!6817)

(declare-fun getCurrentListMapNoExtraKeys!1653 (array!27956 array!27958 (_ BitVec 32) (_ BitVec 32) V!17211 V!17211 (_ BitVec 32) Int) ListLongMap!6817)

(assert (=> b!451029 (= lt!204815 (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27958)

(declare-fun v!412 () V!17211)

(assert (=> b!451029 (= lt!204813 (array!27959 (store (arr!13424 _values!549) i!563 (ValueCellFull!5696 v!412)) (size!13776 _values!549)))))

(declare-fun lt!204817 () ListLongMap!6817)

(assert (=> b!451029 (= lt!204817 (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451030 () Bool)

(declare-fun res!268569 () Bool)

(assert (=> b!451030 (=> (not res!268569) (not e!264230))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451030 (= res!268569 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451031 () Bool)

(declare-fun res!268561 () Bool)

(assert (=> b!451031 (=> (not res!268561) (not e!264230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451031 (= res!268561 (validMask!0 mask!1025))))

(declare-fun b!451032 () Bool)

(declare-fun res!268565 () Bool)

(assert (=> b!451032 (=> (not res!268565) (not e!264230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451032 (= res!268565 (validKeyInArray!0 k0!794))))

(declare-fun b!451033 () Bool)

(assert (=> b!451033 (= e!264230 e!264223)))

(declare-fun res!268566 () Bool)

(assert (=> b!451033 (=> (not res!268566) (not e!264223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27956 (_ BitVec 32)) Bool)

(assert (=> b!451033 (= res!268566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204816 mask!1025))))

(assert (=> b!451033 (= lt!204816 (array!27957 (store (arr!13423 _keys!709) i!563 k0!794) (size!13775 _keys!709)))))

(declare-fun call!29803 () ListLongMap!6817)

(declare-fun call!29802 () ListLongMap!6817)

(declare-fun e!264226 () Bool)

(declare-fun b!451034 () Bool)

(declare-fun +!1552 (ListLongMap!6817 tuple2!7902) ListLongMap!6817)

(assert (=> b!451034 (= e!264226 (= call!29803 (+!1552 call!29802 (tuple2!7903 k0!794 v!412))))))

(declare-fun b!451035 () Bool)

(declare-fun res!268556 () Bool)

(assert (=> b!451035 (=> (not res!268556) (not e!264230))))

(assert (=> b!451035 (= res!268556 (and (= (size!13776 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13775 _keys!709) (size!13776 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451036 () Bool)

(declare-fun e!264231 () Bool)

(declare-fun mapRes!19752 () Bool)

(assert (=> b!451036 (= e!264231 (and e!264229 mapRes!19752))))

(declare-fun condMapEmpty!19752 () Bool)

(declare-fun mapDefault!19752 () ValueCell!5696)

(assert (=> b!451036 (= condMapEmpty!19752 (= (arr!13424 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5696)) mapDefault!19752)))))

(declare-fun b!451037 () Bool)

(declare-fun res!268557 () Bool)

(assert (=> b!451037 (=> (not res!268557) (not e!264223))))

(declare-datatypes ((List!7974 0))(
  ( (Nil!7971) (Cons!7970 (h!8826 (_ BitVec 64)) (t!13730 List!7974)) )
))
(declare-fun arrayNoDuplicates!0 (array!27956 (_ BitVec 32) List!7974) Bool)

(assert (=> b!451037 (= res!268557 (arrayNoDuplicates!0 lt!204816 #b00000000000000000000000000000000 Nil!7971))))

(declare-fun mapNonEmpty!19752 () Bool)

(declare-fun tp!38042 () Bool)

(declare-fun e!264228 () Bool)

(assert (=> mapNonEmpty!19752 (= mapRes!19752 (and tp!38042 e!264228))))

(declare-fun mapRest!19752 () (Array (_ BitVec 32) ValueCell!5696))

(declare-fun mapKey!19752 () (_ BitVec 32))

(declare-fun mapValue!19752 () ValueCell!5696)

(assert (=> mapNonEmpty!19752 (= (arr!13424 _values!549) (store mapRest!19752 mapKey!19752 mapValue!19752))))

(declare-fun bm!29799 () Bool)

(assert (=> bm!29799 (= call!29802 (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451038 () Bool)

(assert (=> b!451038 (= e!264228 tp_is_empty!12079)))

(declare-fun res!268568 () Bool)

(assert (=> start!40716 (=> (not res!268568) (not e!264230))))

(assert (=> start!40716 (= res!268568 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13775 _keys!709))))))

(assert (=> start!40716 e!264230))

(assert (=> start!40716 tp_is_empty!12079))

(assert (=> start!40716 tp!38043))

(assert (=> start!40716 true))

(declare-fun array_inv!9802 (array!27958) Bool)

(assert (=> start!40716 (and (array_inv!9802 _values!549) e!264231)))

(declare-fun array_inv!9803 (array!27956) Bool)

(assert (=> start!40716 (array_inv!9803 _keys!709)))

(declare-fun b!451039 () Bool)

(declare-fun res!268563 () Bool)

(assert (=> b!451039 (=> (not res!268563) (not e!264230))))

(assert (=> b!451039 (= res!268563 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13775 _keys!709))))))

(declare-fun b!451040 () Bool)

(declare-fun res!268562 () Bool)

(assert (=> b!451040 (=> (not res!268562) (not e!264230))))

(assert (=> b!451040 (= res!268562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451041 () Bool)

(declare-fun res!268564 () Bool)

(assert (=> b!451041 (=> (not res!268564) (not e!264230))))

(assert (=> b!451041 (= res!268564 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7971))))

(declare-fun b!451042 () Bool)

(declare-fun e!264224 () Bool)

(assert (=> b!451042 (= e!264227 (not e!264224))))

(declare-fun res!268559 () Bool)

(assert (=> b!451042 (=> res!268559 e!264224)))

(assert (=> b!451042 (= res!268559 (validKeyInArray!0 (select (arr!13423 _keys!709) from!863)))))

(assert (=> b!451042 e!264226))

(declare-fun c!55995 () Bool)

(assert (=> b!451042 (= c!55995 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13185 0))(
  ( (Unit!13186) )
))
(declare-fun lt!204814 () Unit!13185)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!713 (array!27956 array!27958 (_ BitVec 32) (_ BitVec 32) V!17211 V!17211 (_ BitVec 32) (_ BitVec 64) V!17211 (_ BitVec 32) Int) Unit!13185)

(assert (=> b!451042 (= lt!204814 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!713 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29800 () Bool)

(assert (=> bm!29800 (= call!29803 (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19752 () Bool)

(assert (=> mapIsEmpty!19752 mapRes!19752))

(declare-fun b!451043 () Bool)

(declare-fun get!6618 (ValueCell!5696 V!17211) V!17211)

(declare-fun dynLambda!855 (Int (_ BitVec 64)) V!17211)

(assert (=> b!451043 (= e!264224 (= lt!204815 (+!1552 (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!451044 () Bool)

(assert (=> b!451044 (= e!264226 (= call!29803 call!29802))))

(assert (= (and start!40716 res!268568) b!451031))

(assert (= (and b!451031 res!268561) b!451035))

(assert (= (and b!451035 res!268556) b!451040))

(assert (= (and b!451040 res!268562) b!451041))

(assert (= (and b!451041 res!268564) b!451039))

(assert (= (and b!451039 res!268563) b!451032))

(assert (= (and b!451032 res!268565) b!451028))

(assert (= (and b!451028 res!268567) b!451030))

(assert (= (and b!451030 res!268569) b!451033))

(assert (= (and b!451033 res!268566) b!451037))

(assert (= (and b!451037 res!268557) b!451027))

(assert (= (and b!451027 res!268558) b!451029))

(assert (= (and b!451029 res!268560) b!451042))

(assert (= (and b!451042 c!55995) b!451034))

(assert (= (and b!451042 (not c!55995)) b!451044))

(assert (= (or b!451034 b!451044) bm!29799))

(assert (= (or b!451034 b!451044) bm!29800))

(assert (= (and b!451042 (not res!268559)) b!451043))

(assert (= (and b!451036 condMapEmpty!19752) mapIsEmpty!19752))

(assert (= (and b!451036 (not condMapEmpty!19752)) mapNonEmpty!19752))

(get-info :version)

(assert (= (and mapNonEmpty!19752 ((_ is ValueCellFull!5696) mapValue!19752)) b!451038))

(assert (= (and b!451036 ((_ is ValueCellFull!5696) mapDefault!19752)) b!451026))

(assert (= start!40716 b!451036))

(declare-fun b_lambda!9499 () Bool)

(assert (=> (not b_lambda!9499) (not b!451043)))

(declare-fun t!13728 () Bool)

(declare-fun tb!3713 () Bool)

(assert (=> (and start!40716 (= defaultEntry!557 defaultEntry!557) t!13728) tb!3713))

(declare-fun result!6969 () Bool)

(assert (=> tb!3713 (= result!6969 tp_is_empty!12079)))

(assert (=> b!451043 t!13728))

(declare-fun b_and!18765 () Bool)

(assert (= b_and!18763 (and (=> t!13728 result!6969) b_and!18765)))

(declare-fun m!435039 () Bool)

(assert (=> bm!29800 m!435039))

(declare-fun m!435041 () Bool)

(assert (=> b!451030 m!435041))

(declare-fun m!435043 () Bool)

(assert (=> b!451042 m!435043))

(assert (=> b!451042 m!435043))

(declare-fun m!435045 () Bool)

(assert (=> b!451042 m!435045))

(declare-fun m!435047 () Bool)

(assert (=> b!451042 m!435047))

(declare-fun m!435049 () Bool)

(assert (=> bm!29799 m!435049))

(declare-fun m!435051 () Bool)

(assert (=> b!451037 m!435051))

(declare-fun m!435053 () Bool)

(assert (=> b!451033 m!435053))

(declare-fun m!435055 () Bool)

(assert (=> b!451033 m!435055))

(declare-fun m!435057 () Bool)

(assert (=> b!451041 m!435057))

(declare-fun m!435059 () Bool)

(assert (=> b!451040 m!435059))

(declare-fun m!435061 () Bool)

(assert (=> b!451028 m!435061))

(assert (=> b!451043 m!435039))

(declare-fun m!435063 () Bool)

(assert (=> b!451043 m!435063))

(assert (=> b!451043 m!435039))

(declare-fun m!435065 () Bool)

(assert (=> b!451043 m!435065))

(declare-fun m!435067 () Bool)

(assert (=> b!451043 m!435067))

(declare-fun m!435069 () Bool)

(assert (=> b!451043 m!435069))

(assert (=> b!451043 m!435065))

(declare-fun m!435071 () Bool)

(assert (=> b!451043 m!435071))

(assert (=> b!451043 m!435069))

(declare-fun m!435073 () Bool)

(assert (=> b!451029 m!435073))

(declare-fun m!435075 () Bool)

(assert (=> b!451029 m!435075))

(declare-fun m!435077 () Bool)

(assert (=> b!451029 m!435077))

(declare-fun m!435079 () Bool)

(assert (=> start!40716 m!435079))

(declare-fun m!435081 () Bool)

(assert (=> start!40716 m!435081))

(declare-fun m!435083 () Bool)

(assert (=> b!451031 m!435083))

(declare-fun m!435085 () Bool)

(assert (=> mapNonEmpty!19752 m!435085))

(declare-fun m!435087 () Bool)

(assert (=> b!451034 m!435087))

(declare-fun m!435089 () Bool)

(assert (=> b!451032 m!435089))

(check-sat (not b_next!10741) (not b!451034) (not b!451029) (not b!451041) b_and!18765 (not bm!29799) (not b!451037) (not b!451031) (not bm!29800) (not b!451043) (not b!451042) (not mapNonEmpty!19752) (not start!40716) (not b!451033) (not b!451032) (not b!451030) tp_is_empty!12079 (not b!451040) (not b_lambda!9499))
(check-sat b_and!18765 (not b_next!10741))
(get-model)

(declare-fun b_lambda!9505 () Bool)

(assert (= b_lambda!9499 (or (and start!40716 b_free!10741) b_lambda!9505)))

(check-sat (not b_next!10741) (not b!451034) (not b!451029) (not b!451041) b_and!18765 (not bm!29799) (not b!451037) (not b!451031) (not bm!29800) (not b_lambda!9505) (not b!451043) (not b!451042) (not b!451040) (not mapNonEmpty!19752) (not start!40716) (not b!451033) (not b!451032) (not b!451030) tp_is_empty!12079)
(check-sat b_and!18765 (not b_next!10741))
(get-model)

(declare-fun d!74293 () Bool)

(declare-fun res!268658 () Bool)

(declare-fun e!264290 () Bool)

(assert (=> d!74293 (=> res!268658 e!264290)))

(assert (=> d!74293 (= res!268658 (= (select (arr!13423 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74293 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!264290)))

(declare-fun b!451169 () Bool)

(declare-fun e!264291 () Bool)

(assert (=> b!451169 (= e!264290 e!264291)))

(declare-fun res!268659 () Bool)

(assert (=> b!451169 (=> (not res!268659) (not e!264291))))

(assert (=> b!451169 (= res!268659 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13775 _keys!709)))))

(declare-fun b!451170 () Bool)

(assert (=> b!451170 (= e!264291 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74293 (not res!268658)) b!451169))

(assert (= (and b!451169 res!268659) b!451170))

(declare-fun m!435199 () Bool)

(assert (=> d!74293 m!435199))

(declare-fun m!435201 () Bool)

(assert (=> b!451170 m!435201))

(assert (=> b!451030 d!74293))

(declare-fun b!451195 () Bool)

(declare-fun e!264310 () Bool)

(assert (=> b!451195 (= e!264310 (validKeyInArray!0 (select (arr!13423 lt!204816) from!863)))))

(assert (=> b!451195 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun d!74295 () Bool)

(declare-fun e!264312 () Bool)

(assert (=> d!74295 e!264312))

(declare-fun res!268671 () Bool)

(assert (=> d!74295 (=> (not res!268671) (not e!264312))))

(declare-fun lt!204862 () ListLongMap!6817)

(declare-fun contains!2474 (ListLongMap!6817 (_ BitVec 64)) Bool)

(assert (=> d!74295 (= res!268671 (not (contains!2474 lt!204862 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264307 () ListLongMap!6817)

(assert (=> d!74295 (= lt!204862 e!264307)))

(declare-fun c!56013 () Bool)

(assert (=> d!74295 (= c!56013 (bvsge from!863 (size!13775 lt!204816)))))

(assert (=> d!74295 (validMask!0 mask!1025)))

(assert (=> d!74295 (= (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!204862)))

(declare-fun b!451196 () Bool)

(declare-fun e!264311 () Bool)

(declare-fun e!264306 () Bool)

(assert (=> b!451196 (= e!264311 e!264306)))

(assert (=> b!451196 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13775 lt!204816)))))

(declare-fun res!268669 () Bool)

(assert (=> b!451196 (= res!268669 (contains!2474 lt!204862 (select (arr!13423 lt!204816) from!863)))))

(assert (=> b!451196 (=> (not res!268669) (not e!264306))))

(declare-fun b!451197 () Bool)

(assert (=> b!451197 (= e!264307 (ListLongMap!6818 Nil!7970))))

(declare-fun b!451198 () Bool)

(declare-fun res!268670 () Bool)

(assert (=> b!451198 (=> (not res!268670) (not e!264312))))

(assert (=> b!451198 (= res!268670 (not (contains!2474 lt!204862 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451199 () Bool)

(declare-fun e!264308 () ListLongMap!6817)

(declare-fun call!29818 () ListLongMap!6817)

(assert (=> b!451199 (= e!264308 call!29818)))

(declare-fun b!451200 () Bool)

(declare-fun e!264309 () Bool)

(assert (=> b!451200 (= e!264311 e!264309)))

(declare-fun c!56012 () Bool)

(assert (=> b!451200 (= c!56012 (bvslt from!863 (size!13775 lt!204816)))))

(declare-fun b!451201 () Bool)

(assert (=> b!451201 (= e!264309 (= lt!204862 (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!451202 () Bool)

(assert (=> b!451202 (= e!264312 e!264311)))

(declare-fun c!56010 () Bool)

(assert (=> b!451202 (= c!56010 e!264310)))

(declare-fun res!268668 () Bool)

(assert (=> b!451202 (=> (not res!268668) (not e!264310))))

(assert (=> b!451202 (= res!268668 (bvslt from!863 (size!13775 lt!204816)))))

(declare-fun b!451203 () Bool)

(declare-fun lt!204863 () Unit!13185)

(declare-fun lt!204866 () Unit!13185)

(assert (=> b!451203 (= lt!204863 lt!204866)))

(declare-fun lt!204868 () (_ BitVec 64))

(declare-fun lt!204864 () (_ BitVec 64))

(declare-fun lt!204867 () ListLongMap!6817)

(declare-fun lt!204865 () V!17211)

(assert (=> b!451203 (not (contains!2474 (+!1552 lt!204867 (tuple2!7903 lt!204868 lt!204865)) lt!204864))))

(declare-fun addStillNotContains!147 (ListLongMap!6817 (_ BitVec 64) V!17211 (_ BitVec 64)) Unit!13185)

(assert (=> b!451203 (= lt!204866 (addStillNotContains!147 lt!204867 lt!204868 lt!204865 lt!204864))))

(assert (=> b!451203 (= lt!204864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451203 (= lt!204865 (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451203 (= lt!204868 (select (arr!13423 lt!204816) from!863))))

(assert (=> b!451203 (= lt!204867 call!29818)))

(assert (=> b!451203 (= e!264308 (+!1552 call!29818 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451204 () Bool)

(declare-fun isEmpty!564 (ListLongMap!6817) Bool)

(assert (=> b!451204 (= e!264309 (isEmpty!564 lt!204862))))

(declare-fun b!451205 () Bool)

(assert (=> b!451205 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13775 lt!204816)))))

(assert (=> b!451205 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13776 lt!204813)))))

(declare-fun apply!312 (ListLongMap!6817 (_ BitVec 64)) V!17211)

(assert (=> b!451205 (= e!264306 (= (apply!312 lt!204862 (select (arr!13423 lt!204816) from!863)) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!29815 () Bool)

(assert (=> bm!29815 (= call!29818 (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451206 () Bool)

(assert (=> b!451206 (= e!264307 e!264308)))

(declare-fun c!56011 () Bool)

(assert (=> b!451206 (= c!56011 (validKeyInArray!0 (select (arr!13423 lt!204816) from!863)))))

(assert (= (and d!74295 c!56013) b!451197))

(assert (= (and d!74295 (not c!56013)) b!451206))

(assert (= (and b!451206 c!56011) b!451203))

(assert (= (and b!451206 (not c!56011)) b!451199))

(assert (= (or b!451203 b!451199) bm!29815))

(assert (= (and d!74295 res!268671) b!451198))

(assert (= (and b!451198 res!268670) b!451202))

(assert (= (and b!451202 res!268668) b!451195))

(assert (= (and b!451202 c!56010) b!451196))

(assert (= (and b!451202 (not c!56010)) b!451200))

(assert (= (and b!451196 res!268669) b!451205))

(assert (= (and b!451200 c!56012) b!451201))

(assert (= (and b!451200 (not c!56012)) b!451204))

(declare-fun b_lambda!9507 () Bool)

(assert (=> (not b_lambda!9507) (not b!451203)))

(assert (=> b!451203 t!13728))

(declare-fun b_and!18775 () Bool)

(assert (= b_and!18765 (and (=> t!13728 result!6969) b_and!18775)))

(declare-fun b_lambda!9509 () Bool)

(assert (=> (not b_lambda!9509) (not b!451205)))

(assert (=> b!451205 t!13728))

(declare-fun b_and!18777 () Bool)

(assert (= b_and!18775 (and (=> t!13728 result!6969) b_and!18777)))

(declare-fun m!435203 () Bool)

(assert (=> bm!29815 m!435203))

(assert (=> b!451206 m!435067))

(assert (=> b!451206 m!435067))

(declare-fun m!435205 () Bool)

(assert (=> b!451206 m!435205))

(declare-fun m!435207 () Bool)

(assert (=> b!451198 m!435207))

(assert (=> b!451195 m!435067))

(assert (=> b!451195 m!435067))

(assert (=> b!451195 m!435205))

(assert (=> b!451205 m!435067))

(declare-fun m!435209 () Bool)

(assert (=> b!451205 m!435209))

(assert (=> b!451205 m!435069))

(assert (=> b!451205 m!435069))

(assert (=> b!451205 m!435065))

(assert (=> b!451205 m!435071))

(assert (=> b!451205 m!435067))

(assert (=> b!451205 m!435065))

(assert (=> b!451201 m!435203))

(assert (=> b!451203 m!435069))

(declare-fun m!435211 () Bool)

(assert (=> b!451203 m!435211))

(declare-fun m!435213 () Bool)

(assert (=> b!451203 m!435213))

(assert (=> b!451203 m!435069))

(assert (=> b!451203 m!435065))

(assert (=> b!451203 m!435071))

(assert (=> b!451203 m!435067))

(declare-fun m!435215 () Bool)

(assert (=> b!451203 m!435215))

(assert (=> b!451203 m!435211))

(assert (=> b!451203 m!435065))

(declare-fun m!435217 () Bool)

(assert (=> b!451203 m!435217))

(declare-fun m!435219 () Bool)

(assert (=> b!451204 m!435219))

(declare-fun m!435221 () Bool)

(assert (=> d!74295 m!435221))

(assert (=> d!74295 m!435083))

(assert (=> b!451196 m!435067))

(assert (=> b!451196 m!435067))

(declare-fun m!435223 () Bool)

(assert (=> b!451196 m!435223))

(assert (=> b!451029 d!74295))

(declare-fun b!451207 () Bool)

(declare-fun e!264317 () Bool)

(assert (=> b!451207 (= e!264317 (validKeyInArray!0 (select (arr!13423 _keys!709) from!863)))))

(assert (=> b!451207 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun d!74297 () Bool)

(declare-fun e!264319 () Bool)

(assert (=> d!74297 e!264319))

(declare-fun res!268675 () Bool)

(assert (=> d!74297 (=> (not res!268675) (not e!264319))))

(declare-fun lt!204869 () ListLongMap!6817)

(assert (=> d!74297 (= res!268675 (not (contains!2474 lt!204869 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264314 () ListLongMap!6817)

(assert (=> d!74297 (= lt!204869 e!264314)))

(declare-fun c!56017 () Bool)

(assert (=> d!74297 (= c!56017 (bvsge from!863 (size!13775 _keys!709)))))

(assert (=> d!74297 (validMask!0 mask!1025)))

(assert (=> d!74297 (= (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!204869)))

(declare-fun b!451208 () Bool)

(declare-fun e!264318 () Bool)

(declare-fun e!264313 () Bool)

(assert (=> b!451208 (= e!264318 e!264313)))

(assert (=> b!451208 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13775 _keys!709)))))

(declare-fun res!268673 () Bool)

(assert (=> b!451208 (= res!268673 (contains!2474 lt!204869 (select (arr!13423 _keys!709) from!863)))))

(assert (=> b!451208 (=> (not res!268673) (not e!264313))))

(declare-fun b!451209 () Bool)

(assert (=> b!451209 (= e!264314 (ListLongMap!6818 Nil!7970))))

(declare-fun b!451210 () Bool)

(declare-fun res!268674 () Bool)

(assert (=> b!451210 (=> (not res!268674) (not e!264319))))

(assert (=> b!451210 (= res!268674 (not (contains!2474 lt!204869 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451211 () Bool)

(declare-fun e!264315 () ListLongMap!6817)

(declare-fun call!29819 () ListLongMap!6817)

(assert (=> b!451211 (= e!264315 call!29819)))

(declare-fun b!451212 () Bool)

(declare-fun e!264316 () Bool)

(assert (=> b!451212 (= e!264318 e!264316)))

(declare-fun c!56016 () Bool)

(assert (=> b!451212 (= c!56016 (bvslt from!863 (size!13775 _keys!709)))))

(declare-fun b!451213 () Bool)

(assert (=> b!451213 (= e!264316 (= lt!204869 (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!451214 () Bool)

(assert (=> b!451214 (= e!264319 e!264318)))

(declare-fun c!56014 () Bool)

(assert (=> b!451214 (= c!56014 e!264317)))

(declare-fun res!268672 () Bool)

(assert (=> b!451214 (=> (not res!268672) (not e!264317))))

(assert (=> b!451214 (= res!268672 (bvslt from!863 (size!13775 _keys!709)))))

(declare-fun b!451215 () Bool)

(declare-fun lt!204870 () Unit!13185)

(declare-fun lt!204873 () Unit!13185)

(assert (=> b!451215 (= lt!204870 lt!204873)))

(declare-fun lt!204872 () V!17211)

(declare-fun lt!204875 () (_ BitVec 64))

(declare-fun lt!204871 () (_ BitVec 64))

(declare-fun lt!204874 () ListLongMap!6817)

(assert (=> b!451215 (not (contains!2474 (+!1552 lt!204874 (tuple2!7903 lt!204875 lt!204872)) lt!204871))))

(assert (=> b!451215 (= lt!204873 (addStillNotContains!147 lt!204874 lt!204875 lt!204872 lt!204871))))

(assert (=> b!451215 (= lt!204871 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451215 (= lt!204872 (get!6618 (select (arr!13424 _values!549) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451215 (= lt!204875 (select (arr!13423 _keys!709) from!863))))

(assert (=> b!451215 (= lt!204874 call!29819)))

(assert (=> b!451215 (= e!264315 (+!1552 call!29819 (tuple2!7903 (select (arr!13423 _keys!709) from!863) (get!6618 (select (arr!13424 _values!549) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451216 () Bool)

(assert (=> b!451216 (= e!264316 (isEmpty!564 lt!204869))))

(declare-fun b!451217 () Bool)

(assert (=> b!451217 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13775 _keys!709)))))

(assert (=> b!451217 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13776 _values!549)))))

(assert (=> b!451217 (= e!264313 (= (apply!312 lt!204869 (select (arr!13423 _keys!709) from!863)) (get!6618 (select (arr!13424 _values!549) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!29816 () Bool)

(assert (=> bm!29816 (= call!29819 (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451218 () Bool)

(assert (=> b!451218 (= e!264314 e!264315)))

(declare-fun c!56015 () Bool)

(assert (=> b!451218 (= c!56015 (validKeyInArray!0 (select (arr!13423 _keys!709) from!863)))))

(assert (= (and d!74297 c!56017) b!451209))

(assert (= (and d!74297 (not c!56017)) b!451218))

(assert (= (and b!451218 c!56015) b!451215))

(assert (= (and b!451218 (not c!56015)) b!451211))

(assert (= (or b!451215 b!451211) bm!29816))

(assert (= (and d!74297 res!268675) b!451210))

(assert (= (and b!451210 res!268674) b!451214))

(assert (= (and b!451214 res!268672) b!451207))

(assert (= (and b!451214 c!56014) b!451208))

(assert (= (and b!451214 (not c!56014)) b!451212))

(assert (= (and b!451208 res!268673) b!451217))

(assert (= (and b!451212 c!56016) b!451213))

(assert (= (and b!451212 (not c!56016)) b!451216))

(declare-fun b_lambda!9511 () Bool)

(assert (=> (not b_lambda!9511) (not b!451215)))

(assert (=> b!451215 t!13728))

(declare-fun b_and!18779 () Bool)

(assert (= b_and!18777 (and (=> t!13728 result!6969) b_and!18779)))

(declare-fun b_lambda!9513 () Bool)

(assert (=> (not b_lambda!9513) (not b!451217)))

(assert (=> b!451217 t!13728))

(declare-fun b_and!18781 () Bool)

(assert (= b_and!18779 (and (=> t!13728 result!6969) b_and!18781)))

(declare-fun m!435225 () Bool)

(assert (=> bm!29816 m!435225))

(assert (=> b!451218 m!435043))

(assert (=> b!451218 m!435043))

(assert (=> b!451218 m!435045))

(declare-fun m!435227 () Bool)

(assert (=> b!451210 m!435227))

(assert (=> b!451207 m!435043))

(assert (=> b!451207 m!435043))

(assert (=> b!451207 m!435045))

(assert (=> b!451217 m!435043))

(declare-fun m!435229 () Bool)

(assert (=> b!451217 m!435229))

(declare-fun m!435231 () Bool)

(assert (=> b!451217 m!435231))

(assert (=> b!451217 m!435231))

(assert (=> b!451217 m!435065))

(declare-fun m!435233 () Bool)

(assert (=> b!451217 m!435233))

(assert (=> b!451217 m!435043))

(assert (=> b!451217 m!435065))

(assert (=> b!451213 m!435225))

(assert (=> b!451215 m!435231))

(declare-fun m!435235 () Bool)

(assert (=> b!451215 m!435235))

(declare-fun m!435237 () Bool)

(assert (=> b!451215 m!435237))

(assert (=> b!451215 m!435231))

(assert (=> b!451215 m!435065))

(assert (=> b!451215 m!435233))

(assert (=> b!451215 m!435043))

(declare-fun m!435239 () Bool)

(assert (=> b!451215 m!435239))

(assert (=> b!451215 m!435235))

(assert (=> b!451215 m!435065))

(declare-fun m!435241 () Bool)

(assert (=> b!451215 m!435241))

(declare-fun m!435243 () Bool)

(assert (=> b!451216 m!435243))

(declare-fun m!435245 () Bool)

(assert (=> d!74297 m!435245))

(assert (=> d!74297 m!435083))

(assert (=> b!451208 m!435043))

(assert (=> b!451208 m!435043))

(declare-fun m!435247 () Bool)

(assert (=> b!451208 m!435247))

(assert (=> b!451029 d!74297))

(declare-fun b!451219 () Bool)

(declare-fun e!264324 () Bool)

(assert (=> b!451219 (= e!264324 (validKeyInArray!0 (select (arr!13423 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451219 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun d!74299 () Bool)

(declare-fun e!264326 () Bool)

(assert (=> d!74299 e!264326))

(declare-fun res!268679 () Bool)

(assert (=> d!74299 (=> (not res!268679) (not e!264326))))

(declare-fun lt!204876 () ListLongMap!6817)

(assert (=> d!74299 (= res!268679 (not (contains!2474 lt!204876 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264321 () ListLongMap!6817)

(assert (=> d!74299 (= lt!204876 e!264321)))

(declare-fun c!56021 () Bool)

(assert (=> d!74299 (= c!56021 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13775 _keys!709)))))

(assert (=> d!74299 (validMask!0 mask!1025)))

(assert (=> d!74299 (= (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204876)))

(declare-fun b!451220 () Bool)

(declare-fun e!264325 () Bool)

(declare-fun e!264320 () Bool)

(assert (=> b!451220 (= e!264325 e!264320)))

(assert (=> b!451220 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13775 _keys!709)))))

(declare-fun res!268677 () Bool)

(assert (=> b!451220 (= res!268677 (contains!2474 lt!204876 (select (arr!13423 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451220 (=> (not res!268677) (not e!264320))))

(declare-fun b!451221 () Bool)

(assert (=> b!451221 (= e!264321 (ListLongMap!6818 Nil!7970))))

(declare-fun b!451222 () Bool)

(declare-fun res!268678 () Bool)

(assert (=> b!451222 (=> (not res!268678) (not e!264326))))

(assert (=> b!451222 (= res!268678 (not (contains!2474 lt!204876 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451223 () Bool)

(declare-fun e!264322 () ListLongMap!6817)

(declare-fun call!29820 () ListLongMap!6817)

(assert (=> b!451223 (= e!264322 call!29820)))

(declare-fun b!451224 () Bool)

(declare-fun e!264323 () Bool)

(assert (=> b!451224 (= e!264325 e!264323)))

(declare-fun c!56020 () Bool)

(assert (=> b!451224 (= c!56020 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13775 _keys!709)))))

(declare-fun b!451225 () Bool)

(assert (=> b!451225 (= e!264323 (= lt!204876 (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!451226 () Bool)

(assert (=> b!451226 (= e!264326 e!264325)))

(declare-fun c!56018 () Bool)

(assert (=> b!451226 (= c!56018 e!264324)))

(declare-fun res!268676 () Bool)

(assert (=> b!451226 (=> (not res!268676) (not e!264324))))

(assert (=> b!451226 (= res!268676 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13775 _keys!709)))))

(declare-fun b!451227 () Bool)

(declare-fun lt!204877 () Unit!13185)

(declare-fun lt!204880 () Unit!13185)

(assert (=> b!451227 (= lt!204877 lt!204880)))

(declare-fun lt!204881 () ListLongMap!6817)

(declare-fun lt!204882 () (_ BitVec 64))

(declare-fun lt!204878 () (_ BitVec 64))

(declare-fun lt!204879 () V!17211)

(assert (=> b!451227 (not (contains!2474 (+!1552 lt!204881 (tuple2!7903 lt!204882 lt!204879)) lt!204878))))

(assert (=> b!451227 (= lt!204880 (addStillNotContains!147 lt!204881 lt!204882 lt!204879 lt!204878))))

(assert (=> b!451227 (= lt!204878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451227 (= lt!204879 (get!6618 (select (arr!13424 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451227 (= lt!204882 (select (arr!13423 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!451227 (= lt!204881 call!29820)))

(assert (=> b!451227 (= e!264322 (+!1552 call!29820 (tuple2!7903 (select (arr!13423 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6618 (select (arr!13424 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451228 () Bool)

(assert (=> b!451228 (= e!264323 (isEmpty!564 lt!204876))))

(declare-fun b!451229 () Bool)

(assert (=> b!451229 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13775 _keys!709)))))

(assert (=> b!451229 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13776 _values!549)))))

(assert (=> b!451229 (= e!264320 (= (apply!312 lt!204876 (select (arr!13423 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6618 (select (arr!13424 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!29817 () Bool)

(assert (=> bm!29817 (= call!29820 (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451230 () Bool)

(assert (=> b!451230 (= e!264321 e!264322)))

(declare-fun c!56019 () Bool)

(assert (=> b!451230 (= c!56019 (validKeyInArray!0 (select (arr!13423 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (= (and d!74299 c!56021) b!451221))

(assert (= (and d!74299 (not c!56021)) b!451230))

(assert (= (and b!451230 c!56019) b!451227))

(assert (= (and b!451230 (not c!56019)) b!451223))

(assert (= (or b!451227 b!451223) bm!29817))

(assert (= (and d!74299 res!268679) b!451222))

(assert (= (and b!451222 res!268678) b!451226))

(assert (= (and b!451226 res!268676) b!451219))

(assert (= (and b!451226 c!56018) b!451220))

(assert (= (and b!451226 (not c!56018)) b!451224))

(assert (= (and b!451220 res!268677) b!451229))

(assert (= (and b!451224 c!56020) b!451225))

(assert (= (and b!451224 (not c!56020)) b!451228))

(declare-fun b_lambda!9515 () Bool)

(assert (=> (not b_lambda!9515) (not b!451227)))

(assert (=> b!451227 t!13728))

(declare-fun b_and!18783 () Bool)

(assert (= b_and!18781 (and (=> t!13728 result!6969) b_and!18783)))

(declare-fun b_lambda!9517 () Bool)

(assert (=> (not b_lambda!9517) (not b!451229)))

(assert (=> b!451229 t!13728))

(declare-fun b_and!18785 () Bool)

(assert (= b_and!18783 (and (=> t!13728 result!6969) b_and!18785)))

(declare-fun m!435249 () Bool)

(assert (=> bm!29817 m!435249))

(declare-fun m!435251 () Bool)

(assert (=> b!451230 m!435251))

(assert (=> b!451230 m!435251))

(declare-fun m!435253 () Bool)

(assert (=> b!451230 m!435253))

(declare-fun m!435255 () Bool)

(assert (=> b!451222 m!435255))

(assert (=> b!451219 m!435251))

(assert (=> b!451219 m!435251))

(assert (=> b!451219 m!435253))

(assert (=> b!451229 m!435251))

(declare-fun m!435257 () Bool)

(assert (=> b!451229 m!435257))

(declare-fun m!435259 () Bool)

(assert (=> b!451229 m!435259))

(assert (=> b!451229 m!435259))

(assert (=> b!451229 m!435065))

(declare-fun m!435261 () Bool)

(assert (=> b!451229 m!435261))

(assert (=> b!451229 m!435251))

(assert (=> b!451229 m!435065))

(assert (=> b!451225 m!435249))

(assert (=> b!451227 m!435259))

(declare-fun m!435263 () Bool)

(assert (=> b!451227 m!435263))

(declare-fun m!435265 () Bool)

(assert (=> b!451227 m!435265))

(assert (=> b!451227 m!435259))

(assert (=> b!451227 m!435065))

(assert (=> b!451227 m!435261))

(assert (=> b!451227 m!435251))

(declare-fun m!435267 () Bool)

(assert (=> b!451227 m!435267))

(assert (=> b!451227 m!435263))

(assert (=> b!451227 m!435065))

(declare-fun m!435269 () Bool)

(assert (=> b!451227 m!435269))

(declare-fun m!435271 () Bool)

(assert (=> b!451228 m!435271))

(declare-fun m!435273 () Bool)

(assert (=> d!74299 m!435273))

(assert (=> d!74299 m!435083))

(assert (=> b!451220 m!435251))

(assert (=> b!451220 m!435251))

(declare-fun m!435275 () Bool)

(assert (=> b!451220 m!435275))

(assert (=> bm!29799 d!74299))

(declare-fun b!451239 () Bool)

(declare-fun e!264335 () Bool)

(declare-fun call!29823 () Bool)

(assert (=> b!451239 (= e!264335 call!29823)))

(declare-fun d!74301 () Bool)

(declare-fun res!268685 () Bool)

(declare-fun e!264333 () Bool)

(assert (=> d!74301 (=> res!268685 e!264333)))

(assert (=> d!74301 (= res!268685 (bvsge #b00000000000000000000000000000000 (size!13775 lt!204816)))))

(assert (=> d!74301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204816 mask!1025) e!264333)))

(declare-fun bm!29820 () Bool)

(assert (=> bm!29820 (= call!29823 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!204816 mask!1025))))

(declare-fun b!451240 () Bool)

(declare-fun e!264334 () Bool)

(assert (=> b!451240 (= e!264333 e!264334)))

(declare-fun c!56024 () Bool)

(assert (=> b!451240 (= c!56024 (validKeyInArray!0 (select (arr!13423 lt!204816) #b00000000000000000000000000000000)))))

(declare-fun b!451241 () Bool)

(assert (=> b!451241 (= e!264334 call!29823)))

(declare-fun b!451242 () Bool)

(assert (=> b!451242 (= e!264334 e!264335)))

(declare-fun lt!204891 () (_ BitVec 64))

(assert (=> b!451242 (= lt!204891 (select (arr!13423 lt!204816) #b00000000000000000000000000000000))))

(declare-fun lt!204890 () Unit!13185)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27956 (_ BitVec 64) (_ BitVec 32)) Unit!13185)

(assert (=> b!451242 (= lt!204890 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!204816 lt!204891 #b00000000000000000000000000000000))))

(assert (=> b!451242 (arrayContainsKey!0 lt!204816 lt!204891 #b00000000000000000000000000000000)))

(declare-fun lt!204889 () Unit!13185)

(assert (=> b!451242 (= lt!204889 lt!204890)))

(declare-fun res!268684 () Bool)

(declare-datatypes ((SeekEntryResult!3480 0))(
  ( (MissingZero!3480 (index!16099 (_ BitVec 32))) (Found!3480 (index!16100 (_ BitVec 32))) (Intermediate!3480 (undefined!4292 Bool) (index!16101 (_ BitVec 32)) (x!42255 (_ BitVec 32))) (Undefined!3480) (MissingVacant!3480 (index!16102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27956 (_ BitVec 32)) SeekEntryResult!3480)

(assert (=> b!451242 (= res!268684 (= (seekEntryOrOpen!0 (select (arr!13423 lt!204816) #b00000000000000000000000000000000) lt!204816 mask!1025) (Found!3480 #b00000000000000000000000000000000)))))

(assert (=> b!451242 (=> (not res!268684) (not e!264335))))

(assert (= (and d!74301 (not res!268685)) b!451240))

(assert (= (and b!451240 c!56024) b!451242))

(assert (= (and b!451240 (not c!56024)) b!451241))

(assert (= (and b!451242 res!268684) b!451239))

(assert (= (or b!451239 b!451241) bm!29820))

(declare-fun m!435277 () Bool)

(assert (=> bm!29820 m!435277))

(declare-fun m!435279 () Bool)

(assert (=> b!451240 m!435279))

(assert (=> b!451240 m!435279))

(declare-fun m!435281 () Bool)

(assert (=> b!451240 m!435281))

(assert (=> b!451242 m!435279))

(declare-fun m!435283 () Bool)

(assert (=> b!451242 m!435283))

(declare-fun m!435285 () Bool)

(assert (=> b!451242 m!435285))

(assert (=> b!451242 m!435279))

(declare-fun m!435287 () Bool)

(assert (=> b!451242 m!435287))

(assert (=> b!451033 d!74301))

(declare-fun b!451253 () Bool)

(declare-fun e!264345 () Bool)

(declare-fun call!29826 () Bool)

(assert (=> b!451253 (= e!264345 call!29826)))

(declare-fun bm!29823 () Bool)

(declare-fun c!56027 () Bool)

(assert (=> bm!29823 (= call!29826 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56027 (Cons!7970 (select (arr!13423 _keys!709) #b00000000000000000000000000000000) Nil!7971) Nil!7971)))))

(declare-fun b!451254 () Bool)

(declare-fun e!264346 () Bool)

(assert (=> b!451254 (= e!264346 e!264345)))

(assert (=> b!451254 (= c!56027 (validKeyInArray!0 (select (arr!13423 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!451256 () Bool)

(declare-fun e!264344 () Bool)

(assert (=> b!451256 (= e!264344 e!264346)))

(declare-fun res!268692 () Bool)

(assert (=> b!451256 (=> (not res!268692) (not e!264346))))

(declare-fun e!264347 () Bool)

(assert (=> b!451256 (= res!268692 (not e!264347))))

(declare-fun res!268693 () Bool)

(assert (=> b!451256 (=> (not res!268693) (not e!264347))))

(assert (=> b!451256 (= res!268693 (validKeyInArray!0 (select (arr!13423 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!451257 () Bool)

(declare-fun contains!2475 (List!7974 (_ BitVec 64)) Bool)

(assert (=> b!451257 (= e!264347 (contains!2475 Nil!7971 (select (arr!13423 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74303 () Bool)

(declare-fun res!268694 () Bool)

(assert (=> d!74303 (=> res!268694 e!264344)))

(assert (=> d!74303 (= res!268694 (bvsge #b00000000000000000000000000000000 (size!13775 _keys!709)))))

(assert (=> d!74303 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7971) e!264344)))

(declare-fun b!451255 () Bool)

(assert (=> b!451255 (= e!264345 call!29826)))

(assert (= (and d!74303 (not res!268694)) b!451256))

(assert (= (and b!451256 res!268693) b!451257))

(assert (= (and b!451256 res!268692) b!451254))

(assert (= (and b!451254 c!56027) b!451253))

(assert (= (and b!451254 (not c!56027)) b!451255))

(assert (= (or b!451253 b!451255) bm!29823))

(assert (=> bm!29823 m!435199))

(declare-fun m!435289 () Bool)

(assert (=> bm!29823 m!435289))

(assert (=> b!451254 m!435199))

(assert (=> b!451254 m!435199))

(declare-fun m!435291 () Bool)

(assert (=> b!451254 m!435291))

(assert (=> b!451256 m!435199))

(assert (=> b!451256 m!435199))

(assert (=> b!451256 m!435291))

(assert (=> b!451257 m!435199))

(assert (=> b!451257 m!435199))

(declare-fun m!435293 () Bool)

(assert (=> b!451257 m!435293))

(assert (=> b!451041 d!74303))

(declare-fun d!74305 () Bool)

(assert (=> d!74305 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!451032 d!74305))

(declare-fun b!451258 () Bool)

(declare-fun e!264350 () Bool)

(declare-fun call!29827 () Bool)

(assert (=> b!451258 (= e!264350 call!29827)))

(declare-fun d!74307 () Bool)

(declare-fun res!268696 () Bool)

(declare-fun e!264348 () Bool)

(assert (=> d!74307 (=> res!268696 e!264348)))

(assert (=> d!74307 (= res!268696 (bvsge #b00000000000000000000000000000000 (size!13775 _keys!709)))))

(assert (=> d!74307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!264348)))

(declare-fun bm!29824 () Bool)

(assert (=> bm!29824 (= call!29827 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!451259 () Bool)

(declare-fun e!264349 () Bool)

(assert (=> b!451259 (= e!264348 e!264349)))

(declare-fun c!56028 () Bool)

(assert (=> b!451259 (= c!56028 (validKeyInArray!0 (select (arr!13423 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!451260 () Bool)

(assert (=> b!451260 (= e!264349 call!29827)))

(declare-fun b!451261 () Bool)

(assert (=> b!451261 (= e!264349 e!264350)))

(declare-fun lt!204894 () (_ BitVec 64))

(assert (=> b!451261 (= lt!204894 (select (arr!13423 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!204893 () Unit!13185)

(assert (=> b!451261 (= lt!204893 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!204894 #b00000000000000000000000000000000))))

(assert (=> b!451261 (arrayContainsKey!0 _keys!709 lt!204894 #b00000000000000000000000000000000)))

(declare-fun lt!204892 () Unit!13185)

(assert (=> b!451261 (= lt!204892 lt!204893)))

(declare-fun res!268695 () Bool)

(assert (=> b!451261 (= res!268695 (= (seekEntryOrOpen!0 (select (arr!13423 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3480 #b00000000000000000000000000000000)))))

(assert (=> b!451261 (=> (not res!268695) (not e!264350))))

(assert (= (and d!74307 (not res!268696)) b!451259))

(assert (= (and b!451259 c!56028) b!451261))

(assert (= (and b!451259 (not c!56028)) b!451260))

(assert (= (and b!451261 res!268695) b!451258))

(assert (= (or b!451258 b!451260) bm!29824))

(declare-fun m!435295 () Bool)

(assert (=> bm!29824 m!435295))

(assert (=> b!451259 m!435199))

(assert (=> b!451259 m!435199))

(assert (=> b!451259 m!435291))

(assert (=> b!451261 m!435199))

(declare-fun m!435297 () Bool)

(assert (=> b!451261 m!435297))

(declare-fun m!435299 () Bool)

(assert (=> b!451261 m!435299))

(assert (=> b!451261 m!435199))

(declare-fun m!435301 () Bool)

(assert (=> b!451261 m!435301))

(assert (=> b!451040 d!74307))

(declare-fun d!74309 () Bool)

(assert (=> d!74309 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!451031 d!74309))

(declare-fun d!74311 () Bool)

(assert (=> d!74311 (= (array_inv!9802 _values!549) (bvsge (size!13776 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40716 d!74311))

(declare-fun d!74313 () Bool)

(assert (=> d!74313 (= (array_inv!9803 _keys!709) (bvsge (size!13775 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40716 d!74313))

(declare-fun b!451262 () Bool)

(declare-fun e!264355 () Bool)

(assert (=> b!451262 (= e!264355 (validKeyInArray!0 (select (arr!13423 lt!204816) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451262 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun d!74315 () Bool)

(declare-fun e!264357 () Bool)

(assert (=> d!74315 e!264357))

(declare-fun res!268700 () Bool)

(assert (=> d!74315 (=> (not res!268700) (not e!264357))))

(declare-fun lt!204895 () ListLongMap!6817)

(assert (=> d!74315 (= res!268700 (not (contains!2474 lt!204895 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264352 () ListLongMap!6817)

(assert (=> d!74315 (= lt!204895 e!264352)))

(declare-fun c!56032 () Bool)

(assert (=> d!74315 (= c!56032 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13775 lt!204816)))))

(assert (=> d!74315 (validMask!0 mask!1025)))

(assert (=> d!74315 (= (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204895)))

(declare-fun b!451263 () Bool)

(declare-fun e!264356 () Bool)

(declare-fun e!264351 () Bool)

(assert (=> b!451263 (= e!264356 e!264351)))

(assert (=> b!451263 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13775 lt!204816)))))

(declare-fun res!268698 () Bool)

(assert (=> b!451263 (= res!268698 (contains!2474 lt!204895 (select (arr!13423 lt!204816) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451263 (=> (not res!268698) (not e!264351))))

(declare-fun b!451264 () Bool)

(assert (=> b!451264 (= e!264352 (ListLongMap!6818 Nil!7970))))

(declare-fun b!451265 () Bool)

(declare-fun res!268699 () Bool)

(assert (=> b!451265 (=> (not res!268699) (not e!264357))))

(assert (=> b!451265 (= res!268699 (not (contains!2474 lt!204895 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451266 () Bool)

(declare-fun e!264353 () ListLongMap!6817)

(declare-fun call!29828 () ListLongMap!6817)

(assert (=> b!451266 (= e!264353 call!29828)))

(declare-fun b!451267 () Bool)

(declare-fun e!264354 () Bool)

(assert (=> b!451267 (= e!264356 e!264354)))

(declare-fun c!56031 () Bool)

(assert (=> b!451267 (= c!56031 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13775 lt!204816)))))

(declare-fun b!451268 () Bool)

(assert (=> b!451268 (= e!264354 (= lt!204895 (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!451269 () Bool)

(assert (=> b!451269 (= e!264357 e!264356)))

(declare-fun c!56029 () Bool)

(assert (=> b!451269 (= c!56029 e!264355)))

(declare-fun res!268697 () Bool)

(assert (=> b!451269 (=> (not res!268697) (not e!264355))))

(assert (=> b!451269 (= res!268697 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13775 lt!204816)))))

(declare-fun b!451270 () Bool)

(declare-fun lt!204896 () Unit!13185)

(declare-fun lt!204899 () Unit!13185)

(assert (=> b!451270 (= lt!204896 lt!204899)))

(declare-fun lt!204897 () (_ BitVec 64))

(declare-fun lt!204900 () ListLongMap!6817)

(declare-fun lt!204901 () (_ BitVec 64))

(declare-fun lt!204898 () V!17211)

(assert (=> b!451270 (not (contains!2474 (+!1552 lt!204900 (tuple2!7903 lt!204901 lt!204898)) lt!204897))))

(assert (=> b!451270 (= lt!204899 (addStillNotContains!147 lt!204900 lt!204901 lt!204898 lt!204897))))

(assert (=> b!451270 (= lt!204897 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451270 (= lt!204898 (get!6618 (select (arr!13424 lt!204813) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451270 (= lt!204901 (select (arr!13423 lt!204816) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!451270 (= lt!204900 call!29828)))

(assert (=> b!451270 (= e!264353 (+!1552 call!29828 (tuple2!7903 (select (arr!13423 lt!204816) (bvadd #b00000000000000000000000000000001 from!863)) (get!6618 (select (arr!13424 lt!204813) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451271 () Bool)

(assert (=> b!451271 (= e!264354 (isEmpty!564 lt!204895))))

(declare-fun b!451272 () Bool)

(assert (=> b!451272 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13775 lt!204816)))))

(assert (=> b!451272 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13776 lt!204813)))))

(assert (=> b!451272 (= e!264351 (= (apply!312 lt!204895 (select (arr!13423 lt!204816) (bvadd #b00000000000000000000000000000001 from!863))) (get!6618 (select (arr!13424 lt!204813) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!29825 () Bool)

(assert (=> bm!29825 (= call!29828 (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451273 () Bool)

(assert (=> b!451273 (= e!264352 e!264353)))

(declare-fun c!56030 () Bool)

(assert (=> b!451273 (= c!56030 (validKeyInArray!0 (select (arr!13423 lt!204816) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (= (and d!74315 c!56032) b!451264))

(assert (= (and d!74315 (not c!56032)) b!451273))

(assert (= (and b!451273 c!56030) b!451270))

(assert (= (and b!451273 (not c!56030)) b!451266))

(assert (= (or b!451270 b!451266) bm!29825))

(assert (= (and d!74315 res!268700) b!451265))

(assert (= (and b!451265 res!268699) b!451269))

(assert (= (and b!451269 res!268697) b!451262))

(assert (= (and b!451269 c!56029) b!451263))

(assert (= (and b!451269 (not c!56029)) b!451267))

(assert (= (and b!451263 res!268698) b!451272))

(assert (= (and b!451267 c!56031) b!451268))

(assert (= (and b!451267 (not c!56031)) b!451271))

(declare-fun b_lambda!9519 () Bool)

(assert (=> (not b_lambda!9519) (not b!451270)))

(assert (=> b!451270 t!13728))

(declare-fun b_and!18787 () Bool)

(assert (= b_and!18785 (and (=> t!13728 result!6969) b_and!18787)))

(declare-fun b_lambda!9521 () Bool)

(assert (=> (not b_lambda!9521) (not b!451272)))

(assert (=> b!451272 t!13728))

(declare-fun b_and!18789 () Bool)

(assert (= b_and!18787 (and (=> t!13728 result!6969) b_and!18789)))

(declare-fun m!435303 () Bool)

(assert (=> bm!29825 m!435303))

(declare-fun m!435305 () Bool)

(assert (=> b!451273 m!435305))

(assert (=> b!451273 m!435305))

(declare-fun m!435307 () Bool)

(assert (=> b!451273 m!435307))

(declare-fun m!435309 () Bool)

(assert (=> b!451265 m!435309))

(assert (=> b!451262 m!435305))

(assert (=> b!451262 m!435305))

(assert (=> b!451262 m!435307))

(assert (=> b!451272 m!435305))

(declare-fun m!435311 () Bool)

(assert (=> b!451272 m!435311))

(declare-fun m!435313 () Bool)

(assert (=> b!451272 m!435313))

(assert (=> b!451272 m!435313))

(assert (=> b!451272 m!435065))

(declare-fun m!435315 () Bool)

(assert (=> b!451272 m!435315))

(assert (=> b!451272 m!435305))

(assert (=> b!451272 m!435065))

(assert (=> b!451268 m!435303))

(assert (=> b!451270 m!435313))

(declare-fun m!435317 () Bool)

(assert (=> b!451270 m!435317))

(declare-fun m!435319 () Bool)

(assert (=> b!451270 m!435319))

(assert (=> b!451270 m!435313))

(assert (=> b!451270 m!435065))

(assert (=> b!451270 m!435315))

(assert (=> b!451270 m!435305))

(declare-fun m!435321 () Bool)

(assert (=> b!451270 m!435321))

(assert (=> b!451270 m!435317))

(assert (=> b!451270 m!435065))

(declare-fun m!435323 () Bool)

(assert (=> b!451270 m!435323))

(declare-fun m!435325 () Bool)

(assert (=> b!451271 m!435325))

(declare-fun m!435327 () Bool)

(assert (=> d!74315 m!435327))

(assert (=> d!74315 m!435083))

(assert (=> b!451263 m!435305))

(assert (=> b!451263 m!435305))

(declare-fun m!435329 () Bool)

(assert (=> b!451263 m!435329))

(assert (=> bm!29800 d!74315))

(declare-fun d!74317 () Bool)

(declare-fun e!264360 () Bool)

(assert (=> d!74317 e!264360))

(declare-fun res!268706 () Bool)

(assert (=> d!74317 (=> (not res!268706) (not e!264360))))

(declare-fun lt!204913 () ListLongMap!6817)

(assert (=> d!74317 (= res!268706 (contains!2474 lt!204913 (_1!3962 (tuple2!7903 k0!794 v!412))))))

(declare-fun lt!204911 () List!7973)

(assert (=> d!74317 (= lt!204913 (ListLongMap!6818 lt!204911))))

(declare-fun lt!204912 () Unit!13185)

(declare-fun lt!204910 () Unit!13185)

(assert (=> d!74317 (= lt!204912 lt!204910)))

(declare-datatypes ((Option!376 0))(
  ( (Some!375 (v!8346 V!17211)) (None!374) )
))
(declare-fun getValueByKey!370 (List!7973 (_ BitVec 64)) Option!376)

(assert (=> d!74317 (= (getValueByKey!370 lt!204911 (_1!3962 (tuple2!7903 k0!794 v!412))) (Some!375 (_2!3962 (tuple2!7903 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!192 (List!7973 (_ BitVec 64) V!17211) Unit!13185)

(assert (=> d!74317 (= lt!204910 (lemmaContainsTupThenGetReturnValue!192 lt!204911 (_1!3962 (tuple2!7903 k0!794 v!412)) (_2!3962 (tuple2!7903 k0!794 v!412))))))

(declare-fun insertStrictlySorted!195 (List!7973 (_ BitVec 64) V!17211) List!7973)

(assert (=> d!74317 (= lt!204911 (insertStrictlySorted!195 (toList!3424 call!29802) (_1!3962 (tuple2!7903 k0!794 v!412)) (_2!3962 (tuple2!7903 k0!794 v!412))))))

(assert (=> d!74317 (= (+!1552 call!29802 (tuple2!7903 k0!794 v!412)) lt!204913)))

(declare-fun b!451278 () Bool)

(declare-fun res!268705 () Bool)

(assert (=> b!451278 (=> (not res!268705) (not e!264360))))

(assert (=> b!451278 (= res!268705 (= (getValueByKey!370 (toList!3424 lt!204913) (_1!3962 (tuple2!7903 k0!794 v!412))) (Some!375 (_2!3962 (tuple2!7903 k0!794 v!412)))))))

(declare-fun b!451279 () Bool)

(declare-fun contains!2476 (List!7973 tuple2!7902) Bool)

(assert (=> b!451279 (= e!264360 (contains!2476 (toList!3424 lt!204913) (tuple2!7903 k0!794 v!412)))))

(assert (= (and d!74317 res!268706) b!451278))

(assert (= (and b!451278 res!268705) b!451279))

(declare-fun m!435331 () Bool)

(assert (=> d!74317 m!435331))

(declare-fun m!435333 () Bool)

(assert (=> d!74317 m!435333))

(declare-fun m!435335 () Bool)

(assert (=> d!74317 m!435335))

(declare-fun m!435337 () Bool)

(assert (=> d!74317 m!435337))

(declare-fun m!435339 () Bool)

(assert (=> b!451278 m!435339))

(declare-fun m!435341 () Bool)

(assert (=> b!451279 m!435341))

(assert (=> b!451034 d!74317))

(declare-fun d!74319 () Bool)

(assert (=> d!74319 (= (validKeyInArray!0 (select (arr!13423 _keys!709) from!863)) (and (not (= (select (arr!13423 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13423 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!451042 d!74319))

(declare-fun bm!29830 () Bool)

(declare-fun call!29833 () ListLongMap!6817)

(assert (=> bm!29830 (= call!29833 (getCurrentListMapNoExtraKeys!1653 (array!27957 (store (arr!13423 _keys!709) i!563 k0!794) (size!13775 _keys!709)) (array!27959 (store (arr!13424 _values!549) i!563 (ValueCellFull!5696 v!412)) (size!13776 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29834 () ListLongMap!6817)

(declare-fun b!451286 () Bool)

(declare-fun e!264366 () Bool)

(assert (=> b!451286 (= e!264366 (= call!29833 (+!1552 call!29834 (tuple2!7903 k0!794 v!412))))))

(declare-fun b!451287 () Bool)

(assert (=> b!451287 (= e!264366 (= call!29833 call!29834))))

(declare-fun bm!29831 () Bool)

(assert (=> bm!29831 (= call!29834 (getCurrentListMapNoExtraKeys!1653 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun d!74321 () Bool)

(declare-fun e!264365 () Bool)

(assert (=> d!74321 e!264365))

(declare-fun res!268709 () Bool)

(assert (=> d!74321 (=> (not res!268709) (not e!264365))))

(assert (=> d!74321 (= res!268709 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13775 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13776 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13775 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13776 _values!549))))))))

(declare-fun lt!204916 () Unit!13185)

(declare-fun choose!1333 (array!27956 array!27958 (_ BitVec 32) (_ BitVec 32) V!17211 V!17211 (_ BitVec 32) (_ BitVec 64) V!17211 (_ BitVec 32) Int) Unit!13185)

(assert (=> d!74321 (= lt!204916 (choose!1333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74321 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13775 _keys!709)))))

(assert (=> d!74321 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!713 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204916)))

(declare-fun b!451288 () Bool)

(assert (=> b!451288 (= e!264365 e!264366)))

(declare-fun c!56035 () Bool)

(assert (=> b!451288 (= c!56035 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (= (and d!74321 res!268709) b!451288))

(assert (= (and b!451288 c!56035) b!451286))

(assert (= (and b!451288 (not c!56035)) b!451287))

(assert (= (or b!451286 b!451287) bm!29831))

(assert (= (or b!451286 b!451287) bm!29830))

(assert (=> bm!29830 m!435055))

(assert (=> bm!29830 m!435075))

(declare-fun m!435343 () Bool)

(assert (=> bm!29830 m!435343))

(declare-fun m!435345 () Bool)

(assert (=> b!451286 m!435345))

(assert (=> bm!29831 m!435049))

(declare-fun m!435347 () Bool)

(assert (=> d!74321 m!435347))

(assert (=> b!451042 d!74321))

(declare-fun b!451289 () Bool)

(declare-fun e!264368 () Bool)

(declare-fun call!29835 () Bool)

(assert (=> b!451289 (= e!264368 call!29835)))

(declare-fun bm!29832 () Bool)

(declare-fun c!56036 () Bool)

(assert (=> bm!29832 (= call!29835 (arrayNoDuplicates!0 lt!204816 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56036 (Cons!7970 (select (arr!13423 lt!204816) #b00000000000000000000000000000000) Nil!7971) Nil!7971)))))

(declare-fun b!451290 () Bool)

(declare-fun e!264369 () Bool)

(assert (=> b!451290 (= e!264369 e!264368)))

(assert (=> b!451290 (= c!56036 (validKeyInArray!0 (select (arr!13423 lt!204816) #b00000000000000000000000000000000)))))

(declare-fun b!451292 () Bool)

(declare-fun e!264367 () Bool)

(assert (=> b!451292 (= e!264367 e!264369)))

(declare-fun res!268710 () Bool)

(assert (=> b!451292 (=> (not res!268710) (not e!264369))))

(declare-fun e!264370 () Bool)

(assert (=> b!451292 (= res!268710 (not e!264370))))

(declare-fun res!268711 () Bool)

(assert (=> b!451292 (=> (not res!268711) (not e!264370))))

(assert (=> b!451292 (= res!268711 (validKeyInArray!0 (select (arr!13423 lt!204816) #b00000000000000000000000000000000)))))

(declare-fun b!451293 () Bool)

(assert (=> b!451293 (= e!264370 (contains!2475 Nil!7971 (select (arr!13423 lt!204816) #b00000000000000000000000000000000)))))

(declare-fun d!74323 () Bool)

(declare-fun res!268712 () Bool)

(assert (=> d!74323 (=> res!268712 e!264367)))

(assert (=> d!74323 (= res!268712 (bvsge #b00000000000000000000000000000000 (size!13775 lt!204816)))))

(assert (=> d!74323 (= (arrayNoDuplicates!0 lt!204816 #b00000000000000000000000000000000 Nil!7971) e!264367)))

(declare-fun b!451291 () Bool)

(assert (=> b!451291 (= e!264368 call!29835)))

(assert (= (and d!74323 (not res!268712)) b!451292))

(assert (= (and b!451292 res!268711) b!451293))

(assert (= (and b!451292 res!268710) b!451290))

(assert (= (and b!451290 c!56036) b!451289))

(assert (= (and b!451290 (not c!56036)) b!451291))

(assert (= (or b!451289 b!451291) bm!29832))

(assert (=> bm!29832 m!435279))

(declare-fun m!435349 () Bool)

(assert (=> bm!29832 m!435349))

(assert (=> b!451290 m!435279))

(assert (=> b!451290 m!435279))

(assert (=> b!451290 m!435281))

(assert (=> b!451292 m!435279))

(assert (=> b!451292 m!435279))

(assert (=> b!451292 m!435281))

(assert (=> b!451293 m!435279))

(assert (=> b!451293 m!435279))

(declare-fun m!435351 () Bool)

(assert (=> b!451293 m!435351))

(assert (=> b!451037 d!74323))

(declare-fun d!74325 () Bool)

(declare-fun e!264371 () Bool)

(assert (=> d!74325 e!264371))

(declare-fun res!268714 () Bool)

(assert (=> d!74325 (=> (not res!268714) (not e!264371))))

(declare-fun lt!204920 () ListLongMap!6817)

(assert (=> d!74325 (= res!268714 (contains!2474 lt!204920 (_1!3962 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!204918 () List!7973)

(assert (=> d!74325 (= lt!204920 (ListLongMap!6818 lt!204918))))

(declare-fun lt!204919 () Unit!13185)

(declare-fun lt!204917 () Unit!13185)

(assert (=> d!74325 (= lt!204919 lt!204917)))

(assert (=> d!74325 (= (getValueByKey!370 lt!204918 (_1!3962 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!3962 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74325 (= lt!204917 (lemmaContainsTupThenGetReturnValue!192 lt!204918 (_1!3962 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3962 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74325 (= lt!204918 (insertStrictlySorted!195 (toList!3424 (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557)) (_1!3962 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3962 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74325 (= (+!1552 (getCurrentListMapNoExtraKeys!1653 lt!204816 lt!204813 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!204920)))

(declare-fun b!451294 () Bool)

(declare-fun res!268713 () Bool)

(assert (=> b!451294 (=> (not res!268713) (not e!264371))))

(assert (=> b!451294 (= res!268713 (= (getValueByKey!370 (toList!3424 lt!204920) (_1!3962 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!3962 (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!451295 () Bool)

(assert (=> b!451295 (= e!264371 (contains!2476 (toList!3424 lt!204920) (tuple2!7903 (select (arr!13423 lt!204816) from!863) (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74325 res!268714) b!451294))

(assert (= (and b!451294 res!268713) b!451295))

(declare-fun m!435353 () Bool)

(assert (=> d!74325 m!435353))

(declare-fun m!435355 () Bool)

(assert (=> d!74325 m!435355))

(declare-fun m!435357 () Bool)

(assert (=> d!74325 m!435357))

(declare-fun m!435359 () Bool)

(assert (=> d!74325 m!435359))

(declare-fun m!435361 () Bool)

(assert (=> b!451294 m!435361))

(declare-fun m!435363 () Bool)

(assert (=> b!451295 m!435363))

(assert (=> b!451043 d!74325))

(assert (=> b!451043 d!74315))

(declare-fun d!74327 () Bool)

(declare-fun c!56039 () Bool)

(assert (=> d!74327 (= c!56039 ((_ is ValueCellFull!5696) (select (arr!13424 lt!204813) from!863)))))

(declare-fun e!264374 () V!17211)

(assert (=> d!74327 (= (get!6618 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!264374)))

(declare-fun b!451300 () Bool)

(declare-fun get!6619 (ValueCell!5696 V!17211) V!17211)

(assert (=> b!451300 (= e!264374 (get!6619 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451301 () Bool)

(declare-fun get!6620 (ValueCell!5696 V!17211) V!17211)

(assert (=> b!451301 (= e!264374 (get!6620 (select (arr!13424 lt!204813) from!863) (dynLambda!855 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74327 c!56039) b!451300))

(assert (= (and d!74327 (not c!56039)) b!451301))

(assert (=> b!451300 m!435069))

(assert (=> b!451300 m!435065))

(declare-fun m!435365 () Bool)

(assert (=> b!451300 m!435365))

(assert (=> b!451301 m!435069))

(assert (=> b!451301 m!435065))

(declare-fun m!435367 () Bool)

(assert (=> b!451301 m!435367))

(assert (=> b!451043 d!74327))

(declare-fun condMapEmpty!19761 () Bool)

(declare-fun mapDefault!19761 () ValueCell!5696)

(assert (=> mapNonEmpty!19752 (= condMapEmpty!19761 (= mapRest!19752 ((as const (Array (_ BitVec 32) ValueCell!5696)) mapDefault!19761)))))

(declare-fun e!264379 () Bool)

(declare-fun mapRes!19761 () Bool)

(assert (=> mapNonEmpty!19752 (= tp!38042 (and e!264379 mapRes!19761))))

(declare-fun mapIsEmpty!19761 () Bool)

(assert (=> mapIsEmpty!19761 mapRes!19761))

(declare-fun mapNonEmpty!19761 () Bool)

(declare-fun tp!38058 () Bool)

(declare-fun e!264380 () Bool)

(assert (=> mapNonEmpty!19761 (= mapRes!19761 (and tp!38058 e!264380))))

(declare-fun mapKey!19761 () (_ BitVec 32))

(declare-fun mapValue!19761 () ValueCell!5696)

(declare-fun mapRest!19761 () (Array (_ BitVec 32) ValueCell!5696))

(assert (=> mapNonEmpty!19761 (= mapRest!19752 (store mapRest!19761 mapKey!19761 mapValue!19761))))

(declare-fun b!451309 () Bool)

(assert (=> b!451309 (= e!264379 tp_is_empty!12079)))

(declare-fun b!451308 () Bool)

(assert (=> b!451308 (= e!264380 tp_is_empty!12079)))

(assert (= (and mapNonEmpty!19752 condMapEmpty!19761) mapIsEmpty!19761))

(assert (= (and mapNonEmpty!19752 (not condMapEmpty!19761)) mapNonEmpty!19761))

(assert (= (and mapNonEmpty!19761 ((_ is ValueCellFull!5696) mapValue!19761)) b!451308))

(assert (= (and mapNonEmpty!19752 ((_ is ValueCellFull!5696) mapDefault!19761)) b!451309))

(declare-fun m!435369 () Bool)

(assert (=> mapNonEmpty!19761 m!435369))

(declare-fun b_lambda!9523 () Bool)

(assert (= b_lambda!9517 (or (and start!40716 b_free!10741) b_lambda!9523)))

(declare-fun b_lambda!9525 () Bool)

(assert (= b_lambda!9513 (or (and start!40716 b_free!10741) b_lambda!9525)))

(declare-fun b_lambda!9527 () Bool)

(assert (= b_lambda!9509 (or (and start!40716 b_free!10741) b_lambda!9527)))

(declare-fun b_lambda!9529 () Bool)

(assert (= b_lambda!9519 (or (and start!40716 b_free!10741) b_lambda!9529)))

(declare-fun b_lambda!9531 () Bool)

(assert (= b_lambda!9521 (or (and start!40716 b_free!10741) b_lambda!9531)))

(declare-fun b_lambda!9533 () Bool)

(assert (= b_lambda!9507 (or (and start!40716 b_free!10741) b_lambda!9533)))

(declare-fun b_lambda!9535 () Bool)

(assert (= b_lambda!9515 (or (and start!40716 b_free!10741) b_lambda!9535)))

(declare-fun b_lambda!9537 () Bool)

(assert (= b_lambda!9511 (or (and start!40716 b_free!10741) b_lambda!9537)))

(check-sat (not d!74321) (not b!451230) (not b!451261) (not b!451279) (not b!451271) (not b_lambda!9527) (not b!451215) (not b!451293) (not b_lambda!9505) (not b!451204) (not bm!29831) (not b!451256) (not b!451254) (not b_next!10741) (not b!451220) b_and!18789 (not d!74299) (not b!451301) (not b!451227) (not b!451273) (not b!451201) (not b!451208) (not b_lambda!9533) (not b!451229) (not b!451270) (not b!451242) (not b!451217) (not b_lambda!9523) (not b!451228) (not b!451290) (not d!74295) (not b!451196) (not b!451272) (not mapNonEmpty!19761) (not b!451263) (not b!451292) (not b!451278) (not b_lambda!9529) (not b!451218) (not bm!29816) (not b!451203) (not b!451219) (not bm!29832) (not b!451170) (not b!451205) (not bm!29815) (not b!451257) (not b!451206) (not bm!29817) (not b!451207) (not d!74315) (not d!74317) (not b!451268) (not d!74325) (not b!451300) (not b!451210) (not b!451265) (not b!451240) (not b!451262) (not b!451259) (not b!451216) tp_is_empty!12079 (not b!451198) (not b!451225) (not bm!29820) (not bm!29830) (not b_lambda!9525) (not b!451294) (not b_lambda!9537) (not b!451295) (not b_lambda!9535) (not d!74297) (not bm!29825) (not b!451195) (not b!451286) (not b_lambda!9531) (not bm!29824) (not bm!29823) (not b!451222) (not b!451213))
(check-sat b_and!18789 (not b_next!10741))
