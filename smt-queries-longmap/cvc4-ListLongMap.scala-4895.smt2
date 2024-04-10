; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67552 () Bool)

(assert start!67552)

(declare-fun b!781699 () Bool)

(declare-fun res!528857 () Bool)

(declare-fun e!434756 () Bool)

(assert (=> b!781699 (=> (not res!528857) (not e!434756))))

(declare-datatypes ((array!42655 0))(
  ( (array!42656 (arr!20417 (Array (_ BitVec 32) (_ BitVec 64))) (size!20838 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42655)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781699 (= res!528857 (validKeyInArray!0 (select (arr!20417 a!3186) j!159)))))

(declare-fun b!781700 () Bool)

(declare-fun e!434759 () Bool)

(declare-fun e!434762 () Bool)

(assert (=> b!781700 (= e!434759 e!434762)))

(declare-fun res!528841 () Bool)

(assert (=> b!781700 (=> (not res!528841) (not e!434762))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8017 0))(
  ( (MissingZero!8017 (index!34436 (_ BitVec 32))) (Found!8017 (index!34437 (_ BitVec 32))) (Intermediate!8017 (undefined!8829 Bool) (index!34438 (_ BitVec 32)) (x!65388 (_ BitVec 32))) (Undefined!8017) (MissingVacant!8017 (index!34439 (_ BitVec 32))) )
))
(declare-fun lt!348359 () SeekEntryResult!8017)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42655 (_ BitVec 32)) SeekEntryResult!8017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781700 (= res!528841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20417 a!3186) j!159) mask!3328) (select (arr!20417 a!3186) j!159) a!3186 mask!3328) lt!348359))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781700 (= lt!348359 (Intermediate!8017 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!528853 () Bool)

(assert (=> start!67552 (=> (not res!528853) (not e!434756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67552 (= res!528853 (validMask!0 mask!3328))))

(assert (=> start!67552 e!434756))

(assert (=> start!67552 true))

(declare-fun array_inv!16213 (array!42655) Bool)

(assert (=> start!67552 (array_inv!16213 a!3186)))

(declare-fun b!781701 () Bool)

(declare-fun res!528846 () Bool)

(assert (=> b!781701 (=> (not res!528846) (not e!434762))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781701 (= res!528846 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20417 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781702 () Bool)

(declare-fun res!528847 () Bool)

(assert (=> b!781702 (=> (not res!528847) (not e!434759))))

(declare-datatypes ((List!14419 0))(
  ( (Nil!14416) (Cons!14415 (h!15535 (_ BitVec 64)) (t!20734 List!14419)) )
))
(declare-fun arrayNoDuplicates!0 (array!42655 (_ BitVec 32) List!14419) Bool)

(assert (=> b!781702 (= res!528847 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14416))))

(declare-fun e!434761 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!781703 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42655 (_ BitVec 32)) SeekEntryResult!8017)

(assert (=> b!781703 (= e!434761 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20417 a!3186) j!159) a!3186 mask!3328) (Found!8017 j!159)))))

(declare-fun b!781704 () Bool)

(declare-fun res!528843 () Bool)

(assert (=> b!781704 (=> (not res!528843) (not e!434756))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781704 (= res!528843 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781705 () Bool)

(declare-fun e!434758 () Bool)

(assert (=> b!781705 (= e!434762 e!434758)))

(declare-fun res!528845 () Bool)

(assert (=> b!781705 (=> (not res!528845) (not e!434758))))

(declare-fun lt!348352 () SeekEntryResult!8017)

(declare-fun lt!348350 () SeekEntryResult!8017)

(assert (=> b!781705 (= res!528845 (= lt!348352 lt!348350))))

(declare-fun lt!348354 () (_ BitVec 64))

(declare-fun lt!348356 () array!42655)

(assert (=> b!781705 (= lt!348350 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348354 lt!348356 mask!3328))))

(assert (=> b!781705 (= lt!348352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348354 mask!3328) lt!348354 lt!348356 mask!3328))))

(assert (=> b!781705 (= lt!348354 (select (store (arr!20417 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!781705 (= lt!348356 (array!42656 (store (arr!20417 a!3186) i!1173 k!2102) (size!20838 a!3186)))))

(declare-fun b!781706 () Bool)

(declare-fun res!528844 () Bool)

(declare-fun e!434757 () Bool)

(assert (=> b!781706 (=> res!528844 e!434757)))

(declare-fun lt!348353 () SeekEntryResult!8017)

(assert (=> b!781706 (= res!528844 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20417 a!3186) j!159) a!3186 mask!3328) lt!348353)))))

