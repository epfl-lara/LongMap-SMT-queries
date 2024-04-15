; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72814 () Bool)

(assert start!72814)

(declare-fun b_free!13747 () Bool)

(declare-fun b_next!13747 () Bool)

(assert (=> start!72814 (= b_free!13747 (not b_next!13747))))

(declare-fun tp!48745 () Bool)

(declare-fun b_and!22807 () Bool)

(assert (=> start!72814 (= tp!48745 b_and!22807)))

(declare-fun mapNonEmpty!25424 () Bool)

(declare-fun mapRes!25424 () Bool)

(declare-fun tp!48746 () Bool)

(declare-fun e!471711 () Bool)

(assert (=> mapNonEmpty!25424 (= mapRes!25424 (and tp!48746 e!471711))))

(declare-datatypes ((V!26225 0))(
  ( (V!26226 (val!7989 Int)) )
))
(declare-datatypes ((ValueCell!7502 0))(
  ( (ValueCellFull!7502 (v!10408 V!26225)) (EmptyCell!7502) )
))
(declare-fun mapValue!25424 () ValueCell!7502)

(declare-fun mapKey!25424 () (_ BitVec 32))

(declare-fun mapRest!25424 () (Array (_ BitVec 32) ValueCell!7502))

(declare-datatypes ((array!47989 0))(
  ( (array!47990 (arr!23026 (Array (_ BitVec 32) ValueCell!7502)) (size!23468 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47989)

(assert (=> mapNonEmpty!25424 (= (arr!23026 _values!688) (store mapRest!25424 mapKey!25424 mapValue!25424))))

(declare-fun b!844970 () Bool)

(declare-fun e!471710 () Bool)

(assert (=> b!844970 (= e!471710 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10454 0))(
  ( (tuple2!10455 (_1!5238 (_ BitVec 64)) (_2!5238 V!26225)) )
))
(declare-datatypes ((List!16314 0))(
  ( (Nil!16311) (Cons!16310 (h!17441 tuple2!10454) (t!22676 List!16314)) )
))
(declare-datatypes ((ListLongMap!9213 0))(
  ( (ListLongMap!9214 (toList!4622 List!16314)) )
))
(declare-fun lt!381155 () ListLongMap!9213)

(declare-datatypes ((array!47991 0))(
  ( (array!47992 (arr!23027 (Array (_ BitVec 32) (_ BitVec 64))) (size!23469 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47991)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26225)

(declare-fun zeroValue!654 () V!26225)

(declare-fun getCurrentListMapNoExtraKeys!2636 (array!47991 array!47989 (_ BitVec 32) (_ BitVec 32) V!26225 V!26225 (_ BitVec 32) Int) ListLongMap!9213)

(assert (=> b!844970 (= lt!381155 (getCurrentListMapNoExtraKeys!2636 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!844971 () Bool)

(declare-fun res!574070 () Bool)

(assert (=> b!844971 (=> (not res!574070) (not e!471710))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!844971 (= res!574070 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23469 _keys!868))))))

(declare-fun b!844972 () Bool)

(declare-fun tp_is_empty!15883 () Bool)

(assert (=> b!844972 (= e!471711 tp_is_empty!15883)))

(declare-fun b!844973 () Bool)

(declare-fun res!574064 () Bool)

(assert (=> b!844973 (=> (not res!574064) (not e!471710))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!844973 (= res!574064 (and (= (select (arr!23027 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!844974 () Bool)

(declare-fun res!574065 () Bool)

(assert (=> b!844974 (=> (not res!574065) (not e!471710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844974 (= res!574065 (validMask!0 mask!1196))))

(declare-fun b!844975 () Bool)

(declare-fun res!574068 () Bool)

(assert (=> b!844975 (=> (not res!574068) (not e!471710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!844975 (= res!574068 (validKeyInArray!0 k0!854))))

(declare-fun b!844976 () Bool)

(declare-fun res!574067 () Bool)

(assert (=> b!844976 (=> (not res!574067) (not e!471710))))

(assert (=> b!844976 (= res!574067 (and (= (size!23468 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23469 _keys!868) (size!23468 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844977 () Bool)

(declare-fun res!574071 () Bool)

(assert (=> b!844977 (=> (not res!574071) (not e!471710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47991 (_ BitVec 32)) Bool)

(assert (=> b!844977 (= res!574071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25424 () Bool)

(assert (=> mapIsEmpty!25424 mapRes!25424))

(declare-fun b!844978 () Bool)

(declare-fun e!471712 () Bool)

(assert (=> b!844978 (= e!471712 tp_is_empty!15883)))

(declare-fun res!574066 () Bool)

(assert (=> start!72814 (=> (not res!574066) (not e!471710))))

(assert (=> start!72814 (= res!574066 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23469 _keys!868))))))

(assert (=> start!72814 e!471710))

(assert (=> start!72814 true))

(assert (=> start!72814 tp!48745))

(declare-fun array_inv!18368 (array!47991) Bool)

(assert (=> start!72814 (array_inv!18368 _keys!868)))

(declare-fun e!471714 () Bool)

(declare-fun array_inv!18369 (array!47989) Bool)

(assert (=> start!72814 (and (array_inv!18369 _values!688) e!471714)))

(assert (=> start!72814 tp_is_empty!15883))

(declare-fun b!844979 () Bool)

(assert (=> b!844979 (= e!471714 (and e!471712 mapRes!25424))))

(declare-fun condMapEmpty!25424 () Bool)

(declare-fun mapDefault!25424 () ValueCell!7502)

(assert (=> b!844979 (= condMapEmpty!25424 (= (arr!23026 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7502)) mapDefault!25424)))))

(declare-fun b!844980 () Bool)

(declare-fun res!574069 () Bool)

(assert (=> b!844980 (=> (not res!574069) (not e!471710))))

(declare-datatypes ((List!16315 0))(
  ( (Nil!16312) (Cons!16311 (h!17442 (_ BitVec 64)) (t!22677 List!16315)) )
))
(declare-fun arrayNoDuplicates!0 (array!47991 (_ BitVec 32) List!16315) Bool)

(assert (=> b!844980 (= res!574069 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16312))))

(assert (= (and start!72814 res!574066) b!844974))

(assert (= (and b!844974 res!574065) b!844976))

(assert (= (and b!844976 res!574067) b!844977))

(assert (= (and b!844977 res!574071) b!844980))

(assert (= (and b!844980 res!574069) b!844971))

(assert (= (and b!844971 res!574070) b!844975))

(assert (= (and b!844975 res!574068) b!844973))

(assert (= (and b!844973 res!574064) b!844970))

(assert (= (and b!844979 condMapEmpty!25424) mapIsEmpty!25424))

(assert (= (and b!844979 (not condMapEmpty!25424)) mapNonEmpty!25424))

(get-info :version)

(assert (= (and mapNonEmpty!25424 ((_ is ValueCellFull!7502) mapValue!25424)) b!844972))

(assert (= (and b!844979 ((_ is ValueCellFull!7502) mapDefault!25424)) b!844978))

(assert (= start!72814 b!844979))

(declare-fun m!786371 () Bool)

(assert (=> b!844970 m!786371))

(declare-fun m!786373 () Bool)

(assert (=> b!844974 m!786373))

(declare-fun m!786375 () Bool)

(assert (=> b!844975 m!786375))

(declare-fun m!786377 () Bool)

(assert (=> b!844973 m!786377))

(declare-fun m!786379 () Bool)

(assert (=> b!844977 m!786379))

(declare-fun m!786381 () Bool)

(assert (=> b!844980 m!786381))

(declare-fun m!786383 () Bool)

(assert (=> start!72814 m!786383))

(declare-fun m!786385 () Bool)

(assert (=> start!72814 m!786385))

(declare-fun m!786387 () Bool)

(assert (=> mapNonEmpty!25424 m!786387))

(check-sat (not b!844974) (not b!844970) (not b!844977) (not b_next!13747) b_and!22807 (not b!844980) (not start!72814) (not b!844975) tp_is_empty!15883 (not mapNonEmpty!25424))
(check-sat b_and!22807 (not b_next!13747))
