; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45366 () Bool)

(assert start!45366)

(declare-fun b!498197 () Bool)

(declare-fun e!291977 () Bool)

(assert (=> b!498197 (= e!291977 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!225571 () (_ BitVec 64))

(declare-fun lt!225573 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3946 0))(
  ( (MissingZero!3946 (index!17966 (_ BitVec 32))) (Found!3946 (index!17967 (_ BitVec 32))) (Intermediate!3946 (undefined!4758 Bool) (index!17968 (_ BitVec 32)) (x!47026 (_ BitVec 32))) (Undefined!3946) (MissingVacant!3946 (index!17969 (_ BitVec 32))) )
))
(declare-fun lt!225567 () SeekEntryResult!3946)

(declare-datatypes ((array!32201 0))(
  ( (array!32202 (arr!15482 (Array (_ BitVec 32) (_ BitVec 64))) (size!15847 (_ BitVec 32))) )
))
(declare-fun lt!225566 () array!32201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32201 (_ BitVec 32)) SeekEntryResult!3946)

(assert (=> b!498197 (= lt!225567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225573 lt!225571 lt!225566 mask!3524))))

(declare-fun b!498199 () Bool)

(declare-fun res!300434 () Bool)

(declare-fun e!291982 () Bool)

(assert (=> b!498199 (=> (not res!300434) (not e!291982))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498199 (= res!300434 (validKeyInArray!0 k0!2280))))

(declare-fun b!498200 () Bool)

(declare-fun res!300439 () Bool)

(declare-fun e!291980 () Bool)

(assert (=> b!498200 (=> res!300439 e!291980)))

(declare-fun lt!225570 () SeekEntryResult!3946)

(get-info :version)

(assert (=> b!498200 (= res!300439 (or (undefined!4758 lt!225570) (not ((_ is Intermediate!3946) lt!225570))))))

(declare-fun b!498201 () Bool)

(declare-fun e!291981 () Bool)

(assert (=> b!498201 (= e!291981 (not e!291980))))

(declare-fun res!300441 () Bool)

(assert (=> b!498201 (=> res!300441 e!291980)))

(declare-fun lt!225574 () (_ BitVec 32))

(assert (=> b!498201 (= res!300441 (= lt!225570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225574 lt!225571 lt!225566 mask!3524)))))

