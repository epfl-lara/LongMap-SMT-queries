; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127586 () Bool)

(assert start!127586)

(declare-fun b!1498862 () Bool)

(declare-fun res!1019938 () Bool)

(declare-fun e!839136 () Bool)

(assert (=> b!1498862 (=> (not res!1019938) (not e!839136))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((array!99967 0))(
  ( (array!99968 (arr!48243 (Array (_ BitVec 32) (_ BitVec 64))) (size!48793 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99967)

(assert (=> b!1498862 (= res!1019938 (and (= (size!48793 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48793 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48793 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498863 () Bool)

(declare-fun res!1019943 () Bool)

(assert (=> b!1498863 (=> (not res!1019943) (not e!839136))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498863 (= res!1019943 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48793 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48793 a!2850)) (= (select (arr!48243 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48243 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48793 a!2850))))))

(declare-fun b!1498864 () Bool)

(declare-fun res!1019940 () Bool)

(assert (=> b!1498864 (=> (not res!1019940) (not e!839136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498864 (= res!1019940 (validKeyInArray!0 (select (arr!48243 a!2850) j!87)))))

(declare-fun b!1498865 () Bool)

(declare-fun res!1019939 () Bool)

(assert (=> b!1498865 (=> (not res!1019939) (not e!839136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99967 (_ BitVec 32)) Bool)

(assert (=> b!1498865 (= res!1019939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498866 () Bool)

(declare-fun res!1019944 () Bool)

(assert (=> b!1498866 (=> (not res!1019944) (not e!839136))))

(declare-datatypes ((List!34735 0))(
  ( (Nil!34732) (Cons!34731 (h!36128 (_ BitVec 64)) (t!49429 List!34735)) )
))
(declare-fun arrayNoDuplicates!0 (array!99967 (_ BitVec 32) List!34735) Bool)

(assert (=> b!1498866 (= res!1019944 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34732))))

(declare-fun b!1498867 () Bool)

(assert (=> b!1498867 (= e!839136 false)))

(declare-datatypes ((SeekEntryResult!12453 0))(
  ( (MissingZero!12453 (index!52204 (_ BitVec 32))) (Found!12453 (index!52205 (_ BitVec 32))) (Intermediate!12453 (undefined!13265 Bool) (index!52206 (_ BitVec 32)) (x!133895 (_ BitVec 32))) (Undefined!12453) (MissingVacant!12453 (index!52207 (_ BitVec 32))) )
))
(declare-fun lt!652675 () SeekEntryResult!12453)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99967 (_ BitVec 32)) SeekEntryResult!12453)

(assert (=> b!1498867 (= lt!652675 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48243 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1019942 () Bool)

(assert (=> start!127586 (=> (not res!1019942) (not e!839136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127586 (= res!1019942 (validMask!0 mask!2661))))

(assert (=> start!127586 e!839136))

(assert (=> start!127586 true))

(declare-fun array_inv!37271 (array!99967) Bool)

(assert (=> start!127586 (array_inv!37271 a!2850)))

(declare-fun b!1498868 () Bool)

(declare-fun res!1019941 () Bool)

(assert (=> b!1498868 (=> (not res!1019941) (not e!839136))))

(assert (=> b!1498868 (= res!1019941 (validKeyInArray!0 (select (arr!48243 a!2850) i!996)))))

(assert (= (and start!127586 res!1019942) b!1498862))

(assert (= (and b!1498862 res!1019938) b!1498868))

(assert (= (and b!1498868 res!1019941) b!1498864))

(assert (= (and b!1498864 res!1019940) b!1498865))

(assert (= (and b!1498865 res!1019939) b!1498866))

(assert (= (and b!1498866 res!1019944) b!1498863))

(assert (= (and b!1498863 res!1019943) b!1498867))

(declare-fun m!1382017 () Bool)

(assert (=> start!127586 m!1382017))

(declare-fun m!1382019 () Bool)

(assert (=> start!127586 m!1382019))

(declare-fun m!1382021 () Bool)

(assert (=> b!1498866 m!1382021))

(declare-fun m!1382023 () Bool)

(assert (=> b!1498864 m!1382023))

(assert (=> b!1498864 m!1382023))

(declare-fun m!1382025 () Bool)

(assert (=> b!1498864 m!1382025))

(declare-fun m!1382027 () Bool)

(assert (=> b!1498865 m!1382027))

(declare-fun m!1382029 () Bool)

(assert (=> b!1498868 m!1382029))

(assert (=> b!1498868 m!1382029))

(declare-fun m!1382031 () Bool)

(assert (=> b!1498868 m!1382031))

(declare-fun m!1382033 () Bool)

(assert (=> b!1498863 m!1382033))

(declare-fun m!1382035 () Bool)

(assert (=> b!1498863 m!1382035))

(declare-fun m!1382037 () Bool)

(assert (=> b!1498863 m!1382037))

(assert (=> b!1498867 m!1382023))

(assert (=> b!1498867 m!1382023))

(declare-fun m!1382039 () Bool)

(assert (=> b!1498867 m!1382039))

(check-sat (not b!1498868) (not start!127586) (not b!1498865) (not b!1498867) (not b!1498866) (not b!1498864))
