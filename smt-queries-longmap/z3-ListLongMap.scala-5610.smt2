; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73446 () Bool)

(assert start!73446)

(declare-fun b_free!14361 () Bool)

(declare-fun b_next!14361 () Bool)

(assert (=> start!73446 (= b_free!14361 (not b_next!14361))))

(declare-fun tp!50587 () Bool)

(declare-fun b_and!23717 () Bool)

(assert (=> start!73446 (= tp!50587 b_and!23717)))

(declare-fun res!582590 () Bool)

(declare-fun e!477990 () Bool)

(assert (=> start!73446 (=> (not res!582590) (not e!477990))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49184 0))(
  ( (array!49185 (arr!23623 (Array (_ BitVec 32) (_ BitVec 64))) (size!24063 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49184)

(assert (=> start!73446 (= res!582590 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24063 _keys!868))))))

(assert (=> start!73446 e!477990))

(declare-fun tp_is_empty!16497 () Bool)

(assert (=> start!73446 tp_is_empty!16497))

(assert (=> start!73446 true))

(assert (=> start!73446 tp!50587))

(declare-fun array_inv!18708 (array!49184) Bool)

(assert (=> start!73446 (array_inv!18708 _keys!868)))

(declare-datatypes ((V!27043 0))(
  ( (V!27044 (val!8296 Int)) )
))
(declare-datatypes ((ValueCell!7809 0))(
  ( (ValueCellFull!7809 (v!10721 V!27043)) (EmptyCell!7809) )
))
(declare-datatypes ((array!49186 0))(
  ( (array!49187 (arr!23624 (Array (_ BitVec 32) ValueCell!7809)) (size!24064 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49186)

(declare-fun e!477989 () Bool)

(declare-fun array_inv!18709 (array!49186) Bool)

(assert (=> start!73446 (and (array_inv!18709 _values!688) e!477989)))

(declare-fun b!857622 () Bool)

(declare-fun res!582582 () Bool)

(assert (=> b!857622 (=> (not res!582582) (not e!477990))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!857622 (= res!582582 (and (= (size!24064 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24063 _keys!868) (size!24064 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857623 () Bool)

(declare-fun res!582588 () Bool)

(assert (=> b!857623 (=> (not res!582588) (not e!477990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49184 (_ BitVec 32)) Bool)

(assert (=> b!857623 (= res!582588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857624 () Bool)

(declare-fun e!477994 () Bool)

(assert (=> b!857624 (= e!477994 tp_is_empty!16497)))

(declare-fun b!857625 () Bool)

(declare-fun res!582587 () Bool)

(assert (=> b!857625 (=> (not res!582587) (not e!477990))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857625 (= res!582587 (validKeyInArray!0 k0!854))))

(declare-fun b!857626 () Bool)

(declare-fun res!582584 () Bool)

(assert (=> b!857626 (=> (not res!582584) (not e!477990))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857626 (= res!582584 (and (= (select (arr!23623 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857627 () Bool)

(declare-fun res!582583 () Bool)

(assert (=> b!857627 (=> (not res!582583) (not e!477990))))

(declare-datatypes ((List!16752 0))(
  ( (Nil!16749) (Cons!16748 (h!17879 (_ BitVec 64)) (t!23393 List!16752)) )
))
(declare-fun arrayNoDuplicates!0 (array!49184 (_ BitVec 32) List!16752) Bool)

(assert (=> b!857627 (= res!582583 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16749))))

(declare-fun b!857628 () Bool)

(declare-fun e!477993 () Bool)

(assert (=> b!857628 (= e!477990 e!477993)))

(declare-fun res!582589 () Bool)

(assert (=> b!857628 (=> (not res!582589) (not e!477993))))

(assert (=> b!857628 (= res!582589 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386351 () array!49186)

(declare-datatypes ((tuple2!10944 0))(
  ( (tuple2!10945 (_1!5483 (_ BitVec 64)) (_2!5483 V!27043)) )
))
(declare-datatypes ((List!16753 0))(
  ( (Nil!16750) (Cons!16749 (h!17880 tuple2!10944) (t!23394 List!16753)) )
))
(declare-datatypes ((ListLongMap!9713 0))(
  ( (ListLongMap!9714 (toList!4872 List!16753)) )
))
(declare-fun lt!386350 () ListLongMap!9713)

(declare-fun minValue!654 () V!27043)

(declare-fun zeroValue!654 () V!27043)

(declare-fun getCurrentListMapNoExtraKeys!2853 (array!49184 array!49186 (_ BitVec 32) (_ BitVec 32) V!27043 V!27043 (_ BitVec 32) Int) ListLongMap!9713)

(assert (=> b!857628 (= lt!386350 (getCurrentListMapNoExtraKeys!2853 _keys!868 lt!386351 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27043)

(assert (=> b!857628 (= lt!386351 (array!49187 (store (arr!23624 _values!688) i!612 (ValueCellFull!7809 v!557)) (size!24064 _values!688)))))

(declare-fun lt!386352 () ListLongMap!9713)

(assert (=> b!857628 (= lt!386352 (getCurrentListMapNoExtraKeys!2853 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857629 () Bool)

(declare-fun e!477991 () Bool)

(declare-fun mapRes!26345 () Bool)

(assert (=> b!857629 (= e!477989 (and e!477991 mapRes!26345))))

(declare-fun condMapEmpty!26345 () Bool)

(declare-fun mapDefault!26345 () ValueCell!7809)

(assert (=> b!857629 (= condMapEmpty!26345 (= (arr!23624 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7809)) mapDefault!26345)))))

(declare-fun b!857630 () Bool)

(assert (=> b!857630 (= e!477993 (not true))))

(declare-fun +!2226 (ListLongMap!9713 tuple2!10944) ListLongMap!9713)

(assert (=> b!857630 (= (getCurrentListMapNoExtraKeys!2853 _keys!868 lt!386351 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2226 (getCurrentListMapNoExtraKeys!2853 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10945 k0!854 v!557)))))

(declare-datatypes ((Unit!29239 0))(
  ( (Unit!29240) )
))
(declare-fun lt!386353 () Unit!29239)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!447 (array!49184 array!49186 (_ BitVec 32) (_ BitVec 32) V!27043 V!27043 (_ BitVec 32) (_ BitVec 64) V!27043 (_ BitVec 32) Int) Unit!29239)

(assert (=> b!857630 (= lt!386353 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!447 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857631 () Bool)

(declare-fun res!582585 () Bool)

(assert (=> b!857631 (=> (not res!582585) (not e!477990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857631 (= res!582585 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26345 () Bool)

(declare-fun tp!50586 () Bool)

(assert (=> mapNonEmpty!26345 (= mapRes!26345 (and tp!50586 e!477994))))

(declare-fun mapRest!26345 () (Array (_ BitVec 32) ValueCell!7809))

(declare-fun mapKey!26345 () (_ BitVec 32))

(declare-fun mapValue!26345 () ValueCell!7809)

(assert (=> mapNonEmpty!26345 (= (arr!23624 _values!688) (store mapRest!26345 mapKey!26345 mapValue!26345))))

(declare-fun b!857632 () Bool)

(declare-fun res!582586 () Bool)

(assert (=> b!857632 (=> (not res!582586) (not e!477990))))

(assert (=> b!857632 (= res!582586 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24063 _keys!868))))))

(declare-fun mapIsEmpty!26345 () Bool)

(assert (=> mapIsEmpty!26345 mapRes!26345))

(declare-fun b!857633 () Bool)

(assert (=> b!857633 (= e!477991 tp_is_empty!16497)))

(assert (= (and start!73446 res!582590) b!857631))

(assert (= (and b!857631 res!582585) b!857622))

(assert (= (and b!857622 res!582582) b!857623))

(assert (= (and b!857623 res!582588) b!857627))

(assert (= (and b!857627 res!582583) b!857632))

(assert (= (and b!857632 res!582586) b!857625))

(assert (= (and b!857625 res!582587) b!857626))

(assert (= (and b!857626 res!582584) b!857628))

(assert (= (and b!857628 res!582589) b!857630))

(assert (= (and b!857629 condMapEmpty!26345) mapIsEmpty!26345))

(assert (= (and b!857629 (not condMapEmpty!26345)) mapNonEmpty!26345))

(get-info :version)

(assert (= (and mapNonEmpty!26345 ((_ is ValueCellFull!7809) mapValue!26345)) b!857624))

(assert (= (and b!857629 ((_ is ValueCellFull!7809) mapDefault!26345)) b!857633))

(assert (= start!73446 b!857629))

(declare-fun m!798371 () Bool)

(assert (=> b!857626 m!798371))

(declare-fun m!798373 () Bool)

(assert (=> mapNonEmpty!26345 m!798373))

(declare-fun m!798375 () Bool)

(assert (=> b!857631 m!798375))

(declare-fun m!798377 () Bool)

(assert (=> b!857630 m!798377))

(declare-fun m!798379 () Bool)

(assert (=> b!857630 m!798379))

(assert (=> b!857630 m!798379))

(declare-fun m!798381 () Bool)

(assert (=> b!857630 m!798381))

(declare-fun m!798383 () Bool)

(assert (=> b!857630 m!798383))

(declare-fun m!798385 () Bool)

(assert (=> start!73446 m!798385))

(declare-fun m!798387 () Bool)

(assert (=> start!73446 m!798387))

(declare-fun m!798389 () Bool)

(assert (=> b!857625 m!798389))

(declare-fun m!798391 () Bool)

(assert (=> b!857628 m!798391))

(declare-fun m!798393 () Bool)

(assert (=> b!857628 m!798393))

(declare-fun m!798395 () Bool)

(assert (=> b!857628 m!798395))

(declare-fun m!798397 () Bool)

(assert (=> b!857627 m!798397))

(declare-fun m!798399 () Bool)

(assert (=> b!857623 m!798399))

(check-sat (not b!857623) b_and!23717 (not b_next!14361) (not b!857628) (not b!857625) (not b!857631) (not b!857627) (not start!73446) (not mapNonEmpty!26345) (not b!857630) tp_is_empty!16497)
(check-sat b_and!23717 (not b_next!14361))
