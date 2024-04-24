; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4022 () Bool)

(assert start!4022)

(declare-fun b_free!931 () Bool)

(declare-fun b_next!931 () Bool)

(assert (=> start!4022 (= b_free!931 (not b_next!931))))

(declare-fun tp!4212 () Bool)

(declare-fun b_and!1731 () Bool)

(assert (=> start!4022 (= tp!4212 b_and!1731)))

(declare-fun b!29319 () Bool)

(declare-fun res!17580 () Bool)

(declare-fun e!18927 () Bool)

(assert (=> b!29319 (=> (not res!17580) (not e!18927))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29319 (= res!17580 (validKeyInArray!0 k0!1304))))

(declare-fun b!29320 () Bool)

(declare-fun e!18928 () Bool)

(assert (=> b!29320 (= e!18928 (not true))))

(declare-fun lt!11198 () (_ BitVec 32))

(declare-datatypes ((array!1783 0))(
  ( (array!1784 (arr!845 (Array (_ BitVec 32) (_ BitVec 64))) (size!946 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1783)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1783 (_ BitVec 32)) Bool)

(assert (=> b!29320 (arrayForallSeekEntryOrOpenFound!0 lt!11198 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!699 0))(
  ( (Unit!700) )
))
(declare-fun lt!11200 () Unit!699)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!699)

(assert (=> b!29320 (= lt!11200 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11198))))

(declare-datatypes ((SeekEntryResult!88 0))(
  ( (MissingZero!88 (index!2474 (_ BitVec 32))) (Found!88 (index!2475 (_ BitVec 32))) (Intermediate!88 (undefined!900 Bool) (index!2476 (_ BitVec 32)) (x!6422 (_ BitVec 32))) (Undefined!88) (MissingVacant!88 (index!2477 (_ BitVec 32))) )
))
(declare-fun lt!11199 () SeekEntryResult!88)

(get-info :version)

(assert (=> b!29320 (and ((_ is Found!88) lt!11199) (= (index!2475 lt!11199) lt!11198))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1783 (_ BitVec 32)) SeekEntryResult!88)

(assert (=> b!29320 (= lt!11199 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!11197 () Unit!699)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1783 (_ BitVec 32)) Unit!699)

(assert (=> b!29320 (= lt!11197 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11198 _keys!1833 mask!2294))))

(declare-datatypes ((V!1539 0))(
  ( (V!1540 (val!669 Int)) )
))
(declare-datatypes ((tuple2!1110 0))(
  ( (tuple2!1111 (_1!566 (_ BitVec 64)) (_2!566 V!1539)) )
))
(declare-datatypes ((List!698 0))(
  ( (Nil!695) (Cons!694 (h!1261 tuple2!1110) (t!3385 List!698)) )
))
(declare-datatypes ((ListLongMap!681 0))(
  ( (ListLongMap!682 (toList!356 List!698)) )
))
(declare-fun lt!11202 () ListLongMap!681)

(declare-fun contains!298 (ListLongMap!681 (_ BitVec 64)) Bool)

(assert (=> b!29320 (contains!298 lt!11202 (select (arr!845 _keys!1833) lt!11198))))

