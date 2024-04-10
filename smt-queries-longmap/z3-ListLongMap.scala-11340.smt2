; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131946 () Bool)

(assert start!131946)

(declare-fun b_free!31659 () Bool)

(declare-fun b_next!31659 () Bool)

(assert (=> start!131946 (= b_free!31659 (not b_next!31659))))

(declare-fun tp!111228 () Bool)

(declare-fun b_and!51069 () Bool)

(assert (=> start!131946 (= tp!111228 b_and!51069)))

(declare-fun b!1545257 () Bool)

(declare-fun e!860121 () Bool)

(declare-fun e!860124 () Bool)

(assert (=> b!1545257 (= e!860121 e!860124)))

(declare-fun res!1059731 () Bool)

(assert (=> b!1545257 (=> (not res!1059731) (not e!860124))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103078 0))(
  ( (array!103079 (arr!49741 (Array (_ BitVec 32) (_ BitVec 64))) (size!50291 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103078)

(assert (=> b!1545257 (= res!1059731 (bvslt from!762 (size!50291 _keys!618)))))

(declare-datatypes ((V!59023 0))(
  ( (V!59024 (val!19045 Int)) )
))
(declare-datatypes ((tuple2!24474 0))(
  ( (tuple2!24475 (_1!12248 (_ BitVec 64)) (_2!12248 V!59023)) )
))
(declare-datatypes ((List!35985 0))(
  ( (Nil!35982) (Cons!35981 (h!37426 tuple2!24474) (t!50679 List!35985)) )
))
(declare-datatypes ((ListLongMap!22083 0))(
  ( (ListLongMap!22084 (toList!11057 List!35985)) )
))
(declare-fun lt!666272 () ListLongMap!22083)

(declare-fun e!860123 () ListLongMap!22083)

(assert (=> b!1545257 (= lt!666272 e!860123)))

(declare-fun c!141595 () Bool)

(declare-fun lt!666271 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545257 (= c!141595 (and (not lt!666271) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545257 (= lt!666271 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!69174 () ListLongMap!22083)

(declare-fun zeroValue!436 () V!59023)

(declare-fun call!69170 () ListLongMap!22083)

(declare-fun call!69172 () ListLongMap!22083)

(declare-fun c!141594 () Bool)

(declare-fun bm!69167 () Bool)

(declare-fun minValue!436 () V!59023)

(declare-fun call!69171 () ListLongMap!22083)

(declare-fun +!4893 (ListLongMap!22083 tuple2!24474) ListLongMap!22083)

(assert (=> bm!69167 (= call!69172 (+!4893 (ite c!141595 call!69174 (ite c!141594 call!69171 call!69170)) (ite (or c!141595 c!141594) (tuple2!24475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69168 () Bool)

(assert (=> bm!69168 (= call!69171 call!69174)))

(declare-fun b!1545258 () Bool)

(declare-fun res!1059728 () Bool)

(assert (=> b!1545258 (=> (not res!1059728) (not e!860121))))

(assert (=> b!1545258 (= res!1059728 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50291 _keys!618))))))

(declare-fun b!1545259 () Bool)

(declare-fun res!1059732 () Bool)

(assert (=> b!1545259 (=> (not res!1059732) (not e!860121))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18057 0))(
  ( (ValueCellFull!18057 (v!21846 V!59023)) (EmptyCell!18057) )
))
(declare-datatypes ((array!103080 0))(
  ( (array!103081 (arr!49742 (Array (_ BitVec 32) ValueCell!18057)) (size!50292 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103080)

(assert (=> b!1545259 (= res!1059732 (and (= (size!50292 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50291 _keys!618) (size!50292 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545260 () Bool)

(declare-fun c!141596 () Bool)

(assert (=> b!1545260 (= c!141596 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666271))))

(declare-fun e!860127 () ListLongMap!22083)

(declare-fun e!860119 () ListLongMap!22083)

(assert (=> b!1545260 (= e!860127 e!860119)))

(declare-fun b!1545261 () Bool)

(declare-fun res!1059727 () Bool)

(assert (=> b!1545261 (=> (not res!1059727) (not e!860121))))

(declare-datatypes ((List!35986 0))(
  ( (Nil!35983) (Cons!35982 (h!37427 (_ BitVec 64)) (t!50680 List!35986)) )
))
(declare-fun arrayNoDuplicates!0 (array!103078 (_ BitVec 32) List!35986) Bool)

(assert (=> b!1545261 (= res!1059727 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35983))))

(declare-fun b!1545262 () Bool)

(assert (=> b!1545262 (= e!860119 call!69170)))

(declare-fun mapNonEmpty!58606 () Bool)

(declare-fun mapRes!58606 () Bool)

(declare-fun tp!111229 () Bool)

(declare-fun e!860122 () Bool)

(assert (=> mapNonEmpty!58606 (= mapRes!58606 (and tp!111229 e!860122))))

(declare-fun mapRest!58606 () (Array (_ BitVec 32) ValueCell!18057))

(declare-fun mapValue!58606 () ValueCell!18057)

(declare-fun mapKey!58606 () (_ BitVec 32))

(assert (=> mapNonEmpty!58606 (= (arr!49742 _values!470) (store mapRest!58606 mapKey!58606 mapValue!58606))))

(declare-fun b!1545263 () Bool)

(assert (=> b!1545263 (= e!860123 (+!4893 call!69172 (tuple2!24475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545264 () Bool)

(declare-fun e!860125 () Bool)

(declare-fun tp_is_empty!37935 () Bool)

(assert (=> b!1545264 (= e!860125 tp_is_empty!37935)))

(declare-fun b!1545265 () Bool)

(declare-fun call!69173 () ListLongMap!22083)

(assert (=> b!1545265 (= e!860127 call!69173)))

(declare-fun b!1545266 () Bool)

(assert (=> b!1545266 (= e!860119 call!69173)))

(declare-fun b!1545267 () Bool)

(assert (=> b!1545267 (= e!860123 e!860127)))

(assert (=> b!1545267 (= c!141594 (and (not lt!666271) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545268 () Bool)

(declare-fun res!1059726 () Bool)

(assert (=> b!1545268 (=> (not res!1059726) (not e!860124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545268 (= res!1059726 (validKeyInArray!0 (select (arr!49741 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69170 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6526 (array!103078 array!103080 (_ BitVec 32) (_ BitVec 32) V!59023 V!59023 (_ BitVec 32) Int) ListLongMap!22083)

(assert (=> bm!69170 (= call!69174 (getCurrentListMapNoExtraKeys!6526 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69171 () Bool)

(assert (=> bm!69171 (= call!69170 call!69171)))

(declare-fun b!1545269 () Bool)

(declare-fun res!1059730 () Bool)

(assert (=> b!1545269 (=> (not res!1059730) (not e!860121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103078 (_ BitVec 32)) Bool)

(assert (=> b!1545269 (= res!1059730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58606 () Bool)

(assert (=> mapIsEmpty!58606 mapRes!58606))

(declare-fun b!1545270 () Bool)

(declare-fun e!860120 () Bool)

(assert (=> b!1545270 (= e!860120 (and e!860125 mapRes!58606))))

(declare-fun condMapEmpty!58606 () Bool)

(declare-fun mapDefault!58606 () ValueCell!18057)

(assert (=> b!1545270 (= condMapEmpty!58606 (= (arr!49742 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18057)) mapDefault!58606)))))

(declare-fun res!1059729 () Bool)

(assert (=> start!131946 (=> (not res!1059729) (not e!860121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131946 (= res!1059729 (validMask!0 mask!926))))

(assert (=> start!131946 e!860121))

(declare-fun array_inv!38691 (array!103078) Bool)

(assert (=> start!131946 (array_inv!38691 _keys!618)))

(assert (=> start!131946 tp_is_empty!37935))

(assert (=> start!131946 true))

(assert (=> start!131946 tp!111228))

(declare-fun array_inv!38692 (array!103080) Bool)

(assert (=> start!131946 (and (array_inv!38692 _values!470) e!860120)))

(declare-fun bm!69169 () Bool)

(assert (=> bm!69169 (= call!69173 call!69172)))

(declare-fun b!1545271 () Bool)

(assert (=> b!1545271 (= e!860122 tp_is_empty!37935)))

(declare-fun b!1545272 () Bool)

(assert (=> b!1545272 (= e!860124 (not true))))

(declare-fun lt!666269 () ListLongMap!22083)

(declare-fun contains!10029 (ListLongMap!22083 (_ BitVec 64)) Bool)

(assert (=> b!1545272 (contains!10029 (+!4893 lt!666269 (tuple2!24475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49741 _keys!618) from!762))))

(declare-datatypes ((Unit!51494 0))(
  ( (Unit!51495) )
))
(declare-fun lt!666270 () Unit!51494)

(declare-fun addStillContains!1217 (ListLongMap!22083 (_ BitVec 64) V!59023 (_ BitVec 64)) Unit!51494)

(assert (=> b!1545272 (= lt!666270 (addStillContains!1217 lt!666269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49741 _keys!618) from!762)))))

(assert (=> b!1545272 (= lt!666269 (getCurrentListMapNoExtraKeys!6526 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!131946 res!1059729) b!1545259))

(assert (= (and b!1545259 res!1059732) b!1545269))

(assert (= (and b!1545269 res!1059730) b!1545261))

(assert (= (and b!1545261 res!1059727) b!1545258))

(assert (= (and b!1545258 res!1059728) b!1545257))

(assert (= (and b!1545257 c!141595) b!1545263))

(assert (= (and b!1545257 (not c!141595)) b!1545267))

(assert (= (and b!1545267 c!141594) b!1545265))

(assert (= (and b!1545267 (not c!141594)) b!1545260))

(assert (= (and b!1545260 c!141596) b!1545266))

(assert (= (and b!1545260 (not c!141596)) b!1545262))

(assert (= (or b!1545266 b!1545262) bm!69171))

(assert (= (or b!1545265 bm!69171) bm!69168))

(assert (= (or b!1545265 b!1545266) bm!69169))

(assert (= (or b!1545263 bm!69168) bm!69170))

(assert (= (or b!1545263 bm!69169) bm!69167))

(assert (= (and b!1545257 res!1059731) b!1545268))

(assert (= (and b!1545268 res!1059726) b!1545272))

(assert (= (and b!1545270 condMapEmpty!58606) mapIsEmpty!58606))

(assert (= (and b!1545270 (not condMapEmpty!58606)) mapNonEmpty!58606))

(get-info :version)

(assert (= (and mapNonEmpty!58606 ((_ is ValueCellFull!18057) mapValue!58606)) b!1545271))

(assert (= (and b!1545270 ((_ is ValueCellFull!18057) mapDefault!58606)) b!1545264))

(assert (= start!131946 b!1545270))

(declare-fun m!1425647 () Bool)

(assert (=> b!1545268 m!1425647))

(assert (=> b!1545268 m!1425647))

(declare-fun m!1425649 () Bool)

(assert (=> b!1545268 m!1425649))

(declare-fun m!1425651 () Bool)

(assert (=> b!1545272 m!1425651))

(assert (=> b!1545272 m!1425647))

(assert (=> b!1545272 m!1425647))

(declare-fun m!1425653 () Bool)

(assert (=> b!1545272 m!1425653))

(declare-fun m!1425655 () Bool)

(assert (=> b!1545272 m!1425655))

(assert (=> b!1545272 m!1425647))

(declare-fun m!1425657 () Bool)

(assert (=> b!1545272 m!1425657))

(assert (=> b!1545272 m!1425655))

(declare-fun m!1425659 () Bool)

(assert (=> b!1545269 m!1425659))

(declare-fun m!1425661 () Bool)

(assert (=> b!1545263 m!1425661))

(declare-fun m!1425663 () Bool)

(assert (=> bm!69167 m!1425663))

(declare-fun m!1425665 () Bool)

(assert (=> b!1545261 m!1425665))

(declare-fun m!1425667 () Bool)

(assert (=> start!131946 m!1425667))

(declare-fun m!1425669 () Bool)

(assert (=> start!131946 m!1425669))

(declare-fun m!1425671 () Bool)

(assert (=> start!131946 m!1425671))

(declare-fun m!1425673 () Bool)

(assert (=> mapNonEmpty!58606 m!1425673))

(assert (=> bm!69170 m!1425651))

(check-sat b_and!51069 (not mapNonEmpty!58606) (not b!1545263) (not b!1545269) (not b!1545272) (not start!131946) (not bm!69170) (not bm!69167) (not b!1545268) tp_is_empty!37935 (not b_next!31659) (not b!1545261))
(check-sat b_and!51069 (not b_next!31659))
