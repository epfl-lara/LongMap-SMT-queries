; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128586 () Bool)

(assert start!128586)

(declare-fun b!1507458 () Bool)

(declare-fun res!1027777 () Bool)

(declare-fun e!842222 () Bool)

(assert (=> b!1507458 (=> (not res!1027777) (not e!842222))))

(declare-datatypes ((array!100520 0))(
  ( (array!100521 (arr!48501 (Array (_ BitVec 32) (_ BitVec 64))) (size!49053 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100520)

(declare-datatypes ((List!35062 0))(
  ( (Nil!35059) (Cons!35058 (h!36465 (_ BitVec 64)) (t!49748 List!35062)) )
))
(declare-fun arrayNoDuplicates!0 (array!100520 (_ BitVec 32) List!35062) Bool)

(assert (=> b!1507458 (= res!1027777 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35059))))

(declare-fun b!1507459 () Bool)

(declare-fun res!1027781 () Bool)

(assert (=> b!1507459 (=> (not res!1027781) (not e!842222))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100520 (_ BitVec 32)) Bool)

(assert (=> b!1507459 (= res!1027781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507460 () Bool)

(declare-fun res!1027779 () Bool)

(assert (=> b!1507460 (=> (not res!1027779) (not e!842222))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12695 0))(
  ( (MissingZero!12695 (index!53175 (_ BitVec 32))) (Found!12695 (index!53176 (_ BitVec 32))) (Intermediate!12695 (undefined!13507 Bool) (index!53177 (_ BitVec 32)) (x!134931 (_ BitVec 32))) (Undefined!12695) (MissingVacant!12695 (index!53178 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100520 (_ BitVec 32)) SeekEntryResult!12695)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507460 (= res!1027779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48501 a!2804) j!70) mask!2512) (select (arr!48501 a!2804) j!70) a!2804 mask!2512) (Intermediate!12695 false resIndex!21 resX!21)))))

(declare-fun b!1507461 () Bool)

(declare-fun res!1027778 () Bool)

(assert (=> b!1507461 (=> (not res!1027778) (not e!842222))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507461 (= res!1027778 (and (= (size!49053 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49053 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49053 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507462 () Bool)

(declare-fun res!1027780 () Bool)

(assert (=> b!1507462 (=> (not res!1027780) (not e!842222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507462 (= res!1027780 (validKeyInArray!0 (select (arr!48501 a!2804) i!961)))))

(declare-fun res!1027782 () Bool)

(assert (=> start!128586 (=> (not res!1027782) (not e!842222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128586 (= res!1027782 (validMask!0 mask!2512))))

(assert (=> start!128586 e!842222))

(assert (=> start!128586 true))

(declare-fun array_inv!37734 (array!100520) Bool)

(assert (=> start!128586 (array_inv!37734 a!2804)))

(declare-fun b!1507463 () Bool)

(declare-fun res!1027783 () Bool)

(assert (=> b!1507463 (=> (not res!1027783) (not e!842222))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507463 (= res!1027783 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49053 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49053 a!2804))))))

(declare-fun b!1507464 () Bool)

(declare-fun res!1027784 () Bool)

(assert (=> b!1507464 (=> (not res!1027784) (not e!842222))))

(assert (=> b!1507464 (= res!1027784 (validKeyInArray!0 (select (arr!48501 a!2804) j!70)))))

(declare-fun b!1507465 () Bool)

(assert (=> b!1507465 (= e!842222 false)))

(declare-fun lt!654192 () SeekEntryResult!12695)

(assert (=> b!1507465 (= lt!654192 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48501 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!128586 res!1027782) b!1507461))

(assert (= (and b!1507461 res!1027778) b!1507462))

(assert (= (and b!1507462 res!1027780) b!1507464))

(assert (= (and b!1507464 res!1027784) b!1507459))

(assert (= (and b!1507459 res!1027781) b!1507458))

(assert (= (and b!1507458 res!1027777) b!1507463))

(assert (= (and b!1507463 res!1027783) b!1507460))

(assert (= (and b!1507460 res!1027779) b!1507465))

(declare-fun m!1389523 () Bool)

(assert (=> start!128586 m!1389523))

(declare-fun m!1389525 () Bool)

(assert (=> start!128586 m!1389525))

(declare-fun m!1389527 () Bool)

(assert (=> b!1507465 m!1389527))

(assert (=> b!1507465 m!1389527))

(declare-fun m!1389529 () Bool)

(assert (=> b!1507465 m!1389529))

(declare-fun m!1389531 () Bool)

(assert (=> b!1507462 m!1389531))

(assert (=> b!1507462 m!1389531))

(declare-fun m!1389533 () Bool)

(assert (=> b!1507462 m!1389533))

(assert (=> b!1507460 m!1389527))

(assert (=> b!1507460 m!1389527))

(declare-fun m!1389535 () Bool)

(assert (=> b!1507460 m!1389535))

(assert (=> b!1507460 m!1389535))

(assert (=> b!1507460 m!1389527))

(declare-fun m!1389537 () Bool)

(assert (=> b!1507460 m!1389537))

(declare-fun m!1389539 () Bool)

(assert (=> b!1507458 m!1389539))

(assert (=> b!1507464 m!1389527))

(assert (=> b!1507464 m!1389527))

(declare-fun m!1389541 () Bool)

(assert (=> b!1507464 m!1389541))

(declare-fun m!1389543 () Bool)

(assert (=> b!1507459 m!1389543))

(push 1)

(assert (not b!1507465))

(assert (not start!128586))

(assert (not b!1507464))

(assert (not b!1507460))

(assert (not b!1507462))

(assert (not b!1507459))

(assert (not b!1507458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

