; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65828 () Bool)

(assert start!65828)

(declare-fun b!757979 () Bool)

(declare-fun res!512717 () Bool)

(declare-fun e!422600 () Bool)

(assert (=> b!757979 (=> (not res!512717) (not e!422600))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42001 0))(
  ( (array!42002 (arr!20114 (Array (_ BitVec 32) (_ BitVec 64))) (size!20535 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42001)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757979 (= res!512717 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20535 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20535 a!3186))))))

(declare-fun b!757980 () Bool)

(declare-fun res!512731 () Bool)

(declare-fun e!422605 () Bool)

(assert (=> b!757980 (=> (not res!512731) (not e!422605))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757980 (= res!512731 (validKeyInArray!0 k!2102))))

(declare-fun b!757981 () Bool)

(declare-fun e!422608 () Bool)

(declare-fun e!422604 () Bool)

(assert (=> b!757981 (= e!422608 e!422604)))

(declare-fun res!512727 () Bool)

(assert (=> b!757981 (=> (not res!512727) (not e!422604))))

(declare-datatypes ((SeekEntryResult!7714 0))(
  ( (MissingZero!7714 (index!33224 (_ BitVec 32))) (Found!7714 (index!33225 (_ BitVec 32))) (Intermediate!7714 (undefined!8526 Bool) (index!33226 (_ BitVec 32)) (x!64112 (_ BitVec 32))) (Undefined!7714) (MissingVacant!7714 (index!33227 (_ BitVec 32))) )
))
(declare-fun lt!337601 () SeekEntryResult!7714)

(declare-fun lt!337600 () SeekEntryResult!7714)

(assert (=> b!757981 (= res!512727 (= lt!337601 lt!337600))))

(declare-fun lt!337599 () array!42001)

(declare-fun lt!337598 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42001 (_ BitVec 32)) SeekEntryResult!7714)

