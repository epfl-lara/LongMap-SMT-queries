; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128346 () Bool)

(assert start!128346)

(declare-fun b!1505762 () Bool)

(declare-fun res!1025381 () Bool)

(declare-fun e!841916 () Bool)

(assert (=> b!1505762 (=> (not res!1025381) (not e!841916))))

(declare-datatypes ((array!100436 0))(
  ( (array!100437 (arr!48468 (Array (_ BitVec 32) (_ BitVec 64))) (size!49019 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100436)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1505762 (= res!1025381 (not (= (select (arr!48468 a!2850) index!625) (select (arr!48468 a!2850) j!87))))))

(declare-fun b!1505763 () Bool)

(declare-fun res!1025373 () Bool)

(assert (=> b!1505763 (=> (not res!1025373) (not e!841916))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1505763 (= res!1025373 (and (= (size!49019 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49019 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49019 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505764 () Bool)

(declare-fun res!1025379 () Bool)

(assert (=> b!1505764 (=> (not res!1025379) (not e!841916))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12559 0))(
  ( (MissingZero!12559 (index!52628 (_ BitVec 32))) (Found!12559 (index!52629 (_ BitVec 32))) (Intermediate!12559 (undefined!13371 Bool) (index!52630 (_ BitVec 32)) (x!134506 (_ BitVec 32))) (Undefined!12559) (MissingVacant!12559 (index!52631 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100436 (_ BitVec 32)) SeekEntryResult!12559)

(assert (=> b!1505764 (= res!1025379 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48468 a!2850) j!87) a!2850 mask!2661) (Found!12559 j!87)))))

(declare-fun res!1025377 () Bool)

(assert (=> start!128346 (=> (not res!1025377) (not e!841916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128346 (= res!1025377 (validMask!0 mask!2661))))

(assert (=> start!128346 e!841916))

(assert (=> start!128346 true))

(declare-fun array_inv!37749 (array!100436) Bool)

(assert (=> start!128346 (array_inv!37749 a!2850)))

(declare-fun b!1505765 () Bool)

(declare-fun res!1025380 () Bool)

(assert (=> b!1505765 (=> (not res!1025380) (not e!841916))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505765 (= res!1025380 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49019 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49019 a!2850)) (= (select (arr!48468 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48468 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49019 a!2850))))))

(declare-fun b!1505766 () Bool)

(declare-fun res!1025374 () Bool)

(assert (=> b!1505766 (=> (not res!1025374) (not e!841916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505766 (= res!1025374 (validKeyInArray!0 (select (arr!48468 a!2850) i!996)))))

(declare-fun b!1505767 () Bool)

(declare-fun res!1025376 () Bool)

(assert (=> b!1505767 (=> (not res!1025376) (not e!841916))))

(declare-datatypes ((List!34947 0))(
  ( (Nil!34944) (Cons!34943 (h!36355 (_ BitVec 64)) (t!49633 List!34947)) )
))
(declare-fun arrayNoDuplicates!0 (array!100436 (_ BitVec 32) List!34947) Bool)

(assert (=> b!1505767 (= res!1025376 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34944))))

(declare-fun b!1505768 () Bool)

(declare-fun res!1025375 () Bool)

(assert (=> b!1505768 (=> (not res!1025375) (not e!841916))))

(assert (=> b!1505768 (= res!1025375 (validKeyInArray!0 (select (arr!48468 a!2850) j!87)))))

(declare-fun b!1505769 () Bool)

(declare-fun res!1025378 () Bool)

(assert (=> b!1505769 (=> (not res!1025378) (not e!841916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100436 (_ BitVec 32)) Bool)

(assert (=> b!1505769 (= res!1025378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505770 () Bool)

(assert (=> b!1505770 (= e!841916 false)))

(declare-fun lt!654283 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505770 (= lt!654283 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(assert (= (and start!128346 res!1025377) b!1505763))

(assert (= (and b!1505763 res!1025373) b!1505766))

(assert (= (and b!1505766 res!1025374) b!1505768))

(assert (= (and b!1505768 res!1025375) b!1505769))

(assert (= (and b!1505769 res!1025378) b!1505767))

(assert (= (and b!1505767 res!1025376) b!1505765))

(assert (= (and b!1505765 res!1025380) b!1505764))

(assert (= (and b!1505764 res!1025379) b!1505762))

(assert (= (and b!1505762 res!1025381) b!1505770))

(declare-fun m!1388909 () Bool)

(assert (=> b!1505766 m!1388909))

(assert (=> b!1505766 m!1388909))

(declare-fun m!1388911 () Bool)

(assert (=> b!1505766 m!1388911))

(declare-fun m!1388913 () Bool)

(assert (=> b!1505765 m!1388913))

(declare-fun m!1388915 () Bool)

(assert (=> b!1505765 m!1388915))

(declare-fun m!1388917 () Bool)

(assert (=> b!1505765 m!1388917))

(declare-fun m!1388919 () Bool)

(assert (=> b!1505762 m!1388919))

(declare-fun m!1388921 () Bool)

(assert (=> b!1505762 m!1388921))

(declare-fun m!1388923 () Bool)

(assert (=> b!1505767 m!1388923))

(declare-fun m!1388925 () Bool)

(assert (=> start!128346 m!1388925))

(declare-fun m!1388927 () Bool)

(assert (=> start!128346 m!1388927))

(assert (=> b!1505768 m!1388921))

(assert (=> b!1505768 m!1388921))

(declare-fun m!1388929 () Bool)

(assert (=> b!1505768 m!1388929))

(declare-fun m!1388931 () Bool)

(assert (=> b!1505769 m!1388931))

(assert (=> b!1505764 m!1388921))

(assert (=> b!1505764 m!1388921))

(declare-fun m!1388933 () Bool)

(assert (=> b!1505764 m!1388933))

(declare-fun m!1388935 () Bool)

(assert (=> b!1505770 m!1388935))

(push 1)

(assert (not b!1505764))

(assert (not b!1505766))

(assert (not start!128346))

(assert (not b!1505770))

(assert (not b!1505768))

(assert (not b!1505767))

(assert (not b!1505769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

