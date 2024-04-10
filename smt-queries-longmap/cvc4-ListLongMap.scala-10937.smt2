; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127960 () Bool)

(assert start!127960)

(declare-fun res!1024107 () Bool)

(declare-fun e!840565 () Bool)

(assert (=> start!127960 (=> (not res!1024107) (not e!840565))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127960 (= res!1024107 (validMask!0 mask!2661))))

(assert (=> start!127960 e!840565))

(assert (=> start!127960 true))

(declare-datatypes ((array!100275 0))(
  ( (array!100276 (arr!48394 (Array (_ BitVec 32) (_ BitVec 64))) (size!48944 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100275)

(declare-fun array_inv!37422 (array!100275) Bool)

(assert (=> start!127960 (array_inv!37422 a!2850)))

(declare-fun b!1503228 () Bool)

(declare-fun res!1024111 () Bool)

(assert (=> b!1503228 (=> (not res!1024111) (not e!840565))))

(declare-datatypes ((List!34886 0))(
  ( (Nil!34883) (Cons!34882 (h!36279 (_ BitVec 64)) (t!49580 List!34886)) )
))
(declare-fun arrayNoDuplicates!0 (array!100275 (_ BitVec 32) List!34886) Bool)

(assert (=> b!1503228 (= res!1024111 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34883))))

(declare-fun b!1503229 () Bool)

(declare-fun res!1024112 () Bool)

(assert (=> b!1503229 (=> (not res!1024112) (not e!840565))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1503229 (= res!1024112 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48944 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48944 a!2850)) (= (select (arr!48394 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48394 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48944 a!2850))))))

(declare-fun b!1503230 () Bool)

(declare-fun res!1024109 () Bool)

(assert (=> b!1503230 (=> (not res!1024109) (not e!840565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503230 (= res!1024109 (validKeyInArray!0 (select (arr!48394 a!2850) i!996)))))

(declare-fun b!1503231 () Bool)

(declare-fun res!1024114 () Bool)

(assert (=> b!1503231 (=> (not res!1024114) (not e!840565))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503231 (= res!1024114 (not (= (select (arr!48394 a!2850) index!625) (select (arr!48394 a!2850) j!87))))))

(declare-fun b!1503232 () Bool)

(declare-fun res!1024113 () Bool)

(assert (=> b!1503232 (=> (not res!1024113) (not e!840565))))

(declare-datatypes ((SeekEntryResult!12592 0))(
  ( (MissingZero!12592 (index!52760 (_ BitVec 32))) (Found!12592 (index!52761 (_ BitVec 32))) (Intermediate!12592 (undefined!13404 Bool) (index!52762 (_ BitVec 32)) (x!134440 (_ BitVec 32))) (Undefined!12592) (MissingVacant!12592 (index!52763 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100275 (_ BitVec 32)) SeekEntryResult!12592)

(assert (=> b!1503232 (= res!1024113 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48394 a!2850) j!87) a!2850 mask!2661) (Found!12592 j!87)))))

(declare-fun b!1503233 () Bool)

(declare-fun res!1024110 () Bool)

(assert (=> b!1503233 (=> (not res!1024110) (not e!840565))))

(assert (=> b!1503233 (= res!1024110 (validKeyInArray!0 (select (arr!48394 a!2850) j!87)))))

(declare-fun b!1503234 () Bool)

(declare-fun res!1024106 () Bool)

(assert (=> b!1503234 (=> (not res!1024106) (not e!840565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100275 (_ BitVec 32)) Bool)

(assert (=> b!1503234 (= res!1024106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503235 () Bool)

(assert (=> b!1503235 (= e!840565 false)))

(declare-fun lt!653503 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503235 (= lt!653503 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503236 () Bool)

(declare-fun res!1024108 () Bool)

(assert (=> b!1503236 (=> (not res!1024108) (not e!840565))))

(assert (=> b!1503236 (= res!1024108 (and (= (size!48944 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48944 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48944 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127960 res!1024107) b!1503236))

(assert (= (and b!1503236 res!1024108) b!1503230))

(assert (= (and b!1503230 res!1024109) b!1503233))

(assert (= (and b!1503233 res!1024110) b!1503234))

(assert (= (and b!1503234 res!1024106) b!1503228))

(assert (= (and b!1503228 res!1024111) b!1503229))

(assert (= (and b!1503229 res!1024112) b!1503232))

(assert (= (and b!1503232 res!1024113) b!1503231))

(assert (= (and b!1503231 res!1024114) b!1503235))

(declare-fun m!1386471 () Bool)

(assert (=> start!127960 m!1386471))

(declare-fun m!1386473 () Bool)

(assert (=> start!127960 m!1386473))

(declare-fun m!1386475 () Bool)

(assert (=> b!1503235 m!1386475))

(declare-fun m!1386477 () Bool)

(assert (=> b!1503228 m!1386477))

(declare-fun m!1386479 () Bool)

(assert (=> b!1503233 m!1386479))

(assert (=> b!1503233 m!1386479))

(declare-fun m!1386481 () Bool)

(assert (=> b!1503233 m!1386481))

(declare-fun m!1386483 () Bool)

(assert (=> b!1503234 m!1386483))

(declare-fun m!1386485 () Bool)

(assert (=> b!1503231 m!1386485))

(assert (=> b!1503231 m!1386479))

(declare-fun m!1386487 () Bool)

(assert (=> b!1503229 m!1386487))

(declare-fun m!1386489 () Bool)

(assert (=> b!1503229 m!1386489))

(declare-fun m!1386491 () Bool)

(assert (=> b!1503229 m!1386491))

(declare-fun m!1386493 () Bool)

(assert (=> b!1503230 m!1386493))

(assert (=> b!1503230 m!1386493))

(declare-fun m!1386495 () Bool)

(assert (=> b!1503230 m!1386495))

(assert (=> b!1503232 m!1386479))

(assert (=> b!1503232 m!1386479))

(declare-fun m!1386497 () Bool)

(assert (=> b!1503232 m!1386497))

(push 1)

(assert (not b!1503235))

(assert (not b!1503230))

(assert (not b!1503234))

(assert (not b!1503232))

(assert (not b!1503228))

(assert (not start!127960))

