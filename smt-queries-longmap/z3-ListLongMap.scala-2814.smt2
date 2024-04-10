; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40796 () Bool)

(assert start!40796)

(declare-fun b_free!10785 () Bool)

(declare-fun b_next!10785 () Bool)

(assert (=> start!40796 (= b_free!10785 (not b_next!10785))))

(declare-fun tp!38178 () Bool)

(declare-fun b_and!18857 () Bool)

(assert (=> start!40796 (= tp!38178 b_and!18857)))

(declare-datatypes ((V!17269 0))(
  ( (V!17270 (val!6106 Int)) )
))
(declare-fun minValue!515 () V!17269)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5718 0))(
  ( (ValueCellFull!5718 (v!8365 V!17269)) (EmptyCell!5718) )
))
(declare-datatypes ((array!28053 0))(
  ( (array!28054 (arr!13471 (Array (_ BitVec 32) ValueCell!5718)) (size!13823 (_ BitVec 32))) )
))
(declare-fun lt!205288 () array!28053)

(declare-fun _values!549 () array!28053)

(declare-fun c!56126 () Bool)

(declare-datatypes ((tuple2!8038 0))(
  ( (tuple2!8039 (_1!4030 (_ BitVec 64)) (_2!4030 V!17269)) )
))
(declare-datatypes ((List!8096 0))(
  ( (Nil!8093) (Cons!8092 (h!8948 tuple2!8038) (t!13904 List!8096)) )
))
(declare-datatypes ((ListLongMap!6951 0))(
  ( (ListLongMap!6952 (toList!3491 List!8096)) )
))
(declare-fun call!29968 () ListLongMap!6951)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!28055 0))(
  ( (array!28056 (arr!13472 (Array (_ BitVec 32) (_ BitVec 64))) (size!13824 (_ BitVec 32))) )
))
(declare-fun lt!205295 () array!28055)

(declare-fun _keys!709 () array!28055)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17269)

(declare-fun bm!29965 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1675 (array!28055 array!28053 (_ BitVec 32) (_ BitVec 32) V!17269 V!17269 (_ BitVec 32) Int) ListLongMap!6951)

