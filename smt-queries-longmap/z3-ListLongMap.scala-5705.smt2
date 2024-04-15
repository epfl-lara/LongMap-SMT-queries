; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73996 () Bool)

(assert start!73996)

(declare-fun b_free!14929 () Bool)

(declare-fun b_next!14929 () Bool)

(assert (=> start!73996 (= b_free!14929 (not b_next!14929))))

(declare-fun tp!52292 () Bool)

(declare-fun b_and!24655 () Bool)

(assert (=> start!73996 (= tp!52292 b_and!24655)))

(declare-fun mapNonEmpty!27197 () Bool)

(declare-fun mapRes!27197 () Bool)

(declare-fun tp!52291 () Bool)

(declare-fun e!484511 () Bool)

(assert (=> mapNonEmpty!27197 (= mapRes!27197 (and tp!52291 e!484511))))

(declare-datatypes ((V!27801 0))(
  ( (V!27802 (val!8580 Int)) )
))
(declare-datatypes ((ValueCell!8093 0))(
  ( (ValueCellFull!8093 (v!10999 V!27801)) (EmptyCell!8093) )
))
(declare-fun mapValue!27197 () ValueCell!8093)

(declare-fun mapRest!27197 () (Array (_ BitVec 32) ValueCell!8093))

(declare-fun mapKey!27197 () (_ BitVec 32))

