; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72202 () Bool)

(assert start!72202)

(declare-fun b!836791 () Bool)

(declare-fun e!466947 () Bool)

(declare-fun tp_is_empty!15301 () Bool)

(assert (=> b!836791 (= e!466947 tp_is_empty!15301)))

(declare-fun b!836792 () Bool)

(declare-fun res!569195 () Bool)

(declare-fun e!466951 () Bool)

(assert (=> b!836792 (=> (not res!569195) (not e!466951))))

(declare-datatypes ((array!46867 0))(
  ( (array!46868 (arr!22468 (Array (_ BitVec 32) (_ BitVec 64))) (size!22910 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46867)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46867 (_ BitVec 32)) Bool)

(assert (=> b!836792 (= res!569195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!836793 () Bool)

(declare-fun res!569194 () Bool)

(assert (=> b!836793 (=> (not res!569194) (not e!466951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836793 (= res!569194 (validMask!0 mask!1196))))

(declare-fun b!836794 () Bool)

(declare-fun res!569196 () Bool)

(assert (=> b!836794 (=> (not res!569196) (not e!466951))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25449 0))(
  ( (V!25450 (val!7698 Int)) )
))
(declare-datatypes ((ValueCell!7211 0))(
  ( (ValueCellFull!7211 (v!10116 V!25449)) (EmptyCell!7211) )
))
(declare-datatypes ((array!46869 0))(
  ( (array!46870 (arr!22469 (Array (_ BitVec 32) ValueCell!7211)) (size!22911 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46869)

(assert (=> b!836794 (= res!569196 (and (= (size!22911 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22910 _keys!868) (size!22911 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24542 () Bool)

(declare-fun mapRes!24542 () Bool)

(declare-fun tp!47537 () Bool)

(declare-fun e!466950 () Bool)

(assert (=> mapNonEmpty!24542 (= mapRes!24542 (and tp!47537 e!466950))))

(declare-fun mapValue!24542 () ValueCell!7211)

(declare-fun mapRest!24542 () (Array (_ BitVec 32) ValueCell!7211))

(declare-fun mapKey!24542 () (_ BitVec 32))

(assert (=> mapNonEmpty!24542 (= (arr!22469 _values!688) (store mapRest!24542 mapKey!24542 mapValue!24542))))

(declare-fun b!836795 () Bool)

(assert (=> b!836795 (= e!466951 (bvsgt #b00000000000000000000000000000000 (size!22910 _keys!868)))))

(declare-fun res!569197 () Bool)

(assert (=> start!72202 (=> (not res!569197) (not e!466951))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72202 (= res!569197 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22910 _keys!868))))))

(assert (=> start!72202 e!466951))

(assert (=> start!72202 true))

(declare-fun array_inv!17976 (array!46867) Bool)

(assert (=> start!72202 (array_inv!17976 _keys!868)))

(declare-fun e!466948 () Bool)

(declare-fun array_inv!17977 (array!46869) Bool)

(assert (=> start!72202 (and (array_inv!17977 _values!688) e!466948)))

(declare-fun b!836796 () Bool)

(assert (=> b!836796 (= e!466950 tp_is_empty!15301)))

(declare-fun mapIsEmpty!24542 () Bool)

(assert (=> mapIsEmpty!24542 mapRes!24542))

(declare-fun b!836797 () Bool)

(assert (=> b!836797 (= e!466948 (and e!466947 mapRes!24542))))

(declare-fun condMapEmpty!24542 () Bool)

(declare-fun mapDefault!24542 () ValueCell!7211)

(assert (=> b!836797 (= condMapEmpty!24542 (= (arr!22469 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7211)) mapDefault!24542)))))

(assert (= (and start!72202 res!569197) b!836793))

(assert (= (and b!836793 res!569194) b!836794))

(assert (= (and b!836794 res!569196) b!836792))

(assert (= (and b!836792 res!569195) b!836795))

(assert (= (and b!836797 condMapEmpty!24542) mapIsEmpty!24542))

(assert (= (and b!836797 (not condMapEmpty!24542)) mapNonEmpty!24542))

(get-info :version)

(assert (= (and mapNonEmpty!24542 ((_ is ValueCellFull!7211) mapValue!24542)) b!836796))

(assert (= (and b!836797 ((_ is ValueCellFull!7211) mapDefault!24542)) b!836791))

(assert (= start!72202 b!836797))

(declare-fun m!781307 () Bool)

(assert (=> b!836792 m!781307))

(declare-fun m!781309 () Bool)

(assert (=> b!836793 m!781309))

(declare-fun m!781311 () Bool)

(assert (=> mapNonEmpty!24542 m!781311))

(declare-fun m!781313 () Bool)

(assert (=> start!72202 m!781313))

(declare-fun m!781315 () Bool)

(assert (=> start!72202 m!781315))

(check-sat (not b!836792) tp_is_empty!15301 (not mapNonEmpty!24542) (not b!836793) (not start!72202))
(check-sat)