(declare-fun a!3235 () array!32201)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498201 (= lt!225570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225573 (select (arr!15482 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498201 (= lt!225574 (toIndex!0 lt!225571 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498201 (= lt!225571 (select (store (arr!15482 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498201 (= lt!225573 (toIndex!0 (select (arr!15482 a!3235) j!176) mask!3524))))

(assert (=> b!498201 (= lt!225566 (array!32202 (store (arr!15482 a!3235) i!1204 k0!2280) (size!15847 a!3235)))))

(declare-fun e!291979 () Bool)

(assert (=> b!498201 e!291979))

(declare-fun res!300438 () Bool)

(assert (=> b!498201 (=> (not res!300438) (not e!291979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32201 (_ BitVec 32)) Bool)

(assert (=> b!498201 (= res!300438 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14854 0))(
  ( (Unit!14855) )
))
(declare-fun lt!225568 () Unit!14854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14854)

(assert (=> b!498201 (= lt!225568 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498202 () Bool)

(declare-fun e!291984 () Bool)

(assert (=> b!498202 (= e!291984 false)))

(declare-fun b!498203 () Bool)

(declare-fun res!300435 () Bool)

(assert (=> b!498203 (=> (not res!300435) (not e!291982))))

(assert (=> b!498203 (= res!300435 (validKeyInArray!0 (select (arr!15482 a!3235) j!176)))))

(declare-fun b!498204 () Bool)

(declare-fun res!300443 () Bool)

(assert (=> b!498204 (=> (not res!300443) (not e!291981))))

(declare-datatypes ((List!9679 0))(
  ( (Nil!9676) (Cons!9675 (h!10549 (_ BitVec 64)) (t!15898 List!9679)) )
))
(declare-fun arrayNoDuplicates!0 (array!32201 (_ BitVec 32) List!9679) Bool)

(assert (=> b!498204 (= res!300443 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9676))))

(declare-fun b!498205 () Bool)

(declare-fun e!291978 () Unit!14854)

(declare-fun Unit!14856 () Unit!14854)

(assert (=> b!498205 (= e!291978 Unit!14856)))

(declare-fun lt!225572 () Unit!14854)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14854)

(assert (=> b!498205 (= lt!225572 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225573 #b00000000000000000000000000000000 (index!17968 lt!225570) (x!47026 lt!225570) mask!3524))))

(declare-fun res!300437 () Bool)

(assert (=> b!498205 (= res!300437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225573 lt!225571 lt!225566 mask!3524) (Intermediate!3946 false (index!17968 lt!225570) (x!47026 lt!225570))))))

(assert (=> b!498205 (=> (not res!300437) (not e!291984))))

(assert (=> b!498205 e!291984))

(declare-fun b!498206 () Bool)

(declare-fun res!300433 () Bool)

(assert (=> b!498206 (=> (not res!300433) (not e!291982))))

(assert (=> b!498206 (= res!300433 (and (= (size!15847 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15847 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15847 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498207 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32201 (_ BitVec 32)) SeekEntryResult!3946)

(assert (=> b!498207 (= e!291979 (= (seekEntryOrOpen!0 (select (arr!15482 a!3235) j!176) a!3235 mask!3524) (Found!3946 j!176)))))

(declare-fun b!498208 () Bool)

(declare-fun Unit!14857 () Unit!14854)

(assert (=> b!498208 (= e!291978 Unit!14857)))

(declare-fun b!498198 () Bool)

(assert (=> b!498198 (= e!291982 e!291981)))

(declare-fun res!300442 () Bool)

(assert (=> b!498198 (=> (not res!300442) (not e!291981))))

(declare-fun lt!225569 () SeekEntryResult!3946)

(assert (=> b!498198 (= res!300442 (or (= lt!225569 (MissingZero!3946 i!1204)) (= lt!225569 (MissingVacant!3946 i!1204))))))

(assert (=> b!498198 (= lt!225569 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!300432 () Bool)

(assert (=> start!45366 (=> (not res!300432) (not e!291982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45366 (= res!300432 (validMask!0 mask!3524))))

(assert (=> start!45366 e!291982))

(assert (=> start!45366 true))

(declare-fun array_inv!11365 (array!32201) Bool)

(assert (=> start!45366 (array_inv!11365 a!3235)))

(declare-fun b!498209 () Bool)

(declare-fun res!300431 () Bool)

(assert (=> b!498209 (=> (not res!300431) (not e!291981))))

(assert (=> b!498209 (= res!300431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498210 () Bool)

(declare-fun res!300440 () Bool)

(assert (=> b!498210 (=> (not res!300440) (not e!291982))))

(declare-fun arrayContainsKey!0 (array!32201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498210 (= res!300440 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498211 () Bool)

(assert (=> b!498211 (= e!291980 e!291977)))

(declare-fun res!300436 () Bool)

(assert (=> b!498211 (=> res!300436 e!291977)))

(assert (=> b!498211 (= res!300436 (or (bvsgt #b00000000000000000000000000000000 (x!47026 lt!225570)) (bvsgt (x!47026 lt!225570) #b01111111111111111111111111111110) (bvslt lt!225573 #b00000000000000000000000000000000) (bvsge lt!225573 (size!15847 a!3235)) (bvslt (index!17968 lt!225570) #b00000000000000000000000000000000) (bvsge (index!17968 lt!225570) (size!15847 a!3235)) (not (= lt!225570 (Intermediate!3946 false (index!17968 lt!225570) (x!47026 lt!225570))))))))

(assert (=> b!498211 (and (or (= (select (arr!15482 a!3235) (index!17968 lt!225570)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15482 a!3235) (index!17968 lt!225570)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15482 a!3235) (index!17968 lt!225570)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15482 a!3235) (index!17968 lt!225570)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225565 () Unit!14854)

(assert (=> b!498211 (= lt!225565 e!291978)))

(declare-fun c!59160 () Bool)

(assert (=> b!498211 (= c!59160 (= (select (arr!15482 a!3235) (index!17968 lt!225570)) (select (arr!15482 a!3235) j!176)))))

(assert (=> b!498211 (and (bvslt (x!47026 lt!225570) #b01111111111111111111111111111110) (or (= (select (arr!15482 a!3235) (index!17968 lt!225570)) (select (arr!15482 a!3235) j!176)) (= (select (arr!15482 a!3235) (index!17968 lt!225570)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15482 a!3235) (index!17968 lt!225570)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45366 res!300432) b!498206))

(assert (= (and b!498206 res!300433) b!498203))

(assert (= (and b!498203 res!300435) b!498199))

(assert (= (and b!498199 res!300434) b!498210))

(assert (= (and b!498210 res!300440) b!498198))

(assert (= (and b!498198 res!300442) b!498209))

(assert (= (and b!498209 res!300431) b!498204))

(assert (= (and b!498204 res!300443) b!498201))

(assert (= (and b!498201 res!300438) b!498207))

(assert (= (and b!498201 (not res!300441)) b!498200))

(assert (= (and b!498200 (not res!300439)) b!498211))

(assert (= (and b!498211 c!59160) b!498205))

(assert (= (and b!498211 (not c!59160)) b!498208))

(assert (= (and b!498205 res!300437) b!498202))

(assert (= (and b!498211 (not res!300436)) b!498197))

(declare-fun m!478981 () Bool)

(assert (=> b!498199 m!478981))

(declare-fun m!478983 () Bool)

(assert (=> start!45366 m!478983))

(declare-fun m!478985 () Bool)

(assert (=> start!45366 m!478985))

(declare-fun m!478987 () Bool)

(assert (=> b!498205 m!478987))

(declare-fun m!478989 () Bool)

(assert (=> b!498205 m!478989))

(declare-fun m!478991 () Bool)

(assert (=> b!498203 m!478991))

(assert (=> b!498203 m!478991))

(declare-fun m!478993 () Bool)

(assert (=> b!498203 m!478993))

(declare-fun m!478995 () Bool)

(assert (=> b!498211 m!478995))

(assert (=> b!498211 m!478991))

(declare-fun m!478997 () Bool)

(assert (=> b!498209 m!478997))

(assert (=> b!498207 m!478991))

(assert (=> b!498207 m!478991))

(declare-fun m!478999 () Bool)

(assert (=> b!498207 m!478999))

(declare-fun m!479001 () Bool)

(assert (=> b!498201 m!479001))

(declare-fun m!479003 () Bool)

(assert (=> b!498201 m!479003))

(declare-fun m!479005 () Bool)

(assert (=> b!498201 m!479005))

(assert (=> b!498201 m!478991))

(declare-fun m!479007 () Bool)

(assert (=> b!498201 m!479007))

(assert (=> b!498201 m!478991))

(declare-fun m!479009 () Bool)

(assert (=> b!498201 m!479009))

(assert (=> b!498201 m!478991))

(declare-fun m!479011 () Bool)

(assert (=> b!498201 m!479011))

(declare-fun m!479013 () Bool)

(assert (=> b!498201 m!479013))

(declare-fun m!479015 () Bool)

(assert (=> b!498201 m!479015))

(declare-fun m!479017 () Bool)

(assert (=> b!498198 m!479017))

(assert (=> b!498197 m!478989))

(declare-fun m!479019 () Bool)

(assert (=> b!498210 m!479019))

(declare-fun m!479021 () Bool)

(assert (=> b!498204 m!479021))

(check-sat (not b!498199) (not b!498210) (not b!498204) (not b!498197) (not b!498205) (not b!498201) (not b!498203) (not start!45366) (not b!498207) (not b!498198) (not b!498209))
(check-sat)
