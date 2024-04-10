; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127578 () Bool)

(assert start!127578)

(declare-fun b!1498771 () Bool)

(declare-fun res!1019852 () Bool)

(declare-fun e!839113 () Bool)

(assert (=> b!1498771 (=> (not res!1019852) (not e!839113))))

(declare-datatypes ((array!99959 0))(
  ( (array!99960 (arr!48239 (Array (_ BitVec 32) (_ BitVec 64))) (size!48789 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99959)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498771 (= res!1019852 (validKeyInArray!0 (select (arr!48239 a!2850) i!996)))))

(declare-fun res!1019851 () Bool)

(assert (=> start!127578 (=> (not res!1019851) (not e!839113))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127578 (= res!1019851 (validMask!0 mask!2661))))

(assert (=> start!127578 e!839113))

(assert (=> start!127578 true))

(declare-fun array_inv!37267 (array!99959) Bool)

(assert (=> start!127578 (array_inv!37267 a!2850)))

(declare-fun b!1498772 () Bool)

(declare-fun res!1019849 () Bool)

(assert (=> b!1498772 (=> (not res!1019849) (not e!839113))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498772 (= res!1019849 (and (= (size!48789 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48789 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48789 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498773 () Bool)

(declare-fun res!1019853 () Bool)

(assert (=> b!1498773 (=> (not res!1019853) (not e!839113))))

(declare-datatypes ((List!34731 0))(
  ( (Nil!34728) (Cons!34727 (h!36124 (_ BitVec 64)) (t!49425 List!34731)) )
))
(declare-fun arrayNoDuplicates!0 (array!99959 (_ BitVec 32) List!34731) Bool)

(assert (=> b!1498773 (= res!1019853 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34728))))

(declare-fun b!1498774 () Bool)

(declare-fun res!1019854 () Bool)

(assert (=> b!1498774 (=> (not res!1019854) (not e!839113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99959 (_ BitVec 32)) Bool)

(assert (=> b!1498774 (= res!1019854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498775 () Bool)

(declare-fun res!1019848 () Bool)

(assert (=> b!1498775 (=> (not res!1019848) (not e!839113))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498775 (= res!1019848 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48789 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48789 a!2850)) (= (select (arr!48239 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48239 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48789 a!2850))))))

(declare-fun b!1498776 () Bool)

(assert (=> b!1498776 (= e!839113 (and (= (select (arr!48239 a!2850) index!625) (select (arr!48239 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498777 () Bool)

(declare-fun res!1019850 () Bool)

(assert (=> b!1498777 (=> (not res!1019850) (not e!839113))))

(declare-datatypes ((SeekEntryResult!12449 0))(
  ( (MissingZero!12449 (index!52188 (_ BitVec 32))) (Found!12449 (index!52189 (_ BitVec 32))) (Intermediate!12449 (undefined!13261 Bool) (index!52190 (_ BitVec 32)) (x!133883 (_ BitVec 32))) (Undefined!12449) (MissingVacant!12449 (index!52191 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99959 (_ BitVec 32)) SeekEntryResult!12449)

(assert (=> b!1498777 (= res!1019850 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48239 a!2850) j!87) a!2850 mask!2661) (Found!12449 j!87)))))

(declare-fun b!1498778 () Bool)

(declare-fun res!1019847 () Bool)

(assert (=> b!1498778 (=> (not res!1019847) (not e!839113))))

(assert (=> b!1498778 (= res!1019847 (validKeyInArray!0 (select (arr!48239 a!2850) j!87)))))

(assert (= (and start!127578 res!1019851) b!1498772))

(assert (= (and b!1498772 res!1019849) b!1498771))

(assert (= (and b!1498771 res!1019852) b!1498778))

(assert (= (and b!1498778 res!1019847) b!1498774))

(assert (= (and b!1498774 res!1019854) b!1498773))

(assert (= (and b!1498773 res!1019853) b!1498775))

(assert (= (and b!1498775 res!1019848) b!1498777))

(assert (= (and b!1498777 res!1019850) b!1498776))

(declare-fun m!1381915 () Bool)

(assert (=> b!1498778 m!1381915))

(assert (=> b!1498778 m!1381915))

(declare-fun m!1381917 () Bool)

(assert (=> b!1498778 m!1381917))

(declare-fun m!1381919 () Bool)

(assert (=> b!1498773 m!1381919))

(declare-fun m!1381921 () Bool)

(assert (=> b!1498775 m!1381921))

(declare-fun m!1381923 () Bool)

(assert (=> b!1498775 m!1381923))

(declare-fun m!1381925 () Bool)

(assert (=> b!1498775 m!1381925))

(declare-fun m!1381927 () Bool)

(assert (=> b!1498776 m!1381927))

(assert (=> b!1498776 m!1381915))

(assert (=> b!1498777 m!1381915))

(assert (=> b!1498777 m!1381915))

(declare-fun m!1381929 () Bool)

(assert (=> b!1498777 m!1381929))

(declare-fun m!1381931 () Bool)

(assert (=> start!127578 m!1381931))

(declare-fun m!1381933 () Bool)

(assert (=> start!127578 m!1381933))

(declare-fun m!1381935 () Bool)

(assert (=> b!1498771 m!1381935))

(assert (=> b!1498771 m!1381935))

(declare-fun m!1381937 () Bool)

(assert (=> b!1498771 m!1381937))

(declare-fun m!1381939 () Bool)

(assert (=> b!1498774 m!1381939))

(push 1)

(assert (not b!1498773))

(assert (not b!1498774))

(assert (not b!1498777))

(assert (not b!1498778))

(assert (not b!1498771))

(assert (not start!127578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

