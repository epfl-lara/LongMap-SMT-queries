; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45696 () Bool)

(assert start!45696)

(declare-fun b!504711 () Bool)

(declare-fun e!295465 () Bool)

(assert (=> b!504711 (= e!295465 false)))

(declare-fun b!504712 () Bool)

(declare-fun res!305975 () Bool)

(declare-fun e!295467 () Bool)

(assert (=> b!504712 (=> (not res!305975) (not e!295467))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32462 0))(
  ( (array!32463 (arr!15611 (Array (_ BitVec 32) (_ BitVec 64))) (size!15976 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32462)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!504712 (= res!305975 (and (= (size!15976 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15976 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15976 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504713 () Bool)

(declare-fun res!305982 () Bool)

(assert (=> b!504713 (=> (not res!305982) (not e!295467))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504713 (= res!305982 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504714 () Bool)

(declare-fun res!305977 () Bool)

(assert (=> b!504714 (=> (not res!305977) (not e!295467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504714 (= res!305977 (validKeyInArray!0 (select (arr!15611 a!3235) j!176)))))

(declare-fun b!504715 () Bool)

(declare-fun e!295468 () Bool)

(declare-datatypes ((SeekEntryResult!4075 0))(
  ( (MissingZero!4075 (index!18488 (_ BitVec 32))) (Found!4075 (index!18489 (_ BitVec 32))) (Intermediate!4075 (undefined!4887 Bool) (index!18490 (_ BitVec 32)) (x!47511 (_ BitVec 32))) (Undefined!4075) (MissingVacant!4075 (index!18491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32462 (_ BitVec 32)) SeekEntryResult!4075)

(assert (=> b!504715 (= e!295468 (= (seekEntryOrOpen!0 (select (arr!15611 a!3235) j!176) a!3235 mask!3524) (Found!4075 j!176)))))

(declare-fun b!504716 () Bool)

(declare-fun res!305971 () Bool)

(declare-fun e!295473 () Bool)

(assert (=> b!504716 (=> res!305971 e!295473)))

(declare-fun e!295469 () Bool)

(assert (=> b!504716 (= res!305971 e!295469)))

(declare-fun res!305980 () Bool)

(assert (=> b!504716 (=> (not res!305980) (not e!295469))))

(declare-fun lt!229798 () SeekEntryResult!4075)

(assert (=> b!504716 (= res!305980 (bvsgt #b00000000000000000000000000000000 (x!47511 lt!229798)))))

(declare-fun b!504717 () Bool)

(declare-fun e!295470 () Bool)

(assert (=> b!504717 (= e!295467 e!295470)))

(declare-fun res!305983 () Bool)

(assert (=> b!504717 (=> (not res!305983) (not e!295470))))

(declare-fun lt!229792 () SeekEntryResult!4075)

(assert (=> b!504717 (= res!305983 (or (= lt!229792 (MissingZero!4075 i!1204)) (= lt!229792 (MissingVacant!4075 i!1204))))))

(assert (=> b!504717 (= lt!229792 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504718 () Bool)

(declare-datatypes ((Unit!15370 0))(
  ( (Unit!15371) )
))
(declare-fun e!295472 () Unit!15370)

(declare-fun Unit!15372 () Unit!15370)

(assert (=> b!504718 (= e!295472 Unit!15372)))

(declare-fun b!504719 () Bool)

(declare-fun Unit!15373 () Unit!15370)

(assert (=> b!504719 (= e!295472 Unit!15373)))

(declare-fun lt!229793 () Unit!15370)

(declare-fun lt!229795 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15370)

(assert (=> b!504719 (= lt!229793 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229795 #b00000000000000000000000000000000 (index!18490 lt!229798) (x!47511 lt!229798) mask!3524))))

(declare-fun lt!229789 () array!32462)

(declare-fun res!305972 () Bool)

(declare-fun lt!229796 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32462 (_ BitVec 32)) SeekEntryResult!4075)

(assert (=> b!504719 (= res!305972 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229795 lt!229796 lt!229789 mask!3524) (Intermediate!4075 false (index!18490 lt!229798) (x!47511 lt!229798))))))

(assert (=> b!504719 (=> (not res!305972) (not e!295465))))

(assert (=> b!504719 e!295465))

(declare-fun b!504720 () Bool)

(declare-fun res!305970 () Bool)

(declare-fun e!295471 () Bool)

(assert (=> b!504720 (=> res!305970 e!295471)))

(get-info :version)

(assert (=> b!504720 (= res!305970 (or (undefined!4887 lt!229798) (not ((_ is Intermediate!4075) lt!229798))))))

(declare-fun b!504721 () Bool)

(declare-fun res!305973 () Bool)

(assert (=> b!504721 (=> (not res!305973) (not e!295470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32462 (_ BitVec 32)) Bool)

(assert (=> b!504721 (= res!305973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504722 () Bool)

(assert (=> b!504722 (= e!295471 e!295473)))

(declare-fun res!305981 () Bool)

(assert (=> b!504722 (=> res!305981 e!295473)))

(assert (=> b!504722 (= res!305981 (or (bvsgt (x!47511 lt!229798) #b01111111111111111111111111111110) (bvslt lt!229795 #b00000000000000000000000000000000) (bvsge lt!229795 (size!15976 a!3235)) (bvslt (index!18490 lt!229798) #b00000000000000000000000000000000) (bvsge (index!18490 lt!229798) (size!15976 a!3235)) (not (= lt!229798 (Intermediate!4075 false (index!18490 lt!229798) (x!47511 lt!229798))))))))

(assert (=> b!504722 (= (index!18490 lt!229798) i!1204)))

(declare-fun lt!229790 () Unit!15370)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15370)

(assert (=> b!504722 (= lt!229790 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229795 #b00000000000000000000000000000000 (index!18490 lt!229798) (x!47511 lt!229798) mask!3524))))

(assert (=> b!504722 (and (or (= (select (arr!15611 a!3235) (index!18490 lt!229798)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15611 a!3235) (index!18490 lt!229798)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15611 a!3235) (index!18490 lt!229798)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15611 a!3235) (index!18490 lt!229798)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229791 () Unit!15370)

(assert (=> b!504722 (= lt!229791 e!295472)))

(declare-fun c!59649 () Bool)

(assert (=> b!504722 (= c!59649 (= (select (arr!15611 a!3235) (index!18490 lt!229798)) (select (arr!15611 a!3235) j!176)))))

(assert (=> b!504722 (and (bvslt (x!47511 lt!229798) #b01111111111111111111111111111110) (or (= (select (arr!15611 a!3235) (index!18490 lt!229798)) (select (arr!15611 a!3235) j!176)) (= (select (arr!15611 a!3235) (index!18490 lt!229798)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15611 a!3235) (index!18490 lt!229798)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504723 () Bool)

(assert (=> b!504723 (= e!295473 true)))

(declare-fun lt!229788 () SeekEntryResult!4075)

(assert (=> b!504723 (= lt!229788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229795 lt!229796 lt!229789 mask!3524))))

(declare-fun b!504724 () Bool)

(declare-fun res!305978 () Bool)

(assert (=> b!504724 (=> (not res!305978) (not e!295470))))

(declare-datatypes ((List!9808 0))(
  ( (Nil!9805) (Cons!9804 (h!10681 (_ BitVec 64)) (t!16027 List!9808)) )
))
(declare-fun arrayNoDuplicates!0 (array!32462 (_ BitVec 32) List!9808) Bool)

(assert (=> b!504724 (= res!305978 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9805))))

(declare-fun b!504725 () Bool)

(declare-fun res!305976 () Bool)

(assert (=> b!504725 (=> (not res!305976) (not e!295467))))

(assert (=> b!504725 (= res!305976 (validKeyInArray!0 k0!2280))))

(declare-fun b!504726 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32462 (_ BitVec 32)) SeekEntryResult!4075)

(assert (=> b!504726 (= e!295469 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229795 (index!18490 lt!229798) (select (arr!15611 a!3235) j!176) a!3235 mask!3524) (Found!4075 j!176))))))

(declare-fun b!504727 () Bool)

(assert (=> b!504727 (= e!295470 (not e!295471))))

(declare-fun res!305984 () Bool)

(assert (=> b!504727 (=> res!305984 e!295471)))

(declare-fun lt!229797 () (_ BitVec 32))

(assert (=> b!504727 (= res!305984 (= lt!229798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229797 lt!229796 lt!229789 mask!3524)))))

(assert (=> b!504727 (= lt!229798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229795 (select (arr!15611 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504727 (= lt!229797 (toIndex!0 lt!229796 mask!3524))))

(assert (=> b!504727 (= lt!229796 (select (store (arr!15611 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504727 (= lt!229795 (toIndex!0 (select (arr!15611 a!3235) j!176) mask!3524))))

(assert (=> b!504727 (= lt!229789 (array!32463 (store (arr!15611 a!3235) i!1204 k0!2280) (size!15976 a!3235)))))

(assert (=> b!504727 e!295468))

(declare-fun res!305979 () Bool)

(assert (=> b!504727 (=> (not res!305979) (not e!295468))))

(assert (=> b!504727 (= res!305979 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229794 () Unit!15370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15370)

(assert (=> b!504727 (= lt!229794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!305974 () Bool)

(assert (=> start!45696 (=> (not res!305974) (not e!295467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45696 (= res!305974 (validMask!0 mask!3524))))

(assert (=> start!45696 e!295467))

(assert (=> start!45696 true))

(declare-fun array_inv!11494 (array!32462) Bool)

(assert (=> start!45696 (array_inv!11494 a!3235)))

(assert (= (and start!45696 res!305974) b!504712))

(assert (= (and b!504712 res!305975) b!504714))

(assert (= (and b!504714 res!305977) b!504725))

(assert (= (and b!504725 res!305976) b!504713))

(assert (= (and b!504713 res!305982) b!504717))

(assert (= (and b!504717 res!305983) b!504721))

(assert (= (and b!504721 res!305973) b!504724))

(assert (= (and b!504724 res!305978) b!504727))

(assert (= (and b!504727 res!305979) b!504715))

(assert (= (and b!504727 (not res!305984)) b!504720))

(assert (= (and b!504720 (not res!305970)) b!504722))

(assert (= (and b!504722 c!59649) b!504719))

(assert (= (and b!504722 (not c!59649)) b!504718))

(assert (= (and b!504719 res!305972) b!504711))

(assert (= (and b!504722 (not res!305981)) b!504716))

(assert (= (and b!504716 res!305980) b!504726))

(assert (= (and b!504716 (not res!305971)) b!504723))

(declare-fun m!484915 () Bool)

(assert (=> b!504727 m!484915))

(declare-fun m!484917 () Bool)

(assert (=> b!504727 m!484917))

(declare-fun m!484919 () Bool)

(assert (=> b!504727 m!484919))

(declare-fun m!484921 () Bool)

(assert (=> b!504727 m!484921))

(declare-fun m!484923 () Bool)

(assert (=> b!504727 m!484923))

(assert (=> b!504727 m!484915))

(declare-fun m!484925 () Bool)

(assert (=> b!504727 m!484925))

(declare-fun m!484927 () Bool)

(assert (=> b!504727 m!484927))

(assert (=> b!504727 m!484915))

(declare-fun m!484929 () Bool)

(assert (=> b!504727 m!484929))

(declare-fun m!484931 () Bool)

(assert (=> b!504727 m!484931))

(declare-fun m!484933 () Bool)

(assert (=> b!504713 m!484933))

(declare-fun m!484935 () Bool)

(assert (=> b!504722 m!484935))

(declare-fun m!484937 () Bool)

(assert (=> b!504722 m!484937))

(assert (=> b!504722 m!484915))

(declare-fun m!484939 () Bool)

(assert (=> start!45696 m!484939))

(declare-fun m!484941 () Bool)

(assert (=> start!45696 m!484941))

(declare-fun m!484943 () Bool)

(assert (=> b!504723 m!484943))

(declare-fun m!484945 () Bool)

(assert (=> b!504725 m!484945))

(assert (=> b!504715 m!484915))

(assert (=> b!504715 m!484915))

(declare-fun m!484947 () Bool)

(assert (=> b!504715 m!484947))

(declare-fun m!484949 () Bool)

(assert (=> b!504721 m!484949))

(declare-fun m!484951 () Bool)

(assert (=> b!504717 m!484951))

(assert (=> b!504714 m!484915))

(assert (=> b!504714 m!484915))

(declare-fun m!484953 () Bool)

(assert (=> b!504714 m!484953))

(declare-fun m!484955 () Bool)

(assert (=> b!504719 m!484955))

(assert (=> b!504719 m!484943))

(assert (=> b!504726 m!484915))

(assert (=> b!504726 m!484915))

(declare-fun m!484957 () Bool)

(assert (=> b!504726 m!484957))

(declare-fun m!484959 () Bool)

(assert (=> b!504724 m!484959))

(check-sat (not b!504713) (not b!504727) (not b!504714) (not b!504724) (not b!504715) (not b!504725) (not b!504717) (not b!504723) (not start!45696) (not b!504726) (not b!504719) (not b!504721) (not b!504722))
(check-sat)
