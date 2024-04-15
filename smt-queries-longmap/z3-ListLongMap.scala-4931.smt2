; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67874 () Bool)

(assert start!67874)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42870 0))(
  ( (array!42871 (arr!20522 (Array (_ BitVec 32) (_ BitVec 64))) (size!20943 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42870)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!789539 () Bool)

(declare-datatypes ((SeekEntryResult!8119 0))(
  ( (MissingZero!8119 (index!34844 (_ BitVec 32))) (Found!8119 (index!34845 (_ BitVec 32))) (Intermediate!8119 (undefined!8931 Bool) (index!34846 (_ BitVec 32)) (x!65791 (_ BitVec 32))) (Undefined!8119) (MissingVacant!8119 (index!34847 (_ BitVec 32))) )
))
(declare-fun lt!352219 () SeekEntryResult!8119)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!438813 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42870 (_ BitVec 32)) SeekEntryResult!8119)

(assert (=> b!789539 (= e!438813 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20522 a!3186) j!159) a!3186 mask!3328) lt!352219))))

(declare-fun b!789540 () Bool)

(declare-fun e!438820 () Bool)

(declare-fun e!438810 () Bool)

(assert (=> b!789540 (= e!438820 e!438810)))

(declare-fun res!534912 () Bool)

(assert (=> b!789540 (=> res!534912 e!438810)))

(declare-fun lt!352232 () (_ BitVec 64))

(declare-fun lt!352222 () (_ BitVec 64))

