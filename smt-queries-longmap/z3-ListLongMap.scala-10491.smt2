; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123754 () Bool)

(assert start!123754)

(declare-fun b!1433186 () Bool)

(declare-fun res!966214 () Bool)

(declare-fun e!809211 () Bool)

(assert (=> b!1433186 (=> (not res!966214) (not e!809211))))

(declare-datatypes ((SeekEntryResult!11288 0))(
  ( (MissingZero!11288 (index!47544 (_ BitVec 32))) (Found!11288 (index!47545 (_ BitVec 32))) (Intermediate!11288 (undefined!12100 Bool) (index!47546 (_ BitVec 32)) (x!129354 (_ BitVec 32))) (Undefined!11288) (MissingVacant!11288 (index!47547 (_ BitVec 32))) )
))
(declare-fun lt!630828 () SeekEntryResult!11288)

(declare-datatypes ((array!97607 0))(
  ( (array!97608 (arr!47107 (Array (_ BitVec 32) (_ BitVec 64))) (size!47658 (_ BitVec 32))) )
))
(declare-fun lt!630825 () array!97607)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!630826 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97607 (_ BitVec 32)) SeekEntryResult!11288)

(assert (=> b!1433186 (= res!966214 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630826 lt!630825 mask!2608) lt!630828))))

(declare-fun b!1433187 () Bool)

(declare-fun res!966215 () Bool)

(declare-fun e!809212 () Bool)

(assert (=> b!1433187 (=> (not res!966215) (not e!809212))))

(declare-fun a!2831 () array!97607)

(declare-datatypes ((List!33604 0))(
  ( (Nil!33601) (Cons!33600 (h!34934 (_ BitVec 64)) (t!48290 List!33604)) )
))
(declare-fun arrayNoDuplicates!0 (array!97607 (_ BitVec 32) List!33604) Bool)

(assert (=> b!1433187 (= res!966215 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33601))))

(declare-fun b!1433188 () Bool)

(declare-fun res!966218 () Bool)

