; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67532 () Bool)

(assert start!67532)

(declare-fun b!781512 () Bool)

(declare-fun e!434633 () Bool)

(declare-fun e!434629 () Bool)

(assert (=> b!781512 (= e!434633 e!434629)))

(declare-fun res!528790 () Bool)

(assert (=> b!781512 (=> (not res!528790) (not e!434629))))

(declare-datatypes ((array!42654 0))(
  ( (array!42655 (arr!20417 (Array (_ BitVec 32) (_ BitVec 64))) (size!20838 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42654)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8014 0))(
  ( (MissingZero!8014 (index!34424 (_ BitVec 32))) (Found!8014 (index!34425 (_ BitVec 32))) (Intermediate!8014 (undefined!8826 Bool) (index!34426 (_ BitVec 32)) (x!65388 (_ BitVec 32))) (Undefined!8014) (MissingVacant!8014 (index!34427 (_ BitVec 32))) )
))
(declare-fun lt!348140 () SeekEntryResult!8014)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42654 (_ BitVec 32)) SeekEntryResult!8014)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781512 (= res!528790 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20417 a!3186) j!159) mask!3328) (select (arr!20417 a!3186) j!159) a!3186 mask!3328) lt!348140))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781512 (= lt!348140 (Intermediate!8014 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781513 () Bool)

(declare-datatypes ((Unit!26924 0))(
  ( (Unit!26925) )
))
(declare-fun e!434634 () Unit!26924)

(declare-fun Unit!26926 () Unit!26924)

(assert (=> b!781513 (= e!434634 Unit!26926)))

(assert (=> b!781513 false))

(declare-fun lt!348147 () SeekEntryResult!8014)

(declare-fun e!434627 () Bool)

(declare-fun b!781514 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42654 (_ BitVec 32)) SeekEntryResult!8014)

(assert (=> b!781514 (= e!434627 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20417 a!3186) j!159) a!3186 mask!3328) lt!348147))))

(declare-fun b!781515 () Bool)

(declare-fun res!528782 () Bool)

(declare-fun e!434631 () Bool)

(assert (=> b!781515 (=> (not res!528782) (not e!434631))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781515 (= res!528782 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781516 () Bool)

(declare-fun res!528783 () Bool)

(assert (=> b!781516 (=> (not res!528783) (not e!434629))))

(declare-fun e!434628 () Bool)

(assert (=> b!781516 (= res!528783 e!434628)))

(declare-fun c!86772 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!781516 (= c!86772 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!528795 () Bool)

(assert (=> start!67532 (=> (not res!528795) (not e!434631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67532 (= res!528795 (validMask!0 mask!3328))))

(assert (=> start!67532 e!434631))

(assert (=> start!67532 true))

(declare-fun array_inv!16300 (array!42654) Bool)

(assert (=> start!67532 (array_inv!16300 a!3186)))

(declare-fun b!781517 () Bool)

(declare-fun res!528792 () Bool)

(assert (=> b!781517 (=> (not res!528792) (not e!434633))))

(declare-datatypes ((List!14458 0))(
  ( (Nil!14455) (Cons!14454 (h!15574 (_ BitVec 64)) (t!20764 List!14458)) )
))
(declare-fun arrayNoDuplicates!0 (array!42654 (_ BitVec 32) List!14458) Bool)

(assert (=> b!781517 (= res!528792 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14455))))

(declare-fun b!781518 () Bool)

(declare-fun res!528789 () Bool)

(declare-fun e!434635 () Bool)

(assert (=> b!781518 (=> res!528789 e!434635)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!348148 () (_ BitVec 64))

(assert (=> b!781518 (= res!528789 (= (select (store (arr!20417 a!3186) i!1173 k0!2102) index!1321) lt!348148))))

(declare-fun b!781519 () Bool)

(assert (=> b!781519 (= e!434628 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20417 a!3186) j!159) a!3186 mask!3328) lt!348140))))

(declare-fun b!781520 () Bool)

(declare-fun res!528797 () Bool)

(assert (=> b!781520 (=> (not res!528797) (not e!434631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781520 (= res!528797 (validKeyInArray!0 (select (arr!20417 a!3186) j!159)))))

(declare-fun b!781521 () Bool)

(declare-fun res!528787 () Bool)

(assert (=> b!781521 (=> (not res!528787) (not e!434631))))

(assert (=> b!781521 (= res!528787 (and (= (size!20838 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20838 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20838 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781522 () Bool)

(declare-fun res!528793 () Bool)

(assert (=> b!781522 (=> res!528793 e!434635)))

(assert (=> b!781522 (= res!528793 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20417 a!3186) j!159) a!3186 mask!3328) lt!348147)))))

(declare-fun b!781523 () Bool)

(declare-fun res!528791 () Bool)

(assert (=> b!781523 (=> (not res!528791) (not e!434631))))

(assert (=> b!781523 (= res!528791 (validKeyInArray!0 k0!2102))))

(declare-fun b!781524 () Bool)

(assert (=> b!781524 (= e!434628 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20417 a!3186) j!159) a!3186 mask!3328) (Found!8014 j!159)))))

