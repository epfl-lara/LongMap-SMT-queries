; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26160 () Bool)

(assert start!26160)

(declare-fun b!270196 () Bool)

(declare-datatypes ((Unit!8393 0))(
  ( (Unit!8394) )
))
(declare-fun e!174193 () Unit!8393)

(declare-fun Unit!8395 () Unit!8393)

(assert (=> b!270196 (= e!174193 Unit!8395)))

(declare-fun b!270197 () Bool)

(declare-fun e!174194 () Bool)

(declare-fun e!174192 () Bool)

(assert (=> b!270197 (= e!174194 e!174192)))

(declare-fun res!134235 () Bool)

(assert (=> b!270197 (=> (not res!134235) (not e!174192))))

(declare-datatypes ((SeekEntryResult!1400 0))(
  ( (MissingZero!1400 (index!7770 (_ BitVec 32))) (Found!1400 (index!7771 (_ BitVec 32))) (Intermediate!1400 (undefined!2212 Bool) (index!7772 (_ BitVec 32)) (x!26221 (_ BitVec 32))) (Undefined!1400) (MissingVacant!1400 (index!7773 (_ BitVec 32))) )
))
(declare-fun lt!135546 () SeekEntryResult!1400)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270197 (= res!134235 (or (= lt!135546 (MissingZero!1400 i!1267)) (= lt!135546 (MissingVacant!1400 i!1267))))))

(declare-datatypes ((array!13256 0))(
  ( (array!13257 (arr!6277 (Array (_ BitVec 32) (_ BitVec 64))) (size!6629 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13256)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13256 (_ BitVec 32)) SeekEntryResult!1400)

(assert (=> b!270197 (= lt!135546 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270198 () Bool)

(declare-fun lt!135545 () Unit!8393)

(assert (=> b!270198 (= e!174193 lt!135545)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13256 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8393)

(assert (=> b!270198 (= lt!135545 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135549 () array!13256)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13256 (_ BitVec 32)) Bool)

(assert (=> b!270198 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135549 mask!3868)))

(declare-fun b!270199 () Bool)

(declare-fun res!134232 () Bool)

(assert (=> b!270199 (=> (not res!134232) (not e!174194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270199 (= res!134232 (validKeyInArray!0 k0!2581))))

(declare-fun b!270200 () Bool)

(declare-fun res!134228 () Bool)

(assert (=> b!270200 (=> (not res!134228) (not e!174194))))

(declare-datatypes ((List!3998 0))(
  ( (Nil!3995) (Cons!3994 (h!4661 (_ BitVec 64)) (t!9072 List!3998)) )
))
(declare-fun arrayNoDuplicates!0 (array!13256 (_ BitVec 32) List!3998) Bool)

(assert (=> b!270200 (= res!134228 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3995))))

(declare-fun b!270201 () Bool)

(declare-fun res!134229 () Bool)

(assert (=> b!270201 (=> (not res!134229) (not e!174192))))

(assert (=> b!270201 (= res!134229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!134234 () Bool)

(assert (=> start!26160 (=> (not res!134234) (not e!174194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26160 (= res!134234 (validMask!0 mask!3868))))

(assert (=> start!26160 e!174194))

(declare-fun array_inv!4227 (array!13256) Bool)

(assert (=> start!26160 (array_inv!4227 a!3325)))

(assert (=> start!26160 true))

(declare-fun b!270202 () Bool)

(declare-fun res!134233 () Bool)

(assert (=> b!270202 (=> (not res!134233) (not e!174194))))

(declare-fun arrayContainsKey!0 (array!13256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270202 (= res!134233 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270203 () Bool)

(declare-fun res!134231 () Bool)

(assert (=> b!270203 (=> (not res!134231) (not e!174194))))

(assert (=> b!270203 (= res!134231 (and (= (size!6629 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6629 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6629 a!3325))))))

(declare-fun b!270204 () Bool)

(declare-fun e!174191 () Bool)

(assert (=> b!270204 (= e!174192 e!174191)))

(declare-fun res!134230 () Bool)

(assert (=> b!270204 (=> (not res!134230) (not e!174191))))

(assert (=> b!270204 (= res!134230 (= startIndex!26 i!1267))))

(assert (=> b!270204 (= lt!135549 (array!13257 (store (arr!6277 a!3325) i!1267 k0!2581) (size!6629 a!3325)))))

(declare-fun b!270205 () Bool)

(assert (=> b!270205 (= e!174191 (not true))))

(assert (=> b!270205 (= (seekEntryOrOpen!0 k0!2581 lt!135549 mask!3868) (Found!1400 i!1267))))

(declare-fun lt!135547 () Unit!8393)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13256 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8393)

(assert (=> b!270205 (= lt!135547 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135548 () Unit!8393)

(assert (=> b!270205 (= lt!135548 e!174193)))

(declare-fun c!45535 () Bool)

(assert (=> b!270205 (= c!45535 (bvslt startIndex!26 (bvsub (size!6629 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26160 res!134234) b!270203))

(assert (= (and b!270203 res!134231) b!270199))

(assert (= (and b!270199 res!134232) b!270200))

(assert (= (and b!270200 res!134228) b!270202))

(assert (= (and b!270202 res!134233) b!270197))

(assert (= (and b!270197 res!134235) b!270201))

(assert (= (and b!270201 res!134229) b!270204))

(assert (= (and b!270204 res!134230) b!270205))

(assert (= (and b!270205 c!45535) b!270198))

(assert (= (and b!270205 (not c!45535)) b!270196))

(declare-fun m!286025 () Bool)

(assert (=> b!270197 m!286025))

(declare-fun m!286027 () Bool)

(assert (=> b!270202 m!286027))

(declare-fun m!286029 () Bool)

(assert (=> b!270199 m!286029))

(declare-fun m!286031 () Bool)

(assert (=> b!270201 m!286031))

(declare-fun m!286033 () Bool)

(assert (=> b!270198 m!286033))

(declare-fun m!286035 () Bool)

(assert (=> b!270198 m!286035))

(declare-fun m!286037 () Bool)

(assert (=> b!270205 m!286037))

(declare-fun m!286039 () Bool)

(assert (=> b!270205 m!286039))

(declare-fun m!286041 () Bool)

(assert (=> start!26160 m!286041))

(declare-fun m!286043 () Bool)

(assert (=> start!26160 m!286043))

(declare-fun m!286045 () Bool)

(assert (=> b!270200 m!286045))

(declare-fun m!286047 () Bool)

(assert (=> b!270204 m!286047))

(check-sat (not b!270205) (not b!270202) (not b!270199) (not start!26160) (not b!270200) (not b!270197) (not b!270201) (not b!270198))
(check-sat)
