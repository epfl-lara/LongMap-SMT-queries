; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132056 () Bool)

(assert start!132056)

(declare-fun b_free!31819 () Bool)

(declare-fun b_next!31819 () Bool)

(assert (=> start!132056 (= b_free!31819 (not b_next!31819))))

(declare-fun tp!111710 () Bool)

(declare-fun b_and!51211 () Bool)

(assert (=> start!132056 (= tp!111710 b_and!51211)))

(declare-fun bm!70332 () Bool)

(declare-datatypes ((V!59237 0))(
  ( (V!59238 (val!19125 Int)) )
))
(declare-datatypes ((tuple2!24702 0))(
  ( (tuple2!24703 (_1!12362 (_ BitVec 64)) (_2!12362 V!59237)) )
))
(declare-datatypes ((List!36163 0))(
  ( (Nil!36160) (Cons!36159 (h!37605 tuple2!24702) (t!50849 List!36163)) )
))
(declare-datatypes ((ListLongMap!22311 0))(
  ( (ListLongMap!22312 (toList!11171 List!36163)) )
))
(declare-fun call!70337 () ListLongMap!22311)

(declare-fun call!70338 () ListLongMap!22311)

(assert (=> bm!70332 (= call!70337 call!70338)))

(declare-fun b!1548784 () Bool)

(declare-fun res!1061283 () Bool)

(declare-fun e!862084 () Bool)

(assert (=> b!1548784 (=> (not res!1061283) (not e!862084))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103314 0))(
  ( (array!103315 (arr!49860 (Array (_ BitVec 32) (_ BitVec 64))) (size!50412 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103314)

(assert (=> b!1548784 (= res!1061283 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50412 _keys!618))))))

(declare-fun b!1548785 () Bool)

(declare-fun e!862089 () Bool)

(declare-fun tp_is_empty!38095 () Bool)

(assert (=> b!1548785 (= e!862089 tp_is_empty!38095)))

(declare-fun b!1548786 () Bool)

(declare-fun e!862085 () Bool)

(assert (=> b!1548786 (= e!862084 e!862085)))

(declare-fun res!1061279 () Bool)

(assert (=> b!1548786 (=> (not res!1061279) (not e!862085))))

(assert (=> b!1548786 (= res!1061279 (bvslt from!762 (size!50412 _keys!618)))))

(declare-fun lt!667380 () ListLongMap!22311)

(declare-fun e!862086 () ListLongMap!22311)

(assert (=> b!1548786 (= lt!667380 e!862086)))

(declare-fun c!142226 () Bool)

