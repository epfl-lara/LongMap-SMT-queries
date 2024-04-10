; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121646 () Bool)

(assert start!121646)

(declare-fun b!1413306 () Bool)

(declare-fun e!799822 () Bool)

(declare-fun e!799825 () Bool)

(assert (=> b!1413306 (= e!799822 e!799825)))

(declare-fun res!950296 () Bool)

(assert (=> b!1413306 (=> res!950296 e!799825)))

(declare-datatypes ((SeekEntryResult!10940 0))(
  ( (MissingZero!10940 (index!46140 (_ BitVec 32))) (Found!10940 (index!46141 (_ BitVec 32))) (Intermediate!10940 (undefined!11752 Bool) (index!46142 (_ BitVec 32)) (x!127723 (_ BitVec 32))) (Undefined!10940) (MissingVacant!10940 (index!46143 (_ BitVec 32))) )
))
(declare-fun lt!622943 () SeekEntryResult!10940)

(declare-fun lt!622944 () SeekEntryResult!10940)

(get-info :version)

(assert (=> b!1413306 (= res!950296 (or (= lt!622943 lt!622944) (not ((_ is Intermediate!10940) lt!622944))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96584 0))(
  ( (array!96585 (arr!46629 (Array (_ BitVec 32) (_ BitVec 64))) (size!47179 (_ BitVec 32))) )
))
(declare-fun lt!622947 () array!96584)

(declare-fun lt!622942 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96584 (_ BitVec 32)) SeekEntryResult!10940)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413306 (= lt!622944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622942 mask!2840) lt!622942 lt!622947 mask!2840))))

