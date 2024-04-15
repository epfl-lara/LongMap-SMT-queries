; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127524 () Bool)

(assert start!127524)

(declare-fun b!1498368 () Bool)

(declare-fun res!1019634 () Bool)

(declare-fun e!838890 () Bool)

(assert (=> b!1498368 (=> (not res!1019634) (not e!838890))))

(declare-datatypes ((array!99899 0))(
  ( (array!99900 (arr!48210 (Array (_ BitVec 32) (_ BitVec 64))) (size!48762 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99899)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99899 (_ BitVec 32)) Bool)

(assert (=> b!1498368 (= res!1019634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498369 () Bool)

(declare-fun res!1019635 () Bool)

(assert (=> b!1498369 (=> (not res!1019635) (not e!838890))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498369 (= res!1019635 (validKeyInArray!0 (select (arr!48210 a!2850) i!996)))))

(declare-fun b!1498370 () Bool)

(declare-fun res!1019639 () Bool)

(assert (=> b!1498370 (=> (not res!1019639) (not e!838890))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498370 (= res!1019639 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48762 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48762 a!2850)) (= (select (arr!48210 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48210 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48762 a!2850))))))

(declare-fun b!1498371 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498371 (= e!838890 (and (= (select (arr!48210 a!2850) index!625) (select (arr!48210 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498372 () Bool)

(declare-fun res!1019636 () Bool)

(assert (=> b!1498372 (=> (not res!1019636) (not e!838890))))

(assert (=> b!1498372 (= res!1019636 (and (= (size!48762 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48762 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48762 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498374 () Bool)

(declare-fun res!1019633 () Bool)

(assert (=> b!1498374 (=> (not res!1019633) (not e!838890))))

(assert (=> b!1498374 (= res!1019633 (validKeyInArray!0 (select (arr!48210 a!2850) j!87)))))

(declare-fun b!1498375 () Bool)

(declare-fun res!1019632 () Bool)

(assert (=> b!1498375 (=> (not res!1019632) (not e!838890))))

(declare-datatypes ((SeekEntryResult!12441 0))(
  ( (MissingZero!12441 (index!52156 (_ BitVec 32))) (Found!12441 (index!52157 (_ BitVec 32))) (Intermediate!12441 (undefined!13253 Bool) (index!52158 (_ BitVec 32)) (x!133854 (_ BitVec 32))) (Undefined!12441) (MissingVacant!12441 (index!52159 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99899 (_ BitVec 32)) SeekEntryResult!12441)

(assert (=> b!1498375 (= res!1019632 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48210 a!2850) j!87) a!2850 mask!2661) (Found!12441 j!87)))))

(declare-fun b!1498373 () Bool)

(declare-fun res!1019637 () Bool)

(assert (=> b!1498373 (=> (not res!1019637) (not e!838890))))

(declare-datatypes ((List!34780 0))(
  ( (Nil!34777) (Cons!34776 (h!36174 (_ BitVec 64)) (t!49466 List!34780)) )
))
(declare-fun arrayNoDuplicates!0 (array!99899 (_ BitVec 32) List!34780) Bool)

(assert (=> b!1498373 (= res!1019637 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34777))))

(declare-fun res!1019638 () Bool)

(assert (=> start!127524 (=> (not res!1019638) (not e!838890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127524 (= res!1019638 (validMask!0 mask!2661))))

(assert (=> start!127524 e!838890))

(assert (=> start!127524 true))

(declare-fun array_inv!37443 (array!99899) Bool)

(assert (=> start!127524 (array_inv!37443 a!2850)))

(assert (= (and start!127524 res!1019638) b!1498372))

(assert (= (and b!1498372 res!1019636) b!1498369))

(assert (= (and b!1498369 res!1019635) b!1498374))

(assert (= (and b!1498374 res!1019633) b!1498368))

(assert (= (and b!1498368 res!1019634) b!1498373))

(assert (= (and b!1498373 res!1019637) b!1498370))

(assert (= (and b!1498370 res!1019639) b!1498375))

(assert (= (and b!1498375 res!1019632) b!1498371))

(declare-fun m!1380947 () Bool)

(assert (=> b!1498374 m!1380947))

(assert (=> b!1498374 m!1380947))

(declare-fun m!1380949 () Bool)

(assert (=> b!1498374 m!1380949))

(declare-fun m!1380951 () Bool)

(assert (=> start!127524 m!1380951))

(declare-fun m!1380953 () Bool)

(assert (=> start!127524 m!1380953))

(declare-fun m!1380955 () Bool)

(assert (=> b!1498371 m!1380955))

(assert (=> b!1498371 m!1380947))

(declare-fun m!1380957 () Bool)

(assert (=> b!1498370 m!1380957))

(declare-fun m!1380959 () Bool)

(assert (=> b!1498370 m!1380959))

(declare-fun m!1380961 () Bool)

(assert (=> b!1498370 m!1380961))

(assert (=> b!1498375 m!1380947))

(assert (=> b!1498375 m!1380947))

(declare-fun m!1380963 () Bool)

(assert (=> b!1498375 m!1380963))

(declare-fun m!1380965 () Bool)

(assert (=> b!1498368 m!1380965))

(declare-fun m!1380967 () Bool)

(assert (=> b!1498373 m!1380967))

(declare-fun m!1380969 () Bool)

(assert (=> b!1498369 m!1380969))

(assert (=> b!1498369 m!1380969))

(declare-fun m!1380971 () Bool)

(assert (=> b!1498369 m!1380971))

(push 1)

(assert (not b!1498369))

(assert (not b!1498375))

(assert (not b!1498374))

(assert (not start!127524))

(assert (not b!1498373))

(assert (not b!1498368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

