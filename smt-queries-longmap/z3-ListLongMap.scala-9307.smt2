; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111248 () Bool)

(assert start!111248)

(declare-fun mapIsEmpty!55271 () Bool)

(declare-fun mapRes!55271 () Bool)

(assert (=> mapIsEmpty!55271 mapRes!55271))

(declare-fun b!1316757 () Bool)

(declare-fun e!751243 () Bool)

(declare-fun tp_is_empty!35755 () Bool)

(assert (=> b!1316757 (= e!751243 tp_is_empty!35755)))

(declare-fun mapNonEmpty!55271 () Bool)

(declare-fun tp!105378 () Bool)

(declare-fun e!751245 () Bool)

(assert (=> mapNonEmpty!55271 (= mapRes!55271 (and tp!105378 e!751245))))

(declare-datatypes ((V!52777 0))(
  ( (V!52778 (val!17952 Int)) )
))
(declare-datatypes ((ValueCell!16979 0))(
  ( (ValueCellFull!16979 (v!20580 V!52777)) (EmptyCell!16979) )
))
(declare-fun mapValue!55271 () ValueCell!16979)

(declare-fun mapRest!55271 () (Array (_ BitVec 32) ValueCell!16979))

(declare-fun mapKey!55271 () (_ BitVec 32))

