; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45578 () Bool)

(assert start!45578)

(declare-fun b!501861 () Bool)

(declare-fun res!303402 () Bool)

(declare-fun e!293985 () Bool)

(assert (=> b!501861 (=> (not res!303402) (not e!293985))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32335 0))(
  ( (array!32336 (arr!15547 (Array (_ BitVec 32) (_ BitVec 64))) (size!15911 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32335)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!501861 (= res!303402 (and (= (size!15911 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15911 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15911 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501862 () Bool)

(declare-fun e!293981 () Bool)

(assert (=> b!501862 (= e!293981 true)))

(declare-fun lt!228055 () (_ BitVec 64))

(declare-fun lt!228059 () array!32335)

(declare-datatypes ((SeekEntryResult!3970 0))(
  ( (MissingZero!3970 (index!18068 (_ BitVec 32))) (Found!3970 (index!18069 (_ BitVec 32))) (Intermediate!3970 (undefined!4782 Bool) (index!18070 (_ BitVec 32)) (x!47248 (_ BitVec 32))) (Undefined!3970) (MissingVacant!3970 (index!18071 (_ BitVec 32))) )
))
(declare-fun lt!228064 () SeekEntryResult!3970)

(declare-fun lt!228060 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32335 (_ BitVec 32)) SeekEntryResult!3970)

(assert (=> b!501862 (= lt!228064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228060 lt!228055 lt!228059 mask!3524))))

(declare-fun b!501863 () Bool)

(declare-fun e!293986 () Bool)

(assert (=> b!501863 (= e!293986 e!293981)))

(declare-fun res!303396 () Bool)

(assert (=> b!501863 (=> res!303396 e!293981)))

(declare-fun lt!228063 () SeekEntryResult!3970)

(assert (=> b!501863 (= res!303396 (or (bvsgt (x!47248 lt!228063) #b01111111111111111111111111111110) (bvslt lt!228060 #b00000000000000000000000000000000) (bvsge lt!228060 (size!15911 a!3235)) (bvslt (index!18070 lt!228063) #b00000000000000000000000000000000) (bvsge (index!18070 lt!228063) (size!15911 a!3235)) (not (= lt!228063 (Intermediate!3970 false (index!18070 lt!228063) (x!47248 lt!228063))))))))

(assert (=> b!501863 (= (index!18070 lt!228063) i!1204)))

(declare-datatypes ((Unit!15115 0))(
  ( (Unit!15116) )
))
(declare-fun lt!228058 () Unit!15115)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15115)

(assert (=> b!501863 (= lt!228058 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228060 #b00000000000000000000000000000000 (index!18070 lt!228063) (x!47248 lt!228063) mask!3524))))

(assert (=> b!501863 (and (or (= (select (arr!15547 a!3235) (index!18070 lt!228063)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15547 a!3235) (index!18070 lt!228063)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15547 a!3235) (index!18070 lt!228063)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15547 a!3235) (index!18070 lt!228063)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228054 () Unit!15115)

(declare-fun e!293984 () Unit!15115)

(assert (=> b!501863 (= lt!228054 e!293984)))

(declare-fun c!59513 () Bool)

(assert (=> b!501863 (= c!59513 (= (select (arr!15547 a!3235) (index!18070 lt!228063)) (select (arr!15547 a!3235) j!176)))))

(assert (=> b!501863 (and (bvslt (x!47248 lt!228063) #b01111111111111111111111111111110) (or (= (select (arr!15547 a!3235) (index!18070 lt!228063)) (select (arr!15547 a!3235) j!176)) (= (select (arr!15547 a!3235) (index!18070 lt!228063)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15547 a!3235) (index!18070 lt!228063)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501864 () Bool)

(declare-fun e!293982 () Bool)

(assert (=> b!501864 (= e!293982 (not e!293986))))

(declare-fun res!303403 () Bool)

(assert (=> b!501864 (=> res!303403 e!293986)))

(declare-fun lt!228062 () (_ BitVec 32))

(assert (=> b!501864 (= res!303403 (= lt!228063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228062 lt!228055 lt!228059 mask!3524)))))

(assert (=> b!501864 (= lt!228063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228060 (select (arr!15547 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501864 (= lt!228062 (toIndex!0 lt!228055 mask!3524))))

(assert (=> b!501864 (= lt!228055 (select (store (arr!15547 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501864 (= lt!228060 (toIndex!0 (select (arr!15547 a!3235) j!176) mask!3524))))

(assert (=> b!501864 (= lt!228059 (array!32336 (store (arr!15547 a!3235) i!1204 k0!2280) (size!15911 a!3235)))))

(declare-fun e!293988 () Bool)

(assert (=> b!501864 e!293988))

(declare-fun res!303392 () Bool)

(assert (=> b!501864 (=> (not res!303392) (not e!293988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32335 (_ BitVec 32)) Bool)

(assert (=> b!501864 (= res!303392 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228061 () Unit!15115)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15115)

(assert (=> b!501864 (= lt!228061 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501865 () Bool)

(declare-fun res!303400 () Bool)

(assert (=> b!501865 (=> (not res!303400) (not e!293985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501865 (= res!303400 (validKeyInArray!0 (select (arr!15547 a!3235) j!176)))))

(declare-fun b!501866 () Bool)

(declare-fun res!303395 () Bool)

(assert (=> b!501866 (=> (not res!303395) (not e!293982))))

(assert (=> b!501866 (= res!303395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501867 () Bool)

(assert (=> b!501867 (= e!293985 e!293982)))

(declare-fun res!303393 () Bool)

(assert (=> b!501867 (=> (not res!303393) (not e!293982))))

(declare-fun lt!228057 () SeekEntryResult!3970)

(assert (=> b!501867 (= res!303393 (or (= lt!228057 (MissingZero!3970 i!1204)) (= lt!228057 (MissingVacant!3970 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32335 (_ BitVec 32)) SeekEntryResult!3970)

(assert (=> b!501867 (= lt!228057 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501868 () Bool)

(declare-fun Unit!15117 () Unit!15115)

(assert (=> b!501868 (= e!293984 Unit!15117)))

(declare-fun res!303406 () Bool)

(assert (=> start!45578 (=> (not res!303406) (not e!293985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45578 (= res!303406 (validMask!0 mask!3524))))

(assert (=> start!45578 e!293985))

(assert (=> start!45578 true))

(declare-fun array_inv!11406 (array!32335) Bool)

(assert (=> start!45578 (array_inv!11406 a!3235)))

(declare-fun b!501869 () Bool)

(declare-fun res!303394 () Bool)

(assert (=> b!501869 (=> res!303394 e!293981)))

(declare-fun e!293983 () Bool)

(assert (=> b!501869 (= res!303394 e!293983)))

(declare-fun res!303398 () Bool)

(assert (=> b!501869 (=> (not res!303398) (not e!293983))))

(assert (=> b!501869 (= res!303398 (bvsgt #b00000000000000000000000000000000 (x!47248 lt!228063)))))

(declare-fun b!501870 () Bool)

(declare-fun res!303401 () Bool)

(assert (=> b!501870 (=> res!303401 e!293986)))

(get-info :version)

(assert (=> b!501870 (= res!303401 (or (undefined!4782 lt!228063) (not ((_ is Intermediate!3970) lt!228063))))))

(declare-fun b!501871 () Bool)

(declare-fun Unit!15118 () Unit!15115)

(assert (=> b!501871 (= e!293984 Unit!15118)))

(declare-fun lt!228056 () Unit!15115)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15115)

(assert (=> b!501871 (= lt!228056 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228060 #b00000000000000000000000000000000 (index!18070 lt!228063) (x!47248 lt!228063) mask!3524))))

(declare-fun res!303404 () Bool)

(assert (=> b!501871 (= res!303404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228060 lt!228055 lt!228059 mask!3524) (Intermediate!3970 false (index!18070 lt!228063) (x!47248 lt!228063))))))

(declare-fun e!293980 () Bool)

(assert (=> b!501871 (=> (not res!303404) (not e!293980))))

(assert (=> b!501871 e!293980))

(declare-fun b!501872 () Bool)

(assert (=> b!501872 (= e!293980 false)))

(declare-fun b!501873 () Bool)

(declare-fun res!303405 () Bool)

(assert (=> b!501873 (=> (not res!303405) (not e!293985))))

(assert (=> b!501873 (= res!303405 (validKeyInArray!0 k0!2280))))

(declare-fun b!501874 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32335 (_ BitVec 32)) SeekEntryResult!3970)

(assert (=> b!501874 (= e!293983 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228060 (index!18070 lt!228063) (select (arr!15547 a!3235) j!176) a!3235 mask!3524) (Found!3970 j!176))))))

(declare-fun b!501875 () Bool)

(declare-fun res!303397 () Bool)

(assert (=> b!501875 (=> (not res!303397) (not e!293982))))

(declare-datatypes ((List!9612 0))(
  ( (Nil!9609) (Cons!9608 (h!10485 (_ BitVec 64)) (t!15832 List!9612)) )
))
(declare-fun arrayNoDuplicates!0 (array!32335 (_ BitVec 32) List!9612) Bool)

(assert (=> b!501875 (= res!303397 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9609))))

(declare-fun b!501876 () Bool)

(assert (=> b!501876 (= e!293988 (= (seekEntryOrOpen!0 (select (arr!15547 a!3235) j!176) a!3235 mask!3524) (Found!3970 j!176)))))

(declare-fun b!501877 () Bool)

(declare-fun res!303399 () Bool)

(assert (=> b!501877 (=> (not res!303399) (not e!293985))))

(declare-fun arrayContainsKey!0 (array!32335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501877 (= res!303399 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45578 res!303406) b!501861))

(assert (= (and b!501861 res!303402) b!501865))

(assert (= (and b!501865 res!303400) b!501873))

(assert (= (and b!501873 res!303405) b!501877))

(assert (= (and b!501877 res!303399) b!501867))

(assert (= (and b!501867 res!303393) b!501866))

(assert (= (and b!501866 res!303395) b!501875))

(assert (= (and b!501875 res!303397) b!501864))

(assert (= (and b!501864 res!303392) b!501876))

(assert (= (and b!501864 (not res!303403)) b!501870))

(assert (= (and b!501870 (not res!303401)) b!501863))

(assert (= (and b!501863 c!59513) b!501871))

(assert (= (and b!501863 (not c!59513)) b!501868))

(assert (= (and b!501871 res!303404) b!501872))

(assert (= (and b!501863 (not res!303396)) b!501869))

(assert (= (and b!501869 res!303398) b!501874))

(assert (= (and b!501869 (not res!303394)) b!501862))

(declare-fun m!483091 () Bool)

(assert (=> b!501877 m!483091))

(declare-fun m!483093 () Bool)

(assert (=> b!501871 m!483093))

(declare-fun m!483095 () Bool)

(assert (=> b!501871 m!483095))

(declare-fun m!483097 () Bool)

(assert (=> b!501863 m!483097))

(declare-fun m!483099 () Bool)

(assert (=> b!501863 m!483099))

(declare-fun m!483101 () Bool)

(assert (=> b!501863 m!483101))

(declare-fun m!483103 () Bool)

(assert (=> b!501873 m!483103))

(assert (=> b!501876 m!483101))

(assert (=> b!501876 m!483101))

(declare-fun m!483105 () Bool)

(assert (=> b!501876 m!483105))

(assert (=> b!501862 m!483095))

(declare-fun m!483107 () Bool)

(assert (=> b!501867 m!483107))

(assert (=> b!501865 m!483101))

(assert (=> b!501865 m!483101))

(declare-fun m!483109 () Bool)

(assert (=> b!501865 m!483109))

(assert (=> b!501874 m!483101))

(assert (=> b!501874 m!483101))

(declare-fun m!483111 () Bool)

(assert (=> b!501874 m!483111))

(declare-fun m!483113 () Bool)

(assert (=> b!501866 m!483113))

(declare-fun m!483115 () Bool)

(assert (=> b!501875 m!483115))

(declare-fun m!483117 () Bool)

(assert (=> b!501864 m!483117))

(declare-fun m!483119 () Bool)

(assert (=> b!501864 m!483119))

(declare-fun m!483121 () Bool)

(assert (=> b!501864 m!483121))

(declare-fun m!483123 () Bool)

(assert (=> b!501864 m!483123))

(assert (=> b!501864 m!483101))

(declare-fun m!483125 () Bool)

(assert (=> b!501864 m!483125))

(assert (=> b!501864 m!483101))

(declare-fun m!483127 () Bool)

(assert (=> b!501864 m!483127))

(declare-fun m!483129 () Bool)

(assert (=> b!501864 m!483129))

(assert (=> b!501864 m!483101))

(declare-fun m!483131 () Bool)

(assert (=> b!501864 m!483131))

(declare-fun m!483133 () Bool)

(assert (=> start!45578 m!483133))

(declare-fun m!483135 () Bool)

(assert (=> start!45578 m!483135))

(check-sat (not b!501871) (not b!501864) (not b!501875) (not b!501866) (not b!501873) (not b!501865) (not b!501877) (not start!45578) (not b!501862) (not b!501863) (not b!501867) (not b!501874) (not b!501876))
(check-sat)
