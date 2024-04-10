; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64932 () Bool)

(assert start!64932)

(declare-fun b!732981 () Bool)

(declare-fun e!410145 () Bool)

(declare-fun e!410141 () Bool)

(assert (=> b!732981 (= e!410145 e!410141)))

(declare-fun res!492522 () Bool)

(assert (=> b!732981 (=> (not res!492522) (not e!410141))))

(declare-datatypes ((array!41243 0))(
  ( (array!41244 (arr!19738 (Array (_ BitVec 32) (_ BitVec 64))) (size!20159 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41243)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7338 0))(
  ( (MissingZero!7338 (index!31720 (_ BitVec 32))) (Found!7338 (index!31721 (_ BitVec 32))) (Intermediate!7338 (undefined!8150 Bool) (index!31722 (_ BitVec 32)) (x!62712 (_ BitVec 32))) (Undefined!7338) (MissingVacant!7338 (index!31723 (_ BitVec 32))) )
))
(declare-fun lt!324848 () SeekEntryResult!7338)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41243 (_ BitVec 32)) SeekEntryResult!7338)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732981 (= res!492522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19738 a!3186) j!159) mask!3328) (select (arr!19738 a!3186) j!159) a!3186 mask!3328) lt!324848))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732981 (= lt!324848 (Intermediate!7338 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732982 () Bool)

(declare-fun lt!324855 () SeekEntryResult!7338)

(declare-fun e!410143 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41243 (_ BitVec 32)) SeekEntryResult!7338)

(assert (=> b!732982 (= e!410143 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19738 a!3186) j!159) a!3186 mask!3328) lt!324855))))

(declare-fun b!732983 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!410149 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!732983 (= e!410149 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19738 a!3186) j!159) a!3186 mask!3328) (Found!7338 j!159)))))

(declare-fun b!732985 () Bool)

(declare-fun res!492525 () Bool)

(declare-fun e!410146 () Bool)

(assert (=> b!732985 (=> (not res!492525) (not e!410146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732985 (= res!492525 (validKeyInArray!0 (select (arr!19738 a!3186) j!159)))))

(declare-fun b!732986 () Bool)

(declare-fun res!492514 () Bool)

(assert (=> b!732986 (=> (not res!492514) (not e!410141))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732986 (= res!492514 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19738 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732987 () Bool)

(declare-fun res!492515 () Bool)

(assert (=> b!732987 (=> (not res!492515) (not e!410146))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!732987 (= res!492515 (validKeyInArray!0 k0!2102))))

(declare-fun b!732988 () Bool)

(declare-fun res!492517 () Bool)

(assert (=> b!732988 (=> (not res!492517) (not e!410145))))

(declare-datatypes ((List!13740 0))(
  ( (Nil!13737) (Cons!13736 (h!14802 (_ BitVec 64)) (t!20055 List!13740)) )
))
(declare-fun arrayNoDuplicates!0 (array!41243 (_ BitVec 32) List!13740) Bool)

(assert (=> b!732988 (= res!492517 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13737))))

(declare-fun b!732989 () Bool)

(assert (=> b!732989 (= e!410149 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19738 a!3186) j!159) a!3186 mask!3328) lt!324848))))

(declare-fun b!732990 () Bool)

(declare-fun e!410144 () Bool)

(declare-fun e!410148 () Bool)

(assert (=> b!732990 (= e!410144 (not e!410148))))

(declare-fun res!492530 () Bool)

(assert (=> b!732990 (=> res!492530 e!410148)))

(declare-fun lt!324849 () SeekEntryResult!7338)

(get-info :version)

(assert (=> b!732990 (= res!492530 (or (not ((_ is Intermediate!7338) lt!324849)) (bvsge x!1131 (x!62712 lt!324849))))))

(declare-fun e!410150 () Bool)

(assert (=> b!732990 e!410150))

(declare-fun res!492527 () Bool)

