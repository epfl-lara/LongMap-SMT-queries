; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43096 () Bool)

(assert start!43096)

(declare-fun res!285360 () Bool)

(declare-fun e!281086 () Bool)

(assert (=> start!43096 (=> (not res!285360) (not e!281086))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43096 (= res!285360 (validMask!0 mask!2352))))

(assert (=> start!43096 e!281086))

(assert (=> start!43096 true))

(declare-datatypes ((V!19129 0))(
  ( (V!19130 (val!6819 Int)) )
))
(declare-datatypes ((ValueCell!6410 0))(
  ( (ValueCellFull!6410 (v!9108 V!19129)) (EmptyCell!6410) )
))
(declare-datatypes ((array!30746 0))(
  ( (array!30747 (arr!14785 (Array (_ BitVec 32) ValueCell!6410)) (size!15143 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30746)

(declare-fun e!281087 () Bool)

(declare-fun array_inv!10748 (array!30746) Bool)

(assert (=> start!43096 (and (array_inv!10748 _values!1516) e!281087)))

(declare-datatypes ((array!30748 0))(
  ( (array!30749 (arr!14786 (Array (_ BitVec 32) (_ BitVec 64))) (size!15144 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30748)

(declare-fun array_inv!10749 (array!30748) Bool)

(assert (=> start!43096 (array_inv!10749 _keys!1874)))

(declare-fun mapNonEmpty!21994 () Bool)

(declare-fun mapRes!21994 () Bool)

(declare-fun tp!42469 () Bool)

(declare-fun e!281089 () Bool)

(assert (=> mapNonEmpty!21994 (= mapRes!21994 (and tp!42469 e!281089))))

(declare-fun mapRest!21994 () (Array (_ BitVec 32) ValueCell!6410))

(declare-fun mapKey!21994 () (_ BitVec 32))

(declare-fun mapValue!21994 () ValueCell!6410)

(assert (=> mapNonEmpty!21994 (= (arr!14785 _values!1516) (store mapRest!21994 mapKey!21994 mapValue!21994))))

(declare-fun b!478181 () Bool)

(declare-fun tp_is_empty!13543 () Bool)

(assert (=> b!478181 (= e!281089 tp_is_empty!13543)))

(declare-fun mapIsEmpty!21994 () Bool)

(assert (=> mapIsEmpty!21994 mapRes!21994))

(declare-fun b!478182 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478182 (= e!281086 (and (= (size!15143 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15144 _keys!1874) (size!15143 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011) (= (size!15144 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352)) (bvsgt #b00000000000000000000000000000000 (size!15144 _keys!1874))))))

(declare-fun b!478183 () Bool)

(declare-fun e!281085 () Bool)

(assert (=> b!478183 (= e!281085 tp_is_empty!13543)))

(declare-fun b!478184 () Bool)

(assert (=> b!478184 (= e!281087 (and e!281085 mapRes!21994))))

(declare-fun condMapEmpty!21994 () Bool)

(declare-fun mapDefault!21994 () ValueCell!6410)

(assert (=> b!478184 (= condMapEmpty!21994 (= (arr!14785 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6410)) mapDefault!21994)))))

(assert (= (and start!43096 res!285360) b!478182))

(assert (= (and b!478184 condMapEmpty!21994) mapIsEmpty!21994))

(assert (= (and b!478184 (not condMapEmpty!21994)) mapNonEmpty!21994))

(get-info :version)

(assert (= (and mapNonEmpty!21994 ((_ is ValueCellFull!6410) mapValue!21994)) b!478181))

(assert (= (and b!478184 ((_ is ValueCellFull!6410) mapDefault!21994)) b!478183))

(assert (= start!43096 b!478184))

(declare-fun m!460779 () Bool)

(assert (=> start!43096 m!460779))

(declare-fun m!460781 () Bool)

(assert (=> start!43096 m!460781))

(declare-fun m!460783 () Bool)

(assert (=> start!43096 m!460783))

(declare-fun m!460785 () Bool)

(assert (=> mapNonEmpty!21994 m!460785))

(check-sat (not start!43096) (not mapNonEmpty!21994) tp_is_empty!13543)
(check-sat)
(get-model)

(declare-fun d!76609 () Bool)

(assert (=> d!76609 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43096 d!76609))

(declare-fun d!76611 () Bool)

(assert (=> d!76611 (= (array_inv!10748 _values!1516) (bvsge (size!15143 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43096 d!76611))

(declare-fun d!76613 () Bool)

(assert (=> d!76613 (= (array_inv!10749 _keys!1874) (bvsge (size!15144 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43096 d!76613))

(declare-fun mapIsEmpty!22003 () Bool)

(declare-fun mapRes!22003 () Bool)

(assert (=> mapIsEmpty!22003 mapRes!22003))

(declare-fun condMapEmpty!22003 () Bool)

(declare-fun mapDefault!22003 () ValueCell!6410)

(assert (=> mapNonEmpty!21994 (= condMapEmpty!22003 (= mapRest!21994 ((as const (Array (_ BitVec 32) ValueCell!6410)) mapDefault!22003)))))

(declare-fun e!281124 () Bool)

(assert (=> mapNonEmpty!21994 (= tp!42469 (and e!281124 mapRes!22003))))

(declare-fun b!478216 () Bool)

(assert (=> b!478216 (= e!281124 tp_is_empty!13543)))

(declare-fun mapNonEmpty!22003 () Bool)

(declare-fun tp!42478 () Bool)

(declare-fun e!281125 () Bool)

(assert (=> mapNonEmpty!22003 (= mapRes!22003 (and tp!42478 e!281125))))

(declare-fun mapValue!22003 () ValueCell!6410)

(declare-fun mapRest!22003 () (Array (_ BitVec 32) ValueCell!6410))

(declare-fun mapKey!22003 () (_ BitVec 32))

(assert (=> mapNonEmpty!22003 (= mapRest!21994 (store mapRest!22003 mapKey!22003 mapValue!22003))))

(declare-fun b!478215 () Bool)

(assert (=> b!478215 (= e!281125 tp_is_empty!13543)))

(assert (= (and mapNonEmpty!21994 condMapEmpty!22003) mapIsEmpty!22003))

(assert (= (and mapNonEmpty!21994 (not condMapEmpty!22003)) mapNonEmpty!22003))

(assert (= (and mapNonEmpty!22003 ((_ is ValueCellFull!6410) mapValue!22003)) b!478215))

(assert (= (and mapNonEmpty!21994 ((_ is ValueCellFull!6410) mapDefault!22003)) b!478216))

(declare-fun m!460803 () Bool)

(assert (=> mapNonEmpty!22003 m!460803))

(check-sat (not mapNonEmpty!22003) tp_is_empty!13543)
(check-sat)
