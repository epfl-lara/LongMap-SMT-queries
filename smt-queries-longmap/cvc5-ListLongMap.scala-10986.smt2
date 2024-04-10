; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128706 () Bool)

(assert start!128706)

(declare-fun b!1508328 () Bool)

(declare-fun res!1028336 () Bool)

(declare-fun e!842668 () Bool)

(assert (=> b!1508328 (=> (not res!1028336) (not e!842668))))

(declare-datatypes ((array!100601 0))(
  ( (array!100602 (arr!48539 (Array (_ BitVec 32) (_ BitVec 64))) (size!49089 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100601)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100601 (_ BitVec 32)) Bool)

(assert (=> b!1508328 (= res!1028336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508329 () Bool)

(declare-fun res!1028344 () Bool)

(assert (=> b!1508329 (=> (not res!1028344) (not e!842668))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508329 (= res!1028344 (validKeyInArray!0 (select (arr!48539 a!2804) i!961)))))

(declare-fun b!1508330 () Bool)

(declare-fun res!1028342 () Bool)

(assert (=> b!1508330 (=> (not res!1028342) (not e!842668))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1508330 (= res!1028342 (validKeyInArray!0 (select (arr!48539 a!2804) j!70)))))

(declare-fun b!1508331 () Bool)

(declare-fun e!842667 () Bool)

(assert (=> b!1508331 (= e!842668 e!842667)))

(declare-fun res!1028339 () Bool)

(assert (=> b!1508331 (=> (not res!1028339) (not e!842667))))

(declare-datatypes ((SeekEntryResult!12710 0))(
  ( (MissingZero!12710 (index!53235 (_ BitVec 32))) (Found!12710 (index!53236 (_ BitVec 32))) (Intermediate!12710 (undefined!13522 Bool) (index!53237 (_ BitVec 32)) (x!134998 (_ BitVec 32))) (Undefined!12710) (MissingVacant!12710 (index!53238 (_ BitVec 32))) )
))
(declare-fun lt!654607 () SeekEntryResult!12710)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100601 (_ BitVec 32)) SeekEntryResult!12710)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508331 (= res!1028339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48539 a!2804) j!70) mask!2512) (select (arr!48539 a!2804) j!70) a!2804 mask!2512) lt!654607))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508331 (= lt!654607 (Intermediate!12710 false resIndex!21 resX!21))))

(declare-fun res!1028341 () Bool)

(assert (=> start!128706 (=> (not res!1028341) (not e!842668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128706 (= res!1028341 (validMask!0 mask!2512))))

(assert (=> start!128706 e!842668))

(assert (=> start!128706 true))

(declare-fun array_inv!37567 (array!100601) Bool)

(assert (=> start!128706 (array_inv!37567 a!2804)))

(declare-fun b!1508332 () Bool)

(declare-fun res!1028340 () Bool)

(assert (=> b!1508332 (=> (not res!1028340) (not e!842668))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508332 (= res!1028340 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49089 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49089 a!2804))))))

(declare-fun b!1508333 () Bool)

(declare-fun res!1028337 () Bool)

(assert (=> b!1508333 (=> (not res!1028337) (not e!842668))))

(declare-datatypes ((List!35022 0))(
  ( (Nil!35019) (Cons!35018 (h!36427 (_ BitVec 64)) (t!49716 List!35022)) )
))
(declare-fun arrayNoDuplicates!0 (array!100601 (_ BitVec 32) List!35022) Bool)

(assert (=> b!1508333 (= res!1028337 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35019))))

(declare-fun b!1508334 () Bool)

(assert (=> b!1508334 (= e!842667 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!654606 () (_ BitVec 32))

(assert (=> b!1508334 (= lt!654606 (toIndex!0 (select (store (arr!48539 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508335 () Bool)

(declare-fun res!1028343 () Bool)

(assert (=> b!1508335 (=> (not res!1028343) (not e!842668))))

(assert (=> b!1508335 (= res!1028343 (and (= (size!49089 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49089 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49089 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508336 () Bool)

(declare-fun res!1028338 () Bool)

(assert (=> b!1508336 (=> (not res!1028338) (not e!842667))))

(assert (=> b!1508336 (= res!1028338 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48539 a!2804) j!70) a!2804 mask!2512) lt!654607))))

(assert (= (and start!128706 res!1028341) b!1508335))

(assert (= (and b!1508335 res!1028343) b!1508329))

(assert (= (and b!1508329 res!1028344) b!1508330))

(assert (= (and b!1508330 res!1028342) b!1508328))

(assert (= (and b!1508328 res!1028336) b!1508333))

(assert (= (and b!1508333 res!1028337) b!1508332))

(assert (= (and b!1508332 res!1028340) b!1508331))

(assert (= (and b!1508331 res!1028339) b!1508336))

(assert (= (and b!1508336 res!1028338) b!1508334))

(declare-fun m!1390831 () Bool)

(assert (=> b!1508328 m!1390831))

(declare-fun m!1390833 () Bool)

(assert (=> b!1508334 m!1390833))

(declare-fun m!1390835 () Bool)

(assert (=> b!1508334 m!1390835))

(assert (=> b!1508334 m!1390835))

(declare-fun m!1390837 () Bool)

(assert (=> b!1508334 m!1390837))

(declare-fun m!1390839 () Bool)

(assert (=> b!1508330 m!1390839))

(assert (=> b!1508330 m!1390839))

(declare-fun m!1390841 () Bool)

(assert (=> b!1508330 m!1390841))

(declare-fun m!1390843 () Bool)

(assert (=> b!1508329 m!1390843))

(assert (=> b!1508329 m!1390843))

(declare-fun m!1390845 () Bool)

(assert (=> b!1508329 m!1390845))

(assert (=> b!1508336 m!1390839))

(assert (=> b!1508336 m!1390839))

(declare-fun m!1390847 () Bool)

(assert (=> b!1508336 m!1390847))

(declare-fun m!1390849 () Bool)

(assert (=> start!128706 m!1390849))

(declare-fun m!1390851 () Bool)

(assert (=> start!128706 m!1390851))

(declare-fun m!1390853 () Bool)

(assert (=> b!1508333 m!1390853))

(assert (=> b!1508331 m!1390839))

(assert (=> b!1508331 m!1390839))

(declare-fun m!1390855 () Bool)

(assert (=> b!1508331 m!1390855))

(assert (=> b!1508331 m!1390855))

(assert (=> b!1508331 m!1390839))

(declare-fun m!1390857 () Bool)

(assert (=> b!1508331 m!1390857))

(push 1)

