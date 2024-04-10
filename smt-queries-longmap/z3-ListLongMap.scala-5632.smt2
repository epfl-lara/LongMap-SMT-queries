; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73578 () Bool)

(assert start!73578)

(declare-fun b_free!14493 () Bool)

(declare-fun b_next!14493 () Bool)

(assert (=> start!73578 (= b_free!14493 (not b_next!14493))))

(declare-fun tp!50982 () Bool)

(declare-fun b_and!23965 () Bool)

(assert (=> start!73578 (= tp!50982 b_and!23965)))

(declare-fun b!860661 () Bool)

(declare-fun e!479574 () Bool)

(declare-fun e!479576 () Bool)

(assert (=> b!860661 (= e!479574 e!479576)))

(declare-fun res!584919 () Bool)

(assert (=> b!860661 (=> (not res!584919) (not e!479576))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860661 (= res!584919 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27219 0))(
  ( (V!27220 (val!8362 Int)) )
))
(declare-datatypes ((ValueCell!7875 0))(
  ( (ValueCellFull!7875 (v!10787 V!27219)) (EmptyCell!7875) )
))
(declare-datatypes ((array!49434 0))(
  ( (array!49435 (arr!23748 (Array (_ BitVec 32) ValueCell!7875)) (size!24188 (_ BitVec 32))) )
))
(declare-fun lt!387964 () array!49434)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49436 0))(
  ( (array!49437 (arr!23749 (Array (_ BitVec 32) (_ BitVec 64))) (size!24189 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49436)

(declare-fun minValue!654 () V!27219)

(declare-fun zeroValue!654 () V!27219)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11052 0))(
  ( (tuple2!11053 (_1!5537 (_ BitVec 64)) (_2!5537 V!27219)) )
))
(declare-datatypes ((List!16861 0))(
  ( (Nil!16858) (Cons!16857 (h!17988 tuple2!11052) (t!23620 List!16861)) )
))
(declare-datatypes ((ListLongMap!9821 0))(
  ( (ListLongMap!9822 (toList!4926 List!16861)) )
))
(declare-fun lt!387957 () ListLongMap!9821)

(declare-fun getCurrentListMapNoExtraKeys!2903 (array!49436 array!49434 (_ BitVec 32) (_ BitVec 32) V!27219 V!27219 (_ BitVec 32) Int) ListLongMap!9821)

