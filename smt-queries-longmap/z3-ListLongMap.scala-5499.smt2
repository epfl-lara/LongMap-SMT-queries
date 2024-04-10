; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72780 () Bool)

(assert start!72780)

(declare-fun b!844655 () Bool)

(declare-fun e!471468 () Bool)

(declare-fun e!471469 () Bool)

(declare-fun mapRes!25346 () Bool)

(assert (=> b!844655 (= e!471468 (and e!471469 mapRes!25346))))

(declare-fun condMapEmpty!25346 () Bool)

(declare-datatypes ((V!26155 0))(
  ( (V!26156 (val!7963 Int)) )
))
(declare-datatypes ((ValueCell!7476 0))(
  ( (ValueCellFull!7476 (v!10388 V!26155)) (EmptyCell!7476) )
))
(declare-datatypes ((array!47892 0))(
  ( (array!47893 (arr!22977 (Array (_ BitVec 32) ValueCell!7476)) (size!23417 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47892)

(declare-fun mapDefault!25346 () ValueCell!7476)

(assert (=> b!844655 (= condMapEmpty!25346 (= (arr!22977 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7476)) mapDefault!25346)))))

(declare-fun b!844656 () Bool)

(declare-fun res!573856 () Bool)

(declare-fun e!471471 () Bool)

(assert (=> b!844656 (=> (not res!573856) (not e!471471))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47894 0))(
  ( (array!47895 (arr!22978 (Array (_ BitVec 32) (_ BitVec 64))) (size!23418 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47894)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844656 (= res!573856 (and (= (size!23417 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23418 _keys!868) (size!23417 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844657 () Bool)

(declare-fun tp_is_empty!15831 () Bool)

(assert (=> b!844657 (= e!471469 tp_is_empty!15831)))

(declare-fun b!844658 () Bool)

(assert (=> b!844658 (= e!471471 false)))

(declare-fun lt!381313 () Bool)

(declare-datatypes ((List!16280 0))(
  ( (Nil!16277) (Cons!16276 (h!17407 (_ BitVec 64)) (t!22651 List!16280)) )
))
(declare-fun arrayNoDuplicates!0 (array!47894 (_ BitVec 32) List!16280) Bool)

(assert (=> b!844658 (= lt!381313 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16277))))

(declare-fun mapNonEmpty!25346 () Bool)

(declare-fun tp!48664 () Bool)

(declare-fun e!471470 () Bool)

(assert (=> mapNonEmpty!25346 (= mapRes!25346 (and tp!48664 e!471470))))

(declare-fun mapRest!25346 () (Array (_ BitVec 32) ValueCell!7476))

(declare-fun mapValue!25346 () ValueCell!7476)

(declare-fun mapKey!25346 () (_ BitVec 32))

(assert (=> mapNonEmpty!25346 (= (arr!22977 _values!688) (store mapRest!25346 mapKey!25346 mapValue!25346))))

(declare-fun b!844659 () Bool)

(assert (=> b!844659 (= e!471470 tp_is_empty!15831)))

(declare-fun mapIsEmpty!25346 () Bool)

(assert (=> mapIsEmpty!25346 mapRes!25346))

(declare-fun res!573855 () Bool)

(assert (=> start!72780 (=> (not res!573855) (not e!471471))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72780 (= res!573855 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23418 _keys!868))))))

(assert (=> start!72780 e!471471))

(assert (=> start!72780 true))

(declare-fun array_inv!18268 (array!47894) Bool)

(assert (=> start!72780 (array_inv!18268 _keys!868)))

(declare-fun array_inv!18269 (array!47892) Bool)

(assert (=> start!72780 (and (array_inv!18269 _values!688) e!471468)))

(declare-fun b!844660 () Bool)

(declare-fun res!573854 () Bool)

(assert (=> b!844660 (=> (not res!573854) (not e!471471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844660 (= res!573854 (validMask!0 mask!1196))))

(declare-fun b!844661 () Bool)

(declare-fun res!573857 () Bool)

(assert (=> b!844661 (=> (not res!573857) (not e!471471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47894 (_ BitVec 32)) Bool)

(assert (=> b!844661 (= res!573857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72780 res!573855) b!844660))

(assert (= (and b!844660 res!573854) b!844656))

(assert (= (and b!844656 res!573856) b!844661))

(assert (= (and b!844661 res!573857) b!844658))

(assert (= (and b!844655 condMapEmpty!25346) mapIsEmpty!25346))

(assert (= (and b!844655 (not condMapEmpty!25346)) mapNonEmpty!25346))

(get-info :version)

(assert (= (and mapNonEmpty!25346 ((_ is ValueCellFull!7476) mapValue!25346)) b!844659))

(assert (= (and b!844655 ((_ is ValueCellFull!7476) mapDefault!25346)) b!844657))

(assert (= start!72780 b!844655))

(declare-fun m!786813 () Bool)

(assert (=> mapNonEmpty!25346 m!786813))

(declare-fun m!786815 () Bool)

(assert (=> start!72780 m!786815))

(declare-fun m!786817 () Bool)

(assert (=> start!72780 m!786817))

(declare-fun m!786819 () Bool)

(assert (=> b!844660 m!786819))

(declare-fun m!786821 () Bool)

(assert (=> b!844658 m!786821))

(declare-fun m!786823 () Bool)

(assert (=> b!844661 m!786823))

(check-sat (not start!72780) (not b!844658) (not b!844661) (not mapNonEmpty!25346) (not b!844660) tp_is_empty!15831)
(check-sat)
