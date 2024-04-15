; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73426 () Bool)

(assert start!73426)

(declare-fun b_free!14359 () Bool)

(declare-fun b_next!14359 () Bool)

(assert (=> start!73426 (= b_free!14359 (not b_next!14359))))

(declare-fun tp!50581 () Bool)

(declare-fun b_and!23689 () Bool)

(assert (=> start!73426 (= tp!50581 b_and!23689)))

(declare-fun b!857347 () Bool)

(declare-fun e!477827 () Bool)

(assert (=> b!857347 (= e!477827 (not true))))

(declare-datatypes ((V!27041 0))(
  ( (V!27042 (val!8295 Int)) )
))
(declare-datatypes ((ValueCell!7808 0))(
  ( (ValueCellFull!7808 (v!10714 V!27041)) (EmptyCell!7808) )
))
(declare-datatypes ((array!49159 0))(
  ( (array!49160 (arr!23611 (Array (_ BitVec 32) ValueCell!7808)) (size!24053 (_ BitVec 32))) )
))
(declare-fun lt!386104 () array!49159)

(declare-fun v!557 () V!27041)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49161 0))(
  ( (array!49162 (arr!23612 (Array (_ BitVec 32) (_ BitVec 64))) (size!24054 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49161)

(declare-fun _values!688 () array!49159)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27041)

(declare-fun zeroValue!654 () V!27041)

(declare-datatypes ((tuple2!10948 0))(
  ( (tuple2!10949 (_1!5485 (_ BitVec 64)) (_2!5485 V!27041)) )
))
(declare-datatypes ((List!16753 0))(
  ( (Nil!16750) (Cons!16749 (h!17880 tuple2!10948) (t!23385 List!16753)) )
))
(declare-datatypes ((ListLongMap!9707 0))(
  ( (ListLongMap!9708 (toList!4869 List!16753)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2876 (array!49161 array!49159 (_ BitVec 32) (_ BitVec 32) V!27041 V!27041 (_ BitVec 32) Int) ListLongMap!9707)

(declare-fun +!2245 (ListLongMap!9707 tuple2!10948) ListLongMap!9707)

(assert (=> b!857347 (= (getCurrentListMapNoExtraKeys!2876 _keys!868 lt!386104 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2245 (getCurrentListMapNoExtraKeys!2876 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10949 k0!854 v!557)))))

(declare-datatypes ((Unit!29159 0))(
  ( (Unit!29160) )
))
(declare-fun lt!386103 () Unit!29159)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!442 (array!49161 array!49159 (_ BitVec 32) (_ BitVec 32) V!27041 V!27041 (_ BitVec 32) (_ BitVec 64) V!27041 (_ BitVec 32) Int) Unit!29159)

(assert (=> b!857347 (= lt!386103 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!442 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857348 () Bool)

(declare-fun e!477828 () Bool)

(declare-fun tp_is_empty!16495 () Bool)

(assert (=> b!857348 (= e!477828 tp_is_empty!16495)))

(declare-fun b!857349 () Bool)

(declare-fun res!582447 () Bool)

(declare-fun e!477826 () Bool)

(assert (=> b!857349 (=> (not res!582447) (not e!477826))))

(assert (=> b!857349 (= res!582447 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24054 _keys!868))))))

(declare-fun b!857351 () Bool)

(declare-fun res!582445 () Bool)

(assert (=> b!857351 (=> (not res!582445) (not e!477826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857351 (= res!582445 (validKeyInArray!0 k0!854))))

(declare-fun b!857352 () Bool)

(assert (=> b!857352 (= e!477826 e!477827)))

(declare-fun res!582450 () Bool)

(assert (=> b!857352 (=> (not res!582450) (not e!477827))))

(assert (=> b!857352 (= res!582450 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386102 () ListLongMap!9707)

(assert (=> b!857352 (= lt!386102 (getCurrentListMapNoExtraKeys!2876 _keys!868 lt!386104 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857352 (= lt!386104 (array!49160 (store (arr!23611 _values!688) i!612 (ValueCellFull!7808 v!557)) (size!24053 _values!688)))))

(declare-fun lt!386105 () ListLongMap!9707)

(assert (=> b!857352 (= lt!386105 (getCurrentListMapNoExtraKeys!2876 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857353 () Bool)

(declare-fun e!477824 () Bool)

(assert (=> b!857353 (= e!477824 tp_is_empty!16495)))

(declare-fun b!857354 () Bool)

(declare-fun res!582448 () Bool)

(assert (=> b!857354 (=> (not res!582448) (not e!477826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857354 (= res!582448 (validMask!0 mask!1196))))

(declare-fun b!857355 () Bool)

(declare-fun res!582453 () Bool)

(assert (=> b!857355 (=> (not res!582453) (not e!477826))))

(assert (=> b!857355 (= res!582453 (and (= (size!24053 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24054 _keys!868) (size!24053 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26342 () Bool)

(declare-fun mapRes!26342 () Bool)

(declare-fun tp!50582 () Bool)

(assert (=> mapNonEmpty!26342 (= mapRes!26342 (and tp!50582 e!477828))))

(declare-fun mapRest!26342 () (Array (_ BitVec 32) ValueCell!7808))

(declare-fun mapValue!26342 () ValueCell!7808)

(declare-fun mapKey!26342 () (_ BitVec 32))

(assert (=> mapNonEmpty!26342 (= (arr!23611 _values!688) (store mapRest!26342 mapKey!26342 mapValue!26342))))

(declare-fun b!857356 () Bool)

(declare-fun e!477823 () Bool)

(assert (=> b!857356 (= e!477823 (and e!477824 mapRes!26342))))

(declare-fun condMapEmpty!26342 () Bool)

(declare-fun mapDefault!26342 () ValueCell!7808)

(assert (=> b!857356 (= condMapEmpty!26342 (= (arr!23611 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7808)) mapDefault!26342)))))

(declare-fun b!857357 () Bool)

(declare-fun res!582452 () Bool)

(assert (=> b!857357 (=> (not res!582452) (not e!477826))))

(assert (=> b!857357 (= res!582452 (and (= (select (arr!23612 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857350 () Bool)

(declare-fun res!582451 () Bool)

(assert (=> b!857350 (=> (not res!582451) (not e!477826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49161 (_ BitVec 32)) Bool)

(assert (=> b!857350 (= res!582451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!582449 () Bool)

(assert (=> start!73426 (=> (not res!582449) (not e!477826))))

(assert (=> start!73426 (= res!582449 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24054 _keys!868))))))

(assert (=> start!73426 e!477826))

(assert (=> start!73426 tp_is_empty!16495))

(assert (=> start!73426 true))

(assert (=> start!73426 tp!50581))

(declare-fun array_inv!18764 (array!49161) Bool)

(assert (=> start!73426 (array_inv!18764 _keys!868)))

(declare-fun array_inv!18765 (array!49159) Bool)

(assert (=> start!73426 (and (array_inv!18765 _values!688) e!477823)))

(declare-fun mapIsEmpty!26342 () Bool)

(assert (=> mapIsEmpty!26342 mapRes!26342))

(declare-fun b!857358 () Bool)

(declare-fun res!582446 () Bool)

(assert (=> b!857358 (=> (not res!582446) (not e!477826))))

(declare-datatypes ((List!16754 0))(
  ( (Nil!16751) (Cons!16750 (h!17881 (_ BitVec 64)) (t!23386 List!16754)) )
))
(declare-fun arrayNoDuplicates!0 (array!49161 (_ BitVec 32) List!16754) Bool)

(assert (=> b!857358 (= res!582446 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16751))))

(assert (= (and start!73426 res!582449) b!857354))

(assert (= (and b!857354 res!582448) b!857355))

(assert (= (and b!857355 res!582453) b!857350))

(assert (= (and b!857350 res!582451) b!857358))

(assert (= (and b!857358 res!582446) b!857349))

(assert (= (and b!857349 res!582447) b!857351))

(assert (= (and b!857351 res!582445) b!857357))

(assert (= (and b!857357 res!582452) b!857352))

(assert (= (and b!857352 res!582450) b!857347))

(assert (= (and b!857356 condMapEmpty!26342) mapIsEmpty!26342))

(assert (= (and b!857356 (not condMapEmpty!26342)) mapNonEmpty!26342))

(get-info :version)

(assert (= (and mapNonEmpty!26342 ((_ is ValueCellFull!7808) mapValue!26342)) b!857348))

(assert (= (and b!857356 ((_ is ValueCellFull!7808) mapDefault!26342)) b!857353))

(assert (= start!73426 b!857356))

(declare-fun m!797583 () Bool)

(assert (=> b!857351 m!797583))

(declare-fun m!797585 () Bool)

(assert (=> b!857352 m!797585))

(declare-fun m!797587 () Bool)

(assert (=> b!857352 m!797587))

(declare-fun m!797589 () Bool)

(assert (=> b!857352 m!797589))

(declare-fun m!797591 () Bool)

(assert (=> b!857358 m!797591))

(declare-fun m!797593 () Bool)

(assert (=> b!857357 m!797593))

(declare-fun m!797595 () Bool)

(assert (=> b!857354 m!797595))

(declare-fun m!797597 () Bool)

(assert (=> b!857347 m!797597))

(declare-fun m!797599 () Bool)

(assert (=> b!857347 m!797599))

(assert (=> b!857347 m!797599))

(declare-fun m!797601 () Bool)

(assert (=> b!857347 m!797601))

(declare-fun m!797603 () Bool)

(assert (=> b!857347 m!797603))

(declare-fun m!797605 () Bool)

(assert (=> mapNonEmpty!26342 m!797605))

(declare-fun m!797607 () Bool)

(assert (=> b!857350 m!797607))

(declare-fun m!797609 () Bool)

(assert (=> start!73426 m!797609))

(declare-fun m!797611 () Bool)

(assert (=> start!73426 m!797611))

(check-sat (not b_next!14359) (not b!857352) (not b!857351) (not mapNonEmpty!26342) (not b!857350) (not b!857358) (not b!857354) (not b!857347) b_and!23689 (not start!73426) tp_is_empty!16495)
(check-sat b_and!23689 (not b_next!14359))
