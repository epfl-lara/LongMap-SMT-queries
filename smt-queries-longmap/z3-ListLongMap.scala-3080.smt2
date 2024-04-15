; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43358 () Bool)

(assert start!43358)

(declare-fun b_free!12199 () Bool)

(declare-fun b_next!12199 () Bool)

(assert (=> start!43358 (= b_free!12199 (not b_next!12199))))

(declare-fun tp!42873 () Bool)

(declare-fun b_and!20929 () Bool)

(assert (=> start!43358 (= tp!42873 b_and!20929)))

(declare-fun b!480224 () Bool)

(declare-fun e!282552 () Bool)

(declare-datatypes ((array!31083 0))(
  ( (array!31084 (arr!14946 (Array (_ BitVec 32) (_ BitVec 64))) (size!15305 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31083)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480224 (= e!282552 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480225 () Bool)

(declare-fun e!282551 () Bool)

(declare-fun tp_is_empty!13711 () Bool)

(assert (=> b!480225 (= e!282551 tp_is_empty!13711)))

(declare-fun res!286420 () Bool)

(declare-fun e!282554 () Bool)

(assert (=> start!43358 (=> (not res!286420) (not e!282554))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43358 (= res!286420 (validMask!0 mask!2352))))

(assert (=> start!43358 e!282554))

(assert (=> start!43358 true))

(assert (=> start!43358 tp_is_empty!13711))

(declare-datatypes ((V!19353 0))(
  ( (V!19354 (val!6903 Int)) )
))
(declare-datatypes ((ValueCell!6494 0))(
  ( (ValueCellFull!6494 (v!9188 V!19353)) (EmptyCell!6494) )
))
(declare-datatypes ((array!31085 0))(
  ( (array!31086 (arr!14947 (Array (_ BitVec 32) ValueCell!6494)) (size!15306 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31085)

(declare-fun e!282553 () Bool)

(declare-fun array_inv!10870 (array!31085) Bool)

(assert (=> start!43358 (and (array_inv!10870 _values!1516) e!282553)))

(assert (=> start!43358 tp!42873))

(declare-fun array_inv!10871 (array!31083) Bool)

(assert (=> start!43358 (array_inv!10871 _keys!1874)))

(declare-fun b!480226 () Bool)

(declare-fun res!286421 () Bool)

(assert (=> b!480226 (=> (not res!286421) (not e!282554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31083 (_ BitVec 32)) Bool)

(assert (=> b!480226 (= res!286421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480227 () Bool)

(declare-fun mapRes!22270 () Bool)

(assert (=> b!480227 (= e!282553 (and e!282551 mapRes!22270))))

(declare-fun condMapEmpty!22270 () Bool)

(declare-fun mapDefault!22270 () ValueCell!6494)

(assert (=> b!480227 (= condMapEmpty!22270 (= (arr!14947 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6494)) mapDefault!22270)))))

(declare-fun b!480228 () Bool)

(declare-fun res!286418 () Bool)

(assert (=> b!480228 (=> (not res!286418) (not e!282554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480228 (= res!286418 (validKeyInArray!0 k0!1332))))

(declare-fun b!480229 () Bool)

(declare-fun e!282555 () Bool)

(assert (=> b!480229 (= e!282555 tp_is_empty!13711)))

(declare-fun b!480230 () Bool)

(declare-fun res!286422 () Bool)

(assert (=> b!480230 (=> (not res!286422) (not e!282554))))

(declare-fun minValue!1458 () V!19353)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19353)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9104 0))(
  ( (tuple2!9105 (_1!4563 (_ BitVec 64)) (_2!4563 V!19353)) )
))
(declare-datatypes ((List!9169 0))(
  ( (Nil!9166) (Cons!9165 (h!10021 tuple2!9104) (t!15370 List!9169)) )
))
(declare-datatypes ((ListLongMap!8007 0))(
  ( (ListLongMap!8008 (toList!4019 List!9169)) )
))
(declare-fun contains!2596 (ListLongMap!8007 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2272 (array!31083 array!31085 (_ BitVec 32) (_ BitVec 32) V!19353 V!19353 (_ BitVec 32) Int) ListLongMap!8007)

(assert (=> b!480230 (= res!286422 (contains!2596 (getCurrentListMap!2272 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapIsEmpty!22270 () Bool)

(assert (=> mapIsEmpty!22270 mapRes!22270))

(declare-fun b!480231 () Bool)

(declare-fun res!286419 () Bool)

(assert (=> b!480231 (=> (not res!286419) (not e!282554))))

(declare-datatypes ((List!9170 0))(
  ( (Nil!9167) (Cons!9166 (h!10022 (_ BitVec 64)) (t!15371 List!9170)) )
))
(declare-fun arrayNoDuplicates!0 (array!31083 (_ BitVec 32) List!9170) Bool)

(assert (=> b!480231 (= res!286419 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9167))))

(declare-fun mapNonEmpty!22270 () Bool)

(declare-fun tp!42874 () Bool)

(assert (=> mapNonEmpty!22270 (= mapRes!22270 (and tp!42874 e!282555))))

(declare-fun mapRest!22270 () (Array (_ BitVec 32) ValueCell!6494))

(declare-fun mapKey!22270 () (_ BitVec 32))

(declare-fun mapValue!22270 () ValueCell!6494)

(assert (=> mapNonEmpty!22270 (= (arr!14947 _values!1516) (store mapRest!22270 mapKey!22270 mapValue!22270))))

(declare-fun b!480232 () Bool)

(assert (=> b!480232 (= e!282554 (not true))))

(declare-fun lt!217927 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31083 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480232 (= lt!217927 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480232 e!282552))

(declare-fun c!57713 () Bool)

(assert (=> b!480232 (= c!57713 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14070 0))(
  ( (Unit!14071) )
))
(declare-fun lt!217926 () Unit!14070)

(declare-fun lemmaKeyInListMapIsInArray!124 (array!31083 array!31085 (_ BitVec 32) (_ BitVec 32) V!19353 V!19353 (_ BitVec 64) Int) Unit!14070)

(assert (=> b!480232 (= lt!217926 (lemmaKeyInListMapIsInArray!124 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480233 () Bool)

(assert (=> b!480233 (= e!282552 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480234 () Bool)

(declare-fun res!286417 () Bool)

(assert (=> b!480234 (=> (not res!286417) (not e!282554))))

(assert (=> b!480234 (= res!286417 (and (= (size!15306 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15305 _keys!1874) (size!15306 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43358 res!286420) b!480234))

(assert (= (and b!480234 res!286417) b!480226))

(assert (= (and b!480226 res!286421) b!480231))

(assert (= (and b!480231 res!286419) b!480230))

(assert (= (and b!480230 res!286422) b!480228))

(assert (= (and b!480228 res!286418) b!480232))

(assert (= (and b!480232 c!57713) b!480224))

(assert (= (and b!480232 (not c!57713)) b!480233))

(assert (= (and b!480227 condMapEmpty!22270) mapIsEmpty!22270))

(assert (= (and b!480227 (not condMapEmpty!22270)) mapNonEmpty!22270))

(get-info :version)

(assert (= (and mapNonEmpty!22270 ((_ is ValueCellFull!6494) mapValue!22270)) b!480229))

(assert (= (and b!480227 ((_ is ValueCellFull!6494) mapDefault!22270)) b!480225))

(assert (= start!43358 b!480227))

(declare-fun m!461397 () Bool)

(assert (=> mapNonEmpty!22270 m!461397))

(declare-fun m!461399 () Bool)

(assert (=> b!480226 m!461399))

(declare-fun m!461401 () Bool)

(assert (=> b!480230 m!461401))

(assert (=> b!480230 m!461401))

(declare-fun m!461403 () Bool)

(assert (=> b!480230 m!461403))

(declare-fun m!461405 () Bool)

(assert (=> b!480228 m!461405))

(declare-fun m!461407 () Bool)

(assert (=> b!480232 m!461407))

(declare-fun m!461409 () Bool)

(assert (=> b!480232 m!461409))

(declare-fun m!461411 () Bool)

(assert (=> b!480224 m!461411))

(declare-fun m!461413 () Bool)

(assert (=> b!480231 m!461413))

(declare-fun m!461415 () Bool)

(assert (=> start!43358 m!461415))

(declare-fun m!461417 () Bool)

(assert (=> start!43358 m!461417))

(declare-fun m!461419 () Bool)

(assert (=> start!43358 m!461419))

(check-sat b_and!20929 (not start!43358) (not b!480231) (not b!480224) (not mapNonEmpty!22270) (not b!480226) (not b!480230) (not b!480232) (not b_next!12199) tp_is_empty!13711 (not b!480228))
(check-sat b_and!20929 (not b_next!12199))
