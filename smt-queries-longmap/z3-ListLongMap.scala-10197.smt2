; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120104 () Bool)

(assert start!120104)

(declare-fun b!1398346 () Bool)

(declare-fun e!791645 () Bool)

(declare-fun e!791648 () Bool)

(assert (=> b!1398346 (= e!791645 e!791648)))

(declare-fun res!937311 () Bool)

(assert (=> b!1398346 (=> res!937311 e!791648)))

(declare-datatypes ((SeekEntryResult!10490 0))(
  ( (MissingZero!10490 (index!44331 (_ BitVec 32))) (Found!10490 (index!44332 (_ BitVec 32))) (Intermediate!10490 (undefined!11302 Bool) (index!44333 (_ BitVec 32)) (x!125973 (_ BitVec 32))) (Undefined!10490) (MissingVacant!10490 (index!44334 (_ BitVec 32))) )
))
(declare-fun lt!614731 () SeekEntryResult!10490)

(declare-fun lt!614732 () SeekEntryResult!10490)

(get-info :version)

(assert (=> b!1398346 (= res!937311 (or (= lt!614731 lt!614732) (not ((_ is Intermediate!10490) lt!614732))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95586 0))(
  ( (array!95587 (arr!46147 (Array (_ BitVec 32) (_ BitVec 64))) (size!46699 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95586)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614730 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95586 (_ BitVec 32)) SeekEntryResult!10490)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398346 (= lt!614732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614730 mask!2840) lt!614730 (array!95587 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46699 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398346 (= lt!614730 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398347 () Bool)

(declare-fun e!791646 () Bool)

(assert (=> b!1398347 (= e!791646 (not e!791645))))

(declare-fun res!937315 () Bool)

(assert (=> b!1398347 (=> res!937315 e!791645)))

(assert (=> b!1398347 (= res!937315 (or (not ((_ is Intermediate!10490) lt!614731)) (undefined!11302 lt!614731)))))

(declare-fun e!791647 () Bool)

(assert (=> b!1398347 e!791647))

(declare-fun res!937317 () Bool)

(assert (=> b!1398347 (=> (not res!937317) (not e!791647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95586 (_ BitVec 32)) Bool)

(assert (=> b!1398347 (= res!937317 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46827 0))(
  ( (Unit!46828) )
))
(declare-fun lt!614728 () Unit!46827)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46827)

(assert (=> b!1398347 (= lt!614728 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614729 () (_ BitVec 32))

(assert (=> b!1398347 (= lt!614731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614729 (select (arr!46147 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398347 (= lt!614729 (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840))))

(declare-fun b!1398348 () Bool)

(assert (=> b!1398348 (= e!791648 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1398348 (and (not (undefined!11302 lt!614732)) (= (index!44333 lt!614732) i!1037) (bvslt (x!125973 lt!614732) (x!125973 lt!614731)) (= (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44333 lt!614732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614727 () Unit!46827)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46827)

(assert (=> b!1398348 (= lt!614727 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614729 (x!125973 lt!614731) (index!44333 lt!614731) (x!125973 lt!614732) (index!44333 lt!614732) (undefined!11302 lt!614732) mask!2840))))

(declare-fun b!1398349 () Bool)

(declare-fun res!937318 () Bool)

(assert (=> b!1398349 (=> (not res!937318) (not e!791646))))

(declare-datatypes ((List!32744 0))(
  ( (Nil!32741) (Cons!32740 (h!33982 (_ BitVec 64)) (t!47430 List!32744)) )
))
(declare-fun arrayNoDuplicates!0 (array!95586 (_ BitVec 32) List!32744) Bool)

(assert (=> b!1398349 (= res!937318 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32741))))

(declare-fun res!937316 () Bool)

(assert (=> start!120104 (=> (not res!937316) (not e!791646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120104 (= res!937316 (validMask!0 mask!2840))))

(assert (=> start!120104 e!791646))

(assert (=> start!120104 true))

(declare-fun array_inv!35380 (array!95586) Bool)

(assert (=> start!120104 (array_inv!35380 a!2901)))

(declare-fun b!1398350 () Bool)

(declare-fun res!937312 () Bool)

(assert (=> b!1398350 (=> (not res!937312) (not e!791646))))

(assert (=> b!1398350 (= res!937312 (and (= (size!46699 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46699 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46699 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398351 () Bool)

(declare-fun res!937310 () Bool)

(assert (=> b!1398351 (=> (not res!937310) (not e!791646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398351 (= res!937310 (validKeyInArray!0 (select (arr!46147 a!2901) i!1037)))))

(declare-fun b!1398352 () Bool)

(declare-fun res!937313 () Bool)

(assert (=> b!1398352 (=> (not res!937313) (not e!791646))))

(assert (=> b!1398352 (= res!937313 (validKeyInArray!0 (select (arr!46147 a!2901) j!112)))))

(declare-fun b!1398353 () Bool)

(declare-fun res!937314 () Bool)

(assert (=> b!1398353 (=> (not res!937314) (not e!791646))))

(assert (=> b!1398353 (= res!937314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398354 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95586 (_ BitVec 32)) SeekEntryResult!10490)

(assert (=> b!1398354 (= e!791647 (= (seekEntryOrOpen!0 (select (arr!46147 a!2901) j!112) a!2901 mask!2840) (Found!10490 j!112)))))

(assert (= (and start!120104 res!937316) b!1398350))

(assert (= (and b!1398350 res!937312) b!1398351))

(assert (= (and b!1398351 res!937310) b!1398352))

(assert (= (and b!1398352 res!937313) b!1398353))

(assert (= (and b!1398353 res!937314) b!1398349))

(assert (= (and b!1398349 res!937318) b!1398347))

(assert (= (and b!1398347 res!937317) b!1398354))

(assert (= (and b!1398347 (not res!937315)) b!1398346))

(assert (= (and b!1398346 (not res!937311)) b!1398348))

(declare-fun m!1285015 () Bool)

(assert (=> b!1398347 m!1285015))

(declare-fun m!1285017 () Bool)

(assert (=> b!1398347 m!1285017))

(assert (=> b!1398347 m!1285015))

(declare-fun m!1285019 () Bool)

(assert (=> b!1398347 m!1285019))

(assert (=> b!1398347 m!1285015))

(declare-fun m!1285021 () Bool)

(assert (=> b!1398347 m!1285021))

(declare-fun m!1285023 () Bool)

(assert (=> b!1398347 m!1285023))

(declare-fun m!1285025 () Bool)

(assert (=> b!1398346 m!1285025))

(declare-fun m!1285027 () Bool)

(assert (=> b!1398346 m!1285027))

(assert (=> b!1398346 m!1285025))

(declare-fun m!1285029 () Bool)

(assert (=> b!1398346 m!1285029))

(declare-fun m!1285031 () Bool)

(assert (=> b!1398346 m!1285031))

(declare-fun m!1285033 () Bool)

(assert (=> b!1398349 m!1285033))

(assert (=> b!1398354 m!1285015))

(assert (=> b!1398354 m!1285015))

(declare-fun m!1285035 () Bool)

(assert (=> b!1398354 m!1285035))

(declare-fun m!1285037 () Bool)

(assert (=> start!120104 m!1285037))

(declare-fun m!1285039 () Bool)

(assert (=> start!120104 m!1285039))

(declare-fun m!1285041 () Bool)

(assert (=> b!1398353 m!1285041))

(assert (=> b!1398348 m!1285027))

(declare-fun m!1285043 () Bool)

(assert (=> b!1398348 m!1285043))

(declare-fun m!1285045 () Bool)

(assert (=> b!1398348 m!1285045))

(assert (=> b!1398352 m!1285015))

(assert (=> b!1398352 m!1285015))

(declare-fun m!1285047 () Bool)

(assert (=> b!1398352 m!1285047))

(declare-fun m!1285049 () Bool)

(assert (=> b!1398351 m!1285049))

(assert (=> b!1398351 m!1285049))

(declare-fun m!1285051 () Bool)

(assert (=> b!1398351 m!1285051))

(check-sat (not b!1398347) (not b!1398354) (not b!1398346) (not b!1398351) (not b!1398352) (not b!1398349) (not b!1398353) (not b!1398348) (not start!120104))
(check-sat)
