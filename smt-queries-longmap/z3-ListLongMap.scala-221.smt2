; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4010 () Bool)

(assert start!4010)

(declare-fun b_free!915 () Bool)

(declare-fun b_next!915 () Bool)

(assert (=> start!4010 (= b_free!915 (not b_next!915))))

(declare-fun tp!4165 () Bool)

(declare-fun b_and!1725 () Bool)

(assert (=> start!4010 (= tp!4165 b_and!1725)))

(declare-fun b!29151 () Bool)

(declare-fun e!18833 () Bool)

(declare-fun tp_is_empty!1269 () Bool)

(assert (=> b!29151 (= e!18833 tp_is_empty!1269)))

(declare-fun b!29152 () Bool)

(declare-fun e!18835 () Bool)

(assert (=> b!29152 (= e!18835 (not true))))

(declare-datatypes ((SeekEntryResult!81 0))(
  ( (MissingZero!81 (index!2446 (_ BitVec 32))) (Found!81 (index!2447 (_ BitVec 32))) (Intermediate!81 (undefined!893 Bool) (index!2448 (_ BitVec 32)) (x!6391 (_ BitVec 32))) (Undefined!81) (MissingVacant!81 (index!2449 (_ BitVec 32))) )
))
(declare-fun lt!11110 () SeekEntryResult!81)

(declare-fun lt!11111 () (_ BitVec 32))

(get-info :version)

(assert (=> b!29152 (and ((_ is Found!81) lt!11110) (= (index!2447 lt!11110) lt!11111))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((array!1771 0))(
  ( (array!1772 (arr!839 (Array (_ BitVec 32) (_ BitVec 64))) (size!940 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1771)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1771 (_ BitVec 32)) SeekEntryResult!81)

(assert (=> b!29152 (= lt!11110 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!669 0))(
  ( (Unit!670) )
))
(declare-fun lt!11113 () Unit!669)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1771 (_ BitVec 32)) Unit!669)

(assert (=> b!29152 (= lt!11113 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11111 _keys!1833 mask!2294))))

(declare-datatypes ((V!1517 0))(
  ( (V!1518 (val!661 Int)) )
))
(declare-datatypes ((tuple2!1096 0))(
  ( (tuple2!1097 (_1!559 (_ BitVec 64)) (_2!559 V!1517)) )
))
(declare-datatypes ((List!696 0))(
  ( (Nil!693) (Cons!692 (h!1259 tuple2!1096) (t!3389 List!696)) )
))
(declare-datatypes ((ListLongMap!673 0))(
  ( (ListLongMap!674 (toList!352 List!696)) )
))
(declare-fun lt!11112 () ListLongMap!673)

(declare-fun contains!292 (ListLongMap!673 (_ BitVec 64)) Bool)

