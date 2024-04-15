; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72682 () Bool)

(assert start!72682)

(declare-fun b!843576 () Bool)

(declare-fun e!470723 () Bool)

(assert (=> b!843576 (= e!470723 false)))

(declare-fun lt!380957 () Bool)

(declare-datatypes ((array!47741 0))(
  ( (array!47742 (arr!22902 (Array (_ BitVec 32) (_ BitVec 64))) (size!23344 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47741)

(declare-datatypes ((List!16270 0))(
  ( (Nil!16267) (Cons!16266 (h!17397 (_ BitVec 64)) (t!22632 List!16270)) )
))
(declare-fun arrayNoDuplicates!0 (array!47741 (_ BitVec 32) List!16270) Bool)

(assert (=> b!843576 (= lt!380957 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16267))))

(declare-fun b!843577 () Bool)

(declare-fun res!573264 () Bool)

(assert (=> b!843577 (=> (not res!573264) (not e!470723))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47741 (_ BitVec 32)) Bool)

(assert (=> b!843577 (= res!573264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843578 () Bool)

(declare-fun e!470720 () Bool)

(declare-fun tp_is_empty!15751 () Bool)

(assert (=> b!843578 (= e!470720 tp_is_empty!15751)))

(declare-fun b!843579 () Bool)

(declare-fun res!573267 () Bool)

(assert (=> b!843579 (=> (not res!573267) (not e!470723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843579 (= res!573267 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25226 () Bool)

(declare-fun mapRes!25226 () Bool)

(declare-fun tp!48545 () Bool)

(assert (=> mapNonEmpty!25226 (= mapRes!25226 (and tp!48545 e!470720))))

(declare-fun mapKey!25226 () (_ BitVec 32))

(declare-datatypes ((V!26049 0))(
  ( (V!26050 (val!7923 Int)) )
))
(declare-datatypes ((ValueCell!7436 0))(
  ( (ValueCellFull!7436 (v!10342 V!26049)) (EmptyCell!7436) )
))
(declare-fun mapValue!25226 () ValueCell!7436)

(declare-datatypes ((array!47743 0))(
  ( (array!47744 (arr!22903 (Array (_ BitVec 32) ValueCell!7436)) (size!23345 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47743)

(declare-fun mapRest!25226 () (Array (_ BitVec 32) ValueCell!7436))

(assert (=> mapNonEmpty!25226 (= (arr!22903 _values!688) (store mapRest!25226 mapKey!25226 mapValue!25226))))

(declare-fun mapIsEmpty!25226 () Bool)

(assert (=> mapIsEmpty!25226 mapRes!25226))

(declare-fun b!843580 () Bool)

(declare-fun res!573266 () Bool)

(assert (=> b!843580 (=> (not res!573266) (not e!470723))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843580 (= res!573266 (and (= (size!23345 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23344 _keys!868) (size!23345 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843581 () Bool)

(declare-fun e!470722 () Bool)

(declare-fun e!470724 () Bool)

(assert (=> b!843581 (= e!470722 (and e!470724 mapRes!25226))))

(declare-fun condMapEmpty!25226 () Bool)

(declare-fun mapDefault!25226 () ValueCell!7436)

(assert (=> b!843581 (= condMapEmpty!25226 (= (arr!22903 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7436)) mapDefault!25226)))))

(declare-fun res!573265 () Bool)

(assert (=> start!72682 (=> (not res!573265) (not e!470723))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72682 (= res!573265 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23344 _keys!868))))))

(assert (=> start!72682 e!470723))

(assert (=> start!72682 true))

(declare-fun array_inv!18290 (array!47741) Bool)

(assert (=> start!72682 (array_inv!18290 _keys!868)))

(declare-fun array_inv!18291 (array!47743) Bool)

(assert (=> start!72682 (and (array_inv!18291 _values!688) e!470722)))

(declare-fun b!843582 () Bool)

(assert (=> b!843582 (= e!470724 tp_is_empty!15751)))

(assert (= (and start!72682 res!573265) b!843579))

(assert (= (and b!843579 res!573267) b!843580))

(assert (= (and b!843580 res!573266) b!843577))

(assert (= (and b!843577 res!573264) b!843576))

(assert (= (and b!843581 condMapEmpty!25226) mapIsEmpty!25226))

(assert (= (and b!843581 (not condMapEmpty!25226)) mapNonEmpty!25226))

(get-info :version)

(assert (= (and mapNonEmpty!25226 ((_ is ValueCellFull!7436) mapValue!25226)) b!843578))

(assert (= (and b!843581 ((_ is ValueCellFull!7436) mapDefault!25226)) b!843582))

(assert (= start!72682 b!843581))

(declare-fun m!785579 () Bool)

(assert (=> start!72682 m!785579))

(declare-fun m!785581 () Bool)

(assert (=> start!72682 m!785581))

(declare-fun m!785583 () Bool)

(assert (=> b!843579 m!785583))

(declare-fun m!785585 () Bool)

(assert (=> b!843576 m!785585))

(declare-fun m!785587 () Bool)

(assert (=> b!843577 m!785587))

(declare-fun m!785589 () Bool)

(assert (=> mapNonEmpty!25226 m!785589))

(check-sat (not start!72682) (not b!843579) tp_is_empty!15751 (not b!843576) (not b!843577) (not mapNonEmpty!25226))
(check-sat)
