; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40492 () Bool)

(assert start!40492)

(declare-fun b_free!10563 () Bool)

(declare-fun b_next!10563 () Bool)

(assert (=> start!40492 (= b_free!10563 (not b_next!10563))))

(declare-fun tp!37466 () Bool)

(declare-fun b_and!18547 () Bool)

(assert (=> start!40492 (= tp!37466 b_and!18547)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16941 0))(
  ( (V!16942 (val!5983 Int)) )
))
(declare-datatypes ((ValueCell!5595 0))(
  ( (ValueCellFull!5595 (v!8234 V!16941)) (EmptyCell!5595) )
))
(declare-datatypes ((array!27561 0))(
  ( (array!27562 (arr!13228 (Array (_ BitVec 32) ValueCell!5595)) (size!13580 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27561)

(declare-fun b!446113 () Bool)

(declare-fun zeroValue!515 () V!16941)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun e!262106 () Bool)

(declare-fun v!412 () V!16941)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27563 0))(
  ( (array!27564 (arr!13229 (Array (_ BitVec 32) (_ BitVec 64))) (size!13581 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27563)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!16941)

(declare-fun lt!203714 () array!27563)

(declare-datatypes ((tuple2!7862 0))(
  ( (tuple2!7863 (_1!3942 (_ BitVec 64)) (_2!3942 V!16941)) )
))
(declare-datatypes ((List!7913 0))(
  ( (Nil!7910) (Cons!7909 (h!8765 tuple2!7862) (t!13671 List!7913)) )
))
(declare-datatypes ((ListLongMap!6775 0))(
  ( (ListLongMap!6776 (toList!3403 List!7913)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1589 (array!27563 array!27561 (_ BitVec 32) (_ BitVec 32) V!16941 V!16941 (_ BitVec 32) Int) ListLongMap!6775)

(assert (=> b!446113 (= e!262106 (not (= (getCurrentListMapNoExtraKeys!1589 lt!203714 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) (getCurrentListMapNoExtraKeys!1589 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))))

(declare-fun e!262107 () Bool)

(assert (=> b!446113 e!262107))

(declare-fun c!55890 () Bool)

(assert (=> b!446113 (= c!55890 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13176 0))(
  ( (Unit!13177) )
))
(declare-fun lt!203713 () Unit!13176)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!704 (array!27563 array!27561 (_ BitVec 32) (_ BitVec 32) V!16941 V!16941 (_ BitVec 32) (_ BitVec 64) V!16941 (_ BitVec 32) Int) Unit!13176)

(assert (=> b!446113 (= lt!203713 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!704 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446114 () Bool)

(declare-fun res!264792 () Bool)

(declare-fun e!262111 () Bool)

(assert (=> b!446114 (=> (not res!264792) (not e!262111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446114 (= res!264792 (validKeyInArray!0 k0!794))))

(declare-fun b!446115 () Bool)

(assert (=> b!446115 (= e!262111 e!262106)))

(declare-fun res!264782 () Bool)

(assert (=> b!446115 (=> (not res!264782) (not e!262106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27563 (_ BitVec 32)) Bool)

(assert (=> b!446115 (= res!264782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203714 mask!1025))))

(assert (=> b!446115 (= lt!203714 (array!27564 (store (arr!13229 _keys!709) i!563 k0!794) (size!13581 _keys!709)))))

(declare-fun b!446116 () Bool)

(declare-fun e!262110 () Bool)

(declare-fun e!262109 () Bool)

(declare-fun mapRes!19443 () Bool)

(assert (=> b!446116 (= e!262110 (and e!262109 mapRes!19443))))

(declare-fun condMapEmpty!19443 () Bool)

(declare-fun mapDefault!19443 () ValueCell!5595)

(assert (=> b!446116 (= condMapEmpty!19443 (= (arr!13228 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5595)) mapDefault!19443)))))

(declare-fun b!446117 () Bool)

(declare-fun res!264790 () Bool)

(assert (=> b!446117 (=> (not res!264790) (not e!262111))))

(assert (=> b!446117 (= res!264790 (and (= (size!13580 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13581 _keys!709) (size!13580 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446118 () Bool)

(declare-fun e!262112 () Bool)

(declare-fun tp_is_empty!11877 () Bool)

(assert (=> b!446118 (= e!262112 tp_is_empty!11877)))

(declare-fun b!446119 () Bool)

(assert (=> b!446119 (= e!262109 tp_is_empty!11877)))

(declare-fun res!264793 () Bool)

(assert (=> start!40492 (=> (not res!264793) (not e!262111))))

(assert (=> start!40492 (= res!264793 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13581 _keys!709))))))

(assert (=> start!40492 e!262111))

(assert (=> start!40492 tp_is_empty!11877))

(assert (=> start!40492 tp!37466))

(assert (=> start!40492 true))

(declare-fun array_inv!9592 (array!27561) Bool)

(assert (=> start!40492 (and (array_inv!9592 _values!549) e!262110)))

(declare-fun array_inv!9593 (array!27563) Bool)

(assert (=> start!40492 (array_inv!9593 _keys!709)))

(declare-fun b!446120 () Bool)

(declare-fun res!264786 () Bool)

(assert (=> b!446120 (=> (not res!264786) (not e!262111))))

(assert (=> b!446120 (= res!264786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446121 () Bool)

(declare-fun res!264791 () Bool)

(assert (=> b!446121 (=> (not res!264791) (not e!262106))))

(assert (=> b!446121 (= res!264791 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13581 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!446122 () Bool)

(declare-fun res!264784 () Bool)

(assert (=> b!446122 (=> (not res!264784) (not e!262111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446122 (= res!264784 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19443 () Bool)

(assert (=> mapIsEmpty!19443 mapRes!19443))

(declare-fun b!446123 () Bool)

(declare-fun call!29646 () ListLongMap!6775)

(declare-fun call!29645 () ListLongMap!6775)

(declare-fun +!1533 (ListLongMap!6775 tuple2!7862) ListLongMap!6775)

(assert (=> b!446123 (= e!262107 (= call!29645 (+!1533 call!29646 (tuple2!7863 k0!794 v!412))))))

(declare-fun b!446124 () Bool)

(declare-fun res!264787 () Bool)

(assert (=> b!446124 (=> (not res!264787) (not e!262111))))

(assert (=> b!446124 (= res!264787 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13581 _keys!709))))))

(declare-fun b!446125 () Bool)

(assert (=> b!446125 (= e!262107 (= call!29646 call!29645))))

(declare-fun bm!29642 () Bool)

(assert (=> bm!29642 (= call!29646 (getCurrentListMapNoExtraKeys!1589 (ite c!55890 _keys!709 lt!203714) (ite c!55890 _values!549 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29643 () Bool)

(assert (=> bm!29643 (= call!29645 (getCurrentListMapNoExtraKeys!1589 (ite c!55890 lt!203714 _keys!709) (ite c!55890 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446126 () Bool)

(declare-fun res!264789 () Bool)

(assert (=> b!446126 (=> (not res!264789) (not e!262111))))

(assert (=> b!446126 (= res!264789 (or (= (select (arr!13229 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13229 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19443 () Bool)

(declare-fun tp!37467 () Bool)

(assert (=> mapNonEmpty!19443 (= mapRes!19443 (and tp!37467 e!262112))))

(declare-fun mapRest!19443 () (Array (_ BitVec 32) ValueCell!5595))

(declare-fun mapKey!19443 () (_ BitVec 32))

(declare-fun mapValue!19443 () ValueCell!5595)

(assert (=> mapNonEmpty!19443 (= (arr!13228 _values!549) (store mapRest!19443 mapKey!19443 mapValue!19443))))

(declare-fun b!446127 () Bool)

(declare-fun res!264785 () Bool)

(assert (=> b!446127 (=> (not res!264785) (not e!262111))))

(declare-datatypes ((List!7914 0))(
  ( (Nil!7911) (Cons!7910 (h!8766 (_ BitVec 64)) (t!13672 List!7914)) )
))
(declare-fun arrayNoDuplicates!0 (array!27563 (_ BitVec 32) List!7914) Bool)

(assert (=> b!446127 (= res!264785 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7911))))

(declare-fun b!446128 () Bool)

(declare-fun res!264783 () Bool)

(assert (=> b!446128 (=> (not res!264783) (not e!262111))))

(declare-fun arrayContainsKey!0 (array!27563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446128 (= res!264783 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446129 () Bool)

(declare-fun res!264788 () Bool)

(assert (=> b!446129 (=> (not res!264788) (not e!262106))))

(assert (=> b!446129 (= res!264788 (arrayNoDuplicates!0 lt!203714 #b00000000000000000000000000000000 Nil!7911))))

(assert (= (and start!40492 res!264793) b!446122))

(assert (= (and b!446122 res!264784) b!446117))

(assert (= (and b!446117 res!264790) b!446120))

(assert (= (and b!446120 res!264786) b!446127))

(assert (= (and b!446127 res!264785) b!446124))

(assert (= (and b!446124 res!264787) b!446114))

(assert (= (and b!446114 res!264792) b!446126))

(assert (= (and b!446126 res!264789) b!446128))

(assert (= (and b!446128 res!264783) b!446115))

(assert (= (and b!446115 res!264782) b!446129))

(assert (= (and b!446129 res!264788) b!446121))

(assert (= (and b!446121 res!264791) b!446113))

(assert (= (and b!446113 c!55890) b!446123))

(assert (= (and b!446113 (not c!55890)) b!446125))

(assert (= (or b!446123 b!446125) bm!29643))

(assert (= (or b!446123 b!446125) bm!29642))

(assert (= (and b!446116 condMapEmpty!19443) mapIsEmpty!19443))

(assert (= (and b!446116 (not condMapEmpty!19443)) mapNonEmpty!19443))

(get-info :version)

(assert (= (and mapNonEmpty!19443 ((_ is ValueCellFull!5595) mapValue!19443)) b!446118))

(assert (= (and b!446116 ((_ is ValueCellFull!5595) mapDefault!19443)) b!446119))

(assert (= start!40492 b!446116))

(declare-fun m!431379 () Bool)

(assert (=> bm!29642 m!431379))

(declare-fun m!431381 () Bool)

(assert (=> bm!29642 m!431381))

(declare-fun m!431383 () Bool)

(assert (=> b!446123 m!431383))

(declare-fun m!431385 () Bool)

(assert (=> start!40492 m!431385))

(declare-fun m!431387 () Bool)

(assert (=> start!40492 m!431387))

(declare-fun m!431389 () Bool)

(assert (=> b!446126 m!431389))

(declare-fun m!431391 () Bool)

(assert (=> b!446114 m!431391))

(declare-fun m!431393 () Bool)

(assert (=> b!446129 m!431393))

(declare-fun m!431395 () Bool)

(assert (=> b!446128 m!431395))

(declare-fun m!431397 () Bool)

(assert (=> b!446127 m!431397))

(assert (=> b!446113 m!431379))

(declare-fun m!431399 () Bool)

(assert (=> b!446113 m!431399))

(declare-fun m!431401 () Bool)

(assert (=> b!446113 m!431401))

(declare-fun m!431403 () Bool)

(assert (=> b!446113 m!431403))

(assert (=> bm!29643 m!431379))

(declare-fun m!431405 () Bool)

(assert (=> bm!29643 m!431405))

(declare-fun m!431407 () Bool)

(assert (=> b!446120 m!431407))

(declare-fun m!431409 () Bool)

(assert (=> mapNonEmpty!19443 m!431409))

(declare-fun m!431411 () Bool)

(assert (=> b!446122 m!431411))

(declare-fun m!431413 () Bool)

(assert (=> b!446115 m!431413))

(declare-fun m!431415 () Bool)

(assert (=> b!446115 m!431415))

(check-sat (not b!446128) b_and!18547 (not b!446129) tp_is_empty!11877 (not b_next!10563) (not mapNonEmpty!19443) (not b!446127) (not b!446113) (not b!446115) (not bm!29643) (not b!446122) (not start!40492) (not b!446123) (not bm!29642) (not b!446114) (not b!446120))
(check-sat b_and!18547 (not b_next!10563))
(get-model)

(declare-fun b!446205 () Bool)

(declare-fun e!262154 () ListLongMap!6775)

(declare-fun e!262150 () ListLongMap!6775)

(assert (=> b!446205 (= e!262154 e!262150)))

(declare-fun c!55902 () Bool)

(assert (=> b!446205 (= c!55902 (validKeyInArray!0 (select (arr!13229 lt!203714) from!863)))))

(declare-fun b!446206 () Bool)

(declare-fun e!262148 () Bool)

(assert (=> b!446206 (= e!262148 (validKeyInArray!0 (select (arr!13229 lt!203714) from!863)))))

(assert (=> b!446206 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!446207 () Bool)

(declare-fun e!262151 () Bool)

(declare-fun lt!203741 () ListLongMap!6775)

(declare-fun isEmpty!556 (ListLongMap!6775) Bool)

(assert (=> b!446207 (= e!262151 (isEmpty!556 lt!203741))))

(declare-fun b!446208 () Bool)

(declare-fun res!264841 () Bool)

(declare-fun e!262152 () Bool)

(assert (=> b!446208 (=> (not res!264841) (not e!262152))))

(declare-fun contains!2489 (ListLongMap!6775 (_ BitVec 64)) Bool)

(assert (=> b!446208 (= res!264841 (not (contains!2489 lt!203741 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446209 () Bool)

(declare-fun call!29655 () ListLongMap!6775)

(assert (=> b!446209 (= e!262150 call!29655)))

(declare-fun b!446210 () Bool)

(assert (=> b!446210 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13581 lt!203714)))))

(assert (=> b!446210 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13580 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)))))))

(declare-fun e!262153 () Bool)

(declare-fun apply!310 (ListLongMap!6775 (_ BitVec 64)) V!16941)

(declare-fun get!6538 (ValueCell!5595 V!16941) V!16941)

(declare-fun dynLambda!849 (Int (_ BitVec 64)) V!16941)

(assert (=> b!446210 (= e!262153 (= (apply!310 lt!203741 (select (arr!13229 lt!203714) from!863)) (get!6538 (select (arr!13228 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549))) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!74143 () Bool)

(assert (=> d!74143 e!262152))

(declare-fun res!264838 () Bool)

(assert (=> d!74143 (=> (not res!264838) (not e!262152))))

(assert (=> d!74143 (= res!264838 (not (contains!2489 lt!203741 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74143 (= lt!203741 e!262154)))

(declare-fun c!55905 () Bool)

(assert (=> d!74143 (= c!55905 (bvsge from!863 (size!13581 lt!203714)))))

(assert (=> d!74143 (validMask!0 mask!1025)))

(assert (=> d!74143 (= (getCurrentListMapNoExtraKeys!1589 lt!203714 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203741)))

(declare-fun b!446211 () Bool)

(declare-fun e!262149 () Bool)

(assert (=> b!446211 (= e!262152 e!262149)))

(declare-fun c!55903 () Bool)

(assert (=> b!446211 (= c!55903 e!262148)))

(declare-fun res!264839 () Bool)

(assert (=> b!446211 (=> (not res!264839) (not e!262148))))

(assert (=> b!446211 (= res!264839 (bvslt from!863 (size!13581 lt!203714)))))

(declare-fun b!446212 () Bool)

(declare-fun lt!203736 () Unit!13176)

(declare-fun lt!203738 () Unit!13176)

(assert (=> b!446212 (= lt!203736 lt!203738)))

(declare-fun lt!203740 () V!16941)

(declare-fun lt!203735 () (_ BitVec 64))

(declare-fun lt!203737 () (_ BitVec 64))

(declare-fun lt!203739 () ListLongMap!6775)

(assert (=> b!446212 (not (contains!2489 (+!1533 lt!203739 (tuple2!7863 lt!203737 lt!203740)) lt!203735))))

(declare-fun addStillNotContains!143 (ListLongMap!6775 (_ BitVec 64) V!16941 (_ BitVec 64)) Unit!13176)

(assert (=> b!446212 (= lt!203738 (addStillNotContains!143 lt!203739 lt!203737 lt!203740 lt!203735))))

(assert (=> b!446212 (= lt!203735 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446212 (= lt!203740 (get!6538 (select (arr!13228 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549))) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446212 (= lt!203737 (select (arr!13229 lt!203714) from!863))))

(assert (=> b!446212 (= lt!203739 call!29655)))

(assert (=> b!446212 (= e!262150 (+!1533 call!29655 (tuple2!7863 (select (arr!13229 lt!203714) from!863) (get!6538 (select (arr!13228 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549))) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446213 () Bool)

(assert (=> b!446213 (= e!262149 e!262151)))

(declare-fun c!55904 () Bool)

(assert (=> b!446213 (= c!55904 (bvslt from!863 (size!13581 lt!203714)))))

(declare-fun b!446214 () Bool)

(assert (=> b!446214 (= e!262151 (= lt!203741 (getCurrentListMapNoExtraKeys!1589 lt!203714 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446215 () Bool)

(assert (=> b!446215 (= e!262154 (ListLongMap!6776 Nil!7910))))

(declare-fun b!446216 () Bool)

(assert (=> b!446216 (= e!262149 e!262153)))

(assert (=> b!446216 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13581 lt!203714)))))

(declare-fun res!264840 () Bool)

(assert (=> b!446216 (= res!264840 (contains!2489 lt!203741 (select (arr!13229 lt!203714) from!863)))))

(assert (=> b!446216 (=> (not res!264840) (not e!262153))))

(declare-fun bm!29652 () Bool)

(assert (=> bm!29652 (= call!29655 (getCurrentListMapNoExtraKeys!1589 lt!203714 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74143 c!55905) b!446215))

(assert (= (and d!74143 (not c!55905)) b!446205))

(assert (= (and b!446205 c!55902) b!446212))

(assert (= (and b!446205 (not c!55902)) b!446209))

(assert (= (or b!446212 b!446209) bm!29652))

(assert (= (and d!74143 res!264838) b!446208))

(assert (= (and b!446208 res!264841) b!446211))

(assert (= (and b!446211 res!264839) b!446206))

(assert (= (and b!446211 c!55903) b!446216))

(assert (= (and b!446211 (not c!55903)) b!446213))

(assert (= (and b!446216 res!264840) b!446210))

(assert (= (and b!446213 c!55904) b!446214))

(assert (= (and b!446213 (not c!55904)) b!446207))

(declare-fun b_lambda!9429 () Bool)

(assert (=> (not b_lambda!9429) (not b!446210)))

(declare-fun t!13676 () Bool)

(declare-fun tb!3717 () Bool)

(assert (=> (and start!40492 (= defaultEntry!557 defaultEntry!557) t!13676) tb!3717))

(declare-fun result!6965 () Bool)

(assert (=> tb!3717 (= result!6965 tp_is_empty!11877)))

(assert (=> b!446210 t!13676))

(declare-fun b_and!18551 () Bool)

(assert (= b_and!18547 (and (=> t!13676 result!6965) b_and!18551)))

(declare-fun b_lambda!9431 () Bool)

(assert (=> (not b_lambda!9431) (not b!446212)))

(assert (=> b!446212 t!13676))

(declare-fun b_and!18553 () Bool)

(assert (= b_and!18551 (and (=> t!13676 result!6965) b_and!18553)))

(declare-fun m!431455 () Bool)

(assert (=> b!446212 m!431455))

(declare-fun m!431457 () Bool)

(assert (=> b!446212 m!431457))

(declare-fun m!431459 () Bool)

(assert (=> b!446212 m!431459))

(declare-fun m!431461 () Bool)

(assert (=> b!446212 m!431461))

(declare-fun m!431463 () Bool)

(assert (=> b!446212 m!431463))

(assert (=> b!446212 m!431455))

(declare-fun m!431465 () Bool)

(assert (=> b!446212 m!431465))

(declare-fun m!431467 () Bool)

(assert (=> b!446212 m!431467))

(assert (=> b!446212 m!431459))

(declare-fun m!431469 () Bool)

(assert (=> b!446212 m!431469))

(assert (=> b!446212 m!431463))

(assert (=> b!446216 m!431469))

(assert (=> b!446216 m!431469))

(declare-fun m!431471 () Bool)

(assert (=> b!446216 m!431471))

(assert (=> b!446210 m!431455))

(assert (=> b!446210 m!431469))

(declare-fun m!431473 () Bool)

(assert (=> b!446210 m!431473))

(assert (=> b!446210 m!431463))

(assert (=> b!446210 m!431455))

(assert (=> b!446210 m!431465))

(assert (=> b!446210 m!431469))

(assert (=> b!446210 m!431463))

(assert (=> b!446205 m!431469))

(assert (=> b!446205 m!431469))

(declare-fun m!431475 () Bool)

(assert (=> b!446205 m!431475))

(declare-fun m!431477 () Bool)

(assert (=> b!446214 m!431477))

(declare-fun m!431479 () Bool)

(assert (=> d!74143 m!431479))

(assert (=> d!74143 m!431411))

(assert (=> b!446206 m!431469))

(assert (=> b!446206 m!431469))

(assert (=> b!446206 m!431475))

(assert (=> bm!29652 m!431477))

(declare-fun m!431481 () Bool)

(assert (=> b!446207 m!431481))

(declare-fun m!431483 () Bool)

(assert (=> b!446208 m!431483))

(assert (=> b!446113 d!74143))

(declare-fun b!446219 () Bool)

(declare-fun e!262161 () ListLongMap!6775)

(declare-fun e!262157 () ListLongMap!6775)

(assert (=> b!446219 (= e!262161 e!262157)))

(declare-fun c!55906 () Bool)

(assert (=> b!446219 (= c!55906 (validKeyInArray!0 (select (arr!13229 _keys!709) from!863)))))

(declare-fun b!446220 () Bool)

(declare-fun e!262155 () Bool)

(assert (=> b!446220 (= e!262155 (validKeyInArray!0 (select (arr!13229 _keys!709) from!863)))))

(assert (=> b!446220 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!446221 () Bool)

(declare-fun e!262158 () Bool)

(declare-fun lt!203748 () ListLongMap!6775)

(assert (=> b!446221 (= e!262158 (isEmpty!556 lt!203748))))

(declare-fun b!446222 () Bool)

(declare-fun res!264845 () Bool)

(declare-fun e!262159 () Bool)

(assert (=> b!446222 (=> (not res!264845) (not e!262159))))

(assert (=> b!446222 (= res!264845 (not (contains!2489 lt!203748 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446223 () Bool)

(declare-fun call!29656 () ListLongMap!6775)

(assert (=> b!446223 (= e!262157 call!29656)))

(declare-fun b!446224 () Bool)

(assert (=> b!446224 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13581 _keys!709)))))

(assert (=> b!446224 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13580 _values!549)))))

(declare-fun e!262160 () Bool)

(assert (=> b!446224 (= e!262160 (= (apply!310 lt!203748 (select (arr!13229 _keys!709) from!863)) (get!6538 (select (arr!13228 _values!549) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!74145 () Bool)

(assert (=> d!74145 e!262159))

(declare-fun res!264842 () Bool)

(assert (=> d!74145 (=> (not res!264842) (not e!262159))))

(assert (=> d!74145 (= res!264842 (not (contains!2489 lt!203748 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74145 (= lt!203748 e!262161)))

(declare-fun c!55909 () Bool)

(assert (=> d!74145 (= c!55909 (bvsge from!863 (size!13581 _keys!709)))))

(assert (=> d!74145 (validMask!0 mask!1025)))

(assert (=> d!74145 (= (getCurrentListMapNoExtraKeys!1589 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203748)))

(declare-fun b!446225 () Bool)

(declare-fun e!262156 () Bool)

(assert (=> b!446225 (= e!262159 e!262156)))

(declare-fun c!55907 () Bool)

(assert (=> b!446225 (= c!55907 e!262155)))

(declare-fun res!264843 () Bool)

(assert (=> b!446225 (=> (not res!264843) (not e!262155))))

(assert (=> b!446225 (= res!264843 (bvslt from!863 (size!13581 _keys!709)))))

(declare-fun b!446226 () Bool)

(declare-fun lt!203743 () Unit!13176)

(declare-fun lt!203745 () Unit!13176)

(assert (=> b!446226 (= lt!203743 lt!203745)))

(declare-fun lt!203742 () (_ BitVec 64))

(declare-fun lt!203744 () (_ BitVec 64))

(declare-fun lt!203747 () V!16941)

(declare-fun lt!203746 () ListLongMap!6775)

(assert (=> b!446226 (not (contains!2489 (+!1533 lt!203746 (tuple2!7863 lt!203744 lt!203747)) lt!203742))))

(assert (=> b!446226 (= lt!203745 (addStillNotContains!143 lt!203746 lt!203744 lt!203747 lt!203742))))

(assert (=> b!446226 (= lt!203742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446226 (= lt!203747 (get!6538 (select (arr!13228 _values!549) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446226 (= lt!203744 (select (arr!13229 _keys!709) from!863))))

(assert (=> b!446226 (= lt!203746 call!29656)))

(assert (=> b!446226 (= e!262157 (+!1533 call!29656 (tuple2!7863 (select (arr!13229 _keys!709) from!863) (get!6538 (select (arr!13228 _values!549) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446227 () Bool)

(assert (=> b!446227 (= e!262156 e!262158)))

(declare-fun c!55908 () Bool)

(assert (=> b!446227 (= c!55908 (bvslt from!863 (size!13581 _keys!709)))))

(declare-fun b!446228 () Bool)

(assert (=> b!446228 (= e!262158 (= lt!203748 (getCurrentListMapNoExtraKeys!1589 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446229 () Bool)

(assert (=> b!446229 (= e!262161 (ListLongMap!6776 Nil!7910))))

(declare-fun b!446230 () Bool)

(assert (=> b!446230 (= e!262156 e!262160)))

(assert (=> b!446230 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13581 _keys!709)))))

(declare-fun res!264844 () Bool)

(assert (=> b!446230 (= res!264844 (contains!2489 lt!203748 (select (arr!13229 _keys!709) from!863)))))

(assert (=> b!446230 (=> (not res!264844) (not e!262160))))

(declare-fun bm!29653 () Bool)

(assert (=> bm!29653 (= call!29656 (getCurrentListMapNoExtraKeys!1589 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74145 c!55909) b!446229))

(assert (= (and d!74145 (not c!55909)) b!446219))

(assert (= (and b!446219 c!55906) b!446226))

(assert (= (and b!446219 (not c!55906)) b!446223))

(assert (= (or b!446226 b!446223) bm!29653))

(assert (= (and d!74145 res!264842) b!446222))

(assert (= (and b!446222 res!264845) b!446225))

(assert (= (and b!446225 res!264843) b!446220))

(assert (= (and b!446225 c!55907) b!446230))

(assert (= (and b!446225 (not c!55907)) b!446227))

(assert (= (and b!446230 res!264844) b!446224))

(assert (= (and b!446227 c!55908) b!446228))

(assert (= (and b!446227 (not c!55908)) b!446221))

(declare-fun b_lambda!9433 () Bool)

(assert (=> (not b_lambda!9433) (not b!446224)))

(assert (=> b!446224 t!13676))

(declare-fun b_and!18555 () Bool)

(assert (= b_and!18553 (and (=> t!13676 result!6965) b_and!18555)))

(declare-fun b_lambda!9435 () Bool)

(assert (=> (not b_lambda!9435) (not b!446226)))

(assert (=> b!446226 t!13676))

(declare-fun b_and!18557 () Bool)

(assert (= b_and!18555 (and (=> t!13676 result!6965) b_and!18557)))

(assert (=> b!446226 m!431455))

(declare-fun m!431485 () Bool)

(assert (=> b!446226 m!431485))

(declare-fun m!431487 () Bool)

(assert (=> b!446226 m!431487))

(declare-fun m!431489 () Bool)

(assert (=> b!446226 m!431489))

(declare-fun m!431491 () Bool)

(assert (=> b!446226 m!431491))

(assert (=> b!446226 m!431455))

(declare-fun m!431493 () Bool)

(assert (=> b!446226 m!431493))

(declare-fun m!431495 () Bool)

(assert (=> b!446226 m!431495))

(assert (=> b!446226 m!431487))

(declare-fun m!431497 () Bool)

(assert (=> b!446226 m!431497))

(assert (=> b!446226 m!431491))

(assert (=> b!446230 m!431497))

(assert (=> b!446230 m!431497))

(declare-fun m!431499 () Bool)

(assert (=> b!446230 m!431499))

(assert (=> b!446224 m!431455))

(assert (=> b!446224 m!431497))

(declare-fun m!431501 () Bool)

(assert (=> b!446224 m!431501))

(assert (=> b!446224 m!431491))

(assert (=> b!446224 m!431455))

(assert (=> b!446224 m!431493))

(assert (=> b!446224 m!431497))

(assert (=> b!446224 m!431491))

(assert (=> b!446219 m!431497))

(assert (=> b!446219 m!431497))

(declare-fun m!431503 () Bool)

(assert (=> b!446219 m!431503))

(declare-fun m!431505 () Bool)

(assert (=> b!446228 m!431505))

(declare-fun m!431507 () Bool)

(assert (=> d!74145 m!431507))

(assert (=> d!74145 m!431411))

(assert (=> b!446220 m!431497))

(assert (=> b!446220 m!431497))

(assert (=> b!446220 m!431503))

(assert (=> bm!29653 m!431505))

(declare-fun m!431509 () Bool)

(assert (=> b!446221 m!431509))

(declare-fun m!431511 () Bool)

(assert (=> b!446222 m!431511))

(assert (=> b!446113 d!74145))

(declare-fun call!29662 () ListLongMap!6775)

(declare-fun bm!29658 () Bool)

(assert (=> bm!29658 (= call!29662 (getCurrentListMapNoExtraKeys!1589 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446237 () Bool)

(declare-fun e!262167 () Bool)

(declare-fun e!262166 () Bool)

(assert (=> b!446237 (= e!262167 e!262166)))

(declare-fun c!55912 () Bool)

(assert (=> b!446237 (= c!55912 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun bm!29659 () Bool)

(declare-fun call!29661 () ListLongMap!6775)

(assert (=> bm!29659 (= call!29661 (getCurrentListMapNoExtraKeys!1589 (array!27564 (store (arr!13229 _keys!709) i!563 k0!794) (size!13581 _keys!709)) (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun d!74147 () Bool)

(assert (=> d!74147 e!262167))

(declare-fun res!264848 () Bool)

(assert (=> d!74147 (=> (not res!264848) (not e!262167))))

(assert (=> d!74147 (= res!264848 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13581 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13580 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13581 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13580 _values!549))))))))

(declare-fun lt!203751 () Unit!13176)

(declare-fun choose!1325 (array!27563 array!27561 (_ BitVec 32) (_ BitVec 32) V!16941 V!16941 (_ BitVec 32) (_ BitVec 64) V!16941 (_ BitVec 32) Int) Unit!13176)

(assert (=> d!74147 (= lt!203751 (choose!1325 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74147 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13581 _keys!709)))))

(assert (=> d!74147 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!704 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203751)))

(declare-fun b!446238 () Bool)

(assert (=> b!446238 (= e!262166 (= call!29661 (+!1533 call!29662 (tuple2!7863 k0!794 v!412))))))

(declare-fun b!446239 () Bool)

(assert (=> b!446239 (= e!262166 (= call!29661 call!29662))))

(assert (= (and d!74147 res!264848) b!446237))

(assert (= (and b!446237 c!55912) b!446238))

(assert (= (and b!446237 (not c!55912)) b!446239))

(assert (= (or b!446238 b!446239) bm!29658))

(assert (= (or b!446238 b!446239) bm!29659))

(declare-fun m!431513 () Bool)

(assert (=> bm!29658 m!431513))

(assert (=> bm!29659 m!431415))

(assert (=> bm!29659 m!431379))

(declare-fun m!431515 () Bool)

(assert (=> bm!29659 m!431515))

(declare-fun m!431517 () Bool)

(assert (=> d!74147 m!431517))

(declare-fun m!431519 () Bool)

(assert (=> b!446238 m!431519))

(assert (=> b!446113 d!74147))

(declare-fun d!74149 () Bool)

(declare-fun e!262170 () Bool)

(assert (=> d!74149 e!262170))

(declare-fun res!264853 () Bool)

(assert (=> d!74149 (=> (not res!264853) (not e!262170))))

(declare-fun lt!203763 () ListLongMap!6775)

(assert (=> d!74149 (= res!264853 (contains!2489 lt!203763 (_1!3942 (tuple2!7863 k0!794 v!412))))))

(declare-fun lt!203760 () List!7913)

(assert (=> d!74149 (= lt!203763 (ListLongMap!6776 lt!203760))))

(declare-fun lt!203761 () Unit!13176)

(declare-fun lt!203762 () Unit!13176)

(assert (=> d!74149 (= lt!203761 lt!203762)))

(declare-datatypes ((Option!374 0))(
  ( (Some!373 (v!8239 V!16941)) (None!372) )
))
(declare-fun getValueByKey!368 (List!7913 (_ BitVec 64)) Option!374)

(assert (=> d!74149 (= (getValueByKey!368 lt!203760 (_1!3942 (tuple2!7863 k0!794 v!412))) (Some!373 (_2!3942 (tuple2!7863 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!190 (List!7913 (_ BitVec 64) V!16941) Unit!13176)

(assert (=> d!74149 (= lt!203762 (lemmaContainsTupThenGetReturnValue!190 lt!203760 (_1!3942 (tuple2!7863 k0!794 v!412)) (_2!3942 (tuple2!7863 k0!794 v!412))))))

(declare-fun insertStrictlySorted!193 (List!7913 (_ BitVec 64) V!16941) List!7913)

(assert (=> d!74149 (= lt!203760 (insertStrictlySorted!193 (toList!3403 call!29646) (_1!3942 (tuple2!7863 k0!794 v!412)) (_2!3942 (tuple2!7863 k0!794 v!412))))))

(assert (=> d!74149 (= (+!1533 call!29646 (tuple2!7863 k0!794 v!412)) lt!203763)))

(declare-fun b!446244 () Bool)

(declare-fun res!264854 () Bool)

(assert (=> b!446244 (=> (not res!264854) (not e!262170))))

(assert (=> b!446244 (= res!264854 (= (getValueByKey!368 (toList!3403 lt!203763) (_1!3942 (tuple2!7863 k0!794 v!412))) (Some!373 (_2!3942 (tuple2!7863 k0!794 v!412)))))))

(declare-fun b!446245 () Bool)

(declare-fun contains!2490 (List!7913 tuple2!7862) Bool)

(assert (=> b!446245 (= e!262170 (contains!2490 (toList!3403 lt!203763) (tuple2!7863 k0!794 v!412)))))

(assert (= (and d!74149 res!264853) b!446244))

(assert (= (and b!446244 res!264854) b!446245))

(declare-fun m!431521 () Bool)

(assert (=> d!74149 m!431521))

(declare-fun m!431523 () Bool)

(assert (=> d!74149 m!431523))

(declare-fun m!431525 () Bool)

(assert (=> d!74149 m!431525))

(declare-fun m!431527 () Bool)

(assert (=> d!74149 m!431527))

(declare-fun m!431529 () Bool)

(assert (=> b!446244 m!431529))

(declare-fun m!431531 () Bool)

(assert (=> b!446245 m!431531))

(assert (=> b!446123 d!74149))

(declare-fun d!74151 () Bool)

(assert (=> d!74151 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!446114 d!74151))

(declare-fun b!446254 () Bool)

(declare-fun e!262178 () Bool)

(declare-fun e!262177 () Bool)

(assert (=> b!446254 (= e!262178 e!262177)))

(declare-fun lt!203770 () (_ BitVec 64))

(assert (=> b!446254 (= lt!203770 (select (arr!13229 lt!203714) #b00000000000000000000000000000000))))

(declare-fun lt!203771 () Unit!13176)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27563 (_ BitVec 64) (_ BitVec 32)) Unit!13176)

(assert (=> b!446254 (= lt!203771 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203714 lt!203770 #b00000000000000000000000000000000))))

(assert (=> b!446254 (arrayContainsKey!0 lt!203714 lt!203770 #b00000000000000000000000000000000)))

(declare-fun lt!203772 () Unit!13176)

(assert (=> b!446254 (= lt!203772 lt!203771)))

(declare-fun res!264859 () Bool)

(declare-datatypes ((SeekEntryResult!3529 0))(
  ( (MissingZero!3529 (index!16295 (_ BitVec 32))) (Found!3529 (index!16296 (_ BitVec 32))) (Intermediate!3529 (undefined!4341 Bool) (index!16297 (_ BitVec 32)) (x!42007 (_ BitVec 32))) (Undefined!3529) (MissingVacant!3529 (index!16298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27563 (_ BitVec 32)) SeekEntryResult!3529)

(assert (=> b!446254 (= res!264859 (= (seekEntryOrOpen!0 (select (arr!13229 lt!203714) #b00000000000000000000000000000000) lt!203714 mask!1025) (Found!3529 #b00000000000000000000000000000000)))))

(assert (=> b!446254 (=> (not res!264859) (not e!262177))))

(declare-fun b!446255 () Bool)

(declare-fun e!262179 () Bool)

(assert (=> b!446255 (= e!262179 e!262178)))

(declare-fun c!55915 () Bool)

(assert (=> b!446255 (= c!55915 (validKeyInArray!0 (select (arr!13229 lt!203714) #b00000000000000000000000000000000)))))

(declare-fun b!446256 () Bool)

(declare-fun call!29665 () Bool)

(assert (=> b!446256 (= e!262178 call!29665)))

(declare-fun d!74153 () Bool)

(declare-fun res!264860 () Bool)

(assert (=> d!74153 (=> res!264860 e!262179)))

(assert (=> d!74153 (= res!264860 (bvsge #b00000000000000000000000000000000 (size!13581 lt!203714)))))

(assert (=> d!74153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203714 mask!1025) e!262179)))

(declare-fun b!446257 () Bool)

(assert (=> b!446257 (= e!262177 call!29665)))

(declare-fun bm!29662 () Bool)

(assert (=> bm!29662 (= call!29665 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203714 mask!1025))))

(assert (= (and d!74153 (not res!264860)) b!446255))

(assert (= (and b!446255 c!55915) b!446254))

(assert (= (and b!446255 (not c!55915)) b!446256))

(assert (= (and b!446254 res!264859) b!446257))

(assert (= (or b!446257 b!446256) bm!29662))

(declare-fun m!431533 () Bool)

(assert (=> b!446254 m!431533))

(declare-fun m!431535 () Bool)

(assert (=> b!446254 m!431535))

(declare-fun m!431537 () Bool)

(assert (=> b!446254 m!431537))

(assert (=> b!446254 m!431533))

(declare-fun m!431539 () Bool)

(assert (=> b!446254 m!431539))

(assert (=> b!446255 m!431533))

(assert (=> b!446255 m!431533))

(declare-fun m!431541 () Bool)

(assert (=> b!446255 m!431541))

(declare-fun m!431543 () Bool)

(assert (=> bm!29662 m!431543))

(assert (=> b!446115 d!74153))

(declare-fun b!446258 () Bool)

(declare-fun e!262186 () ListLongMap!6775)

(declare-fun e!262182 () ListLongMap!6775)

(assert (=> b!446258 (= e!262186 e!262182)))

(declare-fun c!55916 () Bool)

(assert (=> b!446258 (= c!55916 (validKeyInArray!0 (select (arr!13229 (ite c!55890 _keys!709 lt!203714)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!262180 () Bool)

(declare-fun b!446259 () Bool)

(assert (=> b!446259 (= e!262180 (validKeyInArray!0 (select (arr!13229 (ite c!55890 _keys!709 lt!203714)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!446259 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!446260 () Bool)

(declare-fun e!262183 () Bool)

(declare-fun lt!203779 () ListLongMap!6775)

(assert (=> b!446260 (= e!262183 (isEmpty!556 lt!203779))))

(declare-fun b!446261 () Bool)

(declare-fun res!264864 () Bool)

(declare-fun e!262184 () Bool)

(assert (=> b!446261 (=> (not res!264864) (not e!262184))))

(assert (=> b!446261 (= res!264864 (not (contains!2489 lt!203779 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446262 () Bool)

(declare-fun call!29666 () ListLongMap!6775)

(assert (=> b!446262 (= e!262182 call!29666)))

(declare-fun b!446263 () Bool)

(assert (=> b!446263 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 _keys!709 lt!203714))))))

(assert (=> b!446263 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13580 (ite c!55890 _values!549 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549))))))))

(declare-fun e!262185 () Bool)

(assert (=> b!446263 (= e!262185 (= (apply!310 lt!203779 (select (arr!13229 (ite c!55890 _keys!709 lt!203714)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6538 (select (arr!13228 (ite c!55890 _values!549 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!74155 () Bool)

(assert (=> d!74155 e!262184))

(declare-fun res!264861 () Bool)

(assert (=> d!74155 (=> (not res!264861) (not e!262184))))

(assert (=> d!74155 (= res!264861 (not (contains!2489 lt!203779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74155 (= lt!203779 e!262186)))

(declare-fun c!55919 () Bool)

(assert (=> d!74155 (= c!55919 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 _keys!709 lt!203714))))))

(assert (=> d!74155 (validMask!0 mask!1025)))

(assert (=> d!74155 (= (getCurrentListMapNoExtraKeys!1589 (ite c!55890 _keys!709 lt!203714) (ite c!55890 _values!549 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203779)))

(declare-fun b!446264 () Bool)

(declare-fun e!262181 () Bool)

(assert (=> b!446264 (= e!262184 e!262181)))

(declare-fun c!55917 () Bool)

(assert (=> b!446264 (= c!55917 e!262180)))

(declare-fun res!264862 () Bool)

(assert (=> b!446264 (=> (not res!264862) (not e!262180))))

(assert (=> b!446264 (= res!264862 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 _keys!709 lt!203714))))))

(declare-fun b!446265 () Bool)

(declare-fun lt!203774 () Unit!13176)

(declare-fun lt!203776 () Unit!13176)

(assert (=> b!446265 (= lt!203774 lt!203776)))

(declare-fun lt!203777 () ListLongMap!6775)

(declare-fun lt!203778 () V!16941)

(declare-fun lt!203775 () (_ BitVec 64))

(declare-fun lt!203773 () (_ BitVec 64))

(assert (=> b!446265 (not (contains!2489 (+!1533 lt!203777 (tuple2!7863 lt!203775 lt!203778)) lt!203773))))

(assert (=> b!446265 (= lt!203776 (addStillNotContains!143 lt!203777 lt!203775 lt!203778 lt!203773))))

(assert (=> b!446265 (= lt!203773 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446265 (= lt!203778 (get!6538 (select (arr!13228 (ite c!55890 _values!549 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446265 (= lt!203775 (select (arr!13229 (ite c!55890 _keys!709 lt!203714)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!446265 (= lt!203777 call!29666)))

(assert (=> b!446265 (= e!262182 (+!1533 call!29666 (tuple2!7863 (select (arr!13229 (ite c!55890 _keys!709 lt!203714)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6538 (select (arr!13228 (ite c!55890 _values!549 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446266 () Bool)

(assert (=> b!446266 (= e!262181 e!262183)))

(declare-fun c!55918 () Bool)

(assert (=> b!446266 (= c!55918 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 _keys!709 lt!203714))))))

(declare-fun b!446267 () Bool)

(assert (=> b!446267 (= e!262183 (= lt!203779 (getCurrentListMapNoExtraKeys!1589 (ite c!55890 _keys!709 lt!203714) (ite c!55890 _values!549 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446268 () Bool)

(assert (=> b!446268 (= e!262186 (ListLongMap!6776 Nil!7910))))

(declare-fun b!446269 () Bool)

(assert (=> b!446269 (= e!262181 e!262185)))

(assert (=> b!446269 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 _keys!709 lt!203714))))))

(declare-fun res!264863 () Bool)

(assert (=> b!446269 (= res!264863 (contains!2489 lt!203779 (select (arr!13229 (ite c!55890 _keys!709 lt!203714)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!446269 (=> (not res!264863) (not e!262185))))

(declare-fun bm!29663 () Bool)

(assert (=> bm!29663 (= call!29666 (getCurrentListMapNoExtraKeys!1589 (ite c!55890 _keys!709 lt!203714) (ite c!55890 _values!549 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74155 c!55919) b!446268))

(assert (= (and d!74155 (not c!55919)) b!446258))

(assert (= (and b!446258 c!55916) b!446265))

(assert (= (and b!446258 (not c!55916)) b!446262))

(assert (= (or b!446265 b!446262) bm!29663))

(assert (= (and d!74155 res!264861) b!446261))

(assert (= (and b!446261 res!264864) b!446264))

(assert (= (and b!446264 res!264862) b!446259))

(assert (= (and b!446264 c!55917) b!446269))

(assert (= (and b!446264 (not c!55917)) b!446266))

(assert (= (and b!446269 res!264863) b!446263))

(assert (= (and b!446266 c!55918) b!446267))

(assert (= (and b!446266 (not c!55918)) b!446260))

(declare-fun b_lambda!9437 () Bool)

(assert (=> (not b_lambda!9437) (not b!446263)))

(assert (=> b!446263 t!13676))

(declare-fun b_and!18559 () Bool)

(assert (= b_and!18557 (and (=> t!13676 result!6965) b_and!18559)))

(declare-fun b_lambda!9439 () Bool)

(assert (=> (not b_lambda!9439) (not b!446265)))

(assert (=> b!446265 t!13676))

(declare-fun b_and!18561 () Bool)

(assert (= b_and!18559 (and (=> t!13676 result!6965) b_and!18561)))

(assert (=> b!446265 m!431455))

(declare-fun m!431545 () Bool)

(assert (=> b!446265 m!431545))

(declare-fun m!431547 () Bool)

(assert (=> b!446265 m!431547))

(declare-fun m!431549 () Bool)

(assert (=> b!446265 m!431549))

(declare-fun m!431551 () Bool)

(assert (=> b!446265 m!431551))

(assert (=> b!446265 m!431455))

(declare-fun m!431553 () Bool)

(assert (=> b!446265 m!431553))

(declare-fun m!431555 () Bool)

(assert (=> b!446265 m!431555))

(assert (=> b!446265 m!431547))

(declare-fun m!431557 () Bool)

(assert (=> b!446265 m!431557))

(assert (=> b!446265 m!431551))

(assert (=> b!446269 m!431557))

(assert (=> b!446269 m!431557))

(declare-fun m!431559 () Bool)

(assert (=> b!446269 m!431559))

(assert (=> b!446263 m!431455))

(assert (=> b!446263 m!431557))

(declare-fun m!431561 () Bool)

(assert (=> b!446263 m!431561))

(assert (=> b!446263 m!431551))

(assert (=> b!446263 m!431455))

(assert (=> b!446263 m!431553))

(assert (=> b!446263 m!431557))

(assert (=> b!446263 m!431551))

(assert (=> b!446258 m!431557))

(assert (=> b!446258 m!431557))

(declare-fun m!431563 () Bool)

(assert (=> b!446258 m!431563))

(declare-fun m!431565 () Bool)

(assert (=> b!446267 m!431565))

(declare-fun m!431567 () Bool)

(assert (=> d!74155 m!431567))

(assert (=> d!74155 m!431411))

(assert (=> b!446259 m!431557))

(assert (=> b!446259 m!431557))

(assert (=> b!446259 m!431563))

(assert (=> bm!29663 m!431565))

(declare-fun m!431569 () Bool)

(assert (=> b!446260 m!431569))

(declare-fun m!431571 () Bool)

(assert (=> b!446261 m!431571))

(assert (=> bm!29642 d!74155))

(declare-fun b!446270 () Bool)

(declare-fun e!262193 () ListLongMap!6775)

(declare-fun e!262189 () ListLongMap!6775)

(assert (=> b!446270 (= e!262193 e!262189)))

(declare-fun c!55920 () Bool)

(assert (=> b!446270 (= c!55920 (validKeyInArray!0 (select (arr!13229 (ite c!55890 lt!203714 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!262187 () Bool)

(declare-fun b!446271 () Bool)

(assert (=> b!446271 (= e!262187 (validKeyInArray!0 (select (arr!13229 (ite c!55890 lt!203714 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!446271 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!446272 () Bool)

(declare-fun e!262190 () Bool)

(declare-fun lt!203786 () ListLongMap!6775)

(assert (=> b!446272 (= e!262190 (isEmpty!556 lt!203786))))

(declare-fun b!446273 () Bool)

(declare-fun res!264868 () Bool)

(declare-fun e!262191 () Bool)

(assert (=> b!446273 (=> (not res!264868) (not e!262191))))

(assert (=> b!446273 (= res!264868 (not (contains!2489 lt!203786 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446274 () Bool)

(declare-fun call!29667 () ListLongMap!6775)

(assert (=> b!446274 (= e!262189 call!29667)))

(declare-fun b!446275 () Bool)

(assert (=> b!446275 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 lt!203714 _keys!709))))))

(assert (=> b!446275 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13580 (ite c!55890 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) _values!549))))))

(declare-fun e!262192 () Bool)

(assert (=> b!446275 (= e!262192 (= (apply!310 lt!203786 (select (arr!13229 (ite c!55890 lt!203714 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6538 (select (arr!13228 (ite c!55890 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!74157 () Bool)

(assert (=> d!74157 e!262191))

(declare-fun res!264865 () Bool)

(assert (=> d!74157 (=> (not res!264865) (not e!262191))))

(assert (=> d!74157 (= res!264865 (not (contains!2489 lt!203786 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74157 (= lt!203786 e!262193)))

(declare-fun c!55923 () Bool)

(assert (=> d!74157 (= c!55923 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 lt!203714 _keys!709))))))

(assert (=> d!74157 (validMask!0 mask!1025)))

(assert (=> d!74157 (= (getCurrentListMapNoExtraKeys!1589 (ite c!55890 lt!203714 _keys!709) (ite c!55890 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203786)))

(declare-fun b!446276 () Bool)

(declare-fun e!262188 () Bool)

(assert (=> b!446276 (= e!262191 e!262188)))

(declare-fun c!55921 () Bool)

(assert (=> b!446276 (= c!55921 e!262187)))

(declare-fun res!264866 () Bool)

(assert (=> b!446276 (=> (not res!264866) (not e!262187))))

(assert (=> b!446276 (= res!264866 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 lt!203714 _keys!709))))))

(declare-fun b!446277 () Bool)

(declare-fun lt!203781 () Unit!13176)

(declare-fun lt!203783 () Unit!13176)

(assert (=> b!446277 (= lt!203781 lt!203783)))

(declare-fun lt!203780 () (_ BitVec 64))

(declare-fun lt!203785 () V!16941)

(declare-fun lt!203782 () (_ BitVec 64))

(declare-fun lt!203784 () ListLongMap!6775)

(assert (=> b!446277 (not (contains!2489 (+!1533 lt!203784 (tuple2!7863 lt!203782 lt!203785)) lt!203780))))

(assert (=> b!446277 (= lt!203783 (addStillNotContains!143 lt!203784 lt!203782 lt!203785 lt!203780))))

(assert (=> b!446277 (= lt!203780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446277 (= lt!203785 (get!6538 (select (arr!13228 (ite c!55890 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446277 (= lt!203782 (select (arr!13229 (ite c!55890 lt!203714 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!446277 (= lt!203784 call!29667)))

(assert (=> b!446277 (= e!262189 (+!1533 call!29667 (tuple2!7863 (select (arr!13229 (ite c!55890 lt!203714 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6538 (select (arr!13228 (ite c!55890 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446278 () Bool)

(assert (=> b!446278 (= e!262188 e!262190)))

(declare-fun c!55922 () Bool)

(assert (=> b!446278 (= c!55922 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 lt!203714 _keys!709))))))

(declare-fun b!446279 () Bool)

(assert (=> b!446279 (= e!262190 (= lt!203786 (getCurrentListMapNoExtraKeys!1589 (ite c!55890 lt!203714 _keys!709) (ite c!55890 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446280 () Bool)

(assert (=> b!446280 (= e!262193 (ListLongMap!6776 Nil!7910))))

(declare-fun b!446281 () Bool)

(assert (=> b!446281 (= e!262188 e!262192)))

(assert (=> b!446281 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13581 (ite c!55890 lt!203714 _keys!709))))))

(declare-fun res!264867 () Bool)

(assert (=> b!446281 (= res!264867 (contains!2489 lt!203786 (select (arr!13229 (ite c!55890 lt!203714 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!446281 (=> (not res!264867) (not e!262192))))

(declare-fun bm!29664 () Bool)

(assert (=> bm!29664 (= call!29667 (getCurrentListMapNoExtraKeys!1589 (ite c!55890 lt!203714 _keys!709) (ite c!55890 (array!27562 (store (arr!13228 _values!549) i!563 (ValueCellFull!5595 v!412)) (size!13580 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74157 c!55923) b!446280))

(assert (= (and d!74157 (not c!55923)) b!446270))

(assert (= (and b!446270 c!55920) b!446277))

(assert (= (and b!446270 (not c!55920)) b!446274))

(assert (= (or b!446277 b!446274) bm!29664))

(assert (= (and d!74157 res!264865) b!446273))

(assert (= (and b!446273 res!264868) b!446276))

(assert (= (and b!446276 res!264866) b!446271))

(assert (= (and b!446276 c!55921) b!446281))

(assert (= (and b!446276 (not c!55921)) b!446278))

(assert (= (and b!446281 res!264867) b!446275))

(assert (= (and b!446278 c!55922) b!446279))

(assert (= (and b!446278 (not c!55922)) b!446272))

(declare-fun b_lambda!9441 () Bool)

(assert (=> (not b_lambda!9441) (not b!446275)))

(assert (=> b!446275 t!13676))

(declare-fun b_and!18563 () Bool)

(assert (= b_and!18561 (and (=> t!13676 result!6965) b_and!18563)))

(declare-fun b_lambda!9443 () Bool)

(assert (=> (not b_lambda!9443) (not b!446277)))

(assert (=> b!446277 t!13676))

(declare-fun b_and!18565 () Bool)

(assert (= b_and!18563 (and (=> t!13676 result!6965) b_and!18565)))

(assert (=> b!446277 m!431455))

(declare-fun m!431573 () Bool)

(assert (=> b!446277 m!431573))

(declare-fun m!431575 () Bool)

(assert (=> b!446277 m!431575))

(declare-fun m!431577 () Bool)

(assert (=> b!446277 m!431577))

(declare-fun m!431579 () Bool)

(assert (=> b!446277 m!431579))

(assert (=> b!446277 m!431455))

(declare-fun m!431581 () Bool)

(assert (=> b!446277 m!431581))

(declare-fun m!431583 () Bool)

(assert (=> b!446277 m!431583))

(assert (=> b!446277 m!431575))

(declare-fun m!431585 () Bool)

(assert (=> b!446277 m!431585))

(assert (=> b!446277 m!431579))

(assert (=> b!446281 m!431585))

(assert (=> b!446281 m!431585))

(declare-fun m!431587 () Bool)

(assert (=> b!446281 m!431587))

(assert (=> b!446275 m!431455))

(assert (=> b!446275 m!431585))

(declare-fun m!431589 () Bool)

(assert (=> b!446275 m!431589))

(assert (=> b!446275 m!431579))

(assert (=> b!446275 m!431455))

(assert (=> b!446275 m!431581))

(assert (=> b!446275 m!431585))

(assert (=> b!446275 m!431579))

(assert (=> b!446270 m!431585))

(assert (=> b!446270 m!431585))

(declare-fun m!431591 () Bool)

(assert (=> b!446270 m!431591))

(declare-fun m!431593 () Bool)

(assert (=> b!446279 m!431593))

(declare-fun m!431595 () Bool)

(assert (=> d!74157 m!431595))

(assert (=> d!74157 m!431411))

(assert (=> b!446271 m!431585))

(assert (=> b!446271 m!431585))

(assert (=> b!446271 m!431591))

(assert (=> bm!29664 m!431593))

(declare-fun m!431597 () Bool)

(assert (=> b!446272 m!431597))

(declare-fun m!431599 () Bool)

(assert (=> b!446273 m!431599))

(assert (=> bm!29643 d!74157))

(declare-fun b!446282 () Bool)

(declare-fun e!262195 () Bool)

(declare-fun e!262194 () Bool)

(assert (=> b!446282 (= e!262195 e!262194)))

(declare-fun lt!203787 () (_ BitVec 64))

(assert (=> b!446282 (= lt!203787 (select (arr!13229 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!203788 () Unit!13176)

(assert (=> b!446282 (= lt!203788 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203787 #b00000000000000000000000000000000))))

(assert (=> b!446282 (arrayContainsKey!0 _keys!709 lt!203787 #b00000000000000000000000000000000)))

(declare-fun lt!203789 () Unit!13176)

(assert (=> b!446282 (= lt!203789 lt!203788)))

(declare-fun res!264869 () Bool)

(assert (=> b!446282 (= res!264869 (= (seekEntryOrOpen!0 (select (arr!13229 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3529 #b00000000000000000000000000000000)))))

(assert (=> b!446282 (=> (not res!264869) (not e!262194))))

(declare-fun b!446283 () Bool)

(declare-fun e!262196 () Bool)

(assert (=> b!446283 (= e!262196 e!262195)))

(declare-fun c!55924 () Bool)

(assert (=> b!446283 (= c!55924 (validKeyInArray!0 (select (arr!13229 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446284 () Bool)

(declare-fun call!29668 () Bool)

(assert (=> b!446284 (= e!262195 call!29668)))

(declare-fun d!74159 () Bool)

(declare-fun res!264870 () Bool)

(assert (=> d!74159 (=> res!264870 e!262196)))

(assert (=> d!74159 (= res!264870 (bvsge #b00000000000000000000000000000000 (size!13581 _keys!709)))))

(assert (=> d!74159 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!262196)))

(declare-fun b!446285 () Bool)

(assert (=> b!446285 (= e!262194 call!29668)))

(declare-fun bm!29665 () Bool)

(assert (=> bm!29665 (= call!29668 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!74159 (not res!264870)) b!446283))

(assert (= (and b!446283 c!55924) b!446282))

(assert (= (and b!446283 (not c!55924)) b!446284))

(assert (= (and b!446282 res!264869) b!446285))

(assert (= (or b!446285 b!446284) bm!29665))

(declare-fun m!431601 () Bool)

(assert (=> b!446282 m!431601))

(declare-fun m!431603 () Bool)

(assert (=> b!446282 m!431603))

(declare-fun m!431605 () Bool)

(assert (=> b!446282 m!431605))

(assert (=> b!446282 m!431601))

(declare-fun m!431607 () Bool)

(assert (=> b!446282 m!431607))

(assert (=> b!446283 m!431601))

(assert (=> b!446283 m!431601))

(declare-fun m!431609 () Bool)

(assert (=> b!446283 m!431609))

(declare-fun m!431611 () Bool)

(assert (=> bm!29665 m!431611))

(assert (=> b!446120 d!74159))

(declare-fun b!446296 () Bool)

(declare-fun e!262207 () Bool)

(declare-fun call!29671 () Bool)

(assert (=> b!446296 (= e!262207 call!29671)))

(declare-fun b!446297 () Bool)

(declare-fun e!262206 () Bool)

(declare-fun contains!2491 (List!7914 (_ BitVec 64)) Bool)

(assert (=> b!446297 (= e!262206 (contains!2491 Nil!7911 (select (arr!13229 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446298 () Bool)

(declare-fun e!262208 () Bool)

(assert (=> b!446298 (= e!262208 e!262207)))

(declare-fun c!55927 () Bool)

(assert (=> b!446298 (= c!55927 (validKeyInArray!0 (select (arr!13229 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!29668 () Bool)

(assert (=> bm!29668 (= call!29671 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55927 (Cons!7910 (select (arr!13229 _keys!709) #b00000000000000000000000000000000) Nil!7911) Nil!7911)))))

(declare-fun b!446299 () Bool)

(assert (=> b!446299 (= e!262207 call!29671)))

(declare-fun d!74161 () Bool)

(declare-fun res!264879 () Bool)

(declare-fun e!262205 () Bool)

(assert (=> d!74161 (=> res!264879 e!262205)))

(assert (=> d!74161 (= res!264879 (bvsge #b00000000000000000000000000000000 (size!13581 _keys!709)))))

(assert (=> d!74161 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7911) e!262205)))

(declare-fun b!446300 () Bool)

(assert (=> b!446300 (= e!262205 e!262208)))

(declare-fun res!264878 () Bool)

(assert (=> b!446300 (=> (not res!264878) (not e!262208))))

(assert (=> b!446300 (= res!264878 (not e!262206))))

(declare-fun res!264877 () Bool)

(assert (=> b!446300 (=> (not res!264877) (not e!262206))))

(assert (=> b!446300 (= res!264877 (validKeyInArray!0 (select (arr!13229 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74161 (not res!264879)) b!446300))

(assert (= (and b!446300 res!264877) b!446297))

(assert (= (and b!446300 res!264878) b!446298))

(assert (= (and b!446298 c!55927) b!446296))

(assert (= (and b!446298 (not c!55927)) b!446299))

(assert (= (or b!446296 b!446299) bm!29668))

(assert (=> b!446297 m!431601))

(assert (=> b!446297 m!431601))

(declare-fun m!431613 () Bool)

(assert (=> b!446297 m!431613))

(assert (=> b!446298 m!431601))

(assert (=> b!446298 m!431601))

(assert (=> b!446298 m!431609))

(assert (=> bm!29668 m!431601))

(declare-fun m!431615 () Bool)

(assert (=> bm!29668 m!431615))

(assert (=> b!446300 m!431601))

(assert (=> b!446300 m!431601))

(assert (=> b!446300 m!431609))

(assert (=> b!446127 d!74161))

(declare-fun d!74163 () Bool)

(declare-fun res!264884 () Bool)

(declare-fun e!262213 () Bool)

(assert (=> d!74163 (=> res!264884 e!262213)))

(assert (=> d!74163 (= res!264884 (= (select (arr!13229 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74163 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!262213)))

(declare-fun b!446305 () Bool)

(declare-fun e!262214 () Bool)

(assert (=> b!446305 (= e!262213 e!262214)))

(declare-fun res!264885 () Bool)

(assert (=> b!446305 (=> (not res!264885) (not e!262214))))

(assert (=> b!446305 (= res!264885 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13581 _keys!709)))))

(declare-fun b!446306 () Bool)

(assert (=> b!446306 (= e!262214 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74163 (not res!264884)) b!446305))

(assert (= (and b!446305 res!264885) b!446306))

(assert (=> d!74163 m!431601))

(declare-fun m!431617 () Bool)

(assert (=> b!446306 m!431617))

(assert (=> b!446128 d!74163))

(declare-fun d!74165 () Bool)

(assert (=> d!74165 (= (array_inv!9592 _values!549) (bvsge (size!13580 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40492 d!74165))

(declare-fun d!74167 () Bool)

(assert (=> d!74167 (= (array_inv!9593 _keys!709) (bvsge (size!13581 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40492 d!74167))

(declare-fun d!74169 () Bool)

(assert (=> d!74169 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!446122 d!74169))

(declare-fun b!446307 () Bool)

(declare-fun e!262217 () Bool)

(declare-fun call!29672 () Bool)

(assert (=> b!446307 (= e!262217 call!29672)))

(declare-fun b!446308 () Bool)

(declare-fun e!262216 () Bool)

(assert (=> b!446308 (= e!262216 (contains!2491 Nil!7911 (select (arr!13229 lt!203714) #b00000000000000000000000000000000)))))

(declare-fun b!446309 () Bool)

(declare-fun e!262218 () Bool)

(assert (=> b!446309 (= e!262218 e!262217)))

(declare-fun c!55928 () Bool)

(assert (=> b!446309 (= c!55928 (validKeyInArray!0 (select (arr!13229 lt!203714) #b00000000000000000000000000000000)))))

(declare-fun bm!29669 () Bool)

(assert (=> bm!29669 (= call!29672 (arrayNoDuplicates!0 lt!203714 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55928 (Cons!7910 (select (arr!13229 lt!203714) #b00000000000000000000000000000000) Nil!7911) Nil!7911)))))

(declare-fun b!446310 () Bool)

(assert (=> b!446310 (= e!262217 call!29672)))

(declare-fun d!74171 () Bool)

(declare-fun res!264888 () Bool)

(declare-fun e!262215 () Bool)

(assert (=> d!74171 (=> res!264888 e!262215)))

(assert (=> d!74171 (= res!264888 (bvsge #b00000000000000000000000000000000 (size!13581 lt!203714)))))

(assert (=> d!74171 (= (arrayNoDuplicates!0 lt!203714 #b00000000000000000000000000000000 Nil!7911) e!262215)))

(declare-fun b!446311 () Bool)

(assert (=> b!446311 (= e!262215 e!262218)))

(declare-fun res!264887 () Bool)

(assert (=> b!446311 (=> (not res!264887) (not e!262218))))

(assert (=> b!446311 (= res!264887 (not e!262216))))

(declare-fun res!264886 () Bool)

(assert (=> b!446311 (=> (not res!264886) (not e!262216))))

(assert (=> b!446311 (= res!264886 (validKeyInArray!0 (select (arr!13229 lt!203714) #b00000000000000000000000000000000)))))

(assert (= (and d!74171 (not res!264888)) b!446311))

(assert (= (and b!446311 res!264886) b!446308))

(assert (= (and b!446311 res!264887) b!446309))

(assert (= (and b!446309 c!55928) b!446307))

(assert (= (and b!446309 (not c!55928)) b!446310))

(assert (= (or b!446307 b!446310) bm!29669))

(assert (=> b!446308 m!431533))

(assert (=> b!446308 m!431533))

(declare-fun m!431619 () Bool)

(assert (=> b!446308 m!431619))

(assert (=> b!446309 m!431533))

(assert (=> b!446309 m!431533))

(assert (=> b!446309 m!431541))

(assert (=> bm!29669 m!431533))

(declare-fun m!431621 () Bool)

(assert (=> bm!29669 m!431621))

(assert (=> b!446311 m!431533))

(assert (=> b!446311 m!431533))

(assert (=> b!446311 m!431541))

(assert (=> b!446129 d!74171))

(declare-fun mapIsEmpty!19449 () Bool)

(declare-fun mapRes!19449 () Bool)

(assert (=> mapIsEmpty!19449 mapRes!19449))

(declare-fun b!446318 () Bool)

(declare-fun e!262223 () Bool)

(assert (=> b!446318 (= e!262223 tp_is_empty!11877)))

(declare-fun b!446319 () Bool)

(declare-fun e!262224 () Bool)

(assert (=> b!446319 (= e!262224 tp_is_empty!11877)))

(declare-fun mapNonEmpty!19449 () Bool)

(declare-fun tp!37476 () Bool)

(assert (=> mapNonEmpty!19449 (= mapRes!19449 (and tp!37476 e!262223))))

(declare-fun mapValue!19449 () ValueCell!5595)

(declare-fun mapRest!19449 () (Array (_ BitVec 32) ValueCell!5595))

(declare-fun mapKey!19449 () (_ BitVec 32))

(assert (=> mapNonEmpty!19449 (= mapRest!19443 (store mapRest!19449 mapKey!19449 mapValue!19449))))

(declare-fun condMapEmpty!19449 () Bool)

(declare-fun mapDefault!19449 () ValueCell!5595)

(assert (=> mapNonEmpty!19443 (= condMapEmpty!19449 (= mapRest!19443 ((as const (Array (_ BitVec 32) ValueCell!5595)) mapDefault!19449)))))

(assert (=> mapNonEmpty!19443 (= tp!37467 (and e!262224 mapRes!19449))))

(assert (= (and mapNonEmpty!19443 condMapEmpty!19449) mapIsEmpty!19449))

(assert (= (and mapNonEmpty!19443 (not condMapEmpty!19449)) mapNonEmpty!19449))

(assert (= (and mapNonEmpty!19449 ((_ is ValueCellFull!5595) mapValue!19449)) b!446318))

(assert (= (and mapNonEmpty!19443 ((_ is ValueCellFull!5595) mapDefault!19449)) b!446319))

(declare-fun m!431623 () Bool)

(assert (=> mapNonEmpty!19449 m!431623))

(declare-fun b_lambda!9445 () Bool)

(assert (= b_lambda!9431 (or (and start!40492 b_free!10563) b_lambda!9445)))

(declare-fun b_lambda!9447 () Bool)

(assert (= b_lambda!9435 (or (and start!40492 b_free!10563) b_lambda!9447)))

(declare-fun b_lambda!9449 () Bool)

(assert (= b_lambda!9437 (or (and start!40492 b_free!10563) b_lambda!9449)))

(declare-fun b_lambda!9451 () Bool)

(assert (= b_lambda!9439 (or (and start!40492 b_free!10563) b_lambda!9451)))

(declare-fun b_lambda!9453 () Bool)

(assert (= b_lambda!9433 (or (and start!40492 b_free!10563) b_lambda!9453)))

(declare-fun b_lambda!9455 () Bool)

(assert (= b_lambda!9429 (or (and start!40492 b_free!10563) b_lambda!9455)))

(declare-fun b_lambda!9457 () Bool)

(assert (= b_lambda!9443 (or (and start!40492 b_free!10563) b_lambda!9457)))

(declare-fun b_lambda!9459 () Bool)

(assert (= b_lambda!9441 (or (and start!40492 b_free!10563) b_lambda!9459)))

(check-sat (not b!446275) (not b!446269) (not b!446219) (not b!446297) (not bm!29652) (not b!446221) (not b!446255) (not b_lambda!9451) (not b!446230) (not b!446210) (not b!446300) (not bm!29659) (not b!446254) (not bm!29668) (not b!446238) (not d!74155) (not b_lambda!9453) (not b!446277) tp_is_empty!11877 (not b!446220) (not b_lambda!9445) (not b!446206) (not b!446214) (not b!446208) (not bm!29663) (not b!446308) (not b!446298) (not bm!29662) (not b_next!10563) (not b!446306) (not b!446267) (not b!446261) (not b!446205) (not bm!29665) (not b!446311) (not b!446309) (not d!74149) (not b_lambda!9457) (not b!446212) (not b!446272) (not d!74157) (not b!446207) (not b!446265) (not bm!29653) (not d!74145) (not b!446263) (not b!446283) (not b!446228) (not b!446259) (not b!446260) (not b_lambda!9455) (not b!446282) (not d!74147) (not b!446224) (not bm!29658) (not d!74143) (not b!446281) (not b!446226) (not b!446245) (not bm!29664) (not b!446222) b_and!18565 (not b!446279) (not mapNonEmpty!19449) (not b!446258) (not bm!29669) (not b_lambda!9459) (not b_lambda!9449) (not b!446271) (not b!446273) (not b!446216) (not b!446244) (not b!446270) (not b_lambda!9447))
(check-sat b_and!18565 (not b_next!10563))
