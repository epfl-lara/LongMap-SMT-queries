; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69770 () Bool)

(assert start!69770)

(declare-datatypes ((array!44193 0))(
  ( (array!44194 (arr!21164 (Array (_ BitVec 32) (_ BitVec 64))) (size!21585 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44193)

(declare-fun b!811694 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23651 0))(
  ( (V!23652 (val!7041 Int)) )
))
(declare-datatypes ((ValueCell!6578 0))(
  ( (ValueCellFull!6578 (v!9461 V!23651)) (EmptyCell!6578) )
))
(declare-datatypes ((array!44195 0))(
  ( (array!44196 (arr!21165 (Array (_ BitVec 32) ValueCell!6578)) (size!21586 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44195)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun e!449439 () Bool)

(assert (=> b!811694 (= e!449439 (and (= (size!21586 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21585 _keys!976) (size!21586 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (size!21585 _keys!976) (bvadd #b00000000000000000000000000000001 mask!1312)) (bvsgt #b00000000000000000000000000000000 (size!21585 _keys!976))))))

(declare-fun b!811695 () Bool)

(declare-fun e!449440 () Bool)

(declare-fun tp_is_empty!13987 () Bool)

(assert (=> b!811695 (= e!449440 tp_is_empty!13987)))

(declare-fun mapIsEmpty!22540 () Bool)

(declare-fun mapRes!22540 () Bool)

(assert (=> mapIsEmpty!22540 mapRes!22540))

(declare-fun b!811696 () Bool)

(declare-fun e!449441 () Bool)

(assert (=> b!811696 (= e!449441 tp_is_empty!13987)))

(declare-fun b!811697 () Bool)

(declare-fun e!449443 () Bool)

(assert (=> b!811697 (= e!449443 (and e!449441 mapRes!22540))))

(declare-fun condMapEmpty!22540 () Bool)

(declare-fun mapDefault!22540 () ValueCell!6578)

(assert (=> b!811697 (= condMapEmpty!22540 (= (arr!21165 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6578)) mapDefault!22540)))))

(declare-fun res!554820 () Bool)

(assert (=> start!69770 (=> (not res!554820) (not e!449439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69770 (= res!554820 (validMask!0 mask!1312))))

(assert (=> start!69770 e!449439))

(declare-fun array_inv!17045 (array!44193) Bool)

(assert (=> start!69770 (array_inv!17045 _keys!976)))

(assert (=> start!69770 true))

(declare-fun array_inv!17046 (array!44195) Bool)

(assert (=> start!69770 (and (array_inv!17046 _values!788) e!449443)))

(declare-fun mapNonEmpty!22540 () Bool)

(declare-fun tp!43648 () Bool)

(assert (=> mapNonEmpty!22540 (= mapRes!22540 (and tp!43648 e!449440))))

(declare-fun mapRest!22540 () (Array (_ BitVec 32) ValueCell!6578))

(declare-fun mapKey!22540 () (_ BitVec 32))

(declare-fun mapValue!22540 () ValueCell!6578)

(assert (=> mapNonEmpty!22540 (= (arr!21165 _values!788) (store mapRest!22540 mapKey!22540 mapValue!22540))))

(assert (= (and start!69770 res!554820) b!811694))

(assert (= (and b!811697 condMapEmpty!22540) mapIsEmpty!22540))

(assert (= (and b!811697 (not condMapEmpty!22540)) mapNonEmpty!22540))

(get-info :version)

(assert (= (and mapNonEmpty!22540 ((_ is ValueCellFull!6578) mapValue!22540)) b!811695))

(assert (= (and b!811697 ((_ is ValueCellFull!6578) mapDefault!22540)) b!811696))

(assert (= start!69770 b!811697))

(declare-fun m!753765 () Bool)

(assert (=> start!69770 m!753765))

(declare-fun m!753767 () Bool)

(assert (=> start!69770 m!753767))

(declare-fun m!753769 () Bool)

(assert (=> start!69770 m!753769))

(declare-fun m!753771 () Bool)

(assert (=> mapNonEmpty!22540 m!753771))

(check-sat (not start!69770) (not mapNonEmpty!22540) tp_is_empty!13987)
(check-sat)
(get-model)

(declare-fun d!104087 () Bool)

(assert (=> d!104087 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69770 d!104087))

(declare-fun d!104089 () Bool)

(assert (=> d!104089 (= (array_inv!17045 _keys!976) (bvsge (size!21585 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69770 d!104089))

(declare-fun d!104091 () Bool)

(assert (=> d!104091 (= (array_inv!17046 _values!788) (bvsge (size!21586 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69770 d!104091))

(declare-fun condMapEmpty!22549 () Bool)

(declare-fun mapDefault!22549 () ValueCell!6578)

(assert (=> mapNonEmpty!22540 (= condMapEmpty!22549 (= mapRest!22540 ((as const (Array (_ BitVec 32) ValueCell!6578)) mapDefault!22549)))))

(declare-fun e!449478 () Bool)

(declare-fun mapRes!22549 () Bool)

(assert (=> mapNonEmpty!22540 (= tp!43648 (and e!449478 mapRes!22549))))

(declare-fun b!811729 () Bool)

(assert (=> b!811729 (= e!449478 tp_is_empty!13987)))

(declare-fun mapIsEmpty!22549 () Bool)

(assert (=> mapIsEmpty!22549 mapRes!22549))

(declare-fun b!811728 () Bool)

(declare-fun e!449479 () Bool)

(assert (=> b!811728 (= e!449479 tp_is_empty!13987)))

(declare-fun mapNonEmpty!22549 () Bool)

(declare-fun tp!43657 () Bool)

(assert (=> mapNonEmpty!22549 (= mapRes!22549 (and tp!43657 e!449479))))

(declare-fun mapKey!22549 () (_ BitVec 32))

(declare-fun mapValue!22549 () ValueCell!6578)

(declare-fun mapRest!22549 () (Array (_ BitVec 32) ValueCell!6578))

(assert (=> mapNonEmpty!22549 (= mapRest!22540 (store mapRest!22549 mapKey!22549 mapValue!22549))))

(assert (= (and mapNonEmpty!22540 condMapEmpty!22549) mapIsEmpty!22549))

(assert (= (and mapNonEmpty!22540 (not condMapEmpty!22549)) mapNonEmpty!22549))

(assert (= (and mapNonEmpty!22549 ((_ is ValueCellFull!6578) mapValue!22549)) b!811728))

(assert (= (and mapNonEmpty!22540 ((_ is ValueCellFull!6578) mapDefault!22549)) b!811729))

(declare-fun m!753789 () Bool)

(assert (=> mapNonEmpty!22549 m!753789))

(check-sat (not mapNonEmpty!22549) tp_is_empty!13987)
(check-sat)
