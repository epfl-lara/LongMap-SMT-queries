; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132298 () Bool)

(assert start!132298)

(declare-fun b_free!31925 () Bool)

(declare-fun b_next!31925 () Bool)

(assert (=> start!132298 (= b_free!31925 (not b_next!31925))))

(declare-fun tp!112039 () Bool)

(declare-fun b_and!51363 () Bool)

(assert (=> start!132298 (= tp!112039 b_and!51363)))

(declare-fun b!1552231 () Bool)

(declare-fun e!864122 () Bool)

(declare-fun e!864123 () Bool)

(assert (=> b!1552231 (= e!864122 e!864123)))

(declare-fun res!1062755 () Bool)

(assert (=> b!1552231 (=> (not res!1062755) (not e!864123))))

(declare-fun lt!669164 () Bool)

(assert (=> b!1552231 (= res!1062755 (not lt!669164))))

(declare-datatypes ((Unit!51696 0))(
  ( (Unit!51697) )
))
(declare-fun lt!669169 () Unit!51696)

(declare-fun e!864127 () Unit!51696)

(assert (=> b!1552231 (= lt!669169 e!864127)))

(declare-fun c!142940 () Bool)

(assert (=> b!1552231 (= c!142940 (not lt!669164))))

(declare-fun e!864125 () Bool)

(assert (=> b!1552231 (= lt!669164 e!864125)))

(declare-fun res!1062757 () Bool)

