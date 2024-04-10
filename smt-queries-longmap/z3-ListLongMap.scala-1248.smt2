; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26048 () Bool)

(assert start!26048)

(declare-fun b!268701 () Bool)

(declare-fun res!132984 () Bool)

(declare-fun e!173514 () Bool)

(assert (=> b!268701 (=> (not res!132984) (not e!173514))))

(declare-datatypes ((array!13145 0))(
  ( (array!13146 (arr!6222 (Array (_ BitVec 32) (_ BitVec 64))) (size!6574 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13145)

(declare-datatypes ((List!4030 0))(
  ( (Nil!4027) (Cons!4026 (h!4693 (_ BitVec 64)) (t!9112 List!4030)) )
))
(declare-fun arrayNoDuplicates!0 (array!13145 (_ BitVec 32) List!4030) Bool)

(assert (=> b!268701 (= res!132984 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4027))))

(declare-fun b!268702 () Bool)

(declare-fun res!132982 () Bool)

(assert (=> b!268702 (=> (not res!132982) (not e!173514))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268702 (= res!132982 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268703 () Bool)

(declare-fun res!132981 () Bool)

(assert (=> b!268703 (=> (not res!132981) (not e!173514))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268703 (= res!132981 (and (= (size!6574 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6574 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6574 a!3325))))))

(declare-fun b!268704 () Bool)

(declare-fun res!132980 () Bool)

(assert (=> b!268704 (=> (not res!132980) (not e!173514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268704 (= res!132980 (validKeyInArray!0 k0!2581))))

(declare-fun res!132983 () Bool)

(assert (=> start!26048 (=> (not res!132983) (not e!173514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26048 (= res!132983 (validMask!0 mask!3868))))

(assert (=> start!26048 e!173514))

(declare-fun array_inv!4185 (array!13145) Bool)

(assert (=> start!26048 (array_inv!4185 a!3325)))

(assert (=> start!26048 true))

(declare-fun b!268705 () Bool)

(declare-fun e!173515 () Bool)

(assert (=> b!268705 (= e!173514 e!173515)))

(declare-fun res!132979 () Bool)

(assert (=> b!268705 (=> (not res!132979) (not e!173515))))

(declare-datatypes ((SeekEntryResult!1380 0))(
  ( (MissingZero!1380 (index!7690 (_ BitVec 32))) (Found!1380 (index!7691 (_ BitVec 32))) (Intermediate!1380 (undefined!2192 Bool) (index!7692 (_ BitVec 32)) (x!26049 (_ BitVec 32))) (Undefined!1380) (MissingVacant!1380 (index!7693 (_ BitVec 32))) )
))
(declare-fun lt!134964 () SeekEntryResult!1380)

(assert (=> b!268705 (= res!132979 (or (= lt!134964 (MissingZero!1380 i!1267)) (= lt!134964 (MissingVacant!1380 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13145 (_ BitVec 32)) SeekEntryResult!1380)

(assert (=> b!268705 (= lt!134964 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268706 () Bool)

(assert (=> b!268706 (= e!173515 false)))

(declare-fun lt!134965 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13145 (_ BitVec 32)) Bool)

(assert (=> b!268706 (= lt!134965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26048 res!132983) b!268703))

(assert (= (and b!268703 res!132981) b!268704))

(assert (= (and b!268704 res!132980) b!268701))

(assert (= (and b!268701 res!132984) b!268702))

(assert (= (and b!268702 res!132982) b!268705))

(assert (= (and b!268705 res!132979) b!268706))

(declare-fun m!284771 () Bool)

(assert (=> b!268706 m!284771))

(declare-fun m!284773 () Bool)

(assert (=> b!268704 m!284773))

(declare-fun m!284775 () Bool)

(assert (=> b!268705 m!284775))

(declare-fun m!284777 () Bool)

(assert (=> b!268702 m!284777))

(declare-fun m!284779 () Bool)

(assert (=> start!26048 m!284779))

(declare-fun m!284781 () Bool)

(assert (=> start!26048 m!284781))

(declare-fun m!284783 () Bool)

(assert (=> b!268701 m!284783))

(check-sat (not b!268704) (not b!268702) (not b!268701) (not start!26048) (not b!268705) (not b!268706))
(check-sat)
