; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43448 () Bool)

(assert start!43448)

(declare-fun b_free!12241 () Bool)

(declare-fun b_next!12241 () Bool)

(assert (=> start!43448 (= b_free!12241 (not b_next!12241))))

(declare-fun tp!43005 () Bool)

(declare-fun b_and!21011 () Bool)

(assert (=> start!43448 (= tp!43005 b_and!21011)))

(declare-fun b!481390 () Bool)

(declare-fun res!287024 () Bool)

(declare-fun e!283239 () Bool)

(assert (=> b!481390 (=> (not res!287024) (not e!283239))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31156 0))(
  ( (array!31157 (arr!14980 (Array (_ BitVec 32) (_ BitVec 64))) (size!15338 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31156)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19409 0))(
  ( (V!19410 (val!6924 Int)) )
))
(declare-datatypes ((ValueCell!6515 0))(
  ( (ValueCellFull!6515 (v!9218 V!19409)) (EmptyCell!6515) )
))
(declare-datatypes ((array!31158 0))(
  ( (array!31159 (arr!14981 (Array (_ BitVec 32) ValueCell!6515)) (size!15339 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31158)

(assert (=> b!481390 (= res!287024 (and (= (size!15339 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15338 _keys!1874) (size!15339 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22339 () Bool)

(declare-fun mapRes!22339 () Bool)

(assert (=> mapIsEmpty!22339 mapRes!22339))

(declare-fun b!481391 () Bool)

(declare-fun res!287026 () Bool)

(assert (=> b!481391 (=> (not res!287026) (not e!283239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31156 (_ BitVec 32)) Bool)

(assert (=> b!481391 (= res!287026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481392 () Bool)

(declare-fun e!283238 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(assert (=> b!481392 (= e!283238 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22339 () Bool)

(declare-fun tp!43006 () Bool)

(declare-fun e!283241 () Bool)

(assert (=> mapNonEmpty!22339 (= mapRes!22339 (and tp!43006 e!283241))))

(declare-fun mapValue!22339 () ValueCell!6515)

(declare-fun mapRest!22339 () (Array (_ BitVec 32) ValueCell!6515))

(declare-fun mapKey!22339 () (_ BitVec 32))

(assert (=> mapNonEmpty!22339 (= (arr!14981 _values!1516) (store mapRest!22339 mapKey!22339 mapValue!22339))))

(declare-fun b!481393 () Bool)

(declare-fun res!287023 () Bool)

(assert (=> b!481393 (=> (not res!287023) (not e!283239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481393 (= res!287023 (validKeyInArray!0 k0!1332))))

(declare-fun b!481394 () Bool)

(assert (=> b!481394 (= e!283239 (not true))))

(declare-fun lt!218544 () (_ BitVec 32))

(assert (=> b!481394 (arrayForallSeekEntryOrOpenFound!0 lt!218544 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14087 0))(
  ( (Unit!14088) )
))
(declare-fun lt!218545 () Unit!14087)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14087)

(assert (=> b!481394 (= lt!218545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218544))))

(declare-fun arrayScanForKey!0 (array!31156 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481394 (= lt!218544 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481394 e!283238))

(declare-fun c!57888 () Bool)

(assert (=> b!481394 (= c!57888 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218543 () Unit!14087)

(declare-fun minValue!1458 () V!19409)

(declare-fun zeroValue!1458 () V!19409)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!135 (array!31156 array!31158 (_ BitVec 32) (_ BitVec 32) V!19409 V!19409 (_ BitVec 64) Int) Unit!14087)

(assert (=> b!481394 (= lt!218543 (lemmaKeyInListMapIsInArray!135 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481395 () Bool)

(declare-fun arrayContainsKey!0 (array!31156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481395 (= e!283238 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481396 () Bool)

(declare-fun tp_is_empty!13753 () Bool)

(assert (=> b!481396 (= e!283241 tp_is_empty!13753)))

(declare-fun b!481397 () Bool)

(declare-fun e!283237 () Bool)

(declare-fun e!283242 () Bool)

(assert (=> b!481397 (= e!283237 (and e!283242 mapRes!22339))))

(declare-fun condMapEmpty!22339 () Bool)

(declare-fun mapDefault!22339 () ValueCell!6515)

(assert (=> b!481397 (= condMapEmpty!22339 (= (arr!14981 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6515)) mapDefault!22339)))))

(declare-fun res!287027 () Bool)

(assert (=> start!43448 (=> (not res!287027) (not e!283239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43448 (= res!287027 (validMask!0 mask!2352))))

(assert (=> start!43448 e!283239))

(assert (=> start!43448 true))

(assert (=> start!43448 tp_is_empty!13753))

(declare-fun array_inv!10876 (array!31158) Bool)

(assert (=> start!43448 (and (array_inv!10876 _values!1516) e!283237)))

(assert (=> start!43448 tp!43005))

(declare-fun array_inv!10877 (array!31156) Bool)

(assert (=> start!43448 (array_inv!10877 _keys!1874)))

(declare-fun b!481389 () Bool)

(declare-fun res!287028 () Bool)

(assert (=> b!481389 (=> (not res!287028) (not e!283239))))

(declare-datatypes ((List!9070 0))(
  ( (Nil!9067) (Cons!9066 (h!9922 (_ BitVec 64)) (t!15276 List!9070)) )
))
(declare-fun arrayNoDuplicates!0 (array!31156 (_ BitVec 32) List!9070) Bool)

(assert (=> b!481389 (= res!287028 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9067))))

(declare-fun b!481398 () Bool)

(assert (=> b!481398 (= e!283242 tp_is_empty!13753)))

(declare-fun b!481399 () Bool)

(declare-fun res!287025 () Bool)

(assert (=> b!481399 (=> (not res!287025) (not e!283239))))

(declare-datatypes ((tuple2!9002 0))(
  ( (tuple2!9003 (_1!4512 (_ BitVec 64)) (_2!4512 V!19409)) )
))
(declare-datatypes ((List!9071 0))(
  ( (Nil!9068) (Cons!9067 (h!9923 tuple2!9002) (t!15277 List!9071)) )
))
(declare-datatypes ((ListLongMap!7917 0))(
  ( (ListLongMap!7918 (toList!3974 List!9071)) )
))
(declare-fun contains!2606 (ListLongMap!7917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2288 (array!31156 array!31158 (_ BitVec 32) (_ BitVec 32) V!19409 V!19409 (_ BitVec 32) Int) ListLongMap!7917)

(assert (=> b!481399 (= res!287025 (contains!2606 (getCurrentListMap!2288 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43448 res!287027) b!481390))

(assert (= (and b!481390 res!287024) b!481391))

(assert (= (and b!481391 res!287026) b!481389))

(assert (= (and b!481389 res!287028) b!481399))

(assert (= (and b!481399 res!287025) b!481393))

(assert (= (and b!481393 res!287023) b!481394))

(assert (= (and b!481394 c!57888) b!481395))

(assert (= (and b!481394 (not c!57888)) b!481392))

(assert (= (and b!481397 condMapEmpty!22339) mapIsEmpty!22339))

(assert (= (and b!481397 (not condMapEmpty!22339)) mapNonEmpty!22339))

(get-info :version)

(assert (= (and mapNonEmpty!22339 ((_ is ValueCellFull!6515) mapValue!22339)) b!481396))

(assert (= (and b!481397 ((_ is ValueCellFull!6515) mapDefault!22339)) b!481398))

(assert (= start!43448 b!481397))

(declare-fun m!463081 () Bool)

(assert (=> b!481395 m!463081))

(declare-fun m!463083 () Bool)

(assert (=> b!481394 m!463083))

(declare-fun m!463085 () Bool)

(assert (=> b!481394 m!463085))

(declare-fun m!463087 () Bool)

(assert (=> b!481394 m!463087))

(declare-fun m!463089 () Bool)

(assert (=> b!481394 m!463089))

(declare-fun m!463091 () Bool)

(assert (=> b!481389 m!463091))

(declare-fun m!463093 () Bool)

(assert (=> b!481391 m!463093))

(declare-fun m!463095 () Bool)

(assert (=> b!481399 m!463095))

(assert (=> b!481399 m!463095))

(declare-fun m!463097 () Bool)

(assert (=> b!481399 m!463097))

(declare-fun m!463099 () Bool)

(assert (=> mapNonEmpty!22339 m!463099))

(declare-fun m!463101 () Bool)

(assert (=> b!481393 m!463101))

(declare-fun m!463103 () Bool)

(assert (=> start!43448 m!463103))

(declare-fun m!463105 () Bool)

(assert (=> start!43448 m!463105))

(declare-fun m!463107 () Bool)

(assert (=> start!43448 m!463107))

(check-sat b_and!21011 (not b!481391) (not start!43448) (not b!481395) (not b_next!12241) (not b!481389) (not mapNonEmpty!22339) (not b!481393) tp_is_empty!13753 (not b!481394) (not b!481399))
(check-sat b_and!21011 (not b_next!12241))
