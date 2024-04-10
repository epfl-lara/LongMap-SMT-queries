; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67150 () Bool)

(assert start!67150)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42505 0))(
  ( (array!42506 (arr!20348 (Array (_ BitVec 32) (_ BitVec 64))) (size!20769 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42505)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7948 0))(
  ( (MissingZero!7948 (index!34160 (_ BitVec 32))) (Found!7948 (index!34161 (_ BitVec 32))) (Intermediate!7948 (undefined!8760 Bool) (index!34162 (_ BitVec 32)) (x!65099 (_ BitVec 32))) (Undefined!7948) (MissingVacant!7948 (index!34163 (_ BitVec 32))) )
))
(declare-fun lt!345734 () SeekEntryResult!7948)

(declare-fun e!431874 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!776056 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42505 (_ BitVec 32)) SeekEntryResult!7948)

(assert (=> b!776056 (= e!431874 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20348 a!3186) j!159) a!3186 mask!3328) lt!345734))))

(declare-fun b!776057 () Bool)

(declare-fun e!431876 () Bool)

(declare-fun e!431882 () Bool)

(assert (=> b!776057 (= e!431876 e!431882)))

(declare-fun res!524903 () Bool)

(assert (=> b!776057 (=> (not res!524903) (not e!431882))))

(declare-fun lt!345733 () SeekEntryResult!7948)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776057 (= res!524903 (or (= lt!345733 (MissingZero!7948 i!1173)) (= lt!345733 (MissingVacant!7948 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42505 (_ BitVec 32)) SeekEntryResult!7948)

(assert (=> b!776057 (= lt!345733 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776058 () Bool)

(declare-fun res!524913 () Bool)

(declare-fun e!431875 () Bool)

(assert (=> b!776058 (=> (not res!524913) (not e!431875))))

(declare-fun e!431880 () Bool)

(assert (=> b!776058 (= res!524913 e!431880)))

(declare-fun c!85978 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!776058 (= c!85978 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776059 () Bool)

(declare-fun e!431879 () Bool)

(declare-fun e!431881 () Bool)

(assert (=> b!776059 (= e!431879 (not e!431881))))

(declare-fun res!524905 () Bool)

(assert (=> b!776059 (=> res!524905 e!431881)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!345735 () SeekEntryResult!7948)

(assert (=> b!776059 (= res!524905 (or (not (is-Intermediate!7948 lt!345735)) (bvslt x!1131 (x!65099 lt!345735)) (not (= x!1131 (x!65099 lt!345735))) (not (= index!1321 (index!34162 lt!345735)))))))

(declare-fun e!431877 () Bool)

(assert (=> b!776059 e!431877))

(declare-fun res!524910 () Bool)

(assert (=> b!776059 (=> (not res!524910) (not e!431877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42505 (_ BitVec 32)) Bool)

(assert (=> b!776059 (= res!524910 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26790 0))(
  ( (Unit!26791) )
))
(declare-fun lt!345736 () Unit!26790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26790)

(assert (=> b!776059 (= lt!345736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776060 () Bool)

(assert (=> b!776060 (= e!431877 e!431874)))

(declare-fun res!524909 () Bool)

(assert (=> b!776060 (=> (not res!524909) (not e!431874))))

(assert (=> b!776060 (= res!524909 (= (seekEntryOrOpen!0 (select (arr!20348 a!3186) j!159) a!3186 mask!3328) lt!345734))))

(assert (=> b!776060 (= lt!345734 (Found!7948 j!159))))

(declare-fun b!776061 () Bool)

(declare-fun res!524902 () Bool)

(assert (=> b!776061 (=> (not res!524902) (not e!431882))))

(declare-datatypes ((List!14350 0))(
  ( (Nil!14347) (Cons!14346 (h!15454 (_ BitVec 64)) (t!20665 List!14350)) )
))
(declare-fun arrayNoDuplicates!0 (array!42505 (_ BitVec 32) List!14350) Bool)

(assert (=> b!776061 (= res!524902 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14347))))

(declare-fun b!776062 () Bool)

(assert (=> b!776062 (= e!431882 e!431875)))

(declare-fun res!524900 () Bool)

(assert (=> b!776062 (=> (not res!524900) (not e!431875))))

(declare-fun lt!345729 () SeekEntryResult!7948)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42505 (_ BitVec 32)) SeekEntryResult!7948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776062 (= res!524900 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20348 a!3186) j!159) mask!3328) (select (arr!20348 a!3186) j!159) a!3186 mask!3328) lt!345729))))

(assert (=> b!776062 (= lt!345729 (Intermediate!7948 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776063 () Bool)

(assert (=> b!776063 (= e!431881 true)))

(declare-fun lt!345730 () SeekEntryResult!7948)

(assert (=> b!776063 (= lt!345730 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20348 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!524901 () Bool)

(assert (=> start!67150 (=> (not res!524901) (not e!431876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67150 (= res!524901 (validMask!0 mask!3328))))

(assert (=> start!67150 e!431876))

(assert (=> start!67150 true))

(declare-fun array_inv!16144 (array!42505) Bool)

(assert (=> start!67150 (array_inv!16144 a!3186)))

(declare-fun b!776064 () Bool)

(assert (=> b!776064 (= e!431880 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20348 a!3186) j!159) a!3186 mask!3328) (Found!7948 j!159)))))

(declare-fun b!776065 () Bool)

(declare-fun res!524912 () Bool)

(assert (=> b!776065 (=> (not res!524912) (not e!431876))))

(assert (=> b!776065 (= res!524912 (and (= (size!20769 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20769 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20769 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776066 () Bool)

(declare-fun res!524915 () Bool)

(assert (=> b!776066 (=> (not res!524915) (not e!431882))))

(assert (=> b!776066 (= res!524915 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20769 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20769 a!3186))))))

(declare-fun b!776067 () Bool)

(declare-fun res!524907 () Bool)

(assert (=> b!776067 (=> (not res!524907) (not e!431876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776067 (= res!524907 (validKeyInArray!0 k!2102))))

(declare-fun b!776068 () Bool)

(declare-fun res!524911 () Bool)

(assert (=> b!776068 (=> (not res!524911) (not e!431882))))

(assert (=> b!776068 (= res!524911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776069 () Bool)

(assert (=> b!776069 (= e!431880 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20348 a!3186) j!159) a!3186 mask!3328) lt!345729))))

(declare-fun b!776070 () Bool)

(assert (=> b!776070 (= e!431875 e!431879)))

(declare-fun res!524914 () Bool)

(assert (=> b!776070 (=> (not res!524914) (not e!431879))))

(declare-fun lt!345732 () SeekEntryResult!7948)

(assert (=> b!776070 (= res!524914 (= lt!345732 lt!345735))))

(declare-fun lt!345737 () array!42505)

(declare-fun lt!345731 () (_ BitVec 64))

(assert (=> b!776070 (= lt!345735 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345731 lt!345737 mask!3328))))

(assert (=> b!776070 (= lt!345732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345731 mask!3328) lt!345731 lt!345737 mask!3328))))

(assert (=> b!776070 (= lt!345731 (select (store (arr!20348 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776070 (= lt!345737 (array!42506 (store (arr!20348 a!3186) i!1173 k!2102) (size!20769 a!3186)))))

(declare-fun b!776071 () Bool)

(declare-fun res!524904 () Bool)

(assert (=> b!776071 (=> (not res!524904) (not e!431876))))

(assert (=> b!776071 (= res!524904 (validKeyInArray!0 (select (arr!20348 a!3186) j!159)))))

(declare-fun b!776072 () Bool)

(declare-fun res!524908 () Bool)

(assert (=> b!776072 (=> (not res!524908) (not e!431875))))

(assert (=> b!776072 (= res!524908 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20348 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776073 () Bool)

(declare-fun res!524906 () Bool)

(assert (=> b!776073 (=> (not res!524906) (not e!431876))))

(declare-fun arrayContainsKey!0 (array!42505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776073 (= res!524906 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67150 res!524901) b!776065))

(assert (= (and b!776065 res!524912) b!776071))

(assert (= (and b!776071 res!524904) b!776067))

(assert (= (and b!776067 res!524907) b!776073))

(assert (= (and b!776073 res!524906) b!776057))

(assert (= (and b!776057 res!524903) b!776068))

(assert (= (and b!776068 res!524911) b!776061))

(assert (= (and b!776061 res!524902) b!776066))

(assert (= (and b!776066 res!524915) b!776062))

(assert (= (and b!776062 res!524900) b!776072))

(assert (= (and b!776072 res!524908) b!776058))

(assert (= (and b!776058 c!85978) b!776069))

(assert (= (and b!776058 (not c!85978)) b!776064))

(assert (= (and b!776058 res!524913) b!776070))

(assert (= (and b!776070 res!524914) b!776059))

(assert (= (and b!776059 res!524910) b!776060))

(assert (= (and b!776060 res!524909) b!776056))

(assert (= (and b!776059 (not res!524905)) b!776063))

(declare-fun m!720193 () Bool)

(assert (=> b!776062 m!720193))

(assert (=> b!776062 m!720193))

(declare-fun m!720195 () Bool)

(assert (=> b!776062 m!720195))

(assert (=> b!776062 m!720195))

(assert (=> b!776062 m!720193))

(declare-fun m!720197 () Bool)

(assert (=> b!776062 m!720197))

(assert (=> b!776063 m!720193))

(assert (=> b!776063 m!720193))

(declare-fun m!720199 () Bool)

(assert (=> b!776063 m!720199))

(declare-fun m!720201 () Bool)

(assert (=> b!776068 m!720201))

(assert (=> b!776071 m!720193))

(assert (=> b!776071 m!720193))

(declare-fun m!720203 () Bool)

(assert (=> b!776071 m!720203))

(assert (=> b!776064 m!720193))

(assert (=> b!776064 m!720193))

(assert (=> b!776064 m!720199))

(declare-fun m!720205 () Bool)

(assert (=> b!776067 m!720205))

(declare-fun m!720207 () Bool)

(assert (=> b!776072 m!720207))

(declare-fun m!720209 () Bool)

(assert (=> start!67150 m!720209))

(declare-fun m!720211 () Bool)

(assert (=> start!67150 m!720211))

(declare-fun m!720213 () Bool)

(assert (=> b!776061 m!720213))

(declare-fun m!720215 () Bool)

(assert (=> b!776073 m!720215))

(assert (=> b!776069 m!720193))

(assert (=> b!776069 m!720193))

(declare-fun m!720217 () Bool)

(assert (=> b!776069 m!720217))

(assert (=> b!776056 m!720193))

(assert (=> b!776056 m!720193))

(declare-fun m!720219 () Bool)

(assert (=> b!776056 m!720219))

(declare-fun m!720221 () Bool)

(assert (=> b!776057 m!720221))

(declare-fun m!720223 () Bool)

(assert (=> b!776070 m!720223))

(declare-fun m!720225 () Bool)

(assert (=> b!776070 m!720225))

(assert (=> b!776070 m!720223))

(declare-fun m!720227 () Bool)

(assert (=> b!776070 m!720227))

(declare-fun m!720229 () Bool)

(assert (=> b!776070 m!720229))

(declare-fun m!720231 () Bool)

(assert (=> b!776070 m!720231))

(declare-fun m!720233 () Bool)

(assert (=> b!776059 m!720233))

(declare-fun m!720235 () Bool)

(assert (=> b!776059 m!720235))

(assert (=> b!776060 m!720193))

(assert (=> b!776060 m!720193))

(declare-fun m!720237 () Bool)

(assert (=> b!776060 m!720237))

(push 1)

