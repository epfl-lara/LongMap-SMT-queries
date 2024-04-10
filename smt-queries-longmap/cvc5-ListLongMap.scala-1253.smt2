; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26076 () Bool)

(assert start!26076)

(declare-fun b!268953 () Bool)

(declare-fun e!173641 () Bool)

(assert (=> b!268953 (= e!173641 false)))

(declare-fun lt!135048 () Bool)

(declare-datatypes ((array!13173 0))(
  ( (array!13174 (arr!6236 (Array (_ BitVec 32) (_ BitVec 64))) (size!6588 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13173)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13173 (_ BitVec 32)) Bool)

(assert (=> b!268953 (= lt!135048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268954 () Bool)

(declare-fun res!133231 () Bool)

(declare-fun e!173640 () Bool)

(assert (=> b!268954 (=> (not res!133231) (not e!173640))))

(declare-datatypes ((List!4044 0))(
  ( (Nil!4041) (Cons!4040 (h!4707 (_ BitVec 64)) (t!9126 List!4044)) )
))
(declare-fun arrayNoDuplicates!0 (array!13173 (_ BitVec 32) List!4044) Bool)

(assert (=> b!268954 (= res!133231 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4041))))

(declare-fun b!268955 () Bool)

(assert (=> b!268955 (= e!173640 e!173641)))

(declare-fun res!133234 () Bool)

(assert (=> b!268955 (=> (not res!133234) (not e!173641))))

(declare-datatypes ((SeekEntryResult!1394 0))(
  ( (MissingZero!1394 (index!7746 (_ BitVec 32))) (Found!1394 (index!7747 (_ BitVec 32))) (Intermediate!1394 (undefined!2206 Bool) (index!7748 (_ BitVec 32)) (x!26103 (_ BitVec 32))) (Undefined!1394) (MissingVacant!1394 (index!7749 (_ BitVec 32))) )
))
(declare-fun lt!135049 () SeekEntryResult!1394)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268955 (= res!133234 (or (= lt!135049 (MissingZero!1394 i!1267)) (= lt!135049 (MissingVacant!1394 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13173 (_ BitVec 32)) SeekEntryResult!1394)

(assert (=> b!268955 (= lt!135049 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268956 () Bool)

(declare-fun res!133233 () Bool)

(assert (=> b!268956 (=> (not res!133233) (not e!173640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268956 (= res!133233 (validKeyInArray!0 k!2581))))

(declare-fun b!268957 () Bool)

(declare-fun res!133236 () Bool)

(assert (=> b!268957 (=> (not res!133236) (not e!173640))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268957 (= res!133236 (and (= (size!6588 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6588 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6588 a!3325))))))

(declare-fun res!133235 () Bool)

(assert (=> start!26076 (=> (not res!133235) (not e!173640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26076 (= res!133235 (validMask!0 mask!3868))))

(assert (=> start!26076 e!173640))

(declare-fun array_inv!4199 (array!13173) Bool)

(assert (=> start!26076 (array_inv!4199 a!3325)))

(assert (=> start!26076 true))

(declare-fun b!268958 () Bool)

(declare-fun res!133232 () Bool)

(assert (=> b!268958 (=> (not res!133232) (not e!173640))))

(declare-fun arrayContainsKey!0 (array!13173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268958 (= res!133232 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26076 res!133235) b!268957))

(assert (= (and b!268957 res!133236) b!268956))

(assert (= (and b!268956 res!133233) b!268954))

(assert (= (and b!268954 res!133231) b!268958))

(assert (= (and b!268958 res!133232) b!268955))

(assert (= (and b!268955 res!133234) b!268953))

(declare-fun m!284967 () Bool)

(assert (=> b!268956 m!284967))

(declare-fun m!284969 () Bool)

(assert (=> b!268953 m!284969))

(declare-fun m!284971 () Bool)

(assert (=> b!268958 m!284971))

(declare-fun m!284973 () Bool)

(assert (=> start!26076 m!284973))

(declare-fun m!284975 () Bool)

(assert (=> start!26076 m!284975))

(declare-fun m!284977 () Bool)

(assert (=> b!268955 m!284977))

(declare-fun m!284979 () Bool)

(assert (=> b!268954 m!284979))

(push 1)

