; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132380 () Bool)

(assert start!132380)

(declare-fun b_free!31681 () Bool)

(declare-fun b_next!31681 () Bool)

(assert (=> start!132380 (= b_free!31681 (not b_next!31681))))

(declare-fun tp!111295 () Bool)

(declare-fun b_and!51093 () Bool)

(assert (=> start!132380 (= tp!111295 b_and!51093)))

(declare-fun b!1548221 () Bool)

(declare-datatypes ((V!59053 0))(
  ( (V!59054 (val!19056 Int)) )
))
(declare-datatypes ((tuple2!24554 0))(
  ( (tuple2!24555 (_1!12288 (_ BitVec 64)) (_2!12288 V!59053)) )
))
(declare-datatypes ((List!36044 0))(
  ( (Nil!36041) (Cons!36040 (h!37503 tuple2!24554) (t!50730 List!36044)) )
))
(declare-datatypes ((ListLongMap!22171 0))(
  ( (ListLongMap!22172 (toList!11101 List!36044)) )
))
(declare-fun e!861930 () ListLongMap!22171)

(declare-fun call!69488 () ListLongMap!22171)

(assert (=> b!1548221 (= e!861930 call!69488)))

(declare-fun mapIsEmpty!58639 () Bool)

(declare-fun mapRes!58639 () Bool)

(assert (=> mapIsEmpty!58639 mapRes!58639))

(declare-fun b!1548222 () Bool)

(declare-fun res!1060822 () Bool)

(declare-fun e!861926 () Bool)

