; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73416 () Bool)

(assert start!73416)

(declare-fun b_free!14331 () Bool)

(declare-fun b_next!14331 () Bool)

(assert (=> start!73416 (= b_free!14331 (not b_next!14331))))

(declare-fun tp!50496 () Bool)

(declare-fun b_and!23687 () Bool)

(assert (=> start!73416 (= tp!50496 b_and!23687)))

(declare-fun mapNonEmpty!26300 () Bool)

(declare-fun mapRes!26300 () Bool)

(declare-fun tp!50497 () Bool)

(declare-fun e!477723 () Bool)

(assert (=> mapNonEmpty!26300 (= mapRes!26300 (and tp!50497 e!477723))))

(declare-fun mapKey!26300 () (_ BitVec 32))

(declare-datatypes ((V!27003 0))(
  ( (V!27004 (val!8281 Int)) )
))
(declare-datatypes ((ValueCell!7794 0))(
  ( (ValueCellFull!7794 (v!10706 V!27003)) (EmptyCell!7794) )
))
(declare-fun mapValue!26300 () ValueCell!7794)

(declare-fun mapRest!26300 () (Array (_ BitVec 32) ValueCell!7794))

(declare-datatypes ((array!49126 0))(
  ( (array!49127 (arr!23594 (Array (_ BitVec 32) ValueCell!7794)) (size!24034 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49126)

(assert (=> mapNonEmpty!26300 (= (arr!23594 _values!688) (store mapRest!26300 mapKey!26300 mapValue!26300))))

(declare-fun b!857082 () Bool)

(declare-fun res!582178 () Bool)

(declare-fun e!477720 () Bool)

(assert (=> b!857082 (=> (not res!582178) (not e!477720))))

(declare-datatypes ((array!49128 0))(
  ( (array!49129 (arr!23595 (Array (_ BitVec 32) (_ BitVec 64))) (size!24035 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49128)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49128 (_ BitVec 32)) Bool)

(assert (=> b!857082 (= res!582178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857083 () Bool)

(declare-fun res!582183 () Bool)

(assert (=> b!857083 (=> (not res!582183) (not e!477720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857083 (= res!582183 (validMask!0 mask!1196))))

(declare-fun b!857085 () Bool)

(declare-fun res!582184 () Bool)

(assert (=> b!857085 (=> (not res!582184) (not e!477720))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857085 (= res!582184 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24035 _keys!868))))))

(declare-fun b!857086 () Bool)

(declare-fun e!477722 () Bool)

(assert (=> b!857086 (= e!477720 e!477722)))

(declare-fun res!582182 () Bool)

(assert (=> b!857086 (=> (not res!582182) (not e!477722))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857086 (= res!582182 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10924 0))(
  ( (tuple2!10925 (_1!5473 (_ BitVec 64)) (_2!5473 V!27003)) )
))
(declare-datatypes ((List!16732 0))(
  ( (Nil!16729) (Cons!16728 (h!17859 tuple2!10924) (t!23373 List!16732)) )
))
(declare-datatypes ((ListLongMap!9693 0))(
  ( (ListLongMap!9694 (toList!4862 List!16732)) )
))
(declare-fun lt!386170 () ListLongMap!9693)

(declare-fun minValue!654 () V!27003)

(declare-fun zeroValue!654 () V!27003)

(declare-fun lt!386172 () array!49126)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2843 (array!49128 array!49126 (_ BitVec 32) (_ BitVec 32) V!27003 V!27003 (_ BitVec 32) Int) ListLongMap!9693)

(assert (=> b!857086 (= lt!386170 (getCurrentListMapNoExtraKeys!2843 _keys!868 lt!386172 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27003)

(assert (=> b!857086 (= lt!386172 (array!49127 (store (arr!23594 _values!688) i!612 (ValueCellFull!7794 v!557)) (size!24034 _values!688)))))

(declare-fun lt!386173 () ListLongMap!9693)

(assert (=> b!857086 (= lt!386173 (getCurrentListMapNoExtraKeys!2843 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857087 () Bool)

(declare-fun res!582180 () Bool)

(assert (=> b!857087 (=> (not res!582180) (not e!477720))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857087 (= res!582180 (validKeyInArray!0 k0!854))))

(declare-fun b!857088 () Bool)

(declare-fun res!582185 () Bool)

(assert (=> b!857088 (=> (not res!582185) (not e!477720))))

(declare-datatypes ((List!16733 0))(
  ( (Nil!16730) (Cons!16729 (h!17860 (_ BitVec 64)) (t!23374 List!16733)) )
))
(declare-fun arrayNoDuplicates!0 (array!49128 (_ BitVec 32) List!16733) Bool)

(assert (=> b!857088 (= res!582185 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16730))))

(declare-fun b!857089 () Bool)

(declare-fun res!582179 () Bool)

(assert (=> b!857089 (=> (not res!582179) (not e!477720))))

(assert (=> b!857089 (= res!582179 (and (= (select (arr!23595 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857090 () Bool)

(declare-fun e!477719 () Bool)

(declare-fun e!477724 () Bool)

(assert (=> b!857090 (= e!477719 (and e!477724 mapRes!26300))))

(declare-fun condMapEmpty!26300 () Bool)

(declare-fun mapDefault!26300 () ValueCell!7794)

(assert (=> b!857090 (= condMapEmpty!26300 (= (arr!23594 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7794)) mapDefault!26300)))))

(declare-fun res!582181 () Bool)

(assert (=> start!73416 (=> (not res!582181) (not e!477720))))

(assert (=> start!73416 (= res!582181 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24035 _keys!868))))))

(assert (=> start!73416 e!477720))

(declare-fun tp_is_empty!16467 () Bool)

(assert (=> start!73416 tp_is_empty!16467))

(assert (=> start!73416 true))

(assert (=> start!73416 tp!50496))

(declare-fun array_inv!18686 (array!49128) Bool)

(assert (=> start!73416 (array_inv!18686 _keys!868)))

(declare-fun array_inv!18687 (array!49126) Bool)

(assert (=> start!73416 (and (array_inv!18687 _values!688) e!477719)))

(declare-fun b!857084 () Bool)

(assert (=> b!857084 (= e!477723 tp_is_empty!16467)))

(declare-fun b!857091 () Bool)

(assert (=> b!857091 (= e!477722 (not true))))

(declare-fun +!2216 (ListLongMap!9693 tuple2!10924) ListLongMap!9693)

(assert (=> b!857091 (= (getCurrentListMapNoExtraKeys!2843 _keys!868 lt!386172 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2216 (getCurrentListMapNoExtraKeys!2843 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10925 k0!854 v!557)))))

(declare-datatypes ((Unit!29219 0))(
  ( (Unit!29220) )
))
(declare-fun lt!386171 () Unit!29219)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!437 (array!49128 array!49126 (_ BitVec 32) (_ BitVec 32) V!27003 V!27003 (_ BitVec 32) (_ BitVec 64) V!27003 (_ BitVec 32) Int) Unit!29219)

(assert (=> b!857091 (= lt!386171 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!437 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26300 () Bool)

(assert (=> mapIsEmpty!26300 mapRes!26300))

(declare-fun b!857092 () Bool)

(assert (=> b!857092 (= e!477724 tp_is_empty!16467)))

(declare-fun b!857093 () Bool)

(declare-fun res!582177 () Bool)

(assert (=> b!857093 (=> (not res!582177) (not e!477720))))

(assert (=> b!857093 (= res!582177 (and (= (size!24034 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24035 _keys!868) (size!24034 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73416 res!582181) b!857083))

(assert (= (and b!857083 res!582183) b!857093))

(assert (= (and b!857093 res!582177) b!857082))

(assert (= (and b!857082 res!582178) b!857088))

(assert (= (and b!857088 res!582185) b!857085))

(assert (= (and b!857085 res!582184) b!857087))

(assert (= (and b!857087 res!582180) b!857089))

(assert (= (and b!857089 res!582179) b!857086))

(assert (= (and b!857086 res!582182) b!857091))

(assert (= (and b!857090 condMapEmpty!26300) mapIsEmpty!26300))

(assert (= (and b!857090 (not condMapEmpty!26300)) mapNonEmpty!26300))

(get-info :version)

(assert (= (and mapNonEmpty!26300 ((_ is ValueCellFull!7794) mapValue!26300)) b!857084))

(assert (= (and b!857090 ((_ is ValueCellFull!7794) mapDefault!26300)) b!857092))

(assert (= start!73416 b!857090))

(declare-fun m!797921 () Bool)

(assert (=> b!857091 m!797921))

(declare-fun m!797923 () Bool)

(assert (=> b!857091 m!797923))

(assert (=> b!857091 m!797923))

(declare-fun m!797925 () Bool)

(assert (=> b!857091 m!797925))

(declare-fun m!797927 () Bool)

(assert (=> b!857091 m!797927))

(declare-fun m!797929 () Bool)

(assert (=> b!857086 m!797929))

(declare-fun m!797931 () Bool)

(assert (=> b!857086 m!797931))

(declare-fun m!797933 () Bool)

(assert (=> b!857086 m!797933))

(declare-fun m!797935 () Bool)

(assert (=> b!857088 m!797935))

(declare-fun m!797937 () Bool)

(assert (=> mapNonEmpty!26300 m!797937))

(declare-fun m!797939 () Bool)

(assert (=> b!857083 m!797939))

(declare-fun m!797941 () Bool)

(assert (=> b!857087 m!797941))

(declare-fun m!797943 () Bool)

(assert (=> start!73416 m!797943))

(declare-fun m!797945 () Bool)

(assert (=> start!73416 m!797945))

(declare-fun m!797947 () Bool)

(assert (=> b!857082 m!797947))

(declare-fun m!797949 () Bool)

(assert (=> b!857089 m!797949))

(check-sat (not b!857083) b_and!23687 (not b!857087) (not b!857091) (not b!857088) (not mapNonEmpty!26300) tp_is_empty!16467 (not start!73416) (not b!857082) (not b_next!14331) (not b!857086))
(check-sat b_and!23687 (not b_next!14331))
