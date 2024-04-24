; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74032 () Bool)

(assert start!74032)

(declare-fun b_free!14779 () Bool)

(declare-fun b_next!14779 () Bool)

(assert (=> start!74032 (= b_free!14779 (not b_next!14779))))

(declare-fun tp!51842 () Bool)

(declare-fun b_and!24541 () Bool)

(assert (=> start!74032 (= tp!51842 b_and!24541)))

(declare-fun b!868578 () Bool)

(declare-fun res!589881 () Bool)

(declare-fun e!483891 () Bool)

(assert (=> b!868578 (=> (not res!589881) (not e!483891))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868578 (= res!589881 (validKeyInArray!0 k0!854))))

(declare-fun b!868579 () Bool)

(declare-fun e!483892 () Bool)

(declare-fun tp_is_empty!16915 () Bool)

(assert (=> b!868579 (= e!483892 tp_is_empty!16915)))

(declare-fun b!868580 () Bool)

(declare-fun res!589876 () Bool)

(assert (=> b!868580 (=> (not res!589876) (not e!483891))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50039 0))(
  ( (array!50040 (arr!24046 (Array (_ BitVec 32) (_ BitVec 64))) (size!24487 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50039)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!868580 (= res!589876 (and (= (select (arr!24046 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868581 () Bool)

(declare-fun e!483895 () Bool)

(assert (=> b!868581 (= e!483895 tp_is_empty!16915)))

(declare-fun b!868582 () Bool)

(declare-fun res!589874 () Bool)

(assert (=> b!868582 (=> (not res!589874) (not e!483891))))

(assert (=> b!868582 (= res!589874 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24487 _keys!868))))))

(declare-fun res!589880 () Bool)

(assert (=> start!74032 (=> (not res!589880) (not e!483891))))

(assert (=> start!74032 (= res!589880 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24487 _keys!868))))))

(assert (=> start!74032 e!483891))

(assert (=> start!74032 tp_is_empty!16915))

(assert (=> start!74032 true))

(assert (=> start!74032 tp!51842))

(declare-fun array_inv!19052 (array!50039) Bool)

(assert (=> start!74032 (array_inv!19052 _keys!868)))

(declare-datatypes ((V!27601 0))(
  ( (V!27602 (val!8505 Int)) )
))
(declare-datatypes ((ValueCell!8018 0))(
  ( (ValueCellFull!8018 (v!10930 V!27601)) (EmptyCell!8018) )
))
(declare-datatypes ((array!50041 0))(
  ( (array!50042 (arr!24047 (Array (_ BitVec 32) ValueCell!8018)) (size!24488 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50041)

(declare-fun e!483894 () Bool)

(declare-fun array_inv!19053 (array!50041) Bool)

(assert (=> start!74032 (and (array_inv!19053 _values!688) e!483894)))

(declare-fun b!868583 () Bool)

(declare-fun res!589877 () Bool)

(assert (=> b!868583 (=> (not res!589877) (not e!483891))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!868583 (= res!589877 (and (= (size!24488 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24487 _keys!868) (size!24488 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868584 () Bool)

(declare-fun res!589882 () Bool)

(assert (=> b!868584 (=> (not res!589882) (not e!483891))))

(declare-datatypes ((List!17040 0))(
  ( (Nil!17037) (Cons!17036 (h!18173 (_ BitVec 64)) (t!24069 List!17040)) )
))
(declare-fun arrayNoDuplicates!0 (array!50039 (_ BitVec 32) List!17040) Bool)

(assert (=> b!868584 (= res!589882 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17037))))

(declare-fun mapNonEmpty!26972 () Bool)

(declare-fun mapRes!26972 () Bool)

(declare-fun tp!51841 () Bool)

(assert (=> mapNonEmpty!26972 (= mapRes!26972 (and tp!51841 e!483892))))

(declare-fun mapValue!26972 () ValueCell!8018)

(declare-fun mapRest!26972 () (Array (_ BitVec 32) ValueCell!8018))

(declare-fun mapKey!26972 () (_ BitVec 32))

(assert (=> mapNonEmpty!26972 (= (arr!24047 _values!688) (store mapRest!26972 mapKey!26972 mapValue!26972))))

(declare-fun b!868585 () Bool)

(assert (=> b!868585 (= e!483894 (and e!483895 mapRes!26972))))

(declare-fun condMapEmpty!26972 () Bool)

(declare-fun mapDefault!26972 () ValueCell!8018)

(assert (=> b!868585 (= condMapEmpty!26972 (= (arr!24047 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8018)) mapDefault!26972)))))

(declare-fun b!868586 () Bool)

(declare-fun res!589875 () Bool)

(assert (=> b!868586 (=> (not res!589875) (not e!483891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50039 (_ BitVec 32)) Bool)

(assert (=> b!868586 (= res!589875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26972 () Bool)

(assert (=> mapIsEmpty!26972 mapRes!26972))

(declare-fun b!868587 () Bool)

(declare-fun res!589878 () Bool)

(assert (=> b!868587 (=> (not res!589878) (not e!483891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868587 (= res!589878 (validMask!0 mask!1196))))

(declare-fun b!868588 () Bool)

(declare-fun e!483893 () Bool)

(assert (=> b!868588 (= e!483891 e!483893)))

(declare-fun res!589879 () Bool)

(assert (=> b!868588 (=> (not res!589879) (not e!483893))))

(assert (=> b!868588 (= res!589879 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11212 0))(
  ( (tuple2!11213 (_1!5617 (_ BitVec 64)) (_2!5617 V!27601)) )
))
(declare-datatypes ((List!17041 0))(
  ( (Nil!17038) (Cons!17037 (h!18174 tuple2!11212) (t!24070 List!17041)) )
))
(declare-datatypes ((ListLongMap!9983 0))(
  ( (ListLongMap!9984 (toList!5007 List!17041)) )
))
(declare-fun lt!394575 () ListLongMap!9983)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394576 () array!50041)

(declare-fun minValue!654 () V!27601)

(declare-fun zeroValue!654 () V!27601)

(declare-fun getCurrentListMapNoExtraKeys!3051 (array!50039 array!50041 (_ BitVec 32) (_ BitVec 32) V!27601 V!27601 (_ BitVec 32) Int) ListLongMap!9983)

(assert (=> b!868588 (= lt!394575 (getCurrentListMapNoExtraKeys!3051 _keys!868 lt!394576 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27601)

(assert (=> b!868588 (= lt!394576 (array!50042 (store (arr!24047 _values!688) i!612 (ValueCellFull!8018 v!557)) (size!24488 _values!688)))))

(declare-fun lt!394574 () ListLongMap!9983)

(assert (=> b!868588 (= lt!394574 (getCurrentListMapNoExtraKeys!3051 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868589 () Bool)

(assert (=> b!868589 (= e!483893 (not true))))

(declare-fun +!2408 (ListLongMap!9983 tuple2!11212) ListLongMap!9983)

(assert (=> b!868589 (= (getCurrentListMapNoExtraKeys!3051 _keys!868 lt!394576 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2408 (getCurrentListMapNoExtraKeys!3051 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11213 k0!854 v!557)))))

(declare-datatypes ((Unit!29766 0))(
  ( (Unit!29767) )
))
(declare-fun lt!394577 () Unit!29766)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!579 (array!50039 array!50041 (_ BitVec 32) (_ BitVec 32) V!27601 V!27601 (_ BitVec 32) (_ BitVec 64) V!27601 (_ BitVec 32) Int) Unit!29766)

(assert (=> b!868589 (= lt!394577 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!579 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74032 res!589880) b!868587))

(assert (= (and b!868587 res!589878) b!868583))

(assert (= (and b!868583 res!589877) b!868586))

(assert (= (and b!868586 res!589875) b!868584))

(assert (= (and b!868584 res!589882) b!868582))

(assert (= (and b!868582 res!589874) b!868578))

(assert (= (and b!868578 res!589881) b!868580))

(assert (= (and b!868580 res!589876) b!868588))

(assert (= (and b!868588 res!589879) b!868589))

(assert (= (and b!868585 condMapEmpty!26972) mapIsEmpty!26972))

(assert (= (and b!868585 (not condMapEmpty!26972)) mapNonEmpty!26972))

(get-info :version)

(assert (= (and mapNonEmpty!26972 ((_ is ValueCellFull!8018) mapValue!26972)) b!868579))

(assert (= (and b!868585 ((_ is ValueCellFull!8018) mapDefault!26972)) b!868581))

(assert (= start!74032 b!868585))

(declare-fun m!810797 () Bool)

(assert (=> b!868587 m!810797))

(declare-fun m!810799 () Bool)

(assert (=> b!868580 m!810799))

(declare-fun m!810801 () Bool)

(assert (=> start!74032 m!810801))

(declare-fun m!810803 () Bool)

(assert (=> start!74032 m!810803))

(declare-fun m!810805 () Bool)

(assert (=> mapNonEmpty!26972 m!810805))

(declare-fun m!810807 () Bool)

(assert (=> b!868586 m!810807))

(declare-fun m!810809 () Bool)

(assert (=> b!868584 m!810809))

(declare-fun m!810811 () Bool)

(assert (=> b!868578 m!810811))

(declare-fun m!810813 () Bool)

(assert (=> b!868588 m!810813))

(declare-fun m!810815 () Bool)

(assert (=> b!868588 m!810815))

(declare-fun m!810817 () Bool)

(assert (=> b!868588 m!810817))

(declare-fun m!810819 () Bool)

(assert (=> b!868589 m!810819))

(declare-fun m!810821 () Bool)

(assert (=> b!868589 m!810821))

(assert (=> b!868589 m!810821))

(declare-fun m!810823 () Bool)

(assert (=> b!868589 m!810823))

(declare-fun m!810825 () Bool)

(assert (=> b!868589 m!810825))

(check-sat (not b!868587) (not b!868588) (not b!868584) (not b!868578) (not b!868589) (not b!868586) tp_is_empty!16915 (not b_next!14779) (not mapNonEmpty!26972) (not start!74032) b_and!24541)
(check-sat b_and!24541 (not b_next!14779))
