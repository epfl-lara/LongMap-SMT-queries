; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26694 () Bool)

(assert start!26694)

(declare-fun b!277135 () Bool)

(declare-fun res!141080 () Bool)

(declare-fun e!176935 () Bool)

(assert (=> b!277135 (=> (not res!141080) (not e!176935))))

(declare-datatypes ((array!13790 0))(
  ( (array!13791 (arr!6544 (Array (_ BitVec 32) (_ BitVec 64))) (size!6896 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13790)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!277135 (= res!141080 (and (= (size!6896 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6896 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6896 a!3325))))))

(declare-fun b!277136 () Bool)

(declare-fun e!176933 () Bool)

(assert (=> b!277136 (= e!176933 false)))

(declare-datatypes ((Unit!8690 0))(
  ( (Unit!8691) )
))
(declare-fun lt!137890 () Unit!8690)

(declare-fun e!176936 () Unit!8690)

(assert (=> b!277136 (= lt!137890 e!176936)))

(declare-fun c!45580 () Bool)

(assert (=> b!277136 (= c!45580 (bvslt startIndex!26 (bvsub (size!6896 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277137 () Bool)

(declare-fun res!141083 () Bool)

(assert (=> b!277137 (=> (not res!141083) (not e!176933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13790 (_ BitVec 32)) Bool)

(assert (=> b!277137 (= res!141083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277138 () Bool)

(declare-fun Unit!8692 () Unit!8690)

(assert (=> b!277138 (= e!176936 Unit!8692)))

(declare-fun b!277139 () Bool)

(assert (=> b!277139 (= e!176935 e!176933)))

(declare-fun res!141081 () Bool)

(assert (=> b!277139 (=> (not res!141081) (not e!176933))))

(declare-datatypes ((SeekEntryResult!1667 0))(
  ( (MissingZero!1667 (index!8838 (_ BitVec 32))) (Found!1667 (index!8839 (_ BitVec 32))) (Intermediate!1667 (undefined!2479 Bool) (index!8840 (_ BitVec 32)) (x!27200 (_ BitVec 32))) (Undefined!1667) (MissingVacant!1667 (index!8841 (_ BitVec 32))) )
))
(declare-fun lt!137892 () SeekEntryResult!1667)

(assert (=> b!277139 (= res!141081 (or (= lt!137892 (MissingZero!1667 i!1267)) (= lt!137892 (MissingVacant!1667 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13790 (_ BitVec 32)) SeekEntryResult!1667)

(assert (=> b!277139 (= lt!137892 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277140 () Bool)

(declare-fun res!141084 () Bool)

(assert (=> b!277140 (=> (not res!141084) (not e!176935))))

(declare-datatypes ((List!4265 0))(
  ( (Nil!4262) (Cons!4261 (h!4928 (_ BitVec 64)) (t!9339 List!4265)) )
))
(declare-fun arrayNoDuplicates!0 (array!13790 (_ BitVec 32) List!4265) Bool)

(assert (=> b!277140 (= res!141084 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4262))))

(declare-fun b!277141 () Bool)

(declare-fun lt!137891 () Unit!8690)

(assert (=> b!277141 (= e!176936 lt!137891)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13790 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8690)

(assert (=> b!277141 (= lt!137891 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277141 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13791 (store (arr!6544 a!3325) i!1267 k0!2581) (size!6896 a!3325)) mask!3868)))

(declare-fun b!277142 () Bool)

(declare-fun res!141078 () Bool)

(assert (=> b!277142 (=> (not res!141078) (not e!176935))))

(declare-fun arrayContainsKey!0 (array!13790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277142 (= res!141078 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277143 () Bool)

(declare-fun res!141082 () Bool)

(assert (=> b!277143 (=> (not res!141082) (not e!176935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277143 (= res!141082 (validKeyInArray!0 k0!2581))))

(declare-fun res!141077 () Bool)

(assert (=> start!26694 (=> (not res!141077) (not e!176935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26694 (= res!141077 (validMask!0 mask!3868))))

(assert (=> start!26694 e!176935))

(declare-fun array_inv!4494 (array!13790) Bool)

(assert (=> start!26694 (array_inv!4494 a!3325)))

(assert (=> start!26694 true))

(declare-fun b!277144 () Bool)

(declare-fun res!141079 () Bool)

(assert (=> b!277144 (=> (not res!141079) (not e!176933))))

(assert (=> b!277144 (= res!141079 (= startIndex!26 i!1267))))

(assert (= (and start!26694 res!141077) b!277135))

(assert (= (and b!277135 res!141080) b!277143))

(assert (= (and b!277143 res!141082) b!277140))

(assert (= (and b!277140 res!141084) b!277142))

(assert (= (and b!277142 res!141078) b!277139))

(assert (= (and b!277139 res!141081) b!277137))

(assert (= (and b!277137 res!141083) b!277144))

(assert (= (and b!277144 res!141079) b!277136))

(assert (= (and b!277136 c!45580) b!277141))

(assert (= (and b!277136 (not c!45580)) b!277138))

(declare-fun m!292457 () Bool)

(assert (=> b!277137 m!292457))

(declare-fun m!292459 () Bool)

(assert (=> b!277140 m!292459))

(declare-fun m!292461 () Bool)

(assert (=> start!26694 m!292461))

(declare-fun m!292463 () Bool)

(assert (=> start!26694 m!292463))

(declare-fun m!292465 () Bool)

(assert (=> b!277143 m!292465))

(declare-fun m!292467 () Bool)

(assert (=> b!277139 m!292467))

(declare-fun m!292469 () Bool)

(assert (=> b!277141 m!292469))

(declare-fun m!292471 () Bool)

(assert (=> b!277141 m!292471))

(declare-fun m!292473 () Bool)

(assert (=> b!277141 m!292473))

(declare-fun m!292475 () Bool)

(assert (=> b!277142 m!292475))

(check-sat (not b!277143) (not b!277139) (not start!26694) (not b!277137) (not b!277142) (not b!277140) (not b!277141))
(check-sat)
