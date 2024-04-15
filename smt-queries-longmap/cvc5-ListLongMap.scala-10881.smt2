; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127506 () Bool)

(assert start!127506)

(declare-fun b!1498162 () Bool)

(declare-fun res!1019430 () Bool)

(declare-fun e!838836 () Bool)

(assert (=> b!1498162 (=> (not res!1019430) (not e!838836))))

(declare-datatypes ((array!99881 0))(
  ( (array!99882 (arr!48201 (Array (_ BitVec 32) (_ BitVec 64))) (size!48753 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99881)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498162 (= res!1019430 (validKeyInArray!0 (select (arr!48201 a!2850) i!996)))))

(declare-fun b!1498163 () Bool)

(assert (=> b!1498163 (= e!838836 false)))

(declare-datatypes ((SeekEntryResult!12432 0))(
  ( (MissingZero!12432 (index!52120 (_ BitVec 32))) (Found!12432 (index!52121 (_ BitVec 32))) (Intermediate!12432 (undefined!13244 Bool) (index!52122 (_ BitVec 32)) (x!133821 (_ BitVec 32))) (Undefined!12432) (MissingVacant!12432 (index!52123 (_ BitVec 32))) )
))
(declare-fun lt!652372 () SeekEntryResult!12432)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99881 (_ BitVec 32)) SeekEntryResult!12432)

(assert (=> b!1498163 (= lt!652372 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48201 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1019432 () Bool)

(assert (=> start!127506 (=> (not res!1019432) (not e!838836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127506 (= res!1019432 (validMask!0 mask!2661))))

(assert (=> start!127506 e!838836))

(assert (=> start!127506 true))

(declare-fun array_inv!37434 (array!99881) Bool)

(assert (=> start!127506 (array_inv!37434 a!2850)))

(declare-fun b!1498164 () Bool)

(declare-fun res!1019427 () Bool)

(assert (=> b!1498164 (=> (not res!1019427) (not e!838836))))

(assert (=> b!1498164 (= res!1019427 (and (= (size!48753 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48753 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48753 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498165 () Bool)

(declare-fun res!1019431 () Bool)

(assert (=> b!1498165 (=> (not res!1019431) (not e!838836))))

(assert (=> b!1498165 (= res!1019431 (validKeyInArray!0 (select (arr!48201 a!2850) j!87)))))

(declare-fun b!1498166 () Bool)

(declare-fun res!1019426 () Bool)

(assert (=> b!1498166 (=> (not res!1019426) (not e!838836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99881 (_ BitVec 32)) Bool)

(assert (=> b!1498166 (= res!1019426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498167 () Bool)

(declare-fun res!1019429 () Bool)

(assert (=> b!1498167 (=> (not res!1019429) (not e!838836))))

(declare-datatypes ((List!34771 0))(
  ( (Nil!34768) (Cons!34767 (h!36165 (_ BitVec 64)) (t!49457 List!34771)) )
))
(declare-fun arrayNoDuplicates!0 (array!99881 (_ BitVec 32) List!34771) Bool)

(assert (=> b!1498167 (= res!1019429 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34768))))

(declare-fun b!1498168 () Bool)

(declare-fun res!1019428 () Bool)

(assert (=> b!1498168 (=> (not res!1019428) (not e!838836))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498168 (= res!1019428 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48753 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48753 a!2850)) (= (select (arr!48201 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48201 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48753 a!2850))))))

(assert (= (and start!127506 res!1019432) b!1498164))

(assert (= (and b!1498164 res!1019427) b!1498162))

(assert (= (and b!1498162 res!1019430) b!1498165))

(assert (= (and b!1498165 res!1019431) b!1498166))

(assert (= (and b!1498166 res!1019426) b!1498167))

(assert (= (and b!1498167 res!1019429) b!1498168))

(assert (= (and b!1498168 res!1019428) b!1498163))

(declare-fun m!1380721 () Bool)

(assert (=> b!1498166 m!1380721))

(declare-fun m!1380723 () Bool)

(assert (=> b!1498167 m!1380723))

(declare-fun m!1380725 () Bool)

(assert (=> b!1498165 m!1380725))

(assert (=> b!1498165 m!1380725))

(declare-fun m!1380727 () Bool)

(assert (=> b!1498165 m!1380727))

(declare-fun m!1380729 () Bool)

(assert (=> b!1498162 m!1380729))

(assert (=> b!1498162 m!1380729))

(declare-fun m!1380731 () Bool)

(assert (=> b!1498162 m!1380731))

(assert (=> b!1498163 m!1380725))

(assert (=> b!1498163 m!1380725))

(declare-fun m!1380733 () Bool)

(assert (=> b!1498163 m!1380733))

(declare-fun m!1380735 () Bool)

(assert (=> b!1498168 m!1380735))

(declare-fun m!1380737 () Bool)

(assert (=> b!1498168 m!1380737))

(declare-fun m!1380739 () Bool)

(assert (=> b!1498168 m!1380739))

(declare-fun m!1380741 () Bool)

(assert (=> start!127506 m!1380741))

(declare-fun m!1380743 () Bool)

(assert (=> start!127506 m!1380743))

(push 1)

(assert (not b!1498162))

(assert (not b!1498165))

(assert (not b!1498166))

(assert (not start!127506))

(assert (not b!1498163))

(assert (not b!1498167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

