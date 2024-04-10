; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73998 () Bool)

(assert start!73998)

(declare-fun b_free!14913 () Bool)

(declare-fun b_next!14913 () Bool)

(assert (=> start!73998 (= b_free!14913 (not b_next!14913))))

(declare-fun tp!52243 () Bool)

(declare-fun b_and!24665 () Bool)

(assert (=> start!73998 (= tp!52243 b_and!24665)))

(declare-fun b!870087 () Bool)

(declare-fun e!484519 () Bool)

(declare-fun tp_is_empty!17049 () Bool)

(assert (=> b!870087 (= e!484519 tp_is_empty!17049)))

(declare-fun b!870088 () Bool)

(declare-fun e!484515 () Bool)

(assert (=> b!870088 (= e!484515 (not true))))

(declare-datatypes ((V!27779 0))(
  ( (V!27780 (val!8572 Int)) )
))
(declare-datatypes ((ValueCell!8085 0))(
  ( (ValueCellFull!8085 (v!10997 V!27779)) (EmptyCell!8085) )
))
(declare-datatypes ((array!50244 0))(
  ( (array!50245 (arr!24153 (Array (_ BitVec 32) ValueCell!8085)) (size!24593 (_ BitVec 32))) )
))
(declare-fun lt!395019 () array!50244)

