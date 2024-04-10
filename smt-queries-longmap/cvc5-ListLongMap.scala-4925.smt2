; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67794 () Bool)

(assert start!67794)

(declare-datatypes ((array!42834 0))(
  ( (array!42835 (arr!20505 (Array (_ BitVec 32) (_ BitVec 64))) (size!20926 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42834)

(declare-fun b!788105 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8105 0))(
  ( (MissingZero!8105 (index!34788 (_ BitVec 32))) (Found!8105 (index!34789 (_ BitVec 32))) (Intermediate!8105 (undefined!8917 Bool) (index!34790 (_ BitVec 32)) (x!65725 (_ BitVec 32))) (Undefined!8105) (MissingVacant!8105 (index!34791 (_ BitVec 32))) )
))
(declare-fun lt!351600 () SeekEntryResult!8105)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!438055 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42834 (_ BitVec 32)) SeekEntryResult!8105)

(assert (=> b!788105 (= e!438055 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20505 a!3186) j!159) a!3186 mask!3328) lt!351600))))

(declare-fun b!788106 () Bool)

(declare-fun res!533872 () Bool)

(declare-fun e!438054 () Bool)

(assert (=> b!788106 (=> (not res!533872) (not e!438054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788106 (= res!533872 (validKeyInArray!0 (select (arr!20505 a!3186) j!159)))))

(declare-fun b!788107 () Bool)

(declare-fun res!533868 () Bool)

(declare-fun e!438048 () Bool)

(assert (=> b!788107 (=> (not res!533868) (not e!438048))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788107 (= res!533868 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20505 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!533879 () Bool)

(assert (=> start!67794 (=> (not res!533879) (not e!438054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67794 (= res!533879 (validMask!0 mask!3328))))

(assert (=> start!67794 e!438054))

(assert (=> start!67794 true))

(declare-fun array_inv!16301 (array!42834) Bool)

(assert (=> start!67794 (array_inv!16301 a!3186)))

(declare-fun b!788108 () Bool)

(declare-fun e!438046 () Bool)

(assert (=> b!788108 (= e!438054 e!438046)))

(declare-fun res!533878 () Bool)

(assert (=> b!788108 (=> (not res!533878) (not e!438046))))

(declare-fun lt!351598 () SeekEntryResult!8105)

(assert (=> b!788108 (= res!533878 (or (= lt!351598 (MissingZero!8105 i!1173)) (= lt!351598 (MissingVacant!8105 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42834 (_ BitVec 32)) SeekEntryResult!8105)

(assert (=> b!788108 (= lt!351598 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!788109 () Bool)

(declare-fun res!533864 () Bool)

(declare-fun e!438056 () Bool)

(assert (=> b!788109 (=> (not res!533864) (not e!438056))))

(declare-fun lt!351597 () (_ BitVec 64))

(declare-fun lt!351603 () array!42834)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42834 (_ BitVec 32)) SeekEntryResult!8105)

(assert (=> b!788109 (= res!533864 (= (seekEntryOrOpen!0 lt!351597 lt!351603 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351597 lt!351603 mask!3328)))))

(declare-fun b!788110 () Bool)

(declare-datatypes ((Unit!27308 0))(
  ( (Unit!27309) )
))
(declare-fun e!438053 () Unit!27308)

(declare-fun Unit!27310 () Unit!27308)

(assert (=> b!788110 (= e!438053 Unit!27310)))

(assert (=> b!788110 false))

(declare-fun b!788111 () Bool)

(declare-fun res!533875 () Bool)

(assert (=> b!788111 (=> (not res!533875) (not e!438054))))

(assert (=> b!788111 (= res!533875 (validKeyInArray!0 k!2102))))

(declare-fun b!788112 () Bool)

(declare-fun res!533871 () Bool)

(assert (=> b!788112 (=> (not res!533871) (not e!438046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42834 (_ BitVec 32)) Bool)

(assert (=> b!788112 (= res!533871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788113 () Bool)

(declare-fun e!438051 () Bool)

(assert (=> b!788113 (= e!438048 e!438051)))

(declare-fun res!533865 () Bool)

(assert (=> b!788113 (=> (not res!533865) (not e!438051))))

(declare-fun lt!351607 () SeekEntryResult!8105)

(declare-fun lt!351605 () SeekEntryResult!8105)

(assert (=> b!788113 (= res!533865 (= lt!351607 lt!351605))))

(assert (=> b!788113 (= lt!351605 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351597 lt!351603 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788113 (= lt!351607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351597 mask!3328) lt!351597 lt!351603 mask!3328))))

(assert (=> b!788113 (= lt!351597 (select (store (arr!20505 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!788113 (= lt!351603 (array!42835 (store (arr!20505 a!3186) i!1173 k!2102) (size!20926 a!3186)))))

(declare-fun b!788114 () Bool)

(declare-fun e!438052 () Bool)

(assert (=> b!788114 (= e!438051 (not e!438052))))

(declare-fun res!533869 () Bool)

(assert (=> b!788114 (=> res!533869 e!438052)))

(assert (=> b!788114 (= res!533869 (or (not (is-Intermediate!8105 lt!351605)) (bvslt x!1131 (x!65725 lt!351605)) (not (= x!1131 (x!65725 lt!351605))) (not (= index!1321 (index!34790 lt!351605)))))))

(declare-fun e!438047 () Bool)

(assert (=> b!788114 e!438047))

(declare-fun res!533882 () Bool)

(assert (=> b!788114 (=> (not res!533882) (not e!438047))))

(declare-fun lt!351606 () SeekEntryResult!8105)

(declare-fun lt!351608 () SeekEntryResult!8105)

(assert (=> b!788114 (= res!533882 (= lt!351606 lt!351608))))

(assert (=> b!788114 (= lt!351608 (Found!8105 j!159))))

(assert (=> b!788114 (= lt!351606 (seekEntryOrOpen!0 (select (arr!20505 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788114 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351601 () Unit!27308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27308)

(assert (=> b!788114 (= lt!351601 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788115 () Bool)

(assert (=> b!788115 (= e!438046 e!438048)))

(declare-fun res!533876 () Bool)

(assert (=> b!788115 (=> (not res!533876) (not e!438048))))

(assert (=> b!788115 (= res!533876 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20505 a!3186) j!159) mask!3328) (select (arr!20505 a!3186) j!159) a!3186 mask!3328) lt!351600))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788115 (= lt!351600 (Intermediate!8105 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788116 () Bool)

(assert (=> b!788116 (= e!438055 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20505 a!3186) j!159) a!3186 mask!3328) (Found!8105 j!159)))))

(declare-fun b!788117 () Bool)

(declare-fun res!533874 () Bool)

(assert (=> b!788117 (=> (not res!533874) (not e!438054))))

(declare-fun arrayContainsKey!0 (array!42834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788117 (= res!533874 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788118 () Bool)

(declare-fun res!533880 () Bool)

(assert (=> b!788118 (=> (not res!533880) (not e!438046))))

(assert (=> b!788118 (= res!533880 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20926 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20926 a!3186))))))

(declare-fun b!788119 () Bool)

(assert (=> b!788119 (= e!438047 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20505 a!3186) j!159) a!3186 mask!3328) lt!351608))))

(declare-fun b!788120 () Bool)

(declare-fun e!438050 () Bool)

(declare-fun e!438049 () Bool)

(assert (=> b!788120 (= e!438050 e!438049)))

(declare-fun res!533877 () Bool)

(assert (=> b!788120 (=> res!533877 e!438049)))

(declare-fun lt!351599 () (_ BitVec 64))

(assert (=> b!788120 (= res!533877 (= lt!351599 lt!351597))))

(assert (=> b!788120 (= lt!351599 (select (store (arr!20505 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!788121 () Bool)

(declare-fun res!533881 () Bool)

(assert (=> b!788121 (=> (not res!533881) (not e!438048))))

(assert (=> b!788121 (= res!533881 e!438055)))

(declare-fun c!87528 () Bool)

(assert (=> b!788121 (= c!87528 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788122 () Bool)

(declare-fun lt!351604 () SeekEntryResult!8105)

(assert (=> b!788122 (= e!438056 (= lt!351606 lt!351604))))

(declare-fun b!788123 () Bool)

(assert (=> b!788123 (= e!438052 e!438050)))

(declare-fun res!533866 () Bool)

(assert (=> b!788123 (=> res!533866 e!438050)))

(assert (=> b!788123 (= res!533866 (not (= lt!351604 lt!351608)))))

(assert (=> b!788123 (= lt!351604 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20505 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788124 () Bool)

(assert (=> b!788124 (= e!438049 (= (select (arr!20505 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788124 e!438056))

(declare-fun res!533870 () Bool)

(assert (=> b!788124 (=> (not res!533870) (not e!438056))))

(assert (=> b!788124 (= res!533870 (= lt!351599 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351602 () Unit!27308)

(assert (=> b!788124 (= lt!351602 e!438053)))

(declare-fun c!87529 () Bool)

(assert (=> b!788124 (= c!87529 (= lt!351599 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788125 () Bool)

(declare-fun res!533867 () Bool)

(assert (=> b!788125 (=> (not res!533867) (not e!438054))))

(assert (=> b!788125 (= res!533867 (and (= (size!20926 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20926 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20926 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788126 () Bool)

(declare-fun res!533873 () Bool)

(assert (=> b!788126 (=> (not res!533873) (not e!438046))))

(declare-datatypes ((List!14507 0))(
  ( (Nil!14504) (Cons!14503 (h!15626 (_ BitVec 64)) (t!20822 List!14507)) )
))
(declare-fun arrayNoDuplicates!0 (array!42834 (_ BitVec 32) List!14507) Bool)

(assert (=> b!788126 (= res!533873 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14504))))

(declare-fun b!788127 () Bool)

(declare-fun Unit!27311 () Unit!27308)

(assert (=> b!788127 (= e!438053 Unit!27311)))

(assert (= (and start!67794 res!533879) b!788125))

(assert (= (and b!788125 res!533867) b!788106))

(assert (= (and b!788106 res!533872) b!788111))

(assert (= (and b!788111 res!533875) b!788117))

(assert (= (and b!788117 res!533874) b!788108))

(assert (= (and b!788108 res!533878) b!788112))

(assert (= (and b!788112 res!533871) b!788126))

(assert (= (and b!788126 res!533873) b!788118))

(assert (= (and b!788118 res!533880) b!788115))

(assert (= (and b!788115 res!533876) b!788107))

(assert (= (and b!788107 res!533868) b!788121))

(assert (= (and b!788121 c!87528) b!788105))

(assert (= (and b!788121 (not c!87528)) b!788116))

(assert (= (and b!788121 res!533881) b!788113))

(assert (= (and b!788113 res!533865) b!788114))

(assert (= (and b!788114 res!533882) b!788119))

(assert (= (and b!788114 (not res!533869)) b!788123))

(assert (= (and b!788123 (not res!533866)) b!788120))

(assert (= (and b!788120 (not res!533877)) b!788124))

(assert (= (and b!788124 c!87529) b!788110))

(assert (= (and b!788124 (not c!87529)) b!788127))

(assert (= (and b!788124 res!533870) b!788109))

(assert (= (and b!788109 res!533864) b!788122))

(declare-fun m!729521 () Bool)

(assert (=> b!788112 m!729521))

(declare-fun m!729523 () Bool)

(assert (=> b!788123 m!729523))

(assert (=> b!788123 m!729523))

(declare-fun m!729525 () Bool)

(assert (=> b!788123 m!729525))

(assert (=> b!788116 m!729523))

(assert (=> b!788116 m!729523))

(assert (=> b!788116 m!729525))

(declare-fun m!729527 () Bool)

(assert (=> b!788120 m!729527))

(declare-fun m!729529 () Bool)

(assert (=> b!788120 m!729529))

(declare-fun m!729531 () Bool)

(assert (=> start!67794 m!729531))

(declare-fun m!729533 () Bool)

(assert (=> start!67794 m!729533))

(assert (=> b!788119 m!729523))

(assert (=> b!788119 m!729523))

(declare-fun m!729535 () Bool)

(assert (=> b!788119 m!729535))

(declare-fun m!729537 () Bool)

(assert (=> b!788126 m!729537))

(declare-fun m!729539 () Bool)

(assert (=> b!788124 m!729539))

(declare-fun m!729541 () Bool)

(assert (=> b!788111 m!729541))

(declare-fun m!729543 () Bool)

(assert (=> b!788109 m!729543))

(declare-fun m!729545 () Bool)

(assert (=> b!788109 m!729545))

(declare-fun m!729547 () Bool)

(assert (=> b!788117 m!729547))

(declare-fun m!729549 () Bool)

(assert (=> b!788108 m!729549))

(declare-fun m!729551 () Bool)

(assert (=> b!788113 m!729551))

(assert (=> b!788113 m!729527))

(declare-fun m!729553 () Bool)

(assert (=> b!788113 m!729553))

(declare-fun m!729555 () Bool)

(assert (=> b!788113 m!729555))

(assert (=> b!788113 m!729551))

(declare-fun m!729557 () Bool)

(assert (=> b!788113 m!729557))

(declare-fun m!729559 () Bool)

(assert (=> b!788107 m!729559))

(assert (=> b!788106 m!729523))

(assert (=> b!788106 m!729523))

(declare-fun m!729561 () Bool)

(assert (=> b!788106 m!729561))

(assert (=> b!788115 m!729523))

(assert (=> b!788115 m!729523))

(declare-fun m!729563 () Bool)

(assert (=> b!788115 m!729563))

(assert (=> b!788115 m!729563))

(assert (=> b!788115 m!729523))

(declare-fun m!729565 () Bool)

(assert (=> b!788115 m!729565))

(assert (=> b!788105 m!729523))

(assert (=> b!788105 m!729523))

(declare-fun m!729567 () Bool)

(assert (=> b!788105 m!729567))

(assert (=> b!788114 m!729523))

(assert (=> b!788114 m!729523))

(declare-fun m!729569 () Bool)

(assert (=> b!788114 m!729569))

(declare-fun m!729571 () Bool)

(assert (=> b!788114 m!729571))

(declare-fun m!729573 () Bool)

(assert (=> b!788114 m!729573))

(push 1)

