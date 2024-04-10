; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51454 () Bool)

(assert start!51454)

(declare-fun b!562530 () Bool)

(declare-fun res!353684 () Bool)

(declare-fun e!324186 () Bool)

(assert (=> b!562530 (=> (not res!353684) (not e!324186))))

(declare-datatypes ((array!35319 0))(
  ( (array!35320 (arr!16960 (Array (_ BitVec 32) (_ BitVec 64))) (size!17324 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35319)

(declare-datatypes ((List!11040 0))(
  ( (Nil!11037) (Cons!11036 (h!12039 (_ BitVec 64)) (t!17268 List!11040)) )
))
(declare-fun arrayNoDuplicates!0 (array!35319 (_ BitVec 32) List!11040) Bool)

(assert (=> b!562530 (= res!353684 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11037))))

(declare-fun b!562531 () Bool)

(declare-fun e!324189 () Bool)

(assert (=> b!562531 (= e!324186 e!324189)))

(declare-fun res!353682 () Bool)

(assert (=> b!562531 (=> (not res!353682) (not e!324189))))

(declare-fun lt!256355 () (_ BitVec 64))

(declare-fun lt!256344 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5409 0))(
  ( (MissingZero!5409 (index!23863 (_ BitVec 32))) (Found!5409 (index!23864 (_ BitVec 32))) (Intermediate!5409 (undefined!6221 Bool) (index!23865 (_ BitVec 32)) (x!52760 (_ BitVec 32))) (Undefined!5409) (MissingVacant!5409 (index!23866 (_ BitVec 32))) )
))
(declare-fun lt!256357 () SeekEntryResult!5409)

(declare-fun lt!256352 () array!35319)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35319 (_ BitVec 32)) SeekEntryResult!5409)

