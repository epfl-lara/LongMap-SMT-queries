; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26352 () Bool)

(assert start!26352)

(declare-fun b!273171 () Bool)

(declare-fun res!137166 () Bool)

(declare-fun e!175139 () Bool)

(assert (=> b!273171 (=> (not res!137166) (not e!175139))))

(declare-datatypes ((array!13449 0))(
  ( (array!13450 (arr!6374 (Array (_ BitVec 32) (_ BitVec 64))) (size!6726 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13449)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13449 (_ BitVec 32)) Bool)

(assert (=> b!273171 (= res!137166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!137162 () Bool)

(declare-fun e!175137 () Bool)

(assert (=> start!26352 (=> (not res!137162) (not e!175137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26352 (= res!137162 (validMask!0 mask!3868))))

(assert (=> start!26352 e!175137))

(declare-fun array_inv!4337 (array!13449) Bool)

(assert (=> start!26352 (array_inv!4337 a!3325)))

(assert (=> start!26352 true))

(declare-fun b!273172 () Bool)

(declare-fun res!137163 () Bool)

(assert (=> b!273172 (=> (not res!137163) (not e!175137))))

(declare-datatypes ((List!4182 0))(
  ( (Nil!4179) (Cons!4178 (h!4845 (_ BitVec 64)) (t!9264 List!4182)) )
))
(declare-fun arrayNoDuplicates!0 (array!13449 (_ BitVec 32) List!4182) Bool)

(assert (=> b!273172 (= res!137163 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4179))))

(declare-fun b!273173 () Bool)

(assert (=> b!273173 (= e!175137 e!175139)))

(declare-fun res!137169 () Bool)

(assert (=> b!273173 (=> (not res!137169) (not e!175139))))

(declare-datatypes ((SeekEntryResult!1532 0))(
  ( (MissingZero!1532 (index!8298 (_ BitVec 32))) (Found!1532 (index!8299 (_ BitVec 32))) (Intermediate!1532 (undefined!2344 Bool) (index!8300 (_ BitVec 32)) (x!26609 (_ BitVec 32))) (Undefined!1532) (MissingVacant!1532 (index!8301 (_ BitVec 32))) )
))
(declare-fun lt!136241 () SeekEntryResult!1532)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273173 (= res!137169 (or (= lt!136241 (MissingZero!1532 i!1267)) (= lt!136241 (MissingVacant!1532 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13449 (_ BitVec 32)) SeekEntryResult!1532)

(assert (=> b!273173 (= lt!136241 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273174 () Bool)

(declare-fun e!175138 () Bool)

(assert (=> b!273174 (= e!175138 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lt!136242 () array!13449)

(assert (=> b!273174 (= (seekEntryOrOpen!0 (select (arr!6374 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6374 a!3325) i!1267 k!2581) startIndex!26) lt!136242 mask!3868))))

(declare-datatypes ((Unit!8551 0))(
  ( (Unit!8552) )
))
(declare-fun lt!136243 () Unit!8551)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8551)

(assert (=> b!273174 (= lt!136243 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273174 (arrayNoDuplicates!0 lt!136242 #b00000000000000000000000000000000 Nil!4179)))

(declare-fun lt!136240 () Unit!8551)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13449 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4182) Unit!8551)

(assert (=> b!273174 (= lt!136240 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4179))))

(declare-fun b!273175 () Bool)

(declare-fun res!137164 () Bool)

(assert (=> b!273175 (=> (not res!137164) (not e!175137))))

(declare-fun arrayContainsKey!0 (array!13449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273175 (= res!137164 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273176 () Bool)

(declare-fun res!137165 () Bool)

(assert (=> b!273176 (=> (not res!137165) (not e!175138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273176 (= res!137165 (validKeyInArray!0 (select (arr!6374 a!3325) startIndex!26)))))

(declare-fun b!273177 () Bool)

(declare-fun res!137168 () Bool)

(assert (=> b!273177 (=> (not res!137168) (not e!175137))))

(assert (=> b!273177 (= res!137168 (validKeyInArray!0 k!2581))))

(declare-fun b!273178 () Bool)

(assert (=> b!273178 (= e!175139 e!175138)))

(declare-fun res!137161 () Bool)

(assert (=> b!273178 (=> (not res!137161) (not e!175138))))

(assert (=> b!273178 (= res!137161 (not (= startIndex!26 i!1267)))))

(assert (=> b!273178 (= lt!136242 (array!13450 (store (arr!6374 a!3325) i!1267 k!2581) (size!6726 a!3325)))))

(declare-fun b!273179 () Bool)

(declare-fun res!137167 () Bool)

(assert (=> b!273179 (=> (not res!137167) (not e!175137))))

(assert (=> b!273179 (= res!137167 (and (= (size!6726 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6726 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6726 a!3325))))))

(assert (= (and start!26352 res!137162) b!273179))

(assert (= (and b!273179 res!137167) b!273177))

(assert (= (and b!273177 res!137168) b!273172))

(assert (= (and b!273172 res!137163) b!273175))

(assert (= (and b!273175 res!137164) b!273173))

(assert (= (and b!273173 res!137169) b!273171))

(assert (= (and b!273171 res!137166) b!273178))

(assert (= (and b!273178 res!137161) b!273176))

(assert (= (and b!273176 res!137165) b!273174))

(declare-fun m!288285 () Bool)

(assert (=> b!273171 m!288285))

(declare-fun m!288287 () Bool)

(assert (=> b!273172 m!288287))

(declare-fun m!288289 () Bool)

(assert (=> b!273178 m!288289))

(declare-fun m!288291 () Bool)

(assert (=> b!273177 m!288291))

(declare-fun m!288293 () Bool)

(assert (=> b!273175 m!288293))

(declare-fun m!288295 () Bool)

(assert (=> b!273173 m!288295))

(declare-fun m!288297 () Bool)

(assert (=> start!26352 m!288297))

(declare-fun m!288299 () Bool)

(assert (=> start!26352 m!288299))

(declare-fun m!288301 () Bool)

(assert (=> b!273176 m!288301))

(assert (=> b!273176 m!288301))

(declare-fun m!288303 () Bool)

(assert (=> b!273176 m!288303))

(declare-fun m!288305 () Bool)

(assert (=> b!273174 m!288305))

(declare-fun m!288307 () Bool)

(assert (=> b!273174 m!288307))

(assert (=> b!273174 m!288289))

(assert (=> b!273174 m!288301))

(declare-fun m!288309 () Bool)

(assert (=> b!273174 m!288309))

(declare-fun m!288311 () Bool)

(assert (=> b!273174 m!288311))

(assert (=> b!273174 m!288305))

(declare-fun m!288313 () Bool)

(assert (=> b!273174 m!288313))

(assert (=> b!273174 m!288301))

(declare-fun m!288315 () Bool)

(assert (=> b!273174 m!288315))

(push 1)

