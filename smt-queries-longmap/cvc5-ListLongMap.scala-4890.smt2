; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67452 () Bool)

(assert start!67452)

(declare-fun b!780232 () Bool)

(declare-fun res!527861 () Bool)

(declare-fun e!434046 () Bool)

(assert (=> b!780232 (=> (not res!527861) (not e!434046))))

(declare-datatypes ((array!42618 0))(
  ( (array!42619 (arr!20400 (Array (_ BitVec 32) (_ BitVec 64))) (size!20821 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42618)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780232 (= res!527861 (validKeyInArray!0 (select (arr!20400 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8000 0))(
  ( (MissingZero!8000 (index!34368 (_ BitVec 32))) (Found!8000 (index!34369 (_ BitVec 32))) (Intermediate!8000 (undefined!8812 Bool) (index!34370 (_ BitVec 32)) (x!65322 (_ BitVec 32))) (Undefined!8000) (MissingVacant!8000 (index!34371 (_ BitVec 32))) )
))
(declare-fun lt!347680 () SeekEntryResult!8000)

(declare-fun e!434049 () Bool)

(declare-fun b!780233 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42618 (_ BitVec 32)) SeekEntryResult!8000)

(assert (=> b!780233 (= e!434049 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20400 a!3186) j!159) a!3186 mask!3328) lt!347680))))

(declare-fun b!780234 () Bool)

(declare-fun e!434048 () Bool)

(declare-fun e!434045 () Bool)

(assert (=> b!780234 (= e!434048 e!434045)))

(declare-fun res!527865 () Bool)

(assert (=> b!780234 (=> (not res!527865) (not e!434045))))

(declare-fun lt!347683 () SeekEntryResult!8000)

(declare-fun lt!347684 () SeekEntryResult!8000)

(assert (=> b!780234 (= res!527865 (= lt!347683 lt!347684))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!347677 () (_ BitVec 64))

(declare-fun lt!347675 () array!42618)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42618 (_ BitVec 32)) SeekEntryResult!8000)

