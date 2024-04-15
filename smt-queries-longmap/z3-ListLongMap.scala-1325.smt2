; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26510 () Bool)

(assert start!26510)

(declare-fun b!275025 () Bool)

(declare-fun e!175960 () Bool)

(assert (=> b!275025 (= e!175960 false)))

(declare-fun lt!137117 () Bool)

(declare-datatypes ((array!13596 0))(
  ( (array!13597 (arr!6447 (Array (_ BitVec 32) (_ BitVec 64))) (size!6800 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13596)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13596 (_ BitVec 32)) Bool)

(assert (=> b!275025 (= lt!137117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275026 () Bool)

(declare-fun res!139069 () Bool)

(declare-fun e!175962 () Bool)

(assert (=> b!275026 (=> (not res!139069) (not e!175962))))

(declare-datatypes ((List!4228 0))(
  ( (Nil!4225) (Cons!4224 (h!4891 (_ BitVec 64)) (t!9301 List!4228)) )
))
(declare-fun arrayNoDuplicates!0 (array!13596 (_ BitVec 32) List!4228) Bool)

(assert (=> b!275026 (= res!139069 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4225))))

(declare-fun res!139071 () Bool)

(assert (=> start!26510 (=> (not res!139071) (not e!175962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26510 (= res!139071 (validMask!0 mask!3868))))

(assert (=> start!26510 e!175962))

(declare-fun array_inv!4419 (array!13596) Bool)

(assert (=> start!26510 (array_inv!4419 a!3325)))

(assert (=> start!26510 true))

(declare-fun b!275027 () Bool)

(declare-fun res!139067 () Bool)

(assert (=> b!275027 (=> (not res!139067) (not e!175962))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275027 (= res!139067 (validKeyInArray!0 k0!2581))))

(declare-fun b!275028 () Bool)

(assert (=> b!275028 (= e!175962 e!175960)))

(declare-fun res!139070 () Bool)

(assert (=> b!275028 (=> (not res!139070) (not e!175960))))

(declare-datatypes ((SeekEntryResult!1604 0))(
  ( (MissingZero!1604 (index!8586 (_ BitVec 32))) (Found!1604 (index!8587 (_ BitVec 32))) (Intermediate!1604 (undefined!2416 Bool) (index!8588 (_ BitVec 32)) (x!26888 (_ BitVec 32))) (Undefined!1604) (MissingVacant!1604 (index!8589 (_ BitVec 32))) )
))
(declare-fun lt!137118 () SeekEntryResult!1604)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275028 (= res!139070 (or (= lt!137118 (MissingZero!1604 i!1267)) (= lt!137118 (MissingVacant!1604 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13596 (_ BitVec 32)) SeekEntryResult!1604)

(assert (=> b!275028 (= lt!137118 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275029 () Bool)

(declare-fun res!139068 () Bool)

(assert (=> b!275029 (=> (not res!139068) (not e!175962))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275029 (= res!139068 (and (= (size!6800 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6800 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6800 a!3325))))))

(declare-fun b!275030 () Bool)

(declare-fun res!139072 () Bool)

(assert (=> b!275030 (=> (not res!139072) (not e!175962))))

(declare-fun arrayContainsKey!0 (array!13596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275030 (= res!139072 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26510 res!139071) b!275029))

(assert (= (and b!275029 res!139068) b!275027))

(assert (= (and b!275027 res!139067) b!275026))

(assert (= (and b!275026 res!139069) b!275030))

(assert (= (and b!275030 res!139072) b!275028))

(assert (= (and b!275028 res!139070) b!275025))

(declare-fun m!290207 () Bool)

(assert (=> start!26510 m!290207))

(declare-fun m!290209 () Bool)

(assert (=> start!26510 m!290209))

(declare-fun m!290211 () Bool)

(assert (=> b!275026 m!290211))

(declare-fun m!290213 () Bool)

(assert (=> b!275025 m!290213))

(declare-fun m!290215 () Bool)

(assert (=> b!275027 m!290215))

(declare-fun m!290217 () Bool)

(assert (=> b!275028 m!290217))

(declare-fun m!290219 () Bool)

(assert (=> b!275030 m!290219))

(check-sat (not start!26510) (not b!275025) (not b!275028) (not b!275026) (not b!275030) (not b!275027))
(check-sat)
