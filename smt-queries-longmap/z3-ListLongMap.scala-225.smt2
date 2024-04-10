; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4034 () Bool)

(assert start!4034)

(declare-fun b_free!939 () Bool)

(declare-fun b_next!939 () Bool)

(assert (=> start!4034 (= b_free!939 (not b_next!939))))

(declare-fun tp!4237 () Bool)

(declare-fun b_and!1749 () Bool)

(assert (=> start!4034 (= tp!4237 b_and!1749)))

(declare-fun b!29511 () Bool)

(declare-fun res!17705 () Bool)

(declare-fun e!19052 () Bool)

(assert (=> b!29511 (=> (not res!17705) (not e!19052))))

(declare-datatypes ((array!1817 0))(
  ( (array!1818 (arr!862 (Array (_ BitVec 32) (_ BitVec 64))) (size!963 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1817)

(declare-datatypes ((List!715 0))(
  ( (Nil!712) (Cons!711 (h!1278 (_ BitVec 64)) (t!3408 List!715)) )
))
(declare-fun arrayNoDuplicates!0 (array!1817 (_ BitVec 32) List!715) Bool)

(assert (=> b!29511 (= res!17705 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!712))))

(declare-fun b!29512 () Bool)

(declare-fun e!19048 () Bool)

(assert (=> b!29512 (= e!19048 (not true))))

(declare-fun lt!11316 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1817 (_ BitVec 32)) Bool)

(assert (=> b!29512 (arrayForallSeekEntryOrOpenFound!0 lt!11316 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!683 0))(
  ( (Unit!684) )
))
(declare-fun lt!11315 () Unit!683)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!683)

(assert (=> b!29512 (= lt!11315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11316))))

(declare-datatypes ((SeekEntryResult!88 0))(
  ( (MissingZero!88 (index!2474 (_ BitVec 32))) (Found!88 (index!2475 (_ BitVec 32))) (Intermediate!88 (undefined!900 Bool) (index!2476 (_ BitVec 32)) (x!6430 (_ BitVec 32))) (Undefined!88) (MissingVacant!88 (index!2477 (_ BitVec 32))) )
))
(declare-fun lt!11317 () SeekEntryResult!88)

(get-info :version)

(assert (=> b!29512 (and ((_ is Found!88) lt!11317) (= (index!2475 lt!11317) lt!11316))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1817 (_ BitVec 32)) SeekEntryResult!88)

(assert (=> b!29512 (= lt!11317 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!11313 () Unit!683)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1817 (_ BitVec 32)) Unit!683)

(assert (=> b!29512 (= lt!11313 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11316 _keys!1833 mask!2294))))

(declare-datatypes ((V!1549 0))(
  ( (V!1550 (val!673 Int)) )
))
(declare-datatypes ((tuple2!1114 0))(
  ( (tuple2!1115 (_1!568 (_ BitVec 64)) (_2!568 V!1549)) )
))
(declare-datatypes ((List!716 0))(
  ( (Nil!713) (Cons!712 (h!1279 tuple2!1114) (t!3409 List!716)) )
))
(declare-datatypes ((ListLongMap!691 0))(
  ( (ListLongMap!692 (toList!361 List!716)) )
))
(declare-fun lt!11314 () ListLongMap!691)

(declare-fun contains!301 (ListLongMap!691 (_ BitVec 64)) Bool)

