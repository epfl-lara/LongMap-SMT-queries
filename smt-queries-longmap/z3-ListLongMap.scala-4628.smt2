; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64448 () Bool)

(assert start!64448)

(declare-fun b!724766 () Bool)

(declare-fun e!405906 () Bool)

(declare-fun e!405907 () Bool)

(assert (=> b!724766 (= e!405906 e!405907)))

(declare-fun res!486066 () Bool)

(assert (=> b!724766 (=> (not res!486066) (not e!405907))))

(declare-datatypes ((SeekEntryResult!7210 0))(
  ( (MissingZero!7210 (index!31208 (_ BitVec 32))) (Found!7210 (index!31209 (_ BitVec 32))) (Intermediate!7210 (undefined!8022 Bool) (index!31210 (_ BitVec 32)) (x!62215 (_ BitVec 32))) (Undefined!7210) (MissingVacant!7210 (index!31211 (_ BitVec 32))) )
))
(declare-fun lt!320961 () SeekEntryResult!7210)

(declare-datatypes ((array!40983 0))(
  ( (array!40984 (arr!19613 (Array (_ BitVec 32) (_ BitVec 64))) (size!20034 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40983)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40983 (_ BitVec 32)) SeekEntryResult!7210)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724766 (= res!486066 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19613 a!3186) j!159) mask!3328) (select (arr!19613 a!3186) j!159) a!3186 mask!3328) lt!320961))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724766 (= lt!320961 (Intermediate!7210 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724767 () Bool)

(declare-fun res!486057 () Bool)

(assert (=> b!724767 (=> (not res!486057) (not e!405907))))

(declare-fun e!405901 () Bool)

(assert (=> b!724767 (= res!486057 e!405901)))

(declare-fun c!79728 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!724767 (= c!79728 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!486062 () Bool)

(declare-fun e!405904 () Bool)

(assert (=> start!64448 (=> (not res!486062) (not e!405904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64448 (= res!486062 (validMask!0 mask!3328))))

(assert (=> start!64448 e!405904))

(assert (=> start!64448 true))

(declare-fun array_inv!15496 (array!40983) Bool)

(assert (=> start!64448 (array_inv!15496 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!724768 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40983 (_ BitVec 32)) SeekEntryResult!7210)

(assert (=> b!724768 (= e!405901 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19613 a!3186) j!159) a!3186 mask!3328) (Found!7210 j!159)))))

(declare-fun b!724769 () Bool)

(declare-fun res!486069 () Bool)

(assert (=> b!724769 (=> (not res!486069) (not e!405904))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724769 (= res!486069 (and (= (size!20034 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20034 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20034 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724770 () Bool)

(declare-fun res!486067 () Bool)

(assert (=> b!724770 (=> (not res!486067) (not e!405904))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724770 (= res!486067 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724771 () Bool)

(declare-fun res!486058 () Bool)

(assert (=> b!724771 (=> (not res!486058) (not e!405907))))

(assert (=> b!724771 (= res!486058 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19613 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724772 () Bool)

(declare-fun res!486064 () Bool)

(assert (=> b!724772 (=> (not res!486064) (not e!405906))))

(declare-datatypes ((List!13654 0))(
  ( (Nil!13651) (Cons!13650 (h!14707 (_ BitVec 64)) (t!19960 List!13654)) )
))
(declare-fun arrayNoDuplicates!0 (array!40983 (_ BitVec 32) List!13654) Bool)

(assert (=> b!724772 (= res!486064 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13651))))

(declare-fun b!724773 () Bool)

(declare-fun res!486063 () Bool)

(assert (=> b!724773 (=> (not res!486063) (not e!405904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724773 (= res!486063 (validKeyInArray!0 (select (arr!19613 a!3186) j!159)))))

(declare-fun b!724774 () Bool)

(assert (=> b!724774 (= e!405901 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19613 a!3186) j!159) a!3186 mask!3328) lt!320961))))

(declare-fun b!724775 () Bool)

(declare-fun e!405903 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40983 (_ BitVec 32)) SeekEntryResult!7210)

(assert (=> b!724775 (= e!405903 (= (seekEntryOrOpen!0 (select (arr!19613 a!3186) j!159) a!3186 mask!3328) (Found!7210 j!159)))))

(declare-fun b!724776 () Bool)

(declare-fun res!486068 () Bool)

(assert (=> b!724776 (=> (not res!486068) (not e!405906))))

(assert (=> b!724776 (= res!486068 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20034 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20034 a!3186))))))

(declare-fun b!724777 () Bool)

(declare-fun res!486061 () Bool)

(assert (=> b!724777 (=> (not res!486061) (not e!405906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40983 (_ BitVec 32)) Bool)

(assert (=> b!724777 (= res!486061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724778 () Bool)

(declare-fun e!405905 () Bool)

(assert (=> b!724778 (= e!405905 (not true))))

(assert (=> b!724778 e!405903))

(declare-fun res!486056 () Bool)

(assert (=> b!724778 (=> (not res!486056) (not e!405903))))

(assert (=> b!724778 (= res!486056 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24710 0))(
  ( (Unit!24711) )
))
(declare-fun lt!320960 () Unit!24710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24710)

(assert (=> b!724778 (= lt!320960 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724779 () Bool)

(declare-fun res!486059 () Bool)

(assert (=> b!724779 (=> (not res!486059) (not e!405904))))

(assert (=> b!724779 (= res!486059 (validKeyInArray!0 k0!2102))))

(declare-fun b!724780 () Bool)

(assert (=> b!724780 (= e!405907 e!405905)))

(declare-fun res!486060 () Bool)

(assert (=> b!724780 (=> (not res!486060) (not e!405905))))

(declare-fun lt!320962 () array!40983)

(declare-fun lt!320963 () (_ BitVec 64))

(assert (=> b!724780 (= res!486060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320963 mask!3328) lt!320963 lt!320962 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320963 lt!320962 mask!3328)))))

(assert (=> b!724780 (= lt!320963 (select (store (arr!19613 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724780 (= lt!320962 (array!40984 (store (arr!19613 a!3186) i!1173 k0!2102) (size!20034 a!3186)))))

(declare-fun b!724781 () Bool)

(assert (=> b!724781 (= e!405904 e!405906)))

(declare-fun res!486065 () Bool)

(assert (=> b!724781 (=> (not res!486065) (not e!405906))))

(declare-fun lt!320959 () SeekEntryResult!7210)

(assert (=> b!724781 (= res!486065 (or (= lt!320959 (MissingZero!7210 i!1173)) (= lt!320959 (MissingVacant!7210 i!1173))))))

(assert (=> b!724781 (= lt!320959 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64448 res!486062) b!724769))

(assert (= (and b!724769 res!486069) b!724773))

(assert (= (and b!724773 res!486063) b!724779))

(assert (= (and b!724779 res!486059) b!724770))

(assert (= (and b!724770 res!486067) b!724781))

(assert (= (and b!724781 res!486065) b!724777))

(assert (= (and b!724777 res!486061) b!724772))

(assert (= (and b!724772 res!486064) b!724776))

(assert (= (and b!724776 res!486068) b!724766))

(assert (= (and b!724766 res!486066) b!724771))

(assert (= (and b!724771 res!486058) b!724767))

(assert (= (and b!724767 c!79728) b!724774))

(assert (= (and b!724767 (not c!79728)) b!724768))

(assert (= (and b!724767 res!486057) b!724780))

(assert (= (and b!724780 res!486060) b!724778))

(assert (= (and b!724778 res!486056) b!724775))

(declare-fun m!678461 () Bool)

(assert (=> b!724768 m!678461))

(assert (=> b!724768 m!678461))

(declare-fun m!678463 () Bool)

(assert (=> b!724768 m!678463))

(declare-fun m!678465 () Bool)

(assert (=> b!724780 m!678465))

(declare-fun m!678467 () Bool)

(assert (=> b!724780 m!678467))

(declare-fun m!678469 () Bool)

(assert (=> b!724780 m!678469))

(declare-fun m!678471 () Bool)

(assert (=> b!724780 m!678471))

(declare-fun m!678473 () Bool)

(assert (=> b!724780 m!678473))

(assert (=> b!724780 m!678469))

(declare-fun m!678475 () Bool)

(assert (=> b!724777 m!678475))

(assert (=> b!724775 m!678461))

(assert (=> b!724775 m!678461))

(declare-fun m!678477 () Bool)

(assert (=> b!724775 m!678477))

(assert (=> b!724766 m!678461))

(assert (=> b!724766 m!678461))

(declare-fun m!678479 () Bool)

(assert (=> b!724766 m!678479))

(assert (=> b!724766 m!678479))

(assert (=> b!724766 m!678461))

(declare-fun m!678481 () Bool)

(assert (=> b!724766 m!678481))

(declare-fun m!678483 () Bool)

(assert (=> b!724779 m!678483))

(declare-fun m!678485 () Bool)

(assert (=> start!64448 m!678485))

(declare-fun m!678487 () Bool)

(assert (=> start!64448 m!678487))

(declare-fun m!678489 () Bool)

(assert (=> b!724772 m!678489))

(declare-fun m!678491 () Bool)

(assert (=> b!724781 m!678491))

(assert (=> b!724774 m!678461))

(assert (=> b!724774 m!678461))

(declare-fun m!678493 () Bool)

(assert (=> b!724774 m!678493))

(declare-fun m!678495 () Bool)

(assert (=> b!724771 m!678495))

(declare-fun m!678497 () Bool)

(assert (=> b!724778 m!678497))

(declare-fun m!678499 () Bool)

(assert (=> b!724778 m!678499))

(assert (=> b!724773 m!678461))

(assert (=> b!724773 m!678461))

(declare-fun m!678501 () Bool)

(assert (=> b!724773 m!678501))

(declare-fun m!678503 () Bool)

(assert (=> b!724770 m!678503))

(check-sat (not b!724778) (not b!724774) (not b!724766) (not b!724772) (not b!724775) (not b!724768) (not b!724770) (not b!724780) (not start!64448) (not b!724781) (not b!724777) (not b!724779) (not b!724773))
(check-sat)
