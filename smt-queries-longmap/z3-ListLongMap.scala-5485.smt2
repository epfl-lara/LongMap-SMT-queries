; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72862 () Bool)

(assert start!72862)

(declare-fun b!844655 () Bool)

(declare-fun res!573683 () Bool)

(declare-fun e!471408 () Bool)

(assert (=> b!844655 (=> (not res!573683) (not e!471408))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844655 (= res!573683 (validMask!0 mask!1196))))

(declare-fun b!844656 () Bool)

(assert (=> b!844656 (= e!471408 false)))

(declare-fun lt!381545 () Bool)

(declare-datatypes ((array!47769 0))(
  ( (array!47770 (arr!22911 (Array (_ BitVec 32) (_ BitVec 64))) (size!23352 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47769)

(declare-datatypes ((List!16177 0))(
  ( (Nil!16174) (Cons!16173 (h!17310 (_ BitVec 64)) (t!22540 List!16177)) )
))
(declare-fun arrayNoDuplicates!0 (array!47769 (_ BitVec 32) List!16177) Bool)

(assert (=> b!844656 (= lt!381545 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16174))))

(declare-fun b!844657 () Bool)

(declare-fun res!573685 () Bool)

(assert (=> b!844657 (=> (not res!573685) (not e!471408))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26041 0))(
  ( (V!26042 (val!7920 Int)) )
))
(declare-datatypes ((ValueCell!7433 0))(
  ( (ValueCellFull!7433 (v!10345 V!26041)) (EmptyCell!7433) )
))
(declare-datatypes ((array!47771 0))(
  ( (array!47772 (arr!22912 (Array (_ BitVec 32) ValueCell!7433)) (size!23353 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47771)

(assert (=> b!844657 (= res!573685 (and (= (size!23353 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23352 _keys!868) (size!23353 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844658 () Bool)

(declare-fun e!471405 () Bool)

(declare-fun e!471406 () Bool)

(declare-fun mapRes!25217 () Bool)

(assert (=> b!844658 (= e!471405 (and e!471406 mapRes!25217))))

(declare-fun condMapEmpty!25217 () Bool)

(declare-fun mapDefault!25217 () ValueCell!7433)

(assert (=> b!844658 (= condMapEmpty!25217 (= (arr!22912 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7433)) mapDefault!25217)))))

(declare-fun b!844659 () Bool)

(declare-fun res!573684 () Bool)

(assert (=> b!844659 (=> (not res!573684) (not e!471408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47769 (_ BitVec 32)) Bool)

(assert (=> b!844659 (= res!573684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25217 () Bool)

(declare-fun tp!48536 () Bool)

(declare-fun e!471409 () Bool)

(assert (=> mapNonEmpty!25217 (= mapRes!25217 (and tp!48536 e!471409))))

(declare-fun mapRest!25217 () (Array (_ BitVec 32) ValueCell!7433))

(declare-fun mapKey!25217 () (_ BitVec 32))

(declare-fun mapValue!25217 () ValueCell!7433)

(assert (=> mapNonEmpty!25217 (= (arr!22912 _values!688) (store mapRest!25217 mapKey!25217 mapValue!25217))))

(declare-fun mapIsEmpty!25217 () Bool)

(assert (=> mapIsEmpty!25217 mapRes!25217))

(declare-fun res!573682 () Bool)

(assert (=> start!72862 (=> (not res!573682) (not e!471408))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72862 (= res!573682 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23352 _keys!868))))))

(assert (=> start!72862 e!471408))

(assert (=> start!72862 true))

(declare-fun array_inv!18272 (array!47769) Bool)

(assert (=> start!72862 (array_inv!18272 _keys!868)))

(declare-fun array_inv!18273 (array!47771) Bool)

(assert (=> start!72862 (and (array_inv!18273 _values!688) e!471405)))

(declare-fun b!844660 () Bool)

(declare-fun tp_is_empty!15745 () Bool)

(assert (=> b!844660 (= e!471409 tp_is_empty!15745)))

(declare-fun b!844661 () Bool)

(assert (=> b!844661 (= e!471406 tp_is_empty!15745)))

(assert (= (and start!72862 res!573682) b!844655))

(assert (= (and b!844655 res!573683) b!844657))

(assert (= (and b!844657 res!573685) b!844659))

(assert (= (and b!844659 res!573684) b!844656))

(assert (= (and b!844658 condMapEmpty!25217) mapIsEmpty!25217))

(assert (= (and b!844658 (not condMapEmpty!25217)) mapNonEmpty!25217))

(get-info :version)

(assert (= (and mapNonEmpty!25217 ((_ is ValueCellFull!7433) mapValue!25217)) b!844660))

(assert (= (and b!844658 ((_ is ValueCellFull!7433) mapDefault!25217)) b!844661))

(assert (= start!72862 b!844658))

(declare-fun m!787589 () Bool)

(assert (=> start!72862 m!787589))

(declare-fun m!787591 () Bool)

(assert (=> start!72862 m!787591))

(declare-fun m!787593 () Bool)

(assert (=> b!844655 m!787593))

(declare-fun m!787595 () Bool)

(assert (=> b!844656 m!787595))

(declare-fun m!787597 () Bool)

(assert (=> b!844659 m!787597))

(declare-fun m!787599 () Bool)

(assert (=> mapNonEmpty!25217 m!787599))

(check-sat (not b!844655) (not b!844656) tp_is_empty!15745 (not start!72862) (not b!844659) (not mapNonEmpty!25217))
(check-sat)
