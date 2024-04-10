; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128058 () Bool)

(assert start!128058)

(declare-fun b!1504119 () Bool)

(declare-fun res!1024915 () Bool)

(declare-fun e!840823 () Bool)

(assert (=> b!1504119 (=> (not res!1024915) (not e!840823))))

(declare-datatypes ((array!100334 0))(
  ( (array!100335 (arr!48422 (Array (_ BitVec 32) (_ BitVec 64))) (size!48972 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100334)

(declare-datatypes ((List!34914 0))(
  ( (Nil!34911) (Cons!34910 (h!36307 (_ BitVec 64)) (t!49608 List!34914)) )
))
(declare-fun arrayNoDuplicates!0 (array!100334 (_ BitVec 32) List!34914) Bool)

(assert (=> b!1504119 (= res!1024915 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34911))))

(declare-fun b!1504120 () Bool)

(declare-fun res!1024907 () Bool)

(assert (=> b!1504120 (=> (not res!1024907) (not e!840823))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1504120 (= res!1024907 (and (= (size!48972 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48972 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48972 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504121 () Bool)

(declare-fun res!1024911 () Bool)

(assert (=> b!1504121 (=> (not res!1024911) (not e!840823))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1504121 (= res!1024911 (not (= (select (arr!48422 a!2850) index!625) (select (arr!48422 a!2850) j!87))))))

(declare-fun b!1504122 () Bool)

(assert (=> b!1504122 (= e!840823 false)))

(declare-fun lt!653641 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504122 (= lt!653641 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1024914 () Bool)

(assert (=> start!128058 (=> (not res!1024914) (not e!840823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128058 (= res!1024914 (validMask!0 mask!2661))))

(assert (=> start!128058 e!840823))

(assert (=> start!128058 true))

(declare-fun array_inv!37450 (array!100334) Bool)

(assert (=> start!128058 (array_inv!37450 a!2850)))

(declare-fun b!1504123 () Bool)

(declare-fun res!1024912 () Bool)

(assert (=> b!1504123 (=> (not res!1024912) (not e!840823))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504123 (= res!1024912 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48972 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48972 a!2850)) (= (select (arr!48422 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48422 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48972 a!2850))))))

(declare-fun b!1504124 () Bool)

(declare-fun res!1024908 () Bool)

(assert (=> b!1504124 (=> (not res!1024908) (not e!840823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504124 (= res!1024908 (validKeyInArray!0 (select (arr!48422 a!2850) j!87)))))

(declare-fun b!1504125 () Bool)

(declare-fun res!1024909 () Bool)

(assert (=> b!1504125 (=> (not res!1024909) (not e!840823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100334 (_ BitVec 32)) Bool)

(assert (=> b!1504125 (= res!1024909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504126 () Bool)

(declare-fun res!1024913 () Bool)

(assert (=> b!1504126 (=> (not res!1024913) (not e!840823))))

(assert (=> b!1504126 (= res!1024913 (validKeyInArray!0 (select (arr!48422 a!2850) i!996)))))

(declare-fun b!1504127 () Bool)

(declare-fun res!1024910 () Bool)

(assert (=> b!1504127 (=> (not res!1024910) (not e!840823))))

(declare-datatypes ((SeekEntryResult!12620 0))(
  ( (MissingZero!12620 (index!52872 (_ BitVec 32))) (Found!12620 (index!52873 (_ BitVec 32))) (Intermediate!12620 (undefined!13432 Bool) (index!52874 (_ BitVec 32)) (x!134554 (_ BitVec 32))) (Undefined!12620) (MissingVacant!12620 (index!52875 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100334 (_ BitVec 32)) SeekEntryResult!12620)

(assert (=> b!1504127 (= res!1024910 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48422 a!2850) j!87) a!2850 mask!2661) (Found!12620 j!87)))))

(assert (= (and start!128058 res!1024914) b!1504120))

(assert (= (and b!1504120 res!1024907) b!1504126))

(assert (= (and b!1504126 res!1024913) b!1504124))

(assert (= (and b!1504124 res!1024908) b!1504125))

(assert (= (and b!1504125 res!1024909) b!1504119))

(assert (= (and b!1504119 res!1024915) b!1504123))

(assert (= (and b!1504123 res!1024912) b!1504127))

(assert (= (and b!1504127 res!1024910) b!1504121))

(assert (= (and b!1504121 res!1024911) b!1504122))

(declare-fun m!1387327 () Bool)

(assert (=> b!1504123 m!1387327))

(declare-fun m!1387329 () Bool)

(assert (=> b!1504123 m!1387329))

(declare-fun m!1387331 () Bool)

(assert (=> b!1504123 m!1387331))

(declare-fun m!1387333 () Bool)

(assert (=> start!128058 m!1387333))

(declare-fun m!1387335 () Bool)

(assert (=> start!128058 m!1387335))

(declare-fun m!1387337 () Bool)

(assert (=> b!1504126 m!1387337))

(assert (=> b!1504126 m!1387337))

(declare-fun m!1387339 () Bool)

(assert (=> b!1504126 m!1387339))

(declare-fun m!1387341 () Bool)

(assert (=> b!1504119 m!1387341))

(declare-fun m!1387343 () Bool)

(assert (=> b!1504122 m!1387343))

(declare-fun m!1387345 () Bool)

(assert (=> b!1504125 m!1387345))

(declare-fun m!1387347 () Bool)

(assert (=> b!1504124 m!1387347))

(assert (=> b!1504124 m!1387347))

(declare-fun m!1387349 () Bool)

(assert (=> b!1504124 m!1387349))

(assert (=> b!1504127 m!1387347))

(assert (=> b!1504127 m!1387347))

(declare-fun m!1387351 () Bool)

(assert (=> b!1504127 m!1387351))

(declare-fun m!1387353 () Bool)

(assert (=> b!1504121 m!1387353))

(assert (=> b!1504121 m!1387347))

(push 1)

(assert (not b!1504119))

(assert (not b!1504126))

(assert (not b!1504125))

(assert (not b!1504122))

(assert (not start!128058))

(assert (not b!1504124))

(assert (not b!1504127))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

