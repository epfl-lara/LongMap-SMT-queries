; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128368 () Bool)

(assert start!128368)

(declare-fun b!1506059 () Bool)

(declare-fun res!1025671 () Bool)

(declare-fun e!841982 () Bool)

(assert (=> b!1506059 (=> (not res!1025671) (not e!841982))))

(declare-datatypes ((array!100458 0))(
  ( (array!100459 (arr!48479 (Array (_ BitVec 32) (_ BitVec 64))) (size!49030 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100458)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1506059 (= res!1025671 (not (= (select (arr!48479 a!2850) index!625) (select (arr!48479 a!2850) j!87))))))

(declare-fun b!1506060 () Bool)

(declare-fun res!1025678 () Bool)

(assert (=> b!1506060 (=> (not res!1025678) (not e!841982))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1506060 (= res!1025678 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49030 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49030 a!2850)) (= (select (arr!48479 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48479 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49030 a!2850))))))

(declare-fun b!1506061 () Bool)

(assert (=> b!1506061 (= e!841982 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!654316 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506061 (= lt!654316 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1506062 () Bool)

(declare-fun res!1025677 () Bool)

(assert (=> b!1506062 (=> (not res!1025677) (not e!841982))))

(declare-datatypes ((SeekEntryResult!12570 0))(
  ( (MissingZero!12570 (index!52672 (_ BitVec 32))) (Found!12570 (index!52673 (_ BitVec 32))) (Intermediate!12570 (undefined!13382 Bool) (index!52674 (_ BitVec 32)) (x!134549 (_ BitVec 32))) (Undefined!12570) (MissingVacant!12570 (index!52675 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100458 (_ BitVec 32)) SeekEntryResult!12570)

(assert (=> b!1506062 (= res!1025677 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48479 a!2850) j!87) a!2850 mask!2661) (Found!12570 j!87)))))

(declare-fun res!1025673 () Bool)

(assert (=> start!128368 (=> (not res!1025673) (not e!841982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128368 (= res!1025673 (validMask!0 mask!2661))))

(assert (=> start!128368 e!841982))

(assert (=> start!128368 true))

(declare-fun array_inv!37760 (array!100458) Bool)

(assert (=> start!128368 (array_inv!37760 a!2850)))

(declare-fun b!1506063 () Bool)

(declare-fun res!1025674 () Bool)

(assert (=> b!1506063 (=> (not res!1025674) (not e!841982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506063 (= res!1025674 (validKeyInArray!0 (select (arr!48479 a!2850) j!87)))))

(declare-fun b!1506064 () Bool)

(declare-fun res!1025672 () Bool)

(assert (=> b!1506064 (=> (not res!1025672) (not e!841982))))

(assert (=> b!1506064 (= res!1025672 (and (= (size!49030 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49030 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49030 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1506065 () Bool)

(declare-fun res!1025676 () Bool)

(assert (=> b!1506065 (=> (not res!1025676) (not e!841982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100458 (_ BitVec 32)) Bool)

(assert (=> b!1506065 (= res!1025676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1506066 () Bool)

(declare-fun res!1025675 () Bool)

(assert (=> b!1506066 (=> (not res!1025675) (not e!841982))))

(assert (=> b!1506066 (= res!1025675 (validKeyInArray!0 (select (arr!48479 a!2850) i!996)))))

(declare-fun b!1506067 () Bool)

(declare-fun res!1025670 () Bool)

(assert (=> b!1506067 (=> (not res!1025670) (not e!841982))))

(declare-datatypes ((List!34958 0))(
  ( (Nil!34955) (Cons!34954 (h!36366 (_ BitVec 64)) (t!49644 List!34958)) )
))
(declare-fun arrayNoDuplicates!0 (array!100458 (_ BitVec 32) List!34958) Bool)

(assert (=> b!1506067 (= res!1025670 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34955))))

(assert (= (and start!128368 res!1025673) b!1506064))

(assert (= (and b!1506064 res!1025672) b!1506066))

(assert (= (and b!1506066 res!1025675) b!1506063))

(assert (= (and b!1506063 res!1025674) b!1506065))

(assert (= (and b!1506065 res!1025676) b!1506067))

(assert (= (and b!1506067 res!1025670) b!1506060))

(assert (= (and b!1506060 res!1025678) b!1506062))

(assert (= (and b!1506062 res!1025677) b!1506059))

(assert (= (and b!1506059 res!1025671) b!1506061))

(declare-fun m!1389217 () Bool)

(assert (=> b!1506063 m!1389217))

(assert (=> b!1506063 m!1389217))

(declare-fun m!1389219 () Bool)

(assert (=> b!1506063 m!1389219))

(declare-fun m!1389221 () Bool)

(assert (=> b!1506060 m!1389221))

(declare-fun m!1389223 () Bool)

(assert (=> b!1506060 m!1389223))

(declare-fun m!1389225 () Bool)

(assert (=> b!1506060 m!1389225))

(declare-fun m!1389227 () Bool)

(assert (=> b!1506067 m!1389227))

(assert (=> b!1506062 m!1389217))

(assert (=> b!1506062 m!1389217))

(declare-fun m!1389229 () Bool)

(assert (=> b!1506062 m!1389229))

(declare-fun m!1389231 () Bool)

(assert (=> b!1506065 m!1389231))

(declare-fun m!1389233 () Bool)

(assert (=> b!1506059 m!1389233))

(assert (=> b!1506059 m!1389217))

(declare-fun m!1389235 () Bool)

(assert (=> b!1506066 m!1389235))

(assert (=> b!1506066 m!1389235))

(declare-fun m!1389237 () Bool)

(assert (=> b!1506066 m!1389237))

(declare-fun m!1389239 () Bool)

(assert (=> start!128368 m!1389239))

(declare-fun m!1389241 () Bool)

(assert (=> start!128368 m!1389241))

(declare-fun m!1389243 () Bool)

(assert (=> b!1506061 m!1389243))

(push 1)

(assert (not b!1506063))

(assert (not start!128368))

(assert (not b!1506066))

(assert (not b!1506067))

(assert (not b!1506061))

(assert (not b!1506065))

(assert (not b!1506062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

