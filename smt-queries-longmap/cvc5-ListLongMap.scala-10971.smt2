; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128490 () Bool)

(assert start!128490)

(declare-fun b!1506641 () Bool)

(declare-fun res!1026967 () Bool)

(declare-fun e!841962 () Bool)

(assert (=> b!1506641 (=> (not res!1026967) (not e!841962))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100502 0))(
  ( (array!100503 (arr!48494 (Array (_ BitVec 32) (_ BitVec 64))) (size!49044 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100502)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506641 (= res!1026967 (and (= (size!49044 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49044 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49044 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506642 () Bool)

(assert (=> b!1506642 (= e!841962 false)))

(declare-datatypes ((SeekEntryResult!12665 0))(
  ( (MissingZero!12665 (index!53055 (_ BitVec 32))) (Found!12665 (index!53056 (_ BitVec 32))) (Intermediate!12665 (undefined!13477 Bool) (index!53057 (_ BitVec 32)) (x!134815 (_ BitVec 32))) (Undefined!12665) (MissingVacant!12665 (index!53058 (_ BitVec 32))) )
))
(declare-fun lt!654253 () SeekEntryResult!12665)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100502 (_ BitVec 32)) SeekEntryResult!12665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506642 (= lt!654253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48494 a!2804) j!70) mask!2512) (select (arr!48494 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506643 () Bool)

(declare-fun res!1026966 () Bool)

(assert (=> b!1506643 (=> (not res!1026966) (not e!841962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100502 (_ BitVec 32)) Bool)

(assert (=> b!1506643 (= res!1026966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1026965 () Bool)

(assert (=> start!128490 (=> (not res!1026965) (not e!841962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128490 (= res!1026965 (validMask!0 mask!2512))))

(assert (=> start!128490 e!841962))

(assert (=> start!128490 true))

(declare-fun array_inv!37522 (array!100502) Bool)

(assert (=> start!128490 (array_inv!37522 a!2804)))

(declare-fun b!1506644 () Bool)

(declare-fun res!1026968 () Bool)

(assert (=> b!1506644 (=> (not res!1026968) (not e!841962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506644 (= res!1026968 (validKeyInArray!0 (select (arr!48494 a!2804) j!70)))))

(declare-fun b!1506645 () Bool)

(declare-fun res!1026964 () Bool)

(assert (=> b!1506645 (=> (not res!1026964) (not e!841962))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506645 (= res!1026964 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49044 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49044 a!2804))))))

(declare-fun b!1506646 () Bool)

(declare-fun res!1026970 () Bool)

(assert (=> b!1506646 (=> (not res!1026970) (not e!841962))))

(declare-datatypes ((List!34977 0))(
  ( (Nil!34974) (Cons!34973 (h!36373 (_ BitVec 64)) (t!49671 List!34977)) )
))
(declare-fun arrayNoDuplicates!0 (array!100502 (_ BitVec 32) List!34977) Bool)

(assert (=> b!1506646 (= res!1026970 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34974))))

(declare-fun b!1506647 () Bool)

(declare-fun res!1026969 () Bool)

(assert (=> b!1506647 (=> (not res!1026969) (not e!841962))))

(assert (=> b!1506647 (= res!1026969 (validKeyInArray!0 (select (arr!48494 a!2804) i!961)))))

(assert (= (and start!128490 res!1026965) b!1506641))

(assert (= (and b!1506641 res!1026967) b!1506647))

(assert (= (and b!1506647 res!1026969) b!1506644))

(assert (= (and b!1506644 res!1026968) b!1506643))

(assert (= (and b!1506643 res!1026966) b!1506646))

(assert (= (and b!1506646 res!1026970) b!1506645))

(assert (= (and b!1506645 res!1026964) b!1506642))

(declare-fun m!1389559 () Bool)

(assert (=> b!1506642 m!1389559))

(assert (=> b!1506642 m!1389559))

(declare-fun m!1389561 () Bool)

(assert (=> b!1506642 m!1389561))

(assert (=> b!1506642 m!1389561))

(assert (=> b!1506642 m!1389559))

(declare-fun m!1389563 () Bool)

(assert (=> b!1506642 m!1389563))

(declare-fun m!1389565 () Bool)

(assert (=> start!128490 m!1389565))

(declare-fun m!1389567 () Bool)

(assert (=> start!128490 m!1389567))

(declare-fun m!1389569 () Bool)

(assert (=> b!1506647 m!1389569))

(assert (=> b!1506647 m!1389569))

(declare-fun m!1389571 () Bool)

(assert (=> b!1506647 m!1389571))

(declare-fun m!1389573 () Bool)

(assert (=> b!1506646 m!1389573))

(assert (=> b!1506644 m!1389559))

(assert (=> b!1506644 m!1389559))

(declare-fun m!1389575 () Bool)

(assert (=> b!1506644 m!1389575))

(declare-fun m!1389577 () Bool)

(assert (=> b!1506643 m!1389577))

(push 1)

(assert (not b!1506646))

(assert (not b!1506642))

(assert (not b!1506644))

(assert (not b!1506643))

(assert (not b!1506647))

(assert (not start!128490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

