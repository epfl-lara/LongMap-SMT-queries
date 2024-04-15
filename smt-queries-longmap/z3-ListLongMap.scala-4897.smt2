; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67538 () Bool)

(assert start!67538)

(declare-fun b!781701 () Bool)

(declare-fun e!434714 () Bool)

(declare-fun e!434715 () Bool)

(assert (=> b!781701 (= e!434714 e!434715)))

(declare-fun res!528943 () Bool)

(assert (=> b!781701 (=> (not res!528943) (not e!434715))))

(declare-datatypes ((SeekEntryResult!8017 0))(
  ( (MissingZero!8017 (index!34436 (_ BitVec 32))) (Found!8017 (index!34437 (_ BitVec 32))) (Intermediate!8017 (undefined!8829 Bool) (index!34438 (_ BitVec 32)) (x!65399 (_ BitVec 32))) (Undefined!8017) (MissingVacant!8017 (index!34439 (_ BitVec 32))) )
))
(declare-fun lt!348239 () SeekEntryResult!8017)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781701 (= res!528943 (or (= lt!348239 (MissingZero!8017 i!1173)) (= lt!348239 (MissingVacant!8017 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42660 0))(
  ( (array!42661 (arr!20420 (Array (_ BitVec 32) (_ BitVec 64))) (size!20841 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42660)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42660 (_ BitVec 32)) SeekEntryResult!8017)

(assert (=> b!781701 (= lt!348239 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781702 () Bool)

(declare-fun res!528946 () Bool)

(assert (=> b!781702 (=> (not res!528946) (not e!434715))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781702 (= res!528946 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20841 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20841 a!3186))))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!348235 () SeekEntryResult!8017)

(declare-fun b!781703 () Bool)

(declare-fun e!434716 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42660 (_ BitVec 32)) SeekEntryResult!8017)

(assert (=> b!781703 (= e!434716 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20420 a!3186) j!159) a!3186 mask!3328) lt!348235))))

(declare-fun b!781704 () Bool)

(declare-fun e!434713 () Bool)

(assert (=> b!781704 (= e!434713 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20420 a!3186) j!159) a!3186 mask!3328) (Found!8017 j!159)))))

(declare-fun b!781705 () Bool)

(declare-fun e!434709 () Bool)

(declare-fun e!434712 () Bool)

(assert (=> b!781705 (= e!434709 (not e!434712))))

(declare-fun res!528939 () Bool)

(assert (=> b!781705 (=> res!528939 e!434712)))

(declare-fun lt!348238 () SeekEntryResult!8017)

(get-info :version)

(assert (=> b!781705 (= res!528939 (or (not ((_ is Intermediate!8017) lt!348238)) (bvslt x!1131 (x!65399 lt!348238)) (not (= x!1131 (x!65399 lt!348238))) (not (= index!1321 (index!34438 lt!348238)))))))

(assert (=> b!781705 e!434716))

(declare-fun res!528945 () Bool)

(assert (=> b!781705 (=> (not res!528945) (not e!434716))))

(declare-fun lt!348233 () SeekEntryResult!8017)

(assert (=> b!781705 (= res!528945 (= lt!348233 lt!348235))))

(assert (=> b!781705 (= lt!348235 (Found!8017 j!159))))

(assert (=> b!781705 (= lt!348233 (seekEntryOrOpen!0 (select (arr!20420 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42660 (_ BitVec 32)) Bool)

(assert (=> b!781705 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26936 0))(
  ( (Unit!26937) )
))
(declare-fun lt!348236 () Unit!26936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26936)

(assert (=> b!781705 (= lt!348236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781706 () Bool)

(declare-fun e!434708 () Unit!26936)

(declare-fun Unit!26938 () Unit!26936)

(assert (=> b!781706 (= e!434708 Unit!26938)))

(assert (=> b!781706 false))

(declare-fun b!781707 () Bool)

(declare-fun res!528935 () Bool)

(declare-fun e!434710 () Bool)

(assert (=> b!781707 (=> (not res!528935) (not e!434710))))

(assert (=> b!781707 (= res!528935 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20420 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781708 () Bool)

(declare-fun res!528937 () Bool)

(assert (=> b!781708 (=> (not res!528937) (not e!434715))))

(declare-datatypes ((List!14461 0))(
  ( (Nil!14458) (Cons!14457 (h!15577 (_ BitVec 64)) (t!20767 List!14461)) )
))
(declare-fun arrayNoDuplicates!0 (array!42660 (_ BitVec 32) List!14461) Bool)

(assert (=> b!781708 (= res!528937 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14458))))

(declare-fun b!781710 () Bool)

(declare-fun lt!348237 () SeekEntryResult!8017)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42660 (_ BitVec 32)) SeekEntryResult!8017)

(assert (=> b!781710 (= e!434713 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20420 a!3186) j!159) a!3186 mask!3328) lt!348237))))

