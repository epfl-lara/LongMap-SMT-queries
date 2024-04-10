; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67678 () Bool)

(assert start!67678)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42718 0))(
  ( (array!42719 (arr!20447 (Array (_ BitVec 32) (_ BitVec 64))) (size!20868 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42718)

(declare-fun b!784103 () Bool)

(declare-fun e!435967 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8047 0))(
  ( (MissingZero!8047 (index!34556 (_ BitVec 32))) (Found!8047 (index!34557 (_ BitVec 32))) (Intermediate!8047 (undefined!8859 Bool) (index!34558 (_ BitVec 32)) (x!65507 (_ BitVec 32))) (Undefined!8047) (MissingVacant!8047 (index!34559 (_ BitVec 32))) )
))
(declare-fun lt!349511 () SeekEntryResult!8047)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42718 (_ BitVec 32)) SeekEntryResult!8047)

(assert (=> b!784103 (= e!435967 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20447 a!3186) j!159) a!3186 mask!3328) lt!349511))))

(declare-fun b!784104 () Bool)

(declare-fun e!435959 () Bool)

(declare-fun e!435962 () Bool)

(assert (=> b!784104 (= e!435959 e!435962)))

(declare-fun res!530575 () Bool)

(assert (=> b!784104 (=> res!530575 e!435962)))

(declare-fun lt!349520 () (_ BitVec 64))

(declare-fun lt!349516 () (_ BitVec 64))

