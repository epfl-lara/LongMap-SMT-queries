; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77660 () Bool)

(assert start!77660)

(declare-fun b!903915 () Bool)

(declare-fun res!609649 () Bool)

(declare-fun e!506457 () Bool)

(assert (=> b!903915 (=> (not res!609649) (not e!506457))))

(declare-datatypes ((array!53105 0))(
  ( (array!53106 (arr!25508 (Array (_ BitVec 32) (_ BitVec 64))) (size!25968 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53105)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53105 (_ BitVec 32)) Bool)

(assert (=> b!903915 (= res!609649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903916 () Bool)

(declare-fun res!609647 () Bool)

(assert (=> b!903916 (=> (not res!609647) (not e!506457))))

(declare-datatypes ((V!29639 0))(
  ( (V!29640 (val!9303 Int)) )
))
(declare-datatypes ((ValueCell!8771 0))(
  ( (ValueCellFull!8771 (v!11805 V!29639)) (EmptyCell!8771) )
))
(declare-datatypes ((array!53107 0))(
  ( (array!53108 (arr!25509 (Array (_ BitVec 32) ValueCell!8771)) (size!25969 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53107)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903916 (= res!609647 (and (= (size!25969 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25968 _keys!1386) (size!25969 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903917 () Bool)

(declare-fun res!609646 () Bool)

(assert (=> b!903917 (=> (not res!609646) (not e!506457))))

(declare-datatypes ((List!17860 0))(
  ( (Nil!17857) (Cons!17856 (h!19008 (_ BitVec 64)) (t!25235 List!17860)) )
))
(declare-fun arrayNoDuplicates!0 (array!53105 (_ BitVec 32) List!17860) Bool)

(assert (=> b!903917 (= res!609646 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17857))))

(declare-fun mapNonEmpty!29467 () Bool)

(declare-fun mapRes!29467 () Bool)

(declare-fun tp!56527 () Bool)

(declare-fun e!506456 () Bool)

(assert (=> mapNonEmpty!29467 (= mapRes!29467 (and tp!56527 e!506456))))

(declare-fun mapRest!29467 () (Array (_ BitVec 32) ValueCell!8771))

(declare-fun mapValue!29467 () ValueCell!8771)

(declare-fun mapKey!29467 () (_ BitVec 32))

(assert (=> mapNonEmpty!29467 (= (arr!25509 _values!1152) (store mapRest!29467 mapKey!29467 mapValue!29467))))

(declare-fun b!903918 () Bool)

(declare-fun e!506458 () Bool)

(declare-fun e!506460 () Bool)

(assert (=> b!903918 (= e!506458 (and e!506460 mapRes!29467))))

(declare-fun condMapEmpty!29467 () Bool)

(declare-fun mapDefault!29467 () ValueCell!8771)

(assert (=> b!903918 (= condMapEmpty!29467 (= (arr!25509 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8771)) mapDefault!29467)))))

(declare-fun b!903919 () Bool)

(declare-fun tp_is_empty!18505 () Bool)

(assert (=> b!903919 (= e!506460 tp_is_empty!18505)))

(declare-fun mapIsEmpty!29467 () Bool)

(assert (=> mapIsEmpty!29467 mapRes!29467))

(declare-fun res!609648 () Bool)

(assert (=> start!77660 (=> (not res!609648) (not e!506457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77660 (= res!609648 (validMask!0 mask!1756))))

(assert (=> start!77660 e!506457))

(assert (=> start!77660 true))

(declare-fun array_inv!20058 (array!53107) Bool)

(assert (=> start!77660 (and (array_inv!20058 _values!1152) e!506458)))

(declare-fun array_inv!20059 (array!53105) Bool)

(assert (=> start!77660 (array_inv!20059 _keys!1386)))

(declare-fun b!903920 () Bool)

(assert (=> b!903920 (= e!506457 (bvsgt #b00000000000000000000000000000000 (size!25968 _keys!1386)))))

(declare-fun b!903921 () Bool)

(assert (=> b!903921 (= e!506456 tp_is_empty!18505)))

(assert (= (and start!77660 res!609648) b!903916))

(assert (= (and b!903916 res!609647) b!903915))

(assert (= (and b!903915 res!609649) b!903917))

(assert (= (and b!903917 res!609646) b!903920))

(assert (= (and b!903918 condMapEmpty!29467) mapIsEmpty!29467))

(assert (= (and b!903918 (not condMapEmpty!29467)) mapNonEmpty!29467))

(get-info :version)

(assert (= (and mapNonEmpty!29467 ((_ is ValueCellFull!8771) mapValue!29467)) b!903921))

(assert (= (and b!903918 ((_ is ValueCellFull!8771) mapDefault!29467)) b!903919))

(assert (= start!77660 b!903918))

(declare-fun m!840113 () Bool)

(assert (=> b!903915 m!840113))

(declare-fun m!840115 () Bool)

(assert (=> b!903917 m!840115))

(declare-fun m!840117 () Bool)

(assert (=> mapNonEmpty!29467 m!840117))

(declare-fun m!840119 () Bool)

(assert (=> start!77660 m!840119))

(declare-fun m!840121 () Bool)

(assert (=> start!77660 m!840121))

(declare-fun m!840123 () Bool)

(assert (=> start!77660 m!840123))

(check-sat (not b!903915) (not b!903917) tp_is_empty!18505 (not start!77660) (not mapNonEmpty!29467))
(check-sat)
(get-model)

(declare-fun b!903972 () Bool)

(declare-fun e!506499 () Bool)

(declare-fun e!506498 () Bool)

(assert (=> b!903972 (= e!506499 e!506498)))

(declare-fun c!95927 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!903972 (= c!95927 (validKeyInArray!0 (select (arr!25508 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!903973 () Bool)

(declare-fun call!40294 () Bool)

(assert (=> b!903973 (= e!506498 call!40294)))

(declare-fun bm!40291 () Bool)

(assert (=> bm!40291 (= call!40294 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!112315 () Bool)

(declare-fun res!609679 () Bool)

(assert (=> d!112315 (=> res!609679 e!506499)))

(assert (=> d!112315 (= res!609679 (bvsge #b00000000000000000000000000000000 (size!25968 _keys!1386)))))

(assert (=> d!112315 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!506499)))

(declare-fun b!903974 () Bool)

(declare-fun e!506497 () Bool)

(assert (=> b!903974 (= e!506498 e!506497)))

(declare-fun lt!408317 () (_ BitVec 64))

(assert (=> b!903974 (= lt!408317 (select (arr!25508 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30644 0))(
  ( (Unit!30645) )
))
(declare-fun lt!408319 () Unit!30644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53105 (_ BitVec 64) (_ BitVec 32)) Unit!30644)

(assert (=> b!903974 (= lt!408319 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!408317 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903974 (arrayContainsKey!0 _keys!1386 lt!408317 #b00000000000000000000000000000000)))

(declare-fun lt!408318 () Unit!30644)

(assert (=> b!903974 (= lt!408318 lt!408319)))

(declare-fun res!609678 () Bool)

(declare-datatypes ((SeekEntryResult!8916 0))(
  ( (MissingZero!8916 (index!38035 (_ BitVec 32))) (Found!8916 (index!38036 (_ BitVec 32))) (Intermediate!8916 (undefined!9728 Bool) (index!38037 (_ BitVec 32)) (x!76975 (_ BitVec 32))) (Undefined!8916) (MissingVacant!8916 (index!38038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53105 (_ BitVec 32)) SeekEntryResult!8916)

(assert (=> b!903974 (= res!609678 (= (seekEntryOrOpen!0 (select (arr!25508 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8916 #b00000000000000000000000000000000)))))

(assert (=> b!903974 (=> (not res!609678) (not e!506497))))

(declare-fun b!903975 () Bool)

(assert (=> b!903975 (= e!506497 call!40294)))

(assert (= (and d!112315 (not res!609679)) b!903972))

(assert (= (and b!903972 c!95927) b!903974))

(assert (= (and b!903972 (not c!95927)) b!903973))

(assert (= (and b!903974 res!609678) b!903975))

(assert (= (or b!903975 b!903973) bm!40291))

(declare-fun m!840149 () Bool)

(assert (=> b!903972 m!840149))

(assert (=> b!903972 m!840149))

(declare-fun m!840151 () Bool)

(assert (=> b!903972 m!840151))

(declare-fun m!840153 () Bool)

(assert (=> bm!40291 m!840153))

(assert (=> b!903974 m!840149))

(declare-fun m!840155 () Bool)

(assert (=> b!903974 m!840155))

(declare-fun m!840157 () Bool)

(assert (=> b!903974 m!840157))

(assert (=> b!903974 m!840149))

(declare-fun m!840159 () Bool)

(assert (=> b!903974 m!840159))

(assert (=> b!903915 d!112315))

(declare-fun d!112317 () Bool)

(assert (=> d!112317 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77660 d!112317))

(declare-fun d!112319 () Bool)

(assert (=> d!112319 (= (array_inv!20058 _values!1152) (bvsge (size!25969 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77660 d!112319))

(declare-fun d!112321 () Bool)

(assert (=> d!112321 (= (array_inv!20059 _keys!1386) (bvsge (size!25968 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77660 d!112321))

(declare-fun b!903986 () Bool)

(declare-fun e!506509 () Bool)

(declare-fun e!506511 () Bool)

(assert (=> b!903986 (= e!506509 e!506511)))

(declare-fun c!95930 () Bool)

(assert (=> b!903986 (= c!95930 (validKeyInArray!0 (select (arr!25508 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!903987 () Bool)

(declare-fun e!506510 () Bool)

(declare-fun contains!4427 (List!17860 (_ BitVec 64)) Bool)

(assert (=> b!903987 (= e!506510 (contains!4427 Nil!17857 (select (arr!25508 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112323 () Bool)

(declare-fun res!609687 () Bool)

(declare-fun e!506508 () Bool)

(assert (=> d!112323 (=> res!609687 e!506508)))

(assert (=> d!112323 (= res!609687 (bvsge #b00000000000000000000000000000000 (size!25968 _keys!1386)))))

(assert (=> d!112323 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17857) e!506508)))

(declare-fun b!903988 () Bool)

(assert (=> b!903988 (= e!506508 e!506509)))

(declare-fun res!609686 () Bool)

(assert (=> b!903988 (=> (not res!609686) (not e!506509))))

(assert (=> b!903988 (= res!609686 (not e!506510))))

(declare-fun res!609688 () Bool)

(assert (=> b!903988 (=> (not res!609688) (not e!506510))))

(assert (=> b!903988 (= res!609688 (validKeyInArray!0 (select (arr!25508 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40294 () Bool)

(declare-fun call!40297 () Bool)

(assert (=> bm!40294 (= call!40297 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95930 (Cons!17856 (select (arr!25508 _keys!1386) #b00000000000000000000000000000000) Nil!17857) Nil!17857)))))

(declare-fun b!903989 () Bool)

(assert (=> b!903989 (= e!506511 call!40297)))

(declare-fun b!903990 () Bool)

(assert (=> b!903990 (= e!506511 call!40297)))

(assert (= (and d!112323 (not res!609687)) b!903988))

(assert (= (and b!903988 res!609688) b!903987))

(assert (= (and b!903988 res!609686) b!903986))

(assert (= (and b!903986 c!95930) b!903990))

(assert (= (and b!903986 (not c!95930)) b!903989))

(assert (= (or b!903990 b!903989) bm!40294))

(assert (=> b!903986 m!840149))

(assert (=> b!903986 m!840149))

(assert (=> b!903986 m!840151))

(assert (=> b!903987 m!840149))

(assert (=> b!903987 m!840149))

(declare-fun m!840161 () Bool)

(assert (=> b!903987 m!840161))

(assert (=> b!903988 m!840149))

(assert (=> b!903988 m!840149))

(assert (=> b!903988 m!840151))

(assert (=> bm!40294 m!840149))

(declare-fun m!840163 () Bool)

(assert (=> bm!40294 m!840163))

(assert (=> b!903917 d!112323))

(declare-fun condMapEmpty!29476 () Bool)

(declare-fun mapDefault!29476 () ValueCell!8771)

(assert (=> mapNonEmpty!29467 (= condMapEmpty!29476 (= mapRest!29467 ((as const (Array (_ BitVec 32) ValueCell!8771)) mapDefault!29476)))))

(declare-fun e!506516 () Bool)

(declare-fun mapRes!29476 () Bool)

(assert (=> mapNonEmpty!29467 (= tp!56527 (and e!506516 mapRes!29476))))

(declare-fun mapNonEmpty!29476 () Bool)

(declare-fun tp!56536 () Bool)

(declare-fun e!506517 () Bool)

(assert (=> mapNonEmpty!29476 (= mapRes!29476 (and tp!56536 e!506517))))

(declare-fun mapValue!29476 () ValueCell!8771)

(declare-fun mapKey!29476 () (_ BitVec 32))

(declare-fun mapRest!29476 () (Array (_ BitVec 32) ValueCell!8771))

(assert (=> mapNonEmpty!29476 (= mapRest!29467 (store mapRest!29476 mapKey!29476 mapValue!29476))))

(declare-fun b!903997 () Bool)

(assert (=> b!903997 (= e!506517 tp_is_empty!18505)))

(declare-fun b!903998 () Bool)

(assert (=> b!903998 (= e!506516 tp_is_empty!18505)))

(declare-fun mapIsEmpty!29476 () Bool)

(assert (=> mapIsEmpty!29476 mapRes!29476))

(assert (= (and mapNonEmpty!29467 condMapEmpty!29476) mapIsEmpty!29476))

(assert (= (and mapNonEmpty!29467 (not condMapEmpty!29476)) mapNonEmpty!29476))

(assert (= (and mapNonEmpty!29476 ((_ is ValueCellFull!8771) mapValue!29476)) b!903997))

(assert (= (and mapNonEmpty!29467 ((_ is ValueCellFull!8771) mapDefault!29476)) b!903998))

(declare-fun m!840165 () Bool)

(assert (=> mapNonEmpty!29476 m!840165))

(check-sat (not b!903987) (not mapNonEmpty!29476) (not b!903972) (not bm!40291) (not b!903988) (not bm!40294) (not b!903986) (not b!903974) tp_is_empty!18505)
(check-sat)
