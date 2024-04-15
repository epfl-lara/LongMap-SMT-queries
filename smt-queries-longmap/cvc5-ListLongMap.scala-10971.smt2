; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128442 () Bool)

(assert start!128442)

(declare-fun res!1026876 () Bool)

(declare-fun e!841760 () Bool)

(assert (=> start!128442 (=> (not res!1026876) (not e!841760))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128442 (= res!1026876 (validMask!0 mask!2512))))

(assert (=> start!128442 e!841760))

(assert (=> start!128442 true))

(declare-datatypes ((array!100454 0))(
  ( (array!100455 (arr!48471 (Array (_ BitVec 32) (_ BitVec 64))) (size!49023 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100454)

(declare-fun array_inv!37704 (array!100454) Bool)

(assert (=> start!128442 (array_inv!37704 a!2804)))

(declare-fun b!1506343 () Bool)

(declare-fun res!1026872 () Bool)

(assert (=> b!1506343 (=> (not res!1026872) (not e!841760))))

(declare-datatypes ((List!35032 0))(
  ( (Nil!35029) (Cons!35028 (h!36429 (_ BitVec 64)) (t!49718 List!35032)) )
))
(declare-fun arrayNoDuplicates!0 (array!100454 (_ BitVec 32) List!35032) Bool)

(assert (=> b!1506343 (= res!1026872 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35029))))

(declare-fun b!1506344 () Bool)

(declare-fun res!1026873 () Bool)

(assert (=> b!1506344 (=> (not res!1026873) (not e!841760))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506344 (= res!1026873 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49023 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49023 a!2804))))))

(declare-fun b!1506345 () Bool)

(assert (=> b!1506345 (= e!841760 false)))

(declare-datatypes ((SeekEntryResult!12665 0))(
  ( (MissingZero!12665 (index!53055 (_ BitVec 32))) (Found!12665 (index!53056 (_ BitVec 32))) (Intermediate!12665 (undefined!13477 Bool) (index!53057 (_ BitVec 32)) (x!134809 (_ BitVec 32))) (Undefined!12665) (MissingVacant!12665 (index!53058 (_ BitVec 32))) )
))
(declare-fun lt!653964 () SeekEntryResult!12665)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100454 (_ BitVec 32)) SeekEntryResult!12665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506345 (= lt!653964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48471 a!2804) j!70) mask!2512) (select (arr!48471 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506346 () Bool)

(declare-fun res!1026878 () Bool)

(assert (=> b!1506346 (=> (not res!1026878) (not e!841760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100454 (_ BitVec 32)) Bool)

(assert (=> b!1506346 (= res!1026878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506347 () Bool)

(declare-fun res!1026875 () Bool)

(assert (=> b!1506347 (=> (not res!1026875) (not e!841760))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506347 (= res!1026875 (validKeyInArray!0 (select (arr!48471 a!2804) i!961)))))

(declare-fun b!1506348 () Bool)

(declare-fun res!1026877 () Bool)

(assert (=> b!1506348 (=> (not res!1026877) (not e!841760))))

(assert (=> b!1506348 (= res!1026877 (and (= (size!49023 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49023 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49023 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506349 () Bool)

(declare-fun res!1026874 () Bool)

(assert (=> b!1506349 (=> (not res!1026874) (not e!841760))))

(assert (=> b!1506349 (= res!1026874 (validKeyInArray!0 (select (arr!48471 a!2804) j!70)))))

(assert (= (and start!128442 res!1026876) b!1506348))

(assert (= (and b!1506348 res!1026877) b!1506347))

(assert (= (and b!1506347 res!1026875) b!1506349))

(assert (= (and b!1506349 res!1026874) b!1506346))

(assert (= (and b!1506346 res!1026878) b!1506343))

(assert (= (and b!1506343 res!1026872) b!1506344))

(assert (= (and b!1506344 res!1026873) b!1506345))

(declare-fun m!1388691 () Bool)

(assert (=> b!1506347 m!1388691))

(assert (=> b!1506347 m!1388691))

(declare-fun m!1388693 () Bool)

(assert (=> b!1506347 m!1388693))

(declare-fun m!1388695 () Bool)

(assert (=> b!1506349 m!1388695))

(assert (=> b!1506349 m!1388695))

(declare-fun m!1388697 () Bool)

(assert (=> b!1506349 m!1388697))

(declare-fun m!1388699 () Bool)

(assert (=> start!128442 m!1388699))

(declare-fun m!1388701 () Bool)

(assert (=> start!128442 m!1388701))

(assert (=> b!1506345 m!1388695))

(assert (=> b!1506345 m!1388695))

(declare-fun m!1388703 () Bool)

(assert (=> b!1506345 m!1388703))

(assert (=> b!1506345 m!1388703))

(assert (=> b!1506345 m!1388695))

(declare-fun m!1388705 () Bool)

(assert (=> b!1506345 m!1388705))

(declare-fun m!1388707 () Bool)

(assert (=> b!1506346 m!1388707))

(declare-fun m!1388709 () Bool)

(assert (=> b!1506343 m!1388709))

(push 1)

(assert (not b!1506345))

(assert (not b!1506346))

(assert (not b!1506347))

(assert (not b!1506343))

(assert (not start!128442))

(assert (not b!1506349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

