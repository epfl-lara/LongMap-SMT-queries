; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125364 () Bool)

(assert start!125364)

(declare-fun b!1459789 () Bool)

(declare-fun res!989093 () Bool)

(declare-fun e!821192 () Bool)

(assert (=> b!1459789 (=> (not res!989093) (not e!821192))))

(declare-datatypes ((array!98707 0))(
  ( (array!98708 (arr!47638 (Array (_ BitVec 32) (_ BitVec 64))) (size!48189 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98707)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98707 (_ BitVec 32)) Bool)

(assert (=> b!1459789 (= res!989093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459790 () Bool)

(declare-fun res!989086 () Bool)

(declare-fun e!821194 () Bool)

(assert (=> b!1459790 (=> (not res!989086) (not e!821194))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1459790 (= res!989086 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459791 () Bool)

(declare-fun lt!639534 () (_ BitVec 64))

(declare-fun e!821199 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!639530 () array!98707)

(declare-datatypes ((SeekEntryResult!11787 0))(
  ( (MissingZero!11787 (index!49540 (_ BitVec 32))) (Found!11787 (index!49541 (_ BitVec 32))) (Intermediate!11787 (undefined!12599 Bool) (index!49542 (_ BitVec 32)) (x!131332 (_ BitVec 32))) (Undefined!11787) (MissingVacant!11787 (index!49543 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98707 (_ BitVec 32)) SeekEntryResult!11787)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98707 (_ BitVec 32)) SeekEntryResult!11787)

(assert (=> b!1459791 (= e!821199 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639534 lt!639530 mask!2687) (seekEntryOrOpen!0 lt!639534 lt!639530 mask!2687)))))

(declare-fun b!1459792 () Bool)

(declare-fun e!821197 () Bool)

(declare-fun e!821190 () Bool)

(assert (=> b!1459792 (= e!821197 e!821190)))

(declare-fun res!989092 () Bool)

(assert (=> b!1459792 (=> (not res!989092) (not e!821190))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!639531 () SeekEntryResult!11787)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98707 (_ BitVec 32)) SeekEntryResult!11787)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459792 (= res!989092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47638 a!2862) j!93) mask!2687) (select (arr!47638 a!2862) j!93) a!2862 mask!2687) lt!639531))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1459792 (= lt!639531 (Intermediate!11787 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459793 () Bool)

(declare-fun res!989082 () Bool)

(assert (=> b!1459793 (=> (not res!989082) (not e!821192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459793 (= res!989082 (validKeyInArray!0 (select (arr!47638 a!2862) j!93)))))

(declare-fun b!1459794 () Bool)

(declare-fun res!989091 () Bool)

(assert (=> b!1459794 (=> (not res!989091) (not e!821190))))

(assert (=> b!1459794 (= res!989091 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47638 a!2862) j!93) a!2862 mask!2687) lt!639531))))

(declare-fun b!1459795 () Bool)

(declare-fun res!989080 () Bool)

(assert (=> b!1459795 (=> (not res!989080) (not e!821192))))

