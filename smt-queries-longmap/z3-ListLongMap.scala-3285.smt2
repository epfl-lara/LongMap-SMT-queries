; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45642 () Bool)

(assert start!45642)

(declare-fun b!503334 () Bool)

(declare-datatypes ((Unit!15262 0))(
  ( (Unit!15263) )
))
(declare-fun e!294743 () Unit!15262)

(declare-fun Unit!15264 () Unit!15262)

(assert (=> b!503334 (= e!294743 Unit!15264)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32408 0))(
  ( (array!32409 (arr!15584 (Array (_ BitVec 32) (_ BitVec 64))) (size!15949 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32408)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4048 0))(
  ( (MissingZero!4048 (index!18380 (_ BitVec 32))) (Found!4048 (index!18381 (_ BitVec 32))) (Intermediate!4048 (undefined!4860 Bool) (index!18382 (_ BitVec 32)) (x!47412 (_ BitVec 32))) (Undefined!4048) (MissingVacant!4048 (index!18383 (_ BitVec 32))) )
))
(declare-fun lt!228906 () SeekEntryResult!4048)

(declare-fun lt!228900 () (_ BitVec 32))

(declare-fun lt!228897 () Unit!15262)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32408 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15262)

(assert (=> b!503334 (= lt!228897 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228900 #b00000000000000000000000000000000 (index!18382 lt!228906) (x!47412 lt!228906) mask!3524))))

(declare-fun res!304767 () Bool)

(declare-fun lt!228898 () (_ BitVec 64))

(declare-fun lt!228899 () array!32408)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32408 (_ BitVec 32)) SeekEntryResult!4048)

(assert (=> b!503334 (= res!304767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228900 lt!228898 lt!228899 mask!3524) (Intermediate!4048 false (index!18382 lt!228906) (x!47412 lt!228906))))))

(declare-fun e!294744 () Bool)

(assert (=> b!503334 (=> (not res!304767) (not e!294744))))

(assert (=> b!503334 e!294744))

(declare-fun b!503335 () Bool)

(assert (=> b!503335 (= e!294744 false)))

(declare-fun res!304756 () Bool)

(declare-fun e!294738 () Bool)