(assert (=> b!784104 (= res!530575 (= lt!349520 lt!349516))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!784104 (= lt!349520 (select (store (arr!20447 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!784105 () Bool)

(declare-fun e!435964 () Bool)

(declare-fun e!435958 () Bool)

(assert (=> b!784105 (= e!435964 e!435958)))

(declare-fun res!530565 () Bool)

(assert (=> b!784105 (=> (not res!530565) (not e!435958))))

(declare-fun lt!349517 () SeekEntryResult!8047)

(assert (=> b!784105 (= res!530565 (or (= lt!349517 (MissingZero!8047 i!1173)) (= lt!349517 (MissingVacant!8047 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42718 (_ BitVec 32)) SeekEntryResult!8047)

(assert (=> b!784105 (= lt!349517 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!784106 () Bool)

(declare-fun res!530573 () Bool)

(declare-fun e!435966 () Bool)

(assert (=> b!784106 (=> (not res!530573) (not e!435966))))

(assert (=> b!784106 (= res!530573 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20447 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784107 () Bool)

(declare-fun e!435960 () Bool)

(declare-fun lt!349509 () SeekEntryResult!8047)

(declare-fun lt!349513 () SeekEntryResult!8047)

(assert (=> b!784107 (= e!435960 (= lt!349509 lt!349513))))

(declare-fun e!435963 () Bool)

(declare-fun b!784108 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!784108 (= e!435963 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20447 a!3186) j!159) a!3186 mask!3328) (Found!8047 j!159)))))

(declare-fun b!784109 () Bool)

(declare-fun res!530562 () Bool)

(assert (=> b!784109 (=> (not res!530562) (not e!435964))))

(assert (=> b!784109 (= res!530562 (and (= (size!20868 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20868 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20868 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784110 () Bool)

(declare-fun e!435957 () Bool)

(assert (=> b!784110 (= e!435966 e!435957)))

(declare-fun res!530568 () Bool)

(assert (=> b!784110 (=> (not res!530568) (not e!435957))))

(declare-fun lt!349519 () SeekEntryResult!8047)

(declare-fun lt!349514 () SeekEntryResult!8047)

(assert (=> b!784110 (= res!530568 (= lt!349519 lt!349514))))

(declare-fun lt!349515 () array!42718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42718 (_ BitVec 32)) SeekEntryResult!8047)

(assert (=> b!784110 (= lt!349514 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349516 lt!349515 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784110 (= lt!349519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349516 mask!3328) lt!349516 lt!349515 mask!3328))))

(assert (=> b!784110 (= lt!349516 (select (store (arr!20447 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!784110 (= lt!349515 (array!42719 (store (arr!20447 a!3186) i!1173 k!2102) (size!20868 a!3186)))))

(declare-fun b!784111 () Bool)

(declare-fun res!530560 () Bool)

(assert (=> b!784111 (=> (not res!530560) (not e!435958))))

(declare-datatypes ((List!14449 0))(
  ( (Nil!14446) (Cons!14445 (h!15568 (_ BitVec 64)) (t!20764 List!14449)) )
))
(declare-fun arrayNoDuplicates!0 (array!42718 (_ BitVec 32) List!14449) Bool)

(assert (=> b!784111 (= res!530560 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14446))))

(declare-fun b!784112 () Bool)

(declare-fun res!530564 () Bool)

(assert (=> b!784112 (=> (not res!530564) (not e!435964))))

(declare-fun arrayContainsKey!0 (array!42718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784112 (= res!530564 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784113 () Bool)

(declare-fun res!530558 () Bool)

(assert (=> b!784113 (=> (not res!530558) (not e!435964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784113 (= res!530558 (validKeyInArray!0 (select (arr!20447 a!3186) j!159)))))

(declare-fun b!784114 () Bool)

(declare-fun e!435961 () Bool)

(assert (=> b!784114 (= e!435961 e!435959)))

(declare-fun res!530559 () Bool)

(assert (=> b!784114 (=> res!530559 e!435959)))

(assert (=> b!784114 (= res!530559 (not (= lt!349513 lt!349511)))))

(assert (=> b!784114 (= lt!349513 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20447 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784115 () Bool)

(assert (=> b!784115 (= e!435957 (not e!435961))))

(declare-fun res!530563 () Bool)

(assert (=> b!784115 (=> res!530563 e!435961)))

(assert (=> b!784115 (= res!530563 (or (not (is-Intermediate!8047 lt!349514)) (bvslt x!1131 (x!65507 lt!349514)) (not (= x!1131 (x!65507 lt!349514))) (not (= index!1321 (index!34558 lt!349514)))))))

(assert (=> b!784115 e!435967))

(declare-fun res!530576 () Bool)

(assert (=> b!784115 (=> (not res!530576) (not e!435967))))

(assert (=> b!784115 (= res!530576 (= lt!349509 lt!349511))))

(assert (=> b!784115 (= lt!349511 (Found!8047 j!159))))

(assert (=> b!784115 (= lt!349509 (seekEntryOrOpen!0 (select (arr!20447 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42718 (_ BitVec 32)) Bool)

(assert (=> b!784115 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27076 0))(
  ( (Unit!27077) )
))
(declare-fun lt!349512 () Unit!27076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27076)

(assert (=> b!784115 (= lt!349512 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784116 () Bool)

(declare-fun e!435965 () Unit!27076)

(declare-fun Unit!27078 () Unit!27076)

(assert (=> b!784116 (= e!435965 Unit!27078)))

(assert (=> b!784116 false))

(declare-fun b!784117 () Bool)

(assert (=> b!784117 (= e!435962 true)))

(assert (=> b!784117 e!435960))

(declare-fun res!530572 () Bool)

(assert (=> b!784117 (=> (not res!530572) (not e!435960))))

(assert (=> b!784117 (= res!530572 (= lt!349520 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349510 () Unit!27076)

(assert (=> b!784117 (= lt!349510 e!435965)))

(declare-fun c!87181 () Bool)

(assert (=> b!784117 (= c!87181 (= lt!349520 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784118 () Bool)

(declare-fun Unit!27079 () Unit!27076)

(assert (=> b!784118 (= e!435965 Unit!27079)))

(declare-fun b!784119 () Bool)

(declare-fun res!530566 () Bool)

(assert (=> b!784119 (=> (not res!530566) (not e!435960))))

(assert (=> b!784119 (= res!530566 (= (seekEntryOrOpen!0 lt!349516 lt!349515 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349516 lt!349515 mask!3328)))))

(declare-fun b!784120 () Bool)

(declare-fun res!530571 () Bool)

(assert (=> b!784120 (=> (not res!530571) (not e!435958))))

(assert (=> b!784120 (= res!530571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784121 () Bool)

(declare-fun res!530561 () Bool)

(assert (=> b!784121 (=> (not res!530561) (not e!435958))))

(assert (=> b!784121 (= res!530561 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20868 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20868 a!3186))))))

(declare-fun b!784122 () Bool)

(declare-fun res!530574 () Bool)

(assert (=> b!784122 (=> (not res!530574) (not e!435966))))

(assert (=> b!784122 (= res!530574 e!435963)))

(declare-fun c!87180 () Bool)

(assert (=> b!784122 (= c!87180 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784123 () Bool)

(declare-fun res!530570 () Bool)

(assert (=> b!784123 (=> (not res!530570) (not e!435964))))

(assert (=> b!784123 (= res!530570 (validKeyInArray!0 k!2102))))

(declare-fun b!784124 () Bool)

(declare-fun lt!349518 () SeekEntryResult!8047)

(assert (=> b!784124 (= e!435963 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20447 a!3186) j!159) a!3186 mask!3328) lt!349518))))

(declare-fun b!784125 () Bool)

(assert (=> b!784125 (= e!435958 e!435966)))

(declare-fun res!530569 () Bool)

(assert (=> b!784125 (=> (not res!530569) (not e!435966))))

(assert (=> b!784125 (= res!530569 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20447 a!3186) j!159) mask!3328) (select (arr!20447 a!3186) j!159) a!3186 mask!3328) lt!349518))))

(assert (=> b!784125 (= lt!349518 (Intermediate!8047 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!530567 () Bool)

(assert (=> start!67678 (=> (not res!530567) (not e!435964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67678 (= res!530567 (validMask!0 mask!3328))))

(assert (=> start!67678 e!435964))

(assert (=> start!67678 true))

(declare-fun array_inv!16243 (array!42718) Bool)

(assert (=> start!67678 (array_inv!16243 a!3186)))

(assert (= (and start!67678 res!530567) b!784109))

(assert (= (and b!784109 res!530562) b!784113))

(assert (= (and b!784113 res!530558) b!784123))

(assert (= (and b!784123 res!530570) b!784112))

(assert (= (and b!784112 res!530564) b!784105))

(assert (= (and b!784105 res!530565) b!784120))

(assert (= (and b!784120 res!530571) b!784111))

(assert (= (and b!784111 res!530560) b!784121))

(assert (= (and b!784121 res!530561) b!784125))

(assert (= (and b!784125 res!530569) b!784106))

(assert (= (and b!784106 res!530573) b!784122))

(assert (= (and b!784122 c!87180) b!784124))

(assert (= (and b!784122 (not c!87180)) b!784108))

(assert (= (and b!784122 res!530574) b!784110))

(assert (= (and b!784110 res!530568) b!784115))

(assert (= (and b!784115 res!530576) b!784103))

(assert (= (and b!784115 (not res!530563)) b!784114))

(assert (= (and b!784114 (not res!530559)) b!784104))

(assert (= (and b!784104 (not res!530575)) b!784117))

(assert (= (and b!784117 c!87181) b!784116))

(assert (= (and b!784117 (not c!87181)) b!784118))

(assert (= (and b!784117 res!530572) b!784119))

(assert (= (and b!784119 res!530566) b!784107))

(declare-fun m!726505 () Bool)

(assert (=> b!784119 m!726505))

(declare-fun m!726507 () Bool)

(assert (=> b!784119 m!726507))

(declare-fun m!726509 () Bool)

(assert (=> b!784106 m!726509))

(declare-fun m!726511 () Bool)

(assert (=> b!784104 m!726511))

(declare-fun m!726513 () Bool)

(assert (=> b!784104 m!726513))

(declare-fun m!726515 () Bool)

(assert (=> b!784111 m!726515))

(declare-fun m!726517 () Bool)

(assert (=> b!784103 m!726517))

(assert (=> b!784103 m!726517))

(declare-fun m!726519 () Bool)

(assert (=> b!784103 m!726519))

(declare-fun m!726521 () Bool)

(assert (=> start!67678 m!726521))

(declare-fun m!726523 () Bool)

(assert (=> start!67678 m!726523))

(assert (=> b!784108 m!726517))

(assert (=> b!784108 m!726517))

(declare-fun m!726525 () Bool)

(assert (=> b!784108 m!726525))

(declare-fun m!726527 () Bool)

(assert (=> b!784123 m!726527))

(assert (=> b!784124 m!726517))

(assert (=> b!784124 m!726517))

(declare-fun m!726529 () Bool)

(assert (=> b!784124 m!726529))

(assert (=> b!784125 m!726517))

(assert (=> b!784125 m!726517))

(declare-fun m!726531 () Bool)

(assert (=> b!784125 m!726531))

(assert (=> b!784125 m!726531))

(assert (=> b!784125 m!726517))

(declare-fun m!726533 () Bool)

(assert (=> b!784125 m!726533))

(declare-fun m!726535 () Bool)

(assert (=> b!784120 m!726535))

(assert (=> b!784114 m!726517))

(assert (=> b!784114 m!726517))

(assert (=> b!784114 m!726525))

(declare-fun m!726537 () Bool)

(assert (=> b!784105 m!726537))

(assert (=> b!784115 m!726517))

(assert (=> b!784115 m!726517))

(declare-fun m!726539 () Bool)

(assert (=> b!784115 m!726539))

(declare-fun m!726541 () Bool)

(assert (=> b!784115 m!726541))

(declare-fun m!726543 () Bool)

(assert (=> b!784115 m!726543))

(assert (=> b!784113 m!726517))

(assert (=> b!784113 m!726517))

(declare-fun m!726545 () Bool)

(assert (=> b!784113 m!726545))

(declare-fun m!726547 () Bool)

(assert (=> b!784112 m!726547))

(declare-fun m!726549 () Bool)

(assert (=> b!784110 m!726549))

(declare-fun m!726551 () Bool)

(assert (=> b!784110 m!726551))

(declare-fun m!726553 () Bool)

(assert (=> b!784110 m!726553))

(declare-fun m!726555 () Bool)

(assert (=> b!784110 m!726555))

(assert (=> b!784110 m!726553))

(assert (=> b!784110 m!726511))

(push 1)

