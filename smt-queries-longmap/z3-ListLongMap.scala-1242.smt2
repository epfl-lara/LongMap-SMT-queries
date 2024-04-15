; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26012 () Bool)

(assert start!26012)

(declare-fun b!268205 () Bool)

(declare-fun e!173244 () Bool)

(declare-fun e!173242 () Bool)

(assert (=> b!268205 (= e!173244 e!173242)))

(declare-fun res!132537 () Bool)

(assert (=> b!268205 (=> (not res!132537) (not e!173242))))

(declare-datatypes ((SeekEntryResult!1355 0))(
  ( (MissingZero!1355 (index!7590 (_ BitVec 32))) (Found!1355 (index!7591 (_ BitVec 32))) (Intermediate!1355 (undefined!2167 Bool) (index!7592 (_ BitVec 32)) (x!25975 (_ BitVec 32))) (Undefined!1355) (MissingVacant!1355 (index!7593 (_ BitVec 32))) )
))
(declare-fun lt!134676 () SeekEntryResult!1355)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268205 (= res!132537 (or (= lt!134676 (MissingZero!1355 i!1267)) (= lt!134676 (MissingVacant!1355 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((array!13098 0))(
  ( (array!13099 (arr!6198 (Array (_ BitVec 32) (_ BitVec 64))) (size!6551 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13098)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13098 (_ BitVec 32)) SeekEntryResult!1355)

(assert (=> b!268205 (= lt!134676 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268206 () Bool)

(assert (=> b!268206 (= e!173242 (bvsgt #b00000000000000000000000000000000 (size!6551 a!3325)))))

(declare-fun b!268207 () Bool)

(declare-fun res!132541 () Bool)

(assert (=> b!268207 (=> (not res!132541) (not e!173244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268207 (= res!132541 (validKeyInArray!0 k0!2581))))

(declare-fun b!268208 () Bool)

(declare-fun res!132535 () Bool)

(assert (=> b!268208 (=> (not res!132535) (not e!173244))))

(declare-datatypes ((List!3979 0))(
  ( (Nil!3976) (Cons!3975 (h!4642 (_ BitVec 64)) (t!9052 List!3979)) )
))
(declare-fun arrayNoDuplicates!0 (array!13098 (_ BitVec 32) List!3979) Bool)

(assert (=> b!268208 (= res!132535 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3976))))

(declare-fun b!268209 () Bool)

(declare-fun res!132536 () Bool)

(assert (=> b!268209 (=> (not res!132536) (not e!173244))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268209 (= res!132536 (and (= (size!6551 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6551 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6551 a!3325))))))

(declare-fun res!132538 () Bool)

(assert (=> start!26012 (=> (not res!132538) (not e!173244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26012 (= res!132538 (validMask!0 mask!3868))))

(assert (=> start!26012 e!173244))

(declare-fun array_inv!4170 (array!13098) Bool)

(assert (=> start!26012 (array_inv!4170 a!3325)))

(assert (=> start!26012 true))

(declare-fun b!268210 () Bool)

(declare-fun res!132540 () Bool)

(assert (=> b!268210 (=> (not res!132540) (not e!173242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13098 (_ BitVec 32)) Bool)

(assert (=> b!268210 (= res!132540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268211 () Bool)

(declare-fun res!132539 () Bool)

(assert (=> b!268211 (=> (not res!132539) (not e!173244))))

(declare-fun arrayContainsKey!0 (array!13098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268211 (= res!132539 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26012 res!132538) b!268209))

(assert (= (and b!268209 res!132536) b!268207))

(assert (= (and b!268207 res!132541) b!268208))

(assert (= (and b!268208 res!132535) b!268211))

(assert (= (and b!268211 res!132539) b!268205))

(assert (= (and b!268205 res!132537) b!268210))

(assert (= (and b!268210 res!132540) b!268206))

(declare-fun m!283913 () Bool)

(assert (=> b!268207 m!283913))

(declare-fun m!283915 () Bool)

(assert (=> b!268205 m!283915))

(declare-fun m!283917 () Bool)

(assert (=> b!268211 m!283917))

(declare-fun m!283919 () Bool)

(assert (=> b!268208 m!283919))

(declare-fun m!283921 () Bool)

(assert (=> b!268210 m!283921))

(declare-fun m!283923 () Bool)

(assert (=> start!26012 m!283923))

(declare-fun m!283925 () Bool)

(assert (=> start!26012 m!283925))

(check-sat (not b!268210) (not b!268207) (not b!268208) (not start!26012) (not b!268211) (not b!268205))
(check-sat)
