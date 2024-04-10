; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46248 () Bool)

(assert start!46248)

(declare-fun b!512210 () Bool)

(declare-fun e!299172 () Bool)

(assert (=> b!512210 (= e!299172 true)))

(declare-datatypes ((SeekEntryResult!4295 0))(
  ( (MissingZero!4295 (index!19368 (_ BitVec 32))) (Found!4295 (index!19369 (_ BitVec 32))) (Intermediate!4295 (undefined!5107 Bool) (index!19370 (_ BitVec 32)) (x!48318 (_ BitVec 32))) (Undefined!4295) (MissingVacant!4295 (index!19371 (_ BitVec 32))) )
))
(declare-fun lt!234446 () SeekEntryResult!4295)

(assert (=> b!512210 (= lt!234446 Undefined!4295)))

(declare-fun b!512211 () Bool)

(declare-fun res!312873 () Bool)

(assert (=> b!512211 (=> res!312873 e!299172)))

(declare-fun lt!234448 () SeekEntryResult!4295)

(assert (=> b!512211 (= res!312873 (or (not (is-Intermediate!4295 lt!234448)) (not (undefined!5107 lt!234448))))))

(declare-fun b!512212 () Bool)

(declare-fun e!299175 () Bool)

(declare-fun e!299173 () Bool)

(assert (=> b!512212 (= e!299175 e!299173)))

(declare-fun res!312878 () Bool)

(assert (=> b!512212 (=> (not res!312878) (not e!299173))))

