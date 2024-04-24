; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128248 () Bool)

(assert start!128248)

(declare-fun b!1504871 () Bool)

(declare-fun res!1024580 () Bool)

(declare-fun e!841658 () Bool)

(assert (=> b!1504871 (=> (not res!1024580) (not e!841658))))

(declare-datatypes ((array!100377 0))(
  ( (array!100378 (arr!48440 (Array (_ BitVec 32) (_ BitVec 64))) (size!48991 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100377)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504871 (= res!1024580 (validKeyInArray!0 (select (arr!48440 a!2850) i!996)))))

(declare-fun b!1504872 () Bool)

(declare-fun res!1024573 () Bool)

(assert (=> b!1504872 (=> (not res!1024573) (not e!841658))))

(declare-datatypes ((List!34919 0))(
  ( (Nil!34916) (Cons!34915 (h!36327 (_ BitVec 64)) (t!49605 List!34919)) )
))
(declare-fun arrayNoDuplicates!0 (array!100377 (_ BitVec 32) List!34919) Bool)

(assert (=> b!1504872 (= res!1024573 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34916))))

(declare-fun res!1024579 () Bool)

(assert (=> start!128248 (=> (not res!1024579) (not e!841658))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128248 (= res!1024579 (validMask!0 mask!2661))))

(assert (=> start!128248 e!841658))

(assert (=> start!128248 true))

(declare-fun array_inv!37721 (array!100377) Bool)

(assert (=> start!128248 (array_inv!37721 a!2850)))

(declare-fun b!1504873 () Bool)

(declare-fun res!1024572 () Bool)

(assert (=> b!1504873 (=> (not res!1024572) (not e!841658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100377 (_ BitVec 32)) Bool)

(assert (=> b!1504873 (= res!1024572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504874 () Bool)

(declare-fun res!1024577 () Bool)

(assert (=> b!1504874 (=> (not res!1024577) (not e!841658))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504874 (= res!1024577 (validKeyInArray!0 (select (arr!48440 a!2850) j!87)))))

(declare-fun b!1504875 () Bool)

(declare-fun res!1024576 () Bool)

(assert (=> b!1504875 (=> (not res!1024576) (not e!841658))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1504875 (= res!1024576 (not (= (select (arr!48440 a!2850) index!625) (select (arr!48440 a!2850) j!87))))))

(declare-fun b!1504876 () Bool)

(declare-fun res!1024575 () Bool)

(assert (=> b!1504876 (=> (not res!1024575) (not e!841658))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504876 (= res!1024575 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48991 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48991 a!2850)) (= (select (arr!48440 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48440 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48991 a!2850))))))

(declare-fun b!1504877 () Bool)

(declare-fun res!1024574 () Bool)

(assert (=> b!1504877 (=> (not res!1024574) (not e!841658))))

(declare-datatypes ((SeekEntryResult!12531 0))(
  ( (MissingZero!12531 (index!52516 (_ BitVec 32))) (Found!12531 (index!52517 (_ BitVec 32))) (Intermediate!12531 (undefined!13343 Bool) (index!52518 (_ BitVec 32)) (x!134400 (_ BitVec 32))) (Undefined!12531) (MissingVacant!12531 (index!52519 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100377 (_ BitVec 32)) SeekEntryResult!12531)

(assert (=> b!1504877 (= res!1024574 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48440 a!2850) j!87) a!2850 mask!2661) (Found!12531 j!87)))))

(declare-fun b!1504878 () Bool)

(declare-fun res!1024578 () Bool)

(assert (=> b!1504878 (=> (not res!1024578) (not e!841658))))

(assert (=> b!1504878 (= res!1024578 (and (= (size!48991 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48991 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48991 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504879 () Bool)

(assert (=> b!1504879 (= e!841658 false)))

(declare-fun lt!654145 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504879 (= lt!654145 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(assert (= (and start!128248 res!1024579) b!1504878))

(assert (= (and b!1504878 res!1024578) b!1504871))

(assert (= (and b!1504871 res!1024580) b!1504874))

(assert (= (and b!1504874 res!1024577) b!1504873))

(assert (= (and b!1504873 res!1024572) b!1504872))

(assert (= (and b!1504872 res!1024573) b!1504876))

(assert (= (and b!1504876 res!1024575) b!1504877))

(assert (= (and b!1504877 res!1024574) b!1504875))

(assert (= (and b!1504875 res!1024576) b!1504879))

(declare-fun m!1388047 () Bool)

(assert (=> b!1504876 m!1388047))

(declare-fun m!1388049 () Bool)

(assert (=> b!1504876 m!1388049))

(declare-fun m!1388051 () Bool)

(assert (=> b!1504876 m!1388051))

(declare-fun m!1388053 () Bool)

(assert (=> b!1504875 m!1388053))

(declare-fun m!1388055 () Bool)

(assert (=> b!1504875 m!1388055))

(declare-fun m!1388057 () Bool)

(assert (=> b!1504872 m!1388057))

(declare-fun m!1388059 () Bool)

(assert (=> start!128248 m!1388059))

(declare-fun m!1388061 () Bool)

(assert (=> start!128248 m!1388061))

(declare-fun m!1388063 () Bool)

(assert (=> b!1504871 m!1388063))

(assert (=> b!1504871 m!1388063))

(declare-fun m!1388065 () Bool)

(assert (=> b!1504871 m!1388065))

(assert (=> b!1504877 m!1388055))

(assert (=> b!1504877 m!1388055))

(declare-fun m!1388067 () Bool)

(assert (=> b!1504877 m!1388067))

(declare-fun m!1388069 () Bool)

(assert (=> b!1504879 m!1388069))

(declare-fun m!1388071 () Bool)

(assert (=> b!1504873 m!1388071))

(assert (=> b!1504874 m!1388055))

(assert (=> b!1504874 m!1388055))

(declare-fun m!1388073 () Bool)

(assert (=> b!1504874 m!1388073))

(push 1)

(assert (not b!1504877))

(assert (not b!1504873))

(assert (not b!1504874))

(assert (not b!1504871))

(assert (not b!1504872))

(assert (not start!128248))

(assert (not b!1504879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