(assert (=> bm!29965 (= call!29968 (getCurrentListMapNoExtraKeys!1675 (ite c!56126 _keys!709 lt!205295) (ite c!56126 _values!549 lt!205288) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452530 () Bool)

(declare-fun res!269559 () Bool)

(declare-fun e!264955 () Bool)

(assert (=> b!452530 (=> (not res!269559) (not e!264955))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452530 (= res!269559 (or (= (select (arr!13472 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13472 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452531 () Bool)

(declare-fun res!269548 () Bool)

(assert (=> b!452531 (=> (not res!269548) (not e!264955))))

(assert (=> b!452531 (= res!269548 (and (= (size!13823 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13824 _keys!709) (size!13823 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19821 () Bool)

(declare-fun mapRes!19821 () Bool)

(assert (=> mapIsEmpty!19821 mapRes!19821))

(declare-fun b!452532 () Bool)

(declare-fun res!269558 () Bool)

(assert (=> b!452532 (=> (not res!269558) (not e!264955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452532 (= res!269558 (validMask!0 mask!1025))))

(declare-fun b!452533 () Bool)

(declare-fun e!264953 () Bool)

(declare-fun call!29969 () ListLongMap!6951)

(assert (=> b!452533 (= e!264953 (= call!29968 call!29969))))

(declare-fun b!452534 () Bool)

(declare-fun e!264959 () Bool)

(declare-fun e!264957 () Bool)

(assert (=> b!452534 (= e!264959 e!264957)))

(declare-fun res!269557 () Bool)

(assert (=> b!452534 (=> (not res!269557) (not e!264957))))

(assert (=> b!452534 (= res!269557 (= from!863 i!563))))

(declare-fun lt!205297 () ListLongMap!6951)

(assert (=> b!452534 (= lt!205297 (getCurrentListMapNoExtraKeys!1675 lt!205295 lt!205288 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17269)

(assert (=> b!452534 (= lt!205288 (array!28054 (store (arr!13471 _values!549) i!563 (ValueCellFull!5718 v!412)) (size!13823 _values!549)))))

(declare-fun lt!205293 () ListLongMap!6951)

(assert (=> b!452534 (= lt!205293 (getCurrentListMapNoExtraKeys!1675 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452535 () Bool)

(declare-fun res!269554 () Bool)

(assert (=> b!452535 (=> (not res!269554) (not e!264955))))

(declare-datatypes ((List!8097 0))(
  ( (Nil!8094) (Cons!8093 (h!8949 (_ BitVec 64)) (t!13905 List!8097)) )
))
(declare-fun arrayNoDuplicates!0 (array!28055 (_ BitVec 32) List!8097) Bool)

(assert (=> b!452535 (= res!269554 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8094))))

(declare-fun b!452536 () Bool)

(declare-fun e!264958 () Bool)

(assert (=> b!452536 (= e!264958 (bvslt i!563 (size!13823 _values!549)))))

(declare-fun lt!205291 () V!17269)

(declare-fun lt!205289 () ListLongMap!6951)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!205294 () tuple2!8038)

(declare-fun +!1568 (ListLongMap!6951 tuple2!8038) ListLongMap!6951)

(assert (=> b!452536 (= (+!1568 lt!205289 lt!205294) (+!1568 (+!1568 lt!205289 (tuple2!8039 k0!794 lt!205291)) lt!205294))))

(declare-fun lt!205292 () V!17269)

(assert (=> b!452536 (= lt!205294 (tuple2!8039 k0!794 lt!205292))))

(declare-datatypes ((Unit!13232 0))(
  ( (Unit!13233) )
))
(declare-fun lt!205298 () Unit!13232)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!80 (ListLongMap!6951 (_ BitVec 64) V!17269 V!17269) Unit!13232)

(assert (=> b!452536 (= lt!205298 (addSameAsAddTwiceSameKeyDiffValues!80 lt!205289 k0!794 lt!205291 lt!205292))))

(declare-fun lt!205290 () V!17269)

(declare-fun get!6640 (ValueCell!5718 V!17269) V!17269)

(assert (=> b!452536 (= lt!205291 (get!6640 (select (arr!13471 _values!549) from!863) lt!205290))))

(assert (=> b!452536 (= lt!205297 (+!1568 lt!205289 (tuple2!8039 (select (arr!13472 lt!205295) from!863) lt!205292)))))

(assert (=> b!452536 (= lt!205292 (get!6640 (select (store (arr!13471 _values!549) i!563 (ValueCellFull!5718 v!412)) from!863) lt!205290))))

(declare-fun dynLambda!867 (Int (_ BitVec 64)) V!17269)

(assert (=> b!452536 (= lt!205290 (dynLambda!867 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452536 (= lt!205289 (getCurrentListMapNoExtraKeys!1675 lt!205295 lt!205288 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452537 () Bool)

(declare-fun res!269550 () Bool)

(assert (=> b!452537 (=> (not res!269550) (not e!264959))))

(assert (=> b!452537 (= res!269550 (bvsle from!863 i!563))))

(declare-fun b!452538 () Bool)

(declare-fun e!264954 () Bool)

(declare-fun tp_is_empty!12123 () Bool)

(assert (=> b!452538 (= e!264954 tp_is_empty!12123)))

(declare-fun b!452539 () Bool)

(assert (=> b!452539 (= e!264955 e!264959)))

(declare-fun res!269556 () Bool)

(assert (=> b!452539 (=> (not res!269556) (not e!264959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28055 (_ BitVec 32)) Bool)

(assert (=> b!452539 (= res!269556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205295 mask!1025))))

(assert (=> b!452539 (= lt!205295 (array!28056 (store (arr!13472 _keys!709) i!563 k0!794) (size!13824 _keys!709)))))

(declare-fun b!452540 () Bool)

(declare-fun e!264951 () Bool)

(assert (=> b!452540 (= e!264951 (and e!264954 mapRes!19821))))

(declare-fun condMapEmpty!19821 () Bool)

(declare-fun mapDefault!19821 () ValueCell!5718)

(assert (=> b!452540 (= condMapEmpty!19821 (= (arr!13471 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5718)) mapDefault!19821)))))

(declare-fun res!269549 () Bool)

(assert (=> start!40796 (=> (not res!269549) (not e!264955))))

(assert (=> start!40796 (= res!269549 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13824 _keys!709))))))

(assert (=> start!40796 e!264955))

(assert (=> start!40796 tp_is_empty!12123))

(assert (=> start!40796 tp!38178))

(assert (=> start!40796 true))

(declare-fun array_inv!9756 (array!28053) Bool)

(assert (=> start!40796 (and (array_inv!9756 _values!549) e!264951)))

(declare-fun array_inv!9757 (array!28055) Bool)

(assert (=> start!40796 (array_inv!9757 _keys!709)))

(declare-fun b!452541 () Bool)

(declare-fun res!269553 () Bool)

(assert (=> b!452541 (=> (not res!269553) (not e!264955))))

(assert (=> b!452541 (= res!269553 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13824 _keys!709))))))

(declare-fun mapNonEmpty!19821 () Bool)

(declare-fun tp!38177 () Bool)

(declare-fun e!264956 () Bool)

(assert (=> mapNonEmpty!19821 (= mapRes!19821 (and tp!38177 e!264956))))

(declare-fun mapValue!19821 () ValueCell!5718)

(declare-fun mapRest!19821 () (Array (_ BitVec 32) ValueCell!5718))

(declare-fun mapKey!19821 () (_ BitVec 32))

(assert (=> mapNonEmpty!19821 (= (arr!13471 _values!549) (store mapRest!19821 mapKey!19821 mapValue!19821))))

(declare-fun b!452542 () Bool)

(declare-fun res!269560 () Bool)

(assert (=> b!452542 (=> (not res!269560) (not e!264955))))

(assert (=> b!452542 (= res!269560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452543 () Bool)

(declare-fun res!269551 () Bool)

(assert (=> b!452543 (=> (not res!269551) (not e!264955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452543 (= res!269551 (validKeyInArray!0 k0!794))))

(declare-fun b!452544 () Bool)

(assert (=> b!452544 (= e!264956 tp_is_empty!12123)))

(declare-fun b!452545 () Bool)

(declare-fun res!269561 () Bool)

(assert (=> b!452545 (=> (not res!269561) (not e!264959))))

(assert (=> b!452545 (= res!269561 (arrayNoDuplicates!0 lt!205295 #b00000000000000000000000000000000 Nil!8094))))

(declare-fun b!452546 () Bool)

(declare-fun res!269552 () Bool)

(assert (=> b!452546 (=> (not res!269552) (not e!264955))))

(declare-fun arrayContainsKey!0 (array!28055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452546 (= res!269552 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!29966 () Bool)

(assert (=> bm!29966 (= call!29969 (getCurrentListMapNoExtraKeys!1675 (ite c!56126 lt!205295 _keys!709) (ite c!56126 lt!205288 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452547 () Bool)

(assert (=> b!452547 (= e!264953 (= call!29969 (+!1568 call!29968 (tuple2!8039 k0!794 v!412))))))

(declare-fun b!452548 () Bool)

(assert (=> b!452548 (= e!264957 (not e!264958))))

(declare-fun res!269555 () Bool)

(assert (=> b!452548 (=> res!269555 e!264958)))

(assert (=> b!452548 (= res!269555 (validKeyInArray!0 (select (arr!13472 _keys!709) from!863)))))

(assert (=> b!452548 e!264953))

(assert (=> b!452548 (= c!56126 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!205296 () Unit!13232)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!730 (array!28055 array!28053 (_ BitVec 32) (_ BitVec 32) V!17269 V!17269 (_ BitVec 32) (_ BitVec 64) V!17269 (_ BitVec 32) Int) Unit!13232)

(assert (=> b!452548 (= lt!205296 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!730 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40796 res!269549) b!452532))

(assert (= (and b!452532 res!269558) b!452531))

(assert (= (and b!452531 res!269548) b!452542))

(assert (= (and b!452542 res!269560) b!452535))

(assert (= (and b!452535 res!269554) b!452541))

(assert (= (and b!452541 res!269553) b!452543))

(assert (= (and b!452543 res!269551) b!452530))

(assert (= (and b!452530 res!269559) b!452546))

(assert (= (and b!452546 res!269552) b!452539))

(assert (= (and b!452539 res!269556) b!452545))

(assert (= (and b!452545 res!269561) b!452537))

(assert (= (and b!452537 res!269550) b!452534))

(assert (= (and b!452534 res!269557) b!452548))

(assert (= (and b!452548 c!56126) b!452547))

(assert (= (and b!452548 (not c!56126)) b!452533))

(assert (= (or b!452547 b!452533) bm!29966))

(assert (= (or b!452547 b!452533) bm!29965))

(assert (= (and b!452548 (not res!269555)) b!452536))

(assert (= (and b!452540 condMapEmpty!19821) mapIsEmpty!19821))

(assert (= (and b!452540 (not condMapEmpty!19821)) mapNonEmpty!19821))

(get-info :version)

(assert (= (and mapNonEmpty!19821 ((_ is ValueCellFull!5718) mapValue!19821)) b!452544))

(assert (= (and b!452540 ((_ is ValueCellFull!5718) mapDefault!19821)) b!452538))

(assert (= start!40796 b!452540))

(declare-fun b_lambda!9563 () Bool)

(assert (=> (not b_lambda!9563) (not b!452536)))

(declare-fun t!13903 () Bool)

(declare-fun tb!3765 () Bool)

(assert (=> (and start!40796 (= defaultEntry!557 defaultEntry!557) t!13903) tb!3765))

(declare-fun result!7067 () Bool)

(assert (=> tb!3765 (= result!7067 tp_is_empty!12123)))

(assert (=> b!452536 t!13903))

(declare-fun b_and!18859 () Bool)

(assert (= b_and!18857 (and (=> t!13903 result!7067) b_and!18859)))

(declare-fun m!436259 () Bool)

(assert (=> b!452534 m!436259))

(declare-fun m!436261 () Bool)

(assert (=> b!452534 m!436261))

(declare-fun m!436263 () Bool)

(assert (=> b!452534 m!436263))

(declare-fun m!436265 () Bool)

(assert (=> start!40796 m!436265))

(declare-fun m!436267 () Bool)

(assert (=> start!40796 m!436267))

(declare-fun m!436269 () Bool)

(assert (=> b!452543 m!436269))

(declare-fun m!436271 () Bool)

(assert (=> bm!29966 m!436271))

(declare-fun m!436273 () Bool)

(assert (=> b!452535 m!436273))

(declare-fun m!436275 () Bool)

(assert (=> bm!29965 m!436275))

(declare-fun m!436277 () Bool)

(assert (=> b!452539 m!436277))

(declare-fun m!436279 () Bool)

(assert (=> b!452539 m!436279))

(declare-fun m!436281 () Bool)

(assert (=> b!452546 m!436281))

(declare-fun m!436283 () Bool)

(assert (=> b!452536 m!436283))

(declare-fun m!436285 () Bool)

(assert (=> b!452536 m!436285))

(declare-fun m!436287 () Bool)

(assert (=> b!452536 m!436287))

(declare-fun m!436289 () Bool)

(assert (=> b!452536 m!436289))

(assert (=> b!452536 m!436287))

(declare-fun m!436291 () Bool)

(assert (=> b!452536 m!436291))

(declare-fun m!436293 () Bool)

(assert (=> b!452536 m!436293))

(assert (=> b!452536 m!436293))

(declare-fun m!436295 () Bool)

(assert (=> b!452536 m!436295))

(declare-fun m!436297 () Bool)

(assert (=> b!452536 m!436297))

(declare-fun m!436299 () Bool)

(assert (=> b!452536 m!436299))

(assert (=> b!452536 m!436291))

(declare-fun m!436301 () Bool)

(assert (=> b!452536 m!436301))

(assert (=> b!452536 m!436261))

(declare-fun m!436303 () Bool)

(assert (=> b!452536 m!436303))

(declare-fun m!436305 () Bool)

(assert (=> b!452536 m!436305))

(declare-fun m!436307 () Bool)

(assert (=> b!452545 m!436307))

(declare-fun m!436309 () Bool)

(assert (=> b!452532 m!436309))

(declare-fun m!436311 () Bool)

(assert (=> mapNonEmpty!19821 m!436311))

(declare-fun m!436313 () Bool)

(assert (=> b!452542 m!436313))

(declare-fun m!436315 () Bool)

(assert (=> b!452530 m!436315))

(declare-fun m!436317 () Bool)

(assert (=> b!452547 m!436317))

(declare-fun m!436319 () Bool)

(assert (=> b!452548 m!436319))

(assert (=> b!452548 m!436319))

(declare-fun m!436321 () Bool)

(assert (=> b!452548 m!436321))

(declare-fun m!436323 () Bool)

(assert (=> b!452548 m!436323))

(check-sat (not bm!29965) tp_is_empty!12123 (not b!452542) (not b!452534) (not b!452543) (not mapNonEmpty!19821) (not start!40796) (not bm!29966) b_and!18859 (not b!452535) (not b!452536) (not b!452546) (not b!452548) (not b_next!10785) (not b!452539) (not b!452532) (not b_lambda!9563) (not b!452545) (not b!452547))
(check-sat b_and!18859 (not b_next!10785))