(declare-fun lt!234444 () SeekEntryResult!4295)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512212 (= res!312878 (or (= lt!234444 (MissingZero!4295 i!1204)) (= lt!234444 (MissingVacant!4295 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32902 0))(
  ( (array!32903 (arr!15828 (Array (_ BitVec 32) (_ BitVec 64))) (size!16192 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32902)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32902 (_ BitVec 32)) SeekEntryResult!4295)

(assert (=> b!512212 (= lt!234444 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!312874 () Bool)

(assert (=> start!46248 (=> (not res!312874) (not e!299175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46248 (= res!312874 (validMask!0 mask!3524))))

(assert (=> start!46248 e!299175))

(assert (=> start!46248 true))

(declare-fun array_inv!11624 (array!32902) Bool)

(assert (=> start!46248 (array_inv!11624 a!3235)))

(declare-fun b!512213 () Bool)

(assert (=> b!512213 (= e!299173 (not e!299172))))

(declare-fun res!312881 () Bool)

(assert (=> b!512213 (=> res!312881 e!299172)))

(declare-fun lt!234447 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32902 (_ BitVec 32)) SeekEntryResult!4295)

(assert (=> b!512213 (= res!312881 (= lt!234448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234447 (select (store (arr!15828 a!3235) i!1204 k!2280) j!176) (array!32903 (store (arr!15828 a!3235) i!1204 k!2280) (size!16192 a!3235)) mask!3524)))))

(declare-fun lt!234445 () (_ BitVec 32))

(assert (=> b!512213 (= lt!234448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234445 (select (arr!15828 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512213 (= lt!234447 (toIndex!0 (select (store (arr!15828 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512213 (= lt!234445 (toIndex!0 (select (arr!15828 a!3235) j!176) mask!3524))))

(assert (=> b!512213 (= lt!234446 (Found!4295 j!176))))

(assert (=> b!512213 (= lt!234446 (seekEntryOrOpen!0 (select (arr!15828 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32902 (_ BitVec 32)) Bool)

(assert (=> b!512213 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15848 0))(
  ( (Unit!15849) )
))
(declare-fun lt!234443 () Unit!15848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15848)

(assert (=> b!512213 (= lt!234443 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512214 () Bool)

(declare-fun res!312877 () Bool)

(assert (=> b!512214 (=> (not res!312877) (not e!299175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512214 (= res!312877 (validKeyInArray!0 (select (arr!15828 a!3235) j!176)))))

(declare-fun b!512215 () Bool)

(declare-fun res!312872 () Bool)

(assert (=> b!512215 (=> (not res!312872) (not e!299175))))

(assert (=> b!512215 (= res!312872 (validKeyInArray!0 k!2280))))

(declare-fun b!512216 () Bool)

(declare-fun res!312880 () Bool)

(assert (=> b!512216 (=> (not res!312880) (not e!299173))))

(declare-datatypes ((List!9986 0))(
  ( (Nil!9983) (Cons!9982 (h!10862 (_ BitVec 64)) (t!16214 List!9986)) )
))
(declare-fun arrayNoDuplicates!0 (array!32902 (_ BitVec 32) List!9986) Bool)

(assert (=> b!512216 (= res!312880 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9983))))

(declare-fun b!512217 () Bool)

(declare-fun res!312875 () Bool)

(assert (=> b!512217 (=> (not res!312875) (not e!299175))))

(assert (=> b!512217 (= res!312875 (and (= (size!16192 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16192 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16192 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512218 () Bool)

(declare-fun res!312879 () Bool)

(assert (=> b!512218 (=> (not res!312879) (not e!299175))))

(declare-fun arrayContainsKey!0 (array!32902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512218 (= res!312879 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512219 () Bool)

(declare-fun res!312876 () Bool)

(assert (=> b!512219 (=> (not res!312876) (not e!299173))))

(assert (=> b!512219 (= res!312876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46248 res!312874) b!512217))

(assert (= (and b!512217 res!312875) b!512214))

(assert (= (and b!512214 res!312877) b!512215))

(assert (= (and b!512215 res!312872) b!512218))

(assert (= (and b!512218 res!312879) b!512212))

(assert (= (and b!512212 res!312878) b!512219))

(assert (= (and b!512219 res!312876) b!512216))

(assert (= (and b!512216 res!312880) b!512213))

(assert (= (and b!512213 (not res!312881)) b!512211))

(assert (= (and b!512211 (not res!312873)) b!512210))

(declare-fun m!493821 () Bool)

(assert (=> b!512219 m!493821))

(declare-fun m!493823 () Bool)

(assert (=> b!512214 m!493823))

(assert (=> b!512214 m!493823))

(declare-fun m!493825 () Bool)

(assert (=> b!512214 m!493825))

(declare-fun m!493827 () Bool)

(assert (=> b!512213 m!493827))

(declare-fun m!493829 () Bool)

(assert (=> b!512213 m!493829))

(declare-fun m!493831 () Bool)

(assert (=> b!512213 m!493831))

(declare-fun m!493833 () Bool)

(assert (=> b!512213 m!493833))

(assert (=> b!512213 m!493827))

(assert (=> b!512213 m!493823))

(declare-fun m!493835 () Bool)

(assert (=> b!512213 m!493835))

(assert (=> b!512213 m!493823))

(declare-fun m!493837 () Bool)

(assert (=> b!512213 m!493837))

(assert (=> b!512213 m!493823))

(declare-fun m!493839 () Bool)

(assert (=> b!512213 m!493839))

(assert (=> b!512213 m!493827))

(declare-fun m!493841 () Bool)

(assert (=> b!512213 m!493841))

(assert (=> b!512213 m!493823))

(declare-fun m!493843 () Bool)

(assert (=> b!512213 m!493843))

(declare-fun m!493845 () Bool)

(assert (=> start!46248 m!493845))

(declare-fun m!493847 () Bool)

(assert (=> start!46248 m!493847))

(declare-fun m!493849 () Bool)

(assert (=> b!512216 m!493849))

(declare-fun m!493851 () Bool)

(assert (=> b!512215 m!493851))

(declare-fun m!493853 () Bool)

(assert (=> b!512212 m!493853))

(declare-fun m!493855 () Bool)

(assert (=> b!512218 m!493855))

(push 1)

