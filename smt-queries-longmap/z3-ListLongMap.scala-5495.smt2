; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72756 () Bool)

(assert start!72756)

(declare-fun b!844403 () Bool)

(declare-fun e!471291 () Bool)

(declare-fun e!471288 () Bool)

(declare-fun mapRes!25310 () Bool)

(assert (=> b!844403 (= e!471291 (and e!471288 mapRes!25310))))

(declare-fun condMapEmpty!25310 () Bool)

(declare-datatypes ((V!26123 0))(
  ( (V!26124 (val!7951 Int)) )
))
(declare-datatypes ((ValueCell!7464 0))(
  ( (ValueCellFull!7464 (v!10376 V!26123)) (EmptyCell!7464) )
))
(declare-datatypes ((array!47846 0))(
  ( (array!47847 (arr!22954 (Array (_ BitVec 32) ValueCell!7464)) (size!23394 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47846)

(declare-fun mapDefault!25310 () ValueCell!7464)

(assert (=> b!844403 (= condMapEmpty!25310 (= (arr!22954 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7464)) mapDefault!25310)))))

(declare-fun b!844404 () Bool)

(declare-fun tp_is_empty!15807 () Bool)

(assert (=> b!844404 (= e!471288 tp_is_empty!15807)))

(declare-fun mapIsEmpty!25310 () Bool)

(assert (=> mapIsEmpty!25310 mapRes!25310))

(declare-fun b!844405 () Bool)

(declare-fun e!471292 () Bool)

(assert (=> b!844405 (= e!471292 tp_is_empty!15807)))

(declare-fun b!844406 () Bool)

(declare-fun e!471289 () Bool)

(assert (=> b!844406 (= e!471289 false)))

(declare-fun lt!381277 () Bool)

(declare-datatypes ((array!47848 0))(
  ( (array!47849 (arr!22955 (Array (_ BitVec 32) (_ BitVec 64))) (size!23395 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47848)

(declare-datatypes ((List!16270 0))(
  ( (Nil!16267) (Cons!16266 (h!17397 (_ BitVec 64)) (t!22641 List!16270)) )
))
(declare-fun arrayNoDuplicates!0 (array!47848 (_ BitVec 32) List!16270) Bool)

(assert (=> b!844406 (= lt!381277 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16267))))

(declare-fun b!844407 () Bool)

(declare-fun res!573711 () Bool)

(assert (=> b!844407 (=> (not res!573711) (not e!471289))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844407 (= res!573711 (validMask!0 mask!1196))))

(declare-fun res!573712 () Bool)

(assert (=> start!72756 (=> (not res!573712) (not e!471289))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72756 (= res!573712 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23395 _keys!868))))))

(assert (=> start!72756 e!471289))

(assert (=> start!72756 true))

(declare-fun array_inv!18254 (array!47848) Bool)

(assert (=> start!72756 (array_inv!18254 _keys!868)))

(declare-fun array_inv!18255 (array!47846) Bool)

(assert (=> start!72756 (and (array_inv!18255 _values!688) e!471291)))

(declare-fun b!844408 () Bool)

(declare-fun res!573710 () Bool)

(assert (=> b!844408 (=> (not res!573710) (not e!471289))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844408 (= res!573710 (and (= (size!23394 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23395 _keys!868) (size!23394 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844409 () Bool)

(declare-fun res!573713 () Bool)

(assert (=> b!844409 (=> (not res!573713) (not e!471289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47848 (_ BitVec 32)) Bool)

(assert (=> b!844409 (= res!573713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25310 () Bool)

(declare-fun tp!48628 () Bool)

(assert (=> mapNonEmpty!25310 (= mapRes!25310 (and tp!48628 e!471292))))

(declare-fun mapValue!25310 () ValueCell!7464)

(declare-fun mapRest!25310 () (Array (_ BitVec 32) ValueCell!7464))

(declare-fun mapKey!25310 () (_ BitVec 32))

(assert (=> mapNonEmpty!25310 (= (arr!22954 _values!688) (store mapRest!25310 mapKey!25310 mapValue!25310))))

(assert (= (and start!72756 res!573712) b!844407))

(assert (= (and b!844407 res!573711) b!844408))

(assert (= (and b!844408 res!573710) b!844409))

(assert (= (and b!844409 res!573713) b!844406))

(assert (= (and b!844403 condMapEmpty!25310) mapIsEmpty!25310))

(assert (= (and b!844403 (not condMapEmpty!25310)) mapNonEmpty!25310))

(get-info :version)

(assert (= (and mapNonEmpty!25310 ((_ is ValueCellFull!7464) mapValue!25310)) b!844405))

(assert (= (and b!844403 ((_ is ValueCellFull!7464) mapDefault!25310)) b!844404))

(assert (= start!72756 b!844403))

(declare-fun m!786669 () Bool)

(assert (=> mapNonEmpty!25310 m!786669))

(declare-fun m!786671 () Bool)

(assert (=> b!844406 m!786671))

(declare-fun m!786673 () Bool)

(assert (=> start!72756 m!786673))

(declare-fun m!786675 () Bool)

(assert (=> start!72756 m!786675))

(declare-fun m!786677 () Bool)

(assert (=> b!844407 m!786677))

(declare-fun m!786679 () Bool)

(assert (=> b!844409 m!786679))

(check-sat (not b!844407) (not b!844406) (not b!844409) tp_is_empty!15807 (not mapNonEmpty!25310) (not start!72756))
(check-sat)
