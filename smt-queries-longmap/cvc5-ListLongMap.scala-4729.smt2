; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65434 () Bool)

(assert start!65434)

(declare-fun b!745170 () Bool)

(declare-fun e!416214 () Bool)

(declare-fun e!416213 () Bool)

(assert (=> b!745170 (= e!416214 e!416213)))

(declare-fun res!502081 () Bool)

(assert (=> b!745170 (=> (not res!502081) (not e!416213))))

(declare-datatypes ((array!41607 0))(
  ( (array!41608 (arr!19917 (Array (_ BitVec 32) (_ BitVec 64))) (size!20338 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41607)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7517 0))(
  ( (MissingZero!7517 (index!32436 (_ BitVec 32))) (Found!7517 (index!32437 (_ BitVec 32))) (Intermediate!7517 (undefined!8329 Bool) (index!32438 (_ BitVec 32)) (x!63395 (_ BitVec 32))) (Undefined!7517) (MissingVacant!7517 (index!32439 (_ BitVec 32))) )
))
(declare-fun lt!331051 () SeekEntryResult!7517)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41607 (_ BitVec 32)) SeekEntryResult!7517)

(assert (=> b!745170 (= res!502081 (= (seekEntryOrOpen!0 (select (arr!19917 a!3186) j!159) a!3186 mask!3328) lt!331051))))

(assert (=> b!745170 (= lt!331051 (Found!7517 j!159))))

(declare-fun b!745171 () Bool)

(declare-fun res!502085 () Bool)

(declare-fun e!416219 () Bool)

(assert (=> b!745171 (=> (not res!502085) (not e!416219))))

(declare-fun e!416216 () Bool)

(assert (=> b!745171 (= res!502085 e!416216)))

(declare-fun c!81928 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745171 (= c!81928 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745172 () Bool)

(declare-fun res!502078 () Bool)

(declare-fun e!416218 () Bool)

(assert (=> b!745172 (=> (not res!502078) (not e!416218))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!745172 (= res!502078 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20338 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20338 a!3186))))))

(declare-fun b!745173 () Bool)

(declare-fun lt!331053 () SeekEntryResult!7517)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41607 (_ BitVec 32)) SeekEntryResult!7517)

(assert (=> b!745173 (= e!416216 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19917 a!3186) j!159) a!3186 mask!3328) lt!331053))))

(declare-fun b!745174 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41607 (_ BitVec 32)) SeekEntryResult!7517)

(assert (=> b!745174 (= e!416216 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19917 a!3186) j!159) a!3186 mask!3328) (Found!7517 j!159)))))

(declare-fun b!745175 () Bool)

(declare-fun e!416211 () Bool)

(declare-fun e!416217 () Bool)

(assert (=> b!745175 (= e!416211 (not e!416217))))

(declare-fun res!502086 () Bool)

(assert (=> b!745175 (=> res!502086 e!416217)))

(declare-fun lt!331048 () SeekEntryResult!7517)

(assert (=> b!745175 (= res!502086 (or (not (is-Intermediate!7517 lt!331048)) (bvslt x!1131 (x!63395 lt!331048)) (not (= x!1131 (x!63395 lt!331048))) (not (= index!1321 (index!32438 lt!331048)))))))

(assert (=> b!745175 e!416214))

(declare-fun res!502076 () Bool)

(assert (=> b!745175 (=> (not res!502076) (not e!416214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41607 (_ BitVec 32)) Bool)

(assert (=> b!745175 (= res!502076 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25514 0))(
  ( (Unit!25515) )
))
(declare-fun lt!331054 () Unit!25514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25514)

(assert (=> b!745175 (= lt!331054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745176 () Bool)

(assert (=> b!745176 (= e!416218 e!416219)))

(declare-fun res!502077 () Bool)

(assert (=> b!745176 (=> (not res!502077) (not e!416219))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745176 (= res!502077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19917 a!3186) j!159) mask!3328) (select (arr!19917 a!3186) j!159) a!3186 mask!3328) lt!331053))))

