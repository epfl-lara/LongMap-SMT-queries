; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120422 () Bool)

(assert start!120422)

(declare-fun b!1401956 () Bool)

(declare-fun e!793874 () Bool)

(declare-fun e!793877 () Bool)

(assert (=> b!1401956 (= e!793874 e!793877)))

(declare-fun res!940525 () Bool)

(assert (=> b!1401956 (=> res!940525 e!793877)))

(declare-datatypes ((array!95784 0))(
  ( (array!95785 (arr!46243 (Array (_ BitVec 32) (_ BitVec 64))) (size!46795 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95784)

(declare-datatypes ((SeekEntryResult!10586 0))(
  ( (MissingZero!10586 (index!44721 (_ BitVec 32))) (Found!10586 (index!44722 (_ BitVec 32))) (Intermediate!10586 (undefined!11398 Bool) (index!44723 (_ BitVec 32)) (x!126346 (_ BitVec 32))) (Undefined!10586) (MissingVacant!10586 (index!44724 (_ BitVec 32))) )
))
(declare-fun lt!617183 () SeekEntryResult!10586)

(declare-fun lt!617182 () SeekEntryResult!10586)

(declare-fun lt!617177 () (_ BitVec 32))

(assert (=> b!1401956 (= res!940525 (or (bvslt (x!126346 lt!617182) #b00000000000000000000000000000000) (bvsgt (x!126346 lt!617182) #b01111111111111111111111111111110) (bvslt (x!126346 lt!617183) #b00000000000000000000000000000000) (bvsgt (x!126346 lt!617183) #b01111111111111111111111111111110) (bvslt lt!617177 #b00000000000000000000000000000000) (bvsge lt!617177 (size!46795 a!2901)) (bvslt (index!44723 lt!617182) #b00000000000000000000000000000000) (bvsge (index!44723 lt!617182) (size!46795 a!2901)) (bvslt (index!44723 lt!617183) #b00000000000000000000000000000000) (bvsge (index!44723 lt!617183) (size!46795 a!2901)) (not (= lt!617182 (Intermediate!10586 false (index!44723 lt!617182) (x!126346 lt!617182)))) (not (= lt!617183 (Intermediate!10586 false (index!44723 lt!617183) (x!126346 lt!617183))))))))

(declare-fun e!793880 () Bool)

(assert (=> b!1401956 e!793880))

(declare-fun res!940520 () Bool)

(assert (=> b!1401956 (=> (not res!940520) (not e!793880))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401956 (= res!940520 (and (not (undefined!11398 lt!617183)) (= (index!44723 lt!617183) i!1037) (bvslt (x!126346 lt!617183) (x!126346 lt!617182)) (= (select (store (arr!46243 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44723 lt!617183)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47019 0))(
  ( (Unit!47020) )
))
(declare-fun lt!617176 () Unit!47019)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47019)

(assert (=> b!1401956 (= lt!617176 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617177 (x!126346 lt!617182) (index!44723 lt!617182) (x!126346 lt!617183) (index!44723 lt!617183) (undefined!11398 lt!617183) mask!2840))))

(declare-fun e!793875 () Bool)

(declare-fun b!1401957 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95784 (_ BitVec 32)) SeekEntryResult!10586)

(assert (=> b!1401957 (= e!793875 (= (seekEntryOrOpen!0 (select (arr!46243 a!2901) j!112) a!2901 mask!2840) (Found!10586 j!112)))))

(declare-fun b!1401958 () Bool)

(declare-fun res!940527 () Bool)

(declare-fun e!793878 () Bool)

(assert (=> b!1401958 (=> (not res!940527) (not e!793878))))

(declare-datatypes ((List!32840 0))(
  ( (Nil!32837) (Cons!32836 (h!34084 (_ BitVec 64)) (t!47526 List!32840)) )
))
(declare-fun arrayNoDuplicates!0 (array!95784 (_ BitVec 32) List!32840) Bool)

(assert (=> b!1401958 (= res!940527 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32837))))

(declare-fun b!1401959 () Bool)

(declare-fun e!793879 () Bool)

(assert (=> b!1401959 (= e!793879 e!793874)))

(declare-fun res!940523 () Bool)

(assert (=> b!1401959 (=> res!940523 e!793874)))

(get-info :version)

(assert (=> b!1401959 (= res!940523 (or (= lt!617182 lt!617183) (not ((_ is Intermediate!10586) lt!617183))))))

(declare-fun lt!617179 () array!95784)

(declare-fun lt!617180 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95784 (_ BitVec 32)) SeekEntryResult!10586)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401959 (= lt!617183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617180 mask!2840) lt!617180 lt!617179 mask!2840))))

(assert (=> b!1401959 (= lt!617180 (select (store (arr!46243 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401959 (= lt!617179 (array!95785 (store (arr!46243 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46795 a!2901)))))

(declare-fun b!1401960 () Bool)

(declare-fun res!940526 () Bool)

(assert (=> b!1401960 (=> (not res!940526) (not e!793878))))

(assert (=> b!1401960 (= res!940526 (and (= (size!46795 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46795 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46795 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401961 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95784 (_ BitVec 32)) SeekEntryResult!10586)

(assert (=> b!1401961 (= e!793880 (= (seekEntryOrOpen!0 lt!617180 lt!617179 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126346 lt!617183) (index!44723 lt!617183) (index!44723 lt!617183) (select (arr!46243 a!2901) j!112) lt!617179 mask!2840)))))

(declare-fun b!1401962 () Bool)

(assert (=> b!1401962 (= e!793878 (not e!793879))))

(declare-fun res!940522 () Bool)

(assert (=> b!1401962 (=> res!940522 e!793879)))

(assert (=> b!1401962 (= res!940522 (or (not ((_ is Intermediate!10586) lt!617182)) (undefined!11398 lt!617182)))))

(assert (=> b!1401962 e!793875))

(declare-fun res!940519 () Bool)

(assert (=> b!1401962 (=> (not res!940519) (not e!793875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95784 (_ BitVec 32)) Bool)

(assert (=> b!1401962 (= res!940519 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617181 () Unit!47019)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47019)

(assert (=> b!1401962 (= lt!617181 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401962 (= lt!617182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617177 (select (arr!46243 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401962 (= lt!617177 (toIndex!0 (select (arr!46243 a!2901) j!112) mask!2840))))

(declare-fun res!940524 () Bool)

(assert (=> start!120422 (=> (not res!940524) (not e!793878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120422 (= res!940524 (validMask!0 mask!2840))))

(assert (=> start!120422 e!793878))

(assert (=> start!120422 true))

(declare-fun array_inv!35476 (array!95784) Bool)

(assert (=> start!120422 (array_inv!35476 a!2901)))

(declare-fun b!1401963 () Bool)

(declare-fun res!940528 () Bool)

(assert (=> b!1401963 (=> (not res!940528) (not e!793878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401963 (= res!940528 (validKeyInArray!0 (select (arr!46243 a!2901) j!112)))))

(declare-fun b!1401964 () Bool)

(declare-fun res!940518 () Bool)

(assert (=> b!1401964 (=> (not res!940518) (not e!793878))))

(assert (=> b!1401964 (= res!940518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401965 () Bool)

(assert (=> b!1401965 (= e!793877 true)))

(declare-fun lt!617178 () SeekEntryResult!10586)

(assert (=> b!1401965 (= lt!617178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617177 lt!617180 lt!617179 mask!2840))))

(declare-fun b!1401966 () Bool)

(declare-fun res!940521 () Bool)

(assert (=> b!1401966 (=> (not res!940521) (not e!793878))))

(assert (=> b!1401966 (= res!940521 (validKeyInArray!0 (select (arr!46243 a!2901) i!1037)))))

(assert (= (and start!120422 res!940524) b!1401960))

(assert (= (and b!1401960 res!940526) b!1401966))

(assert (= (and b!1401966 res!940521) b!1401963))

(assert (= (and b!1401963 res!940528) b!1401964))

(assert (= (and b!1401964 res!940518) b!1401958))

(assert (= (and b!1401958 res!940527) b!1401962))

(assert (= (and b!1401962 res!940519) b!1401957))

(assert (= (and b!1401962 (not res!940522)) b!1401959))

(assert (= (and b!1401959 (not res!940523)) b!1401956))

(assert (= (and b!1401956 res!940520) b!1401961))

(assert (= (and b!1401956 (not res!940525)) b!1401965))

(declare-fun m!1289485 () Bool)

(assert (=> start!120422 m!1289485))

(declare-fun m!1289487 () Bool)

(assert (=> start!120422 m!1289487))

(declare-fun m!1289489 () Bool)

(assert (=> b!1401963 m!1289489))

(assert (=> b!1401963 m!1289489))

(declare-fun m!1289491 () Bool)

(assert (=> b!1401963 m!1289491))

(assert (=> b!1401957 m!1289489))

(assert (=> b!1401957 m!1289489))

(declare-fun m!1289493 () Bool)

(assert (=> b!1401957 m!1289493))

(declare-fun m!1289495 () Bool)

(assert (=> b!1401965 m!1289495))

(assert (=> b!1401962 m!1289489))

(declare-fun m!1289497 () Bool)

(assert (=> b!1401962 m!1289497))

(assert (=> b!1401962 m!1289489))

(assert (=> b!1401962 m!1289489))

(declare-fun m!1289499 () Bool)

(assert (=> b!1401962 m!1289499))

(declare-fun m!1289501 () Bool)

(assert (=> b!1401962 m!1289501))

(declare-fun m!1289503 () Bool)

(assert (=> b!1401962 m!1289503))

(declare-fun m!1289505 () Bool)

(assert (=> b!1401959 m!1289505))

(assert (=> b!1401959 m!1289505))

(declare-fun m!1289507 () Bool)

(assert (=> b!1401959 m!1289507))

(declare-fun m!1289509 () Bool)

(assert (=> b!1401959 m!1289509))

(declare-fun m!1289511 () Bool)

(assert (=> b!1401959 m!1289511))

(declare-fun m!1289513 () Bool)

(assert (=> b!1401961 m!1289513))

(assert (=> b!1401961 m!1289489))

(assert (=> b!1401961 m!1289489))

(declare-fun m!1289515 () Bool)

(assert (=> b!1401961 m!1289515))

(declare-fun m!1289517 () Bool)

(assert (=> b!1401964 m!1289517))

(declare-fun m!1289519 () Bool)

(assert (=> b!1401958 m!1289519))

(declare-fun m!1289521 () Bool)

(assert (=> b!1401966 m!1289521))

(assert (=> b!1401966 m!1289521))

(declare-fun m!1289523 () Bool)

(assert (=> b!1401966 m!1289523))

(assert (=> b!1401956 m!1289509))

(declare-fun m!1289525 () Bool)

(assert (=> b!1401956 m!1289525))

(declare-fun m!1289527 () Bool)

(assert (=> b!1401956 m!1289527))

(check-sat (not b!1401962) (not b!1401957) (not b!1401958) (not b!1401963) (not b!1401959) (not b!1401964) (not b!1401966) (not b!1401965) (not b!1401961) (not b!1401956) (not start!120422))
(check-sat)
