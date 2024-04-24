; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72376 () Bool)

(assert start!72376)

(declare-fun b!837839 () Bool)

(declare-fun e!467587 () Bool)

(declare-fun tp_is_empty!15289 () Bool)

(assert (=> b!837839 (= e!467587 tp_is_empty!15289)))

(declare-fun res!569608 () Bool)

(declare-fun e!467589 () Bool)

(assert (=> start!72376 (=> (not res!569608) (not e!467589))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46881 0))(
  ( (array!46882 (arr!22470 (Array (_ BitVec 32) (_ BitVec 64))) (size!22911 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46881)

(assert (=> start!72376 (= res!569608 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22911 _keys!868))))))

(assert (=> start!72376 e!467589))

(assert (=> start!72376 true))

(declare-fun array_inv!17956 (array!46881) Bool)

(assert (=> start!72376 (array_inv!17956 _keys!868)))

(declare-datatypes ((V!25433 0))(
  ( (V!25434 (val!7692 Int)) )
))
(declare-datatypes ((ValueCell!7205 0))(
  ( (ValueCellFull!7205 (v!10116 V!25433)) (EmptyCell!7205) )
))
(declare-datatypes ((array!46883 0))(
  ( (array!46884 (arr!22471 (Array (_ BitVec 32) ValueCell!7205)) (size!22912 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46883)

(declare-fun e!467591 () Bool)

(declare-fun array_inv!17957 (array!46883) Bool)

(assert (=> start!72376 (and (array_inv!17957 _values!688) e!467591)))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun b!837840 () Bool)

(assert (=> b!837840 (= e!467589 (and (= (size!22912 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22911 _keys!868) (size!22912 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011) (not (= (size!22911 _keys!868) (bvadd #b00000000000000000000000000000001 mask!1196)))))))

(declare-fun b!837841 () Bool)

(declare-fun mapRes!24524 () Bool)

(assert (=> b!837841 (= e!467591 (and e!467587 mapRes!24524))))

(declare-fun condMapEmpty!24524 () Bool)

(declare-fun mapDefault!24524 () ValueCell!7205)

(assert (=> b!837841 (= condMapEmpty!24524 (= (arr!22471 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7205)) mapDefault!24524)))))

(declare-fun b!837842 () Bool)

(declare-fun res!569609 () Bool)

(assert (=> b!837842 (=> (not res!569609) (not e!467589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837842 (= res!569609 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24524 () Bool)

(declare-fun tp!47519 () Bool)

(declare-fun e!467588 () Bool)

(assert (=> mapNonEmpty!24524 (= mapRes!24524 (and tp!47519 e!467588))))

(declare-fun mapRest!24524 () (Array (_ BitVec 32) ValueCell!7205))

(declare-fun mapValue!24524 () ValueCell!7205)

(declare-fun mapKey!24524 () (_ BitVec 32))

(assert (=> mapNonEmpty!24524 (= (arr!22471 _values!688) (store mapRest!24524 mapKey!24524 mapValue!24524))))

(declare-fun mapIsEmpty!24524 () Bool)

(assert (=> mapIsEmpty!24524 mapRes!24524))

(declare-fun b!837843 () Bool)

(assert (=> b!837843 (= e!467588 tp_is_empty!15289)))

(assert (= (and start!72376 res!569608) b!837842))

(assert (= (and b!837842 res!569609) b!837840))

(assert (= (and b!837841 condMapEmpty!24524) mapIsEmpty!24524))

(assert (= (and b!837841 (not condMapEmpty!24524)) mapNonEmpty!24524))

(get-info :version)

(assert (= (and mapNonEmpty!24524 ((_ is ValueCellFull!7205) mapValue!24524)) b!837843))

(assert (= (and b!837841 ((_ is ValueCellFull!7205) mapDefault!24524)) b!837839))

(assert (= start!72376 b!837841))

(declare-fun m!783305 () Bool)

(assert (=> start!72376 m!783305))

(declare-fun m!783307 () Bool)

(assert (=> start!72376 m!783307))

(declare-fun m!783309 () Bool)

(assert (=> b!837842 m!783309))

(declare-fun m!783311 () Bool)

(assert (=> mapNonEmpty!24524 m!783311))

(check-sat (not b!837842) (not start!72376) (not mapNonEmpty!24524) tp_is_empty!15289)
(check-sat)
