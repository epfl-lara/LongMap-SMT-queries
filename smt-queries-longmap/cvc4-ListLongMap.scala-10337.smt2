; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121510 () Bool)

(assert start!121510)

(declare-fun b!1411930 () Bool)

(declare-fun e!799000 () Bool)

(declare-fun e!799001 () Bool)

(assert (=> b!1411930 (= e!799000 e!799001)))

(declare-fun res!949165 () Bool)

(assert (=> b!1411930 (=> res!949165 e!799001)))

(declare-datatypes ((SeekEntryResult!10905 0))(
  ( (MissingZero!10905 (index!45997 (_ BitVec 32))) (Found!10905 (index!45998 (_ BitVec 32))) (Intermediate!10905 (undefined!11717 Bool) (index!45999 (_ BitVec 32)) (x!127580 (_ BitVec 32))) (Undefined!10905) (MissingVacant!10905 (index!46000 (_ BitVec 32))) )
))
(declare-fun lt!622050 () SeekEntryResult!10905)

(declare-fun lt!622052 () SeekEntryResult!10905)

(assert (=> b!1411930 (= res!949165 (or (= lt!622050 lt!622052) (not (is-Intermediate!10905 lt!622052))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622053 () (_ BitVec 64))

(declare-datatypes ((array!96511 0))(
  ( (array!96512 (arr!46594 (Array (_ BitVec 32) (_ BitVec 64))) (size!47144 (_ BitVec 32))) )
))
(declare-fun lt!622054 () array!96511)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96511 (_ BitVec 32)) SeekEntryResult!10905)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411930 (= lt!622052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622053 mask!2840) lt!622053 lt!622054 mask!2840))))

(declare-fun a!2901 () array!96511)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411930 (= lt!622053 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1411930 (= lt!622054 (array!96512 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47144 a!2901)))))

(declare-fun res!949160 () Bool)

(declare-fun e!798999 () Bool)

