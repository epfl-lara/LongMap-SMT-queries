; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72478 () Bool)

(assert start!72478)

(declare-fun b!838679 () Bool)

(declare-fun res!570084 () Bool)

(declare-fun e!468202 () Bool)

(assert (=> b!838679 (=> (not res!570084) (not e!468202))))

(declare-datatypes ((array!47021 0))(
  ( (array!47022 (arr!22537 (Array (_ BitVec 32) (_ BitVec 64))) (size!22978 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47021)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47021 (_ BitVec 32)) Bool)

(assert (=> b!838679 (= res!570084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838680 () Bool)

(declare-fun e!468201 () Bool)

(declare-fun e!468203 () Bool)

(declare-fun mapRes!24641 () Bool)

(assert (=> b!838680 (= e!468201 (and e!468203 mapRes!24641))))

(declare-fun condMapEmpty!24641 () Bool)

(declare-datatypes ((V!25529 0))(
  ( (V!25530 (val!7728 Int)) )
))
(declare-datatypes ((ValueCell!7241 0))(
  ( (ValueCellFull!7241 (v!10153 V!25529)) (EmptyCell!7241) )
))
(declare-datatypes ((array!47023 0))(
  ( (array!47024 (arr!22538 (Array (_ BitVec 32) ValueCell!7241)) (size!22979 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47023)

(declare-fun mapDefault!24641 () ValueCell!7241)

(assert (=> b!838680 (= condMapEmpty!24641 (= (arr!22538 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7241)) mapDefault!24641)))))

(declare-fun b!838681 () Bool)

(declare-fun res!570083 () Bool)

(assert (=> b!838681 (=> (not res!570083) (not e!468202))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838681 (= res!570083 (and (= (size!22979 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22978 _keys!868) (size!22979 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!570082 () Bool)

(assert (=> start!72478 (=> (not res!570082) (not e!468202))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72478 (= res!570082 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22978 _keys!868))))))

(assert (=> start!72478 e!468202))

(assert (=> start!72478 true))

(declare-fun array_inv!18004 (array!47021) Bool)

(assert (=> start!72478 (array_inv!18004 _keys!868)))

(declare-fun array_inv!18005 (array!47023) Bool)

(assert (=> start!72478 (and (array_inv!18005 _values!688) e!468201)))

(declare-fun b!838682 () Bool)

(declare-fun tp_is_empty!15361 () Bool)

(assert (=> b!838682 (= e!468203 tp_is_empty!15361)))

(declare-fun mapNonEmpty!24641 () Bool)

(declare-fun tp!47636 () Bool)

(declare-fun e!468205 () Bool)

(assert (=> mapNonEmpty!24641 (= mapRes!24641 (and tp!47636 e!468205))))

(declare-fun mapKey!24641 () (_ BitVec 32))

(declare-fun mapRest!24641 () (Array (_ BitVec 32) ValueCell!7241))

(declare-fun mapValue!24641 () ValueCell!7241)

(assert (=> mapNonEmpty!24641 (= (arr!22538 _values!688) (store mapRest!24641 mapKey!24641 mapValue!24641))))

(declare-fun b!838683 () Bool)

(assert (=> b!838683 (= e!468205 tp_is_empty!15361)))

(declare-fun b!838684 () Bool)

(assert (=> b!838684 (= e!468202 false)))

(declare-fun lt!380969 () Bool)

(declare-datatypes ((List!15942 0))(
  ( (Nil!15939) (Cons!15938 (h!17075 (_ BitVec 64)) (t!22305 List!15942)) )
))
(declare-fun arrayNoDuplicates!0 (array!47021 (_ BitVec 32) List!15942) Bool)

(assert (=> b!838684 (= lt!380969 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15939))))

(declare-fun b!838685 () Bool)

(declare-fun res!570085 () Bool)

(assert (=> b!838685 (=> (not res!570085) (not e!468202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838685 (= res!570085 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24641 () Bool)

(assert (=> mapIsEmpty!24641 mapRes!24641))

(assert (= (and start!72478 res!570082) b!838685))

(assert (= (and b!838685 res!570085) b!838681))

(assert (= (and b!838681 res!570083) b!838679))

(assert (= (and b!838679 res!570084) b!838684))

(assert (= (and b!838680 condMapEmpty!24641) mapIsEmpty!24641))

(assert (= (and b!838680 (not condMapEmpty!24641)) mapNonEmpty!24641))

(get-info :version)

(assert (= (and mapNonEmpty!24641 ((_ is ValueCellFull!7241) mapValue!24641)) b!838683))

(assert (= (and b!838680 ((_ is ValueCellFull!7241) mapDefault!24641)) b!838682))

(assert (= start!72478 b!838680))

(declare-fun m!783773 () Bool)

(assert (=> start!72478 m!783773))

(declare-fun m!783775 () Bool)

(assert (=> start!72478 m!783775))

(declare-fun m!783777 () Bool)

(assert (=> b!838684 m!783777))

(declare-fun m!783779 () Bool)

(assert (=> b!838685 m!783779))

(declare-fun m!783781 () Bool)

(assert (=> mapNonEmpty!24641 m!783781))

(declare-fun m!783783 () Bool)

(assert (=> b!838679 m!783783))

(check-sat (not b!838685) (not b!838679) tp_is_empty!15361 (not start!72478) (not b!838684) (not mapNonEmpty!24641))
(check-sat)
