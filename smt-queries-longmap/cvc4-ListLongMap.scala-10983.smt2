; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128650 () Bool)

(assert start!128650)

(declare-fun b!1507950 () Bool)

(declare-fun res!1028070 () Bool)

(declare-fun e!842480 () Bool)

(assert (=> b!1507950 (=> (not res!1028070) (not e!842480))))

(declare-datatypes ((array!100584 0))(
  ( (array!100585 (arr!48532 (Array (_ BitVec 32) (_ BitVec 64))) (size!49082 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100584)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507950 (= res!1028070 (validKeyInArray!0 (select (arr!48532 a!2804) j!70)))))

(declare-fun res!1028069 () Bool)

(assert (=> start!128650 (=> (not res!1028069) (not e!842480))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128650 (= res!1028069 (validMask!0 mask!2512))))

(assert (=> start!128650 e!842480))

(assert (=> start!128650 true))

(declare-fun array_inv!37560 (array!100584) Bool)

(assert (=> start!128650 (array_inv!37560 a!2804)))

(declare-fun b!1507951 () Bool)

(declare-fun e!842481 () Bool)

(assert (=> b!1507951 (= e!842481 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1507952 () Bool)

(assert (=> b!1507952 (= e!842480 e!842481)))

(declare-fun res!1028064 () Bool)

(assert (=> b!1507952 (=> (not res!1028064) (not e!842481))))

(declare-datatypes ((SeekEntryResult!12703 0))(
  ( (MissingZero!12703 (index!53207 (_ BitVec 32))) (Found!12703 (index!53208 (_ BitVec 32))) (Intermediate!12703 (undefined!13515 Bool) (index!53209 (_ BitVec 32)) (x!134961 (_ BitVec 32))) (Undefined!12703) (MissingVacant!12703 (index!53210 (_ BitVec 32))) )
))
(declare-fun lt!654505 () SeekEntryResult!12703)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100584 (_ BitVec 32)) SeekEntryResult!12703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507952 (= res!1028064 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48532 a!2804) j!70) mask!2512) (select (arr!48532 a!2804) j!70) a!2804 mask!2512) lt!654505))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507952 (= lt!654505 (Intermediate!12703 false resIndex!21 resX!21))))

(declare-fun b!1507953 () Bool)

(declare-fun res!1028067 () Bool)

(assert (=> b!1507953 (=> (not res!1028067) (not e!842480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100584 (_ BitVec 32)) Bool)

(assert (=> b!1507953 (= res!1028067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507954 () Bool)

(declare-fun res!1028063 () Bool)

(assert (=> b!1507954 (=> (not res!1028063) (not e!842480))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507954 (= res!1028063 (and (= (size!49082 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49082 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49082 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507955 () Bool)

(declare-fun res!1028068 () Bool)

(assert (=> b!1507955 (=> (not res!1028068) (not e!842481))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507955 (= res!1028068 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48532 a!2804) j!70) a!2804 mask!2512) lt!654505))))

(declare-fun b!1507956 () Bool)

(declare-fun res!1028065 () Bool)

(assert (=> b!1507956 (=> (not res!1028065) (not e!842480))))

(assert (=> b!1507956 (= res!1028065 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49082 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49082 a!2804))))))

(declare-fun b!1507957 () Bool)

(declare-fun res!1028071 () Bool)

(assert (=> b!1507957 (=> (not res!1028071) (not e!842480))))

(declare-datatypes ((List!35015 0))(
  ( (Nil!35012) (Cons!35011 (h!36417 (_ BitVec 64)) (t!49709 List!35015)) )
))
(declare-fun arrayNoDuplicates!0 (array!100584 (_ BitVec 32) List!35015) Bool)

(assert (=> b!1507957 (= res!1028071 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35012))))

(declare-fun b!1507958 () Bool)

(declare-fun res!1028066 () Bool)

(assert (=> b!1507958 (=> (not res!1028066) (not e!842480))))

(assert (=> b!1507958 (= res!1028066 (validKeyInArray!0 (select (arr!48532 a!2804) i!961)))))

(assert (= (and start!128650 res!1028069) b!1507954))

(assert (= (and b!1507954 res!1028063) b!1507958))

(assert (= (and b!1507958 res!1028066) b!1507950))

(assert (= (and b!1507950 res!1028070) b!1507953))

(assert (= (and b!1507953 res!1028067) b!1507957))

(assert (= (and b!1507957 res!1028071) b!1507956))

(assert (= (and b!1507956 res!1028065) b!1507952))

(assert (= (and b!1507952 res!1028064) b!1507955))

(assert (= (and b!1507955 res!1028068) b!1507951))

(declare-fun m!1390563 () Bool)

(assert (=> b!1507953 m!1390563))

(declare-fun m!1390565 () Bool)

(assert (=> b!1507957 m!1390565))

(declare-fun m!1390567 () Bool)

(assert (=> b!1507955 m!1390567))

(assert (=> b!1507955 m!1390567))

(declare-fun m!1390569 () Bool)

(assert (=> b!1507955 m!1390569))

(assert (=> b!1507952 m!1390567))

(assert (=> b!1507952 m!1390567))

(declare-fun m!1390571 () Bool)

(assert (=> b!1507952 m!1390571))

(assert (=> b!1507952 m!1390571))

(assert (=> b!1507952 m!1390567))

(declare-fun m!1390573 () Bool)

(assert (=> b!1507952 m!1390573))

(assert (=> b!1507950 m!1390567))

(assert (=> b!1507950 m!1390567))

(declare-fun m!1390575 () Bool)

(assert (=> b!1507950 m!1390575))

(declare-fun m!1390577 () Bool)

(assert (=> b!1507958 m!1390577))

(assert (=> b!1507958 m!1390577))

(declare-fun m!1390579 () Bool)

(assert (=> b!1507958 m!1390579))

(declare-fun m!1390581 () Bool)

(assert (=> start!128650 m!1390581))

(declare-fun m!1390583 () Bool)

(assert (=> start!128650 m!1390583))

(push 1)

(assert (not start!128650))

(assert (not b!1507955))

(assert (not b!1507952))

(assert (not b!1507953))

(assert (not b!1507957))

(assert (not b!1507950))

(assert (not b!1507958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

