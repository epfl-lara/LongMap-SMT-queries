; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39660 () Bool)

(assert start!39660)

(declare-fun b_free!9927 () Bool)

(declare-fun b_next!9927 () Bool)

(assert (=> start!39660 (= b_free!9927 (not b_next!9927))))

(declare-fun tp!35310 () Bool)

(declare-fun b_and!17583 () Bool)

(assert (=> start!39660 (= tp!35310 b_and!17583)))

(declare-fun b!425663 () Bool)

(declare-fun e!252664 () Bool)

(declare-fun e!252662 () Bool)

(assert (=> b!425663 (= e!252664 e!252662)))

(declare-fun res!249267 () Bool)

(assert (=> b!425663 (=> (not res!249267) (not e!252662))))

(declare-datatypes ((array!25997 0))(
  ( (array!25998 (arr!12448 (Array (_ BitVec 32) (_ BitVec 64))) (size!12800 (_ BitVec 32))) )
))
(declare-fun lt!194720 () array!25997)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25997 (_ BitVec 32)) Bool)

(assert (=> b!425663 (= res!249267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194720 mask!1025))))

(declare-fun _keys!709 () array!25997)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425663 (= lt!194720 (array!25998 (store (arr!12448 _keys!709) i!563 k0!794) (size!12800 _keys!709)))))

(declare-fun res!249271 () Bool)

(assert (=> start!39660 (=> (not res!249271) (not e!252664))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39660 (= res!249271 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12800 _keys!709))))))

(assert (=> start!39660 e!252664))

(declare-fun tp_is_empty!11079 () Bool)

(assert (=> start!39660 tp_is_empty!11079))

(assert (=> start!39660 tp!35310))

(assert (=> start!39660 true))

