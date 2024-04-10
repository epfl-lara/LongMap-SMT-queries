; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65656 () Bool)

(assert start!65656)

(declare-fun b!752045 () Bool)

(declare-fun e!419508 () Bool)

(declare-fun e!419513 () Bool)

(assert (=> b!752045 (= e!419508 e!419513)))

(declare-fun res!507815 () Bool)

(assert (=> b!752045 (=> (not res!507815) (not e!419513))))

(declare-datatypes ((SeekEntryResult!7628 0))(
  ( (MissingZero!7628 (index!32880 (_ BitVec 32))) (Found!7628 (index!32881 (_ BitVec 32))) (Intermediate!7628 (undefined!8440 Bool) (index!32882 (_ BitVec 32)) (x!63802 (_ BitVec 32))) (Undefined!7628) (MissingVacant!7628 (index!32883 (_ BitVec 32))) )
))
(declare-fun lt!334502 () SeekEntryResult!7628)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752045 (= res!507815 (or (= lt!334502 (MissingZero!7628 i!1173)) (= lt!334502 (MissingVacant!7628 i!1173))))))

(declare-datatypes ((array!41829 0))(
  ( (array!41830 (arr!20028 (Array (_ BitVec 32) (_ BitVec 64))) (size!20449 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41829)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41829 (_ BitVec 32)) SeekEntryResult!7628)

(assert (=> b!752045 (= lt!334502 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!752046 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!419507 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41829 (_ BitVec 32)) SeekEntryResult!7628)

(assert (=> b!752046 (= e!419507 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20028 a!3186) j!159) a!3186 mask!3328) (Found!7628 j!159)))))

(declare-fun b!752047 () Bool)

(declare-fun res!507824 () Bool)

(assert (=> b!752047 (=> (not res!507824) (not e!419508))))

(assert (=> b!752047 (= res!507824 (and (= (size!20449 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20449 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20449 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752048 () Bool)

(declare-fun res!507816 () Bool)

(declare-fun e!419506 () Bool)

(assert (=> b!752048 (=> (not res!507816) (not e!419506))))

(declare-fun lt!334505 () (_ BitVec 64))

(declare-fun lt!334501 () array!41829)

(assert (=> b!752048 (= res!507816 (= (seekEntryOrOpen!0 lt!334505 lt!334501 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334505 lt!334501 mask!3328)))))

(declare-fun b!752049 () Bool)

(declare-fun res!507812 () Bool)

(assert (=> b!752049 (=> (not res!507812) (not e!419513))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752049 (= res!507812 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20449 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20449 a!3186))))))

(declare-fun e!419503 () Bool)

(declare-fun b!752050 () Bool)

(declare-fun lt!334503 () SeekEntryResult!7628)

(assert (=> b!752050 (= e!419503 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20028 a!3186) j!159) a!3186 mask!3328) lt!334503))))

(declare-fun b!752051 () Bool)

(declare-fun e!419502 () Bool)

(declare-fun e!419505 () Bool)

(assert (=> b!752051 (= e!419502 e!419505)))

(declare-fun res!507826 () Bool)

(assert (=> b!752051 (=> (not res!507826) (not e!419505))))

(declare-fun lt!334499 () SeekEntryResult!7628)

(declare-fun lt!334497 () SeekEntryResult!7628)

(assert (=> b!752051 (= res!507826 (= lt!334499 lt!334497))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41829 (_ BitVec 32)) SeekEntryResult!7628)

(assert (=> b!752051 (= lt!334497 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334505 lt!334501 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752051 (= lt!334499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334505 mask!3328) lt!334505 lt!334501 mask!3328))))

