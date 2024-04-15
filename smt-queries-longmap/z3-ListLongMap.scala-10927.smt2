; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127778 () Bool)

(assert start!127778)

(declare-fun b!1501821 () Bool)

(declare-fun res!1023085 () Bool)

(declare-fun e!839975 () Bool)

(assert (=> b!1501821 (=> (not res!1023085) (not e!839975))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100153 0))(
  ( (array!100154 (arr!48337 (Array (_ BitVec 32) (_ BitVec 64))) (size!48889 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100153)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501821 (= res!1023085 (and (= (size!48889 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48889 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48889 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501822 () Bool)

(declare-fun res!1023086 () Bool)

(assert (=> b!1501822 (=> (not res!1023086) (not e!839975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501822 (= res!1023086 (validKeyInArray!0 (select (arr!48337 a!2850) i!996)))))

(declare-fun b!1501823 () Bool)

(declare-fun res!1023092 () Bool)

(assert (=> b!1501823 (=> (not res!1023092) (not e!839975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100153 (_ BitVec 32)) Bool)

(assert (=> b!1501823 (= res!1023092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501824 () Bool)

(declare-fun res!1023090 () Bool)

(assert (=> b!1501824 (=> (not res!1023090) (not e!839975))))

(assert (=> b!1501824 (= res!1023090 (validKeyInArray!0 (select (arr!48337 a!2850) j!87)))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun b!1501825 () Bool)

(assert (=> b!1501825 (= e!839975 (and (= (select (arr!48337 a!2850) index!625) (select (arr!48337 a!2850) j!87)) (not (= j!87 index!625))))))

(declare-fun b!1501826 () Bool)

(declare-fun res!1023091 () Bool)

(assert (=> b!1501826 (=> (not res!1023091) (not e!839975))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12556 0))(
  ( (MissingZero!12556 (index!52616 (_ BitVec 32))) (Found!12556 (index!52617 (_ BitVec 32))) (Intermediate!12556 (undefined!13368 Bool) (index!52618 (_ BitVec 32)) (x!134313 (_ BitVec 32))) (Undefined!12556) (MissingVacant!12556 (index!52619 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100153 (_ BitVec 32)) SeekEntryResult!12556)

(assert (=> b!1501826 (= res!1023091 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48337 a!2850) j!87) a!2850 mask!2661) (Found!12556 j!87)))))

(declare-fun b!1501827 () Bool)

(declare-fun res!1023088 () Bool)

(assert (=> b!1501827 (=> (not res!1023088) (not e!839975))))

(declare-datatypes ((List!34907 0))(
  ( (Nil!34904) (Cons!34903 (h!36301 (_ BitVec 64)) (t!49593 List!34907)) )
))
(declare-fun arrayNoDuplicates!0 (array!100153 (_ BitVec 32) List!34907) Bool)

(assert (=> b!1501827 (= res!1023088 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34904))))

(declare-fun b!1501828 () Bool)

(declare-fun res!1023087 () Bool)

(assert (=> b!1501828 (=> (not res!1023087) (not e!839975))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501828 (= res!1023087 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48889 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48889 a!2850)) (= (select (arr!48337 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48337 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48889 a!2850))))))

(declare-fun res!1023089 () Bool)

(assert (=> start!127778 (=> (not res!1023089) (not e!839975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127778 (= res!1023089 (validMask!0 mask!2661))))

(assert (=> start!127778 e!839975))

(assert (=> start!127778 true))

(declare-fun array_inv!37570 (array!100153) Bool)

(assert (=> start!127778 (array_inv!37570 a!2850)))

(assert (= (and start!127778 res!1023089) b!1501821))

(assert (= (and b!1501821 res!1023085) b!1501822))

(assert (= (and b!1501822 res!1023086) b!1501824))

(assert (= (and b!1501824 res!1023090) b!1501823))

(assert (= (and b!1501823 res!1023092) b!1501827))

(assert (= (and b!1501827 res!1023088) b!1501828))

(assert (= (and b!1501828 res!1023087) b!1501826))

(assert (= (and b!1501826 res!1023091) b!1501825))

(declare-fun m!1384573 () Bool)

(assert (=> b!1501822 m!1384573))

(assert (=> b!1501822 m!1384573))

(declare-fun m!1384575 () Bool)

(assert (=> b!1501822 m!1384575))

(declare-fun m!1384577 () Bool)

(assert (=> start!127778 m!1384577))

(declare-fun m!1384579 () Bool)

(assert (=> start!127778 m!1384579))

(declare-fun m!1384581 () Bool)

(assert (=> b!1501826 m!1384581))

(assert (=> b!1501826 m!1384581))

(declare-fun m!1384583 () Bool)

(assert (=> b!1501826 m!1384583))

(declare-fun m!1384585 () Bool)

(assert (=> b!1501827 m!1384585))

(declare-fun m!1384587 () Bool)

(assert (=> b!1501823 m!1384587))

(assert (=> b!1501824 m!1384581))

(assert (=> b!1501824 m!1384581))

(declare-fun m!1384589 () Bool)

(assert (=> b!1501824 m!1384589))

(declare-fun m!1384591 () Bool)

(assert (=> b!1501825 m!1384591))

(assert (=> b!1501825 m!1384581))

(declare-fun m!1384593 () Bool)

(assert (=> b!1501828 m!1384593))

(declare-fun m!1384595 () Bool)

(assert (=> b!1501828 m!1384595))

(declare-fun m!1384597 () Bool)

(assert (=> b!1501828 m!1384597))

(check-sat (not start!127778) (not b!1501822) (not b!1501823) (not b!1501827) (not b!1501824) (not b!1501826))
(check-sat)
(get-model)

(declare-fun d!157409 () Bool)

(assert (=> d!157409 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127778 d!157409))

(declare-fun d!157411 () Bool)

(assert (=> d!157411 (= (array_inv!37570 a!2850) (bvsge (size!48889 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127778 d!157411))

(declare-fun d!157413 () Bool)

(assert (=> d!157413 (= (validKeyInArray!0 (select (arr!48337 a!2850) i!996)) (and (not (= (select (arr!48337 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48337 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1501822 d!157413))

(declare-fun b!1501887 () Bool)

(declare-fun e!839998 () Bool)

(declare-fun contains!9909 (List!34907 (_ BitVec 64)) Bool)

(assert (=> b!1501887 (= e!839998 (contains!9909 Nil!34904 (select (arr!48337 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68033 () Bool)

(declare-fun call!68036 () Bool)

(declare-fun c!138907 () Bool)

(assert (=> bm!68033 (= call!68036 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138907 (Cons!34903 (select (arr!48337 a!2850) #b00000000000000000000000000000000) Nil!34904) Nil!34904)))))

(declare-fun b!1501888 () Bool)

(declare-fun e!839999 () Bool)

(assert (=> b!1501888 (= e!839999 call!68036)))

(declare-fun d!157415 () Bool)

(declare-fun res!1023149 () Bool)

(declare-fun e!839997 () Bool)

(assert (=> d!157415 (=> res!1023149 e!839997)))

(assert (=> d!157415 (= res!1023149 (bvsge #b00000000000000000000000000000000 (size!48889 a!2850)))))

(assert (=> d!157415 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34904) e!839997)))

(declare-fun b!1501889 () Bool)

(assert (=> b!1501889 (= e!839999 call!68036)))

(declare-fun b!1501890 () Bool)

(declare-fun e!840000 () Bool)

(assert (=> b!1501890 (= e!839997 e!840000)))

(declare-fun res!1023148 () Bool)

(assert (=> b!1501890 (=> (not res!1023148) (not e!840000))))

(assert (=> b!1501890 (= res!1023148 (not e!839998))))

(declare-fun res!1023147 () Bool)

(assert (=> b!1501890 (=> (not res!1023147) (not e!839998))))

(assert (=> b!1501890 (= res!1023147 (validKeyInArray!0 (select (arr!48337 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1501891 () Bool)

(assert (=> b!1501891 (= e!840000 e!839999)))

(assert (=> b!1501891 (= c!138907 (validKeyInArray!0 (select (arr!48337 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157415 (not res!1023149)) b!1501890))

(assert (= (and b!1501890 res!1023147) b!1501887))

(assert (= (and b!1501890 res!1023148) b!1501891))

(assert (= (and b!1501891 c!138907) b!1501888))

(assert (= (and b!1501891 (not c!138907)) b!1501889))

(assert (= (or b!1501888 b!1501889) bm!68033))

(declare-fun m!1384651 () Bool)

(assert (=> b!1501887 m!1384651))

(assert (=> b!1501887 m!1384651))

(declare-fun m!1384653 () Bool)

(assert (=> b!1501887 m!1384653))

(assert (=> bm!68033 m!1384651))

(declare-fun m!1384655 () Bool)

(assert (=> bm!68033 m!1384655))

(assert (=> b!1501890 m!1384651))

(assert (=> b!1501890 m!1384651))

(declare-fun m!1384657 () Bool)

(assert (=> b!1501890 m!1384657))

(assert (=> b!1501891 m!1384651))

(assert (=> b!1501891 m!1384651))

(assert (=> b!1501891 m!1384657))

(assert (=> b!1501827 d!157415))

(declare-fun b!1501912 () Bool)

(declare-fun e!840018 () Bool)

(declare-fun call!68042 () Bool)

(assert (=> b!1501912 (= e!840018 call!68042)))

(declare-fun b!1501913 () Bool)

(declare-fun e!840017 () Bool)

(declare-fun e!840016 () Bool)

(assert (=> b!1501913 (= e!840017 e!840016)))

(declare-fun c!138913 () Bool)

(assert (=> b!1501913 (= c!138913 (validKeyInArray!0 (select (arr!48337 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1501914 () Bool)

(assert (=> b!1501914 (= e!840016 e!840018)))

(declare-fun lt!653054 () (_ BitVec 64))

(assert (=> b!1501914 (= lt!653054 (select (arr!48337 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50089 0))(
  ( (Unit!50090) )
))
(declare-fun lt!653056 () Unit!50089)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100153 (_ BitVec 64) (_ BitVec 32)) Unit!50089)

(assert (=> b!1501914 (= lt!653056 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653054 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1501914 (arrayContainsKey!0 a!2850 lt!653054 #b00000000000000000000000000000000)))

(declare-fun lt!653055 () Unit!50089)

(assert (=> b!1501914 (= lt!653055 lt!653056)))

(declare-fun res!1023161 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100153 (_ BitVec 32)) SeekEntryResult!12556)

(assert (=> b!1501914 (= res!1023161 (= (seekEntryOrOpen!0 (select (arr!48337 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12556 #b00000000000000000000000000000000)))))

(assert (=> b!1501914 (=> (not res!1023161) (not e!840018))))

(declare-fun d!157423 () Bool)

(declare-fun res!1023160 () Bool)

(assert (=> d!157423 (=> res!1023160 e!840017)))

(assert (=> d!157423 (= res!1023160 (bvsge #b00000000000000000000000000000000 (size!48889 a!2850)))))

(assert (=> d!157423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840017)))

(declare-fun b!1501915 () Bool)

(assert (=> b!1501915 (= e!840016 call!68042)))

(declare-fun bm!68039 () Bool)

(assert (=> bm!68039 (= call!68042 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(assert (= (and d!157423 (not res!1023160)) b!1501913))

(assert (= (and b!1501913 c!138913) b!1501914))

(assert (= (and b!1501913 (not c!138913)) b!1501915))

(assert (= (and b!1501914 res!1023161) b!1501912))

(assert (= (or b!1501912 b!1501915) bm!68039))

(assert (=> b!1501913 m!1384651))

(assert (=> b!1501913 m!1384651))

(assert (=> b!1501913 m!1384657))

(assert (=> b!1501914 m!1384651))

(declare-fun m!1384669 () Bool)

(assert (=> b!1501914 m!1384669))

(declare-fun m!1384671 () Bool)

(assert (=> b!1501914 m!1384671))

(assert (=> b!1501914 m!1384651))

(declare-fun m!1384675 () Bool)

(assert (=> b!1501914 m!1384675))

(declare-fun m!1384677 () Bool)

(assert (=> bm!68039 m!1384677))

(assert (=> b!1501823 d!157423))

(declare-fun d!157435 () Bool)

(assert (=> d!157435 (= (validKeyInArray!0 (select (arr!48337 a!2850) j!87)) (and (not (= (select (arr!48337 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48337 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1501824 d!157435))

(declare-fun b!1501955 () Bool)

(declare-fun e!840046 () SeekEntryResult!12556)

(assert (=> b!1501955 (= e!840046 Undefined!12556)))

(declare-fun b!1501956 () Bool)

(declare-fun e!840048 () SeekEntryResult!12556)

(assert (=> b!1501956 (= e!840046 e!840048)))

(declare-fun c!138926 () Bool)

(declare-fun lt!653070 () (_ BitVec 64))

(assert (=> b!1501956 (= c!138926 (= lt!653070 (select (arr!48337 a!2850) j!87)))))

(declare-fun b!1501957 () Bool)

(declare-fun c!138927 () Bool)

(assert (=> b!1501957 (= c!138927 (= lt!653070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840047 () SeekEntryResult!12556)

(assert (=> b!1501957 (= e!840048 e!840047)))

(declare-fun b!1501958 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501958 (= e!840047 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48337 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501959 () Bool)

(assert (=> b!1501959 (= e!840048 (Found!12556 index!625))))

(declare-fun b!1501960 () Bool)

(assert (=> b!1501960 (= e!840047 (MissingVacant!12556 vacantBefore!10))))

(declare-fun lt!653071 () SeekEntryResult!12556)

(declare-fun d!157437 () Bool)

(get-info :version)

(assert (=> d!157437 (and (or ((_ is Undefined!12556) lt!653071) (not ((_ is Found!12556) lt!653071)) (and (bvsge (index!52617 lt!653071) #b00000000000000000000000000000000) (bvslt (index!52617 lt!653071) (size!48889 a!2850)))) (or ((_ is Undefined!12556) lt!653071) ((_ is Found!12556) lt!653071) (not ((_ is MissingVacant!12556) lt!653071)) (not (= (index!52619 lt!653071) vacantBefore!10)) (and (bvsge (index!52619 lt!653071) #b00000000000000000000000000000000) (bvslt (index!52619 lt!653071) (size!48889 a!2850)))) (or ((_ is Undefined!12556) lt!653071) (ite ((_ is Found!12556) lt!653071) (= (select (arr!48337 a!2850) (index!52617 lt!653071)) (select (arr!48337 a!2850) j!87)) (and ((_ is MissingVacant!12556) lt!653071) (= (index!52619 lt!653071) vacantBefore!10) (= (select (arr!48337 a!2850) (index!52619 lt!653071)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157437 (= lt!653071 e!840046)))

(declare-fun c!138928 () Bool)

(assert (=> d!157437 (= c!138928 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157437 (= lt!653070 (select (arr!48337 a!2850) index!625))))

(assert (=> d!157437 (validMask!0 mask!2661)))

(assert (=> d!157437 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48337 a!2850) j!87) a!2850 mask!2661) lt!653071)))

(assert (= (and d!157437 c!138928) b!1501955))

(assert (= (and d!157437 (not c!138928)) b!1501956))

(assert (= (and b!1501956 c!138926) b!1501959))

(assert (= (and b!1501956 (not c!138926)) b!1501957))

(assert (= (and b!1501957 c!138927) b!1501960))

(assert (= (and b!1501957 (not c!138927)) b!1501958))

(declare-fun m!1384695 () Bool)

(assert (=> b!1501958 m!1384695))

(assert (=> b!1501958 m!1384695))

(assert (=> b!1501958 m!1384581))

(declare-fun m!1384697 () Bool)

(assert (=> b!1501958 m!1384697))

(declare-fun m!1384699 () Bool)

(assert (=> d!157437 m!1384699))

(declare-fun m!1384701 () Bool)

(assert (=> d!157437 m!1384701))

(assert (=> d!157437 m!1384591))

(assert (=> d!157437 m!1384577))

(assert (=> b!1501826 d!157437))

(check-sat (not bm!68039) (not d!157437) (not b!1501958) (not b!1501890) (not b!1501891) (not bm!68033) (not b!1501887) (not b!1501914) (not b!1501913))
(check-sat)
