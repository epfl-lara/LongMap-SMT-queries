; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65212 () Bool)

(assert start!65212)

(declare-datatypes ((array!41385 0))(
  ( (array!41386 (arr!19806 (Array (_ BitVec 32) (_ BitVec 64))) (size!20227 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41385)

(declare-datatypes ((SeekEntryResult!7406 0))(
  ( (MissingZero!7406 (index!31992 (_ BitVec 32))) (Found!7406 (index!31993 (_ BitVec 32))) (Intermediate!7406 (undefined!8218 Bool) (index!31994 (_ BitVec 32)) (x!62988 (_ BitVec 32))) (Undefined!7406) (MissingVacant!7406 (index!31995 (_ BitVec 32))) )
))
(declare-fun lt!327758 () SeekEntryResult!7406)

(declare-fun e!412970 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!738412 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41385 (_ BitVec 32)) SeekEntryResult!7406)

(assert (=> b!738412 (= e!412970 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19806 a!3186) j!159) a!3186 mask!3328) lt!327758))))

(declare-fun b!738413 () Bool)

(declare-fun e!412963 () Bool)

(declare-fun e!412964 () Bool)

(assert (=> b!738413 (= e!412963 e!412964)))

(declare-fun res!496421 () Bool)

(assert (=> b!738413 (=> (not res!496421) (not e!412964))))

(declare-fun lt!327750 () SeekEntryResult!7406)

(declare-fun lt!327751 () SeekEntryResult!7406)

(assert (=> b!738413 (= res!496421 (= lt!327750 lt!327751))))

(declare-fun lt!327759 () (_ BitVec 64))

(declare-fun lt!327756 () array!41385)