(assert (=> b!29512 (contains!301 lt!11314 (select (arr!862 _keys!1833) lt!11316))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!447 0))(
  ( (ValueCellFull!447 (v!1762 V!1549)) (EmptyCell!447) )
))
(declare-datatypes ((array!1819 0))(
  ( (array!1820 (arr!863 (Array (_ BitVec 32) ValueCell!447)) (size!964 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1819)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11318 () Unit!683)

(declare-fun zeroValue!1443 () V!1549)

(declare-fun minValue!1443 () V!1549)

(declare-fun lemmaValidKeyInArrayIsInListMap!35 (array!1817 array!1819 (_ BitVec 32) (_ BitVec 32) V!1549 V!1549 (_ BitVec 32) Int) Unit!683)

(assert (=> b!29512 (= lt!11318 (lemmaValidKeyInArrayIsInListMap!35 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11316 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1817 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29512 (= lt!11316 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29513 () Bool)

(declare-fun res!17707 () Bool)

(assert (=> b!29513 (=> (not res!17707) (not e!19052))))

(assert (=> b!29513 (= res!17707 (and (= (size!964 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!963 _keys!1833) (size!964 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29514 () Bool)

(declare-fun e!19050 () Bool)

(declare-fun tp_is_empty!1293 () Bool)

(assert (=> b!29514 (= e!19050 tp_is_empty!1293)))

(declare-fun b!29515 () Bool)

(declare-fun e!19047 () Bool)

(declare-fun e!19051 () Bool)

(declare-fun mapRes!1468 () Bool)

(assert (=> b!29515 (= e!19047 (and e!19051 mapRes!1468))))

(declare-fun condMapEmpty!1468 () Bool)

(declare-fun mapDefault!1468 () ValueCell!447)

(assert (=> b!29515 (= condMapEmpty!1468 (= (arr!863 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!447)) mapDefault!1468)))))

(declare-fun b!29516 () Bool)

(declare-fun res!17708 () Bool)

(assert (=> b!29516 (=> (not res!17708) (not e!19048))))

(declare-fun arrayContainsKey!0 (array!1817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29516 (= res!17708 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29518 () Bool)

(assert (=> b!29518 (= e!19052 e!19048)))

(declare-fun res!17703 () Bool)

(assert (=> b!29518 (=> (not res!17703) (not e!19048))))

(assert (=> b!29518 (= res!17703 (not (contains!301 lt!11314 k0!1304)))))

(declare-fun getCurrentListMap!190 (array!1817 array!1819 (_ BitVec 32) (_ BitVec 32) V!1549 V!1549 (_ BitVec 32) Int) ListLongMap!691)

(assert (=> b!29518 (= lt!11314 (getCurrentListMap!190 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1468 () Bool)

(assert (=> mapIsEmpty!1468 mapRes!1468))

(declare-fun b!29519 () Bool)

(assert (=> b!29519 (= e!19051 tp_is_empty!1293)))

(declare-fun b!29517 () Bool)

(declare-fun res!17706 () Bool)

(assert (=> b!29517 (=> (not res!17706) (not e!19052))))

(assert (=> b!29517 (= res!17706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17709 () Bool)

(assert (=> start!4034 (=> (not res!17709) (not e!19052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4034 (= res!17709 (validMask!0 mask!2294))))

(assert (=> start!4034 e!19052))

(assert (=> start!4034 true))

(assert (=> start!4034 tp!4237))

(declare-fun array_inv!597 (array!1819) Bool)

(assert (=> start!4034 (and (array_inv!597 _values!1501) e!19047)))

(declare-fun array_inv!598 (array!1817) Bool)

(assert (=> start!4034 (array_inv!598 _keys!1833)))

(assert (=> start!4034 tp_is_empty!1293))

(declare-fun mapNonEmpty!1468 () Bool)

(declare-fun tp!4236 () Bool)

(assert (=> mapNonEmpty!1468 (= mapRes!1468 (and tp!4236 e!19050))))

(declare-fun mapRest!1468 () (Array (_ BitVec 32) ValueCell!447))

(declare-fun mapKey!1468 () (_ BitVec 32))

(declare-fun mapValue!1468 () ValueCell!447)

(assert (=> mapNonEmpty!1468 (= (arr!863 _values!1501) (store mapRest!1468 mapKey!1468 mapValue!1468))))

(declare-fun b!29520 () Bool)

(declare-fun res!17704 () Bool)

(assert (=> b!29520 (=> (not res!17704) (not e!19052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29520 (= res!17704 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4034 res!17709) b!29513))

(assert (= (and b!29513 res!17707) b!29517))

(assert (= (and b!29517 res!17706) b!29511))

(assert (= (and b!29511 res!17705) b!29520))

(assert (= (and b!29520 res!17704) b!29518))

(assert (= (and b!29518 res!17703) b!29516))

(assert (= (and b!29516 res!17708) b!29512))

(assert (= (and b!29515 condMapEmpty!1468) mapIsEmpty!1468))

(assert (= (and b!29515 (not condMapEmpty!1468)) mapNonEmpty!1468))

(assert (= (and mapNonEmpty!1468 ((_ is ValueCellFull!447) mapValue!1468)) b!29514))

(assert (= (and b!29515 ((_ is ValueCellFull!447) mapDefault!1468)) b!29519))

(assert (= start!4034 b!29515))

(declare-fun m!23749 () Bool)

(assert (=> start!4034 m!23749))

(declare-fun m!23751 () Bool)

(assert (=> start!4034 m!23751))

(declare-fun m!23753 () Bool)

(assert (=> start!4034 m!23753))

(declare-fun m!23755 () Bool)

(assert (=> b!29517 m!23755))

(declare-fun m!23757 () Bool)

(assert (=> b!29512 m!23757))

(declare-fun m!23759 () Bool)

(assert (=> b!29512 m!23759))

(declare-fun m!23761 () Bool)

(assert (=> b!29512 m!23761))

(declare-fun m!23763 () Bool)

(assert (=> b!29512 m!23763))

(declare-fun m!23765 () Bool)

(assert (=> b!29512 m!23765))

(declare-fun m!23767 () Bool)

(assert (=> b!29512 m!23767))

(declare-fun m!23769 () Bool)

(assert (=> b!29512 m!23769))

(declare-fun m!23771 () Bool)

(assert (=> b!29512 m!23771))

(assert (=> b!29512 m!23769))

(declare-fun m!23773 () Bool)

(assert (=> b!29511 m!23773))

(declare-fun m!23775 () Bool)

(assert (=> b!29516 m!23775))

(declare-fun m!23777 () Bool)

(assert (=> b!29520 m!23777))

(declare-fun m!23779 () Bool)

(assert (=> b!29518 m!23779))

(declare-fun m!23781 () Bool)

(assert (=> b!29518 m!23781))

(declare-fun m!23783 () Bool)

(assert (=> mapNonEmpty!1468 m!23783))

(check-sat (not b!29520) b_and!1749 (not b!29511) (not start!4034) (not b_next!939) (not b!29516) (not mapNonEmpty!1468) (not b!29517) (not b!29512) (not b!29518) tp_is_empty!1293)
(check-sat b_and!1749 (not b_next!939))
