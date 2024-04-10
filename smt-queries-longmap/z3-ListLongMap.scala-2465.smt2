; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38610 () Bool)

(assert start!38610)

(declare-fun b_free!9147 () Bool)

(declare-fun b_next!9147 () Bool)

(assert (=> start!38610 (= b_free!9147 (not b_next!9147))))

(declare-fun tp!32564 () Bool)

(declare-fun b_and!16533 () Bool)

(assert (=> start!38610 (= tp!32564 b_and!16533)))

(declare-fun b!400207 () Bool)

(declare-fun res!230220 () Bool)

(declare-fun e!241547 () Bool)

(assert (=> b!400207 (=> (not res!230220) (not e!241547))))

(declare-datatypes ((array!23969 0))(
  ( (array!23970 (arr!11434 (Array (_ BitVec 32) (_ BitVec 64))) (size!11786 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23969)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400207 (= res!230220 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!230223 () Bool)

(assert (=> start!38610 (=> (not res!230223) (not e!241547))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38610 (= res!230223 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11786 _keys!709))))))

(assert (=> start!38610 e!241547))

(declare-fun tp_is_empty!10029 () Bool)

(assert (=> start!38610 tp_is_empty!10029))

(assert (=> start!38610 tp!32564))

(assert (=> start!38610 true))

(declare-datatypes ((V!14477 0))(
  ( (V!14478 (val!5059 Int)) )
))
(declare-datatypes ((ValueCell!4671 0))(
  ( (ValueCellFull!4671 (v!7306 V!14477)) (EmptyCell!4671) )
))
(declare-datatypes ((array!23971 0))(
  ( (array!23972 (arr!11435 (Array (_ BitVec 32) ValueCell!4671)) (size!11787 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23971)

(declare-fun e!241546 () Bool)

(declare-fun array_inv!8374 (array!23971) Bool)

(assert (=> start!38610 (and (array_inv!8374 _values!549) e!241546)))

(declare-fun array_inv!8375 (array!23969) Bool)

(assert (=> start!38610 (array_inv!8375 _keys!709)))

(declare-fun b!400208 () Bool)

(declare-fun res!230227 () Bool)

(assert (=> b!400208 (=> (not res!230227) (not e!241547))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!400208 (= res!230227 (and (= (size!11787 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11786 _keys!709) (size!11787 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400209 () Bool)

(declare-fun res!230229 () Bool)

(assert (=> b!400209 (=> (not res!230229) (not e!241547))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400209 (= res!230229 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11786 _keys!709))))))

(declare-fun b!400210 () Bool)

(declare-fun res!230224 () Bool)

(assert (=> b!400210 (=> (not res!230224) (not e!241547))))

(declare-datatypes ((List!6629 0))(
  ( (Nil!6626) (Cons!6625 (h!7481 (_ BitVec 64)) (t!11803 List!6629)) )
))
(declare-fun arrayNoDuplicates!0 (array!23969 (_ BitVec 32) List!6629) Bool)

(assert (=> b!400210 (= res!230224 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6626))))

(declare-fun b!400211 () Bool)

(declare-fun res!230222 () Bool)

(declare-fun e!241550 () Bool)

(assert (=> b!400211 (=> (not res!230222) (not e!241550))))

(assert (=> b!400211 (= res!230222 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11786 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16665 () Bool)

(declare-fun mapRes!16665 () Bool)

(assert (=> mapIsEmpty!16665 mapRes!16665))

(declare-fun b!400212 () Bool)

(declare-fun res!230218 () Bool)

(assert (=> b!400212 (=> (not res!230218) (not e!241550))))

(declare-fun lt!187667 () array!23969)

(assert (=> b!400212 (= res!230218 (arrayNoDuplicates!0 lt!187667 #b00000000000000000000000000000000 Nil!6626))))

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!28102 () Bool)

(declare-fun zeroValue!515 () V!14477)

(declare-datatypes ((tuple2!6706 0))(
  ( (tuple2!6707 (_1!3364 (_ BitVec 64)) (_2!3364 V!14477)) )
))
(declare-datatypes ((List!6630 0))(
  ( (Nil!6627) (Cons!6626 (h!7482 tuple2!6706) (t!11804 List!6630)) )
))
(declare-datatypes ((ListLongMap!5619 0))(
  ( (ListLongMap!5620 (toList!2825 List!6630)) )
))
(declare-fun call!28106 () ListLongMap!5619)

(declare-fun v!412 () V!14477)

(declare-fun minValue!515 () V!14477)

(declare-fun c!54677 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1039 (array!23969 array!23971 (_ BitVec 32) (_ BitVec 32) V!14477 V!14477 (_ BitVec 32) Int) ListLongMap!5619)

(assert (=> bm!28102 (= call!28106 (getCurrentListMapNoExtraKeys!1039 (ite c!54677 lt!187667 _keys!709) (ite c!54677 (array!23972 (store (arr!11435 _values!549) i!563 (ValueCellFull!4671 v!412)) (size!11787 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400213 () Bool)

(assert (=> b!400213 (= e!241550 (not true))))

(declare-fun e!241548 () Bool)

(assert (=> b!400213 e!241548))

(assert (=> b!400213 (= c!54677 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12126 0))(
  ( (Unit!12127) )
))
(declare-fun lt!187666 () Unit!12126)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!321 (array!23969 array!23971 (_ BitVec 32) (_ BitVec 32) V!14477 V!14477 (_ BitVec 32) (_ BitVec 64) V!14477 (_ BitVec 32) Int) Unit!12126)

(assert (=> b!400213 (= lt!187666 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!321 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16665 () Bool)

(declare-fun tp!32565 () Bool)

(declare-fun e!241549 () Bool)

(assert (=> mapNonEmpty!16665 (= mapRes!16665 (and tp!32565 e!241549))))

(declare-fun mapValue!16665 () ValueCell!4671)

(declare-fun mapKey!16665 () (_ BitVec 32))

(declare-fun mapRest!16665 () (Array (_ BitVec 32) ValueCell!4671))

(assert (=> mapNonEmpty!16665 (= (arr!11435 _values!549) (store mapRest!16665 mapKey!16665 mapValue!16665))))

(declare-fun b!400214 () Bool)

(declare-fun call!28105 () ListLongMap!5619)

(declare-fun +!1113 (ListLongMap!5619 tuple2!6706) ListLongMap!5619)

(assert (=> b!400214 (= e!241548 (= call!28106 (+!1113 call!28105 (tuple2!6707 k0!794 v!412))))))

(declare-fun b!400215 () Bool)

(declare-fun res!230226 () Bool)

(assert (=> b!400215 (=> (not res!230226) (not e!241547))))

(assert (=> b!400215 (= res!230226 (or (= (select (arr!11434 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11434 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400216 () Bool)

(assert (=> b!400216 (= e!241547 e!241550)))

(declare-fun res!230219 () Bool)

(assert (=> b!400216 (=> (not res!230219) (not e!241550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23969 (_ BitVec 32)) Bool)

(assert (=> b!400216 (= res!230219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187667 mask!1025))))

(assert (=> b!400216 (= lt!187667 (array!23970 (store (arr!11434 _keys!709) i!563 k0!794) (size!11786 _keys!709)))))

(declare-fun b!400217 () Bool)

(assert (=> b!400217 (= e!241548 (= call!28105 call!28106))))

(declare-fun b!400218 () Bool)

(declare-fun res!230221 () Bool)

(assert (=> b!400218 (=> (not res!230221) (not e!241547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400218 (= res!230221 (validKeyInArray!0 k0!794))))

(declare-fun bm!28103 () Bool)

(assert (=> bm!28103 (= call!28105 (getCurrentListMapNoExtraKeys!1039 (ite c!54677 _keys!709 lt!187667) (ite c!54677 _values!549 (array!23972 (store (arr!11435 _values!549) i!563 (ValueCellFull!4671 v!412)) (size!11787 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400219 () Bool)

(declare-fun e!241545 () Bool)

(assert (=> b!400219 (= e!241546 (and e!241545 mapRes!16665))))

(declare-fun condMapEmpty!16665 () Bool)

(declare-fun mapDefault!16665 () ValueCell!4671)

(assert (=> b!400219 (= condMapEmpty!16665 (= (arr!11435 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4671)) mapDefault!16665)))))

(declare-fun b!400220 () Bool)

(declare-fun res!230225 () Bool)

(assert (=> b!400220 (=> (not res!230225) (not e!241547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400220 (= res!230225 (validMask!0 mask!1025))))

(declare-fun b!400221 () Bool)

(assert (=> b!400221 (= e!241549 tp_is_empty!10029)))

(declare-fun b!400222 () Bool)

(declare-fun res!230228 () Bool)

(assert (=> b!400222 (=> (not res!230228) (not e!241547))))

(assert (=> b!400222 (= res!230228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400223 () Bool)

(assert (=> b!400223 (= e!241545 tp_is_empty!10029)))

(assert (= (and start!38610 res!230223) b!400220))

(assert (= (and b!400220 res!230225) b!400208))

(assert (= (and b!400208 res!230227) b!400222))

(assert (= (and b!400222 res!230228) b!400210))

(assert (= (and b!400210 res!230224) b!400209))

(assert (= (and b!400209 res!230229) b!400218))

(assert (= (and b!400218 res!230221) b!400215))

(assert (= (and b!400215 res!230226) b!400207))

(assert (= (and b!400207 res!230220) b!400216))

(assert (= (and b!400216 res!230219) b!400212))

(assert (= (and b!400212 res!230218) b!400211))

(assert (= (and b!400211 res!230222) b!400213))

(assert (= (and b!400213 c!54677) b!400214))

(assert (= (and b!400213 (not c!54677)) b!400217))

(assert (= (or b!400214 b!400217) bm!28102))

(assert (= (or b!400214 b!400217) bm!28103))

(assert (= (and b!400219 condMapEmpty!16665) mapIsEmpty!16665))

(assert (= (and b!400219 (not condMapEmpty!16665)) mapNonEmpty!16665))

(get-info :version)

(assert (= (and mapNonEmpty!16665 ((_ is ValueCellFull!4671) mapValue!16665)) b!400221))

(assert (= (and b!400219 ((_ is ValueCellFull!4671) mapDefault!16665)) b!400223))

(assert (= start!38610 b!400219))

(declare-fun m!394475 () Bool)

(assert (=> b!400222 m!394475))

(declare-fun m!394477 () Bool)

(assert (=> bm!28103 m!394477))

(declare-fun m!394479 () Bool)

(assert (=> bm!28103 m!394479))

(declare-fun m!394481 () Bool)

(assert (=> b!400220 m!394481))

(declare-fun m!394483 () Bool)

(assert (=> b!400218 m!394483))

(declare-fun m!394485 () Bool)

(assert (=> b!400213 m!394485))

(declare-fun m!394487 () Bool)

(assert (=> mapNonEmpty!16665 m!394487))

(assert (=> bm!28102 m!394477))

(declare-fun m!394489 () Bool)

(assert (=> bm!28102 m!394489))

(declare-fun m!394491 () Bool)

(assert (=> b!400207 m!394491))

(declare-fun m!394493 () Bool)

(assert (=> b!400215 m!394493))

(declare-fun m!394495 () Bool)

(assert (=> b!400214 m!394495))

(declare-fun m!394497 () Bool)

(assert (=> b!400212 m!394497))

(declare-fun m!394499 () Bool)

(assert (=> b!400210 m!394499))

(declare-fun m!394501 () Bool)

(assert (=> start!38610 m!394501))

(declare-fun m!394503 () Bool)

(assert (=> start!38610 m!394503))

(declare-fun m!394505 () Bool)

(assert (=> b!400216 m!394505))

(declare-fun m!394507 () Bool)

(assert (=> b!400216 m!394507))

(check-sat tp_is_empty!10029 (not b!400218) (not mapNonEmpty!16665) (not b!400212) (not b_next!9147) (not b!400213) (not b!400220) (not bm!28103) (not b!400222) (not b!400210) b_and!16533 (not start!38610) (not b!400207) (not b!400216) (not b!400214) (not bm!28102))
(check-sat b_and!16533 (not b_next!9147))
