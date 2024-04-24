; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74576 () Bool)

(assert start!74576)

(declare-fun b_free!15151 () Bool)

(declare-fun b_next!15151 () Bool)

(assert (=> start!74576 (= b_free!15151 (not b_next!15151))))

(declare-fun tp!53132 () Bool)

(declare-fun b_and!24965 () Bool)

(assert (=> start!74576 (= tp!53132 b_and!24965)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((array!50965 0))(
  ( (array!50966 (arr!24505 (Array (_ BitVec 32) (_ BitVec 64))) (size!24946 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50965)

(declare-datatypes ((V!28241 0))(
  ( (V!28242 (val!8745 Int)) )
))
(declare-datatypes ((ValueCell!8258 0))(
  ( (ValueCellFull!8258 (v!11178 V!28241)) (EmptyCell!8258) )
))
(declare-datatypes ((array!50967 0))(
  ( (array!50968 (arr!24506 (Array (_ BitVec 32) ValueCell!8258)) (size!24947 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50967)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28241)

(declare-fun zeroValue!654 () V!28241)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!38738 () Bool)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11494 0))(
  ( (tuple2!11495 (_1!5758 (_ BitVec 64)) (_2!5758 V!28241)) )
))
(declare-datatypes ((List!17333 0))(
  ( (Nil!17330) (Cons!17329 (h!18466 tuple2!11494) (t!24380 List!17333)) )
))
(declare-datatypes ((ListLongMap!10265 0))(
  ( (ListLongMap!10266 (toList!5148 List!17333)) )
))
(declare-fun call!38741 () ListLongMap!10265)

(declare-fun getCurrentListMapNoExtraKeys!3190 (array!50965 array!50967 (_ BitVec 32) (_ BitVec 32) V!28241 V!28241 (_ BitVec 32) Int) ListLongMap!10265)

(assert (=> bm!38738 (= call!38741 (getCurrentListMapNoExtraKeys!3190 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876962 () Bool)

(declare-fun e!488277 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876962 (= e!488277 (bvslt i!612 (size!24947 _values!688)))))

(declare-fun lt!396748 () array!50967)

(declare-fun lt!396746 () ListLongMap!10265)

(declare-fun +!2495 (ListLongMap!10265 tuple2!11494) ListLongMap!10265)

(declare-fun get!12903 (ValueCell!8258 V!28241) V!28241)

(declare-fun dynLambda!1231 (Int (_ BitVec 64)) V!28241)

(assert (=> b!876962 (= lt!396746 (+!2495 (getCurrentListMapNoExtraKeys!3190 _keys!868 lt!396748 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11495 (select (arr!24505 _keys!868) from!1053) (get!12903 (select (arr!24506 lt!396748) from!1053) (dynLambda!1231 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!27704 () Bool)

(declare-fun mapRes!27704 () Bool)

(declare-fun tp!53131 () Bool)

(declare-fun e!488276 () Bool)

(assert (=> mapNonEmpty!27704 (= mapRes!27704 (and tp!53131 e!488276))))

(declare-fun mapRest!27704 () (Array (_ BitVec 32) ValueCell!8258))

(declare-fun mapKey!27704 () (_ BitVec 32))

(declare-fun mapValue!27704 () ValueCell!8258)

(assert (=> mapNonEmpty!27704 (= (arr!24506 _values!688) (store mapRest!27704 mapKey!27704 mapValue!27704))))

(declare-fun b!876963 () Bool)

(declare-fun res!595654 () Bool)

(declare-fun e!488281 () Bool)

(assert (=> b!876963 (=> (not res!595654) (not e!488281))))

(assert (=> b!876963 (= res!595654 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24946 _keys!868))))))

(declare-fun b!876964 () Bool)

(declare-fun e!488278 () Bool)

(assert (=> b!876964 (= e!488281 e!488278)))

(declare-fun res!595661 () Bool)

(assert (=> b!876964 (=> (not res!595661) (not e!488278))))

(assert (=> b!876964 (= res!595661 (= from!1053 i!612))))

(assert (=> b!876964 (= lt!396746 (getCurrentListMapNoExtraKeys!3190 _keys!868 lt!396748 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28241)

(assert (=> b!876964 (= lt!396748 (array!50968 (store (arr!24506 _values!688) i!612 (ValueCellFull!8258 v!557)) (size!24947 _values!688)))))

(declare-fun lt!396745 () ListLongMap!10265)

(assert (=> b!876964 (= lt!396745 (getCurrentListMapNoExtraKeys!3190 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27704 () Bool)

(assert (=> mapIsEmpty!27704 mapRes!27704))

(declare-fun b!876965 () Bool)

(declare-fun res!595655 () Bool)

(assert (=> b!876965 (=> (not res!595655) (not e!488281))))

(assert (=> b!876965 (= res!595655 (and (= (size!24947 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24946 _keys!868) (size!24947 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!595662 () Bool)

(assert (=> start!74576 (=> (not res!595662) (not e!488281))))

(assert (=> start!74576 (= res!595662 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24946 _keys!868))))))

(assert (=> start!74576 e!488281))

(declare-fun tp_is_empty!17395 () Bool)

(assert (=> start!74576 tp_is_empty!17395))

(assert (=> start!74576 true))

(assert (=> start!74576 tp!53132))

(declare-fun array_inv!19370 (array!50965) Bool)

(assert (=> start!74576 (array_inv!19370 _keys!868)))

(declare-fun e!488283 () Bool)

(declare-fun array_inv!19371 (array!50967) Bool)

(assert (=> start!74576 (and (array_inv!19371 _values!688) e!488283)))

(declare-fun b!876966 () Bool)

(declare-fun e!488282 () Bool)

(assert (=> b!876966 (= e!488283 (and e!488282 mapRes!27704))))

(declare-fun condMapEmpty!27704 () Bool)

(declare-fun mapDefault!27704 () ValueCell!8258)

(assert (=> b!876966 (= condMapEmpty!27704 (= (arr!24506 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8258)) mapDefault!27704)))))

(declare-fun call!38742 () ListLongMap!10265)

(declare-fun bm!38739 () Bool)

(assert (=> bm!38739 (= call!38742 (getCurrentListMapNoExtraKeys!3190 _keys!868 lt!396748 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876967 () Bool)

(declare-fun res!595659 () Bool)

(assert (=> b!876967 (=> (not res!595659) (not e!488281))))

(declare-datatypes ((List!17334 0))(
  ( (Nil!17331) (Cons!17330 (h!18467 (_ BitVec 64)) (t!24381 List!17334)) )
))
(declare-fun arrayNoDuplicates!0 (array!50965 (_ BitVec 32) List!17334) Bool)

(assert (=> b!876967 (= res!595659 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17331))))

(declare-fun b!876968 () Bool)

(assert (=> b!876968 (= e!488278 (not e!488277))))

(declare-fun res!595656 () Bool)

(assert (=> b!876968 (=> res!595656 e!488277)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876968 (= res!595656 (not (validKeyInArray!0 (select (arr!24505 _keys!868) from!1053))))))

(declare-fun e!488279 () Bool)

(assert (=> b!876968 e!488279))

(declare-fun c!92858 () Bool)

(assert (=> b!876968 (= c!92858 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29938 0))(
  ( (Unit!29939) )
))
(declare-fun lt!396747 () Unit!29938)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!663 (array!50965 array!50967 (_ BitVec 32) (_ BitVec 32) V!28241 V!28241 (_ BitVec 32) (_ BitVec 64) V!28241 (_ BitVec 32) Int) Unit!29938)

(assert (=> b!876968 (= lt!396747 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!663 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876969 () Bool)

(assert (=> b!876969 (= e!488279 (= call!38742 (+!2495 call!38741 (tuple2!11495 k0!854 v!557))))))

(declare-fun b!876970 () Bool)

(declare-fun res!595658 () Bool)

(assert (=> b!876970 (=> (not res!595658) (not e!488281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876970 (= res!595658 (validMask!0 mask!1196))))

(declare-fun b!876971 () Bool)

(declare-fun res!595660 () Bool)

(assert (=> b!876971 (=> (not res!595660) (not e!488281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50965 (_ BitVec 32)) Bool)

(assert (=> b!876971 (= res!595660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876972 () Bool)

(declare-fun res!595663 () Bool)

(assert (=> b!876972 (=> (not res!595663) (not e!488281))))

(assert (=> b!876972 (= res!595663 (validKeyInArray!0 k0!854))))

(declare-fun b!876973 () Bool)

(assert (=> b!876973 (= e!488279 (= call!38742 call!38741))))

(declare-fun b!876974 () Bool)

(assert (=> b!876974 (= e!488276 tp_is_empty!17395)))

(declare-fun b!876975 () Bool)

(declare-fun res!595657 () Bool)

(assert (=> b!876975 (=> (not res!595657) (not e!488281))))

(assert (=> b!876975 (= res!595657 (and (= (select (arr!24505 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876976 () Bool)

(assert (=> b!876976 (= e!488282 tp_is_empty!17395)))

(assert (= (and start!74576 res!595662) b!876970))

(assert (= (and b!876970 res!595658) b!876965))

(assert (= (and b!876965 res!595655) b!876971))

(assert (= (and b!876971 res!595660) b!876967))

(assert (= (and b!876967 res!595659) b!876963))

(assert (= (and b!876963 res!595654) b!876972))

(assert (= (and b!876972 res!595663) b!876975))

(assert (= (and b!876975 res!595657) b!876964))

(assert (= (and b!876964 res!595661) b!876968))

(assert (= (and b!876968 c!92858) b!876969))

(assert (= (and b!876968 (not c!92858)) b!876973))

(assert (= (or b!876969 b!876973) bm!38739))

(assert (= (or b!876969 b!876973) bm!38738))

(assert (= (and b!876968 (not res!595656)) b!876962))

(assert (= (and b!876966 condMapEmpty!27704) mapIsEmpty!27704))

(assert (= (and b!876966 (not condMapEmpty!27704)) mapNonEmpty!27704))

(get-info :version)

(assert (= (and mapNonEmpty!27704 ((_ is ValueCellFull!8258) mapValue!27704)) b!876974))

(assert (= (and b!876966 ((_ is ValueCellFull!8258) mapDefault!27704)) b!876976))

(assert (= start!74576 b!876966))

(declare-fun b_lambda!12233 () Bool)

(assert (=> (not b_lambda!12233) (not b!876962)))

(declare-fun t!24379 () Bool)

(declare-fun tb!4903 () Bool)

(assert (=> (and start!74576 (= defaultEntry!696 defaultEntry!696) t!24379) tb!4903))

(declare-fun result!9433 () Bool)

(assert (=> tb!4903 (= result!9433 tp_is_empty!17395)))

(assert (=> b!876962 t!24379))

(declare-fun b_and!24967 () Bool)

(assert (= b_and!24965 (and (=> t!24379 result!9433) b_and!24967)))

(declare-fun m!817151 () Bool)

(assert (=> b!876968 m!817151))

(assert (=> b!876968 m!817151))

(declare-fun m!817153 () Bool)

(assert (=> b!876968 m!817153))

(declare-fun m!817155 () Bool)

(assert (=> b!876968 m!817155))

(declare-fun m!817157 () Bool)

(assert (=> b!876975 m!817157))

(declare-fun m!817159 () Bool)

(assert (=> b!876971 m!817159))

(declare-fun m!817161 () Bool)

(assert (=> b!876969 m!817161))

(declare-fun m!817163 () Bool)

(assert (=> start!74576 m!817163))

(declare-fun m!817165 () Bool)

(assert (=> start!74576 m!817165))

(declare-fun m!817167 () Bool)

(assert (=> bm!38738 m!817167))

(declare-fun m!817169 () Bool)

(assert (=> b!876972 m!817169))

(declare-fun m!817171 () Bool)

(assert (=> b!876964 m!817171))

(declare-fun m!817173 () Bool)

(assert (=> b!876964 m!817173))

(declare-fun m!817175 () Bool)

(assert (=> b!876964 m!817175))

(declare-fun m!817177 () Bool)

(assert (=> bm!38739 m!817177))

(declare-fun m!817179 () Bool)

(assert (=> b!876962 m!817179))

(declare-fun m!817181 () Bool)

(assert (=> b!876962 m!817181))

(declare-fun m!817183 () Bool)

(assert (=> b!876962 m!817183))

(assert (=> b!876962 m!817177))

(declare-fun m!817185 () Bool)

(assert (=> b!876962 m!817185))

(assert (=> b!876962 m!817179))

(assert (=> b!876962 m!817177))

(assert (=> b!876962 m!817151))

(assert (=> b!876962 m!817181))

(declare-fun m!817187 () Bool)

(assert (=> b!876970 m!817187))

(declare-fun m!817189 () Bool)

(assert (=> b!876967 m!817189))

(declare-fun m!817191 () Bool)

(assert (=> mapNonEmpty!27704 m!817191))

(check-sat (not b_next!15151) b_and!24967 (not b!876967) (not b!876972) tp_is_empty!17395 (not b_lambda!12233) (not b!876964) (not bm!38739) (not b!876962) (not mapNonEmpty!27704) (not start!74576) (not b!876968) (not bm!38738) (not b!876970) (not b!876969) (not b!876971))
(check-sat b_and!24967 (not b_next!15151))
