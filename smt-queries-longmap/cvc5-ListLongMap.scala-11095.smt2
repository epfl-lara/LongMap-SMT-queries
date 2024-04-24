; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129966 () Bool)

(assert start!129966)

(declare-fun b!1523574 () Bool)

(declare-fun res!1041372 () Bool)

(declare-fun e!849878 () Bool)

(assert (=> b!1523574 (=> (not res!1041372) (not e!849878))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101390 0))(
  ( (array!101391 (arr!48921 (Array (_ BitVec 32) (_ BitVec 64))) (size!49472 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101390)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523574 (= res!1041372 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49472 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49472 a!2804))))))

(declare-fun b!1523575 () Bool)

(declare-fun res!1041376 () Bool)

(assert (=> b!1523575 (=> (not res!1041376) (not e!849878))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523575 (= res!1041376 (validKeyInArray!0 (select (arr!48921 a!2804) i!961)))))

(declare-fun b!1523576 () Bool)

(declare-fun res!1041377 () Bool)

(assert (=> b!1523576 (=> (not res!1041377) (not e!849878))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1523576 (= res!1041377 (validKeyInArray!0 (select (arr!48921 a!2804) j!70)))))

(declare-fun res!1041375 () Bool)

(assert (=> start!129966 (=> (not res!1041375) (not e!849878))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129966 (= res!1041375 (validMask!0 mask!2512))))

(assert (=> start!129966 e!849878))

(assert (=> start!129966 true))

(declare-fun array_inv!38202 (array!101390) Bool)

(assert (=> start!129966 (array_inv!38202 a!2804)))

(declare-fun b!1523577 () Bool)

(declare-fun res!1041373 () Bool)

(assert (=> b!1523577 (=> (not res!1041373) (not e!849878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101390 (_ BitVec 32)) Bool)

(assert (=> b!1523577 (= res!1041373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523578 () Bool)

(assert (=> b!1523578 (= e!849878 false)))

(declare-datatypes ((SeekEntryResult!12979 0))(
  ( (MissingZero!12979 (index!54311 (_ BitVec 32))) (Found!12979 (index!54312 (_ BitVec 32))) (Intermediate!12979 (undefined!13791 Bool) (index!54313 (_ BitVec 32)) (x!136212 (_ BitVec 32))) (Undefined!12979) (MissingVacant!12979 (index!54314 (_ BitVec 32))) )
))
(declare-fun lt!660181 () SeekEntryResult!12979)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101390 (_ BitVec 32)) SeekEntryResult!12979)

(assert (=> b!1523578 (= lt!660181 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48921 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523579 () Bool)

(declare-fun res!1041371 () Bool)

(assert (=> b!1523579 (=> (not res!1041371) (not e!849878))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523579 (= res!1041371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48921 a!2804) j!70) mask!2512) (select (arr!48921 a!2804) j!70) a!2804 mask!2512) (Intermediate!12979 false resIndex!21 resX!21)))))

(declare-fun b!1523580 () Bool)

(declare-fun res!1041370 () Bool)

(assert (=> b!1523580 (=> (not res!1041370) (not e!849878))))

(assert (=> b!1523580 (= res!1041370 (and (= (size!49472 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49472 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49472 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523581 () Bool)

(declare-fun res!1041374 () Bool)

(assert (=> b!1523581 (=> (not res!1041374) (not e!849878))))

(declare-datatypes ((List!35391 0))(
  ( (Nil!35388) (Cons!35387 (h!36826 (_ BitVec 64)) (t!50077 List!35391)) )
))
(declare-fun arrayNoDuplicates!0 (array!101390 (_ BitVec 32) List!35391) Bool)

(assert (=> b!1523581 (= res!1041374 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35388))))

(assert (= (and start!129966 res!1041375) b!1523580))

(assert (= (and b!1523580 res!1041370) b!1523575))

(assert (= (and b!1523575 res!1041376) b!1523576))

(assert (= (and b!1523576 res!1041377) b!1523577))

(assert (= (and b!1523577 res!1041373) b!1523581))

(assert (= (and b!1523581 res!1041374) b!1523574))

(assert (= (and b!1523574 res!1041372) b!1523579))

(assert (= (and b!1523579 res!1041371) b!1523578))

(declare-fun m!1406531 () Bool)

(assert (=> b!1523581 m!1406531))

(declare-fun m!1406533 () Bool)

(assert (=> b!1523576 m!1406533))

(assert (=> b!1523576 m!1406533))

(declare-fun m!1406535 () Bool)

(assert (=> b!1523576 m!1406535))

(declare-fun m!1406537 () Bool)

(assert (=> start!129966 m!1406537))

(declare-fun m!1406539 () Bool)

(assert (=> start!129966 m!1406539))

(assert (=> b!1523578 m!1406533))

(assert (=> b!1523578 m!1406533))

(declare-fun m!1406541 () Bool)

(assert (=> b!1523578 m!1406541))

(declare-fun m!1406543 () Bool)

(assert (=> b!1523577 m!1406543))

(declare-fun m!1406545 () Bool)

(assert (=> b!1523575 m!1406545))

(assert (=> b!1523575 m!1406545))

(declare-fun m!1406547 () Bool)

(assert (=> b!1523575 m!1406547))

(assert (=> b!1523579 m!1406533))

(assert (=> b!1523579 m!1406533))

(declare-fun m!1406549 () Bool)

(assert (=> b!1523579 m!1406549))

(assert (=> b!1523579 m!1406549))

(assert (=> b!1523579 m!1406533))

(declare-fun m!1406551 () Bool)

(assert (=> b!1523579 m!1406551))

(push 1)

(assert (not start!129966))

(assert (not b!1523578))

(assert (not b!1523581))

(assert (not b!1523579))

(assert (not b!1523575))

(assert (not b!1523577))

(assert (not b!1523576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

