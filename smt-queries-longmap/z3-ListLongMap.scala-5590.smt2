; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73306 () Bool)

(assert start!73306)

(declare-fun b_free!14239 () Bool)

(declare-fun b_next!14239 () Bool)

(assert (=> start!73306 (= b_free!14239 (not b_next!14239))))

(declare-fun tp!50222 () Bool)

(declare-fun b_and!23569 () Bool)

(assert (=> start!73306 (= tp!50222 b_and!23569)))

(declare-fun b!855230 () Bool)

(declare-fun e!476788 () Bool)

(assert (=> b!855230 (= e!476788 false)))

(declare-datatypes ((V!26881 0))(
  ( (V!26882 (val!8235 Int)) )
))
(declare-fun v!557 () V!26881)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10862 0))(
  ( (tuple2!10863 (_1!5442 (_ BitVec 64)) (_2!5442 V!26881)) )
))
(declare-datatypes ((List!16673 0))(
  ( (Nil!16670) (Cons!16669 (h!17800 tuple2!10862) (t!23305 List!16673)) )
))
(declare-datatypes ((ListLongMap!9621 0))(
  ( (ListLongMap!9622 (toList!4826 List!16673)) )
))
(declare-fun lt!385469 () ListLongMap!9621)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48933 0))(
  ( (array!48934 (arr!23498 (Array (_ BitVec 32) (_ BitVec 64))) (size!23940 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48933)

(declare-datatypes ((ValueCell!7748 0))(
  ( (ValueCellFull!7748 (v!10654 V!26881)) (EmptyCell!7748) )
))
(declare-datatypes ((array!48935 0))(
  ( (array!48936 (arr!23499 (Array (_ BitVec 32) ValueCell!7748)) (size!23941 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48935)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26881)

(declare-fun zeroValue!654 () V!26881)

(declare-fun getCurrentListMapNoExtraKeys!2833 (array!48933 array!48935 (_ BitVec 32) (_ BitVec 32) V!26881 V!26881 (_ BitVec 32) Int) ListLongMap!9621)

(assert (=> b!855230 (= lt!385469 (getCurrentListMapNoExtraKeys!2833 _keys!868 (array!48936 (store (arr!23499 _values!688) i!612 (ValueCellFull!7748 v!557)) (size!23941 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385468 () ListLongMap!9621)

(assert (=> b!855230 (= lt!385468 (getCurrentListMapNoExtraKeys!2833 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855231 () Bool)

(declare-fun e!476787 () Bool)

(declare-fun tp_is_empty!16375 () Bool)

(assert (=> b!855231 (= e!476787 tp_is_empty!16375)))

(declare-fun b!855232 () Bool)

(declare-fun res!580872 () Bool)

(assert (=> b!855232 (=> (not res!580872) (not e!476788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48933 (_ BitVec 32)) Bool)

(assert (=> b!855232 (= res!580872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26162 () Bool)

(declare-fun mapRes!26162 () Bool)

(assert (=> mapIsEmpty!26162 mapRes!26162))

(declare-fun b!855233 () Bool)

(declare-fun res!580874 () Bool)

(assert (=> b!855233 (=> (not res!580874) (not e!476788))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855233 (= res!580874 (validKeyInArray!0 k0!854))))

(declare-fun b!855234 () Bool)

(declare-fun e!476790 () Bool)

(assert (=> b!855234 (= e!476790 tp_is_empty!16375)))

(declare-fun b!855235 () Bool)

(declare-fun res!580871 () Bool)

(assert (=> b!855235 (=> (not res!580871) (not e!476788))))

(declare-datatypes ((List!16674 0))(
  ( (Nil!16671) (Cons!16670 (h!17801 (_ BitVec 64)) (t!23306 List!16674)) )
))
(declare-fun arrayNoDuplicates!0 (array!48933 (_ BitVec 32) List!16674) Bool)

(assert (=> b!855235 (= res!580871 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16671))))

(declare-fun b!855236 () Bool)

(declare-fun res!580873 () Bool)

(assert (=> b!855236 (=> (not res!580873) (not e!476788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855236 (= res!580873 (validMask!0 mask!1196))))

(declare-fun b!855237 () Bool)

(declare-fun res!580868 () Bool)

(assert (=> b!855237 (=> (not res!580868) (not e!476788))))

(assert (=> b!855237 (= res!580868 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23940 _keys!868))))))

(declare-fun res!580870 () Bool)

(assert (=> start!73306 (=> (not res!580870) (not e!476788))))

(assert (=> start!73306 (= res!580870 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23940 _keys!868))))))

(assert (=> start!73306 e!476788))

(assert (=> start!73306 tp_is_empty!16375))

(assert (=> start!73306 true))

(assert (=> start!73306 tp!50222))

(declare-fun array_inv!18692 (array!48933) Bool)

(assert (=> start!73306 (array_inv!18692 _keys!868)))

(declare-fun e!476786 () Bool)

(declare-fun array_inv!18693 (array!48935) Bool)

(assert (=> start!73306 (and (array_inv!18693 _values!688) e!476786)))

(declare-fun b!855238 () Bool)

(declare-fun res!580875 () Bool)

(assert (=> b!855238 (=> (not res!580875) (not e!476788))))

(assert (=> b!855238 (= res!580875 (and (= (select (arr!23498 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855239 () Bool)

(assert (=> b!855239 (= e!476786 (and e!476787 mapRes!26162))))

(declare-fun condMapEmpty!26162 () Bool)

(declare-fun mapDefault!26162 () ValueCell!7748)

(assert (=> b!855239 (= condMapEmpty!26162 (= (arr!23499 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7748)) mapDefault!26162)))))

(declare-fun mapNonEmpty!26162 () Bool)

(declare-fun tp!50221 () Bool)

(assert (=> mapNonEmpty!26162 (= mapRes!26162 (and tp!50221 e!476790))))

(declare-fun mapRest!26162 () (Array (_ BitVec 32) ValueCell!7748))

(declare-fun mapValue!26162 () ValueCell!7748)

(declare-fun mapKey!26162 () (_ BitVec 32))

(assert (=> mapNonEmpty!26162 (= (arr!23499 _values!688) (store mapRest!26162 mapKey!26162 mapValue!26162))))

(declare-fun b!855240 () Bool)

(declare-fun res!580869 () Bool)

(assert (=> b!855240 (=> (not res!580869) (not e!476788))))

(assert (=> b!855240 (= res!580869 (and (= (size!23941 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23940 _keys!868) (size!23941 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73306 res!580870) b!855236))

(assert (= (and b!855236 res!580873) b!855240))

(assert (= (and b!855240 res!580869) b!855232))

(assert (= (and b!855232 res!580872) b!855235))

(assert (= (and b!855235 res!580871) b!855237))

(assert (= (and b!855237 res!580868) b!855233))

(assert (= (and b!855233 res!580874) b!855238))

(assert (= (and b!855238 res!580875) b!855230))

(assert (= (and b!855239 condMapEmpty!26162) mapIsEmpty!26162))

(assert (= (and b!855239 (not condMapEmpty!26162)) mapNonEmpty!26162))

(get-info :version)

(assert (= (and mapNonEmpty!26162 ((_ is ValueCellFull!7748) mapValue!26162)) b!855234))

(assert (= (and b!855239 ((_ is ValueCellFull!7748) mapDefault!26162)) b!855231))

(assert (= start!73306 b!855239))

(declare-fun m!795903 () Bool)

(assert (=> mapNonEmpty!26162 m!795903))

(declare-fun m!795905 () Bool)

(assert (=> start!73306 m!795905))

(declare-fun m!795907 () Bool)

(assert (=> start!73306 m!795907))

(declare-fun m!795909 () Bool)

(assert (=> b!855236 m!795909))

(declare-fun m!795911 () Bool)

(assert (=> b!855238 m!795911))

(declare-fun m!795913 () Bool)

(assert (=> b!855232 m!795913))

(declare-fun m!795915 () Bool)

(assert (=> b!855233 m!795915))

(declare-fun m!795917 () Bool)

(assert (=> b!855230 m!795917))

(declare-fun m!795919 () Bool)

(assert (=> b!855230 m!795919))

(declare-fun m!795921 () Bool)

(assert (=> b!855230 m!795921))

(declare-fun m!795923 () Bool)

(assert (=> b!855235 m!795923))

(check-sat tp_is_empty!16375 (not b!855235) (not mapNonEmpty!26162) (not start!73306) (not b!855230) (not b!855236) (not b!855232) b_and!23569 (not b_next!14239) (not b!855233))
(check-sat b_and!23569 (not b_next!14239))
