; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126084 () Bool)

(assert start!126084)

(declare-fun b!1474431 () Bool)

(declare-fun res!1000965 () Bool)

(declare-fun e!827533 () Bool)

(assert (=> b!1474431 (=> (not res!1000965) (not e!827533))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99256 0))(
  ( (array!99257 (arr!47908 (Array (_ BitVec 32) (_ BitVec 64))) (size!48459 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99256)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474431 (= res!1000965 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48459 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48459 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48459 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474432 () Bool)

(declare-fun res!1000967 () Bool)

(assert (=> b!1474432 (=> (not res!1000967) (not e!827533))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474432 (= res!1000967 (validKeyInArray!0 (select (arr!47908 a!2862) i!1006)))))

(declare-fun b!1474433 () Bool)

(declare-fun e!827531 () Bool)

(assert (=> b!1474433 (= e!827531 (not true))))

(declare-fun e!827534 () Bool)

(assert (=> b!1474433 e!827534))

(declare-fun res!1000969 () Bool)

(assert (=> b!1474433 (=> (not res!1000969) (not e!827534))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99256 (_ BitVec 32)) Bool)

(assert (=> b!1474433 (= res!1000969 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49463 0))(
  ( (Unit!49464) )
))
(declare-fun lt!644293 () Unit!49463)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49463)

(assert (=> b!1474433 (= lt!644293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474434 () Bool)

(declare-fun res!1000974 () Bool)

(declare-fun e!827535 () Bool)

(assert (=> b!1474434 (=> (not res!1000974) (not e!827535))))

(declare-datatypes ((SeekEntryResult!12045 0))(
  ( (MissingZero!12045 (index!50572 (_ BitVec 32))) (Found!12045 (index!50573 (_ BitVec 32))) (Intermediate!12045 (undefined!12857 Bool) (index!50574 (_ BitVec 32)) (x!132337 (_ BitVec 32))) (Undefined!12045) (MissingVacant!12045 (index!50575 (_ BitVec 32))) )
))
(declare-fun lt!644294 () SeekEntryResult!12045)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99256 (_ BitVec 32)) SeekEntryResult!12045)

(assert (=> b!1474434 (= res!1000974 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47908 a!2862) j!93) a!2862 mask!2687) lt!644294))))

(declare-fun res!1000963 () Bool)

(assert (=> start!126084 (=> (not res!1000963) (not e!827533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126084 (= res!1000963 (validMask!0 mask!2687))))

(assert (=> start!126084 e!827533))

(assert (=> start!126084 true))

(declare-fun array_inv!37189 (array!99256) Bool)

(assert (=> start!126084 (array_inv!37189 a!2862)))

(declare-fun b!1474435 () Bool)

(declare-fun res!1000973 () Bool)

(assert (=> b!1474435 (=> (not res!1000973) (not e!827533))))

(assert (=> b!1474435 (= res!1000973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474436 () Bool)

(declare-fun e!827530 () Bool)

(assert (=> b!1474436 (= e!827530 e!827535)))

(declare-fun res!1000971 () Bool)

(assert (=> b!1474436 (=> (not res!1000971) (not e!827535))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474436 (= res!1000971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47908 a!2862) j!93) mask!2687) (select (arr!47908 a!2862) j!93) a!2862 mask!2687) lt!644294))))