(assert (=> b!757981 (= lt!337600 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337598 lt!337599 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757981 (= lt!337601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337598 mask!3328) lt!337598 lt!337599 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757981 (= lt!337598 (select (store (arr!20114 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757981 (= lt!337599 (array!42002 (store (arr!20114 a!3186) i!1173 k!2102) (size!20535 a!3186)))))

(declare-fun b!757982 () Bool)

(declare-datatypes ((Unit!26236 0))(
  ( (Unit!26237) )
))
(declare-fun e!422598 () Unit!26236)

(declare-fun Unit!26238 () Unit!26236)

(assert (=> b!757982 (= e!422598 Unit!26238)))

(declare-fun b!757983 () Bool)

(declare-fun res!512729 () Bool)

(assert (=> b!757983 (=> (not res!512729) (not e!422605))))

(assert (=> b!757983 (= res!512729 (validKeyInArray!0 (select (arr!20114 a!3186) j!159)))))

(declare-fun b!757984 () Bool)

(declare-fun e!422607 () Bool)

(assert (=> b!757984 (= e!422607 true)))

(declare-fun e!422606 () Bool)

(assert (=> b!757984 e!422606))

(declare-fun res!512724 () Bool)

(assert (=> b!757984 (=> (not res!512724) (not e!422606))))

(declare-fun lt!337591 () (_ BitVec 64))

(assert (=> b!757984 (= res!512724 (= lt!337591 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337597 () Unit!26236)

(assert (=> b!757984 (= lt!337597 e!422598)))

(declare-fun c!83014 () Bool)

(assert (=> b!757984 (= c!83014 (= lt!337591 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!422601 () Bool)

(declare-fun b!757986 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42001 (_ BitVec 32)) SeekEntryResult!7714)

(assert (=> b!757986 (= e!422601 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20114 a!3186) j!159) a!3186 mask!3328) (Found!7714 j!159)))))

(declare-fun b!757987 () Bool)

(declare-fun Unit!26239 () Unit!26236)

(assert (=> b!757987 (= e!422598 Unit!26239)))

(assert (=> b!757987 false))

(declare-fun b!757988 () Bool)

(declare-fun res!512725 () Bool)

(assert (=> b!757988 (=> (not res!512725) (not e!422605))))

(declare-fun arrayContainsKey!0 (array!42001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757988 (= res!512725 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757989 () Bool)

(declare-fun e!422603 () Bool)

(assert (=> b!757989 (= e!422604 (not e!422603))))

(declare-fun res!512723 () Bool)

(assert (=> b!757989 (=> res!512723 e!422603)))

(assert (=> b!757989 (= res!512723 (or (not (is-Intermediate!7714 lt!337600)) (bvslt x!1131 (x!64112 lt!337600)) (not (= x!1131 (x!64112 lt!337600))) (not (= index!1321 (index!33226 lt!337600)))))))

(declare-fun e!422599 () Bool)

(assert (=> b!757989 e!422599))

(declare-fun res!512720 () Bool)

(assert (=> b!757989 (=> (not res!512720) (not e!422599))))

(declare-fun lt!337592 () SeekEntryResult!7714)

(declare-fun lt!337596 () SeekEntryResult!7714)

(assert (=> b!757989 (= res!512720 (= lt!337592 lt!337596))))

(assert (=> b!757989 (= lt!337596 (Found!7714 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42001 (_ BitVec 32)) SeekEntryResult!7714)

(assert (=> b!757989 (= lt!337592 (seekEntryOrOpen!0 (select (arr!20114 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42001 (_ BitVec 32)) Bool)

(assert (=> b!757989 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337593 () Unit!26236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26236)

(assert (=> b!757989 (= lt!337593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!337595 () SeekEntryResult!7714)

(declare-fun b!757990 () Bool)

(assert (=> b!757990 (= e!422601 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20114 a!3186) j!159) a!3186 mask!3328) lt!337595))))

(declare-fun b!757991 () Bool)

(assert (=> b!757991 (= e!422600 e!422608)))

(declare-fun res!512714 () Bool)

(assert (=> b!757991 (=> (not res!512714) (not e!422608))))

(assert (=> b!757991 (= res!512714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20114 a!3186) j!159) mask!3328) (select (arr!20114 a!3186) j!159) a!3186 mask!3328) lt!337595))))

(assert (=> b!757991 (= lt!337595 (Intermediate!7714 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757992 () Bool)

(declare-fun lt!337594 () SeekEntryResult!7714)

(assert (=> b!757992 (= e!422606 (= lt!337592 lt!337594))))

(declare-fun b!757993 () Bool)

(declare-fun e!422602 () Bool)

(assert (=> b!757993 (= e!422603 e!422602)))

(declare-fun res!512721 () Bool)

(assert (=> b!757993 (=> res!512721 e!422602)))

(assert (=> b!757993 (= res!512721 (not (= lt!337594 lt!337596)))))

(assert (=> b!757993 (= lt!337594 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20114 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757994 () Bool)

(declare-fun res!512732 () Bool)

(assert (=> b!757994 (=> (not res!512732) (not e!422606))))

(assert (=> b!757994 (= res!512732 (= (seekEntryOrOpen!0 lt!337598 lt!337599 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337598 lt!337599 mask!3328)))))

(declare-fun b!757995 () Bool)

(declare-fun res!512719 () Bool)

(assert (=> b!757995 (=> (not res!512719) (not e!422608))))

(assert (=> b!757995 (= res!512719 e!422601)))

(declare-fun c!83013 () Bool)

(assert (=> b!757995 (= c!83013 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757985 () Bool)

(assert (=> b!757985 (= e!422602 e!422607)))

(declare-fun res!512715 () Bool)

(assert (=> b!757985 (=> res!512715 e!422607)))

(assert (=> b!757985 (= res!512715 (= lt!337591 lt!337598))))

(assert (=> b!757985 (= lt!337591 (select (store (arr!20114 a!3186) i!1173 k!2102) index!1321))))

(declare-fun res!512718 () Bool)

(assert (=> start!65828 (=> (not res!512718) (not e!422605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65828 (= res!512718 (validMask!0 mask!3328))))

(assert (=> start!65828 e!422605))

(assert (=> start!65828 true))

(declare-fun array_inv!15910 (array!42001) Bool)

(assert (=> start!65828 (array_inv!15910 a!3186)))

(declare-fun b!757996 () Bool)

(declare-fun res!512728 () Bool)

(assert (=> b!757996 (=> (not res!512728) (not e!422605))))

(assert (=> b!757996 (= res!512728 (and (= (size!20535 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20535 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20535 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757997 () Bool)

(declare-fun res!512716 () Bool)

(assert (=> b!757997 (=> (not res!512716) (not e!422600))))

(declare-datatypes ((List!14116 0))(
  ( (Nil!14113) (Cons!14112 (h!15184 (_ BitVec 64)) (t!20431 List!14116)) )
))
(declare-fun arrayNoDuplicates!0 (array!42001 (_ BitVec 32) List!14116) Bool)

(assert (=> b!757997 (= res!512716 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14113))))

(declare-fun b!757998 () Bool)

(declare-fun res!512726 () Bool)

(assert (=> b!757998 (=> (not res!512726) (not e!422608))))

(assert (=> b!757998 (= res!512726 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20114 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757999 () Bool)

(assert (=> b!757999 (= e!422599 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20114 a!3186) j!159) a!3186 mask!3328) lt!337596))))

(declare-fun b!758000 () Bool)

(assert (=> b!758000 (= e!422605 e!422600)))

(declare-fun res!512730 () Bool)

(assert (=> b!758000 (=> (not res!512730) (not e!422600))))

(declare-fun lt!337590 () SeekEntryResult!7714)

(assert (=> b!758000 (= res!512730 (or (= lt!337590 (MissingZero!7714 i!1173)) (= lt!337590 (MissingVacant!7714 i!1173))))))

(assert (=> b!758000 (= lt!337590 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758001 () Bool)

(declare-fun res!512722 () Bool)

(assert (=> b!758001 (=> (not res!512722) (not e!422600))))

(assert (=> b!758001 (= res!512722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65828 res!512718) b!757996))

(assert (= (and b!757996 res!512728) b!757983))

(assert (= (and b!757983 res!512729) b!757980))

(assert (= (and b!757980 res!512731) b!757988))

(assert (= (and b!757988 res!512725) b!758000))

(assert (= (and b!758000 res!512730) b!758001))

(assert (= (and b!758001 res!512722) b!757997))

(assert (= (and b!757997 res!512716) b!757979))

(assert (= (and b!757979 res!512717) b!757991))

(assert (= (and b!757991 res!512714) b!757998))

(assert (= (and b!757998 res!512726) b!757995))

(assert (= (and b!757995 c!83013) b!757990))

(assert (= (and b!757995 (not c!83013)) b!757986))

(assert (= (and b!757995 res!512719) b!757981))

(assert (= (and b!757981 res!512727) b!757989))

(assert (= (and b!757989 res!512720) b!757999))

(assert (= (and b!757989 (not res!512723)) b!757993))

(assert (= (and b!757993 (not res!512721)) b!757985))

(assert (= (and b!757985 (not res!512715)) b!757984))

(assert (= (and b!757984 c!83014) b!757987))

(assert (= (and b!757984 (not c!83014)) b!757982))

(assert (= (and b!757984 res!512724) b!757994))

(assert (= (and b!757994 res!512732) b!757992))

(declare-fun m!705555 () Bool)

(assert (=> b!757999 m!705555))

(assert (=> b!757999 m!705555))

(declare-fun m!705557 () Bool)

(assert (=> b!757999 m!705557))

(declare-fun m!705559 () Bool)

(assert (=> b!757994 m!705559))

(declare-fun m!705561 () Bool)

(assert (=> b!757994 m!705561))

(declare-fun m!705563 () Bool)

(assert (=> b!757981 m!705563))

(declare-fun m!705565 () Bool)

(assert (=> b!757981 m!705565))

(declare-fun m!705567 () Bool)

(assert (=> b!757981 m!705567))

(declare-fun m!705569 () Bool)

(assert (=> b!757981 m!705569))

(assert (=> b!757981 m!705563))

(declare-fun m!705571 () Bool)

(assert (=> b!757981 m!705571))

(assert (=> b!757985 m!705567))

(declare-fun m!705573 () Bool)

(assert (=> b!757985 m!705573))

(assert (=> b!757989 m!705555))

(assert (=> b!757989 m!705555))

(declare-fun m!705575 () Bool)

(assert (=> b!757989 m!705575))

(declare-fun m!705577 () Bool)

(assert (=> b!757989 m!705577))

(declare-fun m!705579 () Bool)

(assert (=> b!757989 m!705579))

(assert (=> b!757986 m!705555))

(assert (=> b!757986 m!705555))

(declare-fun m!705581 () Bool)

(assert (=> b!757986 m!705581))

(declare-fun m!705583 () Bool)

(assert (=> b!758001 m!705583))

(declare-fun m!705585 () Bool)

(assert (=> b!757980 m!705585))

(declare-fun m!705587 () Bool)

(assert (=> start!65828 m!705587))

(declare-fun m!705589 () Bool)

(assert (=> start!65828 m!705589))

(declare-fun m!705591 () Bool)

(assert (=> b!758000 m!705591))

(assert (=> b!757990 m!705555))

(assert (=> b!757990 m!705555))

(declare-fun m!705593 () Bool)

(assert (=> b!757990 m!705593))

(declare-fun m!705595 () Bool)

(assert (=> b!757998 m!705595))

(assert (=> b!757983 m!705555))

(assert (=> b!757983 m!705555))

(declare-fun m!705597 () Bool)

(assert (=> b!757983 m!705597))

(assert (=> b!757993 m!705555))

(assert (=> b!757993 m!705555))

(assert (=> b!757993 m!705581))

(assert (=> b!757991 m!705555))

(assert (=> b!757991 m!705555))

(declare-fun m!705599 () Bool)

(assert (=> b!757991 m!705599))

(assert (=> b!757991 m!705599))

(assert (=> b!757991 m!705555))

(declare-fun m!705601 () Bool)

(assert (=> b!757991 m!705601))

(declare-fun m!705603 () Bool)

(assert (=> b!757997 m!705603))

(declare-fun m!705605 () Bool)

(assert (=> b!757988 m!705605))

(push 1)

