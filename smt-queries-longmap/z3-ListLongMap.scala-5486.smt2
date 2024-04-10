; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72702 () Bool)

(assert start!72702)

(declare-fun b!843836 () Bool)

(declare-fun e!470887 () Bool)

(declare-fun tp_is_empty!15753 () Bool)

(assert (=> b!843836 (= e!470887 tp_is_empty!15753)))

(declare-fun b!843837 () Bool)

(declare-fun res!573387 () Bool)

(declare-fun e!470885 () Bool)

(assert (=> b!843837 (=> (not res!573387) (not e!470885))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843837 (= res!573387 (validMask!0 mask!1196))))

(declare-fun b!843838 () Bool)

(declare-fun res!573388 () Bool)

(assert (=> b!843838 (=> (not res!573388) (not e!470885))))

(declare-datatypes ((array!47750 0))(
  ( (array!47751 (arr!22906 (Array (_ BitVec 32) (_ BitVec 64))) (size!23346 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47750)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47750 (_ BitVec 32)) Bool)

(assert (=> b!843838 (= res!573388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843839 () Bool)

(declare-fun res!573386 () Bool)

(assert (=> b!843839 (=> (not res!573386) (not e!470885))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26051 0))(
  ( (V!26052 (val!7924 Int)) )
))
(declare-datatypes ((ValueCell!7437 0))(
  ( (ValueCellFull!7437 (v!10349 V!26051)) (EmptyCell!7437) )
))
(declare-datatypes ((array!47752 0))(
  ( (array!47753 (arr!22907 (Array (_ BitVec 32) ValueCell!7437)) (size!23347 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47752)

(assert (=> b!843839 (= res!573386 (and (= (size!23347 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23346 _keys!868) (size!23347 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!573389 () Bool)

(assert (=> start!72702 (=> (not res!573389) (not e!470885))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72702 (= res!573389 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23346 _keys!868))))))

(assert (=> start!72702 e!470885))

(assert (=> start!72702 true))

(declare-fun array_inv!18216 (array!47750) Bool)

(assert (=> start!72702 (array_inv!18216 _keys!868)))

(declare-fun e!470886 () Bool)

(declare-fun array_inv!18217 (array!47752) Bool)

(assert (=> start!72702 (and (array_inv!18217 _values!688) e!470886)))

(declare-fun mapIsEmpty!25229 () Bool)

(declare-fun mapRes!25229 () Bool)

(assert (=> mapIsEmpty!25229 mapRes!25229))

(declare-fun b!843840 () Bool)

(assert (=> b!843840 (= e!470885 false)))

(declare-fun lt!381196 () Bool)

(declare-datatypes ((List!16251 0))(
  ( (Nil!16248) (Cons!16247 (h!17378 (_ BitVec 64)) (t!22622 List!16251)) )
))
(declare-fun arrayNoDuplicates!0 (array!47750 (_ BitVec 32) List!16251) Bool)

(assert (=> b!843840 (= lt!381196 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16248))))

(declare-fun b!843841 () Bool)

(assert (=> b!843841 (= e!470886 (and e!470887 mapRes!25229))))

(declare-fun condMapEmpty!25229 () Bool)

(declare-fun mapDefault!25229 () ValueCell!7437)

(assert (=> b!843841 (= condMapEmpty!25229 (= (arr!22907 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7437)) mapDefault!25229)))))

(declare-fun mapNonEmpty!25229 () Bool)

(declare-fun tp!48547 () Bool)

(declare-fun e!470884 () Bool)

(assert (=> mapNonEmpty!25229 (= mapRes!25229 (and tp!48547 e!470884))))

(declare-fun mapRest!25229 () (Array (_ BitVec 32) ValueCell!7437))

(declare-fun mapKey!25229 () (_ BitVec 32))

(declare-fun mapValue!25229 () ValueCell!7437)

(assert (=> mapNonEmpty!25229 (= (arr!22907 _values!688) (store mapRest!25229 mapKey!25229 mapValue!25229))))

(declare-fun b!843842 () Bool)

(assert (=> b!843842 (= e!470884 tp_is_empty!15753)))

(assert (= (and start!72702 res!573389) b!843837))

(assert (= (and b!843837 res!573387) b!843839))

(assert (= (and b!843839 res!573386) b!843838))

(assert (= (and b!843838 res!573388) b!843840))

(assert (= (and b!843841 condMapEmpty!25229) mapIsEmpty!25229))

(assert (= (and b!843841 (not condMapEmpty!25229)) mapNonEmpty!25229))

(get-info :version)

(assert (= (and mapNonEmpty!25229 ((_ is ValueCellFull!7437) mapValue!25229)) b!843842))

(assert (= (and b!843841 ((_ is ValueCellFull!7437) mapDefault!25229)) b!843836))

(assert (= start!72702 b!843841))

(declare-fun m!786345 () Bool)

(assert (=> b!843840 m!786345))

(declare-fun m!786347 () Bool)

(assert (=> b!843837 m!786347))

(declare-fun m!786349 () Bool)

(assert (=> start!72702 m!786349))

(declare-fun m!786351 () Bool)

(assert (=> start!72702 m!786351))

(declare-fun m!786353 () Bool)

(assert (=> b!843838 m!786353))

(declare-fun m!786355 () Bool)

(assert (=> mapNonEmpty!25229 m!786355))

(check-sat (not mapNonEmpty!25229) (not start!72702) (not b!843840) (not b!843837) (not b!843838) tp_is_empty!15753)
(check-sat)
