; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27108 () Bool)

(assert start!27108)

(declare-fun b!280220 () Bool)

(declare-fun res!143301 () Bool)

(declare-fun e!178489 () Bool)

(assert (=> b!280220 (=> (not res!143301) (not e!178489))))

(declare-datatypes ((array!13926 0))(
  ( (array!13927 (arr!6605 (Array (_ BitVec 32) (_ BitVec 64))) (size!6957 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13926)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280220 (= res!143301 (and (= (size!6957 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6957 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6957 a!3325))))))

(declare-fun b!280221 () Bool)

(declare-fun res!143295 () Bool)

(declare-fun e!178490 () Bool)

(assert (=> b!280221 (=> (not res!143295) (not e!178490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280221 (= res!143295 (validKeyInArray!0 (select (arr!6605 a!3325) startIndex!26)))))

(declare-fun b!280222 () Bool)

(declare-fun res!143294 () Bool)

(assert (=> b!280222 (=> (not res!143294) (not e!178490))))

(declare-datatypes ((List!4413 0))(
  ( (Nil!4410) (Cons!4409 (h!5079 (_ BitVec 64)) (t!9495 List!4413)) )
))
(declare-fun contains!1985 (List!4413 (_ BitVec 64)) Bool)

(assert (=> b!280222 (= res!143294 (not (contains!1985 Nil!4410 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!143299 () Bool)

(assert (=> start!27108 (=> (not res!143299) (not e!178489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27108 (= res!143299 (validMask!0 mask!3868))))

(assert (=> start!27108 e!178489))

(declare-fun array_inv!4568 (array!13926) Bool)

(assert (=> start!27108 (array_inv!4568 a!3325)))

(assert (=> start!27108 true))

(declare-fun b!280223 () Bool)

(declare-fun res!143300 () Bool)

(assert (=> b!280223 (=> (not res!143300) (not e!178490))))

(assert (=> b!280223 (= res!143300 (not (= startIndex!26 i!1267)))))

(declare-fun b!280224 () Bool)

(declare-fun res!143290 () Bool)

(assert (=> b!280224 (=> (not res!143290) (not e!178489))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280224 (= res!143290 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280225 () Bool)

(declare-fun res!143293 () Bool)

(assert (=> b!280225 (=> (not res!143293) (not e!178490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13926 (_ BitVec 32)) Bool)

(assert (=> b!280225 (= res!143293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280226 () Bool)

(assert (=> b!280226 (= e!178489 e!178490)))

(declare-fun res!143292 () Bool)

(assert (=> b!280226 (=> (not res!143292) (not e!178490))))

(declare-datatypes ((SeekEntryResult!1763 0))(
  ( (MissingZero!1763 (index!9222 (_ BitVec 32))) (Found!1763 (index!9223 (_ BitVec 32))) (Intermediate!1763 (undefined!2575 Bool) (index!9224 (_ BitVec 32)) (x!27465 (_ BitVec 32))) (Undefined!1763) (MissingVacant!1763 (index!9225 (_ BitVec 32))) )
))
(declare-fun lt!138792 () SeekEntryResult!1763)

(assert (=> b!280226 (= res!143292 (or (= lt!138792 (MissingZero!1763 i!1267)) (= lt!138792 (MissingVacant!1763 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13926 (_ BitVec 32)) SeekEntryResult!1763)

(assert (=> b!280226 (= lt!138792 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280227 () Bool)

(assert (=> b!280227 (= e!178490 false)))

(declare-fun lt!138793 () Bool)

(assert (=> b!280227 (= lt!138793 (contains!1985 Nil!4410 k!2581))))

(declare-fun b!280228 () Bool)

(declare-fun res!143296 () Bool)

(assert (=> b!280228 (=> (not res!143296) (not e!178490))))

(declare-fun noDuplicate!167 (List!4413) Bool)

(assert (=> b!280228 (= res!143296 (noDuplicate!167 Nil!4410))))

(declare-fun b!280229 () Bool)

(declare-fun res!143297 () Bool)

(assert (=> b!280229 (=> (not res!143297) (not e!178490))))

(assert (=> b!280229 (= res!143297 (not (contains!1985 Nil!4410 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280230 () Bool)

(declare-fun res!143289 () Bool)

(assert (=> b!280230 (=> (not res!143289) (not e!178489))))

(assert (=> b!280230 (= res!143289 (validKeyInArray!0 k!2581))))

(declare-fun b!280231 () Bool)

(declare-fun res!143298 () Bool)

(assert (=> b!280231 (=> (not res!143298) (not e!178489))))

(declare-fun arrayNoDuplicates!0 (array!13926 (_ BitVec 32) List!4413) Bool)

(assert (=> b!280231 (= res!143298 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4410))))

(declare-fun b!280232 () Bool)

(declare-fun res!143291 () Bool)

(assert (=> b!280232 (=> (not res!143291) (not e!178490))))

(assert (=> b!280232 (= res!143291 (and (bvslt (size!6957 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6957 a!3325))))))

(assert (= (and start!27108 res!143299) b!280220))

(assert (= (and b!280220 res!143301) b!280230))

(assert (= (and b!280230 res!143289) b!280231))

(assert (= (and b!280231 res!143298) b!280224))

(assert (= (and b!280224 res!143290) b!280226))

(assert (= (and b!280226 res!143292) b!280225))

(assert (= (and b!280225 res!143293) b!280223))

(assert (= (and b!280223 res!143300) b!280221))

(assert (= (and b!280221 res!143295) b!280232))

(assert (= (and b!280232 res!143291) b!280228))

(assert (= (and b!280228 res!143296) b!280229))

(assert (= (and b!280229 res!143297) b!280222))

(assert (= (and b!280222 res!143294) b!280227))

(declare-fun m!294723 () Bool)

(assert (=> b!280222 m!294723))

(declare-fun m!294725 () Bool)

(assert (=> start!27108 m!294725))

(declare-fun m!294727 () Bool)

(assert (=> start!27108 m!294727))

(declare-fun m!294729 () Bool)

(assert (=> b!280221 m!294729))

(assert (=> b!280221 m!294729))

(declare-fun m!294731 () Bool)

(assert (=> b!280221 m!294731))

(declare-fun m!294733 () Bool)

(assert (=> b!280229 m!294733))

(declare-fun m!294735 () Bool)

(assert (=> b!280226 m!294735))

(declare-fun m!294737 () Bool)

(assert (=> b!280224 m!294737))

(declare-fun m!294739 () Bool)

(assert (=> b!280227 m!294739))

(declare-fun m!294741 () Bool)

(assert (=> b!280225 m!294741))

(declare-fun m!294743 () Bool)

(assert (=> b!280228 m!294743))

(declare-fun m!294745 () Bool)

(assert (=> b!280230 m!294745))

(declare-fun m!294747 () Bool)

(assert (=> b!280231 m!294747))

(push 1)

