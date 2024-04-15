; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128072 () Bool)

(assert start!128072)

(declare-fun res!1025076 () Bool)

(declare-fun e!840773 () Bool)

(assert (=> start!128072 (=> (not res!1025076) (not e!840773))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128072 (= res!1025076 (validMask!0 mask!2661))))

(assert (=> start!128072 e!840773))

(assert (=> start!128072 true))

(declare-datatypes ((array!100303 0))(
  ( (array!100304 (arr!48406 (Array (_ BitVec 32) (_ BitVec 64))) (size!48958 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100303)

(declare-fun array_inv!37639 (array!100303) Bool)

(assert (=> start!128072 (array_inv!37639 a!2850)))

(declare-fun b!1504183 () Bool)

(declare-fun res!1025072 () Bool)

(assert (=> b!1504183 (=> (not res!1025072) (not e!840773))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504183 (= res!1025072 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48958 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48958 a!2850)) (= (select (arr!48406 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48406 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48958 a!2850))))))

(declare-fun b!1504184 () Bool)

(declare-fun e!840771 () Bool)

(assert (=> b!1504184 (= e!840773 e!840771)))

(declare-fun res!1025078 () Bool)

(assert (=> b!1504184 (=> (not res!1025078) (not e!840771))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12625 0))(
  ( (MissingZero!12625 (index!52892 (_ BitVec 32))) (Found!12625 (index!52893 (_ BitVec 32))) (Intermediate!12625 (undefined!13437 Bool) (index!52894 (_ BitVec 32)) (x!134584 (_ BitVec 32))) (Undefined!12625) (MissingVacant!12625 (index!52895 (_ BitVec 32))) )
))
(declare-fun lt!653445 () SeekEntryResult!12625)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100303 (_ BitVec 32)) SeekEntryResult!12625)

(assert (=> b!1504184 (= res!1025078 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48406 a!2850) j!87) a!2850 mask!2661) lt!653445))))

(assert (=> b!1504184 (= lt!653445 (Found!12625 j!87))))

(declare-fun b!1504185 () Bool)

(declare-fun res!1025071 () Bool)

(assert (=> b!1504185 (=> (not res!1025071) (not e!840773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504185 (= res!1025071 (validKeyInArray!0 (select (arr!48406 a!2850) j!87)))))

(declare-fun b!1504186 () Bool)

(declare-fun res!1025073 () Bool)

(assert (=> b!1504186 (=> (not res!1025073) (not e!840773))))

(declare-datatypes ((List!34976 0))(
  ( (Nil!34973) (Cons!34972 (h!36370 (_ BitVec 64)) (t!49662 List!34976)) )
))
(declare-fun arrayNoDuplicates!0 (array!100303 (_ BitVec 32) List!34976) Bool)

(assert (=> b!1504186 (= res!1025073 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34973))))

(declare-fun b!1504187 () Bool)

(declare-fun res!1025070 () Bool)

(assert (=> b!1504187 (=> (not res!1025070) (not e!840771))))

(assert (=> b!1504187 (= res!1025070 (not (= (select (arr!48406 a!2850) index!625) (select (arr!48406 a!2850) j!87))))))

(declare-fun lt!653446 () (_ BitVec 32))

(declare-fun b!1504188 () Bool)

(declare-fun e!840772 () Bool)

(assert (=> b!1504188 (= e!840772 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653446 vacantBefore!10 (select (arr!48406 a!2850) j!87) a!2850 mask!2661) lt!653445)))))

(declare-fun b!1504189 () Bool)

(declare-fun res!1025077 () Bool)

(assert (=> b!1504189 (=> (not res!1025077) (not e!840773))))

(assert (=> b!1504189 (= res!1025077 (validKeyInArray!0 (select (arr!48406 a!2850) i!996)))))

(declare-fun b!1504190 () Bool)

(declare-fun res!1025075 () Bool)

(assert (=> b!1504190 (=> (not res!1025075) (not e!840773))))