(declare-datatypes ((V!15877 0))(
  ( (V!15878 (val!5584 Int)) )
))
(declare-datatypes ((ValueCell!5196 0))(
  ( (ValueCellFull!5196 (v!7831 V!15877)) (EmptyCell!5196) )
))
(declare-datatypes ((array!25999 0))(
  ( (array!26000 (arr!12449 (Array (_ BitVec 32) ValueCell!5196)) (size!12801 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25999)

(declare-fun e!252661 () Bool)

(declare-fun array_inv!9072 (array!25999) Bool)

(assert (=> start!39660 (and (array_inv!9072 _values!549) e!252661)))

(declare-fun array_inv!9073 (array!25997) Bool)

(assert (=> start!39660 (array_inv!9073 _keys!709)))

(declare-fun b!425664 () Bool)

(declare-fun res!249272 () Bool)

(assert (=> b!425664 (=> (not res!249272) (not e!252664))))

(assert (=> b!425664 (= res!249272 (or (= (select (arr!12448 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12448 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425665 () Bool)

(declare-fun res!249268 () Bool)

(assert (=> b!425665 (=> (not res!249268) (not e!252664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425665 (= res!249268 (validMask!0 mask!1025))))

(declare-fun b!425666 () Bool)

(declare-fun res!249276 () Bool)

(assert (=> b!425666 (=> (not res!249276) (not e!252664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425666 (= res!249276 (validKeyInArray!0 k0!794))))

(declare-fun b!425667 () Bool)

(declare-fun res!249269 () Bool)

(assert (=> b!425667 (=> (not res!249269) (not e!252664))))

(assert (=> b!425667 (= res!249269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425668 () Bool)

(declare-fun e!252666 () Bool)

(assert (=> b!425668 (= e!252666 (not true))))

(declare-fun minValue!515 () V!15877)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15877)

(declare-fun lt!194719 () array!25999)

(declare-fun v!412 () V!15877)

(declare-datatypes ((tuple2!7332 0))(
  ( (tuple2!7333 (_1!3677 (_ BitVec 64)) (_2!3677 V!15877)) )
))
(declare-datatypes ((List!7345 0))(
  ( (Nil!7342) (Cons!7341 (h!8197 tuple2!7332) (t!12789 List!7345)) )
))
(declare-datatypes ((ListLongMap!6245 0))(
  ( (ListLongMap!6246 (toList!3138 List!7345)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1342 (array!25997 array!25999 (_ BitVec 32) (_ BitVec 32) V!15877 V!15877 (_ BitVec 32) Int) ListLongMap!6245)

(declare-fun +!1296 (ListLongMap!6245 tuple2!7332) ListLongMap!6245)

(assert (=> b!425668 (= (getCurrentListMapNoExtraKeys!1342 lt!194720 lt!194719 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1296 (getCurrentListMapNoExtraKeys!1342 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7333 k0!794 v!412)))))

(declare-datatypes ((Unit!12494 0))(
  ( (Unit!12495) )
))
(declare-fun lt!194722 () Unit!12494)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!491 (array!25997 array!25999 (_ BitVec 32) (_ BitVec 32) V!15877 V!15877 (_ BitVec 32) (_ BitVec 64) V!15877 (_ BitVec 32) Int) Unit!12494)

(assert (=> b!425668 (= lt!194722 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!491 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18240 () Bool)

(declare-fun mapRes!18240 () Bool)

(assert (=> mapIsEmpty!18240 mapRes!18240))

(declare-fun b!425669 () Bool)

(declare-fun res!249277 () Bool)

(assert (=> b!425669 (=> (not res!249277) (not e!252664))))

(assert (=> b!425669 (= res!249277 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12800 _keys!709))))))

(declare-fun b!425670 () Bool)

(declare-fun e!252665 () Bool)

(assert (=> b!425670 (= e!252665 tp_is_empty!11079)))

(declare-fun b!425671 () Bool)

(declare-fun e!252660 () Bool)

(assert (=> b!425671 (= e!252660 tp_is_empty!11079)))

(declare-fun b!425672 () Bool)

(declare-fun res!249270 () Bool)

(assert (=> b!425672 (=> (not res!249270) (not e!252664))))

(assert (=> b!425672 (= res!249270 (and (= (size!12801 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12800 _keys!709) (size!12801 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425673 () Bool)

(assert (=> b!425673 (= e!252661 (and e!252660 mapRes!18240))))

(declare-fun condMapEmpty!18240 () Bool)

(declare-fun mapDefault!18240 () ValueCell!5196)

(assert (=> b!425673 (= condMapEmpty!18240 (= (arr!12449 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5196)) mapDefault!18240)))))

(declare-fun b!425674 () Bool)

(declare-fun res!249275 () Bool)

(assert (=> b!425674 (=> (not res!249275) (not e!252664))))

(declare-fun arrayContainsKey!0 (array!25997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425674 (= res!249275 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18240 () Bool)

(declare-fun tp!35309 () Bool)

(assert (=> mapNonEmpty!18240 (= mapRes!18240 (and tp!35309 e!252665))))

(declare-fun mapValue!18240 () ValueCell!5196)

(declare-fun mapKey!18240 () (_ BitVec 32))

(declare-fun mapRest!18240 () (Array (_ BitVec 32) ValueCell!5196))

(assert (=> mapNonEmpty!18240 (= (arr!12449 _values!549) (store mapRest!18240 mapKey!18240 mapValue!18240))))

(declare-fun b!425675 () Bool)

(assert (=> b!425675 (= e!252662 e!252666)))

(declare-fun res!249274 () Bool)

(assert (=> b!425675 (=> (not res!249274) (not e!252666))))

(assert (=> b!425675 (= res!249274 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194723 () ListLongMap!6245)

(assert (=> b!425675 (= lt!194723 (getCurrentListMapNoExtraKeys!1342 lt!194720 lt!194719 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!425675 (= lt!194719 (array!26000 (store (arr!12449 _values!549) i!563 (ValueCellFull!5196 v!412)) (size!12801 _values!549)))))

(declare-fun lt!194721 () ListLongMap!6245)

(assert (=> b!425675 (= lt!194721 (getCurrentListMapNoExtraKeys!1342 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425676 () Bool)

(declare-fun res!249278 () Bool)

(assert (=> b!425676 (=> (not res!249278) (not e!252662))))

(assert (=> b!425676 (= res!249278 (bvsle from!863 i!563))))

(declare-fun b!425677 () Bool)

(declare-fun res!249279 () Bool)

(assert (=> b!425677 (=> (not res!249279) (not e!252662))))

(declare-datatypes ((List!7346 0))(
  ( (Nil!7343) (Cons!7342 (h!8198 (_ BitVec 64)) (t!12790 List!7346)) )
))
(declare-fun arrayNoDuplicates!0 (array!25997 (_ BitVec 32) List!7346) Bool)

(assert (=> b!425677 (= res!249279 (arrayNoDuplicates!0 lt!194720 #b00000000000000000000000000000000 Nil!7343))))

(declare-fun b!425678 () Bool)

(declare-fun res!249273 () Bool)

(assert (=> b!425678 (=> (not res!249273) (not e!252664))))

(assert (=> b!425678 (= res!249273 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7343))))

(assert (= (and start!39660 res!249271) b!425665))

(assert (= (and b!425665 res!249268) b!425672))

(assert (= (and b!425672 res!249270) b!425667))

(assert (= (and b!425667 res!249269) b!425678))

(assert (= (and b!425678 res!249273) b!425669))

(assert (= (and b!425669 res!249277) b!425666))

(assert (= (and b!425666 res!249276) b!425664))

(assert (= (and b!425664 res!249272) b!425674))

(assert (= (and b!425674 res!249275) b!425663))

(assert (= (and b!425663 res!249267) b!425677))

(assert (= (and b!425677 res!249279) b!425676))

(assert (= (and b!425676 res!249278) b!425675))

(assert (= (and b!425675 res!249274) b!425668))

(assert (= (and b!425673 condMapEmpty!18240) mapIsEmpty!18240))

(assert (= (and b!425673 (not condMapEmpty!18240)) mapNonEmpty!18240))

(get-info :version)

(assert (= (and mapNonEmpty!18240 ((_ is ValueCellFull!5196) mapValue!18240)) b!425670))

(assert (= (and b!425673 ((_ is ValueCellFull!5196) mapDefault!18240)) b!425671))

(assert (= start!39660 b!425673))

(declare-fun m!414515 () Bool)

(assert (=> b!425674 m!414515))

(declare-fun m!414517 () Bool)

(assert (=> b!425675 m!414517))

(declare-fun m!414519 () Bool)

(assert (=> b!425675 m!414519))

(declare-fun m!414521 () Bool)

(assert (=> b!425675 m!414521))

(declare-fun m!414523 () Bool)

(assert (=> b!425668 m!414523))

(declare-fun m!414525 () Bool)

(assert (=> b!425668 m!414525))

(assert (=> b!425668 m!414525))

(declare-fun m!414527 () Bool)

(assert (=> b!425668 m!414527))

(declare-fun m!414529 () Bool)

(assert (=> b!425668 m!414529))

(declare-fun m!414531 () Bool)

(assert (=> start!39660 m!414531))

(declare-fun m!414533 () Bool)

(assert (=> start!39660 m!414533))

(declare-fun m!414535 () Bool)

(assert (=> mapNonEmpty!18240 m!414535))

(declare-fun m!414537 () Bool)

(assert (=> b!425678 m!414537))

(declare-fun m!414539 () Bool)

(assert (=> b!425664 m!414539))

(declare-fun m!414541 () Bool)

(assert (=> b!425666 m!414541))

(declare-fun m!414543 () Bool)

(assert (=> b!425663 m!414543))

(declare-fun m!414545 () Bool)

(assert (=> b!425663 m!414545))

(declare-fun m!414547 () Bool)

(assert (=> b!425677 m!414547))

(declare-fun m!414549 () Bool)

(assert (=> b!425665 m!414549))

(declare-fun m!414551 () Bool)

(assert (=> b!425667 m!414551))

(check-sat (not b!425674) (not b!425677) b_and!17583 (not b!425663) (not mapNonEmpty!18240) (not b!425666) (not b!425668) (not start!39660) tp_is_empty!11079 (not b!425675) (not b!425667) (not b!425665) (not b!425678) (not b_next!9927))
(check-sat b_and!17583 (not b_next!9927))