(declare-fun b!781707 () Bool)

(declare-datatypes ((Unit!26956 0))(
  ( (Unit!26957) )
))
(declare-fun e!434760 () Unit!26956)

(declare-fun Unit!26958 () Unit!26956)

(assert (=> b!781707 (= e!434760 Unit!26958)))

(assert (=> b!781707 false))

(declare-fun e!434755 () Bool)

(declare-fun b!781708 () Bool)

(assert (=> b!781708 (= e!434755 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20417 a!3186) j!159) a!3186 mask!3328) lt!348353))))

(declare-fun b!781709 () Bool)

(declare-fun res!528851 () Bool)

(assert (=> b!781709 (=> (not res!528851) (not e!434756))))

(assert (=> b!781709 (= res!528851 (and (= (size!20838 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20838 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20838 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781710 () Bool)

(declare-fun res!528842 () Bool)

(assert (=> b!781710 (=> (not res!528842) (not e!434759))))

(assert (=> b!781710 (= res!528842 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20838 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20838 a!3186))))))

(declare-fun b!781711 () Bool)

(declare-fun Unit!26959 () Unit!26956)

(assert (=> b!781711 (= e!434760 Unit!26959)))

(declare-fun b!781712 () Bool)

(assert (=> b!781712 (= e!434761 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20417 a!3186) j!159) a!3186 mask!3328) lt!348359))))

(declare-fun b!781713 () Bool)

(assert (=> b!781713 (= e!434758 (not e!434757))))

(declare-fun res!528848 () Bool)

(assert (=> b!781713 (=> res!528848 e!434757)))

(assert (=> b!781713 (= res!528848 (or (not (is-Intermediate!8017 lt!348350)) (bvslt x!1131 (x!65388 lt!348350)) (not (= x!1131 (x!65388 lt!348350))) (not (= index!1321 (index!34438 lt!348350)))))))

(assert (=> b!781713 e!434755))

(declare-fun res!528855 () Bool)

(assert (=> b!781713 (=> (not res!528855) (not e!434755))))

(declare-fun lt!348351 () SeekEntryResult!8017)

(assert (=> b!781713 (= res!528855 (= lt!348351 lt!348353))))

