; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45362 () Bool)

(assert start!45362)

(declare-fun b!498272 () Bool)

(declare-datatypes ((Unit!14827 0))(
  ( (Unit!14828) )
))
(declare-fun e!292043 () Unit!14827)

(declare-fun Unit!14829 () Unit!14827)

(assert (=> b!498272 (= e!292043 Unit!14829)))

(declare-fun lt!225724 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3898 0))(
  ( (MissingZero!3898 (index!17774 (_ BitVec 32))) (Found!3898 (index!17775 (_ BitVec 32))) (Intermediate!3898 (undefined!4710 Bool) (index!17776 (_ BitVec 32)) (x!46972 (_ BitVec 32))) (Undefined!3898) (MissingVacant!3898 (index!17777 (_ BitVec 32))) )
))
(declare-fun lt!225726 () SeekEntryResult!3898)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32188 0))(
  ( (array!32189 (arr!15475 (Array (_ BitVec 32) (_ BitVec 64))) (size!15839 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32188)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!225727 () Unit!14827)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32188 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14827)

(assert (=> b!498272 (= lt!225727 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225724 #b00000000000000000000000000000000 (index!17776 lt!225726) (x!46972 lt!225726) mask!3524))))

(declare-fun res!300439 () Bool)

(declare-fun lt!225729 () (_ BitVec 64))

(declare-fun lt!225730 () array!32188)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32188 (_ BitVec 32)) SeekEntryResult!3898)

(assert (=> b!498272 (= res!300439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225724 lt!225729 lt!225730 mask!3524) (Intermediate!3898 false (index!17776 lt!225726) (x!46972 lt!225726))))))

(declare-fun e!292041 () Bool)

(assert (=> b!498272 (=> (not res!300439) (not e!292041))))

(assert (=> b!498272 e!292041))

(declare-fun b!498273 () Bool)

(declare-fun e!292045 () Bool)

(declare-fun e!292042 () Bool)

(assert (=> b!498273 (= e!292045 (not e!292042))))

(declare-fun res!300441 () Bool)

(assert (=> b!498273 (=> res!300441 e!292042)))

(declare-fun lt!225723 () (_ BitVec 32))

(assert (=> b!498273 (= res!300441 (= lt!225726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225723 lt!225729 lt!225730 mask!3524)))))

