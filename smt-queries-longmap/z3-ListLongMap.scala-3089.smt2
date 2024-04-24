; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43460 () Bool)

(assert start!43460)

(declare-fun b_free!12253 () Bool)

(declare-fun b_next!12253 () Bool)

(assert (=> start!43460 (= b_free!12253 (not b_next!12253))))

(declare-fun tp!43041 () Bool)

(declare-fun b_and!21023 () Bool)

(assert (=> start!43460 (= tp!43041 b_and!21023)))

(declare-fun res!287132 () Bool)

(declare-fun e!283346 () Bool)

(assert (=> start!43460 (=> (not res!287132) (not e!283346))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43460 (= res!287132 (validMask!0 mask!2352))))

(assert (=> start!43460 e!283346))

(assert (=> start!43460 true))

(declare-fun tp_is_empty!13765 () Bool)

(assert (=> start!43460 tp_is_empty!13765))

(declare-datatypes ((V!19425 0))(
  ( (V!19426 (val!6930 Int)) )
))
(declare-datatypes ((ValueCell!6521 0))(
  ( (ValueCellFull!6521 (v!9224 V!19425)) (EmptyCell!6521) )
))
(declare-datatypes ((array!31178 0))(
  ( (array!31179 (arr!14991 (Array (_ BitVec 32) ValueCell!6521)) (size!15349 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31178)

(declare-fun e!283348 () Bool)

(declare-fun array_inv!10886 (array!31178) Bool)

(assert (=> start!43460 (and (array_inv!10886 _values!1516) e!283348)))

(assert (=> start!43460 tp!43041))

(declare-datatypes ((array!31180 0))(
  ( (array!31181 (arr!14992 (Array (_ BitVec 32) (_ BitVec 64))) (size!15350 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31180)

(declare-fun array_inv!10887 (array!31180) Bool)

(assert (=> start!43460 (array_inv!10887 _keys!1874)))

(declare-fun b!481587 () Bool)

(assert (=> b!481587 (= e!283346 (not true))))

(declare-fun lt!218598 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31180 (_ BitVec 32)) Bool)

(assert (=> b!481587 (arrayForallSeekEntryOrOpenFound!0 lt!218598 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14095 0))(
  ( (Unit!14096) )
))
(declare-fun lt!218599 () Unit!14095)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14095)

(assert (=> b!481587 (= lt!218599 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218598))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31180 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481587 (= lt!218598 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283349 () Bool)

(assert (=> b!481587 e!283349))

(declare-fun c!57906 () Bool)

(assert (=> b!481587 (= c!57906 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19425)

(declare-fun minValue!1458 () V!19425)

(declare-fun lt!218597 () Unit!14095)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!139 (array!31180 array!31178 (_ BitVec 32) (_ BitVec 32) V!19425 V!19425 (_ BitVec 64) Int) Unit!14095)

(assert (=> b!481587 (= lt!218597 (lemmaKeyInListMapIsInArray!139 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481588 () Bool)

(declare-fun res!287133 () Bool)

(assert (=> b!481588 (=> (not res!287133) (not e!283346))))

(declare-datatypes ((tuple2!9012 0))(
  ( (tuple2!9013 (_1!4517 (_ BitVec 64)) (_2!4517 V!19425)) )
))
(declare-datatypes ((List!9077 0))(
  ( (Nil!9074) (Cons!9073 (h!9929 tuple2!9012) (t!15283 List!9077)) )
))
(declare-datatypes ((ListLongMap!7927 0))(
  ( (ListLongMap!7928 (toList!3979 List!9077)) )
))
(declare-fun contains!2611 (ListLongMap!7927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2293 (array!31180 array!31178 (_ BitVec 32) (_ BitVec 32) V!19425 V!19425 (_ BitVec 32) Int) ListLongMap!7927)

(assert (=> b!481588 (= res!287133 (contains!2611 (getCurrentListMap!2293 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481589 () Bool)

(declare-fun res!287136 () Bool)

(assert (=> b!481589 (=> (not res!287136) (not e!283346))))

(declare-datatypes ((List!9078 0))(
  ( (Nil!9075) (Cons!9074 (h!9930 (_ BitVec 64)) (t!15284 List!9078)) )
))
(declare-fun arrayNoDuplicates!0 (array!31180 (_ BitVec 32) List!9078) Bool)

(assert (=> b!481589 (= res!287136 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9075))))

(declare-fun b!481590 () Bool)

(declare-fun e!283350 () Bool)

(declare-fun mapRes!22357 () Bool)

(assert (=> b!481590 (= e!283348 (and e!283350 mapRes!22357))))

(declare-fun condMapEmpty!22357 () Bool)

(declare-fun mapDefault!22357 () ValueCell!6521)

(assert (=> b!481590 (= condMapEmpty!22357 (= (arr!14991 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6521)) mapDefault!22357)))))

(declare-fun b!481591 () Bool)

(assert (=> b!481591 (= e!283349 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481592 () Bool)

(assert (=> b!481592 (= e!283350 tp_is_empty!13765)))

(declare-fun b!481593 () Bool)

(declare-fun e!283345 () Bool)

(assert (=> b!481593 (= e!283345 tp_is_empty!13765)))

(declare-fun b!481594 () Bool)

(declare-fun res!287131 () Bool)

(assert (=> b!481594 (=> (not res!287131) (not e!283346))))

(assert (=> b!481594 (= res!287131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22357 () Bool)

(declare-fun tp!43042 () Bool)

(assert (=> mapNonEmpty!22357 (= mapRes!22357 (and tp!43042 e!283345))))

(declare-fun mapKey!22357 () (_ BitVec 32))

(declare-fun mapValue!22357 () ValueCell!6521)

(declare-fun mapRest!22357 () (Array (_ BitVec 32) ValueCell!6521))

(assert (=> mapNonEmpty!22357 (= (arr!14991 _values!1516) (store mapRest!22357 mapKey!22357 mapValue!22357))))

(declare-fun b!481595 () Bool)

(declare-fun arrayContainsKey!0 (array!31180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481595 (= e!283349 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22357 () Bool)

(assert (=> mapIsEmpty!22357 mapRes!22357))

(declare-fun b!481596 () Bool)

(declare-fun res!287135 () Bool)

(assert (=> b!481596 (=> (not res!287135) (not e!283346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481596 (= res!287135 (validKeyInArray!0 k0!1332))))

(declare-fun b!481597 () Bool)

(declare-fun res!287134 () Bool)

(assert (=> b!481597 (=> (not res!287134) (not e!283346))))

(assert (=> b!481597 (= res!287134 (and (= (size!15349 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15350 _keys!1874) (size!15349 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43460 res!287132) b!481597))

(assert (= (and b!481597 res!287134) b!481594))

(assert (= (and b!481594 res!287131) b!481589))

(assert (= (and b!481589 res!287136) b!481588))

(assert (= (and b!481588 res!287133) b!481596))

(assert (= (and b!481596 res!287135) b!481587))

(assert (= (and b!481587 c!57906) b!481595))

(assert (= (and b!481587 (not c!57906)) b!481591))

(assert (= (and b!481590 condMapEmpty!22357) mapIsEmpty!22357))

(assert (= (and b!481590 (not condMapEmpty!22357)) mapNonEmpty!22357))

(get-info :version)

(assert (= (and mapNonEmpty!22357 ((_ is ValueCellFull!6521) mapValue!22357)) b!481593))

(assert (= (and b!481590 ((_ is ValueCellFull!6521) mapDefault!22357)) b!481592))

(assert (= start!43460 b!481590))

(declare-fun m!463249 () Bool)

(assert (=> start!43460 m!463249))

(declare-fun m!463251 () Bool)

(assert (=> start!43460 m!463251))

(declare-fun m!463253 () Bool)

(assert (=> start!43460 m!463253))

(declare-fun m!463255 () Bool)

(assert (=> b!481595 m!463255))

(declare-fun m!463257 () Bool)

(assert (=> b!481594 m!463257))

(declare-fun m!463259 () Bool)

(assert (=> b!481587 m!463259))

(declare-fun m!463261 () Bool)

(assert (=> b!481587 m!463261))

(declare-fun m!463263 () Bool)

(assert (=> b!481587 m!463263))

(declare-fun m!463265 () Bool)

(assert (=> b!481587 m!463265))

(declare-fun m!463267 () Bool)

(assert (=> b!481588 m!463267))

(assert (=> b!481588 m!463267))

(declare-fun m!463269 () Bool)

(assert (=> b!481588 m!463269))

(declare-fun m!463271 () Bool)

(assert (=> b!481589 m!463271))

(declare-fun m!463273 () Bool)

(assert (=> mapNonEmpty!22357 m!463273))

(declare-fun m!463275 () Bool)

(assert (=> b!481596 m!463275))

(check-sat b_and!21023 (not b!481589) (not b!481596) tp_is_empty!13765 (not b!481595) (not b!481587) (not b!481588) (not start!43460) (not b!481594) (not mapNonEmpty!22357) (not b_next!12253))
(check-sat b_and!21023 (not b_next!12253))
