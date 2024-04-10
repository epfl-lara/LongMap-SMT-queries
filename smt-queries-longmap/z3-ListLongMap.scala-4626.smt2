; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64458 () Bool)

(assert start!64458)

(declare-fun b!724777 () Bool)

(declare-fun e!405952 () Bool)

(declare-fun e!405955 () Bool)

(assert (=> b!724777 (= e!405952 e!405955)))

(declare-fun res!485968 () Bool)

(assert (=> b!724777 (=> (not res!485968) (not e!405955))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!40976 0))(
  ( (array!40977 (arr!19609 (Array (_ BitVec 32) (_ BitVec 64))) (size!20030 (_ BitVec 32))) )
))
(declare-fun lt!321126 () array!40976)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321128 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7209 0))(
  ( (MissingZero!7209 (index!31204 (_ BitVec 32))) (Found!7209 (index!31205 (_ BitVec 32))) (Intermediate!7209 (undefined!8021 Bool) (index!31206 (_ BitVec 32)) (x!62203 (_ BitVec 32))) (Undefined!7209) (MissingVacant!7209 (index!31207 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40976 (_ BitVec 32)) SeekEntryResult!7209)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724777 (= res!485968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321128 mask!3328) lt!321128 lt!321126 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321128 lt!321126 mask!3328)))))

