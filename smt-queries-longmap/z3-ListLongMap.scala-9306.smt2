; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111458 () Bool)

(assert start!111458)

(declare-fun b!1318052 () Bool)

(declare-fun e!752062 () Bool)

(declare-fun e!752063 () Bool)

(declare-fun mapRes!55259 () Bool)

(assert (=> b!1318052 (= e!752062 (and e!752063 mapRes!55259))))

(declare-fun condMapEmpty!55259 () Bool)

(declare-datatypes ((V!52769 0))(
  ( (V!52770 (val!17949 Int)) )
))
(declare-datatypes ((ValueCell!16976 0))(
  ( (ValueCellFull!16976 (v!20573 V!52769)) (EmptyCell!16976) )
))
(declare-datatypes ((array!88515 0))(
  ( (array!88516 (arr!42731 (Array (_ BitVec 32) ValueCell!16976)) (size!43282 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88515)

(declare-fun mapDefault!55259 () ValueCell!16976)

(assert (=> b!1318052 (= condMapEmpty!55259 (= (arr!42731 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16976)) mapDefault!55259)))))

(declare-fun b!1318053 () Bool)

(declare-fun tp_is_empty!35749 () Bool)

(assert (=> b!1318053 (= e!752063 tp_is_empty!35749)))

(declare-fun mapIsEmpty!55259 () Bool)

(assert (=> mapIsEmpty!55259 mapRes!55259))

(declare-fun b!1318054 () Bool)

(declare-fun res!874546 () Bool)

(declare-fun e!752059 () Bool)

(assert (=> b!1318054 (=> (not res!874546) (not e!752059))))

(declare-datatypes ((array!88517 0))(
  ( (array!88518 (arr!42732 (Array (_ BitVec 32) (_ BitVec 64))) (size!43283 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88517)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88517 (_ BitVec 32)) Bool)

(assert (=> b!1318054 (= res!874546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55259 () Bool)

(declare-fun tp!105365 () Bool)

(declare-fun e!752060 () Bool)

(assert (=> mapNonEmpty!55259 (= mapRes!55259 (and tp!105365 e!752060))))

(declare-fun mapRest!55259 () (Array (_ BitVec 32) ValueCell!16976))

(declare-fun mapValue!55259 () ValueCell!16976)

(declare-fun mapKey!55259 () (_ BitVec 32))

(assert (=> mapNonEmpty!55259 (= (arr!42731 _values!1337) (store mapRest!55259 mapKey!55259 mapValue!55259))))

(declare-fun b!1318056 () Bool)

(assert (=> b!1318056 (= e!752060 tp_is_empty!35749)))

(declare-fun b!1318057 () Bool)

(assert (=> b!1318057 (= e!752059 (bvsgt #b00000000000000000000000000000000 (size!43283 _keys!1609)))))

(declare-fun b!1318055 () Bool)

(declare-fun res!874547 () Bool)

(assert (=> b!1318055 (=> (not res!874547) (not e!752059))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318055 (= res!874547 (and (= (size!43282 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43283 _keys!1609) (size!43282 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!874545 () Bool)

(assert (=> start!111458 (=> (not res!874545) (not e!752059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111458 (= res!874545 (validMask!0 mask!2019))))

(assert (=> start!111458 e!752059))

(assert (=> start!111458 true))

(declare-fun array_inv!32541 (array!88515) Bool)

(assert (=> start!111458 (and (array_inv!32541 _values!1337) e!752062)))

(declare-fun array_inv!32542 (array!88517) Bool)

(assert (=> start!111458 (array_inv!32542 _keys!1609)))

(assert (= (and start!111458 res!874545) b!1318055))

(assert (= (and b!1318055 res!874547) b!1318054))

(assert (= (and b!1318054 res!874546) b!1318057))

(assert (= (and b!1318052 condMapEmpty!55259) mapIsEmpty!55259))

(assert (= (and b!1318052 (not condMapEmpty!55259)) mapNonEmpty!55259))

(get-info :version)

(assert (= (and mapNonEmpty!55259 ((_ is ValueCellFull!16976) mapValue!55259)) b!1318056))

(assert (= (and b!1318052 ((_ is ValueCellFull!16976) mapDefault!55259)) b!1318053))

(assert (= start!111458 b!1318052))

(declare-fun m!1206459 () Bool)

(assert (=> b!1318054 m!1206459))

(declare-fun m!1206461 () Bool)

(assert (=> mapNonEmpty!55259 m!1206461))

(declare-fun m!1206463 () Bool)

(assert (=> start!111458 m!1206463))

(declare-fun m!1206465 () Bool)

(assert (=> start!111458 m!1206465))

(declare-fun m!1206467 () Bool)

(assert (=> start!111458 m!1206467))

(check-sat (not b!1318054) (not start!111458) (not mapNonEmpty!55259) tp_is_empty!35749)
(check-sat)
(get-model)

(declare-fun b!1318102 () Bool)

(declare-fun e!752102 () Bool)

(declare-fun e!752100 () Bool)

(assert (=> b!1318102 (= e!752102 e!752100)))

(declare-fun c!126029 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318102 (= c!126029 (validKeyInArray!0 (select (arr!42732 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun bm!64737 () Bool)

(declare-fun call!64740 () Bool)

(assert (=> bm!64737 (= call!64740 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!143123 () Bool)

(declare-fun res!874570 () Bool)

(assert (=> d!143123 (=> res!874570 e!752102)))

(assert (=> d!143123 (= res!874570 (bvsge #b00000000000000000000000000000000 (size!43283 _keys!1609)))))

(assert (=> d!143123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!752102)))

(declare-fun b!1318103 () Bool)

(assert (=> b!1318103 (= e!752100 call!64740)))

(declare-fun b!1318104 () Bool)

(declare-fun e!752101 () Bool)

(assert (=> b!1318104 (= e!752101 call!64740)))

(declare-fun b!1318105 () Bool)

(assert (=> b!1318105 (= e!752100 e!752101)))

(declare-fun lt!586756 () (_ BitVec 64))

(assert (=> b!1318105 (= lt!586756 (select (arr!42732 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43377 0))(
  ( (Unit!43378) )
))
(declare-fun lt!586754 () Unit!43377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88517 (_ BitVec 64) (_ BitVec 32)) Unit!43377)

(assert (=> b!1318105 (= lt!586754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1318105 (arrayContainsKey!0 _keys!1609 lt!586756 #b00000000000000000000000000000000)))

(declare-fun lt!586755 () Unit!43377)

(assert (=> b!1318105 (= lt!586755 lt!586754)))

(declare-fun res!874571 () Bool)

(declare-datatypes ((SeekEntryResult!9992 0))(
  ( (MissingZero!9992 (index!42339 (_ BitVec 32))) (Found!9992 (index!42340 (_ BitVec 32))) (Intermediate!9992 (undefined!10804 Bool) (index!42341 (_ BitVec 32)) (x!117037 (_ BitVec 32))) (Undefined!9992) (MissingVacant!9992 (index!42342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88517 (_ BitVec 32)) SeekEntryResult!9992)

(assert (=> b!1318105 (= res!874571 (= (seekEntryOrOpen!0 (select (arr!42732 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!9992 #b00000000000000000000000000000000)))))

(assert (=> b!1318105 (=> (not res!874571) (not e!752101))))

(assert (= (and d!143123 (not res!874570)) b!1318102))

(assert (= (and b!1318102 c!126029) b!1318105))

(assert (= (and b!1318102 (not c!126029)) b!1318103))

(assert (= (and b!1318105 res!874571) b!1318104))

(assert (= (or b!1318104 b!1318103) bm!64737))

(declare-fun m!1206489 () Bool)

(assert (=> b!1318102 m!1206489))

(assert (=> b!1318102 m!1206489))

(declare-fun m!1206491 () Bool)

(assert (=> b!1318102 m!1206491))

(declare-fun m!1206493 () Bool)

(assert (=> bm!64737 m!1206493))

(assert (=> b!1318105 m!1206489))

(declare-fun m!1206495 () Bool)

(assert (=> b!1318105 m!1206495))

(declare-fun m!1206497 () Bool)

(assert (=> b!1318105 m!1206497))

(assert (=> b!1318105 m!1206489))

(declare-fun m!1206499 () Bool)

(assert (=> b!1318105 m!1206499))

(assert (=> b!1318054 d!143123))

(declare-fun d!143125 () Bool)

(assert (=> d!143125 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111458 d!143125))

(declare-fun d!143127 () Bool)

(assert (=> d!143127 (= (array_inv!32541 _values!1337) (bvsge (size!43282 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111458 d!143127))

(declare-fun d!143129 () Bool)

(assert (=> d!143129 (= (array_inv!32542 _keys!1609) (bvsge (size!43283 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111458 d!143129))

(declare-fun b!1318113 () Bool)

(declare-fun e!752108 () Bool)

(assert (=> b!1318113 (= e!752108 tp_is_empty!35749)))

(declare-fun mapNonEmpty!55268 () Bool)

(declare-fun mapRes!55268 () Bool)

(declare-fun tp!105374 () Bool)

(declare-fun e!752107 () Bool)

(assert (=> mapNonEmpty!55268 (= mapRes!55268 (and tp!105374 e!752107))))

(declare-fun mapRest!55268 () (Array (_ BitVec 32) ValueCell!16976))

(declare-fun mapKey!55268 () (_ BitVec 32))

(declare-fun mapValue!55268 () ValueCell!16976)

(assert (=> mapNonEmpty!55268 (= mapRest!55259 (store mapRest!55268 mapKey!55268 mapValue!55268))))

(declare-fun mapIsEmpty!55268 () Bool)

(assert (=> mapIsEmpty!55268 mapRes!55268))

(declare-fun b!1318112 () Bool)

(assert (=> b!1318112 (= e!752107 tp_is_empty!35749)))

(declare-fun condMapEmpty!55268 () Bool)

(declare-fun mapDefault!55268 () ValueCell!16976)

(assert (=> mapNonEmpty!55259 (= condMapEmpty!55268 (= mapRest!55259 ((as const (Array (_ BitVec 32) ValueCell!16976)) mapDefault!55268)))))

(assert (=> mapNonEmpty!55259 (= tp!105365 (and e!752108 mapRes!55268))))

(assert (= (and mapNonEmpty!55259 condMapEmpty!55268) mapIsEmpty!55268))

(assert (= (and mapNonEmpty!55259 (not condMapEmpty!55268)) mapNonEmpty!55268))

(assert (= (and mapNonEmpty!55268 ((_ is ValueCellFull!16976) mapValue!55268)) b!1318112))

(assert (= (and mapNonEmpty!55259 ((_ is ValueCellFull!16976) mapDefault!55268)) b!1318113))

(declare-fun m!1206501 () Bool)

(assert (=> mapNonEmpty!55268 m!1206501))

(check-sat (not b!1318105) tp_is_empty!35749 (not b!1318102) (not mapNonEmpty!55268) (not bm!64737))
(check-sat)
