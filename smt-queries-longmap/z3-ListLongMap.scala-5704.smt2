; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74176 () Bool)

(assert start!74176)

(declare-fun b_free!14923 () Bool)

(declare-fun b_next!14923 () Bool)

(assert (=> start!74176 (= b_free!14923 (not b_next!14923))))

(declare-fun tp!52273 () Bool)

(declare-fun b_and!24685 () Bool)

(assert (=> start!74176 (= tp!52273 b_and!24685)))

(declare-fun res!591825 () Bool)

(declare-fun e!485187 () Bool)

(assert (=> start!74176 (=> (not res!591825) (not e!485187))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50321 0))(
  ( (array!50322 (arr!24187 (Array (_ BitVec 32) (_ BitVec 64))) (size!24628 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50321)

(assert (=> start!74176 (= res!591825 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24628 _keys!868))))))

(assert (=> start!74176 e!485187))

(declare-fun tp_is_empty!17059 () Bool)

(assert (=> start!74176 tp_is_empty!17059))

(assert (=> start!74176 true))

(assert (=> start!74176 tp!52273))

(declare-fun array_inv!19160 (array!50321) Bool)

(assert (=> start!74176 (array_inv!19160 _keys!868)))

(declare-datatypes ((V!27793 0))(
  ( (V!27794 (val!8577 Int)) )
))
(declare-datatypes ((ValueCell!8090 0))(
  ( (ValueCellFull!8090 (v!11002 V!27793)) (EmptyCell!8090) )
))
(declare-datatypes ((array!50323 0))(
  ( (array!50324 (arr!24188 (Array (_ BitVec 32) ValueCell!8090)) (size!24629 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50323)

(declare-fun e!485190 () Bool)

(declare-fun array_inv!19161 (array!50323) Bool)

(assert (=> start!74176 (and (array_inv!19161 _values!688) e!485190)))

(declare-fun b!871170 () Bool)

(declare-fun res!591822 () Bool)

(assert (=> b!871170 (=> (not res!591822) (not e!485187))))

(declare-datatypes ((List!17142 0))(
  ( (Nil!17139) (Cons!17138 (h!18275 (_ BitVec 64)) (t!24171 List!17142)) )
))
(declare-fun arrayNoDuplicates!0 (array!50321 (_ BitVec 32) List!17142) Bool)

(assert (=> b!871170 (= res!591822 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17139))))

(declare-fun b!871171 () Bool)

(declare-fun e!485189 () Bool)

(assert (=> b!871171 (= e!485189 tp_is_empty!17059)))

(declare-fun b!871172 () Bool)

(declare-fun res!591824 () Bool)

(assert (=> b!871172 (=> (not res!591824) (not e!485187))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871172 (= res!591824 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27188 () Bool)

(declare-fun mapRes!27188 () Bool)

(assert (=> mapIsEmpty!27188 mapRes!27188))

(declare-fun b!871173 () Bool)

(declare-fun res!591823 () Bool)

(assert (=> b!871173 (=> (not res!591823) (not e!485187))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871173 (= res!591823 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24628 _keys!868))))))

(declare-fun b!871174 () Bool)

(declare-fun res!591821 () Bool)

(assert (=> b!871174 (=> (not res!591821) (not e!485187))))

(assert (=> b!871174 (= res!591821 (and (= (select (arr!24187 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871175 () Bool)

(declare-fun e!485188 () Bool)

(assert (=> b!871175 (= e!485188 (not true))))

(declare-fun lt!395440 () array!50323)

(declare-fun v!557 () V!27793)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27793)

(declare-fun zeroValue!654 () V!27793)

(declare-datatypes ((tuple2!11324 0))(
  ( (tuple2!11325 (_1!5673 (_ BitVec 64)) (_2!5673 V!27793)) )
))
(declare-datatypes ((List!17143 0))(
  ( (Nil!17140) (Cons!17139 (h!18276 tuple2!11324) (t!24172 List!17143)) )
))
(declare-datatypes ((ListLongMap!10095 0))(
  ( (ListLongMap!10096 (toList!5063 List!17143)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3107 (array!50321 array!50323 (_ BitVec 32) (_ BitVec 32) V!27793 V!27793 (_ BitVec 32) Int) ListLongMap!10095)

(declare-fun +!2456 (ListLongMap!10095 tuple2!11324) ListLongMap!10095)

(assert (=> b!871175 (= (getCurrentListMapNoExtraKeys!3107 _keys!868 lt!395440 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2456 (getCurrentListMapNoExtraKeys!3107 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11325 k0!854 v!557)))))

(declare-datatypes ((Unit!29862 0))(
  ( (Unit!29863) )
))
(declare-fun lt!395438 () Unit!29862)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!627 (array!50321 array!50323 (_ BitVec 32) (_ BitVec 32) V!27793 V!27793 (_ BitVec 32) (_ BitVec 64) V!27793 (_ BitVec 32) Int) Unit!29862)

(assert (=> b!871175 (= lt!395438 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!627 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871176 () Bool)

(assert (=> b!871176 (= e!485190 (and e!485189 mapRes!27188))))

(declare-fun condMapEmpty!27188 () Bool)

(declare-fun mapDefault!27188 () ValueCell!8090)

(assert (=> b!871176 (= condMapEmpty!27188 (= (arr!24188 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8090)) mapDefault!27188)))))

(declare-fun b!871177 () Bool)

(declare-fun e!485191 () Bool)

(assert (=> b!871177 (= e!485191 tp_is_empty!17059)))

(declare-fun b!871178 () Bool)

(assert (=> b!871178 (= e!485187 e!485188)))

(declare-fun res!591820 () Bool)

(assert (=> b!871178 (=> (not res!591820) (not e!485188))))

(assert (=> b!871178 (= res!591820 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395441 () ListLongMap!10095)

(assert (=> b!871178 (= lt!395441 (getCurrentListMapNoExtraKeys!3107 _keys!868 lt!395440 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871178 (= lt!395440 (array!50324 (store (arr!24188 _values!688) i!612 (ValueCellFull!8090 v!557)) (size!24629 _values!688)))))

(declare-fun lt!395439 () ListLongMap!10095)

(assert (=> b!871178 (= lt!395439 (getCurrentListMapNoExtraKeys!3107 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871179 () Bool)

(declare-fun res!591826 () Bool)

(assert (=> b!871179 (=> (not res!591826) (not e!485187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871179 (= res!591826 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27188 () Bool)

(declare-fun tp!52274 () Bool)

(assert (=> mapNonEmpty!27188 (= mapRes!27188 (and tp!52274 e!485191))))

(declare-fun mapValue!27188 () ValueCell!8090)

(declare-fun mapKey!27188 () (_ BitVec 32))

(declare-fun mapRest!27188 () (Array (_ BitVec 32) ValueCell!8090))

(assert (=> mapNonEmpty!27188 (= (arr!24188 _values!688) (store mapRest!27188 mapKey!27188 mapValue!27188))))

(declare-fun b!871180 () Bool)

(declare-fun res!591819 () Bool)

(assert (=> b!871180 (=> (not res!591819) (not e!485187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50321 (_ BitVec 32)) Bool)

(assert (=> b!871180 (= res!591819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871181 () Bool)

(declare-fun res!591818 () Bool)

(assert (=> b!871181 (=> (not res!591818) (not e!485187))))

(assert (=> b!871181 (= res!591818 (and (= (size!24629 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24628 _keys!868) (size!24629 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74176 res!591825) b!871179))

(assert (= (and b!871179 res!591826) b!871181))

(assert (= (and b!871181 res!591818) b!871180))

(assert (= (and b!871180 res!591819) b!871170))

(assert (= (and b!871170 res!591822) b!871173))

(assert (= (and b!871173 res!591823) b!871172))

(assert (= (and b!871172 res!591824) b!871174))

(assert (= (and b!871174 res!591821) b!871178))

(assert (= (and b!871178 res!591820) b!871175))

(assert (= (and b!871176 condMapEmpty!27188) mapIsEmpty!27188))

(assert (= (and b!871176 (not condMapEmpty!27188)) mapNonEmpty!27188))

(get-info :version)

(assert (= (and mapNonEmpty!27188 ((_ is ValueCellFull!8090) mapValue!27188)) b!871177))

(assert (= (and b!871176 ((_ is ValueCellFull!8090) mapDefault!27188)) b!871171))

(assert (= start!74176 b!871176))

(declare-fun m!812957 () Bool)

(assert (=> start!74176 m!812957))

(declare-fun m!812959 () Bool)

(assert (=> start!74176 m!812959))

(declare-fun m!812961 () Bool)

(assert (=> b!871180 m!812961))

(declare-fun m!812963 () Bool)

(assert (=> b!871178 m!812963))

(declare-fun m!812965 () Bool)

(assert (=> b!871178 m!812965))

(declare-fun m!812967 () Bool)

(assert (=> b!871178 m!812967))

(declare-fun m!812969 () Bool)

(assert (=> b!871179 m!812969))

(declare-fun m!812971 () Bool)

(assert (=> b!871172 m!812971))

(declare-fun m!812973 () Bool)

(assert (=> mapNonEmpty!27188 m!812973))

(declare-fun m!812975 () Bool)

(assert (=> b!871170 m!812975))

(declare-fun m!812977 () Bool)

(assert (=> b!871175 m!812977))

(declare-fun m!812979 () Bool)

(assert (=> b!871175 m!812979))

(assert (=> b!871175 m!812979))

(declare-fun m!812981 () Bool)

(assert (=> b!871175 m!812981))

(declare-fun m!812983 () Bool)

(assert (=> b!871175 m!812983))

(declare-fun m!812985 () Bool)

(assert (=> b!871174 m!812985))

(check-sat (not b!871179) (not b!871175) (not mapNonEmpty!27188) (not start!74176) (not b!871180) b_and!24685 (not b!871170) tp_is_empty!17059 (not b!871172) (not b!871178) (not b_next!14923))
(check-sat b_and!24685 (not b_next!14923))
