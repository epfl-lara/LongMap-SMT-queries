; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47792 () Bool)

(assert start!47792)

(declare-fun b!526432 () Bool)

(declare-fun res!323056 () Bool)

(declare-fun e!306856 () Bool)

(assert (=> b!526432 (=> (not res!323056) (not e!306856))))

(declare-datatypes ((array!33429 0))(
  ( (array!33430 (arr!16066 (Array (_ BitVec 32) (_ BitVec 64))) (size!16430 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33429)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33429 (_ BitVec 32)) Bool)

(assert (=> b!526432 (= res!323056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526433 () Bool)

(declare-datatypes ((Unit!16584 0))(
  ( (Unit!16585) )
))
(declare-fun e!306855 () Unit!16584)

(declare-fun Unit!16586 () Unit!16584)

(assert (=> b!526433 (= e!306855 Unit!16586)))

(declare-fun lt!242106 () Unit!16584)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!242104 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4533 0))(
  ( (MissingZero!4533 (index!20344 (_ BitVec 32))) (Found!4533 (index!20345 (_ BitVec 32))) (Intermediate!4533 (undefined!5345 Bool) (index!20346 (_ BitVec 32)) (x!49314 (_ BitVec 32))) (Undefined!4533) (MissingVacant!4533 (index!20347 (_ BitVec 32))) )
))
(declare-fun lt!242110 () SeekEntryResult!4533)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33429 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16584)

(assert (=> b!526433 (= lt!242106 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242104 #b00000000000000000000000000000000 (index!20346 lt!242110) (x!49314 lt!242110) mask!3524))))

(declare-fun lt!242107 () (_ BitVec 64))

(declare-fun lt!242105 () array!33429)

(declare-fun res!323055 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33429 (_ BitVec 32)) SeekEntryResult!4533)

(assert (=> b!526433 (= res!323055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242104 lt!242107 lt!242105 mask!3524) (Intermediate!4533 false (index!20346 lt!242110) (x!49314 lt!242110))))))

(declare-fun e!306857 () Bool)

(assert (=> b!526433 (=> (not res!323055) (not e!306857))))

(assert (=> b!526433 e!306857))

(declare-fun b!526434 () Bool)

(declare-fun res!323058 () Bool)

(assert (=> b!526434 (=> (not res!323058) (not e!306856))))

(declare-datatypes ((List!10224 0))(
  ( (Nil!10221) (Cons!10220 (h!11151 (_ BitVec 64)) (t!16452 List!10224)) )
))
(declare-fun arrayNoDuplicates!0 (array!33429 (_ BitVec 32) List!10224) Bool)

(assert (=> b!526434 (= res!323058 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10221))))

(declare-fun b!526436 () Bool)

(declare-fun res!323064 () Bool)

(declare-fun e!306858 () Bool)

(assert (=> b!526436 (=> (not res!323064) (not e!306858))))

