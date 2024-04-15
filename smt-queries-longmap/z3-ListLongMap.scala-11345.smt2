; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131924 () Bool)

(assert start!131924)

(declare-fun b_free!31687 () Bool)

(declare-fun b_next!31687 () Bool)

(assert (=> start!131924 (= b_free!31687 (not b_next!31687))))

(declare-fun tp!111314 () Bool)

(declare-fun b_and!51079 () Bool)

(assert (=> start!131924 (= tp!111314 b_and!51079)))

(declare-fun b!1545616 () Bool)

(declare-datatypes ((V!59061 0))(
  ( (V!59062 (val!19059 Int)) )
))
(declare-datatypes ((tuple2!24576 0))(
  ( (tuple2!24577 (_1!12299 (_ BitVec 64)) (_2!12299 V!59061)) )
))
(declare-datatypes ((List!36052 0))(
  ( (Nil!36049) (Cons!36048 (h!37494 tuple2!24576) (t!50738 List!36052)) )
))
(declare-datatypes ((ListLongMap!22185 0))(
  ( (ListLongMap!22186 (toList!11108 List!36052)) )
))
(declare-fun e!860301 () ListLongMap!22185)

(declare-fun call!69349 () ListLongMap!22185)

(assert (=> b!1545616 (= e!860301 call!69349)))

(declare-fun b!1545617 () Bool)

(declare-fun c!141632 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666153 () Bool)

(assert (=> b!1545617 (= c!141632 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666153))))

(declare-fun e!860303 () ListLongMap!22185)

(assert (=> b!1545617 (= e!860301 e!860303)))

(declare-fun b!1545618 () Bool)

(declare-fun res!1059893 () Bool)

(declare-fun e!860307 () Bool)

(assert (=> b!1545618 (=> (not res!1059893) (not e!860307))))

