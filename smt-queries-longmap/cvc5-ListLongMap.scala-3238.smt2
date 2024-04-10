; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45234 () Bool)

(assert start!45234)

(declare-fun b!496684 () Bool)

(declare-fun e!291237 () Bool)

(declare-fun e!291233 () Bool)

(assert (=> b!496684 (= e!291237 (not e!291233))))

(declare-fun res!299079 () Bool)

(assert (=> b!496684 (=> res!299079 e!291233)))

(declare-datatypes ((SeekEntryResult!3911 0))(
  ( (MissingZero!3911 (index!17823 (_ BitVec 32))) (Found!3911 (index!17824 (_ BitVec 32))) (Intermediate!3911 (undefined!4723 Bool) (index!17825 (_ BitVec 32)) (x!46883 (_ BitVec 32))) (Undefined!3911) (MissingVacant!3911 (index!17826 (_ BitVec 32))) )
))
(declare-fun lt!224853 () SeekEntryResult!3911)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224854 () (_ BitVec 32))

(declare-datatypes ((array!32122 0))(
  ( (array!32123 (arr!15444 (Array (_ BitVec 32) (_ BitVec 64))) (size!15808 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32122)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32122 (_ BitVec 32)) SeekEntryResult!3911)

(assert (=> b!496684 (= res!299079 (= lt!224853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224854 (select (store (arr!15444 a!3235) i!1204 k!2280) j!176) (array!32123 (store (arr!15444 a!3235) i!1204 k!2280) (size!15808 a!3235)) mask!3524)))))

(declare-fun lt!224856 () (_ BitVec 32))

(assert (=> b!496684 (= lt!224853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224856 (select (arr!15444 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496684 (= lt!224854 (toIndex!0 (select (store (arr!15444 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496684 (= lt!224856 (toIndex!0 (select (arr!15444 a!3235) j!176) mask!3524))))

(declare-fun e!291236 () Bool)

(assert (=> b!496684 e!291236))

(declare-fun res!299074 () Bool)

(assert (=> b!496684 (=> (not res!299074) (not e!291236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32122 (_ BitVec 32)) Bool)

(assert (=> b!496684 (= res!299074 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14768 0))(
  ( (Unit!14769) )
))
(declare-fun lt!224855 () Unit!14768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14768)

(assert (=> b!496684 (= lt!224855 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496685 () Bool)

(declare-fun res!299072 () Bool)

(assert (=> b!496685 (=> (not res!299072) (not e!291237))))

(declare-datatypes ((List!9602 0))(
  ( (Nil!9599) (Cons!9598 (h!10469 (_ BitVec 64)) (t!15830 List!9602)) )
))
(declare-fun arrayNoDuplicates!0 (array!32122 (_ BitVec 32) List!9602) Bool)

(assert (=> b!496685 (= res!299072 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9599))))

(declare-fun b!496686 () Bool)

(declare-fun res!299080 () Bool)

(declare-fun e!291234 () Bool)

(assert (=> b!496686 (=> (not res!299080) (not e!291234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496686 (= res!299080 (validKeyInArray!0 k!2280))))

(declare-fun b!496687 () Bool)

(declare-fun res!299073 () Bool)

(assert (=> b!496687 (=> (not res!299073) (not e!291234))))

(declare-fun arrayContainsKey!0 (array!32122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496687 (= res!299073 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!299077 () Bool)

(assert (=> start!45234 (=> (not res!299077) (not e!291234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45234 (= res!299077 (validMask!0 mask!3524))))

(assert (=> start!45234 e!291234))

(assert (=> start!45234 true))

(declare-fun array_inv!11240 (array!32122) Bool)

(assert (=> start!45234 (array_inv!11240 a!3235)))

(declare-fun b!496688 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32122 (_ BitVec 32)) SeekEntryResult!3911)

(assert (=> b!496688 (= e!291236 (= (seekEntryOrOpen!0 (select (arr!15444 a!3235) j!176) a!3235 mask!3524) (Found!3911 j!176)))))

(declare-fun b!496689 () Bool)

(declare-fun res!299081 () Bool)

(assert (=> b!496689 (=> (not res!299081) (not e!291234))))

(assert (=> b!496689 (= res!299081 (and (= (size!15808 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15808 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15808 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496690 () Bool)

(declare-fun res!299078 () Bool)

(assert (=> b!496690 (=> (not res!299078) (not e!291234))))

(assert (=> b!496690 (= res!299078 (validKeyInArray!0 (select (arr!15444 a!3235) j!176)))))

(declare-fun b!496691 () Bool)

(assert (=> b!496691 (= e!291233 true)))

(assert (=> b!496691 (and (bvslt (x!46883 lt!224853) #b01111111111111111111111111111110) (or (= (select (arr!15444 a!3235) (index!17825 lt!224853)) (select (arr!15444 a!3235) j!176)) (= (select (arr!15444 a!3235) (index!17825 lt!224853)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15444 a!3235) (index!17825 lt!224853)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496692 () Bool)

(declare-fun res!299071 () Bool)

(assert (=> b!496692 (=> (not res!299071) (not e!291237))))

(assert (=> b!496692 (= res!299071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496693 () Bool)

(declare-fun res!299075 () Bool)

(assert (=> b!496693 (=> res!299075 e!291233)))

(assert (=> b!496693 (= res!299075 (or (undefined!4723 lt!224853) (not (is-Intermediate!3911 lt!224853))))))

(declare-fun b!496694 () Bool)

(assert (=> b!496694 (= e!291234 e!291237)))

(declare-fun res!299076 () Bool)

(assert (=> b!496694 (=> (not res!299076) (not e!291237))))

(declare-fun lt!224857 () SeekEntryResult!3911)

(assert (=> b!496694 (= res!299076 (or (= lt!224857 (MissingZero!3911 i!1204)) (= lt!224857 (MissingVacant!3911 i!1204))))))

(assert (=> b!496694 (= lt!224857 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45234 res!299077) b!496689))

(assert (= (and b!496689 res!299081) b!496690))

(assert (= (and b!496690 res!299078) b!496686))

(assert (= (and b!496686 res!299080) b!496687))

(assert (= (and b!496687 res!299073) b!496694))

(assert (= (and b!496694 res!299076) b!496692))

(assert (= (and b!496692 res!299071) b!496685))

(assert (= (and b!496685 res!299072) b!496684))

(assert (= (and b!496684 res!299074) b!496688))

(assert (= (and b!496684 (not res!299079)) b!496693))

(assert (= (and b!496693 (not res!299075)) b!496691))

(declare-fun m!477957 () Bool)

(assert (=> b!496686 m!477957))

(declare-fun m!477959 () Bool)

(assert (=> b!496691 m!477959))

(declare-fun m!477961 () Bool)

(assert (=> b!496691 m!477961))

(assert (=> b!496690 m!477961))

(assert (=> b!496690 m!477961))

(declare-fun m!477963 () Bool)

(assert (=> b!496690 m!477963))

(declare-fun m!477965 () Bool)

(assert (=> b!496685 m!477965))

(declare-fun m!477967 () Bool)

(assert (=> b!496687 m!477967))

(declare-fun m!477969 () Bool)

(assert (=> b!496684 m!477969))

(declare-fun m!477971 () Bool)

(assert (=> b!496684 m!477971))

(declare-fun m!477973 () Bool)

(assert (=> b!496684 m!477973))

(assert (=> b!496684 m!477961))

(declare-fun m!477975 () Bool)

(assert (=> b!496684 m!477975))

(assert (=> b!496684 m!477961))

(declare-fun m!477977 () Bool)

(assert (=> b!496684 m!477977))

(assert (=> b!496684 m!477961))

(declare-fun m!477979 () Bool)

(assert (=> b!496684 m!477979))

(assert (=> b!496684 m!477973))

(declare-fun m!477981 () Bool)

(assert (=> b!496684 m!477981))

(assert (=> b!496684 m!477973))

(declare-fun m!477983 () Bool)

(assert (=> b!496684 m!477983))

(declare-fun m!477985 () Bool)

(assert (=> start!45234 m!477985))

(declare-fun m!477987 () Bool)

(assert (=> start!45234 m!477987))

(declare-fun m!477989 () Bool)

(assert (=> b!496694 m!477989))

(declare-fun m!477991 () Bool)

(assert (=> b!496692 m!477991))

(assert (=> b!496688 m!477961))

(assert (=> b!496688 m!477961))

(declare-fun m!477993 () Bool)

(assert (=> b!496688 m!477993))

(push 1)