(declare-fun b!781711 () Bool)

(declare-fun Unit!26939 () Unit!26936)

(assert (=> b!781711 (= e!434708 Unit!26939)))

(declare-fun b!781712 () Bool)

(declare-fun res!528948 () Bool)

(assert (=> b!781712 (=> (not res!528948) (not e!434710))))

(assert (=> b!781712 (= res!528948 e!434713)))

(declare-fun c!86790 () Bool)

(assert (=> b!781712 (= c!86790 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781713 () Bool)

(declare-fun res!528944 () Bool)

(assert (=> b!781713 (=> (not res!528944) (not e!434714))))

(declare-fun arrayContainsKey!0 (array!42660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781713 (= res!528944 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781714 () Bool)

(assert (=> b!781714 (= e!434712 true)))

(assert (=> b!781714 (= (select (store (arr!20420 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348231 () Unit!26936)

(assert (=> b!781714 (= lt!348231 e!434708)))

(declare-fun c!86789 () Bool)

(assert (=> b!781714 (= c!86789 (= (select (store (arr!20420 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781715 () Bool)

(declare-fun res!528941 () Bool)

(assert (=> b!781715 (=> res!528941 e!434712)))

(assert (=> b!781715 (= res!528941 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20420 a!3186) j!159) a!3186 mask!3328) lt!348235)))))

(declare-fun b!781716 () Bool)

(declare-fun res!528950 () Bool)

(assert (=> b!781716 (=> res!528950 e!434712)))

(declare-fun lt!348234 () (_ BitVec 64))

(assert (=> b!781716 (= res!528950 (= (select (store (arr!20420 a!3186) i!1173 k0!2102) index!1321) lt!348234))))

(declare-fun b!781717 () Bool)

(assert (=> b!781717 (= e!434710 e!434709)))

(declare-fun res!528936 () Bool)

(assert (=> b!781717 (=> (not res!528936) (not e!434709))))

(declare-fun lt!348232 () SeekEntryResult!8017)

(assert (=> b!781717 (= res!528936 (= lt!348232 lt!348238))))

(declare-fun lt!348230 () array!42660)

(assert (=> b!781717 (= lt!348238 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348234 lt!348230 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781717 (= lt!348232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348234 mask!3328) lt!348234 lt!348230 mask!3328))))

(assert (=> b!781717 (= lt!348234 (select (store (arr!20420 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781717 (= lt!348230 (array!42661 (store (arr!20420 a!3186) i!1173 k0!2102) (size!20841 a!3186)))))

(declare-fun b!781718 () Bool)

(declare-fun res!528951 () Bool)

(assert (=> b!781718 (=> (not res!528951) (not e!434714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781718 (= res!528951 (validKeyInArray!0 (select (arr!20420 a!3186) j!159)))))

(declare-fun b!781719 () Bool)

(declare-fun res!528938 () Bool)

(assert (=> b!781719 (=> (not res!528938) (not e!434715))))

(assert (=> b!781719 (= res!528938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781720 () Bool)

(assert (=> b!781720 (= e!434715 e!434710)))

(declare-fun res!528949 () Bool)

(assert (=> b!781720 (=> (not res!528949) (not e!434710))))

(assert (=> b!781720 (= res!528949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20420 a!3186) j!159) mask!3328) (select (arr!20420 a!3186) j!159) a!3186 mask!3328) lt!348237))))

(assert (=> b!781720 (= lt!348237 (Intermediate!8017 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781721 () Bool)

(declare-fun res!528947 () Bool)

(assert (=> b!781721 (=> (not res!528947) (not e!434714))))

(assert (=> b!781721 (= res!528947 (and (= (size!20841 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20841 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20841 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!528940 () Bool)

(assert (=> start!67538 (=> (not res!528940) (not e!434714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67538 (= res!528940 (validMask!0 mask!3328))))

(assert (=> start!67538 e!434714))

(assert (=> start!67538 true))

(declare-fun array_inv!16303 (array!42660) Bool)

(assert (=> start!67538 (array_inv!16303 a!3186)))

(declare-fun b!781709 () Bool)

(declare-fun res!528942 () Bool)

(assert (=> b!781709 (=> (not res!528942) (not e!434714))))

(assert (=> b!781709 (= res!528942 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67538 res!528940) b!781721))

(assert (= (and b!781721 res!528947) b!781718))

(assert (= (and b!781718 res!528951) b!781709))

(assert (= (and b!781709 res!528942) b!781713))

(assert (= (and b!781713 res!528944) b!781701))

(assert (= (and b!781701 res!528943) b!781719))

(assert (= (and b!781719 res!528938) b!781708))

(assert (= (and b!781708 res!528937) b!781702))

(assert (= (and b!781702 res!528946) b!781720))

(assert (= (and b!781720 res!528949) b!781707))

(assert (= (and b!781707 res!528935) b!781712))

(assert (= (and b!781712 c!86790) b!781710))

(assert (= (and b!781712 (not c!86790)) b!781704))

(assert (= (and b!781712 res!528948) b!781717))

(assert (= (and b!781717 res!528936) b!781705))

(assert (= (and b!781705 res!528945) b!781703))

(assert (= (and b!781705 (not res!528939)) b!781715))

(assert (= (and b!781715 (not res!528941)) b!781716))

(assert (= (and b!781716 (not res!528950)) b!781714))

(assert (= (and b!781714 c!86789) b!781706))

(assert (= (and b!781714 (not c!86789)) b!781711))

(declare-fun m!724101 () Bool)

(assert (=> b!781709 m!724101))

(declare-fun m!724103 () Bool)

(assert (=> b!781703 m!724103))

(assert (=> b!781703 m!724103))

(declare-fun m!724105 () Bool)

(assert (=> b!781703 m!724105))

(assert (=> b!781720 m!724103))

(assert (=> b!781720 m!724103))

(declare-fun m!724107 () Bool)

(assert (=> b!781720 m!724107))

(assert (=> b!781720 m!724107))

(assert (=> b!781720 m!724103))

(declare-fun m!724109 () Bool)

(assert (=> b!781720 m!724109))

(declare-fun m!724111 () Bool)

(assert (=> b!781707 m!724111))

(declare-fun m!724113 () Bool)

(assert (=> b!781713 m!724113))

(declare-fun m!724115 () Bool)

(assert (=> start!67538 m!724115))

(declare-fun m!724117 () Bool)

(assert (=> start!67538 m!724117))

(assert (=> b!781718 m!724103))

(assert (=> b!781718 m!724103))

(declare-fun m!724119 () Bool)

(assert (=> b!781718 m!724119))

(declare-fun m!724121 () Bool)

(assert (=> b!781719 m!724121))

(declare-fun m!724123 () Bool)

(assert (=> b!781701 m!724123))

(assert (=> b!781705 m!724103))

(assert (=> b!781705 m!724103))

(declare-fun m!724125 () Bool)

(assert (=> b!781705 m!724125))

(declare-fun m!724127 () Bool)

(assert (=> b!781705 m!724127))

(declare-fun m!724129 () Bool)

(assert (=> b!781705 m!724129))

(declare-fun m!724131 () Bool)

(assert (=> b!781716 m!724131))

(declare-fun m!724133 () Bool)

(assert (=> b!781716 m!724133))

(assert (=> b!781715 m!724103))

(assert (=> b!781715 m!724103))

(declare-fun m!724135 () Bool)

(assert (=> b!781715 m!724135))

(assert (=> b!781714 m!724131))

(assert (=> b!781714 m!724133))

(assert (=> b!781710 m!724103))

(assert (=> b!781710 m!724103))

(declare-fun m!724137 () Bool)

(assert (=> b!781710 m!724137))

(declare-fun m!724139 () Bool)

(assert (=> b!781717 m!724139))

(assert (=> b!781717 m!724131))

(declare-fun m!724141 () Bool)

(assert (=> b!781717 m!724141))

(assert (=> b!781717 m!724139))

(declare-fun m!724143 () Bool)

(assert (=> b!781717 m!724143))

(declare-fun m!724145 () Bool)

(assert (=> b!781717 m!724145))

(assert (=> b!781704 m!724103))

(assert (=> b!781704 m!724103))

(assert (=> b!781704 m!724135))

(declare-fun m!724147 () Bool)

(assert (=> b!781708 m!724147))

(check-sat (not b!781705) (not b!781717) (not b!781704) (not b!781715) (not b!781719) (not b!781713) (not b!781720) (not b!781701) (not b!781710) (not start!67538) (not b!781708) (not b!781718) (not b!781703) (not b!781709))
(check-sat)
