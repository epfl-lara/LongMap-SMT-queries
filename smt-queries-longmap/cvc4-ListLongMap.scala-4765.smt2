; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65654 () Bool)

(assert start!65654)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41827 0))(
  ( (array!41828 (arr!20027 (Array (_ BitVec 32) (_ BitVec 64))) (size!20448 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41827)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7627 0))(
  ( (MissingZero!7627 (index!32876 (_ BitVec 32))) (Found!7627 (index!32877 (_ BitVec 32))) (Intermediate!7627 (undefined!8439 Bool) (index!32878 (_ BitVec 32)) (x!63793 (_ BitVec 32))) (Undefined!7627) (MissingVacant!7627 (index!32879 (_ BitVec 32))) )
))
(declare-fun lt!334463 () SeekEntryResult!7627)

(declare-fun e!419470 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!751976 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41827 (_ BitVec 32)) SeekEntryResult!7627)

(assert (=> b!751976 (= e!419470 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20027 a!3186) j!159) a!3186 mask!3328) lt!334463))))

(declare-fun b!751977 () Bool)

(declare-datatypes ((Unit!25888 0))(
  ( (Unit!25889) )
))
(declare-fun e!419467 () Unit!25888)

(declare-fun Unit!25890 () Unit!25888)

(assert (=> b!751977 (= e!419467 Unit!25890)))

(assert (=> b!751977 false))

(declare-fun b!751978 () Bool)

(declare-fun res!507773 () Bool)

(declare-fun e!419469 () Bool)

(assert (=> b!751978 (=> (not res!507773) (not e!419469))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751978 (= res!507773 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!419472 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!751979 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!751979 (= e!419472 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20027 a!3186) j!159) a!3186 mask!3328) (Found!7627 j!159)))))

(declare-fun b!751980 () Bool)

(declare-fun Unit!25891 () Unit!25888)

(assert (=> b!751980 (= e!419467 Unit!25891)))

(declare-fun b!751981 () Bool)

(declare-fun e!419473 () Bool)

(assert (=> b!751981 (= e!419469 e!419473)))

(declare-fun res!507759 () Bool)

(assert (=> b!751981 (=> (not res!507759) (not e!419473))))

