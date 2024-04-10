; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123546 () Bool)

(assert start!123546)

(declare-fun b!1432319 () Bool)

(declare-fun res!966196 () Bool)

(declare-fun e!808549 () Bool)

(assert (=> b!1432319 (=> (not res!966196) (not e!808549))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97518 0))(
  ( (array!97519 (arr!47066 (Array (_ BitVec 32) (_ BitVec 64))) (size!47616 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97518)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1432319 (= res!966196 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47616 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47616 a!2831))))))

(declare-fun b!1432320 () Bool)

(declare-fun res!966186 () Bool)

(assert (=> b!1432320 (=> (not res!966186) (not e!808549))))

(declare-datatypes ((List!33576 0))(
  ( (Nil!33573) (Cons!33572 (h!34895 (_ BitVec 64)) (t!48270 List!33576)) )
))
(declare-fun arrayNoDuplicates!0 (array!97518 (_ BitVec 32) List!33576) Bool)

(assert (=> b!1432320 (= res!966186 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33573))))

(declare-fun b!1432321 () Bool)

(declare-fun res!966183 () Bool)

(declare-fun e!808553 () Bool)

(assert (=> b!1432321 (=> (not res!966183) (not e!808553))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432321 (= res!966183 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432322 () Bool)

(declare-fun res!966192 () Bool)

(assert (=> b!1432322 (=> (not res!966192) (not e!808553))))

(declare-datatypes ((SeekEntryResult!11345 0))(
  ( (MissingZero!11345 (index!47772 (_ BitVec 32))) (Found!11345 (index!47773 (_ BitVec 32))) (Intermediate!11345 (undefined!12157 Bool) (index!47774 (_ BitVec 32)) (x!129419 (_ BitVec 32))) (Undefined!11345) (MissingVacant!11345 (index!47775 (_ BitVec 32))) )
))
(declare-fun lt!630544 () SeekEntryResult!11345)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97518 (_ BitVec 32)) SeekEntryResult!11345)

(assert (=> b!1432322 (= res!966192 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47066 a!2831) j!81) a!2831 mask!2608) lt!630544))))

(declare-fun b!1432323 () Bool)

(declare-fun res!966184 () Bool)

(assert (=> b!1432323 (=> (not res!966184) (not e!808549))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432323 (= res!966184 (validKeyInArray!0 (select (arr!47066 a!2831) i!982)))))

(declare-fun b!1432324 () Bool)

(declare-fun res!966193 () Bool)

(assert (=> b!1432324 (=> (not res!966193) (not e!808553))))

(declare-fun lt!630546 () SeekEntryResult!11345)

(declare-fun lt!630543 () array!97518)

(declare-fun lt!630545 () (_ BitVec 64))

(assert (=> b!1432324 (= res!966193 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630545 lt!630543 mask!2608) lt!630546))))

(declare-fun b!1432325 () Bool)

(declare-fun e!808552 () Bool)

(assert (=> b!1432325 (= e!808552 e!808553)))

(declare-fun res!966194 () Bool)

(assert (=> b!1432325 (=> (not res!966194) (not e!808553))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432325 (= res!966194 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630545 mask!2608) lt!630545 lt!630543 mask!2608) lt!630546))))

