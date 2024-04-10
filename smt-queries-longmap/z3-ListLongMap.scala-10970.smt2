; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128486 () Bool)

(assert start!128486)

(declare-fun b!1506595 () Bool)

(declare-fun res!1026920 () Bool)

(declare-fun e!841951 () Bool)

(assert (=> b!1506595 (=> (not res!1026920) (not e!841951))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100498 0))(
  ( (array!100499 (arr!48492 (Array (_ BitVec 32) (_ BitVec 64))) (size!49042 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100498)

(assert (=> b!1506595 (= res!1026920 (and (= (size!49042 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49042 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49042 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506596 () Bool)

(declare-fun res!1026924 () Bool)

(assert (=> b!1506596 (=> (not res!1026924) (not e!841951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506596 (= res!1026924 (validKeyInArray!0 (select (arr!48492 a!2804) j!70)))))

(declare-fun b!1506597 () Bool)

(assert (=> b!1506597 (= e!841951 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1506598 () Bool)

(declare-fun res!1026925 () Bool)

(assert (=> b!1506598 (=> (not res!1026925) (not e!841951))))

(assert (=> b!1506598 (= res!1026925 (validKeyInArray!0 (select (arr!48492 a!2804) i!961)))))

(declare-fun b!1506599 () Bool)

(declare-fun res!1026921 () Bool)

(assert (=> b!1506599 (=> (not res!1026921) (not e!841951))))

(declare-datatypes ((List!34975 0))(
  ( (Nil!34972) (Cons!34971 (h!36371 (_ BitVec 64)) (t!49669 List!34975)) )
))
(declare-fun arrayNoDuplicates!0 (array!100498 (_ BitVec 32) List!34975) Bool)

(assert (=> b!1506599 (= res!1026921 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34972))))

(declare-fun b!1506600 () Bool)

(declare-fun res!1026923 () Bool)

(assert (=> b!1506600 (=> (not res!1026923) (not e!841951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100498 (_ BitVec 32)) Bool)

(assert (=> b!1506600 (= res!1026923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1026922 () Bool)

(assert (=> start!128486 (=> (not res!1026922) (not e!841951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128486 (= res!1026922 (validMask!0 mask!2512))))

(assert (=> start!128486 e!841951))

(assert (=> start!128486 true))

(declare-fun array_inv!37520 (array!100498) Bool)

(assert (=> start!128486 (array_inv!37520 a!2804)))

(declare-fun b!1506601 () Bool)

(declare-fun res!1026918 () Bool)

(assert (=> b!1506601 (=> (not res!1026918) (not e!841951))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12663 0))(
  ( (MissingZero!12663 (index!53047 (_ BitVec 32))) (Found!12663 (index!53048 (_ BitVec 32))) (Intermediate!12663 (undefined!13475 Bool) (index!53049 (_ BitVec 32)) (x!134805 (_ BitVec 32))) (Undefined!12663) (MissingVacant!12663 (index!53050 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100498 (_ BitVec 32)) SeekEntryResult!12663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506601 (= res!1026918 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48492 a!2804) j!70) mask!2512) (select (arr!48492 a!2804) j!70) a!2804 mask!2512) (Intermediate!12663 false resIndex!21 resX!21)))))

(declare-fun b!1506602 () Bool)

(declare-fun res!1026919 () Bool)

(assert (=> b!1506602 (=> (not res!1026919) (not e!841951))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506602 (= res!1026919 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49042 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49042 a!2804))))))

(assert (= (and start!128486 res!1026922) b!1506595))

(assert (= (and b!1506595 res!1026920) b!1506598))

(assert (= (and b!1506598 res!1026925) b!1506596))

(assert (= (and b!1506596 res!1026924) b!1506600))

(assert (= (and b!1506600 res!1026923) b!1506599))

(assert (= (and b!1506599 res!1026921) b!1506602))

(assert (= (and b!1506602 res!1026919) b!1506601))

(assert (= (and b!1506601 res!1026918) b!1506597))

(declare-fun m!1389519 () Bool)

(assert (=> b!1506596 m!1389519))

(assert (=> b!1506596 m!1389519))

(declare-fun m!1389521 () Bool)

(assert (=> b!1506596 m!1389521))

(assert (=> b!1506601 m!1389519))

(assert (=> b!1506601 m!1389519))

(declare-fun m!1389523 () Bool)

(assert (=> b!1506601 m!1389523))

(assert (=> b!1506601 m!1389523))

(assert (=> b!1506601 m!1389519))

(declare-fun m!1389525 () Bool)

(assert (=> b!1506601 m!1389525))

(declare-fun m!1389527 () Bool)

(assert (=> b!1506600 m!1389527))

(declare-fun m!1389529 () Bool)

(assert (=> start!128486 m!1389529))

(declare-fun m!1389531 () Bool)

(assert (=> start!128486 m!1389531))

(declare-fun m!1389533 () Bool)

(assert (=> b!1506599 m!1389533))

(declare-fun m!1389535 () Bool)

(assert (=> b!1506598 m!1389535))

(assert (=> b!1506598 m!1389535))

(declare-fun m!1389537 () Bool)

(assert (=> b!1506598 m!1389537))

(check-sat (not b!1506599) (not start!128486) (not b!1506596) (not b!1506601) (not b!1506598) (not b!1506600))
(check-sat)
