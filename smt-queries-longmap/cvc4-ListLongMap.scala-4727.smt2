; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65426 () Bool)

(assert start!65426)

(declare-fun b!744952 () Bool)

(declare-fun res!501880 () Bool)

(declare-fun e!416108 () Bool)

(assert (=> b!744952 (=> (not res!501880) (not e!416108))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41599 0))(
  ( (array!41600 (arr!19913 (Array (_ BitVec 32) (_ BitVec 64))) (size!20334 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41599)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744952 (= res!501880 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19913 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744953 () Bool)

(declare-fun e!416109 () Bool)

(assert (=> b!744953 (= e!416108 e!416109)))

(declare-fun res!501881 () Bool)

(assert (=> b!744953 (=> (not res!501881) (not e!416109))))

(declare-datatypes ((SeekEntryResult!7513 0))(
  ( (MissingZero!7513 (index!32420 (_ BitVec 32))) (Found!7513 (index!32421 (_ BitVec 32))) (Intermediate!7513 (undefined!8325 Bool) (index!32422 (_ BitVec 32)) (x!63375 (_ BitVec 32))) (Undefined!7513) (MissingVacant!7513 (index!32423 (_ BitVec 32))) )
))
(declare-fun lt!330948 () SeekEntryResult!7513)

(declare-fun lt!330946 () SeekEntryResult!7513)

(assert (=> b!744953 (= res!501881 (= lt!330948 lt!330946))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!330945 () array!41599)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!330943 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41599 (_ BitVec 32)) SeekEntryResult!7513)

(assert (=> b!744953 (= lt!330946 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330943 lt!330945 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744953 (= lt!330948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330943 mask!3328) lt!330943 lt!330945 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!744953 (= lt!330943 (select (store (arr!19913 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744953 (= lt!330945 (array!41600 (store (arr!19913 a!3186) i!1173 k!2102) (size!20334 a!3186)))))

(declare-fun b!744954 () Bool)

(declare-fun res!501893 () Bool)

(declare-fun e!416105 () Bool)

(assert (=> b!744954 (=> res!501893 e!416105)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41599 (_ BitVec 32)) SeekEntryResult!7513)

(assert (=> b!744954 (= res!501893 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19913 a!3186) j!159) a!3186 mask!3328) (Found!7513 j!159))))))

(declare-fun lt!330947 () SeekEntryResult!7513)

(declare-fun e!416110 () Bool)

(declare-fun b!744955 () Bool)

(assert (=> b!744955 (= e!416110 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19913 a!3186) j!159) a!3186 mask!3328) lt!330947))))

(declare-fun b!744956 () Bool)

(declare-fun res!501890 () Bool)

(declare-fun e!416107 () Bool)

(assert (=> b!744956 (=> (not res!501890) (not e!416107))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744956 (= res!501890 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20334 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20334 a!3186))))))

(declare-fun b!744957 () Bool)

(declare-fun res!501889 () Bool)

