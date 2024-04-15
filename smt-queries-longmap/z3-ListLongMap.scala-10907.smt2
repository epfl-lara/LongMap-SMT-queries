; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127658 () Bool)

(assert start!127658)

(declare-fun b!1500205 () Bool)

(declare-fun res!1021476 () Bool)

(declare-fun e!839420 () Bool)

(assert (=> b!1500205 (=> (not res!1021476) (not e!839420))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100033 0))(
  ( (array!100034 (arr!48277 (Array (_ BitVec 32) (_ BitVec 64))) (size!48829 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100033)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12508 0))(
  ( (MissingZero!12508 (index!52424 (_ BitVec 32))) (Found!12508 (index!52425 (_ BitVec 32))) (Intermediate!12508 (undefined!13320 Bool) (index!52426 (_ BitVec 32)) (x!134105 (_ BitVec 32))) (Undefined!12508) (MissingVacant!12508 (index!52427 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100033 (_ BitVec 32)) SeekEntryResult!12508)

(assert (=> b!1500205 (= res!1021476 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48277 a!2850) j!87) a!2850 mask!2661) (Found!12508 j!87)))))

(declare-fun b!1500207 () Bool)

(declare-fun res!1021471 () Bool)

(assert (=> b!1500207 (=> (not res!1021471) (not e!839420))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500207 (= res!1021471 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48829 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48829 a!2850)) (= (select (arr!48277 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48277 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48829 a!2850))))))

(declare-fun b!1500208 () Bool)

(declare-fun res!1021472 () Bool)

(assert (=> b!1500208 (=> (not res!1021472) (not e!839420))))

(assert (=> b!1500208 (= res!1021472 (and (= (size!48829 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48829 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48829 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500209 () Bool)

(declare-fun res!1021478 () Bool)

(assert (=> b!1500209 (=> (not res!1021478) (not e!839420))))

(assert (=> b!1500209 (= res!1021478 (not (= (select (arr!48277 a!2850) index!625) (select (arr!48277 a!2850) j!87))))))

(declare-fun b!1500210 () Bool)

(declare-fun res!1021469 () Bool)

(assert (=> b!1500210 (=> (not res!1021469) (not e!839420))))

(declare-datatypes ((List!34847 0))(
  ( (Nil!34844) (Cons!34843 (h!36241 (_ BitVec 64)) (t!49533 List!34847)) )
))
(declare-fun arrayNoDuplicates!0 (array!100033 (_ BitVec 32) List!34847) Bool)

(assert (=> b!1500210 (= res!1021469 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34844))))

(declare-fun b!1500211 () Bool)

(declare-fun res!1021473 () Bool)

(assert (=> b!1500211 (=> (not res!1021473) (not e!839420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100033 (_ BitVec 32)) Bool)

(assert (=> b!1500211 (= res!1021473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500212 () Bool)

(declare-fun e!839421 () Bool)

(assert (=> b!1500212 (= e!839421 false)))

(declare-fun lt!652675 () (_ BitVec 32))

(declare-fun lt!652674 () SeekEntryResult!12508)

(assert (=> b!1500212 (= lt!652674 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652675 vacantBefore!10 (select (arr!48277 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021470 () Bool)

(assert (=> start!127658 (=> (not res!1021470) (not e!839420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127658 (= res!1021470 (validMask!0 mask!2661))))

(assert (=> start!127658 e!839420))

(assert (=> start!127658 true))

(declare-fun array_inv!37510 (array!100033) Bool)

(assert (=> start!127658 (array_inv!37510 a!2850)))

(declare-fun b!1500206 () Bool)

(assert (=> b!1500206 (= e!839420 e!839421)))

(declare-fun res!1021474 () Bool)

(assert (=> b!1500206 (=> (not res!1021474) (not e!839421))))

(assert (=> b!1500206 (= res!1021474 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652675 #b00000000000000000000000000000000) (bvslt lt!652675 (size!48829 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500206 (= lt!652675 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500213 () Bool)

(declare-fun res!1021475 () Bool)

(assert (=> b!1500213 (=> (not res!1021475) (not e!839420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500213 (= res!1021475 (validKeyInArray!0 (select (arr!48277 a!2850) j!87)))))

(declare-fun b!1500214 () Bool)

(declare-fun res!1021477 () Bool)

(assert (=> b!1500214 (=> (not res!1021477) (not e!839420))))

(assert (=> b!1500214 (= res!1021477 (validKeyInArray!0 (select (arr!48277 a!2850) i!996)))))

(assert (= (and start!127658 res!1021470) b!1500208))

(assert (= (and b!1500208 res!1021472) b!1500214))

(assert (= (and b!1500214 res!1021477) b!1500213))

(assert (= (and b!1500213 res!1021475) b!1500211))

(assert (= (and b!1500211 res!1021473) b!1500210))

(assert (= (and b!1500210 res!1021469) b!1500207))

(assert (= (and b!1500207 res!1021471) b!1500205))

(assert (= (and b!1500205 res!1021476) b!1500209))

(assert (= (and b!1500209 res!1021478) b!1500206))

(assert (= (and b!1500206 res!1021474) b!1500212))

(declare-fun m!1382845 () Bool)

(assert (=> b!1500206 m!1382845))

(declare-fun m!1382847 () Bool)

(assert (=> b!1500207 m!1382847))

(declare-fun m!1382849 () Bool)

(assert (=> b!1500207 m!1382849))

(declare-fun m!1382851 () Bool)

(assert (=> b!1500207 m!1382851))

(declare-fun m!1382853 () Bool)

(assert (=> b!1500210 m!1382853))

(declare-fun m!1382855 () Bool)

(assert (=> b!1500211 m!1382855))

(declare-fun m!1382857 () Bool)

(assert (=> b!1500214 m!1382857))

(assert (=> b!1500214 m!1382857))

(declare-fun m!1382859 () Bool)

(assert (=> b!1500214 m!1382859))

(declare-fun m!1382861 () Bool)

(assert (=> start!127658 m!1382861))

(declare-fun m!1382863 () Bool)

(assert (=> start!127658 m!1382863))

(declare-fun m!1382865 () Bool)

(assert (=> b!1500205 m!1382865))

(assert (=> b!1500205 m!1382865))

(declare-fun m!1382867 () Bool)

(assert (=> b!1500205 m!1382867))

(declare-fun m!1382869 () Bool)

(assert (=> b!1500209 m!1382869))

(assert (=> b!1500209 m!1382865))

(assert (=> b!1500212 m!1382865))

(assert (=> b!1500212 m!1382865))

(declare-fun m!1382871 () Bool)

(assert (=> b!1500212 m!1382871))

(assert (=> b!1500213 m!1382865))

(assert (=> b!1500213 m!1382865))

(declare-fun m!1382873 () Bool)

(assert (=> b!1500213 m!1382873))

(check-sat (not b!1500206) (not b!1500213) (not b!1500205) (not b!1500210) (not b!1500211) (not b!1500214) (not start!127658) (not b!1500212))
(check-sat)
