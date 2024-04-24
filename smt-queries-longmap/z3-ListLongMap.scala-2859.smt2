; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41170 () Bool)

(assert start!41170)

(declare-fun b_free!11053 () Bool)

(declare-fun b_next!11053 () Bool)

(assert (=> start!41170 (= b_free!11053 (not b_next!11053))))

(declare-fun tp!38994 () Bool)

(declare-fun b_and!19355 () Bool)

(assert (=> start!41170 (= tp!38994 b_and!19355)))

(declare-fun b!460372 () Bool)

(declare-fun e!268588 () Bool)

(declare-fun tp_is_empty!12391 () Bool)

(assert (=> b!460372 (= e!268588 tp_is_empty!12391)))

(declare-fun b!460373 () Bool)

(declare-fun e!268590 () Bool)

(declare-fun e!268584 () Bool)

(assert (=> b!460373 (= e!268590 (not e!268584))))

(declare-fun res!275277 () Bool)

(assert (=> b!460373 (=> res!275277 e!268584)))

(declare-datatypes ((array!28576 0))(
  ( (array!28577 (arr!13728 (Array (_ BitVec 32) (_ BitVec 64))) (size!14080 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28576)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460373 (= res!275277 (not (validKeyInArray!0 (select (arr!13728 _keys!709) from!863))))))

(declare-datatypes ((V!17627 0))(
  ( (V!17628 (val!6240 Int)) )
))
(declare-datatypes ((tuple2!8158 0))(
  ( (tuple2!8159 (_1!4090 (_ BitVec 64)) (_2!4090 V!17627)) )
))
(declare-datatypes ((List!8223 0))(
  ( (Nil!8220) (Cons!8219 (h!9075 tuple2!8158) (t!14147 List!8223)) )
))
(declare-datatypes ((ListLongMap!7073 0))(
  ( (ListLongMap!7074 (toList!3552 List!8223)) )
))
(declare-fun lt!208515 () ListLongMap!7073)

(declare-fun lt!208512 () ListLongMap!7073)

(assert (=> b!460373 (= lt!208515 lt!208512)))

(declare-fun lt!208517 () ListLongMap!7073)

(declare-fun lt!208519 () tuple2!8158)

(declare-fun +!1628 (ListLongMap!7073 tuple2!8158) ListLongMap!7073)

(assert (=> b!460373 (= lt!208512 (+!1628 lt!208517 lt!208519))))

(declare-fun minValue!515 () V!17627)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17627)

(declare-fun lt!208514 () array!28576)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5852 0))(
  ( (ValueCellFull!5852 (v!8519 V!17627)) (EmptyCell!5852) )
))
(declare-datatypes ((array!28578 0))(
  ( (array!28579 (arr!13729 (Array (_ BitVec 32) ValueCell!5852)) (size!14081 (_ BitVec 32))) )
))
(declare-fun lt!208513 () array!28578)

(declare-fun getCurrentListMapNoExtraKeys!1779 (array!28576 array!28578 (_ BitVec 32) (_ BitVec 32) V!17627 V!17627 (_ BitVec 32) Int) ListLongMap!7073)

