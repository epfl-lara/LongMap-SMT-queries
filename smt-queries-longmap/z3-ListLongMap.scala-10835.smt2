; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127134 () Bool)

(assert start!127134)

(declare-fun b!1491568 () Bool)

(declare-fun res!1013844 () Bool)

(declare-fun e!836001 () Bool)

(assert (=> b!1491568 (=> (not res!1013844) (not e!836001))))

(declare-datatypes ((array!99745 0))(
  ( (array!99746 (arr!48139 (Array (_ BitVec 32) (_ BitVec 64))) (size!48690 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99745)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491568 (= res!1013844 (validKeyInArray!0 (select (arr!48139 a!2862) j!93)))))

(declare-fun b!1491569 () Bool)

(declare-fun e!836000 () Bool)

(declare-fun e!836004 () Bool)

(assert (=> b!1491569 (= e!836000 e!836004)))

(declare-fun res!1013842 () Bool)

(assert (=> b!1491569 (=> res!1013842 e!836004)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!650360 () (_ BitVec 32))

(assert (=> b!1491569 (= res!1013842 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!650360 #b00000000000000000000000000000000) (bvsge lt!650360 (size!48690 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491569 (= lt!650360 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-datatypes ((SeekEntryResult!12276 0))(
  ( (MissingZero!12276 (index!51496 (_ BitVec 32))) (Found!12276 (index!51497 (_ BitVec 32))) (Intermediate!12276 (undefined!13088 Bool) (index!51498 (_ BitVec 32)) (x!133277 (_ BitVec 32))) (Undefined!12276) (MissingVacant!12276 (index!51499 (_ BitVec 32))) )
))
(declare-fun lt!650363 () SeekEntryResult!12276)

(declare-fun lt!650365 () array!99745)

(declare-fun lt!650367 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99745 (_ BitVec 32)) SeekEntryResult!12276)

(assert (=> b!1491569 (= lt!650363 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650367 lt!650365 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99745 (_ BitVec 32)) SeekEntryResult!12276)

(assert (=> b!1491569 (= lt!650363 (seekEntryOrOpen!0 lt!650367 lt!650365 mask!2687))))

(declare-fun b!1491570 () Bool)

(declare-fun e!836003 () Bool)

(assert (=> b!1491570 (= e!836003 (not e!836000))))

(declare-fun res!1013853 () Bool)

(assert (=> b!1491570 (=> res!1013853 e!836000)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491570 (= res!1013853 (or (and (= (select (arr!48139 a!2862) index!646) (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48139 a!2862) index!646) (select (arr!48139 a!2862) j!93))) (= (select (arr!48139 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!650366 () SeekEntryResult!12276)

(assert (=> b!1491570 (and (= lt!650366 (Found!12276 j!93)) (or (= (select (arr!48139 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48139 a!2862) intermediateBeforeIndex!19) (select (arr!48139 a!2862) j!93))) (let ((bdg!54755 (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48139 a!2862) index!646) bdg!54755) (= (select (arr!48139 a!2862) index!646) (select (arr!48139 a!2862) j!93))) (= (select (arr!48139 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54755 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1491570 (= lt!650366 (seekEntryOrOpen!0 (select (arr!48139 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99745 (_ BitVec 32)) Bool)

(assert (=> b!1491570 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49925 0))(
  ( (Unit!49926) )
))
(declare-fun lt!650364 () Unit!49925)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49925)

(assert (=> b!1491570 (= lt!650364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491571 () Bool)

(declare-fun res!1013839 () Bool)

(assert (=> b!1491571 (=> (not res!1013839) (not e!836003))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491571 (= res!1013839 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491572 () Bool)

(declare-fun res!1013852 () Bool)

(assert (=> b!1491572 (=> res!1013852 e!836004)))

(declare-fun e!835999 () Bool)

(assert (=> b!1491572 (= res!1013852 e!835999)))

(declare-fun c!138402 () Bool)

(assert (=> b!1491572 (= c!138402 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1491573 () Bool)

(declare-fun res!1013846 () Bool)

(assert (=> b!1491573 (=> (not res!1013846) (not e!836003))))

(declare-fun e!836002 () Bool)

(assert (=> b!1491573 (= res!1013846 e!836002)))

(declare-fun c!138403 () Bool)

(assert (=> b!1491573 (= c!138403 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491574 () Bool)

(declare-fun res!1013843 () Bool)

(assert (=> b!1491574 (=> (not res!1013843) (not e!836001))))

(assert (=> b!1491574 (= res!1013843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491575 () Bool)

(declare-fun e!836006 () Bool)

(declare-fun e!836007 () Bool)

(assert (=> b!1491575 (= e!836006 e!836007)))

(declare-fun res!1013849 () Bool)

(assert (=> b!1491575 (=> (not res!1013849) (not e!836007))))

(declare-fun lt!650361 () SeekEntryResult!12276)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99745 (_ BitVec 32)) SeekEntryResult!12276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491575 (= res!1013849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48139 a!2862) j!93) mask!2687) (select (arr!48139 a!2862) j!93) a!2862 mask!2687) lt!650361))))

(assert (=> b!1491575 (= lt!650361 (Intermediate!12276 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491576 () Bool)

(declare-fun lt!650362 () SeekEntryResult!12276)

(assert (=> b!1491576 (= e!836002 (= lt!650362 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650367 lt!650365 mask!2687)))))

(declare-fun b!1491577 () Bool)

(declare-fun res!1013841 () Bool)

(assert (=> b!1491577 (=> (not res!1013841) (not e!836007))))

(assert (=> b!1491577 (= res!1013841 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48139 a!2862) j!93) a!2862 mask!2687) lt!650361))))

(declare-fun res!1013838 () Bool)

(assert (=> start!127134 (=> (not res!1013838) (not e!836001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127134 (= res!1013838 (validMask!0 mask!2687))))

(assert (=> start!127134 e!836001))

(assert (=> start!127134 true))

(declare-fun array_inv!37420 (array!99745) Bool)

(assert (=> start!127134 (array_inv!37420 a!2862)))

(declare-fun b!1491578 () Bool)

(declare-fun res!1013840 () Bool)

(assert (=> b!1491578 (=> res!1013840 e!836004)))

(assert (=> b!1491578 (= res!1013840 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1491579 () Bool)

(assert (=> b!1491579 (= e!836002 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650367 lt!650365 mask!2687) (seekEntryOrOpen!0 lt!650367 lt!650365 mask!2687)))))

(declare-fun b!1491580 () Bool)

(assert (=> b!1491580 (= e!836004 true)))

(assert (=> b!1491580 (= lt!650366 lt!650363)))

(declare-fun lt!650368 () Unit!49925)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49925)

(assert (=> b!1491580 (= lt!650368 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!650360 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1491581 () Bool)

(assert (=> b!1491581 (= e!835999 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650360 intermediateAfterIndex!19 lt!650367 lt!650365 mask!2687) lt!650363)))))

(declare-fun b!1491582 () Bool)

(declare-fun res!1013845 () Bool)

(assert (=> b!1491582 (=> res!1013845 e!836004)))

(assert (=> b!1491582 (= res!1013845 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650360 (select (arr!48139 a!2862) j!93) a!2862 mask!2687) lt!650361)))))

(declare-fun b!1491583 () Bool)

(declare-fun res!1013848 () Bool)

(assert (=> b!1491583 (=> (not res!1013848) (not e!836001))))

(assert (=> b!1491583 (= res!1013848 (and (= (size!48690 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48690 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48690 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491584 () Bool)

(declare-fun res!1013847 () Bool)

(assert (=> b!1491584 (=> (not res!1013847) (not e!836001))))

(assert (=> b!1491584 (= res!1013847 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48690 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48690 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48690 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491585 () Bool)

(assert (=> b!1491585 (= e!836007 e!836003)))

(declare-fun res!1013850 () Bool)

(assert (=> b!1491585 (=> (not res!1013850) (not e!836003))))

(assert (=> b!1491585 (= res!1013850 (= lt!650362 (Intermediate!12276 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491585 (= lt!650362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650367 mask!2687) lt!650367 lt!650365 mask!2687))))

(assert (=> b!1491585 (= lt!650367 (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491586 () Bool)

(declare-fun res!1013851 () Bool)

(assert (=> b!1491586 (=> (not res!1013851) (not e!836001))))

(declare-datatypes ((List!34627 0))(
  ( (Nil!34624) (Cons!34623 (h!36020 (_ BitVec 64)) (t!49313 List!34627)) )
))
(declare-fun arrayNoDuplicates!0 (array!99745 (_ BitVec 32) List!34627) Bool)

(assert (=> b!1491586 (= res!1013851 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34624))))

(declare-fun b!1491587 () Bool)

(declare-fun res!1013855 () Bool)

(assert (=> b!1491587 (=> (not res!1013855) (not e!836001))))

(assert (=> b!1491587 (= res!1013855 (validKeyInArray!0 (select (arr!48139 a!2862) i!1006)))))

(declare-fun b!1491588 () Bool)

(assert (=> b!1491588 (= e!836001 e!836006)))

(declare-fun res!1013854 () Bool)

(assert (=> b!1491588 (=> (not res!1013854) (not e!836006))))

(assert (=> b!1491588 (= res!1013854 (= (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491588 (= lt!650365 (array!99746 (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48690 a!2862)))))

(declare-fun b!1491589 () Bool)

(assert (=> b!1491589 (= e!835999 (not (= lt!650362 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650360 lt!650367 lt!650365 mask!2687))))))

(assert (= (and start!127134 res!1013838) b!1491583))

(assert (= (and b!1491583 res!1013848) b!1491587))

(assert (= (and b!1491587 res!1013855) b!1491568))

(assert (= (and b!1491568 res!1013844) b!1491574))

(assert (= (and b!1491574 res!1013843) b!1491586))

(assert (= (and b!1491586 res!1013851) b!1491584))

(assert (= (and b!1491584 res!1013847) b!1491588))

(assert (= (and b!1491588 res!1013854) b!1491575))

(assert (= (and b!1491575 res!1013849) b!1491577))

(assert (= (and b!1491577 res!1013841) b!1491585))

(assert (= (and b!1491585 res!1013850) b!1491573))

(assert (= (and b!1491573 c!138403) b!1491576))

(assert (= (and b!1491573 (not c!138403)) b!1491579))

(assert (= (and b!1491573 res!1013846) b!1491571))

(assert (= (and b!1491571 res!1013839) b!1491570))

(assert (= (and b!1491570 (not res!1013853)) b!1491569))

(assert (= (and b!1491569 (not res!1013842)) b!1491582))

(assert (= (and b!1491582 (not res!1013845)) b!1491572))

(assert (= (and b!1491572 c!138402) b!1491589))

(assert (= (and b!1491572 (not c!138402)) b!1491581))

(assert (= (and b!1491572 (not res!1013852)) b!1491578))

(assert (= (and b!1491578 (not res!1013840)) b!1491580))

(declare-fun m!1375759 () Bool)

(assert (=> start!127134 m!1375759))

(declare-fun m!1375761 () Bool)

(assert (=> start!127134 m!1375761))

(declare-fun m!1375763 () Bool)

(assert (=> b!1491589 m!1375763))

(declare-fun m!1375765 () Bool)

(assert (=> b!1491581 m!1375765))

(declare-fun m!1375767 () Bool)

(assert (=> b!1491586 m!1375767))

(declare-fun m!1375769 () Bool)

(assert (=> b!1491570 m!1375769))

(declare-fun m!1375771 () Bool)

(assert (=> b!1491570 m!1375771))

(declare-fun m!1375773 () Bool)

(assert (=> b!1491570 m!1375773))

(declare-fun m!1375775 () Bool)

(assert (=> b!1491570 m!1375775))

(declare-fun m!1375777 () Bool)

(assert (=> b!1491570 m!1375777))

(declare-fun m!1375779 () Bool)

(assert (=> b!1491570 m!1375779))

(declare-fun m!1375781 () Bool)

(assert (=> b!1491570 m!1375781))

(declare-fun m!1375783 () Bool)

(assert (=> b!1491570 m!1375783))

(assert (=> b!1491570 m!1375779))

(assert (=> b!1491582 m!1375779))

(assert (=> b!1491582 m!1375779))

(declare-fun m!1375785 () Bool)

(assert (=> b!1491582 m!1375785))

(declare-fun m!1375787 () Bool)

(assert (=> b!1491587 m!1375787))

(assert (=> b!1491587 m!1375787))

(declare-fun m!1375789 () Bool)

(assert (=> b!1491587 m!1375789))

(declare-fun m!1375791 () Bool)

(assert (=> b!1491579 m!1375791))

(declare-fun m!1375793 () Bool)

(assert (=> b!1491579 m!1375793))

(declare-fun m!1375795 () Bool)

(assert (=> b!1491574 m!1375795))

(declare-fun m!1375797 () Bool)

(assert (=> b!1491569 m!1375797))

(assert (=> b!1491569 m!1375791))

(assert (=> b!1491569 m!1375793))

(assert (=> b!1491575 m!1375779))

(assert (=> b!1491575 m!1375779))

(declare-fun m!1375799 () Bool)

(assert (=> b!1491575 m!1375799))

(assert (=> b!1491575 m!1375799))

(assert (=> b!1491575 m!1375779))

(declare-fun m!1375801 () Bool)

(assert (=> b!1491575 m!1375801))

(declare-fun m!1375803 () Bool)

(assert (=> b!1491576 m!1375803))

(assert (=> b!1491588 m!1375771))

(declare-fun m!1375805 () Bool)

(assert (=> b!1491588 m!1375805))

(declare-fun m!1375807 () Bool)

(assert (=> b!1491585 m!1375807))

(assert (=> b!1491585 m!1375807))

(declare-fun m!1375809 () Bool)

(assert (=> b!1491585 m!1375809))

(assert (=> b!1491585 m!1375771))

(declare-fun m!1375811 () Bool)

(assert (=> b!1491585 m!1375811))

(assert (=> b!1491577 m!1375779))

(assert (=> b!1491577 m!1375779))

(declare-fun m!1375813 () Bool)

(assert (=> b!1491577 m!1375813))

(assert (=> b!1491568 m!1375779))

(assert (=> b!1491568 m!1375779))

(declare-fun m!1375815 () Bool)

(assert (=> b!1491568 m!1375815))

(declare-fun m!1375817 () Bool)

(assert (=> b!1491580 m!1375817))

(check-sat (not b!1491570) (not b!1491568) (not b!1491586) (not b!1491585) (not b!1491581) (not b!1491569) (not b!1491587) (not b!1491575) (not b!1491574) (not b!1491589) (not start!127134) (not b!1491580) (not b!1491582) (not b!1491577) (not b!1491576) (not b!1491579))
(check-sat)
