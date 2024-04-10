; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121202 () Bool)

(assert start!121202)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96356 0))(
  ( (array!96357 (arr!46521 (Array (_ BitVec 32) (_ BitVec 64))) (size!47071 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96356)

(declare-fun b!1409270 () Bool)

(declare-fun e!797513 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10832 0))(
  ( (MissingZero!10832 (index!45705 (_ BitVec 32))) (Found!10832 (index!45706 (_ BitVec 32))) (Intermediate!10832 (undefined!11644 Bool) (index!45707 (_ BitVec 32)) (x!127297 (_ BitVec 32))) (Undefined!10832) (MissingVacant!10832 (index!45708 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96356 (_ BitVec 32)) SeekEntryResult!10832)

(assert (=> b!1409270 (= e!797513 (= (seekEntryOrOpen!0 (select (arr!46521 a!2901) j!112) a!2901 mask!2840) (Found!10832 j!112)))))

(declare-fun b!1409271 () Bool)

(declare-fun res!946993 () Bool)

(declare-fun e!797511 () Bool)

(assert (=> b!1409271 (=> (not res!946993) (not e!797511))))

(declare-datatypes ((List!33040 0))(
  ( (Nil!33037) (Cons!33036 (h!34299 (_ BitVec 64)) (t!47734 List!33040)) )
))
(declare-fun arrayNoDuplicates!0 (array!96356 (_ BitVec 32) List!33040) Bool)

(assert (=> b!1409271 (= res!946993 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33037))))

(declare-fun res!946996 () Bool)

(assert (=> start!121202 (=> (not res!946996) (not e!797511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121202 (= res!946996 (validMask!0 mask!2840))))

(assert (=> start!121202 e!797511))

(assert (=> start!121202 true))

(declare-fun array_inv!35549 (array!96356) Bool)

(assert (=> start!121202 (array_inv!35549 a!2901)))

(declare-fun b!1409272 () Bool)

(declare-fun e!797512 () Bool)

(assert (=> b!1409272 (= e!797511 (not e!797512))))

(declare-fun res!946999 () Bool)

(assert (=> b!1409272 (=> res!946999 e!797512)))

(declare-fun lt!620659 () SeekEntryResult!10832)

(get-info :version)

(assert (=> b!1409272 (= res!946999 (or (not ((_ is Intermediate!10832) lt!620659)) (undefined!11644 lt!620659)))))

(assert (=> b!1409272 e!797513))

(declare-fun res!946998 () Bool)

(assert (=> b!1409272 (=> (not res!946998) (not e!797513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96356 (_ BitVec 32)) Bool)

(assert (=> b!1409272 (= res!946998 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47638 0))(
  ( (Unit!47639) )
))
(declare-fun lt!620660 () Unit!47638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47638)

(assert (=> b!1409272 (= lt!620660 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96356 (_ BitVec 32)) SeekEntryResult!10832)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409272 (= lt!620659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46521 a!2901) j!112) mask!2840) (select (arr!46521 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409273 () Bool)

(assert (=> b!1409273 (= e!797512 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620661 () SeekEntryResult!10832)

(assert (=> b!1409273 (= lt!620661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46521 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46521 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96357 (store (arr!46521 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901)) mask!2840))))

(declare-fun b!1409274 () Bool)

(declare-fun res!946995 () Bool)

(assert (=> b!1409274 (=> (not res!946995) (not e!797511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409274 (= res!946995 (validKeyInArray!0 (select (arr!46521 a!2901) j!112)))))

(declare-fun b!1409275 () Bool)

(declare-fun res!946992 () Bool)

(assert (=> b!1409275 (=> (not res!946992) (not e!797511))))

(assert (=> b!1409275 (= res!946992 (and (= (size!47071 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47071 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47071 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409276 () Bool)

(declare-fun res!946994 () Bool)

(assert (=> b!1409276 (=> (not res!946994) (not e!797511))))

(assert (=> b!1409276 (= res!946994 (validKeyInArray!0 (select (arr!46521 a!2901) i!1037)))))

(declare-fun b!1409277 () Bool)

(declare-fun res!946997 () Bool)

(assert (=> b!1409277 (=> (not res!946997) (not e!797511))))

(assert (=> b!1409277 (= res!946997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121202 res!946996) b!1409275))

(assert (= (and b!1409275 res!946992) b!1409276))

(assert (= (and b!1409276 res!946994) b!1409274))

(assert (= (and b!1409274 res!946995) b!1409277))

(assert (= (and b!1409277 res!946997) b!1409271))

(assert (= (and b!1409271 res!946993) b!1409272))

(assert (= (and b!1409272 res!946998) b!1409270))

(assert (= (and b!1409272 (not res!946999)) b!1409273))

(declare-fun m!1298917 () Bool)

(assert (=> b!1409276 m!1298917))

(assert (=> b!1409276 m!1298917))

(declare-fun m!1298919 () Bool)

(assert (=> b!1409276 m!1298919))

(declare-fun m!1298921 () Bool)

(assert (=> start!121202 m!1298921))

(declare-fun m!1298923 () Bool)

(assert (=> start!121202 m!1298923))

(declare-fun m!1298925 () Bool)

(assert (=> b!1409270 m!1298925))

(assert (=> b!1409270 m!1298925))

(declare-fun m!1298927 () Bool)

(assert (=> b!1409270 m!1298927))

(declare-fun m!1298929 () Bool)

(assert (=> b!1409271 m!1298929))

(assert (=> b!1409274 m!1298925))

(assert (=> b!1409274 m!1298925))

(declare-fun m!1298931 () Bool)

(assert (=> b!1409274 m!1298931))

(declare-fun m!1298933 () Bool)

(assert (=> b!1409277 m!1298933))

(assert (=> b!1409272 m!1298925))

(declare-fun m!1298935 () Bool)

(assert (=> b!1409272 m!1298935))

(assert (=> b!1409272 m!1298925))

(declare-fun m!1298937 () Bool)

(assert (=> b!1409272 m!1298937))

(assert (=> b!1409272 m!1298935))

(assert (=> b!1409272 m!1298925))

(declare-fun m!1298939 () Bool)

(assert (=> b!1409272 m!1298939))

(declare-fun m!1298941 () Bool)

(assert (=> b!1409272 m!1298941))

(declare-fun m!1298943 () Bool)

(assert (=> b!1409273 m!1298943))

(declare-fun m!1298945 () Bool)

(assert (=> b!1409273 m!1298945))

(assert (=> b!1409273 m!1298945))

(declare-fun m!1298947 () Bool)

(assert (=> b!1409273 m!1298947))

(assert (=> b!1409273 m!1298947))

(assert (=> b!1409273 m!1298945))

(declare-fun m!1298949 () Bool)

(assert (=> b!1409273 m!1298949))

(check-sat (not b!1409277) (not b!1409271) (not b!1409273) (not b!1409272) (not b!1409276) (not start!121202) (not b!1409270) (not b!1409274))
