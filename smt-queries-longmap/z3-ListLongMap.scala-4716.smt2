; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65484 () Bool)

(assert start!65484)

(declare-fun b!743685 () Bool)

(declare-fun res!500394 () Bool)

(declare-fun e!415644 () Bool)

(assert (=> b!743685 (=> (not res!500394) (not e!415644))))

(declare-datatypes ((array!41527 0))(
  ( (array!41528 (arr!19873 (Array (_ BitVec 32) (_ BitVec 64))) (size!20293 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41527)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743685 (= res!500394 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743686 () Bool)

(declare-fun res!500390 () Bool)

(declare-fun e!415643 () Bool)

(assert (=> b!743686 (=> (not res!500390) (not e!415643))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41527 (_ BitVec 32)) Bool)

(assert (=> b!743686 (= res!500390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743687 () Bool)

(declare-fun e!415640 () Bool)

(declare-fun e!415639 () Bool)

(assert (=> b!743687 (= e!415640 e!415639)))

(declare-fun res!500396 () Bool)

(assert (=> b!743687 (=> (not res!500396) (not e!415639))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7429 0))(
  ( (MissingZero!7429 (index!32084 (_ BitVec 32))) (Found!7429 (index!32085 (_ BitVec 32))) (Intermediate!7429 (undefined!8241 Bool) (index!32086 (_ BitVec 32)) (x!63215 (_ BitVec 32))) (Undefined!7429) (MissingVacant!7429 (index!32087 (_ BitVec 32))) )
))
(declare-fun lt!330361 () SeekEntryResult!7429)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41527 (_ BitVec 32)) SeekEntryResult!7429)

(assert (=> b!743687 (= res!500396 (= (seekEntryOrOpen!0 (select (arr!19873 a!3186) j!159) a!3186 mask!3328) lt!330361))))

(assert (=> b!743687 (= lt!330361 (Found!7429 j!159))))

(declare-fun b!743688 () Bool)

(declare-fun res!500400 () Bool)

(assert (=> b!743688 (=> (not res!500400) (not e!415643))))

(declare-datatypes ((List!13782 0))(
  ( (Nil!13779) (Cons!13778 (h!14856 (_ BitVec 64)) (t!20089 List!13782)) )
))
(declare-fun arrayNoDuplicates!0 (array!41527 (_ BitVec 32) List!13782) Bool)

(assert (=> b!743688 (= res!500400 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13779))))

(declare-fun b!743689 () Bool)

(declare-fun res!500393 () Bool)

(declare-fun e!415642 () Bool)

(assert (=> b!743689 (=> res!500393 e!415642)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330360 () SeekEntryResult!7429)

(declare-fun lt!330357 () (_ BitVec 64))

(assert (=> b!743689 (= res!500393 (or (not (= (select (store (arr!19873 a!3186) i!1173 k0!2102) index!1321) lt!330357)) (undefined!8241 lt!330360)))))

(declare-fun b!743690 () Bool)

(declare-fun e!415641 () Bool)

(declare-fun e!415636 () Bool)

(assert (=> b!743690 (= e!415641 e!415636)))

(declare-fun res!500395 () Bool)

(assert (=> b!743690 (=> (not res!500395) (not e!415636))))

(declare-fun lt!330362 () SeekEntryResult!7429)

(assert (=> b!743690 (= res!500395 (= lt!330362 lt!330360))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!330359 () array!41527)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41527 (_ BitVec 32)) SeekEntryResult!7429)

(assert (=> b!743690 (= lt!330360 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330357 lt!330359 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743690 (= lt!330362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330357 mask!3328) lt!330357 lt!330359 mask!3328))))

(assert (=> b!743690 (= lt!330357 (select (store (arr!19873 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743690 (= lt!330359 (array!41528 (store (arr!19873 a!3186) i!1173 k0!2102) (size!20293 a!3186)))))

(declare-fun b!743691 () Bool)

(declare-fun res!500388 () Bool)

(assert (=> b!743691 (=> (not res!500388) (not e!415641))))

(declare-fun e!415637 () Bool)

(assert (=> b!743691 (= res!500388 e!415637)))

(declare-fun c!82034 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743691 (= c!82034 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!743693 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41527 (_ BitVec 32)) SeekEntryResult!7429)

(assert (=> b!743693 (= e!415639 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19873 a!3186) j!159) a!3186 mask!3328) lt!330361))))

(declare-fun b!743694 () Bool)

(assert (=> b!743694 (= e!415644 e!415643)))

(declare-fun res!500401 () Bool)

(assert (=> b!743694 (=> (not res!500401) (not e!415643))))

(declare-fun lt!330356 () SeekEntryResult!7429)

(assert (=> b!743694 (= res!500401 (or (= lt!330356 (MissingZero!7429 i!1173)) (= lt!330356 (MissingVacant!7429 i!1173))))))

(assert (=> b!743694 (= lt!330356 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743695 () Bool)

(declare-fun res!500397 () Bool)

(assert (=> b!743695 (=> (not res!500397) (not e!415643))))

(assert (=> b!743695 (= res!500397 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20293 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20293 a!3186))))))

