; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120476 () Bool)

(assert start!120476)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95807 0))(
  ( (array!95808 (arr!46252 (Array (_ BitVec 32) (_ BitVec 64))) (size!46803 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95807)

(declare-fun b!1400900 () Bool)

(declare-fun e!793205 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10472 0))(
  ( (MissingZero!10472 (index!44265 (_ BitVec 32))) (Found!10472 (index!44266 (_ BitVec 32))) (Intermediate!10472 (undefined!11284 Bool) (index!44267 (_ BitVec 32)) (x!126070 (_ BitVec 32))) (Undefined!10472) (MissingVacant!10472 (index!44268 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95807 (_ BitVec 32)) SeekEntryResult!10472)

(assert (=> b!1400900 (= e!793205 (= (seekEntryOrOpen!0 (select (arr!46252 a!2901) j!112) a!2901 mask!2840) (Found!10472 j!112)))))

(declare-fun b!1400901 () Bool)

(declare-fun res!938732 () Bool)

(declare-fun e!793204 () Bool)

(assert (=> b!1400901 (=> (not res!938732) (not e!793204))))

(declare-datatypes ((List!32758 0))(
  ( (Nil!32755) (Cons!32754 (h!34010 (_ BitVec 64)) (t!47444 List!32758)) )
))
(declare-fun arrayNoDuplicates!0 (array!95807 (_ BitVec 32) List!32758) Bool)

(assert (=> b!1400901 (= res!938732 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32755))))

(declare-fun b!1400902 () Bool)

(declare-fun e!793207 () Bool)

(declare-fun e!793206 () Bool)

(assert (=> b!1400902 (= e!793207 e!793206)))

(declare-fun res!938733 () Bool)

(assert (=> b!1400902 (=> res!938733 e!793206)))

(declare-fun lt!616111 () SeekEntryResult!10472)

(declare-fun lt!616113 () SeekEntryResult!10472)

(get-info :version)

(assert (=> b!1400902 (= res!938733 (or (= lt!616111 lt!616113) (not ((_ is Intermediate!10472) lt!616113))))))

(declare-fun lt!616108 () (_ BitVec 64))

(declare-fun lt!616114 () array!95807)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95807 (_ BitVec 32)) SeekEntryResult!10472)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400902 (= lt!616113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616108 mask!2840) lt!616108 lt!616114 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400902 (= lt!616108 (select (store (arr!46252 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400902 (= lt!616114 (array!95808 (store (arr!46252 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46803 a!2901)))))

(declare-fun b!1400903 () Bool)

(declare-fun e!793203 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95807 (_ BitVec 32)) SeekEntryResult!10472)

(assert (=> b!1400903 (= e!793203 (= (seekEntryOrOpen!0 lt!616108 lt!616114 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126070 lt!616113) (index!44267 lt!616113) (index!44267 lt!616113) (select (arr!46252 a!2901) j!112) lt!616114 mask!2840)))))

(declare-fun b!1400904 () Bool)

(declare-fun res!938736 () Bool)

(assert (=> b!1400904 (=> (not res!938736) (not e!793204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400904 (= res!938736 (validKeyInArray!0 (select (arr!46252 a!2901) j!112)))))

(declare-fun b!1400905 () Bool)

(declare-fun res!938730 () Bool)

(assert (=> b!1400905 (=> (not res!938730) (not e!793204))))

(assert (=> b!1400905 (= res!938730 (validKeyInArray!0 (select (arr!46252 a!2901) i!1037)))))

(declare-fun b!1400906 () Bool)

(assert (=> b!1400906 (= e!793204 (not e!793207))))

(declare-fun res!938731 () Bool)

(assert (=> b!1400906 (=> res!938731 e!793207)))

(assert (=> b!1400906 (= res!938731 (or (not ((_ is Intermediate!10472) lt!616111)) (undefined!11284 lt!616111)))))

(assert (=> b!1400906 e!793205))

(declare-fun res!938737 () Bool)

(assert (=> b!1400906 (=> (not res!938737) (not e!793205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95807 (_ BitVec 32)) Bool)

(assert (=> b!1400906 (= res!938737 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46975 0))(
  ( (Unit!46976) )
))
(declare-fun lt!616110 () Unit!46975)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46975)

(assert (=> b!1400906 (= lt!616110 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616109 () (_ BitVec 32))

(assert (=> b!1400906 (= lt!616111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616109 (select (arr!46252 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400906 (= lt!616109 (toIndex!0 (select (arr!46252 a!2901) j!112) mask!2840))))

(declare-fun b!1400907 () Bool)

(declare-fun res!938735 () Bool)

(assert (=> b!1400907 (=> (not res!938735) (not e!793204))))

(assert (=> b!1400907 (= res!938735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!938734 () Bool)

(assert (=> start!120476 (=> (not res!938734) (not e!793204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120476 (= res!938734 (validMask!0 mask!2840))))

(assert (=> start!120476 e!793204))

(assert (=> start!120476 true))

(declare-fun array_inv!35533 (array!95807) Bool)

(assert (=> start!120476 (array_inv!35533 a!2901)))

(declare-fun b!1400908 () Bool)

(declare-fun e!793208 () Bool)

(assert (=> b!1400908 (= e!793206 e!793208)))

(declare-fun res!938727 () Bool)

(assert (=> b!1400908 (=> res!938727 e!793208)))

(assert (=> b!1400908 (= res!938727 (or (bvslt (x!126070 lt!616111) #b00000000000000000000000000000000) (bvsgt (x!126070 lt!616111) #b01111111111111111111111111111110) (bvslt (x!126070 lt!616113) #b00000000000000000000000000000000) (bvsgt (x!126070 lt!616113) #b01111111111111111111111111111110) (bvslt lt!616109 #b00000000000000000000000000000000) (bvsge lt!616109 (size!46803 a!2901)) (bvslt (index!44267 lt!616111) #b00000000000000000000000000000000) (bvsge (index!44267 lt!616111) (size!46803 a!2901)) (bvslt (index!44267 lt!616113) #b00000000000000000000000000000000) (bvsge (index!44267 lt!616113) (size!46803 a!2901)) (not (= lt!616111 (Intermediate!10472 false (index!44267 lt!616111) (x!126070 lt!616111)))) (not (= lt!616113 (Intermediate!10472 false (index!44267 lt!616113) (x!126070 lt!616113))))))))

(assert (=> b!1400908 e!793203))

(declare-fun res!938729 () Bool)

(assert (=> b!1400908 (=> (not res!938729) (not e!793203))))

(assert (=> b!1400908 (= res!938729 (and (not (undefined!11284 lt!616113)) (= (index!44267 lt!616113) i!1037) (bvslt (x!126070 lt!616113) (x!126070 lt!616111)) (= (select (store (arr!46252 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44267 lt!616113)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616112 () Unit!46975)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46975)

(assert (=> b!1400908 (= lt!616112 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616109 (x!126070 lt!616111) (index!44267 lt!616111) (x!126070 lt!616113) (index!44267 lt!616113) (undefined!11284 lt!616113) mask!2840))))

(declare-fun b!1400909 () Bool)

(assert (=> b!1400909 (= e!793208 true)))

(declare-fun lt!616115 () SeekEntryResult!10472)

(assert (=> b!1400909 (= lt!616115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616109 lt!616108 lt!616114 mask!2840))))

(declare-fun b!1400910 () Bool)

(declare-fun res!938728 () Bool)

(assert (=> b!1400910 (=> (not res!938728) (not e!793204))))

(assert (=> b!1400910 (= res!938728 (and (= (size!46803 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46803 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46803 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120476 res!938734) b!1400910))

(assert (= (and b!1400910 res!938728) b!1400905))

(assert (= (and b!1400905 res!938730) b!1400904))

(assert (= (and b!1400904 res!938736) b!1400907))

(assert (= (and b!1400907 res!938735) b!1400901))

(assert (= (and b!1400901 res!938732) b!1400906))

(assert (= (and b!1400906 res!938737) b!1400900))

(assert (= (and b!1400906 (not res!938731)) b!1400902))

(assert (= (and b!1400902 (not res!938733)) b!1400908))

(assert (= (and b!1400908 res!938729) b!1400903))

(assert (= (and b!1400908 (not res!938727)) b!1400909))

(declare-fun m!1288357 () Bool)

(assert (=> b!1400907 m!1288357))

(declare-fun m!1288359 () Bool)

(assert (=> b!1400908 m!1288359))

(declare-fun m!1288361 () Bool)

(assert (=> b!1400908 m!1288361))

(declare-fun m!1288363 () Bool)

(assert (=> b!1400908 m!1288363))

(declare-fun m!1288365 () Bool)

(assert (=> b!1400903 m!1288365))

(declare-fun m!1288367 () Bool)

(assert (=> b!1400903 m!1288367))

(assert (=> b!1400903 m!1288367))

(declare-fun m!1288369 () Bool)

(assert (=> b!1400903 m!1288369))

(declare-fun m!1288371 () Bool)

(assert (=> b!1400901 m!1288371))

(assert (=> b!1400906 m!1288367))

(declare-fun m!1288373 () Bool)

(assert (=> b!1400906 m!1288373))

(assert (=> b!1400906 m!1288367))

(declare-fun m!1288375 () Bool)

(assert (=> b!1400906 m!1288375))

(assert (=> b!1400906 m!1288367))

(declare-fun m!1288377 () Bool)

(assert (=> b!1400906 m!1288377))

(declare-fun m!1288379 () Bool)

(assert (=> b!1400906 m!1288379))

(assert (=> b!1400904 m!1288367))

(assert (=> b!1400904 m!1288367))

(declare-fun m!1288381 () Bool)

(assert (=> b!1400904 m!1288381))

(declare-fun m!1288383 () Bool)

(assert (=> b!1400909 m!1288383))

(declare-fun m!1288385 () Bool)

(assert (=> start!120476 m!1288385))

(declare-fun m!1288387 () Bool)

(assert (=> start!120476 m!1288387))

(assert (=> b!1400900 m!1288367))

(assert (=> b!1400900 m!1288367))

(declare-fun m!1288389 () Bool)

(assert (=> b!1400900 m!1288389))

(declare-fun m!1288391 () Bool)

(assert (=> b!1400905 m!1288391))

(assert (=> b!1400905 m!1288391))

(declare-fun m!1288393 () Bool)

(assert (=> b!1400905 m!1288393))

(declare-fun m!1288395 () Bool)

(assert (=> b!1400902 m!1288395))

(assert (=> b!1400902 m!1288395))

(declare-fun m!1288397 () Bool)

(assert (=> b!1400902 m!1288397))

(assert (=> b!1400902 m!1288359))

(declare-fun m!1288399 () Bool)

(assert (=> b!1400902 m!1288399))

(check-sat (not b!1400904) (not b!1400905) (not b!1400900) (not start!120476) (not b!1400906) (not b!1400903) (not b!1400909) (not b!1400902) (not b!1400907) (not b!1400908) (not b!1400901))
(check-sat)