(assert (=> b!745176 (= lt!331053 (Intermediate!7517 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!331050 () (_ BitVec 64))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun b!745177 () Bool)

(assert (=> b!745177 (= e!416217 (or (= (select (store (arr!19917 a!3186) i!1173 k!2102) index!1321) lt!331050) (not (= (select (store (arr!19917 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!745178 () Bool)

(declare-fun res!502087 () Bool)

(declare-fun e!416212 () Bool)

(assert (=> b!745178 (=> (not res!502087) (not e!416212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745178 (= res!502087 (validKeyInArray!0 (select (arr!19917 a!3186) j!159)))))

(declare-fun b!745179 () Bool)

(declare-fun res!502079 () Bool)

(assert (=> b!745179 (=> res!502079 e!416217)))

(assert (=> b!745179 (= res!502079 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19917 a!3186) j!159) a!3186 mask!3328) (Found!7517 j!159))))))

(declare-fun b!745180 () Bool)

(declare-fun res!502089 () Bool)

(assert (=> b!745180 (=> (not res!502089) (not e!416212))))

(assert (=> b!745180 (= res!502089 (validKeyInArray!0 k!2102))))

(declare-fun b!745181 () Bool)

(assert (=> b!745181 (= e!416213 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19917 a!3186) j!159) a!3186 mask!3328) lt!331051))))

(declare-fun b!745182 () Bool)

(declare-fun res!502090 () Bool)

(assert (=> b!745182 (=> (not res!502090) (not e!416218))))

(assert (=> b!745182 (= res!502090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745183 () Bool)

(declare-fun res!502088 () Bool)

(assert (=> b!745183 (=> (not res!502088) (not e!416218))))

(declare-datatypes ((List!13919 0))(
  ( (Nil!13916) (Cons!13915 (h!14987 (_ BitVec 64)) (t!20234 List!13919)) )
))
(declare-fun arrayNoDuplicates!0 (array!41607 (_ BitVec 32) List!13919) Bool)

(assert (=> b!745183 (= res!502088 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13916))))

(declare-fun b!745184 () Bool)

(declare-fun res!502083 () Bool)

(assert (=> b!745184 (=> (not res!502083) (not e!416212))))

(assert (=> b!745184 (= res!502083 (and (= (size!20338 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20338 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20338 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745185 () Bool)

(assert (=> b!745185 (= e!416219 e!416211)))

(declare-fun res!502084 () Bool)

(assert (=> b!745185 (=> (not res!502084) (not e!416211))))

(declare-fun lt!331049 () SeekEntryResult!7517)

(assert (=> b!745185 (= res!502084 (= lt!331049 lt!331048))))

(declare-fun lt!331052 () array!41607)

(assert (=> b!745185 (= lt!331048 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331050 lt!331052 mask!3328))))

(assert (=> b!745185 (= lt!331049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331050 mask!3328) lt!331050 lt!331052 mask!3328))))

(assert (=> b!745185 (= lt!331050 (select (store (arr!19917 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745185 (= lt!331052 (array!41608 (store (arr!19917 a!3186) i!1173 k!2102) (size!20338 a!3186)))))

(declare-fun b!745186 () Bool)

(declare-fun res!502075 () Bool)

(assert (=> b!745186 (=> (not res!502075) (not e!416219))))

(assert (=> b!745186 (= res!502075 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19917 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!502080 () Bool)

(assert (=> start!65434 (=> (not res!502080) (not e!416212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65434 (= res!502080 (validMask!0 mask!3328))))

(assert (=> start!65434 e!416212))

(assert (=> start!65434 true))

(declare-fun array_inv!15713 (array!41607) Bool)

(assert (=> start!65434 (array_inv!15713 a!3186)))

(declare-fun b!745187 () Bool)

(assert (=> b!745187 (= e!416212 e!416218)))

(declare-fun res!502091 () Bool)

(assert (=> b!745187 (=> (not res!502091) (not e!416218))))

(declare-fun lt!331055 () SeekEntryResult!7517)

(assert (=> b!745187 (= res!502091 (or (= lt!331055 (MissingZero!7517 i!1173)) (= lt!331055 (MissingVacant!7517 i!1173))))))

(assert (=> b!745187 (= lt!331055 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745188 () Bool)

(declare-fun res!502082 () Bool)

(assert (=> b!745188 (=> (not res!502082) (not e!416212))))

(declare-fun arrayContainsKey!0 (array!41607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745188 (= res!502082 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65434 res!502080) b!745184))

(assert (= (and b!745184 res!502083) b!745178))

(assert (= (and b!745178 res!502087) b!745180))

(assert (= (and b!745180 res!502089) b!745188))

(assert (= (and b!745188 res!502082) b!745187))

(assert (= (and b!745187 res!502091) b!745182))

(assert (= (and b!745182 res!502090) b!745183))

(assert (= (and b!745183 res!502088) b!745172))

(assert (= (and b!745172 res!502078) b!745176))

(assert (= (and b!745176 res!502077) b!745186))

(assert (= (and b!745186 res!502075) b!745171))

(assert (= (and b!745171 c!81928) b!745173))

(assert (= (and b!745171 (not c!81928)) b!745174))

(assert (= (and b!745171 res!502085) b!745185))

(assert (= (and b!745185 res!502084) b!745175))

(assert (= (and b!745175 res!502076) b!745170))

(assert (= (and b!745170 res!502081) b!745181))

(assert (= (and b!745175 (not res!502086)) b!745179))

(assert (= (and b!745179 (not res!502079)) b!745177))

(declare-fun m!695587 () Bool)

(assert (=> b!745175 m!695587))

(declare-fun m!695589 () Bool)

(assert (=> b!745175 m!695589))

(declare-fun m!695591 () Bool)

(assert (=> b!745170 m!695591))

(assert (=> b!745170 m!695591))

(declare-fun m!695593 () Bool)

(assert (=> b!745170 m!695593))

(declare-fun m!695595 () Bool)

(assert (=> start!65434 m!695595))

(declare-fun m!695597 () Bool)

(assert (=> start!65434 m!695597))

(assert (=> b!745178 m!695591))

(assert (=> b!745178 m!695591))

(declare-fun m!695599 () Bool)

(assert (=> b!745178 m!695599))

(declare-fun m!695601 () Bool)

(assert (=> b!745182 m!695601))

(assert (=> b!745176 m!695591))

(assert (=> b!745176 m!695591))

(declare-fun m!695603 () Bool)

(assert (=> b!745176 m!695603))

(assert (=> b!745176 m!695603))

(assert (=> b!745176 m!695591))

(declare-fun m!695605 () Bool)

(assert (=> b!745176 m!695605))

(declare-fun m!695607 () Bool)

(assert (=> b!745188 m!695607))

(declare-fun m!695609 () Bool)

(assert (=> b!745186 m!695609))

(assert (=> b!745179 m!695591))

(assert (=> b!745179 m!695591))

(declare-fun m!695611 () Bool)

(assert (=> b!745179 m!695611))

(assert (=> b!745173 m!695591))

(assert (=> b!745173 m!695591))

(declare-fun m!695613 () Bool)

(assert (=> b!745173 m!695613))

(declare-fun m!695615 () Bool)

(assert (=> b!745177 m!695615))

(declare-fun m!695617 () Bool)

(assert (=> b!745177 m!695617))

(declare-fun m!695619 () Bool)

(assert (=> b!745183 m!695619))

(assert (=> b!745181 m!695591))

(assert (=> b!745181 m!695591))

(declare-fun m!695621 () Bool)

(assert (=> b!745181 m!695621))

(declare-fun m!695623 () Bool)

(assert (=> b!745180 m!695623))

(assert (=> b!745185 m!695615))

(declare-fun m!695625 () Bool)

(assert (=> b!745185 m!695625))

(declare-fun m!695627 () Bool)

(assert (=> b!745185 m!695627))

(declare-fun m!695629 () Bool)

(assert (=> b!745185 m!695629))

(declare-fun m!695631 () Bool)

(assert (=> b!745185 m!695631))

(assert (=> b!745185 m!695629))

(declare-fun m!695633 () Bool)

(assert (=> b!745187 m!695633))

(assert (=> b!745174 m!695591))

(assert (=> b!745174 m!695591))

(assert (=> b!745174 m!695611))

(push 1)

(assert (not b!745183))

(assert (not b!745182))

(assert (not b!745181))

(assert (not b!745178))

(assert (not b!745180))

(assert (not start!65434))

(assert (not b!745175))

(assert (not b!745174))

(assert (not b!745187))

(assert (not b!745170))

(assert (not b!745173))

(assert (not b!745188))

(assert (not b!745179))

(assert (not b!745185))

(assert (not b!745176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

