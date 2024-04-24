; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123802 () Bool)

(assert start!123802)

(declare-fun b!1434194 () Bool)

(declare-fun res!967224 () Bool)

(declare-fun e!809641 () Bool)

(assert (=> b!1434194 (=> (not res!967224) (not e!809641))))

(declare-datatypes ((array!97655 0))(
  ( (array!97656 (arr!47131 (Array (_ BitVec 32) (_ BitVec 64))) (size!47682 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97655)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434194 (= res!967224 (validKeyInArray!0 (select (arr!47131 a!2831) j!81)))))

(declare-fun b!1434195 () Bool)

(declare-fun res!967226 () Bool)

(declare-fun e!809642 () Bool)

(assert (=> b!1434195 (=> (not res!967226) (not e!809642))))

(declare-fun lt!631259 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!631262 () array!97655)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11312 0))(
  ( (MissingZero!11312 (index!47640 (_ BitVec 32))) (Found!11312 (index!47641 (_ BitVec 32))) (Intermediate!11312 (undefined!12124 Bool) (index!47642 (_ BitVec 32)) (x!129442 (_ BitVec 32))) (Undefined!11312) (MissingVacant!11312 (index!47643 (_ BitVec 32))) )
))
(declare-fun lt!631257 () SeekEntryResult!11312)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97655 (_ BitVec 32)) SeekEntryResult!11312)

(assert (=> b!1434195 (= res!967226 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631259 lt!631262 mask!2608) lt!631257))))

(declare-fun b!1434196 () Bool)

(declare-fun res!967223 () Bool)

(assert (=> b!1434196 (=> (not res!967223) (not e!809641))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1434196 (= res!967223 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47682 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47682 a!2831))))))

(declare-fun b!1434197 () Bool)

(declare-fun res!967222 () Bool)

(assert (=> b!1434197 (=> (not res!967222) (not e!809641))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434197 (= res!967222 (validKeyInArray!0 (select (arr!47131 a!2831) i!982)))))

(declare-fun e!809643 () Bool)

(declare-fun b!1434198 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97655 (_ BitVec 32)) SeekEntryResult!11312)

(assert (=> b!1434198 (= e!809643 (= (seekEntryOrOpen!0 (select (arr!47131 a!2831) j!81) a!2831 mask!2608) (Found!11312 j!81)))))

(declare-fun b!1434199 () Bool)

(declare-fun e!809645 () Bool)

(assert (=> b!1434199 (= e!809645 e!809642)))

(declare-fun res!967228 () Bool)