(assert (=> b!1504190 (= res!1025075 (and (= (size!48958 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48958 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48958 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504191 () Bool)

(declare-fun res!1025069 () Bool)

(assert (=> b!1504191 (=> (not res!1025069) (not e!840773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100303 (_ BitVec 32)) Bool)

(assert (=> b!1504191 (= res!1025069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504192 () Bool)

(assert (=> b!1504192 (= e!840771 e!840772)))

(declare-fun res!1025074 () Bool)

(assert (=> b!1504192 (=> (not res!1025074) (not e!840772))))

(assert (=> b!1504192 (= res!1025074 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653446 #b00000000000000000000000000000000) (bvslt lt!653446 (size!48958 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504192 (= lt!653446 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!128072 res!1025076) b!1504190))

(assert (= (and b!1504190 res!1025075) b!1504189))

(assert (= (and b!1504189 res!1025077) b!1504185))

(assert (= (and b!1504185 res!1025071) b!1504191))

(assert (= (and b!1504191 res!1025069) b!1504186))

(assert (= (and b!1504186 res!1025073) b!1504183))

(assert (= (and b!1504183 res!1025072) b!1504184))

(assert (= (and b!1504184 res!1025078) b!1504187))

(assert (= (and b!1504187 res!1025070) b!1504192))

(assert (= (and b!1504192 res!1025074) b!1504188))

(declare-fun m!1386781 () Bool)

(assert (=> b!1504191 m!1386781))

(declare-fun m!1386783 () Bool)

(assert (=> start!128072 m!1386783))

(declare-fun m!1386785 () Bool)

(assert (=> start!128072 m!1386785))

(declare-fun m!1386787 () Bool)

(assert (=> b!1504188 m!1386787))

(assert (=> b!1504188 m!1386787))

(declare-fun m!1386789 () Bool)

(assert (=> b!1504188 m!1386789))

(declare-fun m!1386791 () Bool)

(assert (=> b!1504189 m!1386791))

(assert (=> b!1504189 m!1386791))

(declare-fun m!1386793 () Bool)

(assert (=> b!1504189 m!1386793))

(declare-fun m!1386795 () Bool)

(assert (=> b!1504187 m!1386795))

(assert (=> b!1504187 m!1386787))

(declare-fun m!1386797 () Bool)

(assert (=> b!1504192 m!1386797))

(declare-fun m!1386799 () Bool)

(assert (=> b!1504183 m!1386799))

(declare-fun m!1386801 () Bool)

(assert (=> b!1504183 m!1386801))

(declare-fun m!1386803 () Bool)

(assert (=> b!1504183 m!1386803))

(assert (=> b!1504185 m!1386787))

(assert (=> b!1504185 m!1386787))

(declare-fun m!1386805 () Bool)

(assert (=> b!1504185 m!1386805))

(assert (=> b!1504184 m!1386787))

(assert (=> b!1504184 m!1386787))

(declare-fun m!1386807 () Bool)

(assert (=> b!1504184 m!1386807))

(declare-fun m!1386809 () Bool)

(assert (=> b!1504186 m!1386809))

(check-sat (not b!1504185) (not start!128072) (not b!1504192) (not b!1504184) (not b!1504186) (not b!1504188) (not b!1504189) (not b!1504191))
(check-sat)
(get-model)

(declare-fun b!1504265 () Bool)

(declare-fun e!840805 () SeekEntryResult!12625)

(assert (=> b!1504265 (= e!840805 (MissingVacant!12625 vacantBefore!10))))

(declare-fun b!1504266 () Bool)

(declare-fun c!139100 () Bool)

(declare-fun lt!653464 () (_ BitVec 64))

(assert (=> b!1504266 (= c!139100 (= lt!653464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840807 () SeekEntryResult!12625)

(assert (=> b!1504266 (= e!840807 e!840805)))

(declare-fun b!1504267 () Bool)

(declare-fun e!840806 () SeekEntryResult!12625)

(assert (=> b!1504267 (= e!840806 e!840807)))

(declare-fun c!139102 () Bool)

(assert (=> b!1504267 (= c!139102 (= lt!653464 (select (arr!48406 a!2850) j!87)))))

(declare-fun d!157641 () Bool)

(declare-fun lt!653463 () SeekEntryResult!12625)

(get-info :version)

(assert (=> d!157641 (and (or ((_ is Undefined!12625) lt!653463) (not ((_ is Found!12625) lt!653463)) (and (bvsge (index!52893 lt!653463) #b00000000000000000000000000000000) (bvslt (index!52893 lt!653463) (size!48958 a!2850)))) (or ((_ is Undefined!12625) lt!653463) ((_ is Found!12625) lt!653463) (not ((_ is MissingVacant!12625) lt!653463)) (not (= (index!52895 lt!653463) vacantBefore!10)) (and (bvsge (index!52895 lt!653463) #b00000000000000000000000000000000) (bvslt (index!52895 lt!653463) (size!48958 a!2850)))) (or ((_ is Undefined!12625) lt!653463) (ite ((_ is Found!12625) lt!653463) (= (select (arr!48406 a!2850) (index!52893 lt!653463)) (select (arr!48406 a!2850) j!87)) (and ((_ is MissingVacant!12625) lt!653463) (= (index!52895 lt!653463) vacantBefore!10) (= (select (arr!48406 a!2850) (index!52895 lt!653463)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157641 (= lt!653463 e!840806)))

(declare-fun c!139101 () Bool)

(assert (=> d!157641 (= c!139101 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!157641 (= lt!653464 (select (arr!48406 a!2850) lt!653446))))

(assert (=> d!157641 (validMask!0 mask!2661)))

(assert (=> d!157641 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653446 vacantBefore!10 (select (arr!48406 a!2850) j!87) a!2850 mask!2661) lt!653463)))

(declare-fun b!1504268 () Bool)

(assert (=> b!1504268 (= e!840807 (Found!12625 lt!653446))))

(declare-fun b!1504269 () Bool)

(assert (=> b!1504269 (= e!840805 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653446 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantBefore!10 (select (arr!48406 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504270 () Bool)

(assert (=> b!1504270 (= e!840806 Undefined!12625)))

(assert (= (and d!157641 c!139101) b!1504270))

(assert (= (and d!157641 (not c!139101)) b!1504267))

(assert (= (and b!1504267 c!139102) b!1504268))

(assert (= (and b!1504267 (not c!139102)) b!1504266))

(assert (= (and b!1504266 c!139100) b!1504265))

(assert (= (and b!1504266 (not c!139100)) b!1504269))

(declare-fun m!1386871 () Bool)

(assert (=> d!157641 m!1386871))

(declare-fun m!1386873 () Bool)

(assert (=> d!157641 m!1386873))

(declare-fun m!1386875 () Bool)

(assert (=> d!157641 m!1386875))

(assert (=> d!157641 m!1386783))

(declare-fun m!1386877 () Bool)

(assert (=> b!1504269 m!1386877))

(assert (=> b!1504269 m!1386877))

(assert (=> b!1504269 m!1386787))

(declare-fun m!1386879 () Bool)

(assert (=> b!1504269 m!1386879))

(assert (=> b!1504188 d!157641))

(declare-fun d!157643 () Bool)

(declare-fun lt!653467 () (_ BitVec 32))

(assert (=> d!157643 (and (bvsge lt!653467 #b00000000000000000000000000000000) (bvslt lt!653467 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157643 (= lt!653467 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157643 (validMask!0 mask!2661)))

(assert (=> d!157643 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653467)))

(declare-fun bs!43156 () Bool)

(assert (= bs!43156 d!157643))

(declare-fun m!1386881 () Bool)

(assert (=> bs!43156 m!1386881))

(assert (=> bs!43156 m!1386783))

(assert (=> b!1504192 d!157643))

(declare-fun bm!68105 () Bool)

(declare-fun call!68108 () Bool)

(declare-fun c!139105 () Bool)

(assert (=> bm!68105 (= call!68108 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139105 (Cons!34972 (select (arr!48406 a!2850) #b00000000000000000000000000000000) Nil!34973) Nil!34973)))))

(declare-fun d!157645 () Bool)

(declare-fun res!1025147 () Bool)

(declare-fun e!840819 () Bool)

(assert (=> d!157645 (=> res!1025147 e!840819)))

(assert (=> d!157645 (= res!1025147 (bvsge #b00000000000000000000000000000000 (size!48958 a!2850)))))

(assert (=> d!157645 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34973) e!840819)))

(declare-fun b!1504281 () Bool)

(declare-fun e!840818 () Bool)

(assert (=> b!1504281 (= e!840819 e!840818)))

(declare-fun res!1025145 () Bool)

(assert (=> b!1504281 (=> (not res!1025145) (not e!840818))))

(declare-fun e!840817 () Bool)

(assert (=> b!1504281 (= res!1025145 (not e!840817))))

(declare-fun res!1025146 () Bool)

(assert (=> b!1504281 (=> (not res!1025146) (not e!840817))))

(assert (=> b!1504281 (= res!1025146 (validKeyInArray!0 (select (arr!48406 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504282 () Bool)

(declare-fun e!840816 () Bool)

(assert (=> b!1504282 (= e!840818 e!840816)))

(assert (=> b!1504282 (= c!139105 (validKeyInArray!0 (select (arr!48406 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504283 () Bool)

(declare-fun contains!9917 (List!34976 (_ BitVec 64)) Bool)

(assert (=> b!1504283 (= e!840817 (contains!9917 Nil!34973 (select (arr!48406 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504284 () Bool)

(assert (=> b!1504284 (= e!840816 call!68108)))

(declare-fun b!1504285 () Bool)

(assert (=> b!1504285 (= e!840816 call!68108)))

(assert (= (and d!157645 (not res!1025147)) b!1504281))

(assert (= (and b!1504281 res!1025146) b!1504283))

(assert (= (and b!1504281 res!1025145) b!1504282))

(assert (= (and b!1504282 c!139105) b!1504285))

(assert (= (and b!1504282 (not c!139105)) b!1504284))

(assert (= (or b!1504285 b!1504284) bm!68105))

(declare-fun m!1386883 () Bool)

(assert (=> bm!68105 m!1386883))

(declare-fun m!1386885 () Bool)

(assert (=> bm!68105 m!1386885))

(assert (=> b!1504281 m!1386883))

(assert (=> b!1504281 m!1386883))

(declare-fun m!1386887 () Bool)

(assert (=> b!1504281 m!1386887))

(assert (=> b!1504282 m!1386883))

(assert (=> b!1504282 m!1386883))

(assert (=> b!1504282 m!1386887))

(assert (=> b!1504283 m!1386883))

(assert (=> b!1504283 m!1386883))

(declare-fun m!1386889 () Bool)

(assert (=> b!1504283 m!1386889))

(assert (=> b!1504186 d!157645))

(declare-fun d!157647 () Bool)

(declare-fun res!1025153 () Bool)

(declare-fun e!840826 () Bool)

(assert (=> d!157647 (=> res!1025153 e!840826)))

(assert (=> d!157647 (= res!1025153 (bvsge #b00000000000000000000000000000000 (size!48958 a!2850)))))

(assert (=> d!157647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840826)))

(declare-fun b!1504294 () Bool)

(declare-fun e!840828 () Bool)

(declare-fun call!68111 () Bool)

(assert (=> b!1504294 (= e!840828 call!68111)))

(declare-fun b!1504295 () Bool)

(declare-fun e!840827 () Bool)

(assert (=> b!1504295 (= e!840827 e!840828)))

(declare-fun lt!653476 () (_ BitVec 64))

(assert (=> b!1504295 (= lt!653476 (select (arr!48406 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50105 0))(
  ( (Unit!50106) )
))
(declare-fun lt!653475 () Unit!50105)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100303 (_ BitVec 64) (_ BitVec 32)) Unit!50105)

(assert (=> b!1504295 (= lt!653475 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653476 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504295 (arrayContainsKey!0 a!2850 lt!653476 #b00000000000000000000000000000000)))

(declare-fun lt!653474 () Unit!50105)

(assert (=> b!1504295 (= lt!653474 lt!653475)))

(declare-fun res!1025152 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100303 (_ BitVec 32)) SeekEntryResult!12625)

(assert (=> b!1504295 (= res!1025152 (= (seekEntryOrOpen!0 (select (arr!48406 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12625 #b00000000000000000000000000000000)))))

(assert (=> b!1504295 (=> (not res!1025152) (not e!840828))))

(declare-fun b!1504296 () Bool)

(assert (=> b!1504296 (= e!840827 call!68111)))

(declare-fun bm!68108 () Bool)

(assert (=> bm!68108 (= call!68111 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1504297 () Bool)

(assert (=> b!1504297 (= e!840826 e!840827)))

(declare-fun c!139108 () Bool)

(assert (=> b!1504297 (= c!139108 (validKeyInArray!0 (select (arr!48406 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157647 (not res!1025153)) b!1504297))

(assert (= (and b!1504297 c!139108) b!1504295))

(assert (= (and b!1504297 (not c!139108)) b!1504296))

(assert (= (and b!1504295 res!1025152) b!1504294))

(assert (= (or b!1504294 b!1504296) bm!68108))

(assert (=> b!1504295 m!1386883))

(declare-fun m!1386891 () Bool)

(assert (=> b!1504295 m!1386891))

(declare-fun m!1386893 () Bool)

(assert (=> b!1504295 m!1386893))

(assert (=> b!1504295 m!1386883))

(declare-fun m!1386895 () Bool)

(assert (=> b!1504295 m!1386895))

(declare-fun m!1386897 () Bool)

(assert (=> bm!68108 m!1386897))

(assert (=> b!1504297 m!1386883))

(assert (=> b!1504297 m!1386883))

(assert (=> b!1504297 m!1386887))

(assert (=> b!1504191 d!157647))

(declare-fun d!157649 () Bool)

(assert (=> d!157649 (= (validKeyInArray!0 (select (arr!48406 a!2850) j!87)) (and (not (= (select (arr!48406 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48406 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504185 d!157649))

(declare-fun b!1504298 () Bool)

(declare-fun e!840829 () SeekEntryResult!12625)

(assert (=> b!1504298 (= e!840829 (MissingVacant!12625 vacantBefore!10))))

(declare-fun b!1504299 () Bool)

(declare-fun c!139109 () Bool)

(declare-fun lt!653478 () (_ BitVec 64))

(assert (=> b!1504299 (= c!139109 (= lt!653478 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840831 () SeekEntryResult!12625)

(assert (=> b!1504299 (= e!840831 e!840829)))

(declare-fun b!1504300 () Bool)

(declare-fun e!840830 () SeekEntryResult!12625)

(assert (=> b!1504300 (= e!840830 e!840831)))

(declare-fun c!139111 () Bool)

(assert (=> b!1504300 (= c!139111 (= lt!653478 (select (arr!48406 a!2850) j!87)))))

(declare-fun lt!653477 () SeekEntryResult!12625)

(declare-fun d!157651 () Bool)

(assert (=> d!157651 (and (or ((_ is Undefined!12625) lt!653477) (not ((_ is Found!12625) lt!653477)) (and (bvsge (index!52893 lt!653477) #b00000000000000000000000000000000) (bvslt (index!52893 lt!653477) (size!48958 a!2850)))) (or ((_ is Undefined!12625) lt!653477) ((_ is Found!12625) lt!653477) (not ((_ is MissingVacant!12625) lt!653477)) (not (= (index!52895 lt!653477) vacantBefore!10)) (and (bvsge (index!52895 lt!653477) #b00000000000000000000000000000000) (bvslt (index!52895 lt!653477) (size!48958 a!2850)))) (or ((_ is Undefined!12625) lt!653477) (ite ((_ is Found!12625) lt!653477) (= (select (arr!48406 a!2850) (index!52893 lt!653477)) (select (arr!48406 a!2850) j!87)) (and ((_ is MissingVacant!12625) lt!653477) (= (index!52895 lt!653477) vacantBefore!10) (= (select (arr!48406 a!2850) (index!52895 lt!653477)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157651 (= lt!653477 e!840830)))

(declare-fun c!139110 () Bool)

(assert (=> d!157651 (= c!139110 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157651 (= lt!653478 (select (arr!48406 a!2850) index!625))))

(assert (=> d!157651 (validMask!0 mask!2661)))

(assert (=> d!157651 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48406 a!2850) j!87) a!2850 mask!2661) lt!653477)))

(declare-fun b!1504301 () Bool)

(assert (=> b!1504301 (= e!840831 (Found!12625 index!625))))

(declare-fun b!1504302 () Bool)

(assert (=> b!1504302 (= e!840829 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48406 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504303 () Bool)

(assert (=> b!1504303 (= e!840830 Undefined!12625)))

(assert (= (and d!157651 c!139110) b!1504303))

(assert (= (and d!157651 (not c!139110)) b!1504300))

(assert (= (and b!1504300 c!139111) b!1504301))

(assert (= (and b!1504300 (not c!139111)) b!1504299))

(assert (= (and b!1504299 c!139109) b!1504298))

(assert (= (and b!1504299 (not c!139109)) b!1504302))

(declare-fun m!1386899 () Bool)

(assert (=> d!157651 m!1386899))

(declare-fun m!1386901 () Bool)

(assert (=> d!157651 m!1386901))

(assert (=> d!157651 m!1386795))

(assert (=> d!157651 m!1386783))

(assert (=> b!1504302 m!1386797))

(assert (=> b!1504302 m!1386797))

(assert (=> b!1504302 m!1386787))

(declare-fun m!1386903 () Bool)

(assert (=> b!1504302 m!1386903))

(assert (=> b!1504184 d!157651))

(declare-fun d!157653 () Bool)

(assert (=> d!157653 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128072 d!157653))

(declare-fun d!157657 () Bool)

(assert (=> d!157657 (= (array_inv!37639 a!2850) (bvsge (size!48958 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128072 d!157657))

(declare-fun d!157659 () Bool)

(assert (=> d!157659 (= (validKeyInArray!0 (select (arr!48406 a!2850) i!996)) (and (not (= (select (arr!48406 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48406 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504189 d!157659))

(check-sat (not b!1504297) (not b!1504283) (not bm!68105) (not bm!68108) (not d!157643) (not b!1504281) (not b!1504282) (not b!1504302) (not b!1504269) (not d!157641) (not b!1504295) (not d!157651))
(check-sat)
