; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44996 () Bool)

(assert start!44996)

(declare-fun b!493586 () Bool)

(declare-fun e!289842 () Bool)

(declare-fun e!289844 () Bool)

(assert (=> b!493586 (= e!289842 e!289844)))

(declare-fun res!296162 () Bool)

(assert (=> b!493586 (=> (not res!296162) (not e!289844))))

(declare-datatypes ((SeekEntryResult!3822 0))(
  ( (MissingZero!3822 (index!17467 (_ BitVec 32))) (Found!3822 (index!17468 (_ BitVec 32))) (Intermediate!3822 (undefined!4634 Bool) (index!17469 (_ BitVec 32)) (x!46548 (_ BitVec 32))) (Undefined!3822) (MissingVacant!3822 (index!17470 (_ BitVec 32))) )
))
(declare-fun lt!223262 () SeekEntryResult!3822)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493586 (= res!296162 (or (= lt!223262 (MissingZero!3822 i!1204)) (= lt!223262 (MissingVacant!3822 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31941 0))(
  ( (array!31942 (arr!15355 (Array (_ BitVec 32) (_ BitVec 64))) (size!15719 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31941)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31941 (_ BitVec 32)) SeekEntryResult!3822)

(assert (=> b!493586 (= lt!223262 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493587 () Bool)

(declare-fun res!296165 () Bool)

(assert (=> b!493587 (=> (not res!296165) (not e!289844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31941 (_ BitVec 32)) Bool)

(assert (=> b!493587 (= res!296165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!296161 () Bool)

(assert (=> start!44996 (=> (not res!296161) (not e!289842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44996 (= res!296161 (validMask!0 mask!3524))))

(assert (=> start!44996 e!289842))

(assert (=> start!44996 true))

(declare-fun array_inv!11151 (array!31941) Bool)

(assert (=> start!44996 (array_inv!11151 a!3235)))

(declare-fun b!493588 () Bool)

(declare-fun res!296156 () Bool)

(assert (=> b!493588 (=> (not res!296156) (not e!289844))))

(declare-datatypes ((List!9513 0))(
  ( (Nil!9510) (Cons!9509 (h!10377 (_ BitVec 64)) (t!15741 List!9513)) )
))
(declare-fun arrayNoDuplicates!0 (array!31941 (_ BitVec 32) List!9513) Bool)

(assert (=> b!493588 (= res!296156 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9510))))

(declare-fun b!493589 () Bool)

(declare-fun e!289845 () Bool)

(assert (=> b!493589 (= e!289845 true)))

(declare-fun lt!223264 () SeekEntryResult!3822)

(assert (=> b!493589 (= lt!223264 Undefined!3822)))

(declare-fun b!493590 () Bool)

(declare-fun res!296160 () Bool)

(assert (=> b!493590 (=> res!296160 e!289845)))

(declare-fun lt!223259 () SeekEntryResult!3822)

(get-info :version)

(assert (=> b!493590 (= res!296160 (or (not ((_ is Intermediate!3822) lt!223259)) (not (undefined!4634 lt!223259))))))

(declare-fun b!493591 () Bool)

(declare-fun res!296159 () Bool)

(assert (=> b!493591 (=> (not res!296159) (not e!289842))))

(declare-fun arrayContainsKey!0 (array!31941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493591 (= res!296159 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493592 () Bool)

(declare-fun res!296164 () Bool)

(assert (=> b!493592 (=> (not res!296164) (not e!289842))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493592 (= res!296164 (and (= (size!15719 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15719 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15719 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493593 () Bool)

(declare-fun res!296157 () Bool)

(assert (=> b!493593 (=> (not res!296157) (not e!289842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493593 (= res!296157 (validKeyInArray!0 (select (arr!15355 a!3235) j!176)))))

(declare-fun b!493594 () Bool)

(assert (=> b!493594 (= e!289844 (not e!289845))))

(declare-fun res!296163 () Bool)

(assert (=> b!493594 (=> res!296163 e!289845)))

(declare-fun lt!223261 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31941 (_ BitVec 32)) SeekEntryResult!3822)

(assert (=> b!493594 (= res!296163 (= lt!223259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223261 (select (store (arr!15355 a!3235) i!1204 k0!2280) j!176) (array!31942 (store (arr!15355 a!3235) i!1204 k0!2280) (size!15719 a!3235)) mask!3524)))))

(declare-fun lt!223260 () (_ BitVec 32))

(assert (=> b!493594 (= lt!223259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223260 (select (arr!15355 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493594 (= lt!223261 (toIndex!0 (select (store (arr!15355 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493594 (= lt!223260 (toIndex!0 (select (arr!15355 a!3235) j!176) mask!3524))))

(assert (=> b!493594 (= lt!223264 (Found!3822 j!176))))

(assert (=> b!493594 (= lt!223264 (seekEntryOrOpen!0 (select (arr!15355 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493594 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14590 0))(
  ( (Unit!14591) )
))
(declare-fun lt!223263 () Unit!14590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14590)

(assert (=> b!493594 (= lt!223263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493595 () Bool)

(declare-fun res!296158 () Bool)

(assert (=> b!493595 (=> (not res!296158) (not e!289842))))

(assert (=> b!493595 (= res!296158 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44996 res!296161) b!493592))

(assert (= (and b!493592 res!296164) b!493593))

(assert (= (and b!493593 res!296157) b!493595))

(assert (= (and b!493595 res!296158) b!493591))

(assert (= (and b!493591 res!296159) b!493586))

(assert (= (and b!493586 res!296162) b!493587))

(assert (= (and b!493587 res!296165) b!493588))

(assert (= (and b!493588 res!296156) b!493594))

(assert (= (and b!493594 (not res!296163)) b!493590))

(assert (= (and b!493590 (not res!296160)) b!493589))

(declare-fun m!474459 () Bool)

(assert (=> b!493587 m!474459))

(declare-fun m!474461 () Bool)

(assert (=> b!493593 m!474461))

(assert (=> b!493593 m!474461))

(declare-fun m!474463 () Bool)

(assert (=> b!493593 m!474463))

(declare-fun m!474465 () Bool)

(assert (=> b!493586 m!474465))

(declare-fun m!474467 () Bool)

(assert (=> b!493594 m!474467))

(declare-fun m!474469 () Bool)

(assert (=> b!493594 m!474469))

(declare-fun m!474471 () Bool)

(assert (=> b!493594 m!474471))

(declare-fun m!474473 () Bool)

(assert (=> b!493594 m!474473))

(assert (=> b!493594 m!474467))

(assert (=> b!493594 m!474461))

(declare-fun m!474475 () Bool)

(assert (=> b!493594 m!474475))

(assert (=> b!493594 m!474461))

(declare-fun m!474477 () Bool)

(assert (=> b!493594 m!474477))

(assert (=> b!493594 m!474461))

(declare-fun m!474479 () Bool)

(assert (=> b!493594 m!474479))

(assert (=> b!493594 m!474461))

(declare-fun m!474481 () Bool)

(assert (=> b!493594 m!474481))

(assert (=> b!493594 m!474467))

(declare-fun m!474483 () Bool)

(assert (=> b!493594 m!474483))

(declare-fun m!474485 () Bool)

(assert (=> start!44996 m!474485))

(declare-fun m!474487 () Bool)

(assert (=> start!44996 m!474487))

(declare-fun m!474489 () Bool)

(assert (=> b!493595 m!474489))

(declare-fun m!474491 () Bool)

(assert (=> b!493591 m!474491))

(declare-fun m!474493 () Bool)

(assert (=> b!493588 m!474493))

(check-sat (not b!493586) (not b!493591) (not b!493593) (not b!493587) (not b!493594) (not start!44996) (not b!493588) (not b!493595))
(check-sat)
