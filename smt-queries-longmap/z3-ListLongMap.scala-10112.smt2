; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119168 () Bool)

(assert start!119168)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95105 0))(
  ( (array!95106 (arr!45918 (Array (_ BitVec 32) (_ BitVec 64))) (size!46468 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95105)

(declare-fun b!1390140 () Bool)

(declare-fun e!787291 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10235 0))(
  ( (MissingZero!10235 (index!43311 (_ BitVec 32))) (Found!10235 (index!43312 (_ BitVec 32))) (Intermediate!10235 (undefined!11047 Bool) (index!43313 (_ BitVec 32)) (x!124993 (_ BitVec 32))) (Undefined!10235) (MissingVacant!10235 (index!43314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95105 (_ BitVec 32)) SeekEntryResult!10235)

(assert (=> b!1390140 (= e!787291 (= (seekEntryOrOpen!0 (select (arr!45918 a!2901) j!112) a!2901 mask!2840) (Found!10235 j!112)))))

(declare-fun b!1390141 () Bool)

(declare-fun res!930307 () Bool)

(declare-fun e!787290 () Bool)

(assert (=> b!1390141 (=> (not res!930307) (not e!787290))))

(declare-datatypes ((List!32437 0))(
  ( (Nil!32434) (Cons!32433 (h!33651 (_ BitVec 64)) (t!47131 List!32437)) )
))
(declare-fun arrayNoDuplicates!0 (array!95105 (_ BitVec 32) List!32437) Bool)

(assert (=> b!1390141 (= res!930307 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32434))))

(declare-fun b!1390142 () Bool)

(assert (=> b!1390142 (= e!787290 (not true))))

(assert (=> b!1390142 e!787291))

(declare-fun res!930301 () Bool)

(assert (=> b!1390142 (=> (not res!930301) (not e!787291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95105 (_ BitVec 32)) Bool)

(assert (=> b!1390142 (= res!930301 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46474 0))(
  ( (Unit!46475) )
))
(declare-fun lt!610739 () Unit!46474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46474)

(assert (=> b!1390142 (= lt!610739 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610740 () SeekEntryResult!10235)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95105 (_ BitVec 32)) SeekEntryResult!10235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390142 (= lt!610740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45918 a!2901) j!112) mask!2840) (select (arr!45918 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390143 () Bool)

(declare-fun res!930305 () Bool)

(assert (=> b!1390143 (=> (not res!930305) (not e!787290))))

(assert (=> b!1390143 (= res!930305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390144 () Bool)

(declare-fun res!930303 () Bool)

(assert (=> b!1390144 (=> (not res!930303) (not e!787290))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390144 (= res!930303 (validKeyInArray!0 (select (arr!45918 a!2901) i!1037)))))

(declare-fun b!1390145 () Bool)

(declare-fun res!930304 () Bool)

(assert (=> b!1390145 (=> (not res!930304) (not e!787290))))

(assert (=> b!1390145 (= res!930304 (validKeyInArray!0 (select (arr!45918 a!2901) j!112)))))

(declare-fun res!930302 () Bool)

(assert (=> start!119168 (=> (not res!930302) (not e!787290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119168 (= res!930302 (validMask!0 mask!2840))))

(assert (=> start!119168 e!787290))

(assert (=> start!119168 true))

(declare-fun array_inv!34946 (array!95105) Bool)

(assert (=> start!119168 (array_inv!34946 a!2901)))

(declare-fun b!1390146 () Bool)

(declare-fun res!930306 () Bool)

(assert (=> b!1390146 (=> (not res!930306) (not e!787290))))

(assert (=> b!1390146 (= res!930306 (and (= (size!46468 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46468 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46468 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119168 res!930302) b!1390146))

(assert (= (and b!1390146 res!930306) b!1390144))

(assert (= (and b!1390144 res!930303) b!1390145))

(assert (= (and b!1390145 res!930304) b!1390143))

(assert (= (and b!1390143 res!930305) b!1390141))

(assert (= (and b!1390141 res!930307) b!1390142))

(assert (= (and b!1390142 res!930301) b!1390140))

(declare-fun m!1275917 () Bool)

(assert (=> start!119168 m!1275917))

(declare-fun m!1275919 () Bool)

(assert (=> start!119168 m!1275919))

(declare-fun m!1275921 () Bool)

(assert (=> b!1390144 m!1275921))

(assert (=> b!1390144 m!1275921))

(declare-fun m!1275923 () Bool)

(assert (=> b!1390144 m!1275923))

(declare-fun m!1275925 () Bool)

(assert (=> b!1390143 m!1275925))

(declare-fun m!1275927 () Bool)

(assert (=> b!1390140 m!1275927))

(assert (=> b!1390140 m!1275927))

(declare-fun m!1275929 () Bool)

(assert (=> b!1390140 m!1275929))

(assert (=> b!1390145 m!1275927))

(assert (=> b!1390145 m!1275927))

(declare-fun m!1275931 () Bool)

(assert (=> b!1390145 m!1275931))

(assert (=> b!1390142 m!1275927))

(declare-fun m!1275933 () Bool)

(assert (=> b!1390142 m!1275933))

(assert (=> b!1390142 m!1275927))

(declare-fun m!1275935 () Bool)

(assert (=> b!1390142 m!1275935))

(assert (=> b!1390142 m!1275933))

(assert (=> b!1390142 m!1275927))

(declare-fun m!1275937 () Bool)

(assert (=> b!1390142 m!1275937))

(declare-fun m!1275939 () Bool)

(assert (=> b!1390142 m!1275939))

(declare-fun m!1275941 () Bool)

(assert (=> b!1390141 m!1275941))

(check-sat (not b!1390140) (not b!1390143) (not b!1390142) (not start!119168) (not b!1390144) (not b!1390145) (not b!1390141))
