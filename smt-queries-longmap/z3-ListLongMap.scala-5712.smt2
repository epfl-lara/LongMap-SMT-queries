; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74038 () Bool)

(assert start!74038)

(declare-fun b_free!14971 () Bool)

(declare-fun b_next!14971 () Bool)

(assert (=> start!74038 (= b_free!14971 (not b_next!14971))))

(declare-fun tp!52417 () Bool)

(declare-fun b_and!24697 () Bool)

(assert (=> start!74038 (= tp!52417 b_and!24697)))

(declare-fun res!592019 () Bool)

(declare-fun e!484889 () Bool)

(assert (=> start!74038 (=> (not res!592019) (not e!484889))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50341 0))(
  ( (array!50342 (arr!24202 (Array (_ BitVec 32) (_ BitVec 64))) (size!24644 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50341)

(assert (=> start!74038 (= res!592019 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24644 _keys!868))))))

(assert (=> start!74038 e!484889))

(declare-fun tp_is_empty!17107 () Bool)

(assert (=> start!74038 tp_is_empty!17107))

(assert (=> start!74038 true))

(assert (=> start!74038 tp!52417))

(declare-fun array_inv!19172 (array!50341) Bool)

(assert (=> start!74038 (array_inv!19172 _keys!868)))

(declare-datatypes ((V!27857 0))(
  ( (V!27858 (val!8601 Int)) )
))
(declare-datatypes ((ValueCell!8114 0))(
  ( (ValueCellFull!8114 (v!11020 V!27857)) (EmptyCell!8114) )
))
(declare-datatypes ((array!50343 0))(
  ( (array!50344 (arr!24203 (Array (_ BitVec 32) ValueCell!8114)) (size!24645 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50343)

(declare-fun e!484892 () Bool)

(declare-fun array_inv!19173 (array!50343) Bool)

(assert (=> start!74038 (and (array_inv!19173 _values!688) e!484892)))

(declare-fun b!870892 () Bool)

(declare-fun res!592016 () Bool)

(assert (=> b!870892 (=> (not res!592016) (not e!484889))))

(declare-datatypes ((List!17221 0))(
  ( (Nil!17218) (Cons!17217 (h!18348 (_ BitVec 64)) (t!24249 List!17221)) )
))
(declare-fun arrayNoDuplicates!0 (array!50341 (_ BitVec 32) List!17221) Bool)

(assert (=> b!870892 (= res!592016 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17218))))

(declare-fun b!870893 () Bool)

(declare-fun e!484891 () Bool)

(assert (=> b!870893 (= e!484891 tp_is_empty!17107)))

(declare-fun b!870894 () Bool)

(declare-fun res!592018 () Bool)

(assert (=> b!870894 (=> (not res!592018) (not e!484889))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870894 (= res!592018 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27260 () Bool)

(declare-fun mapRes!27260 () Bool)

(assert (=> mapIsEmpty!27260 mapRes!27260))

(declare-fun b!870895 () Bool)

(declare-fun res!592017 () Bool)

(assert (=> b!870895 (=> (not res!592017) (not e!484889))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870895 (= res!592017 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24644 _keys!868))))))

(declare-fun b!870896 () Bool)

(declare-fun res!592015 () Bool)

(assert (=> b!870896 (=> (not res!592015) (not e!484889))))

(assert (=> b!870896 (= res!592015 (and (= (select (arr!24202 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870897 () Bool)

(declare-fun e!484890 () Bool)

(assert (=> b!870897 (= e!484890 (not true))))

(declare-fun lt!395131 () array!50343)

(declare-fun v!557 () V!27857)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27857)

(declare-fun zeroValue!654 () V!27857)

(declare-datatypes ((tuple2!11446 0))(
  ( (tuple2!11447 (_1!5734 (_ BitVec 64)) (_2!5734 V!27857)) )
))
(declare-datatypes ((List!17222 0))(
  ( (Nil!17219) (Cons!17218 (h!18349 tuple2!11446) (t!24250 List!17222)) )
))
(declare-datatypes ((ListLongMap!10205 0))(
  ( (ListLongMap!10206 (toList!5118 List!17222)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3111 (array!50341 array!50343 (_ BitVec 32) (_ BitVec 32) V!27857 V!27857 (_ BitVec 32) Int) ListLongMap!10205)

(declare-fun +!2477 (ListLongMap!10205 tuple2!11446) ListLongMap!10205)

(assert (=> b!870897 (= (getCurrentListMapNoExtraKeys!3111 _keys!868 lt!395131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2477 (getCurrentListMapNoExtraKeys!3111 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11447 k0!854 v!557)))))

(declare-datatypes ((Unit!29841 0))(
  ( (Unit!29842) )
))
(declare-fun lt!395129 () Unit!29841)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!645 (array!50341 array!50343 (_ BitVec 32) (_ BitVec 32) V!27857 V!27857 (_ BitVec 32) (_ BitVec 64) V!27857 (_ BitVec 32) Int) Unit!29841)

(assert (=> b!870897 (= lt!395129 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!645 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870898 () Bool)

(assert (=> b!870898 (= e!484892 (and e!484891 mapRes!27260))))

(declare-fun condMapEmpty!27260 () Bool)

(declare-fun mapDefault!27260 () ValueCell!8114)

(assert (=> b!870898 (= condMapEmpty!27260 (= (arr!24203 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8114)) mapDefault!27260)))))

(declare-fun b!870899 () Bool)

(declare-fun e!484893 () Bool)

(assert (=> b!870899 (= e!484893 tp_is_empty!17107)))

(declare-fun b!870900 () Bool)

(assert (=> b!870900 (= e!484889 e!484890)))

(declare-fun res!592014 () Bool)

(assert (=> b!870900 (=> (not res!592014) (not e!484890))))

(assert (=> b!870900 (= res!592014 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395132 () ListLongMap!10205)

(assert (=> b!870900 (= lt!395132 (getCurrentListMapNoExtraKeys!3111 _keys!868 lt!395131 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870900 (= lt!395131 (array!50344 (store (arr!24203 _values!688) i!612 (ValueCellFull!8114 v!557)) (size!24645 _values!688)))))

(declare-fun lt!395130 () ListLongMap!10205)

(assert (=> b!870900 (= lt!395130 (getCurrentListMapNoExtraKeys!3111 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870901 () Bool)

(declare-fun res!592020 () Bool)

(assert (=> b!870901 (=> (not res!592020) (not e!484889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870901 (= res!592020 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27260 () Bool)

(declare-fun tp!52418 () Bool)

(assert (=> mapNonEmpty!27260 (= mapRes!27260 (and tp!52418 e!484893))))

(declare-fun mapValue!27260 () ValueCell!8114)

(declare-fun mapKey!27260 () (_ BitVec 32))

(declare-fun mapRest!27260 () (Array (_ BitVec 32) ValueCell!8114))

(assert (=> mapNonEmpty!27260 (= (arr!24203 _values!688) (store mapRest!27260 mapKey!27260 mapValue!27260))))

(declare-fun b!870902 () Bool)

(declare-fun res!592013 () Bool)

(assert (=> b!870902 (=> (not res!592013) (not e!484889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50341 (_ BitVec 32)) Bool)

(assert (=> b!870902 (= res!592013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870903 () Bool)

(declare-fun res!592012 () Bool)

(assert (=> b!870903 (=> (not res!592012) (not e!484889))))

(assert (=> b!870903 (= res!592012 (and (= (size!24645 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24644 _keys!868) (size!24645 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74038 res!592019) b!870901))

(assert (= (and b!870901 res!592020) b!870903))

(assert (= (and b!870903 res!592012) b!870902))

(assert (= (and b!870902 res!592013) b!870892))

(assert (= (and b!870892 res!592016) b!870895))

(assert (= (and b!870895 res!592017) b!870894))

(assert (= (and b!870894 res!592018) b!870896))

(assert (= (and b!870896 res!592015) b!870900))

(assert (= (and b!870900 res!592014) b!870897))

(assert (= (and b!870898 condMapEmpty!27260) mapIsEmpty!27260))

(assert (= (and b!870898 (not condMapEmpty!27260)) mapNonEmpty!27260))

(get-info :version)

(assert (= (and mapNonEmpty!27260 ((_ is ValueCellFull!8114) mapValue!27260)) b!870899))

(assert (= (and b!870898 ((_ is ValueCellFull!8114) mapDefault!27260)) b!870893))

(assert (= start!74038 b!870898))

(declare-fun m!811629 () Bool)

(assert (=> start!74038 m!811629))

(declare-fun m!811631 () Bool)

(assert (=> start!74038 m!811631))

(declare-fun m!811633 () Bool)

(assert (=> b!870902 m!811633))

(declare-fun m!811635 () Bool)

(assert (=> b!870900 m!811635))

(declare-fun m!811637 () Bool)

(assert (=> b!870900 m!811637))

(declare-fun m!811639 () Bool)

(assert (=> b!870900 m!811639))

(declare-fun m!811641 () Bool)

(assert (=> b!870901 m!811641))

(declare-fun m!811643 () Bool)

(assert (=> b!870894 m!811643))

(declare-fun m!811645 () Bool)

(assert (=> mapNonEmpty!27260 m!811645))

(declare-fun m!811647 () Bool)

(assert (=> b!870892 m!811647))

(declare-fun m!811649 () Bool)

(assert (=> b!870897 m!811649))

(declare-fun m!811651 () Bool)

(assert (=> b!870897 m!811651))

(assert (=> b!870897 m!811651))

(declare-fun m!811653 () Bool)

(assert (=> b!870897 m!811653))

(declare-fun m!811655 () Bool)

(assert (=> b!870897 m!811655))

(declare-fun m!811657 () Bool)

(assert (=> b!870896 m!811657))

(check-sat (not b!870901) (not b!870897) (not mapNonEmpty!27260) (not start!74038) (not b!870902) b_and!24697 (not b!870892) tp_is_empty!17107 (not b!870894) (not b!870900) (not b_next!14971))
(check-sat b_and!24697 (not b_next!14971))
