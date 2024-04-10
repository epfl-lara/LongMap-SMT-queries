; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47418 () Bool)

(assert start!47418)

(declare-fun res!319508 () Bool)

(declare-fun e!304373 () Bool)

(assert (=> start!47418 (=> (not res!319508) (not e!304373))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47418 (= res!319508 (validMask!0 mask!3524))))

(assert (=> start!47418 e!304373))

(assert (=> start!47418 true))

(declare-datatypes ((array!33244 0))(
  ( (array!33245 (arr!15978 (Array (_ BitVec 32) (_ BitVec 64))) (size!16342 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33244)

(declare-fun array_inv!11774 (array!33244) Bool)

(assert (=> start!47418 (array_inv!11774 a!3235)))

(declare-fun b!521746 () Bool)

(declare-fun res!319501 () Bool)

(assert (=> b!521746 (=> (not res!319501) (not e!304373))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521746 (= res!319501 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521747 () Bool)

(declare-fun res!319503 () Bool)

(assert (=> b!521747 (=> (not res!319503) (not e!304373))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521747 (= res!319503 (and (= (size!16342 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16342 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16342 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521748 () Bool)

(declare-fun res!319511 () Bool)

(assert (=> b!521748 (=> (not res!319511) (not e!304373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521748 (= res!319511 (validKeyInArray!0 (select (arr!15978 a!3235) j!176)))))

(declare-fun e!304374 () Bool)

(declare-fun b!521749 () Bool)

(declare-datatypes ((SeekEntryResult!4445 0))(
  ( (MissingZero!4445 (index!19983 (_ BitVec 32))) (Found!4445 (index!19984 (_ BitVec 32))) (Intermediate!4445 (undefined!5257 Bool) (index!19985 (_ BitVec 32)) (x!48967 (_ BitVec 32))) (Undefined!4445) (MissingVacant!4445 (index!19986 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33244 (_ BitVec 32)) SeekEntryResult!4445)

(assert (=> b!521749 (= e!304374 (= (seekEntryOrOpen!0 (select (arr!15978 a!3235) j!176) a!3235 mask!3524) (Found!4445 j!176)))))

(declare-fun b!521750 () Bool)

(declare-fun e!304371 () Bool)

(assert (=> b!521750 (= e!304371 true)))

(declare-fun lt!239157 () SeekEntryResult!4445)

(assert (=> b!521750 (and (or (= (select (arr!15978 a!3235) (index!19985 lt!239157)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15978 a!3235) (index!19985 lt!239157)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15978 a!3235) (index!19985 lt!239157)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15978 a!3235) (index!19985 lt!239157)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16232 0))(
  ( (Unit!16233) )
))
(declare-fun lt!239158 () Unit!16232)

(declare-fun e!304370 () Unit!16232)

(assert (=> b!521750 (= lt!239158 e!304370)))

(declare-fun c!61424 () Bool)

(assert (=> b!521750 (= c!61424 (= (select (arr!15978 a!3235) (index!19985 lt!239157)) (select (arr!15978 a!3235) j!176)))))

(assert (=> b!521750 (and (bvslt (x!48967 lt!239157) #b01111111111111111111111111111110) (or (= (select (arr!15978 a!3235) (index!19985 lt!239157)) (select (arr!15978 a!3235) j!176)) (= (select (arr!15978 a!3235) (index!19985 lt!239157)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15978 a!3235) (index!19985 lt!239157)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521751 () Bool)

(declare-fun e!304369 () Bool)

(assert (=> b!521751 (= e!304369 false)))

(declare-fun b!521752 () Bool)

(declare-fun Unit!16234 () Unit!16232)

(assert (=> b!521752 (= e!304370 Unit!16234)))

(declare-fun b!521753 () Bool)

(declare-fun Unit!16235 () Unit!16232)

(assert (=> b!521753 (= e!304370 Unit!16235)))

(declare-fun lt!239156 () Unit!16232)

(declare-fun lt!239161 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16232)

(assert (=> b!521753 (= lt!239156 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239161 #b00000000000000000000000000000000 (index!19985 lt!239157) (x!48967 lt!239157) mask!3524))))

(declare-fun lt!239159 () array!33244)

(declare-fun lt!239163 () (_ BitVec 64))

(declare-fun res!319500 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33244 (_ BitVec 32)) SeekEntryResult!4445)

(assert (=> b!521753 (= res!319500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239161 lt!239163 lt!239159 mask!3524) (Intermediate!4445 false (index!19985 lt!239157) (x!48967 lt!239157))))))

(assert (=> b!521753 (=> (not res!319500) (not e!304369))))

(assert (=> b!521753 e!304369))

(declare-fun b!521754 () Bool)

(declare-fun res!319506 () Bool)

(assert (=> b!521754 (=> res!319506 e!304371)))

(assert (=> b!521754 (= res!319506 (or (undefined!5257 lt!239157) (not (is-Intermediate!4445 lt!239157))))))

(declare-fun b!521755 () Bool)

(declare-fun res!319502 () Bool)

(declare-fun e!304368 () Bool)

(assert (=> b!521755 (=> (not res!319502) (not e!304368))))

(declare-datatypes ((List!10136 0))(
  ( (Nil!10133) (Cons!10132 (h!11054 (_ BitVec 64)) (t!16364 List!10136)) )
))
(declare-fun arrayNoDuplicates!0 (array!33244 (_ BitVec 32) List!10136) Bool)

(assert (=> b!521755 (= res!319502 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10133))))

(declare-fun b!521756 () Bool)

(declare-fun res!319505 () Bool)

(assert (=> b!521756 (=> (not res!319505) (not e!304373))))

(assert (=> b!521756 (= res!319505 (validKeyInArray!0 k!2280))))

(declare-fun b!521757 () Bool)

(assert (=> b!521757 (= e!304368 (not e!304371))))

(declare-fun res!319510 () Bool)

(assert (=> b!521757 (=> res!319510 e!304371)))

(declare-fun lt!239162 () (_ BitVec 32))

(assert (=> b!521757 (= res!319510 (= lt!239157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239162 lt!239163 lt!239159 mask!3524)))))

(assert (=> b!521757 (= lt!239157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239161 (select (arr!15978 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521757 (= lt!239162 (toIndex!0 lt!239163 mask!3524))))

(assert (=> b!521757 (= lt!239163 (select (store (arr!15978 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521757 (= lt!239161 (toIndex!0 (select (arr!15978 a!3235) j!176) mask!3524))))

(assert (=> b!521757 (= lt!239159 (array!33245 (store (arr!15978 a!3235) i!1204 k!2280) (size!16342 a!3235)))))

(assert (=> b!521757 e!304374))

(declare-fun res!319504 () Bool)

(assert (=> b!521757 (=> (not res!319504) (not e!304374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33244 (_ BitVec 32)) Bool)

(assert (=> b!521757 (= res!319504 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239164 () Unit!16232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16232)

(assert (=> b!521757 (= lt!239164 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521758 () Bool)

(assert (=> b!521758 (= e!304373 e!304368)))

(declare-fun res!319509 () Bool)

(assert (=> b!521758 (=> (not res!319509) (not e!304368))))

(declare-fun lt!239160 () SeekEntryResult!4445)

(assert (=> b!521758 (= res!319509 (or (= lt!239160 (MissingZero!4445 i!1204)) (= lt!239160 (MissingVacant!4445 i!1204))))))

(assert (=> b!521758 (= lt!239160 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521759 () Bool)

(declare-fun res!319507 () Bool)

(assert (=> b!521759 (=> (not res!319507) (not e!304368))))

(assert (=> b!521759 (= res!319507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47418 res!319508) b!521747))

(assert (= (and b!521747 res!319503) b!521748))

(assert (= (and b!521748 res!319511) b!521756))

(assert (= (and b!521756 res!319505) b!521746))

(assert (= (and b!521746 res!319501) b!521758))

(assert (= (and b!521758 res!319509) b!521759))

(assert (= (and b!521759 res!319507) b!521755))

(assert (= (and b!521755 res!319502) b!521757))

(assert (= (and b!521757 res!319504) b!521749))

(assert (= (and b!521757 (not res!319510)) b!521754))

(assert (= (and b!521754 (not res!319506)) b!521750))

(assert (= (and b!521750 c!61424) b!521753))

(assert (= (and b!521750 (not c!61424)) b!521752))

(assert (= (and b!521753 res!319500) b!521751))

(declare-fun m!502659 () Bool)

(assert (=> b!521758 m!502659))

(declare-fun m!502661 () Bool)

(assert (=> b!521757 m!502661))

(declare-fun m!502663 () Bool)

(assert (=> b!521757 m!502663))

(declare-fun m!502665 () Bool)

(assert (=> b!521757 m!502665))

(declare-fun m!502667 () Bool)

(assert (=> b!521757 m!502667))

(declare-fun m!502669 () Bool)

(assert (=> b!521757 m!502669))

(declare-fun m!502671 () Bool)

(assert (=> b!521757 m!502671))

(declare-fun m!502673 () Bool)

(assert (=> b!521757 m!502673))

(assert (=> b!521757 m!502669))

(declare-fun m!502675 () Bool)

(assert (=> b!521757 m!502675))

(assert (=> b!521757 m!502669))

(declare-fun m!502677 () Bool)

(assert (=> b!521757 m!502677))

(declare-fun m!502679 () Bool)

(assert (=> b!521750 m!502679))

(assert (=> b!521750 m!502669))

(declare-fun m!502681 () Bool)

(assert (=> b!521753 m!502681))

(declare-fun m!502683 () Bool)

(assert (=> b!521753 m!502683))

(declare-fun m!502685 () Bool)

(assert (=> b!521759 m!502685))

(assert (=> b!521749 m!502669))

(assert (=> b!521749 m!502669))

(declare-fun m!502687 () Bool)

(assert (=> b!521749 m!502687))

(declare-fun m!502689 () Bool)

(assert (=> start!47418 m!502689))

(declare-fun m!502691 () Bool)

(assert (=> start!47418 m!502691))

(declare-fun m!502693 () Bool)

(assert (=> b!521756 m!502693))

(declare-fun m!502695 () Bool)

(assert (=> b!521746 m!502695))

(assert (=> b!521748 m!502669))

(assert (=> b!521748 m!502669))

(declare-fun m!502697 () Bool)

(assert (=> b!521748 m!502697))

(declare-fun m!502699 () Bool)

(assert (=> b!521755 m!502699))

(push 1)

