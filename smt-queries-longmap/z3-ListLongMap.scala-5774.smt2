; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74548 () Bool)

(assert start!74548)

(declare-fun b_free!15237 () Bool)

(declare-fun b_next!15237 () Bool)

(assert (=> start!74548 (= b_free!15237 (not b_next!15237))))

(declare-fun tp!53393 () Bool)

(declare-fun b_and!25113 () Bool)

(assert (=> start!74548 (= tp!53393 b_and!25113)))

(declare-fun res!596645 () Bool)

(declare-fun e!488814 () Bool)

(assert (=> start!74548 (=> (not res!596645) (not e!488814))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51088 0))(
  ( (array!51089 (arr!24570 (Array (_ BitVec 32) (_ BitVec 64))) (size!25010 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51088)

(assert (=> start!74548 (= res!596645 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25010 _keys!868))))))

(assert (=> start!74548 e!488814))

(declare-fun tp_is_empty!17481 () Bool)

(assert (=> start!74548 tp_is_empty!17481))

(assert (=> start!74548 true))

(assert (=> start!74548 tp!53393))

(declare-fun array_inv!19366 (array!51088) Bool)

(assert (=> start!74548 (array_inv!19366 _keys!868)))

(declare-datatypes ((V!28355 0))(
  ( (V!28356 (val!8788 Int)) )
))
(declare-datatypes ((ValueCell!8301 0))(
  ( (ValueCellFull!8301 (v!11228 V!28355)) (EmptyCell!8301) )
))
(declare-datatypes ((array!51090 0))(
  ( (array!51091 (arr!24571 (Array (_ BitVec 32) ValueCell!8301)) (size!25011 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51090)

(declare-fun e!488813 () Bool)

(declare-fun array_inv!19367 (array!51090) Bool)

(assert (=> start!74548 (and (array_inv!19367 _values!688) e!488813)))

(declare-fun b!878246 () Bool)

(declare-fun e!488815 () Bool)

(declare-fun mapRes!27837 () Bool)

(assert (=> b!878246 (= e!488813 (and e!488815 mapRes!27837))))

(declare-fun condMapEmpty!27837 () Bool)

(declare-fun mapDefault!27837 () ValueCell!8301)

(assert (=> b!878246 (= condMapEmpty!27837 (= (arr!24571 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8301)) mapDefault!27837)))))

(declare-fun b!878247 () Bool)

(declare-fun res!596647 () Bool)

(assert (=> b!878247 (=> (not res!596647) (not e!488814))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51088 (_ BitVec 32)) Bool)

(assert (=> b!878247 (= res!596647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878248 () Bool)

(declare-fun res!596648 () Bool)

(assert (=> b!878248 (=> (not res!596648) (not e!488814))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878248 (= res!596648 (and (= (size!25011 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25010 _keys!868) (size!25011 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878249 () Bool)

(declare-fun e!488812 () Bool)

(assert (=> b!878249 (= e!488812 tp_is_empty!17481)))

(declare-fun b!878250 () Bool)

(assert (=> b!878250 (= e!488814 false)))

(declare-fun v!557 () V!28355)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun minValue!654 () V!28355)

(declare-fun zeroValue!654 () V!28355)

(declare-datatypes ((tuple2!11620 0))(
  ( (tuple2!11621 (_1!5821 (_ BitVec 64)) (_2!5821 V!28355)) )
))
(declare-datatypes ((List!17435 0))(
  ( (Nil!17432) (Cons!17431 (h!18562 tuple2!11620) (t!24524 List!17435)) )
))
(declare-datatypes ((ListLongMap!10389 0))(
  ( (ListLongMap!10390 (toList!5210 List!17435)) )
))
(declare-fun lt!397220 () ListLongMap!10389)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3177 (array!51088 array!51090 (_ BitVec 32) (_ BitVec 32) V!28355 V!28355 (_ BitVec 32) Int) ListLongMap!10389)

(assert (=> b!878250 (= lt!397220 (getCurrentListMapNoExtraKeys!3177 _keys!868 (array!51091 (store (arr!24571 _values!688) i!612 (ValueCellFull!8301 v!557)) (size!25011 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397221 () ListLongMap!10389)

(assert (=> b!878250 (= lt!397221 (getCurrentListMapNoExtraKeys!3177 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27837 () Bool)

(assert (=> mapIsEmpty!27837 mapRes!27837))

(declare-fun b!878251 () Bool)

(declare-fun res!596642 () Bool)

(assert (=> b!878251 (=> (not res!596642) (not e!488814))))

(assert (=> b!878251 (= res!596642 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25010 _keys!868))))))

(declare-fun b!878252 () Bool)

(assert (=> b!878252 (= e!488815 tp_is_empty!17481)))

(declare-fun b!878253 () Bool)

(declare-fun res!596646 () Bool)

(assert (=> b!878253 (=> (not res!596646) (not e!488814))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878253 (= res!596646 (validKeyInArray!0 k0!854))))

(declare-fun b!878254 () Bool)

(declare-fun res!596641 () Bool)

(assert (=> b!878254 (=> (not res!596641) (not e!488814))))

(declare-datatypes ((List!17436 0))(
  ( (Nil!17433) (Cons!17432 (h!18563 (_ BitVec 64)) (t!24525 List!17436)) )
))
(declare-fun arrayNoDuplicates!0 (array!51088 (_ BitVec 32) List!17436) Bool)

(assert (=> b!878254 (= res!596641 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17433))))

(declare-fun mapNonEmpty!27837 () Bool)

(declare-fun tp!53392 () Bool)

(assert (=> mapNonEmpty!27837 (= mapRes!27837 (and tp!53392 e!488812))))

(declare-fun mapValue!27837 () ValueCell!8301)

(declare-fun mapRest!27837 () (Array (_ BitVec 32) ValueCell!8301))

(declare-fun mapKey!27837 () (_ BitVec 32))

(assert (=> mapNonEmpty!27837 (= (arr!24571 _values!688) (store mapRest!27837 mapKey!27837 mapValue!27837))))

(declare-fun b!878255 () Bool)

(declare-fun res!596643 () Bool)

(assert (=> b!878255 (=> (not res!596643) (not e!488814))))

(assert (=> b!878255 (= res!596643 (and (= (select (arr!24570 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878256 () Bool)

(declare-fun res!596644 () Bool)

(assert (=> b!878256 (=> (not res!596644) (not e!488814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878256 (= res!596644 (validMask!0 mask!1196))))

(assert (= (and start!74548 res!596645) b!878256))

(assert (= (and b!878256 res!596644) b!878248))

(assert (= (and b!878248 res!596648) b!878247))

(assert (= (and b!878247 res!596647) b!878254))

(assert (= (and b!878254 res!596641) b!878251))

(assert (= (and b!878251 res!596642) b!878253))

(assert (= (and b!878253 res!596646) b!878255))

(assert (= (and b!878255 res!596643) b!878250))

(assert (= (and b!878246 condMapEmpty!27837) mapIsEmpty!27837))

(assert (= (and b!878246 (not condMapEmpty!27837)) mapNonEmpty!27837))

(get-info :version)

(assert (= (and mapNonEmpty!27837 ((_ is ValueCellFull!8301) mapValue!27837)) b!878249))

(assert (= (and b!878246 ((_ is ValueCellFull!8301) mapDefault!27837)) b!878252))

(assert (= start!74548 b!878246))

(declare-fun m!818181 () Bool)

(assert (=> b!878247 m!818181))

(declare-fun m!818183 () Bool)

(assert (=> start!74548 m!818183))

(declare-fun m!818185 () Bool)

(assert (=> start!74548 m!818185))

(declare-fun m!818187 () Bool)

(assert (=> b!878250 m!818187))

(declare-fun m!818189 () Bool)

(assert (=> b!878250 m!818189))

(declare-fun m!818191 () Bool)

(assert (=> b!878250 m!818191))

(declare-fun m!818193 () Bool)

(assert (=> mapNonEmpty!27837 m!818193))

(declare-fun m!818195 () Bool)

(assert (=> b!878253 m!818195))

(declare-fun m!818197 () Bool)

(assert (=> b!878254 m!818197))

(declare-fun m!818199 () Bool)

(assert (=> b!878255 m!818199))

(declare-fun m!818201 () Bool)

(assert (=> b!878256 m!818201))

(check-sat (not b_next!15237) (not b!878254) (not b!878250) (not b!878256) b_and!25113 (not start!74548) tp_is_empty!17481 (not mapNonEmpty!27837) (not b!878247) (not b!878253))
(check-sat b_and!25113 (not b_next!15237))
