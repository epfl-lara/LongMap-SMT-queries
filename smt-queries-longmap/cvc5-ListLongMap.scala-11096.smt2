; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129550 () Bool)

(assert start!129550)

(declare-fun res!1040531 () Bool)

(declare-fun e!848312 () Bool)

(assert (=> start!129550 (=> (not res!1040531) (not e!848312))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129550 (= res!1040531 (validMask!0 mask!2512))))

(assert (=> start!129550 e!848312))

(assert (=> start!129550 true))

(declare-datatypes ((array!101225 0))(
  ( (array!101226 (arr!48846 (Array (_ BitVec 32) (_ BitVec 64))) (size!49398 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101225)

(declare-fun array_inv!38079 (array!101225) Bool)

(assert (=> start!129550 (array_inv!38079 a!2804)))

(declare-fun b!1521096 () Bool)

(declare-fun res!1040528 () Bool)

(assert (=> b!1521096 (=> (not res!1040528) (not e!848312))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13034 0))(
  ( (MissingZero!13034 (index!54531 (_ BitVec 32))) (Found!13034 (index!54532 (_ BitVec 32))) (Intermediate!13034 (undefined!13846 Bool) (index!54533 (_ BitVec 32)) (x!136224 (_ BitVec 32))) (Undefined!13034) (MissingVacant!13034 (index!54534 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101225 (_ BitVec 32)) SeekEntryResult!13034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521096 (= res!1040528 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48846 a!2804) j!70) mask!2512) (select (arr!48846 a!2804) j!70) a!2804 mask!2512) (Intermediate!13034 false resIndex!21 resX!21)))))

(declare-fun b!1521097 () Bool)

(declare-fun res!1040526 () Bool)

(assert (=> b!1521097 (=> (not res!1040526) (not e!848312))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521097 (= res!1040526 (and (= (size!49398 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49398 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49398 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521098 () Bool)

(declare-fun res!1040524 () Bool)

(assert (=> b!1521098 (=> (not res!1040524) (not e!848312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521098 (= res!1040524 (validKeyInArray!0 (select (arr!48846 a!2804) i!961)))))

(declare-fun b!1521099 () Bool)

(declare-fun res!1040527 () Bool)

(assert (=> b!1521099 (=> (not res!1040527) (not e!848312))))

(assert (=> b!1521099 (= res!1040527 (validKeyInArray!0 (select (arr!48846 a!2804) j!70)))))

(declare-fun b!1521100 () Bool)

(declare-fun res!1040525 () Bool)

(assert (=> b!1521100 (=> (not res!1040525) (not e!848312))))

(declare-datatypes ((List!35407 0))(
  ( (Nil!35404) (Cons!35403 (h!36825 (_ BitVec 64)) (t!50093 List!35407)) )
))
(declare-fun arrayNoDuplicates!0 (array!101225 (_ BitVec 32) List!35407) Bool)

(assert (=> b!1521100 (= res!1040525 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35404))))

(declare-fun b!1521101 () Bool)

(declare-fun res!1040529 () Bool)

(assert (=> b!1521101 (=> (not res!1040529) (not e!848312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101225 (_ BitVec 32)) Bool)

(assert (=> b!1521101 (= res!1040529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521102 () Bool)

(assert (=> b!1521102 (= e!848312 false)))

(declare-fun lt!659055 () SeekEntryResult!13034)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521102 (= lt!659055 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48846 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521103 () Bool)

(declare-fun res!1040530 () Bool)

(assert (=> b!1521103 (=> (not res!1040530) (not e!848312))))

(assert (=> b!1521103 (= res!1040530 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49398 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49398 a!2804))))))

(assert (= (and start!129550 res!1040531) b!1521097))

(assert (= (and b!1521097 res!1040526) b!1521098))

(assert (= (and b!1521098 res!1040524) b!1521099))

(assert (= (and b!1521099 res!1040527) b!1521101))

(assert (= (and b!1521101 res!1040529) b!1521100))

(assert (= (and b!1521100 res!1040525) b!1521103))

(assert (= (and b!1521103 res!1040530) b!1521096))

(assert (= (and b!1521096 res!1040528) b!1521102))

(declare-fun m!1403621 () Bool)

(assert (=> b!1521100 m!1403621))

(declare-fun m!1403623 () Bool)

(assert (=> b!1521096 m!1403623))

(assert (=> b!1521096 m!1403623))

(declare-fun m!1403625 () Bool)

(assert (=> b!1521096 m!1403625))

(assert (=> b!1521096 m!1403625))

(assert (=> b!1521096 m!1403623))

(declare-fun m!1403627 () Bool)

(assert (=> b!1521096 m!1403627))

(declare-fun m!1403629 () Bool)

(assert (=> b!1521101 m!1403629))

(declare-fun m!1403631 () Bool)

(assert (=> start!129550 m!1403631))

(declare-fun m!1403633 () Bool)

(assert (=> start!129550 m!1403633))

(assert (=> b!1521099 m!1403623))

(assert (=> b!1521099 m!1403623))

(declare-fun m!1403635 () Bool)

(assert (=> b!1521099 m!1403635))

(assert (=> b!1521102 m!1403623))

(assert (=> b!1521102 m!1403623))

(declare-fun m!1403637 () Bool)

(assert (=> b!1521102 m!1403637))

(declare-fun m!1403639 () Bool)

(assert (=> b!1521098 m!1403639))

(assert (=> b!1521098 m!1403639))

(declare-fun m!1403641 () Bool)

(assert (=> b!1521098 m!1403641))

(push 1)

(assert (not b!1521096))

(assert (not b!1521102))

(assert (not b!1521101))

(assert (not b!1521098))

(assert (not b!1521100))

(assert (not b!1521099))

(assert (not start!129550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