(assert (=> b!781713 (= lt!348353 (Found!8017 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42655 (_ BitVec 32)) SeekEntryResult!8017)

(assert (=> b!781713 (= lt!348351 (seekEntryOrOpen!0 (select (arr!20417 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42655 (_ BitVec 32)) Bool)

(assert (=> b!781713 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348355 () Unit!26956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26956)

(assert (=> b!781713 (= lt!348355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781714 () Bool)

(assert (=> b!781714 (= e!434757 true)))

(assert (=> b!781714 (= (select (store (arr!20417 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348358 () Unit!26956)

(assert (=> b!781714 (= lt!348358 e!434760)))

(declare-fun c!86836 () Bool)

(assert (=> b!781714 (= c!86836 (= (select (store (arr!20417 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781715 () Bool)

(assert (=> b!781715 (= e!434756 e!434759)))

(declare-fun res!528856 () Bool)

(assert (=> b!781715 (=> (not res!528856) (not e!434759))))

(declare-fun lt!348357 () SeekEntryResult!8017)

(assert (=> b!781715 (= res!528856 (or (= lt!348357 (MissingZero!8017 i!1173)) (= lt!348357 (MissingVacant!8017 i!1173))))))

(assert (=> b!781715 (= lt!348357 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!781716 () Bool)

(declare-fun res!528849 () Bool)

(assert (=> b!781716 (=> res!528849 e!434757)))

(assert (=> b!781716 (= res!528849 (= (select (store (arr!20417 a!3186) i!1173 k!2102) index!1321) lt!348354))))

(declare-fun b!781717 () Bool)

(declare-fun res!528854 () Bool)

(assert (=> b!781717 (=> (not res!528854) (not e!434756))))

(assert (=> b!781717 (= res!528854 (validKeyInArray!0 k!2102))))

(declare-fun b!781718 () Bool)

(declare-fun res!528852 () Bool)

(assert (=> b!781718 (=> (not res!528852) (not e!434762))))

(assert (=> b!781718 (= res!528852 e!434761)))

(declare-fun c!86835 () Bool)

(assert (=> b!781718 (= c!86835 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781719 () Bool)

(declare-fun res!528850 () Bool)

(assert (=> b!781719 (=> (not res!528850) (not e!434759))))

(assert (=> b!781719 (= res!528850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67552 res!528853) b!781709))

(assert (= (and b!781709 res!528851) b!781699))

(assert (= (and b!781699 res!528857) b!781717))

(assert (= (and b!781717 res!528854) b!781704))

(assert (= (and b!781704 res!528843) b!781715))

(assert (= (and b!781715 res!528856) b!781719))

(assert (= (and b!781719 res!528850) b!781702))

(assert (= (and b!781702 res!528847) b!781710))

(assert (= (and b!781710 res!528842) b!781700))

(assert (= (and b!781700 res!528841) b!781701))

(assert (= (and b!781701 res!528846) b!781718))

(assert (= (and b!781718 c!86835) b!781712))

(assert (= (and b!781718 (not c!86835)) b!781703))

(assert (= (and b!781718 res!528852) b!781705))

(assert (= (and b!781705 res!528845) b!781713))

(assert (= (and b!781713 res!528855) b!781708))

(assert (= (and b!781713 (not res!528848)) b!781706))

(assert (= (and b!781706 (not res!528844)) b!781716))

(assert (= (and b!781716 (not res!528849)) b!781714))

(assert (= (and b!781714 c!86836) b!781707))

(assert (= (and b!781714 (not c!86836)) b!781711))

(declare-fun m!724667 () Bool)

(assert (=> b!781719 m!724667))

(declare-fun m!724669 () Bool)

(assert (=> b!781713 m!724669))

(assert (=> b!781713 m!724669))

(declare-fun m!724671 () Bool)

(assert (=> b!781713 m!724671))

(declare-fun m!724673 () Bool)

(assert (=> b!781713 m!724673))

(declare-fun m!724675 () Bool)

(assert (=> b!781713 m!724675))

(assert (=> b!781708 m!724669))

(assert (=> b!781708 m!724669))

(declare-fun m!724677 () Bool)

(assert (=> b!781708 m!724677))

(declare-fun m!724679 () Bool)

(assert (=> b!781714 m!724679))

(declare-fun m!724681 () Bool)

(assert (=> b!781714 m!724681))

(declare-fun m!724683 () Bool)

(assert (=> b!781715 m!724683))

(declare-fun m!724685 () Bool)

(assert (=> b!781705 m!724685))

(declare-fun m!724687 () Bool)

(assert (=> b!781705 m!724687))

(assert (=> b!781705 m!724679))

(declare-fun m!724689 () Bool)

(assert (=> b!781705 m!724689))

(assert (=> b!781705 m!724687))

(declare-fun m!724691 () Bool)

(assert (=> b!781705 m!724691))

(declare-fun m!724693 () Bool)

(assert (=> b!781717 m!724693))

(declare-fun m!724695 () Bool)

(assert (=> b!781702 m!724695))

(declare-fun m!724697 () Bool)

(assert (=> b!781701 m!724697))

(assert (=> b!781699 m!724669))

(assert (=> b!781699 m!724669))

(declare-fun m!724699 () Bool)

(assert (=> b!781699 m!724699))

(assert (=> b!781700 m!724669))

(assert (=> b!781700 m!724669))

(declare-fun m!724701 () Bool)

(assert (=> b!781700 m!724701))

(assert (=> b!781700 m!724701))

(assert (=> b!781700 m!724669))

(declare-fun m!724703 () Bool)

(assert (=> b!781700 m!724703))

(assert (=> b!781716 m!724679))

(assert (=> b!781716 m!724681))

(declare-fun m!724705 () Bool)

(assert (=> start!67552 m!724705))

(declare-fun m!724707 () Bool)

(assert (=> start!67552 m!724707))

(assert (=> b!781703 m!724669))

(assert (=> b!781703 m!724669))

(declare-fun m!724709 () Bool)

(assert (=> b!781703 m!724709))

(assert (=> b!781706 m!724669))

(assert (=> b!781706 m!724669))

(assert (=> b!781706 m!724709))

(declare-fun m!724711 () Bool)

(assert (=> b!781704 m!724711))

(assert (=> b!781712 m!724669))

(assert (=> b!781712 m!724669))

(declare-fun m!724713 () Bool)

(assert (=> b!781712 m!724713))

(push 1)

