; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104538 () Bool)

(assert start!104538)

(declare-fun b!1246943 () Bool)

(declare-fun e!707303 () Bool)

(declare-fun tp_is_empty!31309 () Bool)

(assert (=> b!1246943 (= e!707303 tp_is_empty!31309)))

(declare-fun mapIsEmpty!48706 () Bool)

(declare-fun mapRes!48706 () Bool)

(assert (=> mapIsEmpty!48706 mapRes!48706))

(declare-fun b!1246944 () Bool)

(declare-fun res!832109 () Bool)

(declare-fun e!707300 () Bool)

(assert (=> b!1246944 (=> (not res!832109) (not e!707300))))

(declare-datatypes ((array!80231 0))(
  ( (array!80232 (arr!38689 (Array (_ BitVec 32) (_ BitVec 64))) (size!39227 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80231)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80231 (_ BitVec 32)) Bool)

(assert (=> b!1246944 (= res!832109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1246945 () Bool)

(declare-fun res!832108 () Bool)

(assert (=> b!1246945 (=> (not res!832108) (not e!707300))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47111 0))(
  ( (V!47112 (val!15717 Int)) )
))
(declare-datatypes ((ValueCell!14891 0))(
  ( (ValueCellFull!14891 (v!18411 V!47111)) (EmptyCell!14891) )
))
(declare-datatypes ((array!80233 0))(
  ( (array!80234 (arr!38690 (Array (_ BitVec 32) ValueCell!14891)) (size!39228 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80233)

(assert (=> b!1246945 (= res!832108 (and (= (size!39228 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39227 _keys!1118) (size!39228 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!832110 () Bool)

(assert (=> start!104538 (=> (not res!832110) (not e!707300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104538 (= res!832110 (validMask!0 mask!1466))))

(assert (=> start!104538 e!707300))

(assert (=> start!104538 true))

(declare-fun array_inv!29667 (array!80231) Bool)

(assert (=> start!104538 (array_inv!29667 _keys!1118)))

(declare-fun e!707299 () Bool)

(declare-fun array_inv!29668 (array!80233) Bool)

(assert (=> start!104538 (and (array_inv!29668 _values!914) e!707299)))

(declare-fun b!1246946 () Bool)

(declare-fun e!707301 () Bool)

(assert (=> b!1246946 (= e!707301 tp_is_empty!31309)))

(declare-fun b!1246947 () Bool)

(assert (=> b!1246947 (= e!707300 (bvsgt #b00000000000000000000000000000000 (size!39227 _keys!1118)))))

(declare-fun b!1246948 () Bool)

(assert (=> b!1246948 (= e!707299 (and e!707301 mapRes!48706))))

(declare-fun condMapEmpty!48706 () Bool)

(declare-fun mapDefault!48706 () ValueCell!14891)

(assert (=> b!1246948 (= condMapEmpty!48706 (= (arr!38690 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14891)) mapDefault!48706)))))

(declare-fun mapNonEmpty!48706 () Bool)

(declare-fun tp!92807 () Bool)

(assert (=> mapNonEmpty!48706 (= mapRes!48706 (and tp!92807 e!707303))))

(declare-fun mapValue!48706 () ValueCell!14891)

(declare-fun mapKey!48706 () (_ BitVec 32))

(declare-fun mapRest!48706 () (Array (_ BitVec 32) ValueCell!14891))

(assert (=> mapNonEmpty!48706 (= (arr!38690 _values!914) (store mapRest!48706 mapKey!48706 mapValue!48706))))

(assert (= (and start!104538 res!832110) b!1246945))

(assert (= (and b!1246945 res!832108) b!1246944))

(assert (= (and b!1246944 res!832109) b!1246947))

(assert (= (and b!1246948 condMapEmpty!48706) mapIsEmpty!48706))

(assert (= (and b!1246948 (not condMapEmpty!48706)) mapNonEmpty!48706))

(get-info :version)

(assert (= (and mapNonEmpty!48706 ((_ is ValueCellFull!14891) mapValue!48706)) b!1246943))

(assert (= (and b!1246948 ((_ is ValueCellFull!14891) mapDefault!48706)) b!1246946))

(assert (= start!104538 b!1246948))

(declare-fun m!1148169 () Bool)

(assert (=> b!1246944 m!1148169))

(declare-fun m!1148171 () Bool)

(assert (=> start!104538 m!1148171))

(declare-fun m!1148173 () Bool)

(assert (=> start!104538 m!1148173))

(declare-fun m!1148175 () Bool)

(assert (=> start!104538 m!1148175))

(declare-fun m!1148177 () Bool)

(assert (=> mapNonEmpty!48706 m!1148177))

(check-sat (not b!1246944) (not start!104538) (not mapNonEmpty!48706) tp_is_empty!31309)
(check-sat)
(get-model)

(declare-fun b!1246993 () Bool)

(declare-fun e!707341 () Bool)

(declare-fun call!61535 () Bool)

(assert (=> b!1246993 (= e!707341 call!61535)))

(declare-fun d!137589 () Bool)

(declare-fun res!832133 () Bool)

(declare-fun e!707340 () Bool)

(assert (=> d!137589 (=> res!832133 e!707340)))

(assert (=> d!137589 (= res!832133 (bvsge #b00000000000000000000000000000000 (size!39227 _keys!1118)))))

(assert (=> d!137589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!707340)))

(declare-fun b!1246994 () Bool)

(declare-fun e!707342 () Bool)

(assert (=> b!1246994 (= e!707342 e!707341)))

(declare-fun lt!563038 () (_ BitVec 64))

(assert (=> b!1246994 (= lt!563038 (select (arr!38689 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41310 0))(
  ( (Unit!41311) )
))
(declare-fun lt!563037 () Unit!41310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80231 (_ BitVec 64) (_ BitVec 32)) Unit!41310)

(assert (=> b!1246994 (= lt!563037 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563038 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1246994 (arrayContainsKey!0 _keys!1118 lt!563038 #b00000000000000000000000000000000)))

(declare-fun lt!563036 () Unit!41310)

(assert (=> b!1246994 (= lt!563036 lt!563037)))

(declare-fun res!832134 () Bool)

(declare-datatypes ((SeekEntryResult!9951 0))(
  ( (MissingZero!9951 (index!42175 (_ BitVec 32))) (Found!9951 (index!42176 (_ BitVec 32))) (Intermediate!9951 (undefined!10763 Bool) (index!42177 (_ BitVec 32)) (x!109569 (_ BitVec 32))) (Undefined!9951) (MissingVacant!9951 (index!42178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80231 (_ BitVec 32)) SeekEntryResult!9951)

(assert (=> b!1246994 (= res!832134 (= (seekEntryOrOpen!0 (select (arr!38689 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9951 #b00000000000000000000000000000000)))))

(assert (=> b!1246994 (=> (not res!832134) (not e!707341))))

(declare-fun b!1246995 () Bool)

(assert (=> b!1246995 (= e!707340 e!707342)))

(declare-fun c!122073 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246995 (= c!122073 (validKeyInArray!0 (select (arr!38689 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61532 () Bool)

(assert (=> bm!61532 (= call!61535 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1246996 () Bool)

(assert (=> b!1246996 (= e!707342 call!61535)))

(assert (= (and d!137589 (not res!832133)) b!1246995))

(assert (= (and b!1246995 c!122073) b!1246994))

(assert (= (and b!1246995 (not c!122073)) b!1246996))

(assert (= (and b!1246994 res!832134) b!1246993))

(assert (= (or b!1246993 b!1246996) bm!61532))

(declare-fun m!1148199 () Bool)

(assert (=> b!1246994 m!1148199))

(declare-fun m!1148201 () Bool)

(assert (=> b!1246994 m!1148201))

(declare-fun m!1148203 () Bool)

(assert (=> b!1246994 m!1148203))

(assert (=> b!1246994 m!1148199))

(declare-fun m!1148205 () Bool)

(assert (=> b!1246994 m!1148205))

(assert (=> b!1246995 m!1148199))

(assert (=> b!1246995 m!1148199))

(declare-fun m!1148207 () Bool)

(assert (=> b!1246995 m!1148207))

(declare-fun m!1148209 () Bool)

(assert (=> bm!61532 m!1148209))

(assert (=> b!1246944 d!137589))

(declare-fun d!137591 () Bool)

(assert (=> d!137591 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104538 d!137591))

(declare-fun d!137593 () Bool)

(assert (=> d!137593 (= (array_inv!29667 _keys!1118) (bvsge (size!39227 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104538 d!137593))

(declare-fun d!137595 () Bool)

(assert (=> d!137595 (= (array_inv!29668 _values!914) (bvsge (size!39228 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104538 d!137595))

(declare-fun b!1247003 () Bool)

(declare-fun e!707348 () Bool)

(assert (=> b!1247003 (= e!707348 tp_is_empty!31309)))

(declare-fun condMapEmpty!48715 () Bool)

(declare-fun mapDefault!48715 () ValueCell!14891)

(assert (=> mapNonEmpty!48706 (= condMapEmpty!48715 (= mapRest!48706 ((as const (Array (_ BitVec 32) ValueCell!14891)) mapDefault!48715)))))

(declare-fun e!707347 () Bool)

(declare-fun mapRes!48715 () Bool)

(assert (=> mapNonEmpty!48706 (= tp!92807 (and e!707347 mapRes!48715))))

(declare-fun mapIsEmpty!48715 () Bool)

(assert (=> mapIsEmpty!48715 mapRes!48715))

(declare-fun b!1247004 () Bool)

(assert (=> b!1247004 (= e!707347 tp_is_empty!31309)))

(declare-fun mapNonEmpty!48715 () Bool)

(declare-fun tp!92816 () Bool)

(assert (=> mapNonEmpty!48715 (= mapRes!48715 (and tp!92816 e!707348))))

(declare-fun mapKey!48715 () (_ BitVec 32))

(declare-fun mapValue!48715 () ValueCell!14891)

(declare-fun mapRest!48715 () (Array (_ BitVec 32) ValueCell!14891))

(assert (=> mapNonEmpty!48715 (= mapRest!48706 (store mapRest!48715 mapKey!48715 mapValue!48715))))

(assert (= (and mapNonEmpty!48706 condMapEmpty!48715) mapIsEmpty!48715))

(assert (= (and mapNonEmpty!48706 (not condMapEmpty!48715)) mapNonEmpty!48715))

(assert (= (and mapNonEmpty!48715 ((_ is ValueCellFull!14891) mapValue!48715)) b!1247003))

(assert (= (and mapNonEmpty!48706 ((_ is ValueCellFull!14891) mapDefault!48715)) b!1247004))

(declare-fun m!1148211 () Bool)

(assert (=> mapNonEmpty!48715 m!1148211))

(check-sat (not mapNonEmpty!48715) (not b!1246994) (not b!1246995) (not bm!61532) tp_is_empty!31309)
(check-sat)
