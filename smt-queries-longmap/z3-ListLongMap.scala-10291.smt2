; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120956 () Bool)

(assert start!120956)

(declare-fun b!1407001 () Bool)

(declare-fun e!796351 () Bool)

(declare-fun e!796349 () Bool)

(assert (=> b!1407001 (= e!796351 (not e!796349))))

(declare-fun res!945104 () Bool)

(assert (=> b!1407001 (=> res!945104 e!796349)))

(declare-datatypes ((SeekEntryResult!10766 0))(
  ( (MissingZero!10766 (index!45441 (_ BitVec 32))) (Found!10766 (index!45442 (_ BitVec 32))) (Intermediate!10766 (undefined!11578 Bool) (index!45443 (_ BitVec 32)) (x!127040 (_ BitVec 32))) (Undefined!10766) (MissingVacant!10766 (index!45444 (_ BitVec 32))) )
))
(declare-fun lt!619447 () SeekEntryResult!10766)

(get-info :version)

(assert (=> b!1407001 (= res!945104 (or (not ((_ is Intermediate!10766) lt!619447)) (undefined!11578 lt!619447)))))

(declare-fun e!796350 () Bool)

(assert (=> b!1407001 e!796350))

(declare-fun res!945106 () Bool)

(assert (=> b!1407001 (=> (not res!945106) (not e!796350))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96165 0))(
  ( (array!96166 (arr!46429 (Array (_ BitVec 32) (_ BitVec 64))) (size!46981 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96165)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96165 (_ BitVec 32)) Bool)

(assert (=> b!1407001 (= res!945106 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47349 0))(
  ( (Unit!47350) )
))
(declare-fun lt!619446 () Unit!47349)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47349)

