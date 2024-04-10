; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127732 () Bool)

(assert start!127732)

(declare-fun b!1500941 () Bool)

(declare-fun res!1022020 () Bool)

(declare-fun e!839745 () Bool)

(assert (=> b!1500941 (=> (not res!1022020) (not e!839745))))

(declare-datatypes ((array!100113 0))(
  ( (array!100114 (arr!48316 (Array (_ BitVec 32) (_ BitVec 64))) (size!48866 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100113)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500941 (= res!1022020 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48866 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48866 a!2850)) (= (select (arr!48316 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48316 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48866 a!2850))))))

(declare-fun res!1022018 () Bool)

(assert (=> start!127732 (=> (not res!1022018) (not e!839745))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127732 (= res!1022018 (validMask!0 mask!2661))))

(assert (=> start!127732 e!839745))

(assert (=> start!127732 true))

(declare-fun array_inv!37344 (array!100113) Bool)

(assert (=> start!127732 (array_inv!37344 a!2850)))

(declare-fun b!1500942 () Bool)

(declare-fun e!839744 () Bool)

(assert (=> b!1500942 (= e!839744 false)))

(declare-datatypes ((SeekEntryResult!12526 0))(
  ( (MissingZero!12526 (index!52496 (_ BitVec 32))) (Found!12526 (index!52497 (_ BitVec 32))) (Intermediate!12526 (undefined!13338 Bool) (index!52498 (_ BitVec 32)) (x!134160 (_ BitVec 32))) (Undefined!12526) (MissingVacant!12526 (index!52499 (_ BitVec 32))) )
))
(declare-fun lt!653037 () SeekEntryResult!12526)

(declare-fun lt!653038 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100113 (_ BitVec 32)) SeekEntryResult!12526)

(assert (=> b!1500942 (= lt!653037 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653038 vacantBefore!10 (select (arr!48316 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500943 () Bool)

(declare-fun res!1022019 () Bool)

(assert (=> b!1500943 (=> (not res!1022019) (not e!839745))))

(declare-datatypes ((List!34808 0))(
  ( (Nil!34805) (Cons!34804 (h!36201 (_ BitVec 64)) (t!49502 List!34808)) )
))
(declare-fun arrayNoDuplicates!0 (array!100113 (_ BitVec 32) List!34808) Bool)

(assert (=> b!1500943 (= res!1022019 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34805))))

(declare-fun b!1500944 () Bool)

(declare-fun res!1022026 () Bool)

(assert (=> b!1500944 (=> (not res!1022026) (not e!839745))))

(assert (=> b!1500944 (= res!1022026 (and (= (size!48866 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48866 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48866 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500945 () Bool)

(assert (=> b!1500945 (= e!839745 e!839744)))

(declare-fun res!1022021 () Bool)

(assert (=> b!1500945 (=> (not res!1022021) (not e!839744))))

(assert (=> b!1500945 (= res!1022021 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653038 #b00000000000000000000000000000000) (bvslt lt!653038 (size!48866 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500945 (= lt!653038 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500946 () Bool)

(declare-fun res!1022024 () Bool)

(assert (=> b!1500946 (=> (not res!1022024) (not e!839745))))

(assert (=> b!1500946 (= res!1022024 (not (= (select (arr!48316 a!2850) index!625) (select (arr!48316 a!2850) j!87))))))

(declare-fun b!1500947 () Bool)

(declare-fun res!1022022 () Bool)

(assert (=> b!1500947 (=> (not res!1022022) (not e!839745))))

(assert (=> b!1500947 (= res!1022022 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48316 a!2850) j!87) a!2850 mask!2661) (Found!12526 j!87)))))

(declare-fun b!1500948 () Bool)

(declare-fun res!1022025 () Bool)

(assert (=> b!1500948 (=> (not res!1022025) (not e!839745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500948 (= res!1022025 (validKeyInArray!0 (select (arr!48316 a!2850) j!87)))))

(declare-fun b!1500949 () Bool)

(declare-fun res!1022017 () Bool)

(assert (=> b!1500949 (=> (not res!1022017) (not e!839745))))

(assert (=> b!1500949 (= res!1022017 (validKeyInArray!0 (select (arr!48316 a!2850) i!996)))))

(declare-fun b!1500950 () Bool)

(declare-fun res!1022023 () Bool)

(assert (=> b!1500950 (=> (not res!1022023) (not e!839745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100113 (_ BitVec 32)) Bool)

(assert (=> b!1500950 (= res!1022023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127732 res!1022018) b!1500944))

(assert (= (and b!1500944 res!1022026) b!1500949))

(assert (= (and b!1500949 res!1022017) b!1500948))

(assert (= (and b!1500948 res!1022025) b!1500950))

(assert (= (and b!1500950 res!1022023) b!1500943))

(assert (= (and b!1500943 res!1022019) b!1500941))

(assert (= (and b!1500941 res!1022020) b!1500947))

(assert (= (and b!1500947 res!1022022) b!1500946))

(assert (= (and b!1500946 res!1022024) b!1500945))

(assert (= (and b!1500945 res!1022021) b!1500942))

(declare-fun m!1384135 () Bool)

(assert (=> start!127732 m!1384135))

(declare-fun m!1384137 () Bool)

(assert (=> start!127732 m!1384137))

(declare-fun m!1384139 () Bool)

(assert (=> b!1500949 m!1384139))

(assert (=> b!1500949 m!1384139))

(declare-fun m!1384141 () Bool)

(assert (=> b!1500949 m!1384141))

(declare-fun m!1384143 () Bool)

(assert (=> b!1500950 m!1384143))

(declare-fun m!1384145 () Bool)

(assert (=> b!1500946 m!1384145))

(declare-fun m!1384147 () Bool)

(assert (=> b!1500946 m!1384147))

(assert (=> b!1500947 m!1384147))

(assert (=> b!1500947 m!1384147))

(declare-fun m!1384149 () Bool)

(assert (=> b!1500947 m!1384149))

(declare-fun m!1384151 () Bool)

(assert (=> b!1500941 m!1384151))

(declare-fun m!1384153 () Bool)

(assert (=> b!1500941 m!1384153))

(declare-fun m!1384155 () Bool)

(assert (=> b!1500941 m!1384155))

(assert (=> b!1500948 m!1384147))

(assert (=> b!1500948 m!1384147))

(declare-fun m!1384157 () Bool)

(assert (=> b!1500948 m!1384157))

(assert (=> b!1500942 m!1384147))

(assert (=> b!1500942 m!1384147))

(declare-fun m!1384159 () Bool)

(assert (=> b!1500942 m!1384159))

(declare-fun m!1384161 () Bool)

(assert (=> b!1500945 m!1384161))

(declare-fun m!1384163 () Bool)

(assert (=> b!1500943 m!1384163))

(push 1)

(assert (not b!1500945))

(assert (not b!1500948))

(assert (not start!127732))

(assert (not b!1500949))

(assert (not b!1500950))

(assert (not b!1500942))

(assert (not b!1500943))

(assert (not b!1500947))

(check-sat)

(pop 1)

