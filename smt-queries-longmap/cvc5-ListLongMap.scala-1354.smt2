; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26682 () Bool)

(assert start!26682)

(declare-fun b!276929 () Bool)

(declare-fun res!140924 () Bool)

(declare-fun e!176846 () Bool)

(assert (=> b!276929 (=> (not res!140924) (not e!176846))))

(declare-datatypes ((array!13779 0))(
  ( (array!13780 (arr!6539 (Array (_ BitVec 32) (_ BitVec 64))) (size!6891 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13779)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276929 (= res!140924 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276930 () Bool)

(declare-fun res!140921 () Bool)

(assert (=> b!276930 (=> (not res!140921) (not e!176846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276930 (= res!140921 (validKeyInArray!0 k!2581))))

(declare-fun res!140920 () Bool)

(assert (=> start!26682 (=> (not res!140920) (not e!176846))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26682 (= res!140920 (validMask!0 mask!3868))))

(assert (=> start!26682 e!176846))

(declare-fun array_inv!4502 (array!13779) Bool)

(assert (=> start!26682 (array_inv!4502 a!3325)))

(assert (=> start!26682 true))

(declare-fun b!276931 () Bool)

(declare-fun res!140919 () Bool)

(declare-fun e!176844 () Bool)

(assert (=> b!276931 (=> (not res!140919) (not e!176844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13779 (_ BitVec 32)) Bool)

(assert (=> b!276931 (= res!140919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276932 () Bool)

(assert (=> b!276932 (= e!176846 e!176844)))

(declare-fun res!140923 () Bool)

(assert (=> b!276932 (=> (not res!140923) (not e!176844))))

(declare-datatypes ((SeekEntryResult!1697 0))(
  ( (MissingZero!1697 (index!8958 (_ BitVec 32))) (Found!1697 (index!8959 (_ BitVec 32))) (Intermediate!1697 (undefined!2509 Bool) (index!8960 (_ BitVec 32)) (x!27214 (_ BitVec 32))) (Undefined!1697) (MissingVacant!1697 (index!8961 (_ BitVec 32))) )
))
(declare-fun lt!137791 () SeekEntryResult!1697)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276932 (= res!140923 (or (= lt!137791 (MissingZero!1697 i!1267)) (= lt!137791 (MissingVacant!1697 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13779 (_ BitVec 32)) SeekEntryResult!1697)

(assert (=> b!276932 (= lt!137791 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276933 () Bool)

(declare-fun res!140922 () Bool)

(assert (=> b!276933 (=> (not res!140922) (not e!176846))))

(declare-datatypes ((List!4347 0))(
  ( (Nil!4344) (Cons!4343 (h!5010 (_ BitVec 64)) (t!9429 List!4347)) )
))
(declare-fun arrayNoDuplicates!0 (array!13779 (_ BitVec 32) List!4347) Bool)

(assert (=> b!276933 (= res!140922 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4344))))

(declare-fun b!276934 () Bool)

(declare-fun res!140925 () Bool)

(assert (=> b!276934 (=> (not res!140925) (not e!176846))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276934 (= res!140925 (and (= (size!6891 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6891 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6891 a!3325))))))

(declare-fun b!276935 () Bool)

(assert (=> b!276935 (= e!176844 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6891 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!6891 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!6891 a!3325) startIndex!26))))))

(assert (= (and start!26682 res!140920) b!276934))

(assert (= (and b!276934 res!140925) b!276930))

(assert (= (and b!276930 res!140921) b!276933))

(assert (= (and b!276933 res!140922) b!276929))

(assert (= (and b!276929 res!140924) b!276932))

(assert (= (and b!276932 res!140923) b!276931))

(assert (= (and b!276931 res!140919) b!276935))

(declare-fun m!292149 () Bool)

(assert (=> b!276929 m!292149))

(declare-fun m!292151 () Bool)

(assert (=> b!276932 m!292151))

(declare-fun m!292153 () Bool)

(assert (=> b!276930 m!292153))

(declare-fun m!292155 () Bool)

(assert (=> start!26682 m!292155))

(declare-fun m!292157 () Bool)

(assert (=> start!26682 m!292157))

(declare-fun m!292159 () Bool)

(assert (=> b!276931 m!292159))

(declare-fun m!292161 () Bool)

(assert (=> b!276933 m!292161))

(push 1)

(assert (not b!276929))

(assert (not start!26682))

(assert (not b!276933))

(assert (not b!276930))

(assert (not b!276932))

(assert (not b!276931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

