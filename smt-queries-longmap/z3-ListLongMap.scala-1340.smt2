; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26600 () Bool)

(assert start!26600)

(declare-fun b!276176 () Bool)

(declare-fun e!176477 () Bool)

(declare-datatypes ((array!13697 0))(
  ( (array!13698 (arr!6498 (Array (_ BitVec 32) (_ BitVec 64))) (size!6850 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13697)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276176 (= e!176477 (bvslt (bvsub (size!6850 a!3325) startIndex!26) #b00000000000000000000000000000000))))

(declare-fun b!276177 () Bool)

(declare-fun res!140168 () Bool)

(declare-fun e!176475 () Bool)

(assert (=> b!276177 (=> (not res!140168) (not e!176475))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276177 (= res!140168 (validKeyInArray!0 k0!2581))))

(declare-fun b!276178 () Bool)

(declare-fun res!140171 () Bool)

(assert (=> b!276178 (=> (not res!140171) (not e!176475))))

(declare-fun arrayContainsKey!0 (array!13697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276178 (= res!140171 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276179 () Bool)

(declare-fun res!140169 () Bool)

(assert (=> b!276179 (=> (not res!140169) (not e!176475))))

(declare-datatypes ((List!4306 0))(
  ( (Nil!4303) (Cons!4302 (h!4969 (_ BitVec 64)) (t!9388 List!4306)) )
))
(declare-fun arrayNoDuplicates!0 (array!13697 (_ BitVec 32) List!4306) Bool)

(assert (=> b!276179 (= res!140169 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4303))))

(declare-fun res!140166 () Bool)

(assert (=> start!26600 (=> (not res!140166) (not e!176475))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26600 (= res!140166 (validMask!0 mask!3868))))

(assert (=> start!26600 e!176475))

(declare-fun array_inv!4461 (array!13697) Bool)

(assert (=> start!26600 (array_inv!4461 a!3325)))

(assert (=> start!26600 true))

(declare-fun b!276180 () Bool)

(declare-fun res!140172 () Bool)

(assert (=> b!276180 (=> (not res!140172) (not e!176475))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276180 (= res!140172 (and (= (size!6850 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6850 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6850 a!3325))))))

(declare-fun b!276181 () Bool)

(assert (=> b!276181 (= e!176475 e!176477)))

(declare-fun res!140167 () Bool)

(assert (=> b!276181 (=> (not res!140167) (not e!176477))))

(declare-datatypes ((SeekEntryResult!1656 0))(
  ( (MissingZero!1656 (index!8794 (_ BitVec 32))) (Found!1656 (index!8795 (_ BitVec 32))) (Intermediate!1656 (undefined!2468 Bool) (index!8796 (_ BitVec 32)) (x!27061 (_ BitVec 32))) (Undefined!1656) (MissingVacant!1656 (index!8797 (_ BitVec 32))) )
))
(declare-fun lt!137560 () SeekEntryResult!1656)

(assert (=> b!276181 (= res!140167 (or (= lt!137560 (MissingZero!1656 i!1267)) (= lt!137560 (MissingVacant!1656 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13697 (_ BitVec 32)) SeekEntryResult!1656)

(assert (=> b!276181 (= lt!137560 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276182 () Bool)

(declare-fun res!140170 () Bool)

(assert (=> b!276182 (=> (not res!140170) (not e!176477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13697 (_ BitVec 32)) Bool)

(assert (=> b!276182 (= res!140170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26600 res!140166) b!276180))

(assert (= (and b!276180 res!140172) b!276177))

(assert (= (and b!276177 res!140168) b!276179))

(assert (= (and b!276179 res!140169) b!276178))

(assert (= (and b!276178 res!140171) b!276181))

(assert (= (and b!276181 res!140167) b!276182))

(assert (= (and b!276182 res!140170) b!276176))

(declare-fun m!291575 () Bool)

(assert (=> b!276178 m!291575))

(declare-fun m!291577 () Bool)

(assert (=> b!276181 m!291577))

(declare-fun m!291579 () Bool)

(assert (=> b!276177 m!291579))

(declare-fun m!291581 () Bool)

(assert (=> b!276179 m!291581))

(declare-fun m!291583 () Bool)

(assert (=> start!26600 m!291583))

(declare-fun m!291585 () Bool)

(assert (=> start!26600 m!291585))

(declare-fun m!291587 () Bool)

(assert (=> b!276182 m!291587))

(check-sat (not start!26600) (not b!276177) (not b!276182) (not b!276181) (not b!276178) (not b!276179))
(check-sat)
