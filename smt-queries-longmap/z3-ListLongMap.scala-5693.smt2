; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74110 () Bool)

(assert start!74110)

(declare-fun b_free!14857 () Bool)

(declare-fun b_next!14857 () Bool)

(assert (=> start!74110 (= b_free!14857 (not b_next!14857))))

(declare-fun tp!52076 () Bool)

(declare-fun b_and!24619 () Bool)

(assert (=> start!74110 (= tp!52076 b_and!24619)))

(declare-fun b!869982 () Bool)

(declare-fun res!590932 () Bool)

(declare-fun e!484595 () Bool)

(assert (=> b!869982 (=> (not res!590932) (not e!484595))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869982 (= res!590932 (validMask!0 mask!1196))))

(declare-fun b!869983 () Bool)

(declare-fun e!484596 () Bool)

(assert (=> b!869983 (= e!484595 e!484596)))

(declare-fun res!590933 () Bool)

(assert (=> b!869983 (=> (not res!590933) (not e!484596))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869983 (= res!590933 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27705 0))(
  ( (V!27706 (val!8544 Int)) )
))
(declare-datatypes ((tuple2!11274 0))(
  ( (tuple2!11275 (_1!5648 (_ BitVec 64)) (_2!5648 V!27705)) )
))
(declare-datatypes ((List!17097 0))(
  ( (Nil!17094) (Cons!17093 (h!18230 tuple2!11274) (t!24126 List!17097)) )
))
(declare-datatypes ((ListLongMap!10045 0))(
  ( (ListLongMap!10046 (toList!5038 List!17097)) )
))
(declare-fun lt!395044 () ListLongMap!10045)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50195 0))(
  ( (array!50196 (arr!24124 (Array (_ BitVec 32) (_ BitVec 64))) (size!24565 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50195)

(declare-datatypes ((ValueCell!8057 0))(
  ( (ValueCellFull!8057 (v!10969 V!27705)) (EmptyCell!8057) )
))
(declare-datatypes ((array!50197 0))(
  ( (array!50198 (arr!24125 (Array (_ BitVec 32) ValueCell!8057)) (size!24566 (_ BitVec 32))) )
))
(declare-fun lt!395043 () array!50197)

(declare-fun minValue!654 () V!27705)

(declare-fun zeroValue!654 () V!27705)

(declare-fun getCurrentListMapNoExtraKeys!3082 (array!50195 array!50197 (_ BitVec 32) (_ BitVec 32) V!27705 V!27705 (_ BitVec 32) Int) ListLongMap!10045)

(assert (=> b!869983 (= lt!395044 (getCurrentListMapNoExtraKeys!3082 _keys!868 lt!395043 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27705)

(declare-fun _values!688 () array!50197)

(assert (=> b!869983 (= lt!395043 (array!50198 (store (arr!24125 _values!688) i!612 (ValueCellFull!8057 v!557)) (size!24566 _values!688)))))

(declare-fun lt!395045 () ListLongMap!10045)

(assert (=> b!869983 (= lt!395045 (getCurrentListMapNoExtraKeys!3082 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869984 () Bool)

(declare-fun res!590927 () Bool)

(assert (=> b!869984 (=> (not res!590927) (not e!484595))))

(declare-datatypes ((List!17098 0))(
  ( (Nil!17095) (Cons!17094 (h!18231 (_ BitVec 64)) (t!24127 List!17098)) )
))
(declare-fun arrayNoDuplicates!0 (array!50195 (_ BitVec 32) List!17098) Bool)

(assert (=> b!869984 (= res!590927 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17095))))

(declare-fun mapIsEmpty!27089 () Bool)

(declare-fun mapRes!27089 () Bool)

(assert (=> mapIsEmpty!27089 mapRes!27089))

(declare-fun b!869985 () Bool)

(assert (=> b!869985 (= e!484596 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2434 (ListLongMap!10045 tuple2!11274) ListLongMap!10045)

(assert (=> b!869985 (= (getCurrentListMapNoExtraKeys!3082 _keys!868 lt!395043 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2434 (getCurrentListMapNoExtraKeys!3082 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11275 k0!854 v!557)))))

(declare-datatypes ((Unit!29818 0))(
  ( (Unit!29819) )
))
(declare-fun lt!395042 () Unit!29818)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!605 (array!50195 array!50197 (_ BitVec 32) (_ BitVec 32) V!27705 V!27705 (_ BitVec 32) (_ BitVec 64) V!27705 (_ BitVec 32) Int) Unit!29818)

(assert (=> b!869985 (= lt!395042 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!605 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!590928 () Bool)

(assert (=> start!74110 (=> (not res!590928) (not e!484595))))

(assert (=> start!74110 (= res!590928 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24565 _keys!868))))))

(assert (=> start!74110 e!484595))

(declare-fun tp_is_empty!16993 () Bool)

(assert (=> start!74110 tp_is_empty!16993))

(assert (=> start!74110 true))

(assert (=> start!74110 tp!52076))

(declare-fun array_inv!19110 (array!50195) Bool)

(assert (=> start!74110 (array_inv!19110 _keys!868)))

(declare-fun e!484594 () Bool)

(declare-fun array_inv!19111 (array!50197) Bool)

(assert (=> start!74110 (and (array_inv!19111 _values!688) e!484594)))

(declare-fun b!869986 () Bool)

(declare-fun res!590929 () Bool)

(assert (=> b!869986 (=> (not res!590929) (not e!484595))))

(assert (=> b!869986 (= res!590929 (and (= (select (arr!24124 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869987 () Bool)

(declare-fun res!590930 () Bool)

(assert (=> b!869987 (=> (not res!590930) (not e!484595))))

(assert (=> b!869987 (= res!590930 (and (= (size!24566 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24565 _keys!868) (size!24566 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27089 () Bool)

(declare-fun tp!52075 () Bool)

(declare-fun e!484593 () Bool)

(assert (=> mapNonEmpty!27089 (= mapRes!27089 (and tp!52075 e!484593))))

(declare-fun mapKey!27089 () (_ BitVec 32))

(declare-fun mapValue!27089 () ValueCell!8057)

(declare-fun mapRest!27089 () (Array (_ BitVec 32) ValueCell!8057))

(assert (=> mapNonEmpty!27089 (= (arr!24125 _values!688) (store mapRest!27089 mapKey!27089 mapValue!27089))))

(declare-fun b!869988 () Bool)

(declare-fun res!590935 () Bool)

(assert (=> b!869988 (=> (not res!590935) (not e!484595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869988 (= res!590935 (validKeyInArray!0 k0!854))))

(declare-fun b!869989 () Bool)

(declare-fun e!484597 () Bool)

(assert (=> b!869989 (= e!484597 tp_is_empty!16993)))

(declare-fun b!869990 () Bool)

(assert (=> b!869990 (= e!484593 tp_is_empty!16993)))

(declare-fun b!869991 () Bool)

(declare-fun res!590931 () Bool)

(assert (=> b!869991 (=> (not res!590931) (not e!484595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50195 (_ BitVec 32)) Bool)

(assert (=> b!869991 (= res!590931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869992 () Bool)

(assert (=> b!869992 (= e!484594 (and e!484597 mapRes!27089))))

(declare-fun condMapEmpty!27089 () Bool)

(declare-fun mapDefault!27089 () ValueCell!8057)

(assert (=> b!869992 (= condMapEmpty!27089 (= (arr!24125 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8057)) mapDefault!27089)))))

(declare-fun b!869993 () Bool)

(declare-fun res!590934 () Bool)

(assert (=> b!869993 (=> (not res!590934) (not e!484595))))

(assert (=> b!869993 (= res!590934 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24565 _keys!868))))))

(assert (= (and start!74110 res!590928) b!869982))

(assert (= (and b!869982 res!590932) b!869987))

(assert (= (and b!869987 res!590930) b!869991))

(assert (= (and b!869991 res!590931) b!869984))

(assert (= (and b!869984 res!590927) b!869993))

(assert (= (and b!869993 res!590934) b!869988))

(assert (= (and b!869988 res!590935) b!869986))

(assert (= (and b!869986 res!590929) b!869983))

(assert (= (and b!869983 res!590933) b!869985))

(assert (= (and b!869992 condMapEmpty!27089) mapIsEmpty!27089))

(assert (= (and b!869992 (not condMapEmpty!27089)) mapNonEmpty!27089))

(get-info :version)

(assert (= (and mapNonEmpty!27089 ((_ is ValueCellFull!8057) mapValue!27089)) b!869990))

(assert (= (and b!869992 ((_ is ValueCellFull!8057) mapDefault!27089)) b!869989))

(assert (= start!74110 b!869992))

(declare-fun m!811967 () Bool)

(assert (=> b!869988 m!811967))

(declare-fun m!811969 () Bool)

(assert (=> mapNonEmpty!27089 m!811969))

(declare-fun m!811971 () Bool)

(assert (=> b!869991 m!811971))

(declare-fun m!811973 () Bool)

(assert (=> b!869983 m!811973))

(declare-fun m!811975 () Bool)

(assert (=> b!869983 m!811975))

(declare-fun m!811977 () Bool)

(assert (=> b!869983 m!811977))

(declare-fun m!811979 () Bool)

(assert (=> start!74110 m!811979))

(declare-fun m!811981 () Bool)

(assert (=> start!74110 m!811981))

(declare-fun m!811983 () Bool)

(assert (=> b!869982 m!811983))

(declare-fun m!811985 () Bool)

(assert (=> b!869985 m!811985))

(declare-fun m!811987 () Bool)

(assert (=> b!869985 m!811987))

(assert (=> b!869985 m!811987))

(declare-fun m!811989 () Bool)

(assert (=> b!869985 m!811989))

(declare-fun m!811991 () Bool)

(assert (=> b!869985 m!811991))

(declare-fun m!811993 () Bool)

(assert (=> b!869986 m!811993))

(declare-fun m!811995 () Bool)

(assert (=> b!869984 m!811995))

(check-sat (not mapNonEmpty!27089) (not b_next!14857) (not b!869988) b_and!24619 (not b!869991) tp_is_empty!16993 (not b!869983) (not b!869982) (not start!74110) (not b!869984) (not b!869985))
(check-sat b_and!24619 (not b_next!14857))