(declare-fun lt!334469 () SeekEntryResult!7627)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751981 (= res!507759 (or (= lt!334469 (MissingZero!7627 i!1173)) (= lt!334469 (MissingVacant!7627 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41827 (_ BitVec 32)) SeekEntryResult!7627)

(assert (=> b!751981 (= lt!334469 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!751983 () Bool)

(declare-fun res!507764 () Bool)

(assert (=> b!751983 (=> (not res!507764) (not e!419473))))

(declare-datatypes ((List!14029 0))(
  ( (Nil!14026) (Cons!14025 (h!15097 (_ BitVec 64)) (t!20344 List!14029)) )
))
(declare-fun arrayNoDuplicates!0 (array!41827 (_ BitVec 32) List!14029) Bool)

(assert (=> b!751983 (= res!507764 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14026))))

(declare-fun b!751984 () Bool)

(declare-fun e!419468 () Bool)

(assert (=> b!751984 (= e!419468 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun e!419475 () Bool)

(assert (=> b!751984 e!419475))

(declare-fun res!507769 () Bool)

(assert (=> b!751984 (=> (not res!507769) (not e!419475))))

(declare-fun lt!334460 () (_ BitVec 64))

(assert (=> b!751984 (= res!507769 (= lt!334460 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334458 () Unit!25888)

(assert (=> b!751984 (= lt!334458 e!419467)))

(declare-fun c!82491 () Bool)

(assert (=> b!751984 (= c!82491 (= lt!334460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751985 () Bool)

(declare-fun e!419476 () Bool)

(assert (=> b!751985 (= e!419476 e!419468)))

(declare-fun res!507766 () Bool)

(assert (=> b!751985 (=> res!507766 e!419468)))

(declare-fun lt!334467 () (_ BitVec 64))

(assert (=> b!751985 (= res!507766 (= lt!334460 lt!334467))))

(assert (=> b!751985 (= lt!334460 (select (store (arr!20027 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!751986 () Bool)

(declare-fun res!507758 () Bool)

(declare-fun e!419477 () Bool)

(assert (=> b!751986 (=> (not res!507758) (not e!419477))))

(assert (=> b!751986 (= res!507758 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20027 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751987 () Bool)

(declare-fun e!419466 () Bool)

(declare-fun e!419474 () Bool)

(assert (=> b!751987 (= e!419466 (not e!419474))))

(declare-fun res!507770 () Bool)

(assert (=> b!751987 (=> res!507770 e!419474)))

(declare-fun lt!334462 () SeekEntryResult!7627)

(assert (=> b!751987 (= res!507770 (or (not (is-Intermediate!7627 lt!334462)) (bvslt x!1131 (x!63793 lt!334462)) (not (= x!1131 (x!63793 lt!334462))) (not (= index!1321 (index!32878 lt!334462)))))))

(assert (=> b!751987 e!419470))

(declare-fun res!507763 () Bool)

(assert (=> b!751987 (=> (not res!507763) (not e!419470))))

(declare-fun lt!334465 () SeekEntryResult!7627)

(assert (=> b!751987 (= res!507763 (= lt!334465 lt!334463))))

(assert (=> b!751987 (= lt!334463 (Found!7627 j!159))))

(assert (=> b!751987 (= lt!334465 (seekEntryOrOpen!0 (select (arr!20027 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41827 (_ BitVec 32)) Bool)

(assert (=> b!751987 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334461 () Unit!25888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25888)

(assert (=> b!751987 (= lt!334461 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751988 () Bool)

(declare-fun res!507762 () Bool)

(assert (=> b!751988 (=> (not res!507762) (not e!419477))))

(assert (=> b!751988 (= res!507762 e!419472)))

(declare-fun c!82492 () Bool)

(assert (=> b!751988 (= c!82492 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!334459 () SeekEntryResult!7627)

(declare-fun b!751989 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41827 (_ BitVec 32)) SeekEntryResult!7627)

(assert (=> b!751989 (= e!419472 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20027 a!3186) j!159) a!3186 mask!3328) lt!334459))))

(declare-fun b!751990 () Bool)

(assert (=> b!751990 (= e!419477 e!419466)))

(declare-fun res!507768 () Bool)

(assert (=> b!751990 (=> (not res!507768) (not e!419466))))

(declare-fun lt!334468 () SeekEntryResult!7627)

(assert (=> b!751990 (= res!507768 (= lt!334468 lt!334462))))

(declare-fun lt!334466 () array!41827)

(assert (=> b!751990 (= lt!334462 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334467 lt!334466 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751990 (= lt!334468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334467 mask!3328) lt!334467 lt!334466 mask!3328))))

(assert (=> b!751990 (= lt!334467 (select (store (arr!20027 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751990 (= lt!334466 (array!41828 (store (arr!20027 a!3186) i!1173 k!2102) (size!20448 a!3186)))))

(declare-fun b!751991 () Bool)

(declare-fun res!507761 () Bool)

(assert (=> b!751991 (=> (not res!507761) (not e!419469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751991 (= res!507761 (validKeyInArray!0 (select (arr!20027 a!3186) j!159)))))

(declare-fun b!751992 () Bool)

(declare-fun res!507767 () Bool)

(assert (=> b!751992 (=> (not res!507767) (not e!419469))))

(assert (=> b!751992 (= res!507767 (validKeyInArray!0 k!2102))))

(declare-fun b!751993 () Bool)

(declare-fun res!507771 () Bool)

(assert (=> b!751993 (=> (not res!507771) (not e!419473))))

(assert (=> b!751993 (= res!507771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751994 () Bool)

(assert (=> b!751994 (= e!419474 e!419476)))

(declare-fun res!507757 () Bool)

(assert (=> b!751994 (=> res!507757 e!419476)))

(declare-fun lt!334464 () SeekEntryResult!7627)

(assert (=> b!751994 (= res!507757 (not (= lt!334464 lt!334463)))))

(assert (=> b!751994 (= lt!334464 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20027 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!751995 () Bool)

(declare-fun res!507760 () Bool)

(assert (=> b!751995 (=> (not res!507760) (not e!419473))))

(assert (=> b!751995 (= res!507760 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20448 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20448 a!3186))))))

(declare-fun b!751996 () Bool)

(declare-fun res!507772 () Bool)

(assert (=> b!751996 (=> (not res!507772) (not e!419469))))

(assert (=> b!751996 (= res!507772 (and (= (size!20448 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20448 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20448 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751997 () Bool)

(declare-fun res!507765 () Bool)

(assert (=> b!751997 (=> (not res!507765) (not e!419475))))

(assert (=> b!751997 (= res!507765 (= (seekEntryOrOpen!0 lt!334467 lt!334466 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334467 lt!334466 mask!3328)))))

(declare-fun b!751998 () Bool)

(assert (=> b!751998 (= e!419473 e!419477)))

(declare-fun res!507756 () Bool)

(assert (=> b!751998 (=> (not res!507756) (not e!419477))))

(assert (=> b!751998 (= res!507756 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20027 a!3186) j!159) mask!3328) (select (arr!20027 a!3186) j!159) a!3186 mask!3328) lt!334459))))

(assert (=> b!751998 (= lt!334459 (Intermediate!7627 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751982 () Bool)

(assert (=> b!751982 (= e!419475 (= lt!334465 lt!334464))))

(declare-fun res!507755 () Bool)

(assert (=> start!65654 (=> (not res!507755) (not e!419469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65654 (= res!507755 (validMask!0 mask!3328))))

(assert (=> start!65654 e!419469))

(assert (=> start!65654 true))

(declare-fun array_inv!15823 (array!41827) Bool)

(assert (=> start!65654 (array_inv!15823 a!3186)))

(assert (= (and start!65654 res!507755) b!751996))

(assert (= (and b!751996 res!507772) b!751991))

(assert (= (and b!751991 res!507761) b!751992))

(assert (= (and b!751992 res!507767) b!751978))

(assert (= (and b!751978 res!507773) b!751981))

(assert (= (and b!751981 res!507759) b!751993))

(assert (= (and b!751993 res!507771) b!751983))

(assert (= (and b!751983 res!507764) b!751995))

(assert (= (and b!751995 res!507760) b!751998))

(assert (= (and b!751998 res!507756) b!751986))

(assert (= (and b!751986 res!507758) b!751988))

(assert (= (and b!751988 c!82492) b!751989))

(assert (= (and b!751988 (not c!82492)) b!751979))

(assert (= (and b!751988 res!507762) b!751990))

(assert (= (and b!751990 res!507768) b!751987))

(assert (= (and b!751987 res!507763) b!751976))

(assert (= (and b!751987 (not res!507770)) b!751994))

(assert (= (and b!751994 (not res!507757)) b!751985))

(assert (= (and b!751985 (not res!507766)) b!751984))

(assert (= (and b!751984 c!82491) b!751977))

(assert (= (and b!751984 (not c!82491)) b!751980))

(assert (= (and b!751984 res!507769) b!751997))

(assert (= (and b!751997 res!507765) b!751982))

(declare-fun m!701031 () Bool)

(assert (=> b!751981 m!701031))

(declare-fun m!701033 () Bool)

(assert (=> b!751992 m!701033))

(declare-fun m!701035 () Bool)

(assert (=> b!751979 m!701035))

(assert (=> b!751979 m!701035))

(declare-fun m!701037 () Bool)

(assert (=> b!751979 m!701037))

(assert (=> b!751976 m!701035))

(assert (=> b!751976 m!701035))

(declare-fun m!701039 () Bool)

(assert (=> b!751976 m!701039))

(declare-fun m!701041 () Bool)

(assert (=> b!751978 m!701041))

(assert (=> b!751989 m!701035))

(assert (=> b!751989 m!701035))

(declare-fun m!701043 () Bool)

(assert (=> b!751989 m!701043))

(declare-fun m!701045 () Bool)

(assert (=> b!751983 m!701045))

(assert (=> b!751987 m!701035))

(assert (=> b!751987 m!701035))

(declare-fun m!701047 () Bool)

(assert (=> b!751987 m!701047))

(declare-fun m!701049 () Bool)

(assert (=> b!751987 m!701049))

(declare-fun m!701051 () Bool)

(assert (=> b!751987 m!701051))

(declare-fun m!701053 () Bool)

(assert (=> b!751986 m!701053))

(assert (=> b!751994 m!701035))

(assert (=> b!751994 m!701035))

(assert (=> b!751994 m!701037))

(assert (=> b!751998 m!701035))

(assert (=> b!751998 m!701035))

(declare-fun m!701055 () Bool)

(assert (=> b!751998 m!701055))

(assert (=> b!751998 m!701055))

(assert (=> b!751998 m!701035))

(declare-fun m!701057 () Bool)

(assert (=> b!751998 m!701057))

(declare-fun m!701059 () Bool)

(assert (=> b!751985 m!701059))

(declare-fun m!701061 () Bool)

(assert (=> b!751985 m!701061))

(assert (=> b!751991 m!701035))

(assert (=> b!751991 m!701035))

(declare-fun m!701063 () Bool)

(assert (=> b!751991 m!701063))

(declare-fun m!701065 () Bool)

(assert (=> b!751993 m!701065))

(declare-fun m!701067 () Bool)

(assert (=> b!751990 m!701067))

(assert (=> b!751990 m!701067))

(declare-fun m!701069 () Bool)

(assert (=> b!751990 m!701069))

(assert (=> b!751990 m!701059))

(declare-fun m!701071 () Bool)

(assert (=> b!751990 m!701071))

(declare-fun m!701073 () Bool)

(assert (=> b!751990 m!701073))

(declare-fun m!701075 () Bool)

(assert (=> start!65654 m!701075))

(declare-fun m!701077 () Bool)

(assert (=> start!65654 m!701077))

(declare-fun m!701079 () Bool)

(assert (=> b!751997 m!701079))

(declare-fun m!701081 () Bool)

(assert (=> b!751997 m!701081))

(push 1)