(assert (=> start!45642 (=> (not res!304756) (not e!294738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45642 (= res!304756 (validMask!0 mask!3524))))

(assert (=> start!45642 e!294738))

(assert (=> start!45642 true))

(declare-fun array_inv!11467 (array!32408) Bool)

(assert (=> start!45642 (array_inv!11467 a!3235)))

(declare-fun b!503336 () Bool)

(declare-fun res!304755 () Bool)

(declare-fun e!294740 () Bool)

(assert (=> b!503336 (=> (not res!304755) (not e!294740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32408 (_ BitVec 32)) Bool)

(assert (=> b!503336 (= res!304755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503337 () Bool)

(declare-fun e!294737 () Bool)

(assert (=> b!503337 (= e!294737 true)))

(declare-fun lt!228902 () SeekEntryResult!4048)

(assert (=> b!503337 (= lt!228902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228900 lt!228898 lt!228899 mask!3524))))

(declare-fun b!503338 () Bool)

(assert (=> b!503338 (= e!294738 e!294740)))

(declare-fun res!304765 () Bool)

(assert (=> b!503338 (=> (not res!304765) (not e!294740))))

(declare-fun lt!228903 () SeekEntryResult!4048)

(assert (=> b!503338 (= res!304765 (or (= lt!228903 (MissingZero!4048 i!1204)) (= lt!228903 (MissingVacant!4048 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32408 (_ BitVec 32)) SeekEntryResult!4048)

(assert (=> b!503338 (= lt!228903 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503339 () Bool)

(declare-fun res!304768 () Bool)

(assert (=> b!503339 (=> (not res!304768) (not e!294738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503339 (= res!304768 (validKeyInArray!0 (select (arr!15584 a!3235) j!176)))))

(declare-fun b!503340 () Bool)

(declare-fun Unit!15265 () Unit!15262)

(assert (=> b!503340 (= e!294743 Unit!15265)))

(declare-fun b!503341 () Bool)

(declare-fun res!304766 () Bool)

(assert (=> b!503341 (=> (not res!304766) (not e!294738))))

(assert (=> b!503341 (= res!304766 (and (= (size!15949 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15949 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15949 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503342 () Bool)

(declare-fun res!304762 () Bool)

(declare-fun e!294741 () Bool)

(assert (=> b!503342 (=> res!304762 e!294741)))

(get-info :version)

(assert (=> b!503342 (= res!304762 (or (undefined!4860 lt!228906) (not ((_ is Intermediate!4048) lt!228906))))))

(declare-fun b!503343 () Bool)

(declare-fun e!294742 () Bool)

(assert (=> b!503343 (= e!294742 (= (seekEntryOrOpen!0 (select (arr!15584 a!3235) j!176) a!3235 mask!3524) (Found!4048 j!176)))))

(declare-fun b!503344 () Bool)

(declare-fun res!304763 () Bool)

(assert (=> b!503344 (=> (not res!304763) (not e!294738))))

(assert (=> b!503344 (= res!304763 (validKeyInArray!0 k0!2280))))

(declare-fun b!503345 () Bool)

(assert (=> b!503345 (= e!294740 (not e!294741))))

(declare-fun res!304764 () Bool)

(assert (=> b!503345 (=> res!304764 e!294741)))

(declare-fun lt!228905 () (_ BitVec 32))

(assert (=> b!503345 (= res!304764 (= lt!228906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228905 lt!228898 lt!228899 mask!3524)))))

(assert (=> b!503345 (= lt!228906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228900 (select (arr!15584 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503345 (= lt!228905 (toIndex!0 lt!228898 mask!3524))))

(assert (=> b!503345 (= lt!228898 (select (store (arr!15584 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503345 (= lt!228900 (toIndex!0 (select (arr!15584 a!3235) j!176) mask!3524))))

(assert (=> b!503345 (= lt!228899 (array!32409 (store (arr!15584 a!3235) i!1204 k0!2280) (size!15949 a!3235)))))

(assert (=> b!503345 e!294742))

(declare-fun res!304759 () Bool)

(assert (=> b!503345 (=> (not res!304759) (not e!294742))))

(assert (=> b!503345 (= res!304759 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228904 () Unit!15262)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15262)

(assert (=> b!503345 (= lt!228904 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503346 () Bool)

(declare-fun res!304760 () Bool)

(assert (=> b!503346 (=> res!304760 e!294737)))

(declare-fun e!294739 () Bool)

(assert (=> b!503346 (= res!304760 e!294739)))

(declare-fun res!304757 () Bool)

(assert (=> b!503346 (=> (not res!304757) (not e!294739))))

(assert (=> b!503346 (= res!304757 (bvsgt #b00000000000000000000000000000000 (x!47412 lt!228906)))))

(declare-fun b!503347 () Bool)

(declare-fun res!304758 () Bool)

(assert (=> b!503347 (=> (not res!304758) (not e!294738))))

(declare-fun arrayContainsKey!0 (array!32408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503347 (= res!304758 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503348 () Bool)

(declare-fun res!304769 () Bool)

(assert (=> b!503348 (=> (not res!304769) (not e!294740))))

(declare-datatypes ((List!9781 0))(
  ( (Nil!9778) (Cons!9777 (h!10654 (_ BitVec 64)) (t!16000 List!9781)) )
))
(declare-fun arrayNoDuplicates!0 (array!32408 (_ BitVec 32) List!9781) Bool)

(assert (=> b!503348 (= res!304769 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9778))))

(declare-fun b!503349 () Bool)

(assert (=> b!503349 (= e!294741 e!294737)))

(declare-fun res!304761 () Bool)

(assert (=> b!503349 (=> res!304761 e!294737)))

(assert (=> b!503349 (= res!304761 (or (bvsgt (x!47412 lt!228906) #b01111111111111111111111111111110) (bvslt lt!228900 #b00000000000000000000000000000000) (bvsge lt!228900 (size!15949 a!3235)) (bvslt (index!18382 lt!228906) #b00000000000000000000000000000000) (bvsge (index!18382 lt!228906) (size!15949 a!3235)) (not (= lt!228906 (Intermediate!4048 false (index!18382 lt!228906) (x!47412 lt!228906))))))))

(assert (=> b!503349 (= (index!18382 lt!228906) i!1204)))

(declare-fun lt!228907 () Unit!15262)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32408 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15262)

(assert (=> b!503349 (= lt!228907 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228900 #b00000000000000000000000000000000 (index!18382 lt!228906) (x!47412 lt!228906) mask!3524))))

(assert (=> b!503349 (and (or (= (select (arr!15584 a!3235) (index!18382 lt!228906)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15584 a!3235) (index!18382 lt!228906)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15584 a!3235) (index!18382 lt!228906)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15584 a!3235) (index!18382 lt!228906)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228901 () Unit!15262)

(assert (=> b!503349 (= lt!228901 e!294743)))

(declare-fun c!59568 () Bool)

(assert (=> b!503349 (= c!59568 (= (select (arr!15584 a!3235) (index!18382 lt!228906)) (select (arr!15584 a!3235) j!176)))))

(assert (=> b!503349 (and (bvslt (x!47412 lt!228906) #b01111111111111111111111111111110) (or (= (select (arr!15584 a!3235) (index!18382 lt!228906)) (select (arr!15584 a!3235) j!176)) (= (select (arr!15584 a!3235) (index!18382 lt!228906)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15584 a!3235) (index!18382 lt!228906)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503350 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32408 (_ BitVec 32)) SeekEntryResult!4048)

(assert (=> b!503350 (= e!294739 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228900 (index!18382 lt!228906) (select (arr!15584 a!3235) j!176) a!3235 mask!3524) (Found!4048 j!176))))))

(assert (= (and start!45642 res!304756) b!503341))

(assert (= (and b!503341 res!304766) b!503339))

(assert (= (and b!503339 res!304768) b!503344))

(assert (= (and b!503344 res!304763) b!503347))

(assert (= (and b!503347 res!304758) b!503338))

(assert (= (and b!503338 res!304765) b!503336))

(assert (= (and b!503336 res!304755) b!503348))

(assert (= (and b!503348 res!304769) b!503345))

(assert (= (and b!503345 res!304759) b!503343))

(assert (= (and b!503345 (not res!304764)) b!503342))

(assert (= (and b!503342 (not res!304762)) b!503349))

(assert (= (and b!503349 c!59568) b!503334))

(assert (= (and b!503349 (not c!59568)) b!503340))

(assert (= (and b!503334 res!304767) b!503335))

(assert (= (and b!503349 (not res!304761)) b!503346))

(assert (= (and b!503346 res!304757) b!503350))

(assert (= (and b!503346 (not res!304760)) b!503337))

(declare-fun m!483673 () Bool)

(assert (=> start!45642 m!483673))

(declare-fun m!483675 () Bool)

(assert (=> start!45642 m!483675))

(declare-fun m!483677 () Bool)

(assert (=> b!503350 m!483677))

(assert (=> b!503350 m!483677))

(declare-fun m!483679 () Bool)

(assert (=> b!503350 m!483679))

(declare-fun m!483681 () Bool)

(assert (=> b!503344 m!483681))

(declare-fun m!483683 () Bool)

(assert (=> b!503337 m!483683))

(assert (=> b!503343 m!483677))

(assert (=> b!503343 m!483677))

(declare-fun m!483685 () Bool)

(assert (=> b!503343 m!483685))

(declare-fun m!483687 () Bool)

(assert (=> b!503336 m!483687))

(declare-fun m!483689 () Bool)

(assert (=> b!503345 m!483689))

(declare-fun m!483691 () Bool)

(assert (=> b!503345 m!483691))

(declare-fun m!483693 () Bool)

(assert (=> b!503345 m!483693))

(assert (=> b!503345 m!483677))

(declare-fun m!483695 () Bool)

(assert (=> b!503345 m!483695))

(declare-fun m!483697 () Bool)

(assert (=> b!503345 m!483697))

(assert (=> b!503345 m!483677))

(declare-fun m!483699 () Bool)

(assert (=> b!503345 m!483699))

(assert (=> b!503345 m!483677))

(declare-fun m!483701 () Bool)

(assert (=> b!503345 m!483701))

(declare-fun m!483703 () Bool)

(assert (=> b!503345 m!483703))

(declare-fun m!483705 () Bool)

(assert (=> b!503349 m!483705))

(declare-fun m!483707 () Bool)

(assert (=> b!503349 m!483707))

(assert (=> b!503349 m!483677))

(declare-fun m!483709 () Bool)

(assert (=> b!503347 m!483709))

(assert (=> b!503339 m!483677))

(assert (=> b!503339 m!483677))

(declare-fun m!483711 () Bool)

(assert (=> b!503339 m!483711))

(declare-fun m!483713 () Bool)

(assert (=> b!503334 m!483713))

(assert (=> b!503334 m!483683))

(declare-fun m!483715 () Bool)

(assert (=> b!503348 m!483715))

(declare-fun m!483717 () Bool)

(assert (=> b!503338 m!483717))

(check-sat (not b!503339) (not b!503344) (not b!503349) (not b!503337) (not b!503343) (not b!503334) (not b!503347) (not b!503348) (not start!45642) (not b!503345) (not b!503336) (not b!503338) (not b!503350))
(check-sat)