(declare-fun a!3186 () array!40976)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!724777 (= lt!321128 (select (store (arr!19609 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724777 (= lt!321126 (array!40977 (store (arr!19609 a!3186) i!1173 k0!2102) (size!20030 a!3186)))))

(declare-fun b!724778 () Bool)

(declare-fun res!485956 () Bool)

(declare-fun e!405953 () Bool)

(assert (=> b!724778 (=> (not res!485956) (not e!405953))))

(declare-fun arrayContainsKey!0 (array!40976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724778 (= res!485956 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724779 () Bool)

(assert (=> b!724779 (= e!405955 (not true))))

(declare-fun e!405956 () Bool)

(assert (=> b!724779 e!405956))

(declare-fun res!485963 () Bool)

(assert (=> b!724779 (=> (not res!485963) (not e!405956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40976 (_ BitVec 32)) Bool)

(assert (=> b!724779 (= res!485963 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24736 0))(
  ( (Unit!24737) )
))
(declare-fun lt!321124 () Unit!24736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24736)

(assert (=> b!724779 (= lt!321124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724780 () Bool)

(declare-fun res!485964 () Bool)

(declare-fun e!405951 () Bool)

(assert (=> b!724780 (=> (not res!485964) (not e!405951))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724780 (= res!485964 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20030 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20030 a!3186))))))

(declare-fun b!724781 () Bool)

(declare-fun res!485961 () Bool)

(assert (=> b!724781 (=> (not res!485961) (not e!405952))))

(declare-fun e!405950 () Bool)

(assert (=> b!724781 (= res!485961 e!405950)))

(declare-fun c!79783 () Bool)

(assert (=> b!724781 (= c!79783 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724782 () Bool)

(assert (=> b!724782 (= e!405953 e!405951)))

(declare-fun res!485959 () Bool)

(assert (=> b!724782 (=> (not res!485959) (not e!405951))))

(declare-fun lt!321127 () SeekEntryResult!7209)

(assert (=> b!724782 (= res!485959 (or (= lt!321127 (MissingZero!7209 i!1173)) (= lt!321127 (MissingVacant!7209 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40976 (_ BitVec 32)) SeekEntryResult!7209)

(assert (=> b!724782 (= lt!321127 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!724783 () Bool)

(declare-fun res!485965 () Bool)

(assert (=> b!724783 (=> (not res!485965) (not e!405953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724783 (= res!485965 (validKeyInArray!0 k0!2102))))

(declare-fun b!724784 () Bool)

(declare-fun res!485962 () Bool)

(assert (=> b!724784 (=> (not res!485962) (not e!405953))))

(assert (=> b!724784 (= res!485962 (validKeyInArray!0 (select (arr!19609 a!3186) j!159)))))

(declare-fun b!724785 () Bool)

(declare-fun res!485966 () Bool)

(assert (=> b!724785 (=> (not res!485966) (not e!405951))))

(assert (=> b!724785 (= res!485966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!485957 () Bool)

(assert (=> start!64458 (=> (not res!485957) (not e!405953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64458 (= res!485957 (validMask!0 mask!3328))))

(assert (=> start!64458 e!405953))

(assert (=> start!64458 true))

(declare-fun array_inv!15405 (array!40976) Bool)

(assert (=> start!64458 (array_inv!15405 a!3186)))

(declare-fun b!724776 () Bool)

(assert (=> b!724776 (= e!405956 (= (seekEntryOrOpen!0 (select (arr!19609 a!3186) j!159) a!3186 mask!3328) (Found!7209 j!159)))))

(declare-fun b!724786 () Bool)

(declare-fun res!485960 () Bool)

(assert (=> b!724786 (=> (not res!485960) (not e!405951))))

(declare-datatypes ((List!13611 0))(
  ( (Nil!13608) (Cons!13607 (h!14664 (_ BitVec 64)) (t!19926 List!13611)) )
))
(declare-fun arrayNoDuplicates!0 (array!40976 (_ BitVec 32) List!13611) Bool)

(assert (=> b!724786 (= res!485960 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13608))))

(declare-fun b!724787 () Bool)

(declare-fun lt!321125 () SeekEntryResult!7209)

(assert (=> b!724787 (= e!405950 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19609 a!3186) j!159) a!3186 mask!3328) lt!321125))))

(declare-fun b!724788 () Bool)

(declare-fun res!485967 () Bool)

(assert (=> b!724788 (=> (not res!485967) (not e!405953))))

(assert (=> b!724788 (= res!485967 (and (= (size!20030 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20030 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20030 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724789 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40976 (_ BitVec 32)) SeekEntryResult!7209)

(assert (=> b!724789 (= e!405950 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19609 a!3186) j!159) a!3186 mask!3328) (Found!7209 j!159)))))

(declare-fun b!724790 () Bool)

(assert (=> b!724790 (= e!405951 e!405952)))

(declare-fun res!485969 () Bool)

(assert (=> b!724790 (=> (not res!485969) (not e!405952))))

(assert (=> b!724790 (= res!485969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19609 a!3186) j!159) mask!3328) (select (arr!19609 a!3186) j!159) a!3186 mask!3328) lt!321125))))

(assert (=> b!724790 (= lt!321125 (Intermediate!7209 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724791 () Bool)

(declare-fun res!485958 () Bool)

(assert (=> b!724791 (=> (not res!485958) (not e!405952))))

(assert (=> b!724791 (= res!485958 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19609 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64458 res!485957) b!724788))

(assert (= (and b!724788 res!485967) b!724784))

(assert (= (and b!724784 res!485962) b!724783))

(assert (= (and b!724783 res!485965) b!724778))

(assert (= (and b!724778 res!485956) b!724782))

(assert (= (and b!724782 res!485959) b!724785))

(assert (= (and b!724785 res!485966) b!724786))

(assert (= (and b!724786 res!485960) b!724780))

(assert (= (and b!724780 res!485964) b!724790))

(assert (= (and b!724790 res!485969) b!724791))

(assert (= (and b!724791 res!485958) b!724781))

(assert (= (and b!724781 c!79783) b!724787))

(assert (= (and b!724781 (not c!79783)) b!724789))

(assert (= (and b!724781 res!485961) b!724777))

(assert (= (and b!724777 res!485968) b!724779))

(assert (= (and b!724779 res!485963) b!724776))

(declare-fun m!678999 () Bool)

(assert (=> b!724776 m!678999))

(assert (=> b!724776 m!678999))

(declare-fun m!679001 () Bool)

(assert (=> b!724776 m!679001))

(assert (=> b!724787 m!678999))

(assert (=> b!724787 m!678999))

(declare-fun m!679003 () Bool)

(assert (=> b!724787 m!679003))

(assert (=> b!724790 m!678999))

(assert (=> b!724790 m!678999))

(declare-fun m!679005 () Bool)

(assert (=> b!724790 m!679005))

(assert (=> b!724790 m!679005))

(assert (=> b!724790 m!678999))

(declare-fun m!679007 () Bool)

(assert (=> b!724790 m!679007))

(declare-fun m!679009 () Bool)

(assert (=> b!724783 m!679009))

(declare-fun m!679011 () Bool)

(assert (=> b!724785 m!679011))

(declare-fun m!679013 () Bool)

(assert (=> b!724777 m!679013))

(declare-fun m!679015 () Bool)

(assert (=> b!724777 m!679015))

(declare-fun m!679017 () Bool)

(assert (=> b!724777 m!679017))

(assert (=> b!724777 m!679013))

(declare-fun m!679019 () Bool)

(assert (=> b!724777 m!679019))

(declare-fun m!679021 () Bool)

(assert (=> b!724777 m!679021))

(declare-fun m!679023 () Bool)

(assert (=> start!64458 m!679023))

(declare-fun m!679025 () Bool)

(assert (=> start!64458 m!679025))

(declare-fun m!679027 () Bool)

(assert (=> b!724778 m!679027))

(assert (=> b!724784 m!678999))

(assert (=> b!724784 m!678999))

(declare-fun m!679029 () Bool)

(assert (=> b!724784 m!679029))

(declare-fun m!679031 () Bool)

(assert (=> b!724782 m!679031))

(declare-fun m!679033 () Bool)

(assert (=> b!724786 m!679033))

(assert (=> b!724789 m!678999))

(assert (=> b!724789 m!678999))

(declare-fun m!679035 () Bool)

(assert (=> b!724789 m!679035))

(declare-fun m!679037 () Bool)

(assert (=> b!724791 m!679037))

(declare-fun m!679039 () Bool)

(assert (=> b!724779 m!679039))

(declare-fun m!679041 () Bool)

(assert (=> b!724779 m!679041))

(check-sat (not b!724785) (not b!724778) (not b!724789) (not start!64458) (not b!724787) (not b!724783) (not b!724779) (not b!724776) (not b!724786) (not b!724790) (not b!724784) (not b!724782) (not b!724777))
(check-sat)
