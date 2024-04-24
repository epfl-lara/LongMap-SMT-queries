; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66898 () Bool)

(assert start!66898)

(declare-fun b!770441 () Bool)

(declare-fun res!520920 () Bool)

(declare-fun e!429053 () Bool)

(assert (=> b!770441 (=> (not res!520920) (not e!429053))))

(declare-datatypes ((array!42340 0))(
  ( (array!42341 (arr!20266 (Array (_ BitVec 32) (_ BitVec 64))) (size!20686 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42340)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770441 (= res!520920 (validKeyInArray!0 (select (arr!20266 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!770442 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!429054 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7822 0))(
  ( (MissingZero!7822 (index!33656 (_ BitVec 32))) (Found!7822 (index!33657 (_ BitVec 32))) (Intermediate!7822 (undefined!8634 Bool) (index!33658 (_ BitVec 32)) (x!64748 (_ BitVec 32))) (Undefined!7822) (MissingVacant!7822 (index!33659 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42340 (_ BitVec 32)) SeekEntryResult!7822)

(assert (=> b!770442 (= e!429054 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) (Found!7822 j!159)))))

(declare-fun b!770443 () Bool)

(declare-fun res!520917 () Bool)

(declare-fun e!429046 () Bool)

(assert (=> b!770443 (=> (not res!520917) (not e!429046))))

(assert (=> b!770443 (= res!520917 e!429054)))

(declare-fun c!85166 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770443 (= c!85166 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770444 () Bool)

(declare-datatypes ((Unit!26479 0))(
  ( (Unit!26480) )
))
(declare-fun e!429050 () Unit!26479)

(declare-fun Unit!26481 () Unit!26479)

(assert (=> b!770444 (= e!429050 Unit!26481)))

(declare-fun lt!342813 () (_ BitVec 32))

(declare-fun lt!342816 () SeekEntryResult!7822)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42340 (_ BitVec 32)) SeekEntryResult!7822)

(assert (=> b!770444 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342813 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342816)))

(declare-fun b!770445 () Bool)

(declare-fun res!520908 () Bool)

(assert (=> b!770445 (=> (not res!520908) (not e!429053))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!770445 (= res!520908 (validKeyInArray!0 k0!2102))))

(declare-fun lt!342814 () SeekEntryResult!7822)

(declare-fun e!429055 () Bool)

(declare-fun b!770447 () Bool)

(assert (=> b!770447 (= e!429055 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342814))))

(declare-fun b!770448 () Bool)

(declare-fun e!429049 () Bool)

(assert (=> b!770448 (= e!429049 e!429055)))

(declare-fun res!520910 () Bool)

(assert (=> b!770448 (=> (not res!520910) (not e!429055))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42340 (_ BitVec 32)) SeekEntryResult!7822)

(assert (=> b!770448 (= res!520910 (= (seekEntryOrOpen!0 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342814))))

(assert (=> b!770448 (= lt!342814 (Found!7822 j!159))))

(declare-fun b!770449 () Bool)

(declare-fun e!429047 () Bool)

(assert (=> b!770449 (= e!429046 e!429047)))

(declare-fun res!520923 () Bool)

(assert (=> b!770449 (=> (not res!520923) (not e!429047))))

(declare-fun lt!342823 () SeekEntryResult!7822)

(declare-fun lt!342815 () SeekEntryResult!7822)

(assert (=> b!770449 (= res!520923 (= lt!342823 lt!342815))))

(declare-fun lt!342820 () (_ BitVec 64))

(declare-fun lt!342819 () array!42340)

(assert (=> b!770449 (= lt!342815 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342820 lt!342819 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770449 (= lt!342823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342820 mask!3328) lt!342820 lt!342819 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770449 (= lt!342820 (select (store (arr!20266 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770449 (= lt!342819 (array!42341 (store (arr!20266 a!3186) i!1173 k0!2102) (size!20686 a!3186)))))

(declare-fun b!770450 () Bool)

(declare-fun res!520914 () Bool)

(declare-fun e!429048 () Bool)

(assert (=> b!770450 (=> (not res!520914) (not e!429048))))

(assert (=> b!770450 (= res!520914 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20686 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20686 a!3186))))))

(declare-fun b!770451 () Bool)

(assert (=> b!770451 (= e!429048 e!429046)))

(declare-fun res!520912 () Bool)

(assert (=> b!770451 (=> (not res!520912) (not e!429046))))

(assert (=> b!770451 (= res!520912 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20266 a!3186) j!159) mask!3328) (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342816))))

(assert (=> b!770451 (= lt!342816 (Intermediate!7822 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770452 () Bool)

(assert (=> b!770452 (= e!429053 e!429048)))

(declare-fun res!520909 () Bool)

(assert (=> b!770452 (=> (not res!520909) (not e!429048))))

(declare-fun lt!342817 () SeekEntryResult!7822)

(assert (=> b!770452 (= res!520909 (or (= lt!342817 (MissingZero!7822 i!1173)) (= lt!342817 (MissingVacant!7822 i!1173))))))

(assert (=> b!770452 (= lt!342817 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770453 () Bool)

(declare-fun e!429051 () Bool)

(assert (=> b!770453 (= e!429051 true)))

(declare-fun lt!342821 () Unit!26479)

(assert (=> b!770453 (= lt!342821 e!429050)))

(declare-fun c!85165 () Bool)

(assert (=> b!770453 (= c!85165 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770453 (= lt!342813 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!770454 () Bool)

(declare-fun Unit!26482 () Unit!26479)

(assert (=> b!770454 (= e!429050 Unit!26482)))

(declare-fun lt!342818 () SeekEntryResult!7822)

(assert (=> b!770454 (= lt!342818 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20266 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770454 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342813 resIntermediateIndex!5 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) (Found!7822 j!159))))

(declare-fun res!520911 () Bool)

(assert (=> start!66898 (=> (not res!520911) (not e!429053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66898 (= res!520911 (validMask!0 mask!3328))))

(assert (=> start!66898 e!429053))

(assert (=> start!66898 true))

(declare-fun array_inv!16125 (array!42340) Bool)

(assert (=> start!66898 (array_inv!16125 a!3186)))

(declare-fun b!770446 () Bool)

(declare-fun res!520918 () Bool)

(assert (=> b!770446 (=> (not res!520918) (not e!429048))))

(declare-datatypes ((List!14175 0))(
  ( (Nil!14172) (Cons!14171 (h!15276 (_ BitVec 64)) (t!20482 List!14175)) )
))
(declare-fun arrayNoDuplicates!0 (array!42340 (_ BitVec 32) List!14175) Bool)

(assert (=> b!770446 (= res!520918 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14172))))

(declare-fun b!770455 () Bool)

(declare-fun res!520922 () Bool)

(assert (=> b!770455 (=> (not res!520922) (not e!429053))))

(declare-fun arrayContainsKey!0 (array!42340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770455 (= res!520922 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770456 () Bool)

(declare-fun res!520919 () Bool)

(assert (=> b!770456 (=> (not res!520919) (not e!429048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42340 (_ BitVec 32)) Bool)

(assert (=> b!770456 (= res!520919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770457 () Bool)

(declare-fun res!520921 () Bool)

(assert (=> b!770457 (=> (not res!520921) (not e!429053))))

(assert (=> b!770457 (= res!520921 (and (= (size!20686 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20686 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20686 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770458 () Bool)

(assert (=> b!770458 (= e!429054 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20266 a!3186) j!159) a!3186 mask!3328) lt!342816))))

(declare-fun b!770459 () Bool)

(assert (=> b!770459 (= e!429047 (not e!429051))))

(declare-fun res!520915 () Bool)

(assert (=> b!770459 (=> res!520915 e!429051)))

(get-info :version)

(assert (=> b!770459 (= res!520915 (or (not ((_ is Intermediate!7822) lt!342815)) (bvsge x!1131 (x!64748 lt!342815))))))

(assert (=> b!770459 e!429049))

(declare-fun res!520916 () Bool)

(assert (=> b!770459 (=> (not res!520916) (not e!429049))))

(assert (=> b!770459 (= res!520916 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342822 () Unit!26479)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26479)

(assert (=> b!770459 (= lt!342822 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770460 () Bool)

(declare-fun res!520913 () Bool)

(assert (=> b!770460 (=> (not res!520913) (not e!429046))))

(assert (=> b!770460 (= res!520913 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20266 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66898 res!520911) b!770457))

(assert (= (and b!770457 res!520921) b!770441))

(assert (= (and b!770441 res!520920) b!770445))

(assert (= (and b!770445 res!520908) b!770455))

(assert (= (and b!770455 res!520922) b!770452))

(assert (= (and b!770452 res!520909) b!770456))

(assert (= (and b!770456 res!520919) b!770446))

(assert (= (and b!770446 res!520918) b!770450))

(assert (= (and b!770450 res!520914) b!770451))

(assert (= (and b!770451 res!520912) b!770460))

(assert (= (and b!770460 res!520913) b!770443))

(assert (= (and b!770443 c!85166) b!770458))

(assert (= (and b!770443 (not c!85166)) b!770442))

(assert (= (and b!770443 res!520917) b!770449))

(assert (= (and b!770449 res!520923) b!770459))

(assert (= (and b!770459 res!520916) b!770448))

(assert (= (and b!770448 res!520910) b!770447))

(assert (= (and b!770459 (not res!520915)) b!770453))

(assert (= (and b!770453 c!85165) b!770444))

(assert (= (and b!770453 (not c!85165)) b!770454))

(declare-fun m!716207 () Bool)

(assert (=> b!770447 m!716207))

(assert (=> b!770447 m!716207))

(declare-fun m!716209 () Bool)

(assert (=> b!770447 m!716209))

(assert (=> b!770442 m!716207))

(assert (=> b!770442 m!716207))

(declare-fun m!716211 () Bool)

(assert (=> b!770442 m!716211))

(declare-fun m!716213 () Bool)

(assert (=> b!770456 m!716213))

(assert (=> b!770454 m!716207))

(assert (=> b!770454 m!716207))

(assert (=> b!770454 m!716211))

(assert (=> b!770454 m!716207))

(declare-fun m!716215 () Bool)

(assert (=> b!770454 m!716215))

(declare-fun m!716217 () Bool)

(assert (=> b!770452 m!716217))

(declare-fun m!716219 () Bool)

(assert (=> b!770455 m!716219))

(assert (=> b!770441 m!716207))

(assert (=> b!770441 m!716207))

(declare-fun m!716221 () Bool)

(assert (=> b!770441 m!716221))

(assert (=> b!770451 m!716207))

(assert (=> b!770451 m!716207))

(declare-fun m!716223 () Bool)

(assert (=> b!770451 m!716223))

(assert (=> b!770451 m!716223))

(assert (=> b!770451 m!716207))

(declare-fun m!716225 () Bool)

(assert (=> b!770451 m!716225))

(declare-fun m!716227 () Bool)

(assert (=> b!770449 m!716227))

(declare-fun m!716229 () Bool)

(assert (=> b!770449 m!716229))

(declare-fun m!716231 () Bool)

(assert (=> b!770449 m!716231))

(assert (=> b!770449 m!716227))

(declare-fun m!716233 () Bool)

(assert (=> b!770449 m!716233))

(declare-fun m!716235 () Bool)

(assert (=> b!770449 m!716235))

(declare-fun m!716237 () Bool)

(assert (=> start!66898 m!716237))

(declare-fun m!716239 () Bool)

(assert (=> start!66898 m!716239))

(declare-fun m!716241 () Bool)

(assert (=> b!770446 m!716241))

(assert (=> b!770458 m!716207))

(assert (=> b!770458 m!716207))

(declare-fun m!716243 () Bool)

(assert (=> b!770458 m!716243))

(declare-fun m!716245 () Bool)

(assert (=> b!770453 m!716245))

(declare-fun m!716247 () Bool)

(assert (=> b!770459 m!716247))

(declare-fun m!716249 () Bool)

(assert (=> b!770459 m!716249))

(declare-fun m!716251 () Bool)

(assert (=> b!770460 m!716251))

(assert (=> b!770444 m!716207))

(assert (=> b!770444 m!716207))

(declare-fun m!716253 () Bool)

(assert (=> b!770444 m!716253))

(assert (=> b!770448 m!716207))

(assert (=> b!770448 m!716207))

(declare-fun m!716255 () Bool)

(assert (=> b!770448 m!716255))

(declare-fun m!716257 () Bool)

(assert (=> b!770445 m!716257))

(check-sat (not b!770454) (not b!770449) (not b!770446) (not b!770452) (not b!770441) (not b!770456) (not b!770448) (not b!770453) (not b!770444) (not b!770445) (not b!770459) (not b!770451) (not b!770455) (not b!770458) (not start!66898) (not b!770442) (not b!770447))
(check-sat)