(assert (=> b!460373 (= lt!208515 (getCurrentListMapNoExtraKeys!1779 lt!208514 lt!208513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17627)

(assert (=> b!460373 (= lt!208519 (tuple2!8159 k0!794 v!412))))

(declare-fun _values!549 () array!28578)

(assert (=> b!460373 (= lt!208517 (getCurrentListMapNoExtraKeys!1779 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13392 0))(
  ( (Unit!13393) )
))
(declare-fun lt!208523 () Unit!13392)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!782 (array!28576 array!28578 (_ BitVec 32) (_ BitVec 32) V!17627 V!17627 (_ BitVec 32) (_ BitVec 64) V!17627 (_ BitVec 32) Int) Unit!13392)

(assert (=> b!460373 (= lt!208523 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460374 () Bool)

(declare-fun e!268589 () Bool)

(assert (=> b!460374 (= e!268589 e!268590)))

(declare-fun res!275275 () Bool)

(assert (=> b!460374 (=> (not res!275275) (not e!268590))))

(assert (=> b!460374 (= res!275275 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208518 () ListLongMap!7073)

(assert (=> b!460374 (= lt!208518 (getCurrentListMapNoExtraKeys!1779 lt!208514 lt!208513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460374 (= lt!208513 (array!28579 (store (arr!13729 _values!549) i!563 (ValueCellFull!5852 v!412)) (size!14081 _values!549)))))

(declare-fun lt!208522 () ListLongMap!7073)

(assert (=> b!460374 (= lt!208522 (getCurrentListMapNoExtraKeys!1779 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460375 () Bool)

(declare-fun res!275278 () Bool)

(assert (=> b!460375 (=> (not res!275278) (not e!268589))))

(assert (=> b!460375 (= res!275278 (bvsle from!863 i!563))))

(declare-fun b!460376 () Bool)

(declare-fun res!275286 () Bool)

(declare-fun e!268587 () Bool)

(assert (=> b!460376 (=> (not res!275286) (not e!268587))))

(assert (=> b!460376 (= res!275286 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14080 _keys!709))))))

(declare-fun b!460377 () Bool)

(declare-fun res!275281 () Bool)

(assert (=> b!460377 (=> (not res!275281) (not e!268589))))

(declare-datatypes ((List!8224 0))(
  ( (Nil!8221) (Cons!8220 (h!9076 (_ BitVec 64)) (t!14148 List!8224)) )
))
(declare-fun arrayNoDuplicates!0 (array!28576 (_ BitVec 32) List!8224) Bool)

(assert (=> b!460377 (= res!275281 (arrayNoDuplicates!0 lt!208514 #b00000000000000000000000000000000 Nil!8221))))

(declare-fun b!460378 () Bool)

(declare-fun res!275279 () Bool)

(assert (=> b!460378 (=> (not res!275279) (not e!268587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28576 (_ BitVec 32)) Bool)

(assert (=> b!460378 (= res!275279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460379 () Bool)

(declare-fun res!275289 () Bool)

(assert (=> b!460379 (=> (not res!275289) (not e!268587))))

(assert (=> b!460379 (= res!275289 (or (= (select (arr!13728 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13728 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460380 () Bool)

(declare-fun e!268585 () Unit!13392)

(declare-fun Unit!13394 () Unit!13392)

(assert (=> b!460380 (= e!268585 Unit!13394)))

(declare-fun lt!208510 () Unit!13392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28576 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13392)

(assert (=> b!460380 (= lt!208510 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460380 false))

(declare-fun b!460381 () Bool)

(declare-fun res!275280 () Bool)

(assert (=> b!460381 (=> (not res!275280) (not e!268587))))

(assert (=> b!460381 (= res!275280 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!20236 () Bool)

(declare-fun mapRes!20236 () Bool)

(assert (=> mapIsEmpty!20236 mapRes!20236))

(declare-fun b!460382 () Bool)

(declare-fun e!268586 () Bool)

(assert (=> b!460382 (= e!268586 tp_is_empty!12391)))

(declare-fun b!460384 () Bool)

(declare-fun e!268581 () Bool)

(assert (=> b!460384 (= e!268581 true)))

(declare-fun lt!208520 () tuple2!8158)

(declare-fun lt!208521 () ListLongMap!7073)

(assert (=> b!460384 (= lt!208521 (+!1628 (+!1628 lt!208517 lt!208520) lt!208519))))

(declare-fun lt!208511 () V!17627)

(declare-fun lt!208516 () Unit!13392)

(declare-fun addCommutativeForDiffKeys!425 (ListLongMap!7073 (_ BitVec 64) V!17627 (_ BitVec 64) V!17627) Unit!13392)

(assert (=> b!460384 (= lt!208516 (addCommutativeForDiffKeys!425 lt!208517 k0!794 v!412 (select (arr!13728 _keys!709) from!863) lt!208511))))

(declare-fun b!460385 () Bool)

(declare-fun res!275282 () Bool)

(assert (=> b!460385 (=> (not res!275282) (not e!268587))))

(assert (=> b!460385 (= res!275282 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8221))))

(declare-fun res!275276 () Bool)

(assert (=> start!41170 (=> (not res!275276) (not e!268587))))

(assert (=> start!41170 (= res!275276 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14080 _keys!709))))))

(assert (=> start!41170 e!268587))

(assert (=> start!41170 tp_is_empty!12391))

(assert (=> start!41170 tp!38994))

(assert (=> start!41170 true))

(declare-fun e!268582 () Bool)

(declare-fun array_inv!10012 (array!28578) Bool)

(assert (=> start!41170 (and (array_inv!10012 _values!549) e!268582)))

(declare-fun array_inv!10013 (array!28576) Bool)

(assert (=> start!41170 (array_inv!10013 _keys!709)))

(declare-fun b!460383 () Bool)

(declare-fun res!275284 () Bool)

(assert (=> b!460383 (=> (not res!275284) (not e!268587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460383 (= res!275284 (validMask!0 mask!1025))))

(declare-fun b!460386 () Bool)

(assert (=> b!460386 (= e!268587 e!268589)))

(declare-fun res!275283 () Bool)

(assert (=> b!460386 (=> (not res!275283) (not e!268589))))

(assert (=> b!460386 (= res!275283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208514 mask!1025))))

(assert (=> b!460386 (= lt!208514 (array!28577 (store (arr!13728 _keys!709) i!563 k0!794) (size!14080 _keys!709)))))

(declare-fun b!460387 () Bool)

(declare-fun res!275285 () Bool)

(assert (=> b!460387 (=> (not res!275285) (not e!268587))))

(declare-fun arrayContainsKey!0 (array!28576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460387 (= res!275285 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460388 () Bool)

(assert (=> b!460388 (= e!268584 e!268581)))

(declare-fun res!275287 () Bool)

(assert (=> b!460388 (=> res!275287 e!268581)))

(assert (=> b!460388 (= res!275287 (= k0!794 (select (arr!13728 _keys!709) from!863)))))

(assert (=> b!460388 (not (= (select (arr!13728 _keys!709) from!863) k0!794))))

(declare-fun lt!208509 () Unit!13392)

(assert (=> b!460388 (= lt!208509 e!268585)))

(declare-fun c!56501 () Bool)

(assert (=> b!460388 (= c!56501 (= (select (arr!13728 _keys!709) from!863) k0!794))))

(assert (=> b!460388 (= lt!208518 lt!208521)))

(assert (=> b!460388 (= lt!208521 (+!1628 lt!208512 lt!208520))))

(assert (=> b!460388 (= lt!208520 (tuple2!8159 (select (arr!13728 _keys!709) from!863) lt!208511))))

(declare-fun get!6782 (ValueCell!5852 V!17627) V!17627)

(declare-fun dynLambda!904 (Int (_ BitVec 64)) V!17627)

(assert (=> b!460388 (= lt!208511 (get!6782 (select (arr!13729 _values!549) from!863) (dynLambda!904 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460389 () Bool)

(declare-fun res!275288 () Bool)

(assert (=> b!460389 (=> (not res!275288) (not e!268587))))

(assert (=> b!460389 (= res!275288 (and (= (size!14081 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14080 _keys!709) (size!14081 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460390 () Bool)

(assert (=> b!460390 (= e!268582 (and e!268586 mapRes!20236))))

(declare-fun condMapEmpty!20236 () Bool)

(declare-fun mapDefault!20236 () ValueCell!5852)

(assert (=> b!460390 (= condMapEmpty!20236 (= (arr!13729 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5852)) mapDefault!20236)))))

(declare-fun mapNonEmpty!20236 () Bool)

(declare-fun tp!38995 () Bool)

(assert (=> mapNonEmpty!20236 (= mapRes!20236 (and tp!38995 e!268588))))

(declare-fun mapRest!20236 () (Array (_ BitVec 32) ValueCell!5852))

(declare-fun mapValue!20236 () ValueCell!5852)

(declare-fun mapKey!20236 () (_ BitVec 32))

(assert (=> mapNonEmpty!20236 (= (arr!13729 _values!549) (store mapRest!20236 mapKey!20236 mapValue!20236))))

(declare-fun b!460391 () Bool)

(declare-fun Unit!13395 () Unit!13392)

(assert (=> b!460391 (= e!268585 Unit!13395)))

(assert (= (and start!41170 res!275276) b!460383))

(assert (= (and b!460383 res!275284) b!460389))

(assert (= (and b!460389 res!275288) b!460378))

(assert (= (and b!460378 res!275279) b!460385))

(assert (= (and b!460385 res!275282) b!460376))

(assert (= (and b!460376 res!275286) b!460381))

(assert (= (and b!460381 res!275280) b!460379))

(assert (= (and b!460379 res!275289) b!460387))

(assert (= (and b!460387 res!275285) b!460386))

(assert (= (and b!460386 res!275283) b!460377))

(assert (= (and b!460377 res!275281) b!460375))

(assert (= (and b!460375 res!275278) b!460374))

(assert (= (and b!460374 res!275275) b!460373))

(assert (= (and b!460373 (not res!275277)) b!460388))

(assert (= (and b!460388 c!56501) b!460380))

(assert (= (and b!460388 (not c!56501)) b!460391))

(assert (= (and b!460388 (not res!275287)) b!460384))

(assert (= (and b!460390 condMapEmpty!20236) mapIsEmpty!20236))

(assert (= (and b!460390 (not condMapEmpty!20236)) mapNonEmpty!20236))

(get-info :version)

(assert (= (and mapNonEmpty!20236 ((_ is ValueCellFull!5852) mapValue!20236)) b!460372))

(assert (= (and b!460390 ((_ is ValueCellFull!5852) mapDefault!20236)) b!460382))

(assert (= start!41170 b!460390))

(declare-fun b_lambda!9901 () Bool)

(assert (=> (not b_lambda!9901) (not b!460388)))

(declare-fun t!14146 () Bool)

(declare-fun tb!3881 () Bool)

(assert (=> (and start!41170 (= defaultEntry!557 defaultEntry!557) t!14146) tb!3881))

(declare-fun result!7315 () Bool)

(assert (=> tb!3881 (= result!7315 tp_is_empty!12391)))

(assert (=> b!460388 t!14146))

(declare-fun b_and!19357 () Bool)

(assert (= b_and!19355 (and (=> t!14146 result!7315) b_and!19357)))

(declare-fun m!443807 () Bool)

(assert (=> b!460373 m!443807))

(declare-fun m!443809 () Bool)

(assert (=> b!460373 m!443809))

(declare-fun m!443811 () Bool)

(assert (=> b!460373 m!443811))

(assert (=> b!460373 m!443807))

(declare-fun m!443813 () Bool)

(assert (=> b!460373 m!443813))

(declare-fun m!443815 () Bool)

(assert (=> b!460373 m!443815))

(declare-fun m!443817 () Bool)

(assert (=> b!460373 m!443817))

(declare-fun m!443819 () Bool)

(assert (=> mapNonEmpty!20236 m!443819))

(declare-fun m!443821 () Bool)

(assert (=> b!460380 m!443821))

(declare-fun m!443823 () Bool)

(assert (=> b!460383 m!443823))

(declare-fun m!443825 () Bool)

(assert (=> b!460381 m!443825))

(declare-fun m!443827 () Bool)

(assert (=> start!41170 m!443827))

(declare-fun m!443829 () Bool)

(assert (=> start!41170 m!443829))

(declare-fun m!443831 () Bool)

(assert (=> b!460386 m!443831))

(declare-fun m!443833 () Bool)

(assert (=> b!460386 m!443833))

(declare-fun m!443835 () Bool)

(assert (=> b!460378 m!443835))

(declare-fun m!443837 () Bool)

(assert (=> b!460384 m!443837))

(assert (=> b!460384 m!443837))

(declare-fun m!443839 () Bool)

(assert (=> b!460384 m!443839))

(assert (=> b!460384 m!443807))

(assert (=> b!460384 m!443807))

(declare-fun m!443841 () Bool)

(assert (=> b!460384 m!443841))

(declare-fun m!443843 () Bool)

(assert (=> b!460377 m!443843))

(assert (=> b!460388 m!443807))

(declare-fun m!443845 () Bool)

(assert (=> b!460388 m!443845))

(declare-fun m!443847 () Bool)

(assert (=> b!460388 m!443847))

(declare-fun m!443849 () Bool)

(assert (=> b!460388 m!443849))

(assert (=> b!460388 m!443849))

(assert (=> b!460388 m!443847))

(declare-fun m!443851 () Bool)

(assert (=> b!460388 m!443851))

(declare-fun m!443853 () Bool)

(assert (=> b!460387 m!443853))

(declare-fun m!443855 () Bool)

(assert (=> b!460379 m!443855))

(declare-fun m!443857 () Bool)

(assert (=> b!460374 m!443857))

(declare-fun m!443859 () Bool)

(assert (=> b!460374 m!443859))

(declare-fun m!443861 () Bool)

(assert (=> b!460374 m!443861))

(declare-fun m!443863 () Bool)

(assert (=> b!460385 m!443863))

(check-sat (not mapNonEmpty!20236) (not b!460373) (not b_lambda!9901) (not b!460380) (not b!460387) (not b!460374) (not b!460385) (not b_next!11053) (not b!460386) tp_is_empty!12391 (not b!460384) (not b!460388) (not start!41170) b_and!19357 (not b!460377) (not b!460383) (not b!460378) (not b!460381))
(check-sat b_and!19357 (not b_next!11053))
