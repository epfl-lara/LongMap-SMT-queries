; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65378 () Bool)

(assert start!65378)

(declare-fun b!743928 () Bool)

(declare-fun e!415573 () Bool)

(declare-fun e!415575 () Bool)

(assert (=> b!743928 (= e!415573 e!415575)))

(declare-fun res!501089 () Bool)

(assert (=> b!743928 (=> (not res!501089) (not e!415575))))

(declare-datatypes ((array!41568 0))(
  ( (array!41569 (arr!19898 (Array (_ BitVec 32) (_ BitVec 64))) (size!20319 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41568)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7495 0))(
  ( (MissingZero!7495 (index!32348 (_ BitVec 32))) (Found!7495 (index!32349 (_ BitVec 32))) (Intermediate!7495 (undefined!8307 Bool) (index!32350 (_ BitVec 32)) (x!63320 (_ BitVec 32))) (Undefined!7495) (MissingVacant!7495 (index!32351 (_ BitVec 32))) )
))
(declare-fun lt!330349 () SeekEntryResult!7495)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41568 (_ BitVec 32)) SeekEntryResult!7495)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743928 (= res!501089 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19898 a!3186) j!159) mask!3328) (select (arr!19898 a!3186) j!159) a!3186 mask!3328) lt!330349))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743928 (= lt!330349 (Intermediate!7495 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!501090 () Bool)

(declare-fun e!415576 () Bool)

(assert (=> start!65378 (=> (not res!501090) (not e!415576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65378 (= res!501090 (validMask!0 mask!3328))))

(assert (=> start!65378 e!415576))

(assert (=> start!65378 true))

(declare-fun array_inv!15781 (array!41568) Bool)

(assert (=> start!65378 (array_inv!15781 a!3186)))

(declare-fun e!415572 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!743929 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!743929 (= e!415572 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19898 a!3186) j!159) a!3186 mask!3328) lt!330349))))

(declare-fun b!743930 () Bool)

(declare-fun e!415578 () Bool)

(declare-fun e!415571 () Bool)

(assert (=> b!743930 (= e!415578 e!415571)))

(declare-fun res!501083 () Bool)

(assert (=> b!743930 (=> (not res!501083) (not e!415571))))

(declare-fun lt!330346 () SeekEntryResult!7495)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41568 (_ BitVec 32)) SeekEntryResult!7495)

(assert (=> b!743930 (= res!501083 (= (seekEntryOrOpen!0 (select (arr!19898 a!3186) j!159) a!3186 mask!3328) lt!330346))))

(assert (=> b!743930 (= lt!330346 (Found!7495 j!159))))

(declare-fun b!743931 () Bool)

(declare-fun res!501095 () Bool)

(assert (=> b!743931 (=> (not res!501095) (not e!415573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41568 (_ BitVec 32)) Bool)

(assert (=> b!743931 (= res!501095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743932 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41568 (_ BitVec 32)) SeekEntryResult!7495)

(assert (=> b!743932 (= e!415571 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19898 a!3186) j!159) a!3186 mask!3328) lt!330346))))

(declare-fun b!743933 () Bool)

(declare-fun res!501085 () Bool)

(assert (=> b!743933 (=> (not res!501085) (not e!415575))))

(assert (=> b!743933 (= res!501085 e!415572)))

(declare-fun c!81804 () Bool)

(assert (=> b!743933 (= c!81804 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743934 () Bool)

(declare-fun res!501084 () Bool)

(assert (=> b!743934 (=> (not res!501084) (not e!415576))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743934 (= res!501084 (and (= (size!20319 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20319 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20319 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743935 () Bool)

(declare-fun res!501087 () Bool)

(assert (=> b!743935 (=> (not res!501087) (not e!415573))))

(assert (=> b!743935 (= res!501087 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20319 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20319 a!3186))))))

(declare-fun b!743936 () Bool)

(assert (=> b!743936 (= e!415572 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19898 a!3186) j!159) a!3186 mask!3328) (Found!7495 j!159)))))

(declare-fun b!743937 () Bool)

