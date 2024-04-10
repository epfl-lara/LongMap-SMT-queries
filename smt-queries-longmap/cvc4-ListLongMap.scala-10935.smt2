; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127948 () Bool)

(assert start!127948)

(declare-fun b!1503066 () Bool)

(declare-fun res!1023952 () Bool)

(declare-fun e!840529 () Bool)

(assert (=> b!1503066 (=> (not res!1023952) (not e!840529))))

(declare-datatypes ((array!100263 0))(
  ( (array!100264 (arr!48388 (Array (_ BitVec 32) (_ BitVec 64))) (size!48938 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100263)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503066 (= res!1023952 (validKeyInArray!0 (select (arr!48388 a!2850) i!996)))))

(declare-fun b!1503067 () Bool)

(declare-fun res!1023951 () Bool)

(assert (=> b!1503067 (=> (not res!1023951) (not e!840529))))

(declare-datatypes ((List!34880 0))(
  ( (Nil!34877) (Cons!34876 (h!36273 (_ BitVec 64)) (t!49574 List!34880)) )
))
(declare-fun arrayNoDuplicates!0 (array!100263 (_ BitVec 32) List!34880) Bool)

(assert (=> b!1503067 (= res!1023951 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34877))))

(declare-fun b!1503068 () Bool)

(declare-fun res!1023947 () Bool)

(assert (=> b!1503068 (=> (not res!1023947) (not e!840529))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503068 (= res!1023947 (validKeyInArray!0 (select (arr!48388 a!2850) j!87)))))

(declare-fun b!1503069 () Bool)

(declare-fun res!1023946 () Bool)

(assert (=> b!1503069 (=> (not res!1023946) (not e!840529))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1503069 (= res!1023946 (and (= (size!48938 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48938 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48938 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503070 () Bool)

(declare-fun res!1023944 () Bool)

(assert (=> b!1503070 (=> (not res!1023944) (not e!840529))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12586 0))(
  ( (MissingZero!12586 (index!52736 (_ BitVec 32))) (Found!12586 (index!52737 (_ BitVec 32))) (Intermediate!12586 (undefined!13398 Bool) (index!52738 (_ BitVec 32)) (x!134418 (_ BitVec 32))) (Undefined!12586) (MissingVacant!12586 (index!52739 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100263 (_ BitVec 32)) SeekEntryResult!12586)

(assert (=> b!1503070 (= res!1023944 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48388 a!2850) j!87) a!2850 mask!2661) (Found!12586 j!87)))))

(declare-fun b!1503072 () Bool)

(declare-fun res!1023950 () Bool)

(assert (=> b!1503072 (=> (not res!1023950) (not e!840529))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503072 (= res!1023950 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48938 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48938 a!2850)) (= (select (arr!48388 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48388 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48938 a!2850))))))

(declare-fun b!1503071 () Bool)

(declare-fun res!1023948 () Bool)

(assert (=> b!1503071 (=> (not res!1023948) (not e!840529))))

(assert (=> b!1503071 (= res!1023948 (not (= (select (arr!48388 a!2850) index!625) (select (arr!48388 a!2850) j!87))))))

(declare-fun res!1023949 () Bool)

(assert (=> start!127948 (=> (not res!1023949) (not e!840529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127948 (= res!1023949 (validMask!0 mask!2661))))

(assert (=> start!127948 e!840529))

(assert (=> start!127948 true))

(declare-fun array_inv!37416 (array!100263) Bool)

(assert (=> start!127948 (array_inv!37416 a!2850)))

(declare-fun b!1503073 () Bool)

(assert (=> b!1503073 (= e!840529 false)))

(declare-fun lt!653485 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503073 (= lt!653485 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503074 () Bool)

(declare-fun res!1023945 () Bool)

(assert (=> b!1503074 (=> (not res!1023945) (not e!840529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100263 (_ BitVec 32)) Bool)

(assert (=> b!1503074 (= res!1023945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127948 res!1023949) b!1503069))

(assert (= (and b!1503069 res!1023946) b!1503066))

(assert (= (and b!1503066 res!1023952) b!1503068))

(assert (= (and b!1503068 res!1023947) b!1503074))

(assert (= (and b!1503074 res!1023945) b!1503067))

(assert (= (and b!1503067 res!1023951) b!1503072))

(assert (= (and b!1503072 res!1023950) b!1503070))

(assert (= (and b!1503070 res!1023944) b!1503071))

(assert (= (and b!1503071 res!1023948) b!1503073))

(declare-fun m!1386303 () Bool)

(assert (=> b!1503067 m!1386303))

(declare-fun m!1386305 () Bool)

(assert (=> b!1503074 m!1386305))

(declare-fun m!1386307 () Bool)

(assert (=> start!127948 m!1386307))

(declare-fun m!1386309 () Bool)

(assert (=> start!127948 m!1386309))

(declare-fun m!1386311 () Bool)

(assert (=> b!1503073 m!1386311))

(declare-fun m!1386313 () Bool)

(assert (=> b!1503071 m!1386313))

(declare-fun m!1386315 () Bool)

(assert (=> b!1503071 m!1386315))

(declare-fun m!1386317 () Bool)

(assert (=> b!1503072 m!1386317))

(declare-fun m!1386319 () Bool)

(assert (=> b!1503072 m!1386319))

(declare-fun m!1386321 () Bool)

(assert (=> b!1503072 m!1386321))

(assert (=> b!1503068 m!1386315))

(assert (=> b!1503068 m!1386315))

(declare-fun m!1386323 () Bool)

(assert (=> b!1503068 m!1386323))

(declare-fun m!1386325 () Bool)

(assert (=> b!1503066 m!1386325))

(assert (=> b!1503066 m!1386325))

(declare-fun m!1386327 () Bool)

(assert (=> b!1503066 m!1386327))

(assert (=> b!1503070 m!1386315))

(assert (=> b!1503070 m!1386315))

(declare-fun m!1386329 () Bool)

(assert (=> b!1503070 m!1386329))

(push 1)

(assert (not b!1503070))

(assert (not b!1503067))

(assert (not start!127948))

(assert (not b!1503074))

(assert (not b!1503073))

(assert (not b!1503066))

(assert (not b!1503068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