(assert (=> b!562531 (= res!353682 (= lt!256357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256344 lt!256355 lt!256352 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256354 () (_ BitVec 32))

(assert (=> b!562531 (= lt!256357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256354 (select (arr!16960 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562531 (= lt!256344 (toIndex!0 lt!256355 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562531 (= lt!256355 (select (store (arr!16960 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562531 (= lt!256354 (toIndex!0 (select (arr!16960 a!3118) j!142) mask!3119))))

(assert (=> b!562531 (= lt!256352 (array!35320 (store (arr!16960 a!3118) i!1132 k0!1914) (size!17324 a!3118)))))

(declare-fun b!562532 () Bool)

(declare-fun res!353689 () Bool)

(declare-fun e!324190 () Bool)

(assert (=> b!562532 (=> (not res!353689) (not e!324190))))

(assert (=> b!562532 (= res!353689 (and (= (size!17324 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17324 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17324 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562533 () Bool)

(declare-fun e!324191 () Bool)

(declare-fun e!324188 () Bool)

(assert (=> b!562533 (= e!324191 e!324188)))

(declare-fun res!353691 () Bool)

(assert (=> b!562533 (=> res!353691 e!324188)))

(declare-fun lt!256350 () SeekEntryResult!5409)

(declare-fun lt!256356 () SeekEntryResult!5409)

(declare-fun lt!256351 () (_ BitVec 64))

(assert (=> b!562533 (= res!353691 (or (bvslt (index!23865 lt!256357) #b00000000000000000000000000000000) (bvsge (index!23865 lt!256357) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52760 lt!256357) #b01111111111111111111111111111110) (bvslt (x!52760 lt!256357) #b00000000000000000000000000000000) (not (= lt!256351 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16960 a!3118) i!1132 k0!1914) (index!23865 lt!256357)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256350 lt!256356))))))

(declare-fun lt!256345 () SeekEntryResult!5409)

(declare-fun lt!256353 () SeekEntryResult!5409)

(assert (=> b!562533 (= lt!256345 lt!256353)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35319 (_ BitVec 32)) SeekEntryResult!5409)

(assert (=> b!562533 (= lt!256353 (seekKeyOrZeroReturnVacant!0 (x!52760 lt!256357) (index!23865 lt!256357) (index!23865 lt!256357) lt!256355 lt!256352 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35319 (_ BitVec 32)) SeekEntryResult!5409)

(assert (=> b!562533 (= lt!256345 (seekEntryOrOpen!0 lt!256355 lt!256352 mask!3119))))

(declare-fun lt!256349 () SeekEntryResult!5409)

(assert (=> b!562533 (= lt!256349 lt!256350)))

(assert (=> b!562533 (= lt!256350 (seekKeyOrZeroReturnVacant!0 (x!52760 lt!256357) (index!23865 lt!256357) (index!23865 lt!256357) (select (arr!16960 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562534 () Bool)

(declare-fun e!324187 () Bool)

(assert (=> b!562534 (= e!324189 (not e!324187))))

(declare-fun res!353687 () Bool)

(assert (=> b!562534 (=> res!353687 e!324187)))

(get-info :version)

(assert (=> b!562534 (= res!353687 (or (undefined!6221 lt!256357) (not ((_ is Intermediate!5409) lt!256357))))))

(assert (=> b!562534 (= lt!256349 lt!256356)))

(assert (=> b!562534 (= lt!256356 (Found!5409 j!142))))

(assert (=> b!562534 (= lt!256349 (seekEntryOrOpen!0 (select (arr!16960 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35319 (_ BitVec 32)) Bool)

(assert (=> b!562534 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17592 0))(
  ( (Unit!17593) )
))
(declare-fun lt!256348 () Unit!17592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17592)

(assert (=> b!562534 (= lt!256348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562535 () Bool)

(declare-fun res!353683 () Bool)

(assert (=> b!562535 (=> (not res!353683) (not e!324190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562535 (= res!353683 (validKeyInArray!0 (select (arr!16960 a!3118) j!142)))))

(declare-fun b!562536 () Bool)

(declare-fun res!353692 () Bool)

(assert (=> b!562536 (=> (not res!353692) (not e!324190))))

(declare-fun arrayContainsKey!0 (array!35319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562536 (= res!353692 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562538 () Bool)

(assert (=> b!562538 (= e!324190 e!324186)))

(declare-fun res!353685 () Bool)

(assert (=> b!562538 (=> (not res!353685) (not e!324186))))

(declare-fun lt!256347 () SeekEntryResult!5409)

(assert (=> b!562538 (= res!353685 (or (= lt!256347 (MissingZero!5409 i!1132)) (= lt!256347 (MissingVacant!5409 i!1132))))))

(assert (=> b!562538 (= lt!256347 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562539 () Bool)

(declare-fun res!353686 () Bool)

(assert (=> b!562539 (=> (not res!353686) (not e!324190))))

(assert (=> b!562539 (= res!353686 (validKeyInArray!0 k0!1914))))

(declare-fun b!562540 () Bool)

(declare-fun res!353693 () Bool)

(assert (=> b!562540 (=> (not res!353693) (not e!324186))))

(assert (=> b!562540 (= res!353693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562541 () Bool)

(assert (=> b!562541 (= e!324187 e!324191)))

(declare-fun res!353690 () Bool)

(assert (=> b!562541 (=> res!353690 e!324191)))

(assert (=> b!562541 (= res!353690 (or (= lt!256351 (select (arr!16960 a!3118) j!142)) (= lt!256351 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562541 (= lt!256351 (select (arr!16960 a!3118) (index!23865 lt!256357)))))

(declare-fun b!562537 () Bool)

(assert (=> b!562537 (= e!324188 (bvsge mask!3119 #b00000000000000000000000000000000))))

(assert (=> b!562537 (= lt!256350 lt!256353)))

(declare-fun lt!256346 () Unit!17592)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35319 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17592)

(assert (=> b!562537 (= lt!256346 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52760 lt!256357) (index!23865 lt!256357) (index!23865 lt!256357) mask!3119))))

(declare-fun res!353688 () Bool)

(assert (=> start!51454 (=> (not res!353688) (not e!324190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51454 (= res!353688 (validMask!0 mask!3119))))

(assert (=> start!51454 e!324190))

(assert (=> start!51454 true))

(declare-fun array_inv!12756 (array!35319) Bool)

(assert (=> start!51454 (array_inv!12756 a!3118)))

(assert (= (and start!51454 res!353688) b!562532))

(assert (= (and b!562532 res!353689) b!562535))

(assert (= (and b!562535 res!353683) b!562539))

(assert (= (and b!562539 res!353686) b!562536))

(assert (= (and b!562536 res!353692) b!562538))

(assert (= (and b!562538 res!353685) b!562540))

(assert (= (and b!562540 res!353693) b!562530))

(assert (= (and b!562530 res!353684) b!562531))

(assert (= (and b!562531 res!353682) b!562534))

(assert (= (and b!562534 (not res!353687)) b!562541))

(assert (= (and b!562541 (not res!353690)) b!562533))

(assert (= (and b!562533 (not res!353691)) b!562537))

(declare-fun m!540597 () Bool)

(assert (=> b!562541 m!540597))

(declare-fun m!540599 () Bool)

(assert (=> b!562541 m!540599))

(declare-fun m!540601 () Bool)

(assert (=> b!562536 m!540601))

(assert (=> b!562534 m!540597))

(assert (=> b!562534 m!540597))

(declare-fun m!540603 () Bool)

(assert (=> b!562534 m!540603))

(declare-fun m!540605 () Bool)

(assert (=> b!562534 m!540605))

(declare-fun m!540607 () Bool)

(assert (=> b!562534 m!540607))

(assert (=> b!562535 m!540597))

(assert (=> b!562535 m!540597))

(declare-fun m!540609 () Bool)

(assert (=> b!562535 m!540609))

(declare-fun m!540611 () Bool)

(assert (=> b!562533 m!540611))

(assert (=> b!562533 m!540597))

(declare-fun m!540613 () Bool)

(assert (=> b!562533 m!540613))

(assert (=> b!562533 m!540597))

(declare-fun m!540615 () Bool)

(assert (=> b!562533 m!540615))

(declare-fun m!540617 () Bool)

(assert (=> b!562533 m!540617))

(declare-fun m!540619 () Bool)

(assert (=> b!562533 m!540619))

(declare-fun m!540621 () Bool)

(assert (=> b!562539 m!540621))

(assert (=> b!562531 m!540597))

(declare-fun m!540623 () Bool)

(assert (=> b!562531 m!540623))

(declare-fun m!540625 () Bool)

(assert (=> b!562531 m!540625))

(declare-fun m!540627 () Bool)

(assert (=> b!562531 m!540627))

(declare-fun m!540629 () Bool)

(assert (=> b!562531 m!540629))

(assert (=> b!562531 m!540617))

(assert (=> b!562531 m!540597))

(declare-fun m!540631 () Bool)

(assert (=> b!562531 m!540631))

(assert (=> b!562531 m!540597))

(declare-fun m!540633 () Bool)

(assert (=> b!562538 m!540633))

(declare-fun m!540635 () Bool)

(assert (=> b!562540 m!540635))

(declare-fun m!540637 () Bool)

(assert (=> b!562530 m!540637))

(declare-fun m!540639 () Bool)

(assert (=> start!51454 m!540639))

(declare-fun m!540641 () Bool)

(assert (=> start!51454 m!540641))

(declare-fun m!540643 () Bool)

(assert (=> b!562537 m!540643))

(check-sat (not b!562531) (not start!51454) (not b!562534) (not b!562539) (not b!562537) (not b!562540) (not b!562530) (not b!562536) (not b!562533) (not b!562535) (not b!562538))
(check-sat)
