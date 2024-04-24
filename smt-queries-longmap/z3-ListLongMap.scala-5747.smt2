; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74478 () Bool)

(assert start!74478)

(declare-fun b_free!15073 () Bool)

(declare-fun b_next!15073 () Bool)

(assert (=> start!74478 (= b_free!15073 (not b_next!15073))))

(declare-fun tp!52895 () Bool)

(declare-fun b_and!24859 () Bool)

(assert (=> start!74478 (= tp!52895 b_and!24859)))

(declare-fun b!875282 () Bool)

(declare-fun res!594553 () Bool)

(declare-fun e!487425 () Bool)

(assert (=> b!875282 (=> (not res!594553) (not e!487425))))

(declare-datatypes ((array!50817 0))(
  ( (array!50818 (arr!24432 (Array (_ BitVec 32) (_ BitVec 64))) (size!24873 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50817)

(declare-datatypes ((List!17280 0))(
  ( (Nil!17277) (Cons!17276 (h!18413 (_ BitVec 64)) (t!24313 List!17280)) )
))
(declare-fun arrayNoDuplicates!0 (array!50817 (_ BitVec 32) List!17280) Bool)

(assert (=> b!875282 (= res!594553 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17277))))

(declare-fun b!875283 () Bool)

(declare-fun e!487424 () Bool)

(declare-fun tp_is_empty!17317 () Bool)

(assert (=> b!875283 (= e!487424 tp_is_empty!17317)))

(declare-fun b!875284 () Bool)

(declare-fun res!594554 () Bool)

(assert (=> b!875284 (=> (not res!594554) (not e!487425))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50817 (_ BitVec 32)) Bool)

(assert (=> b!875284 (= res!594554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875285 () Bool)

(declare-fun e!487423 () Bool)

(assert (=> b!875285 (= e!487423 tp_is_empty!17317)))

(declare-fun b!875286 () Bool)

(declare-fun res!594549 () Bool)

(assert (=> b!875286 (=> (not res!594549) (not e!487425))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875286 (= res!594549 (validKeyInArray!0 k0!854))))

(declare-fun b!875287 () Bool)

(declare-fun res!594552 () Bool)

(assert (=> b!875287 (=> (not res!594552) (not e!487425))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28137 0))(
  ( (V!28138 (val!8706 Int)) )
))
(declare-datatypes ((ValueCell!8219 0))(
  ( (ValueCellFull!8219 (v!11135 V!28137)) (EmptyCell!8219) )
))
(declare-datatypes ((array!50819 0))(
  ( (array!50820 (arr!24433 (Array (_ BitVec 32) ValueCell!8219)) (size!24874 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50819)

(assert (=> b!875287 (= res!594552 (and (= (size!24874 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24873 _keys!868) (size!24874 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875288 () Bool)

(assert (=> b!875288 (= e!487425 false)))

(declare-datatypes ((tuple2!11434 0))(
  ( (tuple2!11435 (_1!5728 (_ BitVec 64)) (_2!5728 V!28137)) )
))
(declare-datatypes ((List!17281 0))(
  ( (Nil!17278) (Cons!17277 (h!18414 tuple2!11434) (t!24314 List!17281)) )
))
(declare-datatypes ((ListLongMap!10205 0))(
  ( (ListLongMap!10206 (toList!5118 List!17281)) )
))
(declare-fun lt!396293 () ListLongMap!10205)

(declare-fun v!557 () V!28137)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28137)

(declare-fun zeroValue!654 () V!28137)

(declare-fun getCurrentListMapNoExtraKeys!3161 (array!50817 array!50819 (_ BitVec 32) (_ BitVec 32) V!28137 V!28137 (_ BitVec 32) Int) ListLongMap!10205)

(assert (=> b!875288 (= lt!396293 (getCurrentListMapNoExtraKeys!3161 _keys!868 (array!50820 (store (arr!24433 _values!688) i!612 (ValueCellFull!8219 v!557)) (size!24874 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396294 () ListLongMap!10205)

(assert (=> b!875288 (= lt!396294 (getCurrentListMapNoExtraKeys!3161 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875289 () Bool)

(declare-fun res!594548 () Bool)

(assert (=> b!875289 (=> (not res!594548) (not e!487425))))

(assert (=> b!875289 (= res!594548 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24873 _keys!868))))))

(declare-fun b!875290 () Bool)

(declare-fun res!594550 () Bool)

(assert (=> b!875290 (=> (not res!594550) (not e!487425))))

(assert (=> b!875290 (= res!594550 (and (= (select (arr!24432 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!594547 () Bool)

(assert (=> start!74478 (=> (not res!594547) (not e!487425))))

(assert (=> start!74478 (= res!594547 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24873 _keys!868))))))

(assert (=> start!74478 e!487425))

(assert (=> start!74478 tp_is_empty!17317))

(assert (=> start!74478 true))

(assert (=> start!74478 tp!52895))

(declare-fun array_inv!19326 (array!50817) Bool)

(assert (=> start!74478 (array_inv!19326 _keys!868)))

(declare-fun e!487426 () Bool)

(declare-fun array_inv!19327 (array!50819) Bool)

(assert (=> start!74478 (and (array_inv!19327 _values!688) e!487426)))

(declare-fun b!875291 () Bool)

(declare-fun mapRes!27584 () Bool)

(assert (=> b!875291 (= e!487426 (and e!487423 mapRes!27584))))

(declare-fun condMapEmpty!27584 () Bool)

(declare-fun mapDefault!27584 () ValueCell!8219)

(assert (=> b!875291 (= condMapEmpty!27584 (= (arr!24433 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8219)) mapDefault!27584)))))

(declare-fun mapNonEmpty!27584 () Bool)

(declare-fun tp!52894 () Bool)

(assert (=> mapNonEmpty!27584 (= mapRes!27584 (and tp!52894 e!487424))))

(declare-fun mapRest!27584 () (Array (_ BitVec 32) ValueCell!8219))

(declare-fun mapKey!27584 () (_ BitVec 32))

(declare-fun mapValue!27584 () ValueCell!8219)

(assert (=> mapNonEmpty!27584 (= (arr!24433 _values!688) (store mapRest!27584 mapKey!27584 mapValue!27584))))

(declare-fun mapIsEmpty!27584 () Bool)

(assert (=> mapIsEmpty!27584 mapRes!27584))

(declare-fun b!875292 () Bool)

(declare-fun res!594551 () Bool)

(assert (=> b!875292 (=> (not res!594551) (not e!487425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875292 (= res!594551 (validMask!0 mask!1196))))

(assert (= (and start!74478 res!594547) b!875292))

(assert (= (and b!875292 res!594551) b!875287))

(assert (= (and b!875287 res!594552) b!875284))

(assert (= (and b!875284 res!594554) b!875282))

(assert (= (and b!875282 res!594553) b!875289))

(assert (= (and b!875289 res!594548) b!875286))

(assert (= (and b!875286 res!594549) b!875290))

(assert (= (and b!875290 res!594550) b!875288))

(assert (= (and b!875291 condMapEmpty!27584) mapIsEmpty!27584))

(assert (= (and b!875291 (not condMapEmpty!27584)) mapNonEmpty!27584))

(get-info :version)

(assert (= (and mapNonEmpty!27584 ((_ is ValueCellFull!8219) mapValue!27584)) b!875283))

(assert (= (and b!875291 ((_ is ValueCellFull!8219) mapDefault!27584)) b!875285))

(assert (= start!74478 b!875291))

(declare-fun m!815857 () Bool)

(assert (=> b!875288 m!815857))

(declare-fun m!815859 () Bool)

(assert (=> b!875288 m!815859))

(declare-fun m!815861 () Bool)

(assert (=> b!875288 m!815861))

(declare-fun m!815863 () Bool)

(assert (=> b!875292 m!815863))

(declare-fun m!815865 () Bool)

(assert (=> b!875290 m!815865))

(declare-fun m!815867 () Bool)

(assert (=> b!875282 m!815867))

(declare-fun m!815869 () Bool)

(assert (=> b!875286 m!815869))

(declare-fun m!815871 () Bool)

(assert (=> mapNonEmpty!27584 m!815871))

(declare-fun m!815873 () Bool)

(assert (=> b!875284 m!815873))

(declare-fun m!815875 () Bool)

(assert (=> start!74478 m!815875))

(declare-fun m!815877 () Bool)

(assert (=> start!74478 m!815877))

(check-sat (not mapNonEmpty!27584) (not b!875282) (not b_next!15073) (not b!875288) b_and!24859 (not b!875286) tp_is_empty!17317 (not b!875292) (not start!74478) (not b!875284))
(check-sat b_and!24859 (not b_next!15073))