(assert (=> b!789540 (= res!534912 (= lt!352232 lt!352222))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!789540 (= lt!352232 (select (store (arr!20522 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!789542 () Bool)

(declare-datatypes ((Unit!27344 0))(
  ( (Unit!27345) )
))
(declare-fun e!438814 () Unit!27344)

(declare-fun Unit!27346 () Unit!27344)

(assert (=> b!789542 (= e!438814 Unit!27346)))

(declare-fun b!789543 () Bool)

(declare-fun res!534895 () Bool)

(declare-fun e!438812 () Bool)

(assert (=> b!789543 (=> (not res!534895) (not e!438812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42870 (_ BitVec 32)) Bool)

(assert (=> b!789543 (= res!534895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789544 () Bool)

(declare-fun e!438816 () Bool)

(assert (=> b!789544 (= e!438812 e!438816)))

(declare-fun res!534897 () Bool)

(assert (=> b!789544 (=> (not res!534897) (not e!438816))))

(declare-fun lt!352223 () SeekEntryResult!8119)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42870 (_ BitVec 32)) SeekEntryResult!8119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789544 (= res!534897 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20522 a!3186) j!159) mask!3328) (select (arr!20522 a!3186) j!159) a!3186 mask!3328) lt!352223))))

(assert (=> b!789544 (= lt!352223 (Intermediate!8119 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789545 () Bool)

(declare-fun e!438815 () Bool)

(assert (=> b!789545 (= e!438815 true)))

(declare-fun lt!352227 () SeekEntryResult!8119)

(declare-fun lt!352220 () SeekEntryResult!8119)

(assert (=> b!789545 (= lt!352227 lt!352220)))

(declare-fun lt!352229 () Unit!27344)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42870 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27344)

(assert (=> b!789545 (= lt!352229 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789546 () Bool)

(declare-fun res!534911 () Bool)

(assert (=> b!789546 (=> (not res!534911) (not e!438816))))

(assert (=> b!789546 (= res!534911 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20522 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789547 () Bool)

(declare-fun res!534903 () Bool)

(assert (=> b!789547 (=> (not res!534903) (not e!438812))))

(assert (=> b!789547 (= res!534903 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20943 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20943 a!3186))))))

(declare-fun b!789548 () Bool)

(declare-fun e!438811 () Bool)

(declare-fun e!438819 () Bool)

(assert (=> b!789548 (= e!438811 (not e!438819))))

(declare-fun res!534910 () Bool)

(assert (=> b!789548 (=> res!534910 e!438819)))

(declare-fun lt!352224 () SeekEntryResult!8119)

(get-info :version)

(assert (=> b!789548 (= res!534910 (or (not ((_ is Intermediate!8119) lt!352224)) (bvslt x!1131 (x!65791 lt!352224)) (not (= x!1131 (x!65791 lt!352224))) (not (= index!1321 (index!34846 lt!352224)))))))

(assert (=> b!789548 e!438813))

(declare-fun res!534909 () Bool)

(assert (=> b!789548 (=> (not res!534909) (not e!438813))))

(declare-fun lt!352221 () SeekEntryResult!8119)

(assert (=> b!789548 (= res!534909 (= lt!352221 lt!352219))))

(assert (=> b!789548 (= lt!352219 (Found!8119 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42870 (_ BitVec 32)) SeekEntryResult!8119)

(assert (=> b!789548 (= lt!352221 (seekEntryOrOpen!0 (select (arr!20522 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789548 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352228 () Unit!27344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27344)

(assert (=> b!789548 (= lt!352228 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789549 () Bool)

(declare-fun res!534906 () Bool)

(declare-fun e!438817 () Bool)

(assert (=> b!789549 (=> (not res!534906) (not e!438817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789549 (= res!534906 (validKeyInArray!0 (select (arr!20522 a!3186) j!159)))))

(declare-fun b!789550 () Bool)

(declare-fun res!534908 () Bool)

(assert (=> b!789550 (=> (not res!534908) (not e!438812))))

(declare-datatypes ((List!14563 0))(
  ( (Nil!14560) (Cons!14559 (h!15685 (_ BitVec 64)) (t!20869 List!14563)) )
))
(declare-fun arrayNoDuplicates!0 (array!42870 (_ BitVec 32) List!14563) Bool)

(assert (=> b!789550 (= res!534908 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14560))))

(declare-fun b!789551 () Bool)

(assert (=> b!789551 (= e!438819 e!438820)))

(declare-fun res!534907 () Bool)

(assert (=> b!789551 (=> res!534907 e!438820)))

(assert (=> b!789551 (= res!534907 (not (= lt!352220 lt!352219)))))

(assert (=> b!789551 (= lt!352220 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20522 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!438818 () Bool)

(declare-fun b!789552 () Bool)

(assert (=> b!789552 (= e!438818 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20522 a!3186) j!159) a!3186 mask!3328) (Found!8119 j!159)))))

(declare-fun b!789553 () Bool)

(assert (=> b!789553 (= e!438818 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20522 a!3186) j!159) a!3186 mask!3328) lt!352223))))

(declare-fun b!789554 () Bool)

(declare-fun res!534899 () Bool)

(assert (=> b!789554 (=> (not res!534899) (not e!438817))))

(assert (=> b!789554 (= res!534899 (validKeyInArray!0 k0!2102))))

(declare-fun res!534904 () Bool)

(assert (=> start!67874 (=> (not res!534904) (not e!438817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67874 (= res!534904 (validMask!0 mask!3328))))

(assert (=> start!67874 e!438817))

(assert (=> start!67874 true))

(declare-fun array_inv!16405 (array!42870) Bool)

(assert (=> start!67874 (array_inv!16405 a!3186)))

(declare-fun b!789541 () Bool)

(declare-fun res!534898 () Bool)

(assert (=> b!789541 (=> (not res!534898) (not e!438817))))

(declare-fun arrayContainsKey!0 (array!42870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789541 (= res!534898 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789555 () Bool)

(declare-fun res!534901 () Bool)

(assert (=> b!789555 (=> (not res!534901) (not e!438816))))

(assert (=> b!789555 (= res!534901 e!438818)))

(declare-fun c!87731 () Bool)

(assert (=> b!789555 (= c!87731 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789556 () Bool)

(declare-fun Unit!27347 () Unit!27344)

(assert (=> b!789556 (= e!438814 Unit!27347)))

(assert (=> b!789556 false))

(declare-fun b!789557 () Bool)

(declare-fun res!534902 () Bool)

(assert (=> b!789557 (=> (not res!534902) (not e!438817))))

(assert (=> b!789557 (= res!534902 (and (= (size!20943 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20943 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20943 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789558 () Bool)

(assert (=> b!789558 (= e!438810 e!438815)))

(declare-fun res!534905 () Bool)

(assert (=> b!789558 (=> res!534905 e!438815)))

(assert (=> b!789558 (= res!534905 (or (not (= (select (arr!20522 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352230 () SeekEntryResult!8119)

(assert (=> b!789558 (and (= lt!352230 lt!352227) (= lt!352221 lt!352220))))

(declare-fun lt!352226 () array!42870)

(assert (=> b!789558 (= lt!352227 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352222 lt!352226 mask!3328))))

(assert (=> b!789558 (= lt!352230 (seekEntryOrOpen!0 lt!352222 lt!352226 mask!3328))))

(assert (=> b!789558 (= lt!352232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352225 () Unit!27344)

(assert (=> b!789558 (= lt!352225 e!438814)))

(declare-fun c!87732 () Bool)

(assert (=> b!789558 (= c!87732 (= lt!352232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789559 () Bool)

(assert (=> b!789559 (= e!438816 e!438811)))

(declare-fun res!534900 () Bool)

(assert (=> b!789559 (=> (not res!534900) (not e!438811))))

(declare-fun lt!352218 () SeekEntryResult!8119)

(assert (=> b!789559 (= res!534900 (= lt!352218 lt!352224))))

(assert (=> b!789559 (= lt!352224 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352222 lt!352226 mask!3328))))

(assert (=> b!789559 (= lt!352218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352222 mask!3328) lt!352222 lt!352226 mask!3328))))

(assert (=> b!789559 (= lt!352222 (select (store (arr!20522 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789559 (= lt!352226 (array!42871 (store (arr!20522 a!3186) i!1173 k0!2102) (size!20943 a!3186)))))

(declare-fun b!789560 () Bool)

(assert (=> b!789560 (= e!438817 e!438812)))

(declare-fun res!534896 () Bool)

(assert (=> b!789560 (=> (not res!534896) (not e!438812))))

(declare-fun lt!352231 () SeekEntryResult!8119)

(assert (=> b!789560 (= res!534896 (or (= lt!352231 (MissingZero!8119 i!1173)) (= lt!352231 (MissingVacant!8119 i!1173))))))

(assert (=> b!789560 (= lt!352231 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!67874 res!534904) b!789557))

(assert (= (and b!789557 res!534902) b!789549))

(assert (= (and b!789549 res!534906) b!789554))

(assert (= (and b!789554 res!534899) b!789541))

(assert (= (and b!789541 res!534898) b!789560))

(assert (= (and b!789560 res!534896) b!789543))

(assert (= (and b!789543 res!534895) b!789550))

(assert (= (and b!789550 res!534908) b!789547))

(assert (= (and b!789547 res!534903) b!789544))

(assert (= (and b!789544 res!534897) b!789546))

(assert (= (and b!789546 res!534911) b!789555))

(assert (= (and b!789555 c!87731) b!789553))

(assert (= (and b!789555 (not c!87731)) b!789552))

(assert (= (and b!789555 res!534901) b!789559))

(assert (= (and b!789559 res!534900) b!789548))

(assert (= (and b!789548 res!534909) b!789539))

(assert (= (and b!789548 (not res!534910)) b!789551))

(assert (= (and b!789551 (not res!534907)) b!789540))

(assert (= (and b!789540 (not res!534912)) b!789558))

(assert (= (and b!789558 c!87732) b!789556))

(assert (= (and b!789558 (not c!87732)) b!789542))

(assert (= (and b!789558 (not res!534905)) b!789545))

(declare-fun m!730047 () Bool)

(assert (=> b!789553 m!730047))

(assert (=> b!789553 m!730047))

(declare-fun m!730049 () Bool)

(assert (=> b!789553 m!730049))

(declare-fun m!730051 () Bool)

(assert (=> b!789558 m!730051))

(declare-fun m!730053 () Bool)

(assert (=> b!789558 m!730053))

(declare-fun m!730055 () Bool)

(assert (=> b!789558 m!730055))

(declare-fun m!730057 () Bool)

(assert (=> b!789540 m!730057))

(declare-fun m!730059 () Bool)

(assert (=> b!789540 m!730059))

(assert (=> b!789548 m!730047))

(assert (=> b!789548 m!730047))

(declare-fun m!730061 () Bool)

(assert (=> b!789548 m!730061))

(declare-fun m!730063 () Bool)

(assert (=> b!789548 m!730063))

(declare-fun m!730065 () Bool)

(assert (=> b!789548 m!730065))

(declare-fun m!730067 () Bool)

(assert (=> b!789541 m!730067))

(assert (=> b!789544 m!730047))

(assert (=> b!789544 m!730047))

(declare-fun m!730069 () Bool)

(assert (=> b!789544 m!730069))

(assert (=> b!789544 m!730069))

(assert (=> b!789544 m!730047))

(declare-fun m!730071 () Bool)

(assert (=> b!789544 m!730071))

(declare-fun m!730073 () Bool)

(assert (=> b!789554 m!730073))

(declare-fun m!730075 () Bool)

(assert (=> b!789545 m!730075))

(declare-fun m!730077 () Bool)

(assert (=> start!67874 m!730077))

(declare-fun m!730079 () Bool)

(assert (=> start!67874 m!730079))

(declare-fun m!730081 () Bool)

(assert (=> b!789546 m!730081))

(assert (=> b!789559 m!730057))

(declare-fun m!730083 () Bool)

(assert (=> b!789559 m!730083))

(declare-fun m!730085 () Bool)

(assert (=> b!789559 m!730085))

(declare-fun m!730087 () Bool)

(assert (=> b!789559 m!730087))

(assert (=> b!789559 m!730085))

(declare-fun m!730089 () Bool)

(assert (=> b!789559 m!730089))

(declare-fun m!730091 () Bool)

(assert (=> b!789560 m!730091))

(declare-fun m!730093 () Bool)

(assert (=> b!789550 m!730093))

(assert (=> b!789549 m!730047))

(assert (=> b!789549 m!730047))

(declare-fun m!730095 () Bool)

(assert (=> b!789549 m!730095))

(assert (=> b!789551 m!730047))

(assert (=> b!789551 m!730047))

(declare-fun m!730097 () Bool)

(assert (=> b!789551 m!730097))

(assert (=> b!789552 m!730047))

(assert (=> b!789552 m!730047))

(assert (=> b!789552 m!730097))

(declare-fun m!730099 () Bool)

(assert (=> b!789543 m!730099))

(assert (=> b!789539 m!730047))

(assert (=> b!789539 m!730047))

(declare-fun m!730101 () Bool)

(assert (=> b!789539 m!730101))

(check-sat (not b!789541) (not b!789550) (not b!789554) (not b!789548) (not b!789558) (not b!789552) (not b!789560) (not b!789559) (not b!789539) (not b!789543) (not b!789553) (not b!789544) (not start!67874) (not b!789551) (not b!789545) (not b!789549))
(check-sat)
