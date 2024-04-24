; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65928 () Bool)

(assert start!65928)

(declare-fun b!757758 () Bool)

(declare-fun res!512224 () Bool)

(declare-fun e!422573 () Bool)

(assert (=> b!757758 (=> (not res!512224) (not e!422573))))

(declare-datatypes ((array!41971 0))(
  ( (array!41972 (arr!20095 (Array (_ BitVec 32) (_ BitVec 64))) (size!20515 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41971)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!757758 (= res!512224 (and (= (size!20515 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20515 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20515 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757759 () Bool)

(declare-fun e!422583 () Bool)

(declare-fun e!422574 () Bool)

(assert (=> b!757759 (= e!422583 e!422574)))

(declare-fun res!512225 () Bool)

(assert (=> b!757759 (=> res!512225 e!422574)))

(declare-fun lt!337401 () (_ BitVec 64))

(declare-fun lt!337409 () (_ BitVec 64))

(assert (=> b!757759 (= res!512225 (= lt!337401 lt!337409))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!757759 (= lt!337401 (select (store (arr!20095 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757760 () Bool)

(declare-fun res!512237 () Bool)

(declare-fun e!422580 () Bool)

(assert (=> b!757760 (=> (not res!512237) (not e!422580))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757760 (= res!512237 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20515 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20515 a!3186))))))

(declare-fun e!422575 () Bool)

(declare-fun b!757761 () Bool)

(declare-datatypes ((SeekEntryResult!7651 0))(
  ( (MissingZero!7651 (index!32972 (_ BitVec 32))) (Found!7651 (index!32973 (_ BitVec 32))) (Intermediate!7651 (undefined!8463 Bool) (index!32974 (_ BitVec 32)) (x!64029 (_ BitVec 32))) (Undefined!7651) (MissingVacant!7651 (index!32975 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41971 (_ BitVec 32)) SeekEntryResult!7651)

(assert (=> b!757761 (= e!422575 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20095 a!3186) j!159) a!3186 mask!3328) (Found!7651 j!159)))))

(declare-fun b!757762 () Bool)

(declare-fun res!512223 () Bool)

(assert (=> b!757762 (=> (not res!512223) (not e!422573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757762 (= res!512223 (validKeyInArray!0 k0!2102))))

(declare-fun b!757763 () Bool)

(assert (=> b!757763 (= e!422573 e!422580)))

(declare-fun res!512235 () Bool)

(assert (=> b!757763 (=> (not res!512235) (not e!422580))))

(declare-fun lt!337405 () SeekEntryResult!7651)

(assert (=> b!757763 (= res!512235 (or (= lt!337405 (MissingZero!7651 i!1173)) (= lt!337405 (MissingVacant!7651 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41971 (_ BitVec 32)) SeekEntryResult!7651)

(assert (=> b!757763 (= lt!337405 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757764 () Bool)

(declare-fun res!512221 () Bool)

(assert (=> b!757764 (=> (not res!512221) (not e!422573))))

(declare-fun arrayContainsKey!0 (array!41971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757764 (= res!512221 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757765 () Bool)

(declare-fun e!422577 () Bool)

(declare-fun e!422578 () Bool)

(assert (=> b!757765 (= e!422577 e!422578)))

(declare-fun res!512232 () Bool)

(assert (=> b!757765 (=> (not res!512232) (not e!422578))))

(declare-fun lt!337402 () SeekEntryResult!7651)

(declare-fun lt!337408 () SeekEntryResult!7651)

(assert (=> b!757765 (= res!512232 (= lt!337402 lt!337408))))

(declare-fun lt!337399 () array!41971)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41971 (_ BitVec 32)) SeekEntryResult!7651)

(assert (=> b!757765 (= lt!337408 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337409 lt!337399 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757765 (= lt!337402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337409 mask!3328) lt!337409 lt!337399 mask!3328))))

(assert (=> b!757765 (= lt!337409 (select (store (arr!20095 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757765 (= lt!337399 (array!41972 (store (arr!20095 a!3186) i!1173 k0!2102) (size!20515 a!3186)))))

(declare-fun res!512227 () Bool)

(assert (=> start!65928 (=> (not res!512227) (not e!422573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65928 (= res!512227 (validMask!0 mask!3328))))

(assert (=> start!65928 e!422573))

(assert (=> start!65928 true))

(declare-fun array_inv!15954 (array!41971) Bool)

(assert (=> start!65928 (array_inv!15954 a!3186)))

(declare-fun b!757766 () Bool)

(declare-fun e!422581 () Bool)

(declare-fun lt!337400 () SeekEntryResult!7651)

(declare-fun lt!337403 () SeekEntryResult!7651)

(assert (=> b!757766 (= e!422581 (= lt!337400 lt!337403))))

(declare-fun b!757767 () Bool)

(declare-fun res!512239 () Bool)

(assert (=> b!757767 (=> (not res!512239) (not e!422573))))

(assert (=> b!757767 (= res!512239 (validKeyInArray!0 (select (arr!20095 a!3186) j!159)))))

(declare-fun b!757768 () Bool)

(declare-fun e!422582 () Bool)

(assert (=> b!757768 (= e!422578 (not e!422582))))

(declare-fun res!512230 () Bool)

(assert (=> b!757768 (=> res!512230 e!422582)))

(get-info :version)

(assert (=> b!757768 (= res!512230 (or (not ((_ is Intermediate!7651) lt!337408)) (bvslt x!1131 (x!64029 lt!337408)) (not (= x!1131 (x!64029 lt!337408))) (not (= index!1321 (index!32974 lt!337408)))))))

(declare-fun e!422579 () Bool)

(assert (=> b!757768 e!422579))

(declare-fun res!512234 () Bool)

(assert (=> b!757768 (=> (not res!512234) (not e!422579))))

(declare-fun lt!337410 () SeekEntryResult!7651)

(assert (=> b!757768 (= res!512234 (= lt!337400 lt!337410))))

(assert (=> b!757768 (= lt!337410 (Found!7651 j!159))))

(assert (=> b!757768 (= lt!337400 (seekEntryOrOpen!0 (select (arr!20095 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41971 (_ BitVec 32)) Bool)

(assert (=> b!757768 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26161 0))(
  ( (Unit!26162) )
))
(declare-fun lt!337407 () Unit!26161)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26161)

(assert (=> b!757768 (= lt!337407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757769 () Bool)

(declare-fun res!512231 () Bool)

(assert (=> b!757769 (=> (not res!512231) (not e!422577))))

(assert (=> b!757769 (= res!512231 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20095 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757770 () Bool)

(declare-fun res!512228 () Bool)

(assert (=> b!757770 (=> (not res!512228) (not e!422580))))

(assert (=> b!757770 (= res!512228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!337406 () SeekEntryResult!7651)

(declare-fun b!757771 () Bool)

(assert (=> b!757771 (= e!422575 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20095 a!3186) j!159) a!3186 mask!3328) lt!337406))))

(declare-fun b!757772 () Bool)

(assert (=> b!757772 (= e!422574 true)))

(assert (=> b!757772 e!422581))

(declare-fun res!512229 () Bool)

(assert (=> b!757772 (=> (not res!512229) (not e!422581))))

(assert (=> b!757772 (= res!512229 (= lt!337401 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337404 () Unit!26161)

(declare-fun e!422572 () Unit!26161)

(assert (=> b!757772 (= lt!337404 e!422572)))

(declare-fun c!83152 () Bool)

(assert (=> b!757772 (= c!83152 (= lt!337401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757773 () Bool)

(declare-fun res!512233 () Bool)

(assert (=> b!757773 (=> (not res!512233) (not e!422577))))

(assert (=> b!757773 (= res!512233 e!422575)))

(declare-fun c!83153 () Bool)

(assert (=> b!757773 (= c!83153 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757774 () Bool)

(declare-fun Unit!26163 () Unit!26161)

(assert (=> b!757774 (= e!422572 Unit!26163)))

(assert (=> b!757774 false))

(declare-fun b!757775 () Bool)

(declare-fun res!512226 () Bool)

(assert (=> b!757775 (=> (not res!512226) (not e!422580))))

(declare-datatypes ((List!14004 0))(
  ( (Nil!14001) (Cons!14000 (h!15078 (_ BitVec 64)) (t!20311 List!14004)) )
))
(declare-fun arrayNoDuplicates!0 (array!41971 (_ BitVec 32) List!14004) Bool)

(assert (=> b!757775 (= res!512226 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14001))))

(declare-fun b!757776 () Bool)

(assert (=> b!757776 (= e!422579 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20095 a!3186) j!159) a!3186 mask!3328) lt!337410))))

(declare-fun b!757777 () Bool)

(assert (=> b!757777 (= e!422582 e!422583)))

(declare-fun res!512236 () Bool)

(assert (=> b!757777 (=> res!512236 e!422583)))

(assert (=> b!757777 (= res!512236 (not (= lt!337403 lt!337410)))))

(assert (=> b!757777 (= lt!337403 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20095 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757778 () Bool)

(assert (=> b!757778 (= e!422580 e!422577)))

(declare-fun res!512222 () Bool)

(assert (=> b!757778 (=> (not res!512222) (not e!422577))))

(assert (=> b!757778 (= res!512222 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20095 a!3186) j!159) mask!3328) (select (arr!20095 a!3186) j!159) a!3186 mask!3328) lt!337406))))

(assert (=> b!757778 (= lt!337406 (Intermediate!7651 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757779 () Bool)

(declare-fun res!512238 () Bool)

(assert (=> b!757779 (=> (not res!512238) (not e!422581))))

(assert (=> b!757779 (= res!512238 (= (seekEntryOrOpen!0 lt!337409 lt!337399 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337409 lt!337399 mask!3328)))))

(declare-fun b!757780 () Bool)

(declare-fun Unit!26164 () Unit!26161)

(assert (=> b!757780 (= e!422572 Unit!26164)))

(assert (= (and start!65928 res!512227) b!757758))

(assert (= (and b!757758 res!512224) b!757767))

(assert (= (and b!757767 res!512239) b!757762))

(assert (= (and b!757762 res!512223) b!757764))

(assert (= (and b!757764 res!512221) b!757763))

(assert (= (and b!757763 res!512235) b!757770))

(assert (= (and b!757770 res!512228) b!757775))

(assert (= (and b!757775 res!512226) b!757760))

(assert (= (and b!757760 res!512237) b!757778))

(assert (= (and b!757778 res!512222) b!757769))

(assert (= (and b!757769 res!512231) b!757773))

(assert (= (and b!757773 c!83153) b!757771))

(assert (= (and b!757773 (not c!83153)) b!757761))

(assert (= (and b!757773 res!512233) b!757765))

(assert (= (and b!757765 res!512232) b!757768))

(assert (= (and b!757768 res!512234) b!757776))

(assert (= (and b!757768 (not res!512230)) b!757777))

(assert (= (and b!757777 (not res!512236)) b!757759))

(assert (= (and b!757759 (not res!512225)) b!757772))

(assert (= (and b!757772 c!83152) b!757774))

(assert (= (and b!757772 (not c!83152)) b!757780))

(assert (= (and b!757772 res!512229) b!757779))

(assert (= (and b!757779 res!512238) b!757766))

(declare-fun m!705987 () Bool)

(assert (=> start!65928 m!705987))

(declare-fun m!705989 () Bool)

(assert (=> start!65928 m!705989))

(declare-fun m!705991 () Bool)

(assert (=> b!757764 m!705991))

(declare-fun m!705993 () Bool)

(assert (=> b!757775 m!705993))

(declare-fun m!705995 () Bool)

(assert (=> b!757768 m!705995))

(assert (=> b!757768 m!705995))

(declare-fun m!705997 () Bool)

(assert (=> b!757768 m!705997))

(declare-fun m!705999 () Bool)

(assert (=> b!757768 m!705999))

(declare-fun m!706001 () Bool)

(assert (=> b!757768 m!706001))

(assert (=> b!757761 m!705995))

(assert (=> b!757761 m!705995))

(declare-fun m!706003 () Bool)

(assert (=> b!757761 m!706003))

(declare-fun m!706005 () Bool)

(assert (=> b!757762 m!706005))

(assert (=> b!757776 m!705995))

(assert (=> b!757776 m!705995))

(declare-fun m!706007 () Bool)

(assert (=> b!757776 m!706007))

(declare-fun m!706009 () Bool)

(assert (=> b!757765 m!706009))

(declare-fun m!706011 () Bool)

(assert (=> b!757765 m!706011))

(declare-fun m!706013 () Bool)

(assert (=> b!757765 m!706013))

(declare-fun m!706015 () Bool)

(assert (=> b!757765 m!706015))

(assert (=> b!757765 m!706013))

(declare-fun m!706017 () Bool)

(assert (=> b!757765 m!706017))

(declare-fun m!706019 () Bool)

(assert (=> b!757763 m!706019))

(assert (=> b!757777 m!705995))

(assert (=> b!757777 m!705995))

(assert (=> b!757777 m!706003))

(assert (=> b!757778 m!705995))

(assert (=> b!757778 m!705995))

(declare-fun m!706021 () Bool)

(assert (=> b!757778 m!706021))

(assert (=> b!757778 m!706021))

(assert (=> b!757778 m!705995))

(declare-fun m!706023 () Bool)

(assert (=> b!757778 m!706023))

(assert (=> b!757767 m!705995))

(assert (=> b!757767 m!705995))

(declare-fun m!706025 () Bool)

(assert (=> b!757767 m!706025))

(declare-fun m!706027 () Bool)

(assert (=> b!757779 m!706027))

(declare-fun m!706029 () Bool)

(assert (=> b!757779 m!706029))

(declare-fun m!706031 () Bool)

(assert (=> b!757770 m!706031))

(declare-fun m!706033 () Bool)

(assert (=> b!757769 m!706033))

(assert (=> b!757759 m!706011))

(declare-fun m!706035 () Bool)

(assert (=> b!757759 m!706035))

(assert (=> b!757771 m!705995))

(assert (=> b!757771 m!705995))

(declare-fun m!706037 () Bool)

(assert (=> b!757771 m!706037))

(check-sat (not b!757763) (not b!757768) (not b!757776) (not b!757770) (not b!757765) (not start!65928) (not b!757778) (not b!757767) (not b!757762) (not b!757779) (not b!757764) (not b!757777) (not b!757771) (not b!757775) (not b!757761))
(check-sat)
