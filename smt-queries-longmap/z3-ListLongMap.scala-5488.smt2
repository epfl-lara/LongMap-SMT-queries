; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72714 () Bool)

(assert start!72714)

(declare-fun res!573461 () Bool)

(declare-fun e!470973 () Bool)

(assert (=> start!72714 (=> (not res!573461) (not e!470973))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47772 0))(
  ( (array!47773 (arr!22917 (Array (_ BitVec 32) (_ BitVec 64))) (size!23357 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47772)

(assert (=> start!72714 (= res!573461 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23357 _keys!868))))))

(assert (=> start!72714 e!470973))

(assert (=> start!72714 true))

(declare-fun array_inv!18224 (array!47772) Bool)

(assert (=> start!72714 (array_inv!18224 _keys!868)))

(declare-datatypes ((V!26067 0))(
  ( (V!26068 (val!7930 Int)) )
))
(declare-datatypes ((ValueCell!7443 0))(
  ( (ValueCellFull!7443 (v!10355 V!26067)) (EmptyCell!7443) )
))
(declare-datatypes ((array!47774 0))(
  ( (array!47775 (arr!22918 (Array (_ BitVec 32) ValueCell!7443)) (size!23358 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47774)

(declare-fun e!470975 () Bool)

(declare-fun array_inv!18225 (array!47774) Bool)

(assert (=> start!72714 (and (array_inv!18225 _values!688) e!470975)))

(declare-fun mapNonEmpty!25247 () Bool)

(declare-fun mapRes!25247 () Bool)

(declare-fun tp!48565 () Bool)

(declare-fun e!470977 () Bool)

(assert (=> mapNonEmpty!25247 (= mapRes!25247 (and tp!48565 e!470977))))

(declare-fun mapRest!25247 () (Array (_ BitVec 32) ValueCell!7443))

(declare-fun mapValue!25247 () ValueCell!7443)

(declare-fun mapKey!25247 () (_ BitVec 32))

(assert (=> mapNonEmpty!25247 (= (arr!22918 _values!688) (store mapRest!25247 mapKey!25247 mapValue!25247))))

(declare-fun b!843962 () Bool)

(declare-fun e!470974 () Bool)

(assert (=> b!843962 (= e!470975 (and e!470974 mapRes!25247))))

(declare-fun condMapEmpty!25247 () Bool)

(declare-fun mapDefault!25247 () ValueCell!7443)

(assert (=> b!843962 (= condMapEmpty!25247 (= (arr!22918 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7443)) mapDefault!25247)))))

(declare-fun b!843963 () Bool)

(declare-fun res!573460 () Bool)

(assert (=> b!843963 (=> (not res!573460) (not e!470973))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843963 (= res!573460 (validMask!0 mask!1196))))

(declare-fun b!843964 () Bool)

(declare-fun tp_is_empty!15765 () Bool)

(assert (=> b!843964 (= e!470974 tp_is_empty!15765)))

(declare-fun b!843965 () Bool)

(assert (=> b!843965 (= e!470977 tp_is_empty!15765)))

(declare-fun b!843966 () Bool)

(declare-fun res!573458 () Bool)

(assert (=> b!843966 (=> (not res!573458) (not e!470973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47772 (_ BitVec 32)) Bool)

(assert (=> b!843966 (= res!573458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843967 () Bool)

(assert (=> b!843967 (= e!470973 false)))

(declare-fun lt!381214 () Bool)

(declare-datatypes ((List!16256 0))(
  ( (Nil!16253) (Cons!16252 (h!17383 (_ BitVec 64)) (t!22627 List!16256)) )
))
(declare-fun arrayNoDuplicates!0 (array!47772 (_ BitVec 32) List!16256) Bool)

(assert (=> b!843967 (= lt!381214 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16253))))

(declare-fun mapIsEmpty!25247 () Bool)

(assert (=> mapIsEmpty!25247 mapRes!25247))

(declare-fun b!843968 () Bool)

(declare-fun res!573459 () Bool)

(assert (=> b!843968 (=> (not res!573459) (not e!470973))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843968 (= res!573459 (and (= (size!23358 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23357 _keys!868) (size!23358 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72714 res!573461) b!843963))

(assert (= (and b!843963 res!573460) b!843968))

(assert (= (and b!843968 res!573459) b!843966))

(assert (= (and b!843966 res!573458) b!843967))

(assert (= (and b!843962 condMapEmpty!25247) mapIsEmpty!25247))

(assert (= (and b!843962 (not condMapEmpty!25247)) mapNonEmpty!25247))

(get-info :version)

(assert (= (and mapNonEmpty!25247 ((_ is ValueCellFull!7443) mapValue!25247)) b!843965))

(assert (= (and b!843962 ((_ is ValueCellFull!7443) mapDefault!25247)) b!843964))

(assert (= start!72714 b!843962))

(declare-fun m!786417 () Bool)

(assert (=> b!843963 m!786417))

(declare-fun m!786419 () Bool)

(assert (=> b!843966 m!786419))

(declare-fun m!786421 () Bool)

(assert (=> mapNonEmpty!25247 m!786421))

(declare-fun m!786423 () Bool)

(assert (=> b!843967 m!786423))

(declare-fun m!786425 () Bool)

(assert (=> start!72714 m!786425))

(declare-fun m!786427 () Bool)

(assert (=> start!72714 m!786427))

(check-sat tp_is_empty!15765 (not start!72714) (not b!843966) (not b!843963) (not b!843967) (not mapNonEmpty!25247))
(check-sat)
