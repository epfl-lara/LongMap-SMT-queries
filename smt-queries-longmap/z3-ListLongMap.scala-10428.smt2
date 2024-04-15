; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122726 () Bool)

(assert start!122726)

(declare-fun b!1422078 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97044 0))(
  ( (array!97045 (arr!46840 (Array (_ BitVec 32) (_ BitVec 64))) (size!47392 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97044)

(declare-fun e!803979 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11152 0))(
  ( (MissingZero!11152 (index!47000 (_ BitVec 32))) (Found!11152 (index!47001 (_ BitVec 32))) (Intermediate!11152 (undefined!11964 Bool) (index!47002 (_ BitVec 32)) (x!128639 (_ BitVec 32))) (Undefined!11152) (MissingVacant!11152 (index!47003 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97044 (_ BitVec 32)) SeekEntryResult!11152)

(assert (=> b!1422078 (= e!803979 (= (seekEntryOrOpen!0 (select (arr!46840 a!2831) j!81) a!2831 mask!2608) (Found!11152 j!81)))))

(declare-fun b!1422079 () Bool)

(declare-fun res!957568 () Bool)

(declare-fun e!803982 () Bool)

(assert (=> b!1422079 (=> (not res!957568) (not e!803982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97044 (_ BitVec 32)) Bool)

(assert (=> b!1422079 (= res!957568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422080 () Bool)

(declare-fun res!957574 () Bool)

(declare-fun e!803978 () Bool)

(assert (=> b!1422080 (=> (not res!957574) (not e!803978))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!626364 () SeekEntryResult!11152)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97044 (_ BitVec 32)) SeekEntryResult!11152)

(assert (=> b!1422080 (= res!957574 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46840 a!2831) j!81) a!2831 mask!2608) lt!626364))))

(declare-fun b!1422081 () Bool)

(declare-fun res!957562 () Bool)

(assert (=> b!1422081 (=> (not res!957562) (not e!803978))))

(declare-fun lt!626365 () array!97044)

(declare-fun lt!626368 () SeekEntryResult!11152)

(declare-fun lt!626367 () (_ BitVec 64))

(assert (=> b!1422081 (= res!957562 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626367 lt!626365 mask!2608) lt!626368))))

(declare-fun b!1422082 () Bool)

(declare-fun res!957576 () Bool)

(assert (=> b!1422082 (=> (not res!957576) (not e!803982))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422082 (= res!957576 (and (= (size!47392 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47392 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47392 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422083 () Bool)

(declare-fun res!957563 () Bool)

(assert (=> b!1422083 (=> (not res!957563) (not e!803982))))

(declare-datatypes ((List!33428 0))(
  ( (Nil!33425) (Cons!33424 (h!34726 (_ BitVec 64)) (t!48114 List!33428)) )
))
(declare-fun arrayNoDuplicates!0 (array!97044 (_ BitVec 32) List!33428) Bool)

(assert (=> b!1422083 (= res!957563 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33425))))

(declare-fun res!957569 () Bool)

(assert (=> start!122726 (=> (not res!957569) (not e!803982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122726 (= res!957569 (validMask!0 mask!2608))))

(assert (=> start!122726 e!803982))

(assert (=> start!122726 true))

(declare-fun array_inv!36073 (array!97044) Bool)

(assert (=> start!122726 (array_inv!36073 a!2831)))

(declare-fun b!1422084 () Bool)

(declare-fun res!957564 () Bool)

(assert (=> b!1422084 (=> (not res!957564) (not e!803978))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422084 (= res!957564 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422085 () Bool)

(declare-fun e!803981 () Bool)

(declare-fun e!803983 () Bool)

(assert (=> b!1422085 (= e!803981 e!803983)))

(declare-fun res!957571 () Bool)

(assert (=> b!1422085 (=> res!957571 e!803983)))

(declare-fun lt!626363 () (_ BitVec 32))

(assert (=> b!1422085 (= res!957571 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626363 #b00000000000000000000000000000000) (bvsge lt!626363 (size!47392 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422085 (= lt!626363 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422086 () Bool)

(declare-fun res!957575 () Bool)

(assert (=> b!1422086 (=> (not res!957575) (not e!803982))))

(assert (=> b!1422086 (= res!957575 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47392 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47392 a!2831))))))

(declare-fun b!1422087 () Bool)

(declare-fun res!957573 () Bool)

(assert (=> b!1422087 (=> res!957573 e!803983)))

(assert (=> b!1422087 (= res!957573 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626363 (select (arr!46840 a!2831) j!81) a!2831 mask!2608) lt!626364)))))

(declare-fun b!1422088 () Bool)

(assert (=> b!1422088 (= e!803978 (not e!803981))))

(declare-fun res!957572 () Bool)

(assert (=> b!1422088 (=> res!957572 e!803981)))

(assert (=> b!1422088 (= res!957572 (or (= (select (arr!46840 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46840 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46840 a!2831) index!585) (select (arr!46840 a!2831) j!81)) (= (select (store (arr!46840 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422088 e!803979))

(declare-fun res!957565 () Bool)

(assert (=> b!1422088 (=> (not res!957565) (not e!803979))))

(assert (=> b!1422088 (= res!957565 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!47979 0))(
  ( (Unit!47980) )
))
(declare-fun lt!626369 () Unit!47979)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47979)

(assert (=> b!1422088 (= lt!626369 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422089 () Bool)

(declare-fun e!803980 () Bool)

(assert (=> b!1422089 (= e!803980 e!803978)))

(declare-fun res!957570 () Bool)

(assert (=> b!1422089 (=> (not res!957570) (not e!803978))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422089 (= res!957570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626367 mask!2608) lt!626367 lt!626365 mask!2608) lt!626368))))

(assert (=> b!1422089 (= lt!626368 (Intermediate!11152 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422089 (= lt!626367 (select (store (arr!46840 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422089 (= lt!626365 (array!97045 (store (arr!46840 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47392 a!2831)))))

(declare-fun b!1422090 () Bool)

(assert (=> b!1422090 (= e!803983 true)))

(declare-fun lt!626366 () SeekEntryResult!11152)

(assert (=> b!1422090 (= lt!626366 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626363 lt!626367 lt!626365 mask!2608))))

(declare-fun b!1422091 () Bool)

(declare-fun res!957567 () Bool)

(assert (=> b!1422091 (=> (not res!957567) (not e!803982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422091 (= res!957567 (validKeyInArray!0 (select (arr!46840 a!2831) j!81)))))

(declare-fun b!1422092 () Bool)

(assert (=> b!1422092 (= e!803982 e!803980)))

(declare-fun res!957577 () Bool)

(assert (=> b!1422092 (=> (not res!957577) (not e!803980))))

(assert (=> b!1422092 (= res!957577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46840 a!2831) j!81) mask!2608) (select (arr!46840 a!2831) j!81) a!2831 mask!2608) lt!626364))))

(assert (=> b!1422092 (= lt!626364 (Intermediate!11152 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422093 () Bool)

(declare-fun res!957566 () Bool)

(assert (=> b!1422093 (=> (not res!957566) (not e!803982))))

(assert (=> b!1422093 (= res!957566 (validKeyInArray!0 (select (arr!46840 a!2831) i!982)))))

(assert (= (and start!122726 res!957569) b!1422082))

(assert (= (and b!1422082 res!957576) b!1422093))

(assert (= (and b!1422093 res!957566) b!1422091))

(assert (= (and b!1422091 res!957567) b!1422079))

(assert (= (and b!1422079 res!957568) b!1422083))

(assert (= (and b!1422083 res!957563) b!1422086))

(assert (= (and b!1422086 res!957575) b!1422092))

(assert (= (and b!1422092 res!957577) b!1422089))

(assert (= (and b!1422089 res!957570) b!1422080))

(assert (= (and b!1422080 res!957574) b!1422081))

(assert (= (and b!1422081 res!957562) b!1422084))

(assert (= (and b!1422084 res!957564) b!1422088))

(assert (= (and b!1422088 res!957565) b!1422078))

(assert (= (and b!1422088 (not res!957572)) b!1422085))

(assert (= (and b!1422085 (not res!957571)) b!1422087))

(assert (= (and b!1422087 (not res!957573)) b!1422090))

(declare-fun m!1312155 () Bool)

(assert (=> start!122726 m!1312155))

(declare-fun m!1312157 () Bool)

(assert (=> start!122726 m!1312157))

(declare-fun m!1312159 () Bool)

(assert (=> b!1422090 m!1312159))

(declare-fun m!1312161 () Bool)

(assert (=> b!1422083 m!1312161))

(declare-fun m!1312163 () Bool)

(assert (=> b!1422093 m!1312163))

(assert (=> b!1422093 m!1312163))

(declare-fun m!1312165 () Bool)

(assert (=> b!1422093 m!1312165))

(declare-fun m!1312167 () Bool)

(assert (=> b!1422081 m!1312167))

(declare-fun m!1312169 () Bool)

(assert (=> b!1422078 m!1312169))

(assert (=> b!1422078 m!1312169))

(declare-fun m!1312171 () Bool)

(assert (=> b!1422078 m!1312171))

(assert (=> b!1422091 m!1312169))

(assert (=> b!1422091 m!1312169))

(declare-fun m!1312173 () Bool)

(assert (=> b!1422091 m!1312173))

(assert (=> b!1422080 m!1312169))

(assert (=> b!1422080 m!1312169))

(declare-fun m!1312175 () Bool)

(assert (=> b!1422080 m!1312175))

(declare-fun m!1312177 () Bool)

(assert (=> b!1422079 m!1312177))

(assert (=> b!1422092 m!1312169))

(assert (=> b!1422092 m!1312169))

(declare-fun m!1312179 () Bool)

(assert (=> b!1422092 m!1312179))

(assert (=> b!1422092 m!1312179))

(assert (=> b!1422092 m!1312169))

(declare-fun m!1312181 () Bool)

(assert (=> b!1422092 m!1312181))

(declare-fun m!1312183 () Bool)

(assert (=> b!1422088 m!1312183))

(declare-fun m!1312185 () Bool)

(assert (=> b!1422088 m!1312185))

(declare-fun m!1312187 () Bool)

(assert (=> b!1422088 m!1312187))

(declare-fun m!1312189 () Bool)

(assert (=> b!1422088 m!1312189))

(assert (=> b!1422088 m!1312169))

(declare-fun m!1312191 () Bool)

(assert (=> b!1422088 m!1312191))

(assert (=> b!1422087 m!1312169))

(assert (=> b!1422087 m!1312169))

(declare-fun m!1312193 () Bool)

(assert (=> b!1422087 m!1312193))

(declare-fun m!1312195 () Bool)

(assert (=> b!1422085 m!1312195))

(declare-fun m!1312197 () Bool)

(assert (=> b!1422089 m!1312197))

(assert (=> b!1422089 m!1312197))

(declare-fun m!1312199 () Bool)

(assert (=> b!1422089 m!1312199))

(assert (=> b!1422089 m!1312183))

(declare-fun m!1312201 () Bool)

(assert (=> b!1422089 m!1312201))

(check-sat (not b!1422092) (not b!1422089) (not b!1422083) (not b!1422078) (not b!1422090) (not b!1422087) (not start!122726) (not b!1422088) (not b!1422085) (not b!1422093) (not b!1422079) (not b!1422091) (not b!1422081) (not b!1422080))
(check-sat)
