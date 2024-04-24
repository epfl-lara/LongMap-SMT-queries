; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127380 () Bool)

(assert start!127380)

(declare-fun b!1495472 () Bool)

(declare-fun e!837835 () Bool)

(assert (=> b!1495472 (= e!837835 true)))

(declare-fun lt!651774 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495472 (= lt!651774 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1495473 () Bool)

(declare-fun res!1016826 () Bool)

(declare-fun e!837838 () Bool)

(assert (=> b!1495473 (=> (not res!1016826) (not e!837838))))

(declare-datatypes ((array!99865 0))(
  ( (array!99866 (arr!48196 (Array (_ BitVec 32) (_ BitVec 64))) (size!48747 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99865)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495473 (= res!1016826 (validKeyInArray!0 (select (arr!48196 a!2862) j!93)))))

(declare-fun e!837840 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1495474 () Bool)

(assert (=> b!1495474 (= e!837840 (or (= (select (arr!48196 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48196 a!2862) intermediateBeforeIndex!19) (select (arr!48196 a!2862) j!93))))))

(declare-fun b!1495475 () Bool)

(declare-fun res!1016823 () Bool)

(assert (=> b!1495475 (=> (not res!1016823) (not e!837840))))

(declare-datatypes ((SeekEntryResult!12333 0))(
  ( (MissingZero!12333 (index!51724 (_ BitVec 32))) (Found!12333 (index!51725 (_ BitVec 32))) (Intermediate!12333 (undefined!13145 Bool) (index!51726 (_ BitVec 32)) (x!133510 (_ BitVec 32))) (Undefined!12333) (MissingVacant!12333 (index!51727 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99865 (_ BitVec 32)) SeekEntryResult!12333)

(assert (=> b!1495475 (= res!1016823 (= (seekEntryOrOpen!0 (select (arr!48196 a!2862) j!93) a!2862 mask!2687) (Found!12333 j!93)))))

(declare-fun b!1495476 () Bool)

(declare-fun res!1016824 () Bool)

(declare-fun e!837836 () Bool)

(assert (=> b!1495476 (=> (not res!1016824) (not e!837836))))

(declare-fun e!837839 () Bool)

(assert (=> b!1495476 (= res!1016824 e!837839)))

(declare-fun c!138865 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495476 (= c!138865 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1016837 () Bool)

(assert (=> start!127380 (=> (not res!1016837) (not e!837838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127380 (= res!1016837 (validMask!0 mask!2687))))

(assert (=> start!127380 e!837838))

(assert (=> start!127380 true))

(declare-fun array_inv!37477 (array!99865) Bool)

(assert (=> start!127380 (array_inv!37477 a!2862)))

(declare-fun b!1495477 () Bool)

(declare-fun e!837837 () Bool)

(assert (=> b!1495477 (= e!837837 e!837836)))

(declare-fun res!1016836 () Bool)

(assert (=> b!1495477 (=> (not res!1016836) (not e!837836))))

(declare-fun lt!651775 () SeekEntryResult!12333)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1495477 (= res!1016836 (= lt!651775 (Intermediate!12333 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651770 () array!99865)

(declare-fun lt!651773 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99865 (_ BitVec 32)) SeekEntryResult!12333)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495477 (= lt!651775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651773 mask!2687) lt!651773 lt!651770 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1495477 (= lt!651773 (select (store (arr!48196 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495478 () Bool)

(declare-fun res!1016831 () Bool)

(assert (=> b!1495478 (=> (not res!1016831) (not e!837837))))

(declare-fun lt!651772 () SeekEntryResult!12333)

(assert (=> b!1495478 (= res!1016831 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48196 a!2862) j!93) a!2862 mask!2687) lt!651772))))

(declare-fun b!1495479 () Bool)

(assert (=> b!1495479 (= e!837836 (not e!837835))))

(declare-fun res!1016833 () Bool)

(assert (=> b!1495479 (=> res!1016833 e!837835)))

(assert (=> b!1495479 (= res!1016833 (or (and (= (select (arr!48196 a!2862) index!646) (select (store (arr!48196 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48196 a!2862) index!646) (select (arr!48196 a!2862) j!93))) (= (select (arr!48196 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495479 e!837840))

(declare-fun res!1016834 () Bool)

(assert (=> b!1495479 (=> (not res!1016834) (not e!837840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99865 (_ BitVec 32)) Bool)

(assert (=> b!1495479 (= res!1016834 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50039 0))(
  ( (Unit!50040) )
))
(declare-fun lt!651771 () Unit!50039)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50039)

(assert (=> b!1495479 (= lt!651771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495480 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99865 (_ BitVec 32)) SeekEntryResult!12333)

(assert (=> b!1495480 (= e!837839 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651773 lt!651770 mask!2687) (seekEntryOrOpen!0 lt!651773 lt!651770 mask!2687)))))

(declare-fun b!1495481 () Bool)

(declare-fun e!837834 () Bool)

(assert (=> b!1495481 (= e!837838 e!837834)))

(declare-fun res!1016832 () Bool)

(assert (=> b!1495481 (=> (not res!1016832) (not e!837834))))

(assert (=> b!1495481 (= res!1016832 (= (select (store (arr!48196 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495481 (= lt!651770 (array!99866 (store (arr!48196 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48747 a!2862)))))

(declare-fun b!1495482 () Bool)

(declare-fun res!1016829 () Bool)

(assert (=> b!1495482 (=> (not res!1016829) (not e!837838))))

(assert (=> b!1495482 (= res!1016829 (and (= (size!48747 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48747 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48747 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495483 () Bool)

(declare-fun res!1016828 () Bool)

(assert (=> b!1495483 (=> (not res!1016828) (not e!837836))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1495483 (= res!1016828 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495484 () Bool)

(assert (=> b!1495484 (= e!837834 e!837837)))

(declare-fun res!1016830 () Bool)

(assert (=> b!1495484 (=> (not res!1016830) (not e!837837))))

(assert (=> b!1495484 (= res!1016830 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48196 a!2862) j!93) mask!2687) (select (arr!48196 a!2862) j!93) a!2862 mask!2687) lt!651772))))

(assert (=> b!1495484 (= lt!651772 (Intermediate!12333 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495485 () Bool)

(declare-fun res!1016835 () Bool)

(assert (=> b!1495485 (=> (not res!1016835) (not e!837838))))

(assert (=> b!1495485 (= res!1016835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495486 () Bool)

(declare-fun res!1016827 () Bool)

(assert (=> b!1495486 (=> (not res!1016827) (not e!837838))))

(assert (=> b!1495486 (= res!1016827 (validKeyInArray!0 (select (arr!48196 a!2862) i!1006)))))

(declare-fun b!1495487 () Bool)

(assert (=> b!1495487 (= e!837839 (= lt!651775 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651773 lt!651770 mask!2687)))))

(declare-fun b!1495488 () Bool)

(declare-fun res!1016822 () Bool)

(assert (=> b!1495488 (=> (not res!1016822) (not e!837838))))

(declare-datatypes ((List!34684 0))(
  ( (Nil!34681) (Cons!34680 (h!36083 (_ BitVec 64)) (t!49370 List!34684)) )
))
(declare-fun arrayNoDuplicates!0 (array!99865 (_ BitVec 32) List!34684) Bool)

(assert (=> b!1495488 (= res!1016822 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34681))))

(declare-fun b!1495489 () Bool)

(declare-fun res!1016825 () Bool)

(assert (=> b!1495489 (=> (not res!1016825) (not e!837838))))

(assert (=> b!1495489 (= res!1016825 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48747 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48747 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48747 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!127380 res!1016837) b!1495482))

(assert (= (and b!1495482 res!1016829) b!1495486))

(assert (= (and b!1495486 res!1016827) b!1495473))

(assert (= (and b!1495473 res!1016826) b!1495485))

(assert (= (and b!1495485 res!1016835) b!1495488))

(assert (= (and b!1495488 res!1016822) b!1495489))

(assert (= (and b!1495489 res!1016825) b!1495481))

(assert (= (and b!1495481 res!1016832) b!1495484))

(assert (= (and b!1495484 res!1016830) b!1495478))

(assert (= (and b!1495478 res!1016831) b!1495477))

(assert (= (and b!1495477 res!1016836) b!1495476))

(assert (= (and b!1495476 c!138865) b!1495487))

(assert (= (and b!1495476 (not c!138865)) b!1495480))

(assert (= (and b!1495476 res!1016824) b!1495483))

(assert (= (and b!1495483 res!1016828) b!1495479))

(assert (= (and b!1495479 res!1016834) b!1495475))

(assert (= (and b!1495475 res!1016823) b!1495474))

(assert (= (and b!1495479 (not res!1016833)) b!1495472))

(declare-fun m!1379251 () Bool)

(assert (=> b!1495475 m!1379251))

(assert (=> b!1495475 m!1379251))

(declare-fun m!1379253 () Bool)

(assert (=> b!1495475 m!1379253))

(assert (=> b!1495473 m!1379251))

(assert (=> b!1495473 m!1379251))

(declare-fun m!1379255 () Bool)

(assert (=> b!1495473 m!1379255))

(declare-fun m!1379257 () Bool)

(assert (=> start!127380 m!1379257))

(declare-fun m!1379259 () Bool)

(assert (=> start!127380 m!1379259))

(declare-fun m!1379261 () Bool)

(assert (=> b!1495472 m!1379261))

(declare-fun m!1379263 () Bool)

(assert (=> b!1495474 m!1379263))

(assert (=> b!1495474 m!1379251))

(declare-fun m!1379265 () Bool)

(assert (=> b!1495488 m!1379265))

(declare-fun m!1379267 () Bool)

(assert (=> b!1495479 m!1379267))

(declare-fun m!1379269 () Bool)

(assert (=> b!1495479 m!1379269))

(declare-fun m!1379271 () Bool)

(assert (=> b!1495479 m!1379271))

(declare-fun m!1379273 () Bool)

(assert (=> b!1495479 m!1379273))

(declare-fun m!1379275 () Bool)

(assert (=> b!1495479 m!1379275))

(assert (=> b!1495479 m!1379251))

(declare-fun m!1379277 () Bool)

(assert (=> b!1495485 m!1379277))

(assert (=> b!1495484 m!1379251))

(assert (=> b!1495484 m!1379251))

(declare-fun m!1379279 () Bool)

(assert (=> b!1495484 m!1379279))

(assert (=> b!1495484 m!1379279))

(assert (=> b!1495484 m!1379251))

(declare-fun m!1379281 () Bool)

(assert (=> b!1495484 m!1379281))

(assert (=> b!1495478 m!1379251))

(assert (=> b!1495478 m!1379251))

(declare-fun m!1379283 () Bool)

(assert (=> b!1495478 m!1379283))

(assert (=> b!1495481 m!1379269))

(declare-fun m!1379285 () Bool)

(assert (=> b!1495481 m!1379285))

(declare-fun m!1379287 () Bool)

(assert (=> b!1495486 m!1379287))

(assert (=> b!1495486 m!1379287))

(declare-fun m!1379289 () Bool)

(assert (=> b!1495486 m!1379289))

(declare-fun m!1379291 () Bool)

(assert (=> b!1495477 m!1379291))

(assert (=> b!1495477 m!1379291))

(declare-fun m!1379293 () Bool)

(assert (=> b!1495477 m!1379293))

(assert (=> b!1495477 m!1379269))

(declare-fun m!1379295 () Bool)

(assert (=> b!1495477 m!1379295))

(declare-fun m!1379297 () Bool)

(assert (=> b!1495487 m!1379297))

(declare-fun m!1379299 () Bool)

(assert (=> b!1495480 m!1379299))

(declare-fun m!1379301 () Bool)

(assert (=> b!1495480 m!1379301))

(check-sat (not b!1495472) (not b!1495480) (not b!1495473) (not b!1495475) (not b!1495477) (not b!1495485) (not b!1495479) (not b!1495488) (not b!1495487) (not b!1495478) (not b!1495484) (not b!1495486) (not start!127380))
(check-sat)
