; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!482 () Bool)

(assert start!482)

(declare-fun res!4859 () Bool)

(declare-fun e!1163 () Bool)

(assert (=> start!482 (=> (not res!4859) (not e!1163))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!482 (= res!4859 (validMask!0 mask!2250))))

(assert (=> start!482 e!1163))

(assert (=> start!482 true))

(declare-datatypes ((V!275 0))(
  ( (V!276 (val!42 Int)) )
))
(declare-datatypes ((ValueCell!20 0))(
  ( (ValueCellFull!20 (v!1128 V!275)) (EmptyCell!20) )
))
(declare-datatypes ((array!77 0))(
  ( (array!78 (arr!35 (Array (_ BitVec 32) ValueCell!20)) (size!97 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!77)

(declare-fun e!1162 () Bool)

(declare-fun array_inv!19 (array!77) Bool)

(assert (=> start!482 (and (array_inv!19 _values!1492) e!1162)))

(declare-datatypes ((array!79 0))(
  ( (array!80 (arr!36 (Array (_ BitVec 32) (_ BitVec 64))) (size!98 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!79)

(declare-fun array_inv!20 (array!79) Bool)

(assert (=> start!482 (array_inv!20 _keys!1806)))

(declare-fun b!2827 () Bool)

(declare-fun res!4858 () Bool)

(assert (=> b!2827 (=> (not res!4858) (not e!1163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79 (_ BitVec 32)) Bool)

(assert (=> b!2827 (= res!4858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!2828 () Bool)

(declare-fun e!1161 () Bool)

(declare-fun mapRes!56 () Bool)

(assert (=> b!2828 (= e!1162 (and e!1161 mapRes!56))))

(declare-fun condMapEmpty!56 () Bool)

(declare-fun mapDefault!56 () ValueCell!20)

(assert (=> b!2828 (= condMapEmpty!56 (= (arr!35 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!20)) mapDefault!56)))))

(declare-fun b!2829 () Bool)

(declare-fun e!1164 () Bool)

(declare-fun tp_is_empty!73 () Bool)

(assert (=> b!2829 (= e!1164 tp_is_empty!73)))

(declare-fun b!2830 () Bool)

(assert (=> b!2830 (= e!1161 tp_is_empty!73)))

(declare-fun mapNonEmpty!56 () Bool)

(declare-fun tp!296 () Bool)

(assert (=> mapNonEmpty!56 (= mapRes!56 (and tp!296 e!1164))))

(declare-fun mapRest!56 () (Array (_ BitVec 32) ValueCell!20))

(declare-fun mapValue!56 () ValueCell!20)

(declare-fun mapKey!56 () (_ BitVec 32))

(assert (=> mapNonEmpty!56 (= (arr!35 _values!1492) (store mapRest!56 mapKey!56 mapValue!56))))

(declare-fun b!2831 () Bool)

(assert (=> b!2831 (= e!1163 (and (bvsle #b00000000000000000000000000000000 (size!98 _keys!1806)) (bvsge (size!98 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun b!2832 () Bool)

(declare-fun res!4857 () Bool)

(assert (=> b!2832 (=> (not res!4857) (not e!1163))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2832 (= res!4857 (and (= (size!97 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!98 _keys!1806) (size!97 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56 () Bool)

(assert (=> mapIsEmpty!56 mapRes!56))

(assert (= (and start!482 res!4859) b!2832))

(assert (= (and b!2832 res!4857) b!2827))

(assert (= (and b!2827 res!4858) b!2831))

(assert (= (and b!2828 condMapEmpty!56) mapIsEmpty!56))

(assert (= (and b!2828 (not condMapEmpty!56)) mapNonEmpty!56))

(get-info :version)

(assert (= (and mapNonEmpty!56 ((_ is ValueCellFull!20) mapValue!56)) b!2829))

(assert (= (and b!2828 ((_ is ValueCellFull!20) mapDefault!56)) b!2830))

(assert (= start!482 b!2828))

(declare-fun m!1259 () Bool)

(assert (=> start!482 m!1259))

(declare-fun m!1261 () Bool)

(assert (=> start!482 m!1261))

(declare-fun m!1263 () Bool)

(assert (=> start!482 m!1263))

(declare-fun m!1265 () Bool)

(assert (=> b!2827 m!1265))

(declare-fun m!1267 () Bool)

(assert (=> mapNonEmpty!56 m!1267))

(check-sat (not start!482) (not b!2827) (not mapNonEmpty!56) tp_is_empty!73)
(check-sat)
(get-model)

(declare-fun d!583 () Bool)

(assert (=> d!583 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!482 d!583))

(declare-fun d!585 () Bool)

(assert (=> d!585 (= (array_inv!19 _values!1492) (bvsge (size!97 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!482 d!585))

(declare-fun d!587 () Bool)

(assert (=> d!587 (= (array_inv!20 _keys!1806) (bvsge (size!98 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!482 d!587))

(declare-fun d!589 () Bool)

(declare-fun res!4882 () Bool)

(declare-fun e!1203 () Bool)

(assert (=> d!589 (=> res!4882 e!1203)))

(assert (=> d!589 (= res!4882 (bvsge #b00000000000000000000000000000000 (size!98 _keys!1806)))))

(assert (=> d!589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!1203)))

(declare-fun bm!32 () Bool)

(declare-fun call!35 () Bool)

(assert (=> bm!32 (= call!35 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!2877 () Bool)

(declare-fun e!1202 () Bool)

(assert (=> b!2877 (= e!1203 e!1202)))

(declare-fun c!179 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!2877 (= c!179 (validKeyInArray!0 (select (arr!36 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!2878 () Bool)

(declare-fun e!1201 () Bool)

(assert (=> b!2878 (= e!1201 call!35)))

(declare-fun b!2879 () Bool)

(assert (=> b!2879 (= e!1202 e!1201)))

(declare-fun lt!393 () (_ BitVec 64))

(assert (=> b!2879 (= lt!393 (select (arr!36 _keys!1806) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21 0))(
  ( (Unit!22) )
))
(declare-fun lt!394 () Unit!21)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79 (_ BitVec 64) (_ BitVec 32)) Unit!21)

(assert (=> b!2879 (= lt!394 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!393 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!79 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!2879 (arrayContainsKey!0 _keys!1806 lt!393 #b00000000000000000000000000000000)))

(declare-fun lt!395 () Unit!21)

(assert (=> b!2879 (= lt!395 lt!394)))

(declare-fun res!4883 () Bool)

(declare-datatypes ((SeekEntryResult!6 0))(
  ( (MissingZero!6 (index!2143 (_ BitVec 32))) (Found!6 (index!2144 (_ BitVec 32))) (Intermediate!6 (undefined!818 Bool) (index!2145 (_ BitVec 32)) (x!2170 (_ BitVec 32))) (Undefined!6) (MissingVacant!6 (index!2146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!79 (_ BitVec 32)) SeekEntryResult!6)

(assert (=> b!2879 (= res!4883 (= (seekEntryOrOpen!0 (select (arr!36 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!6 #b00000000000000000000000000000000)))))

(assert (=> b!2879 (=> (not res!4883) (not e!1201))))

(declare-fun b!2880 () Bool)

(assert (=> b!2880 (= e!1202 call!35)))

(assert (= (and d!589 (not res!4882)) b!2877))

(assert (= (and b!2877 c!179) b!2879))

(assert (= (and b!2877 (not c!179)) b!2880))

(assert (= (and b!2879 res!4883) b!2878))

(assert (= (or b!2878 b!2880) bm!32))

(declare-fun m!1289 () Bool)

(assert (=> bm!32 m!1289))

(declare-fun m!1291 () Bool)

(assert (=> b!2877 m!1291))

(assert (=> b!2877 m!1291))

(declare-fun m!1293 () Bool)

(assert (=> b!2877 m!1293))

(assert (=> b!2879 m!1291))

(declare-fun m!1295 () Bool)

(assert (=> b!2879 m!1295))

(declare-fun m!1297 () Bool)

(assert (=> b!2879 m!1297))

(assert (=> b!2879 m!1291))

(declare-fun m!1299 () Bool)

(assert (=> b!2879 m!1299))

(assert (=> b!2827 d!589))

(declare-fun b!2888 () Bool)

(declare-fun e!1209 () Bool)

(assert (=> b!2888 (= e!1209 tp_is_empty!73)))

(declare-fun condMapEmpty!65 () Bool)

(declare-fun mapDefault!65 () ValueCell!20)

(assert (=> mapNonEmpty!56 (= condMapEmpty!65 (= mapRest!56 ((as const (Array (_ BitVec 32) ValueCell!20)) mapDefault!65)))))

(declare-fun mapRes!65 () Bool)

(assert (=> mapNonEmpty!56 (= tp!296 (and e!1209 mapRes!65))))

(declare-fun mapNonEmpty!65 () Bool)

(declare-fun tp!305 () Bool)

(declare-fun e!1208 () Bool)

(assert (=> mapNonEmpty!65 (= mapRes!65 (and tp!305 e!1208))))

(declare-fun mapRest!65 () (Array (_ BitVec 32) ValueCell!20))

(declare-fun mapKey!65 () (_ BitVec 32))

(declare-fun mapValue!65 () ValueCell!20)

(assert (=> mapNonEmpty!65 (= mapRest!56 (store mapRest!65 mapKey!65 mapValue!65))))

(declare-fun b!2887 () Bool)

(assert (=> b!2887 (= e!1208 tp_is_empty!73)))

(declare-fun mapIsEmpty!65 () Bool)

(assert (=> mapIsEmpty!65 mapRes!65))

(assert (= (and mapNonEmpty!56 condMapEmpty!65) mapIsEmpty!65))

(assert (= (and mapNonEmpty!56 (not condMapEmpty!65)) mapNonEmpty!65))

(assert (= (and mapNonEmpty!65 ((_ is ValueCellFull!20) mapValue!65)) b!2887))

(assert (= (and mapNonEmpty!56 ((_ is ValueCellFull!20) mapDefault!65)) b!2888))

(declare-fun m!1301 () Bool)

(assert (=> mapNonEmpty!65 m!1301))

(check-sat tp_is_empty!73 (not b!2877) (not b!2879) (not bm!32) (not mapNonEmpty!65))
(check-sat)
