; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66802 () Bool)

(assert start!66802)

(declare-fun b!770456 () Bool)

(declare-fun e!428967 () Bool)

(declare-fun e!428965 () Bool)

(assert (=> b!770456 (= e!428967 (not e!428965))))

(declare-fun res!521170 () Bool)

(assert (=> b!770456 (=> res!521170 e!428965)))

(declare-datatypes ((SeekEntryResult!7882 0))(
  ( (MissingZero!7882 (index!33896 (_ BitVec 32))) (Found!7882 (index!33897 (_ BitVec 32))) (Intermediate!7882 (undefined!8694 Bool) (index!33898 (_ BitVec 32)) (x!64821 (_ BitVec 32))) (Undefined!7882) (MissingVacant!7882 (index!33899 (_ BitVec 32))) )
))
(declare-fun lt!342912 () SeekEntryResult!7882)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!770456 (= res!521170 (or (not (is-Intermediate!7882 lt!342912)) (bvsge x!1131 (x!64821 lt!342912))))))

(declare-fun e!428962 () Bool)

(assert (=> b!770456 e!428962))

(declare-fun res!521168 () Bool)

(assert (=> b!770456 (=> (not res!521168) (not e!428962))))

(declare-datatypes ((array!42364 0))(
  ( (array!42365 (arr!20282 (Array (_ BitVec 32) (_ BitVec 64))) (size!20703 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42364)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42364 (_ BitVec 32)) Bool)

(assert (=> b!770456 (= res!521168 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26542 0))(
  ( (Unit!26543) )
))
(declare-fun lt!342905 () Unit!26542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26542)

(assert (=> b!770456 (= lt!342905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770457 () Bool)

(declare-fun e!428966 () Unit!26542)

(declare-fun Unit!26544 () Unit!26542)

(assert (=> b!770457 (= e!428966 Unit!26544)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342909 () SeekEntryResult!7882)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42364 (_ BitVec 32)) SeekEntryResult!7882)

(assert (=> b!770457 (= lt!342909 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20282 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342908 () (_ BitVec 32))

(assert (=> b!770457 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342908 resIntermediateIndex!5 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) (Found!7882 j!159))))

(declare-fun b!770458 () Bool)

(declare-fun lt!342910 () SeekEntryResult!7882)

(declare-fun e!428964 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42364 (_ BitVec 32)) SeekEntryResult!7882)

(assert (=> b!770458 (= e!428964 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342910))))

(declare-fun b!770460 () Bool)

(declare-fun res!521177 () Bool)

(declare-fun e!428963 () Bool)

(assert (=> b!770460 (=> (not res!521177) (not e!428963))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770460 (= res!521177 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20703 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20703 a!3186))))))

(declare-fun b!770461 () Bool)

(declare-fun Unit!26545 () Unit!26542)

(assert (=> b!770461 (= e!428966 Unit!26545)))

(assert (=> b!770461 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342908 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342910)))

(declare-fun b!770462 () Bool)

(declare-fun res!521166 () Bool)

(declare-fun e!428969 () Bool)

