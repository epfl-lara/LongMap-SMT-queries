; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121646 () Bool)

(assert start!121646)

(declare-fun b!1413285 () Bool)

(declare-fun res!950332 () Bool)

(declare-fun e!799823 () Bool)

(assert (=> b!1413285 (=> (not res!950332) (not e!799823))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96537 0))(
  ( (array!96538 (arr!46606 (Array (_ BitVec 32) (_ BitVec 64))) (size!47158 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96537)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413285 (= res!950332 (and (= (size!47158 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47158 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47158 a!2901)) (not (= i!1037 j!112))))))

(declare-datatypes ((SeekEntryResult!10943 0))(
  ( (MissingZero!10943 (index!46152 (_ BitVec 32))) (Found!10943 (index!46153 (_ BitVec 32))) (Intermediate!10943 (undefined!11755 Bool) (index!46154 (_ BitVec 32)) (x!127731 (_ BitVec 32))) (Undefined!10943) (MissingVacant!10943 (index!46155 (_ BitVec 32))) )
))
(declare-fun lt!622795 () SeekEntryResult!10943)

(declare-fun b!1413286 () Bool)

(declare-fun lt!622797 () array!96537)

(declare-fun e!799819 () Bool)

(declare-fun lt!622796 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96537 (_ BitVec 32)) SeekEntryResult!10943)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96537 (_ BitVec 32)) SeekEntryResult!10943)

(assert (=> b!1413286 (= e!799819 (= (seekEntryOrOpen!0 lt!622796 lt!622797 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127731 lt!622795) (index!46154 lt!622795) (index!46154 lt!622795) (select (arr!46606 a!2901) j!112) lt!622797 mask!2840)))))

(declare-fun b!1413287 () Bool)

(declare-fun e!799820 () Bool)

(assert (=> b!1413287 (= e!799823 (not e!799820))))

(declare-fun res!950327 () Bool)

(assert (=> b!1413287 (=> res!950327 e!799820)))

(declare-fun lt!622793 () SeekEntryResult!10943)

(get-info :version)

(assert (=> b!1413287 (= res!950327 (or (not ((_ is Intermediate!10943) lt!622793)) (undefined!11755 lt!622793)))))

(declare-fun e!799822 () Bool)

(assert (=> b!1413287 e!799822))

(declare-fun res!950335 () Bool)

