; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128578 () Bool)

(assert start!128578)

(declare-fun b!1507383 () Bool)

(declare-fun e!842250 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1507383 (= e!842250 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1507384 () Bool)

(declare-fun res!1027604 () Bool)

(declare-fun e!842249 () Bool)

(assert (=> b!1507384 (=> (not res!1027604) (not e!842249))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100551 0))(
  ( (array!100552 (arr!48517 (Array (_ BitVec 32) (_ BitVec 64))) (size!49067 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100551)

(assert (=> b!1507384 (= res!1027604 (and (= (size!49067 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49067 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49067 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507385 () Bool)

(declare-fun res!1027607 () Bool)

(assert (=> b!1507385 (=> (not res!1027607) (not e!842249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507385 (= res!1027607 (validKeyInArray!0 (select (arr!48517 a!2804) j!70)))))

(declare-fun b!1507386 () Bool)

(declare-fun res!1027602 () Bool)

(assert (=> b!1507386 (=> (not res!1027602) (not e!842249))))

(declare-datatypes ((List!35000 0))(
  ( (Nil!34997) (Cons!34996 (h!36399 (_ BitVec 64)) (t!49694 List!35000)) )
))
(declare-fun arrayNoDuplicates!0 (array!100551 (_ BitVec 32) List!35000) Bool)

(assert (=> b!1507386 (= res!1027602 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34997))))

(declare-fun b!1507387 () Bool)

(assert (=> b!1507387 (= e!842249 e!842250)))

(declare-fun res!1027606 () Bool)

(assert (=> b!1507387 (=> (not res!1027606) (not e!842250))))

(declare-datatypes ((SeekEntryResult!12688 0))(
  ( (MissingZero!12688 (index!53147 (_ BitVec 32))) (Found!12688 (index!53148 (_ BitVec 32))) (Intermediate!12688 (undefined!13500 Bool) (index!53149 (_ BitVec 32)) (x!134900 (_ BitVec 32))) (Undefined!12688) (MissingVacant!12688 (index!53150 (_ BitVec 32))) )
))
(declare-fun lt!654382 () SeekEntryResult!12688)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100551 (_ BitVec 32)) SeekEntryResult!12688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507387 (= res!1027606 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48517 a!2804) j!70) mask!2512) (select (arr!48517 a!2804) j!70) a!2804 mask!2512) lt!654382))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507387 (= lt!654382 (Intermediate!12688 false resIndex!21 resX!21))))

(declare-fun res!1027605 () Bool)

(assert (=> start!128578 (=> (not res!1027605) (not e!842249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128578 (= res!1027605 (validMask!0 mask!2512))))

(assert (=> start!128578 e!842249))

(assert (=> start!128578 true))

(declare-fun array_inv!37545 (array!100551) Bool)

(assert (=> start!128578 (array_inv!37545 a!2804)))

(declare-fun b!1507388 () Bool)

(declare-fun res!1027601 () Bool)

(assert (=> b!1507388 (=> (not res!1027601) (not e!842249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100551 (_ BitVec 32)) Bool)

(assert (=> b!1507388 (= res!1027601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507389 () Bool)

(declare-fun res!1027609 () Bool)

(assert (=> b!1507389 (=> (not res!1027609) (not e!842250))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507389 (= res!1027609 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48517 a!2804) j!70) a!2804 mask!2512) lt!654382))))

(declare-fun b!1507390 () Bool)

(declare-fun res!1027608 () Bool)

(assert (=> b!1507390 (=> (not res!1027608) (not e!842249))))

(assert (=> b!1507390 (= res!1027608 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49067 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49067 a!2804))))))

(declare-fun b!1507391 () Bool)

(declare-fun res!1027603 () Bool)

(assert (=> b!1507391 (=> (not res!1027603) (not e!842249))))

(assert (=> b!1507391 (= res!1027603 (validKeyInArray!0 (select (arr!48517 a!2804) i!961)))))

(assert (= (and start!128578 res!1027605) b!1507384))

(assert (= (and b!1507384 res!1027604) b!1507391))

(assert (= (and b!1507391 res!1027603) b!1507385))

(assert (= (and b!1507385 res!1027607) b!1507388))

(assert (= (and b!1507388 res!1027601) b!1507386))

(assert (= (and b!1507386 res!1027602) b!1507390))

(assert (= (and b!1507390 res!1027608) b!1507387))

(assert (= (and b!1507387 res!1027606) b!1507389))

(assert (= (and b!1507389 res!1027609) b!1507383))

(declare-fun m!1390137 () Bool)

(assert (=> b!1507388 m!1390137))

(declare-fun m!1390139 () Bool)

(assert (=> b!1507391 m!1390139))

(assert (=> b!1507391 m!1390139))

(declare-fun m!1390141 () Bool)

(assert (=> b!1507391 m!1390141))

(declare-fun m!1390143 () Bool)

(assert (=> b!1507389 m!1390143))

(assert (=> b!1507389 m!1390143))

(declare-fun m!1390145 () Bool)

(assert (=> b!1507389 m!1390145))

(declare-fun m!1390147 () Bool)

(assert (=> b!1507386 m!1390147))

(declare-fun m!1390149 () Bool)

(assert (=> start!128578 m!1390149))

(declare-fun m!1390151 () Bool)

(assert (=> start!128578 m!1390151))

(assert (=> b!1507385 m!1390143))

(assert (=> b!1507385 m!1390143))

(declare-fun m!1390153 () Bool)

(assert (=> b!1507385 m!1390153))

(assert (=> b!1507387 m!1390143))

(assert (=> b!1507387 m!1390143))

(declare-fun m!1390155 () Bool)

(assert (=> b!1507387 m!1390155))

(assert (=> b!1507387 m!1390155))

(assert (=> b!1507387 m!1390143))

(declare-fun m!1390157 () Bool)

(assert (=> b!1507387 m!1390157))

(push 1)

(assert (not b!1507391))

(assert (not b!1507385))

(assert (not start!128578))

(assert (not b!1507386))

(assert (not b!1507388))

(assert (not b!1507389))

(assert (not b!1507387))

