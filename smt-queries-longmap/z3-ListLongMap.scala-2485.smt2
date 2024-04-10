; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38730 () Bool)

(assert start!38730)

(declare-fun b_free!9267 () Bool)

(declare-fun b_next!9267 () Bool)

(assert (=> start!38730 (= b_free!9267 (not b_next!9267))))

(declare-fun tp!32924 () Bool)

(declare-fun b_and!16653 () Bool)

(assert (=> start!38730 (= tp!32924 b_and!16653)))

(declare-fun mapIsEmpty!16845 () Bool)

(declare-fun mapRes!16845 () Bool)

(assert (=> mapIsEmpty!16845 mapRes!16845))

(declare-fun e!242807 () Bool)

(declare-fun b!403267 () Bool)

(declare-datatypes ((V!14637 0))(
  ( (V!14638 (val!5119 Int)) )
))
(declare-datatypes ((tuple2!6800 0))(
  ( (tuple2!6801 (_1!3411 (_ BitVec 64)) (_2!3411 V!14637)) )
))
(declare-datatypes ((List!6721 0))(
  ( (Nil!6718) (Cons!6717 (h!7573 tuple2!6800) (t!11895 List!6721)) )
))
(declare-datatypes ((ListLongMap!5713 0))(
  ( (ListLongMap!5714 (toList!2872 List!6721)) )
))
(declare-fun call!28465 () ListLongMap!5713)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!28466 () ListLongMap!5713)

(declare-fun v!412 () V!14637)

(declare-fun +!1148 (ListLongMap!5713 tuple2!6800) ListLongMap!5713)

(assert (=> b!403267 (= e!242807 (= call!28466 (+!1148 call!28465 (tuple2!6801 k0!794 v!412))))))

(declare-fun b!403268 () Bool)

(declare-fun res!232385 () Bool)

(declare-fun e!242806 () Bool)

