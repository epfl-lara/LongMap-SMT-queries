; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67676 () Bool)

(assert start!67676)

(declare-fun b!784034 () Bool)

(declare-fun res!530519 () Bool)

(declare-fun e!435925 () Bool)

(assert (=> b!784034 (=> (not res!530519) (not e!435925))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784034 (= res!530519 (validKeyInArray!0 k0!2102))))

(declare-fun b!784035 () Bool)

(declare-fun res!530513 () Bool)

(declare-fun e!435924 () Bool)

(assert (=> b!784035 (=> (not res!530513) (not e!435924))))

(declare-fun e!435932 () Bool)

(assert (=> b!784035 (= res!530513 e!435932)))

(declare-fun c!87174 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784035 (= c!87174 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784037 () Bool)

(declare-fun res!530510 () Bool)

(declare-fun e!435921 () Bool)

(assert (=> b!784037 (=> (not res!530510) (not e!435921))))

(declare-fun lt!349477 () (_ BitVec 64))

(declare-datatypes ((array!42716 0))(
  ( (array!42717 (arr!20446 (Array (_ BitVec 32) (_ BitVec 64))) (size!20867 (_ BitVec 32))) )
))
(declare-fun lt!349479 () array!42716)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8046 0))(
  ( (MissingZero!8046 (index!34552 (_ BitVec 32))) (Found!8046 (index!34553 (_ BitVec 32))) (Intermediate!8046 (undefined!8858 Bool) (index!34554 (_ BitVec 32)) (x!65506 (_ BitVec 32))) (Undefined!8046) (MissingVacant!8046 (index!34555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42716 (_ BitVec 32)) SeekEntryResult!8046)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42716 (_ BitVec 32)) SeekEntryResult!8046)

(assert (=> b!784037 (= res!530510 (= (seekEntryOrOpen!0 lt!349477 lt!349479 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349477 lt!349479 mask!3328)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!42716)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!435930 () Bool)

(declare-fun lt!349475 () SeekEntryResult!8046)

(declare-fun b!784038 () Bool)

(assert (=> b!784038 (= e!435930 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20446 a!3186) j!159) a!3186 mask!3328) lt!349475))))

(declare-fun b!784039 () Bool)

(declare-fun res!530512 () Bool)

(assert (=> b!784039 (=> (not res!530512) (not e!435924))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784039 (= res!530512 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20446 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784040 () Bool)

(declare-fun res!530515 () Bool)

(assert (=> b!784040 (=> (not res!530515) (not e!435925))))

(declare-fun arrayContainsKey!0 (array!42716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784040 (= res!530515 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!349482 () SeekEntryResult!8046)

(declare-fun b!784041 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42716 (_ BitVec 32)) SeekEntryResult!8046)

(assert (=> b!784041 (= e!435932 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20446 a!3186) j!159) a!3186 mask!3328) lt!349482))))

(declare-fun b!784042 () Bool)

(declare-fun e!435929 () Bool)

(assert (=> b!784042 (= e!435924 e!435929)))

(declare-fun res!530508 () Bool)

(assert (=> b!784042 (=> (not res!530508) (not e!435929))))

(declare-fun lt!349473 () SeekEntryResult!8046)

(declare-fun lt!349474 () SeekEntryResult!8046)

(assert (=> b!784042 (= res!530508 (= lt!349473 lt!349474))))

(assert (=> b!784042 (= lt!349474 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349477 lt!349479 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784042 (= lt!349473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349477 mask!3328) lt!349477 lt!349479 mask!3328))))

