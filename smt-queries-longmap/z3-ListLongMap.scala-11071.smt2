; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129206 () Bool)

(assert start!129206)

(declare-fun b!1517446 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101062 0))(
  ( (array!101063 (arr!48769 (Array (_ BitVec 32) (_ BitVec 64))) (size!49321 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101062)

(declare-fun e!846560 () Bool)

(declare-datatypes ((SeekEntryResult!12963 0))(
  ( (MissingZero!12963 (index!54247 (_ BitVec 32))) (Found!12963 (index!54248 (_ BitVec 32))) (Intermediate!12963 (undefined!13775 Bool) (index!54249 (_ BitVec 32)) (x!135931 (_ BitVec 32))) (Undefined!12963) (MissingVacant!12963 (index!54250 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101062 (_ BitVec 32)) SeekEntryResult!12963)

(assert (=> b!1517446 (= e!846560 (= (seekEntry!0 (select (arr!48769 a!2804) j!70) a!2804 mask!2512) (Found!12963 j!70)))))

(declare-fun b!1517447 () Bool)

(declare-fun res!1037566 () Bool)

(declare-fun e!846563 () Bool)

(assert (=> b!1517447 (=> (not res!1037566) (not e!846563))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517447 (= res!1037566 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49321 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49321 a!2804))))))

(declare-fun b!1517448 () Bool)

(declare-fun res!1037556 () Bool)

(assert (=> b!1517448 (=> (not res!1037556) (not e!846563))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517448 (= res!1037556 (validKeyInArray!0 (select (arr!48769 a!2804) i!961)))))

(declare-fun b!1517449 () Bool)

(declare-fun res!1037565 () Bool)

(assert (=> b!1517449 (=> (not res!1037565) (not e!846563))))

(declare-datatypes ((List!35330 0))(
  ( (Nil!35327) (Cons!35326 (h!36739 (_ BitVec 64)) (t!50016 List!35330)) )
))
(declare-fun arrayNoDuplicates!0 (array!101062 (_ BitVec 32) List!35330) Bool)

(assert (=> b!1517449 (= res!1037565 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35327))))

(declare-fun b!1517450 () Bool)

(declare-fun res!1037560 () Bool)

(assert (=> b!1517450 (=> (not res!1037560) (not e!846563))))

(assert (=> b!1517450 (= res!1037560 (validKeyInArray!0 (select (arr!48769 a!2804) j!70)))))

(declare-fun b!1517451 () Bool)

(declare-fun e!846559 () Bool)

(declare-fun e!846561 () Bool)

(assert (=> b!1517451 (= e!846559 e!846561)))

(declare-fun res!1037558 () Bool)

(assert (=> b!1517451 (=> res!1037558 e!846561)))

(declare-fun lt!657624 () (_ BitVec 32))

(assert (=> b!1517451 (= res!1037558 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657624 #b00000000000000000000000000000000) (bvsge lt!657624 (size!49321 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517451 (= lt!657624 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1037563 () Bool)

(assert (=> start!129206 (=> (not res!1037563) (not e!846563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129206 (= res!1037563 (validMask!0 mask!2512))))

(assert (=> start!129206 e!846563))

(assert (=> start!129206 true))

(declare-fun array_inv!38002 (array!101062) Bool)

(assert (=> start!129206 (array_inv!38002 a!2804)))

(declare-fun b!1517452 () Bool)

(declare-fun res!1037555 () Bool)

(assert (=> b!1517452 (=> (not res!1037555) (not e!846563))))

(assert (=> b!1517452 (= res!1037555 (and (= (size!49321 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49321 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49321 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517453 () Bool)

(declare-fun res!1037561 () Bool)

(assert (=> b!1517453 (=> (not res!1037561) (not e!846563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101062 (_ BitVec 32)) Bool)

(assert (=> b!1517453 (= res!1037561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517454 () Bool)

(declare-fun res!1037567 () Bool)

(declare-fun e!846564 () Bool)

(assert (=> b!1517454 (=> (not res!1037567) (not e!846564))))

(declare-fun lt!657625 () SeekEntryResult!12963)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101062 (_ BitVec 32)) SeekEntryResult!12963)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517454 (= res!1037567 (= lt!657625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101063 (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49321 a!2804)) mask!2512)))))

(declare-fun b!1517455 () Bool)

(assert (=> b!1517455 (= e!846561 true)))

(declare-fun lt!657627 () SeekEntryResult!12963)

(assert (=> b!1517455 (= lt!657627 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657624 (select (arr!48769 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517456 () Bool)

(assert (=> b!1517456 (= e!846563 e!846564)))

(declare-fun res!1037557 () Bool)

(assert (=> b!1517456 (=> (not res!1037557) (not e!846564))))

(declare-fun lt!657623 () SeekEntryResult!12963)

(assert (=> b!1517456 (= res!1037557 (= lt!657625 lt!657623))))

(assert (=> b!1517456 (= lt!657623 (Intermediate!12963 false resIndex!21 resX!21))))

(assert (=> b!1517456 (= lt!657625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48769 a!2804) j!70) mask!2512) (select (arr!48769 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517457 () Bool)

(assert (=> b!1517457 (= e!846564 (not e!846559))))

(declare-fun res!1037564 () Bool)

(assert (=> b!1517457 (=> res!1037564 e!846559)))

(assert (=> b!1517457 (= res!1037564 (or (not (= (select (arr!48769 a!2804) j!70) (select (store (arr!48769 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517457 e!846560))

(declare-fun res!1037562 () Bool)

(assert (=> b!1517457 (=> (not res!1037562) (not e!846560))))

(assert (=> b!1517457 (= res!1037562 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50633 0))(
  ( (Unit!50634) )
))
(declare-fun lt!657626 () Unit!50633)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50633)

(assert (=> b!1517457 (= lt!657626 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517458 () Bool)

(declare-fun res!1037559 () Bool)

(assert (=> b!1517458 (=> (not res!1037559) (not e!846564))))

(assert (=> b!1517458 (= res!1037559 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48769 a!2804) j!70) a!2804 mask!2512) lt!657623))))

(assert (= (and start!129206 res!1037563) b!1517452))

(assert (= (and b!1517452 res!1037555) b!1517448))

(assert (= (and b!1517448 res!1037556) b!1517450))

(assert (= (and b!1517450 res!1037560) b!1517453))

(assert (= (and b!1517453 res!1037561) b!1517449))

(assert (= (and b!1517449 res!1037565) b!1517447))

(assert (= (and b!1517447 res!1037566) b!1517456))

(assert (= (and b!1517456 res!1037557) b!1517458))

(assert (= (and b!1517458 res!1037559) b!1517454))

(assert (= (and b!1517454 res!1037567) b!1517457))

(assert (= (and b!1517457 res!1037562) b!1517446))

(assert (= (and b!1517457 (not res!1037564)) b!1517451))

(assert (= (and b!1517451 (not res!1037558)) b!1517455))

(declare-fun m!1400177 () Bool)

(assert (=> b!1517456 m!1400177))

(assert (=> b!1517456 m!1400177))

(declare-fun m!1400179 () Bool)

(assert (=> b!1517456 m!1400179))

(assert (=> b!1517456 m!1400179))

(assert (=> b!1517456 m!1400177))

(declare-fun m!1400181 () Bool)

(assert (=> b!1517456 m!1400181))

(declare-fun m!1400183 () Bool)

(assert (=> b!1517454 m!1400183))

(declare-fun m!1400185 () Bool)

(assert (=> b!1517454 m!1400185))

(assert (=> b!1517454 m!1400185))

(declare-fun m!1400187 () Bool)

(assert (=> b!1517454 m!1400187))

(assert (=> b!1517454 m!1400187))

(assert (=> b!1517454 m!1400185))

(declare-fun m!1400189 () Bool)

(assert (=> b!1517454 m!1400189))

(declare-fun m!1400191 () Bool)

(assert (=> b!1517448 m!1400191))

(assert (=> b!1517448 m!1400191))

(declare-fun m!1400193 () Bool)

(assert (=> b!1517448 m!1400193))

(assert (=> b!1517450 m!1400177))

(assert (=> b!1517450 m!1400177))

(declare-fun m!1400195 () Bool)

(assert (=> b!1517450 m!1400195))

(declare-fun m!1400197 () Bool)

(assert (=> b!1517453 m!1400197))

(declare-fun m!1400199 () Bool)

(assert (=> b!1517451 m!1400199))

(assert (=> b!1517458 m!1400177))

(assert (=> b!1517458 m!1400177))

(declare-fun m!1400201 () Bool)

(assert (=> b!1517458 m!1400201))

(declare-fun m!1400203 () Bool)

(assert (=> start!129206 m!1400203))

(declare-fun m!1400205 () Bool)

(assert (=> start!129206 m!1400205))

(assert (=> b!1517457 m!1400177))

(declare-fun m!1400207 () Bool)

(assert (=> b!1517457 m!1400207))

(assert (=> b!1517457 m!1400183))

(assert (=> b!1517457 m!1400185))

(declare-fun m!1400209 () Bool)

(assert (=> b!1517457 m!1400209))

(declare-fun m!1400211 () Bool)

(assert (=> b!1517449 m!1400211))

(assert (=> b!1517446 m!1400177))

(assert (=> b!1517446 m!1400177))

(declare-fun m!1400213 () Bool)

(assert (=> b!1517446 m!1400213))

(assert (=> b!1517455 m!1400177))

(assert (=> b!1517455 m!1400177))

(declare-fun m!1400215 () Bool)

(assert (=> b!1517455 m!1400215))

(check-sat (not b!1517453) (not b!1517451) (not b!1517455) (not start!129206) (not b!1517448) (not b!1517456) (not b!1517449) (not b!1517450) (not b!1517457) (not b!1517454) (not b!1517446) (not b!1517458))
(check-sat)
