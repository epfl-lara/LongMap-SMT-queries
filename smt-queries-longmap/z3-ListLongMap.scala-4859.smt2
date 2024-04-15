; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66974 () Bool)

(assert start!66974)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42417 0))(
  ( (array!42418 (arr!20306 (Array (_ BitVec 32) (_ BitVec 64))) (size!20727 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42417)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!430114 () Bool)

(declare-fun b!772630 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7903 0))(
  ( (MissingZero!7903 (index!33980 (_ BitVec 32))) (Found!7903 (index!33981 (_ BitVec 32))) (Intermediate!7903 (undefined!8715 Bool) (index!33982 (_ BitVec 32)) (x!64933 (_ BitVec 32))) (Undefined!7903) (MissingVacant!7903 (index!33983 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42417 (_ BitVec 32)) SeekEntryResult!7903)

(assert (=> b!772630 (= e!430114 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) (Found!7903 j!159)))))

(declare-fun b!772631 () Bool)

(declare-fun e!430116 () Bool)

(declare-fun e!430109 () Bool)

(assert (=> b!772631 (= e!430116 e!430109)))

(declare-fun res!522526 () Bool)

(assert (=> b!772631 (=> (not res!522526) (not e!430109))))

(declare-fun lt!343869 () SeekEntryResult!7903)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42417 (_ BitVec 32)) SeekEntryResult!7903)

(assert (=> b!772631 (= res!522526 (= (seekEntryOrOpen!0 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343869))))

(assert (=> b!772631 (= lt!343869 (Found!7903 j!159))))

(declare-fun b!772632 () Bool)

(declare-fun res!522536 () Bool)

(declare-fun e!430112 () Bool)

(assert (=> b!772632 (=> (not res!522536) (not e!430112))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!772632 (= res!522536 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20727 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20727 a!3186))))))

(declare-fun b!772633 () Bool)

(declare-fun res!522527 () Bool)

(declare-fun e!430108 () Bool)

(assert (=> b!772633 (=> (not res!522527) (not e!430108))))

(assert (=> b!772633 (= res!522527 e!430114)))

(declare-fun c!85452 () Bool)

(assert (=> b!772633 (= c!85452 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772634 () Bool)

(declare-datatypes ((Unit!26606 0))(
  ( (Unit!26607) )
))
(declare-fun e!430115 () Unit!26606)

(declare-fun Unit!26608 () Unit!26606)

(assert (=> b!772634 (= e!430115 Unit!26608)))

(declare-fun lt!343867 () SeekEntryResult!7903)

(declare-fun lt!343870 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42417 (_ BitVec 32)) SeekEntryResult!7903)

(assert (=> b!772634 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343870 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343867)))

(declare-fun b!772635 () Bool)

(declare-fun Unit!26609 () Unit!26606)

(assert (=> b!772635 (= e!430115 Unit!26609)))

(declare-fun lt!343862 () SeekEntryResult!7903)

(assert (=> b!772635 (= lt!343862 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!772635 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343870 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) (Found!7903 j!159))))

(declare-fun b!772636 () Bool)

(declare-fun e!430110 () Bool)

(assert (=> b!772636 (= e!430110 true)))

(declare-fun lt!343871 () Unit!26606)

(assert (=> b!772636 (= lt!343871 e!430115)))

(declare-fun c!85451 () Bool)

