; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74484 () Bool)

(assert start!74484)

(declare-fun b_free!15079 () Bool)

(declare-fun b_next!15079 () Bool)

(assert (=> start!74484 (= b_free!15079 (not b_next!15079))))

(declare-fun tp!52913 () Bool)

(declare-fun b_and!24865 () Bool)

(assert (=> start!74484 (= tp!52913 b_and!24865)))

(declare-fun mapIsEmpty!27593 () Bool)

(declare-fun mapRes!27593 () Bool)

(assert (=> mapIsEmpty!27593 mapRes!27593))

(declare-fun b!875381 () Bool)

(declare-fun res!594625 () Bool)

(declare-fun e!487469 () Bool)

(assert (=> b!875381 (=> (not res!594625) (not e!487469))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50829 0))(
  ( (array!50830 (arr!24438 (Array (_ BitVec 32) (_ BitVec 64))) (size!24879 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50829)

(assert (=> b!875381 (= res!594625 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24879 _keys!868))))))

(declare-fun b!875382 () Bool)

(declare-fun e!487470 () Bool)

(declare-fun tp_is_empty!17323 () Bool)

(assert (=> b!875382 (= e!487470 tp_is_empty!17323)))

(declare-fun b!875383 () Bool)

(declare-fun res!594620 () Bool)

(assert (=> b!875383 (=> (not res!594620) (not e!487469))))

(declare-datatypes ((List!17283 0))(
  ( (Nil!17280) (Cons!17279 (h!18416 (_ BitVec 64)) (t!24316 List!17283)) )
))
(declare-fun arrayNoDuplicates!0 (array!50829 (_ BitVec 32) List!17283) Bool)

(assert (=> b!875383 (= res!594620 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17280))))

(declare-fun b!875384 () Bool)

(declare-fun res!594621 () Bool)

(assert (=> b!875384 (=> (not res!594621) (not e!487469))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875384 (= res!594621 (validKeyInArray!0 k0!854))))

(declare-fun b!875385 () Bool)

(declare-fun res!594624 () Bool)

(assert (=> b!875385 (=> (not res!594624) (not e!487469))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875385 (= res!594624 (validMask!0 mask!1196))))

(declare-fun b!875386 () Bool)

(declare-fun res!594622 () Bool)