(declare-fun res!501094 () Bool)

(assert (=> b!743937 (=> (not res!501094) (not e!415573))))

(declare-datatypes ((List!13939 0))(
  ( (Nil!13936) (Cons!13935 (h!15007 (_ BitVec 64)) (t!20245 List!13939)) )
))
(declare-fun arrayNoDuplicates!0 (array!41568 (_ BitVec 32) List!13939) Bool)

(assert (=> b!743937 (= res!501094 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13936))))

(declare-fun b!743938 () Bool)

(declare-fun res!501091 () Bool)

(assert (=> b!743938 (=> (not res!501091) (not e!415576))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743938 (= res!501091 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743939 () Bool)

(assert (=> b!743939 (= e!415576 e!415573)))

(declare-fun res!501092 () Bool)

(assert (=> b!743939 (=> (not res!501092) (not e!415573))))

(declare-fun lt!330343 () SeekEntryResult!7495)

(assert (=> b!743939 (= res!501092 (or (= lt!330343 (MissingZero!7495 i!1173)) (= lt!330343 (MissingVacant!7495 i!1173))))))

(assert (=> b!743939 (= lt!330343 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743940 () Bool)

(declare-fun e!415574 () Bool)

(assert (=> b!743940 (= e!415574 true)))

(declare-fun lt!330348 () SeekEntryResult!7495)

(assert (=> b!743940 (= lt!330348 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19898 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!743941 () Bool)

(declare-fun res!501093 () Bool)

(assert (=> b!743941 (=> (not res!501093) (not e!415575))))

(assert (=> b!743941 (= res!501093 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19898 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743942 () Bool)

(declare-fun e!415579 () Bool)

(assert (=> b!743942 (= e!415575 e!415579)))

(declare-fun res!501082 () Bool)

(assert (=> b!743942 (=> (not res!501082) (not e!415579))))

(declare-fun lt!330342 () SeekEntryResult!7495)

(declare-fun lt!330347 () SeekEntryResult!7495)

(assert (=> b!743942 (= res!501082 (= lt!330342 lt!330347))))

(declare-fun lt!330344 () array!41568)

(declare-fun lt!330350 () (_ BitVec 64))

(assert (=> b!743942 (= lt!330347 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330350 lt!330344 mask!3328))))

(assert (=> b!743942 (= lt!330342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330350 mask!3328) lt!330350 lt!330344 mask!3328))))

(assert (=> b!743942 (= lt!330350 (select (store (arr!19898 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743942 (= lt!330344 (array!41569 (store (arr!19898 a!3186) i!1173 k0!2102) (size!20319 a!3186)))))

(declare-fun b!743943 () Bool)

(declare-fun res!501088 () Bool)

(assert (=> b!743943 (=> (not res!501088) (not e!415576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743943 (= res!501088 (validKeyInArray!0 k0!2102))))

(declare-fun b!743944 () Bool)

(declare-fun res!501081 () Bool)

(assert (=> b!743944 (=> (not res!501081) (not e!415576))))

(assert (=> b!743944 (= res!501081 (validKeyInArray!0 (select (arr!19898 a!3186) j!159)))))

(declare-fun b!743945 () Bool)

(assert (=> b!743945 (= e!415579 (not e!415574))))

(declare-fun res!501096 () Bool)

(assert (=> b!743945 (=> res!501096 e!415574)))

(get-info :version)

(assert (=> b!743945 (= res!501096 (or (not ((_ is Intermediate!7495) lt!330347)) (bvslt x!1131 (x!63320 lt!330347)) (not (= x!1131 (x!63320 lt!330347))) (not (= index!1321 (index!32350 lt!330347)))))))

(assert (=> b!743945 e!415578))

(declare-fun res!501086 () Bool)

(assert (=> b!743945 (=> (not res!501086) (not e!415578))))

(assert (=> b!743945 (= res!501086 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25442 0))(
  ( (Unit!25443) )
))
(declare-fun lt!330345 () Unit!25442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25442)

(assert (=> b!743945 (= lt!330345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65378 res!501090) b!743934))

(assert (= (and b!743934 res!501084) b!743944))

(assert (= (and b!743944 res!501081) b!743943))

(assert (= (and b!743943 res!501088) b!743938))

(assert (= (and b!743938 res!501091) b!743939))

(assert (= (and b!743939 res!501092) b!743931))

(assert (= (and b!743931 res!501095) b!743937))

(assert (= (and b!743937 res!501094) b!743935))

(assert (= (and b!743935 res!501087) b!743928))

(assert (= (and b!743928 res!501089) b!743941))

(assert (= (and b!743941 res!501093) b!743933))

(assert (= (and b!743933 c!81804) b!743929))

(assert (= (and b!743933 (not c!81804)) b!743936))

(assert (= (and b!743933 res!501085) b!743942))

(assert (= (and b!743942 res!501082) b!743945))

(assert (= (and b!743945 res!501086) b!743930))

(assert (= (and b!743930 res!501083) b!743932))

(assert (= (and b!743945 (not res!501096)) b!743940))

(declare-fun m!693989 () Bool)

(assert (=> b!743943 m!693989))

(declare-fun m!693991 () Bool)

(assert (=> b!743931 m!693991))

(declare-fun m!693993 () Bool)

(assert (=> b!743937 m!693993))

(declare-fun m!693995 () Bool)

(assert (=> b!743936 m!693995))

(assert (=> b!743936 m!693995))

(declare-fun m!693997 () Bool)

(assert (=> b!743936 m!693997))

(declare-fun m!693999 () Bool)

(assert (=> b!743939 m!693999))

(declare-fun m!694001 () Bool)

(assert (=> start!65378 m!694001))

(declare-fun m!694003 () Bool)

(assert (=> start!65378 m!694003))

(assert (=> b!743944 m!693995))

(assert (=> b!743944 m!693995))

(declare-fun m!694005 () Bool)

(assert (=> b!743944 m!694005))

(assert (=> b!743929 m!693995))

(assert (=> b!743929 m!693995))

(declare-fun m!694007 () Bool)

(assert (=> b!743929 m!694007))

(declare-fun m!694009 () Bool)

(assert (=> b!743938 m!694009))

(assert (=> b!743940 m!693995))

(assert (=> b!743940 m!693995))

(assert (=> b!743940 m!693997))

(declare-fun m!694011 () Bool)

(assert (=> b!743945 m!694011))

(declare-fun m!694013 () Bool)

(assert (=> b!743945 m!694013))

(declare-fun m!694015 () Bool)

(assert (=> b!743942 m!694015))

(declare-fun m!694017 () Bool)

(assert (=> b!743942 m!694017))

(assert (=> b!743942 m!694015))

(declare-fun m!694019 () Bool)

(assert (=> b!743942 m!694019))

(declare-fun m!694021 () Bool)

(assert (=> b!743942 m!694021))

(declare-fun m!694023 () Bool)

(assert (=> b!743942 m!694023))

(declare-fun m!694025 () Bool)

(assert (=> b!743941 m!694025))

(assert (=> b!743932 m!693995))

(assert (=> b!743932 m!693995))

(declare-fun m!694027 () Bool)

(assert (=> b!743932 m!694027))

(assert (=> b!743928 m!693995))

(assert (=> b!743928 m!693995))

(declare-fun m!694029 () Bool)

(assert (=> b!743928 m!694029))

(assert (=> b!743928 m!694029))

(assert (=> b!743928 m!693995))

(declare-fun m!694031 () Bool)

(assert (=> b!743928 m!694031))

(assert (=> b!743930 m!693995))

(assert (=> b!743930 m!693995))

(declare-fun m!694033 () Bool)

(assert (=> b!743930 m!694033))

(check-sat (not b!743945) (not b!743932) (not b!743928) (not b!743930) (not b!743940) (not b!743944) (not b!743943) (not start!65378) (not b!743937) (not b!743931) (not b!743939) (not b!743929) (not b!743936) (not b!743938) (not b!743942))
(check-sat)
