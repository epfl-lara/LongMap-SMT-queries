; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26506 () Bool)

(assert start!26506)

(declare-fun b!275155 () Bool)

(declare-fun res!139145 () Bool)

(declare-fun e!176053 () Bool)

(assert (=> b!275155 (=> (not res!139145) (not e!176053))))

(declare-datatypes ((array!13603 0))(
  ( (array!13604 (arr!6451 (Array (_ BitVec 32) (_ BitVec 64))) (size!6803 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13603)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275155 (= res!139145 (and (= (size!6803 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6803 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6803 a!3325))))))

(declare-fun b!275156 () Bool)

(declare-fun res!139147 () Bool)

(assert (=> b!275156 (=> (not res!139147) (not e!176053))))

(declare-datatypes ((List!4259 0))(
  ( (Nil!4256) (Cons!4255 (h!4922 (_ BitVec 64)) (t!9341 List!4259)) )
))
(declare-fun arrayNoDuplicates!0 (array!13603 (_ BitVec 32) List!4259) Bool)

(assert (=> b!275156 (= res!139147 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4256))))

(declare-fun b!275157 () Bool)

(declare-fun res!139148 () Bool)

(assert (=> b!275157 (=> (not res!139148) (not e!176053))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275157 (= res!139148 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275154 () Bool)

(declare-fun e!176052 () Bool)

(assert (=> b!275154 (= e!176052 false)))

(declare-fun lt!137292 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13603 (_ BitVec 32)) Bool)

(assert (=> b!275154 (= lt!137292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139144 () Bool)

(assert (=> start!26506 (=> (not res!139144) (not e!176053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26506 (= res!139144 (validMask!0 mask!3868))))

(assert (=> start!26506 e!176053))

(declare-fun array_inv!4414 (array!13603) Bool)

(assert (=> start!26506 (array_inv!4414 a!3325)))

(assert (=> start!26506 true))

(declare-fun b!275158 () Bool)

(assert (=> b!275158 (= e!176053 e!176052)))

(declare-fun res!139146 () Bool)

(assert (=> b!275158 (=> (not res!139146) (not e!176052))))

(declare-datatypes ((SeekEntryResult!1609 0))(
  ( (MissingZero!1609 (index!8606 (_ BitVec 32))) (Found!1609 (index!8607 (_ BitVec 32))) (Intermediate!1609 (undefined!2421 Bool) (index!8608 (_ BitVec 32)) (x!26886 (_ BitVec 32))) (Undefined!1609) (MissingVacant!1609 (index!8609 (_ BitVec 32))) )
))
(declare-fun lt!137293 () SeekEntryResult!1609)

(assert (=> b!275158 (= res!139146 (or (= lt!137293 (MissingZero!1609 i!1267)) (= lt!137293 (MissingVacant!1609 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13603 (_ BitVec 32)) SeekEntryResult!1609)

(assert (=> b!275158 (= lt!137293 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275159 () Bool)

(declare-fun res!139149 () Bool)

(assert (=> b!275159 (=> (not res!139149) (not e!176053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275159 (= res!139149 (validKeyInArray!0 k!2581))))

(assert (= (and start!26506 res!139144) b!275155))

(assert (= (and b!275155 res!139145) b!275159))

(assert (= (and b!275159 res!139149) b!275156))

(assert (= (and b!275156 res!139147) b!275157))

(assert (= (and b!275157 res!139148) b!275158))

(assert (= (and b!275158 res!139146) b!275154))

(declare-fun m!290785 () Bool)

(assert (=> b!275156 m!290785))

(declare-fun m!290787 () Bool)

(assert (=> b!275159 m!290787))

(declare-fun m!290789 () Bool)

(assert (=> b!275157 m!290789))

(declare-fun m!290791 () Bool)

(assert (=> b!275158 m!290791))

(declare-fun m!290793 () Bool)

(assert (=> b!275154 m!290793))

(declare-fun m!290795 () Bool)

(assert (=> start!26506 m!290795))

(declare-fun m!290797 () Bool)

(assert (=> start!26506 m!290797))

(push 1)

(assert (not b!275156))

(assert (not start!26506))

(assert (not b!275154))

(assert (not b!275157))

(assert (not b!275158))

(assert (not b!275159))

(check-sat)

(pop 1)