(assert (=> b!780234 (= lt!347684 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347677 lt!347675 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780234 (= lt!347683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347677 mask!3328) lt!347677 lt!347675 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!780234 (= lt!347677 (select (store (arr!20400 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!780234 (= lt!347675 (array!42619 (store (arr!20400 a!3186) i!1173 k!2102) (size!20821 a!3186)))))

(declare-fun b!780236 () Bool)

(declare-fun e!434051 () Bool)

(assert (=> b!780236 (= e!434046 e!434051)))

(declare-fun res!527862 () Bool)

(assert (=> b!780236 (=> (not res!527862) (not e!434051))))

(declare-fun lt!347682 () SeekEntryResult!8000)

(assert (=> b!780236 (= res!527862 (or (= lt!347682 (MissingZero!8000 i!1173)) (= lt!347682 (MissingVacant!8000 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42618 (_ BitVec 32)) SeekEntryResult!8000)

(assert (=> b!780236 (= lt!347682 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!780237 () Bool)

(declare-fun e!434047 () Bool)

(assert (=> b!780237 (= e!434045 (not e!434047))))

(declare-fun res!527858 () Bool)

(assert (=> b!780237 (=> res!527858 e!434047)))

(assert (=> b!780237 (= res!527858 (or (not (is-Intermediate!8000 lt!347684)) (bvslt x!1131 (x!65322 lt!347684)) (not (= x!1131 (x!65322 lt!347684))) (not (= index!1321 (index!34370 lt!347684)))))))

(assert (=> b!780237 e!434049))

(declare-fun res!527857 () Bool)

(assert (=> b!780237 (=> (not res!527857) (not e!434049))))

(declare-fun lt!347678 () SeekEntryResult!8000)

(assert (=> b!780237 (= res!527857 (= lt!347678 lt!347680))))

(assert (=> b!780237 (= lt!347680 (Found!8000 j!159))))

(assert (=> b!780237 (= lt!347678 (seekEntryOrOpen!0 (select (arr!20400 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42618 (_ BitVec 32)) Bool)

(assert (=> b!780237 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26894 0))(
  ( (Unit!26895) )
))
(declare-fun lt!347681 () Unit!26894)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26894)

(assert (=> b!780237 (= lt!347681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780238 () Bool)

(declare-fun res!527859 () Bool)

(assert (=> b!780238 (=> (not res!527859) (not e!434048))))

(declare-fun e!434044 () Bool)

(assert (=> b!780238 (= res!527859 e!434044)))

(declare-fun c!86593 () Bool)

(assert (=> b!780238 (= c!86593 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780239 () Bool)

(declare-fun e!434050 () Bool)

(assert (=> b!780239 (= e!434050 false)))

(declare-fun lt!347679 () SeekEntryResult!8000)

(assert (=> b!780239 (and (= lt!347678 lt!347679) (= lt!347679 (MissingVacant!8000 resIntermediateIndex!5)))))

(declare-fun b!780240 () Bool)

(assert (=> b!780240 (= e!434051 e!434048)))

(declare-fun res!527860 () Bool)

(assert (=> b!780240 (=> (not res!527860) (not e!434048))))

(declare-fun lt!347676 () SeekEntryResult!8000)

(assert (=> b!780240 (= res!527860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20400 a!3186) j!159) mask!3328) (select (arr!20400 a!3186) j!159) a!3186 mask!3328) lt!347676))))

(assert (=> b!780240 (= lt!347676 (Intermediate!8000 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780241 () Bool)

(declare-fun res!527855 () Bool)

(assert (=> b!780241 (=> (not res!527855) (not e!434046))))

(declare-fun arrayContainsKey!0 (array!42618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780241 (= res!527855 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780235 () Bool)

(assert (=> b!780235 (= e!434044 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20400 a!3186) j!159) a!3186 mask!3328) lt!347676))))

(declare-fun res!527868 () Bool)

(assert (=> start!67452 (=> (not res!527868) (not e!434046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67452 (= res!527868 (validMask!0 mask!3328))))

(assert (=> start!67452 e!434046))

(assert (=> start!67452 true))

(declare-fun array_inv!16196 (array!42618) Bool)

(assert (=> start!67452 (array_inv!16196 a!3186)))

(declare-fun b!780242 () Bool)

(declare-fun res!527864 () Bool)

(assert (=> b!780242 (=> (not res!527864) (not e!434048))))

(assert (=> b!780242 (= res!527864 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20400 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780243 () Bool)

(assert (=> b!780243 (= e!434044 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20400 a!3186) j!159) a!3186 mask!3328) (Found!8000 j!159)))))

(declare-fun b!780244 () Bool)

(declare-fun res!527867 () Bool)

(assert (=> b!780244 (=> (not res!527867) (not e!434051))))

(assert (=> b!780244 (= res!527867 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20821 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20821 a!3186))))))

(declare-fun b!780245 () Bool)

(declare-fun res!527866 () Bool)

(assert (=> b!780245 (=> (not res!527866) (not e!434046))))

(assert (=> b!780245 (= res!527866 (and (= (size!20821 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20821 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20821 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780246 () Bool)

(declare-fun res!527869 () Bool)

(assert (=> b!780246 (=> (not res!527869) (not e!434046))))

(assert (=> b!780246 (= res!527869 (validKeyInArray!0 k!2102))))

(declare-fun b!780247 () Bool)

(assert (=> b!780247 (= e!434047 e!434050)))

(declare-fun res!527870 () Bool)

(assert (=> b!780247 (=> res!527870 e!434050)))

(assert (=> b!780247 (= res!527870 (or (not (= lt!347679 lt!347680)) (= (select (store (arr!20400 a!3186) i!1173 k!2102) index!1321) lt!347677) (not (= (select (store (arr!20400 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780247 (= lt!347679 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20400 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780248 () Bool)

(declare-fun res!527863 () Bool)

(assert (=> b!780248 (=> (not res!527863) (not e!434051))))

(assert (=> b!780248 (= res!527863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780249 () Bool)

(declare-fun res!527856 () Bool)

(assert (=> b!780249 (=> (not res!527856) (not e!434051))))

(declare-datatypes ((List!14402 0))(
  ( (Nil!14399) (Cons!14398 (h!15515 (_ BitVec 64)) (t!20717 List!14402)) )
))
(declare-fun arrayNoDuplicates!0 (array!42618 (_ BitVec 32) List!14402) Bool)

(assert (=> b!780249 (= res!527856 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14399))))

(assert (= (and start!67452 res!527868) b!780245))

(assert (= (and b!780245 res!527866) b!780232))

(assert (= (and b!780232 res!527861) b!780246))

(assert (= (and b!780246 res!527869) b!780241))

(assert (= (and b!780241 res!527855) b!780236))

(assert (= (and b!780236 res!527862) b!780248))

(assert (= (and b!780248 res!527863) b!780249))

(assert (= (and b!780249 res!527856) b!780244))

(assert (= (and b!780244 res!527867) b!780240))

(assert (= (and b!780240 res!527860) b!780242))

(assert (= (and b!780242 res!527864) b!780238))

(assert (= (and b!780238 c!86593) b!780235))

(assert (= (and b!780238 (not c!86593)) b!780243))

(assert (= (and b!780238 res!527859) b!780234))

(assert (= (and b!780234 res!527865) b!780237))

(assert (= (and b!780237 res!527857) b!780233))

(assert (= (and b!780237 (not res!527858)) b!780247))

(assert (= (and b!780247 (not res!527870)) b!780239))

(declare-fun m!723569 () Bool)

(assert (=> b!780249 m!723569))

(declare-fun m!723571 () Bool)

(assert (=> b!780242 m!723571))

(declare-fun m!723573 () Bool)

(assert (=> b!780233 m!723573))

(assert (=> b!780233 m!723573))

(declare-fun m!723575 () Bool)

(assert (=> b!780233 m!723575))

(assert (=> b!780232 m!723573))

(assert (=> b!780232 m!723573))

(declare-fun m!723577 () Bool)

(assert (=> b!780232 m!723577))

(declare-fun m!723579 () Bool)

(assert (=> start!67452 m!723579))

(declare-fun m!723581 () Bool)

(assert (=> start!67452 m!723581))

(declare-fun m!723583 () Bool)

(assert (=> b!780236 m!723583))

(assert (=> b!780240 m!723573))

(assert (=> b!780240 m!723573))

(declare-fun m!723585 () Bool)

(assert (=> b!780240 m!723585))

(assert (=> b!780240 m!723585))

(assert (=> b!780240 m!723573))

(declare-fun m!723587 () Bool)

(assert (=> b!780240 m!723587))

(declare-fun m!723589 () Bool)

(assert (=> b!780234 m!723589))

(declare-fun m!723591 () Bool)

(assert (=> b!780234 m!723591))

(declare-fun m!723593 () Bool)

(assert (=> b!780234 m!723593))

(declare-fun m!723595 () Bool)

(assert (=> b!780234 m!723595))

(assert (=> b!780234 m!723591))

(declare-fun m!723597 () Bool)

(assert (=> b!780234 m!723597))

(declare-fun m!723599 () Bool)

(assert (=> b!780248 m!723599))

(assert (=> b!780235 m!723573))

(assert (=> b!780235 m!723573))

(declare-fun m!723601 () Bool)

(assert (=> b!780235 m!723601))

(assert (=> b!780243 m!723573))

(assert (=> b!780243 m!723573))

(declare-fun m!723603 () Bool)

(assert (=> b!780243 m!723603))

(declare-fun m!723605 () Bool)

(assert (=> b!780241 m!723605))

(assert (=> b!780247 m!723593))

(declare-fun m!723607 () Bool)

(assert (=> b!780247 m!723607))

(assert (=> b!780247 m!723573))

(assert (=> b!780247 m!723573))

(assert (=> b!780247 m!723603))

(declare-fun m!723609 () Bool)

(assert (=> b!780246 m!723609))

(assert (=> b!780237 m!723573))

(assert (=> b!780237 m!723573))

(declare-fun m!723611 () Bool)

(assert (=> b!780237 m!723611))

(declare-fun m!723613 () Bool)

(assert (=> b!780237 m!723613))

(declare-fun m!723615 () Bool)

(assert (=> b!780237 m!723615))

(push 1)