(assert (=> b!1407001 (= lt!619446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619448 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96165 (_ BitVec 32)) SeekEntryResult!10766)

(assert (=> b!1407001 (= lt!619447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619448 (select (arr!46429 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407001 (= lt!619448 (toIndex!0 (select (arr!46429 a!2901) j!112) mask!2840))))

(declare-fun res!945112 () Bool)

(assert (=> start!120956 (=> (not res!945112) (not e!796351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120956 (= res!945112 (validMask!0 mask!2840))))

(assert (=> start!120956 e!796351))

(assert (=> start!120956 true))

(declare-fun array_inv!35662 (array!96165) Bool)

(assert (=> start!120956 (array_inv!35662 a!2901)))

(declare-fun b!1407002 () Bool)

(declare-fun res!945110 () Bool)

(assert (=> b!1407002 (=> (not res!945110) (not e!796351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407002 (= res!945110 (validKeyInArray!0 (select (arr!46429 a!2901) j!112)))))

(declare-fun b!1407003 () Bool)

(declare-fun res!945109 () Bool)

(assert (=> b!1407003 (=> (not res!945109) (not e!796351))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407003 (= res!945109 (validKeyInArray!0 (select (arr!46429 a!2901) i!1037)))))

(declare-fun b!1407004 () Bool)

(declare-fun res!945105 () Bool)

(assert (=> b!1407004 (=> (not res!945105) (not e!796351))))

(assert (=> b!1407004 (= res!945105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407005 () Bool)

(declare-fun res!945111 () Bool)

(assert (=> b!1407005 (=> (not res!945111) (not e!796351))))

(assert (=> b!1407005 (= res!945111 (and (= (size!46981 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46981 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46981 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407006 () Bool)

(declare-fun res!945107 () Bool)

(assert (=> b!1407006 (=> res!945107 e!796349)))

(assert (=> b!1407006 (= res!945107 (not (= lt!619447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901)) mask!2840))))))

(declare-fun b!1407007 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96165 (_ BitVec 32)) SeekEntryResult!10766)

(assert (=> b!1407007 (= e!796350 (= (seekEntryOrOpen!0 (select (arr!46429 a!2901) j!112) a!2901 mask!2840) (Found!10766 j!112)))))

(declare-fun b!1407008 () Bool)

(assert (=> b!1407008 (= e!796349 (or (bvslt (x!127040 lt!619447) #b00000000000000000000000000000000) (bvsgt (x!127040 lt!619447) #b01111111111111111111111111111110) (and (bvsge lt!619448 #b00000000000000000000000000000000) (bvslt lt!619448 (size!46981 a!2901)))))))

(declare-fun b!1407009 () Bool)

(declare-fun res!945108 () Bool)

(assert (=> b!1407009 (=> (not res!945108) (not e!796351))))

(declare-datatypes ((List!33026 0))(
  ( (Nil!33023) (Cons!33022 (h!34279 (_ BitVec 64)) (t!47712 List!33026)) )
))
(declare-fun arrayNoDuplicates!0 (array!96165 (_ BitVec 32) List!33026) Bool)

(assert (=> b!1407009 (= res!945108 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33023))))

(assert (= (and start!120956 res!945112) b!1407005))

(assert (= (and b!1407005 res!945111) b!1407003))

(assert (= (and b!1407003 res!945109) b!1407002))

(assert (= (and b!1407002 res!945110) b!1407004))

(assert (= (and b!1407004 res!945105) b!1407009))

(assert (= (and b!1407009 res!945108) b!1407001))

(assert (= (and b!1407001 res!945106) b!1407007))

(assert (= (and b!1407001 (not res!945104)) b!1407006))

(assert (= (and b!1407006 (not res!945107)) b!1407008))

(declare-fun m!1295731 () Bool)

(assert (=> b!1407002 m!1295731))

(assert (=> b!1407002 m!1295731))

(declare-fun m!1295733 () Bool)

(assert (=> b!1407002 m!1295733))

(declare-fun m!1295735 () Bool)

(assert (=> b!1407006 m!1295735))

(declare-fun m!1295737 () Bool)

(assert (=> b!1407006 m!1295737))

(assert (=> b!1407006 m!1295737))

(declare-fun m!1295739 () Bool)

(assert (=> b!1407006 m!1295739))

(assert (=> b!1407006 m!1295739))

(assert (=> b!1407006 m!1295737))

(declare-fun m!1295741 () Bool)

(assert (=> b!1407006 m!1295741))

(declare-fun m!1295743 () Bool)

(assert (=> b!1407004 m!1295743))

(declare-fun m!1295745 () Bool)

(assert (=> b!1407003 m!1295745))

(assert (=> b!1407003 m!1295745))

(declare-fun m!1295747 () Bool)

(assert (=> b!1407003 m!1295747))

(declare-fun m!1295749 () Bool)

(assert (=> start!120956 m!1295749))

(declare-fun m!1295751 () Bool)

(assert (=> start!120956 m!1295751))

(assert (=> b!1407007 m!1295731))

(assert (=> b!1407007 m!1295731))

(declare-fun m!1295753 () Bool)

(assert (=> b!1407007 m!1295753))

(assert (=> b!1407001 m!1295731))

(declare-fun m!1295755 () Bool)

(assert (=> b!1407001 m!1295755))

(assert (=> b!1407001 m!1295731))

(declare-fun m!1295757 () Bool)

(assert (=> b!1407001 m!1295757))

(assert (=> b!1407001 m!1295731))

(declare-fun m!1295759 () Bool)

(assert (=> b!1407001 m!1295759))

(declare-fun m!1295761 () Bool)

(assert (=> b!1407001 m!1295761))

(declare-fun m!1295763 () Bool)

(assert (=> b!1407009 m!1295763))

(check-sat (not b!1407002) (not b!1407004) (not b!1407009) (not b!1407007) (not b!1407006) (not b!1407003) (not start!120956) (not b!1407001))
(check-sat)
(get-model)

(declare-fun b!1407076 () Bool)

(declare-fun e!796383 () SeekEntryResult!10766)

(declare-fun lt!619474 () SeekEntryResult!10766)

(assert (=> b!1407076 (= e!796383 (Found!10766 (index!45443 lt!619474)))))

(declare-fun b!1407077 () Bool)

(declare-fun c!130422 () Bool)

(declare-fun lt!619475 () (_ BitVec 64))

(assert (=> b!1407077 (= c!130422 (= lt!619475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796384 () SeekEntryResult!10766)

(assert (=> b!1407077 (= e!796383 e!796384)))

(declare-fun d!151389 () Bool)

(declare-fun lt!619473 () SeekEntryResult!10766)

(assert (=> d!151389 (and (or ((_ is Undefined!10766) lt!619473) (not ((_ is Found!10766) lt!619473)) (and (bvsge (index!45442 lt!619473) #b00000000000000000000000000000000) (bvslt (index!45442 lt!619473) (size!46981 a!2901)))) (or ((_ is Undefined!10766) lt!619473) ((_ is Found!10766) lt!619473) (not ((_ is MissingZero!10766) lt!619473)) (and (bvsge (index!45441 lt!619473) #b00000000000000000000000000000000) (bvslt (index!45441 lt!619473) (size!46981 a!2901)))) (or ((_ is Undefined!10766) lt!619473) ((_ is Found!10766) lt!619473) ((_ is MissingZero!10766) lt!619473) (not ((_ is MissingVacant!10766) lt!619473)) (and (bvsge (index!45444 lt!619473) #b00000000000000000000000000000000) (bvslt (index!45444 lt!619473) (size!46981 a!2901)))) (or ((_ is Undefined!10766) lt!619473) (ite ((_ is Found!10766) lt!619473) (= (select (arr!46429 a!2901) (index!45442 lt!619473)) (select (arr!46429 a!2901) j!112)) (ite ((_ is MissingZero!10766) lt!619473) (= (select (arr!46429 a!2901) (index!45441 lt!619473)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10766) lt!619473) (= (select (arr!46429 a!2901) (index!45444 lt!619473)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!796385 () SeekEntryResult!10766)

(assert (=> d!151389 (= lt!619473 e!796385)))

(declare-fun c!130423 () Bool)

(assert (=> d!151389 (= c!130423 (and ((_ is Intermediate!10766) lt!619474) (undefined!11578 lt!619474)))))

(assert (=> d!151389 (= lt!619474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46429 a!2901) j!112) mask!2840) (select (arr!46429 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151389 (validMask!0 mask!2840)))

(assert (=> d!151389 (= (seekEntryOrOpen!0 (select (arr!46429 a!2901) j!112) a!2901 mask!2840) lt!619473)))

(declare-fun b!1407078 () Bool)

(assert (=> b!1407078 (= e!796385 e!796383)))

(assert (=> b!1407078 (= lt!619475 (select (arr!46429 a!2901) (index!45443 lt!619474)))))

(declare-fun c!130421 () Bool)

(assert (=> b!1407078 (= c!130421 (= lt!619475 (select (arr!46429 a!2901) j!112)))))

(declare-fun b!1407079 () Bool)

(assert (=> b!1407079 (= e!796385 Undefined!10766)))

(declare-fun b!1407080 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96165 (_ BitVec 32)) SeekEntryResult!10766)

(assert (=> b!1407080 (= e!796384 (seekKeyOrZeroReturnVacant!0 (x!127040 lt!619474) (index!45443 lt!619474) (index!45443 lt!619474) (select (arr!46429 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407081 () Bool)

(assert (=> b!1407081 (= e!796384 (MissingZero!10766 (index!45443 lt!619474)))))

(assert (= (and d!151389 c!130423) b!1407079))

(assert (= (and d!151389 (not c!130423)) b!1407078))

(assert (= (and b!1407078 c!130421) b!1407076))

(assert (= (and b!1407078 (not c!130421)) b!1407077))

(assert (= (and b!1407077 c!130422) b!1407081))

(assert (= (and b!1407077 (not c!130422)) b!1407080))

(declare-fun m!1295833 () Bool)

(assert (=> d!151389 m!1295833))

(assert (=> d!151389 m!1295755))

(assert (=> d!151389 m!1295731))

(declare-fun m!1295835 () Bool)

(assert (=> d!151389 m!1295835))

(declare-fun m!1295837 () Bool)

(assert (=> d!151389 m!1295837))

(declare-fun m!1295839 () Bool)

(assert (=> d!151389 m!1295839))

(assert (=> d!151389 m!1295731))

(assert (=> d!151389 m!1295755))

(assert (=> d!151389 m!1295749))

(declare-fun m!1295841 () Bool)

(assert (=> b!1407078 m!1295841))

(assert (=> b!1407080 m!1295731))

(declare-fun m!1295843 () Bool)

(assert (=> b!1407080 m!1295843))

(assert (=> b!1407007 d!151389))

(declare-fun d!151399 () Bool)

(assert (=> d!151399 (= (validKeyInArray!0 (select (arr!46429 a!2901) j!112)) (and (not (= (select (arr!46429 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46429 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407002 d!151399))

(declare-fun b!1407143 () Bool)

(declare-fun lt!619505 () SeekEntryResult!10766)

(assert (=> b!1407143 (and (bvsge (index!45443 lt!619505) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619505) (size!46981 (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901)))))))

(declare-fun e!796433 () Bool)

(assert (=> b!1407143 (= e!796433 (= (select (arr!46429 (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901))) (index!45443 lt!619505)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407144 () Bool)

(declare-fun e!796431 () SeekEntryResult!10766)

(assert (=> b!1407144 (= e!796431 (Intermediate!10766 false (toIndex!0 (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407145 () Bool)

(declare-fun e!796432 () Bool)

(assert (=> b!1407145 (= e!796432 (bvsge (x!127040 lt!619505) #b01111111111111111111111111111110))))

(declare-fun b!1407146 () Bool)

(declare-fun e!796430 () SeekEntryResult!10766)

(assert (=> b!1407146 (= e!796430 e!796431)))

(declare-fun lt!619504 () (_ BitVec 64))

(declare-fun c!130440 () Bool)

(assert (=> b!1407146 (= c!130440 (or (= lt!619504 (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619504 lt!619504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407147 () Bool)

(assert (=> b!1407147 (and (bvsge (index!45443 lt!619505) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619505) (size!46981 (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901)))))))

(declare-fun res!945198 () Bool)

(assert (=> b!1407147 (= res!945198 (= (select (arr!46429 (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901))) (index!45443 lt!619505)) (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407147 (=> res!945198 e!796433)))

(declare-fun e!796429 () Bool)

(assert (=> b!1407147 (= e!796429 e!796433)))

(declare-fun b!1407148 () Bool)

(assert (=> b!1407148 (= e!796430 (Intermediate!10766 true (toIndex!0 (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407149 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407149 (= e!796431 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901)) mask!2840))))

(declare-fun b!1407150 () Bool)

(assert (=> b!1407150 (= e!796432 e!796429)))

(declare-fun res!945196 () Bool)

(assert (=> b!1407150 (= res!945196 (and ((_ is Intermediate!10766) lt!619505) (not (undefined!11578 lt!619505)) (bvslt (x!127040 lt!619505) #b01111111111111111111111111111110) (bvsge (x!127040 lt!619505) #b00000000000000000000000000000000) (bvsge (x!127040 lt!619505) #b00000000000000000000000000000000)))))

(assert (=> b!1407150 (=> (not res!945196) (not e!796429))))

(declare-fun d!151401 () Bool)

(assert (=> d!151401 e!796432))

(declare-fun c!130441 () Bool)

(assert (=> d!151401 (= c!130441 (and ((_ is Intermediate!10766) lt!619505) (undefined!11578 lt!619505)))))

(assert (=> d!151401 (= lt!619505 e!796430)))

(declare-fun c!130442 () Bool)

(assert (=> d!151401 (= c!130442 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151401 (= lt!619504 (select (arr!46429 (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901))) (toIndex!0 (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151401 (validMask!0 mask!2840)))

(assert (=> d!151401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901)) mask!2840) lt!619505)))

(declare-fun b!1407151 () Bool)

(assert (=> b!1407151 (and (bvsge (index!45443 lt!619505) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619505) (size!46981 (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901)))))))

(declare-fun res!945197 () Bool)

(assert (=> b!1407151 (= res!945197 (= (select (arr!46429 (array!96166 (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901))) (index!45443 lt!619505)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407151 (=> res!945197 e!796433)))

(assert (= (and d!151401 c!130442) b!1407148))

(assert (= (and d!151401 (not c!130442)) b!1407146))

(assert (= (and b!1407146 c!130440) b!1407144))

(assert (= (and b!1407146 (not c!130440)) b!1407149))

(assert (= (and d!151401 c!130441) b!1407145))

(assert (= (and d!151401 (not c!130441)) b!1407150))

(assert (= (and b!1407150 res!945196) b!1407147))

(assert (= (and b!1407147 (not res!945198)) b!1407151))

(assert (= (and b!1407151 (not res!945197)) b!1407143))

(declare-fun m!1295881 () Bool)

(assert (=> b!1407143 m!1295881))

(assert (=> b!1407147 m!1295881))

(assert (=> b!1407149 m!1295739))

(declare-fun m!1295883 () Bool)

(assert (=> b!1407149 m!1295883))

(assert (=> b!1407149 m!1295883))

(assert (=> b!1407149 m!1295737))

(declare-fun m!1295885 () Bool)

(assert (=> b!1407149 m!1295885))

(assert (=> d!151401 m!1295739))

(declare-fun m!1295887 () Bool)

(assert (=> d!151401 m!1295887))

(assert (=> d!151401 m!1295749))

(assert (=> b!1407151 m!1295881))

(assert (=> b!1407006 d!151401))

(declare-fun d!151415 () Bool)

(declare-fun lt!619515 () (_ BitVec 32))

(declare-fun lt!619514 () (_ BitVec 32))

(assert (=> d!151415 (= lt!619515 (bvmul (bvxor lt!619514 (bvlshr lt!619514 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151415 (= lt!619514 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151415 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945199 (let ((h!34282 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127044 (bvmul (bvxor h!34282 (bvlshr h!34282 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127044 (bvlshr x!127044 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945199 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945199 #b00000000000000000000000000000000))))))

(assert (=> d!151415 (= (toIndex!0 (select (store (arr!46429 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619515 (bvlshr lt!619515 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407006 d!151415))

(declare-fun b!1407214 () Bool)

(declare-fun e!796470 () Bool)

(declare-fun e!796471 () Bool)

(assert (=> b!1407214 (= e!796470 e!796471)))

(declare-fun lt!619530 () (_ BitVec 64))

(assert (=> b!1407214 (= lt!619530 (select (arr!46429 a!2901) j!112))))

(declare-fun lt!619532 () Unit!47349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96165 (_ BitVec 64) (_ BitVec 32)) Unit!47349)

(assert (=> b!1407214 (= lt!619532 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619530 j!112))))

(declare-fun arrayContainsKey!0 (array!96165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1407214 (arrayContainsKey!0 a!2901 lt!619530 #b00000000000000000000000000000000)))

(declare-fun lt!619531 () Unit!47349)

(assert (=> b!1407214 (= lt!619531 lt!619532)))

(declare-fun res!945223 () Bool)

(assert (=> b!1407214 (= res!945223 (= (seekEntryOrOpen!0 (select (arr!46429 a!2901) j!112) a!2901 mask!2840) (Found!10766 j!112)))))

(assert (=> b!1407214 (=> (not res!945223) (not e!796471))))

(declare-fun d!151417 () Bool)

(declare-fun res!945224 () Bool)

(declare-fun e!796472 () Bool)

(assert (=> d!151417 (=> res!945224 e!796472)))

(assert (=> d!151417 (= res!945224 (bvsge j!112 (size!46981 a!2901)))))

(assert (=> d!151417 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796472)))

(declare-fun b!1407215 () Bool)

(assert (=> b!1407215 (= e!796472 e!796470)))

(declare-fun c!130463 () Bool)

(assert (=> b!1407215 (= c!130463 (validKeyInArray!0 (select (arr!46429 a!2901) j!112)))))

(declare-fun b!1407216 () Bool)

(declare-fun call!66963 () Bool)

(assert (=> b!1407216 (= e!796471 call!66963)))

(declare-fun b!1407217 () Bool)

(assert (=> b!1407217 (= e!796470 call!66963)))

(declare-fun bm!66960 () Bool)

(assert (=> bm!66960 (= call!66963 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151417 (not res!945224)) b!1407215))

(assert (= (and b!1407215 c!130463) b!1407214))

(assert (= (and b!1407215 (not c!130463)) b!1407217))

(assert (= (and b!1407214 res!945223) b!1407216))

(assert (= (or b!1407216 b!1407217) bm!66960))

(assert (=> b!1407214 m!1295731))

(declare-fun m!1295899 () Bool)

(assert (=> b!1407214 m!1295899))

(declare-fun m!1295901 () Bool)

(assert (=> b!1407214 m!1295901))

(assert (=> b!1407214 m!1295731))

(assert (=> b!1407214 m!1295753))

(assert (=> b!1407215 m!1295731))

(assert (=> b!1407215 m!1295731))

(assert (=> b!1407215 m!1295733))

(declare-fun m!1295907 () Bool)

(assert (=> bm!66960 m!1295907))

(assert (=> b!1407001 d!151417))

(declare-fun d!151421 () Bool)

(assert (=> d!151421 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619545 () Unit!47349)

(declare-fun choose!38 (array!96165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47349)

(assert (=> d!151421 (= lt!619545 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151421 (validMask!0 mask!2840)))

(assert (=> d!151421 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619545)))

(declare-fun bs!40988 () Bool)

(assert (= bs!40988 d!151421))

(assert (=> bs!40988 m!1295761))

(declare-fun m!1295911 () Bool)

(assert (=> bs!40988 m!1295911))

(assert (=> bs!40988 m!1295749))

(assert (=> b!1407001 d!151421))

(declare-fun b!1407228 () Bool)

(declare-fun lt!619547 () SeekEntryResult!10766)

(assert (=> b!1407228 (and (bvsge (index!45443 lt!619547) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619547) (size!46981 a!2901)))))

(declare-fun e!796485 () Bool)

(assert (=> b!1407228 (= e!796485 (= (select (arr!46429 a!2901) (index!45443 lt!619547)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407229 () Bool)

(declare-fun e!796483 () SeekEntryResult!10766)

(assert (=> b!1407229 (= e!796483 (Intermediate!10766 false lt!619448 #b00000000000000000000000000000000))))

(declare-fun b!1407230 () Bool)

(declare-fun e!796484 () Bool)

(assert (=> b!1407230 (= e!796484 (bvsge (x!127040 lt!619547) #b01111111111111111111111111111110))))

(declare-fun b!1407231 () Bool)

(declare-fun e!796482 () SeekEntryResult!10766)

(assert (=> b!1407231 (= e!796482 e!796483)))

(declare-fun lt!619546 () (_ BitVec 64))

(declare-fun c!130466 () Bool)

(assert (=> b!1407231 (= c!130466 (or (= lt!619546 (select (arr!46429 a!2901) j!112)) (= (bvadd lt!619546 lt!619546) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407232 () Bool)

(assert (=> b!1407232 (and (bvsge (index!45443 lt!619547) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619547) (size!46981 a!2901)))))

(declare-fun res!945234 () Bool)

(assert (=> b!1407232 (= res!945234 (= (select (arr!46429 a!2901) (index!45443 lt!619547)) (select (arr!46429 a!2901) j!112)))))

(assert (=> b!1407232 (=> res!945234 e!796485)))

(declare-fun e!796481 () Bool)

(assert (=> b!1407232 (= e!796481 e!796485)))

(declare-fun b!1407233 () Bool)

(assert (=> b!1407233 (= e!796482 (Intermediate!10766 true lt!619448 #b00000000000000000000000000000000))))

(declare-fun b!1407234 () Bool)

(assert (=> b!1407234 (= e!796483 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!619448 #b00000000000000000000000000000000 mask!2840) (select (arr!46429 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407235 () Bool)

(assert (=> b!1407235 (= e!796484 e!796481)))

(declare-fun res!945232 () Bool)

(assert (=> b!1407235 (= res!945232 (and ((_ is Intermediate!10766) lt!619547) (not (undefined!11578 lt!619547)) (bvslt (x!127040 lt!619547) #b01111111111111111111111111111110) (bvsge (x!127040 lt!619547) #b00000000000000000000000000000000) (bvsge (x!127040 lt!619547) #b00000000000000000000000000000000)))))

(assert (=> b!1407235 (=> (not res!945232) (not e!796481))))

(declare-fun d!151427 () Bool)

(assert (=> d!151427 e!796484))

(declare-fun c!130467 () Bool)

(assert (=> d!151427 (= c!130467 (and ((_ is Intermediate!10766) lt!619547) (undefined!11578 lt!619547)))))

(assert (=> d!151427 (= lt!619547 e!796482)))

(declare-fun c!130468 () Bool)

(assert (=> d!151427 (= c!130468 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151427 (= lt!619546 (select (arr!46429 a!2901) lt!619448))))

(assert (=> d!151427 (validMask!0 mask!2840)))

(assert (=> d!151427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619448 (select (arr!46429 a!2901) j!112) a!2901 mask!2840) lt!619547)))

(declare-fun b!1407236 () Bool)

(assert (=> b!1407236 (and (bvsge (index!45443 lt!619547) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619547) (size!46981 a!2901)))))

(declare-fun res!945233 () Bool)

(assert (=> b!1407236 (= res!945233 (= (select (arr!46429 a!2901) (index!45443 lt!619547)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407236 (=> res!945233 e!796485)))

(assert (= (and d!151427 c!130468) b!1407233))

(assert (= (and d!151427 (not c!130468)) b!1407231))

(assert (= (and b!1407231 c!130466) b!1407229))

(assert (= (and b!1407231 (not c!130466)) b!1407234))

(assert (= (and d!151427 c!130467) b!1407230))

(assert (= (and d!151427 (not c!130467)) b!1407235))

(assert (= (and b!1407235 res!945232) b!1407232))

(assert (= (and b!1407232 (not res!945234)) b!1407236))

(assert (= (and b!1407236 (not res!945233)) b!1407228))

(declare-fun m!1295913 () Bool)

(assert (=> b!1407228 m!1295913))

(assert (=> b!1407232 m!1295913))

(declare-fun m!1295915 () Bool)

(assert (=> b!1407234 m!1295915))

(assert (=> b!1407234 m!1295915))

(assert (=> b!1407234 m!1295731))

(declare-fun m!1295917 () Bool)

(assert (=> b!1407234 m!1295917))

(declare-fun m!1295919 () Bool)

(assert (=> d!151427 m!1295919))

(assert (=> d!151427 m!1295749))

(assert (=> b!1407236 m!1295913))

(assert (=> b!1407001 d!151427))

(declare-fun d!151431 () Bool)

(declare-fun lt!619551 () (_ BitVec 32))

(declare-fun lt!619550 () (_ BitVec 32))

(assert (=> d!151431 (= lt!619551 (bvmul (bvxor lt!619550 (bvlshr lt!619550 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151431 (= lt!619550 ((_ extract 31 0) (bvand (bvxor (select (arr!46429 a!2901) j!112) (bvlshr (select (arr!46429 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151431 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945199 (let ((h!34282 ((_ extract 31 0) (bvand (bvxor (select (arr!46429 a!2901) j!112) (bvlshr (select (arr!46429 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127044 (bvmul (bvxor h!34282 (bvlshr h!34282 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127044 (bvlshr x!127044 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945199 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945199 #b00000000000000000000000000000000))))))

(assert (=> d!151431 (= (toIndex!0 (select (arr!46429 a!2901) j!112) mask!2840) (bvand (bvxor lt!619551 (bvlshr lt!619551 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407001 d!151431))

(declare-fun b!1407237 () Bool)

(declare-fun e!796486 () Bool)

(declare-fun e!796487 () Bool)

(assert (=> b!1407237 (= e!796486 e!796487)))

(declare-fun lt!619552 () (_ BitVec 64))

(assert (=> b!1407237 (= lt!619552 (select (arr!46429 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619554 () Unit!47349)

(assert (=> b!1407237 (= lt!619554 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619552 #b00000000000000000000000000000000))))

(assert (=> b!1407237 (arrayContainsKey!0 a!2901 lt!619552 #b00000000000000000000000000000000)))

(declare-fun lt!619553 () Unit!47349)

(assert (=> b!1407237 (= lt!619553 lt!619554)))

(declare-fun res!945235 () Bool)

(assert (=> b!1407237 (= res!945235 (= (seekEntryOrOpen!0 (select (arr!46429 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10766 #b00000000000000000000000000000000)))))

(assert (=> b!1407237 (=> (not res!945235) (not e!796487))))

(declare-fun d!151433 () Bool)

(declare-fun res!945236 () Bool)

(declare-fun e!796488 () Bool)

(assert (=> d!151433 (=> res!945236 e!796488)))

(assert (=> d!151433 (= res!945236 (bvsge #b00000000000000000000000000000000 (size!46981 a!2901)))))

(assert (=> d!151433 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796488)))

(declare-fun b!1407238 () Bool)

(assert (=> b!1407238 (= e!796488 e!796486)))

(declare-fun c!130469 () Bool)

(assert (=> b!1407238 (= c!130469 (validKeyInArray!0 (select (arr!46429 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407239 () Bool)

(declare-fun call!66966 () Bool)

(assert (=> b!1407239 (= e!796487 call!66966)))

(declare-fun b!1407240 () Bool)

(assert (=> b!1407240 (= e!796486 call!66966)))

(declare-fun bm!66963 () Bool)

(assert (=> bm!66963 (= call!66966 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151433 (not res!945236)) b!1407238))

(assert (= (and b!1407238 c!130469) b!1407237))

(assert (= (and b!1407238 (not c!130469)) b!1407240))

(assert (= (and b!1407237 res!945235) b!1407239))

(assert (= (or b!1407239 b!1407240) bm!66963))

(declare-fun m!1295921 () Bool)

(assert (=> b!1407237 m!1295921))

(declare-fun m!1295923 () Bool)

(assert (=> b!1407237 m!1295923))

(declare-fun m!1295925 () Bool)

(assert (=> b!1407237 m!1295925))

(assert (=> b!1407237 m!1295921))

(declare-fun m!1295927 () Bool)

(assert (=> b!1407237 m!1295927))

(assert (=> b!1407238 m!1295921))

(assert (=> b!1407238 m!1295921))

(declare-fun m!1295929 () Bool)

(assert (=> b!1407238 m!1295929))

(declare-fun m!1295931 () Bool)

(assert (=> bm!66963 m!1295931))

(assert (=> b!1407004 d!151433))

(declare-fun d!151435 () Bool)

(assert (=> d!151435 (= (validKeyInArray!0 (select (arr!46429 a!2901) i!1037)) (and (not (= (select (arr!46429 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46429 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407003 d!151435))

(declare-fun d!151437 () Bool)

(assert (=> d!151437 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120956 d!151437))

(declare-fun d!151445 () Bool)

(assert (=> d!151445 (= (array_inv!35662 a!2901) (bvsge (size!46981 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120956 d!151445))

(declare-fun bm!66967 () Bool)

(declare-fun call!66970 () Bool)

(declare-fun c!130482 () Bool)

(assert (=> bm!66967 (= call!66970 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130482 (Cons!33022 (select (arr!46429 a!2901) #b00000000000000000000000000000000) Nil!33023) Nil!33023)))))

(declare-fun b!1407277 () Bool)

(declare-fun e!796513 () Bool)

(assert (=> b!1407277 (= e!796513 call!66970)))

(declare-fun b!1407278 () Bool)

(declare-fun e!796515 () Bool)

(declare-fun e!796514 () Bool)

(assert (=> b!1407278 (= e!796515 e!796514)))

(declare-fun res!945250 () Bool)

(assert (=> b!1407278 (=> (not res!945250) (not e!796514))))

(declare-fun e!796512 () Bool)

(assert (=> b!1407278 (= res!945250 (not e!796512))))

(declare-fun res!945251 () Bool)

(assert (=> b!1407278 (=> (not res!945251) (not e!796512))))

(assert (=> b!1407278 (= res!945251 (validKeyInArray!0 (select (arr!46429 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407279 () Bool)

(assert (=> b!1407279 (= e!796514 e!796513)))

(assert (=> b!1407279 (= c!130482 (validKeyInArray!0 (select (arr!46429 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151447 () Bool)

(declare-fun res!945249 () Bool)

(assert (=> d!151447 (=> res!945249 e!796515)))

(assert (=> d!151447 (= res!945249 (bvsge #b00000000000000000000000000000000 (size!46981 a!2901)))))

(assert (=> d!151447 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33023) e!796515)))

(declare-fun b!1407280 () Bool)

(declare-fun contains!9761 (List!33026 (_ BitVec 64)) Bool)

(assert (=> b!1407280 (= e!796512 (contains!9761 Nil!33023 (select (arr!46429 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407281 () Bool)

(assert (=> b!1407281 (= e!796513 call!66970)))

(assert (= (and d!151447 (not res!945249)) b!1407278))

(assert (= (and b!1407278 res!945251) b!1407280))

(assert (= (and b!1407278 res!945250) b!1407279))

(assert (= (and b!1407279 c!130482) b!1407281))

(assert (= (and b!1407279 (not c!130482)) b!1407277))

(assert (= (or b!1407281 b!1407277) bm!66967))

(assert (=> bm!66967 m!1295921))

(declare-fun m!1295945 () Bool)

(assert (=> bm!66967 m!1295945))

(assert (=> b!1407278 m!1295921))

(assert (=> b!1407278 m!1295921))

(assert (=> b!1407278 m!1295929))

(assert (=> b!1407279 m!1295921))

(assert (=> b!1407279 m!1295921))

(assert (=> b!1407279 m!1295929))

(assert (=> b!1407280 m!1295921))

(assert (=> b!1407280 m!1295921))

(declare-fun m!1295947 () Bool)

(assert (=> b!1407280 m!1295947))

(assert (=> b!1407009 d!151447))

(check-sat (not b!1407280) (not d!151401) (not bm!66960) (not b!1407214) (not b!1407234) (not d!151427) (not bm!66967) (not b!1407080) (not b!1407237) (not b!1407238) (not b!1407278) (not b!1407149) (not d!151421) (not b!1407215) (not d!151389) (not bm!66963) (not b!1407279))
(check-sat)
