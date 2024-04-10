; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48014 () Bool)

(assert start!48014)

(declare-fun b!528721 () Bool)

(declare-fun res!324686 () Bool)

(declare-fun e!308115 () Bool)

(assert (=> b!528721 (=> (not res!324686) (not e!308115))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528721 (= res!324686 (validKeyInArray!0 k0!2280))))

(declare-fun b!528722 () Bool)

(declare-fun res!324673 () Bool)

(assert (=> b!528722 (=> (not res!324673) (not e!308115))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33507 0))(
  ( (array!33508 (arr!16102 (Array (_ BitVec 32) (_ BitVec 64))) (size!16466 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33507)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!528722 (= res!324673 (and (= (size!16466 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16466 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16466 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528723 () Bool)

(declare-fun e!308120 () Bool)

(declare-fun e!308119 () Bool)

(assert (=> b!528723 (= e!308120 (not e!308119))))

(declare-fun res!324683 () Bool)

(assert (=> b!528723 (=> res!324683 e!308119)))

(declare-datatypes ((SeekEntryResult!4569 0))(
  ( (MissingZero!4569 (index!20500 (_ BitVec 32))) (Found!4569 (index!20501 (_ BitVec 32))) (Intermediate!4569 (undefined!5381 Bool) (index!20502 (_ BitVec 32)) (x!49473 (_ BitVec 32))) (Undefined!4569) (MissingVacant!4569 (index!20503 (_ BitVec 32))) )
))
(declare-fun lt!243571 () SeekEntryResult!4569)

(declare-fun lt!243561 () SeekEntryResult!4569)

(get-info :version)

(assert (=> b!528723 (= res!324683 (or (= lt!243571 lt!243561) (undefined!5381 lt!243571) (not ((_ is Intermediate!4569) lt!243571))))))

(declare-fun lt!243569 () (_ BitVec 64))

(declare-fun lt!243570 () array!33507)

(declare-fun lt!243565 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33507 (_ BitVec 32)) SeekEntryResult!4569)

(assert (=> b!528723 (= lt!243561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243565 lt!243569 lt!243570 mask!3524))))

(declare-fun lt!243568 () (_ BitVec 32))

(assert (=> b!528723 (= lt!243571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243568 (select (arr!16102 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528723 (= lt!243565 (toIndex!0 lt!243569 mask!3524))))

(assert (=> b!528723 (= lt!243569 (select (store (arr!16102 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528723 (= lt!243568 (toIndex!0 (select (arr!16102 a!3235) j!176) mask!3524))))

(assert (=> b!528723 (= lt!243570 (array!33508 (store (arr!16102 a!3235) i!1204 k0!2280) (size!16466 a!3235)))))

(declare-fun lt!243566 () SeekEntryResult!4569)

(assert (=> b!528723 (= lt!243566 (Found!4569 j!176))))

(declare-fun e!308121 () Bool)

(assert (=> b!528723 e!308121))

(declare-fun res!324680 () Bool)

(assert (=> b!528723 (=> (not res!324680) (not e!308121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33507 (_ BitVec 32)) Bool)

(assert (=> b!528723 (= res!324680 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16728 0))(
  ( (Unit!16729) )
))
(declare-fun lt!243564 () Unit!16728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16728)

(assert (=> b!528723 (= lt!243564 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!324679 () Bool)

(assert (=> start!48014 (=> (not res!324679) (not e!308115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48014 (= res!324679 (validMask!0 mask!3524))))

(assert (=> start!48014 e!308115))

(assert (=> start!48014 true))

(declare-fun array_inv!11898 (array!33507) Bool)

(assert (=> start!48014 (array_inv!11898 a!3235)))

(declare-fun b!528724 () Bool)

(declare-fun res!324685 () Bool)

(assert (=> b!528724 (=> (not res!324685) (not e!308115))))

(assert (=> b!528724 (= res!324685 (validKeyInArray!0 (select (arr!16102 a!3235) j!176)))))

(declare-fun b!528725 () Bool)

(declare-fun res!324675 () Bool)

(assert (=> b!528725 (=> (not res!324675) (not e!308120))))

(declare-datatypes ((List!10260 0))(
  ( (Nil!10257) (Cons!10256 (h!11193 (_ BitVec 64)) (t!16488 List!10260)) )
))
(declare-fun arrayNoDuplicates!0 (array!33507 (_ BitVec 32) List!10260) Bool)

(assert (=> b!528725 (= res!324675 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10257))))

(declare-fun b!528726 () Bool)

(declare-fun res!324674 () Bool)

(assert (=> b!528726 (=> (not res!324674) (not e!308120))))

(assert (=> b!528726 (= res!324674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528727 () Bool)

(declare-fun e!308117 () Unit!16728)

(declare-fun Unit!16730 () Unit!16728)

(assert (=> b!528727 (= e!308117 Unit!16730)))

(declare-fun lt!243560 () Unit!16728)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16728)

(assert (=> b!528727 (= lt!243560 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243568 #b00000000000000000000000000000000 (index!20502 lt!243571) (x!49473 lt!243571) mask!3524))))

(declare-fun res!324678 () Bool)

(assert (=> b!528727 (= res!324678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243568 lt!243569 lt!243570 mask!3524) (Intermediate!4569 false (index!20502 lt!243571) (x!49473 lt!243571))))))

(declare-fun e!308116 () Bool)

(assert (=> b!528727 (=> (not res!324678) (not e!308116))))

(assert (=> b!528727 e!308116))

(declare-fun b!528728 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33507 (_ BitVec 32)) SeekEntryResult!4569)

(assert (=> b!528728 (= e!308121 (= (seekEntryOrOpen!0 (select (arr!16102 a!3235) j!176) a!3235 mask!3524) (Found!4569 j!176)))))

(declare-fun b!528729 () Bool)

(declare-fun res!324677 () Bool)

(declare-fun e!308118 () Bool)

(assert (=> b!528729 (=> res!324677 e!308118)))

(assert (=> b!528729 (= res!324677 (not (= lt!243561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243568 lt!243569 lt!243570 mask!3524))))))

(declare-fun b!528730 () Bool)

(declare-fun Unit!16731 () Unit!16728)

(assert (=> b!528730 (= e!308117 Unit!16731)))

(declare-fun b!528731 () Bool)

(assert (=> b!528731 (= e!308116 false)))

(declare-fun b!528732 () Bool)

(declare-fun res!324684 () Bool)

(assert (=> b!528732 (=> res!324684 e!308118)))

(declare-fun e!308114 () Bool)

(assert (=> b!528732 (= res!324684 e!308114)))

(declare-fun res!324676 () Bool)

(assert (=> b!528732 (=> (not res!324676) (not e!308114))))

(assert (=> b!528732 (= res!324676 (bvsgt #b00000000000000000000000000000000 (x!49473 lt!243571)))))

(declare-fun b!528733 () Bool)

(assert (=> b!528733 (= e!308115 e!308120)))

(declare-fun res!324681 () Bool)

(assert (=> b!528733 (=> (not res!324681) (not e!308120))))

(declare-fun lt!243563 () SeekEntryResult!4569)

(assert (=> b!528733 (= res!324681 (or (= lt!243563 (MissingZero!4569 i!1204)) (= lt!243563 (MissingVacant!4569 i!1204))))))

(assert (=> b!528733 (= lt!243563 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528734 () Bool)

(assert (=> b!528734 (= e!308119 e!308118)))

(declare-fun res!324672 () Bool)

(assert (=> b!528734 (=> res!324672 e!308118)))

(assert (=> b!528734 (= res!324672 (or (bvsgt (x!49473 lt!243571) #b01111111111111111111111111111110) (bvslt lt!243568 #b00000000000000000000000000000000) (bvsge lt!243568 (size!16466 a!3235)) (bvslt (index!20502 lt!243571) #b00000000000000000000000000000000) (bvsge (index!20502 lt!243571) (size!16466 a!3235)) (not (= lt!243571 (Intermediate!4569 false (index!20502 lt!243571) (x!49473 lt!243571))))))))

(assert (=> b!528734 (= (index!20502 lt!243571) i!1204)))

(declare-fun lt!243562 () Unit!16728)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16728)

(assert (=> b!528734 (= lt!243562 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243568 #b00000000000000000000000000000000 (index!20502 lt!243571) (x!49473 lt!243571) mask!3524))))

(assert (=> b!528734 (and (or (= (select (arr!16102 a!3235) (index!20502 lt!243571)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16102 a!3235) (index!20502 lt!243571)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16102 a!3235) (index!20502 lt!243571)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16102 a!3235) (index!20502 lt!243571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243559 () Unit!16728)

(assert (=> b!528734 (= lt!243559 e!308117)))

(declare-fun c!62333 () Bool)

(assert (=> b!528734 (= c!62333 (= (select (arr!16102 a!3235) (index!20502 lt!243571)) (select (arr!16102 a!3235) j!176)))))

(assert (=> b!528734 (and (bvslt (x!49473 lt!243571) #b01111111111111111111111111111110) (or (= (select (arr!16102 a!3235) (index!20502 lt!243571)) (select (arr!16102 a!3235) j!176)) (= (select (arr!16102 a!3235) (index!20502 lt!243571)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16102 a!3235) (index!20502 lt!243571)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528735 () Bool)

(declare-fun res!324682 () Bool)

(assert (=> b!528735 (=> (not res!324682) (not e!308115))))

(declare-fun arrayContainsKey!0 (array!33507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528735 (= res!324682 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528736 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33507 (_ BitVec 32)) SeekEntryResult!4569)

(assert (=> b!528736 (= e!308114 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243568 (index!20502 lt!243571) (select (arr!16102 a!3235) j!176) a!3235 mask!3524) lt!243566)))))

(declare-fun b!528737 () Bool)

(assert (=> b!528737 (= e!308118 true)))

(assert (=> b!528737 (= (seekEntryOrOpen!0 lt!243569 lt!243570 mask!3524) lt!243566)))

(declare-fun lt!243567 () Unit!16728)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16728)

(assert (=> b!528737 (= lt!243567 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243568 #b00000000000000000000000000000000 (index!20502 lt!243571) (x!49473 lt!243571) mask!3524))))

(assert (= (and start!48014 res!324679) b!528722))

(assert (= (and b!528722 res!324673) b!528724))

(assert (= (and b!528724 res!324685) b!528721))

(assert (= (and b!528721 res!324686) b!528735))

(assert (= (and b!528735 res!324682) b!528733))

(assert (= (and b!528733 res!324681) b!528726))

(assert (= (and b!528726 res!324674) b!528725))

(assert (= (and b!528725 res!324675) b!528723))

(assert (= (and b!528723 res!324680) b!528728))

(assert (= (and b!528723 (not res!324683)) b!528734))

(assert (= (and b!528734 c!62333) b!528727))

(assert (= (and b!528734 (not c!62333)) b!528730))

(assert (= (and b!528727 res!324678) b!528731))

(assert (= (and b!528734 (not res!324672)) b!528732))

(assert (= (and b!528732 res!324676) b!528736))

(assert (= (and b!528732 (not res!324684)) b!528729))

(assert (= (and b!528729 (not res!324677)) b!528737))

(declare-fun m!509255 () Bool)

(assert (=> b!528724 m!509255))

(assert (=> b!528724 m!509255))

(declare-fun m!509257 () Bool)

(assert (=> b!528724 m!509257))

(declare-fun m!509259 () Bool)

(assert (=> b!528733 m!509259))

(declare-fun m!509261 () Bool)

(assert (=> b!528721 m!509261))

(declare-fun m!509263 () Bool)

(assert (=> b!528725 m!509263))

(declare-fun m!509265 () Bool)

(assert (=> start!48014 m!509265))

(declare-fun m!509267 () Bool)

(assert (=> start!48014 m!509267))

(declare-fun m!509269 () Bool)

(assert (=> b!528734 m!509269))

(declare-fun m!509271 () Bool)

(assert (=> b!528734 m!509271))

(assert (=> b!528734 m!509255))

(declare-fun m!509273 () Bool)

(assert (=> b!528729 m!509273))

(declare-fun m!509275 () Bool)

(assert (=> b!528726 m!509275))

(declare-fun m!509277 () Bool)

(assert (=> b!528735 m!509277))

(assert (=> b!528736 m!509255))

(assert (=> b!528736 m!509255))

(declare-fun m!509279 () Bool)

(assert (=> b!528736 m!509279))

(declare-fun m!509281 () Bool)

(assert (=> b!528727 m!509281))

(assert (=> b!528727 m!509273))

(assert (=> b!528728 m!509255))

(assert (=> b!528728 m!509255))

(declare-fun m!509283 () Bool)

(assert (=> b!528728 m!509283))

(declare-fun m!509285 () Bool)

(assert (=> b!528723 m!509285))

(declare-fun m!509287 () Bool)

(assert (=> b!528723 m!509287))

(declare-fun m!509289 () Bool)

(assert (=> b!528723 m!509289))

(declare-fun m!509291 () Bool)

(assert (=> b!528723 m!509291))

(declare-fun m!509293 () Bool)

(assert (=> b!528723 m!509293))

(assert (=> b!528723 m!509255))

(declare-fun m!509295 () Bool)

(assert (=> b!528723 m!509295))

(declare-fun m!509297 () Bool)

(assert (=> b!528723 m!509297))

(assert (=> b!528723 m!509255))

(declare-fun m!509299 () Bool)

(assert (=> b!528723 m!509299))

(assert (=> b!528723 m!509255))

(declare-fun m!509301 () Bool)

(assert (=> b!528737 m!509301))

(declare-fun m!509303 () Bool)

(assert (=> b!528737 m!509303))

(check-sat (not b!528726) (not b!528734) (not b!528728) (not b!528729) (not b!528724) (not b!528736) (not start!48014) (not b!528737) (not b!528727) (not b!528733) (not b!528723) (not b!528721) (not b!528725) (not b!528735))
(check-sat)
