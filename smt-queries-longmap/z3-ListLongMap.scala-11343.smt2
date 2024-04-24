; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132374 () Bool)

(assert start!132374)

(declare-fun b_free!31675 () Bool)

(declare-fun b_next!31675 () Bool)

(assert (=> start!132374 (= b_free!31675 (not b_next!31675))))

(declare-fun tp!111276 () Bool)

(declare-fun b_and!51087 () Bool)

(assert (=> start!132374 (= tp!111276 b_and!51087)))

(declare-datatypes ((array!103230 0))(
  ( (array!103231 (arr!49810 (Array (_ BitVec 32) (_ BitVec 64))) (size!50361 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103230)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59045 0))(
  ( (V!59046 (val!19053 Int)) )
))
(declare-datatypes ((tuple2!24548 0))(
  ( (tuple2!24549 (_1!12285 (_ BitVec 64)) (_2!12285 V!59045)) )
))
(declare-datatypes ((List!36039 0))(
  ( (Nil!36036) (Cons!36035 (h!37498 tuple2!24548) (t!50725 List!36039)) )
))
(declare-datatypes ((ListLongMap!22165 0))(
  ( (ListLongMap!22166 (toList!11098 List!36039)) )
))
(declare-fun call!69440 () ListLongMap!22165)

(declare-datatypes ((ValueCell!18065 0))(
  ( (ValueCellFull!18065 (v!21846 V!59045)) (EmptyCell!18065) )
))
(declare-datatypes ((array!103232 0))(
  ( (array!103233 (arr!49811 (Array (_ BitVec 32) ValueCell!18065)) (size!50362 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103232)

(declare-fun minValue!436 () V!59045)

(declare-fun bm!69437 () Bool)

(declare-fun zeroValue!436 () V!59045)

(declare-fun getCurrentListMapNoExtraKeys!6582 (array!103230 array!103232 (_ BitVec 32) (_ BitVec 32) V!59045 V!59045 (_ BitVec 32) Int) ListLongMap!22165)

(assert (=> bm!69437 (= call!69440 (getCurrentListMapNoExtraKeys!6582 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548077 () Bool)

(declare-fun e!861848 () ListLongMap!22165)

(declare-fun call!69441 () ListLongMap!22165)

(assert (=> b!1548077 (= e!861848 call!69441)))

(declare-fun mapNonEmpty!58630 () Bool)

(declare-fun mapRes!58630 () Bool)

(declare-fun tp!111277 () Bool)

(declare-fun e!861844 () Bool)

(assert (=> mapNonEmpty!58630 (= mapRes!58630 (and tp!111277 e!861844))))

(declare-fun mapRest!58630 () (Array (_ BitVec 32) ValueCell!18065))

(declare-fun mapValue!58630 () ValueCell!18065)

(declare-fun mapKey!58630 () (_ BitVec 32))

(assert (=> mapNonEmpty!58630 (= (arr!49811 _values!470) (store mapRest!58630 mapKey!58630 mapValue!58630))))

(declare-fun b!1548078 () Bool)

(declare-fun e!861851 () Bool)

(declare-fun tp_is_empty!37951 () Bool)

(assert (=> b!1548078 (= e!861851 tp_is_empty!37951)))

(declare-fun b!1548079 () Bool)

(declare-fun e!861846 () Bool)

(assert (=> b!1548079 (= e!861846 (and e!861851 mapRes!58630))))

(declare-fun condMapEmpty!58630 () Bool)

(declare-fun mapDefault!58630 () ValueCell!18065)

(assert (=> b!1548079 (= condMapEmpty!58630 (= (arr!49811 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18065)) mapDefault!58630)))))

(declare-fun b!1548080 () Bool)

(declare-fun c!142467 () Bool)

(declare-fun lt!667274 () Bool)

(assert (=> b!1548080 (= c!142467 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667274))))

(declare-fun e!861852 () ListLongMap!22165)

(assert (=> b!1548080 (= e!861852 e!861848)))

(declare-fun b!1548081 () Bool)

(declare-fun res!1060756 () Bool)

(declare-fun e!861847 () Bool)

(assert (=> b!1548081 (=> (not res!1060756) (not e!861847))))

(assert (=> b!1548081 (= res!1060756 (and (= (size!50362 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50361 _keys!618) (size!50362 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun c!142468 () Bool)

(declare-fun call!69444 () ListLongMap!22165)

(declare-fun c!142466 () Bool)

(declare-fun bm!69438 () Bool)

(declare-fun call!69443 () ListLongMap!22165)

(declare-fun +!4945 (ListLongMap!22165 tuple2!24548) ListLongMap!22165)

(assert (=> bm!69438 (= call!69444 (+!4945 (ite c!142466 call!69440 (ite c!142468 call!69443 call!69441)) (ite (or c!142466 c!142468) (tuple2!24549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548082 () Bool)

(declare-fun e!861845 () Bool)

(assert (=> b!1548082 (= e!861845 (not true))))

(declare-fun lt!667275 () ListLongMap!22165)

(declare-fun contains!10084 (ListLongMap!22165 (_ BitVec 64)) Bool)

(assert (=> b!1548082 (contains!10084 (+!4945 lt!667275 (tuple2!24549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49810 _keys!618) from!762))))

(declare-datatypes ((Unit!51437 0))(
  ( (Unit!51438) )
))
(declare-fun lt!667276 () Unit!51437)

(declare-fun addStillContains!1226 (ListLongMap!22165 (_ BitVec 64) V!59045 (_ BitVec 64)) Unit!51437)

(assert (=> b!1548082 (= lt!667276 (addStillContains!1226 lt!667275 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49810 _keys!618) from!762)))))

(assert (=> b!1548082 (= lt!667275 (getCurrentListMapNoExtraKeys!6582 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548083 () Bool)

(declare-fun res!1060759 () Bool)

(assert (=> b!1548083 (=> (not res!1060759) (not e!861847))))

(declare-datatypes ((List!36040 0))(
  ( (Nil!36037) (Cons!36036 (h!37499 (_ BitVec 64)) (t!50726 List!36040)) )
))
(declare-fun arrayNoDuplicates!0 (array!103230 (_ BitVec 32) List!36040) Bool)

(assert (=> b!1548083 (= res!1060759 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36037))))

(declare-fun b!1548084 () Bool)

(declare-fun res!1060754 () Bool)

(assert (=> b!1548084 (=> (not res!1060754) (not e!861847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103230 (_ BitVec 32)) Bool)

(assert (=> b!1548084 (= res!1060754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548085 () Bool)

(assert (=> b!1548085 (= e!861844 tp_is_empty!37951)))

(declare-fun res!1060757 () Bool)

(assert (=> start!132374 (=> (not res!1060757) (not e!861847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132374 (= res!1060757 (validMask!0 mask!926))))

(assert (=> start!132374 e!861847))

(declare-fun array_inv!39009 (array!103230) Bool)

(assert (=> start!132374 (array_inv!39009 _keys!618)))

(assert (=> start!132374 tp_is_empty!37951))

(assert (=> start!132374 true))

(assert (=> start!132374 tp!111276))

(declare-fun array_inv!39010 (array!103232) Bool)

(assert (=> start!132374 (and (array_inv!39010 _values!470) e!861846)))

(declare-fun b!1548086 () Bool)

(declare-fun res!1060758 () Bool)

(assert (=> b!1548086 (=> (not res!1060758) (not e!861845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548086 (= res!1060758 (validKeyInArray!0 (select (arr!49810 _keys!618) from!762)))))

(declare-fun b!1548087 () Bool)

(declare-fun call!69442 () ListLongMap!22165)

(assert (=> b!1548087 (= e!861848 call!69442)))

(declare-fun b!1548088 () Bool)

(declare-fun e!861849 () ListLongMap!22165)

(assert (=> b!1548088 (= e!861849 e!861852)))

(assert (=> b!1548088 (= c!142468 (and (not lt!667274) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548089 () Bool)

(declare-fun res!1060760 () Bool)

(assert (=> b!1548089 (=> (not res!1060760) (not e!861847))))

(assert (=> b!1548089 (= res!1060760 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50361 _keys!618))))))

(declare-fun bm!69439 () Bool)

(assert (=> bm!69439 (= call!69441 call!69443)))

(declare-fun b!1548090 () Bool)

(assert (=> b!1548090 (= e!861847 e!861845)))

(declare-fun res!1060755 () Bool)

(assert (=> b!1548090 (=> (not res!1060755) (not e!861845))))

(assert (=> b!1548090 (= res!1060755 (bvslt from!762 (size!50361 _keys!618)))))

(declare-fun lt!667273 () ListLongMap!22165)

(assert (=> b!1548090 (= lt!667273 e!861849)))

(assert (=> b!1548090 (= c!142466 (and (not lt!667274) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548090 (= lt!667274 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69440 () Bool)

(assert (=> bm!69440 (= call!69443 call!69440)))

(declare-fun mapIsEmpty!58630 () Bool)

(assert (=> mapIsEmpty!58630 mapRes!58630))

(declare-fun b!1548091 () Bool)

(assert (=> b!1548091 (= e!861852 call!69442)))

(declare-fun bm!69441 () Bool)

(assert (=> bm!69441 (= call!69442 call!69444)))

(declare-fun b!1548092 () Bool)

(assert (=> b!1548092 (= e!861849 (+!4945 call!69444 (tuple2!24549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!132374 res!1060757) b!1548081))

(assert (= (and b!1548081 res!1060756) b!1548084))

(assert (= (and b!1548084 res!1060754) b!1548083))

(assert (= (and b!1548083 res!1060759) b!1548089))

(assert (= (and b!1548089 res!1060760) b!1548090))

(assert (= (and b!1548090 c!142466) b!1548092))

(assert (= (and b!1548090 (not c!142466)) b!1548088))

(assert (= (and b!1548088 c!142468) b!1548091))

(assert (= (and b!1548088 (not c!142468)) b!1548080))

(assert (= (and b!1548080 c!142467) b!1548087))

(assert (= (and b!1548080 (not c!142467)) b!1548077))

(assert (= (or b!1548087 b!1548077) bm!69439))

(assert (= (or b!1548091 bm!69439) bm!69440))

(assert (= (or b!1548091 b!1548087) bm!69441))

(assert (= (or b!1548092 bm!69440) bm!69437))

(assert (= (or b!1548092 bm!69441) bm!69438))

(assert (= (and b!1548090 res!1060755) b!1548086))

(assert (= (and b!1548086 res!1060758) b!1548082))

(assert (= (and b!1548079 condMapEmpty!58630) mapIsEmpty!58630))

(assert (= (and b!1548079 (not condMapEmpty!58630)) mapNonEmpty!58630))

(get-info :version)

(assert (= (and mapNonEmpty!58630 ((_ is ValueCellFull!18065) mapValue!58630)) b!1548085))

(assert (= (and b!1548079 ((_ is ValueCellFull!18065) mapDefault!58630)) b!1548078))

(assert (= start!132374 b!1548079))

(declare-fun m!1428129 () Bool)

(assert (=> start!132374 m!1428129))

(declare-fun m!1428131 () Bool)

(assert (=> start!132374 m!1428131))

(declare-fun m!1428133 () Bool)

(assert (=> start!132374 m!1428133))

(declare-fun m!1428135 () Bool)

(assert (=> b!1548084 m!1428135))

(declare-fun m!1428137 () Bool)

(assert (=> mapNonEmpty!58630 m!1428137))

(declare-fun m!1428139 () Bool)

(assert (=> b!1548082 m!1428139))

(declare-fun m!1428141 () Bool)

(assert (=> b!1548082 m!1428141))

(declare-fun m!1428143 () Bool)

(assert (=> b!1548082 m!1428143))

(declare-fun m!1428145 () Bool)

(assert (=> b!1548082 m!1428145))

(assert (=> b!1548082 m!1428143))

(assert (=> b!1548082 m!1428139))

(assert (=> b!1548082 m!1428143))

(declare-fun m!1428147 () Bool)

(assert (=> b!1548082 m!1428147))

(declare-fun m!1428149 () Bool)

(assert (=> b!1548092 m!1428149))

(assert (=> bm!69437 m!1428141))

(declare-fun m!1428151 () Bool)

(assert (=> b!1548083 m!1428151))

(assert (=> b!1548086 m!1428143))

(assert (=> b!1548086 m!1428143))

(declare-fun m!1428153 () Bool)

(assert (=> b!1548086 m!1428153))

(declare-fun m!1428155 () Bool)

(assert (=> bm!69438 m!1428155))

(check-sat (not bm!69437) b_and!51087 (not b!1548083) (not b!1548084) (not b_next!31675) (not mapNonEmpty!58630) (not bm!69438) (not b!1548092) (not b!1548086) tp_is_empty!37951 (not start!132374) (not b!1548082))
(check-sat b_and!51087 (not b_next!31675))
