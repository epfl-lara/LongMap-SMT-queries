; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38682 () Bool)

(assert start!38682)

(declare-fun b_free!9219 () Bool)

(declare-fun b_next!9219 () Bool)

(assert (=> start!38682 (= b_free!9219 (not b_next!9219))))

(declare-fun tp!32780 () Bool)

(declare-fun b_and!16605 () Bool)

(assert (=> start!38682 (= tp!32780 b_and!16605)))

(declare-fun b!402043 () Bool)

(declare-fun res!231514 () Bool)

(declare-fun e!242307 () Bool)

(assert (=> b!402043 (=> (not res!231514) (not e!242307))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24109 0))(
  ( (array!24110 (arr!11504 (Array (_ BitVec 32) (_ BitVec 64))) (size!11856 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24109)

(assert (=> b!402043 (= res!231514 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11856 _keys!709))))))

(declare-fun b!402044 () Bool)

(declare-fun e!242306 () Bool)

(declare-fun tp_is_empty!10101 () Bool)

(assert (=> b!402044 (= e!242306 tp_is_empty!10101)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28318 () Bool)

(declare-datatypes ((V!14573 0))(
  ( (V!14574 (val!5095 Int)) )
))
(declare-datatypes ((ValueCell!4707 0))(
  ( (ValueCellFull!4707 (v!7342 V!14573)) (EmptyCell!4707) )
))
(declare-datatypes ((array!24111 0))(
  ( (array!24112 (arr!11505 (Array (_ BitVec 32) ValueCell!4707)) (size!11857 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24111)

(declare-fun zeroValue!515 () V!14573)

(declare-fun lt!187882 () array!24109)

(declare-fun v!412 () V!14573)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!54785 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!14573)

(declare-datatypes ((tuple2!6766 0))(
  ( (tuple2!6767 (_1!3394 (_ BitVec 64)) (_2!3394 V!14573)) )
))
(declare-datatypes ((List!6689 0))(
  ( (Nil!6686) (Cons!6685 (h!7541 tuple2!6766) (t!11863 List!6689)) )
))
(declare-datatypes ((ListLongMap!5679 0))(
  ( (ListLongMap!5680 (toList!2855 List!6689)) )
))
(declare-fun call!28321 () ListLongMap!5679)

(declare-fun getCurrentListMapNoExtraKeys!1066 (array!24109 array!24111 (_ BitVec 32) (_ BitVec 32) V!14573 V!14573 (_ BitVec 32) Int) ListLongMap!5679)

(assert (=> bm!28318 (= call!28321 (getCurrentListMapNoExtraKeys!1066 (ite c!54785 _keys!709 lt!187882) (ite c!54785 _values!549 (array!24112 (store (arr!11505 _values!549) i!563 (ValueCellFull!4707 v!412)) (size!11857 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402045 () Bool)

(declare-fun res!231524 () Bool)

(assert (=> b!402045 (=> (not res!231524) (not e!242307))))

(declare-datatypes ((List!6690 0))(
  ( (Nil!6687) (Cons!6686 (h!7542 (_ BitVec 64)) (t!11864 List!6690)) )
))
(declare-fun arrayNoDuplicates!0 (array!24109 (_ BitVec 32) List!6690) Bool)

(assert (=> b!402045 (= res!231524 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6687))))

(declare-fun b!402046 () Bool)

(declare-fun res!231523 () Bool)

(assert (=> b!402046 (=> (not res!231523) (not e!242307))))

(assert (=> b!402046 (= res!231523 (and (= (size!11857 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11856 _keys!709) (size!11857 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402047 () Bool)

(declare-fun res!231521 () Bool)

(assert (=> b!402047 (=> (not res!231521) (not e!242307))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402047 (= res!231521 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun e!242302 () Bool)

(declare-fun b!402048 () Bool)

(declare-fun call!28322 () ListLongMap!5679)

(declare-fun +!1134 (ListLongMap!5679 tuple2!6766) ListLongMap!5679)

(assert (=> b!402048 (= e!242302 (= call!28322 (+!1134 call!28321 (tuple2!6767 k0!794 v!412))))))

(declare-fun b!402049 () Bool)

(declare-fun res!231516 () Bool)

(assert (=> b!402049 (=> (not res!231516) (not e!242307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402049 (= res!231516 (validKeyInArray!0 k0!794))))

(declare-fun b!402050 () Bool)

(assert (=> b!402050 (= e!242302 (= call!28321 call!28322))))

(declare-fun b!402051 () Bool)

(declare-fun e!242301 () Bool)

(assert (=> b!402051 (= e!242307 e!242301)))

(declare-fun res!231520 () Bool)

(assert (=> b!402051 (=> (not res!231520) (not e!242301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24109 (_ BitVec 32)) Bool)

(assert (=> b!402051 (= res!231520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187882 mask!1025))))

(assert (=> b!402051 (= lt!187882 (array!24110 (store (arr!11504 _keys!709) i!563 k0!794) (size!11856 _keys!709)))))

(declare-fun mapNonEmpty!16773 () Bool)

(declare-fun mapRes!16773 () Bool)

(declare-fun tp!32781 () Bool)

(assert (=> mapNonEmpty!16773 (= mapRes!16773 (and tp!32781 e!242306))))

(declare-fun mapValue!16773 () ValueCell!4707)

(declare-fun mapKey!16773 () (_ BitVec 32))

(declare-fun mapRest!16773 () (Array (_ BitVec 32) ValueCell!4707))

(assert (=> mapNonEmpty!16773 (= (arr!11505 _values!549) (store mapRest!16773 mapKey!16773 mapValue!16773))))

(declare-fun b!402052 () Bool)

(declare-fun res!231517 () Bool)

(assert (=> b!402052 (=> (not res!231517) (not e!242307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402052 (= res!231517 (validMask!0 mask!1025))))

(declare-fun bm!28319 () Bool)

(assert (=> bm!28319 (= call!28322 (getCurrentListMapNoExtraKeys!1066 (ite c!54785 lt!187882 _keys!709) (ite c!54785 (array!24112 (store (arr!11505 _values!549) i!563 (ValueCellFull!4707 v!412)) (size!11857 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402053 () Bool)

(assert (=> b!402053 (= e!242301 (not true))))

(assert (=> b!402053 e!242302))

(assert (=> b!402053 (= c!54785 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12174 0))(
  ( (Unit!12175) )
))
(declare-fun lt!187883 () Unit!12174)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!345 (array!24109 array!24111 (_ BitVec 32) (_ BitVec 32) V!14573 V!14573 (_ BitVec 32) (_ BitVec 64) V!14573 (_ BitVec 32) Int) Unit!12174)

(assert (=> b!402053 (= lt!187883 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!345 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402054 () Bool)

(declare-fun e!242305 () Bool)

(declare-fun e!242304 () Bool)

(assert (=> b!402054 (= e!242305 (and e!242304 mapRes!16773))))

(declare-fun condMapEmpty!16773 () Bool)

(declare-fun mapDefault!16773 () ValueCell!4707)

(assert (=> b!402054 (= condMapEmpty!16773 (= (arr!11505 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4707)) mapDefault!16773)))))

(declare-fun b!402055 () Bool)

(assert (=> b!402055 (= e!242304 tp_is_empty!10101)))

(declare-fun b!402056 () Bool)

(declare-fun res!231518 () Bool)

(assert (=> b!402056 (=> (not res!231518) (not e!242301))))

(assert (=> b!402056 (= res!231518 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11856 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402057 () Bool)

(declare-fun res!231515 () Bool)

(assert (=> b!402057 (=> (not res!231515) (not e!242307))))

(assert (=> b!402057 (= res!231515 (or (= (select (arr!11504 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11504 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402058 () Bool)

(declare-fun res!231519 () Bool)

(assert (=> b!402058 (=> (not res!231519) (not e!242301))))

(assert (=> b!402058 (= res!231519 (arrayNoDuplicates!0 lt!187882 #b00000000000000000000000000000000 Nil!6687))))

(declare-fun mapIsEmpty!16773 () Bool)

(assert (=> mapIsEmpty!16773 mapRes!16773))

(declare-fun b!402059 () Bool)

(declare-fun res!231525 () Bool)

(assert (=> b!402059 (=> (not res!231525) (not e!242307))))

(assert (=> b!402059 (= res!231525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!231522 () Bool)

(assert (=> start!38682 (=> (not res!231522) (not e!242307))))

(assert (=> start!38682 (= res!231522 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11856 _keys!709))))))

(assert (=> start!38682 e!242307))

(assert (=> start!38682 tp_is_empty!10101))

(assert (=> start!38682 tp!32780))

(assert (=> start!38682 true))

(declare-fun array_inv!8420 (array!24111) Bool)

(assert (=> start!38682 (and (array_inv!8420 _values!549) e!242305)))

(declare-fun array_inv!8421 (array!24109) Bool)

(assert (=> start!38682 (array_inv!8421 _keys!709)))

(assert (= (and start!38682 res!231522) b!402052))

(assert (= (and b!402052 res!231517) b!402046))

(assert (= (and b!402046 res!231523) b!402059))

(assert (= (and b!402059 res!231525) b!402045))

(assert (= (and b!402045 res!231524) b!402043))

(assert (= (and b!402043 res!231514) b!402049))

(assert (= (and b!402049 res!231516) b!402057))

(assert (= (and b!402057 res!231515) b!402047))

(assert (= (and b!402047 res!231521) b!402051))

(assert (= (and b!402051 res!231520) b!402058))

(assert (= (and b!402058 res!231519) b!402056))

(assert (= (and b!402056 res!231518) b!402053))

(assert (= (and b!402053 c!54785) b!402048))

(assert (= (and b!402053 (not c!54785)) b!402050))

(assert (= (or b!402048 b!402050) bm!28319))

(assert (= (or b!402048 b!402050) bm!28318))

(assert (= (and b!402054 condMapEmpty!16773) mapIsEmpty!16773))

(assert (= (and b!402054 (not condMapEmpty!16773)) mapNonEmpty!16773))

(get-info :version)

(assert (= (and mapNonEmpty!16773 ((_ is ValueCellFull!4707) mapValue!16773)) b!402044))

(assert (= (and b!402054 ((_ is ValueCellFull!4707) mapDefault!16773)) b!402055))

(assert (= start!38682 b!402054))

(declare-fun m!395699 () Bool)

(assert (=> b!402045 m!395699))

(declare-fun m!395701 () Bool)

(assert (=> b!402051 m!395701))

(declare-fun m!395703 () Bool)

(assert (=> b!402051 m!395703))

(declare-fun m!395705 () Bool)

(assert (=> bm!28319 m!395705))

(declare-fun m!395707 () Bool)

(assert (=> bm!28319 m!395707))

(declare-fun m!395709 () Bool)

(assert (=> b!402058 m!395709))

(declare-fun m!395711 () Bool)

(assert (=> mapNonEmpty!16773 m!395711))

(declare-fun m!395713 () Bool)

(assert (=> b!402059 m!395713))

(declare-fun m!395715 () Bool)

(assert (=> b!402047 m!395715))

(declare-fun m!395717 () Bool)

(assert (=> b!402053 m!395717))

(assert (=> bm!28318 m!395705))

(declare-fun m!395719 () Bool)

(assert (=> bm!28318 m!395719))

(declare-fun m!395721 () Bool)

(assert (=> b!402052 m!395721))

(declare-fun m!395723 () Bool)

(assert (=> b!402048 m!395723))

(declare-fun m!395725 () Bool)

(assert (=> b!402049 m!395725))

(declare-fun m!395727 () Bool)

(assert (=> start!38682 m!395727))

(declare-fun m!395729 () Bool)

(assert (=> start!38682 m!395729))

(declare-fun m!395731 () Bool)

(assert (=> b!402057 m!395731))

(check-sat (not b!402058) (not mapNonEmpty!16773) (not bm!28318) tp_is_empty!10101 (not b!402049) (not b!402053) (not b!402059) (not b!402045) (not bm!28319) (not b!402047) (not b!402052) (not start!38682) b_and!16605 (not b_next!9219) (not b!402051) (not b!402048))
(check-sat b_and!16605 (not b_next!9219))
