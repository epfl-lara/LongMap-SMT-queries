; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43476 () Bool)

(assert start!43476)

(declare-fun b_free!12255 () Bool)

(declare-fun b_next!12255 () Bool)

(assert (=> start!43476 (= b_free!12255 (not b_next!12255))))

(declare-fun tp!43047 () Bool)

(declare-fun b_and!21015 () Bool)

(assert (=> start!43476 (= tp!43047 b_and!21015)))

(declare-fun b!481681 () Bool)

(declare-fun e!283405 () Bool)

(declare-fun e!283407 () Bool)

(declare-fun mapRes!22360 () Bool)

(assert (=> b!481681 (= e!283405 (and e!283407 mapRes!22360))))

(declare-fun condMapEmpty!22360 () Bool)

(declare-datatypes ((V!19427 0))(
  ( (V!19428 (val!6931 Int)) )
))
(declare-datatypes ((ValueCell!6522 0))(
  ( (ValueCellFull!6522 (v!9224 V!19427)) (EmptyCell!6522) )
))
(declare-datatypes ((array!31197 0))(
  ( (array!31198 (arr!15001 (Array (_ BitVec 32) ValueCell!6522)) (size!15359 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31197)

(declare-fun mapDefault!22360 () ValueCell!6522)

(assert (=> b!481681 (= condMapEmpty!22360 (= (arr!15001 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6522)) mapDefault!22360)))))

(declare-fun b!481682 () Bool)

(declare-fun res!287158 () Bool)

(declare-fun e!283406 () Bool)

(assert (=> b!481682 (=> (not res!287158) (not e!283406))))

(declare-datatypes ((array!31199 0))(
  ( (array!31200 (arr!15002 (Array (_ BitVec 32) (_ BitVec 64))) (size!15360 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31199)

(declare-datatypes ((List!9174 0))(
  ( (Nil!9171) (Cons!9170 (h!10026 (_ BitVec 64)) (t!15388 List!9174)) )
))
(declare-fun arrayNoDuplicates!0 (array!31199 (_ BitVec 32) List!9174) Bool)

(assert (=> b!481682 (= res!287158 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9171))))

(declare-fun b!481683 () Bool)

(declare-fun res!287161 () Bool)

(assert (=> b!481683 (=> (not res!287161) (not e!283406))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481683 (= res!287161 (validKeyInArray!0 k0!1332))))

(declare-fun b!481684 () Bool)

(declare-fun e!283402 () Bool)

(declare-fun arrayContainsKey!0 (array!31199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481684 (= e!283402 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481685 () Bool)

(declare-fun res!287156 () Bool)

(assert (=> b!481685 (=> (not res!287156) (not e!283406))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481685 (= res!287156 (and (= (size!15359 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15360 _keys!1874) (size!15359 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481686 () Bool)

(declare-fun res!287160 () Bool)

(assert (=> b!481686 (=> (not res!287160) (not e!283406))))

(declare-fun minValue!1458 () V!19427)

(declare-fun zeroValue!1458 () V!19427)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9096 0))(
  ( (tuple2!9097 (_1!4559 (_ BitVec 64)) (_2!4559 V!19427)) )
))
(declare-datatypes ((List!9175 0))(
  ( (Nil!9172) (Cons!9171 (h!10027 tuple2!9096) (t!15389 List!9175)) )
))
(declare-datatypes ((ListLongMap!8009 0))(
  ( (ListLongMap!8010 (toList!4020 List!9175)) )
))
(declare-fun contains!2634 (ListLongMap!8009 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2339 (array!31199 array!31197 (_ BitVec 32) (_ BitVec 32) V!19427 V!19427 (_ BitVec 32) Int) ListLongMap!8009)

(assert (=> b!481686 (= res!287160 (contains!2634 (getCurrentListMap!2339 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481687 () Bool)

(declare-fun tp_is_empty!13767 () Bool)

(assert (=> b!481687 (= e!283407 tp_is_empty!13767)))

(declare-fun b!481688 () Bool)

(declare-fun res!287159 () Bool)

(assert (=> b!481688 (=> (not res!287159) (not e!283406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31199 (_ BitVec 32)) Bool)

(assert (=> b!481688 (= res!287159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481689 () Bool)

(assert (=> b!481689 (= e!283402 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22360 () Bool)

(declare-fun tp!43048 () Bool)

(declare-fun e!283404 () Bool)

(assert (=> mapNonEmpty!22360 (= mapRes!22360 (and tp!43048 e!283404))))

(declare-fun mapRest!22360 () (Array (_ BitVec 32) ValueCell!6522))

(declare-fun mapKey!22360 () (_ BitVec 32))

(declare-fun mapValue!22360 () ValueCell!6522)

(assert (=> mapNonEmpty!22360 (= (arr!15001 _values!1516) (store mapRest!22360 mapKey!22360 mapValue!22360))))

(declare-fun b!481690 () Bool)

(assert (=> b!481690 (= e!283406 (not true))))

(declare-fun lt!218594 () (_ BitVec 32))

(assert (=> b!481690 (arrayForallSeekEntryOrOpenFound!0 lt!218594 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14132 0))(
  ( (Unit!14133) )
))
(declare-fun lt!218595 () Unit!14132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14132)

(assert (=> b!481690 (= lt!218595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218594))))

(declare-fun arrayScanForKey!0 (array!31199 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481690 (= lt!218594 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481690 e!283402))

(declare-fun c!57936 () Bool)

(assert (=> b!481690 (= c!57936 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218596 () Unit!14132)

(declare-fun lemmaKeyInListMapIsInArray!137 (array!31199 array!31197 (_ BitVec 32) (_ BitVec 32) V!19427 V!19427 (_ BitVec 64) Int) Unit!14132)

(assert (=> b!481690 (= lt!218596 (lemmaKeyInListMapIsInArray!137 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481691 () Bool)

(assert (=> b!481691 (= e!283404 tp_is_empty!13767)))

(declare-fun mapIsEmpty!22360 () Bool)

(assert (=> mapIsEmpty!22360 mapRes!22360))

(declare-fun res!287157 () Bool)

(assert (=> start!43476 (=> (not res!287157) (not e!283406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43476 (= res!287157 (validMask!0 mask!2352))))

(assert (=> start!43476 e!283406))

(assert (=> start!43476 true))

(assert (=> start!43476 tp_is_empty!13767))

(declare-fun array_inv!10818 (array!31197) Bool)

(assert (=> start!43476 (and (array_inv!10818 _values!1516) e!283405)))

(assert (=> start!43476 tp!43047))

(declare-fun array_inv!10819 (array!31199) Bool)

(assert (=> start!43476 (array_inv!10819 _keys!1874)))

(assert (= (and start!43476 res!287157) b!481685))

(assert (= (and b!481685 res!287156) b!481688))

(assert (= (and b!481688 res!287159) b!481682))

(assert (= (and b!481682 res!287158) b!481686))

(assert (= (and b!481686 res!287160) b!481683))

(assert (= (and b!481683 res!287161) b!481690))

(assert (= (and b!481690 c!57936) b!481684))

(assert (= (and b!481690 (not c!57936)) b!481689))

(assert (= (and b!481681 condMapEmpty!22360) mapIsEmpty!22360))

(assert (= (and b!481681 (not condMapEmpty!22360)) mapNonEmpty!22360))

(get-info :version)

(assert (= (and mapNonEmpty!22360 ((_ is ValueCellFull!6522) mapValue!22360)) b!481691))

(assert (= (and b!481681 ((_ is ValueCellFull!6522) mapDefault!22360)) b!481687))

(assert (= start!43476 b!481681))

(declare-fun m!463095 () Bool)

(assert (=> start!43476 m!463095))

(declare-fun m!463097 () Bool)

(assert (=> start!43476 m!463097))

(declare-fun m!463099 () Bool)

(assert (=> start!43476 m!463099))

(declare-fun m!463101 () Bool)

(assert (=> b!481688 m!463101))

(declare-fun m!463103 () Bool)

(assert (=> b!481683 m!463103))

(declare-fun m!463105 () Bool)

(assert (=> b!481682 m!463105))

(declare-fun m!463107 () Bool)

(assert (=> mapNonEmpty!22360 m!463107))

(declare-fun m!463109 () Bool)

(assert (=> b!481686 m!463109))

(assert (=> b!481686 m!463109))

(declare-fun m!463111 () Bool)

(assert (=> b!481686 m!463111))

(declare-fun m!463113 () Bool)

(assert (=> b!481684 m!463113))

(declare-fun m!463115 () Bool)

(assert (=> b!481690 m!463115))

(declare-fun m!463117 () Bool)

(assert (=> b!481690 m!463117))

(declare-fun m!463119 () Bool)

(assert (=> b!481690 m!463119))

(declare-fun m!463121 () Bool)

(assert (=> b!481690 m!463121))

(check-sat (not b!481683) (not b!481682) b_and!21015 (not b!481688) tp_is_empty!13767 (not b_next!12255) (not b!481690) (not b!481684) (not b!481686) (not start!43476) (not mapNonEmpty!22360))
(check-sat b_and!21015 (not b_next!12255))
