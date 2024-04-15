; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127908 () Bool)

(assert start!127908)

(declare-fun b!1502831 () Bool)

(declare-fun res!1023899 () Bool)

(declare-fun e!840348 () Bool)

(assert (=> b!1502831 (=> (not res!1023899) (not e!840348))))

(declare-datatypes ((array!100217 0))(
  ( (array!100218 (arr!48366 (Array (_ BitVec 32) (_ BitVec 64))) (size!48918 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100217)

(declare-datatypes ((List!34936 0))(
  ( (Nil!34933) (Cons!34932 (h!36330 (_ BitVec 64)) (t!49622 List!34936)) )
))
(declare-fun arrayNoDuplicates!0 (array!100217 (_ BitVec 32) List!34936) Bool)

(assert (=> b!1502831 (= res!1023899 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34933))))

(declare-fun b!1502832 () Bool)

(declare-fun res!1023900 () Bool)

(assert (=> b!1502832 (=> (not res!1023900) (not e!840348))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502832 (= res!1023900 (validKeyInArray!0 (select (arr!48366 a!2850) i!996)))))

(declare-fun b!1502833 () Bool)

(declare-fun res!1023901 () Bool)

(assert (=> b!1502833 (=> (not res!1023901) (not e!840348))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502833 (= res!1023901 (and (= (size!48918 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48918 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48918 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502834 () Bool)

(declare-fun res!1023898 () Bool)

(assert (=> b!1502834 (=> (not res!1023898) (not e!840348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100217 (_ BitVec 32)) Bool)

(assert (=> b!1502834 (= res!1023898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502835 () Bool)

(declare-fun res!1023905 () Bool)

(assert (=> b!1502835 (=> (not res!1023905) (not e!840348))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1502835 (= res!1023905 (not (= (select (arr!48366 a!2850) index!625) (select (arr!48366 a!2850) j!87))))))

(declare-fun b!1502836 () Bool)

(declare-fun res!1023897 () Bool)

(assert (=> b!1502836 (=> (not res!1023897) (not e!840348))))

(assert (=> b!1502836 (= res!1023897 (validKeyInArray!0 (select (arr!48366 a!2850) j!87)))))

(declare-fun res!1023904 () Bool)

(assert (=> start!127908 (=> (not res!1023904) (not e!840348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127908 (= res!1023904 (validMask!0 mask!2661))))

(assert (=> start!127908 e!840348))

(assert (=> start!127908 true))

(declare-fun array_inv!37599 (array!100217) Bool)

(assert (=> start!127908 (array_inv!37599 a!2850)))

(declare-fun b!1502837 () Bool)

(declare-fun res!1023903 () Bool)

(assert (=> b!1502837 (=> (not res!1023903) (not e!840348))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12585 0))(
  ( (MissingZero!12585 (index!52732 (_ BitVec 32))) (Found!12585 (index!52733 (_ BitVec 32))) (Intermediate!12585 (undefined!13397 Bool) (index!52734 (_ BitVec 32)) (x!134420 (_ BitVec 32))) (Undefined!12585) (MissingVacant!12585 (index!52735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100217 (_ BitVec 32)) SeekEntryResult!12585)

(assert (=> b!1502837 (= res!1023903 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48366 a!2850) j!87) a!2850 mask!2661) (Found!12585 j!87)))))

(declare-fun b!1502838 () Bool)

(assert (=> b!1502838 (= e!840348 false)))

(declare-fun lt!653215 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502838 (= lt!653215 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502839 () Bool)

(declare-fun res!1023902 () Bool)

(assert (=> b!1502839 (=> (not res!1023902) (not e!840348))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502839 (= res!1023902 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48918 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48918 a!2850)) (= (select (arr!48366 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48366 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48918 a!2850))))))

(assert (= (and start!127908 res!1023904) b!1502833))

(assert (= (and b!1502833 res!1023901) b!1502832))

(assert (= (and b!1502832 res!1023900) b!1502836))

(assert (= (and b!1502836 res!1023897) b!1502834))

(assert (= (and b!1502834 res!1023898) b!1502831))

(assert (= (and b!1502831 res!1023899) b!1502839))

(assert (= (and b!1502839 res!1023902) b!1502837))

(assert (= (and b!1502837 res!1023903) b!1502835))

(assert (= (and b!1502835 res!1023905) b!1502838))

(declare-fun m!1385517 () Bool)

(assert (=> b!1502839 m!1385517))

(declare-fun m!1385519 () Bool)

(assert (=> b!1502839 m!1385519))

(declare-fun m!1385521 () Bool)

(assert (=> b!1502839 m!1385521))

(declare-fun m!1385523 () Bool)

(assert (=> b!1502835 m!1385523))

(declare-fun m!1385525 () Bool)

(assert (=> b!1502835 m!1385525))

(declare-fun m!1385527 () Bool)

(assert (=> b!1502832 m!1385527))

(assert (=> b!1502832 m!1385527))

(declare-fun m!1385529 () Bool)

(assert (=> b!1502832 m!1385529))

(declare-fun m!1385531 () Bool)

(assert (=> b!1502831 m!1385531))

(declare-fun m!1385533 () Bool)

(assert (=> b!1502834 m!1385533))

(declare-fun m!1385535 () Bool)

(assert (=> b!1502838 m!1385535))

(assert (=> b!1502837 m!1385525))

(assert (=> b!1502837 m!1385525))

(declare-fun m!1385537 () Bool)

(assert (=> b!1502837 m!1385537))

(declare-fun m!1385539 () Bool)

(assert (=> start!127908 m!1385539))

(declare-fun m!1385541 () Bool)

(assert (=> start!127908 m!1385541))

(assert (=> b!1502836 m!1385525))

(assert (=> b!1502836 m!1385525))

(declare-fun m!1385543 () Bool)

(assert (=> b!1502836 m!1385543))

(push 1)

(assert (not b!1502832))

(assert (not b!1502838))

(assert (not b!1502836))

(assert (not b!1502831))

(assert (not start!127908))

(assert (not b!1502834))

(assert (not b!1502837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