(declare-datatypes ((array!50263 0))(
  ( (array!50264 (arr!24163 (Array (_ BitVec 32) ValueCell!8093)) (size!24605 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50263)

(assert (=> mapNonEmpty!27197 (= (arr!24163 _values!688) (store mapRest!27197 mapKey!27197 mapValue!27197))))

(declare-fun res!591448 () Bool)

(declare-fun e!484512 () Bool)

(assert (=> start!73996 (=> (not res!591448) (not e!484512))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50265 0))(
  ( (array!50266 (arr!24164 (Array (_ BitVec 32) (_ BitVec 64))) (size!24606 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50265)

(assert (=> start!73996 (= res!591448 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24606 _keys!868))))))

(assert (=> start!73996 e!484512))

(declare-fun tp_is_empty!17065 () Bool)

(assert (=> start!73996 tp_is_empty!17065))

(assert (=> start!73996 true))

(assert (=> start!73996 tp!52292))

(declare-fun array_inv!19142 (array!50265) Bool)

(assert (=> start!73996 (array_inv!19142 _keys!868)))

(declare-fun e!484515 () Bool)

(declare-fun array_inv!19143 (array!50263) Bool)

(assert (=> start!73996 (and (array_inv!19143 _values!688) e!484515)))

(declare-fun b!870136 () Bool)

(declare-fun e!484514 () Bool)

(assert (=> b!870136 (= e!484512 e!484514)))

(declare-fun res!591453 () Bool)

(assert (=> b!870136 (=> (not res!591453) (not e!484514))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870136 (= res!591453 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394878 () array!50263)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11416 0))(
  ( (tuple2!11417 (_1!5719 (_ BitVec 64)) (_2!5719 V!27801)) )
))
(declare-datatypes ((List!17195 0))(
  ( (Nil!17192) (Cons!17191 (h!18322 tuple2!11416) (t!24223 List!17195)) )
))
(declare-datatypes ((ListLongMap!10175 0))(
  ( (ListLongMap!10176 (toList!5103 List!17195)) )
))
(declare-fun lt!394879 () ListLongMap!10175)

(declare-fun minValue!654 () V!27801)

(declare-fun zeroValue!654 () V!27801)

(declare-fun getCurrentListMapNoExtraKeys!3096 (array!50265 array!50263 (_ BitVec 32) (_ BitVec 32) V!27801 V!27801 (_ BitVec 32) Int) ListLongMap!10175)

(assert (=> b!870136 (= lt!394879 (getCurrentListMapNoExtraKeys!3096 _keys!868 lt!394878 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27801)

(assert (=> b!870136 (= lt!394878 (array!50264 (store (arr!24163 _values!688) i!612 (ValueCellFull!8093 v!557)) (size!24605 _values!688)))))

(declare-fun lt!394880 () ListLongMap!10175)

(assert (=> b!870136 (= lt!394880 (getCurrentListMapNoExtraKeys!3096 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870137 () Bool)

(declare-fun res!591451 () Bool)

(assert (=> b!870137 (=> (not res!591451) (not e!484512))))

(declare-datatypes ((List!17196 0))(
  ( (Nil!17193) (Cons!17192 (h!18323 (_ BitVec 64)) (t!24224 List!17196)) )
))
(declare-fun arrayNoDuplicates!0 (array!50265 (_ BitVec 32) List!17196) Bool)

(assert (=> b!870137 (= res!591451 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17193))))

(declare-fun b!870138 () Bool)

(declare-fun e!484513 () Bool)

(assert (=> b!870138 (= e!484515 (and e!484513 mapRes!27197))))

(declare-fun condMapEmpty!27197 () Bool)

(declare-fun mapDefault!27197 () ValueCell!8093)

(assert (=> b!870138 (= condMapEmpty!27197 (= (arr!24163 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8093)) mapDefault!27197)))))

(declare-fun b!870139 () Bool)

(assert (=> b!870139 (= e!484511 tp_is_empty!17065)))

(declare-fun b!870140 () Bool)

(declare-fun res!591449 () Bool)

(assert (=> b!870140 (=> (not res!591449) (not e!484512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870140 (= res!591449 (validMask!0 mask!1196))))

(declare-fun b!870141 () Bool)

(declare-fun res!591452 () Bool)

(assert (=> b!870141 (=> (not res!591452) (not e!484512))))

(assert (=> b!870141 (= res!591452 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24606 _keys!868))))))

(declare-fun b!870142 () Bool)

(declare-fun res!591447 () Bool)

(assert (=> b!870142 (=> (not res!591447) (not e!484512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50265 (_ BitVec 32)) Bool)

(assert (=> b!870142 (= res!591447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27197 () Bool)

(assert (=> mapIsEmpty!27197 mapRes!27197))

(declare-fun b!870143 () Bool)

(assert (=> b!870143 (= e!484513 tp_is_empty!17065)))

(declare-fun b!870144 () Bool)

(declare-fun res!591446 () Bool)

(assert (=> b!870144 (=> (not res!591446) (not e!484512))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870144 (= res!591446 (validKeyInArray!0 k0!854))))

(declare-fun b!870145 () Bool)

(declare-fun res!591450 () Bool)

(assert (=> b!870145 (=> (not res!591450) (not e!484512))))

(assert (=> b!870145 (= res!591450 (and (= (size!24605 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24606 _keys!868) (size!24605 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870146 () Bool)

(declare-fun res!591445 () Bool)

(assert (=> b!870146 (=> (not res!591445) (not e!484512))))

(assert (=> b!870146 (= res!591445 (and (= (select (arr!24164 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870147 () Bool)

(assert (=> b!870147 (= e!484514 (not true))))

(declare-fun +!2463 (ListLongMap!10175 tuple2!11416) ListLongMap!10175)

(assert (=> b!870147 (= (getCurrentListMapNoExtraKeys!3096 _keys!868 lt!394878 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2463 (getCurrentListMapNoExtraKeys!3096 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11417 k0!854 v!557)))))

(declare-datatypes ((Unit!29813 0))(
  ( (Unit!29814) )
))
(declare-fun lt!394877 () Unit!29813)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!631 (array!50265 array!50263 (_ BitVec 32) (_ BitVec 32) V!27801 V!27801 (_ BitVec 32) (_ BitVec 64) V!27801 (_ BitVec 32) Int) Unit!29813)

(assert (=> b!870147 (= lt!394877 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!631 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73996 res!591448) b!870140))

(assert (= (and b!870140 res!591449) b!870145))

(assert (= (and b!870145 res!591450) b!870142))

(assert (= (and b!870142 res!591447) b!870137))

(assert (= (and b!870137 res!591451) b!870141))

(assert (= (and b!870141 res!591452) b!870144))

(assert (= (and b!870144 res!591446) b!870146))

(assert (= (and b!870146 res!591445) b!870136))

(assert (= (and b!870136 res!591453) b!870147))

(assert (= (and b!870138 condMapEmpty!27197) mapIsEmpty!27197))

(assert (= (and b!870138 (not condMapEmpty!27197)) mapNonEmpty!27197))

(get-info :version)

(assert (= (and mapNonEmpty!27197 ((_ is ValueCellFull!8093) mapValue!27197)) b!870139))

(assert (= (and b!870138 ((_ is ValueCellFull!8093) mapDefault!27197)) b!870143))

(assert (= start!73996 b!870138))

(declare-fun m!810999 () Bool)

(assert (=> b!870147 m!810999))

(declare-fun m!811001 () Bool)

(assert (=> b!870147 m!811001))

(assert (=> b!870147 m!811001))

(declare-fun m!811003 () Bool)

(assert (=> b!870147 m!811003))

(declare-fun m!811005 () Bool)

(assert (=> b!870147 m!811005))

(declare-fun m!811007 () Bool)

(assert (=> b!870140 m!811007))

(declare-fun m!811009 () Bool)

(assert (=> start!73996 m!811009))

(declare-fun m!811011 () Bool)

(assert (=> start!73996 m!811011))

(declare-fun m!811013 () Bool)

(assert (=> b!870137 m!811013))

(declare-fun m!811015 () Bool)

(assert (=> b!870136 m!811015))

(declare-fun m!811017 () Bool)

(assert (=> b!870136 m!811017))

(declare-fun m!811019 () Bool)

(assert (=> b!870136 m!811019))

(declare-fun m!811021 () Bool)

(assert (=> b!870146 m!811021))

(declare-fun m!811023 () Bool)

(assert (=> b!870144 m!811023))

(declare-fun m!811025 () Bool)

(assert (=> b!870142 m!811025))

(declare-fun m!811027 () Bool)

(assert (=> mapNonEmpty!27197 m!811027))

(check-sat (not b!870147) (not b!870142) (not mapNonEmpty!27197) tp_is_empty!17065 (not b!870140) (not b!870144) b_and!24655 (not b!870137) (not start!73996) (not b!870136) (not b_next!14929))
(check-sat b_and!24655 (not b_next!14929))