(assert (=> b!498273 (= lt!225726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225724 (select (arr!15475 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498273 (= lt!225723 (toIndex!0 lt!225729 mask!3524))))

(assert (=> b!498273 (= lt!225729 (select (store (arr!15475 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498273 (= lt!225724 (toIndex!0 (select (arr!15475 a!3235) j!176) mask!3524))))

(assert (=> b!498273 (= lt!225730 (array!32189 (store (arr!15475 a!3235) i!1204 k0!2280) (size!15839 a!3235)))))

(declare-fun e!292044 () Bool)

(assert (=> b!498273 e!292044))

(declare-fun res!300436 () Bool)

(assert (=> b!498273 (=> (not res!300436) (not e!292044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32188 (_ BitVec 32)) Bool)

(assert (=> b!498273 (= res!300436 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225721 () Unit!14827)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14827)

(assert (=> b!498273 (= lt!225721 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!300448 () Bool)

(declare-fun e!292046 () Bool)

(assert (=> start!45362 (=> (not res!300448) (not e!292046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45362 (= res!300448 (validMask!0 mask!3524))))

(assert (=> start!45362 e!292046))

(assert (=> start!45362 true))

(declare-fun array_inv!11334 (array!32188) Bool)

(assert (=> start!45362 (array_inv!11334 a!3235)))

(declare-fun b!498274 () Bool)

(declare-fun res!300442 () Bool)

(assert (=> b!498274 (=> (not res!300442) (not e!292045))))

(assert (=> b!498274 (= res!300442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498275 () Bool)

(declare-fun res!300446 () Bool)

(assert (=> b!498275 (=> res!300446 e!292042)))

(get-info :version)

(assert (=> b!498275 (= res!300446 (or (undefined!4710 lt!225726) (not ((_ is Intermediate!3898) lt!225726))))))

(declare-fun b!498276 () Bool)

(declare-fun res!300437 () Bool)

(assert (=> b!498276 (=> (not res!300437) (not e!292046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498276 (= res!300437 (validKeyInArray!0 (select (arr!15475 a!3235) j!176)))))

(declare-fun b!498277 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32188 (_ BitVec 32)) SeekEntryResult!3898)

(assert (=> b!498277 (= e!292044 (= (seekEntryOrOpen!0 (select (arr!15475 a!3235) j!176) a!3235 mask!3524) (Found!3898 j!176)))))

(declare-fun b!498278 () Bool)

(declare-fun res!300440 () Bool)

(assert (=> b!498278 (=> (not res!300440) (not e!292045))))

(declare-datatypes ((List!9540 0))(
  ( (Nil!9537) (Cons!9536 (h!10410 (_ BitVec 64)) (t!15760 List!9540)) )
))
(declare-fun arrayNoDuplicates!0 (array!32188 (_ BitVec 32) List!9540) Bool)

(assert (=> b!498278 (= res!300440 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9537))))

(declare-fun b!498279 () Bool)

(declare-fun res!300445 () Bool)

(assert (=> b!498279 (=> (not res!300445) (not e!292046))))

(assert (=> b!498279 (= res!300445 (and (= (size!15839 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15839 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15839 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498280 () Bool)

(declare-fun e!292040 () Bool)

(assert (=> b!498280 (= e!292042 e!292040)))

(declare-fun res!300438 () Bool)

(assert (=> b!498280 (=> res!300438 e!292040)))

(assert (=> b!498280 (= res!300438 (or (bvsgt #b00000000000000000000000000000000 (x!46972 lt!225726)) (bvsgt (x!46972 lt!225726) #b01111111111111111111111111111110) (bvslt lt!225724 #b00000000000000000000000000000000) (bvsge lt!225724 (size!15839 a!3235)) (bvslt (index!17776 lt!225726) #b00000000000000000000000000000000) (bvsge (index!17776 lt!225726) (size!15839 a!3235)) (not (= lt!225726 (Intermediate!3898 false (index!17776 lt!225726) (x!46972 lt!225726))))))))

(assert (=> b!498280 (and (or (= (select (arr!15475 a!3235) (index!17776 lt!225726)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15475 a!3235) (index!17776 lt!225726)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15475 a!3235) (index!17776 lt!225726)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15475 a!3235) (index!17776 lt!225726)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225728 () Unit!14827)

(assert (=> b!498280 (= lt!225728 e!292043)))

(declare-fun c!59195 () Bool)

(assert (=> b!498280 (= c!59195 (= (select (arr!15475 a!3235) (index!17776 lt!225726)) (select (arr!15475 a!3235) j!176)))))

(assert (=> b!498280 (and (bvslt (x!46972 lt!225726) #b01111111111111111111111111111110) (or (= (select (arr!15475 a!3235) (index!17776 lt!225726)) (select (arr!15475 a!3235) j!176)) (= (select (arr!15475 a!3235) (index!17776 lt!225726)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15475 a!3235) (index!17776 lt!225726)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498281 () Bool)

(assert (=> b!498281 (= e!292040 true)))

(declare-fun lt!225722 () SeekEntryResult!3898)

(assert (=> b!498281 (= lt!225722 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225724 lt!225729 lt!225730 mask!3524))))

(declare-fun b!498282 () Bool)

(assert (=> b!498282 (= e!292046 e!292045)))

(declare-fun res!300444 () Bool)

(assert (=> b!498282 (=> (not res!300444) (not e!292045))))

(declare-fun lt!225725 () SeekEntryResult!3898)

(assert (=> b!498282 (= res!300444 (or (= lt!225725 (MissingZero!3898 i!1204)) (= lt!225725 (MissingVacant!3898 i!1204))))))

(assert (=> b!498282 (= lt!225725 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498283 () Bool)

(assert (=> b!498283 (= e!292041 false)))

(declare-fun b!498284 () Bool)

(declare-fun res!300447 () Bool)

(assert (=> b!498284 (=> (not res!300447) (not e!292046))))

(declare-fun arrayContainsKey!0 (array!32188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498284 (= res!300447 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498285 () Bool)

(declare-fun res!300443 () Bool)

(assert (=> b!498285 (=> (not res!300443) (not e!292046))))

(assert (=> b!498285 (= res!300443 (validKeyInArray!0 k0!2280))))

(declare-fun b!498286 () Bool)

(declare-fun Unit!14830 () Unit!14827)

(assert (=> b!498286 (= e!292043 Unit!14830)))

(assert (= (and start!45362 res!300448) b!498279))

(assert (= (and b!498279 res!300445) b!498276))

(assert (= (and b!498276 res!300437) b!498285))

(assert (= (and b!498285 res!300443) b!498284))

(assert (= (and b!498284 res!300447) b!498282))

(assert (= (and b!498282 res!300444) b!498274))

(assert (= (and b!498274 res!300442) b!498278))

(assert (= (and b!498278 res!300440) b!498273))

(assert (= (and b!498273 res!300436) b!498277))

(assert (= (and b!498273 (not res!300441)) b!498275))

(assert (= (and b!498275 (not res!300446)) b!498280))

(assert (= (and b!498280 c!59195) b!498272))

(assert (= (and b!498280 (not c!59195)) b!498286))

(assert (= (and b!498272 res!300439) b!498283))

(assert (= (and b!498280 (not res!300438)) b!498281))

(declare-fun m!479791 () Bool)

(assert (=> b!498285 m!479791))

(declare-fun m!479793 () Bool)

(assert (=> b!498272 m!479793))

(declare-fun m!479795 () Bool)

(assert (=> b!498272 m!479795))

(declare-fun m!479797 () Bool)

(assert (=> b!498282 m!479797))

(declare-fun m!479799 () Bool)

(assert (=> b!498278 m!479799))

(declare-fun m!479801 () Bool)

(assert (=> b!498277 m!479801))

(assert (=> b!498277 m!479801))

(declare-fun m!479803 () Bool)

(assert (=> b!498277 m!479803))

(assert (=> b!498281 m!479795))

(declare-fun m!479805 () Bool)

(assert (=> b!498274 m!479805))

(declare-fun m!479807 () Bool)

(assert (=> b!498280 m!479807))

(assert (=> b!498280 m!479801))

(declare-fun m!479809 () Bool)

(assert (=> b!498284 m!479809))

(assert (=> b!498276 m!479801))

(assert (=> b!498276 m!479801))

(declare-fun m!479811 () Bool)

(assert (=> b!498276 m!479811))

(declare-fun m!479813 () Bool)

(assert (=> start!45362 m!479813))

(declare-fun m!479815 () Bool)

(assert (=> start!45362 m!479815))

(declare-fun m!479817 () Bool)

(assert (=> b!498273 m!479817))

(declare-fun m!479819 () Bool)

(assert (=> b!498273 m!479819))

(declare-fun m!479821 () Bool)

(assert (=> b!498273 m!479821))

(declare-fun m!479823 () Bool)

(assert (=> b!498273 m!479823))

(declare-fun m!479825 () Bool)

(assert (=> b!498273 m!479825))

(assert (=> b!498273 m!479801))

(declare-fun m!479827 () Bool)

(assert (=> b!498273 m!479827))

(assert (=> b!498273 m!479801))

(declare-fun m!479829 () Bool)

(assert (=> b!498273 m!479829))

(assert (=> b!498273 m!479801))

(declare-fun m!479831 () Bool)

(assert (=> b!498273 m!479831))

(check-sat (not b!498285) (not b!498276) (not start!45362) (not b!498272) (not b!498284) (not b!498274) (not b!498282) (not b!498277) (not b!498281) (not b!498278) (not b!498273))
(check-sat)
