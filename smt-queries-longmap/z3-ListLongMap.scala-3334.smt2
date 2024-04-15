; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45984 () Bool)

(assert start!45984)

(declare-fun b!508973 () Bool)

(declare-fun res!309961 () Bool)

(declare-fun e!297663 () Bool)

(assert (=> b!508973 (=> (not res!309961) (not e!297663))))

(declare-datatypes ((array!32705 0))(
  ( (array!32706 (arr!15731 (Array (_ BitVec 32) (_ BitVec 64))) (size!16096 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32705)

(declare-datatypes ((List!9928 0))(
  ( (Nil!9925) (Cons!9924 (h!10801 (_ BitVec 64)) (t!16147 List!9928)) )
))
(declare-fun arrayNoDuplicates!0 (array!32705 (_ BitVec 32) List!9928) Bool)

(assert (=> b!508973 (= res!309961 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9925))))

(declare-fun b!508974 () Bool)

(declare-fun e!297660 () Bool)

(assert (=> b!508974 (= e!297660 e!297663)))

(declare-fun res!309960 () Bool)

(assert (=> b!508974 (=> (not res!309960) (not e!297663))))

(declare-datatypes ((SeekEntryResult!4195 0))(
  ( (MissingZero!4195 (index!18968 (_ BitVec 32))) (Found!4195 (index!18969 (_ BitVec 32))) (Intermediate!4195 (undefined!5007 Bool) (index!18970 (_ BitVec 32)) (x!47951 (_ BitVec 32))) (Undefined!4195) (MissingVacant!4195 (index!18971 (_ BitVec 32))) )
))
(declare-fun lt!232353 () SeekEntryResult!4195)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508974 (= res!309960 (or (= lt!232353 (MissingZero!4195 i!1204)) (= lt!232353 (MissingVacant!4195 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32705 (_ BitVec 32)) SeekEntryResult!4195)

(assert (=> b!508974 (= lt!232353 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508975 () Bool)

(declare-fun res!309968 () Bool)

(assert (=> b!508975 (=> (not res!309968) (not e!297660))))

(declare-fun arrayContainsKey!0 (array!32705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508975 (= res!309968 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!309965 () Bool)

(assert (=> start!45984 (=> (not res!309965) (not e!297660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45984 (= res!309965 (validMask!0 mask!3524))))

(assert (=> start!45984 e!297660))

(assert (=> start!45984 true))

(declare-fun array_inv!11614 (array!32705) Bool)

(assert (=> start!45984 (array_inv!11614 a!3235)))

(declare-fun b!508976 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!297662 () Bool)

(assert (=> b!508976 (= e!297662 (= (seekEntryOrOpen!0 (select (arr!15731 a!3235) j!176) a!3235 mask!3524) (Found!4195 j!176)))))

(declare-fun b!508977 () Bool)

(declare-fun res!309966 () Bool)

(assert (=> b!508977 (=> (not res!309966) (not e!297660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508977 (= res!309966 (validKeyInArray!0 k0!2280))))

(declare-fun b!508978 () Bool)

(declare-fun res!309962 () Bool)

(assert (=> b!508978 (=> (not res!309962) (not e!297660))))

(assert (=> b!508978 (= res!309962 (validKeyInArray!0 (select (arr!15731 a!3235) j!176)))))

(declare-fun b!508979 () Bool)

(declare-fun res!309964 () Bool)

(assert (=> b!508979 (=> (not res!309964) (not e!297660))))

(assert (=> b!508979 (= res!309964 (and (= (size!16096 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16096 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16096 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508980 () Bool)

(declare-fun res!309963 () Bool)

(assert (=> b!508980 (=> (not res!309963) (not e!297663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32705 (_ BitVec 32)) Bool)

(assert (=> b!508980 (= res!309963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508981 () Bool)

(assert (=> b!508981 (= e!297663 (not true))))

(declare-fun lt!232355 () (_ BitVec 32))

(declare-fun lt!232357 () SeekEntryResult!4195)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32705 (_ BitVec 32)) SeekEntryResult!4195)

(assert (=> b!508981 (= lt!232357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232355 (select (store (arr!15731 a!3235) i!1204 k0!2280) j!176) (array!32706 (store (arr!15731 a!3235) i!1204 k0!2280) (size!16096 a!3235)) mask!3524))))

(declare-fun lt!232356 () (_ BitVec 32))

(declare-fun lt!232354 () SeekEntryResult!4195)

(assert (=> b!508981 (= lt!232354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232356 (select (arr!15731 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508981 (= lt!232355 (toIndex!0 (select (store (arr!15731 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!508981 (= lt!232356 (toIndex!0 (select (arr!15731 a!3235) j!176) mask!3524))))

(assert (=> b!508981 e!297662))

(declare-fun res!309967 () Bool)

(assert (=> b!508981 (=> (not res!309967) (not e!297662))))

(assert (=> b!508981 (= res!309967 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15634 0))(
  ( (Unit!15635) )
))
(declare-fun lt!232352 () Unit!15634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15634)

(assert (=> b!508981 (= lt!232352 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45984 res!309965) b!508979))

(assert (= (and b!508979 res!309964) b!508978))

(assert (= (and b!508978 res!309962) b!508977))

(assert (= (and b!508977 res!309966) b!508975))

(assert (= (and b!508975 res!309968) b!508974))

(assert (= (and b!508974 res!309960) b!508980))

(assert (= (and b!508980 res!309963) b!508973))

(assert (= (and b!508973 res!309961) b!508981))

(assert (= (and b!508981 res!309967) b!508976))

(declare-fun m!489313 () Bool)

(assert (=> b!508978 m!489313))

(assert (=> b!508978 m!489313))

(declare-fun m!489315 () Bool)

(assert (=> b!508978 m!489315))

(declare-fun m!489317 () Bool)

(assert (=> b!508977 m!489317))

(declare-fun m!489319 () Bool)

(assert (=> b!508973 m!489319))

(declare-fun m!489321 () Bool)

(assert (=> b!508980 m!489321))

(declare-fun m!489323 () Bool)

(assert (=> b!508981 m!489323))

(declare-fun m!489325 () Bool)

(assert (=> b!508981 m!489325))

(declare-fun m!489327 () Bool)

(assert (=> b!508981 m!489327))

(assert (=> b!508981 m!489313))

(declare-fun m!489329 () Bool)

(assert (=> b!508981 m!489329))

(assert (=> b!508981 m!489313))

(declare-fun m!489331 () Bool)

(assert (=> b!508981 m!489331))

(assert (=> b!508981 m!489327))

(declare-fun m!489333 () Bool)

(assert (=> b!508981 m!489333))

(assert (=> b!508981 m!489313))

(declare-fun m!489335 () Bool)

(assert (=> b!508981 m!489335))

(assert (=> b!508981 m!489327))

(declare-fun m!489337 () Bool)

(assert (=> b!508981 m!489337))

(declare-fun m!489339 () Bool)

(assert (=> start!45984 m!489339))

(declare-fun m!489341 () Bool)

(assert (=> start!45984 m!489341))

(declare-fun m!489343 () Bool)

(assert (=> b!508974 m!489343))

(declare-fun m!489345 () Bool)

(assert (=> b!508975 m!489345))

(assert (=> b!508976 m!489313))

(assert (=> b!508976 m!489313))

(declare-fun m!489347 () Bool)

(assert (=> b!508976 m!489347))

(check-sat (not start!45984) (not b!508978) (not b!508981) (not b!508974) (not b!508976) (not b!508975) (not b!508977) (not b!508973) (not b!508980))
(check-sat)