(assert (=> b!1459795 (= res!989080 (and (= (size!48189 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48189 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48189 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!989087 () Bool)

(assert (=> start!125364 (=> (not res!989087) (not e!821192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125364 (= res!989087 (validMask!0 mask!2687))))

(assert (=> start!125364 e!821192))

(assert (=> start!125364 true))

(declare-fun array_inv!36919 (array!98707) Bool)

(assert (=> start!125364 (array_inv!36919 a!2862)))

(declare-fun b!1459796 () Bool)

(declare-fun res!989079 () Bool)

(declare-fun e!821191 () Bool)

(assert (=> b!1459796 (=> (not res!989079) (not e!821191))))

(assert (=> b!1459796 (= res!989079 (= (seekEntryOrOpen!0 (select (arr!47638 a!2862) j!93) a!2862 mask!2687) (Found!11787 j!93)))))

(declare-fun b!1459797 () Bool)

(declare-fun res!989085 () Bool)

(assert (=> b!1459797 (=> (not res!989085) (not e!821192))))

(declare-datatypes ((List!34126 0))(
  ( (Nil!34123) (Cons!34122 (h!35483 (_ BitVec 64)) (t!48812 List!34126)) )
))
(declare-fun arrayNoDuplicates!0 (array!98707 (_ BitVec 32) List!34126) Bool)

(assert (=> b!1459797 (= res!989085 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34123))))

(declare-fun lt!639532 () (_ BitVec 32))

(declare-fun e!821193 () Bool)

(declare-fun b!1459798 () Bool)

(declare-fun lt!639533 () SeekEntryResult!11787)

(assert (=> b!1459798 (= e!821193 (not (= lt!639533 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639532 lt!639534 lt!639530 mask!2687))))))

(declare-fun b!1459799 () Bool)

(declare-fun res!989094 () Bool)

(assert (=> b!1459799 (=> (not res!989094) (not e!821192))))

(assert (=> b!1459799 (= res!989094 (validKeyInArray!0 (select (arr!47638 a!2862) i!1006)))))

(declare-fun b!1459800 () Bool)

(declare-fun res!989084 () Bool)

(assert (=> b!1459800 (=> (not res!989084) (not e!821192))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459800 (= res!989084 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48189 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48189 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48189 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459801 () Bool)

(declare-fun res!989081 () Bool)

(assert (=> b!1459801 (=> (not res!989081) (not e!821194))))

(assert (=> b!1459801 (= res!989081 e!821199)))

(declare-fun c!134874 () Bool)

(assert (=> b!1459801 (= c!134874 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459802 () Bool)

(declare-fun e!821198 () Bool)

(assert (=> b!1459802 (= e!821194 (not e!821198))))

(declare-fun res!989096 () Bool)

(assert (=> b!1459802 (=> res!989096 e!821198)))

(assert (=> b!1459802 (= res!989096 (or (and (= (select (arr!47638 a!2862) index!646) (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47638 a!2862) index!646) (select (arr!47638 a!2862) j!93))) (= (select (arr!47638 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459802 e!821191))

(declare-fun res!989095 () Bool)

(assert (=> b!1459802 (=> (not res!989095) (not e!821191))))

(assert (=> b!1459802 (= res!989095 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49103 0))(
  ( (Unit!49104) )
))
(declare-fun lt!639529 () Unit!49103)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49103)

(assert (=> b!1459802 (= lt!639529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459803 () Bool)

(assert (=> b!1459803 (= e!821192 e!821197)))

(declare-fun res!989083 () Bool)

(assert (=> b!1459803 (=> (not res!989083) (not e!821197))))

(assert (=> b!1459803 (= res!989083 (= (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459803 (= lt!639530 (array!98708 (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48189 a!2862)))))

(declare-fun b!1459804 () Bool)

(declare-fun e!821195 () Bool)

(assert (=> b!1459804 (= e!821195 true)))

(declare-fun lt!639535 () Bool)

(assert (=> b!1459804 (= lt!639535 e!821193)))

(declare-fun c!134875 () Bool)

(assert (=> b!1459804 (= c!134875 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun lt!639528 () SeekEntryResult!11787)

(declare-fun b!1459805 () Bool)

(assert (=> b!1459805 (= e!821193 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639532 intermediateAfterIndex!19 lt!639534 lt!639530 mask!2687) lt!639528)))))

(declare-fun b!1459806 () Bool)

(assert (=> b!1459806 (= e!821191 (and (or (= (select (arr!47638 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47638 a!2862) intermediateBeforeIndex!19) (select (arr!47638 a!2862) j!93))) (let ((bdg!53432 (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47638 a!2862) index!646) bdg!53432) (= (select (arr!47638 a!2862) index!646) (select (arr!47638 a!2862) j!93))) (= (select (arr!47638 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53432 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1459807 () Bool)

(declare-fun res!989088 () Bool)

(assert (=> b!1459807 (=> res!989088 e!821195)))

(assert (=> b!1459807 (= res!989088 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639532 (select (arr!47638 a!2862) j!93) a!2862 mask!2687) lt!639531)))))

(declare-fun b!1459808 () Bool)

(assert (=> b!1459808 (= e!821198 e!821195)))

(declare-fun res!989090 () Bool)

(assert (=> b!1459808 (=> res!989090 e!821195)))

(assert (=> b!1459808 (= res!989090 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639532 #b00000000000000000000000000000000) (bvsge lt!639532 (size!48189 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459808 (= lt!639532 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1459808 (= lt!639528 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639534 lt!639530 mask!2687))))

(assert (=> b!1459808 (= lt!639528 (seekEntryOrOpen!0 lt!639534 lt!639530 mask!2687))))

(declare-fun b!1459809 () Bool)

(assert (=> b!1459809 (= e!821199 (= lt!639533 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639534 lt!639530 mask!2687)))))

(declare-fun b!1459810 () Bool)

(assert (=> b!1459810 (= e!821190 e!821194)))

(declare-fun res!989089 () Bool)

(assert (=> b!1459810 (=> (not res!989089) (not e!821194))))

(assert (=> b!1459810 (= res!989089 (= lt!639533 (Intermediate!11787 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459810 (= lt!639533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639534 mask!2687) lt!639534 lt!639530 mask!2687))))

(assert (=> b!1459810 (= lt!639534 (select (store (arr!47638 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125364 res!989087) b!1459795))

(assert (= (and b!1459795 res!989080) b!1459799))

(assert (= (and b!1459799 res!989094) b!1459793))

(assert (= (and b!1459793 res!989082) b!1459789))

(assert (= (and b!1459789 res!989093) b!1459797))

(assert (= (and b!1459797 res!989085) b!1459800))

(assert (= (and b!1459800 res!989084) b!1459803))

(assert (= (and b!1459803 res!989083) b!1459792))

(assert (= (and b!1459792 res!989092) b!1459794))

(assert (= (and b!1459794 res!989091) b!1459810))

(assert (= (and b!1459810 res!989089) b!1459801))

(assert (= (and b!1459801 c!134874) b!1459809))

(assert (= (and b!1459801 (not c!134874)) b!1459791))

(assert (= (and b!1459801 res!989081) b!1459790))

(assert (= (and b!1459790 res!989086) b!1459802))

(assert (= (and b!1459802 res!989095) b!1459796))

(assert (= (and b!1459796 res!989079) b!1459806))

(assert (= (and b!1459802 (not res!989096)) b!1459808))

(assert (= (and b!1459808 (not res!989090)) b!1459807))

(assert (= (and b!1459807 (not res!989088)) b!1459804))

(assert (= (and b!1459804 c!134875) b!1459798))

(assert (= (and b!1459804 (not c!134875)) b!1459805))

(declare-fun m!1347757 () Bool)

(assert (=> b!1459809 m!1347757))

(declare-fun m!1347759 () Bool)

(assert (=> b!1459793 m!1347759))

(assert (=> b!1459793 m!1347759))

(declare-fun m!1347761 () Bool)

(assert (=> b!1459793 m!1347761))

(declare-fun m!1347763 () Bool)

(assert (=> b!1459802 m!1347763))

(declare-fun m!1347765 () Bool)

(assert (=> b!1459802 m!1347765))

(declare-fun m!1347767 () Bool)

(assert (=> b!1459802 m!1347767))

(declare-fun m!1347769 () Bool)

(assert (=> b!1459802 m!1347769))

(declare-fun m!1347771 () Bool)

(assert (=> b!1459802 m!1347771))

(assert (=> b!1459802 m!1347759))

(assert (=> b!1459807 m!1347759))

(assert (=> b!1459807 m!1347759))

(declare-fun m!1347773 () Bool)

(assert (=> b!1459807 m!1347773))

(declare-fun m!1347775 () Bool)

(assert (=> b!1459808 m!1347775))

(declare-fun m!1347777 () Bool)

(assert (=> b!1459808 m!1347777))

(declare-fun m!1347779 () Bool)

(assert (=> b!1459808 m!1347779))

(declare-fun m!1347781 () Bool)

(assert (=> b!1459797 m!1347781))

(assert (=> b!1459803 m!1347765))

(declare-fun m!1347783 () Bool)

(assert (=> b!1459803 m!1347783))

(declare-fun m!1347785 () Bool)

(assert (=> b!1459799 m!1347785))

(assert (=> b!1459799 m!1347785))

(declare-fun m!1347787 () Bool)

(assert (=> b!1459799 m!1347787))

(declare-fun m!1347789 () Bool)

(assert (=> b!1459798 m!1347789))

(assert (=> b!1459794 m!1347759))

(assert (=> b!1459794 m!1347759))

(declare-fun m!1347791 () Bool)

(assert (=> b!1459794 m!1347791))

(assert (=> b!1459791 m!1347777))

(assert (=> b!1459791 m!1347779))

(declare-fun m!1347793 () Bool)

(assert (=> b!1459789 m!1347793))

(assert (=> b!1459796 m!1347759))

(assert (=> b!1459796 m!1347759))

(declare-fun m!1347795 () Bool)

(assert (=> b!1459796 m!1347795))

(declare-fun m!1347797 () Bool)

(assert (=> b!1459805 m!1347797))

(assert (=> b!1459792 m!1347759))

(assert (=> b!1459792 m!1347759))

(declare-fun m!1347799 () Bool)

(assert (=> b!1459792 m!1347799))

(assert (=> b!1459792 m!1347799))

(assert (=> b!1459792 m!1347759))

(declare-fun m!1347801 () Bool)

(assert (=> b!1459792 m!1347801))

(declare-fun m!1347803 () Bool)

(assert (=> start!125364 m!1347803))

(declare-fun m!1347805 () Bool)

(assert (=> start!125364 m!1347805))

(declare-fun m!1347807 () Bool)

(assert (=> b!1459810 m!1347807))

(assert (=> b!1459810 m!1347807))

(declare-fun m!1347809 () Bool)

(assert (=> b!1459810 m!1347809))

(assert (=> b!1459810 m!1347765))

(declare-fun m!1347811 () Bool)

(assert (=> b!1459810 m!1347811))

(assert (=> b!1459806 m!1347765))

(declare-fun m!1347813 () Bool)

(assert (=> b!1459806 m!1347813))

(assert (=> b!1459806 m!1347767))

(assert (=> b!1459806 m!1347769))

(assert (=> b!1459806 m!1347759))

(check-sat (not b!1459807) (not b!1459798) (not b!1459808) (not b!1459797) (not b!1459789) (not b!1459809) (not start!125364) (not b!1459793) (not b!1459805) (not b!1459796) (not b!1459810) (not b!1459802) (not b!1459792) (not b!1459794) (not b!1459799) (not b!1459791))
(check-sat)