(assert (=> b!744957 (=> (not res!501889) (not e!416107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41599 (_ BitVec 32)) Bool)

(assert (=> b!744957 (= res!501889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744958 () Bool)

(declare-fun e!416106 () Bool)

(declare-fun e!416104 () Bool)

(assert (=> b!744958 (= e!416106 e!416104)))

(declare-fun res!501894 () Bool)

(assert (=> b!744958 (=> (not res!501894) (not e!416104))))

(declare-fun lt!330944 () SeekEntryResult!7513)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41599 (_ BitVec 32)) SeekEntryResult!7513)

(assert (=> b!744958 (= res!501894 (= (seekEntryOrOpen!0 (select (arr!19913 a!3186) j!159) a!3186 mask!3328) lt!330944))))

(assert (=> b!744958 (= lt!330944 (Found!7513 j!159))))

(declare-fun b!744959 () Bool)

(declare-fun res!501883 () Bool)

(declare-fun e!416103 () Bool)

(assert (=> b!744959 (=> (not res!501883) (not e!416103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744959 (= res!501883 (validKeyInArray!0 (select (arr!19913 a!3186) j!159)))))

(declare-fun b!744960 () Bool)

(assert (=> b!744960 (= e!416109 (not e!416105))))

(declare-fun res!501896 () Bool)

(assert (=> b!744960 (=> res!501896 e!416105)))

(assert (=> b!744960 (= res!501896 (or (not (is-Intermediate!7513 lt!330946)) (bvslt x!1131 (x!63375 lt!330946)) (not (= x!1131 (x!63375 lt!330946))) (not (= index!1321 (index!32422 lt!330946)))))))

(assert (=> b!744960 e!416106))

(declare-fun res!501886 () Bool)

(assert (=> b!744960 (=> (not res!501886) (not e!416106))))

(assert (=> b!744960 (= res!501886 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25506 0))(
  ( (Unit!25507) )
))
(declare-fun lt!330950 () Unit!25506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25506)

(assert (=> b!744960 (= lt!330950 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!501882 () Bool)

(assert (=> start!65426 (=> (not res!501882) (not e!416103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65426 (= res!501882 (validMask!0 mask!3328))))

(assert (=> start!65426 e!416103))

(assert (=> start!65426 true))

(declare-fun array_inv!15709 (array!41599) Bool)

(assert (=> start!65426 (array_inv!15709 a!3186)))

(declare-fun b!744951 () Bool)

(declare-fun res!501888 () Bool)

(assert (=> b!744951 (=> (not res!501888) (not e!416103))))

(assert (=> b!744951 (= res!501888 (and (= (size!20334 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20334 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20334 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744961 () Bool)

(declare-fun res!501895 () Bool)

(assert (=> b!744961 (=> (not res!501895) (not e!416103))))

(assert (=> b!744961 (= res!501895 (validKeyInArray!0 k!2102))))

(declare-fun b!744962 () Bool)

(assert (=> b!744962 (= e!416105 (or (= (select (store (arr!19913 a!3186) i!1173 k!2102) index!1321) lt!330943) (not (= (select (store (arr!19913 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!744963 () Bool)

(declare-fun res!501884 () Bool)

(assert (=> b!744963 (=> (not res!501884) (not e!416107))))

(declare-datatypes ((List!13915 0))(
  ( (Nil!13912) (Cons!13911 (h!14983 (_ BitVec 64)) (t!20230 List!13915)) )
))
(declare-fun arrayNoDuplicates!0 (array!41599 (_ BitVec 32) List!13915) Bool)

(assert (=> b!744963 (= res!501884 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13912))))

(declare-fun b!744964 () Bool)

(declare-fun res!501891 () Bool)

(assert (=> b!744964 (=> (not res!501891) (not e!416103))))

(declare-fun arrayContainsKey!0 (array!41599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744964 (= res!501891 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744965 () Bool)

(assert (=> b!744965 (= e!416107 e!416108)))

(declare-fun res!501887 () Bool)

(assert (=> b!744965 (=> (not res!501887) (not e!416108))))

(assert (=> b!744965 (= res!501887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19913 a!3186) j!159) mask!3328) (select (arr!19913 a!3186) j!159) a!3186 mask!3328) lt!330947))))

(assert (=> b!744965 (= lt!330947 (Intermediate!7513 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744966 () Bool)

(assert (=> b!744966 (= e!416110 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19913 a!3186) j!159) a!3186 mask!3328) (Found!7513 j!159)))))

(declare-fun b!744967 () Bool)

(assert (=> b!744967 (= e!416103 e!416107)))

(declare-fun res!501892 () Bool)

(assert (=> b!744967 (=> (not res!501892) (not e!416107))))

(declare-fun lt!330949 () SeekEntryResult!7513)

(assert (=> b!744967 (= res!501892 (or (= lt!330949 (MissingZero!7513 i!1173)) (= lt!330949 (MissingVacant!7513 i!1173))))))

(assert (=> b!744967 (= lt!330949 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744968 () Bool)

(assert (=> b!744968 (= e!416104 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19913 a!3186) j!159) a!3186 mask!3328) lt!330944))))

(declare-fun b!744969 () Bool)

(declare-fun res!501885 () Bool)

(assert (=> b!744969 (=> (not res!501885) (not e!416108))))

(assert (=> b!744969 (= res!501885 e!416110)))

(declare-fun c!81916 () Bool)

(assert (=> b!744969 (= c!81916 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65426 res!501882) b!744951))

(assert (= (and b!744951 res!501888) b!744959))

(assert (= (and b!744959 res!501883) b!744961))

(assert (= (and b!744961 res!501895) b!744964))

(assert (= (and b!744964 res!501891) b!744967))

(assert (= (and b!744967 res!501892) b!744957))

(assert (= (and b!744957 res!501889) b!744963))

(assert (= (and b!744963 res!501884) b!744956))

(assert (= (and b!744956 res!501890) b!744965))

(assert (= (and b!744965 res!501887) b!744952))

(assert (= (and b!744952 res!501880) b!744969))

(assert (= (and b!744969 c!81916) b!744955))

(assert (= (and b!744969 (not c!81916)) b!744966))

(assert (= (and b!744969 res!501885) b!744953))

(assert (= (and b!744953 res!501881) b!744960))

(assert (= (and b!744960 res!501886) b!744958))

(assert (= (and b!744958 res!501894) b!744968))

(assert (= (and b!744960 (not res!501896)) b!744954))

(assert (= (and b!744954 (not res!501893)) b!744962))

(declare-fun m!695401 () Bool)

(assert (=> b!744955 m!695401))

(assert (=> b!744955 m!695401))

(declare-fun m!695403 () Bool)

(assert (=> b!744955 m!695403))

(declare-fun m!695405 () Bool)

(assert (=> start!65426 m!695405))

(declare-fun m!695407 () Bool)

(assert (=> start!65426 m!695407))

(assert (=> b!744954 m!695401))

(assert (=> b!744954 m!695401))

(declare-fun m!695409 () Bool)

(assert (=> b!744954 m!695409))

(declare-fun m!695411 () Bool)

(assert (=> b!744960 m!695411))

(declare-fun m!695413 () Bool)

(assert (=> b!744960 m!695413))

(declare-fun m!695415 () Bool)

(assert (=> b!744967 m!695415))

(assert (=> b!744958 m!695401))

(assert (=> b!744958 m!695401))

(declare-fun m!695417 () Bool)

(assert (=> b!744958 m!695417))

(declare-fun m!695419 () Bool)

(assert (=> b!744961 m!695419))

(declare-fun m!695421 () Bool)

(assert (=> b!744963 m!695421))

(declare-fun m!695423 () Bool)

(assert (=> b!744964 m!695423))

(declare-fun m!695425 () Bool)

(assert (=> b!744952 m!695425))

(assert (=> b!744968 m!695401))

(assert (=> b!744968 m!695401))

(declare-fun m!695427 () Bool)

(assert (=> b!744968 m!695427))

(declare-fun m!695429 () Bool)

(assert (=> b!744953 m!695429))

(declare-fun m!695431 () Bool)

(assert (=> b!744953 m!695431))

(declare-fun m!695433 () Bool)

(assert (=> b!744953 m!695433))

(declare-fun m!695435 () Bool)

(assert (=> b!744953 m!695435))

(assert (=> b!744953 m!695433))

(declare-fun m!695437 () Bool)

(assert (=> b!744953 m!695437))

(declare-fun m!695439 () Bool)

(assert (=> b!744957 m!695439))

(assert (=> b!744966 m!695401))

(assert (=> b!744966 m!695401))

(assert (=> b!744966 m!695409))

(assert (=> b!744959 m!695401))

(assert (=> b!744959 m!695401))

(declare-fun m!695441 () Bool)

(assert (=> b!744959 m!695441))

(assert (=> b!744965 m!695401))

(assert (=> b!744965 m!695401))

(declare-fun m!695443 () Bool)

(assert (=> b!744965 m!695443))

(assert (=> b!744965 m!695443))

(assert (=> b!744965 m!695401))

(declare-fun m!695445 () Bool)

(assert (=> b!744965 m!695445))

(assert (=> b!744962 m!695431))

(declare-fun m!695447 () Bool)

(assert (=> b!744962 m!695447))

(push 1)

(assert (not b!744968))

(assert (not b!744958))

(assert (not start!65426))

(assert (not b!744965))

(assert (not b!744960))

(assert (not b!744953))

(assert (not b!744959))

(assert (not b!744963))

(assert (not b!744955))

(assert (not b!744967))

(assert (not b!744957))

(assert (not b!744961))

(assert (not b!744964))

(assert (not b!744954))

(assert (not b!744966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

