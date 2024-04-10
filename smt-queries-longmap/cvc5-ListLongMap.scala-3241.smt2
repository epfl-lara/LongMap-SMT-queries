; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45252 () Bool)

(assert start!45252)

(declare-fun b!496981 () Bool)

(declare-fun res!299373 () Bool)

(declare-fun e!291368 () Bool)

(assert (=> b!496981 (=> (not res!299373) (not e!291368))))

(declare-datatypes ((array!32140 0))(
  ( (array!32141 (arr!15453 (Array (_ BitVec 32) (_ BitVec 64))) (size!15817 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32140)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496981 (= res!299373 (validKeyInArray!0 (select (arr!15453 a!3235) j!176)))))

(declare-fun b!496982 () Bool)

(declare-fun res!299375 () Bool)

(assert (=> b!496982 (=> (not res!299375) (not e!291368))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496982 (= res!299375 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496983 () Bool)

(declare-fun res!299376 () Bool)

(declare-fun e!291370 () Bool)

(assert (=> b!496983 (=> res!299376 e!291370)))

(declare-datatypes ((SeekEntryResult!3920 0))(
  ( (MissingZero!3920 (index!17859 (_ BitVec 32))) (Found!3920 (index!17860 (_ BitVec 32))) (Intermediate!3920 (undefined!4732 Bool) (index!17861 (_ BitVec 32)) (x!46916 (_ BitVec 32))) (Undefined!3920) (MissingVacant!3920 (index!17862 (_ BitVec 32))) )
))
(declare-fun lt!224992 () SeekEntryResult!3920)

(assert (=> b!496983 (= res!299376 (or (undefined!4732 lt!224992) (not (is-Intermediate!3920 lt!224992))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!496984 () Bool)

(declare-fun e!291371 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32140 (_ BitVec 32)) SeekEntryResult!3920)

(assert (=> b!496984 (= e!291371 (= (seekEntryOrOpen!0 (select (arr!15453 a!3235) j!176) a!3235 mask!3524) (Found!3920 j!176)))))

(declare-fun b!496985 () Bool)

(declare-fun res!299369 () Bool)

(assert (=> b!496985 (=> (not res!299369) (not e!291368))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496985 (= res!299369 (and (= (size!15817 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15817 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15817 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496986 () Bool)

(declare-fun e!291369 () Bool)

(assert (=> b!496986 (= e!291369 (not e!291370))))

(declare-fun res!299377 () Bool)

(assert (=> b!496986 (=> res!299377 e!291370)))

(declare-fun lt!224991 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32140 (_ BitVec 32)) SeekEntryResult!3920)

(assert (=> b!496986 (= res!299377 (= lt!224992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224991 (select (store (arr!15453 a!3235) i!1204 k!2280) j!176) (array!32141 (store (arr!15453 a!3235) i!1204 k!2280) (size!15817 a!3235)) mask!3524)))))

(declare-fun lt!224989 () (_ BitVec 32))

(assert (=> b!496986 (= lt!224992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224989 (select (arr!15453 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496986 (= lt!224991 (toIndex!0 (select (store (arr!15453 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496986 (= lt!224989 (toIndex!0 (select (arr!15453 a!3235) j!176) mask!3524))))

(assert (=> b!496986 e!291371))

(declare-fun res!299370 () Bool)

(assert (=> b!496986 (=> (not res!299370) (not e!291371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32140 (_ BitVec 32)) Bool)

(assert (=> b!496986 (= res!299370 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14786 0))(
  ( (Unit!14787) )
))
(declare-fun lt!224990 () Unit!14786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14786)

(assert (=> b!496986 (= lt!224990 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496987 () Bool)

(assert (=> b!496987 (= e!291370 true)))

(assert (=> b!496987 (and (bvslt (x!46916 lt!224992) #b01111111111111111111111111111110) (or (= (select (arr!15453 a!3235) (index!17861 lt!224992)) (select (arr!15453 a!3235) j!176)) (= (select (arr!15453 a!3235) (index!17861 lt!224992)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15453 a!3235) (index!17861 lt!224992)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496988 () Bool)

(declare-fun res!299371 () Bool)

(assert (=> b!496988 (=> (not res!299371) (not e!291369))))

(assert (=> b!496988 (= res!299371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496989 () Bool)

(declare-fun res!299378 () Bool)

(assert (=> b!496989 (=> (not res!299378) (not e!291368))))

(assert (=> b!496989 (= res!299378 (validKeyInArray!0 k!2280))))

(declare-fun res!299368 () Bool)

(assert (=> start!45252 (=> (not res!299368) (not e!291368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45252 (= res!299368 (validMask!0 mask!3524))))

(assert (=> start!45252 e!291368))

(assert (=> start!45252 true))

(declare-fun array_inv!11249 (array!32140) Bool)

(assert (=> start!45252 (array_inv!11249 a!3235)))

(declare-fun b!496990 () Bool)

(declare-fun res!299372 () Bool)

(assert (=> b!496990 (=> (not res!299372) (not e!291369))))

(declare-datatypes ((List!9611 0))(
  ( (Nil!9608) (Cons!9607 (h!10478 (_ BitVec 64)) (t!15839 List!9611)) )
))
(declare-fun arrayNoDuplicates!0 (array!32140 (_ BitVec 32) List!9611) Bool)

(assert (=> b!496990 (= res!299372 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9608))))

(declare-fun b!496991 () Bool)

(assert (=> b!496991 (= e!291368 e!291369)))

(declare-fun res!299374 () Bool)

(assert (=> b!496991 (=> (not res!299374) (not e!291369))))

(declare-fun lt!224988 () SeekEntryResult!3920)

(assert (=> b!496991 (= res!299374 (or (= lt!224988 (MissingZero!3920 i!1204)) (= lt!224988 (MissingVacant!3920 i!1204))))))

(assert (=> b!496991 (= lt!224988 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45252 res!299368) b!496985))

(assert (= (and b!496985 res!299369) b!496981))

(assert (= (and b!496981 res!299373) b!496989))

(assert (= (and b!496989 res!299378) b!496982))

(assert (= (and b!496982 res!299375) b!496991))

(assert (= (and b!496991 res!299374) b!496988))

(assert (= (and b!496988 res!299371) b!496990))

(assert (= (and b!496990 res!299372) b!496986))

(assert (= (and b!496986 res!299370) b!496984))

(assert (= (and b!496986 (not res!299377)) b!496983))

(assert (= (and b!496983 (not res!299376)) b!496987))

(declare-fun m!478299 () Bool)

(assert (=> b!496982 m!478299))

(declare-fun m!478301 () Bool)

(assert (=> b!496986 m!478301))

(declare-fun m!478303 () Bool)

(assert (=> b!496986 m!478303))

(declare-fun m!478305 () Bool)

(assert (=> b!496986 m!478305))

(declare-fun m!478307 () Bool)

(assert (=> b!496986 m!478307))

(declare-fun m!478309 () Bool)

(assert (=> b!496986 m!478309))

(assert (=> b!496986 m!478301))

(declare-fun m!478311 () Bool)

(assert (=> b!496986 m!478311))

(assert (=> b!496986 m!478309))

(declare-fun m!478313 () Bool)

(assert (=> b!496986 m!478313))

(assert (=> b!496986 m!478301))

(declare-fun m!478315 () Bool)

(assert (=> b!496986 m!478315))

(assert (=> b!496986 m!478309))

(declare-fun m!478317 () Bool)

(assert (=> b!496986 m!478317))

(declare-fun m!478319 () Bool)

(assert (=> b!496987 m!478319))

(assert (=> b!496987 m!478301))

(assert (=> b!496984 m!478301))

(assert (=> b!496984 m!478301))

(declare-fun m!478321 () Bool)

(assert (=> b!496984 m!478321))

(declare-fun m!478323 () Bool)

(assert (=> b!496988 m!478323))

(declare-fun m!478325 () Bool)

(assert (=> b!496990 m!478325))

(assert (=> b!496981 m!478301))

(assert (=> b!496981 m!478301))

(declare-fun m!478327 () Bool)

(assert (=> b!496981 m!478327))

(declare-fun m!478329 () Bool)

(assert (=> b!496989 m!478329))

(declare-fun m!478331 () Bool)

(assert (=> start!45252 m!478331))

(declare-fun m!478333 () Bool)

(assert (=> start!45252 m!478333))

(declare-fun m!478335 () Bool)

(assert (=> b!496991 m!478335))

(push 1)