(declare-fun lt!667383 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1548786 (= c!142226 (and (not lt!667383) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548786 (= lt!667383 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70333 () Bool)

(declare-fun call!70336 () ListLongMap!22311)

(assert (=> bm!70333 (= call!70338 call!70336)))

(declare-fun b!1548787 () Bool)

(declare-fun e!862081 () ListLongMap!22311)

(assert (=> b!1548787 (= e!862081 call!70337)))

(declare-fun bm!70334 () Bool)

(declare-fun call!70335 () ListLongMap!22311)

(declare-fun call!70339 () ListLongMap!22311)

(assert (=> bm!70334 (= call!70335 call!70339)))

(declare-fun mapNonEmpty!58846 () Bool)

(declare-fun mapRes!58846 () Bool)

(declare-fun tp!111709 () Bool)

(declare-fun e!862083 () Bool)

(assert (=> mapNonEmpty!58846 (= mapRes!58846 (and tp!111709 e!862083))))

(declare-datatypes ((ValueCell!18137 0))(
  ( (ValueCellFull!18137 (v!21922 V!59237)) (EmptyCell!18137) )
))
(declare-fun mapValue!58846 () ValueCell!18137)

(declare-datatypes ((array!103316 0))(
  ( (array!103317 (arr!49861 (Array (_ BitVec 32) ValueCell!18137)) (size!50413 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103316)

(declare-fun mapRest!58846 () (Array (_ BitVec 32) ValueCell!18137))

(declare-fun mapKey!58846 () (_ BitVec 32))

(assert (=> mapNonEmpty!58846 (= (arr!49861 _values!470) (store mapRest!58846 mapKey!58846 mapValue!58846))))

(declare-fun b!1548788 () Bool)

(assert (=> b!1548788 (= e!862085 (not true))))

(declare-fun lt!667379 () ListLongMap!22311)

(declare-fun lt!667376 () V!59237)

(declare-fun apply!1069 (ListLongMap!22311 (_ BitVec 64)) V!59237)

(assert (=> b!1548788 (= (apply!1069 lt!667379 (select (arr!49860 _keys!618) from!762)) lt!667376)))

(declare-datatypes ((Unit!51435 0))(
  ( (Unit!51436) )
))
(declare-fun lt!667378 () Unit!51435)

(declare-fun zeroValue!436 () V!59237)

(declare-fun lt!667381 () ListLongMap!22311)

(declare-fun addApplyDifferent!607 (ListLongMap!22311 (_ BitVec 64) V!59237 (_ BitVec 64)) Unit!51435)

(assert (=> b!1548788 (= lt!667378 (addApplyDifferent!607 lt!667381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49860 _keys!618) from!762)))))

(declare-fun lt!667377 () V!59237)

(assert (=> b!1548788 (= lt!667377 lt!667376)))

(assert (=> b!1548788 (= lt!667376 (apply!1069 lt!667381 (select (arr!49860 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59237)

(declare-fun +!4990 (ListLongMap!22311 tuple2!24702) ListLongMap!22311)

(assert (=> b!1548788 (= lt!667377 (apply!1069 (+!4990 lt!667381 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49860 _keys!618) from!762)))))

(declare-fun lt!667384 () Unit!51435)

(assert (=> b!1548788 (= lt!667384 (addApplyDifferent!607 lt!667381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49860 _keys!618) from!762)))))

(declare-fun contains!10044 (ListLongMap!22311 (_ BitVec 64)) Bool)

(assert (=> b!1548788 (contains!10044 lt!667379 (select (arr!49860 _keys!618) from!762))))

(assert (=> b!1548788 (= lt!667379 (+!4990 lt!667381 (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667382 () Unit!51435)

(declare-fun addStillContains!1267 (ListLongMap!22311 (_ BitVec 64) V!59237 (_ BitVec 64)) Unit!51435)

(assert (=> b!1548788 (= lt!667382 (addStillContains!1267 lt!667381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49860 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6618 (array!103314 array!103316 (_ BitVec 32) (_ BitVec 32) V!59237 V!59237 (_ BitVec 32) Int) ListLongMap!22311)

(assert (=> b!1548788 (= lt!667381 (getCurrentListMapNoExtraKeys!6618 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1061280 () Bool)

(assert (=> start!132056 (=> (not res!1061280) (not e!862084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132056 (= res!1061280 (validMask!0 mask!926))))

(assert (=> start!132056 e!862084))

(declare-fun array_inv!38973 (array!103314) Bool)

(assert (=> start!132056 (array_inv!38973 _keys!618)))

(assert (=> start!132056 tp_is_empty!38095))

(assert (=> start!132056 true))

(assert (=> start!132056 tp!111710))

(declare-fun e!862088 () Bool)

(declare-fun array_inv!38974 (array!103316) Bool)

(assert (=> start!132056 (and (array_inv!38974 _values!470) e!862088)))

(declare-fun b!1548789 () Bool)

(declare-fun res!1061278 () Bool)

(assert (=> b!1548789 (=> (not res!1061278) (not e!862084))))

(declare-datatypes ((List!36164 0))(
  ( (Nil!36161) (Cons!36160 (h!37606 (_ BitVec 64)) (t!50850 List!36164)) )
))
(declare-fun arrayNoDuplicates!0 (array!103314 (_ BitVec 32) List!36164) Bool)

(assert (=> b!1548789 (= res!1061278 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36161))))

(declare-fun b!1548790 () Bool)

(assert (=> b!1548790 (= e!862086 (+!4990 call!70339 (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548791 () Bool)

(assert (=> b!1548791 (= e!862088 (and e!862089 mapRes!58846))))

(declare-fun condMapEmpty!58846 () Bool)

(declare-fun mapDefault!58846 () ValueCell!18137)

(assert (=> b!1548791 (= condMapEmpty!58846 (= (arr!49861 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18137)) mapDefault!58846)))))

(declare-fun b!1548792 () Bool)

(declare-fun res!1061282 () Bool)

(assert (=> b!1548792 (=> (not res!1061282) (not e!862084))))

(assert (=> b!1548792 (= res!1061282 (and (= (size!50413 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50412 _keys!618) (size!50413 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548793 () Bool)

(declare-fun c!142225 () Bool)

(assert (=> b!1548793 (= c!142225 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667383))))

(declare-fun e!862087 () ListLongMap!22311)

(assert (=> b!1548793 (= e!862087 e!862081)))

(declare-fun b!1548794 () Bool)

(assert (=> b!1548794 (= e!862083 tp_is_empty!38095)))

(declare-fun mapIsEmpty!58846 () Bool)

(assert (=> mapIsEmpty!58846 mapRes!58846))

(declare-fun b!1548795 () Bool)

(assert (=> b!1548795 (= e!862087 call!70335)))

(declare-fun bm!70335 () Bool)

(assert (=> bm!70335 (= call!70336 (getCurrentListMapNoExtraKeys!6618 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548796 () Bool)

(declare-fun res!1061277 () Bool)

(assert (=> b!1548796 (=> (not res!1061277) (not e!862084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103314 (_ BitVec 32)) Bool)

(assert (=> b!1548796 (= res!1061277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548797 () Bool)

(assert (=> b!1548797 (= e!862081 call!70335)))

(declare-fun b!1548798 () Bool)

(assert (=> b!1548798 (= e!862086 e!862087)))

(declare-fun c!142227 () Bool)

(assert (=> b!1548798 (= c!142227 (and (not lt!667383) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70336 () Bool)

(assert (=> bm!70336 (= call!70339 (+!4990 (ite c!142226 call!70336 (ite c!142227 call!70338 call!70337)) (ite (or c!142226 c!142227) (tuple2!24703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548799 () Bool)

(declare-fun res!1061281 () Bool)

(assert (=> b!1548799 (=> (not res!1061281) (not e!862085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548799 (= res!1061281 (validKeyInArray!0 (select (arr!49860 _keys!618) from!762)))))

(assert (= (and start!132056 res!1061280) b!1548792))

(assert (= (and b!1548792 res!1061282) b!1548796))

(assert (= (and b!1548796 res!1061277) b!1548789))

(assert (= (and b!1548789 res!1061278) b!1548784))

(assert (= (and b!1548784 res!1061283) b!1548786))

(assert (= (and b!1548786 c!142226) b!1548790))

(assert (= (and b!1548786 (not c!142226)) b!1548798))

(assert (= (and b!1548798 c!142227) b!1548795))

(assert (= (and b!1548798 (not c!142227)) b!1548793))

(assert (= (and b!1548793 c!142225) b!1548797))

(assert (= (and b!1548793 (not c!142225)) b!1548787))

(assert (= (or b!1548797 b!1548787) bm!70332))

(assert (= (or b!1548795 bm!70332) bm!70333))

(assert (= (or b!1548795 b!1548797) bm!70334))

(assert (= (or b!1548790 bm!70333) bm!70335))

(assert (= (or b!1548790 bm!70334) bm!70336))

(assert (= (and b!1548786 res!1061279) b!1548799))

(assert (= (and b!1548799 res!1061281) b!1548788))

(assert (= (and b!1548791 condMapEmpty!58846) mapIsEmpty!58846))

(assert (= (and b!1548791 (not condMapEmpty!58846)) mapNonEmpty!58846))

(get-info :version)

(assert (= (and mapNonEmpty!58846 ((_ is ValueCellFull!18137) mapValue!58846)) b!1548794))

(assert (= (and b!1548791 ((_ is ValueCellFull!18137) mapDefault!58846)) b!1548785))

(assert (= start!132056 b!1548791))

(declare-fun m!1427499 () Bool)

(assert (=> b!1548799 m!1427499))

(assert (=> b!1548799 m!1427499))

(declare-fun m!1427501 () Bool)

(assert (=> b!1548799 m!1427501))

(declare-fun m!1427503 () Bool)

(assert (=> b!1548788 m!1427503))

(assert (=> b!1548788 m!1427499))

(assert (=> b!1548788 m!1427499))

(declare-fun m!1427505 () Bool)

(assert (=> b!1548788 m!1427505))

(assert (=> b!1548788 m!1427499))

(declare-fun m!1427507 () Bool)

(assert (=> b!1548788 m!1427507))

(declare-fun m!1427509 () Bool)

(assert (=> b!1548788 m!1427509))

(assert (=> b!1548788 m!1427499))

(declare-fun m!1427511 () Bool)

(assert (=> b!1548788 m!1427511))

(assert (=> b!1548788 m!1427509))

(assert (=> b!1548788 m!1427499))

(declare-fun m!1427513 () Bool)

(assert (=> b!1548788 m!1427513))

(declare-fun m!1427515 () Bool)

(assert (=> b!1548788 m!1427515))

(assert (=> b!1548788 m!1427499))

(declare-fun m!1427517 () Bool)

(assert (=> b!1548788 m!1427517))

(assert (=> b!1548788 m!1427499))

(declare-fun m!1427519 () Bool)

(assert (=> b!1548788 m!1427519))

(assert (=> b!1548788 m!1427499))

(declare-fun m!1427521 () Bool)

(assert (=> b!1548788 m!1427521))

(assert (=> bm!70335 m!1427503))

(declare-fun m!1427523 () Bool)

(assert (=> start!132056 m!1427523))

(declare-fun m!1427525 () Bool)

(assert (=> start!132056 m!1427525))

(declare-fun m!1427527 () Bool)

(assert (=> start!132056 m!1427527))

(declare-fun m!1427529 () Bool)

(assert (=> mapNonEmpty!58846 m!1427529))

(declare-fun m!1427531 () Bool)

(assert (=> b!1548796 m!1427531))

(declare-fun m!1427533 () Bool)

(assert (=> bm!70336 m!1427533))

(declare-fun m!1427535 () Bool)

(assert (=> b!1548790 m!1427535))

(declare-fun m!1427537 () Bool)

(assert (=> b!1548789 m!1427537))

(check-sat (not b!1548790) tp_is_empty!38095 (not b!1548788) (not b!1548799) (not mapNonEmpty!58846) (not b_next!31819) (not b!1548796) (not bm!70336) (not bm!70335) (not b!1548789) b_and!51211 (not start!132056))
(check-sat b_and!51211 (not b_next!31819))
