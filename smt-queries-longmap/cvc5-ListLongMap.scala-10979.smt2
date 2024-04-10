; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128580 () Bool)

(assert start!128580)

(declare-fun b!1507408 () Bool)

(declare-fun res!1027631 () Bool)

(declare-fun e!842256 () Bool)

(assert (=> b!1507408 (=> (not res!1027631) (not e!842256))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100553 0))(
  ( (array!100554 (arr!48518 (Array (_ BitVec 32) (_ BitVec 64))) (size!49068 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100553)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12689 0))(
  ( (MissingZero!12689 (index!53151 (_ BitVec 32))) (Found!12689 (index!53152 (_ BitVec 32))) (Intermediate!12689 (undefined!13501 Bool) (index!53153 (_ BitVec 32)) (x!134909 (_ BitVec 32))) (Undefined!12689) (MissingVacant!12689 (index!53154 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100553 (_ BitVec 32)) SeekEntryResult!12689)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507408 (= res!1027631 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48518 a!2804) j!70) mask!2512) (select (arr!48518 a!2804) j!70) a!2804 mask!2512) (Intermediate!12689 false resIndex!21 resX!21)))))

(declare-fun b!1507409 () Bool)

(declare-fun res!1027633 () Bool)

(assert (=> b!1507409 (=> (not res!1027633) (not e!842256))))

(declare-datatypes ((List!35001 0))(
  ( (Nil!34998) (Cons!34997 (h!36400 (_ BitVec 64)) (t!49695 List!35001)) )
))
(declare-fun arrayNoDuplicates!0 (array!100553 (_ BitVec 32) List!35001) Bool)

(assert (=> b!1507409 (= res!1027633 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34998))))

(declare-fun b!1507410 () Bool)

(declare-fun res!1027626 () Bool)

(assert (=> b!1507410 (=> (not res!1027626) (not e!842256))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507410 (= res!1027626 (validKeyInArray!0 (select (arr!48518 a!2804) i!961)))))

(declare-fun b!1507411 () Bool)

(declare-fun res!1027632 () Bool)

(assert (=> b!1507411 (=> (not res!1027632) (not e!842256))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507411 (= res!1027632 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49068 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49068 a!2804))))))

(declare-fun b!1507412 () Bool)

(assert (=> b!1507412 (= e!842256 false)))

(declare-fun lt!654385 () SeekEntryResult!12689)

(assert (=> b!1507412 (= lt!654385 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48518 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507414 () Bool)

(declare-fun res!1027629 () Bool)

(assert (=> b!1507414 (=> (not res!1027629) (not e!842256))))

(assert (=> b!1507414 (= res!1027629 (and (= (size!49068 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49068 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49068 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507415 () Bool)

(declare-fun res!1027627 () Bool)

(assert (=> b!1507415 (=> (not res!1027627) (not e!842256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100553 (_ BitVec 32)) Bool)

(assert (=> b!1507415 (= res!1027627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1027630 () Bool)

(assert (=> start!128580 (=> (not res!1027630) (not e!842256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128580 (= res!1027630 (validMask!0 mask!2512))))

(assert (=> start!128580 e!842256))

(assert (=> start!128580 true))

(declare-fun array_inv!37546 (array!100553) Bool)

(assert (=> start!128580 (array_inv!37546 a!2804)))

(declare-fun b!1507413 () Bool)

(declare-fun res!1027628 () Bool)

(assert (=> b!1507413 (=> (not res!1027628) (not e!842256))))

(assert (=> b!1507413 (= res!1027628 (validKeyInArray!0 (select (arr!48518 a!2804) j!70)))))

(assert (= (and start!128580 res!1027630) b!1507414))

(assert (= (and b!1507414 res!1027629) b!1507410))

(assert (= (and b!1507410 res!1027626) b!1507413))

(assert (= (and b!1507413 res!1027628) b!1507415))

(assert (= (and b!1507415 res!1027627) b!1507409))

(assert (= (and b!1507409 res!1027633) b!1507411))

(assert (= (and b!1507411 res!1027632) b!1507408))

(assert (= (and b!1507408 res!1027631) b!1507412))

(declare-fun m!1390159 () Bool)

(assert (=> b!1507408 m!1390159))

(assert (=> b!1507408 m!1390159))

(declare-fun m!1390161 () Bool)

(assert (=> b!1507408 m!1390161))

(assert (=> b!1507408 m!1390161))

(assert (=> b!1507408 m!1390159))

(declare-fun m!1390163 () Bool)

(assert (=> b!1507408 m!1390163))

(declare-fun m!1390165 () Bool)

(assert (=> b!1507410 m!1390165))

(assert (=> b!1507410 m!1390165))

(declare-fun m!1390167 () Bool)

(assert (=> b!1507410 m!1390167))

(declare-fun m!1390169 () Bool)

(assert (=> start!128580 m!1390169))

(declare-fun m!1390171 () Bool)

(assert (=> start!128580 m!1390171))

(assert (=> b!1507413 m!1390159))

(assert (=> b!1507413 m!1390159))

(declare-fun m!1390173 () Bool)

(assert (=> b!1507413 m!1390173))

(declare-fun m!1390175 () Bool)

(assert (=> b!1507415 m!1390175))

(assert (=> b!1507412 m!1390159))

(assert (=> b!1507412 m!1390159))

(declare-fun m!1390177 () Bool)

(assert (=> b!1507412 m!1390177))

(declare-fun m!1390179 () Bool)

(assert (=> b!1507409 m!1390179))

(push 1)

(assert (not b!1507413))

(assert (not b!1507409))

(assert (not b!1507410))

(assert (not b!1507408))

(assert (not b!1507412))

(assert (not b!1507415))

(assert (not start!128580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

