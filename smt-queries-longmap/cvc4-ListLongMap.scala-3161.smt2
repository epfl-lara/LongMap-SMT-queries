; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44542 () Bool)

(assert start!44542)

(declare-fun b!488946 () Bool)

(declare-fun res!291999 () Bool)

(declare-fun e!287594 () Bool)

(assert (=> b!488946 (=> (not res!291999) (not e!287594))))

(declare-datatypes ((array!31652 0))(
  ( (array!31653 (arr!15215 (Array (_ BitVec 32) (_ BitVec 64))) (size!15579 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31652)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488946 (= res!291999 (validKeyInArray!0 (select (arr!15215 a!3235) j!176)))))

(declare-fun b!488947 () Bool)

(declare-fun res!291995 () Bool)

(assert (=> b!488947 (=> (not res!291995) (not e!287594))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!488947 (= res!291995 (validKeyInArray!0 k!2280))))

(declare-fun res!291997 () Bool)

(assert (=> start!44542 (=> (not res!291997) (not e!287594))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44542 (= res!291997 (validMask!0 mask!3524))))

(assert (=> start!44542 e!287594))

(assert (=> start!44542 true))

(declare-fun array_inv!11011 (array!31652) Bool)

(assert (=> start!44542 (array_inv!11011 a!3235)))

(declare-fun b!488948 () Bool)

(declare-fun e!287593 () Bool)

(assert (=> b!488948 (= e!287594 e!287593)))

(declare-fun res!291994 () Bool)

(assert (=> b!488948 (=> (not res!291994) (not e!287593))))

(declare-datatypes ((SeekEntryResult!3682 0))(
  ( (MissingZero!3682 (index!16907 (_ BitVec 32))) (Found!3682 (index!16908 (_ BitVec 32))) (Intermediate!3682 (undefined!4494 Bool) (index!16909 (_ BitVec 32)) (x!46017 (_ BitVec 32))) (Undefined!3682) (MissingVacant!3682 (index!16910 (_ BitVec 32))) )
))
(declare-fun lt!220583 () SeekEntryResult!3682)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488948 (= res!291994 (or (= lt!220583 (MissingZero!3682 i!1204)) (= lt!220583 (MissingVacant!3682 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31652 (_ BitVec 32)) SeekEntryResult!3682)

(assert (=> b!488948 (= lt!220583 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488949 () Bool)

(declare-fun res!291996 () Bool)

(assert (=> b!488949 (=> (not res!291996) (not e!287593))))

(declare-datatypes ((List!9373 0))(
  ( (Nil!9370) (Cons!9369 (h!10228 (_ BitVec 64)) (t!15601 List!9373)) )
))
(declare-fun arrayNoDuplicates!0 (array!31652 (_ BitVec 32) List!9373) Bool)

(assert (=> b!488949 (= res!291996 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9370))))

(declare-fun b!488950 () Bool)

(declare-fun res!292000 () Bool)

(assert (=> b!488950 (=> (not res!292000) (not e!287594))))

(declare-fun arrayContainsKey!0 (array!31652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488950 (= res!292000 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488951 () Bool)

(declare-fun lt!220585 () (_ BitVec 32))

(assert (=> b!488951 (= e!287593 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!220585 #b00000000000000000000000000000000) (bvslt lt!220585 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488951 (= lt!220585 (toIndex!0 (select (store (arr!15215 a!3235) i!1204 k!2280) j!176) mask!3524))))

(declare-fun e!287592 () Bool)

(assert (=> b!488951 e!287592))

(declare-fun res!291998 () Bool)

(assert (=> b!488951 (=> (not res!291998) (not e!287592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31652 (_ BitVec 32)) Bool)

(assert (=> b!488951 (= res!291998 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14310 0))(
  ( (Unit!14311) )
))
(declare-fun lt!220584 () Unit!14310)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14310)

(assert (=> b!488951 (= lt!220584 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488952 () Bool)

(declare-fun res!292001 () Bool)

(assert (=> b!488952 (=> (not res!292001) (not e!287594))))

(assert (=> b!488952 (= res!292001 (and (= (size!15579 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15579 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15579 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488953 () Bool)

(declare-fun res!291993 () Bool)

(assert (=> b!488953 (=> (not res!291993) (not e!287593))))

(assert (=> b!488953 (= res!291993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488954 () Bool)

(assert (=> b!488954 (= e!287592 (= (seekEntryOrOpen!0 (select (arr!15215 a!3235) j!176) a!3235 mask!3524) (Found!3682 j!176)))))

(assert (= (and start!44542 res!291997) b!488952))

(assert (= (and b!488952 res!292001) b!488946))

(assert (= (and b!488946 res!291999) b!488947))

(assert (= (and b!488947 res!291995) b!488950))

(assert (= (and b!488950 res!292000) b!488948))

(assert (= (and b!488948 res!291994) b!488953))

(assert (= (and b!488953 res!291993) b!488949))

(assert (= (and b!488949 res!291996) b!488951))

(assert (= (and b!488951 res!291998) b!488954))

(declare-fun m!468687 () Bool)

(assert (=> b!488950 m!468687))

(declare-fun m!468689 () Bool)

(assert (=> b!488946 m!468689))

(assert (=> b!488946 m!468689))

(declare-fun m!468691 () Bool)

(assert (=> b!488946 m!468691))

(declare-fun m!468693 () Bool)

(assert (=> start!44542 m!468693))

(declare-fun m!468695 () Bool)

(assert (=> start!44542 m!468695))

(declare-fun m!468697 () Bool)

(assert (=> b!488947 m!468697))

(declare-fun m!468699 () Bool)

(assert (=> b!488951 m!468699))

(declare-fun m!468701 () Bool)

(assert (=> b!488951 m!468701))

(declare-fun m!468703 () Bool)

(assert (=> b!488951 m!468703))

(declare-fun m!468705 () Bool)

(assert (=> b!488951 m!468705))

(assert (=> b!488951 m!468703))

(declare-fun m!468707 () Bool)

(assert (=> b!488951 m!468707))

(declare-fun m!468709 () Bool)

(assert (=> b!488949 m!468709))

(declare-fun m!468711 () Bool)

(assert (=> b!488953 m!468711))

(declare-fun m!468713 () Bool)

(assert (=> b!488948 m!468713))

(assert (=> b!488954 m!468689))

(assert (=> b!488954 m!468689))

(declare-fun m!468715 () Bool)

(assert (=> b!488954 m!468715))

(push 1)

(assert (not b!488946))

(assert (not b!488947))

(assert (not b!488951))

(assert (not start!44542))

(assert (not b!488953))

(assert (not b!488949))

(assert (not b!488954))

(assert (not b!488950))

(assert (not b!488948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!489006 () Bool)

(declare-fun e!287634 () SeekEntryResult!3682)

(declare-fun lt!220619 () SeekEntryResult!3682)

(assert (=> b!489006 (= e!287634 (MissingZero!3682 (index!16909 lt!220619)))))

(declare-fun b!489007 () Bool)

(declare-fun e!287633 () SeekEntryResult!3682)

(declare-fun e!287632 () SeekEntryResult!3682)

(assert (=> b!489007 (= e!287633 e!287632)))

(declare-fun lt!220620 () (_ BitVec 64))

(assert (=> b!489007 (= lt!220620 (select (arr!15215 a!3235) (index!16909 lt!220619)))))

(declare-fun c!58761 () Bool)

(assert (=> b!489007 (= c!58761 (= lt!220620 (select (arr!15215 a!3235) j!176)))))

(declare-fun d!77865 () Bool)

(declare-fun lt!220621 () SeekEntryResult!3682)

(assert (=> d!77865 (and (or (is-Undefined!3682 lt!220621) (not (is-Found!3682 lt!220621)) (and (bvsge (index!16908 lt!220621) #b00000000000000000000000000000000) (bvslt (index!16908 lt!220621) (size!15579 a!3235)))) (or (is-Undefined!3682 lt!220621) (is-Found!3682 lt!220621) (not (is-MissingZero!3682 lt!220621)) (and (bvsge (index!16907 lt!220621) #b00000000000000000000000000000000) (bvslt (index!16907 lt!220621) (size!15579 a!3235)))) (or (is-Undefined!3682 lt!220621) (is-Found!3682 lt!220621) (is-MissingZero!3682 lt!220621) (not (is-MissingVacant!3682 lt!220621)) (and (bvsge (index!16910 lt!220621) #b00000000000000000000000000000000) (bvslt (index!16910 lt!220621) (size!15579 a!3235)))) (or (is-Undefined!3682 lt!220621) (ite (is-Found!3682 lt!220621) (= (select (arr!15215 a!3235) (index!16908 lt!220621)) (select (arr!15215 a!3235) j!176)) (ite (is-MissingZero!3682 lt!220621) (= (select (arr!15215 a!3235) (index!16907 lt!220621)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3682 lt!220621) (= (select (arr!15215 a!3235) (index!16910 lt!220621)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77865 (= lt!220621 e!287633)))

(declare-fun c!58763 () Bool)

(assert (=> d!77865 (= c!58763 (and (is-Intermediate!3682 lt!220619) (undefined!4494 lt!220619)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31652 (_ BitVec 32)) SeekEntryResult!3682)

(assert (=> d!77865 (= lt!220619 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15215 a!3235) j!176) mask!3524) (select (arr!15215 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77865 (validMask!0 mask!3524)))

(assert (=> d!77865 (= (seekEntryOrOpen!0 (select (arr!15215 a!3235) j!176) a!3235 mask!3524) lt!220621)))

(declare-fun b!489008 () Bool)

(declare-fun c!58762 () Bool)

(assert (=> b!489008 (= c!58762 (= lt!220620 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!489008 (= e!287632 e!287634)))

(declare-fun b!489009 () Bool)

(assert (=> b!489009 (= e!287632 (Found!3682 (index!16909 lt!220619)))))

(declare-fun b!489010 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31652 (_ BitVec 32)) SeekEntryResult!3682)

(assert (=> b!489010 (= e!287634 (seekKeyOrZeroReturnVacant!0 (x!46017 lt!220619) (index!16909 lt!220619) (index!16909 lt!220619) (select (arr!15215 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!489011 () Bool)

(assert (=> b!489011 (= e!287633 Undefined!3682)))

(assert (= (and d!77865 c!58763) b!489011))

(assert (= (and d!77865 (not c!58763)) b!489007))

(assert (= (and b!489007 c!58761) b!489009))

(assert (= (and b!489007 (not c!58761)) b!489008))

(assert (= (and b!489008 c!58762) b!489006))

(assert (= (and b!489008 (not c!58762)) b!489010))

(declare-fun m!468741 () Bool)

(assert (=> b!489007 m!468741))

(declare-fun m!468743 () Bool)

(assert (=> d!77865 m!468743))

(assert (=> d!77865 m!468689))

(declare-fun m!468745 () Bool)

(assert (=> d!77865 m!468745))

(declare-fun m!468747 () Bool)

(assert (=> d!77865 m!468747))

(assert (=> d!77865 m!468745))

(assert (=> d!77865 m!468689))

(declare-fun m!468749 () Bool)

(assert (=> d!77865 m!468749))

(declare-fun m!468751 () Bool)

(assert (=> d!77865 m!468751))

(assert (=> d!77865 m!468693))

(assert (=> b!489010 m!468689))

(declare-fun m!468753 () Bool)

(assert (=> b!489010 m!468753))

(assert (=> b!488954 d!77865))

(declare-fun bm!31355 () Bool)

(declare-fun call!31358 () Bool)

(declare-fun c!58772 () Bool)

(assert (=> bm!31355 (= call!31358 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58772 (Cons!9369 (select (arr!15215 a!3235) #b00000000000000000000000000000000) Nil!9370) Nil!9370)))))

(declare-fun b!489034 () Bool)

(declare-fun e!287652 () Bool)

(declare-fun e!287649 () Bool)

(assert (=> b!489034 (= e!287652 e!287649)))

(declare-fun res!292031 () Bool)

(assert (=> b!489034 (=> (not res!292031) (not e!287649))))

(declare-fun e!287651 () Bool)

(assert (=> b!489034 (= res!292031 (not e!287651))))

(declare-fun res!292030 () Bool)

(assert (=> b!489034 (=> (not res!292030) (not e!287651))))

(assert (=> b!489034 (= res!292030 (validKeyInArray!0 (select (arr!15215 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77877 () Bool)

(declare-fun res!292032 () Bool)

(assert (=> d!77877 (=> res!292032 e!287652)))

(assert (=> d!77877 (= res!292032 (bvsge #b00000000000000000000000000000000 (size!15579 a!3235)))))

(assert (=> d!77877 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9370) e!287652)))

(declare-fun b!489035 () Bool)

(declare-fun contains!2707 (List!9373 (_ BitVec 64)) Bool)

(assert (=> b!489035 (= e!287651 (contains!2707 Nil!9370 (select (arr!15215 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!489036 () Bool)

(declare-fun e!287650 () Bool)

(assert (=> b!489036 (= e!287650 call!31358)))

(declare-fun b!489037 () Bool)

(assert (=> b!489037 (= e!287650 call!31358)))

(declare-fun b!489038 () Bool)

(assert (=> b!489038 (= e!287649 e!287650)))

(assert (=> b!489038 (= c!58772 (validKeyInArray!0 (select (arr!15215 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77877 (not res!292032)) b!489034))

(assert (= (and b!489034 res!292030) b!489035))

(assert (= (and b!489034 res!292031) b!489038))

(assert (= (and b!489038 c!58772) b!489037))

(assert (= (and b!489038 (not c!58772)) b!489036))

(assert (= (or b!489037 b!489036) bm!31355))

(declare-fun m!468755 () Bool)

(assert (=> bm!31355 m!468755))

(declare-fun m!468757 () Bool)

(assert (=> bm!31355 m!468757))

(assert (=> b!489034 m!468755))

(assert (=> b!489034 m!468755))

(declare-fun m!468759 () Bool)

(assert (=> b!489034 m!468759))

(assert (=> b!489035 m!468755))

(assert (=> b!489035 m!468755))

(declare-fun m!468761 () Bool)

(assert (=> b!489035 m!468761))

(assert (=> b!489038 m!468755))

(assert (=> b!489038 m!468755))

(assert (=> b!489038 m!468759))

(assert (=> b!488949 d!77877))

(declare-fun d!77879 () Bool)

(declare-fun lt!220636 () (_ BitVec 32))

(declare-fun lt!220635 () (_ BitVec 32))

(assert (=> d!77879 (= lt!220636 (bvmul (bvxor lt!220635 (bvlshr lt!220635 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77879 (= lt!220635 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15215 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15215 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77879 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!292033 (let ((h!10230 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15215 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15215 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46019 (bvmul (bvxor h!10230 (bvlshr h!10230 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46019 (bvlshr x!46019 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!292033 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!292033 #b00000000000000000000000000000000))))))

(assert (=> d!77879 (= (toIndex!0 (select (store (arr!15215 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!220636 (bvlshr lt!220636 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!488951 d!77879))

(declare-fun b!489069 () Bool)

(declare-fun e!287678 () Bool)

(declare-fun call!31362 () Bool)

(assert (=> b!489069 (= e!287678 call!31362)))

(declare-fun b!489070 () Bool)

(declare-fun e!287679 () Bool)

(assert (=> b!489070 (= e!287679 call!31362)))

(declare-fun d!77887 () Bool)

(declare-fun res!292053 () Bool)

(declare-fun e!287677 () Bool)

(assert (=> d!77887 (=> res!292053 e!287677)))

(assert (=> d!77887 (= res!292053 (bvsge j!176 (size!15579 a!3235)))))

(assert (=> d!77887 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287677)))

(declare-fun b!489071 () Bool)

(assert (=> b!489071 (= e!287679 e!287678)))

(declare-fun lt!220653 () (_ BitVec 64))

(assert (=> b!489071 (= lt!220653 (select (arr!15215 a!3235) j!176))))

(declare-fun lt!220652 () Unit!14310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31652 (_ BitVec 64) (_ BitVec 32)) Unit!14310)

(assert (=> b!489071 (= lt!220652 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220653 j!176))))

(assert (=> b!489071 (arrayContainsKey!0 a!3235 lt!220653 #b00000000000000000000000000000000)))

(declare-fun lt!220654 () Unit!14310)

(assert (=> b!489071 (= lt!220654 lt!220652)))

(declare-fun res!292054 () Bool)

(assert (=> b!489071 (= res!292054 (= (seekEntryOrOpen!0 (select (arr!15215 a!3235) j!176) a!3235 mask!3524) (Found!3682 j!176)))))

(assert (=> b!489071 (=> (not res!292054) (not e!287678))))

(declare-fun bm!31359 () Bool)

(assert (=> bm!31359 (= call!31362 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!489072 () Bool)

(assert (=> b!489072 (= e!287677 e!287679)))

(declare-fun c!58779 () Bool)

(assert (=> b!489072 (= c!58779 (validKeyInArray!0 (select (arr!15215 a!3235) j!176)))))

(assert (= (and d!77887 (not res!292053)) b!489072))

(assert (= (and b!489072 c!58779) b!489071))

(assert (= (and b!489072 (not c!58779)) b!489070))

(assert (= (and b!489071 res!292054) b!489069))

(assert (= (or b!489069 b!489070) bm!31359))

(assert (=> b!489071 m!468689))

(declare-fun m!468789 () Bool)

(assert (=> b!489071 m!468789))

(declare-fun m!468791 () Bool)

(assert (=> b!489071 m!468791))

(assert (=> b!489071 m!468689))

(assert (=> b!489071 m!468715))

(declare-fun m!468793 () Bool)

(assert (=> bm!31359 m!468793))

(assert (=> b!489072 m!468689))

(assert (=> b!489072 m!468689))

(assert (=> b!489072 m!468691))

(assert (=> b!488951 d!77887))

(declare-fun d!77899 () Bool)

(assert (=> d!77899 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220663 () Unit!14310)

(declare-fun choose!38 (array!31652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14310)

(assert (=> d!77899 (= lt!220663 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77899 (validMask!0 mask!3524)))

(assert (=> d!77899 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220663)))

(declare-fun bs!15585 () Bool)

(assert (= bs!15585 d!77899))

(assert (=> bs!15585 m!468705))

(declare-fun m!468811 () Bool)

(assert (=> bs!15585 m!468811))

(assert (=> bs!15585 m!468693))

(assert (=> b!488951 d!77899))

(declare-fun d!77907 () Bool)

(declare-fun res!292059 () Bool)

(declare-fun e!287687 () Bool)

(assert (=> d!77907 (=> res!292059 e!287687)))

(assert (=> d!77907 (= res!292059 (= (select (arr!15215 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77907 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!287687)))

(declare-fun b!489083 () Bool)

(declare-fun e!287688 () Bool)

(assert (=> b!489083 (= e!287687 e!287688)))

(declare-fun res!292060 () Bool)

(assert (=> b!489083 (=> (not res!292060) (not e!287688))))

(assert (=> b!489083 (= res!292060 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15579 a!3235)))))

(declare-fun b!489084 () Bool)

(assert (=> b!489084 (= e!287688 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77907 (not res!292059)) b!489083))

(assert (= (and b!489083 res!292060) b!489084))

(assert (=> d!77907 m!468755))

(declare-fun m!468813 () Bool)

(assert (=> b!489084 m!468813))

(assert (=> b!488950 d!77907))

(declare-fun d!77909 () Bool)

(assert (=> d!77909 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488947 d!77909))

(declare-fun d!77911 () Bool)

(assert (=> d!77911 (= (validKeyInArray!0 (select (arr!15215 a!3235) j!176)) (and (not (= (select (arr!15215 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15215 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488946 d!77911))

(declare-fun b!489085 () Bool)

(declare-fun e!287691 () SeekEntryResult!3682)

(declare-fun lt!220664 () SeekEntryResult!3682)

(assert (=> b!489085 (= e!287691 (MissingZero!3682 (index!16909 lt!220664)))))

(declare-fun b!489086 () Bool)

(declare-fun e!287690 () SeekEntryResult!3682)

(declare-fun e!287689 () SeekEntryResult!3682)

(assert (=> b!489086 (= e!287690 e!287689)))

(declare-fun lt!220665 () (_ BitVec 64))

(assert (=> b!489086 (= lt!220665 (select (arr!15215 a!3235) (index!16909 lt!220664)))))

(declare-fun c!58783 () Bool)

(assert (=> b!489086 (= c!58783 (= lt!220665 k!2280))))

(declare-fun d!77913 () Bool)

(declare-fun lt!220666 () SeekEntryResult!3682)

(assert (=> d!77913 (and (or (is-Undefined!3682 lt!220666) (not (is-Found!3682 lt!220666)) (and (bvsge (index!16908 lt!220666) #b00000000000000000000000000000000) (bvslt (index!16908 lt!220666) (size!15579 a!3235)))) (or (is-Undefined!3682 lt!220666) (is-Found!3682 lt!220666) (not (is-MissingZero!3682 lt!220666)) (and (bvsge (index!16907 lt!220666) #b00000000000000000000000000000000) (bvslt (index!16907 lt!220666) (size!15579 a!3235)))) (or (is-Undefined!3682 lt!220666) (is-Found!3682 lt!220666) (is-MissingZero!3682 lt!220666) (not (is-MissingVacant!3682 lt!220666)) (and (bvsge (index!16910 lt!220666) #b00000000000000000000000000000000) (bvslt (index!16910 lt!220666) (size!15579 a!3235)))) (or (is-Undefined!3682 lt!220666) (ite (is-Found!3682 lt!220666) (= (select (arr!15215 a!3235) (index!16908 lt!220666)) k!2280) (ite (is-MissingZero!3682 lt!220666) (= (select (arr!15215 a!3235) (index!16907 lt!220666)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3682 lt!220666) (= (select (arr!15215 a!3235) (index!16910 lt!220666)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77913 (= lt!220666 e!287690)))

(declare-fun c!58785 () Bool)

(assert (=> d!77913 (= c!58785 (and (is-Intermediate!3682 lt!220664) (undefined!4494 lt!220664)))))

(assert (=> d!77913 (= lt!220664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77913 (validMask!0 mask!3524)))

(assert (=> d!77913 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!220666)))

(declare-fun b!489087 () Bool)

(declare-fun c!58784 () Bool)

(assert (=> b!489087 (= c!58784 (= lt!220665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!489087 (= e!287689 e!287691)))

(declare-fun b!489088 () Bool)

(assert (=> b!489088 (= e!287689 (Found!3682 (index!16909 lt!220664)))))

(declare-fun b!489089 () Bool)

(assert (=> b!489089 (= e!287691 (seekKeyOrZeroReturnVacant!0 (x!46017 lt!220664) (index!16909 lt!220664) (index!16909 lt!220664) k!2280 a!3235 mask!3524))))

(declare-fun b!489090 () Bool)

(assert (=> b!489090 (= e!287690 Undefined!3682)))

(assert (= (and d!77913 c!58785) b!489090))

(assert (= (and d!77913 (not c!58785)) b!489086))

(assert (= (and b!489086 c!58783) b!489088))

(assert (= (and b!489086 (not c!58783)) b!489087))

(assert (= (and b!489087 c!58784) b!489085))

(assert (= (and b!489087 (not c!58784)) b!489089))

(declare-fun m!468815 () Bool)

(assert (=> b!489086 m!468815))

(declare-fun m!468817 () Bool)

(assert (=> d!77913 m!468817))

(declare-fun m!468819 () Bool)

(assert (=> d!77913 m!468819))

(declare-fun m!468821 () Bool)

(assert (=> d!77913 m!468821))

(assert (=> d!77913 m!468819))

(declare-fun m!468823 () Bool)

(assert (=> d!77913 m!468823))

(declare-fun m!468825 () Bool)

(assert (=> d!77913 m!468825))

(assert (=> d!77913 m!468693))

(declare-fun m!468827 () Bool)

(assert (=> b!489089 m!468827))

(assert (=> b!488948 d!77913))

(declare-fun d!77915 () Bool)

(assert (=> d!77915 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44542 d!77915))

(declare-fun d!77921 () Bool)

(assert (=> d!77921 (= (array_inv!11011 a!3235) (bvsge (size!15579 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44542 d!77921))

(declare-fun b!489119 () Bool)

(declare-fun e!287710 () Bool)

(declare-fun call!31365 () Bool)

(assert (=> b!489119 (= e!287710 call!31365)))

(declare-fun b!489120 () Bool)

(declare-fun e!287711 () Bool)

(assert (=> b!489120 (= e!287711 call!31365)))

(declare-fun d!77923 () Bool)

(declare-fun res!292067 () Bool)

(declare-fun e!287709 () Bool)

(assert (=> d!77923 (=> res!292067 e!287709)))

(assert (=> d!77923 (= res!292067 (bvsge #b00000000000000000000000000000000 (size!15579 a!3235)))))

(assert (=> d!77923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287709)))

(declare-fun b!489121 () Bool)

(assert (=> b!489121 (= e!287711 e!287710)))

(declare-fun lt!220677 () (_ BitVec 64))

(assert (=> b!489121 (= lt!220677 (select (arr!15215 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220676 () Unit!14310)

(assert (=> b!489121 (= lt!220676 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220677 #b00000000000000000000000000000000))))

(assert (=> b!489121 (arrayContainsKey!0 a!3235 lt!220677 #b00000000000000000000000000000000)))

(declare-fun lt!220678 () Unit!14310)

(assert (=> b!489121 (= lt!220678 lt!220676)))

(declare-fun res!292068 () Bool)

(assert (=> b!489121 (= res!292068 (= (seekEntryOrOpen!0 (select (arr!15215 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3682 #b00000000000000000000000000000000)))))

(assert (=> b!489121 (=> (not res!292068) (not e!287710))))

(declare-fun bm!31360 () Bool)

(assert (=> bm!31360 (= call!31365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!489122 () Bool)

(assert (=> b!489122 (= e!287709 e!287711)))

(declare-fun c!58797 () Bool)

(assert (=> b!489122 (= c!58797 (validKeyInArray!0 (select (arr!15215 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77923 (not res!292067)) b!489122))

(assert (= (and b!489122 c!58797) b!489121))

(assert (= (and b!489122 (not c!58797)) b!489120))

(assert (= (and b!489121 res!292068) b!489119))

(assert (= (or b!489119 b!489120) bm!31360))

(assert (=> b!489121 m!468755))

(declare-fun m!468843 () Bool)

(assert (=> b!489121 m!468843))

(declare-fun m!468845 () Bool)

(assert (=> b!489121 m!468845))

(assert (=> b!489121 m!468755))

(declare-fun m!468847 () Bool)

(assert (=> b!489121 m!468847))

(declare-fun m!468849 () Bool)

(assert (=> bm!31360 m!468849))

(assert (=> b!489122 m!468755))

(assert (=> b!489122 m!468755))

(assert (=> b!489122 m!468759))

(assert (=> b!488953 d!77923))

(push 1)

(assert (not b!489010))

(assert (not d!77913))

(assert (not d!77865))

(assert (not b!489071))

(assert (not b!489034))

(assert (not b!489121))

(assert (not b!489084))

(assert (not bm!31355))

(assert (not b!489035))

(assert (not bm!31359))

(assert (not bm!31360))

(assert (not b!489089))

(assert (not b!489072))

(assert (not b!489122))

(assert (not d!77899))

(assert (not b!489038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

