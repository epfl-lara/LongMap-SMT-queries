; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65390 () Bool)

(assert start!65390)

(declare-fun b!743961 () Bool)

(declare-fun res!501008 () Bool)

(declare-fun e!415621 () Bool)

(assert (=> b!743961 (=> (not res!501008) (not e!415621))))

(declare-datatypes ((array!41563 0))(
  ( (array!41564 (arr!19895 (Array (_ BitVec 32) (_ BitVec 64))) (size!20316 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41563)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!743961 (= res!501008 (and (= (size!20316 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20316 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20316 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743962 () Bool)

(declare-fun res!501011 () Bool)

(assert (=> b!743962 (=> (not res!501011) (not e!415621))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743962 (= res!501011 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743963 () Bool)

(declare-fun e!415625 () Bool)

(declare-fun e!415624 () Bool)

(assert (=> b!743963 (= e!415625 (not e!415624))))

(declare-fun res!500999 () Bool)

(assert (=> b!743963 (=> res!500999 e!415624)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7495 0))(
  ( (MissingZero!7495 (index!32348 (_ BitVec 32))) (Found!7495 (index!32349 (_ BitVec 32))) (Intermediate!7495 (undefined!8307 Bool) (index!32350 (_ BitVec 32)) (x!63309 (_ BitVec 32))) (Undefined!7495) (MissingVacant!7495 (index!32351 (_ BitVec 32))) )
))
(declare-fun lt!330477 () SeekEntryResult!7495)

(assert (=> b!743963 (= res!500999 (or (not (is-Intermediate!7495 lt!330477)) (bvslt x!1131 (x!63309 lt!330477)) (not (= x!1131 (x!63309 lt!330477))) (not (= index!1321 (index!32350 lt!330477)))))))

(declare-fun e!415622 () Bool)

(assert (=> b!743963 e!415622))

(declare-fun res!501013 () Bool)

(assert (=> b!743963 (=> (not res!501013) (not e!415622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41563 (_ BitVec 32)) Bool)

(assert (=> b!743963 (= res!501013 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25470 0))(
  ( (Unit!25471) )
))
(declare-fun lt!330480 () Unit!25470)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25470)

(assert (=> b!743963 (= lt!330480 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!743964 () Bool)

(declare-fun e!415623 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41563 (_ BitVec 32)) SeekEntryResult!7495)

(assert (=> b!743964 (= e!415623 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19895 a!3186) j!159) a!3186 mask!3328) (Found!7495 j!159)))))

(declare-fun b!743965 () Bool)

(declare-fun res!501006 () Bool)

(declare-fun e!415617 () Bool)

(assert (=> b!743965 (=> (not res!501006) (not e!415617))))

(declare-datatypes ((List!13897 0))(
  ( (Nil!13894) (Cons!13893 (h!14965 (_ BitVec 64)) (t!20212 List!13897)) )
))
(declare-fun arrayNoDuplicates!0 (array!41563 (_ BitVec 32) List!13897) Bool)

(assert (=> b!743965 (= res!501006 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13894))))

(declare-fun b!743966 () Bool)

(declare-fun res!501007 () Bool)

(assert (=> b!743966 (=> (not res!501007) (not e!415621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743966 (= res!501007 (validKeyInArray!0 (select (arr!19895 a!3186) j!159)))))

(declare-fun b!743967 () Bool)

(declare-fun res!501002 () Bool)

(declare-fun e!415620 () Bool)

(assert (=> b!743967 (=> (not res!501002) (not e!415620))))

(assert (=> b!743967 (= res!501002 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19895 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743968 () Bool)

(declare-fun lt!330478 () SeekEntryResult!7495)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41563 (_ BitVec 32)) SeekEntryResult!7495)

(assert (=> b!743968 (= e!415623 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19895 a!3186) j!159) a!3186 mask!3328) lt!330478))))

(declare-fun b!743970 () Bool)

(assert (=> b!743970 (= e!415621 e!415617)))

(declare-fun res!501014 () Bool)

(assert (=> b!743970 (=> (not res!501014) (not e!415617))))

(declare-fun lt!330476 () SeekEntryResult!7495)

(assert (=> b!743970 (= res!501014 (or (= lt!330476 (MissingZero!7495 i!1173)) (= lt!330476 (MissingVacant!7495 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41563 (_ BitVec 32)) SeekEntryResult!7495)

(assert (=> b!743970 (= lt!330476 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!415618 () Bool)

(declare-fun b!743971 () Bool)

(declare-fun lt!330479 () SeekEntryResult!7495)

(assert (=> b!743971 (= e!415618 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19895 a!3186) j!159) a!3186 mask!3328) lt!330479))))

(declare-fun b!743972 () Bool)

(assert (=> b!743972 (= e!415622 e!415618)))

(declare-fun res!501012 () Bool)

(assert (=> b!743972 (=> (not res!501012) (not e!415618))))

(assert (=> b!743972 (= res!501012 (= (seekEntryOrOpen!0 (select (arr!19895 a!3186) j!159) a!3186 mask!3328) lt!330479))))

(assert (=> b!743972 (= lt!330479 (Found!7495 j!159))))

(declare-fun b!743973 () Bool)

(declare-fun res!501004 () Bool)

(assert (=> b!743973 (=> (not res!501004) (not e!415617))))

(assert (=> b!743973 (= res!501004 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20316 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20316 a!3186))))))

(declare-fun b!743974 () Bool)

(assert (=> b!743974 (= e!415617 e!415620)))

(declare-fun res!501000 () Bool)

(assert (=> b!743974 (=> (not res!501000) (not e!415620))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743974 (= res!501000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19895 a!3186) j!159) mask!3328) (select (arr!19895 a!3186) j!159) a!3186 mask!3328) lt!330478))))

