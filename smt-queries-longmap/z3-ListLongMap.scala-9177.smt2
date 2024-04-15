; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110372 () Bool)

(assert start!110372)

(declare-fun b!1306094 () Bool)

(declare-fun e!745076 () Bool)

(declare-fun tp_is_empty!34975 () Bool)

(assert (=> b!1306094 (= e!745076 tp_is_empty!34975)))

(declare-fun b!1306095 () Bool)

(declare-fun e!745080 () Bool)

(declare-datatypes ((array!86875 0))(
  ( (array!86876 (arr!41922 (Array (_ BitVec 32) (_ BitVec 64))) (size!42474 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86875)

(assert (=> b!1306095 (= e!745080 (bvsgt #b00000000000000000000000000000000 (size!42474 _keys!1628)))))

(declare-fun b!1306096 () Bool)

(declare-fun e!745078 () Bool)

(assert (=> b!1306096 (= e!745078 tp_is_empty!34975)))

(declare-fun b!1306097 () Bool)

(declare-fun res!867132 () Bool)

(assert (=> b!1306097 (=> (not res!867132) (not e!745080))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51737 0))(
  ( (V!51738 (val!17562 Int)) )
))
(declare-datatypes ((ValueCell!16589 0))(
  ( (ValueCellFull!16589 (v!20187 V!51737)) (EmptyCell!16589) )
))
(declare-datatypes ((array!86877 0))(
  ( (array!86878 (arr!41923 (Array (_ BitVec 32) ValueCell!16589)) (size!42475 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86877)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306097 (= res!867132 (and (= (size!42475 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42474 _keys!1628) (size!42475 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!867134 () Bool)

(assert (=> start!110372 (=> (not res!867134) (not e!745080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110372 (= res!867134 (validMask!0 mask!2040))))

(assert (=> start!110372 e!745080))

(assert (=> start!110372 true))

(declare-fun e!745077 () Bool)

(declare-fun array_inv!31881 (array!86877) Bool)

(assert (=> start!110372 (and (array_inv!31881 _values!1354) e!745077)))

(declare-fun array_inv!31882 (array!86875) Bool)

(assert (=> start!110372 (array_inv!31882 _keys!1628)))

(declare-fun mapIsEmpty!54079 () Bool)

(declare-fun mapRes!54079 () Bool)

(assert (=> mapIsEmpty!54079 mapRes!54079))

(declare-fun mapNonEmpty!54079 () Bool)

(declare-fun tp!103160 () Bool)

(assert (=> mapNonEmpty!54079 (= mapRes!54079 (and tp!103160 e!745076))))

(declare-fun mapKey!54079 () (_ BitVec 32))

(declare-fun mapValue!54079 () ValueCell!16589)

(declare-fun mapRest!54079 () (Array (_ BitVec 32) ValueCell!16589))

(assert (=> mapNonEmpty!54079 (= (arr!41923 _values!1354) (store mapRest!54079 mapKey!54079 mapValue!54079))))

(declare-fun b!1306098 () Bool)

(assert (=> b!1306098 (= e!745077 (and e!745078 mapRes!54079))))

(declare-fun condMapEmpty!54079 () Bool)

(declare-fun mapDefault!54079 () ValueCell!16589)

(assert (=> b!1306098 (= condMapEmpty!54079 (= (arr!41923 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16589)) mapDefault!54079)))))

(declare-fun b!1306099 () Bool)

(declare-fun res!867133 () Bool)

(assert (=> b!1306099 (=> (not res!867133) (not e!745080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86875 (_ BitVec 32)) Bool)

(assert (=> b!1306099 (= res!867133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110372 res!867134) b!1306097))

(assert (= (and b!1306097 res!867132) b!1306099))

(assert (= (and b!1306099 res!867133) b!1306095))

(assert (= (and b!1306098 condMapEmpty!54079) mapIsEmpty!54079))

(assert (= (and b!1306098 (not condMapEmpty!54079)) mapNonEmpty!54079))

(get-info :version)

(assert (= (and mapNonEmpty!54079 ((_ is ValueCellFull!16589) mapValue!54079)) b!1306094))

(assert (= (and b!1306098 ((_ is ValueCellFull!16589) mapDefault!54079)) b!1306096))

(assert (= start!110372 b!1306098))

(declare-fun m!1196791 () Bool)

(assert (=> start!110372 m!1196791))

(declare-fun m!1196793 () Bool)

(assert (=> start!110372 m!1196793))

(declare-fun m!1196795 () Bool)

(assert (=> start!110372 m!1196795))

(declare-fun m!1196797 () Bool)

(assert (=> mapNonEmpty!54079 m!1196797))

(declare-fun m!1196799 () Bool)

(assert (=> b!1306099 m!1196799))

(check-sat (not start!110372) (not b!1306099) (not mapNonEmpty!54079) tp_is_empty!34975)
(check-sat)
(get-model)

(declare-fun d!142107 () Bool)

(assert (=> d!142107 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110372 d!142107))

(declare-fun d!142109 () Bool)

(assert (=> d!142109 (= (array_inv!31881 _values!1354) (bvsge (size!42475 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110372 d!142109))

(declare-fun d!142111 () Bool)

(assert (=> d!142111 (= (array_inv!31882 _keys!1628) (bvsge (size!42474 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110372 d!142111))

(declare-fun b!1306144 () Bool)

(declare-fun e!745119 () Bool)

(declare-fun e!745118 () Bool)

(assert (=> b!1306144 (= e!745119 e!745118)))

(declare-fun lt!584710 () (_ BitVec 64))

(assert (=> b!1306144 (= lt!584710 (select (arr!41922 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43105 0))(
  ( (Unit!43106) )
))
(declare-fun lt!584709 () Unit!43105)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86875 (_ BitVec 64) (_ BitVec 32)) Unit!43105)

(assert (=> b!1306144 (= lt!584709 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!584710 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306144 (arrayContainsKey!0 _keys!1628 lt!584710 #b00000000000000000000000000000000)))

(declare-fun lt!584711 () Unit!43105)

(assert (=> b!1306144 (= lt!584711 lt!584709)))

(declare-fun res!867158 () Bool)

(declare-datatypes ((SeekEntryResult!10030 0))(
  ( (MissingZero!10030 (index!42491 (_ BitVec 32))) (Found!10030 (index!42492 (_ BitVec 32))) (Intermediate!10030 (undefined!10842 Bool) (index!42493 (_ BitVec 32)) (x!115993 (_ BitVec 32))) (Undefined!10030) (MissingVacant!10030 (index!42494 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86875 (_ BitVec 32)) SeekEntryResult!10030)

(assert (=> b!1306144 (= res!867158 (= (seekEntryOrOpen!0 (select (arr!41922 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10030 #b00000000000000000000000000000000)))))

(assert (=> b!1306144 (=> (not res!867158) (not e!745118))))

(declare-fun bm!64601 () Bool)

(declare-fun call!64604 () Bool)

(assert (=> bm!64601 (= call!64604 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1306145 () Bool)

(assert (=> b!1306145 (= e!745119 call!64604)))

(declare-fun d!142113 () Bool)

(declare-fun res!867157 () Bool)

(declare-fun e!745117 () Bool)

(assert (=> d!142113 (=> res!867157 e!745117)))

(assert (=> d!142113 (= res!867157 (bvsge #b00000000000000000000000000000000 (size!42474 _keys!1628)))))

(assert (=> d!142113 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!745117)))

(declare-fun b!1306146 () Bool)

(assert (=> b!1306146 (= e!745117 e!745119)))

(declare-fun c!125520 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306146 (= c!125520 (validKeyInArray!0 (select (arr!41922 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1306147 () Bool)

(assert (=> b!1306147 (= e!745118 call!64604)))

(assert (= (and d!142113 (not res!867157)) b!1306146))

(assert (= (and b!1306146 c!125520) b!1306144))

(assert (= (and b!1306146 (not c!125520)) b!1306145))

(assert (= (and b!1306144 res!867158) b!1306147))

(assert (= (or b!1306147 b!1306145) bm!64601))

(declare-fun m!1196821 () Bool)

(assert (=> b!1306144 m!1196821))

(declare-fun m!1196823 () Bool)

(assert (=> b!1306144 m!1196823))

(declare-fun m!1196825 () Bool)

(assert (=> b!1306144 m!1196825))

(assert (=> b!1306144 m!1196821))

(declare-fun m!1196827 () Bool)

(assert (=> b!1306144 m!1196827))

(declare-fun m!1196829 () Bool)

(assert (=> bm!64601 m!1196829))

(assert (=> b!1306146 m!1196821))

(assert (=> b!1306146 m!1196821))

(declare-fun m!1196831 () Bool)

(assert (=> b!1306146 m!1196831))

(assert (=> b!1306099 d!142113))

(declare-fun mapIsEmpty!54088 () Bool)

(declare-fun mapRes!54088 () Bool)

(assert (=> mapIsEmpty!54088 mapRes!54088))

(declare-fun condMapEmpty!54088 () Bool)

(declare-fun mapDefault!54088 () ValueCell!16589)

(assert (=> mapNonEmpty!54079 (= condMapEmpty!54088 (= mapRest!54079 ((as const (Array (_ BitVec 32) ValueCell!16589)) mapDefault!54088)))))

(declare-fun e!745124 () Bool)

(assert (=> mapNonEmpty!54079 (= tp!103160 (and e!745124 mapRes!54088))))

(declare-fun b!1306155 () Bool)

(assert (=> b!1306155 (= e!745124 tp_is_empty!34975)))

(declare-fun mapNonEmpty!54088 () Bool)

(declare-fun tp!103169 () Bool)

(declare-fun e!745125 () Bool)

(assert (=> mapNonEmpty!54088 (= mapRes!54088 (and tp!103169 e!745125))))

(declare-fun mapValue!54088 () ValueCell!16589)

(declare-fun mapRest!54088 () (Array (_ BitVec 32) ValueCell!16589))

(declare-fun mapKey!54088 () (_ BitVec 32))

(assert (=> mapNonEmpty!54088 (= mapRest!54079 (store mapRest!54088 mapKey!54088 mapValue!54088))))

(declare-fun b!1306154 () Bool)

(assert (=> b!1306154 (= e!745125 tp_is_empty!34975)))

(assert (= (and mapNonEmpty!54079 condMapEmpty!54088) mapIsEmpty!54088))

(assert (= (and mapNonEmpty!54079 (not condMapEmpty!54088)) mapNonEmpty!54088))

(assert (= (and mapNonEmpty!54088 ((_ is ValueCellFull!16589) mapValue!54088)) b!1306154))

(assert (= (and mapNonEmpty!54079 ((_ is ValueCellFull!16589) mapDefault!54088)) b!1306155))

(declare-fun m!1196833 () Bool)

(assert (=> mapNonEmpty!54088 m!1196833))

(check-sat tp_is_empty!34975 (not mapNonEmpty!54088) (not b!1306146) (not bm!64601) (not b!1306144))
(check-sat)
