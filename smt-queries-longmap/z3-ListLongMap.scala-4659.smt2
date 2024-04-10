; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64728 () Bool)

(assert start!64728)

(declare-fun b!730414 () Bool)

(declare-fun e!408757 () Bool)

(declare-fun e!408750 () Bool)

(assert (=> b!730414 (= e!408757 e!408750)))

(declare-fun res!490712 () Bool)

(assert (=> b!730414 (=> (not res!490712) (not e!408750))))

(declare-datatypes ((array!41177 0))(
  ( (array!41178 (arr!19708 (Array (_ BitVec 32) (_ BitVec 64))) (size!20129 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41177)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7308 0))(
  ( (MissingZero!7308 (index!31600 (_ BitVec 32))) (Found!7308 (index!31601 (_ BitVec 32))) (Intermediate!7308 (undefined!8120 Bool) (index!31602 (_ BitVec 32)) (x!62578 (_ BitVec 32))) (Undefined!7308) (MissingVacant!7308 (index!31603 (_ BitVec 32))) )
))
(declare-fun lt!323649 () SeekEntryResult!7308)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41177 (_ BitVec 32)) SeekEntryResult!7308)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730414 (= res!490712 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19708 a!3186) j!159) mask!3328) (select (arr!19708 a!3186) j!159) a!3186 mask!3328) lt!323649))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730414 (= lt!323649 (Intermediate!7308 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730415 () Bool)

(declare-fun e!408751 () Bool)

(declare-fun lt!323650 () SeekEntryResult!7308)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41177 (_ BitVec 32)) SeekEntryResult!7308)

(assert (=> b!730415 (= e!408751 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19708 a!3186) j!159) a!3186 mask!3328) lt!323650))))

(declare-fun b!730416 () Bool)

(declare-fun res!490724 () Bool)

(declare-fun e!408756 () Bool)

