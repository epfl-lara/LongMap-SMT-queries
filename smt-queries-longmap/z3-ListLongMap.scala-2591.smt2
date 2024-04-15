; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39350 () Bool)

(assert start!39350)

(declare-fun b_free!9631 () Bool)

(declare-fun b_next!9631 () Bool)

(assert (=> start!39350 (= b_free!9631 (not b_next!9631))))

(declare-fun tp!34421 () Bool)

(declare-fun b_and!17111 () Bool)

(assert (=> start!39350 (= tp!34421 b_and!17111)))

(declare-fun b!417631 () Bool)

(declare-datatypes ((V!15483 0))(
  ( (V!15484 (val!5436 Int)) )
))
(declare-datatypes ((tuple2!7088 0))(
  ( (tuple2!7089 (_1!3555 (_ BitVec 64)) (_2!3555 V!15483)) )
))
(declare-datatypes ((List!7087 0))(
  ( (Nil!7084) (Cons!7083 (h!7939 tuple2!7088) (t!12374 List!7087)) )
))
(declare-datatypes ((ListLongMap!5991 0))(
  ( (ListLongMap!5992 (toList!3011 List!7087)) )
))
(declare-fun call!29046 () ListLongMap!5991)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!249100 () Bool)

(declare-fun call!29047 () ListLongMap!5991)

(declare-fun v!412 () V!15483)

(declare-fun +!1240 (ListLongMap!5991 tuple2!7088) ListLongMap!5991)

(assert (=> b!417631 (= e!249100 (= call!29046 (+!1240 call!29047 (tuple2!7089 k0!794 v!412))))))

(declare-fun b!417632 () Bool)

(assert (=> b!417632 (= e!249100 (= call!29047 call!29046))))

(declare-fun b!417633 () Bool)

(declare-fun e!249096 () Bool)

(declare-fun e!249101 () Bool)

(assert (=> b!417633 (= e!249096 (not e!249101))))

(declare-fun res!243315 () Bool)

(assert (=> b!417633 (=> res!243315 e!249101)))

