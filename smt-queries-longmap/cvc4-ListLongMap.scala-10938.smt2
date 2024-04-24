; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128266 () Bool)

(assert start!128266)

(declare-fun b!1505114 () Bool)

(declare-fun res!1024818 () Bool)

(declare-fun e!841713 () Bool)

(assert (=> b!1505114 (=> (not res!1024818) (not e!841713))))

(declare-datatypes ((array!100395 0))(
  ( (array!100396 (arr!48449 (Array (_ BitVec 32) (_ BitVec 64))) (size!49000 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100395)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505114 (= res!1024818 (validKeyInArray!0 (select (arr!48449 a!2850) i!996)))))

(declare-fun res!1024823 () Bool)

(assert (=> start!128266 (=> (not res!1024823) (not e!841713))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128266 (= res!1024823 (validMask!0 mask!2661))))

(assert (=> start!128266 e!841713))

(assert (=> start!128266 true))

(declare-fun array_inv!37730 (array!100395) Bool)

(assert (=> start!128266 (array_inv!37730 a!2850)))

(declare-fun b!1505115 () Bool)

(declare-fun res!1024821 () Bool)

(assert (=> b!1505115 (=> (not res!1024821) (not e!841713))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1505115 (= res!1024821 (and (= (size!49000 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49000 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49000 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505116 () Bool)

(assert (=> b!1505116 (= e!841713 false)))

(declare-fun lt!654172 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505116 (= lt!654172 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505117 () Bool)

(declare-fun res!1024817 () Bool)

(assert (=> b!1505117 (=> (not res!1024817) (not e!841713))))

(assert (=> b!1505117 (= res!1024817 (not (= (select (arr!48449 a!2850) index!625) (select (arr!48449 a!2850) j!87))))))

(declare-fun b!1505118 () Bool)

(declare-fun res!1024822 () Bool)

(assert (=> b!1505118 (=> (not res!1024822) (not e!841713))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12540 0))(
  ( (MissingZero!12540 (index!52552 (_ BitVec 32))) (Found!12540 (index!52553 (_ BitVec 32))) (Intermediate!12540 (undefined!13352 Bool) (index!52554 (_ BitVec 32)) (x!134433 (_ BitVec 32))) (Undefined!12540) (MissingVacant!12540 (index!52555 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100395 (_ BitVec 32)) SeekEntryResult!12540)

(assert (=> b!1505118 (= res!1024822 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48449 a!2850) j!87) a!2850 mask!2661) (Found!12540 j!87)))))

(declare-fun b!1505119 () Bool)

(declare-fun res!1024820 () Bool)

(assert (=> b!1505119 (=> (not res!1024820) (not e!841713))))

(assert (=> b!1505119 (= res!1024820 (validKeyInArray!0 (select (arr!48449 a!2850) j!87)))))

(declare-fun b!1505120 () Bool)

(declare-fun res!1024819 () Bool)

(assert (=> b!1505120 (=> (not res!1024819) (not e!841713))))

(declare-datatypes ((List!34928 0))(
  ( (Nil!34925) (Cons!34924 (h!36336 (_ BitVec 64)) (t!49614 List!34928)) )
))
(declare-fun arrayNoDuplicates!0 (array!100395 (_ BitVec 32) List!34928) Bool)

(assert (=> b!1505120 (= res!1024819 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34925))))

(declare-fun b!1505121 () Bool)

(declare-fun res!1024815 () Bool)

(assert (=> b!1505121 (=> (not res!1024815) (not e!841713))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505121 (= res!1024815 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49000 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49000 a!2850)) (= (select (arr!48449 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48449 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49000 a!2850))))))

(declare-fun b!1505122 () Bool)

(declare-fun res!1024816 () Bool)

(assert (=> b!1505122 (=> (not res!1024816) (not e!841713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100395 (_ BitVec 32)) Bool)

(assert (=> b!1505122 (= res!1024816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128266 res!1024823) b!1505115))

(assert (= (and b!1505115 res!1024821) b!1505114))

(assert (= (and b!1505114 res!1024818) b!1505119))

(assert (= (and b!1505119 res!1024820) b!1505122))

(assert (= (and b!1505122 res!1024816) b!1505120))

(assert (= (and b!1505120 res!1024819) b!1505121))

(assert (= (and b!1505121 res!1024815) b!1505118))

(assert (= (and b!1505118 res!1024822) b!1505117))

(assert (= (and b!1505117 res!1024817) b!1505116))

(declare-fun m!1388299 () Bool)

(assert (=> start!128266 m!1388299))

(declare-fun m!1388301 () Bool)

(assert (=> start!128266 m!1388301))

(declare-fun m!1388303 () Bool)

(assert (=> b!1505117 m!1388303))

(declare-fun m!1388305 () Bool)

(assert (=> b!1505117 m!1388305))

(declare-fun m!1388307 () Bool)

(assert (=> b!1505116 m!1388307))

(assert (=> b!1505119 m!1388305))

(assert (=> b!1505119 m!1388305))

(declare-fun m!1388309 () Bool)

(assert (=> b!1505119 m!1388309))

(declare-fun m!1388311 () Bool)

(assert (=> b!1505121 m!1388311))

(declare-fun m!1388313 () Bool)

(assert (=> b!1505121 m!1388313))

(declare-fun m!1388315 () Bool)

(assert (=> b!1505121 m!1388315))

(declare-fun m!1388317 () Bool)

(assert (=> b!1505114 m!1388317))

(assert (=> b!1505114 m!1388317))

(declare-fun m!1388319 () Bool)

(assert (=> b!1505114 m!1388319))

(declare-fun m!1388321 () Bool)

(assert (=> b!1505122 m!1388321))

(assert (=> b!1505118 m!1388305))

(assert (=> b!1505118 m!1388305))

(declare-fun m!1388323 () Bool)

(assert (=> b!1505118 m!1388323))

(declare-fun m!1388325 () Bool)

(assert (=> b!1505120 m!1388325))

(push 1)

(assert (not b!1505119))

(assert (not b!1505120))

(assert (not start!128266))

(assert (not b!1505114))

(assert (not b!1505122))

(assert (not b!1505118))

(assert (not b!1505116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