(assert (=> b!875386 (=> (not res!594622) (not e!487469))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28145 0))(
  ( (V!28146 (val!8709 Int)) )
))
(declare-datatypes ((ValueCell!8222 0))(
  ( (ValueCellFull!8222 (v!11138 V!28145)) (EmptyCell!8222) )
))
(declare-datatypes ((array!50831 0))(
  ( (array!50832 (arr!24439 (Array (_ BitVec 32) ValueCell!8222)) (size!24880 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50831)

(assert (=> b!875386 (= res!594622 (and (= (size!24880 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24879 _keys!868) (size!24880 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875387 () Bool)

(declare-fun res!594619 () Bool)

(assert (=> b!875387 (=> (not res!594619) (not e!487469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50829 (_ BitVec 32)) Bool)

(assert (=> b!875387 (= res!594619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875388 () Bool)

(declare-fun e!487471 () Bool)

(assert (=> b!875388 (= e!487471 (and e!487470 mapRes!27593))))

(declare-fun condMapEmpty!27593 () Bool)

(declare-fun mapDefault!27593 () ValueCell!8222)

(assert (=> b!875388 (= condMapEmpty!27593 (= (arr!24439 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8222)) mapDefault!27593)))))

(declare-fun mapNonEmpty!27593 () Bool)

(declare-fun tp!52912 () Bool)

(declare-fun e!487468 () Bool)

(assert (=> mapNonEmpty!27593 (= mapRes!27593 (and tp!52912 e!487468))))

(declare-fun mapKey!27593 () (_ BitVec 32))

(declare-fun mapValue!27593 () ValueCell!8222)

(declare-fun mapRest!27593 () (Array (_ BitVec 32) ValueCell!8222))

(assert (=> mapNonEmpty!27593 (= (arr!24439 _values!688) (store mapRest!27593 mapKey!27593 mapValue!27593))))

(declare-fun res!594626 () Bool)

(assert (=> start!74484 (=> (not res!594626) (not e!487469))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74484 (= res!594626 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24879 _keys!868))))))

(assert (=> start!74484 e!487469))

(assert (=> start!74484 tp_is_empty!17323))

(assert (=> start!74484 true))

(assert (=> start!74484 tp!52913))

(declare-fun array_inv!19330 (array!50829) Bool)

(assert (=> start!74484 (array_inv!19330 _keys!868)))

(declare-fun array_inv!19331 (array!50831) Bool)

(assert (=> start!74484 (and (array_inv!19331 _values!688) e!487471)))

(declare-fun b!875389 () Bool)

(assert (=> b!875389 (= e!487469 false)))

(declare-fun v!557 () V!28145)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11436 0))(
  ( (tuple2!11437 (_1!5729 (_ BitVec 64)) (_2!5729 V!28145)) )
))
(declare-datatypes ((List!17284 0))(
  ( (Nil!17281) (Cons!17280 (h!18417 tuple2!11436) (t!24317 List!17284)) )
))
(declare-datatypes ((ListLongMap!10207 0))(
  ( (ListLongMap!10208 (toList!5119 List!17284)) )
))
(declare-fun lt!396312 () ListLongMap!10207)

(declare-fun minValue!654 () V!28145)

(declare-fun zeroValue!654 () V!28145)

(declare-fun getCurrentListMapNoExtraKeys!3162 (array!50829 array!50831 (_ BitVec 32) (_ BitVec 32) V!28145 V!28145 (_ BitVec 32) Int) ListLongMap!10207)

(assert (=> b!875389 (= lt!396312 (getCurrentListMapNoExtraKeys!3162 _keys!868 (array!50832 (store (arr!24439 _values!688) i!612 (ValueCellFull!8222 v!557)) (size!24880 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396311 () ListLongMap!10207)

(assert (=> b!875389 (= lt!396311 (getCurrentListMapNoExtraKeys!3162 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875390 () Bool)

(declare-fun res!594623 () Bool)

(assert (=> b!875390 (=> (not res!594623) (not e!487469))))

(assert (=> b!875390 (= res!594623 (and (= (select (arr!24438 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875391 () Bool)

(assert (=> b!875391 (= e!487468 tp_is_empty!17323)))

(assert (= (and start!74484 res!594626) b!875385))

(assert (= (and b!875385 res!594624) b!875386))

(assert (= (and b!875386 res!594622) b!875387))

(assert (= (and b!875387 res!594619) b!875383))

(assert (= (and b!875383 res!594620) b!875381))

(assert (= (and b!875381 res!594625) b!875384))

(assert (= (and b!875384 res!594621) b!875390))

(assert (= (and b!875390 res!594623) b!875389))

(assert (= (and b!875388 condMapEmpty!27593) mapIsEmpty!27593))

(assert (= (and b!875388 (not condMapEmpty!27593)) mapNonEmpty!27593))

(get-info :version)

(assert (= (and mapNonEmpty!27593 ((_ is ValueCellFull!8222) mapValue!27593)) b!875391))

(assert (= (and b!875388 ((_ is ValueCellFull!8222) mapDefault!27593)) b!875382))

(assert (= start!74484 b!875388))

(declare-fun m!815923 () Bool)

(assert (=> b!875385 m!815923))

(declare-fun m!815925 () Bool)

(assert (=> mapNonEmpty!27593 m!815925))

(declare-fun m!815927 () Bool)

(assert (=> start!74484 m!815927))

(declare-fun m!815929 () Bool)

(assert (=> start!74484 m!815929))

(declare-fun m!815931 () Bool)

(assert (=> b!875384 m!815931))

(declare-fun m!815933 () Bool)

(assert (=> b!875390 m!815933))

(declare-fun m!815935 () Bool)

(assert (=> b!875387 m!815935))

(declare-fun m!815937 () Bool)

(assert (=> b!875389 m!815937))

(declare-fun m!815939 () Bool)

(assert (=> b!875389 m!815939))

(declare-fun m!815941 () Bool)

(assert (=> b!875389 m!815941))

(declare-fun m!815943 () Bool)

(assert (=> b!875383 m!815943))

(check-sat (not b!875384) (not b!875389) b_and!24865 (not b!875385) (not mapNonEmpty!27593) (not b!875383) tp_is_empty!17323 (not start!74484) (not b!875387) (not b_next!15079))
(check-sat b_and!24865 (not b_next!15079))