(assert (=> b!784042 (= lt!349477 (select (store (arr!20446 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784042 (= lt!349479 (array!42717 (store (arr!20446 a!3186) i!1173 k0!2102) (size!20867 a!3186)))))

(declare-fun b!784043 () Bool)

(declare-fun lt!349480 () SeekEntryResult!8046)

(declare-fun lt!349478 () SeekEntryResult!8046)

(assert (=> b!784043 (= e!435921 (= lt!349480 lt!349478))))

(declare-fun b!784044 () Bool)

(declare-fun e!435923 () Bool)

(assert (=> b!784044 (= e!435923 true)))

(assert (=> b!784044 e!435921))

(declare-fun res!530516 () Bool)

(assert (=> b!784044 (=> (not res!530516) (not e!435921))))

(declare-fun lt!349481 () (_ BitVec 64))

(assert (=> b!784044 (= res!530516 (= lt!349481 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27072 0))(
  ( (Unit!27073) )
))
(declare-fun lt!349483 () Unit!27072)

(declare-fun e!435928 () Unit!27072)

(assert (=> b!784044 (= lt!349483 e!435928)))

(declare-fun c!87175 () Bool)

(assert (=> b!784044 (= c!87175 (= lt!349481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784045 () Bool)

(declare-fun e!435931 () Bool)

(assert (=> b!784045 (= e!435931 e!435924)))

(declare-fun res!530502 () Bool)

(assert (=> b!784045 (=> (not res!530502) (not e!435924))))

(assert (=> b!784045 (= res!530502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20446 a!3186) j!159) mask!3328) (select (arr!20446 a!3186) j!159) a!3186 mask!3328) lt!349482))))

(assert (=> b!784045 (= lt!349482 (Intermediate!8046 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784046 () Bool)

(declare-fun res!530509 () Bool)

(assert (=> b!784046 (=> (not res!530509) (not e!435925))))

(assert (=> b!784046 (= res!530509 (validKeyInArray!0 (select (arr!20446 a!3186) j!159)))))

(declare-fun b!784047 () Bool)

(declare-fun e!435927 () Bool)

(assert (=> b!784047 (= e!435927 e!435923)))

(declare-fun res!530511 () Bool)

(assert (=> b!784047 (=> res!530511 e!435923)))

(assert (=> b!784047 (= res!530511 (= lt!349481 lt!349477))))

(assert (=> b!784047 (= lt!349481 (select (store (arr!20446 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784048 () Bool)

(declare-fun e!435922 () Bool)

(assert (=> b!784048 (= e!435929 (not e!435922))))

(declare-fun res!530517 () Bool)

(assert (=> b!784048 (=> res!530517 e!435922)))

(get-info :version)

(assert (=> b!784048 (= res!530517 (or (not ((_ is Intermediate!8046) lt!349474)) (bvslt x!1131 (x!65506 lt!349474)) (not (= x!1131 (x!65506 lt!349474))) (not (= index!1321 (index!34554 lt!349474)))))))

(assert (=> b!784048 e!435930))

(declare-fun res!530505 () Bool)

(assert (=> b!784048 (=> (not res!530505) (not e!435930))))

(assert (=> b!784048 (= res!530505 (= lt!349480 lt!349475))))

(assert (=> b!784048 (= lt!349475 (Found!8046 j!159))))

(assert (=> b!784048 (= lt!349480 (seekEntryOrOpen!0 (select (arr!20446 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42716 (_ BitVec 32)) Bool)

(assert (=> b!784048 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349476 () Unit!27072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27072)

(assert (=> b!784048 (= lt!349476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784049 () Bool)

(declare-fun Unit!27074 () Unit!27072)

(assert (=> b!784049 (= e!435928 Unit!27074)))

(assert (=> b!784049 false))

(declare-fun b!784050 () Bool)

(declare-fun res!530507 () Bool)

(assert (=> b!784050 (=> (not res!530507) (not e!435925))))

(assert (=> b!784050 (= res!530507 (and (= (size!20867 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20867 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20867 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784051 () Bool)

(assert (=> b!784051 (= e!435925 e!435931)))

(declare-fun res!530501 () Bool)

(assert (=> b!784051 (=> (not res!530501) (not e!435931))))

(declare-fun lt!349484 () SeekEntryResult!8046)

(assert (=> b!784051 (= res!530501 (or (= lt!349484 (MissingZero!8046 i!1173)) (= lt!349484 (MissingVacant!8046 i!1173))))))

(assert (=> b!784051 (= lt!349484 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784052 () Bool)

(declare-fun res!530503 () Bool)

(assert (=> b!784052 (=> (not res!530503) (not e!435931))))

(declare-datatypes ((List!14448 0))(
  ( (Nil!14445) (Cons!14444 (h!15567 (_ BitVec 64)) (t!20763 List!14448)) )
))
(declare-fun arrayNoDuplicates!0 (array!42716 (_ BitVec 32) List!14448) Bool)

(assert (=> b!784052 (= res!530503 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14445))))

(declare-fun b!784053 () Bool)

(declare-fun res!530514 () Bool)

(assert (=> b!784053 (=> (not res!530514) (not e!435931))))

(assert (=> b!784053 (= res!530514 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20867 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20867 a!3186))))))

(declare-fun b!784054 () Bool)

(declare-fun Unit!27075 () Unit!27072)

(assert (=> b!784054 (= e!435928 Unit!27075)))

(declare-fun b!784036 () Bool)

(declare-fun res!530506 () Bool)

(assert (=> b!784036 (=> (not res!530506) (not e!435931))))

(assert (=> b!784036 (= res!530506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!530504 () Bool)

(assert (=> start!67676 (=> (not res!530504) (not e!435925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67676 (= res!530504 (validMask!0 mask!3328))))

(assert (=> start!67676 e!435925))

(assert (=> start!67676 true))

(declare-fun array_inv!16242 (array!42716) Bool)

(assert (=> start!67676 (array_inv!16242 a!3186)))

(declare-fun b!784055 () Bool)

(assert (=> b!784055 (= e!435932 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20446 a!3186) j!159) a!3186 mask!3328) (Found!8046 j!159)))))

(declare-fun b!784056 () Bool)

(assert (=> b!784056 (= e!435922 e!435927)))

(declare-fun res!530518 () Bool)

(assert (=> b!784056 (=> res!530518 e!435927)))

(assert (=> b!784056 (= res!530518 (not (= lt!349478 lt!349475)))))

(assert (=> b!784056 (= lt!349478 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20446 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67676 res!530504) b!784050))

(assert (= (and b!784050 res!530507) b!784046))

(assert (= (and b!784046 res!530509) b!784034))

(assert (= (and b!784034 res!530519) b!784040))

(assert (= (and b!784040 res!530515) b!784051))

(assert (= (and b!784051 res!530501) b!784036))

(assert (= (and b!784036 res!530506) b!784052))

(assert (= (and b!784052 res!530503) b!784053))

(assert (= (and b!784053 res!530514) b!784045))

(assert (= (and b!784045 res!530502) b!784039))

(assert (= (and b!784039 res!530512) b!784035))

(assert (= (and b!784035 c!87174) b!784041))

(assert (= (and b!784035 (not c!87174)) b!784055))

(assert (= (and b!784035 res!530513) b!784042))

(assert (= (and b!784042 res!530508) b!784048))

(assert (= (and b!784048 res!530505) b!784038))

(assert (= (and b!784048 (not res!530517)) b!784056))

(assert (= (and b!784056 (not res!530518)) b!784047))

(assert (= (and b!784047 (not res!530511)) b!784044))

(assert (= (and b!784044 c!87175) b!784049))

(assert (= (and b!784044 (not c!87175)) b!784054))

(assert (= (and b!784044 res!530516) b!784037))

(assert (= (and b!784037 res!530510) b!784043))

(declare-fun m!726453 () Bool)

(assert (=> b!784055 m!726453))

(assert (=> b!784055 m!726453))

(declare-fun m!726455 () Bool)

(assert (=> b!784055 m!726455))

(assert (=> b!784046 m!726453))

(assert (=> b!784046 m!726453))

(declare-fun m!726457 () Bool)

(assert (=> b!784046 m!726457))

(declare-fun m!726459 () Bool)

(assert (=> b!784034 m!726459))

(declare-fun m!726461 () Bool)

(assert (=> b!784047 m!726461))

(declare-fun m!726463 () Bool)

(assert (=> b!784047 m!726463))

(declare-fun m!726465 () Bool)

(assert (=> b!784052 m!726465))

(declare-fun m!726467 () Bool)

(assert (=> b!784036 m!726467))

(declare-fun m!726469 () Bool)

(assert (=> start!67676 m!726469))

(declare-fun m!726471 () Bool)

(assert (=> start!67676 m!726471))

(assert (=> b!784038 m!726453))

(assert (=> b!784038 m!726453))

(declare-fun m!726473 () Bool)

(assert (=> b!784038 m!726473))

(assert (=> b!784056 m!726453))

(assert (=> b!784056 m!726453))

(assert (=> b!784056 m!726455))

(declare-fun m!726475 () Bool)

(assert (=> b!784040 m!726475))

(declare-fun m!726477 () Bool)

(assert (=> b!784042 m!726477))

(declare-fun m!726479 () Bool)

(assert (=> b!784042 m!726479))

(declare-fun m!726481 () Bool)

(assert (=> b!784042 m!726481))

(assert (=> b!784042 m!726461))

(declare-fun m!726483 () Bool)

(assert (=> b!784042 m!726483))

(assert (=> b!784042 m!726477))

(assert (=> b!784045 m!726453))

(assert (=> b!784045 m!726453))

(declare-fun m!726485 () Bool)

(assert (=> b!784045 m!726485))

(assert (=> b!784045 m!726485))

(assert (=> b!784045 m!726453))

(declare-fun m!726487 () Bool)

(assert (=> b!784045 m!726487))

(declare-fun m!726489 () Bool)

(assert (=> b!784051 m!726489))

(assert (=> b!784048 m!726453))

(assert (=> b!784048 m!726453))

(declare-fun m!726491 () Bool)

(assert (=> b!784048 m!726491))

(declare-fun m!726493 () Bool)

(assert (=> b!784048 m!726493))

(declare-fun m!726495 () Bool)

(assert (=> b!784048 m!726495))

(assert (=> b!784041 m!726453))

(assert (=> b!784041 m!726453))

(declare-fun m!726497 () Bool)

(assert (=> b!784041 m!726497))

(declare-fun m!726499 () Bool)

(assert (=> b!784037 m!726499))

(declare-fun m!726501 () Bool)

(assert (=> b!784037 m!726501))

(declare-fun m!726503 () Bool)

(assert (=> b!784039 m!726503))

(check-sat (not b!784040) (not b!784037) (not b!784056) (not b!784055) (not b!784038) (not b!784046) (not b!784048) (not b!784052) (not b!784042) (not start!67676) (not b!784034) (not b!784045) (not b!784041) (not b!784051) (not b!784036))
(check-sat)
