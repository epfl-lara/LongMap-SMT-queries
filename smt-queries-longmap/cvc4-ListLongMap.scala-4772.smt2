; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65696 () Bool)

(assert start!65696)

(declare-fun b!753425 () Bool)

(declare-fun res!508962 () Bool)

(declare-fun e!420229 () Bool)

(assert (=> b!753425 (=> (not res!508962) (not e!420229))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41869 0))(
  ( (array!41870 (arr!20048 (Array (_ BitVec 32) (_ BitVec 64))) (size!20469 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41869)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753425 (= res!508962 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20048 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753426 () Bool)

(declare-datatypes ((Unit!25972 0))(
  ( (Unit!25973) )
))
(declare-fun e!420228 () Unit!25972)

(declare-fun Unit!25974 () Unit!25972)

(assert (=> b!753426 (= e!420228 Unit!25974)))

(assert (=> b!753426 false))

(declare-fun b!753427 () Bool)

(declare-fun res!508958 () Bool)

(declare-fun e!420232 () Bool)

(assert (=> b!753427 (=> (not res!508958) (not e!420232))))

(declare-datatypes ((List!14050 0))(
  ( (Nil!14047) (Cons!14046 (h!15118 (_ BitVec 64)) (t!20365 List!14050)) )
))
(declare-fun arrayNoDuplicates!0 (array!41869 (_ BitVec 32) List!14050) Bool)

(assert (=> b!753427 (= res!508958 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14047))))

(declare-fun b!753428 () Bool)

(declare-fun e!420233 () Bool)

(declare-fun e!420227 () Bool)

(assert (=> b!753428 (= e!420233 e!420227)))

(declare-fun res!508960 () Bool)

(assert (=> b!753428 (=> res!508960 e!420227)))

(declare-fun lt!335217 () (_ BitVec 64))

(declare-fun lt!335218 () (_ BitVec 64))

(assert (=> b!753428 (= res!508960 (= lt!335217 lt!335218))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!753428 (= lt!335217 (select (store (arr!20048 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!753429 () Bool)

(assert (=> b!753429 (= e!420227 true)))

(declare-fun e!420231 () Bool)

(assert (=> b!753429 e!420231))

(declare-fun res!508968 () Bool)

(assert (=> b!753429 (=> (not res!508968) (not e!420231))))

(assert (=> b!753429 (= res!508968 (= lt!335217 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335214 () Unit!25972)

(assert (=> b!753429 (= lt!335214 e!420228)))

(declare-fun c!82617 () Bool)

(assert (=> b!753429 (= c!82617 (= lt!335217 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753430 () Bool)

(declare-fun res!508967 () Bool)

(assert (=> b!753430 (=> (not res!508967) (not e!420231))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!335223 () array!41869)

(declare-datatypes ((SeekEntryResult!7648 0))(
  ( (MissingZero!7648 (index!32960 (_ BitVec 32))) (Found!7648 (index!32961 (_ BitVec 32))) (Intermediate!7648 (undefined!8460 Bool) (index!32962 (_ BitVec 32)) (x!63870 (_ BitVec 32))) (Undefined!7648) (MissingVacant!7648 (index!32963 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41869 (_ BitVec 32)) SeekEntryResult!7648)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41869 (_ BitVec 32)) SeekEntryResult!7648)

(assert (=> b!753430 (= res!508967 (= (seekEntryOrOpen!0 lt!335218 lt!335223 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335218 lt!335223 mask!3328)))))

(declare-fun b!753431 () Bool)

(declare-fun e!420222 () Bool)

(declare-fun e!420230 () Bool)

(assert (=> b!753431 (= e!420222 (not e!420230))))

(declare-fun res!508965 () Bool)

(assert (=> b!753431 (=> res!508965 e!420230)))

(declare-fun lt!335221 () SeekEntryResult!7648)

(assert (=> b!753431 (= res!508965 (or (not (is-Intermediate!7648 lt!335221)) (bvslt x!1131 (x!63870 lt!335221)) (not (= x!1131 (x!63870 lt!335221))) (not (= index!1321 (index!32962 lt!335221)))))))

(declare-fun e!420223 () Bool)

(assert (=> b!753431 e!420223))

(declare-fun res!508970 () Bool)

(assert (=> b!753431 (=> (not res!508970) (not e!420223))))

(declare-fun lt!335224 () SeekEntryResult!7648)

(declare-fun lt!335215 () SeekEntryResult!7648)

(assert (=> b!753431 (= res!508970 (= lt!335224 lt!335215))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!753431 (= lt!335215 (Found!7648 j!159))))

(assert (=> b!753431 (= lt!335224 (seekEntryOrOpen!0 (select (arr!20048 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41869 (_ BitVec 32)) Bool)

(assert (=> b!753431 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335219 () Unit!25972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25972)

(assert (=> b!753431 (= lt!335219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753432 () Bool)

(declare-fun res!508952 () Bool)

(declare-fun e!420225 () Bool)

(assert (=> b!753432 (=> (not res!508952) (not e!420225))))

(assert (=> b!753432 (= res!508952 (and (= (size!20469 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20469 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20469 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753433 () Bool)

(declare-fun res!508956 () Bool)

(assert (=> b!753433 (=> (not res!508956) (not e!420225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753433 (= res!508956 (validKeyInArray!0 (select (arr!20048 a!3186) j!159)))))

(declare-fun b!753434 () Bool)

(declare-fun res!508963 () Bool)

(assert (=> b!753434 (=> (not res!508963) (not e!420229))))

(declare-fun e!420226 () Bool)

(assert (=> b!753434 (= res!508963 e!420226)))

(declare-fun c!82618 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753434 (= c!82618 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753435 () Bool)

(assert (=> b!753435 (= e!420225 e!420232)))

(declare-fun res!508961 () Bool)

(assert (=> b!753435 (=> (not res!508961) (not e!420232))))

(declare-fun lt!335225 () SeekEntryResult!7648)

(assert (=> b!753435 (= res!508961 (or (= lt!335225 (MissingZero!7648 i!1173)) (= lt!335225 (MissingVacant!7648 i!1173))))))

(assert (=> b!753435 (= lt!335225 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!753436 () Bool)

(declare-fun res!508954 () Bool)

(assert (=> b!753436 (=> (not res!508954) (not e!420225))))

(assert (=> b!753436 (= res!508954 (validKeyInArray!0 k!2102))))

(declare-fun b!753438 () Bool)

(assert (=> b!753438 (= e!420226 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20048 a!3186) j!159) a!3186 mask!3328) (Found!7648 j!159)))))

(declare-fun b!753439 () Bool)

(assert (=> b!753439 (= e!420223 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20048 a!3186) j!159) a!3186 mask!3328) lt!335215))))

(declare-fun b!753440 () Bool)

(declare-fun res!508953 () Bool)

(assert (=> b!753440 (=> (not res!508953) (not e!420232))))

(assert (=> b!753440 (= res!508953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753441 () Bool)

(assert (=> b!753441 (= e!420230 e!420233)))

(declare-fun res!508959 () Bool)

(assert (=> b!753441 (=> res!508959 e!420233)))

(declare-fun lt!335216 () SeekEntryResult!7648)

(assert (=> b!753441 (= res!508959 (not (= lt!335216 lt!335215)))))

(assert (=> b!753441 (= lt!335216 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20048 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753442 () Bool)

(declare-fun res!508957 () Bool)

(assert (=> b!753442 (=> (not res!508957) (not e!420232))))

(assert (=> b!753442 (= res!508957 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20469 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20469 a!3186))))))

(declare-fun b!753443 () Bool)

(assert (=> b!753443 (= e!420232 e!420229)))

(declare-fun res!508966 () Bool)

(assert (=> b!753443 (=> (not res!508966) (not e!420229))))

(declare-fun lt!335222 () SeekEntryResult!7648)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41869 (_ BitVec 32)) SeekEntryResult!7648)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753443 (= res!508966 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20048 a!3186) j!159) mask!3328) (select (arr!20048 a!3186) j!159) a!3186 mask!3328) lt!335222))))

(assert (=> b!753443 (= lt!335222 (Intermediate!7648 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753444 () Bool)

(declare-fun Unit!25975 () Unit!25972)

(assert (=> b!753444 (= e!420228 Unit!25975)))

(declare-fun b!753445 () Bool)

(assert (=> b!753445 (= e!420231 (= lt!335224 lt!335216))))

(declare-fun b!753446 () Bool)

(assert (=> b!753446 (= e!420229 e!420222)))

(declare-fun res!508964 () Bool)

(assert (=> b!753446 (=> (not res!508964) (not e!420222))))

(declare-fun lt!335220 () SeekEntryResult!7648)

(assert (=> b!753446 (= res!508964 (= lt!335220 lt!335221))))

(assert (=> b!753446 (= lt!335221 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335218 lt!335223 mask!3328))))

(assert (=> b!753446 (= lt!335220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335218 mask!3328) lt!335218 lt!335223 mask!3328))))

(assert (=> b!753446 (= lt!335218 (select (store (arr!20048 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753446 (= lt!335223 (array!41870 (store (arr!20048 a!3186) i!1173 k!2102) (size!20469 a!3186)))))

(declare-fun b!753447 () Bool)

(declare-fun res!508955 () Bool)

(assert (=> b!753447 (=> (not res!508955) (not e!420225))))

(declare-fun arrayContainsKey!0 (array!41869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753447 (= res!508955 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!508969 () Bool)

(assert (=> start!65696 (=> (not res!508969) (not e!420225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65696 (= res!508969 (validMask!0 mask!3328))))

(assert (=> start!65696 e!420225))

(assert (=> start!65696 true))

(declare-fun array_inv!15844 (array!41869) Bool)

(assert (=> start!65696 (array_inv!15844 a!3186)))

(declare-fun b!753437 () Bool)

(assert (=> b!753437 (= e!420226 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20048 a!3186) j!159) a!3186 mask!3328) lt!335222))))

(assert (= (and start!65696 res!508969) b!753432))

(assert (= (and b!753432 res!508952) b!753433))

(assert (= (and b!753433 res!508956) b!753436))

(assert (= (and b!753436 res!508954) b!753447))

(assert (= (and b!753447 res!508955) b!753435))

(assert (= (and b!753435 res!508961) b!753440))

(assert (= (and b!753440 res!508953) b!753427))

(assert (= (and b!753427 res!508958) b!753442))

(assert (= (and b!753442 res!508957) b!753443))

(assert (= (and b!753443 res!508966) b!753425))

(assert (= (and b!753425 res!508962) b!753434))

(assert (= (and b!753434 c!82618) b!753437))

(assert (= (and b!753434 (not c!82618)) b!753438))

(assert (= (and b!753434 res!508963) b!753446))

(assert (= (and b!753446 res!508964) b!753431))

(assert (= (and b!753431 res!508970) b!753439))

(assert (= (and b!753431 (not res!508965)) b!753441))

(assert (= (and b!753441 (not res!508959)) b!753428))

(assert (= (and b!753428 (not res!508960)) b!753429))

(assert (= (and b!753429 c!82617) b!753426))

(assert (= (and b!753429 (not c!82617)) b!753444))

(assert (= (and b!753429 res!508968) b!753430))

(assert (= (and b!753430 res!508967) b!753445))

(declare-fun m!702123 () Bool)

(assert (=> b!753447 m!702123))

(declare-fun m!702125 () Bool)

(assert (=> start!65696 m!702125))

(declare-fun m!702127 () Bool)

(assert (=> start!65696 m!702127))

(declare-fun m!702129 () Bool)

(assert (=> b!753438 m!702129))

(assert (=> b!753438 m!702129))

(declare-fun m!702131 () Bool)

(assert (=> b!753438 m!702131))

(assert (=> b!753439 m!702129))

(assert (=> b!753439 m!702129))

(declare-fun m!702133 () Bool)

(assert (=> b!753439 m!702133))

(declare-fun m!702135 () Bool)

(assert (=> b!753425 m!702135))

(declare-fun m!702137 () Bool)

(assert (=> b!753440 m!702137))

(declare-fun m!702139 () Bool)

(assert (=> b!753428 m!702139))

(declare-fun m!702141 () Bool)

(assert (=> b!753428 m!702141))

(declare-fun m!702143 () Bool)

(assert (=> b!753436 m!702143))

(assert (=> b!753441 m!702129))

(assert (=> b!753441 m!702129))

(assert (=> b!753441 m!702131))

(declare-fun m!702145 () Bool)

(assert (=> b!753435 m!702145))

(assert (=> b!753443 m!702129))

(assert (=> b!753443 m!702129))

(declare-fun m!702147 () Bool)

(assert (=> b!753443 m!702147))

(assert (=> b!753443 m!702147))

(assert (=> b!753443 m!702129))

(declare-fun m!702149 () Bool)

(assert (=> b!753443 m!702149))

(declare-fun m!702151 () Bool)

(assert (=> b!753430 m!702151))

(declare-fun m!702153 () Bool)

(assert (=> b!753430 m!702153))

(assert (=> b!753431 m!702129))

(assert (=> b!753431 m!702129))

(declare-fun m!702155 () Bool)

(assert (=> b!753431 m!702155))

(declare-fun m!702157 () Bool)

(assert (=> b!753431 m!702157))

(declare-fun m!702159 () Bool)

(assert (=> b!753431 m!702159))

(assert (=> b!753433 m!702129))

(assert (=> b!753433 m!702129))

(declare-fun m!702161 () Bool)

(assert (=> b!753433 m!702161))

(declare-fun m!702163 () Bool)

(assert (=> b!753427 m!702163))

(declare-fun m!702165 () Bool)

(assert (=> b!753446 m!702165))

(declare-fun m!702167 () Bool)

(assert (=> b!753446 m!702167))

(assert (=> b!753446 m!702139))

(assert (=> b!753446 m!702165))

(declare-fun m!702169 () Bool)

(assert (=> b!753446 m!702169))

(declare-fun m!702171 () Bool)

(assert (=> b!753446 m!702171))

(assert (=> b!753437 m!702129))

(assert (=> b!753437 m!702129))

(declare-fun m!702173 () Bool)

(assert (=> b!753437 m!702173))

(push 1)

