; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26658 () Bool)

(assert start!26658)

(declare-fun b!276711 () Bool)

(declare-fun res!140701 () Bool)

(declare-fun e!176738 () Bool)

(assert (=> b!276711 (=> (not res!140701) (not e!176738))))

(declare-datatypes ((array!13755 0))(
  ( (array!13756 (arr!6527 (Array (_ BitVec 32) (_ BitVec 64))) (size!6879 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13755)

(declare-datatypes ((List!4335 0))(
  ( (Nil!4332) (Cons!4331 (h!4998 (_ BitVec 64)) (t!9417 List!4335)) )
))
(declare-fun arrayNoDuplicates!0 (array!13755 (_ BitVec 32) List!4335) Bool)

(assert (=> b!276711 (= res!140701 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4332))))

(declare-fun b!276712 () Bool)

(declare-fun res!140706 () Bool)

(assert (=> b!276712 (=> (not res!140706) (not e!176738))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276712 (= res!140706 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140703 () Bool)

(assert (=> start!26658 (=> (not res!140703) (not e!176738))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26658 (= res!140703 (validMask!0 mask!3868))))

(assert (=> start!26658 e!176738))

(declare-fun array_inv!4490 (array!13755) Bool)

(assert (=> start!26658 (array_inv!4490 a!3325)))

(assert (=> start!26658 true))

(declare-fun b!276713 () Bool)

(declare-fun e!176737 () Bool)

(assert (=> b!276713 (= e!176737 false)))

(declare-fun lt!137721 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13755 (_ BitVec 32)) Bool)

(assert (=> b!276713 (= lt!137721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276714 () Bool)

(declare-fun res!140702 () Bool)

(assert (=> b!276714 (=> (not res!140702) (not e!176738))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276714 (= res!140702 (and (= (size!6879 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6879 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6879 a!3325))))))

(declare-fun b!276715 () Bool)

(assert (=> b!276715 (= e!176738 e!176737)))

(declare-fun res!140704 () Bool)

(assert (=> b!276715 (=> (not res!140704) (not e!176737))))

(declare-datatypes ((SeekEntryResult!1685 0))(
  ( (MissingZero!1685 (index!8910 (_ BitVec 32))) (Found!1685 (index!8911 (_ BitVec 32))) (Intermediate!1685 (undefined!2497 Bool) (index!8912 (_ BitVec 32)) (x!27170 (_ BitVec 32))) (Undefined!1685) (MissingVacant!1685 (index!8913 (_ BitVec 32))) )
))
(declare-fun lt!137722 () SeekEntryResult!1685)

(assert (=> b!276715 (= res!140704 (or (= lt!137722 (MissingZero!1685 i!1267)) (= lt!137722 (MissingVacant!1685 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13755 (_ BitVec 32)) SeekEntryResult!1685)

(assert (=> b!276715 (= lt!137722 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276716 () Bool)

(declare-fun res!140705 () Bool)

(assert (=> b!276716 (=> (not res!140705) (not e!176738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276716 (= res!140705 (validKeyInArray!0 k!2581))))

(assert (= (and start!26658 res!140703) b!276714))

(assert (= (and b!276714 res!140702) b!276716))

(assert (= (and b!276716 res!140705) b!276711))

(assert (= (and b!276711 res!140701) b!276712))

(assert (= (and b!276712 res!140706) b!276715))

(assert (= (and b!276715 res!140704) b!276713))

(declare-fun m!291981 () Bool)

(assert (=> start!26658 m!291981))

(declare-fun m!291983 () Bool)

(assert (=> start!26658 m!291983))

(declare-fun m!291985 () Bool)

(assert (=> b!276713 m!291985))

(declare-fun m!291987 () Bool)

(assert (=> b!276715 m!291987))

(declare-fun m!291989 () Bool)

(assert (=> b!276716 m!291989))

(declare-fun m!291991 () Bool)

(assert (=> b!276711 m!291991))

(declare-fun m!291993 () Bool)

(assert (=> b!276712 m!291993))

(push 1)

