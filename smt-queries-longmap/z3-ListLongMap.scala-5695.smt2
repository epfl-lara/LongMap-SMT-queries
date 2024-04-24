; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74122 () Bool)

(assert start!74122)

(declare-fun b_free!14869 () Bool)

(declare-fun b_next!14869 () Bool)

(assert (=> start!74122 (= b_free!14869 (not b_next!14869))))

(declare-fun tp!52112 () Bool)

(declare-fun b_and!24631 () Bool)

(assert (=> start!74122 (= tp!52112 b_and!24631)))

(declare-fun b!870198 () Bool)

(declare-fun e!484704 () Bool)

(declare-fun e!484702 () Bool)

(declare-fun mapRes!27107 () Bool)

(assert (=> b!870198 (= e!484704 (and e!484702 mapRes!27107))))

(declare-fun condMapEmpty!27107 () Bool)

(declare-datatypes ((V!27721 0))(
  ( (V!27722 (val!8550 Int)) )
))
(declare-datatypes ((ValueCell!8063 0))(
  ( (ValueCellFull!8063 (v!10975 V!27721)) (EmptyCell!8063) )
))
(declare-datatypes ((array!50219 0))(
  ( (array!50220 (arr!24136 (Array (_ BitVec 32) ValueCell!8063)) (size!24577 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50219)

(declare-fun mapDefault!27107 () ValueCell!8063)

(assert (=> b!870198 (= condMapEmpty!27107 (= (arr!24136 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8063)) mapDefault!27107)))))

(declare-fun b!870199 () Bool)

(declare-fun res!591097 () Bool)

(declare-fun e!484700 () Bool)

(assert (=> b!870199 (=> (not res!591097) (not e!484700))))

(declare-datatypes ((array!50221 0))(
  ( (array!50222 (arr!24137 (Array (_ BitVec 32) (_ BitVec 64))) (size!24578 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50221)

(declare-datatypes ((List!17105 0))(
  ( (Nil!17102) (Cons!17101 (h!18238 (_ BitVec 64)) (t!24134 List!17105)) )
))
(declare-fun arrayNoDuplicates!0 (array!50221 (_ BitVec 32) List!17105) Bool)

(assert (=> b!870199 (= res!591097 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17102))))

(declare-fun b!870200 () Bool)

(declare-fun res!591095 () Bool)

(assert (=> b!870200 (=> (not res!591095) (not e!484700))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870200 (= res!591095 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24578 _keys!868))))))

(declare-fun b!870201 () Bool)

(declare-fun res!591096 () Bool)

(assert (=> b!870201 (=> (not res!591096) (not e!484700))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!870201 (= res!591096 (and (= (size!24577 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24578 _keys!868) (size!24577 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870202 () Bool)

(declare-fun res!591093 () Bool)

(assert (=> b!870202 (=> (not res!591093) (not e!484700))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870202 (= res!591093 (validKeyInArray!0 k0!854))))

(declare-fun b!870203 () Bool)

(declare-fun res!591091 () Bool)

(assert (=> b!870203 (=> (not res!591091) (not e!484700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870203 (= res!591091 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27107 () Bool)

(assert (=> mapIsEmpty!27107 mapRes!27107))

(declare-fun b!870204 () Bool)

(declare-fun e!484701 () Bool)

(declare-fun tp_is_empty!17005 () Bool)

(assert (=> b!870204 (= e!484701 tp_is_empty!17005)))

(declare-fun res!591090 () Bool)

(assert (=> start!74122 (=> (not res!591090) (not e!484700))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74122 (= res!591090 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24578 _keys!868))))))

(assert (=> start!74122 e!484700))

(assert (=> start!74122 tp_is_empty!17005))

(assert (=> start!74122 true))

(assert (=> start!74122 tp!52112))

(declare-fun array_inv!19122 (array!50221) Bool)

(assert (=> start!74122 (array_inv!19122 _keys!868)))

(declare-fun array_inv!19123 (array!50219) Bool)

(assert (=> start!74122 (and (array_inv!19123 _values!688) e!484704)))

(declare-fun mapNonEmpty!27107 () Bool)

(declare-fun tp!52111 () Bool)

(assert (=> mapNonEmpty!27107 (= mapRes!27107 (and tp!52111 e!484701))))

(declare-fun mapRest!27107 () (Array (_ BitVec 32) ValueCell!8063))

(declare-fun mapKey!27107 () (_ BitVec 32))

(declare-fun mapValue!27107 () ValueCell!8063)

(assert (=> mapNonEmpty!27107 (= (arr!24136 _values!688) (store mapRest!27107 mapKey!27107 mapValue!27107))))

(declare-fun b!870205 () Bool)

(declare-fun res!591094 () Bool)

(assert (=> b!870205 (=> (not res!591094) (not e!484700))))

(assert (=> b!870205 (= res!591094 (and (= (select (arr!24137 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870206 () Bool)

(declare-fun e!484703 () Bool)

(assert (=> b!870206 (= e!484700 e!484703)))

(declare-fun res!591092 () Bool)

(assert (=> b!870206 (=> (not res!591092) (not e!484703))))

(assert (=> b!870206 (= res!591092 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11282 0))(
  ( (tuple2!11283 (_1!5652 (_ BitVec 64)) (_2!5652 V!27721)) )
))
(declare-datatypes ((List!17106 0))(
  ( (Nil!17103) (Cons!17102 (h!18239 tuple2!11282) (t!24135 List!17106)) )
))
(declare-datatypes ((ListLongMap!10053 0))(
  ( (ListLongMap!10054 (toList!5042 List!17106)) )
))
(declare-fun lt!395117 () ListLongMap!10053)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395114 () array!50219)

(declare-fun minValue!654 () V!27721)

(declare-fun zeroValue!654 () V!27721)

(declare-fun getCurrentListMapNoExtraKeys!3086 (array!50221 array!50219 (_ BitVec 32) (_ BitVec 32) V!27721 V!27721 (_ BitVec 32) Int) ListLongMap!10053)

(assert (=> b!870206 (= lt!395117 (getCurrentListMapNoExtraKeys!3086 _keys!868 lt!395114 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27721)

(assert (=> b!870206 (= lt!395114 (array!50220 (store (arr!24136 _values!688) i!612 (ValueCellFull!8063 v!557)) (size!24577 _values!688)))))

(declare-fun lt!395115 () ListLongMap!10053)

(assert (=> b!870206 (= lt!395115 (getCurrentListMapNoExtraKeys!3086 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870207 () Bool)

(assert (=> b!870207 (= e!484702 tp_is_empty!17005)))

(declare-fun b!870208 () Bool)

(assert (=> b!870208 (= e!484703 (not true))))

(declare-fun +!2438 (ListLongMap!10053 tuple2!11282) ListLongMap!10053)

(assert (=> b!870208 (= (getCurrentListMapNoExtraKeys!3086 _keys!868 lt!395114 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2438 (getCurrentListMapNoExtraKeys!3086 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11283 k0!854 v!557)))))

(declare-datatypes ((Unit!29826 0))(
  ( (Unit!29827) )
))
(declare-fun lt!395116 () Unit!29826)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!609 (array!50221 array!50219 (_ BitVec 32) (_ BitVec 32) V!27721 V!27721 (_ BitVec 32) (_ BitVec 64) V!27721 (_ BitVec 32) Int) Unit!29826)

(assert (=> b!870208 (= lt!395116 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!609 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870209 () Bool)

(declare-fun res!591089 () Bool)

(assert (=> b!870209 (=> (not res!591089) (not e!484700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50221 (_ BitVec 32)) Bool)

(assert (=> b!870209 (= res!591089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74122 res!591090) b!870203))

(assert (= (and b!870203 res!591091) b!870201))

(assert (= (and b!870201 res!591096) b!870209))

(assert (= (and b!870209 res!591089) b!870199))

(assert (= (and b!870199 res!591097) b!870200))

(assert (= (and b!870200 res!591095) b!870202))

(assert (= (and b!870202 res!591093) b!870205))

(assert (= (and b!870205 res!591094) b!870206))

(assert (= (and b!870206 res!591092) b!870208))

(assert (= (and b!870198 condMapEmpty!27107) mapIsEmpty!27107))

(assert (= (and b!870198 (not condMapEmpty!27107)) mapNonEmpty!27107))

(get-info :version)

(assert (= (and mapNonEmpty!27107 ((_ is ValueCellFull!8063) mapValue!27107)) b!870204))

(assert (= (and b!870198 ((_ is ValueCellFull!8063) mapDefault!27107)) b!870207))

(assert (= start!74122 b!870198))

(declare-fun m!812147 () Bool)

(assert (=> mapNonEmpty!27107 m!812147))

(declare-fun m!812149 () Bool)

(assert (=> b!870199 m!812149))

(declare-fun m!812151 () Bool)

(assert (=> b!870209 m!812151))

(declare-fun m!812153 () Bool)

(assert (=> b!870208 m!812153))

(declare-fun m!812155 () Bool)

(assert (=> b!870208 m!812155))

(assert (=> b!870208 m!812155))

(declare-fun m!812157 () Bool)

(assert (=> b!870208 m!812157))

(declare-fun m!812159 () Bool)

(assert (=> b!870208 m!812159))

(declare-fun m!812161 () Bool)

(assert (=> b!870203 m!812161))

(declare-fun m!812163 () Bool)

(assert (=> b!870206 m!812163))

(declare-fun m!812165 () Bool)

(assert (=> b!870206 m!812165))

(declare-fun m!812167 () Bool)

(assert (=> b!870206 m!812167))

(declare-fun m!812169 () Bool)

(assert (=> b!870205 m!812169))

(declare-fun m!812171 () Bool)

(assert (=> start!74122 m!812171))

(declare-fun m!812173 () Bool)

(assert (=> start!74122 m!812173))

(declare-fun m!812175 () Bool)

(assert (=> b!870202 m!812175))

(check-sat (not mapNonEmpty!27107) tp_is_empty!17005 (not b!870202) (not b!870203) (not b_next!14869) (not start!74122) (not b!870199) (not b!870209) (not b!870206) b_and!24631 (not b!870208))
(check-sat b_and!24631 (not b_next!14869))
