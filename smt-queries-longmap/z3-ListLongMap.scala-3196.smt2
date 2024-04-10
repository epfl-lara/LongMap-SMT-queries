; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44864 () Bool)

(assert start!44864)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!289199 () Bool)

(declare-datatypes ((array!31866 0))(
  ( (array!31867 (arr!15319 (Array (_ BitVec 32) (_ BitVec 64))) (size!15683 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31866)

(declare-fun b!492273 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3786 0))(
  ( (MissingZero!3786 (index!17323 (_ BitVec 32))) (Found!3786 (index!17324 (_ BitVec 32))) (Intermediate!3786 (undefined!4598 Bool) (index!17325 (_ BitVec 32)) (x!46410 (_ BitVec 32))) (Undefined!3786) (MissingVacant!3786 (index!17326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31866 (_ BitVec 32)) SeekEntryResult!3786)

(assert (=> b!492273 (= e!289199 (= (seekEntryOrOpen!0 (select (arr!15319 a!3235) j!176) a!3235 mask!3524) (Found!3786 j!176)))))

(declare-fun b!492274 () Bool)

(declare-fun res!295026 () Bool)

(declare-fun e!289197 () Bool)

(assert (=> b!492274 (=> (not res!295026) (not e!289197))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492274 (= res!295026 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492275 () Bool)

(declare-fun res!295032 () Bool)

(declare-fun e!289200 () Bool)

(assert (=> b!492275 (=> (not res!295032) (not e!289200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31866 (_ BitVec 32)) Bool)

(assert (=> b!492275 (= res!295032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492276 () Bool)

(declare-fun res!295028 () Bool)

(assert (=> b!492276 (=> (not res!295028) (not e!289197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492276 (= res!295028 (validKeyInArray!0 (select (arr!15319 a!3235) j!176)))))

(declare-fun b!492277 () Bool)

(declare-fun res!295029 () Bool)

(assert (=> b!492277 (=> (not res!295029) (not e!289197))))

(assert (=> b!492277 (= res!295029 (validKeyInArray!0 k0!2280))))

(declare-fun b!492278 () Bool)

(assert (=> b!492278 (= e!289197 e!289200)))

(declare-fun res!295027 () Bool)

(assert (=> b!492278 (=> (not res!295027) (not e!289200))))

(declare-fun lt!222558 () SeekEntryResult!3786)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492278 (= res!295027 (or (= lt!222558 (MissingZero!3786 i!1204)) (= lt!222558 (MissingVacant!3786 i!1204))))))

(assert (=> b!492278 (= lt!222558 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492280 () Bool)

(assert (=> b!492280 (= e!289200 (not true))))

(declare-fun lt!222556 () SeekEntryResult!3786)

(declare-fun lt!222557 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31866 (_ BitVec 32)) SeekEntryResult!3786)

(assert (=> b!492280 (= lt!222556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222557 (select (store (arr!15319 a!3235) i!1204 k0!2280) j!176) (array!31867 (store (arr!15319 a!3235) i!1204 k0!2280) (size!15683 a!3235)) mask!3524))))

(declare-fun lt!222554 () (_ BitVec 32))

(declare-fun lt!222559 () SeekEntryResult!3786)

(assert (=> b!492280 (= lt!222559 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222554 (select (arr!15319 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492280 (= lt!222557 (toIndex!0 (select (store (arr!15319 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492280 (= lt!222554 (toIndex!0 (select (arr!15319 a!3235) j!176) mask!3524))))

(assert (=> b!492280 e!289199))

(declare-fun res!295031 () Bool)

(assert (=> b!492280 (=> (not res!295031) (not e!289199))))

(assert (=> b!492280 (= res!295031 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14518 0))(
  ( (Unit!14519) )
))
(declare-fun lt!222555 () Unit!14518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14518)

(assert (=> b!492280 (= lt!222555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492281 () Bool)

(declare-fun res!295030 () Bool)

(assert (=> b!492281 (=> (not res!295030) (not e!289200))))

(declare-datatypes ((List!9477 0))(
  ( (Nil!9474) (Cons!9473 (h!10338 (_ BitVec 64)) (t!15705 List!9477)) )
))
(declare-fun arrayNoDuplicates!0 (array!31866 (_ BitVec 32) List!9477) Bool)

(assert (=> b!492281 (= res!295030 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9474))))

(declare-fun b!492279 () Bool)

(declare-fun res!295034 () Bool)

(assert (=> b!492279 (=> (not res!295034) (not e!289197))))

(assert (=> b!492279 (= res!295034 (and (= (size!15683 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15683 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15683 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!295033 () Bool)

(assert (=> start!44864 (=> (not res!295033) (not e!289197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44864 (= res!295033 (validMask!0 mask!3524))))

(assert (=> start!44864 e!289197))

(assert (=> start!44864 true))

(declare-fun array_inv!11115 (array!31866) Bool)

(assert (=> start!44864 (array_inv!11115 a!3235)))

(assert (= (and start!44864 res!295033) b!492279))

(assert (= (and b!492279 res!295034) b!492276))

(assert (= (and b!492276 res!295028) b!492277))

(assert (= (and b!492277 res!295029) b!492274))

(assert (= (and b!492274 res!295026) b!492278))

(assert (= (and b!492278 res!295027) b!492275))

(assert (= (and b!492275 res!295032) b!492281))

(assert (= (and b!492281 res!295030) b!492280))

(assert (= (and b!492280 res!295031) b!492273))

(declare-fun m!472959 () Bool)

(assert (=> b!492277 m!472959))

(declare-fun m!472961 () Bool)

(assert (=> b!492280 m!472961))

(declare-fun m!472963 () Bool)

(assert (=> b!492280 m!472963))

(declare-fun m!472965 () Bool)

(assert (=> b!492280 m!472965))

(declare-fun m!472967 () Bool)

(assert (=> b!492280 m!472967))

(assert (=> b!492280 m!472965))

(declare-fun m!472969 () Bool)

(assert (=> b!492280 m!472969))

(declare-fun m!472971 () Bool)

(assert (=> b!492280 m!472971))

(declare-fun m!472973 () Bool)

(assert (=> b!492280 m!472973))

(assert (=> b!492280 m!472971))

(declare-fun m!472975 () Bool)

(assert (=> b!492280 m!472975))

(assert (=> b!492280 m!472965))

(declare-fun m!472977 () Bool)

(assert (=> b!492280 m!472977))

(assert (=> b!492280 m!472971))

(declare-fun m!472979 () Bool)

(assert (=> b!492278 m!472979))

(assert (=> b!492276 m!472965))

(assert (=> b!492276 m!472965))

(declare-fun m!472981 () Bool)

(assert (=> b!492276 m!472981))

(declare-fun m!472983 () Bool)

(assert (=> b!492281 m!472983))

(declare-fun m!472985 () Bool)

(assert (=> start!44864 m!472985))

(declare-fun m!472987 () Bool)

(assert (=> start!44864 m!472987))

(assert (=> b!492273 m!472965))

(assert (=> b!492273 m!472965))

(declare-fun m!472989 () Bool)

(assert (=> b!492273 m!472989))

(declare-fun m!472991 () Bool)

(assert (=> b!492275 m!472991))

(declare-fun m!472993 () Bool)

(assert (=> b!492274 m!472993))

(check-sat (not b!492277) (not b!492273) (not b!492275) (not b!492278) (not start!44864) (not b!492281) (not b!492276) (not b!492280) (not b!492274))
(check-sat)
