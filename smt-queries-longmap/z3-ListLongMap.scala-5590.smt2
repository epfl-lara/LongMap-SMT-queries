; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73492 () Bool)

(assert start!73492)

(declare-fun b_free!14239 () Bool)

(declare-fun b_next!14239 () Bool)

(assert (=> start!73492 (= b_free!14239 (not b_next!14239))))

(declare-fun tp!50222 () Bool)

(declare-fun b_and!23605 () Bool)

(assert (=> start!73492 (= tp!50222 b_and!23605)))

(declare-fun b!856372 () Bool)

(declare-fun res!581327 () Bool)

(declare-fun e!477516 () Bool)

(assert (=> b!856372 (=> (not res!581327) (not e!477516))))

(declare-datatypes ((array!48993 0))(
  ( (array!48994 (arr!23523 (Array (_ BitVec 32) (_ BitVec 64))) (size!23964 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48993)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48993 (_ BitVec 32)) Bool)

(assert (=> b!856372 (= res!581327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!581329 () Bool)

(assert (=> start!73492 (=> (not res!581329) (not e!477516))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73492 (= res!581329 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23964 _keys!868))))))

(assert (=> start!73492 e!477516))

(declare-fun tp_is_empty!16375 () Bool)

(assert (=> start!73492 tp_is_empty!16375))

(assert (=> start!73492 true))

(assert (=> start!73492 tp!50222))

(declare-fun array_inv!18688 (array!48993) Bool)

(assert (=> start!73492 (array_inv!18688 _keys!868)))

(declare-datatypes ((V!26881 0))(
  ( (V!26882 (val!8235 Int)) )
))
(declare-datatypes ((ValueCell!7748 0))(
  ( (ValueCellFull!7748 (v!10660 V!26881)) (EmptyCell!7748) )
))
(declare-datatypes ((array!48995 0))(
  ( (array!48996 (arr!23524 (Array (_ BitVec 32) ValueCell!7748)) (size!23965 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48995)

(declare-fun e!477518 () Bool)

(declare-fun array_inv!18689 (array!48995) Bool)

(assert (=> start!73492 (and (array_inv!18689 _values!688) e!477518)))

(declare-fun mapIsEmpty!26162 () Bool)

(declare-fun mapRes!26162 () Bool)

(assert (=> mapIsEmpty!26162 mapRes!26162))

(declare-fun b!856373 () Bool)

(declare-fun res!581322 () Bool)

(assert (=> b!856373 (=> (not res!581322) (not e!477516))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856373 (= res!581322 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23964 _keys!868))))))

(declare-fun b!856374 () Bool)

(declare-fun res!581326 () Bool)

(assert (=> b!856374 (=> (not res!581326) (not e!477516))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!856374 (= res!581326 (and (= (select (arr!23523 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856375 () Bool)

(assert (=> b!856375 (= e!477516 false)))

(declare-fun v!557 () V!26881)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10774 0))(
  ( (tuple2!10775 (_1!5398 (_ BitVec 64)) (_2!5398 V!26881)) )
))
(declare-datatypes ((List!16619 0))(
  ( (Nil!16616) (Cons!16615 (h!17752 tuple2!10774) (t!23252 List!16619)) )
))
(declare-datatypes ((ListLongMap!9545 0))(
  ( (ListLongMap!9546 (toList!4788 List!16619)) )
))
(declare-fun lt!386065 () ListLongMap!9545)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26881)

(declare-fun zeroValue!654 () V!26881)

(declare-fun getCurrentListMapNoExtraKeys!2844 (array!48993 array!48995 (_ BitVec 32) (_ BitVec 32) V!26881 V!26881 (_ BitVec 32) Int) ListLongMap!9545)

(assert (=> b!856375 (= lt!386065 (getCurrentListMapNoExtraKeys!2844 _keys!868 (array!48996 (store (arr!23524 _values!688) i!612 (ValueCellFull!7748 v!557)) (size!23965 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!386066 () ListLongMap!9545)

(assert (=> b!856375 (= lt!386066 (getCurrentListMapNoExtraKeys!2844 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856376 () Bool)

(declare-fun e!477520 () Bool)

(assert (=> b!856376 (= e!477520 tp_is_empty!16375)))

(declare-fun b!856377 () Bool)

(declare-fun res!581325 () Bool)

(assert (=> b!856377 (=> (not res!581325) (not e!477516))))

(declare-datatypes ((List!16620 0))(
  ( (Nil!16617) (Cons!16616 (h!17753 (_ BitVec 64)) (t!23253 List!16620)) )
))
(declare-fun arrayNoDuplicates!0 (array!48993 (_ BitVec 32) List!16620) Bool)

(assert (=> b!856377 (= res!581325 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16617))))

(declare-fun mapNonEmpty!26162 () Bool)

(declare-fun tp!50221 () Bool)

(declare-fun e!477519 () Bool)

(assert (=> mapNonEmpty!26162 (= mapRes!26162 (and tp!50221 e!477519))))

(declare-fun mapRest!26162 () (Array (_ BitVec 32) ValueCell!7748))

(declare-fun mapKey!26162 () (_ BitVec 32))

(declare-fun mapValue!26162 () ValueCell!7748)

(assert (=> mapNonEmpty!26162 (= (arr!23524 _values!688) (store mapRest!26162 mapKey!26162 mapValue!26162))))

(declare-fun b!856378 () Bool)

(declare-fun res!581323 () Bool)

(assert (=> b!856378 (=> (not res!581323) (not e!477516))))

(assert (=> b!856378 (= res!581323 (and (= (size!23965 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23964 _keys!868) (size!23965 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856379 () Bool)

(declare-fun res!581328 () Bool)

(assert (=> b!856379 (=> (not res!581328) (not e!477516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856379 (= res!581328 (validKeyInArray!0 k0!854))))

(declare-fun b!856380 () Bool)

(assert (=> b!856380 (= e!477519 tp_is_empty!16375)))

(declare-fun b!856381 () Bool)

(assert (=> b!856381 (= e!477518 (and e!477520 mapRes!26162))))

(declare-fun condMapEmpty!26162 () Bool)

(declare-fun mapDefault!26162 () ValueCell!7748)

(assert (=> b!856381 (= condMapEmpty!26162 (= (arr!23524 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7748)) mapDefault!26162)))))

(declare-fun b!856382 () Bool)

(declare-fun res!581324 () Bool)

(assert (=> b!856382 (=> (not res!581324) (not e!477516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856382 (= res!581324 (validMask!0 mask!1196))))

(assert (= (and start!73492 res!581329) b!856382))

(assert (= (and b!856382 res!581324) b!856378))

(assert (= (and b!856378 res!581323) b!856372))

(assert (= (and b!856372 res!581327) b!856377))

(assert (= (and b!856377 res!581325) b!856373))

(assert (= (and b!856373 res!581322) b!856379))

(assert (= (and b!856379 res!581328) b!856374))

(assert (= (and b!856374 res!581326) b!856375))

(assert (= (and b!856381 condMapEmpty!26162) mapIsEmpty!26162))

(assert (= (and b!856381 (not condMapEmpty!26162)) mapNonEmpty!26162))

(get-info :version)

(assert (= (and mapNonEmpty!26162 ((_ is ValueCellFull!7748) mapValue!26162)) b!856380))

(assert (= (and b!856381 ((_ is ValueCellFull!7748) mapDefault!26162)) b!856376))

(assert (= start!73492 b!856381))

(declare-fun m!797951 () Bool)

(assert (=> b!856374 m!797951))

(declare-fun m!797953 () Bool)

(assert (=> start!73492 m!797953))

(declare-fun m!797955 () Bool)

(assert (=> start!73492 m!797955))

(declare-fun m!797957 () Bool)

(assert (=> b!856372 m!797957))

(declare-fun m!797959 () Bool)

(assert (=> b!856375 m!797959))

(declare-fun m!797961 () Bool)

(assert (=> b!856375 m!797961))

(declare-fun m!797963 () Bool)

(assert (=> b!856375 m!797963))

(declare-fun m!797965 () Bool)

(assert (=> mapNonEmpty!26162 m!797965))

(declare-fun m!797967 () Bool)

(assert (=> b!856382 m!797967))

(declare-fun m!797969 () Bool)

(assert (=> b!856377 m!797969))

(declare-fun m!797971 () Bool)

(assert (=> b!856379 m!797971))

(check-sat tp_is_empty!16375 (not b!856372) (not start!73492) (not b!856377) (not mapNonEmpty!26162) (not b!856375) (not b!856379) (not b!856382) (not b_next!14239) b_and!23605)
(check-sat b_and!23605 (not b_next!14239))
