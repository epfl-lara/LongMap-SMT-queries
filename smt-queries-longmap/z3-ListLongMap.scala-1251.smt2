; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26066 () Bool)

(assert start!26066)

(declare-fun b!268698 () Bool)

(declare-fun e!173487 () Bool)

(assert (=> b!268698 (= e!173487 false)))

(declare-fun lt!134832 () Bool)

(declare-datatypes ((array!13152 0))(
  ( (array!13153 (arr!6225 (Array (_ BitVec 32) (_ BitVec 64))) (size!6578 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13152)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13152 (_ BitVec 32)) Bool)

(assert (=> b!268698 (= lt!134832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268699 () Bool)

(declare-fun res!133033 () Bool)

(declare-fun e!173486 () Bool)

(assert (=> b!268699 (=> (not res!133033) (not e!173486))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268699 (= res!133033 (and (= (size!6578 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6578 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6578 a!3325))))))

(declare-fun b!268700 () Bool)

(assert (=> b!268700 (= e!173486 e!173487)))

(declare-fun res!133032 () Bool)

(assert (=> b!268700 (=> (not res!133032) (not e!173487))))

(declare-datatypes ((SeekEntryResult!1382 0))(
  ( (MissingZero!1382 (index!7698 (_ BitVec 32))) (Found!1382 (index!7699 (_ BitVec 32))) (Intermediate!1382 (undefined!2194 Bool) (index!7700 (_ BitVec 32)) (x!26074 (_ BitVec 32))) (Undefined!1382) (MissingVacant!1382 (index!7701 (_ BitVec 32))) )
))
(declare-fun lt!134831 () SeekEntryResult!1382)

(assert (=> b!268700 (= res!133032 (or (= lt!134831 (MissingZero!1382 i!1267)) (= lt!134831 (MissingVacant!1382 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13152 (_ BitVec 32)) SeekEntryResult!1382)

(assert (=> b!268700 (= lt!134831 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268701 () Bool)

(declare-fun res!133031 () Bool)

(assert (=> b!268701 (=> (not res!133031) (not e!173486))))

(declare-fun arrayContainsKey!0 (array!13152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268701 (= res!133031 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268702 () Bool)

(declare-fun res!133029 () Bool)

(assert (=> b!268702 (=> (not res!133029) (not e!173486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268702 (= res!133029 (validKeyInArray!0 k0!2581))))

(declare-fun res!133028 () Bool)

(assert (=> start!26066 (=> (not res!133028) (not e!173486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26066 (= res!133028 (validMask!0 mask!3868))))

(assert (=> start!26066 e!173486))

(declare-fun array_inv!4197 (array!13152) Bool)

(assert (=> start!26066 (array_inv!4197 a!3325)))

(assert (=> start!26066 true))

(declare-fun b!268703 () Bool)

(declare-fun res!133030 () Bool)

(assert (=> b!268703 (=> (not res!133030) (not e!173486))))

(declare-datatypes ((List!4006 0))(
  ( (Nil!4003) (Cons!4002 (h!4669 (_ BitVec 64)) (t!9079 List!4006)) )
))
(declare-fun arrayNoDuplicates!0 (array!13152 (_ BitVec 32) List!4006) Bool)

(assert (=> b!268703 (= res!133030 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4003))))

(assert (= (and start!26066 res!133028) b!268699))

(assert (= (and b!268699 res!133033) b!268702))

(assert (= (and b!268702 res!133029) b!268703))

(assert (= (and b!268703 res!133030) b!268701))

(assert (= (and b!268701 res!133031) b!268700))

(assert (= (and b!268700 res!133032) b!268698))

(declare-fun m!284291 () Bool)

(assert (=> b!268703 m!284291))

(declare-fun m!284293 () Bool)

(assert (=> b!268701 m!284293))

(declare-fun m!284295 () Bool)

(assert (=> b!268700 m!284295))

(declare-fun m!284297 () Bool)

(assert (=> start!26066 m!284297))

(declare-fun m!284299 () Bool)

(assert (=> start!26066 m!284299))

(declare-fun m!284301 () Bool)

(assert (=> b!268698 m!284301))

(declare-fun m!284303 () Bool)

(assert (=> b!268702 m!284303))

(check-sat (not b!268701) (not start!26066) (not b!268700) (not b!268698) (not b!268702) (not b!268703))
(check-sat)
