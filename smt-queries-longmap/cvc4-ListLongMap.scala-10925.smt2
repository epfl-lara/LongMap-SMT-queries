; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128116 () Bool)

(assert start!128116)

(declare-fun b!1503869 () Bool)

(declare-fun res!1023767 () Bool)

(declare-fun e!841284 () Bool)

(assert (=> b!1503869 (=> (not res!1023767) (not e!841284))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100311 0))(
  ( (array!100312 (arr!48410 (Array (_ BitVec 32) (_ BitVec 64))) (size!48961 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100311)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503869 (= res!1023767 (and (= (size!48961 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48961 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48961 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503870 () Bool)

(declare-fun res!1023764 () Bool)

(assert (=> b!1503870 (=> (not res!1023764) (not e!841284))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503870 (= res!1023764 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48961 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48961 a!2850)) (= (select (arr!48410 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48410 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48961 a!2850))))))

(declare-fun res!1023762 () Bool)

(assert (=> start!128116 (=> (not res!1023762) (not e!841284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128116 (= res!1023762 (validMask!0 mask!2661))))

(assert (=> start!128116 e!841284))

(assert (=> start!128116 true))

(declare-fun array_inv!37691 (array!100311) Bool)

(assert (=> start!128116 (array_inv!37691 a!2850)))

(declare-fun b!1503868 () Bool)

(declare-fun res!1023761 () Bool)

(assert (=> b!1503868 (=> (not res!1023761) (not e!841284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503868 (= res!1023761 (validKeyInArray!0 (select (arr!48410 a!2850) j!87)))))

(declare-fun b!1503871 () Bool)

(declare-fun res!1023766 () Bool)

(assert (=> b!1503871 (=> (not res!1023766) (not e!841284))))

(declare-datatypes ((List!34889 0))(
  ( (Nil!34886) (Cons!34885 (h!36297 (_ BitVec 64)) (t!49575 List!34889)) )
))
(declare-fun arrayNoDuplicates!0 (array!100311 (_ BitVec 32) List!34889) Bool)

(assert (=> b!1503871 (= res!1023766 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34886))))

(declare-fun b!1503872 () Bool)

(declare-fun res!1023765 () Bool)

(assert (=> b!1503872 (=> (not res!1023765) (not e!841284))))

(assert (=> b!1503872 (= res!1023765 (validKeyInArray!0 (select (arr!48410 a!2850) i!996)))))

(declare-fun b!1503873 () Bool)

(declare-fun res!1023763 () Bool)

(assert (=> b!1503873 (=> (not res!1023763) (not e!841284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100311 (_ BitVec 32)) Bool)

(assert (=> b!1503873 (= res!1023763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503874 () Bool)

(assert (=> b!1503874 (= e!841284 false)))

(declare-datatypes ((SeekEntryResult!12501 0))(
  ( (MissingZero!12501 (index!52396 (_ BitVec 32))) (Found!12501 (index!52397 (_ BitVec 32))) (Intermediate!12501 (undefined!13313 Bool) (index!52398 (_ BitVec 32)) (x!134284 (_ BitVec 32))) (Undefined!12501) (MissingVacant!12501 (index!52399 (_ BitVec 32))) )
))
(declare-fun lt!653970 () SeekEntryResult!12501)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100311 (_ BitVec 32)) SeekEntryResult!12501)

(assert (=> b!1503874 (= lt!653970 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48410 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!128116 res!1023762) b!1503869))

(assert (= (and b!1503869 res!1023767) b!1503872))

(assert (= (and b!1503872 res!1023765) b!1503868))

(assert (= (and b!1503868 res!1023761) b!1503873))

(assert (= (and b!1503873 res!1023763) b!1503871))

(assert (= (and b!1503871 res!1023766) b!1503870))

(assert (= (and b!1503870 res!1023764) b!1503874))

(declare-fun m!1387111 () Bool)

(assert (=> b!1503870 m!1387111))

(declare-fun m!1387113 () Bool)

(assert (=> b!1503870 m!1387113))

(declare-fun m!1387115 () Bool)

(assert (=> b!1503870 m!1387115))

(declare-fun m!1387117 () Bool)

(assert (=> b!1503868 m!1387117))

(assert (=> b!1503868 m!1387117))

(declare-fun m!1387119 () Bool)

(assert (=> b!1503868 m!1387119))

(declare-fun m!1387121 () Bool)

(assert (=> start!128116 m!1387121))

(declare-fun m!1387123 () Bool)

(assert (=> start!128116 m!1387123))

(assert (=> b!1503874 m!1387117))

(assert (=> b!1503874 m!1387117))

(declare-fun m!1387125 () Bool)

(assert (=> b!1503874 m!1387125))

(declare-fun m!1387127 () Bool)

(assert (=> b!1503871 m!1387127))

(declare-fun m!1387129 () Bool)

(assert (=> b!1503872 m!1387129))

(assert (=> b!1503872 m!1387129))

(declare-fun m!1387131 () Bool)

(assert (=> b!1503872 m!1387131))

(declare-fun m!1387133 () Bool)

(assert (=> b!1503873 m!1387133))

(push 1)

(assert (not b!1503868))

(assert (not b!1503873))

(assert (not b!1503871))

(assert (not b!1503874))

(assert (not b!1503872))

(assert (not start!128116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

