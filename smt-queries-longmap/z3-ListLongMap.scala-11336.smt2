; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132332 () Bool)

(assert start!132332)

(declare-fun b_free!31633 () Bool)

(declare-fun b_next!31633 () Bool)

(assert (=> start!132332 (= b_free!31633 (not b_next!31633))))

(declare-fun tp!111151 () Bool)

(declare-fun b_and!51045 () Bool)

(assert (=> start!132332 (= tp!111151 b_and!51045)))

(declare-fun b!1547119 () Bool)

(declare-fun e!861307 () Bool)

(declare-fun tp_is_empty!37909 () Bool)

(assert (=> b!1547119 (= e!861307 tp_is_empty!37909)))

(declare-fun b!1547120 () Bool)

(declare-datatypes ((V!58989 0))(
  ( (V!58990 (val!19032 Int)) )
))
(declare-datatypes ((tuple2!24510 0))(
  ( (tuple2!24511 (_1!12266 (_ BitVec 64)) (_2!12266 V!58989)) )
))
(declare-datatypes ((List!36004 0))(
  ( (Nil!36001) (Cons!36000 (h!37463 tuple2!24510) (t!50690 List!36004)) )
))
(declare-datatypes ((ListLongMap!22127 0))(
  ( (ListLongMap!22128 (toList!11079 List!36004)) )
))
(declare-fun e!861303 () ListLongMap!22127)

(declare-fun call!69127 () ListLongMap!22127)

(assert (=> b!1547120 (= e!861303 call!69127)))

(declare-fun b!1547121 () Bool)

(declare-fun e!861306 () ListLongMap!22127)

(declare-fun e!861309 () ListLongMap!22127)

(assert (=> b!1547121 (= e!861306 e!861309)))

(declare-fun c!142279 () Bool)

