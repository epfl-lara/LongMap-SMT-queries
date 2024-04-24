; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26046 () Bool)

(assert start!26046)

(declare-fun res!132982 () Bool)

(declare-fun e!173531 () Bool)

(assert (=> start!26046 (=> (not res!132982) (not e!173531))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26046 (= res!132982 (validMask!0 mask!3868))))

(assert (=> start!26046 e!173531))

(declare-datatypes ((array!13142 0))(
  ( (array!13143 (arr!6220 (Array (_ BitVec 32) (_ BitVec 64))) (size!6572 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13142)

(declare-fun array_inv!4170 (array!13142) Bool)

(assert (=> start!26046 (array_inv!4170 a!3325)))

(assert (=> start!26046 true))

(declare-fun b!268730 () Bool)

(declare-fun res!132986 () Bool)

(assert (=> b!268730 (=> (not res!132986) (not e!173531))))

(declare-datatypes ((List!3941 0))(
  ( (Nil!3938) (Cons!3937 (h!4604 (_ BitVec 64)) (t!9015 List!3941)) )
))
(declare-fun arrayNoDuplicates!0 (array!13142 (_ BitVec 32) List!3941) Bool)

(assert (=> b!268730 (= res!132986 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3938))))

(declare-fun b!268731 () Bool)

(declare-fun e!173530 () Bool)

(assert (=> b!268731 (= e!173530 false)))

(declare-fun lt!135017 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13142 (_ BitVec 32)) Bool)

(assert (=> b!268731 (= lt!135017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268732 () Bool)

(declare-fun res!132987 () Bool)

(assert (=> b!268732 (=> (not res!132987) (not e!173531))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268732 (= res!132987 (and (= (size!6572 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6572 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6572 a!3325))))))

(declare-fun b!268733 () Bool)

(assert (=> b!268733 (= e!173531 e!173530)))

(declare-fun res!132984 () Bool)

(assert (=> b!268733 (=> (not res!132984) (not e!173530))))

(declare-datatypes ((SeekEntryResult!1343 0))(
  ( (MissingZero!1343 (index!7542 (_ BitVec 32))) (Found!1343 (index!7543 (_ BitVec 32))) (Intermediate!1343 (undefined!2155 Bool) (index!7544 (_ BitVec 32)) (x!26012 (_ BitVec 32))) (Undefined!1343) (MissingVacant!1343 (index!7545 (_ BitVec 32))) )
))
(declare-fun lt!135018 () SeekEntryResult!1343)

(assert (=> b!268733 (= res!132984 (or (= lt!135018 (MissingZero!1343 i!1267)) (= lt!135018 (MissingVacant!1343 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13142 (_ BitVec 32)) SeekEntryResult!1343)

(assert (=> b!268733 (= lt!135018 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268734 () Bool)

(declare-fun res!132985 () Bool)

(assert (=> b!268734 (=> (not res!132985) (not e!173531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268734 (= res!132985 (validKeyInArray!0 k0!2581))))

(declare-fun b!268735 () Bool)

(declare-fun res!132983 () Bool)

(assert (=> b!268735 (=> (not res!132983) (not e!173531))))

(declare-fun arrayContainsKey!0 (array!13142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268735 (= res!132983 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26046 res!132982) b!268732))

(assert (= (and b!268732 res!132987) b!268734))

(assert (= (and b!268734 res!132985) b!268730))

(assert (= (and b!268730 res!132986) b!268735))

(assert (= (and b!268735 res!132983) b!268733))

(assert (= (and b!268733 res!132984) b!268731))

(declare-fun m!284963 () Bool)

(assert (=> b!268730 m!284963))

(declare-fun m!284965 () Bool)

(assert (=> b!268731 m!284965))

(declare-fun m!284967 () Bool)

(assert (=> b!268735 m!284967))

(declare-fun m!284969 () Bool)

(assert (=> b!268733 m!284969))

(declare-fun m!284971 () Bool)

(assert (=> b!268734 m!284971))

(declare-fun m!284973 () Bool)

(assert (=> start!26046 m!284973))

(declare-fun m!284975 () Bool)

(assert (=> start!26046 m!284975))

(check-sat (not start!26046) (not b!268730) (not b!268733) (not b!268731) (not b!268735) (not b!268734))
(check-sat)
