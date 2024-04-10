; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!856 () Bool)

(assert start!856)

(declare-fun b_free!249 () Bool)

(declare-fun b_next!249 () Bool)

(assert (=> start!856 (= b_free!249 (not b_next!249))))

(declare-fun tp!977 () Bool)

(declare-fun b_and!395 () Bool)

(assert (=> start!856 (= tp!977 b_and!395)))

(declare-fun mapIsEmpty!461 () Bool)

(declare-fun mapRes!461 () Bool)

(assert (=> mapIsEmpty!461 mapRes!461))

(declare-fun b!7039 () Bool)

(declare-fun res!7199 () Bool)

(declare-fun e!3896 () Bool)

(assert (=> b!7039 (=> (not res!7199) (not e!3896))))

(declare-datatypes ((array!585 0))(
  ( (array!586 (arr!281 (Array (_ BitVec 32) (_ BitVec 64))) (size!343 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!585)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!585 (_ BitVec 32)) Bool)

(assert (=> b!7039 (= res!7199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7040 () Bool)

(declare-fun res!7204 () Bool)

(assert (=> b!7040 (=> (not res!7204) (not e!3896))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!7040 (= res!7204 (validKeyInArray!0 k0!1278))))

(declare-fun b!7041 () Bool)

(declare-fun res!7201 () Bool)

(assert (=> b!7041 (=> (not res!7201) (not e!3896))))

(declare-datatypes ((List!188 0))(
  ( (Nil!185) (Cons!184 (h!750 (_ BitVec 64)) (t!2323 List!188)) )
))
(declare-fun arrayNoDuplicates!0 (array!585 (_ BitVec 32) List!188) Bool)

(assert (=> b!7041 (= res!7201 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!185))))

(declare-fun b!7042 () Bool)

(declare-fun res!7203 () Bool)

(assert (=> b!7042 (=> (not res!7203) (not e!3896))))

(declare-datatypes ((V!613 0))(
  ( (V!614 (val!169 Int)) )
))
(declare-datatypes ((ValueCell!147 0))(
  ( (ValueCellFull!147 (v!1260 V!613)) (EmptyCell!147) )
))
(declare-datatypes ((array!587 0))(
  ( (array!588 (arr!282 (Array (_ BitVec 32) ValueCell!147)) (size!344 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!587)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7042 (= res!7203 (and (= (size!344 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!343 _keys!1806) (size!344 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7043 () Bool)

(declare-fun e!3899 () Bool)

(assert (=> b!7043 (= e!3896 (not e!3899))))

(declare-fun res!7197 () Bool)

(assert (=> b!7043 (=> res!7197 e!3899)))

(declare-fun arrayContainsKey!0 (array!585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!7043 (= res!7197 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3894 () Bool)

(assert (=> b!7043 e!3894))

(declare-fun c!506 () Bool)

(assert (=> b!7043 (= c!506 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((Unit!131 0))(
  ( (Unit!132) )
))
(declare-fun lt!1409 () Unit!131)

(declare-fun minValue!1434 () V!613)

(declare-fun zeroValue!1434 () V!613)

(declare-fun lemmaKeyInListMapIsInArray!47 (array!585 array!587 (_ BitVec 32) (_ BitVec 32) V!613 V!613 (_ BitVec 64) Int) Unit!131)

(assert (=> b!7043 (= lt!1409 (lemmaKeyInListMapIsInArray!47 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!7044 () Bool)

(assert (=> b!7044 (= e!3894 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!461 () Bool)

(declare-fun tp!976 () Bool)

(declare-fun e!3893 () Bool)

(assert (=> mapNonEmpty!461 (= mapRes!461 (and tp!976 e!3893))))

(declare-fun mapKey!461 () (_ BitVec 32))

(declare-fun mapRest!461 () (Array (_ BitVec 32) ValueCell!147))

(declare-fun mapValue!461 () ValueCell!147)

(assert (=> mapNonEmpty!461 (= (arr!282 _values!1492) (store mapRest!461 mapKey!461 mapValue!461))))

(declare-fun b!7045 () Bool)

(declare-fun e!3895 () Bool)

(assert (=> b!7045 (= e!3895 true)))

(declare-datatypes ((SeekEntryResult!28 0))(
  ( (MissingZero!28 (index!2231 (_ BitVec 32))) (Found!28 (index!2232 (_ BitVec 32))) (Intermediate!28 (undefined!840 Bool) (index!2233 (_ BitVec 32)) (x!2574 (_ BitVec 32))) (Undefined!28) (MissingVacant!28 (index!2234 (_ BitVec 32))) )
))
(declare-fun lt!1408 () SeekEntryResult!28)

(declare-fun lt!1410 () (_ BitVec 32))

(get-info :version)

(assert (=> b!7045 (and ((_ is Found!28) lt!1408) (= (index!2232 lt!1408) lt!1410))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!585 (_ BitVec 32)) SeekEntryResult!28)

(assert (=> b!7045 (= lt!1408 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!1407 () Unit!131)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!585 (_ BitVec 32)) Unit!131)

(assert (=> b!7045 (= lt!1407 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!1410 _keys!1806 mask!2250))))

(declare-fun b!7046 () Bool)

(declare-fun e!3892 () Bool)

(declare-fun tp_is_empty!327 () Bool)

(assert (=> b!7046 (= e!3892 tp_is_empty!327)))

(declare-fun b!7047 () Bool)

(assert (=> b!7047 (= e!3894 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!7048 () Bool)

(declare-fun res!7202 () Bool)

(assert (=> b!7048 (=> res!7202 e!3895)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!585 (_ BitVec 32)) SeekEntryResult!28)

(assert (=> b!7048 (= res!7202 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!28 lt!1410))))))

(declare-fun b!7049 () Bool)

(assert (=> b!7049 (= e!3893 tp_is_empty!327)))

(declare-fun b!7050 () Bool)

(assert (=> b!7050 (= e!3899 e!3895)))

(declare-fun res!7200 () Bool)

(assert (=> b!7050 (=> res!7200 e!3895)))

(assert (=> b!7050 (= res!7200 (not (= (size!343 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(assert (=> b!7050 (arrayForallSeekEntryOrOpenFound!0 lt!1410 _keys!1806 mask!2250)))

(declare-fun lt!1406 () Unit!131)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!131)

(assert (=> b!7050 (= lt!1406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1410))))

(declare-fun arrayScanForKey!0 (array!585 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!7050 (= lt!1410 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun res!7196 () Bool)

(assert (=> start!856 (=> (not res!7196) (not e!3896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!856 (= res!7196 (validMask!0 mask!2250))))

(assert (=> start!856 e!3896))

(assert (=> start!856 tp!977))

(assert (=> start!856 true))

(declare-fun e!3897 () Bool)

(declare-fun array_inv!205 (array!587) Bool)

(assert (=> start!856 (and (array_inv!205 _values!1492) e!3897)))

(assert (=> start!856 tp_is_empty!327))

(declare-fun array_inv!206 (array!585) Bool)

(assert (=> start!856 (array_inv!206 _keys!1806)))

(declare-fun b!7051 () Bool)

(declare-fun res!7198 () Bool)

(assert (=> b!7051 (=> (not res!7198) (not e!3896))))

(declare-datatypes ((tuple2!178 0))(
  ( (tuple2!179 (_1!89 (_ BitVec 64)) (_2!89 V!613)) )
))
(declare-datatypes ((List!189 0))(
  ( (Nil!186) (Cons!185 (h!751 tuple2!178) (t!2324 List!189)) )
))
(declare-datatypes ((ListLongMap!183 0))(
  ( (ListLongMap!184 (toList!107 List!189)) )
))
(declare-fun contains!81 (ListLongMap!183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!66 (array!585 array!587 (_ BitVec 32) (_ BitVec 32) V!613 V!613 (_ BitVec 32) Int) ListLongMap!183)

(assert (=> b!7051 (= res!7198 (contains!81 (getCurrentListMap!66 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!7052 () Bool)

(assert (=> b!7052 (= e!3897 (and e!3892 mapRes!461))))

(declare-fun condMapEmpty!461 () Bool)

(declare-fun mapDefault!461 () ValueCell!147)

(assert (=> b!7052 (= condMapEmpty!461 (= (arr!282 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!147)) mapDefault!461)))))

(assert (= (and start!856 res!7196) b!7042))

(assert (= (and b!7042 res!7203) b!7039))

(assert (= (and b!7039 res!7199) b!7041))

(assert (= (and b!7041 res!7201) b!7051))

(assert (= (and b!7051 res!7198) b!7040))

(assert (= (and b!7040 res!7204) b!7043))

(assert (= (and b!7043 c!506) b!7044))

(assert (= (and b!7043 (not c!506)) b!7047))

(assert (= (and b!7043 (not res!7197)) b!7050))

(assert (= (and b!7050 (not res!7200)) b!7048))

(assert (= (and b!7048 (not res!7202)) b!7045))

(assert (= (and b!7052 condMapEmpty!461) mapIsEmpty!461))

(assert (= (and b!7052 (not condMapEmpty!461)) mapNonEmpty!461))

(assert (= (and mapNonEmpty!461 ((_ is ValueCellFull!147) mapValue!461)) b!7049))

(assert (= (and b!7052 ((_ is ValueCellFull!147) mapDefault!461)) b!7046))

(assert (= start!856 b!7052))

(declare-fun m!4185 () Bool)

(assert (=> b!7043 m!4185))

(declare-fun m!4187 () Bool)

(assert (=> b!7043 m!4187))

(declare-fun m!4189 () Bool)

(assert (=> start!856 m!4189))

(declare-fun m!4191 () Bool)

(assert (=> start!856 m!4191))

(declare-fun m!4193 () Bool)

(assert (=> start!856 m!4193))

(declare-fun m!4195 () Bool)

(assert (=> b!7040 m!4195))

(declare-fun m!4197 () Bool)

(assert (=> b!7051 m!4197))

(assert (=> b!7051 m!4197))

(declare-fun m!4199 () Bool)

(assert (=> b!7051 m!4199))

(declare-fun m!4201 () Bool)

(assert (=> b!7050 m!4201))

(declare-fun m!4203 () Bool)

(assert (=> b!7050 m!4203))

(declare-fun m!4205 () Bool)

(assert (=> b!7050 m!4205))

(assert (=> b!7044 m!4185))

(declare-fun m!4207 () Bool)

(assert (=> mapNonEmpty!461 m!4207))

(declare-fun m!4209 () Bool)

(assert (=> b!7039 m!4209))

(declare-fun m!4211 () Bool)

(assert (=> b!7041 m!4211))

(declare-fun m!4213 () Bool)

(assert (=> b!7048 m!4213))

(declare-fun m!4215 () Bool)

(assert (=> b!7045 m!4215))

(declare-fun m!4217 () Bool)

(assert (=> b!7045 m!4217))

(check-sat (not b!7051) (not b!7048) (not b!7040) (not b!7044) tp_is_empty!327 (not b!7043) (not start!856) (not mapNonEmpty!461) (not b!7045) (not b!7050) b_and!395 (not b!7039) (not b_next!249) (not b!7041))
(check-sat b_and!395 (not b_next!249))