(declare-fun lt!667080 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547121 (= c!142279 (and (not lt!667080) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547122 () Bool)

(declare-fun res!1060365 () Bool)

(declare-fun e!861304 () Bool)

(assert (=> b!1547122 (=> (not res!1060365) (not e!861304))))

(declare-datatypes ((array!103150 0))(
  ( (array!103151 (arr!49770 (Array (_ BitVec 32) (_ BitVec 64))) (size!50321 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103150)

(declare-datatypes ((List!36005 0))(
  ( (Nil!36002) (Cons!36001 (h!37464 (_ BitVec 64)) (t!50691 List!36005)) )
))
(declare-fun arrayNoDuplicates!0 (array!103150 (_ BitVec 32) List!36005) Bool)

(assert (=> b!1547122 (= res!1060365 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36002))))

(declare-fun b!1547123 () Bool)

(declare-fun e!861308 () Bool)

(declare-fun mapRes!58567 () Bool)

(assert (=> b!1547123 (= e!861308 (and e!861307 mapRes!58567))))

(declare-fun condMapEmpty!58567 () Bool)

(declare-datatypes ((ValueCell!18044 0))(
  ( (ValueCellFull!18044 (v!21825 V!58989)) (EmptyCell!18044) )
))
(declare-datatypes ((array!103152 0))(
  ( (array!103153 (arr!49771 (Array (_ BitVec 32) ValueCell!18044)) (size!50322 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103152)

(declare-fun mapDefault!58567 () ValueCell!18044)

(assert (=> b!1547123 (= condMapEmpty!58567 (= (arr!49771 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18044)) mapDefault!58567)))))

(declare-fun zeroValue!436 () V!58989)

(declare-fun call!69128 () ListLongMap!22127)

(declare-fun minValue!436 () V!58989)

(declare-fun call!69125 () ListLongMap!22127)

(declare-fun c!142278 () Bool)

(declare-fun call!69129 () ListLongMap!22127)

(declare-fun bm!69122 () Bool)

(declare-fun +!4926 (ListLongMap!22127 tuple2!24510) ListLongMap!22127)

(assert (=> bm!69122 (= call!69128 (+!4926 (ite c!142278 call!69125 (ite c!142279 call!69129 call!69127)) (ite (or c!142278 c!142279) (tuple2!24511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1060364 () Bool)

(assert (=> start!132332 (=> (not res!1060364) (not e!861304))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132332 (= res!1060364 (validMask!0 mask!926))))

(assert (=> start!132332 e!861304))

(declare-fun array_inv!38977 (array!103150) Bool)

(assert (=> start!132332 (array_inv!38977 _keys!618)))

(assert (=> start!132332 tp_is_empty!37909))

(assert (=> start!132332 true))

(assert (=> start!132332 tp!111151))

(declare-fun array_inv!38978 (array!103152) Bool)

(assert (=> start!132332 (and (array_inv!38978 _values!470) e!861308)))

(declare-fun mapNonEmpty!58567 () Bool)

(declare-fun tp!111150 () Bool)

(declare-fun e!861302 () Bool)

(assert (=> mapNonEmpty!58567 (= mapRes!58567 (and tp!111150 e!861302))))

(declare-fun mapValue!58567 () ValueCell!18044)

(declare-fun mapRest!58567 () (Array (_ BitVec 32) ValueCell!18044))

(declare-fun mapKey!58567 () (_ BitVec 32))

(assert (=> mapNonEmpty!58567 (= (arr!49771 _values!470) (store mapRest!58567 mapKey!58567 mapValue!58567))))

(declare-fun b!1547124 () Bool)

(assert (=> b!1547124 (= e!861306 (+!4926 call!69128 (tuple2!24511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69123 () Bool)

(assert (=> bm!69123 (= call!69129 call!69125)))

(declare-fun b!1547125 () Bool)

(declare-fun c!142277 () Bool)

(assert (=> b!1547125 (= c!142277 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667080))))

(assert (=> b!1547125 (= e!861309 e!861303)))

(declare-fun b!1547126 () Bool)

(declare-fun call!69126 () ListLongMap!22127)

(assert (=> b!1547126 (= e!861309 call!69126)))

(declare-fun mapIsEmpty!58567 () Bool)

(assert (=> mapIsEmpty!58567 mapRes!58567))

(declare-fun bm!69124 () Bool)

(assert (=> bm!69124 (= call!69126 call!69128)))

(declare-fun bm!69125 () Bool)

(assert (=> bm!69125 (= call!69127 call!69129)))

(declare-fun b!1547127 () Bool)

(declare-fun res!1060367 () Bool)

(assert (=> b!1547127 (=> (not res!1060367) (not e!861304))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1547127 (= res!1060367 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50321 _keys!618))))))

(declare-fun b!1547128 () Bool)

(declare-fun res!1060363 () Bool)

(assert (=> b!1547128 (=> (not res!1060363) (not e!861304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103150 (_ BitVec 32)) Bool)

(assert (=> b!1547128 (= res!1060363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1547129 () Bool)

(declare-fun res!1060366 () Bool)

(assert (=> b!1547129 (=> (not res!1060366) (not e!861304))))

(assert (=> b!1547129 (= res!1060366 (and (= (size!50322 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50321 _keys!618) (size!50322 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547130 () Bool)

(assert (=> b!1547130 (= e!861303 call!69126)))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69126 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6564 (array!103150 array!103152 (_ BitVec 32) (_ BitVec 32) V!58989 V!58989 (_ BitVec 32) Int) ListLongMap!22127)

(assert (=> bm!69126 (= call!69125 (getCurrentListMapNoExtraKeys!6564 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547131 () Bool)

(assert (=> b!1547131 (= e!861302 tp_is_empty!37909)))

(declare-fun b!1547132 () Bool)

(assert (=> b!1547132 (= e!861304 false)))

(declare-fun lt!667081 () ListLongMap!22127)

(assert (=> b!1547132 (= lt!667081 e!861306)))

(assert (=> b!1547132 (= c!142278 (and (not lt!667080) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547132 (= lt!667080 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!132332 res!1060364) b!1547129))

(assert (= (and b!1547129 res!1060366) b!1547128))

(assert (= (and b!1547128 res!1060363) b!1547122))

(assert (= (and b!1547122 res!1060365) b!1547127))

(assert (= (and b!1547127 res!1060367) b!1547132))

(assert (= (and b!1547132 c!142278) b!1547124))

(assert (= (and b!1547132 (not c!142278)) b!1547121))

(assert (= (and b!1547121 c!142279) b!1547126))

(assert (= (and b!1547121 (not c!142279)) b!1547125))

(assert (= (and b!1547125 c!142277) b!1547130))

(assert (= (and b!1547125 (not c!142277)) b!1547120))

(assert (= (or b!1547130 b!1547120) bm!69125))

(assert (= (or b!1547126 bm!69125) bm!69123))

(assert (= (or b!1547126 b!1547130) bm!69124))

(assert (= (or b!1547124 bm!69123) bm!69126))

(assert (= (or b!1547124 bm!69124) bm!69122))

(assert (= (and b!1547123 condMapEmpty!58567) mapIsEmpty!58567))

(assert (= (and b!1547123 (not condMapEmpty!58567)) mapNonEmpty!58567))

(get-info :version)

(assert (= (and mapNonEmpty!58567 ((_ is ValueCellFull!18044) mapValue!58567)) b!1547131))

(assert (= (and b!1547123 ((_ is ValueCellFull!18044) mapDefault!58567)) b!1547119))

(assert (= start!132332 b!1547123))

(declare-fun m!1427643 () Bool)

(assert (=> start!132332 m!1427643))

(declare-fun m!1427645 () Bool)

(assert (=> start!132332 m!1427645))

(declare-fun m!1427647 () Bool)

(assert (=> start!132332 m!1427647))

(declare-fun m!1427649 () Bool)

(assert (=> b!1547124 m!1427649))

(declare-fun m!1427651 () Bool)

(assert (=> bm!69126 m!1427651))

(declare-fun m!1427653 () Bool)

(assert (=> b!1547122 m!1427653))

(declare-fun m!1427655 () Bool)

(assert (=> mapNonEmpty!58567 m!1427655))

(declare-fun m!1427657 () Bool)

(assert (=> b!1547128 m!1427657))

(declare-fun m!1427659 () Bool)

(assert (=> bm!69122 m!1427659))

(check-sat tp_is_empty!37909 (not bm!69122) b_and!51045 (not b!1547122) (not b_next!31633) (not bm!69126) (not b!1547128) (not mapNonEmpty!58567) (not b!1547124) (not start!132332))
(check-sat b_and!51045 (not b_next!31633))
