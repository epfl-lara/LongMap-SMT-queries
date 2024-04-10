; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4016 () Bool)

(assert start!4016)

(declare-fun b_free!921 () Bool)

(declare-fun b_next!921 () Bool)

(assert (=> start!4016 (= b_free!921 (not b_next!921))))

(declare-fun tp!4182 () Bool)

(declare-fun b_and!1731 () Bool)

(assert (=> start!4016 (= tp!4182 b_and!1731)))

(declare-fun res!17516 () Bool)

(declare-fun e!18887 () Bool)

(assert (=> start!4016 (=> (not res!17516) (not e!18887))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4016 (= res!17516 (validMask!0 mask!2294))))

(assert (=> start!4016 e!18887))

(assert (=> start!4016 true))

(assert (=> start!4016 tp!4182))

(declare-datatypes ((V!1525 0))(
  ( (V!1526 (val!664 Int)) )
))
(declare-datatypes ((ValueCell!438 0))(
  ( (ValueCellFull!438 (v!1753 V!1525)) (EmptyCell!438) )
))
(declare-datatypes ((array!1781 0))(
  ( (array!1782 (arr!844 (Array (_ BitVec 32) ValueCell!438)) (size!945 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1781)

(declare-fun e!18885 () Bool)

(declare-fun array_inv!585 (array!1781) Bool)

(assert (=> start!4016 (and (array_inv!585 _values!1501) e!18885)))

(declare-datatypes ((array!1783 0))(
  ( (array!1784 (arr!845 (Array (_ BitVec 32) (_ BitVec 64))) (size!946 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1783)

(declare-fun array_inv!586 (array!1783) Bool)

(assert (=> start!4016 (array_inv!586 _keys!1833)))

(declare-fun tp_is_empty!1275 () Bool)

(assert (=> start!4016 tp_is_empty!1275))

(declare-fun b!29241 () Bool)

(declare-fun e!18888 () Bool)

(assert (=> b!29241 (= e!18888 tp_is_empty!1275)))

(declare-fun b!29242 () Bool)

(declare-fun e!18890 () Bool)

(assert (=> b!29242 (= e!18890 (not true))))

(declare-datatypes ((SeekEntryResult!82 0))(
  ( (MissingZero!82 (index!2450 (_ BitVec 32))) (Found!82 (index!2451 (_ BitVec 32))) (Intermediate!82 (undefined!894 Bool) (index!2452 (_ BitVec 32)) (x!6400 (_ BitVec 32))) (Undefined!82) (MissingVacant!82 (index!2453 (_ BitVec 32))) )
))
(declare-fun lt!11157 () SeekEntryResult!82)

(declare-fun lt!11156 () (_ BitVec 32))

(get-info :version)

(assert (=> b!29242 (and ((_ is Found!82) lt!11157) (= (index!2451 lt!11157) lt!11156))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1783 (_ BitVec 32)) SeekEntryResult!82)

(assert (=> b!29242 (= lt!11157 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!671 0))(
  ( (Unit!672) )
))
(declare-fun lt!11158 () Unit!671)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1783 (_ BitVec 32)) Unit!671)

(assert (=> b!29242 (= lt!11158 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11156 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1100 0))(
  ( (tuple2!1101 (_1!561 (_ BitVec 64)) (_2!561 V!1525)) )
))
(declare-datatypes ((List!700 0))(
  ( (Nil!697) (Cons!696 (h!1263 tuple2!1100) (t!3393 List!700)) )
))
(declare-datatypes ((ListLongMap!677 0))(
  ( (ListLongMap!678 (toList!354 List!700)) )
))
(declare-fun lt!11159 () ListLongMap!677)

(declare-fun contains!294 (ListLongMap!677 (_ BitVec 64)) Bool)

(assert (=> b!29242 (contains!294 lt!11159 (select (arr!845 _keys!1833) lt!11156))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11155 () Unit!671)

(declare-fun zeroValue!1443 () V!1525)

(declare-fun minValue!1443 () V!1525)

(declare-fun lemmaValidKeyInArrayIsInListMap!29 (array!1783 array!1781 (_ BitVec 32) (_ BitVec 32) V!1525 V!1525 (_ BitVec 32) Int) Unit!671)

(assert (=> b!29242 (= lt!11155 (lemmaValidKeyInArrayIsInListMap!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11156 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1783 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29242 (= lt!11156 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29243 () Bool)

(declare-fun e!18886 () Bool)

(declare-fun mapRes!1441 () Bool)

(assert (=> b!29243 (= e!18885 (and e!18886 mapRes!1441))))

(declare-fun condMapEmpty!1441 () Bool)

(declare-fun mapDefault!1441 () ValueCell!438)

(assert (=> b!29243 (= condMapEmpty!1441 (= (arr!844 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!438)) mapDefault!1441)))))

(declare-fun b!29244 () Bool)

(declare-fun res!17514 () Bool)

(assert (=> b!29244 (=> (not res!17514) (not e!18887))))

(declare-datatypes ((List!701 0))(
  ( (Nil!698) (Cons!697 (h!1264 (_ BitVec 64)) (t!3394 List!701)) )
))
(declare-fun arrayNoDuplicates!0 (array!1783 (_ BitVec 32) List!701) Bool)

(assert (=> b!29244 (= res!17514 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!698))))

(declare-fun b!29245 () Bool)

(assert (=> b!29245 (= e!18887 e!18890)))

(declare-fun res!17519 () Bool)

(assert (=> b!29245 (=> (not res!17519) (not e!18890))))

(assert (=> b!29245 (= res!17519 (not (contains!294 lt!11159 k0!1304)))))

(declare-fun getCurrentListMap!184 (array!1783 array!1781 (_ BitVec 32) (_ BitVec 32) V!1525 V!1525 (_ BitVec 32) Int) ListLongMap!677)

(assert (=> b!29245 (= lt!11159 (getCurrentListMap!184 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29246 () Bool)

(declare-fun res!17515 () Bool)

(assert (=> b!29246 (=> (not res!17515) (not e!18890))))

(declare-fun arrayContainsKey!0 (array!1783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29246 (= res!17515 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1441 () Bool)

(declare-fun tp!4183 () Bool)

(assert (=> mapNonEmpty!1441 (= mapRes!1441 (and tp!4183 e!18888))))

(declare-fun mapKey!1441 () (_ BitVec 32))

(declare-fun mapRest!1441 () (Array (_ BitVec 32) ValueCell!438))

(declare-fun mapValue!1441 () ValueCell!438)

(assert (=> mapNonEmpty!1441 (= (arr!844 _values!1501) (store mapRest!1441 mapKey!1441 mapValue!1441))))

(declare-fun b!29247 () Bool)

(declare-fun res!17518 () Bool)

(assert (=> b!29247 (=> (not res!17518) (not e!18887))))

(assert (=> b!29247 (= res!17518 (and (= (size!945 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!946 _keys!1833) (size!945 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29248 () Bool)

(assert (=> b!29248 (= e!18886 tp_is_empty!1275)))

(declare-fun mapIsEmpty!1441 () Bool)

(assert (=> mapIsEmpty!1441 mapRes!1441))

(declare-fun b!29249 () Bool)

(declare-fun res!17517 () Bool)

(assert (=> b!29249 (=> (not res!17517) (not e!18887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29249 (= res!17517 (validKeyInArray!0 k0!1304))))

(declare-fun b!29250 () Bool)

(declare-fun res!17520 () Bool)

(assert (=> b!29250 (=> (not res!17520) (not e!18887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1783 (_ BitVec 32)) Bool)

(assert (=> b!29250 (= res!17520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!4016 res!17516) b!29247))

(assert (= (and b!29247 res!17518) b!29250))

(assert (= (and b!29250 res!17520) b!29244))

(assert (= (and b!29244 res!17514) b!29249))

(assert (= (and b!29249 res!17517) b!29245))

(assert (= (and b!29245 res!17519) b!29246))

(assert (= (and b!29246 res!17515) b!29242))

(assert (= (and b!29243 condMapEmpty!1441) mapIsEmpty!1441))

(assert (= (and b!29243 (not condMapEmpty!1441)) mapNonEmpty!1441))

(assert (= (and mapNonEmpty!1441 ((_ is ValueCellFull!438) mapValue!1441)) b!29241))

(assert (= (and b!29243 ((_ is ValueCellFull!438) mapDefault!1441)) b!29248))

(assert (= start!4016 b!29243))

(declare-fun m!23433 () Bool)

(assert (=> mapNonEmpty!1441 m!23433))

(declare-fun m!23435 () Bool)

(assert (=> start!4016 m!23435))

(declare-fun m!23437 () Bool)

(assert (=> start!4016 m!23437))

(declare-fun m!23439 () Bool)

(assert (=> start!4016 m!23439))

(declare-fun m!23441 () Bool)

(assert (=> b!29242 m!23441))

(declare-fun m!23443 () Bool)

(assert (=> b!29242 m!23443))

(declare-fun m!23445 () Bool)

(assert (=> b!29242 m!23445))

(assert (=> b!29242 m!23445))

(declare-fun m!23447 () Bool)

(assert (=> b!29242 m!23447))

(declare-fun m!23449 () Bool)

(assert (=> b!29242 m!23449))

(declare-fun m!23451 () Bool)

(assert (=> b!29242 m!23451))

(declare-fun m!23453 () Bool)

(assert (=> b!29246 m!23453))

(declare-fun m!23455 () Bool)

(assert (=> b!29244 m!23455))

(declare-fun m!23457 () Bool)

(assert (=> b!29250 m!23457))

(declare-fun m!23459 () Bool)

(assert (=> b!29249 m!23459))

(declare-fun m!23461 () Bool)

(assert (=> b!29245 m!23461))

(declare-fun m!23463 () Bool)

(assert (=> b!29245 m!23463))

(check-sat (not b!29245) b_and!1731 (not b!29242) (not b!29249) (not start!4016) (not mapNonEmpty!1441) (not b_next!921) (not b!29250) tp_is_empty!1275 (not b!29244) (not b!29246))
(check-sat b_and!1731 (not b_next!921))
