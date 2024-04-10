; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45042 () Bool)

(assert start!45042)

(declare-fun b!494276 () Bool)

(declare-fun res!296847 () Bool)

(declare-fun e!290120 () Bool)

(assert (=> b!494276 (=> (not res!296847) (not e!290120))))

(declare-datatypes ((array!31987 0))(
  ( (array!31988 (arr!15378 (Array (_ BitVec 32) (_ BitVec 64))) (size!15742 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31987)

(declare-datatypes ((List!9536 0))(
  ( (Nil!9533) (Cons!9532 (h!10400 (_ BitVec 64)) (t!15764 List!9536)) )
))
(declare-fun arrayNoDuplicates!0 (array!31987 (_ BitVec 32) List!9536) Bool)

(assert (=> b!494276 (= res!296847 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9533))))

(declare-fun b!494277 () Bool)

(declare-fun res!296854 () Bool)

(declare-fun e!290119 () Bool)

(assert (=> b!494277 (=> res!296854 e!290119)))

(declare-datatypes ((SeekEntryResult!3845 0))(
  ( (MissingZero!3845 (index!17559 (_ BitVec 32))) (Found!3845 (index!17560 (_ BitVec 32))) (Intermediate!3845 (undefined!4657 Bool) (index!17561 (_ BitVec 32)) (x!46635 (_ BitVec 32))) (Undefined!3845) (MissingVacant!3845 (index!17562 (_ BitVec 32))) )
))
(declare-fun lt!223675 () SeekEntryResult!3845)

(assert (=> b!494277 (= res!296854 (or (not (is-Intermediate!3845 lt!223675)) (not (undefined!4657 lt!223675))))))

(declare-fun res!296848 () Bool)

(declare-fun e!290118 () Bool)

(assert (=> start!45042 (=> (not res!296848) (not e!290118))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45042 (= res!296848 (validMask!0 mask!3524))))

(assert (=> start!45042 e!290118))

(assert (=> start!45042 true))

(declare-fun array_inv!11174 (array!31987) Bool)

(assert (=> start!45042 (array_inv!11174 a!3235)))

(declare-fun b!494278 () Bool)

(declare-fun res!296852 () Bool)

(assert (=> b!494278 (=> (not res!296852) (not e!290118))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494278 (= res!296852 (validKeyInArray!0 (select (arr!15378 a!3235) j!176)))))

(declare-fun b!494279 () Bool)

(declare-fun res!296846 () Bool)

(assert (=> b!494279 (=> (not res!296846) (not e!290118))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494279 (= res!296846 (and (= (size!15742 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15742 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15742 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494280 () Bool)

(declare-fun res!296849 () Bool)

(assert (=> b!494280 (=> (not res!296849) (not e!290118))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494280 (= res!296849 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494281 () Bool)

(declare-fun res!296855 () Bool)

(assert (=> b!494281 (=> (not res!296855) (not e!290118))))

(assert (=> b!494281 (= res!296855 (validKeyInArray!0 k!2280))))

(declare-fun b!494282 () Bool)

(declare-fun res!296851 () Bool)

(assert (=> b!494282 (=> (not res!296851) (not e!290120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31987 (_ BitVec 32)) Bool)

(assert (=> b!494282 (= res!296851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494283 () Bool)

(assert (=> b!494283 (= e!290118 e!290120)))

(declare-fun res!296850 () Bool)

(assert (=> b!494283 (=> (not res!296850) (not e!290120))))

(declare-fun lt!223673 () SeekEntryResult!3845)

(assert (=> b!494283 (= res!296850 (or (= lt!223673 (MissingZero!3845 i!1204)) (= lt!223673 (MissingVacant!3845 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31987 (_ BitVec 32)) SeekEntryResult!3845)

(assert (=> b!494283 (= lt!223673 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494284 () Bool)

(assert (=> b!494284 (= e!290119 true)))

(declare-fun lt!223676 () SeekEntryResult!3845)

(assert (=> b!494284 (= lt!223676 Undefined!3845)))

(declare-fun b!494285 () Bool)

(assert (=> b!494285 (= e!290120 (not e!290119))))

(declare-fun res!296853 () Bool)

(assert (=> b!494285 (=> res!296853 e!290119)))

(declare-fun lt!223674 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31987 (_ BitVec 32)) SeekEntryResult!3845)

(assert (=> b!494285 (= res!296853 (= lt!223675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223674 (select (store (arr!15378 a!3235) i!1204 k!2280) j!176) (array!31988 (store (arr!15378 a!3235) i!1204 k!2280) (size!15742 a!3235)) mask!3524)))))

(declare-fun lt!223677 () (_ BitVec 32))

(assert (=> b!494285 (= lt!223675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223677 (select (arr!15378 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494285 (= lt!223674 (toIndex!0 (select (store (arr!15378 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494285 (= lt!223677 (toIndex!0 (select (arr!15378 a!3235) j!176) mask!3524))))

(assert (=> b!494285 (= lt!223676 (Found!3845 j!176))))

(assert (=> b!494285 (= lt!223676 (seekEntryOrOpen!0 (select (arr!15378 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494285 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14636 0))(
  ( (Unit!14637) )
))
(declare-fun lt!223678 () Unit!14636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14636)

(assert (=> b!494285 (= lt!223678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45042 res!296848) b!494279))

(assert (= (and b!494279 res!296846) b!494278))

(assert (= (and b!494278 res!296852) b!494281))

(assert (= (and b!494281 res!296855) b!494280))

(assert (= (and b!494280 res!296849) b!494283))

(assert (= (and b!494283 res!296850) b!494282))

(assert (= (and b!494282 res!296851) b!494276))

(assert (= (and b!494276 res!296847) b!494285))

(assert (= (and b!494285 (not res!296853)) b!494277))

(assert (= (and b!494277 (not res!296854)) b!494284))

(declare-fun m!475287 () Bool)

(assert (=> b!494281 m!475287))

(declare-fun m!475289 () Bool)

(assert (=> b!494280 m!475289))

(declare-fun m!475291 () Bool)

(assert (=> b!494285 m!475291))

(declare-fun m!475293 () Bool)

(assert (=> b!494285 m!475293))

(declare-fun m!475295 () Bool)

(assert (=> b!494285 m!475295))

(declare-fun m!475297 () Bool)

(assert (=> b!494285 m!475297))

(declare-fun m!475299 () Bool)

(assert (=> b!494285 m!475299))

(assert (=> b!494285 m!475291))

(declare-fun m!475301 () Bool)

(assert (=> b!494285 m!475301))

(assert (=> b!494285 m!475291))

(declare-fun m!475303 () Bool)

(assert (=> b!494285 m!475303))

(assert (=> b!494285 m!475291))

(declare-fun m!475305 () Bool)

(assert (=> b!494285 m!475305))

(assert (=> b!494285 m!475299))

(declare-fun m!475307 () Bool)

(assert (=> b!494285 m!475307))

(assert (=> b!494285 m!475299))

(declare-fun m!475309 () Bool)

(assert (=> b!494285 m!475309))

(assert (=> b!494278 m!475291))

(assert (=> b!494278 m!475291))

(declare-fun m!475311 () Bool)

(assert (=> b!494278 m!475311))

(declare-fun m!475313 () Bool)

(assert (=> b!494276 m!475313))

(declare-fun m!475315 () Bool)

(assert (=> b!494283 m!475315))

(declare-fun m!475317 () Bool)

(assert (=> b!494282 m!475317))

(declare-fun m!475319 () Bool)

(assert (=> start!45042 m!475319))

(declare-fun m!475321 () Bool)

(assert (=> start!45042 m!475321))

(push 1)

