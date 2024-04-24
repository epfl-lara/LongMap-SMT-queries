; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73210 () Bool)

(assert start!73210)

(declare-fun b_free!13957 () Bool)

(declare-fun b_next!13957 () Bool)

(assert (=> start!73210 (= b_free!13957 (not b_next!13957))))

(declare-fun tp!49375 () Bool)

(declare-fun b_and!23083 () Bool)

(assert (=> start!73210 (= tp!49375 b_and!23083)))

(declare-fun b!850047 () Bool)

(declare-fun e!474327 () Bool)

(assert (=> b!850047 (= e!474327 true)))

(declare-datatypes ((V!26505 0))(
  ( (V!26506 (val!8094 Int)) )
))
(declare-datatypes ((ValueCell!7607 0))(
  ( (ValueCellFull!7607 (v!10519 V!26505)) (EmptyCell!7607) )
))
(declare-datatypes ((array!48445 0))(
  ( (array!48446 (arr!23249 (Array (_ BitVec 32) ValueCell!7607)) (size!23690 (_ BitVec 32))) )
))
(declare-fun lt!382562 () array!48445)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48447 0))(
  ( (array!48448 (arr!23250 (Array (_ BitVec 32) (_ BitVec 64))) (size!23691 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48447)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26505)

(declare-fun zeroValue!654 () V!26505)

(declare-datatypes ((tuple2!10522 0))(
  ( (tuple2!10523 (_1!5272 (_ BitVec 64)) (_2!5272 V!26505)) )
))
(declare-datatypes ((List!16390 0))(
  ( (Nil!16387) (Cons!16386 (h!17523 tuple2!10522) (t!22785 List!16390)) )
))
(declare-datatypes ((ListLongMap!9293 0))(
  ( (ListLongMap!9294 (toList!4662 List!16390)) )
))
(declare-fun lt!382560 () ListLongMap!9293)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun +!2116 (ListLongMap!9293 tuple2!10522) ListLongMap!9293)

(declare-fun getCurrentListMapNoExtraKeys!2720 (array!48447 array!48445 (_ BitVec 32) (_ BitVec 32) V!26505 V!26505 (_ BitVec 32) Int) ListLongMap!9293)

(declare-fun get!12231 (ValueCell!7607 V!26505) V!26505)

(declare-fun dynLambda!995 (Int (_ BitVec 64)) V!26505)

(assert (=> b!850047 (= lt!382560 (+!2116 (getCurrentListMapNoExtraKeys!2720 _keys!868 lt!382562 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10523 (select (arr!23250 _keys!868) from!1053) (get!12231 (select (arr!23249 lt!382562) from!1053) (dynLambda!995 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun _values!688 () array!48445)

(declare-fun bm!37768 () Bool)

(declare-fun call!37772 () ListLongMap!9293)

(assert (=> bm!37768 (= call!37772 (getCurrentListMapNoExtraKeys!2720 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25739 () Bool)

(declare-fun mapRes!25739 () Bool)

(declare-fun tp!49376 () Bool)

(declare-fun e!474332 () Bool)

(assert (=> mapNonEmpty!25739 (= mapRes!25739 (and tp!49376 e!474332))))

(declare-fun mapKey!25739 () (_ BitVec 32))

(declare-fun mapRest!25739 () (Array (_ BitVec 32) ValueCell!7607))

(declare-fun mapValue!25739 () ValueCell!7607)

(assert (=> mapNonEmpty!25739 (= (arr!23249 _values!688) (store mapRest!25739 mapKey!25739 mapValue!25739))))

(declare-fun b!850048 () Bool)

(declare-fun res!577227 () Bool)

(declare-fun e!474328 () Bool)

(assert (=> b!850048 (=> (not res!577227) (not e!474328))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!850048 (= res!577227 (and (= (select (arr!23250 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!577229 () Bool)

(assert (=> start!73210 (=> (not res!577229) (not e!474328))))

(assert (=> start!73210 (= res!577229 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23691 _keys!868))))))

(assert (=> start!73210 e!474328))

(declare-fun tp_is_empty!16093 () Bool)

(assert (=> start!73210 tp_is_empty!16093))

(assert (=> start!73210 true))

(assert (=> start!73210 tp!49375))

(declare-fun array_inv!18508 (array!48447) Bool)

(assert (=> start!73210 (array_inv!18508 _keys!868)))

(declare-fun e!474329 () Bool)

(declare-fun array_inv!18509 (array!48445) Bool)

(assert (=> start!73210 (and (array_inv!18509 _values!688) e!474329)))

(declare-fun b!850049 () Bool)

(declare-fun res!577223 () Bool)

(assert (=> b!850049 (=> (not res!577223) (not e!474328))))

(assert (=> b!850049 (= res!577223 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23691 _keys!868))))))

(declare-fun mapIsEmpty!25739 () Bool)

(assert (=> mapIsEmpty!25739 mapRes!25739))

(declare-fun b!850050 () Bool)

(declare-fun res!577224 () Bool)

(assert (=> b!850050 (=> (not res!577224) (not e!474328))))

(assert (=> b!850050 (= res!577224 (and (= (size!23690 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23691 _keys!868) (size!23690 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850051 () Bool)

(declare-fun e!474331 () Bool)

(assert (=> b!850051 (= e!474328 e!474331)))

(declare-fun res!577228 () Bool)

(assert (=> b!850051 (=> (not res!577228) (not e!474331))))

(assert (=> b!850051 (= res!577228 (= from!1053 i!612))))

(assert (=> b!850051 (= lt!382560 (getCurrentListMapNoExtraKeys!2720 _keys!868 lt!382562 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26505)

(assert (=> b!850051 (= lt!382562 (array!48446 (store (arr!23249 _values!688) i!612 (ValueCellFull!7607 v!557)) (size!23690 _values!688)))))

(declare-fun lt!382559 () ListLongMap!9293)

(assert (=> b!850051 (= lt!382559 (getCurrentListMapNoExtraKeys!2720 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850052 () Bool)

(assert (=> b!850052 (= e!474331 (not e!474327))))

(declare-fun res!577231 () Bool)

(assert (=> b!850052 (=> res!577231 e!474327)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850052 (= res!577231 (not (validKeyInArray!0 (select (arr!23250 _keys!868) from!1053))))))

(declare-fun e!474330 () Bool)

(assert (=> b!850052 e!474330))

(declare-fun c!91888 () Bool)

(assert (=> b!850052 (= c!91888 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28998 0))(
  ( (Unit!28999) )
))
(declare-fun lt!382561 () Unit!28998)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!335 (array!48447 array!48445 (_ BitVec 32) (_ BitVec 32) V!26505 V!26505 (_ BitVec 32) (_ BitVec 64) V!26505 (_ BitVec 32) Int) Unit!28998)

(assert (=> b!850052 (= lt!382561 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!335 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850053 () Bool)

(declare-fun res!577222 () Bool)

(assert (=> b!850053 (=> (not res!577222) (not e!474328))))

(declare-datatypes ((List!16391 0))(
  ( (Nil!16388) (Cons!16387 (h!17524 (_ BitVec 64)) (t!22786 List!16391)) )
))
(declare-fun arrayNoDuplicates!0 (array!48447 (_ BitVec 32) List!16391) Bool)

(assert (=> b!850053 (= res!577222 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16388))))

(declare-fun b!850054 () Bool)

(declare-fun call!37771 () ListLongMap!9293)

(assert (=> b!850054 (= e!474330 (= call!37771 call!37772))))

(declare-fun b!850055 () Bool)

(declare-fun res!577225 () Bool)

(assert (=> b!850055 (=> (not res!577225) (not e!474328))))

(assert (=> b!850055 (= res!577225 (validKeyInArray!0 k0!854))))

(declare-fun b!850056 () Bool)

(assert (=> b!850056 (= e!474332 tp_is_empty!16093)))

(declare-fun b!850057 () Bool)

(declare-fun res!577226 () Bool)

(assert (=> b!850057 (=> (not res!577226) (not e!474328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850057 (= res!577226 (validMask!0 mask!1196))))

(declare-fun b!850058 () Bool)

(declare-fun e!474334 () Bool)

(assert (=> b!850058 (= e!474329 (and e!474334 mapRes!25739))))

(declare-fun condMapEmpty!25739 () Bool)

(declare-fun mapDefault!25739 () ValueCell!7607)

(assert (=> b!850058 (= condMapEmpty!25739 (= (arr!23249 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7607)) mapDefault!25739)))))

(declare-fun b!850059 () Bool)

(declare-fun res!577230 () Bool)

(assert (=> b!850059 (=> (not res!577230) (not e!474328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48447 (_ BitVec 32)) Bool)

(assert (=> b!850059 (= res!577230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850060 () Bool)

(assert (=> b!850060 (= e!474334 tp_is_empty!16093)))

(declare-fun bm!37769 () Bool)

(assert (=> bm!37769 (= call!37771 (getCurrentListMapNoExtraKeys!2720 _keys!868 lt!382562 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850061 () Bool)

(assert (=> b!850061 (= e!474330 (= call!37771 (+!2116 call!37772 (tuple2!10523 k0!854 v!557))))))

(assert (= (and start!73210 res!577229) b!850057))

(assert (= (and b!850057 res!577226) b!850050))

(assert (= (and b!850050 res!577224) b!850059))

(assert (= (and b!850059 res!577230) b!850053))

(assert (= (and b!850053 res!577222) b!850049))

(assert (= (and b!850049 res!577223) b!850055))

(assert (= (and b!850055 res!577225) b!850048))

(assert (= (and b!850048 res!577227) b!850051))

(assert (= (and b!850051 res!577228) b!850052))

(assert (= (and b!850052 c!91888) b!850061))

(assert (= (and b!850052 (not c!91888)) b!850054))

(assert (= (or b!850061 b!850054) bm!37768))

(assert (= (or b!850061 b!850054) bm!37769))

(assert (= (and b!850052 (not res!577231)) b!850047))

(assert (= (and b!850058 condMapEmpty!25739) mapIsEmpty!25739))

(assert (= (and b!850058 (not condMapEmpty!25739)) mapNonEmpty!25739))

(get-info :version)

(assert (= (and mapNonEmpty!25739 ((_ is ValueCellFull!7607) mapValue!25739)) b!850056))

(assert (= (and b!850058 ((_ is ValueCellFull!7607) mapDefault!25739)) b!850060))

(assert (= start!73210 b!850058))

(declare-fun b_lambda!11503 () Bool)

(assert (=> (not b_lambda!11503) (not b!850047)))

(declare-fun t!22784 () Bool)

(declare-fun tb!4251 () Bool)

(assert (=> (and start!73210 (= defaultEntry!696 defaultEntry!696) t!22784) tb!4251))

(declare-fun result!8121 () Bool)

(assert (=> tb!4251 (= result!8121 tp_is_empty!16093)))

(assert (=> b!850047 t!22784))

(declare-fun b_and!23085 () Bool)

(assert (= b_and!23083 (and (=> t!22784 result!8121) b_and!23085)))

(declare-fun m!791149 () Bool)

(assert (=> b!850052 m!791149))

(assert (=> b!850052 m!791149))

(declare-fun m!791151 () Bool)

(assert (=> b!850052 m!791151))

(declare-fun m!791153 () Bool)

(assert (=> b!850052 m!791153))

(declare-fun m!791155 () Bool)

(assert (=> b!850053 m!791155))

(declare-fun m!791157 () Bool)

(assert (=> b!850047 m!791157))

(declare-fun m!791159 () Bool)

(assert (=> b!850047 m!791159))

(assert (=> b!850047 m!791157))

(declare-fun m!791161 () Bool)

(assert (=> b!850047 m!791161))

(assert (=> b!850047 m!791161))

(declare-fun m!791163 () Bool)

(assert (=> b!850047 m!791163))

(declare-fun m!791165 () Bool)

(assert (=> b!850047 m!791165))

(assert (=> b!850047 m!791149))

(assert (=> b!850047 m!791163))

(declare-fun m!791167 () Bool)

(assert (=> b!850055 m!791167))

(declare-fun m!791169 () Bool)

(assert (=> b!850057 m!791169))

(declare-fun m!791171 () Bool)

(assert (=> b!850051 m!791171))

(declare-fun m!791173 () Bool)

(assert (=> b!850051 m!791173))

(declare-fun m!791175 () Bool)

(assert (=> b!850051 m!791175))

(declare-fun m!791177 () Bool)

(assert (=> b!850059 m!791177))

(declare-fun m!791179 () Bool)

(assert (=> b!850048 m!791179))

(assert (=> bm!37769 m!791157))

(declare-fun m!791181 () Bool)

(assert (=> b!850061 m!791181))

(declare-fun m!791183 () Bool)

(assert (=> mapNonEmpty!25739 m!791183))

(declare-fun m!791185 () Bool)

(assert (=> bm!37768 m!791185))

(declare-fun m!791187 () Bool)

(assert (=> start!73210 m!791187))

(declare-fun m!791189 () Bool)

(assert (=> start!73210 m!791189))

(check-sat (not mapNonEmpty!25739) (not start!73210) (not bm!37768) (not b_next!13957) (not b!850053) tp_is_empty!16093 (not b!850061) (not b!850055) (not b!850051) (not b_lambda!11503) (not b!850047) (not b!850057) (not b!850059) b_and!23085 (not b!850052) (not bm!37769))
(check-sat b_and!23085 (not b_next!13957))