(declare-datatypes ((array!103060 0))(
  ( (array!103061 (arr!49733 (Array (_ BitVec 32) (_ BitVec 64))) (size!50285 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103060)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18071 0))(
  ( (ValueCellFull!18071 (v!21856 V!59061)) (EmptyCell!18071) )
))
(declare-datatypes ((array!103062 0))(
  ( (array!103063 (arr!49734 (Array (_ BitVec 32) ValueCell!18071)) (size!50286 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103062)

(assert (=> b!1545618 (= res!1059893 (and (= (size!50286 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50285 _keys!618) (size!50286 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545619 () Bool)

(declare-fun e!860305 () Bool)

(declare-fun tp_is_empty!37963 () Bool)

(assert (=> b!1545619 (= e!860305 tp_is_empty!37963)))

(declare-fun b!1545620 () Bool)

(declare-fun e!860302 () Bool)

(assert (=> b!1545620 (= e!860302 tp_is_empty!37963)))

(declare-fun b!1545621 () Bool)

(declare-fun e!860304 () ListLongMap!22185)

(assert (=> b!1545621 (= e!860304 e!860301)))

(declare-fun c!141633 () Bool)

(assert (=> b!1545621 (= c!141633 (and (not lt!666153) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545622 () Bool)

(declare-fun res!1059897 () Bool)

(assert (=> b!1545622 (=> (not res!1059897) (not e!860307))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1545622 (= res!1059897 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50285 _keys!618))))))

(declare-fun bm!69342 () Bool)

(declare-fun zeroValue!436 () V!59061)

(declare-fun defaultEntry!478 () Int)

(declare-fun call!69348 () ListLongMap!22185)

(declare-fun minValue!436 () V!59061)

(declare-fun getCurrentListMapNoExtraKeys!6564 (array!103060 array!103062 (_ BitVec 32) (_ BitVec 32) V!59061 V!59061 (_ BitVec 32) Int) ListLongMap!22185)

(assert (=> bm!69342 (= call!69348 (getCurrentListMapNoExtraKeys!6564 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545623 () Bool)

(declare-fun res!1059895 () Bool)

(assert (=> b!1545623 (=> (not res!1059895) (not e!860307))))

(declare-datatypes ((List!36053 0))(
  ( (Nil!36050) (Cons!36049 (h!37495 (_ BitVec 64)) (t!50739 List!36053)) )
))
(declare-fun arrayNoDuplicates!0 (array!103060 (_ BitVec 32) List!36053) Bool)

(assert (=> b!1545623 (= res!1059895 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36050))))

(declare-fun b!1545624 () Bool)

(declare-fun res!1059894 () Bool)

(declare-fun e!860306 () Bool)

(assert (=> b!1545624 (=> (not res!1059894) (not e!860306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545624 (= res!1059894 (validKeyInArray!0 (select (arr!49733 _keys!618) from!762)))))

(declare-fun res!1059891 () Bool)

(assert (=> start!131924 (=> (not res!1059891) (not e!860307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131924 (= res!1059891 (validMask!0 mask!926))))

(assert (=> start!131924 e!860307))

(declare-fun array_inv!38875 (array!103060) Bool)

(assert (=> start!131924 (array_inv!38875 _keys!618)))

(assert (=> start!131924 tp_is_empty!37963))

(assert (=> start!131924 true))

(assert (=> start!131924 tp!111314))

(declare-fun e!860300 () Bool)

(declare-fun array_inv!38876 (array!103062) Bool)

(assert (=> start!131924 (and (array_inv!38876 _values!470) e!860300)))

(declare-fun b!1545625 () Bool)

(declare-fun mapRes!58648 () Bool)

(assert (=> b!1545625 (= e!860300 (and e!860305 mapRes!58648))))

(declare-fun condMapEmpty!58648 () Bool)

(declare-fun mapDefault!58648 () ValueCell!18071)

(assert (=> b!1545625 (= condMapEmpty!58648 (= (arr!49734 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18071)) mapDefault!58648)))))

(declare-fun b!1545626 () Bool)

(declare-fun res!1059896 () Bool)

(assert (=> b!1545626 (=> (not res!1059896) (not e!860307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103060 (_ BitVec 32)) Bool)

(assert (=> b!1545626 (= res!1059896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545627 () Bool)

(assert (=> b!1545627 (= e!860307 e!860306)))

(declare-fun res!1059892 () Bool)

(assert (=> b!1545627 (=> (not res!1059892) (not e!860306))))

(assert (=> b!1545627 (= res!1059892 (bvslt from!762 (size!50285 _keys!618)))))

(declare-fun lt!666151 () ListLongMap!22185)

(assert (=> b!1545627 (= lt!666151 e!860304)))

(declare-fun c!141631 () Bool)

(assert (=> b!1545627 (= c!141631 (and (not lt!666153) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545627 (= lt!666153 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!58648 () Bool)

(assert (=> mapIsEmpty!58648 mapRes!58648))

(declare-fun b!1545628 () Bool)

(assert (=> b!1545628 (= e!860303 call!69349)))

(declare-fun mapNonEmpty!58648 () Bool)

(declare-fun tp!111313 () Bool)

(assert (=> mapNonEmpty!58648 (= mapRes!58648 (and tp!111313 e!860302))))

(declare-fun mapValue!58648 () ValueCell!18071)

(declare-fun mapKey!58648 () (_ BitVec 32))

(declare-fun mapRest!58648 () (Array (_ BitVec 32) ValueCell!18071))

(assert (=> mapNonEmpty!58648 (= (arr!49734 _values!470) (store mapRest!58648 mapKey!58648 mapValue!58648))))

(declare-fun b!1545629 () Bool)

(declare-fun call!69347 () ListLongMap!22185)

(assert (=> b!1545629 (= e!860303 call!69347)))

(declare-fun bm!69343 () Bool)

(declare-fun call!69346 () ListLongMap!22185)

(assert (=> bm!69343 (= call!69346 call!69348)))

(declare-fun bm!69344 () Bool)

(declare-fun call!69345 () ListLongMap!22185)

(assert (=> bm!69344 (= call!69349 call!69345)))

(declare-fun bm!69345 () Bool)

(declare-fun +!4936 (ListLongMap!22185 tuple2!24576) ListLongMap!22185)

(assert (=> bm!69345 (= call!69345 (+!4936 (ite c!141631 call!69348 (ite c!141633 call!69346 call!69347)) (ite (or c!141631 c!141633) (tuple2!24577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545630 () Bool)

(assert (=> b!1545630 (= e!860304 (+!4936 call!69345 (tuple2!24577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69346 () Bool)

(assert (=> bm!69346 (= call!69347 call!69346)))

(declare-fun b!1545631 () Bool)

(assert (=> b!1545631 (= e!860306 (not true))))

(declare-fun lt!666154 () ListLongMap!22185)

(declare-fun contains!9997 (ListLongMap!22185 (_ BitVec 64)) Bool)

(assert (=> b!1545631 (contains!9997 (+!4936 lt!666154 (tuple2!24577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49733 _keys!618) from!762))))

(declare-datatypes ((Unit!51341 0))(
  ( (Unit!51342) )
))
(declare-fun lt!666152 () Unit!51341)

(declare-fun addStillContains!1220 (ListLongMap!22185 (_ BitVec 64) V!59061 (_ BitVec 64)) Unit!51341)

(assert (=> b!1545631 (= lt!666152 (addStillContains!1220 lt!666154 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49733 _keys!618) from!762)))))

(assert (=> b!1545631 (= lt!666154 (getCurrentListMapNoExtraKeys!6564 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!131924 res!1059891) b!1545618))

(assert (= (and b!1545618 res!1059893) b!1545626))

(assert (= (and b!1545626 res!1059896) b!1545623))

(assert (= (and b!1545623 res!1059895) b!1545622))

(assert (= (and b!1545622 res!1059897) b!1545627))

(assert (= (and b!1545627 c!141631) b!1545630))

(assert (= (and b!1545627 (not c!141631)) b!1545621))

(assert (= (and b!1545621 c!141633) b!1545616))

(assert (= (and b!1545621 (not c!141633)) b!1545617))

(assert (= (and b!1545617 c!141632) b!1545628))

(assert (= (and b!1545617 (not c!141632)) b!1545629))

(assert (= (or b!1545628 b!1545629) bm!69346))

(assert (= (or b!1545616 bm!69346) bm!69343))

(assert (= (or b!1545616 b!1545628) bm!69344))

(assert (= (or b!1545630 bm!69343) bm!69342))

(assert (= (or b!1545630 bm!69344) bm!69345))

(assert (= (and b!1545627 res!1059892) b!1545624))

(assert (= (and b!1545624 res!1059894) b!1545631))

(assert (= (and b!1545625 condMapEmpty!58648) mapIsEmpty!58648))

(assert (= (and b!1545625 (not condMapEmpty!58648)) mapNonEmpty!58648))

(get-info :version)

(assert (= (and mapNonEmpty!58648 ((_ is ValueCellFull!18071) mapValue!58648)) b!1545620))

(assert (= (and b!1545625 ((_ is ValueCellFull!18071) mapDefault!58648)) b!1545619))

(assert (= start!131924 b!1545625))

(declare-fun m!1425147 () Bool)

(assert (=> b!1545630 m!1425147))

(declare-fun m!1425149 () Bool)

(assert (=> b!1545631 m!1425149))

(declare-fun m!1425151 () Bool)

(assert (=> b!1545631 m!1425151))

(assert (=> b!1545631 m!1425149))

(declare-fun m!1425153 () Bool)

(assert (=> b!1545631 m!1425153))

(assert (=> b!1545631 m!1425149))

(declare-fun m!1425155 () Bool)

(assert (=> b!1545631 m!1425155))

(declare-fun m!1425157 () Bool)

(assert (=> b!1545631 m!1425157))

(assert (=> b!1545631 m!1425151))

(declare-fun m!1425159 () Bool)

(assert (=> start!131924 m!1425159))

(declare-fun m!1425161 () Bool)

(assert (=> start!131924 m!1425161))

(declare-fun m!1425163 () Bool)

(assert (=> start!131924 m!1425163))

(declare-fun m!1425165 () Bool)

(assert (=> b!1545623 m!1425165))

(declare-fun m!1425167 () Bool)

(assert (=> bm!69345 m!1425167))

(declare-fun m!1425169 () Bool)

(assert (=> b!1545626 m!1425169))

(declare-fun m!1425171 () Bool)

(assert (=> mapNonEmpty!58648 m!1425171))

(assert (=> bm!69342 m!1425157))

(assert (=> b!1545624 m!1425149))

(assert (=> b!1545624 m!1425149))

(declare-fun m!1425173 () Bool)

(assert (=> b!1545624 m!1425173))

(check-sat (not bm!69345) (not start!131924) b_and!51079 (not b!1545623) (not bm!69342) tp_is_empty!37963 (not b!1545630) (not b!1545631) (not mapNonEmpty!58648) (not b!1545626) (not b!1545624) (not b_next!31687))
(check-sat b_and!51079 (not b_next!31687))