(assert (=> b!730416 (=> (not res!490724) (not e!408756))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730416 (= res!490724 (and (= (size!20129 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20129 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20129 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730417 () Bool)

(declare-fun e!408754 () Bool)

(declare-fun e!408752 () Bool)

(assert (=> b!730417 (= e!408754 (not e!408752))))

(declare-fun res!490720 () Bool)

(assert (=> b!730417 (=> res!490720 e!408752)))

(declare-fun lt!323651 () SeekEntryResult!7308)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!730417 (= res!490720 (or (not ((_ is Intermediate!7308) lt!323651)) (bvsge x!1131 (x!62578 lt!323651))))))

(declare-fun e!408755 () Bool)

(assert (=> b!730417 e!408755))

(declare-fun res!490717 () Bool)

(assert (=> b!730417 (=> (not res!490717) (not e!408755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41177 (_ BitVec 32)) Bool)

(assert (=> b!730417 (= res!490717 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24934 0))(
  ( (Unit!24935) )
))
(declare-fun lt!323652 () Unit!24934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41177 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24934)

(assert (=> b!730417 (= lt!323652 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730418 () Bool)

(assert (=> b!730418 (= e!408755 e!408751)))

(declare-fun res!490721 () Bool)

(assert (=> b!730418 (=> (not res!490721) (not e!408751))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41177 (_ BitVec 32)) SeekEntryResult!7308)

(assert (=> b!730418 (= res!490721 (= (seekEntryOrOpen!0 (select (arr!19708 a!3186) j!159) a!3186 mask!3328) lt!323650))))

(assert (=> b!730418 (= lt!323650 (Found!7308 j!159))))

(declare-fun b!730419 () Bool)

(assert (=> b!730419 (= e!408756 e!408757)))

(declare-fun res!490709 () Bool)

(assert (=> b!730419 (=> (not res!490709) (not e!408757))))

(declare-fun lt!323657 () SeekEntryResult!7308)

(assert (=> b!730419 (= res!490709 (or (= lt!323657 (MissingZero!7308 i!1173)) (= lt!323657 (MissingVacant!7308 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!730419 (= lt!323657 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730420 () Bool)

(assert (=> b!730420 (= e!408750 e!408754)))

(declare-fun res!490723 () Bool)

(assert (=> b!730420 (=> (not res!490723) (not e!408754))))

(declare-fun lt!323656 () SeekEntryResult!7308)

(assert (=> b!730420 (= res!490723 (= lt!323656 lt!323651))))

(declare-fun lt!323654 () array!41177)

(declare-fun lt!323655 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!730420 (= lt!323651 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323655 lt!323654 mask!3328))))

(assert (=> b!730420 (= lt!323656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323655 mask!3328) lt!323655 lt!323654 mask!3328))))

(assert (=> b!730420 (= lt!323655 (select (store (arr!19708 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730420 (= lt!323654 (array!41178 (store (arr!19708 a!3186) i!1173 k0!2102) (size!20129 a!3186)))))

(declare-fun b!730421 () Bool)

(assert (=> b!730421 (= e!408752 true)))

(declare-fun lt!323653 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730421 (= lt!323653 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730422 () Bool)

(declare-fun res!490719 () Bool)

(assert (=> b!730422 (=> (not res!490719) (not e!408756))))

(declare-fun arrayContainsKey!0 (array!41177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730422 (= res!490719 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730423 () Bool)

(declare-fun res!490714 () Bool)

(assert (=> b!730423 (=> (not res!490714) (not e!408756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730423 (= res!490714 (validKeyInArray!0 k0!2102))))

(declare-fun b!730424 () Bool)

(declare-fun res!490715 () Bool)

(assert (=> b!730424 (=> (not res!490715) (not e!408757))))

(assert (=> b!730424 (= res!490715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!490711 () Bool)

(assert (=> start!64728 (=> (not res!490711) (not e!408756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64728 (= res!490711 (validMask!0 mask!3328))))

(assert (=> start!64728 e!408756))

(assert (=> start!64728 true))

(declare-fun array_inv!15504 (array!41177) Bool)

(assert (=> start!64728 (array_inv!15504 a!3186)))

(declare-fun b!730425 () Bool)

(declare-fun res!490713 () Bool)

(assert (=> b!730425 (=> (not res!490713) (not e!408757))))

(assert (=> b!730425 (= res!490713 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20129 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20129 a!3186))))))

(declare-fun b!730426 () Bool)

(declare-fun res!490716 () Bool)

(assert (=> b!730426 (=> (not res!490716) (not e!408757))))

(declare-datatypes ((List!13710 0))(
  ( (Nil!13707) (Cons!13706 (h!14766 (_ BitVec 64)) (t!20025 List!13710)) )
))
(declare-fun arrayNoDuplicates!0 (array!41177 (_ BitVec 32) List!13710) Bool)

(assert (=> b!730426 (= res!490716 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13707))))

(declare-fun b!730427 () Bool)

(declare-fun res!490718 () Bool)

(assert (=> b!730427 (=> (not res!490718) (not e!408750))))

(declare-fun e!408758 () Bool)

(assert (=> b!730427 (= res!490718 e!408758)))

(declare-fun c!80227 () Bool)

(assert (=> b!730427 (= c!80227 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730428 () Bool)

(assert (=> b!730428 (= e!408758 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19708 a!3186) j!159) a!3186 mask!3328) (Found!7308 j!159)))))

(declare-fun b!730429 () Bool)

(declare-fun res!490710 () Bool)

(assert (=> b!730429 (=> (not res!490710) (not e!408750))))

(assert (=> b!730429 (= res!490710 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19708 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730430 () Bool)

(declare-fun res!490722 () Bool)

(assert (=> b!730430 (=> (not res!490722) (not e!408756))))

(assert (=> b!730430 (= res!490722 (validKeyInArray!0 (select (arr!19708 a!3186) j!159)))))

(declare-fun b!730431 () Bool)

(assert (=> b!730431 (= e!408758 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19708 a!3186) j!159) a!3186 mask!3328) lt!323649))))

(assert (= (and start!64728 res!490711) b!730416))

(assert (= (and b!730416 res!490724) b!730430))

(assert (= (and b!730430 res!490722) b!730423))

(assert (= (and b!730423 res!490714) b!730422))

(assert (= (and b!730422 res!490719) b!730419))

(assert (= (and b!730419 res!490709) b!730424))

(assert (= (and b!730424 res!490715) b!730426))

(assert (= (and b!730426 res!490716) b!730425))

(assert (= (and b!730425 res!490713) b!730414))

(assert (= (and b!730414 res!490712) b!730429))

(assert (= (and b!730429 res!490710) b!730427))

(assert (= (and b!730427 c!80227) b!730431))

(assert (= (and b!730427 (not c!80227)) b!730428))

(assert (= (and b!730427 res!490718) b!730420))

(assert (= (and b!730420 res!490723) b!730417))

(assert (= (and b!730417 res!490717) b!730418))

(assert (= (and b!730418 res!490721) b!730415))

(assert (= (and b!730417 (not res!490720)) b!730421))

(declare-fun m!683947 () Bool)

(assert (=> start!64728 m!683947))

(declare-fun m!683949 () Bool)

(assert (=> start!64728 m!683949))

(declare-fun m!683951 () Bool)

(assert (=> b!730424 m!683951))

(declare-fun m!683953 () Bool)

(assert (=> b!730421 m!683953))

(declare-fun m!683955 () Bool)

(assert (=> b!730431 m!683955))

(assert (=> b!730431 m!683955))

(declare-fun m!683957 () Bool)

(assert (=> b!730431 m!683957))

(declare-fun m!683959 () Bool)

(assert (=> b!730419 m!683959))

(declare-fun m!683961 () Bool)

(assert (=> b!730423 m!683961))

(declare-fun m!683963 () Bool)

(assert (=> b!730420 m!683963))

(declare-fun m!683965 () Bool)

(assert (=> b!730420 m!683965))

(declare-fun m!683967 () Bool)

(assert (=> b!730420 m!683967))

(declare-fun m!683969 () Bool)

(assert (=> b!730420 m!683969))

(assert (=> b!730420 m!683963))

(declare-fun m!683971 () Bool)

(assert (=> b!730420 m!683971))

(assert (=> b!730415 m!683955))

(assert (=> b!730415 m!683955))

(declare-fun m!683973 () Bool)

(assert (=> b!730415 m!683973))

(declare-fun m!683975 () Bool)

(assert (=> b!730426 m!683975))

(declare-fun m!683977 () Bool)

(assert (=> b!730422 m!683977))

(assert (=> b!730414 m!683955))

(assert (=> b!730414 m!683955))

(declare-fun m!683979 () Bool)

(assert (=> b!730414 m!683979))

(assert (=> b!730414 m!683979))

(assert (=> b!730414 m!683955))

(declare-fun m!683981 () Bool)

(assert (=> b!730414 m!683981))

(declare-fun m!683983 () Bool)

(assert (=> b!730429 m!683983))

(assert (=> b!730430 m!683955))

(assert (=> b!730430 m!683955))

(declare-fun m!683985 () Bool)

(assert (=> b!730430 m!683985))

(assert (=> b!730428 m!683955))

(assert (=> b!730428 m!683955))

(declare-fun m!683987 () Bool)

(assert (=> b!730428 m!683987))

(declare-fun m!683989 () Bool)

(assert (=> b!730417 m!683989))

(declare-fun m!683991 () Bool)

(assert (=> b!730417 m!683991))

(assert (=> b!730418 m!683955))

(assert (=> b!730418 m!683955))

(declare-fun m!683993 () Bool)

(assert (=> b!730418 m!683993))

(check-sat (not b!730431) (not b!730419) (not b!730428) (not b!730417) (not b!730422) (not start!64728) (not b!730424) (not b!730420) (not b!730421) (not b!730418) (not b!730415) (not b!730423) (not b!730414) (not b!730426) (not b!730430))
(check-sat)
