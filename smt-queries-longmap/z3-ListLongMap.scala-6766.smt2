; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84894 () Bool)

(assert start!84894)

(declare-fun b!992058 () Bool)

(declare-fun res!663083 () Bool)

(declare-fun e!559595 () Bool)

(assert (=> b!992058 (=> (not res!663083) (not e!559595))))

(declare-datatypes ((array!62715 0))(
  ( (array!62716 (arr!30202 (Array (_ BitVec 32) (_ BitVec 64))) (size!30681 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62715)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62715 (_ BitVec 32)) Bool)

(assert (=> b!992058 (= res!663083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!992059 () Bool)

(declare-fun e!559596 () Bool)

(declare-fun e!559594 () Bool)

(declare-fun mapRes!37131 () Bool)

(assert (=> b!992059 (= e!559596 (and e!559594 mapRes!37131))))

(declare-fun condMapEmpty!37131 () Bool)

(declare-datatypes ((V!36147 0))(
  ( (V!36148 (val!11737 Int)) )
))
(declare-datatypes ((ValueCell!11205 0))(
  ( (ValueCellFull!11205 (v!14314 V!36147)) (EmptyCell!11205) )
))
(declare-datatypes ((array!62717 0))(
  ( (array!62718 (arr!30203 (Array (_ BitVec 32) ValueCell!11205)) (size!30682 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62717)

(declare-fun mapDefault!37131 () ValueCell!11205)

(assert (=> b!992059 (= condMapEmpty!37131 (= (arr!30203 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11205)) mapDefault!37131)))))

(declare-fun b!992060 () Bool)

(declare-fun tp_is_empty!23373 () Bool)

(assert (=> b!992060 (= e!559594 tp_is_empty!23373)))

(declare-fun mapNonEmpty!37131 () Bool)

(declare-fun tp!70202 () Bool)

(declare-fun e!559599 () Bool)

(assert (=> mapNonEmpty!37131 (= mapRes!37131 (and tp!70202 e!559599))))

(declare-fun mapKey!37131 () (_ BitVec 32))

(declare-fun mapRest!37131 () (Array (_ BitVec 32) ValueCell!11205))

(declare-fun mapValue!37131 () ValueCell!11205)

(assert (=> mapNonEmpty!37131 (= (arr!30203 _values!1551) (store mapRest!37131 mapKey!37131 mapValue!37131))))

(declare-fun b!992061 () Bool)

(declare-fun e!559597 () Bool)

(declare-datatypes ((SeekEntryResult!9219 0))(
  ( (MissingZero!9219 (index!39247 (_ BitVec 32))) (Found!9219 (index!39248 (_ BitVec 32))) (Intermediate!9219 (undefined!10031 Bool) (index!39249 (_ BitVec 32)) (x!86332 (_ BitVec 32))) (Undefined!9219) (MissingVacant!9219 (index!39250 (_ BitVec 32))) )
))
(declare-fun lt!440047 () SeekEntryResult!9219)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!992061 (= e!559597 (not (inRange!0 (index!39248 lt!440047) mask!2471)))))

(declare-fun b!992062 () Bool)

(declare-fun res!663081 () Bool)

(assert (=> b!992062 (=> (not res!663081) (not e!559595))))

(declare-datatypes ((List!20871 0))(
  ( (Nil!20868) (Cons!20867 (h!22029 (_ BitVec 64)) (t!29854 List!20871)) )
))
(declare-fun arrayNoDuplicates!0 (array!62715 (_ BitVec 32) List!20871) Bool)

(assert (=> b!992062 (= res!663081 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20868))))

(declare-fun b!992063 () Bool)

(declare-fun res!663080 () Bool)

(assert (=> b!992063 (=> (not res!663080) (not e!559595))))

(declare-fun k0!1425 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!992063 (= res!663080 (validKeyInArray!0 k0!1425))))

(declare-fun mapIsEmpty!37131 () Bool)

(assert (=> mapIsEmpty!37131 mapRes!37131))

(declare-fun res!663079 () Bool)

(assert (=> start!84894 (=> (not res!663079) (not e!559595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84894 (= res!663079 (validMask!0 mask!2471))))

(assert (=> start!84894 e!559595))

(assert (=> start!84894 true))

(declare-fun array_inv!23327 (array!62717) Bool)

(assert (=> start!84894 (and (array_inv!23327 _values!1551) e!559596)))

(declare-fun array_inv!23328 (array!62715) Bool)

(assert (=> start!84894 (array_inv!23328 _keys!1945)))

(declare-fun b!992064 () Bool)

(assert (=> b!992064 (= e!559595 e!559597)))

(declare-fun res!663084 () Bool)

(assert (=> b!992064 (=> (not res!663084) (not e!559597))))

(get-info :version)

(assert (=> b!992064 (= res!663084 ((_ is Found!9219) lt!440047))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!62715 (_ BitVec 32)) SeekEntryResult!9219)

(assert (=> b!992064 (= lt!440047 (seekEntry!0 k0!1425 _keys!1945 mask!2471))))

(declare-fun b!992065 () Bool)

(assert (=> b!992065 (= e!559599 tp_is_empty!23373)))

(declare-fun b!992066 () Bool)

(declare-fun res!663082 () Bool)

(assert (=> b!992066 (=> (not res!663082) (not e!559595))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!992066 (= res!663082 (and (= (size!30682 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30681 _keys!1945) (size!30682 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(assert (= (and start!84894 res!663079) b!992066))

(assert (= (and b!992066 res!663082) b!992058))

(assert (= (and b!992058 res!663083) b!992062))

(assert (= (and b!992062 res!663081) b!992063))

(assert (= (and b!992063 res!663080) b!992064))

(assert (= (and b!992064 res!663084) b!992061))

(assert (= (and b!992059 condMapEmpty!37131) mapIsEmpty!37131))

(assert (= (and b!992059 (not condMapEmpty!37131)) mapNonEmpty!37131))

(assert (= (and mapNonEmpty!37131 ((_ is ValueCellFull!11205) mapValue!37131)) b!992065))

(assert (= (and b!992059 ((_ is ValueCellFull!11205) mapDefault!37131)) b!992060))

(assert (= start!84894 b!992059))

(declare-fun m!919773 () Bool)

(assert (=> b!992061 m!919773))

(declare-fun m!919775 () Bool)

(assert (=> mapNonEmpty!37131 m!919775))

(declare-fun m!919777 () Bool)

(assert (=> b!992063 m!919777))

(declare-fun m!919779 () Bool)

(assert (=> b!992058 m!919779))

(declare-fun m!919781 () Bool)

(assert (=> start!84894 m!919781))

(declare-fun m!919783 () Bool)

(assert (=> start!84894 m!919783))

(declare-fun m!919785 () Bool)

(assert (=> start!84894 m!919785))

(declare-fun m!919787 () Bool)

(assert (=> b!992062 m!919787))

(declare-fun m!919789 () Bool)

(assert (=> b!992064 m!919789))

(check-sat (not start!84894) (not b!992058) (not b!992061) (not b!992063) (not mapNonEmpty!37131) tp_is_empty!23373 (not b!992062) (not b!992064))
(check-sat)
(get-model)

(declare-fun d!118001 () Bool)

(declare-fun lt!440060 () SeekEntryResult!9219)

(assert (=> d!118001 (and (or ((_ is MissingVacant!9219) lt!440060) (not ((_ is Found!9219) lt!440060)) (and (bvsge (index!39248 lt!440060) #b00000000000000000000000000000000) (bvslt (index!39248 lt!440060) (size!30681 _keys!1945)))) (not ((_ is MissingVacant!9219) lt!440060)) (or (not ((_ is Found!9219) lt!440060)) (= (select (arr!30202 _keys!1945) (index!39248 lt!440060)) k0!1425)))))

(declare-fun e!559625 () SeekEntryResult!9219)

(assert (=> d!118001 (= lt!440060 e!559625)))

(declare-fun c!100643 () Bool)

(declare-fun lt!440059 () SeekEntryResult!9219)

(assert (=> d!118001 (= c!100643 (and ((_ is Intermediate!9219) lt!440059) (undefined!10031 lt!440059)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62715 (_ BitVec 32)) SeekEntryResult!9219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118001 (= lt!440059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1425 mask!2471) k0!1425 _keys!1945 mask!2471))))

(assert (=> d!118001 (validMask!0 mask!2471)))

(assert (=> d!118001 (= (seekEntry!0 k0!1425 _keys!1945 mask!2471) lt!440060)))

(declare-fun b!992106 () Bool)

(declare-fun e!559624 () SeekEntryResult!9219)

(assert (=> b!992106 (= e!559624 (MissingZero!9219 (index!39249 lt!440059)))))

(declare-fun b!992107 () Bool)

(declare-fun e!559626 () SeekEntryResult!9219)

(assert (=> b!992107 (= e!559625 e!559626)))

(declare-fun lt!440062 () (_ BitVec 64))

(assert (=> b!992107 (= lt!440062 (select (arr!30202 _keys!1945) (index!39249 lt!440059)))))

(declare-fun c!100645 () Bool)

(assert (=> b!992107 (= c!100645 (= lt!440062 k0!1425))))

(declare-fun b!992108 () Bool)

(assert (=> b!992108 (= e!559625 Undefined!9219)))

(declare-fun b!992109 () Bool)

(declare-fun c!100644 () Bool)

(assert (=> b!992109 (= c!100644 (= lt!440062 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!992109 (= e!559626 e!559624)))

(declare-fun b!992110 () Bool)

(assert (=> b!992110 (= e!559626 (Found!9219 (index!39249 lt!440059)))))

(declare-fun b!992111 () Bool)

(declare-fun lt!440061 () SeekEntryResult!9219)

(assert (=> b!992111 (= e!559624 (ite ((_ is MissingVacant!9219) lt!440061) (MissingZero!9219 (index!39250 lt!440061)) lt!440061))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62715 (_ BitVec 32)) SeekEntryResult!9219)

(assert (=> b!992111 (= lt!440061 (seekKeyOrZeroReturnVacant!0 (x!86332 lt!440059) (index!39249 lt!440059) (index!39249 lt!440059) k0!1425 _keys!1945 mask!2471))))

(assert (= (and d!118001 c!100643) b!992108))

(assert (= (and d!118001 (not c!100643)) b!992107))

(assert (= (and b!992107 c!100645) b!992110))

(assert (= (and b!992107 (not c!100645)) b!992109))

(assert (= (and b!992109 c!100644) b!992106))

(assert (= (and b!992109 (not c!100644)) b!992111))

(declare-fun m!919809 () Bool)

(assert (=> d!118001 m!919809))

(declare-fun m!919811 () Bool)

(assert (=> d!118001 m!919811))

(assert (=> d!118001 m!919811))

(declare-fun m!919813 () Bool)

(assert (=> d!118001 m!919813))

(assert (=> d!118001 m!919781))

(declare-fun m!919815 () Bool)

(assert (=> b!992107 m!919815))

(declare-fun m!919817 () Bool)

(assert (=> b!992111 m!919817))

(assert (=> b!992064 d!118001))

(declare-fun d!118003 () Bool)

(assert (=> d!118003 (= (validKeyInArray!0 k0!1425) (and (not (= k0!1425 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1425 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!992063 d!118003))

(declare-fun bm!42085 () Bool)

(declare-fun call!42088 () Bool)

(assert (=> bm!42085 (= call!42088 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!992120 () Bool)

(declare-fun e!559633 () Bool)

(assert (=> b!992120 (= e!559633 call!42088)))

(declare-fun d!118005 () Bool)

(declare-fun res!663108 () Bool)

(declare-fun e!559634 () Bool)

(assert (=> d!118005 (=> res!663108 e!559634)))

(assert (=> d!118005 (= res!663108 (bvsge #b00000000000000000000000000000000 (size!30681 _keys!1945)))))

(assert (=> d!118005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559634)))

(declare-fun b!992121 () Bool)

(declare-fun e!559635 () Bool)

(assert (=> b!992121 (= e!559635 e!559633)))

(declare-fun lt!440070 () (_ BitVec 64))

(assert (=> b!992121 (= lt!440070 (select (arr!30202 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32902 0))(
  ( (Unit!32903) )
))
(declare-fun lt!440071 () Unit!32902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62715 (_ BitVec 64) (_ BitVec 32)) Unit!32902)

(assert (=> b!992121 (= lt!440071 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!440070 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!992121 (arrayContainsKey!0 _keys!1945 lt!440070 #b00000000000000000000000000000000)))

(declare-fun lt!440069 () Unit!32902)

(assert (=> b!992121 (= lt!440069 lt!440071)))

(declare-fun res!663107 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62715 (_ BitVec 32)) SeekEntryResult!9219)

(assert (=> b!992121 (= res!663107 (= (seekEntryOrOpen!0 (select (arr!30202 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9219 #b00000000000000000000000000000000)))))

(assert (=> b!992121 (=> (not res!663107) (not e!559633))))

(declare-fun b!992122 () Bool)

(assert (=> b!992122 (= e!559635 call!42088)))

(declare-fun b!992123 () Bool)

(assert (=> b!992123 (= e!559634 e!559635)))

(declare-fun c!100648 () Bool)

(assert (=> b!992123 (= c!100648 (validKeyInArray!0 (select (arr!30202 _keys!1945) #b00000000000000000000000000000000)))))

(assert (= (and d!118005 (not res!663108)) b!992123))

(assert (= (and b!992123 c!100648) b!992121))

(assert (= (and b!992123 (not c!100648)) b!992122))

(assert (= (and b!992121 res!663107) b!992120))

(assert (= (or b!992120 b!992122) bm!42085))

(declare-fun m!919819 () Bool)

(assert (=> bm!42085 m!919819))

(declare-fun m!919821 () Bool)

(assert (=> b!992121 m!919821))

(declare-fun m!919823 () Bool)

(assert (=> b!992121 m!919823))

(declare-fun m!919825 () Bool)

(assert (=> b!992121 m!919825))

(assert (=> b!992121 m!919821))

(declare-fun m!919827 () Bool)

(assert (=> b!992121 m!919827))

(assert (=> b!992123 m!919821))

(assert (=> b!992123 m!919821))

(declare-fun m!919829 () Bool)

(assert (=> b!992123 m!919829))

(assert (=> b!992058 d!118005))

(declare-fun d!118007 () Bool)

(assert (=> d!118007 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84894 d!118007))

(declare-fun d!118009 () Bool)

(assert (=> d!118009 (= (array_inv!23327 _values!1551) (bvsge (size!30682 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84894 d!118009))

(declare-fun d!118011 () Bool)

(assert (=> d!118011 (= (array_inv!23328 _keys!1945) (bvsge (size!30681 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84894 d!118011))

(declare-fun b!992134 () Bool)

(declare-fun e!559644 () Bool)

(declare-fun e!559646 () Bool)

(assert (=> b!992134 (= e!559644 e!559646)))

(declare-fun c!100651 () Bool)

(assert (=> b!992134 (= c!100651 (validKeyInArray!0 (select (arr!30202 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun bm!42088 () Bool)

(declare-fun call!42091 () Bool)

(assert (=> bm!42088 (= call!42091 (arrayNoDuplicates!0 _keys!1945 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100651 (Cons!20867 (select (arr!30202 _keys!1945) #b00000000000000000000000000000000) Nil!20868) Nil!20868)))))

(declare-fun b!992135 () Bool)

(assert (=> b!992135 (= e!559646 call!42091)))

(declare-fun b!992136 () Bool)

(declare-fun e!559645 () Bool)

(assert (=> b!992136 (= e!559645 e!559644)))

(declare-fun res!663117 () Bool)

(assert (=> b!992136 (=> (not res!663117) (not e!559644))))

(declare-fun e!559647 () Bool)

(assert (=> b!992136 (= res!663117 (not e!559647))))

(declare-fun res!663115 () Bool)

(assert (=> b!992136 (=> (not res!663115) (not e!559647))))

(assert (=> b!992136 (= res!663115 (validKeyInArray!0 (select (arr!30202 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun d!118013 () Bool)

(declare-fun res!663116 () Bool)

(assert (=> d!118013 (=> res!663116 e!559645)))

(assert (=> d!118013 (= res!663116 (bvsge #b00000000000000000000000000000000 (size!30681 _keys!1945)))))

(assert (=> d!118013 (= (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20868) e!559645)))

(declare-fun b!992137 () Bool)

(assert (=> b!992137 (= e!559646 call!42091)))

(declare-fun b!992138 () Bool)

(declare-fun contains!5732 (List!20871 (_ BitVec 64)) Bool)

(assert (=> b!992138 (= e!559647 (contains!5732 Nil!20868 (select (arr!30202 _keys!1945) #b00000000000000000000000000000000)))))

(assert (= (and d!118013 (not res!663116)) b!992136))

(assert (= (and b!992136 res!663115) b!992138))

(assert (= (and b!992136 res!663117) b!992134))

(assert (= (and b!992134 c!100651) b!992135))

(assert (= (and b!992134 (not c!100651)) b!992137))

(assert (= (or b!992135 b!992137) bm!42088))

(assert (=> b!992134 m!919821))

(assert (=> b!992134 m!919821))

(assert (=> b!992134 m!919829))

(assert (=> bm!42088 m!919821))

(declare-fun m!919831 () Bool)

(assert (=> bm!42088 m!919831))

(assert (=> b!992136 m!919821))

(assert (=> b!992136 m!919821))

(assert (=> b!992136 m!919829))

(assert (=> b!992138 m!919821))

(assert (=> b!992138 m!919821))

(declare-fun m!919833 () Bool)

(assert (=> b!992138 m!919833))

(assert (=> b!992062 d!118013))

(declare-fun d!118015 () Bool)

(assert (=> d!118015 (= (inRange!0 (index!39248 lt!440047) mask!2471) (and (bvsge (index!39248 lt!440047) #b00000000000000000000000000000000) (bvslt (index!39248 lt!440047) (bvadd mask!2471 #b00000000000000000000000000000001))))))

(assert (=> b!992061 d!118015))

(declare-fun condMapEmpty!37137 () Bool)

(declare-fun mapDefault!37137 () ValueCell!11205)

(assert (=> mapNonEmpty!37131 (= condMapEmpty!37137 (= mapRest!37131 ((as const (Array (_ BitVec 32) ValueCell!11205)) mapDefault!37137)))))

(declare-fun e!559652 () Bool)

(declare-fun mapRes!37137 () Bool)

(assert (=> mapNonEmpty!37131 (= tp!70202 (and e!559652 mapRes!37137))))

(declare-fun mapNonEmpty!37137 () Bool)

(declare-fun tp!70208 () Bool)

(declare-fun e!559653 () Bool)

(assert (=> mapNonEmpty!37137 (= mapRes!37137 (and tp!70208 e!559653))))

(declare-fun mapKey!37137 () (_ BitVec 32))

(declare-fun mapValue!37137 () ValueCell!11205)

(declare-fun mapRest!37137 () (Array (_ BitVec 32) ValueCell!11205))

(assert (=> mapNonEmpty!37137 (= mapRest!37131 (store mapRest!37137 mapKey!37137 mapValue!37137))))

(declare-fun b!992146 () Bool)

(assert (=> b!992146 (= e!559652 tp_is_empty!23373)))

(declare-fun b!992145 () Bool)

(assert (=> b!992145 (= e!559653 tp_is_empty!23373)))

(declare-fun mapIsEmpty!37137 () Bool)

(assert (=> mapIsEmpty!37137 mapRes!37137))

(assert (= (and mapNonEmpty!37131 condMapEmpty!37137) mapIsEmpty!37137))

(assert (= (and mapNonEmpty!37131 (not condMapEmpty!37137)) mapNonEmpty!37137))

(assert (= (and mapNonEmpty!37137 ((_ is ValueCellFull!11205) mapValue!37137)) b!992145))

(assert (= (and mapNonEmpty!37131 ((_ is ValueCellFull!11205) mapDefault!37137)) b!992146))

(declare-fun m!919835 () Bool)

(assert (=> mapNonEmpty!37137 m!919835))

(check-sat (not b!992138) (not mapNonEmpty!37137) (not b!992136) (not d!118001) (not bm!42085) (not b!992134) (not b!992111) (not bm!42088) (not b!992123) tp_is_empty!23373 (not b!992121))
(check-sat)