(declare-fun a!2901 () array!96584)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413306 (= lt!622942 (select (store (arr!46629 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413306 (= lt!622947 (array!96585 (store (arr!46629 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47179 a!2901)))))

(declare-fun e!799821 () Bool)

(declare-fun b!1413307 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96584 (_ BitVec 32)) SeekEntryResult!10940)

(assert (=> b!1413307 (= e!799821 (= (seekEntryOrOpen!0 (select (arr!46629 a!2901) j!112) a!2901 mask!2840) (Found!10940 j!112)))))

(declare-fun b!1413308 () Bool)

(assert (=> b!1413308 (= e!799825 true)))

(declare-fun e!799824 () Bool)

(assert (=> b!1413308 e!799824))

(declare-fun res!950297 () Bool)

(assert (=> b!1413308 (=> (not res!950297) (not e!799824))))

(assert (=> b!1413308 (= res!950297 (and (not (undefined!11752 lt!622944)) (= (index!46142 lt!622944) i!1037) (bvslt (x!127723 lt!622944) (x!127723 lt!622943)) (= (select (store (arr!46629 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46142 lt!622944)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622941 () (_ BitVec 32))

(declare-datatypes ((Unit!47854 0))(
  ( (Unit!47855) )
))
(declare-fun lt!622946 () Unit!47854)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47854)

(assert (=> b!1413308 (= lt!622946 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622941 (x!127723 lt!622943) (index!46142 lt!622943) (x!127723 lt!622944) (index!46142 lt!622944) (undefined!11752 lt!622944) mask!2840))))

(declare-fun b!1413309 () Bool)

(declare-fun res!950302 () Bool)

(declare-fun e!799823 () Bool)

(assert (=> b!1413309 (=> (not res!950302) (not e!799823))))

(declare-datatypes ((List!33148 0))(
  ( (Nil!33145) (Cons!33144 (h!34419 (_ BitVec 64)) (t!47842 List!33148)) )
))
(declare-fun arrayNoDuplicates!0 (array!96584 (_ BitVec 32) List!33148) Bool)

(assert (=> b!1413309 (= res!950302 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33145))))

(declare-fun res!950305 () Bool)

(assert (=> start!121646 (=> (not res!950305) (not e!799823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121646 (= res!950305 (validMask!0 mask!2840))))

(assert (=> start!121646 e!799823))

(assert (=> start!121646 true))

(declare-fun array_inv!35657 (array!96584) Bool)

(assert (=> start!121646 (array_inv!35657 a!2901)))

(declare-fun b!1413310 () Bool)

(declare-fun res!950300 () Bool)

(assert (=> b!1413310 (=> (not res!950300) (not e!799823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413310 (= res!950300 (validKeyInArray!0 (select (arr!46629 a!2901) i!1037)))))

(declare-fun b!1413311 () Bool)

(assert (=> b!1413311 (= e!799823 (not e!799822))))

(declare-fun res!950301 () Bool)

(assert (=> b!1413311 (=> res!950301 e!799822)))

(assert (=> b!1413311 (= res!950301 (or (not ((_ is Intermediate!10940) lt!622943)) (undefined!11752 lt!622943)))))

(assert (=> b!1413311 e!799821))

(declare-fun res!950304 () Bool)

(assert (=> b!1413311 (=> (not res!950304) (not e!799821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96584 (_ BitVec 32)) Bool)

(assert (=> b!1413311 (= res!950304 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622945 () Unit!47854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47854)

(assert (=> b!1413311 (= lt!622945 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413311 (= lt!622943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622941 (select (arr!46629 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413311 (= lt!622941 (toIndex!0 (select (arr!46629 a!2901) j!112) mask!2840))))

(declare-fun b!1413312 () Bool)

(declare-fun res!950303 () Bool)

(assert (=> b!1413312 (=> (not res!950303) (not e!799823))))

(assert (=> b!1413312 (= res!950303 (and (= (size!47179 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47179 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47179 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413313 () Bool)

(declare-fun res!950299 () Bool)

(assert (=> b!1413313 (=> (not res!950299) (not e!799823))))

(assert (=> b!1413313 (= res!950299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413314 () Bool)

(declare-fun res!950298 () Bool)

(assert (=> b!1413314 (=> (not res!950298) (not e!799823))))

(assert (=> b!1413314 (= res!950298 (validKeyInArray!0 (select (arr!46629 a!2901) j!112)))))

(declare-fun b!1413315 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96584 (_ BitVec 32)) SeekEntryResult!10940)

(assert (=> b!1413315 (= e!799824 (= (seekEntryOrOpen!0 lt!622942 lt!622947 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127723 lt!622944) (index!46142 lt!622944) (index!46142 lt!622944) (select (arr!46629 a!2901) j!112) lt!622947 mask!2840)))))

(assert (= (and start!121646 res!950305) b!1413312))

(assert (= (and b!1413312 res!950303) b!1413310))

(assert (= (and b!1413310 res!950300) b!1413314))

(assert (= (and b!1413314 res!950298) b!1413313))

(assert (= (and b!1413313 res!950299) b!1413309))

(assert (= (and b!1413309 res!950302) b!1413311))

(assert (= (and b!1413311 res!950304) b!1413307))

(assert (= (and b!1413311 (not res!950301)) b!1413306))

(assert (= (and b!1413306 (not res!950296)) b!1413308))

(assert (= (and b!1413308 res!950297) b!1413315))

(declare-fun m!1303677 () Bool)

(assert (=> b!1413310 m!1303677))

(assert (=> b!1413310 m!1303677))

(declare-fun m!1303679 () Bool)

(assert (=> b!1413310 m!1303679))

(declare-fun m!1303681 () Bool)

(assert (=> b!1413313 m!1303681))

(declare-fun m!1303683 () Bool)

(assert (=> b!1413307 m!1303683))

(assert (=> b!1413307 m!1303683))

(declare-fun m!1303685 () Bool)

(assert (=> b!1413307 m!1303685))

(assert (=> b!1413314 m!1303683))

(assert (=> b!1413314 m!1303683))

(declare-fun m!1303687 () Bool)

(assert (=> b!1413314 m!1303687))

(assert (=> b!1413311 m!1303683))

(declare-fun m!1303689 () Bool)

(assert (=> b!1413311 m!1303689))

(assert (=> b!1413311 m!1303683))

(declare-fun m!1303691 () Bool)

(assert (=> b!1413311 m!1303691))

(assert (=> b!1413311 m!1303683))

(declare-fun m!1303693 () Bool)

(assert (=> b!1413311 m!1303693))

(declare-fun m!1303695 () Bool)

(assert (=> b!1413311 m!1303695))

(declare-fun m!1303697 () Bool)

(assert (=> b!1413306 m!1303697))

(assert (=> b!1413306 m!1303697))

(declare-fun m!1303699 () Bool)

(assert (=> b!1413306 m!1303699))

(declare-fun m!1303701 () Bool)

(assert (=> b!1413306 m!1303701))

(declare-fun m!1303703 () Bool)

(assert (=> b!1413306 m!1303703))

(declare-fun m!1303705 () Bool)

(assert (=> start!121646 m!1303705))

(declare-fun m!1303707 () Bool)

(assert (=> start!121646 m!1303707))

(declare-fun m!1303709 () Bool)

(assert (=> b!1413315 m!1303709))

(assert (=> b!1413315 m!1303683))

(assert (=> b!1413315 m!1303683))

(declare-fun m!1303711 () Bool)

(assert (=> b!1413315 m!1303711))

(declare-fun m!1303713 () Bool)

(assert (=> b!1413309 m!1303713))

(assert (=> b!1413308 m!1303701))

(declare-fun m!1303715 () Bool)

(assert (=> b!1413308 m!1303715))

(declare-fun m!1303717 () Bool)

(assert (=> b!1413308 m!1303717))

(check-sat (not b!1413314) (not b!1413308) (not start!121646) (not b!1413311) (not b!1413315) (not b!1413310) (not b!1413313) (not b!1413309) (not b!1413306) (not b!1413307))
(check-sat)
