; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!850 () Bool)

(assert start!850)

(declare-fun b_free!243 () Bool)

(declare-fun b_next!243 () Bool)

(assert (=> start!850 (= b_free!243 (not b_next!243))))

(declare-fun tp!958 () Bool)

(declare-fun b_and!389 () Bool)

(assert (=> start!850 (= tp!958 b_and!389)))

(declare-fun b!6913 () Bool)

(declare-fun res!7119 () Bool)

(declare-fun e!3823 () Bool)

(assert (=> b!6913 (=> (not res!7119) (not e!3823))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!605 0))(
  ( (V!606 (val!166 Int)) )
))
(declare-datatypes ((ValueCell!144 0))(
  ( (ValueCellFull!144 (v!1257 V!605)) (EmptyCell!144) )
))
(declare-datatypes ((array!573 0))(
  ( (array!574 (arr!275 (Array (_ BitVec 32) ValueCell!144)) (size!337 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!573)

(declare-fun minValue!1434 () V!605)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!605)

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((array!575 0))(
  ( (array!576 (arr!276 (Array (_ BitVec 32) (_ BitVec 64))) (size!338 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!575)

(declare-datatypes ((tuple2!174 0))(
  ( (tuple2!175 (_1!87 (_ BitVec 64)) (_2!87 V!605)) )
))
(declare-datatypes ((List!183 0))(
  ( (Nil!180) (Cons!179 (h!745 tuple2!174) (t!2318 List!183)) )
))
(declare-datatypes ((ListLongMap!179 0))(
  ( (ListLongMap!180 (toList!105 List!183)) )
))
(declare-fun contains!79 (ListLongMap!179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!64 (array!575 array!573 (_ BitVec 32) (_ BitVec 32) V!605 V!605 (_ BitVec 32) Int) ListLongMap!179)

(assert (=> b!6913 (= res!7119 (contains!79 (getCurrentListMap!64 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6914 () Bool)

(declare-fun res!7120 () Bool)

(assert (=> b!6914 (=> (not res!7120) (not e!3823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!575 (_ BitVec 32)) Bool)

(assert (=> b!6914 (= res!7120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6915 () Bool)

(declare-fun res!7121 () Bool)

(assert (=> b!6915 (=> (not res!7121) (not e!3823))))

(declare-datatypes ((List!184 0))(
  ( (Nil!181) (Cons!180 (h!746 (_ BitVec 64)) (t!2319 List!184)) )
))
(declare-fun arrayNoDuplicates!0 (array!575 (_ BitVec 32) List!184) Bool)

(assert (=> b!6915 (= res!7121 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!181))))

(declare-fun b!6916 () Bool)

(declare-fun res!7118 () Bool)

(assert (=> b!6916 (=> (not res!7118) (not e!3823))))

(assert (=> b!6916 (= res!7118 (and (= (size!337 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!338 _keys!1806) (size!337 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!452 () Bool)

(declare-fun mapRes!452 () Bool)

(assert (=> mapIsEmpty!452 mapRes!452))

(declare-fun b!6918 () Bool)

(declare-fun e!3824 () Bool)

(assert (=> b!6918 (= e!3823 (not e!3824))))

(declare-fun res!7116 () Bool)

(assert (=> b!6918 (=> res!7116 e!3824)))

(declare-fun arrayContainsKey!0 (array!575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6918 (= res!7116 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3821 () Bool)

(assert (=> b!6918 e!3821))

(declare-fun c!497 () Bool)

(assert (=> b!6918 (= c!497 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!125 0))(
  ( (Unit!126) )
))
(declare-fun lt!1363 () Unit!125)

(declare-fun lemmaKeyInListMapIsInArray!44 (array!575 array!573 (_ BitVec 32) (_ BitVec 32) V!605 V!605 (_ BitVec 64) Int) Unit!125)

(assert (=> b!6918 (= lt!1363 (lemmaKeyInListMapIsInArray!44 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6919 () Bool)

(declare-fun res!7115 () Bool)

(declare-fun e!3827 () Bool)

(assert (=> b!6919 (=> res!7115 e!3827)))

(declare-fun lt!1361 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!26 0))(
  ( (MissingZero!26 (index!2223 (_ BitVec 32))) (Found!26 (index!2224 (_ BitVec 32))) (Intermediate!26 (undefined!838 Bool) (index!2225 (_ BitVec 32)) (x!2564 (_ BitVec 32))) (Undefined!26) (MissingVacant!26 (index!2226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!575 (_ BitVec 32)) SeekEntryResult!26)

(assert (=> b!6919 (= res!7115 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!26 lt!1361))))))

(declare-fun b!6920 () Bool)

(declare-fun res!7123 () Bool)

(assert (=> b!6920 (=> (not res!7123) (not e!3823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6920 (= res!7123 (validKeyInArray!0 k0!1278))))

(declare-fun b!6921 () Bool)

(assert (=> b!6921 (= e!3821 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!452 () Bool)

(declare-fun tp!959 () Bool)

(declare-fun e!3820 () Bool)

(assert (=> mapNonEmpty!452 (= mapRes!452 (and tp!959 e!3820))))

(declare-fun mapValue!452 () ValueCell!144)

(declare-fun mapRest!452 () (Array (_ BitVec 32) ValueCell!144))

(declare-fun mapKey!452 () (_ BitVec 32))

(assert (=> mapNonEmpty!452 (= (arr!275 _values!1492) (store mapRest!452 mapKey!452 mapValue!452))))

(declare-fun b!6922 () Bool)

(assert (=> b!6922 (= e!3821 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6917 () Bool)

(declare-fun tp_is_empty!321 () Bool)

(assert (=> b!6917 (= e!3820 tp_is_empty!321)))

(declare-fun res!7117 () Bool)

(assert (=> start!850 (=> (not res!7117) (not e!3823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!850 (= res!7117 (validMask!0 mask!2250))))

(assert (=> start!850 e!3823))

(assert (=> start!850 tp!958))

(assert (=> start!850 true))

(declare-fun e!3826 () Bool)

(declare-fun array_inv!201 (array!573) Bool)

(assert (=> start!850 (and (array_inv!201 _values!1492) e!3826)))

(assert (=> start!850 tp_is_empty!321))

(declare-fun array_inv!202 (array!575) Bool)

(assert (=> start!850 (array_inv!202 _keys!1806)))

(declare-fun b!6923 () Bool)

(assert (=> b!6923 (= e!3824 e!3827)))

(declare-fun res!7122 () Bool)

(assert (=> b!6923 (=> res!7122 e!3827)))

(assert (=> b!6923 (= res!7122 (not (= (size!338 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(assert (=> b!6923 (arrayForallSeekEntryOrOpenFound!0 lt!1361 _keys!1806 mask!2250)))

(declare-fun lt!1364 () Unit!125)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!125)

(assert (=> b!6923 (= lt!1364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1361))))

(declare-fun arrayScanForKey!0 (array!575 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6923 (= lt!1361 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6924 () Bool)

(declare-fun e!3825 () Bool)

(assert (=> b!6924 (= e!3825 tp_is_empty!321)))

(declare-fun b!6925 () Bool)

(assert (=> b!6925 (= e!3826 (and e!3825 mapRes!452))))

(declare-fun condMapEmpty!452 () Bool)

(declare-fun mapDefault!452 () ValueCell!144)

(assert (=> b!6925 (= condMapEmpty!452 (= (arr!275 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!144)) mapDefault!452)))))

(declare-fun b!6926 () Bool)

(assert (=> b!6926 (= e!3827 true)))

(declare-fun lt!1365 () SeekEntryResult!26)

(get-info :version)

(assert (=> b!6926 (and ((_ is Found!26) lt!1365) (= (index!2224 lt!1365) lt!1361))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!575 (_ BitVec 32)) SeekEntryResult!26)

(assert (=> b!6926 (= lt!1365 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!1362 () Unit!125)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!575 (_ BitVec 32)) Unit!125)

(assert (=> b!6926 (= lt!1362 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!1361 _keys!1806 mask!2250))))

(assert (= (and start!850 res!7117) b!6916))

(assert (= (and b!6916 res!7118) b!6914))

(assert (= (and b!6914 res!7120) b!6915))

(assert (= (and b!6915 res!7121) b!6913))

(assert (= (and b!6913 res!7119) b!6920))

(assert (= (and b!6920 res!7123) b!6918))

(assert (= (and b!6918 c!497) b!6922))

(assert (= (and b!6918 (not c!497)) b!6921))

(assert (= (and b!6918 (not res!7116)) b!6923))

(assert (= (and b!6923 (not res!7122)) b!6919))

(assert (= (and b!6919 (not res!7115)) b!6926))

(assert (= (and b!6925 condMapEmpty!452) mapIsEmpty!452))

(assert (= (and b!6925 (not condMapEmpty!452)) mapNonEmpty!452))

(assert (= (and mapNonEmpty!452 ((_ is ValueCellFull!144) mapValue!452)) b!6917))

(assert (= (and b!6925 ((_ is ValueCellFull!144) mapDefault!452)) b!6924))

(assert (= start!850 b!6925))

(declare-fun m!4083 () Bool)

(assert (=> b!6926 m!4083))

(declare-fun m!4085 () Bool)

(assert (=> b!6926 m!4085))

(declare-fun m!4087 () Bool)

(assert (=> start!850 m!4087))

(declare-fun m!4089 () Bool)

(assert (=> start!850 m!4089))

(declare-fun m!4091 () Bool)

(assert (=> start!850 m!4091))

(declare-fun m!4093 () Bool)

(assert (=> b!6920 m!4093))

(declare-fun m!4095 () Bool)

(assert (=> b!6918 m!4095))

(declare-fun m!4097 () Bool)

(assert (=> b!6918 m!4097))

(declare-fun m!4099 () Bool)

(assert (=> mapNonEmpty!452 m!4099))

(assert (=> b!6922 m!4095))

(declare-fun m!4101 () Bool)

(assert (=> b!6919 m!4101))

(declare-fun m!4103 () Bool)

(assert (=> b!6914 m!4103))

(declare-fun m!4105 () Bool)

(assert (=> b!6915 m!4105))

(declare-fun m!4107 () Bool)

(assert (=> b!6913 m!4107))

(assert (=> b!6913 m!4107))

(declare-fun m!4109 () Bool)

(assert (=> b!6913 m!4109))

(declare-fun m!4111 () Bool)

(assert (=> b!6923 m!4111))

(declare-fun m!4113 () Bool)

(assert (=> b!6923 m!4113))

(declare-fun m!4115 () Bool)

(assert (=> b!6923 m!4115))

(check-sat tp_is_empty!321 (not b!6914) (not start!850) (not b!6918) (not b!6923) (not b!6922) b_and!389 (not b_next!243) (not b!6920) (not b!6913) (not b!6919) (not b!6926) (not b!6915) (not mapNonEmpty!452))
(check-sat b_and!389 (not b_next!243))
