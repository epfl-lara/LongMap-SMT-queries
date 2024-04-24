; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38642 () Bool)

(assert start!38642)

(declare-fun b_free!9193 () Bool)

(declare-fun b_next!9193 () Bool)

(assert (=> start!38642 (= b_free!9193 (not b_next!9193))))

(declare-fun tp!32702 () Bool)

(declare-fun b_and!16593 () Bool)

(assert (=> start!38642 (= tp!32702 b_and!16593)))

(declare-datatypes ((V!14539 0))(
  ( (V!14540 (val!5082 Int)) )
))
(declare-datatypes ((tuple2!6606 0))(
  ( (tuple2!6607 (_1!3314 (_ BitVec 64)) (_2!3314 V!14539)) )
))
(declare-datatypes ((List!6527 0))(
  ( (Nil!6524) (Cons!6523 (h!7379 tuple2!6606) (t!11693 List!6527)) )
))
(declare-datatypes ((ListLongMap!5521 0))(
  ( (ListLongMap!5522 (toList!2776 List!6527)) )
))
(declare-fun call!28230 () ListLongMap!5521)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!401331 () Bool)

(declare-fun e!242000 () Bool)

(declare-fun call!28231 () ListLongMap!5521)

(declare-fun v!412 () V!14539)

(declare-fun +!1121 (ListLongMap!5521 tuple2!6606) ListLongMap!5521)

(assert (=> b!401331 (= e!242000 (= call!28230 (+!1121 call!28231 (tuple2!6607 k0!794 v!412))))))

(declare-fun b!401332 () Bool)

(declare-fun res!231054 () Bool)

(declare-fun e!241998 () Bool)

(assert (=> b!401332 (=> (not res!231054) (not e!241998))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24034 0))(
  ( (array!24035 (arr!11466 (Array (_ BitVec 32) (_ BitVec 64))) (size!11818 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24034)

(assert (=> b!401332 (= res!231054 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11818 _keys!709))))))

(declare-fun mapIsEmpty!16734 () Bool)

(declare-fun mapRes!16734 () Bool)

(assert (=> mapIsEmpty!16734 mapRes!16734))

(declare-fun b!401333 () Bool)

(declare-fun e!241997 () Bool)

(declare-fun e!242001 () Bool)

(assert (=> b!401333 (= e!241997 (and e!242001 mapRes!16734))))

(declare-fun condMapEmpty!16734 () Bool)

