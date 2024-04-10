; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67790 () Bool)

(assert start!67790)

(declare-fun b!787967 () Bool)

(declare-fun e!437977 () Bool)

(declare-datatypes ((SeekEntryResult!8103 0))(
  ( (MissingZero!8103 (index!34780 (_ BitVec 32))) (Found!8103 (index!34781 (_ BitVec 32))) (Intermediate!8103 (undefined!8915 Bool) (index!34782 (_ BitVec 32)) (x!65715 (_ BitVec 32))) (Undefined!8103) (MissingVacant!8103 (index!34783 (_ BitVec 32))) )
))
(declare-fun lt!351532 () SeekEntryResult!8103)

(declare-fun lt!351535 () SeekEntryResult!8103)

(assert (=> b!787967 (= e!437977 (= lt!351532 lt!351535))))

(declare-fun b!787968 () Bool)

(declare-fun res!533761 () Bool)

(declare-fun e!437974 () Bool)

(assert (=> b!787968 (=> (not res!533761) (not e!437974))))

(declare-fun e!437973 () Bool)

(assert (=> b!787968 (= res!533761 e!437973)))

(declare-fun c!87517 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787968 (= c!87517 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787969 () Bool)

(declare-fun e!437980 () Bool)

(assert (=> b!787969 (= e!437974 e!437980)))

(declare-fun res!533759 () Bool)

(assert (=> b!787969 (=> (not res!533759) (not e!437980))))

(declare-fun lt!351527 () SeekEntryResult!8103)

(declare-fun lt!351529 () SeekEntryResult!8103)

(assert (=> b!787969 (= res!533759 (= lt!351527 lt!351529))))

(declare-datatypes ((array!42830 0))(
  ( (array!42831 (arr!20503 (Array (_ BitVec 32) (_ BitVec 64))) (size!20924 (_ BitVec 32))) )
))
(declare-fun lt!351531 () array!42830)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!351530 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42830 (_ BitVec 32)) SeekEntryResult!8103)

(assert (=> b!787969 (= lt!351529 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351530 lt!351531 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787969 (= lt!351527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351530 mask!3328) lt!351530 lt!351531 mask!3328))))

