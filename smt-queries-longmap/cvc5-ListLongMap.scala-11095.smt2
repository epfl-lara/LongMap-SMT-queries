; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129592 () Bool)

(assert start!129592)

(declare-fun b!1521316 () Bool)

(declare-fun res!1040539 () Bool)

(declare-fun e!848496 () Bool)

(assert (=> b!1521316 (=> (not res!1040539) (not e!848496))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((array!101267 0))(
  ( (array!101268 (arr!48866 (Array (_ BitVec 32) (_ BitVec 64))) (size!49416 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101267)

(assert (=> b!1521316 (= res!1040539 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49416 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49416 a!2804))))))

(declare-fun b!1521317 () Bool)

(declare-fun res!1040543 () Bool)

(assert (=> b!1521317 (=> (not res!1040543) (not e!848496))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101267 (_ BitVec 32)) Bool)

(assert (=> b!1521317 (= res!1040543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521318 () Bool)

(declare-fun res!1040544 () Bool)

(assert (=> b!1521318 (=> (not res!1040544) (not e!848496))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521318 (= res!1040544 (validKeyInArray!0 (select (arr!48866 a!2804) i!961)))))

(declare-fun b!1521319 () Bool)

(declare-fun res!1040541 () Bool)

(assert (=> b!1521319 (=> (not res!1040541) (not e!848496))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13031 0))(
  ( (MissingZero!13031 (index!54519 (_ BitVec 32))) (Found!13031 (index!54520 (_ BitVec 32))) (Intermediate!13031 (undefined!13843 Bool) (index!54521 (_ BitVec 32)) (x!136219 (_ BitVec 32))) (Undefined!13031) (MissingVacant!13031 (index!54522 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101267 (_ BitVec 32)) SeekEntryResult!13031)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521319 (= res!1040541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48866 a!2804) j!70) mask!2512) (select (arr!48866 a!2804) j!70) a!2804 mask!2512) (Intermediate!13031 false resIndex!21 resX!21)))))

(declare-fun res!1040540 () Bool)

(assert (=> start!129592 (=> (not res!1040540) (not e!848496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129592 (= res!1040540 (validMask!0 mask!2512))))

(assert (=> start!129592 e!848496))

(assert (=> start!129592 true))

(declare-fun array_inv!37894 (array!101267) Bool)

(assert (=> start!129592 (array_inv!37894 a!2804)))

(declare-fun b!1521320 () Bool)

(declare-fun res!1040538 () Bool)

(assert (=> b!1521320 (=> (not res!1040538) (not e!848496))))

(assert (=> b!1521320 (= res!1040538 (validKeyInArray!0 (select (arr!48866 a!2804) j!70)))))

(declare-fun b!1521321 () Bool)

(declare-fun res!1040542 () Bool)

(assert (=> b!1521321 (=> (not res!1040542) (not e!848496))))

(assert (=> b!1521321 (= res!1040542 (and (= (size!49416 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49416 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49416 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521322 () Bool)

(declare-fun res!1040545 () Bool)

(assert (=> b!1521322 (=> (not res!1040545) (not e!848496))))

(declare-datatypes ((List!35349 0))(
  ( (Nil!35346) (Cons!35345 (h!36766 (_ BitVec 64)) (t!50043 List!35349)) )
))
(declare-fun arrayNoDuplicates!0 (array!101267 (_ BitVec 32) List!35349) Bool)

(assert (=> b!1521322 (= res!1040545 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35346))))

(declare-fun b!1521323 () Bool)

(assert (=> b!1521323 (= e!848496 false)))

(declare-fun lt!659335 () SeekEntryResult!13031)

(assert (=> b!1521323 (= lt!659335 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48866 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129592 res!1040540) b!1521321))

(assert (= (and b!1521321 res!1040542) b!1521318))

(assert (= (and b!1521318 res!1040544) b!1521320))

(assert (= (and b!1521320 res!1040538) b!1521317))

(assert (= (and b!1521317 res!1040543) b!1521322))

(assert (= (and b!1521322 res!1040545) b!1521316))

(assert (= (and b!1521316 res!1040539) b!1521319))

(assert (= (and b!1521319 res!1040541) b!1521323))

(declare-fun m!1404419 () Bool)

(assert (=> b!1521320 m!1404419))

(assert (=> b!1521320 m!1404419))

(declare-fun m!1404421 () Bool)

(assert (=> b!1521320 m!1404421))

(declare-fun m!1404423 () Bool)

(assert (=> b!1521318 m!1404423))

(assert (=> b!1521318 m!1404423))

(declare-fun m!1404425 () Bool)

(assert (=> b!1521318 m!1404425))

(declare-fun m!1404427 () Bool)

(assert (=> b!1521322 m!1404427))

(declare-fun m!1404429 () Bool)

(assert (=> start!129592 m!1404429))

(declare-fun m!1404431 () Bool)

(assert (=> start!129592 m!1404431))

(assert (=> b!1521323 m!1404419))

(assert (=> b!1521323 m!1404419))

(declare-fun m!1404433 () Bool)

(assert (=> b!1521323 m!1404433))

(assert (=> b!1521319 m!1404419))

(assert (=> b!1521319 m!1404419))

(declare-fun m!1404435 () Bool)

(assert (=> b!1521319 m!1404435))

(assert (=> b!1521319 m!1404435))

(assert (=> b!1521319 m!1404419))

(declare-fun m!1404437 () Bool)

(assert (=> b!1521319 m!1404437))

(declare-fun m!1404439 () Bool)

(assert (=> b!1521317 m!1404439))

(push 1)

(assert (not b!1521320))

(assert (not b!1521317))

(assert (not b!1521319))

(assert (not b!1521322))

(assert (not b!1521323))

(assert (not b!1521318))

(assert (not start!129592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

