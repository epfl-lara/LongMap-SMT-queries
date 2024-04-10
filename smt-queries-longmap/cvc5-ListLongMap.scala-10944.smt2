; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128040 () Bool)

(assert start!128040)

(declare-fun b!1503876 () Bool)

(declare-fun res!1024670 () Bool)

(declare-fun e!840769 () Bool)

(assert (=> b!1503876 (=> (not res!1024670) (not e!840769))))

(declare-datatypes ((array!100316 0))(
  ( (array!100317 (arr!48413 (Array (_ BitVec 32) (_ BitVec 64))) (size!48963 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100316)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503876 (= res!1024670 (not (= (select (arr!48413 a!2850) index!625) (select (arr!48413 a!2850) j!87))))))

(declare-fun b!1503877 () Bool)

(declare-fun res!1024667 () Bool)

(assert (=> b!1503877 (=> (not res!1024667) (not e!840769))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503877 (= res!1024667 (and (= (size!48963 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48963 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48963 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503878 () Bool)

(declare-fun res!1024669 () Bool)

(assert (=> b!1503878 (=> (not res!1024669) (not e!840769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100316 (_ BitVec 32)) Bool)

(assert (=> b!1503878 (= res!1024669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503879 () Bool)

(declare-fun res!1024664 () Bool)

(assert (=> b!1503879 (=> (not res!1024664) (not e!840769))))

(declare-datatypes ((List!34905 0))(
  ( (Nil!34902) (Cons!34901 (h!36298 (_ BitVec 64)) (t!49599 List!34905)) )
))
(declare-fun arrayNoDuplicates!0 (array!100316 (_ BitVec 32) List!34905) Bool)

(assert (=> b!1503879 (= res!1024664 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34902))))

(declare-fun b!1503880 () Bool)

(declare-fun res!1024668 () Bool)

(assert (=> b!1503880 (=> (not res!1024668) (not e!840769))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12611 0))(
  ( (MissingZero!12611 (index!52836 (_ BitVec 32))) (Found!12611 (index!52837 (_ BitVec 32))) (Intermediate!12611 (undefined!13423 Bool) (index!52838 (_ BitVec 32)) (x!134521 (_ BitVec 32))) (Undefined!12611) (MissingVacant!12611 (index!52839 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100316 (_ BitVec 32)) SeekEntryResult!12611)

(assert (=> b!1503880 (= res!1024668 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48413 a!2850) j!87) a!2850 mask!2661) (Found!12611 j!87)))))

(declare-fun res!1024665 () Bool)

(assert (=> start!128040 (=> (not res!1024665) (not e!840769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128040 (= res!1024665 (validMask!0 mask!2661))))

(assert (=> start!128040 e!840769))

(assert (=> start!128040 true))

(declare-fun array_inv!37441 (array!100316) Bool)

(assert (=> start!128040 (array_inv!37441 a!2850)))

(declare-fun b!1503881 () Bool)

(declare-fun res!1024666 () Bool)

(assert (=> b!1503881 (=> (not res!1024666) (not e!840769))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503881 (= res!1024666 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48963 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48963 a!2850)) (= (select (arr!48413 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48413 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48963 a!2850))))))

(declare-fun b!1503882 () Bool)

(assert (=> b!1503882 (= e!840769 false)))

(declare-fun lt!653614 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503882 (= lt!653614 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503883 () Bool)

(declare-fun res!1024672 () Bool)

(assert (=> b!1503883 (=> (not res!1024672) (not e!840769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503883 (= res!1024672 (validKeyInArray!0 (select (arr!48413 a!2850) j!87)))))

(declare-fun b!1503884 () Bool)

(declare-fun res!1024671 () Bool)

(assert (=> b!1503884 (=> (not res!1024671) (not e!840769))))

(assert (=> b!1503884 (= res!1024671 (validKeyInArray!0 (select (arr!48413 a!2850) i!996)))))

(assert (= (and start!128040 res!1024665) b!1503877))

(assert (= (and b!1503877 res!1024667) b!1503884))

(assert (= (and b!1503884 res!1024671) b!1503883))

(assert (= (and b!1503883 res!1024672) b!1503878))

(assert (= (and b!1503878 res!1024669) b!1503879))

(assert (= (and b!1503879 res!1024664) b!1503881))

(assert (= (and b!1503881 res!1024666) b!1503880))

(assert (= (and b!1503880 res!1024668) b!1503876))

(assert (= (and b!1503876 res!1024670) b!1503882))

(declare-fun m!1387075 () Bool)

(assert (=> b!1503876 m!1387075))

(declare-fun m!1387077 () Bool)

(assert (=> b!1503876 m!1387077))

(declare-fun m!1387079 () Bool)

(assert (=> b!1503881 m!1387079))

(declare-fun m!1387081 () Bool)

(assert (=> b!1503881 m!1387081))

(declare-fun m!1387083 () Bool)

(assert (=> b!1503881 m!1387083))

(declare-fun m!1387085 () Bool)

(assert (=> b!1503878 m!1387085))

(assert (=> b!1503880 m!1387077))

(assert (=> b!1503880 m!1387077))

(declare-fun m!1387087 () Bool)

(assert (=> b!1503880 m!1387087))

(assert (=> b!1503883 m!1387077))

(assert (=> b!1503883 m!1387077))

(declare-fun m!1387089 () Bool)

(assert (=> b!1503883 m!1387089))

(declare-fun m!1387091 () Bool)

(assert (=> b!1503882 m!1387091))

(declare-fun m!1387093 () Bool)

(assert (=> b!1503879 m!1387093))

(declare-fun m!1387095 () Bool)

(assert (=> start!128040 m!1387095))

(declare-fun m!1387097 () Bool)

(assert (=> start!128040 m!1387097))

(declare-fun m!1387099 () Bool)

(assert (=> b!1503884 m!1387099))

(assert (=> b!1503884 m!1387099))

(declare-fun m!1387101 () Bool)

(assert (=> b!1503884 m!1387101))

(push 1)

(assert (not b!1503883))

(assert (not b!1503882))

(assert (not b!1503880))

(assert (not b!1503884))

(assert (not b!1503879))

(assert (not start!128040))

(assert (not b!1503878))

(check-sat)

