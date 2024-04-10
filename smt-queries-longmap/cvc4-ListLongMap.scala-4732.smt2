; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65456 () Bool)

(assert start!65456)

(declare-fun b!745771 () Bool)

(declare-fun res!502619 () Bool)

(declare-fun e!416510 () Bool)

(assert (=> b!745771 (=> (not res!502619) (not e!416510))))

(declare-datatypes ((array!41629 0))(
  ( (array!41630 (arr!19928 (Array (_ BitVec 32) (_ BitVec 64))) (size!20349 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41629)

(declare-datatypes ((List!13930 0))(
  ( (Nil!13927) (Cons!13926 (h!14998 (_ BitVec 64)) (t!20245 List!13930)) )
))
(declare-fun arrayNoDuplicates!0 (array!41629 (_ BitVec 32) List!13930) Bool)

(assert (=> b!745771 (= res!502619 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13927))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7528 0))(
  ( (MissingZero!7528 (index!32480 (_ BitVec 32))) (Found!7528 (index!32481 (_ BitVec 32))) (Intermediate!7528 (undefined!8340 Bool) (index!32482 (_ BitVec 32)) (x!63430 (_ BitVec 32))) (Undefined!7528) (MissingVacant!7528 (index!32483 (_ BitVec 32))) )
))
(declare-fun lt!331352 () SeekEntryResult!7528)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!416512 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!745772 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41629 (_ BitVec 32)) SeekEntryResult!7528)

(assert (=> b!745772 (= e!416512 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19928 a!3186) j!159) a!3186 mask!3328) lt!331352))))

(declare-fun b!745773 () Bool)

(declare-fun e!416515 () Bool)

(assert (=> b!745773 (= e!416510 e!416515)))

(declare-fun res!502616 () Bool)

(assert (=> b!745773 (=> (not res!502616) (not e!416515))))

(declare-fun lt!331348 () SeekEntryResult!7528)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41629 (_ BitVec 32)) SeekEntryResult!7528)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745773 (= res!502616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19928 a!3186) j!159) mask!3328) (select (arr!19928 a!3186) j!159) a!3186 mask!3328) lt!331348))))

(assert (=> b!745773 (= lt!331348 (Intermediate!7528 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745774 () Bool)

(declare-fun e!416508 () Bool)

(assert (=> b!745774 (= e!416508 e!416510)))

(declare-fun res!502615 () Bool)

(assert (=> b!745774 (=> (not res!502615) (not e!416510))))

(declare-fun lt!331350 () SeekEntryResult!7528)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745774 (= res!502615 (or (= lt!331350 (MissingZero!7528 i!1173)) (= lt!331350 (MissingVacant!7528 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41629 (_ BitVec 32)) SeekEntryResult!7528)

(assert (=> b!745774 (= lt!331350 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!745775 () Bool)

(declare-fun e!416509 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!745775 (= e!416509 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19928 a!3186) j!159) a!3186 mask!3328) (Found!7528 j!159)))))

(declare-fun b!745776 () Bool)

(declare-fun res!502610 () Bool)

(assert (=> b!745776 (=> (not res!502610) (not e!416508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745776 (= res!502610 (validKeyInArray!0 k!2102))))

(declare-fun b!745777 () Bool)

(declare-fun res!502614 () Bool)

(assert (=> b!745777 (=> (not res!502614) (not e!416508))))

(assert (=> b!745777 (= res!502614 (validKeyInArray!0 (select (arr!19928 a!3186) j!159)))))

(declare-fun b!745778 () Bool)

(assert (=> b!745778 (= e!416509 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19928 a!3186) j!159) a!3186 mask!3328) lt!331348))))

(declare-fun b!745779 () Bool)

(declare-fun e!416513 () Bool)

(declare-fun e!416514 () Bool)

(assert (=> b!745779 (= e!416513 e!416514)))

(declare-fun res!502617 () Bool)

(assert (=> b!745779 (=> res!502617 e!416514)))

(declare-fun lt!331353 () (_ BitVec 64))

(declare-fun lt!331351 () SeekEntryResult!7528)

