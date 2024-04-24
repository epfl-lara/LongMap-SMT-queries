; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65904 () Bool)

(assert start!65904)

(declare-datatypes ((array!41947 0))(
  ( (array!41948 (arr!20083 (Array (_ BitVec 32) (_ BitVec 64))) (size!20503 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41947)

(declare-datatypes ((SeekEntryResult!7639 0))(
  ( (MissingZero!7639 (index!32924 (_ BitVec 32))) (Found!7639 (index!32925 (_ BitVec 32))) (Intermediate!7639 (undefined!8451 Bool) (index!32926 (_ BitVec 32)) (x!63985 (_ BitVec 32))) (Undefined!7639) (MissingVacant!7639 (index!32927 (_ BitVec 32))) )
))
(declare-fun lt!336977 () SeekEntryResult!7639)

(declare-fun b!756930 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!422147 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41947 (_ BitVec 32)) SeekEntryResult!7639)

(assert (=> b!756930 (= e!422147 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20083 a!3186) j!159) a!3186 mask!3328) lt!336977))))

(declare-fun b!756931 () Bool)

(declare-datatypes ((Unit!26113 0))(
  ( (Unit!26114) )
))
(declare-fun e!422148 () Unit!26113)

(declare-fun Unit!26115 () Unit!26113)

(assert (=> b!756931 (= e!422148 Unit!26115)))

(declare-fun b!756932 () Bool)

(declare-fun res!511553 () Bool)

(declare-fun e!422140 () Bool)

(assert (=> b!756932 (=> (not res!511553) (not e!422140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756932 (= res!511553 (validKeyInArray!0 (select (arr!20083 a!3186) j!159)))))

(declare-fun b!756933 () Bool)

(declare-fun res!511549 () Bool)

(declare-fun e!422143 () Bool)

(assert (=> b!756933 (=> (not res!511549) (not e!422143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41947 (_ BitVec 32)) Bool)

(assert (=> b!756933 (= res!511549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756934 () Bool)

(declare-fun res!511538 () Bool)

(assert (=> b!756934 (=> (not res!511538) (not e!422143))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756934 (= res!511538 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20503 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20503 a!3186))))))

(declare-fun b!756935 () Bool)

(declare-fun e!422141 () Bool)

(declare-fun lt!336975 () SeekEntryResult!7639)

(declare-fun lt!336971 () SeekEntryResult!7639)

(assert (=> b!756935 (= e!422141 (= lt!336975 lt!336971))))

(declare-fun b!756936 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41947 (_ BitVec 32)) SeekEntryResult!7639)

(assert (=> b!756936 (= e!422147 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20083 a!3186) j!159) a!3186 mask!3328) (Found!7639 j!159)))))

(declare-fun b!756938 () Bool)

(declare-fun res!511541 () Bool)

(assert (=> b!756938 (=> (not res!511541) (not e!422141))))

(declare-fun lt!336978 () array!41947)

(declare-fun lt!336969 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41947 (_ BitVec 32)) SeekEntryResult!7639)

(assert (=> b!756938 (= res!511541 (= (seekEntryOrOpen!0 lt!336969 lt!336978 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336969 lt!336978 mask!3328)))))

(declare-fun b!756939 () Bool)

(declare-fun res!511550 () Bool)

(declare-fun e!422144 () Bool)

(assert (=> b!756939 (=> (not res!511550) (not e!422144))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756939 (= res!511550 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20083 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756940 () Bool)

(assert (=> b!756940 (= e!422143 e!422144)))

(declare-fun res!511552 () Bool)

(assert (=> b!756940 (=> (not res!511552) (not e!422144))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756940 (= res!511552 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20083 a!3186) j!159) mask!3328) (select (arr!20083 a!3186) j!159) a!3186 mask!3328) lt!336977))))