(declare-fun b!743696 () Bool)

(assert (=> b!743696 (= e!415643 e!415641)))

(declare-fun res!500386 () Bool)

(assert (=> b!743696 (=> (not res!500386) (not e!415641))))

(declare-fun lt!330363 () SeekEntryResult!7429)

(assert (=> b!743696 (= res!500386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19873 a!3186) j!159) mask!3328) (select (arr!19873 a!3186) j!159) a!3186 mask!3328) lt!330363))))

(assert (=> b!743696 (= lt!330363 (Intermediate!7429 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743697 () Bool)

(declare-fun res!500384 () Bool)

(assert (=> b!743697 (=> (not res!500384) (not e!415644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743697 (= res!500384 (validKeyInArray!0 k0!2102))))

(declare-fun b!743698 () Bool)

(declare-fun res!500389 () Bool)

(assert (=> b!743698 (=> res!500389 e!415642)))

(assert (=> b!743698 (= res!500389 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19873 a!3186) j!159) a!3186 mask!3328) (Found!7429 j!159))))))

(declare-fun b!743699 () Bool)

(declare-fun res!500398 () Bool)

(assert (=> b!743699 (=> (not res!500398) (not e!415644))))

(assert (=> b!743699 (= res!500398 (validKeyInArray!0 (select (arr!19873 a!3186) j!159)))))

(declare-fun b!743700 () Bool)

(declare-fun res!500385 () Bool)

(assert (=> b!743700 (=> (not res!500385) (not e!415641))))

(assert (=> b!743700 (= res!500385 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19873 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743701 () Bool)

(assert (=> b!743701 (= e!415637 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19873 a!3186) j!159) a!3186 mask!3328) lt!330363))))

(declare-fun b!743702 () Bool)

(assert (=> b!743702 (= e!415637 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19873 a!3186) j!159) a!3186 mask!3328) (Found!7429 j!159)))))

(declare-fun b!743692 () Bool)

(assert (=> b!743692 (= e!415642 true)))

(declare-fun lt!330358 () SeekEntryResult!7429)

(assert (=> b!743692 (= lt!330358 (seekEntryOrOpen!0 lt!330357 lt!330359 mask!3328))))

(declare-fun res!500387 () Bool)

