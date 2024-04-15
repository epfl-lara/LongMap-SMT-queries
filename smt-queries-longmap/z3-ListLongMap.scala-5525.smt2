; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72916 () Bool)

(assert start!72916)

(declare-fun b_free!13849 () Bool)

(declare-fun b_next!13849 () Bool)

(assert (=> start!72916 (= b_free!13849 (not b_next!13849))))

(declare-fun tp!49051 () Bool)

(declare-fun b_and!22909 () Bool)

(assert (=> start!72916 (= tp!49051 b_and!22909)))

(declare-fun b!846653 () Bool)

(declare-fun e!472475 () Bool)

(assert (=> b!846653 (= e!472475 false)))

(declare-datatypes ((V!26361 0))(
  ( (V!26362 (val!8040 Int)) )
))
(declare-fun v!557 () V!26361)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10530 0))(
  ( (tuple2!10531 (_1!5276 (_ BitVec 64)) (_2!5276 V!26361)) )
))
(declare-datatypes ((List!16388 0))(
  ( (Nil!16385) (Cons!16384 (h!17515 tuple2!10530) (t!22750 List!16388)) )
))
(declare-datatypes ((ListLongMap!9289 0))(
  ( (ListLongMap!9290 (toList!4660 List!16388)) )
))
(declare-fun lt!381383 () ListLongMap!9289)

