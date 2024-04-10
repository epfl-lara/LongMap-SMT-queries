; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26190 () Bool)

(assert start!26190)

(declare-fun b!270632 () Bool)

(declare-fun res!134625 () Bool)

(declare-fun e!174369 () Bool)

(assert (=> b!270632 (=> (not res!134625) (not e!174369))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270632 (= res!134625 (not (= startIndex!26 i!1267)))))

(declare-fun b!270633 () Bool)

(declare-fun res!134623 () Bool)

(declare-fun e!174371 () Bool)

(assert (=> b!270633 (=> (not res!134623) (not e!174371))))

(declare-datatypes ((array!13287 0))(
  ( (array!13288 (arr!6293 (Array (_ BitVec 32) (_ BitVec 64))) (size!6645 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13287)

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270633 (= res!134623 (and (= (size!6645 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6645 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6645 a!3325))))))

(declare-fun b!270634 () Bool)

(declare-fun res!134629 () Bool)

(assert (=> b!270634 (=> (not res!134629) (not e!174371))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270634 (= res!134629 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270635 () Bool)

(declare-fun res!134633 () Bool)

(assert (=> b!270635 (=> (not res!134633) (not e!174369))))

(assert (=> b!270635 (= res!134633 (and (bvslt (size!6645 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6645 a!3325))))))

(declare-fun b!270636 () Bool)

(declare-fun res!134628 () Bool)

(assert (=> b!270636 (=> (not res!134628) (not e!174369))))

(declare-datatypes ((List!4101 0))(
  ( (Nil!4098) (Cons!4097 (h!4764 (_ BitVec 64)) (t!9183 List!4101)) )
))
(declare-fun noDuplicate!119 (List!4101) Bool)

(assert (=> b!270636 (= res!134628 (noDuplicate!119 Nil!4098))))

(declare-fun b!270637 () Bool)

(declare-fun res!134624 () Bool)

(assert (=> b!270637 (=> (not res!134624) (not e!174369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270637 (= res!134624 (validKeyInArray!0 (select (arr!6293 a!3325) startIndex!26)))))

(declare-fun b!270638 () Bool)

(declare-fun res!134630 () Bool)

(assert (=> b!270638 (=> (not res!134630) (not e!174369))))

(declare-fun contains!1931 (List!4101 (_ BitVec 64)) Bool)

(assert (=> b!270638 (= res!134630 (not (contains!1931 Nil!4098 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!134634 () Bool)

(assert (=> start!26190 (=> (not res!134634) (not e!174371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26190 (= res!134634 (validMask!0 mask!3868))))

(assert (=> start!26190 e!174371))

(declare-fun array_inv!4256 (array!13287) Bool)

(assert (=> start!26190 (array_inv!4256 a!3325)))

(assert (=> start!26190 true))

(declare-fun b!270639 () Bool)

(assert (=> b!270639 (= e!174371 e!174369)))

(declare-fun res!134632 () Bool)

(assert (=> b!270639 (=> (not res!134632) (not e!174369))))

(declare-datatypes ((SeekEntryResult!1451 0))(
  ( (MissingZero!1451 (index!7974 (_ BitVec 32))) (Found!1451 (index!7975 (_ BitVec 32))) (Intermediate!1451 (undefined!2263 Bool) (index!7976 (_ BitVec 32)) (x!26312 (_ BitVec 32))) (Undefined!1451) (MissingVacant!1451 (index!7977 (_ BitVec 32))) )
))
(declare-fun lt!135679 () SeekEntryResult!1451)

(assert (=> b!270639 (= res!134632 (or (= lt!135679 (MissingZero!1451 i!1267)) (= lt!135679 (MissingVacant!1451 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13287 (_ BitVec 32)) SeekEntryResult!1451)

(assert (=> b!270639 (= lt!135679 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270640 () Bool)

(declare-fun res!134626 () Bool)

(assert (=> b!270640 (=> (not res!134626) (not e!174371))))

(assert (=> b!270640 (= res!134626 (validKeyInArray!0 k!2581))))

(declare-fun b!270641 () Bool)

(declare-fun res!134627 () Bool)

(assert (=> b!270641 (=> (not res!134627) (not e!174369))))

(assert (=> b!270641 (= res!134627 (not (contains!1931 Nil!4098 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270642 () Bool)

(declare-fun res!134622 () Bool)

(assert (=> b!270642 (=> (not res!134622) (not e!174369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13287 (_ BitVec 32)) Bool)

(assert (=> b!270642 (= res!134622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270643 () Bool)

(declare-fun res!134631 () Bool)

(assert (=> b!270643 (=> (not res!134631) (not e!174371))))

(declare-fun arrayNoDuplicates!0 (array!13287 (_ BitVec 32) List!4101) Bool)

(assert (=> b!270643 (= res!134631 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4098))))

(declare-fun b!270644 () Bool)

(assert (=> b!270644 (= e!174369 false)))

(declare-fun lt!135678 () Bool)

(assert (=> b!270644 (= lt!135678 (contains!1931 Nil!4098 k!2581))))

(assert (= (and start!26190 res!134634) b!270633))

(assert (= (and b!270633 res!134623) b!270640))

(assert (= (and b!270640 res!134626) b!270643))

(assert (= (and b!270643 res!134631) b!270634))

(assert (= (and b!270634 res!134629) b!270639))

(assert (= (and b!270639 res!134632) b!270642))

(assert (= (and b!270642 res!134622) b!270632))

(assert (= (and b!270632 res!134625) b!270637))

(assert (= (and b!270637 res!134624) b!270635))

(assert (= (and b!270635 res!134633) b!270636))

(assert (= (and b!270636 res!134628) b!270641))

(assert (= (and b!270641 res!134627) b!270638))

(assert (= (and b!270638 res!134630) b!270644))

(declare-fun m!286185 () Bool)

(assert (=> b!270639 m!286185))

(declare-fun m!286187 () Bool)

(assert (=> b!270640 m!286187))

(declare-fun m!286189 () Bool)

(assert (=> b!270636 m!286189))

(declare-fun m!286191 () Bool)

(assert (=> b!270641 m!286191))

(declare-fun m!286193 () Bool)

(assert (=> start!26190 m!286193))

(declare-fun m!286195 () Bool)

(assert (=> start!26190 m!286195))

(declare-fun m!286197 () Bool)

(assert (=> b!270634 m!286197))

(declare-fun m!286199 () Bool)

(assert (=> b!270643 m!286199))

(declare-fun m!286201 () Bool)

(assert (=> b!270642 m!286201))

(declare-fun m!286203 () Bool)

(assert (=> b!270637 m!286203))

(assert (=> b!270637 m!286203))

(declare-fun m!286205 () Bool)

(assert (=> b!270637 m!286205))

(declare-fun m!286207 () Bool)

(assert (=> b!270644 m!286207))

(declare-fun m!286209 () Bool)

(assert (=> b!270638 m!286209))

(push 1)

