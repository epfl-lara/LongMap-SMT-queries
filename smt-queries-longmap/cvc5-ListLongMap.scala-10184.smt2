; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120030 () Bool)

(assert start!120030)

(declare-fun b!1397338 () Bool)

(declare-fun res!936310 () Bool)

(declare-fun e!791083 () Bool)

(assert (=> b!1397338 (=> (not res!936310) (not e!791083))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95512 0))(
  ( (array!95513 (arr!46110 (Array (_ BitVec 32) (_ BitVec 64))) (size!46662 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95512)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397338 (= res!936310 (and (= (size!46662 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46662 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46662 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!791080 () Bool)

(declare-fun b!1397339 () Bool)

(declare-datatypes ((SeekEntryResult!10453 0))(
  ( (MissingZero!10453 (index!44183 (_ BitVec 32))) (Found!10453 (index!44184 (_ BitVec 32))) (Intermediate!10453 (undefined!11265 Bool) (index!44185 (_ BitVec 32)) (x!125832 (_ BitVec 32))) (Undefined!10453) (MissingVacant!10453 (index!44186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95512 (_ BitVec 32)) SeekEntryResult!10453)

(assert (=> b!1397339 (= e!791080 (= (seekEntryOrOpen!0 (select (arr!46110 a!2901) j!112) a!2901 mask!2840) (Found!10453 j!112)))))

(declare-fun b!1397340 () Bool)

(declare-fun res!936307 () Bool)

(assert (=> b!1397340 (=> (not res!936307) (not e!791083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397340 (= res!936307 (validKeyInArray!0 (select (arr!46110 a!2901) j!112)))))

(declare-fun b!1397341 () Bool)

(declare-fun res!936302 () Bool)

(assert (=> b!1397341 (=> (not res!936302) (not e!791083))))

(declare-datatypes ((List!32707 0))(
  ( (Nil!32704) (Cons!32703 (h!33945 (_ BitVec 64)) (t!47393 List!32707)) )
))
(declare-fun arrayNoDuplicates!0 (array!95512 (_ BitVec 32) List!32707) Bool)

(assert (=> b!1397341 (= res!936302 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32704))))

(declare-fun res!936303 () Bool)

(assert (=> start!120030 (=> (not res!936303) (not e!791083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120030 (= res!936303 (validMask!0 mask!2840))))

(assert (=> start!120030 e!791083))

(assert (=> start!120030 true))

(declare-fun array_inv!35343 (array!95512) Bool)

(assert (=> start!120030 (array_inv!35343 a!2901)))

(declare-fun b!1397342 () Bool)

(declare-fun e!791081 () Bool)

(assert (=> b!1397342 (= e!791083 (not e!791081))))

(declare-fun res!936305 () Bool)

(assert (=> b!1397342 (=> res!936305 e!791081)))

(declare-fun lt!613998 () SeekEntryResult!10453)

(assert (=> b!1397342 (= res!936305 (or (not (is-Intermediate!10453 lt!613998)) (undefined!11265 lt!613998)))))

(assert (=> b!1397342 e!791080))

(declare-fun res!936304 () Bool)

(assert (=> b!1397342 (=> (not res!936304) (not e!791080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95512 (_ BitVec 32)) Bool)

(assert (=> b!1397342 (= res!936304 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46753 0))(
  ( (Unit!46754) )
))
(declare-fun lt!614001 () Unit!46753)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46753)

(assert (=> b!1397342 (= lt!614001 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613997 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95512 (_ BitVec 32)) SeekEntryResult!10453)

(assert (=> b!1397342 (= lt!613998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613997 (select (arr!46110 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397342 (= lt!613997 (toIndex!0 (select (arr!46110 a!2901) j!112) mask!2840))))

(declare-fun b!1397343 () Bool)

(declare-fun e!791084 () Bool)

(assert (=> b!1397343 (= e!791081 e!791084)))

(declare-fun res!936308 () Bool)

(assert (=> b!1397343 (=> res!936308 e!791084)))

(declare-fun lt!614002 () SeekEntryResult!10453)

(assert (=> b!1397343 (= res!936308 (or (= lt!613998 lt!614002) (not (is-Intermediate!10453 lt!614002)) (bvslt (x!125832 lt!613998) #b00000000000000000000000000000000) (bvsgt (x!125832 lt!613998) #b01111111111111111111111111111110) (bvslt lt!613997 #b00000000000000000000000000000000) (bvsge lt!613997 (size!46662 a!2901)) (bvslt (index!44185 lt!613998) #b00000000000000000000000000000000) (bvsge (index!44185 lt!613998) (size!46662 a!2901)) (not (= lt!613998 (Intermediate!10453 false (index!44185 lt!613998) (x!125832 lt!613998)))) (not (= lt!614002 (Intermediate!10453 (undefined!11265 lt!614002) (index!44185 lt!614002) (x!125832 lt!614002))))))))

(declare-fun lt!613999 () array!95512)

(declare-fun lt!614000 () (_ BitVec 64))

(assert (=> b!1397343 (= lt!614002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614000 mask!2840) lt!614000 lt!613999 mask!2840))))

(assert (=> b!1397343 (= lt!614000 (select (store (arr!46110 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397343 (= lt!613999 (array!95513 (store (arr!46110 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46662 a!2901)))))

(declare-fun b!1397344 () Bool)

(declare-fun res!936306 () Bool)

(assert (=> b!1397344 (=> (not res!936306) (not e!791083))))

(assert (=> b!1397344 (= res!936306 (validKeyInArray!0 (select (arr!46110 a!2901) i!1037)))))

(declare-fun b!1397345 () Bool)

(declare-fun res!936309 () Bool)

(assert (=> b!1397345 (=> (not res!936309) (not e!791083))))

(assert (=> b!1397345 (= res!936309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397346 () Bool)

(assert (=> b!1397346 (= e!791084 true)))

(declare-fun lt!614003 () SeekEntryResult!10453)

(assert (=> b!1397346 (= lt!614003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613997 lt!614000 lt!613999 mask!2840))))

(assert (= (and start!120030 res!936303) b!1397338))

(assert (= (and b!1397338 res!936310) b!1397344))

(assert (= (and b!1397344 res!936306) b!1397340))

(assert (= (and b!1397340 res!936307) b!1397345))

(assert (= (and b!1397345 res!936309) b!1397341))

(assert (= (and b!1397341 res!936302) b!1397342))

(assert (= (and b!1397342 res!936304) b!1397339))

(assert (= (and b!1397342 (not res!936305)) b!1397343))

(assert (= (and b!1397343 (not res!936308)) b!1397346))

(declare-fun m!1283647 () Bool)

(assert (=> b!1397342 m!1283647))

(declare-fun m!1283649 () Bool)

(assert (=> b!1397342 m!1283649))

(assert (=> b!1397342 m!1283647))

(assert (=> b!1397342 m!1283647))

(declare-fun m!1283651 () Bool)

(assert (=> b!1397342 m!1283651))

(declare-fun m!1283653 () Bool)

(assert (=> b!1397342 m!1283653))

(declare-fun m!1283655 () Bool)

(assert (=> b!1397342 m!1283655))

(declare-fun m!1283657 () Bool)

(assert (=> b!1397343 m!1283657))

(assert (=> b!1397343 m!1283657))

(declare-fun m!1283659 () Bool)

(assert (=> b!1397343 m!1283659))

(declare-fun m!1283661 () Bool)

(assert (=> b!1397343 m!1283661))

(declare-fun m!1283663 () Bool)

(assert (=> b!1397343 m!1283663))

(declare-fun m!1283665 () Bool)

(assert (=> b!1397344 m!1283665))

(assert (=> b!1397344 m!1283665))

(declare-fun m!1283667 () Bool)

(assert (=> b!1397344 m!1283667))

(declare-fun m!1283669 () Bool)

(assert (=> start!120030 m!1283669))

(declare-fun m!1283671 () Bool)

(assert (=> start!120030 m!1283671))

(assert (=> b!1397339 m!1283647))

(assert (=> b!1397339 m!1283647))

(declare-fun m!1283673 () Bool)

(assert (=> b!1397339 m!1283673))

(declare-fun m!1283675 () Bool)

(assert (=> b!1397341 m!1283675))

(assert (=> b!1397340 m!1283647))

(assert (=> b!1397340 m!1283647))

(declare-fun m!1283677 () Bool)

(assert (=> b!1397340 m!1283677))

(declare-fun m!1283679 () Bool)

(assert (=> b!1397345 m!1283679))

(declare-fun m!1283681 () Bool)

(assert (=> b!1397346 m!1283681))

(push 1)

(assert (not b!1397340))

(assert (not b!1397341))

(assert (not b!1397343))

(assert (not start!120030))

(assert (not b!1397345))

(assert (not b!1397346))

(assert (not b!1397339))

(assert (not b!1397342))

(assert (not b!1397344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