(assert (=> b!403268 (=> (not res!232385) (not e!242806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403268 (= res!232385 (validKeyInArray!0 k0!794))))

(declare-fun b!403269 () Bool)

(declare-fun res!232378 () Bool)

(assert (=> b!403269 (=> (not res!232378) (not e!242806))))

(declare-datatypes ((array!24199 0))(
  ( (array!24200 (arr!11549 (Array (_ BitVec 32) (_ BitVec 64))) (size!11901 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24199)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4731 0))(
  ( (ValueCellFull!4731 (v!7366 V!14637)) (EmptyCell!4731) )
))
(declare-datatypes ((array!24201 0))(
  ( (array!24202 (arr!11550 (Array (_ BitVec 32) ValueCell!4731)) (size!11902 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24201)

(assert (=> b!403269 (= res!232378 (and (= (size!11902 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11901 _keys!709) (size!11902 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403270 () Bool)

(declare-fun res!232388 () Bool)

(assert (=> b!403270 (=> (not res!232388) (not e!242806))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403270 (= res!232388 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11901 _keys!709))))))

(declare-fun b!403271 () Bool)

(declare-fun e!242808 () Bool)

(declare-fun tp_is_empty!10149 () Bool)

(assert (=> b!403271 (= e!242808 tp_is_empty!10149)))

(declare-fun b!403272 () Bool)

(declare-fun res!232386 () Bool)

(assert (=> b!403272 (=> (not res!232386) (not e!242806))))

(assert (=> b!403272 (= res!232386 (or (= (select (arr!11549 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11549 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403273 () Bool)

(declare-fun e!242809 () Bool)

(assert (=> b!403273 (= e!242806 e!242809)))

(declare-fun res!232387 () Bool)

(assert (=> b!403273 (=> (not res!232387) (not e!242809))))

(declare-fun lt!188026 () array!24199)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24199 (_ BitVec 32)) Bool)

(assert (=> b!403273 (= res!232387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188026 mask!1025))))

(assert (=> b!403273 (= lt!188026 (array!24200 (store (arr!11549 _keys!709) i!563 k0!794) (size!11901 _keys!709)))))

(declare-fun b!403274 () Bool)

(declare-fun res!232389 () Bool)

(assert (=> b!403274 (=> (not res!232389) (not e!242809))))

(declare-datatypes ((List!6722 0))(
  ( (Nil!6719) (Cons!6718 (h!7574 (_ BitVec 64)) (t!11896 List!6722)) )
))
(declare-fun arrayNoDuplicates!0 (array!24199 (_ BitVec 32) List!6722) Bool)

(assert (=> b!403274 (= res!232389 (arrayNoDuplicates!0 lt!188026 #b00000000000000000000000000000000 Nil!6719))))

(declare-fun b!403275 () Bool)

(declare-fun e!242805 () Bool)

(assert (=> b!403275 (= e!242805 tp_is_empty!10149)))

(declare-fun b!403276 () Bool)

(assert (=> b!403276 (= e!242809 (not true))))

(assert (=> b!403276 e!242807))

(declare-fun c!54857 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!403276 (= c!54857 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14637)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14637)

(declare-datatypes ((Unit!12202 0))(
  ( (Unit!12203) )
))
(declare-fun lt!188027 () Unit!12202)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!359 (array!24199 array!24201 (_ BitVec 32) (_ BitVec 32) V!14637 V!14637 (_ BitVec 32) (_ BitVec 64) V!14637 (_ BitVec 32) Int) Unit!12202)

(assert (=> b!403276 (= lt!188027 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!359 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28463 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1082 (array!24199 array!24201 (_ BitVec 32) (_ BitVec 32) V!14637 V!14637 (_ BitVec 32) Int) ListLongMap!5713)

(assert (=> bm!28463 (= call!28466 (getCurrentListMapNoExtraKeys!1082 (ite c!54857 lt!188026 _keys!709) (ite c!54857 (array!24202 (store (arr!11550 _values!549) i!563 (ValueCellFull!4731 v!412)) (size!11902 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403277 () Bool)

(declare-fun res!232380 () Bool)

(assert (=> b!403277 (=> (not res!232380) (not e!242806))))

(assert (=> b!403277 (= res!232380 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6719))))

(declare-fun mapNonEmpty!16845 () Bool)

(declare-fun tp!32925 () Bool)

(assert (=> mapNonEmpty!16845 (= mapRes!16845 (and tp!32925 e!242805))))

(declare-fun mapKey!16845 () (_ BitVec 32))

(declare-fun mapValue!16845 () ValueCell!4731)

(declare-fun mapRest!16845 () (Array (_ BitVec 32) ValueCell!4731))

(assert (=> mapNonEmpty!16845 (= (arr!11550 _values!549) (store mapRest!16845 mapKey!16845 mapValue!16845))))

(declare-fun b!403278 () Bool)

(declare-fun res!232379 () Bool)

(assert (=> b!403278 (=> (not res!232379) (not e!242809))))

(assert (=> b!403278 (= res!232379 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11901 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403279 () Bool)

(declare-fun res!232381 () Bool)

(assert (=> b!403279 (=> (not res!232381) (not e!242806))))

(declare-fun arrayContainsKey!0 (array!24199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403279 (= res!232381 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403280 () Bool)

(declare-fun res!232384 () Bool)

(assert (=> b!403280 (=> (not res!232384) (not e!242806))))

(assert (=> b!403280 (= res!232384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403281 () Bool)

(declare-fun e!242811 () Bool)

(assert (=> b!403281 (= e!242811 (and e!242808 mapRes!16845))))

(declare-fun condMapEmpty!16845 () Bool)

(declare-fun mapDefault!16845 () ValueCell!4731)

(assert (=> b!403281 (= condMapEmpty!16845 (= (arr!11550 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4731)) mapDefault!16845)))))

(declare-fun b!403282 () Bool)

(assert (=> b!403282 (= e!242807 (= call!28465 call!28466))))

(declare-fun b!403283 () Bool)

(declare-fun res!232383 () Bool)

(assert (=> b!403283 (=> (not res!232383) (not e!242806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403283 (= res!232383 (validMask!0 mask!1025))))

(declare-fun res!232382 () Bool)

(assert (=> start!38730 (=> (not res!232382) (not e!242806))))

(assert (=> start!38730 (= res!232382 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11901 _keys!709))))))

(assert (=> start!38730 e!242806))

(assert (=> start!38730 tp_is_empty!10149))

(assert (=> start!38730 tp!32924))

(assert (=> start!38730 true))

(declare-fun array_inv!8450 (array!24201) Bool)

(assert (=> start!38730 (and (array_inv!8450 _values!549) e!242811)))

(declare-fun array_inv!8451 (array!24199) Bool)

(assert (=> start!38730 (array_inv!8451 _keys!709)))

(declare-fun bm!28462 () Bool)

(assert (=> bm!28462 (= call!28465 (getCurrentListMapNoExtraKeys!1082 (ite c!54857 _keys!709 lt!188026) (ite c!54857 _values!549 (array!24202 (store (arr!11550 _values!549) i!563 (ValueCellFull!4731 v!412)) (size!11902 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!38730 res!232382) b!403283))

(assert (= (and b!403283 res!232383) b!403269))

(assert (= (and b!403269 res!232378) b!403280))

(assert (= (and b!403280 res!232384) b!403277))

(assert (= (and b!403277 res!232380) b!403270))

(assert (= (and b!403270 res!232388) b!403268))

(assert (= (and b!403268 res!232385) b!403272))

(assert (= (and b!403272 res!232386) b!403279))

(assert (= (and b!403279 res!232381) b!403273))

(assert (= (and b!403273 res!232387) b!403274))

(assert (= (and b!403274 res!232389) b!403278))

(assert (= (and b!403278 res!232379) b!403276))

(assert (= (and b!403276 c!54857) b!403267))

(assert (= (and b!403276 (not c!54857)) b!403282))

(assert (= (or b!403267 b!403282) bm!28463))

(assert (= (or b!403267 b!403282) bm!28462))

(assert (= (and b!403281 condMapEmpty!16845) mapIsEmpty!16845))

(assert (= (and b!403281 (not condMapEmpty!16845)) mapNonEmpty!16845))

(get-info :version)

(assert (= (and mapNonEmpty!16845 ((_ is ValueCellFull!4731) mapValue!16845)) b!403275))

(assert (= (and b!403281 ((_ is ValueCellFull!4731) mapDefault!16845)) b!403271))

(assert (= start!38730 b!403281))

(declare-fun m!396515 () Bool)

(assert (=> bm!28463 m!396515))

(declare-fun m!396517 () Bool)

(assert (=> bm!28463 m!396517))

(declare-fun m!396519 () Bool)

(assert (=> b!403276 m!396519))

(declare-fun m!396521 () Bool)

(assert (=> b!403283 m!396521))

(declare-fun m!396523 () Bool)

(assert (=> b!403273 m!396523))

(declare-fun m!396525 () Bool)

(assert (=> b!403273 m!396525))

(declare-fun m!396527 () Bool)

(assert (=> b!403277 m!396527))

(declare-fun m!396529 () Bool)

(assert (=> b!403274 m!396529))

(declare-fun m!396531 () Bool)

(assert (=> b!403268 m!396531))

(declare-fun m!396533 () Bool)

(assert (=> b!403272 m!396533))

(declare-fun m!396535 () Bool)

(assert (=> b!403267 m!396535))

(declare-fun m!396537 () Bool)

(assert (=> start!38730 m!396537))

(declare-fun m!396539 () Bool)

(assert (=> start!38730 m!396539))

(declare-fun m!396541 () Bool)

(assert (=> mapNonEmpty!16845 m!396541))

(assert (=> bm!28462 m!396515))

(declare-fun m!396543 () Bool)

(assert (=> bm!28462 m!396543))

(declare-fun m!396545 () Bool)

(assert (=> b!403280 m!396545))

(declare-fun m!396547 () Bool)

(assert (=> b!403279 m!396547))

(check-sat (not b!403273) (not b!403268) (not b!403267) (not b!403276) b_and!16653 (not b!403279) (not bm!28462) (not start!38730) (not b!403280) (not b!403277) (not b!403274) (not b_next!9267) tp_is_empty!10149 (not mapNonEmpty!16845) (not bm!28463) (not b!403283))
(check-sat b_and!16653 (not b_next!9267))