(declare-datatypes ((array!48183 0))(
  ( (array!48184 (arr!23123 (Array (_ BitVec 32) (_ BitVec 64))) (size!23565 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48183)

(declare-datatypes ((ValueCell!7553 0))(
  ( (ValueCellFull!7553 (v!10459 V!26361)) (EmptyCell!7553) )
))
(declare-datatypes ((array!48185 0))(
  ( (array!48186 (arr!23124 (Array (_ BitVec 32) ValueCell!7553)) (size!23566 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48185)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26361)

(declare-fun zeroValue!654 () V!26361)

(declare-fun getCurrentListMapNoExtraKeys!2674 (array!48183 array!48185 (_ BitVec 32) (_ BitVec 32) V!26361 V!26361 (_ BitVec 32) Int) ListLongMap!9289)

(assert (=> b!846653 (= lt!381383 (getCurrentListMapNoExtraKeys!2674 _keys!868 (array!48186 (store (arr!23124 _values!688) i!612 (ValueCellFull!7553 v!557)) (size!23566 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381382 () ListLongMap!9289)

(assert (=> b!846653 (= lt!381382 (getCurrentListMapNoExtraKeys!2674 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846654 () Bool)

(declare-fun res!575292 () Bool)

(assert (=> b!846654 (=> (not res!575292) (not e!472475))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!846654 (= res!575292 (and (= (select (arr!23123 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846655 () Bool)

(declare-fun e!472478 () Bool)

(declare-fun tp_is_empty!15985 () Bool)

(assert (=> b!846655 (= e!472478 tp_is_empty!15985)))

(declare-fun res!575295 () Bool)

(assert (=> start!72916 (=> (not res!575295) (not e!472475))))

(assert (=> start!72916 (= res!575295 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23565 _keys!868))))))

(assert (=> start!72916 e!472475))

(assert (=> start!72916 tp_is_empty!15985))

(assert (=> start!72916 true))

(assert (=> start!72916 tp!49051))

(declare-fun array_inv!18440 (array!48183) Bool)

(assert (=> start!72916 (array_inv!18440 _keys!868)))

(declare-fun e!472479 () Bool)

(declare-fun array_inv!18441 (array!48185) Bool)

(assert (=> start!72916 (and (array_inv!18441 _values!688) e!472479)))

(declare-fun b!846656 () Bool)

(declare-fun res!575291 () Bool)

(assert (=> b!846656 (=> (not res!575291) (not e!472475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846656 (= res!575291 (validMask!0 mask!1196))))

(declare-fun b!846657 () Bool)

(declare-fun res!575294 () Bool)

(assert (=> b!846657 (=> (not res!575294) (not e!472475))))

(assert (=> b!846657 (= res!575294 (and (= (size!23566 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23565 _keys!868) (size!23566 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846658 () Bool)

(declare-fun res!575290 () Bool)

(assert (=> b!846658 (=> (not res!575290) (not e!472475))))

(assert (=> b!846658 (= res!575290 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23565 _keys!868))))))

(declare-fun mapIsEmpty!25577 () Bool)

(declare-fun mapRes!25577 () Bool)

(assert (=> mapIsEmpty!25577 mapRes!25577))

(declare-fun b!846659 () Bool)

(declare-fun res!575288 () Bool)

(assert (=> b!846659 (=> (not res!575288) (not e!472475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48183 (_ BitVec 32)) Bool)

(assert (=> b!846659 (= res!575288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846660 () Bool)

(declare-fun res!575293 () Bool)

(assert (=> b!846660 (=> (not res!575293) (not e!472475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846660 (= res!575293 (validKeyInArray!0 k0!854))))

(declare-fun b!846661 () Bool)

(declare-fun res!575289 () Bool)

(assert (=> b!846661 (=> (not res!575289) (not e!472475))))

(declare-datatypes ((List!16389 0))(
  ( (Nil!16386) (Cons!16385 (h!17516 (_ BitVec 64)) (t!22751 List!16389)) )
))
(declare-fun arrayNoDuplicates!0 (array!48183 (_ BitVec 32) List!16389) Bool)

(assert (=> b!846661 (= res!575289 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16386))))

(declare-fun mapNonEmpty!25577 () Bool)

(declare-fun tp!49052 () Bool)

(declare-fun e!472477 () Bool)

(assert (=> mapNonEmpty!25577 (= mapRes!25577 (and tp!49052 e!472477))))

(declare-fun mapRest!25577 () (Array (_ BitVec 32) ValueCell!7553))

(declare-fun mapKey!25577 () (_ BitVec 32))

(declare-fun mapValue!25577 () ValueCell!7553)

(assert (=> mapNonEmpty!25577 (= (arr!23124 _values!688) (store mapRest!25577 mapKey!25577 mapValue!25577))))

(declare-fun b!846662 () Bool)

(assert (=> b!846662 (= e!472479 (and e!472478 mapRes!25577))))

(declare-fun condMapEmpty!25577 () Bool)

(declare-fun mapDefault!25577 () ValueCell!7553)

(assert (=> b!846662 (= condMapEmpty!25577 (= (arr!23124 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7553)) mapDefault!25577)))))

(declare-fun b!846663 () Bool)

(assert (=> b!846663 (= e!472477 tp_is_empty!15985)))

(assert (= (and start!72916 res!575295) b!846656))

(assert (= (and b!846656 res!575291) b!846657))

(assert (= (and b!846657 res!575294) b!846659))

(assert (= (and b!846659 res!575288) b!846661))

(assert (= (and b!846661 res!575289) b!846658))

(assert (= (and b!846658 res!575290) b!846660))

(assert (= (and b!846660 res!575293) b!846654))

(assert (= (and b!846654 res!575292) b!846653))

(assert (= (and b!846662 condMapEmpty!25577) mapIsEmpty!25577))

(assert (= (and b!846662 (not condMapEmpty!25577)) mapNonEmpty!25577))

(get-info :version)

(assert (= (and mapNonEmpty!25577 ((_ is ValueCellFull!7553) mapValue!25577)) b!846663))

(assert (= (and b!846662 ((_ is ValueCellFull!7553) mapDefault!25577)) b!846655))

(assert (= start!72916 b!846662))

(declare-fun m!787385 () Bool)

(assert (=> b!846660 m!787385))

(declare-fun m!787387 () Bool)

(assert (=> b!846659 m!787387))

(declare-fun m!787389 () Bool)

(assert (=> start!72916 m!787389))

(declare-fun m!787391 () Bool)

(assert (=> start!72916 m!787391))

(declare-fun m!787393 () Bool)

(assert (=> b!846661 m!787393))

(declare-fun m!787395 () Bool)

(assert (=> b!846654 m!787395))

(declare-fun m!787397 () Bool)

(assert (=> b!846653 m!787397))

(declare-fun m!787399 () Bool)

(assert (=> b!846653 m!787399))

(declare-fun m!787401 () Bool)

(assert (=> b!846653 m!787401))

(declare-fun m!787403 () Bool)

(assert (=> mapNonEmpty!25577 m!787403))

(declare-fun m!787405 () Bool)

(assert (=> b!846656 m!787405))

(check-sat (not b!846656) (not b!846653) (not mapNonEmpty!25577) (not b!846661) (not b!846660) (not b_next!13849) (not b!846659) (not start!72916) tp_is_empty!15985 b_and!22909)
(check-sat b_and!22909 (not b_next!13849))
