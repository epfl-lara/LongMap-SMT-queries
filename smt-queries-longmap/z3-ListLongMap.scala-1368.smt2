; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26904 () Bool)

(assert start!26904)

(declare-fun res!142199 () Bool)

(declare-fun e!177855 () Bool)

(assert (=> start!26904 (=> (not res!142199) (not e!177855))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26904 (= res!142199 (validMask!0 mask!3868))))

(assert (=> start!26904 e!177855))

(declare-datatypes ((array!13868 0))(
  ( (array!13869 (arr!6580 (Array (_ BitVec 32) (_ BitVec 64))) (size!6932 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13868)

(declare-fun array_inv!4530 (array!13868) Bool)

(assert (=> start!26904 (array_inv!4530 a!3325)))

(assert (=> start!26904 true))

(declare-fun b!278885 () Bool)

(declare-fun e!177856 () Bool)

(assert (=> b!278885 (= e!177856 false)))

(declare-fun lt!138554 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13868 (_ BitVec 32)) Bool)

(assert (=> b!278885 (= lt!138554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278886 () Bool)

(declare-fun res!142203 () Bool)

(assert (=> b!278886 (=> (not res!142203) (not e!177855))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278886 (= res!142203 (and (= (size!6932 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6932 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6932 a!3325))))))

(declare-fun b!278887 () Bool)

(declare-fun res!142200 () Bool)

(assert (=> b!278887 (=> (not res!142200) (not e!177855))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278887 (= res!142200 (validKeyInArray!0 k0!2581))))

(declare-fun b!278888 () Bool)

(assert (=> b!278888 (= e!177855 e!177856)))

(declare-fun res!142202 () Bool)

(assert (=> b!278888 (=> (not res!142202) (not e!177856))))

(declare-datatypes ((SeekEntryResult!1703 0))(
  ( (MissingZero!1703 (index!8982 (_ BitVec 32))) (Found!1703 (index!8983 (_ BitVec 32))) (Intermediate!1703 (undefined!2515 Bool) (index!8984 (_ BitVec 32)) (x!27341 (_ BitVec 32))) (Undefined!1703) (MissingVacant!1703 (index!8985 (_ BitVec 32))) )
))
(declare-fun lt!138555 () SeekEntryResult!1703)

(assert (=> b!278888 (= res!142202 (or (= lt!138555 (MissingZero!1703 i!1267)) (= lt!138555 (MissingVacant!1703 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13868 (_ BitVec 32)) SeekEntryResult!1703)

(assert (=> b!278888 (= lt!138555 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!278889 () Bool)

(declare-fun res!142201 () Bool)

(assert (=> b!278889 (=> (not res!142201) (not e!177855))))

(declare-fun arrayContainsKey!0 (array!13868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278889 (= res!142201 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278890 () Bool)

(declare-fun res!142198 () Bool)

(assert (=> b!278890 (=> (not res!142198) (not e!177855))))

(declare-datatypes ((List!4301 0))(
  ( (Nil!4298) (Cons!4297 (h!4967 (_ BitVec 64)) (t!9375 List!4301)) )
))
(declare-fun arrayNoDuplicates!0 (array!13868 (_ BitVec 32) List!4301) Bool)

(assert (=> b!278890 (= res!142198 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4298))))

(assert (= (and start!26904 res!142199) b!278886))

(assert (= (and b!278886 res!142203) b!278887))

(assert (= (and b!278887 res!142200) b!278890))

(assert (= (and b!278890 res!142198) b!278889))

(assert (= (and b!278889 res!142201) b!278888))

(assert (= (and b!278888 res!142202) b!278885))

(declare-fun m!293993 () Bool)

(assert (=> b!278885 m!293993))

(declare-fun m!293995 () Bool)

(assert (=> b!278890 m!293995))

(declare-fun m!293997 () Bool)

(assert (=> b!278888 m!293997))

(declare-fun m!293999 () Bool)

(assert (=> b!278887 m!293999))

(declare-fun m!294001 () Bool)

(assert (=> start!26904 m!294001))

(declare-fun m!294003 () Bool)

(assert (=> start!26904 m!294003))

(declare-fun m!294005 () Bool)

(assert (=> b!278889 m!294005))

(check-sat (not start!26904) (not b!278890) (not b!278885) (not b!278887) (not b!278889) (not b!278888))
(check-sat)
