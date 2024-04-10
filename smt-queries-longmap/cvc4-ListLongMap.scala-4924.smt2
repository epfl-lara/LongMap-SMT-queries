; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67792 () Bool)

(assert start!67792)

(declare-fun b!788036 () Bool)

(declare-fun res!533823 () Bool)

(declare-fun e!438017 () Bool)

(assert (=> b!788036 (=> (not res!533823) (not e!438017))))

(declare-datatypes ((array!42832 0))(
  ( (array!42833 (arr!20504 (Array (_ BitVec 32) (_ BitVec 64))) (size!20925 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42832)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788036 (= res!533823 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!788037 () Bool)

(declare-fun e!438012 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8104 0))(
  ( (MissingZero!8104 (index!34784 (_ BitVec 32))) (Found!8104 (index!34785 (_ BitVec 32))) (Intermediate!8104 (undefined!8916 Bool) (index!34786 (_ BitVec 32)) (x!65716 (_ BitVec 32))) (Undefined!8104) (MissingVacant!8104 (index!34787 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42832 (_ BitVec 32)) SeekEntryResult!8104)

(assert (=> b!788037 (= e!438012 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20504 a!3186) j!159) a!3186 mask!3328) (Found!8104 j!159)))))

(declare-fun b!788038 () Bool)

(declare-datatypes ((Unit!27304 0))(
  ( (Unit!27305) )
))
(declare-fun e!438020 () Unit!27304)

(declare-fun Unit!27306 () Unit!27304)

(assert (=> b!788038 (= e!438020 Unit!27306)))

(declare-fun b!788039 () Bool)

(declare-fun e!438019 () Bool)

(declare-fun lt!351570 () SeekEntryResult!8104)

(declare-fun lt!351571 () SeekEntryResult!8104)

(assert (=> b!788039 (= e!438019 (= lt!351570 lt!351571))))

(declare-fun b!788040 () Bool)

(declare-fun e!438009 () Bool)

(declare-fun e!438015 () Bool)

(assert (=> b!788040 (= e!438009 e!438015)))

(declare-fun res!533817 () Bool)

(assert (=> b!788040 (=> (not res!533817) (not e!438015))))

(declare-fun lt!351565 () SeekEntryResult!8104)

(declare-fun lt!351568 () SeekEntryResult!8104)

(assert (=> b!788040 (= res!533817 (= lt!351565 lt!351568))))

(declare-fun lt!351563 () (_ BitVec 64))

(declare-fun lt!351566 () array!42832)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42832 (_ BitVec 32)) SeekEntryResult!8104)