(assert (=> b!526436 (= res!323064 (and (= (size!16430 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16430 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16430 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526437 () Bool)

(declare-fun e!306859 () Bool)

(assert (=> b!526437 (= e!306856 (not e!306859))))

(declare-fun res!323061 () Bool)

(assert (=> b!526437 (=> res!323061 e!306859)))

(declare-fun lt!242113 () (_ BitVec 32))

(assert (=> b!526437 (= res!323061 (= lt!242110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242113 lt!242107 lt!242105 mask!3524)))))

(assert (=> b!526437 (= lt!242110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242104 (select (arr!16066 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526437 (= lt!242113 (toIndex!0 lt!242107 mask!3524))))

(assert (=> b!526437 (= lt!242107 (select (store (arr!16066 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526437 (= lt!242104 (toIndex!0 (select (arr!16066 a!3235) j!176) mask!3524))))

(assert (=> b!526437 (= lt!242105 (array!33430 (store (arr!16066 a!3235) i!1204 k0!2280) (size!16430 a!3235)))))

(declare-fun e!306861 () Bool)

(assert (=> b!526437 e!306861))

(declare-fun res!323063 () Bool)

(assert (=> b!526437 (=> (not res!323063) (not e!306861))))

(assert (=> b!526437 (= res!323063 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242108 () Unit!16584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33429 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16584)

(assert (=> b!526437 (= lt!242108 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526438 () Bool)

(declare-fun res!323066 () Bool)

(assert (=> b!526438 (=> (not res!323066) (not e!306858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526438 (= res!323066 (validKeyInArray!0 k0!2280))))

(declare-fun b!526439 () Bool)

(declare-fun res!323057 () Bool)

(assert (=> b!526439 (=> (not res!323057) (not e!306858))))

(assert (=> b!526439 (= res!323057 (validKeyInArray!0 (select (arr!16066 a!3235) j!176)))))

(declare-fun b!526440 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33429 (_ BitVec 32)) SeekEntryResult!4533)

(assert (=> b!526440 (= e!306861 (= (seekEntryOrOpen!0 (select (arr!16066 a!3235) j!176) a!3235 mask!3524) (Found!4533 j!176)))))

(declare-fun b!526441 () Bool)

(declare-fun Unit!16587 () Unit!16584)

(assert (=> b!526441 (= e!306855 Unit!16587)))

(declare-fun b!526442 () Bool)

(declare-fun res!323062 () Bool)

(assert (=> b!526442 (=> (not res!323062) (not e!306858))))

(declare-fun arrayContainsKey!0 (array!33429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526442 (= res!323062 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526443 () Bool)

(assert (=> b!526443 (= e!306858 e!306856)))

(declare-fun res!323059 () Bool)

(assert (=> b!526443 (=> (not res!323059) (not e!306856))))

(declare-fun lt!242109 () SeekEntryResult!4533)

(assert (=> b!526443 (= res!323059 (or (= lt!242109 (MissingZero!4533 i!1204)) (= lt!242109 (MissingVacant!4533 i!1204))))))

(assert (=> b!526443 (= lt!242109 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526444 () Bool)

(assert (=> b!526444 (= e!306859 true)))

(assert (=> b!526444 (= (index!20346 lt!242110) i!1204)))

(declare-fun lt!242112 () Unit!16584)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33429 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16584)

(assert (=> b!526444 (= lt!242112 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242104 #b00000000000000000000000000000000 (index!20346 lt!242110) (x!49314 lt!242110) mask!3524))))

(assert (=> b!526444 (and (or (= (select (arr!16066 a!3235) (index!20346 lt!242110)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16066 a!3235) (index!20346 lt!242110)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16066 a!3235) (index!20346 lt!242110)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16066 a!3235) (index!20346 lt!242110)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242111 () Unit!16584)

(assert (=> b!526444 (= lt!242111 e!306855)))

(declare-fun c!61994 () Bool)

(assert (=> b!526444 (= c!61994 (= (select (arr!16066 a!3235) (index!20346 lt!242110)) (select (arr!16066 a!3235) j!176)))))

(assert (=> b!526444 (and (bvslt (x!49314 lt!242110) #b01111111111111111111111111111110) (or (= (select (arr!16066 a!3235) (index!20346 lt!242110)) (select (arr!16066 a!3235) j!176)) (= (select (arr!16066 a!3235) (index!20346 lt!242110)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16066 a!3235) (index!20346 lt!242110)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526445 () Bool)

(declare-fun res!323065 () Bool)

(assert (=> b!526445 (=> res!323065 e!306859)))

(get-info :version)

(assert (=> b!526445 (= res!323065 (or (undefined!5345 lt!242110) (not ((_ is Intermediate!4533) lt!242110))))))

(declare-fun b!526435 () Bool)

(assert (=> b!526435 (= e!306857 false)))

(declare-fun res!323060 () Bool)

(assert (=> start!47792 (=> (not res!323060) (not e!306858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47792 (= res!323060 (validMask!0 mask!3524))))

(assert (=> start!47792 e!306858))

(assert (=> start!47792 true))

(declare-fun array_inv!11862 (array!33429) Bool)

(assert (=> start!47792 (array_inv!11862 a!3235)))

(assert (= (and start!47792 res!323060) b!526436))

(assert (= (and b!526436 res!323064) b!526439))

(assert (= (and b!526439 res!323057) b!526438))

(assert (= (and b!526438 res!323066) b!526442))

(assert (= (and b!526442 res!323062) b!526443))

(assert (= (and b!526443 res!323059) b!526432))

(assert (= (and b!526432 res!323056) b!526434))

(assert (= (and b!526434 res!323058) b!526437))

(assert (= (and b!526437 res!323063) b!526440))

(assert (= (and b!526437 (not res!323061)) b!526445))

(assert (= (and b!526445 (not res!323065)) b!526444))

(assert (= (and b!526444 c!61994) b!526433))

(assert (= (and b!526444 (not c!61994)) b!526441))

(assert (= (and b!526433 res!323055) b!526435))

(declare-fun m!507137 () Bool)

(assert (=> b!526437 m!507137))

(declare-fun m!507139 () Bool)

(assert (=> b!526437 m!507139))

(declare-fun m!507141 () Bool)

(assert (=> b!526437 m!507141))

(declare-fun m!507143 () Bool)

(assert (=> b!526437 m!507143))

(assert (=> b!526437 m!507141))

(assert (=> b!526437 m!507141))

(declare-fun m!507145 () Bool)

(assert (=> b!526437 m!507145))

(declare-fun m!507147 () Bool)

(assert (=> b!526437 m!507147))

(declare-fun m!507149 () Bool)

(assert (=> b!526437 m!507149))

(declare-fun m!507151 () Bool)

(assert (=> b!526437 m!507151))

(declare-fun m!507153 () Bool)

(assert (=> b!526437 m!507153))

(declare-fun m!507155 () Bool)

(assert (=> b!526443 m!507155))

(declare-fun m!507157 () Bool)

(assert (=> b!526438 m!507157))

(declare-fun m!507159 () Bool)

(assert (=> b!526433 m!507159))

(declare-fun m!507161 () Bool)

(assert (=> b!526433 m!507161))

(declare-fun m!507163 () Bool)

(assert (=> b!526434 m!507163))

(declare-fun m!507165 () Bool)

(assert (=> b!526442 m!507165))

(declare-fun m!507167 () Bool)

(assert (=> start!47792 m!507167))

(declare-fun m!507169 () Bool)

(assert (=> start!47792 m!507169))

(assert (=> b!526440 m!507141))

(assert (=> b!526440 m!507141))

(declare-fun m!507171 () Bool)

(assert (=> b!526440 m!507171))

(declare-fun m!507173 () Bool)

(assert (=> b!526444 m!507173))

(declare-fun m!507175 () Bool)

(assert (=> b!526444 m!507175))

(assert (=> b!526444 m!507141))

(declare-fun m!507177 () Bool)

(assert (=> b!526432 m!507177))

(assert (=> b!526439 m!507141))

(assert (=> b!526439 m!507141))

(declare-fun m!507179 () Bool)

(assert (=> b!526439 m!507179))

(check-sat (not b!526432) (not start!47792) (not b!526438) (not b!526442) (not b!526433) (not b!526434) (not b!526440) (not b!526443) (not b!526437) (not b!526444) (not b!526439))
(check-sat)
