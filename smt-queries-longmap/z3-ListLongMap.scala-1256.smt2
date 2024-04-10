; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26096 () Bool)

(assert start!26096)

(declare-fun b!269189 () Bool)

(declare-datatypes ((Unit!8317 0))(
  ( (Unit!8318) )
))
(declare-fun e!173747 () Unit!8317)

(declare-fun Unit!8319 () Unit!8317)

(assert (=> b!269189 (= e!173747 Unit!8319)))

(declare-fun b!269190 () Bool)

(declare-fun res!133439 () Bool)

(declare-fun e!173744 () Bool)

(assert (=> b!269190 (=> (not res!133439) (not e!173744))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269190 (= res!133439 (= startIndex!26 i!1267))))

(declare-fun b!269191 () Bool)

(assert (=> b!269191 (= e!173744 false)))

(declare-fun lt!135123 () Unit!8317)

(assert (=> b!269191 (= lt!135123 e!173747)))

(declare-fun c!45426 () Bool)

(declare-datatypes ((array!13193 0))(
  ( (array!13194 (arr!6246 (Array (_ BitVec 32) (_ BitVec 64))) (size!6598 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13193)

(assert (=> b!269191 (= c!45426 (bvslt startIndex!26 (bvsub (size!6598 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269193 () Bool)

(declare-fun e!173746 () Bool)

(assert (=> b!269193 (= e!173746 e!173744)))

(declare-fun res!133440 () Bool)

(assert (=> b!269193 (=> (not res!133440) (not e!173744))))

(declare-datatypes ((SeekEntryResult!1404 0))(
  ( (MissingZero!1404 (index!7786 (_ BitVec 32))) (Found!1404 (index!7787 (_ BitVec 32))) (Intermediate!1404 (undefined!2216 Bool) (index!7788 (_ BitVec 32)) (x!26137 (_ BitVec 32))) (Undefined!1404) (MissingVacant!1404 (index!7789 (_ BitVec 32))) )
))
(declare-fun lt!135124 () SeekEntryResult!1404)

(assert (=> b!269193 (= res!133440 (or (= lt!135124 (MissingZero!1404 i!1267)) (= lt!135124 (MissingVacant!1404 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13193 (_ BitVec 32)) SeekEntryResult!1404)

(assert (=> b!269193 (= lt!135124 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269194 () Bool)

(declare-fun res!133441 () Bool)

(assert (=> b!269194 (=> (not res!133441) (not e!173746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269194 (= res!133441 (validKeyInArray!0 k0!2581))))

(declare-fun b!269195 () Bool)

(declare-fun lt!135122 () Unit!8317)

(assert (=> b!269195 (= e!173747 lt!135122)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8317)

(assert (=> b!269195 (= lt!135122 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13193 (_ BitVec 32)) Bool)

(assert (=> b!269195 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13194 (store (arr!6246 a!3325) i!1267 k0!2581) (size!6598 a!3325)) mask!3868)))

(declare-fun b!269196 () Bool)

(declare-fun res!133444 () Bool)

(assert (=> b!269196 (=> (not res!133444) (not e!173746))))

(declare-fun arrayContainsKey!0 (array!13193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269196 (= res!133444 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269197 () Bool)

(declare-fun res!133446 () Bool)

(assert (=> b!269197 (=> (not res!133446) (not e!173746))))

(declare-datatypes ((List!4054 0))(
  ( (Nil!4051) (Cons!4050 (h!4717 (_ BitVec 64)) (t!9136 List!4054)) )
))
(declare-fun arrayNoDuplicates!0 (array!13193 (_ BitVec 32) List!4054) Bool)

(assert (=> b!269197 (= res!133446 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4051))))

(declare-fun b!269198 () Bool)

(declare-fun res!133443 () Bool)

(assert (=> b!269198 (=> (not res!133443) (not e!173746))))

(assert (=> b!269198 (= res!133443 (and (= (size!6598 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6598 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6598 a!3325))))))

(declare-fun res!133445 () Bool)

(assert (=> start!26096 (=> (not res!133445) (not e!173746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26096 (= res!133445 (validMask!0 mask!3868))))

(assert (=> start!26096 e!173746))

(declare-fun array_inv!4209 (array!13193) Bool)

(assert (=> start!26096 (array_inv!4209 a!3325)))

(assert (=> start!26096 true))

(declare-fun b!269192 () Bool)

(declare-fun res!133442 () Bool)

(assert (=> b!269192 (=> (not res!133442) (not e!173744))))

(assert (=> b!269192 (= res!133442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26096 res!133445) b!269198))

(assert (= (and b!269198 res!133443) b!269194))

(assert (= (and b!269194 res!133441) b!269197))

(assert (= (and b!269197 res!133446) b!269196))

(assert (= (and b!269196 res!133444) b!269193))

(assert (= (and b!269193 res!133440) b!269192))

(assert (= (and b!269192 res!133442) b!269190))

(assert (= (and b!269190 res!133439) b!269191))

(assert (= (and b!269191 c!45426) b!269195))

(assert (= (and b!269191 (not c!45426)) b!269189))

(declare-fun m!285131 () Bool)

(assert (=> b!269192 m!285131))

(declare-fun m!285133 () Bool)

(assert (=> start!26096 m!285133))

(declare-fun m!285135 () Bool)

(assert (=> start!26096 m!285135))

(declare-fun m!285137 () Bool)

(assert (=> b!269197 m!285137))

(declare-fun m!285139 () Bool)

(assert (=> b!269193 m!285139))

(declare-fun m!285141 () Bool)

(assert (=> b!269196 m!285141))

(declare-fun m!285143 () Bool)

(assert (=> b!269195 m!285143))

(declare-fun m!285145 () Bool)

(assert (=> b!269195 m!285145))

(declare-fun m!285147 () Bool)

(assert (=> b!269195 m!285147))

(declare-fun m!285149 () Bool)

(assert (=> b!269194 m!285149))

(check-sat (not b!269195) (not b!269192) (not b!269193) (not start!26096) (not b!269196) (not b!269194) (not b!269197))
(check-sat)
