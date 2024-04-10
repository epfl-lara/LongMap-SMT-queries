; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25440 () Bool)

(assert start!25440)

(declare-fun b!264873 () Bool)

(declare-fun res!129386 () Bool)

(declare-fun e!171562 () Bool)

(assert (=> b!264873 (=> (not res!129386) (not e!171562))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264873 (= res!129386 (validKeyInArray!0 k0!2698))))

(declare-fun b!264872 () Bool)

(declare-fun res!129387 () Bool)

(assert (=> b!264872 (=> (not res!129387) (not e!171562))))

(declare-datatypes ((array!12736 0))(
  ( (array!12737 (arr!6027 (Array (_ BitVec 32) (_ BitVec 64))) (size!6379 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12736)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264872 (= res!129387 (and (= (size!6379 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6379 a!3436))))))

(declare-fun b!264875 () Bool)

(assert (=> b!264875 (= e!171562 false)))

(declare-datatypes ((SeekEntryResult!1218 0))(
  ( (MissingZero!1218 (index!7042 (_ BitVec 32))) (Found!1218 (index!7043 (_ BitVec 32))) (Intermediate!1218 (undefined!2030 Bool) (index!7044 (_ BitVec 32)) (x!25367 (_ BitVec 32))) (Undefined!1218) (MissingVacant!1218 (index!7045 (_ BitVec 32))) )
))
(declare-fun lt!133927 () SeekEntryResult!1218)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12736 (_ BitVec 32)) SeekEntryResult!1218)

(assert (=> b!264875 (= lt!133927 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!129384 () Bool)

(assert (=> start!25440 (=> (not res!129384) (not e!171562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25440 (= res!129384 (validMask!0 mask!4002))))

(assert (=> start!25440 e!171562))

(assert (=> start!25440 true))

(declare-fun array_inv!3990 (array!12736) Bool)

(assert (=> start!25440 (array_inv!3990 a!3436)))

(declare-fun b!264874 () Bool)

(declare-fun res!129385 () Bool)

(assert (=> b!264874 (=> (not res!129385) (not e!171562))))

(declare-fun arrayContainsKey!0 (array!12736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264874 (= res!129385 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25440 res!129384) b!264872))

(assert (= (and b!264872 res!129387) b!264873))

(assert (= (and b!264873 res!129386) b!264874))

(assert (= (and b!264874 res!129385) b!264875))

(declare-fun m!281845 () Bool)

(assert (=> b!264873 m!281845))

(declare-fun m!281847 () Bool)

(assert (=> b!264875 m!281847))

(declare-fun m!281849 () Bool)

(assert (=> start!25440 m!281849))

(declare-fun m!281851 () Bool)

(assert (=> start!25440 m!281851))

(declare-fun m!281853 () Bool)

(assert (=> b!264874 m!281853))

(check-sat (not b!264875) (not b!264874) (not start!25440) (not b!264873))
