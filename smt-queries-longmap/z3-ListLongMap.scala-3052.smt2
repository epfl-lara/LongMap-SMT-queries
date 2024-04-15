; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43096 () Bool)

(assert start!43096)

(declare-fun b!477971 () Bool)

(declare-fun e!280952 () Bool)

(declare-fun tp_is_empty!13543 () Bool)

(assert (=> b!477971 (= e!280952 tp_is_empty!13543)))

(declare-fun b!477972 () Bool)

(declare-fun e!280951 () Bool)

(declare-fun e!280950 () Bool)

(declare-fun mapRes!21994 () Bool)

(assert (=> b!477972 (= e!280951 (and e!280950 mapRes!21994))))

(declare-fun condMapEmpty!21994 () Bool)

(declare-datatypes ((V!19129 0))(
  ( (V!19130 (val!6819 Int)) )
))
(declare-datatypes ((ValueCell!6410 0))(
  ( (ValueCellFull!6410 (v!9101 V!19129)) (EmptyCell!6410) )
))
(declare-datatypes ((array!30749 0))(
  ( (array!30750 (arr!14787 (Array (_ BitVec 32) ValueCell!6410)) (size!15146 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30749)

(declare-fun mapDefault!21994 () ValueCell!6410)

(assert (=> b!477972 (= condMapEmpty!21994 (= (arr!14787 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6410)) mapDefault!21994)))))

(declare-fun res!285238 () Bool)

(declare-fun e!280953 () Bool)

(assert (=> start!43096 (=> (not res!285238) (not e!280953))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43096 (= res!285238 (validMask!0 mask!2352))))

(assert (=> start!43096 e!280953))

(assert (=> start!43096 true))

(declare-fun array_inv!10754 (array!30749) Bool)

(assert (=> start!43096 (and (array_inv!10754 _values!1516) e!280951)))

(declare-datatypes ((array!30751 0))(
  ( (array!30752 (arr!14788 (Array (_ BitVec 32) (_ BitVec 64))) (size!15147 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30751)

(declare-fun array_inv!10755 (array!30751) Bool)

(assert (=> start!43096 (array_inv!10755 _keys!1874)))

(declare-fun mapNonEmpty!21994 () Bool)

(declare-fun tp!42469 () Bool)

(assert (=> mapNonEmpty!21994 (= mapRes!21994 (and tp!42469 e!280952))))

(declare-fun mapValue!21994 () ValueCell!6410)

(declare-fun mapKey!21994 () (_ BitVec 32))

(declare-fun mapRest!21994 () (Array (_ BitVec 32) ValueCell!6410))

(assert (=> mapNonEmpty!21994 (= (arr!14787 _values!1516) (store mapRest!21994 mapKey!21994 mapValue!21994))))

(declare-fun b!477973 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!477973 (= e!280953 (and (= (size!15146 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15147 _keys!1874) (size!15146 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011) (= (size!15147 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352)) (bvsgt #b00000000000000000000000000000000 (size!15147 _keys!1874))))))

(declare-fun b!477974 () Bool)

(assert (=> b!477974 (= e!280950 tp_is_empty!13543)))

(declare-fun mapIsEmpty!21994 () Bool)

(assert (=> mapIsEmpty!21994 mapRes!21994))

(assert (= (and start!43096 res!285238) b!477973))

(assert (= (and b!477972 condMapEmpty!21994) mapIsEmpty!21994))

(assert (= (and b!477972 (not condMapEmpty!21994)) mapNonEmpty!21994))

(get-info :version)

(assert (= (and mapNonEmpty!21994 ((_ is ValueCellFull!6410) mapValue!21994)) b!477971))

(assert (= (and b!477972 ((_ is ValueCellFull!6410) mapDefault!21994)) b!477974))

(assert (= start!43096 b!477972))

(declare-fun m!459863 () Bool)

(assert (=> start!43096 m!459863))

(declare-fun m!459865 () Bool)

(assert (=> start!43096 m!459865))

(declare-fun m!459867 () Bool)

(assert (=> start!43096 m!459867))

(declare-fun m!459869 () Bool)

(assert (=> mapNonEmpty!21994 m!459869))

(check-sat (not start!43096) (not mapNonEmpty!21994) tp_is_empty!13543)
(check-sat)
(get-model)

(declare-fun d!76377 () Bool)

(assert (=> d!76377 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43096 d!76377))

(declare-fun d!76379 () Bool)

(assert (=> d!76379 (= (array_inv!10754 _values!1516) (bvsge (size!15146 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43096 d!76379))

(declare-fun d!76381 () Bool)

(assert (=> d!76381 (= (array_inv!10755 _keys!1874) (bvsge (size!15147 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43096 d!76381))

(declare-fun mapIsEmpty!22003 () Bool)

(declare-fun mapRes!22003 () Bool)

(assert (=> mapIsEmpty!22003 mapRes!22003))

(declare-fun condMapEmpty!22003 () Bool)

(declare-fun mapDefault!22003 () ValueCell!6410)

(assert (=> mapNonEmpty!21994 (= condMapEmpty!22003 (= mapRest!21994 ((as const (Array (_ BitVec 32) ValueCell!6410)) mapDefault!22003)))))

(declare-fun e!280989 () Bool)

(assert (=> mapNonEmpty!21994 (= tp!42469 (and e!280989 mapRes!22003))))

(declare-fun b!478006 () Bool)

(assert (=> b!478006 (= e!280989 tp_is_empty!13543)))

(declare-fun mapNonEmpty!22003 () Bool)

(declare-fun tp!42478 () Bool)

(declare-fun e!280990 () Bool)

(assert (=> mapNonEmpty!22003 (= mapRes!22003 (and tp!42478 e!280990))))

(declare-fun mapValue!22003 () ValueCell!6410)

(declare-fun mapKey!22003 () (_ BitVec 32))

(declare-fun mapRest!22003 () (Array (_ BitVec 32) ValueCell!6410))

(assert (=> mapNonEmpty!22003 (= mapRest!21994 (store mapRest!22003 mapKey!22003 mapValue!22003))))

(declare-fun b!478005 () Bool)

(assert (=> b!478005 (= e!280990 tp_is_empty!13543)))

(assert (= (and mapNonEmpty!21994 condMapEmpty!22003) mapIsEmpty!22003))

(assert (= (and mapNonEmpty!21994 (not condMapEmpty!22003)) mapNonEmpty!22003))

(assert (= (and mapNonEmpty!22003 ((_ is ValueCellFull!6410) mapValue!22003)) b!478005))

(assert (= (and mapNonEmpty!21994 ((_ is ValueCellFull!6410) mapDefault!22003)) b!478006))

(declare-fun m!459887 () Bool)

(assert (=> mapNonEmpty!22003 m!459887))

(check-sat (not mapNonEmpty!22003) tp_is_empty!13543)
(check-sat)
