; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65324 () Bool)

(assert start!65324)

(declare-fun b!742055 () Bool)

(declare-fun e!414740 () Bool)

(declare-fun e!414737 () Bool)

(assert (=> b!742055 (= e!414740 e!414737)))

(declare-fun res!499297 () Bool)

(assert (=> b!742055 (=> (not res!499297) (not e!414737))))

(declare-datatypes ((array!41497 0))(
  ( (array!41498 (arr!19862 (Array (_ BitVec 32) (_ BitVec 64))) (size!20283 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41497)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7462 0))(
  ( (MissingZero!7462 (index!32216 (_ BitVec 32))) (Found!7462 (index!32217 (_ BitVec 32))) (Intermediate!7462 (undefined!8274 Bool) (index!32218 (_ BitVec 32)) (x!63188 (_ BitVec 32))) (Undefined!7462) (MissingVacant!7462 (index!32219 (_ BitVec 32))) )
))
(declare-fun lt!329661 () SeekEntryResult!7462)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41497 (_ BitVec 32)) SeekEntryResult!7462)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742055 (= res!499297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19862 a!3186) j!159) mask!3328) (select (arr!19862 a!3186) j!159) a!3186 mask!3328) lt!329661))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742055 (= lt!329661 (Intermediate!7462 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742056 () Bool)

(declare-fun e!414743 () Bool)

(declare-fun lt!329660 () SeekEntryResult!7462)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41497 (_ BitVec 32)) SeekEntryResult!7462)

(assert (=> b!742056 (= e!414743 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19862 a!3186) j!159) a!3186 mask!3328) lt!329660))))

(declare-fun b!742057 () Bool)

(declare-fun res!499303 () Bool)

(declare-fun e!414738 () Bool)

