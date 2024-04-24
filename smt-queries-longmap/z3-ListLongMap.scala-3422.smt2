; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47444 () Bool)

(assert start!47444)

(declare-fun b!522441 () Bool)

(declare-fun e!304707 () Bool)

(assert (=> b!522441 (= e!304707 true)))

(declare-datatypes ((array!33271 0))(
  ( (array!33272 (arr!15991 (Array (_ BitVec 32) (_ BitVec 64))) (size!16355 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33271)

(declare-datatypes ((SeekEntryResult!4414 0))(
  ( (MissingZero!4414 (index!19859 (_ BitVec 32))) (Found!4414 (index!19860 (_ BitVec 32))) (Intermediate!4414 (undefined!5226 Bool) (index!19861 (_ BitVec 32)) (x!48981 (_ BitVec 32))) (Undefined!4414) (MissingVacant!4414 (index!19862 (_ BitVec 32))) )
))
(declare-fun lt!239661 () SeekEntryResult!4414)

(assert (=> b!522441 (and (or (= (select (arr!15991 a!3235) (index!19861 lt!239661)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15991 a!3235) (index!19861 lt!239661)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15991 a!3235) (index!19861 lt!239661)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15991 a!3235) (index!19861 lt!239661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16267 0))(
  ( (Unit!16268) )
))
(declare-fun lt!239655 () Unit!16267)

(declare-fun e!304708 () Unit!16267)

(assert (=> b!522441 (= lt!239655 e!304708)))

(declare-fun c!61451 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!522441 (= c!61451 (= (select (arr!15991 a!3235) (index!19861 lt!239661)) (select (arr!15991 a!3235) j!176)))))

(assert (=> b!522441 (and (bvslt (x!48981 lt!239661) #b01111111111111111111111111111110) (or (= (select (arr!15991 a!3235) (index!19861 lt!239661)) (select (arr!15991 a!3235) j!176)) (= (select (arr!15991 a!3235) (index!19861 lt!239661)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15991 a!3235) (index!19861 lt!239661)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522442 () Bool)

(declare-fun Unit!16269 () Unit!16267)

(assert (=> b!522442 (= e!304708 Unit!16269)))

(declare-fun b!522443 () Bool)

(declare-fun res!320150 () Bool)

(assert (=> b!522443 (=> res!320150 e!304707)))

(get-info :version)

(assert (=> b!522443 (= res!320150 (or (undefined!5226 lt!239661) (not ((_ is Intermediate!4414) lt!239661))))))

(declare-fun b!522444 () Bool)

(declare-fun res!320152 () Bool)

(declare-fun e!304709 () Bool)

(assert (=> b!522444 (=> (not res!320152) (not e!304709))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522444 (= res!320152 (validKeyInArray!0 k0!2280))))

(declare-fun b!522445 () Bool)

(declare-fun e!304712 () Bool)

(assert (=> b!522445 (= e!304712 (not e!304707))))

(declare-fun res!320143 () Bool)

(assert (=> b!522445 (=> res!320143 e!304707)))

(declare-fun lt!239654 () array!33271)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!239658 () (_ BitVec 64))

(declare-fun lt!239659 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33271 (_ BitVec 32)) SeekEntryResult!4414)

(assert (=> b!522445 (= res!320143 (= lt!239661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239659 lt!239658 lt!239654 mask!3524)))))

(declare-fun lt!239656 () (_ BitVec 32))

(assert (=> b!522445 (= lt!239661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239656 (select (arr!15991 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522445 (= lt!239659 (toIndex!0 lt!239658 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522445 (= lt!239658 (select (store (arr!15991 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522445 (= lt!239656 (toIndex!0 (select (arr!15991 a!3235) j!176) mask!3524))))

(assert (=> b!522445 (= lt!239654 (array!33272 (store (arr!15991 a!3235) i!1204 k0!2280) (size!16355 a!3235)))))

(declare-fun e!304710 () Bool)

(assert (=> b!522445 e!304710))

(declare-fun res!320142 () Bool)

(assert (=> b!522445 (=> (not res!320142) (not e!304710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33271 (_ BitVec 32)) Bool)

(assert (=> b!522445 (= res!320142 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239657 () Unit!16267)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16267)

(assert (=> b!522445 (= lt!239657 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!320149 () Bool)

(assert (=> start!47444 (=> (not res!320149) (not e!304709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47444 (= res!320149 (validMask!0 mask!3524))))

(assert (=> start!47444 e!304709))

(assert (=> start!47444 true))

(declare-fun array_inv!11850 (array!33271) Bool)

(assert (=> start!47444 (array_inv!11850 a!3235)))

(declare-fun b!522446 () Bool)

(assert (=> b!522446 (= e!304709 e!304712)))

(declare-fun res!320147 () Bool)

(assert (=> b!522446 (=> (not res!320147) (not e!304712))))

(declare-fun lt!239662 () SeekEntryResult!4414)

(assert (=> b!522446 (= res!320147 (or (= lt!239662 (MissingZero!4414 i!1204)) (= lt!239662 (MissingVacant!4414 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33271 (_ BitVec 32)) SeekEntryResult!4414)

(assert (=> b!522446 (= lt!239662 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522447 () Bool)

(declare-fun res!320148 () Bool)

(assert (=> b!522447 (=> (not res!320148) (not e!304709))))

(assert (=> b!522447 (= res!320148 (validKeyInArray!0 (select (arr!15991 a!3235) j!176)))))

(declare-fun b!522448 () Bool)

(assert (=> b!522448 (= e!304710 (= (seekEntryOrOpen!0 (select (arr!15991 a!3235) j!176) a!3235 mask!3524) (Found!4414 j!176)))))

(declare-fun b!522449 () Bool)

(declare-fun res!320146 () Bool)

(assert (=> b!522449 (=> (not res!320146) (not e!304709))))

(assert (=> b!522449 (= res!320146 (and (= (size!16355 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16355 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16355 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522450 () Bool)

(declare-fun res!320144 () Bool)

(assert (=> b!522450 (=> (not res!320144) (not e!304712))))

(declare-datatypes ((List!10056 0))(
  ( (Nil!10053) (Cons!10052 (h!10974 (_ BitVec 64)) (t!16276 List!10056)) )
))
(declare-fun arrayNoDuplicates!0 (array!33271 (_ BitVec 32) List!10056) Bool)

(assert (=> b!522450 (= res!320144 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10053))))

(declare-fun b!522451 () Bool)

(declare-fun e!304711 () Bool)

(assert (=> b!522451 (= e!304711 false)))

(declare-fun b!522452 () Bool)

(declare-fun res!320141 () Bool)

(assert (=> b!522452 (=> (not res!320141) (not e!304709))))

(declare-fun arrayContainsKey!0 (array!33271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522452 (= res!320141 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522453 () Bool)

(declare-fun Unit!16270 () Unit!16267)

(assert (=> b!522453 (= e!304708 Unit!16270)))

(declare-fun lt!239660 () Unit!16267)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33271 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16267)

(assert (=> b!522453 (= lt!239660 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239656 #b00000000000000000000000000000000 (index!19861 lt!239661) (x!48981 lt!239661) mask!3524))))

(declare-fun res!320151 () Bool)

(assert (=> b!522453 (= res!320151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239656 lt!239658 lt!239654 mask!3524) (Intermediate!4414 false (index!19861 lt!239661) (x!48981 lt!239661))))))

(assert (=> b!522453 (=> (not res!320151) (not e!304711))))

(assert (=> b!522453 e!304711))

(declare-fun b!522454 () Bool)

(declare-fun res!320145 () Bool)

(assert (=> b!522454 (=> (not res!320145) (not e!304712))))

(assert (=> b!522454 (= res!320145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47444 res!320149) b!522449))

(assert (= (and b!522449 res!320146) b!522447))

(assert (= (and b!522447 res!320148) b!522444))

(assert (= (and b!522444 res!320152) b!522452))

(assert (= (and b!522452 res!320141) b!522446))

(assert (= (and b!522446 res!320147) b!522454))

(assert (= (and b!522454 res!320145) b!522450))

(assert (= (and b!522450 res!320144) b!522445))

(assert (= (and b!522445 res!320142) b!522448))

(assert (= (and b!522445 (not res!320143)) b!522443))

(assert (= (and b!522443 (not res!320150)) b!522441))

(assert (= (and b!522441 c!61451) b!522453))

(assert (= (and b!522441 (not c!61451)) b!522442))

(assert (= (and b!522453 res!320151) b!522451))

(declare-fun m!503599 () Bool)

(assert (=> b!522452 m!503599))

(declare-fun m!503601 () Bool)

(assert (=> b!522454 m!503601))

(declare-fun m!503603 () Bool)

(assert (=> b!522450 m!503603))

(declare-fun m!503605 () Bool)

(assert (=> b!522441 m!503605))

(declare-fun m!503607 () Bool)

(assert (=> b!522441 m!503607))

(declare-fun m!503609 () Bool)

(assert (=> b!522445 m!503609))

(declare-fun m!503611 () Bool)

(assert (=> b!522445 m!503611))

(declare-fun m!503613 () Bool)

(assert (=> b!522445 m!503613))

(declare-fun m!503615 () Bool)

(assert (=> b!522445 m!503615))

(assert (=> b!522445 m!503607))

(declare-fun m!503617 () Bool)

(assert (=> b!522445 m!503617))

(assert (=> b!522445 m!503607))

(assert (=> b!522445 m!503607))

(declare-fun m!503619 () Bool)

(assert (=> b!522445 m!503619))

(declare-fun m!503621 () Bool)

(assert (=> b!522445 m!503621))

(declare-fun m!503623 () Bool)

(assert (=> b!522445 m!503623))

(declare-fun m!503625 () Bool)

(assert (=> b!522444 m!503625))

(assert (=> b!522448 m!503607))

(assert (=> b!522448 m!503607))

(declare-fun m!503627 () Bool)

(assert (=> b!522448 m!503627))

(assert (=> b!522447 m!503607))

(assert (=> b!522447 m!503607))

(declare-fun m!503629 () Bool)

(assert (=> b!522447 m!503629))

(declare-fun m!503631 () Bool)

(assert (=> b!522453 m!503631))

(declare-fun m!503633 () Bool)

(assert (=> b!522453 m!503633))

(declare-fun m!503635 () Bool)

(assert (=> start!47444 m!503635))

(declare-fun m!503637 () Bool)

(assert (=> start!47444 m!503637))

(declare-fun m!503639 () Bool)

(assert (=> b!522446 m!503639))

(check-sat (not b!522450) (not b!522446) (not b!522453) (not b!522444) (not b!522445) (not b!522448) (not b!522452) (not b!522447) (not start!47444) (not b!522454))
(check-sat)
