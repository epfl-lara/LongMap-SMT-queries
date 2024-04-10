; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122204 () Bool)

(assert start!122204)

(declare-fun res!953390 () Bool)

(declare-fun e!802302 () Bool)

(assert (=> start!122204 (=> (not res!953390) (not e!802302))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122204 (= res!953390 (validMask!0 mask!2840))))

(assert (=> start!122204 e!802302))

(assert (=> start!122204 true))

(declare-datatypes ((array!96788 0))(
  ( (array!96789 (arr!46722 (Array (_ BitVec 32) (_ BitVec 64))) (size!47272 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96788)

(declare-fun array_inv!35750 (array!96788) Bool)

(assert (=> start!122204 (array_inv!35750 a!2901)))

(declare-fun b!1417656 () Bool)

(declare-fun res!953389 () Bool)

(assert (=> b!1417656 (=> (not res!953389) (not e!802302))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417656 (= res!953389 (validKeyInArray!0 (select (arr!46722 a!2901) i!1037)))))

(declare-fun b!1417657 () Bool)

(declare-fun e!802304 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11033 0))(
  ( (MissingZero!11033 (index!46524 (_ BitVec 32))) (Found!11033 (index!46525 (_ BitVec 32))) (Intermediate!11033 (undefined!11845 Bool) (index!46526 (_ BitVec 32)) (x!128124 (_ BitVec 32))) (Undefined!11033) (MissingVacant!11033 (index!46527 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96788 (_ BitVec 32)) SeekEntryResult!11033)

(assert (=> b!1417657 (= e!802304 (= (seekEntryOrOpen!0 (select (arr!46722 a!2901) j!112) a!2901 mask!2840) (Found!11033 j!112)))))

(declare-fun b!1417658 () Bool)

(declare-fun res!953391 () Bool)

(assert (=> b!1417658 (=> (not res!953391) (not e!802302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96788 (_ BitVec 32)) Bool)

(assert (=> b!1417658 (= res!953391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417659 () Bool)

(declare-fun res!953386 () Bool)

(assert (=> b!1417659 (=> (not res!953386) (not e!802302))))

(assert (=> b!1417659 (= res!953386 (validKeyInArray!0 (select (arr!46722 a!2901) j!112)))))

(declare-fun b!1417660 () Bool)

(assert (=> b!1417660 (= e!802302 (not true))))

(assert (=> b!1417660 e!802304))

(declare-fun res!953392 () Bool)

(assert (=> b!1417660 (=> (not res!953392) (not e!802304))))

(assert (=> b!1417660 (= res!953392 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48040 0))(
  ( (Unit!48041) )
))
(declare-fun lt!625434 () Unit!48040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48040)

(assert (=> b!1417660 (= lt!625434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!625433 () SeekEntryResult!11033)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96788 (_ BitVec 32)) SeekEntryResult!11033)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417660 (= lt!625433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46722 a!2901) j!112) mask!2840) (select (arr!46722 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417661 () Bool)

(declare-fun res!953387 () Bool)

(assert (=> b!1417661 (=> (not res!953387) (not e!802302))))

(declare-datatypes ((List!33241 0))(
  ( (Nil!33238) (Cons!33237 (h!34530 (_ BitVec 64)) (t!47935 List!33241)) )
))
(declare-fun arrayNoDuplicates!0 (array!96788 (_ BitVec 32) List!33241) Bool)

(assert (=> b!1417661 (= res!953387 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33238))))

(declare-fun b!1417662 () Bool)

(declare-fun res!953388 () Bool)

(assert (=> b!1417662 (=> (not res!953388) (not e!802302))))

(assert (=> b!1417662 (= res!953388 (and (= (size!47272 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47272 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47272 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122204 res!953390) b!1417662))

(assert (= (and b!1417662 res!953388) b!1417656))

(assert (= (and b!1417656 res!953389) b!1417659))

(assert (= (and b!1417659 res!953386) b!1417658))

(assert (= (and b!1417658 res!953391) b!1417661))

(assert (= (and b!1417661 res!953387) b!1417660))

(assert (= (and b!1417660 res!953392) b!1417657))

(declare-fun m!1308425 () Bool)

(assert (=> b!1417656 m!1308425))

(assert (=> b!1417656 m!1308425))

(declare-fun m!1308427 () Bool)

(assert (=> b!1417656 m!1308427))

(declare-fun m!1308429 () Bool)

(assert (=> b!1417661 m!1308429))

(declare-fun m!1308431 () Bool)

(assert (=> b!1417660 m!1308431))

(declare-fun m!1308433 () Bool)

(assert (=> b!1417660 m!1308433))

(assert (=> b!1417660 m!1308431))

(declare-fun m!1308435 () Bool)

(assert (=> b!1417660 m!1308435))

(assert (=> b!1417660 m!1308433))

(assert (=> b!1417660 m!1308431))

(declare-fun m!1308437 () Bool)

(assert (=> b!1417660 m!1308437))

(declare-fun m!1308439 () Bool)

(assert (=> b!1417660 m!1308439))

(declare-fun m!1308441 () Bool)

(assert (=> start!122204 m!1308441))

(declare-fun m!1308443 () Bool)

(assert (=> start!122204 m!1308443))

(assert (=> b!1417659 m!1308431))

(assert (=> b!1417659 m!1308431))

(declare-fun m!1308445 () Bool)

(assert (=> b!1417659 m!1308445))

(assert (=> b!1417657 m!1308431))

(assert (=> b!1417657 m!1308431))

(declare-fun m!1308447 () Bool)

(assert (=> b!1417657 m!1308447))

(declare-fun m!1308449 () Bool)

(assert (=> b!1417658 m!1308449))

(check-sat (not b!1417659) (not b!1417656) (not b!1417657) (not b!1417660) (not b!1417661) (not b!1417658) (not start!122204))