(assert (=> b!1552231 (=> res!1062757 e!864125)))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103604 0))(
  ( (array!103605 (arr!50000 (Array (_ BitVec 32) (_ BitVec 64))) (size!50550 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103604)

(assert (=> b!1552231 (= res!1062757 (bvsge from!762 (size!50550 _keys!618)))))

(declare-datatypes ((V!59377 0))(
  ( (V!59378 (val!19178 Int)) )
))
(declare-datatypes ((tuple2!24732 0))(
  ( (tuple2!24733 (_1!12377 (_ BitVec 64)) (_2!12377 V!59377)) )
))
(declare-datatypes ((List!36207 0))(
  ( (Nil!36204) (Cons!36203 (h!37648 tuple2!24732) (t!50921 List!36207)) )
))
(declare-datatypes ((ListLongMap!22341 0))(
  ( (ListLongMap!22342 (toList!11186 List!36207)) )
))
(declare-fun lt!669172 () ListLongMap!22341)

(declare-fun e!864130 () ListLongMap!22341)

(assert (=> b!1552231 (= lt!669172 e!864130)))

(declare-fun c!142943 () Bool)

(declare-fun lt!669166 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1552231 (= c!142943 (and (not lt!669166) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552231 (= lt!669166 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552232 () Bool)

(declare-fun e!864121 () Bool)

(declare-fun tp_is_empty!38201 () Bool)

(assert (=> b!1552232 (= e!864121 tp_is_empty!38201)))

(declare-fun b!1552233 () Bool)

(declare-fun Unit!51698 () Unit!51696)

(assert (=> b!1552233 (= e!864127 Unit!51698)))

(declare-fun mapNonEmpty!59017 () Bool)

(declare-fun mapRes!59017 () Bool)

(declare-fun tp!112038 () Bool)

(declare-fun e!864128 () Bool)

(assert (=> mapNonEmpty!59017 (= mapRes!59017 (and tp!112038 e!864128))))

(declare-datatypes ((ValueCell!18190 0))(
  ( (ValueCellFull!18190 (v!21983 V!59377)) (EmptyCell!18190) )
))
(declare-fun mapRest!59017 () (Array (_ BitVec 32) ValueCell!18190))

(declare-fun mapKey!59017 () (_ BitVec 32))

(declare-datatypes ((array!103606 0))(
  ( (array!103607 (arr!50001 (Array (_ BitVec 32) ValueCell!18190)) (size!50551 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103606)

(declare-fun mapValue!59017 () ValueCell!18190)

(assert (=> mapNonEmpty!59017 (= (arr!50001 _values!470) (store mapRest!59017 mapKey!59017 mapValue!59017))))

(declare-fun b!1552234 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552234 (= e!864125 (not (validKeyInArray!0 (select (arr!50000 _keys!618) from!762))))))

(declare-fun bm!71207 () Bool)

(declare-fun call!71212 () ListLongMap!22341)

(declare-fun call!71210 () ListLongMap!22341)

(assert (=> bm!71207 (= call!71212 call!71210)))

(declare-fun b!1552235 () Bool)

(assert (=> b!1552235 (= e!864123 false)))

(declare-fun lt!669163 () Bool)

(declare-fun contains!10126 (ListLongMap!22341 (_ BitVec 64)) Bool)

(assert (=> b!1552235 (= lt!669163 (contains!10126 lt!669172 (select (arr!50000 _keys!618) from!762)))))

(declare-fun b!1552236 () Bool)

(declare-fun call!71213 () ListLongMap!22341)

(declare-fun minValue!436 () V!59377)

(declare-fun +!5006 (ListLongMap!22341 tuple2!24732) ListLongMap!22341)

(assert (=> b!1552236 (= e!864130 (+!5006 call!71213 (tuple2!24733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552237 () Bool)

(declare-fun e!864129 () ListLongMap!22341)

(assert (=> b!1552237 (= e!864130 e!864129)))

(declare-fun c!142942 () Bool)

(assert (=> b!1552237 (= c!142942 (and (not lt!669166) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552238 () Bool)

(declare-fun res!1062758 () Bool)

(assert (=> b!1552238 (=> (not res!1062758) (not e!864122))))

(assert (=> b!1552238 (= res!1062758 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50550 _keys!618))))))

(declare-fun bm!71208 () Bool)

(declare-fun call!71211 () ListLongMap!22341)

(assert (=> bm!71208 (= call!71211 call!71213)))

(declare-fun b!1552239 () Bool)

(declare-fun res!1062754 () Bool)

(assert (=> b!1552239 (=> (not res!1062754) (not e!864122))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103604 (_ BitVec 32)) Bool)

(assert (=> b!1552239 (= res!1062754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552240 () Bool)

(declare-fun c!142941 () Bool)

(assert (=> b!1552240 (= c!142941 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669166))))

(declare-fun e!864120 () ListLongMap!22341)

(assert (=> b!1552240 (= e!864129 e!864120)))

(declare-fun bm!71209 () Bool)

(declare-fun call!71214 () ListLongMap!22341)

(assert (=> bm!71209 (= call!71210 call!71214)))

(declare-fun b!1552241 () Bool)

(declare-fun res!1062760 () Bool)

(assert (=> b!1552241 (=> (not res!1062760) (not e!864122))))

(assert (=> b!1552241 (= res!1062760 (and (= (size!50551 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50550 _keys!618) (size!50551 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552242 () Bool)

(declare-fun res!1062756 () Bool)

(assert (=> b!1552242 (=> (not res!1062756) (not e!864122))))

(declare-datatypes ((List!36208 0))(
  ( (Nil!36205) (Cons!36204 (h!37649 (_ BitVec 64)) (t!50922 List!36208)) )
))
(declare-fun arrayNoDuplicates!0 (array!103604 (_ BitVec 32) List!36208) Bool)

(assert (=> b!1552242 (= res!1062756 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36205))))

(declare-fun zeroValue!436 () V!59377)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!71210 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6631 (array!103604 array!103606 (_ BitVec 32) (_ BitVec 32) V!59377 V!59377 (_ BitVec 32) Int) ListLongMap!22341)

(assert (=> bm!71210 (= call!71214 (getCurrentListMapNoExtraKeys!6631 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1062759 () Bool)

(assert (=> start!132298 (=> (not res!1062759) (not e!864122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132298 (= res!1062759 (validMask!0 mask!926))))

(assert (=> start!132298 e!864122))

(declare-fun array_inv!38869 (array!103604) Bool)

(assert (=> start!132298 (array_inv!38869 _keys!618)))

(assert (=> start!132298 tp_is_empty!38201))

(assert (=> start!132298 true))

(assert (=> start!132298 tp!112039))

(declare-fun e!864124 () Bool)

(declare-fun array_inv!38870 (array!103606) Bool)

(assert (=> start!132298 (and (array_inv!38870 _values!470) e!864124)))

(declare-fun b!1552243 () Bool)

(assert (=> b!1552243 (= e!864120 call!71212)))

(declare-fun mapIsEmpty!59017 () Bool)

(assert (=> mapIsEmpty!59017 mapRes!59017))

(declare-fun b!1552244 () Bool)

(assert (=> b!1552244 (= e!864120 call!71211)))

(declare-fun bm!71211 () Bool)

(assert (=> bm!71211 (= call!71213 (+!5006 (ite c!142943 call!71214 (ite c!142942 call!71210 call!71212)) (ite (or c!142943 c!142942) (tuple2!24733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552245 () Bool)

(declare-fun lt!669165 () Unit!51696)

(assert (=> b!1552245 (= e!864127 lt!669165)))

(declare-fun lt!669174 () ListLongMap!22341)

(assert (=> b!1552245 (= lt!669174 (getCurrentListMapNoExtraKeys!6631 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669170 () Unit!51696)

(declare-fun addStillContains!1302 (ListLongMap!22341 (_ BitVec 64) V!59377 (_ BitVec 64)) Unit!51696)

(assert (=> b!1552245 (= lt!669170 (addStillContains!1302 lt!669174 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50000 _keys!618) from!762)))))

(declare-fun lt!669168 () ListLongMap!22341)

(assert (=> b!1552245 (= lt!669168 (+!5006 lt!669174 (tuple2!24733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1552245 (contains!10126 lt!669168 (select (arr!50000 _keys!618) from!762))))

(declare-fun addApplyDifferent!644 (ListLongMap!22341 (_ BitVec 64) V!59377 (_ BitVec 64)) Unit!51696)

(assert (=> b!1552245 (= lt!669165 (addApplyDifferent!644 lt!669174 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50000 _keys!618) from!762)))))

(declare-fun lt!669171 () V!59377)

(declare-fun apply!1106 (ListLongMap!22341 (_ BitVec 64)) V!59377)

(assert (=> b!1552245 (= lt!669171 (apply!1106 (+!5006 lt!669174 (tuple2!24733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50000 _keys!618) from!762)))))

(declare-fun lt!669173 () V!59377)

(assert (=> b!1552245 (= lt!669173 (apply!1106 lt!669174 (select (arr!50000 _keys!618) from!762)))))

(assert (=> b!1552245 (= lt!669171 lt!669173)))

(declare-fun lt!669167 () Unit!51696)

(assert (=> b!1552245 (= lt!669167 (addApplyDifferent!644 lt!669174 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50000 _keys!618) from!762)))))

(assert (=> b!1552245 (= (apply!1106 lt!669168 (select (arr!50000 _keys!618) from!762)) lt!669173)))

(declare-fun b!1552246 () Bool)

(assert (=> b!1552246 (= e!864124 (and e!864121 mapRes!59017))))

(declare-fun condMapEmpty!59017 () Bool)

(declare-fun mapDefault!59017 () ValueCell!18190)