(declare-fun a!3186 () array!42830)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!787969 (= lt!351530 (select (store (arr!20503 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787969 (= lt!351531 (array!42831 (store (arr!20503 a!3186) i!1173 k0!2102) (size!20924 a!3186)))))

(declare-fun b!787970 () Bool)

(declare-datatypes ((Unit!27300 0))(
  ( (Unit!27301) )
))
(declare-fun e!437976 () Unit!27300)

(declare-fun Unit!27302 () Unit!27300)

(assert (=> b!787970 (= e!437976 Unit!27302)))

(assert (=> b!787970 false))

(declare-fun res!533762 () Bool)

(declare-fun e!437979 () Bool)

(assert (=> start!67790 (=> (not res!533762) (not e!437979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67790 (= res!533762 (validMask!0 mask!3328))))

(assert (=> start!67790 e!437979))

(assert (=> start!67790 true))

(declare-fun array_inv!16299 (array!42830) Bool)

(assert (=> start!67790 (array_inv!16299 a!3186)))

(declare-fun b!787971 () Bool)

(declare-fun e!437978 () Bool)

(assert (=> b!787971 (= e!437978 e!437974)))

(declare-fun res!533760 () Bool)

(assert (=> b!787971 (=> (not res!533760) (not e!437974))))

(declare-fun lt!351528 () SeekEntryResult!8103)

(assert (=> b!787971 (= res!533760 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20503 a!3186) j!159) mask!3328) (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!351528))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!787971 (= lt!351528 (Intermediate!8103 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787972 () Bool)

(declare-fun e!437983 () Bool)

(assert (=> b!787972 (= e!437980 (not e!437983))))

(declare-fun res!533764 () Bool)

(assert (=> b!787972 (=> res!533764 e!437983)))

(get-info :version)

(assert (=> b!787972 (= res!533764 (or (not ((_ is Intermediate!8103) lt!351529)) (bvslt x!1131 (x!65715 lt!351529)) (not (= x!1131 (x!65715 lt!351529))) (not (= index!1321 (index!34782 lt!351529)))))))

(declare-fun e!437975 () Bool)

(assert (=> b!787972 e!437975))

(declare-fun res!533756 () Bool)

(assert (=> b!787972 (=> (not res!533756) (not e!437975))))

(declare-fun lt!351534 () SeekEntryResult!8103)

(assert (=> b!787972 (= res!533756 (= lt!351532 lt!351534))))

(assert (=> b!787972 (= lt!351534 (Found!8103 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42830 (_ BitVec 32)) SeekEntryResult!8103)

(assert (=> b!787972 (= lt!351532 (seekEntryOrOpen!0 (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42830 (_ BitVec 32)) Bool)

(assert (=> b!787972 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351526 () Unit!27300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27300)

(assert (=> b!787972 (= lt!351526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787973 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42830 (_ BitVec 32)) SeekEntryResult!8103)

(assert (=> b!787973 (= e!437975 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!351534))))

(declare-fun b!787974 () Bool)

(declare-fun res!533765 () Bool)

(assert (=> b!787974 (=> (not res!533765) (not e!437979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787974 (= res!533765 (validKeyInArray!0 k0!2102))))

(declare-fun b!787975 () Bool)

(declare-fun res!533750 () Bool)

(assert (=> b!787975 (=> (not res!533750) (not e!437974))))

(assert (=> b!787975 (= res!533750 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20503 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787976 () Bool)

(declare-fun res!533754 () Bool)

(assert (=> b!787976 (=> (not res!533754) (not e!437979))))

(declare-fun arrayContainsKey!0 (array!42830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787976 (= res!533754 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787977 () Bool)

(assert (=> b!787977 (= e!437973 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) lt!351528))))

(declare-fun b!787978 () Bool)

(declare-fun res!533758 () Bool)

(assert (=> b!787978 (=> (not res!533758) (not e!437977))))

(assert (=> b!787978 (= res!533758 (= (seekEntryOrOpen!0 lt!351530 lt!351531 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351530 lt!351531 mask!3328)))))

(declare-fun b!787979 () Bool)

(declare-fun res!533757 () Bool)

(assert (=> b!787979 (=> (not res!533757) (not e!437978))))

(assert (=> b!787979 (= res!533757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787980 () Bool)

(assert (=> b!787980 (= e!437979 e!437978)))

(declare-fun res!533755 () Bool)

(assert (=> b!787980 (=> (not res!533755) (not e!437978))))

(declare-fun lt!351525 () SeekEntryResult!8103)

(assert (=> b!787980 (= res!533755 (or (= lt!351525 (MissingZero!8103 i!1173)) (= lt!351525 (MissingVacant!8103 i!1173))))))

(assert (=> b!787980 (= lt!351525 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787981 () Bool)

(declare-fun res!533751 () Bool)

(assert (=> b!787981 (=> (not res!533751) (not e!437979))))

(assert (=> b!787981 (= res!533751 (validKeyInArray!0 (select (arr!20503 a!3186) j!159)))))

(declare-fun b!787982 () Bool)

(declare-fun e!437982 () Bool)

(declare-fun e!437984 () Bool)

(assert (=> b!787982 (= e!437982 e!437984)))

(declare-fun res!533768 () Bool)

(assert (=> b!787982 (=> res!533768 e!437984)))

(declare-fun lt!351536 () (_ BitVec 64))

(assert (=> b!787982 (= res!533768 (= lt!351536 lt!351530))))

(assert (=> b!787982 (= lt!351536 (select (store (arr!20503 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787983 () Bool)

(declare-fun res!533763 () Bool)

(assert (=> b!787983 (=> (not res!533763) (not e!437978))))

(declare-datatypes ((List!14505 0))(
  ( (Nil!14502) (Cons!14501 (h!15624 (_ BitVec 64)) (t!20820 List!14505)) )
))
(declare-fun arrayNoDuplicates!0 (array!42830 (_ BitVec 32) List!14505) Bool)

(assert (=> b!787983 (= res!533763 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14502))))

(declare-fun b!787984 () Bool)

(assert (=> b!787984 (= e!437973 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328) (Found!8103 j!159)))))

(declare-fun b!787985 () Bool)

(declare-fun Unit!27303 () Unit!27300)

(assert (=> b!787985 (= e!437976 Unit!27303)))

(declare-fun b!787986 () Bool)

(declare-fun res!533766 () Bool)

(assert (=> b!787986 (=> (not res!533766) (not e!437979))))

(assert (=> b!787986 (= res!533766 (and (= (size!20924 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20924 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20924 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787987 () Bool)

(declare-fun res!533767 () Bool)

(assert (=> b!787987 (=> (not res!533767) (not e!437978))))

(assert (=> b!787987 (= res!533767 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20924 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20924 a!3186))))))

(declare-fun b!787988 () Bool)

(assert (=> b!787988 (= e!437984 true)))

(assert (=> b!787988 e!437977))

(declare-fun res!533752 () Bool)

(assert (=> b!787988 (=> (not res!533752) (not e!437977))))

(assert (=> b!787988 (= res!533752 (= lt!351536 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351533 () Unit!27300)

(assert (=> b!787988 (= lt!351533 e!437976)))

(declare-fun c!87516 () Bool)

(assert (=> b!787988 (= c!87516 (= lt!351536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787989 () Bool)

(assert (=> b!787989 (= e!437983 e!437982)))

(declare-fun res!533753 () Bool)

(assert (=> b!787989 (=> res!533753 e!437982)))

(assert (=> b!787989 (= res!533753 (not (= lt!351535 lt!351534)))))

(assert (=> b!787989 (= lt!351535 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20503 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67790 res!533762) b!787986))

(assert (= (and b!787986 res!533766) b!787981))

(assert (= (and b!787981 res!533751) b!787974))

(assert (= (and b!787974 res!533765) b!787976))

(assert (= (and b!787976 res!533754) b!787980))

(assert (= (and b!787980 res!533755) b!787979))

(assert (= (and b!787979 res!533757) b!787983))

(assert (= (and b!787983 res!533763) b!787987))

(assert (= (and b!787987 res!533767) b!787971))

(assert (= (and b!787971 res!533760) b!787975))

(assert (= (and b!787975 res!533750) b!787968))

(assert (= (and b!787968 c!87517) b!787977))

(assert (= (and b!787968 (not c!87517)) b!787984))

(assert (= (and b!787968 res!533761) b!787969))

(assert (= (and b!787969 res!533759) b!787972))

(assert (= (and b!787972 res!533756) b!787973))

(assert (= (and b!787972 (not res!533764)) b!787989))

(assert (= (and b!787989 (not res!533753)) b!787982))

(assert (= (and b!787982 (not res!533768)) b!787988))

(assert (= (and b!787988 c!87516) b!787970))

(assert (= (and b!787988 (not c!87516)) b!787985))

(assert (= (and b!787988 res!533752) b!787978))

(assert (= (and b!787978 res!533758) b!787967))

(declare-fun m!729417 () Bool)

(assert (=> b!787971 m!729417))

(assert (=> b!787971 m!729417))

(declare-fun m!729419 () Bool)

(assert (=> b!787971 m!729419))

(assert (=> b!787971 m!729419))

(assert (=> b!787971 m!729417))

(declare-fun m!729421 () Bool)

(assert (=> b!787971 m!729421))

(declare-fun m!729423 () Bool)

(assert (=> b!787978 m!729423))

(declare-fun m!729425 () Bool)

(assert (=> b!787978 m!729425))

(assert (=> b!787972 m!729417))

(assert (=> b!787972 m!729417))

(declare-fun m!729427 () Bool)

(assert (=> b!787972 m!729427))

(declare-fun m!729429 () Bool)

(assert (=> b!787972 m!729429))

(declare-fun m!729431 () Bool)

(assert (=> b!787972 m!729431))

(declare-fun m!729433 () Bool)

(assert (=> b!787975 m!729433))

(assert (=> b!787984 m!729417))

(assert (=> b!787984 m!729417))

(declare-fun m!729435 () Bool)

(assert (=> b!787984 m!729435))

(declare-fun m!729437 () Bool)

(assert (=> start!67790 m!729437))

(declare-fun m!729439 () Bool)

(assert (=> start!67790 m!729439))

(declare-fun m!729441 () Bool)

(assert (=> b!787983 m!729441))

(assert (=> b!787989 m!729417))

(assert (=> b!787989 m!729417))

(assert (=> b!787989 m!729435))

(declare-fun m!729443 () Bool)

(assert (=> b!787969 m!729443))

(declare-fun m!729445 () Bool)

(assert (=> b!787969 m!729445))

(assert (=> b!787969 m!729445))

(declare-fun m!729447 () Bool)

(assert (=> b!787969 m!729447))

(declare-fun m!729449 () Bool)

(assert (=> b!787969 m!729449))

(declare-fun m!729451 () Bool)

(assert (=> b!787969 m!729451))

(declare-fun m!729453 () Bool)

(assert (=> b!787976 m!729453))

(assert (=> b!787977 m!729417))

(assert (=> b!787977 m!729417))

(declare-fun m!729455 () Bool)

(assert (=> b!787977 m!729455))

(declare-fun m!729457 () Bool)

(assert (=> b!787974 m!729457))

(assert (=> b!787982 m!729449))

(declare-fun m!729459 () Bool)

(assert (=> b!787982 m!729459))

(declare-fun m!729461 () Bool)

(assert (=> b!787980 m!729461))

(assert (=> b!787973 m!729417))

(assert (=> b!787973 m!729417))

(declare-fun m!729463 () Bool)

(assert (=> b!787973 m!729463))

(declare-fun m!729465 () Bool)

(assert (=> b!787979 m!729465))

(assert (=> b!787981 m!729417))

(assert (=> b!787981 m!729417))

(declare-fun m!729467 () Bool)

(assert (=> b!787981 m!729467))

(check-sat (not b!787976) (not start!67790) (not b!787978) (not b!787969) (not b!787980) (not b!787977) (not b!787989) (not b!787979) (not b!787974) (not b!787981) (not b!787983) (not b!787984) (not b!787971) (not b!787973) (not b!787972))
(check-sat)
