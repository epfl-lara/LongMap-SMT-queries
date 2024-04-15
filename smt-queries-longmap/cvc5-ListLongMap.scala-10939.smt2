; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127926 () Bool)

(assert start!127926)

(declare-fun b!1503074 () Bool)

(declare-fun res!1024148 () Bool)

(declare-fun e!840402 () Bool)

(assert (=> b!1503074 (=> (not res!1024148) (not e!840402))))

(declare-datatypes ((array!100235 0))(
  ( (array!100236 (arr!48375 (Array (_ BitVec 32) (_ BitVec 64))) (size!48927 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100235)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503074 (= res!1024148 (validKeyInArray!0 (select (arr!48375 a!2850) i!996)))))

(declare-fun b!1503075 () Bool)

(declare-fun res!1024141 () Bool)

(assert (=> b!1503075 (=> (not res!1024141) (not e!840402))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12594 0))(
  ( (MissingZero!12594 (index!52768 (_ BitVec 32))) (Found!12594 (index!52769 (_ BitVec 32))) (Intermediate!12594 (undefined!13406 Bool) (index!52770 (_ BitVec 32)) (x!134453 (_ BitVec 32))) (Undefined!12594) (MissingVacant!12594 (index!52771 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100235 (_ BitVec 32)) SeekEntryResult!12594)

(assert (=> b!1503075 (= res!1024141 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48375 a!2850) j!87) a!2850 mask!2661) (Found!12594 j!87)))))

(declare-fun b!1503076 () Bool)

(declare-fun res!1024146 () Bool)

(assert (=> b!1503076 (=> (not res!1024146) (not e!840402))))

(assert (=> b!1503076 (= res!1024146 (not (= (select (arr!48375 a!2850) index!625) (select (arr!48375 a!2850) j!87))))))

(declare-fun b!1503077 () Bool)

(declare-fun res!1024144 () Bool)

(assert (=> b!1503077 (=> (not res!1024144) (not e!840402))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503077 (= res!1024144 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48927 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48927 a!2850)) (= (select (arr!48375 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48927 a!2850))))))

(declare-fun res!1024140 () Bool)

(assert (=> start!127926 (=> (not res!1024140) (not e!840402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127926 (= res!1024140 (validMask!0 mask!2661))))

(assert (=> start!127926 e!840402))

(assert (=> start!127926 true))

(declare-fun array_inv!37608 (array!100235) Bool)

(assert (=> start!127926 (array_inv!37608 a!2850)))

(declare-fun b!1503078 () Bool)

(declare-fun res!1024145 () Bool)

(assert (=> b!1503078 (=> (not res!1024145) (not e!840402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100235 (_ BitVec 32)) Bool)

(assert (=> b!1503078 (= res!1024145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503079 () Bool)

(assert (=> b!1503079 (= e!840402 false)))

(declare-fun lt!653242 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503079 (= lt!653242 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503080 () Bool)

(declare-fun res!1024143 () Bool)

(assert (=> b!1503080 (=> (not res!1024143) (not e!840402))))

(declare-datatypes ((List!34945 0))(
  ( (Nil!34942) (Cons!34941 (h!36339 (_ BitVec 64)) (t!49631 List!34945)) )
))
(declare-fun arrayNoDuplicates!0 (array!100235 (_ BitVec 32) List!34945) Bool)

(assert (=> b!1503080 (= res!1024143 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34942))))

(declare-fun b!1503081 () Bool)

(declare-fun res!1024147 () Bool)

(assert (=> b!1503081 (=> (not res!1024147) (not e!840402))))

(assert (=> b!1503081 (= res!1024147 (validKeyInArray!0 (select (arr!48375 a!2850) j!87)))))

(declare-fun b!1503082 () Bool)

(declare-fun res!1024142 () Bool)

(assert (=> b!1503082 (=> (not res!1024142) (not e!840402))))

(assert (=> b!1503082 (= res!1024142 (and (= (size!48927 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48927 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48927 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127926 res!1024140) b!1503082))

(assert (= (and b!1503082 res!1024142) b!1503074))

(assert (= (and b!1503074 res!1024148) b!1503081))

(assert (= (and b!1503081 res!1024147) b!1503078))

(assert (= (and b!1503078 res!1024145) b!1503080))

(assert (= (and b!1503080 res!1024143) b!1503077))

(assert (= (and b!1503077 res!1024144) b!1503075))

(assert (= (and b!1503075 res!1024141) b!1503076))

(assert (= (and b!1503076 res!1024146) b!1503079))

(declare-fun m!1385769 () Bool)

(assert (=> start!127926 m!1385769))

(declare-fun m!1385771 () Bool)

(assert (=> start!127926 m!1385771))

(declare-fun m!1385773 () Bool)

(assert (=> b!1503076 m!1385773))

(declare-fun m!1385775 () Bool)

(assert (=> b!1503076 m!1385775))

(declare-fun m!1385777 () Bool)

(assert (=> b!1503074 m!1385777))

(assert (=> b!1503074 m!1385777))

(declare-fun m!1385779 () Bool)

(assert (=> b!1503074 m!1385779))

(assert (=> b!1503081 m!1385775))

(assert (=> b!1503081 m!1385775))

(declare-fun m!1385781 () Bool)

(assert (=> b!1503081 m!1385781))

(declare-fun m!1385783 () Bool)

(assert (=> b!1503078 m!1385783))

(declare-fun m!1385785 () Bool)

(assert (=> b!1503080 m!1385785))

(declare-fun m!1385787 () Bool)

(assert (=> b!1503079 m!1385787))

(assert (=> b!1503075 m!1385775))

(assert (=> b!1503075 m!1385775))

(declare-fun m!1385789 () Bool)

(assert (=> b!1503075 m!1385789))

(declare-fun m!1385791 () Bool)

(assert (=> b!1503077 m!1385791))

(declare-fun m!1385793 () Bool)

(assert (=> b!1503077 m!1385793))

(declare-fun m!1385795 () Bool)

(assert (=> b!1503077 m!1385795))

(push 1)

(assert (not b!1503080))

(assert (not start!127926))

(assert (not b!1503075))

(assert (not b!1503078))

(assert (not b!1503074))

(assert (not b!1503079))

(assert (not b!1503081))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

