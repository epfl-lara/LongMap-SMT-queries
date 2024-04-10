; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127930 () Bool)

(assert start!127930)

(declare-fun b!1502824 () Bool)

(declare-fun res!1023703 () Bool)

(declare-fun e!840474 () Bool)

(assert (=> b!1502824 (=> (not res!1023703) (not e!840474))))

(declare-datatypes ((array!100245 0))(
  ( (array!100246 (arr!48379 (Array (_ BitVec 32) (_ BitVec 64))) (size!48929 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100245)

(declare-datatypes ((List!34871 0))(
  ( (Nil!34868) (Cons!34867 (h!36264 (_ BitVec 64)) (t!49565 List!34871)) )
))
(declare-fun arrayNoDuplicates!0 (array!100245 (_ BitVec 32) List!34871) Bool)

(assert (=> b!1502824 (= res!1023703 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34868))))

(declare-fun b!1502825 () Bool)

(declare-fun res!1023701 () Bool)

(assert (=> b!1502825 (=> (not res!1023701) (not e!840474))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100245 (_ BitVec 32)) Bool)

(assert (=> b!1502825 (= res!1023701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502826 () Bool)

(declare-fun res!1023705 () Bool)

(assert (=> b!1502826 (=> (not res!1023705) (not e!840474))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502826 (= res!1023705 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48929 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48929 a!2850)) (= (select (arr!48379 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48379 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48929 a!2850))))))

(declare-fun b!1502827 () Bool)

(declare-fun res!1023704 () Bool)

(assert (=> b!1502827 (=> (not res!1023704) (not e!840474))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502827 (= res!1023704 (validKeyInArray!0 (select (arr!48379 a!2850) j!87)))))

(declare-fun b!1502828 () Bool)

(assert (=> b!1502828 (= e!840474 false)))

(declare-fun lt!653458 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502828 (= lt!653458 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502829 () Bool)

(declare-fun res!1023707 () Bool)

(assert (=> b!1502829 (=> (not res!1023707) (not e!840474))))

(assert (=> b!1502829 (= res!1023707 (validKeyInArray!0 (select (arr!48379 a!2850) i!996)))))

(declare-fun b!1502823 () Bool)

(declare-fun res!1023706 () Bool)

(assert (=> b!1502823 (=> (not res!1023706) (not e!840474))))

(assert (=> b!1502823 (= res!1023706 (not (= (select (arr!48379 a!2850) index!625) (select (arr!48379 a!2850) j!87))))))

(declare-fun res!1023709 () Bool)

(assert (=> start!127930 (=> (not res!1023709) (not e!840474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127930 (= res!1023709 (validMask!0 mask!2661))))

(assert (=> start!127930 e!840474))

(assert (=> start!127930 true))

(declare-fun array_inv!37407 (array!100245) Bool)

(assert (=> start!127930 (array_inv!37407 a!2850)))

(declare-fun b!1502830 () Bool)

(declare-fun res!1023708 () Bool)

(assert (=> b!1502830 (=> (not res!1023708) (not e!840474))))

(assert (=> b!1502830 (= res!1023708 (and (= (size!48929 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48929 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48929 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502831 () Bool)

(declare-fun res!1023702 () Bool)

(assert (=> b!1502831 (=> (not res!1023702) (not e!840474))))

(declare-datatypes ((SeekEntryResult!12577 0))(
  ( (MissingZero!12577 (index!52700 (_ BitVec 32))) (Found!12577 (index!52701 (_ BitVec 32))) (Intermediate!12577 (undefined!13389 Bool) (index!52702 (_ BitVec 32)) (x!134385 (_ BitVec 32))) (Undefined!12577) (MissingVacant!12577 (index!52703 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100245 (_ BitVec 32)) SeekEntryResult!12577)

(assert (=> b!1502831 (= res!1023702 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48379 a!2850) j!87) a!2850 mask!2661) (Found!12577 j!87)))))

(assert (= (and start!127930 res!1023709) b!1502830))

(assert (= (and b!1502830 res!1023708) b!1502829))

(assert (= (and b!1502829 res!1023707) b!1502827))

(assert (= (and b!1502827 res!1023704) b!1502825))

(assert (= (and b!1502825 res!1023701) b!1502824))

(assert (= (and b!1502824 res!1023703) b!1502826))

(assert (= (and b!1502826 res!1023705) b!1502831))

(assert (= (and b!1502831 res!1023702) b!1502823))

(assert (= (and b!1502823 res!1023706) b!1502828))

(declare-fun m!1386051 () Bool)

(assert (=> b!1502823 m!1386051))

(declare-fun m!1386053 () Bool)

(assert (=> b!1502823 m!1386053))

(assert (=> b!1502827 m!1386053))

(assert (=> b!1502827 m!1386053))

(declare-fun m!1386055 () Bool)

(assert (=> b!1502827 m!1386055))

(declare-fun m!1386057 () Bool)

(assert (=> b!1502824 m!1386057))

(declare-fun m!1386059 () Bool)

(assert (=> b!1502826 m!1386059))

(declare-fun m!1386061 () Bool)

(assert (=> b!1502826 m!1386061))

(declare-fun m!1386063 () Bool)

(assert (=> b!1502826 m!1386063))

(declare-fun m!1386065 () Bool)

(assert (=> b!1502828 m!1386065))

(declare-fun m!1386067 () Bool)

(assert (=> b!1502825 m!1386067))

(declare-fun m!1386069 () Bool)

(assert (=> b!1502829 m!1386069))

(assert (=> b!1502829 m!1386069))

(declare-fun m!1386071 () Bool)

(assert (=> b!1502829 m!1386071))

(assert (=> b!1502831 m!1386053))

(assert (=> b!1502831 m!1386053))

(declare-fun m!1386073 () Bool)

(assert (=> b!1502831 m!1386073))

(declare-fun m!1386075 () Bool)

(assert (=> start!127930 m!1386075))

(declare-fun m!1386077 () Bool)

(assert (=> start!127930 m!1386077))

(push 1)

(assert (not b!1502824))

(assert (not b!1502828))

(assert (not start!127930))

(assert (not b!1502825))

(assert (not b!1502827))

(assert (not b!1502829))

(assert (not b!1502831))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

