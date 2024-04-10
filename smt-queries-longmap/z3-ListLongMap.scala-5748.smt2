; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74318 () Bool)

(assert start!74318)

(declare-fun b_free!15081 () Bool)

(declare-fun b_next!15081 () Bool)

(assert (=> start!74318 (= b_free!15081 (not b_next!15081))))

(declare-fun tp!52918 () Bool)

(declare-fun b_and!24857 () Bool)

(assert (=> start!74318 (= tp!52918 b_and!24857)))

(declare-fun b!874511 () Bool)

(declare-fun e!486902 () Bool)

(declare-fun e!486904 () Bool)

(declare-fun mapRes!27596 () Bool)

(assert (=> b!874511 (= e!486902 (and e!486904 mapRes!27596))))

(declare-fun condMapEmpty!27596 () Bool)

(declare-datatypes ((V!28147 0))(
  ( (V!28148 (val!8710 Int)) )
))
(declare-datatypes ((ValueCell!8223 0))(
  ( (ValueCellFull!8223 (v!11139 V!28147)) (EmptyCell!8223) )
))
(declare-datatypes ((array!50778 0))(
  ( (array!50779 (arr!24417 (Array (_ BitVec 32) ValueCell!8223)) (size!24857 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50778)

(declare-fun mapDefault!27596 () ValueCell!8223)

(assert (=> b!874511 (= condMapEmpty!27596 (= (arr!24417 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8223)) mapDefault!27596)))))

(declare-fun b!874513 () Bool)

(declare-fun e!486901 () Bool)

(declare-fun tp_is_empty!17325 () Bool)

(assert (=> b!874513 (= e!486901 tp_is_empty!17325)))

(declare-fun b!874514 () Bool)

(declare-fun res!594301 () Bool)

(declare-fun e!486903 () Bool)

(assert (=> b!874514 (=> (not res!594301) (not e!486903))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50780 0))(
  ( (array!50781 (arr!24418 (Array (_ BitVec 32) (_ BitVec 64))) (size!24858 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50780)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874514 (= res!594301 (and (= (select (arr!24418 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874515 () Bool)

(declare-fun res!594299 () Bool)

(assert (=> b!874515 (=> (not res!594299) (not e!486903))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50780 (_ BitVec 32)) Bool)

(assert (=> b!874515 (= res!594299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874516 () Bool)

(declare-fun res!594305 () Bool)

(assert (=> b!874516 (=> (not res!594305) (not e!486903))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!874516 (= res!594305 (and (= (size!24857 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24858 _keys!868) (size!24857 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27596 () Bool)

(declare-fun tp!52917 () Bool)

(assert (=> mapNonEmpty!27596 (= mapRes!27596 (and tp!52917 e!486901))))

(declare-fun mapKey!27596 () (_ BitVec 32))

(declare-fun mapRest!27596 () (Array (_ BitVec 32) ValueCell!8223))

(declare-fun mapValue!27596 () ValueCell!8223)

(assert (=> mapNonEmpty!27596 (= (arr!24417 _values!688) (store mapRest!27596 mapKey!27596 mapValue!27596))))

(declare-fun b!874517 () Bool)

(assert (=> b!874517 (= e!486904 tp_is_empty!17325)))

(declare-fun b!874518 () Bool)

(declare-fun res!594300 () Bool)

(assert (=> b!874518 (=> (not res!594300) (not e!486903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874518 (= res!594300 (validMask!0 mask!1196))))

(declare-fun b!874519 () Bool)

(declare-fun res!594303 () Bool)

(assert (=> b!874519 (=> (not res!594303) (not e!486903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874519 (= res!594303 (validKeyInArray!0 k0!854))))

(declare-fun b!874520 () Bool)

(declare-fun res!594302 () Bool)

(assert (=> b!874520 (=> (not res!594302) (not e!486903))))

(declare-datatypes ((List!17331 0))(
  ( (Nil!17328) (Cons!17327 (h!18458 (_ BitVec 64)) (t!24372 List!17331)) )
))
(declare-fun arrayNoDuplicates!0 (array!50780 (_ BitVec 32) List!17331) Bool)

(assert (=> b!874520 (= res!594302 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17328))))

(declare-fun res!594306 () Bool)

(assert (=> start!74318 (=> (not res!594306) (not e!486903))))

(assert (=> start!74318 (= res!594306 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24858 _keys!868))))))

(assert (=> start!74318 e!486903))

(assert (=> start!74318 tp_is_empty!17325))

(assert (=> start!74318 true))

(assert (=> start!74318 tp!52918))

(declare-fun array_inv!19256 (array!50780) Bool)

(assert (=> start!74318 (array_inv!19256 _keys!868)))

(declare-fun array_inv!19257 (array!50778) Bool)

(assert (=> start!74318 (and (array_inv!19257 _values!688) e!486902)))

(declare-fun b!874512 () Bool)

(assert (=> b!874512 (= e!486903 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11510 0))(
  ( (tuple2!11511 (_1!5766 (_ BitVec 64)) (_2!5766 V!28147)) )
))
(declare-datatypes ((List!17332 0))(
  ( (Nil!17329) (Cons!17328 (h!18459 tuple2!11510) (t!24373 List!17332)) )
))
(declare-datatypes ((ListLongMap!10279 0))(
  ( (ListLongMap!10280 (toList!5155 List!17332)) )
))
(declare-fun lt!395956 () ListLongMap!10279)

(declare-fun minValue!654 () V!28147)

(declare-fun zeroValue!654 () V!28147)

(declare-fun v!557 () V!28147)

(declare-fun getCurrentListMapNoExtraKeys!3122 (array!50780 array!50778 (_ BitVec 32) (_ BitVec 32) V!28147 V!28147 (_ BitVec 32) Int) ListLongMap!10279)

(assert (=> b!874512 (= lt!395956 (getCurrentListMapNoExtraKeys!3122 _keys!868 (array!50779 (store (arr!24417 _values!688) i!612 (ValueCellFull!8223 v!557)) (size!24857 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395957 () ListLongMap!10279)

(assert (=> b!874512 (= lt!395957 (getCurrentListMapNoExtraKeys!3122 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874521 () Bool)

(declare-fun res!594304 () Bool)

(assert (=> b!874521 (=> (not res!594304) (not e!486903))))

(assert (=> b!874521 (= res!594304 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24858 _keys!868))))))

(declare-fun mapIsEmpty!27596 () Bool)

(assert (=> mapIsEmpty!27596 mapRes!27596))

(assert (= (and start!74318 res!594306) b!874518))

(assert (= (and b!874518 res!594300) b!874516))

(assert (= (and b!874516 res!594305) b!874515))

(assert (= (and b!874515 res!594299) b!874520))

(assert (= (and b!874520 res!594302) b!874521))

(assert (= (and b!874521 res!594304) b!874519))

(assert (= (and b!874519 res!594303) b!874514))

(assert (= (and b!874514 res!594301) b!874512))

(assert (= (and b!874511 condMapEmpty!27596) mapIsEmpty!27596))

(assert (= (and b!874511 (not condMapEmpty!27596)) mapNonEmpty!27596))

(get-info :version)

(assert (= (and mapNonEmpty!27596 ((_ is ValueCellFull!8223) mapValue!27596)) b!874513))

(assert (= (and b!874511 ((_ is ValueCellFull!8223) mapDefault!27596)) b!874517))

(assert (= start!74318 b!874511))

(declare-fun m!814655 () Bool)

(assert (=> b!874520 m!814655))

(declare-fun m!814657 () Bool)

(assert (=> b!874519 m!814657))

(declare-fun m!814659 () Bool)

(assert (=> b!874514 m!814659))

(declare-fun m!814661 () Bool)

(assert (=> start!74318 m!814661))

(declare-fun m!814663 () Bool)

(assert (=> start!74318 m!814663))

(declare-fun m!814665 () Bool)

(assert (=> b!874512 m!814665))

(declare-fun m!814667 () Bool)

(assert (=> b!874512 m!814667))

(declare-fun m!814669 () Bool)

(assert (=> b!874512 m!814669))

(declare-fun m!814671 () Bool)

(assert (=> b!874518 m!814671))

(declare-fun m!814673 () Bool)

(assert (=> mapNonEmpty!27596 m!814673))

(declare-fun m!814675 () Bool)

(assert (=> b!874515 m!814675))

(check-sat (not start!74318) (not b_next!15081) (not b!874519) (not b!874515) (not b!874520) (not b!874512) b_and!24857 (not b!874518) (not mapNonEmpty!27596) tp_is_empty!17325)
(check-sat b_and!24857 (not b_next!15081))
