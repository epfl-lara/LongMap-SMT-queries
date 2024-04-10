; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125296 () Bool)

(assert start!125296)

(declare-fun e!822436 () Bool)

(declare-datatypes ((SeekEntryResult!11912 0))(
  ( (MissingZero!11912 (index!50040 (_ BitVec 32))) (Found!11912 (index!50041 (_ BitVec 32))) (Intermediate!11912 (undefined!12724 Bool) (index!50042 (_ BitVec 32)) (x!131633 (_ BitVec 32))) (Undefined!11912) (MissingVacant!11912 (index!50043 (_ BitVec 32))) )
))
(declare-fun lt!640710 () SeekEntryResult!11912)

(declare-fun b!1463241 () Bool)

(declare-datatypes ((array!98744 0))(
  ( (array!98745 (arr!47660 (Array (_ BitVec 32) (_ BitVec 64))) (size!48210 (_ BitVec 32))) )
))
(declare-fun lt!640705 () array!98744)

(declare-fun lt!640707 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640708 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98744 (_ BitVec 32)) SeekEntryResult!11912)

(assert (=> b!1463241 (= e!822436 (not (= lt!640710 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640708 lt!640707 lt!640705 mask!2687))))))

(declare-fun b!1463242 () Bool)

(declare-fun e!822431 () Bool)

(declare-fun e!822437 () Bool)

(assert (=> b!1463242 (= e!822431 (not e!822437))))

(declare-fun res!992529 () Bool)

