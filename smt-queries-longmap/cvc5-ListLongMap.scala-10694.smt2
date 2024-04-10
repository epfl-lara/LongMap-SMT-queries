; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125302 () Bool)

(assert start!125302)

(declare-fun b!1463439 () Bool)

(declare-fun e!822525 () Bool)

(declare-fun e!822528 () Bool)

(assert (=> b!1463439 (= e!822525 e!822528)))

(declare-fun res!992700 () Bool)

(assert (=> b!1463439 (=> res!992700 e!822528)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640772 () (_ BitVec 32))

(declare-datatypes ((array!98750 0))(
  ( (array!98751 (arr!47663 (Array (_ BitVec 32) (_ BitVec 64))) (size!48213 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98750)

(assert (=> b!1463439 (= res!992700 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640772 #b00000000000000000000000000000000) (bvsge lt!640772 (size!48213 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463439 (= lt!640772 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463440 () Bool)

(declare-fun res!992699 () Bool)

(declare-fun e!822523 () Bool)

(assert (=> b!1463440 (=> (not res!992699) (not e!822523))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11915 0))(
  ( (MissingZero!11915 (index!50052 (_ BitVec 32))) (Found!11915 (index!50053 (_ BitVec 32))) (Intermediate!11915 (undefined!12727 Bool) (index!50054 (_ BitVec 32)) (x!131644 (_ BitVec 32))) (Undefined!11915) (MissingVacant!11915 (index!50055 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98750 (_ BitVec 32)) SeekEntryResult!11915)

(assert (=> b!1463440 (= res!992699 (= (seekEntryOrOpen!0 (select (arr!47663 a!2862) j!93) a!2862 mask!2687) (Found!11915 j!93)))))

(declare-fun b!1463441 () Bool)

(declare-fun res!992690 () Bool)

(declare-fun e!822524 () Bool)

(assert (=> b!1463441 (=> (not res!992690) (not e!822524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463441 (= res!992690 (validKeyInArray!0 (select (arr!47663 a!2862) j!93)))))

(declare-fun b!1463442 () Bool)

(assert (=> b!1463442 (= e!822528 true)))

(declare-fun lt!640770 () Bool)

(declare-fun e!822530 () Bool)

(assert (=> b!1463442 (= lt!640770 e!822530)))

(declare-fun c!134886 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463442 (= c!134886 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1463443 () Bool)

(assert (=> b!1463443 (= e!822523 (or (= (select (arr!47663 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47663 a!2862) intermediateBeforeIndex!19) (select (arr!47663 a!2862) j!93))))))

(declare-fun res!992695 () Bool)

(assert (=> start!125302 (=> (not res!992695) (not e!822524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125302 (= res!992695 (validMask!0 mask!2687))))

(assert (=> start!125302 e!822524))

(assert (=> start!125302 true))

(declare-fun array_inv!36691 (array!98750) Bool)

(assert (=> start!125302 (array_inv!36691 a!2862)))

(declare-fun lt!640773 () (_ BitVec 64))

(declare-fun lt!640767 () array!98750)

(declare-fun b!1463444 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98750 (_ BitVec 32)) SeekEntryResult!11915)

(assert (=> b!1463444 (= e!822530 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640772 intermediateAfterIndex!19 lt!640773 lt!640767 mask!2687) (seekEntryOrOpen!0 lt!640773 lt!640767 mask!2687))))))

(declare-fun b!1463445 () Bool)

(declare-fun res!992703 () Bool)

(declare-fun e!822527 () Bool)

(assert (=> b!1463445 (=> (not res!992703) (not e!822527))))

(declare-fun lt!640771 () SeekEntryResult!11915)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98750 (_ BitVec 32)) SeekEntryResult!11915)

(assert (=> b!1463445 (= res!992703 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47663 a!2862) j!93) a!2862 mask!2687) lt!640771))))

(declare-fun b!1463446 () Bool)

(declare-fun res!992693 () Bool)

(assert (=> b!1463446 (=> (not res!992693) (not e!822524))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463446 (= res!992693 (and (= (size!48213 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48213 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48213 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463447 () Bool)

(declare-fun e!822522 () Bool)

(assert (=> b!1463447 (= e!822522 e!822527)))

(declare-fun res!992706 () Bool)

(assert (=> b!1463447 (=> (not res!992706) (not e!822527))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463447 (= res!992706 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47663 a!2862) j!93) mask!2687) (select (arr!47663 a!2862) j!93) a!2862 mask!2687) lt!640771))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463447 (= lt!640771 (Intermediate!11915 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463448 () Bool)

(declare-fun e!822521 () Bool)

(assert (=> b!1463448 (= e!822521 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640773 lt!640767 mask!2687) (seekEntryOrOpen!0 lt!640773 lt!640767 mask!2687)))))

(declare-fun lt!640769 () SeekEntryResult!11915)

(declare-fun b!1463449 () Bool)

(assert (=> b!1463449 (= e!822521 (= lt!640769 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640773 lt!640767 mask!2687)))))

(declare-fun b!1463450 () Bool)

(assert (=> b!1463450 (= e!822530 (not (= lt!640769 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640772 lt!640773 lt!640767 mask!2687))))))

(declare-fun b!1463451 () Bool)

(declare-fun res!992691 () Bool)

(assert (=> b!1463451 (=> res!992691 e!822528)))

(assert (=> b!1463451 (= res!992691 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640772 (select (arr!47663 a!2862) j!93) a!2862 mask!2687) lt!640771)))))

(declare-fun b!1463452 () Bool)

(declare-fun res!992707 () Bool)

(assert (=> b!1463452 (=> (not res!992707) (not e!822524))))

(assert (=> b!1463452 (= res!992707 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48213 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48213 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48213 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463453 () Bool)

(declare-fun res!992694 () Bool)

(declare-fun e!822529 () Bool)

(assert (=> b!1463453 (=> (not res!992694) (not e!822529))))

(assert (=> b!1463453 (= res!992694 e!822521)))

(declare-fun c!134885 () Bool)

(assert (=> b!1463453 (= c!134885 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463454 () Bool)

(declare-fun res!992704 () Bool)

(assert (=> b!1463454 (=> (not res!992704) (not e!822524))))

(declare-datatypes ((List!34164 0))(
  ( (Nil!34161) (Cons!34160 (h!35510 (_ BitVec 64)) (t!48858 List!34164)) )
))
(declare-fun arrayNoDuplicates!0 (array!98750 (_ BitVec 32) List!34164) Bool)

(assert (=> b!1463454 (= res!992704 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34161))))

(declare-fun b!1463455 () Bool)

(declare-fun res!992696 () Bool)

(assert (=> b!1463455 (=> (not res!992696) (not e!822524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98750 (_ BitVec 32)) Bool)

(assert (=> b!1463455 (= res!992696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463456 () Bool)

(declare-fun res!992697 () Bool)

(assert (=> b!1463456 (=> (not res!992697) (not e!822524))))

(assert (=> b!1463456 (= res!992697 (validKeyInArray!0 (select (arr!47663 a!2862) i!1006)))))

(declare-fun b!1463457 () Bool)

(assert (=> b!1463457 (= e!822529 (not e!822525))))

(declare-fun res!992702 () Bool)

(assert (=> b!1463457 (=> res!992702 e!822525)))

(assert (=> b!1463457 (= res!992702 (or (and (= (select (arr!47663 a!2862) index!646) (select (store (arr!47663 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47663 a!2862) index!646) (select (arr!47663 a!2862) j!93))) (= (select (arr!47663 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463457 e!822523))

(declare-fun res!992698 () Bool)

(assert (=> b!1463457 (=> (not res!992698) (not e!822523))))

(assert (=> b!1463457 (= res!992698 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49326 0))(
  ( (Unit!49327) )
))
(declare-fun lt!640768 () Unit!49326)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49326)

(assert (=> b!1463457 (= lt!640768 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463458 () Bool)

(assert (=> b!1463458 (= e!822527 e!822529)))

(declare-fun res!992705 () Bool)

(assert (=> b!1463458 (=> (not res!992705) (not e!822529))))

(assert (=> b!1463458 (= res!992705 (= lt!640769 (Intermediate!11915 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1463458 (= lt!640769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640773 mask!2687) lt!640773 lt!640767 mask!2687))))

(assert (=> b!1463458 (= lt!640773 (select (store (arr!47663 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463459 () Bool)

(assert (=> b!1463459 (= e!822524 e!822522)))

(declare-fun res!992701 () Bool)

(assert (=> b!1463459 (=> (not res!992701) (not e!822522))))

(assert (=> b!1463459 (= res!992701 (= (select (store (arr!47663 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463459 (= lt!640767 (array!98751 (store (arr!47663 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48213 a!2862)))))

(declare-fun b!1463460 () Bool)

(declare-fun res!992692 () Bool)

(assert (=> b!1463460 (=> (not res!992692) (not e!822529))))

(assert (=> b!1463460 (= res!992692 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125302 res!992695) b!1463446))

(assert (= (and b!1463446 res!992693) b!1463456))

(assert (= (and b!1463456 res!992697) b!1463441))

(assert (= (and b!1463441 res!992690) b!1463455))

(assert (= (and b!1463455 res!992696) b!1463454))

(assert (= (and b!1463454 res!992704) b!1463452))

(assert (= (and b!1463452 res!992707) b!1463459))

(assert (= (and b!1463459 res!992701) b!1463447))

(assert (= (and b!1463447 res!992706) b!1463445))

(assert (= (and b!1463445 res!992703) b!1463458))

(assert (= (and b!1463458 res!992705) b!1463453))

(assert (= (and b!1463453 c!134885) b!1463449))

(assert (= (and b!1463453 (not c!134885)) b!1463448))

(assert (= (and b!1463453 res!992694) b!1463460))

(assert (= (and b!1463460 res!992692) b!1463457))

(assert (= (and b!1463457 res!992698) b!1463440))

(assert (= (and b!1463440 res!992699) b!1463443))

(assert (= (and b!1463457 (not res!992702)) b!1463439))

(assert (= (and b!1463439 (not res!992700)) b!1463451))

(assert (= (and b!1463451 (not res!992691)) b!1463442))

(assert (= (and b!1463442 c!134886) b!1463450))

(assert (= (and b!1463442 (not c!134886)) b!1463444))

(declare-fun m!1350775 () Bool)

(assert (=> b!1463450 m!1350775))

(declare-fun m!1350777 () Bool)

(assert (=> b!1463439 m!1350777))

(declare-fun m!1350779 () Bool)

(assert (=> b!1463443 m!1350779))

(declare-fun m!1350781 () Bool)

(assert (=> b!1463443 m!1350781))

(declare-fun m!1350783 () Bool)

(assert (=> b!1463457 m!1350783))

(declare-fun m!1350785 () Bool)

(assert (=> b!1463457 m!1350785))

(declare-fun m!1350787 () Bool)

(assert (=> b!1463457 m!1350787))

(declare-fun m!1350789 () Bool)

(assert (=> b!1463457 m!1350789))

(declare-fun m!1350791 () Bool)

(assert (=> b!1463457 m!1350791))

(assert (=> b!1463457 m!1350781))

(declare-fun m!1350793 () Bool)

(assert (=> b!1463448 m!1350793))

(declare-fun m!1350795 () Bool)

(assert (=> b!1463448 m!1350795))

(assert (=> b!1463445 m!1350781))

(assert (=> b!1463445 m!1350781))

(declare-fun m!1350797 () Bool)

(assert (=> b!1463445 m!1350797))

(declare-fun m!1350799 () Bool)

(assert (=> b!1463455 m!1350799))

(assert (=> b!1463459 m!1350785))

(declare-fun m!1350801 () Bool)

(assert (=> b!1463459 m!1350801))

(declare-fun m!1350803 () Bool)

(assert (=> b!1463449 m!1350803))

(assert (=> b!1463447 m!1350781))

(assert (=> b!1463447 m!1350781))

(declare-fun m!1350805 () Bool)

(assert (=> b!1463447 m!1350805))

(assert (=> b!1463447 m!1350805))

(assert (=> b!1463447 m!1350781))

(declare-fun m!1350807 () Bool)

(assert (=> b!1463447 m!1350807))

(assert (=> b!1463451 m!1350781))

(assert (=> b!1463451 m!1350781))

(declare-fun m!1350809 () Bool)

(assert (=> b!1463451 m!1350809))

(declare-fun m!1350811 () Bool)

(assert (=> b!1463456 m!1350811))

(assert (=> b!1463456 m!1350811))

(declare-fun m!1350813 () Bool)

(assert (=> b!1463456 m!1350813))

(declare-fun m!1350815 () Bool)

(assert (=> start!125302 m!1350815))

(declare-fun m!1350817 () Bool)

(assert (=> start!125302 m!1350817))

(assert (=> b!1463440 m!1350781))

(assert (=> b!1463440 m!1350781))

(declare-fun m!1350819 () Bool)

(assert (=> b!1463440 m!1350819))

(declare-fun m!1350821 () Bool)

(assert (=> b!1463444 m!1350821))

(assert (=> b!1463444 m!1350795))

(assert (=> b!1463441 m!1350781))

(assert (=> b!1463441 m!1350781))

(declare-fun m!1350823 () Bool)

(assert (=> b!1463441 m!1350823))

(declare-fun m!1350825 () Bool)

(assert (=> b!1463458 m!1350825))

(assert (=> b!1463458 m!1350825))

(declare-fun m!1350827 () Bool)

(assert (=> b!1463458 m!1350827))

(assert (=> b!1463458 m!1350785))

(declare-fun m!1350829 () Bool)

(assert (=> b!1463458 m!1350829))

(declare-fun m!1350831 () Bool)

(assert (=> b!1463454 m!1350831))

(push 1)

