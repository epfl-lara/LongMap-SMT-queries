; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73350 () Bool)

(assert start!73350)

(declare-fun b_free!14265 () Bool)

(declare-fun b_next!14265 () Bool)

(assert (=> start!73350 (= b_free!14265 (not b_next!14265))))

(declare-fun tp!50299 () Bool)

(declare-fun b_and!23621 () Bool)

(assert (=> start!73350 (= tp!50299 b_and!23621)))

(declare-fun b!855898 () Bool)

(declare-fun res!581292 () Bool)

(declare-fun e!477132 () Bool)

(assert (=> b!855898 (=> (not res!581292) (not e!477132))))

(declare-datatypes ((array!48998 0))(
  ( (array!48999 (arr!23530 (Array (_ BitVec 32) (_ BitVec 64))) (size!23970 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48998)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48998 (_ BitVec 32)) Bool)

(assert (=> b!855898 (= res!581292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855899 () Bool)

(declare-fun res!581297 () Bool)

(assert (=> b!855899 (=> (not res!581297) (not e!477132))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855899 (= res!581297 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23970 _keys!868))))))

(declare-fun mapIsEmpty!26201 () Bool)

(declare-fun mapRes!26201 () Bool)

(assert (=> mapIsEmpty!26201 mapRes!26201))

(declare-fun b!855900 () Bool)

(declare-fun res!581290 () Bool)

(assert (=> b!855900 (=> (not res!581290) (not e!477132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855900 (= res!581290 (validMask!0 mask!1196))))

(declare-fun b!855901 () Bool)

(declare-fun res!581296 () Bool)

(assert (=> b!855901 (=> (not res!581296) (not e!477132))))

(declare-datatypes ((List!16683 0))(
  ( (Nil!16680) (Cons!16679 (h!17810 (_ BitVec 64)) (t!23324 List!16683)) )
))
(declare-fun arrayNoDuplicates!0 (array!48998 (_ BitVec 32) List!16683) Bool)

(assert (=> b!855901 (= res!581296 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16680))))

(declare-fun b!855902 () Bool)

(assert (=> b!855902 (= e!477132 false)))

(declare-datatypes ((V!26915 0))(
  ( (V!26916 (val!8248 Int)) )
))
(declare-datatypes ((tuple2!10870 0))(
  ( (tuple2!10871 (_1!5446 (_ BitVec 64)) (_2!5446 V!26915)) )
))
(declare-datatypes ((List!16684 0))(
  ( (Nil!16681) (Cons!16680 (h!17811 tuple2!10870) (t!23325 List!16684)) )
))
(declare-datatypes ((ListLongMap!9639 0))(
  ( (ListLongMap!9640 (toList!4835 List!16684)) )
))
(declare-fun lt!385783 () ListLongMap!9639)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7761 0))(
  ( (ValueCellFull!7761 (v!10673 V!26915)) (EmptyCell!7761) )
))
(declare-datatypes ((array!49000 0))(
  ( (array!49001 (arr!23531 (Array (_ BitVec 32) ValueCell!7761)) (size!23971 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49000)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26915)

(declare-fun zeroValue!654 () V!26915)

(declare-fun v!557 () V!26915)

(declare-fun getCurrentListMapNoExtraKeys!2816 (array!48998 array!49000 (_ BitVec 32) (_ BitVec 32) V!26915 V!26915 (_ BitVec 32) Int) ListLongMap!9639)

(assert (=> b!855902 (= lt!385783 (getCurrentListMapNoExtraKeys!2816 _keys!868 (array!49001 (store (arr!23531 _values!688) i!612 (ValueCellFull!7761 v!557)) (size!23971 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385782 () ListLongMap!9639)

(assert (=> b!855902 (= lt!385782 (getCurrentListMapNoExtraKeys!2816 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855903 () Bool)

(declare-fun e!477129 () Bool)

(declare-fun tp_is_empty!16401 () Bool)

(assert (=> b!855903 (= e!477129 tp_is_empty!16401)))

(declare-fun mapNonEmpty!26201 () Bool)

(declare-fun tp!50298 () Bool)

(declare-fun e!477130 () Bool)

(assert (=> mapNonEmpty!26201 (= mapRes!26201 (and tp!50298 e!477130))))

(declare-fun mapValue!26201 () ValueCell!7761)

(declare-fun mapKey!26201 () (_ BitVec 32))

(declare-fun mapRest!26201 () (Array (_ BitVec 32) ValueCell!7761))

(assert (=> mapNonEmpty!26201 (= (arr!23531 _values!688) (store mapRest!26201 mapKey!26201 mapValue!26201))))

(declare-fun b!855904 () Bool)

(declare-fun res!581294 () Bool)

(assert (=> b!855904 (=> (not res!581294) (not e!477132))))

(assert (=> b!855904 (= res!581294 (and (= (size!23971 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23970 _keys!868) (size!23971 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855905 () Bool)

(declare-fun e!477131 () Bool)

(assert (=> b!855905 (= e!477131 (and e!477129 mapRes!26201))))

(declare-fun condMapEmpty!26201 () Bool)

(declare-fun mapDefault!26201 () ValueCell!7761)

(assert (=> b!855905 (= condMapEmpty!26201 (= (arr!23531 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7761)) mapDefault!26201)))))

(declare-fun b!855906 () Bool)

(declare-fun res!581295 () Bool)

(assert (=> b!855906 (=> (not res!581295) (not e!477132))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855906 (= res!581295 (validKeyInArray!0 k0!854))))

(declare-fun b!855907 () Bool)

(declare-fun res!581293 () Bool)

(assert (=> b!855907 (=> (not res!581293) (not e!477132))))

(assert (=> b!855907 (= res!581293 (and (= (select (arr!23530 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!581291 () Bool)

(assert (=> start!73350 (=> (not res!581291) (not e!477132))))

(assert (=> start!73350 (= res!581291 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23970 _keys!868))))))

(assert (=> start!73350 e!477132))

(assert (=> start!73350 tp_is_empty!16401))

(assert (=> start!73350 true))

(assert (=> start!73350 tp!50299))

(declare-fun array_inv!18644 (array!48998) Bool)

(assert (=> start!73350 (array_inv!18644 _keys!868)))

(declare-fun array_inv!18645 (array!49000) Bool)

(assert (=> start!73350 (and (array_inv!18645 _values!688) e!477131)))

(declare-fun b!855908 () Bool)

(assert (=> b!855908 (= e!477130 tp_is_empty!16401)))

(assert (= (and start!73350 res!581291) b!855900))

(assert (= (and b!855900 res!581290) b!855904))

(assert (= (and b!855904 res!581294) b!855898))

(assert (= (and b!855898 res!581292) b!855901))

(assert (= (and b!855901 res!581296) b!855899))

(assert (= (and b!855899 res!581297) b!855906))

(assert (= (and b!855906 res!581295) b!855907))

(assert (= (and b!855907 res!581293) b!855902))

(assert (= (and b!855905 condMapEmpty!26201) mapIsEmpty!26201))

(assert (= (and b!855905 (not condMapEmpty!26201)) mapNonEmpty!26201))

(get-info :version)

(assert (= (and mapNonEmpty!26201 ((_ is ValueCellFull!7761) mapValue!26201)) b!855908))

(assert (= (and b!855905 ((_ is ValueCellFull!7761) mapDefault!26201)) b!855903))

(assert (= start!73350 b!855905))

(declare-fun m!796947 () Bool)

(assert (=> b!855902 m!796947))

(declare-fun m!796949 () Bool)

(assert (=> b!855902 m!796949))

(declare-fun m!796951 () Bool)

(assert (=> b!855902 m!796951))

(declare-fun m!796953 () Bool)

(assert (=> b!855901 m!796953))

(declare-fun m!796955 () Bool)

(assert (=> b!855907 m!796955))

(declare-fun m!796957 () Bool)

(assert (=> b!855898 m!796957))

(declare-fun m!796959 () Bool)

(assert (=> mapNonEmpty!26201 m!796959))

(declare-fun m!796961 () Bool)

(assert (=> b!855900 m!796961))

(declare-fun m!796963 () Bool)

(assert (=> b!855906 m!796963))

(declare-fun m!796965 () Bool)

(assert (=> start!73350 m!796965))

(declare-fun m!796967 () Bool)

(assert (=> start!73350 m!796967))

(check-sat (not mapNonEmpty!26201) (not b_next!14265) (not b!855901) (not b!855902) (not b!855898) (not b!855900) b_and!23621 tp_is_empty!16401 (not b!855906) (not start!73350))
(check-sat b_and!23621 (not b_next!14265))
