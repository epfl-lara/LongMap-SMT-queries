; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121108 () Bool)

(assert start!121108)

(declare-fun b!1408114 () Bool)

(declare-fun res!945836 () Bool)

(declare-fun e!796947 () Bool)

(assert (=> b!1408114 (=> (not res!945836) (not e!796947))))

(declare-datatypes ((array!96262 0))(
  ( (array!96263 (arr!46474 (Array (_ BitVec 32) (_ BitVec 64))) (size!47024 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96262)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96262 (_ BitVec 32)) Bool)

(assert (=> b!1408114 (= res!945836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408115 () Bool)

(declare-fun res!945844 () Bool)

(assert (=> b!1408115 (=> (not res!945844) (not e!796947))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408115 (= res!945844 (and (= (size!47024 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47024 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47024 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!945842 () Bool)

(assert (=> start!121108 (=> (not res!945842) (not e!796947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121108 (= res!945842 (validMask!0 mask!2840))))

(assert (=> start!121108 e!796947))

(assert (=> start!121108 true))

(declare-fun array_inv!35502 (array!96262) Bool)

(assert (=> start!121108 (array_inv!35502 a!2901)))

(declare-fun b!1408116 () Bool)

(declare-fun res!945843 () Bool)

(assert (=> b!1408116 (=> (not res!945843) (not e!796947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408116 (= res!945843 (validKeyInArray!0 (select (arr!46474 a!2901) j!112)))))

(declare-fun b!1408117 () Bool)

(declare-fun e!796946 () Bool)

(declare-fun e!796948 () Bool)

(assert (=> b!1408117 (= e!796946 e!796948)))

(declare-fun res!945839 () Bool)

(assert (=> b!1408117 (=> res!945839 e!796948)))

(declare-datatypes ((SeekEntryResult!10785 0))(
  ( (MissingZero!10785 (index!45517 (_ BitVec 32))) (Found!10785 (index!45518 (_ BitVec 32))) (Intermediate!10785 (undefined!11597 Bool) (index!45519 (_ BitVec 32)) (x!127122 (_ BitVec 32))) (Undefined!10785) (MissingVacant!10785 (index!45520 (_ BitVec 32))) )
))
(declare-fun lt!620125 () SeekEntryResult!10785)

(declare-fun lt!620126 () (_ BitVec 64))

(declare-fun lt!620127 () array!96262)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96262 (_ BitVec 32)) SeekEntryResult!10785)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408117 (= res!945839 (not (= lt!620125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620126 mask!2840) lt!620126 lt!620127 mask!2840))))))

(assert (=> b!1408117 (= lt!620126 (select (store (arr!46474 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408117 (= lt!620127 (array!96263 (store (arr!46474 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47024 a!2901)))))

(declare-fun b!1408118 () Bool)

(assert (=> b!1408118 (= e!796947 (not e!796946))))

(declare-fun res!945837 () Bool)

(assert (=> b!1408118 (=> res!945837 e!796946)))

(assert (=> b!1408118 (= res!945837 (or (not (is-Intermediate!10785 lt!620125)) (undefined!11597 lt!620125)))))

(declare-fun lt!620128 () SeekEntryResult!10785)

(assert (=> b!1408118 (= lt!620128 (Found!10785 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96262 (_ BitVec 32)) SeekEntryResult!10785)

(assert (=> b!1408118 (= lt!620128 (seekEntryOrOpen!0 (select (arr!46474 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408118 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47544 0))(
  ( (Unit!47545) )
))
(declare-fun lt!620124 () Unit!47544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47544)

(assert (=> b!1408118 (= lt!620124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!620129 () (_ BitVec 32))

(assert (=> b!1408118 (= lt!620125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620129 (select (arr!46474 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408118 (= lt!620129 (toIndex!0 (select (arr!46474 a!2901) j!112) mask!2840))))

(declare-fun b!1408119 () Bool)

(declare-fun res!945840 () Bool)

(assert (=> b!1408119 (=> res!945840 e!796948)))

(assert (=> b!1408119 (= res!945840 (or (bvslt (x!127122 lt!620125) #b00000000000000000000000000000000) (bvsgt (x!127122 lt!620125) #b01111111111111111111111111111110) (bvslt lt!620129 #b00000000000000000000000000000000) (bvsge lt!620129 (size!47024 a!2901)) (bvslt (index!45519 lt!620125) #b00000000000000000000000000000000) (bvsge (index!45519 lt!620125) (size!47024 a!2901)) (not (= lt!620125 (Intermediate!10785 false (index!45519 lt!620125) (x!127122 lt!620125))))))))

(declare-fun b!1408120 () Bool)

(declare-fun res!945838 () Bool)

(assert (=> b!1408120 (=> (not res!945838) (not e!796947))))

(declare-datatypes ((List!32993 0))(
  ( (Nil!32990) (Cons!32989 (h!34252 (_ BitVec 64)) (t!47687 List!32993)) )
))
(declare-fun arrayNoDuplicates!0 (array!96262 (_ BitVec 32) List!32993) Bool)

(assert (=> b!1408120 (= res!945838 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32990))))

(declare-fun b!1408121 () Bool)

(declare-fun res!945841 () Bool)

(assert (=> b!1408121 (=> (not res!945841) (not e!796947))))

(assert (=> b!1408121 (= res!945841 (validKeyInArray!0 (select (arr!46474 a!2901) i!1037)))))

(declare-fun b!1408122 () Bool)

(assert (=> b!1408122 (= e!796948 true)))

(assert (=> b!1408122 (= lt!620128 (seekEntryOrOpen!0 lt!620126 lt!620127 mask!2840))))

(declare-fun lt!620130 () Unit!47544)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47544)

(assert (=> b!1408122 (= lt!620130 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620129 (x!127122 lt!620125) (index!45519 lt!620125) mask!2840))))

(assert (= (and start!121108 res!945842) b!1408115))

(assert (= (and b!1408115 res!945844) b!1408121))

(assert (= (and b!1408121 res!945841) b!1408116))

(assert (= (and b!1408116 res!945843) b!1408114))

(assert (= (and b!1408114 res!945836) b!1408120))

(assert (= (and b!1408120 res!945838) b!1408118))

(assert (= (and b!1408118 (not res!945837)) b!1408117))

(assert (= (and b!1408117 (not res!945839)) b!1408119))

(assert (= (and b!1408119 (not res!945840)) b!1408122))

(declare-fun m!1297279 () Bool)

(assert (=> b!1408120 m!1297279))

(declare-fun m!1297281 () Bool)

(assert (=> b!1408121 m!1297281))

(assert (=> b!1408121 m!1297281))

(declare-fun m!1297283 () Bool)

(assert (=> b!1408121 m!1297283))

(declare-fun m!1297285 () Bool)

(assert (=> b!1408122 m!1297285))

(declare-fun m!1297287 () Bool)

(assert (=> b!1408122 m!1297287))

(declare-fun m!1297289 () Bool)

(assert (=> b!1408118 m!1297289))

(declare-fun m!1297291 () Bool)

(assert (=> b!1408118 m!1297291))

(assert (=> b!1408118 m!1297289))

(assert (=> b!1408118 m!1297289))

(declare-fun m!1297293 () Bool)

(assert (=> b!1408118 m!1297293))

(declare-fun m!1297295 () Bool)

(assert (=> b!1408118 m!1297295))

(assert (=> b!1408118 m!1297289))

(declare-fun m!1297297 () Bool)

(assert (=> b!1408118 m!1297297))

(declare-fun m!1297299 () Bool)

(assert (=> b!1408118 m!1297299))

(declare-fun m!1297301 () Bool)

(assert (=> b!1408114 m!1297301))

(assert (=> b!1408116 m!1297289))

(assert (=> b!1408116 m!1297289))

(declare-fun m!1297303 () Bool)

(assert (=> b!1408116 m!1297303))

(declare-fun m!1297305 () Bool)

(assert (=> start!121108 m!1297305))

(declare-fun m!1297307 () Bool)

(assert (=> start!121108 m!1297307))

(declare-fun m!1297309 () Bool)

(assert (=> b!1408117 m!1297309))

(assert (=> b!1408117 m!1297309))

(declare-fun m!1297311 () Bool)

(assert (=> b!1408117 m!1297311))

(declare-fun m!1297313 () Bool)

(assert (=> b!1408117 m!1297313))

(declare-fun m!1297315 () Bool)

(assert (=> b!1408117 m!1297315))

(push 1)

