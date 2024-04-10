; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26158 () Bool)

(assert start!26158)

(declare-fun b!270119 () Bool)

(declare-fun res!134186 () Bool)

(declare-fun e!174153 () Bool)

(assert (=> b!270119 (=> (not res!134186) (not e!174153))))

(declare-datatypes ((array!13255 0))(
  ( (array!13256 (arr!6277 (Array (_ BitVec 32) (_ BitVec 64))) (size!6629 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13255)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13255 (_ BitVec 32)) Bool)

(assert (=> b!270119 (= res!134186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270120 () Bool)

(declare-fun e!174152 () Bool)

(assert (=> b!270120 (= e!174153 e!174152)))

(declare-fun res!134188 () Bool)

(assert (=> b!270120 (=> (not res!134188) (not e!174152))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270120 (= res!134188 (= startIndex!26 i!1267))))

(declare-fun lt!135471 () array!13255)

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!270120 (= lt!135471 (array!13256 (store (arr!6277 a!3325) i!1267 k!2581) (size!6629 a!3325)))))

(declare-fun b!270121 () Bool)

(declare-fun res!134183 () Bool)

(declare-fun e!174151 () Bool)

(assert (=> b!270121 (=> (not res!134183) (not e!174151))))

(declare-datatypes ((List!4085 0))(
  ( (Nil!4082) (Cons!4081 (h!4748 (_ BitVec 64)) (t!9167 List!4085)) )
))
(declare-fun arrayNoDuplicates!0 (array!13255 (_ BitVec 32) List!4085) Bool)

(assert (=> b!270121 (= res!134183 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4082))))

(declare-fun b!270122 () Bool)

(declare-fun res!134187 () Bool)

(assert (=> b!270122 (=> (not res!134187) (not e!174151))))

(assert (=> b!270122 (= res!134187 (and (= (size!6629 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6629 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6629 a!3325))))))

(declare-fun b!270123 () Bool)

(declare-datatypes ((Unit!8410 0))(
  ( (Unit!8411) )
))
(declare-fun e!174155 () Unit!8410)

(declare-fun Unit!8412 () Unit!8410)

(assert (=> b!270123 (= e!174155 Unit!8412)))

(declare-fun b!270124 () Bool)

(assert (=> b!270124 (= e!174152 (not true))))

(declare-datatypes ((SeekEntryResult!1435 0))(
  ( (MissingZero!1435 (index!7910 (_ BitVec 32))) (Found!1435 (index!7911 (_ BitVec 32))) (Intermediate!1435 (undefined!2247 Bool) (index!7912 (_ BitVec 32)) (x!26248 (_ BitVec 32))) (Undefined!1435) (MissingVacant!1435 (index!7913 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13255 (_ BitVec 32)) SeekEntryResult!1435)

(assert (=> b!270124 (= (seekEntryOrOpen!0 k!2581 lt!135471 mask!3868) (Found!1435 i!1267))))

(declare-fun lt!135473 () Unit!8410)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13255 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8410)

(assert (=> b!270124 (= lt!135473 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135475 () Unit!8410)

(assert (=> b!270124 (= lt!135475 e!174155)))

(declare-fun c!45519 () Bool)

(assert (=> b!270124 (= c!45519 (bvslt startIndex!26 (bvsub (size!6629 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!134184 () Bool)

(assert (=> start!26158 (=> (not res!134184) (not e!174151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26158 (= res!134184 (validMask!0 mask!3868))))

(assert (=> start!26158 e!174151))

(declare-fun array_inv!4240 (array!13255) Bool)

(assert (=> start!26158 (array_inv!4240 a!3325)))

(assert (=> start!26158 true))

(declare-fun b!270125 () Bool)

(declare-fun lt!135472 () Unit!8410)

(assert (=> b!270125 (= e!174155 lt!135472)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13255 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8410)

(assert (=> b!270125 (= lt!135472 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270125 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135471 mask!3868)))

(declare-fun b!270126 () Bool)

(declare-fun res!134185 () Bool)

(assert (=> b!270126 (=> (not res!134185) (not e!174151))))

(declare-fun arrayContainsKey!0 (array!13255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270126 (= res!134185 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270127 () Bool)

(assert (=> b!270127 (= e!174151 e!174153)))

(declare-fun res!134189 () Bool)

(assert (=> b!270127 (=> (not res!134189) (not e!174153))))

(declare-fun lt!135474 () SeekEntryResult!1435)

(assert (=> b!270127 (= res!134189 (or (= lt!135474 (MissingZero!1435 i!1267)) (= lt!135474 (MissingVacant!1435 i!1267))))))

(assert (=> b!270127 (= lt!135474 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270128 () Bool)

(declare-fun res!134190 () Bool)

(assert (=> b!270128 (=> (not res!134190) (not e!174151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270128 (= res!134190 (validKeyInArray!0 k!2581))))

(assert (= (and start!26158 res!134184) b!270122))

(assert (= (and b!270122 res!134187) b!270128))

(assert (= (and b!270128 res!134190) b!270121))

(assert (= (and b!270121 res!134183) b!270126))

(assert (= (and b!270126 res!134185) b!270127))

(assert (= (and b!270127 res!134189) b!270119))

(assert (= (and b!270119 res!134186) b!270120))

(assert (= (and b!270120 res!134188) b!270124))

(assert (= (and b!270124 c!45519) b!270125))

(assert (= (and b!270124 (not c!45519)) b!270123))

(declare-fun m!285795 () Bool)

(assert (=> b!270119 m!285795))

(declare-fun m!285797 () Bool)

(assert (=> b!270128 m!285797))

(declare-fun m!285799 () Bool)

(assert (=> b!270121 m!285799))

(declare-fun m!285801 () Bool)

(assert (=> b!270124 m!285801))

(declare-fun m!285803 () Bool)

(assert (=> b!270124 m!285803))

(declare-fun m!285805 () Bool)

(assert (=> b!270126 m!285805))

(declare-fun m!285807 () Bool)

(assert (=> b!270120 m!285807))

(declare-fun m!285809 () Bool)

(assert (=> b!270125 m!285809))

(declare-fun m!285811 () Bool)

(assert (=> b!270125 m!285811))

(declare-fun m!285813 () Bool)

(assert (=> start!26158 m!285813))

(declare-fun m!285815 () Bool)

(assert (=> start!26158 m!285815))

(declare-fun m!285817 () Bool)

(assert (=> b!270127 m!285817))

(push 1)

(assert (not b!270119))

(assert (not b!270128))

(assert (not start!26158))

(assert (not b!270121))

