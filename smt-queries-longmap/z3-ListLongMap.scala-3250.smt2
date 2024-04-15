; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45360 () Bool)

(assert start!45360)

(declare-fun b!498062 () Bool)

(declare-fun res!300323 () Bool)

(declare-fun e!291911 () Bool)

(assert (=> b!498062 (=> (not res!300323) (not e!291911))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32195 0))(
  ( (array!32196 (arr!15479 (Array (_ BitVec 32) (_ BitVec 64))) (size!15844 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32195)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498062 (= res!300323 (and (= (size!15844 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15844 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15844 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498063 () Bool)

(declare-fun e!291907 () Bool)

(declare-fun e!291905 () Bool)

(assert (=> b!498063 (= e!291907 (not e!291905))))

(declare-fun res!300319 () Bool)

(assert (=> b!498063 (=> res!300319 e!291905)))

(declare-datatypes ((SeekEntryResult!3943 0))(
  ( (MissingZero!3943 (index!17954 (_ BitVec 32))) (Found!3943 (index!17955 (_ BitVec 32))) (Intermediate!3943 (undefined!4755 Bool) (index!17956 (_ BitVec 32)) (x!47015 (_ BitVec 32))) (Undefined!3943) (MissingVacant!3943 (index!17957 (_ BitVec 32))) )
))
(declare-fun lt!225476 () SeekEntryResult!3943)

(declare-fun lt!225481 () (_ BitVec 32))

(declare-fun lt!225483 () array!32195)

(declare-fun lt!225480 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32195 (_ BitVec 32)) SeekEntryResult!3943)

(assert (=> b!498063 (= res!300319 (= lt!225476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225481 lt!225480 lt!225483 mask!3524)))))

(declare-fun lt!225475 () (_ BitVec 32))

(assert (=> b!498063 (= lt!225476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225475 (select (arr!15479 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498063 (= lt!225481 (toIndex!0 lt!225480 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!498063 (= lt!225480 (select (store (arr!15479 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498063 (= lt!225475 (toIndex!0 (select (arr!15479 a!3235) j!176) mask!3524))))

(assert (=> b!498063 (= lt!225483 (array!32196 (store (arr!15479 a!3235) i!1204 k0!2280) (size!15844 a!3235)))))

(declare-fun e!291910 () Bool)

(assert (=> b!498063 e!291910))

(declare-fun res!300317 () Bool)

(assert (=> b!498063 (=> (not res!300317) (not e!291910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32195 (_ BitVec 32)) Bool)

(assert (=> b!498063 (= res!300317 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14842 0))(
  ( (Unit!14843) )
))
(declare-fun lt!225484 () Unit!14842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14842)

(assert (=> b!498063 (= lt!225484 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498064 () Bool)

(declare-fun res!300314 () Bool)

(assert (=> b!498064 (=> (not res!300314) (not e!291911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498064 (= res!300314 (validKeyInArray!0 (select (arr!15479 a!3235) j!176)))))

(declare-fun b!498065 () Bool)

(declare-fun res!300318 () Bool)

(assert (=> b!498065 (=> (not res!300318) (not e!291907))))

(declare-datatypes ((List!9676 0))(
  ( (Nil!9673) (Cons!9672 (h!10546 (_ BitVec 64)) (t!15895 List!9676)) )
))
(declare-fun arrayNoDuplicates!0 (array!32195 (_ BitVec 32) List!9676) Bool)

(assert (=> b!498065 (= res!300318 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9673))))

(declare-fun b!498066 () Bool)

(declare-fun e!291906 () Unit!14842)

(declare-fun Unit!14844 () Unit!14842)

(assert (=> b!498066 (= e!291906 Unit!14844)))

(declare-fun b!498067 () Bool)

(assert (=> b!498067 (= e!291911 e!291907)))

(declare-fun res!300326 () Bool)

(assert (=> b!498067 (=> (not res!300326) (not e!291907))))

(declare-fun lt!225479 () SeekEntryResult!3943)

(assert (=> b!498067 (= res!300326 (or (= lt!225479 (MissingZero!3943 i!1204)) (= lt!225479 (MissingVacant!3943 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32195 (_ BitVec 32)) SeekEntryResult!3943)

(assert (=> b!498067 (= lt!225479 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498068 () Bool)

(declare-fun res!300320 () Bool)

(assert (=> b!498068 (=> (not res!300320) (not e!291911))))

(declare-fun arrayContainsKey!0 (array!32195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498068 (= res!300320 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498070 () Bool)

(declare-fun Unit!14845 () Unit!14842)

(assert (=> b!498070 (= e!291906 Unit!14845)))

(declare-fun lt!225482 () Unit!14842)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32195 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14842)

(assert (=> b!498070 (= lt!225482 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225475 #b00000000000000000000000000000000 (index!17956 lt!225476) (x!47015 lt!225476) mask!3524))))

(declare-fun res!300325 () Bool)

(assert (=> b!498070 (= res!300325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225475 lt!225480 lt!225483 mask!3524) (Intermediate!3943 false (index!17956 lt!225476) (x!47015 lt!225476))))))

(declare-fun e!291909 () Bool)

(assert (=> b!498070 (=> (not res!300325) (not e!291909))))

(assert (=> b!498070 e!291909))

(declare-fun b!498071 () Bool)

(assert (=> b!498071 (= e!291910 (= (seekEntryOrOpen!0 (select (arr!15479 a!3235) j!176) a!3235 mask!3524) (Found!3943 j!176)))))

(declare-fun b!498072 () Bool)

(declare-fun e!291912 () Bool)

(assert (=> b!498072 (= e!291912 true)))

(declare-fun lt!225477 () SeekEntryResult!3943)

(assert (=> b!498072 (= lt!225477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225475 lt!225480 lt!225483 mask!3524))))

(declare-fun b!498073 () Bool)

(declare-fun res!300321 () Bool)

(assert (=> b!498073 (=> (not res!300321) (not e!291907))))

(assert (=> b!498073 (= res!300321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498074 () Bool)

(declare-fun res!300322 () Bool)

(assert (=> b!498074 (=> res!300322 e!291905)))

(get-info :version)

(assert (=> b!498074 (= res!300322 (or (undefined!4755 lt!225476) (not ((_ is Intermediate!3943) lt!225476))))))

(declare-fun res!300316 () Bool)

(assert (=> start!45360 (=> (not res!300316) (not e!291911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45360 (= res!300316 (validMask!0 mask!3524))))

(assert (=> start!45360 e!291911))

(assert (=> start!45360 true))

(declare-fun array_inv!11362 (array!32195) Bool)

(assert (=> start!45360 (array_inv!11362 a!3235)))

(declare-fun b!498069 () Bool)

(assert (=> b!498069 (= e!291909 false)))

(declare-fun b!498075 () Bool)

(declare-fun res!300315 () Bool)

(assert (=> b!498075 (=> (not res!300315) (not e!291911))))

(assert (=> b!498075 (= res!300315 (validKeyInArray!0 k0!2280))))

(declare-fun b!498076 () Bool)

(assert (=> b!498076 (= e!291905 e!291912)))

(declare-fun res!300324 () Bool)

(assert (=> b!498076 (=> res!300324 e!291912)))

(assert (=> b!498076 (= res!300324 (or (bvsgt #b00000000000000000000000000000000 (x!47015 lt!225476)) (bvsgt (x!47015 lt!225476) #b01111111111111111111111111111110) (bvslt lt!225475 #b00000000000000000000000000000000) (bvsge lt!225475 (size!15844 a!3235)) (bvslt (index!17956 lt!225476) #b00000000000000000000000000000000) (bvsge (index!17956 lt!225476) (size!15844 a!3235)) (not (= lt!225476 (Intermediate!3943 false (index!17956 lt!225476) (x!47015 lt!225476))))))))

(assert (=> b!498076 (and (or (= (select (arr!15479 a!3235) (index!17956 lt!225476)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15479 a!3235) (index!17956 lt!225476)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15479 a!3235) (index!17956 lt!225476)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15479 a!3235) (index!17956 lt!225476)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225478 () Unit!14842)

(assert (=> b!498076 (= lt!225478 e!291906)))

(declare-fun c!59151 () Bool)

(assert (=> b!498076 (= c!59151 (= (select (arr!15479 a!3235) (index!17956 lt!225476)) (select (arr!15479 a!3235) j!176)))))

(assert (=> b!498076 (and (bvslt (x!47015 lt!225476) #b01111111111111111111111111111110) (or (= (select (arr!15479 a!3235) (index!17956 lt!225476)) (select (arr!15479 a!3235) j!176)) (= (select (arr!15479 a!3235) (index!17956 lt!225476)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15479 a!3235) (index!17956 lt!225476)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45360 res!300316) b!498062))

(assert (= (and b!498062 res!300323) b!498064))

(assert (= (and b!498064 res!300314) b!498075))

(assert (= (and b!498075 res!300315) b!498068))

(assert (= (and b!498068 res!300320) b!498067))

(assert (= (and b!498067 res!300326) b!498073))

(assert (= (and b!498073 res!300321) b!498065))

(assert (= (and b!498065 res!300318) b!498063))

(assert (= (and b!498063 res!300317) b!498071))

(assert (= (and b!498063 (not res!300319)) b!498074))

(assert (= (and b!498074 (not res!300322)) b!498076))

(assert (= (and b!498076 c!59151) b!498070))

(assert (= (and b!498076 (not c!59151)) b!498066))

(assert (= (and b!498070 res!300325) b!498069))

(assert (= (and b!498076 (not res!300324)) b!498072))

(declare-fun m!478855 () Bool)

(assert (=> b!498075 m!478855))

(declare-fun m!478857 () Bool)

(assert (=> b!498063 m!478857))

(declare-fun m!478859 () Bool)

(assert (=> b!498063 m!478859))

(declare-fun m!478861 () Bool)

(assert (=> b!498063 m!478861))

(declare-fun m!478863 () Bool)

(assert (=> b!498063 m!478863))

(declare-fun m!478865 () Bool)

(assert (=> b!498063 m!478865))

(assert (=> b!498063 m!478863))

(assert (=> b!498063 m!478863))

(declare-fun m!478867 () Bool)

(assert (=> b!498063 m!478867))

(declare-fun m!478869 () Bool)

(assert (=> b!498063 m!478869))

(declare-fun m!478871 () Bool)

(assert (=> b!498063 m!478871))

(declare-fun m!478873 () Bool)

(assert (=> b!498063 m!478873))

(assert (=> b!498064 m!478863))

(assert (=> b!498064 m!478863))

(declare-fun m!478875 () Bool)

(assert (=> b!498064 m!478875))

(assert (=> b!498071 m!478863))

(assert (=> b!498071 m!478863))

(declare-fun m!478877 () Bool)

(assert (=> b!498071 m!478877))

(declare-fun m!478879 () Bool)

(assert (=> start!45360 m!478879))

(declare-fun m!478881 () Bool)

(assert (=> start!45360 m!478881))

(declare-fun m!478883 () Bool)

(assert (=> b!498070 m!478883))

(declare-fun m!478885 () Bool)

(assert (=> b!498070 m!478885))

(assert (=> b!498072 m!478885))

(declare-fun m!478887 () Bool)

(assert (=> b!498067 m!478887))

(declare-fun m!478889 () Bool)

(assert (=> b!498076 m!478889))

(assert (=> b!498076 m!478863))

(declare-fun m!478891 () Bool)

(assert (=> b!498073 m!478891))

(declare-fun m!478893 () Bool)

(assert (=> b!498068 m!478893))

(declare-fun m!478895 () Bool)

(assert (=> b!498065 m!478895))

(check-sat (not b!498072) (not b!498075) (not b!498068) (not b!498071) (not b!498063) (not b!498070) (not b!498064) (not b!498067) (not b!498073) (not start!45360) (not b!498065))
(check-sat)
