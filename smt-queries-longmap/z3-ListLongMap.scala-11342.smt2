; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131906 () Bool)

(assert start!131906)

(declare-fun b_free!31669 () Bool)

(declare-fun b_next!31669 () Bool)

(assert (=> start!131906 (= b_free!31669 (not b_next!31669))))

(declare-fun tp!111260 () Bool)

(declare-fun b_and!51061 () Bool)

(assert (=> start!131906 (= tp!111260 b_and!51061)))

(declare-fun b!1545184 () Bool)

(declare-fun e!860063 () Bool)

(declare-fun tp_is_empty!37945 () Bool)

(assert (=> b!1545184 (= e!860063 tp_is_empty!37945)))

(declare-datatypes ((V!59037 0))(
  ( (V!59038 (val!19050 Int)) )
))
(declare-fun zeroValue!436 () V!59037)

(declare-datatypes ((tuple2!24558 0))(
  ( (tuple2!24559 (_1!12290 (_ BitVec 64)) (_2!12290 V!59037)) )
))
(declare-datatypes ((List!36038 0))(
  ( (Nil!36035) (Cons!36034 (h!37480 tuple2!24558) (t!50724 List!36038)) )
))
(declare-datatypes ((ListLongMap!22167 0))(
  ( (ListLongMap!22168 (toList!11099 List!36038)) )
))
(declare-fun call!69213 () ListLongMap!22167)

(declare-fun bm!69207 () Bool)

(declare-fun c!141550 () Bool)

(declare-fun call!69214 () ListLongMap!22167)

(declare-fun minValue!436 () V!59037)

(declare-fun call!69210 () ListLongMap!22167)

(declare-fun call!69212 () ListLongMap!22167)

(declare-fun c!141551 () Bool)

(declare-fun +!4929 (ListLongMap!22167 tuple2!24558) ListLongMap!22167)