(assert (=> b!772636 (= c!85451 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772636 (= lt!343870 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772637 () Bool)

(declare-fun res!522540 () Bool)

(assert (=> b!772637 (=> (not res!522540) (not e!430112))))

(declare-datatypes ((List!14347 0))(
  ( (Nil!14344) (Cons!14343 (h!15448 (_ BitVec 64)) (t!20653 List!14347)) )
))
(declare-fun arrayNoDuplicates!0 (array!42417 (_ BitVec 32) List!14347) Bool)

(assert (=> b!772637 (= res!522540 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14344))))

(declare-fun b!772638 () Bool)

(declare-fun e!430117 () Bool)

(assert (=> b!772638 (= e!430108 e!430117)))

(declare-fun res!522531 () Bool)

(assert (=> b!772638 (=> (not res!522531) (not e!430117))))

(declare-fun lt!343865 () SeekEntryResult!7903)

(declare-fun lt!343864 () SeekEntryResult!7903)

(assert (=> b!772638 (= res!522531 (= lt!343865 lt!343864))))

(declare-fun lt!343866 () array!42417)

(declare-fun lt!343863 () (_ BitVec 64))

(assert (=> b!772638 (= lt!343864 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343863 lt!343866 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772638 (= lt!343865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343863 mask!3328) lt!343863 lt!343866 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!772638 (= lt!343863 (select (store (arr!20306 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772638 (= lt!343866 (array!42418 (store (arr!20306 a!3186) i!1173 k0!2102) (size!20727 a!3186)))))

(declare-fun b!772639 () Bool)

(declare-fun res!522528 () Bool)

(declare-fun e!430113 () Bool)

(assert (=> b!772639 (=> (not res!522528) (not e!430113))))

(declare-fun arrayContainsKey!0 (array!42417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772639 (= res!522528 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772640 () Bool)

(declare-fun res!522530 () Bool)

(assert (=> b!772640 (=> (not res!522530) (not e!430113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772640 (= res!522530 (validKeyInArray!0 (select (arr!20306 a!3186) j!159)))))

(declare-fun b!772641 () Bool)

(declare-fun res!522537 () Bool)

(assert (=> b!772641 (=> (not res!522537) (not e!430113))))

(assert (=> b!772641 (= res!522537 (validKeyInArray!0 k0!2102))))

(declare-fun b!772642 () Bool)

(assert (=> b!772642 (= e!430117 (not e!430110))))

(declare-fun res!522538 () Bool)

(assert (=> b!772642 (=> res!522538 e!430110)))

(get-info :version)

(assert (=> b!772642 (= res!522538 (or (not ((_ is Intermediate!7903) lt!343864)) (bvsge x!1131 (x!64933 lt!343864))))))

(assert (=> b!772642 e!430116))

(declare-fun res!522535 () Bool)

(assert (=> b!772642 (=> (not res!522535) (not e!430116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42417 (_ BitVec 32)) Bool)

(assert (=> b!772642 (= res!522535 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343861 () Unit!26606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26606)

(assert (=> b!772642 (= lt!343861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!522539 () Bool)

(assert (=> start!66974 (=> (not res!522539) (not e!430113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66974 (= res!522539 (validMask!0 mask!3328))))

(assert (=> start!66974 e!430113))

(assert (=> start!66974 true))

(declare-fun array_inv!16189 (array!42417) Bool)

(assert (=> start!66974 (array_inv!16189 a!3186)))

(declare-fun b!772643 () Bool)

(declare-fun res!522525 () Bool)

(assert (=> b!772643 (=> (not res!522525) (not e!430108))))

(assert (=> b!772643 (= res!522525 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20306 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772644 () Bool)

(declare-fun res!522534 () Bool)

(assert (=> b!772644 (=> (not res!522534) (not e!430113))))

(assert (=> b!772644 (= res!522534 (and (= (size!20727 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20727 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20727 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772645 () Bool)

(assert (=> b!772645 (= e!430109 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343869))))

(declare-fun b!772646 () Bool)

(assert (=> b!772646 (= e!430113 e!430112)))

(declare-fun res!522529 () Bool)

(assert (=> b!772646 (=> (not res!522529) (not e!430112))))

(declare-fun lt!343868 () SeekEntryResult!7903)

(assert (=> b!772646 (= res!522529 (or (= lt!343868 (MissingZero!7903 i!1173)) (= lt!343868 (MissingVacant!7903 i!1173))))))

(assert (=> b!772646 (= lt!343868 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!772647 () Bool)

(assert (=> b!772647 (= e!430112 e!430108)))

(declare-fun res!522533 () Bool)

(assert (=> b!772647 (=> (not res!522533) (not e!430108))))

(assert (=> b!772647 (= res!522533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20306 a!3186) j!159) mask!3328) (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343867))))

(assert (=> b!772647 (= lt!343867 (Intermediate!7903 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772648 () Bool)

(assert (=> b!772648 (= e!430114 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343867))))

(declare-fun b!772649 () Bool)

(declare-fun res!522532 () Bool)

(assert (=> b!772649 (=> (not res!522532) (not e!430112))))

(assert (=> b!772649 (= res!522532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66974 res!522539) b!772644))

(assert (= (and b!772644 res!522534) b!772640))

(assert (= (and b!772640 res!522530) b!772641))

(assert (= (and b!772641 res!522537) b!772639))

(assert (= (and b!772639 res!522528) b!772646))

(assert (= (and b!772646 res!522529) b!772649))

(assert (= (and b!772649 res!522532) b!772637))

(assert (= (and b!772637 res!522540) b!772632))

(assert (= (and b!772632 res!522536) b!772647))

(assert (= (and b!772647 res!522533) b!772643))

(assert (= (and b!772643 res!522525) b!772633))

(assert (= (and b!772633 c!85452) b!772648))

(assert (= (and b!772633 (not c!85452)) b!772630))

(assert (= (and b!772633 res!522527) b!772638))

(assert (= (and b!772638 res!522531) b!772642))

(assert (= (and b!772642 res!522535) b!772631))

(assert (= (and b!772631 res!522526) b!772645))

(assert (= (and b!772642 (not res!522538)) b!772636))

(assert (= (and b!772636 c!85451) b!772634))

(assert (= (and b!772636 (not c!85451)) b!772635))

(declare-fun m!716925 () Bool)

(assert (=> b!772649 m!716925))

(declare-fun m!716927 () Bool)

(assert (=> start!66974 m!716927))

(declare-fun m!716929 () Bool)

(assert (=> start!66974 m!716929))

(declare-fun m!716931 () Bool)

(assert (=> b!772634 m!716931))

(assert (=> b!772634 m!716931))

(declare-fun m!716933 () Bool)

(assert (=> b!772634 m!716933))

(declare-fun m!716935 () Bool)

(assert (=> b!772646 m!716935))

(declare-fun m!716937 () Bool)

(assert (=> b!772638 m!716937))

(declare-fun m!716939 () Bool)

(assert (=> b!772638 m!716939))

(declare-fun m!716941 () Bool)

(assert (=> b!772638 m!716941))

(declare-fun m!716943 () Bool)

(assert (=> b!772638 m!716943))

(assert (=> b!772638 m!716939))

(declare-fun m!716945 () Bool)

(assert (=> b!772638 m!716945))

(assert (=> b!772645 m!716931))

(assert (=> b!772645 m!716931))

(declare-fun m!716947 () Bool)

(assert (=> b!772645 m!716947))

(declare-fun m!716949 () Bool)

(assert (=> b!772639 m!716949))

(declare-fun m!716951 () Bool)

(assert (=> b!772643 m!716951))

(assert (=> b!772648 m!716931))

(assert (=> b!772648 m!716931))

(declare-fun m!716953 () Bool)

(assert (=> b!772648 m!716953))

(assert (=> b!772635 m!716931))

(assert (=> b!772635 m!716931))

(declare-fun m!716955 () Bool)

(assert (=> b!772635 m!716955))

(assert (=> b!772635 m!716931))

(declare-fun m!716957 () Bool)

(assert (=> b!772635 m!716957))

(declare-fun m!716959 () Bool)

(assert (=> b!772637 m!716959))

(declare-fun m!716961 () Bool)

(assert (=> b!772642 m!716961))

(declare-fun m!716963 () Bool)

(assert (=> b!772642 m!716963))

(assert (=> b!772631 m!716931))

(assert (=> b!772631 m!716931))

(declare-fun m!716965 () Bool)

(assert (=> b!772631 m!716965))

(assert (=> b!772647 m!716931))

(assert (=> b!772647 m!716931))

(declare-fun m!716967 () Bool)

(assert (=> b!772647 m!716967))

(assert (=> b!772647 m!716967))

(assert (=> b!772647 m!716931))

(declare-fun m!716969 () Bool)

(assert (=> b!772647 m!716969))

(declare-fun m!716971 () Bool)

(assert (=> b!772641 m!716971))

(declare-fun m!716973 () Bool)

(assert (=> b!772636 m!716973))

(assert (=> b!772630 m!716931))

(assert (=> b!772630 m!716931))

(assert (=> b!772630 m!716955))

(assert (=> b!772640 m!716931))

(assert (=> b!772640 m!716931))

(declare-fun m!716975 () Bool)

(assert (=> b!772640 m!716975))

(check-sat (not b!772649) (not b!772647) (not b!772640) (not b!772645) (not b!772634) (not b!772641) (not b!772631) (not b!772646) (not b!772648) (not b!772630) (not b!772639) (not b!772638) (not b!772642) (not b!772636) (not b!772635) (not b!772637) (not start!66974))
(check-sat)
