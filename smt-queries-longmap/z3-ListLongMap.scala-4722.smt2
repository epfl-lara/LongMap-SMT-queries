; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65394 () Bool)

(assert start!65394)

(declare-fun res!501107 () Bool)

(declare-fun e!415674 () Bool)

(assert (=> start!65394 (=> (not res!501107) (not e!415674))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65394 (= res!501107 (validMask!0 mask!3328))))

(assert (=> start!65394 e!415674))

(assert (=> start!65394 true))

(declare-datatypes ((array!41567 0))(
  ( (array!41568 (arr!19897 (Array (_ BitVec 32) (_ BitVec 64))) (size!20318 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41567)

(declare-fun array_inv!15693 (array!41567) Bool)

(assert (=> start!65394 (array_inv!15693 a!3186)))

(declare-fun b!744070 () Bool)

(declare-fun res!501108 () Bool)

(declare-fun e!415677 () Bool)

(assert (=> b!744070 (=> (not res!501108) (not e!415677))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744070 (= res!501108 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19897 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744071 () Bool)

(declare-fun e!415673 () Bool)

(assert (=> b!744071 (= e!415674 e!415673)))

(declare-fun res!501103 () Bool)

(assert (=> b!744071 (=> (not res!501103) (not e!415673))))

(declare-datatypes ((SeekEntryResult!7497 0))(
  ( (MissingZero!7497 (index!32356 (_ BitVec 32))) (Found!7497 (index!32357 (_ BitVec 32))) (Intermediate!7497 (undefined!8309 Bool) (index!32358 (_ BitVec 32)) (x!63319 (_ BitVec 32))) (Undefined!7497) (MissingVacant!7497 (index!32359 (_ BitVec 32))) )
))
(declare-fun lt!330528 () SeekEntryResult!7497)

(assert (=> b!744071 (= res!501103 (or (= lt!330528 (MissingZero!7497 i!1173)) (= lt!330528 (MissingVacant!7497 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41567 (_ BitVec 32)) SeekEntryResult!7497)

(assert (=> b!744071 (= lt!330528 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744072 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!415671 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41567 (_ BitVec 32)) SeekEntryResult!7497)

(assert (=> b!744072 (= e!415671 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19897 a!3186) j!159) a!3186 mask!3328) (Found!7497 j!159)))))

(declare-fun b!744073 () Bool)

(declare-fun res!501097 () Bool)

(assert (=> b!744073 (=> (not res!501097) (not e!415674))))

(declare-fun arrayContainsKey!0 (array!41567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744073 (= res!501097 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744074 () Bool)

(declare-fun res!501104 () Bool)

(assert (=> b!744074 (=> (not res!501104) (not e!415673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41567 (_ BitVec 32)) Bool)

(assert (=> b!744074 (= res!501104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744075 () Bool)

(declare-fun res!501098 () Bool)

(assert (=> b!744075 (=> (not res!501098) (not e!415673))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744075 (= res!501098 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20318 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20318 a!3186))))))

(declare-fun b!744076 () Bool)

(declare-fun lt!330531 () SeekEntryResult!7497)

(declare-fun e!415676 () Bool)

(assert (=> b!744076 (= e!415676 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19897 a!3186) j!159) a!3186 mask!3328) lt!330531))))

(declare-fun b!744077 () Bool)

(declare-fun e!415679 () Bool)

(assert (=> b!744077 (= e!415679 true)))

(declare-fun lt!330535 () SeekEntryResult!7497)

(assert (=> b!744077 (= lt!330535 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19897 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744078 () Bool)

(declare-fun lt!330536 () SeekEntryResult!7497)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41567 (_ BitVec 32)) SeekEntryResult!7497)

(assert (=> b!744078 (= e!415671 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19897 a!3186) j!159) a!3186 mask!3328) lt!330536))))

(declare-fun b!744079 () Bool)

(declare-fun e!415672 () Bool)

(assert (=> b!744079 (= e!415672 e!415676)))

(declare-fun res!501105 () Bool)

(assert (=> b!744079 (=> (not res!501105) (not e!415676))))

(assert (=> b!744079 (= res!501105 (= (seekEntryOrOpen!0 (select (arr!19897 a!3186) j!159) a!3186 mask!3328) lt!330531))))

(assert (=> b!744079 (= lt!330531 (Found!7497 j!159))))

(declare-fun b!744080 () Bool)

(declare-fun res!501096 () Bool)

(assert (=> b!744080 (=> (not res!501096) (not e!415673))))

(declare-datatypes ((List!13899 0))(
  ( (Nil!13896) (Cons!13895 (h!14967 (_ BitVec 64)) (t!20214 List!13899)) )
))
(declare-fun arrayNoDuplicates!0 (array!41567 (_ BitVec 32) List!13899) Bool)

(assert (=> b!744080 (= res!501096 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13896))))

(declare-fun b!744081 () Bool)

(assert (=> b!744081 (= e!415673 e!415677)))

(declare-fun res!501101 () Bool)

(assert (=> b!744081 (=> (not res!501101) (not e!415677))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744081 (= res!501101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19897 a!3186) j!159) mask!3328) (select (arr!19897 a!3186) j!159) a!3186 mask!3328) lt!330536))))

