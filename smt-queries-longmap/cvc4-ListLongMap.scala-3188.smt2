; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44758 () Bool)

(assert start!44758)

(declare-fun b!491334 () Bool)

(declare-fun res!294278 () Bool)

(declare-fun e!288711 () Bool)

(assert (=> b!491334 (=> (not res!294278) (not e!288711))))

(declare-datatypes ((array!31817 0))(
  ( (array!31818 (arr!15296 (Array (_ BitVec 32) (_ BitVec 64))) (size!15660 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31817)

(declare-datatypes ((List!9454 0))(
  ( (Nil!9451) (Cons!9450 (h!10312 (_ BitVec 64)) (t!15682 List!9454)) )
))
(declare-fun arrayNoDuplicates!0 (array!31817 (_ BitVec 32) List!9454) Bool)

(assert (=> b!491334 (= res!294278 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9451))))

(declare-fun b!491335 () Bool)

(declare-fun res!294274 () Bool)

(assert (=> b!491335 (=> (not res!294274) (not e!288711))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31817 (_ BitVec 32)) Bool)

(assert (=> b!491335 (= res!294274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!294276 () Bool)

(declare-fun e!288709 () Bool)

(assert (=> start!44758 (=> (not res!294276) (not e!288709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44758 (= res!294276 (validMask!0 mask!3524))))

(assert (=> start!44758 e!288709))

(assert (=> start!44758 true))

(declare-fun array_inv!11092 (array!31817) Bool)

(assert (=> start!44758 (array_inv!11092 a!3235)))

(declare-fun b!491336 () Bool)

(declare-fun res!294272 () Bool)

(assert (=> b!491336 (=> (not res!294272) (not e!288709))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491336 (= res!294272 (and (= (size!15660 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15660 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15660 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491337 () Bool)

(declare-fun e!288710 () Bool)

(assert (=> b!491337 (= e!288711 (not e!288710))))

(declare-fun res!294270 () Bool)

(assert (=> b!491337 (=> res!294270 e!288710)))

(declare-fun lt!222085 () (_ BitVec 64))

(declare-fun lt!222088 () array!31817)

(declare-datatypes ((SeekEntryResult!3763 0))(
  ( (MissingZero!3763 (index!17231 (_ BitVec 32))) (Found!3763 (index!17232 (_ BitVec 32))) (Intermediate!3763 (undefined!4575 Bool) (index!17233 (_ BitVec 32)) (x!46317 (_ BitVec 32))) (Undefined!3763) (MissingVacant!3763 (index!17234 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31817 (_ BitVec 32)) SeekEntryResult!3763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491337 (= res!294270 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15296 a!3235) j!176) mask!3524) (select (arr!15296 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222085 mask!3524) lt!222085 lt!222088 mask!3524))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!491337 (= lt!222085 (select (store (arr!15296 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491337 (= lt!222088 (array!31818 (store (arr!15296 a!3235) i!1204 k!2280) (size!15660 a!3235)))))

(declare-fun lt!222087 () SeekEntryResult!3763)

(assert (=> b!491337 (= lt!222087 (Found!3763 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31817 (_ BitVec 32)) SeekEntryResult!3763)

(assert (=> b!491337 (= lt!222087 (seekEntryOrOpen!0 (select (arr!15296 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491337 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14472 0))(
  ( (Unit!14473) )
))
(declare-fun lt!222083 () Unit!14472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14472)

(assert (=> b!491337 (= lt!222083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491338 () Bool)

(declare-fun res!294271 () Bool)

(assert (=> b!491338 (=> (not res!294271) (not e!288709))))

(declare-fun arrayContainsKey!0 (array!31817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491338 (= res!294271 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491339 () Bool)

(declare-fun res!294275 () Bool)

(assert (=> b!491339 (=> (not res!294275) (not e!288709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491339 (= res!294275 (validKeyInArray!0 (select (arr!15296 a!3235) j!176)))))

(declare-fun b!491340 () Bool)

(assert (=> b!491340 (= e!288710 true)))

(assert (=> b!491340 (= lt!222087 (seekEntryOrOpen!0 lt!222085 lt!222088 mask!3524))))

(declare-fun lt!222084 () Unit!14472)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14472)

(assert (=> b!491340 (= lt!222084 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491341 () Bool)

(declare-fun res!294277 () Bool)

(assert (=> b!491341 (=> (not res!294277) (not e!288709))))

(assert (=> b!491341 (= res!294277 (validKeyInArray!0 k!2280))))

(declare-fun b!491342 () Bool)

(assert (=> b!491342 (= e!288709 e!288711)))

(declare-fun res!294273 () Bool)

(assert (=> b!491342 (=> (not res!294273) (not e!288711))))

(declare-fun lt!222086 () SeekEntryResult!3763)

(assert (=> b!491342 (= res!294273 (or (= lt!222086 (MissingZero!3763 i!1204)) (= lt!222086 (MissingVacant!3763 i!1204))))))

(assert (=> b!491342 (= lt!222086 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44758 res!294276) b!491336))

(assert (= (and b!491336 res!294272) b!491339))

(assert (= (and b!491339 res!294275) b!491341))

(assert (= (and b!491341 res!294277) b!491338))

(assert (= (and b!491338 res!294271) b!491342))

(assert (= (and b!491342 res!294273) b!491335))

(assert (= (and b!491335 res!294274) b!491334))

(assert (= (and b!491334 res!294278) b!491337))

(assert (= (and b!491337 (not res!294270)) b!491340))

(declare-fun m!471863 () Bool)

(assert (=> b!491337 m!471863))

(declare-fun m!471865 () Bool)

(assert (=> b!491337 m!471865))

(declare-fun m!471867 () Bool)

(assert (=> b!491337 m!471867))

(declare-fun m!471869 () Bool)

(assert (=> b!491337 m!471869))

(declare-fun m!471871 () Bool)

(assert (=> b!491337 m!471871))

(declare-fun m!471873 () Bool)

(assert (=> b!491337 m!471873))

(declare-fun m!471875 () Bool)

(assert (=> b!491337 m!471875))

(declare-fun m!471877 () Bool)

(assert (=> b!491337 m!471877))

(assert (=> b!491337 m!471871))

(assert (=> b!491337 m!471869))

(assert (=> b!491337 m!471871))

(assert (=> b!491337 m!471871))

(declare-fun m!471879 () Bool)

(assert (=> b!491337 m!471879))

(assert (=> b!491337 m!471875))

(declare-fun m!471881 () Bool)

(assert (=> b!491337 m!471881))

(declare-fun m!471883 () Bool)

(assert (=> start!44758 m!471883))

(declare-fun m!471885 () Bool)

(assert (=> start!44758 m!471885))

(declare-fun m!471887 () Bool)

(assert (=> b!491335 m!471887))

(assert (=> b!491339 m!471871))

(assert (=> b!491339 m!471871))

(declare-fun m!471889 () Bool)

(assert (=> b!491339 m!471889))

(declare-fun m!471891 () Bool)

(assert (=> b!491334 m!471891))

(declare-fun m!471893 () Bool)

(assert (=> b!491338 m!471893))

(declare-fun m!471895 () Bool)

(assert (=> b!491342 m!471895))

(declare-fun m!471897 () Bool)

(assert (=> b!491341 m!471897))

(declare-fun m!471899 () Bool)

(assert (=> b!491340 m!471899))

(declare-fun m!471901 () Bool)

(assert (=> b!491340 m!471901))

(push 1)

(assert (not b!491341))

(assert (not b!491335))

(assert (not start!44758))

(assert (not b!491338))

(assert (not b!491340))

(assert (not b!491334))

(assert (not b!491342))

(assert (not b!491339))

(assert (not b!491337))

(check-sat)

