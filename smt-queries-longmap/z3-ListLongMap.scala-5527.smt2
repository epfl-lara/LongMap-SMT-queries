; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72928 () Bool)

(assert start!72928)

(declare-fun b_free!13861 () Bool)

(declare-fun b_next!13861 () Bool)

(assert (=> start!72928 (= b_free!13861 (not b_next!13861))))

(declare-fun tp!49087 () Bool)

(declare-fun b_and!22921 () Bool)

(assert (=> start!72928 (= tp!49087 b_and!22921)))

(declare-fun b!846851 () Bool)

(declare-fun res!575437 () Bool)

(declare-fun e!472568 () Bool)

(assert (=> b!846851 (=> (not res!575437) (not e!472568))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48203 0))(
  ( (array!48204 (arr!23133 (Array (_ BitVec 32) (_ BitVec 64))) (size!23575 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48203)

(assert (=> b!846851 (= res!575437 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23575 _keys!868))))))

(declare-fun b!846852 () Bool)

(declare-fun res!575439 () Bool)

(assert (=> b!846852 (=> (not res!575439) (not e!472568))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26377 0))(
  ( (V!26378 (val!8046 Int)) )
))
(declare-datatypes ((ValueCell!7559 0))(
  ( (ValueCellFull!7559 (v!10465 V!26377)) (EmptyCell!7559) )
))
(declare-datatypes ((array!48205 0))(
  ( (array!48206 (arr!23134 (Array (_ BitVec 32) ValueCell!7559)) (size!23576 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48205)

(assert (=> b!846852 (= res!575439 (and (= (size!23576 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23575 _keys!868) (size!23576 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846853 () Bool)

(declare-fun res!575435 () Bool)

(assert (=> b!846853 (=> (not res!575435) (not e!472568))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!846853 (= res!575435 (and (= (select (arr!23133 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846854 () Bool)

(declare-fun res!575432 () Bool)

(assert (=> b!846854 (=> (not res!575432) (not e!472568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846854 (= res!575432 (validMask!0 mask!1196))))

(declare-fun b!846855 () Bool)

(declare-fun e!472565 () Bool)

(declare-fun e!472567 () Bool)

(declare-fun mapRes!25595 () Bool)

(assert (=> b!846855 (= e!472565 (and e!472567 mapRes!25595))))

(declare-fun condMapEmpty!25595 () Bool)

(declare-fun mapDefault!25595 () ValueCell!7559)

(assert (=> b!846855 (= condMapEmpty!25595 (= (arr!23134 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7559)) mapDefault!25595)))))

(declare-fun mapIsEmpty!25595 () Bool)

(assert (=> mapIsEmpty!25595 mapRes!25595))

(declare-fun b!846856 () Bool)

(declare-fun res!575436 () Bool)

(assert (=> b!846856 (=> (not res!575436) (not e!472568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846856 (= res!575436 (validKeyInArray!0 k0!854))))

(declare-fun b!846858 () Bool)

(assert (=> b!846858 (= e!472568 false)))

(declare-fun v!557 () V!26377)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10538 0))(
  ( (tuple2!10539 (_1!5280 (_ BitVec 64)) (_2!5280 V!26377)) )
))
(declare-datatypes ((List!16395 0))(
  ( (Nil!16392) (Cons!16391 (h!17522 tuple2!10538) (t!22757 List!16395)) )
))
(declare-datatypes ((ListLongMap!9297 0))(
  ( (ListLongMap!9298 (toList!4664 List!16395)) )
))
(declare-fun lt!381418 () ListLongMap!9297)

(declare-fun minValue!654 () V!26377)

(declare-fun zeroValue!654 () V!26377)

(declare-fun getCurrentListMapNoExtraKeys!2678 (array!48203 array!48205 (_ BitVec 32) (_ BitVec 32) V!26377 V!26377 (_ BitVec 32) Int) ListLongMap!9297)

(assert (=> b!846858 (= lt!381418 (getCurrentListMapNoExtraKeys!2678 _keys!868 (array!48206 (store (arr!23134 _values!688) i!612 (ValueCellFull!7559 v!557)) (size!23576 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381419 () ListLongMap!9297)

(assert (=> b!846858 (= lt!381419 (getCurrentListMapNoExtraKeys!2678 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25595 () Bool)

(declare-fun tp!49088 () Bool)

(declare-fun e!472569 () Bool)

(assert (=> mapNonEmpty!25595 (= mapRes!25595 (and tp!49088 e!472569))))

(declare-fun mapRest!25595 () (Array (_ BitVec 32) ValueCell!7559))

(declare-fun mapValue!25595 () ValueCell!7559)

(declare-fun mapKey!25595 () (_ BitVec 32))

(assert (=> mapNonEmpty!25595 (= (arr!23134 _values!688) (store mapRest!25595 mapKey!25595 mapValue!25595))))

(declare-fun b!846859 () Bool)

(declare-fun tp_is_empty!15997 () Bool)

(assert (=> b!846859 (= e!472567 tp_is_empty!15997)))

(declare-fun b!846860 () Bool)

(assert (=> b!846860 (= e!472569 tp_is_empty!15997)))

(declare-fun b!846861 () Bool)

(declare-fun res!575433 () Bool)

(assert (=> b!846861 (=> (not res!575433) (not e!472568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48203 (_ BitVec 32)) Bool)

(assert (=> b!846861 (= res!575433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846857 () Bool)

(declare-fun res!575434 () Bool)

(assert (=> b!846857 (=> (not res!575434) (not e!472568))))

(declare-datatypes ((List!16396 0))(
  ( (Nil!16393) (Cons!16392 (h!17523 (_ BitVec 64)) (t!22758 List!16396)) )
))
(declare-fun arrayNoDuplicates!0 (array!48203 (_ BitVec 32) List!16396) Bool)

(assert (=> b!846857 (= res!575434 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16393))))

(declare-fun res!575438 () Bool)

(assert (=> start!72928 (=> (not res!575438) (not e!472568))))

(assert (=> start!72928 (= res!575438 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23575 _keys!868))))))

(assert (=> start!72928 e!472568))

(assert (=> start!72928 tp_is_empty!15997))

(assert (=> start!72928 true))

(assert (=> start!72928 tp!49087))

(declare-fun array_inv!18448 (array!48203) Bool)

(assert (=> start!72928 (array_inv!18448 _keys!868)))

(declare-fun array_inv!18449 (array!48205) Bool)

(assert (=> start!72928 (and (array_inv!18449 _values!688) e!472565)))

(assert (= (and start!72928 res!575438) b!846854))

(assert (= (and b!846854 res!575432) b!846852))

(assert (= (and b!846852 res!575439) b!846861))

(assert (= (and b!846861 res!575433) b!846857))

(assert (= (and b!846857 res!575434) b!846851))

(assert (= (and b!846851 res!575437) b!846856))

(assert (= (and b!846856 res!575436) b!846853))

(assert (= (and b!846853 res!575435) b!846858))

(assert (= (and b!846855 condMapEmpty!25595) mapIsEmpty!25595))

(assert (= (and b!846855 (not condMapEmpty!25595)) mapNonEmpty!25595))

(get-info :version)

(assert (= (and mapNonEmpty!25595 ((_ is ValueCellFull!7559) mapValue!25595)) b!846860))

(assert (= (and b!846855 ((_ is ValueCellFull!7559) mapDefault!25595)) b!846859))

(assert (= start!72928 b!846855))

(declare-fun m!787517 () Bool)

(assert (=> b!846853 m!787517))

(declare-fun m!787519 () Bool)

(assert (=> mapNonEmpty!25595 m!787519))

(declare-fun m!787521 () Bool)

(assert (=> start!72928 m!787521))

(declare-fun m!787523 () Bool)

(assert (=> start!72928 m!787523))

(declare-fun m!787525 () Bool)

(assert (=> b!846857 m!787525))

(declare-fun m!787527 () Bool)

(assert (=> b!846856 m!787527))

(declare-fun m!787529 () Bool)

(assert (=> b!846861 m!787529))

(declare-fun m!787531 () Bool)

(assert (=> b!846858 m!787531))

(declare-fun m!787533 () Bool)

(assert (=> b!846858 m!787533))

(declare-fun m!787535 () Bool)

(assert (=> b!846858 m!787535))

(declare-fun m!787537 () Bool)

(assert (=> b!846854 m!787537))

(check-sat b_and!22921 (not start!72928) (not b!846856) (not mapNonEmpty!25595) (not b_next!13861) tp_is_empty!15997 (not b!846857) (not b!846854) (not b!846861) (not b!846858))
(check-sat b_and!22921 (not b_next!13861))
