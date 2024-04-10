; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127936 () Bool)

(assert start!127936)

(declare-fun b!1502904 () Bool)

(declare-fun res!1023787 () Bool)

(declare-fun e!840493 () Bool)

(assert (=> b!1502904 (=> (not res!1023787) (not e!840493))))

(declare-datatypes ((array!100251 0))(
  ( (array!100252 (arr!48382 (Array (_ BitVec 32) (_ BitVec 64))) (size!48932 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100251)

(declare-datatypes ((List!34874 0))(
  ( (Nil!34871) (Cons!34870 (h!36267 (_ BitVec 64)) (t!49568 List!34874)) )
))
(declare-fun arrayNoDuplicates!0 (array!100251 (_ BitVec 32) List!34874) Bool)

(assert (=> b!1502904 (= res!1023787 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34871))))

(declare-fun b!1502905 () Bool)

(declare-fun res!1023786 () Bool)

(assert (=> b!1502905 (=> (not res!1023786) (not e!840493))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502905 (= res!1023786 (and (= (size!48932 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48932 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48932 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1023789 () Bool)

(assert (=> start!127936 (=> (not res!1023789) (not e!840493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127936 (= res!1023789 (validMask!0 mask!2661))))

(assert (=> start!127936 e!840493))

(assert (=> start!127936 true))

(declare-fun array_inv!37410 (array!100251) Bool)

(assert (=> start!127936 (array_inv!37410 a!2850)))

(declare-fun b!1502906 () Bool)

(declare-fun res!1023783 () Bool)

(assert (=> b!1502906 (=> (not res!1023783) (not e!840493))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1502906 (= res!1023783 (not (= (select (arr!48382 a!2850) index!625) (select (arr!48382 a!2850) j!87))))))

(declare-fun b!1502907 () Bool)

(declare-fun res!1023785 () Bool)

(assert (=> b!1502907 (=> (not res!1023785) (not e!840493))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502907 (= res!1023785 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48932 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48932 a!2850)) (= (select (arr!48382 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48382 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48932 a!2850))))))

(declare-fun b!1502908 () Bool)

(declare-fun res!1023782 () Bool)

(assert (=> b!1502908 (=> (not res!1023782) (not e!840493))))

(declare-datatypes ((SeekEntryResult!12580 0))(
  ( (MissingZero!12580 (index!52712 (_ BitVec 32))) (Found!12580 (index!52713 (_ BitVec 32))) (Intermediate!12580 (undefined!13392 Bool) (index!52714 (_ BitVec 32)) (x!134396 (_ BitVec 32))) (Undefined!12580) (MissingVacant!12580 (index!52715 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100251 (_ BitVec 32)) SeekEntryResult!12580)

(assert (=> b!1502908 (= res!1023782 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48382 a!2850) j!87) a!2850 mask!2661) (Found!12580 j!87)))))

(declare-fun b!1502909 () Bool)

(assert (=> b!1502909 (= e!840493 false)))

(declare-fun lt!653467 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502909 (= lt!653467 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502910 () Bool)

(declare-fun res!1023790 () Bool)

(assert (=> b!1502910 (=> (not res!1023790) (not e!840493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100251 (_ BitVec 32)) Bool)

(assert (=> b!1502910 (= res!1023790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502911 () Bool)

(declare-fun res!1023788 () Bool)

(assert (=> b!1502911 (=> (not res!1023788) (not e!840493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502911 (= res!1023788 (validKeyInArray!0 (select (arr!48382 a!2850) i!996)))))

(declare-fun b!1502912 () Bool)

(declare-fun res!1023784 () Bool)

(assert (=> b!1502912 (=> (not res!1023784) (not e!840493))))

(assert (=> b!1502912 (= res!1023784 (validKeyInArray!0 (select (arr!48382 a!2850) j!87)))))

(assert (= (and start!127936 res!1023789) b!1502905))

(assert (= (and b!1502905 res!1023786) b!1502911))

(assert (= (and b!1502911 res!1023788) b!1502912))

(assert (= (and b!1502912 res!1023784) b!1502910))

(assert (= (and b!1502910 res!1023790) b!1502904))

(assert (= (and b!1502904 res!1023787) b!1502907))

(assert (= (and b!1502907 res!1023785) b!1502908))

(assert (= (and b!1502908 res!1023782) b!1502906))

(assert (= (and b!1502906 res!1023783) b!1502909))

(declare-fun m!1386135 () Bool)

(assert (=> b!1502911 m!1386135))

(assert (=> b!1502911 m!1386135))

(declare-fun m!1386137 () Bool)

(assert (=> b!1502911 m!1386137))

(declare-fun m!1386139 () Bool)

(assert (=> b!1502909 m!1386139))

(declare-fun m!1386141 () Bool)

(assert (=> b!1502912 m!1386141))

(assert (=> b!1502912 m!1386141))

(declare-fun m!1386143 () Bool)

(assert (=> b!1502912 m!1386143))

(declare-fun m!1386145 () Bool)

(assert (=> start!127936 m!1386145))

(declare-fun m!1386147 () Bool)

(assert (=> start!127936 m!1386147))

(declare-fun m!1386149 () Bool)

(assert (=> b!1502910 m!1386149))

(assert (=> b!1502908 m!1386141))

(assert (=> b!1502908 m!1386141))

(declare-fun m!1386151 () Bool)

(assert (=> b!1502908 m!1386151))

(declare-fun m!1386153 () Bool)

(assert (=> b!1502906 m!1386153))

(assert (=> b!1502906 m!1386141))

(declare-fun m!1386155 () Bool)

(assert (=> b!1502907 m!1386155))

(declare-fun m!1386157 () Bool)

(assert (=> b!1502907 m!1386157))

(declare-fun m!1386159 () Bool)

(assert (=> b!1502907 m!1386159))

(declare-fun m!1386161 () Bool)

(assert (=> b!1502904 m!1386161))

(push 1)

(assert (not start!127936))

(assert (not b!1502911))

(assert (not b!1502912))

(assert (not b!1502909))

(assert (not b!1502910))

(assert (not b!1502904))

(assert (not b!1502908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

