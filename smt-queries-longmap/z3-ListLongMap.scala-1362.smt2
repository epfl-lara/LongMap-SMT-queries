; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26730 () Bool)

(assert start!26730)

(declare-fun b!277675 () Bool)

(declare-fun res!141511 () Bool)

(declare-fun e!177149 () Bool)

(assert (=> b!277675 (=> (not res!141511) (not e!177149))))

(declare-datatypes ((array!13826 0))(
  ( (array!13827 (arr!6562 (Array (_ BitVec 32) (_ BitVec 64))) (size!6914 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13826)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277675 (= res!141511 (and (= (size!6914 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6914 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6914 a!3325))))))

(declare-fun b!277676 () Bool)

(declare-fun res!141509 () Bool)

(assert (=> b!277676 (=> (not res!141509) (not e!177149))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277676 (= res!141509 (validKeyInArray!0 k0!2581))))

(declare-fun b!277677 () Bool)

(declare-fun res!141512 () Bool)

(declare-fun e!177150 () Bool)

(assert (=> b!277677 (=> (not res!141512) (not e!177150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13826 (_ BitVec 32)) Bool)

(assert (=> b!277677 (= res!141512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277678 () Bool)

(assert (=> b!277678 (= e!177149 e!177150)))

(declare-fun res!141510 () Bool)

(assert (=> b!277678 (=> (not res!141510) (not e!177150))))

(declare-datatypes ((SeekEntryResult!1685 0))(
  ( (MissingZero!1685 (index!8910 (_ BitVec 32))) (Found!1685 (index!8911 (_ BitVec 32))) (Intermediate!1685 (undefined!2497 Bool) (index!8912 (_ BitVec 32)) (x!27266 (_ BitVec 32))) (Undefined!1685) (MissingVacant!1685 (index!8913 (_ BitVec 32))) )
))
(declare-fun lt!138054 () SeekEntryResult!1685)

(assert (=> b!277678 (= res!141510 (or (= lt!138054 (MissingZero!1685 i!1267)) (= lt!138054 (MissingVacant!1685 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13826 (_ BitVec 32)) SeekEntryResult!1685)

(assert (=> b!277678 (= lt!138054 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277679 () Bool)

(assert (=> b!277679 (= e!177150 false)))

(declare-datatypes ((Unit!8744 0))(
  ( (Unit!8745) )
))
(declare-fun lt!138053 () Unit!8744)

(declare-fun e!177151 () Unit!8744)

(assert (=> b!277679 (= lt!138053 e!177151)))

(declare-fun c!45634 () Bool)

(assert (=> b!277679 (= c!45634 (bvslt startIndex!26 (bvsub (size!6914 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141516 () Bool)

(assert (=> start!26730 (=> (not res!141516) (not e!177149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26730 (= res!141516 (validMask!0 mask!3868))))

(assert (=> start!26730 e!177149))

(declare-fun array_inv!4512 (array!13826) Bool)

(assert (=> start!26730 (array_inv!4512 a!3325)))

(assert (=> start!26730 true))

(declare-fun b!277680 () Bool)

(declare-fun res!141514 () Bool)

(assert (=> b!277680 (=> (not res!141514) (not e!177150))))

(assert (=> b!277680 (= res!141514 (= startIndex!26 i!1267))))

(declare-fun b!277681 () Bool)

(declare-fun res!141515 () Bool)

(assert (=> b!277681 (=> (not res!141515) (not e!177149))))

(declare-datatypes ((List!4283 0))(
  ( (Nil!4280) (Cons!4279 (h!4946 (_ BitVec 64)) (t!9357 List!4283)) )
))
(declare-fun arrayNoDuplicates!0 (array!13826 (_ BitVec 32) List!4283) Bool)

(assert (=> b!277681 (= res!141515 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4280))))

(declare-fun b!277682 () Bool)

(declare-fun lt!138052 () Unit!8744)

(assert (=> b!277682 (= e!177151 lt!138052)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13826 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8744)

(assert (=> b!277682 (= lt!138052 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277682 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13827 (store (arr!6562 a!3325) i!1267 k0!2581) (size!6914 a!3325)) mask!3868)))

(declare-fun b!277683 () Bool)

(declare-fun Unit!8746 () Unit!8744)

(assert (=> b!277683 (= e!177151 Unit!8746)))

(declare-fun b!277684 () Bool)

(declare-fun res!141513 () Bool)

(assert (=> b!277684 (=> (not res!141513) (not e!177149))))

(declare-fun arrayContainsKey!0 (array!13826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277684 (= res!141513 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26730 res!141516) b!277675))

(assert (= (and b!277675 res!141511) b!277676))

(assert (= (and b!277676 res!141509) b!277681))

(assert (= (and b!277681 res!141515) b!277684))

(assert (= (and b!277684 res!141513) b!277678))

(assert (= (and b!277678 res!141510) b!277677))

(assert (= (and b!277677 res!141512) b!277680))

(assert (= (and b!277680 res!141514) b!277679))

(assert (= (and b!277679 c!45634) b!277682))

(assert (= (and b!277679 (not c!45634)) b!277683))

(declare-fun m!292817 () Bool)

(assert (=> b!277676 m!292817))

(declare-fun m!292819 () Bool)

(assert (=> b!277678 m!292819))

(declare-fun m!292821 () Bool)

(assert (=> b!277677 m!292821))

(declare-fun m!292823 () Bool)

(assert (=> b!277684 m!292823))

(declare-fun m!292825 () Bool)

(assert (=> start!26730 m!292825))

(declare-fun m!292827 () Bool)

(assert (=> start!26730 m!292827))

(declare-fun m!292829 () Bool)

(assert (=> b!277682 m!292829))

(declare-fun m!292831 () Bool)

(assert (=> b!277682 m!292831))

(declare-fun m!292833 () Bool)

(assert (=> b!277682 m!292833))

(declare-fun m!292835 () Bool)

(assert (=> b!277681 m!292835))

(check-sat (not b!277681) (not b!277682) (not start!26730) (not b!277684) (not b!277677) (not b!277678) (not b!277676))
(check-sat)
