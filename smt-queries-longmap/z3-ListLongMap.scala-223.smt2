; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4016 () Bool)

(assert start!4016)

(declare-fun b_free!925 () Bool)

(declare-fun b_next!925 () Bool)

(assert (=> start!4016 (= b_free!925 (not b_next!925))))

(declare-fun tp!4195 () Bool)

(declare-fun b_and!1725 () Bool)

(assert (=> start!4016 (= tp!4195 b_and!1725)))

(declare-fun b!29229 () Bool)

(declare-fun e!18873 () Bool)

(declare-fun tp_is_empty!1279 () Bool)

(assert (=> b!29229 (= e!18873 tp_is_empty!1279)))

(declare-fun b!29230 () Bool)

(declare-fun res!17520 () Bool)

(declare-fun e!18874 () Bool)

(assert (=> b!29230 (=> (not res!17520) (not e!18874))))

(declare-datatypes ((array!1771 0))(
  ( (array!1772 (arr!839 (Array (_ BitVec 32) (_ BitVec 64))) (size!940 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1771)

(declare-datatypes ((List!692 0))(
  ( (Nil!689) (Cons!688 (h!1255 (_ BitVec 64)) (t!3379 List!692)) )
))
(declare-fun arrayNoDuplicates!0 (array!1771 (_ BitVec 32) List!692) Bool)

(assert (=> b!29230 (= res!17520 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!689))))

(declare-fun mapNonEmpty!1447 () Bool)

(declare-fun mapRes!1447 () Bool)

(declare-fun tp!4194 () Bool)

(declare-fun e!18869 () Bool)

(assert (=> mapNonEmpty!1447 (= mapRes!1447 (and tp!4194 e!18869))))

(declare-datatypes ((V!1531 0))(
  ( (V!1532 (val!666 Int)) )
))
(declare-datatypes ((ValueCell!440 0))(
  ( (ValueCellFull!440 (v!1755 V!1531)) (EmptyCell!440) )
))
(declare-fun mapValue!1447 () ValueCell!440)

(declare-datatypes ((array!1773 0))(
  ( (array!1774 (arr!840 (Array (_ BitVec 32) ValueCell!440)) (size!941 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1773)

(declare-fun mapRest!1447 () (Array (_ BitVec 32) ValueCell!440))

(declare-fun mapKey!1447 () (_ BitVec 32))

(assert (=> mapNonEmpty!1447 (= (arr!840 _values!1501) (store mapRest!1447 mapKey!1447 mapValue!1447))))

(declare-fun b!29231 () Bool)

(declare-fun res!17518 () Bool)

(assert (=> b!29231 (=> (not res!17518) (not e!18874))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29231 (= res!17518 (validKeyInArray!0 k0!1304))))

(declare-fun b!29232 () Bool)

(declare-fun res!17519 () Bool)

(assert (=> b!29232 (=> (not res!17519) (not e!18874))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29232 (= res!17519 (and (= (size!941 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!940 _keys!1833) (size!941 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1447 () Bool)

(assert (=> mapIsEmpty!1447 mapRes!1447))

(declare-fun b!29233 () Bool)

(declare-fun res!17516 () Bool)

(declare-fun e!18871 () Bool)

(assert (=> b!29233 (=> (not res!17516) (not e!18871))))

(declare-fun arrayContainsKey!0 (array!1771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29233 (= res!17516 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29234 () Bool)

(assert (=> b!29234 (= e!18874 e!18871)))

(declare-fun res!17521 () Bool)

(assert (=> b!29234 (=> (not res!17521) (not e!18871))))

(declare-datatypes ((tuple2!1104 0))(
  ( (tuple2!1105 (_1!563 (_ BitVec 64)) (_2!563 V!1531)) )
))
(declare-datatypes ((List!693 0))(
  ( (Nil!690) (Cons!689 (h!1256 tuple2!1104) (t!3380 List!693)) )
))
(declare-datatypes ((ListLongMap!675 0))(
  ( (ListLongMap!676 (toList!353 List!693)) )
))
(declare-fun lt!11145 () ListLongMap!675)

(declare-fun contains!295 (ListLongMap!675 (_ BitVec 64)) Bool)

(assert (=> b!29234 (= res!17521 (not (contains!295 lt!11145 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1531)

(declare-fun minValue!1443 () V!1531)

(declare-fun getCurrentListMap!178 (array!1771 array!1773 (_ BitVec 32) (_ BitVec 32) V!1531 V!1531 (_ BitVec 32) Int) ListLongMap!675)

(assert (=> b!29234 (= lt!11145 (getCurrentListMap!178 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29235 () Bool)

(assert (=> b!29235 (= e!18871 (not true))))

(declare-fun lt!11144 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1771 (_ BitVec 32)) Bool)

(assert (=> b!29235 (arrayForallSeekEntryOrOpenFound!0 lt!11144 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!693 0))(
  ( (Unit!694) )
))
(declare-fun lt!11147 () Unit!693)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!693)

(assert (=> b!29235 (= lt!11147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11144))))

(declare-datatypes ((SeekEntryResult!85 0))(
  ( (MissingZero!85 (index!2462 (_ BitVec 32))) (Found!85 (index!2463 (_ BitVec 32))) (Intermediate!85 (undefined!897 Bool) (index!2464 (_ BitVec 32)) (x!6411 (_ BitVec 32))) (Undefined!85) (MissingVacant!85 (index!2465 (_ BitVec 32))) )
))
(declare-fun lt!11146 () SeekEntryResult!85)

(get-info :version)

(assert (=> b!29235 (and ((_ is Found!85) lt!11146) (= (index!2463 lt!11146) lt!11144))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1771 (_ BitVec 32)) SeekEntryResult!85)

(assert (=> b!29235 (= lt!11146 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!11148 () Unit!693)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1771 (_ BitVec 32)) Unit!693)

(assert (=> b!29235 (= lt!11148 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11144 _keys!1833 mask!2294))))

(assert (=> b!29235 (contains!295 lt!11145 (select (arr!839 _keys!1833) lt!11144))))

(declare-fun lt!11143 () Unit!693)

(declare-fun lemmaValidKeyInArrayIsInListMap!36 (array!1771 array!1773 (_ BitVec 32) (_ BitVec 32) V!1531 V!1531 (_ BitVec 32) Int) Unit!693)

(assert (=> b!29235 (= lt!11143 (lemmaValidKeyInArrayIsInListMap!36 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11144 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1771 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29235 (= lt!11144 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29237 () Bool)

(declare-fun e!18870 () Bool)

(assert (=> b!29237 (= e!18870 (and e!18873 mapRes!1447))))

(declare-fun condMapEmpty!1447 () Bool)

(declare-fun mapDefault!1447 () ValueCell!440)

(assert (=> b!29237 (= condMapEmpty!1447 (= (arr!840 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!440)) mapDefault!1447)))))

(declare-fun b!29238 () Bool)

(assert (=> b!29238 (= e!18869 tp_is_empty!1279)))

(declare-fun b!29236 () Bool)

(declare-fun res!17522 () Bool)

(assert (=> b!29236 (=> (not res!17522) (not e!18874))))

(assert (=> b!29236 (= res!17522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17517 () Bool)

(assert (=> start!4016 (=> (not res!17517) (not e!18874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4016 (= res!17517 (validMask!0 mask!2294))))

(assert (=> start!4016 e!18874))

(assert (=> start!4016 true))

(assert (=> start!4016 tp!4195))

(declare-fun array_inv!583 (array!1773) Bool)

(assert (=> start!4016 (and (array_inv!583 _values!1501) e!18870)))

(declare-fun array_inv!584 (array!1771) Bool)

(assert (=> start!4016 (array_inv!584 _keys!1833)))

(assert (=> start!4016 tp_is_empty!1279))

(assert (= (and start!4016 res!17517) b!29232))

(assert (= (and b!29232 res!17519) b!29236))

(assert (= (and b!29236 res!17522) b!29230))

(assert (= (and b!29230 res!17520) b!29231))

(assert (= (and b!29231 res!17518) b!29234))

(assert (= (and b!29234 res!17521) b!29233))

(assert (= (and b!29233 res!17516) b!29235))

(assert (= (and b!29237 condMapEmpty!1447) mapIsEmpty!1447))

(assert (= (and b!29237 (not condMapEmpty!1447)) mapNonEmpty!1447))

(assert (= (and mapNonEmpty!1447 ((_ is ValueCellFull!440) mapValue!1447)) b!29238))

(assert (= (and b!29237 ((_ is ValueCellFull!440) mapDefault!1447)) b!29229))

(assert (= start!4016 b!29237))

(declare-fun m!23345 () Bool)

(assert (=> b!29234 m!23345))

(declare-fun m!23347 () Bool)

(assert (=> b!29234 m!23347))

(declare-fun m!23349 () Bool)

(assert (=> start!4016 m!23349))

(declare-fun m!23351 () Bool)

(assert (=> start!4016 m!23351))

(declare-fun m!23353 () Bool)

(assert (=> start!4016 m!23353))

(declare-fun m!23355 () Bool)

(assert (=> b!29235 m!23355))

(declare-fun m!23357 () Bool)

(assert (=> b!29235 m!23357))

(declare-fun m!23359 () Bool)

(assert (=> b!29235 m!23359))

(declare-fun m!23361 () Bool)

(assert (=> b!29235 m!23361))

(declare-fun m!23363 () Bool)

(assert (=> b!29235 m!23363))

(declare-fun m!23365 () Bool)

(assert (=> b!29235 m!23365))

(assert (=> b!29235 m!23355))

(declare-fun m!23367 () Bool)

(assert (=> b!29235 m!23367))

(declare-fun m!23369 () Bool)

(assert (=> b!29235 m!23369))

(declare-fun m!23371 () Bool)

(assert (=> b!29231 m!23371))

(declare-fun m!23373 () Bool)

(assert (=> b!29233 m!23373))

(declare-fun m!23375 () Bool)

(assert (=> b!29236 m!23375))

(declare-fun m!23377 () Bool)

(assert (=> mapNonEmpty!1447 m!23377))

(declare-fun m!23379 () Bool)

(assert (=> b!29230 m!23379))

(check-sat (not mapNonEmpty!1447) (not b!29234) (not b!29236) b_and!1725 (not start!4016) (not b!29231) (not b!29233) (not b!29235) (not b!29230) (not b_next!925) tp_is_empty!1279)
(check-sat b_and!1725 (not b_next!925))