(assert (=> b!1474436 (= lt!644294 (Intermediate!12045 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474437 () Bool)

(declare-fun res!1000972 () Bool)

(assert (=> b!1474437 (=> (not res!1000972) (not e!827531))))

(declare-fun e!827529 () Bool)

(assert (=> b!1474437 (= res!1000972 e!827529)))

(declare-fun c!136258 () Bool)

(assert (=> b!1474437 (= c!136258 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!644295 () array!99256)

(declare-fun lt!644296 () SeekEntryResult!12045)

(declare-fun b!1474438 () Bool)

(declare-fun lt!644292 () (_ BitVec 64))

(assert (=> b!1474438 (= e!827529 (= lt!644296 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644292 lt!644295 mask!2687)))))

(declare-fun b!1474439 () Bool)

(declare-fun res!1000976 () Bool)

(assert (=> b!1474439 (=> (not res!1000976) (not e!827533))))

(declare-datatypes ((List!34396 0))(
  ( (Nil!34393) (Cons!34392 (h!35762 (_ BitVec 64)) (t!49082 List!34396)) )
))
(declare-fun arrayNoDuplicates!0 (array!99256 (_ BitVec 32) List!34396) Bool)

(assert (=> b!1474439 (= res!1000976 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34393))))

(declare-fun b!1474440 () Bool)

(assert (=> b!1474440 (= e!827535 e!827531)))

(declare-fun res!1000962 () Bool)

(assert (=> b!1474440 (=> (not res!1000962) (not e!827531))))

(assert (=> b!1474440 (= res!1000962 (= lt!644296 (Intermediate!12045 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474440 (= lt!644296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644292 mask!2687) lt!644292 lt!644295 mask!2687))))

(assert (=> b!1474440 (= lt!644292 (select (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474441 () Bool)

(declare-fun res!1000968 () Bool)

(assert (=> b!1474441 (=> (not res!1000968) (not e!827533))))

(assert (=> b!1474441 (= res!1000968 (validKeyInArray!0 (select (arr!47908 a!2862) j!93)))))

(declare-fun b!1474442 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99256 (_ BitVec 32)) SeekEntryResult!12045)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99256 (_ BitVec 32)) SeekEntryResult!12045)

(assert (=> b!1474442 (= e!827529 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644292 lt!644295 mask!2687) (seekEntryOrOpen!0 lt!644292 lt!644295 mask!2687)))))

(declare-fun b!1474443 () Bool)

(declare-fun res!1000964 () Bool)

(assert (=> b!1474443 (=> (not res!1000964) (not e!827534))))

(assert (=> b!1474443 (= res!1000964 (= (seekEntryOrOpen!0 (select (arr!47908 a!2862) j!93) a!2862 mask!2687) (Found!12045 j!93)))))

(declare-fun b!1474444 () Bool)

(declare-fun res!1000970 () Bool)

(assert (=> b!1474444 (=> (not res!1000970) (not e!827533))))

(assert (=> b!1474444 (= res!1000970 (and (= (size!48459 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48459 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48459 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474445 () Bool)

(assert (=> b!1474445 (= e!827533 e!827530)))

(declare-fun res!1000966 () Bool)

(assert (=> b!1474445 (=> (not res!1000966) (not e!827530))))

(assert (=> b!1474445 (= res!1000966 (= (select (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474445 (= lt!644295 (array!99257 (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48459 a!2862)))))

(declare-fun b!1474446 () Bool)

(declare-fun res!1000975 () Bool)

(assert (=> b!1474446 (=> (not res!1000975) (not e!827531))))

(assert (=> b!1474446 (= res!1000975 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474447 () Bool)

(assert (=> b!1474447 (= e!827534 (or (= (select (arr!47908 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47908 a!2862) intermediateBeforeIndex!19) (select (arr!47908 a!2862) j!93))))))

(assert (= (and start!126084 res!1000963) b!1474444))

(assert (= (and b!1474444 res!1000970) b!1474432))

(assert (= (and b!1474432 res!1000967) b!1474441))

(assert (= (and b!1474441 res!1000968) b!1474435))

(assert (= (and b!1474435 res!1000973) b!1474439))

(assert (= (and b!1474439 res!1000976) b!1474431))

(assert (= (and b!1474431 res!1000965) b!1474445))

(assert (= (and b!1474445 res!1000966) b!1474436))

(assert (= (and b!1474436 res!1000971) b!1474434))

(assert (= (and b!1474434 res!1000974) b!1474440))

(assert (= (and b!1474440 res!1000962) b!1474437))

(assert (= (and b!1474437 c!136258) b!1474438))

(assert (= (and b!1474437 (not c!136258)) b!1474442))

(assert (= (and b!1474437 res!1000972) b!1474446))

(assert (= (and b!1474446 res!1000975) b!1474433))

(assert (= (and b!1474433 res!1000969) b!1474443))

(assert (= (and b!1474443 res!1000964) b!1474447))

(declare-fun m!1361095 () Bool)

(assert (=> b!1474435 m!1361095))

(declare-fun m!1361097 () Bool)

(assert (=> b!1474433 m!1361097))

(declare-fun m!1361099 () Bool)

(assert (=> b!1474433 m!1361099))

(declare-fun m!1361101 () Bool)

(assert (=> b!1474432 m!1361101))

(assert (=> b!1474432 m!1361101))

(declare-fun m!1361103 () Bool)

(assert (=> b!1474432 m!1361103))

(declare-fun m!1361105 () Bool)

(assert (=> start!126084 m!1361105))

(declare-fun m!1361107 () Bool)

(assert (=> start!126084 m!1361107))

(declare-fun m!1361109 () Bool)

(assert (=> b!1474440 m!1361109))

(assert (=> b!1474440 m!1361109))

(declare-fun m!1361111 () Bool)

(assert (=> b!1474440 m!1361111))

(declare-fun m!1361113 () Bool)

(assert (=> b!1474440 m!1361113))

(declare-fun m!1361115 () Bool)

(assert (=> b!1474440 m!1361115))

(declare-fun m!1361117 () Bool)

(assert (=> b!1474436 m!1361117))

(assert (=> b!1474436 m!1361117))

(declare-fun m!1361119 () Bool)

(assert (=> b!1474436 m!1361119))

(assert (=> b!1474436 m!1361119))

(assert (=> b!1474436 m!1361117))

(declare-fun m!1361121 () Bool)

(assert (=> b!1474436 m!1361121))

(assert (=> b!1474441 m!1361117))

(assert (=> b!1474441 m!1361117))

(declare-fun m!1361123 () Bool)

(assert (=> b!1474441 m!1361123))

(declare-fun m!1361125 () Bool)

(assert (=> b!1474447 m!1361125))

(assert (=> b!1474447 m!1361117))

(assert (=> b!1474443 m!1361117))

(assert (=> b!1474443 m!1361117))

(declare-fun m!1361127 () Bool)

(assert (=> b!1474443 m!1361127))

(declare-fun m!1361129 () Bool)

(assert (=> b!1474438 m!1361129))

(declare-fun m!1361131 () Bool)

(assert (=> b!1474442 m!1361131))

(declare-fun m!1361133 () Bool)

(assert (=> b!1474442 m!1361133))

(declare-fun m!1361135 () Bool)

(assert (=> b!1474439 m!1361135))

(assert (=> b!1474445 m!1361113))

(declare-fun m!1361137 () Bool)

(assert (=> b!1474445 m!1361137))

(assert (=> b!1474434 m!1361117))

(assert (=> b!1474434 m!1361117))

(declare-fun m!1361139 () Bool)

(assert (=> b!1474434 m!1361139))

(check-sat (not b!1474439) (not b!1474432) (not b!1474443) (not b!1474441) (not b!1474435) (not b!1474433) (not b!1474440) (not b!1474434) (not start!126084) (not b!1474438) (not b!1474442) (not b!1474436))
(check-sat)