(assert (=> b!738413 (= lt!327751 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327759 lt!327756 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738413 (= lt!327750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327759 mask!3328) lt!327759 lt!327756 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!738413 (= lt!327759 (select (store (arr!19806 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!738413 (= lt!327756 (array!41386 (store (arr!19806 a!3186) i!1173 k!2102) (size!20227 a!3186)))))

(declare-fun res!496418 () Bool)

(declare-fun e!412966 () Bool)

(assert (=> start!65212 (=> (not res!496418) (not e!412966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65212 (= res!496418 (validMask!0 mask!3328))))

(assert (=> start!65212 e!412966))

(assert (=> start!65212 true))

(declare-fun array_inv!15602 (array!41385) Bool)

(assert (=> start!65212 (array_inv!15602 a!3186)))

(declare-fun b!738414 () Bool)

(declare-fun e!412959 () Bool)

(assert (=> b!738414 (= e!412959 e!412963)))

(declare-fun res!496424 () Bool)

(assert (=> b!738414 (=> (not res!496424) (not e!412963))))

(assert (=> b!738414 (= res!496424 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19806 a!3186) j!159) mask!3328) (select (arr!19806 a!3186) j!159) a!3186 mask!3328) lt!327758))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738414 (= lt!327758 (Intermediate!7406 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738415 () Bool)

(assert (=> b!738415 (= e!412966 e!412959)))

(declare-fun res!496408 () Bool)

(assert (=> b!738415 (=> (not res!496408) (not e!412959))))

(declare-fun lt!327757 () SeekEntryResult!7406)

(assert (=> b!738415 (= res!496408 (or (= lt!327757 (MissingZero!7406 i!1173)) (= lt!327757 (MissingVacant!7406 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41385 (_ BitVec 32)) SeekEntryResult!7406)

(assert (=> b!738415 (= lt!327757 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!738416 () Bool)

(declare-fun e!412967 () Bool)

(declare-fun e!412969 () Bool)

(assert (=> b!738416 (= e!412967 e!412969)))

(declare-fun res!496417 () Bool)

(assert (=> b!738416 (=> res!496417 e!412969)))

(declare-fun lt!327752 () (_ BitVec 32))

(assert (=> b!738416 (= res!496417 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327752 #b00000000000000000000000000000000) (bvsge lt!327752 (size!20227 a!3186))))))

(declare-datatypes ((Unit!25220 0))(
  ( (Unit!25221) )
))
(declare-fun lt!327755 () Unit!25220)

(declare-fun e!412965 () Unit!25220)

(assert (=> b!738416 (= lt!327755 e!412965)))

(declare-fun c!81383 () Bool)

(declare-fun lt!327754 () Bool)

(assert (=> b!738416 (= c!81383 lt!327754)))

(assert (=> b!738416 (= lt!327754 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738416 (= lt!327752 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738417 () Bool)

(declare-fun e!412961 () Bool)

(declare-fun e!412962 () Bool)

(assert (=> b!738417 (= e!412961 e!412962)))

(declare-fun res!496410 () Bool)

(assert (=> b!738417 (=> (not res!496410) (not e!412962))))

(declare-fun lt!327753 () SeekEntryResult!7406)

(assert (=> b!738417 (= res!496410 (= (seekEntryOrOpen!0 (select (arr!19806 a!3186) j!159) a!3186 mask!3328) lt!327753))))

(assert (=> b!738417 (= lt!327753 (Found!7406 j!159))))

(declare-fun b!738418 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41385 (_ BitVec 32)) SeekEntryResult!7406)

(assert (=> b!738418 (= e!412970 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19806 a!3186) j!159) a!3186 mask!3328) (Found!7406 j!159)))))

(declare-fun b!738419 () Bool)

(declare-fun res!496413 () Bool)

(assert (=> b!738419 (=> (not res!496413) (not e!412959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41385 (_ BitVec 32)) Bool)

(assert (=> b!738419 (= res!496413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738420 () Bool)

(declare-fun res!496415 () Bool)

(assert (=> b!738420 (=> (not res!496415) (not e!412963))))

(assert (=> b!738420 (= res!496415 e!412970)))

(declare-fun c!81384 () Bool)

(assert (=> b!738420 (= c!81384 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!327749 () SeekEntryResult!7406)

(declare-fun e!412968 () Bool)

(declare-fun b!738421 () Bool)

(assert (=> b!738421 (= e!412968 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327752 resIntermediateIndex!5 (select (arr!19806 a!3186) j!159) a!3186 mask!3328) lt!327749)))))

(declare-fun b!738422 () Bool)

(declare-fun res!496423 () Bool)

(assert (=> b!738422 (=> (not res!496423) (not e!412966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738422 (= res!496423 (validKeyInArray!0 k!2102))))

(declare-fun b!738423 () Bool)

(declare-fun res!496419 () Bool)

(assert (=> b!738423 (=> (not res!496419) (not e!412963))))

(assert (=> b!738423 (= res!496419 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19806 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738424 () Bool)

(declare-fun res!496407 () Bool)

(assert (=> b!738424 (=> (not res!496407) (not e!412966))))

(assert (=> b!738424 (= res!496407 (and (= (size!20227 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20227 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20227 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738425 () Bool)

(declare-fun res!496422 () Bool)

(assert (=> b!738425 (=> (not res!496422) (not e!412959))))

(declare-datatypes ((List!13808 0))(
  ( (Nil!13805) (Cons!13804 (h!14876 (_ BitVec 64)) (t!20123 List!13808)) )
))
(declare-fun arrayNoDuplicates!0 (array!41385 (_ BitVec 32) List!13808) Bool)

(assert (=> b!738425 (= res!496422 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13805))))

(declare-fun b!738426 () Bool)

(declare-fun res!496414 () Bool)

(assert (=> b!738426 (=> (not res!496414) (not e!412959))))

(assert (=> b!738426 (= res!496414 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20227 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20227 a!3186))))))

(declare-fun b!738427 () Bool)

(declare-fun res!496409 () Bool)

(assert (=> b!738427 (=> res!496409 e!412969)))

(assert (=> b!738427 (= res!496409 e!412968)))

(declare-fun c!81385 () Bool)

(assert (=> b!738427 (= c!81385 lt!327754)))

(declare-fun b!738428 () Bool)

(assert (=> b!738428 (= e!412969 true)))

(declare-fun lt!327748 () SeekEntryResult!7406)

(assert (=> b!738428 (= lt!327748 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327752 lt!327759 lt!327756 mask!3328))))

(declare-fun b!738429 () Bool)

(assert (=> b!738429 (= e!412964 (not e!412967))))

(declare-fun res!496416 () Bool)

(assert (=> b!738429 (=> res!496416 e!412967)))

(assert (=> b!738429 (= res!496416 (or (not (is-Intermediate!7406 lt!327751)) (bvsge x!1131 (x!62988 lt!327751))))))

(assert (=> b!738429 (= lt!327749 (Found!7406 j!159))))

(assert (=> b!738429 e!412961))

(declare-fun res!496411 () Bool)

(assert (=> b!738429 (=> (not res!496411) (not e!412961))))

(assert (=> b!738429 (= res!496411 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327760 () Unit!25220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25220)

(assert (=> b!738429 (= lt!327760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738430 () Bool)

(declare-fun res!496420 () Bool)

(assert (=> b!738430 (=> (not res!496420) (not e!412966))))

(declare-fun arrayContainsKey!0 (array!41385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738430 (= res!496420 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738431 () Bool)

(assert (=> b!738431 (= e!412962 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19806 a!3186) j!159) a!3186 mask!3328) lt!327753))))

(declare-fun b!738432 () Bool)

(assert (=> b!738432 (= e!412968 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327752 (select (arr!19806 a!3186) j!159) a!3186 mask!3328) lt!327758)))))

(declare-fun b!738433 () Bool)

(declare-fun Unit!25222 () Unit!25220)

(assert (=> b!738433 (= e!412965 Unit!25222)))

(declare-fun lt!327761 () SeekEntryResult!7406)

(assert (=> b!738433 (= lt!327761 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19806 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738433 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327752 resIntermediateIndex!5 (select (arr!19806 a!3186) j!159) a!3186 mask!3328) lt!327749)))

(declare-fun b!738434 () Bool)

(declare-fun Unit!25223 () Unit!25220)

(assert (=> b!738434 (= e!412965 Unit!25223)))

(assert (=> b!738434 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327752 (select (arr!19806 a!3186) j!159) a!3186 mask!3328) lt!327758)))

(declare-fun b!738435 () Bool)

(declare-fun res!496412 () Bool)

(assert (=> b!738435 (=> (not res!496412) (not e!412966))))

(assert (=> b!738435 (= res!496412 (validKeyInArray!0 (select (arr!19806 a!3186) j!159)))))

(assert (= (and start!65212 res!496418) b!738424))

(assert (= (and b!738424 res!496407) b!738435))

(assert (= (and b!738435 res!496412) b!738422))

(assert (= (and b!738422 res!496423) b!738430))

(assert (= (and b!738430 res!496420) b!738415))

(assert (= (and b!738415 res!496408) b!738419))

(assert (= (and b!738419 res!496413) b!738425))

(assert (= (and b!738425 res!496422) b!738426))

(assert (= (and b!738426 res!496414) b!738414))

(assert (= (and b!738414 res!496424) b!738423))

(assert (= (and b!738423 res!496419) b!738420))

(assert (= (and b!738420 c!81384) b!738412))

(assert (= (and b!738420 (not c!81384)) b!738418))

(assert (= (and b!738420 res!496415) b!738413))

(assert (= (and b!738413 res!496421) b!738429))

(assert (= (and b!738429 res!496411) b!738417))

(assert (= (and b!738417 res!496410) b!738431))

(assert (= (and b!738429 (not res!496416)) b!738416))

(assert (= (and b!738416 c!81383) b!738434))

(assert (= (and b!738416 (not c!81383)) b!738433))

(assert (= (and b!738416 (not res!496417)) b!738427))

(assert (= (and b!738427 c!81385) b!738432))

(assert (= (and b!738427 (not c!81385)) b!738421))

(assert (= (and b!738427 (not res!496409)) b!738428))

(declare-fun m!690049 () Bool)

(assert (=> b!738430 m!690049))

(declare-fun m!690051 () Bool)

(assert (=> b!738417 m!690051))

(assert (=> b!738417 m!690051))

(declare-fun m!690053 () Bool)

(assert (=> b!738417 m!690053))

(assert (=> b!738435 m!690051))

(assert (=> b!738435 m!690051))

(declare-fun m!690055 () Bool)

(assert (=> b!738435 m!690055))

(declare-fun m!690057 () Bool)

(assert (=> b!738419 m!690057))

(declare-fun m!690059 () Bool)

(assert (=> b!738428 m!690059))

(declare-fun m!690061 () Bool)

(assert (=> b!738425 m!690061))

(assert (=> b!738418 m!690051))

(assert (=> b!738418 m!690051))

(declare-fun m!690063 () Bool)

(assert (=> b!738418 m!690063))

(declare-fun m!690065 () Bool)

(assert (=> b!738423 m!690065))

(declare-fun m!690067 () Bool)

(assert (=> b!738415 m!690067))

(assert (=> b!738414 m!690051))

(assert (=> b!738414 m!690051))

(declare-fun m!690069 () Bool)

(assert (=> b!738414 m!690069))

(assert (=> b!738414 m!690069))

(assert (=> b!738414 m!690051))

(declare-fun m!690071 () Bool)

(assert (=> b!738414 m!690071))

(assert (=> b!738421 m!690051))

(assert (=> b!738421 m!690051))

(declare-fun m!690073 () Bool)

(assert (=> b!738421 m!690073))

(assert (=> b!738433 m!690051))

(assert (=> b!738433 m!690051))

(assert (=> b!738433 m!690063))

(assert (=> b!738433 m!690051))

(assert (=> b!738433 m!690073))

(declare-fun m!690075 () Bool)

(assert (=> b!738416 m!690075))

(assert (=> b!738432 m!690051))

(assert (=> b!738432 m!690051))

(declare-fun m!690077 () Bool)

(assert (=> b!738432 m!690077))

(declare-fun m!690079 () Bool)

(assert (=> b!738422 m!690079))

(declare-fun m!690081 () Bool)

(assert (=> b!738429 m!690081))

(declare-fun m!690083 () Bool)

(assert (=> b!738429 m!690083))

(assert (=> b!738434 m!690051))

(assert (=> b!738434 m!690051))

(assert (=> b!738434 m!690077))

(assert (=> b!738412 m!690051))

(assert (=> b!738412 m!690051))

(declare-fun m!690085 () Bool)

(assert (=> b!738412 m!690085))

(assert (=> b!738431 m!690051))

(assert (=> b!738431 m!690051))

(declare-fun m!690087 () Bool)

(assert (=> b!738431 m!690087))

(declare-fun m!690089 () Bool)

(assert (=> start!65212 m!690089))

(declare-fun m!690091 () Bool)

(assert (=> start!65212 m!690091))

(declare-fun m!690093 () Bool)

(assert (=> b!738413 m!690093))

(declare-fun m!690095 () Bool)

(assert (=> b!738413 m!690095))

(declare-fun m!690097 () Bool)

(assert (=> b!738413 m!690097))

(assert (=> b!738413 m!690093))

(declare-fun m!690099 () Bool)

(assert (=> b!738413 m!690099))

(declare-fun m!690101 () Bool)

(assert (=> b!738413 m!690101))

(push 1)

