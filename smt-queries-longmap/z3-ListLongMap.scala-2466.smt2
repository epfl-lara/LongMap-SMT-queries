; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38600 () Bool)

(assert start!38600)

(declare-fun b_free!9151 () Bool)

(declare-fun b_next!9151 () Bool)

(assert (=> start!38600 (= b_free!9151 (not b_next!9151))))

(declare-fun tp!32576 () Bool)

(declare-fun b_and!16551 () Bool)

(assert (=> start!38600 (= tp!32576 b_and!16551)))

(declare-fun b!400260 () Bool)

(declare-fun res!230288 () Bool)

(declare-fun e!241555 () Bool)

(assert (=> b!400260 (=> (not res!230288) (not e!241555))))

(declare-datatypes ((array!23952 0))(
  ( (array!23953 (arr!11425 (Array (_ BitVec 32) (_ BitVec 64))) (size!11777 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23952)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23952 (_ BitVec 32)) Bool)

(assert (=> b!400260 (= res!230288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400261 () Bool)

(declare-fun res!230298 () Bool)

(declare-fun e!241559 () Bool)

(assert (=> b!400261 (=> (not res!230298) (not e!241559))))

(declare-fun lt!187697 () array!23952)

(declare-datatypes ((List!6492 0))(
  ( (Nil!6489) (Cons!6488 (h!7344 (_ BitVec 64)) (t!11658 List!6492)) )
))
(declare-fun arrayNoDuplicates!0 (array!23952 (_ BitVec 32) List!6492) Bool)

(assert (=> b!400261 (= res!230298 (arrayNoDuplicates!0 lt!187697 #b00000000000000000000000000000000 Nil!6489))))

(declare-datatypes ((V!14483 0))(
  ( (V!14484 (val!5061 Int)) )
))
(declare-fun minValue!515 () V!14483)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4673 0))(
  ( (ValueCellFull!4673 (v!7309 V!14483)) (EmptyCell!4673) )
))
(declare-datatypes ((array!23954 0))(
  ( (array!23955 (arr!11426 (Array (_ BitVec 32) ValueCell!4673)) (size!11778 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23954)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54660 () Bool)

(declare-datatypes ((tuple2!6572 0))(
  ( (tuple2!6573 (_1!3297 (_ BitVec 64)) (_2!3297 V!14483)) )
))
(declare-datatypes ((List!6493 0))(
  ( (Nil!6490) (Cons!6489 (h!7345 tuple2!6572) (t!11659 List!6493)) )
))
(declare-datatypes ((ListLongMap!5487 0))(
  ( (ListLongMap!5488 (toList!2759 List!6493)) )
))
(declare-fun call!28104 () ListLongMap!5487)

(declare-fun v!412 () V!14483)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!28101 () Bool)

(declare-fun zeroValue!515 () V!14483)

(declare-fun getCurrentListMapNoExtraKeys!1017 (array!23952 array!23954 (_ BitVec 32) (_ BitVec 32) V!14483 V!14483 (_ BitVec 32) Int) ListLongMap!5487)

(assert (=> bm!28101 (= call!28104 (getCurrentListMapNoExtraKeys!1017 (ite c!54660 lt!187697 _keys!709) (ite c!54660 (array!23955 (store (arr!11426 _values!549) i!563 (ValueCellFull!4673 v!412)) (size!11778 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!230289 () Bool)

(assert (=> start!38600 (=> (not res!230289) (not e!241555))))

(assert (=> start!38600 (= res!230289 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11777 _keys!709))))))

(assert (=> start!38600 e!241555))

(declare-fun tp_is_empty!10033 () Bool)

(assert (=> start!38600 tp_is_empty!10033))

(assert (=> start!38600 tp!32576))

(assert (=> start!38600 true))

(declare-fun e!241557 () Bool)

(declare-fun array_inv!8440 (array!23954) Bool)

(assert (=> start!38600 (and (array_inv!8440 _values!549) e!241557)))

(declare-fun array_inv!8441 (array!23952) Bool)

(assert (=> start!38600 (array_inv!8441 _keys!709)))

(declare-fun b!400262 () Bool)

(assert (=> b!400262 (= e!241555 e!241559)))

(declare-fun res!230295 () Bool)

(assert (=> b!400262 (=> (not res!230295) (not e!241559))))

(assert (=> b!400262 (= res!230295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187697 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!400262 (= lt!187697 (array!23953 (store (arr!11425 _keys!709) i!563 k0!794) (size!11777 _keys!709)))))

(declare-fun b!400263 () Bool)

(declare-fun res!230297 () Bool)

(assert (=> b!400263 (=> (not res!230297) (not e!241555))))

(assert (=> b!400263 (= res!230297 (and (= (size!11778 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11777 _keys!709) (size!11778 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400264 () Bool)

(declare-fun e!241560 () Bool)

(assert (=> b!400264 (= e!241560 tp_is_empty!10033)))

(declare-fun b!400265 () Bool)

(declare-fun mapRes!16671 () Bool)

(assert (=> b!400265 (= e!241557 (and e!241560 mapRes!16671))))

(declare-fun condMapEmpty!16671 () Bool)

(declare-fun mapDefault!16671 () ValueCell!4673)

(assert (=> b!400265 (= condMapEmpty!16671 (= (arr!11426 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4673)) mapDefault!16671)))))

(declare-fun b!400266 () Bool)

(declare-fun res!230291 () Bool)

(assert (=> b!400266 (=> (not res!230291) (not e!241559))))

(assert (=> b!400266 (= res!230291 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11777 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16671 () Bool)

(declare-fun tp!32577 () Bool)

(declare-fun e!241558 () Bool)

(assert (=> mapNonEmpty!16671 (= mapRes!16671 (and tp!32577 e!241558))))

(declare-fun mapValue!16671 () ValueCell!4673)

(declare-fun mapRest!16671 () (Array (_ BitVec 32) ValueCell!4673))

(declare-fun mapKey!16671 () (_ BitVec 32))

(assert (=> mapNonEmpty!16671 (= (arr!11426 _values!549) (store mapRest!16671 mapKey!16671 mapValue!16671))))

(declare-fun b!400267 () Bool)

(declare-fun res!230292 () Bool)

(assert (=> b!400267 (=> (not res!230292) (not e!241555))))

(declare-fun arrayContainsKey!0 (array!23952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400267 (= res!230292 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400268 () Bool)

(assert (=> b!400268 (= e!241559 (not true))))

(declare-fun e!241561 () Bool)

(assert (=> b!400268 e!241561))

(assert (=> b!400268 (= c!54660 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12099 0))(
  ( (Unit!12100) )
))
(declare-fun lt!187698 () Unit!12099)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!317 (array!23952 array!23954 (_ BitVec 32) (_ BitVec 32) V!14483 V!14483 (_ BitVec 32) (_ BitVec 64) V!14483 (_ BitVec 32) Int) Unit!12099)

(assert (=> b!400268 (= lt!187698 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!317 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400269 () Bool)

(declare-fun res!230296 () Bool)

(assert (=> b!400269 (=> (not res!230296) (not e!241555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400269 (= res!230296 (validKeyInArray!0 k0!794))))

(declare-fun b!400270 () Bool)

(declare-fun call!28105 () ListLongMap!5487)

(assert (=> b!400270 (= e!241561 (= call!28105 call!28104))))

(declare-fun b!400271 () Bool)

(declare-fun res!230290 () Bool)

(assert (=> b!400271 (=> (not res!230290) (not e!241555))))

(assert (=> b!400271 (= res!230290 (or (= (select (arr!11425 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11425 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400272 () Bool)

(declare-fun res!230294 () Bool)

(assert (=> b!400272 (=> (not res!230294) (not e!241555))))

(assert (=> b!400272 (= res!230294 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6489))))

(declare-fun mapIsEmpty!16671 () Bool)

(assert (=> mapIsEmpty!16671 mapRes!16671))

(declare-fun b!400273 () Bool)

(declare-fun res!230287 () Bool)

(assert (=> b!400273 (=> (not res!230287) (not e!241555))))

(assert (=> b!400273 (= res!230287 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11777 _keys!709))))))

(declare-fun bm!28102 () Bool)

(assert (=> bm!28102 (= call!28105 (getCurrentListMapNoExtraKeys!1017 (ite c!54660 _keys!709 lt!187697) (ite c!54660 _values!549 (array!23955 (store (arr!11426 _values!549) i!563 (ValueCellFull!4673 v!412)) (size!11778 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400274 () Bool)

(assert (=> b!400274 (= e!241558 tp_is_empty!10033)))

(declare-fun b!400275 () Bool)

(declare-fun +!1106 (ListLongMap!5487 tuple2!6572) ListLongMap!5487)

(assert (=> b!400275 (= e!241561 (= call!28104 (+!1106 call!28105 (tuple2!6573 k0!794 v!412))))))

(declare-fun b!400276 () Bool)

(declare-fun res!230293 () Bool)

(assert (=> b!400276 (=> (not res!230293) (not e!241555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400276 (= res!230293 (validMask!0 mask!1025))))

(assert (= (and start!38600 res!230289) b!400276))

(assert (= (and b!400276 res!230293) b!400263))

(assert (= (and b!400263 res!230297) b!400260))

(assert (= (and b!400260 res!230288) b!400272))

(assert (= (and b!400272 res!230294) b!400273))

(assert (= (and b!400273 res!230287) b!400269))

(assert (= (and b!400269 res!230296) b!400271))

(assert (= (and b!400271 res!230290) b!400267))

(assert (= (and b!400267 res!230292) b!400262))

(assert (= (and b!400262 res!230295) b!400261))

(assert (= (and b!400261 res!230298) b!400266))

(assert (= (and b!400266 res!230291) b!400268))

(assert (= (and b!400268 c!54660) b!400275))

(assert (= (and b!400268 (not c!54660)) b!400270))

(assert (= (or b!400275 b!400270) bm!28101))

(assert (= (or b!400275 b!400270) bm!28102))

(assert (= (and b!400265 condMapEmpty!16671) mapIsEmpty!16671))

(assert (= (and b!400265 (not condMapEmpty!16671)) mapNonEmpty!16671))

(get-info :version)

(assert (= (and mapNonEmpty!16671 ((_ is ValueCellFull!4673) mapValue!16671)) b!400274))

(assert (= (and b!400265 ((_ is ValueCellFull!4673) mapDefault!16671)) b!400264))

(assert (= start!38600 b!400265))

(declare-fun m!394773 () Bool)

(assert (=> bm!28101 m!394773))

(declare-fun m!394775 () Bool)

(assert (=> bm!28101 m!394775))

(declare-fun m!394777 () Bool)

(assert (=> mapNonEmpty!16671 m!394777))

(declare-fun m!394779 () Bool)

(assert (=> b!400261 m!394779))

(declare-fun m!394781 () Bool)

(assert (=> b!400276 m!394781))

(declare-fun m!394783 () Bool)

(assert (=> b!400269 m!394783))

(declare-fun m!394785 () Bool)

(assert (=> start!38600 m!394785))

(declare-fun m!394787 () Bool)

(assert (=> start!38600 m!394787))

(assert (=> bm!28102 m!394773))

(declare-fun m!394789 () Bool)

(assert (=> bm!28102 m!394789))

(declare-fun m!394791 () Bool)

(assert (=> b!400271 m!394791))

(declare-fun m!394793 () Bool)

(assert (=> b!400268 m!394793))

(declare-fun m!394795 () Bool)

(assert (=> b!400275 m!394795))

(declare-fun m!394797 () Bool)

(assert (=> b!400267 m!394797))

(declare-fun m!394799 () Bool)

(assert (=> b!400272 m!394799))

(declare-fun m!394801 () Bool)

(assert (=> b!400262 m!394801))

(declare-fun m!394803 () Bool)

(assert (=> b!400262 m!394803))

(declare-fun m!394805 () Bool)

(assert (=> b!400260 m!394805))

(check-sat (not bm!28101) (not b!400262) b_and!16551 (not b!400276) (not b!400260) (not mapNonEmpty!16671) (not b!400275) (not b!400261) (not b!400269) (not b!400267) (not b!400272) (not bm!28102) tp_is_empty!10033 (not b_next!9151) (not start!38600) (not b!400268))
(check-sat b_and!16551 (not b_next!9151))
