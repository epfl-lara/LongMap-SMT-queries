; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26034 () Bool)

(assert start!26034)

(declare-fun b!268622 () Bool)

(declare-fun e!173476 () Bool)

(declare-fun e!173477 () Bool)

(assert (=> b!268622 (= e!173476 e!173477)))

(declare-fun res!132876 () Bool)

(assert (=> b!268622 (=> (not res!132876) (not e!173477))))

(declare-datatypes ((SeekEntryResult!1337 0))(
  ( (MissingZero!1337 (index!7518 (_ BitVec 32))) (Found!1337 (index!7519 (_ BitVec 32))) (Intermediate!1337 (undefined!2149 Bool) (index!7520 (_ BitVec 32)) (x!25990 (_ BitVec 32))) (Undefined!1337) (MissingVacant!1337 (index!7521 (_ BitVec 32))) )
))
(declare-fun lt!134981 () SeekEntryResult!1337)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268622 (= res!132876 (or (= lt!134981 (MissingZero!1337 i!1267)) (= lt!134981 (MissingVacant!1337 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((array!13130 0))(
  ( (array!13131 (arr!6214 (Array (_ BitVec 32) (_ BitVec 64))) (size!6566 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13130)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13130 (_ BitVec 32)) SeekEntryResult!1337)

(assert (=> b!268622 (= lt!134981 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268623 () Bool)

(declare-fun res!132879 () Bool)

(assert (=> b!268623 (=> (not res!132879) (not e!173476))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268623 (= res!132879 (and (= (size!6566 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6566 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6566 a!3325))))))

(declare-fun b!268624 () Bool)

(declare-fun res!132877 () Bool)

(assert (=> b!268624 (=> (not res!132877) (not e!173476))))

(declare-fun arrayContainsKey!0 (array!13130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268624 (= res!132877 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132875 () Bool)

(assert (=> start!26034 (=> (not res!132875) (not e!173476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26034 (= res!132875 (validMask!0 mask!3868))))

(assert (=> start!26034 e!173476))

(declare-fun array_inv!4164 (array!13130) Bool)

(assert (=> start!26034 (array_inv!4164 a!3325)))

(assert (=> start!26034 true))

(declare-fun b!268625 () Bool)

(declare-fun res!132878 () Bool)

(assert (=> b!268625 (=> (not res!132878) (not e!173476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268625 (= res!132878 (validKeyInArray!0 k0!2581))))

(declare-fun b!268626 () Bool)

(assert (=> b!268626 (= e!173477 false)))

(declare-fun lt!134982 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13130 (_ BitVec 32)) Bool)

(assert (=> b!268626 (= lt!134982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268627 () Bool)

(declare-fun res!132874 () Bool)

(assert (=> b!268627 (=> (not res!132874) (not e!173476))))

(declare-datatypes ((List!3935 0))(
  ( (Nil!3932) (Cons!3931 (h!4598 (_ BitVec 64)) (t!9009 List!3935)) )
))
(declare-fun arrayNoDuplicates!0 (array!13130 (_ BitVec 32) List!3935) Bool)

(assert (=> b!268627 (= res!132874 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3932))))

(assert (= (and start!26034 res!132875) b!268623))

(assert (= (and b!268623 res!132879) b!268625))

(assert (= (and b!268625 res!132878) b!268627))

(assert (= (and b!268627 res!132874) b!268624))

(assert (= (and b!268624 res!132877) b!268622))

(assert (= (and b!268622 res!132876) b!268626))

(declare-fun m!284879 () Bool)

(assert (=> b!268625 m!284879))

(declare-fun m!284881 () Bool)

(assert (=> b!268624 m!284881))

(declare-fun m!284883 () Bool)

(assert (=> start!26034 m!284883))

(declare-fun m!284885 () Bool)

(assert (=> start!26034 m!284885))

(declare-fun m!284887 () Bool)

(assert (=> b!268626 m!284887))

(declare-fun m!284889 () Bool)

(assert (=> b!268627 m!284889))

(declare-fun m!284891 () Bool)

(assert (=> b!268622 m!284891))

(check-sat (not b!268622) (not b!268625) (not b!268627) (not b!268624) (not b!268626) (not start!26034))
(check-sat)
