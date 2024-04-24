; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65892 () Bool)

(assert start!65892)

(declare-fun b!756516 () Bool)

(declare-fun res!511195 () Bool)

(declare-fun e!421935 () Bool)

(assert (=> b!756516 (=> (not res!511195) (not e!421935))))

(declare-datatypes ((array!41935 0))(
  ( (array!41936 (arr!20077 (Array (_ BitVec 32) (_ BitVec 64))) (size!20497 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41935)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!756516 (= res!511195 (and (= (size!20497 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20497 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20497 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756517 () Bool)

(declare-fun e!421927 () Bool)

(declare-fun e!421929 () Bool)

(assert (=> b!756517 (= e!421927 (not e!421929))))

(declare-fun res!511208 () Bool)

(assert (=> b!756517 (=> res!511208 e!421929)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7633 0))(
  ( (MissingZero!7633 (index!32900 (_ BitVec 32))) (Found!7633 (index!32901 (_ BitVec 32))) (Intermediate!7633 (undefined!8445 Bool) (index!32902 (_ BitVec 32)) (x!63963 (_ BitVec 32))) (Undefined!7633) (MissingVacant!7633 (index!32903 (_ BitVec 32))) )
))
(declare-fun lt!336752 () SeekEntryResult!7633)

(get-info :version)

(assert (=> b!756517 (= res!511208 (or (not ((_ is Intermediate!7633) lt!336752)) (bvslt x!1131 (x!63963 lt!336752)) (not (= x!1131 (x!63963 lt!336752))) (not (= index!1321 (index!32902 lt!336752)))))))

(declare-fun e!421930 () Bool)

(assert (=> b!756517 e!421930))

(declare-fun res!511202 () Bool)

(assert (=> b!756517 (=> (not res!511202) (not e!421930))))

(declare-fun lt!336762 () SeekEntryResult!7633)

(declare-fun lt!336756 () SeekEntryResult!7633)

(assert (=> b!756517 (= res!511202 (= lt!336762 lt!336756))))

(assert (=> b!756517 (= lt!336756 (Found!7633 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41935 (_ BitVec 32)) SeekEntryResult!7633)

(assert (=> b!756517 (= lt!336762 (seekEntryOrOpen!0 (select (arr!20077 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41935 (_ BitVec 32)) Bool)

(assert (=> b!756517 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26089 0))(
  ( (Unit!26090) )
))
(declare-fun lt!336757 () Unit!26089)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26089)

(assert (=> b!756517 (= lt!336757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756518 () Bool)

(declare-fun e!421926 () Bool)

(declare-fun lt!336751 () SeekEntryResult!7633)

(assert (=> b!756518 (= e!421926 (= lt!336762 lt!336751))))

(declare-fun b!756519 () Bool)

(declare-fun e!421932 () Unit!26089)

(declare-fun Unit!26091 () Unit!26089)

(assert (=> b!756519 (= e!421932 Unit!26091)))

(declare-fun b!756520 () Bool)

(declare-fun res!511201 () Bool)

(assert (=> b!756520 (=> (not res!511201) (not e!421935))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756520 (= res!511201 (validKeyInArray!0 k0!2102))))

(declare-fun b!756521 () Bool)

(declare-fun res!511204 () Bool)

(declare-fun e!421931 () Bool)

(assert (=> b!756521 (=> (not res!511204) (not e!421931))))

(declare-fun e!421934 () Bool)

(assert (=> b!756521 (= res!511204 e!421934)))

(declare-fun c!83045 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756521 (= c!83045 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756522 () Bool)

(declare-fun e!421933 () Bool)

(declare-fun e!421924 () Bool)

(assert (=> b!756522 (= e!421933 e!421924)))

(declare-fun res!511211 () Bool)

(assert (=> b!756522 (=> res!511211 e!421924)))

(declare-fun lt!336754 () (_ BitVec 64))

(declare-fun lt!336761 () (_ BitVec 64))

(assert (=> b!756522 (= res!511211 (= lt!336754 lt!336761))))

(assert (=> b!756522 (= lt!336754 (select (store (arr!20077 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756523 () Bool)

(declare-fun res!511210 () Bool)

(assert (=> b!756523 (=> (not res!511210) (not e!421935))))

(assert (=> b!756523 (= res!511210 (validKeyInArray!0 (select (arr!20077 a!3186) j!159)))))

(declare-fun res!511203 () Bool)

(assert (=> start!65892 (=> (not res!511203) (not e!421935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65892 (= res!511203 (validMask!0 mask!3328))))

(assert (=> start!65892 e!421935))

(assert (=> start!65892 true))

(declare-fun array_inv!15936 (array!41935) Bool)

(assert (=> start!65892 (array_inv!15936 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!756524 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41935 (_ BitVec 32)) SeekEntryResult!7633)

(assert (=> b!756524 (= e!421934 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20077 a!3186) j!159) a!3186 mask!3328) (Found!7633 j!159)))))

(declare-fun b!756525 () Bool)

(declare-fun res!511213 () Bool)

(declare-fun e!421925 () Bool)

(assert (=> b!756525 (=> (not res!511213) (not e!421925))))

(declare-datatypes ((List!13986 0))(
  ( (Nil!13983) (Cons!13982 (h!15060 (_ BitVec 64)) (t!20293 List!13986)) )
))
(declare-fun arrayNoDuplicates!0 (array!41935 (_ BitVec 32) List!13986) Bool)

(assert (=> b!756525 (= res!511213 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13983))))

(declare-fun b!756526 () Bool)

(declare-fun res!511199 () Bool)

(assert (=> b!756526 (=> (not res!511199) (not e!421925))))

(assert (=> b!756526 (= res!511199 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20497 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20497 a!3186))))))

(declare-fun b!756527 () Bool)

(declare-fun res!511207 () Bool)

(assert (=> b!756527 (=> (not res!511207) (not e!421925))))

(assert (=> b!756527 (= res!511207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!336758 () SeekEntryResult!7633)

(declare-fun b!756528 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41935 (_ BitVec 32)) SeekEntryResult!7633)

(assert (=> b!756528 (= e!421934 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20077 a!3186) j!159) a!3186 mask!3328) lt!336758))))

(declare-fun b!756529 () Bool)

(declare-fun res!511205 () Bool)

(assert (=> b!756529 (=> (not res!511205) (not e!421935))))

(declare-fun arrayContainsKey!0 (array!41935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756529 (= res!511205 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756530 () Bool)

(declare-fun Unit!26092 () Unit!26089)

(assert (=> b!756530 (= e!421932 Unit!26092)))

(assert (=> b!756530 false))

(declare-fun b!756531 () Bool)

(assert (=> b!756531 (= e!421930 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20077 a!3186) j!159) a!3186 mask!3328) lt!336756))))

(declare-fun b!756532 () Bool)

(assert (=> b!756532 (= e!421925 e!421931)))

(declare-fun res!511197 () Bool)

(assert (=> b!756532 (=> (not res!511197) (not e!421931))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756532 (= res!511197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20077 a!3186) j!159) mask!3328) (select (arr!20077 a!3186) j!159) a!3186 mask!3328) lt!336758))))

(assert (=> b!756532 (= lt!336758 (Intermediate!7633 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756533 () Bool)

(declare-fun res!511200 () Bool)

(assert (=> b!756533 (=> (not res!511200) (not e!421926))))

(declare-fun lt!336759 () array!41935)

(assert (=> b!756533 (= res!511200 (= (seekEntryOrOpen!0 lt!336761 lt!336759 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336761 lt!336759 mask!3328)))))

(declare-fun b!756534 () Bool)

(assert (=> b!756534 (= e!421935 e!421925)))

(declare-fun res!511209 () Bool)

(assert (=> b!756534 (=> (not res!511209) (not e!421925))))

(declare-fun lt!336760 () SeekEntryResult!7633)

(assert (=> b!756534 (= res!511209 (or (= lt!336760 (MissingZero!7633 i!1173)) (= lt!336760 (MissingVacant!7633 i!1173))))))

(assert (=> b!756534 (= lt!336760 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756535 () Bool)

(assert (=> b!756535 (= e!421929 e!421933)))

(declare-fun res!511212 () Bool)

(assert (=> b!756535 (=> res!511212 e!421933)))

(assert (=> b!756535 (= res!511212 (not (= lt!336751 lt!336756)))))

(assert (=> b!756535 (= lt!336751 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20077 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756536 () Bool)

(assert (=> b!756536 (= e!421931 e!421927)))

(declare-fun res!511198 () Bool)

(assert (=> b!756536 (=> (not res!511198) (not e!421927))))

(declare-fun lt!336755 () SeekEntryResult!7633)

(assert (=> b!756536 (= res!511198 (= lt!336755 lt!336752))))

(assert (=> b!756536 (= lt!336752 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336761 lt!336759 mask!3328))))

(assert (=> b!756536 (= lt!336755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336761 mask!3328) lt!336761 lt!336759 mask!3328))))

(assert (=> b!756536 (= lt!336761 (select (store (arr!20077 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756536 (= lt!336759 (array!41936 (store (arr!20077 a!3186) i!1173 k0!2102) (size!20497 a!3186)))))

(declare-fun b!756537 () Bool)

(declare-fun res!511196 () Bool)

(assert (=> b!756537 (=> (not res!511196) (not e!421931))))

(assert (=> b!756537 (= res!511196 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20077 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756538 () Bool)

(assert (=> b!756538 (= e!421924 true)))

(assert (=> b!756538 e!421926))

(declare-fun res!511206 () Bool)

(assert (=> b!756538 (=> (not res!511206) (not e!421926))))

(assert (=> b!756538 (= res!511206 (= lt!336754 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336753 () Unit!26089)

(assert (=> b!756538 (= lt!336753 e!421932)))

(declare-fun c!83044 () Bool)

(assert (=> b!756538 (= c!83044 (= lt!336754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65892 res!511203) b!756516))

(assert (= (and b!756516 res!511195) b!756523))

(assert (= (and b!756523 res!511210) b!756520))

(assert (= (and b!756520 res!511201) b!756529))

(assert (= (and b!756529 res!511205) b!756534))

(assert (= (and b!756534 res!511209) b!756527))

(assert (= (and b!756527 res!511207) b!756525))

(assert (= (and b!756525 res!511213) b!756526))

(assert (= (and b!756526 res!511199) b!756532))

(assert (= (and b!756532 res!511197) b!756537))

(assert (= (and b!756537 res!511196) b!756521))

(assert (= (and b!756521 c!83045) b!756528))

(assert (= (and b!756521 (not c!83045)) b!756524))

(assert (= (and b!756521 res!511204) b!756536))

(assert (= (and b!756536 res!511198) b!756517))

(assert (= (and b!756517 res!511202) b!756531))

(assert (= (and b!756517 (not res!511208)) b!756535))

(assert (= (and b!756535 (not res!511212)) b!756522))

(assert (= (and b!756522 (not res!511211)) b!756538))

(assert (= (and b!756538 c!83044) b!756530))

(assert (= (and b!756538 (not c!83044)) b!756519))

(assert (= (and b!756538 res!511206) b!756533))

(assert (= (and b!756533 res!511200) b!756518))

(declare-fun m!705051 () Bool)

(assert (=> b!756528 m!705051))

(assert (=> b!756528 m!705051))

(declare-fun m!705053 () Bool)

(assert (=> b!756528 m!705053))

(assert (=> b!756532 m!705051))

(assert (=> b!756532 m!705051))

(declare-fun m!705055 () Bool)

(assert (=> b!756532 m!705055))

(assert (=> b!756532 m!705055))

(assert (=> b!756532 m!705051))

(declare-fun m!705057 () Bool)

(assert (=> b!756532 m!705057))

(declare-fun m!705059 () Bool)

(assert (=> b!756527 m!705059))

(declare-fun m!705061 () Bool)

(assert (=> b!756533 m!705061))

(declare-fun m!705063 () Bool)

(assert (=> b!756533 m!705063))

(declare-fun m!705065 () Bool)

(assert (=> b!756537 m!705065))

(declare-fun m!705067 () Bool)

(assert (=> b!756522 m!705067))

(declare-fun m!705069 () Bool)

(assert (=> b!756522 m!705069))

(declare-fun m!705071 () Bool)

(assert (=> b!756520 m!705071))

(declare-fun m!705073 () Bool)

(assert (=> b!756536 m!705073))

(declare-fun m!705075 () Bool)

(assert (=> b!756536 m!705075))

(declare-fun m!705077 () Bool)

(assert (=> b!756536 m!705077))

(assert (=> b!756536 m!705067))

(assert (=> b!756536 m!705073))

(declare-fun m!705079 () Bool)

(assert (=> b!756536 m!705079))

(declare-fun m!705081 () Bool)

(assert (=> b!756534 m!705081))

(declare-fun m!705083 () Bool)

(assert (=> start!65892 m!705083))

(declare-fun m!705085 () Bool)

(assert (=> start!65892 m!705085))

(assert (=> b!756523 m!705051))

(assert (=> b!756523 m!705051))

(declare-fun m!705087 () Bool)

(assert (=> b!756523 m!705087))

(assert (=> b!756535 m!705051))

(assert (=> b!756535 m!705051))

(declare-fun m!705089 () Bool)

(assert (=> b!756535 m!705089))

(declare-fun m!705091 () Bool)

(assert (=> b!756529 m!705091))

(assert (=> b!756531 m!705051))

(assert (=> b!756531 m!705051))

(declare-fun m!705093 () Bool)

(assert (=> b!756531 m!705093))

(declare-fun m!705095 () Bool)

(assert (=> b!756525 m!705095))

(assert (=> b!756517 m!705051))

(assert (=> b!756517 m!705051))

(declare-fun m!705097 () Bool)

(assert (=> b!756517 m!705097))

(declare-fun m!705099 () Bool)

(assert (=> b!756517 m!705099))

(declare-fun m!705101 () Bool)

(assert (=> b!756517 m!705101))

(assert (=> b!756524 m!705051))

(assert (=> b!756524 m!705051))

(assert (=> b!756524 m!705089))

(check-sat (not b!756534) (not b!756531) (not b!756535) (not b!756524) (not b!756517) (not b!756528) (not b!756533) (not b!756529) (not b!756532) (not b!756527) (not b!756536) (not b!756523) (not b!756525) (not start!65892) (not b!756520))
(check-sat)