(assert (=> b!745779 (= res!502617 (or (not (= lt!331351 lt!331352)) (= (select (store (arr!19928 a!3186) i!1173 k!2102) index!1321) lt!331353) (not (= (select (store (arr!19928 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!745779 (= lt!331351 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19928 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745780 () Bool)

(declare-fun res!502624 () Bool)

(assert (=> b!745780 (=> (not res!502624) (not e!416508))))

(assert (=> b!745780 (= res!502624 (and (= (size!20349 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20349 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20349 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745781 () Bool)

(declare-fun e!416516 () Bool)

(assert (=> b!745781 (= e!416515 e!416516)))

(declare-fun res!502620 () Bool)

(assert (=> b!745781 (=> (not res!502620) (not e!416516))))

(declare-fun lt!331349 () SeekEntryResult!7528)

(declare-fun lt!331355 () SeekEntryResult!7528)

(assert (=> b!745781 (= res!502620 (= lt!331349 lt!331355))))

(declare-fun lt!331347 () array!41629)

(assert (=> b!745781 (= lt!331355 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331353 lt!331347 mask!3328))))

(assert (=> b!745781 (= lt!331349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331353 mask!3328) lt!331353 lt!331347 mask!3328))))

(assert (=> b!745781 (= lt!331353 (select (store (arr!19928 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745781 (= lt!331347 (array!41630 (store (arr!19928 a!3186) i!1173 k!2102) (size!20349 a!3186)))))

(declare-fun b!745782 () Bool)

(assert (=> b!745782 (= e!416516 (not e!416513))))

(declare-fun res!502612 () Bool)

(assert (=> b!745782 (=> res!502612 e!416513)))

(assert (=> b!745782 (= res!502612 (or (not (is-Intermediate!7528 lt!331355)) (bvslt x!1131 (x!63430 lt!331355)) (not (= x!1131 (x!63430 lt!331355))) (not (= index!1321 (index!32482 lt!331355)))))))

(assert (=> b!745782 e!416512))

(declare-fun res!502623 () Bool)

(assert (=> b!745782 (=> (not res!502623) (not e!416512))))

(declare-fun lt!331346 () SeekEntryResult!7528)

(assert (=> b!745782 (= res!502623 (= lt!331346 lt!331352))))

(assert (=> b!745782 (= lt!331352 (Found!7528 j!159))))

(assert (=> b!745782 (= lt!331346 (seekEntryOrOpen!0 (select (arr!19928 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41629 (_ BitVec 32)) Bool)

(assert (=> b!745782 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25536 0))(
  ( (Unit!25537) )
))
(declare-fun lt!331354 () Unit!25536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25536)

(assert (=> b!745782 (= lt!331354 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745783 () Bool)

(declare-fun res!502621 () Bool)

(assert (=> b!745783 (=> (not res!502621) (not e!416510))))

(assert (=> b!745783 (= res!502621 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20349 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20349 a!3186))))))

(declare-fun b!745784 () Bool)

(declare-fun res!502613 () Bool)

(assert (=> b!745784 (=> (not res!502613) (not e!416510))))

(assert (=> b!745784 (= res!502613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745786 () Bool)

(assert (=> b!745786 (= e!416514 true)))

(assert (=> b!745786 (= lt!331346 lt!331351)))

(declare-fun b!745787 () Bool)

(declare-fun res!502618 () Bool)

(assert (=> b!745787 (=> (not res!502618) (not e!416515))))

(assert (=> b!745787 (= res!502618 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19928 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745788 () Bool)

(declare-fun res!502622 () Bool)

(assert (=> b!745788 (=> (not res!502622) (not e!416508))))

(declare-fun arrayContainsKey!0 (array!41629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745788 (= res!502622 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745785 () Bool)

(declare-fun res!502611 () Bool)

(assert (=> b!745785 (=> (not res!502611) (not e!416515))))

(assert (=> b!745785 (= res!502611 e!416509)))

(declare-fun c!81961 () Bool)

(assert (=> b!745785 (= c!81961 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!502625 () Bool)

(assert (=> start!65456 (=> (not res!502625) (not e!416508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65456 (= res!502625 (validMask!0 mask!3328))))

(assert (=> start!65456 e!416508))

(assert (=> start!65456 true))

(declare-fun array_inv!15724 (array!41629) Bool)

(assert (=> start!65456 (array_inv!15724 a!3186)))

(assert (= (and start!65456 res!502625) b!745780))

(assert (= (and b!745780 res!502624) b!745777))

(assert (= (and b!745777 res!502614) b!745776))

(assert (= (and b!745776 res!502610) b!745788))

(assert (= (and b!745788 res!502622) b!745774))

(assert (= (and b!745774 res!502615) b!745784))

(assert (= (and b!745784 res!502613) b!745771))

(assert (= (and b!745771 res!502619) b!745783))

(assert (= (and b!745783 res!502621) b!745773))

(assert (= (and b!745773 res!502616) b!745787))

(assert (= (and b!745787 res!502618) b!745785))

(assert (= (and b!745785 c!81961) b!745778))

(assert (= (and b!745785 (not c!81961)) b!745775))

(assert (= (and b!745785 res!502611) b!745781))

(assert (= (and b!745781 res!502620) b!745782))

(assert (= (and b!745782 res!502623) b!745772))

(assert (= (and b!745782 (not res!502612)) b!745779))

(assert (= (and b!745779 (not res!502617)) b!745786))

(declare-fun m!696103 () Bool)

(assert (=> b!745777 m!696103))

(assert (=> b!745777 m!696103))

(declare-fun m!696105 () Bool)

(assert (=> b!745777 m!696105))

(declare-fun m!696107 () Bool)

(assert (=> b!745776 m!696107))

(assert (=> b!745773 m!696103))

(assert (=> b!745773 m!696103))

(declare-fun m!696109 () Bool)

(assert (=> b!745773 m!696109))

(assert (=> b!745773 m!696109))

(assert (=> b!745773 m!696103))

(declare-fun m!696111 () Bool)

(assert (=> b!745773 m!696111))

(assert (=> b!745772 m!696103))

(assert (=> b!745772 m!696103))

(declare-fun m!696113 () Bool)

(assert (=> b!745772 m!696113))

(declare-fun m!696115 () Bool)

(assert (=> b!745771 m!696115))

(declare-fun m!696117 () Bool)

(assert (=> b!745784 m!696117))

(assert (=> b!745775 m!696103))

(assert (=> b!745775 m!696103))

(declare-fun m!696119 () Bool)

(assert (=> b!745775 m!696119))

(declare-fun m!696121 () Bool)

(assert (=> b!745774 m!696121))

(assert (=> b!745778 m!696103))

(assert (=> b!745778 m!696103))

(declare-fun m!696123 () Bool)

(assert (=> b!745778 m!696123))

(declare-fun m!696125 () Bool)

(assert (=> b!745788 m!696125))

(declare-fun m!696127 () Bool)

(assert (=> start!65456 m!696127))

(declare-fun m!696129 () Bool)

(assert (=> start!65456 m!696129))

(declare-fun m!696131 () Bool)

(assert (=> b!745781 m!696131))

(declare-fun m!696133 () Bool)

(assert (=> b!745781 m!696133))

(declare-fun m!696135 () Bool)

(assert (=> b!745781 m!696135))

(declare-fun m!696137 () Bool)

(assert (=> b!745781 m!696137))

(declare-fun m!696139 () Bool)

(assert (=> b!745781 m!696139))

(assert (=> b!745781 m!696131))

(assert (=> b!745782 m!696103))

(assert (=> b!745782 m!696103))

(declare-fun m!696141 () Bool)

(assert (=> b!745782 m!696141))

(declare-fun m!696143 () Bool)

(assert (=> b!745782 m!696143))

(declare-fun m!696145 () Bool)

(assert (=> b!745782 m!696145))

(declare-fun m!696147 () Bool)

(assert (=> b!745787 m!696147))

(assert (=> b!745779 m!696135))

(declare-fun m!696149 () Bool)

(assert (=> b!745779 m!696149))

(assert (=> b!745779 m!696103))

(assert (=> b!745779 m!696103))

(assert (=> b!745779 m!696119))

(push 1)

