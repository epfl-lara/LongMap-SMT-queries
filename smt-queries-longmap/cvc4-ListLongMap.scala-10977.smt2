; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128572 () Bool)

(assert start!128572)

(declare-fun b!1507303 () Bool)

(declare-fun res!1027527 () Bool)

(declare-fun e!842224 () Bool)

(assert (=> b!1507303 (=> (not res!1027527) (not e!842224))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100545 0))(
  ( (array!100546 (arr!48514 (Array (_ BitVec 32) (_ BitVec 64))) (size!49064 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100545)

(assert (=> b!1507303 (= res!1027527 (and (= (size!49064 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49064 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49064 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507304 () Bool)

(declare-fun res!1027526 () Bool)

(assert (=> b!1507304 (=> (not res!1027526) (not e!842224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100545 (_ BitVec 32)) Bool)

(assert (=> b!1507304 (= res!1027526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507305 () Bool)

(declare-fun res!1027521 () Bool)

(assert (=> b!1507305 (=> (not res!1027521) (not e!842224))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507305 (= res!1027521 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49064 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49064 a!2804))))))

(declare-fun b!1507306 () Bool)

(declare-fun res!1027523 () Bool)

(assert (=> b!1507306 (=> (not res!1027523) (not e!842224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507306 (= res!1027523 (validKeyInArray!0 (select (arr!48514 a!2804) i!961)))))

(declare-fun b!1507307 () Bool)

(declare-fun res!1027525 () Bool)

(assert (=> b!1507307 (=> (not res!1027525) (not e!842224))))

(declare-datatypes ((SeekEntryResult!12685 0))(
  ( (MissingZero!12685 (index!53135 (_ BitVec 32))) (Found!12685 (index!53136 (_ BitVec 32))) (Intermediate!12685 (undefined!13497 Bool) (index!53137 (_ BitVec 32)) (x!134889 (_ BitVec 32))) (Undefined!12685) (MissingVacant!12685 (index!53138 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100545 (_ BitVec 32)) SeekEntryResult!12685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507307 (= res!1027525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48514 a!2804) j!70) mask!2512) (select (arr!48514 a!2804) j!70) a!2804 mask!2512) (Intermediate!12685 false resIndex!21 resX!21)))))

(declare-fun b!1507309 () Bool)

(assert (=> b!1507309 (= e!842224 false)))

(declare-fun lt!654373 () SeekEntryResult!12685)

(assert (=> b!1507309 (= lt!654373 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48514 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507310 () Bool)

(declare-fun res!1027528 () Bool)

(assert (=> b!1507310 (=> (not res!1027528) (not e!842224))))

(declare-datatypes ((List!34997 0))(
  ( (Nil!34994) (Cons!34993 (h!36396 (_ BitVec 64)) (t!49691 List!34997)) )
))
(declare-fun arrayNoDuplicates!0 (array!100545 (_ BitVec 32) List!34997) Bool)

(assert (=> b!1507310 (= res!1027528 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34994))))

(declare-fun b!1507308 () Bool)

(declare-fun res!1027524 () Bool)

(assert (=> b!1507308 (=> (not res!1027524) (not e!842224))))

(assert (=> b!1507308 (= res!1027524 (validKeyInArray!0 (select (arr!48514 a!2804) j!70)))))

(declare-fun res!1027522 () Bool)

(assert (=> start!128572 (=> (not res!1027522) (not e!842224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128572 (= res!1027522 (validMask!0 mask!2512))))

(assert (=> start!128572 e!842224))

(assert (=> start!128572 true))

(declare-fun array_inv!37542 (array!100545) Bool)

(assert (=> start!128572 (array_inv!37542 a!2804)))

(assert (= (and start!128572 res!1027522) b!1507303))

(assert (= (and b!1507303 res!1027527) b!1507306))

(assert (= (and b!1507306 res!1027523) b!1507308))

(assert (= (and b!1507308 res!1027524) b!1507304))

(assert (= (and b!1507304 res!1027526) b!1507310))

(assert (= (and b!1507310 res!1027528) b!1507305))

(assert (= (and b!1507305 res!1027521) b!1507307))

(assert (= (and b!1507307 res!1027525) b!1507309))

(declare-fun m!1390071 () Bool)

(assert (=> b!1507307 m!1390071))

(assert (=> b!1507307 m!1390071))

(declare-fun m!1390073 () Bool)

(assert (=> b!1507307 m!1390073))

(assert (=> b!1507307 m!1390073))

(assert (=> b!1507307 m!1390071))

(declare-fun m!1390075 () Bool)

(assert (=> b!1507307 m!1390075))

(declare-fun m!1390077 () Bool)

(assert (=> b!1507304 m!1390077))

(assert (=> b!1507308 m!1390071))

(assert (=> b!1507308 m!1390071))

(declare-fun m!1390079 () Bool)

(assert (=> b!1507308 m!1390079))

(declare-fun m!1390081 () Bool)

(assert (=> start!128572 m!1390081))

(declare-fun m!1390083 () Bool)

(assert (=> start!128572 m!1390083))

(declare-fun m!1390085 () Bool)

(assert (=> b!1507310 m!1390085))

(assert (=> b!1507309 m!1390071))

(assert (=> b!1507309 m!1390071))

(declare-fun m!1390087 () Bool)

(assert (=> b!1507309 m!1390087))

(declare-fun m!1390089 () Bool)

(assert (=> b!1507306 m!1390089))

(assert (=> b!1507306 m!1390089))

(declare-fun m!1390091 () Bool)

(assert (=> b!1507306 m!1390091))

(push 1)

(assert (not b!1507306))

(assert (not b!1507309))

(assert (not b!1507308))

(assert (not b!1507310))

(assert (not start!128572))

(assert (not b!1507304))

(assert (not b!1507307))

(check-sat)

(pop 1)

(push 1)

