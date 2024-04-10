; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25996 () Bool)

(assert start!25996)

(declare-fun res!132505 () Bool)

(declare-fun e!173282 () Bool)

(assert (=> start!25996 (=> (not res!132505) (not e!173282))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25996 (= res!132505 (validMask!0 mask!3868))))

(assert (=> start!25996 e!173282))

(declare-datatypes ((array!13093 0))(
  ( (array!13094 (arr!6196 (Array (_ BitVec 32) (_ BitVec 64))) (size!6548 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13093)

(declare-fun array_inv!4159 (array!13093) Bool)

(assert (=> start!25996 (array_inv!4159 a!3325)))

(assert (=> start!25996 true))

(declare-fun b!268224 () Bool)

(declare-fun e!173281 () Bool)

(assert (=> b!268224 (= e!173281 false)))

(declare-fun lt!134817 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13093 (_ BitVec 32)) Bool)

(assert (=> b!268224 (= lt!134817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268225 () Bool)

(declare-fun res!132506 () Bool)

(assert (=> b!268225 (=> (not res!132506) (not e!173282))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268225 (= res!132506 (and (= (size!6548 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6548 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6548 a!3325))))))

(declare-fun b!268226 () Bool)

(declare-fun res!132507 () Bool)

(assert (=> b!268226 (=> (not res!132507) (not e!173282))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268226 (= res!132507 (validKeyInArray!0 k!2581))))

(declare-fun b!268227 () Bool)

(declare-fun res!132502 () Bool)

(assert (=> b!268227 (=> (not res!132502) (not e!173282))))

(declare-datatypes ((List!4004 0))(
  ( (Nil!4001) (Cons!4000 (h!4667 (_ BitVec 64)) (t!9086 List!4004)) )
))
(declare-fun arrayNoDuplicates!0 (array!13093 (_ BitVec 32) List!4004) Bool)

(assert (=> b!268227 (= res!132502 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4001))))

(declare-fun b!268228 () Bool)

(assert (=> b!268228 (= e!173282 e!173281)))

(declare-fun res!132504 () Bool)

(assert (=> b!268228 (=> (not res!132504) (not e!173281))))

(declare-datatypes ((SeekEntryResult!1354 0))(
  ( (MissingZero!1354 (index!7586 (_ BitVec 32))) (Found!1354 (index!7587 (_ BitVec 32))) (Intermediate!1354 (undefined!2166 Bool) (index!7588 (_ BitVec 32)) (x!25951 (_ BitVec 32))) (Undefined!1354) (MissingVacant!1354 (index!7589 (_ BitVec 32))) )
))
(declare-fun lt!134818 () SeekEntryResult!1354)

(assert (=> b!268228 (= res!132504 (or (= lt!134818 (MissingZero!1354 i!1267)) (= lt!134818 (MissingVacant!1354 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13093 (_ BitVec 32)) SeekEntryResult!1354)

(assert (=> b!268228 (= lt!134818 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268229 () Bool)

(declare-fun res!132503 () Bool)

(assert (=> b!268229 (=> (not res!132503) (not e!173282))))

(declare-fun arrayContainsKey!0 (array!13093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268229 (= res!132503 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!25996 res!132505) b!268225))

(assert (= (and b!268225 res!132506) b!268226))

(assert (= (and b!268226 res!132507) b!268227))

(assert (= (and b!268227 res!132502) b!268229))

(assert (= (and b!268229 res!132503) b!268228))

(assert (= (and b!268228 res!132504) b!268224))

(declare-fun m!284407 () Bool)

(assert (=> b!268229 m!284407))

(declare-fun m!284409 () Bool)

(assert (=> b!268226 m!284409))

(declare-fun m!284411 () Bool)

(assert (=> start!25996 m!284411))

(declare-fun m!284413 () Bool)

(assert (=> start!25996 m!284413))

(declare-fun m!284415 () Bool)

(assert (=> b!268224 m!284415))

(declare-fun m!284417 () Bool)

(assert (=> b!268228 m!284417))

(declare-fun m!284419 () Bool)

(assert (=> b!268227 m!284419))

(push 1)

(assert (not b!268227))

(assert (not b!268229))

(assert (not b!268228))

(assert (not b!268224))

(assert (not b!268226))

(assert (not start!25996))

(check-sat)