(assert (=> b!788040 (= lt!351568 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351563 lt!351566 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788040 (= lt!351565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351563 mask!3328) lt!351563 lt!351566 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788040 (= lt!351563 (select (store (arr!20504 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!788040 (= lt!351566 (array!42833 (store (arr!20504 a!3186) i!1173 k!2102) (size!20925 a!3186)))))

(declare-fun b!788041 () Bool)

(declare-fun e!438013 () Bool)

(assert (=> b!788041 (= e!438017 e!438013)))

(declare-fun res!533824 () Bool)

(assert (=> b!788041 (=> (not res!533824) (not e!438013))))

(declare-fun lt!351564 () SeekEntryResult!8104)

(assert (=> b!788041 (= res!533824 (or (= lt!351564 (MissingZero!8104 i!1173)) (= lt!351564 (MissingVacant!8104 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42832 (_ BitVec 32)) SeekEntryResult!8104)

(assert (=> b!788041 (= lt!351564 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!788042 () Bool)

(declare-fun res!533812 () Bool)

(assert (=> b!788042 (=> (not res!533812) (not e!438019))))

(assert (=> b!788042 (= res!533812 (= (seekEntryOrOpen!0 lt!351563 lt!351566 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351563 lt!351566 mask!3328)))))

(declare-fun b!788043 () Bool)

(declare-fun res!533815 () Bool)

(assert (=> b!788043 (=> (not res!533815) (not e!438009))))

(assert (=> b!788043 (= res!533815 e!438012)))

(declare-fun c!87523 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788043 (= c!87523 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788044 () Bool)

(declare-fun lt!351567 () SeekEntryResult!8104)

(declare-fun e!438010 () Bool)

(assert (=> b!788044 (= e!438010 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20504 a!3186) j!159) a!3186 mask!3328) lt!351567))))

(declare-fun b!788045 () Bool)

(declare-fun res!533825 () Bool)

(assert (=> b!788045 (=> (not res!533825) (not e!438017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788045 (= res!533825 (validKeyInArray!0 k!2102))))

(declare-fun b!788046 () Bool)

(declare-fun res!533820 () Bool)

(assert (=> b!788046 (=> (not res!533820) (not e!438017))))

(assert (=> b!788046 (= res!533820 (validKeyInArray!0 (select (arr!20504 a!3186) j!159)))))

(declare-fun b!788047 () Bool)

(declare-fun e!438018 () Bool)

(assert (=> b!788047 (= e!438015 (not e!438018))))

(declare-fun res!533821 () Bool)

(assert (=> b!788047 (=> res!533821 e!438018)))

(assert (=> b!788047 (= res!533821 (or (not (is-Intermediate!8104 lt!351568)) (bvslt x!1131 (x!65716 lt!351568)) (not (= x!1131 (x!65716 lt!351568))) (not (= index!1321 (index!34786 lt!351568)))))))

(assert (=> b!788047 e!438010))

(declare-fun res!533811 () Bool)

(assert (=> b!788047 (=> (not res!533811) (not e!438010))))

(assert (=> b!788047 (= res!533811 (= lt!351570 lt!351567))))

(assert (=> b!788047 (= lt!351567 (Found!8104 j!159))))

(assert (=> b!788047 (= lt!351570 (seekEntryOrOpen!0 (select (arr!20504 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42832 (_ BitVec 32)) Bool)

(assert (=> b!788047 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351562 () Unit!27304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27304)

(assert (=> b!788047 (= lt!351562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!351572 () SeekEntryResult!8104)

(declare-fun b!788048 () Bool)

(assert (=> b!788048 (= e!438012 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20504 a!3186) j!159) a!3186 mask!3328) lt!351572))))

(declare-fun b!788049 () Bool)

(declare-fun res!533808 () Bool)

(assert (=> b!788049 (=> (not res!533808) (not e!438013))))

(assert (=> b!788049 (= res!533808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788050 () Bool)

(declare-fun e!438014 () Bool)

(assert (=> b!788050 (= e!438014 true)))

(assert (=> b!788050 e!438019))

(declare-fun res!533818 () Bool)

(assert (=> b!788050 (=> (not res!533818) (not e!438019))))

(declare-fun lt!351561 () (_ BitVec 64))

(assert (=> b!788050 (= res!533818 (= lt!351561 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351569 () Unit!27304)

(assert (=> b!788050 (= lt!351569 e!438020)))

(declare-fun c!87522 () Bool)

(assert (=> b!788050 (= c!87522 (= lt!351561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788051 () Bool)

(declare-fun res!533814 () Bool)

(assert (=> b!788051 (=> (not res!533814) (not e!438009))))

(assert (=> b!788051 (= res!533814 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20504 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788052 () Bool)

(declare-fun res!533810 () Bool)

(assert (=> b!788052 (=> (not res!533810) (not e!438017))))

(assert (=> b!788052 (= res!533810 (and (= (size!20925 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20925 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20925 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788053 () Bool)

(declare-fun e!438011 () Bool)

(assert (=> b!788053 (= e!438011 e!438014)))

(declare-fun res!533816 () Bool)

(assert (=> b!788053 (=> res!533816 e!438014)))

(assert (=> b!788053 (= res!533816 (= lt!351561 lt!351563))))

(assert (=> b!788053 (= lt!351561 (select (store (arr!20504 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!788054 () Bool)

(declare-fun res!533819 () Bool)

(assert (=> b!788054 (=> (not res!533819) (not e!438013))))

(assert (=> b!788054 (= res!533819 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20925 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20925 a!3186))))))

(declare-fun b!788055 () Bool)

(assert (=> b!788055 (= e!438018 e!438011)))

(declare-fun res!533809 () Bool)

(assert (=> b!788055 (=> res!533809 e!438011)))

(assert (=> b!788055 (= res!533809 (not (= lt!351571 lt!351567)))))

(assert (=> b!788055 (= lt!351571 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20504 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788056 () Bool)

(assert (=> b!788056 (= e!438013 e!438009)))

(declare-fun res!533813 () Bool)

(assert (=> b!788056 (=> (not res!533813) (not e!438009))))

(assert (=> b!788056 (= res!533813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20504 a!3186) j!159) mask!3328) (select (arr!20504 a!3186) j!159) a!3186 mask!3328) lt!351572))))

(assert (=> b!788056 (= lt!351572 (Intermediate!8104 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788058 () Bool)

(declare-fun res!533822 () Bool)

(assert (=> b!788058 (=> (not res!533822) (not e!438013))))

(declare-datatypes ((List!14506 0))(
  ( (Nil!14503) (Cons!14502 (h!15625 (_ BitVec 64)) (t!20821 List!14506)) )
))
(declare-fun arrayNoDuplicates!0 (array!42832 (_ BitVec 32) List!14506) Bool)

(assert (=> b!788058 (= res!533822 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14503))))

(declare-fun res!533807 () Bool)

(assert (=> start!67792 (=> (not res!533807) (not e!438017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67792 (= res!533807 (validMask!0 mask!3328))))

(assert (=> start!67792 e!438017))

(assert (=> start!67792 true))

(declare-fun array_inv!16300 (array!42832) Bool)

(assert (=> start!67792 (array_inv!16300 a!3186)))

(declare-fun b!788057 () Bool)

(declare-fun Unit!27307 () Unit!27304)

(assert (=> b!788057 (= e!438020 Unit!27307)))

(assert (=> b!788057 false))

(assert (= (and start!67792 res!533807) b!788052))

(assert (= (and b!788052 res!533810) b!788046))

(assert (= (and b!788046 res!533820) b!788045))

(assert (= (and b!788045 res!533825) b!788036))

(assert (= (and b!788036 res!533823) b!788041))

(assert (= (and b!788041 res!533824) b!788049))

(assert (= (and b!788049 res!533808) b!788058))

(assert (= (and b!788058 res!533822) b!788054))

(assert (= (and b!788054 res!533819) b!788056))

(assert (= (and b!788056 res!533813) b!788051))

(assert (= (and b!788051 res!533814) b!788043))

(assert (= (and b!788043 c!87523) b!788048))

(assert (= (and b!788043 (not c!87523)) b!788037))

(assert (= (and b!788043 res!533815) b!788040))

(assert (= (and b!788040 res!533817) b!788047))

(assert (= (and b!788047 res!533811) b!788044))

(assert (= (and b!788047 (not res!533821)) b!788055))

(assert (= (and b!788055 (not res!533809)) b!788053))

(assert (= (and b!788053 (not res!533816)) b!788050))

(assert (= (and b!788050 c!87522) b!788057))

(assert (= (and b!788050 (not c!87522)) b!788038))

(assert (= (and b!788050 res!533818) b!788042))

(assert (= (and b!788042 res!533812) b!788039))

(declare-fun m!729469 () Bool)

(assert (=> b!788055 m!729469))

(assert (=> b!788055 m!729469))

(declare-fun m!729471 () Bool)

(assert (=> b!788055 m!729471))

(declare-fun m!729473 () Bool)

(assert (=> b!788045 m!729473))

(declare-fun m!729475 () Bool)

(assert (=> b!788058 m!729475))

(declare-fun m!729477 () Bool)

(assert (=> b!788040 m!729477))

(assert (=> b!788040 m!729477))

(declare-fun m!729479 () Bool)

(assert (=> b!788040 m!729479))

(declare-fun m!729481 () Bool)

(assert (=> b!788040 m!729481))

(declare-fun m!729483 () Bool)

(assert (=> b!788040 m!729483))

(declare-fun m!729485 () Bool)

(assert (=> b!788040 m!729485))

(declare-fun m!729487 () Bool)

(assert (=> b!788051 m!729487))

(assert (=> b!788037 m!729469))

(assert (=> b!788037 m!729469))

(assert (=> b!788037 m!729471))

(declare-fun m!729489 () Bool)

(assert (=> start!67792 m!729489))

(declare-fun m!729491 () Bool)

(assert (=> start!67792 m!729491))

(declare-fun m!729493 () Bool)

(assert (=> b!788041 m!729493))

(declare-fun m!729495 () Bool)

(assert (=> b!788049 m!729495))

(declare-fun m!729497 () Bool)

(assert (=> b!788042 m!729497))

(declare-fun m!729499 () Bool)

(assert (=> b!788042 m!729499))

(declare-fun m!729501 () Bool)

(assert (=> b!788036 m!729501))

(assert (=> b!788046 m!729469))

(assert (=> b!788046 m!729469))

(declare-fun m!729503 () Bool)

(assert (=> b!788046 m!729503))

(assert (=> b!788044 m!729469))

(assert (=> b!788044 m!729469))

(declare-fun m!729505 () Bool)

(assert (=> b!788044 m!729505))

(assert (=> b!788053 m!729481))

(declare-fun m!729507 () Bool)

(assert (=> b!788053 m!729507))

(assert (=> b!788047 m!729469))

(assert (=> b!788047 m!729469))

(declare-fun m!729509 () Bool)

(assert (=> b!788047 m!729509))

(declare-fun m!729511 () Bool)

(assert (=> b!788047 m!729511))

(declare-fun m!729513 () Bool)

(assert (=> b!788047 m!729513))

(assert (=> b!788056 m!729469))

(assert (=> b!788056 m!729469))

(declare-fun m!729515 () Bool)

(assert (=> b!788056 m!729515))

(assert (=> b!788056 m!729515))

(assert (=> b!788056 m!729469))

(declare-fun m!729517 () Bool)

(assert (=> b!788056 m!729517))

(assert (=> b!788048 m!729469))

(assert (=> b!788048 m!729469))

(declare-fun m!729519 () Bool)

(assert (=> b!788048 m!729519))

(push 1)

