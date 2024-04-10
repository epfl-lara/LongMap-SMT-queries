; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52444 () Bool)

(assert start!52444)

(declare-fun b!572621 () Bool)

(declare-fun res!362130 () Bool)

(declare-fun e!329389 () Bool)

(assert (=> b!572621 (=> (not res!362130) (not e!329389))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35841 0))(
  ( (array!35842 (arr!17209 (Array (_ BitVec 32) (_ BitVec 64))) (size!17573 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35841)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572621 (= res!362130 (and (= (size!17573 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17573 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17573 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572622 () Bool)

(declare-fun res!362133 () Bool)

(declare-fun e!329393 () Bool)

(assert (=> b!572622 (=> (not res!362133) (not e!329393))))

(declare-datatypes ((List!11289 0))(
  ( (Nil!11286) (Cons!11285 (h!12312 (_ BitVec 64)) (t!17517 List!11289)) )
))
(declare-fun arrayNoDuplicates!0 (array!35841 (_ BitVec 32) List!11289) Bool)

(assert (=> b!572622 (= res!362133 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11286))))

(declare-fun b!572623 () Bool)

(declare-fun res!362138 () Bool)

(assert (=> b!572623 (=> (not res!362138) (not e!329389))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572623 (= res!362138 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572624 () Bool)

(declare-fun e!329387 () Bool)

(declare-fun e!329390 () Bool)

(assert (=> b!572624 (= e!329387 e!329390)))

(declare-fun res!362132 () Bool)

(assert (=> b!572624 (=> res!362132 e!329390)))

(declare-datatypes ((SeekEntryResult!5658 0))(
  ( (MissingZero!5658 (index!24859 (_ BitVec 32))) (Found!5658 (index!24860 (_ BitVec 32))) (Intermediate!5658 (undefined!6470 Bool) (index!24861 (_ BitVec 32)) (x!53727 (_ BitVec 32))) (Undefined!5658) (MissingVacant!5658 (index!24862 (_ BitVec 32))) )
))
(declare-fun lt!261369 () SeekEntryResult!5658)

(get-info :version)

(assert (=> b!572624 (= res!362132 (or (undefined!6470 lt!261369) (not ((_ is Intermediate!5658) lt!261369))))))

(declare-fun b!572625 () Bool)

(declare-fun e!329394 () Bool)

(declare-fun e!329391 () Bool)

(assert (=> b!572625 (= e!329394 e!329391)))

(declare-fun res!362140 () Bool)

(assert (=> b!572625 (=> (not res!362140) (not e!329391))))

(declare-fun lt!261366 () SeekEntryResult!5658)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35841 (_ BitVec 32)) SeekEntryResult!5658)

(assert (=> b!572625 (= res!362140 (= lt!261366 (seekKeyOrZeroReturnVacant!0 (x!53727 lt!261369) (index!24861 lt!261369) (index!24861 lt!261369) (select (arr!17209 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun lt!261367 () (_ BitVec 64))

(declare-fun b!572626 () Bool)

(declare-fun lt!261370 () array!35841)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35841 (_ BitVec 32)) SeekEntryResult!5658)

(assert (=> b!572626 (= e!329391 (= (seekEntryOrOpen!0 lt!261367 lt!261370 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53727 lt!261369) (index!24861 lt!261369) (index!24861 lt!261369) lt!261367 lt!261370 mask!3119)))))

(declare-fun b!572627 () Bool)

(assert (=> b!572627 (= e!329389 e!329393)))

(declare-fun res!362134 () Bool)

(assert (=> b!572627 (=> (not res!362134) (not e!329393))))

(declare-fun lt!261363 () SeekEntryResult!5658)

(assert (=> b!572627 (= res!362134 (or (= lt!261363 (MissingZero!5658 i!1132)) (= lt!261363 (MissingVacant!5658 i!1132))))))

(assert (=> b!572627 (= lt!261363 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!362136 () Bool)

(assert (=> start!52444 (=> (not res!362136) (not e!329389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52444 (= res!362136 (validMask!0 mask!3119))))

(assert (=> start!52444 e!329389))

(assert (=> start!52444 true))

(declare-fun array_inv!13005 (array!35841) Bool)

(assert (=> start!52444 (array_inv!13005 a!3118)))

(declare-fun b!572628 () Bool)

(assert (=> b!572628 (= e!329390 e!329394)))

(declare-fun res!362137 () Bool)

(assert (=> b!572628 (=> res!362137 e!329394)))

(declare-fun lt!261362 () (_ BitVec 64))

(assert (=> b!572628 (= res!362137 (or (= lt!261362 (select (arr!17209 a!3118) j!142)) (= lt!261362 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572628 (= lt!261362 (select (arr!17209 a!3118) (index!24861 lt!261369)))))

(declare-fun b!572629 () Bool)

(declare-fun e!329392 () Bool)

(assert (=> b!572629 (= e!329393 e!329392)))

(declare-fun res!362131 () Bool)

(assert (=> b!572629 (=> (not res!362131) (not e!329392))))

(declare-fun lt!261368 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35841 (_ BitVec 32)) SeekEntryResult!5658)

(assert (=> b!572629 (= res!362131 (= lt!261369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261368 lt!261367 lt!261370 mask!3119)))))

(declare-fun lt!261365 () (_ BitVec 32))

(assert (=> b!572629 (= lt!261369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261365 (select (arr!17209 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572629 (= lt!261368 (toIndex!0 lt!261367 mask!3119))))

(assert (=> b!572629 (= lt!261367 (select (store (arr!17209 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572629 (= lt!261365 (toIndex!0 (select (arr!17209 a!3118) j!142) mask!3119))))

(assert (=> b!572629 (= lt!261370 (array!35842 (store (arr!17209 a!3118) i!1132 k0!1914) (size!17573 a!3118)))))

(declare-fun b!572630 () Bool)

(declare-fun res!362135 () Bool)

(assert (=> b!572630 (=> (not res!362135) (not e!329393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35841 (_ BitVec 32)) Bool)

(assert (=> b!572630 (= res!362135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572631 () Bool)

(declare-fun res!362141 () Bool)

(assert (=> b!572631 (=> (not res!362141) (not e!329389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572631 (= res!362141 (validKeyInArray!0 k0!1914))))

(declare-fun b!572632 () Bool)

(declare-fun res!362129 () Bool)

(assert (=> b!572632 (=> (not res!362129) (not e!329389))))

(assert (=> b!572632 (= res!362129 (validKeyInArray!0 (select (arr!17209 a!3118) j!142)))))

(declare-fun b!572633 () Bool)

(assert (=> b!572633 (= e!329392 (not true))))

(assert (=> b!572633 e!329387))

(declare-fun res!362139 () Bool)

(assert (=> b!572633 (=> (not res!362139) (not e!329387))))

(assert (=> b!572633 (= res!362139 (= lt!261366 (Found!5658 j!142)))))

(assert (=> b!572633 (= lt!261366 (seekEntryOrOpen!0 (select (arr!17209 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572633 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18018 0))(
  ( (Unit!18019) )
))
(declare-fun lt!261364 () Unit!18018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18018)

(assert (=> b!572633 (= lt!261364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52444 res!362136) b!572621))

(assert (= (and b!572621 res!362130) b!572632))

(assert (= (and b!572632 res!362129) b!572631))

(assert (= (and b!572631 res!362141) b!572623))

(assert (= (and b!572623 res!362138) b!572627))

(assert (= (and b!572627 res!362134) b!572630))

(assert (= (and b!572630 res!362135) b!572622))

(assert (= (and b!572622 res!362133) b!572629))

(assert (= (and b!572629 res!362131) b!572633))

(assert (= (and b!572633 res!362139) b!572624))

(assert (= (and b!572624 (not res!362132)) b!572628))

(assert (= (and b!572628 (not res!362137)) b!572625))

(assert (= (and b!572625 res!362140) b!572626))

(declare-fun m!551621 () Bool)

(assert (=> b!572622 m!551621))

(declare-fun m!551623 () Bool)

(assert (=> b!572633 m!551623))

(assert (=> b!572633 m!551623))

(declare-fun m!551625 () Bool)

(assert (=> b!572633 m!551625))

(declare-fun m!551627 () Bool)

(assert (=> b!572633 m!551627))

(declare-fun m!551629 () Bool)

(assert (=> b!572633 m!551629))

(declare-fun m!551631 () Bool)

(assert (=> b!572631 m!551631))

(declare-fun m!551633 () Bool)

(assert (=> b!572626 m!551633))

(declare-fun m!551635 () Bool)

(assert (=> b!572626 m!551635))

(declare-fun m!551637 () Bool)

(assert (=> start!52444 m!551637))

(declare-fun m!551639 () Bool)

(assert (=> start!52444 m!551639))

(assert (=> b!572632 m!551623))

(assert (=> b!572632 m!551623))

(declare-fun m!551641 () Bool)

(assert (=> b!572632 m!551641))

(declare-fun m!551643 () Bool)

(assert (=> b!572630 m!551643))

(assert (=> b!572628 m!551623))

(declare-fun m!551645 () Bool)

(assert (=> b!572628 m!551645))

(declare-fun m!551647 () Bool)

(assert (=> b!572623 m!551647))

(declare-fun m!551649 () Bool)

(assert (=> b!572627 m!551649))

(assert (=> b!572625 m!551623))

(assert (=> b!572625 m!551623))

(declare-fun m!551651 () Bool)

(assert (=> b!572625 m!551651))

(assert (=> b!572629 m!551623))

(declare-fun m!551653 () Bool)

(assert (=> b!572629 m!551653))

(assert (=> b!572629 m!551623))

(declare-fun m!551655 () Bool)

(assert (=> b!572629 m!551655))

(assert (=> b!572629 m!551623))

(declare-fun m!551657 () Bool)

(assert (=> b!572629 m!551657))

(declare-fun m!551659 () Bool)

(assert (=> b!572629 m!551659))

(declare-fun m!551661 () Bool)

(assert (=> b!572629 m!551661))

(declare-fun m!551663 () Bool)

(assert (=> b!572629 m!551663))

(check-sat (not b!572630) (not b!572633) (not b!572629) (not b!572625) (not b!572626) (not b!572623) (not b!572632) (not b!572622) (not b!572631) (not start!52444) (not b!572627))
(check-sat)
