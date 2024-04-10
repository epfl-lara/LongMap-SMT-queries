; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120308 () Bool)

(assert start!120308)

(declare-fun b!1400090 () Bool)

(declare-fun res!938611 () Bool)

(declare-fun e!792675 () Bool)

(assert (=> b!1400090 (=> (not res!938611) (not e!792675))))

(declare-datatypes ((array!95717 0))(
  ( (array!95718 (arr!46209 (Array (_ BitVec 32) (_ BitVec 64))) (size!46759 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95717)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95717 (_ BitVec 32)) Bool)

(assert (=> b!1400090 (= res!938611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun lt!615950 () (_ BitVec 64))

(declare-fun lt!615952 () array!95717)

(declare-fun b!1400091 () Bool)

(declare-datatypes ((SeekEntryResult!10526 0))(
  ( (MissingZero!10526 (index!44481 (_ BitVec 32))) (Found!10526 (index!44482 (_ BitVec 32))) (Intermediate!10526 (undefined!11338 Bool) (index!44483 (_ BitVec 32)) (x!126129 (_ BitVec 32))) (Undefined!10526) (MissingVacant!10526 (index!44484 (_ BitVec 32))) )
))
(declare-fun lt!615954 () SeekEntryResult!10526)

(declare-fun e!792677 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95717 (_ BitVec 32)) SeekEntryResult!10526)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95717 (_ BitVec 32)) SeekEntryResult!10526)

(assert (=> b!1400091 (= e!792677 (= (seekEntryOrOpen!0 lt!615950 lt!615952 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126129 lt!615954) (index!44483 lt!615954) (index!44483 lt!615954) (select (arr!46209 a!2901) j!112) lt!615952 mask!2840)))))

(declare-fun b!1400092 () Bool)

(declare-fun res!938601 () Bool)

(assert (=> b!1400092 (=> (not res!938601) (not e!792675))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400092 (= res!938601 (validKeyInArray!0 (select (arr!46209 a!2901) i!1037)))))

(declare-fun b!1400093 () Bool)

(declare-fun e!792680 () Bool)

(assert (=> b!1400093 (= e!792680 (= (seekEntryOrOpen!0 (select (arr!46209 a!2901) j!112) a!2901 mask!2840) (Found!10526 j!112)))))

(declare-fun b!1400094 () Bool)

(declare-fun res!938604 () Bool)

(assert (=> b!1400094 (=> (not res!938604) (not e!792675))))

(declare-datatypes ((List!32728 0))(
  ( (Nil!32725) (Cons!32724 (h!33972 (_ BitVec 64)) (t!47422 List!32728)) )
))
(declare-fun arrayNoDuplicates!0 (array!95717 (_ BitVec 32) List!32728) Bool)

(assert (=> b!1400094 (= res!938604 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32725))))

(declare-fun b!1400095 () Bool)

(declare-fun e!792678 () Bool)

(assert (=> b!1400095 (= e!792678 true)))

(declare-fun lt!615953 () SeekEntryResult!10526)

(declare-fun lt!615951 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95717 (_ BitVec 32)) SeekEntryResult!10526)

(assert (=> b!1400095 (= lt!615953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615951 lt!615950 lt!615952 mask!2840))))

(declare-fun b!1400096 () Bool)

(declare-fun e!792679 () Bool)

(assert (=> b!1400096 (= e!792675 (not e!792679))))

(declare-fun res!938607 () Bool)

(assert (=> b!1400096 (=> res!938607 e!792679)))

(declare-fun lt!615955 () SeekEntryResult!10526)

(get-info :version)

(assert (=> b!1400096 (= res!938607 (or (not ((_ is Intermediate!10526) lt!615955)) (undefined!11338 lt!615955)))))

(assert (=> b!1400096 e!792680))

(declare-fun res!938603 () Bool)

(assert (=> b!1400096 (=> (not res!938603) (not e!792680))))

(assert (=> b!1400096 (= res!938603 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47056 0))(
  ( (Unit!47057) )
))
(declare-fun lt!615957 () Unit!47056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47056)