(assert (=> b!756940 (= lt!336977 (Intermediate!7639 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756941 () Bool)

(declare-fun e!422151 () Bool)

(assert (=> b!756941 (= e!422151 true)))

(assert (=> b!756941 e!422141))

(declare-fun res!511554 () Bool)

(assert (=> b!756941 (=> (not res!511554) (not e!422141))))

(declare-fun lt!336973 () (_ BitVec 64))

(assert (=> b!756941 (= res!511554 (= lt!336973 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336968 () Unit!26113)

(assert (=> b!756941 (= lt!336968 e!422148)))

(declare-fun c!83080 () Bool)

(assert (=> b!756941 (= c!83080 (= lt!336973 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756942 () Bool)

(declare-fun Unit!26116 () Unit!26113)

(assert (=> b!756942 (= e!422148 Unit!26116)))

(assert (=> b!756942 false))

(declare-fun b!756943 () Bool)

(declare-fun res!511545 () Bool)

(assert (=> b!756943 (=> (not res!511545) (not e!422143))))

(declare-datatypes ((List!13992 0))(
  ( (Nil!13989) (Cons!13988 (h!15066 (_ BitVec 64)) (t!20299 List!13992)) )
))
(declare-fun arrayNoDuplicates!0 (array!41947 (_ BitVec 32) List!13992) Bool)

(assert (=> b!756943 (= res!511545 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13989))))

(declare-fun b!756944 () Bool)

(declare-fun e!422145 () Bool)

(assert (=> b!756944 (= e!422144 e!422145)))

(declare-fun res!511544 () Bool)

(assert (=> b!756944 (=> (not res!511544) (not e!422145))))

(declare-fun lt!336967 () SeekEntryResult!7639)

(declare-fun lt!336970 () SeekEntryResult!7639)

(assert (=> b!756944 (= res!511544 (= lt!336967 lt!336970))))

(assert (=> b!756944 (= lt!336970 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336969 lt!336978 mask!3328))))

(assert (=> b!756944 (= lt!336967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336969 mask!3328) lt!336969 lt!336978 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!756944 (= lt!336969 (select (store (arr!20083 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756944 (= lt!336978 (array!41948 (store (arr!20083 a!3186) i!1173 k0!2102) (size!20503 a!3186)))))

(declare-fun b!756945 () Bool)

(declare-fun res!511555 () Bool)

(assert (=> b!756945 (=> (not res!511555) (not e!422140))))

(declare-fun arrayContainsKey!0 (array!41947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756945 (= res!511555 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756946 () Bool)

(assert (=> b!756946 (= e!422140 e!422143)))

(declare-fun res!511546 () Bool)

(assert (=> b!756946 (=> (not res!511546) (not e!422143))))

(declare-fun lt!336976 () SeekEntryResult!7639)

(assert (=> b!756946 (= res!511546 (or (= lt!336976 (MissingZero!7639 i!1173)) (= lt!336976 (MissingVacant!7639 i!1173))))))

(assert (=> b!756946 (= lt!336976 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756947 () Bool)

(declare-fun e!422146 () Bool)

(assert (=> b!756947 (= e!422146 e!422151)))

(declare-fun res!511539 () Bool)

(assert (=> b!756947 (=> res!511539 e!422151)))

(assert (=> b!756947 (= res!511539 (= lt!336973 lt!336969))))

(assert (=> b!756947 (= lt!336973 (select (store (arr!20083 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756948 () Bool)

(declare-fun res!511548 () Bool)

(assert (=> b!756948 (=> (not res!511548) (not e!422140))))

(assert (=> b!756948 (= res!511548 (validKeyInArray!0 k0!2102))))

(declare-fun b!756949 () Bool)

(declare-fun e!422149 () Bool)

(assert (=> b!756949 (= e!422145 (not e!422149))))

(declare-fun res!511551 () Bool)

(assert (=> b!756949 (=> res!511551 e!422149)))

(get-info :version)

(assert (=> b!756949 (= res!511551 (or (not ((_ is Intermediate!7639) lt!336970)) (bvslt x!1131 (x!63985 lt!336970)) (not (= x!1131 (x!63985 lt!336970))) (not (= index!1321 (index!32926 lt!336970)))))))

(declare-fun e!422142 () Bool)

(assert (=> b!756949 e!422142))

(declare-fun res!511543 () Bool)

(assert (=> b!756949 (=> (not res!511543) (not e!422142))))

(declare-fun lt!336974 () SeekEntryResult!7639)

(assert (=> b!756949 (= res!511543 (= lt!336975 lt!336974))))

(assert (=> b!756949 (= lt!336974 (Found!7639 j!159))))

(assert (=> b!756949 (= lt!336975 (seekEntryOrOpen!0 (select (arr!20083 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756949 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336972 () Unit!26113)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26113)

(assert (=> b!756949 (= lt!336972 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756950 () Bool)

(declare-fun res!511547 () Bool)

(assert (=> b!756950 (=> (not res!511547) (not e!422140))))

(assert (=> b!756950 (= res!511547 (and (= (size!20503 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20503 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20503 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!511542 () Bool)

(assert (=> start!65904 (=> (not res!511542) (not e!422140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65904 (= res!511542 (validMask!0 mask!3328))))

(assert (=> start!65904 e!422140))

(assert (=> start!65904 true))

(declare-fun array_inv!15942 (array!41947) Bool)

(assert (=> start!65904 (array_inv!15942 a!3186)))

(declare-fun b!756937 () Bool)

(assert (=> b!756937 (= e!422142 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20083 a!3186) j!159) a!3186 mask!3328) lt!336974))))

(declare-fun b!756951 () Bool)

(declare-fun res!511537 () Bool)

(assert (=> b!756951 (=> (not res!511537) (not e!422144))))

(assert (=> b!756951 (= res!511537 e!422147)))

(declare-fun c!83081 () Bool)

(assert (=> b!756951 (= c!83081 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756952 () Bool)

(assert (=> b!756952 (= e!422149 e!422146)))

(declare-fun res!511540 () Bool)

(assert (=> b!756952 (=> res!511540 e!422146)))

(assert (=> b!756952 (= res!511540 (not (= lt!336971 lt!336974)))))

(assert (=> b!756952 (= lt!336971 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20083 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65904 res!511542) b!756950))

(assert (= (and b!756950 res!511547) b!756932))

(assert (= (and b!756932 res!511553) b!756948))

(assert (= (and b!756948 res!511548) b!756945))

(assert (= (and b!756945 res!511555) b!756946))

(assert (= (and b!756946 res!511546) b!756933))

(assert (= (and b!756933 res!511549) b!756943))

(assert (= (and b!756943 res!511545) b!756934))

(assert (= (and b!756934 res!511538) b!756940))

(assert (= (and b!756940 res!511552) b!756939))

(assert (= (and b!756939 res!511550) b!756951))

(assert (= (and b!756951 c!83081) b!756930))

(assert (= (and b!756951 (not c!83081)) b!756936))

(assert (= (and b!756951 res!511537) b!756944))

(assert (= (and b!756944 res!511544) b!756949))

(assert (= (and b!756949 res!511543) b!756937))

(assert (= (and b!756949 (not res!511551)) b!756952))

(assert (= (and b!756952 (not res!511540)) b!756947))

(assert (= (and b!756947 (not res!511539)) b!756941))

(assert (= (and b!756941 c!83080) b!756942))

(assert (= (and b!756941 (not c!83080)) b!756931))

(assert (= (and b!756941 res!511554) b!756938))

(assert (= (and b!756938 res!511541) b!756935))

(declare-fun m!705363 () Bool)

(assert (=> b!756946 m!705363))

(declare-fun m!705365 () Bool)

(assert (=> b!756943 m!705365))

(declare-fun m!705367 () Bool)

(assert (=> b!756938 m!705367))

(declare-fun m!705369 () Bool)

(assert (=> b!756938 m!705369))

(declare-fun m!705371 () Bool)

(assert (=> b!756939 m!705371))

(declare-fun m!705373 () Bool)

(assert (=> b!756936 m!705373))

(assert (=> b!756936 m!705373))

(declare-fun m!705375 () Bool)

(assert (=> b!756936 m!705375))

(assert (=> b!756940 m!705373))

(assert (=> b!756940 m!705373))

(declare-fun m!705377 () Bool)

(assert (=> b!756940 m!705377))

(assert (=> b!756940 m!705377))

(assert (=> b!756940 m!705373))

(declare-fun m!705379 () Bool)

(assert (=> b!756940 m!705379))

(assert (=> b!756949 m!705373))

(assert (=> b!756949 m!705373))

(declare-fun m!705381 () Bool)

(assert (=> b!756949 m!705381))

(declare-fun m!705383 () Bool)

(assert (=> b!756949 m!705383))

(declare-fun m!705385 () Bool)

(assert (=> b!756949 m!705385))

(assert (=> b!756932 m!705373))

(assert (=> b!756932 m!705373))

(declare-fun m!705387 () Bool)

(assert (=> b!756932 m!705387))

(declare-fun m!705389 () Bool)

(assert (=> b!756944 m!705389))

(declare-fun m!705391 () Bool)

(assert (=> b!756944 m!705391))

(declare-fun m!705393 () Bool)

(assert (=> b!756944 m!705393))

(declare-fun m!705395 () Bool)

(assert (=> b!756944 m!705395))

(assert (=> b!756944 m!705393))

(declare-fun m!705397 () Bool)

(assert (=> b!756944 m!705397))

(declare-fun m!705399 () Bool)

(assert (=> start!65904 m!705399))

(declare-fun m!705401 () Bool)

(assert (=> start!65904 m!705401))

(assert (=> b!756930 m!705373))

(assert (=> b!756930 m!705373))

(declare-fun m!705403 () Bool)

(assert (=> b!756930 m!705403))

(assert (=> b!756937 m!705373))

(assert (=> b!756937 m!705373))

(declare-fun m!705405 () Bool)

(assert (=> b!756937 m!705405))

(declare-fun m!705407 () Bool)

(assert (=> b!756933 m!705407))

(declare-fun m!705409 () Bool)

(assert (=> b!756948 m!705409))

(assert (=> b!756947 m!705391))

(declare-fun m!705411 () Bool)

(assert (=> b!756947 m!705411))

(declare-fun m!705413 () Bool)

(assert (=> b!756945 m!705413))

(assert (=> b!756952 m!705373))

(assert (=> b!756952 m!705373))

(assert (=> b!756952 m!705375))

(check-sat (not b!756943) (not b!756949) (not b!756933) (not b!756938) (not b!756936) (not b!756945) (not b!756940) (not b!756948) (not b!756937) (not start!65904) (not b!756946) (not b!756944) (not b!756930) (not b!756932) (not b!756952))
(check-sat)