(assert (=> b!770462 (=> (not res!521166) (not e!428969))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770462 (= res!521166 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770463 () Bool)

(declare-fun res!521167 () Bool)

(assert (=> b!770463 (=> (not res!521167) (not e!428963))))

(assert (=> b!770463 (= res!521167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770464 () Bool)

(assert (=> b!770464 (= e!428965 true)))

(declare-fun lt!342906 () Unit!26542)

(assert (=> b!770464 (= lt!342906 e!428966)))

(declare-fun c!85041 () Bool)

(assert (=> b!770464 (= c!85041 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770464 (= lt!342908 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770465 () Bool)

(declare-fun e!428968 () Bool)

(assert (=> b!770465 (= e!428968 e!428967)))

(declare-fun res!521178 () Bool)

(assert (=> b!770465 (=> (not res!521178) (not e!428967))))

(declare-fun lt!342911 () SeekEntryResult!7882)

(assert (=> b!770465 (= res!521178 (= lt!342911 lt!342912))))

(declare-fun lt!342907 () (_ BitVec 64))

(declare-fun lt!342914 () array!42364)

(assert (=> b!770465 (= lt!342912 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342907 lt!342914 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770465 (= lt!342911 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342907 mask!3328) lt!342907 lt!342914 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770465 (= lt!342907 (select (store (arr!20282 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770465 (= lt!342914 (array!42365 (store (arr!20282 a!3186) i!1173 k!2102) (size!20703 a!3186)))))

(declare-fun b!770459 () Bool)

(declare-fun res!521180 () Bool)

(assert (=> b!770459 (=> (not res!521180) (not e!428969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770459 (= res!521180 (validKeyInArray!0 k!2102))))

(declare-fun res!521172 () Bool)

(assert (=> start!66802 (=> (not res!521172) (not e!428969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66802 (= res!521172 (validMask!0 mask!3328))))

(assert (=> start!66802 e!428969))

(assert (=> start!66802 true))

(declare-fun array_inv!16078 (array!42364) Bool)

(assert (=> start!66802 (array_inv!16078 a!3186)))

(declare-fun b!770466 () Bool)

(declare-fun res!521176 () Bool)

(assert (=> b!770466 (=> (not res!521176) (not e!428969))))

(assert (=> b!770466 (= res!521176 (and (= (size!20703 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20703 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20703 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770467 () Bool)

(assert (=> b!770467 (= e!428964 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) (Found!7882 j!159)))))

(declare-fun b!770468 () Bool)

(assert (=> b!770468 (= e!428969 e!428963)))

(declare-fun res!521174 () Bool)

(assert (=> b!770468 (=> (not res!521174) (not e!428963))))

(declare-fun lt!342904 () SeekEntryResult!7882)

(assert (=> b!770468 (= res!521174 (or (= lt!342904 (MissingZero!7882 i!1173)) (= lt!342904 (MissingVacant!7882 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42364 (_ BitVec 32)) SeekEntryResult!7882)

(assert (=> b!770468 (= lt!342904 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!342913 () SeekEntryResult!7882)

(declare-fun e!428961 () Bool)

(declare-fun b!770469 () Bool)

(assert (=> b!770469 (= e!428961 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342913))))

(declare-fun b!770470 () Bool)

(declare-fun res!521165 () Bool)

(assert (=> b!770470 (=> (not res!521165) (not e!428968))))

(assert (=> b!770470 (= res!521165 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20282 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770471 () Bool)

(assert (=> b!770471 (= e!428963 e!428968)))

(declare-fun res!521171 () Bool)

(assert (=> b!770471 (=> (not res!521171) (not e!428968))))

(assert (=> b!770471 (= res!521171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20282 a!3186) j!159) mask!3328) (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342910))))

(assert (=> b!770471 (= lt!342910 (Intermediate!7882 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770472 () Bool)

(declare-fun res!521169 () Bool)

(assert (=> b!770472 (=> (not res!521169) (not e!428968))))

(assert (=> b!770472 (= res!521169 e!428964)))

(declare-fun c!85042 () Bool)

(assert (=> b!770472 (= c!85042 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770473 () Bool)

(declare-fun res!521173 () Bool)

(assert (=> b!770473 (=> (not res!521173) (not e!428963))))

(declare-datatypes ((List!14284 0))(
  ( (Nil!14281) (Cons!14280 (h!15379 (_ BitVec 64)) (t!20599 List!14284)) )
))
(declare-fun arrayNoDuplicates!0 (array!42364 (_ BitVec 32) List!14284) Bool)

(assert (=> b!770473 (= res!521173 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14281))))

(declare-fun b!770474 () Bool)

(declare-fun res!521175 () Bool)

(assert (=> b!770474 (=> (not res!521175) (not e!428969))))

(assert (=> b!770474 (= res!521175 (validKeyInArray!0 (select (arr!20282 a!3186) j!159)))))

(declare-fun b!770475 () Bool)

(assert (=> b!770475 (= e!428962 e!428961)))

(declare-fun res!521179 () Bool)

(assert (=> b!770475 (=> (not res!521179) (not e!428961))))

(assert (=> b!770475 (= res!521179 (= (seekEntryOrOpen!0 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342913))))

(assert (=> b!770475 (= lt!342913 (Found!7882 j!159))))

(assert (= (and start!66802 res!521172) b!770466))

(assert (= (and b!770466 res!521176) b!770474))

(assert (= (and b!770474 res!521175) b!770459))

(assert (= (and b!770459 res!521180) b!770462))

(assert (= (and b!770462 res!521166) b!770468))

(assert (= (and b!770468 res!521174) b!770463))

(assert (= (and b!770463 res!521167) b!770473))

(assert (= (and b!770473 res!521173) b!770460))

(assert (= (and b!770460 res!521177) b!770471))

(assert (= (and b!770471 res!521171) b!770470))

(assert (= (and b!770470 res!521165) b!770472))

(assert (= (and b!770472 c!85042) b!770458))

(assert (= (and b!770472 (not c!85042)) b!770467))

(assert (= (and b!770472 res!521169) b!770465))

(assert (= (and b!770465 res!521178) b!770456))

(assert (= (and b!770456 res!521168) b!770475))

(assert (= (and b!770475 res!521179) b!770469))

(assert (= (and b!770456 (not res!521170)) b!770464))

(assert (= (and b!770464 c!85041) b!770461))

(assert (= (and b!770464 (not c!85041)) b!770457))

(declare-fun m!715735 () Bool)

(assert (=> b!770471 m!715735))

(assert (=> b!770471 m!715735))

(declare-fun m!715737 () Bool)

(assert (=> b!770471 m!715737))

(assert (=> b!770471 m!715737))

(assert (=> b!770471 m!715735))

(declare-fun m!715739 () Bool)

(assert (=> b!770471 m!715739))

(assert (=> b!770457 m!715735))

(assert (=> b!770457 m!715735))

(declare-fun m!715741 () Bool)

(assert (=> b!770457 m!715741))

(assert (=> b!770457 m!715735))

(declare-fun m!715743 () Bool)

(assert (=> b!770457 m!715743))

(declare-fun m!715745 () Bool)

(assert (=> b!770463 m!715745))

(declare-fun m!715747 () Bool)

(assert (=> b!770464 m!715747))

(assert (=> b!770461 m!715735))

(assert (=> b!770461 m!715735))

(declare-fun m!715749 () Bool)

(assert (=> b!770461 m!715749))

(declare-fun m!715751 () Bool)

(assert (=> b!770462 m!715751))

(declare-fun m!715753 () Bool)

(assert (=> b!770459 m!715753))

(declare-fun m!715755 () Bool)

(assert (=> b!770470 m!715755))

(assert (=> b!770469 m!715735))

(assert (=> b!770469 m!715735))

(declare-fun m!715757 () Bool)

(assert (=> b!770469 m!715757))

(assert (=> b!770474 m!715735))

(assert (=> b!770474 m!715735))

(declare-fun m!715759 () Bool)

(assert (=> b!770474 m!715759))

(assert (=> b!770467 m!715735))

(assert (=> b!770467 m!715735))

(assert (=> b!770467 m!715741))

(declare-fun m!715761 () Bool)

(assert (=> b!770465 m!715761))

(declare-fun m!715763 () Bool)

(assert (=> b!770465 m!715763))

(declare-fun m!715765 () Bool)

(assert (=> b!770465 m!715765))

(declare-fun m!715767 () Bool)

(assert (=> b!770465 m!715767))

(assert (=> b!770465 m!715761))

(declare-fun m!715769 () Bool)

(assert (=> b!770465 m!715769))

(declare-fun m!715771 () Bool)

(assert (=> start!66802 m!715771))

(declare-fun m!715773 () Bool)

(assert (=> start!66802 m!715773))

(declare-fun m!715775 () Bool)

(assert (=> b!770473 m!715775))

(declare-fun m!715777 () Bool)

(assert (=> b!770468 m!715777))

(assert (=> b!770458 m!715735))

(assert (=> b!770458 m!715735))

(declare-fun m!715779 () Bool)

(assert (=> b!770458 m!715779))

(declare-fun m!715781 () Bool)

(assert (=> b!770456 m!715781))

(declare-fun m!715783 () Bool)

(assert (=> b!770456 m!715783))

(assert (=> b!770475 m!715735))

(assert (=> b!770475 m!715735))

(declare-fun m!715785 () Bool)

(assert (=> b!770475 m!715785))

(push 1)

