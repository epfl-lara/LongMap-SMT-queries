; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65330 () Bool)

(assert start!65330)

(declare-fun b!742208 () Bool)

(declare-fun res!499429 () Bool)

(declare-fun e!414808 () Bool)

(assert (=> b!742208 (=> (not res!499429) (not e!414808))))

(declare-datatypes ((array!41503 0))(
  ( (array!41504 (arr!19865 (Array (_ BitVec 32) (_ BitVec 64))) (size!20286 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41503)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!742208 (= res!499429 (and (= (size!20286 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20286 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20286 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742209 () Bool)

(declare-fun res!499426 () Bool)

(declare-fun e!414809 () Bool)

(assert (=> b!742209 (=> (not res!499426) (not e!414809))))

(declare-datatypes ((List!13867 0))(
  ( (Nil!13864) (Cons!13863 (h!14935 (_ BitVec 64)) (t!20182 List!13867)) )
))
(declare-fun arrayNoDuplicates!0 (array!41503 (_ BitVec 32) List!13867) Bool)

(assert (=> b!742209 (= res!499426 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13864))))

(declare-fun b!742210 () Bool)

(declare-fun res!499430 () Bool)

(assert (=> b!742210 (=> (not res!499430) (not e!414808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742210 (= res!499430 (validKeyInArray!0 (select (arr!19865 a!3186) j!159)))))

(declare-fun b!742211 () Bool)

(assert (=> b!742211 (= e!414808 e!414809)))

(declare-fun res!499433 () Bool)

(assert (=> b!742211 (=> (not res!499433) (not e!414809))))

(declare-datatypes ((SeekEntryResult!7465 0))(
  ( (MissingZero!7465 (index!32228 (_ BitVec 32))) (Found!7465 (index!32229 (_ BitVec 32))) (Intermediate!7465 (undefined!8277 Bool) (index!32230 (_ BitVec 32)) (x!63199 (_ BitVec 32))) (Undefined!7465) (MissingVacant!7465 (index!32231 (_ BitVec 32))) )
))
(declare-fun lt!329716 () SeekEntryResult!7465)

(assert (=> b!742211 (= res!499433 (or (= lt!329716 (MissingZero!7465 i!1173)) (= lt!329716 (MissingVacant!7465 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41503 (_ BitVec 32)) SeekEntryResult!7465)

(assert (=> b!742211 (= lt!329716 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742212 () Bool)

(declare-fun res!499438 () Bool)

(assert (=> b!742212 (=> (not res!499438) (not e!414808))))

(assert (=> b!742212 (= res!499438 (validKeyInArray!0 k!2102))))

(declare-fun e!414815 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!742213 () Bool)

(declare-fun lt!329717 () SeekEntryResult!7465)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41503 (_ BitVec 32)) SeekEntryResult!7465)

(assert (=> b!742213 (= e!414815 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19865 a!3186) j!159) a!3186 mask!3328) lt!329717))))

(declare-fun b!742214 () Bool)

(declare-fun e!414811 () Bool)

(declare-fun e!414812 () Bool)

(assert (=> b!742214 (= e!414811 e!414812)))

(declare-fun res!499428 () Bool)

(assert (=> b!742214 (=> (not res!499428) (not e!414812))))

(declare-fun lt!329713 () SeekEntryResult!7465)

(assert (=> b!742214 (= res!499428 (= (seekEntryOrOpen!0 (select (arr!19865 a!3186) j!159) a!3186 mask!3328) lt!329713))))

(assert (=> b!742214 (= lt!329713 (Found!7465 j!159))))

(declare-fun b!742215 () Bool)

(declare-fun res!499427 () Bool)

(declare-fun e!414814 () Bool)

(assert (=> b!742215 (=> (not res!499427) (not e!414814))))

(assert (=> b!742215 (= res!499427 e!414815)))

(declare-fun c!81772 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742215 (= c!81772 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742216 () Bool)

(declare-fun e!414810 () Bool)

(assert (=> b!742216 (= e!414810 (not true))))

(assert (=> b!742216 e!414811))

(declare-fun res!499439 () Bool)

(assert (=> b!742216 (=> (not res!499439) (not e!414811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41503 (_ BitVec 32)) Bool)

(assert (=> b!742216 (= res!499439 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25410 0))(
  ( (Unit!25411) )
))
(declare-fun lt!329714 () Unit!25410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25410)

(assert (=> b!742216 (= lt!329714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742218 () Bool)

(declare-fun res!499434 () Bool)

(assert (=> b!742218 (=> (not res!499434) (not e!414809))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!742218 (= res!499434 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20286 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20286 a!3186))))))

(declare-fun b!742219 () Bool)

(declare-fun res!499436 () Bool)

(assert (=> b!742219 (=> (not res!499436) (not e!414809))))

(assert (=> b!742219 (= res!499436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742220 () Bool)

(declare-fun res!499435 () Bool)

(assert (=> b!742220 (=> (not res!499435) (not e!414814))))

(assert (=> b!742220 (= res!499435 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19865 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742221 () Bool)

(assert (=> b!742221 (= e!414814 e!414810)))

(declare-fun res!499432 () Bool)

(assert (=> b!742221 (=> (not res!499432) (not e!414810))))

(declare-fun lt!329715 () array!41503)

(declare-fun lt!329712 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742221 (= res!499432 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329712 mask!3328) lt!329712 lt!329715 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329712 lt!329715 mask!3328)))))

(assert (=> b!742221 (= lt!329712 (select (store (arr!19865 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742221 (= lt!329715 (array!41504 (store (arr!19865 a!3186) i!1173 k!2102) (size!20286 a!3186)))))

(declare-fun b!742222 () Bool)

(assert (=> b!742222 (= e!414809 e!414814)))

(declare-fun res!499431 () Bool)

(assert (=> b!742222 (=> (not res!499431) (not e!414814))))

(assert (=> b!742222 (= res!499431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19865 a!3186) j!159) mask!3328) (select (arr!19865 a!3186) j!159) a!3186 mask!3328) lt!329717))))

(assert (=> b!742222 (= lt!329717 (Intermediate!7465 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742223 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41503 (_ BitVec 32)) SeekEntryResult!7465)

(assert (=> b!742223 (= e!414815 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19865 a!3186) j!159) a!3186 mask!3328) (Found!7465 j!159)))))

(declare-fun b!742224 () Bool)

(declare-fun res!499425 () Bool)

(assert (=> b!742224 (=> (not res!499425) (not e!414808))))

(declare-fun arrayContainsKey!0 (array!41503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742224 (= res!499425 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742217 () Bool)

(assert (=> b!742217 (= e!414812 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19865 a!3186) j!159) a!3186 mask!3328) lt!329713))))

(declare-fun res!499437 () Bool)

(assert (=> start!65330 (=> (not res!499437) (not e!414808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65330 (= res!499437 (validMask!0 mask!3328))))

(assert (=> start!65330 e!414808))

(assert (=> start!65330 true))

(declare-fun array_inv!15661 (array!41503) Bool)

(assert (=> start!65330 (array_inv!15661 a!3186)))

(assert (= (and start!65330 res!499437) b!742208))

(assert (= (and b!742208 res!499429) b!742210))

(assert (= (and b!742210 res!499430) b!742212))

(assert (= (and b!742212 res!499438) b!742224))

(assert (= (and b!742224 res!499425) b!742211))

(assert (= (and b!742211 res!499433) b!742219))

(assert (= (and b!742219 res!499436) b!742209))

(assert (= (and b!742209 res!499426) b!742218))

(assert (= (and b!742218 res!499434) b!742222))

(assert (= (and b!742222 res!499431) b!742220))

(assert (= (and b!742220 res!499435) b!742215))

(assert (= (and b!742215 c!81772) b!742213))

(assert (= (and b!742215 (not c!81772)) b!742223))

(assert (= (and b!742215 res!499427) b!742221))

(assert (= (and b!742221 res!499432) b!742216))

(assert (= (and b!742216 res!499439) b!742214))

(assert (= (and b!742214 res!499428) b!742217))

(declare-fun m!693105 () Bool)

(assert (=> b!742217 m!693105))

(assert (=> b!742217 m!693105))

(declare-fun m!693107 () Bool)

(assert (=> b!742217 m!693107))

(declare-fun m!693109 () Bool)

(assert (=> b!742219 m!693109))

(declare-fun m!693111 () Bool)

(assert (=> b!742211 m!693111))

(assert (=> b!742222 m!693105))

(assert (=> b!742222 m!693105))

(declare-fun m!693113 () Bool)

(assert (=> b!742222 m!693113))

(assert (=> b!742222 m!693113))

(assert (=> b!742222 m!693105))

(declare-fun m!693115 () Bool)

(assert (=> b!742222 m!693115))

(declare-fun m!693117 () Bool)

(assert (=> b!742209 m!693117))

(declare-fun m!693119 () Bool)

(assert (=> start!65330 m!693119))

(declare-fun m!693121 () Bool)

(assert (=> start!65330 m!693121))

(declare-fun m!693123 () Bool)

(assert (=> b!742224 m!693123))

(assert (=> b!742223 m!693105))

(assert (=> b!742223 m!693105))

(declare-fun m!693125 () Bool)

(assert (=> b!742223 m!693125))

(declare-fun m!693127 () Bool)

(assert (=> b!742220 m!693127))

(declare-fun m!693129 () Bool)

(assert (=> b!742221 m!693129))

(declare-fun m!693131 () Bool)

(assert (=> b!742221 m!693131))

(declare-fun m!693133 () Bool)

(assert (=> b!742221 m!693133))

(declare-fun m!693135 () Bool)

(assert (=> b!742221 m!693135))

(assert (=> b!742221 m!693131))

(declare-fun m!693137 () Bool)

(assert (=> b!742221 m!693137))

(declare-fun m!693139 () Bool)

(assert (=> b!742212 m!693139))

(declare-fun m!693141 () Bool)

(assert (=> b!742216 m!693141))

(declare-fun m!693143 () Bool)

(assert (=> b!742216 m!693143))

(assert (=> b!742213 m!693105))

(assert (=> b!742213 m!693105))

(declare-fun m!693145 () Bool)

(assert (=> b!742213 m!693145))

(assert (=> b!742210 m!693105))

(assert (=> b!742210 m!693105))

(declare-fun m!693147 () Bool)

(assert (=> b!742210 m!693147))

(assert (=> b!742214 m!693105))

(assert (=> b!742214 m!693105))

(declare-fun m!693149 () Bool)

(assert (=> b!742214 m!693149))

(push 1)

