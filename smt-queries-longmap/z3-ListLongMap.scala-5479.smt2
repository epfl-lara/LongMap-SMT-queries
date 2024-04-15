; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72640 () Bool)

(assert start!72640)

(declare-fun res!573014 () Bool)

(declare-fun e!470409 () Bool)

(assert (=> start!72640 (=> (not res!573014) (not e!470409))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47657 0))(
  ( (array!47658 (arr!22860 (Array (_ BitVec 32) (_ BitVec 64))) (size!23302 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47657)

(assert (=> start!72640 (= res!573014 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23302 _keys!868))))))

(assert (=> start!72640 e!470409))

(assert (=> start!72640 true))

(declare-fun array_inv!18256 (array!47657) Bool)

(assert (=> start!72640 (array_inv!18256 _keys!868)))

(declare-datatypes ((V!25993 0))(
  ( (V!25994 (val!7902 Int)) )
))
(declare-datatypes ((ValueCell!7415 0))(
  ( (ValueCellFull!7415 (v!10321 V!25993)) (EmptyCell!7415) )
))
(declare-datatypes ((array!47659 0))(
  ( (array!47660 (arr!22861 (Array (_ BitVec 32) ValueCell!7415)) (size!23303 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47659)

(declare-fun e!470407 () Bool)

(declare-fun array_inv!18257 (array!47659) Bool)

(assert (=> start!72640 (and (array_inv!18257 _values!688) e!470407)))

(declare-fun b!843135 () Bool)

(declare-fun e!470405 () Bool)

(declare-fun mapRes!25163 () Bool)

(assert (=> b!843135 (= e!470407 (and e!470405 mapRes!25163))))

(declare-fun condMapEmpty!25163 () Bool)

(declare-fun mapDefault!25163 () ValueCell!7415)

(assert (=> b!843135 (= condMapEmpty!25163 (= (arr!22861 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7415)) mapDefault!25163)))))

(declare-fun b!843136 () Bool)

(declare-fun res!573012 () Bool)

(assert (=> b!843136 (=> (not res!573012) (not e!470409))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47657 (_ BitVec 32)) Bool)

(assert (=> b!843136 (= res!573012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843137 () Bool)

(declare-fun res!573013 () Bool)

(assert (=> b!843137 (=> (not res!573013) (not e!470409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843137 (= res!573013 (validMask!0 mask!1196))))

(declare-fun b!843138 () Bool)

(declare-fun tp_is_empty!15709 () Bool)

(assert (=> b!843138 (= e!470405 tp_is_empty!15709)))

(declare-fun b!843139 () Bool)

(assert (=> b!843139 (= e!470409 false)))

(declare-fun lt!380894 () Bool)

(declare-datatypes ((List!16253 0))(
  ( (Nil!16250) (Cons!16249 (h!17380 (_ BitVec 64)) (t!22615 List!16253)) )
))
(declare-fun arrayNoDuplicates!0 (array!47657 (_ BitVec 32) List!16253) Bool)

(assert (=> b!843139 (= lt!380894 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16250))))

(declare-fun b!843140 () Bool)

(declare-fun e!470408 () Bool)

(assert (=> b!843140 (= e!470408 tp_is_empty!15709)))

(declare-fun mapNonEmpty!25163 () Bool)

(declare-fun tp!48482 () Bool)

(assert (=> mapNonEmpty!25163 (= mapRes!25163 (and tp!48482 e!470408))))

(declare-fun mapValue!25163 () ValueCell!7415)

(declare-fun mapRest!25163 () (Array (_ BitVec 32) ValueCell!7415))

(declare-fun mapKey!25163 () (_ BitVec 32))

(assert (=> mapNonEmpty!25163 (= (arr!22861 _values!688) (store mapRest!25163 mapKey!25163 mapValue!25163))))

(declare-fun mapIsEmpty!25163 () Bool)

(assert (=> mapIsEmpty!25163 mapRes!25163))

(declare-fun b!843141 () Bool)

(declare-fun res!573015 () Bool)

(assert (=> b!843141 (=> (not res!573015) (not e!470409))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843141 (= res!573015 (and (= (size!23303 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23302 _keys!868) (size!23303 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72640 res!573014) b!843137))

(assert (= (and b!843137 res!573013) b!843141))

(assert (= (and b!843141 res!573015) b!843136))

(assert (= (and b!843136 res!573012) b!843139))

(assert (= (and b!843135 condMapEmpty!25163) mapIsEmpty!25163))

(assert (= (and b!843135 (not condMapEmpty!25163)) mapNonEmpty!25163))

(get-info :version)

(assert (= (and mapNonEmpty!25163 ((_ is ValueCellFull!7415) mapValue!25163)) b!843140))

(assert (= (and b!843135 ((_ is ValueCellFull!7415) mapDefault!25163)) b!843138))

(assert (= start!72640 b!843135))

(declare-fun m!785327 () Bool)

(assert (=> start!72640 m!785327))

(declare-fun m!785329 () Bool)

(assert (=> start!72640 m!785329))

(declare-fun m!785331 () Bool)

(assert (=> b!843137 m!785331))

(declare-fun m!785333 () Bool)

(assert (=> b!843136 m!785333))

(declare-fun m!785335 () Bool)

(assert (=> mapNonEmpty!25163 m!785335))

(declare-fun m!785337 () Bool)

(assert (=> b!843139 m!785337))

(check-sat tp_is_empty!15709 (not mapNonEmpty!25163) (not b!843139) (not b!843137) (not start!72640) (not b!843136))
(check-sat)
