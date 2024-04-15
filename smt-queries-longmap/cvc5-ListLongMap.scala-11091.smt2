; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129520 () Bool)

(assert start!129520)

(declare-fun res!1040169 () Bool)

(declare-fun e!848223 () Bool)

(assert (=> start!129520 (=> (not res!1040169) (not e!848223))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129520 (= res!1040169 (validMask!0 mask!2512))))

(assert (=> start!129520 e!848223))

(assert (=> start!129520 true))

(declare-datatypes ((array!101195 0))(
  ( (array!101196 (arr!48831 (Array (_ BitVec 32) (_ BitVec 64))) (size!49383 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101195)

(declare-fun array_inv!38064 (array!101195) Bool)

(assert (=> start!129520 (array_inv!38064 a!2804)))

(declare-fun b!1520737 () Bool)

(declare-fun res!1040165 () Bool)

(assert (=> b!1520737 (=> (not res!1040165) (not e!848223))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520737 (= res!1040165 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49383 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49383 a!2804))))))

(declare-fun b!1520738 () Bool)

(assert (=> b!1520738 (= e!848223 false)))

(declare-datatypes ((SeekEntryResult!13019 0))(
  ( (MissingZero!13019 (index!54471 (_ BitVec 32))) (Found!13019 (index!54472 (_ BitVec 32))) (Intermediate!13019 (undefined!13831 Bool) (index!54473 (_ BitVec 32)) (x!136169 (_ BitVec 32))) (Undefined!13019) (MissingVacant!13019 (index!54474 (_ BitVec 32))) )
))
(declare-fun lt!659010 () SeekEntryResult!13019)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101195 (_ BitVec 32)) SeekEntryResult!13019)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520738 (= lt!659010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48831 a!2804) j!70) mask!2512) (select (arr!48831 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520739 () Bool)

(declare-fun res!1040166 () Bool)

(assert (=> b!1520739 (=> (not res!1040166) (not e!848223))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520739 (= res!1040166 (validKeyInArray!0 (select (arr!48831 a!2804) i!961)))))

(declare-fun b!1520740 () Bool)

(declare-fun res!1040168 () Bool)

(assert (=> b!1520740 (=> (not res!1040168) (not e!848223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101195 (_ BitVec 32)) Bool)

(assert (=> b!1520740 (= res!1040168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520741 () Bool)

(declare-fun res!1040167 () Bool)

(assert (=> b!1520741 (=> (not res!1040167) (not e!848223))))

(assert (=> b!1520741 (= res!1040167 (validKeyInArray!0 (select (arr!48831 a!2804) j!70)))))

(declare-fun b!1520742 () Bool)

(declare-fun res!1040170 () Bool)

(assert (=> b!1520742 (=> (not res!1040170) (not e!848223))))

(assert (=> b!1520742 (= res!1040170 (and (= (size!49383 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49383 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49383 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520743 () Bool)

(declare-fun res!1040171 () Bool)

(assert (=> b!1520743 (=> (not res!1040171) (not e!848223))))

(declare-datatypes ((List!35392 0))(
  ( (Nil!35389) (Cons!35388 (h!36810 (_ BitVec 64)) (t!50078 List!35392)) )
))
(declare-fun arrayNoDuplicates!0 (array!101195 (_ BitVec 32) List!35392) Bool)

(assert (=> b!1520743 (= res!1040171 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35389))))

(assert (= (and start!129520 res!1040169) b!1520742))

(assert (= (and b!1520742 res!1040170) b!1520739))

(assert (= (and b!1520739 res!1040166) b!1520741))

(assert (= (and b!1520741 res!1040167) b!1520740))

(assert (= (and b!1520740 res!1040168) b!1520743))

(assert (= (and b!1520743 res!1040171) b!1520737))

(assert (= (and b!1520737 res!1040165) b!1520738))

(declare-fun m!1403293 () Bool)

(assert (=> b!1520739 m!1403293))

(assert (=> b!1520739 m!1403293))

(declare-fun m!1403295 () Bool)

(assert (=> b!1520739 m!1403295))

(declare-fun m!1403297 () Bool)

(assert (=> b!1520741 m!1403297))

(assert (=> b!1520741 m!1403297))

(declare-fun m!1403299 () Bool)

(assert (=> b!1520741 m!1403299))

(declare-fun m!1403301 () Bool)

(assert (=> start!129520 m!1403301))

(declare-fun m!1403303 () Bool)

(assert (=> start!129520 m!1403303))

(assert (=> b!1520738 m!1403297))

(assert (=> b!1520738 m!1403297))

(declare-fun m!1403305 () Bool)

(assert (=> b!1520738 m!1403305))

(assert (=> b!1520738 m!1403305))

(assert (=> b!1520738 m!1403297))

(declare-fun m!1403307 () Bool)

(assert (=> b!1520738 m!1403307))

(declare-fun m!1403309 () Bool)

(assert (=> b!1520743 m!1403309))

(declare-fun m!1403311 () Bool)

(assert (=> b!1520740 m!1403311))

(push 1)

(assert (not b!1520740))

(assert (not b!1520743))

(assert (not b!1520739))

(assert (not start!129520))

(assert (not b!1520738))

(assert (not b!1520741))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

