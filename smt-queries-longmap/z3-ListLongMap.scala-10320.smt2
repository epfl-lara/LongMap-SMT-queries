; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121298 () Bool)

(assert start!121298)

(declare-datatypes ((array!96401 0))(
  ( (array!96402 (arr!46542 (Array (_ BitVec 32) (_ BitVec 64))) (size!47092 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96401)

(declare-fun b!1410029 () Bool)

(declare-fun e!797924 () Bool)

(declare-datatypes ((SeekEntryResult!10853 0))(
  ( (MissingZero!10853 (index!45789 (_ BitVec 32))) (Found!10853 (index!45790 (_ BitVec 32))) (Intermediate!10853 (undefined!11665 Bool) (index!45791 (_ BitVec 32)) (x!127380 (_ BitVec 32))) (Undefined!10853) (MissingVacant!10853 (index!45792 (_ BitVec 32))) )
))
(declare-fun lt!620974 () SeekEntryResult!10853)

(declare-fun lt!620975 () (_ BitVec 32))

(declare-fun lt!620973 () SeekEntryResult!10853)

(get-info :version)

(assert (=> b!1410029 (= e!797924 (or (= lt!620974 lt!620973) (not ((_ is Intermediate!10853) lt!620973)) (bvslt (x!127380 lt!620974) #b00000000000000000000000000000000) (bvsgt (x!127380 lt!620974) #b01111111111111111111111111111110) (and (bvsge lt!620975 #b00000000000000000000000000000000) (bvslt lt!620975 (size!47092 a!2901)))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96401 (_ BitVec 32)) SeekEntryResult!10853)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410029 (= lt!620973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901)) mask!2840))))

(declare-fun b!1410030 () Bool)

(declare-fun e!797922 () Bool)

(assert (=> b!1410030 (= e!797922 (not e!797924))))

(declare-fun res!947591 () Bool)

(assert (=> b!1410030 (=> res!947591 e!797924)))

(assert (=> b!1410030 (= res!947591 (or (not ((_ is Intermediate!10853) lt!620974)) (undefined!11665 lt!620974)))))

(declare-fun e!797923 () Bool)

(assert (=> b!1410030 e!797923))

(declare-fun res!947586 () Bool)

(assert (=> b!1410030 (=> (not res!947586) (not e!797923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96401 (_ BitVec 32)) Bool)

(assert (=> b!1410030 (= res!947586 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47680 0))(
  ( (Unit!47681) )
))
(declare-fun lt!620976 () Unit!47680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47680)

(assert (=> b!1410030 (= lt!620976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410030 (= lt!620974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620975 (select (arr!46542 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410030 (= lt!620975 (toIndex!0 (select (arr!46542 a!2901) j!112) mask!2840))))

(declare-fun b!1410031 () Bool)

(declare-fun res!947592 () Bool)

(assert (=> b!1410031 (=> (not res!947592) (not e!797922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410031 (= res!947592 (validKeyInArray!0 (select (arr!46542 a!2901) j!112)))))

(declare-fun b!1410032 () Bool)

(declare-fun res!947589 () Bool)

(assert (=> b!1410032 (=> (not res!947589) (not e!797922))))

(assert (=> b!1410032 (= res!947589 (validKeyInArray!0 (select (arr!46542 a!2901) i!1037)))))

(declare-fun b!1410033 () Bool)

(declare-fun res!947590 () Bool)

(assert (=> b!1410033 (=> (not res!947590) (not e!797922))))

(declare-datatypes ((List!33061 0))(
  ( (Nil!33058) (Cons!33057 (h!34323 (_ BitVec 64)) (t!47755 List!33061)) )
))
(declare-fun arrayNoDuplicates!0 (array!96401 (_ BitVec 32) List!33061) Bool)

(assert (=> b!1410033 (= res!947590 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33058))))

(declare-fun b!1410035 () Bool)

(declare-fun res!947587 () Bool)

(assert (=> b!1410035 (=> (not res!947587) (not e!797922))))

(assert (=> b!1410035 (= res!947587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410036 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96401 (_ BitVec 32)) SeekEntryResult!10853)

(assert (=> b!1410036 (= e!797923 (= (seekEntryOrOpen!0 (select (arr!46542 a!2901) j!112) a!2901 mask!2840) (Found!10853 j!112)))))

(declare-fun b!1410034 () Bool)

(declare-fun res!947588 () Bool)

(assert (=> b!1410034 (=> (not res!947588) (not e!797922))))

(assert (=> b!1410034 (= res!947588 (and (= (size!47092 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47092 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47092 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!947593 () Bool)

(assert (=> start!121298 (=> (not res!947593) (not e!797922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121298 (= res!947593 (validMask!0 mask!2840))))

(assert (=> start!121298 e!797922))

(assert (=> start!121298 true))

(declare-fun array_inv!35570 (array!96401) Bool)

(assert (=> start!121298 (array_inv!35570 a!2901)))

(assert (= (and start!121298 res!947593) b!1410034))

(assert (= (and b!1410034 res!947588) b!1410032))

(assert (= (and b!1410032 res!947589) b!1410031))

(assert (= (and b!1410031 res!947592) b!1410035))

(assert (= (and b!1410035 res!947587) b!1410033))

(assert (= (and b!1410033 res!947590) b!1410030))

(assert (= (and b!1410030 res!947586) b!1410036))

(assert (= (and b!1410030 (not res!947591)) b!1410029))

(declare-fun m!1299781 () Bool)

(assert (=> b!1410029 m!1299781))

(declare-fun m!1299783 () Bool)

(assert (=> b!1410029 m!1299783))

(assert (=> b!1410029 m!1299783))

(declare-fun m!1299785 () Bool)

(assert (=> b!1410029 m!1299785))

(assert (=> b!1410029 m!1299785))

(assert (=> b!1410029 m!1299783))

(declare-fun m!1299787 () Bool)

(assert (=> b!1410029 m!1299787))

(declare-fun m!1299789 () Bool)

(assert (=> b!1410032 m!1299789))

(assert (=> b!1410032 m!1299789))

(declare-fun m!1299791 () Bool)

(assert (=> b!1410032 m!1299791))

(declare-fun m!1299793 () Bool)

(assert (=> b!1410033 m!1299793))

(declare-fun m!1299795 () Bool)

(assert (=> b!1410031 m!1299795))

(assert (=> b!1410031 m!1299795))

(declare-fun m!1299797 () Bool)

(assert (=> b!1410031 m!1299797))

(declare-fun m!1299799 () Bool)

(assert (=> b!1410035 m!1299799))

(declare-fun m!1299801 () Bool)

(assert (=> start!121298 m!1299801))

(declare-fun m!1299803 () Bool)

(assert (=> start!121298 m!1299803))

(assert (=> b!1410030 m!1299795))

(declare-fun m!1299805 () Bool)

(assert (=> b!1410030 m!1299805))

(assert (=> b!1410030 m!1299795))

(declare-fun m!1299807 () Bool)

(assert (=> b!1410030 m!1299807))

(declare-fun m!1299809 () Bool)

(assert (=> b!1410030 m!1299809))

(assert (=> b!1410030 m!1299795))

(declare-fun m!1299811 () Bool)

(assert (=> b!1410030 m!1299811))

(assert (=> b!1410036 m!1299795))

(assert (=> b!1410036 m!1299795))

(declare-fun m!1299813 () Bool)

(assert (=> b!1410036 m!1299813))

(check-sat (not b!1410035) (not b!1410029) (not b!1410030) (not b!1410036) (not b!1410032) (not b!1410031) (not start!121298) (not b!1410033))
(check-sat)
(get-model)

(declare-fun b!1410069 () Bool)

(declare-fun e!797943 () Bool)

(declare-fun call!67036 () Bool)

(assert (=> b!1410069 (= e!797943 call!67036)))

(declare-fun bm!67033 () Bool)

(assert (=> bm!67033 (= call!67036 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151807 () Bool)

(declare-fun res!947623 () Bool)

(declare-fun e!797945 () Bool)

(assert (=> d!151807 (=> res!947623 e!797945)))

(assert (=> d!151807 (= res!947623 (bvsge #b00000000000000000000000000000000 (size!47092 a!2901)))))

(assert (=> d!151807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!797945)))

(declare-fun b!1410070 () Bool)

(declare-fun e!797944 () Bool)

(assert (=> b!1410070 (= e!797944 e!797943)))

(declare-fun lt!620997 () (_ BitVec 64))

(assert (=> b!1410070 (= lt!620997 (select (arr!46542 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!620995 () Unit!47680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96401 (_ BitVec 64) (_ BitVec 32)) Unit!47680)

(assert (=> b!1410070 (= lt!620995 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620997 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1410070 (arrayContainsKey!0 a!2901 lt!620997 #b00000000000000000000000000000000)))

(declare-fun lt!620996 () Unit!47680)

(assert (=> b!1410070 (= lt!620996 lt!620995)))

(declare-fun res!947622 () Bool)

(assert (=> b!1410070 (= res!947622 (= (seekEntryOrOpen!0 (select (arr!46542 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10853 #b00000000000000000000000000000000)))))

(assert (=> b!1410070 (=> (not res!947622) (not e!797943))))

(declare-fun b!1410071 () Bool)

(assert (=> b!1410071 (= e!797944 call!67036)))

(declare-fun b!1410072 () Bool)

(assert (=> b!1410072 (= e!797945 e!797944)))

(declare-fun c!130692 () Bool)

(assert (=> b!1410072 (= c!130692 (validKeyInArray!0 (select (arr!46542 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151807 (not res!947623)) b!1410072))

(assert (= (and b!1410072 c!130692) b!1410070))

(assert (= (and b!1410072 (not c!130692)) b!1410071))

(assert (= (and b!1410070 res!947622) b!1410069))

(assert (= (or b!1410069 b!1410071) bm!67033))

(declare-fun m!1299849 () Bool)

(assert (=> bm!67033 m!1299849))

(declare-fun m!1299851 () Bool)

(assert (=> b!1410070 m!1299851))

(declare-fun m!1299853 () Bool)

(assert (=> b!1410070 m!1299853))

(declare-fun m!1299855 () Bool)

(assert (=> b!1410070 m!1299855))

(assert (=> b!1410070 m!1299851))

(declare-fun m!1299857 () Bool)

(assert (=> b!1410070 m!1299857))

(assert (=> b!1410072 m!1299851))

(assert (=> b!1410072 m!1299851))

(declare-fun m!1299859 () Bool)

(assert (=> b!1410072 m!1299859))

(assert (=> b!1410035 d!151807))

(declare-fun b!1410091 () Bool)

(declare-fun lt!621003 () SeekEntryResult!10853)

(assert (=> b!1410091 (and (bvsge (index!45791 lt!621003) #b00000000000000000000000000000000) (bvslt (index!45791 lt!621003) (size!47092 (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901)))))))

(declare-fun res!947630 () Bool)

(assert (=> b!1410091 (= res!947630 (= (select (arr!46542 (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901))) (index!45791 lt!621003)) (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!797956 () Bool)

(assert (=> b!1410091 (=> res!947630 e!797956)))

(declare-fun e!797957 () Bool)

(assert (=> b!1410091 (= e!797957 e!797956)))

(declare-fun b!1410092 () Bool)

(assert (=> b!1410092 (and (bvsge (index!45791 lt!621003) #b00000000000000000000000000000000) (bvslt (index!45791 lt!621003) (size!47092 (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901)))))))

(assert (=> b!1410092 (= e!797956 (= (select (arr!46542 (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901))) (index!45791 lt!621003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410093 () Bool)

(declare-fun e!797959 () SeekEntryResult!10853)

(assert (=> b!1410093 (= e!797959 (Intermediate!10853 true (toIndex!0 (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun e!797960 () SeekEntryResult!10853)

(declare-fun b!1410094 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410094 (= e!797960 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901)) mask!2840))))

(declare-fun b!1410095 () Bool)

(assert (=> b!1410095 (and (bvsge (index!45791 lt!621003) #b00000000000000000000000000000000) (bvslt (index!45791 lt!621003) (size!47092 (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901)))))))

(declare-fun res!947631 () Bool)

(assert (=> b!1410095 (= res!947631 (= (select (arr!46542 (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901))) (index!45791 lt!621003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410095 (=> res!947631 e!797956)))

(declare-fun d!151809 () Bool)

(declare-fun e!797958 () Bool)

(assert (=> d!151809 e!797958))

(declare-fun c!130699 () Bool)

(assert (=> d!151809 (= c!130699 (and ((_ is Intermediate!10853) lt!621003) (undefined!11665 lt!621003)))))

(assert (=> d!151809 (= lt!621003 e!797959)))

(declare-fun c!130700 () Bool)

(assert (=> d!151809 (= c!130700 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621002 () (_ BitVec 64))

(assert (=> d!151809 (= lt!621002 (select (arr!46542 (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901))) (toIndex!0 (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151809 (validMask!0 mask!2840)))

(assert (=> d!151809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96402 (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901)) mask!2840) lt!621003)))

(declare-fun b!1410096 () Bool)

(assert (=> b!1410096 (= e!797960 (Intermediate!10853 false (toIndex!0 (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410097 () Bool)

(assert (=> b!1410097 (= e!797959 e!797960)))

(declare-fun c!130701 () Bool)

(assert (=> b!1410097 (= c!130701 (or (= lt!621002 (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621002 lt!621002) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410098 () Bool)

(assert (=> b!1410098 (= e!797958 (bvsge (x!127380 lt!621003) #b01111111111111111111111111111110))))

(declare-fun b!1410099 () Bool)

(assert (=> b!1410099 (= e!797958 e!797957)))

(declare-fun res!947632 () Bool)

(assert (=> b!1410099 (= res!947632 (and ((_ is Intermediate!10853) lt!621003) (not (undefined!11665 lt!621003)) (bvslt (x!127380 lt!621003) #b01111111111111111111111111111110) (bvsge (x!127380 lt!621003) #b00000000000000000000000000000000) (bvsge (x!127380 lt!621003) #b00000000000000000000000000000000)))))

(assert (=> b!1410099 (=> (not res!947632) (not e!797957))))

(assert (= (and d!151809 c!130700) b!1410093))

(assert (= (and d!151809 (not c!130700)) b!1410097))

(assert (= (and b!1410097 c!130701) b!1410096))

(assert (= (and b!1410097 (not c!130701)) b!1410094))

(assert (= (and d!151809 c!130699) b!1410098))

(assert (= (and d!151809 (not c!130699)) b!1410099))

(assert (= (and b!1410099 res!947632) b!1410091))

(assert (= (and b!1410091 (not res!947630)) b!1410095))

(assert (= (and b!1410095 (not res!947631)) b!1410092))

(declare-fun m!1299861 () Bool)

(assert (=> b!1410095 m!1299861))

(assert (=> b!1410092 m!1299861))

(assert (=> d!151809 m!1299785))

(declare-fun m!1299863 () Bool)

(assert (=> d!151809 m!1299863))

(assert (=> d!151809 m!1299801))

(assert (=> b!1410094 m!1299785))

(declare-fun m!1299865 () Bool)

(assert (=> b!1410094 m!1299865))

(assert (=> b!1410094 m!1299865))

(assert (=> b!1410094 m!1299783))

(declare-fun m!1299867 () Bool)

(assert (=> b!1410094 m!1299867))

(assert (=> b!1410091 m!1299861))

(assert (=> b!1410029 d!151809))

(declare-fun d!151821 () Bool)

(declare-fun lt!621009 () (_ BitVec 32))

(declare-fun lt!621008 () (_ BitVec 32))

(assert (=> d!151821 (= lt!621009 (bvmul (bvxor lt!621008 (bvlshr lt!621008 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151821 (= lt!621008 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151821 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947633 (let ((h!34325 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127383 (bvmul (bvxor h!34325 (bvlshr h!34325 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127383 (bvlshr x!127383 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947633 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947633 #b00000000000000000000000000000000))))))

(assert (=> d!151821 (= (toIndex!0 (select (store (arr!46542 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!621009 (bvlshr lt!621009 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410029 d!151821))

(declare-fun d!151825 () Bool)

(declare-fun lt!621036 () SeekEntryResult!10853)

(assert (=> d!151825 (and (or ((_ is Undefined!10853) lt!621036) (not ((_ is Found!10853) lt!621036)) (and (bvsge (index!45790 lt!621036) #b00000000000000000000000000000000) (bvslt (index!45790 lt!621036) (size!47092 a!2901)))) (or ((_ is Undefined!10853) lt!621036) ((_ is Found!10853) lt!621036) (not ((_ is MissingZero!10853) lt!621036)) (and (bvsge (index!45789 lt!621036) #b00000000000000000000000000000000) (bvslt (index!45789 lt!621036) (size!47092 a!2901)))) (or ((_ is Undefined!10853) lt!621036) ((_ is Found!10853) lt!621036) ((_ is MissingZero!10853) lt!621036) (not ((_ is MissingVacant!10853) lt!621036)) (and (bvsge (index!45792 lt!621036) #b00000000000000000000000000000000) (bvslt (index!45792 lt!621036) (size!47092 a!2901)))) (or ((_ is Undefined!10853) lt!621036) (ite ((_ is Found!10853) lt!621036) (= (select (arr!46542 a!2901) (index!45790 lt!621036)) (select (arr!46542 a!2901) j!112)) (ite ((_ is MissingZero!10853) lt!621036) (= (select (arr!46542 a!2901) (index!45789 lt!621036)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10853) lt!621036) (= (select (arr!46542 a!2901) (index!45792 lt!621036)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!797986 () SeekEntryResult!10853)

(assert (=> d!151825 (= lt!621036 e!797986)))

(declare-fun c!130721 () Bool)

(declare-fun lt!621034 () SeekEntryResult!10853)

(assert (=> d!151825 (= c!130721 (and ((_ is Intermediate!10853) lt!621034) (undefined!11665 lt!621034)))))

(assert (=> d!151825 (= lt!621034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46542 a!2901) j!112) mask!2840) (select (arr!46542 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151825 (validMask!0 mask!2840)))

(assert (=> d!151825 (= (seekEntryOrOpen!0 (select (arr!46542 a!2901) j!112) a!2901 mask!2840) lt!621036)))

(declare-fun b!1410142 () Bool)

(declare-fun e!797985 () SeekEntryResult!10853)

(assert (=> b!1410142 (= e!797985 (Found!10853 (index!45791 lt!621034)))))

(declare-fun b!1410143 () Bool)

(declare-fun c!130720 () Bool)

(declare-fun lt!621035 () (_ BitVec 64))

(assert (=> b!1410143 (= c!130720 (= lt!621035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797987 () SeekEntryResult!10853)

(assert (=> b!1410143 (= e!797985 e!797987)))

(declare-fun b!1410144 () Bool)

(assert (=> b!1410144 (= e!797987 (MissingZero!10853 (index!45791 lt!621034)))))

(declare-fun b!1410145 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96401 (_ BitVec 32)) SeekEntryResult!10853)

(assert (=> b!1410145 (= e!797987 (seekKeyOrZeroReturnVacant!0 (x!127380 lt!621034) (index!45791 lt!621034) (index!45791 lt!621034) (select (arr!46542 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410146 () Bool)

(assert (=> b!1410146 (= e!797986 e!797985)))

(assert (=> b!1410146 (= lt!621035 (select (arr!46542 a!2901) (index!45791 lt!621034)))))

(declare-fun c!130722 () Bool)

(assert (=> b!1410146 (= c!130722 (= lt!621035 (select (arr!46542 a!2901) j!112)))))

(declare-fun b!1410147 () Bool)

(assert (=> b!1410147 (= e!797986 Undefined!10853)))

(assert (= (and d!151825 c!130721) b!1410147))

(assert (= (and d!151825 (not c!130721)) b!1410146))

(assert (= (and b!1410146 c!130722) b!1410142))

(assert (= (and b!1410146 (not c!130722)) b!1410143))

(assert (= (and b!1410143 c!130720) b!1410144))

(assert (= (and b!1410143 (not c!130720)) b!1410145))

(declare-fun m!1299893 () Bool)

(assert (=> d!151825 m!1299893))

(assert (=> d!151825 m!1299805))

(assert (=> d!151825 m!1299795))

(declare-fun m!1299895 () Bool)

(assert (=> d!151825 m!1299895))

(assert (=> d!151825 m!1299801))

(assert (=> d!151825 m!1299795))

(assert (=> d!151825 m!1299805))

(declare-fun m!1299897 () Bool)

(assert (=> d!151825 m!1299897))

(declare-fun m!1299899 () Bool)

(assert (=> d!151825 m!1299899))

(assert (=> b!1410145 m!1299795))

(declare-fun m!1299901 () Bool)

(assert (=> b!1410145 m!1299901))

(declare-fun m!1299903 () Bool)

(assert (=> b!1410146 m!1299903))

(assert (=> b!1410036 d!151825))

(declare-fun d!151835 () Bool)

(assert (=> d!151835 (= (validKeyInArray!0 (select (arr!46542 a!2901) j!112)) (and (not (= (select (arr!46542 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46542 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410031 d!151835))

(declare-fun b!1410160 () Bool)

(declare-fun e!797994 () Bool)

(declare-fun call!67040 () Bool)

(assert (=> b!1410160 (= e!797994 call!67040)))

(declare-fun bm!67037 () Bool)

(assert (=> bm!67037 (= call!67040 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151837 () Bool)

(declare-fun res!947641 () Bool)

(declare-fun e!797996 () Bool)

(assert (=> d!151837 (=> res!947641 e!797996)))

(assert (=> d!151837 (= res!947641 (bvsge j!112 (size!47092 a!2901)))))

(assert (=> d!151837 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!797996)))

(declare-fun b!1410161 () Bool)

(declare-fun e!797995 () Bool)

(assert (=> b!1410161 (= e!797995 e!797994)))

(declare-fun lt!621043 () (_ BitVec 64))

(assert (=> b!1410161 (= lt!621043 (select (arr!46542 a!2901) j!112))))

(declare-fun lt!621041 () Unit!47680)

(assert (=> b!1410161 (= lt!621041 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621043 j!112))))

(assert (=> b!1410161 (arrayContainsKey!0 a!2901 lt!621043 #b00000000000000000000000000000000)))

(declare-fun lt!621042 () Unit!47680)

(assert (=> b!1410161 (= lt!621042 lt!621041)))

(declare-fun res!947640 () Bool)

(assert (=> b!1410161 (= res!947640 (= (seekEntryOrOpen!0 (select (arr!46542 a!2901) j!112) a!2901 mask!2840) (Found!10853 j!112)))))

(assert (=> b!1410161 (=> (not res!947640) (not e!797994))))

(declare-fun b!1410162 () Bool)

(assert (=> b!1410162 (= e!797995 call!67040)))

(declare-fun b!1410163 () Bool)

(assert (=> b!1410163 (= e!797996 e!797995)))

(declare-fun c!130729 () Bool)

(assert (=> b!1410163 (= c!130729 (validKeyInArray!0 (select (arr!46542 a!2901) j!112)))))

(assert (= (and d!151837 (not res!947641)) b!1410163))

(assert (= (and b!1410163 c!130729) b!1410161))

(assert (= (and b!1410163 (not c!130729)) b!1410162))

(assert (= (and b!1410161 res!947640) b!1410160))

(assert (= (or b!1410160 b!1410162) bm!67037))

(declare-fun m!1299905 () Bool)

(assert (=> bm!67037 m!1299905))

(assert (=> b!1410161 m!1299795))

(declare-fun m!1299907 () Bool)

(assert (=> b!1410161 m!1299907))

(declare-fun m!1299909 () Bool)

(assert (=> b!1410161 m!1299909))

(assert (=> b!1410161 m!1299795))

(assert (=> b!1410161 m!1299813))

(assert (=> b!1410163 m!1299795))

(assert (=> b!1410163 m!1299795))

(assert (=> b!1410163 m!1299797))

(assert (=> b!1410030 d!151837))

(declare-fun d!151839 () Bool)

(assert (=> d!151839 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621054 () Unit!47680)

(declare-fun choose!38 (array!96401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47680)

(assert (=> d!151839 (= lt!621054 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151839 (validMask!0 mask!2840)))

(assert (=> d!151839 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621054)))

(declare-fun bs!41111 () Bool)

(assert (= bs!41111 d!151839))

(assert (=> bs!41111 m!1299809))

(declare-fun m!1299917 () Bool)

(assert (=> bs!41111 m!1299917))

(assert (=> bs!41111 m!1299801))

(assert (=> b!1410030 d!151839))

(declare-fun b!1410191 () Bool)

(declare-fun lt!621059 () SeekEntryResult!10853)

(assert (=> b!1410191 (and (bvsge (index!45791 lt!621059) #b00000000000000000000000000000000) (bvslt (index!45791 lt!621059) (size!47092 a!2901)))))

(declare-fun res!947657 () Bool)

(assert (=> b!1410191 (= res!947657 (= (select (arr!46542 a!2901) (index!45791 lt!621059)) (select (arr!46542 a!2901) j!112)))))

(declare-fun e!798015 () Bool)

(assert (=> b!1410191 (=> res!947657 e!798015)))

(declare-fun e!798016 () Bool)

(assert (=> b!1410191 (= e!798016 e!798015)))

(declare-fun b!1410192 () Bool)

(assert (=> b!1410192 (and (bvsge (index!45791 lt!621059) #b00000000000000000000000000000000) (bvslt (index!45791 lt!621059) (size!47092 a!2901)))))

(assert (=> b!1410192 (= e!798015 (= (select (arr!46542 a!2901) (index!45791 lt!621059)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410193 () Bool)

(declare-fun e!798018 () SeekEntryResult!10853)

(assert (=> b!1410193 (= e!798018 (Intermediate!10853 true lt!620975 #b00000000000000000000000000000000))))

(declare-fun b!1410194 () Bool)

(declare-fun e!798019 () SeekEntryResult!10853)

(assert (=> b!1410194 (= e!798019 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!620975 #b00000000000000000000000000000000 mask!2840) (select (arr!46542 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410195 () Bool)

(assert (=> b!1410195 (and (bvsge (index!45791 lt!621059) #b00000000000000000000000000000000) (bvslt (index!45791 lt!621059) (size!47092 a!2901)))))

(declare-fun res!947658 () Bool)

(assert (=> b!1410195 (= res!947658 (= (select (arr!46542 a!2901) (index!45791 lt!621059)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410195 (=> res!947658 e!798015)))

(declare-fun d!151841 () Bool)

(declare-fun e!798017 () Bool)

(assert (=> d!151841 e!798017))

(declare-fun c!130736 () Bool)

(assert (=> d!151841 (= c!130736 (and ((_ is Intermediate!10853) lt!621059) (undefined!11665 lt!621059)))))

(assert (=> d!151841 (= lt!621059 e!798018)))

(declare-fun c!130737 () Bool)

(assert (=> d!151841 (= c!130737 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621058 () (_ BitVec 64))

(assert (=> d!151841 (= lt!621058 (select (arr!46542 a!2901) lt!620975))))

(assert (=> d!151841 (validMask!0 mask!2840)))

(assert (=> d!151841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620975 (select (arr!46542 a!2901) j!112) a!2901 mask!2840) lt!621059)))

(declare-fun b!1410196 () Bool)

(assert (=> b!1410196 (= e!798019 (Intermediate!10853 false lt!620975 #b00000000000000000000000000000000))))

(declare-fun b!1410197 () Bool)

(assert (=> b!1410197 (= e!798018 e!798019)))

(declare-fun c!130738 () Bool)

(assert (=> b!1410197 (= c!130738 (or (= lt!621058 (select (arr!46542 a!2901) j!112)) (= (bvadd lt!621058 lt!621058) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410198 () Bool)

(assert (=> b!1410198 (= e!798017 (bvsge (x!127380 lt!621059) #b01111111111111111111111111111110))))

(declare-fun b!1410199 () Bool)

(assert (=> b!1410199 (= e!798017 e!798016)))

(declare-fun res!947659 () Bool)

(assert (=> b!1410199 (= res!947659 (and ((_ is Intermediate!10853) lt!621059) (not (undefined!11665 lt!621059)) (bvslt (x!127380 lt!621059) #b01111111111111111111111111111110) (bvsge (x!127380 lt!621059) #b00000000000000000000000000000000) (bvsge (x!127380 lt!621059) #b00000000000000000000000000000000)))))

(assert (=> b!1410199 (=> (not res!947659) (not e!798016))))

(assert (= (and d!151841 c!130737) b!1410193))

(assert (= (and d!151841 (not c!130737)) b!1410197))

(assert (= (and b!1410197 c!130738) b!1410196))

(assert (= (and b!1410197 (not c!130738)) b!1410194))

(assert (= (and d!151841 c!130736) b!1410198))

(assert (= (and d!151841 (not c!130736)) b!1410199))

(assert (= (and b!1410199 res!947659) b!1410191))

(assert (= (and b!1410191 (not res!947657)) b!1410195))

(assert (= (and b!1410195 (not res!947658)) b!1410192))

(declare-fun m!1299933 () Bool)

(assert (=> b!1410195 m!1299933))

(assert (=> b!1410192 m!1299933))

(declare-fun m!1299935 () Bool)

(assert (=> d!151841 m!1299935))

(assert (=> d!151841 m!1299801))

(declare-fun m!1299937 () Bool)

(assert (=> b!1410194 m!1299937))

(assert (=> b!1410194 m!1299937))

(assert (=> b!1410194 m!1299795))

(declare-fun m!1299939 () Bool)

(assert (=> b!1410194 m!1299939))

(assert (=> b!1410191 m!1299933))

(assert (=> b!1410030 d!151841))

(declare-fun d!151847 () Bool)

(declare-fun lt!621061 () (_ BitVec 32))

(declare-fun lt!621060 () (_ BitVec 32))

(assert (=> d!151847 (= lt!621061 (bvmul (bvxor lt!621060 (bvlshr lt!621060 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151847 (= lt!621060 ((_ extract 31 0) (bvand (bvxor (select (arr!46542 a!2901) j!112) (bvlshr (select (arr!46542 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151847 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947633 (let ((h!34325 ((_ extract 31 0) (bvand (bvxor (select (arr!46542 a!2901) j!112) (bvlshr (select (arr!46542 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127383 (bvmul (bvxor h!34325 (bvlshr h!34325 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127383 (bvlshr x!127383 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947633 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947633 #b00000000000000000000000000000000))))))

(assert (=> d!151847 (= (toIndex!0 (select (arr!46542 a!2901) j!112) mask!2840) (bvand (bvxor lt!621061 (bvlshr lt!621061 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410030 d!151847))

(declare-fun d!151849 () Bool)

(assert (=> d!151849 (= (validKeyInArray!0 (select (arr!46542 a!2901) i!1037)) (and (not (= (select (arr!46542 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46542 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410032 d!151849))

(declare-fun d!151851 () Bool)

(assert (=> d!151851 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121298 d!151851))

(declare-fun d!151865 () Bool)

(assert (=> d!151865 (= (array_inv!35570 a!2901) (bvsge (size!47092 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121298 d!151865))

(declare-fun b!1410242 () Bool)

(declare-fun e!798054 () Bool)

(declare-fun call!67051 () Bool)

(assert (=> b!1410242 (= e!798054 call!67051)))

(declare-fun b!1410244 () Bool)

(declare-fun e!798051 () Bool)

(assert (=> b!1410244 (= e!798051 e!798054)))

(declare-fun c!130749 () Bool)

(assert (=> b!1410244 (= c!130749 (validKeyInArray!0 (select (arr!46542 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67048 () Bool)

(assert (=> bm!67048 (= call!67051 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130749 (Cons!33057 (select (arr!46542 a!2901) #b00000000000000000000000000000000) Nil!33058) Nil!33058)))))

(declare-fun b!1410245 () Bool)

(declare-fun e!798053 () Bool)

(declare-fun contains!9805 (List!33061 (_ BitVec 64)) Bool)

(assert (=> b!1410245 (= e!798053 (contains!9805 Nil!33058 (select (arr!46542 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410246 () Bool)

(assert (=> b!1410246 (= e!798054 call!67051)))

(declare-fun b!1410243 () Bool)

(declare-fun e!798052 () Bool)

(assert (=> b!1410243 (= e!798052 e!798051)))

(declare-fun res!947684 () Bool)

(assert (=> b!1410243 (=> (not res!947684) (not e!798051))))

(assert (=> b!1410243 (= res!947684 (not e!798053))))

(declare-fun res!947685 () Bool)

(assert (=> b!1410243 (=> (not res!947685) (not e!798053))))

(assert (=> b!1410243 (= res!947685 (validKeyInArray!0 (select (arr!46542 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151867 () Bool)

(declare-fun res!947683 () Bool)

(assert (=> d!151867 (=> res!947683 e!798052)))

(assert (=> d!151867 (= res!947683 (bvsge #b00000000000000000000000000000000 (size!47092 a!2901)))))

(assert (=> d!151867 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33058) e!798052)))

(assert (= (and d!151867 (not res!947683)) b!1410243))

(assert (= (and b!1410243 res!947685) b!1410245))

(assert (= (and b!1410243 res!947684) b!1410244))

(assert (= (and b!1410244 c!130749) b!1410242))

(assert (= (and b!1410244 (not c!130749)) b!1410246))

(assert (= (or b!1410242 b!1410246) bm!67048))

(assert (=> b!1410244 m!1299851))

(assert (=> b!1410244 m!1299851))

(assert (=> b!1410244 m!1299859))

(assert (=> bm!67048 m!1299851))

(declare-fun m!1299969 () Bool)

(assert (=> bm!67048 m!1299969))

(assert (=> b!1410245 m!1299851))

(assert (=> b!1410245 m!1299851))

(declare-fun m!1299971 () Bool)

(assert (=> b!1410245 m!1299971))

(assert (=> b!1410243 m!1299851))

(assert (=> b!1410243 m!1299851))

(assert (=> b!1410243 m!1299859))

(assert (=> b!1410033 d!151867))

(check-sat (not b!1410145) (not b!1410244) (not d!151825) (not b!1410245) (not d!151809) (not b!1410070) (not b!1410194) (not d!151841) (not bm!67033) (not b!1410243) (not bm!67037) (not b!1410163) (not b!1410072) (not bm!67048) (not b!1410161) (not d!151839) (not b!1410094))
(check-sat)
