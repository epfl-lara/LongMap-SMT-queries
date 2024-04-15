; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45066 () Bool)

(assert start!45066)

(declare-fun res!297264 () Bool)

(declare-fun e!290161 () Bool)

(assert (=> start!45066 (=> (not res!297264) (not e!290161))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45066 (= res!297264 (validMask!0 mask!3524))))

(assert (=> start!45066 e!290161))

(assert (=> start!45066 true))

(declare-datatypes ((array!32021 0))(
  ( (array!32022 (arr!15395 (Array (_ BitVec 32) (_ BitVec 64))) (size!15760 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32021)

(declare-fun array_inv!11278 (array!32021) Bool)

(assert (=> start!45066 (array_inv!11278 a!3235)))

(declare-fun b!494545 () Bool)

(declare-fun res!297260 () Bool)

(declare-fun e!290160 () Bool)

(assert (=> b!494545 (=> res!297260 e!290160)))

(declare-datatypes ((SeekEntryResult!3859 0))(
  ( (MissingZero!3859 (index!17615 (_ BitVec 32))) (Found!3859 (index!17616 (_ BitVec 32))) (Intermediate!3859 (undefined!4671 Bool) (index!17617 (_ BitVec 32)) (x!46692 (_ BitVec 32))) (Undefined!3859) (MissingVacant!3859 (index!17618 (_ BitVec 32))) )
))
(declare-fun lt!223764 () SeekEntryResult!3859)

(get-info :version)

(assert (=> b!494545 (= res!297260 (or (not ((_ is Intermediate!3859) lt!223764)) (not (undefined!4671 lt!223764))))))

(declare-fun b!494546 () Bool)

(declare-fun e!290163 () Bool)

(assert (=> b!494546 (= e!290161 e!290163)))

(declare-fun res!297261 () Bool)

(assert (=> b!494546 (=> (not res!297261) (not e!290163))))

(declare-fun lt!223765 () SeekEntryResult!3859)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494546 (= res!297261 (or (= lt!223765 (MissingZero!3859 i!1204)) (= lt!223765 (MissingVacant!3859 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32021 (_ BitVec 32)) SeekEntryResult!3859)

(assert (=> b!494546 (= lt!223765 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494547 () Bool)

(assert (=> b!494547 (= e!290163 (not e!290160))))

(declare-fun res!297262 () Bool)

(assert (=> b!494547 (=> res!297262 e!290160)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223766 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32021 (_ BitVec 32)) SeekEntryResult!3859)

(assert (=> b!494547 (= res!297262 (= lt!223764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223766 (select (store (arr!15395 a!3235) i!1204 k0!2280) j!176) (array!32022 (store (arr!15395 a!3235) i!1204 k0!2280) (size!15760 a!3235)) mask!3524)))))

(declare-fun lt!223763 () (_ BitVec 32))

(assert (=> b!494547 (= lt!223764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223763 (select (arr!15395 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494547 (= lt!223766 (toIndex!0 (select (store (arr!15395 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494547 (= lt!223763 (toIndex!0 (select (arr!15395 a!3235) j!176) mask!3524))))

(declare-fun lt!223768 () SeekEntryResult!3859)

(assert (=> b!494547 (= lt!223768 (Found!3859 j!176))))

(assert (=> b!494547 (= lt!223768 (seekEntryOrOpen!0 (select (arr!15395 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32021 (_ BitVec 32)) Bool)

(assert (=> b!494547 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14650 0))(
  ( (Unit!14651) )
))
(declare-fun lt!223767 () Unit!14650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14650)

(assert (=> b!494547 (= lt!223767 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494548 () Bool)

(assert (=> b!494548 (= e!290160 true)))

(assert (=> b!494548 (= lt!223768 Undefined!3859)))

(declare-fun b!494549 () Bool)

(declare-fun res!297263 () Bool)

(assert (=> b!494549 (=> (not res!297263) (not e!290161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494549 (= res!297263 (validKeyInArray!0 k0!2280))))

(declare-fun b!494550 () Bool)

(declare-fun res!297266 () Bool)

(assert (=> b!494550 (=> (not res!297266) (not e!290163))))

(assert (=> b!494550 (= res!297266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494551 () Bool)

(declare-fun res!297265 () Bool)

(assert (=> b!494551 (=> (not res!297265) (not e!290161))))

(declare-fun arrayContainsKey!0 (array!32021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494551 (= res!297265 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494552 () Bool)

(declare-fun res!297259 () Bool)

(assert (=> b!494552 (=> (not res!297259) (not e!290163))))

(declare-datatypes ((List!9592 0))(
  ( (Nil!9589) (Cons!9588 (h!10456 (_ BitVec 64)) (t!15811 List!9592)) )
))
(declare-fun arrayNoDuplicates!0 (array!32021 (_ BitVec 32) List!9592) Bool)

(assert (=> b!494552 (= res!297259 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9589))))

(declare-fun b!494553 () Bool)

(declare-fun res!297258 () Bool)

(assert (=> b!494553 (=> (not res!297258) (not e!290161))))

(assert (=> b!494553 (= res!297258 (and (= (size!15760 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15760 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15760 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494554 () Bool)

(declare-fun res!297257 () Bool)

(assert (=> b!494554 (=> (not res!297257) (not e!290161))))

(assert (=> b!494554 (= res!297257 (validKeyInArray!0 (select (arr!15395 a!3235) j!176)))))

(assert (= (and start!45066 res!297264) b!494553))

(assert (= (and b!494553 res!297258) b!494554))

(assert (= (and b!494554 res!297257) b!494549))

(assert (= (and b!494549 res!297263) b!494551))

(assert (= (and b!494551 res!297265) b!494546))

(assert (= (and b!494546 res!297261) b!494550))

(assert (= (and b!494550 res!297266) b!494552))

(assert (= (and b!494552 res!297259) b!494547))

(assert (= (and b!494547 (not res!297262)) b!494545))

(assert (= (and b!494545 (not res!297260)) b!494548))

(declare-fun m!475183 () Bool)

(assert (=> b!494550 m!475183))

(declare-fun m!475185 () Bool)

(assert (=> b!494552 m!475185))

(declare-fun m!475187 () Bool)

(assert (=> b!494546 m!475187))

(declare-fun m!475189 () Bool)

(assert (=> start!45066 m!475189))

(declare-fun m!475191 () Bool)

(assert (=> start!45066 m!475191))

(declare-fun m!475193 () Bool)

(assert (=> b!494554 m!475193))

(assert (=> b!494554 m!475193))

(declare-fun m!475195 () Bool)

(assert (=> b!494554 m!475195))

(declare-fun m!475197 () Bool)

(assert (=> b!494547 m!475197))

(declare-fun m!475199 () Bool)

(assert (=> b!494547 m!475199))

(declare-fun m!475201 () Bool)

(assert (=> b!494547 m!475201))

(declare-fun m!475203 () Bool)

(assert (=> b!494547 m!475203))

(assert (=> b!494547 m!475197))

(assert (=> b!494547 m!475193))

(declare-fun m!475205 () Bool)

(assert (=> b!494547 m!475205))

(assert (=> b!494547 m!475193))

(declare-fun m!475207 () Bool)

(assert (=> b!494547 m!475207))

(assert (=> b!494547 m!475193))

(declare-fun m!475209 () Bool)

(assert (=> b!494547 m!475209))

(assert (=> b!494547 m!475193))

(declare-fun m!475211 () Bool)

(assert (=> b!494547 m!475211))

(assert (=> b!494547 m!475197))

(declare-fun m!475213 () Bool)

(assert (=> b!494547 m!475213))

(declare-fun m!475215 () Bool)

(assert (=> b!494551 m!475215))

(declare-fun m!475217 () Bool)

(assert (=> b!494549 m!475217))

(check-sat (not b!494554) (not b!494546) (not b!494552) (not start!45066) (not b!494549) (not b!494551) (not b!494547) (not b!494550))
(check-sat)
