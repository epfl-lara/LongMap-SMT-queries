; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25974 () Bool)

(assert start!25974)

(declare-fun b!268051 () Bool)

(declare-fun res!132332 () Bool)

(declare-fun e!173206 () Bool)

(assert (=> b!268051 (=> (not res!132332) (not e!173206))))

(declare-datatypes ((array!13071 0))(
  ( (array!13072 (arr!6185 (Array (_ BitVec 32) (_ BitVec 64))) (size!6537 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13071)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268051 (= res!132332 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268052 () Bool)

(declare-fun res!132331 () Bool)

(assert (=> b!268052 (=> (not res!132331) (not e!173206))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268052 (= res!132331 (and (= (size!6537 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6537 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6537 a!3325))))))

(declare-fun b!268053 () Bool)

(declare-fun res!132329 () Bool)

(assert (=> b!268053 (=> (not res!132329) (not e!173206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268053 (= res!132329 (validKeyInArray!0 k!2581))))

(declare-fun b!268054 () Bool)

(declare-fun res!132330 () Bool)

(assert (=> b!268054 (=> (not res!132330) (not e!173206))))

(declare-datatypes ((List!3993 0))(
  ( (Nil!3990) (Cons!3989 (h!4656 (_ BitVec 64)) (t!9075 List!3993)) )
))
(declare-fun arrayNoDuplicates!0 (array!13071 (_ BitVec 32) List!3993) Bool)

(assert (=> b!268054 (= res!132330 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3990))))

(declare-fun res!132333 () Bool)

(assert (=> start!25974 (=> (not res!132333) (not e!173206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25974 (= res!132333 (validMask!0 mask!3868))))

(assert (=> start!25974 e!173206))

(declare-fun array_inv!4148 (array!13071) Bool)

(assert (=> start!25974 (array_inv!4148 a!3325)))

(assert (=> start!25974 true))

(declare-fun b!268055 () Bool)

(assert (=> b!268055 (= e!173206 false)))

(declare-datatypes ((SeekEntryResult!1343 0))(
  ( (MissingZero!1343 (index!7542 (_ BitVec 32))) (Found!1343 (index!7543 (_ BitVec 32))) (Intermediate!1343 (undefined!2155 Bool) (index!7544 (_ BitVec 32)) (x!25916 (_ BitVec 32))) (Undefined!1343) (MissingVacant!1343 (index!7545 (_ BitVec 32))) )
))
(declare-fun lt!134776 () SeekEntryResult!1343)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13071 (_ BitVec 32)) SeekEntryResult!1343)

(assert (=> b!268055 (= lt!134776 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!25974 res!132333) b!268052))

(assert (= (and b!268052 res!132331) b!268053))

(assert (= (and b!268053 res!132329) b!268054))

(assert (= (and b!268054 res!132330) b!268051))

(assert (= (and b!268051 res!132332) b!268055))

(declare-fun m!284271 () Bool)

(assert (=> start!25974 m!284271))

(declare-fun m!284273 () Bool)

(assert (=> start!25974 m!284273))

(declare-fun m!284275 () Bool)

(assert (=> b!268053 m!284275))

(declare-fun m!284277 () Bool)

(assert (=> b!268055 m!284277))

(declare-fun m!284279 () Bool)

(assert (=> b!268054 m!284279))

(declare-fun m!284281 () Bool)

(assert (=> b!268051 m!284281))

(push 1)

(assert (not b!268055))

(assert (not b!268053))

(assert (not b!268054))

(assert (not start!25974))

(assert (not b!268051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