(assert (=> bm!69207 (= call!69214 (+!4929 (ite c!141551 call!69213 (ite c!141550 call!69212 call!69210)) (ite (or c!141551 c!141550) (tuple2!24559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-datatypes ((array!103024 0))(
  ( (array!103025 (arr!49715 (Array (_ BitVec 32) (_ BitVec 64))) (size!50267 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103024)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18062 0))(
  ( (ValueCellFull!18062 (v!21847 V!59037)) (EmptyCell!18062) )
))
(declare-datatypes ((array!103026 0))(
  ( (array!103027 (arr!49716 (Array (_ BitVec 32) ValueCell!18062)) (size!50268 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103026)

(declare-fun bm!69208 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6557 (array!103024 array!103026 (_ BitVec 32) (_ BitVec 32) V!59037 V!59037 (_ BitVec 32) Int) ListLongMap!22167)

(assert (=> bm!69208 (= call!69213 (getCurrentListMapNoExtraKeys!6557 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545185 () Bool)

(declare-fun e!860064 () Bool)

(assert (=> b!1545185 (= e!860064 tp_is_empty!37945)))

(declare-fun b!1545186 () Bool)

(declare-fun e!860062 () Bool)

(declare-fun e!860058 () Bool)

(assert (=> b!1545186 (= e!860062 e!860058)))

(declare-fun res!1059703 () Bool)

(assert (=> b!1545186 (=> (not res!1059703) (not e!860058))))

(assert (=> b!1545186 (= res!1059703 (bvslt from!762 (size!50267 _keys!618)))))

(declare-fun lt!666043 () ListLongMap!22167)

(declare-fun e!860059 () ListLongMap!22167)

(assert (=> b!1545186 (= lt!666043 e!860059)))

(declare-fun lt!666044 () Bool)

(assert (=> b!1545186 (= c!141551 (and (not lt!666044) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545186 (= lt!666044 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69209 () Bool)

(assert (=> bm!69209 (= call!69212 call!69213)))

(declare-fun b!1545187 () Bool)

(declare-fun res!1059707 () Bool)

(assert (=> b!1545187 (=> (not res!1059707) (not e!860062))))

(declare-datatypes ((List!36039 0))(
  ( (Nil!36036) (Cons!36035 (h!37481 (_ BitVec 64)) (t!50725 List!36039)) )
))
(declare-fun arrayNoDuplicates!0 (array!103024 (_ BitVec 32) List!36039) Bool)

(assert (=> b!1545187 (= res!1059707 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36036))))

(declare-fun mapIsEmpty!58621 () Bool)

(declare-fun mapRes!58621 () Bool)

(assert (=> mapIsEmpty!58621 mapRes!58621))

(declare-fun b!1545188 () Bool)

(declare-fun res!1059706 () Bool)

(assert (=> b!1545188 (=> (not res!1059706) (not e!860062))))

(assert (=> b!1545188 (= res!1059706 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50267 _keys!618))))))

(declare-fun b!1545189 () Bool)

(declare-fun e!860056 () ListLongMap!22167)

(declare-fun call!69211 () ListLongMap!22167)

(assert (=> b!1545189 (= e!860056 call!69211)))

(declare-fun b!1545190 () Bool)

(declare-fun c!141552 () Bool)

(assert (=> b!1545190 (= c!141552 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666044))))

(declare-fun e!860057 () ListLongMap!22167)

(assert (=> b!1545190 (= e!860057 e!860056)))

(declare-fun bm!69210 () Bool)

(assert (=> bm!69210 (= call!69210 call!69212)))

(declare-fun bm!69211 () Bool)

(assert (=> bm!69211 (= call!69211 call!69214)))

(declare-fun b!1545192 () Bool)

(assert (=> b!1545192 (= e!860056 call!69210)))

(declare-fun b!1545193 () Bool)

(declare-fun res!1059702 () Bool)

(assert (=> b!1545193 (=> (not res!1059702) (not e!860062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103024 (_ BitVec 32)) Bool)

(assert (=> b!1545193 (= res!1059702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545194 () Bool)

(assert (=> b!1545194 (= e!860059 e!860057)))

(assert (=> b!1545194 (= c!141550 (and (not lt!666044) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545195 () Bool)

(assert (=> b!1545195 (= e!860058 (not true))))

(declare-fun lt!666046 () ListLongMap!22167)

(declare-fun contains!9991 (ListLongMap!22167 (_ BitVec 64)) Bool)

(assert (=> b!1545195 (contains!9991 (+!4929 lt!666046 (tuple2!24559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49715 _keys!618) from!762))))

(declare-datatypes ((Unit!51329 0))(
  ( (Unit!51330) )
))
(declare-fun lt!666045 () Unit!51329)

(declare-fun addStillContains!1214 (ListLongMap!22167 (_ BitVec 64) V!59037 (_ BitVec 64)) Unit!51329)

(assert (=> b!1545195 (= lt!666045 (addStillContains!1214 lt!666046 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49715 _keys!618) from!762)))))

(assert (=> b!1545195 (= lt!666046 (getCurrentListMapNoExtraKeys!6557 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545191 () Bool)

(assert (=> b!1545191 (= e!860057 call!69211)))

(declare-fun res!1059708 () Bool)

(assert (=> start!131906 (=> (not res!1059708) (not e!860062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131906 (= res!1059708 (validMask!0 mask!926))))

(assert (=> start!131906 e!860062))

(declare-fun array_inv!38865 (array!103024) Bool)

(assert (=> start!131906 (array_inv!38865 _keys!618)))

(assert (=> start!131906 tp_is_empty!37945))

(assert (=> start!131906 true))

(assert (=> start!131906 tp!111260))

(declare-fun e!860061 () Bool)

(declare-fun array_inv!38866 (array!103026) Bool)

(assert (=> start!131906 (and (array_inv!38866 _values!470) e!860061)))

(declare-fun b!1545196 () Bool)

(assert (=> b!1545196 (= e!860059 (+!4929 call!69214 (tuple2!24559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapNonEmpty!58621 () Bool)

(declare-fun tp!111259 () Bool)

(assert (=> mapNonEmpty!58621 (= mapRes!58621 (and tp!111259 e!860063))))

(declare-fun mapRest!58621 () (Array (_ BitVec 32) ValueCell!18062))

(declare-fun mapValue!58621 () ValueCell!18062)

(declare-fun mapKey!58621 () (_ BitVec 32))

(assert (=> mapNonEmpty!58621 (= (arr!49716 _values!470) (store mapRest!58621 mapKey!58621 mapValue!58621))))

(declare-fun b!1545197 () Bool)

(declare-fun res!1059704 () Bool)

(assert (=> b!1545197 (=> (not res!1059704) (not e!860062))))

(assert (=> b!1545197 (= res!1059704 (and (= (size!50268 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50267 _keys!618) (size!50268 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545198 () Bool)

(declare-fun res!1059705 () Bool)

(assert (=> b!1545198 (=> (not res!1059705) (not e!860058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545198 (= res!1059705 (validKeyInArray!0 (select (arr!49715 _keys!618) from!762)))))

(declare-fun b!1545199 () Bool)

(assert (=> b!1545199 (= e!860061 (and e!860064 mapRes!58621))))

(declare-fun condMapEmpty!58621 () Bool)

(declare-fun mapDefault!58621 () ValueCell!18062)

(assert (=> b!1545199 (= condMapEmpty!58621 (= (arr!49716 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18062)) mapDefault!58621)))))

(assert (= (and start!131906 res!1059708) b!1545197))

(assert (= (and b!1545197 res!1059704) b!1545193))

(assert (= (and b!1545193 res!1059702) b!1545187))

(assert (= (and b!1545187 res!1059707) b!1545188))

(assert (= (and b!1545188 res!1059706) b!1545186))

(assert (= (and b!1545186 c!141551) b!1545196))

(assert (= (and b!1545186 (not c!141551)) b!1545194))

(assert (= (and b!1545194 c!141550) b!1545191))

(assert (= (and b!1545194 (not c!141550)) b!1545190))

(assert (= (and b!1545190 c!141552) b!1545189))

(assert (= (and b!1545190 (not c!141552)) b!1545192))

(assert (= (or b!1545189 b!1545192) bm!69210))

(assert (= (or b!1545191 bm!69210) bm!69209))

(assert (= (or b!1545191 b!1545189) bm!69211))

(assert (= (or b!1545196 bm!69209) bm!69208))

(assert (= (or b!1545196 bm!69211) bm!69207))

(assert (= (and b!1545186 res!1059703) b!1545198))

(assert (= (and b!1545198 res!1059705) b!1545195))

(assert (= (and b!1545199 condMapEmpty!58621) mapIsEmpty!58621))

(assert (= (and b!1545199 (not condMapEmpty!58621)) mapNonEmpty!58621))

(get-info :version)

(assert (= (and mapNonEmpty!58621 ((_ is ValueCellFull!18062) mapValue!58621)) b!1545184))

(assert (= (and b!1545199 ((_ is ValueCellFull!18062) mapDefault!58621)) b!1545185))

(assert (= start!131906 b!1545199))

(declare-fun m!1424895 () Bool)

(assert (=> b!1545193 m!1424895))

(declare-fun m!1424897 () Bool)

(assert (=> b!1545198 m!1424897))

(assert (=> b!1545198 m!1424897))

(declare-fun m!1424899 () Bool)

(assert (=> b!1545198 m!1424899))

(declare-fun m!1424901 () Bool)

(assert (=> b!1545187 m!1424901))

(declare-fun m!1424903 () Bool)

(assert (=> start!131906 m!1424903))

(declare-fun m!1424905 () Bool)

(assert (=> start!131906 m!1424905))

(declare-fun m!1424907 () Bool)

(assert (=> start!131906 m!1424907))

(declare-fun m!1424909 () Bool)

(assert (=> bm!69207 m!1424909))

(declare-fun m!1424911 () Bool)

(assert (=> b!1545196 m!1424911))

(declare-fun m!1424913 () Bool)

(assert (=> bm!69208 m!1424913))

(assert (=> b!1545195 m!1424897))

(declare-fun m!1424915 () Bool)

(assert (=> b!1545195 m!1424915))

(assert (=> b!1545195 m!1424913))

(assert (=> b!1545195 m!1424897))

(declare-fun m!1424917 () Bool)

(assert (=> b!1545195 m!1424917))

(assert (=> b!1545195 m!1424917))

(assert (=> b!1545195 m!1424897))

(declare-fun m!1424919 () Bool)

(assert (=> b!1545195 m!1424919))

(declare-fun m!1424921 () Bool)

(assert (=> mapNonEmpty!58621 m!1424921))

(check-sat (not b!1545193) (not b!1545198) (not bm!69207) (not bm!69208) b_and!51061 (not mapNonEmpty!58621) tp_is_empty!37945 (not b!1545195) (not b!1545196) (not b!1545187) (not start!131906) (not b_next!31669))
(check-sat b_and!51061 (not b_next!31669))