(declare-datatypes ((array!25409 0))(
  ( (array!25410 (arr!12154 (Array (_ BitVec 32) (_ BitVec 64))) (size!12507 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25409)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417633 (= res!243315 (validKeyInArray!0 (select (arr!12154 _keys!709) from!863)))))

(assert (=> b!417633 e!249100))

(declare-fun c!55089 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417633 (= c!55089 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5048 0))(
  ( (ValueCellFull!5048 (v!7677 V!15483)) (EmptyCell!5048) )
))
(declare-datatypes ((array!25411 0))(
  ( (array!25412 (arr!12155 (Array (_ BitVec 32) ValueCell!5048)) (size!12508 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25411)

(declare-fun zeroValue!515 () V!15483)

(declare-datatypes ((Unit!12320 0))(
  ( (Unit!12321) )
))
(declare-fun lt!191261 () Unit!12320)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15483)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!416 (array!25409 array!25411 (_ BitVec 32) (_ BitVec 32) V!15483 V!15483 (_ BitVec 32) (_ BitVec 64) V!15483 (_ BitVec 32) Int) Unit!12320)

(assert (=> b!417633 (= lt!191261 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!416 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417634 () Bool)

(declare-fun res!243309 () Bool)

(declare-fun e!249094 () Bool)

(assert (=> b!417634 (=> (not res!243309) (not e!249094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25409 (_ BitVec 32)) Bool)

(assert (=> b!417634 (= res!243309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417636 () Bool)

(declare-fun e!249102 () Bool)

(declare-fun e!249099 () Bool)

(declare-fun mapRes!17796 () Bool)

(assert (=> b!417636 (= e!249102 (and e!249099 mapRes!17796))))

(declare-fun condMapEmpty!17796 () Bool)

(declare-fun mapDefault!17796 () ValueCell!5048)

(assert (=> b!417636 (= condMapEmpty!17796 (= (arr!12155 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5048)) mapDefault!17796)))))

(declare-fun b!417637 () Bool)

(declare-fun res!243312 () Bool)

(assert (=> b!417637 (=> (not res!243312) (not e!249094))))

(assert (=> b!417637 (= res!243312 (and (= (size!12508 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12507 _keys!709) (size!12508 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417638 () Bool)

(declare-fun e!249095 () Bool)

(assert (=> b!417638 (= e!249095 e!249096)))

(declare-fun res!243310 () Bool)

(assert (=> b!417638 (=> (not res!243310) (not e!249096))))

(assert (=> b!417638 (= res!243310 (= from!863 i!563))))

(declare-fun lt!191251 () array!25409)

(declare-fun lt!191259 () ListLongMap!5991)

(declare-fun lt!191255 () array!25411)

(declare-fun getCurrentListMapNoExtraKeys!1222 (array!25409 array!25411 (_ BitVec 32) (_ BitVec 32) V!15483 V!15483 (_ BitVec 32) Int) ListLongMap!5991)

(assert (=> b!417638 (= lt!191259 (getCurrentListMapNoExtraKeys!1222 lt!191251 lt!191255 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417638 (= lt!191255 (array!25412 (store (arr!12155 _values!549) i!563 (ValueCellFull!5048 v!412)) (size!12508 _values!549)))))

(declare-fun lt!191258 () ListLongMap!5991)

(assert (=> b!417638 (= lt!191258 (getCurrentListMapNoExtraKeys!1222 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417639 () Bool)

(declare-fun res!243317 () Bool)

(assert (=> b!417639 (=> (not res!243317) (not e!249094))))

(assert (=> b!417639 (= res!243317 (validKeyInArray!0 k0!794))))

(declare-fun b!417640 () Bool)

(declare-fun tp_is_empty!10783 () Bool)

(assert (=> b!417640 (= e!249099 tp_is_empty!10783)))

(declare-fun b!417641 () Bool)

(declare-fun res!243316 () Bool)

(assert (=> b!417641 (=> (not res!243316) (not e!249094))))

(assert (=> b!417641 (= res!243316 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12507 _keys!709))))))

(declare-fun b!417642 () Bool)

(declare-fun res!243305 () Bool)

(assert (=> b!417642 (=> (not res!243305) (not e!249094))))

(declare-fun arrayContainsKey!0 (array!25409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417642 (= res!243305 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417643 () Bool)

(declare-fun res!243314 () Bool)

(assert (=> b!417643 (=> (not res!243314) (not e!249095))))

(declare-datatypes ((List!7088 0))(
  ( (Nil!7085) (Cons!7084 (h!7940 (_ BitVec 64)) (t!12375 List!7088)) )
))
(declare-fun arrayNoDuplicates!0 (array!25409 (_ BitVec 32) List!7088) Bool)

(assert (=> b!417643 (= res!243314 (arrayNoDuplicates!0 lt!191251 #b00000000000000000000000000000000 Nil!7085))))

(declare-fun b!417635 () Bool)

(declare-fun res!243308 () Bool)

(assert (=> b!417635 (=> (not res!243308) (not e!249095))))

(assert (=> b!417635 (= res!243308 (bvsle from!863 i!563))))

(declare-fun res!243311 () Bool)

(assert (=> start!39350 (=> (not res!243311) (not e!249094))))

(assert (=> start!39350 (= res!243311 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12507 _keys!709))))))

(assert (=> start!39350 e!249094))

(assert (=> start!39350 tp_is_empty!10783))

(assert (=> start!39350 tp!34421))

(assert (=> start!39350 true))

(declare-fun array_inv!8906 (array!25411) Bool)

(assert (=> start!39350 (and (array_inv!8906 _values!549) e!249102)))

(declare-fun array_inv!8907 (array!25409) Bool)

(assert (=> start!39350 (array_inv!8907 _keys!709)))

(declare-fun b!417644 () Bool)

(assert (=> b!417644 (= e!249094 e!249095)))

(declare-fun res!243318 () Bool)

(assert (=> b!417644 (=> (not res!243318) (not e!249095))))

(assert (=> b!417644 (= res!243318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191251 mask!1025))))

(assert (=> b!417644 (= lt!191251 (array!25410 (store (arr!12154 _keys!709) i!563 k0!794) (size!12507 _keys!709)))))

(declare-fun mapNonEmpty!17796 () Bool)

(declare-fun tp!34422 () Bool)

(declare-fun e!249097 () Bool)

(assert (=> mapNonEmpty!17796 (= mapRes!17796 (and tp!34422 e!249097))))

(declare-fun mapValue!17796 () ValueCell!5048)

(declare-fun mapKey!17796 () (_ BitVec 32))

(declare-fun mapRest!17796 () (Array (_ BitVec 32) ValueCell!5048))

(assert (=> mapNonEmpty!17796 (= (arr!12155 _values!549) (store mapRest!17796 mapKey!17796 mapValue!17796))))

(declare-fun mapIsEmpty!17796 () Bool)

(assert (=> mapIsEmpty!17796 mapRes!17796))

(declare-fun bm!29043 () Bool)

(assert (=> bm!29043 (= call!29047 (getCurrentListMapNoExtraKeys!1222 (ite c!55089 _keys!709 lt!191251) (ite c!55089 _values!549 lt!191255) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417645 () Bool)

(declare-fun res!243307 () Bool)

(assert (=> b!417645 (=> (not res!243307) (not e!249094))))

(assert (=> b!417645 (= res!243307 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7085))))

(declare-fun b!417646 () Bool)

(assert (=> b!417646 (= e!249097 tp_is_empty!10783)))

(declare-fun b!417647 () Bool)

(declare-fun res!243313 () Bool)

(assert (=> b!417647 (=> (not res!243313) (not e!249094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417647 (= res!243313 (validMask!0 mask!1025))))

(declare-fun b!417648 () Bool)

(assert (=> b!417648 (= e!249101 true)))

(declare-fun lt!191252 () V!15483)

(declare-fun lt!191254 () tuple2!7088)

(declare-fun lt!191256 () ListLongMap!5991)

(assert (=> b!417648 (= (+!1240 lt!191256 lt!191254) (+!1240 (+!1240 lt!191256 (tuple2!7089 k0!794 lt!191252)) lt!191254))))

(declare-fun lt!191253 () V!15483)

(assert (=> b!417648 (= lt!191254 (tuple2!7089 k0!794 lt!191253))))

(declare-fun lt!191260 () Unit!12320)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!27 (ListLongMap!5991 (_ BitVec 64) V!15483 V!15483) Unit!12320)

(assert (=> b!417648 (= lt!191260 (addSameAsAddTwiceSameKeyDiffValues!27 lt!191256 k0!794 lt!191252 lt!191253))))

(declare-fun lt!191257 () V!15483)

(declare-fun get!6012 (ValueCell!5048 V!15483) V!15483)

(assert (=> b!417648 (= lt!191252 (get!6012 (select (arr!12155 _values!549) from!863) lt!191257))))

(assert (=> b!417648 (= lt!191259 (+!1240 lt!191256 (tuple2!7089 (select (arr!12154 lt!191251) from!863) lt!191253)))))

(assert (=> b!417648 (= lt!191253 (get!6012 (select (store (arr!12155 _values!549) i!563 (ValueCellFull!5048 v!412)) from!863) lt!191257))))

(declare-fun dynLambda!684 (Int (_ BitVec 64)) V!15483)

(assert (=> b!417648 (= lt!191257 (dynLambda!684 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417648 (= lt!191256 (getCurrentListMapNoExtraKeys!1222 lt!191251 lt!191255 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29044 () Bool)

(assert (=> bm!29044 (= call!29046 (getCurrentListMapNoExtraKeys!1222 (ite c!55089 lt!191251 _keys!709) (ite c!55089 lt!191255 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417649 () Bool)

(declare-fun res!243306 () Bool)

(assert (=> b!417649 (=> (not res!243306) (not e!249094))))

(assert (=> b!417649 (= res!243306 (or (= (select (arr!12154 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12154 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39350 res!243311) b!417647))

(assert (= (and b!417647 res!243313) b!417637))

(assert (= (and b!417637 res!243312) b!417634))

(assert (= (and b!417634 res!243309) b!417645))

(assert (= (and b!417645 res!243307) b!417641))

(assert (= (and b!417641 res!243316) b!417639))

(assert (= (and b!417639 res!243317) b!417649))

(assert (= (and b!417649 res!243306) b!417642))

(assert (= (and b!417642 res!243305) b!417644))

(assert (= (and b!417644 res!243318) b!417643))

(assert (= (and b!417643 res!243314) b!417635))

(assert (= (and b!417635 res!243308) b!417638))

(assert (= (and b!417638 res!243310) b!417633))

(assert (= (and b!417633 c!55089) b!417631))

(assert (= (and b!417633 (not c!55089)) b!417632))

(assert (= (or b!417631 b!417632) bm!29044))

(assert (= (or b!417631 b!417632) bm!29043))

(assert (= (and b!417633 (not res!243315)) b!417648))

(assert (= (and b!417636 condMapEmpty!17796) mapIsEmpty!17796))

(assert (= (and b!417636 (not condMapEmpty!17796)) mapNonEmpty!17796))

(get-info :version)

(assert (= (and mapNonEmpty!17796 ((_ is ValueCellFull!5048) mapValue!17796)) b!417646))

(assert (= (and b!417636 ((_ is ValueCellFull!5048) mapDefault!17796)) b!417640))

(assert (= start!39350 b!417636))

(declare-fun b_lambda!8917 () Bool)

(assert (=> (not b_lambda!8917) (not b!417648)))

(declare-fun t!12373 () Bool)

(declare-fun tb!3245 () Bool)

(assert (=> (and start!39350 (= defaultEntry!557 defaultEntry!557) t!12373) tb!3245))

(declare-fun result!6025 () Bool)

(assert (=> tb!3245 (= result!6025 tp_is_empty!10783)))

(assert (=> b!417648 t!12373))

(declare-fun b_and!17113 () Bool)

(assert (= b_and!17111 (and (=> t!12373 result!6025) b_and!17113)))

(declare-fun m!406497 () Bool)

(assert (=> b!417639 m!406497))

(declare-fun m!406499 () Bool)

(assert (=> bm!29043 m!406499))

(declare-fun m!406501 () Bool)

(assert (=> b!417634 m!406501))

(declare-fun m!406503 () Bool)

(assert (=> b!417647 m!406503))

(declare-fun m!406505 () Bool)

(assert (=> b!417645 m!406505))

(declare-fun m!406507 () Bool)

(assert (=> b!417648 m!406507))

(declare-fun m!406509 () Bool)

(assert (=> b!417648 m!406509))

(declare-fun m!406511 () Bool)

(assert (=> b!417648 m!406511))

(declare-fun m!406513 () Bool)

(assert (=> b!417648 m!406513))

(assert (=> b!417648 m!406507))

(declare-fun m!406515 () Bool)

(assert (=> b!417648 m!406515))

(declare-fun m!406517 () Bool)

(assert (=> b!417648 m!406517))

(declare-fun m!406519 () Bool)

(assert (=> b!417648 m!406519))

(declare-fun m!406521 () Bool)

(assert (=> b!417648 m!406521))

(assert (=> b!417648 m!406519))

(declare-fun m!406523 () Bool)

(assert (=> b!417648 m!406523))

(declare-fun m!406525 () Bool)

(assert (=> b!417648 m!406525))

(assert (=> b!417648 m!406517))

(declare-fun m!406527 () Bool)

(assert (=> b!417648 m!406527))

(declare-fun m!406529 () Bool)

(assert (=> b!417648 m!406529))

(declare-fun m!406531 () Bool)

(assert (=> b!417648 m!406531))

(declare-fun m!406533 () Bool)

(assert (=> b!417638 m!406533))

(assert (=> b!417638 m!406511))

(declare-fun m!406535 () Bool)

(assert (=> b!417638 m!406535))

(declare-fun m!406537 () Bool)

(assert (=> start!39350 m!406537))

(declare-fun m!406539 () Bool)

(assert (=> start!39350 m!406539))

(declare-fun m!406541 () Bool)

(assert (=> b!417633 m!406541))

(assert (=> b!417633 m!406541))

(declare-fun m!406543 () Bool)

(assert (=> b!417633 m!406543))

(declare-fun m!406545 () Bool)

(assert (=> b!417633 m!406545))

(declare-fun m!406547 () Bool)

(assert (=> b!417649 m!406547))

(declare-fun m!406549 () Bool)

(assert (=> b!417642 m!406549))

(declare-fun m!406551 () Bool)

(assert (=> b!417631 m!406551))

(declare-fun m!406553 () Bool)

(assert (=> mapNonEmpty!17796 m!406553))

(declare-fun m!406555 () Bool)

(assert (=> b!417643 m!406555))

(declare-fun m!406557 () Bool)

(assert (=> bm!29044 m!406557))

(declare-fun m!406559 () Bool)

(assert (=> b!417644 m!406559))

(declare-fun m!406561 () Bool)

(assert (=> b!417644 m!406561))

(check-sat (not b!417638) (not bm!29044) (not b_next!9631) (not b!417644) (not b!417639) (not start!39350) (not b!417642) (not b!417634) (not b!417647) (not b!417631) b_and!17113 (not mapNonEmpty!17796) (not b!417643) (not b!417648) (not bm!29043) (not b!417633) tp_is_empty!10783 (not b!417645) (not b_lambda!8917))
(check-sat b_and!17113 (not b_next!9631))