(assert (=> b!732990 (=> (not res!492527) (not e!410150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41243 (_ BitVec 32)) Bool)

(assert (=> b!732990 (= res!492527 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24994 0))(
  ( (Unit!24995) )
))
(declare-fun lt!324853 () Unit!24994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24994)

(assert (=> b!732990 (= lt!324853 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732991 () Bool)

(declare-fun res!492519 () Bool)

(assert (=> b!732991 (=> (not res!492519) (not e!410146))))

(declare-fun arrayContainsKey!0 (array!41243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732991 (= res!492519 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732992 () Bool)

(declare-fun res!492528 () Bool)

(assert (=> b!732992 (=> (not res!492528) (not e!410145))))

(assert (=> b!732992 (= res!492528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732993 () Bool)

(declare-fun res!492524 () Bool)

(assert (=> b!732993 (=> (not res!492524) (not e!410146))))

(assert (=> b!732993 (= res!492524 (and (= (size!20159 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20159 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20159 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732994 () Bool)

(declare-fun e!410142 () Bool)

(assert (=> b!732994 (= e!410142 true)))

(declare-fun lt!324850 () SeekEntryResult!7338)

(assert (=> b!732994 (= lt!324850 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19738 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732995 () Bool)

(declare-fun res!492516 () Bool)

(assert (=> b!732995 (=> (not res!492516) (not e!410141))))

(assert (=> b!732995 (= res!492516 e!410149)))

(declare-fun c!80611 () Bool)

(assert (=> b!732995 (= c!80611 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!492518 () Bool)

(assert (=> start!64932 (=> (not res!492518) (not e!410146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64932 (= res!492518 (validMask!0 mask!3328))))

(assert (=> start!64932 e!410146))

(assert (=> start!64932 true))

(declare-fun array_inv!15534 (array!41243) Bool)

(assert (=> start!64932 (array_inv!15534 a!3186)))

(declare-fun b!732984 () Bool)

(assert (=> b!732984 (= e!410148 e!410142)))

(declare-fun res!492521 () Bool)

(assert (=> b!732984 (=> res!492521 e!410142)))

(assert (=> b!732984 (= res!492521 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324851 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732984 (= lt!324851 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732996 () Bool)

(declare-fun res!492529 () Bool)

(assert (=> b!732996 (=> (not res!492529) (not e!410145))))

(assert (=> b!732996 (= res!492529 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20159 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20159 a!3186))))))

(declare-fun b!732997 () Bool)

(assert (=> b!732997 (= e!410146 e!410145)))

(declare-fun res!492526 () Bool)

(assert (=> b!732997 (=> (not res!492526) (not e!410145))))

(declare-fun lt!324852 () SeekEntryResult!7338)

(assert (=> b!732997 (= res!492526 (or (= lt!324852 (MissingZero!7338 i!1173)) (= lt!324852 (MissingVacant!7338 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41243 (_ BitVec 32)) SeekEntryResult!7338)

(assert (=> b!732997 (= lt!324852 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!732998 () Bool)

(assert (=> b!732998 (= e!410141 e!410144)))

(declare-fun res!492520 () Bool)

(assert (=> b!732998 (=> (not res!492520) (not e!410144))))

(declare-fun lt!324857 () SeekEntryResult!7338)

(assert (=> b!732998 (= res!492520 (= lt!324857 lt!324849))))

(declare-fun lt!324854 () array!41243)

(declare-fun lt!324856 () (_ BitVec 64))

(assert (=> b!732998 (= lt!324849 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324856 lt!324854 mask!3328))))

(assert (=> b!732998 (= lt!324857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324856 mask!3328) lt!324856 lt!324854 mask!3328))))

(assert (=> b!732998 (= lt!324856 (select (store (arr!19738 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732998 (= lt!324854 (array!41244 (store (arr!19738 a!3186) i!1173 k0!2102) (size!20159 a!3186)))))

(declare-fun b!732999 () Bool)

(assert (=> b!732999 (= e!410150 e!410143)))

(declare-fun res!492523 () Bool)

(assert (=> b!732999 (=> (not res!492523) (not e!410143))))

(assert (=> b!732999 (= res!492523 (= (seekEntryOrOpen!0 (select (arr!19738 a!3186) j!159) a!3186 mask!3328) lt!324855))))

(assert (=> b!732999 (= lt!324855 (Found!7338 j!159))))

(assert (= (and start!64932 res!492518) b!732993))

(assert (= (and b!732993 res!492524) b!732985))

(assert (= (and b!732985 res!492525) b!732987))

(assert (= (and b!732987 res!492515) b!732991))

(assert (= (and b!732991 res!492519) b!732997))

(assert (= (and b!732997 res!492526) b!732992))

(assert (= (and b!732992 res!492528) b!732988))

(assert (= (and b!732988 res!492517) b!732996))

(assert (= (and b!732996 res!492529) b!732981))

(assert (= (and b!732981 res!492522) b!732986))

(assert (= (and b!732986 res!492514) b!732995))

(assert (= (and b!732995 c!80611) b!732989))

(assert (= (and b!732995 (not c!80611)) b!732983))

(assert (= (and b!732995 res!492516) b!732998))

(assert (= (and b!732998 res!492520) b!732990))

(assert (= (and b!732990 res!492527) b!732999))

(assert (= (and b!732999 res!492523) b!732982))

(assert (= (and b!732990 (not res!492530)) b!732984))

(assert (= (and b!732984 (not res!492521)) b!732994))

(declare-fun m!685951 () Bool)

(assert (=> b!732989 m!685951))

(assert (=> b!732989 m!685951))

(declare-fun m!685953 () Bool)

(assert (=> b!732989 m!685953))

(declare-fun m!685955 () Bool)

(assert (=> b!732986 m!685955))

(declare-fun m!685957 () Bool)

(assert (=> b!732991 m!685957))

(declare-fun m!685959 () Bool)

(assert (=> b!732990 m!685959))

(declare-fun m!685961 () Bool)

(assert (=> b!732990 m!685961))

(declare-fun m!685963 () Bool)

(assert (=> b!732992 m!685963))

(assert (=> b!732982 m!685951))

(assert (=> b!732982 m!685951))

(declare-fun m!685965 () Bool)

(assert (=> b!732982 m!685965))

(declare-fun m!685967 () Bool)

(assert (=> b!732997 m!685967))

(assert (=> b!732985 m!685951))

(assert (=> b!732985 m!685951))

(declare-fun m!685969 () Bool)

(assert (=> b!732985 m!685969))

(assert (=> b!732983 m!685951))

(assert (=> b!732983 m!685951))

(declare-fun m!685971 () Bool)

(assert (=> b!732983 m!685971))

(assert (=> b!732981 m!685951))

(assert (=> b!732981 m!685951))

(declare-fun m!685973 () Bool)

(assert (=> b!732981 m!685973))

(assert (=> b!732981 m!685973))

(assert (=> b!732981 m!685951))

(declare-fun m!685975 () Bool)

(assert (=> b!732981 m!685975))

(declare-fun m!685977 () Bool)

(assert (=> start!64932 m!685977))

(declare-fun m!685979 () Bool)

(assert (=> start!64932 m!685979))

(declare-fun m!685981 () Bool)

(assert (=> b!732987 m!685981))

(assert (=> b!732999 m!685951))

(assert (=> b!732999 m!685951))

(declare-fun m!685983 () Bool)

(assert (=> b!732999 m!685983))

(declare-fun m!685985 () Bool)

(assert (=> b!732998 m!685985))

(declare-fun m!685987 () Bool)

(assert (=> b!732998 m!685987))

(assert (=> b!732998 m!685985))

(declare-fun m!685989 () Bool)

(assert (=> b!732998 m!685989))

(declare-fun m!685991 () Bool)

(assert (=> b!732998 m!685991))

(declare-fun m!685993 () Bool)

(assert (=> b!732998 m!685993))

(declare-fun m!685995 () Bool)

(assert (=> b!732984 m!685995))

(declare-fun m!685997 () Bool)

(assert (=> b!732988 m!685997))

(assert (=> b!732994 m!685951))

(assert (=> b!732994 m!685951))

(assert (=> b!732994 m!685971))

(check-sat (not b!732988) (not b!732990) (not b!732985) (not b!732981) (not b!732989) (not b!732997) (not start!64932) (not b!732992) (not b!732994) (not b!732983) (not b!732999) (not b!732991) (not b!732984) (not b!732987) (not b!732982) (not b!732998))
(check-sat)
