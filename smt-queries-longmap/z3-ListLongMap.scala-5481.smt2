; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72652 () Bool)

(assert start!72652)

(declare-fun b!843261 () Bool)

(declare-fun res!573084 () Bool)

(declare-fun e!470498 () Bool)

(assert (=> b!843261 (=> (not res!573084) (not e!470498))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843261 (= res!573084 (validMask!0 mask!1196))))

(declare-fun res!573087 () Bool)

(assert (=> start!72652 (=> (not res!573087) (not e!470498))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47681 0))(
  ( (array!47682 (arr!22872 (Array (_ BitVec 32) (_ BitVec 64))) (size!23314 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47681)

(assert (=> start!72652 (= res!573087 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23314 _keys!868))))))

(assert (=> start!72652 e!470498))

(assert (=> start!72652 true))

(declare-fun array_inv!18268 (array!47681) Bool)

(assert (=> start!72652 (array_inv!18268 _keys!868)))

(declare-datatypes ((V!26009 0))(
  ( (V!26010 (val!7908 Int)) )
))
(declare-datatypes ((ValueCell!7421 0))(
  ( (ValueCellFull!7421 (v!10327 V!26009)) (EmptyCell!7421) )
))
(declare-datatypes ((array!47683 0))(
  ( (array!47684 (arr!22873 (Array (_ BitVec 32) ValueCell!7421)) (size!23315 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47683)

(declare-fun e!470495 () Bool)

(declare-fun array_inv!18269 (array!47683) Bool)

(assert (=> start!72652 (and (array_inv!18269 _values!688) e!470495)))

(declare-fun b!843262 () Bool)

(declare-fun res!573085 () Bool)

(assert (=> b!843262 (=> (not res!573085) (not e!470498))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843262 (= res!573085 (and (= (size!23315 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23314 _keys!868) (size!23315 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843263 () Bool)

(assert (=> b!843263 (= e!470498 false)))

(declare-fun lt!380912 () Bool)

(declare-datatypes ((List!16259 0))(
  ( (Nil!16256) (Cons!16255 (h!17386 (_ BitVec 64)) (t!22621 List!16259)) )
))
(declare-fun arrayNoDuplicates!0 (array!47681 (_ BitVec 32) List!16259) Bool)

(assert (=> b!843263 (= lt!380912 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16256))))

(declare-fun b!843264 () Bool)

(declare-fun res!573086 () Bool)

(assert (=> b!843264 (=> (not res!573086) (not e!470498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47681 (_ BitVec 32)) Bool)

(assert (=> b!843264 (= res!573086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843265 () Bool)

(declare-fun e!470496 () Bool)

(declare-fun tp_is_empty!15721 () Bool)

(assert (=> b!843265 (= e!470496 tp_is_empty!15721)))

(declare-fun mapNonEmpty!25181 () Bool)

(declare-fun mapRes!25181 () Bool)

(declare-fun tp!48500 () Bool)

(declare-fun e!470497 () Bool)

(assert (=> mapNonEmpty!25181 (= mapRes!25181 (and tp!48500 e!470497))))

(declare-fun mapValue!25181 () ValueCell!7421)

(declare-fun mapKey!25181 () (_ BitVec 32))

(declare-fun mapRest!25181 () (Array (_ BitVec 32) ValueCell!7421))

(assert (=> mapNonEmpty!25181 (= (arr!22873 _values!688) (store mapRest!25181 mapKey!25181 mapValue!25181))))

(declare-fun mapIsEmpty!25181 () Bool)

(assert (=> mapIsEmpty!25181 mapRes!25181))

(declare-fun b!843266 () Bool)

(assert (=> b!843266 (= e!470495 (and e!470496 mapRes!25181))))

(declare-fun condMapEmpty!25181 () Bool)

(declare-fun mapDefault!25181 () ValueCell!7421)

(assert (=> b!843266 (= condMapEmpty!25181 (= (arr!22873 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7421)) mapDefault!25181)))))

(declare-fun b!843267 () Bool)

(assert (=> b!843267 (= e!470497 tp_is_empty!15721)))

(assert (= (and start!72652 res!573087) b!843261))

(assert (= (and b!843261 res!573084) b!843262))

(assert (= (and b!843262 res!573085) b!843264))

(assert (= (and b!843264 res!573086) b!843263))

(assert (= (and b!843266 condMapEmpty!25181) mapIsEmpty!25181))

(assert (= (and b!843266 (not condMapEmpty!25181)) mapNonEmpty!25181))

(get-info :version)

(assert (= (and mapNonEmpty!25181 ((_ is ValueCellFull!7421) mapValue!25181)) b!843267))

(assert (= (and b!843266 ((_ is ValueCellFull!7421) mapDefault!25181)) b!843265))

(assert (= start!72652 b!843266))

(declare-fun m!785399 () Bool)

(assert (=> start!72652 m!785399))

(declare-fun m!785401 () Bool)

(assert (=> start!72652 m!785401))

(declare-fun m!785403 () Bool)

(assert (=> b!843261 m!785403))

(declare-fun m!785405 () Bool)

(assert (=> b!843264 m!785405))

(declare-fun m!785407 () Bool)

(assert (=> b!843263 m!785407))

(declare-fun m!785409 () Bool)

(assert (=> mapNonEmpty!25181 m!785409))

(check-sat (not b!843263) (not b!843264) (not b!843261) tp_is_empty!15721 (not start!72652) (not mapNonEmpty!25181))
(check-sat)