(assert (=> b!1400096 (= lt!615957 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400096 (= lt!615955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615951 (select (arr!46209 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400096 (= lt!615951 (toIndex!0 (select (arr!46209 a!2901) j!112) mask!2840))))

(declare-fun b!1400097 () Bool)

(declare-fun e!792674 () Bool)

(assert (=> b!1400097 (= e!792674 e!792678)))

(declare-fun res!938606 () Bool)

(assert (=> b!1400097 (=> res!938606 e!792678)))

(assert (=> b!1400097 (= res!938606 (or (bvslt (x!126129 lt!615955) #b00000000000000000000000000000000) (bvsgt (x!126129 lt!615955) #b01111111111111111111111111111110) (bvslt (x!126129 lt!615954) #b00000000000000000000000000000000) (bvsgt (x!126129 lt!615954) #b01111111111111111111111111111110) (bvslt lt!615951 #b00000000000000000000000000000000) (bvsge lt!615951 (size!46759 a!2901)) (bvslt (index!44483 lt!615955) #b00000000000000000000000000000000) (bvsge (index!44483 lt!615955) (size!46759 a!2901)) (bvslt (index!44483 lt!615954) #b00000000000000000000000000000000) (bvsge (index!44483 lt!615954) (size!46759 a!2901)) (not (= lt!615955 (Intermediate!10526 false (index!44483 lt!615955) (x!126129 lt!615955)))) (not (= lt!615954 (Intermediate!10526 false (index!44483 lt!615954) (x!126129 lt!615954))))))))

(assert (=> b!1400097 e!792677))

(declare-fun res!938610 () Bool)

(assert (=> b!1400097 (=> (not res!938610) (not e!792677))))

(assert (=> b!1400097 (= res!938610 (and (not (undefined!11338 lt!615954)) (= (index!44483 lt!615954) i!1037) (bvslt (x!126129 lt!615954) (x!126129 lt!615955)) (= (select (store (arr!46209 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44483 lt!615954)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615956 () Unit!47056)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47056)

(assert (=> b!1400097 (= lt!615956 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615951 (x!126129 lt!615955) (index!44483 lt!615955) (x!126129 lt!615954) (index!44483 lt!615954) (undefined!11338 lt!615954) mask!2840))))

(declare-fun res!938602 () Bool)

(assert (=> start!120308 (=> (not res!938602) (not e!792675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120308 (= res!938602 (validMask!0 mask!2840))))

(assert (=> start!120308 e!792675))

(assert (=> start!120308 true))

(declare-fun array_inv!35237 (array!95717) Bool)

(assert (=> start!120308 (array_inv!35237 a!2901)))

(declare-fun b!1400098 () Bool)

(declare-fun res!938609 () Bool)

(assert (=> b!1400098 (=> (not res!938609) (not e!792675))))

(assert (=> b!1400098 (= res!938609 (validKeyInArray!0 (select (arr!46209 a!2901) j!112)))))

(declare-fun b!1400099 () Bool)

(declare-fun res!938608 () Bool)

(assert (=> b!1400099 (=> (not res!938608) (not e!792675))))

(assert (=> b!1400099 (= res!938608 (and (= (size!46759 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46759 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46759 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400100 () Bool)

(assert (=> b!1400100 (= e!792679 e!792674)))

(declare-fun res!938605 () Bool)

(assert (=> b!1400100 (=> res!938605 e!792674)))

(assert (=> b!1400100 (= res!938605 (or (= lt!615955 lt!615954) (not ((_ is Intermediate!10526) lt!615954))))))

(assert (=> b!1400100 (= lt!615954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615950 mask!2840) lt!615950 lt!615952 mask!2840))))

(assert (=> b!1400100 (= lt!615950 (select (store (arr!46209 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400100 (= lt!615952 (array!95718 (store (arr!46209 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46759 a!2901)))))

(assert (= (and start!120308 res!938602) b!1400099))

(assert (= (and b!1400099 res!938608) b!1400092))

(assert (= (and b!1400092 res!938601) b!1400098))

(assert (= (and b!1400098 res!938609) b!1400090))

(assert (= (and b!1400090 res!938611) b!1400094))

(assert (= (and b!1400094 res!938604) b!1400096))

(assert (= (and b!1400096 res!938603) b!1400093))

(assert (= (and b!1400096 (not res!938607)) b!1400100))

(assert (= (and b!1400100 (not res!938605)) b!1400097))

(assert (= (and b!1400097 res!938610) b!1400091))

(assert (= (and b!1400097 (not res!938606)) b!1400095))

(declare-fun m!1287425 () Bool)

(assert (=> b!1400091 m!1287425))

(declare-fun m!1287427 () Bool)

(assert (=> b!1400091 m!1287427))

(assert (=> b!1400091 m!1287427))

(declare-fun m!1287429 () Bool)

(assert (=> b!1400091 m!1287429))

(declare-fun m!1287431 () Bool)

(assert (=> start!120308 m!1287431))

(declare-fun m!1287433 () Bool)

(assert (=> start!120308 m!1287433))

(assert (=> b!1400098 m!1287427))

(assert (=> b!1400098 m!1287427))

(declare-fun m!1287435 () Bool)

(assert (=> b!1400098 m!1287435))

(declare-fun m!1287437 () Bool)

(assert (=> b!1400094 m!1287437))

(assert (=> b!1400093 m!1287427))

(assert (=> b!1400093 m!1287427))

(declare-fun m!1287439 () Bool)

(assert (=> b!1400093 m!1287439))

(declare-fun m!1287441 () Bool)

(assert (=> b!1400092 m!1287441))

(assert (=> b!1400092 m!1287441))

(declare-fun m!1287443 () Bool)

(assert (=> b!1400092 m!1287443))

(declare-fun m!1287445 () Bool)

(assert (=> b!1400095 m!1287445))

(declare-fun m!1287447 () Bool)

(assert (=> b!1400100 m!1287447))

(assert (=> b!1400100 m!1287447))

(declare-fun m!1287449 () Bool)

(assert (=> b!1400100 m!1287449))

(declare-fun m!1287451 () Bool)

(assert (=> b!1400100 m!1287451))

(declare-fun m!1287453 () Bool)

(assert (=> b!1400100 m!1287453))

(assert (=> b!1400097 m!1287451))

(declare-fun m!1287455 () Bool)

(assert (=> b!1400097 m!1287455))

(declare-fun m!1287457 () Bool)

(assert (=> b!1400097 m!1287457))

(declare-fun m!1287459 () Bool)

(assert (=> b!1400090 m!1287459))

(assert (=> b!1400096 m!1287427))

(declare-fun m!1287461 () Bool)

(assert (=> b!1400096 m!1287461))

(assert (=> b!1400096 m!1287427))

(declare-fun m!1287463 () Bool)

(assert (=> b!1400096 m!1287463))

(declare-fun m!1287465 () Bool)

(assert (=> b!1400096 m!1287465))

(assert (=> b!1400096 m!1287427))

(declare-fun m!1287467 () Bool)

(assert (=> b!1400096 m!1287467))

(check-sat (not b!1400094) (not b!1400096) (not b!1400092) (not b!1400095) (not start!120308) (not b!1400097) (not b!1400093) (not b!1400090) (not b!1400091) (not b!1400100) (not b!1400098))
(check-sat)
