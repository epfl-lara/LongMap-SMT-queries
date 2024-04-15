; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73924 () Bool)

(assert start!73924)

(declare-fun b_free!14857 () Bool)

(declare-fun b_next!14857 () Bool)

(assert (=> start!73924 (= b_free!14857 (not b_next!14857))))

(declare-fun tp!52075 () Bool)

(declare-fun b_and!24583 () Bool)

(assert (=> start!73924 (= tp!52075 b_and!24583)))

(declare-fun b!868840 () Bool)

(declare-fun e!483867 () Bool)

(declare-fun e!483863 () Bool)

(declare-fun mapRes!27089 () Bool)

(assert (=> b!868840 (= e!483867 (and e!483863 mapRes!27089))))

(declare-fun condMapEmpty!27089 () Bool)

(declare-datatypes ((V!27705 0))(
  ( (V!27706 (val!8544 Int)) )
))
(declare-datatypes ((ValueCell!8057 0))(
  ( (ValueCellFull!8057 (v!10963 V!27705)) (EmptyCell!8057) )
))
(declare-datatypes ((array!50127 0))(
  ( (array!50128 (arr!24095 (Array (_ BitVec 32) ValueCell!8057)) (size!24537 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50127)

(declare-fun mapDefault!27089 () ValueCell!8057)

(assert (=> b!868840 (= condMapEmpty!27089 (= (arr!24095 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8057)) mapDefault!27089)))))

(declare-fun b!868841 () Bool)

(declare-fun tp_is_empty!16993 () Bool)

(assert (=> b!868841 (= e!483863 tp_is_empty!16993)))

(declare-fun b!868842 () Bool)

(declare-fun res!590476 () Bool)

(declare-fun e!483865 () Bool)

(assert (=> b!868842 (=> (not res!590476) (not e!483865))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868842 (= res!590476 (validKeyInArray!0 k0!854))))

(declare-fun b!868843 () Bool)

(declare-fun res!590473 () Bool)

(assert (=> b!868843 (=> (not res!590473) (not e!483865))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868843 (= res!590473 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27089 () Bool)

(declare-fun tp!52076 () Bool)

(declare-fun e!483864 () Bool)

(assert (=> mapNonEmpty!27089 (= mapRes!27089 (and tp!52076 e!483864))))

(declare-fun mapRest!27089 () (Array (_ BitVec 32) ValueCell!8057))

(declare-fun mapKey!27089 () (_ BitVec 32))

(declare-fun mapValue!27089 () ValueCell!8057)

(assert (=> mapNonEmpty!27089 (= (arr!24095 _values!688) (store mapRest!27089 mapKey!27089 mapValue!27089))))

(declare-fun b!868844 () Bool)

(declare-fun res!590475 () Bool)

(assert (=> b!868844 (=> (not res!590475) (not e!483865))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50129 0))(
  ( (array!50130 (arr!24096 (Array (_ BitVec 32) (_ BitVec 64))) (size!24538 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50129)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!868844 (= res!590475 (and (= (select (arr!24096 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868845 () Bool)

(declare-fun e!483866 () Bool)

(assert (=> b!868845 (= e!483866 (not true))))

(declare-fun lt!394447 () array!50127)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27705)

(declare-fun zeroValue!654 () V!27705)

(declare-fun v!557 () V!27705)

(declare-datatypes ((tuple2!11366 0))(
  ( (tuple2!11367 (_1!5694 (_ BitVec 64)) (_2!5694 V!27705)) )
))
(declare-datatypes ((List!17150 0))(
  ( (Nil!17147) (Cons!17146 (h!18277 tuple2!11366) (t!24178 List!17150)) )
))
(declare-datatypes ((ListLongMap!10125 0))(
  ( (ListLongMap!10126 (toList!5078 List!17150)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3071 (array!50129 array!50127 (_ BitVec 32) (_ BitVec 32) V!27705 V!27705 (_ BitVec 32) Int) ListLongMap!10125)

(declare-fun +!2440 (ListLongMap!10125 tuple2!11366) ListLongMap!10125)

(assert (=> b!868845 (= (getCurrentListMapNoExtraKeys!3071 _keys!868 lt!394447 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2440 (getCurrentListMapNoExtraKeys!3071 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11367 k0!854 v!557)))))

(declare-datatypes ((Unit!29767 0))(
  ( (Unit!29768) )
))
(declare-fun lt!394448 () Unit!29767)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!608 (array!50129 array!50127 (_ BitVec 32) (_ BitVec 32) V!27705 V!27705 (_ BitVec 32) (_ BitVec 64) V!27705 (_ BitVec 32) Int) Unit!29767)

(assert (=> b!868845 (= lt!394448 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!608 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868846 () Bool)

(declare-fun res!590479 () Bool)

(assert (=> b!868846 (=> (not res!590479) (not e!483865))))

(declare-datatypes ((List!17151 0))(
  ( (Nil!17148) (Cons!17147 (h!18278 (_ BitVec 64)) (t!24179 List!17151)) )
))
(declare-fun arrayNoDuplicates!0 (array!50129 (_ BitVec 32) List!17151) Bool)

(assert (=> b!868846 (= res!590479 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17148))))

(declare-fun b!868848 () Bool)

(declare-fun res!590474 () Bool)

(assert (=> b!868848 (=> (not res!590474) (not e!483865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50129 (_ BitVec 32)) Bool)

(assert (=> b!868848 (= res!590474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868849 () Bool)

(declare-fun res!590480 () Bool)

(assert (=> b!868849 (=> (not res!590480) (not e!483865))))

(assert (=> b!868849 (= res!590480 (and (= (size!24537 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24538 _keys!868) (size!24537 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868850 () Bool)

(assert (=> b!868850 (= e!483864 tp_is_empty!16993)))

(declare-fun b!868851 () Bool)

(assert (=> b!868851 (= e!483865 e!483866)))

(declare-fun res!590478 () Bool)

(assert (=> b!868851 (=> (not res!590478) (not e!483866))))

(assert (=> b!868851 (= res!590478 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394445 () ListLongMap!10125)

(assert (=> b!868851 (= lt!394445 (getCurrentListMapNoExtraKeys!3071 _keys!868 lt!394447 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868851 (= lt!394447 (array!50128 (store (arr!24095 _values!688) i!612 (ValueCellFull!8057 v!557)) (size!24537 _values!688)))))

(declare-fun lt!394446 () ListLongMap!10125)

(assert (=> b!868851 (= lt!394446 (getCurrentListMapNoExtraKeys!3071 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27089 () Bool)

(assert (=> mapIsEmpty!27089 mapRes!27089))

(declare-fun res!590477 () Bool)

(assert (=> start!73924 (=> (not res!590477) (not e!483865))))

(assert (=> start!73924 (= res!590477 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24538 _keys!868))))))

(assert (=> start!73924 e!483865))

(assert (=> start!73924 tp_is_empty!16993))

(assert (=> start!73924 true))

(assert (=> start!73924 tp!52075))

(declare-fun array_inv!19102 (array!50129) Bool)

(assert (=> start!73924 (array_inv!19102 _keys!868)))

(declare-fun array_inv!19103 (array!50127) Bool)

(assert (=> start!73924 (and (array_inv!19103 _values!688) e!483867)))

(declare-fun b!868847 () Bool)

(declare-fun res!590481 () Bool)

(assert (=> b!868847 (=> (not res!590481) (not e!483865))))

(assert (=> b!868847 (= res!590481 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24538 _keys!868))))))

(assert (= (and start!73924 res!590477) b!868843))

(assert (= (and b!868843 res!590473) b!868849))

(assert (= (and b!868849 res!590480) b!868848))

(assert (= (and b!868848 res!590474) b!868846))

(assert (= (and b!868846 res!590479) b!868847))

(assert (= (and b!868847 res!590481) b!868842))

(assert (= (and b!868842 res!590476) b!868844))

(assert (= (and b!868844 res!590475) b!868851))

(assert (= (and b!868851 res!590478) b!868845))

(assert (= (and b!868840 condMapEmpty!27089) mapIsEmpty!27089))

(assert (= (and b!868840 (not condMapEmpty!27089)) mapNonEmpty!27089))

(get-info :version)

(assert (= (and mapNonEmpty!27089 ((_ is ValueCellFull!8057) mapValue!27089)) b!868850))

(assert (= (and b!868840 ((_ is ValueCellFull!8057) mapDefault!27089)) b!868841))

(assert (= start!73924 b!868840))

(declare-fun m!809919 () Bool)

(assert (=> start!73924 m!809919))

(declare-fun m!809921 () Bool)

(assert (=> start!73924 m!809921))

(declare-fun m!809923 () Bool)

(assert (=> b!868843 m!809923))

(declare-fun m!809925 () Bool)

(assert (=> b!868842 m!809925))

(declare-fun m!809927 () Bool)

(assert (=> b!868846 m!809927))

(declare-fun m!809929 () Bool)

(assert (=> b!868845 m!809929))

(declare-fun m!809931 () Bool)

(assert (=> b!868845 m!809931))

(assert (=> b!868845 m!809931))

(declare-fun m!809933 () Bool)

(assert (=> b!868845 m!809933))

(declare-fun m!809935 () Bool)

(assert (=> b!868845 m!809935))

(declare-fun m!809937 () Bool)

(assert (=> b!868844 m!809937))

(declare-fun m!809939 () Bool)

(assert (=> b!868851 m!809939))

(declare-fun m!809941 () Bool)

(assert (=> b!868851 m!809941))

(declare-fun m!809943 () Bool)

(assert (=> b!868851 m!809943))

(declare-fun m!809945 () Bool)

(assert (=> mapNonEmpty!27089 m!809945))

(declare-fun m!809947 () Bool)

(assert (=> b!868848 m!809947))

(check-sat (not b!868842) (not mapNonEmpty!27089) (not b!868846) (not b!868845) tp_is_empty!16993 b_and!24583 (not b!868851) (not start!73924) (not b!868848) (not b_next!14857) (not b!868843))
(check-sat b_and!24583 (not b_next!14857))
