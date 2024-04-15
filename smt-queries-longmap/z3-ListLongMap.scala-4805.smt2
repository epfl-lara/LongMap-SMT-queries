; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65936 () Bool)

(assert start!65936)

(declare-fun b!759976 () Bool)

(declare-fun res!514295 () Bool)

(declare-fun e!423637 () Bool)

(assert (=> b!759976 (=> (not res!514295) (not e!423637))))

(declare-datatypes ((array!42063 0))(
  ( (array!42064 (arr!20144 (Array (_ BitVec 32) (_ BitVec 64))) (size!20565 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42063)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759976 (= res!514295 (validKeyInArray!0 (select (arr!20144 a!3186) j!159)))))

(declare-fun b!759977 () Bool)

(declare-fun res!514287 () Bool)

(declare-fun e!423635 () Bool)

(assert (=> b!759977 (=> (not res!514287) (not e!423635))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759977 (= res!514287 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20565 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20565 a!3186))))))

(declare-datatypes ((SeekEntryResult!7741 0))(
  ( (MissingZero!7741 (index!33332 (_ BitVec 32))) (Found!7741 (index!33333 (_ BitVec 32))) (Intermediate!7741 (undefined!8553 Bool) (index!33334 (_ BitVec 32)) (x!64231 (_ BitVec 32))) (Undefined!7741) (MissingVacant!7741 (index!33335 (_ BitVec 32))) )
))
(declare-fun lt!338486 () SeekEntryResult!7741)

(declare-fun b!759978 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!423636 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42063 (_ BitVec 32)) SeekEntryResult!7741)

(assert (=> b!759978 (= e!423636 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338486))))

(declare-fun b!759980 () Bool)

(declare-fun res!514282 () Bool)

