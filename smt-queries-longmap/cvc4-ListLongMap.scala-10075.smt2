; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118582 () Bool)

(assert start!118582)

(declare-fun b!1386268 () Bool)

(declare-fun e!785320 () Bool)

(assert (=> b!1386268 (= e!785320 false)))

(declare-datatypes ((Unit!46137 0))(
  ( (Unit!46138) )
))
(declare-fun lt!609248 () Unit!46137)

(declare-fun e!785322 () Unit!46137)

(assert (=> b!1386268 (= lt!609248 e!785322)))

(declare-fun c!128810 () Bool)

(declare-fun e!785321 () Bool)

(assert (=> b!1386268 (= c!128810 e!785321)))

(declare-fun res!927538 () Bool)

(assert (=> b!1386268 (=> (not res!927538) (not e!785321))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386268 (= res!927538 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386269 () Bool)

(declare-fun Unit!46139 () Unit!46137)

(assert (=> b!1386269 (= e!785322 Unit!46139)))

(declare-fun b!1386270 () Bool)

(declare-fun res!927535 () Bool)

(assert (=> b!1386270 (=> (not res!927535) (not e!785320))))

(declare-datatypes ((array!94811 0))(
  ( (array!94812 (arr!45782 (Array (_ BitVec 32) (_ BitVec 64))) (size!46334 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94811)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386270 (= res!927535 (validKeyInArray!0 (select (arr!45782 a!2938) i!1065)))))

(declare-fun b!1386271 () Bool)

(declare-fun res!927536 () Bool)

(assert (=> b!1386271 (=> (not res!927536) (not e!785320))))

(assert (=> b!1386271 (= res!927536 (and (not (= (select (arr!45782 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45782 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386272 () Bool)

(declare-fun res!927537 () Bool)

(assert (=> b!1386272 (=> (not res!927537) (not e!785320))))

(declare-datatypes ((List!32388 0))(
  ( (Nil!32385) (Cons!32384 (h!33593 (_ BitVec 64)) (t!47074 List!32388)) )
))
(declare-fun arrayNoDuplicates!0 (array!94811 (_ BitVec 32) List!32388) Bool)

(assert (=> b!1386272 (= res!927537 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32385))))

(declare-fun res!927533 () Bool)

(assert (=> start!118582 (=> (not res!927533) (not e!785320))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118582 (= res!927533 (validMask!0 mask!2987))))

(assert (=> start!118582 e!785320))

(assert (=> start!118582 true))

(declare-fun array_inv!35015 (array!94811) Bool)

(assert (=> start!118582 (array_inv!35015 a!2938)))

(declare-fun b!1386273 () Bool)

(declare-fun lt!609247 () Unit!46137)

(assert (=> b!1386273 (= e!785322 lt!609247)))

(declare-fun lt!609246 () Unit!46137)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46137)

(assert (=> b!1386273 (= lt!609246 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10151 0))(
  ( (MissingZero!10151 (index!42975 (_ BitVec 32))) (Found!10151 (index!42976 (_ BitVec 32))) (Intermediate!10151 (undefined!10963 Bool) (index!42977 (_ BitVec 32)) (x!124589 (_ BitVec 32))) (Undefined!10151) (MissingVacant!10151 (index!42978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94811 (_ BitVec 32)) SeekEntryResult!10151)

(assert (=> b!1386273 (= (seekEntryOrOpen!0 (select (arr!45782 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45782 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94812 (store (arr!45782 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46334 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46137)

(assert (=> b!1386273 (= lt!609247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94811 (_ BitVec 32)) Bool)

(assert (=> b!1386273 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386274 () Bool)

(declare-fun res!927534 () Bool)

(assert (=> b!1386274 (=> (not res!927534) (not e!785320))))

(assert (=> b!1386274 (= res!927534 (and (= (size!46334 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46334 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46334 a!2938))))))

(declare-fun b!1386275 () Bool)

(declare-fun res!927539 () Bool)

(assert (=> b!1386275 (=> (not res!927539) (not e!785320))))

(assert (=> b!1386275 (= res!927539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386276 () Bool)

(assert (=> b!1386276 (= e!785321 (validKeyInArray!0 (select (arr!45782 a!2938) startIndex!16)))))

(assert (= (and start!118582 res!927533) b!1386274))

(assert (= (and b!1386274 res!927534) b!1386270))

(assert (= (and b!1386270 res!927535) b!1386272))

(assert (= (and b!1386272 res!927537) b!1386275))

(assert (= (and b!1386275 res!927539) b!1386271))

(assert (= (and b!1386271 res!927536) b!1386268))

(assert (= (and b!1386268 res!927538) b!1386276))

(assert (= (and b!1386268 c!128810) b!1386273))

(assert (= (and b!1386268 (not c!128810)) b!1386269))

(declare-fun m!1271187 () Bool)

(assert (=> start!118582 m!1271187))

(declare-fun m!1271189 () Bool)

(assert (=> start!118582 m!1271189))

(declare-fun m!1271191 () Bool)

(assert (=> b!1386275 m!1271191))

(declare-fun m!1271193 () Bool)

(assert (=> b!1386272 m!1271193))

(declare-fun m!1271195 () Bool)

(assert (=> b!1386276 m!1271195))

(assert (=> b!1386276 m!1271195))

(declare-fun m!1271197 () Bool)

(assert (=> b!1386276 m!1271197))

(declare-fun m!1271199 () Bool)

(assert (=> b!1386271 m!1271199))

(assert (=> b!1386270 m!1271199))

(assert (=> b!1386270 m!1271199))

(declare-fun m!1271201 () Bool)

(assert (=> b!1386270 m!1271201))

(declare-fun m!1271203 () Bool)

(assert (=> b!1386273 m!1271203))

(declare-fun m!1271205 () Bool)

(assert (=> b!1386273 m!1271205))

(assert (=> b!1386273 m!1271205))

(declare-fun m!1271207 () Bool)

(assert (=> b!1386273 m!1271207))

(declare-fun m!1271209 () Bool)

(assert (=> b!1386273 m!1271209))

(declare-fun m!1271211 () Bool)

(assert (=> b!1386273 m!1271211))

(assert (=> b!1386273 m!1271195))

(declare-fun m!1271213 () Bool)

(assert (=> b!1386273 m!1271213))

(assert (=> b!1386273 m!1271195))

(declare-fun m!1271215 () Bool)

(assert (=> b!1386273 m!1271215))

(push 1)

(assert (not b!1386275))

(assert (not b!1386270))

(assert (not start!118582))

(assert (not b!1386273))

(assert (not b!1386272))

(assert (not b!1386276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