(assert (=> b!1432325 (= lt!630546 (Intermediate!11345 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432325 (= lt!630545 (select (store (arr!47066 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432325 (= lt!630543 (array!97519 (store (arr!47066 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47616 a!2831)))))

(declare-fun b!1432326 () Bool)

(declare-fun e!808548 () Bool)

(assert (=> b!1432326 (= e!808553 (not e!808548))))

(declare-fun res!966191 () Bool)

(assert (=> b!1432326 (=> res!966191 e!808548)))

(assert (=> b!1432326 (= res!966191 (or (= (select (arr!47066 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47066 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47066 a!2831) index!585) (select (arr!47066 a!2831) j!81)) (= (select (store (arr!47066 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808550 () Bool)

(assert (=> b!1432326 e!808550))

(declare-fun res!966187 () Bool)

(assert (=> b!1432326 (=> (not res!966187) (not e!808550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97518 (_ BitVec 32)) Bool)

(assert (=> b!1432326 (= res!966187 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48436 0))(
  ( (Unit!48437) )
))
(declare-fun lt!630542 () Unit!48436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48436)

(assert (=> b!1432326 (= lt!630542 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432327 () Bool)

(declare-fun res!966195 () Bool)

(assert (=> b!1432327 (=> (not res!966195) (not e!808549))))

(assert (=> b!1432327 (= res!966195 (validKeyInArray!0 (select (arr!47066 a!2831) j!81)))))

(declare-fun b!1432329 () Bool)

(declare-fun res!966188 () Bool)

(assert (=> b!1432329 (=> (not res!966188) (not e!808549))))

(assert (=> b!1432329 (= res!966188 (and (= (size!47616 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47616 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47616 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432330 () Bool)

(assert (=> b!1432330 (= e!808548 true)))

(declare-fun lt!630541 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432330 (= lt!630541 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432328 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97518 (_ BitVec 32)) SeekEntryResult!11345)

(assert (=> b!1432328 (= e!808550 (= (seekEntryOrOpen!0 (select (arr!47066 a!2831) j!81) a!2831 mask!2608) (Found!11345 j!81)))))

(declare-fun res!966190 () Bool)

(assert (=> start!123546 (=> (not res!966190) (not e!808549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123546 (= res!966190 (validMask!0 mask!2608))))

(assert (=> start!123546 e!808549))

(assert (=> start!123546 true))

(declare-fun array_inv!36094 (array!97518) Bool)

(assert (=> start!123546 (array_inv!36094 a!2831)))

(declare-fun b!1432331 () Bool)

(assert (=> b!1432331 (= e!808549 e!808552)))

(declare-fun res!966185 () Bool)

(assert (=> b!1432331 (=> (not res!966185) (not e!808552))))

(assert (=> b!1432331 (= res!966185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47066 a!2831) j!81) mask!2608) (select (arr!47066 a!2831) j!81) a!2831 mask!2608) lt!630544))))

(assert (=> b!1432331 (= lt!630544 (Intermediate!11345 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432332 () Bool)

(declare-fun res!966189 () Bool)

(assert (=> b!1432332 (=> (not res!966189) (not e!808549))))

(assert (=> b!1432332 (= res!966189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123546 res!966190) b!1432329))

(assert (= (and b!1432329 res!966188) b!1432323))

(assert (= (and b!1432323 res!966184) b!1432327))

(assert (= (and b!1432327 res!966195) b!1432332))

(assert (= (and b!1432332 res!966189) b!1432320))

(assert (= (and b!1432320 res!966186) b!1432319))

(assert (= (and b!1432319 res!966196) b!1432331))

(assert (= (and b!1432331 res!966185) b!1432325))

(assert (= (and b!1432325 res!966194) b!1432322))

(assert (= (and b!1432322 res!966192) b!1432324))

(assert (= (and b!1432324 res!966193) b!1432321))

(assert (= (and b!1432321 res!966183) b!1432326))

(assert (= (and b!1432326 res!966187) b!1432328))

(assert (= (and b!1432326 (not res!966191)) b!1432330))

(declare-fun m!1322121 () Bool)

(assert (=> start!123546 m!1322121))

(declare-fun m!1322123 () Bool)

(assert (=> start!123546 m!1322123))

(declare-fun m!1322125 () Bool)

(assert (=> b!1432328 m!1322125))

(assert (=> b!1432328 m!1322125))

(declare-fun m!1322127 () Bool)

(assert (=> b!1432328 m!1322127))

(assert (=> b!1432322 m!1322125))

(assert (=> b!1432322 m!1322125))

(declare-fun m!1322129 () Bool)

(assert (=> b!1432322 m!1322129))

(declare-fun m!1322131 () Bool)

(assert (=> b!1432323 m!1322131))

(assert (=> b!1432323 m!1322131))

(declare-fun m!1322133 () Bool)

(assert (=> b!1432323 m!1322133))

(declare-fun m!1322135 () Bool)

(assert (=> b!1432330 m!1322135))

(declare-fun m!1322137 () Bool)

(assert (=> b!1432320 m!1322137))

(declare-fun m!1322139 () Bool)

(assert (=> b!1432325 m!1322139))

(assert (=> b!1432325 m!1322139))

(declare-fun m!1322141 () Bool)

(assert (=> b!1432325 m!1322141))

(declare-fun m!1322143 () Bool)

(assert (=> b!1432325 m!1322143))

(declare-fun m!1322145 () Bool)

(assert (=> b!1432325 m!1322145))

(assert (=> b!1432331 m!1322125))

(assert (=> b!1432331 m!1322125))

(declare-fun m!1322147 () Bool)

(assert (=> b!1432331 m!1322147))

(assert (=> b!1432331 m!1322147))

(assert (=> b!1432331 m!1322125))

(declare-fun m!1322149 () Bool)

(assert (=> b!1432331 m!1322149))

(declare-fun m!1322151 () Bool)

(assert (=> b!1432324 m!1322151))

(assert (=> b!1432326 m!1322143))

(declare-fun m!1322153 () Bool)

(assert (=> b!1432326 m!1322153))

(declare-fun m!1322155 () Bool)

(assert (=> b!1432326 m!1322155))

(declare-fun m!1322157 () Bool)

(assert (=> b!1432326 m!1322157))

(assert (=> b!1432326 m!1322125))

(declare-fun m!1322159 () Bool)

(assert (=> b!1432326 m!1322159))

(declare-fun m!1322161 () Bool)

(assert (=> b!1432332 m!1322161))

(assert (=> b!1432327 m!1322125))

(assert (=> b!1432327 m!1322125))

(declare-fun m!1322163 () Bool)

(assert (=> b!1432327 m!1322163))

(push 1)

