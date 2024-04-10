; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72666 () Bool)

(assert start!72666)

(declare-fun b!843458 () Bool)

(declare-fun e!470616 () Bool)

(declare-fun tp_is_empty!15717 () Bool)

(assert (=> b!843458 (= e!470616 tp_is_empty!15717)))

(declare-fun mapIsEmpty!25175 () Bool)

(declare-fun mapRes!25175 () Bool)

(assert (=> mapIsEmpty!25175 mapRes!25175))

(declare-fun mapNonEmpty!25175 () Bool)

(declare-fun tp!48493 () Bool)

(declare-fun e!470615 () Bool)

(assert (=> mapNonEmpty!25175 (= mapRes!25175 (and tp!48493 e!470615))))

(declare-datatypes ((V!26003 0))(
  ( (V!26004 (val!7906 Int)) )
))
(declare-datatypes ((ValueCell!7419 0))(
  ( (ValueCellFull!7419 (v!10331 V!26003)) (EmptyCell!7419) )
))
(declare-fun mapValue!25175 () ValueCell!7419)

(declare-fun mapRest!25175 () (Array (_ BitVec 32) ValueCell!7419))

(declare-datatypes ((array!47682 0))(
  ( (array!47683 (arr!22872 (Array (_ BitVec 32) ValueCell!7419)) (size!23312 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47682)

(declare-fun mapKey!25175 () (_ BitVec 32))

(assert (=> mapNonEmpty!25175 (= (arr!22872 _values!688) (store mapRest!25175 mapKey!25175 mapValue!25175))))

(declare-fun b!843460 () Bool)

(declare-fun e!470613 () Bool)

(assert (=> b!843460 (= e!470613 (and e!470616 mapRes!25175))))

(declare-fun condMapEmpty!25175 () Bool)

(declare-fun mapDefault!25175 () ValueCell!7419)

(assert (=> b!843460 (= condMapEmpty!25175 (= (arr!22872 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7419)) mapDefault!25175)))))

(declare-fun b!843461 () Bool)

(declare-fun res!573172 () Bool)

(declare-fun e!470617 () Bool)

(assert (=> b!843461 (=> (not res!573172) (not e!470617))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47684 0))(
  ( (array!47685 (arr!22873 (Array (_ BitVec 32) (_ BitVec 64))) (size!23313 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47684)

(assert (=> b!843461 (= res!573172 (and (= (size!23312 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23313 _keys!868) (size!23312 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843462 () Bool)

(assert (=> b!843462 (= e!470617 false)))

(declare-fun lt!381142 () Bool)

(declare-datatypes ((List!16237 0))(
  ( (Nil!16234) (Cons!16233 (h!17364 (_ BitVec 64)) (t!22608 List!16237)) )
))
(declare-fun arrayNoDuplicates!0 (array!47684 (_ BitVec 32) List!16237) Bool)

(assert (=> b!843462 (= lt!381142 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16234))))

(declare-fun b!843463 () Bool)

(declare-fun res!573170 () Bool)

(assert (=> b!843463 (=> (not res!573170) (not e!470617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843463 (= res!573170 (validMask!0 mask!1196))))

(declare-fun b!843464 () Bool)

(declare-fun res!573171 () Bool)

(assert (=> b!843464 (=> (not res!573171) (not e!470617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47684 (_ BitVec 32)) Bool)

(assert (=> b!843464 (= res!573171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573173 () Bool)

(assert (=> start!72666 (=> (not res!573173) (not e!470617))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72666 (= res!573173 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23313 _keys!868))))))

(assert (=> start!72666 e!470617))

(assert (=> start!72666 true))

(declare-fun array_inv!18188 (array!47684) Bool)

(assert (=> start!72666 (array_inv!18188 _keys!868)))

(declare-fun array_inv!18189 (array!47682) Bool)

(assert (=> start!72666 (and (array_inv!18189 _values!688) e!470613)))

(declare-fun b!843459 () Bool)

(assert (=> b!843459 (= e!470615 tp_is_empty!15717)))

(assert (= (and start!72666 res!573173) b!843463))

(assert (= (and b!843463 res!573170) b!843461))

(assert (= (and b!843461 res!573172) b!843464))

(assert (= (and b!843464 res!573171) b!843462))

(assert (= (and b!843460 condMapEmpty!25175) mapIsEmpty!25175))

(assert (= (and b!843460 (not condMapEmpty!25175)) mapNonEmpty!25175))

(get-info :version)

(assert (= (and mapNonEmpty!25175 ((_ is ValueCellFull!7419) mapValue!25175)) b!843459))

(assert (= (and b!843460 ((_ is ValueCellFull!7419) mapDefault!25175)) b!843458))

(assert (= start!72666 b!843460))

(declare-fun m!786129 () Bool)

(assert (=> b!843464 m!786129))

(declare-fun m!786131 () Bool)

(assert (=> b!843462 m!786131))

(declare-fun m!786133 () Bool)

(assert (=> start!72666 m!786133))

(declare-fun m!786135 () Bool)

(assert (=> start!72666 m!786135))

(declare-fun m!786137 () Bool)

(assert (=> b!843463 m!786137))

(declare-fun m!786139 () Bool)

(assert (=> mapNonEmpty!25175 m!786139))

(check-sat (not start!72666) (not b!843463) (not mapNonEmpty!25175) (not b!843464) (not b!843462) tp_is_empty!15717)
(check-sat)
