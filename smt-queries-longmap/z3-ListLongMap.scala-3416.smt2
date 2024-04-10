; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47420 () Bool)

(assert start!47420)

(declare-fun b!521788 () Bool)

(declare-fun res!319545 () Bool)

(declare-fun e!304391 () Bool)

(assert (=> b!521788 (=> (not res!319545) (not e!304391))))

(declare-datatypes ((array!33246 0))(
  ( (array!33247 (arr!15979 (Array (_ BitVec 32) (_ BitVec 64))) (size!16343 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33246)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521788 (= res!319545 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521789 () Bool)

(declare-fun res!319542 () Bool)

(assert (=> b!521789 (=> (not res!319542) (not e!304391))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521789 (= res!319542 (validKeyInArray!0 (select (arr!15979 a!3235) j!176)))))

(declare-fun b!521790 () Bool)

(declare-fun res!319536 () Bool)

(assert (=> b!521790 (=> (not res!319536) (not e!304391))))

(assert (=> b!521790 (= res!319536 (validKeyInArray!0 k0!2280))))

(declare-fun b!521791 () Bool)

(declare-fun res!319546 () Bool)

(declare-fun e!304389 () Bool)

(assert (=> b!521791 (=> (not res!319546) (not e!304389))))

(declare-datatypes ((List!10137 0))(
  ( (Nil!10134) (Cons!10133 (h!11055 (_ BitVec 64)) (t!16365 List!10137)) )
))
(declare-fun arrayNoDuplicates!0 (array!33246 (_ BitVec 32) List!10137) Bool)

(assert (=> b!521791 (= res!319546 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10134))))

(declare-fun e!304393 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!521792 () Bool)

(declare-datatypes ((SeekEntryResult!4446 0))(
  ( (MissingZero!4446 (index!19987 (_ BitVec 32))) (Found!4446 (index!19988 (_ BitVec 32))) (Intermediate!4446 (undefined!5258 Bool) (index!19989 (_ BitVec 32)) (x!48968 (_ BitVec 32))) (Undefined!4446) (MissingVacant!4446 (index!19990 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33246 (_ BitVec 32)) SeekEntryResult!4446)

(assert (=> b!521792 (= e!304393 (= (seekEntryOrOpen!0 (select (arr!15979 a!3235) j!176) a!3235 mask!3524) (Found!4446 j!176)))))

(declare-fun b!521793 () Bool)

(declare-fun e!304392 () Bool)

(assert (=> b!521793 (= e!304389 (not e!304392))))

(declare-fun res!319539 () Bool)

(assert (=> b!521793 (=> res!319539 e!304392)))

(declare-fun lt!239184 () array!33246)

(declare-fun lt!239186 () (_ BitVec 32))

(declare-fun lt!239191 () (_ BitVec 64))

(declare-fun lt!239185 () SeekEntryResult!4446)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33246 (_ BitVec 32)) SeekEntryResult!4446)

(assert (=> b!521793 (= res!319539 (= lt!239185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239186 lt!239191 lt!239184 mask!3524)))))

(declare-fun lt!239188 () (_ BitVec 32))

(assert (=> b!521793 (= lt!239185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239188 (select (arr!15979 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521793 (= lt!239186 (toIndex!0 lt!239191 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521793 (= lt!239191 (select (store (arr!15979 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521793 (= lt!239188 (toIndex!0 (select (arr!15979 a!3235) j!176) mask!3524))))

(assert (=> b!521793 (= lt!239184 (array!33247 (store (arr!15979 a!3235) i!1204 k0!2280) (size!16343 a!3235)))))

(assert (=> b!521793 e!304393))

(declare-fun res!319547 () Bool)

(assert (=> b!521793 (=> (not res!319547) (not e!304393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33246 (_ BitVec 32)) Bool)

(assert (=> b!521793 (= res!319547 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16236 0))(
  ( (Unit!16237) )
))
(declare-fun lt!239190 () Unit!16236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16236)

(assert (=> b!521793 (= lt!239190 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521794 () Bool)

(declare-fun e!304390 () Unit!16236)

(declare-fun Unit!16238 () Unit!16236)

(assert (=> b!521794 (= e!304390 Unit!16238)))

(declare-fun b!521795 () Bool)

(declare-fun res!319538 () Bool)

(assert (=> b!521795 (=> res!319538 e!304392)))

(get-info :version)

(assert (=> b!521795 (= res!319538 (or (undefined!5258 lt!239185) (not ((_ is Intermediate!4446) lt!239185))))))

(declare-fun b!521796 () Bool)

(declare-fun res!319537 () Bool)

(assert (=> b!521796 (=> (not res!319537) (not e!304389))))

(assert (=> b!521796 (= res!319537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521797 () Bool)

(declare-fun res!319541 () Bool)

(assert (=> b!521797 (=> (not res!319541) (not e!304391))))

(assert (=> b!521797 (= res!319541 (and (= (size!16343 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16343 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16343 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!319540 () Bool)

(assert (=> start!47420 (=> (not res!319540) (not e!304391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47420 (= res!319540 (validMask!0 mask!3524))))

(assert (=> start!47420 e!304391))

(assert (=> start!47420 true))

(declare-fun array_inv!11775 (array!33246) Bool)

(assert (=> start!47420 (array_inv!11775 a!3235)))

(declare-fun b!521798 () Bool)

(declare-fun e!304395 () Bool)

(assert (=> b!521798 (= e!304395 false)))

(declare-fun b!521799 () Bool)

(assert (=> b!521799 (= e!304392 true)))

(assert (=> b!521799 (and (or (= (select (arr!15979 a!3235) (index!19989 lt!239185)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15979 a!3235) (index!19989 lt!239185)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15979 a!3235) (index!19989 lt!239185)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15979 a!3235) (index!19989 lt!239185)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239187 () Unit!16236)

(assert (=> b!521799 (= lt!239187 e!304390)))

(declare-fun c!61427 () Bool)

(assert (=> b!521799 (= c!61427 (= (select (arr!15979 a!3235) (index!19989 lt!239185)) (select (arr!15979 a!3235) j!176)))))

(assert (=> b!521799 (and (bvslt (x!48968 lt!239185) #b01111111111111111111111111111110) (or (= (select (arr!15979 a!3235) (index!19989 lt!239185)) (select (arr!15979 a!3235) j!176)) (= (select (arr!15979 a!3235) (index!19989 lt!239185)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15979 a!3235) (index!19989 lt!239185)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521800 () Bool)

(declare-fun Unit!16239 () Unit!16236)

(assert (=> b!521800 (= e!304390 Unit!16239)))

(declare-fun lt!239183 () Unit!16236)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33246 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16236)

(assert (=> b!521800 (= lt!239183 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239188 #b00000000000000000000000000000000 (index!19989 lt!239185) (x!48968 lt!239185) mask!3524))))

(declare-fun res!319544 () Bool)

(assert (=> b!521800 (= res!319544 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239188 lt!239191 lt!239184 mask!3524) (Intermediate!4446 false (index!19989 lt!239185) (x!48968 lt!239185))))))

(assert (=> b!521800 (=> (not res!319544) (not e!304395))))

(assert (=> b!521800 e!304395))

(declare-fun b!521801 () Bool)

(assert (=> b!521801 (= e!304391 e!304389)))

(declare-fun res!319543 () Bool)

(assert (=> b!521801 (=> (not res!319543) (not e!304389))))

(declare-fun lt!239189 () SeekEntryResult!4446)

(assert (=> b!521801 (= res!319543 (or (= lt!239189 (MissingZero!4446 i!1204)) (= lt!239189 (MissingVacant!4446 i!1204))))))

(assert (=> b!521801 (= lt!239189 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!47420 res!319540) b!521797))

(assert (= (and b!521797 res!319541) b!521789))

(assert (= (and b!521789 res!319542) b!521790))

(assert (= (and b!521790 res!319536) b!521788))

(assert (= (and b!521788 res!319545) b!521801))

(assert (= (and b!521801 res!319543) b!521796))

(assert (= (and b!521796 res!319537) b!521791))

(assert (= (and b!521791 res!319546) b!521793))

(assert (= (and b!521793 res!319547) b!521792))

(assert (= (and b!521793 (not res!319539)) b!521795))

(assert (= (and b!521795 (not res!319538)) b!521799))

(assert (= (and b!521799 c!61427) b!521800))

(assert (= (and b!521799 (not c!61427)) b!521794))

(assert (= (and b!521800 res!319544) b!521798))

(declare-fun m!502701 () Bool)

(assert (=> b!521796 m!502701))

(declare-fun m!502703 () Bool)

(assert (=> b!521793 m!502703))

(declare-fun m!502705 () Bool)

(assert (=> b!521793 m!502705))

(declare-fun m!502707 () Bool)

(assert (=> b!521793 m!502707))

(declare-fun m!502709 () Bool)

(assert (=> b!521793 m!502709))

(declare-fun m!502711 () Bool)

(assert (=> b!521793 m!502711))

(declare-fun m!502713 () Bool)

(assert (=> b!521793 m!502713))

(declare-fun m!502715 () Bool)

(assert (=> b!521793 m!502715))

(declare-fun m!502717 () Bool)

(assert (=> b!521793 m!502717))

(assert (=> b!521793 m!502713))

(declare-fun m!502719 () Bool)

(assert (=> b!521793 m!502719))

(assert (=> b!521793 m!502713))

(declare-fun m!502721 () Bool)

(assert (=> start!47420 m!502721))

(declare-fun m!502723 () Bool)

(assert (=> start!47420 m!502723))

(declare-fun m!502725 () Bool)

(assert (=> b!521799 m!502725))

(assert (=> b!521799 m!502713))

(declare-fun m!502727 () Bool)

(assert (=> b!521800 m!502727))

(declare-fun m!502729 () Bool)

(assert (=> b!521800 m!502729))

(declare-fun m!502731 () Bool)

(assert (=> b!521788 m!502731))

(declare-fun m!502733 () Bool)

(assert (=> b!521790 m!502733))

(declare-fun m!502735 () Bool)

(assert (=> b!521801 m!502735))

(assert (=> b!521789 m!502713))

(assert (=> b!521789 m!502713))

(declare-fun m!502737 () Bool)

(assert (=> b!521789 m!502737))

(assert (=> b!521792 m!502713))

(assert (=> b!521792 m!502713))

(declare-fun m!502739 () Bool)

(assert (=> b!521792 m!502739))

(declare-fun m!502741 () Bool)

(assert (=> b!521791 m!502741))

(check-sat (not b!521796) (not b!521793) (not b!521800) (not b!521788) (not b!521791) (not b!521789) (not b!521790) (not b!521792) (not start!47420) (not b!521801))
(check-sat)