(declare-fun b!781525 () Bool)

(assert (=> b!781525 (= e!434631 e!434633)))

(declare-fun res!528786 () Bool)

(assert (=> b!781525 (=> (not res!528786) (not e!434633))))

(declare-fun lt!348145 () SeekEntryResult!8014)

(assert (=> b!781525 (= res!528786 (or (= lt!348145 (MissingZero!8014 i!1173)) (= lt!348145 (MissingVacant!8014 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42654 (_ BitVec 32)) SeekEntryResult!8014)

(assert (=> b!781525 (= lt!348145 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781526 () Bool)

(assert (=> b!781526 (= e!434635 true)))

(assert (=> b!781526 (= (select (store (arr!20417 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348142 () Unit!26924)

(assert (=> b!781526 (= lt!348142 e!434634)))

(declare-fun c!86771 () Bool)

(assert (=> b!781526 (= c!86771 (= (select (store (arr!20417 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781527 () Bool)

(declare-fun e!434630 () Bool)

(assert (=> b!781527 (= e!434630 (not e!434635))))

(declare-fun res!528798 () Bool)

(assert (=> b!781527 (=> res!528798 e!434635)))

(declare-fun lt!348143 () SeekEntryResult!8014)

(get-info :version)

(assert (=> b!781527 (= res!528798 (or (not ((_ is Intermediate!8014) lt!348143)) (bvslt x!1131 (x!65388 lt!348143)) (not (= x!1131 (x!65388 lt!348143))) (not (= index!1321 (index!34426 lt!348143)))))))

(assert (=> b!781527 e!434627))

(declare-fun res!528788 () Bool)

(assert (=> b!781527 (=> (not res!528788) (not e!434627))))

(declare-fun lt!348146 () SeekEntryResult!8014)

(assert (=> b!781527 (= res!528788 (= lt!348146 lt!348147))))

(assert (=> b!781527 (= lt!348147 (Found!8014 j!159))))

(assert (=> b!781527 (= lt!348146 (seekEntryOrOpen!0 (select (arr!20417 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42654 (_ BitVec 32)) Bool)

(assert (=> b!781527 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348141 () Unit!26924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26924)

(assert (=> b!781527 (= lt!348141 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781528 () Bool)

(declare-fun res!528794 () Bool)

(assert (=> b!781528 (=> (not res!528794) (not e!434629))))

(assert (=> b!781528 (= res!528794 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20417 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781529 () Bool)

(assert (=> b!781529 (= e!434629 e!434630)))

(declare-fun res!528784 () Bool)

(assert (=> b!781529 (=> (not res!528784) (not e!434630))))

(declare-fun lt!348144 () SeekEntryResult!8014)

(assert (=> b!781529 (= res!528784 (= lt!348144 lt!348143))))

(declare-fun lt!348149 () array!42654)

(assert (=> b!781529 (= lt!348143 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348148 lt!348149 mask!3328))))

(assert (=> b!781529 (= lt!348144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348148 mask!3328) lt!348148 lt!348149 mask!3328))))

(assert (=> b!781529 (= lt!348148 (select (store (arr!20417 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781529 (= lt!348149 (array!42655 (store (arr!20417 a!3186) i!1173 k0!2102) (size!20838 a!3186)))))

(declare-fun b!781530 () Bool)

(declare-fun res!528796 () Bool)

(assert (=> b!781530 (=> (not res!528796) (not e!434633))))

(assert (=> b!781530 (= res!528796 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20838 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20838 a!3186))))))

(declare-fun b!781531 () Bool)

(declare-fun res!528785 () Bool)

(assert (=> b!781531 (=> (not res!528785) (not e!434633))))

(assert (=> b!781531 (= res!528785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781532 () Bool)

(declare-fun Unit!26927 () Unit!26924)

(assert (=> b!781532 (= e!434634 Unit!26927)))

(assert (= (and start!67532 res!528795) b!781521))

(assert (= (and b!781521 res!528787) b!781520))

(assert (= (and b!781520 res!528797) b!781523))

(assert (= (and b!781523 res!528791) b!781515))

(assert (= (and b!781515 res!528782) b!781525))

(assert (= (and b!781525 res!528786) b!781531))

(assert (= (and b!781531 res!528785) b!781517))

(assert (= (and b!781517 res!528792) b!781530))

(assert (= (and b!781530 res!528796) b!781512))

(assert (= (and b!781512 res!528790) b!781528))

(assert (= (and b!781528 res!528794) b!781516))

(assert (= (and b!781516 c!86772) b!781519))

(assert (= (and b!781516 (not c!86772)) b!781524))

(assert (= (and b!781516 res!528783) b!781529))

(assert (= (and b!781529 res!528784) b!781527))

(assert (= (and b!781527 res!528788) b!781514))

(assert (= (and b!781527 (not res!528798)) b!781522))

(assert (= (and b!781522 (not res!528793)) b!781518))

(assert (= (and b!781518 (not res!528789)) b!781526))

(assert (= (and b!781526 c!86771) b!781513))

(assert (= (and b!781526 (not c!86771)) b!781532))

(declare-fun m!723957 () Bool)

(assert (=> b!781529 m!723957))

(declare-fun m!723959 () Bool)

(assert (=> b!781529 m!723959))

(declare-fun m!723961 () Bool)

(assert (=> b!781529 m!723961))

(declare-fun m!723963 () Bool)

(assert (=> b!781529 m!723963))

(assert (=> b!781529 m!723959))

(declare-fun m!723965 () Bool)

(assert (=> b!781529 m!723965))

(declare-fun m!723967 () Bool)

(assert (=> b!781527 m!723967))

(assert (=> b!781527 m!723967))

(declare-fun m!723969 () Bool)

(assert (=> b!781527 m!723969))

(declare-fun m!723971 () Bool)

(assert (=> b!781527 m!723971))

(declare-fun m!723973 () Bool)

(assert (=> b!781527 m!723973))

(assert (=> b!781514 m!723967))

(assert (=> b!781514 m!723967))

(declare-fun m!723975 () Bool)

(assert (=> b!781514 m!723975))

(assert (=> b!781512 m!723967))

(assert (=> b!781512 m!723967))

(declare-fun m!723977 () Bool)

(assert (=> b!781512 m!723977))

(assert (=> b!781512 m!723977))

(assert (=> b!781512 m!723967))

(declare-fun m!723979 () Bool)

(assert (=> b!781512 m!723979))

(declare-fun m!723981 () Bool)

(assert (=> b!781515 m!723981))

(declare-fun m!723983 () Bool)

(assert (=> b!781523 m!723983))

(declare-fun m!723985 () Bool)

(assert (=> b!781525 m!723985))

(declare-fun m!723987 () Bool)

(assert (=> b!781531 m!723987))

(declare-fun m!723989 () Bool)

(assert (=> b!781517 m!723989))

(assert (=> b!781519 m!723967))

(assert (=> b!781519 m!723967))

(declare-fun m!723991 () Bool)

(assert (=> b!781519 m!723991))

(assert (=> b!781522 m!723967))

(assert (=> b!781522 m!723967))

(declare-fun m!723993 () Bool)

(assert (=> b!781522 m!723993))

(assert (=> b!781518 m!723963))

(declare-fun m!723995 () Bool)

(assert (=> b!781518 m!723995))

(declare-fun m!723997 () Bool)

(assert (=> start!67532 m!723997))

(declare-fun m!723999 () Bool)

(assert (=> start!67532 m!723999))

(declare-fun m!724001 () Bool)

(assert (=> b!781528 m!724001))

(assert (=> b!781520 m!723967))

(assert (=> b!781520 m!723967))

(declare-fun m!724003 () Bool)

(assert (=> b!781520 m!724003))

(assert (=> b!781526 m!723963))

(assert (=> b!781526 m!723995))

(assert (=> b!781524 m!723967))

(assert (=> b!781524 m!723967))

(assert (=> b!781524 m!723993))

(check-sat (not b!781523) (not b!781531) (not b!781517) (not start!67532) (not b!781527) (not b!781520) (not b!781512) (not b!781515) (not b!781529) (not b!781514) (not b!781524) (not b!781522) (not b!781519) (not b!781525))
(check-sat)