(declare-datatypes ((ValueCell!4694 0))(
  ( (ValueCellFull!4694 (v!7330 V!14539)) (EmptyCell!4694) )
))
(declare-datatypes ((array!24036 0))(
  ( (array!24037 (arr!11467 (Array (_ BitVec 32) ValueCell!4694)) (size!11819 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24036)

(declare-fun mapDefault!16734 () ValueCell!4694)

(assert (=> b!401333 (= condMapEmpty!16734 (= (arr!11467 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4694)) mapDefault!16734)))))

(declare-fun mapNonEmpty!16734 () Bool)

(declare-fun tp!32703 () Bool)

(declare-fun e!241996 () Bool)

(assert (=> mapNonEmpty!16734 (= mapRes!16734 (and tp!32703 e!241996))))

(declare-fun mapValue!16734 () ValueCell!4694)

(declare-fun mapRest!16734 () (Array (_ BitVec 32) ValueCell!4694))

(declare-fun mapKey!16734 () (_ BitVec 32))

(assert (=> mapNonEmpty!16734 (= (arr!11467 _values!549) (store mapRest!16734 mapKey!16734 mapValue!16734))))

(declare-fun minValue!515 () V!14539)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!187824 () array!24034)

(declare-fun c!54723 () Bool)

(declare-fun bm!28227 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14539)

(declare-fun getCurrentListMapNoExtraKeys!1033 (array!24034 array!24036 (_ BitVec 32) (_ BitVec 32) V!14539 V!14539 (_ BitVec 32) Int) ListLongMap!5521)

(assert (=> bm!28227 (= call!28230 (getCurrentListMapNoExtraKeys!1033 (ite c!54723 lt!187824 _keys!709) (ite c!54723 (array!24037 (store (arr!11467 _values!549) i!563 (ValueCellFull!4694 v!412)) (size!11819 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!231043 () Bool)

(assert (=> start!38642 (=> (not res!231043) (not e!241998))))

(assert (=> start!38642 (= res!231043 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11818 _keys!709))))))

(assert (=> start!38642 e!241998))

(declare-fun tp_is_empty!10075 () Bool)

(assert (=> start!38642 tp_is_empty!10075))

(assert (=> start!38642 tp!32702))

(assert (=> start!38642 true))

(declare-fun array_inv!8466 (array!24036) Bool)

(assert (=> start!38642 (and (array_inv!8466 _values!549) e!241997)))

(declare-fun array_inv!8467 (array!24034) Bool)

(assert (=> start!38642 (array_inv!8467 _keys!709)))

(declare-fun b!401334 () Bool)

(declare-fun e!241999 () Bool)

(assert (=> b!401334 (= e!241999 (not true))))

(assert (=> b!401334 e!242000))

(assert (=> b!401334 (= c!54723 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12129 0))(
  ( (Unit!12130) )
))
(declare-fun lt!187823 () Unit!12129)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!332 (array!24034 array!24036 (_ BitVec 32) (_ BitVec 32) V!14539 V!14539 (_ BitVec 32) (_ BitVec 64) V!14539 (_ BitVec 32) Int) Unit!12129)

(assert (=> b!401334 (= lt!187823 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!332 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401335 () Bool)

(declare-fun res!231044 () Bool)

(assert (=> b!401335 (=> (not res!231044) (not e!241998))))

(assert (=> b!401335 (= res!231044 (or (= (select (arr!11466 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11466 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401336 () Bool)

(declare-fun res!231053 () Bool)

(assert (=> b!401336 (=> (not res!231053) (not e!241998))))

(declare-datatypes ((List!6528 0))(
  ( (Nil!6525) (Cons!6524 (h!7380 (_ BitVec 64)) (t!11694 List!6528)) )
))
(declare-fun arrayNoDuplicates!0 (array!24034 (_ BitVec 32) List!6528) Bool)

(assert (=> b!401336 (= res!231053 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6525))))

(declare-fun b!401337 () Bool)

(assert (=> b!401337 (= e!241998 e!241999)))

(declare-fun res!231045 () Bool)

(assert (=> b!401337 (=> (not res!231045) (not e!241999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24034 (_ BitVec 32)) Bool)

(assert (=> b!401337 (= res!231045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187824 mask!1025))))

(assert (=> b!401337 (= lt!187824 (array!24035 (store (arr!11466 _keys!709) i!563 k0!794) (size!11818 _keys!709)))))

(declare-fun b!401338 () Bool)

(assert (=> b!401338 (= e!241996 tp_is_empty!10075)))

(declare-fun b!401339 () Bool)

(declare-fun res!231049 () Bool)

(assert (=> b!401339 (=> (not res!231049) (not e!241998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401339 (= res!231049 (validKeyInArray!0 k0!794))))

(declare-fun b!401340 () Bool)

(declare-fun res!231047 () Bool)

(assert (=> b!401340 (=> (not res!231047) (not e!241998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401340 (= res!231047 (validMask!0 mask!1025))))

(declare-fun b!401341 () Bool)

(assert (=> b!401341 (= e!242000 (= call!28231 call!28230))))

(declare-fun bm!28228 () Bool)

(assert (=> bm!28228 (= call!28231 (getCurrentListMapNoExtraKeys!1033 (ite c!54723 _keys!709 lt!187824) (ite c!54723 _values!549 (array!24037 (store (arr!11467 _values!549) i!563 (ValueCellFull!4694 v!412)) (size!11819 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401342 () Bool)

(declare-fun res!231052 () Bool)

(assert (=> b!401342 (=> (not res!231052) (not e!241999))))

(assert (=> b!401342 (= res!231052 (arrayNoDuplicates!0 lt!187824 #b00000000000000000000000000000000 Nil!6525))))

(declare-fun b!401343 () Bool)

(assert (=> b!401343 (= e!242001 tp_is_empty!10075)))

(declare-fun b!401344 () Bool)

(declare-fun res!231048 () Bool)

(assert (=> b!401344 (=> (not res!231048) (not e!241998))))

(assert (=> b!401344 (= res!231048 (and (= (size!11819 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11818 _keys!709) (size!11819 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401345 () Bool)

(declare-fun res!231046 () Bool)

(assert (=> b!401345 (=> (not res!231046) (not e!241999))))

(assert (=> b!401345 (= res!231046 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11818 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401346 () Bool)

(declare-fun res!231050 () Bool)

(assert (=> b!401346 (=> (not res!231050) (not e!241998))))

(declare-fun arrayContainsKey!0 (array!24034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401346 (= res!231050 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401347 () Bool)

(declare-fun res!231051 () Bool)

(assert (=> b!401347 (=> (not res!231051) (not e!241998))))

(assert (=> b!401347 (= res!231051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38642 res!231043) b!401340))

(assert (= (and b!401340 res!231047) b!401344))

(assert (= (and b!401344 res!231048) b!401347))

(assert (= (and b!401347 res!231051) b!401336))

(assert (= (and b!401336 res!231053) b!401332))

(assert (= (and b!401332 res!231054) b!401339))

(assert (= (and b!401339 res!231049) b!401335))

(assert (= (and b!401335 res!231044) b!401346))

(assert (= (and b!401346 res!231050) b!401337))

(assert (= (and b!401337 res!231045) b!401342))

(assert (= (and b!401342 res!231052) b!401345))

(assert (= (and b!401345 res!231046) b!401334))

(assert (= (and b!401334 c!54723) b!401331))

(assert (= (and b!401334 (not c!54723)) b!401341))

(assert (= (or b!401331 b!401341) bm!28227))

(assert (= (or b!401331 b!401341) bm!28228))

(assert (= (and b!401333 condMapEmpty!16734) mapIsEmpty!16734))

(assert (= (and b!401333 (not condMapEmpty!16734)) mapNonEmpty!16734))

(get-info :version)

(assert (= (and mapNonEmpty!16734 ((_ is ValueCellFull!4694) mapValue!16734)) b!401338))

(assert (= (and b!401333 ((_ is ValueCellFull!4694) mapDefault!16734)) b!401343))

(assert (= start!38642 b!401333))

(declare-fun m!395487 () Bool)

(assert (=> b!401331 m!395487))

(declare-fun m!395489 () Bool)

(assert (=> b!401339 m!395489))

(declare-fun m!395491 () Bool)

(assert (=> b!401337 m!395491))

(declare-fun m!395493 () Bool)

(assert (=> b!401337 m!395493))

(declare-fun m!395495 () Bool)

(assert (=> b!401342 m!395495))

(declare-fun m!395497 () Bool)

(assert (=> b!401336 m!395497))

(declare-fun m!395499 () Bool)

(assert (=> mapNonEmpty!16734 m!395499))

(declare-fun m!395501 () Bool)

(assert (=> b!401340 m!395501))

(declare-fun m!395503 () Bool)

(assert (=> bm!28227 m!395503))

(declare-fun m!395505 () Bool)

(assert (=> bm!28227 m!395505))

(declare-fun m!395507 () Bool)

(assert (=> b!401334 m!395507))

(assert (=> bm!28228 m!395503))

(declare-fun m!395509 () Bool)

(assert (=> bm!28228 m!395509))

(declare-fun m!395511 () Bool)

(assert (=> b!401347 m!395511))

(declare-fun m!395513 () Bool)

(assert (=> b!401346 m!395513))

(declare-fun m!395515 () Bool)

(assert (=> start!38642 m!395515))

(declare-fun m!395517 () Bool)

(assert (=> start!38642 m!395517))

(declare-fun m!395519 () Bool)

(assert (=> b!401335 m!395519))

(check-sat (not start!38642) (not mapNonEmpty!16734) (not b!401331) (not b_next!9193) (not b!401336) (not bm!28227) (not b!401340) b_and!16593 (not b!401347) tp_is_empty!10075 (not bm!28228) (not b!401334) (not b!401339) (not b!401346) (not b!401337) (not b!401342))
(check-sat b_and!16593 (not b_next!9193))
