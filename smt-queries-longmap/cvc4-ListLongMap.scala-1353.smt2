; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26680 () Bool)

(assert start!26680)

(declare-fun b!276909 () Bool)

(declare-fun res!140903 () Bool)

(declare-fun e!176837 () Bool)

(assert (=> b!276909 (=> (not res!140903) (not e!176837))))

(declare-datatypes ((array!13777 0))(
  ( (array!13778 (arr!6538 (Array (_ BitVec 32) (_ BitVec 64))) (size!6890 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13777)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276909 (= res!140903 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140901 () Bool)

(assert (=> start!26680 (=> (not res!140901) (not e!176837))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26680 (= res!140901 (validMask!0 mask!3868))))

(assert (=> start!26680 e!176837))

(declare-fun array_inv!4501 (array!13777) Bool)

(assert (=> start!26680 (array_inv!4501 a!3325)))

(assert (=> start!26680 true))

(declare-fun b!276910 () Bool)

(declare-fun e!176835 () Bool)

(assert (=> b!276910 (= e!176837 e!176835)))

(declare-fun res!140904 () Bool)

(assert (=> b!276910 (=> (not res!140904) (not e!176835))))

(declare-datatypes ((SeekEntryResult!1696 0))(
  ( (MissingZero!1696 (index!8954 (_ BitVec 32))) (Found!1696 (index!8955 (_ BitVec 32))) (Intermediate!1696 (undefined!2508 Bool) (index!8956 (_ BitVec 32)) (x!27205 (_ BitVec 32))) (Undefined!1696) (MissingVacant!1696 (index!8957 (_ BitVec 32))) )
))
(declare-fun lt!137787 () SeekEntryResult!1696)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276910 (= res!140904 (or (= lt!137787 (MissingZero!1696 i!1267)) (= lt!137787 (MissingVacant!1696 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13777 (_ BitVec 32)) SeekEntryResult!1696)

(assert (=> b!276910 (= lt!137787 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276911 () Bool)

(declare-fun res!140899 () Bool)

(assert (=> b!276911 (=> (not res!140899) (not e!176837))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276911 (= res!140899 (and (= (size!6890 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6890 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6890 a!3325))))))

(declare-fun b!276912 () Bool)

(assert (=> b!276912 (= e!176835 false)))

(declare-fun lt!137788 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13777 (_ BitVec 32)) Bool)

(assert (=> b!276912 (= lt!137788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276913 () Bool)

(declare-fun res!140902 () Bool)

(assert (=> b!276913 (=> (not res!140902) (not e!176837))))

(declare-datatypes ((List!4346 0))(
  ( (Nil!4343) (Cons!4342 (h!5009 (_ BitVec 64)) (t!9428 List!4346)) )
))
(declare-fun arrayNoDuplicates!0 (array!13777 (_ BitVec 32) List!4346) Bool)

(assert (=> b!276913 (= res!140902 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4343))))

(declare-fun b!276914 () Bool)

(declare-fun res!140900 () Bool)

(assert (=> b!276914 (=> (not res!140900) (not e!176837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276914 (= res!140900 (validKeyInArray!0 k!2581))))

(assert (= (and start!26680 res!140901) b!276911))

(assert (= (and b!276911 res!140899) b!276914))

(assert (= (and b!276914 res!140900) b!276913))

(assert (= (and b!276913 res!140902) b!276909))

(assert (= (and b!276909 res!140903) b!276910))

(assert (= (and b!276910 res!140904) b!276912))

(declare-fun m!292135 () Bool)

(assert (=> b!276914 m!292135))

(declare-fun m!292137 () Bool)

(assert (=> b!276912 m!292137))

(declare-fun m!292139 () Bool)

(assert (=> start!26680 m!292139))

(declare-fun m!292141 () Bool)

(assert (=> start!26680 m!292141))

(declare-fun m!292143 () Bool)

(assert (=> b!276913 m!292143))

(declare-fun m!292145 () Bool)

(assert (=> b!276910 m!292145))

(declare-fun m!292147 () Bool)

(assert (=> b!276909 m!292147))

(push 1)

(assert (not b!276912))

(assert (not start!26680))

(assert (not b!276910))

(assert (not b!276913))

(assert (not b!276914))