(assert (=> b!29152 (contains!292 lt!11112 (select (arr!839 _keys!1833) lt!11111))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!435 0))(
  ( (ValueCellFull!435 (v!1750 V!1517)) (EmptyCell!435) )
))
(declare-datatypes ((array!1773 0))(
  ( (array!1774 (arr!840 (Array (_ BitVec 32) ValueCell!435)) (size!941 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1773)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11114 () Unit!669)

(declare-fun zeroValue!1443 () V!1517)

(declare-fun minValue!1443 () V!1517)

(declare-fun lemmaValidKeyInArrayIsInListMap!28 (array!1771 array!1773 (_ BitVec 32) (_ BitVec 32) V!1517 V!1517 (_ BitVec 32) Int) Unit!669)

(assert (=> b!29152 (= lt!11114 (lemmaValidKeyInArrayIsInListMap!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11111 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1771 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29152 (= lt!11111 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29153 () Bool)

(declare-fun res!17456 () Bool)

(assert (=> b!29153 (=> (not res!17456) (not e!18835))))

(declare-fun arrayContainsKey!0 (array!1771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29153 (= res!17456 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29154 () Bool)

(declare-fun e!18831 () Bool)

(assert (=> b!29154 (= e!18831 tp_is_empty!1269)))

(declare-fun res!17451 () Bool)

(declare-fun e!18836 () Bool)

(assert (=> start!4010 (=> (not res!17451) (not e!18836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4010 (= res!17451 (validMask!0 mask!2294))))

(assert (=> start!4010 e!18836))

(assert (=> start!4010 true))

(assert (=> start!4010 tp!4165))

(declare-fun e!18834 () Bool)

(declare-fun array_inv!581 (array!1773) Bool)

(assert (=> start!4010 (and (array_inv!581 _values!1501) e!18834)))

(declare-fun array_inv!582 (array!1771) Bool)

(assert (=> start!4010 (array_inv!582 _keys!1833)))

(assert (=> start!4010 tp_is_empty!1269))

(declare-fun b!29155 () Bool)

(declare-fun mapRes!1432 () Bool)

(assert (=> b!29155 (= e!18834 (and e!18831 mapRes!1432))))

(declare-fun condMapEmpty!1432 () Bool)

(declare-fun mapDefault!1432 () ValueCell!435)

(assert (=> b!29155 (= condMapEmpty!1432 (= (arr!840 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!435)) mapDefault!1432)))))

(declare-fun b!29156 () Bool)

(declare-fun res!17457 () Bool)

(assert (=> b!29156 (=> (not res!17457) (not e!18836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1771 (_ BitVec 32)) Bool)

(assert (=> b!29156 (= res!17457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1432 () Bool)

(declare-fun tp!4164 () Bool)

(assert (=> mapNonEmpty!1432 (= mapRes!1432 (and tp!4164 e!18833))))

(declare-fun mapRest!1432 () (Array (_ BitVec 32) ValueCell!435))

(declare-fun mapValue!1432 () ValueCell!435)

(declare-fun mapKey!1432 () (_ BitVec 32))

(assert (=> mapNonEmpty!1432 (= (arr!840 _values!1501) (store mapRest!1432 mapKey!1432 mapValue!1432))))

(declare-fun mapIsEmpty!1432 () Bool)

(assert (=> mapIsEmpty!1432 mapRes!1432))

(declare-fun b!29157 () Bool)

(declare-fun res!17455 () Bool)

(assert (=> b!29157 (=> (not res!17455) (not e!18836))))

(assert (=> b!29157 (= res!17455 (and (= (size!941 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!940 _keys!1833) (size!941 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29158 () Bool)

(declare-fun res!17452 () Bool)

(assert (=> b!29158 (=> (not res!17452) (not e!18836))))

(declare-datatypes ((List!697 0))(
  ( (Nil!694) (Cons!693 (h!1260 (_ BitVec 64)) (t!3390 List!697)) )
))
(declare-fun arrayNoDuplicates!0 (array!1771 (_ BitVec 32) List!697) Bool)

(assert (=> b!29158 (= res!17452 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!694))))

(declare-fun b!29159 () Bool)

(assert (=> b!29159 (= e!18836 e!18835)))

(declare-fun res!17453 () Bool)

(assert (=> b!29159 (=> (not res!17453) (not e!18835))))

(assert (=> b!29159 (= res!17453 (not (contains!292 lt!11112 k0!1304)))))

(declare-fun getCurrentListMap!182 (array!1771 array!1773 (_ BitVec 32) (_ BitVec 32) V!1517 V!1517 (_ BitVec 32) Int) ListLongMap!673)

(assert (=> b!29159 (= lt!11112 (getCurrentListMap!182 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29160 () Bool)

(declare-fun res!17454 () Bool)

(assert (=> b!29160 (=> (not res!17454) (not e!18836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29160 (= res!17454 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4010 res!17451) b!29157))

(assert (= (and b!29157 res!17455) b!29156))

(assert (= (and b!29156 res!17457) b!29158))

(assert (= (and b!29158 res!17452) b!29160))

(assert (= (and b!29160 res!17454) b!29159))

(assert (= (and b!29159 res!17453) b!29153))

(assert (= (and b!29153 res!17456) b!29152))

(assert (= (and b!29155 condMapEmpty!1432) mapIsEmpty!1432))

(assert (= (and b!29155 (not condMapEmpty!1432)) mapNonEmpty!1432))

(assert (= (and mapNonEmpty!1432 ((_ is ValueCellFull!435) mapValue!1432)) b!29151))

(assert (= (and b!29155 ((_ is ValueCellFull!435) mapDefault!1432)) b!29154))

(assert (= start!4010 b!29155))

(declare-fun m!23337 () Bool)

(assert (=> b!29156 m!23337))

(declare-fun m!23339 () Bool)

(assert (=> b!29159 m!23339))

(declare-fun m!23341 () Bool)

(assert (=> b!29159 m!23341))

(declare-fun m!23343 () Bool)

(assert (=> b!29153 m!23343))

(declare-fun m!23345 () Bool)

(assert (=> b!29160 m!23345))

(declare-fun m!23347 () Bool)

(assert (=> b!29158 m!23347))

(declare-fun m!23349 () Bool)

(assert (=> start!4010 m!23349))

(declare-fun m!23351 () Bool)

(assert (=> start!4010 m!23351))

(declare-fun m!23353 () Bool)

(assert (=> start!4010 m!23353))

(declare-fun m!23355 () Bool)

(assert (=> b!29152 m!23355))

(declare-fun m!23357 () Bool)

(assert (=> b!29152 m!23357))

(declare-fun m!23359 () Bool)

(assert (=> b!29152 m!23359))

(declare-fun m!23361 () Bool)

(assert (=> b!29152 m!23361))

(declare-fun m!23363 () Bool)

(assert (=> b!29152 m!23363))

(declare-fun m!23365 () Bool)

(assert (=> b!29152 m!23365))

(assert (=> b!29152 m!23357))

(declare-fun m!23367 () Bool)

(assert (=> mapNonEmpty!1432 m!23367))

(check-sat (not mapNonEmpty!1432) (not b!29159) tp_is_empty!1269 (not b_next!915) (not b!29156) (not b!29152) (not b!29153) (not b!29160) b_and!1725 (not b!29158) (not start!4010))
(check-sat b_and!1725 (not b_next!915))