(assert (=> start!121510 (=> (not res!949160) (not e!798999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121510 (= res!949160 (validMask!0 mask!2840))))

(assert (=> start!121510 e!798999))

(assert (=> start!121510 true))

(declare-fun array_inv!35622 (array!96511) Bool)

(assert (=> start!121510 (array_inv!35622 a!2901)))

(declare-fun b!1411931 () Bool)

(declare-fun res!949163 () Bool)

(assert (=> b!1411931 (=> (not res!949163) (not e!798999))))

(declare-datatypes ((List!33113 0))(
  ( (Nil!33110) (Cons!33109 (h!34381 (_ BitVec 64)) (t!47807 List!33113)) )
))
(declare-fun arrayNoDuplicates!0 (array!96511 (_ BitVec 32) List!33113) Bool)

(assert (=> b!1411931 (= res!949163 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33110))))

(declare-fun b!1411932 () Bool)

(assert (=> b!1411932 (= e!798999 (not e!799000))))

(declare-fun res!949158 () Bool)

(assert (=> b!1411932 (=> res!949158 e!799000)))

(assert (=> b!1411932 (= res!949158 (or (not (is-Intermediate!10905 lt!622050)) (undefined!11717 lt!622050)))))

(declare-fun e!798998 () Bool)

(assert (=> b!1411932 e!798998))

(declare-fun res!949164 () Bool)

(assert (=> b!1411932 (=> (not res!949164) (not e!798998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96511 (_ BitVec 32)) Bool)

(assert (=> b!1411932 (= res!949164 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47784 0))(
  ( (Unit!47785) )
))
(declare-fun lt!622055 () Unit!47784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47784)

(assert (=> b!1411932 (= lt!622055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622051 () (_ BitVec 32))

(assert (=> b!1411932 (= lt!622050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622051 (select (arr!46594 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411932 (= lt!622051 (toIndex!0 (select (arr!46594 a!2901) j!112) mask!2840))))

(declare-fun b!1411933 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96511 (_ BitVec 32)) SeekEntryResult!10905)

(assert (=> b!1411933 (= e!798998 (= (seekEntryOrOpen!0 (select (arr!46594 a!2901) j!112) a!2901 mask!2840) (Found!10905 j!112)))))

(declare-fun b!1411934 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96511 (_ BitVec 32)) SeekEntryResult!10905)

(assert (=> b!1411934 (= e!799001 (= (seekEntryOrOpen!0 lt!622053 lt!622054 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127580 lt!622052) (index!45999 lt!622052) (index!45999 lt!622052) (select (arr!46594 a!2901) j!112) lt!622054 mask!2840)))))

(assert (=> b!1411934 (and (not (undefined!11717 lt!622052)) (= (index!45999 lt!622052) i!1037) (bvslt (x!127580 lt!622052) (x!127580 lt!622050)) (= (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45999 lt!622052)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!622056 () Unit!47784)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47784)

(assert (=> b!1411934 (= lt!622056 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622051 (x!127580 lt!622050) (index!45999 lt!622050) (x!127580 lt!622052) (index!45999 lt!622052) (undefined!11717 lt!622052) mask!2840))))

(declare-fun b!1411935 () Bool)

(declare-fun res!949159 () Bool)

(assert (=> b!1411935 (=> (not res!949159) (not e!798999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411935 (= res!949159 (validKeyInArray!0 (select (arr!46594 a!2901) j!112)))))

(declare-fun b!1411936 () Bool)

(declare-fun res!949162 () Bool)

(assert (=> b!1411936 (=> (not res!949162) (not e!798999))))

(assert (=> b!1411936 (= res!949162 (validKeyInArray!0 (select (arr!46594 a!2901) i!1037)))))

(declare-fun b!1411937 () Bool)

(declare-fun res!949157 () Bool)

(assert (=> b!1411937 (=> (not res!949157) (not e!798999))))

(assert (=> b!1411937 (= res!949157 (and (= (size!47144 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47144 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47144 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411938 () Bool)

(declare-fun res!949161 () Bool)

(assert (=> b!1411938 (=> (not res!949161) (not e!798999))))

(assert (=> b!1411938 (= res!949161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121510 res!949160) b!1411937))

(assert (= (and b!1411937 res!949157) b!1411936))

(assert (= (and b!1411936 res!949162) b!1411935))

(assert (= (and b!1411935 res!949159) b!1411938))

(assert (= (and b!1411938 res!949161) b!1411931))

(assert (= (and b!1411931 res!949163) b!1411932))

(assert (= (and b!1411932 res!949164) b!1411933))

(assert (= (and b!1411932 (not res!949158)) b!1411930))

(assert (= (and b!1411930 (not res!949165)) b!1411934))

(declare-fun m!1301985 () Bool)

(assert (=> b!1411931 m!1301985))

(declare-fun m!1301987 () Bool)

(assert (=> b!1411933 m!1301987))

(assert (=> b!1411933 m!1301987))

(declare-fun m!1301989 () Bool)

(assert (=> b!1411933 m!1301989))

(assert (=> b!1411935 m!1301987))

(assert (=> b!1411935 m!1301987))

(declare-fun m!1301991 () Bool)

(assert (=> b!1411935 m!1301991))

(declare-fun m!1301993 () Bool)

(assert (=> start!121510 m!1301993))

(declare-fun m!1301995 () Bool)

(assert (=> start!121510 m!1301995))

(declare-fun m!1301997 () Bool)

(assert (=> b!1411938 m!1301997))

(assert (=> b!1411934 m!1301987))

(assert (=> b!1411934 m!1301987))

(declare-fun m!1301999 () Bool)

(assert (=> b!1411934 m!1301999))

(declare-fun m!1302001 () Bool)

(assert (=> b!1411934 m!1302001))

(declare-fun m!1302003 () Bool)

(assert (=> b!1411934 m!1302003))

(declare-fun m!1302005 () Bool)

(assert (=> b!1411934 m!1302005))

(declare-fun m!1302007 () Bool)

(assert (=> b!1411934 m!1302007))

(declare-fun m!1302009 () Bool)

(assert (=> b!1411930 m!1302009))

(assert (=> b!1411930 m!1302009))

(declare-fun m!1302011 () Bool)

(assert (=> b!1411930 m!1302011))

(assert (=> b!1411930 m!1302007))

(declare-fun m!1302013 () Bool)

(assert (=> b!1411930 m!1302013))

(declare-fun m!1302015 () Bool)

(assert (=> b!1411936 m!1302015))

(assert (=> b!1411936 m!1302015))

(declare-fun m!1302017 () Bool)

(assert (=> b!1411936 m!1302017))

(assert (=> b!1411932 m!1301987))

(declare-fun m!1302019 () Bool)

(assert (=> b!1411932 m!1302019))

(assert (=> b!1411932 m!1301987))

(declare-fun m!1302021 () Bool)

(assert (=> b!1411932 m!1302021))

(assert (=> b!1411932 m!1301987))

(declare-fun m!1302023 () Bool)

(assert (=> b!1411932 m!1302023))

(declare-fun m!1302025 () Bool)

(assert (=> b!1411932 m!1302025))

(push 1)

(assert (not start!121510))

(assert (not b!1411930))

(assert (not b!1411936))

(assert (not b!1411935))

(assert (not b!1411934))

(assert (not b!1411931))

(assert (not b!1411932))

(assert (not b!1411933))

(assert (not b!1411938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152007 () Bool)

(assert (=> d!152007 (= (validKeyInArray!0 (select (arr!46594 a!2901) i!1037)) (and (not (= (select (arr!46594 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46594 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411936 d!152007))

(declare-fun bm!67075 () Bool)

(declare-fun call!67078 () Bool)

(declare-fun c!130875 () Bool)

(assert (=> bm!67075 (= call!67078 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130875 (Cons!33109 (select (arr!46594 a!2901) #b00000000000000000000000000000000) Nil!33110) Nil!33110)))))

(declare-fun b!1411988 () Bool)

(declare-fun e!799033 () Bool)

(declare-fun e!799034 () Bool)

(assert (=> b!1411988 (= e!799033 e!799034)))

(declare-fun res!949182 () Bool)

(assert (=> b!1411988 (=> (not res!949182) (not e!799034))))

(declare-fun e!799032 () Bool)

(assert (=> b!1411988 (= res!949182 (not e!799032))))

(declare-fun res!949184 () Bool)

(assert (=> b!1411988 (=> (not res!949184) (not e!799032))))

(assert (=> b!1411988 (= res!949184 (validKeyInArray!0 (select (arr!46594 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152011 () Bool)

(declare-fun res!949183 () Bool)

(assert (=> d!152011 (=> res!949183 e!799033)))

(assert (=> d!152011 (= res!949183 (bvsge #b00000000000000000000000000000000 (size!47144 a!2901)))))

(assert (=> d!152011 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33110) e!799033)))

(declare-fun b!1411989 () Bool)

(declare-fun e!799031 () Bool)

(assert (=> b!1411989 (= e!799034 e!799031)))

(assert (=> b!1411989 (= c!130875 (validKeyInArray!0 (select (arr!46594 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411990 () Bool)

(declare-fun contains!9811 (List!33113 (_ BitVec 64)) Bool)

(assert (=> b!1411990 (= e!799032 (contains!9811 Nil!33110 (select (arr!46594 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411991 () Bool)

(assert (=> b!1411991 (= e!799031 call!67078)))

(declare-fun b!1411992 () Bool)

(assert (=> b!1411992 (= e!799031 call!67078)))

(assert (= (and d!152011 (not res!949183)) b!1411988))

(assert (= (and b!1411988 res!949184) b!1411990))

(assert (= (and b!1411988 res!949182) b!1411989))

(assert (= (and b!1411989 c!130875) b!1411992))

(assert (= (and b!1411989 (not c!130875)) b!1411991))

(assert (= (or b!1411992 b!1411991) bm!67075))

(declare-fun m!1302035 () Bool)

(assert (=> bm!67075 m!1302035))

(declare-fun m!1302037 () Bool)

(assert (=> bm!67075 m!1302037))

(assert (=> b!1411988 m!1302035))

(assert (=> b!1411988 m!1302035))

(declare-fun m!1302039 () Bool)

(assert (=> b!1411988 m!1302039))

(assert (=> b!1411989 m!1302035))

(assert (=> b!1411989 m!1302035))

(assert (=> b!1411989 m!1302039))

(assert (=> b!1411990 m!1302035))

(assert (=> b!1411990 m!1302035))

(declare-fun m!1302041 () Bool)

(assert (=> b!1411990 m!1302041))

(assert (=> b!1411931 d!152011))

(declare-fun b!1412054 () Bool)

(declare-fun e!799077 () Bool)

(declare-fun e!799076 () Bool)

(assert (=> b!1412054 (= e!799077 e!799076)))

(declare-fun res!949209 () Bool)

(declare-fun lt!622110 () SeekEntryResult!10905)

(assert (=> b!1412054 (= res!949209 (and (is-Intermediate!10905 lt!622110) (not (undefined!11717 lt!622110)) (bvslt (x!127580 lt!622110) #b01111111111111111111111111111110) (bvsge (x!127580 lt!622110) #b00000000000000000000000000000000) (bvsge (x!127580 lt!622110) #b00000000000000000000000000000000)))))

(assert (=> b!1412054 (=> (not res!949209) (not e!799076))))

(declare-fun b!1412055 () Bool)

(declare-fun e!799074 () SeekEntryResult!10905)

(assert (=> b!1412055 (= e!799074 (Intermediate!10905 false (toIndex!0 lt!622053 mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!152015 () Bool)

(assert (=> d!152015 e!799077))

(declare-fun c!130896 () Bool)

(assert (=> d!152015 (= c!130896 (and (is-Intermediate!10905 lt!622110) (undefined!11717 lt!622110)))))

(declare-fun e!799075 () SeekEntryResult!10905)

(assert (=> d!152015 (= lt!622110 e!799075)))

(declare-fun c!130897 () Bool)

(assert (=> d!152015 (= c!130897 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!622111 () (_ BitVec 64))

(assert (=> d!152015 (= lt!622111 (select (arr!46594 lt!622054) (toIndex!0 lt!622053 mask!2840)))))

(assert (=> d!152015 (validMask!0 mask!2840)))

(assert (=> d!152015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622053 mask!2840) lt!622053 lt!622054 mask!2840) lt!622110)))

(declare-fun b!1412056 () Bool)

(assert (=> b!1412056 (and (bvsge (index!45999 lt!622110) #b00000000000000000000000000000000) (bvslt (index!45999 lt!622110) (size!47144 lt!622054)))))

(declare-fun e!799078 () Bool)

(assert (=> b!1412056 (= e!799078 (= (select (arr!46594 lt!622054) (index!45999 lt!622110)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1412057 () Bool)

(assert (=> b!1412057 (and (bvsge (index!45999 lt!622110) #b00000000000000000000000000000000) (bvslt (index!45999 lt!622110) (size!47144 lt!622054)))))

(declare-fun res!949208 () Bool)

(assert (=> b!1412057 (= res!949208 (= (select (arr!46594 lt!622054) (index!45999 lt!622110)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1412057 (=> res!949208 e!799078)))

(declare-fun b!1412058 () Bool)

(assert (=> b!1412058 (= e!799075 e!799074)))

(declare-fun c!130895 () Bool)

(assert (=> b!1412058 (= c!130895 (or (= lt!622111 lt!622053) (= (bvadd lt!622111 lt!622111) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1412059 () Bool)

(assert (=> b!1412059 (= e!799075 (Intermediate!10905 true (toIndex!0 lt!622053 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1412060 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412060 (= e!799074 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!622053 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!622053 lt!622054 mask!2840))))

(declare-fun b!1412061 () Bool)

(assert (=> b!1412061 (= e!799077 (bvsge (x!127580 lt!622110) #b01111111111111111111111111111110))))

(declare-fun b!1412062 () Bool)

(assert (=> b!1412062 (and (bvsge (index!45999 lt!622110) #b00000000000000000000000000000000) (bvslt (index!45999 lt!622110) (size!47144 lt!622054)))))

(declare-fun res!949210 () Bool)

(assert (=> b!1412062 (= res!949210 (= (select (arr!46594 lt!622054) (index!45999 lt!622110)) lt!622053))))

(assert (=> b!1412062 (=> res!949210 e!799078)))

(assert (=> b!1412062 (= e!799076 e!799078)))

(assert (= (and d!152015 c!130897) b!1412059))

(assert (= (and d!152015 (not c!130897)) b!1412058))

(assert (= (and b!1412058 c!130895) b!1412055))

(assert (= (and b!1412058 (not c!130895)) b!1412060))

(assert (= (and d!152015 c!130896) b!1412061))

(assert (= (and d!152015 (not c!130896)) b!1412054))

(assert (= (and b!1412054 res!949209) b!1412062))

(assert (= (and b!1412062 (not res!949210)) b!1412057))

(assert (= (and b!1412057 (not res!949208)) b!1412056))

(assert (=> d!152015 m!1302009))

(declare-fun m!1302095 () Bool)

(assert (=> d!152015 m!1302095))

(assert (=> d!152015 m!1301993))

(declare-fun m!1302097 () Bool)

(assert (=> b!1412056 m!1302097))

(assert (=> b!1412060 m!1302009))

(declare-fun m!1302099 () Bool)

(assert (=> b!1412060 m!1302099))

(assert (=> b!1412060 m!1302099))

(declare-fun m!1302101 () Bool)

(assert (=> b!1412060 m!1302101))

(assert (=> b!1412057 m!1302097))

(assert (=> b!1412062 m!1302097))

(assert (=> b!1411930 d!152015))

(declare-fun d!152037 () Bool)

(declare-fun lt!622119 () (_ BitVec 32))

(declare-fun lt!622118 () (_ BitVec 32))

(assert (=> d!152037 (= lt!622119 (bvmul (bvxor lt!622118 (bvlshr lt!622118 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152037 (= lt!622118 ((_ extract 31 0) (bvand (bvxor lt!622053 (bvlshr lt!622053 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152037 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!949211 (let ((h!34383 ((_ extract 31 0) (bvand (bvxor lt!622053 (bvlshr lt!622053 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127584 (bvmul (bvxor h!34383 (bvlshr h!34383 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127584 (bvlshr x!127584 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!949211 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!949211 #b00000000000000000000000000000000))))))

(assert (=> d!152037 (= (toIndex!0 lt!622053 mask!2840) (bvand (bvxor lt!622119 (bvlshr lt!622119 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411930 d!152037))

(declare-fun d!152039 () Bool)

(assert (=> d!152039 (= (validKeyInArray!0 (select (arr!46594 a!2901) j!112)) (and (not (= (select (arr!46594 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46594 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411935 d!152039))

(declare-fun d!152041 () Bool)

(declare-fun lt!622156 () SeekEntryResult!10905)

(assert (=> d!152041 (and (or (is-Undefined!10905 lt!622156) (not (is-Found!10905 lt!622156)) (and (bvsge (index!45998 lt!622156) #b00000000000000000000000000000000) (bvslt (index!45998 lt!622156) (size!47144 lt!622054)))) (or (is-Undefined!10905 lt!622156) (is-Found!10905 lt!622156) (not (is-MissingZero!10905 lt!622156)) (and (bvsge (index!45997 lt!622156) #b00000000000000000000000000000000) (bvslt (index!45997 lt!622156) (size!47144 lt!622054)))) (or (is-Undefined!10905 lt!622156) (is-Found!10905 lt!622156) (is-MissingZero!10905 lt!622156) (not (is-MissingVacant!10905 lt!622156)) (and (bvsge (index!46000 lt!622156) #b00000000000000000000000000000000) (bvslt (index!46000 lt!622156) (size!47144 lt!622054)))) (or (is-Undefined!10905 lt!622156) (ite (is-Found!10905 lt!622156) (= (select (arr!46594 lt!622054) (index!45998 lt!622156)) lt!622053) (ite (is-MissingZero!10905 lt!622156) (= (select (arr!46594 lt!622054) (index!45997 lt!622156)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10905 lt!622156) (= (select (arr!46594 lt!622054) (index!46000 lt!622156)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!799130 () SeekEntryResult!10905)

(assert (=> d!152041 (= lt!622156 e!799130)))

(declare-fun c!130930 () Bool)

(declare-fun lt!622155 () SeekEntryResult!10905)

(assert (=> d!152041 (= c!130930 (and (is-Intermediate!10905 lt!622155) (undefined!11717 lt!622155)))))

(assert (=> d!152041 (= lt!622155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622053 mask!2840) lt!622053 lt!622054 mask!2840))))

(assert (=> d!152041 (validMask!0 mask!2840)))

(assert (=> d!152041 (= (seekEntryOrOpen!0 lt!622053 lt!622054 mask!2840) lt!622156)))

(declare-fun b!1412148 () Bool)

(assert (=> b!1412148 (= e!799130 Undefined!10905)))

(declare-fun b!1412149 () Bool)

(declare-fun e!799131 () SeekEntryResult!10905)

(assert (=> b!1412149 (= e!799131 (seekKeyOrZeroReturnVacant!0 (x!127580 lt!622155) (index!45999 lt!622155) (index!45999 lt!622155) lt!622053 lt!622054 mask!2840))))

(declare-fun b!1412150 () Bool)

(declare-fun e!799129 () SeekEntryResult!10905)

(assert (=> b!1412150 (= e!799129 (Found!10905 (index!45999 lt!622155)))))

(declare-fun b!1412151 () Bool)

(assert (=> b!1412151 (= e!799130 e!799129)))

(declare-fun lt!622157 () (_ BitVec 64))

(assert (=> b!1412151 (= lt!622157 (select (arr!46594 lt!622054) (index!45999 lt!622155)))))

(declare-fun c!130929 () Bool)

(assert (=> b!1412151 (= c!130929 (= lt!622157 lt!622053))))

(declare-fun b!1412152 () Bool)

(declare-fun c!130931 () Bool)

(assert (=> b!1412152 (= c!130931 (= lt!622157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1412152 (= e!799129 e!799131)))

(declare-fun b!1412153 () Bool)

(assert (=> b!1412153 (= e!799131 (MissingZero!10905 (index!45999 lt!622155)))))

(assert (= (and d!152041 c!130930) b!1412148))

(assert (= (and d!152041 (not c!130930)) b!1412151))

(assert (= (and b!1412151 c!130929) b!1412150))

(assert (= (and b!1412151 (not c!130929)) b!1412152))

(assert (= (and b!1412152 c!130931) b!1412153))

(assert (= (and b!1412152 (not c!130931)) b!1412149))

(assert (=> d!152041 m!1302009))

(assert (=> d!152041 m!1302011))

(declare-fun m!1302141 () Bool)

(assert (=> d!152041 m!1302141))

(declare-fun m!1302143 () Bool)

(assert (=> d!152041 m!1302143))

(assert (=> d!152041 m!1302009))

(assert (=> d!152041 m!1301993))

(declare-fun m!1302145 () Bool)

(assert (=> d!152041 m!1302145))

(declare-fun m!1302147 () Bool)

(assert (=> b!1412149 m!1302147))

(declare-fun m!1302149 () Bool)

(assert (=> b!1412151 m!1302149))

(assert (=> b!1411934 d!152041))

(declare-fun e!799159 () SeekEntryResult!10905)

(declare-fun b!1412208 () Bool)

(assert (=> b!1412208 (= e!799159 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127580 lt!622052) #b00000000000000000000000000000001) (nextIndex!0 (index!45999 lt!622052) (x!127580 lt!622052) mask!2840) (index!45999 lt!622052) (select (arr!46594 a!2901) j!112) lt!622054 mask!2840))))

(declare-fun b!1412209 () Bool)

(declare-fun e!799161 () SeekEntryResult!10905)

(assert (=> b!1412209 (= e!799161 Undefined!10905)))

(declare-fun lt!622178 () SeekEntryResult!10905)

(declare-fun d!152059 () Bool)

(assert (=> d!152059 (and (or (is-Undefined!10905 lt!622178) (not (is-Found!10905 lt!622178)) (and (bvsge (index!45998 lt!622178) #b00000000000000000000000000000000) (bvslt (index!45998 lt!622178) (size!47144 lt!622054)))) (or (is-Undefined!10905 lt!622178) (is-Found!10905 lt!622178) (not (is-MissingVacant!10905 lt!622178)) (not (= (index!46000 lt!622178) (index!45999 lt!622052))) (and (bvsge (index!46000 lt!622178) #b00000000000000000000000000000000) (bvslt (index!46000 lt!622178) (size!47144 lt!622054)))) (or (is-Undefined!10905 lt!622178) (ite (is-Found!10905 lt!622178) (= (select (arr!46594 lt!622054) (index!45998 lt!622178)) (select (arr!46594 a!2901) j!112)) (and (is-MissingVacant!10905 lt!622178) (= (index!46000 lt!622178) (index!45999 lt!622052)) (= (select (arr!46594 lt!622054) (index!46000 lt!622178)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152059 (= lt!622178 e!799161)))

(declare-fun c!130961 () Bool)

(assert (=> d!152059 (= c!130961 (bvsge (x!127580 lt!622052) #b01111111111111111111111111111110))))

(declare-fun lt!622179 () (_ BitVec 64))

(assert (=> d!152059 (= lt!622179 (select (arr!46594 lt!622054) (index!45999 lt!622052)))))

(assert (=> d!152059 (validMask!0 mask!2840)))

(assert (=> d!152059 (= (seekKeyOrZeroReturnVacant!0 (x!127580 lt!622052) (index!45999 lt!622052) (index!45999 lt!622052) (select (arr!46594 a!2901) j!112) lt!622054 mask!2840) lt!622178)))

(declare-fun b!1412210 () Bool)

(declare-fun c!130959 () Bool)

(assert (=> b!1412210 (= c!130959 (= lt!622179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799160 () SeekEntryResult!10905)

(assert (=> b!1412210 (= e!799160 e!799159)))

(declare-fun b!1412211 () Bool)

(assert (=> b!1412211 (= e!799161 e!799160)))

(declare-fun c!130960 () Bool)

(assert (=> b!1412211 (= c!130960 (= lt!622179 (select (arr!46594 a!2901) j!112)))))

(declare-fun b!1412212 () Bool)

(assert (=> b!1412212 (= e!799160 (Found!10905 (index!45999 lt!622052)))))

(declare-fun b!1412213 () Bool)

(assert (=> b!1412213 (= e!799159 (MissingVacant!10905 (index!45999 lt!622052)))))

(assert (= (and d!152059 c!130961) b!1412209))

(assert (= (and d!152059 (not c!130961)) b!1412211))

(assert (= (and b!1412211 c!130960) b!1412212))

(assert (= (and b!1412211 (not c!130960)) b!1412210))

(assert (= (and b!1412210 c!130959) b!1412213))

(assert (= (and b!1412210 (not c!130959)) b!1412208))

(declare-fun m!1302183 () Bool)

(assert (=> b!1412208 m!1302183))

(assert (=> b!1412208 m!1302183))

(assert (=> b!1412208 m!1301987))

(declare-fun m!1302185 () Bool)

(assert (=> b!1412208 m!1302185))

(declare-fun m!1302187 () Bool)

(assert (=> d!152059 m!1302187))

(declare-fun m!1302189 () Bool)

(assert (=> d!152059 m!1302189))

(declare-fun m!1302191 () Bool)

(assert (=> d!152059 m!1302191))

(assert (=> d!152059 m!1301993))

(assert (=> b!1411934 d!152059))

(declare-fun d!152067 () Bool)

(assert (=> d!152067 (and (not (undefined!11717 lt!622052)) (= (index!45999 lt!622052) i!1037) (bvslt (x!127580 lt!622052) (x!127580 lt!622050)))))

(declare-fun lt!622187 () Unit!47784)

(declare-fun choose!62 (array!96511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47784)

(assert (=> d!152067 (= lt!622187 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622051 (x!127580 lt!622050) (index!45999 lt!622050) (x!127580 lt!622052) (index!45999 lt!622052) (undefined!11717 lt!622052) mask!2840))))

(assert (=> d!152067 (validMask!0 mask!2840)))

(assert (=> d!152067 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622051 (x!127580 lt!622050) (index!45999 lt!622050) (x!127580 lt!622052) (index!45999 lt!622052) (undefined!11717 lt!622052) mask!2840) lt!622187)))

(declare-fun bs!41171 () Bool)

(assert (= bs!41171 d!152067))

(declare-fun m!1302205 () Bool)

(assert (=> bs!41171 m!1302205))

(assert (=> bs!41171 m!1301993))

(assert (=> b!1411934 d!152067))

(declare-fun d!152073 () Bool)

(assert (=> d!152073 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121510 d!152073))

(declare-fun d!152077 () Bool)

(assert (=> d!152077 (= (array_inv!35622 a!2901) (bvsge (size!47144 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121510 d!152077))

(declare-fun d!152079 () Bool)

(declare-fun res!949249 () Bool)

(declare-fun e!799184 () Bool)

(assert (=> d!152079 (=> res!949249 e!799184)))

(assert (=> d!152079 (= res!949249 (bvsge #b00000000000000000000000000000000 (size!47144 a!2901)))))

(assert (=> d!152079 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!799184)))

(declare-fun b!1412243 () Bool)

(declare-fun e!799183 () Bool)

(declare-fun call!67095 () Bool)

(assert (=> b!1412243 (= e!799183 call!67095)))

(declare-fun b!1412244 () Bool)

(declare-fun e!799185 () Bool)

(assert (=> b!1412244 (= e!799185 e!799183)))

(declare-fun lt!622199 () (_ BitVec 64))

(assert (=> b!1412244 (= lt!622199 (select (arr!46594 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!622197 () Unit!47784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96511 (_ BitVec 64) (_ BitVec 32)) Unit!47784)

(assert (=> b!1412244 (= lt!622197 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622199 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1412244 (arrayContainsKey!0 a!2901 lt!622199 #b00000000000000000000000000000000)))

(declare-fun lt!622198 () Unit!47784)

(assert (=> b!1412244 (= lt!622198 lt!622197)))

(declare-fun res!949250 () Bool)

(assert (=> b!1412244 (= res!949250 (= (seekEntryOrOpen!0 (select (arr!46594 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10905 #b00000000000000000000000000000000)))))

(assert (=> b!1412244 (=> (not res!949250) (not e!799183))))

(declare-fun b!1412245 () Bool)

(assert (=> b!1412245 (= e!799184 e!799185)))

(declare-fun c!130970 () Bool)

(assert (=> b!1412245 (= c!130970 (validKeyInArray!0 (select (arr!46594 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1412246 () Bool)

(assert (=> b!1412246 (= e!799185 call!67095)))

(declare-fun bm!67092 () Bool)

(assert (=> bm!67092 (= call!67095 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152079 (not res!949249)) b!1412245))

(assert (= (and b!1412245 c!130970) b!1412244))

(assert (= (and b!1412245 (not c!130970)) b!1412246))

(assert (= (and b!1412244 res!949250) b!1412243))

(assert (= (or b!1412243 b!1412246) bm!67092))

(assert (=> b!1412244 m!1302035))

(declare-fun m!1302213 () Bool)

(assert (=> b!1412244 m!1302213))

(declare-fun m!1302215 () Bool)

(assert (=> b!1412244 m!1302215))

(assert (=> b!1412244 m!1302035))

(declare-fun m!1302217 () Bool)

(assert (=> b!1412244 m!1302217))

(assert (=> b!1412245 m!1302035))

(assert (=> b!1412245 m!1302035))

(assert (=> b!1412245 m!1302039))

(declare-fun m!1302219 () Bool)

(assert (=> bm!67092 m!1302219))

(assert (=> b!1411938 d!152079))

(declare-fun d!152083 () Bool)

(declare-fun lt!622201 () SeekEntryResult!10905)

(assert (=> d!152083 (and (or (is-Undefined!10905 lt!622201) (not (is-Found!10905 lt!622201)) (and (bvsge (index!45998 lt!622201) #b00000000000000000000000000000000) (bvslt (index!45998 lt!622201) (size!47144 a!2901)))) (or (is-Undefined!10905 lt!622201) (is-Found!10905 lt!622201) (not (is-MissingZero!10905 lt!622201)) (and (bvsge (index!45997 lt!622201) #b00000000000000000000000000000000) (bvslt (index!45997 lt!622201) (size!47144 a!2901)))) (or (is-Undefined!10905 lt!622201) (is-Found!10905 lt!622201) (is-MissingZero!10905 lt!622201) (not (is-MissingVacant!10905 lt!622201)) (and (bvsge (index!46000 lt!622201) #b00000000000000000000000000000000) (bvslt (index!46000 lt!622201) (size!47144 a!2901)))) (or (is-Undefined!10905 lt!622201) (ite (is-Found!10905 lt!622201) (= (select (arr!46594 a!2901) (index!45998 lt!622201)) (select (arr!46594 a!2901) j!112)) (ite (is-MissingZero!10905 lt!622201) (= (select (arr!46594 a!2901) (index!45997 lt!622201)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10905 lt!622201) (= (select (arr!46594 a!2901) (index!46000 lt!622201)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!799187 () SeekEntryResult!10905)

(assert (=> d!152083 (= lt!622201 e!799187)))

(declare-fun c!130972 () Bool)

(declare-fun lt!622200 () SeekEntryResult!10905)

(assert (=> d!152083 (= c!130972 (and (is-Intermediate!10905 lt!622200) (undefined!11717 lt!622200)))))

(assert (=> d!152083 (= lt!622200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46594 a!2901) j!112) mask!2840) (select (arr!46594 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152083 (validMask!0 mask!2840)))

(assert (=> d!152083 (= (seekEntryOrOpen!0 (select (arr!46594 a!2901) j!112) a!2901 mask!2840) lt!622201)))

(declare-fun b!1412247 () Bool)

(assert (=> b!1412247 (= e!799187 Undefined!10905)))

(declare-fun b!1412248 () Bool)

(declare-fun e!799188 () SeekEntryResult!10905)

(assert (=> b!1412248 (= e!799188 (seekKeyOrZeroReturnVacant!0 (x!127580 lt!622200) (index!45999 lt!622200) (index!45999 lt!622200) (select (arr!46594 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1412249 () Bool)

(declare-fun e!799186 () SeekEntryResult!10905)

(assert (=> b!1412249 (= e!799186 (Found!10905 (index!45999 lt!622200)))))

(declare-fun b!1412250 () Bool)

(assert (=> b!1412250 (= e!799187 e!799186)))

(declare-fun lt!622202 () (_ BitVec 64))

(assert (=> b!1412250 (= lt!622202 (select (arr!46594 a!2901) (index!45999 lt!622200)))))

(declare-fun c!130971 () Bool)

(assert (=> b!1412250 (= c!130971 (= lt!622202 (select (arr!46594 a!2901) j!112)))))

(declare-fun b!1412251 () Bool)

(declare-fun c!130973 () Bool)

(assert (=> b!1412251 (= c!130973 (= lt!622202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1412251 (= e!799186 e!799188)))

(declare-fun b!1412252 () Bool)

(assert (=> b!1412252 (= e!799188 (MissingZero!10905 (index!45999 lt!622200)))))

(assert (= (and d!152083 c!130972) b!1412247))

(assert (= (and d!152083 (not c!130972)) b!1412250))

(assert (= (and b!1412250 c!130971) b!1412249))

(assert (= (and b!1412250 (not c!130971)) b!1412251))

(assert (= (and b!1412251 c!130973) b!1412252))

(assert (= (and b!1412251 (not c!130973)) b!1412248))

(assert (=> d!152083 m!1302021))

(assert (=> d!152083 m!1301987))

(declare-fun m!1302221 () Bool)

(assert (=> d!152083 m!1302221))

(declare-fun m!1302223 () Bool)

(assert (=> d!152083 m!1302223))

(declare-fun m!1302225 () Bool)

(assert (=> d!152083 m!1302225))

(assert (=> d!152083 m!1301987))

(assert (=> d!152083 m!1302021))

(assert (=> d!152083 m!1301993))

(declare-fun m!1302227 () Bool)

(assert (=> d!152083 m!1302227))

(assert (=> b!1412248 m!1301987))

(declare-fun m!1302229 () Bool)

(assert (=> b!1412248 m!1302229))

(declare-fun m!1302231 () Bool)

(assert (=> b!1412250 m!1302231))

(assert (=> b!1411933 d!152083))

(declare-fun d!152085 () Bool)

(declare-fun res!949251 () Bool)

(declare-fun e!799190 () Bool)

(assert (=> d!152085 (=> res!949251 e!799190)))

(assert (=> d!152085 (= res!949251 (bvsge j!112 (size!47144 a!2901)))))

(assert (=> d!152085 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!799190)))

(declare-fun b!1412253 () Bool)

(declare-fun e!799189 () Bool)

(declare-fun call!67096 () Bool)

(assert (=> b!1412253 (= e!799189 call!67096)))

(declare-fun b!1412254 () Bool)

(declare-fun e!799191 () Bool)

(assert (=> b!1412254 (= e!799191 e!799189)))

(declare-fun lt!622205 () (_ BitVec 64))

(assert (=> b!1412254 (= lt!622205 (select (arr!46594 a!2901) j!112))))

(declare-fun lt!622203 () Unit!47784)

(assert (=> b!1412254 (= lt!622203 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622205 j!112))))

(assert (=> b!1412254 (arrayContainsKey!0 a!2901 lt!622205 #b00000000000000000000000000000000)))

(declare-fun lt!622204 () Unit!47784)

(assert (=> b!1412254 (= lt!622204 lt!622203)))

(declare-fun res!949252 () Bool)

(assert (=> b!1412254 (= res!949252 (= (seekEntryOrOpen!0 (select (arr!46594 a!2901) j!112) a!2901 mask!2840) (Found!10905 j!112)))))

(assert (=> b!1412254 (=> (not res!949252) (not e!799189))))

(declare-fun b!1412255 () Bool)

(assert (=> b!1412255 (= e!799190 e!799191)))

(declare-fun c!130974 () Bool)

(assert (=> b!1412255 (= c!130974 (validKeyInArray!0 (select (arr!46594 a!2901) j!112)))))

(declare-fun b!1412256 () Bool)

(assert (=> b!1412256 (= e!799191 call!67096)))

(declare-fun bm!67093 () Bool)

(assert (=> bm!67093 (= call!67096 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152085 (not res!949251)) b!1412255))

(assert (= (and b!1412255 c!130974) b!1412254))

(assert (= (and b!1412255 (not c!130974)) b!1412256))

(assert (= (and b!1412254 res!949252) b!1412253))

(assert (= (or b!1412253 b!1412256) bm!67093))

(assert (=> b!1412254 m!1301987))

(declare-fun m!1302233 () Bool)

(assert (=> b!1412254 m!1302233))

(declare-fun m!1302235 () Bool)

(assert (=> b!1412254 m!1302235))

(assert (=> b!1412254 m!1301987))

(assert (=> b!1412254 m!1301989))

(assert (=> b!1412255 m!1301987))

(assert (=> b!1412255 m!1301987))

(assert (=> b!1412255 m!1301991))

(declare-fun m!1302237 () Bool)

(assert (=> bm!67093 m!1302237))

(assert (=> b!1411932 d!152085))

(declare-fun d!152087 () Bool)

(assert (=> d!152087 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!622208 () Unit!47784)

(declare-fun choose!38 (array!96511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47784)

