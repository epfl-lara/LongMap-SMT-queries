; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72564 () Bool)

(assert start!72564)

(declare-fun b!842387 () Bool)

(declare-fun e!469848 () Bool)

(declare-fun e!469849 () Bool)

(declare-fun mapRes!25022 () Bool)

(assert (=> b!842387 (= e!469848 (and e!469849 mapRes!25022))))

(declare-fun condMapEmpty!25022 () Bool)

(declare-datatypes ((V!25867 0))(
  ( (V!25868 (val!7855 Int)) )
))
(declare-datatypes ((ValueCell!7368 0))(
  ( (ValueCellFull!7368 (v!10280 V!25867)) (EmptyCell!7368) )
))
(declare-datatypes ((array!47504 0))(
  ( (array!47505 (arr!22783 (Array (_ BitVec 32) ValueCell!7368)) (size!23223 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47504)

(declare-fun mapDefault!25022 () ValueCell!7368)

(assert (=> b!842387 (= condMapEmpty!25022 (= (arr!22783 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7368)) mapDefault!25022)))))

(declare-fun mapIsEmpty!25022 () Bool)

(assert (=> mapIsEmpty!25022 mapRes!25022))

(declare-fun b!842388 () Bool)

(declare-fun e!469851 () Bool)

(declare-fun tp_is_empty!15615 () Bool)

(assert (=> b!842388 (= e!469851 tp_is_empty!15615)))

(declare-fun b!842389 () Bool)

(declare-fun res!572559 () Bool)

(declare-fun e!469852 () Bool)

(assert (=> b!842389 (=> (not res!572559) (not e!469852))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842389 (= res!572559 (validMask!0 mask!1196))))

(declare-fun b!842390 () Bool)

(assert (=> b!842390 (= e!469852 false)))

(declare-fun lt!380989 () Bool)

(declare-datatypes ((array!47506 0))(
  ( (array!47507 (arr!22784 (Array (_ BitVec 32) (_ BitVec 64))) (size!23224 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47506)

(declare-datatypes ((List!16210 0))(
  ( (Nil!16207) (Cons!16206 (h!17337 (_ BitVec 64)) (t!22581 List!16210)) )
))
(declare-fun arrayNoDuplicates!0 (array!47506 (_ BitVec 32) List!16210) Bool)

(assert (=> b!842390 (= lt!380989 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16207))))

(declare-fun b!842391 () Bool)

(declare-fun res!572560 () Bool)

(assert (=> b!842391 (=> (not res!572560) (not e!469852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47506 (_ BitVec 32)) Bool)

(assert (=> b!842391 (= res!572560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!572558 () Bool)

(assert (=> start!72564 (=> (not res!572558) (not e!469852))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72564 (= res!572558 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23224 _keys!868))))))

(assert (=> start!72564 e!469852))

(assert (=> start!72564 true))

(declare-fun array_inv!18130 (array!47506) Bool)

(assert (=> start!72564 (array_inv!18130 _keys!868)))

(declare-fun array_inv!18131 (array!47504) Bool)

(assert (=> start!72564 (and (array_inv!18131 _values!688) e!469848)))

(declare-fun mapNonEmpty!25022 () Bool)

(declare-fun tp!48340 () Bool)

(assert (=> mapNonEmpty!25022 (= mapRes!25022 (and tp!48340 e!469851))))

(declare-fun mapValue!25022 () ValueCell!7368)

(declare-fun mapKey!25022 () (_ BitVec 32))

(declare-fun mapRest!25022 () (Array (_ BitVec 32) ValueCell!7368))

(assert (=> mapNonEmpty!25022 (= (arr!22783 _values!688) (store mapRest!25022 mapKey!25022 mapValue!25022))))

(declare-fun b!842392 () Bool)

(declare-fun res!572561 () Bool)

(assert (=> b!842392 (=> (not res!572561) (not e!469852))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842392 (= res!572561 (and (= (size!23223 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23224 _keys!868) (size!23223 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842393 () Bool)

(assert (=> b!842393 (= e!469849 tp_is_empty!15615)))

(assert (= (and start!72564 res!572558) b!842389))

(assert (= (and b!842389 res!572559) b!842392))

(assert (= (and b!842392 res!572561) b!842391))

(assert (= (and b!842391 res!572560) b!842390))

(assert (= (and b!842387 condMapEmpty!25022) mapIsEmpty!25022))

(assert (= (and b!842387 (not condMapEmpty!25022)) mapNonEmpty!25022))

(get-info :version)

(assert (= (and mapNonEmpty!25022 ((_ is ValueCellFull!7368) mapValue!25022)) b!842388))

(assert (= (and b!842387 ((_ is ValueCellFull!7368) mapDefault!25022)) b!842393))

(assert (= start!72564 b!842387))

(declare-fun m!785517 () Bool)

(assert (=> mapNonEmpty!25022 m!785517))

(declare-fun m!785519 () Bool)

(assert (=> b!842391 m!785519))

(declare-fun m!785521 () Bool)

(assert (=> b!842389 m!785521))

(declare-fun m!785523 () Bool)

(assert (=> start!72564 m!785523))

(declare-fun m!785525 () Bool)

(assert (=> start!72564 m!785525))

(declare-fun m!785527 () Bool)

(assert (=> b!842390 m!785527))

(check-sat (not b!842390) (not mapNonEmpty!25022) (not b!842389) (not start!72564) (not b!842391) tp_is_empty!15615)
(check-sat)