(assert (=> start!65484 (=> (not res!500387) (not e!415644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65484 (= res!500387 (validMask!0 mask!3328))))

(assert (=> start!65484 e!415644))

(assert (=> start!65484 true))

(declare-fun array_inv!15732 (array!41527) Bool)

(assert (=> start!65484 (array_inv!15732 a!3186)))

(declare-fun b!743703 () Bool)

(declare-fun res!500399 () Bool)

(assert (=> b!743703 (=> (not res!500399) (not e!415644))))

(assert (=> b!743703 (= res!500399 (and (= (size!20293 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20293 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20293 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743704 () Bool)

(assert (=> b!743704 (= e!415636 (not e!415642))))

(declare-fun res!500392 () Bool)

(assert (=> b!743704 (=> res!500392 e!415642)))

(get-info :version)

(assert (=> b!743704 (= res!500392 (or (not ((_ is Intermediate!7429) lt!330360)) (bvslt x!1131 (x!63215 lt!330360)) (not (= x!1131 (x!63215 lt!330360))) (not (= index!1321 (index!32086 lt!330360)))))))

(assert (=> b!743704 e!415640))

(declare-fun res!500391 () Bool)

(assert (=> b!743704 (=> (not res!500391) (not e!415640))))

(assert (=> b!743704 (= res!500391 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25417 0))(
  ( (Unit!25418) )
))
(declare-fun lt!330355 () Unit!25417)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25417)

(assert (=> b!743704 (= lt!330355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65484 res!500387) b!743703))

(assert (= (and b!743703 res!500399) b!743699))

(assert (= (and b!743699 res!500398) b!743697))

(assert (= (and b!743697 res!500384) b!743685))

(assert (= (and b!743685 res!500394) b!743694))

(assert (= (and b!743694 res!500401) b!743686))

(assert (= (and b!743686 res!500390) b!743688))

(assert (= (and b!743688 res!500400) b!743695))

(assert (= (and b!743695 res!500397) b!743696))

(assert (= (and b!743696 res!500386) b!743700))

(assert (= (and b!743700 res!500385) b!743691))

(assert (= (and b!743691 c!82034) b!743701))

(assert (= (and b!743691 (not c!82034)) b!743702))

(assert (= (and b!743691 res!500388) b!743690))

(assert (= (and b!743690 res!500395) b!743704))

(assert (= (and b!743704 res!500391) b!743687))

(assert (= (and b!743687 res!500396) b!743693))

(assert (= (and b!743704 (not res!500392)) b!743698))

(assert (= (and b!743698 (not res!500389)) b!743689))

(assert (= (and b!743689 (not res!500393)) b!743692))

(declare-fun m!694881 () Bool)

(assert (=> b!743698 m!694881))

(assert (=> b!743698 m!694881))

(declare-fun m!694883 () Bool)

(assert (=> b!743698 m!694883))

(declare-fun m!694885 () Bool)

(assert (=> b!743697 m!694885))

(declare-fun m!694887 () Bool)

(assert (=> b!743690 m!694887))

(declare-fun m!694889 () Bool)

(assert (=> b!743690 m!694889))

(declare-fun m!694891 () Bool)

(assert (=> b!743690 m!694891))

(declare-fun m!694893 () Bool)

(assert (=> b!743690 m!694893))

(declare-fun m!694895 () Bool)

(assert (=> b!743690 m!694895))

(assert (=> b!743690 m!694887))

(declare-fun m!694897 () Bool)

(assert (=> b!743700 m!694897))

(declare-fun m!694899 () Bool)

(assert (=> b!743688 m!694899))

(declare-fun m!694901 () Bool)

(assert (=> b!743686 m!694901))

(assert (=> b!743701 m!694881))

(assert (=> b!743701 m!694881))

(declare-fun m!694903 () Bool)

(assert (=> b!743701 m!694903))

(assert (=> b!743689 m!694891))

(declare-fun m!694905 () Bool)

(assert (=> b!743689 m!694905))

(assert (=> b!743687 m!694881))

(assert (=> b!743687 m!694881))

(declare-fun m!694907 () Bool)

(assert (=> b!743687 m!694907))

(declare-fun m!694909 () Bool)

(assert (=> b!743685 m!694909))

(assert (=> b!743702 m!694881))

(assert (=> b!743702 m!694881))

(assert (=> b!743702 m!694883))

(declare-fun m!694911 () Bool)

(assert (=> b!743704 m!694911))

(declare-fun m!694913 () Bool)

(assert (=> b!743704 m!694913))

(declare-fun m!694915 () Bool)

(assert (=> b!743692 m!694915))

(assert (=> b!743699 m!694881))

(assert (=> b!743699 m!694881))

(declare-fun m!694917 () Bool)

(assert (=> b!743699 m!694917))

(declare-fun m!694919 () Bool)

(assert (=> start!65484 m!694919))

(declare-fun m!694921 () Bool)

(assert (=> start!65484 m!694921))

(declare-fun m!694923 () Bool)

(assert (=> b!743694 m!694923))

(assert (=> b!743696 m!694881))

(assert (=> b!743696 m!694881))

(declare-fun m!694925 () Bool)

(assert (=> b!743696 m!694925))

(assert (=> b!743696 m!694925))

(assert (=> b!743696 m!694881))

(declare-fun m!694927 () Bool)

(assert (=> b!743696 m!694927))

(assert (=> b!743693 m!694881))

(assert (=> b!743693 m!694881))

(declare-fun m!694929 () Bool)

(assert (=> b!743693 m!694929))

(check-sat (not b!743696) (not b!743701) (not b!743685) (not b!743686) (not b!743698) (not b!743704) (not start!65484) (not b!743687) (not b!743692) (not b!743694) (not b!743693) (not b!743688) (not b!743690) (not b!743697) (not b!743699) (not b!743702))
(check-sat)