(assert (=> b!1548222 (=> (not res!1060822) (not e!861926))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18068 0))(
  ( (ValueCellFull!18068 (v!21849 V!59053)) (EmptyCell!18068) )
))
(declare-datatypes ((array!103242 0))(
  ( (array!103243 (arr!49816 (Array (_ BitVec 32) ValueCell!18068)) (size!50367 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103242)

(declare-datatypes ((array!103244 0))(
  ( (array!103245 (arr!49817 (Array (_ BitVec 32) (_ BitVec 64))) (size!50368 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103244)

(assert (=> b!1548222 (= res!1060822 (and (= (size!50367 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50368 _keys!618) (size!50367 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!69482 () Bool)

(declare-fun call!69485 () ListLongMap!22171)

(declare-fun call!69486 () ListLongMap!22171)

(assert (=> bm!69482 (= call!69485 call!69486)))

(declare-fun b!1548223 () Bool)

(declare-fun res!1060818 () Bool)

(assert (=> b!1548223 (=> (not res!1060818) (not e!861926))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1548223 (= res!1060818 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50368 _keys!618))))))

(declare-fun b!1548224 () Bool)

(declare-fun e!861927 () ListLongMap!22171)

(declare-fun e!861931 () ListLongMap!22171)

(assert (=> b!1548224 (= e!861927 e!861931)))

(declare-fun c!142493 () Bool)

(declare-fun lt!667311 () Bool)

(assert (=> b!1548224 (= c!142493 (and (not lt!667311) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548225 () Bool)

(declare-fun c!142494 () Bool)

(assert (=> b!1548225 (= c!142494 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667311))))

(assert (=> b!1548225 (= e!861931 e!861930)))

(declare-fun b!1548226 () Bool)

(declare-fun res!1060819 () Bool)

(assert (=> b!1548226 (=> (not res!1060819) (not e!861926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103244 (_ BitVec 32)) Bool)

(assert (=> b!1548226 (= res!1060819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58639 () Bool)

(declare-fun tp!111294 () Bool)

(declare-fun e!861933 () Bool)

(assert (=> mapNonEmpty!58639 (= mapRes!58639 (and tp!111294 e!861933))))

(declare-fun mapKey!58639 () (_ BitVec 32))

(declare-fun mapValue!58639 () ValueCell!18068)

(declare-fun mapRest!58639 () (Array (_ BitVec 32) ValueCell!18068))

(assert (=> mapNonEmpty!58639 (= (arr!49816 _values!470) (store mapRest!58639 mapKey!58639 mapValue!58639))))

(declare-fun b!1548228 () Bool)

(declare-fun minValue!436 () V!59053)

(declare-fun +!4948 (ListLongMap!22171 tuple2!24554) ListLongMap!22171)

(assert (=> b!1548228 (= e!861927 (+!4948 call!69486 (tuple2!24555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548229 () Bool)

(assert (=> b!1548229 (= e!861931 call!69485)))

(declare-fun bm!69483 () Bool)

(declare-fun call!69489 () ListLongMap!22171)

(declare-fun call!69487 () ListLongMap!22171)

(assert (=> bm!69483 (= call!69489 call!69487)))

(declare-fun b!1548230 () Bool)

(declare-fun e!861925 () Bool)

(declare-fun tp_is_empty!37957 () Bool)

(assert (=> b!1548230 (= e!861925 tp_is_empty!37957)))

(declare-fun b!1548231 () Bool)

(assert (=> b!1548231 (= e!861930 call!69485)))

(declare-fun b!1548232 () Bool)

(declare-fun e!861928 () Bool)

(assert (=> b!1548232 (= e!861928 (not true))))

(declare-fun zeroValue!436 () V!59053)

(declare-fun lt!667310 () ListLongMap!22171)

(declare-fun contains!10087 (ListLongMap!22171 (_ BitVec 64)) Bool)

(assert (=> b!1548232 (contains!10087 (+!4948 lt!667310 (tuple2!24555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49817 _keys!618) from!762))))

(declare-datatypes ((Unit!51443 0))(
  ( (Unit!51444) )
))
(declare-fun lt!667309 () Unit!51443)

(declare-fun addStillContains!1229 (ListLongMap!22171 (_ BitVec 64) V!59053 (_ BitVec 64)) Unit!51443)

(assert (=> b!1548232 (= lt!667309 (addStillContains!1229 lt!667310 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49817 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6585 (array!103244 array!103242 (_ BitVec 32) (_ BitVec 32) V!59053 V!59053 (_ BitVec 32) Int) ListLongMap!22171)

(assert (=> b!1548232 (= lt!667310 (getCurrentListMapNoExtraKeys!6585 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548233 () Bool)

(declare-fun res!1060823 () Bool)

(assert (=> b!1548233 (=> (not res!1060823) (not e!861926))))

(declare-datatypes ((List!36045 0))(
  ( (Nil!36042) (Cons!36041 (h!37504 (_ BitVec 64)) (t!50731 List!36045)) )
))
(declare-fun arrayNoDuplicates!0 (array!103244 (_ BitVec 32) List!36045) Bool)

(assert (=> b!1548233 (= res!1060823 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36042))))

(declare-fun bm!69484 () Bool)

(assert (=> bm!69484 (= call!69488 call!69489)))

(declare-fun b!1548234 () Bool)

(assert (=> b!1548234 (= e!861926 e!861928)))

(declare-fun res!1060821 () Bool)

(assert (=> b!1548234 (=> (not res!1060821) (not e!861928))))

(assert (=> b!1548234 (= res!1060821 (bvslt from!762 (size!50368 _keys!618)))))

(declare-fun lt!667312 () ListLongMap!22171)

(assert (=> b!1548234 (= lt!667312 e!861927)))

(declare-fun c!142495 () Bool)

(assert (=> b!1548234 (= c!142495 (and (not lt!667311) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548234 (= lt!667311 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548235 () Bool)

(declare-fun res!1060817 () Bool)

(assert (=> b!1548235 (=> (not res!1060817) (not e!861928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548235 (= res!1060817 (validKeyInArray!0 (select (arr!49817 _keys!618) from!762)))))

(declare-fun bm!69485 () Bool)

(assert (=> bm!69485 (= call!69486 (+!4948 (ite c!142495 call!69487 (ite c!142493 call!69489 call!69488)) (ite (or c!142495 c!142493) (tuple2!24555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548236 () Bool)

(declare-fun e!861929 () Bool)

(assert (=> b!1548236 (= e!861929 (and e!861925 mapRes!58639))))

(declare-fun condMapEmpty!58639 () Bool)

(declare-fun mapDefault!58639 () ValueCell!18068)

(assert (=> b!1548236 (= condMapEmpty!58639 (= (arr!49816 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18068)) mapDefault!58639)))))

(declare-fun bm!69486 () Bool)

(assert (=> bm!69486 (= call!69487 (getCurrentListMapNoExtraKeys!6585 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1060820 () Bool)

(assert (=> start!132380 (=> (not res!1060820) (not e!861926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132380 (= res!1060820 (validMask!0 mask!926))))

(assert (=> start!132380 e!861926))

(declare-fun array_inv!39015 (array!103244) Bool)

(assert (=> start!132380 (array_inv!39015 _keys!618)))

(assert (=> start!132380 tp_is_empty!37957))

(assert (=> start!132380 true))

(assert (=> start!132380 tp!111295))

(declare-fun array_inv!39016 (array!103242) Bool)

(assert (=> start!132380 (and (array_inv!39016 _values!470) e!861929)))

(declare-fun b!1548227 () Bool)

(assert (=> b!1548227 (= e!861933 tp_is_empty!37957)))

(assert (= (and start!132380 res!1060820) b!1548222))

(assert (= (and b!1548222 res!1060822) b!1548226))

(assert (= (and b!1548226 res!1060819) b!1548233))

(assert (= (and b!1548233 res!1060823) b!1548223))

(assert (= (and b!1548223 res!1060818) b!1548234))

(assert (= (and b!1548234 c!142495) b!1548228))

(assert (= (and b!1548234 (not c!142495)) b!1548224))

(assert (= (and b!1548224 c!142493) b!1548229))

(assert (= (and b!1548224 (not c!142493)) b!1548225))

(assert (= (and b!1548225 c!142494) b!1548231))

(assert (= (and b!1548225 (not c!142494)) b!1548221))

(assert (= (or b!1548231 b!1548221) bm!69484))

(assert (= (or b!1548229 bm!69484) bm!69483))

(assert (= (or b!1548229 b!1548231) bm!69482))

(assert (= (or b!1548228 bm!69483) bm!69486))

(assert (= (or b!1548228 bm!69482) bm!69485))

(assert (= (and b!1548234 res!1060821) b!1548235))

(assert (= (and b!1548235 res!1060817) b!1548232))

(assert (= (and b!1548236 condMapEmpty!58639) mapIsEmpty!58639))

(assert (= (and b!1548236 (not condMapEmpty!58639)) mapNonEmpty!58639))

(get-info :version)

(assert (= (and mapNonEmpty!58639 ((_ is ValueCellFull!18068) mapValue!58639)) b!1548227))

(assert (= (and b!1548236 ((_ is ValueCellFull!18068) mapDefault!58639)) b!1548230))

(assert (= start!132380 b!1548236))

(declare-fun m!1428213 () Bool)

(assert (=> b!1548233 m!1428213))

(declare-fun m!1428215 () Bool)

(assert (=> mapNonEmpty!58639 m!1428215))

(declare-fun m!1428217 () Bool)

(assert (=> b!1548232 m!1428217))

(declare-fun m!1428219 () Bool)

(assert (=> b!1548232 m!1428219))

(declare-fun m!1428221 () Bool)

(assert (=> b!1548232 m!1428221))

(assert (=> b!1548232 m!1428217))

(declare-fun m!1428223 () Bool)

(assert (=> b!1548232 m!1428223))

(assert (=> b!1548232 m!1428219))

(assert (=> b!1548232 m!1428219))

(declare-fun m!1428225 () Bool)

(assert (=> b!1548232 m!1428225))

(assert (=> bm!69486 m!1428223))

(declare-fun m!1428227 () Bool)

(assert (=> start!132380 m!1428227))

(declare-fun m!1428229 () Bool)

(assert (=> start!132380 m!1428229))

(declare-fun m!1428231 () Bool)

(assert (=> start!132380 m!1428231))

(assert (=> b!1548235 m!1428219))

(assert (=> b!1548235 m!1428219))

(declare-fun m!1428233 () Bool)

(assert (=> b!1548235 m!1428233))

(declare-fun m!1428235 () Bool)

(assert (=> b!1548228 m!1428235))

(declare-fun m!1428237 () Bool)

(assert (=> bm!69485 m!1428237))

(declare-fun m!1428239 () Bool)

(assert (=> b!1548226 m!1428239))

(check-sat (not b!1548228) (not b!1548233) (not start!132380) tp_is_empty!37957 (not b_next!31681) b_and!51093 (not bm!69486) (not b!1548235) (not bm!69485) (not b!1548226) (not mapNonEmpty!58639) (not b!1548232))
(check-sat b_and!51093 (not b_next!31681))
