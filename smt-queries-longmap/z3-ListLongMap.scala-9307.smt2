; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111250 () Bool)

(assert start!111250)

(declare-fun b!1316845 () Bool)

(declare-fun e!751295 () Bool)

(declare-datatypes ((array!88474 0))(
  ( (array!88475 (arr!42714 (Array (_ BitVec 32) (_ BitVec 64))) (size!43264 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88474)

(assert (=> b!1316845 (= e!751295 (and (bvsle #b00000000000000000000000000000000 (size!43264 _keys!1609)) (bvsge (size!43264 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun b!1316846 () Bool)

(declare-fun e!751294 () Bool)

(declare-fun tp_is_empty!35757 () Bool)

(assert (=> b!1316846 (= e!751294 tp_is_empty!35757)))

(declare-fun b!1316847 () Bool)

(declare-fun res!874069 () Bool)

(assert (=> b!1316847 (=> (not res!874069) (not e!751295))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88474 (_ BitVec 32)) Bool)

(assert (=> b!1316847 (= res!874069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1316848 () Bool)

(declare-fun e!751291 () Bool)

(assert (=> b!1316848 (= e!751291 tp_is_empty!35757)))

(declare-fun b!1316849 () Bool)

(declare-fun e!751293 () Bool)

(declare-fun mapRes!55274 () Bool)

(assert (=> b!1316849 (= e!751293 (and e!751294 mapRes!55274))))

(declare-fun condMapEmpty!55274 () Bool)

(declare-datatypes ((V!52779 0))(
  ( (V!52780 (val!17953 Int)) )
))
(declare-datatypes ((ValueCell!16980 0))(
  ( (ValueCellFull!16980 (v!20582 V!52779)) (EmptyCell!16980) )
))
(declare-datatypes ((array!88476 0))(
  ( (array!88477 (arr!42715 (Array (_ BitVec 32) ValueCell!16980)) (size!43265 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88476)

(declare-fun mapDefault!55274 () ValueCell!16980)

(assert (=> b!1316849 (= condMapEmpty!55274 (= (arr!42715 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16980)) mapDefault!55274)))))

(declare-fun b!1316850 () Bool)

(declare-fun res!874070 () Bool)

(assert (=> b!1316850 (=> (not res!874070) (not e!751295))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1316850 (= res!874070 (and (= (size!43265 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43264 _keys!1609) (size!43265 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55274 () Bool)

(assert (=> mapIsEmpty!55274 mapRes!55274))

(declare-fun res!874071 () Bool)

(assert (=> start!111250 (=> (not res!874071) (not e!751295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111250 (= res!874071 (validMask!0 mask!2019))))

(assert (=> start!111250 e!751295))

(assert (=> start!111250 true))

(declare-fun array_inv!32261 (array!88476) Bool)

(assert (=> start!111250 (and (array_inv!32261 _values!1337) e!751293)))

(declare-fun array_inv!32262 (array!88474) Bool)

(assert (=> start!111250 (array_inv!32262 _keys!1609)))

(declare-fun mapNonEmpty!55274 () Bool)

(declare-fun tp!105380 () Bool)

(assert (=> mapNonEmpty!55274 (= mapRes!55274 (and tp!105380 e!751291))))

(declare-fun mapRest!55274 () (Array (_ BitVec 32) ValueCell!16980))

(declare-fun mapValue!55274 () ValueCell!16980)

(declare-fun mapKey!55274 () (_ BitVec 32))

(assert (=> mapNonEmpty!55274 (= (arr!42715 _values!1337) (store mapRest!55274 mapKey!55274 mapValue!55274))))

(assert (= (and start!111250 res!874071) b!1316850))

(assert (= (and b!1316850 res!874070) b!1316847))

(assert (= (and b!1316847 res!874069) b!1316845))

(assert (= (and b!1316849 condMapEmpty!55274) mapIsEmpty!55274))

(assert (= (and b!1316849 (not condMapEmpty!55274)) mapNonEmpty!55274))

(get-info :version)

(assert (= (and mapNonEmpty!55274 ((_ is ValueCellFull!16980) mapValue!55274)) b!1316848))

(assert (= (and b!1316849 ((_ is ValueCellFull!16980) mapDefault!55274)) b!1316846))

(assert (= start!111250 b!1316849))

(declare-fun m!1204915 () Bool)

(assert (=> b!1316847 m!1204915))

(declare-fun m!1204917 () Bool)

(assert (=> start!111250 m!1204917))

(declare-fun m!1204919 () Bool)

(assert (=> start!111250 m!1204919))

(declare-fun m!1204921 () Bool)

(assert (=> start!111250 m!1204921))

(declare-fun m!1204923 () Bool)

(assert (=> mapNonEmpty!55274 m!1204923))

(check-sat (not b!1316847) (not start!111250) (not mapNonEmpty!55274) tp_is_empty!35757)
(check-sat)
(get-model)

(declare-fun b!1316877 () Bool)

(declare-fun e!751317 () Bool)

(declare-fun call!64678 () Bool)

(assert (=> b!1316877 (= e!751317 call!64678)))

(declare-fun b!1316878 () Bool)

(declare-fun e!751318 () Bool)

(assert (=> b!1316878 (= e!751318 call!64678)))

(declare-fun b!1316879 () Bool)

(declare-fun e!751319 () Bool)

(assert (=> b!1316879 (= e!751319 e!751317)))

(declare-fun c!125634 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316879 (= c!125634 (validKeyInArray!0 (select (arr!42714 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!142689 () Bool)

(declare-fun res!874086 () Bool)

(assert (=> d!142689 (=> res!874086 e!751319)))

(assert (=> d!142689 (= res!874086 (bvsge #b00000000000000000000000000000000 (size!43264 _keys!1609)))))

(assert (=> d!142689 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!751319)))

(declare-fun bm!64675 () Bool)

(assert (=> bm!64675 (= call!64678 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1316880 () Bool)

(assert (=> b!1316880 (= e!751317 e!751318)))

(declare-fun lt!586288 () (_ BitVec 64))

(assert (=> b!1316880 (= lt!586288 (select (arr!42714 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43416 0))(
  ( (Unit!43417) )
))
(declare-fun lt!586289 () Unit!43416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88474 (_ BitVec 64) (_ BitVec 32)) Unit!43416)

(assert (=> b!1316880 (= lt!586289 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586288 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1316880 (arrayContainsKey!0 _keys!1609 lt!586288 #b00000000000000000000000000000000)))

(declare-fun lt!586287 () Unit!43416)

(assert (=> b!1316880 (= lt!586287 lt!586289)))

(declare-fun res!874085 () Bool)

(declare-datatypes ((SeekEntryResult!10037 0))(
  ( (MissingZero!10037 (index!42519 (_ BitVec 32))) (Found!10037 (index!42520 (_ BitVec 32))) (Intermediate!10037 (undefined!10849 Bool) (index!42521 (_ BitVec 32)) (x!117070 (_ BitVec 32))) (Undefined!10037) (MissingVacant!10037 (index!42522 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88474 (_ BitVec 32)) SeekEntryResult!10037)

(assert (=> b!1316880 (= res!874085 (= (seekEntryOrOpen!0 (select (arr!42714 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10037 #b00000000000000000000000000000000)))))

(assert (=> b!1316880 (=> (not res!874085) (not e!751318))))

(assert (= (and d!142689 (not res!874086)) b!1316879))

(assert (= (and b!1316879 c!125634) b!1316880))

(assert (= (and b!1316879 (not c!125634)) b!1316877))

(assert (= (and b!1316880 res!874085) b!1316878))

(assert (= (or b!1316878 b!1316877) bm!64675))

(declare-fun m!1204935 () Bool)

(assert (=> b!1316879 m!1204935))

(assert (=> b!1316879 m!1204935))

(declare-fun m!1204937 () Bool)

(assert (=> b!1316879 m!1204937))

(declare-fun m!1204939 () Bool)

(assert (=> bm!64675 m!1204939))

(assert (=> b!1316880 m!1204935))

(declare-fun m!1204941 () Bool)

(assert (=> b!1316880 m!1204941))

(declare-fun m!1204943 () Bool)

(assert (=> b!1316880 m!1204943))

(assert (=> b!1316880 m!1204935))

(declare-fun m!1204945 () Bool)

(assert (=> b!1316880 m!1204945))

(assert (=> b!1316847 d!142689))

(declare-fun d!142691 () Bool)

(assert (=> d!142691 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111250 d!142691))

(declare-fun d!142693 () Bool)

(assert (=> d!142693 (= (array_inv!32261 _values!1337) (bvsge (size!43265 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111250 d!142693))

(declare-fun d!142695 () Bool)

(assert (=> d!142695 (= (array_inv!32262 _keys!1609) (bvsge (size!43264 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111250 d!142695))

(declare-fun mapNonEmpty!55280 () Bool)

(declare-fun mapRes!55280 () Bool)

(declare-fun tp!105386 () Bool)

(declare-fun e!751324 () Bool)

(assert (=> mapNonEmpty!55280 (= mapRes!55280 (and tp!105386 e!751324))))

(declare-fun mapValue!55280 () ValueCell!16980)

(declare-fun mapRest!55280 () (Array (_ BitVec 32) ValueCell!16980))

(declare-fun mapKey!55280 () (_ BitVec 32))

(assert (=> mapNonEmpty!55280 (= mapRest!55274 (store mapRest!55280 mapKey!55280 mapValue!55280))))

(declare-fun b!1316887 () Bool)

(assert (=> b!1316887 (= e!751324 tp_is_empty!35757)))

(declare-fun mapIsEmpty!55280 () Bool)

(assert (=> mapIsEmpty!55280 mapRes!55280))

(declare-fun condMapEmpty!55280 () Bool)

(declare-fun mapDefault!55280 () ValueCell!16980)

(assert (=> mapNonEmpty!55274 (= condMapEmpty!55280 (= mapRest!55274 ((as const (Array (_ BitVec 32) ValueCell!16980)) mapDefault!55280)))))

(declare-fun e!751325 () Bool)

(assert (=> mapNonEmpty!55274 (= tp!105380 (and e!751325 mapRes!55280))))

(declare-fun b!1316888 () Bool)

(assert (=> b!1316888 (= e!751325 tp_is_empty!35757)))

(assert (= (and mapNonEmpty!55274 condMapEmpty!55280) mapIsEmpty!55280))

(assert (= (and mapNonEmpty!55274 (not condMapEmpty!55280)) mapNonEmpty!55280))

(assert (= (and mapNonEmpty!55280 ((_ is ValueCellFull!16980) mapValue!55280)) b!1316887))

(assert (= (and mapNonEmpty!55274 ((_ is ValueCellFull!16980) mapDefault!55280)) b!1316888))

(declare-fun m!1204947 () Bool)

(assert (=> mapNonEmpty!55280 m!1204947))

(check-sat tp_is_empty!35757 (not b!1316879) (not b!1316880) (not bm!64675) (not mapNonEmpty!55280))
(check-sat)