(assert (=> b!1413287 (=> (not res!950335) (not e!799822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96537 (_ BitVec 32)) Bool)

(assert (=> b!1413287 (= res!950335 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47703 0))(
  ( (Unit!47704) )
))
(declare-fun lt!622798 () Unit!47703)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47703)

(assert (=> b!1413287 (= lt!622798 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622799 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96537 (_ BitVec 32)) SeekEntryResult!10943)

(assert (=> b!1413287 (= lt!622793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622799 (select (arr!46606 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413287 (= lt!622799 (toIndex!0 (select (arr!46606 a!2901) j!112) mask!2840))))

(declare-fun b!1413288 () Bool)

(declare-fun res!950330 () Bool)

(assert (=> b!1413288 (=> (not res!950330) (not e!799823))))

(declare-datatypes ((List!33203 0))(
  ( (Nil!33200) (Cons!33199 (h!34474 (_ BitVec 64)) (t!47889 List!33203)) )
))
(declare-fun arrayNoDuplicates!0 (array!96537 (_ BitVec 32) List!33203) Bool)

(assert (=> b!1413288 (= res!950330 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33200))))

(declare-fun res!950326 () Bool)

(assert (=> start!121646 (=> (not res!950326) (not e!799823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121646 (= res!950326 (validMask!0 mask!2840))))

(assert (=> start!121646 e!799823))

(assert (=> start!121646 true))

(declare-fun array_inv!35839 (array!96537) Bool)

(assert (=> start!121646 (array_inv!35839 a!2901)))

(declare-fun b!1413289 () Bool)

(declare-fun e!799818 () Bool)

(assert (=> b!1413289 (= e!799820 e!799818)))

(declare-fun res!950331 () Bool)

(assert (=> b!1413289 (=> res!950331 e!799818)))

(assert (=> b!1413289 (= res!950331 (or (= lt!622793 lt!622795) (not ((_ is Intermediate!10943) lt!622795))))))

(assert (=> b!1413289 (= lt!622795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622796 mask!2840) lt!622796 lt!622797 mask!2840))))

(assert (=> b!1413289 (= lt!622796 (select (store (arr!46606 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413289 (= lt!622797 (array!96538 (store (arr!46606 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47158 a!2901)))))

(declare-fun b!1413290 () Bool)

(declare-fun res!950328 () Bool)

(assert (=> b!1413290 (=> (not res!950328) (not e!799823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413290 (= res!950328 (validKeyInArray!0 (select (arr!46606 a!2901) j!112)))))

(declare-fun b!1413291 () Bool)

(declare-fun res!950329 () Bool)

(assert (=> b!1413291 (=> (not res!950329) (not e!799823))))

(assert (=> b!1413291 (= res!950329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413292 () Bool)

(declare-fun res!950333 () Bool)

(assert (=> b!1413292 (=> (not res!950333) (not e!799823))))

(assert (=> b!1413292 (= res!950333 (validKeyInArray!0 (select (arr!46606 a!2901) i!1037)))))

(declare-fun b!1413293 () Bool)

(assert (=> b!1413293 (= e!799818 true)))

(assert (=> b!1413293 e!799819))

(declare-fun res!950334 () Bool)

(assert (=> b!1413293 (=> (not res!950334) (not e!799819))))

(assert (=> b!1413293 (= res!950334 (and (not (undefined!11755 lt!622795)) (= (index!46154 lt!622795) i!1037) (bvslt (x!127731 lt!622795) (x!127731 lt!622793)) (= (select (store (arr!46606 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46154 lt!622795)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622794 () Unit!47703)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47703)

(assert (=> b!1413293 (= lt!622794 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622799 (x!127731 lt!622793) (index!46154 lt!622793) (x!127731 lt!622795) (index!46154 lt!622795) (undefined!11755 lt!622795) mask!2840))))

(declare-fun b!1413294 () Bool)

(assert (=> b!1413294 (= e!799822 (= (seekEntryOrOpen!0 (select (arr!46606 a!2901) j!112) a!2901 mask!2840) (Found!10943 j!112)))))

(assert (= (and start!121646 res!950326) b!1413285))

(assert (= (and b!1413285 res!950332) b!1413292))

(assert (= (and b!1413292 res!950333) b!1413290))

(assert (= (and b!1413290 res!950328) b!1413291))

(assert (= (and b!1413291 res!950329) b!1413288))

(assert (= (and b!1413288 res!950330) b!1413287))

(assert (= (and b!1413287 res!950335) b!1413294))

(assert (= (and b!1413287 (not res!950327)) b!1413289))

(assert (= (and b!1413289 (not res!950331)) b!1413293))

(assert (= (and b!1413293 res!950334) b!1413286))

(declare-fun m!1303225 () Bool)

(assert (=> b!1413294 m!1303225))

(assert (=> b!1413294 m!1303225))

(declare-fun m!1303227 () Bool)

(assert (=> b!1413294 m!1303227))

(assert (=> b!1413290 m!1303225))

(assert (=> b!1413290 m!1303225))

(declare-fun m!1303229 () Bool)

(assert (=> b!1413290 m!1303229))

(declare-fun m!1303231 () Bool)

(assert (=> b!1413289 m!1303231))

(assert (=> b!1413289 m!1303231))

(declare-fun m!1303233 () Bool)

(assert (=> b!1413289 m!1303233))

(declare-fun m!1303235 () Bool)

(assert (=> b!1413289 m!1303235))

(declare-fun m!1303237 () Bool)

(assert (=> b!1413289 m!1303237))

(assert (=> b!1413293 m!1303235))

(declare-fun m!1303239 () Bool)

(assert (=> b!1413293 m!1303239))

(declare-fun m!1303241 () Bool)

(assert (=> b!1413293 m!1303241))

(declare-fun m!1303243 () Bool)

(assert (=> b!1413292 m!1303243))

(assert (=> b!1413292 m!1303243))

(declare-fun m!1303245 () Bool)

(assert (=> b!1413292 m!1303245))

(declare-fun m!1303247 () Bool)

(assert (=> b!1413288 m!1303247))

(declare-fun m!1303249 () Bool)

(assert (=> b!1413286 m!1303249))

(assert (=> b!1413286 m!1303225))

(assert (=> b!1413286 m!1303225))

(declare-fun m!1303251 () Bool)

(assert (=> b!1413286 m!1303251))

(declare-fun m!1303253 () Bool)

(assert (=> start!121646 m!1303253))

(declare-fun m!1303255 () Bool)

(assert (=> start!121646 m!1303255))

(declare-fun m!1303257 () Bool)

(assert (=> b!1413291 m!1303257))

(assert (=> b!1413287 m!1303225))

(declare-fun m!1303259 () Bool)

(assert (=> b!1413287 m!1303259))

(assert (=> b!1413287 m!1303225))

(assert (=> b!1413287 m!1303225))

(declare-fun m!1303261 () Bool)

(assert (=> b!1413287 m!1303261))

(declare-fun m!1303263 () Bool)

(assert (=> b!1413287 m!1303263))

(declare-fun m!1303265 () Bool)

(assert (=> b!1413287 m!1303265))

(check-sat (not b!1413292) (not b!1413293) (not b!1413286) (not b!1413294) (not b!1413287) (not b!1413289) (not b!1413291) (not start!121646) (not b!1413288) (not b!1413290))
(check-sat)