(assert (=> b!1433188 (=> (not res!966218) (not e!809212))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433188 (= res!966218 (and (= (size!47658 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47658 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47658 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433189 () Bool)

(declare-fun res!966223 () Bool)

(assert (=> b!1433189 (=> (not res!966223) (not e!809212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97607 (_ BitVec 32)) Bool)

(assert (=> b!1433189 (= res!966223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433190 () Bool)

(declare-fun res!966213 () Bool)

(assert (=> b!1433190 (=> (not res!966213) (not e!809211))))

(declare-fun lt!630830 () SeekEntryResult!11288)

(assert (=> b!1433190 (= res!966213 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47107 a!2831) j!81) a!2831 mask!2608) lt!630830))))

(declare-fun res!966221 () Bool)

(assert (=> start!123754 (=> (not res!966221) (not e!809212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123754 (= res!966221 (validMask!0 mask!2608))))

(assert (=> start!123754 e!809212))

(assert (=> start!123754 true))

(declare-fun array_inv!36388 (array!97607) Bool)

(assert (=> start!123754 (array_inv!36388 a!2831)))

(declare-fun b!1433191 () Bool)

(declare-fun res!966226 () Bool)

(assert (=> b!1433191 (=> (not res!966226) (not e!809212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433191 (= res!966226 (validKeyInArray!0 (select (arr!47107 a!2831) i!982)))))

(declare-fun b!1433192 () Bool)

(declare-fun res!966224 () Bool)

(assert (=> b!1433192 (=> (not res!966224) (not e!809212))))

(assert (=> b!1433192 (= res!966224 (validKeyInArray!0 (select (arr!47107 a!2831) j!81)))))

(declare-fun b!1433193 () Bool)

(declare-fun e!809208 () Bool)

(assert (=> b!1433193 (= e!809208 e!809211)))

(declare-fun res!966222 () Bool)

(assert (=> b!1433193 (=> (not res!966222) (not e!809211))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433193 (= res!966222 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630826 mask!2608) lt!630826 lt!630825 mask!2608) lt!630828))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433193 (= lt!630828 (Intermediate!11288 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433193 (= lt!630826 (select (store (arr!47107 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433193 (= lt!630825 (array!97608 (store (arr!47107 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47658 a!2831)))))

(declare-fun b!1433194 () Bool)

(declare-fun res!966217 () Bool)

(assert (=> b!1433194 (=> (not res!966217) (not e!809211))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1433194 (= res!966217 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433195 () Bool)

(assert (=> b!1433195 (= e!809212 e!809208)))

(declare-fun res!966219 () Bool)

(assert (=> b!1433195 (=> (not res!966219) (not e!809208))))

(assert (=> b!1433195 (= res!966219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47107 a!2831) j!81) mask!2608) (select (arr!47107 a!2831) j!81) a!2831 mask!2608) lt!630830))))

(assert (=> b!1433195 (= lt!630830 (Intermediate!11288 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433196 () Bool)

(declare-fun res!966216 () Bool)

(assert (=> b!1433196 (=> (not res!966216) (not e!809212))))

(assert (=> b!1433196 (= res!966216 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47658 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47658 a!2831))))))

(declare-fun b!1433197 () Bool)

(declare-fun e!809210 () Bool)

(assert (=> b!1433197 (= e!809211 (not e!809210))))

(declare-fun res!966220 () Bool)

(assert (=> b!1433197 (=> res!966220 e!809210)))

(assert (=> b!1433197 (= res!966220 (or (= (select (arr!47107 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47107 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47107 a!2831) index!585) (select (arr!47107 a!2831) j!81)) (= (select (store (arr!47107 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809209 () Bool)

(assert (=> b!1433197 e!809209))

(declare-fun res!966225 () Bool)

(assert (=> b!1433197 (=> (not res!966225) (not e!809209))))

(assert (=> b!1433197 (= res!966225 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48353 0))(
  ( (Unit!48354) )
))
(declare-fun lt!630829 () Unit!48353)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48353)

(assert (=> b!1433197 (= lt!630829 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433198 () Bool)

(assert (=> b!1433198 (= e!809210 true)))

(declare-fun lt!630827 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433198 (= lt!630827 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1433199 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97607 (_ BitVec 32)) SeekEntryResult!11288)

(assert (=> b!1433199 (= e!809209 (= (seekEntryOrOpen!0 (select (arr!47107 a!2831) j!81) a!2831 mask!2608) (Found!11288 j!81)))))

(assert (= (and start!123754 res!966221) b!1433188))

(assert (= (and b!1433188 res!966218) b!1433191))

(assert (= (and b!1433191 res!966226) b!1433192))

(assert (= (and b!1433192 res!966224) b!1433189))

(assert (= (and b!1433189 res!966223) b!1433187))

(assert (= (and b!1433187 res!966215) b!1433196))

(assert (= (and b!1433196 res!966216) b!1433195))

(assert (= (and b!1433195 res!966219) b!1433193))

(assert (= (and b!1433193 res!966222) b!1433190))

(assert (= (and b!1433190 res!966213) b!1433186))

(assert (= (and b!1433186 res!966214) b!1433194))

(assert (= (and b!1433194 res!966217) b!1433197))

(assert (= (and b!1433197 res!966225) b!1433199))

(assert (= (and b!1433197 (not res!966220)) b!1433198))

(declare-fun m!1323067 () Bool)

(assert (=> b!1433199 m!1323067))

(assert (=> b!1433199 m!1323067))

(declare-fun m!1323069 () Bool)

(assert (=> b!1433199 m!1323069))

(declare-fun m!1323071 () Bool)

(assert (=> b!1433187 m!1323071))

(assert (=> b!1433195 m!1323067))

(assert (=> b!1433195 m!1323067))

(declare-fun m!1323073 () Bool)

(assert (=> b!1433195 m!1323073))

(assert (=> b!1433195 m!1323073))

(assert (=> b!1433195 m!1323067))

(declare-fun m!1323075 () Bool)

(assert (=> b!1433195 m!1323075))

(assert (=> b!1433190 m!1323067))

(assert (=> b!1433190 m!1323067))

(declare-fun m!1323077 () Bool)

(assert (=> b!1433190 m!1323077))

(declare-fun m!1323079 () Bool)

(assert (=> b!1433193 m!1323079))

(assert (=> b!1433193 m!1323079))

(declare-fun m!1323081 () Bool)

(assert (=> b!1433193 m!1323081))

(declare-fun m!1323083 () Bool)

(assert (=> b!1433193 m!1323083))

(declare-fun m!1323085 () Bool)

(assert (=> b!1433193 m!1323085))

(assert (=> b!1433197 m!1323083))

(declare-fun m!1323087 () Bool)

(assert (=> b!1433197 m!1323087))

(declare-fun m!1323089 () Bool)

(assert (=> b!1433197 m!1323089))

(declare-fun m!1323091 () Bool)

(assert (=> b!1433197 m!1323091))

(assert (=> b!1433197 m!1323067))

(declare-fun m!1323093 () Bool)

(assert (=> b!1433197 m!1323093))

(declare-fun m!1323095 () Bool)

(assert (=> b!1433198 m!1323095))

(declare-fun m!1323097 () Bool)

(assert (=> b!1433191 m!1323097))

(assert (=> b!1433191 m!1323097))

(declare-fun m!1323099 () Bool)

(assert (=> b!1433191 m!1323099))

(declare-fun m!1323101 () Bool)

(assert (=> b!1433186 m!1323101))

(declare-fun m!1323103 () Bool)

(assert (=> b!1433189 m!1323103))

(assert (=> b!1433192 m!1323067))

(assert (=> b!1433192 m!1323067))

(declare-fun m!1323105 () Bool)

(assert (=> b!1433192 m!1323105))

(declare-fun m!1323107 () Bool)

(assert (=> start!123754 m!1323107))

(declare-fun m!1323109 () Bool)

(assert (=> start!123754 m!1323109))

(check-sat (not b!1433190) (not b!1433195) (not b!1433191) (not b!1433189) (not b!1433193) (not b!1433198) (not b!1433186) (not b!1433192) (not b!1433187) (not b!1433199) (not start!123754) (not b!1433197))
(check-sat)
