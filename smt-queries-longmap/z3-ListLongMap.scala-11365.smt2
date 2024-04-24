; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132506 () Bool)

(assert start!132506)

(declare-fun b_free!31807 () Bool)

(declare-fun b_next!31807 () Bool)

(assert (=> start!132506 (= b_free!31807 (not b_next!31807))))

(declare-fun tp!111672 () Bool)

(declare-fun b_and!51219 () Bool)

(assert (=> start!132506 (= tp!111672 b_and!51219)))

(declare-fun b!1551245 () Bool)

(declare-fun e!863628 () Bool)

(declare-fun tp_is_empty!38083 () Bool)

(assert (=> b!1551245 (= e!863628 tp_is_empty!38083)))

(declare-fun b!1551246 () Bool)

(declare-fun res!1062143 () Bool)

(declare-fun e!863634 () Bool)

(assert (=> b!1551246 (=> (not res!1062143) (not e!863634))))

(declare-datatypes ((array!103490 0))(
  ( (array!103491 (arr!49940 (Array (_ BitVec 32) (_ BitVec 64))) (size!50491 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103490)

(declare-datatypes ((List!36145 0))(
  ( (Nil!36142) (Cons!36141 (h!37604 (_ BitVec 64)) (t!50831 List!36145)) )
))
(declare-fun arrayNoDuplicates!0 (array!103490 (_ BitVec 32) List!36145) Bool)

(assert (=> b!1551246 (= res!1062143 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36142))))

(declare-fun bm!70427 () Bool)

(declare-datatypes ((V!59221 0))(
  ( (V!59222 (val!19119 Int)) )
))
(declare-datatypes ((tuple2!24676 0))(
  ( (tuple2!24677 (_1!12349 (_ BitVec 64)) (_2!12349 V!59221)) )
))
(declare-datatypes ((List!36146 0))(
  ( (Nil!36143) (Cons!36142 (h!37605 tuple2!24676) (t!50832 List!36146)) )
))
(declare-datatypes ((ListLongMap!22293 0))(
  ( (ListLongMap!22294 (toList!11162 List!36146)) )
))
(declare-fun call!70434 () ListLongMap!22293)

(declare-fun call!70432 () ListLongMap!22293)

(assert (=> bm!70427 (= call!70434 call!70432)))

(declare-fun mapIsEmpty!58828 () Bool)

(declare-fun mapRes!58828 () Bool)

(assert (=> mapIsEmpty!58828 mapRes!58828))

(declare-fun b!1551247 () Bool)

(declare-fun e!863627 () ListLongMap!22293)

(declare-fun e!863631 () ListLongMap!22293)

(assert (=> b!1551247 (= e!863627 e!863631)))

(declare-fun c!143061 () Bool)

(declare-fun lt!668409 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551247 (= c!143061 (and (not lt!668409) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551248 () Bool)

(assert (=> b!1551248 (= e!863631 call!70434)))

(declare-fun mapNonEmpty!58828 () Bool)

(declare-fun tp!111673 () Bool)

(declare-fun e!863633 () Bool)

(assert (=> mapNonEmpty!58828 (= mapRes!58828 (and tp!111673 e!863633))))

(declare-fun mapKey!58828 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18131 0))(
  ( (ValueCellFull!18131 (v!21912 V!59221)) (EmptyCell!18131) )
))
(declare-fun mapRest!58828 () (Array (_ BitVec 32) ValueCell!18131))

(declare-datatypes ((array!103492 0))(
  ( (array!103493 (arr!49941 (Array (_ BitVec 32) ValueCell!18131)) (size!50492 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103492)

(declare-fun mapValue!58828 () ValueCell!18131)

(assert (=> mapNonEmpty!58828 (= (arr!49941 _values!470) (store mapRest!58828 mapKey!58828 mapValue!58828))))

(declare-fun b!1551249 () Bool)

(declare-fun e!863626 () ListLongMap!22293)

(assert (=> b!1551249 (= e!863626 call!70434)))

(declare-fun b!1551250 () Bool)

(declare-fun e!863629 () Bool)

(assert (=> b!1551250 (= e!863629 (and e!863628 mapRes!58828))))

(declare-fun condMapEmpty!58828 () Bool)

(declare-fun mapDefault!58828 () ValueCell!18131)

(assert (=> b!1551250 (= condMapEmpty!58828 (= (arr!49941 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18131)) mapDefault!58828)))))

(declare-fun b!1551251 () Bool)

(declare-fun res!1062140 () Bool)

(assert (=> b!1551251 (=> (not res!1062140) (not e!863634))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103490 (_ BitVec 32)) Bool)

(assert (=> b!1551251 (= res!1062140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551252 () Bool)

(declare-fun res!1062146 () Bool)

(declare-fun e!863630 () Bool)

(assert (=> b!1551252 (=> (not res!1062146) (not e!863630))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551252 (= res!1062146 (validKeyInArray!0 (select (arr!49940 _keys!618) from!762)))))

(declare-fun res!1062142 () Bool)

(assert (=> start!132506 (=> (not res!1062142) (not e!863634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132506 (= res!1062142 (validMask!0 mask!926))))

(assert (=> start!132506 e!863634))

(declare-fun array_inv!39095 (array!103490) Bool)

(assert (=> start!132506 (array_inv!39095 _keys!618)))

(assert (=> start!132506 tp_is_empty!38083))

(assert (=> start!132506 true))

(assert (=> start!132506 tp!111672))

(declare-fun array_inv!39096 (array!103492) Bool)

(assert (=> start!132506 (and (array_inv!39096 _values!470) e!863629)))

(declare-fun b!1551253 () Bool)

(declare-fun c!143060 () Bool)

(assert (=> b!1551253 (= c!143060 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668409))))

(assert (=> b!1551253 (= e!863631 e!863626)))

(declare-fun bm!70428 () Bool)

(declare-fun call!70431 () ListLongMap!22293)

(declare-fun call!70433 () ListLongMap!22293)

(assert (=> bm!70428 (= call!70431 call!70433)))

(declare-fun zeroValue!436 () V!59221)

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!59221)

(declare-fun bm!70429 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6634 (array!103490 array!103492 (_ BitVec 32) (_ BitVec 32) V!59221 V!59221 (_ BitVec 32) Int) ListLongMap!22293)

(assert (=> bm!70429 (= call!70433 (getCurrentListMapNoExtraKeys!6634 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551254 () Bool)

(declare-fun res!1062145 () Bool)

(assert (=> b!1551254 (=> (not res!1062145) (not e!863634))))

(assert (=> b!1551254 (= res!1062145 (and (= (size!50492 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50491 _keys!618) (size!50492 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551255 () Bool)

(assert (=> b!1551255 (= e!863633 tp_is_empty!38083)))

(declare-fun b!1551256 () Bool)

(assert (=> b!1551256 (= e!863634 e!863630)))

(declare-fun res!1062141 () Bool)

(assert (=> b!1551256 (=> (not res!1062141) (not e!863630))))

(assert (=> b!1551256 (= res!1062141 (bvslt from!762 (size!50491 _keys!618)))))

(declare-fun lt!668408 () ListLongMap!22293)

(assert (=> b!1551256 (= lt!668408 e!863627)))

(declare-fun c!143062 () Bool)

(assert (=> b!1551256 (= c!143062 (and (not lt!668409) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551256 (= lt!668409 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551257 () Bool)

(declare-fun res!1062144 () Bool)

(assert (=> b!1551257 (=> (not res!1062144) (not e!863634))))

(assert (=> b!1551257 (= res!1062144 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50491 _keys!618))))))

(declare-fun b!1551258 () Bool)

(declare-fun call!70430 () ListLongMap!22293)

(assert (=> b!1551258 (= e!863626 call!70430)))

(declare-fun b!1551259 () Bool)

(assert (=> b!1551259 (= e!863630 (not true))))

(declare-fun lt!668415 () ListLongMap!22293)

(declare-fun lt!668414 () V!59221)

(declare-fun apply!1082 (ListLongMap!22293 (_ BitVec 64)) V!59221)

(assert (=> b!1551259 (= (apply!1082 lt!668415 (select (arr!49940 _keys!618) from!762)) lt!668414)))

(declare-datatypes ((Unit!51529 0))(
  ( (Unit!51530) )
))
(declare-fun lt!668416 () Unit!51529)

(declare-fun lt!668413 () ListLongMap!22293)

(declare-fun addApplyDifferent!611 (ListLongMap!22293 (_ BitVec 64) V!59221 (_ BitVec 64)) Unit!51529)

(assert (=> b!1551259 (= lt!668416 (addApplyDifferent!611 lt!668413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49940 _keys!618) from!762)))))

(declare-fun lt!668412 () V!59221)

(assert (=> b!1551259 (= lt!668412 lt!668414)))

(assert (=> b!1551259 (= lt!668414 (apply!1082 lt!668413 (select (arr!49940 _keys!618) from!762)))))

(declare-fun +!5002 (ListLongMap!22293 tuple2!24676) ListLongMap!22293)

(assert (=> b!1551259 (= lt!668412 (apply!1082 (+!5002 lt!668413 (tuple2!24677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49940 _keys!618) from!762)))))

(declare-fun lt!668411 () Unit!51529)

(assert (=> b!1551259 (= lt!668411 (addApplyDifferent!611 lt!668413 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49940 _keys!618) from!762)))))

(declare-fun contains!10130 (ListLongMap!22293 (_ BitVec 64)) Bool)

(assert (=> b!1551259 (contains!10130 lt!668415 (select (arr!49940 _keys!618) from!762))))

(assert (=> b!1551259 (= lt!668415 (+!5002 lt!668413 (tuple2!24677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668410 () Unit!51529)

(declare-fun addStillContains!1272 (ListLongMap!22293 (_ BitVec 64) V!59221 (_ BitVec 64)) Unit!51529)

(assert (=> b!1551259 (= lt!668410 (addStillContains!1272 lt!668413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49940 _keys!618) from!762)))))

(assert (=> b!1551259 (= lt!668413 (getCurrentListMapNoExtraKeys!6634 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70430 () Bool)

(assert (=> bm!70430 (= call!70430 call!70431)))

(declare-fun b!1551260 () Bool)

(assert (=> b!1551260 (= e!863627 (+!5002 call!70432 (tuple2!24677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70431 () Bool)

(assert (=> bm!70431 (= call!70432 (+!5002 (ite c!143062 call!70433 (ite c!143061 call!70431 call!70430)) (ite (or c!143062 c!143061) (tuple2!24677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and start!132506 res!1062142) b!1551254))

(assert (= (and b!1551254 res!1062145) b!1551251))

(assert (= (and b!1551251 res!1062140) b!1551246))

(assert (= (and b!1551246 res!1062143) b!1551257))

(assert (= (and b!1551257 res!1062144) b!1551256))

(assert (= (and b!1551256 c!143062) b!1551260))

(assert (= (and b!1551256 (not c!143062)) b!1551247))

(assert (= (and b!1551247 c!143061) b!1551248))

(assert (= (and b!1551247 (not c!143061)) b!1551253))

(assert (= (and b!1551253 c!143060) b!1551249))

(assert (= (and b!1551253 (not c!143060)) b!1551258))

(assert (= (or b!1551249 b!1551258) bm!70430))

(assert (= (or b!1551248 bm!70430) bm!70428))

(assert (= (or b!1551248 b!1551249) bm!70427))

(assert (= (or b!1551260 bm!70428) bm!70429))

(assert (= (or b!1551260 bm!70427) bm!70431))

(assert (= (and b!1551256 res!1062141) b!1551252))

(assert (= (and b!1551252 res!1062146) b!1551259))

(assert (= (and b!1551250 condMapEmpty!58828) mapIsEmpty!58828))

(assert (= (and b!1551250 (not condMapEmpty!58828)) mapNonEmpty!58828))

(get-info :version)

(assert (= (and mapNonEmpty!58828 ((_ is ValueCellFull!18131) mapValue!58828)) b!1551255))

(assert (= (and b!1551250 ((_ is ValueCellFull!18131) mapDefault!58828)) b!1551245))

(assert (= start!132506 b!1551250))

(declare-fun m!1430409 () Bool)

(assert (=> mapNonEmpty!58828 m!1430409))

(declare-fun m!1430411 () Bool)

(assert (=> b!1551252 m!1430411))

(assert (=> b!1551252 m!1430411))

(declare-fun m!1430413 () Bool)

(assert (=> b!1551252 m!1430413))

(declare-fun m!1430415 () Bool)

(assert (=> b!1551251 m!1430415))

(declare-fun m!1430417 () Bool)

(assert (=> bm!70431 m!1430417))

(declare-fun m!1430419 () Bool)

(assert (=> b!1551260 m!1430419))

(declare-fun m!1430421 () Bool)

(assert (=> b!1551246 m!1430421))

(declare-fun m!1430423 () Bool)

(assert (=> start!132506 m!1430423))

(declare-fun m!1430425 () Bool)

(assert (=> start!132506 m!1430425))

(declare-fun m!1430427 () Bool)

(assert (=> start!132506 m!1430427))

(declare-fun m!1430429 () Bool)

(assert (=> b!1551259 m!1430429))

(assert (=> b!1551259 m!1430411))

(declare-fun m!1430431 () Bool)

(assert (=> b!1551259 m!1430431))

(declare-fun m!1430433 () Bool)

(assert (=> b!1551259 m!1430433))

(assert (=> b!1551259 m!1430411))

(assert (=> b!1551259 m!1430429))

(assert (=> b!1551259 m!1430411))

(declare-fun m!1430435 () Bool)

(assert (=> b!1551259 m!1430435))

(assert (=> b!1551259 m!1430411))

(declare-fun m!1430437 () Bool)

(assert (=> b!1551259 m!1430437))

(assert (=> b!1551259 m!1430411))

(declare-fun m!1430439 () Bool)

(assert (=> b!1551259 m!1430439))

(assert (=> b!1551259 m!1430411))

(declare-fun m!1430441 () Bool)

(assert (=> b!1551259 m!1430441))

(assert (=> b!1551259 m!1430411))

(declare-fun m!1430443 () Bool)

(assert (=> b!1551259 m!1430443))

(declare-fun m!1430445 () Bool)

(assert (=> b!1551259 m!1430445))

(assert (=> b!1551259 m!1430411))

(declare-fun m!1430447 () Bool)

(assert (=> b!1551259 m!1430447))

(assert (=> bm!70429 m!1430433))

(check-sat (not b!1551259) (not b!1551251) (not bm!70431) b_and!51219 tp_is_empty!38083 (not b!1551246) (not b!1551252) (not start!132506) (not bm!70429) (not mapNonEmpty!58828) (not b!1551260) (not b_next!31807))
(check-sat b_and!51219 (not b_next!31807))
