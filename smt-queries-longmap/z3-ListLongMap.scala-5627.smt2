; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73528 () Bool)

(assert start!73528)

(declare-fun b_free!14461 () Bool)

(declare-fun b_next!14461 () Bool)

(assert (=> start!73528 (= b_free!14461 (not b_next!14461))))

(declare-fun tp!50887 () Bool)

(declare-fun b_and!23875 () Bool)

(assert (=> start!73528 (= tp!50887 b_and!23875)))

(declare-fun b!859574 () Bool)

(declare-fun res!584131 () Bool)

(declare-fun e!478990 () Bool)

(assert (=> b!859574 (=> (not res!584131) (not e!478990))))

(declare-datatypes ((array!49357 0))(
  ( (array!49358 (arr!23710 (Array (_ BitVec 32) (_ BitVec 64))) (size!24152 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49357)

(declare-datatypes ((List!16833 0))(
  ( (Nil!16830) (Cons!16829 (h!17960 (_ BitVec 64)) (t!23551 List!16833)) )
))
(declare-fun arrayNoDuplicates!0 (array!49357 (_ BitVec 32) List!16833) Bool)

(assert (=> b!859574 (= res!584131 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16830))))

(declare-fun b!859575 () Bool)

(declare-fun res!584138 () Bool)

(assert (=> b!859575 (=> (not res!584138) (not e!478990))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27177 0))(
  ( (V!27178 (val!8346 Int)) )
))
(declare-datatypes ((ValueCell!7859 0))(
  ( (ValueCellFull!7859 (v!10765 V!27177)) (EmptyCell!7859) )
))
(declare-datatypes ((array!49359 0))(
  ( (array!49360 (arr!23711 (Array (_ BitVec 32) ValueCell!7859)) (size!24153 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49359)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!859575 (= res!584138 (and (= (size!24153 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24152 _keys!868) (size!24153 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859576 () Bool)

(declare-fun res!584137 () Bool)

(declare-fun e!478997 () Bool)

(assert (=> b!859576 (=> res!584137 e!478997)))

(declare-fun contains!4204 (List!16833 (_ BitVec 64)) Bool)

(assert (=> b!859576 (= res!584137 (contains!4204 Nil!16830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859577 () Bool)

(declare-fun res!584133 () Bool)

(assert (=> b!859577 (=> (not res!584133) (not e!478990))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859577 (= res!584133 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24152 _keys!868))))))

(declare-fun b!859578 () Bool)

(declare-fun e!478998 () Bool)

(declare-fun tp_is_empty!16597 () Bool)

(assert (=> b!859578 (= e!478998 tp_is_empty!16597)))

(declare-fun b!859579 () Bool)

(declare-fun res!584130 () Bool)

(assert (=> b!859579 (=> (not res!584130) (not e!478990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49357 (_ BitVec 32)) Bool)

(assert (=> b!859579 (= res!584130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26495 () Bool)

(declare-fun mapRes!26495 () Bool)

(assert (=> mapIsEmpty!26495 mapRes!26495))

(declare-fun b!859580 () Bool)

(declare-fun e!478996 () Bool)

(assert (=> b!859580 (= e!478996 tp_is_empty!16597)))

(declare-fun res!584140 () Bool)

(assert (=> start!73528 (=> (not res!584140) (not e!478990))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73528 (= res!584140 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24152 _keys!868))))))

(assert (=> start!73528 e!478990))

(assert (=> start!73528 tp_is_empty!16597))

(assert (=> start!73528 true))

(assert (=> start!73528 tp!50887))

(declare-fun array_inv!18834 (array!49357) Bool)

(assert (=> start!73528 (array_inv!18834 _keys!868)))

(declare-fun e!478991 () Bool)

(declare-fun array_inv!18835 (array!49359) Bool)

(assert (=> start!73528 (and (array_inv!18835 _values!688) e!478991)))

(declare-fun b!859581 () Bool)

(declare-fun e!478994 () Bool)

(assert (=> b!859581 (= e!478990 e!478994)))

(declare-fun res!584141 () Bool)

(assert (=> b!859581 (=> (not res!584141) (not e!478994))))

(assert (=> b!859581 (= res!584141 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11032 0))(
  ( (tuple2!11033 (_1!5527 (_ BitVec 64)) (_2!5527 V!27177)) )
))
(declare-datatypes ((List!16834 0))(
  ( (Nil!16831) (Cons!16830 (h!17961 tuple2!11032) (t!23552 List!16834)) )
))
(declare-datatypes ((ListLongMap!9791 0))(
  ( (ListLongMap!9792 (toList!4911 List!16834)) )
))
(declare-fun lt!387239 () ListLongMap!9791)

(declare-fun lt!387243 () array!49359)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27177)

(declare-fun zeroValue!654 () V!27177)

(declare-fun getCurrentListMapNoExtraKeys!2915 (array!49357 array!49359 (_ BitVec 32) (_ BitVec 32) V!27177 V!27177 (_ BitVec 32) Int) ListLongMap!9791)

(assert (=> b!859581 (= lt!387239 (getCurrentListMapNoExtraKeys!2915 _keys!868 lt!387243 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27177)

(assert (=> b!859581 (= lt!387243 (array!49360 (store (arr!23711 _values!688) i!612 (ValueCellFull!7859 v!557)) (size!24153 _values!688)))))

(declare-fun lt!387244 () ListLongMap!9791)

(assert (=> b!859581 (= lt!387244 (getCurrentListMapNoExtraKeys!2915 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859582 () Bool)

(declare-fun res!584132 () Bool)

(assert (=> b!859582 (=> (not res!584132) (not e!478990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859582 (= res!584132 (validMask!0 mask!1196))))

(declare-fun b!859583 () Bool)

(assert (=> b!859583 (= e!478991 (and e!478996 mapRes!26495))))

(declare-fun condMapEmpty!26495 () Bool)

(declare-fun mapDefault!26495 () ValueCell!7859)

(assert (=> b!859583 (= condMapEmpty!26495 (= (arr!23711 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7859)) mapDefault!26495)))))

(declare-fun b!859584 () Bool)

(declare-fun e!478995 () Bool)

(assert (=> b!859584 (= e!478994 (not e!478995))))

(declare-fun res!584136 () Bool)

(assert (=> b!859584 (=> res!584136 e!478995)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859584 (= res!584136 (not (validKeyInArray!0 (select (arr!23710 _keys!868) from!1053))))))

(declare-fun lt!387245 () ListLongMap!9791)

(declare-fun lt!387241 () ListLongMap!9791)

(assert (=> b!859584 (= lt!387245 lt!387241)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!387240 () ListLongMap!9791)

(declare-fun +!2285 (ListLongMap!9791 tuple2!11032) ListLongMap!9791)

(assert (=> b!859584 (= lt!387241 (+!2285 lt!387240 (tuple2!11033 k0!854 v!557)))))

(assert (=> b!859584 (= lt!387245 (getCurrentListMapNoExtraKeys!2915 _keys!868 lt!387243 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859584 (= lt!387240 (getCurrentListMapNoExtraKeys!2915 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29239 0))(
  ( (Unit!29240) )
))
(declare-fun lt!387248 () Unit!29239)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!477 (array!49357 array!49359 (_ BitVec 32) (_ BitVec 32) V!27177 V!27177 (_ BitVec 32) (_ BitVec 64) V!27177 (_ BitVec 32) Int) Unit!29239)

(assert (=> b!859584 (= lt!387248 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!477 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859585 () Bool)

(declare-fun e!478992 () Bool)

(assert (=> b!859585 (= e!478992 e!478997)))

(declare-fun res!584129 () Bool)

(assert (=> b!859585 (=> res!584129 e!478997)))

(assert (=> b!859585 (= res!584129 (or (bvsge (size!24152 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24152 _keys!868)) (bvsge from!1053 (size!24152 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859585 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387242 () Unit!29239)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49357 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29239)

(assert (=> b!859585 (= lt!387242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859585 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16830)))

(declare-fun lt!387246 () Unit!29239)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49357 (_ BitVec 32) (_ BitVec 32)) Unit!29239)

(assert (=> b!859585 (= lt!387246 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859586 () Bool)

(declare-fun res!584139 () Bool)

(assert (=> b!859586 (=> (not res!584139) (not e!478990))))

(assert (=> b!859586 (= res!584139 (and (= (select (arr!23710 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859587 () Bool)

(declare-fun res!584135 () Bool)

(assert (=> b!859587 (=> res!584135 e!478997)))

(declare-fun noDuplicate!1313 (List!16833) Bool)

(assert (=> b!859587 (= res!584135 (not (noDuplicate!1313 Nil!16830)))))

(declare-fun mapNonEmpty!26495 () Bool)

(declare-fun tp!50888 () Bool)

(assert (=> mapNonEmpty!26495 (= mapRes!26495 (and tp!50888 e!478998))))

(declare-fun mapRest!26495 () (Array (_ BitVec 32) ValueCell!7859))

(declare-fun mapKey!26495 () (_ BitVec 32))

(declare-fun mapValue!26495 () ValueCell!7859)

(assert (=> mapNonEmpty!26495 (= (arr!23711 _values!688) (store mapRest!26495 mapKey!26495 mapValue!26495))))

(declare-fun b!859588 () Bool)

(declare-fun res!584142 () Bool)

(assert (=> b!859588 (=> (not res!584142) (not e!478990))))

(assert (=> b!859588 (= res!584142 (validKeyInArray!0 k0!854))))

(declare-fun b!859589 () Bool)

(assert (=> b!859589 (= e!478997 true)))

(declare-fun lt!387247 () Bool)

(assert (=> b!859589 (= lt!387247 (contains!4204 Nil!16830 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859590 () Bool)

(assert (=> b!859590 (= e!478995 e!478992)))

(declare-fun res!584134 () Bool)

(assert (=> b!859590 (=> res!584134 e!478992)))

(assert (=> b!859590 (= res!584134 (not (= (select (arr!23710 _keys!868) from!1053) k0!854)))))

(declare-fun get!12502 (ValueCell!7859 V!27177) V!27177)

(declare-fun dynLambda!1101 (Int (_ BitVec 64)) V!27177)

(assert (=> b!859590 (= lt!387239 (+!2285 lt!387241 (tuple2!11033 (select (arr!23710 _keys!868) from!1053) (get!12502 (select (arr!23711 _values!688) from!1053) (dynLambda!1101 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!73528 res!584140) b!859582))

(assert (= (and b!859582 res!584132) b!859575))

(assert (= (and b!859575 res!584138) b!859579))

(assert (= (and b!859579 res!584130) b!859574))

(assert (= (and b!859574 res!584131) b!859577))

(assert (= (and b!859577 res!584133) b!859588))

(assert (= (and b!859588 res!584142) b!859586))

(assert (= (and b!859586 res!584139) b!859581))

(assert (= (and b!859581 res!584141) b!859584))

(assert (= (and b!859584 (not res!584136)) b!859590))

(assert (= (and b!859590 (not res!584134)) b!859585))

(assert (= (and b!859585 (not res!584129)) b!859587))

(assert (= (and b!859587 (not res!584135)) b!859576))

(assert (= (and b!859576 (not res!584137)) b!859589))

(assert (= (and b!859583 condMapEmpty!26495) mapIsEmpty!26495))

(assert (= (and b!859583 (not condMapEmpty!26495)) mapNonEmpty!26495))

(get-info :version)

(assert (= (and mapNonEmpty!26495 ((_ is ValueCellFull!7859) mapValue!26495)) b!859578))

(assert (= (and b!859583 ((_ is ValueCellFull!7859) mapDefault!26495)) b!859580))

(assert (= start!73528 b!859583))

(declare-fun b_lambda!11795 () Bool)

(assert (=> (not b_lambda!11795) (not b!859590)))

(declare-fun t!23550 () Bool)

(declare-fun tb!4575 () Bool)

(assert (=> (and start!73528 (= defaultEntry!696 defaultEntry!696) t!23550) tb!4575))

(declare-fun result!8769 () Bool)

(assert (=> tb!4575 (= result!8769 tp_is_empty!16597)))

(assert (=> b!859590 t!23550))

(declare-fun b_and!23877 () Bool)

(assert (= b_and!23875 (and (=> t!23550 result!8769) b_and!23877)))

(declare-fun m!799827 () Bool)

(assert (=> b!859587 m!799827))

(declare-fun m!799829 () Bool)

(assert (=> mapNonEmpty!26495 m!799829))

(declare-fun m!799831 () Bool)

(assert (=> start!73528 m!799831))

(declare-fun m!799833 () Bool)

(assert (=> start!73528 m!799833))

(declare-fun m!799835 () Bool)

(assert (=> b!859590 m!799835))

(declare-fun m!799837 () Bool)

(assert (=> b!859590 m!799837))

(declare-fun m!799839 () Bool)

(assert (=> b!859590 m!799839))

(declare-fun m!799841 () Bool)

(assert (=> b!859590 m!799841))

(assert (=> b!859590 m!799837))

(declare-fun m!799843 () Bool)

(assert (=> b!859590 m!799843))

(assert (=> b!859590 m!799839))

(declare-fun m!799845 () Bool)

(assert (=> b!859576 m!799845))

(declare-fun m!799847 () Bool)

(assert (=> b!859582 m!799847))

(declare-fun m!799849 () Bool)

(assert (=> b!859584 m!799849))

(assert (=> b!859584 m!799843))

(declare-fun m!799851 () Bool)

(assert (=> b!859584 m!799851))

(assert (=> b!859584 m!799843))

(declare-fun m!799853 () Bool)

(assert (=> b!859584 m!799853))

(declare-fun m!799855 () Bool)

(assert (=> b!859584 m!799855))

(declare-fun m!799857 () Bool)

(assert (=> b!859584 m!799857))

(declare-fun m!799859 () Bool)

(assert (=> b!859588 m!799859))

(declare-fun m!799861 () Bool)

(assert (=> b!859589 m!799861))

(declare-fun m!799863 () Bool)

(assert (=> b!859579 m!799863))

(declare-fun m!799865 () Bool)

(assert (=> b!859574 m!799865))

(declare-fun m!799867 () Bool)

(assert (=> b!859581 m!799867))

(declare-fun m!799869 () Bool)

(assert (=> b!859581 m!799869))

(declare-fun m!799871 () Bool)

(assert (=> b!859581 m!799871))

(declare-fun m!799873 () Bool)

(assert (=> b!859586 m!799873))

(declare-fun m!799875 () Bool)

(assert (=> b!859585 m!799875))

(declare-fun m!799877 () Bool)

(assert (=> b!859585 m!799877))

(declare-fun m!799879 () Bool)

(assert (=> b!859585 m!799879))

(declare-fun m!799881 () Bool)

(assert (=> b!859585 m!799881))

(check-sat (not b_next!14461) (not b!859574) (not b!859585) (not b!859588) (not b!859579) (not b!859590) (not b!859576) tp_is_empty!16597 b_and!23877 (not b!859581) (not b!859582) (not start!73528) (not b!859587) (not b!859589) (not b_lambda!11795) (not b!859584) (not mapNonEmpty!26495))
(check-sat b_and!23877 (not b_next!14461))
