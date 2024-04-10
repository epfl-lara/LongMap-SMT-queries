; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67686 () Bool)

(assert start!67686)

(declare-fun b!784379 () Bool)

(declare-fun res!530788 () Bool)

(declare-fun e!436110 () Bool)

(assert (=> b!784379 (=> (not res!530788) (not e!436110))))

(declare-datatypes ((array!42726 0))(
  ( (array!42727 (arr!20451 (Array (_ BitVec 32) (_ BitVec 64))) (size!20872 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42726)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42726 (_ BitVec 32)) Bool)

(assert (=> b!784379 (= res!530788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784380 () Bool)

(declare-datatypes ((Unit!27092 0))(
  ( (Unit!27093) )
))
(declare-fun e!436102 () Unit!27092)

(declare-fun Unit!27094 () Unit!27092)

(assert (=> b!784380 (= e!436102 Unit!27094)))

(declare-fun b!784381 () Bool)

(declare-fun e!436112 () Bool)

(declare-datatypes ((SeekEntryResult!8051 0))(
  ( (MissingZero!8051 (index!34572 (_ BitVec 32))) (Found!8051 (index!34573 (_ BitVec 32))) (Intermediate!8051 (undefined!8863 Bool) (index!34574 (_ BitVec 32)) (x!65527 (_ BitVec 32))) (Undefined!8051) (MissingVacant!8051 (index!34575 (_ BitVec 32))) )
))
(declare-fun lt!349656 () SeekEntryResult!8051)

(declare-fun lt!349655 () SeekEntryResult!8051)

(assert (=> b!784381 (= e!436112 (= lt!349656 lt!349655))))

(declare-fun b!784382 () Bool)

(declare-fun res!530789 () Bool)

(declare-fun e!436107 () Bool)

(assert (=> b!784382 (=> (not res!530789) (not e!436107))))

(declare-fun e!436111 () Bool)

(assert (=> b!784382 (= res!530789 e!436111)))

(declare-fun c!87204 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784382 (= c!87204 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!530792 () Bool)

(declare-fun e!436103 () Bool)

(assert (=> start!67686 (=> (not res!530792) (not e!436103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67686 (= res!530792 (validMask!0 mask!3328))))

(assert (=> start!67686 e!436103))

(assert (=> start!67686 true))

(declare-fun array_inv!16247 (array!42726) Bool)

(assert (=> start!67686 (array_inv!16247 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!784383 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42726 (_ BitVec 32)) SeekEntryResult!8051)

(assert (=> b!784383 (= e!436111 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20451 a!3186) j!159) a!3186 mask!3328) (Found!8051 j!159)))))

(declare-fun b!784384 () Bool)

(declare-fun e!436104 () Bool)

(declare-fun e!436108 () Bool)

(assert (=> b!784384 (= e!436104 (not e!436108))))

(declare-fun res!530801 () Bool)

(assert (=> b!784384 (=> res!530801 e!436108)))

(declare-fun lt!349654 () SeekEntryResult!8051)

(assert (=> b!784384 (= res!530801 (or (not (is-Intermediate!8051 lt!349654)) (bvslt x!1131 (x!65527 lt!349654)) (not (= x!1131 (x!65527 lt!349654))) (not (= index!1321 (index!34574 lt!349654)))))))

(declare-fun e!436109 () Bool)

(assert (=> b!784384 e!436109))

(declare-fun res!530794 () Bool)

(assert (=> b!784384 (=> (not res!530794) (not e!436109))))

(declare-fun lt!349663 () SeekEntryResult!8051)

(assert (=> b!784384 (= res!530794 (= lt!349656 lt!349663))))

(assert (=> b!784384 (= lt!349663 (Found!8051 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42726 (_ BitVec 32)) SeekEntryResult!8051)

(assert (=> b!784384 (= lt!349656 (seekEntryOrOpen!0 (select (arr!20451 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784384 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349659 () Unit!27092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27092)

(assert (=> b!784384 (= lt!349659 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784385 () Bool)

(assert (=> b!784385 (= e!436103 e!436110)))

(declare-fun res!530795 () Bool)

(assert (=> b!784385 (=> (not res!530795) (not e!436110))))

(declare-fun lt!349661 () SeekEntryResult!8051)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784385 (= res!530795 (or (= lt!349661 (MissingZero!8051 i!1173)) (= lt!349661 (MissingVacant!8051 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!784385 (= lt!349661 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!784386 () Bool)

(declare-fun res!530790 () Bool)

(assert (=> b!784386 (=> (not res!530790) (not e!436112))))

(declare-fun lt!349660 () (_ BitVec 64))

(declare-fun lt!349657 () array!42726)

(assert (=> b!784386 (= res!530790 (= (seekEntryOrOpen!0 lt!349660 lt!349657 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349660 lt!349657 mask!3328)))))

(declare-fun b!784387 () Bool)

(declare-fun res!530786 () Bool)

(assert (=> b!784387 (=> (not res!530786) (not e!436110))))

(declare-datatypes ((List!14453 0))(
  ( (Nil!14450) (Cons!14449 (h!15572 (_ BitVec 64)) (t!20768 List!14453)) )
))
(declare-fun arrayNoDuplicates!0 (array!42726 (_ BitVec 32) List!14453) Bool)

(assert (=> b!784387 (= res!530786 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14450))))

(declare-fun b!784388 () Bool)

(assert (=> b!784388 (= e!436110 e!436107)))

(declare-fun res!530803 () Bool)

(assert (=> b!784388 (=> (not res!530803) (not e!436107))))

(declare-fun lt!349662 () SeekEntryResult!8051)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42726 (_ BitVec 32)) SeekEntryResult!8051)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784388 (= res!530803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20451 a!3186) j!159) mask!3328) (select (arr!20451 a!3186) j!159) a!3186 mask!3328) lt!349662))))

(assert (=> b!784388 (= lt!349662 (Intermediate!8051 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784389 () Bool)

(assert (=> b!784389 (= e!436109 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20451 a!3186) j!159) a!3186 mask!3328) lt!349663))))

(declare-fun b!784390 () Bool)

(assert (=> b!784390 (= e!436111 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20451 a!3186) j!159) a!3186 mask!3328) lt!349662))))

(declare-fun b!784391 () Bool)

(declare-fun e!436105 () Bool)

(assert (=> b!784391 (= e!436105 true)))

(assert (=> b!784391 e!436112))

(declare-fun res!530799 () Bool)

(assert (=> b!784391 (=> (not res!530799) (not e!436112))))

(declare-fun lt!349653 () (_ BitVec 64))

(assert (=> b!784391 (= res!530799 (= lt!349653 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349664 () Unit!27092)

(assert (=> b!784391 (= lt!349664 e!436102)))

(declare-fun c!87205 () Bool)

(assert (=> b!784391 (= c!87205 (= lt!349653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784392 () Bool)

(declare-fun e!436101 () Bool)

(assert (=> b!784392 (= e!436108 e!436101)))

(declare-fun res!530798 () Bool)

(assert (=> b!784392 (=> res!530798 e!436101)))

(assert (=> b!784392 (= res!530798 (not (= lt!349655 lt!349663)))))

(assert (=> b!784392 (= lt!349655 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20451 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784393 () Bool)

(declare-fun res!530800 () Bool)

(assert (=> b!784393 (=> (not res!530800) (not e!436103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784393 (= res!530800 (validKeyInArray!0 (select (arr!20451 a!3186) j!159)))))

(declare-fun b!784394 () Bool)

(declare-fun res!530791 () Bool)

(assert (=> b!784394 (=> (not res!530791) (not e!436103))))

(assert (=> b!784394 (= res!530791 (and (= (size!20872 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20872 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20872 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784395 () Bool)

(declare-fun res!530802 () Bool)

(assert (=> b!784395 (=> (not res!530802) (not e!436103))))

(assert (=> b!784395 (= res!530802 (validKeyInArray!0 k!2102))))

(declare-fun b!784396 () Bool)

(declare-fun res!530797 () Bool)

(assert (=> b!784396 (=> (not res!530797) (not e!436107))))

(assert (=> b!784396 (= res!530797 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20451 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784397 () Bool)

(declare-fun res!530804 () Bool)

(assert (=> b!784397 (=> (not res!530804) (not e!436103))))

(declare-fun arrayContainsKey!0 (array!42726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784397 (= res!530804 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784398 () Bool)

(declare-fun res!530787 () Bool)

(assert (=> b!784398 (=> (not res!530787) (not e!436110))))

(assert (=> b!784398 (= res!530787 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20872 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20872 a!3186))))))

(declare-fun b!784399 () Bool)

(assert (=> b!784399 (= e!436107 e!436104)))

(declare-fun res!530793 () Bool)

(assert (=> b!784399 (=> (not res!530793) (not e!436104))))

(declare-fun lt!349658 () SeekEntryResult!8051)

(assert (=> b!784399 (= res!530793 (= lt!349658 lt!349654))))

(assert (=> b!784399 (= lt!349654 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349660 lt!349657 mask!3328))))

(assert (=> b!784399 (= lt!349658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349660 mask!3328) lt!349660 lt!349657 mask!3328))))

(assert (=> b!784399 (= lt!349660 (select (store (arr!20451 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!784399 (= lt!349657 (array!42727 (store (arr!20451 a!3186) i!1173 k!2102) (size!20872 a!3186)))))

(declare-fun b!784400 () Bool)

(declare-fun Unit!27095 () Unit!27092)

(assert (=> b!784400 (= e!436102 Unit!27095)))

(assert (=> b!784400 false))

(declare-fun b!784401 () Bool)

(assert (=> b!784401 (= e!436101 e!436105)))

(declare-fun res!530796 () Bool)

(assert (=> b!784401 (=> res!530796 e!436105)))

(assert (=> b!784401 (= res!530796 (= lt!349653 lt!349660))))

(assert (=> b!784401 (= lt!349653 (select (store (arr!20451 a!3186) i!1173 k!2102) index!1321))))

(assert (= (and start!67686 res!530792) b!784394))

(assert (= (and b!784394 res!530791) b!784393))

(assert (= (and b!784393 res!530800) b!784395))

(assert (= (and b!784395 res!530802) b!784397))

(assert (= (and b!784397 res!530804) b!784385))

(assert (= (and b!784385 res!530795) b!784379))

(assert (= (and b!784379 res!530788) b!784387))

(assert (= (and b!784387 res!530786) b!784398))

(assert (= (and b!784398 res!530787) b!784388))

(assert (= (and b!784388 res!530803) b!784396))

(assert (= (and b!784396 res!530797) b!784382))

(assert (= (and b!784382 c!87204) b!784390))

(assert (= (and b!784382 (not c!87204)) b!784383))

(assert (= (and b!784382 res!530789) b!784399))

(assert (= (and b!784399 res!530793) b!784384))

(assert (= (and b!784384 res!530794) b!784389))

(assert (= (and b!784384 (not res!530801)) b!784392))

(assert (= (and b!784392 (not res!530798)) b!784401))

(assert (= (and b!784401 (not res!530796)) b!784391))

(assert (= (and b!784391 c!87205) b!784400))

(assert (= (and b!784391 (not c!87205)) b!784380))

(assert (= (and b!784391 res!530799) b!784386))

(assert (= (and b!784386 res!530790) b!784381))

(declare-fun m!726713 () Bool)

(assert (=> b!784386 m!726713))

(declare-fun m!726715 () Bool)

(assert (=> b!784386 m!726715))

(declare-fun m!726717 () Bool)

(assert (=> b!784383 m!726717))

(assert (=> b!784383 m!726717))

(declare-fun m!726719 () Bool)

(assert (=> b!784383 m!726719))

(declare-fun m!726721 () Bool)

(assert (=> b!784396 m!726721))

(assert (=> b!784388 m!726717))

(assert (=> b!784388 m!726717))

(declare-fun m!726723 () Bool)

(assert (=> b!784388 m!726723))

(assert (=> b!784388 m!726723))

(assert (=> b!784388 m!726717))

(declare-fun m!726725 () Bool)

(assert (=> b!784388 m!726725))

(declare-fun m!726727 () Bool)

(assert (=> b!784387 m!726727))

(declare-fun m!726729 () Bool)

(assert (=> start!67686 m!726729))

(declare-fun m!726731 () Bool)

(assert (=> start!67686 m!726731))

(assert (=> b!784390 m!726717))

(assert (=> b!784390 m!726717))

(declare-fun m!726733 () Bool)

(assert (=> b!784390 m!726733))

(assert (=> b!784389 m!726717))

(assert (=> b!784389 m!726717))

(declare-fun m!726735 () Bool)

(assert (=> b!784389 m!726735))

(assert (=> b!784384 m!726717))

(assert (=> b!784384 m!726717))

(declare-fun m!726737 () Bool)

(assert (=> b!784384 m!726737))

(declare-fun m!726739 () Bool)

(assert (=> b!784384 m!726739))

(declare-fun m!726741 () Bool)

(assert (=> b!784384 m!726741))

(declare-fun m!726743 () Bool)

(assert (=> b!784399 m!726743))

(declare-fun m!726745 () Bool)

(assert (=> b!784399 m!726745))

(declare-fun m!726747 () Bool)

(assert (=> b!784399 m!726747))

(assert (=> b!784399 m!726745))

(declare-fun m!726749 () Bool)

(assert (=> b!784399 m!726749))

(declare-fun m!726751 () Bool)

(assert (=> b!784399 m!726751))

(assert (=> b!784392 m!726717))

(assert (=> b!784392 m!726717))

(assert (=> b!784392 m!726719))

(declare-fun m!726753 () Bool)

(assert (=> b!784379 m!726753))

(assert (=> b!784393 m!726717))

(assert (=> b!784393 m!726717))

(declare-fun m!726755 () Bool)

(assert (=> b!784393 m!726755))

(declare-fun m!726757 () Bool)

(assert (=> b!784385 m!726757))

(assert (=> b!784401 m!726751))

(declare-fun m!726759 () Bool)

(assert (=> b!784401 m!726759))

(declare-fun m!726761 () Bool)

(assert (=> b!784397 m!726761))

(declare-fun m!726763 () Bool)

(assert (=> b!784395 m!726763))

(push 1)

