; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74560 () Bool)

(assert start!74560)

(declare-fun b_free!15249 () Bool)

(declare-fun b_next!15249 () Bool)

(assert (=> start!74560 (= b_free!15249 (not b_next!15249))))

(declare-fun tp!53428 () Bool)

(declare-fun b_and!25125 () Bool)

(assert (=> start!74560 (= tp!53428 b_and!25125)))

(declare-fun b!878444 () Bool)

(declare-fun res!596790 () Bool)

(declare-fun e!488901 () Bool)

(assert (=> b!878444 (=> (not res!596790) (not e!488901))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!51112 0))(
  ( (array!51113 (arr!24582 (Array (_ BitVec 32) (_ BitVec 64))) (size!25022 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51112)

(declare-datatypes ((V!28371 0))(
  ( (V!28372 (val!8794 Int)) )
))
(declare-datatypes ((ValueCell!8307 0))(
  ( (ValueCellFull!8307 (v!11234 V!28371)) (EmptyCell!8307) )
))
(declare-datatypes ((array!51114 0))(
  ( (array!51115 (arr!24583 (Array (_ BitVec 32) ValueCell!8307)) (size!25023 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51114)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!878444 (= res!596790 (and (= (size!25023 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25022 _keys!868) (size!25023 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!596785 () Bool)

(assert (=> start!74560 (=> (not res!596785) (not e!488901))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74560 (= res!596785 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25022 _keys!868))))))

(assert (=> start!74560 e!488901))

(declare-fun tp_is_empty!17493 () Bool)

(assert (=> start!74560 tp_is_empty!17493))

(assert (=> start!74560 true))

(assert (=> start!74560 tp!53428))

(declare-fun array_inv!19374 (array!51112) Bool)

(assert (=> start!74560 (array_inv!19374 _keys!868)))

(declare-fun e!488903 () Bool)

(declare-fun array_inv!19375 (array!51114) Bool)

(assert (=> start!74560 (and (array_inv!19375 _values!688) e!488903)))

(declare-fun b!878445 () Bool)

(declare-fun res!596786 () Bool)

(assert (=> b!878445 (=> (not res!596786) (not e!488901))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878445 (= res!596786 (validKeyInArray!0 k0!854))))

(declare-fun b!878446 () Bool)

(declare-fun res!596789 () Bool)

(assert (=> b!878446 (=> (not res!596789) (not e!488901))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878446 (= res!596789 (and (= (select (arr!24582 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27855 () Bool)

(declare-fun mapRes!27855 () Bool)

(declare-fun tp!53429 () Bool)

(declare-fun e!488902 () Bool)

(assert (=> mapNonEmpty!27855 (= mapRes!27855 (and tp!53429 e!488902))))

(declare-fun mapRest!27855 () (Array (_ BitVec 32) ValueCell!8307))

(declare-fun mapKey!27855 () (_ BitVec 32))

(declare-fun mapValue!27855 () ValueCell!8307)

(assert (=> mapNonEmpty!27855 (= (arr!24583 _values!688) (store mapRest!27855 mapKey!27855 mapValue!27855))))

(declare-fun b!878447 () Bool)

(declare-fun res!596787 () Bool)

(assert (=> b!878447 (=> (not res!596787) (not e!488901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51112 (_ BitVec 32)) Bool)

(assert (=> b!878447 (= res!596787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878448 () Bool)

(declare-fun e!488905 () Bool)

(assert (=> b!878448 (= e!488903 (and e!488905 mapRes!27855))))

(declare-fun condMapEmpty!27855 () Bool)

(declare-fun mapDefault!27855 () ValueCell!8307)

(assert (=> b!878448 (= condMapEmpty!27855 (= (arr!24583 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8307)) mapDefault!27855)))))

(declare-fun b!878449 () Bool)

(declare-fun res!596788 () Bool)

(assert (=> b!878449 (=> (not res!596788) (not e!488901))))

(assert (=> b!878449 (= res!596788 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25022 _keys!868))))))

(declare-fun mapIsEmpty!27855 () Bool)

(assert (=> mapIsEmpty!27855 mapRes!27855))

(declare-fun b!878450 () Bool)

(assert (=> b!878450 (= e!488901 false)))

(declare-datatypes ((tuple2!11630 0))(
  ( (tuple2!11631 (_1!5826 (_ BitVec 64)) (_2!5826 V!28371)) )
))
(declare-datatypes ((List!17445 0))(
  ( (Nil!17442) (Cons!17441 (h!18572 tuple2!11630) (t!24534 List!17445)) )
))
(declare-datatypes ((ListLongMap!10399 0))(
  ( (ListLongMap!10400 (toList!5215 List!17445)) )
))
(declare-fun lt!397256 () ListLongMap!10399)

(declare-fun v!557 () V!28371)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28371)

(declare-fun zeroValue!654 () V!28371)

(declare-fun getCurrentListMapNoExtraKeys!3182 (array!51112 array!51114 (_ BitVec 32) (_ BitVec 32) V!28371 V!28371 (_ BitVec 32) Int) ListLongMap!10399)

(assert (=> b!878450 (= lt!397256 (getCurrentListMapNoExtraKeys!3182 _keys!868 (array!51115 (store (arr!24583 _values!688) i!612 (ValueCellFull!8307 v!557)) (size!25023 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397257 () ListLongMap!10399)

(assert (=> b!878450 (= lt!397257 (getCurrentListMapNoExtraKeys!3182 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878451 () Bool)

(assert (=> b!878451 (= e!488905 tp_is_empty!17493)))

(declare-fun b!878452 () Bool)

(declare-fun res!596792 () Bool)

(assert (=> b!878452 (=> (not res!596792) (not e!488901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878452 (= res!596792 (validMask!0 mask!1196))))

(declare-fun b!878453 () Bool)

(assert (=> b!878453 (= e!488902 tp_is_empty!17493)))

(declare-fun b!878454 () Bool)

(declare-fun res!596791 () Bool)

(assert (=> b!878454 (=> (not res!596791) (not e!488901))))

(declare-datatypes ((List!17446 0))(
  ( (Nil!17443) (Cons!17442 (h!18573 (_ BitVec 64)) (t!24535 List!17446)) )
))
(declare-fun arrayNoDuplicates!0 (array!51112 (_ BitVec 32) List!17446) Bool)

(assert (=> b!878454 (= res!596791 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17443))))

(assert (= (and start!74560 res!596785) b!878452))

(assert (= (and b!878452 res!596792) b!878444))

(assert (= (and b!878444 res!596790) b!878447))

(assert (= (and b!878447 res!596787) b!878454))

(assert (= (and b!878454 res!596791) b!878449))

(assert (= (and b!878449 res!596788) b!878445))

(assert (= (and b!878445 res!596786) b!878446))

(assert (= (and b!878446 res!596789) b!878450))

(assert (= (and b!878448 condMapEmpty!27855) mapIsEmpty!27855))

(assert (= (and b!878448 (not condMapEmpty!27855)) mapNonEmpty!27855))

(get-info :version)

(assert (= (and mapNonEmpty!27855 ((_ is ValueCellFull!8307) mapValue!27855)) b!878453))

(assert (= (and b!878448 ((_ is ValueCellFull!8307) mapDefault!27855)) b!878451))

(assert (= start!74560 b!878448))

(declare-fun m!818313 () Bool)

(assert (=> b!878447 m!818313))

(declare-fun m!818315 () Bool)

(assert (=> b!878446 m!818315))

(declare-fun m!818317 () Bool)

(assert (=> b!878454 m!818317))

(declare-fun m!818319 () Bool)

(assert (=> b!878445 m!818319))

(declare-fun m!818321 () Bool)

(assert (=> start!74560 m!818321))

(declare-fun m!818323 () Bool)

(assert (=> start!74560 m!818323))

(declare-fun m!818325 () Bool)

(assert (=> b!878450 m!818325))

(declare-fun m!818327 () Bool)

(assert (=> b!878450 m!818327))

(declare-fun m!818329 () Bool)

(assert (=> b!878450 m!818329))

(declare-fun m!818331 () Bool)

(assert (=> mapNonEmpty!27855 m!818331))

(declare-fun m!818333 () Bool)

(assert (=> b!878452 m!818333))

(check-sat (not b!878454) (not b!878447) (not b!878450) tp_is_empty!17493 (not b_next!15249) (not b!878452) (not start!74560) (not mapNonEmpty!27855) b_and!25125 (not b!878445))
(check-sat b_and!25125 (not b_next!15249))
