; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44606 () Bool)

(assert start!44606)

(declare-fun e!287786 () Bool)

(declare-fun b!489269 () Bool)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31665 0))(
  ( (array!31666 (arr!15220 (Array (_ BitVec 32) (_ BitVec 64))) (size!15584 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31665)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489269 (= e!287786 (validKeyInArray!0 (select (store (arr!15220 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun b!489270 () Bool)

(declare-fun e!287787 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3687 0))(
  ( (MissingZero!3687 (index!16927 (_ BitVec 32))) (Found!3687 (index!16928 (_ BitVec 32))) (Intermediate!3687 (undefined!4499 Bool) (index!16929 (_ BitVec 32)) (x!46041 (_ BitVec 32))) (Undefined!3687) (MissingVacant!3687 (index!16930 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31665 (_ BitVec 32)) SeekEntryResult!3687)

(assert (=> b!489270 (= e!287787 (= (seekEntryOrOpen!0 (select (arr!15220 a!3235) j!176) a!3235 mask!3524) (Found!3687 j!176)))))

(declare-fun res!292205 () Bool)

(declare-fun e!287783 () Bool)

(assert (=> start!44606 (=> (not res!292205) (not e!287783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44606 (= res!292205 (validMask!0 mask!3524))))

(assert (=> start!44606 e!287783))

(assert (=> start!44606 true))

(declare-fun array_inv!11016 (array!31665) Bool)

(assert (=> start!44606 (array_inv!11016 a!3235)))

(declare-fun b!489271 () Bool)

(declare-fun e!287785 () Bool)

(assert (=> b!489271 (= e!287785 (not e!287786))))

(declare-fun res!292214 () Bool)

(assert (=> b!489271 (=> res!292214 e!287786)))

(declare-fun lt!220728 () (_ BitVec 32))

(assert (=> b!489271 (= res!292214 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvslt lt!220728 #b00000000000000000000000000000000) (bvsge lt!220728 (bvadd #b00000000000000000000000000000001 mask!3524))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489271 (= lt!220728 (toIndex!0 (select (store (arr!15220 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489271 e!287787))

(declare-fun res!292208 () Bool)

(assert (=> b!489271 (=> (not res!292208) (not e!287787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31665 (_ BitVec 32)) Bool)

(assert (=> b!489271 (= res!292208 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14320 0))(
  ( (Unit!14321) )
))
(declare-fun lt!220727 () Unit!14320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14320)

(assert (=> b!489271 (= lt!220727 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489272 () Bool)

(declare-fun res!292207 () Bool)

(assert (=> b!489272 (=> (not res!292207) (not e!287783))))

(assert (=> b!489272 (= res!292207 (validKeyInArray!0 (select (arr!15220 a!3235) j!176)))))

(declare-fun b!489273 () Bool)

(declare-fun res!292206 () Bool)

(assert (=> b!489273 (=> (not res!292206) (not e!287783))))

(assert (=> b!489273 (= res!292206 (and (= (size!15584 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15584 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15584 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489274 () Bool)

(declare-fun res!292213 () Bool)

(assert (=> b!489274 (=> (not res!292213) (not e!287785))))

(declare-datatypes ((List!9378 0))(
  ( (Nil!9375) (Cons!9374 (h!10236 (_ BitVec 64)) (t!15606 List!9378)) )
))
(declare-fun arrayNoDuplicates!0 (array!31665 (_ BitVec 32) List!9378) Bool)

(assert (=> b!489274 (= res!292213 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9375))))

(declare-fun b!489275 () Bool)

(declare-fun res!292212 () Bool)

(assert (=> b!489275 (=> (not res!292212) (not e!287783))))

(declare-fun arrayContainsKey!0 (array!31665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489275 (= res!292212 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489276 () Bool)

(assert (=> b!489276 (= e!287783 e!287785)))

(declare-fun res!292210 () Bool)

(assert (=> b!489276 (=> (not res!292210) (not e!287785))))

(declare-fun lt!220729 () SeekEntryResult!3687)

(assert (=> b!489276 (= res!292210 (or (= lt!220729 (MissingZero!3687 i!1204)) (= lt!220729 (MissingVacant!3687 i!1204))))))

(assert (=> b!489276 (= lt!220729 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489277 () Bool)

(declare-fun res!292211 () Bool)

(assert (=> b!489277 (=> (not res!292211) (not e!287785))))

(assert (=> b!489277 (= res!292211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489278 () Bool)

(declare-fun res!292209 () Bool)

(assert (=> b!489278 (=> (not res!292209) (not e!287783))))

(assert (=> b!489278 (= res!292209 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44606 res!292205) b!489273))

(assert (= (and b!489273 res!292206) b!489272))

(assert (= (and b!489272 res!292207) b!489278))

(assert (= (and b!489278 res!292209) b!489275))

(assert (= (and b!489275 res!292212) b!489276))

(assert (= (and b!489276 res!292210) b!489277))

(assert (= (and b!489277 res!292211) b!489274))

(assert (= (and b!489274 res!292213) b!489271))

(assert (= (and b!489271 res!292208) b!489270))

(assert (= (and b!489271 (not res!292214)) b!489269))

(declare-fun m!469001 () Bool)

(assert (=> start!44606 m!469001))

(declare-fun m!469003 () Bool)

(assert (=> start!44606 m!469003))

(declare-fun m!469005 () Bool)

(assert (=> b!489275 m!469005))

(declare-fun m!469007 () Bool)

(assert (=> b!489276 m!469007))

(declare-fun m!469009 () Bool)

(assert (=> b!489277 m!469009))

(declare-fun m!469011 () Bool)

(assert (=> b!489271 m!469011))

(declare-fun m!469013 () Bool)

(assert (=> b!489271 m!469013))

(declare-fun m!469015 () Bool)

(assert (=> b!489271 m!469015))

(declare-fun m!469017 () Bool)

(assert (=> b!489271 m!469017))

(assert (=> b!489271 m!469015))

(declare-fun m!469019 () Bool)

(assert (=> b!489271 m!469019))

(declare-fun m!469021 () Bool)

(assert (=> b!489272 m!469021))

(assert (=> b!489272 m!469021))

(declare-fun m!469023 () Bool)

(assert (=> b!489272 m!469023))

(assert (=> b!489270 m!469021))

(assert (=> b!489270 m!469021))

(declare-fun m!469025 () Bool)

(assert (=> b!489270 m!469025))

(assert (=> b!489269 m!469011))

(assert (=> b!489269 m!469015))

(assert (=> b!489269 m!469015))

(declare-fun m!469027 () Bool)

(assert (=> b!489269 m!469027))

(declare-fun m!469029 () Bool)

(assert (=> b!489274 m!469029))

(declare-fun m!469031 () Bool)

(assert (=> b!489278 m!469031))

(check-sat (not b!489277) (not b!489275) (not b!489269) (not b!489274) (not b!489270) (not b!489272) (not b!489271) (not b!489278) (not b!489276) (not start!44606))
(check-sat)
