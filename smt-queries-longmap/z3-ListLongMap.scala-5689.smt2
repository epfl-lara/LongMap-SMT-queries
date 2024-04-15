; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73900 () Bool)

(assert start!73900)

(declare-fun b_free!14833 () Bool)

(declare-fun b_next!14833 () Bool)

(assert (=> start!73900 (= b_free!14833 (not b_next!14833))))

(declare-fun tp!52004 () Bool)

(declare-fun b_and!24559 () Bool)

(assert (=> start!73900 (= tp!52004 b_and!24559)))

(declare-fun b!868408 () Bool)

(declare-fun e!483646 () Bool)

(declare-fun tp_is_empty!16969 () Bool)

(assert (=> b!868408 (= e!483646 tp_is_empty!16969)))

(declare-fun b!868409 () Bool)

(declare-fun e!483648 () Bool)

(assert (=> b!868409 (= e!483648 (not true))))

(declare-datatypes ((V!27673 0))(
  ( (V!27674 (val!8532 Int)) )
))
(declare-fun v!557 () V!27673)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8045 0))(
  ( (ValueCellFull!8045 (v!10951 V!27673)) (EmptyCell!8045) )
))
(declare-datatypes ((array!50083 0))(
  ( (array!50084 (arr!24073 (Array (_ BitVec 32) ValueCell!8045)) (size!24515 (_ BitVec 32))) )
))
(declare-fun lt!394303 () array!50083)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50085 0))(
  ( (array!50086 (arr!24074 (Array (_ BitVec 32) (_ BitVec 64))) (size!24516 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50085)

(declare-fun _values!688 () array!50083)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27673)

(declare-fun zeroValue!654 () V!27673)

(declare-datatypes ((tuple2!11348 0))(
  ( (tuple2!11349 (_1!5685 (_ BitVec 64)) (_2!5685 V!27673)) )
))
(declare-datatypes ((List!17134 0))(
  ( (Nil!17131) (Cons!17130 (h!18261 tuple2!11348) (t!24162 List!17134)) )
))
(declare-datatypes ((ListLongMap!10107 0))(
  ( (ListLongMap!10108 (toList!5069 List!17134)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3062 (array!50085 array!50083 (_ BitVec 32) (_ BitVec 32) V!27673 V!27673 (_ BitVec 32) Int) ListLongMap!10107)

(declare-fun +!2432 (ListLongMap!10107 tuple2!11348) ListLongMap!10107)

(assert (=> b!868409 (= (getCurrentListMapNoExtraKeys!3062 _keys!868 lt!394303 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2432 (getCurrentListMapNoExtraKeys!3062 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11349 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29751 0))(
  ( (Unit!29752) )
))
(declare-fun lt!394304 () Unit!29751)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!600 (array!50085 array!50083 (_ BitVec 32) (_ BitVec 32) V!27673 V!27673 (_ BitVec 32) (_ BitVec 64) V!27673 (_ BitVec 32) Int) Unit!29751)

(assert (=> b!868409 (= lt!394304 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!600 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868410 () Bool)

(declare-fun e!483650 () Bool)

(assert (=> b!868410 (= e!483650 tp_is_empty!16969)))

(declare-fun b!868411 () Bool)

(declare-fun res!590150 () Bool)

(declare-fun e!483649 () Bool)

(assert (=> b!868411 (=> (not res!590150) (not e!483649))))

(declare-datatypes ((List!17135 0))(
  ( (Nil!17132) (Cons!17131 (h!18262 (_ BitVec 64)) (t!24163 List!17135)) )
))
(declare-fun arrayNoDuplicates!0 (array!50085 (_ BitVec 32) List!17135) Bool)

(assert (=> b!868411 (= res!590150 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17132))))

(declare-fun mapIsEmpty!27053 () Bool)

(declare-fun mapRes!27053 () Bool)

(assert (=> mapIsEmpty!27053 mapRes!27053))

(declare-fun b!868412 () Bool)

(declare-fun res!590156 () Bool)

(assert (=> b!868412 (=> (not res!590156) (not e!483649))))

(assert (=> b!868412 (= res!590156 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24516 _keys!868))))))

(declare-fun b!868413 () Bool)

(declare-fun res!590152 () Bool)

(assert (=> b!868413 (=> (not res!590152) (not e!483649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868413 (= res!590152 (validMask!0 mask!1196))))

(declare-fun b!868414 () Bool)

(declare-fun e!483647 () Bool)

(assert (=> b!868414 (= e!483647 (and e!483650 mapRes!27053))))

(declare-fun condMapEmpty!27053 () Bool)

(declare-fun mapDefault!27053 () ValueCell!8045)

(assert (=> b!868414 (= condMapEmpty!27053 (= (arr!24073 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8045)) mapDefault!27053)))))

(declare-fun b!868415 () Bool)

(declare-fun res!590157 () Bool)

(assert (=> b!868415 (=> (not res!590157) (not e!483649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868415 (= res!590157 (validKeyInArray!0 k0!854))))

(declare-fun b!868416 () Bool)

(assert (=> b!868416 (= e!483649 e!483648)))

(declare-fun res!590155 () Bool)

(assert (=> b!868416 (=> (not res!590155) (not e!483648))))

(assert (=> b!868416 (= res!590155 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394302 () ListLongMap!10107)

(assert (=> b!868416 (= lt!394302 (getCurrentListMapNoExtraKeys!3062 _keys!868 lt!394303 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868416 (= lt!394303 (array!50084 (store (arr!24073 _values!688) i!612 (ValueCellFull!8045 v!557)) (size!24515 _values!688)))))

(declare-fun lt!394301 () ListLongMap!10107)

(assert (=> b!868416 (= lt!394301 (getCurrentListMapNoExtraKeys!3062 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!590154 () Bool)

(assert (=> start!73900 (=> (not res!590154) (not e!483649))))

(assert (=> start!73900 (= res!590154 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24516 _keys!868))))))

(assert (=> start!73900 e!483649))

(assert (=> start!73900 tp_is_empty!16969))

(assert (=> start!73900 true))

(assert (=> start!73900 tp!52004))

(declare-fun array_inv!19090 (array!50085) Bool)

(assert (=> start!73900 (array_inv!19090 _keys!868)))

(declare-fun array_inv!19091 (array!50083) Bool)

(assert (=> start!73900 (and (array_inv!19091 _values!688) e!483647)))

(declare-fun b!868417 () Bool)

(declare-fun res!590153 () Bool)

(assert (=> b!868417 (=> (not res!590153) (not e!483649))))

(assert (=> b!868417 (= res!590153 (and (= (size!24515 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24516 _keys!868) (size!24515 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868418 () Bool)

(declare-fun res!590149 () Bool)

(assert (=> b!868418 (=> (not res!590149) (not e!483649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50085 (_ BitVec 32)) Bool)

(assert (=> b!868418 (= res!590149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27053 () Bool)

(declare-fun tp!52003 () Bool)

(assert (=> mapNonEmpty!27053 (= mapRes!27053 (and tp!52003 e!483646))))

(declare-fun mapRest!27053 () (Array (_ BitVec 32) ValueCell!8045))

(declare-fun mapKey!27053 () (_ BitVec 32))

(declare-fun mapValue!27053 () ValueCell!8045)

(assert (=> mapNonEmpty!27053 (= (arr!24073 _values!688) (store mapRest!27053 mapKey!27053 mapValue!27053))))

(declare-fun b!868419 () Bool)

(declare-fun res!590151 () Bool)

(assert (=> b!868419 (=> (not res!590151) (not e!483649))))

(assert (=> b!868419 (= res!590151 (and (= (select (arr!24074 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73900 res!590154) b!868413))

(assert (= (and b!868413 res!590152) b!868417))

(assert (= (and b!868417 res!590153) b!868418))

(assert (= (and b!868418 res!590149) b!868411))

(assert (= (and b!868411 res!590150) b!868412))

(assert (= (and b!868412 res!590156) b!868415))

(assert (= (and b!868415 res!590157) b!868419))

(assert (= (and b!868419 res!590151) b!868416))

(assert (= (and b!868416 res!590155) b!868409))

(assert (= (and b!868414 condMapEmpty!27053) mapIsEmpty!27053))

(assert (= (and b!868414 (not condMapEmpty!27053)) mapNonEmpty!27053))

(get-info :version)

(assert (= (and mapNonEmpty!27053 ((_ is ValueCellFull!8045) mapValue!27053)) b!868408))

(assert (= (and b!868414 ((_ is ValueCellFull!8045) mapDefault!27053)) b!868410))

(assert (= start!73900 b!868414))

(declare-fun m!809559 () Bool)

(assert (=> b!868415 m!809559))

(declare-fun m!809561 () Bool)

(assert (=> mapNonEmpty!27053 m!809561))

(declare-fun m!809563 () Bool)

(assert (=> start!73900 m!809563))

(declare-fun m!809565 () Bool)

(assert (=> start!73900 m!809565))

(declare-fun m!809567 () Bool)

(assert (=> b!868419 m!809567))

(declare-fun m!809569 () Bool)

(assert (=> b!868413 m!809569))

(declare-fun m!809571 () Bool)

(assert (=> b!868411 m!809571))

(declare-fun m!809573 () Bool)

(assert (=> b!868409 m!809573))

(declare-fun m!809575 () Bool)

(assert (=> b!868409 m!809575))

(assert (=> b!868409 m!809575))

(declare-fun m!809577 () Bool)

(assert (=> b!868409 m!809577))

(declare-fun m!809579 () Bool)

(assert (=> b!868409 m!809579))

(declare-fun m!809581 () Bool)

(assert (=> b!868418 m!809581))

(declare-fun m!809583 () Bool)

(assert (=> b!868416 m!809583))

(declare-fun m!809585 () Bool)

(assert (=> b!868416 m!809585))

(declare-fun m!809587 () Bool)

(assert (=> b!868416 m!809587))

(check-sat (not b!868418) tp_is_empty!16969 (not b!868415) (not b!868411) (not b!868416) (not b_next!14833) (not b!868413) b_and!24559 (not b!868409) (not start!73900) (not mapNonEmpty!27053))
(check-sat b_and!24559 (not b_next!14833))
