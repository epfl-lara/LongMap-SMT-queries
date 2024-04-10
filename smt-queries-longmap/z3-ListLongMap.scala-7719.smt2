; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96972 () Bool)

(assert start!96972)

(declare-fun mapNonEmpty!42733 () Bool)

(declare-fun mapRes!42733 () Bool)

(declare-fun tp!81653 () Bool)

(declare-fun e!629736 () Bool)

(assert (=> mapNonEmpty!42733 (= mapRes!42733 (and tp!81653 e!629736))))

(declare-fun mapKey!42733 () (_ BitVec 32))

(declare-datatypes ((V!41515 0))(
  ( (V!41516 (val!13702 Int)) )
))
(declare-datatypes ((ValueCell!12936 0))(
  ( (ValueCellFull!12936 (v!16333 V!41515)) (EmptyCell!12936) )
))
(declare-fun mapValue!42733 () ValueCell!12936)

(declare-datatypes ((array!71501 0))(
  ( (array!71502 (arr!34410 (Array (_ BitVec 32) ValueCell!12936)) (size!34946 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71501)

(declare-fun mapRest!42733 () (Array (_ BitVec 32) ValueCell!12936))

(assert (=> mapNonEmpty!42733 (= (arr!34410 _values!996) (store mapRest!42733 mapKey!42733 mapValue!42733))))

(declare-fun b!1103211 () Bool)

(declare-fun res!736019 () Bool)

(declare-fun e!629734 () Bool)

(assert (=> b!1103211 (=> (not res!736019) (not e!629734))))

(declare-datatypes ((array!71503 0))(
  ( (array!71504 (arr!34411 (Array (_ BitVec 32) (_ BitVec 64))) (size!34947 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71503)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71503 (_ BitVec 32)) Bool)

(assert (=> b!1103211 (= res!736019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103212 () Bool)

(assert (=> b!1103212 (= e!629734 (and (bvsle #b00000000000000000000000000000000 (size!34947 _keys!1208)) (bvsge (size!34947 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103213 () Bool)

(declare-fun res!736020 () Bool)

(assert (=> b!1103213 (=> (not res!736020) (not e!629734))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103213 (= res!736020 (and (= (size!34946 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34947 _keys!1208) (size!34946 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42733 () Bool)

(assert (=> mapIsEmpty!42733 mapRes!42733))

(declare-fun res!736018 () Bool)

(assert (=> start!96972 (=> (not res!736018) (not e!629734))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!96972 (= res!736018 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34947 _keys!1208))))))

(assert (=> start!96972 e!629734))

(declare-fun array_inv!26500 (array!71503) Bool)

(assert (=> start!96972 (array_inv!26500 _keys!1208)))

(assert (=> start!96972 true))

(declare-fun e!629733 () Bool)

(declare-fun array_inv!26501 (array!71501) Bool)

(assert (=> start!96972 (and (array_inv!26501 _values!996) e!629733)))

(declare-fun b!1103214 () Bool)

(declare-fun res!736021 () Bool)

(assert (=> b!1103214 (=> (not res!736021) (not e!629734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103214 (= res!736021 (validMask!0 mask!1564))))

(declare-fun b!1103215 () Bool)

(declare-fun tp_is_empty!27291 () Bool)

(assert (=> b!1103215 (= e!629736 tp_is_empty!27291)))

(declare-fun b!1103216 () Bool)

(declare-fun e!629737 () Bool)

(assert (=> b!1103216 (= e!629737 tp_is_empty!27291)))

(declare-fun b!1103217 () Bool)

(assert (=> b!1103217 (= e!629733 (and e!629737 mapRes!42733))))

(declare-fun condMapEmpty!42733 () Bool)

(declare-fun mapDefault!42733 () ValueCell!12936)

(assert (=> b!1103217 (= condMapEmpty!42733 (= (arr!34410 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12936)) mapDefault!42733)))))

(assert (= (and start!96972 res!736018) b!1103214))

(assert (= (and b!1103214 res!736021) b!1103213))

(assert (= (and b!1103213 res!736020) b!1103211))

(assert (= (and b!1103211 res!736019) b!1103212))

(assert (= (and b!1103217 condMapEmpty!42733) mapIsEmpty!42733))

(assert (= (and b!1103217 (not condMapEmpty!42733)) mapNonEmpty!42733))

(get-info :version)

(assert (= (and mapNonEmpty!42733 ((_ is ValueCellFull!12936) mapValue!42733)) b!1103215))

(assert (= (and b!1103217 ((_ is ValueCellFull!12936) mapDefault!42733)) b!1103216))

(assert (= start!96972 b!1103217))

(declare-fun m!1023469 () Bool)

(assert (=> mapNonEmpty!42733 m!1023469))

(declare-fun m!1023471 () Bool)

(assert (=> b!1103211 m!1023471))

(declare-fun m!1023473 () Bool)

(assert (=> start!96972 m!1023473))

(declare-fun m!1023475 () Bool)

(assert (=> start!96972 m!1023475))

(declare-fun m!1023477 () Bool)

(assert (=> b!1103214 m!1023477))

(check-sat (not b!1103211) (not b!1103214) tp_is_empty!27291 (not start!96972) (not mapNonEmpty!42733))
(check-sat)
(get-model)

(declare-fun d!130803 () Bool)

(assert (=> d!130803 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1103214 d!130803))

(declare-fun d!130805 () Bool)

(assert (=> d!130805 (= (array_inv!26500 _keys!1208) (bvsge (size!34947 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!96972 d!130805))

(declare-fun d!130807 () Bool)

(assert (=> d!130807 (= (array_inv!26501 _values!996) (bvsge (size!34946 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!96972 d!130807))

(declare-fun b!1103247 () Bool)

(declare-fun e!629760 () Bool)

(declare-fun e!629759 () Bool)

(assert (=> b!1103247 (= e!629760 e!629759)))

(declare-fun lt!495050 () (_ BitVec 64))

(assert (=> b!1103247 (= lt!495050 (select (arr!34411 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36240 0))(
  ( (Unit!36241) )
))
(declare-fun lt!495051 () Unit!36240)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71503 (_ BitVec 64) (_ BitVec 32)) Unit!36240)

(assert (=> b!1103247 (= lt!495051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495050 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103247 (arrayContainsKey!0 _keys!1208 lt!495050 #b00000000000000000000000000000000)))

(declare-fun lt!495049 () Unit!36240)

(assert (=> b!1103247 (= lt!495049 lt!495051)))

(declare-fun res!736038 () Bool)

(declare-datatypes ((SeekEntryResult!9918 0))(
  ( (MissingZero!9918 (index!42043 (_ BitVec 32))) (Found!9918 (index!42044 (_ BitVec 32))) (Intermediate!9918 (undefined!10730 Bool) (index!42045 (_ BitVec 32)) (x!99227 (_ BitVec 32))) (Undefined!9918) (MissingVacant!9918 (index!42046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71503 (_ BitVec 32)) SeekEntryResult!9918)

(assert (=> b!1103247 (= res!736038 (= (seekEntryOrOpen!0 (select (arr!34411 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9918 #b00000000000000000000000000000000)))))

(assert (=> b!1103247 (=> (not res!736038) (not e!629759))))

(declare-fun d!130809 () Bool)

(declare-fun res!736039 () Bool)

(declare-fun e!629761 () Bool)

(assert (=> d!130809 (=> res!736039 e!629761)))

(assert (=> d!130809 (= res!736039 (bvsge #b00000000000000000000000000000000 (size!34947 _keys!1208)))))

(assert (=> d!130809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!629761)))

(declare-fun b!1103248 () Bool)

(assert (=> b!1103248 (= e!629761 e!629760)))

(declare-fun c!108973 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103248 (= c!108973 (validKeyInArray!0 (select (arr!34411 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46316 () Bool)

(declare-fun call!46319 () Bool)

(assert (=> bm!46316 (= call!46319 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1103249 () Bool)

(assert (=> b!1103249 (= e!629760 call!46319)))

(declare-fun b!1103250 () Bool)

(assert (=> b!1103250 (= e!629759 call!46319)))

(assert (= (and d!130809 (not res!736039)) b!1103248))

(assert (= (and b!1103248 c!108973) b!1103247))

(assert (= (and b!1103248 (not c!108973)) b!1103249))

(assert (= (and b!1103247 res!736038) b!1103250))

(assert (= (or b!1103250 b!1103249) bm!46316))

(declare-fun m!1023489 () Bool)

(assert (=> b!1103247 m!1023489))

(declare-fun m!1023491 () Bool)

(assert (=> b!1103247 m!1023491))

(declare-fun m!1023493 () Bool)

(assert (=> b!1103247 m!1023493))

(assert (=> b!1103247 m!1023489))

(declare-fun m!1023495 () Bool)

(assert (=> b!1103247 m!1023495))

(assert (=> b!1103248 m!1023489))

(assert (=> b!1103248 m!1023489))

(declare-fun m!1023497 () Bool)

(assert (=> b!1103248 m!1023497))

(declare-fun m!1023499 () Bool)

(assert (=> bm!46316 m!1023499))

(assert (=> b!1103211 d!130809))

(declare-fun condMapEmpty!42739 () Bool)

(declare-fun mapDefault!42739 () ValueCell!12936)

(assert (=> mapNonEmpty!42733 (= condMapEmpty!42739 (= mapRest!42733 ((as const (Array (_ BitVec 32) ValueCell!12936)) mapDefault!42739)))))

(declare-fun e!629767 () Bool)

(declare-fun mapRes!42739 () Bool)

(assert (=> mapNonEmpty!42733 (= tp!81653 (and e!629767 mapRes!42739))))

(declare-fun b!1103257 () Bool)

(declare-fun e!629766 () Bool)

(assert (=> b!1103257 (= e!629766 tp_is_empty!27291)))

(declare-fun b!1103258 () Bool)

(assert (=> b!1103258 (= e!629767 tp_is_empty!27291)))

(declare-fun mapNonEmpty!42739 () Bool)

(declare-fun tp!81659 () Bool)

(assert (=> mapNonEmpty!42739 (= mapRes!42739 (and tp!81659 e!629766))))

(declare-fun mapRest!42739 () (Array (_ BitVec 32) ValueCell!12936))

(declare-fun mapValue!42739 () ValueCell!12936)

(declare-fun mapKey!42739 () (_ BitVec 32))

(assert (=> mapNonEmpty!42739 (= mapRest!42733 (store mapRest!42739 mapKey!42739 mapValue!42739))))

(declare-fun mapIsEmpty!42739 () Bool)

(assert (=> mapIsEmpty!42739 mapRes!42739))

(assert (= (and mapNonEmpty!42733 condMapEmpty!42739) mapIsEmpty!42739))

(assert (= (and mapNonEmpty!42733 (not condMapEmpty!42739)) mapNonEmpty!42739))

(assert (= (and mapNonEmpty!42739 ((_ is ValueCellFull!12936) mapValue!42739)) b!1103257))

(assert (= (and mapNonEmpty!42733 ((_ is ValueCellFull!12936) mapDefault!42739)) b!1103258))

(declare-fun m!1023501 () Bool)

(assert (=> mapNonEmpty!42739 m!1023501))

(check-sat (not bm!46316) (not b!1103247) (not b!1103248) tp_is_empty!27291 (not mapNonEmpty!42739))
(check-sat)
