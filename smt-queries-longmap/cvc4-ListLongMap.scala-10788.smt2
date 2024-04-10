; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126230 () Bool)

(assert start!126230)

(declare-fun b!1479190 () Bool)

(declare-fun res!1005130 () Bool)

(declare-fun e!829725 () Bool)

(assert (=> b!1479190 (=> (not res!1005130) (not e!829725))))

(declare-datatypes ((array!99336 0))(
  ( (array!99337 (arr!47947 (Array (_ BitVec 32) (_ BitVec 64))) (size!48497 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99336)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479190 (= res!1005130 (validKeyInArray!0 (select (arr!47947 a!2862) i!1006)))))

(declare-fun b!1479191 () Bool)

(declare-fun res!1005123 () Bool)

(assert (=> b!1479191 (=> (not res!1005123) (not e!829725))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99336 (_ BitVec 32)) Bool)

(assert (=> b!1479191 (= res!1005123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479192 () Bool)

(declare-fun e!829727 () Bool)

(assert (=> b!1479192 (= e!829727 (not true))))

(declare-fun e!829720 () Bool)

(assert (=> b!1479192 e!829720))

(declare-fun res!1005126 () Bool)

(assert (=> b!1479192 (=> (not res!1005126) (not e!829720))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12187 0))(
  ( (MissingZero!12187 (index!51140 (_ BitVec 32))) (Found!12187 (index!51141 (_ BitVec 32))) (Intermediate!12187 (undefined!12999 Bool) (index!51142 (_ BitVec 32)) (x!132722 (_ BitVec 32))) (Undefined!12187) (MissingVacant!12187 (index!51143 (_ BitVec 32))) )
))
(declare-fun lt!645936 () SeekEntryResult!12187)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1479192 (= res!1005126 (and (= lt!645936 (Found!12187 j!93)) (or (= (select (arr!47947 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47947 a!2862) intermediateBeforeIndex!19) (select (arr!47947 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99336 (_ BitVec 32)) SeekEntryResult!12187)

(assert (=> b!1479192 (= lt!645936 (seekEntryOrOpen!0 (select (arr!47947 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479192 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49714 0))(
  ( (Unit!49715) )
))
(declare-fun lt!645934 () Unit!49714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49714)

(assert (=> b!1479192 (= lt!645934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479193 () Bool)

(declare-fun res!1005134 () Bool)

(assert (=> b!1479193 (=> (not res!1005134) (not e!829725))))

(declare-datatypes ((List!34448 0))(
  ( (Nil!34445) (Cons!34444 (h!35812 (_ BitVec 64)) (t!49142 List!34448)) )
))
(declare-fun arrayNoDuplicates!0 (array!99336 (_ BitVec 32) List!34448) Bool)

(assert (=> b!1479193 (= res!1005134 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34445))))

(declare-fun b!1479194 () Bool)

(declare-fun res!1005133 () Bool)

(assert (=> b!1479194 (=> (not res!1005133) (not e!829727))))

(declare-fun e!829722 () Bool)

(assert (=> b!1479194 (= res!1005133 e!829722)))

(declare-fun c!136554 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479194 (= c!136554 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479195 () Bool)

(declare-fun e!829719 () Bool)

(declare-fun e!829726 () Bool)

(assert (=> b!1479195 (= e!829719 e!829726)))

(declare-fun res!1005136 () Bool)

(assert (=> b!1479195 (=> (not res!1005136) (not e!829726))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99336 (_ BitVec 32)) SeekEntryResult!12187)

(assert (=> b!1479195 (= res!1005136 (= lt!645936 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47947 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479196 () Bool)

(declare-fun e!829721 () Bool)

(assert (=> b!1479196 (= e!829721 e!829727)))

(declare-fun res!1005124 () Bool)

(assert (=> b!1479196 (=> (not res!1005124) (not e!829727))))

(declare-fun lt!645932 () SeekEntryResult!12187)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479196 (= res!1005124 (= lt!645932 (Intermediate!12187 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645931 () (_ BitVec 64))

(declare-fun lt!645933 () array!99336)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99336 (_ BitVec 32)) SeekEntryResult!12187)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479196 (= lt!645932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645931 mask!2687) lt!645931 lt!645933 mask!2687))))

(assert (=> b!1479196 (= lt!645931 (select (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479197 () Bool)

(declare-fun res!1005122 () Bool)

(assert (=> b!1479197 (=> (not res!1005122) (not e!829725))))

(assert (=> b!1479197 (= res!1005122 (validKeyInArray!0 (select (arr!47947 a!2862) j!93)))))

(declare-fun b!1479198 () Bool)

(declare-fun res!1005121 () Bool)

(assert (=> b!1479198 (=> (not res!1005121) (not e!829725))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479198 (= res!1005121 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48497 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48497 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48497 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479199 () Bool)

(declare-fun res!1005132 () Bool)

(assert (=> b!1479199 (=> (not res!1005132) (not e!829721))))

(declare-fun lt!645935 () SeekEntryResult!12187)

(assert (=> b!1479199 (= res!1005132 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47947 a!2862) j!93) a!2862 mask!2687) lt!645935))))

(declare-fun b!1479200 () Bool)

(assert (=> b!1479200 (= e!829722 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645931 lt!645933 mask!2687) (seekEntryOrOpen!0 lt!645931 lt!645933 mask!2687)))))

(declare-fun b!1479202 () Bool)

(assert (=> b!1479202 (= e!829722 (= lt!645932 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645931 lt!645933 mask!2687)))))

(declare-fun b!1479203 () Bool)

(assert (=> b!1479203 (= e!829726 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479204 () Bool)

(declare-fun res!1005128 () Bool)

(assert (=> b!1479204 (=> (not res!1005128) (not e!829725))))

(assert (=> b!1479204 (= res!1005128 (and (= (size!48497 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48497 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48497 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479205 () Bool)

(declare-fun res!1005125 () Bool)

(assert (=> b!1479205 (=> (not res!1005125) (not e!829727))))

(assert (=> b!1479205 (= res!1005125 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479206 () Bool)

(declare-fun e!829723 () Bool)

(assert (=> b!1479206 (= e!829725 e!829723)))

(declare-fun res!1005135 () Bool)

(assert (=> b!1479206 (=> (not res!1005135) (not e!829723))))

(assert (=> b!1479206 (= res!1005135 (= (select (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479206 (= lt!645933 (array!99337 (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48497 a!2862)))))

(declare-fun b!1479207 () Bool)

(assert (=> b!1479207 (= e!829720 e!829719)))

(declare-fun res!1005129 () Bool)

(assert (=> b!1479207 (=> res!1005129 e!829719)))

(assert (=> b!1479207 (= res!1005129 (or (and (= (select (arr!47947 a!2862) index!646) (select (store (arr!47947 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47947 a!2862) index!646) (select (arr!47947 a!2862) j!93))) (not (= (select (arr!47947 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479201 () Bool)

(assert (=> b!1479201 (= e!829723 e!829721)))

(declare-fun res!1005131 () Bool)

(assert (=> b!1479201 (=> (not res!1005131) (not e!829721))))

(assert (=> b!1479201 (= res!1005131 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47947 a!2862) j!93) mask!2687) (select (arr!47947 a!2862) j!93) a!2862 mask!2687) lt!645935))))

(assert (=> b!1479201 (= lt!645935 (Intermediate!12187 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1005127 () Bool)

(assert (=> start!126230 (=> (not res!1005127) (not e!829725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126230 (= res!1005127 (validMask!0 mask!2687))))

(assert (=> start!126230 e!829725))

(assert (=> start!126230 true))

(declare-fun array_inv!36975 (array!99336) Bool)

(assert (=> start!126230 (array_inv!36975 a!2862)))

(assert (= (and start!126230 res!1005127) b!1479204))

(assert (= (and b!1479204 res!1005128) b!1479190))

(assert (= (and b!1479190 res!1005130) b!1479197))

(assert (= (and b!1479197 res!1005122) b!1479191))

(assert (= (and b!1479191 res!1005123) b!1479193))

(assert (= (and b!1479193 res!1005134) b!1479198))

(assert (= (and b!1479198 res!1005121) b!1479206))

(assert (= (and b!1479206 res!1005135) b!1479201))

(assert (= (and b!1479201 res!1005131) b!1479199))

(assert (= (and b!1479199 res!1005132) b!1479196))

(assert (= (and b!1479196 res!1005124) b!1479194))

(assert (= (and b!1479194 c!136554) b!1479202))

(assert (= (and b!1479194 (not c!136554)) b!1479200))

(assert (= (and b!1479194 res!1005133) b!1479205))

(assert (= (and b!1479205 res!1005125) b!1479192))

(assert (= (and b!1479192 res!1005126) b!1479207))

(assert (= (and b!1479207 (not res!1005129)) b!1479195))

(assert (= (and b!1479195 res!1005136) b!1479203))

(declare-fun m!1365075 () Bool)

(assert (=> b!1479207 m!1365075))

(declare-fun m!1365077 () Bool)

(assert (=> b!1479207 m!1365077))

(declare-fun m!1365079 () Bool)

(assert (=> b!1479207 m!1365079))

(declare-fun m!1365081 () Bool)

(assert (=> b!1479207 m!1365081))

(declare-fun m!1365083 () Bool)

(assert (=> b!1479196 m!1365083))

(assert (=> b!1479196 m!1365083))

(declare-fun m!1365085 () Bool)

(assert (=> b!1479196 m!1365085))

(assert (=> b!1479196 m!1365077))

(declare-fun m!1365087 () Bool)

(assert (=> b!1479196 m!1365087))

(assert (=> b!1479197 m!1365081))

(assert (=> b!1479197 m!1365081))

(declare-fun m!1365089 () Bool)

(assert (=> b!1479197 m!1365089))

(declare-fun m!1365091 () Bool)

(assert (=> start!126230 m!1365091))

(declare-fun m!1365093 () Bool)

(assert (=> start!126230 m!1365093))

(assert (=> b!1479201 m!1365081))

(assert (=> b!1479201 m!1365081))

(declare-fun m!1365095 () Bool)

(assert (=> b!1479201 m!1365095))

(assert (=> b!1479201 m!1365095))

(assert (=> b!1479201 m!1365081))

(declare-fun m!1365097 () Bool)

(assert (=> b!1479201 m!1365097))

(declare-fun m!1365099 () Bool)

(assert (=> b!1479190 m!1365099))

(assert (=> b!1479190 m!1365099))

(declare-fun m!1365101 () Bool)

(assert (=> b!1479190 m!1365101))

(declare-fun m!1365103 () Bool)

(assert (=> b!1479202 m!1365103))

(declare-fun m!1365105 () Bool)

(assert (=> b!1479193 m!1365105))

(declare-fun m!1365107 () Bool)

(assert (=> b!1479191 m!1365107))

(declare-fun m!1365109 () Bool)

(assert (=> b!1479200 m!1365109))

(declare-fun m!1365111 () Bool)

(assert (=> b!1479200 m!1365111))

(assert (=> b!1479195 m!1365081))

(assert (=> b!1479195 m!1365081))

(declare-fun m!1365113 () Bool)

(assert (=> b!1479195 m!1365113))

(declare-fun m!1365115 () Bool)

(assert (=> b!1479192 m!1365115))

(declare-fun m!1365117 () Bool)

(assert (=> b!1479192 m!1365117))

(assert (=> b!1479192 m!1365081))

(declare-fun m!1365119 () Bool)

(assert (=> b!1479192 m!1365119))

(declare-fun m!1365121 () Bool)

(assert (=> b!1479192 m!1365121))

(assert (=> b!1479192 m!1365081))

(assert (=> b!1479206 m!1365077))

(declare-fun m!1365123 () Bool)

(assert (=> b!1479206 m!1365123))

(assert (=> b!1479199 m!1365081))

(assert (=> b!1479199 m!1365081))

(declare-fun m!1365125 () Bool)

(assert (=> b!1479199 m!1365125))

(push 1)

