; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120438 () Bool)

(assert start!120438)

(declare-fun b!1402233 () Bool)

(declare-fun res!940744 () Bool)

(declare-fun e!794035 () Bool)

(assert (=> b!1402233 (=> (not res!940744) (not e!794035))))

(declare-datatypes ((array!95847 0))(
  ( (array!95848 (arr!46274 (Array (_ BitVec 32) (_ BitVec 64))) (size!46824 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95847)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402233 (= res!940744 (validKeyInArray!0 (select (arr!46274 a!2901) j!112)))))

(declare-fun b!1402234 () Bool)

(declare-fun e!794038 () Bool)

(declare-fun e!794037 () Bool)

(assert (=> b!1402234 (= e!794038 e!794037)))

(declare-fun res!940749 () Bool)

(assert (=> b!1402234 (=> res!940749 e!794037)))

(declare-datatypes ((SeekEntryResult!10591 0))(
  ( (MissingZero!10591 (index!44741 (_ BitVec 32))) (Found!10591 (index!44742 (_ BitVec 32))) (Intermediate!10591 (undefined!11403 Bool) (index!44743 (_ BitVec 32)) (x!126370 (_ BitVec 32))) (Undefined!10591) (MissingVacant!10591 (index!44744 (_ BitVec 32))) )
))
(declare-fun lt!617519 () SeekEntryResult!10591)

(declare-fun lt!617523 () SeekEntryResult!10591)

(assert (=> b!1402234 (= res!940749 (or (= lt!617519 lt!617523) (not (is-Intermediate!10591 lt!617523))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617518 () (_ BitVec 64))

(declare-fun lt!617521 () array!95847)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95847 (_ BitVec 32)) SeekEntryResult!10591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402234 (= lt!617523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617518 mask!2840) lt!617518 lt!617521 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402234 (= lt!617518 (select (store (arr!46274 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402234 (= lt!617521 (array!95848 (store (arr!46274 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46824 a!2901)))))

(declare-fun b!1402235 () Bool)

(declare-fun e!794036 () Bool)

(assert (=> b!1402235 (= e!794037 e!794036)))

(declare-fun res!940748 () Bool)

(assert (=> b!1402235 (=> res!940748 e!794036)))

(declare-fun lt!617522 () (_ BitVec 32))

(assert (=> b!1402235 (= res!940748 (or (bvslt (x!126370 lt!617519) #b00000000000000000000000000000000) (bvsgt (x!126370 lt!617519) #b01111111111111111111111111111110) (bvslt (x!126370 lt!617523) #b00000000000000000000000000000000) (bvsgt (x!126370 lt!617523) #b01111111111111111111111111111110) (bvslt lt!617522 #b00000000000000000000000000000000) (bvsge lt!617522 (size!46824 a!2901)) (bvslt (index!44743 lt!617519) #b00000000000000000000000000000000) (bvsge (index!44743 lt!617519) (size!46824 a!2901)) (bvslt (index!44743 lt!617523) #b00000000000000000000000000000000) (bvsge (index!44743 lt!617523) (size!46824 a!2901)) (not (= lt!617519 (Intermediate!10591 false (index!44743 lt!617519) (x!126370 lt!617519)))) (not (= lt!617523 (Intermediate!10591 false (index!44743 lt!617523) (x!126370 lt!617523))))))))

(declare-fun lt!617520 () SeekEntryResult!10591)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95847 (_ BitVec 32)) SeekEntryResult!10591)

(assert (=> b!1402235 (= lt!617520 (seekKeyOrZeroReturnVacant!0 (x!126370 lt!617523) (index!44743 lt!617523) (index!44743 lt!617523) (select (arr!46274 a!2901) j!112) lt!617521 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95847 (_ BitVec 32)) SeekEntryResult!10591)

(assert (=> b!1402235 (= lt!617520 (seekEntryOrOpen!0 lt!617518 lt!617521 mask!2840))))

(assert (=> b!1402235 (and (not (undefined!11403 lt!617523)) (= (index!44743 lt!617523) i!1037) (bvslt (x!126370 lt!617523) (x!126370 lt!617519)) (= (select (store (arr!46274 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44743 lt!617523)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47186 0))(
  ( (Unit!47187) )
))
(declare-fun lt!617517 () Unit!47186)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47186)

(assert (=> b!1402235 (= lt!617517 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617522 (x!126370 lt!617519) (index!44743 lt!617519) (x!126370 lt!617523) (index!44743 lt!617523) (undefined!11403 lt!617523) mask!2840))))

(declare-fun b!1402236 () Bool)

(declare-fun res!940752 () Bool)

(assert (=> b!1402236 (=> (not res!940752) (not e!794035))))

(assert (=> b!1402236 (= res!940752 (validKeyInArray!0 (select (arr!46274 a!2901) i!1037)))))

(declare-fun b!1402237 () Bool)

(declare-fun res!940747 () Bool)

(assert (=> b!1402237 (=> (not res!940747) (not e!794035))))

(assert (=> b!1402237 (= res!940747 (and (= (size!46824 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46824 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46824 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402238 () Bool)

(declare-fun res!940745 () Bool)

(assert (=> b!1402238 (=> (not res!940745) (not e!794035))))

(declare-datatypes ((List!32793 0))(
  ( (Nil!32790) (Cons!32789 (h!34037 (_ BitVec 64)) (t!47487 List!32793)) )
))
(declare-fun arrayNoDuplicates!0 (array!95847 (_ BitVec 32) List!32793) Bool)

(assert (=> b!1402238 (= res!940745 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32790))))

(declare-fun b!1402239 () Bool)

(assert (=> b!1402239 (= e!794036 true)))

(declare-fun lt!617516 () SeekEntryResult!10591)

(assert (=> b!1402239 (= lt!617516 lt!617520)))

(declare-fun lt!617515 () Unit!47186)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47186)

(assert (=> b!1402239 (= lt!617515 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617522 (x!126370 lt!617519) (index!44743 lt!617519) (x!126370 lt!617523) (index!44743 lt!617523) mask!2840))))

(declare-fun b!1402240 () Bool)

(assert (=> b!1402240 (= e!794035 (not e!794038))))

(declare-fun res!940746 () Bool)

(assert (=> b!1402240 (=> res!940746 e!794038)))

(assert (=> b!1402240 (= res!940746 (or (not (is-Intermediate!10591 lt!617519)) (undefined!11403 lt!617519)))))

(assert (=> b!1402240 (= lt!617516 (Found!10591 j!112))))

(assert (=> b!1402240 (= lt!617516 (seekEntryOrOpen!0 (select (arr!46274 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95847 (_ BitVec 32)) Bool)

(assert (=> b!1402240 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617514 () Unit!47186)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47186)

(assert (=> b!1402240 (= lt!617514 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402240 (= lt!617519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617522 (select (arr!46274 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402240 (= lt!617522 (toIndex!0 (select (arr!46274 a!2901) j!112) mask!2840))))

(declare-fun res!940751 () Bool)

(assert (=> start!120438 (=> (not res!940751) (not e!794035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120438 (= res!940751 (validMask!0 mask!2840))))

(assert (=> start!120438 e!794035))

(assert (=> start!120438 true))

(declare-fun array_inv!35302 (array!95847) Bool)

(assert (=> start!120438 (array_inv!35302 a!2901)))

(declare-fun b!1402241 () Bool)

(declare-fun res!940753 () Bool)

(assert (=> b!1402241 (=> (not res!940753) (not e!794035))))

(assert (=> b!1402241 (= res!940753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402242 () Bool)

(declare-fun res!940750 () Bool)

(assert (=> b!1402242 (=> res!940750 e!794036)))

(assert (=> b!1402242 (= res!940750 (not (= lt!617523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617522 lt!617518 lt!617521 mask!2840))))))

(assert (= (and start!120438 res!940751) b!1402237))

(assert (= (and b!1402237 res!940747) b!1402236))

(assert (= (and b!1402236 res!940752) b!1402233))

(assert (= (and b!1402233 res!940744) b!1402241))

(assert (= (and b!1402241 res!940753) b!1402238))

(assert (= (and b!1402238 res!940745) b!1402240))

(assert (= (and b!1402240 (not res!940746)) b!1402234))

(assert (= (and b!1402234 (not res!940749)) b!1402235))

(assert (= (and b!1402235 (not res!940748)) b!1402242))

(assert (= (and b!1402242 (not res!940750)) b!1402239))

(declare-fun m!1290285 () Bool)

(assert (=> b!1402236 m!1290285))

(assert (=> b!1402236 m!1290285))

(declare-fun m!1290287 () Bool)

(assert (=> b!1402236 m!1290287))

(declare-fun m!1290289 () Bool)

(assert (=> start!120438 m!1290289))

(declare-fun m!1290291 () Bool)

(assert (=> start!120438 m!1290291))

(declare-fun m!1290293 () Bool)

(assert (=> b!1402235 m!1290293))

(declare-fun m!1290295 () Bool)

(assert (=> b!1402235 m!1290295))

(declare-fun m!1290297 () Bool)

(assert (=> b!1402235 m!1290297))

(declare-fun m!1290299 () Bool)

(assert (=> b!1402235 m!1290299))

(declare-fun m!1290301 () Bool)

(assert (=> b!1402235 m!1290301))

(declare-fun m!1290303 () Bool)

(assert (=> b!1402235 m!1290303))

(assert (=> b!1402235 m!1290297))

(declare-fun m!1290305 () Bool)

(assert (=> b!1402242 m!1290305))

(declare-fun m!1290307 () Bool)

(assert (=> b!1402241 m!1290307))

(declare-fun m!1290309 () Bool)

(assert (=> b!1402238 m!1290309))

(declare-fun m!1290311 () Bool)

(assert (=> b!1402234 m!1290311))

(assert (=> b!1402234 m!1290311))

(declare-fun m!1290313 () Bool)

(assert (=> b!1402234 m!1290313))

(assert (=> b!1402234 m!1290301))

(declare-fun m!1290315 () Bool)

(assert (=> b!1402234 m!1290315))

(assert (=> b!1402233 m!1290297))

(assert (=> b!1402233 m!1290297))

(declare-fun m!1290317 () Bool)

(assert (=> b!1402233 m!1290317))

(declare-fun m!1290319 () Bool)

(assert (=> b!1402239 m!1290319))

(assert (=> b!1402240 m!1290297))

(declare-fun m!1290321 () Bool)

(assert (=> b!1402240 m!1290321))

(assert (=> b!1402240 m!1290297))

(assert (=> b!1402240 m!1290297))

(declare-fun m!1290323 () Bool)

(assert (=> b!1402240 m!1290323))

(declare-fun m!1290325 () Bool)

(assert (=> b!1402240 m!1290325))

(assert (=> b!1402240 m!1290297))

(declare-fun m!1290327 () Bool)

(assert (=> b!1402240 m!1290327))

(declare-fun m!1290329 () Bool)

(assert (=> b!1402240 m!1290329))

(push 1)

