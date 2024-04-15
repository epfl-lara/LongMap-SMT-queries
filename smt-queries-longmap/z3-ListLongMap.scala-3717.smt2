; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51086 () Bool)

(assert start!51086)

(declare-fun b!558216 () Bool)

(declare-fun res!350227 () Bool)

(declare-fun e!321554 () Bool)

(assert (=> b!558216 (=> (not res!350227) (not e!321554))))

(declare-datatypes ((array!35149 0))(
  ( (array!35150 (arr!16880 (Array (_ BitVec 32) (_ BitVec 64))) (size!17245 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35149)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558216 (= res!350227 (validKeyInArray!0 (select (arr!16880 a!3118) j!142)))))

(declare-fun b!558217 () Bool)

(declare-fun e!321553 () Bool)

(assert (=> b!558217 (= e!321554 e!321553)))

(declare-fun res!350223 () Bool)

(assert (=> b!558217 (=> (not res!350223) (not e!321553))))

(declare-datatypes ((SeekEntryResult!5326 0))(
  ( (MissingZero!5326 (index!23531 (_ BitVec 32))) (Found!5326 (index!23532 (_ BitVec 32))) (Intermediate!5326 (undefined!6138 Bool) (index!23533 (_ BitVec 32)) (x!52437 (_ BitVec 32))) (Undefined!5326) (MissingVacant!5326 (index!23534 (_ BitVec 32))) )
))
(declare-fun lt!253572 () SeekEntryResult!5326)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558217 (= res!350223 (or (= lt!253572 (MissingZero!5326 i!1132)) (= lt!253572 (MissingVacant!5326 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35149 (_ BitVec 32)) SeekEntryResult!5326)

(assert (=> b!558217 (= lt!253572 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558218 () Bool)

(declare-fun e!321550 () Bool)

(declare-fun e!321551 () Bool)

(assert (=> b!558218 (= e!321550 e!321551)))

(declare-fun res!350231 () Bool)

(assert (=> b!558218 (=> res!350231 e!321551)))

(declare-fun lt!253570 () SeekEntryResult!5326)

(get-info :version)

(assert (=> b!558218 (= res!350231 (or (undefined!6138 lt!253570) (not ((_ is Intermediate!5326) lt!253570)) (= (select (arr!16880 a!3118) (index!23533 lt!253570)) (select (arr!16880 a!3118) j!142)) (= (select (arr!16880 a!3118) (index!23533 lt!253570)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558219 () Bool)

(declare-fun e!321552 () Bool)

(assert (=> b!558219 (= e!321553 e!321552)))

(declare-fun res!350230 () Bool)

(assert (=> b!558219 (=> (not res!350230) (not e!321552))))

(declare-fun lt!253573 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35149 (_ BitVec 32)) SeekEntryResult!5326)

(assert (=> b!558219 (= res!350230 (= lt!253570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253573 (select (store (arr!16880 a!3118) i!1132 k0!1914) j!142) (array!35150 (store (arr!16880 a!3118) i!1132 k0!1914) (size!17245 a!3118)) mask!3119)))))

(declare-fun lt!253568 () (_ BitVec 32))

(assert (=> b!558219 (= lt!253570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253568 (select (arr!16880 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558219 (= lt!253573 (toIndex!0 (select (store (arr!16880 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558219 (= lt!253568 (toIndex!0 (select (arr!16880 a!3118) j!142) mask!3119))))

(declare-fun b!558221 () Bool)

(declare-fun res!350221 () Bool)

(assert (=> b!558221 (=> (not res!350221) (not e!321554))))

(assert (=> b!558221 (= res!350221 (validKeyInArray!0 k0!1914))))

(declare-fun b!558222 () Bool)

(declare-fun res!350222 () Bool)

(assert (=> b!558222 (=> (not res!350222) (not e!321554))))

(declare-fun arrayContainsKey!0 (array!35149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558222 (= res!350222 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558223 () Bool)

(declare-fun res!350229 () Bool)

(assert (=> b!558223 (=> (not res!350229) (not e!321554))))

(assert (=> b!558223 (= res!350229 (and (= (size!17245 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17245 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17245 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558224 () Bool)

(declare-fun lt!253569 () SeekEntryResult!5326)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35149 (_ BitVec 32)) SeekEntryResult!5326)

(assert (=> b!558224 (= e!321551 (= lt!253569 (seekKeyOrZeroReturnVacant!0 (x!52437 lt!253570) (index!23533 lt!253570) (index!23533 lt!253570) (select (arr!16880 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558225 () Bool)

(declare-fun res!350224 () Bool)

(assert (=> b!558225 (=> (not res!350224) (not e!321553))))

(declare-datatypes ((List!10999 0))(
  ( (Nil!10996) (Cons!10995 (h!11989 (_ BitVec 64)) (t!17218 List!10999)) )
))
(declare-fun arrayNoDuplicates!0 (array!35149 (_ BitVec 32) List!10999) Bool)

(assert (=> b!558225 (= res!350224 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10996))))

(declare-fun b!558226 () Bool)

(assert (=> b!558226 (= e!321552 (not true))))

(assert (=> b!558226 e!321550))

(declare-fun res!350226 () Bool)

(assert (=> b!558226 (=> (not res!350226) (not e!321550))))

(assert (=> b!558226 (= res!350226 (= lt!253569 (Found!5326 j!142)))))

(assert (=> b!558226 (= lt!253569 (seekEntryOrOpen!0 (select (arr!16880 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35149 (_ BitVec 32)) Bool)

(assert (=> b!558226 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17412 0))(
  ( (Unit!17413) )
))
(declare-fun lt!253571 () Unit!17412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17412)

(assert (=> b!558226 (= lt!253571 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!350228 () Bool)

(assert (=> start!51086 (=> (not res!350228) (not e!321554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51086 (= res!350228 (validMask!0 mask!3119))))

(assert (=> start!51086 e!321554))

(assert (=> start!51086 true))

(declare-fun array_inv!12763 (array!35149) Bool)

(assert (=> start!51086 (array_inv!12763 a!3118)))

(declare-fun b!558220 () Bool)

(declare-fun res!350225 () Bool)

(assert (=> b!558220 (=> (not res!350225) (not e!321553))))

(assert (=> b!558220 (= res!350225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51086 res!350228) b!558223))

(assert (= (and b!558223 res!350229) b!558216))

(assert (= (and b!558216 res!350227) b!558221))

(assert (= (and b!558221 res!350221) b!558222))

(assert (= (and b!558222 res!350222) b!558217))

(assert (= (and b!558217 res!350223) b!558220))

(assert (= (and b!558220 res!350225) b!558225))

(assert (= (and b!558225 res!350224) b!558219))

(assert (= (and b!558219 res!350230) b!558226))

(assert (= (and b!558226 res!350226) b!558218))

(assert (= (and b!558218 (not res!350231)) b!558224))

(declare-fun m!535703 () Bool)

(assert (=> b!558224 m!535703))

(assert (=> b!558224 m!535703))

(declare-fun m!535705 () Bool)

(assert (=> b!558224 m!535705))

(declare-fun m!535707 () Bool)

(assert (=> b!558221 m!535707))

(declare-fun m!535709 () Bool)

(assert (=> b!558225 m!535709))

(declare-fun m!535711 () Bool)

(assert (=> b!558222 m!535711))

(declare-fun m!535713 () Bool)

(assert (=> start!51086 m!535713))

(declare-fun m!535715 () Bool)

(assert (=> start!51086 m!535715))

(declare-fun m!535717 () Bool)

(assert (=> b!558217 m!535717))

(declare-fun m!535719 () Bool)

(assert (=> b!558218 m!535719))

(assert (=> b!558218 m!535703))

(declare-fun m!535721 () Bool)

(assert (=> b!558220 m!535721))

(assert (=> b!558226 m!535703))

(assert (=> b!558226 m!535703))

(declare-fun m!535723 () Bool)

(assert (=> b!558226 m!535723))

(declare-fun m!535725 () Bool)

(assert (=> b!558226 m!535725))

(declare-fun m!535727 () Bool)

(assert (=> b!558226 m!535727))

(assert (=> b!558216 m!535703))

(assert (=> b!558216 m!535703))

(declare-fun m!535729 () Bool)

(assert (=> b!558216 m!535729))

(assert (=> b!558219 m!535703))

(declare-fun m!535731 () Bool)

(assert (=> b!558219 m!535731))

(assert (=> b!558219 m!535703))

(declare-fun m!535733 () Bool)

(assert (=> b!558219 m!535733))

(declare-fun m!535735 () Bool)

(assert (=> b!558219 m!535735))

(declare-fun m!535737 () Bool)

(assert (=> b!558219 m!535737))

(assert (=> b!558219 m!535703))

(assert (=> b!558219 m!535735))

(declare-fun m!535739 () Bool)

(assert (=> b!558219 m!535739))

(assert (=> b!558219 m!535735))

(declare-fun m!535741 () Bool)

(assert (=> b!558219 m!535741))

(check-sat (not b!558226) (not b!558224) (not b!558225) (not start!51086) (not b!558216) (not b!558220) (not b!558222) (not b!558221) (not b!558219) (not b!558217))
(check-sat)