(declare-datatypes ((array!88381 0))(
  ( (array!88382 (arr!42668 (Array (_ BitVec 32) ValueCell!16979)) (size!43220 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88381)

(assert (=> mapNonEmpty!55271 (= (arr!42668 _values!1337) (store mapRest!55271 mapKey!55271 mapValue!55271))))

(declare-fun b!1316758 () Bool)

(declare-fun res!874031 () Bool)

(declare-fun e!751247 () Bool)

(assert (=> b!1316758 (=> (not res!874031) (not e!751247))))

(declare-datatypes ((array!88383 0))(
  ( (array!88384 (arr!42669 (Array (_ BitVec 32) (_ BitVec 64))) (size!43221 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88383)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88383 (_ BitVec 32)) Bool)

(assert (=> b!1316758 (= res!874031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1316759 () Bool)

(assert (=> b!1316759 (= e!751247 (and (bvsle #b00000000000000000000000000000000 (size!43221 _keys!1609)) (bvsge (size!43221 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun res!874032 () Bool)

(assert (=> start!111248 (=> (not res!874032) (not e!751247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111248 (= res!874032 (validMask!0 mask!2019))))

(assert (=> start!111248 e!751247))

(assert (=> start!111248 true))

(declare-fun e!751246 () Bool)

(declare-fun array_inv!32407 (array!88381) Bool)

(assert (=> start!111248 (and (array_inv!32407 _values!1337) e!751246)))

(declare-fun array_inv!32408 (array!88383) Bool)

(assert (=> start!111248 (array_inv!32408 _keys!1609)))

(declare-fun b!1316760 () Bool)

(assert (=> b!1316760 (= e!751245 tp_is_empty!35755)))

(declare-fun b!1316761 () Bool)

(assert (=> b!1316761 (= e!751246 (and e!751243 mapRes!55271))))

(declare-fun condMapEmpty!55271 () Bool)

(declare-fun mapDefault!55271 () ValueCell!16979)

(assert (=> b!1316761 (= condMapEmpty!55271 (= (arr!42668 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16979)) mapDefault!55271)))))

(declare-fun b!1316762 () Bool)

(declare-fun res!874033 () Bool)

(assert (=> b!1316762 (=> (not res!874033) (not e!751247))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1316762 (= res!874033 (and (= (size!43220 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43221 _keys!1609) (size!43220 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111248 res!874032) b!1316762))

(assert (= (and b!1316762 res!874033) b!1316758))

(assert (= (and b!1316758 res!874031) b!1316759))

(assert (= (and b!1316761 condMapEmpty!55271) mapIsEmpty!55271))

(assert (= (and b!1316761 (not condMapEmpty!55271)) mapNonEmpty!55271))

(get-info :version)

(assert (= (and mapNonEmpty!55271 ((_ is ValueCellFull!16979) mapValue!55271)) b!1316760))

(assert (= (and b!1316761 ((_ is ValueCellFull!16979) mapDefault!55271)) b!1316757))

(assert (= start!111248 b!1316761))

(declare-fun m!1204389 () Bool)

(assert (=> mapNonEmpty!55271 m!1204389))

(declare-fun m!1204391 () Bool)

(assert (=> b!1316758 m!1204391))

(declare-fun m!1204393 () Bool)

(assert (=> start!111248 m!1204393))

(declare-fun m!1204395 () Bool)

(assert (=> start!111248 m!1204395))

(declare-fun m!1204397 () Bool)

(assert (=> start!111248 m!1204397))

(check-sat (not start!111248) (not b!1316758) (not mapNonEmpty!55271) tp_is_empty!35755)
(check-sat)
(get-model)

(declare-fun d!142573 () Bool)

(assert (=> d!142573 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111248 d!142573))

(declare-fun d!142575 () Bool)

(assert (=> d!142575 (= (array_inv!32407 _values!1337) (bvsge (size!43220 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111248 d!142575))

(declare-fun d!142577 () Bool)

(assert (=> d!142577 (= (array_inv!32408 _keys!1609) (bvsge (size!43221 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111248 d!142577))

(declare-fun b!1316807 () Bool)

(declare-fun e!751284 () Bool)

(declare-fun e!751286 () Bool)

(assert (=> b!1316807 (= e!751284 e!751286)))

(declare-fun lt!586103 () (_ BitVec 64))

(assert (=> b!1316807 (= lt!586103 (select (arr!42669 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43245 0))(
  ( (Unit!43246) )
))
(declare-fun lt!586102 () Unit!43245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88383 (_ BitVec 64) (_ BitVec 32)) Unit!43245)

(assert (=> b!1316807 (= lt!586102 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586103 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1316807 (arrayContainsKey!0 _keys!1609 lt!586103 #b00000000000000000000000000000000)))

(declare-fun lt!586101 () Unit!43245)

(assert (=> b!1316807 (= lt!586101 lt!586102)))

(declare-fun res!874056 () Bool)

(declare-datatypes ((SeekEntryResult!10036 0))(
  ( (MissingZero!10036 (index!42515 (_ BitVec 32))) (Found!10036 (index!42516 (_ BitVec 32))) (Intermediate!10036 (undefined!10848 Bool) (index!42517 (_ BitVec 32)) (x!117066 (_ BitVec 32))) (Undefined!10036) (MissingVacant!10036 (index!42518 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88383 (_ BitVec 32)) SeekEntryResult!10036)

(assert (=> b!1316807 (= res!874056 (= (seekEntryOrOpen!0 (select (arr!42669 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10036 #b00000000000000000000000000000000)))))

(assert (=> b!1316807 (=> (not res!874056) (not e!751286))))

(declare-fun b!1316808 () Bool)

(declare-fun call!64659 () Bool)

(assert (=> b!1316808 (= e!751284 call!64659)))

(declare-fun b!1316809 () Bool)

(declare-fun e!751285 () Bool)

(assert (=> b!1316809 (= e!751285 e!751284)))

(declare-fun c!125616 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316809 (= c!125616 (validKeyInArray!0 (select (arr!42669 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun bm!64656 () Bool)

(assert (=> bm!64656 (= call!64659 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!142579 () Bool)

(declare-fun res!874057 () Bool)

(assert (=> d!142579 (=> res!874057 e!751285)))

(assert (=> d!142579 (= res!874057 (bvsge #b00000000000000000000000000000000 (size!43221 _keys!1609)))))

(assert (=> d!142579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!751285)))

(declare-fun b!1316810 () Bool)

(assert (=> b!1316810 (= e!751286 call!64659)))

(assert (= (and d!142579 (not res!874057)) b!1316809))

(assert (= (and b!1316809 c!125616) b!1316807))

(assert (= (and b!1316809 (not c!125616)) b!1316808))

(assert (= (and b!1316807 res!874056) b!1316810))

(assert (= (or b!1316810 b!1316808) bm!64656))

(declare-fun m!1204419 () Bool)

(assert (=> b!1316807 m!1204419))

(declare-fun m!1204421 () Bool)

(assert (=> b!1316807 m!1204421))

(declare-fun m!1204423 () Bool)

(assert (=> b!1316807 m!1204423))

(assert (=> b!1316807 m!1204419))

(declare-fun m!1204425 () Bool)

(assert (=> b!1316807 m!1204425))

(assert (=> b!1316809 m!1204419))

(assert (=> b!1316809 m!1204419))

(declare-fun m!1204427 () Bool)

(assert (=> b!1316809 m!1204427))

(declare-fun m!1204429 () Bool)

(assert (=> bm!64656 m!1204429))

(assert (=> b!1316758 d!142579))

(declare-fun condMapEmpty!55280 () Bool)

(declare-fun mapDefault!55280 () ValueCell!16979)

(assert (=> mapNonEmpty!55271 (= condMapEmpty!55280 (= mapRest!55271 ((as const (Array (_ BitVec 32) ValueCell!16979)) mapDefault!55280)))))

(declare-fun e!751292 () Bool)

(declare-fun mapRes!55280 () Bool)

(assert (=> mapNonEmpty!55271 (= tp!105378 (and e!751292 mapRes!55280))))

(declare-fun mapIsEmpty!55280 () Bool)

(assert (=> mapIsEmpty!55280 mapRes!55280))

(declare-fun b!1316818 () Bool)

(assert (=> b!1316818 (= e!751292 tp_is_empty!35755)))

(declare-fun b!1316817 () Bool)

(declare-fun e!751291 () Bool)

(assert (=> b!1316817 (= e!751291 tp_is_empty!35755)))

(declare-fun mapNonEmpty!55280 () Bool)

(declare-fun tp!105387 () Bool)

(assert (=> mapNonEmpty!55280 (= mapRes!55280 (and tp!105387 e!751291))))

(declare-fun mapKey!55280 () (_ BitVec 32))

(declare-fun mapValue!55280 () ValueCell!16979)

(declare-fun mapRest!55280 () (Array (_ BitVec 32) ValueCell!16979))

(assert (=> mapNonEmpty!55280 (= mapRest!55271 (store mapRest!55280 mapKey!55280 mapValue!55280))))

(assert (= (and mapNonEmpty!55271 condMapEmpty!55280) mapIsEmpty!55280))

(assert (= (and mapNonEmpty!55271 (not condMapEmpty!55280)) mapNonEmpty!55280))

(assert (= (and mapNonEmpty!55280 ((_ is ValueCellFull!16979) mapValue!55280)) b!1316817))

(assert (= (and mapNonEmpty!55271 ((_ is ValueCellFull!16979) mapDefault!55280)) b!1316818))

(declare-fun m!1204431 () Bool)

(assert (=> mapNonEmpty!55280 m!1204431))

(check-sat (not bm!64656) (not mapNonEmpty!55280) (not b!1316807) tp_is_empty!35755 (not b!1316809))
(check-sat)