(assert (=> b!1434199 (=> (not res!967228) (not e!809642))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434199 (= res!967228 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631259 mask!2608) lt!631259 lt!631262 mask!2608) lt!631257))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434199 (= lt!631257 (Intermediate!11312 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434199 (= lt!631259 (select (store (arr!47131 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434199 (= lt!631262 (array!97656 (store (arr!47131 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47682 a!2831)))))

(declare-fun b!1434200 () Bool)

(declare-fun res!967221 () Bool)

(assert (=> b!1434200 (=> (not res!967221) (not e!809641))))

(declare-datatypes ((List!33628 0))(
  ( (Nil!33625) (Cons!33624 (h!34958 (_ BitVec 64)) (t!48314 List!33628)) )
))
(declare-fun arrayNoDuplicates!0 (array!97655 (_ BitVec 32) List!33628) Bool)

(assert (=> b!1434200 (= res!967221 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33625))))

(declare-fun b!1434201 () Bool)

(declare-fun res!967225 () Bool)

(assert (=> b!1434201 (=> (not res!967225) (not e!809642))))

(assert (=> b!1434201 (= res!967225 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434202 () Bool)

(declare-fun e!809644 () Bool)

(assert (=> b!1434202 (= e!809644 true)))

(declare-fun lt!631258 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434202 (= lt!631258 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun res!967227 () Bool)

(assert (=> start!123802 (=> (not res!967227) (not e!809641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123802 (= res!967227 (validMask!0 mask!2608))))

(assert (=> start!123802 e!809641))

(assert (=> start!123802 true))

(declare-fun array_inv!36412 (array!97655) Bool)

(assert (=> start!123802 (array_inv!36412 a!2831)))

(declare-fun b!1434203 () Bool)

(declare-fun res!967229 () Bool)

(assert (=> b!1434203 (=> (not res!967229) (not e!809642))))

(declare-fun lt!631261 () SeekEntryResult!11312)

(assert (=> b!1434203 (= res!967229 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47131 a!2831) j!81) a!2831 mask!2608) lt!631261))))

(declare-fun b!1434204 () Bool)

(assert (=> b!1434204 (= e!809642 (not e!809644))))

(declare-fun res!967230 () Bool)

(assert (=> b!1434204 (=> res!967230 e!809644)))

(assert (=> b!1434204 (= res!967230 (or (= (select (arr!47131 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47131 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47131 a!2831) index!585) (select (arr!47131 a!2831) j!81)) (= (select (store (arr!47131 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434204 e!809643))

(declare-fun res!967234 () Bool)

(assert (=> b!1434204 (=> (not res!967234) (not e!809643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97655 (_ BitVec 32)) Bool)

(assert (=> b!1434204 (= res!967234 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48401 0))(
  ( (Unit!48402) )
))
(declare-fun lt!631260 () Unit!48401)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48401)

(assert (=> b!1434204 (= lt!631260 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434205 () Bool)

(declare-fun res!967232 () Bool)

(assert (=> b!1434205 (=> (not res!967232) (not e!809641))))

(assert (=> b!1434205 (= res!967232 (and (= (size!47682 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47682 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47682 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434206 () Bool)

(declare-fun res!967233 () Bool)

(assert (=> b!1434206 (=> (not res!967233) (not e!809641))))

(assert (=> b!1434206 (= res!967233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434207 () Bool)

(assert (=> b!1434207 (= e!809641 e!809645)))

(declare-fun res!967231 () Bool)

(assert (=> b!1434207 (=> (not res!967231) (not e!809645))))

(assert (=> b!1434207 (= res!967231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47131 a!2831) j!81) mask!2608) (select (arr!47131 a!2831) j!81) a!2831 mask!2608) lt!631261))))

(assert (=> b!1434207 (= lt!631261 (Intermediate!11312 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123802 res!967227) b!1434205))

(assert (= (and b!1434205 res!967232) b!1434197))

(assert (= (and b!1434197 res!967222) b!1434194))

(assert (= (and b!1434194 res!967224) b!1434206))

(assert (= (and b!1434206 res!967233) b!1434200))

(assert (= (and b!1434200 res!967221) b!1434196))

(assert (= (and b!1434196 res!967223) b!1434207))

(assert (= (and b!1434207 res!967231) b!1434199))

(assert (= (and b!1434199 res!967228) b!1434203))

(assert (= (and b!1434203 res!967229) b!1434195))

(assert (= (and b!1434195 res!967226) b!1434201))

(assert (= (and b!1434201 res!967225) b!1434204))

(assert (= (and b!1434204 res!967234) b!1434198))

(assert (= (and b!1434204 (not res!967230)) b!1434202))

(declare-fun m!1324123 () Bool)

(assert (=> b!1434206 m!1324123))

(declare-fun m!1324125 () Bool)

(assert (=> b!1434207 m!1324125))

(assert (=> b!1434207 m!1324125))

(declare-fun m!1324127 () Bool)

(assert (=> b!1434207 m!1324127))

(assert (=> b!1434207 m!1324127))

(assert (=> b!1434207 m!1324125))

(declare-fun m!1324129 () Bool)

(assert (=> b!1434207 m!1324129))

(declare-fun m!1324131 () Bool)

(assert (=> b!1434195 m!1324131))

(assert (=> b!1434203 m!1324125))

(assert (=> b!1434203 m!1324125))

(declare-fun m!1324133 () Bool)

(assert (=> b!1434203 m!1324133))

(declare-fun m!1324135 () Bool)

(assert (=> b!1434199 m!1324135))

(assert (=> b!1434199 m!1324135))

(declare-fun m!1324137 () Bool)

(assert (=> b!1434199 m!1324137))

(declare-fun m!1324139 () Bool)

(assert (=> b!1434199 m!1324139))

(declare-fun m!1324141 () Bool)

(assert (=> b!1434199 m!1324141))

(assert (=> b!1434198 m!1324125))

(assert (=> b!1434198 m!1324125))

(declare-fun m!1324143 () Bool)

(assert (=> b!1434198 m!1324143))

(declare-fun m!1324145 () Bool)

(assert (=> b!1434197 m!1324145))

(assert (=> b!1434197 m!1324145))

(declare-fun m!1324147 () Bool)

(assert (=> b!1434197 m!1324147))

(assert (=> b!1434204 m!1324139))

(declare-fun m!1324149 () Bool)

(assert (=> b!1434204 m!1324149))

(declare-fun m!1324151 () Bool)

(assert (=> b!1434204 m!1324151))

(declare-fun m!1324153 () Bool)

(assert (=> b!1434204 m!1324153))

(assert (=> b!1434204 m!1324125))

(declare-fun m!1324155 () Bool)

(assert (=> b!1434204 m!1324155))

(declare-fun m!1324157 () Bool)

(assert (=> start!123802 m!1324157))

(declare-fun m!1324159 () Bool)

(assert (=> start!123802 m!1324159))

(declare-fun m!1324161 () Bool)

(assert (=> b!1434202 m!1324161))

(assert (=> b!1434194 m!1324125))

(assert (=> b!1434194 m!1324125))

(declare-fun m!1324163 () Bool)

(assert (=> b!1434194 m!1324163))

(declare-fun m!1324165 () Bool)

(assert (=> b!1434200 m!1324165))

(check-sat (not b!1434199) (not b!1434197) (not b!1434204) (not b!1434206) (not b!1434200) (not b!1434202) (not b!1434207) (not start!123802) (not b!1434203) (not b!1434198) (not b!1434194) (not b!1434195))
(check-sat)
