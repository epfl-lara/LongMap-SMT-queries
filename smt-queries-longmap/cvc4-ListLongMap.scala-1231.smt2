; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25948 () Bool)

(assert start!25948)

(declare-fun b!267847 () Bool)

(declare-fun e!173129 () Bool)

(assert (=> b!267847 (= e!173129 false)))

(declare-datatypes ((array!13045 0))(
  ( (array!13046 (arr!6172 (Array (_ BitVec 32) (_ BitVec 64))) (size!6524 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13045)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1330 0))(
  ( (MissingZero!1330 (index!7490 (_ BitVec 32))) (Found!1330 (index!7491 (_ BitVec 32))) (Intermediate!1330 (undefined!2142 Bool) (index!7492 (_ BitVec 32)) (x!25863 (_ BitVec 32))) (Undefined!1330) (MissingVacant!1330 (index!7493 (_ BitVec 32))) )
))
(declare-fun lt!134746 () SeekEntryResult!1330)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13045 (_ BitVec 32)) SeekEntryResult!1330)

(assert (=> b!267847 (= lt!134746 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!132125 () Bool)

(assert (=> start!25948 (=> (not res!132125) (not e!173129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25948 (= res!132125 (validMask!0 mask!3868))))

(assert (=> start!25948 e!173129))

(declare-fun array_inv!4135 (array!13045) Bool)

(assert (=> start!25948 (array_inv!4135 a!3325)))

(assert (=> start!25948 true))

(declare-fun b!267848 () Bool)

(declare-fun res!132129 () Bool)

(assert (=> b!267848 (=> (not res!132129) (not e!173129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267848 (= res!132129 (validKeyInArray!0 k!2581))))

(declare-fun b!267849 () Bool)

(declare-fun res!132128 () Bool)

(assert (=> b!267849 (=> (not res!132128) (not e!173129))))

(declare-fun arrayContainsKey!0 (array!13045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267849 (= res!132128 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267850 () Bool)

(declare-fun res!132126 () Bool)

(assert (=> b!267850 (=> (not res!132126) (not e!173129))))

(declare-datatypes ((List!3980 0))(
  ( (Nil!3977) (Cons!3976 (h!4643 (_ BitVec 64)) (t!9062 List!3980)) )
))
(declare-fun arrayNoDuplicates!0 (array!13045 (_ BitVec 32) List!3980) Bool)

(assert (=> b!267850 (= res!132126 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3977))))

(declare-fun b!267851 () Bool)

(declare-fun res!132127 () Bool)

(assert (=> b!267851 (=> (not res!132127) (not e!173129))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267851 (= res!132127 (and (= (size!6524 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6524 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6524 a!3325))))))

(assert (= (and start!25948 res!132125) b!267851))

(assert (= (and b!267851 res!132127) b!267848))

(assert (= (and b!267848 res!132129) b!267850))

(assert (= (and b!267850 res!132126) b!267849))

(assert (= (and b!267849 res!132128) b!267847))

(declare-fun m!284115 () Bool)

(assert (=> b!267850 m!284115))

(declare-fun m!284117 () Bool)

(assert (=> start!25948 m!284117))

(declare-fun m!284119 () Bool)

(assert (=> start!25948 m!284119))

(declare-fun m!284121 () Bool)

(assert (=> b!267848 m!284121))

(declare-fun m!284123 () Bool)

(assert (=> b!267849 m!284123))

(declare-fun m!284125 () Bool)

(assert (=> b!267847 m!284125))

(push 1)

(assert (not start!25948))

(assert (not b!267848))

(assert (not b!267849))

(assert (not b!267850))

(assert (not b!267847))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