(assert (=> b!742057 (=> (not res!499303) (not e!414738))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742057 (= res!499303 (and (= (size!20283 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20283 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20283 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742058 () Bool)

(declare-fun res!499290 () Bool)

(assert (=> b!742058 (=> (not res!499290) (not e!414737))))

(assert (=> b!742058 (= res!499290 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19862 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742059 () Bool)

(assert (=> b!742059 (= e!414738 e!414740)))

(declare-fun res!499299 () Bool)

(assert (=> b!742059 (=> (not res!499299) (not e!414740))))

(declare-fun lt!329658 () SeekEntryResult!7462)

(assert (=> b!742059 (= res!499299 (or (= lt!329658 (MissingZero!7462 i!1173)) (= lt!329658 (MissingVacant!7462 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41497 (_ BitVec 32)) SeekEntryResult!7462)

(assert (=> b!742059 (= lt!329658 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742061 () Bool)

(declare-fun res!499298 () Bool)

(assert (=> b!742061 (=> (not res!499298) (not e!414737))))

(declare-fun e!414736 () Bool)

(assert (=> b!742061 (= res!499298 e!414736)))

(declare-fun c!81763 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!742061 (= c!81763 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742062 () Bool)

(declare-fun res!499295 () Bool)

(assert (=> b!742062 (=> (not res!499295) (not e!414738))))

(declare-fun arrayContainsKey!0 (array!41497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742062 (= res!499295 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742063 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!742063 (= e!414736 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19862 a!3186) j!159) a!3186 mask!3328) (Found!7462 j!159)))))

(declare-fun b!742064 () Bool)

(declare-fun e!414741 () Bool)

(assert (=> b!742064 (= e!414737 e!414741)))

(declare-fun res!499291 () Bool)

(assert (=> b!742064 (=> (not res!499291) (not e!414741))))

(declare-fun lt!329662 () (_ BitVec 64))

(declare-fun lt!329659 () array!41497)

(assert (=> b!742064 (= res!499291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329662 mask!3328) lt!329662 lt!329659 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329662 lt!329659 mask!3328)))))

(assert (=> b!742064 (= lt!329662 (select (store (arr!19862 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742064 (= lt!329659 (array!41498 (store (arr!19862 a!3186) i!1173 k!2102) (size!20283 a!3186)))))

(declare-fun b!742065 () Bool)

(declare-fun res!499294 () Bool)

(assert (=> b!742065 (=> (not res!499294) (not e!414740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41497 (_ BitVec 32)) Bool)

(assert (=> b!742065 (= res!499294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!499302 () Bool)

(assert (=> start!65324 (=> (not res!499302) (not e!414738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65324 (= res!499302 (validMask!0 mask!3328))))

(assert (=> start!65324 e!414738))

(assert (=> start!65324 true))

(declare-fun array_inv!15658 (array!41497) Bool)

(assert (=> start!65324 (array_inv!15658 a!3186)))

(declare-fun b!742060 () Bool)

(declare-fun res!499301 () Bool)

(assert (=> b!742060 (=> (not res!499301) (not e!414740))))

(declare-datatypes ((List!13864 0))(
  ( (Nil!13861) (Cons!13860 (h!14932 (_ BitVec 64)) (t!20179 List!13864)) )
))
(declare-fun arrayNoDuplicates!0 (array!41497 (_ BitVec 32) List!13864) Bool)

(assert (=> b!742060 (= res!499301 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13861))))

(declare-fun b!742066 () Bool)

(declare-fun res!499304 () Bool)

(assert (=> b!742066 (=> (not res!499304) (not e!414738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742066 (= res!499304 (validKeyInArray!0 k!2102))))

(declare-fun b!742067 () Bool)

(declare-fun res!499300 () Bool)

(assert (=> b!742067 (=> (not res!499300) (not e!414740))))

(assert (=> b!742067 (= res!499300 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20283 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20283 a!3186))))))

(declare-fun b!742068 () Bool)

(assert (=> b!742068 (= e!414741 (not true))))

(declare-fun e!414739 () Bool)

(assert (=> b!742068 e!414739))

(declare-fun res!499293 () Bool)

(assert (=> b!742068 (=> (not res!499293) (not e!414739))))

(assert (=> b!742068 (= res!499293 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25404 0))(
  ( (Unit!25405) )
))
(declare-fun lt!329663 () Unit!25404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25404)

(assert (=> b!742068 (= lt!329663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742069 () Bool)

(declare-fun res!499292 () Bool)

(assert (=> b!742069 (=> (not res!499292) (not e!414738))))

(assert (=> b!742069 (= res!499292 (validKeyInArray!0 (select (arr!19862 a!3186) j!159)))))

(declare-fun b!742070 () Bool)

(assert (=> b!742070 (= e!414736 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19862 a!3186) j!159) a!3186 mask!3328) lt!329661))))

(declare-fun b!742071 () Bool)

(assert (=> b!742071 (= e!414739 e!414743)))

(declare-fun res!499296 () Bool)

(assert (=> b!742071 (=> (not res!499296) (not e!414743))))

(assert (=> b!742071 (= res!499296 (= (seekEntryOrOpen!0 (select (arr!19862 a!3186) j!159) a!3186 mask!3328) lt!329660))))

(assert (=> b!742071 (= lt!329660 (Found!7462 j!159))))

(assert (= (and start!65324 res!499302) b!742057))

(assert (= (and b!742057 res!499303) b!742069))

(assert (= (and b!742069 res!499292) b!742066))

(assert (= (and b!742066 res!499304) b!742062))

(assert (= (and b!742062 res!499295) b!742059))

(assert (= (and b!742059 res!499299) b!742065))

(assert (= (and b!742065 res!499294) b!742060))

(assert (= (and b!742060 res!499301) b!742067))

(assert (= (and b!742067 res!499300) b!742055))

(assert (= (and b!742055 res!499297) b!742058))

(assert (= (and b!742058 res!499290) b!742061))

(assert (= (and b!742061 c!81763) b!742070))

(assert (= (and b!742061 (not c!81763)) b!742063))

(assert (= (and b!742061 res!499298) b!742064))

(assert (= (and b!742064 res!499291) b!742068))

(assert (= (and b!742068 res!499293) b!742071))

(assert (= (and b!742071 res!499296) b!742056))

(declare-fun m!692967 () Bool)

(assert (=> b!742062 m!692967))

(declare-fun m!692969 () Bool)

(assert (=> b!742063 m!692969))

(assert (=> b!742063 m!692969))

(declare-fun m!692971 () Bool)

(assert (=> b!742063 m!692971))

(assert (=> b!742069 m!692969))

(assert (=> b!742069 m!692969))

(declare-fun m!692973 () Bool)

(assert (=> b!742069 m!692973))

(declare-fun m!692975 () Bool)

(assert (=> b!742065 m!692975))

(assert (=> b!742056 m!692969))

(assert (=> b!742056 m!692969))

(declare-fun m!692977 () Bool)

(assert (=> b!742056 m!692977))

(assert (=> b!742055 m!692969))

(assert (=> b!742055 m!692969))

(declare-fun m!692979 () Bool)

(assert (=> b!742055 m!692979))

(assert (=> b!742055 m!692979))

(assert (=> b!742055 m!692969))

(declare-fun m!692981 () Bool)

(assert (=> b!742055 m!692981))

(declare-fun m!692983 () Bool)

(assert (=> b!742059 m!692983))

(declare-fun m!692985 () Bool)

(assert (=> b!742064 m!692985))

(declare-fun m!692987 () Bool)

(assert (=> b!742064 m!692987))

(assert (=> b!742064 m!692985))

(declare-fun m!692989 () Bool)

(assert (=> b!742064 m!692989))

(declare-fun m!692991 () Bool)

(assert (=> b!742064 m!692991))

(declare-fun m!692993 () Bool)

(assert (=> b!742064 m!692993))

(assert (=> b!742070 m!692969))

(assert (=> b!742070 m!692969))

(declare-fun m!692995 () Bool)

(assert (=> b!742070 m!692995))

(declare-fun m!692997 () Bool)

(assert (=> b!742060 m!692997))

(assert (=> b!742071 m!692969))

(assert (=> b!742071 m!692969))

(declare-fun m!692999 () Bool)

(assert (=> b!742071 m!692999))

(declare-fun m!693001 () Bool)

(assert (=> start!65324 m!693001))

(declare-fun m!693003 () Bool)

(assert (=> start!65324 m!693003))

(declare-fun m!693005 () Bool)

(assert (=> b!742066 m!693005))

(declare-fun m!693007 () Bool)

(assert (=> b!742068 m!693007))

(declare-fun m!693009 () Bool)

(assert (=> b!742068 m!693009))

(declare-fun m!693011 () Bool)

(assert (=> b!742058 m!693011))

(push 1)