(declare-fun lt!11201 () Unit!699)

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!443 0))(
  ( (ValueCellFull!443 (v!1758 V!1539)) (EmptyCell!443) )
))
(declare-datatypes ((array!1785 0))(
  ( (array!1786 (arr!846 (Array (_ BitVec 32) ValueCell!443)) (size!947 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1785)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1539)

(declare-fun minValue!1443 () V!1539)

(declare-fun lemmaValidKeyInArrayIsInListMap!39 (array!1783 array!1785 (_ BitVec 32) (_ BitVec 32) V!1539 V!1539 (_ BitVec 32) Int) Unit!699)

(assert (=> b!29320 (= lt!11201 (lemmaValidKeyInArrayIsInListMap!39 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11198 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1783 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29320 (= lt!11198 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!17579 () Bool)

(assert (=> start!4022 (=> (not res!17579) (not e!18927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4022 (= res!17579 (validMask!0 mask!2294))))

(assert (=> start!4022 e!18927))

(assert (=> start!4022 true))

(assert (=> start!4022 tp!4212))

(declare-fun e!18926 () Bool)

(declare-fun array_inv!587 (array!1785) Bool)

(assert (=> start!4022 (and (array_inv!587 _values!1501) e!18926)))

(declare-fun array_inv!588 (array!1783) Bool)

(assert (=> start!4022 (array_inv!588 _keys!1833)))

(declare-fun tp_is_empty!1285 () Bool)

(assert (=> start!4022 tp_is_empty!1285))

(declare-fun b!29321 () Bool)

(declare-fun res!17584 () Bool)

(assert (=> b!29321 (=> (not res!17584) (not e!18927))))

(assert (=> b!29321 (= res!17584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29322 () Bool)

(declare-fun e!18924 () Bool)

(assert (=> b!29322 (= e!18924 tp_is_empty!1285)))

(declare-fun mapIsEmpty!1456 () Bool)

(declare-fun mapRes!1456 () Bool)

(assert (=> mapIsEmpty!1456 mapRes!1456))

(declare-fun b!29323 () Bool)

(declare-fun res!17582 () Bool)

(assert (=> b!29323 (=> (not res!17582) (not e!18928))))

(declare-fun arrayContainsKey!0 (array!1783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29323 (= res!17582 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1456 () Bool)

(declare-fun tp!4213 () Bool)

(declare-fun e!18925 () Bool)

(assert (=> mapNonEmpty!1456 (= mapRes!1456 (and tp!4213 e!18925))))

(declare-fun mapKey!1456 () (_ BitVec 32))

(declare-fun mapRest!1456 () (Array (_ BitVec 32) ValueCell!443))

(declare-fun mapValue!1456 () ValueCell!443)

(assert (=> mapNonEmpty!1456 (= (arr!846 _values!1501) (store mapRest!1456 mapKey!1456 mapValue!1456))))

(declare-fun b!29324 () Bool)

(assert (=> b!29324 (= e!18925 tp_is_empty!1285)))

(declare-fun b!29325 () Bool)

(assert (=> b!29325 (= e!18926 (and e!18924 mapRes!1456))))

(declare-fun condMapEmpty!1456 () Bool)

(declare-fun mapDefault!1456 () ValueCell!443)

(assert (=> b!29325 (= condMapEmpty!1456 (= (arr!846 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!443)) mapDefault!1456)))))

(declare-fun b!29326 () Bool)

(declare-fun res!17583 () Bool)

(assert (=> b!29326 (=> (not res!17583) (not e!18927))))

(declare-datatypes ((List!699 0))(
  ( (Nil!696) (Cons!695 (h!1262 (_ BitVec 64)) (t!3386 List!699)) )
))
(declare-fun arrayNoDuplicates!0 (array!1783 (_ BitVec 32) List!699) Bool)

(assert (=> b!29326 (= res!17583 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!696))))

(declare-fun b!29327 () Bool)

(assert (=> b!29327 (= e!18927 e!18928)))

(declare-fun res!17585 () Bool)

(assert (=> b!29327 (=> (not res!17585) (not e!18928))))

(assert (=> b!29327 (= res!17585 (not (contains!298 lt!11202 k0!1304)))))

(declare-fun getCurrentListMap!181 (array!1783 array!1785 (_ BitVec 32) (_ BitVec 32) V!1539 V!1539 (_ BitVec 32) Int) ListLongMap!681)

(assert (=> b!29327 (= lt!11202 (getCurrentListMap!181 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29328 () Bool)

(declare-fun res!17581 () Bool)

(assert (=> b!29328 (=> (not res!17581) (not e!18927))))

(assert (=> b!29328 (= res!17581 (and (= (size!947 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!946 _keys!1833) (size!947 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4022 res!17579) b!29328))

(assert (= (and b!29328 res!17581) b!29321))

(assert (= (and b!29321 res!17584) b!29326))

(assert (= (and b!29326 res!17583) b!29319))

(assert (= (and b!29319 res!17580) b!29327))

(assert (= (and b!29327 res!17585) b!29323))

(assert (= (and b!29323 res!17582) b!29320))

(assert (= (and b!29325 condMapEmpty!1456) mapIsEmpty!1456))

(assert (= (and b!29325 (not condMapEmpty!1456)) mapNonEmpty!1456))

(assert (= (and mapNonEmpty!1456 ((_ is ValueCellFull!443) mapValue!1456)) b!29324))

(assert (= (and b!29325 ((_ is ValueCellFull!443) mapDefault!1456)) b!29322))

(assert (= start!4022 b!29325))

(declare-fun m!23453 () Bool)

(assert (=> start!4022 m!23453))

(declare-fun m!23455 () Bool)

(assert (=> start!4022 m!23455))

(declare-fun m!23457 () Bool)

(assert (=> start!4022 m!23457))

(declare-fun m!23459 () Bool)

(assert (=> b!29327 m!23459))

(declare-fun m!23461 () Bool)

(assert (=> b!29327 m!23461))

(declare-fun m!23463 () Bool)

(assert (=> b!29319 m!23463))

(declare-fun m!23465 () Bool)

(assert (=> b!29321 m!23465))

(declare-fun m!23467 () Bool)

(assert (=> mapNonEmpty!1456 m!23467))

(declare-fun m!23469 () Bool)

(assert (=> b!29323 m!23469))

(declare-fun m!23471 () Bool)

(assert (=> b!29320 m!23471))

(declare-fun m!23473 () Bool)

(assert (=> b!29320 m!23473))

(declare-fun m!23475 () Bool)

(assert (=> b!29320 m!23475))

(declare-fun m!23477 () Bool)

(assert (=> b!29320 m!23477))

(declare-fun m!23479 () Bool)

(assert (=> b!29320 m!23479))

(declare-fun m!23481 () Bool)

(assert (=> b!29320 m!23481))

(declare-fun m!23483 () Bool)

(assert (=> b!29320 m!23483))

(declare-fun m!23485 () Bool)

(assert (=> b!29320 m!23485))

(assert (=> b!29320 m!23481))

(declare-fun m!23487 () Bool)

(assert (=> b!29326 m!23487))

(check-sat b_and!1731 (not mapNonEmpty!1456) (not b_next!931) (not start!4022) tp_is_empty!1285 (not b!29319) (not b!29320) (not b!29327) (not b!29323) (not b!29326) (not b!29321))
(check-sat b_and!1731 (not b_next!931))
