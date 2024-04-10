; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45716 () Bool)

(assert start!45716)

(declare-fun b!505186 () Bool)

(declare-fun e!295747 () Bool)

(declare-fun e!295753 () Bool)

(assert (=> b!505186 (= e!295747 e!295753)))

(declare-fun res!306292 () Bool)

(assert (=> b!505186 (=> (not res!306292) (not e!295753))))

(declare-datatypes ((SeekEntryResult!4083 0))(
  ( (MissingZero!4083 (index!18520 (_ BitVec 32))) (Found!4083 (index!18521 (_ BitVec 32))) (Intermediate!4083 (undefined!4895 Bool) (index!18522 (_ BitVec 32)) (x!47532 (_ BitVec 32))) (Undefined!4083) (MissingVacant!4083 (index!18523 (_ BitVec 32))) )
))
(declare-fun lt!230174 () SeekEntryResult!4083)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505186 (= res!306292 (or (= lt!230174 (MissingZero!4083 i!1204)) (= lt!230174 (MissingVacant!4083 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32472 0))(
  ( (array!32473 (arr!15616 (Array (_ BitVec 32) (_ BitVec 64))) (size!15980 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32472)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32472 (_ BitVec 32)) SeekEntryResult!4083)

(assert (=> b!505186 (= lt!230174 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505187 () Bool)

(declare-fun e!295749 () Bool)

(assert (=> b!505187 (= e!295749 true)))

(declare-fun lt!230167 () SeekEntryResult!4083)

(declare-fun lt!230166 () (_ BitVec 64))

(declare-fun lt!230175 () array!32472)

(assert (=> b!505187 (= (seekEntryOrOpen!0 lt!230166 lt!230175 mask!3524) lt!230167)))

(declare-fun lt!230176 () (_ BitVec 32))

(declare-fun lt!230172 () SeekEntryResult!4083)

(declare-datatypes ((Unit!15408 0))(
  ( (Unit!15409) )
))
(declare-fun lt!230168 () Unit!15408)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32472 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15408)

(assert (=> b!505187 (= lt!230168 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230176 #b00000000000000000000000000000000 (index!18522 lt!230172) (x!47532 lt!230172) mask!3524))))

(declare-fun res!306286 () Bool)

(assert (=> start!45716 (=> (not res!306286) (not e!295747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45716 (= res!306286 (validMask!0 mask!3524))))

(assert (=> start!45716 e!295747))

(assert (=> start!45716 true))

(declare-fun array_inv!11412 (array!32472) Bool)

(assert (=> start!45716 (array_inv!11412 a!3235)))

(declare-fun b!505188 () Bool)

(declare-fun res!306284 () Bool)

(assert (=> b!505188 (=> (not res!306284) (not e!295747))))

(declare-fun arrayContainsKey!0 (array!32472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505188 (= res!306284 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505189 () Bool)

(declare-fun res!306289 () Bool)

(assert (=> b!505189 (=> (not res!306289) (not e!295747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505189 (= res!306289 (validKeyInArray!0 (select (arr!15616 a!3235) j!176)))))

(declare-fun b!505190 () Bool)

(declare-fun e!295750 () Bool)

(assert (=> b!505190 (= e!295750 e!295749)))

(declare-fun res!306293 () Bool)

(assert (=> b!505190 (=> res!306293 e!295749)))

(assert (=> b!505190 (= res!306293 (or (bvsgt (x!47532 lt!230172) #b01111111111111111111111111111110) (bvslt lt!230176 #b00000000000000000000000000000000) (bvsge lt!230176 (size!15980 a!3235)) (bvslt (index!18522 lt!230172) #b00000000000000000000000000000000) (bvsge (index!18522 lt!230172) (size!15980 a!3235)) (not (= lt!230172 (Intermediate!4083 false (index!18522 lt!230172) (x!47532 lt!230172))))))))

(assert (=> b!505190 (= (index!18522 lt!230172) i!1204)))

(declare-fun lt!230165 () Unit!15408)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32472 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15408)

(assert (=> b!505190 (= lt!230165 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230176 #b00000000000000000000000000000000 (index!18522 lt!230172) (x!47532 lt!230172) mask!3524))))

(assert (=> b!505190 (and (or (= (select (arr!15616 a!3235) (index!18522 lt!230172)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15616 a!3235) (index!18522 lt!230172)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15616 a!3235) (index!18522 lt!230172)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15616 a!3235) (index!18522 lt!230172)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230164 () Unit!15408)

(declare-fun e!295751 () Unit!15408)

(assert (=> b!505190 (= lt!230164 e!295751)))

(declare-fun c!59732 () Bool)

(assert (=> b!505190 (= c!59732 (= (select (arr!15616 a!3235) (index!18522 lt!230172)) (select (arr!15616 a!3235) j!176)))))

(assert (=> b!505190 (and (bvslt (x!47532 lt!230172) #b01111111111111111111111111111110) (or (= (select (arr!15616 a!3235) (index!18522 lt!230172)) (select (arr!15616 a!3235) j!176)) (= (select (arr!15616 a!3235) (index!18522 lt!230172)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15616 a!3235) (index!18522 lt!230172)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505191 () Bool)

(declare-fun res!306291 () Bool)

(assert (=> b!505191 (=> (not res!306291) (not e!295747))))

(assert (=> b!505191 (= res!306291 (validKeyInArray!0 k0!2280))))

(declare-fun b!505192 () Bool)

(declare-fun res!306279 () Bool)

(assert (=> b!505192 (=> (not res!306279) (not e!295747))))

(assert (=> b!505192 (= res!306279 (and (= (size!15980 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15980 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15980 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505193 () Bool)

(declare-fun res!306283 () Bool)

(assert (=> b!505193 (=> (not res!306283) (not e!295753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32472 (_ BitVec 32)) Bool)

(assert (=> b!505193 (= res!306283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!295754 () Bool)

(declare-fun b!505194 () Bool)

(assert (=> b!505194 (= e!295754 (= (seekEntryOrOpen!0 (select (arr!15616 a!3235) j!176) a!3235 mask!3524) (Found!4083 j!176)))))

(declare-fun b!505195 () Bool)

(declare-fun Unit!15410 () Unit!15408)

(assert (=> b!505195 (= e!295751 Unit!15410)))

(declare-fun lt!230171 () Unit!15408)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32472 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15408)

(assert (=> b!505195 (= lt!230171 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230176 #b00000000000000000000000000000000 (index!18522 lt!230172) (x!47532 lt!230172) mask!3524))))

(declare-fun res!306288 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32472 (_ BitVec 32)) SeekEntryResult!4083)

(assert (=> b!505195 (= res!306288 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230176 lt!230166 lt!230175 mask!3524) (Intermediate!4083 false (index!18522 lt!230172) (x!47532 lt!230172))))))

(declare-fun e!295755 () Bool)

(assert (=> b!505195 (=> (not res!306288) (not e!295755))))

(assert (=> b!505195 e!295755))

(declare-fun b!505196 () Bool)

(assert (=> b!505196 (= e!295753 (not e!295750))))

(declare-fun res!306281 () Bool)

(assert (=> b!505196 (=> res!306281 e!295750)))

(declare-fun lt!230169 () SeekEntryResult!4083)

(get-info :version)

(assert (=> b!505196 (= res!306281 (or (= lt!230172 lt!230169) (undefined!4895 lt!230172) (not ((_ is Intermediate!4083) lt!230172))))))

(declare-fun lt!230173 () (_ BitVec 32))

(assert (=> b!505196 (= lt!230169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230173 lt!230166 lt!230175 mask!3524))))

(assert (=> b!505196 (= lt!230172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230176 (select (arr!15616 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505196 (= lt!230173 (toIndex!0 lt!230166 mask!3524))))

(assert (=> b!505196 (= lt!230166 (select (store (arr!15616 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505196 (= lt!230176 (toIndex!0 (select (arr!15616 a!3235) j!176) mask!3524))))

(assert (=> b!505196 (= lt!230175 (array!32473 (store (arr!15616 a!3235) i!1204 k0!2280) (size!15980 a!3235)))))

(assert (=> b!505196 (= lt!230167 (Found!4083 j!176))))

(assert (=> b!505196 e!295754))

(declare-fun res!306282 () Bool)

(assert (=> b!505196 (=> (not res!306282) (not e!295754))))

(assert (=> b!505196 (= res!306282 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230170 () Unit!15408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15408)

(assert (=> b!505196 (= lt!230170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505197 () Bool)

(assert (=> b!505197 (= e!295755 false)))

(declare-fun b!505198 () Bool)

(declare-fun res!306287 () Bool)

(assert (=> b!505198 (=> (not res!306287) (not e!295753))))

(declare-datatypes ((List!9774 0))(
  ( (Nil!9771) (Cons!9770 (h!10647 (_ BitVec 64)) (t!16002 List!9774)) )
))
(declare-fun arrayNoDuplicates!0 (array!32472 (_ BitVec 32) List!9774) Bool)

(assert (=> b!505198 (= res!306287 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9771))))

(declare-fun b!505199 () Bool)

(declare-fun Unit!15411 () Unit!15408)

(assert (=> b!505199 (= e!295751 Unit!15411)))

(declare-fun b!505200 () Bool)

(declare-fun res!306280 () Bool)

(assert (=> b!505200 (=> res!306280 e!295749)))

(assert (=> b!505200 (= res!306280 (not (= lt!230169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230176 lt!230166 lt!230175 mask!3524))))))

(declare-fun b!505201 () Bool)

(declare-fun res!306290 () Bool)

(assert (=> b!505201 (=> res!306290 e!295749)))

(declare-fun e!295752 () Bool)

(assert (=> b!505201 (= res!306290 e!295752)))

(declare-fun res!306285 () Bool)

(assert (=> b!505201 (=> (not res!306285) (not e!295752))))

(assert (=> b!505201 (= res!306285 (bvsgt #b00000000000000000000000000000000 (x!47532 lt!230172)))))

(declare-fun b!505202 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32472 (_ BitVec 32)) SeekEntryResult!4083)

(assert (=> b!505202 (= e!295752 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230176 (index!18522 lt!230172) (select (arr!15616 a!3235) j!176) a!3235 mask!3524) lt!230167)))))

(assert (= (and start!45716 res!306286) b!505192))

(assert (= (and b!505192 res!306279) b!505189))

(assert (= (and b!505189 res!306289) b!505191))

(assert (= (and b!505191 res!306291) b!505188))

(assert (= (and b!505188 res!306284) b!505186))

(assert (= (and b!505186 res!306292) b!505193))

(assert (= (and b!505193 res!306283) b!505198))

(assert (= (and b!505198 res!306287) b!505196))

(assert (= (and b!505196 res!306282) b!505194))

(assert (= (and b!505196 (not res!306281)) b!505190))

(assert (= (and b!505190 c!59732) b!505195))

(assert (= (and b!505190 (not c!59732)) b!505199))

(assert (= (and b!505195 res!306288) b!505197))

(assert (= (and b!505190 (not res!306293)) b!505201))

(assert (= (and b!505201 res!306285) b!505202))

(assert (= (and b!505201 (not res!306290)) b!505200))

(assert (= (and b!505200 (not res!306280)) b!505187))

(declare-fun m!485855 () Bool)

(assert (=> b!505202 m!485855))

(assert (=> b!505202 m!485855))

(declare-fun m!485857 () Bool)

(assert (=> b!505202 m!485857))

(declare-fun m!485859 () Bool)

(assert (=> b!505186 m!485859))

(declare-fun m!485861 () Bool)

(assert (=> b!505191 m!485861))

(declare-fun m!485863 () Bool)

(assert (=> b!505196 m!485863))

(declare-fun m!485865 () Bool)

(assert (=> b!505196 m!485865))

(declare-fun m!485867 () Bool)

(assert (=> b!505196 m!485867))

(declare-fun m!485869 () Bool)

(assert (=> b!505196 m!485869))

(assert (=> b!505196 m!485855))

(declare-fun m!485871 () Bool)

(assert (=> b!505196 m!485871))

(declare-fun m!485873 () Bool)

(assert (=> b!505196 m!485873))

(assert (=> b!505196 m!485855))

(declare-fun m!485875 () Bool)

(assert (=> b!505196 m!485875))

(assert (=> b!505196 m!485855))

(declare-fun m!485877 () Bool)

(assert (=> b!505196 m!485877))

(declare-fun m!485879 () Bool)

(assert (=> start!45716 m!485879))

(declare-fun m!485881 () Bool)

(assert (=> start!45716 m!485881))

(declare-fun m!485883 () Bool)

(assert (=> b!505195 m!485883))

(declare-fun m!485885 () Bool)

(assert (=> b!505195 m!485885))

(declare-fun m!485887 () Bool)

(assert (=> b!505198 m!485887))

(declare-fun m!485889 () Bool)

(assert (=> b!505187 m!485889))

(declare-fun m!485891 () Bool)

(assert (=> b!505187 m!485891))

(declare-fun m!485893 () Bool)

(assert (=> b!505193 m!485893))

(assert (=> b!505194 m!485855))

(assert (=> b!505194 m!485855))

(declare-fun m!485895 () Bool)

(assert (=> b!505194 m!485895))

(assert (=> b!505200 m!485885))

(assert (=> b!505189 m!485855))

(assert (=> b!505189 m!485855))

(declare-fun m!485897 () Bool)

(assert (=> b!505189 m!485897))

(declare-fun m!485899 () Bool)

(assert (=> b!505190 m!485899))

(declare-fun m!485901 () Bool)

(assert (=> b!505190 m!485901))

(assert (=> b!505190 m!485855))

(declare-fun m!485903 () Bool)

(assert (=> b!505188 m!485903))

(check-sat (not start!45716) (not b!505196) (not b!505198) (not b!505189) (not b!505190) (not b!505195) (not b!505187) (not b!505188) (not b!505193) (not b!505186) (not b!505202) (not b!505191) (not b!505194) (not b!505200))
(check-sat)
