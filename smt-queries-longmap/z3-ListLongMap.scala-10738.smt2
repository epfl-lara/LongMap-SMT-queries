; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125536 () Bool)

(assert start!125536)

(declare-fun b!1468968 () Bool)

(declare-fun res!997622 () Bool)

(declare-fun e!824712 () Bool)

(assert (=> b!1468968 (=> (not res!997622) (not e!824712))))

(declare-datatypes ((array!98962 0))(
  ( (array!98963 (arr!47770 (Array (_ BitVec 32) (_ BitVec 64))) (size!48322 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98962)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468968 (= res!997622 (validKeyInArray!0 (select (arr!47770 a!2862) i!1006)))))

(declare-fun b!1468969 () Bool)

(declare-fun e!824714 () Bool)

(declare-fun e!824711 () Bool)

(assert (=> b!1468969 (= e!824714 e!824711)))

(declare-fun res!997628 () Bool)

(assert (=> b!1468969 (=> (not res!997628) (not e!824711))))

(declare-datatypes ((SeekEntryResult!12035 0))(
  ( (MissingZero!12035 (index!50532 (_ BitVec 32))) (Found!12035 (index!50533 (_ BitVec 32))) (Intermediate!12035 (undefined!12847 Bool) (index!50534 (_ BitVec 32)) (x!132111 (_ BitVec 32))) (Undefined!12035) (MissingVacant!12035 (index!50535 (_ BitVec 32))) )
))
(declare-fun lt!642223 () SeekEntryResult!12035)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98962 (_ BitVec 32)) SeekEntryResult!12035)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468969 (= res!997628 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47770 a!2862) j!93) mask!2687) (select (arr!47770 a!2862) j!93) a!2862 mask!2687) lt!642223))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468969 (= lt!642223 (Intermediate!12035 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!997629 () Bool)

(assert (=> start!125536 (=> (not res!997629) (not e!824712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125536 (= res!997629 (validMask!0 mask!2687))))

(assert (=> start!125536 e!824712))

(assert (=> start!125536 true))

(declare-fun array_inv!37003 (array!98962) Bool)

(assert (=> start!125536 (array_inv!37003 a!2862)))

(declare-fun b!1468970 () Bool)

(declare-fun res!997620 () Bool)

(assert (=> b!1468970 (=> (not res!997620) (not e!824712))))

(assert (=> b!1468970 (= res!997620 (validKeyInArray!0 (select (arr!47770 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!642225 () array!98962)

(declare-fun e!824715 () Bool)

(declare-fun b!1468971 () Bool)

(declare-fun lt!642222 () SeekEntryResult!12035)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!642221 () (_ BitVec 64))

(assert (=> b!1468971 (= e!824715 (not (= lt!642222 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642221 lt!642225 mask!2687))))))

(declare-fun b!1468972 () Bool)

(declare-fun res!997623 () Bool)

(assert (=> b!1468972 (=> (not res!997623) (not e!824712))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468972 (= res!997623 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48322 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48322 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48322 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1468973 () Bool)

(declare-fun res!997626 () Bool)

(assert (=> b!1468973 (=> (not res!997626) (not e!824712))))

(assert (=> b!1468973 (= res!997626 (and (= (size!48322 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48322 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48322 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468974 () Bool)

(declare-fun res!997630 () Bool)

(assert (=> b!1468974 (=> (not res!997630) (not e!824711))))

(assert (=> b!1468974 (= res!997630 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47770 a!2862) j!93) a!2862 mask!2687) lt!642223))))

(declare-fun b!1468975 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98962 (_ BitVec 32)) SeekEntryResult!12035)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98962 (_ BitVec 32)) SeekEntryResult!12035)

(assert (=> b!1468975 (= e!824715 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642221 lt!642225 mask!2687) (seekEntryOrOpen!0 lt!642221 lt!642225 mask!2687))))))

(declare-fun b!1468976 () Bool)

(assert (=> b!1468976 (= e!824712 e!824714)))

(declare-fun res!997627 () Bool)

(assert (=> b!1468976 (=> (not res!997627) (not e!824714))))

(assert (=> b!1468976 (= res!997627 (= (select (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1468976 (= lt!642225 (array!98963 (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48322 a!2862)))))

(declare-fun b!1468977 () Bool)

(declare-fun res!997625 () Bool)

(assert (=> b!1468977 (=> (not res!997625) (not e!824712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98962 (_ BitVec 32)) Bool)

(assert (=> b!1468977 (= res!997625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468978 () Bool)

(declare-fun e!824710 () Bool)

(assert (=> b!1468978 (= e!824710 false)))

(declare-fun lt!642224 () Bool)

(assert (=> b!1468978 (= lt!642224 e!824715)))

(declare-fun c!135187 () Bool)

(assert (=> b!1468978 (= c!135187 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1468979 () Bool)

(declare-fun res!997624 () Bool)

(assert (=> b!1468979 (=> (not res!997624) (not e!824712))))

(declare-datatypes ((List!34349 0))(
  ( (Nil!34346) (Cons!34345 (h!35695 (_ BitVec 64)) (t!49035 List!34349)) )
))
(declare-fun arrayNoDuplicates!0 (array!98962 (_ BitVec 32) List!34349) Bool)

(assert (=> b!1468979 (= res!997624 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34346))))

(declare-fun b!1468980 () Bool)

(assert (=> b!1468980 (= e!824711 e!824710)))

(declare-fun res!997621 () Bool)

(assert (=> b!1468980 (=> (not res!997621) (not e!824710))))

(assert (=> b!1468980 (= res!997621 (= lt!642222 (Intermediate!12035 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1468980 (= lt!642222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642221 mask!2687) lt!642221 lt!642225 mask!2687))))

(assert (=> b!1468980 (= lt!642221 (select (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125536 res!997629) b!1468973))

(assert (= (and b!1468973 res!997626) b!1468968))

(assert (= (and b!1468968 res!997622) b!1468970))

(assert (= (and b!1468970 res!997620) b!1468977))

(assert (= (and b!1468977 res!997625) b!1468979))

(assert (= (and b!1468979 res!997624) b!1468972))

(assert (= (and b!1468972 res!997623) b!1468976))

(assert (= (and b!1468976 res!997627) b!1468969))

(assert (= (and b!1468969 res!997628) b!1468974))

(assert (= (and b!1468974 res!997630) b!1468980))

(assert (= (and b!1468980 res!997621) b!1468978))

(assert (= (and b!1468978 c!135187) b!1468971))

(assert (= (and b!1468978 (not c!135187)) b!1468975))

(declare-fun m!1355673 () Bool)

(assert (=> b!1468969 m!1355673))

(assert (=> b!1468969 m!1355673))

(declare-fun m!1355675 () Bool)

(assert (=> b!1468969 m!1355675))

(assert (=> b!1468969 m!1355675))

(assert (=> b!1468969 m!1355673))

(declare-fun m!1355677 () Bool)

(assert (=> b!1468969 m!1355677))

(declare-fun m!1355679 () Bool)

(assert (=> b!1468976 m!1355679))

(declare-fun m!1355681 () Bool)

(assert (=> b!1468976 m!1355681))

(declare-fun m!1355683 () Bool)

(assert (=> start!125536 m!1355683))

(declare-fun m!1355685 () Bool)

(assert (=> start!125536 m!1355685))

(assert (=> b!1468974 m!1355673))

(assert (=> b!1468974 m!1355673))

(declare-fun m!1355687 () Bool)

(assert (=> b!1468974 m!1355687))

(declare-fun m!1355689 () Bool)

(assert (=> b!1468979 m!1355689))

(assert (=> b!1468970 m!1355673))

(assert (=> b!1468970 m!1355673))

(declare-fun m!1355691 () Bool)

(assert (=> b!1468970 m!1355691))

(declare-fun m!1355693 () Bool)

(assert (=> b!1468968 m!1355693))

(assert (=> b!1468968 m!1355693))

(declare-fun m!1355695 () Bool)

(assert (=> b!1468968 m!1355695))

(declare-fun m!1355697 () Bool)

(assert (=> b!1468975 m!1355697))

(declare-fun m!1355699 () Bool)

(assert (=> b!1468975 m!1355699))

(declare-fun m!1355701 () Bool)

(assert (=> b!1468971 m!1355701))

(declare-fun m!1355703 () Bool)

(assert (=> b!1468977 m!1355703))

(declare-fun m!1355705 () Bool)

(assert (=> b!1468980 m!1355705))

(assert (=> b!1468980 m!1355705))

(declare-fun m!1355707 () Bool)

(assert (=> b!1468980 m!1355707))

(assert (=> b!1468980 m!1355679))

(declare-fun m!1355709 () Bool)

(assert (=> b!1468980 m!1355709))

(check-sat (not b!1468975) (not b!1468968) (not b!1468971) (not b!1468980) (not start!125536) (not b!1468974) (not b!1468977) (not b!1468969) (not b!1468970) (not b!1468979))
(check-sat)