(assert (=> b!1463242 (=> res!992529 e!822437)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98744)

(assert (=> b!1463242 (= res!992529 (or (and (= (select (arr!47660 a!2862) index!646) (select (store (arr!47660 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47660 a!2862) index!646) (select (arr!47660 a!2862) j!93))) (= (select (arr!47660 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822439 () Bool)

(assert (=> b!1463242 e!822439))

(declare-fun res!992541 () Bool)

(assert (=> b!1463242 (=> (not res!992541) (not e!822439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98744 (_ BitVec 32)) Bool)

(assert (=> b!1463242 (= res!992541 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49320 0))(
  ( (Unit!49321) )
))
(declare-fun lt!640704 () Unit!49320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49320)

(assert (=> b!1463242 (= lt!640704 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!822438 () Bool)

(declare-fun b!1463243 () Bool)

(assert (=> b!1463243 (= e!822438 (= lt!640710 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640707 lt!640705 mask!2687)))))

(declare-fun b!1463244 () Bool)

(declare-fun e!822434 () Bool)

(assert (=> b!1463244 (= e!822434 true)))

(declare-fun lt!640709 () Bool)

(assert (=> b!1463244 (= lt!640709 e!822436)))

(declare-fun c!134867 () Bool)

(assert (=> b!1463244 (= c!134867 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463245 () Bool)

(declare-fun res!992540 () Bool)

(declare-fun e!822435 () Bool)

(assert (=> b!1463245 (=> (not res!992540) (not e!822435))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1463245 (= res!992540 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48210 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48210 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48210 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463246 () Bool)

(declare-fun e!822440 () Bool)

(assert (=> b!1463246 (= e!822440 e!822431)))

(declare-fun res!992542 () Bool)

(assert (=> b!1463246 (=> (not res!992542) (not e!822431))))

(assert (=> b!1463246 (= res!992542 (= lt!640710 (Intermediate!11912 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463246 (= lt!640710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640707 mask!2687) lt!640707 lt!640705 mask!2687))))

(assert (=> b!1463246 (= lt!640707 (select (store (arr!47660 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463247 () Bool)

(declare-fun res!992530 () Bool)

(assert (=> b!1463247 (=> (not res!992530) (not e!822435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463247 (= res!992530 (validKeyInArray!0 (select (arr!47660 a!2862) j!93)))))

(declare-fun b!1463248 () Bool)

(declare-fun res!992538 () Bool)

(assert (=> b!1463248 (=> (not res!992538) (not e!822435))))

(declare-datatypes ((List!34161 0))(
  ( (Nil!34158) (Cons!34157 (h!35507 (_ BitVec 64)) (t!48855 List!34161)) )
))
(declare-fun arrayNoDuplicates!0 (array!98744 (_ BitVec 32) List!34161) Bool)

(assert (=> b!1463248 (= res!992538 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34158))))

(declare-fun b!1463249 () Bool)

(declare-fun res!992534 () Bool)

(assert (=> b!1463249 (=> (not res!992534) (not e!822440))))

(declare-fun lt!640706 () SeekEntryResult!11912)

(assert (=> b!1463249 (= res!992534 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47660 a!2862) j!93) a!2862 mask!2687) lt!640706))))

(declare-fun b!1463250 () Bool)

(declare-fun res!992544 () Bool)

(assert (=> b!1463250 (=> res!992544 e!822434)))

(assert (=> b!1463250 (= res!992544 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640708 (select (arr!47660 a!2862) j!93) a!2862 mask!2687) lt!640706)))))

(declare-fun b!1463251 () Bool)

(assert (=> b!1463251 (= e!822437 e!822434)))

(declare-fun res!992536 () Bool)

(assert (=> b!1463251 (=> res!992536 e!822434)))

(assert (=> b!1463251 (= res!992536 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640708 #b00000000000000000000000000000000) (bvsge lt!640708 (size!48210 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463251 (= lt!640708 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463252 () Bool)

(declare-fun e!822433 () Bool)

(assert (=> b!1463252 (= e!822435 e!822433)))

(declare-fun res!992535 () Bool)

(assert (=> b!1463252 (=> (not res!992535) (not e!822433))))

(assert (=> b!1463252 (= res!992535 (= (select (store (arr!47660 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463252 (= lt!640705 (array!98745 (store (arr!47660 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48210 a!2862)))))

(declare-fun b!1463253 () Bool)

(declare-fun res!992528 () Bool)

(assert (=> b!1463253 (=> (not res!992528) (not e!822435))))

(assert (=> b!1463253 (= res!992528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463254 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98744 (_ BitVec 32)) SeekEntryResult!11912)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98744 (_ BitVec 32)) SeekEntryResult!11912)

(assert (=> b!1463254 (= e!822438 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640707 lt!640705 mask!2687) (seekEntryOrOpen!0 lt!640707 lt!640705 mask!2687)))))

(declare-fun b!1463255 () Bool)

(assert (=> b!1463255 (= e!822439 (or (= (select (arr!47660 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47660 a!2862) intermediateBeforeIndex!19) (select (arr!47660 a!2862) j!93))))))

(declare-fun b!1463256 () Bool)

(assert (=> b!1463256 (= e!822436 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640708 intermediateAfterIndex!19 lt!640707 lt!640705 mask!2687) (seekEntryOrOpen!0 lt!640707 lt!640705 mask!2687))))))

(declare-fun b!1463257 () Bool)

(declare-fun res!992543 () Bool)

(assert (=> b!1463257 (=> (not res!992543) (not e!822439))))

(assert (=> b!1463257 (= res!992543 (= (seekEntryOrOpen!0 (select (arr!47660 a!2862) j!93) a!2862 mask!2687) (Found!11912 j!93)))))

(declare-fun b!1463258 () Bool)

(declare-fun res!992545 () Bool)

(assert (=> b!1463258 (=> (not res!992545) (not e!822435))))

(assert (=> b!1463258 (= res!992545 (validKeyInArray!0 (select (arr!47660 a!2862) i!1006)))))

(declare-fun b!1463259 () Bool)

(declare-fun res!992531 () Bool)

(assert (=> b!1463259 (=> (not res!992531) (not e!822435))))

(assert (=> b!1463259 (= res!992531 (and (= (size!48210 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48210 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48210 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463260 () Bool)

(declare-fun res!992537 () Bool)

(assert (=> b!1463260 (=> (not res!992537) (not e!822431))))

(assert (=> b!1463260 (= res!992537 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!992539 () Bool)

(assert (=> start!125296 (=> (not res!992539) (not e!822435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125296 (= res!992539 (validMask!0 mask!2687))))

(assert (=> start!125296 e!822435))

(assert (=> start!125296 true))

(declare-fun array_inv!36688 (array!98744) Bool)

(assert (=> start!125296 (array_inv!36688 a!2862)))

(declare-fun b!1463261 () Bool)

(assert (=> b!1463261 (= e!822433 e!822440)))

(declare-fun res!992532 () Bool)

(assert (=> b!1463261 (=> (not res!992532) (not e!822440))))

(assert (=> b!1463261 (= res!992532 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47660 a!2862) j!93) mask!2687) (select (arr!47660 a!2862) j!93) a!2862 mask!2687) lt!640706))))

(assert (=> b!1463261 (= lt!640706 (Intermediate!11912 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463262 () Bool)

(declare-fun res!992533 () Bool)

(assert (=> b!1463262 (=> (not res!992533) (not e!822431))))

(assert (=> b!1463262 (= res!992533 e!822438)))

(declare-fun c!134868 () Bool)

(assert (=> b!1463262 (= c!134868 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125296 res!992539) b!1463259))

(assert (= (and b!1463259 res!992531) b!1463258))

(assert (= (and b!1463258 res!992545) b!1463247))

(assert (= (and b!1463247 res!992530) b!1463253))

(assert (= (and b!1463253 res!992528) b!1463248))

(assert (= (and b!1463248 res!992538) b!1463245))

(assert (= (and b!1463245 res!992540) b!1463252))

(assert (= (and b!1463252 res!992535) b!1463261))

(assert (= (and b!1463261 res!992532) b!1463249))

(assert (= (and b!1463249 res!992534) b!1463246))

(assert (= (and b!1463246 res!992542) b!1463262))

(assert (= (and b!1463262 c!134868) b!1463243))

(assert (= (and b!1463262 (not c!134868)) b!1463254))

(assert (= (and b!1463262 res!992533) b!1463260))

(assert (= (and b!1463260 res!992537) b!1463242))

(assert (= (and b!1463242 res!992541) b!1463257))

(assert (= (and b!1463257 res!992543) b!1463255))

(assert (= (and b!1463242 (not res!992529)) b!1463251))

(assert (= (and b!1463251 (not res!992536)) b!1463250))

(assert (= (and b!1463250 (not res!992544)) b!1463244))

(assert (= (and b!1463244 c!134867) b!1463241))

(assert (= (and b!1463244 (not c!134867)) b!1463256))

(declare-fun m!1350601 () Bool)

(assert (=> b!1463251 m!1350601))

(declare-fun m!1350603 () Bool)

(assert (=> b!1463256 m!1350603))

(declare-fun m!1350605 () Bool)

(assert (=> b!1463256 m!1350605))

(declare-fun m!1350607 () Bool)

(assert (=> start!125296 m!1350607))

(declare-fun m!1350609 () Bool)

(assert (=> start!125296 m!1350609))

(declare-fun m!1350611 () Bool)

(assert (=> b!1463247 m!1350611))

(assert (=> b!1463247 m!1350611))

(declare-fun m!1350613 () Bool)

(assert (=> b!1463247 m!1350613))

(declare-fun m!1350615 () Bool)

(assert (=> b!1463252 m!1350615))

(declare-fun m!1350617 () Bool)

(assert (=> b!1463252 m!1350617))

(assert (=> b!1463257 m!1350611))

(assert (=> b!1463257 m!1350611))

(declare-fun m!1350619 () Bool)

(assert (=> b!1463257 m!1350619))

(declare-fun m!1350621 () Bool)

(assert (=> b!1463258 m!1350621))

(assert (=> b!1463258 m!1350621))

(declare-fun m!1350623 () Bool)

(assert (=> b!1463258 m!1350623))

(assert (=> b!1463261 m!1350611))

(assert (=> b!1463261 m!1350611))

(declare-fun m!1350625 () Bool)

(assert (=> b!1463261 m!1350625))

(assert (=> b!1463261 m!1350625))

(assert (=> b!1463261 m!1350611))

(declare-fun m!1350627 () Bool)

(assert (=> b!1463261 m!1350627))

(assert (=> b!1463250 m!1350611))

(assert (=> b!1463250 m!1350611))

(declare-fun m!1350629 () Bool)

(assert (=> b!1463250 m!1350629))

(declare-fun m!1350631 () Bool)

(assert (=> b!1463248 m!1350631))

(declare-fun m!1350633 () Bool)

(assert (=> b!1463241 m!1350633))

(declare-fun m!1350635 () Bool)

(assert (=> b!1463243 m!1350635))

(declare-fun m!1350637 () Bool)

(assert (=> b!1463242 m!1350637))

(assert (=> b!1463242 m!1350615))

(declare-fun m!1350639 () Bool)

(assert (=> b!1463242 m!1350639))

(declare-fun m!1350641 () Bool)

(assert (=> b!1463242 m!1350641))

(declare-fun m!1350643 () Bool)

(assert (=> b!1463242 m!1350643))

(assert (=> b!1463242 m!1350611))

(declare-fun m!1350645 () Bool)

(assert (=> b!1463254 m!1350645))

(assert (=> b!1463254 m!1350605))

(declare-fun m!1350647 () Bool)

(assert (=> b!1463253 m!1350647))

(declare-fun m!1350649 () Bool)

(assert (=> b!1463255 m!1350649))

(assert (=> b!1463255 m!1350611))

(assert (=> b!1463249 m!1350611))

(assert (=> b!1463249 m!1350611))

(declare-fun m!1350651 () Bool)

(assert (=> b!1463249 m!1350651))

(declare-fun m!1350653 () Bool)

(assert (=> b!1463246 m!1350653))

(assert (=> b!1463246 m!1350653))

(declare-fun m!1350655 () Bool)

(assert (=> b!1463246 m!1350655))

(assert (=> b!1463246 m!1350615))

(declare-fun m!1350657 () Bool)

(assert (=> b!1463246 m!1350657))

(push 1)

