; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4202 () Bool)

(assert start!4202)

(declare-fun b_free!1111 () Bool)

(declare-fun b_next!1111 () Bool)

(assert (=> start!4202 (= b_free!1111 (not b_next!1111))))

(declare-fun tp!4752 () Bool)

(declare-fun b_and!1911 () Bool)

(assert (=> start!4202 (= tp!4752 b_and!1911)))

(declare-fun b!31965 () Bool)

(declare-fun res!19415 () Bool)

(declare-fun e!20343 () Bool)

(assert (=> b!31965 (=> (not res!19415) (not e!20343))))

(declare-datatypes ((array!2129 0))(
  ( (array!2130 (arr!1018 (Array (_ BitVec 32) (_ BitVec 64))) (size!1119 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2129)

(declare-datatypes ((List!820 0))(
  ( (Nil!817) (Cons!816 (h!1383 (_ BitVec 64)) (t!3507 List!820)) )
))
(declare-fun arrayNoDuplicates!0 (array!2129 (_ BitVec 32) List!820) Bool)

(assert (=> b!31965 (= res!19415 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!817))))

(declare-fun b!31966 () Bool)

(declare-fun e!20345 () Bool)

(declare-fun tp_is_empty!1465 () Bool)

(assert (=> b!31966 (= e!20345 tp_is_empty!1465)))

(declare-fun b!31967 () Bool)

(declare-fun res!19417 () Bool)

(assert (=> b!31967 (=> (not res!19417) (not e!20343))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31967 (= res!19417 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1726 () Bool)

(declare-fun mapRes!1726 () Bool)

(declare-fun tp!4753 () Bool)

(declare-fun e!20347 () Bool)

(assert (=> mapNonEmpty!1726 (= mapRes!1726 (and tp!4753 e!20347))))

(declare-datatypes ((V!1779 0))(
  ( (V!1780 (val!759 Int)) )
))
(declare-datatypes ((ValueCell!533 0))(
  ( (ValueCellFull!533 (v!1848 V!1779)) (EmptyCell!533) )
))
(declare-datatypes ((array!2131 0))(
  ( (array!2132 (arr!1019 (Array (_ BitVec 32) ValueCell!533)) (size!1120 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2131)

(declare-fun mapKey!1726 () (_ BitVec 32))

(declare-fun mapValue!1726 () ValueCell!533)

(declare-fun mapRest!1726 () (Array (_ BitVec 32) ValueCell!533))

(assert (=> mapNonEmpty!1726 (= (arr!1019 _values!1501) (store mapRest!1726 mapKey!1726 mapValue!1726))))

(declare-fun b!31968 () Bool)

(declare-fun res!19418 () Bool)

(assert (=> b!31968 (=> (not res!19418) (not e!20343))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31968 (= res!19418 (and (= (size!1120 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1119 _keys!1833) (size!1120 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31969 () Bool)

(assert (=> b!31969 (= e!20343 false)))

(declare-fun lt!11583 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2129 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31969 (= lt!11583 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31970 () Bool)

(assert (=> b!31970 (= e!20347 tp_is_empty!1465)))

(declare-fun b!31971 () Bool)

(declare-fun e!20344 () Bool)

(assert (=> b!31971 (= e!20344 (and e!20345 mapRes!1726))))

(declare-fun condMapEmpty!1726 () Bool)

(declare-fun mapDefault!1726 () ValueCell!533)

(assert (=> b!31971 (= condMapEmpty!1726 (= (arr!1019 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!533)) mapDefault!1726)))))

(declare-fun b!31972 () Bool)

(declare-fun res!19416 () Bool)

(assert (=> b!31972 (=> (not res!19416) (not e!20343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31972 (= res!19416 (validKeyInArray!0 k0!1304))))

(declare-fun res!19419 () Bool)

(assert (=> start!4202 (=> (not res!19419) (not e!20343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4202 (= res!19419 (validMask!0 mask!2294))))

(assert (=> start!4202 e!20343))

(assert (=> start!4202 true))

(assert (=> start!4202 tp!4752))

(declare-fun array_inv!699 (array!2131) Bool)

(assert (=> start!4202 (and (array_inv!699 _values!1501) e!20344)))

(declare-fun array_inv!700 (array!2129) Bool)

(assert (=> start!4202 (array_inv!700 _keys!1833)))

(assert (=> start!4202 tp_is_empty!1465))

(declare-fun mapIsEmpty!1726 () Bool)

(assert (=> mapIsEmpty!1726 mapRes!1726))

(declare-fun b!31973 () Bool)

(declare-fun res!19421 () Bool)

(assert (=> b!31973 (=> (not res!19421) (not e!20343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2129 (_ BitVec 32)) Bool)

(assert (=> b!31973 (= res!19421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31974 () Bool)

(declare-fun res!19420 () Bool)

(assert (=> b!31974 (=> (not res!19420) (not e!20343))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1779)

(declare-fun minValue!1443 () V!1779)

(declare-datatypes ((tuple2!1224 0))(
  ( (tuple2!1225 (_1!623 (_ BitVec 64)) (_2!623 V!1779)) )
))
(declare-datatypes ((List!821 0))(
  ( (Nil!818) (Cons!817 (h!1384 tuple2!1224) (t!3508 List!821)) )
))
(declare-datatypes ((ListLongMap!795 0))(
  ( (ListLongMap!796 (toList!413 List!821)) )
))
(declare-fun contains!355 (ListLongMap!795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!238 (array!2129 array!2131 (_ BitVec 32) (_ BitVec 32) V!1779 V!1779 (_ BitVec 32) Int) ListLongMap!795)

(assert (=> b!31974 (= res!19420 (not (contains!355 (getCurrentListMap!238 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(assert (= (and start!4202 res!19419) b!31968))

(assert (= (and b!31968 res!19418) b!31973))

(assert (= (and b!31973 res!19421) b!31965))

(assert (= (and b!31965 res!19415) b!31972))

(assert (= (and b!31972 res!19416) b!31974))

(assert (= (and b!31974 res!19420) b!31967))

(assert (= (and b!31967 res!19417) b!31969))

(assert (= (and b!31971 condMapEmpty!1726) mapIsEmpty!1726))

(assert (= (and b!31971 (not condMapEmpty!1726)) mapNonEmpty!1726))

(get-info :version)

(assert (= (and mapNonEmpty!1726 ((_ is ValueCellFull!533) mapValue!1726)) b!31970))

(assert (= (and b!31971 ((_ is ValueCellFull!533) mapDefault!1726)) b!31966))

(assert (= start!4202 b!31971))

(declare-fun m!25505 () Bool)

(assert (=> b!31972 m!25505))

(declare-fun m!25507 () Bool)

(assert (=> b!31969 m!25507))

(declare-fun m!25509 () Bool)

(assert (=> b!31974 m!25509))

(assert (=> b!31974 m!25509))

(declare-fun m!25511 () Bool)

(assert (=> b!31974 m!25511))

(declare-fun m!25513 () Bool)

(assert (=> b!31965 m!25513))

(declare-fun m!25515 () Bool)

(assert (=> b!31967 m!25515))

(declare-fun m!25517 () Bool)

(assert (=> mapNonEmpty!1726 m!25517))

(declare-fun m!25519 () Bool)

(assert (=> b!31973 m!25519))

(declare-fun m!25521 () Bool)

(assert (=> start!4202 m!25521))

(declare-fun m!25523 () Bool)

(assert (=> start!4202 m!25523))

(declare-fun m!25525 () Bool)

(assert (=> start!4202 m!25525))

(check-sat tp_is_empty!1465 (not b!31967) (not start!4202) (not b_next!1111) (not b!31973) (not b!31969) (not b!31965) b_and!1911 (not mapNonEmpty!1726) (not b!31974) (not b!31972))
(check-sat b_and!1911 (not b_next!1111))
