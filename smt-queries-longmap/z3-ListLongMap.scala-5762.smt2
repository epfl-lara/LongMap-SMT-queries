; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74402 () Bool)

(assert start!74402)

(declare-fun b_free!15163 () Bool)

(declare-fun b_next!15163 () Bool)

(assert (=> start!74402 (= b_free!15163 (not b_next!15163))))

(declare-fun tp!53168 () Bool)

(declare-fun b_and!24953 () Bool)

(assert (=> start!74402 (= tp!53168 b_and!24953)))

(declare-fun b!876102 () Bool)

(declare-fun e!487691 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((V!28257 0))(
  ( (V!28258 (val!8751 Int)) )
))
(declare-datatypes ((ValueCell!8264 0))(
  ( (ValueCellFull!8264 (v!11178 V!28257)) (EmptyCell!8264) )
))
(declare-datatypes ((array!50919 0))(
  ( (array!50920 (arr!24487 (Array (_ BitVec 32) ValueCell!8264)) (size!24929 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50919)

(assert (=> b!876102 (= e!487691 (bvslt from!1053 (size!24929 _values!688)))))

(declare-datatypes ((tuple2!11576 0))(
  ( (tuple2!11577 (_1!5799 (_ BitVec 64)) (_2!5799 V!28257)) )
))
(declare-datatypes ((List!17382 0))(
  ( (Nil!17379) (Cons!17378 (h!18509 tuple2!11576) (t!24440 List!17382)) )
))
(declare-datatypes ((ListLongMap!10335 0))(
  ( (ListLongMap!10336 (toList!5183 List!17382)) )
))
(declare-fun lt!396223 () ListLongMap!10335)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28257)

(declare-fun zeroValue!654 () V!28257)

(declare-datatypes ((array!50921 0))(
  ( (array!50922 (arr!24488 (Array (_ BitVec 32) (_ BitVec 64))) (size!24930 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50921)

(declare-fun lt!396221 () array!50919)

(declare-fun +!2509 (ListLongMap!10335 tuple2!11576) ListLongMap!10335)

(declare-fun getCurrentListMapNoExtraKeys!3176 (array!50921 array!50919 (_ BitVec 32) (_ BitVec 32) V!28257 V!28257 (_ BitVec 32) Int) ListLongMap!10335)

(declare-fun get!12886 (ValueCell!8264 V!28257) V!28257)

(declare-fun dynLambda!1213 (Int (_ BitVec 64)) V!28257)

(assert (=> b!876102 (= lt!396223 (+!2509 (getCurrentListMapNoExtraKeys!3176 _keys!868 lt!396221 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11577 (select (arr!24488 _keys!868) from!1053) (get!12886 (select (arr!24487 lt!396221) from!1053) (dynLambda!1213 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!27722 () Bool)

(declare-fun mapRes!27722 () Bool)

(declare-fun tp!53167 () Bool)

(declare-fun e!487692 () Bool)

(assert (=> mapNonEmpty!27722 (= mapRes!27722 (and tp!53167 e!487692))))

(declare-fun mapRest!27722 () (Array (_ BitVec 32) ValueCell!8264))

(declare-fun mapKey!27722 () (_ BitVec 32))

(declare-fun mapValue!27722 () ValueCell!8264)

(assert (=> mapNonEmpty!27722 (= (arr!24487 _values!688) (store mapRest!27722 mapKey!27722 mapValue!27722))))

(declare-fun b!876103 () Bool)

(declare-fun e!487694 () Bool)

(declare-fun e!487697 () Bool)

(assert (=> b!876103 (= e!487694 (and e!487697 mapRes!27722))))

(declare-fun condMapEmpty!27722 () Bool)

(declare-fun mapDefault!27722 () ValueCell!8264)

(assert (=> b!876103 (= condMapEmpty!27722 (= (arr!24487 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8264)) mapDefault!27722)))))

(declare-fun b!876104 () Bool)

(declare-fun e!487690 () Bool)

(declare-fun e!487696 () Bool)

(assert (=> b!876104 (= e!487690 e!487696)))

(declare-fun res!595384 () Bool)

(assert (=> b!876104 (=> (not res!595384) (not e!487696))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876104 (= res!595384 (= from!1053 i!612))))

(assert (=> b!876104 (= lt!396223 (getCurrentListMapNoExtraKeys!3176 _keys!868 lt!396221 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28257)

(assert (=> b!876104 (= lt!396221 (array!50920 (store (arr!24487 _values!688) i!612 (ValueCellFull!8264 v!557)) (size!24929 _values!688)))))

(declare-fun lt!396220 () ListLongMap!10335)

(assert (=> b!876104 (= lt!396220 (getCurrentListMapNoExtraKeys!3176 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876105 () Bool)

(declare-fun res!595381 () Bool)

(assert (=> b!876105 (=> (not res!595381) (not e!487690))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876105 (= res!595381 (validKeyInArray!0 k0!854))))

(declare-fun bm!38703 () Bool)

(declare-fun call!38706 () ListLongMap!10335)

(assert (=> bm!38703 (= call!38706 (getCurrentListMapNoExtraKeys!3176 _keys!868 lt!396221 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876106 () Bool)

(declare-fun call!38707 () ListLongMap!10335)

(declare-fun e!487693 () Bool)

(assert (=> b!876106 (= e!487693 (= call!38706 (+!2509 call!38707 (tuple2!11577 k0!854 v!557))))))

(declare-fun res!595386 () Bool)

(assert (=> start!74402 (=> (not res!595386) (not e!487690))))

(assert (=> start!74402 (= res!595386 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24930 _keys!868))))))

(assert (=> start!74402 e!487690))

(declare-fun tp_is_empty!17407 () Bool)

(assert (=> start!74402 tp_is_empty!17407))

(assert (=> start!74402 true))

(assert (=> start!74402 tp!53168))

(declare-fun array_inv!19348 (array!50921) Bool)

(assert (=> start!74402 (array_inv!19348 _keys!868)))

(declare-fun array_inv!19349 (array!50919) Bool)

(assert (=> start!74402 (and (array_inv!19349 _values!688) e!487694)))

(declare-fun b!876107 () Bool)

(declare-fun res!595380 () Bool)

(assert (=> b!876107 (=> (not res!595380) (not e!487690))))

(assert (=> b!876107 (= res!595380 (and (= (size!24929 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24930 _keys!868) (size!24929 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876108 () Bool)

(declare-fun res!595382 () Bool)

(assert (=> b!876108 (=> (not res!595382) (not e!487690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876108 (= res!595382 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27722 () Bool)

(assert (=> mapIsEmpty!27722 mapRes!27722))

(declare-fun bm!38704 () Bool)

(assert (=> bm!38704 (= call!38707 (getCurrentListMapNoExtraKeys!3176 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876109 () Bool)

(assert (=> b!876109 (= e!487693 (= call!38706 call!38707))))

(declare-fun b!876110 () Bool)

(assert (=> b!876110 (= e!487692 tp_is_empty!17407)))

(declare-fun b!876111 () Bool)

(declare-fun res!595385 () Bool)

(assert (=> b!876111 (=> (not res!595385) (not e!487690))))

(declare-datatypes ((List!17383 0))(
  ( (Nil!17380) (Cons!17379 (h!18510 (_ BitVec 64)) (t!24441 List!17383)) )
))
(declare-fun arrayNoDuplicates!0 (array!50921 (_ BitVec 32) List!17383) Bool)

(assert (=> b!876111 (= res!595385 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17380))))

(declare-fun b!876112 () Bool)

(assert (=> b!876112 (= e!487696 (not e!487691))))

(declare-fun res!595387 () Bool)

(assert (=> b!876112 (=> res!595387 e!487691)))

(assert (=> b!876112 (= res!595387 (not (validKeyInArray!0 (select (arr!24488 _keys!868) from!1053))))))

(assert (=> b!876112 e!487693))

(declare-fun c!92529 () Bool)

(assert (=> b!876112 (= c!92529 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29909 0))(
  ( (Unit!29910) )
))
(declare-fun lt!396222 () Unit!29909)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!677 (array!50921 array!50919 (_ BitVec 32) (_ BitVec 32) V!28257 V!28257 (_ BitVec 32) (_ BitVec 64) V!28257 (_ BitVec 32) Int) Unit!29909)

(assert (=> b!876112 (= lt!396222 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!677 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876113 () Bool)

(declare-fun res!595388 () Bool)

(assert (=> b!876113 (=> (not res!595388) (not e!487690))))

(assert (=> b!876113 (= res!595388 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24930 _keys!868))))))

(declare-fun b!876114 () Bool)

(assert (=> b!876114 (= e!487697 tp_is_empty!17407)))

(declare-fun b!876115 () Bool)

(declare-fun res!595389 () Bool)

(assert (=> b!876115 (=> (not res!595389) (not e!487690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50921 (_ BitVec 32)) Bool)

(assert (=> b!876115 (= res!595389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876116 () Bool)

(declare-fun res!595383 () Bool)

(assert (=> b!876116 (=> (not res!595383) (not e!487690))))

(assert (=> b!876116 (= res!595383 (and (= (select (arr!24488 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74402 res!595386) b!876108))

(assert (= (and b!876108 res!595382) b!876107))

(assert (= (and b!876107 res!595380) b!876115))

(assert (= (and b!876115 res!595389) b!876111))

(assert (= (and b!876111 res!595385) b!876113))

(assert (= (and b!876113 res!595388) b!876105))

(assert (= (and b!876105 res!595381) b!876116))

(assert (= (and b!876116 res!595383) b!876104))

(assert (= (and b!876104 res!595384) b!876112))

(assert (= (and b!876112 c!92529) b!876106))

(assert (= (and b!876112 (not c!92529)) b!876109))

(assert (= (or b!876106 b!876109) bm!38703))

(assert (= (or b!876106 b!876109) bm!38704))

(assert (= (and b!876112 (not res!595387)) b!876102))

(assert (= (and b!876103 condMapEmpty!27722) mapIsEmpty!27722))

(assert (= (and b!876103 (not condMapEmpty!27722)) mapNonEmpty!27722))

(get-info :version)

(assert (= (and mapNonEmpty!27722 ((_ is ValueCellFull!8264) mapValue!27722)) b!876110))

(assert (= (and b!876103 ((_ is ValueCellFull!8264) mapDefault!27722)) b!876114))

(assert (= start!74402 b!876103))

(declare-fun b_lambda!12213 () Bool)

(assert (=> (not b_lambda!12213) (not b!876102)))

(declare-fun t!24439 () Bool)

(declare-fun tb!4915 () Bool)

(assert (=> (and start!74402 (= defaultEntry!696 defaultEntry!696) t!24439) tb!4915))

(declare-fun result!9457 () Bool)

(assert (=> tb!4915 (= result!9457 tp_is_empty!17407)))

(assert (=> b!876102 t!24439))

(declare-fun b_and!24955 () Bool)

(assert (= b_and!24953 (and (=> t!24439 result!9457) b_and!24955)))

(declare-fun m!815355 () Bool)

(assert (=> b!876116 m!815355))

(declare-fun m!815357 () Bool)

(assert (=> b!876106 m!815357))

(declare-fun m!815359 () Bool)

(assert (=> b!876111 m!815359))

(declare-fun m!815361 () Bool)

(assert (=> b!876102 m!815361))

(declare-fun m!815363 () Bool)

(assert (=> b!876102 m!815363))

(declare-fun m!815365 () Bool)

(assert (=> b!876102 m!815365))

(assert (=> b!876102 m!815365))

(declare-fun m!815367 () Bool)

(assert (=> b!876102 m!815367))

(declare-fun m!815369 () Bool)

(assert (=> b!876102 m!815369))

(assert (=> b!876102 m!815361))

(declare-fun m!815371 () Bool)

(assert (=> b!876102 m!815371))

(assert (=> b!876102 m!815367))

(declare-fun m!815373 () Bool)

(assert (=> bm!38704 m!815373))

(declare-fun m!815375 () Bool)

(assert (=> b!876108 m!815375))

(declare-fun m!815377 () Bool)

(assert (=> b!876104 m!815377))

(declare-fun m!815379 () Bool)

(assert (=> b!876104 m!815379))

(declare-fun m!815381 () Bool)

(assert (=> b!876104 m!815381))

(declare-fun m!815383 () Bool)

(assert (=> mapNonEmpty!27722 m!815383))

(declare-fun m!815385 () Bool)

(assert (=> b!876115 m!815385))

(declare-fun m!815387 () Bool)

(assert (=> start!74402 m!815387))

(declare-fun m!815389 () Bool)

(assert (=> start!74402 m!815389))

(declare-fun m!815391 () Bool)

(assert (=> b!876105 m!815391))

(assert (=> bm!38703 m!815361))

(assert (=> b!876112 m!815371))

(assert (=> b!876112 m!815371))

(declare-fun m!815393 () Bool)

(assert (=> b!876112 m!815393))

(declare-fun m!815395 () Bool)

(assert (=> b!876112 m!815395))

(check-sat (not b!876108) (not b_lambda!12213) (not start!74402) (not b!876111) (not bm!38704) (not mapNonEmpty!27722) (not b!876102) (not bm!38703) (not b!876105) (not b_next!15163) (not b!876104) tp_is_empty!17407 (not b!876112) b_and!24955 (not b!876106) (not b!876115))
(check-sat b_and!24955 (not b_next!15163))
