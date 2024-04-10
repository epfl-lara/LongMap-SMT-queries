; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128488 () Bool)

(assert start!128488)

(declare-fun b!1506619 () Bool)

(declare-fun res!1026946 () Bool)

(declare-fun e!841956 () Bool)

(assert (=> b!1506619 (=> (not res!1026946) (not e!841956))))

(declare-datatypes ((array!100500 0))(
  ( (array!100501 (arr!48493 (Array (_ BitVec 32) (_ BitVec 64))) (size!49043 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100500)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100500 (_ BitVec 32)) Bool)

(assert (=> b!1506619 (= res!1026946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506620 () Bool)

(declare-fun res!1026949 () Bool)

(assert (=> b!1506620 (=> (not res!1026949) (not e!841956))))

(declare-datatypes ((List!34976 0))(
  ( (Nil!34973) (Cons!34972 (h!36372 (_ BitVec 64)) (t!49670 List!34976)) )
))
(declare-fun arrayNoDuplicates!0 (array!100500 (_ BitVec 32) List!34976) Bool)

(assert (=> b!1506620 (= res!1026949 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34973))))

(declare-fun b!1506621 () Bool)

(declare-fun res!1026948 () Bool)

(assert (=> b!1506621 (=> (not res!1026948) (not e!841956))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506621 (= res!1026948 (and (= (size!49043 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49043 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49043 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506622 () Bool)

(declare-fun res!1026942 () Bool)

(assert (=> b!1506622 (=> (not res!1026942) (not e!841956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506622 (= res!1026942 (validKeyInArray!0 (select (arr!48493 a!2804) i!961)))))

(declare-fun b!1506623 () Bool)

(declare-fun res!1026943 () Bool)

(assert (=> b!1506623 (=> (not res!1026943) (not e!841956))))

(assert (=> b!1506623 (= res!1026943 (validKeyInArray!0 (select (arr!48493 a!2804) j!70)))))

(declare-fun b!1506624 () Bool)

(declare-fun res!1026945 () Bool)

(assert (=> b!1506624 (=> (not res!1026945) (not e!841956))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506624 (= res!1026945 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49043 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49043 a!2804))))))

(declare-fun b!1506626 () Bool)

(assert (=> b!1506626 (= e!841956 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1506625 () Bool)

(declare-fun res!1026947 () Bool)

(assert (=> b!1506625 (=> (not res!1026947) (not e!841956))))

(declare-datatypes ((SeekEntryResult!12664 0))(
  ( (MissingZero!12664 (index!53051 (_ BitVec 32))) (Found!12664 (index!53052 (_ BitVec 32))) (Intermediate!12664 (undefined!13476 Bool) (index!53053 (_ BitVec 32)) (x!134806 (_ BitVec 32))) (Undefined!12664) (MissingVacant!12664 (index!53054 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100500 (_ BitVec 32)) SeekEntryResult!12664)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506625 (= res!1026947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48493 a!2804) j!70) mask!2512) (select (arr!48493 a!2804) j!70) a!2804 mask!2512) (Intermediate!12664 false resIndex!21 resX!21)))))

(declare-fun res!1026944 () Bool)

(assert (=> start!128488 (=> (not res!1026944) (not e!841956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128488 (= res!1026944 (validMask!0 mask!2512))))

(assert (=> start!128488 e!841956))

(assert (=> start!128488 true))

(declare-fun array_inv!37521 (array!100500) Bool)

(assert (=> start!128488 (array_inv!37521 a!2804)))

(assert (= (and start!128488 res!1026944) b!1506621))

(assert (= (and b!1506621 res!1026948) b!1506622))

(assert (= (and b!1506622 res!1026942) b!1506623))

(assert (= (and b!1506623 res!1026943) b!1506619))

(assert (= (and b!1506619 res!1026946) b!1506620))

(assert (= (and b!1506620 res!1026949) b!1506624))

(assert (= (and b!1506624 res!1026945) b!1506625))

(assert (= (and b!1506625 res!1026947) b!1506626))

(declare-fun m!1389539 () Bool)

(assert (=> b!1506623 m!1389539))

(assert (=> b!1506623 m!1389539))

(declare-fun m!1389541 () Bool)

(assert (=> b!1506623 m!1389541))

(declare-fun m!1389543 () Bool)

(assert (=> b!1506622 m!1389543))

(assert (=> b!1506622 m!1389543))

(declare-fun m!1389545 () Bool)

(assert (=> b!1506622 m!1389545))

(assert (=> b!1506625 m!1389539))

(assert (=> b!1506625 m!1389539))

(declare-fun m!1389547 () Bool)

(assert (=> b!1506625 m!1389547))

(assert (=> b!1506625 m!1389547))

(assert (=> b!1506625 m!1389539))

(declare-fun m!1389549 () Bool)

(assert (=> b!1506625 m!1389549))

(declare-fun m!1389551 () Bool)

(assert (=> start!128488 m!1389551))

(declare-fun m!1389553 () Bool)

(assert (=> start!128488 m!1389553))

(declare-fun m!1389555 () Bool)

(assert (=> b!1506620 m!1389555))

(declare-fun m!1389557 () Bool)

(assert (=> b!1506619 m!1389557))

(push 1)

(assert (not b!1506620))

(assert (not start!128488))

(assert (not b!1506623))

(assert (not b!1506625))

(assert (not b!1506622))

(assert (not b!1506619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