(declare-fun v!557 () V!27779)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50246 0))(
  ( (array!50247 (arr!24154 (Array (_ BitVec 32) (_ BitVec 64))) (size!24594 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50246)

(declare-fun _values!688 () array!50244)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27779)

(declare-fun zeroValue!654 () V!27779)

(declare-datatypes ((tuple2!11388 0))(
  ( (tuple2!11389 (_1!5705 (_ BitVec 64)) (_2!5705 V!27779)) )
))
(declare-datatypes ((List!17180 0))(
  ( (Nil!17177) (Cons!17176 (h!18307 tuple2!11388) (t!24217 List!17180)) )
))
(declare-datatypes ((ListLongMap!10157 0))(
  ( (ListLongMap!10158 (toList!5094 List!17180)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3063 (array!50246 array!50244 (_ BitVec 32) (_ BitVec 32) V!27779 V!27779 (_ BitVec 32) Int) ListLongMap!10157)

(declare-fun +!2434 (ListLongMap!10157 tuple2!11388) ListLongMap!10157)

(assert (=> b!870088 (= (getCurrentListMapNoExtraKeys!3063 _keys!868 lt!395019 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2434 (getCurrentListMapNoExtraKeys!3063 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11389 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29866 0))(
  ( (Unit!29867) )
))
(declare-fun lt!395018 () Unit!29866)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!628 (array!50246 array!50244 (_ BitVec 32) (_ BitVec 32) V!27779 V!27779 (_ BitVec 32) (_ BitVec 64) V!27779 (_ BitVec 32) Int) Unit!29866)

(assert (=> b!870088 (= lt!395018 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!628 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870089 () Bool)

(declare-fun e!484514 () Bool)

(assert (=> b!870089 (= e!484514 tp_is_empty!17049)))

(declare-fun b!870090 () Bool)

(declare-fun res!591341 () Bool)

(declare-fun e!484517 () Bool)

(assert (=> b!870090 (=> (not res!591341) (not e!484517))))

(assert (=> b!870090 (= res!591341 (and (= (select (arr!24154 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870091 () Bool)

(declare-fun res!591339 () Bool)

(assert (=> b!870091 (=> (not res!591339) (not e!484517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870091 (= res!591339 (validKeyInArray!0 k0!854))))

(declare-fun b!870092 () Bool)

(declare-fun res!591343 () Bool)

(assert (=> b!870092 (=> (not res!591343) (not e!484517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50246 (_ BitVec 32)) Bool)

(assert (=> b!870092 (= res!591343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27173 () Bool)

(declare-fun mapRes!27173 () Bool)

(declare-fun tp!52242 () Bool)

(assert (=> mapNonEmpty!27173 (= mapRes!27173 (and tp!52242 e!484514))))

(declare-fun mapKey!27173 () (_ BitVec 32))

(declare-fun mapRest!27173 () (Array (_ BitVec 32) ValueCell!8085))

(declare-fun mapValue!27173 () ValueCell!8085)

(assert (=> mapNonEmpty!27173 (= (arr!24153 _values!688) (store mapRest!27173 mapKey!27173 mapValue!27173))))

(declare-fun b!870093 () Bool)

(declare-fun res!591346 () Bool)

(assert (=> b!870093 (=> (not res!591346) (not e!484517))))

(assert (=> b!870093 (= res!591346 (and (= (size!24593 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24594 _keys!868) (size!24593 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!591340 () Bool)

(assert (=> start!73998 (=> (not res!591340) (not e!484517))))

(assert (=> start!73998 (= res!591340 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24594 _keys!868))))))

(assert (=> start!73998 e!484517))

(assert (=> start!73998 tp_is_empty!17049))

(assert (=> start!73998 true))

(assert (=> start!73998 tp!52243))

(declare-fun array_inv!19078 (array!50246) Bool)

(assert (=> start!73998 (array_inv!19078 _keys!868)))

(declare-fun e!484516 () Bool)

(declare-fun array_inv!19079 (array!50244) Bool)

(assert (=> start!73998 (and (array_inv!19079 _values!688) e!484516)))

(declare-fun b!870094 () Bool)

(declare-fun res!591342 () Bool)

(assert (=> b!870094 (=> (not res!591342) (not e!484517))))

(declare-datatypes ((List!17181 0))(
  ( (Nil!17178) (Cons!17177 (h!18308 (_ BitVec 64)) (t!24218 List!17181)) )
))
(declare-fun arrayNoDuplicates!0 (array!50246 (_ BitVec 32) List!17181) Bool)

(assert (=> b!870094 (= res!591342 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17178))))

(declare-fun mapIsEmpty!27173 () Bool)

(assert (=> mapIsEmpty!27173 mapRes!27173))

(declare-fun b!870095 () Bool)

(declare-fun res!591347 () Bool)

(assert (=> b!870095 (=> (not res!591347) (not e!484517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870095 (= res!591347 (validMask!0 mask!1196))))

(declare-fun b!870096 () Bool)

(assert (=> b!870096 (= e!484517 e!484515)))

(declare-fun res!591344 () Bool)

(assert (=> b!870096 (=> (not res!591344) (not e!484515))))

(assert (=> b!870096 (= res!591344 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395017 () ListLongMap!10157)

(assert (=> b!870096 (= lt!395017 (getCurrentListMapNoExtraKeys!3063 _keys!868 lt!395019 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870096 (= lt!395019 (array!50245 (store (arr!24153 _values!688) i!612 (ValueCellFull!8085 v!557)) (size!24593 _values!688)))))

(declare-fun lt!395020 () ListLongMap!10157)

(assert (=> b!870096 (= lt!395020 (getCurrentListMapNoExtraKeys!3063 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870097 () Bool)

(assert (=> b!870097 (= e!484516 (and e!484519 mapRes!27173))))

(declare-fun condMapEmpty!27173 () Bool)

(declare-fun mapDefault!27173 () ValueCell!8085)

(assert (=> b!870097 (= condMapEmpty!27173 (= (arr!24153 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8085)) mapDefault!27173)))))

(declare-fun b!870098 () Bool)

(declare-fun res!591345 () Bool)

(assert (=> b!870098 (=> (not res!591345) (not e!484517))))

(assert (=> b!870098 (= res!591345 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24594 _keys!868))))))

(assert (= (and start!73998 res!591340) b!870095))

(assert (= (and b!870095 res!591347) b!870093))

(assert (= (and b!870093 res!591346) b!870092))

(assert (= (and b!870092 res!591343) b!870094))

(assert (= (and b!870094 res!591342) b!870098))

(assert (= (and b!870098 res!591345) b!870091))

(assert (= (and b!870091 res!591339) b!870090))

(assert (= (and b!870090 res!591341) b!870096))

(assert (= (and b!870096 res!591344) b!870088))

(assert (= (and b!870097 condMapEmpty!27173) mapIsEmpty!27173))

(assert (= (and b!870097 (not condMapEmpty!27173)) mapNonEmpty!27173))

(get-info :version)

(assert (= (and mapNonEmpty!27173 ((_ is ValueCellFull!8085) mapValue!27173)) b!870089))

(assert (= (and b!870097 ((_ is ValueCellFull!8085) mapDefault!27173)) b!870087))

(assert (= start!73998 b!870097))

(declare-fun m!811517 () Bool)

(assert (=> b!870091 m!811517))

(declare-fun m!811519 () Bool)

(assert (=> mapNonEmpty!27173 m!811519))

(declare-fun m!811521 () Bool)

(assert (=> b!870095 m!811521))

(declare-fun m!811523 () Bool)

(assert (=> b!870096 m!811523))

(declare-fun m!811525 () Bool)

(assert (=> b!870096 m!811525))

(declare-fun m!811527 () Bool)

(assert (=> b!870096 m!811527))

(declare-fun m!811529 () Bool)

(assert (=> b!870088 m!811529))

(declare-fun m!811531 () Bool)

(assert (=> b!870088 m!811531))

(assert (=> b!870088 m!811531))

(declare-fun m!811533 () Bool)

(assert (=> b!870088 m!811533))

(declare-fun m!811535 () Bool)

(assert (=> b!870088 m!811535))

(declare-fun m!811537 () Bool)

(assert (=> start!73998 m!811537))

(declare-fun m!811539 () Bool)

(assert (=> start!73998 m!811539))

(declare-fun m!811541 () Bool)

(assert (=> b!870094 m!811541))

(declare-fun m!811543 () Bool)

(assert (=> b!870092 m!811543))

(declare-fun m!811545 () Bool)

(assert (=> b!870090 m!811545))

(check-sat (not b!870088) (not start!73998) (not b!870092) (not b!870096) tp_is_empty!17049 b_and!24665 (not mapNonEmpty!27173) (not b!870094) (not b!870091) (not b!870095) (not b_next!14913))
(check-sat b_and!24665 (not b_next!14913))