(assert (=> b!744081 (= lt!330536 (Intermediate!7497 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744082 () Bool)

(declare-fun res!501106 () Bool)

(assert (=> b!744082 (=> (not res!501106) (not e!415674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744082 (= res!501106 (validKeyInArray!0 (select (arr!19897 a!3186) j!159)))))

(declare-fun b!744083 () Bool)

(declare-fun res!501102 () Bool)

(assert (=> b!744083 (=> (not res!501102) (not e!415677))))

(assert (=> b!744083 (= res!501102 e!415671)))

(declare-fun c!81868 () Bool)

(assert (=> b!744083 (= c!81868 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744084 () Bool)

(declare-fun res!501095 () Bool)

(assert (=> b!744084 (=> (not res!501095) (not e!415674))))

(assert (=> b!744084 (= res!501095 (and (= (size!20318 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20318 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20318 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744085 () Bool)

(declare-fun e!415678 () Bool)

(assert (=> b!744085 (= e!415677 e!415678)))

(declare-fun res!501100 () Bool)

(assert (=> b!744085 (=> (not res!501100) (not e!415678))))

(declare-fun lt!330533 () SeekEntryResult!7497)

(declare-fun lt!330532 () SeekEntryResult!7497)

(assert (=> b!744085 (= res!501100 (= lt!330533 lt!330532))))

(declare-fun lt!330534 () array!41567)

(declare-fun lt!330530 () (_ BitVec 64))

(assert (=> b!744085 (= lt!330532 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330530 lt!330534 mask!3328))))

(assert (=> b!744085 (= lt!330533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330530 mask!3328) lt!330530 lt!330534 mask!3328))))

(assert (=> b!744085 (= lt!330530 (select (store (arr!19897 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744085 (= lt!330534 (array!41568 (store (arr!19897 a!3186) i!1173 k0!2102) (size!20318 a!3186)))))

(declare-fun b!744086 () Bool)

(declare-fun res!501110 () Bool)

(assert (=> b!744086 (=> (not res!501110) (not e!415674))))

(assert (=> b!744086 (= res!501110 (validKeyInArray!0 k0!2102))))

(declare-fun b!744087 () Bool)

(assert (=> b!744087 (= e!415678 (not e!415679))))

(declare-fun res!501099 () Bool)

(assert (=> b!744087 (=> res!501099 e!415679)))

(get-info :version)

(assert (=> b!744087 (= res!501099 (or (not ((_ is Intermediate!7497) lt!330532)) (bvslt x!1131 (x!63319 lt!330532)) (not (= x!1131 (x!63319 lt!330532))) (not (= index!1321 (index!32358 lt!330532)))))))

(assert (=> b!744087 e!415672))

(declare-fun res!501109 () Bool)

(assert (=> b!744087 (=> (not res!501109) (not e!415672))))

(assert (=> b!744087 (= res!501109 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25474 0))(
  ( (Unit!25475) )
))
(declare-fun lt!330529 () Unit!25474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25474)

(assert (=> b!744087 (= lt!330529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65394 res!501107) b!744084))

(assert (= (and b!744084 res!501095) b!744082))

(assert (= (and b!744082 res!501106) b!744086))

(assert (= (and b!744086 res!501110) b!744073))

(assert (= (and b!744073 res!501097) b!744071))

(assert (= (and b!744071 res!501103) b!744074))

(assert (= (and b!744074 res!501104) b!744080))

(assert (= (and b!744080 res!501096) b!744075))

(assert (= (and b!744075 res!501098) b!744081))

(assert (= (and b!744081 res!501101) b!744070))

(assert (= (and b!744070 res!501108) b!744083))

(assert (= (and b!744083 c!81868) b!744078))

(assert (= (and b!744083 (not c!81868)) b!744072))

(assert (= (and b!744083 res!501102) b!744085))

(assert (= (and b!744085 res!501100) b!744087))

(assert (= (and b!744087 res!501109) b!744079))

(assert (= (and b!744079 res!501105) b!744076))

(assert (= (and b!744087 (not res!501099)) b!744077))

(declare-fun m!694655 () Bool)

(assert (=> b!744077 m!694655))

(assert (=> b!744077 m!694655))

(declare-fun m!694657 () Bool)

(assert (=> b!744077 m!694657))

(declare-fun m!694659 () Bool)

(assert (=> b!744070 m!694659))

(assert (=> b!744072 m!694655))

(assert (=> b!744072 m!694655))

(assert (=> b!744072 m!694657))

(declare-fun m!694661 () Bool)

(assert (=> b!744087 m!694661))

(declare-fun m!694663 () Bool)

(assert (=> b!744087 m!694663))

(assert (=> b!744078 m!694655))

(assert (=> b!744078 m!694655))

(declare-fun m!694665 () Bool)

(assert (=> b!744078 m!694665))

(declare-fun m!694667 () Bool)

(assert (=> b!744080 m!694667))

(declare-fun m!694669 () Bool)

(assert (=> start!65394 m!694669))

(declare-fun m!694671 () Bool)

(assert (=> start!65394 m!694671))

(assert (=> b!744081 m!694655))

(assert (=> b!744081 m!694655))

(declare-fun m!694673 () Bool)

(assert (=> b!744081 m!694673))

(assert (=> b!744081 m!694673))

(assert (=> b!744081 m!694655))

(declare-fun m!694675 () Bool)

(assert (=> b!744081 m!694675))

(assert (=> b!744082 m!694655))

(assert (=> b!744082 m!694655))

(declare-fun m!694677 () Bool)

(assert (=> b!744082 m!694677))

(declare-fun m!694679 () Bool)

(assert (=> b!744086 m!694679))

(declare-fun m!694681 () Bool)

(assert (=> b!744071 m!694681))

(assert (=> b!744079 m!694655))

(assert (=> b!744079 m!694655))

(declare-fun m!694683 () Bool)

(assert (=> b!744079 m!694683))

(declare-fun m!694685 () Bool)

(assert (=> b!744073 m!694685))

(declare-fun m!694687 () Bool)

(assert (=> b!744074 m!694687))

(declare-fun m!694689 () Bool)

(assert (=> b!744085 m!694689))

(declare-fun m!694691 () Bool)

(assert (=> b!744085 m!694691))

(declare-fun m!694693 () Bool)

(assert (=> b!744085 m!694693))

(declare-fun m!694695 () Bool)

(assert (=> b!744085 m!694695))

(assert (=> b!744085 m!694691))

(declare-fun m!694697 () Bool)

(assert (=> b!744085 m!694697))

(assert (=> b!744076 m!694655))

(assert (=> b!744076 m!694655))

(declare-fun m!694699 () Bool)

(assert (=> b!744076 m!694699))

(check-sat (not b!744074) (not start!65394) (not b!744079) (not b!744071) (not b!744078) (not b!744076) (not b!744085) (not b!744086) (not b!744080) (not b!744082) (not b!744072) (not b!744087) (not b!744077) (not b!744073) (not b!744081))
(check-sat)
