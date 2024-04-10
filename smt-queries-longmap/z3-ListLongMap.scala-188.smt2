; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3738 () Bool)

(assert start!3738)

(declare-fun b!26098 () Bool)

(declare-fun res!15517 () Bool)

(declare-fun e!16946 () Bool)

(assert (=> b!26098 (=> (not res!15517) (not e!16946))))

(declare-datatypes ((array!1387 0))(
  ( (array!1388 (arr!652 (Array (_ BitVec 32) (_ BitVec 64))) (size!753 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1387)

(assert (=> b!26098 (= res!15517 (and (bvsle #b00000000000000000000000000000000 (size!753 _keys!1833)) (bvslt (size!753 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!1120 () Bool)

(declare-fun mapRes!1120 () Bool)

(assert (=> mapIsEmpty!1120 mapRes!1120))

(declare-fun b!26099 () Bool)

(declare-fun e!16947 () Bool)

(declare-fun tp_is_empty!1071 () Bool)

(assert (=> b!26099 (= e!16947 tp_is_empty!1071)))

(declare-fun b!26100 () Bool)

(declare-fun e!16945 () Bool)

(declare-datatypes ((List!579 0))(
  ( (Nil!576) (Cons!575 (h!1142 (_ BitVec 64)) (t!3266 List!579)) )
))
(declare-fun contains!237 (List!579 (_ BitVec 64)) Bool)

(assert (=> b!26100 (= e!16945 (contains!237 Nil!576 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26101 () Bool)

(assert (=> b!26101 (= e!16946 e!16945)))

(declare-fun res!15516 () Bool)

(assert (=> b!26101 (=> res!15516 e!16945)))

(assert (=> b!26101 (= res!15516 (contains!237 Nil!576 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!1120 () Bool)

(declare-fun tp!3640 () Bool)

(declare-fun e!16942 () Bool)

(assert (=> mapNonEmpty!1120 (= mapRes!1120 (and tp!3640 e!16942))))

(declare-datatypes ((V!1253 0))(
  ( (V!1254 (val!562 Int)) )
))
(declare-datatypes ((ValueCell!336 0))(
  ( (ValueCellFull!336 (v!1647 V!1253)) (EmptyCell!336) )
))
(declare-datatypes ((array!1389 0))(
  ( (array!1390 (arr!653 (Array (_ BitVec 32) ValueCell!336)) (size!754 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1389)

(declare-fun mapKey!1120 () (_ BitVec 32))

(declare-fun mapValue!1120 () ValueCell!336)

(declare-fun mapRest!1120 () (Array (_ BitVec 32) ValueCell!336))

(assert (=> mapNonEmpty!1120 (= (arr!653 _values!1501) (store mapRest!1120 mapKey!1120 mapValue!1120))))

(declare-fun b!26102 () Bool)

(declare-fun e!16944 () Bool)

(assert (=> b!26102 (= e!16944 (and e!16947 mapRes!1120))))

(declare-fun condMapEmpty!1120 () Bool)

(declare-fun mapDefault!1120 () ValueCell!336)

(assert (=> b!26102 (= condMapEmpty!1120 (= (arr!653 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!336)) mapDefault!1120)))))

(declare-fun b!26103 () Bool)

(declare-fun res!15519 () Bool)

(assert (=> b!26103 (=> (not res!15519) (not e!16946))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1387 (_ BitVec 32)) Bool)

(assert (=> b!26103 (= res!15519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26104 () Bool)

(declare-fun res!15515 () Bool)

(assert (=> b!26104 (=> (not res!15515) (not e!16946))))

(declare-fun noDuplicate!14 (List!579) Bool)

(assert (=> b!26104 (= res!15515 (noDuplicate!14 Nil!576))))

(declare-fun res!15520 () Bool)

(assert (=> start!3738 (=> (not res!15520) (not e!16946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3738 (= res!15520 (validMask!0 mask!2294))))

(assert (=> start!3738 e!16946))

(assert (=> start!3738 true))

(declare-fun array_inv!441 (array!1389) Bool)

(assert (=> start!3738 (and (array_inv!441 _values!1501) e!16944)))

(declare-fun array_inv!442 (array!1387) Bool)

(assert (=> start!3738 (array_inv!442 _keys!1833)))

(declare-fun b!26105 () Bool)

(declare-fun res!15518 () Bool)

(assert (=> b!26105 (=> (not res!15518) (not e!16946))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26105 (= res!15518 (and (= (size!754 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!753 _keys!1833) (size!754 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26106 () Bool)

(assert (=> b!26106 (= e!16942 tp_is_empty!1071)))

(assert (= (and start!3738 res!15520) b!26105))

(assert (= (and b!26105 res!15518) b!26103))

(assert (= (and b!26103 res!15519) b!26098))

(assert (= (and b!26098 res!15517) b!26104))

(assert (= (and b!26104 res!15515) b!26101))

(assert (= (and b!26101 (not res!15516)) b!26100))

(assert (= (and b!26102 condMapEmpty!1120) mapIsEmpty!1120))

(assert (= (and b!26102 (not condMapEmpty!1120)) mapNonEmpty!1120))

(get-info :version)

(assert (= (and mapNonEmpty!1120 ((_ is ValueCellFull!336) mapValue!1120)) b!26106))

(assert (= (and b!26102 ((_ is ValueCellFull!336) mapDefault!1120)) b!26099))

(assert (= start!3738 b!26102))

(declare-fun m!20981 () Bool)

(assert (=> b!26101 m!20981))

(declare-fun m!20983 () Bool)

(assert (=> start!3738 m!20983))

(declare-fun m!20985 () Bool)

(assert (=> start!3738 m!20985))

(declare-fun m!20987 () Bool)

(assert (=> start!3738 m!20987))

(declare-fun m!20989 () Bool)

(assert (=> b!26104 m!20989))

(declare-fun m!20991 () Bool)

(assert (=> b!26103 m!20991))

(declare-fun m!20993 () Bool)

(assert (=> mapNonEmpty!1120 m!20993))

(declare-fun m!20995 () Bool)

(assert (=> b!26100 m!20995))

(check-sat (not b!26101) (not start!3738) tp_is_empty!1071 (not mapNonEmpty!1120) (not b!26103) (not b!26104) (not b!26100))
(check-sat)
(get-model)

(declare-fun b!26142 () Bool)

(declare-fun e!16972 () Bool)

(declare-fun call!2501 () Bool)

(assert (=> b!26142 (= e!16972 call!2501)))

(declare-fun b!26143 () Bool)

(declare-fun e!16974 () Bool)

(assert (=> b!26143 (= e!16974 e!16972)))

(declare-fun lt!10314 () (_ BitVec 64))

(assert (=> b!26143 (= lt!10314 (select (arr!652 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!623 0))(
  ( (Unit!624) )
))
(declare-fun lt!10315 () Unit!623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1387 (_ BitVec 64) (_ BitVec 32)) Unit!623)

(assert (=> b!26143 (= lt!10315 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10314 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26143 (arrayContainsKey!0 _keys!1833 lt!10314 #b00000000000000000000000000000000)))

(declare-fun lt!10313 () Unit!623)

(assert (=> b!26143 (= lt!10313 lt!10315)))

(declare-fun res!15544 () Bool)

(declare-datatypes ((SeekEntryResult!60 0))(
  ( (MissingZero!60 (index!2362 (_ BitVec 32))) (Found!60 (index!2363 (_ BitVec 32))) (Intermediate!60 (undefined!872 Bool) (index!2364 (_ BitVec 32)) (x!6074 (_ BitVec 32))) (Undefined!60) (MissingVacant!60 (index!2365 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1387 (_ BitVec 32)) SeekEntryResult!60)

(assert (=> b!26143 (= res!15544 (= (seekEntryOrOpen!0 (select (arr!652 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!60 #b00000000000000000000000000000000)))))

(assert (=> b!26143 (=> (not res!15544) (not e!16972))))

(declare-fun b!26144 () Bool)

(declare-fun e!16973 () Bool)

(assert (=> b!26144 (= e!16973 e!16974)))

(declare-fun c!3650 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26144 (= c!3650 (validKeyInArray!0 (select (arr!652 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4863 () Bool)

(declare-fun res!15543 () Bool)

(assert (=> d!4863 (=> res!15543 e!16973)))

(assert (=> d!4863 (= res!15543 (bvsge #b00000000000000000000000000000000 (size!753 _keys!1833)))))

(assert (=> d!4863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16973)))

(declare-fun bm!2498 () Bool)

(assert (=> bm!2498 (= call!2501 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26145 () Bool)

(assert (=> b!26145 (= e!16974 call!2501)))

(assert (= (and d!4863 (not res!15543)) b!26144))

(assert (= (and b!26144 c!3650) b!26143))

(assert (= (and b!26144 (not c!3650)) b!26145))

(assert (= (and b!26143 res!15544) b!26142))

(assert (= (or b!26142 b!26145) bm!2498))

(declare-fun m!21013 () Bool)

(assert (=> b!26143 m!21013))

(declare-fun m!21015 () Bool)

(assert (=> b!26143 m!21015))

(declare-fun m!21017 () Bool)

(assert (=> b!26143 m!21017))

(assert (=> b!26143 m!21013))

(declare-fun m!21019 () Bool)

(assert (=> b!26143 m!21019))

(assert (=> b!26144 m!21013))

(assert (=> b!26144 m!21013))

(declare-fun m!21021 () Bool)

(assert (=> b!26144 m!21021))

(declare-fun m!21023 () Bool)

(assert (=> bm!2498 m!21023))

(assert (=> b!26103 d!4863))

(declare-fun d!4865 () Bool)

(declare-fun res!15549 () Bool)

(declare-fun e!16979 () Bool)

(assert (=> d!4865 (=> res!15549 e!16979)))

(assert (=> d!4865 (= res!15549 ((_ is Nil!576) Nil!576))))

(assert (=> d!4865 (= (noDuplicate!14 Nil!576) e!16979)))

(declare-fun b!26150 () Bool)

(declare-fun e!16980 () Bool)

(assert (=> b!26150 (= e!16979 e!16980)))

(declare-fun res!15550 () Bool)

(assert (=> b!26150 (=> (not res!15550) (not e!16980))))

(assert (=> b!26150 (= res!15550 (not (contains!237 (t!3266 Nil!576) (h!1142 Nil!576))))))

(declare-fun b!26151 () Bool)

(assert (=> b!26151 (= e!16980 (noDuplicate!14 (t!3266 Nil!576)))))

(assert (= (and d!4865 (not res!15549)) b!26150))

(assert (= (and b!26150 res!15550) b!26151))

(declare-fun m!21025 () Bool)

(assert (=> b!26150 m!21025))

(declare-fun m!21027 () Bool)

(assert (=> b!26151 m!21027))

(assert (=> b!26104 d!4865))

(declare-fun d!4867 () Bool)

(declare-fun lt!10318 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!17 (List!579) (InoxSet (_ BitVec 64)))

(assert (=> d!4867 (= lt!10318 (select (content!17 Nil!576) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16986 () Bool)

(assert (=> d!4867 (= lt!10318 e!16986)))

(declare-fun res!15556 () Bool)

(assert (=> d!4867 (=> (not res!15556) (not e!16986))))

(assert (=> d!4867 (= res!15556 ((_ is Cons!575) Nil!576))))

(assert (=> d!4867 (= (contains!237 Nil!576 #b1000000000000000000000000000000000000000000000000000000000000000) lt!10318)))

(declare-fun b!26156 () Bool)

(declare-fun e!16985 () Bool)

(assert (=> b!26156 (= e!16986 e!16985)))

(declare-fun res!15555 () Bool)

(assert (=> b!26156 (=> res!15555 e!16985)))

(assert (=> b!26156 (= res!15555 (= (h!1142 Nil!576) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26157 () Bool)

(assert (=> b!26157 (= e!16985 (contains!237 (t!3266 Nil!576) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!4867 res!15556) b!26156))

(assert (= (and b!26156 (not res!15555)) b!26157))

(declare-fun m!21029 () Bool)

(assert (=> d!4867 m!21029))

(declare-fun m!21031 () Bool)

(assert (=> d!4867 m!21031))

(declare-fun m!21033 () Bool)

(assert (=> b!26157 m!21033))

(assert (=> b!26100 d!4867))

(declare-fun d!4869 () Bool)

(assert (=> d!4869 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3738 d!4869))

(declare-fun d!4871 () Bool)

(assert (=> d!4871 (= (array_inv!441 _values!1501) (bvsge (size!754 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3738 d!4871))

(declare-fun d!4873 () Bool)

(assert (=> d!4873 (= (array_inv!442 _keys!1833) (bvsge (size!753 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3738 d!4873))

(declare-fun d!4875 () Bool)

(declare-fun lt!10319 () Bool)

(assert (=> d!4875 (= lt!10319 (select (content!17 Nil!576) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16988 () Bool)

(assert (=> d!4875 (= lt!10319 e!16988)))

(declare-fun res!15558 () Bool)

(assert (=> d!4875 (=> (not res!15558) (not e!16988))))

(assert (=> d!4875 (= res!15558 ((_ is Cons!575) Nil!576))))

(assert (=> d!4875 (= (contains!237 Nil!576 #b0000000000000000000000000000000000000000000000000000000000000000) lt!10319)))

(declare-fun b!26158 () Bool)

(declare-fun e!16987 () Bool)

(assert (=> b!26158 (= e!16988 e!16987)))

(declare-fun res!15557 () Bool)

(assert (=> b!26158 (=> res!15557 e!16987)))

(assert (=> b!26158 (= res!15557 (= (h!1142 Nil!576) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26159 () Bool)

(assert (=> b!26159 (= e!16987 (contains!237 (t!3266 Nil!576) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!4875 res!15558) b!26158))

(assert (= (and b!26158 (not res!15557)) b!26159))

(assert (=> d!4875 m!21029))

(declare-fun m!21035 () Bool)

(assert (=> d!4875 m!21035))

(declare-fun m!21037 () Bool)

(assert (=> b!26159 m!21037))

(assert (=> b!26101 d!4875))

(declare-fun mapNonEmpty!1126 () Bool)

(declare-fun mapRes!1126 () Bool)

(declare-fun tp!3646 () Bool)

(declare-fun e!16993 () Bool)

(assert (=> mapNonEmpty!1126 (= mapRes!1126 (and tp!3646 e!16993))))

(declare-fun mapKey!1126 () (_ BitVec 32))

(declare-fun mapValue!1126 () ValueCell!336)

(declare-fun mapRest!1126 () (Array (_ BitVec 32) ValueCell!336))

(assert (=> mapNonEmpty!1126 (= mapRest!1120 (store mapRest!1126 mapKey!1126 mapValue!1126))))

(declare-fun mapIsEmpty!1126 () Bool)

(assert (=> mapIsEmpty!1126 mapRes!1126))

(declare-fun b!26167 () Bool)

(declare-fun e!16994 () Bool)

(assert (=> b!26167 (= e!16994 tp_is_empty!1071)))

(declare-fun condMapEmpty!1126 () Bool)

(declare-fun mapDefault!1126 () ValueCell!336)

(assert (=> mapNonEmpty!1120 (= condMapEmpty!1126 (= mapRest!1120 ((as const (Array (_ BitVec 32) ValueCell!336)) mapDefault!1126)))))

(assert (=> mapNonEmpty!1120 (= tp!3640 (and e!16994 mapRes!1126))))

(declare-fun b!26166 () Bool)

(assert (=> b!26166 (= e!16993 tp_is_empty!1071)))

(assert (= (and mapNonEmpty!1120 condMapEmpty!1126) mapIsEmpty!1126))

(assert (= (and mapNonEmpty!1120 (not condMapEmpty!1126)) mapNonEmpty!1126))

(assert (= (and mapNonEmpty!1126 ((_ is ValueCellFull!336) mapValue!1126)) b!26166))

(assert (= (and mapNonEmpty!1120 ((_ is ValueCellFull!336) mapDefault!1126)) b!26167))

(declare-fun m!21039 () Bool)

(assert (=> mapNonEmpty!1126 m!21039))

(check-sat (not b!26157) (not b!26159) (not b!26144) (not d!4875) (not mapNonEmpty!1126) (not bm!2498) (not d!4867) (not b!26150) (not b!26143) tp_is_empty!1071 (not b!26151))
(check-sat)
