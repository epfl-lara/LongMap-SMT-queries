; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43466 () Bool)

(assert start!43466)

(declare-fun b_free!12259 () Bool)

(declare-fun b_next!12259 () Bool)

(assert (=> start!43466 (= b_free!12259 (not b_next!12259))))

(declare-fun tp!43059 () Bool)

(declare-fun b_and!21029 () Bool)

(assert (=> start!43466 (= tp!43059 b_and!21029)))

(declare-fun b!481686 () Bool)

(declare-fun e!283399 () Bool)

(declare-fun tp_is_empty!13771 () Bool)

(assert (=> b!481686 (= e!283399 tp_is_empty!13771)))

(declare-fun b!481687 () Bool)

(declare-fun res!287190 () Bool)

(declare-fun e!283402 () Bool)

(assert (=> b!481687 (=> (not res!287190) (not e!283402))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31190 0))(
  ( (array!31191 (arr!14997 (Array (_ BitVec 32) (_ BitVec 64))) (size!15355 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31190)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19433 0))(
  ( (V!19434 (val!6933 Int)) )
))
(declare-datatypes ((ValueCell!6524 0))(
  ( (ValueCellFull!6524 (v!9227 V!19433)) (EmptyCell!6524) )
))
(declare-datatypes ((array!31192 0))(
  ( (array!31193 (arr!14998 (Array (_ BitVec 32) ValueCell!6524)) (size!15356 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31192)

(assert (=> b!481687 (= res!287190 (and (= (size!15356 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15355 _keys!1874) (size!15356 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481688 () Bool)

(assert (=> b!481688 (= e!283402 (not true))))

(declare-fun lt!218624 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31190 (_ BitVec 32)) Bool)

(assert (=> b!481688 (arrayForallSeekEntryOrOpenFound!0 lt!218624 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14099 0))(
  ( (Unit!14100) )
))
(declare-fun lt!218626 () Unit!14099)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14099)

(assert (=> b!481688 (= lt!218626 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218624))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31190 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481688 (= lt!218624 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283403 () Bool)

(assert (=> b!481688 e!283403))

(declare-fun c!57915 () Bool)

(assert (=> b!481688 (= c!57915 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218625 () Unit!14099)

(declare-fun minValue!1458 () V!19433)

(declare-fun zeroValue!1458 () V!19433)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!141 (array!31190 array!31192 (_ BitVec 32) (_ BitVec 32) V!19433 V!19433 (_ BitVec 64) Int) Unit!14099)

(assert (=> b!481688 (= lt!218625 (lemmaKeyInListMapIsInArray!141 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481689 () Bool)

(declare-fun e!283400 () Bool)

(declare-fun mapRes!22366 () Bool)

(assert (=> b!481689 (= e!283400 (and e!283399 mapRes!22366))))

(declare-fun condMapEmpty!22366 () Bool)

(declare-fun mapDefault!22366 () ValueCell!6524)

(assert (=> b!481689 (= condMapEmpty!22366 (= (arr!14998 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6524)) mapDefault!22366)))))

(declare-fun b!481690 () Bool)

(declare-fun res!287187 () Bool)

(assert (=> b!481690 (=> (not res!287187) (not e!283402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481690 (= res!287187 (validKeyInArray!0 k0!1332))))

(declare-fun b!481691 () Bool)

(declare-fun e!283404 () Bool)

(assert (=> b!481691 (= e!283404 tp_is_empty!13771)))

(declare-fun res!287185 () Bool)

(assert (=> start!43466 (=> (not res!287185) (not e!283402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43466 (= res!287185 (validMask!0 mask!2352))))

(assert (=> start!43466 e!283402))

(assert (=> start!43466 true))

(assert (=> start!43466 tp_is_empty!13771))

(declare-fun array_inv!10892 (array!31192) Bool)

(assert (=> start!43466 (and (array_inv!10892 _values!1516) e!283400)))

(assert (=> start!43466 tp!43059))

(declare-fun array_inv!10893 (array!31190) Bool)

(assert (=> start!43466 (array_inv!10893 _keys!1874)))

(declare-fun b!481692 () Bool)

(declare-fun res!287189 () Bool)

(assert (=> b!481692 (=> (not res!287189) (not e!283402))))

(declare-datatypes ((tuple2!9016 0))(
  ( (tuple2!9017 (_1!4519 (_ BitVec 64)) (_2!4519 V!19433)) )
))
(declare-datatypes ((List!9081 0))(
  ( (Nil!9078) (Cons!9077 (h!9933 tuple2!9016) (t!15287 List!9081)) )
))
(declare-datatypes ((ListLongMap!7931 0))(
  ( (ListLongMap!7932 (toList!3981 List!9081)) )
))
(declare-fun contains!2613 (ListLongMap!7931 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2295 (array!31190 array!31192 (_ BitVec 32) (_ BitVec 32) V!19433 V!19433 (_ BitVec 32) Int) ListLongMap!7931)

(assert (=> b!481692 (= res!287189 (contains!2613 (getCurrentListMap!2295 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481693 () Bool)

(declare-fun res!287188 () Bool)

(assert (=> b!481693 (=> (not res!287188) (not e!283402))))

(assert (=> b!481693 (= res!287188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22366 () Bool)

(declare-fun tp!43060 () Bool)

(assert (=> mapNonEmpty!22366 (= mapRes!22366 (and tp!43060 e!283404))))

(declare-fun mapRest!22366 () (Array (_ BitVec 32) ValueCell!6524))

(declare-fun mapKey!22366 () (_ BitVec 32))

(declare-fun mapValue!22366 () ValueCell!6524)

(assert (=> mapNonEmpty!22366 (= (arr!14998 _values!1516) (store mapRest!22366 mapKey!22366 mapValue!22366))))

(declare-fun b!481694 () Bool)

(declare-fun arrayContainsKey!0 (array!31190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481694 (= e!283403 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22366 () Bool)

(assert (=> mapIsEmpty!22366 mapRes!22366))

(declare-fun b!481695 () Bool)

(declare-fun res!287186 () Bool)

(assert (=> b!481695 (=> (not res!287186) (not e!283402))))

(declare-datatypes ((List!9082 0))(
  ( (Nil!9079) (Cons!9078 (h!9934 (_ BitVec 64)) (t!15288 List!9082)) )
))
(declare-fun arrayNoDuplicates!0 (array!31190 (_ BitVec 32) List!9082) Bool)

(assert (=> b!481695 (= res!287186 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9079))))

(declare-fun b!481696 () Bool)

(assert (=> b!481696 (= e!283403 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!43466 res!287185) b!481687))

(assert (= (and b!481687 res!287190) b!481693))

(assert (= (and b!481693 res!287188) b!481695))

(assert (= (and b!481695 res!287186) b!481692))

(assert (= (and b!481692 res!287189) b!481690))

(assert (= (and b!481690 res!287187) b!481688))

(assert (= (and b!481688 c!57915) b!481694))

(assert (= (and b!481688 (not c!57915)) b!481696))

(assert (= (and b!481689 condMapEmpty!22366) mapIsEmpty!22366))

(assert (= (and b!481689 (not condMapEmpty!22366)) mapNonEmpty!22366))

(get-info :version)

(assert (= (and mapNonEmpty!22366 ((_ is ValueCellFull!6524) mapValue!22366)) b!481691))

(assert (= (and b!481689 ((_ is ValueCellFull!6524) mapDefault!22366)) b!481686))

(assert (= start!43466 b!481689))

(declare-fun m!463333 () Bool)

(assert (=> b!481693 m!463333))

(declare-fun m!463335 () Bool)

(assert (=> b!481695 m!463335))

(declare-fun m!463337 () Bool)

(assert (=> b!481688 m!463337))

(declare-fun m!463339 () Bool)

(assert (=> b!481688 m!463339))

(declare-fun m!463341 () Bool)

(assert (=> b!481688 m!463341))

(declare-fun m!463343 () Bool)

(assert (=> b!481688 m!463343))

(declare-fun m!463345 () Bool)

(assert (=> b!481692 m!463345))

(assert (=> b!481692 m!463345))

(declare-fun m!463347 () Bool)

(assert (=> b!481692 m!463347))

(declare-fun m!463349 () Bool)

(assert (=> mapNonEmpty!22366 m!463349))

(declare-fun m!463351 () Bool)

(assert (=> b!481694 m!463351))

(declare-fun m!463353 () Bool)

(assert (=> b!481690 m!463353))

(declare-fun m!463355 () Bool)

(assert (=> start!43466 m!463355))

(declare-fun m!463357 () Bool)

(assert (=> start!43466 m!463357))

(declare-fun m!463359 () Bool)

(assert (=> start!43466 m!463359))

(check-sat (not b!481692) (not start!43466) (not b!481690) (not b!481693) (not b!481694) (not b!481695) (not b!481688) b_and!21029 (not b_next!12259) (not mapNonEmpty!22366) tp_is_empty!13771)
(check-sat b_and!21029 (not b_next!12259))
