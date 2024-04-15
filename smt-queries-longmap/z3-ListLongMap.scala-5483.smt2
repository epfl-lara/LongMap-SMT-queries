; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72664 () Bool)

(assert start!72664)

(declare-fun res!573158 () Bool)

(declare-fun e!470586 () Bool)

(assert (=> start!72664 (=> (not res!573158) (not e!470586))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47705 0))(
  ( (array!47706 (arr!22884 (Array (_ BitVec 32) (_ BitVec 64))) (size!23326 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47705)

(assert (=> start!72664 (= res!573158 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23326 _keys!868))))))

(assert (=> start!72664 e!470586))

(assert (=> start!72664 true))

(declare-fun array_inv!18274 (array!47705) Bool)

(assert (=> start!72664 (array_inv!18274 _keys!868)))

(declare-datatypes ((V!26025 0))(
  ( (V!26026 (val!7914 Int)) )
))
(declare-datatypes ((ValueCell!7427 0))(
  ( (ValueCellFull!7427 (v!10333 V!26025)) (EmptyCell!7427) )
))
(declare-datatypes ((array!47707 0))(
  ( (array!47708 (arr!22885 (Array (_ BitVec 32) ValueCell!7427)) (size!23327 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47707)

(declare-fun e!470585 () Bool)

(declare-fun array_inv!18275 (array!47707) Bool)

(assert (=> start!72664 (and (array_inv!18275 _values!688) e!470585)))

(declare-fun b!843387 () Bool)

(declare-fun res!573159 () Bool)

(assert (=> b!843387 (=> (not res!573159) (not e!470586))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843387 (= res!573159 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25199 () Bool)

(declare-fun mapRes!25199 () Bool)

(declare-fun tp!48518 () Bool)

(declare-fun e!470589 () Bool)

(assert (=> mapNonEmpty!25199 (= mapRes!25199 (and tp!48518 e!470589))))

(declare-fun mapValue!25199 () ValueCell!7427)

(declare-fun mapKey!25199 () (_ BitVec 32))

(declare-fun mapRest!25199 () (Array (_ BitVec 32) ValueCell!7427))

(assert (=> mapNonEmpty!25199 (= (arr!22885 _values!688) (store mapRest!25199 mapKey!25199 mapValue!25199))))

(declare-fun b!843388 () Bool)

(declare-fun tp_is_empty!15733 () Bool)

(assert (=> b!843388 (= e!470589 tp_is_empty!15733)))

(declare-fun b!843389 () Bool)

(declare-fun res!573157 () Bool)

(assert (=> b!843389 (=> (not res!573157) (not e!470586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47705 (_ BitVec 32)) Bool)

(assert (=> b!843389 (= res!573157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843390 () Bool)

(declare-fun e!470587 () Bool)

(assert (=> b!843390 (= e!470585 (and e!470587 mapRes!25199))))

(declare-fun condMapEmpty!25199 () Bool)

(declare-fun mapDefault!25199 () ValueCell!7427)

(assert (=> b!843390 (= condMapEmpty!25199 (= (arr!22885 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7427)) mapDefault!25199)))))

(declare-fun mapIsEmpty!25199 () Bool)

(assert (=> mapIsEmpty!25199 mapRes!25199))

(declare-fun b!843391 () Bool)

(declare-fun res!573156 () Bool)

(assert (=> b!843391 (=> (not res!573156) (not e!470586))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843391 (= res!573156 (and (= (size!23327 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23326 _keys!868) (size!23327 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843392 () Bool)

(assert (=> b!843392 (= e!470587 tp_is_empty!15733)))

(declare-fun b!843393 () Bool)

(assert (=> b!843393 (= e!470586 false)))

(declare-fun lt!380930 () Bool)

(declare-datatypes ((List!16263 0))(
  ( (Nil!16260) (Cons!16259 (h!17390 (_ BitVec 64)) (t!22625 List!16263)) )
))
(declare-fun arrayNoDuplicates!0 (array!47705 (_ BitVec 32) List!16263) Bool)

(assert (=> b!843393 (= lt!380930 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16260))))

(assert (= (and start!72664 res!573158) b!843387))

(assert (= (and b!843387 res!573159) b!843391))

(assert (= (and b!843391 res!573156) b!843389))

(assert (= (and b!843389 res!573157) b!843393))

(assert (= (and b!843390 condMapEmpty!25199) mapIsEmpty!25199))

(assert (= (and b!843390 (not condMapEmpty!25199)) mapNonEmpty!25199))

(get-info :version)

(assert (= (and mapNonEmpty!25199 ((_ is ValueCellFull!7427) mapValue!25199)) b!843388))

(assert (= (and b!843390 ((_ is ValueCellFull!7427) mapDefault!25199)) b!843392))

(assert (= start!72664 b!843390))

(declare-fun m!785471 () Bool)

(assert (=> mapNonEmpty!25199 m!785471))

(declare-fun m!785473 () Bool)

(assert (=> b!843393 m!785473))

(declare-fun m!785475 () Bool)

(assert (=> b!843389 m!785475))

(declare-fun m!785477 () Bool)

(assert (=> b!843387 m!785477))

(declare-fun m!785479 () Bool)

(assert (=> start!72664 m!785479))

(declare-fun m!785481 () Bool)

(assert (=> start!72664 m!785481))

(check-sat (not mapNonEmpty!25199) (not start!72664) tp_is_empty!15733 (not b!843387) (not b!843393) (not b!843389))
(check-sat)
