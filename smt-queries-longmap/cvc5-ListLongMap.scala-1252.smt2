; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26070 () Bool)

(assert start!26070)

(declare-fun b!268899 () Bool)

(declare-fun res!133177 () Bool)

(declare-fun e!173615 () Bool)

(assert (=> b!268899 (=> (not res!133177) (not e!173615))))

(declare-datatypes ((array!13167 0))(
  ( (array!13168 (arr!6233 (Array (_ BitVec 32) (_ BitVec 64))) (size!6585 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13167)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268899 (= res!133177 (and (= (size!6585 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6585 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6585 a!3325))))))

(declare-fun b!268900 () Bool)

(declare-fun res!133179 () Bool)

(assert (=> b!268900 (=> (not res!133179) (not e!173615))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268900 (= res!133179 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268902 () Bool)

(declare-fun e!173614 () Bool)

(assert (=> b!268902 (= e!173614 false)))

(declare-fun lt!135030 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13167 (_ BitVec 32)) Bool)

(assert (=> b!268902 (= lt!135030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268903 () Bool)

(declare-fun res!133181 () Bool)

(assert (=> b!268903 (=> (not res!133181) (not e!173615))))

(declare-datatypes ((List!4041 0))(
  ( (Nil!4038) (Cons!4037 (h!4704 (_ BitVec 64)) (t!9123 List!4041)) )
))
(declare-fun arrayNoDuplicates!0 (array!13167 (_ BitVec 32) List!4041) Bool)

(assert (=> b!268903 (= res!133181 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4038))))

(declare-fun b!268904 () Bool)

(assert (=> b!268904 (= e!173615 e!173614)))

(declare-fun res!133178 () Bool)

(assert (=> b!268904 (=> (not res!133178) (not e!173614))))

(declare-datatypes ((SeekEntryResult!1391 0))(
  ( (MissingZero!1391 (index!7734 (_ BitVec 32))) (Found!1391 (index!7735 (_ BitVec 32))) (Intermediate!1391 (undefined!2203 Bool) (index!7736 (_ BitVec 32)) (x!26092 (_ BitVec 32))) (Undefined!1391) (MissingVacant!1391 (index!7737 (_ BitVec 32))) )
))
(declare-fun lt!135031 () SeekEntryResult!1391)

(assert (=> b!268904 (= res!133178 (or (= lt!135031 (MissingZero!1391 i!1267)) (= lt!135031 (MissingVacant!1391 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13167 (_ BitVec 32)) SeekEntryResult!1391)

(assert (=> b!268904 (= lt!135031 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268901 () Bool)

(declare-fun res!133180 () Bool)

(assert (=> b!268901 (=> (not res!133180) (not e!173615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268901 (= res!133180 (validKeyInArray!0 k!2581))))

(declare-fun res!133182 () Bool)

(assert (=> start!26070 (=> (not res!133182) (not e!173615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26070 (= res!133182 (validMask!0 mask!3868))))

(assert (=> start!26070 e!173615))

(declare-fun array_inv!4196 (array!13167) Bool)

(assert (=> start!26070 (array_inv!4196 a!3325)))

(assert (=> start!26070 true))

(assert (= (and start!26070 res!133182) b!268899))

(assert (= (and b!268899 res!133177) b!268901))

(assert (= (and b!268901 res!133180) b!268903))

(assert (= (and b!268903 res!133181) b!268900))

(assert (= (and b!268900 res!133179) b!268904))

(assert (= (and b!268904 res!133178) b!268902))

(declare-fun m!284925 () Bool)

(assert (=> b!268904 m!284925))

(declare-fun m!284927 () Bool)

(assert (=> b!268901 m!284927))

(declare-fun m!284929 () Bool)

(assert (=> b!268902 m!284929))

(declare-fun m!284931 () Bool)

(assert (=> start!26070 m!284931))

(declare-fun m!284933 () Bool)

(assert (=> start!26070 m!284933))

(declare-fun m!284935 () Bool)

(assert (=> b!268900 m!284935))

(declare-fun m!284937 () Bool)

(assert (=> b!268903 m!284937))

(push 1)

