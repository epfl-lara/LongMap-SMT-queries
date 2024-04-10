; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128804 () Bool)

(assert start!128804)

(declare-fun b!1509282 () Bool)

(declare-fun res!1029190 () Bool)

(declare-fun e!843051 () Bool)

(assert (=> b!1509282 (=> (not res!1029190) (not e!843051))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100660 0))(
  ( (array!100661 (arr!48567 (Array (_ BitVec 32) (_ BitVec 64))) (size!49117 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100660)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509282 (= res!1029190 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49117 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49117 a!2804))))))

(declare-fun b!1509283 () Bool)

(declare-fun res!1029187 () Bool)

(assert (=> b!1509283 (=> (not res!1029187) (not e!843051))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509283 (= res!1029187 (validKeyInArray!0 (select (arr!48567 a!2804) i!961)))))

(declare-fun res!1029191 () Bool)

(assert (=> start!128804 (=> (not res!1029191) (not e!843051))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128804 (= res!1029191 (validMask!0 mask!2512))))

(assert (=> start!128804 e!843051))

(assert (=> start!128804 true))

(declare-fun array_inv!37595 (array!100660) Bool)

(assert (=> start!128804 (array_inv!37595 a!2804)))

(declare-fun b!1509284 () Bool)

(declare-fun e!843052 () Bool)

(assert (=> b!1509284 (= e!843051 e!843052)))

(declare-fun res!1029188 () Bool)

(assert (=> b!1509284 (=> (not res!1029188) (not e!843052))))

(declare-datatypes ((SeekEntryResult!12738 0))(
  ( (MissingZero!12738 (index!53347 (_ BitVec 32))) (Found!12738 (index!53348 (_ BitVec 32))) (Intermediate!12738 (undefined!13550 Bool) (index!53349 (_ BitVec 32)) (x!135104 (_ BitVec 32))) (Undefined!12738) (MissingVacant!12738 (index!53350 (_ BitVec 32))) )
))
(declare-fun lt!654850 () SeekEntryResult!12738)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100660 (_ BitVec 32)) SeekEntryResult!12738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509284 (= res!1029188 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48567 a!2804) j!70) mask!2512) (select (arr!48567 a!2804) j!70) a!2804 mask!2512) lt!654850))))

(assert (=> b!1509284 (= lt!654850 (Intermediate!12738 false resIndex!21 resX!21))))

(declare-fun b!1509285 () Bool)

(assert (=> b!1509285 (= e!843052 false)))

(declare-fun lt!654849 () SeekEntryResult!12738)

(assert (=> b!1509285 (= lt!654849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48567 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48567 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100661 (store (arr!48567 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49117 a!2804)) mask!2512))))

(declare-fun b!1509286 () Bool)

(declare-fun res!1029192 () Bool)

(assert (=> b!1509286 (=> (not res!1029192) (not e!843051))))

(assert (=> b!1509286 (= res!1029192 (validKeyInArray!0 (select (arr!48567 a!2804) j!70)))))

(declare-fun b!1509287 () Bool)

(declare-fun res!1029193 () Bool)

(assert (=> b!1509287 (=> (not res!1029193) (not e!843051))))

(assert (=> b!1509287 (= res!1029193 (and (= (size!49117 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49117 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49117 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509288 () Bool)

(declare-fun res!1029185 () Bool)

(assert (=> b!1509288 (=> (not res!1029185) (not e!843051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100660 (_ BitVec 32)) Bool)

(assert (=> b!1509288 (= res!1029185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509289 () Bool)

(declare-fun res!1029189 () Bool)

(assert (=> b!1509289 (=> (not res!1029189) (not e!843051))))

(declare-datatypes ((List!35050 0))(
  ( (Nil!35047) (Cons!35046 (h!36458 (_ BitVec 64)) (t!49744 List!35050)) )
))
(declare-fun arrayNoDuplicates!0 (array!100660 (_ BitVec 32) List!35050) Bool)

(assert (=> b!1509289 (= res!1029189 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35047))))

(declare-fun b!1509290 () Bool)

(declare-fun res!1029186 () Bool)

(assert (=> b!1509290 (=> (not res!1029186) (not e!843052))))

(assert (=> b!1509290 (= res!1029186 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48567 a!2804) j!70) a!2804 mask!2512) lt!654850))))

(assert (= (and start!128804 res!1029191) b!1509287))

(assert (= (and b!1509287 res!1029193) b!1509283))

(assert (= (and b!1509283 res!1029187) b!1509286))

(assert (= (and b!1509286 res!1029192) b!1509288))

(assert (= (and b!1509288 res!1029185) b!1509289))

(assert (= (and b!1509289 res!1029189) b!1509282))

(assert (= (and b!1509282 res!1029190) b!1509284))

(assert (= (and b!1509284 res!1029188) b!1509290))

(assert (= (and b!1509290 res!1029186) b!1509285))

(declare-fun m!1391743 () Bool)

(assert (=> b!1509285 m!1391743))

(declare-fun m!1391745 () Bool)

(assert (=> b!1509285 m!1391745))

(assert (=> b!1509285 m!1391745))

(declare-fun m!1391747 () Bool)

(assert (=> b!1509285 m!1391747))

(assert (=> b!1509285 m!1391747))

(assert (=> b!1509285 m!1391745))

(declare-fun m!1391749 () Bool)

(assert (=> b!1509285 m!1391749))

(declare-fun m!1391751 () Bool)

(assert (=> b!1509283 m!1391751))

(assert (=> b!1509283 m!1391751))

(declare-fun m!1391753 () Bool)

(assert (=> b!1509283 m!1391753))

(declare-fun m!1391755 () Bool)

(assert (=> b!1509288 m!1391755))

(declare-fun m!1391757 () Bool)

(assert (=> b!1509290 m!1391757))

(assert (=> b!1509290 m!1391757))

(declare-fun m!1391759 () Bool)

(assert (=> b!1509290 m!1391759))

(assert (=> b!1509286 m!1391757))

(assert (=> b!1509286 m!1391757))

(declare-fun m!1391761 () Bool)

(assert (=> b!1509286 m!1391761))

(declare-fun m!1391763 () Bool)

(assert (=> start!128804 m!1391763))

(declare-fun m!1391765 () Bool)

(assert (=> start!128804 m!1391765))

(declare-fun m!1391767 () Bool)

(assert (=> b!1509289 m!1391767))

(assert (=> b!1509284 m!1391757))

(assert (=> b!1509284 m!1391757))

(declare-fun m!1391769 () Bool)

(assert (=> b!1509284 m!1391769))

(assert (=> b!1509284 m!1391769))

(assert (=> b!1509284 m!1391757))

(declare-fun m!1391771 () Bool)

(assert (=> b!1509284 m!1391771))

(check-sat (not b!1509286) (not b!1509285) (not b!1509288) (not b!1509289) (not b!1509290) (not b!1509284) (not b!1509283) (not start!128804))
(check-sat)
