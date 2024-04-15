; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127770 () Bool)

(assert start!127770)

(declare-fun b!1501735 () Bool)

(declare-fun res!1023002 () Bool)

(declare-fun e!839951 () Bool)

(assert (=> b!1501735 (=> (not res!1023002) (not e!839951))))

(declare-datatypes ((array!100145 0))(
  ( (array!100146 (arr!48333 (Array (_ BitVec 32) (_ BitVec 64))) (size!48885 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100145)

(declare-datatypes ((List!34903 0))(
  ( (Nil!34900) (Cons!34899 (h!36297 (_ BitVec 64)) (t!49589 List!34903)) )
))
(declare-fun arrayNoDuplicates!0 (array!100145 (_ BitVec 32) List!34903) Bool)

(assert (=> b!1501735 (= res!1023002 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34900))))

(declare-fun b!1501736 () Bool)

(declare-fun res!1022999 () Bool)

(assert (=> b!1501736 (=> (not res!1022999) (not e!839951))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501736 (= res!1022999 (validKeyInArray!0 (select (arr!48333 a!2850) i!996)))))

(declare-fun b!1501737 () Bool)

(declare-fun res!1023000 () Bool)

(assert (=> b!1501737 (=> (not res!1023000) (not e!839951))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501737 (= res!1023000 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48885 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48885 a!2850)) (= (select (arr!48333 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48333 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48885 a!2850))))))

(declare-fun res!1023003 () Bool)

(assert (=> start!127770 (=> (not res!1023003) (not e!839951))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127770 (= res!1023003 (validMask!0 mask!2661))))

(assert (=> start!127770 e!839951))

(assert (=> start!127770 true))

(declare-fun array_inv!37566 (array!100145) Bool)

(assert (=> start!127770 (array_inv!37566 a!2850)))

(declare-fun b!1501738 () Bool)

(declare-fun res!1023005 () Bool)

(assert (=> b!1501738 (=> (not res!1023005) (not e!839951))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501738 (= res!1023005 (validKeyInArray!0 (select (arr!48333 a!2850) j!87)))))

(declare-fun b!1501739 () Bool)

(declare-fun res!1023004 () Bool)

(assert (=> b!1501739 (=> (not res!1023004) (not e!839951))))

(assert (=> b!1501739 (= res!1023004 (and (= (size!48885 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48885 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48885 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501740 () Bool)

(assert (=> b!1501740 (= e!839951 false)))

(declare-datatypes ((SeekEntryResult!12552 0))(
  ( (MissingZero!12552 (index!52600 (_ BitVec 32))) (Found!12552 (index!52601 (_ BitVec 32))) (Intermediate!12552 (undefined!13364 Bool) (index!52602 (_ BitVec 32)) (x!134293 (_ BitVec 32))) (Undefined!12552) (MissingVacant!12552 (index!52603 (_ BitVec 32))) )
))
(declare-fun lt!653029 () SeekEntryResult!12552)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100145 (_ BitVec 32)) SeekEntryResult!12552)

(assert (=> b!1501740 (= lt!653029 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48333 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501741 () Bool)

(declare-fun res!1023001 () Bool)

(assert (=> b!1501741 (=> (not res!1023001) (not e!839951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100145 (_ BitVec 32)) Bool)

(assert (=> b!1501741 (= res!1023001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127770 res!1023003) b!1501739))

(assert (= (and b!1501739 res!1023004) b!1501736))

(assert (= (and b!1501736 res!1022999) b!1501738))

(assert (= (and b!1501738 res!1023005) b!1501741))

(assert (= (and b!1501741 res!1023001) b!1501735))

(assert (= (and b!1501735 res!1023002) b!1501737))

(assert (= (and b!1501737 res!1023000) b!1501740))

(declare-fun m!1384477 () Bool)

(assert (=> b!1501735 m!1384477))

(declare-fun m!1384479 () Bool)

(assert (=> b!1501738 m!1384479))

(assert (=> b!1501738 m!1384479))

(declare-fun m!1384481 () Bool)

(assert (=> b!1501738 m!1384481))

(assert (=> b!1501740 m!1384479))

(assert (=> b!1501740 m!1384479))

(declare-fun m!1384483 () Bool)

(assert (=> b!1501740 m!1384483))

(declare-fun m!1384485 () Bool)

(assert (=> b!1501736 m!1384485))

(assert (=> b!1501736 m!1384485))

(declare-fun m!1384487 () Bool)

(assert (=> b!1501736 m!1384487))

(declare-fun m!1384489 () Bool)

(assert (=> b!1501741 m!1384489))

(declare-fun m!1384491 () Bool)

(assert (=> start!127770 m!1384491))

(declare-fun m!1384493 () Bool)

(assert (=> start!127770 m!1384493))

(declare-fun m!1384495 () Bool)

(assert (=> b!1501737 m!1384495))

(declare-fun m!1384497 () Bool)

(assert (=> b!1501737 m!1384497))

(declare-fun m!1384499 () Bool)

(assert (=> b!1501737 m!1384499))

(push 1)

(assert (not b!1501736))

(assert (not b!1501738))

(assert (not b!1501735))

(assert (not b!1501741))

(assert (not b!1501740))

(assert (not start!127770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

