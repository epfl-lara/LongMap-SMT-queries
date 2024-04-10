; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65334 () Bool)

(assert start!65334)

(declare-fun b!742315 () Bool)

(declare-fun res!499524 () Bool)

(declare-fun e!414867 () Bool)

(assert (=> b!742315 (=> (not res!499524) (not e!414867))))

(declare-datatypes ((array!41507 0))(
  ( (array!41508 (arr!19867 (Array (_ BitVec 32) (_ BitVec 64))) (size!20288 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41507)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!742315 (= res!499524 (and (= (size!20288 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20288 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20288 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742316 () Bool)

(declare-fun e!414865 () Bool)

(declare-fun e!414863 () Bool)

(assert (=> b!742316 (= e!414865 e!414863)))

(declare-fun res!499533 () Bool)

(assert (=> b!742316 (=> (not res!499533) (not e!414863))))

(declare-datatypes ((SeekEntryResult!7467 0))(
  ( (MissingZero!7467 (index!32236 (_ BitVec 32))) (Found!7467 (index!32237 (_ BitVec 32))) (Intermediate!7467 (undefined!8279 Bool) (index!32238 (_ BitVec 32)) (x!63209 (_ BitVec 32))) (Undefined!7467) (MissingVacant!7467 (index!32239 (_ BitVec 32))) )
))
(declare-fun lt!329765 () SeekEntryResult!7467)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41507 (_ BitVec 32)) SeekEntryResult!7467)

(assert (=> b!742316 (= res!499533 (= (seekEntryOrOpen!0 (select (arr!19867 a!3186) j!159) a!3186 mask!3328) lt!329765))))

(assert (=> b!742316 (= lt!329765 (Found!7467 j!159))))

(declare-fun b!742317 () Bool)

(declare-fun res!499523 () Bool)

(assert (=> b!742317 (=> (not res!499523) (not e!414867))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742317 (= res!499523 (validKeyInArray!0 k0!2102))))

(declare-fun b!742318 () Bool)

(declare-fun res!499534 () Bool)

(assert (=> b!742318 (=> (not res!499534) (not e!414867))))

(assert (=> b!742318 (= res!499534 (validKeyInArray!0 (select (arr!19867 a!3186) j!159)))))

(declare-fun b!742319 () Bool)

(declare-fun res!499526 () Bool)

(declare-fun e!414868 () Bool)

(assert (=> b!742319 (=> (not res!499526) (not e!414868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41507 (_ BitVec 32)) Bool)

(assert (=> b!742319 (= res!499526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!499522 () Bool)

(assert (=> start!65334 (=> (not res!499522) (not e!414867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65334 (= res!499522 (validMask!0 mask!3328))))

(assert (=> start!65334 e!414867))

(assert (=> start!65334 true))

(declare-fun array_inv!15663 (array!41507) Bool)

(assert (=> start!65334 (array_inv!15663 a!3186)))

(declare-fun b!742320 () Bool)

(declare-fun e!414864 () Bool)

(assert (=> b!742320 (= e!414864 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!329763 () SeekEntryResult!7467)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41507 (_ BitVec 32)) SeekEntryResult!7467)

(assert (=> b!742320 (= lt!329763 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19867 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!742321 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742321 (= e!414863 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19867 a!3186) j!159) a!3186 mask!3328) lt!329765))))

(declare-fun b!742322 () Bool)

(declare-fun e!414861 () Bool)

(assert (=> b!742322 (= e!414861 (not e!414864))))

(declare-fun res!499525 () Bool)

(assert (=> b!742322 (=> res!499525 e!414864)))

(declare-fun lt!329767 () SeekEntryResult!7467)

(get-info :version)

(assert (=> b!742322 (= res!499525 (or (not ((_ is Intermediate!7467) lt!329767)) (bvslt x!1131 (x!63209 lt!329767)) (not (= x!1131 (x!63209 lt!329767))) (not (= index!1321 (index!32238 lt!329767)))))))

(assert (=> b!742322 e!414865))

(declare-fun res!499531 () Bool)

(assert (=> b!742322 (=> (not res!499531) (not e!414865))))

(assert (=> b!742322 (= res!499531 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25414 0))(
  ( (Unit!25415) )
))
(declare-fun lt!329770 () Unit!25414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25414)

(assert (=> b!742322 (= lt!329770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742323 () Bool)

(assert (=> b!742323 (= e!414867 e!414868)))

(declare-fun res!499532 () Bool)

(assert (=> b!742323 (=> (not res!499532) (not e!414868))))

(declare-fun lt!329766 () SeekEntryResult!7467)

(assert (=> b!742323 (= res!499532 (or (= lt!329766 (MissingZero!7467 i!1173)) (= lt!329766 (MissingVacant!7467 i!1173))))))

(assert (=> b!742323 (= lt!329766 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742324 () Bool)

(declare-fun e!414866 () Bool)

(assert (=> b!742324 (= e!414868 e!414866)))

(declare-fun res!499521 () Bool)

(assert (=> b!742324 (=> (not res!499521) (not e!414866))))

(declare-fun lt!329771 () SeekEntryResult!7467)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41507 (_ BitVec 32)) SeekEntryResult!7467)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742324 (= res!499521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19867 a!3186) j!159) mask!3328) (select (arr!19867 a!3186) j!159) a!3186 mask!3328) lt!329771))))

(assert (=> b!742324 (= lt!329771 (Intermediate!7467 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742325 () Bool)

(declare-fun res!499528 () Bool)

(assert (=> b!742325 (=> (not res!499528) (not e!414866))))

(assert (=> b!742325 (= res!499528 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19867 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742326 () Bool)

(declare-fun res!499535 () Bool)

(assert (=> b!742326 (=> (not res!499535) (not e!414867))))

(declare-fun arrayContainsKey!0 (array!41507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742326 (= res!499535 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742327 () Bool)

(declare-fun res!499520 () Bool)

(assert (=> b!742327 (=> (not res!499520) (not e!414866))))

(declare-fun e!414862 () Bool)

(assert (=> b!742327 (= res!499520 e!414862)))

(declare-fun c!81778 () Bool)

(assert (=> b!742327 (= c!81778 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742328 () Bool)

(assert (=> b!742328 (= e!414862 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19867 a!3186) j!159) a!3186 mask!3328) lt!329771))))

(declare-fun b!742329 () Bool)

(declare-fun res!499530 () Bool)

(assert (=> b!742329 (=> (not res!499530) (not e!414868))))

(declare-datatypes ((List!13869 0))(
  ( (Nil!13866) (Cons!13865 (h!14937 (_ BitVec 64)) (t!20184 List!13869)) )
))
(declare-fun arrayNoDuplicates!0 (array!41507 (_ BitVec 32) List!13869) Bool)

(assert (=> b!742329 (= res!499530 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13866))))

(declare-fun b!742330 () Bool)

(assert (=> b!742330 (= e!414866 e!414861)))

(declare-fun res!499529 () Bool)

(assert (=> b!742330 (=> (not res!499529) (not e!414861))))

(declare-fun lt!329768 () SeekEntryResult!7467)

(assert (=> b!742330 (= res!499529 (= lt!329768 lt!329767))))

(declare-fun lt!329764 () array!41507)

(declare-fun lt!329769 () (_ BitVec 64))

(assert (=> b!742330 (= lt!329767 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329769 lt!329764 mask!3328))))

(assert (=> b!742330 (= lt!329768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329769 mask!3328) lt!329769 lt!329764 mask!3328))))

(assert (=> b!742330 (= lt!329769 (select (store (arr!19867 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742330 (= lt!329764 (array!41508 (store (arr!19867 a!3186) i!1173 k0!2102) (size!20288 a!3186)))))

(declare-fun b!742331 () Bool)

(declare-fun res!499527 () Bool)

(assert (=> b!742331 (=> (not res!499527) (not e!414868))))

(assert (=> b!742331 (= res!499527 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20288 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20288 a!3186))))))

(declare-fun b!742332 () Bool)

(assert (=> b!742332 (= e!414862 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19867 a!3186) j!159) a!3186 mask!3328) (Found!7467 j!159)))))

(assert (= (and start!65334 res!499522) b!742315))

(assert (= (and b!742315 res!499524) b!742318))

(assert (= (and b!742318 res!499534) b!742317))

(assert (= (and b!742317 res!499523) b!742326))

(assert (= (and b!742326 res!499535) b!742323))

(assert (= (and b!742323 res!499532) b!742319))

(assert (= (and b!742319 res!499526) b!742329))

(assert (= (and b!742329 res!499530) b!742331))

(assert (= (and b!742331 res!499527) b!742324))

(assert (= (and b!742324 res!499521) b!742325))

(assert (= (and b!742325 res!499528) b!742327))

(assert (= (and b!742327 c!81778) b!742328))

(assert (= (and b!742327 (not c!81778)) b!742332))

(assert (= (and b!742327 res!499520) b!742330))

(assert (= (and b!742330 res!499529) b!742322))

(assert (= (and b!742322 res!499531) b!742316))

(assert (= (and b!742316 res!499533) b!742321))

(assert (= (and b!742322 (not res!499525)) b!742320))

(declare-fun m!693197 () Bool)

(assert (=> b!742326 m!693197))

(declare-fun m!693199 () Bool)

(assert (=> start!65334 m!693199))

(declare-fun m!693201 () Bool)

(assert (=> start!65334 m!693201))

(declare-fun m!693203 () Bool)

(assert (=> b!742319 m!693203))

(declare-fun m!693205 () Bool)

(assert (=> b!742318 m!693205))

(assert (=> b!742318 m!693205))

(declare-fun m!693207 () Bool)

(assert (=> b!742318 m!693207))

(declare-fun m!693209 () Bool)

(assert (=> b!742317 m!693209))

(assert (=> b!742332 m!693205))

(assert (=> b!742332 m!693205))

(declare-fun m!693211 () Bool)

(assert (=> b!742332 m!693211))

(assert (=> b!742321 m!693205))

(assert (=> b!742321 m!693205))

(declare-fun m!693213 () Bool)

(assert (=> b!742321 m!693213))

(declare-fun m!693215 () Bool)

(assert (=> b!742322 m!693215))

(declare-fun m!693217 () Bool)

(assert (=> b!742322 m!693217))

(assert (=> b!742328 m!693205))

(assert (=> b!742328 m!693205))

(declare-fun m!693219 () Bool)

(assert (=> b!742328 m!693219))

(assert (=> b!742320 m!693205))

(assert (=> b!742320 m!693205))

(assert (=> b!742320 m!693211))

(declare-fun m!693221 () Bool)

(assert (=> b!742325 m!693221))

(declare-fun m!693223 () Bool)

(assert (=> b!742329 m!693223))

(assert (=> b!742324 m!693205))

(assert (=> b!742324 m!693205))

(declare-fun m!693225 () Bool)

(assert (=> b!742324 m!693225))

(assert (=> b!742324 m!693225))

(assert (=> b!742324 m!693205))

(declare-fun m!693227 () Bool)

(assert (=> b!742324 m!693227))

(declare-fun m!693229 () Bool)

(assert (=> b!742323 m!693229))

(assert (=> b!742316 m!693205))

(assert (=> b!742316 m!693205))

(declare-fun m!693231 () Bool)

(assert (=> b!742316 m!693231))

(declare-fun m!693233 () Bool)

(assert (=> b!742330 m!693233))

(declare-fun m!693235 () Bool)

(assert (=> b!742330 m!693235))

(declare-fun m!693237 () Bool)

(assert (=> b!742330 m!693237))

(declare-fun m!693239 () Bool)

(assert (=> b!742330 m!693239))

(assert (=> b!742330 m!693237))

(declare-fun m!693241 () Bool)

(assert (=> b!742330 m!693241))

(check-sat (not b!742330) (not b!742321) (not b!742329) (not b!742319) (not b!742316) (not b!742328) (not b!742332) (not b!742323) (not b!742322) (not start!65334) (not b!742326) (not b!742318) (not b!742324) (not b!742320) (not b!742317))
(check-sat)
