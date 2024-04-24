; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111472 () Bool)

(assert start!111472)

(declare-fun mapIsEmpty!55271 () Bool)

(declare-fun mapRes!55271 () Bool)

(assert (=> mapIsEmpty!55271 mapRes!55271))

(declare-fun mapNonEmpty!55271 () Bool)

(declare-fun tp!105377 () Bool)

(declare-fun e!752122 () Bool)

(assert (=> mapNonEmpty!55271 (= mapRes!55271 (and tp!105377 e!752122))))

(declare-datatypes ((V!52777 0))(
  ( (V!52778 (val!17952 Int)) )
))
(declare-datatypes ((ValueCell!16979 0))(
  ( (ValueCellFull!16979 (v!20576 V!52777)) (EmptyCell!16979) )
))
(declare-datatypes ((array!88527 0))(
  ( (array!88528 (arr!42736 (Array (_ BitVec 32) ValueCell!16979)) (size!43287 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88527)

(declare-fun mapValue!55271 () ValueCell!16979)

(declare-fun mapKey!55271 () (_ BitVec 32))

(declare-fun mapRest!55271 () (Array (_ BitVec 32) ValueCell!16979))

(assert (=> mapNonEmpty!55271 (= (arr!42736 _values!1337) (store mapRest!55271 mapKey!55271 mapValue!55271))))

(declare-fun b!1318126 () Bool)

(declare-fun res!874579 () Bool)

(declare-fun e!752121 () Bool)

(assert (=> b!1318126 (=> (not res!874579) (not e!752121))))

(declare-datatypes ((array!88529 0))(
  ( (array!88530 (arr!42737 (Array (_ BitVec 32) (_ BitVec 64))) (size!43288 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88529)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1318126 (= res!874579 (and (= (size!43287 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43288 _keys!1609) (size!43287 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318127 () Bool)

(declare-fun e!752120 () Bool)

(declare-fun e!752123 () Bool)

(assert (=> b!1318127 (= e!752120 (and e!752123 mapRes!55271))))

(declare-fun condMapEmpty!55271 () Bool)

(declare-fun mapDefault!55271 () ValueCell!16979)

(assert (=> b!1318127 (= condMapEmpty!55271 (= (arr!42736 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16979)) mapDefault!55271)))))

(declare-fun b!1318128 () Bool)

(declare-fun tp_is_empty!35755 () Bool)

(assert (=> b!1318128 (= e!752123 tp_is_empty!35755)))

(declare-fun b!1318129 () Bool)

(declare-fun res!874578 () Bool)

(assert (=> b!1318129 (=> (not res!874578) (not e!752121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88529 (_ BitVec 32)) Bool)

(assert (=> b!1318129 (= res!874578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!874580 () Bool)

(assert (=> start!111472 (=> (not res!874580) (not e!752121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111472 (= res!874580 (validMask!0 mask!2019))))

(assert (=> start!111472 e!752121))

(assert (=> start!111472 true))

(declare-fun array_inv!32545 (array!88527) Bool)

(assert (=> start!111472 (and (array_inv!32545 _values!1337) e!752120)))

(declare-fun array_inv!32546 (array!88529) Bool)

(assert (=> start!111472 (array_inv!32546 _keys!1609)))

(declare-fun b!1318130 () Bool)

(assert (=> b!1318130 (= e!752122 tp_is_empty!35755)))

(declare-fun b!1318131 () Bool)

(assert (=> b!1318131 (= e!752121 (and (bvsle #b00000000000000000000000000000000 (size!43288 _keys!1609)) (bvsge (size!43288 _keys!1609) #b01111111111111111111111111111111)))))

(assert (= (and start!111472 res!874580) b!1318126))

(assert (= (and b!1318126 res!874579) b!1318129))

(assert (= (and b!1318129 res!874578) b!1318131))

(assert (= (and b!1318127 condMapEmpty!55271) mapIsEmpty!55271))

(assert (= (and b!1318127 (not condMapEmpty!55271)) mapNonEmpty!55271))

(get-info :version)

(assert (= (and mapNonEmpty!55271 ((_ is ValueCellFull!16979) mapValue!55271)) b!1318130))

(assert (= (and b!1318127 ((_ is ValueCellFull!16979) mapDefault!55271)) b!1318128))

(assert (= start!111472 b!1318127))

(declare-fun m!1206503 () Bool)

(assert (=> mapNonEmpty!55271 m!1206503))

(declare-fun m!1206505 () Bool)

(assert (=> b!1318129 m!1206505))

(declare-fun m!1206507 () Bool)

(assert (=> start!111472 m!1206507))

(declare-fun m!1206509 () Bool)

(assert (=> start!111472 m!1206509))

(declare-fun m!1206511 () Bool)

(assert (=> start!111472 m!1206511))

(check-sat (not start!111472) (not b!1318129) (not mapNonEmpty!55271) tp_is_empty!35755)
(check-sat)
(get-model)

(declare-fun d!143133 () Bool)

(assert (=> d!143133 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111472 d!143133))

(declare-fun d!143135 () Bool)

(assert (=> d!143135 (= (array_inv!32545 _values!1337) (bvsge (size!43287 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111472 d!143135))

(declare-fun d!143137 () Bool)

(assert (=> d!143137 (= (array_inv!32546 _keys!1609) (bvsge (size!43288 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111472 d!143137))

(declare-fun b!1318176 () Bool)

(declare-fun e!752162 () Bool)

(declare-fun call!64743 () Bool)

(assert (=> b!1318176 (= e!752162 call!64743)))

(declare-fun d!143139 () Bool)

(declare-fun res!874603 () Bool)

(declare-fun e!752160 () Bool)

(assert (=> d!143139 (=> res!874603 e!752160)))

(assert (=> d!143139 (= res!874603 (bvsge #b00000000000000000000000000000000 (size!43288 _keys!1609)))))

(assert (=> d!143139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!752160)))

(declare-fun b!1318177 () Bool)

(declare-fun e!752161 () Bool)

(assert (=> b!1318177 (= e!752161 call!64743)))

(declare-fun bm!64740 () Bool)

(assert (=> bm!64740 (= call!64743 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1318178 () Bool)

(assert (=> b!1318178 (= e!752162 e!752161)))

(declare-fun lt!586765 () (_ BitVec 64))

(assert (=> b!1318178 (= lt!586765 (select (arr!42737 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43379 0))(
  ( (Unit!43380) )
))
(declare-fun lt!586763 () Unit!43379)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88529 (_ BitVec 64) (_ BitVec 32)) Unit!43379)

(assert (=> b!1318178 (= lt!586763 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586765 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1318178 (arrayContainsKey!0 _keys!1609 lt!586765 #b00000000000000000000000000000000)))

(declare-fun lt!586764 () Unit!43379)

(assert (=> b!1318178 (= lt!586764 lt!586763)))

(declare-fun res!874604 () Bool)

(declare-datatypes ((SeekEntryResult!9993 0))(
  ( (MissingZero!9993 (index!42343 (_ BitVec 32))) (Found!9993 (index!42344 (_ BitVec 32))) (Intermediate!9993 (undefined!10805 Bool) (index!42345 (_ BitVec 32)) (x!117048 (_ BitVec 32))) (Undefined!9993) (MissingVacant!9993 (index!42346 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88529 (_ BitVec 32)) SeekEntryResult!9993)

(assert (=> b!1318178 (= res!874604 (= (seekEntryOrOpen!0 (select (arr!42737 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!9993 #b00000000000000000000000000000000)))))

(assert (=> b!1318178 (=> (not res!874604) (not e!752161))))

(declare-fun b!1318179 () Bool)

(assert (=> b!1318179 (= e!752160 e!752162)))

(declare-fun c!126032 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318179 (= c!126032 (validKeyInArray!0 (select (arr!42737 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!143139 (not res!874603)) b!1318179))

(assert (= (and b!1318179 c!126032) b!1318178))

(assert (= (and b!1318179 (not c!126032)) b!1318176))

(assert (= (and b!1318178 res!874604) b!1318177))

(assert (= (or b!1318177 b!1318176) bm!64740))

(declare-fun m!1206533 () Bool)

(assert (=> bm!64740 m!1206533))

(declare-fun m!1206535 () Bool)

(assert (=> b!1318178 m!1206535))

(declare-fun m!1206537 () Bool)

(assert (=> b!1318178 m!1206537))

(declare-fun m!1206539 () Bool)

(assert (=> b!1318178 m!1206539))

(assert (=> b!1318178 m!1206535))

(declare-fun m!1206541 () Bool)

(assert (=> b!1318178 m!1206541))

(assert (=> b!1318179 m!1206535))

(assert (=> b!1318179 m!1206535))

(declare-fun m!1206543 () Bool)

(assert (=> b!1318179 m!1206543))

(assert (=> b!1318129 d!143139))

(declare-fun b!1318186 () Bool)

(declare-fun e!752168 () Bool)

(assert (=> b!1318186 (= e!752168 tp_is_empty!35755)))

(declare-fun mapNonEmpty!55280 () Bool)

(declare-fun mapRes!55280 () Bool)

(declare-fun tp!105386 () Bool)

(assert (=> mapNonEmpty!55280 (= mapRes!55280 (and tp!105386 e!752168))))

(declare-fun mapKey!55280 () (_ BitVec 32))

(declare-fun mapRest!55280 () (Array (_ BitVec 32) ValueCell!16979))

(declare-fun mapValue!55280 () ValueCell!16979)

(assert (=> mapNonEmpty!55280 (= mapRest!55271 (store mapRest!55280 mapKey!55280 mapValue!55280))))

(declare-fun mapIsEmpty!55280 () Bool)

(assert (=> mapIsEmpty!55280 mapRes!55280))

(declare-fun b!1318187 () Bool)

(declare-fun e!752167 () Bool)

(assert (=> b!1318187 (= e!752167 tp_is_empty!35755)))

(declare-fun condMapEmpty!55280 () Bool)

(declare-fun mapDefault!55280 () ValueCell!16979)

(assert (=> mapNonEmpty!55271 (= condMapEmpty!55280 (= mapRest!55271 ((as const (Array (_ BitVec 32) ValueCell!16979)) mapDefault!55280)))))

(assert (=> mapNonEmpty!55271 (= tp!105377 (and e!752167 mapRes!55280))))

(assert (= (and mapNonEmpty!55271 condMapEmpty!55280) mapIsEmpty!55280))

(assert (= (and mapNonEmpty!55271 (not condMapEmpty!55280)) mapNonEmpty!55280))

(assert (= (and mapNonEmpty!55280 ((_ is ValueCellFull!16979) mapValue!55280)) b!1318186))

(assert (= (and mapNonEmpty!55271 ((_ is ValueCellFull!16979) mapDefault!55280)) b!1318187))

(declare-fun m!1206545 () Bool)

(assert (=> mapNonEmpty!55280 m!1206545))

(check-sat (not b!1318178) (not b!1318179) tp_is_empty!35755 (not mapNonEmpty!55280) (not bm!64740))
(check-sat)
