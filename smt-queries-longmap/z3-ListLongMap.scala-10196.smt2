; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120098 () Bool)

(assert start!120098)

(declare-fun b!1398265 () Bool)

(declare-fun res!937233 () Bool)

(declare-fun e!791600 () Bool)

(assert (=> b!1398265 (=> (not res!937233) (not e!791600))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95580 0))(
  ( (array!95581 (arr!46144 (Array (_ BitVec 32) (_ BitVec 64))) (size!46696 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95580)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398265 (= res!937233 (and (= (size!46696 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46696 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46696 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!937235 () Bool)

(assert (=> start!120098 (=> (not res!937235) (not e!791600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120098 (= res!937235 (validMask!0 mask!2840))))

(assert (=> start!120098 e!791600))

(assert (=> start!120098 true))

(declare-fun array_inv!35377 (array!95580) Bool)

(assert (=> start!120098 (array_inv!35377 a!2901)))

(declare-fun b!1398266 () Bool)

(declare-fun res!937236 () Bool)

(assert (=> b!1398266 (=> (not res!937236) (not e!791600))))

(declare-datatypes ((List!32741 0))(
  ( (Nil!32738) (Cons!32737 (h!33979 (_ BitVec 64)) (t!47427 List!32741)) )
))
(declare-fun arrayNoDuplicates!0 (array!95580 (_ BitVec 32) List!32741) Bool)

(assert (=> b!1398266 (= res!937236 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32738))))

(declare-fun b!1398267 () Bool)

(declare-fun res!937230 () Bool)

(assert (=> b!1398267 (=> (not res!937230) (not e!791600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95580 (_ BitVec 32)) Bool)

(assert (=> b!1398267 (= res!937230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398268 () Bool)

(declare-fun e!791602 () Bool)

(declare-fun e!791599 () Bool)

(assert (=> b!1398268 (= e!791602 e!791599)))

(declare-fun res!937229 () Bool)

(assert (=> b!1398268 (=> res!937229 e!791599)))

(declare-datatypes ((SeekEntryResult!10487 0))(
  ( (MissingZero!10487 (index!44319 (_ BitVec 32))) (Found!10487 (index!44320 (_ BitVec 32))) (Intermediate!10487 (undefined!11299 Bool) (index!44321 (_ BitVec 32)) (x!125962 (_ BitVec 32))) (Undefined!10487) (MissingVacant!10487 (index!44322 (_ BitVec 32))) )
))
(declare-fun lt!614675 () SeekEntryResult!10487)

(declare-fun lt!614678 () SeekEntryResult!10487)

(get-info :version)

(assert (=> b!1398268 (= res!937229 (or (= lt!614675 lt!614678) (not ((_ is Intermediate!10487) lt!614678))))))

(declare-fun lt!614674 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95580 (_ BitVec 32)) SeekEntryResult!10487)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398268 (= lt!614678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614674 mask!2840) lt!614674 (array!95581 (store (arr!46144 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46696 a!2901)) mask!2840))))

(assert (=> b!1398268 (= lt!614674 (select (store (arr!46144 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398269 () Bool)

(declare-fun res!937237 () Bool)

(assert (=> b!1398269 (=> (not res!937237) (not e!791600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398269 (= res!937237 (validKeyInArray!0 (select (arr!46144 a!2901) i!1037)))))

(declare-fun b!1398270 () Bool)

(assert (=> b!1398270 (= e!791599 true)))

(assert (=> b!1398270 (and (not (undefined!11299 lt!614678)) (= (index!44321 lt!614678) i!1037) (bvslt (x!125962 lt!614678) (x!125962 lt!614675)) (= (select (store (arr!46144 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44321 lt!614678)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614677 () (_ BitVec 32))

(declare-datatypes ((Unit!46821 0))(
  ( (Unit!46822) )
))
(declare-fun lt!614676 () Unit!46821)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46821)

(assert (=> b!1398270 (= lt!614676 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614677 (x!125962 lt!614675) (index!44321 lt!614675) (x!125962 lt!614678) (index!44321 lt!614678) (undefined!11299 lt!614678) mask!2840))))

(declare-fun b!1398271 () Bool)

(assert (=> b!1398271 (= e!791600 (not e!791602))))

(declare-fun res!937232 () Bool)

(assert (=> b!1398271 (=> res!937232 e!791602)))

(assert (=> b!1398271 (= res!937232 (or (not ((_ is Intermediate!10487) lt!614675)) (undefined!11299 lt!614675)))))

(declare-fun e!791601 () Bool)

(assert (=> b!1398271 e!791601))

(declare-fun res!937234 () Bool)

(assert (=> b!1398271 (=> (not res!937234) (not e!791601))))

(assert (=> b!1398271 (= res!937234 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614673 () Unit!46821)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46821)

(assert (=> b!1398271 (= lt!614673 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398271 (= lt!614675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614677 (select (arr!46144 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398271 (= lt!614677 (toIndex!0 (select (arr!46144 a!2901) j!112) mask!2840))))

(declare-fun b!1398272 () Bool)

(declare-fun res!937231 () Bool)

(assert (=> b!1398272 (=> (not res!937231) (not e!791600))))

(assert (=> b!1398272 (= res!937231 (validKeyInArray!0 (select (arr!46144 a!2901) j!112)))))

(declare-fun b!1398273 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95580 (_ BitVec 32)) SeekEntryResult!10487)

(assert (=> b!1398273 (= e!791601 (= (seekEntryOrOpen!0 (select (arr!46144 a!2901) j!112) a!2901 mask!2840) (Found!10487 j!112)))))

(assert (= (and start!120098 res!937235) b!1398265))

(assert (= (and b!1398265 res!937233) b!1398269))

(assert (= (and b!1398269 res!937237) b!1398272))

(assert (= (and b!1398272 res!937231) b!1398267))

(assert (= (and b!1398267 res!937230) b!1398266))

(assert (= (and b!1398266 res!937236) b!1398271))

(assert (= (and b!1398271 res!937234) b!1398273))

(assert (= (and b!1398271 (not res!937232)) b!1398268))

(assert (= (and b!1398268 (not res!937229)) b!1398270))

(declare-fun m!1284901 () Bool)

(assert (=> b!1398272 m!1284901))

(assert (=> b!1398272 m!1284901))

(declare-fun m!1284903 () Bool)

(assert (=> b!1398272 m!1284903))

(assert (=> b!1398273 m!1284901))

(assert (=> b!1398273 m!1284901))

(declare-fun m!1284905 () Bool)

(assert (=> b!1398273 m!1284905))

(declare-fun m!1284907 () Bool)

(assert (=> b!1398270 m!1284907))

(declare-fun m!1284909 () Bool)

(assert (=> b!1398270 m!1284909))

(declare-fun m!1284911 () Bool)

(assert (=> b!1398270 m!1284911))

(declare-fun m!1284913 () Bool)

(assert (=> b!1398269 m!1284913))

(assert (=> b!1398269 m!1284913))

(declare-fun m!1284915 () Bool)

(assert (=> b!1398269 m!1284915))

(declare-fun m!1284917 () Bool)

(assert (=> b!1398267 m!1284917))

(declare-fun m!1284919 () Bool)

(assert (=> b!1398268 m!1284919))

(assert (=> b!1398268 m!1284907))

(assert (=> b!1398268 m!1284919))

(declare-fun m!1284921 () Bool)

(assert (=> b!1398268 m!1284921))

(declare-fun m!1284923 () Bool)

(assert (=> b!1398268 m!1284923))

(declare-fun m!1284925 () Bool)

(assert (=> b!1398266 m!1284925))

(assert (=> b!1398271 m!1284901))

(declare-fun m!1284927 () Bool)

(assert (=> b!1398271 m!1284927))

(assert (=> b!1398271 m!1284901))

(declare-fun m!1284929 () Bool)

(assert (=> b!1398271 m!1284929))

(assert (=> b!1398271 m!1284901))

(declare-fun m!1284931 () Bool)

(assert (=> b!1398271 m!1284931))

(declare-fun m!1284933 () Bool)

(assert (=> b!1398271 m!1284933))

(declare-fun m!1284935 () Bool)

(assert (=> start!120098 m!1284935))

(declare-fun m!1284937 () Bool)

(assert (=> start!120098 m!1284937))

(check-sat (not b!1398271) (not start!120098) (not b!1398266) (not b!1398272) (not b!1398268) (not b!1398267) (not b!1398270) (not b!1398269) (not b!1398273))
(check-sat)
