; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44966 () Bool)

(assert start!44966)

(declare-fun b!493232 () Bool)

(declare-fun res!295863 () Bool)

(declare-fun e!289683 () Bool)

(assert (=> b!493232 (=> (not res!295863) (not e!289683))))

(declare-datatypes ((array!31912 0))(
  ( (array!31913 (arr!15340 (Array (_ BitVec 32) (_ BitVec 64))) (size!15704 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31912)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493232 (= res!295863 (validKeyInArray!0 (select (arr!15340 a!3235) j!176)))))

(declare-fun b!493233 () Bool)

(declare-fun e!289686 () Bool)

(assert (=> b!493233 (= e!289686 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223095 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3763 0))(
  ( (MissingZero!3763 (index!17231 (_ BitVec 32))) (Found!3763 (index!17232 (_ BitVec 32))) (Intermediate!3763 (undefined!4575 Bool) (index!17233 (_ BitVec 32)) (x!46462 (_ BitVec 32))) (Undefined!3763) (MissingVacant!3763 (index!17234 (_ BitVec 32))) )
))
(declare-fun lt!223092 () SeekEntryResult!3763)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31912 (_ BitVec 32)) SeekEntryResult!3763)

(assert (=> b!493233 (= lt!223092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223095 (select (store (arr!15340 a!3235) i!1204 k0!2280) j!176) (array!31913 (store (arr!15340 a!3235) i!1204 k0!2280) (size!15704 a!3235)) mask!3524))))

(declare-fun lt!223096 () (_ BitVec 32))

(declare-fun lt!223093 () SeekEntryResult!3763)

(assert (=> b!493233 (= lt!223093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223096 (select (arr!15340 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493233 (= lt!223095 (toIndex!0 (select (store (arr!15340 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493233 (= lt!223096 (toIndex!0 (select (arr!15340 a!3235) j!176) mask!3524))))

(declare-fun e!289684 () Bool)

(assert (=> b!493233 e!289684))

(declare-fun res!295861 () Bool)

(assert (=> b!493233 (=> (not res!295861) (not e!289684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31912 (_ BitVec 32)) Bool)

(assert (=> b!493233 (= res!295861 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14533 0))(
  ( (Unit!14534) )
))
(declare-fun lt!223091 () Unit!14533)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14533)

(assert (=> b!493233 (= lt!223091 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493234 () Bool)

(declare-fun res!295859 () Bool)

(assert (=> b!493234 (=> (not res!295859) (not e!289686))))

(declare-datatypes ((List!9405 0))(
  ( (Nil!9402) (Cons!9401 (h!10269 (_ BitVec 64)) (t!15625 List!9405)) )
))
(declare-fun arrayNoDuplicates!0 (array!31912 (_ BitVec 32) List!9405) Bool)

(assert (=> b!493234 (= res!295859 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9402))))

(declare-fun b!493235 () Bool)

(declare-fun res!295862 () Bool)

(assert (=> b!493235 (=> (not res!295862) (not e!289683))))

(assert (=> b!493235 (= res!295862 (and (= (size!15704 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15704 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15704 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493236 () Bool)

(assert (=> b!493236 (= e!289683 e!289686)))

(declare-fun res!295856 () Bool)

(assert (=> b!493236 (=> (not res!295856) (not e!289686))))

(declare-fun lt!223094 () SeekEntryResult!3763)

(assert (=> b!493236 (= res!295856 (or (= lt!223094 (MissingZero!3763 i!1204)) (= lt!223094 (MissingVacant!3763 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31912 (_ BitVec 32)) SeekEntryResult!3763)

(assert (=> b!493236 (= lt!223094 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493237 () Bool)

(declare-fun res!295860 () Bool)

(assert (=> b!493237 (=> (not res!295860) (not e!289683))))

(declare-fun arrayContainsKey!0 (array!31912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493237 (= res!295860 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493238 () Bool)

(declare-fun res!295864 () Bool)

(assert (=> b!493238 (=> (not res!295864) (not e!289686))))

(assert (=> b!493238 (= res!295864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493239 () Bool)

(declare-fun res!295858 () Bool)

(assert (=> b!493239 (=> (not res!295858) (not e!289683))))

(assert (=> b!493239 (= res!295858 (validKeyInArray!0 k0!2280))))

(declare-fun b!493240 () Bool)

(assert (=> b!493240 (= e!289684 (= (seekEntryOrOpen!0 (select (arr!15340 a!3235) j!176) a!3235 mask!3524) (Found!3763 j!176)))))

(declare-fun res!295857 () Bool)

(assert (=> start!44966 (=> (not res!295857) (not e!289683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44966 (= res!295857 (validMask!0 mask!3524))))

(assert (=> start!44966 e!289683))

(assert (=> start!44966 true))

(declare-fun array_inv!11199 (array!31912) Bool)

(assert (=> start!44966 (array_inv!11199 a!3235)))

(assert (= (and start!44966 res!295857) b!493235))

(assert (= (and b!493235 res!295862) b!493232))

(assert (= (and b!493232 res!295863) b!493239))

(assert (= (and b!493239 res!295858) b!493237))

(assert (= (and b!493237 res!295860) b!493236))

(assert (= (and b!493236 res!295856) b!493238))

(assert (= (and b!493238 res!295864) b!493234))

(assert (= (and b!493234 res!295859) b!493233))

(assert (= (and b!493233 res!295861) b!493240))

(declare-fun m!474283 () Bool)

(assert (=> start!44966 m!474283))

(declare-fun m!474285 () Bool)

(assert (=> start!44966 m!474285))

(declare-fun m!474287 () Bool)

(assert (=> b!493234 m!474287))

(declare-fun m!474289 () Bool)

(assert (=> b!493236 m!474289))

(declare-fun m!474291 () Bool)

(assert (=> b!493237 m!474291))

(declare-fun m!474293 () Bool)

(assert (=> b!493233 m!474293))

(declare-fun m!474295 () Bool)

(assert (=> b!493233 m!474295))

(assert (=> b!493233 m!474295))

(declare-fun m!474297 () Bool)

(assert (=> b!493233 m!474297))

(declare-fun m!474299 () Bool)

(assert (=> b!493233 m!474299))

(declare-fun m!474301 () Bool)

(assert (=> b!493233 m!474301))

(assert (=> b!493233 m!474299))

(declare-fun m!474303 () Bool)

(assert (=> b!493233 m!474303))

(assert (=> b!493233 m!474295))

(declare-fun m!474305 () Bool)

(assert (=> b!493233 m!474305))

(assert (=> b!493233 m!474299))

(declare-fun m!474307 () Bool)

(assert (=> b!493233 m!474307))

(declare-fun m!474309 () Bool)

(assert (=> b!493233 m!474309))

(declare-fun m!474311 () Bool)

(assert (=> b!493239 m!474311))

(assert (=> b!493240 m!474299))

(assert (=> b!493240 m!474299))

(declare-fun m!474313 () Bool)

(assert (=> b!493240 m!474313))

(declare-fun m!474315 () Bool)

(assert (=> b!493238 m!474315))

(assert (=> b!493232 m!474299))

(assert (=> b!493232 m!474299))

(declare-fun m!474317 () Bool)

(assert (=> b!493232 m!474317))

(check-sat (not b!493233) (not b!493238) (not b!493234) (not b!493240) (not b!493237) (not b!493239) (not b!493232) (not start!44966) (not b!493236))
(check-sat)