(assert (=> b!759980 (=> (not res!514282) (not e!423637))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759980 (= res!514282 (and (= (size!20565 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20565 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20565 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759981 () Bool)

(declare-fun res!514290 () Bool)

(assert (=> b!759981 (=> (not res!514290) (not e!423637))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759981 (= res!514290 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759982 () Bool)

(declare-fun res!514286 () Bool)

(declare-fun e!423639 () Bool)

(assert (=> b!759982 (=> (not res!514286) (not e!423639))))

(assert (=> b!759982 (= res!514286 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20144 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759983 () Bool)

(declare-fun e!423634 () Bool)

(declare-fun lt!338480 () SeekEntryResult!7741)

(get-info :version)

(assert (=> b!759983 (= e!423634 (not (or (not ((_ is Intermediate!7741) lt!338480)) (not (= x!1131 (x!64231 lt!338480))) (= index!1321 (index!33334 lt!338480)))))))

(declare-fun e!423633 () Bool)

(assert (=> b!759983 e!423633))

(declare-fun res!514292 () Bool)

(assert (=> b!759983 (=> (not res!514292) (not e!423633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42063 (_ BitVec 32)) Bool)

(assert (=> b!759983 (= res!514292 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26294 0))(
  ( (Unit!26295) )
))
(declare-fun lt!338484 () Unit!26294)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26294)

(assert (=> b!759983 (= lt!338484 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759984 () Bool)

(declare-fun res!514293 () Bool)

(assert (=> b!759984 (=> (not res!514293) (not e!423639))))

(assert (=> b!759984 (= res!514293 e!423636)))

(declare-fun c!83229 () Bool)

(assert (=> b!759984 (= c!83229 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759985 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42063 (_ BitVec 32)) SeekEntryResult!7741)

(assert (=> b!759985 (= e!423636 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) (Found!7741 j!159)))))

(declare-fun b!759986 () Bool)

(declare-fun res!514288 () Bool)

(assert (=> b!759986 (=> (not res!514288) (not e!423635))))

(assert (=> b!759986 (= res!514288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759987 () Bool)

(declare-fun e!423640 () Bool)

(assert (=> b!759987 (= e!423633 e!423640)))

(declare-fun res!514289 () Bool)

(assert (=> b!759987 (=> (not res!514289) (not e!423640))))

(declare-fun lt!338485 () SeekEntryResult!7741)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42063 (_ BitVec 32)) SeekEntryResult!7741)

(assert (=> b!759987 (= res!514289 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338485))))

(assert (=> b!759987 (= lt!338485 (Found!7741 j!159))))

(declare-fun b!759988 () Bool)

(assert (=> b!759988 (= e!423635 e!423639)))

(declare-fun res!514296 () Bool)

(assert (=> b!759988 (=> (not res!514296) (not e!423639))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759988 (= res!514296 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338486))))

(assert (=> b!759988 (= lt!338486 (Intermediate!7741 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759989 () Bool)

(assert (=> b!759989 (= e!423637 e!423635)))

(declare-fun res!514284 () Bool)

(assert (=> b!759989 (=> (not res!514284) (not e!423635))))

(declare-fun lt!338479 () SeekEntryResult!7741)

(assert (=> b!759989 (= res!514284 (or (= lt!338479 (MissingZero!7741 i!1173)) (= lt!338479 (MissingVacant!7741 i!1173))))))

(assert (=> b!759989 (= lt!338479 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759990 () Bool)

(assert (=> b!759990 (= e!423639 e!423634)))

(declare-fun res!514294 () Bool)

(assert (=> b!759990 (=> (not res!514294) (not e!423634))))

(declare-fun lt!338481 () SeekEntryResult!7741)

(assert (=> b!759990 (= res!514294 (= lt!338481 lt!338480))))

(declare-fun lt!338483 () (_ BitVec 64))

(declare-fun lt!338482 () array!42063)

(assert (=> b!759990 (= lt!338480 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338483 lt!338482 mask!3328))))

(assert (=> b!759990 (= lt!338481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338483 mask!3328) lt!338483 lt!338482 mask!3328))))

(assert (=> b!759990 (= lt!338483 (select (store (arr!20144 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759990 (= lt!338482 (array!42064 (store (arr!20144 a!3186) i!1173 k0!2102) (size!20565 a!3186)))))

(declare-fun b!759979 () Bool)

(declare-fun res!514285 () Bool)

(assert (=> b!759979 (=> (not res!514285) (not e!423637))))

(assert (=> b!759979 (= res!514285 (validKeyInArray!0 k0!2102))))

(declare-fun res!514283 () Bool)

(assert (=> start!65936 (=> (not res!514283) (not e!423637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65936 (= res!514283 (validMask!0 mask!3328))))

(assert (=> start!65936 e!423637))

(assert (=> start!65936 true))

(declare-fun array_inv!16027 (array!42063) Bool)

(assert (=> start!65936 (array_inv!16027 a!3186)))

(declare-fun b!759991 () Bool)

(declare-fun res!514291 () Bool)

(assert (=> b!759991 (=> (not res!514291) (not e!423635))))

(declare-datatypes ((List!14185 0))(
  ( (Nil!14182) (Cons!14181 (h!15256 (_ BitVec 64)) (t!20491 List!14185)) )
))
(declare-fun arrayNoDuplicates!0 (array!42063 (_ BitVec 32) List!14185) Bool)

(assert (=> b!759991 (= res!514291 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14182))))

(declare-fun b!759992 () Bool)

(assert (=> b!759992 (= e!423640 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338485))))

(assert (= (and start!65936 res!514283) b!759980))

(assert (= (and b!759980 res!514282) b!759976))

(assert (= (and b!759976 res!514295) b!759979))

(assert (= (and b!759979 res!514285) b!759981))

(assert (= (and b!759981 res!514290) b!759989))

(assert (= (and b!759989 res!514284) b!759986))

(assert (= (and b!759986 res!514288) b!759991))

(assert (= (and b!759991 res!514291) b!759977))

(assert (= (and b!759977 res!514287) b!759988))

(assert (= (and b!759988 res!514296) b!759982))

(assert (= (and b!759982 res!514286) b!759984))

(assert (= (and b!759984 c!83229) b!759978))

(assert (= (and b!759984 (not c!83229)) b!759985))

(assert (= (and b!759984 res!514293) b!759990))

(assert (= (and b!759990 res!514294) b!759983))

(assert (= (and b!759983 res!514292) b!759987))

(assert (= (and b!759987 res!514289) b!759992))

(declare-fun m!706655 () Bool)

(assert (=> b!759986 m!706655))

(declare-fun m!706657 () Bool)

(assert (=> b!759983 m!706657))

(declare-fun m!706659 () Bool)

(assert (=> b!759983 m!706659))

(declare-fun m!706661 () Bool)

(assert (=> b!759990 m!706661))

(declare-fun m!706663 () Bool)

(assert (=> b!759990 m!706663))

(declare-fun m!706665 () Bool)

(assert (=> b!759990 m!706665))

(declare-fun m!706667 () Bool)

(assert (=> b!759990 m!706667))

(assert (=> b!759990 m!706661))

(declare-fun m!706669 () Bool)

(assert (=> b!759990 m!706669))

(declare-fun m!706671 () Bool)

(assert (=> b!759992 m!706671))

(assert (=> b!759992 m!706671))

(declare-fun m!706673 () Bool)

(assert (=> b!759992 m!706673))

(declare-fun m!706675 () Bool)

(assert (=> b!759979 m!706675))

(declare-fun m!706677 () Bool)

(assert (=> b!759982 m!706677))

(declare-fun m!706679 () Bool)

(assert (=> start!65936 m!706679))

(declare-fun m!706681 () Bool)

(assert (=> start!65936 m!706681))

(assert (=> b!759987 m!706671))

(assert (=> b!759987 m!706671))

(declare-fun m!706683 () Bool)

(assert (=> b!759987 m!706683))

(assert (=> b!759978 m!706671))

(assert (=> b!759978 m!706671))

(declare-fun m!706685 () Bool)

(assert (=> b!759978 m!706685))

(declare-fun m!706687 () Bool)

(assert (=> b!759991 m!706687))

(declare-fun m!706689 () Bool)

(assert (=> b!759989 m!706689))

(assert (=> b!759976 m!706671))

(assert (=> b!759976 m!706671))

(declare-fun m!706691 () Bool)

(assert (=> b!759976 m!706691))

(assert (=> b!759985 m!706671))

(assert (=> b!759985 m!706671))

(declare-fun m!706693 () Bool)

(assert (=> b!759985 m!706693))

(declare-fun m!706695 () Bool)

(assert (=> b!759981 m!706695))

(assert (=> b!759988 m!706671))

(assert (=> b!759988 m!706671))

(declare-fun m!706697 () Bool)

(assert (=> b!759988 m!706697))

(assert (=> b!759988 m!706697))

(assert (=> b!759988 m!706671))

(declare-fun m!706699 () Bool)

(assert (=> b!759988 m!706699))

(check-sat (not b!759991) (not b!759989) (not b!759978) (not b!759981) (not b!759983) (not b!759986) (not b!759992) (not b!759976) (not start!65936) (not b!759988) (not b!759985) (not b!759979) (not b!759987) (not b!759990))
(check-sat)
(get-model)

(declare-fun b!760108 () Bool)

(declare-fun e!423695 () SeekEntryResult!7741)

(assert (=> b!760108 (= e!423695 (MissingVacant!7741 resIntermediateIndex!5))))

(declare-fun b!760109 () Bool)

(declare-fun c!83242 () Bool)

(declare-fun lt!338540 () (_ BitVec 64))

(assert (=> b!760109 (= c!83242 (= lt!338540 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423696 () SeekEntryResult!7741)

(assert (=> b!760109 (= e!423696 e!423695)))

(declare-fun b!760110 () Bool)

(declare-fun e!423697 () SeekEntryResult!7741)

(assert (=> b!760110 (= e!423697 Undefined!7741)))

(declare-fun b!760111 () Bool)

(assert (=> b!760111 (= e!423697 e!423696)))

(declare-fun c!83243 () Bool)

(assert (=> b!760111 (= c!83243 (= lt!338540 (select (arr!20144 a!3186) j!159)))))

(declare-fun b!760112 () Bool)

(assert (=> b!760112 (= e!423696 (Found!7741 resIntermediateIndex!5))))

(declare-fun b!760107 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760107 (= e!423695 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!338539 () SeekEntryResult!7741)

(declare-fun d!100293 () Bool)

(assert (=> d!100293 (and (or ((_ is Undefined!7741) lt!338539) (not ((_ is Found!7741) lt!338539)) (and (bvsge (index!33333 lt!338539) #b00000000000000000000000000000000) (bvslt (index!33333 lt!338539) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338539) ((_ is Found!7741) lt!338539) (not ((_ is MissingVacant!7741) lt!338539)) (not (= (index!33335 lt!338539) resIntermediateIndex!5)) (and (bvsge (index!33335 lt!338539) #b00000000000000000000000000000000) (bvslt (index!33335 lt!338539) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338539) (ite ((_ is Found!7741) lt!338539) (= (select (arr!20144 a!3186) (index!33333 lt!338539)) (select (arr!20144 a!3186) j!159)) (and ((_ is MissingVacant!7741) lt!338539) (= (index!33335 lt!338539) resIntermediateIndex!5) (= (select (arr!20144 a!3186) (index!33335 lt!338539)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100293 (= lt!338539 e!423697)))

(declare-fun c!83244 () Bool)

(assert (=> d!100293 (= c!83244 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!100293 (= lt!338540 (select (arr!20144 a!3186) resIntermediateIndex!5))))

(assert (=> d!100293 (validMask!0 mask!3328)))

(assert (=> d!100293 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338539)))

(assert (= (and d!100293 c!83244) b!760110))

(assert (= (and d!100293 (not c!83244)) b!760111))

(assert (= (and b!760111 c!83243) b!760112))

(assert (= (and b!760111 (not c!83243)) b!760109))

(assert (= (and b!760109 c!83242) b!760108))

(assert (= (and b!760109 (not c!83242)) b!760107))

(declare-fun m!706793 () Bool)

(assert (=> b!760107 m!706793))

(assert (=> b!760107 m!706793))

(assert (=> b!760107 m!706671))

(declare-fun m!706795 () Bool)

(assert (=> b!760107 m!706795))

(declare-fun m!706797 () Bool)

(assert (=> d!100293 m!706797))

(declare-fun m!706799 () Bool)

(assert (=> d!100293 m!706799))

(assert (=> d!100293 m!706677))

(assert (=> d!100293 m!706679))

(assert (=> b!759992 d!100293))

(declare-fun d!100295 () Bool)

(assert (=> d!100295 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65936 d!100295))

(declare-fun d!100297 () Bool)

(assert (=> d!100297 (= (array_inv!16027 a!3186) (bvsge (size!20565 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65936 d!100297))

(declare-fun b!760131 () Bool)

(declare-fun e!423713 () Bool)

(declare-fun e!423714 () Bool)

(assert (=> b!760131 (= e!423713 e!423714)))

(declare-fun c!83249 () Bool)

(assert (=> b!760131 (= c!83249 (validKeyInArray!0 (select (arr!20144 a!3186) j!159)))))

(declare-fun d!100299 () Bool)

(declare-fun res!514397 () Bool)

(assert (=> d!100299 (=> res!514397 e!423713)))

(assert (=> d!100299 (= res!514397 (bvsge j!159 (size!20565 a!3186)))))

(assert (=> d!100299 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!423713)))

(declare-fun b!760132 () Bool)

(declare-fun e!423712 () Bool)

(assert (=> b!760132 (= e!423714 e!423712)))

(declare-fun lt!338547 () (_ BitVec 64))

(assert (=> b!760132 (= lt!338547 (select (arr!20144 a!3186) j!159))))

(declare-fun lt!338549 () Unit!26294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42063 (_ BitVec 64) (_ BitVec 32)) Unit!26294)

(assert (=> b!760132 (= lt!338549 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338547 j!159))))

(assert (=> b!760132 (arrayContainsKey!0 a!3186 lt!338547 #b00000000000000000000000000000000)))

(declare-fun lt!338548 () Unit!26294)

(assert (=> b!760132 (= lt!338548 lt!338549)))

(declare-fun res!514398 () Bool)

(assert (=> b!760132 (= res!514398 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) (Found!7741 j!159)))))

(assert (=> b!760132 (=> (not res!514398) (not e!423712))))

(declare-fun b!760133 () Bool)

(declare-fun call!34911 () Bool)

(assert (=> b!760133 (= e!423714 call!34911)))

(declare-fun bm!34908 () Bool)

(assert (=> bm!34908 (= call!34911 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760134 () Bool)

(assert (=> b!760134 (= e!423712 call!34911)))

(assert (= (and d!100299 (not res!514397)) b!760131))

(assert (= (and b!760131 c!83249) b!760132))

(assert (= (and b!760131 (not c!83249)) b!760133))

(assert (= (and b!760132 res!514398) b!760134))

(assert (= (or b!760134 b!760133) bm!34908))

(assert (=> b!760131 m!706671))

(assert (=> b!760131 m!706671))

(assert (=> b!760131 m!706691))

(assert (=> b!760132 m!706671))

(declare-fun m!706801 () Bool)

(assert (=> b!760132 m!706801))

(declare-fun m!706803 () Bool)

(assert (=> b!760132 m!706803))

(assert (=> b!760132 m!706671))

(assert (=> b!760132 m!706683))

(declare-fun m!706805 () Bool)

(assert (=> bm!34908 m!706805))

(assert (=> b!759983 d!100299))

(declare-fun d!100303 () Bool)

(assert (=> d!100303 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338552 () Unit!26294)

(declare-fun choose!38 (array!42063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26294)

(assert (=> d!100303 (= lt!338552 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100303 (validMask!0 mask!3328)))

(assert (=> d!100303 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!338552)))

(declare-fun bs!21354 () Bool)

(assert (= bs!21354 d!100303))

(assert (=> bs!21354 m!706657))

(declare-fun m!706817 () Bool)

(assert (=> bs!21354 m!706817))

(assert (=> bs!21354 m!706679))

(assert (=> b!759983 d!100303))

(declare-fun d!100311 () Bool)

(assert (=> d!100311 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!759979 d!100311))

(declare-fun b!760206 () Bool)

(declare-fun lt!338573 () SeekEntryResult!7741)

(assert (=> b!760206 (and (bvsge (index!33334 lt!338573) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338573) (size!20565 lt!338482)))))

(declare-fun e!423761 () Bool)

(assert (=> b!760206 (= e!423761 (= (select (arr!20144 lt!338482) (index!33334 lt!338573)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760207 () Bool)

(declare-fun e!423759 () SeekEntryResult!7741)

(assert (=> b!760207 (= e!423759 (Intermediate!7741 true index!1321 x!1131))))

(declare-fun b!760208 () Bool)

(assert (=> b!760208 (and (bvsge (index!33334 lt!338573) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338573) (size!20565 lt!338482)))))

(declare-fun res!514422 () Bool)

(assert (=> b!760208 (= res!514422 (= (select (arr!20144 lt!338482) (index!33334 lt!338573)) lt!338483))))

(assert (=> b!760208 (=> res!514422 e!423761)))

(declare-fun e!423763 () Bool)

(assert (=> b!760208 (= e!423763 e!423761)))

(declare-fun b!760209 () Bool)

(declare-fun e!423760 () SeekEntryResult!7741)

(assert (=> b!760209 (= e!423759 e!423760)))

(declare-fun c!83277 () Bool)

(declare-fun lt!338572 () (_ BitVec 64))

(assert (=> b!760209 (= c!83277 (or (= lt!338572 lt!338483) (= (bvadd lt!338572 lt!338572) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760210 () Bool)

(assert (=> b!760210 (= e!423760 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!338483 lt!338482 mask!3328))))

(declare-fun b!760211 () Bool)

(declare-fun e!423762 () Bool)

(assert (=> b!760211 (= e!423762 e!423763)))

(declare-fun res!514420 () Bool)

(assert (=> b!760211 (= res!514420 (and ((_ is Intermediate!7741) lt!338573) (not (undefined!8553 lt!338573)) (bvslt (x!64231 lt!338573) #b01111111111111111111111111111110) (bvsge (x!64231 lt!338573) #b00000000000000000000000000000000) (bvsge (x!64231 lt!338573) x!1131)))))

(assert (=> b!760211 (=> (not res!514420) (not e!423763))))

(declare-fun b!760212 () Bool)

(assert (=> b!760212 (= e!423762 (bvsge (x!64231 lt!338573) #b01111111111111111111111111111110))))

(declare-fun d!100313 () Bool)

(assert (=> d!100313 e!423762))

(declare-fun c!83276 () Bool)

(assert (=> d!100313 (= c!83276 (and ((_ is Intermediate!7741) lt!338573) (undefined!8553 lt!338573)))))

(assert (=> d!100313 (= lt!338573 e!423759)))

(declare-fun c!83275 () Bool)

(assert (=> d!100313 (= c!83275 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100313 (= lt!338572 (select (arr!20144 lt!338482) index!1321))))

(assert (=> d!100313 (validMask!0 mask!3328)))

(assert (=> d!100313 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338483 lt!338482 mask!3328) lt!338573)))

(declare-fun b!760213 () Bool)

(assert (=> b!760213 (= e!423760 (Intermediate!7741 false index!1321 x!1131))))

(declare-fun b!760214 () Bool)

(assert (=> b!760214 (and (bvsge (index!33334 lt!338573) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338573) (size!20565 lt!338482)))))

(declare-fun res!514421 () Bool)

(assert (=> b!760214 (= res!514421 (= (select (arr!20144 lt!338482) (index!33334 lt!338573)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760214 (=> res!514421 e!423761)))

(assert (= (and d!100313 c!83275) b!760207))

(assert (= (and d!100313 (not c!83275)) b!760209))

(assert (= (and b!760209 c!83277) b!760213))

(assert (= (and b!760209 (not c!83277)) b!760210))

(assert (= (and d!100313 c!83276) b!760212))

(assert (= (and d!100313 (not c!83276)) b!760211))

(assert (= (and b!760211 res!514420) b!760208))

(assert (= (and b!760208 (not res!514422)) b!760214))

(assert (= (and b!760214 (not res!514421)) b!760206))

(declare-fun m!706841 () Bool)

(assert (=> b!760210 m!706841))

(assert (=> b!760210 m!706841))

(declare-fun m!706843 () Bool)

(assert (=> b!760210 m!706843))

(declare-fun m!706845 () Bool)

(assert (=> d!100313 m!706845))

(assert (=> d!100313 m!706679))

(declare-fun m!706847 () Bool)

(assert (=> b!760206 m!706847))

(assert (=> b!760214 m!706847))

(assert (=> b!760208 m!706847))

(assert (=> b!759990 d!100313))

(declare-fun b!760215 () Bool)

(declare-fun lt!338575 () SeekEntryResult!7741)

(assert (=> b!760215 (and (bvsge (index!33334 lt!338575) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338575) (size!20565 lt!338482)))))

(declare-fun e!423766 () Bool)

(assert (=> b!760215 (= e!423766 (= (select (arr!20144 lt!338482) (index!33334 lt!338575)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760216 () Bool)

(declare-fun e!423764 () SeekEntryResult!7741)

(assert (=> b!760216 (= e!423764 (Intermediate!7741 true (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760217 () Bool)

(assert (=> b!760217 (and (bvsge (index!33334 lt!338575) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338575) (size!20565 lt!338482)))))

(declare-fun res!514425 () Bool)

(assert (=> b!760217 (= res!514425 (= (select (arr!20144 lt!338482) (index!33334 lt!338575)) lt!338483))))

(assert (=> b!760217 (=> res!514425 e!423766)))

(declare-fun e!423768 () Bool)

(assert (=> b!760217 (= e!423768 e!423766)))

(declare-fun b!760218 () Bool)

(declare-fun e!423765 () SeekEntryResult!7741)

(assert (=> b!760218 (= e!423764 e!423765)))

(declare-fun c!83280 () Bool)

(declare-fun lt!338574 () (_ BitVec 64))

(assert (=> b!760218 (= c!83280 (or (= lt!338574 lt!338483) (= (bvadd lt!338574 lt!338574) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760219 () Bool)

(assert (=> b!760219 (= e!423765 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338483 lt!338482 mask!3328))))

(declare-fun b!760220 () Bool)

(declare-fun e!423767 () Bool)

(assert (=> b!760220 (= e!423767 e!423768)))

(declare-fun res!514423 () Bool)

(assert (=> b!760220 (= res!514423 (and ((_ is Intermediate!7741) lt!338575) (not (undefined!8553 lt!338575)) (bvslt (x!64231 lt!338575) #b01111111111111111111111111111110) (bvsge (x!64231 lt!338575) #b00000000000000000000000000000000) (bvsge (x!64231 lt!338575) #b00000000000000000000000000000000)))))

(assert (=> b!760220 (=> (not res!514423) (not e!423768))))

(declare-fun b!760221 () Bool)

(assert (=> b!760221 (= e!423767 (bvsge (x!64231 lt!338575) #b01111111111111111111111111111110))))

(declare-fun d!100323 () Bool)

(assert (=> d!100323 e!423767))

(declare-fun c!83279 () Bool)

(assert (=> d!100323 (= c!83279 (and ((_ is Intermediate!7741) lt!338575) (undefined!8553 lt!338575)))))

(assert (=> d!100323 (= lt!338575 e!423764)))

(declare-fun c!83278 () Bool)

(assert (=> d!100323 (= c!83278 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100323 (= lt!338574 (select (arr!20144 lt!338482) (toIndex!0 lt!338483 mask!3328)))))

(assert (=> d!100323 (validMask!0 mask!3328)))

(assert (=> d!100323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338483 mask!3328) lt!338483 lt!338482 mask!3328) lt!338575)))

(declare-fun b!760222 () Bool)

(assert (=> b!760222 (= e!423765 (Intermediate!7741 false (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760223 () Bool)

(assert (=> b!760223 (and (bvsge (index!33334 lt!338575) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338575) (size!20565 lt!338482)))))

(declare-fun res!514424 () Bool)

(assert (=> b!760223 (= res!514424 (= (select (arr!20144 lt!338482) (index!33334 lt!338575)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760223 (=> res!514424 e!423766)))

(assert (= (and d!100323 c!83278) b!760216))

(assert (= (and d!100323 (not c!83278)) b!760218))

(assert (= (and b!760218 c!83280) b!760222))

(assert (= (and b!760218 (not c!83280)) b!760219))

(assert (= (and d!100323 c!83279) b!760221))

(assert (= (and d!100323 (not c!83279)) b!760220))

(assert (= (and b!760220 res!514423) b!760217))

(assert (= (and b!760217 (not res!514425)) b!760223))

(assert (= (and b!760223 (not res!514424)) b!760215))

(assert (=> b!760219 m!706661))

(declare-fun m!706849 () Bool)

(assert (=> b!760219 m!706849))

(assert (=> b!760219 m!706849))

(declare-fun m!706851 () Bool)

(assert (=> b!760219 m!706851))

(assert (=> d!100323 m!706661))

(declare-fun m!706853 () Bool)

(assert (=> d!100323 m!706853))

(assert (=> d!100323 m!706679))

(declare-fun m!706855 () Bool)

(assert (=> b!760215 m!706855))

(assert (=> b!760223 m!706855))

(assert (=> b!760217 m!706855))

(assert (=> b!759990 d!100323))

(declare-fun d!100325 () Bool)

(declare-fun lt!338581 () (_ BitVec 32))

(declare-fun lt!338580 () (_ BitVec 32))

(assert (=> d!100325 (= lt!338581 (bvmul (bvxor lt!338580 (bvlshr lt!338580 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100325 (= lt!338580 ((_ extract 31 0) (bvand (bvxor lt!338483 (bvlshr lt!338483 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100325 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514426 (let ((h!15259 ((_ extract 31 0) (bvand (bvxor lt!338483 (bvlshr lt!338483 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64237 (bvmul (bvxor h!15259 (bvlshr h!15259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64237 (bvlshr x!64237 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514426 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514426 #b00000000000000000000000000000000))))))

(assert (=> d!100325 (= (toIndex!0 lt!338483 mask!3328) (bvand (bvxor lt!338581 (bvlshr lt!338581 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!759990 d!100325))

(declare-fun b!760244 () Bool)

(declare-fun e!423788 () Bool)

(declare-fun e!423786 () Bool)

(assert (=> b!760244 (= e!423788 e!423786)))

(declare-fun res!514439 () Bool)

(assert (=> b!760244 (=> (not res!514439) (not e!423786))))

(declare-fun e!423787 () Bool)

(assert (=> b!760244 (= res!514439 (not e!423787))))

(declare-fun res!514441 () Bool)

(assert (=> b!760244 (=> (not res!514441) (not e!423787))))

(assert (=> b!760244 (= res!514441 (validKeyInArray!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760245 () Bool)

(declare-fun e!423785 () Bool)

(assert (=> b!760245 (= e!423786 e!423785)))

(declare-fun c!83285 () Bool)

(assert (=> b!760245 (= c!83285 (validKeyInArray!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34914 () Bool)

(declare-fun call!34917 () Bool)

(assert (=> bm!34914 (= call!34917 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83285 (Cons!14181 (select (arr!20144 a!3186) #b00000000000000000000000000000000) Nil!14182) Nil!14182)))))

(declare-fun d!100327 () Bool)

(declare-fun res!514440 () Bool)

(assert (=> d!100327 (=> res!514440 e!423788)))

(assert (=> d!100327 (= res!514440 (bvsge #b00000000000000000000000000000000 (size!20565 a!3186)))))

(assert (=> d!100327 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14182) e!423788)))

(declare-fun b!760246 () Bool)

(assert (=> b!760246 (= e!423785 call!34917)))

(declare-fun b!760247 () Bool)

(declare-fun contains!4049 (List!14185 (_ BitVec 64)) Bool)

(assert (=> b!760247 (= e!423787 (contains!4049 Nil!14182 (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760248 () Bool)

(assert (=> b!760248 (= e!423785 call!34917)))

(assert (= (and d!100327 (not res!514440)) b!760244))

(assert (= (and b!760244 res!514441) b!760247))

(assert (= (and b!760244 res!514439) b!760245))

(assert (= (and b!760245 c!83285) b!760246))

(assert (= (and b!760245 (not c!83285)) b!760248))

(assert (= (or b!760246 b!760248) bm!34914))

(declare-fun m!706857 () Bool)

(assert (=> b!760244 m!706857))

(assert (=> b!760244 m!706857))

(declare-fun m!706859 () Bool)

(assert (=> b!760244 m!706859))

(assert (=> b!760245 m!706857))

(assert (=> b!760245 m!706857))

(assert (=> b!760245 m!706859))

(assert (=> bm!34914 m!706857))

(declare-fun m!706861 () Bool)

(assert (=> bm!34914 m!706861))

(assert (=> b!760247 m!706857))

(assert (=> b!760247 m!706857))

(declare-fun m!706863 () Bool)

(assert (=> b!760247 m!706863))

(assert (=> b!759991 d!100327))

(declare-fun d!100333 () Bool)

(declare-fun res!514449 () Bool)

(declare-fun e!423801 () Bool)

(assert (=> d!100333 (=> res!514449 e!423801)))

(assert (=> d!100333 (= res!514449 (= (select (arr!20144 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100333 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!423801)))

(declare-fun b!760266 () Bool)

(declare-fun e!423802 () Bool)

(assert (=> b!760266 (= e!423801 e!423802)))

(declare-fun res!514450 () Bool)

(assert (=> b!760266 (=> (not res!514450) (not e!423802))))

(assert (=> b!760266 (= res!514450 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20565 a!3186)))))

(declare-fun b!760267 () Bool)

(assert (=> b!760267 (= e!423802 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100333 (not res!514449)) b!760266))

(assert (= (and b!760266 res!514450) b!760267))

(assert (=> d!100333 m!706857))

(declare-fun m!706871 () Bool)

(assert (=> b!760267 m!706871))

(assert (=> b!759981 d!100333))

(declare-fun d!100337 () Bool)

(assert (=> d!100337 (= (validKeyInArray!0 (select (arr!20144 a!3186) j!159)) (and (not (= (select (arr!20144 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20144 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!759976 d!100337))

(declare-fun b!760317 () Bool)

(declare-fun c!83310 () Bool)

(declare-fun lt!338616 () (_ BitVec 64))

(assert (=> b!760317 (= c!83310 (= lt!338616 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423833 () SeekEntryResult!7741)

(declare-fun e!423834 () SeekEntryResult!7741)

(assert (=> b!760317 (= e!423833 e!423834)))

(declare-fun b!760318 () Bool)

(declare-fun e!423832 () SeekEntryResult!7741)

(assert (=> b!760318 (= e!423832 e!423833)))

(declare-fun lt!338615 () SeekEntryResult!7741)

(assert (=> b!760318 (= lt!338616 (select (arr!20144 a!3186) (index!33334 lt!338615)))))

(declare-fun c!83308 () Bool)

(assert (=> b!760318 (= c!83308 (= lt!338616 (select (arr!20144 a!3186) j!159)))))

(declare-fun b!760319 () Bool)

(assert (=> b!760319 (= e!423834 (seekKeyOrZeroReturnVacant!0 (x!64231 lt!338615) (index!33334 lt!338615) (index!33334 lt!338615) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760320 () Bool)

(assert (=> b!760320 (= e!423833 (Found!7741 (index!33334 lt!338615)))))

(declare-fun d!100339 () Bool)

(declare-fun lt!338617 () SeekEntryResult!7741)

(assert (=> d!100339 (and (or ((_ is Undefined!7741) lt!338617) (not ((_ is Found!7741) lt!338617)) (and (bvsge (index!33333 lt!338617) #b00000000000000000000000000000000) (bvslt (index!33333 lt!338617) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338617) ((_ is Found!7741) lt!338617) (not ((_ is MissingZero!7741) lt!338617)) (and (bvsge (index!33332 lt!338617) #b00000000000000000000000000000000) (bvslt (index!33332 lt!338617) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338617) ((_ is Found!7741) lt!338617) ((_ is MissingZero!7741) lt!338617) (not ((_ is MissingVacant!7741) lt!338617)) (and (bvsge (index!33335 lt!338617) #b00000000000000000000000000000000) (bvslt (index!33335 lt!338617) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338617) (ite ((_ is Found!7741) lt!338617) (= (select (arr!20144 a!3186) (index!33333 lt!338617)) (select (arr!20144 a!3186) j!159)) (ite ((_ is MissingZero!7741) lt!338617) (= (select (arr!20144 a!3186) (index!33332 lt!338617)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7741) lt!338617) (= (select (arr!20144 a!3186) (index!33335 lt!338617)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100339 (= lt!338617 e!423832)))

(declare-fun c!83309 () Bool)

(assert (=> d!100339 (= c!83309 (and ((_ is Intermediate!7741) lt!338615) (undefined!8553 lt!338615)))))

(assert (=> d!100339 (= lt!338615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100339 (validMask!0 mask!3328)))

(assert (=> d!100339 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338617)))

(declare-fun b!760321 () Bool)

(assert (=> b!760321 (= e!423834 (MissingZero!7741 (index!33334 lt!338615)))))

(declare-fun b!760322 () Bool)

(assert (=> b!760322 (= e!423832 Undefined!7741)))

(assert (= (and d!100339 c!83309) b!760322))

(assert (= (and d!100339 (not c!83309)) b!760318))

(assert (= (and b!760318 c!83308) b!760320))

(assert (= (and b!760318 (not c!83308)) b!760317))

(assert (= (and b!760317 c!83310) b!760321))

(assert (= (and b!760317 (not c!83310)) b!760319))

(declare-fun m!706903 () Bool)

(assert (=> b!760318 m!706903))

(assert (=> b!760319 m!706671))

(declare-fun m!706905 () Bool)

(assert (=> b!760319 m!706905))

(declare-fun m!706907 () Bool)

(assert (=> d!100339 m!706907))

(declare-fun m!706909 () Bool)

(assert (=> d!100339 m!706909))

(assert (=> d!100339 m!706679))

(assert (=> d!100339 m!706671))

(assert (=> d!100339 m!706697))

(assert (=> d!100339 m!706697))

(assert (=> d!100339 m!706671))

(assert (=> d!100339 m!706699))

(declare-fun m!706911 () Bool)

(assert (=> d!100339 m!706911))

(assert (=> b!759987 d!100339))

(declare-fun b!760323 () Bool)

(declare-fun lt!338619 () SeekEntryResult!7741)

(assert (=> b!760323 (and (bvsge (index!33334 lt!338619) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338619) (size!20565 a!3186)))))

(declare-fun e!423837 () Bool)

(assert (=> b!760323 (= e!423837 (= (select (arr!20144 a!3186) (index!33334 lt!338619)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423835 () SeekEntryResult!7741)

(declare-fun b!760324 () Bool)

(assert (=> b!760324 (= e!423835 (Intermediate!7741 true (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760325 () Bool)

(assert (=> b!760325 (and (bvsge (index!33334 lt!338619) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338619) (size!20565 a!3186)))))

(declare-fun res!514469 () Bool)

(assert (=> b!760325 (= res!514469 (= (select (arr!20144 a!3186) (index!33334 lt!338619)) (select (arr!20144 a!3186) j!159)))))

(assert (=> b!760325 (=> res!514469 e!423837)))

(declare-fun e!423839 () Bool)

(assert (=> b!760325 (= e!423839 e!423837)))

(declare-fun b!760326 () Bool)

(declare-fun e!423836 () SeekEntryResult!7741)

(assert (=> b!760326 (= e!423835 e!423836)))

(declare-fun lt!338618 () (_ BitVec 64))

(declare-fun c!83313 () Bool)

(assert (=> b!760326 (= c!83313 (or (= lt!338618 (select (arr!20144 a!3186) j!159)) (= (bvadd lt!338618 lt!338618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760327 () Bool)

(assert (=> b!760327 (= e!423836 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760328 () Bool)

(declare-fun e!423838 () Bool)

(assert (=> b!760328 (= e!423838 e!423839)))

(declare-fun res!514467 () Bool)

(assert (=> b!760328 (= res!514467 (and ((_ is Intermediate!7741) lt!338619) (not (undefined!8553 lt!338619)) (bvslt (x!64231 lt!338619) #b01111111111111111111111111111110) (bvsge (x!64231 lt!338619) #b00000000000000000000000000000000) (bvsge (x!64231 lt!338619) #b00000000000000000000000000000000)))))

(assert (=> b!760328 (=> (not res!514467) (not e!423839))))

(declare-fun b!760329 () Bool)

(assert (=> b!760329 (= e!423838 (bvsge (x!64231 lt!338619) #b01111111111111111111111111111110))))

(declare-fun d!100351 () Bool)

(assert (=> d!100351 e!423838))

(declare-fun c!83312 () Bool)

(assert (=> d!100351 (= c!83312 (and ((_ is Intermediate!7741) lt!338619) (undefined!8553 lt!338619)))))

(assert (=> d!100351 (= lt!338619 e!423835)))

(declare-fun c!83311 () Bool)

(assert (=> d!100351 (= c!83311 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100351 (= lt!338618 (select (arr!20144 a!3186) (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328)))))

(assert (=> d!100351 (validMask!0 mask!3328)))

(assert (=> d!100351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338619)))

(declare-fun b!760330 () Bool)

(assert (=> b!760330 (= e!423836 (Intermediate!7741 false (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760331 () Bool)

(assert (=> b!760331 (and (bvsge (index!33334 lt!338619) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338619) (size!20565 a!3186)))))

(declare-fun res!514468 () Bool)

(assert (=> b!760331 (= res!514468 (= (select (arr!20144 a!3186) (index!33334 lt!338619)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760331 (=> res!514468 e!423837)))

(assert (= (and d!100351 c!83311) b!760324))

(assert (= (and d!100351 (not c!83311)) b!760326))

(assert (= (and b!760326 c!83313) b!760330))

(assert (= (and b!760326 (not c!83313)) b!760327))

(assert (= (and d!100351 c!83312) b!760329))

(assert (= (and d!100351 (not c!83312)) b!760328))

(assert (= (and b!760328 res!514467) b!760325))

(assert (= (and b!760325 (not res!514469)) b!760331))

(assert (= (and b!760331 (not res!514468)) b!760323))

(assert (=> b!760327 m!706697))

(declare-fun m!706913 () Bool)

(assert (=> b!760327 m!706913))

(assert (=> b!760327 m!706913))

(assert (=> b!760327 m!706671))

(declare-fun m!706915 () Bool)

(assert (=> b!760327 m!706915))

(assert (=> d!100351 m!706697))

(declare-fun m!706917 () Bool)

(assert (=> d!100351 m!706917))

(assert (=> d!100351 m!706679))

(declare-fun m!706919 () Bool)

(assert (=> b!760323 m!706919))

(assert (=> b!760331 m!706919))

(assert (=> b!760325 m!706919))

(assert (=> b!759988 d!100351))

(declare-fun d!100353 () Bool)

(declare-fun lt!338621 () (_ BitVec 32))

(declare-fun lt!338620 () (_ BitVec 32))

(assert (=> d!100353 (= lt!338621 (bvmul (bvxor lt!338620 (bvlshr lt!338620 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100353 (= lt!338620 ((_ extract 31 0) (bvand (bvxor (select (arr!20144 a!3186) j!159) (bvlshr (select (arr!20144 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100353 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514426 (let ((h!15259 ((_ extract 31 0) (bvand (bvxor (select (arr!20144 a!3186) j!159) (bvlshr (select (arr!20144 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64237 (bvmul (bvxor h!15259 (bvlshr h!15259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64237 (bvlshr x!64237 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514426 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514426 #b00000000000000000000000000000000))))))

(assert (=> d!100353 (= (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) (bvand (bvxor lt!338621 (bvlshr lt!338621 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!759988 d!100353))

(declare-fun b!760332 () Bool)

(declare-fun lt!338623 () SeekEntryResult!7741)

(assert (=> b!760332 (and (bvsge (index!33334 lt!338623) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338623) (size!20565 a!3186)))))

(declare-fun e!423842 () Bool)

(assert (=> b!760332 (= e!423842 (= (select (arr!20144 a!3186) (index!33334 lt!338623)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760333 () Bool)

(declare-fun e!423840 () SeekEntryResult!7741)

(assert (=> b!760333 (= e!423840 (Intermediate!7741 true index!1321 x!1131))))

(declare-fun b!760334 () Bool)

(assert (=> b!760334 (and (bvsge (index!33334 lt!338623) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338623) (size!20565 a!3186)))))

(declare-fun res!514472 () Bool)

(assert (=> b!760334 (= res!514472 (= (select (arr!20144 a!3186) (index!33334 lt!338623)) (select (arr!20144 a!3186) j!159)))))

(assert (=> b!760334 (=> res!514472 e!423842)))

(declare-fun e!423844 () Bool)

(assert (=> b!760334 (= e!423844 e!423842)))

(declare-fun b!760335 () Bool)

(declare-fun e!423841 () SeekEntryResult!7741)

(assert (=> b!760335 (= e!423840 e!423841)))

(declare-fun lt!338622 () (_ BitVec 64))

(declare-fun c!83316 () Bool)

(assert (=> b!760335 (= c!83316 (or (= lt!338622 (select (arr!20144 a!3186) j!159)) (= (bvadd lt!338622 lt!338622) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760336 () Bool)

(assert (=> b!760336 (= e!423841 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760337 () Bool)

(declare-fun e!423843 () Bool)

(assert (=> b!760337 (= e!423843 e!423844)))

(declare-fun res!514470 () Bool)

(assert (=> b!760337 (= res!514470 (and ((_ is Intermediate!7741) lt!338623) (not (undefined!8553 lt!338623)) (bvslt (x!64231 lt!338623) #b01111111111111111111111111111110) (bvsge (x!64231 lt!338623) #b00000000000000000000000000000000) (bvsge (x!64231 lt!338623) x!1131)))))

(assert (=> b!760337 (=> (not res!514470) (not e!423844))))

(declare-fun b!760338 () Bool)

(assert (=> b!760338 (= e!423843 (bvsge (x!64231 lt!338623) #b01111111111111111111111111111110))))

(declare-fun d!100355 () Bool)

(assert (=> d!100355 e!423843))

(declare-fun c!83315 () Bool)

(assert (=> d!100355 (= c!83315 (and ((_ is Intermediate!7741) lt!338623) (undefined!8553 lt!338623)))))

(assert (=> d!100355 (= lt!338623 e!423840)))

(declare-fun c!83314 () Bool)

(assert (=> d!100355 (= c!83314 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100355 (= lt!338622 (select (arr!20144 a!3186) index!1321))))

(assert (=> d!100355 (validMask!0 mask!3328)))

(assert (=> d!100355 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338623)))

(declare-fun b!760339 () Bool)

(assert (=> b!760339 (= e!423841 (Intermediate!7741 false index!1321 x!1131))))

(declare-fun b!760340 () Bool)

(assert (=> b!760340 (and (bvsge (index!33334 lt!338623) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338623) (size!20565 a!3186)))))

(declare-fun res!514471 () Bool)

(assert (=> b!760340 (= res!514471 (= (select (arr!20144 a!3186) (index!33334 lt!338623)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760340 (=> res!514471 e!423842)))

(assert (= (and d!100355 c!83314) b!760333))

(assert (= (and d!100355 (not c!83314)) b!760335))

(assert (= (and b!760335 c!83316) b!760339))

(assert (= (and b!760335 (not c!83316)) b!760336))

(assert (= (and d!100355 c!83315) b!760338))

(assert (= (and d!100355 (not c!83315)) b!760337))

(assert (= (and b!760337 res!514470) b!760334))

(assert (= (and b!760334 (not res!514472)) b!760340))

(assert (= (and b!760340 (not res!514471)) b!760332))

(assert (=> b!760336 m!706841))

(assert (=> b!760336 m!706841))

(assert (=> b!760336 m!706671))

(declare-fun m!706921 () Bool)

(assert (=> b!760336 m!706921))

(declare-fun m!706923 () Bool)

(assert (=> d!100355 m!706923))

(assert (=> d!100355 m!706679))

(declare-fun m!706925 () Bool)

(assert (=> b!760332 m!706925))

(assert (=> b!760340 m!706925))

(assert (=> b!760334 m!706925))

(assert (=> b!759978 d!100355))

(declare-fun b!760353 () Bool)

(declare-fun c!83325 () Bool)

(declare-fun lt!338629 () (_ BitVec 64))

(assert (=> b!760353 (= c!83325 (= lt!338629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423852 () SeekEntryResult!7741)

(declare-fun e!423853 () SeekEntryResult!7741)

(assert (=> b!760353 (= e!423852 e!423853)))

(declare-fun b!760354 () Bool)

(declare-fun e!423851 () SeekEntryResult!7741)

(assert (=> b!760354 (= e!423851 e!423852)))

(declare-fun lt!338628 () SeekEntryResult!7741)

(assert (=> b!760354 (= lt!338629 (select (arr!20144 a!3186) (index!33334 lt!338628)))))

(declare-fun c!83323 () Bool)

(assert (=> b!760354 (= c!83323 (= lt!338629 k0!2102))))

(declare-fun b!760355 () Bool)

(assert (=> b!760355 (= e!423853 (seekKeyOrZeroReturnVacant!0 (x!64231 lt!338628) (index!33334 lt!338628) (index!33334 lt!338628) k0!2102 a!3186 mask!3328))))

(declare-fun b!760356 () Bool)

(assert (=> b!760356 (= e!423852 (Found!7741 (index!33334 lt!338628)))))

(declare-fun d!100357 () Bool)

(declare-fun lt!338630 () SeekEntryResult!7741)

(assert (=> d!100357 (and (or ((_ is Undefined!7741) lt!338630) (not ((_ is Found!7741) lt!338630)) (and (bvsge (index!33333 lt!338630) #b00000000000000000000000000000000) (bvslt (index!33333 lt!338630) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338630) ((_ is Found!7741) lt!338630) (not ((_ is MissingZero!7741) lt!338630)) (and (bvsge (index!33332 lt!338630) #b00000000000000000000000000000000) (bvslt (index!33332 lt!338630) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338630) ((_ is Found!7741) lt!338630) ((_ is MissingZero!7741) lt!338630) (not ((_ is MissingVacant!7741) lt!338630)) (and (bvsge (index!33335 lt!338630) #b00000000000000000000000000000000) (bvslt (index!33335 lt!338630) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338630) (ite ((_ is Found!7741) lt!338630) (= (select (arr!20144 a!3186) (index!33333 lt!338630)) k0!2102) (ite ((_ is MissingZero!7741) lt!338630) (= (select (arr!20144 a!3186) (index!33332 lt!338630)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7741) lt!338630) (= (select (arr!20144 a!3186) (index!33335 lt!338630)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100357 (= lt!338630 e!423851)))

(declare-fun c!83324 () Bool)

(assert (=> d!100357 (= c!83324 (and ((_ is Intermediate!7741) lt!338628) (undefined!8553 lt!338628)))))

(assert (=> d!100357 (= lt!338628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100357 (validMask!0 mask!3328)))

(assert (=> d!100357 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!338630)))

(declare-fun b!760357 () Bool)

(assert (=> b!760357 (= e!423853 (MissingZero!7741 (index!33334 lt!338628)))))

(declare-fun b!760358 () Bool)

(assert (=> b!760358 (= e!423851 Undefined!7741)))

(assert (= (and d!100357 c!83324) b!760358))

(assert (= (and d!100357 (not c!83324)) b!760354))

(assert (= (and b!760354 c!83323) b!760356))

(assert (= (and b!760354 (not c!83323)) b!760353))

(assert (= (and b!760353 c!83325) b!760357))

(assert (= (and b!760353 (not c!83325)) b!760355))

(declare-fun m!706927 () Bool)

(assert (=> b!760354 m!706927))

(declare-fun m!706929 () Bool)

(assert (=> b!760355 m!706929))

(declare-fun m!706931 () Bool)

(assert (=> d!100357 m!706931))

(declare-fun m!706933 () Bool)

(assert (=> d!100357 m!706933))

(assert (=> d!100357 m!706679))

(declare-fun m!706935 () Bool)

(assert (=> d!100357 m!706935))

(assert (=> d!100357 m!706935))

(declare-fun m!706937 () Bool)

(assert (=> d!100357 m!706937))

(declare-fun m!706939 () Bool)

(assert (=> d!100357 m!706939))

(assert (=> b!759989 d!100357))

(declare-fun b!760360 () Bool)

(declare-fun e!423854 () SeekEntryResult!7741)

(assert (=> b!760360 (= e!423854 (MissingVacant!7741 resIntermediateIndex!5))))

(declare-fun b!760361 () Bool)

(declare-fun c!83326 () Bool)

(declare-fun lt!338632 () (_ BitVec 64))

(assert (=> b!760361 (= c!83326 (= lt!338632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423855 () SeekEntryResult!7741)

(assert (=> b!760361 (= e!423855 e!423854)))

(declare-fun b!760362 () Bool)

(declare-fun e!423856 () SeekEntryResult!7741)

(assert (=> b!760362 (= e!423856 Undefined!7741)))

(declare-fun b!760363 () Bool)

(assert (=> b!760363 (= e!423856 e!423855)))

(declare-fun c!83327 () Bool)

(assert (=> b!760363 (= c!83327 (= lt!338632 (select (arr!20144 a!3186) j!159)))))

(declare-fun b!760364 () Bool)

(assert (=> b!760364 (= e!423855 (Found!7741 index!1321))))

(declare-fun b!760359 () Bool)

(assert (=> b!760359 (= e!423854 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!338631 () SeekEntryResult!7741)

(declare-fun d!100359 () Bool)

(assert (=> d!100359 (and (or ((_ is Undefined!7741) lt!338631) (not ((_ is Found!7741) lt!338631)) (and (bvsge (index!33333 lt!338631) #b00000000000000000000000000000000) (bvslt (index!33333 lt!338631) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338631) ((_ is Found!7741) lt!338631) (not ((_ is MissingVacant!7741) lt!338631)) (not (= (index!33335 lt!338631) resIntermediateIndex!5)) (and (bvsge (index!33335 lt!338631) #b00000000000000000000000000000000) (bvslt (index!33335 lt!338631) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338631) (ite ((_ is Found!7741) lt!338631) (= (select (arr!20144 a!3186) (index!33333 lt!338631)) (select (arr!20144 a!3186) j!159)) (and ((_ is MissingVacant!7741) lt!338631) (= (index!33335 lt!338631) resIntermediateIndex!5) (= (select (arr!20144 a!3186) (index!33335 lt!338631)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100359 (= lt!338631 e!423856)))

(declare-fun c!83328 () Bool)

(assert (=> d!100359 (= c!83328 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100359 (= lt!338632 (select (arr!20144 a!3186) index!1321))))

(assert (=> d!100359 (validMask!0 mask!3328)))

(assert (=> d!100359 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338631)))

(assert (= (and d!100359 c!83328) b!760362))

(assert (= (and d!100359 (not c!83328)) b!760363))

(assert (= (and b!760363 c!83327) b!760364))

(assert (= (and b!760363 (not c!83327)) b!760361))

(assert (= (and b!760361 c!83326) b!760360))

(assert (= (and b!760361 (not c!83326)) b!760359))

(assert (=> b!760359 m!706841))

(assert (=> b!760359 m!706841))

(assert (=> b!760359 m!706671))

(declare-fun m!706941 () Bool)

(assert (=> b!760359 m!706941))

(declare-fun m!706943 () Bool)

(assert (=> d!100359 m!706943))

(declare-fun m!706945 () Bool)

(assert (=> d!100359 m!706945))

(assert (=> d!100359 m!706923))

(assert (=> d!100359 m!706679))

(assert (=> b!759985 d!100359))

(declare-fun b!760365 () Bool)

(declare-fun e!423858 () Bool)

(declare-fun e!423859 () Bool)

(assert (=> b!760365 (= e!423858 e!423859)))

(declare-fun c!83329 () Bool)

(assert (=> b!760365 (= c!83329 (validKeyInArray!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100361 () Bool)

(declare-fun res!514473 () Bool)

(assert (=> d!100361 (=> res!514473 e!423858)))

(assert (=> d!100361 (= res!514473 (bvsge #b00000000000000000000000000000000 (size!20565 a!3186)))))

(assert (=> d!100361 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!423858)))

(declare-fun b!760366 () Bool)

(declare-fun e!423857 () Bool)

(assert (=> b!760366 (= e!423859 e!423857)))

(declare-fun lt!338633 () (_ BitVec 64))

(assert (=> b!760366 (= lt!338633 (select (arr!20144 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!338635 () Unit!26294)

(assert (=> b!760366 (= lt!338635 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338633 #b00000000000000000000000000000000))))

(assert (=> b!760366 (arrayContainsKey!0 a!3186 lt!338633 #b00000000000000000000000000000000)))

(declare-fun lt!338634 () Unit!26294)

(assert (=> b!760366 (= lt!338634 lt!338635)))

(declare-fun res!514474 () Bool)

(assert (=> b!760366 (= res!514474 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7741 #b00000000000000000000000000000000)))))

(assert (=> b!760366 (=> (not res!514474) (not e!423857))))

(declare-fun b!760367 () Bool)

(declare-fun call!34922 () Bool)

(assert (=> b!760367 (= e!423859 call!34922)))

(declare-fun bm!34919 () Bool)

(assert (=> bm!34919 (= call!34922 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760368 () Bool)

(assert (=> b!760368 (= e!423857 call!34922)))

(assert (= (and d!100361 (not res!514473)) b!760365))

(assert (= (and b!760365 c!83329) b!760366))

(assert (= (and b!760365 (not c!83329)) b!760367))

(assert (= (and b!760366 res!514474) b!760368))

(assert (= (or b!760368 b!760367) bm!34919))

(assert (=> b!760365 m!706857))

(assert (=> b!760365 m!706857))

(assert (=> b!760365 m!706859))

(assert (=> b!760366 m!706857))

(declare-fun m!706947 () Bool)

(assert (=> b!760366 m!706947))

(declare-fun m!706949 () Bool)

(assert (=> b!760366 m!706949))

(assert (=> b!760366 m!706857))

(declare-fun m!706951 () Bool)

(assert (=> b!760366 m!706951))

(declare-fun m!706953 () Bool)

(assert (=> bm!34919 m!706953))

(assert (=> b!759986 d!100361))

(check-sat (not b!760107) (not b!760359) (not b!760132) (not d!100293) (not b!760131) (not d!100303) (not bm!34919) (not d!100359) (not d!100357) (not b!760355) (not b!760267) (not d!100355) (not b!760366) (not d!100351) (not d!100323) (not b!760336) (not b!760219) (not b!760210) (not b!760327) (not b!760244) (not b!760245) (not d!100339) (not bm!34914) (not bm!34908) (not b!760247) (not b!760365) (not d!100313) (not b!760319))
(check-sat)
(get-model)

(declare-fun b!760513 () Bool)

(declare-fun e!423941 () SeekEntryResult!7741)

(assert (=> b!760513 (= e!423941 (MissingVacant!7741 resIntermediateIndex!5))))

(declare-fun b!760514 () Bool)

(declare-fun c!83383 () Bool)

(declare-fun lt!338701 () (_ BitVec 64))

(assert (=> b!760514 (= c!83383 (= lt!338701 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423942 () SeekEntryResult!7741)

(assert (=> b!760514 (= e!423942 e!423941)))

(declare-fun b!760515 () Bool)

(declare-fun e!423943 () SeekEntryResult!7741)

(assert (=> b!760515 (= e!423943 Undefined!7741)))

(declare-fun b!760516 () Bool)

(assert (=> b!760516 (= e!423943 e!423942)))

(declare-fun c!83384 () Bool)

(assert (=> b!760516 (= c!83384 (= lt!338701 (select (arr!20144 a!3186) j!159)))))

(declare-fun b!760517 () Bool)

(assert (=> b!760517 (= e!423942 (Found!7741 (nextIndex!0 index!1321 x!1131 mask!3328)))))

(declare-fun b!760512 () Bool)

(assert (=> b!760512 (= e!423941 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100407 () Bool)

(declare-fun lt!338700 () SeekEntryResult!7741)

(assert (=> d!100407 (and (or ((_ is Undefined!7741) lt!338700) (not ((_ is Found!7741) lt!338700)) (and (bvsge (index!33333 lt!338700) #b00000000000000000000000000000000) (bvslt (index!33333 lt!338700) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338700) ((_ is Found!7741) lt!338700) (not ((_ is MissingVacant!7741) lt!338700)) (not (= (index!33335 lt!338700) resIntermediateIndex!5)) (and (bvsge (index!33335 lt!338700) #b00000000000000000000000000000000) (bvslt (index!33335 lt!338700) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338700) (ite ((_ is Found!7741) lt!338700) (= (select (arr!20144 a!3186) (index!33333 lt!338700)) (select (arr!20144 a!3186) j!159)) (and ((_ is MissingVacant!7741) lt!338700) (= (index!33335 lt!338700) resIntermediateIndex!5) (= (select (arr!20144 a!3186) (index!33335 lt!338700)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100407 (= lt!338700 e!423943)))

(declare-fun c!83385 () Bool)

(assert (=> d!100407 (= c!83385 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100407 (= lt!338701 (select (arr!20144 a!3186) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!100407 (validMask!0 mask!3328)))

(assert (=> d!100407 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338700)))

(assert (= (and d!100407 c!83385) b!760515))

(assert (= (and d!100407 (not c!83385)) b!760516))

(assert (= (and b!760516 c!83384) b!760517))

(assert (= (and b!760516 (not c!83384)) b!760514))

(assert (= (and b!760514 c!83383) b!760513))

(assert (= (and b!760514 (not c!83383)) b!760512))

(assert (=> b!760512 m!706841))

(declare-fun m!707075 () Bool)

(assert (=> b!760512 m!707075))

(assert (=> b!760512 m!707075))

(assert (=> b!760512 m!706671))

(declare-fun m!707077 () Bool)

(assert (=> b!760512 m!707077))

(declare-fun m!707079 () Bool)

(assert (=> d!100407 m!707079))

(declare-fun m!707081 () Bool)

(assert (=> d!100407 m!707081))

(assert (=> d!100407 m!706841))

(declare-fun m!707083 () Bool)

(assert (=> d!100407 m!707083))

(assert (=> d!100407 m!706679))

(assert (=> b!760359 d!100407))

(declare-fun d!100409 () Bool)

(declare-fun lt!338704 () (_ BitVec 32))

(assert (=> d!100409 (and (bvsge lt!338704 #b00000000000000000000000000000000) (bvslt lt!338704 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!100409 (= lt!338704 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!100409 (validMask!0 mask!3328)))

(assert (=> d!100409 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!338704)))

(declare-fun bs!21357 () Bool)

(assert (= bs!21357 d!100409))

(declare-fun m!707085 () Bool)

(assert (=> bs!21357 m!707085))

(assert (=> bs!21357 m!706679))

(assert (=> b!760359 d!100409))

(declare-fun b!760518 () Bool)

(declare-fun lt!338706 () SeekEntryResult!7741)

(assert (=> b!760518 (and (bvsge (index!33334 lt!338706) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338706) (size!20565 lt!338482)))))

(declare-fun e!423946 () Bool)

(assert (=> b!760518 (= e!423946 (= (select (arr!20144 lt!338482) (index!33334 lt!338706)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760519 () Bool)

(declare-fun e!423944 () SeekEntryResult!7741)

(assert (=> b!760519 (= e!423944 (Intermediate!7741 true (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!760520 () Bool)

(assert (=> b!760520 (and (bvsge (index!33334 lt!338706) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338706) (size!20565 lt!338482)))))

(declare-fun res!514515 () Bool)

(assert (=> b!760520 (= res!514515 (= (select (arr!20144 lt!338482) (index!33334 lt!338706)) lt!338483))))

(assert (=> b!760520 (=> res!514515 e!423946)))

(declare-fun e!423948 () Bool)

(assert (=> b!760520 (= e!423948 e!423946)))

(declare-fun b!760521 () Bool)

(declare-fun e!423945 () SeekEntryResult!7741)

(assert (=> b!760521 (= e!423944 e!423945)))

(declare-fun c!83388 () Bool)

(declare-fun lt!338705 () (_ BitVec 64))

(assert (=> b!760521 (= c!83388 (or (= lt!338705 lt!338483) (= (bvadd lt!338705 lt!338705) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760522 () Bool)

(assert (=> b!760522 (= e!423945 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!338483 lt!338482 mask!3328))))

(declare-fun b!760523 () Bool)

(declare-fun e!423947 () Bool)

(assert (=> b!760523 (= e!423947 e!423948)))

(declare-fun res!514513 () Bool)

(assert (=> b!760523 (= res!514513 (and ((_ is Intermediate!7741) lt!338706) (not (undefined!8553 lt!338706)) (bvslt (x!64231 lt!338706) #b01111111111111111111111111111110) (bvsge (x!64231 lt!338706) #b00000000000000000000000000000000) (bvsge (x!64231 lt!338706) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!760523 (=> (not res!514513) (not e!423948))))

(declare-fun b!760524 () Bool)

(assert (=> b!760524 (= e!423947 (bvsge (x!64231 lt!338706) #b01111111111111111111111111111110))))

(declare-fun d!100411 () Bool)

(assert (=> d!100411 e!423947))

(declare-fun c!83387 () Bool)

(assert (=> d!100411 (= c!83387 (and ((_ is Intermediate!7741) lt!338706) (undefined!8553 lt!338706)))))

(assert (=> d!100411 (= lt!338706 e!423944)))

(declare-fun c!83386 () Bool)

(assert (=> d!100411 (= c!83386 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100411 (= lt!338705 (select (arr!20144 lt!338482) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!100411 (validMask!0 mask!3328)))

(assert (=> d!100411 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!338483 lt!338482 mask!3328) lt!338706)))

(declare-fun b!760525 () Bool)

(assert (=> b!760525 (= e!423945 (Intermediate!7741 false (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!760526 () Bool)

(assert (=> b!760526 (and (bvsge (index!33334 lt!338706) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338706) (size!20565 lt!338482)))))

(declare-fun res!514514 () Bool)

(assert (=> b!760526 (= res!514514 (= (select (arr!20144 lt!338482) (index!33334 lt!338706)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760526 (=> res!514514 e!423946)))

(assert (= (and d!100411 c!83386) b!760519))

(assert (= (and d!100411 (not c!83386)) b!760521))

(assert (= (and b!760521 c!83388) b!760525))

(assert (= (and b!760521 (not c!83388)) b!760522))

(assert (= (and d!100411 c!83387) b!760524))

(assert (= (and d!100411 (not c!83387)) b!760523))

(assert (= (and b!760523 res!514513) b!760520))

(assert (= (and b!760520 (not res!514515)) b!760526))

(assert (= (and b!760526 (not res!514514)) b!760518))

(assert (=> b!760522 m!706841))

(assert (=> b!760522 m!707075))

(assert (=> b!760522 m!707075))

(declare-fun m!707087 () Bool)

(assert (=> b!760522 m!707087))

(assert (=> d!100411 m!706841))

(declare-fun m!707089 () Bool)

(assert (=> d!100411 m!707089))

(assert (=> d!100411 m!706679))

(declare-fun m!707091 () Bool)

(assert (=> b!760518 m!707091))

(assert (=> b!760526 m!707091))

(assert (=> b!760520 m!707091))

(assert (=> b!760210 d!100411))

(assert (=> b!760210 d!100409))

(assert (=> d!100313 d!100295))

(declare-fun b!760527 () Bool)

(declare-fun e!423950 () Bool)

(declare-fun e!423951 () Bool)

(assert (=> b!760527 (= e!423950 e!423951)))

(declare-fun c!83389 () Bool)

(assert (=> b!760527 (= c!83389 (validKeyInArray!0 (select (arr!20144 a!3186) (bvadd j!159 #b00000000000000000000000000000001))))))

(declare-fun d!100413 () Bool)

(declare-fun res!514516 () Bool)

(assert (=> d!100413 (=> res!514516 e!423950)))

(assert (=> d!100413 (= res!514516 (bvsge (bvadd j!159 #b00000000000000000000000000000001) (size!20565 a!3186)))))

(assert (=> d!100413 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328) e!423950)))

(declare-fun b!760528 () Bool)

(declare-fun e!423949 () Bool)

(assert (=> b!760528 (= e!423951 e!423949)))

(declare-fun lt!338707 () (_ BitVec 64))

(assert (=> b!760528 (= lt!338707 (select (arr!20144 a!3186) (bvadd j!159 #b00000000000000000000000000000001)))))

(declare-fun lt!338709 () Unit!26294)

(assert (=> b!760528 (= lt!338709 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338707 (bvadd j!159 #b00000000000000000000000000000001)))))

(assert (=> b!760528 (arrayContainsKey!0 a!3186 lt!338707 #b00000000000000000000000000000000)))

(declare-fun lt!338708 () Unit!26294)

(assert (=> b!760528 (= lt!338708 lt!338709)))

(declare-fun res!514517 () Bool)

(assert (=> b!760528 (= res!514517 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) (bvadd j!159 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7741 (bvadd j!159 #b00000000000000000000000000000001))))))

(assert (=> b!760528 (=> (not res!514517) (not e!423949))))

(declare-fun b!760529 () Bool)

(declare-fun call!34928 () Bool)

(assert (=> b!760529 (= e!423951 call!34928)))

(declare-fun bm!34925 () Bool)

(assert (=> bm!34925 (= call!34928 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760530 () Bool)

(assert (=> b!760530 (= e!423949 call!34928)))

(assert (= (and d!100413 (not res!514516)) b!760527))

(assert (= (and b!760527 c!83389) b!760528))

(assert (= (and b!760527 (not c!83389)) b!760529))

(assert (= (and b!760528 res!514517) b!760530))

(assert (= (or b!760530 b!760529) bm!34925))

(declare-fun m!707093 () Bool)

(assert (=> b!760527 m!707093))

(assert (=> b!760527 m!707093))

(declare-fun m!707095 () Bool)

(assert (=> b!760527 m!707095))

(assert (=> b!760528 m!707093))

(declare-fun m!707097 () Bool)

(assert (=> b!760528 m!707097))

(declare-fun m!707099 () Bool)

(assert (=> b!760528 m!707099))

(assert (=> b!760528 m!707093))

(declare-fun m!707101 () Bool)

(assert (=> b!760528 m!707101))

(declare-fun m!707103 () Bool)

(assert (=> bm!34925 m!707103))

(assert (=> bm!34908 d!100413))

(declare-fun d!100415 () Bool)

(assert (=> d!100415 (= (validKeyInArray!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000)) (and (not (= (select (arr!20144 a!3186) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20144 a!3186) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760365 d!100415))

(declare-fun b!760531 () Bool)

(declare-fun lt!338711 () SeekEntryResult!7741)

(assert (=> b!760531 (and (bvsge (index!33334 lt!338711) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338711) (size!20565 a!3186)))))

(declare-fun e!423954 () Bool)

(assert (=> b!760531 (= e!423954 (= (select (arr!20144 a!3186) (index!33334 lt!338711)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760532 () Bool)

(declare-fun e!423952 () SeekEntryResult!7741)

(assert (=> b!760532 (= e!423952 (Intermediate!7741 true (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760533 () Bool)

(assert (=> b!760533 (and (bvsge (index!33334 lt!338711) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338711) (size!20565 a!3186)))))

(declare-fun res!514520 () Bool)

(assert (=> b!760533 (= res!514520 (= (select (arr!20144 a!3186) (index!33334 lt!338711)) k0!2102))))

(assert (=> b!760533 (=> res!514520 e!423954)))

(declare-fun e!423956 () Bool)

(assert (=> b!760533 (= e!423956 e!423954)))

(declare-fun b!760534 () Bool)

(declare-fun e!423953 () SeekEntryResult!7741)

(assert (=> b!760534 (= e!423952 e!423953)))

(declare-fun c!83392 () Bool)

(declare-fun lt!338710 () (_ BitVec 64))

(assert (=> b!760534 (= c!83392 (or (= lt!338710 k0!2102) (= (bvadd lt!338710 lt!338710) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760535 () Bool)

(assert (=> b!760535 (= e!423953 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000 mask!3328) k0!2102 a!3186 mask!3328))))

(declare-fun b!760536 () Bool)

(declare-fun e!423955 () Bool)

(assert (=> b!760536 (= e!423955 e!423956)))

(declare-fun res!514518 () Bool)

(assert (=> b!760536 (= res!514518 (and ((_ is Intermediate!7741) lt!338711) (not (undefined!8553 lt!338711)) (bvslt (x!64231 lt!338711) #b01111111111111111111111111111110) (bvsge (x!64231 lt!338711) #b00000000000000000000000000000000) (bvsge (x!64231 lt!338711) #b00000000000000000000000000000000)))))

(assert (=> b!760536 (=> (not res!514518) (not e!423956))))

(declare-fun b!760537 () Bool)

(assert (=> b!760537 (= e!423955 (bvsge (x!64231 lt!338711) #b01111111111111111111111111111110))))

(declare-fun d!100417 () Bool)

(assert (=> d!100417 e!423955))

(declare-fun c!83391 () Bool)

(assert (=> d!100417 (= c!83391 (and ((_ is Intermediate!7741) lt!338711) (undefined!8553 lt!338711)))))

(assert (=> d!100417 (= lt!338711 e!423952)))

(declare-fun c!83390 () Bool)

(assert (=> d!100417 (= c!83390 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100417 (= lt!338710 (select (arr!20144 a!3186) (toIndex!0 k0!2102 mask!3328)))))

(assert (=> d!100417 (validMask!0 mask!3328)))

(assert (=> d!100417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328) lt!338711)))

(declare-fun b!760538 () Bool)

(assert (=> b!760538 (= e!423953 (Intermediate!7741 false (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760539 () Bool)

(assert (=> b!760539 (and (bvsge (index!33334 lt!338711) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338711) (size!20565 a!3186)))))

(declare-fun res!514519 () Bool)

(assert (=> b!760539 (= res!514519 (= (select (arr!20144 a!3186) (index!33334 lt!338711)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760539 (=> res!514519 e!423954)))

(assert (= (and d!100417 c!83390) b!760532))

(assert (= (and d!100417 (not c!83390)) b!760534))

(assert (= (and b!760534 c!83392) b!760538))

(assert (= (and b!760534 (not c!83392)) b!760535))

(assert (= (and d!100417 c!83391) b!760537))

(assert (= (and d!100417 (not c!83391)) b!760536))

(assert (= (and b!760536 res!514518) b!760533))

(assert (= (and b!760533 (not res!514520)) b!760539))

(assert (= (and b!760539 (not res!514519)) b!760531))

(assert (=> b!760535 m!706935))

(declare-fun m!707105 () Bool)

(assert (=> b!760535 m!707105))

(assert (=> b!760535 m!707105))

(declare-fun m!707107 () Bool)

(assert (=> b!760535 m!707107))

(assert (=> d!100417 m!706935))

(declare-fun m!707109 () Bool)

(assert (=> d!100417 m!707109))

(assert (=> d!100417 m!706679))

(declare-fun m!707111 () Bool)

(assert (=> b!760531 m!707111))

(assert (=> b!760539 m!707111))

(assert (=> b!760533 m!707111))

(assert (=> d!100357 d!100417))

(declare-fun d!100419 () Bool)

(declare-fun lt!338713 () (_ BitVec 32))

(declare-fun lt!338712 () (_ BitVec 32))

(assert (=> d!100419 (= lt!338713 (bvmul (bvxor lt!338712 (bvlshr lt!338712 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100419 (= lt!338712 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100419 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514426 (let ((h!15259 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64237 (bvmul (bvxor h!15259 (bvlshr h!15259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64237 (bvlshr x!64237 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514426 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514426 #b00000000000000000000000000000000))))))

(assert (=> d!100419 (= (toIndex!0 k0!2102 mask!3328) (bvand (bvxor lt!338713 (bvlshr lt!338713 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> d!100357 d!100419))

(assert (=> d!100357 d!100295))

(declare-fun b!760540 () Bool)

(declare-fun lt!338715 () SeekEntryResult!7741)

(assert (=> b!760540 (and (bvsge (index!33334 lt!338715) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338715) (size!20565 lt!338482)))))

(declare-fun e!423959 () Bool)

(assert (=> b!760540 (= e!423959 (= (select (arr!20144 lt!338482) (index!33334 lt!338715)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760541 () Bool)

(declare-fun e!423957 () SeekEntryResult!7741)

(assert (=> b!760541 (= e!423957 (Intermediate!7741 true (nextIndex!0 (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760542 () Bool)

(assert (=> b!760542 (and (bvsge (index!33334 lt!338715) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338715) (size!20565 lt!338482)))))

(declare-fun res!514523 () Bool)

(assert (=> b!760542 (= res!514523 (= (select (arr!20144 lt!338482) (index!33334 lt!338715)) lt!338483))))

(assert (=> b!760542 (=> res!514523 e!423959)))

(declare-fun e!423961 () Bool)

(assert (=> b!760542 (= e!423961 e!423959)))

(declare-fun b!760543 () Bool)

(declare-fun e!423958 () SeekEntryResult!7741)

(assert (=> b!760543 (= e!423957 e!423958)))

(declare-fun c!83395 () Bool)

(declare-fun lt!338714 () (_ BitVec 64))

(assert (=> b!760543 (= c!83395 (or (= lt!338714 lt!338483) (= (bvadd lt!338714 lt!338714) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760544 () Bool)

(assert (=> b!760544 (= e!423958 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!338483 lt!338482 mask!3328))))

(declare-fun b!760545 () Bool)

(declare-fun e!423960 () Bool)

(assert (=> b!760545 (= e!423960 e!423961)))

(declare-fun res!514521 () Bool)

(assert (=> b!760545 (= res!514521 (and ((_ is Intermediate!7741) lt!338715) (not (undefined!8553 lt!338715)) (bvslt (x!64231 lt!338715) #b01111111111111111111111111111110) (bvsge (x!64231 lt!338715) #b00000000000000000000000000000000) (bvsge (x!64231 lt!338715) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!760545 (=> (not res!514521) (not e!423961))))

(declare-fun b!760546 () Bool)

(assert (=> b!760546 (= e!423960 (bvsge (x!64231 lt!338715) #b01111111111111111111111111111110))))

(declare-fun d!100421 () Bool)

(assert (=> d!100421 e!423960))

(declare-fun c!83394 () Bool)

(assert (=> d!100421 (= c!83394 (and ((_ is Intermediate!7741) lt!338715) (undefined!8553 lt!338715)))))

(assert (=> d!100421 (= lt!338715 e!423957)))

(declare-fun c!83393 () Bool)

(assert (=> d!100421 (= c!83393 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100421 (= lt!338714 (select (arr!20144 lt!338482) (nextIndex!0 (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!100421 (validMask!0 mask!3328)))

(assert (=> d!100421 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338483 lt!338482 mask!3328) lt!338715)))

(declare-fun b!760547 () Bool)

(assert (=> b!760547 (= e!423958 (Intermediate!7741 false (nextIndex!0 (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760548 () Bool)

(assert (=> b!760548 (and (bvsge (index!33334 lt!338715) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338715) (size!20565 lt!338482)))))

(declare-fun res!514522 () Bool)

(assert (=> b!760548 (= res!514522 (= (select (arr!20144 lt!338482) (index!33334 lt!338715)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760548 (=> res!514522 e!423959)))

(assert (= (and d!100421 c!83393) b!760541))

(assert (= (and d!100421 (not c!83393)) b!760543))

(assert (= (and b!760543 c!83395) b!760547))

(assert (= (and b!760543 (not c!83395)) b!760544))

(assert (= (and d!100421 c!83394) b!760546))

(assert (= (and d!100421 (not c!83394)) b!760545))

(assert (= (and b!760545 res!514521) b!760542))

(assert (= (and b!760542 (not res!514523)) b!760548))

(assert (= (and b!760548 (not res!514522)) b!760540))

(assert (=> b!760544 m!706849))

(declare-fun m!707113 () Bool)

(assert (=> b!760544 m!707113))

(assert (=> b!760544 m!707113))

(declare-fun m!707115 () Bool)

(assert (=> b!760544 m!707115))

(assert (=> d!100421 m!706849))

(declare-fun m!707117 () Bool)

(assert (=> d!100421 m!707117))

(assert (=> d!100421 m!706679))

(declare-fun m!707119 () Bool)

(assert (=> b!760540 m!707119))

(assert (=> b!760548 m!707119))

(assert (=> b!760542 m!707119))

(assert (=> b!760219 d!100421))

(declare-fun d!100423 () Bool)

(declare-fun lt!338716 () (_ BitVec 32))

(assert (=> d!100423 (and (bvsge lt!338716 #b00000000000000000000000000000000) (bvslt lt!338716 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100423 (= lt!338716 (choose!52 (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!100423 (validMask!0 mask!3328)))

(assert (=> d!100423 (= (nextIndex!0 (toIndex!0 lt!338483 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338716)))

(declare-fun bs!21358 () Bool)

(assert (= bs!21358 d!100423))

(assert (=> bs!21358 m!706661))

(declare-fun m!707121 () Bool)

(assert (=> bs!21358 m!707121))

(assert (=> bs!21358 m!706679))

(assert (=> b!760219 d!100423))

(assert (=> d!100355 d!100295))

(declare-fun b!760549 () Bool)

(declare-fun e!423963 () Bool)

(declare-fun e!423964 () Bool)

(assert (=> b!760549 (= e!423963 e!423964)))

(declare-fun c!83396 () Bool)

(assert (=> b!760549 (= c!83396 (validKeyInArray!0 (select (arr!20144 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!100425 () Bool)

(declare-fun res!514524 () Bool)

(assert (=> d!100425 (=> res!514524 e!423963)))

(assert (=> d!100425 (= res!514524 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20565 a!3186)))))

(assert (=> d!100425 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328) e!423963)))

(declare-fun b!760550 () Bool)

(declare-fun e!423962 () Bool)

(assert (=> b!760550 (= e!423964 e!423962)))

(declare-fun lt!338717 () (_ BitVec 64))

(assert (=> b!760550 (= lt!338717 (select (arr!20144 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!338719 () Unit!26294)

(assert (=> b!760550 (= lt!338719 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!760550 (arrayContainsKey!0 a!3186 lt!338717 #b00000000000000000000000000000000)))

(declare-fun lt!338718 () Unit!26294)

(assert (=> b!760550 (= lt!338718 lt!338719)))

(declare-fun res!514525 () Bool)

(assert (=> b!760550 (= res!514525 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!760550 (=> (not res!514525) (not e!423962))))

(declare-fun b!760551 () Bool)

(declare-fun call!34929 () Bool)

(assert (=> b!760551 (= e!423964 call!34929)))

(declare-fun bm!34926 () Bool)

(assert (=> bm!34926 (= call!34929 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760552 () Bool)

(assert (=> b!760552 (= e!423962 call!34929)))

(assert (= (and d!100425 (not res!514524)) b!760549))

(assert (= (and b!760549 c!83396) b!760550))

(assert (= (and b!760549 (not c!83396)) b!760551))

(assert (= (and b!760550 res!514525) b!760552))

(assert (= (or b!760552 b!760551) bm!34926))

(declare-fun m!707123 () Bool)

(assert (=> b!760549 m!707123))

(assert (=> b!760549 m!707123))

(declare-fun m!707125 () Bool)

(assert (=> b!760549 m!707125))

(assert (=> b!760550 m!707123))

(declare-fun m!707127 () Bool)

(assert (=> b!760550 m!707127))

(declare-fun m!707129 () Bool)

(assert (=> b!760550 m!707129))

(assert (=> b!760550 m!707123))

(declare-fun m!707131 () Bool)

(assert (=> b!760550 m!707131))

(declare-fun m!707133 () Bool)

(assert (=> bm!34926 m!707133))

(assert (=> bm!34919 d!100425))

(assert (=> d!100323 d!100295))

(declare-fun b!760553 () Bool)

(declare-fun lt!338721 () SeekEntryResult!7741)

(assert (=> b!760553 (and (bvsge (index!33334 lt!338721) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338721) (size!20565 a!3186)))))

(declare-fun e!423967 () Bool)

(assert (=> b!760553 (= e!423967 (= (select (arr!20144 a!3186) (index!33334 lt!338721)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760554 () Bool)

(declare-fun e!423965 () SeekEntryResult!7741)

(assert (=> b!760554 (= e!423965 (Intermediate!7741 true (nextIndex!0 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760555 () Bool)

(assert (=> b!760555 (and (bvsge (index!33334 lt!338721) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338721) (size!20565 a!3186)))))

(declare-fun res!514528 () Bool)

(assert (=> b!760555 (= res!514528 (= (select (arr!20144 a!3186) (index!33334 lt!338721)) (select (arr!20144 a!3186) j!159)))))

(assert (=> b!760555 (=> res!514528 e!423967)))

(declare-fun e!423969 () Bool)

(assert (=> b!760555 (= e!423969 e!423967)))

(declare-fun b!760556 () Bool)

(declare-fun e!423966 () SeekEntryResult!7741)

(assert (=> b!760556 (= e!423965 e!423966)))

(declare-fun lt!338720 () (_ BitVec 64))

(declare-fun c!83399 () Bool)

(assert (=> b!760556 (= c!83399 (or (= lt!338720 (select (arr!20144 a!3186) j!159)) (= (bvadd lt!338720 lt!338720) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760557 () Bool)

(assert (=> b!760557 (= e!423966 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760558 () Bool)

(declare-fun e!423968 () Bool)

(assert (=> b!760558 (= e!423968 e!423969)))

(declare-fun res!514526 () Bool)

(assert (=> b!760558 (= res!514526 (and ((_ is Intermediate!7741) lt!338721) (not (undefined!8553 lt!338721)) (bvslt (x!64231 lt!338721) #b01111111111111111111111111111110) (bvsge (x!64231 lt!338721) #b00000000000000000000000000000000) (bvsge (x!64231 lt!338721) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!760558 (=> (not res!514526) (not e!423969))))

(declare-fun b!760559 () Bool)

(assert (=> b!760559 (= e!423968 (bvsge (x!64231 lt!338721) #b01111111111111111111111111111110))))

(declare-fun d!100427 () Bool)

(assert (=> d!100427 e!423968))

(declare-fun c!83398 () Bool)

(assert (=> d!100427 (= c!83398 (and ((_ is Intermediate!7741) lt!338721) (undefined!8553 lt!338721)))))

(assert (=> d!100427 (= lt!338721 e!423965)))

(declare-fun c!83397 () Bool)

(assert (=> d!100427 (= c!83397 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100427 (= lt!338720 (select (arr!20144 a!3186) (nextIndex!0 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!100427 (validMask!0 mask!3328)))

(assert (=> d!100427 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338721)))

(declare-fun b!760560 () Bool)

(assert (=> b!760560 (= e!423966 (Intermediate!7741 false (nextIndex!0 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!760561 () Bool)

(assert (=> b!760561 (and (bvsge (index!33334 lt!338721) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338721) (size!20565 a!3186)))))

(declare-fun res!514527 () Bool)

(assert (=> b!760561 (= res!514527 (= (select (arr!20144 a!3186) (index!33334 lt!338721)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760561 (=> res!514527 e!423967)))

(assert (= (and d!100427 c!83397) b!760554))

(assert (= (and d!100427 (not c!83397)) b!760556))

(assert (= (and b!760556 c!83399) b!760560))

(assert (= (and b!760556 (not c!83399)) b!760557))

(assert (= (and d!100427 c!83398) b!760559))

(assert (= (and d!100427 (not c!83398)) b!760558))

(assert (= (and b!760558 res!514526) b!760555))

(assert (= (and b!760555 (not res!514528)) b!760561))

(assert (= (and b!760561 (not res!514527)) b!760553))

(assert (=> b!760557 m!706913))

(declare-fun m!707135 () Bool)

(assert (=> b!760557 m!707135))

(assert (=> b!760557 m!707135))

(assert (=> b!760557 m!706671))

(declare-fun m!707137 () Bool)

(assert (=> b!760557 m!707137))

(assert (=> d!100427 m!706913))

(declare-fun m!707139 () Bool)

(assert (=> d!100427 m!707139))

(assert (=> d!100427 m!706679))

(declare-fun m!707141 () Bool)

(assert (=> b!760553 m!707141))

(assert (=> b!760561 m!707141))

(assert (=> b!760555 m!707141))

(assert (=> b!760327 d!100427))

(declare-fun d!100429 () Bool)

(declare-fun lt!338722 () (_ BitVec 32))

(assert (=> d!100429 (and (bvsge lt!338722 #b00000000000000000000000000000000) (bvslt lt!338722 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100429 (= lt!338722 (choose!52 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!100429 (validMask!0 mask!3328)))

(assert (=> d!100429 (= (nextIndex!0 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338722)))

(declare-fun bs!21359 () Bool)

(assert (= bs!21359 d!100429))

(assert (=> bs!21359 m!706697))

(declare-fun m!707143 () Bool)

(assert (=> bs!21359 m!707143))

(assert (=> bs!21359 m!706679))

(assert (=> b!760327 d!100429))

(declare-fun d!100431 () Bool)

(assert (=> d!100431 (arrayContainsKey!0 a!3186 lt!338633 #b00000000000000000000000000000000)))

(declare-fun lt!338725 () Unit!26294)

(declare-fun choose!13 (array!42063 (_ BitVec 64) (_ BitVec 32)) Unit!26294)

(assert (=> d!100431 (= lt!338725 (choose!13 a!3186 lt!338633 #b00000000000000000000000000000000))))

(assert (=> d!100431 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!100431 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338633 #b00000000000000000000000000000000) lt!338725)))

(declare-fun bs!21360 () Bool)

(assert (= bs!21360 d!100431))

(assert (=> bs!21360 m!706949))

(declare-fun m!707145 () Bool)

(assert (=> bs!21360 m!707145))

(assert (=> b!760366 d!100431))

(declare-fun d!100433 () Bool)

(declare-fun res!514529 () Bool)

(declare-fun e!423970 () Bool)

(assert (=> d!100433 (=> res!514529 e!423970)))

(assert (=> d!100433 (= res!514529 (= (select (arr!20144 a!3186) #b00000000000000000000000000000000) lt!338633))))

(assert (=> d!100433 (= (arrayContainsKey!0 a!3186 lt!338633 #b00000000000000000000000000000000) e!423970)))

(declare-fun b!760562 () Bool)

(declare-fun e!423971 () Bool)

(assert (=> b!760562 (= e!423970 e!423971)))

(declare-fun res!514530 () Bool)

(assert (=> b!760562 (=> (not res!514530) (not e!423971))))

(assert (=> b!760562 (= res!514530 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20565 a!3186)))))

(declare-fun b!760563 () Bool)

(assert (=> b!760563 (= e!423971 (arrayContainsKey!0 a!3186 lt!338633 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100433 (not res!514529)) b!760562))

(assert (= (and b!760562 res!514530) b!760563))

(assert (=> d!100433 m!706857))

(declare-fun m!707147 () Bool)

(assert (=> b!760563 m!707147))

(assert (=> b!760366 d!100433))

(declare-fun b!760564 () Bool)

(declare-fun c!83402 () Bool)

(declare-fun lt!338727 () (_ BitVec 64))

(assert (=> b!760564 (= c!83402 (= lt!338727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423973 () SeekEntryResult!7741)

(declare-fun e!423974 () SeekEntryResult!7741)

(assert (=> b!760564 (= e!423973 e!423974)))

(declare-fun b!760565 () Bool)

(declare-fun e!423972 () SeekEntryResult!7741)

(assert (=> b!760565 (= e!423972 e!423973)))

(declare-fun lt!338726 () SeekEntryResult!7741)

(assert (=> b!760565 (= lt!338727 (select (arr!20144 a!3186) (index!33334 lt!338726)))))

(declare-fun c!83400 () Bool)

(assert (=> b!760565 (= c!83400 (= lt!338727 (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760566 () Bool)

(assert (=> b!760566 (= e!423974 (seekKeyOrZeroReturnVacant!0 (x!64231 lt!338726) (index!33334 lt!338726) (index!33334 lt!338726) (select (arr!20144 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(declare-fun b!760567 () Bool)

(assert (=> b!760567 (= e!423973 (Found!7741 (index!33334 lt!338726)))))

(declare-fun d!100435 () Bool)

(declare-fun lt!338728 () SeekEntryResult!7741)

(assert (=> d!100435 (and (or ((_ is Undefined!7741) lt!338728) (not ((_ is Found!7741) lt!338728)) (and (bvsge (index!33333 lt!338728) #b00000000000000000000000000000000) (bvslt (index!33333 lt!338728) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338728) ((_ is Found!7741) lt!338728) (not ((_ is MissingZero!7741) lt!338728)) (and (bvsge (index!33332 lt!338728) #b00000000000000000000000000000000) (bvslt (index!33332 lt!338728) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338728) ((_ is Found!7741) lt!338728) ((_ is MissingZero!7741) lt!338728) (not ((_ is MissingVacant!7741) lt!338728)) (and (bvsge (index!33335 lt!338728) #b00000000000000000000000000000000) (bvslt (index!33335 lt!338728) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338728) (ite ((_ is Found!7741) lt!338728) (= (select (arr!20144 a!3186) (index!33333 lt!338728)) (select (arr!20144 a!3186) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!7741) lt!338728) (= (select (arr!20144 a!3186) (index!33332 lt!338728)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7741) lt!338728) (= (select (arr!20144 a!3186) (index!33335 lt!338728)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100435 (= lt!338728 e!423972)))

(declare-fun c!83401 () Bool)

(assert (=> d!100435 (= c!83401 (and ((_ is Intermediate!7741) lt!338726) (undefined!8553 lt!338726)))))

(assert (=> d!100435 (= lt!338726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000) mask!3328) (select (arr!20144 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(assert (=> d!100435 (validMask!0 mask!3328)))

(assert (=> d!100435 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) lt!338728)))

(declare-fun b!760568 () Bool)

(assert (=> b!760568 (= e!423974 (MissingZero!7741 (index!33334 lt!338726)))))

(declare-fun b!760569 () Bool)

(assert (=> b!760569 (= e!423972 Undefined!7741)))

(assert (= (and d!100435 c!83401) b!760569))

(assert (= (and d!100435 (not c!83401)) b!760565))

(assert (= (and b!760565 c!83400) b!760567))

(assert (= (and b!760565 (not c!83400)) b!760564))

(assert (= (and b!760564 c!83402) b!760568))

(assert (= (and b!760564 (not c!83402)) b!760566))

(declare-fun m!707149 () Bool)

(assert (=> b!760565 m!707149))

(assert (=> b!760566 m!706857))

(declare-fun m!707151 () Bool)

(assert (=> b!760566 m!707151))

(declare-fun m!707153 () Bool)

(assert (=> d!100435 m!707153))

(declare-fun m!707155 () Bool)

(assert (=> d!100435 m!707155))

(assert (=> d!100435 m!706679))

(assert (=> d!100435 m!706857))

(declare-fun m!707157 () Bool)

(assert (=> d!100435 m!707157))

(assert (=> d!100435 m!707157))

(assert (=> d!100435 m!706857))

(declare-fun m!707159 () Bool)

(assert (=> d!100435 m!707159))

(declare-fun m!707161 () Bool)

(assert (=> d!100435 m!707161))

(assert (=> b!760366 d!100435))

(assert (=> d!100303 d!100299))

(declare-fun d!100437 () Bool)

(assert (=> d!100437 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(assert (=> d!100437 true))

(declare-fun _$72!107 () Unit!26294)

(assert (=> d!100437 (= (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) _$72!107)))

(declare-fun bs!21361 () Bool)

(assert (= bs!21361 d!100437))

(assert (=> bs!21361 m!706657))

(assert (=> d!100303 d!100437))

(assert (=> d!100303 d!100295))

(assert (=> d!100351 d!100295))

(assert (=> d!100339 d!100351))

(assert (=> d!100339 d!100353))

(assert (=> d!100339 d!100295))

(declare-fun b!760571 () Bool)

(declare-fun e!423975 () SeekEntryResult!7741)

(assert (=> b!760571 (= e!423975 (MissingVacant!7741 (index!33334 lt!338615)))))

(declare-fun b!760572 () Bool)

(declare-fun c!83403 () Bool)

(declare-fun lt!338730 () (_ BitVec 64))

(assert (=> b!760572 (= c!83403 (= lt!338730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423976 () SeekEntryResult!7741)

(assert (=> b!760572 (= e!423976 e!423975)))

(declare-fun b!760573 () Bool)

(declare-fun e!423977 () SeekEntryResult!7741)

(assert (=> b!760573 (= e!423977 Undefined!7741)))

(declare-fun b!760574 () Bool)

(assert (=> b!760574 (= e!423977 e!423976)))

(declare-fun c!83404 () Bool)

(assert (=> b!760574 (= c!83404 (= lt!338730 (select (arr!20144 a!3186) j!159)))))

(declare-fun b!760575 () Bool)

(assert (=> b!760575 (= e!423976 (Found!7741 (index!33334 lt!338615)))))

(declare-fun b!760570 () Bool)

(assert (=> b!760570 (= e!423975 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64231 lt!338615) #b00000000000000000000000000000001) (nextIndex!0 (index!33334 lt!338615) (x!64231 lt!338615) mask!3328) (index!33334 lt!338615) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100439 () Bool)

(declare-fun lt!338729 () SeekEntryResult!7741)

(assert (=> d!100439 (and (or ((_ is Undefined!7741) lt!338729) (not ((_ is Found!7741) lt!338729)) (and (bvsge (index!33333 lt!338729) #b00000000000000000000000000000000) (bvslt (index!33333 lt!338729) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338729) ((_ is Found!7741) lt!338729) (not ((_ is MissingVacant!7741) lt!338729)) (not (= (index!33335 lt!338729) (index!33334 lt!338615))) (and (bvsge (index!33335 lt!338729) #b00000000000000000000000000000000) (bvslt (index!33335 lt!338729) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338729) (ite ((_ is Found!7741) lt!338729) (= (select (arr!20144 a!3186) (index!33333 lt!338729)) (select (arr!20144 a!3186) j!159)) (and ((_ is MissingVacant!7741) lt!338729) (= (index!33335 lt!338729) (index!33334 lt!338615)) (= (select (arr!20144 a!3186) (index!33335 lt!338729)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100439 (= lt!338729 e!423977)))

(declare-fun c!83405 () Bool)

(assert (=> d!100439 (= c!83405 (bvsge (x!64231 lt!338615) #b01111111111111111111111111111110))))

(assert (=> d!100439 (= lt!338730 (select (arr!20144 a!3186) (index!33334 lt!338615)))))

(assert (=> d!100439 (validMask!0 mask!3328)))

(assert (=> d!100439 (= (seekKeyOrZeroReturnVacant!0 (x!64231 lt!338615) (index!33334 lt!338615) (index!33334 lt!338615) (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338729)))

(assert (= (and d!100439 c!83405) b!760573))

(assert (= (and d!100439 (not c!83405)) b!760574))

(assert (= (and b!760574 c!83404) b!760575))

(assert (= (and b!760574 (not c!83404)) b!760572))

(assert (= (and b!760572 c!83403) b!760571))

(assert (= (and b!760572 (not c!83403)) b!760570))

(declare-fun m!707163 () Bool)

(assert (=> b!760570 m!707163))

(assert (=> b!760570 m!707163))

(assert (=> b!760570 m!706671))

(declare-fun m!707165 () Bool)

(assert (=> b!760570 m!707165))

(declare-fun m!707167 () Bool)

(assert (=> d!100439 m!707167))

(declare-fun m!707169 () Bool)

(assert (=> d!100439 m!707169))

(assert (=> d!100439 m!706903))

(assert (=> d!100439 m!706679))

(assert (=> b!760319 d!100439))

(assert (=> b!760244 d!100415))

(assert (=> d!100359 d!100295))

(assert (=> d!100293 d!100295))

(declare-fun d!100441 () Bool)

(declare-fun res!514531 () Bool)

(declare-fun e!423978 () Bool)

(assert (=> d!100441 (=> res!514531 e!423978)))

(assert (=> d!100441 (= res!514531 (= (select (arr!20144 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2102))))

(assert (=> d!100441 (= (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!423978)))

(declare-fun b!760576 () Bool)

(declare-fun e!423979 () Bool)

(assert (=> b!760576 (= e!423978 e!423979)))

(declare-fun res!514532 () Bool)

(assert (=> b!760576 (=> (not res!514532) (not e!423979))))

(assert (=> b!760576 (= res!514532 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!20565 a!3186)))))

(declare-fun b!760577 () Bool)

(assert (=> b!760577 (= e!423979 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!100441 (not res!514531)) b!760576))

(assert (= (and b!760576 res!514532) b!760577))

(assert (=> d!100441 m!707123))

(declare-fun m!707171 () Bool)

(assert (=> b!760577 m!707171))

(assert (=> b!760267 d!100441))

(declare-fun b!760579 () Bool)

(declare-fun e!423980 () SeekEntryResult!7741)

(assert (=> b!760579 (= e!423980 (MissingVacant!7741 resIntermediateIndex!5))))

(declare-fun b!760580 () Bool)

(declare-fun c!83406 () Bool)

(declare-fun lt!338732 () (_ BitVec 64))

(assert (=> b!760580 (= c!83406 (= lt!338732 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423981 () SeekEntryResult!7741)

(assert (=> b!760580 (= e!423981 e!423980)))

(declare-fun b!760581 () Bool)

(declare-fun e!423982 () SeekEntryResult!7741)

(assert (=> b!760581 (= e!423982 Undefined!7741)))

(declare-fun b!760582 () Bool)

(assert (=> b!760582 (= e!423982 e!423981)))

(declare-fun c!83407 () Bool)

(assert (=> b!760582 (= c!83407 (= lt!338732 (select (arr!20144 a!3186) j!159)))))

(declare-fun b!760583 () Bool)

(assert (=> b!760583 (= e!423981 (Found!7741 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(declare-fun b!760578 () Bool)

(assert (=> b!760578 (= e!423980 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100443 () Bool)

(declare-fun lt!338731 () SeekEntryResult!7741)

(assert (=> d!100443 (and (or ((_ is Undefined!7741) lt!338731) (not ((_ is Found!7741) lt!338731)) (and (bvsge (index!33333 lt!338731) #b00000000000000000000000000000000) (bvslt (index!33333 lt!338731) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338731) ((_ is Found!7741) lt!338731) (not ((_ is MissingVacant!7741) lt!338731)) (not (= (index!33335 lt!338731) resIntermediateIndex!5)) (and (bvsge (index!33335 lt!338731) #b00000000000000000000000000000000) (bvslt (index!33335 lt!338731) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338731) (ite ((_ is Found!7741) lt!338731) (= (select (arr!20144 a!3186) (index!33333 lt!338731)) (select (arr!20144 a!3186) j!159)) (and ((_ is MissingVacant!7741) lt!338731) (= (index!33335 lt!338731) resIntermediateIndex!5) (= (select (arr!20144 a!3186) (index!33335 lt!338731)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100443 (= lt!338731 e!423982)))

(declare-fun c!83408 () Bool)

(assert (=> d!100443 (= c!83408 (bvsge (bvadd resIntermediateX!5 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100443 (= lt!338732 (select (arr!20144 a!3186) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(assert (=> d!100443 (validMask!0 mask!3328)))

(assert (=> d!100443 (= (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338731)))

(assert (= (and d!100443 c!83408) b!760581))

(assert (= (and d!100443 (not c!83408)) b!760582))

(assert (= (and b!760582 c!83407) b!760583))

(assert (= (and b!760582 (not c!83407)) b!760580))

(assert (= (and b!760580 c!83406) b!760579))

(assert (= (and b!760580 (not c!83406)) b!760578))

(assert (=> b!760578 m!706793))

(declare-fun m!707173 () Bool)

(assert (=> b!760578 m!707173))

(assert (=> b!760578 m!707173))

(assert (=> b!760578 m!706671))

(declare-fun m!707175 () Bool)

(assert (=> b!760578 m!707175))

(declare-fun m!707177 () Bool)

(assert (=> d!100443 m!707177))

(declare-fun m!707179 () Bool)

(assert (=> d!100443 m!707179))

(assert (=> d!100443 m!706793))

(declare-fun m!707181 () Bool)

(assert (=> d!100443 m!707181))

(assert (=> d!100443 m!706679))

(assert (=> b!760107 d!100443))

(declare-fun d!100445 () Bool)

(declare-fun lt!338733 () (_ BitVec 32))

(assert (=> d!100445 (and (bvsge lt!338733 #b00000000000000000000000000000000) (bvslt lt!338733 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100445 (= lt!338733 (choose!52 resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(assert (=> d!100445 (validMask!0 mask!3328)))

(assert (=> d!100445 (= (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) lt!338733)))

(declare-fun bs!21362 () Bool)

(assert (= bs!21362 d!100445))

(declare-fun m!707183 () Bool)

(assert (=> bs!21362 m!707183))

(assert (=> bs!21362 m!706679))

(assert (=> b!760107 d!100445))

(declare-fun b!760584 () Bool)

(declare-fun e!423986 () Bool)

(declare-fun e!423984 () Bool)

(assert (=> b!760584 (= e!423986 e!423984)))

(declare-fun res!514533 () Bool)

(assert (=> b!760584 (=> (not res!514533) (not e!423984))))

(declare-fun e!423985 () Bool)

(assert (=> b!760584 (= res!514533 (not e!423985))))

(declare-fun res!514535 () Bool)

(assert (=> b!760584 (=> (not res!514535) (not e!423985))))

(assert (=> b!760584 (= res!514535 (validKeyInArray!0 (select (arr!20144 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!760585 () Bool)

(declare-fun e!423983 () Bool)

(assert (=> b!760585 (= e!423984 e!423983)))

(declare-fun c!83409 () Bool)

(assert (=> b!760585 (= c!83409 (validKeyInArray!0 (select (arr!20144 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!34930 () Bool)

(declare-fun bm!34927 () Bool)

(assert (=> bm!34927 (= call!34930 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!83409 (Cons!14181 (select (arr!20144 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!83285 (Cons!14181 (select (arr!20144 a!3186) #b00000000000000000000000000000000) Nil!14182) Nil!14182)) (ite c!83285 (Cons!14181 (select (arr!20144 a!3186) #b00000000000000000000000000000000) Nil!14182) Nil!14182))))))

(declare-fun d!100447 () Bool)

(declare-fun res!514534 () Bool)

(assert (=> d!100447 (=> res!514534 e!423986)))

(assert (=> d!100447 (= res!514534 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20565 a!3186)))))

(assert (=> d!100447 (= (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83285 (Cons!14181 (select (arr!20144 a!3186) #b00000000000000000000000000000000) Nil!14182) Nil!14182)) e!423986)))

(declare-fun b!760586 () Bool)

(assert (=> b!760586 (= e!423983 call!34930)))

(declare-fun b!760587 () Bool)

(assert (=> b!760587 (= e!423985 (contains!4049 (ite c!83285 (Cons!14181 (select (arr!20144 a!3186) #b00000000000000000000000000000000) Nil!14182) Nil!14182) (select (arr!20144 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!760588 () Bool)

(assert (=> b!760588 (= e!423983 call!34930)))

(assert (= (and d!100447 (not res!514534)) b!760584))

(assert (= (and b!760584 res!514535) b!760587))

(assert (= (and b!760584 res!514533) b!760585))

(assert (= (and b!760585 c!83409) b!760586))

(assert (= (and b!760585 (not c!83409)) b!760588))

(assert (= (or b!760586 b!760588) bm!34927))

(assert (=> b!760584 m!707123))

(assert (=> b!760584 m!707123))

(assert (=> b!760584 m!707125))

(assert (=> b!760585 m!707123))

(assert (=> b!760585 m!707123))

(assert (=> b!760585 m!707125))

(assert (=> bm!34927 m!707123))

(declare-fun m!707185 () Bool)

(assert (=> bm!34927 m!707185))

(assert (=> b!760587 m!707123))

(assert (=> b!760587 m!707123))

(declare-fun m!707187 () Bool)

(assert (=> b!760587 m!707187))

(assert (=> bm!34914 d!100447))

(declare-fun b!760590 () Bool)

(declare-fun e!423987 () SeekEntryResult!7741)

(assert (=> b!760590 (= e!423987 (MissingVacant!7741 (index!33334 lt!338628)))))

(declare-fun b!760591 () Bool)

(declare-fun c!83410 () Bool)

(declare-fun lt!338735 () (_ BitVec 64))

(assert (=> b!760591 (= c!83410 (= lt!338735 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423988 () SeekEntryResult!7741)

(assert (=> b!760591 (= e!423988 e!423987)))

(declare-fun b!760592 () Bool)

(declare-fun e!423989 () SeekEntryResult!7741)

(assert (=> b!760592 (= e!423989 Undefined!7741)))

(declare-fun b!760593 () Bool)

(assert (=> b!760593 (= e!423989 e!423988)))

(declare-fun c!83411 () Bool)

(assert (=> b!760593 (= c!83411 (= lt!338735 k0!2102))))

(declare-fun b!760594 () Bool)

(assert (=> b!760594 (= e!423988 (Found!7741 (index!33334 lt!338628)))))

(declare-fun b!760589 () Bool)

(assert (=> b!760589 (= e!423987 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64231 lt!338628) #b00000000000000000000000000000001) (nextIndex!0 (index!33334 lt!338628) (x!64231 lt!338628) mask!3328) (index!33334 lt!338628) k0!2102 a!3186 mask!3328))))

(declare-fun lt!338734 () SeekEntryResult!7741)

(declare-fun d!100449 () Bool)

(assert (=> d!100449 (and (or ((_ is Undefined!7741) lt!338734) (not ((_ is Found!7741) lt!338734)) (and (bvsge (index!33333 lt!338734) #b00000000000000000000000000000000) (bvslt (index!33333 lt!338734) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338734) ((_ is Found!7741) lt!338734) (not ((_ is MissingVacant!7741) lt!338734)) (not (= (index!33335 lt!338734) (index!33334 lt!338628))) (and (bvsge (index!33335 lt!338734) #b00000000000000000000000000000000) (bvslt (index!33335 lt!338734) (size!20565 a!3186)))) (or ((_ is Undefined!7741) lt!338734) (ite ((_ is Found!7741) lt!338734) (= (select (arr!20144 a!3186) (index!33333 lt!338734)) k0!2102) (and ((_ is MissingVacant!7741) lt!338734) (= (index!33335 lt!338734) (index!33334 lt!338628)) (= (select (arr!20144 a!3186) (index!33335 lt!338734)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100449 (= lt!338734 e!423989)))

(declare-fun c!83412 () Bool)

(assert (=> d!100449 (= c!83412 (bvsge (x!64231 lt!338628) #b01111111111111111111111111111110))))

(assert (=> d!100449 (= lt!338735 (select (arr!20144 a!3186) (index!33334 lt!338628)))))

(assert (=> d!100449 (validMask!0 mask!3328)))

(assert (=> d!100449 (= (seekKeyOrZeroReturnVacant!0 (x!64231 lt!338628) (index!33334 lt!338628) (index!33334 lt!338628) k0!2102 a!3186 mask!3328) lt!338734)))

(assert (= (and d!100449 c!83412) b!760592))

(assert (= (and d!100449 (not c!83412)) b!760593))

(assert (= (and b!760593 c!83411) b!760594))

(assert (= (and b!760593 (not c!83411)) b!760591))

(assert (= (and b!760591 c!83410) b!760590))

(assert (= (and b!760591 (not c!83410)) b!760589))

(declare-fun m!707189 () Bool)

(assert (=> b!760589 m!707189))

(assert (=> b!760589 m!707189))

(declare-fun m!707191 () Bool)

(assert (=> b!760589 m!707191))

(declare-fun m!707193 () Bool)

(assert (=> d!100449 m!707193))

(declare-fun m!707195 () Bool)

(assert (=> d!100449 m!707195))

(assert (=> d!100449 m!706927))

(assert (=> d!100449 m!706679))

(assert (=> b!760355 d!100449))

(assert (=> b!760245 d!100415))

(declare-fun b!760595 () Bool)

(declare-fun lt!338737 () SeekEntryResult!7741)

(assert (=> b!760595 (and (bvsge (index!33334 lt!338737) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338737) (size!20565 a!3186)))))

(declare-fun e!423992 () Bool)

(assert (=> b!760595 (= e!423992 (= (select (arr!20144 a!3186) (index!33334 lt!338737)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760596 () Bool)

(declare-fun e!423990 () SeekEntryResult!7741)

(assert (=> b!760596 (= e!423990 (Intermediate!7741 true (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!760597 () Bool)

(assert (=> b!760597 (and (bvsge (index!33334 lt!338737) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338737) (size!20565 a!3186)))))

(declare-fun res!514538 () Bool)

(assert (=> b!760597 (= res!514538 (= (select (arr!20144 a!3186) (index!33334 lt!338737)) (select (arr!20144 a!3186) j!159)))))

(assert (=> b!760597 (=> res!514538 e!423992)))

(declare-fun e!423994 () Bool)

(assert (=> b!760597 (= e!423994 e!423992)))

(declare-fun b!760598 () Bool)

(declare-fun e!423991 () SeekEntryResult!7741)

(assert (=> b!760598 (= e!423990 e!423991)))

(declare-fun c!83415 () Bool)

(declare-fun lt!338736 () (_ BitVec 64))

(assert (=> b!760598 (= c!83415 (or (= lt!338736 (select (arr!20144 a!3186) j!159)) (= (bvadd lt!338736 lt!338736) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760599 () Bool)

(assert (=> b!760599 (= e!423991 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760600 () Bool)

(declare-fun e!423993 () Bool)

(assert (=> b!760600 (= e!423993 e!423994)))

(declare-fun res!514536 () Bool)

(assert (=> b!760600 (= res!514536 (and ((_ is Intermediate!7741) lt!338737) (not (undefined!8553 lt!338737)) (bvslt (x!64231 lt!338737) #b01111111111111111111111111111110) (bvsge (x!64231 lt!338737) #b00000000000000000000000000000000) (bvsge (x!64231 lt!338737) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!760600 (=> (not res!514536) (not e!423994))))

(declare-fun b!760601 () Bool)

(assert (=> b!760601 (= e!423993 (bvsge (x!64231 lt!338737) #b01111111111111111111111111111110))))

(declare-fun d!100451 () Bool)

(assert (=> d!100451 e!423993))

(declare-fun c!83414 () Bool)

(assert (=> d!100451 (= c!83414 (and ((_ is Intermediate!7741) lt!338737) (undefined!8553 lt!338737)))))

(assert (=> d!100451 (= lt!338737 e!423990)))

(declare-fun c!83413 () Bool)

(assert (=> d!100451 (= c!83413 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100451 (= lt!338736 (select (arr!20144 a!3186) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!100451 (validMask!0 mask!3328)))

(assert (=> d!100451 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338737)))

(declare-fun b!760602 () Bool)

(assert (=> b!760602 (= e!423991 (Intermediate!7741 false (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!760603 () Bool)

(assert (=> b!760603 (and (bvsge (index!33334 lt!338737) #b00000000000000000000000000000000) (bvslt (index!33334 lt!338737) (size!20565 a!3186)))))

(declare-fun res!514537 () Bool)

(assert (=> b!760603 (= res!514537 (= (select (arr!20144 a!3186) (index!33334 lt!338737)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760603 (=> res!514537 e!423992)))

(assert (= (and d!100451 c!83413) b!760596))

(assert (= (and d!100451 (not c!83413)) b!760598))

(assert (= (and b!760598 c!83415) b!760602))

(assert (= (and b!760598 (not c!83415)) b!760599))

(assert (= (and d!100451 c!83414) b!760601))

(assert (= (and d!100451 (not c!83414)) b!760600))

(assert (= (and b!760600 res!514536) b!760597))

(assert (= (and b!760597 (not res!514538)) b!760603))

(assert (= (and b!760603 (not res!514537)) b!760595))

(assert (=> b!760599 m!706841))

(assert (=> b!760599 m!707075))

(assert (=> b!760599 m!707075))

(assert (=> b!760599 m!706671))

(declare-fun m!707197 () Bool)

(assert (=> b!760599 m!707197))

(assert (=> d!100451 m!706841))

(assert (=> d!100451 m!707083))

(assert (=> d!100451 m!706679))

(declare-fun m!707199 () Bool)

(assert (=> b!760595 m!707199))

(assert (=> b!760603 m!707199))

(assert (=> b!760597 m!707199))

(assert (=> b!760336 d!100451))

(assert (=> b!760336 d!100409))

(declare-fun d!100453 () Bool)

(assert (=> d!100453 (arrayContainsKey!0 a!3186 lt!338547 #b00000000000000000000000000000000)))

(declare-fun lt!338738 () Unit!26294)

(assert (=> d!100453 (= lt!338738 (choose!13 a!3186 lt!338547 j!159))))

(assert (=> d!100453 (bvsge j!159 #b00000000000000000000000000000000)))

(assert (=> d!100453 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338547 j!159) lt!338738)))

(declare-fun bs!21363 () Bool)

(assert (= bs!21363 d!100453))

(assert (=> bs!21363 m!706803))

(declare-fun m!707201 () Bool)

(assert (=> bs!21363 m!707201))

(assert (=> b!760132 d!100453))

(declare-fun d!100455 () Bool)

(declare-fun res!514539 () Bool)

(declare-fun e!423995 () Bool)

(assert (=> d!100455 (=> res!514539 e!423995)))

(assert (=> d!100455 (= res!514539 (= (select (arr!20144 a!3186) #b00000000000000000000000000000000) lt!338547))))

(assert (=> d!100455 (= (arrayContainsKey!0 a!3186 lt!338547 #b00000000000000000000000000000000) e!423995)))

(declare-fun b!760604 () Bool)

(declare-fun e!423996 () Bool)

(assert (=> b!760604 (= e!423995 e!423996)))

(declare-fun res!514540 () Bool)

(assert (=> b!760604 (=> (not res!514540) (not e!423996))))

(assert (=> b!760604 (= res!514540 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20565 a!3186)))))

(declare-fun b!760605 () Bool)

(assert (=> b!760605 (= e!423996 (arrayContainsKey!0 a!3186 lt!338547 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100455 (not res!514539)) b!760604))

(assert (= (and b!760604 res!514540) b!760605))

(assert (=> d!100455 m!706857))

(declare-fun m!707203 () Bool)

(assert (=> b!760605 m!707203))

(assert (=> b!760132 d!100455))

(assert (=> b!760132 d!100339))

(declare-fun d!100457 () Bool)

(declare-fun lt!338741 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!377 (List!14185) (InoxSet (_ BitVec 64)))

(assert (=> d!100457 (= lt!338741 (select (content!377 Nil!14182) (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun e!424001 () Bool)

(assert (=> d!100457 (= lt!338741 e!424001)))

(declare-fun res!514546 () Bool)

(assert (=> d!100457 (=> (not res!514546) (not e!424001))))

(assert (=> d!100457 (= res!514546 ((_ is Cons!14181) Nil!14182))))

(assert (=> d!100457 (= (contains!4049 Nil!14182 (select (arr!20144 a!3186) #b00000000000000000000000000000000)) lt!338741)))

(declare-fun b!760610 () Bool)

(declare-fun e!424002 () Bool)

(assert (=> b!760610 (= e!424001 e!424002)))

(declare-fun res!514545 () Bool)

(assert (=> b!760610 (=> res!514545 e!424002)))

(assert (=> b!760610 (= res!514545 (= (h!15256 Nil!14182) (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760611 () Bool)

(assert (=> b!760611 (= e!424002 (contains!4049 (t!20491 Nil!14182) (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100457 res!514546) b!760610))

(assert (= (and b!760610 (not res!514545)) b!760611))

(declare-fun m!707205 () Bool)

(assert (=> d!100457 m!707205))

(assert (=> d!100457 m!706857))

(declare-fun m!707207 () Bool)

(assert (=> d!100457 m!707207))

(assert (=> b!760611 m!706857))

(declare-fun m!707209 () Bool)

(assert (=> b!760611 m!707209))

(assert (=> b!760247 d!100457))

(assert (=> b!760131 d!100337))

(check-sat (not d!100453) (not b!760587) (not b!760566) (not d!100443) (not b!760544) (not d!100445) (not d!100423) (not b!760589) (not b!760512) (not b!760535) (not d!100439) (not b!760585) (not d!100421) (not d!100427) (not bm!34927) (not b!760557) (not d!100431) (not b!760599) (not b!760522) (not d!100411) (not d!100429) (not b!760563) (not d!100407) (not d!100417) (not b!760577) (not bm!34926) (not b!760528) (not bm!34925) (not b!760584) (not b!760550) (not b!760570) (not b!760549) (not b!760578) (not d!100449) (not d!100435) (not d!100451) (not d!100437) (not b!760605) (not b!760527) (not b!760611) (not d!100457) (not d!100409))
(check-sat)
