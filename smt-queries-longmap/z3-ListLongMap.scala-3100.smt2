; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43526 () Bool)

(assert start!43526)

(declare-fun b_free!12319 () Bool)

(declare-fun b_next!12319 () Bool)

(assert (=> start!43526 (= b_free!12319 (not b_next!12319))))

(declare-fun tp!43240 () Bool)

(declare-fun b_and!21053 () Bool)

(assert (=> start!43526 (= tp!43240 b_and!21053)))

(declare-fun mapNonEmpty!22456 () Bool)

(declare-fun mapRes!22456 () Bool)

(declare-fun tp!43239 () Bool)

(declare-fun e!283727 () Bool)

(assert (=> mapNonEmpty!22456 (= mapRes!22456 (and tp!43239 e!283727))))

(declare-datatypes ((V!19513 0))(
  ( (V!19514 (val!6963 Int)) )
))
(declare-datatypes ((ValueCell!6554 0))(
  ( (ValueCellFull!6554 (v!9250 V!19513)) (EmptyCell!6554) )
))
(declare-fun mapValue!22456 () ValueCell!6554)

(declare-fun mapRest!22456 () (Array (_ BitVec 32) ValueCell!6554))

(declare-datatypes ((array!31313 0))(
  ( (array!31314 (arr!15059 (Array (_ BitVec 32) ValueCell!6554)) (size!15418 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31313)

(declare-fun mapKey!22456 () (_ BitVec 32))

(assert (=> mapNonEmpty!22456 (= (arr!15059 _values!1516) (store mapRest!22456 mapKey!22456 mapValue!22456))))

(declare-fun mapIsEmpty!22456 () Bool)

(assert (=> mapIsEmpty!22456 mapRes!22456))

(declare-fun b!482142 () Bool)

(declare-fun e!283724 () Bool)

(declare-fun e!283726 () Bool)

(assert (=> b!482142 (= e!283724 (and e!283726 mapRes!22456))))

(declare-fun condMapEmpty!22456 () Bool)

(declare-fun mapDefault!22456 () ValueCell!6554)

(assert (=> b!482142 (= condMapEmpty!22456 (= (arr!15059 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6554)) mapDefault!22456)))))

(declare-fun b!482143 () Bool)

(declare-fun tp_is_empty!13831 () Bool)

(assert (=> b!482143 (= e!283727 tp_is_empty!13831)))

(declare-fun b!482145 () Bool)

(declare-fun res!287446 () Bool)

(declare-fun e!283725 () Bool)

(assert (=> b!482145 (=> (not res!287446) (not e!283725))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31315 0))(
  ( (array!31316 (arr!15060 (Array (_ BitVec 32) (_ BitVec 64))) (size!15419 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31315)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482145 (= res!287446 (and (= (size!15418 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15419 _keys!1874) (size!15418 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482146 () Bool)

(assert (=> b!482146 (= e!283725 (not true))))

(declare-fun lt!218484 () (_ BitVec 32))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31315 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482146 (= lt!218484 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283728 () Bool)

(assert (=> b!482146 e!283728))

(declare-fun c!57880 () Bool)

(assert (=> b!482146 (= c!57880 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14122 0))(
  ( (Unit!14123) )
))
(declare-fun lt!218485 () Unit!14122)

(declare-fun minValue!1458 () V!19513)

(declare-fun zeroValue!1458 () V!19513)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!148 (array!31315 array!31313 (_ BitVec 32) (_ BitVec 32) V!19513 V!19513 (_ BitVec 64) Int) Unit!14122)

(assert (=> b!482146 (= lt!218485 (lemmaKeyInListMapIsInArray!148 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482147 () Bool)

(declare-fun res!287445 () Bool)

(assert (=> b!482147 (=> (not res!287445) (not e!283725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31315 (_ BitVec 32)) Bool)

(assert (=> b!482147 (= res!287445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482148 () Bool)

(declare-fun res!287441 () Bool)

(assert (=> b!482148 (=> (not res!287441) (not e!283725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482148 (= res!287441 (validKeyInArray!0 k0!1332))))

(declare-fun b!482149 () Bool)

(assert (=> b!482149 (= e!283726 tp_is_empty!13831)))

(declare-fun b!482150 () Bool)

(declare-fun res!287443 () Bool)

(assert (=> b!482150 (=> (not res!287443) (not e!283725))))

(declare-datatypes ((List!9256 0))(
  ( (Nil!9253) (Cons!9252 (h!10108 (_ BitVec 64)) (t!15461 List!9256)) )
))
(declare-fun arrayNoDuplicates!0 (array!31315 (_ BitVec 32) List!9256) Bool)

(assert (=> b!482150 (= res!287443 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9253))))

(declare-fun res!287444 () Bool)

(assert (=> start!43526 (=> (not res!287444) (not e!283725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43526 (= res!287444 (validMask!0 mask!2352))))

(assert (=> start!43526 e!283725))

(assert (=> start!43526 true))

(assert (=> start!43526 tp_is_empty!13831))

(declare-fun array_inv!10954 (array!31313) Bool)

(assert (=> start!43526 (and (array_inv!10954 _values!1516) e!283724)))

(assert (=> start!43526 tp!43240))

(declare-fun array_inv!10955 (array!31315) Bool)

(assert (=> start!43526 (array_inv!10955 _keys!1874)))

(declare-fun b!482144 () Bool)

(declare-fun arrayContainsKey!0 (array!31315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482144 (= e!283728 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482151 () Bool)

(assert (=> b!482151 (= e!283728 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482152 () Bool)

(declare-fun res!287442 () Bool)

(assert (=> b!482152 (=> (not res!287442) (not e!283725))))

(declare-datatypes ((tuple2!9190 0))(
  ( (tuple2!9191 (_1!4606 (_ BitVec 64)) (_2!4606 V!19513)) )
))
(declare-datatypes ((List!9257 0))(
  ( (Nil!9254) (Cons!9253 (h!10109 tuple2!9190) (t!15462 List!9257)) )
))
(declare-datatypes ((ListLongMap!8093 0))(
  ( (ListLongMap!8094 (toList!4062 List!9257)) )
))
(declare-fun contains!2641 (ListLongMap!8093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2315 (array!31315 array!31313 (_ BitVec 32) (_ BitVec 32) V!19513 V!19513 (_ BitVec 32) Int) ListLongMap!8093)

(assert (=> b!482152 (= res!287442 (contains!2641 (getCurrentListMap!2315 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43526 res!287444) b!482145))

(assert (= (and b!482145 res!287446) b!482147))

(assert (= (and b!482147 res!287445) b!482150))

(assert (= (and b!482150 res!287443) b!482152))

(assert (= (and b!482152 res!287442) b!482148))

(assert (= (and b!482148 res!287441) b!482146))

(assert (= (and b!482146 c!57880) b!482144))

(assert (= (and b!482146 (not c!57880)) b!482151))

(assert (= (and b!482142 condMapEmpty!22456) mapIsEmpty!22456))

(assert (= (and b!482142 (not condMapEmpty!22456)) mapNonEmpty!22456))

(get-info :version)

(assert (= (and mapNonEmpty!22456 ((_ is ValueCellFull!6554) mapValue!22456)) b!482143))

(assert (= (and b!482142 ((_ is ValueCellFull!6554) mapDefault!22456)) b!482149))

(assert (= start!43526 b!482142))

(declare-fun m!462933 () Bool)

(assert (=> mapNonEmpty!22456 m!462933))

(declare-fun m!462935 () Bool)

(assert (=> b!482152 m!462935))

(assert (=> b!482152 m!462935))

(declare-fun m!462937 () Bool)

(assert (=> b!482152 m!462937))

(declare-fun m!462939 () Bool)

(assert (=> start!43526 m!462939))

(declare-fun m!462941 () Bool)

(assert (=> start!43526 m!462941))

(declare-fun m!462943 () Bool)

(assert (=> start!43526 m!462943))

(declare-fun m!462945 () Bool)

(assert (=> b!482148 m!462945))

(declare-fun m!462947 () Bool)

(assert (=> b!482150 m!462947))

(declare-fun m!462949 () Bool)

(assert (=> b!482147 m!462949))

(declare-fun m!462951 () Bool)

(assert (=> b!482146 m!462951))

(declare-fun m!462953 () Bool)

(assert (=> b!482146 m!462953))

(declare-fun m!462955 () Bool)

(assert (=> b!482144 m!462955))

(check-sat (not b_next!12319) (not b!482152) (not b!482144) (not b!482146) (not b!482147) tp_is_empty!13831 b_and!21053 (not start!43526) (not b!482148) (not b!482150) (not mapNonEmpty!22456))
(check-sat b_and!21053 (not b_next!12319))