(assert (=> b!860661 (= lt!387957 (getCurrentListMapNoExtraKeys!2903 _keys!868 lt!387964 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27219)

(declare-fun _values!688 () array!49434)

(assert (=> b!860661 (= lt!387964 (array!49435 (store (arr!23748 _values!688) i!612 (ValueCellFull!7875 v!557)) (size!24188 _values!688)))))

(declare-fun lt!387959 () ListLongMap!9821)

(assert (=> b!860661 (= lt!387959 (getCurrentListMapNoExtraKeys!2903 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860662 () Bool)

(declare-fun e!479578 () Bool)

(declare-fun e!479575 () Bool)

(assert (=> b!860662 (= e!479578 e!479575)))

(declare-fun res!584917 () Bool)

(assert (=> b!860662 (=> res!584917 e!479575)))

(assert (=> b!860662 (= res!584917 (or (bvsge (size!24189 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24189 _keys!868)) (bvsge from!1053 (size!24189 _keys!868))))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!49436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860662 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!29341 0))(
  ( (Unit!29342) )
))
(declare-fun lt!387961 () Unit!29341)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49436 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29341)

(assert (=> b!860662 (= lt!387961 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!16862 0))(
  ( (Nil!16859) (Cons!16858 (h!17989 (_ BitVec 64)) (t!23621 List!16862)) )
))
(declare-fun arrayNoDuplicates!0 (array!49436 (_ BitVec 32) List!16862) Bool)

(assert (=> b!860662 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16859)))

(declare-fun lt!387960 () Unit!29341)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49436 (_ BitVec 32) (_ BitVec 32)) Unit!29341)

(assert (=> b!860662 (= lt!387960 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860663 () Bool)

(declare-fun e!479571 () Bool)

(declare-fun tp_is_empty!16629 () Bool)

(assert (=> b!860663 (= e!479571 tp_is_empty!16629)))

(declare-fun mapIsEmpty!26543 () Bool)

(declare-fun mapRes!26543 () Bool)

(assert (=> mapIsEmpty!26543 mapRes!26543))

(declare-fun mapNonEmpty!26543 () Bool)

(declare-fun tp!50983 () Bool)

(declare-fun e!479572 () Bool)

(assert (=> mapNonEmpty!26543 (= mapRes!26543 (and tp!50983 e!479572))))

(declare-fun mapRest!26543 () (Array (_ BitVec 32) ValueCell!7875))

(declare-fun mapKey!26543 () (_ BitVec 32))

(declare-fun mapValue!26543 () ValueCell!7875)

(assert (=> mapNonEmpty!26543 (= (arr!23748 _values!688) (store mapRest!26543 mapKey!26543 mapValue!26543))))

(declare-fun b!860664 () Bool)

(declare-fun res!584911 () Bool)

(assert (=> b!860664 (=> (not res!584911) (not e!479574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49436 (_ BitVec 32)) Bool)

(assert (=> b!860664 (= res!584911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860665 () Bool)

(assert (=> b!860665 (= e!479572 tp_is_empty!16629)))

(declare-fun b!860666 () Bool)

(declare-fun e!479570 () Bool)

(assert (=> b!860666 (= e!479570 e!479578)))

(declare-fun res!584916 () Bool)

(assert (=> b!860666 (=> res!584916 e!479578)))

(assert (=> b!860666 (= res!584916 (not (= (select (arr!23749 _keys!868) from!1053) k0!854)))))

(declare-fun lt!387962 () ListLongMap!9821)

(declare-fun +!2278 (ListLongMap!9821 tuple2!11052) ListLongMap!9821)

(declare-fun get!12522 (ValueCell!7875 V!27219) V!27219)

(declare-fun dynLambda!1114 (Int (_ BitVec 64)) V!27219)

(assert (=> b!860666 (= lt!387957 (+!2278 lt!387962 (tuple2!11053 (select (arr!23749 _keys!868) from!1053) (get!12522 (select (arr!23748 _values!688) from!1053) (dynLambda!1114 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860667 () Bool)

(declare-fun res!584914 () Bool)

(assert (=> b!860667 (=> res!584914 e!479575)))

(declare-fun contains!4238 (List!16862 (_ BitVec 64)) Bool)

(assert (=> b!860667 (= res!584914 (contains!4238 Nil!16859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860668 () Bool)

(declare-fun res!584924 () Bool)

(assert (=> b!860668 (=> (not res!584924) (not e!479574))))

(assert (=> b!860668 (= res!584924 (and (= (size!24188 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24189 _keys!868) (size!24188 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860669 () Bool)

(declare-fun res!584923 () Bool)

(assert (=> b!860669 (=> (not res!584923) (not e!479574))))

(assert (=> b!860669 (= res!584923 (and (= (select (arr!23749 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860670 () Bool)

(declare-fun res!584912 () Bool)

(assert (=> b!860670 (=> res!584912 e!479575)))

(declare-fun noDuplicate!1318 (List!16862) Bool)

(assert (=> b!860670 (= res!584912 (not (noDuplicate!1318 Nil!16859)))))

(declare-fun b!860671 () Bool)

(declare-fun e!479577 () Bool)

(assert (=> b!860671 (= e!479577 (and e!479571 mapRes!26543))))

(declare-fun condMapEmpty!26543 () Bool)

(declare-fun mapDefault!26543 () ValueCell!7875)

(assert (=> b!860671 (= condMapEmpty!26543 (= (arr!23748 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7875)) mapDefault!26543)))))

(declare-fun res!584915 () Bool)

(assert (=> start!73578 (=> (not res!584915) (not e!479574))))

(assert (=> start!73578 (= res!584915 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24189 _keys!868))))))

(assert (=> start!73578 e!479574))

(assert (=> start!73578 tp_is_empty!16629))

(assert (=> start!73578 true))

(assert (=> start!73578 tp!50982))

(declare-fun array_inv!18800 (array!49436) Bool)

(assert (=> start!73578 (array_inv!18800 _keys!868)))

(declare-fun array_inv!18801 (array!49434) Bool)

(assert (=> start!73578 (and (array_inv!18801 _values!688) e!479577)))

(declare-fun b!860672 () Bool)

(assert (=> b!860672 (= e!479576 (not e!479570))))

(declare-fun res!584921 () Bool)

(assert (=> b!860672 (=> res!584921 e!479570)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860672 (= res!584921 (not (validKeyInArray!0 (select (arr!23749 _keys!868) from!1053))))))

(declare-fun lt!387958 () ListLongMap!9821)

(assert (=> b!860672 (= lt!387958 lt!387962)))

(declare-fun lt!387956 () ListLongMap!9821)

(assert (=> b!860672 (= lt!387962 (+!2278 lt!387956 (tuple2!11053 k0!854 v!557)))))

(assert (=> b!860672 (= lt!387958 (getCurrentListMapNoExtraKeys!2903 _keys!868 lt!387964 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860672 (= lt!387956 (getCurrentListMapNoExtraKeys!2903 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387963 () Unit!29341)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!490 (array!49436 array!49434 (_ BitVec 32) (_ BitVec 32) V!27219 V!27219 (_ BitVec 32) (_ BitVec 64) V!27219 (_ BitVec 32) Int) Unit!29341)

(assert (=> b!860672 (= lt!387963 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!490 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860673 () Bool)

(declare-fun res!584922 () Bool)

(assert (=> b!860673 (=> (not res!584922) (not e!479574))))

(assert (=> b!860673 (= res!584922 (validKeyInArray!0 k0!854))))

(declare-fun b!860674 () Bool)

(declare-fun res!584913 () Bool)

(assert (=> b!860674 (=> (not res!584913) (not e!479574))))

(assert (=> b!860674 (= res!584913 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24189 _keys!868))))))

(declare-fun b!860675 () Bool)

(declare-fun res!584918 () Bool)

(assert (=> b!860675 (=> (not res!584918) (not e!479574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860675 (= res!584918 (validMask!0 mask!1196))))

(declare-fun b!860676 () Bool)

(declare-fun res!584920 () Bool)

(assert (=> b!860676 (=> (not res!584920) (not e!479574))))

(assert (=> b!860676 (= res!584920 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16859))))

(declare-fun b!860677 () Bool)

(assert (=> b!860677 (= e!479575 true)))

(declare-fun lt!387955 () Bool)

(assert (=> b!860677 (= lt!387955 (contains!4238 Nil!16859 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!73578 res!584915) b!860675))

(assert (= (and b!860675 res!584918) b!860668))

(assert (= (and b!860668 res!584924) b!860664))

(assert (= (and b!860664 res!584911) b!860676))

(assert (= (and b!860676 res!584920) b!860674))

(assert (= (and b!860674 res!584913) b!860673))

(assert (= (and b!860673 res!584922) b!860669))

(assert (= (and b!860669 res!584923) b!860661))

(assert (= (and b!860661 res!584919) b!860672))

(assert (= (and b!860672 (not res!584921)) b!860666))

(assert (= (and b!860666 (not res!584916)) b!860662))

(assert (= (and b!860662 (not res!584917)) b!860670))

(assert (= (and b!860670 (not res!584912)) b!860667))

(assert (= (and b!860667 (not res!584914)) b!860677))

(assert (= (and b!860671 condMapEmpty!26543) mapIsEmpty!26543))

(assert (= (and b!860671 (not condMapEmpty!26543)) mapNonEmpty!26543))

(get-info :version)

(assert (= (and mapNonEmpty!26543 ((_ is ValueCellFull!7875) mapValue!26543)) b!860665))

(assert (= (and b!860671 ((_ is ValueCellFull!7875) mapDefault!26543)) b!860663))

(assert (= start!73578 b!860671))

(declare-fun b_lambda!11845 () Bool)

(assert (=> (not b_lambda!11845) (not b!860666)))

(declare-fun t!23619 () Bool)

(declare-fun tb!4615 () Bool)

(assert (=> (and start!73578 (= defaultEntry!696 defaultEntry!696) t!23619) tb!4615))

(declare-fun result!8841 () Bool)

(assert (=> tb!4615 (= result!8841 tp_is_empty!16629)))

(assert (=> b!860666 t!23619))

(declare-fun b_and!23967 () Bool)

(assert (= b_and!23965 (and (=> t!23619 result!8841) b_and!23967)))

(declare-fun m!801481 () Bool)

(assert (=> b!860662 m!801481))

(declare-fun m!801483 () Bool)

(assert (=> b!860662 m!801483))

(declare-fun m!801485 () Bool)

(assert (=> b!860662 m!801485))

(declare-fun m!801487 () Bool)

(assert (=> b!860662 m!801487))

(declare-fun m!801489 () Bool)

(assert (=> b!860670 m!801489))

(declare-fun m!801491 () Bool)

(assert (=> start!73578 m!801491))

(declare-fun m!801493 () Bool)

(assert (=> start!73578 m!801493))

(declare-fun m!801495 () Bool)

(assert (=> b!860666 m!801495))

(declare-fun m!801497 () Bool)

(assert (=> b!860666 m!801497))

(declare-fun m!801499 () Bool)

(assert (=> b!860666 m!801499))

(declare-fun m!801501 () Bool)

(assert (=> b!860666 m!801501))

(assert (=> b!860666 m!801497))

(declare-fun m!801503 () Bool)

(assert (=> b!860666 m!801503))

(assert (=> b!860666 m!801499))

(declare-fun m!801505 () Bool)

(assert (=> b!860672 m!801505))

(declare-fun m!801507 () Bool)

(assert (=> b!860672 m!801507))

(assert (=> b!860672 m!801503))

(declare-fun m!801509 () Bool)

(assert (=> b!860672 m!801509))

(assert (=> b!860672 m!801503))

(declare-fun m!801511 () Bool)

(assert (=> b!860672 m!801511))

(declare-fun m!801513 () Bool)

(assert (=> b!860672 m!801513))

(declare-fun m!801515 () Bool)

(assert (=> b!860676 m!801515))

(declare-fun m!801517 () Bool)

(assert (=> b!860661 m!801517))

(declare-fun m!801519 () Bool)

(assert (=> b!860661 m!801519))

(declare-fun m!801521 () Bool)

(assert (=> b!860661 m!801521))

(declare-fun m!801523 () Bool)

(assert (=> b!860664 m!801523))

(declare-fun m!801525 () Bool)

(assert (=> b!860677 m!801525))

(declare-fun m!801527 () Bool)

(assert (=> mapNonEmpty!26543 m!801527))

(declare-fun m!801529 () Bool)

(assert (=> b!860675 m!801529))

(declare-fun m!801531 () Bool)

(assert (=> b!860667 m!801531))

(declare-fun m!801533 () Bool)

(assert (=> b!860669 m!801533))

(declare-fun m!801535 () Bool)

(assert (=> b!860673 m!801535))

(check-sat (not b!860672) (not b_lambda!11845) (not b!860661) (not b!860662) (not b!860670) (not mapNonEmpty!26543) (not b!860664) (not start!73578) tp_is_empty!16629 (not b!860675) (not b!860673) (not b!860666) (not b!860677) b_and!23967 (not b_next!14493) (not b!860676) (not b!860667))
(check-sat b_and!23967 (not b_next!14493))
