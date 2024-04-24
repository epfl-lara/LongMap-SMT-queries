; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26070 () Bool)

(assert start!26070)

(declare-fun b!268946 () Bool)

(declare-fun e!173638 () Bool)

(declare-fun e!173639 () Bool)

(assert (=> b!268946 (= e!173638 e!173639)))

(declare-fun res!133200 () Bool)

(assert (=> b!268946 (=> (not res!133200) (not e!173639))))

(declare-datatypes ((SeekEntryResult!1355 0))(
  ( (MissingZero!1355 (index!7590 (_ BitVec 32))) (Found!1355 (index!7591 (_ BitVec 32))) (Intermediate!1355 (undefined!2167 Bool) (index!7592 (_ BitVec 32)) (x!26056 (_ BitVec 32))) (Undefined!1355) (MissingVacant!1355 (index!7593 (_ BitVec 32))) )
))
(declare-fun lt!135090 () SeekEntryResult!1355)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268946 (= res!133200 (or (= lt!135090 (MissingZero!1355 i!1267)) (= lt!135090 (MissingVacant!1355 i!1267))))))

(declare-datatypes ((array!13166 0))(
  ( (array!13167 (arr!6232 (Array (_ BitVec 32) (_ BitVec 64))) (size!6584 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13166)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13166 (_ BitVec 32)) SeekEntryResult!1355)

(assert (=> b!268946 (= lt!135090 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268947 () Bool)

(declare-fun res!133198 () Bool)

(assert (=> b!268947 (=> (not res!133198) (not e!173638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268947 (= res!133198 (validKeyInArray!0 k0!2581))))

(declare-fun b!268948 () Bool)

(declare-fun res!133201 () Bool)

(assert (=> b!268948 (=> (not res!133201) (not e!173638))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268948 (= res!133201 (and (= (size!6584 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6584 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6584 a!3325))))))

(declare-fun res!133202 () Bool)

(assert (=> start!26070 (=> (not res!133202) (not e!173638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26070 (= res!133202 (validMask!0 mask!3868))))

(assert (=> start!26070 e!173638))

(declare-fun array_inv!4182 (array!13166) Bool)

(assert (=> start!26070 (array_inv!4182 a!3325)))

(assert (=> start!26070 true))

(declare-fun b!268949 () Bool)

(declare-fun res!133199 () Bool)

(assert (=> b!268949 (=> (not res!133199) (not e!173638))))

(declare-datatypes ((List!3953 0))(
  ( (Nil!3950) (Cons!3949 (h!4616 (_ BitVec 64)) (t!9027 List!3953)) )
))
(declare-fun arrayNoDuplicates!0 (array!13166 (_ BitVec 32) List!3953) Bool)

(assert (=> b!268949 (= res!133199 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3950))))

(declare-fun b!268950 () Bool)

(declare-fun res!133203 () Bool)

(assert (=> b!268950 (=> (not res!133203) (not e!173638))))

(declare-fun arrayContainsKey!0 (array!13166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268950 (= res!133203 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268951 () Bool)

(assert (=> b!268951 (= e!173639 false)))

(declare-fun lt!135089 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13166 (_ BitVec 32)) Bool)

(assert (=> b!268951 (= lt!135089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26070 res!133202) b!268948))

(assert (= (and b!268948 res!133201) b!268947))

(assert (= (and b!268947 res!133198) b!268949))

(assert (= (and b!268949 res!133199) b!268950))

(assert (= (and b!268950 res!133203) b!268946))

(assert (= (and b!268946 res!133200) b!268951))

(declare-fun m!285131 () Bool)

(assert (=> b!268947 m!285131))

(declare-fun m!285133 () Bool)

(assert (=> b!268950 m!285133))

(declare-fun m!285135 () Bool)

(assert (=> start!26070 m!285135))

(declare-fun m!285137 () Bool)

(assert (=> start!26070 m!285137))

(declare-fun m!285139 () Bool)

(assert (=> b!268949 m!285139))

(declare-fun m!285141 () Bool)

(assert (=> b!268951 m!285141))

(declare-fun m!285143 () Bool)

(assert (=> b!268946 m!285143))

(check-sat (not b!268949) (not b!268947) (not start!26070) (not b!268951) (not b!268946) (not b!268950))
(check-sat)
