; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69956 () Bool)

(assert start!69956)

(declare-fun res!555272 () Bool)

(declare-fun e!450167 () Bool)

(assert (=> start!69956 (=> (not res!555272) (not e!450167))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69956 (= res!555272 (validMask!0 mask!1312))))

(assert (=> start!69956 e!450167))

(declare-datatypes ((array!44193 0))(
  ( (array!44194 (arr!21159 (Array (_ BitVec 32) (_ BitVec 64))) (size!21579 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44193)

(declare-fun array_inv!17015 (array!44193) Bool)

(assert (=> start!69956 (array_inv!17015 _keys!976)))

(assert (=> start!69956 true))

(declare-datatypes ((V!23651 0))(
  ( (V!23652 (val!7041 Int)) )
))
(declare-datatypes ((ValueCell!6578 0))(
  ( (ValueCellFull!6578 (v!9467 V!23651)) (EmptyCell!6578) )
))
(declare-datatypes ((array!44195 0))(
  ( (array!44196 (arr!21160 (Array (_ BitVec 32) ValueCell!6578)) (size!21580 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44195)

(declare-fun e!450171 () Bool)

(declare-fun array_inv!17016 (array!44195) Bool)

(assert (=> start!69956 (and (array_inv!17016 _values!788) e!450171)))

(declare-fun mapIsEmpty!22540 () Bool)

(declare-fun mapRes!22540 () Bool)

(assert (=> mapIsEmpty!22540 mapRes!22540))

(declare-fun b!812834 () Bool)

(declare-fun e!450169 () Bool)

(declare-fun tp_is_empty!13987 () Bool)

(assert (=> b!812834 (= e!450169 tp_is_empty!13987)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun b!812835 () Bool)

(assert (=> b!812835 (= e!450167 (and (= (size!21580 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21579 _keys!976) (size!21580 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (size!21579 _keys!976) (bvadd #b00000000000000000000000000000001 mask!1312)) (bvsgt #b00000000000000000000000000000000 (size!21579 _keys!976))))))

(declare-fun b!812836 () Bool)

(declare-fun e!450168 () Bool)

(assert (=> b!812836 (= e!450168 tp_is_empty!13987)))

(declare-fun mapNonEmpty!22540 () Bool)

(declare-fun tp!43648 () Bool)

(assert (=> mapNonEmpty!22540 (= mapRes!22540 (and tp!43648 e!450168))))

(declare-fun mapValue!22540 () ValueCell!6578)

(declare-fun mapKey!22540 () (_ BitVec 32))

(declare-fun mapRest!22540 () (Array (_ BitVec 32) ValueCell!6578))

(assert (=> mapNonEmpty!22540 (= (arr!21160 _values!788) (store mapRest!22540 mapKey!22540 mapValue!22540))))

(declare-fun b!812837 () Bool)

(assert (=> b!812837 (= e!450171 (and e!450169 mapRes!22540))))

(declare-fun condMapEmpty!22540 () Bool)

(declare-fun mapDefault!22540 () ValueCell!6578)

(assert (=> b!812837 (= condMapEmpty!22540 (= (arr!21160 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6578)) mapDefault!22540)))))

(assert (= (and start!69956 res!555272) b!812835))

(assert (= (and b!812837 condMapEmpty!22540) mapIsEmpty!22540))

(assert (= (and b!812837 (not condMapEmpty!22540)) mapNonEmpty!22540))

(get-info :version)

(assert (= (and mapNonEmpty!22540 ((_ is ValueCellFull!6578) mapValue!22540)) b!812836))

(assert (= (and b!812837 ((_ is ValueCellFull!6578) mapDefault!22540)) b!812834))

(assert (= start!69956 b!812837))

(declare-fun m!755799 () Bool)

(assert (=> start!69956 m!755799))

(declare-fun m!755801 () Bool)

(assert (=> start!69956 m!755801))

(declare-fun m!755803 () Bool)

(assert (=> start!69956 m!755803))

(declare-fun m!755805 () Bool)

(assert (=> mapNonEmpty!22540 m!755805))

(check-sat (not start!69956) (not mapNonEmpty!22540) tp_is_empty!13987)
(check-sat)
(get-model)

(declare-fun d!104603 () Bool)

(assert (=> d!104603 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69956 d!104603))

(declare-fun d!104605 () Bool)

(assert (=> d!104605 (= (array_inv!17015 _keys!976) (bvsge (size!21579 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69956 d!104605))

(declare-fun d!104607 () Bool)

(assert (=> d!104607 (= (array_inv!17016 _values!788) (bvsge (size!21580 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69956 d!104607))

(declare-fun b!812869 () Bool)

(declare-fun e!450206 () Bool)

(assert (=> b!812869 (= e!450206 tp_is_empty!13987)))

(declare-fun mapIsEmpty!22549 () Bool)

(declare-fun mapRes!22549 () Bool)

(assert (=> mapIsEmpty!22549 mapRes!22549))

(declare-fun mapNonEmpty!22549 () Bool)

(declare-fun tp!43657 () Bool)

(declare-fun e!450207 () Bool)

(assert (=> mapNonEmpty!22549 (= mapRes!22549 (and tp!43657 e!450207))))

(declare-fun mapRest!22549 () (Array (_ BitVec 32) ValueCell!6578))

(declare-fun mapKey!22549 () (_ BitVec 32))

(declare-fun mapValue!22549 () ValueCell!6578)

(assert (=> mapNonEmpty!22549 (= mapRest!22540 (store mapRest!22549 mapKey!22549 mapValue!22549))))

(declare-fun condMapEmpty!22549 () Bool)

(declare-fun mapDefault!22549 () ValueCell!6578)

(assert (=> mapNonEmpty!22540 (= condMapEmpty!22549 (= mapRest!22540 ((as const (Array (_ BitVec 32) ValueCell!6578)) mapDefault!22549)))))

(assert (=> mapNonEmpty!22540 (= tp!43648 (and e!450206 mapRes!22549))))

(declare-fun b!812868 () Bool)

(assert (=> b!812868 (= e!450207 tp_is_empty!13987)))

(assert (= (and mapNonEmpty!22540 condMapEmpty!22549) mapIsEmpty!22549))

(assert (= (and mapNonEmpty!22540 (not condMapEmpty!22549)) mapNonEmpty!22549))

(assert (= (and mapNonEmpty!22549 ((_ is ValueCellFull!6578) mapValue!22549)) b!812868))

(assert (= (and mapNonEmpty!22540 ((_ is ValueCellFull!6578) mapDefault!22549)) b!812869))

(declare-fun m!755823 () Bool)

(assert (=> mapNonEmpty!22549 m!755823))

(check-sat (not mapNonEmpty!22549) tp_is_empty!13987)
(check-sat)
