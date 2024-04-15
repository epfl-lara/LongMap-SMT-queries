; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74390 () Bool)

(assert start!74390)

(declare-fun b_free!15151 () Bool)

(declare-fun b_next!15151 () Bool)

(assert (=> start!74390 (= b_free!15151 (not b_next!15151))))

(declare-fun tp!53132 () Bool)

(declare-fun b_and!24929 () Bool)

(assert (=> start!74390 (= tp!53132 b_and!24929)))

(declare-fun b!875820 () Bool)

(declare-fun res!595208 () Bool)

(declare-fun e!487549 () Bool)

(assert (=> b!875820 (=> (not res!595208) (not e!487549))))

(declare-datatypes ((array!50895 0))(
  ( (array!50896 (arr!24475 (Array (_ BitVec 32) (_ BitVec 64))) (size!24917 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50895)

(declare-datatypes ((List!17372 0))(
  ( (Nil!17369) (Cons!17368 (h!18499 (_ BitVec 64)) (t!24418 List!17372)) )
))
(declare-fun arrayNoDuplicates!0 (array!50895 (_ BitVec 32) List!17372) Bool)

(assert (=> b!875820 (= res!595208 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17369))))

(declare-fun b!875821 () Bool)

(declare-fun res!595202 () Bool)

(assert (=> b!875821 (=> (not res!595202) (not e!487549))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!875821 (= res!595202 (and (= (select (arr!24475 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-datatypes ((V!28241 0))(
  ( (V!28242 (val!8745 Int)) )
))
(declare-datatypes ((tuple2!11564 0))(
  ( (tuple2!11565 (_1!5793 (_ BitVec 64)) (_2!5793 V!28241)) )
))
(declare-datatypes ((List!17373 0))(
  ( (Nil!17370) (Cons!17369 (h!18500 tuple2!11564) (t!24419 List!17373)) )
))
(declare-datatypes ((ListLongMap!10323 0))(
  ( (ListLongMap!10324 (toList!5177 List!17373)) )
))
(declare-fun call!38671 () ListLongMap!10323)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38667 () Bool)

(declare-fun minValue!654 () V!28241)

(declare-fun zeroValue!654 () V!28241)

(declare-datatypes ((ValueCell!8258 0))(
  ( (ValueCellFull!8258 (v!11172 V!28241)) (EmptyCell!8258) )
))
(declare-datatypes ((array!50897 0))(
  ( (array!50898 (arr!24476 (Array (_ BitVec 32) ValueCell!8258)) (size!24918 (_ BitVec 32))) )
))
(declare-fun lt!396151 () array!50897)

(declare-fun getCurrentListMapNoExtraKeys!3170 (array!50895 array!50897 (_ BitVec 32) (_ BitVec 32) V!28241 V!28241 (_ BitVec 32) Int) ListLongMap!10323)

(assert (=> bm!38667 (= call!38671 (getCurrentListMapNoExtraKeys!3170 _keys!868 lt!396151 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875822 () Bool)

(declare-fun res!595200 () Bool)

(assert (=> b!875822 (=> (not res!595200) (not e!487549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875822 (= res!595200 (validKeyInArray!0 k0!854))))

(declare-fun b!875823 () Bool)

(declare-fun e!487548 () Bool)

(declare-fun tp_is_empty!17395 () Bool)

(assert (=> b!875823 (= e!487548 tp_is_empty!17395)))

(declare-fun b!875824 () Bool)

(declare-fun res!595205 () Bool)

(assert (=> b!875824 (=> (not res!595205) (not e!487549))))

(declare-fun _values!688 () array!50897)

(assert (=> b!875824 (= res!595205 (and (= (size!24918 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24917 _keys!868) (size!24918 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27704 () Bool)

(declare-fun mapRes!27704 () Bool)

(declare-fun tp!53131 () Bool)

(declare-fun e!487550 () Bool)

(assert (=> mapNonEmpty!27704 (= mapRes!27704 (and tp!53131 e!487550))))

(declare-fun mapRest!27704 () (Array (_ BitVec 32) ValueCell!8258))

(declare-fun mapValue!27704 () ValueCell!8258)

(declare-fun mapKey!27704 () (_ BitVec 32))

(assert (=> mapNonEmpty!27704 (= (arr!24476 _values!688) (store mapRest!27704 mapKey!27704 mapValue!27704))))

(declare-fun b!875825 () Bool)

(declare-fun e!487552 () Bool)

(assert (=> b!875825 (= e!487549 e!487552)))

(declare-fun res!595204 () Bool)

(assert (=> b!875825 (=> (not res!595204) (not e!487552))))

(assert (=> b!875825 (= res!595204 (= from!1053 i!612))))

(declare-fun lt!396150 () ListLongMap!10323)

(assert (=> b!875825 (= lt!396150 (getCurrentListMapNoExtraKeys!3170 _keys!868 lt!396151 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28241)

(assert (=> b!875825 (= lt!396151 (array!50898 (store (arr!24476 _values!688) i!612 (ValueCellFull!8258 v!557)) (size!24918 _values!688)))))

(declare-fun lt!396149 () ListLongMap!10323)

(assert (=> b!875825 (= lt!396149 (getCurrentListMapNoExtraKeys!3170 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875826 () Bool)

(declare-fun e!487553 () Bool)

(assert (=> b!875826 (= e!487553 (and e!487548 mapRes!27704))))

(declare-fun condMapEmpty!27704 () Bool)

(declare-fun mapDefault!27704 () ValueCell!8258)

(assert (=> b!875826 (= condMapEmpty!27704 (= (arr!24476 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8258)) mapDefault!27704)))))

(declare-fun mapIsEmpty!27704 () Bool)

(assert (=> mapIsEmpty!27704 mapRes!27704))

(declare-fun b!875827 () Bool)

(declare-fun res!595206 () Bool)

(assert (=> b!875827 (=> (not res!595206) (not e!487549))))

(assert (=> b!875827 (= res!595206 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24917 _keys!868))))))

(declare-fun res!595203 () Bool)

(assert (=> start!74390 (=> (not res!595203) (not e!487549))))

(assert (=> start!74390 (= res!595203 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24917 _keys!868))))))

(assert (=> start!74390 e!487549))

(assert (=> start!74390 tp_is_empty!17395))

(assert (=> start!74390 true))

(assert (=> start!74390 tp!53132))

(declare-fun array_inv!19340 (array!50895) Bool)

(assert (=> start!74390 (array_inv!19340 _keys!868)))

(declare-fun array_inv!19341 (array!50897) Bool)

(assert (=> start!74390 (and (array_inv!19341 _values!688) e!487553)))

(declare-fun b!875828 () Bool)

(declare-fun e!487547 () Bool)

(declare-fun call!38670 () ListLongMap!10323)

(assert (=> b!875828 (= e!487547 (= call!38671 call!38670))))

(declare-fun bm!38668 () Bool)

(assert (=> bm!38668 (= call!38670 (getCurrentListMapNoExtraKeys!3170 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875829 () Bool)

(declare-fun res!595207 () Bool)

(assert (=> b!875829 (=> (not res!595207) (not e!487549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875829 (= res!595207 (validMask!0 mask!1196))))

(declare-fun b!875830 () Bool)

(declare-fun res!595209 () Bool)

(assert (=> b!875830 (=> (not res!595209) (not e!487549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50895 (_ BitVec 32)) Bool)

(assert (=> b!875830 (= res!595209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875831 () Bool)

(declare-fun e!487546 () Bool)

(assert (=> b!875831 (= e!487552 (not e!487546))))

(declare-fun res!595201 () Bool)

(assert (=> b!875831 (=> res!595201 e!487546)))

(assert (=> b!875831 (= res!595201 (not (validKeyInArray!0 (select (arr!24475 _keys!868) from!1053))))))

(assert (=> b!875831 e!487547))

(declare-fun c!92511 () Bool)

(assert (=> b!875831 (= c!92511 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29901 0))(
  ( (Unit!29902) )
))
(declare-fun lt!396148 () Unit!29901)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!673 (array!50895 array!50897 (_ BitVec 32) (_ BitVec 32) V!28241 V!28241 (_ BitVec 32) (_ BitVec 64) V!28241 (_ BitVec 32) Int) Unit!29901)

(assert (=> b!875831 (= lt!396148 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!673 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875832 () Bool)

(assert (=> b!875832 (= e!487550 tp_is_empty!17395)))

(declare-fun b!875833 () Bool)

(assert (=> b!875833 (= e!487546 (bvslt i!612 (size!24918 _values!688)))))

(declare-fun +!2504 (ListLongMap!10323 tuple2!11564) ListLongMap!10323)

(declare-fun get!12877 (ValueCell!8258 V!28241) V!28241)

(declare-fun dynLambda!1208 (Int (_ BitVec 64)) V!28241)

(assert (=> b!875833 (= lt!396150 (+!2504 (getCurrentListMapNoExtraKeys!3170 _keys!868 lt!396151 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11565 (select (arr!24475 _keys!868) from!1053) (get!12877 (select (arr!24476 lt!396151) from!1053) (dynLambda!1208 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!875834 () Bool)

(assert (=> b!875834 (= e!487547 (= call!38671 (+!2504 call!38670 (tuple2!11565 k0!854 v!557))))))

(assert (= (and start!74390 res!595203) b!875829))

(assert (= (and b!875829 res!595207) b!875824))

(assert (= (and b!875824 res!595205) b!875830))

(assert (= (and b!875830 res!595209) b!875820))

(assert (= (and b!875820 res!595208) b!875827))

(assert (= (and b!875827 res!595206) b!875822))

(assert (= (and b!875822 res!595200) b!875821))

(assert (= (and b!875821 res!595202) b!875825))

(assert (= (and b!875825 res!595204) b!875831))

(assert (= (and b!875831 c!92511) b!875834))

(assert (= (and b!875831 (not c!92511)) b!875828))

(assert (= (or b!875834 b!875828) bm!38667))

(assert (= (or b!875834 b!875828) bm!38668))

(assert (= (and b!875831 (not res!595201)) b!875833))

(assert (= (and b!875826 condMapEmpty!27704) mapIsEmpty!27704))

(assert (= (and b!875826 (not condMapEmpty!27704)) mapNonEmpty!27704))

(get-info :version)

(assert (= (and mapNonEmpty!27704 ((_ is ValueCellFull!8258) mapValue!27704)) b!875832))

(assert (= (and b!875826 ((_ is ValueCellFull!8258) mapDefault!27704)) b!875823))

(assert (= start!74390 b!875826))

(declare-fun b_lambda!12201 () Bool)

(assert (=> (not b_lambda!12201) (not b!875833)))

(declare-fun t!24417 () Bool)

(declare-fun tb!4903 () Bool)

(assert (=> (and start!74390 (= defaultEntry!696 defaultEntry!696) t!24417) tb!4903))

(declare-fun result!9433 () Bool)

(assert (=> tb!4903 (= result!9433 tp_is_empty!17395)))

(assert (=> b!875833 t!24417))

(declare-fun b_and!24931 () Bool)

(assert (= b_and!24929 (and (=> t!24417 result!9433) b_and!24931)))

(declare-fun m!815103 () Bool)

(assert (=> bm!38668 m!815103))

(declare-fun m!815105 () Bool)

(assert (=> b!875825 m!815105))

(declare-fun m!815107 () Bool)

(assert (=> b!875825 m!815107))

(declare-fun m!815109 () Bool)

(assert (=> b!875825 m!815109))

(declare-fun m!815111 () Bool)

(assert (=> bm!38667 m!815111))

(declare-fun m!815113 () Bool)

(assert (=> mapNonEmpty!27704 m!815113))

(declare-fun m!815115 () Bool)

(assert (=> b!875822 m!815115))

(declare-fun m!815117 () Bool)

(assert (=> start!74390 m!815117))

(declare-fun m!815119 () Bool)

(assert (=> start!74390 m!815119))

(declare-fun m!815121 () Bool)

(assert (=> b!875829 m!815121))

(declare-fun m!815123 () Bool)

(assert (=> b!875820 m!815123))

(declare-fun m!815125 () Bool)

(assert (=> b!875834 m!815125))

(declare-fun m!815127 () Bool)

(assert (=> b!875821 m!815127))

(declare-fun m!815129 () Bool)

(assert (=> b!875831 m!815129))

(assert (=> b!875831 m!815129))

(declare-fun m!815131 () Bool)

(assert (=> b!875831 m!815131))

(declare-fun m!815133 () Bool)

(assert (=> b!875831 m!815133))

(declare-fun m!815135 () Bool)

(assert (=> b!875830 m!815135))

(declare-fun m!815137 () Bool)

(assert (=> b!875833 m!815137))

(assert (=> b!875833 m!815111))

(declare-fun m!815139 () Bool)

(assert (=> b!875833 m!815139))

(assert (=> b!875833 m!815111))

(assert (=> b!875833 m!815137))

(declare-fun m!815141 () Bool)

(assert (=> b!875833 m!815141))

(declare-fun m!815143 () Bool)

(assert (=> b!875833 m!815143))

(assert (=> b!875833 m!815129))

(assert (=> b!875833 m!815141))

(check-sat (not b!875830) (not b!875829) (not b!875820) (not b_next!15151) (not b!875831) (not b!875825) (not b_lambda!12201) (not bm!38667) (not start!74390) tp_is_empty!17395 (not mapNonEmpty!27704) (not b!875833) (not b!875822) (not bm!38668) (not b!875834) b_and!24931)
(check-sat b_and!24931 (not b_next!15151))