(assert (=> b!743974 (= lt!330478 (Intermediate!7495 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743975 () Bool)

(declare-fun res!501003 () Bool)

(assert (=> b!743975 (=> (not res!501003) (not e!415617))))

(assert (=> b!743975 (= res!501003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743969 () Bool)

(declare-fun res!501010 () Bool)

(assert (=> b!743969 (=> (not res!501010) (not e!415621))))

(assert (=> b!743969 (= res!501010 (validKeyInArray!0 k!2102))))

(declare-fun res!501001 () Bool)

(assert (=> start!65390 (=> (not res!501001) (not e!415621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65390 (= res!501001 (validMask!0 mask!3328))))

(assert (=> start!65390 e!415621))

(assert (=> start!65390 true))

(declare-fun array_inv!15691 (array!41563) Bool)

(assert (=> start!65390 (array_inv!15691 a!3186)))

(declare-fun b!743976 () Bool)

(declare-fun res!500998 () Bool)

(assert (=> b!743976 (=> (not res!500998) (not e!415620))))

(assert (=> b!743976 (= res!500998 e!415623)))

(declare-fun c!81862 () Bool)

(assert (=> b!743976 (= c!81862 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743977 () Bool)

(declare-fun lt!330475 () (_ BitVec 64))

(assert (=> b!743977 (= e!415624 (or (= (select (store (arr!19895 a!3186) i!1173 k!2102) index!1321) lt!330475) (not (= (select (store (arr!19895 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!743978 () Bool)

(declare-fun res!501005 () Bool)

(assert (=> b!743978 (=> res!501005 e!415624)))

(assert (=> b!743978 (= res!501005 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19895 a!3186) j!159) a!3186 mask!3328) (Found!7495 j!159))))))

(declare-fun b!743979 () Bool)

(assert (=> b!743979 (= e!415620 e!415625)))

(declare-fun res!501009 () Bool)

(assert (=> b!743979 (=> (not res!501009) (not e!415625))))

(declare-fun lt!330482 () SeekEntryResult!7495)

(assert (=> b!743979 (= res!501009 (= lt!330482 lt!330477))))

(declare-fun lt!330481 () array!41563)

(assert (=> b!743979 (= lt!330477 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330475 lt!330481 mask!3328))))

(assert (=> b!743979 (= lt!330482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330475 mask!3328) lt!330475 lt!330481 mask!3328))))

(assert (=> b!743979 (= lt!330475 (select (store (arr!19895 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743979 (= lt!330481 (array!41564 (store (arr!19895 a!3186) i!1173 k!2102) (size!20316 a!3186)))))

(assert (= (and start!65390 res!501001) b!743961))

(assert (= (and b!743961 res!501008) b!743966))

(assert (= (and b!743966 res!501007) b!743969))

(assert (= (and b!743969 res!501010) b!743962))

(assert (= (and b!743962 res!501011) b!743970))

(assert (= (and b!743970 res!501014) b!743975))

(assert (= (and b!743975 res!501003) b!743965))

(assert (= (and b!743965 res!501006) b!743973))

(assert (= (and b!743973 res!501004) b!743974))

(assert (= (and b!743974 res!501000) b!743967))

(assert (= (and b!743967 res!501002) b!743976))

(assert (= (and b!743976 c!81862) b!743968))

(assert (= (and b!743976 (not c!81862)) b!743964))

(assert (= (and b!743976 res!500998) b!743979))

(assert (= (and b!743979 res!501009) b!743963))

(assert (= (and b!743963 res!501013) b!743972))

(assert (= (and b!743972 res!501012) b!743971))

(assert (= (and b!743963 (not res!500999)) b!743978))

(assert (= (and b!743978 (not res!501005)) b!743977))

(declare-fun m!694561 () Bool)

(assert (=> start!65390 m!694561))

(declare-fun m!694563 () Bool)

(assert (=> start!65390 m!694563))

(declare-fun m!694565 () Bool)

(assert (=> b!743979 m!694565))

(declare-fun m!694567 () Bool)

(assert (=> b!743979 m!694567))

(declare-fun m!694569 () Bool)

(assert (=> b!743979 m!694569))

(declare-fun m!694571 () Bool)

(assert (=> b!743979 m!694571))

(declare-fun m!694573 () Bool)

(assert (=> b!743979 m!694573))

(assert (=> b!743979 m!694567))

(declare-fun m!694575 () Bool)

(assert (=> b!743963 m!694575))

(declare-fun m!694577 () Bool)

(assert (=> b!743963 m!694577))

(declare-fun m!694579 () Bool)

(assert (=> b!743970 m!694579))

(declare-fun m!694581 () Bool)

(assert (=> b!743962 m!694581))

(declare-fun m!694583 () Bool)

(assert (=> b!743965 m!694583))

(declare-fun m!694585 () Bool)

(assert (=> b!743972 m!694585))

(assert (=> b!743972 m!694585))

(declare-fun m!694587 () Bool)

(assert (=> b!743972 m!694587))

(declare-fun m!694589 () Bool)

(assert (=> b!743967 m!694589))

(assert (=> b!743966 m!694585))

(assert (=> b!743966 m!694585))

(declare-fun m!694591 () Bool)

(assert (=> b!743966 m!694591))

(declare-fun m!694593 () Bool)

(assert (=> b!743969 m!694593))

(assert (=> b!743968 m!694585))

(assert (=> b!743968 m!694585))

(declare-fun m!694595 () Bool)

(assert (=> b!743968 m!694595))

(assert (=> b!743978 m!694585))

(assert (=> b!743978 m!694585))

(declare-fun m!694597 () Bool)

(assert (=> b!743978 m!694597))

(assert (=> b!743971 m!694585))

(assert (=> b!743971 m!694585))

(declare-fun m!694599 () Bool)

(assert (=> b!743971 m!694599))

(assert (=> b!743977 m!694571))

(declare-fun m!694601 () Bool)

(assert (=> b!743977 m!694601))

(assert (=> b!743964 m!694585))

(assert (=> b!743964 m!694585))

(assert (=> b!743964 m!694597))

(assert (=> b!743974 m!694585))

(assert (=> b!743974 m!694585))

(declare-fun m!694603 () Bool)

(assert (=> b!743974 m!694603))

(assert (=> b!743974 m!694603))

(assert (=> b!743974 m!694585))

(declare-fun m!694605 () Bool)

(assert (=> b!743974 m!694605))

(declare-fun m!694607 () Bool)

(assert (=> b!743975 m!694607))

(push 1)

(assert (not b!743978))

(assert (not b!743972))

(assert (not b!743979))

(assert (not b!743963))

(assert (not b!743968))

(assert (not b!743970))

(assert (not b!743962))

(assert (not b!743971))

(assert (not b!743966))

(assert (not start!65390))

(assert (not b!743965))

(assert (not b!743964))

(assert (not b!743975))

(assert (not b!743969))

(assert (not b!743974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