(assert (=> b!752051 (= lt!334505 (select (store (arr!20028 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!752051 (= lt!334501 (array!41830 (store (arr!20028 a!3186) i!1173 k!2102) (size!20449 a!3186)))))

(declare-fun b!752052 () Bool)

(declare-datatypes ((Unit!25892 0))(
  ( (Unit!25893) )
))
(declare-fun e!419511 () Unit!25892)

(declare-fun Unit!25894 () Unit!25892)

(assert (=> b!752052 (= e!419511 Unit!25894)))

(assert (=> b!752052 false))

(declare-fun b!752054 () Bool)

(declare-fun res!507813 () Bool)

(assert (=> b!752054 (=> (not res!507813) (not e!419508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752054 (= res!507813 (validKeyInArray!0 (select (arr!20028 a!3186) j!159)))))

(declare-fun b!752055 () Bool)

(declare-fun res!507825 () Bool)

(assert (=> b!752055 (=> (not res!507825) (not e!419513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41829 (_ BitVec 32)) Bool)

(assert (=> b!752055 (= res!507825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752056 () Bool)

(declare-fun res!507814 () Bool)

(assert (=> b!752056 (=> (not res!507814) (not e!419508))))

(declare-fun arrayContainsKey!0 (array!41829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752056 (= res!507814 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!334494 () SeekEntryResult!7628)

(declare-fun b!752057 () Bool)

(assert (=> b!752057 (= e!419507 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20028 a!3186) j!159) a!3186 mask!3328) lt!334494))))

(declare-fun b!752058 () Bool)

(declare-fun res!507820 () Bool)

(assert (=> b!752058 (=> (not res!507820) (not e!419502))))

(assert (=> b!752058 (= res!507820 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20028 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752059 () Bool)

(declare-fun e!419504 () Bool)

(assert (=> b!752059 (= e!419505 (not e!419504))))

(declare-fun res!507822 () Bool)

(assert (=> b!752059 (=> res!507822 e!419504)))

(assert (=> b!752059 (= res!507822 (or (not (is-Intermediate!7628 lt!334497)) (bvslt x!1131 (x!63802 lt!334497)) (not (= x!1131 (x!63802 lt!334497))) (not (= index!1321 (index!32882 lt!334497)))))))

(assert (=> b!752059 e!419503))

(declare-fun res!507827 () Bool)

(assert (=> b!752059 (=> (not res!507827) (not e!419503))))

(declare-fun lt!334504 () SeekEntryResult!7628)

(assert (=> b!752059 (= res!507827 (= lt!334504 lt!334503))))

(assert (=> b!752059 (= lt!334503 (Found!7628 j!159))))

(assert (=> b!752059 (= lt!334504 (seekEntryOrOpen!0 (select (arr!20028 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752059 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334498 () Unit!25892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25892)

(assert (=> b!752059 (= lt!334498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752060 () Bool)

(declare-fun Unit!25895 () Unit!25892)

(assert (=> b!752060 (= e!419511 Unit!25895)))

(declare-fun b!752061 () Bool)

(declare-fun lt!334496 () SeekEntryResult!7628)

(assert (=> b!752061 (= e!419506 (= lt!334504 lt!334496))))

(declare-fun b!752062 () Bool)

(declare-fun e!419509 () Bool)

(declare-fun e!419510 () Bool)

(assert (=> b!752062 (= e!419509 e!419510)))

(declare-fun res!507830 () Bool)

(assert (=> b!752062 (=> res!507830 e!419510)))

(declare-fun lt!334500 () (_ BitVec 64))

(assert (=> b!752062 (= res!507830 (= lt!334500 lt!334505))))

(assert (=> b!752062 (= lt!334500 (select (store (arr!20028 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!752063 () Bool)

(assert (=> b!752063 (= e!419504 e!419509)))

(declare-fun res!507828 () Bool)

(assert (=> b!752063 (=> res!507828 e!419509)))

(assert (=> b!752063 (= res!507828 (not (= lt!334496 lt!334503)))))

(assert (=> b!752063 (= lt!334496 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20028 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752064 () Bool)

(declare-fun res!507829 () Bool)

(assert (=> b!752064 (=> (not res!507829) (not e!419502))))

(assert (=> b!752064 (= res!507829 e!419507)))

(declare-fun c!82497 () Bool)

(assert (=> b!752064 (= c!82497 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752065 () Bool)

(declare-fun res!507818 () Bool)

(assert (=> b!752065 (=> (not res!507818) (not e!419513))))

(declare-datatypes ((List!14030 0))(
  ( (Nil!14027) (Cons!14026 (h!15098 (_ BitVec 64)) (t!20345 List!14030)) )
))
(declare-fun arrayNoDuplicates!0 (array!41829 (_ BitVec 32) List!14030) Bool)

(assert (=> b!752065 (= res!507818 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14027))))

(declare-fun res!507821 () Bool)

(assert (=> start!65656 (=> (not res!507821) (not e!419508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65656 (= res!507821 (validMask!0 mask!3328))))

(assert (=> start!65656 e!419508))

(assert (=> start!65656 true))

(declare-fun array_inv!15824 (array!41829) Bool)

(assert (=> start!65656 (array_inv!15824 a!3186)))

(declare-fun b!752053 () Bool)

(assert (=> b!752053 (= e!419510 true)))

(assert (=> b!752053 e!419506))

(declare-fun res!507819 () Bool)

(assert (=> b!752053 (=> (not res!507819) (not e!419506))))

(assert (=> b!752053 (= res!507819 (= lt!334500 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334495 () Unit!25892)

(assert (=> b!752053 (= lt!334495 e!419511)))

(declare-fun c!82498 () Bool)

(assert (=> b!752053 (= c!82498 (= lt!334500 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752066 () Bool)

(declare-fun res!507823 () Bool)

(assert (=> b!752066 (=> (not res!507823) (not e!419508))))

(assert (=> b!752066 (= res!507823 (validKeyInArray!0 k!2102))))

(declare-fun b!752067 () Bool)

(assert (=> b!752067 (= e!419513 e!419502)))

(declare-fun res!507817 () Bool)

(assert (=> b!752067 (=> (not res!507817) (not e!419502))))

(assert (=> b!752067 (= res!507817 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20028 a!3186) j!159) mask!3328) (select (arr!20028 a!3186) j!159) a!3186 mask!3328) lt!334494))))

(assert (=> b!752067 (= lt!334494 (Intermediate!7628 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65656 res!507821) b!752047))

(assert (= (and b!752047 res!507824) b!752054))

(assert (= (and b!752054 res!507813) b!752066))

(assert (= (and b!752066 res!507823) b!752056))

(assert (= (and b!752056 res!507814) b!752045))

(assert (= (and b!752045 res!507815) b!752055))

(assert (= (and b!752055 res!507825) b!752065))

(assert (= (and b!752065 res!507818) b!752049))

(assert (= (and b!752049 res!507812) b!752067))

(assert (= (and b!752067 res!507817) b!752058))

(assert (= (and b!752058 res!507820) b!752064))

(assert (= (and b!752064 c!82497) b!752057))

(assert (= (and b!752064 (not c!82497)) b!752046))

(assert (= (and b!752064 res!507829) b!752051))

(assert (= (and b!752051 res!507826) b!752059))

(assert (= (and b!752059 res!507827) b!752050))

(assert (= (and b!752059 (not res!507822)) b!752063))

(assert (= (and b!752063 (not res!507828)) b!752062))

(assert (= (and b!752062 (not res!507830)) b!752053))

(assert (= (and b!752053 c!82498) b!752052))

(assert (= (and b!752053 (not c!82498)) b!752060))

(assert (= (and b!752053 res!507819) b!752048))

(assert (= (and b!752048 res!507816) b!752061))

(declare-fun m!701083 () Bool)

(assert (=> b!752066 m!701083))

(declare-fun m!701085 () Bool)

(assert (=> b!752056 m!701085))

(declare-fun m!701087 () Bool)

(assert (=> b!752051 m!701087))

(declare-fun m!701089 () Bool)

(assert (=> b!752051 m!701089))

(declare-fun m!701091 () Bool)

(assert (=> b!752051 m!701091))

(declare-fun m!701093 () Bool)

(assert (=> b!752051 m!701093))

(assert (=> b!752051 m!701091))

(declare-fun m!701095 () Bool)

(assert (=> b!752051 m!701095))

(declare-fun m!701097 () Bool)

(assert (=> b!752048 m!701097))

(declare-fun m!701099 () Bool)

(assert (=> b!752048 m!701099))

(declare-fun m!701101 () Bool)

(assert (=> b!752045 m!701101))

(declare-fun m!701103 () Bool)

(assert (=> b!752059 m!701103))

(assert (=> b!752059 m!701103))

(declare-fun m!701105 () Bool)

(assert (=> b!752059 m!701105))

(declare-fun m!701107 () Bool)

(assert (=> b!752059 m!701107))

(declare-fun m!701109 () Bool)

(assert (=> b!752059 m!701109))

(assert (=> b!752050 m!701103))

(assert (=> b!752050 m!701103))

(declare-fun m!701111 () Bool)

(assert (=> b!752050 m!701111))

(declare-fun m!701113 () Bool)

(assert (=> b!752058 m!701113))

(assert (=> b!752062 m!701089))

(declare-fun m!701115 () Bool)

(assert (=> b!752062 m!701115))

(declare-fun m!701117 () Bool)

(assert (=> b!752055 m!701117))

(assert (=> b!752057 m!701103))

(assert (=> b!752057 m!701103))

(declare-fun m!701119 () Bool)

(assert (=> b!752057 m!701119))

(declare-fun m!701121 () Bool)

(assert (=> start!65656 m!701121))

(declare-fun m!701123 () Bool)

(assert (=> start!65656 m!701123))

(assert (=> b!752046 m!701103))

(assert (=> b!752046 m!701103))

(declare-fun m!701125 () Bool)

(assert (=> b!752046 m!701125))

(assert (=> b!752054 m!701103))

(assert (=> b!752054 m!701103))

(declare-fun m!701127 () Bool)

(assert (=> b!752054 m!701127))

(assert (=> b!752067 m!701103))

(assert (=> b!752067 m!701103))

(declare-fun m!701129 () Bool)

(assert (=> b!752067 m!701129))

(assert (=> b!752067 m!701129))

(assert (=> b!752067 m!701103))

(declare-fun m!701131 () Bool)

(assert (=> b!752067 m!701131))

(assert (=> b!752063 m!701103))

(assert (=> b!752063 m!701103))

(assert (=> b!752063 m!701125))

(declare-fun m!701133 () Bool)

(assert (=> b!752065 m!701133))

(push 1)

