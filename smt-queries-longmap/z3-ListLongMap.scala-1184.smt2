; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25446 () Bool)

(assert start!25446)

(declare-fun b!264910 () Bool)

(declare-fun res!129420 () Bool)

(declare-fun e!171581 () Bool)

(assert (=> b!264910 (=> (not res!129420) (not e!171581))))

(declare-datatypes ((array!12742 0))(
  ( (array!12743 (arr!6030 (Array (_ BitVec 32) (_ BitVec 64))) (size!6382 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12742)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264910 (= res!129420 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264909 () Bool)

(declare-fun res!129422 () Bool)

(assert (=> b!264909 (=> (not res!129422) (not e!171581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264909 (= res!129422 (validKeyInArray!0 k0!2698))))

(declare-fun b!264911 () Bool)

(assert (=> b!264911 (= e!171581 false)))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1221 0))(
  ( (MissingZero!1221 (index!7054 (_ BitVec 32))) (Found!1221 (index!7055 (_ BitVec 32))) (Intermediate!1221 (undefined!2033 Bool) (index!7056 (_ BitVec 32)) (x!25378 (_ BitVec 32))) (Undefined!1221) (MissingVacant!1221 (index!7057 (_ BitVec 32))) )
))
(declare-fun lt!133936 () SeekEntryResult!1221)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12742 (_ BitVec 32)) SeekEntryResult!1221)

(assert (=> b!264911 (= lt!133936 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!264908 () Bool)

(declare-fun res!129421 () Bool)

(assert (=> b!264908 (=> (not res!129421) (not e!171581))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264908 (= res!129421 (and (= (size!6382 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6382 a!3436))))))

(declare-fun res!129423 () Bool)

(assert (=> start!25446 (=> (not res!129423) (not e!171581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25446 (= res!129423 (validMask!0 mask!4002))))

(assert (=> start!25446 e!171581))

(assert (=> start!25446 true))

(declare-fun array_inv!3993 (array!12742) Bool)

(assert (=> start!25446 (array_inv!3993 a!3436)))

(assert (= (and start!25446 res!129423) b!264908))

(assert (= (and b!264908 res!129421) b!264909))

(assert (= (and b!264909 res!129422) b!264910))

(assert (= (and b!264910 res!129420) b!264911))

(declare-fun m!281875 () Bool)

(assert (=> b!264910 m!281875))

(declare-fun m!281877 () Bool)

(assert (=> b!264909 m!281877))

(declare-fun m!281879 () Bool)

(assert (=> b!264911 m!281879))

(declare-fun m!281881 () Bool)

(assert (=> start!25446 m!281881))

(declare-fun m!281883 () Bool)

(assert (=> start!25446 m!281883))

(check-sat (not b!264911) (not b!264910) (not start!25446) (not b!264909))
