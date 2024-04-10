; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127562 () Bool)

(assert start!127562)

(declare-fun b!1498592 () Bool)

(declare-fun res!1019668 () Bool)

(declare-fun e!839064 () Bool)

(assert (=> b!1498592 (=> (not res!1019668) (not e!839064))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99943 0))(
  ( (array!99944 (arr!48231 (Array (_ BitVec 32) (_ BitVec 64))) (size!48781 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99943)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498592 (= res!1019668 (and (= (size!48781 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48781 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48781 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498593 () Bool)

(declare-fun res!1019673 () Bool)

(assert (=> b!1498593 (=> (not res!1019673) (not e!839064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498593 (= res!1019673 (validKeyInArray!0 (select (arr!48231 a!2850) i!996)))))

(declare-fun b!1498595 () Bool)

(assert (=> b!1498595 (= e!839064 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12441 0))(
  ( (MissingZero!12441 (index!52156 (_ BitVec 32))) (Found!12441 (index!52157 (_ BitVec 32))) (Intermediate!12441 (undefined!13253 Bool) (index!52158 (_ BitVec 32)) (x!133851 (_ BitVec 32))) (Undefined!12441) (MissingVacant!12441 (index!52159 (_ BitVec 32))) )
))
(declare-fun lt!652657 () SeekEntryResult!12441)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99943 (_ BitVec 32)) SeekEntryResult!12441)

(assert (=> b!1498595 (= lt!652657 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48231 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498596 () Bool)

(declare-fun res!1019672 () Bool)

(assert (=> b!1498596 (=> (not res!1019672) (not e!839064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99943 (_ BitVec 32)) Bool)

(assert (=> b!1498596 (= res!1019672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498594 () Bool)

(declare-fun res!1019669 () Bool)

(assert (=> b!1498594 (=> (not res!1019669) (not e!839064))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498594 (= res!1019669 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48781 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48781 a!2850)) (= (select (arr!48231 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48231 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48781 a!2850))))))

(declare-fun res!1019670 () Bool)

(assert (=> start!127562 (=> (not res!1019670) (not e!839064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127562 (= res!1019670 (validMask!0 mask!2661))))

(assert (=> start!127562 e!839064))

(assert (=> start!127562 true))

(declare-fun array_inv!37259 (array!99943) Bool)

(assert (=> start!127562 (array_inv!37259 a!2850)))

(declare-fun b!1498597 () Bool)

(declare-fun res!1019674 () Bool)

(assert (=> b!1498597 (=> (not res!1019674) (not e!839064))))

(declare-datatypes ((List!34723 0))(
  ( (Nil!34720) (Cons!34719 (h!36116 (_ BitVec 64)) (t!49417 List!34723)) )
))
(declare-fun arrayNoDuplicates!0 (array!99943 (_ BitVec 32) List!34723) Bool)

(assert (=> b!1498597 (= res!1019674 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34720))))

(declare-fun b!1498598 () Bool)

(declare-fun res!1019671 () Bool)

(assert (=> b!1498598 (=> (not res!1019671) (not e!839064))))

(assert (=> b!1498598 (= res!1019671 (validKeyInArray!0 (select (arr!48231 a!2850) j!87)))))

(assert (= (and start!127562 res!1019670) b!1498592))

(assert (= (and b!1498592 res!1019668) b!1498593))

(assert (= (and b!1498593 res!1019673) b!1498598))

(assert (= (and b!1498598 res!1019671) b!1498596))

(assert (= (and b!1498596 res!1019672) b!1498597))

(assert (= (and b!1498597 res!1019674) b!1498594))

(assert (= (and b!1498594 res!1019669) b!1498595))

(declare-fun m!1381717 () Bool)

(assert (=> b!1498593 m!1381717))

(assert (=> b!1498593 m!1381717))

(declare-fun m!1381719 () Bool)

(assert (=> b!1498593 m!1381719))

(declare-fun m!1381721 () Bool)

(assert (=> b!1498598 m!1381721))

(assert (=> b!1498598 m!1381721))

(declare-fun m!1381723 () Bool)

(assert (=> b!1498598 m!1381723))

(declare-fun m!1381725 () Bool)

(assert (=> start!127562 m!1381725))

(declare-fun m!1381727 () Bool)

(assert (=> start!127562 m!1381727))

(declare-fun m!1381729 () Bool)

(assert (=> b!1498596 m!1381729))

(assert (=> b!1498595 m!1381721))

(assert (=> b!1498595 m!1381721))

(declare-fun m!1381731 () Bool)

(assert (=> b!1498595 m!1381731))

(declare-fun m!1381733 () Bool)

(assert (=> b!1498597 m!1381733))

(declare-fun m!1381735 () Bool)

(assert (=> b!1498594 m!1381735))

(declare-fun m!1381737 () Bool)

(assert (=> b!1498594 m!1381737))

(declare-fun m!1381739 () Bool)

(assert (=> b!1498594 m!1381739))

(check-sat (not b!1498597) (not b!1498595) (not b!1498593) (not b!1498598) (not b!1498596) (not start!127562))
