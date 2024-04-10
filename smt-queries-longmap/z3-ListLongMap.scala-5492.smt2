; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72738 () Bool)

(assert start!72738)

(declare-fun b!844214 () Bool)

(declare-fun e!471153 () Bool)

(declare-fun tp_is_empty!15789 () Bool)

(assert (=> b!844214 (= e!471153 tp_is_empty!15789)))

(declare-fun b!844215 () Bool)

(declare-fun e!471154 () Bool)

(declare-fun mapRes!25283 () Bool)

(assert (=> b!844215 (= e!471154 (and e!471153 mapRes!25283))))

(declare-fun condMapEmpty!25283 () Bool)

(declare-datatypes ((V!26099 0))(
  ( (V!26100 (val!7942 Int)) )
))
(declare-datatypes ((ValueCell!7455 0))(
  ( (ValueCellFull!7455 (v!10367 V!26099)) (EmptyCell!7455) )
))
(declare-datatypes ((array!47816 0))(
  ( (array!47817 (arr!22939 (Array (_ BitVec 32) ValueCell!7455)) (size!23379 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47816)

(declare-fun mapDefault!25283 () ValueCell!7455)

(assert (=> b!844215 (= condMapEmpty!25283 (= (arr!22939 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7455)) mapDefault!25283)))))

(declare-fun b!844216 () Bool)

(declare-fun res!573604 () Bool)

(declare-fun e!471155 () Bool)

(assert (=> b!844216 (=> (not res!573604) (not e!471155))))

(declare-datatypes ((array!47818 0))(
  ( (array!47819 (arr!22940 (Array (_ BitVec 32) (_ BitVec 64))) (size!23380 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47818)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47818 (_ BitVec 32)) Bool)

(assert (=> b!844216 (= res!573604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844217 () Bool)

(declare-fun res!573602 () Bool)

(assert (=> b!844217 (=> (not res!573602) (not e!471155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844217 (= res!573602 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25283 () Bool)

(assert (=> mapIsEmpty!25283 mapRes!25283))

(declare-fun b!844218 () Bool)

(declare-fun res!573605 () Bool)

(assert (=> b!844218 (=> (not res!573605) (not e!471155))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844218 (= res!573605 (and (= (size!23379 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23380 _keys!868) (size!23379 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844219 () Bool)

(assert (=> b!844219 (= e!471155 false)))

(declare-fun lt!381250 () Bool)

(declare-datatypes ((List!16264 0))(
  ( (Nil!16261) (Cons!16260 (h!17391 (_ BitVec 64)) (t!22635 List!16264)) )
))
(declare-fun arrayNoDuplicates!0 (array!47818 (_ BitVec 32) List!16264) Bool)

(assert (=> b!844219 (= lt!381250 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16261))))

(declare-fun b!844220 () Bool)

(declare-fun e!471157 () Bool)

(assert (=> b!844220 (= e!471157 tp_is_empty!15789)))

(declare-fun mapNonEmpty!25283 () Bool)

(declare-fun tp!48601 () Bool)

(assert (=> mapNonEmpty!25283 (= mapRes!25283 (and tp!48601 e!471157))))

(declare-fun mapRest!25283 () (Array (_ BitVec 32) ValueCell!7455))

(declare-fun mapKey!25283 () (_ BitVec 32))

(declare-fun mapValue!25283 () ValueCell!7455)

(assert (=> mapNonEmpty!25283 (= (arr!22939 _values!688) (store mapRest!25283 mapKey!25283 mapValue!25283))))

(declare-fun res!573603 () Bool)

(assert (=> start!72738 (=> (not res!573603) (not e!471155))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72738 (= res!573603 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23380 _keys!868))))))

(assert (=> start!72738 e!471155))

(assert (=> start!72738 true))

(declare-fun array_inv!18244 (array!47818) Bool)

(assert (=> start!72738 (array_inv!18244 _keys!868)))

(declare-fun array_inv!18245 (array!47816) Bool)

(assert (=> start!72738 (and (array_inv!18245 _values!688) e!471154)))

(assert (= (and start!72738 res!573603) b!844217))

(assert (= (and b!844217 res!573602) b!844218))

(assert (= (and b!844218 res!573605) b!844216))

(assert (= (and b!844216 res!573604) b!844219))

(assert (= (and b!844215 condMapEmpty!25283) mapIsEmpty!25283))

(assert (= (and b!844215 (not condMapEmpty!25283)) mapNonEmpty!25283))

(get-info :version)

(assert (= (and mapNonEmpty!25283 ((_ is ValueCellFull!7455) mapValue!25283)) b!844220))

(assert (= (and b!844215 ((_ is ValueCellFull!7455) mapDefault!25283)) b!844214))

(assert (= start!72738 b!844215))

(declare-fun m!786561 () Bool)

(assert (=> b!844217 m!786561))

(declare-fun m!786563 () Bool)

(assert (=> b!844216 m!786563))

(declare-fun m!786565 () Bool)

(assert (=> start!72738 m!786565))

(declare-fun m!786567 () Bool)

(assert (=> start!72738 m!786567))

(declare-fun m!786569 () Bool)

(assert (=> mapNonEmpty!25283 m!786569))

(declare-fun m!786571 () Bool)

(assert (=> b!844219 m!786571))

(check-sat (not b!844216) (not start!72738) (not b!844217) (not mapNonEmpty!25283) tp_is_empty!15789 (not b!844219))
(check-sat)
